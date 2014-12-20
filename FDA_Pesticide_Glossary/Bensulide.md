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
-3.124496, -1.307379, -3.916602, 1, 0, 0, 1,
-2.902351, -0.5405325, -1.592529, 1, 0.007843138, 0, 1,
-2.793437, 0.3610278, -1.605953, 1, 0.01176471, 0, 1,
-2.740791, -1.635252, -3.291843, 1, 0.01960784, 0, 1,
-2.547254, -0.07794645, -0.3550209, 1, 0.02352941, 0, 1,
-2.514678, 2.067532, -0.06660939, 1, 0.03137255, 0, 1,
-2.416526, 2.050099, 0.6101476, 1, 0.03529412, 0, 1,
-2.374765, 1.024653, -0.3540769, 1, 0.04313726, 0, 1,
-2.370011, 0.8210166, -1.059786, 1, 0.04705882, 0, 1,
-2.302691, 1.595285, -1.542507, 1, 0.05490196, 0, 1,
-2.262458, -1.089344, -1.596763, 1, 0.05882353, 0, 1,
-2.24891, 0.4475622, -0.7449051, 1, 0.06666667, 0, 1,
-2.224367, 0.007554278, -1.145337, 1, 0.07058824, 0, 1,
-2.169873, 0.4789123, -1.230117, 1, 0.07843138, 0, 1,
-2.161681, 1.537699, -1.853884, 1, 0.08235294, 0, 1,
-2.15739, -0.4297316, -1.845552, 1, 0.09019608, 0, 1,
-2.088894, -1.427742, -3.299078, 1, 0.09411765, 0, 1,
-2.050885, -0.4385475, -3.086715, 1, 0.1019608, 0, 1,
-2.041026, -1.494271, -3.082613, 1, 0.1098039, 0, 1,
-2.0341, 0.3503452, -3.156385, 1, 0.1137255, 0, 1,
-2.032166, -0.8027524, -2.654746, 1, 0.1215686, 0, 1,
-2.024468, 2.464838, -0.3886086, 1, 0.1254902, 0, 1,
-2.004642, -0.8050979, -1.515808, 1, 0.1333333, 0, 1,
-1.985445, -2.370479, -1.378096, 1, 0.1372549, 0, 1,
-1.984578, 0.2194902, -0.3596685, 1, 0.145098, 0, 1,
-1.947746, -1.141309, -1.828282, 1, 0.1490196, 0, 1,
-1.918975, 1.386908, -1.541337, 1, 0.1568628, 0, 1,
-1.908597, -0.6790576, -1.828774, 1, 0.1607843, 0, 1,
-1.898415, 0.09631059, -1.160821, 1, 0.1686275, 0, 1,
-1.889724, -2.151073, -1.70453, 1, 0.172549, 0, 1,
-1.876179, -0.6001495, -0.7166638, 1, 0.1803922, 0, 1,
-1.867842, 0.2482663, -0.4089238, 1, 0.1843137, 0, 1,
-1.867148, 2.85222, 0.02776495, 1, 0.1921569, 0, 1,
-1.829129, -0.04246873, -2.555964, 1, 0.1960784, 0, 1,
-1.820228, -0.02903987, -1.938486, 1, 0.2039216, 0, 1,
-1.809386, 1.496196, -0.1799526, 1, 0.2117647, 0, 1,
-1.807604, 0.6353092, -1.16633, 1, 0.2156863, 0, 1,
-1.80617, 0.07784697, -3.070552, 1, 0.2235294, 0, 1,
-1.756359, -0.381144, -0.07422445, 1, 0.227451, 0, 1,
-1.746632, -1.167938, -2.533716, 1, 0.2352941, 0, 1,
-1.730057, 0.9954882, -0.6526566, 1, 0.2392157, 0, 1,
-1.728873, 0.05068736, -1.663741, 1, 0.2470588, 0, 1,
-1.711653, -0.2808014, -1.293155, 1, 0.2509804, 0, 1,
-1.707523, 0.5062745, -0.3990271, 1, 0.2588235, 0, 1,
-1.706788, 0.3874731, -0.5376815, 1, 0.2627451, 0, 1,
-1.690691, -0.01132353, -1.017498, 1, 0.2705882, 0, 1,
-1.68875, -0.4680919, -2.164234, 1, 0.2745098, 0, 1,
-1.682911, -1.446285, -2.979181, 1, 0.282353, 0, 1,
-1.66938, -0.07760698, -2.424998, 1, 0.2862745, 0, 1,
-1.665212, 0.6103582, 0.643305, 1, 0.2941177, 0, 1,
-1.660884, -1.554763, -3.028551, 1, 0.3019608, 0, 1,
-1.657155, 0.1684704, -1.632656, 1, 0.3058824, 0, 1,
-1.650458, -2.197694, -1.64616, 1, 0.3137255, 0, 1,
-1.643884, 0.8876812, -1.114007, 1, 0.3176471, 0, 1,
-1.63892, -0.3900525, -1.541347, 1, 0.3254902, 0, 1,
-1.634574, 0.01742866, -4.224909, 1, 0.3294118, 0, 1,
-1.63421, -0.4863963, -1.269101, 1, 0.3372549, 0, 1,
-1.622094, -0.006131545, -3.258778, 1, 0.3411765, 0, 1,
-1.617952, -0.3934811, -0.5413812, 1, 0.3490196, 0, 1,
-1.600502, 0.798362, -0.7438782, 1, 0.3529412, 0, 1,
-1.595881, -0.3494046, -1.704717, 1, 0.3607843, 0, 1,
-1.592257, -0.3867807, 0.4867521, 1, 0.3647059, 0, 1,
-1.590642, 0.9755384, 1.192231, 1, 0.372549, 0, 1,
-1.579626, 0.2416116, -1.997049, 1, 0.3764706, 0, 1,
-1.57634, -0.03076372, -1.818, 1, 0.3843137, 0, 1,
-1.559283, 0.519732, -3.306016, 1, 0.3882353, 0, 1,
-1.556552, -1.149554, -0.9319849, 1, 0.3960784, 0, 1,
-1.553836, -0.3703386, -1.593307, 1, 0.4039216, 0, 1,
-1.552716, 0.3125535, -1.109553, 1, 0.4078431, 0, 1,
-1.542721, -0.8991668, -1.746659, 1, 0.4156863, 0, 1,
-1.535331, -0.8082494, -0.4784832, 1, 0.4196078, 0, 1,
-1.533829, -1.73442, -2.269178, 1, 0.427451, 0, 1,
-1.532926, -0.4564117, -1.298309, 1, 0.4313726, 0, 1,
-1.510556, -0.8990992, -1.212905, 1, 0.4392157, 0, 1,
-1.507287, 0.08651257, -0.9540343, 1, 0.4431373, 0, 1,
-1.501773, -0.8887926, -2.607404, 1, 0.4509804, 0, 1,
-1.499509, 0.1694932, -1.455272, 1, 0.454902, 0, 1,
-1.493952, -0.3854966, -1.881911, 1, 0.4627451, 0, 1,
-1.488965, 0.6771477, -1.07156, 1, 0.4666667, 0, 1,
-1.484547, -0.1244443, -2.56094, 1, 0.4745098, 0, 1,
-1.48279, 0.5904384, -0.1426652, 1, 0.4784314, 0, 1,
-1.476558, -0.8470297, -1.155697, 1, 0.4862745, 0, 1,
-1.47523, -0.668687, -1.941151, 1, 0.4901961, 0, 1,
-1.462262, 1.679271, -2.316322, 1, 0.4980392, 0, 1,
-1.455328, 1.460712, -1.434198, 1, 0.5058824, 0, 1,
-1.447636, -0.264698, -3.392837, 1, 0.509804, 0, 1,
-1.444216, 0.8850606, -1.545925, 1, 0.5176471, 0, 1,
-1.441484, -1.25005, -3.482488, 1, 0.5215687, 0, 1,
-1.438014, 1.146451, -2.183248, 1, 0.5294118, 0, 1,
-1.436631, 0.2393727, -2.678213, 1, 0.5333334, 0, 1,
-1.413609, -0.1032856, -2.482575, 1, 0.5411765, 0, 1,
-1.412919, 1.525459, -2.059779, 1, 0.5450981, 0, 1,
-1.405223, -0.9476097, -4.979678, 1, 0.5529412, 0, 1,
-1.397488, 0.9851699, -2.686316, 1, 0.5568628, 0, 1,
-1.395246, -1.040398, -2.709117, 1, 0.5647059, 0, 1,
-1.391186, 1.395255, -1.428694, 1, 0.5686275, 0, 1,
-1.382563, -1.163449, -3.015502, 1, 0.5764706, 0, 1,
-1.380554, -0.6245701, -3.033279, 1, 0.5803922, 0, 1,
-1.377751, 1.847936, -2.271251, 1, 0.5882353, 0, 1,
-1.375554, 1.40272, -0.1694182, 1, 0.5921569, 0, 1,
-1.341346, 0.238591, -2.439201, 1, 0.6, 0, 1,
-1.334195, 0.172618, -1.456029, 1, 0.6078432, 0, 1,
-1.315834, 0.4000607, -1.756428, 1, 0.6117647, 0, 1,
-1.314777, -0.4748967, -0.8456399, 1, 0.6196079, 0, 1,
-1.314485, 0.1980013, -1.233553, 1, 0.6235294, 0, 1,
-1.29572, 0.2493287, 0.5049306, 1, 0.6313726, 0, 1,
-1.288655, 1.544846, -1.140824, 1, 0.6352941, 0, 1,
-1.284513, 1.972958, -1.826982, 1, 0.6431373, 0, 1,
-1.281655, 0.03580488, 0.07235357, 1, 0.6470588, 0, 1,
-1.278989, -1.369791, -1.789998, 1, 0.654902, 0, 1,
-1.272045, 1.726738, 0.3982355, 1, 0.6588235, 0, 1,
-1.270517, 1.386732, -2.102327, 1, 0.6666667, 0, 1,
-1.255819, -0.343386, -2.013732, 1, 0.6705883, 0, 1,
-1.255439, 0.0005987557, -0.002230817, 1, 0.6784314, 0, 1,
-1.252464, -1.661239, -1.973186, 1, 0.682353, 0, 1,
-1.247102, 0.129687, -1.021464, 1, 0.6901961, 0, 1,
-1.246924, -1.016982, -2.888282, 1, 0.6941177, 0, 1,
-1.242446, -1.025856, -2.349029, 1, 0.7019608, 0, 1,
-1.233778, 1.413658, -1.68114, 1, 0.7098039, 0, 1,
-1.211951, 0.0208783, -1.629145, 1, 0.7137255, 0, 1,
-1.207444, -0.9274765, -1.345262, 1, 0.7215686, 0, 1,
-1.202926, 1.51447, 0.1742738, 1, 0.7254902, 0, 1,
-1.199702, -0.7593362, -3.632432, 1, 0.7333333, 0, 1,
-1.197082, 0.4758289, -1.82948, 1, 0.7372549, 0, 1,
-1.196933, -1.268112, -2.559073, 1, 0.7450981, 0, 1,
-1.185097, 0.6780561, -1.389212, 1, 0.7490196, 0, 1,
-1.184012, -0.392086, -1.580161, 1, 0.7568628, 0, 1,
-1.181856, 0.8729008, -0.6788488, 1, 0.7607843, 0, 1,
-1.180692, 0.8685822, -1.636387, 1, 0.7686275, 0, 1,
-1.171299, 0.229245, -1.921585, 1, 0.772549, 0, 1,
-1.16789, -0.09713264, -2.34009, 1, 0.7803922, 0, 1,
-1.16662, -2.805022, -3.735427, 1, 0.7843137, 0, 1,
-1.163457, -1.459785, -2.076537, 1, 0.7921569, 0, 1,
-1.160637, -2.167754, -2.740967, 1, 0.7960784, 0, 1,
-1.15956, -0.8004378, -2.712724, 1, 0.8039216, 0, 1,
-1.152689, -0.2622148, -1.149065, 1, 0.8117647, 0, 1,
-1.151428, -0.3832274, -1.732831, 1, 0.8156863, 0, 1,
-1.148032, 0.4966196, -3.208167, 1, 0.8235294, 0, 1,
-1.141513, 2.018748, -0.4238869, 1, 0.827451, 0, 1,
-1.140758, -0.1091238, -1.585053, 1, 0.8352941, 0, 1,
-1.133026, 0.03437066, -0.828098, 1, 0.8392157, 0, 1,
-1.125465, 0.570456, -1.345538, 1, 0.8470588, 0, 1,
-1.119696, -0.1459031, -2.729347, 1, 0.8509804, 0, 1,
-1.119002, -0.04239287, -0.9756357, 1, 0.8588235, 0, 1,
-1.110183, 0.9767643, -0.3359922, 1, 0.8627451, 0, 1,
-1.110051, -0.492426, -0.7124817, 1, 0.8705882, 0, 1,
-1.105695, 1.756318, 0.205971, 1, 0.8745098, 0, 1,
-1.098311, -0.1339856, -2.689419, 1, 0.8823529, 0, 1,
-1.097975, 0.6242349, -0.4151275, 1, 0.8862745, 0, 1,
-1.096162, -0.9710667, -2.591033, 1, 0.8941177, 0, 1,
-1.085911, -0.01683891, -0.2728029, 1, 0.8980392, 0, 1,
-1.07729, -1.457153, -1.795573, 1, 0.9058824, 0, 1,
-1.072619, 0.6719229, -2.261359, 1, 0.9137255, 0, 1,
-1.06903, -1.429331, -1.582387, 1, 0.9176471, 0, 1,
-1.066994, 0.6917571, -0.5746658, 1, 0.9254902, 0, 1,
-1.060503, -2.084143, -1.087908, 1, 0.9294118, 0, 1,
-1.059521, 0.5288379, -0.1659342, 1, 0.9372549, 0, 1,
-1.054779, 0.9201418, -1.056698, 1, 0.9411765, 0, 1,
-1.052237, -1.534186, -3.795227, 1, 0.9490196, 0, 1,
-1.052064, -1.064882, -1.820566, 1, 0.9529412, 0, 1,
-1.050166, -1.081222, -3.239354, 1, 0.9607843, 0, 1,
-1.0493, 0.5992585, -0.7388939, 1, 0.9647059, 0, 1,
-1.048981, -1.333256, -1.602871, 1, 0.972549, 0, 1,
-1.047187, -0.363133, -0.5145837, 1, 0.9764706, 0, 1,
-1.047114, -0.2132943, -2.475999, 1, 0.9843137, 0, 1,
-1.030638, 1.135853, -0.7694809, 1, 0.9882353, 0, 1,
-1.024909, 0.340263, -1.244998, 1, 0.9960784, 0, 1,
-1.014061, 0.4125444, -2.151994, 0.9960784, 1, 0, 1,
-1.00687, -0.0452113, -1.2265, 0.9921569, 1, 0, 1,
-1.006229, -0.8312573, -2.966545, 0.9843137, 1, 0, 1,
-1.00512, 0.6343691, -2.303754, 0.9803922, 1, 0, 1,
-1.000231, 1.143718, -1.699186, 0.972549, 1, 0, 1,
-0.9960329, -0.8753342, -1.223279, 0.9686275, 1, 0, 1,
-0.9847994, 0.7621624, -0.7681277, 0.9607843, 1, 0, 1,
-0.9782497, 0.8179011, -1.370239, 0.9568627, 1, 0, 1,
-0.9726474, 0.0613527, -1.74696, 0.9490196, 1, 0, 1,
-0.970297, -1.017268, -2.415902, 0.945098, 1, 0, 1,
-0.9675626, -0.2547702, -2.11469, 0.9372549, 1, 0, 1,
-0.9454482, 1.047865, -1.591091, 0.9333333, 1, 0, 1,
-0.9442773, 0.1536218, -1.182989, 0.9254902, 1, 0, 1,
-0.934021, 0.23112, -1.240739, 0.9215686, 1, 0, 1,
-0.9298226, -1.081243, -1.197831, 0.9137255, 1, 0, 1,
-0.9284155, -0.5345154, -1.724665, 0.9098039, 1, 0, 1,
-0.9247634, -0.7953993, -1.987454, 0.9019608, 1, 0, 1,
-0.9216012, 1.244792, 0.394504, 0.8941177, 1, 0, 1,
-0.9192095, -0.338239, -1.682754, 0.8901961, 1, 0, 1,
-0.9153001, -0.1988353, -0.3579158, 0.8823529, 1, 0, 1,
-0.9080909, 0.2682323, -1.872826, 0.8784314, 1, 0, 1,
-0.9056796, -0.7172351, -3.462374, 0.8705882, 1, 0, 1,
-0.9005045, -0.8757279, -3.31618, 0.8666667, 1, 0, 1,
-0.8965775, 0.5793684, -2.179525, 0.8588235, 1, 0, 1,
-0.8906644, 0.8314664, -0.886826, 0.854902, 1, 0, 1,
-0.8840909, 0.2328401, -2.401656, 0.8470588, 1, 0, 1,
-0.8832102, 1.176073, 0.8876529, 0.8431373, 1, 0, 1,
-0.8802325, 0.1970579, 0.6541611, 0.8352941, 1, 0, 1,
-0.8786606, 0.1045663, -1.265355, 0.8313726, 1, 0, 1,
-0.8754806, 0.8031048, 0.8042501, 0.8235294, 1, 0, 1,
-0.8717759, 1.339892, -0.8728995, 0.8196079, 1, 0, 1,
-0.8690886, -0.6549666, -1.677067, 0.8117647, 1, 0, 1,
-0.868991, 0.4072548, -1.453776, 0.8078431, 1, 0, 1,
-0.8676952, -0.558868, -4.93071, 0.8, 1, 0, 1,
-0.8662546, 0.6472019, -2.190464, 0.7921569, 1, 0, 1,
-0.8646916, -1.91123, -3.0451, 0.7882353, 1, 0, 1,
-0.8586429, 1.989664, -0.7545542, 0.7803922, 1, 0, 1,
-0.8501164, -0.3236733, -1.700388, 0.7764706, 1, 0, 1,
-0.8348294, -1.106746, -3.532407, 0.7686275, 1, 0, 1,
-0.8337664, -0.8287122, -1.761535, 0.7647059, 1, 0, 1,
-0.8220425, -0.8102776, -1.940271, 0.7568628, 1, 0, 1,
-0.8153214, -0.2334527, -1.422588, 0.7529412, 1, 0, 1,
-0.814469, 0.9040596, -1.229211, 0.7450981, 1, 0, 1,
-0.8118486, -0.0457126, -1.875527, 0.7411765, 1, 0, 1,
-0.8091113, -0.629767, -1.853323, 0.7333333, 1, 0, 1,
-0.8061462, 0.7767622, -0.8369754, 0.7294118, 1, 0, 1,
-0.8044334, 0.2559985, -0.8556965, 0.7215686, 1, 0, 1,
-0.7988224, 0.3838544, -0.7719221, 0.7176471, 1, 0, 1,
-0.7974389, -0.4489938, -2.842781, 0.7098039, 1, 0, 1,
-0.7910839, 0.9311239, 0.05606335, 0.7058824, 1, 0, 1,
-0.7844709, -1.423668, -3.040054, 0.6980392, 1, 0, 1,
-0.780566, -0.7998888, -3.726017, 0.6901961, 1, 0, 1,
-0.7767128, -1.032412, -1.269084, 0.6862745, 1, 0, 1,
-0.7749029, 0.3274566, -1.687005, 0.6784314, 1, 0, 1,
-0.7675161, -0.4701124, -0.427711, 0.6745098, 1, 0, 1,
-0.7655674, 0.6205015, -2.14, 0.6666667, 1, 0, 1,
-0.7619016, -0.6415203, -1.489995, 0.6627451, 1, 0, 1,
-0.7582348, -0.488468, -0.8046103, 0.654902, 1, 0, 1,
-0.7559606, -0.1876247, -2.070976, 0.6509804, 1, 0, 1,
-0.7534438, -0.09243014, -0.03166252, 0.6431373, 1, 0, 1,
-0.753014, 2.191582, -1.958122, 0.6392157, 1, 0, 1,
-0.7489405, 1.129008, -1.213929, 0.6313726, 1, 0, 1,
-0.7481726, 0.6127136, -1.945674, 0.627451, 1, 0, 1,
-0.7418504, 0.3494152, -1.955837, 0.6196079, 1, 0, 1,
-0.7333139, 0.1817178, -0.9034628, 0.6156863, 1, 0, 1,
-0.7328082, 1.17079, -0.2141125, 0.6078432, 1, 0, 1,
-0.7289081, -0.8987336, -1.354668, 0.6039216, 1, 0, 1,
-0.7230315, -0.7819121, -3.010328, 0.5960785, 1, 0, 1,
-0.7217924, -1.522254, -2.117357, 0.5882353, 1, 0, 1,
-0.7166204, 0.3590978, -1.234593, 0.5843138, 1, 0, 1,
-0.713064, -0.4847536, -3.908322, 0.5764706, 1, 0, 1,
-0.7130159, 1.669501, -1.006717, 0.572549, 1, 0, 1,
-0.7103662, -1.319663, -2.394667, 0.5647059, 1, 0, 1,
-0.7100604, -0.9098175, -1.891468, 0.5607843, 1, 0, 1,
-0.7090427, -0.5389417, -2.219062, 0.5529412, 1, 0, 1,
-0.7089118, -0.02978454, -0.8647237, 0.5490196, 1, 0, 1,
-0.6935322, -0.5811201, -1.618832, 0.5411765, 1, 0, 1,
-0.6827014, -1.126814, -1.590685, 0.5372549, 1, 0, 1,
-0.6821102, 0.1854532, -1.9832, 0.5294118, 1, 0, 1,
-0.6819311, -1.011415, -3.044532, 0.5254902, 1, 0, 1,
-0.6806998, 0.00206453, -2.076953, 0.5176471, 1, 0, 1,
-0.67805, -0.386059, -0.7435871, 0.5137255, 1, 0, 1,
-0.6765812, 0.4056405, -1.312047, 0.5058824, 1, 0, 1,
-0.6725038, 0.6543394, -1.42914, 0.5019608, 1, 0, 1,
-0.6710248, 0.6714619, -0.943087, 0.4941176, 1, 0, 1,
-0.6653627, 0.1962615, -1.554063, 0.4862745, 1, 0, 1,
-0.6649987, 0.05768499, -1.757495, 0.4823529, 1, 0, 1,
-0.6610821, -0.1784319, -2.472549, 0.4745098, 1, 0, 1,
-0.6554385, 0.1984324, -2.843325, 0.4705882, 1, 0, 1,
-0.6547788, 0.8957094, 1.07703, 0.4627451, 1, 0, 1,
-0.6502103, 1.30784, 0.3126794, 0.4588235, 1, 0, 1,
-0.6492438, -0.1769065, -0.5199654, 0.4509804, 1, 0, 1,
-0.6491657, -0.5030451, -2.992881, 0.4470588, 1, 0, 1,
-0.6451278, -1.59813, -2.184304, 0.4392157, 1, 0, 1,
-0.6440306, -1.218958, -3.810646, 0.4352941, 1, 0, 1,
-0.6438972, -0.9334478, -3.13097, 0.427451, 1, 0, 1,
-0.6258851, -0.6747546, -2.562555, 0.4235294, 1, 0, 1,
-0.6237094, 1.15973, -2.122649, 0.4156863, 1, 0, 1,
-0.6235478, 0.4437785, -1.700412, 0.4117647, 1, 0, 1,
-0.6188931, -0.007295754, -1.017525, 0.4039216, 1, 0, 1,
-0.6170101, -1.222116, -1.487402, 0.3960784, 1, 0, 1,
-0.609277, -0.2261079, -2.896824, 0.3921569, 1, 0, 1,
-0.6081758, -0.8988298, -4.42334, 0.3843137, 1, 0, 1,
-0.6073701, -1.036037, -2.392243, 0.3803922, 1, 0, 1,
-0.6040915, 0.8097785, -0.7040949, 0.372549, 1, 0, 1,
-0.6037565, 0.6858627, 1.315066, 0.3686275, 1, 0, 1,
-0.6009743, -1.539989, -1.299431, 0.3607843, 1, 0, 1,
-0.5978246, -0.9849054, -0.4634675, 0.3568628, 1, 0, 1,
-0.5944577, 0.5409203, -0.2624909, 0.3490196, 1, 0, 1,
-0.5931059, 0.4078733, -1.630985, 0.345098, 1, 0, 1,
-0.5892448, -1.99407, -2.588539, 0.3372549, 1, 0, 1,
-0.5864613, 0.5729209, -1.322149, 0.3333333, 1, 0, 1,
-0.5806926, -0.5776473, -2.023251, 0.3254902, 1, 0, 1,
-0.5792685, -0.5383888, -0.5971663, 0.3215686, 1, 0, 1,
-0.5791731, 0.9855561, -2.017967, 0.3137255, 1, 0, 1,
-0.5768923, 1.3189, 0.9008626, 0.3098039, 1, 0, 1,
-0.5762761, -0.2409698, -1.173941, 0.3019608, 1, 0, 1,
-0.5733436, 1.682395, 1.079228, 0.2941177, 1, 0, 1,
-0.5731791, -0.4438919, -1.299013, 0.2901961, 1, 0, 1,
-0.5699238, 0.2498321, -1.425528, 0.282353, 1, 0, 1,
-0.5591727, -0.3827543, -2.37531, 0.2784314, 1, 0, 1,
-0.5580968, -0.6764957, -4.919181, 0.2705882, 1, 0, 1,
-0.5558674, 1.776075, -0.8876641, 0.2666667, 1, 0, 1,
-0.5519389, -0.818287, -3.34919, 0.2588235, 1, 0, 1,
-0.5488063, -0.1526122, -3.413371, 0.254902, 1, 0, 1,
-0.5486842, -0.8874357, -1.691837, 0.2470588, 1, 0, 1,
-0.5445399, -0.3659625, -2.977216, 0.2431373, 1, 0, 1,
-0.5397981, -0.2695459, -4.130315, 0.2352941, 1, 0, 1,
-0.5354378, 0.3789587, -1.130184, 0.2313726, 1, 0, 1,
-0.5350996, -0.8543183, -4.253117, 0.2235294, 1, 0, 1,
-0.5328661, 1.978667, -0.8804226, 0.2196078, 1, 0, 1,
-0.529655, -0.7346647, -3.07014, 0.2117647, 1, 0, 1,
-0.5289422, -1.174752, -4.810177, 0.2078431, 1, 0, 1,
-0.526111, 0.2619025, -2.171577, 0.2, 1, 0, 1,
-0.5227023, -0.5954947, -2.021833, 0.1921569, 1, 0, 1,
-0.5218593, -1.734877, -3.369865, 0.1882353, 1, 0, 1,
-0.5209213, -0.466465, -0.8900277, 0.1803922, 1, 0, 1,
-0.5207034, -0.0842851, -1.092344, 0.1764706, 1, 0, 1,
-0.5153919, -0.4153791, -3.65836, 0.1686275, 1, 0, 1,
-0.5132338, -0.6930634, -2.121528, 0.1647059, 1, 0, 1,
-0.5077276, 1.183609, -1.081829, 0.1568628, 1, 0, 1,
-0.5057719, 0.2553413, -1.613636, 0.1529412, 1, 0, 1,
-0.5003482, 1.018385, -1.49068, 0.145098, 1, 0, 1,
-0.4987517, -2.371322, -3.544079, 0.1411765, 1, 0, 1,
-0.4973813, -0.0325212, -1.444891, 0.1333333, 1, 0, 1,
-0.4913, 1.275589, -0.3886538, 0.1294118, 1, 0, 1,
-0.4886053, -0.1730195, -3.363293, 0.1215686, 1, 0, 1,
-0.4845124, -1.233622, -3.385609, 0.1176471, 1, 0, 1,
-0.4816534, -1.524988, -3.486011, 0.1098039, 1, 0, 1,
-0.47657, 0.2372049, -2.382578, 0.1058824, 1, 0, 1,
-0.4755509, -1.101246, -2.713635, 0.09803922, 1, 0, 1,
-0.4753933, 0.4273067, -1.993914, 0.09019608, 1, 0, 1,
-0.4749126, -0.5885068, -2.514601, 0.08627451, 1, 0, 1,
-0.4731958, -1.097288, -2.458956, 0.07843138, 1, 0, 1,
-0.4711694, 0.5117697, -0.2367032, 0.07450981, 1, 0, 1,
-0.4689977, 0.752738, -0.883375, 0.06666667, 1, 0, 1,
-0.461979, -1.838117, -3.291115, 0.0627451, 1, 0, 1,
-0.4615957, -0.2409509, -2.60525, 0.05490196, 1, 0, 1,
-0.46105, 0.2661098, -0.9502724, 0.05098039, 1, 0, 1,
-0.4600373, 0.6375834, -0.1251369, 0.04313726, 1, 0, 1,
-0.4594035, 0.5620374, -1.816336, 0.03921569, 1, 0, 1,
-0.4581618, -0.9476711, -3.698286, 0.03137255, 1, 0, 1,
-0.4576958, -0.09956209, -2.730265, 0.02745098, 1, 0, 1,
-0.4570637, 1.814322, -0.6558241, 0.01960784, 1, 0, 1,
-0.4545318, 0.6090708, -2.126731, 0.01568628, 1, 0, 1,
-0.4538172, 0.1245604, -1.485985, 0.007843138, 1, 0, 1,
-0.4523747, -0.3702472, -2.496742, 0.003921569, 1, 0, 1,
-0.4512419, -0.2268054, -2.359701, 0, 1, 0.003921569, 1,
-0.450927, -0.3611302, -2.143067, 0, 1, 0.01176471, 1,
-0.446265, -0.5583699, -0.08487069, 0, 1, 0.01568628, 1,
-0.439879, 0.2196696, -2.072382, 0, 1, 0.02352941, 1,
-0.4393079, 0.5763074, -1.277464, 0, 1, 0.02745098, 1,
-0.4340592, -0.08428569, -2.926796, 0, 1, 0.03529412, 1,
-0.4295704, 0.9791762, -1.836794, 0, 1, 0.03921569, 1,
-0.4283427, 0.7105064, -1.12924, 0, 1, 0.04705882, 1,
-0.427259, 0.4604121, -0.01941594, 0, 1, 0.05098039, 1,
-0.4246867, -0.1885131, -0.78253, 0, 1, 0.05882353, 1,
-0.4232625, 0.2984084, 1.870447, 0, 1, 0.0627451, 1,
-0.4202676, 0.5097884, -0.07298748, 0, 1, 0.07058824, 1,
-0.4202474, -0.5754852, -2.89449, 0, 1, 0.07450981, 1,
-0.4146235, -2.031345, -2.860816, 0, 1, 0.08235294, 1,
-0.4137723, -0.5737938, -1.119945, 0, 1, 0.08627451, 1,
-0.4116858, 0.6325322, -0.8174148, 0, 1, 0.09411765, 1,
-0.3986064, 1.804688, -0.3628674, 0, 1, 0.1019608, 1,
-0.3985671, 0.6277809, -1.135189, 0, 1, 0.1058824, 1,
-0.3950697, -0.08670267, -1.078335, 0, 1, 0.1137255, 1,
-0.3947834, -0.1945342, -1.490699, 0, 1, 0.1176471, 1,
-0.3941091, 0.9589908, -0.602866, 0, 1, 0.1254902, 1,
-0.3892093, -1.282839, -3.517291, 0, 1, 0.1294118, 1,
-0.3840796, -0.9448256, -2.332536, 0, 1, 0.1372549, 1,
-0.3819334, -1.479597, -2.608603, 0, 1, 0.1411765, 1,
-0.3727269, -0.5044825, -4.098421, 0, 1, 0.1490196, 1,
-0.3711952, -0.8867471, -2.671139, 0, 1, 0.1529412, 1,
-0.370789, -0.7729468, -2.378432, 0, 1, 0.1607843, 1,
-0.3669171, -1.192583, -1.95293, 0, 1, 0.1647059, 1,
-0.3629063, 0.1629604, 0.6981897, 0, 1, 0.172549, 1,
-0.3591167, 1.662911, -1.360519, 0, 1, 0.1764706, 1,
-0.3588717, -0.8425314, -2.856667, 0, 1, 0.1843137, 1,
-0.355152, 0.4618379, -0.5560681, 0, 1, 0.1882353, 1,
-0.3547698, -1.133124, -1.782343, 0, 1, 0.1960784, 1,
-0.3540169, 1.249896, -0.8987672, 0, 1, 0.2039216, 1,
-0.3534827, -0.977483, -1.746626, 0, 1, 0.2078431, 1,
-0.3504041, -0.2743365, -1.205641, 0, 1, 0.2156863, 1,
-0.3493762, -2.100254, -2.927023, 0, 1, 0.2196078, 1,
-0.3483301, -1.704162, -3.226719, 0, 1, 0.227451, 1,
-0.3427123, -1.024334, -1.85097, 0, 1, 0.2313726, 1,
-0.3416635, 0.8972562, 0.1556817, 0, 1, 0.2392157, 1,
-0.338526, -0.5289841, -3.907558, 0, 1, 0.2431373, 1,
-0.3381271, 1.136122, -0.4004715, 0, 1, 0.2509804, 1,
-0.336586, 2.248814, -0.06872407, 0, 1, 0.254902, 1,
-0.3348374, -0.6855935, -1.432621, 0, 1, 0.2627451, 1,
-0.3332411, 0.6266572, -0.06642263, 0, 1, 0.2666667, 1,
-0.3326306, -1.068475, -4.695088, 0, 1, 0.2745098, 1,
-0.3317257, -0.7823842, -3.715878, 0, 1, 0.2784314, 1,
-0.3307754, -2.178378, -1.578992, 0, 1, 0.2862745, 1,
-0.3269768, -0.2033367, -1.730469, 0, 1, 0.2901961, 1,
-0.3258329, 0.09372135, -1.756838, 0, 1, 0.2980392, 1,
-0.3251062, 0.3743182, 0.3602372, 0, 1, 0.3058824, 1,
-0.3248847, -0.2050613, -0.9179096, 0, 1, 0.3098039, 1,
-0.3241508, 0.2575594, -1.098329, 0, 1, 0.3176471, 1,
-0.3238668, -0.02402111, -1.513101, 0, 1, 0.3215686, 1,
-0.3184519, 1.53997, -1.071898, 0, 1, 0.3294118, 1,
-0.3111975, -1.245961, -2.652165, 0, 1, 0.3333333, 1,
-0.3086798, -1.526346, -2.70703, 0, 1, 0.3411765, 1,
-0.3076199, -0.739481, -2.991647, 0, 1, 0.345098, 1,
-0.3068665, 1.138316, -1.603039, 0, 1, 0.3529412, 1,
-0.3062626, -0.1628667, -2.451013, 0, 1, 0.3568628, 1,
-0.2998222, 0.2655728, -1.302463, 0, 1, 0.3647059, 1,
-0.2903897, 0.4351636, -0.1991008, 0, 1, 0.3686275, 1,
-0.2899596, -0.4504375, -4.092287, 0, 1, 0.3764706, 1,
-0.2895477, 0.7704, -1.840302, 0, 1, 0.3803922, 1,
-0.2888046, -0.8078566, -3.405104, 0, 1, 0.3882353, 1,
-0.2879146, 0.2352915, -1.101481, 0, 1, 0.3921569, 1,
-0.2836926, -1.749633, -0.8970339, 0, 1, 0.4, 1,
-0.2768076, 0.06629284, -0.9913427, 0, 1, 0.4078431, 1,
-0.2755218, 0.1324157, -0.4709098, 0, 1, 0.4117647, 1,
-0.2746958, -0.3837458, -2.382102, 0, 1, 0.4196078, 1,
-0.2735108, -1.081064, -2.715926, 0, 1, 0.4235294, 1,
-0.2710292, 0.5973408, 0.2148172, 0, 1, 0.4313726, 1,
-0.2690642, 0.392613, 0.9860395, 0, 1, 0.4352941, 1,
-0.2690529, -1.348107, -2.491271, 0, 1, 0.4431373, 1,
-0.2650079, 1.491394, -0.8786616, 0, 1, 0.4470588, 1,
-0.2643156, 0.4530352, -1.307642, 0, 1, 0.454902, 1,
-0.2608449, 1.866644, -1.195914, 0, 1, 0.4588235, 1,
-0.2595996, -0.2967278, -3.605501, 0, 1, 0.4666667, 1,
-0.2592527, -0.389373, -2.244096, 0, 1, 0.4705882, 1,
-0.2581784, 0.1548956, -1.848291, 0, 1, 0.4784314, 1,
-0.2579675, -0.9284929, -2.870135, 0, 1, 0.4823529, 1,
-0.2578208, 0.2595969, 0.8076655, 0, 1, 0.4901961, 1,
-0.2525277, -0.9508677, -0.7365869, 0, 1, 0.4941176, 1,
-0.2511185, 0.5570147, 1.180487, 0, 1, 0.5019608, 1,
-0.2503487, 0.6285406, -0.7763505, 0, 1, 0.509804, 1,
-0.2501749, 0.5575705, -0.3850677, 0, 1, 0.5137255, 1,
-0.2466991, 1.046304, -1.66416, 0, 1, 0.5215687, 1,
-0.2456318, 2.18656, 0.31858, 0, 1, 0.5254902, 1,
-0.2448156, -0.1754537, -4.337211, 0, 1, 0.5333334, 1,
-0.2432854, 0.2827134, -0.9506765, 0, 1, 0.5372549, 1,
-0.2397528, -0.3112577, -3.914032, 0, 1, 0.5450981, 1,
-0.2344361, 1.612516, -1.33559, 0, 1, 0.5490196, 1,
-0.2326339, 1.136952, -0.1133575, 0, 1, 0.5568628, 1,
-0.2318154, -2.000639, -3.086427, 0, 1, 0.5607843, 1,
-0.2302867, 0.3438393, -0.05859449, 0, 1, 0.5686275, 1,
-0.2235181, -0.8358413, -1.617506, 0, 1, 0.572549, 1,
-0.220995, -1.260564, -2.80478, 0, 1, 0.5803922, 1,
-0.220474, -1.791001, -3.147277, 0, 1, 0.5843138, 1,
-0.2202445, -0.4784234, -2.434327, 0, 1, 0.5921569, 1,
-0.2086284, -0.1940253, -1.844209, 0, 1, 0.5960785, 1,
-0.2064293, 0.5136951, -0.3524771, 0, 1, 0.6039216, 1,
-0.2007861, 1.208034, 0.07542246, 0, 1, 0.6117647, 1,
-0.2003286, 2.067697, 0.647373, 0, 1, 0.6156863, 1,
-0.1928983, 0.02938104, -1.252618, 0, 1, 0.6235294, 1,
-0.190935, -0.3857751, -2.552327, 0, 1, 0.627451, 1,
-0.1863249, -0.2753204, -2.12271, 0, 1, 0.6352941, 1,
-0.185941, 1.176246, -0.5521501, 0, 1, 0.6392157, 1,
-0.1849393, 1.469507, -0.6765602, 0, 1, 0.6470588, 1,
-0.1848067, 0.2202728, -2.795867, 0, 1, 0.6509804, 1,
-0.1784701, -0.4671358, -2.444558, 0, 1, 0.6588235, 1,
-0.1777079, -0.3288698, -3.247726, 0, 1, 0.6627451, 1,
-0.1763299, 1.251506, -1.136413, 0, 1, 0.6705883, 1,
-0.172198, 0.2292081, -0.5117505, 0, 1, 0.6745098, 1,
-0.1714861, 1.549626, -0.9335802, 0, 1, 0.682353, 1,
-0.1705772, -0.8974069, -2.491065, 0, 1, 0.6862745, 1,
-0.1671511, 2.124358, -1.350403, 0, 1, 0.6941177, 1,
-0.1668182, 0.6296718, -1.256595, 0, 1, 0.7019608, 1,
-0.1661312, 0.04790478, -3.627821, 0, 1, 0.7058824, 1,
-0.161361, 0.7542847, -1.962187, 0, 1, 0.7137255, 1,
-0.1565005, 0.7906659, -0.6087512, 0, 1, 0.7176471, 1,
-0.1550974, -1.495567, -4.31663, 0, 1, 0.7254902, 1,
-0.153982, 0.8267196, 1.235173, 0, 1, 0.7294118, 1,
-0.1537911, 1.462923, 0.7893959, 0, 1, 0.7372549, 1,
-0.1535984, -0.2488505, -1.778673, 0, 1, 0.7411765, 1,
-0.1491608, 0.04525756, -1.924995, 0, 1, 0.7490196, 1,
-0.140018, 0.2314338, 0.9990705, 0, 1, 0.7529412, 1,
-0.1339966, 0.523216, -0.6057286, 0, 1, 0.7607843, 1,
-0.1338788, -0.6022174, -2.206796, 0, 1, 0.7647059, 1,
-0.1322837, 1.538713, 1.183969, 0, 1, 0.772549, 1,
-0.1311472, -0.7249153, -3.448552, 0, 1, 0.7764706, 1,
-0.1279061, -1.503161, -1.510761, 0, 1, 0.7843137, 1,
-0.1100389, -0.3453069, -2.738801, 0, 1, 0.7882353, 1,
-0.1094399, -0.7089725, -2.255085, 0, 1, 0.7960784, 1,
-0.1092892, 0.7071275, 0.05754431, 0, 1, 0.8039216, 1,
-0.1079782, 0.512153, -0.4532453, 0, 1, 0.8078431, 1,
-0.09615175, 0.0356808, -0.06092206, 0, 1, 0.8156863, 1,
-0.09438267, -1.731286, -5.012721, 0, 1, 0.8196079, 1,
-0.09068995, -1.19962, -4.210625, 0, 1, 0.827451, 1,
-0.08395403, 0.4287216, 0.6985785, 0, 1, 0.8313726, 1,
-0.08220415, 1.796623, -0.753251, 0, 1, 0.8392157, 1,
-0.07902832, 0.7139013, -0.2682203, 0, 1, 0.8431373, 1,
-0.07836263, -1.106153, -3.359591, 0, 1, 0.8509804, 1,
-0.07394927, 0.8545716, -0.8811291, 0, 1, 0.854902, 1,
-0.0738518, -0.2921096, -2.355824, 0, 1, 0.8627451, 1,
-0.07007948, 0.05150064, -2.083496, 0, 1, 0.8666667, 1,
-0.06952994, 0.2993184, 1.167235, 0, 1, 0.8745098, 1,
-0.06740116, 0.6445082, 1.344621, 0, 1, 0.8784314, 1,
-0.06076686, 1.011929, -0.8672844, 0, 1, 0.8862745, 1,
-0.05572582, -0.4312689, -2.612389, 0, 1, 0.8901961, 1,
-0.05163933, -2.470618, -3.430487, 0, 1, 0.8980392, 1,
-0.05129855, -0.7617106, -3.616034, 0, 1, 0.9058824, 1,
-0.05018527, -1.434424, -2.41588, 0, 1, 0.9098039, 1,
-0.04768096, -1.078273, -3.469368, 0, 1, 0.9176471, 1,
-0.04645653, 1.546017, 0.2671843, 0, 1, 0.9215686, 1,
-0.04530554, -0.1290219, -3.400572, 0, 1, 0.9294118, 1,
-0.04502598, 1.161426, -0.2476155, 0, 1, 0.9333333, 1,
-0.04104454, 1.991327, -0.2691078, 0, 1, 0.9411765, 1,
-0.03628661, -1.592712, -2.854816, 0, 1, 0.945098, 1,
-0.02780625, -0.2899299, -2.657559, 0, 1, 0.9529412, 1,
-0.02381716, 0.08041499, -1.914292, 0, 1, 0.9568627, 1,
-0.01726413, 2.278779, 0.1265905, 0, 1, 0.9647059, 1,
-0.01310463, 0.09705475, 0.9362367, 0, 1, 0.9686275, 1,
-0.01271654, 0.7309301, 0.3226587, 0, 1, 0.9764706, 1,
-0.01212931, 0.7570291, 0.6517832, 0, 1, 0.9803922, 1,
0.003218936, -0.6710065, 3.011723, 0, 1, 0.9882353, 1,
0.004156637, -1.650398, 3.414689, 0, 1, 0.9921569, 1,
0.01277019, 0.9521064, -0.7520904, 0, 1, 1, 1,
0.01804006, 0.02890494, 0.5120247, 0, 0.9921569, 1, 1,
0.0203828, 1.177925, 0.4403653, 0, 0.9882353, 1, 1,
0.02107398, 0.9060757, -1.012801, 0, 0.9803922, 1, 1,
0.02191911, 0.3317332, 1.090719, 0, 0.9764706, 1, 1,
0.02463137, 0.8532998, -2.292072, 0, 0.9686275, 1, 1,
0.02574491, -0.5799388, 4.053691, 0, 0.9647059, 1, 1,
0.02852553, -0.7110685, 3.678735, 0, 0.9568627, 1, 1,
0.02950036, 2.075126, 0.6745619, 0, 0.9529412, 1, 1,
0.03262104, 1.2869, 0.02579228, 0, 0.945098, 1, 1,
0.03452314, -0.2660774, 3.91492, 0, 0.9411765, 1, 1,
0.03584704, -2.037551, 3.343306, 0, 0.9333333, 1, 1,
0.03731172, 0.151247, 0.021214, 0, 0.9294118, 1, 1,
0.03840289, 0.5941981, 1.388606, 0, 0.9215686, 1, 1,
0.04205056, 1.021466, -1.05543, 0, 0.9176471, 1, 1,
0.04464788, 1.338879, -0.1007684, 0, 0.9098039, 1, 1,
0.04468082, -1.10307, 2.826574, 0, 0.9058824, 1, 1,
0.04539, -0.1712057, 1.988546, 0, 0.8980392, 1, 1,
0.0459097, -0.34094, 2.910794, 0, 0.8901961, 1, 1,
0.04591932, 0.5680999, -0.1959569, 0, 0.8862745, 1, 1,
0.05092882, 2.941965, -2.826905, 0, 0.8784314, 1, 1,
0.054579, 0.1860904, 0.02488806, 0, 0.8745098, 1, 1,
0.05549959, -1.181869, 4.34795, 0, 0.8666667, 1, 1,
0.0580955, 1.008388, -1.770292, 0, 0.8627451, 1, 1,
0.05838772, -0.2587481, 2.707181, 0, 0.854902, 1, 1,
0.05976823, -0.385575, 2.311809, 0, 0.8509804, 1, 1,
0.06000736, -0.09883624, 2.170456, 0, 0.8431373, 1, 1,
0.06362433, -0.01736099, 1.20892, 0, 0.8392157, 1, 1,
0.06902159, -0.7076806, 2.709051, 0, 0.8313726, 1, 1,
0.06997138, -0.4958541, 3.396341, 0, 0.827451, 1, 1,
0.07042658, -1.666514, 2.552103, 0, 0.8196079, 1, 1,
0.07156356, -0.9256039, 3.014907, 0, 0.8156863, 1, 1,
0.08066384, -0.0926028, 1.893563, 0, 0.8078431, 1, 1,
0.08068028, 0.1464683, -0.8694357, 0, 0.8039216, 1, 1,
0.08599553, 0.3791127, -1.281844, 0, 0.7960784, 1, 1,
0.08636391, 0.2441584, 0.2521202, 0, 0.7882353, 1, 1,
0.08936986, -0.9798023, 3.817768, 0, 0.7843137, 1, 1,
0.09106723, 1.506044, 0.9364154, 0, 0.7764706, 1, 1,
0.09198206, 0.5923694, 0.5592626, 0, 0.772549, 1, 1,
0.0959259, -1.349868, 4.789553, 0, 0.7647059, 1, 1,
0.09723704, 1.390897, 0.6163195, 0, 0.7607843, 1, 1,
0.100417, -0.9129035, 4.177704, 0, 0.7529412, 1, 1,
0.1008788, 2.071267, 2.558652, 0, 0.7490196, 1, 1,
0.1056825, -1.63109, 3.98201, 0, 0.7411765, 1, 1,
0.1069003, -0.4802147, 3.127556, 0, 0.7372549, 1, 1,
0.1071759, -0.1001569, 1.64362, 0, 0.7294118, 1, 1,
0.1073237, 0.6723019, -2.027535, 0, 0.7254902, 1, 1,
0.1085393, -0.4265432, 3.354626, 0, 0.7176471, 1, 1,
0.1104579, -0.7777492, 2.752763, 0, 0.7137255, 1, 1,
0.1120558, 0.4339686, 1.066723, 0, 0.7058824, 1, 1,
0.1155846, -0.1567899, 1.580117, 0, 0.6980392, 1, 1,
0.1170365, -0.07290007, 0.756126, 0, 0.6941177, 1, 1,
0.1200203, 0.3290889, 0.9102405, 0, 0.6862745, 1, 1,
0.1263244, -0.2208325, 2.907551, 0, 0.682353, 1, 1,
0.1270715, -0.1608586, 0.3582508, 0, 0.6745098, 1, 1,
0.1332146, -1.313078, 1.857971, 0, 0.6705883, 1, 1,
0.1353107, 0.4522304, 1.487455, 0, 0.6627451, 1, 1,
0.1353277, -0.8341189, 3.657625, 0, 0.6588235, 1, 1,
0.1360733, 0.9208657, -0.04769607, 0, 0.6509804, 1, 1,
0.1382166, 1.728478, 0.8962508, 0, 0.6470588, 1, 1,
0.1384024, -0.7371611, 2.892864, 0, 0.6392157, 1, 1,
0.1384402, -0.6668551, 1.620386, 0, 0.6352941, 1, 1,
0.1400967, -1.811713, 0.5053942, 0, 0.627451, 1, 1,
0.1404092, 0.5213168, 0.5423443, 0, 0.6235294, 1, 1,
0.1422834, -0.9927223, 3.426608, 0, 0.6156863, 1, 1,
0.1430209, 0.1366056, 2.610627, 0, 0.6117647, 1, 1,
0.149297, 0.4199046, 0.6734411, 0, 0.6039216, 1, 1,
0.1500346, -1.184167, 1.965288, 0, 0.5960785, 1, 1,
0.1507044, 1.845723, -0.692763, 0, 0.5921569, 1, 1,
0.1509107, 1.044688, -0.4354693, 0, 0.5843138, 1, 1,
0.1509222, -1.723786, 4.231798, 0, 0.5803922, 1, 1,
0.1656871, -1.363042, 2.722733, 0, 0.572549, 1, 1,
0.1699733, -0.9697996, 1.596357, 0, 0.5686275, 1, 1,
0.1708661, -0.9194334, 3.03903, 0, 0.5607843, 1, 1,
0.173004, -1.557203, 2.876094, 0, 0.5568628, 1, 1,
0.1732273, -0.7751639, 2.467887, 0, 0.5490196, 1, 1,
0.1735586, -0.3883678, 2.980984, 0, 0.5450981, 1, 1,
0.1789164, -2.080921, 2.837027, 0, 0.5372549, 1, 1,
0.1793915, 0.07488326, 2.449115, 0, 0.5333334, 1, 1,
0.1805461, 0.7988537, 0.3655895, 0, 0.5254902, 1, 1,
0.1807584, 0.4437771, 2.177663, 0, 0.5215687, 1, 1,
0.1819558, -0.7810201, 3.140735, 0, 0.5137255, 1, 1,
0.1961956, 0.6847109, -0.08446019, 0, 0.509804, 1, 1,
0.196482, 1.429392, 0.7390621, 0, 0.5019608, 1, 1,
0.1973082, 1.427479, 0.481135, 0, 0.4941176, 1, 1,
0.2070579, 0.1065899, 0.7732905, 0, 0.4901961, 1, 1,
0.2102915, 1.399761, 0.4840771, 0, 0.4823529, 1, 1,
0.2119939, -0.9270433, 2.42026, 0, 0.4784314, 1, 1,
0.2122045, -0.1577488, 2.417814, 0, 0.4705882, 1, 1,
0.2224997, -0.01132196, 0.07665382, 0, 0.4666667, 1, 1,
0.2225961, -0.0742609, 1.163513, 0, 0.4588235, 1, 1,
0.2293517, 0.1186538, 1.267275, 0, 0.454902, 1, 1,
0.2329523, 0.4583825, 0.7528158, 0, 0.4470588, 1, 1,
0.2331336, 0.9842204, 1.9153, 0, 0.4431373, 1, 1,
0.2339124, 0.6430572, 1.1931, 0, 0.4352941, 1, 1,
0.2352246, 0.418007, -0.4032697, 0, 0.4313726, 1, 1,
0.2371048, 0.3206547, 0.5102381, 0, 0.4235294, 1, 1,
0.2379837, 1.058338, 0.5556817, 0, 0.4196078, 1, 1,
0.2396213, 0.1536117, 0.3827146, 0, 0.4117647, 1, 1,
0.2409964, 1.13478, 0.720173, 0, 0.4078431, 1, 1,
0.2445133, 1.983591, 1.758866, 0, 0.4, 1, 1,
0.245203, -0.4069712, 2.333579, 0, 0.3921569, 1, 1,
0.2461692, -0.7814289, 3.064068, 0, 0.3882353, 1, 1,
0.2496012, 0.7206159, 1.058588, 0, 0.3803922, 1, 1,
0.2521104, -0.8129588, 1.723946, 0, 0.3764706, 1, 1,
0.2537315, 1.590371, -0.03690339, 0, 0.3686275, 1, 1,
0.2632808, 0.5048212, 0.4362215, 0, 0.3647059, 1, 1,
0.2711088, -0.1821492, 1.969811, 0, 0.3568628, 1, 1,
0.2714719, 0.1886648, 1.506982, 0, 0.3529412, 1, 1,
0.2768398, -0.4579442, 1.549815, 0, 0.345098, 1, 1,
0.2771624, -0.9022123, 3.461717, 0, 0.3411765, 1, 1,
0.2778444, 0.876535, 0.9586206, 0, 0.3333333, 1, 1,
0.2812827, 0.2504081, 1.471026, 0, 0.3294118, 1, 1,
0.2829537, 1.28148, 0.3199686, 0, 0.3215686, 1, 1,
0.2845303, -0.190459, 1.786887, 0, 0.3176471, 1, 1,
0.2866463, 0.07638571, 1.123742, 0, 0.3098039, 1, 1,
0.2872561, 0.9381692, 0.337207, 0, 0.3058824, 1, 1,
0.2897922, 0.004774929, 1.061841, 0, 0.2980392, 1, 1,
0.2899441, 0.3423131, 0.5280355, 0, 0.2901961, 1, 1,
0.2908181, -0.4359955, 2.470149, 0, 0.2862745, 1, 1,
0.2918926, 0.8809467, 2.070097, 0, 0.2784314, 1, 1,
0.2922065, -0.1764618, 1.124415, 0, 0.2745098, 1, 1,
0.3024116, -1.226742, 3.59144, 0, 0.2666667, 1, 1,
0.3034512, 0.2074577, 1.180162, 0, 0.2627451, 1, 1,
0.3052266, -0.839071, 2.841304, 0, 0.254902, 1, 1,
0.3095353, 1.20389, -0.9221319, 0, 0.2509804, 1, 1,
0.3130152, -0.4855103, 3.486951, 0, 0.2431373, 1, 1,
0.3147606, 1.062284, 0.331743, 0, 0.2392157, 1, 1,
0.3175827, -0.2503494, 2.978834, 0, 0.2313726, 1, 1,
0.3188208, -0.2742457, 2.862962, 0, 0.227451, 1, 1,
0.3196279, 0.4611476, 0.09456588, 0, 0.2196078, 1, 1,
0.321156, -0.521184, 2.592467, 0, 0.2156863, 1, 1,
0.3217937, 1.1546, -0.4385945, 0, 0.2078431, 1, 1,
0.3218612, 2.175262, -0.9796255, 0, 0.2039216, 1, 1,
0.3297779, 1.078873, -1.485096, 0, 0.1960784, 1, 1,
0.3326185, 0.4230472, 1.55648, 0, 0.1882353, 1, 1,
0.3382674, -0.6477013, 2.408086, 0, 0.1843137, 1, 1,
0.3386288, 1.283367, -0.3445309, 0, 0.1764706, 1, 1,
0.3404783, 1.692016, 1.303116, 0, 0.172549, 1, 1,
0.3446007, 1.032374, -0.953638, 0, 0.1647059, 1, 1,
0.3447201, 0.190604, 2.187204, 0, 0.1607843, 1, 1,
0.3448085, -1.580629, 4.325489, 0, 0.1529412, 1, 1,
0.3512028, 0.8155659, -1.051256, 0, 0.1490196, 1, 1,
0.3598752, 0.2628917, 1.607888, 0, 0.1411765, 1, 1,
0.3608426, 0.5393882, -0.3776312, 0, 0.1372549, 1, 1,
0.3673703, 0.265234, -1.554196, 0, 0.1294118, 1, 1,
0.3752188, 1.609973, 1.7438, 0, 0.1254902, 1, 1,
0.3771858, 0.9201139, 0.289681, 0, 0.1176471, 1, 1,
0.379683, -0.206873, 2.181657, 0, 0.1137255, 1, 1,
0.3803164, -0.5903717, 0.7365447, 0, 0.1058824, 1, 1,
0.38064, 1.159746, -0.5292367, 0, 0.09803922, 1, 1,
0.3811956, 0.5249415, 1.351373, 0, 0.09411765, 1, 1,
0.3821048, 1.732875, 0.008727476, 0, 0.08627451, 1, 1,
0.382765, 0.1045917, 1.74323, 0, 0.08235294, 1, 1,
0.3832481, -0.9107785, 1.700182, 0, 0.07450981, 1, 1,
0.3841352, -0.2307776, -0.1701187, 0, 0.07058824, 1, 1,
0.3868867, 1.147267, -1.186808, 0, 0.0627451, 1, 1,
0.39365, 1.719565, -0.7363547, 0, 0.05882353, 1, 1,
0.3941901, -0.398752, 2.56003, 0, 0.05098039, 1, 1,
0.3947649, -1.000254, 2.010108, 0, 0.04705882, 1, 1,
0.3949445, -0.07660499, 1.405679, 0, 0.03921569, 1, 1,
0.3961299, 0.6104523, -0.9215896, 0, 0.03529412, 1, 1,
0.3989227, -0.8120263, 3.165857, 0, 0.02745098, 1, 1,
0.4011312, 0.467105, -0.847595, 0, 0.02352941, 1, 1,
0.405181, 2.204356, 0.138715, 0, 0.01568628, 1, 1,
0.4082032, -0.9841657, 2.945008, 0, 0.01176471, 1, 1,
0.4096115, 0.6111528, -0.9802098, 0, 0.003921569, 1, 1,
0.4128552, 0.1567429, 1.580687, 0.003921569, 0, 1, 1,
0.4132719, -0.3517364, 4.449364, 0.007843138, 0, 1, 1,
0.4161352, -0.5587729, 1.280142, 0.01568628, 0, 1, 1,
0.4163792, 2.026738, -0.3385978, 0.01960784, 0, 1, 1,
0.4184436, 2.457378, -0.2532671, 0.02745098, 0, 1, 1,
0.4189551, 0.475715, -1.055899, 0.03137255, 0, 1, 1,
0.4190541, 0.5513346, -0.4910052, 0.03921569, 0, 1, 1,
0.4225552, 0.537086, 3.068302, 0.04313726, 0, 1, 1,
0.4246368, 1.370524, 0.3413666, 0.05098039, 0, 1, 1,
0.4247437, 0.2359485, 2.238272, 0.05490196, 0, 1, 1,
0.4247748, -0.08579349, 0.5485954, 0.0627451, 0, 1, 1,
0.4327278, 0.3281642, 0.234231, 0.06666667, 0, 1, 1,
0.4337436, -0.3731879, 3.584188, 0.07450981, 0, 1, 1,
0.4420547, -1.223637, 0.9613568, 0.07843138, 0, 1, 1,
0.4438823, 0.629827, 0.7679482, 0.08627451, 0, 1, 1,
0.4466977, -0.3004324, 2.843895, 0.09019608, 0, 1, 1,
0.447016, -0.3148674, 2.32702, 0.09803922, 0, 1, 1,
0.4486055, 1.096296, 0.06089387, 0.1058824, 0, 1, 1,
0.4501946, 1.439469, 1.109054, 0.1098039, 0, 1, 1,
0.4524782, -1.409514, 2.793932, 0.1176471, 0, 1, 1,
0.4542796, -0.05298208, 0.4097323, 0.1215686, 0, 1, 1,
0.4585341, -1.076293, 3.823543, 0.1294118, 0, 1, 1,
0.4621797, 0.5485571, 1.851107, 0.1333333, 0, 1, 1,
0.4633395, -0.3683787, 2.016341, 0.1411765, 0, 1, 1,
0.4640622, -0.3884082, 2.421644, 0.145098, 0, 1, 1,
0.4727609, 1.142457, 0.5531552, 0.1529412, 0, 1, 1,
0.4778311, 1.405515, -0.8258647, 0.1568628, 0, 1, 1,
0.4852354, 0.5505322, -0.8624707, 0.1647059, 0, 1, 1,
0.4913549, -0.3276362, 1.890022, 0.1686275, 0, 1, 1,
0.4913677, -0.3007017, 3.185147, 0.1764706, 0, 1, 1,
0.4925828, -1.039034, 2.921775, 0.1803922, 0, 1, 1,
0.4977596, 0.0314863, 0.9752401, 0.1882353, 0, 1, 1,
0.4992086, -0.3815928, 1.261827, 0.1921569, 0, 1, 1,
0.4998934, 2.272244, -1.964495, 0.2, 0, 1, 1,
0.5080825, 1.436738, -0.0314117, 0.2078431, 0, 1, 1,
0.5108234, -1.72188, 1.32161, 0.2117647, 0, 1, 1,
0.5187809, -0.6412976, 2.402785, 0.2196078, 0, 1, 1,
0.5212601, -0.3241448, 1.225331, 0.2235294, 0, 1, 1,
0.5244395, -0.8062199, 1.552287, 0.2313726, 0, 1, 1,
0.5284038, 1.280167, 1.154203, 0.2352941, 0, 1, 1,
0.5326055, -0.5877252, 1.262066, 0.2431373, 0, 1, 1,
0.5336624, -0.2478037, 0.4012842, 0.2470588, 0, 1, 1,
0.5347746, 0.02615807, 3.336531, 0.254902, 0, 1, 1,
0.538493, -2.47162, 3.696609, 0.2588235, 0, 1, 1,
0.555341, -1.251229, 5.505551, 0.2666667, 0, 1, 1,
0.5613168, 1.194213, 0.8059205, 0.2705882, 0, 1, 1,
0.5684866, -1.053616, 4.378236, 0.2784314, 0, 1, 1,
0.5735404, -0.8299691, 3.750804, 0.282353, 0, 1, 1,
0.586016, 0.1825045, 2.297456, 0.2901961, 0, 1, 1,
0.5974901, 0.6734689, 0.709686, 0.2941177, 0, 1, 1,
0.6051282, -0.5087867, 1.568647, 0.3019608, 0, 1, 1,
0.6069838, 0.5472775, 1.370224, 0.3098039, 0, 1, 1,
0.608557, -1.925641, 2.973762, 0.3137255, 0, 1, 1,
0.6144791, -0.7721434, 1.604638, 0.3215686, 0, 1, 1,
0.6153904, -0.853416, 2.349736, 0.3254902, 0, 1, 1,
0.621915, 1.434407, -0.7299019, 0.3333333, 0, 1, 1,
0.6231175, -0.4341312, 0.7662292, 0.3372549, 0, 1, 1,
0.6240118, 0.3422354, 2.08334, 0.345098, 0, 1, 1,
0.6257606, 1.139581, 1.34053, 0.3490196, 0, 1, 1,
0.6262145, -0.7238336, 1.229528, 0.3568628, 0, 1, 1,
0.6272676, 0.02077589, 2.528016, 0.3607843, 0, 1, 1,
0.6388608, -0.4175351, 1.105151, 0.3686275, 0, 1, 1,
0.6406502, -0.2353352, 2.031738, 0.372549, 0, 1, 1,
0.6500162, -1.171314, 3.211805, 0.3803922, 0, 1, 1,
0.6513829, -0.8065314, 1.602043, 0.3843137, 0, 1, 1,
0.6559059, 0.3324974, 0.4997241, 0.3921569, 0, 1, 1,
0.6608744, -1.025208, 1.881676, 0.3960784, 0, 1, 1,
0.6632425, 1.027961, -0.5914826, 0.4039216, 0, 1, 1,
0.6818518, 0.09088968, 0.4806136, 0.4117647, 0, 1, 1,
0.6819825, -1.551323, 2.384588, 0.4156863, 0, 1, 1,
0.6858432, 1.287568, -0.0238388, 0.4235294, 0, 1, 1,
0.6904809, -0.8270642, 2.593138, 0.427451, 0, 1, 1,
0.690688, -0.2419831, 3.31373, 0.4352941, 0, 1, 1,
0.6911481, -1.067759, 3.074573, 0.4392157, 0, 1, 1,
0.6944748, 0.5093583, 1.429321, 0.4470588, 0, 1, 1,
0.6950641, 0.2995398, 1.543818, 0.4509804, 0, 1, 1,
0.6953919, 1.500376, -0.8279577, 0.4588235, 0, 1, 1,
0.6963211, -1.231936, 2.970219, 0.4627451, 0, 1, 1,
0.6986436, 0.2536405, 0.5032499, 0.4705882, 0, 1, 1,
0.6998623, 0.1339974, 0.7125303, 0.4745098, 0, 1, 1,
0.7002924, 2.60593, 0.07149591, 0.4823529, 0, 1, 1,
0.7003967, 1.011596, -0.1621349, 0.4862745, 0, 1, 1,
0.7018092, 1.257029, 0.1701885, 0.4941176, 0, 1, 1,
0.704622, 0.3725487, 0.3474937, 0.5019608, 0, 1, 1,
0.705182, 1.216779, 0.9175799, 0.5058824, 0, 1, 1,
0.719474, 0.5814596, 0.4959222, 0.5137255, 0, 1, 1,
0.7195846, -0.9390098, 3.328362, 0.5176471, 0, 1, 1,
0.7324588, -1.279268, 2.431948, 0.5254902, 0, 1, 1,
0.7327837, -0.01026562, 1.559781, 0.5294118, 0, 1, 1,
0.7352275, 0.09516455, 3.35868, 0.5372549, 0, 1, 1,
0.7359895, 0.4823711, 1.774256, 0.5411765, 0, 1, 1,
0.7375169, -1.66212, 2.430833, 0.5490196, 0, 1, 1,
0.7532024, -1.155977, 4.72151, 0.5529412, 0, 1, 1,
0.7608122, 0.5915316, 0.9596751, 0.5607843, 0, 1, 1,
0.7620834, 0.7968945, 0.6165283, 0.5647059, 0, 1, 1,
0.7682314, 2.830795, 0.1290022, 0.572549, 0, 1, 1,
0.7718325, 0.5489902, -0.509218, 0.5764706, 0, 1, 1,
0.7723515, 0.4183208, 0.6031166, 0.5843138, 0, 1, 1,
0.7783912, -0.8971475, 0.9023013, 0.5882353, 0, 1, 1,
0.7793848, -0.3496107, 0.5535135, 0.5960785, 0, 1, 1,
0.7848713, 0.9823567, 0.9687671, 0.6039216, 0, 1, 1,
0.788503, -0.5921937, 2.809743, 0.6078432, 0, 1, 1,
0.7895504, -0.5375006, 1.523038, 0.6156863, 0, 1, 1,
0.7917056, 1.969912, 0.9825601, 0.6196079, 0, 1, 1,
0.7926925, -1.183434, 2.75195, 0.627451, 0, 1, 1,
0.7937471, 0.06447287, -0.00836316, 0.6313726, 0, 1, 1,
0.7941472, 1.054513, 0.3174605, 0.6392157, 0, 1, 1,
0.7957136, -0.9815287, 4.565516, 0.6431373, 0, 1, 1,
0.7969983, 0.8939121, -1.801112, 0.6509804, 0, 1, 1,
0.8010479, 1.775185, 1.029319, 0.654902, 0, 1, 1,
0.8029069, -0.1672396, 0.4537571, 0.6627451, 0, 1, 1,
0.8045353, -1.127544, 2.107359, 0.6666667, 0, 1, 1,
0.8107733, 0.6491925, 2.807016, 0.6745098, 0, 1, 1,
0.8159568, 0.1582506, 1.096547, 0.6784314, 0, 1, 1,
0.8205534, -0.7771887, 1.523334, 0.6862745, 0, 1, 1,
0.8211199, 1.219066, 1.23269, 0.6901961, 0, 1, 1,
0.8374137, 0.002820873, 0.4183325, 0.6980392, 0, 1, 1,
0.8387641, 0.8246887, -0.6593469, 0.7058824, 0, 1, 1,
0.8387958, 0.1436558, 2.319215, 0.7098039, 0, 1, 1,
0.846455, 0.7567796, 1.268117, 0.7176471, 0, 1, 1,
0.8502257, 0.7299195, 2.135307, 0.7215686, 0, 1, 1,
0.8562727, -0.3623429, 1.366564, 0.7294118, 0, 1, 1,
0.860065, 1.965027, 0.8154119, 0.7333333, 0, 1, 1,
0.8680848, 0.7786883, 2.861817, 0.7411765, 0, 1, 1,
0.8696613, -2.241645, 4.913676, 0.7450981, 0, 1, 1,
0.8709649, -0.9301157, 2.592644, 0.7529412, 0, 1, 1,
0.8749269, -1.270247, 2.057181, 0.7568628, 0, 1, 1,
0.8771, -0.2666363, 0.8759782, 0.7647059, 0, 1, 1,
0.8780954, -0.1949862, 3.134493, 0.7686275, 0, 1, 1,
0.8907478, -0.9449878, 2.146951, 0.7764706, 0, 1, 1,
0.8909441, 0.05040617, 0.574716, 0.7803922, 0, 1, 1,
0.8978401, -0.1600024, 3.013014, 0.7882353, 0, 1, 1,
0.9072831, -1.320795, 1.869539, 0.7921569, 0, 1, 1,
0.9110397, 0.3501291, 0.1507672, 0.8, 0, 1, 1,
0.9161345, 0.2894311, 2.420816, 0.8078431, 0, 1, 1,
0.9194216, 1.589817, 0.1852861, 0.8117647, 0, 1, 1,
0.9300407, 0.6502982, 1.178235, 0.8196079, 0, 1, 1,
0.9336889, 0.05498474, 0.4699996, 0.8235294, 0, 1, 1,
0.9392772, -0.3503087, 2.124818, 0.8313726, 0, 1, 1,
0.9407117, 0.4286393, 1.099078, 0.8352941, 0, 1, 1,
0.9435564, 0.5186344, 1.258688, 0.8431373, 0, 1, 1,
0.9444015, 0.7772768, 0.6409434, 0.8470588, 0, 1, 1,
0.9453453, 0.3346716, 0.2224207, 0.854902, 0, 1, 1,
0.9468873, -1.193009, 2.411256, 0.8588235, 0, 1, 1,
0.9590734, -1.240003, 2.410465, 0.8666667, 0, 1, 1,
0.9614654, -0.227079, 1.793577, 0.8705882, 0, 1, 1,
0.962035, -0.5177717, 2.495195, 0.8784314, 0, 1, 1,
0.9644036, 0.3193399, 0.2626608, 0.8823529, 0, 1, 1,
0.9684897, 1.107847, -0.2776026, 0.8901961, 0, 1, 1,
0.968582, -1.151713, 1.654529, 0.8941177, 0, 1, 1,
0.9839121, 0.3858283, 0.03931952, 0.9019608, 0, 1, 1,
0.9867851, -0.3801616, 4.515724, 0.9098039, 0, 1, 1,
0.9880304, -1.469746, 3.8411, 0.9137255, 0, 1, 1,
0.9890465, 0.2803964, 0.6713101, 0.9215686, 0, 1, 1,
0.9933553, 0.06205025, 1.284361, 0.9254902, 0, 1, 1,
0.9968719, 1.32763, 3.064361, 0.9333333, 0, 1, 1,
1.006158, 0.2344844, 1.322528, 0.9372549, 0, 1, 1,
1.006835, 1.182339, 0.2064877, 0.945098, 0, 1, 1,
1.011766, -2.679555, 3.074187, 0.9490196, 0, 1, 1,
1.017597, -0.5393083, 0.3573864, 0.9568627, 0, 1, 1,
1.017605, 0.4259225, 1.873368, 0.9607843, 0, 1, 1,
1.027049, 0.4966033, 1.13456, 0.9686275, 0, 1, 1,
1.032295, -0.5678591, 2.453087, 0.972549, 0, 1, 1,
1.033718, -0.2395255, 0.9197464, 0.9803922, 0, 1, 1,
1.039994, 2.166721, -1.640252, 0.9843137, 0, 1, 1,
1.044132, 0.8589373, 1.540067, 0.9921569, 0, 1, 1,
1.044179, 0.950703, 1.42902, 0.9960784, 0, 1, 1,
1.045664, -0.397572, 1.510302, 1, 0, 0.9960784, 1,
1.048389, -0.3015528, 0.9885928, 1, 0, 0.9882353, 1,
1.049837, 0.7578341, 1.958865, 1, 0, 0.9843137, 1,
1.054649, 0.683319, 1.712386, 1, 0, 0.9764706, 1,
1.054947, 0.5089094, 1.968436, 1, 0, 0.972549, 1,
1.061142, 0.5329726, 1.137842, 1, 0, 0.9647059, 1,
1.065277, 0.1846463, 2.050269, 1, 0, 0.9607843, 1,
1.067406, 0.6137527, 1.692589, 1, 0, 0.9529412, 1,
1.071749, -0.6848144, 3.569369, 1, 0, 0.9490196, 1,
1.092575, -0.9733875, 0.539654, 1, 0, 0.9411765, 1,
1.093504, -0.361191, 1.3392, 1, 0, 0.9372549, 1,
1.097678, 0.6939747, 0.3795485, 1, 0, 0.9294118, 1,
1.118762, -1.181602, 2.420265, 1, 0, 0.9254902, 1,
1.121057, -0.3591134, 3.840698, 1, 0, 0.9176471, 1,
1.123548, 0.2179026, 0.6189818, 1, 0, 0.9137255, 1,
1.125051, -0.2901248, 0.3376163, 1, 0, 0.9058824, 1,
1.138012, -0.5011236, 1.24389, 1, 0, 0.9019608, 1,
1.138586, -1.15804, 3.14509, 1, 0, 0.8941177, 1,
1.141854, -0.6870466, 1.554396, 1, 0, 0.8862745, 1,
1.142448, 1.684376, 1.434801, 1, 0, 0.8823529, 1,
1.14867, -2.346203, 2.640514, 1, 0, 0.8745098, 1,
1.153197, 0.787497, 2.447379, 1, 0, 0.8705882, 1,
1.156394, -0.4888793, 2.329777, 1, 0, 0.8627451, 1,
1.163445, -1.317981, 1.712357, 1, 0, 0.8588235, 1,
1.168087, 0.7489941, 1.188083, 1, 0, 0.8509804, 1,
1.174805, 0.7251419, 0.2726985, 1, 0, 0.8470588, 1,
1.17592, -0.1603862, 1.284362, 1, 0, 0.8392157, 1,
1.177325, 0.8322862, -0.1726882, 1, 0, 0.8352941, 1,
1.178183, 0.3029134, 1.866352, 1, 0, 0.827451, 1,
1.181057, -0.9487365, 1.837037, 1, 0, 0.8235294, 1,
1.186584, 0.5400462, 1.11589, 1, 0, 0.8156863, 1,
1.187787, 1.392698, 1.5408, 1, 0, 0.8117647, 1,
1.196763, 1.13063, 1.379265, 1, 0, 0.8039216, 1,
1.198732, 0.7876088, 1.20834, 1, 0, 0.7960784, 1,
1.20145, 0.375987, 1.960558, 1, 0, 0.7921569, 1,
1.206975, -0.4219629, 1.558111, 1, 0, 0.7843137, 1,
1.211761, 0.5612166, -0.4696395, 1, 0, 0.7803922, 1,
1.216388, -0.4445003, 1.15717, 1, 0, 0.772549, 1,
1.217595, -0.5056435, 3.163669, 1, 0, 0.7686275, 1,
1.219475, -0.675554, 0.8581977, 1, 0, 0.7607843, 1,
1.22485, -0.3031934, 1.447788, 1, 0, 0.7568628, 1,
1.22581, -0.2565857, 2.018909, 1, 0, 0.7490196, 1,
1.230066, 0.9449534, 2.709407, 1, 0, 0.7450981, 1,
1.234262, -0.2100824, 2.026292, 1, 0, 0.7372549, 1,
1.23587, -0.5188721, 1.898374, 1, 0, 0.7333333, 1,
1.241691, -0.2701051, -0.389921, 1, 0, 0.7254902, 1,
1.255068, 0.5095807, -0.2450828, 1, 0, 0.7215686, 1,
1.255444, -0.08643577, 0.7025577, 1, 0, 0.7137255, 1,
1.259214, 0.4373, 1.763857, 1, 0, 0.7098039, 1,
1.263256, -0.6003605, 2.116029, 1, 0, 0.7019608, 1,
1.263804, -1.21287, 0.4411728, 1, 0, 0.6941177, 1,
1.270654, 0.2642601, 1.603501, 1, 0, 0.6901961, 1,
1.27257, -2.044891, 2.239323, 1, 0, 0.682353, 1,
1.273848, -1.869337, 2.366906, 1, 0, 0.6784314, 1,
1.275615, -0.1949997, 2.311604, 1, 0, 0.6705883, 1,
1.282063, 0.1939624, 0.7445167, 1, 0, 0.6666667, 1,
1.285005, 0.0291911, 0.4008409, 1, 0, 0.6588235, 1,
1.285229, -0.9868794, 2.709292, 1, 0, 0.654902, 1,
1.289536, -0.6010391, 2.687346, 1, 0, 0.6470588, 1,
1.296525, 0.004486823, 1.074569, 1, 0, 0.6431373, 1,
1.297174, -0.2748086, 1.067655, 1, 0, 0.6352941, 1,
1.297274, 0.3287832, 1.155782, 1, 0, 0.6313726, 1,
1.301608, 1.11627, 0.02470088, 1, 0, 0.6235294, 1,
1.304469, -0.9113368, 2.355772, 1, 0, 0.6196079, 1,
1.310281, 0.08717651, 1.682405, 1, 0, 0.6117647, 1,
1.311524, -0.02229945, 1.345318, 1, 0, 0.6078432, 1,
1.312584, 2.099588, 1.360353, 1, 0, 0.6, 1,
1.31687, 0.6319398, 2.584232, 1, 0, 0.5921569, 1,
1.321781, -1.385507, 3.906901, 1, 0, 0.5882353, 1,
1.323603, -0.06534421, 1.734719, 1, 0, 0.5803922, 1,
1.325954, 0.1181421, 1.153046, 1, 0, 0.5764706, 1,
1.345717, -0.3635276, 2.825258, 1, 0, 0.5686275, 1,
1.356579, 0.6648167, 1.583689, 1, 0, 0.5647059, 1,
1.359803, -0.08435414, 1.453878, 1, 0, 0.5568628, 1,
1.367122, 1.022244, -0.01007976, 1, 0, 0.5529412, 1,
1.37369, -1.233693, 0.7787199, 1, 0, 0.5450981, 1,
1.37984, 0.3982026, 0.5146698, 1, 0, 0.5411765, 1,
1.381027, -0.03238794, 2.551768, 1, 0, 0.5333334, 1,
1.384115, -0.8297738, 2.297317, 1, 0, 0.5294118, 1,
1.391219, -1.815903, 2.303299, 1, 0, 0.5215687, 1,
1.404532, -0.6163277, 3.461444, 1, 0, 0.5176471, 1,
1.415832, -0.2928843, 2.026386, 1, 0, 0.509804, 1,
1.418543, 0.2145633, 0.6804372, 1, 0, 0.5058824, 1,
1.428549, 0.3609409, 1.515684, 1, 0, 0.4980392, 1,
1.444309, -0.8561495, 2.878103, 1, 0, 0.4901961, 1,
1.452438, 2.901423, 0.6056071, 1, 0, 0.4862745, 1,
1.466636, -0.7698385, 2.89303, 1, 0, 0.4784314, 1,
1.471211, 0.6669284, 0.4769674, 1, 0, 0.4745098, 1,
1.472845, 0.6597786, 2.133261, 1, 0, 0.4666667, 1,
1.484571, -1.028673, 2.371779, 1, 0, 0.4627451, 1,
1.495711, 0.6157637, 0.853254, 1, 0, 0.454902, 1,
1.510239, 1.354517, 1.961897, 1, 0, 0.4509804, 1,
1.510572, -0.639007, 0.2842682, 1, 0, 0.4431373, 1,
1.525429, -1.475324, 2.048367, 1, 0, 0.4392157, 1,
1.532027, 0.1710872, 3.059775, 1, 0, 0.4313726, 1,
1.543795, -0.7789871, 2.793258, 1, 0, 0.427451, 1,
1.548071, 0.5814098, 1.649658, 1, 0, 0.4196078, 1,
1.566954, 1.034409, 0.5813565, 1, 0, 0.4156863, 1,
1.569193, -0.7519616, 3.084046, 1, 0, 0.4078431, 1,
1.583399, -0.3211989, 3.537192, 1, 0, 0.4039216, 1,
1.583603, -0.3848978, 0.8764393, 1, 0, 0.3960784, 1,
1.589236, -0.5099965, 2.73795, 1, 0, 0.3882353, 1,
1.59142, 0.6089805, 1.391885, 1, 0, 0.3843137, 1,
1.592091, 0.04971413, 2.922662, 1, 0, 0.3764706, 1,
1.601878, 1.919563, 0.1220982, 1, 0, 0.372549, 1,
1.611564, 0.01611903, 1.119576, 1, 0, 0.3647059, 1,
1.612632, -0.4821971, 2.228, 1, 0, 0.3607843, 1,
1.614324, 0.9383992, 1.924719, 1, 0, 0.3529412, 1,
1.628161, -0.630137, 1.164616, 1, 0, 0.3490196, 1,
1.635612, 0.4774112, -0.3107284, 1, 0, 0.3411765, 1,
1.640071, -0.2688063, 3.084979, 1, 0, 0.3372549, 1,
1.661664, -0.3571512, 3.143802, 1, 0, 0.3294118, 1,
1.662351, -0.385384, 0.5302023, 1, 0, 0.3254902, 1,
1.671878, 0.36273, 0.5920592, 1, 0, 0.3176471, 1,
1.672583, -1.102717, 3.739446, 1, 0, 0.3137255, 1,
1.677103, 0.1956247, 0.3379748, 1, 0, 0.3058824, 1,
1.688311, 0.8487772, 1.501479, 1, 0, 0.2980392, 1,
1.696046, 0.5820351, 1.134774, 1, 0, 0.2941177, 1,
1.729511, -0.1797765, 2.885734, 1, 0, 0.2862745, 1,
1.732228, 0.8496348, 2.353993, 1, 0, 0.282353, 1,
1.751176, 1.225446, 0.8910788, 1, 0, 0.2745098, 1,
1.790305, -0.3431624, 3.759952, 1, 0, 0.2705882, 1,
1.805234, 0.6382158, 2.041554, 1, 0, 0.2627451, 1,
1.81506, -0.03074905, 2.298265, 1, 0, 0.2588235, 1,
1.820337, -0.5228043, 2.229526, 1, 0, 0.2509804, 1,
1.842121, -1.467534, 2.169313, 1, 0, 0.2470588, 1,
1.844004, 0.5287241, 1.481143, 1, 0, 0.2392157, 1,
1.909887, 1.249807, 0.4976929, 1, 0, 0.2352941, 1,
1.974485, -0.01248728, 2.189096, 1, 0, 0.227451, 1,
1.977359, -0.947093, 0.6216027, 1, 0, 0.2235294, 1,
1.982963, 1.155588, 1.451153, 1, 0, 0.2156863, 1,
2.004368, 0.07598828, 1.667519, 1, 0, 0.2117647, 1,
2.036345, 0.7452154, 1.036004, 1, 0, 0.2039216, 1,
2.045148, 0.3555425, 1.737725, 1, 0, 0.1960784, 1,
2.068069, 0.0818613, 1.277851, 1, 0, 0.1921569, 1,
2.079462, -0.01412456, 1.824326, 1, 0, 0.1843137, 1,
2.086293, 0.05600458, 2.373762, 1, 0, 0.1803922, 1,
2.098732, -1.496439, 0.5832621, 1, 0, 0.172549, 1,
2.100208, -1.46505, 0.708184, 1, 0, 0.1686275, 1,
2.115967, 0.8687102, 2.752381, 1, 0, 0.1607843, 1,
2.156888, 1.337016, 1.687071, 1, 0, 0.1568628, 1,
2.156973, 0.3454905, 2.592739, 1, 0, 0.1490196, 1,
2.162906, 0.03905317, 2.601651, 1, 0, 0.145098, 1,
2.164273, 0.3308558, 0.5766455, 1, 0, 0.1372549, 1,
2.171188, -0.3713151, 1.091184, 1, 0, 0.1333333, 1,
2.175997, -0.3417752, 1.001452, 1, 0, 0.1254902, 1,
2.179603, 0.328523, 0.4643899, 1, 0, 0.1215686, 1,
2.211801, 0.7031273, 0.8937044, 1, 0, 0.1137255, 1,
2.222406, 0.5615779, 1.160545, 1, 0, 0.1098039, 1,
2.328357, -0.2577033, 0.5835752, 1, 0, 0.1019608, 1,
2.355452, -0.1106277, 0.7359385, 1, 0, 0.09411765, 1,
2.371949, 1.374417, 1.120542, 1, 0, 0.09019608, 1,
2.456005, 0.7691743, 0.572359, 1, 0, 0.08235294, 1,
2.512721, -0.2041238, 0.9662641, 1, 0, 0.07843138, 1,
2.533393, -1.897312, 2.807549, 1, 0, 0.07058824, 1,
2.584587, 0.0711609, 2.805689, 1, 0, 0.06666667, 1,
2.58508, -0.3578143, 0.04170239, 1, 0, 0.05882353, 1,
2.636087, -0.9376661, 2.281749, 1, 0, 0.05490196, 1,
2.636323, -1.218325, 0.8636069, 1, 0, 0.04705882, 1,
2.676707, 2.981645, -1.27744, 1, 0, 0.04313726, 1,
2.680723, 0.5857987, 3.769905, 1, 0, 0.03529412, 1,
2.699766, 0.0704435, 1.755998, 1, 0, 0.03137255, 1,
2.783883, 3.414941, 0.4007646, 1, 0, 0.02352941, 1,
2.826963, -1.502277, 2.42988, 1, 0, 0.01960784, 1,
3.171988, -0.5997232, 2.584677, 1, 0, 0.01176471, 1,
3.343113, -0.3227323, 2.200915, 1, 0, 0.007843138, 1
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
0.1093081, -3.859305, -6.795568, 0, -0.5, 0.5, 0.5,
0.1093081, -3.859305, -6.795568, 1, -0.5, 0.5, 0.5,
0.1093081, -3.859305, -6.795568, 1, 1.5, 0.5, 0.5,
0.1093081, -3.859305, -6.795568, 0, 1.5, 0.5, 0.5
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
-4.220756, 0.3049598, -6.795568, 0, -0.5, 0.5, 0.5,
-4.220756, 0.3049598, -6.795568, 1, -0.5, 0.5, 0.5,
-4.220756, 0.3049598, -6.795568, 1, 1.5, 0.5, 0.5,
-4.220756, 0.3049598, -6.795568, 0, 1.5, 0.5, 0.5
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
-4.220756, -3.859305, 0.2464151, 0, -0.5, 0.5, 0.5,
-4.220756, -3.859305, 0.2464151, 1, -0.5, 0.5, 0.5,
-4.220756, -3.859305, 0.2464151, 1, 1.5, 0.5, 0.5,
-4.220756, -3.859305, 0.2464151, 0, 1.5, 0.5, 0.5
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
-3, -2.898321, -5.170495,
3, -2.898321, -5.170495,
-3, -2.898321, -5.170495,
-3, -3.058485, -5.44134,
-2, -2.898321, -5.170495,
-2, -3.058485, -5.44134,
-1, -2.898321, -5.170495,
-1, -3.058485, -5.44134,
0, -2.898321, -5.170495,
0, -3.058485, -5.44134,
1, -2.898321, -5.170495,
1, -3.058485, -5.44134,
2, -2.898321, -5.170495,
2, -3.058485, -5.44134,
3, -2.898321, -5.170495,
3, -3.058485, -5.44134
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
-3, -3.378813, -5.983031, 0, -0.5, 0.5, 0.5,
-3, -3.378813, -5.983031, 1, -0.5, 0.5, 0.5,
-3, -3.378813, -5.983031, 1, 1.5, 0.5, 0.5,
-3, -3.378813, -5.983031, 0, 1.5, 0.5, 0.5,
-2, -3.378813, -5.983031, 0, -0.5, 0.5, 0.5,
-2, -3.378813, -5.983031, 1, -0.5, 0.5, 0.5,
-2, -3.378813, -5.983031, 1, 1.5, 0.5, 0.5,
-2, -3.378813, -5.983031, 0, 1.5, 0.5, 0.5,
-1, -3.378813, -5.983031, 0, -0.5, 0.5, 0.5,
-1, -3.378813, -5.983031, 1, -0.5, 0.5, 0.5,
-1, -3.378813, -5.983031, 1, 1.5, 0.5, 0.5,
-1, -3.378813, -5.983031, 0, 1.5, 0.5, 0.5,
0, -3.378813, -5.983031, 0, -0.5, 0.5, 0.5,
0, -3.378813, -5.983031, 1, -0.5, 0.5, 0.5,
0, -3.378813, -5.983031, 1, 1.5, 0.5, 0.5,
0, -3.378813, -5.983031, 0, 1.5, 0.5, 0.5,
1, -3.378813, -5.983031, 0, -0.5, 0.5, 0.5,
1, -3.378813, -5.983031, 1, -0.5, 0.5, 0.5,
1, -3.378813, -5.983031, 1, 1.5, 0.5, 0.5,
1, -3.378813, -5.983031, 0, 1.5, 0.5, 0.5,
2, -3.378813, -5.983031, 0, -0.5, 0.5, 0.5,
2, -3.378813, -5.983031, 1, -0.5, 0.5, 0.5,
2, -3.378813, -5.983031, 1, 1.5, 0.5, 0.5,
2, -3.378813, -5.983031, 0, 1.5, 0.5, 0.5,
3, -3.378813, -5.983031, 0, -0.5, 0.5, 0.5,
3, -3.378813, -5.983031, 1, -0.5, 0.5, 0.5,
3, -3.378813, -5.983031, 1, 1.5, 0.5, 0.5,
3, -3.378813, -5.983031, 0, 1.5, 0.5, 0.5
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
-3.221511, -2, -5.170495,
-3.221511, 3, -5.170495,
-3.221511, -2, -5.170495,
-3.388052, -2, -5.44134,
-3.221511, -1, -5.170495,
-3.388052, -1, -5.44134,
-3.221511, 0, -5.170495,
-3.388052, 0, -5.44134,
-3.221511, 1, -5.170495,
-3.388052, 1, -5.44134,
-3.221511, 2, -5.170495,
-3.388052, 2, -5.44134,
-3.221511, 3, -5.170495,
-3.388052, 3, -5.44134
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
-3.721133, -2, -5.983031, 0, -0.5, 0.5, 0.5,
-3.721133, -2, -5.983031, 1, -0.5, 0.5, 0.5,
-3.721133, -2, -5.983031, 1, 1.5, 0.5, 0.5,
-3.721133, -2, -5.983031, 0, 1.5, 0.5, 0.5,
-3.721133, -1, -5.983031, 0, -0.5, 0.5, 0.5,
-3.721133, -1, -5.983031, 1, -0.5, 0.5, 0.5,
-3.721133, -1, -5.983031, 1, 1.5, 0.5, 0.5,
-3.721133, -1, -5.983031, 0, 1.5, 0.5, 0.5,
-3.721133, 0, -5.983031, 0, -0.5, 0.5, 0.5,
-3.721133, 0, -5.983031, 1, -0.5, 0.5, 0.5,
-3.721133, 0, -5.983031, 1, 1.5, 0.5, 0.5,
-3.721133, 0, -5.983031, 0, 1.5, 0.5, 0.5,
-3.721133, 1, -5.983031, 0, -0.5, 0.5, 0.5,
-3.721133, 1, -5.983031, 1, -0.5, 0.5, 0.5,
-3.721133, 1, -5.983031, 1, 1.5, 0.5, 0.5,
-3.721133, 1, -5.983031, 0, 1.5, 0.5, 0.5,
-3.721133, 2, -5.983031, 0, -0.5, 0.5, 0.5,
-3.721133, 2, -5.983031, 1, -0.5, 0.5, 0.5,
-3.721133, 2, -5.983031, 1, 1.5, 0.5, 0.5,
-3.721133, 2, -5.983031, 0, 1.5, 0.5, 0.5,
-3.721133, 3, -5.983031, 0, -0.5, 0.5, 0.5,
-3.721133, 3, -5.983031, 1, -0.5, 0.5, 0.5,
-3.721133, 3, -5.983031, 1, 1.5, 0.5, 0.5,
-3.721133, 3, -5.983031, 0, 1.5, 0.5, 0.5
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
-3.221511, -2.898321, -4,
-3.221511, -2.898321, 4,
-3.221511, -2.898321, -4,
-3.388052, -3.058485, -4,
-3.221511, -2.898321, -2,
-3.388052, -3.058485, -2,
-3.221511, -2.898321, 0,
-3.388052, -3.058485, 0,
-3.221511, -2.898321, 2,
-3.388052, -3.058485, 2,
-3.221511, -2.898321, 4,
-3.388052, -3.058485, 4
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
-3.721133, -3.378813, -4, 0, -0.5, 0.5, 0.5,
-3.721133, -3.378813, -4, 1, -0.5, 0.5, 0.5,
-3.721133, -3.378813, -4, 1, 1.5, 0.5, 0.5,
-3.721133, -3.378813, -4, 0, 1.5, 0.5, 0.5,
-3.721133, -3.378813, -2, 0, -0.5, 0.5, 0.5,
-3.721133, -3.378813, -2, 1, -0.5, 0.5, 0.5,
-3.721133, -3.378813, -2, 1, 1.5, 0.5, 0.5,
-3.721133, -3.378813, -2, 0, 1.5, 0.5, 0.5,
-3.721133, -3.378813, 0, 0, -0.5, 0.5, 0.5,
-3.721133, -3.378813, 0, 1, -0.5, 0.5, 0.5,
-3.721133, -3.378813, 0, 1, 1.5, 0.5, 0.5,
-3.721133, -3.378813, 0, 0, 1.5, 0.5, 0.5,
-3.721133, -3.378813, 2, 0, -0.5, 0.5, 0.5,
-3.721133, -3.378813, 2, 1, -0.5, 0.5, 0.5,
-3.721133, -3.378813, 2, 1, 1.5, 0.5, 0.5,
-3.721133, -3.378813, 2, 0, 1.5, 0.5, 0.5,
-3.721133, -3.378813, 4, 0, -0.5, 0.5, 0.5,
-3.721133, -3.378813, 4, 1, -0.5, 0.5, 0.5,
-3.721133, -3.378813, 4, 1, 1.5, 0.5, 0.5,
-3.721133, -3.378813, 4, 0, 1.5, 0.5, 0.5
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
-3.221511, -2.898321, -5.170495,
-3.221511, 3.50824, -5.170495,
-3.221511, -2.898321, 5.663325,
-3.221511, 3.50824, 5.663325,
-3.221511, -2.898321, -5.170495,
-3.221511, -2.898321, 5.663325,
-3.221511, 3.50824, -5.170495,
-3.221511, 3.50824, 5.663325,
-3.221511, -2.898321, -5.170495,
3.440127, -2.898321, -5.170495,
-3.221511, -2.898321, 5.663325,
3.440127, -2.898321, 5.663325,
-3.221511, 3.50824, -5.170495,
3.440127, 3.50824, -5.170495,
-3.221511, 3.50824, 5.663325,
3.440127, 3.50824, 5.663325,
3.440127, -2.898321, -5.170495,
3.440127, 3.50824, -5.170495,
3.440127, -2.898321, 5.663325,
3.440127, 3.50824, 5.663325,
3.440127, -2.898321, -5.170495,
3.440127, -2.898321, 5.663325,
3.440127, 3.50824, -5.170495,
3.440127, 3.50824, 5.663325
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
var radius = 7.604174;
var distance = 33.83183;
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
mvMatrix.translate( -0.1093081, -0.3049598, -0.2464151 );
mvMatrix.scale( 1.234198, 1.283338, 0.7588996 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.83183);
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
Bensulide<-read.table("Bensulide.xyz")
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
-3.124496, -1.307379, -3.916602, 0, 0, 1, 1, 1,
-2.902351, -0.5405325, -1.592529, 1, 0, 0, 1, 1,
-2.793437, 0.3610278, -1.605953, 1, 0, 0, 1, 1,
-2.740791, -1.635252, -3.291843, 1, 0, 0, 1, 1,
-2.547254, -0.07794645, -0.3550209, 1, 0, 0, 1, 1,
-2.514678, 2.067532, -0.06660939, 1, 0, 0, 1, 1,
-2.416526, 2.050099, 0.6101476, 0, 0, 0, 1, 1,
-2.374765, 1.024653, -0.3540769, 0, 0, 0, 1, 1,
-2.370011, 0.8210166, -1.059786, 0, 0, 0, 1, 1,
-2.302691, 1.595285, -1.542507, 0, 0, 0, 1, 1,
-2.262458, -1.089344, -1.596763, 0, 0, 0, 1, 1,
-2.24891, 0.4475622, -0.7449051, 0, 0, 0, 1, 1,
-2.224367, 0.007554278, -1.145337, 0, 0, 0, 1, 1,
-2.169873, 0.4789123, -1.230117, 1, 1, 1, 1, 1,
-2.161681, 1.537699, -1.853884, 1, 1, 1, 1, 1,
-2.15739, -0.4297316, -1.845552, 1, 1, 1, 1, 1,
-2.088894, -1.427742, -3.299078, 1, 1, 1, 1, 1,
-2.050885, -0.4385475, -3.086715, 1, 1, 1, 1, 1,
-2.041026, -1.494271, -3.082613, 1, 1, 1, 1, 1,
-2.0341, 0.3503452, -3.156385, 1, 1, 1, 1, 1,
-2.032166, -0.8027524, -2.654746, 1, 1, 1, 1, 1,
-2.024468, 2.464838, -0.3886086, 1, 1, 1, 1, 1,
-2.004642, -0.8050979, -1.515808, 1, 1, 1, 1, 1,
-1.985445, -2.370479, -1.378096, 1, 1, 1, 1, 1,
-1.984578, 0.2194902, -0.3596685, 1, 1, 1, 1, 1,
-1.947746, -1.141309, -1.828282, 1, 1, 1, 1, 1,
-1.918975, 1.386908, -1.541337, 1, 1, 1, 1, 1,
-1.908597, -0.6790576, -1.828774, 1, 1, 1, 1, 1,
-1.898415, 0.09631059, -1.160821, 0, 0, 1, 1, 1,
-1.889724, -2.151073, -1.70453, 1, 0, 0, 1, 1,
-1.876179, -0.6001495, -0.7166638, 1, 0, 0, 1, 1,
-1.867842, 0.2482663, -0.4089238, 1, 0, 0, 1, 1,
-1.867148, 2.85222, 0.02776495, 1, 0, 0, 1, 1,
-1.829129, -0.04246873, -2.555964, 1, 0, 0, 1, 1,
-1.820228, -0.02903987, -1.938486, 0, 0, 0, 1, 1,
-1.809386, 1.496196, -0.1799526, 0, 0, 0, 1, 1,
-1.807604, 0.6353092, -1.16633, 0, 0, 0, 1, 1,
-1.80617, 0.07784697, -3.070552, 0, 0, 0, 1, 1,
-1.756359, -0.381144, -0.07422445, 0, 0, 0, 1, 1,
-1.746632, -1.167938, -2.533716, 0, 0, 0, 1, 1,
-1.730057, 0.9954882, -0.6526566, 0, 0, 0, 1, 1,
-1.728873, 0.05068736, -1.663741, 1, 1, 1, 1, 1,
-1.711653, -0.2808014, -1.293155, 1, 1, 1, 1, 1,
-1.707523, 0.5062745, -0.3990271, 1, 1, 1, 1, 1,
-1.706788, 0.3874731, -0.5376815, 1, 1, 1, 1, 1,
-1.690691, -0.01132353, -1.017498, 1, 1, 1, 1, 1,
-1.68875, -0.4680919, -2.164234, 1, 1, 1, 1, 1,
-1.682911, -1.446285, -2.979181, 1, 1, 1, 1, 1,
-1.66938, -0.07760698, -2.424998, 1, 1, 1, 1, 1,
-1.665212, 0.6103582, 0.643305, 1, 1, 1, 1, 1,
-1.660884, -1.554763, -3.028551, 1, 1, 1, 1, 1,
-1.657155, 0.1684704, -1.632656, 1, 1, 1, 1, 1,
-1.650458, -2.197694, -1.64616, 1, 1, 1, 1, 1,
-1.643884, 0.8876812, -1.114007, 1, 1, 1, 1, 1,
-1.63892, -0.3900525, -1.541347, 1, 1, 1, 1, 1,
-1.634574, 0.01742866, -4.224909, 1, 1, 1, 1, 1,
-1.63421, -0.4863963, -1.269101, 0, 0, 1, 1, 1,
-1.622094, -0.006131545, -3.258778, 1, 0, 0, 1, 1,
-1.617952, -0.3934811, -0.5413812, 1, 0, 0, 1, 1,
-1.600502, 0.798362, -0.7438782, 1, 0, 0, 1, 1,
-1.595881, -0.3494046, -1.704717, 1, 0, 0, 1, 1,
-1.592257, -0.3867807, 0.4867521, 1, 0, 0, 1, 1,
-1.590642, 0.9755384, 1.192231, 0, 0, 0, 1, 1,
-1.579626, 0.2416116, -1.997049, 0, 0, 0, 1, 1,
-1.57634, -0.03076372, -1.818, 0, 0, 0, 1, 1,
-1.559283, 0.519732, -3.306016, 0, 0, 0, 1, 1,
-1.556552, -1.149554, -0.9319849, 0, 0, 0, 1, 1,
-1.553836, -0.3703386, -1.593307, 0, 0, 0, 1, 1,
-1.552716, 0.3125535, -1.109553, 0, 0, 0, 1, 1,
-1.542721, -0.8991668, -1.746659, 1, 1, 1, 1, 1,
-1.535331, -0.8082494, -0.4784832, 1, 1, 1, 1, 1,
-1.533829, -1.73442, -2.269178, 1, 1, 1, 1, 1,
-1.532926, -0.4564117, -1.298309, 1, 1, 1, 1, 1,
-1.510556, -0.8990992, -1.212905, 1, 1, 1, 1, 1,
-1.507287, 0.08651257, -0.9540343, 1, 1, 1, 1, 1,
-1.501773, -0.8887926, -2.607404, 1, 1, 1, 1, 1,
-1.499509, 0.1694932, -1.455272, 1, 1, 1, 1, 1,
-1.493952, -0.3854966, -1.881911, 1, 1, 1, 1, 1,
-1.488965, 0.6771477, -1.07156, 1, 1, 1, 1, 1,
-1.484547, -0.1244443, -2.56094, 1, 1, 1, 1, 1,
-1.48279, 0.5904384, -0.1426652, 1, 1, 1, 1, 1,
-1.476558, -0.8470297, -1.155697, 1, 1, 1, 1, 1,
-1.47523, -0.668687, -1.941151, 1, 1, 1, 1, 1,
-1.462262, 1.679271, -2.316322, 1, 1, 1, 1, 1,
-1.455328, 1.460712, -1.434198, 0, 0, 1, 1, 1,
-1.447636, -0.264698, -3.392837, 1, 0, 0, 1, 1,
-1.444216, 0.8850606, -1.545925, 1, 0, 0, 1, 1,
-1.441484, -1.25005, -3.482488, 1, 0, 0, 1, 1,
-1.438014, 1.146451, -2.183248, 1, 0, 0, 1, 1,
-1.436631, 0.2393727, -2.678213, 1, 0, 0, 1, 1,
-1.413609, -0.1032856, -2.482575, 0, 0, 0, 1, 1,
-1.412919, 1.525459, -2.059779, 0, 0, 0, 1, 1,
-1.405223, -0.9476097, -4.979678, 0, 0, 0, 1, 1,
-1.397488, 0.9851699, -2.686316, 0, 0, 0, 1, 1,
-1.395246, -1.040398, -2.709117, 0, 0, 0, 1, 1,
-1.391186, 1.395255, -1.428694, 0, 0, 0, 1, 1,
-1.382563, -1.163449, -3.015502, 0, 0, 0, 1, 1,
-1.380554, -0.6245701, -3.033279, 1, 1, 1, 1, 1,
-1.377751, 1.847936, -2.271251, 1, 1, 1, 1, 1,
-1.375554, 1.40272, -0.1694182, 1, 1, 1, 1, 1,
-1.341346, 0.238591, -2.439201, 1, 1, 1, 1, 1,
-1.334195, 0.172618, -1.456029, 1, 1, 1, 1, 1,
-1.315834, 0.4000607, -1.756428, 1, 1, 1, 1, 1,
-1.314777, -0.4748967, -0.8456399, 1, 1, 1, 1, 1,
-1.314485, 0.1980013, -1.233553, 1, 1, 1, 1, 1,
-1.29572, 0.2493287, 0.5049306, 1, 1, 1, 1, 1,
-1.288655, 1.544846, -1.140824, 1, 1, 1, 1, 1,
-1.284513, 1.972958, -1.826982, 1, 1, 1, 1, 1,
-1.281655, 0.03580488, 0.07235357, 1, 1, 1, 1, 1,
-1.278989, -1.369791, -1.789998, 1, 1, 1, 1, 1,
-1.272045, 1.726738, 0.3982355, 1, 1, 1, 1, 1,
-1.270517, 1.386732, -2.102327, 1, 1, 1, 1, 1,
-1.255819, -0.343386, -2.013732, 0, 0, 1, 1, 1,
-1.255439, 0.0005987557, -0.002230817, 1, 0, 0, 1, 1,
-1.252464, -1.661239, -1.973186, 1, 0, 0, 1, 1,
-1.247102, 0.129687, -1.021464, 1, 0, 0, 1, 1,
-1.246924, -1.016982, -2.888282, 1, 0, 0, 1, 1,
-1.242446, -1.025856, -2.349029, 1, 0, 0, 1, 1,
-1.233778, 1.413658, -1.68114, 0, 0, 0, 1, 1,
-1.211951, 0.0208783, -1.629145, 0, 0, 0, 1, 1,
-1.207444, -0.9274765, -1.345262, 0, 0, 0, 1, 1,
-1.202926, 1.51447, 0.1742738, 0, 0, 0, 1, 1,
-1.199702, -0.7593362, -3.632432, 0, 0, 0, 1, 1,
-1.197082, 0.4758289, -1.82948, 0, 0, 0, 1, 1,
-1.196933, -1.268112, -2.559073, 0, 0, 0, 1, 1,
-1.185097, 0.6780561, -1.389212, 1, 1, 1, 1, 1,
-1.184012, -0.392086, -1.580161, 1, 1, 1, 1, 1,
-1.181856, 0.8729008, -0.6788488, 1, 1, 1, 1, 1,
-1.180692, 0.8685822, -1.636387, 1, 1, 1, 1, 1,
-1.171299, 0.229245, -1.921585, 1, 1, 1, 1, 1,
-1.16789, -0.09713264, -2.34009, 1, 1, 1, 1, 1,
-1.16662, -2.805022, -3.735427, 1, 1, 1, 1, 1,
-1.163457, -1.459785, -2.076537, 1, 1, 1, 1, 1,
-1.160637, -2.167754, -2.740967, 1, 1, 1, 1, 1,
-1.15956, -0.8004378, -2.712724, 1, 1, 1, 1, 1,
-1.152689, -0.2622148, -1.149065, 1, 1, 1, 1, 1,
-1.151428, -0.3832274, -1.732831, 1, 1, 1, 1, 1,
-1.148032, 0.4966196, -3.208167, 1, 1, 1, 1, 1,
-1.141513, 2.018748, -0.4238869, 1, 1, 1, 1, 1,
-1.140758, -0.1091238, -1.585053, 1, 1, 1, 1, 1,
-1.133026, 0.03437066, -0.828098, 0, 0, 1, 1, 1,
-1.125465, 0.570456, -1.345538, 1, 0, 0, 1, 1,
-1.119696, -0.1459031, -2.729347, 1, 0, 0, 1, 1,
-1.119002, -0.04239287, -0.9756357, 1, 0, 0, 1, 1,
-1.110183, 0.9767643, -0.3359922, 1, 0, 0, 1, 1,
-1.110051, -0.492426, -0.7124817, 1, 0, 0, 1, 1,
-1.105695, 1.756318, 0.205971, 0, 0, 0, 1, 1,
-1.098311, -0.1339856, -2.689419, 0, 0, 0, 1, 1,
-1.097975, 0.6242349, -0.4151275, 0, 0, 0, 1, 1,
-1.096162, -0.9710667, -2.591033, 0, 0, 0, 1, 1,
-1.085911, -0.01683891, -0.2728029, 0, 0, 0, 1, 1,
-1.07729, -1.457153, -1.795573, 0, 0, 0, 1, 1,
-1.072619, 0.6719229, -2.261359, 0, 0, 0, 1, 1,
-1.06903, -1.429331, -1.582387, 1, 1, 1, 1, 1,
-1.066994, 0.6917571, -0.5746658, 1, 1, 1, 1, 1,
-1.060503, -2.084143, -1.087908, 1, 1, 1, 1, 1,
-1.059521, 0.5288379, -0.1659342, 1, 1, 1, 1, 1,
-1.054779, 0.9201418, -1.056698, 1, 1, 1, 1, 1,
-1.052237, -1.534186, -3.795227, 1, 1, 1, 1, 1,
-1.052064, -1.064882, -1.820566, 1, 1, 1, 1, 1,
-1.050166, -1.081222, -3.239354, 1, 1, 1, 1, 1,
-1.0493, 0.5992585, -0.7388939, 1, 1, 1, 1, 1,
-1.048981, -1.333256, -1.602871, 1, 1, 1, 1, 1,
-1.047187, -0.363133, -0.5145837, 1, 1, 1, 1, 1,
-1.047114, -0.2132943, -2.475999, 1, 1, 1, 1, 1,
-1.030638, 1.135853, -0.7694809, 1, 1, 1, 1, 1,
-1.024909, 0.340263, -1.244998, 1, 1, 1, 1, 1,
-1.014061, 0.4125444, -2.151994, 1, 1, 1, 1, 1,
-1.00687, -0.0452113, -1.2265, 0, 0, 1, 1, 1,
-1.006229, -0.8312573, -2.966545, 1, 0, 0, 1, 1,
-1.00512, 0.6343691, -2.303754, 1, 0, 0, 1, 1,
-1.000231, 1.143718, -1.699186, 1, 0, 0, 1, 1,
-0.9960329, -0.8753342, -1.223279, 1, 0, 0, 1, 1,
-0.9847994, 0.7621624, -0.7681277, 1, 0, 0, 1, 1,
-0.9782497, 0.8179011, -1.370239, 0, 0, 0, 1, 1,
-0.9726474, 0.0613527, -1.74696, 0, 0, 0, 1, 1,
-0.970297, -1.017268, -2.415902, 0, 0, 0, 1, 1,
-0.9675626, -0.2547702, -2.11469, 0, 0, 0, 1, 1,
-0.9454482, 1.047865, -1.591091, 0, 0, 0, 1, 1,
-0.9442773, 0.1536218, -1.182989, 0, 0, 0, 1, 1,
-0.934021, 0.23112, -1.240739, 0, 0, 0, 1, 1,
-0.9298226, -1.081243, -1.197831, 1, 1, 1, 1, 1,
-0.9284155, -0.5345154, -1.724665, 1, 1, 1, 1, 1,
-0.9247634, -0.7953993, -1.987454, 1, 1, 1, 1, 1,
-0.9216012, 1.244792, 0.394504, 1, 1, 1, 1, 1,
-0.9192095, -0.338239, -1.682754, 1, 1, 1, 1, 1,
-0.9153001, -0.1988353, -0.3579158, 1, 1, 1, 1, 1,
-0.9080909, 0.2682323, -1.872826, 1, 1, 1, 1, 1,
-0.9056796, -0.7172351, -3.462374, 1, 1, 1, 1, 1,
-0.9005045, -0.8757279, -3.31618, 1, 1, 1, 1, 1,
-0.8965775, 0.5793684, -2.179525, 1, 1, 1, 1, 1,
-0.8906644, 0.8314664, -0.886826, 1, 1, 1, 1, 1,
-0.8840909, 0.2328401, -2.401656, 1, 1, 1, 1, 1,
-0.8832102, 1.176073, 0.8876529, 1, 1, 1, 1, 1,
-0.8802325, 0.1970579, 0.6541611, 1, 1, 1, 1, 1,
-0.8786606, 0.1045663, -1.265355, 1, 1, 1, 1, 1,
-0.8754806, 0.8031048, 0.8042501, 0, 0, 1, 1, 1,
-0.8717759, 1.339892, -0.8728995, 1, 0, 0, 1, 1,
-0.8690886, -0.6549666, -1.677067, 1, 0, 0, 1, 1,
-0.868991, 0.4072548, -1.453776, 1, 0, 0, 1, 1,
-0.8676952, -0.558868, -4.93071, 1, 0, 0, 1, 1,
-0.8662546, 0.6472019, -2.190464, 1, 0, 0, 1, 1,
-0.8646916, -1.91123, -3.0451, 0, 0, 0, 1, 1,
-0.8586429, 1.989664, -0.7545542, 0, 0, 0, 1, 1,
-0.8501164, -0.3236733, -1.700388, 0, 0, 0, 1, 1,
-0.8348294, -1.106746, -3.532407, 0, 0, 0, 1, 1,
-0.8337664, -0.8287122, -1.761535, 0, 0, 0, 1, 1,
-0.8220425, -0.8102776, -1.940271, 0, 0, 0, 1, 1,
-0.8153214, -0.2334527, -1.422588, 0, 0, 0, 1, 1,
-0.814469, 0.9040596, -1.229211, 1, 1, 1, 1, 1,
-0.8118486, -0.0457126, -1.875527, 1, 1, 1, 1, 1,
-0.8091113, -0.629767, -1.853323, 1, 1, 1, 1, 1,
-0.8061462, 0.7767622, -0.8369754, 1, 1, 1, 1, 1,
-0.8044334, 0.2559985, -0.8556965, 1, 1, 1, 1, 1,
-0.7988224, 0.3838544, -0.7719221, 1, 1, 1, 1, 1,
-0.7974389, -0.4489938, -2.842781, 1, 1, 1, 1, 1,
-0.7910839, 0.9311239, 0.05606335, 1, 1, 1, 1, 1,
-0.7844709, -1.423668, -3.040054, 1, 1, 1, 1, 1,
-0.780566, -0.7998888, -3.726017, 1, 1, 1, 1, 1,
-0.7767128, -1.032412, -1.269084, 1, 1, 1, 1, 1,
-0.7749029, 0.3274566, -1.687005, 1, 1, 1, 1, 1,
-0.7675161, -0.4701124, -0.427711, 1, 1, 1, 1, 1,
-0.7655674, 0.6205015, -2.14, 1, 1, 1, 1, 1,
-0.7619016, -0.6415203, -1.489995, 1, 1, 1, 1, 1,
-0.7582348, -0.488468, -0.8046103, 0, 0, 1, 1, 1,
-0.7559606, -0.1876247, -2.070976, 1, 0, 0, 1, 1,
-0.7534438, -0.09243014, -0.03166252, 1, 0, 0, 1, 1,
-0.753014, 2.191582, -1.958122, 1, 0, 0, 1, 1,
-0.7489405, 1.129008, -1.213929, 1, 0, 0, 1, 1,
-0.7481726, 0.6127136, -1.945674, 1, 0, 0, 1, 1,
-0.7418504, 0.3494152, -1.955837, 0, 0, 0, 1, 1,
-0.7333139, 0.1817178, -0.9034628, 0, 0, 0, 1, 1,
-0.7328082, 1.17079, -0.2141125, 0, 0, 0, 1, 1,
-0.7289081, -0.8987336, -1.354668, 0, 0, 0, 1, 1,
-0.7230315, -0.7819121, -3.010328, 0, 0, 0, 1, 1,
-0.7217924, -1.522254, -2.117357, 0, 0, 0, 1, 1,
-0.7166204, 0.3590978, -1.234593, 0, 0, 0, 1, 1,
-0.713064, -0.4847536, -3.908322, 1, 1, 1, 1, 1,
-0.7130159, 1.669501, -1.006717, 1, 1, 1, 1, 1,
-0.7103662, -1.319663, -2.394667, 1, 1, 1, 1, 1,
-0.7100604, -0.9098175, -1.891468, 1, 1, 1, 1, 1,
-0.7090427, -0.5389417, -2.219062, 1, 1, 1, 1, 1,
-0.7089118, -0.02978454, -0.8647237, 1, 1, 1, 1, 1,
-0.6935322, -0.5811201, -1.618832, 1, 1, 1, 1, 1,
-0.6827014, -1.126814, -1.590685, 1, 1, 1, 1, 1,
-0.6821102, 0.1854532, -1.9832, 1, 1, 1, 1, 1,
-0.6819311, -1.011415, -3.044532, 1, 1, 1, 1, 1,
-0.6806998, 0.00206453, -2.076953, 1, 1, 1, 1, 1,
-0.67805, -0.386059, -0.7435871, 1, 1, 1, 1, 1,
-0.6765812, 0.4056405, -1.312047, 1, 1, 1, 1, 1,
-0.6725038, 0.6543394, -1.42914, 1, 1, 1, 1, 1,
-0.6710248, 0.6714619, -0.943087, 1, 1, 1, 1, 1,
-0.6653627, 0.1962615, -1.554063, 0, 0, 1, 1, 1,
-0.6649987, 0.05768499, -1.757495, 1, 0, 0, 1, 1,
-0.6610821, -0.1784319, -2.472549, 1, 0, 0, 1, 1,
-0.6554385, 0.1984324, -2.843325, 1, 0, 0, 1, 1,
-0.6547788, 0.8957094, 1.07703, 1, 0, 0, 1, 1,
-0.6502103, 1.30784, 0.3126794, 1, 0, 0, 1, 1,
-0.6492438, -0.1769065, -0.5199654, 0, 0, 0, 1, 1,
-0.6491657, -0.5030451, -2.992881, 0, 0, 0, 1, 1,
-0.6451278, -1.59813, -2.184304, 0, 0, 0, 1, 1,
-0.6440306, -1.218958, -3.810646, 0, 0, 0, 1, 1,
-0.6438972, -0.9334478, -3.13097, 0, 0, 0, 1, 1,
-0.6258851, -0.6747546, -2.562555, 0, 0, 0, 1, 1,
-0.6237094, 1.15973, -2.122649, 0, 0, 0, 1, 1,
-0.6235478, 0.4437785, -1.700412, 1, 1, 1, 1, 1,
-0.6188931, -0.007295754, -1.017525, 1, 1, 1, 1, 1,
-0.6170101, -1.222116, -1.487402, 1, 1, 1, 1, 1,
-0.609277, -0.2261079, -2.896824, 1, 1, 1, 1, 1,
-0.6081758, -0.8988298, -4.42334, 1, 1, 1, 1, 1,
-0.6073701, -1.036037, -2.392243, 1, 1, 1, 1, 1,
-0.6040915, 0.8097785, -0.7040949, 1, 1, 1, 1, 1,
-0.6037565, 0.6858627, 1.315066, 1, 1, 1, 1, 1,
-0.6009743, -1.539989, -1.299431, 1, 1, 1, 1, 1,
-0.5978246, -0.9849054, -0.4634675, 1, 1, 1, 1, 1,
-0.5944577, 0.5409203, -0.2624909, 1, 1, 1, 1, 1,
-0.5931059, 0.4078733, -1.630985, 1, 1, 1, 1, 1,
-0.5892448, -1.99407, -2.588539, 1, 1, 1, 1, 1,
-0.5864613, 0.5729209, -1.322149, 1, 1, 1, 1, 1,
-0.5806926, -0.5776473, -2.023251, 1, 1, 1, 1, 1,
-0.5792685, -0.5383888, -0.5971663, 0, 0, 1, 1, 1,
-0.5791731, 0.9855561, -2.017967, 1, 0, 0, 1, 1,
-0.5768923, 1.3189, 0.9008626, 1, 0, 0, 1, 1,
-0.5762761, -0.2409698, -1.173941, 1, 0, 0, 1, 1,
-0.5733436, 1.682395, 1.079228, 1, 0, 0, 1, 1,
-0.5731791, -0.4438919, -1.299013, 1, 0, 0, 1, 1,
-0.5699238, 0.2498321, -1.425528, 0, 0, 0, 1, 1,
-0.5591727, -0.3827543, -2.37531, 0, 0, 0, 1, 1,
-0.5580968, -0.6764957, -4.919181, 0, 0, 0, 1, 1,
-0.5558674, 1.776075, -0.8876641, 0, 0, 0, 1, 1,
-0.5519389, -0.818287, -3.34919, 0, 0, 0, 1, 1,
-0.5488063, -0.1526122, -3.413371, 0, 0, 0, 1, 1,
-0.5486842, -0.8874357, -1.691837, 0, 0, 0, 1, 1,
-0.5445399, -0.3659625, -2.977216, 1, 1, 1, 1, 1,
-0.5397981, -0.2695459, -4.130315, 1, 1, 1, 1, 1,
-0.5354378, 0.3789587, -1.130184, 1, 1, 1, 1, 1,
-0.5350996, -0.8543183, -4.253117, 1, 1, 1, 1, 1,
-0.5328661, 1.978667, -0.8804226, 1, 1, 1, 1, 1,
-0.529655, -0.7346647, -3.07014, 1, 1, 1, 1, 1,
-0.5289422, -1.174752, -4.810177, 1, 1, 1, 1, 1,
-0.526111, 0.2619025, -2.171577, 1, 1, 1, 1, 1,
-0.5227023, -0.5954947, -2.021833, 1, 1, 1, 1, 1,
-0.5218593, -1.734877, -3.369865, 1, 1, 1, 1, 1,
-0.5209213, -0.466465, -0.8900277, 1, 1, 1, 1, 1,
-0.5207034, -0.0842851, -1.092344, 1, 1, 1, 1, 1,
-0.5153919, -0.4153791, -3.65836, 1, 1, 1, 1, 1,
-0.5132338, -0.6930634, -2.121528, 1, 1, 1, 1, 1,
-0.5077276, 1.183609, -1.081829, 1, 1, 1, 1, 1,
-0.5057719, 0.2553413, -1.613636, 0, 0, 1, 1, 1,
-0.5003482, 1.018385, -1.49068, 1, 0, 0, 1, 1,
-0.4987517, -2.371322, -3.544079, 1, 0, 0, 1, 1,
-0.4973813, -0.0325212, -1.444891, 1, 0, 0, 1, 1,
-0.4913, 1.275589, -0.3886538, 1, 0, 0, 1, 1,
-0.4886053, -0.1730195, -3.363293, 1, 0, 0, 1, 1,
-0.4845124, -1.233622, -3.385609, 0, 0, 0, 1, 1,
-0.4816534, -1.524988, -3.486011, 0, 0, 0, 1, 1,
-0.47657, 0.2372049, -2.382578, 0, 0, 0, 1, 1,
-0.4755509, -1.101246, -2.713635, 0, 0, 0, 1, 1,
-0.4753933, 0.4273067, -1.993914, 0, 0, 0, 1, 1,
-0.4749126, -0.5885068, -2.514601, 0, 0, 0, 1, 1,
-0.4731958, -1.097288, -2.458956, 0, 0, 0, 1, 1,
-0.4711694, 0.5117697, -0.2367032, 1, 1, 1, 1, 1,
-0.4689977, 0.752738, -0.883375, 1, 1, 1, 1, 1,
-0.461979, -1.838117, -3.291115, 1, 1, 1, 1, 1,
-0.4615957, -0.2409509, -2.60525, 1, 1, 1, 1, 1,
-0.46105, 0.2661098, -0.9502724, 1, 1, 1, 1, 1,
-0.4600373, 0.6375834, -0.1251369, 1, 1, 1, 1, 1,
-0.4594035, 0.5620374, -1.816336, 1, 1, 1, 1, 1,
-0.4581618, -0.9476711, -3.698286, 1, 1, 1, 1, 1,
-0.4576958, -0.09956209, -2.730265, 1, 1, 1, 1, 1,
-0.4570637, 1.814322, -0.6558241, 1, 1, 1, 1, 1,
-0.4545318, 0.6090708, -2.126731, 1, 1, 1, 1, 1,
-0.4538172, 0.1245604, -1.485985, 1, 1, 1, 1, 1,
-0.4523747, -0.3702472, -2.496742, 1, 1, 1, 1, 1,
-0.4512419, -0.2268054, -2.359701, 1, 1, 1, 1, 1,
-0.450927, -0.3611302, -2.143067, 1, 1, 1, 1, 1,
-0.446265, -0.5583699, -0.08487069, 0, 0, 1, 1, 1,
-0.439879, 0.2196696, -2.072382, 1, 0, 0, 1, 1,
-0.4393079, 0.5763074, -1.277464, 1, 0, 0, 1, 1,
-0.4340592, -0.08428569, -2.926796, 1, 0, 0, 1, 1,
-0.4295704, 0.9791762, -1.836794, 1, 0, 0, 1, 1,
-0.4283427, 0.7105064, -1.12924, 1, 0, 0, 1, 1,
-0.427259, 0.4604121, -0.01941594, 0, 0, 0, 1, 1,
-0.4246867, -0.1885131, -0.78253, 0, 0, 0, 1, 1,
-0.4232625, 0.2984084, 1.870447, 0, 0, 0, 1, 1,
-0.4202676, 0.5097884, -0.07298748, 0, 0, 0, 1, 1,
-0.4202474, -0.5754852, -2.89449, 0, 0, 0, 1, 1,
-0.4146235, -2.031345, -2.860816, 0, 0, 0, 1, 1,
-0.4137723, -0.5737938, -1.119945, 0, 0, 0, 1, 1,
-0.4116858, 0.6325322, -0.8174148, 1, 1, 1, 1, 1,
-0.3986064, 1.804688, -0.3628674, 1, 1, 1, 1, 1,
-0.3985671, 0.6277809, -1.135189, 1, 1, 1, 1, 1,
-0.3950697, -0.08670267, -1.078335, 1, 1, 1, 1, 1,
-0.3947834, -0.1945342, -1.490699, 1, 1, 1, 1, 1,
-0.3941091, 0.9589908, -0.602866, 1, 1, 1, 1, 1,
-0.3892093, -1.282839, -3.517291, 1, 1, 1, 1, 1,
-0.3840796, -0.9448256, -2.332536, 1, 1, 1, 1, 1,
-0.3819334, -1.479597, -2.608603, 1, 1, 1, 1, 1,
-0.3727269, -0.5044825, -4.098421, 1, 1, 1, 1, 1,
-0.3711952, -0.8867471, -2.671139, 1, 1, 1, 1, 1,
-0.370789, -0.7729468, -2.378432, 1, 1, 1, 1, 1,
-0.3669171, -1.192583, -1.95293, 1, 1, 1, 1, 1,
-0.3629063, 0.1629604, 0.6981897, 1, 1, 1, 1, 1,
-0.3591167, 1.662911, -1.360519, 1, 1, 1, 1, 1,
-0.3588717, -0.8425314, -2.856667, 0, 0, 1, 1, 1,
-0.355152, 0.4618379, -0.5560681, 1, 0, 0, 1, 1,
-0.3547698, -1.133124, -1.782343, 1, 0, 0, 1, 1,
-0.3540169, 1.249896, -0.8987672, 1, 0, 0, 1, 1,
-0.3534827, -0.977483, -1.746626, 1, 0, 0, 1, 1,
-0.3504041, -0.2743365, -1.205641, 1, 0, 0, 1, 1,
-0.3493762, -2.100254, -2.927023, 0, 0, 0, 1, 1,
-0.3483301, -1.704162, -3.226719, 0, 0, 0, 1, 1,
-0.3427123, -1.024334, -1.85097, 0, 0, 0, 1, 1,
-0.3416635, 0.8972562, 0.1556817, 0, 0, 0, 1, 1,
-0.338526, -0.5289841, -3.907558, 0, 0, 0, 1, 1,
-0.3381271, 1.136122, -0.4004715, 0, 0, 0, 1, 1,
-0.336586, 2.248814, -0.06872407, 0, 0, 0, 1, 1,
-0.3348374, -0.6855935, -1.432621, 1, 1, 1, 1, 1,
-0.3332411, 0.6266572, -0.06642263, 1, 1, 1, 1, 1,
-0.3326306, -1.068475, -4.695088, 1, 1, 1, 1, 1,
-0.3317257, -0.7823842, -3.715878, 1, 1, 1, 1, 1,
-0.3307754, -2.178378, -1.578992, 1, 1, 1, 1, 1,
-0.3269768, -0.2033367, -1.730469, 1, 1, 1, 1, 1,
-0.3258329, 0.09372135, -1.756838, 1, 1, 1, 1, 1,
-0.3251062, 0.3743182, 0.3602372, 1, 1, 1, 1, 1,
-0.3248847, -0.2050613, -0.9179096, 1, 1, 1, 1, 1,
-0.3241508, 0.2575594, -1.098329, 1, 1, 1, 1, 1,
-0.3238668, -0.02402111, -1.513101, 1, 1, 1, 1, 1,
-0.3184519, 1.53997, -1.071898, 1, 1, 1, 1, 1,
-0.3111975, -1.245961, -2.652165, 1, 1, 1, 1, 1,
-0.3086798, -1.526346, -2.70703, 1, 1, 1, 1, 1,
-0.3076199, -0.739481, -2.991647, 1, 1, 1, 1, 1,
-0.3068665, 1.138316, -1.603039, 0, 0, 1, 1, 1,
-0.3062626, -0.1628667, -2.451013, 1, 0, 0, 1, 1,
-0.2998222, 0.2655728, -1.302463, 1, 0, 0, 1, 1,
-0.2903897, 0.4351636, -0.1991008, 1, 0, 0, 1, 1,
-0.2899596, -0.4504375, -4.092287, 1, 0, 0, 1, 1,
-0.2895477, 0.7704, -1.840302, 1, 0, 0, 1, 1,
-0.2888046, -0.8078566, -3.405104, 0, 0, 0, 1, 1,
-0.2879146, 0.2352915, -1.101481, 0, 0, 0, 1, 1,
-0.2836926, -1.749633, -0.8970339, 0, 0, 0, 1, 1,
-0.2768076, 0.06629284, -0.9913427, 0, 0, 0, 1, 1,
-0.2755218, 0.1324157, -0.4709098, 0, 0, 0, 1, 1,
-0.2746958, -0.3837458, -2.382102, 0, 0, 0, 1, 1,
-0.2735108, -1.081064, -2.715926, 0, 0, 0, 1, 1,
-0.2710292, 0.5973408, 0.2148172, 1, 1, 1, 1, 1,
-0.2690642, 0.392613, 0.9860395, 1, 1, 1, 1, 1,
-0.2690529, -1.348107, -2.491271, 1, 1, 1, 1, 1,
-0.2650079, 1.491394, -0.8786616, 1, 1, 1, 1, 1,
-0.2643156, 0.4530352, -1.307642, 1, 1, 1, 1, 1,
-0.2608449, 1.866644, -1.195914, 1, 1, 1, 1, 1,
-0.2595996, -0.2967278, -3.605501, 1, 1, 1, 1, 1,
-0.2592527, -0.389373, -2.244096, 1, 1, 1, 1, 1,
-0.2581784, 0.1548956, -1.848291, 1, 1, 1, 1, 1,
-0.2579675, -0.9284929, -2.870135, 1, 1, 1, 1, 1,
-0.2578208, 0.2595969, 0.8076655, 1, 1, 1, 1, 1,
-0.2525277, -0.9508677, -0.7365869, 1, 1, 1, 1, 1,
-0.2511185, 0.5570147, 1.180487, 1, 1, 1, 1, 1,
-0.2503487, 0.6285406, -0.7763505, 1, 1, 1, 1, 1,
-0.2501749, 0.5575705, -0.3850677, 1, 1, 1, 1, 1,
-0.2466991, 1.046304, -1.66416, 0, 0, 1, 1, 1,
-0.2456318, 2.18656, 0.31858, 1, 0, 0, 1, 1,
-0.2448156, -0.1754537, -4.337211, 1, 0, 0, 1, 1,
-0.2432854, 0.2827134, -0.9506765, 1, 0, 0, 1, 1,
-0.2397528, -0.3112577, -3.914032, 1, 0, 0, 1, 1,
-0.2344361, 1.612516, -1.33559, 1, 0, 0, 1, 1,
-0.2326339, 1.136952, -0.1133575, 0, 0, 0, 1, 1,
-0.2318154, -2.000639, -3.086427, 0, 0, 0, 1, 1,
-0.2302867, 0.3438393, -0.05859449, 0, 0, 0, 1, 1,
-0.2235181, -0.8358413, -1.617506, 0, 0, 0, 1, 1,
-0.220995, -1.260564, -2.80478, 0, 0, 0, 1, 1,
-0.220474, -1.791001, -3.147277, 0, 0, 0, 1, 1,
-0.2202445, -0.4784234, -2.434327, 0, 0, 0, 1, 1,
-0.2086284, -0.1940253, -1.844209, 1, 1, 1, 1, 1,
-0.2064293, 0.5136951, -0.3524771, 1, 1, 1, 1, 1,
-0.2007861, 1.208034, 0.07542246, 1, 1, 1, 1, 1,
-0.2003286, 2.067697, 0.647373, 1, 1, 1, 1, 1,
-0.1928983, 0.02938104, -1.252618, 1, 1, 1, 1, 1,
-0.190935, -0.3857751, -2.552327, 1, 1, 1, 1, 1,
-0.1863249, -0.2753204, -2.12271, 1, 1, 1, 1, 1,
-0.185941, 1.176246, -0.5521501, 1, 1, 1, 1, 1,
-0.1849393, 1.469507, -0.6765602, 1, 1, 1, 1, 1,
-0.1848067, 0.2202728, -2.795867, 1, 1, 1, 1, 1,
-0.1784701, -0.4671358, -2.444558, 1, 1, 1, 1, 1,
-0.1777079, -0.3288698, -3.247726, 1, 1, 1, 1, 1,
-0.1763299, 1.251506, -1.136413, 1, 1, 1, 1, 1,
-0.172198, 0.2292081, -0.5117505, 1, 1, 1, 1, 1,
-0.1714861, 1.549626, -0.9335802, 1, 1, 1, 1, 1,
-0.1705772, -0.8974069, -2.491065, 0, 0, 1, 1, 1,
-0.1671511, 2.124358, -1.350403, 1, 0, 0, 1, 1,
-0.1668182, 0.6296718, -1.256595, 1, 0, 0, 1, 1,
-0.1661312, 0.04790478, -3.627821, 1, 0, 0, 1, 1,
-0.161361, 0.7542847, -1.962187, 1, 0, 0, 1, 1,
-0.1565005, 0.7906659, -0.6087512, 1, 0, 0, 1, 1,
-0.1550974, -1.495567, -4.31663, 0, 0, 0, 1, 1,
-0.153982, 0.8267196, 1.235173, 0, 0, 0, 1, 1,
-0.1537911, 1.462923, 0.7893959, 0, 0, 0, 1, 1,
-0.1535984, -0.2488505, -1.778673, 0, 0, 0, 1, 1,
-0.1491608, 0.04525756, -1.924995, 0, 0, 0, 1, 1,
-0.140018, 0.2314338, 0.9990705, 0, 0, 0, 1, 1,
-0.1339966, 0.523216, -0.6057286, 0, 0, 0, 1, 1,
-0.1338788, -0.6022174, -2.206796, 1, 1, 1, 1, 1,
-0.1322837, 1.538713, 1.183969, 1, 1, 1, 1, 1,
-0.1311472, -0.7249153, -3.448552, 1, 1, 1, 1, 1,
-0.1279061, -1.503161, -1.510761, 1, 1, 1, 1, 1,
-0.1100389, -0.3453069, -2.738801, 1, 1, 1, 1, 1,
-0.1094399, -0.7089725, -2.255085, 1, 1, 1, 1, 1,
-0.1092892, 0.7071275, 0.05754431, 1, 1, 1, 1, 1,
-0.1079782, 0.512153, -0.4532453, 1, 1, 1, 1, 1,
-0.09615175, 0.0356808, -0.06092206, 1, 1, 1, 1, 1,
-0.09438267, -1.731286, -5.012721, 1, 1, 1, 1, 1,
-0.09068995, -1.19962, -4.210625, 1, 1, 1, 1, 1,
-0.08395403, 0.4287216, 0.6985785, 1, 1, 1, 1, 1,
-0.08220415, 1.796623, -0.753251, 1, 1, 1, 1, 1,
-0.07902832, 0.7139013, -0.2682203, 1, 1, 1, 1, 1,
-0.07836263, -1.106153, -3.359591, 1, 1, 1, 1, 1,
-0.07394927, 0.8545716, -0.8811291, 0, 0, 1, 1, 1,
-0.0738518, -0.2921096, -2.355824, 1, 0, 0, 1, 1,
-0.07007948, 0.05150064, -2.083496, 1, 0, 0, 1, 1,
-0.06952994, 0.2993184, 1.167235, 1, 0, 0, 1, 1,
-0.06740116, 0.6445082, 1.344621, 1, 0, 0, 1, 1,
-0.06076686, 1.011929, -0.8672844, 1, 0, 0, 1, 1,
-0.05572582, -0.4312689, -2.612389, 0, 0, 0, 1, 1,
-0.05163933, -2.470618, -3.430487, 0, 0, 0, 1, 1,
-0.05129855, -0.7617106, -3.616034, 0, 0, 0, 1, 1,
-0.05018527, -1.434424, -2.41588, 0, 0, 0, 1, 1,
-0.04768096, -1.078273, -3.469368, 0, 0, 0, 1, 1,
-0.04645653, 1.546017, 0.2671843, 0, 0, 0, 1, 1,
-0.04530554, -0.1290219, -3.400572, 0, 0, 0, 1, 1,
-0.04502598, 1.161426, -0.2476155, 1, 1, 1, 1, 1,
-0.04104454, 1.991327, -0.2691078, 1, 1, 1, 1, 1,
-0.03628661, -1.592712, -2.854816, 1, 1, 1, 1, 1,
-0.02780625, -0.2899299, -2.657559, 1, 1, 1, 1, 1,
-0.02381716, 0.08041499, -1.914292, 1, 1, 1, 1, 1,
-0.01726413, 2.278779, 0.1265905, 1, 1, 1, 1, 1,
-0.01310463, 0.09705475, 0.9362367, 1, 1, 1, 1, 1,
-0.01271654, 0.7309301, 0.3226587, 1, 1, 1, 1, 1,
-0.01212931, 0.7570291, 0.6517832, 1, 1, 1, 1, 1,
0.003218936, -0.6710065, 3.011723, 1, 1, 1, 1, 1,
0.004156637, -1.650398, 3.414689, 1, 1, 1, 1, 1,
0.01277019, 0.9521064, -0.7520904, 1, 1, 1, 1, 1,
0.01804006, 0.02890494, 0.5120247, 1, 1, 1, 1, 1,
0.0203828, 1.177925, 0.4403653, 1, 1, 1, 1, 1,
0.02107398, 0.9060757, -1.012801, 1, 1, 1, 1, 1,
0.02191911, 0.3317332, 1.090719, 0, 0, 1, 1, 1,
0.02463137, 0.8532998, -2.292072, 1, 0, 0, 1, 1,
0.02574491, -0.5799388, 4.053691, 1, 0, 0, 1, 1,
0.02852553, -0.7110685, 3.678735, 1, 0, 0, 1, 1,
0.02950036, 2.075126, 0.6745619, 1, 0, 0, 1, 1,
0.03262104, 1.2869, 0.02579228, 1, 0, 0, 1, 1,
0.03452314, -0.2660774, 3.91492, 0, 0, 0, 1, 1,
0.03584704, -2.037551, 3.343306, 0, 0, 0, 1, 1,
0.03731172, 0.151247, 0.021214, 0, 0, 0, 1, 1,
0.03840289, 0.5941981, 1.388606, 0, 0, 0, 1, 1,
0.04205056, 1.021466, -1.05543, 0, 0, 0, 1, 1,
0.04464788, 1.338879, -0.1007684, 0, 0, 0, 1, 1,
0.04468082, -1.10307, 2.826574, 0, 0, 0, 1, 1,
0.04539, -0.1712057, 1.988546, 1, 1, 1, 1, 1,
0.0459097, -0.34094, 2.910794, 1, 1, 1, 1, 1,
0.04591932, 0.5680999, -0.1959569, 1, 1, 1, 1, 1,
0.05092882, 2.941965, -2.826905, 1, 1, 1, 1, 1,
0.054579, 0.1860904, 0.02488806, 1, 1, 1, 1, 1,
0.05549959, -1.181869, 4.34795, 1, 1, 1, 1, 1,
0.0580955, 1.008388, -1.770292, 1, 1, 1, 1, 1,
0.05838772, -0.2587481, 2.707181, 1, 1, 1, 1, 1,
0.05976823, -0.385575, 2.311809, 1, 1, 1, 1, 1,
0.06000736, -0.09883624, 2.170456, 1, 1, 1, 1, 1,
0.06362433, -0.01736099, 1.20892, 1, 1, 1, 1, 1,
0.06902159, -0.7076806, 2.709051, 1, 1, 1, 1, 1,
0.06997138, -0.4958541, 3.396341, 1, 1, 1, 1, 1,
0.07042658, -1.666514, 2.552103, 1, 1, 1, 1, 1,
0.07156356, -0.9256039, 3.014907, 1, 1, 1, 1, 1,
0.08066384, -0.0926028, 1.893563, 0, 0, 1, 1, 1,
0.08068028, 0.1464683, -0.8694357, 1, 0, 0, 1, 1,
0.08599553, 0.3791127, -1.281844, 1, 0, 0, 1, 1,
0.08636391, 0.2441584, 0.2521202, 1, 0, 0, 1, 1,
0.08936986, -0.9798023, 3.817768, 1, 0, 0, 1, 1,
0.09106723, 1.506044, 0.9364154, 1, 0, 0, 1, 1,
0.09198206, 0.5923694, 0.5592626, 0, 0, 0, 1, 1,
0.0959259, -1.349868, 4.789553, 0, 0, 0, 1, 1,
0.09723704, 1.390897, 0.6163195, 0, 0, 0, 1, 1,
0.100417, -0.9129035, 4.177704, 0, 0, 0, 1, 1,
0.1008788, 2.071267, 2.558652, 0, 0, 0, 1, 1,
0.1056825, -1.63109, 3.98201, 0, 0, 0, 1, 1,
0.1069003, -0.4802147, 3.127556, 0, 0, 0, 1, 1,
0.1071759, -0.1001569, 1.64362, 1, 1, 1, 1, 1,
0.1073237, 0.6723019, -2.027535, 1, 1, 1, 1, 1,
0.1085393, -0.4265432, 3.354626, 1, 1, 1, 1, 1,
0.1104579, -0.7777492, 2.752763, 1, 1, 1, 1, 1,
0.1120558, 0.4339686, 1.066723, 1, 1, 1, 1, 1,
0.1155846, -0.1567899, 1.580117, 1, 1, 1, 1, 1,
0.1170365, -0.07290007, 0.756126, 1, 1, 1, 1, 1,
0.1200203, 0.3290889, 0.9102405, 1, 1, 1, 1, 1,
0.1263244, -0.2208325, 2.907551, 1, 1, 1, 1, 1,
0.1270715, -0.1608586, 0.3582508, 1, 1, 1, 1, 1,
0.1332146, -1.313078, 1.857971, 1, 1, 1, 1, 1,
0.1353107, 0.4522304, 1.487455, 1, 1, 1, 1, 1,
0.1353277, -0.8341189, 3.657625, 1, 1, 1, 1, 1,
0.1360733, 0.9208657, -0.04769607, 1, 1, 1, 1, 1,
0.1382166, 1.728478, 0.8962508, 1, 1, 1, 1, 1,
0.1384024, -0.7371611, 2.892864, 0, 0, 1, 1, 1,
0.1384402, -0.6668551, 1.620386, 1, 0, 0, 1, 1,
0.1400967, -1.811713, 0.5053942, 1, 0, 0, 1, 1,
0.1404092, 0.5213168, 0.5423443, 1, 0, 0, 1, 1,
0.1422834, -0.9927223, 3.426608, 1, 0, 0, 1, 1,
0.1430209, 0.1366056, 2.610627, 1, 0, 0, 1, 1,
0.149297, 0.4199046, 0.6734411, 0, 0, 0, 1, 1,
0.1500346, -1.184167, 1.965288, 0, 0, 0, 1, 1,
0.1507044, 1.845723, -0.692763, 0, 0, 0, 1, 1,
0.1509107, 1.044688, -0.4354693, 0, 0, 0, 1, 1,
0.1509222, -1.723786, 4.231798, 0, 0, 0, 1, 1,
0.1656871, -1.363042, 2.722733, 0, 0, 0, 1, 1,
0.1699733, -0.9697996, 1.596357, 0, 0, 0, 1, 1,
0.1708661, -0.9194334, 3.03903, 1, 1, 1, 1, 1,
0.173004, -1.557203, 2.876094, 1, 1, 1, 1, 1,
0.1732273, -0.7751639, 2.467887, 1, 1, 1, 1, 1,
0.1735586, -0.3883678, 2.980984, 1, 1, 1, 1, 1,
0.1789164, -2.080921, 2.837027, 1, 1, 1, 1, 1,
0.1793915, 0.07488326, 2.449115, 1, 1, 1, 1, 1,
0.1805461, 0.7988537, 0.3655895, 1, 1, 1, 1, 1,
0.1807584, 0.4437771, 2.177663, 1, 1, 1, 1, 1,
0.1819558, -0.7810201, 3.140735, 1, 1, 1, 1, 1,
0.1961956, 0.6847109, -0.08446019, 1, 1, 1, 1, 1,
0.196482, 1.429392, 0.7390621, 1, 1, 1, 1, 1,
0.1973082, 1.427479, 0.481135, 1, 1, 1, 1, 1,
0.2070579, 0.1065899, 0.7732905, 1, 1, 1, 1, 1,
0.2102915, 1.399761, 0.4840771, 1, 1, 1, 1, 1,
0.2119939, -0.9270433, 2.42026, 1, 1, 1, 1, 1,
0.2122045, -0.1577488, 2.417814, 0, 0, 1, 1, 1,
0.2224997, -0.01132196, 0.07665382, 1, 0, 0, 1, 1,
0.2225961, -0.0742609, 1.163513, 1, 0, 0, 1, 1,
0.2293517, 0.1186538, 1.267275, 1, 0, 0, 1, 1,
0.2329523, 0.4583825, 0.7528158, 1, 0, 0, 1, 1,
0.2331336, 0.9842204, 1.9153, 1, 0, 0, 1, 1,
0.2339124, 0.6430572, 1.1931, 0, 0, 0, 1, 1,
0.2352246, 0.418007, -0.4032697, 0, 0, 0, 1, 1,
0.2371048, 0.3206547, 0.5102381, 0, 0, 0, 1, 1,
0.2379837, 1.058338, 0.5556817, 0, 0, 0, 1, 1,
0.2396213, 0.1536117, 0.3827146, 0, 0, 0, 1, 1,
0.2409964, 1.13478, 0.720173, 0, 0, 0, 1, 1,
0.2445133, 1.983591, 1.758866, 0, 0, 0, 1, 1,
0.245203, -0.4069712, 2.333579, 1, 1, 1, 1, 1,
0.2461692, -0.7814289, 3.064068, 1, 1, 1, 1, 1,
0.2496012, 0.7206159, 1.058588, 1, 1, 1, 1, 1,
0.2521104, -0.8129588, 1.723946, 1, 1, 1, 1, 1,
0.2537315, 1.590371, -0.03690339, 1, 1, 1, 1, 1,
0.2632808, 0.5048212, 0.4362215, 1, 1, 1, 1, 1,
0.2711088, -0.1821492, 1.969811, 1, 1, 1, 1, 1,
0.2714719, 0.1886648, 1.506982, 1, 1, 1, 1, 1,
0.2768398, -0.4579442, 1.549815, 1, 1, 1, 1, 1,
0.2771624, -0.9022123, 3.461717, 1, 1, 1, 1, 1,
0.2778444, 0.876535, 0.9586206, 1, 1, 1, 1, 1,
0.2812827, 0.2504081, 1.471026, 1, 1, 1, 1, 1,
0.2829537, 1.28148, 0.3199686, 1, 1, 1, 1, 1,
0.2845303, -0.190459, 1.786887, 1, 1, 1, 1, 1,
0.2866463, 0.07638571, 1.123742, 1, 1, 1, 1, 1,
0.2872561, 0.9381692, 0.337207, 0, 0, 1, 1, 1,
0.2897922, 0.004774929, 1.061841, 1, 0, 0, 1, 1,
0.2899441, 0.3423131, 0.5280355, 1, 0, 0, 1, 1,
0.2908181, -0.4359955, 2.470149, 1, 0, 0, 1, 1,
0.2918926, 0.8809467, 2.070097, 1, 0, 0, 1, 1,
0.2922065, -0.1764618, 1.124415, 1, 0, 0, 1, 1,
0.3024116, -1.226742, 3.59144, 0, 0, 0, 1, 1,
0.3034512, 0.2074577, 1.180162, 0, 0, 0, 1, 1,
0.3052266, -0.839071, 2.841304, 0, 0, 0, 1, 1,
0.3095353, 1.20389, -0.9221319, 0, 0, 0, 1, 1,
0.3130152, -0.4855103, 3.486951, 0, 0, 0, 1, 1,
0.3147606, 1.062284, 0.331743, 0, 0, 0, 1, 1,
0.3175827, -0.2503494, 2.978834, 0, 0, 0, 1, 1,
0.3188208, -0.2742457, 2.862962, 1, 1, 1, 1, 1,
0.3196279, 0.4611476, 0.09456588, 1, 1, 1, 1, 1,
0.321156, -0.521184, 2.592467, 1, 1, 1, 1, 1,
0.3217937, 1.1546, -0.4385945, 1, 1, 1, 1, 1,
0.3218612, 2.175262, -0.9796255, 1, 1, 1, 1, 1,
0.3297779, 1.078873, -1.485096, 1, 1, 1, 1, 1,
0.3326185, 0.4230472, 1.55648, 1, 1, 1, 1, 1,
0.3382674, -0.6477013, 2.408086, 1, 1, 1, 1, 1,
0.3386288, 1.283367, -0.3445309, 1, 1, 1, 1, 1,
0.3404783, 1.692016, 1.303116, 1, 1, 1, 1, 1,
0.3446007, 1.032374, -0.953638, 1, 1, 1, 1, 1,
0.3447201, 0.190604, 2.187204, 1, 1, 1, 1, 1,
0.3448085, -1.580629, 4.325489, 1, 1, 1, 1, 1,
0.3512028, 0.8155659, -1.051256, 1, 1, 1, 1, 1,
0.3598752, 0.2628917, 1.607888, 1, 1, 1, 1, 1,
0.3608426, 0.5393882, -0.3776312, 0, 0, 1, 1, 1,
0.3673703, 0.265234, -1.554196, 1, 0, 0, 1, 1,
0.3752188, 1.609973, 1.7438, 1, 0, 0, 1, 1,
0.3771858, 0.9201139, 0.289681, 1, 0, 0, 1, 1,
0.379683, -0.206873, 2.181657, 1, 0, 0, 1, 1,
0.3803164, -0.5903717, 0.7365447, 1, 0, 0, 1, 1,
0.38064, 1.159746, -0.5292367, 0, 0, 0, 1, 1,
0.3811956, 0.5249415, 1.351373, 0, 0, 0, 1, 1,
0.3821048, 1.732875, 0.008727476, 0, 0, 0, 1, 1,
0.382765, 0.1045917, 1.74323, 0, 0, 0, 1, 1,
0.3832481, -0.9107785, 1.700182, 0, 0, 0, 1, 1,
0.3841352, -0.2307776, -0.1701187, 0, 0, 0, 1, 1,
0.3868867, 1.147267, -1.186808, 0, 0, 0, 1, 1,
0.39365, 1.719565, -0.7363547, 1, 1, 1, 1, 1,
0.3941901, -0.398752, 2.56003, 1, 1, 1, 1, 1,
0.3947649, -1.000254, 2.010108, 1, 1, 1, 1, 1,
0.3949445, -0.07660499, 1.405679, 1, 1, 1, 1, 1,
0.3961299, 0.6104523, -0.9215896, 1, 1, 1, 1, 1,
0.3989227, -0.8120263, 3.165857, 1, 1, 1, 1, 1,
0.4011312, 0.467105, -0.847595, 1, 1, 1, 1, 1,
0.405181, 2.204356, 0.138715, 1, 1, 1, 1, 1,
0.4082032, -0.9841657, 2.945008, 1, 1, 1, 1, 1,
0.4096115, 0.6111528, -0.9802098, 1, 1, 1, 1, 1,
0.4128552, 0.1567429, 1.580687, 1, 1, 1, 1, 1,
0.4132719, -0.3517364, 4.449364, 1, 1, 1, 1, 1,
0.4161352, -0.5587729, 1.280142, 1, 1, 1, 1, 1,
0.4163792, 2.026738, -0.3385978, 1, 1, 1, 1, 1,
0.4184436, 2.457378, -0.2532671, 1, 1, 1, 1, 1,
0.4189551, 0.475715, -1.055899, 0, 0, 1, 1, 1,
0.4190541, 0.5513346, -0.4910052, 1, 0, 0, 1, 1,
0.4225552, 0.537086, 3.068302, 1, 0, 0, 1, 1,
0.4246368, 1.370524, 0.3413666, 1, 0, 0, 1, 1,
0.4247437, 0.2359485, 2.238272, 1, 0, 0, 1, 1,
0.4247748, -0.08579349, 0.5485954, 1, 0, 0, 1, 1,
0.4327278, 0.3281642, 0.234231, 0, 0, 0, 1, 1,
0.4337436, -0.3731879, 3.584188, 0, 0, 0, 1, 1,
0.4420547, -1.223637, 0.9613568, 0, 0, 0, 1, 1,
0.4438823, 0.629827, 0.7679482, 0, 0, 0, 1, 1,
0.4466977, -0.3004324, 2.843895, 0, 0, 0, 1, 1,
0.447016, -0.3148674, 2.32702, 0, 0, 0, 1, 1,
0.4486055, 1.096296, 0.06089387, 0, 0, 0, 1, 1,
0.4501946, 1.439469, 1.109054, 1, 1, 1, 1, 1,
0.4524782, -1.409514, 2.793932, 1, 1, 1, 1, 1,
0.4542796, -0.05298208, 0.4097323, 1, 1, 1, 1, 1,
0.4585341, -1.076293, 3.823543, 1, 1, 1, 1, 1,
0.4621797, 0.5485571, 1.851107, 1, 1, 1, 1, 1,
0.4633395, -0.3683787, 2.016341, 1, 1, 1, 1, 1,
0.4640622, -0.3884082, 2.421644, 1, 1, 1, 1, 1,
0.4727609, 1.142457, 0.5531552, 1, 1, 1, 1, 1,
0.4778311, 1.405515, -0.8258647, 1, 1, 1, 1, 1,
0.4852354, 0.5505322, -0.8624707, 1, 1, 1, 1, 1,
0.4913549, -0.3276362, 1.890022, 1, 1, 1, 1, 1,
0.4913677, -0.3007017, 3.185147, 1, 1, 1, 1, 1,
0.4925828, -1.039034, 2.921775, 1, 1, 1, 1, 1,
0.4977596, 0.0314863, 0.9752401, 1, 1, 1, 1, 1,
0.4992086, -0.3815928, 1.261827, 1, 1, 1, 1, 1,
0.4998934, 2.272244, -1.964495, 0, 0, 1, 1, 1,
0.5080825, 1.436738, -0.0314117, 1, 0, 0, 1, 1,
0.5108234, -1.72188, 1.32161, 1, 0, 0, 1, 1,
0.5187809, -0.6412976, 2.402785, 1, 0, 0, 1, 1,
0.5212601, -0.3241448, 1.225331, 1, 0, 0, 1, 1,
0.5244395, -0.8062199, 1.552287, 1, 0, 0, 1, 1,
0.5284038, 1.280167, 1.154203, 0, 0, 0, 1, 1,
0.5326055, -0.5877252, 1.262066, 0, 0, 0, 1, 1,
0.5336624, -0.2478037, 0.4012842, 0, 0, 0, 1, 1,
0.5347746, 0.02615807, 3.336531, 0, 0, 0, 1, 1,
0.538493, -2.47162, 3.696609, 0, 0, 0, 1, 1,
0.555341, -1.251229, 5.505551, 0, 0, 0, 1, 1,
0.5613168, 1.194213, 0.8059205, 0, 0, 0, 1, 1,
0.5684866, -1.053616, 4.378236, 1, 1, 1, 1, 1,
0.5735404, -0.8299691, 3.750804, 1, 1, 1, 1, 1,
0.586016, 0.1825045, 2.297456, 1, 1, 1, 1, 1,
0.5974901, 0.6734689, 0.709686, 1, 1, 1, 1, 1,
0.6051282, -0.5087867, 1.568647, 1, 1, 1, 1, 1,
0.6069838, 0.5472775, 1.370224, 1, 1, 1, 1, 1,
0.608557, -1.925641, 2.973762, 1, 1, 1, 1, 1,
0.6144791, -0.7721434, 1.604638, 1, 1, 1, 1, 1,
0.6153904, -0.853416, 2.349736, 1, 1, 1, 1, 1,
0.621915, 1.434407, -0.7299019, 1, 1, 1, 1, 1,
0.6231175, -0.4341312, 0.7662292, 1, 1, 1, 1, 1,
0.6240118, 0.3422354, 2.08334, 1, 1, 1, 1, 1,
0.6257606, 1.139581, 1.34053, 1, 1, 1, 1, 1,
0.6262145, -0.7238336, 1.229528, 1, 1, 1, 1, 1,
0.6272676, 0.02077589, 2.528016, 1, 1, 1, 1, 1,
0.6388608, -0.4175351, 1.105151, 0, 0, 1, 1, 1,
0.6406502, -0.2353352, 2.031738, 1, 0, 0, 1, 1,
0.6500162, -1.171314, 3.211805, 1, 0, 0, 1, 1,
0.6513829, -0.8065314, 1.602043, 1, 0, 0, 1, 1,
0.6559059, 0.3324974, 0.4997241, 1, 0, 0, 1, 1,
0.6608744, -1.025208, 1.881676, 1, 0, 0, 1, 1,
0.6632425, 1.027961, -0.5914826, 0, 0, 0, 1, 1,
0.6818518, 0.09088968, 0.4806136, 0, 0, 0, 1, 1,
0.6819825, -1.551323, 2.384588, 0, 0, 0, 1, 1,
0.6858432, 1.287568, -0.0238388, 0, 0, 0, 1, 1,
0.6904809, -0.8270642, 2.593138, 0, 0, 0, 1, 1,
0.690688, -0.2419831, 3.31373, 0, 0, 0, 1, 1,
0.6911481, -1.067759, 3.074573, 0, 0, 0, 1, 1,
0.6944748, 0.5093583, 1.429321, 1, 1, 1, 1, 1,
0.6950641, 0.2995398, 1.543818, 1, 1, 1, 1, 1,
0.6953919, 1.500376, -0.8279577, 1, 1, 1, 1, 1,
0.6963211, -1.231936, 2.970219, 1, 1, 1, 1, 1,
0.6986436, 0.2536405, 0.5032499, 1, 1, 1, 1, 1,
0.6998623, 0.1339974, 0.7125303, 1, 1, 1, 1, 1,
0.7002924, 2.60593, 0.07149591, 1, 1, 1, 1, 1,
0.7003967, 1.011596, -0.1621349, 1, 1, 1, 1, 1,
0.7018092, 1.257029, 0.1701885, 1, 1, 1, 1, 1,
0.704622, 0.3725487, 0.3474937, 1, 1, 1, 1, 1,
0.705182, 1.216779, 0.9175799, 1, 1, 1, 1, 1,
0.719474, 0.5814596, 0.4959222, 1, 1, 1, 1, 1,
0.7195846, -0.9390098, 3.328362, 1, 1, 1, 1, 1,
0.7324588, -1.279268, 2.431948, 1, 1, 1, 1, 1,
0.7327837, -0.01026562, 1.559781, 1, 1, 1, 1, 1,
0.7352275, 0.09516455, 3.35868, 0, 0, 1, 1, 1,
0.7359895, 0.4823711, 1.774256, 1, 0, 0, 1, 1,
0.7375169, -1.66212, 2.430833, 1, 0, 0, 1, 1,
0.7532024, -1.155977, 4.72151, 1, 0, 0, 1, 1,
0.7608122, 0.5915316, 0.9596751, 1, 0, 0, 1, 1,
0.7620834, 0.7968945, 0.6165283, 1, 0, 0, 1, 1,
0.7682314, 2.830795, 0.1290022, 0, 0, 0, 1, 1,
0.7718325, 0.5489902, -0.509218, 0, 0, 0, 1, 1,
0.7723515, 0.4183208, 0.6031166, 0, 0, 0, 1, 1,
0.7783912, -0.8971475, 0.9023013, 0, 0, 0, 1, 1,
0.7793848, -0.3496107, 0.5535135, 0, 0, 0, 1, 1,
0.7848713, 0.9823567, 0.9687671, 0, 0, 0, 1, 1,
0.788503, -0.5921937, 2.809743, 0, 0, 0, 1, 1,
0.7895504, -0.5375006, 1.523038, 1, 1, 1, 1, 1,
0.7917056, 1.969912, 0.9825601, 1, 1, 1, 1, 1,
0.7926925, -1.183434, 2.75195, 1, 1, 1, 1, 1,
0.7937471, 0.06447287, -0.00836316, 1, 1, 1, 1, 1,
0.7941472, 1.054513, 0.3174605, 1, 1, 1, 1, 1,
0.7957136, -0.9815287, 4.565516, 1, 1, 1, 1, 1,
0.7969983, 0.8939121, -1.801112, 1, 1, 1, 1, 1,
0.8010479, 1.775185, 1.029319, 1, 1, 1, 1, 1,
0.8029069, -0.1672396, 0.4537571, 1, 1, 1, 1, 1,
0.8045353, -1.127544, 2.107359, 1, 1, 1, 1, 1,
0.8107733, 0.6491925, 2.807016, 1, 1, 1, 1, 1,
0.8159568, 0.1582506, 1.096547, 1, 1, 1, 1, 1,
0.8205534, -0.7771887, 1.523334, 1, 1, 1, 1, 1,
0.8211199, 1.219066, 1.23269, 1, 1, 1, 1, 1,
0.8374137, 0.002820873, 0.4183325, 1, 1, 1, 1, 1,
0.8387641, 0.8246887, -0.6593469, 0, 0, 1, 1, 1,
0.8387958, 0.1436558, 2.319215, 1, 0, 0, 1, 1,
0.846455, 0.7567796, 1.268117, 1, 0, 0, 1, 1,
0.8502257, 0.7299195, 2.135307, 1, 0, 0, 1, 1,
0.8562727, -0.3623429, 1.366564, 1, 0, 0, 1, 1,
0.860065, 1.965027, 0.8154119, 1, 0, 0, 1, 1,
0.8680848, 0.7786883, 2.861817, 0, 0, 0, 1, 1,
0.8696613, -2.241645, 4.913676, 0, 0, 0, 1, 1,
0.8709649, -0.9301157, 2.592644, 0, 0, 0, 1, 1,
0.8749269, -1.270247, 2.057181, 0, 0, 0, 1, 1,
0.8771, -0.2666363, 0.8759782, 0, 0, 0, 1, 1,
0.8780954, -0.1949862, 3.134493, 0, 0, 0, 1, 1,
0.8907478, -0.9449878, 2.146951, 0, 0, 0, 1, 1,
0.8909441, 0.05040617, 0.574716, 1, 1, 1, 1, 1,
0.8978401, -0.1600024, 3.013014, 1, 1, 1, 1, 1,
0.9072831, -1.320795, 1.869539, 1, 1, 1, 1, 1,
0.9110397, 0.3501291, 0.1507672, 1, 1, 1, 1, 1,
0.9161345, 0.2894311, 2.420816, 1, 1, 1, 1, 1,
0.9194216, 1.589817, 0.1852861, 1, 1, 1, 1, 1,
0.9300407, 0.6502982, 1.178235, 1, 1, 1, 1, 1,
0.9336889, 0.05498474, 0.4699996, 1, 1, 1, 1, 1,
0.9392772, -0.3503087, 2.124818, 1, 1, 1, 1, 1,
0.9407117, 0.4286393, 1.099078, 1, 1, 1, 1, 1,
0.9435564, 0.5186344, 1.258688, 1, 1, 1, 1, 1,
0.9444015, 0.7772768, 0.6409434, 1, 1, 1, 1, 1,
0.9453453, 0.3346716, 0.2224207, 1, 1, 1, 1, 1,
0.9468873, -1.193009, 2.411256, 1, 1, 1, 1, 1,
0.9590734, -1.240003, 2.410465, 1, 1, 1, 1, 1,
0.9614654, -0.227079, 1.793577, 0, 0, 1, 1, 1,
0.962035, -0.5177717, 2.495195, 1, 0, 0, 1, 1,
0.9644036, 0.3193399, 0.2626608, 1, 0, 0, 1, 1,
0.9684897, 1.107847, -0.2776026, 1, 0, 0, 1, 1,
0.968582, -1.151713, 1.654529, 1, 0, 0, 1, 1,
0.9839121, 0.3858283, 0.03931952, 1, 0, 0, 1, 1,
0.9867851, -0.3801616, 4.515724, 0, 0, 0, 1, 1,
0.9880304, -1.469746, 3.8411, 0, 0, 0, 1, 1,
0.9890465, 0.2803964, 0.6713101, 0, 0, 0, 1, 1,
0.9933553, 0.06205025, 1.284361, 0, 0, 0, 1, 1,
0.9968719, 1.32763, 3.064361, 0, 0, 0, 1, 1,
1.006158, 0.2344844, 1.322528, 0, 0, 0, 1, 1,
1.006835, 1.182339, 0.2064877, 0, 0, 0, 1, 1,
1.011766, -2.679555, 3.074187, 1, 1, 1, 1, 1,
1.017597, -0.5393083, 0.3573864, 1, 1, 1, 1, 1,
1.017605, 0.4259225, 1.873368, 1, 1, 1, 1, 1,
1.027049, 0.4966033, 1.13456, 1, 1, 1, 1, 1,
1.032295, -0.5678591, 2.453087, 1, 1, 1, 1, 1,
1.033718, -0.2395255, 0.9197464, 1, 1, 1, 1, 1,
1.039994, 2.166721, -1.640252, 1, 1, 1, 1, 1,
1.044132, 0.8589373, 1.540067, 1, 1, 1, 1, 1,
1.044179, 0.950703, 1.42902, 1, 1, 1, 1, 1,
1.045664, -0.397572, 1.510302, 1, 1, 1, 1, 1,
1.048389, -0.3015528, 0.9885928, 1, 1, 1, 1, 1,
1.049837, 0.7578341, 1.958865, 1, 1, 1, 1, 1,
1.054649, 0.683319, 1.712386, 1, 1, 1, 1, 1,
1.054947, 0.5089094, 1.968436, 1, 1, 1, 1, 1,
1.061142, 0.5329726, 1.137842, 1, 1, 1, 1, 1,
1.065277, 0.1846463, 2.050269, 0, 0, 1, 1, 1,
1.067406, 0.6137527, 1.692589, 1, 0, 0, 1, 1,
1.071749, -0.6848144, 3.569369, 1, 0, 0, 1, 1,
1.092575, -0.9733875, 0.539654, 1, 0, 0, 1, 1,
1.093504, -0.361191, 1.3392, 1, 0, 0, 1, 1,
1.097678, 0.6939747, 0.3795485, 1, 0, 0, 1, 1,
1.118762, -1.181602, 2.420265, 0, 0, 0, 1, 1,
1.121057, -0.3591134, 3.840698, 0, 0, 0, 1, 1,
1.123548, 0.2179026, 0.6189818, 0, 0, 0, 1, 1,
1.125051, -0.2901248, 0.3376163, 0, 0, 0, 1, 1,
1.138012, -0.5011236, 1.24389, 0, 0, 0, 1, 1,
1.138586, -1.15804, 3.14509, 0, 0, 0, 1, 1,
1.141854, -0.6870466, 1.554396, 0, 0, 0, 1, 1,
1.142448, 1.684376, 1.434801, 1, 1, 1, 1, 1,
1.14867, -2.346203, 2.640514, 1, 1, 1, 1, 1,
1.153197, 0.787497, 2.447379, 1, 1, 1, 1, 1,
1.156394, -0.4888793, 2.329777, 1, 1, 1, 1, 1,
1.163445, -1.317981, 1.712357, 1, 1, 1, 1, 1,
1.168087, 0.7489941, 1.188083, 1, 1, 1, 1, 1,
1.174805, 0.7251419, 0.2726985, 1, 1, 1, 1, 1,
1.17592, -0.1603862, 1.284362, 1, 1, 1, 1, 1,
1.177325, 0.8322862, -0.1726882, 1, 1, 1, 1, 1,
1.178183, 0.3029134, 1.866352, 1, 1, 1, 1, 1,
1.181057, -0.9487365, 1.837037, 1, 1, 1, 1, 1,
1.186584, 0.5400462, 1.11589, 1, 1, 1, 1, 1,
1.187787, 1.392698, 1.5408, 1, 1, 1, 1, 1,
1.196763, 1.13063, 1.379265, 1, 1, 1, 1, 1,
1.198732, 0.7876088, 1.20834, 1, 1, 1, 1, 1,
1.20145, 0.375987, 1.960558, 0, 0, 1, 1, 1,
1.206975, -0.4219629, 1.558111, 1, 0, 0, 1, 1,
1.211761, 0.5612166, -0.4696395, 1, 0, 0, 1, 1,
1.216388, -0.4445003, 1.15717, 1, 0, 0, 1, 1,
1.217595, -0.5056435, 3.163669, 1, 0, 0, 1, 1,
1.219475, -0.675554, 0.8581977, 1, 0, 0, 1, 1,
1.22485, -0.3031934, 1.447788, 0, 0, 0, 1, 1,
1.22581, -0.2565857, 2.018909, 0, 0, 0, 1, 1,
1.230066, 0.9449534, 2.709407, 0, 0, 0, 1, 1,
1.234262, -0.2100824, 2.026292, 0, 0, 0, 1, 1,
1.23587, -0.5188721, 1.898374, 0, 0, 0, 1, 1,
1.241691, -0.2701051, -0.389921, 0, 0, 0, 1, 1,
1.255068, 0.5095807, -0.2450828, 0, 0, 0, 1, 1,
1.255444, -0.08643577, 0.7025577, 1, 1, 1, 1, 1,
1.259214, 0.4373, 1.763857, 1, 1, 1, 1, 1,
1.263256, -0.6003605, 2.116029, 1, 1, 1, 1, 1,
1.263804, -1.21287, 0.4411728, 1, 1, 1, 1, 1,
1.270654, 0.2642601, 1.603501, 1, 1, 1, 1, 1,
1.27257, -2.044891, 2.239323, 1, 1, 1, 1, 1,
1.273848, -1.869337, 2.366906, 1, 1, 1, 1, 1,
1.275615, -0.1949997, 2.311604, 1, 1, 1, 1, 1,
1.282063, 0.1939624, 0.7445167, 1, 1, 1, 1, 1,
1.285005, 0.0291911, 0.4008409, 1, 1, 1, 1, 1,
1.285229, -0.9868794, 2.709292, 1, 1, 1, 1, 1,
1.289536, -0.6010391, 2.687346, 1, 1, 1, 1, 1,
1.296525, 0.004486823, 1.074569, 1, 1, 1, 1, 1,
1.297174, -0.2748086, 1.067655, 1, 1, 1, 1, 1,
1.297274, 0.3287832, 1.155782, 1, 1, 1, 1, 1,
1.301608, 1.11627, 0.02470088, 0, 0, 1, 1, 1,
1.304469, -0.9113368, 2.355772, 1, 0, 0, 1, 1,
1.310281, 0.08717651, 1.682405, 1, 0, 0, 1, 1,
1.311524, -0.02229945, 1.345318, 1, 0, 0, 1, 1,
1.312584, 2.099588, 1.360353, 1, 0, 0, 1, 1,
1.31687, 0.6319398, 2.584232, 1, 0, 0, 1, 1,
1.321781, -1.385507, 3.906901, 0, 0, 0, 1, 1,
1.323603, -0.06534421, 1.734719, 0, 0, 0, 1, 1,
1.325954, 0.1181421, 1.153046, 0, 0, 0, 1, 1,
1.345717, -0.3635276, 2.825258, 0, 0, 0, 1, 1,
1.356579, 0.6648167, 1.583689, 0, 0, 0, 1, 1,
1.359803, -0.08435414, 1.453878, 0, 0, 0, 1, 1,
1.367122, 1.022244, -0.01007976, 0, 0, 0, 1, 1,
1.37369, -1.233693, 0.7787199, 1, 1, 1, 1, 1,
1.37984, 0.3982026, 0.5146698, 1, 1, 1, 1, 1,
1.381027, -0.03238794, 2.551768, 1, 1, 1, 1, 1,
1.384115, -0.8297738, 2.297317, 1, 1, 1, 1, 1,
1.391219, -1.815903, 2.303299, 1, 1, 1, 1, 1,
1.404532, -0.6163277, 3.461444, 1, 1, 1, 1, 1,
1.415832, -0.2928843, 2.026386, 1, 1, 1, 1, 1,
1.418543, 0.2145633, 0.6804372, 1, 1, 1, 1, 1,
1.428549, 0.3609409, 1.515684, 1, 1, 1, 1, 1,
1.444309, -0.8561495, 2.878103, 1, 1, 1, 1, 1,
1.452438, 2.901423, 0.6056071, 1, 1, 1, 1, 1,
1.466636, -0.7698385, 2.89303, 1, 1, 1, 1, 1,
1.471211, 0.6669284, 0.4769674, 1, 1, 1, 1, 1,
1.472845, 0.6597786, 2.133261, 1, 1, 1, 1, 1,
1.484571, -1.028673, 2.371779, 1, 1, 1, 1, 1,
1.495711, 0.6157637, 0.853254, 0, 0, 1, 1, 1,
1.510239, 1.354517, 1.961897, 1, 0, 0, 1, 1,
1.510572, -0.639007, 0.2842682, 1, 0, 0, 1, 1,
1.525429, -1.475324, 2.048367, 1, 0, 0, 1, 1,
1.532027, 0.1710872, 3.059775, 1, 0, 0, 1, 1,
1.543795, -0.7789871, 2.793258, 1, 0, 0, 1, 1,
1.548071, 0.5814098, 1.649658, 0, 0, 0, 1, 1,
1.566954, 1.034409, 0.5813565, 0, 0, 0, 1, 1,
1.569193, -0.7519616, 3.084046, 0, 0, 0, 1, 1,
1.583399, -0.3211989, 3.537192, 0, 0, 0, 1, 1,
1.583603, -0.3848978, 0.8764393, 0, 0, 0, 1, 1,
1.589236, -0.5099965, 2.73795, 0, 0, 0, 1, 1,
1.59142, 0.6089805, 1.391885, 0, 0, 0, 1, 1,
1.592091, 0.04971413, 2.922662, 1, 1, 1, 1, 1,
1.601878, 1.919563, 0.1220982, 1, 1, 1, 1, 1,
1.611564, 0.01611903, 1.119576, 1, 1, 1, 1, 1,
1.612632, -0.4821971, 2.228, 1, 1, 1, 1, 1,
1.614324, 0.9383992, 1.924719, 1, 1, 1, 1, 1,
1.628161, -0.630137, 1.164616, 1, 1, 1, 1, 1,
1.635612, 0.4774112, -0.3107284, 1, 1, 1, 1, 1,
1.640071, -0.2688063, 3.084979, 1, 1, 1, 1, 1,
1.661664, -0.3571512, 3.143802, 1, 1, 1, 1, 1,
1.662351, -0.385384, 0.5302023, 1, 1, 1, 1, 1,
1.671878, 0.36273, 0.5920592, 1, 1, 1, 1, 1,
1.672583, -1.102717, 3.739446, 1, 1, 1, 1, 1,
1.677103, 0.1956247, 0.3379748, 1, 1, 1, 1, 1,
1.688311, 0.8487772, 1.501479, 1, 1, 1, 1, 1,
1.696046, 0.5820351, 1.134774, 1, 1, 1, 1, 1,
1.729511, -0.1797765, 2.885734, 0, 0, 1, 1, 1,
1.732228, 0.8496348, 2.353993, 1, 0, 0, 1, 1,
1.751176, 1.225446, 0.8910788, 1, 0, 0, 1, 1,
1.790305, -0.3431624, 3.759952, 1, 0, 0, 1, 1,
1.805234, 0.6382158, 2.041554, 1, 0, 0, 1, 1,
1.81506, -0.03074905, 2.298265, 1, 0, 0, 1, 1,
1.820337, -0.5228043, 2.229526, 0, 0, 0, 1, 1,
1.842121, -1.467534, 2.169313, 0, 0, 0, 1, 1,
1.844004, 0.5287241, 1.481143, 0, 0, 0, 1, 1,
1.909887, 1.249807, 0.4976929, 0, 0, 0, 1, 1,
1.974485, -0.01248728, 2.189096, 0, 0, 0, 1, 1,
1.977359, -0.947093, 0.6216027, 0, 0, 0, 1, 1,
1.982963, 1.155588, 1.451153, 0, 0, 0, 1, 1,
2.004368, 0.07598828, 1.667519, 1, 1, 1, 1, 1,
2.036345, 0.7452154, 1.036004, 1, 1, 1, 1, 1,
2.045148, 0.3555425, 1.737725, 1, 1, 1, 1, 1,
2.068069, 0.0818613, 1.277851, 1, 1, 1, 1, 1,
2.079462, -0.01412456, 1.824326, 1, 1, 1, 1, 1,
2.086293, 0.05600458, 2.373762, 1, 1, 1, 1, 1,
2.098732, -1.496439, 0.5832621, 1, 1, 1, 1, 1,
2.100208, -1.46505, 0.708184, 1, 1, 1, 1, 1,
2.115967, 0.8687102, 2.752381, 1, 1, 1, 1, 1,
2.156888, 1.337016, 1.687071, 1, 1, 1, 1, 1,
2.156973, 0.3454905, 2.592739, 1, 1, 1, 1, 1,
2.162906, 0.03905317, 2.601651, 1, 1, 1, 1, 1,
2.164273, 0.3308558, 0.5766455, 1, 1, 1, 1, 1,
2.171188, -0.3713151, 1.091184, 1, 1, 1, 1, 1,
2.175997, -0.3417752, 1.001452, 1, 1, 1, 1, 1,
2.179603, 0.328523, 0.4643899, 0, 0, 1, 1, 1,
2.211801, 0.7031273, 0.8937044, 1, 0, 0, 1, 1,
2.222406, 0.5615779, 1.160545, 1, 0, 0, 1, 1,
2.328357, -0.2577033, 0.5835752, 1, 0, 0, 1, 1,
2.355452, -0.1106277, 0.7359385, 1, 0, 0, 1, 1,
2.371949, 1.374417, 1.120542, 1, 0, 0, 1, 1,
2.456005, 0.7691743, 0.572359, 0, 0, 0, 1, 1,
2.512721, -0.2041238, 0.9662641, 0, 0, 0, 1, 1,
2.533393, -1.897312, 2.807549, 0, 0, 0, 1, 1,
2.584587, 0.0711609, 2.805689, 0, 0, 0, 1, 1,
2.58508, -0.3578143, 0.04170239, 0, 0, 0, 1, 1,
2.636087, -0.9376661, 2.281749, 0, 0, 0, 1, 1,
2.636323, -1.218325, 0.8636069, 0, 0, 0, 1, 1,
2.676707, 2.981645, -1.27744, 1, 1, 1, 1, 1,
2.680723, 0.5857987, 3.769905, 1, 1, 1, 1, 1,
2.699766, 0.0704435, 1.755998, 1, 1, 1, 1, 1,
2.783883, 3.414941, 0.4007646, 1, 1, 1, 1, 1,
2.826963, -1.502277, 2.42988, 1, 1, 1, 1, 1,
3.171988, -0.5997232, 2.584677, 1, 1, 1, 1, 1,
3.343113, -0.3227323, 2.200915, 1, 1, 1, 1, 1
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
var radius = 9.462163;
var distance = 33.23545;
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
mvMatrix.translate( -0.1093082, -0.3049597, -0.2464151 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.23545);
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
