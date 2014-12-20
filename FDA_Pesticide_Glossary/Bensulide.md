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
-3.392181, 1.269356, 0.01915625, 1, 0, 0, 1,
-3.222568, -1.7817, -2.93872, 1, 0.007843138, 0, 1,
-2.895771, -1.587871, -2.302353, 1, 0.01176471, 0, 1,
-2.822935, 0.1111435, -1.69789, 1, 0.01960784, 0, 1,
-2.656897, -0.3658009, -0.8396657, 1, 0.02352941, 0, 1,
-2.639491, -1.011456, -0.9838683, 1, 0.03137255, 0, 1,
-2.613782, 0.2322874, -0.8689576, 1, 0.03529412, 0, 1,
-2.601723, -0.8342056, -2.154405, 1, 0.04313726, 0, 1,
-2.601427, 0.1929614, -1.2812, 1, 0.04705882, 0, 1,
-2.572225, -2.484314, -3.153467, 1, 0.05490196, 0, 1,
-2.533518, -0.3899362, -2.908504, 1, 0.05882353, 0, 1,
-2.472453, 1.561378, 0.1420006, 1, 0.06666667, 0, 1,
-2.454868, 0.5626625, -0.6618696, 1, 0.07058824, 0, 1,
-2.38962, 0.4221335, -1.896638, 1, 0.07843138, 0, 1,
-2.300821, -0.3412786, -0.4931446, 1, 0.08235294, 0, 1,
-2.300411, 1.824408, -1.268069, 1, 0.09019608, 0, 1,
-2.264506, 1.194826, -0.06826521, 1, 0.09411765, 0, 1,
-2.233392, -1.854942, -1.044592, 1, 0.1019608, 0, 1,
-2.179497, -0.0310257, -1.7086, 1, 0.1098039, 0, 1,
-2.175325, -0.6395081, -2.641407, 1, 0.1137255, 0, 1,
-2.171489, 0.9812887, -0.3793096, 1, 0.1215686, 0, 1,
-2.16621, 0.6294913, -1.197287, 1, 0.1254902, 0, 1,
-2.16365, 0.5240231, -2.007121, 1, 0.1333333, 0, 1,
-2.140227, 0.4645841, -2.176017, 1, 0.1372549, 0, 1,
-2.106754, 0.2121252, -1.301759, 1, 0.145098, 0, 1,
-2.105374, 0.5799472, -1.289791, 1, 0.1490196, 0, 1,
-2.094629, -0.2080117, -2.811787, 1, 0.1568628, 0, 1,
-2.087973, 0.05610061, -3.226863, 1, 0.1607843, 0, 1,
-2.07261, -2.054868, -1.089382, 1, 0.1686275, 0, 1,
-2.016716, 0.3686177, -0.8435672, 1, 0.172549, 0, 1,
-1.997325, 1.852102, -2.522099, 1, 0.1803922, 0, 1,
-1.993037, -0.8779119, -2.844698, 1, 0.1843137, 0, 1,
-1.973248, 0.6411385, 0.1600541, 1, 0.1921569, 0, 1,
-1.966555, 0.07996102, -1.235712, 1, 0.1960784, 0, 1,
-1.964965, 0.9245465, -0.5654256, 1, 0.2039216, 0, 1,
-1.952848, 0.4835375, -2.690895, 1, 0.2117647, 0, 1,
-1.922953, 1.667464, -2.007345, 1, 0.2156863, 0, 1,
-1.922885, -1.02566, -3.701664, 1, 0.2235294, 0, 1,
-1.908431, -1.708529, -2.477795, 1, 0.227451, 0, 1,
-1.904842, -0.576933, -3.202479, 1, 0.2352941, 0, 1,
-1.897667, 1.190763, -2.07582, 1, 0.2392157, 0, 1,
-1.890202, -1.582953, -2.321364, 1, 0.2470588, 0, 1,
-1.884794, 0.6134755, -1.166858, 1, 0.2509804, 0, 1,
-1.863441, 0.2644425, -1.727662, 1, 0.2588235, 0, 1,
-1.851129, 1.241838, -2.282015, 1, 0.2627451, 0, 1,
-1.798977, 0.9893846, -0.7871017, 1, 0.2705882, 0, 1,
-1.794518, -1.169929, -2.425459, 1, 0.2745098, 0, 1,
-1.793336, 0.4658335, -1.00858, 1, 0.282353, 0, 1,
-1.787734, -0.4131534, -3.844239, 1, 0.2862745, 0, 1,
-1.786732, 0.9200529, -2.364051, 1, 0.2941177, 0, 1,
-1.7657, 2.597378, -0.6141117, 1, 0.3019608, 0, 1,
-1.72947, -1.451877, -3.034672, 1, 0.3058824, 0, 1,
-1.725204, -0.9594733, -1.327738, 1, 0.3137255, 0, 1,
-1.723384, -1.153781, -4.331848, 1, 0.3176471, 0, 1,
-1.720429, 2.57411, 0.6677088, 1, 0.3254902, 0, 1,
-1.715755, -1.811173, -3.904747, 1, 0.3294118, 0, 1,
-1.714922, -0.1189844, -1.03088, 1, 0.3372549, 0, 1,
-1.713529, -1.456856, -0.5565508, 1, 0.3411765, 0, 1,
-1.713462, 0.1289341, -1.337259, 1, 0.3490196, 0, 1,
-1.70724, -0.004244138, -1.525229, 1, 0.3529412, 0, 1,
-1.699901, -0.0250362, -1.916869, 1, 0.3607843, 0, 1,
-1.671996, -0.4231636, -1.739035, 1, 0.3647059, 0, 1,
-1.671126, -0.4314287, -1.882028, 1, 0.372549, 0, 1,
-1.638605, 2.23661, 0.870754, 1, 0.3764706, 0, 1,
-1.626702, -0.5119327, -0.3357692, 1, 0.3843137, 0, 1,
-1.624319, -0.1139481, -1.874606, 1, 0.3882353, 0, 1,
-1.615347, 0.5948415, -1.01136, 1, 0.3960784, 0, 1,
-1.601864, 0.3691272, -1.459835, 1, 0.4039216, 0, 1,
-1.590558, 0.04310621, -3.496031, 1, 0.4078431, 0, 1,
-1.587601, 1.784987, -0.3932868, 1, 0.4156863, 0, 1,
-1.565725, -0.1502282, -0.641085, 1, 0.4196078, 0, 1,
-1.556244, 0.01146002, -3.009858, 1, 0.427451, 0, 1,
-1.553851, 0.3209701, -1.115053, 1, 0.4313726, 0, 1,
-1.549509, 1.161425, -1.049313, 1, 0.4392157, 0, 1,
-1.542328, -0.6800858, -1.344419, 1, 0.4431373, 0, 1,
-1.539475, -0.9145852, -0.5237102, 1, 0.4509804, 0, 1,
-1.531779, -0.4341523, -1.304005, 1, 0.454902, 0, 1,
-1.517595, 1.961619, 0.7322562, 1, 0.4627451, 0, 1,
-1.516834, 0.04718652, 0.2056881, 1, 0.4666667, 0, 1,
-1.505952, -0.2912133, -2.660752, 1, 0.4745098, 0, 1,
-1.481007, 0.6137583, -0.9475432, 1, 0.4784314, 0, 1,
-1.478014, -0.4958086, -0.8823245, 1, 0.4862745, 0, 1,
-1.46164, 0.5178443, -3.927135, 1, 0.4901961, 0, 1,
-1.454963, 0.7089944, 0.3820693, 1, 0.4980392, 0, 1,
-1.452263, -1.213036, -3.114301, 1, 0.5058824, 0, 1,
-1.439707, -1.036103, -3.668049, 1, 0.509804, 0, 1,
-1.431424, -3.087273, -2.646542, 1, 0.5176471, 0, 1,
-1.431323, -0.1938459, -2.886964, 1, 0.5215687, 0, 1,
-1.423518, 1.72265, -0.4798699, 1, 0.5294118, 0, 1,
-1.420067, 0.9185451, -2.513991, 1, 0.5333334, 0, 1,
-1.41428, -1.478057, -3.223592, 1, 0.5411765, 0, 1,
-1.395908, -0.5472048, -3.510871, 1, 0.5450981, 0, 1,
-1.394349, 0.5011082, -1.519893, 1, 0.5529412, 0, 1,
-1.390618, -0.2616147, -1.898028, 1, 0.5568628, 0, 1,
-1.386554, -1.829887, -3.015045, 1, 0.5647059, 0, 1,
-1.381968, 0.9351895, -0.6136968, 1, 0.5686275, 0, 1,
-1.380138, 0.2779979, -2.453089, 1, 0.5764706, 0, 1,
-1.379786, -0.5843899, -2.45266, 1, 0.5803922, 0, 1,
-1.369308, 1.044418, -0.6774884, 1, 0.5882353, 0, 1,
-1.364165, -0.3151603, -2.352989, 1, 0.5921569, 0, 1,
-1.353201, 0.07278065, -1.737826, 1, 0.6, 0, 1,
-1.343401, 0.3906987, -3.092532, 1, 0.6078432, 0, 1,
-1.343037, -0.5099495, -2.07418, 1, 0.6117647, 0, 1,
-1.338723, 0.1569346, -1.769139, 1, 0.6196079, 0, 1,
-1.332007, -2.422785, -2.291455, 1, 0.6235294, 0, 1,
-1.329882, -0.6857626, -1.330952, 1, 0.6313726, 0, 1,
-1.32425, -0.4530016, -2.581854, 1, 0.6352941, 0, 1,
-1.319172, -1.464544, -3.348917, 1, 0.6431373, 0, 1,
-1.313022, 3.121568, -1.067694, 1, 0.6470588, 0, 1,
-1.307091, -1.398876, -2.906539, 1, 0.654902, 0, 1,
-1.304955, -2.282092, -2.717379, 1, 0.6588235, 0, 1,
-1.296005, 1.002756, -1.577222, 1, 0.6666667, 0, 1,
-1.293313, -1.268183, -2.69136, 1, 0.6705883, 0, 1,
-1.289426, -1.228921, -2.362007, 1, 0.6784314, 0, 1,
-1.276865, -0.7049307, -1.385136, 1, 0.682353, 0, 1,
-1.271701, -0.2754086, -1.885052, 1, 0.6901961, 0, 1,
-1.257839, -0.6192789, -3.892832, 1, 0.6941177, 0, 1,
-1.242828, -0.3448021, -2.050008, 1, 0.7019608, 0, 1,
-1.23622, -0.7642158, -2.388835, 1, 0.7098039, 0, 1,
-1.233062, 0.2033284, -1.449661, 1, 0.7137255, 0, 1,
-1.230749, 0.6094111, -0.4235851, 1, 0.7215686, 0, 1,
-1.220241, -0.9579715, -1.551843, 1, 0.7254902, 0, 1,
-1.21912, -2.002191, -1.346468, 1, 0.7333333, 0, 1,
-1.21731, 0.09501914, -1.909758, 1, 0.7372549, 0, 1,
-1.214295, -0.5834647, -1.699483, 1, 0.7450981, 0, 1,
-1.207408, 0.5231765, -1.500628, 1, 0.7490196, 0, 1,
-1.201036, -0.4628585, -1.331613, 1, 0.7568628, 0, 1,
-1.185989, -1.677046, -1.76529, 1, 0.7607843, 0, 1,
-1.170095, 0.9545431, -0.1610402, 1, 0.7686275, 0, 1,
-1.164231, -0.4520102, 0.1505613, 1, 0.772549, 0, 1,
-1.161559, -0.6272016, -4.050742, 1, 0.7803922, 0, 1,
-1.161257, 0.05316097, -1.806556, 1, 0.7843137, 0, 1,
-1.153662, 0.4692672, -0.9279111, 1, 0.7921569, 0, 1,
-1.143561, 0.9154309, -0.7167941, 1, 0.7960784, 0, 1,
-1.14256, -1.241087, -1.364579, 1, 0.8039216, 0, 1,
-1.140507, 0.9113446, -0.9770741, 1, 0.8117647, 0, 1,
-1.135313, 0.4089216, -3.287173, 1, 0.8156863, 0, 1,
-1.13366, -0.1264615, -0.2129342, 1, 0.8235294, 0, 1,
-1.126896, -0.01520311, -2.836156, 1, 0.827451, 0, 1,
-1.124311, 0.03370453, -3.416312, 1, 0.8352941, 0, 1,
-1.122593, 0.2749629, -1.63728, 1, 0.8392157, 0, 1,
-1.121077, 0.5625519, -0.6657454, 1, 0.8470588, 0, 1,
-1.114557, 0.1683384, -0.6725643, 1, 0.8509804, 0, 1,
-1.113997, 0.4648964, -0.5642583, 1, 0.8588235, 0, 1,
-1.096361, -0.7292259, -3.222004, 1, 0.8627451, 0, 1,
-1.089985, -1.403289, -3.35428, 1, 0.8705882, 0, 1,
-1.086515, -1.347848, -2.620931, 1, 0.8745098, 0, 1,
-1.084058, -0.03616063, -2.660119, 1, 0.8823529, 0, 1,
-1.073315, -1.542359, -2.699641, 1, 0.8862745, 0, 1,
-1.071347, 0.3283566, -0.6740191, 1, 0.8941177, 0, 1,
-1.070064, -0.6883392, -1.920994, 1, 0.8980392, 0, 1,
-1.068745, 0.1232039, -1.453182, 1, 0.9058824, 0, 1,
-1.066834, -0.7879028, -2.232665, 1, 0.9137255, 0, 1,
-1.057286, -0.3664369, -2.877681, 1, 0.9176471, 0, 1,
-1.054382, -0.6660122, -2.678524, 1, 0.9254902, 0, 1,
-1.0522, 2.046061, 2.972553, 1, 0.9294118, 0, 1,
-1.045682, 0.7624279, 0.2763112, 1, 0.9372549, 0, 1,
-1.045593, -0.6530614, -3.546574, 1, 0.9411765, 0, 1,
-1.044043, 0.4846764, -1.315511, 1, 0.9490196, 0, 1,
-1.038302, -0.333362, -0.2001984, 1, 0.9529412, 0, 1,
-1.016885, 0.07419966, -2.766843, 1, 0.9607843, 0, 1,
-1.014953, -0.8771273, -1.998134, 1, 0.9647059, 0, 1,
-1.011958, -0.2750877, -3.186172, 1, 0.972549, 0, 1,
-1.008401, 0.4266458, -3.941639, 1, 0.9764706, 0, 1,
-1.005961, -0.8698117, -2.978423, 1, 0.9843137, 0, 1,
-1.003255, -0.2528912, -2.703491, 1, 0.9882353, 0, 1,
-1.002788, 0.54585, -1.524103, 1, 0.9960784, 0, 1,
-0.9950055, -1.774683, -3.093903, 0.9960784, 1, 0, 1,
-0.9928805, -2.812397, -2.698715, 0.9921569, 1, 0, 1,
-0.9916044, -1.371646, -3.496244, 0.9843137, 1, 0, 1,
-0.9882438, -0.7806265, -0.4271477, 0.9803922, 1, 0, 1,
-0.9862615, -1.608576, -3.144114, 0.972549, 1, 0, 1,
-0.9771945, -0.3544482, -3.327215, 0.9686275, 1, 0, 1,
-0.9760878, -0.09739298, -2.061069, 0.9607843, 1, 0, 1,
-0.9691978, 1.202172, -0.7389336, 0.9568627, 1, 0, 1,
-0.9685597, 0.6863538, -0.9940586, 0.9490196, 1, 0, 1,
-0.9672318, 0.671073, -0.1946088, 0.945098, 1, 0, 1,
-0.9610153, 1.279284, -3.41794, 0.9372549, 1, 0, 1,
-0.9594383, 0.2410423, 0.294234, 0.9333333, 1, 0, 1,
-0.958621, 0.3556205, -0.04589619, 0.9254902, 1, 0, 1,
-0.95418, -0.8855085, -2.869087, 0.9215686, 1, 0, 1,
-0.9483954, -0.3527442, -1.727176, 0.9137255, 1, 0, 1,
-0.946094, -0.1397735, -2.311768, 0.9098039, 1, 0, 1,
-0.9438607, -0.2181412, -1.596948, 0.9019608, 1, 0, 1,
-0.9250214, -0.09796339, -1.630401, 0.8941177, 1, 0, 1,
-0.9217806, 1.566564, -1.887695, 0.8901961, 1, 0, 1,
-0.9150482, 0.1651106, -1.089091, 0.8823529, 1, 0, 1,
-0.9050635, -0.4445993, -3.355474, 0.8784314, 1, 0, 1,
-0.9037398, 1.43179, 0.7617254, 0.8705882, 1, 0, 1,
-0.887678, 0.02249715, -2.397842, 0.8666667, 1, 0, 1,
-0.8871139, -0.5347276, -1.026735, 0.8588235, 1, 0, 1,
-0.8646125, 2.099412, 0.2675144, 0.854902, 1, 0, 1,
-0.8600591, 0.5082148, -0.7907693, 0.8470588, 1, 0, 1,
-0.8588584, -3.474432, -0.9467315, 0.8431373, 1, 0, 1,
-0.8498625, -0.100567, -1.769463, 0.8352941, 1, 0, 1,
-0.8395543, 0.4545038, -0.8418695, 0.8313726, 1, 0, 1,
-0.8371229, 0.2749279, -0.9701455, 0.8235294, 1, 0, 1,
-0.8345142, -0.09642427, -4.375591, 0.8196079, 1, 0, 1,
-0.8290356, -0.8400022, -4.647616, 0.8117647, 1, 0, 1,
-0.8229404, -0.09105876, -3.603869, 0.8078431, 1, 0, 1,
-0.8204871, 0.1890012, -1.986315, 0.8, 1, 0, 1,
-0.8162113, -1.947539, -3.320941, 0.7921569, 1, 0, 1,
-0.8153042, 1.761793, 0.3939921, 0.7882353, 1, 0, 1,
-0.8092201, -1.922182, -1.772996, 0.7803922, 1, 0, 1,
-0.8078869, -1.019388, -1.962155, 0.7764706, 1, 0, 1,
-0.8032541, -1.244682, -4.385839, 0.7686275, 1, 0, 1,
-0.8004299, 0.3149595, -1.473964, 0.7647059, 1, 0, 1,
-0.7987565, 0.9010003, 0.5230778, 0.7568628, 1, 0, 1,
-0.7942547, 0.5731866, 0.33503, 0.7529412, 1, 0, 1,
-0.7920117, -0.1629921, -1.649472, 0.7450981, 1, 0, 1,
-0.7898047, -0.04641229, -1.704534, 0.7411765, 1, 0, 1,
-0.7881066, 0.04853584, -1.139393, 0.7333333, 1, 0, 1,
-0.7796022, -1.210446, -1.703201, 0.7294118, 1, 0, 1,
-0.7759173, 0.4385042, -1.900357, 0.7215686, 1, 0, 1,
-0.7755724, -0.08704015, -1.082028, 0.7176471, 1, 0, 1,
-0.7663222, -0.9659086, -1.956087, 0.7098039, 1, 0, 1,
-0.7560315, 0.6866118, 0.8352751, 0.7058824, 1, 0, 1,
-0.7547079, 0.02307712, -0.4290142, 0.6980392, 1, 0, 1,
-0.7519102, -0.07861292, -0.9073224, 0.6901961, 1, 0, 1,
-0.75113, -0.2221612, -1.48534, 0.6862745, 1, 0, 1,
-0.7499963, -0.5792829, -2.043761, 0.6784314, 1, 0, 1,
-0.7443338, 0.599238, 0.1049248, 0.6745098, 1, 0, 1,
-0.7399266, 1.146285, -0.7330194, 0.6666667, 1, 0, 1,
-0.729893, -0.5007829, -3.467059, 0.6627451, 1, 0, 1,
-0.7267572, -0.385583, -2.352418, 0.654902, 1, 0, 1,
-0.718055, -1.045349, -3.514894, 0.6509804, 1, 0, 1,
-0.7178168, 0.2434059, -1.594102, 0.6431373, 1, 0, 1,
-0.7174196, -0.2646253, -1.795602, 0.6392157, 1, 0, 1,
-0.7162505, -0.8228602, -0.9330464, 0.6313726, 1, 0, 1,
-0.7158847, -1.219906, -1.290585, 0.627451, 1, 0, 1,
-0.7123602, -0.5687891, -2.992401, 0.6196079, 1, 0, 1,
-0.705901, -1.110504, -2.492347, 0.6156863, 1, 0, 1,
-0.7019842, -0.6748495, -1.948699, 0.6078432, 1, 0, 1,
-0.6972325, 0.04803875, -3.367502, 0.6039216, 1, 0, 1,
-0.6936291, -0.6913463, -3.614646, 0.5960785, 1, 0, 1,
-0.6917399, 0.2247505, -1.447999, 0.5882353, 1, 0, 1,
-0.6891762, 0.3446358, -2.196792, 0.5843138, 1, 0, 1,
-0.6882015, 1.254877, 1.966395, 0.5764706, 1, 0, 1,
-0.6836727, -0.006987831, -0.7899628, 0.572549, 1, 0, 1,
-0.681709, -0.6754787, -2.924645, 0.5647059, 1, 0, 1,
-0.6689913, -1.144534, -3.324875, 0.5607843, 1, 0, 1,
-0.6659979, 0.04152241, -1.674906, 0.5529412, 1, 0, 1,
-0.6649394, 0.2482562, -0.02522197, 0.5490196, 1, 0, 1,
-0.6648971, -0.4232194, -1.273836, 0.5411765, 1, 0, 1,
-0.6613247, -1.210833, -1.8597, 0.5372549, 1, 0, 1,
-0.6598026, -0.1122256, -1.342741, 0.5294118, 1, 0, 1,
-0.6558623, -0.4567781, -3.513398, 0.5254902, 1, 0, 1,
-0.6557778, -0.533177, -3.597662, 0.5176471, 1, 0, 1,
-0.6546385, 1.011506, -2.248643, 0.5137255, 1, 0, 1,
-0.6388516, -1.770504, -2.914174, 0.5058824, 1, 0, 1,
-0.638791, 0.6227575, -0.9450418, 0.5019608, 1, 0, 1,
-0.6312446, -1.425392, -3.154131, 0.4941176, 1, 0, 1,
-0.6278645, 0.3517166, -3.099818, 0.4862745, 1, 0, 1,
-0.6258903, 0.2031697, -1.548286, 0.4823529, 1, 0, 1,
-0.6239147, -2.523216, -2.946764, 0.4745098, 1, 0, 1,
-0.6132941, 1.786218, -1.630648, 0.4705882, 1, 0, 1,
-0.6129281, -0.4462959, -1.661082, 0.4627451, 1, 0, 1,
-0.6125197, -0.4793795, -4.809646, 0.4588235, 1, 0, 1,
-0.6070657, -1.430766, -2.583179, 0.4509804, 1, 0, 1,
-0.606538, -2.057986, -1.974744, 0.4470588, 1, 0, 1,
-0.5931206, 0.09399198, -2.602659, 0.4392157, 1, 0, 1,
-0.5828267, -1.840378, -3.29171, 0.4352941, 1, 0, 1,
-0.5794659, -0.1992492, -3.39773, 0.427451, 1, 0, 1,
-0.5640937, -0.01774797, -3.614916, 0.4235294, 1, 0, 1,
-0.5607987, 0.02399942, -2.453496, 0.4156863, 1, 0, 1,
-0.5600005, 1.087532, -0.003018118, 0.4117647, 1, 0, 1,
-0.5575574, -1.459045, -4.811756, 0.4039216, 1, 0, 1,
-0.5568306, -0.9033607, -2.028455, 0.3960784, 1, 0, 1,
-0.5555136, -0.5655505, -1.717047, 0.3921569, 1, 0, 1,
-0.5505827, -0.3422292, -1.13109, 0.3843137, 1, 0, 1,
-0.550219, -0.4837366, -1.415513, 0.3803922, 1, 0, 1,
-0.5489164, 0.4683484, 0.8232198, 0.372549, 1, 0, 1,
-0.5482219, 0.7168431, 0.3207016, 0.3686275, 1, 0, 1,
-0.542383, -1.610377, -2.985177, 0.3607843, 1, 0, 1,
-0.5379691, 1.535612, 0.3268681, 0.3568628, 1, 0, 1,
-0.5336921, -0.9111653, -4.850344, 0.3490196, 1, 0, 1,
-0.5304052, -0.04981373, -0.5556955, 0.345098, 1, 0, 1,
-0.5283741, 1.974861, 0.08768215, 0.3372549, 1, 0, 1,
-0.5282562, -1.154621, -1.53844, 0.3333333, 1, 0, 1,
-0.5259443, -0.4782324, -2.17001, 0.3254902, 1, 0, 1,
-0.5225315, -1.375443, -2.592063, 0.3215686, 1, 0, 1,
-0.5222925, -0.6339819, -1.828958, 0.3137255, 1, 0, 1,
-0.5219122, 0.06088973, -1.627146, 0.3098039, 1, 0, 1,
-0.5198923, 0.3928953, -0.8470427, 0.3019608, 1, 0, 1,
-0.5129305, -1.312304, -3.985755, 0.2941177, 1, 0, 1,
-0.5013823, 0.113186, -1.852731, 0.2901961, 1, 0, 1,
-0.5004013, -0.2833897, -2.18908, 0.282353, 1, 0, 1,
-0.498234, -0.9997166, -3.805347, 0.2784314, 1, 0, 1,
-0.4966777, -0.580708, -2.965838, 0.2705882, 1, 0, 1,
-0.4963408, 0.939393, -0.9582019, 0.2666667, 1, 0, 1,
-0.4961632, -0.1422156, -1.036083, 0.2588235, 1, 0, 1,
-0.4903288, 1.719311, -0.5223438, 0.254902, 1, 0, 1,
-0.4880405, -0.4483501, -3.304752, 0.2470588, 1, 0, 1,
-0.4852824, 0.5735702, 1.020932, 0.2431373, 1, 0, 1,
-0.4793954, 0.1448029, -1.548612, 0.2352941, 1, 0, 1,
-0.4785481, 0.4742694, -1.013617, 0.2313726, 1, 0, 1,
-0.4735769, 0.2420495, -0.9198163, 0.2235294, 1, 0, 1,
-0.4723954, -0.9441918, -2.507701, 0.2196078, 1, 0, 1,
-0.4632234, 0.1566243, -2.084529, 0.2117647, 1, 0, 1,
-0.461569, -0.3784021, -2.400991, 0.2078431, 1, 0, 1,
-0.4596385, -1.291368, -1.834789, 0.2, 1, 0, 1,
-0.4595821, 3.029149, 0.1124738, 0.1921569, 1, 0, 1,
-0.4570126, 1.589348, 0.09786886, 0.1882353, 1, 0, 1,
-0.4509394, 0.7562976, -0.9967605, 0.1803922, 1, 0, 1,
-0.4500364, 0.1716559, -0.9588971, 0.1764706, 1, 0, 1,
-0.4483235, 0.004834025, -0.2059131, 0.1686275, 1, 0, 1,
-0.4480776, -0.01489491, -1.147542, 0.1647059, 1, 0, 1,
-0.4472914, -1.161194, -3.443609, 0.1568628, 1, 0, 1,
-0.4435376, -3.568405, -2.816545, 0.1529412, 1, 0, 1,
-0.4394334, -0.3047371, -1.014559, 0.145098, 1, 0, 1,
-0.4370864, -1.401428, -4.296819, 0.1411765, 1, 0, 1,
-0.4368152, 0.1819528, -0.08420085, 0.1333333, 1, 0, 1,
-0.4367876, -0.3201379, -2.516076, 0.1294118, 1, 0, 1,
-0.4354001, -1.145503, -3.912076, 0.1215686, 1, 0, 1,
-0.4254085, -0.3006641, -2.747372, 0.1176471, 1, 0, 1,
-0.4216977, -0.3707311, -3.957142, 0.1098039, 1, 0, 1,
-0.417853, 0.4932442, -0.2196478, 0.1058824, 1, 0, 1,
-0.4172512, -0.1293771, -2.643051, 0.09803922, 1, 0, 1,
-0.4105842, 0.447246, 0.7457112, 0.09019608, 1, 0, 1,
-0.4030286, 0.9580889, 0.2030012, 0.08627451, 1, 0, 1,
-0.4012355, 0.4527881, -2.103462, 0.07843138, 1, 0, 1,
-0.3964365, 0.5407169, -0.4242497, 0.07450981, 1, 0, 1,
-0.3935674, -0.2712546, -1.797908, 0.06666667, 1, 0, 1,
-0.3931626, -0.0464097, -0.7220008, 0.0627451, 1, 0, 1,
-0.3917564, -0.8868575, -2.687082, 0.05490196, 1, 0, 1,
-0.3829733, -0.02468934, -3.228326, 0.05098039, 1, 0, 1,
-0.3799054, 0.6630185, -2.193692, 0.04313726, 1, 0, 1,
-0.3770175, -1.627926, -3.481388, 0.03921569, 1, 0, 1,
-0.3738697, -0.598213, -0.08563564, 0.03137255, 1, 0, 1,
-0.3737941, -1.25432, -4.541609, 0.02745098, 1, 0, 1,
-0.3666449, -0.3502699, -1.896591, 0.01960784, 1, 0, 1,
-0.3660335, -0.1381811, -3.332107, 0.01568628, 1, 0, 1,
-0.363292, -0.8464592, -3.393089, 0.007843138, 1, 0, 1,
-0.3571578, -0.7566071, -2.889212, 0.003921569, 1, 0, 1,
-0.3534883, -0.982345, -2.355506, 0, 1, 0.003921569, 1,
-0.3505859, 0.7744819, 0.01451934, 0, 1, 0.01176471, 1,
-0.349943, 1.57106, 0.2464785, 0, 1, 0.01568628, 1,
-0.3470153, -0.2287702, -2.514774, 0, 1, 0.02352941, 1,
-0.3469299, 1.433304, 1.023657, 0, 1, 0.02745098, 1,
-0.3386874, 0.1116455, -1.020939, 0, 1, 0.03529412, 1,
-0.3380875, -0.4899755, -3.76208, 0, 1, 0.03921569, 1,
-0.3354625, 0.7203757, -1.135719, 0, 1, 0.04705882, 1,
-0.3352804, -0.1844323, -2.571569, 0, 1, 0.05098039, 1,
-0.3350372, 1.785846, 0.1253004, 0, 1, 0.05882353, 1,
-0.3349521, 0.2356064, -1.450627, 0, 1, 0.0627451, 1,
-0.3343118, 0.6623957, -0.2816053, 0, 1, 0.07058824, 1,
-0.3301646, -0.8079789, -3.368474, 0, 1, 0.07450981, 1,
-0.3283793, 0.7613469, 0.01070981, 0, 1, 0.08235294, 1,
-0.3273736, 0.6948471, -0.4528349, 0, 1, 0.08627451, 1,
-0.3256928, 0.5318654, -1.650541, 0, 1, 0.09411765, 1,
-0.3252655, 1.461993, -0.8634337, 0, 1, 0.1019608, 1,
-0.3211239, -1.264607, -1.376588, 0, 1, 0.1058824, 1,
-0.3201659, 0.3069075, -0.8674492, 0, 1, 0.1137255, 1,
-0.3180722, -1.376217, -3.665972, 0, 1, 0.1176471, 1,
-0.3142538, 0.6345575, -1.11608, 0, 1, 0.1254902, 1,
-0.3141508, 0.4837, -0.8449864, 0, 1, 0.1294118, 1,
-0.3106132, -1.20313, -0.7539673, 0, 1, 0.1372549, 1,
-0.3076383, -1.251741, -3.656244, 0, 1, 0.1411765, 1,
-0.3064917, 1.242806, 0.3251755, 0, 1, 0.1490196, 1,
-0.305065, -0.5170721, -2.477068, 0, 1, 0.1529412, 1,
-0.302354, 1.175801, 0.6994756, 0, 1, 0.1607843, 1,
-0.302007, -0.7428904, -2.590451, 0, 1, 0.1647059, 1,
-0.2988772, 3.21571, -0.03313685, 0, 1, 0.172549, 1,
-0.2925381, 1.588846, 1.478873, 0, 1, 0.1764706, 1,
-0.2924295, 0.8495169, -0.124536, 0, 1, 0.1843137, 1,
-0.2904435, 0.09234875, -1.095397, 0, 1, 0.1882353, 1,
-0.2858469, -0.7649218, -4.350887, 0, 1, 0.1960784, 1,
-0.2855586, -1.042423, -1.014765, 0, 1, 0.2039216, 1,
-0.2770635, -0.9360589, -2.07114, 0, 1, 0.2078431, 1,
-0.2717385, 0.5781555, -0.150185, 0, 1, 0.2156863, 1,
-0.2715389, 0.9874193, -0.03622084, 0, 1, 0.2196078, 1,
-0.26919, -0.553327, -3.565133, 0, 1, 0.227451, 1,
-0.2683658, 0.4189095, 0.511757, 0, 1, 0.2313726, 1,
-0.2630543, 0.501081, -0.8356628, 0, 1, 0.2392157, 1,
-0.2607774, 0.4344334, 0.7564526, 0, 1, 0.2431373, 1,
-0.2535109, 1.553833, -1.113387, 0, 1, 0.2509804, 1,
-0.249486, 0.7413474, -0.4308147, 0, 1, 0.254902, 1,
-0.2454123, -0.03324462, -1.938549, 0, 1, 0.2627451, 1,
-0.2438082, -0.2567657, -1.745838, 0, 1, 0.2666667, 1,
-0.242975, 0.382612, -0.3531754, 0, 1, 0.2745098, 1,
-0.2408796, -1.311618, -3.275664, 0, 1, 0.2784314, 1,
-0.238688, 0.8576861, -1.626207, 0, 1, 0.2862745, 1,
-0.2368044, -0.6018975, -2.504371, 0, 1, 0.2901961, 1,
-0.2364577, 0.5771239, -0.4321939, 0, 1, 0.2980392, 1,
-0.2266627, 2.642443, -0.8550129, 0, 1, 0.3058824, 1,
-0.2266312, -0.8713923, -2.036646, 0, 1, 0.3098039, 1,
-0.2252055, -0.5687652, -3.61438, 0, 1, 0.3176471, 1,
-0.2241323, -0.6739798, -1.740848, 0, 1, 0.3215686, 1,
-0.2227942, -0.624467, -2.306233, 0, 1, 0.3294118, 1,
-0.2168985, 1.367541, -0.6445002, 0, 1, 0.3333333, 1,
-0.2168703, 1.096289, -1.632886, 0, 1, 0.3411765, 1,
-0.2128624, 0.5742523, -1.318356, 0, 1, 0.345098, 1,
-0.2035771, 0.4828622, -0.3572468, 0, 1, 0.3529412, 1,
-0.2008048, -0.6171317, -2.185087, 0, 1, 0.3568628, 1,
-0.1990632, -2.102823, -2.485198, 0, 1, 0.3647059, 1,
-0.1986285, -1.527266, -3.58208, 0, 1, 0.3686275, 1,
-0.197154, 0.3712957, 0.6946961, 0, 1, 0.3764706, 1,
-0.195619, -2.038164, -1.808901, 0, 1, 0.3803922, 1,
-0.1923413, 0.1958876, -0.3565655, 0, 1, 0.3882353, 1,
-0.191384, 2.187658, -0.2340111, 0, 1, 0.3921569, 1,
-0.1895299, 2.626672, 0.3054138, 0, 1, 0.4, 1,
-0.1882631, -1.141132, -2.917534, 0, 1, 0.4078431, 1,
-0.1849005, 0.630531, -2.004179, 0, 1, 0.4117647, 1,
-0.1844693, 0.5985541, 0.4857548, 0, 1, 0.4196078, 1,
-0.184416, 0.7016523, -1.117236, 0, 1, 0.4235294, 1,
-0.1839273, 1.833146, 0.138341, 0, 1, 0.4313726, 1,
-0.181336, -0.3686489, -3.990007, 0, 1, 0.4352941, 1,
-0.1805528, -1.480391, -2.625641, 0, 1, 0.4431373, 1,
-0.179393, -1.559737, -2.367788, 0, 1, 0.4470588, 1,
-0.1777514, -0.6069031, -3.558234, 0, 1, 0.454902, 1,
-0.1770209, 0.7421927, 0.5775875, 0, 1, 0.4588235, 1,
-0.1769385, -1.753489, -1.947071, 0, 1, 0.4666667, 1,
-0.1721022, -0.1242212, -1.731766, 0, 1, 0.4705882, 1,
-0.1633568, 1.420136, 0.96422, 0, 1, 0.4784314, 1,
-0.1630847, -1.296029, -4.903692, 0, 1, 0.4823529, 1,
-0.159129, -0.1761152, -0.7050031, 0, 1, 0.4901961, 1,
-0.1589558, 0.5722004, -0.8929736, 0, 1, 0.4941176, 1,
-0.1582766, 0.115274, 0.2876502, 0, 1, 0.5019608, 1,
-0.1574104, 0.01187421, -1.197558, 0, 1, 0.509804, 1,
-0.1541386, 1.379589, -0.7856598, 0, 1, 0.5137255, 1,
-0.153549, -0.2401749, -3.186502, 0, 1, 0.5215687, 1,
-0.1534474, 0.9325098, -0.5187873, 0, 1, 0.5254902, 1,
-0.1518857, 0.984505, 0.4852412, 0, 1, 0.5333334, 1,
-0.1459364, 0.084457, 0.7648229, 0, 1, 0.5372549, 1,
-0.1411406, 1.348461, -1.013499, 0, 1, 0.5450981, 1,
-0.1391939, -0.8876124, -1.904093, 0, 1, 0.5490196, 1,
-0.1365992, -0.7851115, -3.408529, 0, 1, 0.5568628, 1,
-0.1313537, -0.07752717, -1.904402, 0, 1, 0.5607843, 1,
-0.1306912, 0.5118793, -1.327946, 0, 1, 0.5686275, 1,
-0.1298179, -0.8419179, -4.92037, 0, 1, 0.572549, 1,
-0.128883, -0.975752, -4.462698, 0, 1, 0.5803922, 1,
-0.127242, -0.004947704, -2.502052, 0, 1, 0.5843138, 1,
-0.1252078, -0.3753887, -2.181608, 0, 1, 0.5921569, 1,
-0.1233354, 1.251862, -0.1090756, 0, 1, 0.5960785, 1,
-0.1219223, 0.5938757, 0.3044907, 0, 1, 0.6039216, 1,
-0.1179642, -0.8274975, -2.013468, 0, 1, 0.6117647, 1,
-0.1166688, 0.09946734, -1.960406, 0, 1, 0.6156863, 1,
-0.1160213, 0.4355989, 0.5394484, 0, 1, 0.6235294, 1,
-0.1125952, 1.59843, -0.03534634, 0, 1, 0.627451, 1,
-0.1090283, -0.4564706, -1.724871, 0, 1, 0.6352941, 1,
-0.1082588, 0.06931024, 1.992132, 0, 1, 0.6392157, 1,
-0.1076794, -2.360022, -3.043831, 0, 1, 0.6470588, 1,
-0.1044396, -0.02070796, -1.916324, 0, 1, 0.6509804, 1,
-0.1032808, 1.093027, 1.591598, 0, 1, 0.6588235, 1,
-0.1021908, 1.35688, 0.1414947, 0, 1, 0.6627451, 1,
-0.1009511, -1.813966, -3.190493, 0, 1, 0.6705883, 1,
-0.09577332, -0.5922044, -1.698336, 0, 1, 0.6745098, 1,
-0.07700635, -0.03710026, -1.121109, 0, 1, 0.682353, 1,
-0.07601722, -0.2948036, -3.449102, 0, 1, 0.6862745, 1,
-0.071946, 1.611699, -0.1576877, 0, 1, 0.6941177, 1,
-0.07154149, -0.5029928, -2.258094, 0, 1, 0.7019608, 1,
-0.07088888, 0.09840161, -1.716402, 0, 1, 0.7058824, 1,
-0.06359247, 1.723079, -0.6646295, 0, 1, 0.7137255, 1,
-0.056865, 0.1107339, -1.407018, 0, 1, 0.7176471, 1,
-0.05680449, 0.5652258, -2.179957, 0, 1, 0.7254902, 1,
-0.0558353, -1.173305, -5.080918, 0, 1, 0.7294118, 1,
-0.05205764, 0.8235929, 0.9264216, 0, 1, 0.7372549, 1,
-0.05149191, 1.248711, -0.455313, 0, 1, 0.7411765, 1,
-0.0493014, -0.2057865, -3.959337, 0, 1, 0.7490196, 1,
-0.04634782, 0.5637573, 1.323271, 0, 1, 0.7529412, 1,
-0.04117147, -0.3153215, -3.781334, 0, 1, 0.7607843, 1,
-0.03715761, -1.038667, -1.569587, 0, 1, 0.7647059, 1,
-0.03533007, 0.5470149, 1.343826, 0, 1, 0.772549, 1,
-0.03264651, -0.8240532, -3.762586, 0, 1, 0.7764706, 1,
-0.02972749, -0.2139417, -3.84745, 0, 1, 0.7843137, 1,
-0.0280846, 1.969797, 0.1047982, 0, 1, 0.7882353, 1,
-0.02534733, -1.85367, -3.598688, 0, 1, 0.7960784, 1,
-0.02439453, -0.1295373, -4.490494, 0, 1, 0.8039216, 1,
-0.02087099, 1.178532, 0.2651908, 0, 1, 0.8078431, 1,
-0.0183663, 1.127024, -1.590153, 0, 1, 0.8156863, 1,
-0.008452184, -0.09064869, -2.065986, 0, 1, 0.8196079, 1,
-0.006125623, -0.06308687, -2.25396, 0, 1, 0.827451, 1,
-0.004617643, -1.09215, -2.516127, 0, 1, 0.8313726, 1,
-0.00401945, -1.32568, -2.607079, 0, 1, 0.8392157, 1,
-0.001955857, 0.2540149, -0.3524475, 0, 1, 0.8431373, 1,
0.01154623, 0.6741659, -0.1512257, 0, 1, 0.8509804, 1,
0.01534406, 0.1392704, -0.8407924, 0, 1, 0.854902, 1,
0.01769332, 0.8679341, 0.1032665, 0, 1, 0.8627451, 1,
0.01796274, 2.141629, 0.4643113, 0, 1, 0.8666667, 1,
0.0294848, -0.3649696, 2.313009, 0, 1, 0.8745098, 1,
0.0324493, 1.076739, 0.06234074, 0, 1, 0.8784314, 1,
0.03457419, -0.6740235, 3.393036, 0, 1, 0.8862745, 1,
0.03553493, 1.219847, 0.1179713, 0, 1, 0.8901961, 1,
0.03618968, -1.505059, 3.408589, 0, 1, 0.8980392, 1,
0.04375535, 1.777226, 0.08220013, 0, 1, 0.9058824, 1,
0.04651313, 0.3756931, -0.2873545, 0, 1, 0.9098039, 1,
0.0490451, 0.499309, 0.2744009, 0, 1, 0.9176471, 1,
0.04944004, 0.9708567, -2.015159, 0, 1, 0.9215686, 1,
0.05076928, 1.554312, 0.8475509, 0, 1, 0.9294118, 1,
0.05187601, 0.7413921, -0.08763591, 0, 1, 0.9333333, 1,
0.05563553, -0.1029588, 1.60566, 0, 1, 0.9411765, 1,
0.06370032, 1.7183, 0.9357191, 0, 1, 0.945098, 1,
0.07765909, -1.17128, 4.722833, 0, 1, 0.9529412, 1,
0.07911447, 0.1915925, -0.1863742, 0, 1, 0.9568627, 1,
0.07972251, 0.3447889, 1.922686, 0, 1, 0.9647059, 1,
0.08191459, -1.077514, 3.670167, 0, 1, 0.9686275, 1,
0.08268848, 0.7084458, 0.04757562, 0, 1, 0.9764706, 1,
0.08831426, -0.1217202, 1.68183, 0, 1, 0.9803922, 1,
0.08967886, -0.4372435, 1.992605, 0, 1, 0.9882353, 1,
0.09120238, 0.08986896, 1.479654, 0, 1, 0.9921569, 1,
0.09207729, -0.8683574, 4.119357, 0, 1, 1, 1,
0.09295826, 0.3242643, -0.2795031, 0, 0.9921569, 1, 1,
0.09642359, 0.0481462, 2.055734, 0, 0.9882353, 1, 1,
0.09990697, 1.732389, 0.9081599, 0, 0.9803922, 1, 1,
0.1016534, 0.03414599, 3.822013, 0, 0.9764706, 1, 1,
0.1100053, -0.04139401, 2.05028, 0, 0.9686275, 1, 1,
0.1146328, -0.4842566, 1.62951, 0, 0.9647059, 1, 1,
0.1146926, -0.6003584, 2.332179, 0, 0.9568627, 1, 1,
0.1171957, -0.83107, 2.785057, 0, 0.9529412, 1, 1,
0.1183383, 0.1980886, -0.2579736, 0, 0.945098, 1, 1,
0.1218386, 0.7857686, -1.329072, 0, 0.9411765, 1, 1,
0.1219572, 0.2858833, 0.3288915, 0, 0.9333333, 1, 1,
0.125656, -1.399578, 0.8047287, 0, 0.9294118, 1, 1,
0.1297295, 1.767458, 1.140004, 0, 0.9215686, 1, 1,
0.1307239, 0.1398801, 1.967198, 0, 0.9176471, 1, 1,
0.1343985, -1.314499, 3.989973, 0, 0.9098039, 1, 1,
0.137259, -0.1618395, 3.35335, 0, 0.9058824, 1, 1,
0.1386321, 0.09546901, 1.356793, 0, 0.8980392, 1, 1,
0.1430659, 0.5509241, 0.4905747, 0, 0.8901961, 1, 1,
0.1459544, 0.8159454, 1.499382, 0, 0.8862745, 1, 1,
0.1510062, 1.652115, -0.3717439, 0, 0.8784314, 1, 1,
0.1576726, -1.353514, 3.154658, 0, 0.8745098, 1, 1,
0.1603262, 0.03766366, 0.1244069, 0, 0.8666667, 1, 1,
0.1612773, -0.8045608, 4.618546, 0, 0.8627451, 1, 1,
0.1686633, 0.2415498, 0.8825216, 0, 0.854902, 1, 1,
0.1692002, -1.490143, 3.423347, 0, 0.8509804, 1, 1,
0.1706039, -1.608276, 2.753386, 0, 0.8431373, 1, 1,
0.1707297, 0.7199253, 1.082944, 0, 0.8392157, 1, 1,
0.1719372, -0.5487985, 2.04487, 0, 0.8313726, 1, 1,
0.1733295, 0.5051741, -0.5066578, 0, 0.827451, 1, 1,
0.1767507, 1.269925, 1.213876, 0, 0.8196079, 1, 1,
0.1771187, 0.9769418, -0.8621261, 0, 0.8156863, 1, 1,
0.1781105, -0.4944834, 2.259872, 0, 0.8078431, 1, 1,
0.1791949, -0.6198174, 4.789894, 0, 0.8039216, 1, 1,
0.1812364, -1.226891, 3.478497, 0, 0.7960784, 1, 1,
0.1847905, 0.9627383, -1.734071, 0, 0.7882353, 1, 1,
0.185453, 0.4406598, 0.2865274, 0, 0.7843137, 1, 1,
0.1905724, 0.2248645, -0.3133328, 0, 0.7764706, 1, 1,
0.193904, 0.3723674, 1.652573, 0, 0.772549, 1, 1,
0.1951076, 0.4274919, -1.072402, 0, 0.7647059, 1, 1,
0.1994998, -1.519706, 2.156618, 0, 0.7607843, 1, 1,
0.1999834, -1.245979, 2.007601, 0, 0.7529412, 1, 1,
0.200995, 1.395943, 0.3230045, 0, 0.7490196, 1, 1,
0.2020595, 0.8469378, -1.070843, 0, 0.7411765, 1, 1,
0.2023704, 0.3881227, 1.686132, 0, 0.7372549, 1, 1,
0.204178, 0.9402639, -0.04885085, 0, 0.7294118, 1, 1,
0.2049783, 1.22712, -0.411959, 0, 0.7254902, 1, 1,
0.2080553, -0.0273041, 0.6784366, 0, 0.7176471, 1, 1,
0.209479, 0.6179949, 2.181949, 0, 0.7137255, 1, 1,
0.2095559, 0.8437517, 0.2763223, 0, 0.7058824, 1, 1,
0.209696, 0.005898646, 1.311499, 0, 0.6980392, 1, 1,
0.2112342, 0.9874295, 1.463875, 0, 0.6941177, 1, 1,
0.2166215, -0.7872567, 2.437664, 0, 0.6862745, 1, 1,
0.2172669, 2.307232, 0.8430191, 0, 0.682353, 1, 1,
0.2173295, -1.604554, 2.954361, 0, 0.6745098, 1, 1,
0.2177841, -0.26201, 3.419792, 0, 0.6705883, 1, 1,
0.2183353, -0.8647451, 1.977065, 0, 0.6627451, 1, 1,
0.219618, 1.089283, -0.3962113, 0, 0.6588235, 1, 1,
0.2253273, 0.3556988, -0.09516933, 0, 0.6509804, 1, 1,
0.2268618, -1.035899, 1.314004, 0, 0.6470588, 1, 1,
0.2312468, -0.09916312, 2.43903, 0, 0.6392157, 1, 1,
0.2324842, 0.3086445, 0.6086188, 0, 0.6352941, 1, 1,
0.2404263, 0.1688935, 0.3280335, 0, 0.627451, 1, 1,
0.2421043, 1.137109, 0.4890483, 0, 0.6235294, 1, 1,
0.2467021, 0.05147497, 2.837065, 0, 0.6156863, 1, 1,
0.2477029, 0.8998941, 1.07557, 0, 0.6117647, 1, 1,
0.2498101, -1.022355, 2.613546, 0, 0.6039216, 1, 1,
0.250127, -0.4343544, 1.60711, 0, 0.5960785, 1, 1,
0.2501449, 1.043716, -0.1513961, 0, 0.5921569, 1, 1,
0.2555647, -1.267109, 2.799753, 0, 0.5843138, 1, 1,
0.2563704, 0.182293, 1.40379, 0, 0.5803922, 1, 1,
0.2565418, 0.01350324, 1.825265, 0, 0.572549, 1, 1,
0.2582635, -1.268708, 3.874046, 0, 0.5686275, 1, 1,
0.2648256, -0.1242184, 2.554383, 0, 0.5607843, 1, 1,
0.2650827, -0.3375722, 3.843221, 0, 0.5568628, 1, 1,
0.2704782, -0.5090781, 3.783486, 0, 0.5490196, 1, 1,
0.274231, -0.5510895, 2.820754, 0, 0.5450981, 1, 1,
0.2752118, -0.8788708, 1.975371, 0, 0.5372549, 1, 1,
0.2782051, -0.1380126, 0.6297964, 0, 0.5333334, 1, 1,
0.2782973, 0.1347795, 0.8288578, 0, 0.5254902, 1, 1,
0.2792957, 1.563201, 0.4931563, 0, 0.5215687, 1, 1,
0.2817357, 0.8356124, 0.5880345, 0, 0.5137255, 1, 1,
0.2876726, 1.100549, 0.5795175, 0, 0.509804, 1, 1,
0.2936908, -1.052115, 2.213947, 0, 0.5019608, 1, 1,
0.2970973, 0.6531873, 0.9686109, 0, 0.4941176, 1, 1,
0.2974276, 0.2650885, 1.530122, 0, 0.4901961, 1, 1,
0.3011091, -0.1840897, 0.7916786, 0, 0.4823529, 1, 1,
0.3017358, -0.6299059, 4.242834, 0, 0.4784314, 1, 1,
0.3050811, -1.281358, 2.588029, 0, 0.4705882, 1, 1,
0.3074078, 0.5644575, 1.425666, 0, 0.4666667, 1, 1,
0.3076373, 0.1526096, 0.5958775, 0, 0.4588235, 1, 1,
0.311178, 1.415595, 1.020389, 0, 0.454902, 1, 1,
0.316485, -0.1253926, 1.499349, 0, 0.4470588, 1, 1,
0.323724, 0.9151429, 0.4079286, 0, 0.4431373, 1, 1,
0.3260667, -1.285224, 2.674755, 0, 0.4352941, 1, 1,
0.3268985, 1.360702, -0.9647055, 0, 0.4313726, 1, 1,
0.3334778, 0.2164446, 1.355652, 0, 0.4235294, 1, 1,
0.337435, -0.04016929, 1.908791, 0, 0.4196078, 1, 1,
0.3378619, -2.219891, 3.104936, 0, 0.4117647, 1, 1,
0.3380241, 1.212007, 0.4595198, 0, 0.4078431, 1, 1,
0.3384434, 1.941928, -0.8532335, 0, 0.4, 1, 1,
0.3397346, 1.479284, 0.874269, 0, 0.3921569, 1, 1,
0.343277, -1.275264, 3.663229, 0, 0.3882353, 1, 1,
0.3436844, 0.06972581, 1.405945, 0, 0.3803922, 1, 1,
0.3493818, -1.06262, 3.345561, 0, 0.3764706, 1, 1,
0.3499777, 0.9371082, -0.9484596, 0, 0.3686275, 1, 1,
0.3514712, -1.187944, 1.078248, 0, 0.3647059, 1, 1,
0.3544876, 2.152493, 0.5406525, 0, 0.3568628, 1, 1,
0.3546517, 1.29125, 0.9511432, 0, 0.3529412, 1, 1,
0.3596792, -0.5795532, 2.112832, 0, 0.345098, 1, 1,
0.3603953, -1.357116, 1.533797, 0, 0.3411765, 1, 1,
0.3631692, 0.2583798, 0.998777, 0, 0.3333333, 1, 1,
0.3659336, -0.7071182, 3.164408, 0, 0.3294118, 1, 1,
0.36721, -0.6424795, 0.7534292, 0, 0.3215686, 1, 1,
0.3679549, -0.6971647, 3.213668, 0, 0.3176471, 1, 1,
0.3681116, -1.163111, 3.355111, 0, 0.3098039, 1, 1,
0.369926, 1.040653, -1.662621, 0, 0.3058824, 1, 1,
0.3716893, 0.6075474, 1.86747, 0, 0.2980392, 1, 1,
0.3723783, -0.6221557, 1.948725, 0, 0.2901961, 1, 1,
0.3758624, -0.4024032, 2.043584, 0, 0.2862745, 1, 1,
0.3767426, -0.02292344, 0.3205345, 0, 0.2784314, 1, 1,
0.3788812, -1.536113, 1.701721, 0, 0.2745098, 1, 1,
0.3796041, -0.7164983, 1.540753, 0, 0.2666667, 1, 1,
0.3811701, -0.4867424, 1.591691, 0, 0.2627451, 1, 1,
0.3853642, 0.01548138, 2.016286, 0, 0.254902, 1, 1,
0.3862113, -0.6228544, 1.386588, 0, 0.2509804, 1, 1,
0.3871327, -0.5734253, 3.525832, 0, 0.2431373, 1, 1,
0.3879672, 1.229097, -0.8139009, 0, 0.2392157, 1, 1,
0.390215, 0.4115409, 1.041247, 0, 0.2313726, 1, 1,
0.3916332, -0.8132694, 1.553301, 0, 0.227451, 1, 1,
0.3917456, -0.986172, 1.411236, 0, 0.2196078, 1, 1,
0.3922456, 1.398987, 0.812922, 0, 0.2156863, 1, 1,
0.395182, 1.63535, 2.028158, 0, 0.2078431, 1, 1,
0.3974169, -1.181195, 4.035966, 0, 0.2039216, 1, 1,
0.3997876, -0.8499113, 1.657552, 0, 0.1960784, 1, 1,
0.4005305, 1.914651, 0.8910534, 0, 0.1882353, 1, 1,
0.401867, 2.060894, 0.5415238, 0, 0.1843137, 1, 1,
0.4061187, -0.452678, 2.822776, 0, 0.1764706, 1, 1,
0.4065703, 0.4058766, 0.6022187, 0, 0.172549, 1, 1,
0.4124242, 1.420506, -0.05481218, 0, 0.1647059, 1, 1,
0.4127056, -1.287698, 3.461233, 0, 0.1607843, 1, 1,
0.4128126, -2.449403, 1.194058, 0, 0.1529412, 1, 1,
0.414044, 0.964886, 0.676017, 0, 0.1490196, 1, 1,
0.4150333, 0.6438468, 0.7881485, 0, 0.1411765, 1, 1,
0.4175159, -0.1243402, 2.382228, 0, 0.1372549, 1, 1,
0.4190229, 1.661214, -0.2472304, 0, 0.1294118, 1, 1,
0.4202333, 0.9806986, -0.5724834, 0, 0.1254902, 1, 1,
0.4225328, 0.39001, 0.06014903, 0, 0.1176471, 1, 1,
0.4238451, -1.233702, 2.124515, 0, 0.1137255, 1, 1,
0.4507759, 1.418759, -0.4747274, 0, 0.1058824, 1, 1,
0.4533005, -1.254803, 2.591144, 0, 0.09803922, 1, 1,
0.4545952, 0.3469, -0.2817782, 0, 0.09411765, 1, 1,
0.4577663, -1.754294, 2.537929, 0, 0.08627451, 1, 1,
0.4578542, 1.108364, 1.158351, 0, 0.08235294, 1, 1,
0.457892, 0.979122, -0.3733968, 0, 0.07450981, 1, 1,
0.4590026, -0.918965, 2.8473, 0, 0.07058824, 1, 1,
0.4604987, 1.019977, 0.3928244, 0, 0.0627451, 1, 1,
0.462595, -0.07345635, 1.554365, 0, 0.05882353, 1, 1,
0.4631412, -0.3060038, 2.042759, 0, 0.05098039, 1, 1,
0.4632726, -0.3944885, 1.840622, 0, 0.04705882, 1, 1,
0.4657078, 1.679499, 0.8924475, 0, 0.03921569, 1, 1,
0.4673988, -0.104449, 2.325187, 0, 0.03529412, 1, 1,
0.4687552, -0.6503659, 2.331896, 0, 0.02745098, 1, 1,
0.4835143, -0.7650689, 0.4290972, 0, 0.02352941, 1, 1,
0.4882567, -0.9004672, 1.681272, 0, 0.01568628, 1, 1,
0.4895614, -0.6027753, 0.3948991, 0, 0.01176471, 1, 1,
0.4914829, -0.7037812, 3.67613, 0, 0.003921569, 1, 1,
0.4999695, -0.2113857, 0.499925, 0.003921569, 0, 1, 1,
0.5010922, 0.3123434, 1.764952, 0.007843138, 0, 1, 1,
0.5057141, -0.9774916, 1.628943, 0.01568628, 0, 1, 1,
0.5060722, 0.6494022, 1.489408, 0.01960784, 0, 1, 1,
0.510335, -0.7521514, 1.63284, 0.02745098, 0, 1, 1,
0.5107767, -1.932077, 3.909889, 0.03137255, 0, 1, 1,
0.5143506, -0.8769429, 3.481728, 0.03921569, 0, 1, 1,
0.5187219, -1.011116, 2.537403, 0.04313726, 0, 1, 1,
0.5246676, -2.104844, 2.208936, 0.05098039, 0, 1, 1,
0.5292936, 0.2976953, 1.595593, 0.05490196, 0, 1, 1,
0.5324239, -0.9383142, 2.099171, 0.0627451, 0, 1, 1,
0.5368013, -1.519642, 3.624823, 0.06666667, 0, 1, 1,
0.5398564, 1.148375, 0.1339162, 0.07450981, 0, 1, 1,
0.5424824, 0.01331596, 0.8558164, 0.07843138, 0, 1, 1,
0.5425898, -1.066621, 1.073153, 0.08627451, 0, 1, 1,
0.5494469, 0.6738087, -0.2710943, 0.09019608, 0, 1, 1,
0.5542046, -1.080631, 2.576689, 0.09803922, 0, 1, 1,
0.5545176, -0.7135838, 3.099424, 0.1058824, 0, 1, 1,
0.5548547, 0.5404105, 1.707368, 0.1098039, 0, 1, 1,
0.5625505, 1.035151, 1.175805, 0.1176471, 0, 1, 1,
0.5633625, 0.4634134, 1.410274, 0.1215686, 0, 1, 1,
0.5636073, -0.4768582, 2.23588, 0.1294118, 0, 1, 1,
0.5660965, -1.076719, 3.329097, 0.1333333, 0, 1, 1,
0.5690272, -0.3013172, 3.241112, 0.1411765, 0, 1, 1,
0.5699799, -1.572755, 3.82781, 0.145098, 0, 1, 1,
0.5711145, 0.9177126, 1.943503, 0.1529412, 0, 1, 1,
0.57173, -0.6647217, 1.62206, 0.1568628, 0, 1, 1,
0.572921, -1.153814, 2.081251, 0.1647059, 0, 1, 1,
0.5778756, -0.6137233, 3.017252, 0.1686275, 0, 1, 1,
0.5811327, 0.6711837, 0.1515752, 0.1764706, 0, 1, 1,
0.5845124, 0.3915803, 2.675364, 0.1803922, 0, 1, 1,
0.5877126, -0.7672865, 1.458672, 0.1882353, 0, 1, 1,
0.5879743, -0.03225883, 2.736781, 0.1921569, 0, 1, 1,
0.5962758, 0.1343991, 1.971694, 0.2, 0, 1, 1,
0.5964336, -1.173856, 1.307081, 0.2078431, 0, 1, 1,
0.5972264, 0.09229367, 1.671053, 0.2117647, 0, 1, 1,
0.5973509, -2.161762, 3.584884, 0.2196078, 0, 1, 1,
0.6078717, -0.4552307, 1.503253, 0.2235294, 0, 1, 1,
0.6086735, -0.8579682, 0.176957, 0.2313726, 0, 1, 1,
0.6118588, -1.766106, 4.456229, 0.2352941, 0, 1, 1,
0.6169506, 0.4841703, 0.7084686, 0.2431373, 0, 1, 1,
0.6206085, 0.2389931, 1.468135, 0.2470588, 0, 1, 1,
0.6213672, 0.0149376, 0.5989225, 0.254902, 0, 1, 1,
0.6217611, -0.1440362, 2.156701, 0.2588235, 0, 1, 1,
0.6248279, 1.243432, 0.7583152, 0.2666667, 0, 1, 1,
0.6300775, 0.2562891, 0.5930473, 0.2705882, 0, 1, 1,
0.6312957, -1.771874, 2.742324, 0.2784314, 0, 1, 1,
0.632258, 0.4963757, 0.02323513, 0.282353, 0, 1, 1,
0.6328092, 1.536912, -0.2119744, 0.2901961, 0, 1, 1,
0.6445974, 0.9941983, 0.4668024, 0.2941177, 0, 1, 1,
0.6451277, -0.2096178, 2.10113, 0.3019608, 0, 1, 1,
0.6453179, -1.57542, 2.650495, 0.3098039, 0, 1, 1,
0.6462634, -1.91553, 1.883569, 0.3137255, 0, 1, 1,
0.6476194, -0.2905942, 3.052088, 0.3215686, 0, 1, 1,
0.648452, 1.227566, -0.4909761, 0.3254902, 0, 1, 1,
0.6495373, 0.8575615, 3.48824, 0.3333333, 0, 1, 1,
0.6496795, 1.033468, 1.737076, 0.3372549, 0, 1, 1,
0.6503389, 1.068715, 0.451289, 0.345098, 0, 1, 1,
0.6510956, 1.820209, -0.7036747, 0.3490196, 0, 1, 1,
0.6545789, 1.545825, 1.16206, 0.3568628, 0, 1, 1,
0.6571853, -0.2910991, 1.203892, 0.3607843, 0, 1, 1,
0.6580998, -1.014549, 1.024208, 0.3686275, 0, 1, 1,
0.665959, 0.7750973, -0.2430436, 0.372549, 0, 1, 1,
0.6692768, 0.6928766, 0.538496, 0.3803922, 0, 1, 1,
0.6703379, 0.6152535, 2.148181, 0.3843137, 0, 1, 1,
0.6704318, 0.6832429, 0.9774308, 0.3921569, 0, 1, 1,
0.6704753, -1.10087, 2.867832, 0.3960784, 0, 1, 1,
0.6716874, -0.3837945, 0.1584815, 0.4039216, 0, 1, 1,
0.6725688, 1.899275, 0.8391424, 0.4117647, 0, 1, 1,
0.6787061, -0.4795733, 0.9548786, 0.4156863, 0, 1, 1,
0.6787803, -0.4601167, 3.429521, 0.4235294, 0, 1, 1,
0.6788074, -0.2150613, 2.349371, 0.427451, 0, 1, 1,
0.6800732, 1.879367, -0.0852853, 0.4352941, 0, 1, 1,
0.6849849, -1.043719, 0.6872312, 0.4392157, 0, 1, 1,
0.685486, -0.005614607, 0.6387853, 0.4470588, 0, 1, 1,
0.6957548, -0.5025216, 1.244845, 0.4509804, 0, 1, 1,
0.696309, -0.4045922, 1.374191, 0.4588235, 0, 1, 1,
0.7002817, 1.409137, 0.1124757, 0.4627451, 0, 1, 1,
0.7065346, 1.270236, -0.08668365, 0.4705882, 0, 1, 1,
0.7068743, -2.203976, 2.462401, 0.4745098, 0, 1, 1,
0.711474, -0.7262502, 2.203897, 0.4823529, 0, 1, 1,
0.7150523, -0.7083562, 1.182129, 0.4862745, 0, 1, 1,
0.7154042, 1.412687, 1.916047, 0.4941176, 0, 1, 1,
0.7189695, -0.1077302, 0.3767731, 0.5019608, 0, 1, 1,
0.720032, -1.865391, 2.683372, 0.5058824, 0, 1, 1,
0.720224, -0.2209308, 1.259617, 0.5137255, 0, 1, 1,
0.7237643, 0.977371, 0.3755152, 0.5176471, 0, 1, 1,
0.7265837, 0.3357293, 1.088704, 0.5254902, 0, 1, 1,
0.7318714, 0.02258752, 1.49266, 0.5294118, 0, 1, 1,
0.7340484, 1.054168, -0.7362663, 0.5372549, 0, 1, 1,
0.734372, -0.09095169, 2.094478, 0.5411765, 0, 1, 1,
0.7350447, -0.3276594, 1.518077, 0.5490196, 0, 1, 1,
0.7421398, -1.014081, 3.163211, 0.5529412, 0, 1, 1,
0.7426379, -1.449182, 3.819385, 0.5607843, 0, 1, 1,
0.7454148, -0.1175252, 1.68725, 0.5647059, 0, 1, 1,
0.7476233, -0.5690361, 0.8453817, 0.572549, 0, 1, 1,
0.7491056, -0.874394, 3.56247, 0.5764706, 0, 1, 1,
0.7506478, 1.354771, 0.9057572, 0.5843138, 0, 1, 1,
0.7530747, 0.809438, 2.442684, 0.5882353, 0, 1, 1,
0.7624782, -1.206225, 2.025397, 0.5960785, 0, 1, 1,
0.7635332, 1.284415, 0.3595134, 0.6039216, 0, 1, 1,
0.7690967, -0.9210584, 3.184247, 0.6078432, 0, 1, 1,
0.7696901, -0.1107736, 1.850238, 0.6156863, 0, 1, 1,
0.7708721, -0.4609387, 1.725854, 0.6196079, 0, 1, 1,
0.7721885, 0.4611142, -0.9280804, 0.627451, 0, 1, 1,
0.7763824, -0.5580845, 2.152339, 0.6313726, 0, 1, 1,
0.7788728, 0.8409184, 0.4043022, 0.6392157, 0, 1, 1,
0.7810906, -0.06755985, 1.992404, 0.6431373, 0, 1, 1,
0.7900405, -0.1854624, -0.9460506, 0.6509804, 0, 1, 1,
0.8037832, 0.150901, 3.147961, 0.654902, 0, 1, 1,
0.8041073, 0.7034375, 0.4046305, 0.6627451, 0, 1, 1,
0.8114938, 1.044356, 1.316491, 0.6666667, 0, 1, 1,
0.8128453, -1.730213, 4.973601, 0.6745098, 0, 1, 1,
0.8130317, -0.2303919, 0.04217589, 0.6784314, 0, 1, 1,
0.8152892, 1.57606, 0.9008072, 0.6862745, 0, 1, 1,
0.8223043, -0.1162217, 1.768997, 0.6901961, 0, 1, 1,
0.8257123, 0.491752, 0.5349915, 0.6980392, 0, 1, 1,
0.8289177, -0.2812691, 3.812707, 0.7058824, 0, 1, 1,
0.8294089, -0.3029066, 1.894078, 0.7098039, 0, 1, 1,
0.832845, 2.076138, -0.4797602, 0.7176471, 0, 1, 1,
0.8360397, 1.44882, 0.05013655, 0.7215686, 0, 1, 1,
0.8399747, -0.8200298, 1.599606, 0.7294118, 0, 1, 1,
0.8425639, 0.4969729, 1.684328, 0.7333333, 0, 1, 1,
0.8433591, -0.5769796, 2.714895, 0.7411765, 0, 1, 1,
0.8456217, 0.1061807, 0.5302854, 0.7450981, 0, 1, 1,
0.8492082, 1.565526, 0.3205848, 0.7529412, 0, 1, 1,
0.8502618, 0.657521, 1.263996, 0.7568628, 0, 1, 1,
0.8524985, -1.797273, 2.762988, 0.7647059, 0, 1, 1,
0.8541083, 2.057212, 1.570701, 0.7686275, 0, 1, 1,
0.8557811, -0.9451894, 4.527859, 0.7764706, 0, 1, 1,
0.8637764, -0.4438514, 2.082319, 0.7803922, 0, 1, 1,
0.8648778, -1.571255, 4.060033, 0.7882353, 0, 1, 1,
0.8698125, 1.270381, 0.6828888, 0.7921569, 0, 1, 1,
0.8734301, 1.961321, 0.06531878, 0.8, 0, 1, 1,
0.8741134, -0.656353, 1.238358, 0.8078431, 0, 1, 1,
0.8757243, 0.02374043, 0.8503817, 0.8117647, 0, 1, 1,
0.8768195, -0.1428626, 2.180897, 0.8196079, 0, 1, 1,
0.8817071, 0.4548801, 1.24584, 0.8235294, 0, 1, 1,
0.8823773, -0.3735154, 3.842114, 0.8313726, 0, 1, 1,
0.8954117, 0.1630197, 1.046332, 0.8352941, 0, 1, 1,
0.896966, -0.05359391, 0.2419971, 0.8431373, 0, 1, 1,
0.90364, 0.2230054, 2.480548, 0.8470588, 0, 1, 1,
0.9043634, 0.7627465, 0.4077252, 0.854902, 0, 1, 1,
0.9085121, -1.216844, 1.453654, 0.8588235, 0, 1, 1,
0.9107443, -0.6680219, 2.138318, 0.8666667, 0, 1, 1,
0.9130703, 1.305999, 2.035762, 0.8705882, 0, 1, 1,
0.9168979, -1.441998, 2.228388, 0.8784314, 0, 1, 1,
0.917134, -0.3674561, 2.168644, 0.8823529, 0, 1, 1,
0.9181227, -0.1368232, 2.100725, 0.8901961, 0, 1, 1,
0.9181652, -0.680604, 3.134652, 0.8941177, 0, 1, 1,
0.9229152, -0.2248895, 2.170669, 0.9019608, 0, 1, 1,
0.9239993, 1.707487, -0.05264442, 0.9098039, 0, 1, 1,
0.9412534, 1.480795, 0.6229995, 0.9137255, 0, 1, 1,
0.9453578, 0.8219078, 1.747859, 0.9215686, 0, 1, 1,
0.9473208, -0.5406221, 2.603269, 0.9254902, 0, 1, 1,
0.9516608, 0.1497587, -0.3132356, 0.9333333, 0, 1, 1,
0.9566923, -1.346563, 0.4431551, 0.9372549, 0, 1, 1,
0.958458, -1.591454, 1.647004, 0.945098, 0, 1, 1,
0.9612489, -0.08616269, 0.3681357, 0.9490196, 0, 1, 1,
0.9646387, 0.5323079, 0.9144908, 0.9568627, 0, 1, 1,
0.9683402, -0.02408018, 1.70138, 0.9607843, 0, 1, 1,
0.9704657, -1.309743, 1.516079, 0.9686275, 0, 1, 1,
0.9726005, 0.06959217, 0.5794604, 0.972549, 0, 1, 1,
0.9789238, -0.8937921, 2.574049, 0.9803922, 0, 1, 1,
0.9799793, 0.2889598, 1.479102, 0.9843137, 0, 1, 1,
0.9813569, 0.3919517, 0.3630424, 0.9921569, 0, 1, 1,
0.9882746, 2.571208, 0.6092455, 0.9960784, 0, 1, 1,
0.9884443, 1.4483, 0.9859262, 1, 0, 0.9960784, 1,
0.9899721, -0.4741029, 4.379427, 1, 0, 0.9882353, 1,
0.9906279, -1.070143, 3.921458, 1, 0, 0.9843137, 1,
0.9980814, -1.284667, 2.82172, 1, 0, 0.9764706, 1,
1.008763, 0.3976586, 0.9966851, 1, 0, 0.972549, 1,
1.015784, 2.005738, 0.2759677, 1, 0, 0.9647059, 1,
1.019693, 0.08447299, 1.228586, 1, 0, 0.9607843, 1,
1.024536, 1.394278, 0.6814805, 1, 0, 0.9529412, 1,
1.028562, -0.7274714, 2.671502, 1, 0, 0.9490196, 1,
1.036801, 0.5590456, 1.582232, 1, 0, 0.9411765, 1,
1.042, -1.261992, 2.376726, 1, 0, 0.9372549, 1,
1.042429, -0.8906065, 2.482718, 1, 0, 0.9294118, 1,
1.043282, -0.5559343, 0.2456802, 1, 0, 0.9254902, 1,
1.043351, 0.06946879, 1.610694, 1, 0, 0.9176471, 1,
1.046325, 1.532715, 2.133949, 1, 0, 0.9137255, 1,
1.052273, 1.834844, -1.507295, 1, 0, 0.9058824, 1,
1.052544, 1.43168, -0.2598251, 1, 0, 0.9019608, 1,
1.055278, -0.3920683, 0.3173083, 1, 0, 0.8941177, 1,
1.057533, 0.6947157, 1.511421, 1, 0, 0.8862745, 1,
1.064809, 0.6480975, 0.7281505, 1, 0, 0.8823529, 1,
1.065361, 0.1613525, 0.3053633, 1, 0, 0.8745098, 1,
1.067396, 1.541978, 1.293613, 1, 0, 0.8705882, 1,
1.074483, -0.2133736, 3.137399, 1, 0, 0.8627451, 1,
1.074857, 1.06894, 0.2912039, 1, 0, 0.8588235, 1,
1.082169, 0.4254199, 1.722484, 1, 0, 0.8509804, 1,
1.085085, -1.769711, 2.388136, 1, 0, 0.8470588, 1,
1.085637, 2.731265, -0.7722818, 1, 0, 0.8392157, 1,
1.086287, -0.6637405, 1.918245, 1, 0, 0.8352941, 1,
1.087361, 0.6470692, 1.476895, 1, 0, 0.827451, 1,
1.100122, -0.01584071, 2.43016, 1, 0, 0.8235294, 1,
1.104834, 0.8247849, 0.07948422, 1, 0, 0.8156863, 1,
1.105053, -1.396831, 2.845886, 1, 0, 0.8117647, 1,
1.107763, -0.07121634, 0.5170521, 1, 0, 0.8039216, 1,
1.112502, -0.3357713, 1.565335, 1, 0, 0.7960784, 1,
1.117818, -0.2990842, 1.331664, 1, 0, 0.7921569, 1,
1.119546, 2.33193, 2.066014, 1, 0, 0.7843137, 1,
1.12975, -0.8704641, 0.6046258, 1, 0, 0.7803922, 1,
1.129912, 0.6086025, 0.6645621, 1, 0, 0.772549, 1,
1.138402, -0.1311296, 2.167512, 1, 0, 0.7686275, 1,
1.142467, -0.5853676, 1.674758, 1, 0, 0.7607843, 1,
1.150617, -0.948566, 2.078003, 1, 0, 0.7568628, 1,
1.164518, -1.075413, 2.72578, 1, 0, 0.7490196, 1,
1.164657, 2.28538, -0.450039, 1, 0, 0.7450981, 1,
1.167666, -1.03621, 2.588935, 1, 0, 0.7372549, 1,
1.173104, 0.9706939, 1.760022, 1, 0, 0.7333333, 1,
1.175956, -0.5525878, 3.114987, 1, 0, 0.7254902, 1,
1.182877, 1.368804, -0.8337926, 1, 0, 0.7215686, 1,
1.183158, -0.7561594, 1.432053, 1, 0, 0.7137255, 1,
1.184152, 0.0322596, 2.129799, 1, 0, 0.7098039, 1,
1.184335, 0.5451363, 0.8016557, 1, 0, 0.7019608, 1,
1.186872, 0.5627031, 0.56432, 1, 0, 0.6941177, 1,
1.190956, 1.637651, -0.3526737, 1, 0, 0.6901961, 1,
1.192236, -0.1427414, 2.36117, 1, 0, 0.682353, 1,
1.197247, 1.630828, 0.6422471, 1, 0, 0.6784314, 1,
1.198784, 0.8503526, 0.7388667, 1, 0, 0.6705883, 1,
1.20278, -0.2946404, 1.871338, 1, 0, 0.6666667, 1,
1.212556, 0.7970036, 1.162242, 1, 0, 0.6588235, 1,
1.224269, -1.15539, 0.9796305, 1, 0, 0.654902, 1,
1.226445, -0.6536527, 2.134946, 1, 0, 0.6470588, 1,
1.22788, 0.9483927, 1.1196, 1, 0, 0.6431373, 1,
1.234928, 0.4740428, 3.099252, 1, 0, 0.6352941, 1,
1.24319, -0.4371815, 0.4453372, 1, 0, 0.6313726, 1,
1.250556, -1.948669, 1.428317, 1, 0, 0.6235294, 1,
1.253648, 2.720537, 1.4953, 1, 0, 0.6196079, 1,
1.259883, 0.3223339, 1.182765, 1, 0, 0.6117647, 1,
1.264211, 1.479506, 0.8838375, 1, 0, 0.6078432, 1,
1.266728, 1.355521, 2.221494, 1, 0, 0.6, 1,
1.267288, -0.2761306, 0.9259437, 1, 0, 0.5921569, 1,
1.302757, 0.355395, 1.075119, 1, 0, 0.5882353, 1,
1.30805, 0.692242, 0.2841432, 1, 0, 0.5803922, 1,
1.310019, 0.5773923, 0.8525417, 1, 0, 0.5764706, 1,
1.311872, -1.226374, 3.005917, 1, 0, 0.5686275, 1,
1.314714, -0.2146844, 1.553666, 1, 0, 0.5647059, 1,
1.320431, 1.144298, -0.3866346, 1, 0, 0.5568628, 1,
1.329413, -1.235609, 1.910827, 1, 0, 0.5529412, 1,
1.331777, -0.4209293, 3.7244, 1, 0, 0.5450981, 1,
1.331988, -1.89798, 3.619456, 1, 0, 0.5411765, 1,
1.338148, 0.3696774, 2.177477, 1, 0, 0.5333334, 1,
1.338972, 3.158077, 1.46982, 1, 0, 0.5294118, 1,
1.340431, 1.40636, 0.6987534, 1, 0, 0.5215687, 1,
1.344965, -0.1152072, 0.8658996, 1, 0, 0.5176471, 1,
1.345341, -2.286977, 1.942997, 1, 0, 0.509804, 1,
1.350786, 0.1831549, 1.354143, 1, 0, 0.5058824, 1,
1.352646, 0.6747255, 4.811331, 1, 0, 0.4980392, 1,
1.352669, 0.4240196, 0.3453817, 1, 0, 0.4901961, 1,
1.3547, -0.2551041, 1.761994, 1, 0, 0.4862745, 1,
1.377029, 0.5285196, 1.59346, 1, 0, 0.4784314, 1,
1.393175, 0.3294508, 2.580719, 1, 0, 0.4745098, 1,
1.3934, 0.7361553, -0.7150661, 1, 0, 0.4666667, 1,
1.396726, -0.5562387, 1.711587, 1, 0, 0.4627451, 1,
1.398742, 1.505068, -0.16563, 1, 0, 0.454902, 1,
1.400102, -0.6972595, 1.710053, 1, 0, 0.4509804, 1,
1.400519, -0.08667273, 1.691094, 1, 0, 0.4431373, 1,
1.403938, -0.6520075, 1.590016, 1, 0, 0.4392157, 1,
1.408399, 2.359637, -0.1786209, 1, 0, 0.4313726, 1,
1.427988, 0.1885914, 1.18199, 1, 0, 0.427451, 1,
1.436077, 0.2121359, 2.102875, 1, 0, 0.4196078, 1,
1.454074, 0.8789151, 0.6364747, 1, 0, 0.4156863, 1,
1.465487, -0.4440146, 1.11838, 1, 0, 0.4078431, 1,
1.469161, -0.2367463, 0.09231242, 1, 0, 0.4039216, 1,
1.470378, -0.07640207, 1.311427, 1, 0, 0.3960784, 1,
1.476873, -0.2078214, 1.730889, 1, 0, 0.3882353, 1,
1.478339, -0.2841924, 0.944068, 1, 0, 0.3843137, 1,
1.498567, -0.1913856, 1.603222, 1, 0, 0.3764706, 1,
1.508745, -1.712284, 2.5112, 1, 0, 0.372549, 1,
1.513327, 0.707483, 2.137959, 1, 0, 0.3647059, 1,
1.51617, -0.3707666, 1.82916, 1, 0, 0.3607843, 1,
1.523806, 1.162277, 0.08565544, 1, 0, 0.3529412, 1,
1.527228, -0.5065809, 1.569538, 1, 0, 0.3490196, 1,
1.535497, 1.82605, -0.4239155, 1, 0, 0.3411765, 1,
1.537326, -0.05104836, 1.118084, 1, 0, 0.3372549, 1,
1.537876, 0.8053336, 2.185451, 1, 0, 0.3294118, 1,
1.539348, 0.8967454, 1.089634, 1, 0, 0.3254902, 1,
1.549885, -1.121755, 1.702622, 1, 0, 0.3176471, 1,
1.57747, -0.2093184, 1.444037, 1, 0, 0.3137255, 1,
1.595092, -0.6303444, 1.428037, 1, 0, 0.3058824, 1,
1.615605, 0.4937952, 1.296952, 1, 0, 0.2980392, 1,
1.616614, 1.63875, 1.033635, 1, 0, 0.2941177, 1,
1.617502, 0.6263383, 2.533554, 1, 0, 0.2862745, 1,
1.64156, 0.1391813, 1.507349, 1, 0, 0.282353, 1,
1.662092, 0.2426065, 1.7594, 1, 0, 0.2745098, 1,
1.671777, -0.4434532, 1.954382, 1, 0, 0.2705882, 1,
1.691023, -0.6701779, 1.530627, 1, 0, 0.2627451, 1,
1.706726, 0.2940502, 2.499189, 1, 0, 0.2588235, 1,
1.707608, -0.543602, 1.027376, 1, 0, 0.2509804, 1,
1.742196, -0.02107712, 2.528373, 1, 0, 0.2470588, 1,
1.749975, 0.6205997, -0.1542874, 1, 0, 0.2392157, 1,
1.750588, 1.188325, 2.858166, 1, 0, 0.2352941, 1,
1.754935, 0.4551708, 1.302274, 1, 0, 0.227451, 1,
1.7608, -0.3715886, 1.305729, 1, 0, 0.2235294, 1,
1.783286, -1.383278, 2.241102, 1, 0, 0.2156863, 1,
1.789263, 0.5838475, 1.207364, 1, 0, 0.2117647, 1,
1.811633, -0.62901, 3.23042, 1, 0, 0.2039216, 1,
1.840946, -1.136617, 1.116984, 1, 0, 0.1960784, 1,
1.844432, -0.3484743, 1.289021, 1, 0, 0.1921569, 1,
1.84882, 0.9077618, -0.2930187, 1, 0, 0.1843137, 1,
1.851409, -0.6540112, 2.199938, 1, 0, 0.1803922, 1,
1.858625, 1.485329, 1.404313, 1, 0, 0.172549, 1,
1.880051, -0.2972619, 1.113515, 1, 0, 0.1686275, 1,
1.89935, -0.08147166, 0.6205496, 1, 0, 0.1607843, 1,
1.906882, 1.096511, -0.07124147, 1, 0, 0.1568628, 1,
1.907984, -1.562151, 2.798764, 1, 0, 0.1490196, 1,
1.921428, 0.1278232, 2.061818, 1, 0, 0.145098, 1,
1.991793, 1.235067, 0.6959276, 1, 0, 0.1372549, 1,
2.014526, -0.1436149, 2.305693, 1, 0, 0.1333333, 1,
2.036058, -0.2520345, 0.967191, 1, 0, 0.1254902, 1,
2.036712, 0.4494572, -0.1769546, 1, 0, 0.1215686, 1,
2.082959, -0.5569496, 2.048976, 1, 0, 0.1137255, 1,
2.096746, 1.450317, 0.101287, 1, 0, 0.1098039, 1,
2.100233, 0.8436651, -0.09795532, 1, 0, 0.1019608, 1,
2.101629, 0.02587079, 3.166454, 1, 0, 0.09411765, 1,
2.116194, -1.390107, 1.847806, 1, 0, 0.09019608, 1,
2.213193, -1.26779, 2.244564, 1, 0, 0.08235294, 1,
2.213625, 1.57741, -1.024344, 1, 0, 0.07843138, 1,
2.224286, 0.7634574, 1.520556, 1, 0, 0.07058824, 1,
2.266859, 1.91622, 2.077714, 1, 0, 0.06666667, 1,
2.334142, -0.05506862, 1.991273, 1, 0, 0.05882353, 1,
2.368501, -1.179865, 3.273472, 1, 0, 0.05490196, 1,
2.590523, 0.4357542, 1.588807, 1, 0, 0.04705882, 1,
2.630955, -0.6719607, 2.819574, 1, 0, 0.04313726, 1,
2.696637, 0.5510735, 0.994647, 1, 0, 0.03529412, 1,
2.747416, -1.168947, 0.8388346, 1, 0, 0.03137255, 1,
2.775676, -1.079106, 1.552825, 1, 0, 0.02352941, 1,
2.781434, 1.613113, 0.7927622, 1, 0, 0.01960784, 1,
2.804035, 3.12476, 0.3481721, 1, 0, 0.01176471, 1,
2.899436, -2.691366, 1.580712, 1, 0, 0.007843138, 1
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
-0.2463726, -4.718312, -6.78516, 0, -0.5, 0.5, 0.5,
-0.2463726, -4.718312, -6.78516, 1, -0.5, 0.5, 0.5,
-0.2463726, -4.718312, -6.78516, 1, 1.5, 0.5, 0.5,
-0.2463726, -4.718312, -6.78516, 0, 1.5, 0.5, 0.5
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
-4.45861, -0.1763473, -6.78516, 0, -0.5, 0.5, 0.5,
-4.45861, -0.1763473, -6.78516, 1, -0.5, 0.5, 0.5,
-4.45861, -0.1763473, -6.78516, 1, 1.5, 0.5, 0.5,
-4.45861, -0.1763473, -6.78516, 0, 1.5, 0.5, 0.5
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
-4.45861, -4.718312, -0.05365849, 0, -0.5, 0.5, 0.5,
-4.45861, -4.718312, -0.05365849, 1, -0.5, 0.5, 0.5,
-4.45861, -4.718312, -0.05365849, 1, 1.5, 0.5, 0.5,
-4.45861, -4.718312, -0.05365849, 0, 1.5, 0.5, 0.5
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
-3, -3.670166, -5.231736,
2, -3.670166, -5.231736,
-3, -3.670166, -5.231736,
-3, -3.844857, -5.49064,
-2, -3.670166, -5.231736,
-2, -3.844857, -5.49064,
-1, -3.670166, -5.231736,
-1, -3.844857, -5.49064,
0, -3.670166, -5.231736,
0, -3.844857, -5.49064,
1, -3.670166, -5.231736,
1, -3.844857, -5.49064,
2, -3.670166, -5.231736,
2, -3.844857, -5.49064
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
-3, -4.194239, -6.008448, 0, -0.5, 0.5, 0.5,
-3, -4.194239, -6.008448, 1, -0.5, 0.5, 0.5,
-3, -4.194239, -6.008448, 1, 1.5, 0.5, 0.5,
-3, -4.194239, -6.008448, 0, 1.5, 0.5, 0.5,
-2, -4.194239, -6.008448, 0, -0.5, 0.5, 0.5,
-2, -4.194239, -6.008448, 1, -0.5, 0.5, 0.5,
-2, -4.194239, -6.008448, 1, 1.5, 0.5, 0.5,
-2, -4.194239, -6.008448, 0, 1.5, 0.5, 0.5,
-1, -4.194239, -6.008448, 0, -0.5, 0.5, 0.5,
-1, -4.194239, -6.008448, 1, -0.5, 0.5, 0.5,
-1, -4.194239, -6.008448, 1, 1.5, 0.5, 0.5,
-1, -4.194239, -6.008448, 0, 1.5, 0.5, 0.5,
0, -4.194239, -6.008448, 0, -0.5, 0.5, 0.5,
0, -4.194239, -6.008448, 1, -0.5, 0.5, 0.5,
0, -4.194239, -6.008448, 1, 1.5, 0.5, 0.5,
0, -4.194239, -6.008448, 0, 1.5, 0.5, 0.5,
1, -4.194239, -6.008448, 0, -0.5, 0.5, 0.5,
1, -4.194239, -6.008448, 1, -0.5, 0.5, 0.5,
1, -4.194239, -6.008448, 1, 1.5, 0.5, 0.5,
1, -4.194239, -6.008448, 0, 1.5, 0.5, 0.5,
2, -4.194239, -6.008448, 0, -0.5, 0.5, 0.5,
2, -4.194239, -6.008448, 1, -0.5, 0.5, 0.5,
2, -4.194239, -6.008448, 1, 1.5, 0.5, 0.5,
2, -4.194239, -6.008448, 0, 1.5, 0.5, 0.5
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
-3.486555, -3, -5.231736,
-3.486555, 3, -5.231736,
-3.486555, -3, -5.231736,
-3.648564, -3, -5.49064,
-3.486555, -2, -5.231736,
-3.648564, -2, -5.49064,
-3.486555, -1, -5.231736,
-3.648564, -1, -5.49064,
-3.486555, 0, -5.231736,
-3.648564, 0, -5.49064,
-3.486555, 1, -5.231736,
-3.648564, 1, -5.49064,
-3.486555, 2, -5.231736,
-3.648564, 2, -5.49064,
-3.486555, 3, -5.231736,
-3.648564, 3, -5.49064
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
-3.972582, -3, -6.008448, 0, -0.5, 0.5, 0.5,
-3.972582, -3, -6.008448, 1, -0.5, 0.5, 0.5,
-3.972582, -3, -6.008448, 1, 1.5, 0.5, 0.5,
-3.972582, -3, -6.008448, 0, 1.5, 0.5, 0.5,
-3.972582, -2, -6.008448, 0, -0.5, 0.5, 0.5,
-3.972582, -2, -6.008448, 1, -0.5, 0.5, 0.5,
-3.972582, -2, -6.008448, 1, 1.5, 0.5, 0.5,
-3.972582, -2, -6.008448, 0, 1.5, 0.5, 0.5,
-3.972582, -1, -6.008448, 0, -0.5, 0.5, 0.5,
-3.972582, -1, -6.008448, 1, -0.5, 0.5, 0.5,
-3.972582, -1, -6.008448, 1, 1.5, 0.5, 0.5,
-3.972582, -1, -6.008448, 0, 1.5, 0.5, 0.5,
-3.972582, 0, -6.008448, 0, -0.5, 0.5, 0.5,
-3.972582, 0, -6.008448, 1, -0.5, 0.5, 0.5,
-3.972582, 0, -6.008448, 1, 1.5, 0.5, 0.5,
-3.972582, 0, -6.008448, 0, 1.5, 0.5, 0.5,
-3.972582, 1, -6.008448, 0, -0.5, 0.5, 0.5,
-3.972582, 1, -6.008448, 1, -0.5, 0.5, 0.5,
-3.972582, 1, -6.008448, 1, 1.5, 0.5, 0.5,
-3.972582, 1, -6.008448, 0, 1.5, 0.5, 0.5,
-3.972582, 2, -6.008448, 0, -0.5, 0.5, 0.5,
-3.972582, 2, -6.008448, 1, -0.5, 0.5, 0.5,
-3.972582, 2, -6.008448, 1, 1.5, 0.5, 0.5,
-3.972582, 2, -6.008448, 0, 1.5, 0.5, 0.5,
-3.972582, 3, -6.008448, 0, -0.5, 0.5, 0.5,
-3.972582, 3, -6.008448, 1, -0.5, 0.5, 0.5,
-3.972582, 3, -6.008448, 1, 1.5, 0.5, 0.5,
-3.972582, 3, -6.008448, 0, 1.5, 0.5, 0.5
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
-3.486555, -3.670166, -4,
-3.486555, -3.670166, 4,
-3.486555, -3.670166, -4,
-3.648564, -3.844857, -4,
-3.486555, -3.670166, -2,
-3.648564, -3.844857, -2,
-3.486555, -3.670166, 0,
-3.648564, -3.844857, 0,
-3.486555, -3.670166, 2,
-3.648564, -3.844857, 2,
-3.486555, -3.670166, 4,
-3.648564, -3.844857, 4
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
-3.972582, -4.194239, -4, 0, -0.5, 0.5, 0.5,
-3.972582, -4.194239, -4, 1, -0.5, 0.5, 0.5,
-3.972582, -4.194239, -4, 1, 1.5, 0.5, 0.5,
-3.972582, -4.194239, -4, 0, 1.5, 0.5, 0.5,
-3.972582, -4.194239, -2, 0, -0.5, 0.5, 0.5,
-3.972582, -4.194239, -2, 1, -0.5, 0.5, 0.5,
-3.972582, -4.194239, -2, 1, 1.5, 0.5, 0.5,
-3.972582, -4.194239, -2, 0, 1.5, 0.5, 0.5,
-3.972582, -4.194239, 0, 0, -0.5, 0.5, 0.5,
-3.972582, -4.194239, 0, 1, -0.5, 0.5, 0.5,
-3.972582, -4.194239, 0, 1, 1.5, 0.5, 0.5,
-3.972582, -4.194239, 0, 0, 1.5, 0.5, 0.5,
-3.972582, -4.194239, 2, 0, -0.5, 0.5, 0.5,
-3.972582, -4.194239, 2, 1, -0.5, 0.5, 0.5,
-3.972582, -4.194239, 2, 1, 1.5, 0.5, 0.5,
-3.972582, -4.194239, 2, 0, 1.5, 0.5, 0.5,
-3.972582, -4.194239, 4, 0, -0.5, 0.5, 0.5,
-3.972582, -4.194239, 4, 1, -0.5, 0.5, 0.5,
-3.972582, -4.194239, 4, 1, 1.5, 0.5, 0.5,
-3.972582, -4.194239, 4, 0, 1.5, 0.5, 0.5
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
-3.486555, -3.670166, -5.231736,
-3.486555, 3.317472, -5.231736,
-3.486555, -3.670166, 5.124419,
-3.486555, 3.317472, 5.124419,
-3.486555, -3.670166, -5.231736,
-3.486555, -3.670166, 5.124419,
-3.486555, 3.317472, -5.231736,
-3.486555, 3.317472, 5.124419,
-3.486555, -3.670166, -5.231736,
2.99381, -3.670166, -5.231736,
-3.486555, -3.670166, 5.124419,
2.99381, -3.670166, 5.124419,
-3.486555, 3.317472, -5.231736,
2.99381, 3.317472, -5.231736,
-3.486555, 3.317472, 5.124419,
2.99381, 3.317472, 5.124419,
2.99381, -3.670166, -5.231736,
2.99381, 3.317472, -5.231736,
2.99381, -3.670166, 5.124419,
2.99381, 3.317472, 5.124419,
2.99381, -3.670166, -5.231736,
2.99381, -3.670166, 5.124419,
2.99381, 3.317472, -5.231736,
2.99381, 3.317472, 5.124419
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
var radius = 7.515142;
var distance = 33.43571;
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
mvMatrix.translate( 0.2463726, 0.1763473, 0.05365849 );
mvMatrix.scale( 1.253868, 1.162842, 0.7846076 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.43571);
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
Bensulide<-read.table("Bensulide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Bensulide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Bensulide' not found
```

```r
y<-Bensulide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Bensulide' not found
```

```r
z<-Bensulide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Bensulide' not found
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
-3.392181, 1.269356, 0.01915625, 0, 0, 1, 1, 1,
-3.222568, -1.7817, -2.93872, 1, 0, 0, 1, 1,
-2.895771, -1.587871, -2.302353, 1, 0, 0, 1, 1,
-2.822935, 0.1111435, -1.69789, 1, 0, 0, 1, 1,
-2.656897, -0.3658009, -0.8396657, 1, 0, 0, 1, 1,
-2.639491, -1.011456, -0.9838683, 1, 0, 0, 1, 1,
-2.613782, 0.2322874, -0.8689576, 0, 0, 0, 1, 1,
-2.601723, -0.8342056, -2.154405, 0, 0, 0, 1, 1,
-2.601427, 0.1929614, -1.2812, 0, 0, 0, 1, 1,
-2.572225, -2.484314, -3.153467, 0, 0, 0, 1, 1,
-2.533518, -0.3899362, -2.908504, 0, 0, 0, 1, 1,
-2.472453, 1.561378, 0.1420006, 0, 0, 0, 1, 1,
-2.454868, 0.5626625, -0.6618696, 0, 0, 0, 1, 1,
-2.38962, 0.4221335, -1.896638, 1, 1, 1, 1, 1,
-2.300821, -0.3412786, -0.4931446, 1, 1, 1, 1, 1,
-2.300411, 1.824408, -1.268069, 1, 1, 1, 1, 1,
-2.264506, 1.194826, -0.06826521, 1, 1, 1, 1, 1,
-2.233392, -1.854942, -1.044592, 1, 1, 1, 1, 1,
-2.179497, -0.0310257, -1.7086, 1, 1, 1, 1, 1,
-2.175325, -0.6395081, -2.641407, 1, 1, 1, 1, 1,
-2.171489, 0.9812887, -0.3793096, 1, 1, 1, 1, 1,
-2.16621, 0.6294913, -1.197287, 1, 1, 1, 1, 1,
-2.16365, 0.5240231, -2.007121, 1, 1, 1, 1, 1,
-2.140227, 0.4645841, -2.176017, 1, 1, 1, 1, 1,
-2.106754, 0.2121252, -1.301759, 1, 1, 1, 1, 1,
-2.105374, 0.5799472, -1.289791, 1, 1, 1, 1, 1,
-2.094629, -0.2080117, -2.811787, 1, 1, 1, 1, 1,
-2.087973, 0.05610061, -3.226863, 1, 1, 1, 1, 1,
-2.07261, -2.054868, -1.089382, 0, 0, 1, 1, 1,
-2.016716, 0.3686177, -0.8435672, 1, 0, 0, 1, 1,
-1.997325, 1.852102, -2.522099, 1, 0, 0, 1, 1,
-1.993037, -0.8779119, -2.844698, 1, 0, 0, 1, 1,
-1.973248, 0.6411385, 0.1600541, 1, 0, 0, 1, 1,
-1.966555, 0.07996102, -1.235712, 1, 0, 0, 1, 1,
-1.964965, 0.9245465, -0.5654256, 0, 0, 0, 1, 1,
-1.952848, 0.4835375, -2.690895, 0, 0, 0, 1, 1,
-1.922953, 1.667464, -2.007345, 0, 0, 0, 1, 1,
-1.922885, -1.02566, -3.701664, 0, 0, 0, 1, 1,
-1.908431, -1.708529, -2.477795, 0, 0, 0, 1, 1,
-1.904842, -0.576933, -3.202479, 0, 0, 0, 1, 1,
-1.897667, 1.190763, -2.07582, 0, 0, 0, 1, 1,
-1.890202, -1.582953, -2.321364, 1, 1, 1, 1, 1,
-1.884794, 0.6134755, -1.166858, 1, 1, 1, 1, 1,
-1.863441, 0.2644425, -1.727662, 1, 1, 1, 1, 1,
-1.851129, 1.241838, -2.282015, 1, 1, 1, 1, 1,
-1.798977, 0.9893846, -0.7871017, 1, 1, 1, 1, 1,
-1.794518, -1.169929, -2.425459, 1, 1, 1, 1, 1,
-1.793336, 0.4658335, -1.00858, 1, 1, 1, 1, 1,
-1.787734, -0.4131534, -3.844239, 1, 1, 1, 1, 1,
-1.786732, 0.9200529, -2.364051, 1, 1, 1, 1, 1,
-1.7657, 2.597378, -0.6141117, 1, 1, 1, 1, 1,
-1.72947, -1.451877, -3.034672, 1, 1, 1, 1, 1,
-1.725204, -0.9594733, -1.327738, 1, 1, 1, 1, 1,
-1.723384, -1.153781, -4.331848, 1, 1, 1, 1, 1,
-1.720429, 2.57411, 0.6677088, 1, 1, 1, 1, 1,
-1.715755, -1.811173, -3.904747, 1, 1, 1, 1, 1,
-1.714922, -0.1189844, -1.03088, 0, 0, 1, 1, 1,
-1.713529, -1.456856, -0.5565508, 1, 0, 0, 1, 1,
-1.713462, 0.1289341, -1.337259, 1, 0, 0, 1, 1,
-1.70724, -0.004244138, -1.525229, 1, 0, 0, 1, 1,
-1.699901, -0.0250362, -1.916869, 1, 0, 0, 1, 1,
-1.671996, -0.4231636, -1.739035, 1, 0, 0, 1, 1,
-1.671126, -0.4314287, -1.882028, 0, 0, 0, 1, 1,
-1.638605, 2.23661, 0.870754, 0, 0, 0, 1, 1,
-1.626702, -0.5119327, -0.3357692, 0, 0, 0, 1, 1,
-1.624319, -0.1139481, -1.874606, 0, 0, 0, 1, 1,
-1.615347, 0.5948415, -1.01136, 0, 0, 0, 1, 1,
-1.601864, 0.3691272, -1.459835, 0, 0, 0, 1, 1,
-1.590558, 0.04310621, -3.496031, 0, 0, 0, 1, 1,
-1.587601, 1.784987, -0.3932868, 1, 1, 1, 1, 1,
-1.565725, -0.1502282, -0.641085, 1, 1, 1, 1, 1,
-1.556244, 0.01146002, -3.009858, 1, 1, 1, 1, 1,
-1.553851, 0.3209701, -1.115053, 1, 1, 1, 1, 1,
-1.549509, 1.161425, -1.049313, 1, 1, 1, 1, 1,
-1.542328, -0.6800858, -1.344419, 1, 1, 1, 1, 1,
-1.539475, -0.9145852, -0.5237102, 1, 1, 1, 1, 1,
-1.531779, -0.4341523, -1.304005, 1, 1, 1, 1, 1,
-1.517595, 1.961619, 0.7322562, 1, 1, 1, 1, 1,
-1.516834, 0.04718652, 0.2056881, 1, 1, 1, 1, 1,
-1.505952, -0.2912133, -2.660752, 1, 1, 1, 1, 1,
-1.481007, 0.6137583, -0.9475432, 1, 1, 1, 1, 1,
-1.478014, -0.4958086, -0.8823245, 1, 1, 1, 1, 1,
-1.46164, 0.5178443, -3.927135, 1, 1, 1, 1, 1,
-1.454963, 0.7089944, 0.3820693, 1, 1, 1, 1, 1,
-1.452263, -1.213036, -3.114301, 0, 0, 1, 1, 1,
-1.439707, -1.036103, -3.668049, 1, 0, 0, 1, 1,
-1.431424, -3.087273, -2.646542, 1, 0, 0, 1, 1,
-1.431323, -0.1938459, -2.886964, 1, 0, 0, 1, 1,
-1.423518, 1.72265, -0.4798699, 1, 0, 0, 1, 1,
-1.420067, 0.9185451, -2.513991, 1, 0, 0, 1, 1,
-1.41428, -1.478057, -3.223592, 0, 0, 0, 1, 1,
-1.395908, -0.5472048, -3.510871, 0, 0, 0, 1, 1,
-1.394349, 0.5011082, -1.519893, 0, 0, 0, 1, 1,
-1.390618, -0.2616147, -1.898028, 0, 0, 0, 1, 1,
-1.386554, -1.829887, -3.015045, 0, 0, 0, 1, 1,
-1.381968, 0.9351895, -0.6136968, 0, 0, 0, 1, 1,
-1.380138, 0.2779979, -2.453089, 0, 0, 0, 1, 1,
-1.379786, -0.5843899, -2.45266, 1, 1, 1, 1, 1,
-1.369308, 1.044418, -0.6774884, 1, 1, 1, 1, 1,
-1.364165, -0.3151603, -2.352989, 1, 1, 1, 1, 1,
-1.353201, 0.07278065, -1.737826, 1, 1, 1, 1, 1,
-1.343401, 0.3906987, -3.092532, 1, 1, 1, 1, 1,
-1.343037, -0.5099495, -2.07418, 1, 1, 1, 1, 1,
-1.338723, 0.1569346, -1.769139, 1, 1, 1, 1, 1,
-1.332007, -2.422785, -2.291455, 1, 1, 1, 1, 1,
-1.329882, -0.6857626, -1.330952, 1, 1, 1, 1, 1,
-1.32425, -0.4530016, -2.581854, 1, 1, 1, 1, 1,
-1.319172, -1.464544, -3.348917, 1, 1, 1, 1, 1,
-1.313022, 3.121568, -1.067694, 1, 1, 1, 1, 1,
-1.307091, -1.398876, -2.906539, 1, 1, 1, 1, 1,
-1.304955, -2.282092, -2.717379, 1, 1, 1, 1, 1,
-1.296005, 1.002756, -1.577222, 1, 1, 1, 1, 1,
-1.293313, -1.268183, -2.69136, 0, 0, 1, 1, 1,
-1.289426, -1.228921, -2.362007, 1, 0, 0, 1, 1,
-1.276865, -0.7049307, -1.385136, 1, 0, 0, 1, 1,
-1.271701, -0.2754086, -1.885052, 1, 0, 0, 1, 1,
-1.257839, -0.6192789, -3.892832, 1, 0, 0, 1, 1,
-1.242828, -0.3448021, -2.050008, 1, 0, 0, 1, 1,
-1.23622, -0.7642158, -2.388835, 0, 0, 0, 1, 1,
-1.233062, 0.2033284, -1.449661, 0, 0, 0, 1, 1,
-1.230749, 0.6094111, -0.4235851, 0, 0, 0, 1, 1,
-1.220241, -0.9579715, -1.551843, 0, 0, 0, 1, 1,
-1.21912, -2.002191, -1.346468, 0, 0, 0, 1, 1,
-1.21731, 0.09501914, -1.909758, 0, 0, 0, 1, 1,
-1.214295, -0.5834647, -1.699483, 0, 0, 0, 1, 1,
-1.207408, 0.5231765, -1.500628, 1, 1, 1, 1, 1,
-1.201036, -0.4628585, -1.331613, 1, 1, 1, 1, 1,
-1.185989, -1.677046, -1.76529, 1, 1, 1, 1, 1,
-1.170095, 0.9545431, -0.1610402, 1, 1, 1, 1, 1,
-1.164231, -0.4520102, 0.1505613, 1, 1, 1, 1, 1,
-1.161559, -0.6272016, -4.050742, 1, 1, 1, 1, 1,
-1.161257, 0.05316097, -1.806556, 1, 1, 1, 1, 1,
-1.153662, 0.4692672, -0.9279111, 1, 1, 1, 1, 1,
-1.143561, 0.9154309, -0.7167941, 1, 1, 1, 1, 1,
-1.14256, -1.241087, -1.364579, 1, 1, 1, 1, 1,
-1.140507, 0.9113446, -0.9770741, 1, 1, 1, 1, 1,
-1.135313, 0.4089216, -3.287173, 1, 1, 1, 1, 1,
-1.13366, -0.1264615, -0.2129342, 1, 1, 1, 1, 1,
-1.126896, -0.01520311, -2.836156, 1, 1, 1, 1, 1,
-1.124311, 0.03370453, -3.416312, 1, 1, 1, 1, 1,
-1.122593, 0.2749629, -1.63728, 0, 0, 1, 1, 1,
-1.121077, 0.5625519, -0.6657454, 1, 0, 0, 1, 1,
-1.114557, 0.1683384, -0.6725643, 1, 0, 0, 1, 1,
-1.113997, 0.4648964, -0.5642583, 1, 0, 0, 1, 1,
-1.096361, -0.7292259, -3.222004, 1, 0, 0, 1, 1,
-1.089985, -1.403289, -3.35428, 1, 0, 0, 1, 1,
-1.086515, -1.347848, -2.620931, 0, 0, 0, 1, 1,
-1.084058, -0.03616063, -2.660119, 0, 0, 0, 1, 1,
-1.073315, -1.542359, -2.699641, 0, 0, 0, 1, 1,
-1.071347, 0.3283566, -0.6740191, 0, 0, 0, 1, 1,
-1.070064, -0.6883392, -1.920994, 0, 0, 0, 1, 1,
-1.068745, 0.1232039, -1.453182, 0, 0, 0, 1, 1,
-1.066834, -0.7879028, -2.232665, 0, 0, 0, 1, 1,
-1.057286, -0.3664369, -2.877681, 1, 1, 1, 1, 1,
-1.054382, -0.6660122, -2.678524, 1, 1, 1, 1, 1,
-1.0522, 2.046061, 2.972553, 1, 1, 1, 1, 1,
-1.045682, 0.7624279, 0.2763112, 1, 1, 1, 1, 1,
-1.045593, -0.6530614, -3.546574, 1, 1, 1, 1, 1,
-1.044043, 0.4846764, -1.315511, 1, 1, 1, 1, 1,
-1.038302, -0.333362, -0.2001984, 1, 1, 1, 1, 1,
-1.016885, 0.07419966, -2.766843, 1, 1, 1, 1, 1,
-1.014953, -0.8771273, -1.998134, 1, 1, 1, 1, 1,
-1.011958, -0.2750877, -3.186172, 1, 1, 1, 1, 1,
-1.008401, 0.4266458, -3.941639, 1, 1, 1, 1, 1,
-1.005961, -0.8698117, -2.978423, 1, 1, 1, 1, 1,
-1.003255, -0.2528912, -2.703491, 1, 1, 1, 1, 1,
-1.002788, 0.54585, -1.524103, 1, 1, 1, 1, 1,
-0.9950055, -1.774683, -3.093903, 1, 1, 1, 1, 1,
-0.9928805, -2.812397, -2.698715, 0, 0, 1, 1, 1,
-0.9916044, -1.371646, -3.496244, 1, 0, 0, 1, 1,
-0.9882438, -0.7806265, -0.4271477, 1, 0, 0, 1, 1,
-0.9862615, -1.608576, -3.144114, 1, 0, 0, 1, 1,
-0.9771945, -0.3544482, -3.327215, 1, 0, 0, 1, 1,
-0.9760878, -0.09739298, -2.061069, 1, 0, 0, 1, 1,
-0.9691978, 1.202172, -0.7389336, 0, 0, 0, 1, 1,
-0.9685597, 0.6863538, -0.9940586, 0, 0, 0, 1, 1,
-0.9672318, 0.671073, -0.1946088, 0, 0, 0, 1, 1,
-0.9610153, 1.279284, -3.41794, 0, 0, 0, 1, 1,
-0.9594383, 0.2410423, 0.294234, 0, 0, 0, 1, 1,
-0.958621, 0.3556205, -0.04589619, 0, 0, 0, 1, 1,
-0.95418, -0.8855085, -2.869087, 0, 0, 0, 1, 1,
-0.9483954, -0.3527442, -1.727176, 1, 1, 1, 1, 1,
-0.946094, -0.1397735, -2.311768, 1, 1, 1, 1, 1,
-0.9438607, -0.2181412, -1.596948, 1, 1, 1, 1, 1,
-0.9250214, -0.09796339, -1.630401, 1, 1, 1, 1, 1,
-0.9217806, 1.566564, -1.887695, 1, 1, 1, 1, 1,
-0.9150482, 0.1651106, -1.089091, 1, 1, 1, 1, 1,
-0.9050635, -0.4445993, -3.355474, 1, 1, 1, 1, 1,
-0.9037398, 1.43179, 0.7617254, 1, 1, 1, 1, 1,
-0.887678, 0.02249715, -2.397842, 1, 1, 1, 1, 1,
-0.8871139, -0.5347276, -1.026735, 1, 1, 1, 1, 1,
-0.8646125, 2.099412, 0.2675144, 1, 1, 1, 1, 1,
-0.8600591, 0.5082148, -0.7907693, 1, 1, 1, 1, 1,
-0.8588584, -3.474432, -0.9467315, 1, 1, 1, 1, 1,
-0.8498625, -0.100567, -1.769463, 1, 1, 1, 1, 1,
-0.8395543, 0.4545038, -0.8418695, 1, 1, 1, 1, 1,
-0.8371229, 0.2749279, -0.9701455, 0, 0, 1, 1, 1,
-0.8345142, -0.09642427, -4.375591, 1, 0, 0, 1, 1,
-0.8290356, -0.8400022, -4.647616, 1, 0, 0, 1, 1,
-0.8229404, -0.09105876, -3.603869, 1, 0, 0, 1, 1,
-0.8204871, 0.1890012, -1.986315, 1, 0, 0, 1, 1,
-0.8162113, -1.947539, -3.320941, 1, 0, 0, 1, 1,
-0.8153042, 1.761793, 0.3939921, 0, 0, 0, 1, 1,
-0.8092201, -1.922182, -1.772996, 0, 0, 0, 1, 1,
-0.8078869, -1.019388, -1.962155, 0, 0, 0, 1, 1,
-0.8032541, -1.244682, -4.385839, 0, 0, 0, 1, 1,
-0.8004299, 0.3149595, -1.473964, 0, 0, 0, 1, 1,
-0.7987565, 0.9010003, 0.5230778, 0, 0, 0, 1, 1,
-0.7942547, 0.5731866, 0.33503, 0, 0, 0, 1, 1,
-0.7920117, -0.1629921, -1.649472, 1, 1, 1, 1, 1,
-0.7898047, -0.04641229, -1.704534, 1, 1, 1, 1, 1,
-0.7881066, 0.04853584, -1.139393, 1, 1, 1, 1, 1,
-0.7796022, -1.210446, -1.703201, 1, 1, 1, 1, 1,
-0.7759173, 0.4385042, -1.900357, 1, 1, 1, 1, 1,
-0.7755724, -0.08704015, -1.082028, 1, 1, 1, 1, 1,
-0.7663222, -0.9659086, -1.956087, 1, 1, 1, 1, 1,
-0.7560315, 0.6866118, 0.8352751, 1, 1, 1, 1, 1,
-0.7547079, 0.02307712, -0.4290142, 1, 1, 1, 1, 1,
-0.7519102, -0.07861292, -0.9073224, 1, 1, 1, 1, 1,
-0.75113, -0.2221612, -1.48534, 1, 1, 1, 1, 1,
-0.7499963, -0.5792829, -2.043761, 1, 1, 1, 1, 1,
-0.7443338, 0.599238, 0.1049248, 1, 1, 1, 1, 1,
-0.7399266, 1.146285, -0.7330194, 1, 1, 1, 1, 1,
-0.729893, -0.5007829, -3.467059, 1, 1, 1, 1, 1,
-0.7267572, -0.385583, -2.352418, 0, 0, 1, 1, 1,
-0.718055, -1.045349, -3.514894, 1, 0, 0, 1, 1,
-0.7178168, 0.2434059, -1.594102, 1, 0, 0, 1, 1,
-0.7174196, -0.2646253, -1.795602, 1, 0, 0, 1, 1,
-0.7162505, -0.8228602, -0.9330464, 1, 0, 0, 1, 1,
-0.7158847, -1.219906, -1.290585, 1, 0, 0, 1, 1,
-0.7123602, -0.5687891, -2.992401, 0, 0, 0, 1, 1,
-0.705901, -1.110504, -2.492347, 0, 0, 0, 1, 1,
-0.7019842, -0.6748495, -1.948699, 0, 0, 0, 1, 1,
-0.6972325, 0.04803875, -3.367502, 0, 0, 0, 1, 1,
-0.6936291, -0.6913463, -3.614646, 0, 0, 0, 1, 1,
-0.6917399, 0.2247505, -1.447999, 0, 0, 0, 1, 1,
-0.6891762, 0.3446358, -2.196792, 0, 0, 0, 1, 1,
-0.6882015, 1.254877, 1.966395, 1, 1, 1, 1, 1,
-0.6836727, -0.006987831, -0.7899628, 1, 1, 1, 1, 1,
-0.681709, -0.6754787, -2.924645, 1, 1, 1, 1, 1,
-0.6689913, -1.144534, -3.324875, 1, 1, 1, 1, 1,
-0.6659979, 0.04152241, -1.674906, 1, 1, 1, 1, 1,
-0.6649394, 0.2482562, -0.02522197, 1, 1, 1, 1, 1,
-0.6648971, -0.4232194, -1.273836, 1, 1, 1, 1, 1,
-0.6613247, -1.210833, -1.8597, 1, 1, 1, 1, 1,
-0.6598026, -0.1122256, -1.342741, 1, 1, 1, 1, 1,
-0.6558623, -0.4567781, -3.513398, 1, 1, 1, 1, 1,
-0.6557778, -0.533177, -3.597662, 1, 1, 1, 1, 1,
-0.6546385, 1.011506, -2.248643, 1, 1, 1, 1, 1,
-0.6388516, -1.770504, -2.914174, 1, 1, 1, 1, 1,
-0.638791, 0.6227575, -0.9450418, 1, 1, 1, 1, 1,
-0.6312446, -1.425392, -3.154131, 1, 1, 1, 1, 1,
-0.6278645, 0.3517166, -3.099818, 0, 0, 1, 1, 1,
-0.6258903, 0.2031697, -1.548286, 1, 0, 0, 1, 1,
-0.6239147, -2.523216, -2.946764, 1, 0, 0, 1, 1,
-0.6132941, 1.786218, -1.630648, 1, 0, 0, 1, 1,
-0.6129281, -0.4462959, -1.661082, 1, 0, 0, 1, 1,
-0.6125197, -0.4793795, -4.809646, 1, 0, 0, 1, 1,
-0.6070657, -1.430766, -2.583179, 0, 0, 0, 1, 1,
-0.606538, -2.057986, -1.974744, 0, 0, 0, 1, 1,
-0.5931206, 0.09399198, -2.602659, 0, 0, 0, 1, 1,
-0.5828267, -1.840378, -3.29171, 0, 0, 0, 1, 1,
-0.5794659, -0.1992492, -3.39773, 0, 0, 0, 1, 1,
-0.5640937, -0.01774797, -3.614916, 0, 0, 0, 1, 1,
-0.5607987, 0.02399942, -2.453496, 0, 0, 0, 1, 1,
-0.5600005, 1.087532, -0.003018118, 1, 1, 1, 1, 1,
-0.5575574, -1.459045, -4.811756, 1, 1, 1, 1, 1,
-0.5568306, -0.9033607, -2.028455, 1, 1, 1, 1, 1,
-0.5555136, -0.5655505, -1.717047, 1, 1, 1, 1, 1,
-0.5505827, -0.3422292, -1.13109, 1, 1, 1, 1, 1,
-0.550219, -0.4837366, -1.415513, 1, 1, 1, 1, 1,
-0.5489164, 0.4683484, 0.8232198, 1, 1, 1, 1, 1,
-0.5482219, 0.7168431, 0.3207016, 1, 1, 1, 1, 1,
-0.542383, -1.610377, -2.985177, 1, 1, 1, 1, 1,
-0.5379691, 1.535612, 0.3268681, 1, 1, 1, 1, 1,
-0.5336921, -0.9111653, -4.850344, 1, 1, 1, 1, 1,
-0.5304052, -0.04981373, -0.5556955, 1, 1, 1, 1, 1,
-0.5283741, 1.974861, 0.08768215, 1, 1, 1, 1, 1,
-0.5282562, -1.154621, -1.53844, 1, 1, 1, 1, 1,
-0.5259443, -0.4782324, -2.17001, 1, 1, 1, 1, 1,
-0.5225315, -1.375443, -2.592063, 0, 0, 1, 1, 1,
-0.5222925, -0.6339819, -1.828958, 1, 0, 0, 1, 1,
-0.5219122, 0.06088973, -1.627146, 1, 0, 0, 1, 1,
-0.5198923, 0.3928953, -0.8470427, 1, 0, 0, 1, 1,
-0.5129305, -1.312304, -3.985755, 1, 0, 0, 1, 1,
-0.5013823, 0.113186, -1.852731, 1, 0, 0, 1, 1,
-0.5004013, -0.2833897, -2.18908, 0, 0, 0, 1, 1,
-0.498234, -0.9997166, -3.805347, 0, 0, 0, 1, 1,
-0.4966777, -0.580708, -2.965838, 0, 0, 0, 1, 1,
-0.4963408, 0.939393, -0.9582019, 0, 0, 0, 1, 1,
-0.4961632, -0.1422156, -1.036083, 0, 0, 0, 1, 1,
-0.4903288, 1.719311, -0.5223438, 0, 0, 0, 1, 1,
-0.4880405, -0.4483501, -3.304752, 0, 0, 0, 1, 1,
-0.4852824, 0.5735702, 1.020932, 1, 1, 1, 1, 1,
-0.4793954, 0.1448029, -1.548612, 1, 1, 1, 1, 1,
-0.4785481, 0.4742694, -1.013617, 1, 1, 1, 1, 1,
-0.4735769, 0.2420495, -0.9198163, 1, 1, 1, 1, 1,
-0.4723954, -0.9441918, -2.507701, 1, 1, 1, 1, 1,
-0.4632234, 0.1566243, -2.084529, 1, 1, 1, 1, 1,
-0.461569, -0.3784021, -2.400991, 1, 1, 1, 1, 1,
-0.4596385, -1.291368, -1.834789, 1, 1, 1, 1, 1,
-0.4595821, 3.029149, 0.1124738, 1, 1, 1, 1, 1,
-0.4570126, 1.589348, 0.09786886, 1, 1, 1, 1, 1,
-0.4509394, 0.7562976, -0.9967605, 1, 1, 1, 1, 1,
-0.4500364, 0.1716559, -0.9588971, 1, 1, 1, 1, 1,
-0.4483235, 0.004834025, -0.2059131, 1, 1, 1, 1, 1,
-0.4480776, -0.01489491, -1.147542, 1, 1, 1, 1, 1,
-0.4472914, -1.161194, -3.443609, 1, 1, 1, 1, 1,
-0.4435376, -3.568405, -2.816545, 0, 0, 1, 1, 1,
-0.4394334, -0.3047371, -1.014559, 1, 0, 0, 1, 1,
-0.4370864, -1.401428, -4.296819, 1, 0, 0, 1, 1,
-0.4368152, 0.1819528, -0.08420085, 1, 0, 0, 1, 1,
-0.4367876, -0.3201379, -2.516076, 1, 0, 0, 1, 1,
-0.4354001, -1.145503, -3.912076, 1, 0, 0, 1, 1,
-0.4254085, -0.3006641, -2.747372, 0, 0, 0, 1, 1,
-0.4216977, -0.3707311, -3.957142, 0, 0, 0, 1, 1,
-0.417853, 0.4932442, -0.2196478, 0, 0, 0, 1, 1,
-0.4172512, -0.1293771, -2.643051, 0, 0, 0, 1, 1,
-0.4105842, 0.447246, 0.7457112, 0, 0, 0, 1, 1,
-0.4030286, 0.9580889, 0.2030012, 0, 0, 0, 1, 1,
-0.4012355, 0.4527881, -2.103462, 0, 0, 0, 1, 1,
-0.3964365, 0.5407169, -0.4242497, 1, 1, 1, 1, 1,
-0.3935674, -0.2712546, -1.797908, 1, 1, 1, 1, 1,
-0.3931626, -0.0464097, -0.7220008, 1, 1, 1, 1, 1,
-0.3917564, -0.8868575, -2.687082, 1, 1, 1, 1, 1,
-0.3829733, -0.02468934, -3.228326, 1, 1, 1, 1, 1,
-0.3799054, 0.6630185, -2.193692, 1, 1, 1, 1, 1,
-0.3770175, -1.627926, -3.481388, 1, 1, 1, 1, 1,
-0.3738697, -0.598213, -0.08563564, 1, 1, 1, 1, 1,
-0.3737941, -1.25432, -4.541609, 1, 1, 1, 1, 1,
-0.3666449, -0.3502699, -1.896591, 1, 1, 1, 1, 1,
-0.3660335, -0.1381811, -3.332107, 1, 1, 1, 1, 1,
-0.363292, -0.8464592, -3.393089, 1, 1, 1, 1, 1,
-0.3571578, -0.7566071, -2.889212, 1, 1, 1, 1, 1,
-0.3534883, -0.982345, -2.355506, 1, 1, 1, 1, 1,
-0.3505859, 0.7744819, 0.01451934, 1, 1, 1, 1, 1,
-0.349943, 1.57106, 0.2464785, 0, 0, 1, 1, 1,
-0.3470153, -0.2287702, -2.514774, 1, 0, 0, 1, 1,
-0.3469299, 1.433304, 1.023657, 1, 0, 0, 1, 1,
-0.3386874, 0.1116455, -1.020939, 1, 0, 0, 1, 1,
-0.3380875, -0.4899755, -3.76208, 1, 0, 0, 1, 1,
-0.3354625, 0.7203757, -1.135719, 1, 0, 0, 1, 1,
-0.3352804, -0.1844323, -2.571569, 0, 0, 0, 1, 1,
-0.3350372, 1.785846, 0.1253004, 0, 0, 0, 1, 1,
-0.3349521, 0.2356064, -1.450627, 0, 0, 0, 1, 1,
-0.3343118, 0.6623957, -0.2816053, 0, 0, 0, 1, 1,
-0.3301646, -0.8079789, -3.368474, 0, 0, 0, 1, 1,
-0.3283793, 0.7613469, 0.01070981, 0, 0, 0, 1, 1,
-0.3273736, 0.6948471, -0.4528349, 0, 0, 0, 1, 1,
-0.3256928, 0.5318654, -1.650541, 1, 1, 1, 1, 1,
-0.3252655, 1.461993, -0.8634337, 1, 1, 1, 1, 1,
-0.3211239, -1.264607, -1.376588, 1, 1, 1, 1, 1,
-0.3201659, 0.3069075, -0.8674492, 1, 1, 1, 1, 1,
-0.3180722, -1.376217, -3.665972, 1, 1, 1, 1, 1,
-0.3142538, 0.6345575, -1.11608, 1, 1, 1, 1, 1,
-0.3141508, 0.4837, -0.8449864, 1, 1, 1, 1, 1,
-0.3106132, -1.20313, -0.7539673, 1, 1, 1, 1, 1,
-0.3076383, -1.251741, -3.656244, 1, 1, 1, 1, 1,
-0.3064917, 1.242806, 0.3251755, 1, 1, 1, 1, 1,
-0.305065, -0.5170721, -2.477068, 1, 1, 1, 1, 1,
-0.302354, 1.175801, 0.6994756, 1, 1, 1, 1, 1,
-0.302007, -0.7428904, -2.590451, 1, 1, 1, 1, 1,
-0.2988772, 3.21571, -0.03313685, 1, 1, 1, 1, 1,
-0.2925381, 1.588846, 1.478873, 1, 1, 1, 1, 1,
-0.2924295, 0.8495169, -0.124536, 0, 0, 1, 1, 1,
-0.2904435, 0.09234875, -1.095397, 1, 0, 0, 1, 1,
-0.2858469, -0.7649218, -4.350887, 1, 0, 0, 1, 1,
-0.2855586, -1.042423, -1.014765, 1, 0, 0, 1, 1,
-0.2770635, -0.9360589, -2.07114, 1, 0, 0, 1, 1,
-0.2717385, 0.5781555, -0.150185, 1, 0, 0, 1, 1,
-0.2715389, 0.9874193, -0.03622084, 0, 0, 0, 1, 1,
-0.26919, -0.553327, -3.565133, 0, 0, 0, 1, 1,
-0.2683658, 0.4189095, 0.511757, 0, 0, 0, 1, 1,
-0.2630543, 0.501081, -0.8356628, 0, 0, 0, 1, 1,
-0.2607774, 0.4344334, 0.7564526, 0, 0, 0, 1, 1,
-0.2535109, 1.553833, -1.113387, 0, 0, 0, 1, 1,
-0.249486, 0.7413474, -0.4308147, 0, 0, 0, 1, 1,
-0.2454123, -0.03324462, -1.938549, 1, 1, 1, 1, 1,
-0.2438082, -0.2567657, -1.745838, 1, 1, 1, 1, 1,
-0.242975, 0.382612, -0.3531754, 1, 1, 1, 1, 1,
-0.2408796, -1.311618, -3.275664, 1, 1, 1, 1, 1,
-0.238688, 0.8576861, -1.626207, 1, 1, 1, 1, 1,
-0.2368044, -0.6018975, -2.504371, 1, 1, 1, 1, 1,
-0.2364577, 0.5771239, -0.4321939, 1, 1, 1, 1, 1,
-0.2266627, 2.642443, -0.8550129, 1, 1, 1, 1, 1,
-0.2266312, -0.8713923, -2.036646, 1, 1, 1, 1, 1,
-0.2252055, -0.5687652, -3.61438, 1, 1, 1, 1, 1,
-0.2241323, -0.6739798, -1.740848, 1, 1, 1, 1, 1,
-0.2227942, -0.624467, -2.306233, 1, 1, 1, 1, 1,
-0.2168985, 1.367541, -0.6445002, 1, 1, 1, 1, 1,
-0.2168703, 1.096289, -1.632886, 1, 1, 1, 1, 1,
-0.2128624, 0.5742523, -1.318356, 1, 1, 1, 1, 1,
-0.2035771, 0.4828622, -0.3572468, 0, 0, 1, 1, 1,
-0.2008048, -0.6171317, -2.185087, 1, 0, 0, 1, 1,
-0.1990632, -2.102823, -2.485198, 1, 0, 0, 1, 1,
-0.1986285, -1.527266, -3.58208, 1, 0, 0, 1, 1,
-0.197154, 0.3712957, 0.6946961, 1, 0, 0, 1, 1,
-0.195619, -2.038164, -1.808901, 1, 0, 0, 1, 1,
-0.1923413, 0.1958876, -0.3565655, 0, 0, 0, 1, 1,
-0.191384, 2.187658, -0.2340111, 0, 0, 0, 1, 1,
-0.1895299, 2.626672, 0.3054138, 0, 0, 0, 1, 1,
-0.1882631, -1.141132, -2.917534, 0, 0, 0, 1, 1,
-0.1849005, 0.630531, -2.004179, 0, 0, 0, 1, 1,
-0.1844693, 0.5985541, 0.4857548, 0, 0, 0, 1, 1,
-0.184416, 0.7016523, -1.117236, 0, 0, 0, 1, 1,
-0.1839273, 1.833146, 0.138341, 1, 1, 1, 1, 1,
-0.181336, -0.3686489, -3.990007, 1, 1, 1, 1, 1,
-0.1805528, -1.480391, -2.625641, 1, 1, 1, 1, 1,
-0.179393, -1.559737, -2.367788, 1, 1, 1, 1, 1,
-0.1777514, -0.6069031, -3.558234, 1, 1, 1, 1, 1,
-0.1770209, 0.7421927, 0.5775875, 1, 1, 1, 1, 1,
-0.1769385, -1.753489, -1.947071, 1, 1, 1, 1, 1,
-0.1721022, -0.1242212, -1.731766, 1, 1, 1, 1, 1,
-0.1633568, 1.420136, 0.96422, 1, 1, 1, 1, 1,
-0.1630847, -1.296029, -4.903692, 1, 1, 1, 1, 1,
-0.159129, -0.1761152, -0.7050031, 1, 1, 1, 1, 1,
-0.1589558, 0.5722004, -0.8929736, 1, 1, 1, 1, 1,
-0.1582766, 0.115274, 0.2876502, 1, 1, 1, 1, 1,
-0.1574104, 0.01187421, -1.197558, 1, 1, 1, 1, 1,
-0.1541386, 1.379589, -0.7856598, 1, 1, 1, 1, 1,
-0.153549, -0.2401749, -3.186502, 0, 0, 1, 1, 1,
-0.1534474, 0.9325098, -0.5187873, 1, 0, 0, 1, 1,
-0.1518857, 0.984505, 0.4852412, 1, 0, 0, 1, 1,
-0.1459364, 0.084457, 0.7648229, 1, 0, 0, 1, 1,
-0.1411406, 1.348461, -1.013499, 1, 0, 0, 1, 1,
-0.1391939, -0.8876124, -1.904093, 1, 0, 0, 1, 1,
-0.1365992, -0.7851115, -3.408529, 0, 0, 0, 1, 1,
-0.1313537, -0.07752717, -1.904402, 0, 0, 0, 1, 1,
-0.1306912, 0.5118793, -1.327946, 0, 0, 0, 1, 1,
-0.1298179, -0.8419179, -4.92037, 0, 0, 0, 1, 1,
-0.128883, -0.975752, -4.462698, 0, 0, 0, 1, 1,
-0.127242, -0.004947704, -2.502052, 0, 0, 0, 1, 1,
-0.1252078, -0.3753887, -2.181608, 0, 0, 0, 1, 1,
-0.1233354, 1.251862, -0.1090756, 1, 1, 1, 1, 1,
-0.1219223, 0.5938757, 0.3044907, 1, 1, 1, 1, 1,
-0.1179642, -0.8274975, -2.013468, 1, 1, 1, 1, 1,
-0.1166688, 0.09946734, -1.960406, 1, 1, 1, 1, 1,
-0.1160213, 0.4355989, 0.5394484, 1, 1, 1, 1, 1,
-0.1125952, 1.59843, -0.03534634, 1, 1, 1, 1, 1,
-0.1090283, -0.4564706, -1.724871, 1, 1, 1, 1, 1,
-0.1082588, 0.06931024, 1.992132, 1, 1, 1, 1, 1,
-0.1076794, -2.360022, -3.043831, 1, 1, 1, 1, 1,
-0.1044396, -0.02070796, -1.916324, 1, 1, 1, 1, 1,
-0.1032808, 1.093027, 1.591598, 1, 1, 1, 1, 1,
-0.1021908, 1.35688, 0.1414947, 1, 1, 1, 1, 1,
-0.1009511, -1.813966, -3.190493, 1, 1, 1, 1, 1,
-0.09577332, -0.5922044, -1.698336, 1, 1, 1, 1, 1,
-0.07700635, -0.03710026, -1.121109, 1, 1, 1, 1, 1,
-0.07601722, -0.2948036, -3.449102, 0, 0, 1, 1, 1,
-0.071946, 1.611699, -0.1576877, 1, 0, 0, 1, 1,
-0.07154149, -0.5029928, -2.258094, 1, 0, 0, 1, 1,
-0.07088888, 0.09840161, -1.716402, 1, 0, 0, 1, 1,
-0.06359247, 1.723079, -0.6646295, 1, 0, 0, 1, 1,
-0.056865, 0.1107339, -1.407018, 1, 0, 0, 1, 1,
-0.05680449, 0.5652258, -2.179957, 0, 0, 0, 1, 1,
-0.0558353, -1.173305, -5.080918, 0, 0, 0, 1, 1,
-0.05205764, 0.8235929, 0.9264216, 0, 0, 0, 1, 1,
-0.05149191, 1.248711, -0.455313, 0, 0, 0, 1, 1,
-0.0493014, -0.2057865, -3.959337, 0, 0, 0, 1, 1,
-0.04634782, 0.5637573, 1.323271, 0, 0, 0, 1, 1,
-0.04117147, -0.3153215, -3.781334, 0, 0, 0, 1, 1,
-0.03715761, -1.038667, -1.569587, 1, 1, 1, 1, 1,
-0.03533007, 0.5470149, 1.343826, 1, 1, 1, 1, 1,
-0.03264651, -0.8240532, -3.762586, 1, 1, 1, 1, 1,
-0.02972749, -0.2139417, -3.84745, 1, 1, 1, 1, 1,
-0.0280846, 1.969797, 0.1047982, 1, 1, 1, 1, 1,
-0.02534733, -1.85367, -3.598688, 1, 1, 1, 1, 1,
-0.02439453, -0.1295373, -4.490494, 1, 1, 1, 1, 1,
-0.02087099, 1.178532, 0.2651908, 1, 1, 1, 1, 1,
-0.0183663, 1.127024, -1.590153, 1, 1, 1, 1, 1,
-0.008452184, -0.09064869, -2.065986, 1, 1, 1, 1, 1,
-0.006125623, -0.06308687, -2.25396, 1, 1, 1, 1, 1,
-0.004617643, -1.09215, -2.516127, 1, 1, 1, 1, 1,
-0.00401945, -1.32568, -2.607079, 1, 1, 1, 1, 1,
-0.001955857, 0.2540149, -0.3524475, 1, 1, 1, 1, 1,
0.01154623, 0.6741659, -0.1512257, 1, 1, 1, 1, 1,
0.01534406, 0.1392704, -0.8407924, 0, 0, 1, 1, 1,
0.01769332, 0.8679341, 0.1032665, 1, 0, 0, 1, 1,
0.01796274, 2.141629, 0.4643113, 1, 0, 0, 1, 1,
0.0294848, -0.3649696, 2.313009, 1, 0, 0, 1, 1,
0.0324493, 1.076739, 0.06234074, 1, 0, 0, 1, 1,
0.03457419, -0.6740235, 3.393036, 1, 0, 0, 1, 1,
0.03553493, 1.219847, 0.1179713, 0, 0, 0, 1, 1,
0.03618968, -1.505059, 3.408589, 0, 0, 0, 1, 1,
0.04375535, 1.777226, 0.08220013, 0, 0, 0, 1, 1,
0.04651313, 0.3756931, -0.2873545, 0, 0, 0, 1, 1,
0.0490451, 0.499309, 0.2744009, 0, 0, 0, 1, 1,
0.04944004, 0.9708567, -2.015159, 0, 0, 0, 1, 1,
0.05076928, 1.554312, 0.8475509, 0, 0, 0, 1, 1,
0.05187601, 0.7413921, -0.08763591, 1, 1, 1, 1, 1,
0.05563553, -0.1029588, 1.60566, 1, 1, 1, 1, 1,
0.06370032, 1.7183, 0.9357191, 1, 1, 1, 1, 1,
0.07765909, -1.17128, 4.722833, 1, 1, 1, 1, 1,
0.07911447, 0.1915925, -0.1863742, 1, 1, 1, 1, 1,
0.07972251, 0.3447889, 1.922686, 1, 1, 1, 1, 1,
0.08191459, -1.077514, 3.670167, 1, 1, 1, 1, 1,
0.08268848, 0.7084458, 0.04757562, 1, 1, 1, 1, 1,
0.08831426, -0.1217202, 1.68183, 1, 1, 1, 1, 1,
0.08967886, -0.4372435, 1.992605, 1, 1, 1, 1, 1,
0.09120238, 0.08986896, 1.479654, 1, 1, 1, 1, 1,
0.09207729, -0.8683574, 4.119357, 1, 1, 1, 1, 1,
0.09295826, 0.3242643, -0.2795031, 1, 1, 1, 1, 1,
0.09642359, 0.0481462, 2.055734, 1, 1, 1, 1, 1,
0.09990697, 1.732389, 0.9081599, 1, 1, 1, 1, 1,
0.1016534, 0.03414599, 3.822013, 0, 0, 1, 1, 1,
0.1100053, -0.04139401, 2.05028, 1, 0, 0, 1, 1,
0.1146328, -0.4842566, 1.62951, 1, 0, 0, 1, 1,
0.1146926, -0.6003584, 2.332179, 1, 0, 0, 1, 1,
0.1171957, -0.83107, 2.785057, 1, 0, 0, 1, 1,
0.1183383, 0.1980886, -0.2579736, 1, 0, 0, 1, 1,
0.1218386, 0.7857686, -1.329072, 0, 0, 0, 1, 1,
0.1219572, 0.2858833, 0.3288915, 0, 0, 0, 1, 1,
0.125656, -1.399578, 0.8047287, 0, 0, 0, 1, 1,
0.1297295, 1.767458, 1.140004, 0, 0, 0, 1, 1,
0.1307239, 0.1398801, 1.967198, 0, 0, 0, 1, 1,
0.1343985, -1.314499, 3.989973, 0, 0, 0, 1, 1,
0.137259, -0.1618395, 3.35335, 0, 0, 0, 1, 1,
0.1386321, 0.09546901, 1.356793, 1, 1, 1, 1, 1,
0.1430659, 0.5509241, 0.4905747, 1, 1, 1, 1, 1,
0.1459544, 0.8159454, 1.499382, 1, 1, 1, 1, 1,
0.1510062, 1.652115, -0.3717439, 1, 1, 1, 1, 1,
0.1576726, -1.353514, 3.154658, 1, 1, 1, 1, 1,
0.1603262, 0.03766366, 0.1244069, 1, 1, 1, 1, 1,
0.1612773, -0.8045608, 4.618546, 1, 1, 1, 1, 1,
0.1686633, 0.2415498, 0.8825216, 1, 1, 1, 1, 1,
0.1692002, -1.490143, 3.423347, 1, 1, 1, 1, 1,
0.1706039, -1.608276, 2.753386, 1, 1, 1, 1, 1,
0.1707297, 0.7199253, 1.082944, 1, 1, 1, 1, 1,
0.1719372, -0.5487985, 2.04487, 1, 1, 1, 1, 1,
0.1733295, 0.5051741, -0.5066578, 1, 1, 1, 1, 1,
0.1767507, 1.269925, 1.213876, 1, 1, 1, 1, 1,
0.1771187, 0.9769418, -0.8621261, 1, 1, 1, 1, 1,
0.1781105, -0.4944834, 2.259872, 0, 0, 1, 1, 1,
0.1791949, -0.6198174, 4.789894, 1, 0, 0, 1, 1,
0.1812364, -1.226891, 3.478497, 1, 0, 0, 1, 1,
0.1847905, 0.9627383, -1.734071, 1, 0, 0, 1, 1,
0.185453, 0.4406598, 0.2865274, 1, 0, 0, 1, 1,
0.1905724, 0.2248645, -0.3133328, 1, 0, 0, 1, 1,
0.193904, 0.3723674, 1.652573, 0, 0, 0, 1, 1,
0.1951076, 0.4274919, -1.072402, 0, 0, 0, 1, 1,
0.1994998, -1.519706, 2.156618, 0, 0, 0, 1, 1,
0.1999834, -1.245979, 2.007601, 0, 0, 0, 1, 1,
0.200995, 1.395943, 0.3230045, 0, 0, 0, 1, 1,
0.2020595, 0.8469378, -1.070843, 0, 0, 0, 1, 1,
0.2023704, 0.3881227, 1.686132, 0, 0, 0, 1, 1,
0.204178, 0.9402639, -0.04885085, 1, 1, 1, 1, 1,
0.2049783, 1.22712, -0.411959, 1, 1, 1, 1, 1,
0.2080553, -0.0273041, 0.6784366, 1, 1, 1, 1, 1,
0.209479, 0.6179949, 2.181949, 1, 1, 1, 1, 1,
0.2095559, 0.8437517, 0.2763223, 1, 1, 1, 1, 1,
0.209696, 0.005898646, 1.311499, 1, 1, 1, 1, 1,
0.2112342, 0.9874295, 1.463875, 1, 1, 1, 1, 1,
0.2166215, -0.7872567, 2.437664, 1, 1, 1, 1, 1,
0.2172669, 2.307232, 0.8430191, 1, 1, 1, 1, 1,
0.2173295, -1.604554, 2.954361, 1, 1, 1, 1, 1,
0.2177841, -0.26201, 3.419792, 1, 1, 1, 1, 1,
0.2183353, -0.8647451, 1.977065, 1, 1, 1, 1, 1,
0.219618, 1.089283, -0.3962113, 1, 1, 1, 1, 1,
0.2253273, 0.3556988, -0.09516933, 1, 1, 1, 1, 1,
0.2268618, -1.035899, 1.314004, 1, 1, 1, 1, 1,
0.2312468, -0.09916312, 2.43903, 0, 0, 1, 1, 1,
0.2324842, 0.3086445, 0.6086188, 1, 0, 0, 1, 1,
0.2404263, 0.1688935, 0.3280335, 1, 0, 0, 1, 1,
0.2421043, 1.137109, 0.4890483, 1, 0, 0, 1, 1,
0.2467021, 0.05147497, 2.837065, 1, 0, 0, 1, 1,
0.2477029, 0.8998941, 1.07557, 1, 0, 0, 1, 1,
0.2498101, -1.022355, 2.613546, 0, 0, 0, 1, 1,
0.250127, -0.4343544, 1.60711, 0, 0, 0, 1, 1,
0.2501449, 1.043716, -0.1513961, 0, 0, 0, 1, 1,
0.2555647, -1.267109, 2.799753, 0, 0, 0, 1, 1,
0.2563704, 0.182293, 1.40379, 0, 0, 0, 1, 1,
0.2565418, 0.01350324, 1.825265, 0, 0, 0, 1, 1,
0.2582635, -1.268708, 3.874046, 0, 0, 0, 1, 1,
0.2648256, -0.1242184, 2.554383, 1, 1, 1, 1, 1,
0.2650827, -0.3375722, 3.843221, 1, 1, 1, 1, 1,
0.2704782, -0.5090781, 3.783486, 1, 1, 1, 1, 1,
0.274231, -0.5510895, 2.820754, 1, 1, 1, 1, 1,
0.2752118, -0.8788708, 1.975371, 1, 1, 1, 1, 1,
0.2782051, -0.1380126, 0.6297964, 1, 1, 1, 1, 1,
0.2782973, 0.1347795, 0.8288578, 1, 1, 1, 1, 1,
0.2792957, 1.563201, 0.4931563, 1, 1, 1, 1, 1,
0.2817357, 0.8356124, 0.5880345, 1, 1, 1, 1, 1,
0.2876726, 1.100549, 0.5795175, 1, 1, 1, 1, 1,
0.2936908, -1.052115, 2.213947, 1, 1, 1, 1, 1,
0.2970973, 0.6531873, 0.9686109, 1, 1, 1, 1, 1,
0.2974276, 0.2650885, 1.530122, 1, 1, 1, 1, 1,
0.3011091, -0.1840897, 0.7916786, 1, 1, 1, 1, 1,
0.3017358, -0.6299059, 4.242834, 1, 1, 1, 1, 1,
0.3050811, -1.281358, 2.588029, 0, 0, 1, 1, 1,
0.3074078, 0.5644575, 1.425666, 1, 0, 0, 1, 1,
0.3076373, 0.1526096, 0.5958775, 1, 0, 0, 1, 1,
0.311178, 1.415595, 1.020389, 1, 0, 0, 1, 1,
0.316485, -0.1253926, 1.499349, 1, 0, 0, 1, 1,
0.323724, 0.9151429, 0.4079286, 1, 0, 0, 1, 1,
0.3260667, -1.285224, 2.674755, 0, 0, 0, 1, 1,
0.3268985, 1.360702, -0.9647055, 0, 0, 0, 1, 1,
0.3334778, 0.2164446, 1.355652, 0, 0, 0, 1, 1,
0.337435, -0.04016929, 1.908791, 0, 0, 0, 1, 1,
0.3378619, -2.219891, 3.104936, 0, 0, 0, 1, 1,
0.3380241, 1.212007, 0.4595198, 0, 0, 0, 1, 1,
0.3384434, 1.941928, -0.8532335, 0, 0, 0, 1, 1,
0.3397346, 1.479284, 0.874269, 1, 1, 1, 1, 1,
0.343277, -1.275264, 3.663229, 1, 1, 1, 1, 1,
0.3436844, 0.06972581, 1.405945, 1, 1, 1, 1, 1,
0.3493818, -1.06262, 3.345561, 1, 1, 1, 1, 1,
0.3499777, 0.9371082, -0.9484596, 1, 1, 1, 1, 1,
0.3514712, -1.187944, 1.078248, 1, 1, 1, 1, 1,
0.3544876, 2.152493, 0.5406525, 1, 1, 1, 1, 1,
0.3546517, 1.29125, 0.9511432, 1, 1, 1, 1, 1,
0.3596792, -0.5795532, 2.112832, 1, 1, 1, 1, 1,
0.3603953, -1.357116, 1.533797, 1, 1, 1, 1, 1,
0.3631692, 0.2583798, 0.998777, 1, 1, 1, 1, 1,
0.3659336, -0.7071182, 3.164408, 1, 1, 1, 1, 1,
0.36721, -0.6424795, 0.7534292, 1, 1, 1, 1, 1,
0.3679549, -0.6971647, 3.213668, 1, 1, 1, 1, 1,
0.3681116, -1.163111, 3.355111, 1, 1, 1, 1, 1,
0.369926, 1.040653, -1.662621, 0, 0, 1, 1, 1,
0.3716893, 0.6075474, 1.86747, 1, 0, 0, 1, 1,
0.3723783, -0.6221557, 1.948725, 1, 0, 0, 1, 1,
0.3758624, -0.4024032, 2.043584, 1, 0, 0, 1, 1,
0.3767426, -0.02292344, 0.3205345, 1, 0, 0, 1, 1,
0.3788812, -1.536113, 1.701721, 1, 0, 0, 1, 1,
0.3796041, -0.7164983, 1.540753, 0, 0, 0, 1, 1,
0.3811701, -0.4867424, 1.591691, 0, 0, 0, 1, 1,
0.3853642, 0.01548138, 2.016286, 0, 0, 0, 1, 1,
0.3862113, -0.6228544, 1.386588, 0, 0, 0, 1, 1,
0.3871327, -0.5734253, 3.525832, 0, 0, 0, 1, 1,
0.3879672, 1.229097, -0.8139009, 0, 0, 0, 1, 1,
0.390215, 0.4115409, 1.041247, 0, 0, 0, 1, 1,
0.3916332, -0.8132694, 1.553301, 1, 1, 1, 1, 1,
0.3917456, -0.986172, 1.411236, 1, 1, 1, 1, 1,
0.3922456, 1.398987, 0.812922, 1, 1, 1, 1, 1,
0.395182, 1.63535, 2.028158, 1, 1, 1, 1, 1,
0.3974169, -1.181195, 4.035966, 1, 1, 1, 1, 1,
0.3997876, -0.8499113, 1.657552, 1, 1, 1, 1, 1,
0.4005305, 1.914651, 0.8910534, 1, 1, 1, 1, 1,
0.401867, 2.060894, 0.5415238, 1, 1, 1, 1, 1,
0.4061187, -0.452678, 2.822776, 1, 1, 1, 1, 1,
0.4065703, 0.4058766, 0.6022187, 1, 1, 1, 1, 1,
0.4124242, 1.420506, -0.05481218, 1, 1, 1, 1, 1,
0.4127056, -1.287698, 3.461233, 1, 1, 1, 1, 1,
0.4128126, -2.449403, 1.194058, 1, 1, 1, 1, 1,
0.414044, 0.964886, 0.676017, 1, 1, 1, 1, 1,
0.4150333, 0.6438468, 0.7881485, 1, 1, 1, 1, 1,
0.4175159, -0.1243402, 2.382228, 0, 0, 1, 1, 1,
0.4190229, 1.661214, -0.2472304, 1, 0, 0, 1, 1,
0.4202333, 0.9806986, -0.5724834, 1, 0, 0, 1, 1,
0.4225328, 0.39001, 0.06014903, 1, 0, 0, 1, 1,
0.4238451, -1.233702, 2.124515, 1, 0, 0, 1, 1,
0.4507759, 1.418759, -0.4747274, 1, 0, 0, 1, 1,
0.4533005, -1.254803, 2.591144, 0, 0, 0, 1, 1,
0.4545952, 0.3469, -0.2817782, 0, 0, 0, 1, 1,
0.4577663, -1.754294, 2.537929, 0, 0, 0, 1, 1,
0.4578542, 1.108364, 1.158351, 0, 0, 0, 1, 1,
0.457892, 0.979122, -0.3733968, 0, 0, 0, 1, 1,
0.4590026, -0.918965, 2.8473, 0, 0, 0, 1, 1,
0.4604987, 1.019977, 0.3928244, 0, 0, 0, 1, 1,
0.462595, -0.07345635, 1.554365, 1, 1, 1, 1, 1,
0.4631412, -0.3060038, 2.042759, 1, 1, 1, 1, 1,
0.4632726, -0.3944885, 1.840622, 1, 1, 1, 1, 1,
0.4657078, 1.679499, 0.8924475, 1, 1, 1, 1, 1,
0.4673988, -0.104449, 2.325187, 1, 1, 1, 1, 1,
0.4687552, -0.6503659, 2.331896, 1, 1, 1, 1, 1,
0.4835143, -0.7650689, 0.4290972, 1, 1, 1, 1, 1,
0.4882567, -0.9004672, 1.681272, 1, 1, 1, 1, 1,
0.4895614, -0.6027753, 0.3948991, 1, 1, 1, 1, 1,
0.4914829, -0.7037812, 3.67613, 1, 1, 1, 1, 1,
0.4999695, -0.2113857, 0.499925, 1, 1, 1, 1, 1,
0.5010922, 0.3123434, 1.764952, 1, 1, 1, 1, 1,
0.5057141, -0.9774916, 1.628943, 1, 1, 1, 1, 1,
0.5060722, 0.6494022, 1.489408, 1, 1, 1, 1, 1,
0.510335, -0.7521514, 1.63284, 1, 1, 1, 1, 1,
0.5107767, -1.932077, 3.909889, 0, 0, 1, 1, 1,
0.5143506, -0.8769429, 3.481728, 1, 0, 0, 1, 1,
0.5187219, -1.011116, 2.537403, 1, 0, 0, 1, 1,
0.5246676, -2.104844, 2.208936, 1, 0, 0, 1, 1,
0.5292936, 0.2976953, 1.595593, 1, 0, 0, 1, 1,
0.5324239, -0.9383142, 2.099171, 1, 0, 0, 1, 1,
0.5368013, -1.519642, 3.624823, 0, 0, 0, 1, 1,
0.5398564, 1.148375, 0.1339162, 0, 0, 0, 1, 1,
0.5424824, 0.01331596, 0.8558164, 0, 0, 0, 1, 1,
0.5425898, -1.066621, 1.073153, 0, 0, 0, 1, 1,
0.5494469, 0.6738087, -0.2710943, 0, 0, 0, 1, 1,
0.5542046, -1.080631, 2.576689, 0, 0, 0, 1, 1,
0.5545176, -0.7135838, 3.099424, 0, 0, 0, 1, 1,
0.5548547, 0.5404105, 1.707368, 1, 1, 1, 1, 1,
0.5625505, 1.035151, 1.175805, 1, 1, 1, 1, 1,
0.5633625, 0.4634134, 1.410274, 1, 1, 1, 1, 1,
0.5636073, -0.4768582, 2.23588, 1, 1, 1, 1, 1,
0.5660965, -1.076719, 3.329097, 1, 1, 1, 1, 1,
0.5690272, -0.3013172, 3.241112, 1, 1, 1, 1, 1,
0.5699799, -1.572755, 3.82781, 1, 1, 1, 1, 1,
0.5711145, 0.9177126, 1.943503, 1, 1, 1, 1, 1,
0.57173, -0.6647217, 1.62206, 1, 1, 1, 1, 1,
0.572921, -1.153814, 2.081251, 1, 1, 1, 1, 1,
0.5778756, -0.6137233, 3.017252, 1, 1, 1, 1, 1,
0.5811327, 0.6711837, 0.1515752, 1, 1, 1, 1, 1,
0.5845124, 0.3915803, 2.675364, 1, 1, 1, 1, 1,
0.5877126, -0.7672865, 1.458672, 1, 1, 1, 1, 1,
0.5879743, -0.03225883, 2.736781, 1, 1, 1, 1, 1,
0.5962758, 0.1343991, 1.971694, 0, 0, 1, 1, 1,
0.5964336, -1.173856, 1.307081, 1, 0, 0, 1, 1,
0.5972264, 0.09229367, 1.671053, 1, 0, 0, 1, 1,
0.5973509, -2.161762, 3.584884, 1, 0, 0, 1, 1,
0.6078717, -0.4552307, 1.503253, 1, 0, 0, 1, 1,
0.6086735, -0.8579682, 0.176957, 1, 0, 0, 1, 1,
0.6118588, -1.766106, 4.456229, 0, 0, 0, 1, 1,
0.6169506, 0.4841703, 0.7084686, 0, 0, 0, 1, 1,
0.6206085, 0.2389931, 1.468135, 0, 0, 0, 1, 1,
0.6213672, 0.0149376, 0.5989225, 0, 0, 0, 1, 1,
0.6217611, -0.1440362, 2.156701, 0, 0, 0, 1, 1,
0.6248279, 1.243432, 0.7583152, 0, 0, 0, 1, 1,
0.6300775, 0.2562891, 0.5930473, 0, 0, 0, 1, 1,
0.6312957, -1.771874, 2.742324, 1, 1, 1, 1, 1,
0.632258, 0.4963757, 0.02323513, 1, 1, 1, 1, 1,
0.6328092, 1.536912, -0.2119744, 1, 1, 1, 1, 1,
0.6445974, 0.9941983, 0.4668024, 1, 1, 1, 1, 1,
0.6451277, -0.2096178, 2.10113, 1, 1, 1, 1, 1,
0.6453179, -1.57542, 2.650495, 1, 1, 1, 1, 1,
0.6462634, -1.91553, 1.883569, 1, 1, 1, 1, 1,
0.6476194, -0.2905942, 3.052088, 1, 1, 1, 1, 1,
0.648452, 1.227566, -0.4909761, 1, 1, 1, 1, 1,
0.6495373, 0.8575615, 3.48824, 1, 1, 1, 1, 1,
0.6496795, 1.033468, 1.737076, 1, 1, 1, 1, 1,
0.6503389, 1.068715, 0.451289, 1, 1, 1, 1, 1,
0.6510956, 1.820209, -0.7036747, 1, 1, 1, 1, 1,
0.6545789, 1.545825, 1.16206, 1, 1, 1, 1, 1,
0.6571853, -0.2910991, 1.203892, 1, 1, 1, 1, 1,
0.6580998, -1.014549, 1.024208, 0, 0, 1, 1, 1,
0.665959, 0.7750973, -0.2430436, 1, 0, 0, 1, 1,
0.6692768, 0.6928766, 0.538496, 1, 0, 0, 1, 1,
0.6703379, 0.6152535, 2.148181, 1, 0, 0, 1, 1,
0.6704318, 0.6832429, 0.9774308, 1, 0, 0, 1, 1,
0.6704753, -1.10087, 2.867832, 1, 0, 0, 1, 1,
0.6716874, -0.3837945, 0.1584815, 0, 0, 0, 1, 1,
0.6725688, 1.899275, 0.8391424, 0, 0, 0, 1, 1,
0.6787061, -0.4795733, 0.9548786, 0, 0, 0, 1, 1,
0.6787803, -0.4601167, 3.429521, 0, 0, 0, 1, 1,
0.6788074, -0.2150613, 2.349371, 0, 0, 0, 1, 1,
0.6800732, 1.879367, -0.0852853, 0, 0, 0, 1, 1,
0.6849849, -1.043719, 0.6872312, 0, 0, 0, 1, 1,
0.685486, -0.005614607, 0.6387853, 1, 1, 1, 1, 1,
0.6957548, -0.5025216, 1.244845, 1, 1, 1, 1, 1,
0.696309, -0.4045922, 1.374191, 1, 1, 1, 1, 1,
0.7002817, 1.409137, 0.1124757, 1, 1, 1, 1, 1,
0.7065346, 1.270236, -0.08668365, 1, 1, 1, 1, 1,
0.7068743, -2.203976, 2.462401, 1, 1, 1, 1, 1,
0.711474, -0.7262502, 2.203897, 1, 1, 1, 1, 1,
0.7150523, -0.7083562, 1.182129, 1, 1, 1, 1, 1,
0.7154042, 1.412687, 1.916047, 1, 1, 1, 1, 1,
0.7189695, -0.1077302, 0.3767731, 1, 1, 1, 1, 1,
0.720032, -1.865391, 2.683372, 1, 1, 1, 1, 1,
0.720224, -0.2209308, 1.259617, 1, 1, 1, 1, 1,
0.7237643, 0.977371, 0.3755152, 1, 1, 1, 1, 1,
0.7265837, 0.3357293, 1.088704, 1, 1, 1, 1, 1,
0.7318714, 0.02258752, 1.49266, 1, 1, 1, 1, 1,
0.7340484, 1.054168, -0.7362663, 0, 0, 1, 1, 1,
0.734372, -0.09095169, 2.094478, 1, 0, 0, 1, 1,
0.7350447, -0.3276594, 1.518077, 1, 0, 0, 1, 1,
0.7421398, -1.014081, 3.163211, 1, 0, 0, 1, 1,
0.7426379, -1.449182, 3.819385, 1, 0, 0, 1, 1,
0.7454148, -0.1175252, 1.68725, 1, 0, 0, 1, 1,
0.7476233, -0.5690361, 0.8453817, 0, 0, 0, 1, 1,
0.7491056, -0.874394, 3.56247, 0, 0, 0, 1, 1,
0.7506478, 1.354771, 0.9057572, 0, 0, 0, 1, 1,
0.7530747, 0.809438, 2.442684, 0, 0, 0, 1, 1,
0.7624782, -1.206225, 2.025397, 0, 0, 0, 1, 1,
0.7635332, 1.284415, 0.3595134, 0, 0, 0, 1, 1,
0.7690967, -0.9210584, 3.184247, 0, 0, 0, 1, 1,
0.7696901, -0.1107736, 1.850238, 1, 1, 1, 1, 1,
0.7708721, -0.4609387, 1.725854, 1, 1, 1, 1, 1,
0.7721885, 0.4611142, -0.9280804, 1, 1, 1, 1, 1,
0.7763824, -0.5580845, 2.152339, 1, 1, 1, 1, 1,
0.7788728, 0.8409184, 0.4043022, 1, 1, 1, 1, 1,
0.7810906, -0.06755985, 1.992404, 1, 1, 1, 1, 1,
0.7900405, -0.1854624, -0.9460506, 1, 1, 1, 1, 1,
0.8037832, 0.150901, 3.147961, 1, 1, 1, 1, 1,
0.8041073, 0.7034375, 0.4046305, 1, 1, 1, 1, 1,
0.8114938, 1.044356, 1.316491, 1, 1, 1, 1, 1,
0.8128453, -1.730213, 4.973601, 1, 1, 1, 1, 1,
0.8130317, -0.2303919, 0.04217589, 1, 1, 1, 1, 1,
0.8152892, 1.57606, 0.9008072, 1, 1, 1, 1, 1,
0.8223043, -0.1162217, 1.768997, 1, 1, 1, 1, 1,
0.8257123, 0.491752, 0.5349915, 1, 1, 1, 1, 1,
0.8289177, -0.2812691, 3.812707, 0, 0, 1, 1, 1,
0.8294089, -0.3029066, 1.894078, 1, 0, 0, 1, 1,
0.832845, 2.076138, -0.4797602, 1, 0, 0, 1, 1,
0.8360397, 1.44882, 0.05013655, 1, 0, 0, 1, 1,
0.8399747, -0.8200298, 1.599606, 1, 0, 0, 1, 1,
0.8425639, 0.4969729, 1.684328, 1, 0, 0, 1, 1,
0.8433591, -0.5769796, 2.714895, 0, 0, 0, 1, 1,
0.8456217, 0.1061807, 0.5302854, 0, 0, 0, 1, 1,
0.8492082, 1.565526, 0.3205848, 0, 0, 0, 1, 1,
0.8502618, 0.657521, 1.263996, 0, 0, 0, 1, 1,
0.8524985, -1.797273, 2.762988, 0, 0, 0, 1, 1,
0.8541083, 2.057212, 1.570701, 0, 0, 0, 1, 1,
0.8557811, -0.9451894, 4.527859, 0, 0, 0, 1, 1,
0.8637764, -0.4438514, 2.082319, 1, 1, 1, 1, 1,
0.8648778, -1.571255, 4.060033, 1, 1, 1, 1, 1,
0.8698125, 1.270381, 0.6828888, 1, 1, 1, 1, 1,
0.8734301, 1.961321, 0.06531878, 1, 1, 1, 1, 1,
0.8741134, -0.656353, 1.238358, 1, 1, 1, 1, 1,
0.8757243, 0.02374043, 0.8503817, 1, 1, 1, 1, 1,
0.8768195, -0.1428626, 2.180897, 1, 1, 1, 1, 1,
0.8817071, 0.4548801, 1.24584, 1, 1, 1, 1, 1,
0.8823773, -0.3735154, 3.842114, 1, 1, 1, 1, 1,
0.8954117, 0.1630197, 1.046332, 1, 1, 1, 1, 1,
0.896966, -0.05359391, 0.2419971, 1, 1, 1, 1, 1,
0.90364, 0.2230054, 2.480548, 1, 1, 1, 1, 1,
0.9043634, 0.7627465, 0.4077252, 1, 1, 1, 1, 1,
0.9085121, -1.216844, 1.453654, 1, 1, 1, 1, 1,
0.9107443, -0.6680219, 2.138318, 1, 1, 1, 1, 1,
0.9130703, 1.305999, 2.035762, 0, 0, 1, 1, 1,
0.9168979, -1.441998, 2.228388, 1, 0, 0, 1, 1,
0.917134, -0.3674561, 2.168644, 1, 0, 0, 1, 1,
0.9181227, -0.1368232, 2.100725, 1, 0, 0, 1, 1,
0.9181652, -0.680604, 3.134652, 1, 0, 0, 1, 1,
0.9229152, -0.2248895, 2.170669, 1, 0, 0, 1, 1,
0.9239993, 1.707487, -0.05264442, 0, 0, 0, 1, 1,
0.9412534, 1.480795, 0.6229995, 0, 0, 0, 1, 1,
0.9453578, 0.8219078, 1.747859, 0, 0, 0, 1, 1,
0.9473208, -0.5406221, 2.603269, 0, 0, 0, 1, 1,
0.9516608, 0.1497587, -0.3132356, 0, 0, 0, 1, 1,
0.9566923, -1.346563, 0.4431551, 0, 0, 0, 1, 1,
0.958458, -1.591454, 1.647004, 0, 0, 0, 1, 1,
0.9612489, -0.08616269, 0.3681357, 1, 1, 1, 1, 1,
0.9646387, 0.5323079, 0.9144908, 1, 1, 1, 1, 1,
0.9683402, -0.02408018, 1.70138, 1, 1, 1, 1, 1,
0.9704657, -1.309743, 1.516079, 1, 1, 1, 1, 1,
0.9726005, 0.06959217, 0.5794604, 1, 1, 1, 1, 1,
0.9789238, -0.8937921, 2.574049, 1, 1, 1, 1, 1,
0.9799793, 0.2889598, 1.479102, 1, 1, 1, 1, 1,
0.9813569, 0.3919517, 0.3630424, 1, 1, 1, 1, 1,
0.9882746, 2.571208, 0.6092455, 1, 1, 1, 1, 1,
0.9884443, 1.4483, 0.9859262, 1, 1, 1, 1, 1,
0.9899721, -0.4741029, 4.379427, 1, 1, 1, 1, 1,
0.9906279, -1.070143, 3.921458, 1, 1, 1, 1, 1,
0.9980814, -1.284667, 2.82172, 1, 1, 1, 1, 1,
1.008763, 0.3976586, 0.9966851, 1, 1, 1, 1, 1,
1.015784, 2.005738, 0.2759677, 1, 1, 1, 1, 1,
1.019693, 0.08447299, 1.228586, 0, 0, 1, 1, 1,
1.024536, 1.394278, 0.6814805, 1, 0, 0, 1, 1,
1.028562, -0.7274714, 2.671502, 1, 0, 0, 1, 1,
1.036801, 0.5590456, 1.582232, 1, 0, 0, 1, 1,
1.042, -1.261992, 2.376726, 1, 0, 0, 1, 1,
1.042429, -0.8906065, 2.482718, 1, 0, 0, 1, 1,
1.043282, -0.5559343, 0.2456802, 0, 0, 0, 1, 1,
1.043351, 0.06946879, 1.610694, 0, 0, 0, 1, 1,
1.046325, 1.532715, 2.133949, 0, 0, 0, 1, 1,
1.052273, 1.834844, -1.507295, 0, 0, 0, 1, 1,
1.052544, 1.43168, -0.2598251, 0, 0, 0, 1, 1,
1.055278, -0.3920683, 0.3173083, 0, 0, 0, 1, 1,
1.057533, 0.6947157, 1.511421, 0, 0, 0, 1, 1,
1.064809, 0.6480975, 0.7281505, 1, 1, 1, 1, 1,
1.065361, 0.1613525, 0.3053633, 1, 1, 1, 1, 1,
1.067396, 1.541978, 1.293613, 1, 1, 1, 1, 1,
1.074483, -0.2133736, 3.137399, 1, 1, 1, 1, 1,
1.074857, 1.06894, 0.2912039, 1, 1, 1, 1, 1,
1.082169, 0.4254199, 1.722484, 1, 1, 1, 1, 1,
1.085085, -1.769711, 2.388136, 1, 1, 1, 1, 1,
1.085637, 2.731265, -0.7722818, 1, 1, 1, 1, 1,
1.086287, -0.6637405, 1.918245, 1, 1, 1, 1, 1,
1.087361, 0.6470692, 1.476895, 1, 1, 1, 1, 1,
1.100122, -0.01584071, 2.43016, 1, 1, 1, 1, 1,
1.104834, 0.8247849, 0.07948422, 1, 1, 1, 1, 1,
1.105053, -1.396831, 2.845886, 1, 1, 1, 1, 1,
1.107763, -0.07121634, 0.5170521, 1, 1, 1, 1, 1,
1.112502, -0.3357713, 1.565335, 1, 1, 1, 1, 1,
1.117818, -0.2990842, 1.331664, 0, 0, 1, 1, 1,
1.119546, 2.33193, 2.066014, 1, 0, 0, 1, 1,
1.12975, -0.8704641, 0.6046258, 1, 0, 0, 1, 1,
1.129912, 0.6086025, 0.6645621, 1, 0, 0, 1, 1,
1.138402, -0.1311296, 2.167512, 1, 0, 0, 1, 1,
1.142467, -0.5853676, 1.674758, 1, 0, 0, 1, 1,
1.150617, -0.948566, 2.078003, 0, 0, 0, 1, 1,
1.164518, -1.075413, 2.72578, 0, 0, 0, 1, 1,
1.164657, 2.28538, -0.450039, 0, 0, 0, 1, 1,
1.167666, -1.03621, 2.588935, 0, 0, 0, 1, 1,
1.173104, 0.9706939, 1.760022, 0, 0, 0, 1, 1,
1.175956, -0.5525878, 3.114987, 0, 0, 0, 1, 1,
1.182877, 1.368804, -0.8337926, 0, 0, 0, 1, 1,
1.183158, -0.7561594, 1.432053, 1, 1, 1, 1, 1,
1.184152, 0.0322596, 2.129799, 1, 1, 1, 1, 1,
1.184335, 0.5451363, 0.8016557, 1, 1, 1, 1, 1,
1.186872, 0.5627031, 0.56432, 1, 1, 1, 1, 1,
1.190956, 1.637651, -0.3526737, 1, 1, 1, 1, 1,
1.192236, -0.1427414, 2.36117, 1, 1, 1, 1, 1,
1.197247, 1.630828, 0.6422471, 1, 1, 1, 1, 1,
1.198784, 0.8503526, 0.7388667, 1, 1, 1, 1, 1,
1.20278, -0.2946404, 1.871338, 1, 1, 1, 1, 1,
1.212556, 0.7970036, 1.162242, 1, 1, 1, 1, 1,
1.224269, -1.15539, 0.9796305, 1, 1, 1, 1, 1,
1.226445, -0.6536527, 2.134946, 1, 1, 1, 1, 1,
1.22788, 0.9483927, 1.1196, 1, 1, 1, 1, 1,
1.234928, 0.4740428, 3.099252, 1, 1, 1, 1, 1,
1.24319, -0.4371815, 0.4453372, 1, 1, 1, 1, 1,
1.250556, -1.948669, 1.428317, 0, 0, 1, 1, 1,
1.253648, 2.720537, 1.4953, 1, 0, 0, 1, 1,
1.259883, 0.3223339, 1.182765, 1, 0, 0, 1, 1,
1.264211, 1.479506, 0.8838375, 1, 0, 0, 1, 1,
1.266728, 1.355521, 2.221494, 1, 0, 0, 1, 1,
1.267288, -0.2761306, 0.9259437, 1, 0, 0, 1, 1,
1.302757, 0.355395, 1.075119, 0, 0, 0, 1, 1,
1.30805, 0.692242, 0.2841432, 0, 0, 0, 1, 1,
1.310019, 0.5773923, 0.8525417, 0, 0, 0, 1, 1,
1.311872, -1.226374, 3.005917, 0, 0, 0, 1, 1,
1.314714, -0.2146844, 1.553666, 0, 0, 0, 1, 1,
1.320431, 1.144298, -0.3866346, 0, 0, 0, 1, 1,
1.329413, -1.235609, 1.910827, 0, 0, 0, 1, 1,
1.331777, -0.4209293, 3.7244, 1, 1, 1, 1, 1,
1.331988, -1.89798, 3.619456, 1, 1, 1, 1, 1,
1.338148, 0.3696774, 2.177477, 1, 1, 1, 1, 1,
1.338972, 3.158077, 1.46982, 1, 1, 1, 1, 1,
1.340431, 1.40636, 0.6987534, 1, 1, 1, 1, 1,
1.344965, -0.1152072, 0.8658996, 1, 1, 1, 1, 1,
1.345341, -2.286977, 1.942997, 1, 1, 1, 1, 1,
1.350786, 0.1831549, 1.354143, 1, 1, 1, 1, 1,
1.352646, 0.6747255, 4.811331, 1, 1, 1, 1, 1,
1.352669, 0.4240196, 0.3453817, 1, 1, 1, 1, 1,
1.3547, -0.2551041, 1.761994, 1, 1, 1, 1, 1,
1.377029, 0.5285196, 1.59346, 1, 1, 1, 1, 1,
1.393175, 0.3294508, 2.580719, 1, 1, 1, 1, 1,
1.3934, 0.7361553, -0.7150661, 1, 1, 1, 1, 1,
1.396726, -0.5562387, 1.711587, 1, 1, 1, 1, 1,
1.398742, 1.505068, -0.16563, 0, 0, 1, 1, 1,
1.400102, -0.6972595, 1.710053, 1, 0, 0, 1, 1,
1.400519, -0.08667273, 1.691094, 1, 0, 0, 1, 1,
1.403938, -0.6520075, 1.590016, 1, 0, 0, 1, 1,
1.408399, 2.359637, -0.1786209, 1, 0, 0, 1, 1,
1.427988, 0.1885914, 1.18199, 1, 0, 0, 1, 1,
1.436077, 0.2121359, 2.102875, 0, 0, 0, 1, 1,
1.454074, 0.8789151, 0.6364747, 0, 0, 0, 1, 1,
1.465487, -0.4440146, 1.11838, 0, 0, 0, 1, 1,
1.469161, -0.2367463, 0.09231242, 0, 0, 0, 1, 1,
1.470378, -0.07640207, 1.311427, 0, 0, 0, 1, 1,
1.476873, -0.2078214, 1.730889, 0, 0, 0, 1, 1,
1.478339, -0.2841924, 0.944068, 0, 0, 0, 1, 1,
1.498567, -0.1913856, 1.603222, 1, 1, 1, 1, 1,
1.508745, -1.712284, 2.5112, 1, 1, 1, 1, 1,
1.513327, 0.707483, 2.137959, 1, 1, 1, 1, 1,
1.51617, -0.3707666, 1.82916, 1, 1, 1, 1, 1,
1.523806, 1.162277, 0.08565544, 1, 1, 1, 1, 1,
1.527228, -0.5065809, 1.569538, 1, 1, 1, 1, 1,
1.535497, 1.82605, -0.4239155, 1, 1, 1, 1, 1,
1.537326, -0.05104836, 1.118084, 1, 1, 1, 1, 1,
1.537876, 0.8053336, 2.185451, 1, 1, 1, 1, 1,
1.539348, 0.8967454, 1.089634, 1, 1, 1, 1, 1,
1.549885, -1.121755, 1.702622, 1, 1, 1, 1, 1,
1.57747, -0.2093184, 1.444037, 1, 1, 1, 1, 1,
1.595092, -0.6303444, 1.428037, 1, 1, 1, 1, 1,
1.615605, 0.4937952, 1.296952, 1, 1, 1, 1, 1,
1.616614, 1.63875, 1.033635, 1, 1, 1, 1, 1,
1.617502, 0.6263383, 2.533554, 0, 0, 1, 1, 1,
1.64156, 0.1391813, 1.507349, 1, 0, 0, 1, 1,
1.662092, 0.2426065, 1.7594, 1, 0, 0, 1, 1,
1.671777, -0.4434532, 1.954382, 1, 0, 0, 1, 1,
1.691023, -0.6701779, 1.530627, 1, 0, 0, 1, 1,
1.706726, 0.2940502, 2.499189, 1, 0, 0, 1, 1,
1.707608, -0.543602, 1.027376, 0, 0, 0, 1, 1,
1.742196, -0.02107712, 2.528373, 0, 0, 0, 1, 1,
1.749975, 0.6205997, -0.1542874, 0, 0, 0, 1, 1,
1.750588, 1.188325, 2.858166, 0, 0, 0, 1, 1,
1.754935, 0.4551708, 1.302274, 0, 0, 0, 1, 1,
1.7608, -0.3715886, 1.305729, 0, 0, 0, 1, 1,
1.783286, -1.383278, 2.241102, 0, 0, 0, 1, 1,
1.789263, 0.5838475, 1.207364, 1, 1, 1, 1, 1,
1.811633, -0.62901, 3.23042, 1, 1, 1, 1, 1,
1.840946, -1.136617, 1.116984, 1, 1, 1, 1, 1,
1.844432, -0.3484743, 1.289021, 1, 1, 1, 1, 1,
1.84882, 0.9077618, -0.2930187, 1, 1, 1, 1, 1,
1.851409, -0.6540112, 2.199938, 1, 1, 1, 1, 1,
1.858625, 1.485329, 1.404313, 1, 1, 1, 1, 1,
1.880051, -0.2972619, 1.113515, 1, 1, 1, 1, 1,
1.89935, -0.08147166, 0.6205496, 1, 1, 1, 1, 1,
1.906882, 1.096511, -0.07124147, 1, 1, 1, 1, 1,
1.907984, -1.562151, 2.798764, 1, 1, 1, 1, 1,
1.921428, 0.1278232, 2.061818, 1, 1, 1, 1, 1,
1.991793, 1.235067, 0.6959276, 1, 1, 1, 1, 1,
2.014526, -0.1436149, 2.305693, 1, 1, 1, 1, 1,
2.036058, -0.2520345, 0.967191, 1, 1, 1, 1, 1,
2.036712, 0.4494572, -0.1769546, 0, 0, 1, 1, 1,
2.082959, -0.5569496, 2.048976, 1, 0, 0, 1, 1,
2.096746, 1.450317, 0.101287, 1, 0, 0, 1, 1,
2.100233, 0.8436651, -0.09795532, 1, 0, 0, 1, 1,
2.101629, 0.02587079, 3.166454, 1, 0, 0, 1, 1,
2.116194, -1.390107, 1.847806, 1, 0, 0, 1, 1,
2.213193, -1.26779, 2.244564, 0, 0, 0, 1, 1,
2.213625, 1.57741, -1.024344, 0, 0, 0, 1, 1,
2.224286, 0.7634574, 1.520556, 0, 0, 0, 1, 1,
2.266859, 1.91622, 2.077714, 0, 0, 0, 1, 1,
2.334142, -0.05506862, 1.991273, 0, 0, 0, 1, 1,
2.368501, -1.179865, 3.273472, 0, 0, 0, 1, 1,
2.590523, 0.4357542, 1.588807, 0, 0, 0, 1, 1,
2.630955, -0.6719607, 2.819574, 1, 1, 1, 1, 1,
2.696637, 0.5510735, 0.994647, 1, 1, 1, 1, 1,
2.747416, -1.168947, 0.8388346, 1, 1, 1, 1, 1,
2.775676, -1.079106, 1.552825, 1, 1, 1, 1, 1,
2.781434, 1.613113, 0.7927622, 1, 1, 1, 1, 1,
2.804035, 3.12476, 0.3481721, 1, 1, 1, 1, 1,
2.899436, -2.691366, 1.580712, 1, 1, 1, 1, 1
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
var radius = 9.385892;
var distance = 32.96755;
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
mvMatrix.translate( 0.2463725, 0.1763473, 0.05365849 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.96755);
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
