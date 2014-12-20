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
-3.604264, 1.222674, -0.8267115, 1, 0, 0, 1,
-3.14598, 0.03270902, -1.618484, 1, 0.007843138, 0, 1,
-3.068026, 0.4728235, -2.719112, 1, 0.01176471, 0, 1,
-2.782557, -0.2415747, -1.319261, 1, 0.01960784, 0, 1,
-2.683771, -0.08182013, -2.411375, 1, 0.02352941, 0, 1,
-2.494089, -0.07384679, -1.673144, 1, 0.03137255, 0, 1,
-2.437628, 0.742784, -1.19719, 1, 0.03529412, 0, 1,
-2.363962, -1.796083, -1.308401, 1, 0.04313726, 0, 1,
-2.360914, 0.6386173, -1.383321, 1, 0.04705882, 0, 1,
-2.216785, 0.4472388, -1.796034, 1, 0.05490196, 0, 1,
-2.216355, 1.651909, -2.099164, 1, 0.05882353, 0, 1,
-2.21477, 0.7825973, -2.513954, 1, 0.06666667, 0, 1,
-2.201102, -1.048888, -3.892062, 1, 0.07058824, 0, 1,
-2.193664, -0.2023006, -1.290281, 1, 0.07843138, 0, 1,
-2.148235, 0.2929408, -1.485566, 1, 0.08235294, 0, 1,
-2.145072, -0.668209, -0.9877261, 1, 0.09019608, 0, 1,
-2.14012, -1.477166, -2.593017, 1, 0.09411765, 0, 1,
-2.117556, -0.7612225, -2.339581, 1, 0.1019608, 0, 1,
-2.111071, -0.08477564, -2.771461, 1, 0.1098039, 0, 1,
-2.060727, 0.2308615, -1.385675, 1, 0.1137255, 0, 1,
-2.02516, 0.1223035, -1.188487, 1, 0.1215686, 0, 1,
-2.017545, -0.2591919, -1.750039, 1, 0.1254902, 0, 1,
-2.001045, 0.01217688, -0.6109263, 1, 0.1333333, 0, 1,
-1.990577, 0.2975708, -1.221172, 1, 0.1372549, 0, 1,
-1.98119, -1.034613, -1.144003, 1, 0.145098, 0, 1,
-1.956924, 1.163242, -1.446931, 1, 0.1490196, 0, 1,
-1.950054, -0.7194377, -1.504423, 1, 0.1568628, 0, 1,
-1.948176, -1.324757, -2.378611, 1, 0.1607843, 0, 1,
-1.918199, -0.7504162, -0.6413702, 1, 0.1686275, 0, 1,
-1.916905, 0.4381093, -2.189642, 1, 0.172549, 0, 1,
-1.915777, -0.04276989, 0.2311678, 1, 0.1803922, 0, 1,
-1.902796, 0.5680204, -0.1101177, 1, 0.1843137, 0, 1,
-1.901353, -0.5536867, -2.079587, 1, 0.1921569, 0, 1,
-1.841791, 0.5672423, -1.410135, 1, 0.1960784, 0, 1,
-1.831784, 1.094488, -1.281873, 1, 0.2039216, 0, 1,
-1.830362, 0.4998809, -3.473907, 1, 0.2117647, 0, 1,
-1.824504, -0.06667636, -2.157536, 1, 0.2156863, 0, 1,
-1.809094, 0.5259844, -2.692127, 1, 0.2235294, 0, 1,
-1.794042, -1.683122, -3.402032, 1, 0.227451, 0, 1,
-1.792611, -0.8392188, 0.1744231, 1, 0.2352941, 0, 1,
-1.755143, -1.102255, -2.22279, 1, 0.2392157, 0, 1,
-1.749925, 0.9629433, -0.8702437, 1, 0.2470588, 0, 1,
-1.745663, 1.13186, -0.9967545, 1, 0.2509804, 0, 1,
-1.743352, -2.903699, -2.085891, 1, 0.2588235, 0, 1,
-1.737748, -0.7433484, -2.00104, 1, 0.2627451, 0, 1,
-1.723324, -0.5539911, -2.666208, 1, 0.2705882, 0, 1,
-1.718462, -0.2665182, -1.383104, 1, 0.2745098, 0, 1,
-1.673987, -0.3033892, -1.162154, 1, 0.282353, 0, 1,
-1.671914, -0.5857909, -0.4065801, 1, 0.2862745, 0, 1,
-1.66817, 0.06666702, -1.545217, 1, 0.2941177, 0, 1,
-1.65746, -0.1719798, -1.448932, 1, 0.3019608, 0, 1,
-1.656879, 1.828779, 0.4286776, 1, 0.3058824, 0, 1,
-1.655869, -0.1274038, 0.5499506, 1, 0.3137255, 0, 1,
-1.653531, -0.4059509, -1.164811, 1, 0.3176471, 0, 1,
-1.65138, -1.315542, -1.583633, 1, 0.3254902, 0, 1,
-1.648725, 0.467989, 0.06124153, 1, 0.3294118, 0, 1,
-1.64801, 0.9880176, -0.7572186, 1, 0.3372549, 0, 1,
-1.642409, -2.523407, -1.890222, 1, 0.3411765, 0, 1,
-1.629388, -0.1894999, -1.51261, 1, 0.3490196, 0, 1,
-1.628774, 0.2937466, -2.81103, 1, 0.3529412, 0, 1,
-1.626303, -0.584172, -1.24058, 1, 0.3607843, 0, 1,
-1.619089, 0.4380954, -0.72637, 1, 0.3647059, 0, 1,
-1.609863, -0.4181706, -2.380233, 1, 0.372549, 0, 1,
-1.601982, 2.076622, 0.6180893, 1, 0.3764706, 0, 1,
-1.596449, -1.026544, -3.715098, 1, 0.3843137, 0, 1,
-1.592938, 1.129432, -0.8008703, 1, 0.3882353, 0, 1,
-1.565764, 0.321449, -0.7090105, 1, 0.3960784, 0, 1,
-1.555003, -1.374695, -2.321553, 1, 0.4039216, 0, 1,
-1.547389, 0.7870675, -0.4690663, 1, 0.4078431, 0, 1,
-1.54718, 0.3486806, -3.282888, 1, 0.4156863, 0, 1,
-1.543432, -1.17478, -1.062715, 1, 0.4196078, 0, 1,
-1.537423, 0.7126675, -0.3716761, 1, 0.427451, 0, 1,
-1.53013, -1.122738, -1.883397, 1, 0.4313726, 0, 1,
-1.529811, 0.5519147, -1.015735, 1, 0.4392157, 0, 1,
-1.516428, 0.2872266, -1.77102, 1, 0.4431373, 0, 1,
-1.495802, -0.5641046, -1.988134, 1, 0.4509804, 0, 1,
-1.487256, 2.039934, -0.5514646, 1, 0.454902, 0, 1,
-1.483711, -0.06261594, -0.5057495, 1, 0.4627451, 0, 1,
-1.482777, 1.688498, -0.3754126, 1, 0.4666667, 0, 1,
-1.470431, 1.117487, -0.1412759, 1, 0.4745098, 0, 1,
-1.456511, -0.5921094, -1.054721, 1, 0.4784314, 0, 1,
-1.421089, 0.9727533, -2.137682, 1, 0.4862745, 0, 1,
-1.403882, 0.6559368, -0.09258323, 1, 0.4901961, 0, 1,
-1.40202, 1.123395, -1.699902, 1, 0.4980392, 0, 1,
-1.384759, 0.7472429, -1.110761, 1, 0.5058824, 0, 1,
-1.361988, -0.08966558, -2.01266, 1, 0.509804, 0, 1,
-1.36097, -0.6200103, -2.70425, 1, 0.5176471, 0, 1,
-1.359261, -0.4369549, -1.319126, 1, 0.5215687, 0, 1,
-1.354538, 0.7438831, -1.895449, 1, 0.5294118, 0, 1,
-1.351092, 1.25032, -1.121452, 1, 0.5333334, 0, 1,
-1.331218, -0.1941121, -0.01480274, 1, 0.5411765, 0, 1,
-1.321949, 1.655826, -0.2895703, 1, 0.5450981, 0, 1,
-1.304216, 0.4121315, -1.778543, 1, 0.5529412, 0, 1,
-1.301769, -0.5749315, -2.350878, 1, 0.5568628, 0, 1,
-1.295743, -0.6193135, -2.200941, 1, 0.5647059, 0, 1,
-1.279458, -1.529383, -2.690436, 1, 0.5686275, 0, 1,
-1.276003, -0.9592999, -2.211037, 1, 0.5764706, 0, 1,
-1.268245, 0.1259143, -3.366204, 1, 0.5803922, 0, 1,
-1.248675, 0.006092575, -1.920479, 1, 0.5882353, 0, 1,
-1.247549, -0.7549027, -4.368028, 1, 0.5921569, 0, 1,
-1.240963, -0.4371486, -2.123475, 1, 0.6, 0, 1,
-1.239365, 0.8545054, -1.516418, 1, 0.6078432, 0, 1,
-1.232687, -0.08143388, -1.057141, 1, 0.6117647, 0, 1,
-1.229642, 0.2719338, -1.030711, 1, 0.6196079, 0, 1,
-1.227891, 1.298041, -2.021523, 1, 0.6235294, 0, 1,
-1.227205, 0.1900621, -0.4887738, 1, 0.6313726, 0, 1,
-1.223646, 0.2179621, -2.184898, 1, 0.6352941, 0, 1,
-1.221886, 0.04624442, -1.844011, 1, 0.6431373, 0, 1,
-1.214108, -1.165109, -3.133013, 1, 0.6470588, 0, 1,
-1.21201, -0.1846914, -1.105179, 1, 0.654902, 0, 1,
-1.211496, 0.6316788, -1.069131, 1, 0.6588235, 0, 1,
-1.210383, 2.052449, -1.072708, 1, 0.6666667, 0, 1,
-1.199076, -0.8977489, -2.978877, 1, 0.6705883, 0, 1,
-1.194027, -2.142392, -3.765794, 1, 0.6784314, 0, 1,
-1.188226, -0.8705796, -2.171638, 1, 0.682353, 0, 1,
-1.186276, 1.496685, -1.628984, 1, 0.6901961, 0, 1,
-1.182807, -0.6678761, -1.638481, 1, 0.6941177, 0, 1,
-1.178813, -0.8455076, -1.860142, 1, 0.7019608, 0, 1,
-1.177885, -1.654874, -3.418788, 1, 0.7098039, 0, 1,
-1.176031, -1.296642, -3.393292, 1, 0.7137255, 0, 1,
-1.167074, 0.5170362, -1.704361, 1, 0.7215686, 0, 1,
-1.166797, 0.9134848, -1.253642, 1, 0.7254902, 0, 1,
-1.166347, 0.1354337, -1.357009, 1, 0.7333333, 0, 1,
-1.165585, -0.08461571, -2.07894, 1, 0.7372549, 0, 1,
-1.164285, 1.450442, -1.200114, 1, 0.7450981, 0, 1,
-1.161576, -0.3094972, -1.329409, 1, 0.7490196, 0, 1,
-1.160986, -0.2783272, -2.434313, 1, 0.7568628, 0, 1,
-1.154155, 0.8419418, -2.249161, 1, 0.7607843, 0, 1,
-1.152853, 0.8776318, 0.5031877, 1, 0.7686275, 0, 1,
-1.148183, -1.309609, -0.9193366, 1, 0.772549, 0, 1,
-1.133857, 0.3743576, -1.610499, 1, 0.7803922, 0, 1,
-1.133306, 1.591735, -1.862242, 1, 0.7843137, 0, 1,
-1.126274, -0.3581573, 0.1565399, 1, 0.7921569, 0, 1,
-1.108114, 0.2886867, -1.73049, 1, 0.7960784, 0, 1,
-1.105293, 0.3871292, -1.88464, 1, 0.8039216, 0, 1,
-1.097636, -0.06481776, -1.946115, 1, 0.8117647, 0, 1,
-1.097219, -0.237687, -1.199981, 1, 0.8156863, 0, 1,
-1.094489, -0.7188407, -1.604591, 1, 0.8235294, 0, 1,
-1.08204, -0.5188587, 0.02319552, 1, 0.827451, 0, 1,
-1.078595, -2.372031, -2.783318, 1, 0.8352941, 0, 1,
-1.076944, 1.142235, -0.9514399, 1, 0.8392157, 0, 1,
-1.068817, -0.7689227, -2.188751, 1, 0.8470588, 0, 1,
-1.066669, -0.4774137, -1.400584, 1, 0.8509804, 0, 1,
-1.059739, -0.05473661, -1.780024, 1, 0.8588235, 0, 1,
-1.048612, 0.5662591, -3.11345, 1, 0.8627451, 0, 1,
-1.046146, 0.2749439, -0.9824334, 1, 0.8705882, 0, 1,
-1.045569, 0.6242616, -1.172086, 1, 0.8745098, 0, 1,
-1.044103, 0.4930781, -1.943488, 1, 0.8823529, 0, 1,
-1.021392, 0.1494081, -2.616534, 1, 0.8862745, 0, 1,
-1.006926, -0.4348839, -2.94361, 1, 0.8941177, 0, 1,
-1.003175, -1.075836, -3.338993, 1, 0.8980392, 0, 1,
-1.003142, 0.8668277, -1.550369, 1, 0.9058824, 0, 1,
-1.002684, 1.404518, -0.7316592, 1, 0.9137255, 0, 1,
-1.002395, -0.1984656, -1.739542, 1, 0.9176471, 0, 1,
-1.000006, 0.05406953, -1.235419, 1, 0.9254902, 0, 1,
-0.9951638, -1.04523, -1.952185, 1, 0.9294118, 0, 1,
-0.9885785, -0.5171988, -2.26475, 1, 0.9372549, 0, 1,
-0.9868692, -0.06252132, -2.322188, 1, 0.9411765, 0, 1,
-0.9641154, -0.03793769, -2.291733, 1, 0.9490196, 0, 1,
-0.9560276, -0.2527635, -0.2617292, 1, 0.9529412, 0, 1,
-0.951149, 0.4230276, 0.7770012, 1, 0.9607843, 0, 1,
-0.9492235, 1.871119, -1.758968, 1, 0.9647059, 0, 1,
-0.9467956, 0.2768323, 0.7061436, 1, 0.972549, 0, 1,
-0.9424335, 0.0005697156, -0.5102049, 1, 0.9764706, 0, 1,
-0.9407322, -1.001804, -1.407858, 1, 0.9843137, 0, 1,
-0.940105, 1.332703, -1.691808, 1, 0.9882353, 0, 1,
-0.936082, 0.05210315, -2.758649, 1, 0.9960784, 0, 1,
-0.9244887, 0.01065412, -1.916663, 0.9960784, 1, 0, 1,
-0.9240743, 0.631218, 0.6649996, 0.9921569, 1, 0, 1,
-0.9088405, -0.4287, -2.171736, 0.9843137, 1, 0, 1,
-0.9045836, -0.9690918, -2.646896, 0.9803922, 1, 0, 1,
-0.9035741, 0.669315, -1.866836, 0.972549, 1, 0, 1,
-0.9029174, -1.641431, -1.077834, 0.9686275, 1, 0, 1,
-0.8979608, 0.4813393, -2.239429, 0.9607843, 1, 0, 1,
-0.8978639, -1.302136, -1.761104, 0.9568627, 1, 0, 1,
-0.8902398, 0.2007264, 0.2159508, 0.9490196, 1, 0, 1,
-0.8900465, -0.4857679, -4.270896, 0.945098, 1, 0, 1,
-0.8899751, -1.287592, -2.683051, 0.9372549, 1, 0, 1,
-0.8890654, -1.401915, -1.016615, 0.9333333, 1, 0, 1,
-0.888812, 1.760533, 0.1298021, 0.9254902, 1, 0, 1,
-0.8881453, 0.5634264, -2.298093, 0.9215686, 1, 0, 1,
-0.8877402, -1.070145, -2.516058, 0.9137255, 1, 0, 1,
-0.8875895, 1.47698, 0.6422587, 0.9098039, 1, 0, 1,
-0.8863928, 0.397887, -2.708356, 0.9019608, 1, 0, 1,
-0.8833027, 0.315688, 0.05662206, 0.8941177, 1, 0, 1,
-0.8822229, -0.2565396, -2.571717, 0.8901961, 1, 0, 1,
-0.8771381, 0.06684409, -1.892747, 0.8823529, 1, 0, 1,
-0.875127, 0.3027039, -1.06858, 0.8784314, 1, 0, 1,
-0.8706729, 0.8085414, -0.2957318, 0.8705882, 1, 0, 1,
-0.8686129, 1.455023, -0.09685866, 0.8666667, 1, 0, 1,
-0.8642976, 0.4033546, -0.8700829, 0.8588235, 1, 0, 1,
-0.8587534, -0.9363056, -3.903963, 0.854902, 1, 0, 1,
-0.857671, -0.94441, -2.336801, 0.8470588, 1, 0, 1,
-0.8541183, -0.2268436, -1.221062, 0.8431373, 1, 0, 1,
-0.8516672, -0.659735, -0.7865294, 0.8352941, 1, 0, 1,
-0.8485711, -0.0763672, -1.888718, 0.8313726, 1, 0, 1,
-0.8377787, 0.5081431, 1.125142, 0.8235294, 1, 0, 1,
-0.836633, -0.3404963, -1.201479, 0.8196079, 1, 0, 1,
-0.8359759, -0.9076493, -2.881114, 0.8117647, 1, 0, 1,
-0.8301491, 0.6362872, -0.8982472, 0.8078431, 1, 0, 1,
-0.8277628, 1.930869, -0.181766, 0.8, 1, 0, 1,
-0.8259717, 0.9096765, 0.9524271, 0.7921569, 1, 0, 1,
-0.8256898, -0.2627087, -2.215339, 0.7882353, 1, 0, 1,
-0.8254951, 1.035526, -0.3325472, 0.7803922, 1, 0, 1,
-0.8247328, 1.037809, -0.4767238, 0.7764706, 1, 0, 1,
-0.8224988, -0.5075832, -0.8971756, 0.7686275, 1, 0, 1,
-0.8198418, -0.4909379, -0.7267611, 0.7647059, 1, 0, 1,
-0.8160235, 0.06640104, -2.818757, 0.7568628, 1, 0, 1,
-0.814752, -2.221749, -3.026342, 0.7529412, 1, 0, 1,
-0.8134218, -0.8437608, -2.635954, 0.7450981, 1, 0, 1,
-0.813356, 1.679437, -0.6605317, 0.7411765, 1, 0, 1,
-0.8089726, -1.050564, -1.620267, 0.7333333, 1, 0, 1,
-0.7994763, -0.7912806, -2.899727, 0.7294118, 1, 0, 1,
-0.7985419, -0.1014646, -3.944293, 0.7215686, 1, 0, 1,
-0.7966979, -0.2802623, -1.333985, 0.7176471, 1, 0, 1,
-0.7948099, 0.9661399, -0.284387, 0.7098039, 1, 0, 1,
-0.7924525, 0.5707451, -2.861017, 0.7058824, 1, 0, 1,
-0.7914483, 0.7654648, -1.446044, 0.6980392, 1, 0, 1,
-0.7900125, 0.892335, -1.34129, 0.6901961, 1, 0, 1,
-0.7860026, 0.4789159, -1.335579, 0.6862745, 1, 0, 1,
-0.7817182, 2.069216, 0.2847819, 0.6784314, 1, 0, 1,
-0.7813685, 0.3896534, -2.344769, 0.6745098, 1, 0, 1,
-0.7808913, 0.6034296, -1.893344, 0.6666667, 1, 0, 1,
-0.7797719, -0.617366, -2.662961, 0.6627451, 1, 0, 1,
-0.7693013, -0.4845648, -5.82122, 0.654902, 1, 0, 1,
-0.7678378, -0.8770534, -3.363167, 0.6509804, 1, 0, 1,
-0.7665054, -0.4166611, -0.5772274, 0.6431373, 1, 0, 1,
-0.7657805, -0.2456096, -3.847798, 0.6392157, 1, 0, 1,
-0.7613539, -0.7054954, -0.9439825, 0.6313726, 1, 0, 1,
-0.7591615, 1.720307, 1.574296, 0.627451, 1, 0, 1,
-0.7587063, 0.1325346, -1.666626, 0.6196079, 1, 0, 1,
-0.7579961, -0.7073203, -3.676632, 0.6156863, 1, 0, 1,
-0.7552764, -0.6722757, -2.703467, 0.6078432, 1, 0, 1,
-0.7519423, -1.081425, -1.701829, 0.6039216, 1, 0, 1,
-0.7510589, -1.485118, -3.082441, 0.5960785, 1, 0, 1,
-0.7508189, -0.7553706, -2.380266, 0.5882353, 1, 0, 1,
-0.7487745, 0.573709, 0.5752069, 0.5843138, 1, 0, 1,
-0.7467278, 0.1331204, -1.128782, 0.5764706, 1, 0, 1,
-0.7454987, 1.073417, -1.489868, 0.572549, 1, 0, 1,
-0.7395203, -0.0403617, -1.77873, 0.5647059, 1, 0, 1,
-0.7306901, -0.4464098, -1.348727, 0.5607843, 1, 0, 1,
-0.7247531, 2.447896, -1.725621, 0.5529412, 1, 0, 1,
-0.7232004, 1.136515, -0.2498879, 0.5490196, 1, 0, 1,
-0.7230169, 0.9161946, -0.6905429, 0.5411765, 1, 0, 1,
-0.7200095, -0.6761689, -2.246024, 0.5372549, 1, 0, 1,
-0.7122695, -0.280615, -1.236286, 0.5294118, 1, 0, 1,
-0.7103024, 0.903106, 0.4868947, 0.5254902, 1, 0, 1,
-0.7102458, 0.9451081, 0.6092485, 0.5176471, 1, 0, 1,
-0.707665, -0.05778226, -2.889916, 0.5137255, 1, 0, 1,
-0.7070729, 0.125041, -0.7464183, 0.5058824, 1, 0, 1,
-0.7020889, 2.343218, -2.025681, 0.5019608, 1, 0, 1,
-0.7017447, 0.9993029, -2.678868, 0.4941176, 1, 0, 1,
-0.6980531, 0.1454707, -2.090843, 0.4862745, 1, 0, 1,
-0.6903478, -1.805642, -2.350083, 0.4823529, 1, 0, 1,
-0.6881208, 0.2180303, -2.653922, 0.4745098, 1, 0, 1,
-0.6859748, 0.9617145, -0.5608087, 0.4705882, 1, 0, 1,
-0.6842749, -0.9409144, -2.686281, 0.4627451, 1, 0, 1,
-0.6842239, -0.4722916, -2.188732, 0.4588235, 1, 0, 1,
-0.678638, -0.08340012, -3.719935, 0.4509804, 1, 0, 1,
-0.6700132, 0.02724154, -0.1098419, 0.4470588, 1, 0, 1,
-0.6690891, -1.154526, -0.1388829, 0.4392157, 1, 0, 1,
-0.6631765, 0.2051536, -0.381082, 0.4352941, 1, 0, 1,
-0.6601826, -0.891892, -1.644595, 0.427451, 1, 0, 1,
-0.6493002, -0.2832429, -1.711607, 0.4235294, 1, 0, 1,
-0.6484808, -0.3457197, -1.447828, 0.4156863, 1, 0, 1,
-0.6448665, -0.03424379, -0.940154, 0.4117647, 1, 0, 1,
-0.6420136, -1.124993, -2.027196, 0.4039216, 1, 0, 1,
-0.6366315, 0.3290139, -1.476097, 0.3960784, 1, 0, 1,
-0.6276444, 1.060851, -1.867212, 0.3921569, 1, 0, 1,
-0.624753, 1.346733, -1.139972, 0.3843137, 1, 0, 1,
-0.6170881, -0.2388019, -2.285407, 0.3803922, 1, 0, 1,
-0.6168894, -0.7410268, -1.418582, 0.372549, 1, 0, 1,
-0.6143719, -0.04692892, -2.45516, 0.3686275, 1, 0, 1,
-0.6142423, 0.2497541, -0.5721939, 0.3607843, 1, 0, 1,
-0.5997474, -0.9683326, -3.409584, 0.3568628, 1, 0, 1,
-0.5988119, -0.9375219, -1.073299, 0.3490196, 1, 0, 1,
-0.5977544, -0.4160591, -1.955572, 0.345098, 1, 0, 1,
-0.5975804, -0.6347858, -3.063198, 0.3372549, 1, 0, 1,
-0.5962945, -1.87753, -2.99061, 0.3333333, 1, 0, 1,
-0.5945947, 1.754377, -0.07496031, 0.3254902, 1, 0, 1,
-0.5945584, -1.077136, -2.306263, 0.3215686, 1, 0, 1,
-0.5933331, 0.9586265, -0.1739891, 0.3137255, 1, 0, 1,
-0.5904241, -2.474224, -2.759293, 0.3098039, 1, 0, 1,
-0.5870533, -0.2501461, -1.423795, 0.3019608, 1, 0, 1,
-0.5832925, -0.5745561, -0.8289512, 0.2941177, 1, 0, 1,
-0.5829045, -0.2597975, -1.493642, 0.2901961, 1, 0, 1,
-0.5804508, -0.1839764, -2.984024, 0.282353, 1, 0, 1,
-0.5793144, 2.498449, 0.7682456, 0.2784314, 1, 0, 1,
-0.5788038, 0.6921594, -1.443573, 0.2705882, 1, 0, 1,
-0.5774659, -1.497168, -1.915109, 0.2666667, 1, 0, 1,
-0.5764118, 0.01596934, -2.943352, 0.2588235, 1, 0, 1,
-0.5714192, -1.722484, -2.066415, 0.254902, 1, 0, 1,
-0.5713025, -1.220697, -2.546569, 0.2470588, 1, 0, 1,
-0.5699769, 0.02059068, -2.448977, 0.2431373, 1, 0, 1,
-0.5653601, 0.8834301, -0.9248289, 0.2352941, 1, 0, 1,
-0.5615474, 1.025953, 2.077501, 0.2313726, 1, 0, 1,
-0.5576473, 0.3494377, -0.6388808, 0.2235294, 1, 0, 1,
-0.5569475, 0.169494, -1.550591, 0.2196078, 1, 0, 1,
-0.5549015, -1.334652, -2.066028, 0.2117647, 1, 0, 1,
-0.5526999, 1.234186, 1.422238, 0.2078431, 1, 0, 1,
-0.5492111, 0.190349, -1.803938, 0.2, 1, 0, 1,
-0.5484211, -0.2706963, -1.908819, 0.1921569, 1, 0, 1,
-0.5477037, 0.02256316, -0.5482019, 0.1882353, 1, 0, 1,
-0.5438774, -1.000998, -2.562804, 0.1803922, 1, 0, 1,
-0.5408141, -0.09793393, -2.353295, 0.1764706, 1, 0, 1,
-0.5348015, -0.1517201, -1.970204, 0.1686275, 1, 0, 1,
-0.5323288, 1.945096, 0.6746034, 0.1647059, 1, 0, 1,
-0.5287058, 0.594855, -1.754259, 0.1568628, 1, 0, 1,
-0.5269516, -1.180992, -2.375175, 0.1529412, 1, 0, 1,
-0.5241933, 0.8011159, -0.0582168, 0.145098, 1, 0, 1,
-0.5167548, -1.138699, -3.15958, 0.1411765, 1, 0, 1,
-0.5157039, -0.5622799, -1.505824, 0.1333333, 1, 0, 1,
-0.5080339, 1.883951, -0.1693127, 0.1294118, 1, 0, 1,
-0.5031482, 0.9272131, -1.182685, 0.1215686, 1, 0, 1,
-0.5008703, -0.4595508, -2.283654, 0.1176471, 1, 0, 1,
-0.5002992, 0.03958988, -1.681883, 0.1098039, 1, 0, 1,
-0.4972909, 0.3553204, -1.183363, 0.1058824, 1, 0, 1,
-0.4903044, -0.2496724, -1.633976, 0.09803922, 1, 0, 1,
-0.4862243, -0.4026179, -1.720614, 0.09019608, 1, 0, 1,
-0.4820118, -0.3551491, -2.801529, 0.08627451, 1, 0, 1,
-0.4796473, 0.5481924, -0.1487089, 0.07843138, 1, 0, 1,
-0.4790734, 0.473046, -0.6720043, 0.07450981, 1, 0, 1,
-0.4788657, 0.153599, -1.100726, 0.06666667, 1, 0, 1,
-0.4779988, -1.755542, -1.050594, 0.0627451, 1, 0, 1,
-0.4688775, 0.8953185, 1.570059, 0.05490196, 1, 0, 1,
-0.4659168, 0.3803158, -1.72082, 0.05098039, 1, 0, 1,
-0.4648992, -0.734021, -3.040268, 0.04313726, 1, 0, 1,
-0.4648629, 0.5084971, -1.704459, 0.03921569, 1, 0, 1,
-0.4556096, 0.2009306, -2.852191, 0.03137255, 1, 0, 1,
-0.4506602, -0.04192529, -1.743347, 0.02745098, 1, 0, 1,
-0.4486392, 0.8731283, -2.020149, 0.01960784, 1, 0, 1,
-0.4482212, 0.6056025, -1.114679, 0.01568628, 1, 0, 1,
-0.4468376, -1.039373, -2.332884, 0.007843138, 1, 0, 1,
-0.4388677, -1.599157, -2.915815, 0.003921569, 1, 0, 1,
-0.4375856, 1.098049, -1.786436, 0, 1, 0.003921569, 1,
-0.4357125, -0.07556462, -2.062393, 0, 1, 0.01176471, 1,
-0.432285, -0.2367611, -2.214058, 0, 1, 0.01568628, 1,
-0.4315619, -0.1606385, -1.616392, 0, 1, 0.02352941, 1,
-0.4302565, -0.7929159, -3.097168, 0, 1, 0.02745098, 1,
-0.4213896, -0.4961289, -1.660098, 0, 1, 0.03529412, 1,
-0.4196664, -1.105776, -2.168042, 0, 1, 0.03921569, 1,
-0.4143212, 1.804638, -0.3901528, 0, 1, 0.04705882, 1,
-0.4132813, -0.7612903, -2.797527, 0, 1, 0.05098039, 1,
-0.4123914, -0.3585254, -0.9807285, 0, 1, 0.05882353, 1,
-0.410455, -1.091703, -5.290672, 0, 1, 0.0627451, 1,
-0.4081658, 1.165156, -0.1318685, 0, 1, 0.07058824, 1,
-0.4060337, -0.451237, -1.409685, 0, 1, 0.07450981, 1,
-0.4045275, -0.1568389, -1.737604, 0, 1, 0.08235294, 1,
-0.4037248, -0.8866714, -4.329237, 0, 1, 0.08627451, 1,
-0.4024312, -0.6706641, -2.392674, 0, 1, 0.09411765, 1,
-0.4021148, -0.6651495, -1.702385, 0, 1, 0.1019608, 1,
-0.401314, -1.834872, -2.216172, 0, 1, 0.1058824, 1,
-0.4012784, -1.206684, -2.872866, 0, 1, 0.1137255, 1,
-0.396944, 0.2869042, 0.2677056, 0, 1, 0.1176471, 1,
-0.395793, -0.3192783, -1.396323, 0, 1, 0.1254902, 1,
-0.3951505, 0.05824267, -2.211914, 0, 1, 0.1294118, 1,
-0.3931904, 0.2390413, -0.4424521, 0, 1, 0.1372549, 1,
-0.392708, -0.2576591, -2.235989, 0, 1, 0.1411765, 1,
-0.3913095, 1.680186, -0.7996816, 0, 1, 0.1490196, 1,
-0.386342, -0.8184469, -3.08027, 0, 1, 0.1529412, 1,
-0.3841969, -0.4308901, -2.001886, 0, 1, 0.1607843, 1,
-0.3834997, -0.06549193, -2.032716, 0, 1, 0.1647059, 1,
-0.3775546, 0.3416322, -0.9426249, 0, 1, 0.172549, 1,
-0.3734939, 0.5341935, -2.92981, 0, 1, 0.1764706, 1,
-0.3719158, -0.2172288, -0.7486548, 0, 1, 0.1843137, 1,
-0.3715972, 1.286077, -0.6080965, 0, 1, 0.1882353, 1,
-0.3710934, -0.7305673, -3.91789, 0, 1, 0.1960784, 1,
-0.3694445, 0.2818355, -0.6473122, 0, 1, 0.2039216, 1,
-0.3664995, -1.306753, -3.605315, 0, 1, 0.2078431, 1,
-0.3653516, 0.3455195, -2.351605, 0, 1, 0.2156863, 1,
-0.3590404, 0.3077882, -0.6711066, 0, 1, 0.2196078, 1,
-0.3574389, 1.516499, -2.90143, 0, 1, 0.227451, 1,
-0.3531078, -1.538454, -3.593533, 0, 1, 0.2313726, 1,
-0.3529561, -1.432328, -2.568112, 0, 1, 0.2392157, 1,
-0.3496981, 0.3332378, -0.3557057, 0, 1, 0.2431373, 1,
-0.3486871, 0.09506668, -0.1592183, 0, 1, 0.2509804, 1,
-0.3479789, 0.594772, -1.077954, 0, 1, 0.254902, 1,
-0.3474079, 0.105429, -1.956181, 0, 1, 0.2627451, 1,
-0.3439892, -0.03509678, -0.7721511, 0, 1, 0.2666667, 1,
-0.3433667, 0.2901172, -1.992159, 0, 1, 0.2745098, 1,
-0.3377473, 0.3188244, -1.676513, 0, 1, 0.2784314, 1,
-0.3370914, 0.7832053, -1.60795, 0, 1, 0.2862745, 1,
-0.3368149, 1.532013, 0.8024102, 0, 1, 0.2901961, 1,
-0.3321807, 0.918346, -1.267106, 0, 1, 0.2980392, 1,
-0.3284723, 0.4419927, -1.306235, 0, 1, 0.3058824, 1,
-0.3262701, -0.5011513, -2.851074, 0, 1, 0.3098039, 1,
-0.3242345, 0.600278, -0.1766106, 0, 1, 0.3176471, 1,
-0.3240997, 0.07652435, 0.08218089, 0, 1, 0.3215686, 1,
-0.3233159, -1.267628, -3.799205, 0, 1, 0.3294118, 1,
-0.3199414, -0.08790661, -1.516251, 0, 1, 0.3333333, 1,
-0.3131571, 0.504061, -0.7774352, 0, 1, 0.3411765, 1,
-0.3128073, 0.8381653, 1.000821, 0, 1, 0.345098, 1,
-0.312732, 1.1656, -1.397022, 0, 1, 0.3529412, 1,
-0.3117506, 1.082587, -1.169034, 0, 1, 0.3568628, 1,
-0.3105487, -0.9341972, -2.310747, 0, 1, 0.3647059, 1,
-0.3098084, 0.3167543, -0.81104, 0, 1, 0.3686275, 1,
-0.3092881, -0.0166186, 0.3805133, 0, 1, 0.3764706, 1,
-0.308587, -0.8269885, -5.001733, 0, 1, 0.3803922, 1,
-0.3076541, 1.410375, -0.4567462, 0, 1, 0.3882353, 1,
-0.306395, -1.446419, -2.241266, 0, 1, 0.3921569, 1,
-0.30075, 0.1285339, -0.4327766, 0, 1, 0.4, 1,
-0.2983922, 1.090976, 1.85199, 0, 1, 0.4078431, 1,
-0.2950245, -0.3628275, -0.9803024, 0, 1, 0.4117647, 1,
-0.2942341, -0.2980401, -4.196713, 0, 1, 0.4196078, 1,
-0.2940362, 1.10432, -0.5264819, 0, 1, 0.4235294, 1,
-0.2935352, -0.6856926, -1.674314, 0, 1, 0.4313726, 1,
-0.2919595, -1.428479, -4.391273, 0, 1, 0.4352941, 1,
-0.2910281, 1.405866, -0.9626128, 0, 1, 0.4431373, 1,
-0.2864927, 0.5299798, -0.8077114, 0, 1, 0.4470588, 1,
-0.285964, 0.9256148, -2.123107, 0, 1, 0.454902, 1,
-0.2839952, -0.5552149, -2.917884, 0, 1, 0.4588235, 1,
-0.2808162, -0.4078889, -3.521519, 0, 1, 0.4666667, 1,
-0.2797161, 0.8316126, 3.197757, 0, 1, 0.4705882, 1,
-0.2746412, -0.9231719, -1.578108, 0, 1, 0.4784314, 1,
-0.2716314, 0.522127, -1.268553, 0, 1, 0.4823529, 1,
-0.2695048, 0.7097024, -0.2018227, 0, 1, 0.4901961, 1,
-0.2682676, -0.02528844, -1.615476, 0, 1, 0.4941176, 1,
-0.2624058, -1.31599, -2.845374, 0, 1, 0.5019608, 1,
-0.2557548, -0.5366738, -1.325679, 0, 1, 0.509804, 1,
-0.2554673, -0.0327847, -2.598673, 0, 1, 0.5137255, 1,
-0.2547261, -1.408222, -3.117552, 0, 1, 0.5215687, 1,
-0.2542657, 0.9459732, -0.9648669, 0, 1, 0.5254902, 1,
-0.2525736, -0.5890456, -4.184526, 0, 1, 0.5333334, 1,
-0.2511122, 1.031324, 0.33103, 0, 1, 0.5372549, 1,
-0.250772, -1.221824, -2.945262, 0, 1, 0.5450981, 1,
-0.2497293, 0.03774314, -1.432769, 0, 1, 0.5490196, 1,
-0.2418895, 1.802916, 0.08994858, 0, 1, 0.5568628, 1,
-0.2349537, 0.721239, -0.6624112, 0, 1, 0.5607843, 1,
-0.2341103, -1.249205, -2.493754, 0, 1, 0.5686275, 1,
-0.2318743, -0.3449857, -3.768016, 0, 1, 0.572549, 1,
-0.2167625, 0.5283678, -0.5120201, 0, 1, 0.5803922, 1,
-0.2167605, -0.6129937, -2.914231, 0, 1, 0.5843138, 1,
-0.212937, 0.4162591, -1.279444, 0, 1, 0.5921569, 1,
-0.2089328, -0.6604654, -2.195595, 0, 1, 0.5960785, 1,
-0.2082125, 0.6920733, -1.694841, 0, 1, 0.6039216, 1,
-0.207074, 1.817769, -0.6638699, 0, 1, 0.6117647, 1,
-0.1953344, -0.3560652, -2.861398, 0, 1, 0.6156863, 1,
-0.1949825, 0.8063167, -0.8676354, 0, 1, 0.6235294, 1,
-0.1946815, -0.04943476, -1.014383, 0, 1, 0.627451, 1,
-0.1906696, 0.7174583, 0.4222599, 0, 1, 0.6352941, 1,
-0.1895838, -2.859379, -2.266695, 0, 1, 0.6392157, 1,
-0.1857638, 0.7733744, -0.3139437, 0, 1, 0.6470588, 1,
-0.1850596, -1.057129, -4.998613, 0, 1, 0.6509804, 1,
-0.1833115, 0.6883559, 0.6289934, 0, 1, 0.6588235, 1,
-0.1797602, 0.03520402, -2.816089, 0, 1, 0.6627451, 1,
-0.1787242, 1.059057, -1.075988, 0, 1, 0.6705883, 1,
-0.1779651, -1.615863, -2.974857, 0, 1, 0.6745098, 1,
-0.1723809, 0.01141822, -2.217511, 0, 1, 0.682353, 1,
-0.1684239, -0.501503, -2.874958, 0, 1, 0.6862745, 1,
-0.1679767, -1.156188, -2.436939, 0, 1, 0.6941177, 1,
-0.1507285, -0.4669492, -5.824849, 0, 1, 0.7019608, 1,
-0.1430712, 0.1162804, -0.3106878, 0, 1, 0.7058824, 1,
-0.139998, 1.515979, -0.2688064, 0, 1, 0.7137255, 1,
-0.1384826, 0.9921842, -1.568149, 0, 1, 0.7176471, 1,
-0.1384181, -1.617025, -3.375407, 0, 1, 0.7254902, 1,
-0.1354026, 0.2406106, -0.7736548, 0, 1, 0.7294118, 1,
-0.1332458, -1.365742, -2.862861, 0, 1, 0.7372549, 1,
-0.1329486, -1.183752, -4.681271, 0, 1, 0.7411765, 1,
-0.1312006, -1.46205, -3.994558, 0, 1, 0.7490196, 1,
-0.1286711, 0.4832324, 0.9916286, 0, 1, 0.7529412, 1,
-0.1286621, 1.224241, 0.9293422, 0, 1, 0.7607843, 1,
-0.1268989, 0.2745461, 0.223233, 0, 1, 0.7647059, 1,
-0.1150217, -0.7426547, -1.8134, 0, 1, 0.772549, 1,
-0.1127343, 0.278553, -0.5192876, 0, 1, 0.7764706, 1,
-0.1087193, 0.4047446, -0.008509707, 0, 1, 0.7843137, 1,
-0.1061024, -1.040693, -4.125886, 0, 1, 0.7882353, 1,
-0.1048828, 0.1264779, -0.5771903, 0, 1, 0.7960784, 1,
-0.1033115, -0.8287205, -2.045497, 0, 1, 0.8039216, 1,
-0.1029501, 1.48125, -0.01487392, 0, 1, 0.8078431, 1,
-0.102235, -0.2498286, -4.415682, 0, 1, 0.8156863, 1,
-0.1016949, -2.311945, -3.227435, 0, 1, 0.8196079, 1,
-0.09842522, -1.896974, -3.990041, 0, 1, 0.827451, 1,
-0.09538706, 1.215291, 0.1919803, 0, 1, 0.8313726, 1,
-0.0947783, -0.4913902, -1.95976, 0, 1, 0.8392157, 1,
-0.09312072, 1.098702, 0.8802176, 0, 1, 0.8431373, 1,
-0.08838087, 2.172546, -0.6771322, 0, 1, 0.8509804, 1,
-0.0879928, 0.3958604, -0.8303098, 0, 1, 0.854902, 1,
-0.08743118, 2.184633, 0.9565042, 0, 1, 0.8627451, 1,
-0.08063409, 1.144375, -0.2828467, 0, 1, 0.8666667, 1,
-0.07595308, -0.8088995, -1.966532, 0, 1, 0.8745098, 1,
-0.0699112, -1.648037, -4.032124, 0, 1, 0.8784314, 1,
-0.06790733, 0.1859644, 0.4367037, 0, 1, 0.8862745, 1,
-0.06720006, 0.1024674, 0.1912642, 0, 1, 0.8901961, 1,
-0.06663764, 0.1184575, 0.3743382, 0, 1, 0.8980392, 1,
-0.0660595, 0.3350784, -0.7391734, 0, 1, 0.9058824, 1,
-0.06598356, 1.504327, -0.3440059, 0, 1, 0.9098039, 1,
-0.05996903, 0.0864834, 1.50424, 0, 1, 0.9176471, 1,
-0.05942176, 0.522556, -1.094502, 0, 1, 0.9215686, 1,
-0.05934047, -0.1635138, -4.158368, 0, 1, 0.9294118, 1,
-0.05164225, -0.008418816, -1.110901, 0, 1, 0.9333333, 1,
-0.05143284, -0.9022363, -2.468604, 0, 1, 0.9411765, 1,
-0.04934055, -1.48904, -2.415598, 0, 1, 0.945098, 1,
-0.04856556, -0.8781353, -3.635728, 0, 1, 0.9529412, 1,
-0.0429683, 0.186202, 1.589823, 0, 1, 0.9568627, 1,
-0.04163499, -0.7119844, -3.115942, 0, 1, 0.9647059, 1,
-0.03739552, -0.9871674, -2.688356, 0, 1, 0.9686275, 1,
-0.03289072, 1.360076, 0.5400323, 0, 1, 0.9764706, 1,
-0.03149959, -0.3342688, -2.488881, 0, 1, 0.9803922, 1,
-0.0296441, 0.4290085, 0.2011971, 0, 1, 0.9882353, 1,
-0.02935696, -0.3602173, -4.573475, 0, 1, 0.9921569, 1,
-0.02868231, -1.265123, -2.491035, 0, 1, 1, 1,
-0.02361874, 0.4466691, 0.6403677, 0, 0.9921569, 1, 1,
-0.02308198, 0.2121292, -0.1461423, 0, 0.9882353, 1, 1,
-0.01953275, 0.7124858, 0.3334883, 0, 0.9803922, 1, 1,
-0.01936256, 0.2847265, -0.9634608, 0, 0.9764706, 1, 1,
-0.01927162, 1.45735, -0.3825436, 0, 0.9686275, 1, 1,
-0.0149505, 0.8894702, 1.135282, 0, 0.9647059, 1, 1,
-0.01432798, -0.603524, -3.039348, 0, 0.9568627, 1, 1,
-0.01161061, -0.9079799, -2.502087, 0, 0.9529412, 1, 1,
-0.01115291, -0.6514786, -1.339767, 0, 0.945098, 1, 1,
-0.007506596, 0.6731296, 0.7412878, 0, 0.9411765, 1, 1,
-0.004896443, -0.7652031, -2.482855, 0, 0.9333333, 1, 1,
-0.004019934, 0.6923086, -0.9021625, 0, 0.9294118, 1, 1,
-0.001832169, 0.1767284, -0.2661035, 0, 0.9215686, 1, 1,
0.001151374, -1.969157, 4.885962, 0, 0.9176471, 1, 1,
0.002021949, -0.6206268, 4.242584, 0, 0.9098039, 1, 1,
0.002452947, 0.4563343, 0.3856086, 0, 0.9058824, 1, 1,
0.004843074, 0.9042981, 0.7897251, 0, 0.8980392, 1, 1,
0.006426667, -1.11138, 3.438859, 0, 0.8901961, 1, 1,
0.01127564, -0.1191049, 3.203634, 0, 0.8862745, 1, 1,
0.01375791, 1.15362, -0.9459577, 0, 0.8784314, 1, 1,
0.0162628, -0.1580482, 2.125532, 0, 0.8745098, 1, 1,
0.01696706, -0.2554481, 2.895819, 0, 0.8666667, 1, 1,
0.01815126, -1.248397, 2.605226, 0, 0.8627451, 1, 1,
0.02229198, -1.29315, 3.042502, 0, 0.854902, 1, 1,
0.02263517, 1.312305, 0.5760281, 0, 0.8509804, 1, 1,
0.02330006, -0.3089255, 2.437585, 0, 0.8431373, 1, 1,
0.02358741, -1.050118, 1.738311, 0, 0.8392157, 1, 1,
0.02405884, -0.2317697, 2.412462, 0, 0.8313726, 1, 1,
0.02781069, -0.2127934, 2.830892, 0, 0.827451, 1, 1,
0.02937427, 0.6682102, -0.4663793, 0, 0.8196079, 1, 1,
0.03708101, -0.1672282, 1.690493, 0, 0.8156863, 1, 1,
0.04065813, 0.1801289, 1.101771, 0, 0.8078431, 1, 1,
0.04786373, -0.8397231, 3.144107, 0, 0.8039216, 1, 1,
0.05081064, -0.6516326, 4.651837, 0, 0.7960784, 1, 1,
0.05092013, 0.7169273, 1.41344, 0, 0.7882353, 1, 1,
0.0509272, -2.38063, 3.666466, 0, 0.7843137, 1, 1,
0.05191358, -0.1165101, 2.885918, 0, 0.7764706, 1, 1,
0.05293867, -0.3865416, 3.514888, 0, 0.772549, 1, 1,
0.05429473, 0.3005567, 0.5459655, 0, 0.7647059, 1, 1,
0.05484622, 1.012754, 0.5248672, 0, 0.7607843, 1, 1,
0.05628764, -0.1546045, 1.598717, 0, 0.7529412, 1, 1,
0.05680715, -0.1087064, 1.43639, 0, 0.7490196, 1, 1,
0.06200917, -0.8488448, 1.83157, 0, 0.7411765, 1, 1,
0.06240324, 1.421443, 0.5133222, 0, 0.7372549, 1, 1,
0.0624304, 0.8826742, -0.4628822, 0, 0.7294118, 1, 1,
0.06288787, -0.8563317, 4.870277, 0, 0.7254902, 1, 1,
0.06383024, -1.115502, 2.246548, 0, 0.7176471, 1, 1,
0.06383498, 1.414509, -0.2832776, 0, 0.7137255, 1, 1,
0.07105473, -3.675674, 3.219744, 0, 0.7058824, 1, 1,
0.07563838, 0.09866282, 1.316146, 0, 0.6980392, 1, 1,
0.08118234, -1.02335, 3.733538, 0, 0.6941177, 1, 1,
0.08208132, 0.2832161, -0.1685849, 0, 0.6862745, 1, 1,
0.08587835, 1.395322, -0.04963798, 0, 0.682353, 1, 1,
0.08958134, 0.4353809, -0.6601672, 0, 0.6745098, 1, 1,
0.09329533, -1.725197, 3.825701, 0, 0.6705883, 1, 1,
0.09461409, -0.9245901, 2.499563, 0, 0.6627451, 1, 1,
0.09910666, 0.1959257, 1.596244, 0, 0.6588235, 1, 1,
0.1001616, 1.541512, 0.2727028, 0, 0.6509804, 1, 1,
0.1050205, -0.7561527, 4.040202, 0, 0.6470588, 1, 1,
0.106178, -1.351249, 1.550171, 0, 0.6392157, 1, 1,
0.1105485, 0.09008523, 0.9968377, 0, 0.6352941, 1, 1,
0.1140167, -0.3764428, 2.773818, 0, 0.627451, 1, 1,
0.1143733, 0.9722241, 0.3288999, 0, 0.6235294, 1, 1,
0.1162061, 0.4865895, 0.779485, 0, 0.6156863, 1, 1,
0.1166133, 1.063349, 0.5845842, 0, 0.6117647, 1, 1,
0.1259495, 0.1450932, 1.48469, 0, 0.6039216, 1, 1,
0.1319018, 1.099377, 0.6122106, 0, 0.5960785, 1, 1,
0.1327156, 1.124709, -0.7917022, 0, 0.5921569, 1, 1,
0.1404581, -1.44616, 2.570147, 0, 0.5843138, 1, 1,
0.143839, -0.1986001, 0.8923257, 0, 0.5803922, 1, 1,
0.143971, 1.448455, 1.218667, 0, 0.572549, 1, 1,
0.144858, 0.2187053, 0.5340273, 0, 0.5686275, 1, 1,
0.1449828, 0.450851, 1.119707, 0, 0.5607843, 1, 1,
0.1467798, -0.7830141, 2.90585, 0, 0.5568628, 1, 1,
0.1505276, -0.5637713, 2.737329, 0, 0.5490196, 1, 1,
0.1522074, 1.564057, 1.459845, 0, 0.5450981, 1, 1,
0.15306, -0.9551982, 1.841265, 0, 0.5372549, 1, 1,
0.1586278, 0.2444869, 0.3361271, 0, 0.5333334, 1, 1,
0.1595658, 1.349938, -1.156333, 0, 0.5254902, 1, 1,
0.1617266, 0.338531, -0.561828, 0, 0.5215687, 1, 1,
0.1674694, 1.05369, -1.400615, 0, 0.5137255, 1, 1,
0.167483, 0.6150846, 0.1793768, 0, 0.509804, 1, 1,
0.1704065, 1.023116, 2.004595, 0, 0.5019608, 1, 1,
0.1717206, 0.3742923, -0.753446, 0, 0.4941176, 1, 1,
0.1726169, 0.4939326, -0.908839, 0, 0.4901961, 1, 1,
0.1733845, 1.164721, 1.311378, 0, 0.4823529, 1, 1,
0.1762849, 0.247801, 0.9511009, 0, 0.4784314, 1, 1,
0.1776187, 0.9071723, 0.8188847, 0, 0.4705882, 1, 1,
0.1784364, 0.8780348, 2.054051, 0, 0.4666667, 1, 1,
0.1831344, -0.3538278, 2.671555, 0, 0.4588235, 1, 1,
0.1863707, -1.0887, 4.076273, 0, 0.454902, 1, 1,
0.1880927, 1.153521, 1.675682, 0, 0.4470588, 1, 1,
0.1892373, -1.162122, 2.646033, 0, 0.4431373, 1, 1,
0.1892495, -0.0244264, -0.3092127, 0, 0.4352941, 1, 1,
0.1938237, 0.3846965, 0.7646032, 0, 0.4313726, 1, 1,
0.194742, -0.7965398, 1.732298, 0, 0.4235294, 1, 1,
0.1950057, 0.8505676, 0.4371176, 0, 0.4196078, 1, 1,
0.1967801, 0.166337, 1.263743, 0, 0.4117647, 1, 1,
0.197264, -0.6278418, 2.787388, 0, 0.4078431, 1, 1,
0.1981734, -1.693905, 2.218237, 0, 0.4, 1, 1,
0.1992913, 0.08998992, -0.6956251, 0, 0.3921569, 1, 1,
0.2001391, 0.7089857, 0.8797262, 0, 0.3882353, 1, 1,
0.2013308, -0.1523129, 1.643483, 0, 0.3803922, 1, 1,
0.2036308, -1.095724, 2.860468, 0, 0.3764706, 1, 1,
0.2037924, -1.430512, 2.36265, 0, 0.3686275, 1, 1,
0.2059434, -0.24154, 1.955452, 0, 0.3647059, 1, 1,
0.2065414, 0.8160043, -0.6105442, 0, 0.3568628, 1, 1,
0.2092867, -0.3559446, 1.934037, 0, 0.3529412, 1, 1,
0.2093899, -1.105695, 2.949099, 0, 0.345098, 1, 1,
0.2128482, -0.2663894, 1.510486, 0, 0.3411765, 1, 1,
0.2165133, -0.4697869, 2.756843, 0, 0.3333333, 1, 1,
0.226807, 1.307534, 0.3302611, 0, 0.3294118, 1, 1,
0.2434248, 0.6249743, 1.167411, 0, 0.3215686, 1, 1,
0.2440909, -0.5428043, 1.522106, 0, 0.3176471, 1, 1,
0.2458975, 1.604982, -1.969702, 0, 0.3098039, 1, 1,
0.25257, -0.4645262, 3.147869, 0, 0.3058824, 1, 1,
0.253452, -1.436144, 2.032551, 0, 0.2980392, 1, 1,
0.2535047, -1.169202, 4.863039, 0, 0.2901961, 1, 1,
0.2562252, 0.0774147, 1.035804, 0, 0.2862745, 1, 1,
0.2570133, 0.04479001, 1.424442, 0, 0.2784314, 1, 1,
0.2577522, 0.1382307, 3.367981, 0, 0.2745098, 1, 1,
0.257815, 1.166037, -0.9334529, 0, 0.2666667, 1, 1,
0.2595899, 0.3167954, 2.075924, 0, 0.2627451, 1, 1,
0.2623578, -0.2454192, 3.018989, 0, 0.254902, 1, 1,
0.2703125, 2.107707, -0.3882426, 0, 0.2509804, 1, 1,
0.2748007, 0.754065, -0.5742931, 0, 0.2431373, 1, 1,
0.2795405, 0.8729553, 1.176075, 0, 0.2392157, 1, 1,
0.2799048, -0.8792805, 3.752227, 0, 0.2313726, 1, 1,
0.2841939, -0.7204885, 2.220124, 0, 0.227451, 1, 1,
0.286472, 0.7394205, 0.2306929, 0, 0.2196078, 1, 1,
0.2883013, 1.158183, 0.9693563, 0, 0.2156863, 1, 1,
0.2905318, -1.324443, 5.758218, 0, 0.2078431, 1, 1,
0.2920344, -0.02129825, 0.6575804, 0, 0.2039216, 1, 1,
0.298804, -0.4039023, 3.524739, 0, 0.1960784, 1, 1,
0.2994648, 0.5409831, 1.014249, 0, 0.1882353, 1, 1,
0.3018563, -0.1211435, 1.755587, 0, 0.1843137, 1, 1,
0.3088591, 0.891233, -1.167637, 0, 0.1764706, 1, 1,
0.3088973, 0.1802895, 1.394605, 0, 0.172549, 1, 1,
0.3164556, 1.47321, 0.03294712, 0, 0.1647059, 1, 1,
0.3177765, -1.502925, 3.404807, 0, 0.1607843, 1, 1,
0.3181362, -0.3038796, 1.889108, 0, 0.1529412, 1, 1,
0.3263704, -0.663852, 2.28706, 0, 0.1490196, 1, 1,
0.3291287, -0.4751884, 3.093328, 0, 0.1411765, 1, 1,
0.3292225, -2.6619, 1.471969, 0, 0.1372549, 1, 1,
0.333766, 0.4449542, 0.09546141, 0, 0.1294118, 1, 1,
0.3394324, -0.7435164, 3.85888, 0, 0.1254902, 1, 1,
0.3517863, -1.630068, 2.654543, 0, 0.1176471, 1, 1,
0.3574985, -0.9604082, 3.211526, 0, 0.1137255, 1, 1,
0.3597097, -2.087857, 1.836486, 0, 0.1058824, 1, 1,
0.3640144, -0.8116802, 4.063862, 0, 0.09803922, 1, 1,
0.365276, 0.9135304, -0.01797953, 0, 0.09411765, 1, 1,
0.3676721, -0.1573331, 0.3645, 0, 0.08627451, 1, 1,
0.3679641, 0.1749001, 0.1386396, 0, 0.08235294, 1, 1,
0.3719742, 1.984062, 0.03120383, 0, 0.07450981, 1, 1,
0.3750794, 1.623945, 1.264767, 0, 0.07058824, 1, 1,
0.3755654, 1.277519, 0.4688455, 0, 0.0627451, 1, 1,
0.3779415, -0.7858427, 2.428601, 0, 0.05882353, 1, 1,
0.3819288, -0.2234191, 2.255756, 0, 0.05098039, 1, 1,
0.3848985, -1.398047, 3.680164, 0, 0.04705882, 1, 1,
0.3855623, 0.6368188, 2.78029, 0, 0.03921569, 1, 1,
0.3900366, -0.01894703, 0.9273764, 0, 0.03529412, 1, 1,
0.3908949, 1.386442, -0.8578047, 0, 0.02745098, 1, 1,
0.3919172, 0.4327033, 0.2625082, 0, 0.02352941, 1, 1,
0.3943831, -1.857941, 4.269851, 0, 0.01568628, 1, 1,
0.3963333, -0.4917213, 0.7706932, 0, 0.01176471, 1, 1,
0.3979402, -0.6563678, 1.280992, 0, 0.003921569, 1, 1,
0.398365, -0.9447036, 1.880627, 0.003921569, 0, 1, 1,
0.4000572, 2.335005, 0.1692204, 0.007843138, 0, 1, 1,
0.4036118, -0.3351083, 0.5488419, 0.01568628, 0, 1, 1,
0.4107594, -0.6729311, 5.233041, 0.01960784, 0, 1, 1,
0.4152458, 1.155066, 1.814339, 0.02745098, 0, 1, 1,
0.4195859, 0.6030846, 1.616617, 0.03137255, 0, 1, 1,
0.4250194, -1.408756, 3.394428, 0.03921569, 0, 1, 1,
0.4259878, 1.344813, 0.6541444, 0.04313726, 0, 1, 1,
0.4279026, 2.322482, -0.7731394, 0.05098039, 0, 1, 1,
0.4298453, 0.8130277, 1.116423, 0.05490196, 0, 1, 1,
0.4340191, 0.275492, 1.439396, 0.0627451, 0, 1, 1,
0.4381839, -0.3336857, 2.181098, 0.06666667, 0, 1, 1,
0.4486608, -1.082928, 1.953656, 0.07450981, 0, 1, 1,
0.450151, -1.371037, 1.916587, 0.07843138, 0, 1, 1,
0.4588927, -1.002161, 2.155965, 0.08627451, 0, 1, 1,
0.4596527, 0.7621749, -1.033423, 0.09019608, 0, 1, 1,
0.4652826, 0.2323259, -0.2548987, 0.09803922, 0, 1, 1,
0.4665114, -1.178008, 3.099666, 0.1058824, 0, 1, 1,
0.4688592, -0.2707428, 1.770723, 0.1098039, 0, 1, 1,
0.4703357, -0.7986248, 2.966383, 0.1176471, 0, 1, 1,
0.4710953, -1.126717, 2.620808, 0.1215686, 0, 1, 1,
0.4712806, 0.6468285, 0.8288705, 0.1294118, 0, 1, 1,
0.47333, -2.208582, 2.045001, 0.1333333, 0, 1, 1,
0.4739287, -0.4430994, 1.821769, 0.1411765, 0, 1, 1,
0.4742151, -1.004012, 2.448034, 0.145098, 0, 1, 1,
0.4758669, -0.6147373, 1.063101, 0.1529412, 0, 1, 1,
0.4761869, -0.4822209, 2.031006, 0.1568628, 0, 1, 1,
0.4763585, 0.04702131, 0.8423573, 0.1647059, 0, 1, 1,
0.4785305, 0.6194156, 0.5389223, 0.1686275, 0, 1, 1,
0.4788477, -0.2431896, -0.1647318, 0.1764706, 0, 1, 1,
0.4789231, -0.9044134, 2.668441, 0.1803922, 0, 1, 1,
0.4818833, 2.022639, -1.486687, 0.1882353, 0, 1, 1,
0.4838146, 1.277915, -0.4316151, 0.1921569, 0, 1, 1,
0.4921455, -0.2326271, 3.451294, 0.2, 0, 1, 1,
0.4931464, -0.1618058, 1.370363, 0.2078431, 0, 1, 1,
0.4941694, 0.802254, 0.6953831, 0.2117647, 0, 1, 1,
0.4947846, -0.3695604, 1.773417, 0.2196078, 0, 1, 1,
0.4964189, -0.4398445, 2.196736, 0.2235294, 0, 1, 1,
0.4970714, -0.4366885, 0.6992583, 0.2313726, 0, 1, 1,
0.4973389, 0.1404527, 2.913994, 0.2352941, 0, 1, 1,
0.5024886, 0.08291787, 1.325504, 0.2431373, 0, 1, 1,
0.504846, 1.698906, -0.4055281, 0.2470588, 0, 1, 1,
0.5084329, -0.09402063, 2.323952, 0.254902, 0, 1, 1,
0.5123494, -0.04685555, 1.159578, 0.2588235, 0, 1, 1,
0.5131693, -0.9699454, 3.942204, 0.2666667, 0, 1, 1,
0.5162911, -0.7751778, 2.18347, 0.2705882, 0, 1, 1,
0.5166079, 0.07076877, 1.654507, 0.2784314, 0, 1, 1,
0.5169334, 1.067102, 0.7844016, 0.282353, 0, 1, 1,
0.5174254, -0.2931363, 2.192587, 0.2901961, 0, 1, 1,
0.5210415, -0.4712653, 2.505789, 0.2941177, 0, 1, 1,
0.5233396, -0.7720584, 2.408697, 0.3019608, 0, 1, 1,
0.5274481, -0.6340469, 1.044226, 0.3098039, 0, 1, 1,
0.528777, 0.06166265, 1.427559, 0.3137255, 0, 1, 1,
0.529044, 0.3359645, 2.024436, 0.3215686, 0, 1, 1,
0.5296409, -1.403624, 3.178871, 0.3254902, 0, 1, 1,
0.5315704, -0.2940727, 2.49768, 0.3333333, 0, 1, 1,
0.5324772, -0.2435116, 1.381603, 0.3372549, 0, 1, 1,
0.5344991, 0.570565, 0.201439, 0.345098, 0, 1, 1,
0.5357218, -1.006533, 2.04927, 0.3490196, 0, 1, 1,
0.5399923, 0.6288329, 2.342188, 0.3568628, 0, 1, 1,
0.5418975, 0.863883, 0.7867783, 0.3607843, 0, 1, 1,
0.5480938, -0.3061189, 2.087609, 0.3686275, 0, 1, 1,
0.5496045, -1.015707, 5.85779, 0.372549, 0, 1, 1,
0.5514712, 0.4916964, 0.4520712, 0.3803922, 0, 1, 1,
0.5589529, 0.1548229, 0.5976446, 0.3843137, 0, 1, 1,
0.560846, 0.7524532, 0.0492363, 0.3921569, 0, 1, 1,
0.5697744, 2.426386, -1.194341, 0.3960784, 0, 1, 1,
0.5744628, 2.562965, 0.5739532, 0.4039216, 0, 1, 1,
0.5760748, -0.5939611, 1.389208, 0.4117647, 0, 1, 1,
0.578555, -0.3628632, 1.553282, 0.4156863, 0, 1, 1,
0.5824863, -0.7503361, 1.774096, 0.4235294, 0, 1, 1,
0.5832122, 0.5188761, 1.760536, 0.427451, 0, 1, 1,
0.585157, 0.614778, 1.48306, 0.4352941, 0, 1, 1,
0.5866296, -1.991964, 3.38129, 0.4392157, 0, 1, 1,
0.5899865, 1.757459, 0.8554127, 0.4470588, 0, 1, 1,
0.5931005, 0.08125263, 1.653342, 0.4509804, 0, 1, 1,
0.5969865, 0.6287764, -0.3353016, 0.4588235, 0, 1, 1,
0.6047217, -2.175166, 0.8310234, 0.4627451, 0, 1, 1,
0.6053388, 0.05992927, 3.690273, 0.4705882, 0, 1, 1,
0.612765, 0.6485898, 0.5449528, 0.4745098, 0, 1, 1,
0.6159288, -1.62168, 2.818515, 0.4823529, 0, 1, 1,
0.6163052, -0.5666665, 2.269111, 0.4862745, 0, 1, 1,
0.6177787, 0.7108663, 0.1628286, 0.4941176, 0, 1, 1,
0.6180143, -1.82465, 3.584169, 0.5019608, 0, 1, 1,
0.6279449, -1.987029, 2.604813, 0.5058824, 0, 1, 1,
0.6307936, -0.2646471, 2.508946, 0.5137255, 0, 1, 1,
0.6313185, 1.180144, 1.585878, 0.5176471, 0, 1, 1,
0.6352671, 0.9744624, -0.8774415, 0.5254902, 0, 1, 1,
0.6470575, -1.425366, 3.406483, 0.5294118, 0, 1, 1,
0.6511666, -0.3625394, 2.353172, 0.5372549, 0, 1, 1,
0.6520398, 0.02771077, 2.519924, 0.5411765, 0, 1, 1,
0.6549503, 1.307717, 1.675637, 0.5490196, 0, 1, 1,
0.6561892, -0.8935896, 2.230241, 0.5529412, 0, 1, 1,
0.6605116, -1.407447, 3.022918, 0.5607843, 0, 1, 1,
0.6613374, 0.06582805, 1.128869, 0.5647059, 0, 1, 1,
0.662382, 0.3528409, 2.158555, 0.572549, 0, 1, 1,
0.6646562, -2.172895, 3.952269, 0.5764706, 0, 1, 1,
0.6653334, 2.721592, 0.2142539, 0.5843138, 0, 1, 1,
0.6673694, -0.469326, 3.140989, 0.5882353, 0, 1, 1,
0.6702666, 0.7577358, 3.104476, 0.5960785, 0, 1, 1,
0.6735175, -0.2923924, 2.497126, 0.6039216, 0, 1, 1,
0.677624, -2.001109, 3.799908, 0.6078432, 0, 1, 1,
0.680816, -1.056604, 1.451848, 0.6156863, 0, 1, 1,
0.688875, -0.9654678, 2.694326, 0.6196079, 0, 1, 1,
0.689162, -0.2093096, 1.547298, 0.627451, 0, 1, 1,
0.6925622, 0.532162, -0.544823, 0.6313726, 0, 1, 1,
0.695583, 0.8819112, 0.6209559, 0.6392157, 0, 1, 1,
0.6983844, -1.051778, 2.030422, 0.6431373, 0, 1, 1,
0.6997536, -1.264855, 2.494359, 0.6509804, 0, 1, 1,
0.7018034, 0.5441926, 2.305209, 0.654902, 0, 1, 1,
0.7043483, 0.85583, 1.119814, 0.6627451, 0, 1, 1,
0.7147161, 0.02559629, 2.713829, 0.6666667, 0, 1, 1,
0.7208641, -1.84828, 3.22529, 0.6745098, 0, 1, 1,
0.7211104, 0.3395424, 2.542797, 0.6784314, 0, 1, 1,
0.721454, -0.1367472, 2.971543, 0.6862745, 0, 1, 1,
0.7237903, -0.8699788, 0.9681124, 0.6901961, 0, 1, 1,
0.7253509, -1.19816, 2.324839, 0.6980392, 0, 1, 1,
0.7255198, 0.9791864, 1.593601, 0.7058824, 0, 1, 1,
0.7283253, 1.367558, -0.1112766, 0.7098039, 0, 1, 1,
0.7304336, 0.3467192, 3.244053, 0.7176471, 0, 1, 1,
0.7309095, -0.6844817, 2.395806, 0.7215686, 0, 1, 1,
0.7335598, -0.02054804, 1.188571, 0.7294118, 0, 1, 1,
0.7337101, -0.9627027, 0.3638979, 0.7333333, 0, 1, 1,
0.7406131, 0.2975984, 2.178375, 0.7411765, 0, 1, 1,
0.7460903, 1.142769, 0.3368061, 0.7450981, 0, 1, 1,
0.7573264, -0.5882177, 1.238734, 0.7529412, 0, 1, 1,
0.7613042, -0.9898887, 2.903661, 0.7568628, 0, 1, 1,
0.7646006, -0.5173227, 3.60303, 0.7647059, 0, 1, 1,
0.7672844, 2.288047, 0.5167475, 0.7686275, 0, 1, 1,
0.7706808, -0.6510326, 2.743077, 0.7764706, 0, 1, 1,
0.7786521, 0.4719118, 1.632802, 0.7803922, 0, 1, 1,
0.7803944, 0.4840494, 0.1386844, 0.7882353, 0, 1, 1,
0.7861612, -0.0503931, 0.4004841, 0.7921569, 0, 1, 1,
0.7885508, -0.170669, 1.811225, 0.8, 0, 1, 1,
0.7886584, -0.1788622, -0.496689, 0.8078431, 0, 1, 1,
0.7898757, -1.962962, 2.901807, 0.8117647, 0, 1, 1,
0.7967266, 2.600537, -1.300159, 0.8196079, 0, 1, 1,
0.7979716, 1.201532, 2.15081, 0.8235294, 0, 1, 1,
0.8116845, -0.08590456, 3.045665, 0.8313726, 0, 1, 1,
0.8186228, 1.317284, 0.02499185, 0.8352941, 0, 1, 1,
0.8231146, 0.854818, 0.8505271, 0.8431373, 0, 1, 1,
0.8309159, -0.4711387, 3.493767, 0.8470588, 0, 1, 1,
0.8310006, 0.3044614, 2.791291, 0.854902, 0, 1, 1,
0.839058, -1.059025, 2.42312, 0.8588235, 0, 1, 1,
0.8452293, -1.037748, 1.69773, 0.8666667, 0, 1, 1,
0.8487535, -1.935985, 2.670821, 0.8705882, 0, 1, 1,
0.851732, -1.901263, 2.527419, 0.8784314, 0, 1, 1,
0.8573981, 2.176052, -0.8209628, 0.8823529, 0, 1, 1,
0.8600019, 0.3825422, 0.4194079, 0.8901961, 0, 1, 1,
0.8600517, -1.743451, 3.923684, 0.8941177, 0, 1, 1,
0.8613358, -1.026357, 4.376206, 0.9019608, 0, 1, 1,
0.864285, -0.05910531, 2.198759, 0.9098039, 0, 1, 1,
0.8690486, -0.9091288, 2.44363, 0.9137255, 0, 1, 1,
0.8824816, -0.2179805, 0.5090052, 0.9215686, 0, 1, 1,
0.8849658, -0.09041566, 2.007434, 0.9254902, 0, 1, 1,
0.8910586, -0.8264726, 4.124895, 0.9333333, 0, 1, 1,
0.8935352, 1.217718, 1.927741, 0.9372549, 0, 1, 1,
0.8935848, 0.6763162, 1.995234, 0.945098, 0, 1, 1,
0.8955754, 0.7370831, 1.088518, 0.9490196, 0, 1, 1,
0.8968855, 2.134002, -0.3459288, 0.9568627, 0, 1, 1,
0.9032085, 0.1342207, 0.5628355, 0.9607843, 0, 1, 1,
0.9089705, 0.5270812, 1.197417, 0.9686275, 0, 1, 1,
0.9107822, 0.1321131, 2.066173, 0.972549, 0, 1, 1,
0.9109204, 0.4419957, 2.900356, 0.9803922, 0, 1, 1,
0.9138743, -1.221544, 4.512014, 0.9843137, 0, 1, 1,
0.914183, -1.577371, 3.454144, 0.9921569, 0, 1, 1,
0.9257266, 1.588714, -0.05167153, 0.9960784, 0, 1, 1,
0.9299868, -1.981374, 2.357792, 1, 0, 0.9960784, 1,
0.9350696, -1.773805, 2.899994, 1, 0, 0.9882353, 1,
0.9448452, -1.026885, 2.245683, 1, 0, 0.9843137, 1,
0.9494894, -0.460841, 3.545903, 1, 0, 0.9764706, 1,
0.9517311, -0.5755235, 4.204108, 1, 0, 0.972549, 1,
0.9528129, 0.251619, 1.813818, 1, 0, 0.9647059, 1,
0.9614351, 0.5444485, 0.6672953, 1, 0, 0.9607843, 1,
0.9647024, -1.819486, 3.515676, 1, 0, 0.9529412, 1,
0.9739301, -1.248717, 2.695558, 1, 0, 0.9490196, 1,
0.9743113, 0.867057, 0.1746643, 1, 0, 0.9411765, 1,
0.975219, -0.4890386, 2.719624, 1, 0, 0.9372549, 1,
0.9861197, -0.7722707, 0.8160906, 1, 0, 0.9294118, 1,
0.987074, -1.719194, 3.199295, 1, 0, 0.9254902, 1,
0.9887872, -1.258543, 3.595419, 1, 0, 0.9176471, 1,
0.9946116, -0.03416808, 1.662018, 1, 0, 0.9137255, 1,
0.9962633, 0.1375452, 1.686234, 1, 0, 0.9058824, 1,
1.004521, -0.9770271, 3.129009, 1, 0, 0.9019608, 1,
1.004908, 0.703231, 0.6115181, 1, 0, 0.8941177, 1,
1.020192, -0.9131159, 1.480246, 1, 0, 0.8862745, 1,
1.020719, 1.119477, 1.068756, 1, 0, 0.8823529, 1,
1.022504, -0.5280123, 0.3685455, 1, 0, 0.8745098, 1,
1.022812, -0.8026634, 2.463436, 1, 0, 0.8705882, 1,
1.028639, -0.1179927, 1.413379, 1, 0, 0.8627451, 1,
1.035093, 0.85492, 2.042115, 1, 0, 0.8588235, 1,
1.037773, -0.9889702, 3.454345, 1, 0, 0.8509804, 1,
1.037911, -0.2495015, 0.144753, 1, 0, 0.8470588, 1,
1.042569, -1.471977, 1.385218, 1, 0, 0.8392157, 1,
1.048656, -0.2068346, 0.6496575, 1, 0, 0.8352941, 1,
1.060922, -0.7817268, 2.365306, 1, 0, 0.827451, 1,
1.062218, -0.984332, 2.877056, 1, 0, 0.8235294, 1,
1.071316, 0.7082104, 0.4932734, 1, 0, 0.8156863, 1,
1.079756, -1.924924, 1.313804, 1, 0, 0.8117647, 1,
1.079943, -0.3536284, 0.8474281, 1, 0, 0.8039216, 1,
1.080365, 0.8271797, 2.881768, 1, 0, 0.7960784, 1,
1.08202, -0.6248676, 2.061802, 1, 0, 0.7921569, 1,
1.082359, 0.6282791, 0.4258118, 1, 0, 0.7843137, 1,
1.092667, -0.2465716, 2.826678, 1, 0, 0.7803922, 1,
1.1038, 0.2101665, 2.261719, 1, 0, 0.772549, 1,
1.11675, -0.1150686, 2.803031, 1, 0, 0.7686275, 1,
1.117291, -0.2484917, 3.767901, 1, 0, 0.7607843, 1,
1.119974, -1.623671, 2.782863, 1, 0, 0.7568628, 1,
1.122366, 0.1424163, 1.58684, 1, 0, 0.7490196, 1,
1.125439, -2.53414, 1.379374, 1, 0, 0.7450981, 1,
1.134705, 1.205807, 1.642011, 1, 0, 0.7372549, 1,
1.137612, 2.507759, -0.7251226, 1, 0, 0.7333333, 1,
1.140085, -0.5715076, 2.117582, 1, 0, 0.7254902, 1,
1.142386, -1.426865, 2.105212, 1, 0, 0.7215686, 1,
1.145105, 0.9145058, 1.900755, 1, 0, 0.7137255, 1,
1.149039, -0.2162733, 1.612173, 1, 0, 0.7098039, 1,
1.152886, 1.227012, 0.3391992, 1, 0, 0.7019608, 1,
1.157855, 0.01633411, 2.548866, 1, 0, 0.6941177, 1,
1.166236, 1.599062, 1.772634, 1, 0, 0.6901961, 1,
1.167986, 0.515276, 0.7876921, 1, 0, 0.682353, 1,
1.17113, 0.5447121, 1.383395, 1, 0, 0.6784314, 1,
1.178549, 0.8854455, 0.226717, 1, 0, 0.6705883, 1,
1.181764, 0.3484977, 2.059335, 1, 0, 0.6666667, 1,
1.184222, 0.8994005, 1.830787, 1, 0, 0.6588235, 1,
1.194214, 0.2685055, 2.41953, 1, 0, 0.654902, 1,
1.198263, -0.07536463, 1.711949, 1, 0, 0.6470588, 1,
1.199265, 0.1076495, 1.531509, 1, 0, 0.6431373, 1,
1.200143, -0.3907947, 2.916103, 1, 0, 0.6352941, 1,
1.214906, 1.982016, 1.751535, 1, 0, 0.6313726, 1,
1.215009, -0.1993943, 2.694043, 1, 0, 0.6235294, 1,
1.220617, 0.7007977, -0.7084946, 1, 0, 0.6196079, 1,
1.224234, -2.352955, 0.9288486, 1, 0, 0.6117647, 1,
1.233499, 0.5432013, 1.208725, 1, 0, 0.6078432, 1,
1.239387, -0.2487762, 1.419852, 1, 0, 0.6, 1,
1.246439, -0.2908223, 2.689954, 1, 0, 0.5921569, 1,
1.255732, -1.394468, 3.438592, 1, 0, 0.5882353, 1,
1.256871, 1.127091, 1.410219, 1, 0, 0.5803922, 1,
1.258942, 0.02027537, 2.327534, 1, 0, 0.5764706, 1,
1.259951, 0.6642351, 2.378095, 1, 0, 0.5686275, 1,
1.27044, 0.2569152, -0.1389546, 1, 0, 0.5647059, 1,
1.293769, -0.5521377, 2.842294, 1, 0, 0.5568628, 1,
1.294108, 0.1330886, 2.088617, 1, 0, 0.5529412, 1,
1.296675, 1.754952, -0.0004390321, 1, 0, 0.5450981, 1,
1.297148, 1.282884, -1.219255, 1, 0, 0.5411765, 1,
1.29995, 0.9340022, 1.041712, 1, 0, 0.5333334, 1,
1.305179, -1.444369, 2.810653, 1, 0, 0.5294118, 1,
1.310324, -2.477393, 1.603344, 1, 0, 0.5215687, 1,
1.316366, 0.2483951, 3.240566, 1, 0, 0.5176471, 1,
1.317357, 1.04226, 0.4327504, 1, 0, 0.509804, 1,
1.318993, -1.1644, 2.861642, 1, 0, 0.5058824, 1,
1.328901, -0.4990053, 2.644947, 1, 0, 0.4980392, 1,
1.340777, 0.3812036, 2.552851, 1, 0, 0.4901961, 1,
1.34528, 2.177974, 0.1134916, 1, 0, 0.4862745, 1,
1.353194, 1.141916, 1.088248, 1, 0, 0.4784314, 1,
1.360484, 0.3539622, 1.5422, 1, 0, 0.4745098, 1,
1.361573, 1.710444, 0.249913, 1, 0, 0.4666667, 1,
1.371041, -0.6348783, 1.473727, 1, 0, 0.4627451, 1,
1.371118, 0.7865766, 1.104193, 1, 0, 0.454902, 1,
1.372613, 0.5580447, 1.573135, 1, 0, 0.4509804, 1,
1.380715, -0.9760073, 2.170537, 1, 0, 0.4431373, 1,
1.397211, -1.488423, 4.729524, 1, 0, 0.4392157, 1,
1.40771, 0.7875913, 0.66633, 1, 0, 0.4313726, 1,
1.428054, -1.244016, 4.581268, 1, 0, 0.427451, 1,
1.438959, -1.139497, 1.839514, 1, 0, 0.4196078, 1,
1.439332, 0.4755238, 1.604868, 1, 0, 0.4156863, 1,
1.446262, -0.9375269, 0.7274984, 1, 0, 0.4078431, 1,
1.463214, -0.3240493, 3.010381, 1, 0, 0.4039216, 1,
1.468057, -2.2758, 2.347374, 1, 0, 0.3960784, 1,
1.474703, 1.430603, -1.121942, 1, 0, 0.3882353, 1,
1.47495, 1.835949, 1.274773, 1, 0, 0.3843137, 1,
1.475001, -0.5157727, 1.531535, 1, 0, 0.3764706, 1,
1.494946, 0.7371119, 0.7203067, 1, 0, 0.372549, 1,
1.495404, 1.636266, 0.3080267, 1, 0, 0.3647059, 1,
1.545281, 0.6615916, 1.475913, 1, 0, 0.3607843, 1,
1.561475, -0.4004716, -0.04316332, 1, 0, 0.3529412, 1,
1.563147, 0.4491914, 0.5759197, 1, 0, 0.3490196, 1,
1.563468, -0.9806651, 2.08333, 1, 0, 0.3411765, 1,
1.577784, 1.860849, 0.33873, 1, 0, 0.3372549, 1,
1.581779, -0.719288, 3.225236, 1, 0, 0.3294118, 1,
1.585877, -1.495534, 1.640069, 1, 0, 0.3254902, 1,
1.591221, -1.217404, 2.669539, 1, 0, 0.3176471, 1,
1.602466, -0.5928974, 3.112767, 1, 0, 0.3137255, 1,
1.620114, 1.321088, 1.255344, 1, 0, 0.3058824, 1,
1.632707, -0.4328203, 2.330608, 1, 0, 0.2980392, 1,
1.647498, -0.9356319, 1.581906, 1, 0, 0.2941177, 1,
1.651483, 0.09601559, 1.547666, 1, 0, 0.2862745, 1,
1.662962, 0.1137073, -0.5950164, 1, 0, 0.282353, 1,
1.674175, -2.259078, 1.695153, 1, 0, 0.2745098, 1,
1.67643, -0.2351499, 1.799807, 1, 0, 0.2705882, 1,
1.680455, 0.3239051, 1.831249, 1, 0, 0.2627451, 1,
1.682452, 0.5382195, 0.9990118, 1, 0, 0.2588235, 1,
1.686787, 0.7006599, 3.660218, 1, 0, 0.2509804, 1,
1.703406, 0.310023, 0.9833674, 1, 0, 0.2470588, 1,
1.704585, 0.2709697, 0.8017691, 1, 0, 0.2392157, 1,
1.716364, -0.8297511, 1.198703, 1, 0, 0.2352941, 1,
1.725697, 0.4196711, 0.8980555, 1, 0, 0.227451, 1,
1.725845, -2.211432, 2.725058, 1, 0, 0.2235294, 1,
1.72689, -0.8121417, 1.746059, 1, 0, 0.2156863, 1,
1.764614, 0.8108755, 1.931574, 1, 0, 0.2117647, 1,
1.779536, 0.5956815, 1.873239, 1, 0, 0.2039216, 1,
1.782859, 1.357422, -0.9748303, 1, 0, 0.1960784, 1,
1.801257, -0.8901423, 1.41488, 1, 0, 0.1921569, 1,
1.80147, 0.1105125, 1.281986, 1, 0, 0.1843137, 1,
1.813984, 0.09087397, 2.072619, 1, 0, 0.1803922, 1,
1.840175, -1.489244, 1.544964, 1, 0, 0.172549, 1,
1.883156, 1.532049, 1.630288, 1, 0, 0.1686275, 1,
1.929206, 0.3772893, 1.338724, 1, 0, 0.1607843, 1,
1.944573, -0.3063348, 0.3851584, 1, 0, 0.1568628, 1,
1.953498, 1.361762, 2.230552, 1, 0, 0.1490196, 1,
1.957127, 0.8044099, 0.8489091, 1, 0, 0.145098, 1,
2.008332, 0.6112602, 3.130923, 1, 0, 0.1372549, 1,
2.011617, 1.090227, 1.051506, 1, 0, 0.1333333, 1,
2.036334, -0.08297531, 2.097691, 1, 0, 0.1254902, 1,
2.094725, -0.270643, 1.849692, 1, 0, 0.1215686, 1,
2.128957, 1.024421, 1.933535, 1, 0, 0.1137255, 1,
2.177827, -1.520672, 1.717339, 1, 0, 0.1098039, 1,
2.1837, 1.761324, -0.7323816, 1, 0, 0.1019608, 1,
2.230679, 0.635915, 0.4000528, 1, 0, 0.09411765, 1,
2.276033, -1.880195, 3.024825, 1, 0, 0.09019608, 1,
2.38172, 1.583847, 0.762134, 1, 0, 0.08235294, 1,
2.389825, 0.6426134, 2.410985, 1, 0, 0.07843138, 1,
2.424439, 0.470488, 2.310366, 1, 0, 0.07058824, 1,
2.440827, -0.8590952, 2.981666, 1, 0, 0.06666667, 1,
2.460201, -0.5471961, 3.204298, 1, 0, 0.05882353, 1,
2.492064, -1.438639, 2.3729, 1, 0, 0.05490196, 1,
2.515228, -0.8592733, 2.661667, 1, 0, 0.04705882, 1,
2.531418, -0.3353772, 0.1661961, 1, 0, 0.04313726, 1,
2.660891, 0.5275339, 1.794423, 1, 0, 0.03529412, 1,
2.677499, -0.232214, 1.651643, 1, 0, 0.03137255, 1,
2.79257, -1.93005, 1.946022, 1, 0, 0.02352941, 1,
2.903946, 0.3843624, 2.725691, 1, 0, 0.01960784, 1,
2.90471, -0.08595461, 0.6811961, 1, 0, 0.01176471, 1,
3.785824, 0.02444781, 2.050483, 1, 0, 0.007843138, 1
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
0.0907799, -4.760011, -7.805056, 0, -0.5, 0.5, 0.5,
0.0907799, -4.760011, -7.805056, 1, -0.5, 0.5, 0.5,
0.0907799, -4.760011, -7.805056, 1, 1.5, 0.5, 0.5,
0.0907799, -4.760011, -7.805056, 0, 1.5, 0.5, 0.5
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
-4.856884, -0.4770409, -7.805056, 0, -0.5, 0.5, 0.5,
-4.856884, -0.4770409, -7.805056, 1, -0.5, 0.5, 0.5,
-4.856884, -0.4770409, -7.805056, 1, 1.5, 0.5, 0.5,
-4.856884, -0.4770409, -7.805056, 0, 1.5, 0.5, 0.5
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
-4.856884, -4.760011, 0.01647067, 0, -0.5, 0.5, 0.5,
-4.856884, -4.760011, 0.01647067, 1, -0.5, 0.5, 0.5,
-4.856884, -4.760011, 0.01647067, 1, 1.5, 0.5, 0.5,
-4.856884, -4.760011, 0.01647067, 0, 1.5, 0.5, 0.5
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
-2, -3.771633, -6.000088,
2, -3.771633, -6.000088,
-2, -3.771633, -6.000088,
-2, -3.936363, -6.300916,
0, -3.771633, -6.000088,
0, -3.936363, -6.300916,
2, -3.771633, -6.000088,
2, -3.936363, -6.300916
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
"0",
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
-2, -4.265822, -6.902572, 0, -0.5, 0.5, 0.5,
-2, -4.265822, -6.902572, 1, -0.5, 0.5, 0.5,
-2, -4.265822, -6.902572, 1, 1.5, 0.5, 0.5,
-2, -4.265822, -6.902572, 0, 1.5, 0.5, 0.5,
0, -4.265822, -6.902572, 0, -0.5, 0.5, 0.5,
0, -4.265822, -6.902572, 1, -0.5, 0.5, 0.5,
0, -4.265822, -6.902572, 1, 1.5, 0.5, 0.5,
0, -4.265822, -6.902572, 0, 1.5, 0.5, 0.5,
2, -4.265822, -6.902572, 0, -0.5, 0.5, 0.5,
2, -4.265822, -6.902572, 1, -0.5, 0.5, 0.5,
2, -4.265822, -6.902572, 1, 1.5, 0.5, 0.5,
2, -4.265822, -6.902572, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.715116, -3, -6.000088,
-3.715116, 2, -6.000088,
-3.715116, -3, -6.000088,
-3.905411, -3, -6.300916,
-3.715116, -2, -6.000088,
-3.905411, -2, -6.300916,
-3.715116, -1, -6.000088,
-3.905411, -1, -6.300916,
-3.715116, 0, -6.000088,
-3.905411, 0, -6.300916,
-3.715116, 1, -6.000088,
-3.905411, 1, -6.300916,
-3.715116, 2, -6.000088,
-3.905411, 2, -6.300916
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
-4.286, -3, -6.902572, 0, -0.5, 0.5, 0.5,
-4.286, -3, -6.902572, 1, -0.5, 0.5, 0.5,
-4.286, -3, -6.902572, 1, 1.5, 0.5, 0.5,
-4.286, -3, -6.902572, 0, 1.5, 0.5, 0.5,
-4.286, -2, -6.902572, 0, -0.5, 0.5, 0.5,
-4.286, -2, -6.902572, 1, -0.5, 0.5, 0.5,
-4.286, -2, -6.902572, 1, 1.5, 0.5, 0.5,
-4.286, -2, -6.902572, 0, 1.5, 0.5, 0.5,
-4.286, -1, -6.902572, 0, -0.5, 0.5, 0.5,
-4.286, -1, -6.902572, 1, -0.5, 0.5, 0.5,
-4.286, -1, -6.902572, 1, 1.5, 0.5, 0.5,
-4.286, -1, -6.902572, 0, 1.5, 0.5, 0.5,
-4.286, 0, -6.902572, 0, -0.5, 0.5, 0.5,
-4.286, 0, -6.902572, 1, -0.5, 0.5, 0.5,
-4.286, 0, -6.902572, 1, 1.5, 0.5, 0.5,
-4.286, 0, -6.902572, 0, 1.5, 0.5, 0.5,
-4.286, 1, -6.902572, 0, -0.5, 0.5, 0.5,
-4.286, 1, -6.902572, 1, -0.5, 0.5, 0.5,
-4.286, 1, -6.902572, 1, 1.5, 0.5, 0.5,
-4.286, 1, -6.902572, 0, 1.5, 0.5, 0.5,
-4.286, 2, -6.902572, 0, -0.5, 0.5, 0.5,
-4.286, 2, -6.902572, 1, -0.5, 0.5, 0.5,
-4.286, 2, -6.902572, 1, 1.5, 0.5, 0.5,
-4.286, 2, -6.902572, 0, 1.5, 0.5, 0.5
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
-3.715116, -3.771633, -4,
-3.715116, -3.771633, 4,
-3.715116, -3.771633, -4,
-3.905411, -3.936363, -4,
-3.715116, -3.771633, -2,
-3.905411, -3.936363, -2,
-3.715116, -3.771633, 0,
-3.905411, -3.936363, 0,
-3.715116, -3.771633, 2,
-3.905411, -3.936363, 2,
-3.715116, -3.771633, 4,
-3.905411, -3.936363, 4
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
-4.286, -4.265822, -4, 0, -0.5, 0.5, 0.5,
-4.286, -4.265822, -4, 1, -0.5, 0.5, 0.5,
-4.286, -4.265822, -4, 1, 1.5, 0.5, 0.5,
-4.286, -4.265822, -4, 0, 1.5, 0.5, 0.5,
-4.286, -4.265822, -2, 0, -0.5, 0.5, 0.5,
-4.286, -4.265822, -2, 1, -0.5, 0.5, 0.5,
-4.286, -4.265822, -2, 1, 1.5, 0.5, 0.5,
-4.286, -4.265822, -2, 0, 1.5, 0.5, 0.5,
-4.286, -4.265822, 0, 0, -0.5, 0.5, 0.5,
-4.286, -4.265822, 0, 1, -0.5, 0.5, 0.5,
-4.286, -4.265822, 0, 1, 1.5, 0.5, 0.5,
-4.286, -4.265822, 0, 0, 1.5, 0.5, 0.5,
-4.286, -4.265822, 2, 0, -0.5, 0.5, 0.5,
-4.286, -4.265822, 2, 1, -0.5, 0.5, 0.5,
-4.286, -4.265822, 2, 1, 1.5, 0.5, 0.5,
-4.286, -4.265822, 2, 0, 1.5, 0.5, 0.5,
-4.286, -4.265822, 4, 0, -0.5, 0.5, 0.5,
-4.286, -4.265822, 4, 1, -0.5, 0.5, 0.5,
-4.286, -4.265822, 4, 1, 1.5, 0.5, 0.5,
-4.286, -4.265822, 4, 0, 1.5, 0.5, 0.5
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
-3.715116, -3.771633, -6.000088,
-3.715116, 2.817551, -6.000088,
-3.715116, -3.771633, 6.03303,
-3.715116, 2.817551, 6.03303,
-3.715116, -3.771633, -6.000088,
-3.715116, -3.771633, 6.03303,
-3.715116, 2.817551, -6.000088,
-3.715116, 2.817551, 6.03303,
-3.715116, -3.771633, -6.000088,
3.896676, -3.771633, -6.000088,
-3.715116, -3.771633, 6.03303,
3.896676, -3.771633, 6.03303,
-3.715116, 2.817551, -6.000088,
3.896676, 2.817551, -6.000088,
-3.715116, 2.817551, 6.03303,
3.896676, 2.817551, 6.03303,
3.896676, -3.771633, -6.000088,
3.896676, 2.817551, -6.000088,
3.896676, -3.771633, 6.03303,
3.896676, 2.817551, 6.03303,
3.896676, -3.771633, -6.000088,
3.896676, -3.771633, 6.03303,
3.896676, 2.817551, -6.000088,
3.896676, 2.817551, 6.03303
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
var radius = 8.377756;
var distance = 37.27358;
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
mvMatrix.translate( -0.0907799, 0.4770409, -0.01647067 );
mvMatrix.scale( 1.190021, 1.374706, 0.752772 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.27358);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Benomyl<-read.table("Benomyl.xyz")
```

```
## Error in read.table("Benomyl.xyz"): no lines available in input
```

```r
x<-Benomyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Benomyl' not found
```

```r
y<-Benomyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Benomyl' not found
```

```r
z<-Benomyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Benomyl' not found
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
-3.604264, 1.222674, -0.8267115, 0, 0, 1, 1, 1,
-3.14598, 0.03270902, -1.618484, 1, 0, 0, 1, 1,
-3.068026, 0.4728235, -2.719112, 1, 0, 0, 1, 1,
-2.782557, -0.2415747, -1.319261, 1, 0, 0, 1, 1,
-2.683771, -0.08182013, -2.411375, 1, 0, 0, 1, 1,
-2.494089, -0.07384679, -1.673144, 1, 0, 0, 1, 1,
-2.437628, 0.742784, -1.19719, 0, 0, 0, 1, 1,
-2.363962, -1.796083, -1.308401, 0, 0, 0, 1, 1,
-2.360914, 0.6386173, -1.383321, 0, 0, 0, 1, 1,
-2.216785, 0.4472388, -1.796034, 0, 0, 0, 1, 1,
-2.216355, 1.651909, -2.099164, 0, 0, 0, 1, 1,
-2.21477, 0.7825973, -2.513954, 0, 0, 0, 1, 1,
-2.201102, -1.048888, -3.892062, 0, 0, 0, 1, 1,
-2.193664, -0.2023006, -1.290281, 1, 1, 1, 1, 1,
-2.148235, 0.2929408, -1.485566, 1, 1, 1, 1, 1,
-2.145072, -0.668209, -0.9877261, 1, 1, 1, 1, 1,
-2.14012, -1.477166, -2.593017, 1, 1, 1, 1, 1,
-2.117556, -0.7612225, -2.339581, 1, 1, 1, 1, 1,
-2.111071, -0.08477564, -2.771461, 1, 1, 1, 1, 1,
-2.060727, 0.2308615, -1.385675, 1, 1, 1, 1, 1,
-2.02516, 0.1223035, -1.188487, 1, 1, 1, 1, 1,
-2.017545, -0.2591919, -1.750039, 1, 1, 1, 1, 1,
-2.001045, 0.01217688, -0.6109263, 1, 1, 1, 1, 1,
-1.990577, 0.2975708, -1.221172, 1, 1, 1, 1, 1,
-1.98119, -1.034613, -1.144003, 1, 1, 1, 1, 1,
-1.956924, 1.163242, -1.446931, 1, 1, 1, 1, 1,
-1.950054, -0.7194377, -1.504423, 1, 1, 1, 1, 1,
-1.948176, -1.324757, -2.378611, 1, 1, 1, 1, 1,
-1.918199, -0.7504162, -0.6413702, 0, 0, 1, 1, 1,
-1.916905, 0.4381093, -2.189642, 1, 0, 0, 1, 1,
-1.915777, -0.04276989, 0.2311678, 1, 0, 0, 1, 1,
-1.902796, 0.5680204, -0.1101177, 1, 0, 0, 1, 1,
-1.901353, -0.5536867, -2.079587, 1, 0, 0, 1, 1,
-1.841791, 0.5672423, -1.410135, 1, 0, 0, 1, 1,
-1.831784, 1.094488, -1.281873, 0, 0, 0, 1, 1,
-1.830362, 0.4998809, -3.473907, 0, 0, 0, 1, 1,
-1.824504, -0.06667636, -2.157536, 0, 0, 0, 1, 1,
-1.809094, 0.5259844, -2.692127, 0, 0, 0, 1, 1,
-1.794042, -1.683122, -3.402032, 0, 0, 0, 1, 1,
-1.792611, -0.8392188, 0.1744231, 0, 0, 0, 1, 1,
-1.755143, -1.102255, -2.22279, 0, 0, 0, 1, 1,
-1.749925, 0.9629433, -0.8702437, 1, 1, 1, 1, 1,
-1.745663, 1.13186, -0.9967545, 1, 1, 1, 1, 1,
-1.743352, -2.903699, -2.085891, 1, 1, 1, 1, 1,
-1.737748, -0.7433484, -2.00104, 1, 1, 1, 1, 1,
-1.723324, -0.5539911, -2.666208, 1, 1, 1, 1, 1,
-1.718462, -0.2665182, -1.383104, 1, 1, 1, 1, 1,
-1.673987, -0.3033892, -1.162154, 1, 1, 1, 1, 1,
-1.671914, -0.5857909, -0.4065801, 1, 1, 1, 1, 1,
-1.66817, 0.06666702, -1.545217, 1, 1, 1, 1, 1,
-1.65746, -0.1719798, -1.448932, 1, 1, 1, 1, 1,
-1.656879, 1.828779, 0.4286776, 1, 1, 1, 1, 1,
-1.655869, -0.1274038, 0.5499506, 1, 1, 1, 1, 1,
-1.653531, -0.4059509, -1.164811, 1, 1, 1, 1, 1,
-1.65138, -1.315542, -1.583633, 1, 1, 1, 1, 1,
-1.648725, 0.467989, 0.06124153, 1, 1, 1, 1, 1,
-1.64801, 0.9880176, -0.7572186, 0, 0, 1, 1, 1,
-1.642409, -2.523407, -1.890222, 1, 0, 0, 1, 1,
-1.629388, -0.1894999, -1.51261, 1, 0, 0, 1, 1,
-1.628774, 0.2937466, -2.81103, 1, 0, 0, 1, 1,
-1.626303, -0.584172, -1.24058, 1, 0, 0, 1, 1,
-1.619089, 0.4380954, -0.72637, 1, 0, 0, 1, 1,
-1.609863, -0.4181706, -2.380233, 0, 0, 0, 1, 1,
-1.601982, 2.076622, 0.6180893, 0, 0, 0, 1, 1,
-1.596449, -1.026544, -3.715098, 0, 0, 0, 1, 1,
-1.592938, 1.129432, -0.8008703, 0, 0, 0, 1, 1,
-1.565764, 0.321449, -0.7090105, 0, 0, 0, 1, 1,
-1.555003, -1.374695, -2.321553, 0, 0, 0, 1, 1,
-1.547389, 0.7870675, -0.4690663, 0, 0, 0, 1, 1,
-1.54718, 0.3486806, -3.282888, 1, 1, 1, 1, 1,
-1.543432, -1.17478, -1.062715, 1, 1, 1, 1, 1,
-1.537423, 0.7126675, -0.3716761, 1, 1, 1, 1, 1,
-1.53013, -1.122738, -1.883397, 1, 1, 1, 1, 1,
-1.529811, 0.5519147, -1.015735, 1, 1, 1, 1, 1,
-1.516428, 0.2872266, -1.77102, 1, 1, 1, 1, 1,
-1.495802, -0.5641046, -1.988134, 1, 1, 1, 1, 1,
-1.487256, 2.039934, -0.5514646, 1, 1, 1, 1, 1,
-1.483711, -0.06261594, -0.5057495, 1, 1, 1, 1, 1,
-1.482777, 1.688498, -0.3754126, 1, 1, 1, 1, 1,
-1.470431, 1.117487, -0.1412759, 1, 1, 1, 1, 1,
-1.456511, -0.5921094, -1.054721, 1, 1, 1, 1, 1,
-1.421089, 0.9727533, -2.137682, 1, 1, 1, 1, 1,
-1.403882, 0.6559368, -0.09258323, 1, 1, 1, 1, 1,
-1.40202, 1.123395, -1.699902, 1, 1, 1, 1, 1,
-1.384759, 0.7472429, -1.110761, 0, 0, 1, 1, 1,
-1.361988, -0.08966558, -2.01266, 1, 0, 0, 1, 1,
-1.36097, -0.6200103, -2.70425, 1, 0, 0, 1, 1,
-1.359261, -0.4369549, -1.319126, 1, 0, 0, 1, 1,
-1.354538, 0.7438831, -1.895449, 1, 0, 0, 1, 1,
-1.351092, 1.25032, -1.121452, 1, 0, 0, 1, 1,
-1.331218, -0.1941121, -0.01480274, 0, 0, 0, 1, 1,
-1.321949, 1.655826, -0.2895703, 0, 0, 0, 1, 1,
-1.304216, 0.4121315, -1.778543, 0, 0, 0, 1, 1,
-1.301769, -0.5749315, -2.350878, 0, 0, 0, 1, 1,
-1.295743, -0.6193135, -2.200941, 0, 0, 0, 1, 1,
-1.279458, -1.529383, -2.690436, 0, 0, 0, 1, 1,
-1.276003, -0.9592999, -2.211037, 0, 0, 0, 1, 1,
-1.268245, 0.1259143, -3.366204, 1, 1, 1, 1, 1,
-1.248675, 0.006092575, -1.920479, 1, 1, 1, 1, 1,
-1.247549, -0.7549027, -4.368028, 1, 1, 1, 1, 1,
-1.240963, -0.4371486, -2.123475, 1, 1, 1, 1, 1,
-1.239365, 0.8545054, -1.516418, 1, 1, 1, 1, 1,
-1.232687, -0.08143388, -1.057141, 1, 1, 1, 1, 1,
-1.229642, 0.2719338, -1.030711, 1, 1, 1, 1, 1,
-1.227891, 1.298041, -2.021523, 1, 1, 1, 1, 1,
-1.227205, 0.1900621, -0.4887738, 1, 1, 1, 1, 1,
-1.223646, 0.2179621, -2.184898, 1, 1, 1, 1, 1,
-1.221886, 0.04624442, -1.844011, 1, 1, 1, 1, 1,
-1.214108, -1.165109, -3.133013, 1, 1, 1, 1, 1,
-1.21201, -0.1846914, -1.105179, 1, 1, 1, 1, 1,
-1.211496, 0.6316788, -1.069131, 1, 1, 1, 1, 1,
-1.210383, 2.052449, -1.072708, 1, 1, 1, 1, 1,
-1.199076, -0.8977489, -2.978877, 0, 0, 1, 1, 1,
-1.194027, -2.142392, -3.765794, 1, 0, 0, 1, 1,
-1.188226, -0.8705796, -2.171638, 1, 0, 0, 1, 1,
-1.186276, 1.496685, -1.628984, 1, 0, 0, 1, 1,
-1.182807, -0.6678761, -1.638481, 1, 0, 0, 1, 1,
-1.178813, -0.8455076, -1.860142, 1, 0, 0, 1, 1,
-1.177885, -1.654874, -3.418788, 0, 0, 0, 1, 1,
-1.176031, -1.296642, -3.393292, 0, 0, 0, 1, 1,
-1.167074, 0.5170362, -1.704361, 0, 0, 0, 1, 1,
-1.166797, 0.9134848, -1.253642, 0, 0, 0, 1, 1,
-1.166347, 0.1354337, -1.357009, 0, 0, 0, 1, 1,
-1.165585, -0.08461571, -2.07894, 0, 0, 0, 1, 1,
-1.164285, 1.450442, -1.200114, 0, 0, 0, 1, 1,
-1.161576, -0.3094972, -1.329409, 1, 1, 1, 1, 1,
-1.160986, -0.2783272, -2.434313, 1, 1, 1, 1, 1,
-1.154155, 0.8419418, -2.249161, 1, 1, 1, 1, 1,
-1.152853, 0.8776318, 0.5031877, 1, 1, 1, 1, 1,
-1.148183, -1.309609, -0.9193366, 1, 1, 1, 1, 1,
-1.133857, 0.3743576, -1.610499, 1, 1, 1, 1, 1,
-1.133306, 1.591735, -1.862242, 1, 1, 1, 1, 1,
-1.126274, -0.3581573, 0.1565399, 1, 1, 1, 1, 1,
-1.108114, 0.2886867, -1.73049, 1, 1, 1, 1, 1,
-1.105293, 0.3871292, -1.88464, 1, 1, 1, 1, 1,
-1.097636, -0.06481776, -1.946115, 1, 1, 1, 1, 1,
-1.097219, -0.237687, -1.199981, 1, 1, 1, 1, 1,
-1.094489, -0.7188407, -1.604591, 1, 1, 1, 1, 1,
-1.08204, -0.5188587, 0.02319552, 1, 1, 1, 1, 1,
-1.078595, -2.372031, -2.783318, 1, 1, 1, 1, 1,
-1.076944, 1.142235, -0.9514399, 0, 0, 1, 1, 1,
-1.068817, -0.7689227, -2.188751, 1, 0, 0, 1, 1,
-1.066669, -0.4774137, -1.400584, 1, 0, 0, 1, 1,
-1.059739, -0.05473661, -1.780024, 1, 0, 0, 1, 1,
-1.048612, 0.5662591, -3.11345, 1, 0, 0, 1, 1,
-1.046146, 0.2749439, -0.9824334, 1, 0, 0, 1, 1,
-1.045569, 0.6242616, -1.172086, 0, 0, 0, 1, 1,
-1.044103, 0.4930781, -1.943488, 0, 0, 0, 1, 1,
-1.021392, 0.1494081, -2.616534, 0, 0, 0, 1, 1,
-1.006926, -0.4348839, -2.94361, 0, 0, 0, 1, 1,
-1.003175, -1.075836, -3.338993, 0, 0, 0, 1, 1,
-1.003142, 0.8668277, -1.550369, 0, 0, 0, 1, 1,
-1.002684, 1.404518, -0.7316592, 0, 0, 0, 1, 1,
-1.002395, -0.1984656, -1.739542, 1, 1, 1, 1, 1,
-1.000006, 0.05406953, -1.235419, 1, 1, 1, 1, 1,
-0.9951638, -1.04523, -1.952185, 1, 1, 1, 1, 1,
-0.9885785, -0.5171988, -2.26475, 1, 1, 1, 1, 1,
-0.9868692, -0.06252132, -2.322188, 1, 1, 1, 1, 1,
-0.9641154, -0.03793769, -2.291733, 1, 1, 1, 1, 1,
-0.9560276, -0.2527635, -0.2617292, 1, 1, 1, 1, 1,
-0.951149, 0.4230276, 0.7770012, 1, 1, 1, 1, 1,
-0.9492235, 1.871119, -1.758968, 1, 1, 1, 1, 1,
-0.9467956, 0.2768323, 0.7061436, 1, 1, 1, 1, 1,
-0.9424335, 0.0005697156, -0.5102049, 1, 1, 1, 1, 1,
-0.9407322, -1.001804, -1.407858, 1, 1, 1, 1, 1,
-0.940105, 1.332703, -1.691808, 1, 1, 1, 1, 1,
-0.936082, 0.05210315, -2.758649, 1, 1, 1, 1, 1,
-0.9244887, 0.01065412, -1.916663, 1, 1, 1, 1, 1,
-0.9240743, 0.631218, 0.6649996, 0, 0, 1, 1, 1,
-0.9088405, -0.4287, -2.171736, 1, 0, 0, 1, 1,
-0.9045836, -0.9690918, -2.646896, 1, 0, 0, 1, 1,
-0.9035741, 0.669315, -1.866836, 1, 0, 0, 1, 1,
-0.9029174, -1.641431, -1.077834, 1, 0, 0, 1, 1,
-0.8979608, 0.4813393, -2.239429, 1, 0, 0, 1, 1,
-0.8978639, -1.302136, -1.761104, 0, 0, 0, 1, 1,
-0.8902398, 0.2007264, 0.2159508, 0, 0, 0, 1, 1,
-0.8900465, -0.4857679, -4.270896, 0, 0, 0, 1, 1,
-0.8899751, -1.287592, -2.683051, 0, 0, 0, 1, 1,
-0.8890654, -1.401915, -1.016615, 0, 0, 0, 1, 1,
-0.888812, 1.760533, 0.1298021, 0, 0, 0, 1, 1,
-0.8881453, 0.5634264, -2.298093, 0, 0, 0, 1, 1,
-0.8877402, -1.070145, -2.516058, 1, 1, 1, 1, 1,
-0.8875895, 1.47698, 0.6422587, 1, 1, 1, 1, 1,
-0.8863928, 0.397887, -2.708356, 1, 1, 1, 1, 1,
-0.8833027, 0.315688, 0.05662206, 1, 1, 1, 1, 1,
-0.8822229, -0.2565396, -2.571717, 1, 1, 1, 1, 1,
-0.8771381, 0.06684409, -1.892747, 1, 1, 1, 1, 1,
-0.875127, 0.3027039, -1.06858, 1, 1, 1, 1, 1,
-0.8706729, 0.8085414, -0.2957318, 1, 1, 1, 1, 1,
-0.8686129, 1.455023, -0.09685866, 1, 1, 1, 1, 1,
-0.8642976, 0.4033546, -0.8700829, 1, 1, 1, 1, 1,
-0.8587534, -0.9363056, -3.903963, 1, 1, 1, 1, 1,
-0.857671, -0.94441, -2.336801, 1, 1, 1, 1, 1,
-0.8541183, -0.2268436, -1.221062, 1, 1, 1, 1, 1,
-0.8516672, -0.659735, -0.7865294, 1, 1, 1, 1, 1,
-0.8485711, -0.0763672, -1.888718, 1, 1, 1, 1, 1,
-0.8377787, 0.5081431, 1.125142, 0, 0, 1, 1, 1,
-0.836633, -0.3404963, -1.201479, 1, 0, 0, 1, 1,
-0.8359759, -0.9076493, -2.881114, 1, 0, 0, 1, 1,
-0.8301491, 0.6362872, -0.8982472, 1, 0, 0, 1, 1,
-0.8277628, 1.930869, -0.181766, 1, 0, 0, 1, 1,
-0.8259717, 0.9096765, 0.9524271, 1, 0, 0, 1, 1,
-0.8256898, -0.2627087, -2.215339, 0, 0, 0, 1, 1,
-0.8254951, 1.035526, -0.3325472, 0, 0, 0, 1, 1,
-0.8247328, 1.037809, -0.4767238, 0, 0, 0, 1, 1,
-0.8224988, -0.5075832, -0.8971756, 0, 0, 0, 1, 1,
-0.8198418, -0.4909379, -0.7267611, 0, 0, 0, 1, 1,
-0.8160235, 0.06640104, -2.818757, 0, 0, 0, 1, 1,
-0.814752, -2.221749, -3.026342, 0, 0, 0, 1, 1,
-0.8134218, -0.8437608, -2.635954, 1, 1, 1, 1, 1,
-0.813356, 1.679437, -0.6605317, 1, 1, 1, 1, 1,
-0.8089726, -1.050564, -1.620267, 1, 1, 1, 1, 1,
-0.7994763, -0.7912806, -2.899727, 1, 1, 1, 1, 1,
-0.7985419, -0.1014646, -3.944293, 1, 1, 1, 1, 1,
-0.7966979, -0.2802623, -1.333985, 1, 1, 1, 1, 1,
-0.7948099, 0.9661399, -0.284387, 1, 1, 1, 1, 1,
-0.7924525, 0.5707451, -2.861017, 1, 1, 1, 1, 1,
-0.7914483, 0.7654648, -1.446044, 1, 1, 1, 1, 1,
-0.7900125, 0.892335, -1.34129, 1, 1, 1, 1, 1,
-0.7860026, 0.4789159, -1.335579, 1, 1, 1, 1, 1,
-0.7817182, 2.069216, 0.2847819, 1, 1, 1, 1, 1,
-0.7813685, 0.3896534, -2.344769, 1, 1, 1, 1, 1,
-0.7808913, 0.6034296, -1.893344, 1, 1, 1, 1, 1,
-0.7797719, -0.617366, -2.662961, 1, 1, 1, 1, 1,
-0.7693013, -0.4845648, -5.82122, 0, 0, 1, 1, 1,
-0.7678378, -0.8770534, -3.363167, 1, 0, 0, 1, 1,
-0.7665054, -0.4166611, -0.5772274, 1, 0, 0, 1, 1,
-0.7657805, -0.2456096, -3.847798, 1, 0, 0, 1, 1,
-0.7613539, -0.7054954, -0.9439825, 1, 0, 0, 1, 1,
-0.7591615, 1.720307, 1.574296, 1, 0, 0, 1, 1,
-0.7587063, 0.1325346, -1.666626, 0, 0, 0, 1, 1,
-0.7579961, -0.7073203, -3.676632, 0, 0, 0, 1, 1,
-0.7552764, -0.6722757, -2.703467, 0, 0, 0, 1, 1,
-0.7519423, -1.081425, -1.701829, 0, 0, 0, 1, 1,
-0.7510589, -1.485118, -3.082441, 0, 0, 0, 1, 1,
-0.7508189, -0.7553706, -2.380266, 0, 0, 0, 1, 1,
-0.7487745, 0.573709, 0.5752069, 0, 0, 0, 1, 1,
-0.7467278, 0.1331204, -1.128782, 1, 1, 1, 1, 1,
-0.7454987, 1.073417, -1.489868, 1, 1, 1, 1, 1,
-0.7395203, -0.0403617, -1.77873, 1, 1, 1, 1, 1,
-0.7306901, -0.4464098, -1.348727, 1, 1, 1, 1, 1,
-0.7247531, 2.447896, -1.725621, 1, 1, 1, 1, 1,
-0.7232004, 1.136515, -0.2498879, 1, 1, 1, 1, 1,
-0.7230169, 0.9161946, -0.6905429, 1, 1, 1, 1, 1,
-0.7200095, -0.6761689, -2.246024, 1, 1, 1, 1, 1,
-0.7122695, -0.280615, -1.236286, 1, 1, 1, 1, 1,
-0.7103024, 0.903106, 0.4868947, 1, 1, 1, 1, 1,
-0.7102458, 0.9451081, 0.6092485, 1, 1, 1, 1, 1,
-0.707665, -0.05778226, -2.889916, 1, 1, 1, 1, 1,
-0.7070729, 0.125041, -0.7464183, 1, 1, 1, 1, 1,
-0.7020889, 2.343218, -2.025681, 1, 1, 1, 1, 1,
-0.7017447, 0.9993029, -2.678868, 1, 1, 1, 1, 1,
-0.6980531, 0.1454707, -2.090843, 0, 0, 1, 1, 1,
-0.6903478, -1.805642, -2.350083, 1, 0, 0, 1, 1,
-0.6881208, 0.2180303, -2.653922, 1, 0, 0, 1, 1,
-0.6859748, 0.9617145, -0.5608087, 1, 0, 0, 1, 1,
-0.6842749, -0.9409144, -2.686281, 1, 0, 0, 1, 1,
-0.6842239, -0.4722916, -2.188732, 1, 0, 0, 1, 1,
-0.678638, -0.08340012, -3.719935, 0, 0, 0, 1, 1,
-0.6700132, 0.02724154, -0.1098419, 0, 0, 0, 1, 1,
-0.6690891, -1.154526, -0.1388829, 0, 0, 0, 1, 1,
-0.6631765, 0.2051536, -0.381082, 0, 0, 0, 1, 1,
-0.6601826, -0.891892, -1.644595, 0, 0, 0, 1, 1,
-0.6493002, -0.2832429, -1.711607, 0, 0, 0, 1, 1,
-0.6484808, -0.3457197, -1.447828, 0, 0, 0, 1, 1,
-0.6448665, -0.03424379, -0.940154, 1, 1, 1, 1, 1,
-0.6420136, -1.124993, -2.027196, 1, 1, 1, 1, 1,
-0.6366315, 0.3290139, -1.476097, 1, 1, 1, 1, 1,
-0.6276444, 1.060851, -1.867212, 1, 1, 1, 1, 1,
-0.624753, 1.346733, -1.139972, 1, 1, 1, 1, 1,
-0.6170881, -0.2388019, -2.285407, 1, 1, 1, 1, 1,
-0.6168894, -0.7410268, -1.418582, 1, 1, 1, 1, 1,
-0.6143719, -0.04692892, -2.45516, 1, 1, 1, 1, 1,
-0.6142423, 0.2497541, -0.5721939, 1, 1, 1, 1, 1,
-0.5997474, -0.9683326, -3.409584, 1, 1, 1, 1, 1,
-0.5988119, -0.9375219, -1.073299, 1, 1, 1, 1, 1,
-0.5977544, -0.4160591, -1.955572, 1, 1, 1, 1, 1,
-0.5975804, -0.6347858, -3.063198, 1, 1, 1, 1, 1,
-0.5962945, -1.87753, -2.99061, 1, 1, 1, 1, 1,
-0.5945947, 1.754377, -0.07496031, 1, 1, 1, 1, 1,
-0.5945584, -1.077136, -2.306263, 0, 0, 1, 1, 1,
-0.5933331, 0.9586265, -0.1739891, 1, 0, 0, 1, 1,
-0.5904241, -2.474224, -2.759293, 1, 0, 0, 1, 1,
-0.5870533, -0.2501461, -1.423795, 1, 0, 0, 1, 1,
-0.5832925, -0.5745561, -0.8289512, 1, 0, 0, 1, 1,
-0.5829045, -0.2597975, -1.493642, 1, 0, 0, 1, 1,
-0.5804508, -0.1839764, -2.984024, 0, 0, 0, 1, 1,
-0.5793144, 2.498449, 0.7682456, 0, 0, 0, 1, 1,
-0.5788038, 0.6921594, -1.443573, 0, 0, 0, 1, 1,
-0.5774659, -1.497168, -1.915109, 0, 0, 0, 1, 1,
-0.5764118, 0.01596934, -2.943352, 0, 0, 0, 1, 1,
-0.5714192, -1.722484, -2.066415, 0, 0, 0, 1, 1,
-0.5713025, -1.220697, -2.546569, 0, 0, 0, 1, 1,
-0.5699769, 0.02059068, -2.448977, 1, 1, 1, 1, 1,
-0.5653601, 0.8834301, -0.9248289, 1, 1, 1, 1, 1,
-0.5615474, 1.025953, 2.077501, 1, 1, 1, 1, 1,
-0.5576473, 0.3494377, -0.6388808, 1, 1, 1, 1, 1,
-0.5569475, 0.169494, -1.550591, 1, 1, 1, 1, 1,
-0.5549015, -1.334652, -2.066028, 1, 1, 1, 1, 1,
-0.5526999, 1.234186, 1.422238, 1, 1, 1, 1, 1,
-0.5492111, 0.190349, -1.803938, 1, 1, 1, 1, 1,
-0.5484211, -0.2706963, -1.908819, 1, 1, 1, 1, 1,
-0.5477037, 0.02256316, -0.5482019, 1, 1, 1, 1, 1,
-0.5438774, -1.000998, -2.562804, 1, 1, 1, 1, 1,
-0.5408141, -0.09793393, -2.353295, 1, 1, 1, 1, 1,
-0.5348015, -0.1517201, -1.970204, 1, 1, 1, 1, 1,
-0.5323288, 1.945096, 0.6746034, 1, 1, 1, 1, 1,
-0.5287058, 0.594855, -1.754259, 1, 1, 1, 1, 1,
-0.5269516, -1.180992, -2.375175, 0, 0, 1, 1, 1,
-0.5241933, 0.8011159, -0.0582168, 1, 0, 0, 1, 1,
-0.5167548, -1.138699, -3.15958, 1, 0, 0, 1, 1,
-0.5157039, -0.5622799, -1.505824, 1, 0, 0, 1, 1,
-0.5080339, 1.883951, -0.1693127, 1, 0, 0, 1, 1,
-0.5031482, 0.9272131, -1.182685, 1, 0, 0, 1, 1,
-0.5008703, -0.4595508, -2.283654, 0, 0, 0, 1, 1,
-0.5002992, 0.03958988, -1.681883, 0, 0, 0, 1, 1,
-0.4972909, 0.3553204, -1.183363, 0, 0, 0, 1, 1,
-0.4903044, -0.2496724, -1.633976, 0, 0, 0, 1, 1,
-0.4862243, -0.4026179, -1.720614, 0, 0, 0, 1, 1,
-0.4820118, -0.3551491, -2.801529, 0, 0, 0, 1, 1,
-0.4796473, 0.5481924, -0.1487089, 0, 0, 0, 1, 1,
-0.4790734, 0.473046, -0.6720043, 1, 1, 1, 1, 1,
-0.4788657, 0.153599, -1.100726, 1, 1, 1, 1, 1,
-0.4779988, -1.755542, -1.050594, 1, 1, 1, 1, 1,
-0.4688775, 0.8953185, 1.570059, 1, 1, 1, 1, 1,
-0.4659168, 0.3803158, -1.72082, 1, 1, 1, 1, 1,
-0.4648992, -0.734021, -3.040268, 1, 1, 1, 1, 1,
-0.4648629, 0.5084971, -1.704459, 1, 1, 1, 1, 1,
-0.4556096, 0.2009306, -2.852191, 1, 1, 1, 1, 1,
-0.4506602, -0.04192529, -1.743347, 1, 1, 1, 1, 1,
-0.4486392, 0.8731283, -2.020149, 1, 1, 1, 1, 1,
-0.4482212, 0.6056025, -1.114679, 1, 1, 1, 1, 1,
-0.4468376, -1.039373, -2.332884, 1, 1, 1, 1, 1,
-0.4388677, -1.599157, -2.915815, 1, 1, 1, 1, 1,
-0.4375856, 1.098049, -1.786436, 1, 1, 1, 1, 1,
-0.4357125, -0.07556462, -2.062393, 1, 1, 1, 1, 1,
-0.432285, -0.2367611, -2.214058, 0, 0, 1, 1, 1,
-0.4315619, -0.1606385, -1.616392, 1, 0, 0, 1, 1,
-0.4302565, -0.7929159, -3.097168, 1, 0, 0, 1, 1,
-0.4213896, -0.4961289, -1.660098, 1, 0, 0, 1, 1,
-0.4196664, -1.105776, -2.168042, 1, 0, 0, 1, 1,
-0.4143212, 1.804638, -0.3901528, 1, 0, 0, 1, 1,
-0.4132813, -0.7612903, -2.797527, 0, 0, 0, 1, 1,
-0.4123914, -0.3585254, -0.9807285, 0, 0, 0, 1, 1,
-0.410455, -1.091703, -5.290672, 0, 0, 0, 1, 1,
-0.4081658, 1.165156, -0.1318685, 0, 0, 0, 1, 1,
-0.4060337, -0.451237, -1.409685, 0, 0, 0, 1, 1,
-0.4045275, -0.1568389, -1.737604, 0, 0, 0, 1, 1,
-0.4037248, -0.8866714, -4.329237, 0, 0, 0, 1, 1,
-0.4024312, -0.6706641, -2.392674, 1, 1, 1, 1, 1,
-0.4021148, -0.6651495, -1.702385, 1, 1, 1, 1, 1,
-0.401314, -1.834872, -2.216172, 1, 1, 1, 1, 1,
-0.4012784, -1.206684, -2.872866, 1, 1, 1, 1, 1,
-0.396944, 0.2869042, 0.2677056, 1, 1, 1, 1, 1,
-0.395793, -0.3192783, -1.396323, 1, 1, 1, 1, 1,
-0.3951505, 0.05824267, -2.211914, 1, 1, 1, 1, 1,
-0.3931904, 0.2390413, -0.4424521, 1, 1, 1, 1, 1,
-0.392708, -0.2576591, -2.235989, 1, 1, 1, 1, 1,
-0.3913095, 1.680186, -0.7996816, 1, 1, 1, 1, 1,
-0.386342, -0.8184469, -3.08027, 1, 1, 1, 1, 1,
-0.3841969, -0.4308901, -2.001886, 1, 1, 1, 1, 1,
-0.3834997, -0.06549193, -2.032716, 1, 1, 1, 1, 1,
-0.3775546, 0.3416322, -0.9426249, 1, 1, 1, 1, 1,
-0.3734939, 0.5341935, -2.92981, 1, 1, 1, 1, 1,
-0.3719158, -0.2172288, -0.7486548, 0, 0, 1, 1, 1,
-0.3715972, 1.286077, -0.6080965, 1, 0, 0, 1, 1,
-0.3710934, -0.7305673, -3.91789, 1, 0, 0, 1, 1,
-0.3694445, 0.2818355, -0.6473122, 1, 0, 0, 1, 1,
-0.3664995, -1.306753, -3.605315, 1, 0, 0, 1, 1,
-0.3653516, 0.3455195, -2.351605, 1, 0, 0, 1, 1,
-0.3590404, 0.3077882, -0.6711066, 0, 0, 0, 1, 1,
-0.3574389, 1.516499, -2.90143, 0, 0, 0, 1, 1,
-0.3531078, -1.538454, -3.593533, 0, 0, 0, 1, 1,
-0.3529561, -1.432328, -2.568112, 0, 0, 0, 1, 1,
-0.3496981, 0.3332378, -0.3557057, 0, 0, 0, 1, 1,
-0.3486871, 0.09506668, -0.1592183, 0, 0, 0, 1, 1,
-0.3479789, 0.594772, -1.077954, 0, 0, 0, 1, 1,
-0.3474079, 0.105429, -1.956181, 1, 1, 1, 1, 1,
-0.3439892, -0.03509678, -0.7721511, 1, 1, 1, 1, 1,
-0.3433667, 0.2901172, -1.992159, 1, 1, 1, 1, 1,
-0.3377473, 0.3188244, -1.676513, 1, 1, 1, 1, 1,
-0.3370914, 0.7832053, -1.60795, 1, 1, 1, 1, 1,
-0.3368149, 1.532013, 0.8024102, 1, 1, 1, 1, 1,
-0.3321807, 0.918346, -1.267106, 1, 1, 1, 1, 1,
-0.3284723, 0.4419927, -1.306235, 1, 1, 1, 1, 1,
-0.3262701, -0.5011513, -2.851074, 1, 1, 1, 1, 1,
-0.3242345, 0.600278, -0.1766106, 1, 1, 1, 1, 1,
-0.3240997, 0.07652435, 0.08218089, 1, 1, 1, 1, 1,
-0.3233159, -1.267628, -3.799205, 1, 1, 1, 1, 1,
-0.3199414, -0.08790661, -1.516251, 1, 1, 1, 1, 1,
-0.3131571, 0.504061, -0.7774352, 1, 1, 1, 1, 1,
-0.3128073, 0.8381653, 1.000821, 1, 1, 1, 1, 1,
-0.312732, 1.1656, -1.397022, 0, 0, 1, 1, 1,
-0.3117506, 1.082587, -1.169034, 1, 0, 0, 1, 1,
-0.3105487, -0.9341972, -2.310747, 1, 0, 0, 1, 1,
-0.3098084, 0.3167543, -0.81104, 1, 0, 0, 1, 1,
-0.3092881, -0.0166186, 0.3805133, 1, 0, 0, 1, 1,
-0.308587, -0.8269885, -5.001733, 1, 0, 0, 1, 1,
-0.3076541, 1.410375, -0.4567462, 0, 0, 0, 1, 1,
-0.306395, -1.446419, -2.241266, 0, 0, 0, 1, 1,
-0.30075, 0.1285339, -0.4327766, 0, 0, 0, 1, 1,
-0.2983922, 1.090976, 1.85199, 0, 0, 0, 1, 1,
-0.2950245, -0.3628275, -0.9803024, 0, 0, 0, 1, 1,
-0.2942341, -0.2980401, -4.196713, 0, 0, 0, 1, 1,
-0.2940362, 1.10432, -0.5264819, 0, 0, 0, 1, 1,
-0.2935352, -0.6856926, -1.674314, 1, 1, 1, 1, 1,
-0.2919595, -1.428479, -4.391273, 1, 1, 1, 1, 1,
-0.2910281, 1.405866, -0.9626128, 1, 1, 1, 1, 1,
-0.2864927, 0.5299798, -0.8077114, 1, 1, 1, 1, 1,
-0.285964, 0.9256148, -2.123107, 1, 1, 1, 1, 1,
-0.2839952, -0.5552149, -2.917884, 1, 1, 1, 1, 1,
-0.2808162, -0.4078889, -3.521519, 1, 1, 1, 1, 1,
-0.2797161, 0.8316126, 3.197757, 1, 1, 1, 1, 1,
-0.2746412, -0.9231719, -1.578108, 1, 1, 1, 1, 1,
-0.2716314, 0.522127, -1.268553, 1, 1, 1, 1, 1,
-0.2695048, 0.7097024, -0.2018227, 1, 1, 1, 1, 1,
-0.2682676, -0.02528844, -1.615476, 1, 1, 1, 1, 1,
-0.2624058, -1.31599, -2.845374, 1, 1, 1, 1, 1,
-0.2557548, -0.5366738, -1.325679, 1, 1, 1, 1, 1,
-0.2554673, -0.0327847, -2.598673, 1, 1, 1, 1, 1,
-0.2547261, -1.408222, -3.117552, 0, 0, 1, 1, 1,
-0.2542657, 0.9459732, -0.9648669, 1, 0, 0, 1, 1,
-0.2525736, -0.5890456, -4.184526, 1, 0, 0, 1, 1,
-0.2511122, 1.031324, 0.33103, 1, 0, 0, 1, 1,
-0.250772, -1.221824, -2.945262, 1, 0, 0, 1, 1,
-0.2497293, 0.03774314, -1.432769, 1, 0, 0, 1, 1,
-0.2418895, 1.802916, 0.08994858, 0, 0, 0, 1, 1,
-0.2349537, 0.721239, -0.6624112, 0, 0, 0, 1, 1,
-0.2341103, -1.249205, -2.493754, 0, 0, 0, 1, 1,
-0.2318743, -0.3449857, -3.768016, 0, 0, 0, 1, 1,
-0.2167625, 0.5283678, -0.5120201, 0, 0, 0, 1, 1,
-0.2167605, -0.6129937, -2.914231, 0, 0, 0, 1, 1,
-0.212937, 0.4162591, -1.279444, 0, 0, 0, 1, 1,
-0.2089328, -0.6604654, -2.195595, 1, 1, 1, 1, 1,
-0.2082125, 0.6920733, -1.694841, 1, 1, 1, 1, 1,
-0.207074, 1.817769, -0.6638699, 1, 1, 1, 1, 1,
-0.1953344, -0.3560652, -2.861398, 1, 1, 1, 1, 1,
-0.1949825, 0.8063167, -0.8676354, 1, 1, 1, 1, 1,
-0.1946815, -0.04943476, -1.014383, 1, 1, 1, 1, 1,
-0.1906696, 0.7174583, 0.4222599, 1, 1, 1, 1, 1,
-0.1895838, -2.859379, -2.266695, 1, 1, 1, 1, 1,
-0.1857638, 0.7733744, -0.3139437, 1, 1, 1, 1, 1,
-0.1850596, -1.057129, -4.998613, 1, 1, 1, 1, 1,
-0.1833115, 0.6883559, 0.6289934, 1, 1, 1, 1, 1,
-0.1797602, 0.03520402, -2.816089, 1, 1, 1, 1, 1,
-0.1787242, 1.059057, -1.075988, 1, 1, 1, 1, 1,
-0.1779651, -1.615863, -2.974857, 1, 1, 1, 1, 1,
-0.1723809, 0.01141822, -2.217511, 1, 1, 1, 1, 1,
-0.1684239, -0.501503, -2.874958, 0, 0, 1, 1, 1,
-0.1679767, -1.156188, -2.436939, 1, 0, 0, 1, 1,
-0.1507285, -0.4669492, -5.824849, 1, 0, 0, 1, 1,
-0.1430712, 0.1162804, -0.3106878, 1, 0, 0, 1, 1,
-0.139998, 1.515979, -0.2688064, 1, 0, 0, 1, 1,
-0.1384826, 0.9921842, -1.568149, 1, 0, 0, 1, 1,
-0.1384181, -1.617025, -3.375407, 0, 0, 0, 1, 1,
-0.1354026, 0.2406106, -0.7736548, 0, 0, 0, 1, 1,
-0.1332458, -1.365742, -2.862861, 0, 0, 0, 1, 1,
-0.1329486, -1.183752, -4.681271, 0, 0, 0, 1, 1,
-0.1312006, -1.46205, -3.994558, 0, 0, 0, 1, 1,
-0.1286711, 0.4832324, 0.9916286, 0, 0, 0, 1, 1,
-0.1286621, 1.224241, 0.9293422, 0, 0, 0, 1, 1,
-0.1268989, 0.2745461, 0.223233, 1, 1, 1, 1, 1,
-0.1150217, -0.7426547, -1.8134, 1, 1, 1, 1, 1,
-0.1127343, 0.278553, -0.5192876, 1, 1, 1, 1, 1,
-0.1087193, 0.4047446, -0.008509707, 1, 1, 1, 1, 1,
-0.1061024, -1.040693, -4.125886, 1, 1, 1, 1, 1,
-0.1048828, 0.1264779, -0.5771903, 1, 1, 1, 1, 1,
-0.1033115, -0.8287205, -2.045497, 1, 1, 1, 1, 1,
-0.1029501, 1.48125, -0.01487392, 1, 1, 1, 1, 1,
-0.102235, -0.2498286, -4.415682, 1, 1, 1, 1, 1,
-0.1016949, -2.311945, -3.227435, 1, 1, 1, 1, 1,
-0.09842522, -1.896974, -3.990041, 1, 1, 1, 1, 1,
-0.09538706, 1.215291, 0.1919803, 1, 1, 1, 1, 1,
-0.0947783, -0.4913902, -1.95976, 1, 1, 1, 1, 1,
-0.09312072, 1.098702, 0.8802176, 1, 1, 1, 1, 1,
-0.08838087, 2.172546, -0.6771322, 1, 1, 1, 1, 1,
-0.0879928, 0.3958604, -0.8303098, 0, 0, 1, 1, 1,
-0.08743118, 2.184633, 0.9565042, 1, 0, 0, 1, 1,
-0.08063409, 1.144375, -0.2828467, 1, 0, 0, 1, 1,
-0.07595308, -0.8088995, -1.966532, 1, 0, 0, 1, 1,
-0.0699112, -1.648037, -4.032124, 1, 0, 0, 1, 1,
-0.06790733, 0.1859644, 0.4367037, 1, 0, 0, 1, 1,
-0.06720006, 0.1024674, 0.1912642, 0, 0, 0, 1, 1,
-0.06663764, 0.1184575, 0.3743382, 0, 0, 0, 1, 1,
-0.0660595, 0.3350784, -0.7391734, 0, 0, 0, 1, 1,
-0.06598356, 1.504327, -0.3440059, 0, 0, 0, 1, 1,
-0.05996903, 0.0864834, 1.50424, 0, 0, 0, 1, 1,
-0.05942176, 0.522556, -1.094502, 0, 0, 0, 1, 1,
-0.05934047, -0.1635138, -4.158368, 0, 0, 0, 1, 1,
-0.05164225, -0.008418816, -1.110901, 1, 1, 1, 1, 1,
-0.05143284, -0.9022363, -2.468604, 1, 1, 1, 1, 1,
-0.04934055, -1.48904, -2.415598, 1, 1, 1, 1, 1,
-0.04856556, -0.8781353, -3.635728, 1, 1, 1, 1, 1,
-0.0429683, 0.186202, 1.589823, 1, 1, 1, 1, 1,
-0.04163499, -0.7119844, -3.115942, 1, 1, 1, 1, 1,
-0.03739552, -0.9871674, -2.688356, 1, 1, 1, 1, 1,
-0.03289072, 1.360076, 0.5400323, 1, 1, 1, 1, 1,
-0.03149959, -0.3342688, -2.488881, 1, 1, 1, 1, 1,
-0.0296441, 0.4290085, 0.2011971, 1, 1, 1, 1, 1,
-0.02935696, -0.3602173, -4.573475, 1, 1, 1, 1, 1,
-0.02868231, -1.265123, -2.491035, 1, 1, 1, 1, 1,
-0.02361874, 0.4466691, 0.6403677, 1, 1, 1, 1, 1,
-0.02308198, 0.2121292, -0.1461423, 1, 1, 1, 1, 1,
-0.01953275, 0.7124858, 0.3334883, 1, 1, 1, 1, 1,
-0.01936256, 0.2847265, -0.9634608, 0, 0, 1, 1, 1,
-0.01927162, 1.45735, -0.3825436, 1, 0, 0, 1, 1,
-0.0149505, 0.8894702, 1.135282, 1, 0, 0, 1, 1,
-0.01432798, -0.603524, -3.039348, 1, 0, 0, 1, 1,
-0.01161061, -0.9079799, -2.502087, 1, 0, 0, 1, 1,
-0.01115291, -0.6514786, -1.339767, 1, 0, 0, 1, 1,
-0.007506596, 0.6731296, 0.7412878, 0, 0, 0, 1, 1,
-0.004896443, -0.7652031, -2.482855, 0, 0, 0, 1, 1,
-0.004019934, 0.6923086, -0.9021625, 0, 0, 0, 1, 1,
-0.001832169, 0.1767284, -0.2661035, 0, 0, 0, 1, 1,
0.001151374, -1.969157, 4.885962, 0, 0, 0, 1, 1,
0.002021949, -0.6206268, 4.242584, 0, 0, 0, 1, 1,
0.002452947, 0.4563343, 0.3856086, 0, 0, 0, 1, 1,
0.004843074, 0.9042981, 0.7897251, 1, 1, 1, 1, 1,
0.006426667, -1.11138, 3.438859, 1, 1, 1, 1, 1,
0.01127564, -0.1191049, 3.203634, 1, 1, 1, 1, 1,
0.01375791, 1.15362, -0.9459577, 1, 1, 1, 1, 1,
0.0162628, -0.1580482, 2.125532, 1, 1, 1, 1, 1,
0.01696706, -0.2554481, 2.895819, 1, 1, 1, 1, 1,
0.01815126, -1.248397, 2.605226, 1, 1, 1, 1, 1,
0.02229198, -1.29315, 3.042502, 1, 1, 1, 1, 1,
0.02263517, 1.312305, 0.5760281, 1, 1, 1, 1, 1,
0.02330006, -0.3089255, 2.437585, 1, 1, 1, 1, 1,
0.02358741, -1.050118, 1.738311, 1, 1, 1, 1, 1,
0.02405884, -0.2317697, 2.412462, 1, 1, 1, 1, 1,
0.02781069, -0.2127934, 2.830892, 1, 1, 1, 1, 1,
0.02937427, 0.6682102, -0.4663793, 1, 1, 1, 1, 1,
0.03708101, -0.1672282, 1.690493, 1, 1, 1, 1, 1,
0.04065813, 0.1801289, 1.101771, 0, 0, 1, 1, 1,
0.04786373, -0.8397231, 3.144107, 1, 0, 0, 1, 1,
0.05081064, -0.6516326, 4.651837, 1, 0, 0, 1, 1,
0.05092013, 0.7169273, 1.41344, 1, 0, 0, 1, 1,
0.0509272, -2.38063, 3.666466, 1, 0, 0, 1, 1,
0.05191358, -0.1165101, 2.885918, 1, 0, 0, 1, 1,
0.05293867, -0.3865416, 3.514888, 0, 0, 0, 1, 1,
0.05429473, 0.3005567, 0.5459655, 0, 0, 0, 1, 1,
0.05484622, 1.012754, 0.5248672, 0, 0, 0, 1, 1,
0.05628764, -0.1546045, 1.598717, 0, 0, 0, 1, 1,
0.05680715, -0.1087064, 1.43639, 0, 0, 0, 1, 1,
0.06200917, -0.8488448, 1.83157, 0, 0, 0, 1, 1,
0.06240324, 1.421443, 0.5133222, 0, 0, 0, 1, 1,
0.0624304, 0.8826742, -0.4628822, 1, 1, 1, 1, 1,
0.06288787, -0.8563317, 4.870277, 1, 1, 1, 1, 1,
0.06383024, -1.115502, 2.246548, 1, 1, 1, 1, 1,
0.06383498, 1.414509, -0.2832776, 1, 1, 1, 1, 1,
0.07105473, -3.675674, 3.219744, 1, 1, 1, 1, 1,
0.07563838, 0.09866282, 1.316146, 1, 1, 1, 1, 1,
0.08118234, -1.02335, 3.733538, 1, 1, 1, 1, 1,
0.08208132, 0.2832161, -0.1685849, 1, 1, 1, 1, 1,
0.08587835, 1.395322, -0.04963798, 1, 1, 1, 1, 1,
0.08958134, 0.4353809, -0.6601672, 1, 1, 1, 1, 1,
0.09329533, -1.725197, 3.825701, 1, 1, 1, 1, 1,
0.09461409, -0.9245901, 2.499563, 1, 1, 1, 1, 1,
0.09910666, 0.1959257, 1.596244, 1, 1, 1, 1, 1,
0.1001616, 1.541512, 0.2727028, 1, 1, 1, 1, 1,
0.1050205, -0.7561527, 4.040202, 1, 1, 1, 1, 1,
0.106178, -1.351249, 1.550171, 0, 0, 1, 1, 1,
0.1105485, 0.09008523, 0.9968377, 1, 0, 0, 1, 1,
0.1140167, -0.3764428, 2.773818, 1, 0, 0, 1, 1,
0.1143733, 0.9722241, 0.3288999, 1, 0, 0, 1, 1,
0.1162061, 0.4865895, 0.779485, 1, 0, 0, 1, 1,
0.1166133, 1.063349, 0.5845842, 1, 0, 0, 1, 1,
0.1259495, 0.1450932, 1.48469, 0, 0, 0, 1, 1,
0.1319018, 1.099377, 0.6122106, 0, 0, 0, 1, 1,
0.1327156, 1.124709, -0.7917022, 0, 0, 0, 1, 1,
0.1404581, -1.44616, 2.570147, 0, 0, 0, 1, 1,
0.143839, -0.1986001, 0.8923257, 0, 0, 0, 1, 1,
0.143971, 1.448455, 1.218667, 0, 0, 0, 1, 1,
0.144858, 0.2187053, 0.5340273, 0, 0, 0, 1, 1,
0.1449828, 0.450851, 1.119707, 1, 1, 1, 1, 1,
0.1467798, -0.7830141, 2.90585, 1, 1, 1, 1, 1,
0.1505276, -0.5637713, 2.737329, 1, 1, 1, 1, 1,
0.1522074, 1.564057, 1.459845, 1, 1, 1, 1, 1,
0.15306, -0.9551982, 1.841265, 1, 1, 1, 1, 1,
0.1586278, 0.2444869, 0.3361271, 1, 1, 1, 1, 1,
0.1595658, 1.349938, -1.156333, 1, 1, 1, 1, 1,
0.1617266, 0.338531, -0.561828, 1, 1, 1, 1, 1,
0.1674694, 1.05369, -1.400615, 1, 1, 1, 1, 1,
0.167483, 0.6150846, 0.1793768, 1, 1, 1, 1, 1,
0.1704065, 1.023116, 2.004595, 1, 1, 1, 1, 1,
0.1717206, 0.3742923, -0.753446, 1, 1, 1, 1, 1,
0.1726169, 0.4939326, -0.908839, 1, 1, 1, 1, 1,
0.1733845, 1.164721, 1.311378, 1, 1, 1, 1, 1,
0.1762849, 0.247801, 0.9511009, 1, 1, 1, 1, 1,
0.1776187, 0.9071723, 0.8188847, 0, 0, 1, 1, 1,
0.1784364, 0.8780348, 2.054051, 1, 0, 0, 1, 1,
0.1831344, -0.3538278, 2.671555, 1, 0, 0, 1, 1,
0.1863707, -1.0887, 4.076273, 1, 0, 0, 1, 1,
0.1880927, 1.153521, 1.675682, 1, 0, 0, 1, 1,
0.1892373, -1.162122, 2.646033, 1, 0, 0, 1, 1,
0.1892495, -0.0244264, -0.3092127, 0, 0, 0, 1, 1,
0.1938237, 0.3846965, 0.7646032, 0, 0, 0, 1, 1,
0.194742, -0.7965398, 1.732298, 0, 0, 0, 1, 1,
0.1950057, 0.8505676, 0.4371176, 0, 0, 0, 1, 1,
0.1967801, 0.166337, 1.263743, 0, 0, 0, 1, 1,
0.197264, -0.6278418, 2.787388, 0, 0, 0, 1, 1,
0.1981734, -1.693905, 2.218237, 0, 0, 0, 1, 1,
0.1992913, 0.08998992, -0.6956251, 1, 1, 1, 1, 1,
0.2001391, 0.7089857, 0.8797262, 1, 1, 1, 1, 1,
0.2013308, -0.1523129, 1.643483, 1, 1, 1, 1, 1,
0.2036308, -1.095724, 2.860468, 1, 1, 1, 1, 1,
0.2037924, -1.430512, 2.36265, 1, 1, 1, 1, 1,
0.2059434, -0.24154, 1.955452, 1, 1, 1, 1, 1,
0.2065414, 0.8160043, -0.6105442, 1, 1, 1, 1, 1,
0.2092867, -0.3559446, 1.934037, 1, 1, 1, 1, 1,
0.2093899, -1.105695, 2.949099, 1, 1, 1, 1, 1,
0.2128482, -0.2663894, 1.510486, 1, 1, 1, 1, 1,
0.2165133, -0.4697869, 2.756843, 1, 1, 1, 1, 1,
0.226807, 1.307534, 0.3302611, 1, 1, 1, 1, 1,
0.2434248, 0.6249743, 1.167411, 1, 1, 1, 1, 1,
0.2440909, -0.5428043, 1.522106, 1, 1, 1, 1, 1,
0.2458975, 1.604982, -1.969702, 1, 1, 1, 1, 1,
0.25257, -0.4645262, 3.147869, 0, 0, 1, 1, 1,
0.253452, -1.436144, 2.032551, 1, 0, 0, 1, 1,
0.2535047, -1.169202, 4.863039, 1, 0, 0, 1, 1,
0.2562252, 0.0774147, 1.035804, 1, 0, 0, 1, 1,
0.2570133, 0.04479001, 1.424442, 1, 0, 0, 1, 1,
0.2577522, 0.1382307, 3.367981, 1, 0, 0, 1, 1,
0.257815, 1.166037, -0.9334529, 0, 0, 0, 1, 1,
0.2595899, 0.3167954, 2.075924, 0, 0, 0, 1, 1,
0.2623578, -0.2454192, 3.018989, 0, 0, 0, 1, 1,
0.2703125, 2.107707, -0.3882426, 0, 0, 0, 1, 1,
0.2748007, 0.754065, -0.5742931, 0, 0, 0, 1, 1,
0.2795405, 0.8729553, 1.176075, 0, 0, 0, 1, 1,
0.2799048, -0.8792805, 3.752227, 0, 0, 0, 1, 1,
0.2841939, -0.7204885, 2.220124, 1, 1, 1, 1, 1,
0.286472, 0.7394205, 0.2306929, 1, 1, 1, 1, 1,
0.2883013, 1.158183, 0.9693563, 1, 1, 1, 1, 1,
0.2905318, -1.324443, 5.758218, 1, 1, 1, 1, 1,
0.2920344, -0.02129825, 0.6575804, 1, 1, 1, 1, 1,
0.298804, -0.4039023, 3.524739, 1, 1, 1, 1, 1,
0.2994648, 0.5409831, 1.014249, 1, 1, 1, 1, 1,
0.3018563, -0.1211435, 1.755587, 1, 1, 1, 1, 1,
0.3088591, 0.891233, -1.167637, 1, 1, 1, 1, 1,
0.3088973, 0.1802895, 1.394605, 1, 1, 1, 1, 1,
0.3164556, 1.47321, 0.03294712, 1, 1, 1, 1, 1,
0.3177765, -1.502925, 3.404807, 1, 1, 1, 1, 1,
0.3181362, -0.3038796, 1.889108, 1, 1, 1, 1, 1,
0.3263704, -0.663852, 2.28706, 1, 1, 1, 1, 1,
0.3291287, -0.4751884, 3.093328, 1, 1, 1, 1, 1,
0.3292225, -2.6619, 1.471969, 0, 0, 1, 1, 1,
0.333766, 0.4449542, 0.09546141, 1, 0, 0, 1, 1,
0.3394324, -0.7435164, 3.85888, 1, 0, 0, 1, 1,
0.3517863, -1.630068, 2.654543, 1, 0, 0, 1, 1,
0.3574985, -0.9604082, 3.211526, 1, 0, 0, 1, 1,
0.3597097, -2.087857, 1.836486, 1, 0, 0, 1, 1,
0.3640144, -0.8116802, 4.063862, 0, 0, 0, 1, 1,
0.365276, 0.9135304, -0.01797953, 0, 0, 0, 1, 1,
0.3676721, -0.1573331, 0.3645, 0, 0, 0, 1, 1,
0.3679641, 0.1749001, 0.1386396, 0, 0, 0, 1, 1,
0.3719742, 1.984062, 0.03120383, 0, 0, 0, 1, 1,
0.3750794, 1.623945, 1.264767, 0, 0, 0, 1, 1,
0.3755654, 1.277519, 0.4688455, 0, 0, 0, 1, 1,
0.3779415, -0.7858427, 2.428601, 1, 1, 1, 1, 1,
0.3819288, -0.2234191, 2.255756, 1, 1, 1, 1, 1,
0.3848985, -1.398047, 3.680164, 1, 1, 1, 1, 1,
0.3855623, 0.6368188, 2.78029, 1, 1, 1, 1, 1,
0.3900366, -0.01894703, 0.9273764, 1, 1, 1, 1, 1,
0.3908949, 1.386442, -0.8578047, 1, 1, 1, 1, 1,
0.3919172, 0.4327033, 0.2625082, 1, 1, 1, 1, 1,
0.3943831, -1.857941, 4.269851, 1, 1, 1, 1, 1,
0.3963333, -0.4917213, 0.7706932, 1, 1, 1, 1, 1,
0.3979402, -0.6563678, 1.280992, 1, 1, 1, 1, 1,
0.398365, -0.9447036, 1.880627, 1, 1, 1, 1, 1,
0.4000572, 2.335005, 0.1692204, 1, 1, 1, 1, 1,
0.4036118, -0.3351083, 0.5488419, 1, 1, 1, 1, 1,
0.4107594, -0.6729311, 5.233041, 1, 1, 1, 1, 1,
0.4152458, 1.155066, 1.814339, 1, 1, 1, 1, 1,
0.4195859, 0.6030846, 1.616617, 0, 0, 1, 1, 1,
0.4250194, -1.408756, 3.394428, 1, 0, 0, 1, 1,
0.4259878, 1.344813, 0.6541444, 1, 0, 0, 1, 1,
0.4279026, 2.322482, -0.7731394, 1, 0, 0, 1, 1,
0.4298453, 0.8130277, 1.116423, 1, 0, 0, 1, 1,
0.4340191, 0.275492, 1.439396, 1, 0, 0, 1, 1,
0.4381839, -0.3336857, 2.181098, 0, 0, 0, 1, 1,
0.4486608, -1.082928, 1.953656, 0, 0, 0, 1, 1,
0.450151, -1.371037, 1.916587, 0, 0, 0, 1, 1,
0.4588927, -1.002161, 2.155965, 0, 0, 0, 1, 1,
0.4596527, 0.7621749, -1.033423, 0, 0, 0, 1, 1,
0.4652826, 0.2323259, -0.2548987, 0, 0, 0, 1, 1,
0.4665114, -1.178008, 3.099666, 0, 0, 0, 1, 1,
0.4688592, -0.2707428, 1.770723, 1, 1, 1, 1, 1,
0.4703357, -0.7986248, 2.966383, 1, 1, 1, 1, 1,
0.4710953, -1.126717, 2.620808, 1, 1, 1, 1, 1,
0.4712806, 0.6468285, 0.8288705, 1, 1, 1, 1, 1,
0.47333, -2.208582, 2.045001, 1, 1, 1, 1, 1,
0.4739287, -0.4430994, 1.821769, 1, 1, 1, 1, 1,
0.4742151, -1.004012, 2.448034, 1, 1, 1, 1, 1,
0.4758669, -0.6147373, 1.063101, 1, 1, 1, 1, 1,
0.4761869, -0.4822209, 2.031006, 1, 1, 1, 1, 1,
0.4763585, 0.04702131, 0.8423573, 1, 1, 1, 1, 1,
0.4785305, 0.6194156, 0.5389223, 1, 1, 1, 1, 1,
0.4788477, -0.2431896, -0.1647318, 1, 1, 1, 1, 1,
0.4789231, -0.9044134, 2.668441, 1, 1, 1, 1, 1,
0.4818833, 2.022639, -1.486687, 1, 1, 1, 1, 1,
0.4838146, 1.277915, -0.4316151, 1, 1, 1, 1, 1,
0.4921455, -0.2326271, 3.451294, 0, 0, 1, 1, 1,
0.4931464, -0.1618058, 1.370363, 1, 0, 0, 1, 1,
0.4941694, 0.802254, 0.6953831, 1, 0, 0, 1, 1,
0.4947846, -0.3695604, 1.773417, 1, 0, 0, 1, 1,
0.4964189, -0.4398445, 2.196736, 1, 0, 0, 1, 1,
0.4970714, -0.4366885, 0.6992583, 1, 0, 0, 1, 1,
0.4973389, 0.1404527, 2.913994, 0, 0, 0, 1, 1,
0.5024886, 0.08291787, 1.325504, 0, 0, 0, 1, 1,
0.504846, 1.698906, -0.4055281, 0, 0, 0, 1, 1,
0.5084329, -0.09402063, 2.323952, 0, 0, 0, 1, 1,
0.5123494, -0.04685555, 1.159578, 0, 0, 0, 1, 1,
0.5131693, -0.9699454, 3.942204, 0, 0, 0, 1, 1,
0.5162911, -0.7751778, 2.18347, 0, 0, 0, 1, 1,
0.5166079, 0.07076877, 1.654507, 1, 1, 1, 1, 1,
0.5169334, 1.067102, 0.7844016, 1, 1, 1, 1, 1,
0.5174254, -0.2931363, 2.192587, 1, 1, 1, 1, 1,
0.5210415, -0.4712653, 2.505789, 1, 1, 1, 1, 1,
0.5233396, -0.7720584, 2.408697, 1, 1, 1, 1, 1,
0.5274481, -0.6340469, 1.044226, 1, 1, 1, 1, 1,
0.528777, 0.06166265, 1.427559, 1, 1, 1, 1, 1,
0.529044, 0.3359645, 2.024436, 1, 1, 1, 1, 1,
0.5296409, -1.403624, 3.178871, 1, 1, 1, 1, 1,
0.5315704, -0.2940727, 2.49768, 1, 1, 1, 1, 1,
0.5324772, -0.2435116, 1.381603, 1, 1, 1, 1, 1,
0.5344991, 0.570565, 0.201439, 1, 1, 1, 1, 1,
0.5357218, -1.006533, 2.04927, 1, 1, 1, 1, 1,
0.5399923, 0.6288329, 2.342188, 1, 1, 1, 1, 1,
0.5418975, 0.863883, 0.7867783, 1, 1, 1, 1, 1,
0.5480938, -0.3061189, 2.087609, 0, 0, 1, 1, 1,
0.5496045, -1.015707, 5.85779, 1, 0, 0, 1, 1,
0.5514712, 0.4916964, 0.4520712, 1, 0, 0, 1, 1,
0.5589529, 0.1548229, 0.5976446, 1, 0, 0, 1, 1,
0.560846, 0.7524532, 0.0492363, 1, 0, 0, 1, 1,
0.5697744, 2.426386, -1.194341, 1, 0, 0, 1, 1,
0.5744628, 2.562965, 0.5739532, 0, 0, 0, 1, 1,
0.5760748, -0.5939611, 1.389208, 0, 0, 0, 1, 1,
0.578555, -0.3628632, 1.553282, 0, 0, 0, 1, 1,
0.5824863, -0.7503361, 1.774096, 0, 0, 0, 1, 1,
0.5832122, 0.5188761, 1.760536, 0, 0, 0, 1, 1,
0.585157, 0.614778, 1.48306, 0, 0, 0, 1, 1,
0.5866296, -1.991964, 3.38129, 0, 0, 0, 1, 1,
0.5899865, 1.757459, 0.8554127, 1, 1, 1, 1, 1,
0.5931005, 0.08125263, 1.653342, 1, 1, 1, 1, 1,
0.5969865, 0.6287764, -0.3353016, 1, 1, 1, 1, 1,
0.6047217, -2.175166, 0.8310234, 1, 1, 1, 1, 1,
0.6053388, 0.05992927, 3.690273, 1, 1, 1, 1, 1,
0.612765, 0.6485898, 0.5449528, 1, 1, 1, 1, 1,
0.6159288, -1.62168, 2.818515, 1, 1, 1, 1, 1,
0.6163052, -0.5666665, 2.269111, 1, 1, 1, 1, 1,
0.6177787, 0.7108663, 0.1628286, 1, 1, 1, 1, 1,
0.6180143, -1.82465, 3.584169, 1, 1, 1, 1, 1,
0.6279449, -1.987029, 2.604813, 1, 1, 1, 1, 1,
0.6307936, -0.2646471, 2.508946, 1, 1, 1, 1, 1,
0.6313185, 1.180144, 1.585878, 1, 1, 1, 1, 1,
0.6352671, 0.9744624, -0.8774415, 1, 1, 1, 1, 1,
0.6470575, -1.425366, 3.406483, 1, 1, 1, 1, 1,
0.6511666, -0.3625394, 2.353172, 0, 0, 1, 1, 1,
0.6520398, 0.02771077, 2.519924, 1, 0, 0, 1, 1,
0.6549503, 1.307717, 1.675637, 1, 0, 0, 1, 1,
0.6561892, -0.8935896, 2.230241, 1, 0, 0, 1, 1,
0.6605116, -1.407447, 3.022918, 1, 0, 0, 1, 1,
0.6613374, 0.06582805, 1.128869, 1, 0, 0, 1, 1,
0.662382, 0.3528409, 2.158555, 0, 0, 0, 1, 1,
0.6646562, -2.172895, 3.952269, 0, 0, 0, 1, 1,
0.6653334, 2.721592, 0.2142539, 0, 0, 0, 1, 1,
0.6673694, -0.469326, 3.140989, 0, 0, 0, 1, 1,
0.6702666, 0.7577358, 3.104476, 0, 0, 0, 1, 1,
0.6735175, -0.2923924, 2.497126, 0, 0, 0, 1, 1,
0.677624, -2.001109, 3.799908, 0, 0, 0, 1, 1,
0.680816, -1.056604, 1.451848, 1, 1, 1, 1, 1,
0.688875, -0.9654678, 2.694326, 1, 1, 1, 1, 1,
0.689162, -0.2093096, 1.547298, 1, 1, 1, 1, 1,
0.6925622, 0.532162, -0.544823, 1, 1, 1, 1, 1,
0.695583, 0.8819112, 0.6209559, 1, 1, 1, 1, 1,
0.6983844, -1.051778, 2.030422, 1, 1, 1, 1, 1,
0.6997536, -1.264855, 2.494359, 1, 1, 1, 1, 1,
0.7018034, 0.5441926, 2.305209, 1, 1, 1, 1, 1,
0.7043483, 0.85583, 1.119814, 1, 1, 1, 1, 1,
0.7147161, 0.02559629, 2.713829, 1, 1, 1, 1, 1,
0.7208641, -1.84828, 3.22529, 1, 1, 1, 1, 1,
0.7211104, 0.3395424, 2.542797, 1, 1, 1, 1, 1,
0.721454, -0.1367472, 2.971543, 1, 1, 1, 1, 1,
0.7237903, -0.8699788, 0.9681124, 1, 1, 1, 1, 1,
0.7253509, -1.19816, 2.324839, 1, 1, 1, 1, 1,
0.7255198, 0.9791864, 1.593601, 0, 0, 1, 1, 1,
0.7283253, 1.367558, -0.1112766, 1, 0, 0, 1, 1,
0.7304336, 0.3467192, 3.244053, 1, 0, 0, 1, 1,
0.7309095, -0.6844817, 2.395806, 1, 0, 0, 1, 1,
0.7335598, -0.02054804, 1.188571, 1, 0, 0, 1, 1,
0.7337101, -0.9627027, 0.3638979, 1, 0, 0, 1, 1,
0.7406131, 0.2975984, 2.178375, 0, 0, 0, 1, 1,
0.7460903, 1.142769, 0.3368061, 0, 0, 0, 1, 1,
0.7573264, -0.5882177, 1.238734, 0, 0, 0, 1, 1,
0.7613042, -0.9898887, 2.903661, 0, 0, 0, 1, 1,
0.7646006, -0.5173227, 3.60303, 0, 0, 0, 1, 1,
0.7672844, 2.288047, 0.5167475, 0, 0, 0, 1, 1,
0.7706808, -0.6510326, 2.743077, 0, 0, 0, 1, 1,
0.7786521, 0.4719118, 1.632802, 1, 1, 1, 1, 1,
0.7803944, 0.4840494, 0.1386844, 1, 1, 1, 1, 1,
0.7861612, -0.0503931, 0.4004841, 1, 1, 1, 1, 1,
0.7885508, -0.170669, 1.811225, 1, 1, 1, 1, 1,
0.7886584, -0.1788622, -0.496689, 1, 1, 1, 1, 1,
0.7898757, -1.962962, 2.901807, 1, 1, 1, 1, 1,
0.7967266, 2.600537, -1.300159, 1, 1, 1, 1, 1,
0.7979716, 1.201532, 2.15081, 1, 1, 1, 1, 1,
0.8116845, -0.08590456, 3.045665, 1, 1, 1, 1, 1,
0.8186228, 1.317284, 0.02499185, 1, 1, 1, 1, 1,
0.8231146, 0.854818, 0.8505271, 1, 1, 1, 1, 1,
0.8309159, -0.4711387, 3.493767, 1, 1, 1, 1, 1,
0.8310006, 0.3044614, 2.791291, 1, 1, 1, 1, 1,
0.839058, -1.059025, 2.42312, 1, 1, 1, 1, 1,
0.8452293, -1.037748, 1.69773, 1, 1, 1, 1, 1,
0.8487535, -1.935985, 2.670821, 0, 0, 1, 1, 1,
0.851732, -1.901263, 2.527419, 1, 0, 0, 1, 1,
0.8573981, 2.176052, -0.8209628, 1, 0, 0, 1, 1,
0.8600019, 0.3825422, 0.4194079, 1, 0, 0, 1, 1,
0.8600517, -1.743451, 3.923684, 1, 0, 0, 1, 1,
0.8613358, -1.026357, 4.376206, 1, 0, 0, 1, 1,
0.864285, -0.05910531, 2.198759, 0, 0, 0, 1, 1,
0.8690486, -0.9091288, 2.44363, 0, 0, 0, 1, 1,
0.8824816, -0.2179805, 0.5090052, 0, 0, 0, 1, 1,
0.8849658, -0.09041566, 2.007434, 0, 0, 0, 1, 1,
0.8910586, -0.8264726, 4.124895, 0, 0, 0, 1, 1,
0.8935352, 1.217718, 1.927741, 0, 0, 0, 1, 1,
0.8935848, 0.6763162, 1.995234, 0, 0, 0, 1, 1,
0.8955754, 0.7370831, 1.088518, 1, 1, 1, 1, 1,
0.8968855, 2.134002, -0.3459288, 1, 1, 1, 1, 1,
0.9032085, 0.1342207, 0.5628355, 1, 1, 1, 1, 1,
0.9089705, 0.5270812, 1.197417, 1, 1, 1, 1, 1,
0.9107822, 0.1321131, 2.066173, 1, 1, 1, 1, 1,
0.9109204, 0.4419957, 2.900356, 1, 1, 1, 1, 1,
0.9138743, -1.221544, 4.512014, 1, 1, 1, 1, 1,
0.914183, -1.577371, 3.454144, 1, 1, 1, 1, 1,
0.9257266, 1.588714, -0.05167153, 1, 1, 1, 1, 1,
0.9299868, -1.981374, 2.357792, 1, 1, 1, 1, 1,
0.9350696, -1.773805, 2.899994, 1, 1, 1, 1, 1,
0.9448452, -1.026885, 2.245683, 1, 1, 1, 1, 1,
0.9494894, -0.460841, 3.545903, 1, 1, 1, 1, 1,
0.9517311, -0.5755235, 4.204108, 1, 1, 1, 1, 1,
0.9528129, 0.251619, 1.813818, 1, 1, 1, 1, 1,
0.9614351, 0.5444485, 0.6672953, 0, 0, 1, 1, 1,
0.9647024, -1.819486, 3.515676, 1, 0, 0, 1, 1,
0.9739301, -1.248717, 2.695558, 1, 0, 0, 1, 1,
0.9743113, 0.867057, 0.1746643, 1, 0, 0, 1, 1,
0.975219, -0.4890386, 2.719624, 1, 0, 0, 1, 1,
0.9861197, -0.7722707, 0.8160906, 1, 0, 0, 1, 1,
0.987074, -1.719194, 3.199295, 0, 0, 0, 1, 1,
0.9887872, -1.258543, 3.595419, 0, 0, 0, 1, 1,
0.9946116, -0.03416808, 1.662018, 0, 0, 0, 1, 1,
0.9962633, 0.1375452, 1.686234, 0, 0, 0, 1, 1,
1.004521, -0.9770271, 3.129009, 0, 0, 0, 1, 1,
1.004908, 0.703231, 0.6115181, 0, 0, 0, 1, 1,
1.020192, -0.9131159, 1.480246, 0, 0, 0, 1, 1,
1.020719, 1.119477, 1.068756, 1, 1, 1, 1, 1,
1.022504, -0.5280123, 0.3685455, 1, 1, 1, 1, 1,
1.022812, -0.8026634, 2.463436, 1, 1, 1, 1, 1,
1.028639, -0.1179927, 1.413379, 1, 1, 1, 1, 1,
1.035093, 0.85492, 2.042115, 1, 1, 1, 1, 1,
1.037773, -0.9889702, 3.454345, 1, 1, 1, 1, 1,
1.037911, -0.2495015, 0.144753, 1, 1, 1, 1, 1,
1.042569, -1.471977, 1.385218, 1, 1, 1, 1, 1,
1.048656, -0.2068346, 0.6496575, 1, 1, 1, 1, 1,
1.060922, -0.7817268, 2.365306, 1, 1, 1, 1, 1,
1.062218, -0.984332, 2.877056, 1, 1, 1, 1, 1,
1.071316, 0.7082104, 0.4932734, 1, 1, 1, 1, 1,
1.079756, -1.924924, 1.313804, 1, 1, 1, 1, 1,
1.079943, -0.3536284, 0.8474281, 1, 1, 1, 1, 1,
1.080365, 0.8271797, 2.881768, 1, 1, 1, 1, 1,
1.08202, -0.6248676, 2.061802, 0, 0, 1, 1, 1,
1.082359, 0.6282791, 0.4258118, 1, 0, 0, 1, 1,
1.092667, -0.2465716, 2.826678, 1, 0, 0, 1, 1,
1.1038, 0.2101665, 2.261719, 1, 0, 0, 1, 1,
1.11675, -0.1150686, 2.803031, 1, 0, 0, 1, 1,
1.117291, -0.2484917, 3.767901, 1, 0, 0, 1, 1,
1.119974, -1.623671, 2.782863, 0, 0, 0, 1, 1,
1.122366, 0.1424163, 1.58684, 0, 0, 0, 1, 1,
1.125439, -2.53414, 1.379374, 0, 0, 0, 1, 1,
1.134705, 1.205807, 1.642011, 0, 0, 0, 1, 1,
1.137612, 2.507759, -0.7251226, 0, 0, 0, 1, 1,
1.140085, -0.5715076, 2.117582, 0, 0, 0, 1, 1,
1.142386, -1.426865, 2.105212, 0, 0, 0, 1, 1,
1.145105, 0.9145058, 1.900755, 1, 1, 1, 1, 1,
1.149039, -0.2162733, 1.612173, 1, 1, 1, 1, 1,
1.152886, 1.227012, 0.3391992, 1, 1, 1, 1, 1,
1.157855, 0.01633411, 2.548866, 1, 1, 1, 1, 1,
1.166236, 1.599062, 1.772634, 1, 1, 1, 1, 1,
1.167986, 0.515276, 0.7876921, 1, 1, 1, 1, 1,
1.17113, 0.5447121, 1.383395, 1, 1, 1, 1, 1,
1.178549, 0.8854455, 0.226717, 1, 1, 1, 1, 1,
1.181764, 0.3484977, 2.059335, 1, 1, 1, 1, 1,
1.184222, 0.8994005, 1.830787, 1, 1, 1, 1, 1,
1.194214, 0.2685055, 2.41953, 1, 1, 1, 1, 1,
1.198263, -0.07536463, 1.711949, 1, 1, 1, 1, 1,
1.199265, 0.1076495, 1.531509, 1, 1, 1, 1, 1,
1.200143, -0.3907947, 2.916103, 1, 1, 1, 1, 1,
1.214906, 1.982016, 1.751535, 1, 1, 1, 1, 1,
1.215009, -0.1993943, 2.694043, 0, 0, 1, 1, 1,
1.220617, 0.7007977, -0.7084946, 1, 0, 0, 1, 1,
1.224234, -2.352955, 0.9288486, 1, 0, 0, 1, 1,
1.233499, 0.5432013, 1.208725, 1, 0, 0, 1, 1,
1.239387, -0.2487762, 1.419852, 1, 0, 0, 1, 1,
1.246439, -0.2908223, 2.689954, 1, 0, 0, 1, 1,
1.255732, -1.394468, 3.438592, 0, 0, 0, 1, 1,
1.256871, 1.127091, 1.410219, 0, 0, 0, 1, 1,
1.258942, 0.02027537, 2.327534, 0, 0, 0, 1, 1,
1.259951, 0.6642351, 2.378095, 0, 0, 0, 1, 1,
1.27044, 0.2569152, -0.1389546, 0, 0, 0, 1, 1,
1.293769, -0.5521377, 2.842294, 0, 0, 0, 1, 1,
1.294108, 0.1330886, 2.088617, 0, 0, 0, 1, 1,
1.296675, 1.754952, -0.0004390321, 1, 1, 1, 1, 1,
1.297148, 1.282884, -1.219255, 1, 1, 1, 1, 1,
1.29995, 0.9340022, 1.041712, 1, 1, 1, 1, 1,
1.305179, -1.444369, 2.810653, 1, 1, 1, 1, 1,
1.310324, -2.477393, 1.603344, 1, 1, 1, 1, 1,
1.316366, 0.2483951, 3.240566, 1, 1, 1, 1, 1,
1.317357, 1.04226, 0.4327504, 1, 1, 1, 1, 1,
1.318993, -1.1644, 2.861642, 1, 1, 1, 1, 1,
1.328901, -0.4990053, 2.644947, 1, 1, 1, 1, 1,
1.340777, 0.3812036, 2.552851, 1, 1, 1, 1, 1,
1.34528, 2.177974, 0.1134916, 1, 1, 1, 1, 1,
1.353194, 1.141916, 1.088248, 1, 1, 1, 1, 1,
1.360484, 0.3539622, 1.5422, 1, 1, 1, 1, 1,
1.361573, 1.710444, 0.249913, 1, 1, 1, 1, 1,
1.371041, -0.6348783, 1.473727, 1, 1, 1, 1, 1,
1.371118, 0.7865766, 1.104193, 0, 0, 1, 1, 1,
1.372613, 0.5580447, 1.573135, 1, 0, 0, 1, 1,
1.380715, -0.9760073, 2.170537, 1, 0, 0, 1, 1,
1.397211, -1.488423, 4.729524, 1, 0, 0, 1, 1,
1.40771, 0.7875913, 0.66633, 1, 0, 0, 1, 1,
1.428054, -1.244016, 4.581268, 1, 0, 0, 1, 1,
1.438959, -1.139497, 1.839514, 0, 0, 0, 1, 1,
1.439332, 0.4755238, 1.604868, 0, 0, 0, 1, 1,
1.446262, -0.9375269, 0.7274984, 0, 0, 0, 1, 1,
1.463214, -0.3240493, 3.010381, 0, 0, 0, 1, 1,
1.468057, -2.2758, 2.347374, 0, 0, 0, 1, 1,
1.474703, 1.430603, -1.121942, 0, 0, 0, 1, 1,
1.47495, 1.835949, 1.274773, 0, 0, 0, 1, 1,
1.475001, -0.5157727, 1.531535, 1, 1, 1, 1, 1,
1.494946, 0.7371119, 0.7203067, 1, 1, 1, 1, 1,
1.495404, 1.636266, 0.3080267, 1, 1, 1, 1, 1,
1.545281, 0.6615916, 1.475913, 1, 1, 1, 1, 1,
1.561475, -0.4004716, -0.04316332, 1, 1, 1, 1, 1,
1.563147, 0.4491914, 0.5759197, 1, 1, 1, 1, 1,
1.563468, -0.9806651, 2.08333, 1, 1, 1, 1, 1,
1.577784, 1.860849, 0.33873, 1, 1, 1, 1, 1,
1.581779, -0.719288, 3.225236, 1, 1, 1, 1, 1,
1.585877, -1.495534, 1.640069, 1, 1, 1, 1, 1,
1.591221, -1.217404, 2.669539, 1, 1, 1, 1, 1,
1.602466, -0.5928974, 3.112767, 1, 1, 1, 1, 1,
1.620114, 1.321088, 1.255344, 1, 1, 1, 1, 1,
1.632707, -0.4328203, 2.330608, 1, 1, 1, 1, 1,
1.647498, -0.9356319, 1.581906, 1, 1, 1, 1, 1,
1.651483, 0.09601559, 1.547666, 0, 0, 1, 1, 1,
1.662962, 0.1137073, -0.5950164, 1, 0, 0, 1, 1,
1.674175, -2.259078, 1.695153, 1, 0, 0, 1, 1,
1.67643, -0.2351499, 1.799807, 1, 0, 0, 1, 1,
1.680455, 0.3239051, 1.831249, 1, 0, 0, 1, 1,
1.682452, 0.5382195, 0.9990118, 1, 0, 0, 1, 1,
1.686787, 0.7006599, 3.660218, 0, 0, 0, 1, 1,
1.703406, 0.310023, 0.9833674, 0, 0, 0, 1, 1,
1.704585, 0.2709697, 0.8017691, 0, 0, 0, 1, 1,
1.716364, -0.8297511, 1.198703, 0, 0, 0, 1, 1,
1.725697, 0.4196711, 0.8980555, 0, 0, 0, 1, 1,
1.725845, -2.211432, 2.725058, 0, 0, 0, 1, 1,
1.72689, -0.8121417, 1.746059, 0, 0, 0, 1, 1,
1.764614, 0.8108755, 1.931574, 1, 1, 1, 1, 1,
1.779536, 0.5956815, 1.873239, 1, 1, 1, 1, 1,
1.782859, 1.357422, -0.9748303, 1, 1, 1, 1, 1,
1.801257, -0.8901423, 1.41488, 1, 1, 1, 1, 1,
1.80147, 0.1105125, 1.281986, 1, 1, 1, 1, 1,
1.813984, 0.09087397, 2.072619, 1, 1, 1, 1, 1,
1.840175, -1.489244, 1.544964, 1, 1, 1, 1, 1,
1.883156, 1.532049, 1.630288, 1, 1, 1, 1, 1,
1.929206, 0.3772893, 1.338724, 1, 1, 1, 1, 1,
1.944573, -0.3063348, 0.3851584, 1, 1, 1, 1, 1,
1.953498, 1.361762, 2.230552, 1, 1, 1, 1, 1,
1.957127, 0.8044099, 0.8489091, 1, 1, 1, 1, 1,
2.008332, 0.6112602, 3.130923, 1, 1, 1, 1, 1,
2.011617, 1.090227, 1.051506, 1, 1, 1, 1, 1,
2.036334, -0.08297531, 2.097691, 1, 1, 1, 1, 1,
2.094725, -0.270643, 1.849692, 0, 0, 1, 1, 1,
2.128957, 1.024421, 1.933535, 1, 0, 0, 1, 1,
2.177827, -1.520672, 1.717339, 1, 0, 0, 1, 1,
2.1837, 1.761324, -0.7323816, 1, 0, 0, 1, 1,
2.230679, 0.635915, 0.4000528, 1, 0, 0, 1, 1,
2.276033, -1.880195, 3.024825, 1, 0, 0, 1, 1,
2.38172, 1.583847, 0.762134, 0, 0, 0, 1, 1,
2.389825, 0.6426134, 2.410985, 0, 0, 0, 1, 1,
2.424439, 0.470488, 2.310366, 0, 0, 0, 1, 1,
2.440827, -0.8590952, 2.981666, 0, 0, 0, 1, 1,
2.460201, -0.5471961, 3.204298, 0, 0, 0, 1, 1,
2.492064, -1.438639, 2.3729, 0, 0, 0, 1, 1,
2.515228, -0.8592733, 2.661667, 0, 0, 0, 1, 1,
2.531418, -0.3353772, 0.1661961, 1, 1, 1, 1, 1,
2.660891, 0.5275339, 1.794423, 1, 1, 1, 1, 1,
2.677499, -0.232214, 1.651643, 1, 1, 1, 1, 1,
2.79257, -1.93005, 1.946022, 1, 1, 1, 1, 1,
2.903946, 0.3843624, 2.725691, 1, 1, 1, 1, 1,
2.90471, -0.08595461, 0.6811961, 1, 1, 1, 1, 1,
3.785824, 0.02444781, 2.050483, 1, 1, 1, 1, 1
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
var radius = 10.22915;
var distance = 35.92945;
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
mvMatrix.translate( -0.09078002, 0.477041, -0.01647067 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.92945);
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
