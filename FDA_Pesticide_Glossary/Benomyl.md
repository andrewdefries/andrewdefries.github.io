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
-3.291564, -0.4671167, -2.441233, 1, 0, 0, 1,
-2.664642, 0.1598237, -1.737509, 1, 0.007843138, 0, 1,
-2.574965, 1.239415, -2.400386, 1, 0.01176471, 0, 1,
-2.514236, -0.6414971, -1.931906, 1, 0.01960784, 0, 1,
-2.468821, 0.3797825, -0.07809801, 1, 0.02352941, 0, 1,
-2.416981, -2.142508, -3.610269, 1, 0.03137255, 0, 1,
-2.34246, 2.258616, -0.5654134, 1, 0.03529412, 0, 1,
-2.337745, 0.3032176, -0.4401561, 1, 0.04313726, 0, 1,
-2.311589, 0.6413968, -4.418866, 1, 0.04705882, 0, 1,
-2.23435, 0.5486444, -0.1127174, 1, 0.05490196, 0, 1,
-2.209904, 0.1741783, -1.456366, 1, 0.05882353, 0, 1,
-2.192888, -0.2216489, -2.330832, 1, 0.06666667, 0, 1,
-2.177495, 0.2966027, -0.5391383, 1, 0.07058824, 0, 1,
-2.154062, 0.9359598, -2.014184, 1, 0.07843138, 0, 1,
-2.152496, 0.5356273, -3.270811, 1, 0.08235294, 0, 1,
-2.15151, -0.9049268, -0.2062441, 1, 0.09019608, 0, 1,
-2.092214, 1.243473, 1.224091, 1, 0.09411765, 0, 1,
-2.087335, -0.6858052, -1.461225, 1, 0.1019608, 0, 1,
-2.014312, 0.0327583, -3.17897, 1, 0.1098039, 0, 1,
-1.937038, -0.1843567, -2.373695, 1, 0.1137255, 0, 1,
-1.923258, 0.7793921, 0.7356844, 1, 0.1215686, 0, 1,
-1.919919, 0.6906922, 1.941947, 1, 0.1254902, 0, 1,
-1.911185, -1.924449, -3.720025, 1, 0.1333333, 0, 1,
-1.877734, -0.9782271, -2.121999, 1, 0.1372549, 0, 1,
-1.831232, 0.1006576, -2.482544, 1, 0.145098, 0, 1,
-1.826613, -0.01899111, -1.483095, 1, 0.1490196, 0, 1,
-1.82359, 0.1185695, -5.019423, 1, 0.1568628, 0, 1,
-1.812347, -1.329207, -1.425445, 1, 0.1607843, 0, 1,
-1.786906, -2.444398, -1.795212, 1, 0.1686275, 0, 1,
-1.785718, 0.9296265, -0.9841635, 1, 0.172549, 0, 1,
-1.754242, 0.8665625, -2.382057, 1, 0.1803922, 0, 1,
-1.740714, -0.2156504, -0.4703619, 1, 0.1843137, 0, 1,
-1.711821, -0.03769665, -2.504534, 1, 0.1921569, 0, 1,
-1.709728, -1.587744, -2.641569, 1, 0.1960784, 0, 1,
-1.699877, -0.6339822, -3.006777, 1, 0.2039216, 0, 1,
-1.696959, -0.6337195, -1.181251, 1, 0.2117647, 0, 1,
-1.696105, 1.11832, 0.17721, 1, 0.2156863, 0, 1,
-1.690011, -1.430363, -1.354342, 1, 0.2235294, 0, 1,
-1.685206, 0.4337152, -0.6989599, 1, 0.227451, 0, 1,
-1.657959, 0.7899498, -1.595663, 1, 0.2352941, 0, 1,
-1.65654, 1.88557, 0.04719612, 1, 0.2392157, 0, 1,
-1.652924, -0.9102473, -1.665213, 1, 0.2470588, 0, 1,
-1.625173, -0.567979, -2.759336, 1, 0.2509804, 0, 1,
-1.622818, -0.2126624, -1.42177, 1, 0.2588235, 0, 1,
-1.621453, 1.362298, -0.2305416, 1, 0.2627451, 0, 1,
-1.599885, 0.5490471, -0.9399655, 1, 0.2705882, 0, 1,
-1.58507, -0.6310593, -3.353429, 1, 0.2745098, 0, 1,
-1.578792, -0.8757537, -2.110733, 1, 0.282353, 0, 1,
-1.578383, -1.166209, -2.654652, 1, 0.2862745, 0, 1,
-1.577296, -0.01821283, -1.850652, 1, 0.2941177, 0, 1,
-1.537879, -1.589399, -4.019876, 1, 0.3019608, 0, 1,
-1.524533, 0.8695523, -1.325639, 1, 0.3058824, 0, 1,
-1.523397, 0.3137405, -0.1573713, 1, 0.3137255, 0, 1,
-1.521385, 0.7359759, -3.111338, 1, 0.3176471, 0, 1,
-1.519965, -1.969957, -1.687286, 1, 0.3254902, 0, 1,
-1.492265, -0.7971456, -2.653423, 1, 0.3294118, 0, 1,
-1.486153, 0.1387935, -1.136919, 1, 0.3372549, 0, 1,
-1.479071, -0.7594923, -1.178951, 1, 0.3411765, 0, 1,
-1.476935, -2.106399, -2.969684, 1, 0.3490196, 0, 1,
-1.474483, -0.4448041, -1.797754, 1, 0.3529412, 0, 1,
-1.471438, 0.4407338, -0.6342182, 1, 0.3607843, 0, 1,
-1.471229, -0.2864945, -1.862846, 1, 0.3647059, 0, 1,
-1.468408, 1.768014, -1.863369, 1, 0.372549, 0, 1,
-1.462769, 0.919206, 0.2028567, 1, 0.3764706, 0, 1,
-1.461048, 0.3302411, 0.2321834, 1, 0.3843137, 0, 1,
-1.441782, 0.1874917, -2.955392, 1, 0.3882353, 0, 1,
-1.44143, -1.648743, -1.445483, 1, 0.3960784, 0, 1,
-1.43657, -0.5820596, -3.648915, 1, 0.4039216, 0, 1,
-1.436297, 0.2935027, -1.737939, 1, 0.4078431, 0, 1,
-1.419111, -0.3780996, -0.6507043, 1, 0.4156863, 0, 1,
-1.412115, -1.061042, -2.382834, 1, 0.4196078, 0, 1,
-1.40998, -1.028753, -2.690652, 1, 0.427451, 0, 1,
-1.408793, 0.91672, -1.670442, 1, 0.4313726, 0, 1,
-1.39916, 1.583326, -0.3095056, 1, 0.4392157, 0, 1,
-1.384632, 0.0989475, -4.423445, 1, 0.4431373, 0, 1,
-1.378719, -0.871637, -2.081195, 1, 0.4509804, 0, 1,
-1.366616, -0.2411618, -2.382323, 1, 0.454902, 0, 1,
-1.365586, -0.9195299, -0.9060867, 1, 0.4627451, 0, 1,
-1.359137, 0.3668788, -1.957104, 1, 0.4666667, 0, 1,
-1.358068, -0.1408299, -2.617748, 1, 0.4745098, 0, 1,
-1.356773, -2.009399, -2.302892, 1, 0.4784314, 0, 1,
-1.352018, 2.013882, 0.64253, 1, 0.4862745, 0, 1,
-1.346418, -0.7867228, -2.277162, 1, 0.4901961, 0, 1,
-1.345044, 0.4952466, -2.613059, 1, 0.4980392, 0, 1,
-1.343305, 1.451216, -1.612319, 1, 0.5058824, 0, 1,
-1.334015, -1.280527, -1.181372, 1, 0.509804, 0, 1,
-1.33041, 0.4926846, -2.092963, 1, 0.5176471, 0, 1,
-1.325799, -1.29253, -1.829217, 1, 0.5215687, 0, 1,
-1.32248, -1.132535, -0.4476093, 1, 0.5294118, 0, 1,
-1.32071, 0.3331897, -0.5533964, 1, 0.5333334, 0, 1,
-1.317102, -0.2616558, -1.703447, 1, 0.5411765, 0, 1,
-1.310374, 0.7291403, -1.963551, 1, 0.5450981, 0, 1,
-1.306757, 1.196404, -0.90977, 1, 0.5529412, 0, 1,
-1.30431, 0.4340892, -2.270567, 1, 0.5568628, 0, 1,
-1.289024, -1.44336, -1.999246, 1, 0.5647059, 0, 1,
-1.285536, -0.07509063, -1.693016, 1, 0.5686275, 0, 1,
-1.283342, 0.4778391, -0.3320983, 1, 0.5764706, 0, 1,
-1.283325, 0.7003854, -1.007609, 1, 0.5803922, 0, 1,
-1.279843, -0.6877192, -1.221021, 1, 0.5882353, 0, 1,
-1.276793, -0.9053205, -1.294622, 1, 0.5921569, 0, 1,
-1.272102, 0.1229443, -1.297392, 1, 0.6, 0, 1,
-1.253041, 0.7871384, -2.456065, 1, 0.6078432, 0, 1,
-1.242015, 0.7564569, -0.08837076, 1, 0.6117647, 0, 1,
-1.237363, -1.313175, -1.091297, 1, 0.6196079, 0, 1,
-1.226997, -0.1748469, -3.249655, 1, 0.6235294, 0, 1,
-1.225099, -1.979237, -1.973202, 1, 0.6313726, 0, 1,
-1.215315, -1.35029, -3.152507, 1, 0.6352941, 0, 1,
-1.214654, -0.5537046, -1.536593, 1, 0.6431373, 0, 1,
-1.213667, -0.1747583, -2.790993, 1, 0.6470588, 0, 1,
-1.211183, 0.7031204, -1.215389, 1, 0.654902, 0, 1,
-1.20782, -0.1604349, -3.80733, 1, 0.6588235, 0, 1,
-1.206191, 1.420844, -2.678543, 1, 0.6666667, 0, 1,
-1.20071, 0.2072157, -2.066478, 1, 0.6705883, 0, 1,
-1.199719, -0.6433414, -2.259757, 1, 0.6784314, 0, 1,
-1.18946, 0.5137048, -1.56459, 1, 0.682353, 0, 1,
-1.185722, 0.3241004, -1.140404, 1, 0.6901961, 0, 1,
-1.185175, 0.8146625, 0.1812597, 1, 0.6941177, 0, 1,
-1.177412, 0.221976, -2.276569, 1, 0.7019608, 0, 1,
-1.174868, -0.7185503, -1.742304, 1, 0.7098039, 0, 1,
-1.174209, -1.694996, -2.725026, 1, 0.7137255, 0, 1,
-1.161576, 0.9385391, -0.8903503, 1, 0.7215686, 0, 1,
-1.160931, 0.6831279, -1.166279, 1, 0.7254902, 0, 1,
-1.154513, -1.650825, -0.5884358, 1, 0.7333333, 0, 1,
-1.154046, 1.78337, -1.102986, 1, 0.7372549, 0, 1,
-1.153604, 0.3452654, -0.5370249, 1, 0.7450981, 0, 1,
-1.152974, 0.7316765, -0.8814949, 1, 0.7490196, 0, 1,
-1.146782, 0.1633692, -1.743196, 1, 0.7568628, 0, 1,
-1.145207, 0.5090611, -1.649258, 1, 0.7607843, 0, 1,
-1.131997, 0.05549566, -1.61554, 1, 0.7686275, 0, 1,
-1.11436, 0.2401987, -1.433609, 1, 0.772549, 0, 1,
-1.109614, -1.147457, -3.348504, 1, 0.7803922, 0, 1,
-1.104293, -0.3866771, -3.317371, 1, 0.7843137, 0, 1,
-1.1, 1.849951, -0.4896383, 1, 0.7921569, 0, 1,
-1.094895, -1.248912, -0.7466186, 1, 0.7960784, 0, 1,
-1.094038, 0.005524239, -1.795011, 1, 0.8039216, 0, 1,
-1.093996, -1.335803, -1.764921, 1, 0.8117647, 0, 1,
-1.091237, -0.5331164, -2.955569, 1, 0.8156863, 0, 1,
-1.084672, 0.8188257, -1.53331, 1, 0.8235294, 0, 1,
-1.082422, 0.6814857, -0.9624829, 1, 0.827451, 0, 1,
-1.071929, -0.6306336, -2.01672, 1, 0.8352941, 0, 1,
-1.068945, -0.3478426, -1.71046, 1, 0.8392157, 0, 1,
-1.057983, -0.8812687, -1.162127, 1, 0.8470588, 0, 1,
-1.048623, 0.1947461, -1.151848, 1, 0.8509804, 0, 1,
-1.04064, 0.5692805, -0.9258851, 1, 0.8588235, 0, 1,
-1.034035, 0.3633005, -2.062719, 1, 0.8627451, 0, 1,
-1.031897, 0.4170976, -0.07896805, 1, 0.8705882, 0, 1,
-1.023127, -0.5286379, -1.82388, 1, 0.8745098, 0, 1,
-1.016925, -0.6470369, -0.9462836, 1, 0.8823529, 0, 1,
-1.016599, -1.374559, -2.574743, 1, 0.8862745, 0, 1,
-1.010592, 1.2573, -0.7719111, 1, 0.8941177, 0, 1,
-1.010196, 0.9058599, 0.03623421, 1, 0.8980392, 0, 1,
-1.008336, -0.2540916, -0.9400109, 1, 0.9058824, 0, 1,
-1.005432, -0.6212938, -3.345193, 1, 0.9137255, 0, 1,
-1.000513, -1.079678, -2.460771, 1, 0.9176471, 0, 1,
-0.9922464, 0.1597385, -0.08353315, 1, 0.9254902, 0, 1,
-0.9909251, 2.161402, -2.623307, 1, 0.9294118, 0, 1,
-0.9844552, 0.4555786, -2.315221, 1, 0.9372549, 0, 1,
-0.9832034, -0.4914478, -2.482542, 1, 0.9411765, 0, 1,
-0.9795791, -1.769907, -3.088687, 1, 0.9490196, 0, 1,
-0.9669456, -0.3344978, -1.22687, 1, 0.9529412, 0, 1,
-0.9660047, 0.8975354, -0.04823688, 1, 0.9607843, 0, 1,
-0.9625975, 0.06613097, -1.278383, 1, 0.9647059, 0, 1,
-0.9560645, 1.745064, -0.8537828, 1, 0.972549, 0, 1,
-0.9530555, -1.872392, -2.460617, 1, 0.9764706, 0, 1,
-0.9457613, -0.1632803, -2.40465, 1, 0.9843137, 0, 1,
-0.9375998, 0.6314964, -0.6935135, 1, 0.9882353, 0, 1,
-0.9343873, -1.0297, -2.90816, 1, 0.9960784, 0, 1,
-0.9261191, 0.2104442, -0.8818391, 0.9960784, 1, 0, 1,
-0.9154972, 0.6128942, -0.9342952, 0.9921569, 1, 0, 1,
-0.9079962, -0.9481587, -3.050906, 0.9843137, 1, 0, 1,
-0.9041417, -0.7369979, -1.658413, 0.9803922, 1, 0, 1,
-0.8999146, -0.5166785, -0.5110206, 0.972549, 1, 0, 1,
-0.8993211, -0.3650826, -2.003606, 0.9686275, 1, 0, 1,
-0.8976848, -0.09218466, -1.304993, 0.9607843, 1, 0, 1,
-0.8973872, -2.468996, -1.538928, 0.9568627, 1, 0, 1,
-0.8964804, 0.4930059, -1.181332, 0.9490196, 1, 0, 1,
-0.8910366, -0.5322933, -3.964406, 0.945098, 1, 0, 1,
-0.889644, -0.2986083, -3.097294, 0.9372549, 1, 0, 1,
-0.8882138, -1.403655, -3.265958, 0.9333333, 1, 0, 1,
-0.8833321, -0.8917375, -4.384291, 0.9254902, 1, 0, 1,
-0.882772, 0.477684, -2.337758, 0.9215686, 1, 0, 1,
-0.8806491, -0.2444225, -1.139144, 0.9137255, 1, 0, 1,
-0.8795393, 0.7071636, -2.304982, 0.9098039, 1, 0, 1,
-0.8781081, -0.2989833, -2.894995, 0.9019608, 1, 0, 1,
-0.8759525, 0.7356917, -0.8071453, 0.8941177, 1, 0, 1,
-0.8757787, 0.005520329, -2.232686, 0.8901961, 1, 0, 1,
-0.8748372, 1.140869, -1.395969, 0.8823529, 1, 0, 1,
-0.8704982, -0.3804883, -3.857656, 0.8784314, 1, 0, 1,
-0.8651412, -0.0642887, -0.5128713, 0.8705882, 1, 0, 1,
-0.8632941, 1.18004, 0.1468981, 0.8666667, 1, 0, 1,
-0.8611311, 0.6034771, -2.863407, 0.8588235, 1, 0, 1,
-0.8606583, -0.6399068, -1.797343, 0.854902, 1, 0, 1,
-0.8569872, 1.133336, -0.1496629, 0.8470588, 1, 0, 1,
-0.8528318, -0.1355456, -0.5728726, 0.8431373, 1, 0, 1,
-0.8497521, -0.6750633, -2.905734, 0.8352941, 1, 0, 1,
-0.8482654, 0.1105798, -0.3868029, 0.8313726, 1, 0, 1,
-0.8479238, 1.03543, -0.1685576, 0.8235294, 1, 0, 1,
-0.8471075, -0.9441394, -0.6978338, 0.8196079, 1, 0, 1,
-0.8453909, -1.468944, -1.6875, 0.8117647, 1, 0, 1,
-0.8439845, -1.547632, -2.893757, 0.8078431, 1, 0, 1,
-0.8425419, 0.02582598, -1.598452, 0.8, 1, 0, 1,
-0.8387201, -0.736576, -1.908512, 0.7921569, 1, 0, 1,
-0.8380074, 0.9349066, -0.1244431, 0.7882353, 1, 0, 1,
-0.8263164, 0.3172688, -2.898652, 0.7803922, 1, 0, 1,
-0.823079, 1.147342, 0.1614366, 0.7764706, 1, 0, 1,
-0.8199953, -2.020242, -2.766521, 0.7686275, 1, 0, 1,
-0.8134081, 0.8922635, 0.320197, 0.7647059, 1, 0, 1,
-0.8105996, 1.769515, 0.9897655, 0.7568628, 1, 0, 1,
-0.8070758, 0.80391, -1.373091, 0.7529412, 1, 0, 1,
-0.7949516, 0.1526583, -1.937269, 0.7450981, 1, 0, 1,
-0.7855098, 0.5865076, -3.020559, 0.7411765, 1, 0, 1,
-0.7823939, -0.8782067, -1.332741, 0.7333333, 1, 0, 1,
-0.7791239, 2.500276, -0.7142016, 0.7294118, 1, 0, 1,
-0.7779921, 1.02528, -0.2924173, 0.7215686, 1, 0, 1,
-0.7760426, 0.893851, 0.7758629, 0.7176471, 1, 0, 1,
-0.7724723, 0.9448634, -0.9244605, 0.7098039, 1, 0, 1,
-0.7720507, -1.246677, -2.765809, 0.7058824, 1, 0, 1,
-0.7610717, -0.4436452, -1.972004, 0.6980392, 1, 0, 1,
-0.7570736, -0.504053, -1.877338, 0.6901961, 1, 0, 1,
-0.7548144, -1.509868, -2.81062, 0.6862745, 1, 0, 1,
-0.7437232, -0.812803, -3.441174, 0.6784314, 1, 0, 1,
-0.743274, 0.1419426, -1.446108, 0.6745098, 1, 0, 1,
-0.7333389, 0.9572707, 0.04735961, 0.6666667, 1, 0, 1,
-0.7326552, 0.7469023, -0.9648947, 0.6627451, 1, 0, 1,
-0.7289531, -0.375598, -3.256475, 0.654902, 1, 0, 1,
-0.7261937, 0.1416566, -1.862465, 0.6509804, 1, 0, 1,
-0.7242225, 0.1230596, 0.2094428, 0.6431373, 1, 0, 1,
-0.7142667, -1.205141, -3.506629, 0.6392157, 1, 0, 1,
-0.7013303, -1.301714, -1.848561, 0.6313726, 1, 0, 1,
-0.7004769, 0.1094872, -0.4765915, 0.627451, 1, 0, 1,
-0.6989932, 2.178672, 0.3786618, 0.6196079, 1, 0, 1,
-0.6987726, 0.6340109, -1.367864, 0.6156863, 1, 0, 1,
-0.691103, 0.8995993, -0.9482936, 0.6078432, 1, 0, 1,
-0.6809325, 0.4913384, 0.2035908, 0.6039216, 1, 0, 1,
-0.6790145, -1.124794, -1.437737, 0.5960785, 1, 0, 1,
-0.6777825, -0.1286825, -1.044614, 0.5882353, 1, 0, 1,
-0.6744933, 0.166841, -1.42925, 0.5843138, 1, 0, 1,
-0.6725415, -1.426965, -2.066327, 0.5764706, 1, 0, 1,
-0.6722093, -1.051038, -0.652137, 0.572549, 1, 0, 1,
-0.6708744, 0.3168047, -0.6770177, 0.5647059, 1, 0, 1,
-0.6701797, -0.8943225, -1.181949, 0.5607843, 1, 0, 1,
-0.6681694, -1.146906, -2.636496, 0.5529412, 1, 0, 1,
-0.6624814, -1.663488, -3.463206, 0.5490196, 1, 0, 1,
-0.6622301, -0.3523313, -1.817687, 0.5411765, 1, 0, 1,
-0.6615831, 0.2452878, -2.440218, 0.5372549, 1, 0, 1,
-0.6612465, -0.2148132, -3.379249, 0.5294118, 1, 0, 1,
-0.6601251, -0.5427919, -2.925525, 0.5254902, 1, 0, 1,
-0.6574351, -0.7353024, 0.5146585, 0.5176471, 1, 0, 1,
-0.6560847, 0.4083847, -0.1212806, 0.5137255, 1, 0, 1,
-0.6556907, 0.6799341, -0.6524426, 0.5058824, 1, 0, 1,
-0.6519952, -1.433502, -3.243624, 0.5019608, 1, 0, 1,
-0.6512752, 0.3722355, 0.4265441, 0.4941176, 1, 0, 1,
-0.650891, 0.4358323, -1.515639, 0.4862745, 1, 0, 1,
-0.6375994, -0.7539113, -2.171502, 0.4823529, 1, 0, 1,
-0.6333501, -0.8389369, -1.902454, 0.4745098, 1, 0, 1,
-0.6329456, 0.5573702, -0.6768807, 0.4705882, 1, 0, 1,
-0.6317222, 0.9501123, 0.5598504, 0.4627451, 1, 0, 1,
-0.627036, 0.08230394, -1.377116, 0.4588235, 1, 0, 1,
-0.6232826, 0.29863, -1.225665, 0.4509804, 1, 0, 1,
-0.6148747, 0.9485599, -0.1479858, 0.4470588, 1, 0, 1,
-0.6139877, -0.1390283, -1.063949, 0.4392157, 1, 0, 1,
-0.6117589, 1.075697, -0.8632606, 0.4352941, 1, 0, 1,
-0.6069118, -1.015412, -2.365013, 0.427451, 1, 0, 1,
-0.5918178, -0.6814566, -2.580812, 0.4235294, 1, 0, 1,
-0.5900351, 0.3807314, -0.2291472, 0.4156863, 1, 0, 1,
-0.586404, -0.0119534, 0.3814384, 0.4117647, 1, 0, 1,
-0.5849755, -0.2474172, -3.376626, 0.4039216, 1, 0, 1,
-0.5846816, -0.03977814, -2.439925, 0.3960784, 1, 0, 1,
-0.581745, -1.162216, -3.466635, 0.3921569, 1, 0, 1,
-0.5798731, 1.047074, -0.9093089, 0.3843137, 1, 0, 1,
-0.5751653, -1.083708, -2.928226, 0.3803922, 1, 0, 1,
-0.5748402, 0.06560481, -0.974938, 0.372549, 1, 0, 1,
-0.5697253, -0.3303421, -2.321574, 0.3686275, 1, 0, 1,
-0.5674828, -0.1870968, -1.239444, 0.3607843, 1, 0, 1,
-0.5671884, -0.7319048, -2.515791, 0.3568628, 1, 0, 1,
-0.5645913, 0.3809882, 0.3581279, 0.3490196, 1, 0, 1,
-0.5626767, 0.9220066, -1.660694, 0.345098, 1, 0, 1,
-0.5591636, 0.6204153, 0.2420286, 0.3372549, 1, 0, 1,
-0.5571141, 0.5376241, -0.9788961, 0.3333333, 1, 0, 1,
-0.5520284, -0.01004589, -1.789492, 0.3254902, 1, 0, 1,
-0.5494737, 1.644309, -1.735099, 0.3215686, 1, 0, 1,
-0.5488476, 0.508353, 0.1785999, 0.3137255, 1, 0, 1,
-0.5480832, -1.282222, -3.005798, 0.3098039, 1, 0, 1,
-0.547822, -0.4610932, -1.185516, 0.3019608, 1, 0, 1,
-0.5470522, -0.423021, -2.591822, 0.2941177, 1, 0, 1,
-0.5419687, 1.072551, 0.2504982, 0.2901961, 1, 0, 1,
-0.5393788, -0.8937007, -3.538487, 0.282353, 1, 0, 1,
-0.5364961, -1.49269, -1.708734, 0.2784314, 1, 0, 1,
-0.5334417, 0.8153037, -1.750373, 0.2705882, 1, 0, 1,
-0.5329769, 1.123094, 1.464621, 0.2666667, 1, 0, 1,
-0.5328639, 1.812647, 0.1703825, 0.2588235, 1, 0, 1,
-0.5302331, 0.6282163, -0.7804242, 0.254902, 1, 0, 1,
-0.528064, 2.267811, -0.3888917, 0.2470588, 1, 0, 1,
-0.5279457, -0.8026072, -0.555274, 0.2431373, 1, 0, 1,
-0.5278218, 1.211008, -2.466597, 0.2352941, 1, 0, 1,
-0.5230182, -0.4629755, -2.051659, 0.2313726, 1, 0, 1,
-0.5214444, 0.7084893, -2.080543, 0.2235294, 1, 0, 1,
-0.5178097, 1.501653, -1.669637, 0.2196078, 1, 0, 1,
-0.51655, 0.4884362, 0.3159284, 0.2117647, 1, 0, 1,
-0.516515, 1.410694, -0.03849635, 0.2078431, 1, 0, 1,
-0.5124961, -0.6050768, -1.983589, 0.2, 1, 0, 1,
-0.5120128, 1.752224, -1.984937, 0.1921569, 1, 0, 1,
-0.5094789, -0.8491879, -1.908499, 0.1882353, 1, 0, 1,
-0.5043873, 0.8215629, -2.000902, 0.1803922, 1, 0, 1,
-0.5037982, 0.4027726, 0.312625, 0.1764706, 1, 0, 1,
-0.4956552, 1.166059, -0.926291, 0.1686275, 1, 0, 1,
-0.4955654, -0.08163963, -1.079441, 0.1647059, 1, 0, 1,
-0.4940149, -2.055033, -4.142381, 0.1568628, 1, 0, 1,
-0.4916671, -0.02056726, -1.232961, 0.1529412, 1, 0, 1,
-0.4886185, -0.6559522, -3.068906, 0.145098, 1, 0, 1,
-0.4879796, -1.197263, -3.613691, 0.1411765, 1, 0, 1,
-0.4869821, 0.4760236, -1.435213, 0.1333333, 1, 0, 1,
-0.483887, -0.260481, -4.012121, 0.1294118, 1, 0, 1,
-0.4680504, -1.592701, -0.873957, 0.1215686, 1, 0, 1,
-0.4570542, -1.191502, -3.205474, 0.1176471, 1, 0, 1,
-0.4569989, 0.04554375, -1.209329, 0.1098039, 1, 0, 1,
-0.4554329, 0.2419221, -0.4778847, 0.1058824, 1, 0, 1,
-0.4539774, 0.488186, -2.103524, 0.09803922, 1, 0, 1,
-0.4535137, 2.220159, -1.447963, 0.09019608, 1, 0, 1,
-0.4475952, -0.4927251, -3.6197, 0.08627451, 1, 0, 1,
-0.4453179, 0.346027, -0.9326932, 0.07843138, 1, 0, 1,
-0.4438207, -0.9210604, -3.769166, 0.07450981, 1, 0, 1,
-0.4388707, 0.02983091, -1.635981, 0.06666667, 1, 0, 1,
-0.4357658, 1.113559, 0.8219786, 0.0627451, 1, 0, 1,
-0.4313057, 1.093258, -1.184878, 0.05490196, 1, 0, 1,
-0.4217294, 1.169933, -0.6129411, 0.05098039, 1, 0, 1,
-0.4203354, 0.1322532, -1.36601, 0.04313726, 1, 0, 1,
-0.4183221, 0.309986, -1.388275, 0.03921569, 1, 0, 1,
-0.4182233, -0.4899523, -2.198569, 0.03137255, 1, 0, 1,
-0.4137311, 0.01539605, -1.865645, 0.02745098, 1, 0, 1,
-0.4107857, 1.207515, 0.1676141, 0.01960784, 1, 0, 1,
-0.410784, -0.3055686, -2.928729, 0.01568628, 1, 0, 1,
-0.4065467, 0.4368128, 0.4572398, 0.007843138, 1, 0, 1,
-0.4055692, -0.6148718, -3.44591, 0.003921569, 1, 0, 1,
-0.4046293, -0.937578, -1.918907, 0, 1, 0.003921569, 1,
-0.4039619, 1.017068, -0.1605173, 0, 1, 0.01176471, 1,
-0.4032888, 1.544146, -0.7325514, 0, 1, 0.01568628, 1,
-0.4018068, -1.387668, -3.421524, 0, 1, 0.02352941, 1,
-0.3987042, -0.2709109, -3.157749, 0, 1, 0.02745098, 1,
-0.3979852, -0.1771403, -2.769301, 0, 1, 0.03529412, 1,
-0.3970842, -0.1309119, -1.466081, 0, 1, 0.03921569, 1,
-0.3951723, -0.751368, -2.140059, 0, 1, 0.04705882, 1,
-0.3913794, 0.8732715, -0.8061821, 0, 1, 0.05098039, 1,
-0.3827475, -0.9565153, -2.76482, 0, 1, 0.05882353, 1,
-0.381615, 0.47373, -0.6307231, 0, 1, 0.0627451, 1,
-0.3765696, -0.942573, -2.019587, 0, 1, 0.07058824, 1,
-0.376463, -1.43727, -1.966675, 0, 1, 0.07450981, 1,
-0.3728008, 0.3762537, -2.202151, 0, 1, 0.08235294, 1,
-0.3662895, 0.2438859, 1.323691, 0, 1, 0.08627451, 1,
-0.3614801, -0.3269686, -3.624898, 0, 1, 0.09411765, 1,
-0.3546253, -0.5002315, -3.586348, 0, 1, 0.1019608, 1,
-0.3508294, 1.20118, 0.1284194, 0, 1, 0.1058824, 1,
-0.3467605, 2.248634, -0.1914354, 0, 1, 0.1137255, 1,
-0.3463177, 0.5503793, 0.2014157, 0, 1, 0.1176471, 1,
-0.3321501, -1.225962, -2.457101, 0, 1, 0.1254902, 1,
-0.3280406, 2.085162, -0.08646722, 0, 1, 0.1294118, 1,
-0.325988, -1.261509, -1.968687, 0, 1, 0.1372549, 1,
-0.3228995, -0.6399004, -2.787339, 0, 1, 0.1411765, 1,
-0.3217789, 0.07454012, -0.9906698, 0, 1, 0.1490196, 1,
-0.3211457, -0.2870045, -1.732581, 0, 1, 0.1529412, 1,
-0.3153821, -0.04205205, -1.904238, 0, 1, 0.1607843, 1,
-0.3092048, -0.510061, -3.619011, 0, 1, 0.1647059, 1,
-0.3077228, 1.910143, 0.07621191, 0, 1, 0.172549, 1,
-0.3051759, -0.1811655, -1.252853, 0, 1, 0.1764706, 1,
-0.302237, -0.03574823, -1.862228, 0, 1, 0.1843137, 1,
-0.2954765, 0.4262164, -1.269006, 0, 1, 0.1882353, 1,
-0.2925415, 1.869005, -0.3662172, 0, 1, 0.1960784, 1,
-0.2873052, -1.2792, -2.615703, 0, 1, 0.2039216, 1,
-0.2838794, -1.011737, -3.172416, 0, 1, 0.2078431, 1,
-0.282308, 1.4294, -0.5782874, 0, 1, 0.2156863, 1,
-0.2764164, -0.1790453, -2.135329, 0, 1, 0.2196078, 1,
-0.2705556, 1.759039, -0.6198703, 0, 1, 0.227451, 1,
-0.2645337, 0.1469781, -1.593295, 0, 1, 0.2313726, 1,
-0.2623312, 0.1188947, -3.950782, 0, 1, 0.2392157, 1,
-0.2583459, 0.1599471, -2.265447, 0, 1, 0.2431373, 1,
-0.2574292, 0.422981, -1.654341, 0, 1, 0.2509804, 1,
-0.2563162, 0.8033234, 0.5652204, 0, 1, 0.254902, 1,
-0.2555428, -0.03460244, -1.332045, 0, 1, 0.2627451, 1,
-0.2541914, 1.073138, -0.9673235, 0, 1, 0.2666667, 1,
-0.2511369, -0.842279, -2.804504, 0, 1, 0.2745098, 1,
-0.2473709, 0.9150206, -1.275813, 0, 1, 0.2784314, 1,
-0.2472501, 0.466118, -0.3138549, 0, 1, 0.2862745, 1,
-0.2470416, 0.5582767, -1.017156, 0, 1, 0.2901961, 1,
-0.2452101, -0.06435399, -3.550176, 0, 1, 0.2980392, 1,
-0.2401048, -0.6279449, -1.297752, 0, 1, 0.3058824, 1,
-0.2393186, 0.2507307, 0.4562625, 0, 1, 0.3098039, 1,
-0.2365157, -1.618022, -2.842602, 0, 1, 0.3176471, 1,
-0.2346907, -0.1483924, -2.510285, 0, 1, 0.3215686, 1,
-0.2335262, 0.4230753, -0.07657716, 0, 1, 0.3294118, 1,
-0.2333481, -0.681853, -1.307876, 0, 1, 0.3333333, 1,
-0.2321579, 0.4747483, -0.2038852, 0, 1, 0.3411765, 1,
-0.2299804, -1.390802, -3.000745, 0, 1, 0.345098, 1,
-0.2293796, 1.159381, -1.783665, 0, 1, 0.3529412, 1,
-0.2266857, -1.216029, -2.967316, 0, 1, 0.3568628, 1,
-0.2239343, 0.3362978, -0.6429155, 0, 1, 0.3647059, 1,
-0.2146972, 0.3540623, -2.345287, 0, 1, 0.3686275, 1,
-0.2135675, -1.033637, -3.129761, 0, 1, 0.3764706, 1,
-0.2118814, -0.3783022, -1.549008, 0, 1, 0.3803922, 1,
-0.2117584, -0.3900885, -1.602213, 0, 1, 0.3882353, 1,
-0.2117094, -0.1878086, -0.2899143, 0, 1, 0.3921569, 1,
-0.2089607, -1.424937, -0.7212983, 0, 1, 0.4, 1,
-0.2074616, 0.4642737, -0.06895187, 0, 1, 0.4078431, 1,
-0.2038802, -0.04992089, -2.626017, 0, 1, 0.4117647, 1,
-0.2035373, 2.37358, -2.011366, 0, 1, 0.4196078, 1,
-0.2015941, 0.09299559, 0.3543976, 0, 1, 0.4235294, 1,
-0.1992289, 2.451354, -0.3147103, 0, 1, 0.4313726, 1,
-0.1968374, -1.10015, -2.441729, 0, 1, 0.4352941, 1,
-0.1941862, 0.6485577, -1.412373, 0, 1, 0.4431373, 1,
-0.1939565, -1.222029, -4.27876, 0, 1, 0.4470588, 1,
-0.189852, -0.6485189, -2.913688, 0, 1, 0.454902, 1,
-0.1896344, -1.287307, -3.682497, 0, 1, 0.4588235, 1,
-0.1877446, 0.6043019, -0.07592601, 0, 1, 0.4666667, 1,
-0.1874103, -0.4107524, -2.822362, 0, 1, 0.4705882, 1,
-0.1784611, 0.640507, -0.2482192, 0, 1, 0.4784314, 1,
-0.1706489, 1.849553, 0.5020393, 0, 1, 0.4823529, 1,
-0.1674314, -0.5611384, -1.773401, 0, 1, 0.4901961, 1,
-0.1648542, 1.186318, 0.2726901, 0, 1, 0.4941176, 1,
-0.1639512, -0.7284482, -4.618228, 0, 1, 0.5019608, 1,
-0.1603016, 0.1850683, -2.251333, 0, 1, 0.509804, 1,
-0.1567188, -2.486241, -3.756098, 0, 1, 0.5137255, 1,
-0.1549095, -0.2286865, -2.439328, 0, 1, 0.5215687, 1,
-0.1543135, -0.6716021, -1.795291, 0, 1, 0.5254902, 1,
-0.1536428, -0.1948326, -2.48167, 0, 1, 0.5333334, 1,
-0.1532685, -2.319349, -3.152, 0, 1, 0.5372549, 1,
-0.150778, -0.1874327, -2.539132, 0, 1, 0.5450981, 1,
-0.1475571, 0.2136772, -1.581211, 0, 1, 0.5490196, 1,
-0.1470936, -1.801261, -2.727469, 0, 1, 0.5568628, 1,
-0.140544, -0.1512576, -1.452775, 0, 1, 0.5607843, 1,
-0.135183, -0.7991644, -3.644966, 0, 1, 0.5686275, 1,
-0.133206, 0.6898505, 1.021353, 0, 1, 0.572549, 1,
-0.1311009, -0.2890389, -1.143434, 0, 1, 0.5803922, 1,
-0.1293364, 1.813417, 1.692811, 0, 1, 0.5843138, 1,
-0.1270609, 0.2753311, -0.9567441, 0, 1, 0.5921569, 1,
-0.1256653, 0.5395275, -2.023599, 0, 1, 0.5960785, 1,
-0.1214088, 0.5794726, -1.606968, 0, 1, 0.6039216, 1,
-0.1197198, -0.6371424, -2.100228, 0, 1, 0.6117647, 1,
-0.1114846, 0.07293727, -0.4053784, 0, 1, 0.6156863, 1,
-0.1087626, -0.8625075, -2.863226, 0, 1, 0.6235294, 1,
-0.1077102, 1.077901, 0.6765407, 0, 1, 0.627451, 1,
-0.1035058, 0.2236933, -0.536175, 0, 1, 0.6352941, 1,
-0.1030396, 0.4591734, 1.313529, 0, 1, 0.6392157, 1,
-0.1016282, 0.1541806, -0.7450167, 0, 1, 0.6470588, 1,
-0.1001614, 0.9493069, -0.5299585, 0, 1, 0.6509804, 1,
-0.09202299, 0.7682048, 0.7130216, 0, 1, 0.6588235, 1,
-0.08763801, -0.519476, -3.786945, 0, 1, 0.6627451, 1,
-0.08691268, -0.03042902, -2.36289, 0, 1, 0.6705883, 1,
-0.08434329, -0.03057385, -2.412737, 0, 1, 0.6745098, 1,
-0.08168137, -2.011007, -4.800838, 0, 1, 0.682353, 1,
-0.08120238, -0.02278972, -3.449955, 0, 1, 0.6862745, 1,
-0.07926506, 1.358898, 0.4885014, 0, 1, 0.6941177, 1,
-0.07828233, 0.2697179, -1.626041, 0, 1, 0.7019608, 1,
-0.07655304, -0.6092415, -3.129431, 0, 1, 0.7058824, 1,
-0.07615335, -1.1441, -2.347483, 0, 1, 0.7137255, 1,
-0.07585081, -1.087876, -2.072899, 0, 1, 0.7176471, 1,
-0.06954657, 1.156691, 2.614675, 0, 1, 0.7254902, 1,
-0.0675078, -0.0394997, -1.347147, 0, 1, 0.7294118, 1,
-0.06714074, -1.420768, -3.813139, 0, 1, 0.7372549, 1,
-0.06706975, 0.6448926, -0.4889637, 0, 1, 0.7411765, 1,
-0.06433038, -0.3065932, -5.668504, 0, 1, 0.7490196, 1,
-0.05992762, -0.07292893, -2.327303, 0, 1, 0.7529412, 1,
-0.05612603, 0.2308953, 0.1938586, 0, 1, 0.7607843, 1,
-0.05368218, 1.584939, 0.7681836, 0, 1, 0.7647059, 1,
-0.05296168, -0.006867226, -1.173578, 0, 1, 0.772549, 1,
-0.05114434, -0.9477625, -3.992625, 0, 1, 0.7764706, 1,
-0.04987967, 0.4088018, -0.5265911, 0, 1, 0.7843137, 1,
-0.04858877, 0.2897108, -1.969033, 0, 1, 0.7882353, 1,
-0.04826824, -0.953572, -2.449738, 0, 1, 0.7960784, 1,
-0.04415774, -0.5241426, -3.429001, 0, 1, 0.8039216, 1,
-0.03979224, 0.1660888, 0.7287451, 0, 1, 0.8078431, 1,
-0.03894275, -1.37991, -2.580969, 0, 1, 0.8156863, 1,
-0.03873032, 0.4498237, 0.2161514, 0, 1, 0.8196079, 1,
-0.03854508, -1.748863, -3.497366, 0, 1, 0.827451, 1,
-0.03830088, 0.4436782, 0.3945991, 0, 1, 0.8313726, 1,
-0.03679026, -0.7875933, -4.263542, 0, 1, 0.8392157, 1,
-0.02852058, 0.4159814, -1.012651, 0, 1, 0.8431373, 1,
-0.02806116, -1.337693, -1.62742, 0, 1, 0.8509804, 1,
-0.02637609, -1.833964, -1.155782, 0, 1, 0.854902, 1,
-0.02568013, 0.03834685, -0.5467423, 0, 1, 0.8627451, 1,
-0.02496583, -2.451562, -2.829101, 0, 1, 0.8666667, 1,
-0.02417229, -0.1398236, -1.640779, 0, 1, 0.8745098, 1,
-0.02274001, -1.297075, -3.555317, 0, 1, 0.8784314, 1,
-0.01988593, 0.4045069, -1.877308, 0, 1, 0.8862745, 1,
-0.01857463, -0.9977369, -3.321053, 0, 1, 0.8901961, 1,
-0.01496635, -0.5697516, -3.870836, 0, 1, 0.8980392, 1,
-0.01265693, -0.4181794, -2.368596, 0, 1, 0.9058824, 1,
-0.010916, -0.6395798, -2.272003, 0, 1, 0.9098039, 1,
-0.008615621, -1.192001, -3.977069, 0, 1, 0.9176471, 1,
-0.00289754, 0.09600109, -0.6033416, 0, 1, 0.9215686, 1,
0.006900697, -0.3348492, 2.563284, 0, 1, 0.9294118, 1,
0.01114529, -1.645573, 4.195535, 0, 1, 0.9333333, 1,
0.01354176, -0.01876475, 1.850107, 0, 1, 0.9411765, 1,
0.01428676, -0.0199424, 2.618996, 0, 1, 0.945098, 1,
0.01490236, -0.8202385, 2.349937, 0, 1, 0.9529412, 1,
0.02067984, 1.048825, 0.1141289, 0, 1, 0.9568627, 1,
0.02306879, -1.61755, 3.123661, 0, 1, 0.9647059, 1,
0.02898543, 0.8652918, 0.7582242, 0, 1, 0.9686275, 1,
0.03011759, 1.120898, -0.5703117, 0, 1, 0.9764706, 1,
0.03276073, -0.9789286, 1.621658, 0, 1, 0.9803922, 1,
0.04161184, 0.8787428, 0.2500698, 0, 1, 0.9882353, 1,
0.04902942, 0.2958481, 0.3602286, 0, 1, 0.9921569, 1,
0.04998298, -0.5108132, 3.07178, 0, 1, 1, 1,
0.05054392, 0.5935379, -0.3594632, 0, 0.9921569, 1, 1,
0.05179539, 0.6490427, 0.3176407, 0, 0.9882353, 1, 1,
0.05386459, -0.04031558, 1.829611, 0, 0.9803922, 1, 1,
0.05440404, 1.39098, 0.4774497, 0, 0.9764706, 1, 1,
0.05916766, 1.100528, 1.054842, 0, 0.9686275, 1, 1,
0.06147984, -2.204934, 2.040718, 0, 0.9647059, 1, 1,
0.06161565, 0.8070475, -0.7697899, 0, 0.9568627, 1, 1,
0.06224943, 1.636314, 1.281859, 0, 0.9529412, 1, 1,
0.06538051, -0.830748, 4.625426, 0, 0.945098, 1, 1,
0.06601273, -1.68174, 2.952494, 0, 0.9411765, 1, 1,
0.06888107, 0.9583606, 1.298242, 0, 0.9333333, 1, 1,
0.06932921, -0.8811897, 3.307707, 0, 0.9294118, 1, 1,
0.0720285, -0.7578683, 3.116437, 0, 0.9215686, 1, 1,
0.07442516, 1.858849, 0.2343301, 0, 0.9176471, 1, 1,
0.07482252, -1.623634, 2.867651, 0, 0.9098039, 1, 1,
0.07509279, 0.9255127, -0.3329927, 0, 0.9058824, 1, 1,
0.08584329, 0.7015104, -0.3433314, 0, 0.8980392, 1, 1,
0.08826873, 0.3571343, 0.1519418, 0, 0.8901961, 1, 1,
0.08936317, -0.4167765, 3.81924, 0, 0.8862745, 1, 1,
0.08990438, 0.1307063, 0.5373172, 0, 0.8784314, 1, 1,
0.09126825, 0.8996954, -0.631383, 0, 0.8745098, 1, 1,
0.09188189, 0.001276283, 0.8906906, 0, 0.8666667, 1, 1,
0.09950832, -1.050125, 2.275354, 0, 0.8627451, 1, 1,
0.1023364, 0.7486127, -1.415134, 0, 0.854902, 1, 1,
0.103048, 0.02488097, 1.940263, 0, 0.8509804, 1, 1,
0.1067196, -0.3449205, 2.482745, 0, 0.8431373, 1, 1,
0.1070967, 0.6837734, 0.7258481, 0, 0.8392157, 1, 1,
0.1108466, 0.9174645, 0.6501336, 0, 0.8313726, 1, 1,
0.114426, 0.03991457, 1.765224, 0, 0.827451, 1, 1,
0.1175403, -0.0689289, 1.183894, 0, 0.8196079, 1, 1,
0.1206928, -0.9579208, 2.546674, 0, 0.8156863, 1, 1,
0.1242287, -1.987424, 4.460369, 0, 0.8078431, 1, 1,
0.128202, -1.512981, 4.602303, 0, 0.8039216, 1, 1,
0.1287297, -0.5713804, 1.052706, 0, 0.7960784, 1, 1,
0.1321037, 0.1935885, -0.8647645, 0, 0.7882353, 1, 1,
0.1347293, 0.5462711, -1.615307, 0, 0.7843137, 1, 1,
0.1357247, 0.3509224, -0.4267187, 0, 0.7764706, 1, 1,
0.1373663, 1.815573, 0.3815987, 0, 0.772549, 1, 1,
0.1377085, -0.03083791, 0.4548064, 0, 0.7647059, 1, 1,
0.1378631, 0.7915204, -0.474976, 0, 0.7607843, 1, 1,
0.140719, -0.6326435, 2.196409, 0, 0.7529412, 1, 1,
0.1463823, 1.069532, -0.6371485, 0, 0.7490196, 1, 1,
0.1463955, 2.227395, -0.5353878, 0, 0.7411765, 1, 1,
0.146928, 1.6232, -0.9108168, 0, 0.7372549, 1, 1,
0.1477348, 0.1277093, 1.86782, 0, 0.7294118, 1, 1,
0.1503857, -0.9369133, -0.03018517, 0, 0.7254902, 1, 1,
0.1604719, -0.04101038, 1.292329, 0, 0.7176471, 1, 1,
0.1638812, 2.029356, 0.1170778, 0, 0.7137255, 1, 1,
0.1665739, 0.8979825, 0.6253346, 0, 0.7058824, 1, 1,
0.168522, 0.05184286, 0.8334296, 0, 0.6980392, 1, 1,
0.1721898, -0.5758473, 3.516137, 0, 0.6941177, 1, 1,
0.1721985, -1.588596, 4.498032, 0, 0.6862745, 1, 1,
0.1755758, -0.3361952, 2.103645, 0, 0.682353, 1, 1,
0.1756022, 1.536456, -0.1438991, 0, 0.6745098, 1, 1,
0.1777141, 0.4597749, 1.529781, 0, 0.6705883, 1, 1,
0.1876818, 1.694715, 0.2871632, 0, 0.6627451, 1, 1,
0.1889625, -0.4259495, 5.158365, 0, 0.6588235, 1, 1,
0.1902746, 0.107372, 1.709539, 0, 0.6509804, 1, 1,
0.1976234, -1.248426, 2.537291, 0, 0.6470588, 1, 1,
0.1977903, -1.067009, 3.327, 0, 0.6392157, 1, 1,
0.2020209, 0.3082574, 1.062931, 0, 0.6352941, 1, 1,
0.2023257, -0.7416081, 2.334049, 0, 0.627451, 1, 1,
0.2033728, 1.330442, 1.665834, 0, 0.6235294, 1, 1,
0.2075545, -0.2966863, 2.572829, 0, 0.6156863, 1, 1,
0.2084923, -0.5761002, 4.573811, 0, 0.6117647, 1, 1,
0.2097452, -0.7458212, 2.766817, 0, 0.6039216, 1, 1,
0.2124657, 0.9599586, -0.5198348, 0, 0.5960785, 1, 1,
0.2130605, 0.104209, 1.94019, 0, 0.5921569, 1, 1,
0.2136223, -1.468766, 3.960853, 0, 0.5843138, 1, 1,
0.2221683, 0.6702893, 0.8272185, 0, 0.5803922, 1, 1,
0.2241945, 0.694438, -0.7937981, 0, 0.572549, 1, 1,
0.2242976, 1.352085, -0.853643, 0, 0.5686275, 1, 1,
0.2279423, -0.1723914, 0.7315519, 0, 0.5607843, 1, 1,
0.2326034, 1.010061, 2.580198, 0, 0.5568628, 1, 1,
0.233052, -0.5604799, 3.04016, 0, 0.5490196, 1, 1,
0.2355736, 0.8492273, 0.9318512, 0, 0.5450981, 1, 1,
0.2366569, -0.3191761, 1.229159, 0, 0.5372549, 1, 1,
0.2492746, -0.2175559, 3.954849, 0, 0.5333334, 1, 1,
0.250499, 0.1532433, -0.3600549, 0, 0.5254902, 1, 1,
0.2512253, 0.3021154, -0.3092233, 0, 0.5215687, 1, 1,
0.253647, 0.3621432, 1.060676, 0, 0.5137255, 1, 1,
0.254907, 0.9448006, -0.257709, 0, 0.509804, 1, 1,
0.2559539, 0.1629995, 1.807602, 0, 0.5019608, 1, 1,
0.2596819, -0.4118797, 2.724762, 0, 0.4941176, 1, 1,
0.2638326, 1.067758, 0.3754402, 0, 0.4901961, 1, 1,
0.2700949, 0.09453209, 1.80764, 0, 0.4823529, 1, 1,
0.2718762, 0.02431902, 0.7547501, 0, 0.4784314, 1, 1,
0.276217, -0.526605, 1.920517, 0, 0.4705882, 1, 1,
0.2778265, -0.7071183, 2.904519, 0, 0.4666667, 1, 1,
0.2781983, 1.393792, 0.4104099, 0, 0.4588235, 1, 1,
0.2782087, 0.362296, 0.8319479, 0, 0.454902, 1, 1,
0.2846565, -0.5805156, 1.662934, 0, 0.4470588, 1, 1,
0.2853938, -0.9380955, 3.839186, 0, 0.4431373, 1, 1,
0.2854368, 0.5099899, 0.5639648, 0, 0.4352941, 1, 1,
0.2863512, -1.412874, 1.974997, 0, 0.4313726, 1, 1,
0.2876748, -0.9441388, 3.079422, 0, 0.4235294, 1, 1,
0.2877973, 0.01533388, 3.053369, 0, 0.4196078, 1, 1,
0.2921221, 1.708954, 0.3946914, 0, 0.4117647, 1, 1,
0.2925542, 0.09645813, 2.52938, 0, 0.4078431, 1, 1,
0.2946662, 1.038259, -0.7859285, 0, 0.4, 1, 1,
0.2953237, 0.6661976, -0.2607959, 0, 0.3921569, 1, 1,
0.2980244, -0.6644314, 2.741946, 0, 0.3882353, 1, 1,
0.2990954, -1.289284, 2.319781, 0, 0.3803922, 1, 1,
0.3103, 0.677812, 1.343528, 0, 0.3764706, 1, 1,
0.3110712, 0.06066794, -0.9705483, 0, 0.3686275, 1, 1,
0.313844, 0.3199345, 0.9914942, 0, 0.3647059, 1, 1,
0.3177956, 0.2992478, 0.5199267, 0, 0.3568628, 1, 1,
0.3204845, 0.4588679, -0.5777311, 0, 0.3529412, 1, 1,
0.3205413, 0.2805446, 0.7260427, 0, 0.345098, 1, 1,
0.3247802, 0.09008723, 2.325976, 0, 0.3411765, 1, 1,
0.3294131, 2.103112, 0.9419502, 0, 0.3333333, 1, 1,
0.3303503, 1.324654, -0.7871109, 0, 0.3294118, 1, 1,
0.3341188, 0.6499922, 0.3727458, 0, 0.3215686, 1, 1,
0.339393, 1.112858, 0.8904214, 0, 0.3176471, 1, 1,
0.3398488, -0.7285358, 1.345348, 0, 0.3098039, 1, 1,
0.3402763, 0.7142991, 0.8326422, 0, 0.3058824, 1, 1,
0.3410316, 0.6153953, 0.2258979, 0, 0.2980392, 1, 1,
0.3416473, 1.08001, -1.18134, 0, 0.2901961, 1, 1,
0.3429859, -0.01254581, 2.933855, 0, 0.2862745, 1, 1,
0.3479501, 0.3020058, 0.9418008, 0, 0.2784314, 1, 1,
0.3482903, -0.1635756, 1.650561, 0, 0.2745098, 1, 1,
0.3487317, -0.3305297, 1.853839, 0, 0.2666667, 1, 1,
0.3512713, 1.324332, 1.466661, 0, 0.2627451, 1, 1,
0.3519608, -2.167562, 3.08968, 0, 0.254902, 1, 1,
0.3553631, 0.4887538, 1.157293, 0, 0.2509804, 1, 1,
0.3563127, -1.117807, 2.274849, 0, 0.2431373, 1, 1,
0.3567969, -0.3471959, 1.390476, 0, 0.2392157, 1, 1,
0.3606972, -0.1155275, 3.078008, 0, 0.2313726, 1, 1,
0.3632084, 0.4355106, -0.2284381, 0, 0.227451, 1, 1,
0.363588, -0.3001666, 3.078838, 0, 0.2196078, 1, 1,
0.3662, -1.765553, 2.217546, 0, 0.2156863, 1, 1,
0.3712548, -0.1785859, 3.451257, 0, 0.2078431, 1, 1,
0.3752638, -0.07052496, 2.49732, 0, 0.2039216, 1, 1,
0.3779952, -0.07683998, 0.3776567, 0, 0.1960784, 1, 1,
0.3783521, 0.5429662, -0.6468368, 0, 0.1882353, 1, 1,
0.381947, 0.3018192, 1.629288, 0, 0.1843137, 1, 1,
0.3864543, -0.09948813, 3.193724, 0, 0.1764706, 1, 1,
0.3884352, -0.502709, -0.08571925, 0, 0.172549, 1, 1,
0.3940133, -0.8198453, 1.156032, 0, 0.1647059, 1, 1,
0.3968962, -1.590821, 3.3356, 0, 0.1607843, 1, 1,
0.3994717, 1.112767, 1.214223, 0, 0.1529412, 1, 1,
0.4003064, 1.182803, 0.373207, 0, 0.1490196, 1, 1,
0.401119, 1.206398, 1.819918, 0, 0.1411765, 1, 1,
0.4032053, -0.9848174, 3.109182, 0, 0.1372549, 1, 1,
0.4044998, -0.9898835, 2.502155, 0, 0.1294118, 1, 1,
0.4046938, -1.784531, 3.022357, 0, 0.1254902, 1, 1,
0.4144326, 2.03038, 0.5185372, 0, 0.1176471, 1, 1,
0.4150008, 0.06662577, 1.105801, 0, 0.1137255, 1, 1,
0.4157125, 0.322976, 2.445794, 0, 0.1058824, 1, 1,
0.4240198, -1.321487, 2.733366, 0, 0.09803922, 1, 1,
0.4275882, 0.1760222, 1.396636, 0, 0.09411765, 1, 1,
0.4332358, -1.256951, 3.726895, 0, 0.08627451, 1, 1,
0.4338425, 0.01790059, 4.307352, 0, 0.08235294, 1, 1,
0.4355287, 1.176864, -0.335968, 0, 0.07450981, 1, 1,
0.4364831, -0.6625591, 3.482579, 0, 0.07058824, 1, 1,
0.4373095, -0.9444637, 1.999191, 0, 0.0627451, 1, 1,
0.4400676, -1.714551, 2.551179, 0, 0.05882353, 1, 1,
0.4442365, 0.6129029, 2.238336, 0, 0.05098039, 1, 1,
0.4445544, -0.05114165, 0.3229499, 0, 0.04705882, 1, 1,
0.4455479, 1.397069, 0.5130914, 0, 0.03921569, 1, 1,
0.448397, -0.1370105, 1.495679, 0, 0.03529412, 1, 1,
0.4498438, -0.5303046, -0.4075834, 0, 0.02745098, 1, 1,
0.4500562, 0.4557329, 0.8791469, 0, 0.02352941, 1, 1,
0.4516894, 0.0271796, 1.766798, 0, 0.01568628, 1, 1,
0.4566627, 1.048047, 1.596107, 0, 0.01176471, 1, 1,
0.4577624, -0.1416262, 1.400071, 0, 0.003921569, 1, 1,
0.4605848, -0.9377125, 3.880762, 0.003921569, 0, 1, 1,
0.4608144, 0.8509828, 1.727881, 0.007843138, 0, 1, 1,
0.4682869, 0.8351595, 0.3862585, 0.01568628, 0, 1, 1,
0.4683949, 1.661074, 1.166284, 0.01960784, 0, 1, 1,
0.4707157, 1.709091, 1.471803, 0.02745098, 0, 1, 1,
0.4715498, 0.08530335, 3.292412, 0.03137255, 0, 1, 1,
0.4722166, -0.9371662, 3.600339, 0.03921569, 0, 1, 1,
0.4726774, 0.1162134, 1.297474, 0.04313726, 0, 1, 1,
0.472898, -1.470195, 4.392209, 0.05098039, 0, 1, 1,
0.4776885, -0.2135544, 3.004888, 0.05490196, 0, 1, 1,
0.4844362, 0.03970899, 0.754343, 0.0627451, 0, 1, 1,
0.4882809, 0.05139308, 1.025043, 0.06666667, 0, 1, 1,
0.4884857, 1.145979, 0.6394627, 0.07450981, 0, 1, 1,
0.4888996, -0.6535336, 2.23413, 0.07843138, 0, 1, 1,
0.492739, -0.2008409, 1.884452, 0.08627451, 0, 1, 1,
0.4934976, -0.2673404, 1.401755, 0.09019608, 0, 1, 1,
0.4940002, 0.1120875, 1.736652, 0.09803922, 0, 1, 1,
0.4960845, 0.6923478, 0.8061543, 0.1058824, 0, 1, 1,
0.5060866, -0.8712837, 2.447634, 0.1098039, 0, 1, 1,
0.5066836, -0.2229304, 2.750822, 0.1176471, 0, 1, 1,
0.50772, 0.3029793, 0.8186653, 0.1215686, 0, 1, 1,
0.5085501, 0.3579001, 0.3327255, 0.1294118, 0, 1, 1,
0.5140771, -1.208359, 2.756008, 0.1333333, 0, 1, 1,
0.5145662, 0.2253311, 0.1863797, 0.1411765, 0, 1, 1,
0.5186036, -0.3877247, 0.7523025, 0.145098, 0, 1, 1,
0.5213119, 0.1392396, 0.4266605, 0.1529412, 0, 1, 1,
0.527163, -1.116727, 3.174149, 0.1568628, 0, 1, 1,
0.5300796, 0.9306496, 0.1578444, 0.1647059, 0, 1, 1,
0.5317869, 0.2455851, 0.9691885, 0.1686275, 0, 1, 1,
0.5338031, 0.8041475, 2.002038, 0.1764706, 0, 1, 1,
0.5340018, -0.8658308, 1.45694, 0.1803922, 0, 1, 1,
0.5343179, 0.3356559, 1.953603, 0.1882353, 0, 1, 1,
0.5383464, -0.7596865, 3.576802, 0.1921569, 0, 1, 1,
0.5391198, -0.7949265, 2.065492, 0.2, 0, 1, 1,
0.5441903, 1.53511, 1.182081, 0.2078431, 0, 1, 1,
0.5471672, 0.370353, 1.672215, 0.2117647, 0, 1, 1,
0.5477024, 1.043267, 1.272214, 0.2196078, 0, 1, 1,
0.5503383, -0.5892972, 2.005487, 0.2235294, 0, 1, 1,
0.5537381, 0.6634033, 0.2047261, 0.2313726, 0, 1, 1,
0.5566221, 1.008983, 0.6939902, 0.2352941, 0, 1, 1,
0.557908, 0.218967, 1.371037, 0.2431373, 0, 1, 1,
0.5646716, -0.9450427, 1.348189, 0.2470588, 0, 1, 1,
0.5646747, -2.153195, 2.18076, 0.254902, 0, 1, 1,
0.5653257, 0.7303581, 0.6551208, 0.2588235, 0, 1, 1,
0.5681339, 0.1134445, 1.175381, 0.2666667, 0, 1, 1,
0.5683153, -1.911106, 3.261068, 0.2705882, 0, 1, 1,
0.5705572, 0.8117048, -0.0004266506, 0.2784314, 0, 1, 1,
0.5732307, 1.848344, 0.5779259, 0.282353, 0, 1, 1,
0.5776634, -1.91988, 2.53819, 0.2901961, 0, 1, 1,
0.5780726, 1.197437, -0.2437076, 0.2941177, 0, 1, 1,
0.5790153, -0.3053959, 1.830685, 0.3019608, 0, 1, 1,
0.5811713, -1.045742, 2.049237, 0.3098039, 0, 1, 1,
0.582629, -0.7261317, 3.849141, 0.3137255, 0, 1, 1,
0.5852531, -0.4261003, 3.655792, 0.3215686, 0, 1, 1,
0.5881648, -0.5711275, 1.995803, 0.3254902, 0, 1, 1,
0.5894261, 1.892846, 0.3839107, 0.3333333, 0, 1, 1,
0.5963721, -0.8623443, 1.500968, 0.3372549, 0, 1, 1,
0.596912, -0.4879865, 2.734684, 0.345098, 0, 1, 1,
0.6015666, -0.2402551, 3.573302, 0.3490196, 0, 1, 1,
0.6034064, 1.185491, -0.1249128, 0.3568628, 0, 1, 1,
0.6066632, 1.341678, 0.7933296, 0.3607843, 0, 1, 1,
0.609549, 1.799863, 1.082049, 0.3686275, 0, 1, 1,
0.6148734, -0.367673, 2.697912, 0.372549, 0, 1, 1,
0.6152346, 1.073987, 0.3327748, 0.3803922, 0, 1, 1,
0.6168264, -0.5836788, 2.634161, 0.3843137, 0, 1, 1,
0.6168428, -0.6083911, 3.562065, 0.3921569, 0, 1, 1,
0.620622, -0.6988048, 3.562321, 0.3960784, 0, 1, 1,
0.627754, 1.008927, -0.4861891, 0.4039216, 0, 1, 1,
0.6298262, 0.3166997, 2.113113, 0.4117647, 0, 1, 1,
0.6306377, 0.5971247, 2.519531, 0.4156863, 0, 1, 1,
0.6325073, 1.261406, 1.313917, 0.4235294, 0, 1, 1,
0.6332155, 0.7468228, 0.05561329, 0.427451, 0, 1, 1,
0.6351357, 1.177025, 0.793718, 0.4352941, 0, 1, 1,
0.6389295, -0.6801217, 2.645492, 0.4392157, 0, 1, 1,
0.6398215, -0.3805717, 2.887963, 0.4470588, 0, 1, 1,
0.641565, 0.1664152, 2.024228, 0.4509804, 0, 1, 1,
0.643504, 0.4645373, 0.3257654, 0.4588235, 0, 1, 1,
0.6443837, 0.4594305, 2.853482, 0.4627451, 0, 1, 1,
0.6466152, 0.1993094, 1.284764, 0.4705882, 0, 1, 1,
0.6470588, -1.765994, 2.844982, 0.4745098, 0, 1, 1,
0.6512589, 0.1545001, 2.168237, 0.4823529, 0, 1, 1,
0.6527998, 1.352157, 0.3587222, 0.4862745, 0, 1, 1,
0.6540225, -0.6152848, 1.17914, 0.4941176, 0, 1, 1,
0.6540771, -1.642543, 0.07259764, 0.5019608, 0, 1, 1,
0.6555066, -0.252222, 3.186232, 0.5058824, 0, 1, 1,
0.6555983, 0.768289, 0.9082559, 0.5137255, 0, 1, 1,
0.6570166, -0.2526831, 0.3617843, 0.5176471, 0, 1, 1,
0.6577848, -1.309626, 3.339647, 0.5254902, 0, 1, 1,
0.6647348, 0.9370416, -1.230513, 0.5294118, 0, 1, 1,
0.6654643, -1.29142, 1.60437, 0.5372549, 0, 1, 1,
0.6722742, 0.9567958, 1.530231, 0.5411765, 0, 1, 1,
0.6746399, -0.1793267, 1.761293, 0.5490196, 0, 1, 1,
0.6772433, -1.046416, 3.822926, 0.5529412, 0, 1, 1,
0.6794829, -2.880615, 3.125297, 0.5607843, 0, 1, 1,
0.6820402, -1.55287, 3.257155, 0.5647059, 0, 1, 1,
0.6836475, 0.3735411, 0.9897321, 0.572549, 0, 1, 1,
0.6841227, 0.1772587, 1.082346, 0.5764706, 0, 1, 1,
0.6841494, 0.4034401, 1.244158, 0.5843138, 0, 1, 1,
0.6957124, -0.05465977, 1.453669, 0.5882353, 0, 1, 1,
0.6968015, -0.09076708, 1.363612, 0.5960785, 0, 1, 1,
0.6968286, -1.416533, 2.770058, 0.6039216, 0, 1, 1,
0.6971903, -1.19738, 3.998935, 0.6078432, 0, 1, 1,
0.6978662, -0.1130208, 2.053016, 0.6156863, 0, 1, 1,
0.7009054, -0.1831038, 0.8255939, 0.6196079, 0, 1, 1,
0.703043, -0.9895689, 2.859895, 0.627451, 0, 1, 1,
0.7042332, 1.036226, 0.6912196, 0.6313726, 0, 1, 1,
0.7055185, -1.531149, 3.258191, 0.6392157, 0, 1, 1,
0.7067955, 0.5614265, 0.7690884, 0.6431373, 0, 1, 1,
0.7101604, -1.112725, 1.933757, 0.6509804, 0, 1, 1,
0.714914, 0.695125, 1.463462, 0.654902, 0, 1, 1,
0.716399, 0.2772001, 2.789736, 0.6627451, 0, 1, 1,
0.7200699, 0.2173351, 0.4286413, 0.6666667, 0, 1, 1,
0.7256619, -1.835296, 4.339989, 0.6745098, 0, 1, 1,
0.7260435, 1.679809, 0.3341865, 0.6784314, 0, 1, 1,
0.7303735, -1.030733, 2.557839, 0.6862745, 0, 1, 1,
0.7325718, -0.3330597, 1.201562, 0.6901961, 0, 1, 1,
0.7373137, -1.171541, 2.773997, 0.6980392, 0, 1, 1,
0.7373188, -0.3698736, 3.312348, 0.7058824, 0, 1, 1,
0.7380322, -0.3311369, 2.40625, 0.7098039, 0, 1, 1,
0.7495209, -0.1419132, 0.2845526, 0.7176471, 0, 1, 1,
0.7512013, 0.7796088, 0.6719179, 0.7215686, 0, 1, 1,
0.7515925, -0.2027744, 2.175569, 0.7294118, 0, 1, 1,
0.7537165, 0.02214332, 2.146865, 0.7333333, 0, 1, 1,
0.7548304, 0.4669334, 0.4865969, 0.7411765, 0, 1, 1,
0.7563112, -0.7578038, 2.701865, 0.7450981, 0, 1, 1,
0.7597318, -1.240389, 2.438471, 0.7529412, 0, 1, 1,
0.7620377, 0.08241048, 0.2450775, 0.7568628, 0, 1, 1,
0.7637444, -0.4847583, 2.635601, 0.7647059, 0, 1, 1,
0.7667117, -0.1062074, -2.204822, 0.7686275, 0, 1, 1,
0.7710333, 0.7515388, 2.545261, 0.7764706, 0, 1, 1,
0.7765654, 1.154256, 2.283296, 0.7803922, 0, 1, 1,
0.7794398, -0.1510589, 1.227859, 0.7882353, 0, 1, 1,
0.7804605, 0.5855176, 0.1670427, 0.7921569, 0, 1, 1,
0.7845342, -0.2831273, 2.027424, 0.8, 0, 1, 1,
0.7849162, -0.6026874, 4.370269, 0.8078431, 0, 1, 1,
0.7866581, -0.579738, 1.144465, 0.8117647, 0, 1, 1,
0.7877679, -1.493123, 3.021332, 0.8196079, 0, 1, 1,
0.7923533, 0.06695542, 2.597483, 0.8235294, 0, 1, 1,
0.7937233, 0.9946228, 0.8647079, 0.8313726, 0, 1, 1,
0.7943672, -1.704676, 4.687175, 0.8352941, 0, 1, 1,
0.8018007, -0.2014932, 0.88627, 0.8431373, 0, 1, 1,
0.8037308, -0.2341577, -0.1262937, 0.8470588, 0, 1, 1,
0.807329, 0.08340909, 0.534525, 0.854902, 0, 1, 1,
0.8133205, 1.859288, 0.52417, 0.8588235, 0, 1, 1,
0.8151474, -0.9533556, 2.118366, 0.8666667, 0, 1, 1,
0.819464, -0.03647814, 1.845235, 0.8705882, 0, 1, 1,
0.8197199, 0.7135715, 1.814802, 0.8784314, 0, 1, 1,
0.8296295, -0.1894406, 1.511876, 0.8823529, 0, 1, 1,
0.8306715, -0.128628, 1.54893, 0.8901961, 0, 1, 1,
0.8369535, -0.9189481, 3.30805, 0.8941177, 0, 1, 1,
0.8384919, 0.9420967, 1.672285, 0.9019608, 0, 1, 1,
0.8432768, -0.7128461, -0.6277647, 0.9098039, 0, 1, 1,
0.8530695, -1.550648, 2.490586, 0.9137255, 0, 1, 1,
0.8534296, 0.5909021, 0.9380284, 0.9215686, 0, 1, 1,
0.8556299, -0.3381796, 1.133465, 0.9254902, 0, 1, 1,
0.8636053, 1.209279, 1.361759, 0.9333333, 0, 1, 1,
0.8647186, -1.348266, 1.613346, 0.9372549, 0, 1, 1,
0.8671647, 1.558561, -0.2256275, 0.945098, 0, 1, 1,
0.8709524, -1.536022, 3.459429, 0.9490196, 0, 1, 1,
0.8750215, 1.036541, 0.05517112, 0.9568627, 0, 1, 1,
0.8778625, -0.05534206, 1.610645, 0.9607843, 0, 1, 1,
0.8851549, -1.818467, 3.840398, 0.9686275, 0, 1, 1,
0.8931943, -0.7897583, 1.518923, 0.972549, 0, 1, 1,
0.9094625, -0.07394843, 1.330113, 0.9803922, 0, 1, 1,
0.9138961, -0.1115201, 1.193771, 0.9843137, 0, 1, 1,
0.9175379, -0.641332, 2.244806, 0.9921569, 0, 1, 1,
0.9229237, 0.8102855, 0.8111554, 0.9960784, 0, 1, 1,
0.9256671, 0.2728136, 2.496273, 1, 0, 0.9960784, 1,
0.9258634, -2.313722, 2.902022, 1, 0, 0.9882353, 1,
0.9264109, -0.3366114, 2.482034, 1, 0, 0.9843137, 1,
0.940052, 0.2671949, 0.3492647, 1, 0, 0.9764706, 1,
0.9405928, -1.137661, 3.848479, 1, 0, 0.972549, 1,
0.9470307, 0.5105832, 2.015718, 1, 0, 0.9647059, 1,
0.9474198, 0.972083, 0.2349947, 1, 0, 0.9607843, 1,
0.9476216, 0.3306129, 1.210163, 1, 0, 0.9529412, 1,
0.9488404, 1.507052, 1.468619, 1, 0, 0.9490196, 1,
0.952528, -0.9702303, 2.479707, 1, 0, 0.9411765, 1,
0.9568857, -0.1432521, 2.318078, 1, 0, 0.9372549, 1,
0.965835, -0.1177958, 0.3181293, 1, 0, 0.9294118, 1,
0.9882621, 0.5653106, 1.607155, 1, 0, 0.9254902, 1,
0.989081, -0.1929296, 1.005751, 1, 0, 0.9176471, 1,
0.9901949, -0.7541307, 2.922714, 1, 0, 0.9137255, 1,
0.9904569, -0.09772356, 2.085615, 1, 0, 0.9058824, 1,
0.9915271, 1.378957, 1.669394, 1, 0, 0.9019608, 1,
0.9944612, -1.277121, 2.752441, 1, 0, 0.8941177, 1,
0.9999969, -0.09661222, 1.81831, 1, 0, 0.8862745, 1,
1.000022, 0.4718307, 1.656407, 1, 0, 0.8823529, 1,
1.00066, -1.053772, 2.548824, 1, 0, 0.8745098, 1,
1.000996, -2.053699, 2.768069, 1, 0, 0.8705882, 1,
1.002378, -0.4896979, 3.362365, 1, 0, 0.8627451, 1,
1.00463, 2.592379, 1.223664, 1, 0, 0.8588235, 1,
1.00917, 1.048651, 1.497922, 1, 0, 0.8509804, 1,
1.015465, -0.4529265, 0.5965702, 1, 0, 0.8470588, 1,
1.016441, 0.3506537, 0.414166, 1, 0, 0.8392157, 1,
1.018007, 0.4840255, 2.284302, 1, 0, 0.8352941, 1,
1.025764, -2.381757, 1.744197, 1, 0, 0.827451, 1,
1.03854, 1.154104, -0.1006103, 1, 0, 0.8235294, 1,
1.041679, 1.248358, 2.515063, 1, 0, 0.8156863, 1,
1.043188, 0.7325498, 1.580337, 1, 0, 0.8117647, 1,
1.045854, -0.06621833, 1.141668, 1, 0, 0.8039216, 1,
1.052198, -1.395292, 3.714036, 1, 0, 0.7960784, 1,
1.057892, 0.02403545, 1.845318, 1, 0, 0.7921569, 1,
1.063974, 1.786776, -1.221529, 1, 0, 0.7843137, 1,
1.064653, -1.614535, 4.547501, 1, 0, 0.7803922, 1,
1.086521, -0.3035613, 1.516035, 1, 0, 0.772549, 1,
1.098588, 0.9299258, 0.5841358, 1, 0, 0.7686275, 1,
1.108956, -0.07187323, 2.388109, 1, 0, 0.7607843, 1,
1.112705, 0.1131834, 1.366345, 1, 0, 0.7568628, 1,
1.112837, 0.03258044, 0.463712, 1, 0, 0.7490196, 1,
1.123903, 0.3418319, 1.390835, 1, 0, 0.7450981, 1,
1.125444, -0.1300135, 2.501581, 1, 0, 0.7372549, 1,
1.130687, -0.8519711, 2.960635, 1, 0, 0.7333333, 1,
1.135552, -1.199568, 1.304632, 1, 0, 0.7254902, 1,
1.140633, 1.191042, 0.4443793, 1, 0, 0.7215686, 1,
1.14218, -1.307602, 3.898729, 1, 0, 0.7137255, 1,
1.14471, -0.5656142, 2.822134, 1, 0, 0.7098039, 1,
1.145355, -0.8082045, 3.355703, 1, 0, 0.7019608, 1,
1.146545, -0.0199655, 0.6442561, 1, 0, 0.6941177, 1,
1.14924, -0.6652827, 3.984706, 1, 0, 0.6901961, 1,
1.154269, 0.2348435, 2.253994, 1, 0, 0.682353, 1,
1.155283, -0.7356489, 0.3822763, 1, 0, 0.6784314, 1,
1.162138, -0.08838052, 1.148208, 1, 0, 0.6705883, 1,
1.162739, 0.9802418, 1.988963, 1, 0, 0.6666667, 1,
1.192262, 1.599324, -0.07218211, 1, 0, 0.6588235, 1,
1.198973, -0.8651057, 1.987613, 1, 0, 0.654902, 1,
1.20218, -0.6385003, -0.1705743, 1, 0, 0.6470588, 1,
1.206867, 1.566826, 1.582203, 1, 0, 0.6431373, 1,
1.209294, 1.651651, 0.2975969, 1, 0, 0.6352941, 1,
1.211166, -0.6318023, 3.289722, 1, 0, 0.6313726, 1,
1.221724, 1.658829, 1.280454, 1, 0, 0.6235294, 1,
1.234123, -1.747281, 1.772118, 1, 0, 0.6196079, 1,
1.240571, -0.5760776, 2.13146, 1, 0, 0.6117647, 1,
1.258481, 0.6198785, -0.188306, 1, 0, 0.6078432, 1,
1.264306, -0.8545401, 2.896926, 1, 0, 0.6, 1,
1.274215, -1.161525, 4.021453, 1, 0, 0.5921569, 1,
1.274438, -1.090095, 1.378391, 1, 0, 0.5882353, 1,
1.277098, 0.7497361, 1.769579, 1, 0, 0.5803922, 1,
1.283276, -1.574562, 2.570256, 1, 0, 0.5764706, 1,
1.289823, 0.1094984, 1.224669, 1, 0, 0.5686275, 1,
1.297596, 0.7446809, 1.631647, 1, 0, 0.5647059, 1,
1.29824, 2.096831, -1.116462, 1, 0, 0.5568628, 1,
1.298431, -1.446478, 1.61975, 1, 0, 0.5529412, 1,
1.309254, -0.7560291, 1.399616, 1, 0, 0.5450981, 1,
1.312079, -0.7740883, 1.149818, 1, 0, 0.5411765, 1,
1.314675, 0.5883422, 3.386462, 1, 0, 0.5333334, 1,
1.318343, -1.38264, 4.016221, 1, 0, 0.5294118, 1,
1.327467, 2.01356, 0.3635905, 1, 0, 0.5215687, 1,
1.333802, 1.330276, -0.7817564, 1, 0, 0.5176471, 1,
1.340063, -1.415069, 3.484426, 1, 0, 0.509804, 1,
1.342288, -0.4195035, 2.07356, 1, 0, 0.5058824, 1,
1.350075, 0.2836176, 1.405013, 1, 0, 0.4980392, 1,
1.350139, -0.3411959, 2.961642, 1, 0, 0.4901961, 1,
1.357937, -1.196282, 1.641755, 1, 0, 0.4862745, 1,
1.373431, -1.489707, 1.76023, 1, 0, 0.4784314, 1,
1.381154, -1.359029, 3.731453, 1, 0, 0.4745098, 1,
1.40463, -0.7544825, 2.362798, 1, 0, 0.4666667, 1,
1.421311, -0.1530667, 0.6538651, 1, 0, 0.4627451, 1,
1.424475, 0.5396246, 1.915459, 1, 0, 0.454902, 1,
1.43482, -1.106421, 2.361343, 1, 0, 0.4509804, 1,
1.436328, 0.5865893, 0.5651584, 1, 0, 0.4431373, 1,
1.452453, 1.978524, -1.174417, 1, 0, 0.4392157, 1,
1.463153, -2.317042, 2.302958, 1, 0, 0.4313726, 1,
1.491865, -0.08404174, 1.35894, 1, 0, 0.427451, 1,
1.499958, -1.373781, 3.815519, 1, 0, 0.4196078, 1,
1.508414, 0.9570722, 1.335992, 1, 0, 0.4156863, 1,
1.513505, 1.062034, 1.081294, 1, 0, 0.4078431, 1,
1.522194, -0.8727754, 2.588134, 1, 0, 0.4039216, 1,
1.523011, 0.382347, 2.393951, 1, 0, 0.3960784, 1,
1.5432, 0.2894097, 2.230962, 1, 0, 0.3882353, 1,
1.549665, 0.04792196, 1.881568, 1, 0, 0.3843137, 1,
1.564425, -0.1245291, 0.7280715, 1, 0, 0.3764706, 1,
1.570137, 0.6641527, 1.940109, 1, 0, 0.372549, 1,
1.570457, 0.3564565, -0.07740284, 1, 0, 0.3647059, 1,
1.571465, -0.8926739, 3.423795, 1, 0, 0.3607843, 1,
1.586359, 1.199907, 1.665499, 1, 0, 0.3529412, 1,
1.588462, 0.9168605, 0.9258094, 1, 0, 0.3490196, 1,
1.591944, -0.3914418, 2.151057, 1, 0, 0.3411765, 1,
1.596714, 1.046015, 0.4839656, 1, 0, 0.3372549, 1,
1.600995, -1.499709, 2.611145, 1, 0, 0.3294118, 1,
1.609302, 0.1274556, 1.613556, 1, 0, 0.3254902, 1,
1.614503, 0.2991426, 0.2700649, 1, 0, 0.3176471, 1,
1.61662, -0.9695147, 2.493725, 1, 0, 0.3137255, 1,
1.621878, -0.3137717, -0.5424207, 1, 0, 0.3058824, 1,
1.640083, 0.7577643, 2.313654, 1, 0, 0.2980392, 1,
1.645927, -0.2119144, 1.811469, 1, 0, 0.2941177, 1,
1.652115, 0.6312005, 0.6911088, 1, 0, 0.2862745, 1,
1.661121, -0.3499174, 0.6181178, 1, 0, 0.282353, 1,
1.698893, 1.651445, 2.272059, 1, 0, 0.2745098, 1,
1.701361, -2.840803, 3.333976, 1, 0, 0.2705882, 1,
1.735081, 0.09089997, 1.805911, 1, 0, 0.2627451, 1,
1.735367, -1.309951, 1.528511, 1, 0, 0.2588235, 1,
1.737996, 1.091635, 1.530963, 1, 0, 0.2509804, 1,
1.770753, -0.2937571, 0.934049, 1, 0, 0.2470588, 1,
1.780988, -1.460133, 1.077974, 1, 0, 0.2392157, 1,
1.786739, -0.8190745, 2.025879, 1, 0, 0.2352941, 1,
1.796574, -1.151162, 1.056327, 1, 0, 0.227451, 1,
1.79942, 1.316092, -1.049257, 1, 0, 0.2235294, 1,
1.81617, -0.5056419, 3.11441, 1, 0, 0.2156863, 1,
1.835136, -0.1844306, 2.662143, 1, 0, 0.2117647, 1,
1.841783, -0.260461, -0.3063581, 1, 0, 0.2039216, 1,
1.844008, -0.2812565, 2.590562, 1, 0, 0.1960784, 1,
1.859341, -0.1295288, 1.969532, 1, 0, 0.1921569, 1,
1.872255, 1.078813, 1.69489, 1, 0, 0.1843137, 1,
1.87503, 0.3607482, -0.1405324, 1, 0, 0.1803922, 1,
1.881027, -2.603844, 1.873709, 1, 0, 0.172549, 1,
1.888952, -0.6737075, 2.244466, 1, 0, 0.1686275, 1,
1.909229, 2.221543, 2.051567, 1, 0, 0.1607843, 1,
1.957996, -1.200567, 3.146021, 1, 0, 0.1568628, 1,
1.964284, -1.571195, 3.35394, 1, 0, 0.1490196, 1,
1.983263, -0.805117, 2.82094, 1, 0, 0.145098, 1,
2.023525, 0.6231185, 0.4953208, 1, 0, 0.1372549, 1,
2.027431, 0.1103957, 1.203645, 1, 0, 0.1333333, 1,
2.065732, -1.013914, 2.866878, 1, 0, 0.1254902, 1,
2.078319, 1.492122, 0.568791, 1, 0, 0.1215686, 1,
2.087152, -0.1088722, 2.248125, 1, 0, 0.1137255, 1,
2.107992, 0.1322693, 3.683661, 1, 0, 0.1098039, 1,
2.146849, -0.6080005, 2.376756, 1, 0, 0.1019608, 1,
2.154954, -0.4218336, 2.56028, 1, 0, 0.09411765, 1,
2.203723, 1.068241, 1.266204, 1, 0, 0.09019608, 1,
2.205311, 0.04362108, 2.143894, 1, 0, 0.08235294, 1,
2.21398, 0.2514609, 1.190367, 1, 0, 0.07843138, 1,
2.245371, 0.2887668, 2.655703, 1, 0, 0.07058824, 1,
2.278817, 0.1080565, 2.616076, 1, 0, 0.06666667, 1,
2.291945, -0.5609376, 0.423246, 1, 0, 0.05882353, 1,
2.328055, -0.2804774, 3.057351, 1, 0, 0.05490196, 1,
2.353812, 1.368235, 1.789467, 1, 0, 0.04705882, 1,
2.48371, -0.7682985, 0.1172268, 1, 0, 0.04313726, 1,
2.726784, -0.3521091, 0.5457603, 1, 0, 0.03529412, 1,
3.011516, 0.3316748, -0.2562534, 1, 0, 0.03137255, 1,
3.05441, -0.6203229, 0.8486831, 1, 0, 0.02352941, 1,
3.432981, -0.1208026, 0.9744284, 1, 0, 0.01960784, 1,
3.445618, -0.4540674, 1.743421, 1, 0, 0.01176471, 1,
3.5282, 1.719499, 1.154139, 1, 0, 0.007843138, 1
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
0.118318, -3.808287, -7.503659, 0, -0.5, 0.5, 0.5,
0.118318, -3.808287, -7.503659, 1, -0.5, 0.5, 0.5,
0.118318, -3.808287, -7.503659, 1, 1.5, 0.5, 0.5,
0.118318, -3.808287, -7.503659, 0, 1.5, 0.5, 0.5
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
-4.447515, -0.1441177, -7.503659, 0, -0.5, 0.5, 0.5,
-4.447515, -0.1441177, -7.503659, 1, -0.5, 0.5, 0.5,
-4.447515, -0.1441177, -7.503659, 1, 1.5, 0.5, 0.5,
-4.447515, -0.1441177, -7.503659, 0, 1.5, 0.5, 0.5
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
-4.447515, -3.808287, -0.2550697, 0, -0.5, 0.5, 0.5,
-4.447515, -3.808287, -0.2550697, 1, -0.5, 0.5, 0.5,
-4.447515, -3.808287, -0.2550697, 1, 1.5, 0.5, 0.5,
-4.447515, -3.808287, -0.2550697, 0, 1.5, 0.5, 0.5
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
-3, -2.96271, -5.830907,
3, -2.96271, -5.830907,
-3, -2.96271, -5.830907,
-3, -3.103639, -6.109699,
-2, -2.96271, -5.830907,
-2, -3.103639, -6.109699,
-1, -2.96271, -5.830907,
-1, -3.103639, -6.109699,
0, -2.96271, -5.830907,
0, -3.103639, -6.109699,
1, -2.96271, -5.830907,
1, -3.103639, -6.109699,
2, -2.96271, -5.830907,
2, -3.103639, -6.109699,
3, -2.96271, -5.830907,
3, -3.103639, -6.109699
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
-3, -3.385499, -6.667283, 0, -0.5, 0.5, 0.5,
-3, -3.385499, -6.667283, 1, -0.5, 0.5, 0.5,
-3, -3.385499, -6.667283, 1, 1.5, 0.5, 0.5,
-3, -3.385499, -6.667283, 0, 1.5, 0.5, 0.5,
-2, -3.385499, -6.667283, 0, -0.5, 0.5, 0.5,
-2, -3.385499, -6.667283, 1, -0.5, 0.5, 0.5,
-2, -3.385499, -6.667283, 1, 1.5, 0.5, 0.5,
-2, -3.385499, -6.667283, 0, 1.5, 0.5, 0.5,
-1, -3.385499, -6.667283, 0, -0.5, 0.5, 0.5,
-1, -3.385499, -6.667283, 1, -0.5, 0.5, 0.5,
-1, -3.385499, -6.667283, 1, 1.5, 0.5, 0.5,
-1, -3.385499, -6.667283, 0, 1.5, 0.5, 0.5,
0, -3.385499, -6.667283, 0, -0.5, 0.5, 0.5,
0, -3.385499, -6.667283, 1, -0.5, 0.5, 0.5,
0, -3.385499, -6.667283, 1, 1.5, 0.5, 0.5,
0, -3.385499, -6.667283, 0, 1.5, 0.5, 0.5,
1, -3.385499, -6.667283, 0, -0.5, 0.5, 0.5,
1, -3.385499, -6.667283, 1, -0.5, 0.5, 0.5,
1, -3.385499, -6.667283, 1, 1.5, 0.5, 0.5,
1, -3.385499, -6.667283, 0, 1.5, 0.5, 0.5,
2, -3.385499, -6.667283, 0, -0.5, 0.5, 0.5,
2, -3.385499, -6.667283, 1, -0.5, 0.5, 0.5,
2, -3.385499, -6.667283, 1, 1.5, 0.5, 0.5,
2, -3.385499, -6.667283, 0, 1.5, 0.5, 0.5,
3, -3.385499, -6.667283, 0, -0.5, 0.5, 0.5,
3, -3.385499, -6.667283, 1, -0.5, 0.5, 0.5,
3, -3.385499, -6.667283, 1, 1.5, 0.5, 0.5,
3, -3.385499, -6.667283, 0, 1.5, 0.5, 0.5
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
-3.393861, -2, -5.830907,
-3.393861, 2, -5.830907,
-3.393861, -2, -5.830907,
-3.56947, -2, -6.109699,
-3.393861, -1, -5.830907,
-3.56947, -1, -6.109699,
-3.393861, 0, -5.830907,
-3.56947, 0, -6.109699,
-3.393861, 1, -5.830907,
-3.56947, 1, -6.109699,
-3.393861, 2, -5.830907,
-3.56947, 2, -6.109699
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
-3.920688, -2, -6.667283, 0, -0.5, 0.5, 0.5,
-3.920688, -2, -6.667283, 1, -0.5, 0.5, 0.5,
-3.920688, -2, -6.667283, 1, 1.5, 0.5, 0.5,
-3.920688, -2, -6.667283, 0, 1.5, 0.5, 0.5,
-3.920688, -1, -6.667283, 0, -0.5, 0.5, 0.5,
-3.920688, -1, -6.667283, 1, -0.5, 0.5, 0.5,
-3.920688, -1, -6.667283, 1, 1.5, 0.5, 0.5,
-3.920688, -1, -6.667283, 0, 1.5, 0.5, 0.5,
-3.920688, 0, -6.667283, 0, -0.5, 0.5, 0.5,
-3.920688, 0, -6.667283, 1, -0.5, 0.5, 0.5,
-3.920688, 0, -6.667283, 1, 1.5, 0.5, 0.5,
-3.920688, 0, -6.667283, 0, 1.5, 0.5, 0.5,
-3.920688, 1, -6.667283, 0, -0.5, 0.5, 0.5,
-3.920688, 1, -6.667283, 1, -0.5, 0.5, 0.5,
-3.920688, 1, -6.667283, 1, 1.5, 0.5, 0.5,
-3.920688, 1, -6.667283, 0, 1.5, 0.5, 0.5,
-3.920688, 2, -6.667283, 0, -0.5, 0.5, 0.5,
-3.920688, 2, -6.667283, 1, -0.5, 0.5, 0.5,
-3.920688, 2, -6.667283, 1, 1.5, 0.5, 0.5,
-3.920688, 2, -6.667283, 0, 1.5, 0.5, 0.5
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
-3.393861, -2.96271, -4,
-3.393861, -2.96271, 4,
-3.393861, -2.96271, -4,
-3.56947, -3.103639, -4,
-3.393861, -2.96271, -2,
-3.56947, -3.103639, -2,
-3.393861, -2.96271, 0,
-3.56947, -3.103639, 0,
-3.393861, -2.96271, 2,
-3.56947, -3.103639, 2,
-3.393861, -2.96271, 4,
-3.56947, -3.103639, 4
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
-3.920688, -3.385499, -4, 0, -0.5, 0.5, 0.5,
-3.920688, -3.385499, -4, 1, -0.5, 0.5, 0.5,
-3.920688, -3.385499, -4, 1, 1.5, 0.5, 0.5,
-3.920688, -3.385499, -4, 0, 1.5, 0.5, 0.5,
-3.920688, -3.385499, -2, 0, -0.5, 0.5, 0.5,
-3.920688, -3.385499, -2, 1, -0.5, 0.5, 0.5,
-3.920688, -3.385499, -2, 1, 1.5, 0.5, 0.5,
-3.920688, -3.385499, -2, 0, 1.5, 0.5, 0.5,
-3.920688, -3.385499, 0, 0, -0.5, 0.5, 0.5,
-3.920688, -3.385499, 0, 1, -0.5, 0.5, 0.5,
-3.920688, -3.385499, 0, 1, 1.5, 0.5, 0.5,
-3.920688, -3.385499, 0, 0, 1.5, 0.5, 0.5,
-3.920688, -3.385499, 2, 0, -0.5, 0.5, 0.5,
-3.920688, -3.385499, 2, 1, -0.5, 0.5, 0.5,
-3.920688, -3.385499, 2, 1, 1.5, 0.5, 0.5,
-3.920688, -3.385499, 2, 0, 1.5, 0.5, 0.5,
-3.920688, -3.385499, 4, 0, -0.5, 0.5, 0.5,
-3.920688, -3.385499, 4, 1, -0.5, 0.5, 0.5,
-3.920688, -3.385499, 4, 1, 1.5, 0.5, 0.5,
-3.920688, -3.385499, 4, 0, 1.5, 0.5, 0.5
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
-3.393861, -2.96271, -5.830907,
-3.393861, 2.674474, -5.830907,
-3.393861, -2.96271, 5.320768,
-3.393861, 2.674474, 5.320768,
-3.393861, -2.96271, -5.830907,
-3.393861, -2.96271, 5.320768,
-3.393861, 2.674474, -5.830907,
-3.393861, 2.674474, 5.320768,
-3.393861, -2.96271, -5.830907,
3.630497, -2.96271, -5.830907,
-3.393861, -2.96271, 5.320768,
3.630497, -2.96271, 5.320768,
-3.393861, 2.674474, -5.830907,
3.630497, 2.674474, -5.830907,
-3.393861, 2.674474, 5.320768,
3.630497, 2.674474, 5.320768,
3.630497, -2.96271, -5.830907,
3.630497, 2.674474, -5.830907,
3.630497, -2.96271, 5.320768,
3.630497, 2.674474, 5.320768,
3.630497, -2.96271, -5.830907,
3.630497, -2.96271, 5.320768,
3.630497, 2.674474, -5.830907,
3.630497, 2.674474, 5.320768
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
var radius = 7.654371;
var distance = 34.05516;
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
mvMatrix.translate( -0.118318, 0.1441177, 0.2550697 );
mvMatrix.scale( 1.178194, 1.468119, 0.7421356 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.05516);
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
Benomyl<-read.table("Benomyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.291564, -0.4671167, -2.441233, 0, 0, 1, 1, 1,
-2.664642, 0.1598237, -1.737509, 1, 0, 0, 1, 1,
-2.574965, 1.239415, -2.400386, 1, 0, 0, 1, 1,
-2.514236, -0.6414971, -1.931906, 1, 0, 0, 1, 1,
-2.468821, 0.3797825, -0.07809801, 1, 0, 0, 1, 1,
-2.416981, -2.142508, -3.610269, 1, 0, 0, 1, 1,
-2.34246, 2.258616, -0.5654134, 0, 0, 0, 1, 1,
-2.337745, 0.3032176, -0.4401561, 0, 0, 0, 1, 1,
-2.311589, 0.6413968, -4.418866, 0, 0, 0, 1, 1,
-2.23435, 0.5486444, -0.1127174, 0, 0, 0, 1, 1,
-2.209904, 0.1741783, -1.456366, 0, 0, 0, 1, 1,
-2.192888, -0.2216489, -2.330832, 0, 0, 0, 1, 1,
-2.177495, 0.2966027, -0.5391383, 0, 0, 0, 1, 1,
-2.154062, 0.9359598, -2.014184, 1, 1, 1, 1, 1,
-2.152496, 0.5356273, -3.270811, 1, 1, 1, 1, 1,
-2.15151, -0.9049268, -0.2062441, 1, 1, 1, 1, 1,
-2.092214, 1.243473, 1.224091, 1, 1, 1, 1, 1,
-2.087335, -0.6858052, -1.461225, 1, 1, 1, 1, 1,
-2.014312, 0.0327583, -3.17897, 1, 1, 1, 1, 1,
-1.937038, -0.1843567, -2.373695, 1, 1, 1, 1, 1,
-1.923258, 0.7793921, 0.7356844, 1, 1, 1, 1, 1,
-1.919919, 0.6906922, 1.941947, 1, 1, 1, 1, 1,
-1.911185, -1.924449, -3.720025, 1, 1, 1, 1, 1,
-1.877734, -0.9782271, -2.121999, 1, 1, 1, 1, 1,
-1.831232, 0.1006576, -2.482544, 1, 1, 1, 1, 1,
-1.826613, -0.01899111, -1.483095, 1, 1, 1, 1, 1,
-1.82359, 0.1185695, -5.019423, 1, 1, 1, 1, 1,
-1.812347, -1.329207, -1.425445, 1, 1, 1, 1, 1,
-1.786906, -2.444398, -1.795212, 0, 0, 1, 1, 1,
-1.785718, 0.9296265, -0.9841635, 1, 0, 0, 1, 1,
-1.754242, 0.8665625, -2.382057, 1, 0, 0, 1, 1,
-1.740714, -0.2156504, -0.4703619, 1, 0, 0, 1, 1,
-1.711821, -0.03769665, -2.504534, 1, 0, 0, 1, 1,
-1.709728, -1.587744, -2.641569, 1, 0, 0, 1, 1,
-1.699877, -0.6339822, -3.006777, 0, 0, 0, 1, 1,
-1.696959, -0.6337195, -1.181251, 0, 0, 0, 1, 1,
-1.696105, 1.11832, 0.17721, 0, 0, 0, 1, 1,
-1.690011, -1.430363, -1.354342, 0, 0, 0, 1, 1,
-1.685206, 0.4337152, -0.6989599, 0, 0, 0, 1, 1,
-1.657959, 0.7899498, -1.595663, 0, 0, 0, 1, 1,
-1.65654, 1.88557, 0.04719612, 0, 0, 0, 1, 1,
-1.652924, -0.9102473, -1.665213, 1, 1, 1, 1, 1,
-1.625173, -0.567979, -2.759336, 1, 1, 1, 1, 1,
-1.622818, -0.2126624, -1.42177, 1, 1, 1, 1, 1,
-1.621453, 1.362298, -0.2305416, 1, 1, 1, 1, 1,
-1.599885, 0.5490471, -0.9399655, 1, 1, 1, 1, 1,
-1.58507, -0.6310593, -3.353429, 1, 1, 1, 1, 1,
-1.578792, -0.8757537, -2.110733, 1, 1, 1, 1, 1,
-1.578383, -1.166209, -2.654652, 1, 1, 1, 1, 1,
-1.577296, -0.01821283, -1.850652, 1, 1, 1, 1, 1,
-1.537879, -1.589399, -4.019876, 1, 1, 1, 1, 1,
-1.524533, 0.8695523, -1.325639, 1, 1, 1, 1, 1,
-1.523397, 0.3137405, -0.1573713, 1, 1, 1, 1, 1,
-1.521385, 0.7359759, -3.111338, 1, 1, 1, 1, 1,
-1.519965, -1.969957, -1.687286, 1, 1, 1, 1, 1,
-1.492265, -0.7971456, -2.653423, 1, 1, 1, 1, 1,
-1.486153, 0.1387935, -1.136919, 0, 0, 1, 1, 1,
-1.479071, -0.7594923, -1.178951, 1, 0, 0, 1, 1,
-1.476935, -2.106399, -2.969684, 1, 0, 0, 1, 1,
-1.474483, -0.4448041, -1.797754, 1, 0, 0, 1, 1,
-1.471438, 0.4407338, -0.6342182, 1, 0, 0, 1, 1,
-1.471229, -0.2864945, -1.862846, 1, 0, 0, 1, 1,
-1.468408, 1.768014, -1.863369, 0, 0, 0, 1, 1,
-1.462769, 0.919206, 0.2028567, 0, 0, 0, 1, 1,
-1.461048, 0.3302411, 0.2321834, 0, 0, 0, 1, 1,
-1.441782, 0.1874917, -2.955392, 0, 0, 0, 1, 1,
-1.44143, -1.648743, -1.445483, 0, 0, 0, 1, 1,
-1.43657, -0.5820596, -3.648915, 0, 0, 0, 1, 1,
-1.436297, 0.2935027, -1.737939, 0, 0, 0, 1, 1,
-1.419111, -0.3780996, -0.6507043, 1, 1, 1, 1, 1,
-1.412115, -1.061042, -2.382834, 1, 1, 1, 1, 1,
-1.40998, -1.028753, -2.690652, 1, 1, 1, 1, 1,
-1.408793, 0.91672, -1.670442, 1, 1, 1, 1, 1,
-1.39916, 1.583326, -0.3095056, 1, 1, 1, 1, 1,
-1.384632, 0.0989475, -4.423445, 1, 1, 1, 1, 1,
-1.378719, -0.871637, -2.081195, 1, 1, 1, 1, 1,
-1.366616, -0.2411618, -2.382323, 1, 1, 1, 1, 1,
-1.365586, -0.9195299, -0.9060867, 1, 1, 1, 1, 1,
-1.359137, 0.3668788, -1.957104, 1, 1, 1, 1, 1,
-1.358068, -0.1408299, -2.617748, 1, 1, 1, 1, 1,
-1.356773, -2.009399, -2.302892, 1, 1, 1, 1, 1,
-1.352018, 2.013882, 0.64253, 1, 1, 1, 1, 1,
-1.346418, -0.7867228, -2.277162, 1, 1, 1, 1, 1,
-1.345044, 0.4952466, -2.613059, 1, 1, 1, 1, 1,
-1.343305, 1.451216, -1.612319, 0, 0, 1, 1, 1,
-1.334015, -1.280527, -1.181372, 1, 0, 0, 1, 1,
-1.33041, 0.4926846, -2.092963, 1, 0, 0, 1, 1,
-1.325799, -1.29253, -1.829217, 1, 0, 0, 1, 1,
-1.32248, -1.132535, -0.4476093, 1, 0, 0, 1, 1,
-1.32071, 0.3331897, -0.5533964, 1, 0, 0, 1, 1,
-1.317102, -0.2616558, -1.703447, 0, 0, 0, 1, 1,
-1.310374, 0.7291403, -1.963551, 0, 0, 0, 1, 1,
-1.306757, 1.196404, -0.90977, 0, 0, 0, 1, 1,
-1.30431, 0.4340892, -2.270567, 0, 0, 0, 1, 1,
-1.289024, -1.44336, -1.999246, 0, 0, 0, 1, 1,
-1.285536, -0.07509063, -1.693016, 0, 0, 0, 1, 1,
-1.283342, 0.4778391, -0.3320983, 0, 0, 0, 1, 1,
-1.283325, 0.7003854, -1.007609, 1, 1, 1, 1, 1,
-1.279843, -0.6877192, -1.221021, 1, 1, 1, 1, 1,
-1.276793, -0.9053205, -1.294622, 1, 1, 1, 1, 1,
-1.272102, 0.1229443, -1.297392, 1, 1, 1, 1, 1,
-1.253041, 0.7871384, -2.456065, 1, 1, 1, 1, 1,
-1.242015, 0.7564569, -0.08837076, 1, 1, 1, 1, 1,
-1.237363, -1.313175, -1.091297, 1, 1, 1, 1, 1,
-1.226997, -0.1748469, -3.249655, 1, 1, 1, 1, 1,
-1.225099, -1.979237, -1.973202, 1, 1, 1, 1, 1,
-1.215315, -1.35029, -3.152507, 1, 1, 1, 1, 1,
-1.214654, -0.5537046, -1.536593, 1, 1, 1, 1, 1,
-1.213667, -0.1747583, -2.790993, 1, 1, 1, 1, 1,
-1.211183, 0.7031204, -1.215389, 1, 1, 1, 1, 1,
-1.20782, -0.1604349, -3.80733, 1, 1, 1, 1, 1,
-1.206191, 1.420844, -2.678543, 1, 1, 1, 1, 1,
-1.20071, 0.2072157, -2.066478, 0, 0, 1, 1, 1,
-1.199719, -0.6433414, -2.259757, 1, 0, 0, 1, 1,
-1.18946, 0.5137048, -1.56459, 1, 0, 0, 1, 1,
-1.185722, 0.3241004, -1.140404, 1, 0, 0, 1, 1,
-1.185175, 0.8146625, 0.1812597, 1, 0, 0, 1, 1,
-1.177412, 0.221976, -2.276569, 1, 0, 0, 1, 1,
-1.174868, -0.7185503, -1.742304, 0, 0, 0, 1, 1,
-1.174209, -1.694996, -2.725026, 0, 0, 0, 1, 1,
-1.161576, 0.9385391, -0.8903503, 0, 0, 0, 1, 1,
-1.160931, 0.6831279, -1.166279, 0, 0, 0, 1, 1,
-1.154513, -1.650825, -0.5884358, 0, 0, 0, 1, 1,
-1.154046, 1.78337, -1.102986, 0, 0, 0, 1, 1,
-1.153604, 0.3452654, -0.5370249, 0, 0, 0, 1, 1,
-1.152974, 0.7316765, -0.8814949, 1, 1, 1, 1, 1,
-1.146782, 0.1633692, -1.743196, 1, 1, 1, 1, 1,
-1.145207, 0.5090611, -1.649258, 1, 1, 1, 1, 1,
-1.131997, 0.05549566, -1.61554, 1, 1, 1, 1, 1,
-1.11436, 0.2401987, -1.433609, 1, 1, 1, 1, 1,
-1.109614, -1.147457, -3.348504, 1, 1, 1, 1, 1,
-1.104293, -0.3866771, -3.317371, 1, 1, 1, 1, 1,
-1.1, 1.849951, -0.4896383, 1, 1, 1, 1, 1,
-1.094895, -1.248912, -0.7466186, 1, 1, 1, 1, 1,
-1.094038, 0.005524239, -1.795011, 1, 1, 1, 1, 1,
-1.093996, -1.335803, -1.764921, 1, 1, 1, 1, 1,
-1.091237, -0.5331164, -2.955569, 1, 1, 1, 1, 1,
-1.084672, 0.8188257, -1.53331, 1, 1, 1, 1, 1,
-1.082422, 0.6814857, -0.9624829, 1, 1, 1, 1, 1,
-1.071929, -0.6306336, -2.01672, 1, 1, 1, 1, 1,
-1.068945, -0.3478426, -1.71046, 0, 0, 1, 1, 1,
-1.057983, -0.8812687, -1.162127, 1, 0, 0, 1, 1,
-1.048623, 0.1947461, -1.151848, 1, 0, 0, 1, 1,
-1.04064, 0.5692805, -0.9258851, 1, 0, 0, 1, 1,
-1.034035, 0.3633005, -2.062719, 1, 0, 0, 1, 1,
-1.031897, 0.4170976, -0.07896805, 1, 0, 0, 1, 1,
-1.023127, -0.5286379, -1.82388, 0, 0, 0, 1, 1,
-1.016925, -0.6470369, -0.9462836, 0, 0, 0, 1, 1,
-1.016599, -1.374559, -2.574743, 0, 0, 0, 1, 1,
-1.010592, 1.2573, -0.7719111, 0, 0, 0, 1, 1,
-1.010196, 0.9058599, 0.03623421, 0, 0, 0, 1, 1,
-1.008336, -0.2540916, -0.9400109, 0, 0, 0, 1, 1,
-1.005432, -0.6212938, -3.345193, 0, 0, 0, 1, 1,
-1.000513, -1.079678, -2.460771, 1, 1, 1, 1, 1,
-0.9922464, 0.1597385, -0.08353315, 1, 1, 1, 1, 1,
-0.9909251, 2.161402, -2.623307, 1, 1, 1, 1, 1,
-0.9844552, 0.4555786, -2.315221, 1, 1, 1, 1, 1,
-0.9832034, -0.4914478, -2.482542, 1, 1, 1, 1, 1,
-0.9795791, -1.769907, -3.088687, 1, 1, 1, 1, 1,
-0.9669456, -0.3344978, -1.22687, 1, 1, 1, 1, 1,
-0.9660047, 0.8975354, -0.04823688, 1, 1, 1, 1, 1,
-0.9625975, 0.06613097, -1.278383, 1, 1, 1, 1, 1,
-0.9560645, 1.745064, -0.8537828, 1, 1, 1, 1, 1,
-0.9530555, -1.872392, -2.460617, 1, 1, 1, 1, 1,
-0.9457613, -0.1632803, -2.40465, 1, 1, 1, 1, 1,
-0.9375998, 0.6314964, -0.6935135, 1, 1, 1, 1, 1,
-0.9343873, -1.0297, -2.90816, 1, 1, 1, 1, 1,
-0.9261191, 0.2104442, -0.8818391, 1, 1, 1, 1, 1,
-0.9154972, 0.6128942, -0.9342952, 0, 0, 1, 1, 1,
-0.9079962, -0.9481587, -3.050906, 1, 0, 0, 1, 1,
-0.9041417, -0.7369979, -1.658413, 1, 0, 0, 1, 1,
-0.8999146, -0.5166785, -0.5110206, 1, 0, 0, 1, 1,
-0.8993211, -0.3650826, -2.003606, 1, 0, 0, 1, 1,
-0.8976848, -0.09218466, -1.304993, 1, 0, 0, 1, 1,
-0.8973872, -2.468996, -1.538928, 0, 0, 0, 1, 1,
-0.8964804, 0.4930059, -1.181332, 0, 0, 0, 1, 1,
-0.8910366, -0.5322933, -3.964406, 0, 0, 0, 1, 1,
-0.889644, -0.2986083, -3.097294, 0, 0, 0, 1, 1,
-0.8882138, -1.403655, -3.265958, 0, 0, 0, 1, 1,
-0.8833321, -0.8917375, -4.384291, 0, 0, 0, 1, 1,
-0.882772, 0.477684, -2.337758, 0, 0, 0, 1, 1,
-0.8806491, -0.2444225, -1.139144, 1, 1, 1, 1, 1,
-0.8795393, 0.7071636, -2.304982, 1, 1, 1, 1, 1,
-0.8781081, -0.2989833, -2.894995, 1, 1, 1, 1, 1,
-0.8759525, 0.7356917, -0.8071453, 1, 1, 1, 1, 1,
-0.8757787, 0.005520329, -2.232686, 1, 1, 1, 1, 1,
-0.8748372, 1.140869, -1.395969, 1, 1, 1, 1, 1,
-0.8704982, -0.3804883, -3.857656, 1, 1, 1, 1, 1,
-0.8651412, -0.0642887, -0.5128713, 1, 1, 1, 1, 1,
-0.8632941, 1.18004, 0.1468981, 1, 1, 1, 1, 1,
-0.8611311, 0.6034771, -2.863407, 1, 1, 1, 1, 1,
-0.8606583, -0.6399068, -1.797343, 1, 1, 1, 1, 1,
-0.8569872, 1.133336, -0.1496629, 1, 1, 1, 1, 1,
-0.8528318, -0.1355456, -0.5728726, 1, 1, 1, 1, 1,
-0.8497521, -0.6750633, -2.905734, 1, 1, 1, 1, 1,
-0.8482654, 0.1105798, -0.3868029, 1, 1, 1, 1, 1,
-0.8479238, 1.03543, -0.1685576, 0, 0, 1, 1, 1,
-0.8471075, -0.9441394, -0.6978338, 1, 0, 0, 1, 1,
-0.8453909, -1.468944, -1.6875, 1, 0, 0, 1, 1,
-0.8439845, -1.547632, -2.893757, 1, 0, 0, 1, 1,
-0.8425419, 0.02582598, -1.598452, 1, 0, 0, 1, 1,
-0.8387201, -0.736576, -1.908512, 1, 0, 0, 1, 1,
-0.8380074, 0.9349066, -0.1244431, 0, 0, 0, 1, 1,
-0.8263164, 0.3172688, -2.898652, 0, 0, 0, 1, 1,
-0.823079, 1.147342, 0.1614366, 0, 0, 0, 1, 1,
-0.8199953, -2.020242, -2.766521, 0, 0, 0, 1, 1,
-0.8134081, 0.8922635, 0.320197, 0, 0, 0, 1, 1,
-0.8105996, 1.769515, 0.9897655, 0, 0, 0, 1, 1,
-0.8070758, 0.80391, -1.373091, 0, 0, 0, 1, 1,
-0.7949516, 0.1526583, -1.937269, 1, 1, 1, 1, 1,
-0.7855098, 0.5865076, -3.020559, 1, 1, 1, 1, 1,
-0.7823939, -0.8782067, -1.332741, 1, 1, 1, 1, 1,
-0.7791239, 2.500276, -0.7142016, 1, 1, 1, 1, 1,
-0.7779921, 1.02528, -0.2924173, 1, 1, 1, 1, 1,
-0.7760426, 0.893851, 0.7758629, 1, 1, 1, 1, 1,
-0.7724723, 0.9448634, -0.9244605, 1, 1, 1, 1, 1,
-0.7720507, -1.246677, -2.765809, 1, 1, 1, 1, 1,
-0.7610717, -0.4436452, -1.972004, 1, 1, 1, 1, 1,
-0.7570736, -0.504053, -1.877338, 1, 1, 1, 1, 1,
-0.7548144, -1.509868, -2.81062, 1, 1, 1, 1, 1,
-0.7437232, -0.812803, -3.441174, 1, 1, 1, 1, 1,
-0.743274, 0.1419426, -1.446108, 1, 1, 1, 1, 1,
-0.7333389, 0.9572707, 0.04735961, 1, 1, 1, 1, 1,
-0.7326552, 0.7469023, -0.9648947, 1, 1, 1, 1, 1,
-0.7289531, -0.375598, -3.256475, 0, 0, 1, 1, 1,
-0.7261937, 0.1416566, -1.862465, 1, 0, 0, 1, 1,
-0.7242225, 0.1230596, 0.2094428, 1, 0, 0, 1, 1,
-0.7142667, -1.205141, -3.506629, 1, 0, 0, 1, 1,
-0.7013303, -1.301714, -1.848561, 1, 0, 0, 1, 1,
-0.7004769, 0.1094872, -0.4765915, 1, 0, 0, 1, 1,
-0.6989932, 2.178672, 0.3786618, 0, 0, 0, 1, 1,
-0.6987726, 0.6340109, -1.367864, 0, 0, 0, 1, 1,
-0.691103, 0.8995993, -0.9482936, 0, 0, 0, 1, 1,
-0.6809325, 0.4913384, 0.2035908, 0, 0, 0, 1, 1,
-0.6790145, -1.124794, -1.437737, 0, 0, 0, 1, 1,
-0.6777825, -0.1286825, -1.044614, 0, 0, 0, 1, 1,
-0.6744933, 0.166841, -1.42925, 0, 0, 0, 1, 1,
-0.6725415, -1.426965, -2.066327, 1, 1, 1, 1, 1,
-0.6722093, -1.051038, -0.652137, 1, 1, 1, 1, 1,
-0.6708744, 0.3168047, -0.6770177, 1, 1, 1, 1, 1,
-0.6701797, -0.8943225, -1.181949, 1, 1, 1, 1, 1,
-0.6681694, -1.146906, -2.636496, 1, 1, 1, 1, 1,
-0.6624814, -1.663488, -3.463206, 1, 1, 1, 1, 1,
-0.6622301, -0.3523313, -1.817687, 1, 1, 1, 1, 1,
-0.6615831, 0.2452878, -2.440218, 1, 1, 1, 1, 1,
-0.6612465, -0.2148132, -3.379249, 1, 1, 1, 1, 1,
-0.6601251, -0.5427919, -2.925525, 1, 1, 1, 1, 1,
-0.6574351, -0.7353024, 0.5146585, 1, 1, 1, 1, 1,
-0.6560847, 0.4083847, -0.1212806, 1, 1, 1, 1, 1,
-0.6556907, 0.6799341, -0.6524426, 1, 1, 1, 1, 1,
-0.6519952, -1.433502, -3.243624, 1, 1, 1, 1, 1,
-0.6512752, 0.3722355, 0.4265441, 1, 1, 1, 1, 1,
-0.650891, 0.4358323, -1.515639, 0, 0, 1, 1, 1,
-0.6375994, -0.7539113, -2.171502, 1, 0, 0, 1, 1,
-0.6333501, -0.8389369, -1.902454, 1, 0, 0, 1, 1,
-0.6329456, 0.5573702, -0.6768807, 1, 0, 0, 1, 1,
-0.6317222, 0.9501123, 0.5598504, 1, 0, 0, 1, 1,
-0.627036, 0.08230394, -1.377116, 1, 0, 0, 1, 1,
-0.6232826, 0.29863, -1.225665, 0, 0, 0, 1, 1,
-0.6148747, 0.9485599, -0.1479858, 0, 0, 0, 1, 1,
-0.6139877, -0.1390283, -1.063949, 0, 0, 0, 1, 1,
-0.6117589, 1.075697, -0.8632606, 0, 0, 0, 1, 1,
-0.6069118, -1.015412, -2.365013, 0, 0, 0, 1, 1,
-0.5918178, -0.6814566, -2.580812, 0, 0, 0, 1, 1,
-0.5900351, 0.3807314, -0.2291472, 0, 0, 0, 1, 1,
-0.586404, -0.0119534, 0.3814384, 1, 1, 1, 1, 1,
-0.5849755, -0.2474172, -3.376626, 1, 1, 1, 1, 1,
-0.5846816, -0.03977814, -2.439925, 1, 1, 1, 1, 1,
-0.581745, -1.162216, -3.466635, 1, 1, 1, 1, 1,
-0.5798731, 1.047074, -0.9093089, 1, 1, 1, 1, 1,
-0.5751653, -1.083708, -2.928226, 1, 1, 1, 1, 1,
-0.5748402, 0.06560481, -0.974938, 1, 1, 1, 1, 1,
-0.5697253, -0.3303421, -2.321574, 1, 1, 1, 1, 1,
-0.5674828, -0.1870968, -1.239444, 1, 1, 1, 1, 1,
-0.5671884, -0.7319048, -2.515791, 1, 1, 1, 1, 1,
-0.5645913, 0.3809882, 0.3581279, 1, 1, 1, 1, 1,
-0.5626767, 0.9220066, -1.660694, 1, 1, 1, 1, 1,
-0.5591636, 0.6204153, 0.2420286, 1, 1, 1, 1, 1,
-0.5571141, 0.5376241, -0.9788961, 1, 1, 1, 1, 1,
-0.5520284, -0.01004589, -1.789492, 1, 1, 1, 1, 1,
-0.5494737, 1.644309, -1.735099, 0, 0, 1, 1, 1,
-0.5488476, 0.508353, 0.1785999, 1, 0, 0, 1, 1,
-0.5480832, -1.282222, -3.005798, 1, 0, 0, 1, 1,
-0.547822, -0.4610932, -1.185516, 1, 0, 0, 1, 1,
-0.5470522, -0.423021, -2.591822, 1, 0, 0, 1, 1,
-0.5419687, 1.072551, 0.2504982, 1, 0, 0, 1, 1,
-0.5393788, -0.8937007, -3.538487, 0, 0, 0, 1, 1,
-0.5364961, -1.49269, -1.708734, 0, 0, 0, 1, 1,
-0.5334417, 0.8153037, -1.750373, 0, 0, 0, 1, 1,
-0.5329769, 1.123094, 1.464621, 0, 0, 0, 1, 1,
-0.5328639, 1.812647, 0.1703825, 0, 0, 0, 1, 1,
-0.5302331, 0.6282163, -0.7804242, 0, 0, 0, 1, 1,
-0.528064, 2.267811, -0.3888917, 0, 0, 0, 1, 1,
-0.5279457, -0.8026072, -0.555274, 1, 1, 1, 1, 1,
-0.5278218, 1.211008, -2.466597, 1, 1, 1, 1, 1,
-0.5230182, -0.4629755, -2.051659, 1, 1, 1, 1, 1,
-0.5214444, 0.7084893, -2.080543, 1, 1, 1, 1, 1,
-0.5178097, 1.501653, -1.669637, 1, 1, 1, 1, 1,
-0.51655, 0.4884362, 0.3159284, 1, 1, 1, 1, 1,
-0.516515, 1.410694, -0.03849635, 1, 1, 1, 1, 1,
-0.5124961, -0.6050768, -1.983589, 1, 1, 1, 1, 1,
-0.5120128, 1.752224, -1.984937, 1, 1, 1, 1, 1,
-0.5094789, -0.8491879, -1.908499, 1, 1, 1, 1, 1,
-0.5043873, 0.8215629, -2.000902, 1, 1, 1, 1, 1,
-0.5037982, 0.4027726, 0.312625, 1, 1, 1, 1, 1,
-0.4956552, 1.166059, -0.926291, 1, 1, 1, 1, 1,
-0.4955654, -0.08163963, -1.079441, 1, 1, 1, 1, 1,
-0.4940149, -2.055033, -4.142381, 1, 1, 1, 1, 1,
-0.4916671, -0.02056726, -1.232961, 0, 0, 1, 1, 1,
-0.4886185, -0.6559522, -3.068906, 1, 0, 0, 1, 1,
-0.4879796, -1.197263, -3.613691, 1, 0, 0, 1, 1,
-0.4869821, 0.4760236, -1.435213, 1, 0, 0, 1, 1,
-0.483887, -0.260481, -4.012121, 1, 0, 0, 1, 1,
-0.4680504, -1.592701, -0.873957, 1, 0, 0, 1, 1,
-0.4570542, -1.191502, -3.205474, 0, 0, 0, 1, 1,
-0.4569989, 0.04554375, -1.209329, 0, 0, 0, 1, 1,
-0.4554329, 0.2419221, -0.4778847, 0, 0, 0, 1, 1,
-0.4539774, 0.488186, -2.103524, 0, 0, 0, 1, 1,
-0.4535137, 2.220159, -1.447963, 0, 0, 0, 1, 1,
-0.4475952, -0.4927251, -3.6197, 0, 0, 0, 1, 1,
-0.4453179, 0.346027, -0.9326932, 0, 0, 0, 1, 1,
-0.4438207, -0.9210604, -3.769166, 1, 1, 1, 1, 1,
-0.4388707, 0.02983091, -1.635981, 1, 1, 1, 1, 1,
-0.4357658, 1.113559, 0.8219786, 1, 1, 1, 1, 1,
-0.4313057, 1.093258, -1.184878, 1, 1, 1, 1, 1,
-0.4217294, 1.169933, -0.6129411, 1, 1, 1, 1, 1,
-0.4203354, 0.1322532, -1.36601, 1, 1, 1, 1, 1,
-0.4183221, 0.309986, -1.388275, 1, 1, 1, 1, 1,
-0.4182233, -0.4899523, -2.198569, 1, 1, 1, 1, 1,
-0.4137311, 0.01539605, -1.865645, 1, 1, 1, 1, 1,
-0.4107857, 1.207515, 0.1676141, 1, 1, 1, 1, 1,
-0.410784, -0.3055686, -2.928729, 1, 1, 1, 1, 1,
-0.4065467, 0.4368128, 0.4572398, 1, 1, 1, 1, 1,
-0.4055692, -0.6148718, -3.44591, 1, 1, 1, 1, 1,
-0.4046293, -0.937578, -1.918907, 1, 1, 1, 1, 1,
-0.4039619, 1.017068, -0.1605173, 1, 1, 1, 1, 1,
-0.4032888, 1.544146, -0.7325514, 0, 0, 1, 1, 1,
-0.4018068, -1.387668, -3.421524, 1, 0, 0, 1, 1,
-0.3987042, -0.2709109, -3.157749, 1, 0, 0, 1, 1,
-0.3979852, -0.1771403, -2.769301, 1, 0, 0, 1, 1,
-0.3970842, -0.1309119, -1.466081, 1, 0, 0, 1, 1,
-0.3951723, -0.751368, -2.140059, 1, 0, 0, 1, 1,
-0.3913794, 0.8732715, -0.8061821, 0, 0, 0, 1, 1,
-0.3827475, -0.9565153, -2.76482, 0, 0, 0, 1, 1,
-0.381615, 0.47373, -0.6307231, 0, 0, 0, 1, 1,
-0.3765696, -0.942573, -2.019587, 0, 0, 0, 1, 1,
-0.376463, -1.43727, -1.966675, 0, 0, 0, 1, 1,
-0.3728008, 0.3762537, -2.202151, 0, 0, 0, 1, 1,
-0.3662895, 0.2438859, 1.323691, 0, 0, 0, 1, 1,
-0.3614801, -0.3269686, -3.624898, 1, 1, 1, 1, 1,
-0.3546253, -0.5002315, -3.586348, 1, 1, 1, 1, 1,
-0.3508294, 1.20118, 0.1284194, 1, 1, 1, 1, 1,
-0.3467605, 2.248634, -0.1914354, 1, 1, 1, 1, 1,
-0.3463177, 0.5503793, 0.2014157, 1, 1, 1, 1, 1,
-0.3321501, -1.225962, -2.457101, 1, 1, 1, 1, 1,
-0.3280406, 2.085162, -0.08646722, 1, 1, 1, 1, 1,
-0.325988, -1.261509, -1.968687, 1, 1, 1, 1, 1,
-0.3228995, -0.6399004, -2.787339, 1, 1, 1, 1, 1,
-0.3217789, 0.07454012, -0.9906698, 1, 1, 1, 1, 1,
-0.3211457, -0.2870045, -1.732581, 1, 1, 1, 1, 1,
-0.3153821, -0.04205205, -1.904238, 1, 1, 1, 1, 1,
-0.3092048, -0.510061, -3.619011, 1, 1, 1, 1, 1,
-0.3077228, 1.910143, 0.07621191, 1, 1, 1, 1, 1,
-0.3051759, -0.1811655, -1.252853, 1, 1, 1, 1, 1,
-0.302237, -0.03574823, -1.862228, 0, 0, 1, 1, 1,
-0.2954765, 0.4262164, -1.269006, 1, 0, 0, 1, 1,
-0.2925415, 1.869005, -0.3662172, 1, 0, 0, 1, 1,
-0.2873052, -1.2792, -2.615703, 1, 0, 0, 1, 1,
-0.2838794, -1.011737, -3.172416, 1, 0, 0, 1, 1,
-0.282308, 1.4294, -0.5782874, 1, 0, 0, 1, 1,
-0.2764164, -0.1790453, -2.135329, 0, 0, 0, 1, 1,
-0.2705556, 1.759039, -0.6198703, 0, 0, 0, 1, 1,
-0.2645337, 0.1469781, -1.593295, 0, 0, 0, 1, 1,
-0.2623312, 0.1188947, -3.950782, 0, 0, 0, 1, 1,
-0.2583459, 0.1599471, -2.265447, 0, 0, 0, 1, 1,
-0.2574292, 0.422981, -1.654341, 0, 0, 0, 1, 1,
-0.2563162, 0.8033234, 0.5652204, 0, 0, 0, 1, 1,
-0.2555428, -0.03460244, -1.332045, 1, 1, 1, 1, 1,
-0.2541914, 1.073138, -0.9673235, 1, 1, 1, 1, 1,
-0.2511369, -0.842279, -2.804504, 1, 1, 1, 1, 1,
-0.2473709, 0.9150206, -1.275813, 1, 1, 1, 1, 1,
-0.2472501, 0.466118, -0.3138549, 1, 1, 1, 1, 1,
-0.2470416, 0.5582767, -1.017156, 1, 1, 1, 1, 1,
-0.2452101, -0.06435399, -3.550176, 1, 1, 1, 1, 1,
-0.2401048, -0.6279449, -1.297752, 1, 1, 1, 1, 1,
-0.2393186, 0.2507307, 0.4562625, 1, 1, 1, 1, 1,
-0.2365157, -1.618022, -2.842602, 1, 1, 1, 1, 1,
-0.2346907, -0.1483924, -2.510285, 1, 1, 1, 1, 1,
-0.2335262, 0.4230753, -0.07657716, 1, 1, 1, 1, 1,
-0.2333481, -0.681853, -1.307876, 1, 1, 1, 1, 1,
-0.2321579, 0.4747483, -0.2038852, 1, 1, 1, 1, 1,
-0.2299804, -1.390802, -3.000745, 1, 1, 1, 1, 1,
-0.2293796, 1.159381, -1.783665, 0, 0, 1, 1, 1,
-0.2266857, -1.216029, -2.967316, 1, 0, 0, 1, 1,
-0.2239343, 0.3362978, -0.6429155, 1, 0, 0, 1, 1,
-0.2146972, 0.3540623, -2.345287, 1, 0, 0, 1, 1,
-0.2135675, -1.033637, -3.129761, 1, 0, 0, 1, 1,
-0.2118814, -0.3783022, -1.549008, 1, 0, 0, 1, 1,
-0.2117584, -0.3900885, -1.602213, 0, 0, 0, 1, 1,
-0.2117094, -0.1878086, -0.2899143, 0, 0, 0, 1, 1,
-0.2089607, -1.424937, -0.7212983, 0, 0, 0, 1, 1,
-0.2074616, 0.4642737, -0.06895187, 0, 0, 0, 1, 1,
-0.2038802, -0.04992089, -2.626017, 0, 0, 0, 1, 1,
-0.2035373, 2.37358, -2.011366, 0, 0, 0, 1, 1,
-0.2015941, 0.09299559, 0.3543976, 0, 0, 0, 1, 1,
-0.1992289, 2.451354, -0.3147103, 1, 1, 1, 1, 1,
-0.1968374, -1.10015, -2.441729, 1, 1, 1, 1, 1,
-0.1941862, 0.6485577, -1.412373, 1, 1, 1, 1, 1,
-0.1939565, -1.222029, -4.27876, 1, 1, 1, 1, 1,
-0.189852, -0.6485189, -2.913688, 1, 1, 1, 1, 1,
-0.1896344, -1.287307, -3.682497, 1, 1, 1, 1, 1,
-0.1877446, 0.6043019, -0.07592601, 1, 1, 1, 1, 1,
-0.1874103, -0.4107524, -2.822362, 1, 1, 1, 1, 1,
-0.1784611, 0.640507, -0.2482192, 1, 1, 1, 1, 1,
-0.1706489, 1.849553, 0.5020393, 1, 1, 1, 1, 1,
-0.1674314, -0.5611384, -1.773401, 1, 1, 1, 1, 1,
-0.1648542, 1.186318, 0.2726901, 1, 1, 1, 1, 1,
-0.1639512, -0.7284482, -4.618228, 1, 1, 1, 1, 1,
-0.1603016, 0.1850683, -2.251333, 1, 1, 1, 1, 1,
-0.1567188, -2.486241, -3.756098, 1, 1, 1, 1, 1,
-0.1549095, -0.2286865, -2.439328, 0, 0, 1, 1, 1,
-0.1543135, -0.6716021, -1.795291, 1, 0, 0, 1, 1,
-0.1536428, -0.1948326, -2.48167, 1, 0, 0, 1, 1,
-0.1532685, -2.319349, -3.152, 1, 0, 0, 1, 1,
-0.150778, -0.1874327, -2.539132, 1, 0, 0, 1, 1,
-0.1475571, 0.2136772, -1.581211, 1, 0, 0, 1, 1,
-0.1470936, -1.801261, -2.727469, 0, 0, 0, 1, 1,
-0.140544, -0.1512576, -1.452775, 0, 0, 0, 1, 1,
-0.135183, -0.7991644, -3.644966, 0, 0, 0, 1, 1,
-0.133206, 0.6898505, 1.021353, 0, 0, 0, 1, 1,
-0.1311009, -0.2890389, -1.143434, 0, 0, 0, 1, 1,
-0.1293364, 1.813417, 1.692811, 0, 0, 0, 1, 1,
-0.1270609, 0.2753311, -0.9567441, 0, 0, 0, 1, 1,
-0.1256653, 0.5395275, -2.023599, 1, 1, 1, 1, 1,
-0.1214088, 0.5794726, -1.606968, 1, 1, 1, 1, 1,
-0.1197198, -0.6371424, -2.100228, 1, 1, 1, 1, 1,
-0.1114846, 0.07293727, -0.4053784, 1, 1, 1, 1, 1,
-0.1087626, -0.8625075, -2.863226, 1, 1, 1, 1, 1,
-0.1077102, 1.077901, 0.6765407, 1, 1, 1, 1, 1,
-0.1035058, 0.2236933, -0.536175, 1, 1, 1, 1, 1,
-0.1030396, 0.4591734, 1.313529, 1, 1, 1, 1, 1,
-0.1016282, 0.1541806, -0.7450167, 1, 1, 1, 1, 1,
-0.1001614, 0.9493069, -0.5299585, 1, 1, 1, 1, 1,
-0.09202299, 0.7682048, 0.7130216, 1, 1, 1, 1, 1,
-0.08763801, -0.519476, -3.786945, 1, 1, 1, 1, 1,
-0.08691268, -0.03042902, -2.36289, 1, 1, 1, 1, 1,
-0.08434329, -0.03057385, -2.412737, 1, 1, 1, 1, 1,
-0.08168137, -2.011007, -4.800838, 1, 1, 1, 1, 1,
-0.08120238, -0.02278972, -3.449955, 0, 0, 1, 1, 1,
-0.07926506, 1.358898, 0.4885014, 1, 0, 0, 1, 1,
-0.07828233, 0.2697179, -1.626041, 1, 0, 0, 1, 1,
-0.07655304, -0.6092415, -3.129431, 1, 0, 0, 1, 1,
-0.07615335, -1.1441, -2.347483, 1, 0, 0, 1, 1,
-0.07585081, -1.087876, -2.072899, 1, 0, 0, 1, 1,
-0.06954657, 1.156691, 2.614675, 0, 0, 0, 1, 1,
-0.0675078, -0.0394997, -1.347147, 0, 0, 0, 1, 1,
-0.06714074, -1.420768, -3.813139, 0, 0, 0, 1, 1,
-0.06706975, 0.6448926, -0.4889637, 0, 0, 0, 1, 1,
-0.06433038, -0.3065932, -5.668504, 0, 0, 0, 1, 1,
-0.05992762, -0.07292893, -2.327303, 0, 0, 0, 1, 1,
-0.05612603, 0.2308953, 0.1938586, 0, 0, 0, 1, 1,
-0.05368218, 1.584939, 0.7681836, 1, 1, 1, 1, 1,
-0.05296168, -0.006867226, -1.173578, 1, 1, 1, 1, 1,
-0.05114434, -0.9477625, -3.992625, 1, 1, 1, 1, 1,
-0.04987967, 0.4088018, -0.5265911, 1, 1, 1, 1, 1,
-0.04858877, 0.2897108, -1.969033, 1, 1, 1, 1, 1,
-0.04826824, -0.953572, -2.449738, 1, 1, 1, 1, 1,
-0.04415774, -0.5241426, -3.429001, 1, 1, 1, 1, 1,
-0.03979224, 0.1660888, 0.7287451, 1, 1, 1, 1, 1,
-0.03894275, -1.37991, -2.580969, 1, 1, 1, 1, 1,
-0.03873032, 0.4498237, 0.2161514, 1, 1, 1, 1, 1,
-0.03854508, -1.748863, -3.497366, 1, 1, 1, 1, 1,
-0.03830088, 0.4436782, 0.3945991, 1, 1, 1, 1, 1,
-0.03679026, -0.7875933, -4.263542, 1, 1, 1, 1, 1,
-0.02852058, 0.4159814, -1.012651, 1, 1, 1, 1, 1,
-0.02806116, -1.337693, -1.62742, 1, 1, 1, 1, 1,
-0.02637609, -1.833964, -1.155782, 0, 0, 1, 1, 1,
-0.02568013, 0.03834685, -0.5467423, 1, 0, 0, 1, 1,
-0.02496583, -2.451562, -2.829101, 1, 0, 0, 1, 1,
-0.02417229, -0.1398236, -1.640779, 1, 0, 0, 1, 1,
-0.02274001, -1.297075, -3.555317, 1, 0, 0, 1, 1,
-0.01988593, 0.4045069, -1.877308, 1, 0, 0, 1, 1,
-0.01857463, -0.9977369, -3.321053, 0, 0, 0, 1, 1,
-0.01496635, -0.5697516, -3.870836, 0, 0, 0, 1, 1,
-0.01265693, -0.4181794, -2.368596, 0, 0, 0, 1, 1,
-0.010916, -0.6395798, -2.272003, 0, 0, 0, 1, 1,
-0.008615621, -1.192001, -3.977069, 0, 0, 0, 1, 1,
-0.00289754, 0.09600109, -0.6033416, 0, 0, 0, 1, 1,
0.006900697, -0.3348492, 2.563284, 0, 0, 0, 1, 1,
0.01114529, -1.645573, 4.195535, 1, 1, 1, 1, 1,
0.01354176, -0.01876475, 1.850107, 1, 1, 1, 1, 1,
0.01428676, -0.0199424, 2.618996, 1, 1, 1, 1, 1,
0.01490236, -0.8202385, 2.349937, 1, 1, 1, 1, 1,
0.02067984, 1.048825, 0.1141289, 1, 1, 1, 1, 1,
0.02306879, -1.61755, 3.123661, 1, 1, 1, 1, 1,
0.02898543, 0.8652918, 0.7582242, 1, 1, 1, 1, 1,
0.03011759, 1.120898, -0.5703117, 1, 1, 1, 1, 1,
0.03276073, -0.9789286, 1.621658, 1, 1, 1, 1, 1,
0.04161184, 0.8787428, 0.2500698, 1, 1, 1, 1, 1,
0.04902942, 0.2958481, 0.3602286, 1, 1, 1, 1, 1,
0.04998298, -0.5108132, 3.07178, 1, 1, 1, 1, 1,
0.05054392, 0.5935379, -0.3594632, 1, 1, 1, 1, 1,
0.05179539, 0.6490427, 0.3176407, 1, 1, 1, 1, 1,
0.05386459, -0.04031558, 1.829611, 1, 1, 1, 1, 1,
0.05440404, 1.39098, 0.4774497, 0, 0, 1, 1, 1,
0.05916766, 1.100528, 1.054842, 1, 0, 0, 1, 1,
0.06147984, -2.204934, 2.040718, 1, 0, 0, 1, 1,
0.06161565, 0.8070475, -0.7697899, 1, 0, 0, 1, 1,
0.06224943, 1.636314, 1.281859, 1, 0, 0, 1, 1,
0.06538051, -0.830748, 4.625426, 1, 0, 0, 1, 1,
0.06601273, -1.68174, 2.952494, 0, 0, 0, 1, 1,
0.06888107, 0.9583606, 1.298242, 0, 0, 0, 1, 1,
0.06932921, -0.8811897, 3.307707, 0, 0, 0, 1, 1,
0.0720285, -0.7578683, 3.116437, 0, 0, 0, 1, 1,
0.07442516, 1.858849, 0.2343301, 0, 0, 0, 1, 1,
0.07482252, -1.623634, 2.867651, 0, 0, 0, 1, 1,
0.07509279, 0.9255127, -0.3329927, 0, 0, 0, 1, 1,
0.08584329, 0.7015104, -0.3433314, 1, 1, 1, 1, 1,
0.08826873, 0.3571343, 0.1519418, 1, 1, 1, 1, 1,
0.08936317, -0.4167765, 3.81924, 1, 1, 1, 1, 1,
0.08990438, 0.1307063, 0.5373172, 1, 1, 1, 1, 1,
0.09126825, 0.8996954, -0.631383, 1, 1, 1, 1, 1,
0.09188189, 0.001276283, 0.8906906, 1, 1, 1, 1, 1,
0.09950832, -1.050125, 2.275354, 1, 1, 1, 1, 1,
0.1023364, 0.7486127, -1.415134, 1, 1, 1, 1, 1,
0.103048, 0.02488097, 1.940263, 1, 1, 1, 1, 1,
0.1067196, -0.3449205, 2.482745, 1, 1, 1, 1, 1,
0.1070967, 0.6837734, 0.7258481, 1, 1, 1, 1, 1,
0.1108466, 0.9174645, 0.6501336, 1, 1, 1, 1, 1,
0.114426, 0.03991457, 1.765224, 1, 1, 1, 1, 1,
0.1175403, -0.0689289, 1.183894, 1, 1, 1, 1, 1,
0.1206928, -0.9579208, 2.546674, 1, 1, 1, 1, 1,
0.1242287, -1.987424, 4.460369, 0, 0, 1, 1, 1,
0.128202, -1.512981, 4.602303, 1, 0, 0, 1, 1,
0.1287297, -0.5713804, 1.052706, 1, 0, 0, 1, 1,
0.1321037, 0.1935885, -0.8647645, 1, 0, 0, 1, 1,
0.1347293, 0.5462711, -1.615307, 1, 0, 0, 1, 1,
0.1357247, 0.3509224, -0.4267187, 1, 0, 0, 1, 1,
0.1373663, 1.815573, 0.3815987, 0, 0, 0, 1, 1,
0.1377085, -0.03083791, 0.4548064, 0, 0, 0, 1, 1,
0.1378631, 0.7915204, -0.474976, 0, 0, 0, 1, 1,
0.140719, -0.6326435, 2.196409, 0, 0, 0, 1, 1,
0.1463823, 1.069532, -0.6371485, 0, 0, 0, 1, 1,
0.1463955, 2.227395, -0.5353878, 0, 0, 0, 1, 1,
0.146928, 1.6232, -0.9108168, 0, 0, 0, 1, 1,
0.1477348, 0.1277093, 1.86782, 1, 1, 1, 1, 1,
0.1503857, -0.9369133, -0.03018517, 1, 1, 1, 1, 1,
0.1604719, -0.04101038, 1.292329, 1, 1, 1, 1, 1,
0.1638812, 2.029356, 0.1170778, 1, 1, 1, 1, 1,
0.1665739, 0.8979825, 0.6253346, 1, 1, 1, 1, 1,
0.168522, 0.05184286, 0.8334296, 1, 1, 1, 1, 1,
0.1721898, -0.5758473, 3.516137, 1, 1, 1, 1, 1,
0.1721985, -1.588596, 4.498032, 1, 1, 1, 1, 1,
0.1755758, -0.3361952, 2.103645, 1, 1, 1, 1, 1,
0.1756022, 1.536456, -0.1438991, 1, 1, 1, 1, 1,
0.1777141, 0.4597749, 1.529781, 1, 1, 1, 1, 1,
0.1876818, 1.694715, 0.2871632, 1, 1, 1, 1, 1,
0.1889625, -0.4259495, 5.158365, 1, 1, 1, 1, 1,
0.1902746, 0.107372, 1.709539, 1, 1, 1, 1, 1,
0.1976234, -1.248426, 2.537291, 1, 1, 1, 1, 1,
0.1977903, -1.067009, 3.327, 0, 0, 1, 1, 1,
0.2020209, 0.3082574, 1.062931, 1, 0, 0, 1, 1,
0.2023257, -0.7416081, 2.334049, 1, 0, 0, 1, 1,
0.2033728, 1.330442, 1.665834, 1, 0, 0, 1, 1,
0.2075545, -0.2966863, 2.572829, 1, 0, 0, 1, 1,
0.2084923, -0.5761002, 4.573811, 1, 0, 0, 1, 1,
0.2097452, -0.7458212, 2.766817, 0, 0, 0, 1, 1,
0.2124657, 0.9599586, -0.5198348, 0, 0, 0, 1, 1,
0.2130605, 0.104209, 1.94019, 0, 0, 0, 1, 1,
0.2136223, -1.468766, 3.960853, 0, 0, 0, 1, 1,
0.2221683, 0.6702893, 0.8272185, 0, 0, 0, 1, 1,
0.2241945, 0.694438, -0.7937981, 0, 0, 0, 1, 1,
0.2242976, 1.352085, -0.853643, 0, 0, 0, 1, 1,
0.2279423, -0.1723914, 0.7315519, 1, 1, 1, 1, 1,
0.2326034, 1.010061, 2.580198, 1, 1, 1, 1, 1,
0.233052, -0.5604799, 3.04016, 1, 1, 1, 1, 1,
0.2355736, 0.8492273, 0.9318512, 1, 1, 1, 1, 1,
0.2366569, -0.3191761, 1.229159, 1, 1, 1, 1, 1,
0.2492746, -0.2175559, 3.954849, 1, 1, 1, 1, 1,
0.250499, 0.1532433, -0.3600549, 1, 1, 1, 1, 1,
0.2512253, 0.3021154, -0.3092233, 1, 1, 1, 1, 1,
0.253647, 0.3621432, 1.060676, 1, 1, 1, 1, 1,
0.254907, 0.9448006, -0.257709, 1, 1, 1, 1, 1,
0.2559539, 0.1629995, 1.807602, 1, 1, 1, 1, 1,
0.2596819, -0.4118797, 2.724762, 1, 1, 1, 1, 1,
0.2638326, 1.067758, 0.3754402, 1, 1, 1, 1, 1,
0.2700949, 0.09453209, 1.80764, 1, 1, 1, 1, 1,
0.2718762, 0.02431902, 0.7547501, 1, 1, 1, 1, 1,
0.276217, -0.526605, 1.920517, 0, 0, 1, 1, 1,
0.2778265, -0.7071183, 2.904519, 1, 0, 0, 1, 1,
0.2781983, 1.393792, 0.4104099, 1, 0, 0, 1, 1,
0.2782087, 0.362296, 0.8319479, 1, 0, 0, 1, 1,
0.2846565, -0.5805156, 1.662934, 1, 0, 0, 1, 1,
0.2853938, -0.9380955, 3.839186, 1, 0, 0, 1, 1,
0.2854368, 0.5099899, 0.5639648, 0, 0, 0, 1, 1,
0.2863512, -1.412874, 1.974997, 0, 0, 0, 1, 1,
0.2876748, -0.9441388, 3.079422, 0, 0, 0, 1, 1,
0.2877973, 0.01533388, 3.053369, 0, 0, 0, 1, 1,
0.2921221, 1.708954, 0.3946914, 0, 0, 0, 1, 1,
0.2925542, 0.09645813, 2.52938, 0, 0, 0, 1, 1,
0.2946662, 1.038259, -0.7859285, 0, 0, 0, 1, 1,
0.2953237, 0.6661976, -0.2607959, 1, 1, 1, 1, 1,
0.2980244, -0.6644314, 2.741946, 1, 1, 1, 1, 1,
0.2990954, -1.289284, 2.319781, 1, 1, 1, 1, 1,
0.3103, 0.677812, 1.343528, 1, 1, 1, 1, 1,
0.3110712, 0.06066794, -0.9705483, 1, 1, 1, 1, 1,
0.313844, 0.3199345, 0.9914942, 1, 1, 1, 1, 1,
0.3177956, 0.2992478, 0.5199267, 1, 1, 1, 1, 1,
0.3204845, 0.4588679, -0.5777311, 1, 1, 1, 1, 1,
0.3205413, 0.2805446, 0.7260427, 1, 1, 1, 1, 1,
0.3247802, 0.09008723, 2.325976, 1, 1, 1, 1, 1,
0.3294131, 2.103112, 0.9419502, 1, 1, 1, 1, 1,
0.3303503, 1.324654, -0.7871109, 1, 1, 1, 1, 1,
0.3341188, 0.6499922, 0.3727458, 1, 1, 1, 1, 1,
0.339393, 1.112858, 0.8904214, 1, 1, 1, 1, 1,
0.3398488, -0.7285358, 1.345348, 1, 1, 1, 1, 1,
0.3402763, 0.7142991, 0.8326422, 0, 0, 1, 1, 1,
0.3410316, 0.6153953, 0.2258979, 1, 0, 0, 1, 1,
0.3416473, 1.08001, -1.18134, 1, 0, 0, 1, 1,
0.3429859, -0.01254581, 2.933855, 1, 0, 0, 1, 1,
0.3479501, 0.3020058, 0.9418008, 1, 0, 0, 1, 1,
0.3482903, -0.1635756, 1.650561, 1, 0, 0, 1, 1,
0.3487317, -0.3305297, 1.853839, 0, 0, 0, 1, 1,
0.3512713, 1.324332, 1.466661, 0, 0, 0, 1, 1,
0.3519608, -2.167562, 3.08968, 0, 0, 0, 1, 1,
0.3553631, 0.4887538, 1.157293, 0, 0, 0, 1, 1,
0.3563127, -1.117807, 2.274849, 0, 0, 0, 1, 1,
0.3567969, -0.3471959, 1.390476, 0, 0, 0, 1, 1,
0.3606972, -0.1155275, 3.078008, 0, 0, 0, 1, 1,
0.3632084, 0.4355106, -0.2284381, 1, 1, 1, 1, 1,
0.363588, -0.3001666, 3.078838, 1, 1, 1, 1, 1,
0.3662, -1.765553, 2.217546, 1, 1, 1, 1, 1,
0.3712548, -0.1785859, 3.451257, 1, 1, 1, 1, 1,
0.3752638, -0.07052496, 2.49732, 1, 1, 1, 1, 1,
0.3779952, -0.07683998, 0.3776567, 1, 1, 1, 1, 1,
0.3783521, 0.5429662, -0.6468368, 1, 1, 1, 1, 1,
0.381947, 0.3018192, 1.629288, 1, 1, 1, 1, 1,
0.3864543, -0.09948813, 3.193724, 1, 1, 1, 1, 1,
0.3884352, -0.502709, -0.08571925, 1, 1, 1, 1, 1,
0.3940133, -0.8198453, 1.156032, 1, 1, 1, 1, 1,
0.3968962, -1.590821, 3.3356, 1, 1, 1, 1, 1,
0.3994717, 1.112767, 1.214223, 1, 1, 1, 1, 1,
0.4003064, 1.182803, 0.373207, 1, 1, 1, 1, 1,
0.401119, 1.206398, 1.819918, 1, 1, 1, 1, 1,
0.4032053, -0.9848174, 3.109182, 0, 0, 1, 1, 1,
0.4044998, -0.9898835, 2.502155, 1, 0, 0, 1, 1,
0.4046938, -1.784531, 3.022357, 1, 0, 0, 1, 1,
0.4144326, 2.03038, 0.5185372, 1, 0, 0, 1, 1,
0.4150008, 0.06662577, 1.105801, 1, 0, 0, 1, 1,
0.4157125, 0.322976, 2.445794, 1, 0, 0, 1, 1,
0.4240198, -1.321487, 2.733366, 0, 0, 0, 1, 1,
0.4275882, 0.1760222, 1.396636, 0, 0, 0, 1, 1,
0.4332358, -1.256951, 3.726895, 0, 0, 0, 1, 1,
0.4338425, 0.01790059, 4.307352, 0, 0, 0, 1, 1,
0.4355287, 1.176864, -0.335968, 0, 0, 0, 1, 1,
0.4364831, -0.6625591, 3.482579, 0, 0, 0, 1, 1,
0.4373095, -0.9444637, 1.999191, 0, 0, 0, 1, 1,
0.4400676, -1.714551, 2.551179, 1, 1, 1, 1, 1,
0.4442365, 0.6129029, 2.238336, 1, 1, 1, 1, 1,
0.4445544, -0.05114165, 0.3229499, 1, 1, 1, 1, 1,
0.4455479, 1.397069, 0.5130914, 1, 1, 1, 1, 1,
0.448397, -0.1370105, 1.495679, 1, 1, 1, 1, 1,
0.4498438, -0.5303046, -0.4075834, 1, 1, 1, 1, 1,
0.4500562, 0.4557329, 0.8791469, 1, 1, 1, 1, 1,
0.4516894, 0.0271796, 1.766798, 1, 1, 1, 1, 1,
0.4566627, 1.048047, 1.596107, 1, 1, 1, 1, 1,
0.4577624, -0.1416262, 1.400071, 1, 1, 1, 1, 1,
0.4605848, -0.9377125, 3.880762, 1, 1, 1, 1, 1,
0.4608144, 0.8509828, 1.727881, 1, 1, 1, 1, 1,
0.4682869, 0.8351595, 0.3862585, 1, 1, 1, 1, 1,
0.4683949, 1.661074, 1.166284, 1, 1, 1, 1, 1,
0.4707157, 1.709091, 1.471803, 1, 1, 1, 1, 1,
0.4715498, 0.08530335, 3.292412, 0, 0, 1, 1, 1,
0.4722166, -0.9371662, 3.600339, 1, 0, 0, 1, 1,
0.4726774, 0.1162134, 1.297474, 1, 0, 0, 1, 1,
0.472898, -1.470195, 4.392209, 1, 0, 0, 1, 1,
0.4776885, -0.2135544, 3.004888, 1, 0, 0, 1, 1,
0.4844362, 0.03970899, 0.754343, 1, 0, 0, 1, 1,
0.4882809, 0.05139308, 1.025043, 0, 0, 0, 1, 1,
0.4884857, 1.145979, 0.6394627, 0, 0, 0, 1, 1,
0.4888996, -0.6535336, 2.23413, 0, 0, 0, 1, 1,
0.492739, -0.2008409, 1.884452, 0, 0, 0, 1, 1,
0.4934976, -0.2673404, 1.401755, 0, 0, 0, 1, 1,
0.4940002, 0.1120875, 1.736652, 0, 0, 0, 1, 1,
0.4960845, 0.6923478, 0.8061543, 0, 0, 0, 1, 1,
0.5060866, -0.8712837, 2.447634, 1, 1, 1, 1, 1,
0.5066836, -0.2229304, 2.750822, 1, 1, 1, 1, 1,
0.50772, 0.3029793, 0.8186653, 1, 1, 1, 1, 1,
0.5085501, 0.3579001, 0.3327255, 1, 1, 1, 1, 1,
0.5140771, -1.208359, 2.756008, 1, 1, 1, 1, 1,
0.5145662, 0.2253311, 0.1863797, 1, 1, 1, 1, 1,
0.5186036, -0.3877247, 0.7523025, 1, 1, 1, 1, 1,
0.5213119, 0.1392396, 0.4266605, 1, 1, 1, 1, 1,
0.527163, -1.116727, 3.174149, 1, 1, 1, 1, 1,
0.5300796, 0.9306496, 0.1578444, 1, 1, 1, 1, 1,
0.5317869, 0.2455851, 0.9691885, 1, 1, 1, 1, 1,
0.5338031, 0.8041475, 2.002038, 1, 1, 1, 1, 1,
0.5340018, -0.8658308, 1.45694, 1, 1, 1, 1, 1,
0.5343179, 0.3356559, 1.953603, 1, 1, 1, 1, 1,
0.5383464, -0.7596865, 3.576802, 1, 1, 1, 1, 1,
0.5391198, -0.7949265, 2.065492, 0, 0, 1, 1, 1,
0.5441903, 1.53511, 1.182081, 1, 0, 0, 1, 1,
0.5471672, 0.370353, 1.672215, 1, 0, 0, 1, 1,
0.5477024, 1.043267, 1.272214, 1, 0, 0, 1, 1,
0.5503383, -0.5892972, 2.005487, 1, 0, 0, 1, 1,
0.5537381, 0.6634033, 0.2047261, 1, 0, 0, 1, 1,
0.5566221, 1.008983, 0.6939902, 0, 0, 0, 1, 1,
0.557908, 0.218967, 1.371037, 0, 0, 0, 1, 1,
0.5646716, -0.9450427, 1.348189, 0, 0, 0, 1, 1,
0.5646747, -2.153195, 2.18076, 0, 0, 0, 1, 1,
0.5653257, 0.7303581, 0.6551208, 0, 0, 0, 1, 1,
0.5681339, 0.1134445, 1.175381, 0, 0, 0, 1, 1,
0.5683153, -1.911106, 3.261068, 0, 0, 0, 1, 1,
0.5705572, 0.8117048, -0.0004266506, 1, 1, 1, 1, 1,
0.5732307, 1.848344, 0.5779259, 1, 1, 1, 1, 1,
0.5776634, -1.91988, 2.53819, 1, 1, 1, 1, 1,
0.5780726, 1.197437, -0.2437076, 1, 1, 1, 1, 1,
0.5790153, -0.3053959, 1.830685, 1, 1, 1, 1, 1,
0.5811713, -1.045742, 2.049237, 1, 1, 1, 1, 1,
0.582629, -0.7261317, 3.849141, 1, 1, 1, 1, 1,
0.5852531, -0.4261003, 3.655792, 1, 1, 1, 1, 1,
0.5881648, -0.5711275, 1.995803, 1, 1, 1, 1, 1,
0.5894261, 1.892846, 0.3839107, 1, 1, 1, 1, 1,
0.5963721, -0.8623443, 1.500968, 1, 1, 1, 1, 1,
0.596912, -0.4879865, 2.734684, 1, 1, 1, 1, 1,
0.6015666, -0.2402551, 3.573302, 1, 1, 1, 1, 1,
0.6034064, 1.185491, -0.1249128, 1, 1, 1, 1, 1,
0.6066632, 1.341678, 0.7933296, 1, 1, 1, 1, 1,
0.609549, 1.799863, 1.082049, 0, 0, 1, 1, 1,
0.6148734, -0.367673, 2.697912, 1, 0, 0, 1, 1,
0.6152346, 1.073987, 0.3327748, 1, 0, 0, 1, 1,
0.6168264, -0.5836788, 2.634161, 1, 0, 0, 1, 1,
0.6168428, -0.6083911, 3.562065, 1, 0, 0, 1, 1,
0.620622, -0.6988048, 3.562321, 1, 0, 0, 1, 1,
0.627754, 1.008927, -0.4861891, 0, 0, 0, 1, 1,
0.6298262, 0.3166997, 2.113113, 0, 0, 0, 1, 1,
0.6306377, 0.5971247, 2.519531, 0, 0, 0, 1, 1,
0.6325073, 1.261406, 1.313917, 0, 0, 0, 1, 1,
0.6332155, 0.7468228, 0.05561329, 0, 0, 0, 1, 1,
0.6351357, 1.177025, 0.793718, 0, 0, 0, 1, 1,
0.6389295, -0.6801217, 2.645492, 0, 0, 0, 1, 1,
0.6398215, -0.3805717, 2.887963, 1, 1, 1, 1, 1,
0.641565, 0.1664152, 2.024228, 1, 1, 1, 1, 1,
0.643504, 0.4645373, 0.3257654, 1, 1, 1, 1, 1,
0.6443837, 0.4594305, 2.853482, 1, 1, 1, 1, 1,
0.6466152, 0.1993094, 1.284764, 1, 1, 1, 1, 1,
0.6470588, -1.765994, 2.844982, 1, 1, 1, 1, 1,
0.6512589, 0.1545001, 2.168237, 1, 1, 1, 1, 1,
0.6527998, 1.352157, 0.3587222, 1, 1, 1, 1, 1,
0.6540225, -0.6152848, 1.17914, 1, 1, 1, 1, 1,
0.6540771, -1.642543, 0.07259764, 1, 1, 1, 1, 1,
0.6555066, -0.252222, 3.186232, 1, 1, 1, 1, 1,
0.6555983, 0.768289, 0.9082559, 1, 1, 1, 1, 1,
0.6570166, -0.2526831, 0.3617843, 1, 1, 1, 1, 1,
0.6577848, -1.309626, 3.339647, 1, 1, 1, 1, 1,
0.6647348, 0.9370416, -1.230513, 1, 1, 1, 1, 1,
0.6654643, -1.29142, 1.60437, 0, 0, 1, 1, 1,
0.6722742, 0.9567958, 1.530231, 1, 0, 0, 1, 1,
0.6746399, -0.1793267, 1.761293, 1, 0, 0, 1, 1,
0.6772433, -1.046416, 3.822926, 1, 0, 0, 1, 1,
0.6794829, -2.880615, 3.125297, 1, 0, 0, 1, 1,
0.6820402, -1.55287, 3.257155, 1, 0, 0, 1, 1,
0.6836475, 0.3735411, 0.9897321, 0, 0, 0, 1, 1,
0.6841227, 0.1772587, 1.082346, 0, 0, 0, 1, 1,
0.6841494, 0.4034401, 1.244158, 0, 0, 0, 1, 1,
0.6957124, -0.05465977, 1.453669, 0, 0, 0, 1, 1,
0.6968015, -0.09076708, 1.363612, 0, 0, 0, 1, 1,
0.6968286, -1.416533, 2.770058, 0, 0, 0, 1, 1,
0.6971903, -1.19738, 3.998935, 0, 0, 0, 1, 1,
0.6978662, -0.1130208, 2.053016, 1, 1, 1, 1, 1,
0.7009054, -0.1831038, 0.8255939, 1, 1, 1, 1, 1,
0.703043, -0.9895689, 2.859895, 1, 1, 1, 1, 1,
0.7042332, 1.036226, 0.6912196, 1, 1, 1, 1, 1,
0.7055185, -1.531149, 3.258191, 1, 1, 1, 1, 1,
0.7067955, 0.5614265, 0.7690884, 1, 1, 1, 1, 1,
0.7101604, -1.112725, 1.933757, 1, 1, 1, 1, 1,
0.714914, 0.695125, 1.463462, 1, 1, 1, 1, 1,
0.716399, 0.2772001, 2.789736, 1, 1, 1, 1, 1,
0.7200699, 0.2173351, 0.4286413, 1, 1, 1, 1, 1,
0.7256619, -1.835296, 4.339989, 1, 1, 1, 1, 1,
0.7260435, 1.679809, 0.3341865, 1, 1, 1, 1, 1,
0.7303735, -1.030733, 2.557839, 1, 1, 1, 1, 1,
0.7325718, -0.3330597, 1.201562, 1, 1, 1, 1, 1,
0.7373137, -1.171541, 2.773997, 1, 1, 1, 1, 1,
0.7373188, -0.3698736, 3.312348, 0, 0, 1, 1, 1,
0.7380322, -0.3311369, 2.40625, 1, 0, 0, 1, 1,
0.7495209, -0.1419132, 0.2845526, 1, 0, 0, 1, 1,
0.7512013, 0.7796088, 0.6719179, 1, 0, 0, 1, 1,
0.7515925, -0.2027744, 2.175569, 1, 0, 0, 1, 1,
0.7537165, 0.02214332, 2.146865, 1, 0, 0, 1, 1,
0.7548304, 0.4669334, 0.4865969, 0, 0, 0, 1, 1,
0.7563112, -0.7578038, 2.701865, 0, 0, 0, 1, 1,
0.7597318, -1.240389, 2.438471, 0, 0, 0, 1, 1,
0.7620377, 0.08241048, 0.2450775, 0, 0, 0, 1, 1,
0.7637444, -0.4847583, 2.635601, 0, 0, 0, 1, 1,
0.7667117, -0.1062074, -2.204822, 0, 0, 0, 1, 1,
0.7710333, 0.7515388, 2.545261, 0, 0, 0, 1, 1,
0.7765654, 1.154256, 2.283296, 1, 1, 1, 1, 1,
0.7794398, -0.1510589, 1.227859, 1, 1, 1, 1, 1,
0.7804605, 0.5855176, 0.1670427, 1, 1, 1, 1, 1,
0.7845342, -0.2831273, 2.027424, 1, 1, 1, 1, 1,
0.7849162, -0.6026874, 4.370269, 1, 1, 1, 1, 1,
0.7866581, -0.579738, 1.144465, 1, 1, 1, 1, 1,
0.7877679, -1.493123, 3.021332, 1, 1, 1, 1, 1,
0.7923533, 0.06695542, 2.597483, 1, 1, 1, 1, 1,
0.7937233, 0.9946228, 0.8647079, 1, 1, 1, 1, 1,
0.7943672, -1.704676, 4.687175, 1, 1, 1, 1, 1,
0.8018007, -0.2014932, 0.88627, 1, 1, 1, 1, 1,
0.8037308, -0.2341577, -0.1262937, 1, 1, 1, 1, 1,
0.807329, 0.08340909, 0.534525, 1, 1, 1, 1, 1,
0.8133205, 1.859288, 0.52417, 1, 1, 1, 1, 1,
0.8151474, -0.9533556, 2.118366, 1, 1, 1, 1, 1,
0.819464, -0.03647814, 1.845235, 0, 0, 1, 1, 1,
0.8197199, 0.7135715, 1.814802, 1, 0, 0, 1, 1,
0.8296295, -0.1894406, 1.511876, 1, 0, 0, 1, 1,
0.8306715, -0.128628, 1.54893, 1, 0, 0, 1, 1,
0.8369535, -0.9189481, 3.30805, 1, 0, 0, 1, 1,
0.8384919, 0.9420967, 1.672285, 1, 0, 0, 1, 1,
0.8432768, -0.7128461, -0.6277647, 0, 0, 0, 1, 1,
0.8530695, -1.550648, 2.490586, 0, 0, 0, 1, 1,
0.8534296, 0.5909021, 0.9380284, 0, 0, 0, 1, 1,
0.8556299, -0.3381796, 1.133465, 0, 0, 0, 1, 1,
0.8636053, 1.209279, 1.361759, 0, 0, 0, 1, 1,
0.8647186, -1.348266, 1.613346, 0, 0, 0, 1, 1,
0.8671647, 1.558561, -0.2256275, 0, 0, 0, 1, 1,
0.8709524, -1.536022, 3.459429, 1, 1, 1, 1, 1,
0.8750215, 1.036541, 0.05517112, 1, 1, 1, 1, 1,
0.8778625, -0.05534206, 1.610645, 1, 1, 1, 1, 1,
0.8851549, -1.818467, 3.840398, 1, 1, 1, 1, 1,
0.8931943, -0.7897583, 1.518923, 1, 1, 1, 1, 1,
0.9094625, -0.07394843, 1.330113, 1, 1, 1, 1, 1,
0.9138961, -0.1115201, 1.193771, 1, 1, 1, 1, 1,
0.9175379, -0.641332, 2.244806, 1, 1, 1, 1, 1,
0.9229237, 0.8102855, 0.8111554, 1, 1, 1, 1, 1,
0.9256671, 0.2728136, 2.496273, 1, 1, 1, 1, 1,
0.9258634, -2.313722, 2.902022, 1, 1, 1, 1, 1,
0.9264109, -0.3366114, 2.482034, 1, 1, 1, 1, 1,
0.940052, 0.2671949, 0.3492647, 1, 1, 1, 1, 1,
0.9405928, -1.137661, 3.848479, 1, 1, 1, 1, 1,
0.9470307, 0.5105832, 2.015718, 1, 1, 1, 1, 1,
0.9474198, 0.972083, 0.2349947, 0, 0, 1, 1, 1,
0.9476216, 0.3306129, 1.210163, 1, 0, 0, 1, 1,
0.9488404, 1.507052, 1.468619, 1, 0, 0, 1, 1,
0.952528, -0.9702303, 2.479707, 1, 0, 0, 1, 1,
0.9568857, -0.1432521, 2.318078, 1, 0, 0, 1, 1,
0.965835, -0.1177958, 0.3181293, 1, 0, 0, 1, 1,
0.9882621, 0.5653106, 1.607155, 0, 0, 0, 1, 1,
0.989081, -0.1929296, 1.005751, 0, 0, 0, 1, 1,
0.9901949, -0.7541307, 2.922714, 0, 0, 0, 1, 1,
0.9904569, -0.09772356, 2.085615, 0, 0, 0, 1, 1,
0.9915271, 1.378957, 1.669394, 0, 0, 0, 1, 1,
0.9944612, -1.277121, 2.752441, 0, 0, 0, 1, 1,
0.9999969, -0.09661222, 1.81831, 0, 0, 0, 1, 1,
1.000022, 0.4718307, 1.656407, 1, 1, 1, 1, 1,
1.00066, -1.053772, 2.548824, 1, 1, 1, 1, 1,
1.000996, -2.053699, 2.768069, 1, 1, 1, 1, 1,
1.002378, -0.4896979, 3.362365, 1, 1, 1, 1, 1,
1.00463, 2.592379, 1.223664, 1, 1, 1, 1, 1,
1.00917, 1.048651, 1.497922, 1, 1, 1, 1, 1,
1.015465, -0.4529265, 0.5965702, 1, 1, 1, 1, 1,
1.016441, 0.3506537, 0.414166, 1, 1, 1, 1, 1,
1.018007, 0.4840255, 2.284302, 1, 1, 1, 1, 1,
1.025764, -2.381757, 1.744197, 1, 1, 1, 1, 1,
1.03854, 1.154104, -0.1006103, 1, 1, 1, 1, 1,
1.041679, 1.248358, 2.515063, 1, 1, 1, 1, 1,
1.043188, 0.7325498, 1.580337, 1, 1, 1, 1, 1,
1.045854, -0.06621833, 1.141668, 1, 1, 1, 1, 1,
1.052198, -1.395292, 3.714036, 1, 1, 1, 1, 1,
1.057892, 0.02403545, 1.845318, 0, 0, 1, 1, 1,
1.063974, 1.786776, -1.221529, 1, 0, 0, 1, 1,
1.064653, -1.614535, 4.547501, 1, 0, 0, 1, 1,
1.086521, -0.3035613, 1.516035, 1, 0, 0, 1, 1,
1.098588, 0.9299258, 0.5841358, 1, 0, 0, 1, 1,
1.108956, -0.07187323, 2.388109, 1, 0, 0, 1, 1,
1.112705, 0.1131834, 1.366345, 0, 0, 0, 1, 1,
1.112837, 0.03258044, 0.463712, 0, 0, 0, 1, 1,
1.123903, 0.3418319, 1.390835, 0, 0, 0, 1, 1,
1.125444, -0.1300135, 2.501581, 0, 0, 0, 1, 1,
1.130687, -0.8519711, 2.960635, 0, 0, 0, 1, 1,
1.135552, -1.199568, 1.304632, 0, 0, 0, 1, 1,
1.140633, 1.191042, 0.4443793, 0, 0, 0, 1, 1,
1.14218, -1.307602, 3.898729, 1, 1, 1, 1, 1,
1.14471, -0.5656142, 2.822134, 1, 1, 1, 1, 1,
1.145355, -0.8082045, 3.355703, 1, 1, 1, 1, 1,
1.146545, -0.0199655, 0.6442561, 1, 1, 1, 1, 1,
1.14924, -0.6652827, 3.984706, 1, 1, 1, 1, 1,
1.154269, 0.2348435, 2.253994, 1, 1, 1, 1, 1,
1.155283, -0.7356489, 0.3822763, 1, 1, 1, 1, 1,
1.162138, -0.08838052, 1.148208, 1, 1, 1, 1, 1,
1.162739, 0.9802418, 1.988963, 1, 1, 1, 1, 1,
1.192262, 1.599324, -0.07218211, 1, 1, 1, 1, 1,
1.198973, -0.8651057, 1.987613, 1, 1, 1, 1, 1,
1.20218, -0.6385003, -0.1705743, 1, 1, 1, 1, 1,
1.206867, 1.566826, 1.582203, 1, 1, 1, 1, 1,
1.209294, 1.651651, 0.2975969, 1, 1, 1, 1, 1,
1.211166, -0.6318023, 3.289722, 1, 1, 1, 1, 1,
1.221724, 1.658829, 1.280454, 0, 0, 1, 1, 1,
1.234123, -1.747281, 1.772118, 1, 0, 0, 1, 1,
1.240571, -0.5760776, 2.13146, 1, 0, 0, 1, 1,
1.258481, 0.6198785, -0.188306, 1, 0, 0, 1, 1,
1.264306, -0.8545401, 2.896926, 1, 0, 0, 1, 1,
1.274215, -1.161525, 4.021453, 1, 0, 0, 1, 1,
1.274438, -1.090095, 1.378391, 0, 0, 0, 1, 1,
1.277098, 0.7497361, 1.769579, 0, 0, 0, 1, 1,
1.283276, -1.574562, 2.570256, 0, 0, 0, 1, 1,
1.289823, 0.1094984, 1.224669, 0, 0, 0, 1, 1,
1.297596, 0.7446809, 1.631647, 0, 0, 0, 1, 1,
1.29824, 2.096831, -1.116462, 0, 0, 0, 1, 1,
1.298431, -1.446478, 1.61975, 0, 0, 0, 1, 1,
1.309254, -0.7560291, 1.399616, 1, 1, 1, 1, 1,
1.312079, -0.7740883, 1.149818, 1, 1, 1, 1, 1,
1.314675, 0.5883422, 3.386462, 1, 1, 1, 1, 1,
1.318343, -1.38264, 4.016221, 1, 1, 1, 1, 1,
1.327467, 2.01356, 0.3635905, 1, 1, 1, 1, 1,
1.333802, 1.330276, -0.7817564, 1, 1, 1, 1, 1,
1.340063, -1.415069, 3.484426, 1, 1, 1, 1, 1,
1.342288, -0.4195035, 2.07356, 1, 1, 1, 1, 1,
1.350075, 0.2836176, 1.405013, 1, 1, 1, 1, 1,
1.350139, -0.3411959, 2.961642, 1, 1, 1, 1, 1,
1.357937, -1.196282, 1.641755, 1, 1, 1, 1, 1,
1.373431, -1.489707, 1.76023, 1, 1, 1, 1, 1,
1.381154, -1.359029, 3.731453, 1, 1, 1, 1, 1,
1.40463, -0.7544825, 2.362798, 1, 1, 1, 1, 1,
1.421311, -0.1530667, 0.6538651, 1, 1, 1, 1, 1,
1.424475, 0.5396246, 1.915459, 0, 0, 1, 1, 1,
1.43482, -1.106421, 2.361343, 1, 0, 0, 1, 1,
1.436328, 0.5865893, 0.5651584, 1, 0, 0, 1, 1,
1.452453, 1.978524, -1.174417, 1, 0, 0, 1, 1,
1.463153, -2.317042, 2.302958, 1, 0, 0, 1, 1,
1.491865, -0.08404174, 1.35894, 1, 0, 0, 1, 1,
1.499958, -1.373781, 3.815519, 0, 0, 0, 1, 1,
1.508414, 0.9570722, 1.335992, 0, 0, 0, 1, 1,
1.513505, 1.062034, 1.081294, 0, 0, 0, 1, 1,
1.522194, -0.8727754, 2.588134, 0, 0, 0, 1, 1,
1.523011, 0.382347, 2.393951, 0, 0, 0, 1, 1,
1.5432, 0.2894097, 2.230962, 0, 0, 0, 1, 1,
1.549665, 0.04792196, 1.881568, 0, 0, 0, 1, 1,
1.564425, -0.1245291, 0.7280715, 1, 1, 1, 1, 1,
1.570137, 0.6641527, 1.940109, 1, 1, 1, 1, 1,
1.570457, 0.3564565, -0.07740284, 1, 1, 1, 1, 1,
1.571465, -0.8926739, 3.423795, 1, 1, 1, 1, 1,
1.586359, 1.199907, 1.665499, 1, 1, 1, 1, 1,
1.588462, 0.9168605, 0.9258094, 1, 1, 1, 1, 1,
1.591944, -0.3914418, 2.151057, 1, 1, 1, 1, 1,
1.596714, 1.046015, 0.4839656, 1, 1, 1, 1, 1,
1.600995, -1.499709, 2.611145, 1, 1, 1, 1, 1,
1.609302, 0.1274556, 1.613556, 1, 1, 1, 1, 1,
1.614503, 0.2991426, 0.2700649, 1, 1, 1, 1, 1,
1.61662, -0.9695147, 2.493725, 1, 1, 1, 1, 1,
1.621878, -0.3137717, -0.5424207, 1, 1, 1, 1, 1,
1.640083, 0.7577643, 2.313654, 1, 1, 1, 1, 1,
1.645927, -0.2119144, 1.811469, 1, 1, 1, 1, 1,
1.652115, 0.6312005, 0.6911088, 0, 0, 1, 1, 1,
1.661121, -0.3499174, 0.6181178, 1, 0, 0, 1, 1,
1.698893, 1.651445, 2.272059, 1, 0, 0, 1, 1,
1.701361, -2.840803, 3.333976, 1, 0, 0, 1, 1,
1.735081, 0.09089997, 1.805911, 1, 0, 0, 1, 1,
1.735367, -1.309951, 1.528511, 1, 0, 0, 1, 1,
1.737996, 1.091635, 1.530963, 0, 0, 0, 1, 1,
1.770753, -0.2937571, 0.934049, 0, 0, 0, 1, 1,
1.780988, -1.460133, 1.077974, 0, 0, 0, 1, 1,
1.786739, -0.8190745, 2.025879, 0, 0, 0, 1, 1,
1.796574, -1.151162, 1.056327, 0, 0, 0, 1, 1,
1.79942, 1.316092, -1.049257, 0, 0, 0, 1, 1,
1.81617, -0.5056419, 3.11441, 0, 0, 0, 1, 1,
1.835136, -0.1844306, 2.662143, 1, 1, 1, 1, 1,
1.841783, -0.260461, -0.3063581, 1, 1, 1, 1, 1,
1.844008, -0.2812565, 2.590562, 1, 1, 1, 1, 1,
1.859341, -0.1295288, 1.969532, 1, 1, 1, 1, 1,
1.872255, 1.078813, 1.69489, 1, 1, 1, 1, 1,
1.87503, 0.3607482, -0.1405324, 1, 1, 1, 1, 1,
1.881027, -2.603844, 1.873709, 1, 1, 1, 1, 1,
1.888952, -0.6737075, 2.244466, 1, 1, 1, 1, 1,
1.909229, 2.221543, 2.051567, 1, 1, 1, 1, 1,
1.957996, -1.200567, 3.146021, 1, 1, 1, 1, 1,
1.964284, -1.571195, 3.35394, 1, 1, 1, 1, 1,
1.983263, -0.805117, 2.82094, 1, 1, 1, 1, 1,
2.023525, 0.6231185, 0.4953208, 1, 1, 1, 1, 1,
2.027431, 0.1103957, 1.203645, 1, 1, 1, 1, 1,
2.065732, -1.013914, 2.866878, 1, 1, 1, 1, 1,
2.078319, 1.492122, 0.568791, 0, 0, 1, 1, 1,
2.087152, -0.1088722, 2.248125, 1, 0, 0, 1, 1,
2.107992, 0.1322693, 3.683661, 1, 0, 0, 1, 1,
2.146849, -0.6080005, 2.376756, 1, 0, 0, 1, 1,
2.154954, -0.4218336, 2.56028, 1, 0, 0, 1, 1,
2.203723, 1.068241, 1.266204, 1, 0, 0, 1, 1,
2.205311, 0.04362108, 2.143894, 0, 0, 0, 1, 1,
2.21398, 0.2514609, 1.190367, 0, 0, 0, 1, 1,
2.245371, 0.2887668, 2.655703, 0, 0, 0, 1, 1,
2.278817, 0.1080565, 2.616076, 0, 0, 0, 1, 1,
2.291945, -0.5609376, 0.423246, 0, 0, 0, 1, 1,
2.328055, -0.2804774, 3.057351, 0, 0, 0, 1, 1,
2.353812, 1.368235, 1.789467, 0, 0, 0, 1, 1,
2.48371, -0.7682985, 0.1172268, 1, 1, 1, 1, 1,
2.726784, -0.3521091, 0.5457603, 1, 1, 1, 1, 1,
3.011516, 0.3316748, -0.2562534, 1, 1, 1, 1, 1,
3.05441, -0.6203229, 0.8486831, 1, 1, 1, 1, 1,
3.432981, -0.1208026, 0.9744284, 1, 1, 1, 1, 1,
3.445618, -0.4540674, 1.743421, 1, 1, 1, 1, 1,
3.5282, 1.719499, 1.154139, 1, 1, 1, 1, 1
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
var radius = 9.49706;
var distance = 33.35802;
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
mvMatrix.translate( -0.1183178, 0.1441177, 0.2550697 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.35802);
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