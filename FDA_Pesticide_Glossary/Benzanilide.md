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
-2.752107, -2.274674, -2.36947, 1, 0, 0, 1,
-2.615122, 0.7063028, -1.839223, 1, 0.007843138, 0, 1,
-2.614826, 0.2551279, -1.827263, 1, 0.01176471, 0, 1,
-2.605853, 0.4809242, -0.1080566, 1, 0.01960784, 0, 1,
-2.539371, 1.148416, -2.340015, 1, 0.02352941, 0, 1,
-2.397381, -0.8759646, -4.258821, 1, 0.03137255, 0, 1,
-2.390078, -1.403282, -2.73082, 1, 0.03529412, 0, 1,
-2.352401, 0.8815902, -1.224956, 1, 0.04313726, 0, 1,
-2.314098, 2.227448, -1.232302, 1, 0.04705882, 0, 1,
-2.314049, -1.506667, -2.289696, 1, 0.05490196, 0, 1,
-2.310763, 1.339981, -2.249932, 1, 0.05882353, 0, 1,
-2.276065, -0.2058999, -1.610467, 1, 0.06666667, 0, 1,
-2.2105, 1.052987, -0.4627879, 1, 0.07058824, 0, 1,
-2.203084, -0.5217517, -3.417697, 1, 0.07843138, 0, 1,
-2.169107, 0.1652589, 0.971476, 1, 0.08235294, 0, 1,
-2.160566, -1.491824, -1.265352, 1, 0.09019608, 0, 1,
-2.153202, -1.271973, -1.430876, 1, 0.09411765, 0, 1,
-2.146786, -2.538652, -3.997312, 1, 0.1019608, 0, 1,
-2.146554, -0.1610609, -1.547605, 1, 0.1098039, 0, 1,
-2.14169, 0.8349596, -1.84538, 1, 0.1137255, 0, 1,
-2.12379, 0.7417843, -0.8440166, 1, 0.1215686, 0, 1,
-2.099518, -0.0882687, -0.9514801, 1, 0.1254902, 0, 1,
-2.088143, 1.017797, -2.822605, 1, 0.1333333, 0, 1,
-2.084168, 1.145694, 1.497578, 1, 0.1372549, 0, 1,
-2.032935, -1.450555, -2.046458, 1, 0.145098, 0, 1,
-2.031326, 2.041131, -1.691246, 1, 0.1490196, 0, 1,
-2.007598, 0.7128775, -1.072135, 1, 0.1568628, 0, 1,
-2.000023, -0.3443011, -2.553411, 1, 0.1607843, 0, 1,
-1.965359, -1.14188, -2.089378, 1, 0.1686275, 0, 1,
-1.963721, 0.8994918, -2.505469, 1, 0.172549, 0, 1,
-1.95351, 0.2972732, -0.5068104, 1, 0.1803922, 0, 1,
-1.947175, -1.145591, -2.715371, 1, 0.1843137, 0, 1,
-1.941446, 0.5731931, -0.5129676, 1, 0.1921569, 0, 1,
-1.936012, -0.3812908, -2.937196, 1, 0.1960784, 0, 1,
-1.920609, 0.6341993, -1.016783, 1, 0.2039216, 0, 1,
-1.882931, -0.419009, -2.989929, 1, 0.2117647, 0, 1,
-1.856394, -0.279977, -1.710069, 1, 0.2156863, 0, 1,
-1.856017, 1.932088, -1.704038, 1, 0.2235294, 0, 1,
-1.820576, 0.6859201, -0.2158404, 1, 0.227451, 0, 1,
-1.805349, -0.476604, -0.9249202, 1, 0.2352941, 0, 1,
-1.793308, -2.147366, -2.417915, 1, 0.2392157, 0, 1,
-1.78665, -0.6992749, -2.479204, 1, 0.2470588, 0, 1,
-1.779994, 1.26549, -1.275771, 1, 0.2509804, 0, 1,
-1.774282, 1.119018, -0.07129982, 1, 0.2588235, 0, 1,
-1.76299, -0.9295715, -0.9876569, 1, 0.2627451, 0, 1,
-1.745098, -0.341205, -1.547428, 1, 0.2705882, 0, 1,
-1.726039, 0.5326756, -0.4210433, 1, 0.2745098, 0, 1,
-1.720515, -0.06677482, -1.159794, 1, 0.282353, 0, 1,
-1.6941, 0.2362887, -1.582249, 1, 0.2862745, 0, 1,
-1.691007, 0.4751277, -1.74086, 1, 0.2941177, 0, 1,
-1.662999, 0.8844719, 0.7950074, 1, 0.3019608, 0, 1,
-1.662922, 0.1676925, -2.520327, 1, 0.3058824, 0, 1,
-1.655379, -1.866074, -2.786701, 1, 0.3137255, 0, 1,
-1.633451, 0.07756493, -2.822779, 1, 0.3176471, 0, 1,
-1.623058, -1.116415, -1.753176, 1, 0.3254902, 0, 1,
-1.595879, 0.007639255, -1.665165, 1, 0.3294118, 0, 1,
-1.588107, -0.0003802, -2.352266, 1, 0.3372549, 0, 1,
-1.587596, -1.747977, -0.01577467, 1, 0.3411765, 0, 1,
-1.543811, -1.050537, -0.8056534, 1, 0.3490196, 0, 1,
-1.541552, 0.5632197, -0.8292724, 1, 0.3529412, 0, 1,
-1.539302, 1.363593, -1.146461, 1, 0.3607843, 0, 1,
-1.539118, 0.4589533, -0.5859205, 1, 0.3647059, 0, 1,
-1.532225, -0.6603179, -4.282459, 1, 0.372549, 0, 1,
-1.53087, -0.9353896, -2.46718, 1, 0.3764706, 0, 1,
-1.529935, -0.2764176, 0.3950511, 1, 0.3843137, 0, 1,
-1.529359, 1.0022, -1.431357, 1, 0.3882353, 0, 1,
-1.524698, -0.5577235, -2.28835, 1, 0.3960784, 0, 1,
-1.517438, -0.8179176, -1.540616, 1, 0.4039216, 0, 1,
-1.505443, -1.316942, -2.779076, 1, 0.4078431, 0, 1,
-1.497751, -0.5367041, -3.525777, 1, 0.4156863, 0, 1,
-1.495397, -1.075453, -1.719987, 1, 0.4196078, 0, 1,
-1.494805, 1.261623, -1.779294, 1, 0.427451, 0, 1,
-1.492136, 0.4618544, -0.8113599, 1, 0.4313726, 0, 1,
-1.486177, 0.6598349, -2.108417, 1, 0.4392157, 0, 1,
-1.480811, -1.465724, -1.598676, 1, 0.4431373, 0, 1,
-1.465413, 0.2215846, -0.196143, 1, 0.4509804, 0, 1,
-1.463354, 0.2116755, -1.887813, 1, 0.454902, 0, 1,
-1.457419, 0.3973873, -1.717882, 1, 0.4627451, 0, 1,
-1.450774, -1.239563, -1.268239, 1, 0.4666667, 0, 1,
-1.441705, 0.4637139, -2.995595, 1, 0.4745098, 0, 1,
-1.440935, 1.075232, -1.214999, 1, 0.4784314, 0, 1,
-1.440126, 0.2188773, 0.966513, 1, 0.4862745, 0, 1,
-1.436982, 0.3851322, -0.8126211, 1, 0.4901961, 0, 1,
-1.436973, 0.3643302, -2.553333, 1, 0.4980392, 0, 1,
-1.424487, 1.788039, -1.570188, 1, 0.5058824, 0, 1,
-1.422169, 1.825451, -1.004721, 1, 0.509804, 0, 1,
-1.405969, 0.2803662, -1.111958, 1, 0.5176471, 0, 1,
-1.390275, 0.1874814, -1.363196, 1, 0.5215687, 0, 1,
-1.387453, 0.6595523, -1.391812, 1, 0.5294118, 0, 1,
-1.386202, -1.331128, -2.38243, 1, 0.5333334, 0, 1,
-1.371347, 1.68268, -0.1439831, 1, 0.5411765, 0, 1,
-1.368191, -0.1719087, -2.274059, 1, 0.5450981, 0, 1,
-1.358408, -0.3271783, -0.6989354, 1, 0.5529412, 0, 1,
-1.345636, 0.8108854, -0.2045584, 1, 0.5568628, 0, 1,
-1.341411, -0.9863729, -0.9516068, 1, 0.5647059, 0, 1,
-1.330496, 2.041519, 1.020641, 1, 0.5686275, 0, 1,
-1.329107, -2.116052, -1.123181, 1, 0.5764706, 0, 1,
-1.303664, 0.7072242, -1.624171, 1, 0.5803922, 0, 1,
-1.302112, -1.536125, -3.043033, 1, 0.5882353, 0, 1,
-1.29655, 0.249204, -3.023013, 1, 0.5921569, 0, 1,
-1.286486, 1.036313, -0.7013434, 1, 0.6, 0, 1,
-1.283484, 0.8005468, -0.728952, 1, 0.6078432, 0, 1,
-1.272507, 1.917338, -2.365167, 1, 0.6117647, 0, 1,
-1.271191, -0.4577042, -2.309615, 1, 0.6196079, 0, 1,
-1.263777, -0.1342512, -3.215868, 1, 0.6235294, 0, 1,
-1.257996, -0.2605515, -1.73222, 1, 0.6313726, 0, 1,
-1.251174, -0.5226401, -2.538624, 1, 0.6352941, 0, 1,
-1.237122, -0.4132298, -2.558247, 1, 0.6431373, 0, 1,
-1.236239, 0.9555267, 0.08106057, 1, 0.6470588, 0, 1,
-1.228987, -0.3591554, 0.4211375, 1, 0.654902, 0, 1,
-1.227063, -0.6692083, -1.653741, 1, 0.6588235, 0, 1,
-1.222012, -0.100025, -3.377231, 1, 0.6666667, 0, 1,
-1.221075, 0.8543699, 0.9664375, 1, 0.6705883, 0, 1,
-1.220329, 1.169784, -0.8478057, 1, 0.6784314, 0, 1,
-1.216817, -2.407778, -2.951521, 1, 0.682353, 0, 1,
-1.206705, 0.08875412, -2.097366, 1, 0.6901961, 0, 1,
-1.201877, 1.195923, 0.5276939, 1, 0.6941177, 0, 1,
-1.200823, -1.36436, -1.750663, 1, 0.7019608, 0, 1,
-1.178782, -1.280038, -2.023022, 1, 0.7098039, 0, 1,
-1.165625, 1.519696, -0.4739724, 1, 0.7137255, 0, 1,
-1.155109, -0.2598391, -1.636081, 1, 0.7215686, 0, 1,
-1.153979, 0.378179, -1.599646, 1, 0.7254902, 0, 1,
-1.150167, -2.196097, -3.493663, 1, 0.7333333, 0, 1,
-1.149215, -1.930381, -0.5800728, 1, 0.7372549, 0, 1,
-1.147301, 0.8940873, 0.9393463, 1, 0.7450981, 0, 1,
-1.137486, 0.160279, -3.311797, 1, 0.7490196, 0, 1,
-1.137259, 1.556051, 0.02126789, 1, 0.7568628, 0, 1,
-1.136014, -0.2024369, -2.31133, 1, 0.7607843, 0, 1,
-1.130325, 0.640197, -1.542627, 1, 0.7686275, 0, 1,
-1.12958, 0.1337661, -2.850855, 1, 0.772549, 0, 1,
-1.129548, -0.2511767, -3.061721, 1, 0.7803922, 0, 1,
-1.129539, -0.6784295, -3.0147, 1, 0.7843137, 0, 1,
-1.127601, 0.1817439, 0.06740446, 1, 0.7921569, 0, 1,
-1.117696, 1.032756, -0.7155688, 1, 0.7960784, 0, 1,
-1.115434, -1.152288, -3.546968, 1, 0.8039216, 0, 1,
-1.114299, 1.975607, -0.1515992, 1, 0.8117647, 0, 1,
-1.111802, 0.1855374, -1.727537, 1, 0.8156863, 0, 1,
-1.104487, 1.568504, -0.01407158, 1, 0.8235294, 0, 1,
-1.102743, 1.443955, 0.2900134, 1, 0.827451, 0, 1,
-1.095476, 0.04676444, -1.323893, 1, 0.8352941, 0, 1,
-1.088417, -2.399533, -2.979929, 1, 0.8392157, 0, 1,
-1.087731, -2.126682, -2.543951, 1, 0.8470588, 0, 1,
-1.083767, 0.08227235, -1.557668, 1, 0.8509804, 0, 1,
-1.080923, -0.3136736, 0.00169674, 1, 0.8588235, 0, 1,
-1.07887, 1.173007, -1.622405, 1, 0.8627451, 0, 1,
-1.078484, -1.420984, -1.277404, 1, 0.8705882, 0, 1,
-1.077428, -0.8207735, -0.1970425, 1, 0.8745098, 0, 1,
-1.074759, -0.8447937, -0.9727086, 1, 0.8823529, 0, 1,
-1.074363, -0.2270504, -2.404218, 1, 0.8862745, 0, 1,
-1.074342, 0.006686681, -1.099445, 1, 0.8941177, 0, 1,
-1.072856, 0.9516772, -2.070925, 1, 0.8980392, 0, 1,
-1.06633, -0.07495339, -1.672796, 1, 0.9058824, 0, 1,
-1.064175, -0.4462416, -1.497591, 1, 0.9137255, 0, 1,
-1.057703, -2.489199, -3.290379, 1, 0.9176471, 0, 1,
-1.05684, -0.006632459, -0.5582997, 1, 0.9254902, 0, 1,
-1.048004, 1.861346, -1.060375, 1, 0.9294118, 0, 1,
-1.04385, -0.4423116, -3.627484, 1, 0.9372549, 0, 1,
-1.042149, -1.817012, -3.532284, 1, 0.9411765, 0, 1,
-1.039793, -1.757831, -3.930163, 1, 0.9490196, 0, 1,
-1.035775, 0.1243983, -1.192156, 1, 0.9529412, 0, 1,
-1.03323, 3.337305, 0.434818, 1, 0.9607843, 0, 1,
-1.031434, 1.152071, -3.47989, 1, 0.9647059, 0, 1,
-1.031384, 0.2576488, -3.518836, 1, 0.972549, 0, 1,
-1.024162, 1.502179, 0.2017715, 1, 0.9764706, 0, 1,
-1.02355, 1.514342, -0.1977637, 1, 0.9843137, 0, 1,
-1.02044, -0.6375122, -2.6321, 1, 0.9882353, 0, 1,
-1.014439, 0.1406042, -2.087249, 1, 0.9960784, 0, 1,
-1.012375, -0.6713862, -3.599381, 0.9960784, 1, 0, 1,
-1.011291, 0.4889501, -1.025342, 0.9921569, 1, 0, 1,
-1.010459, -0.6496661, -2.534033, 0.9843137, 1, 0, 1,
-0.9965985, -0.336581, -0.8170878, 0.9803922, 1, 0, 1,
-0.9833283, 1.075862, -0.09579761, 0.972549, 1, 0, 1,
-0.9824678, -0.1603232, -0.3026368, 0.9686275, 1, 0, 1,
-0.9823351, -0.006572407, -1.254576, 0.9607843, 1, 0, 1,
-0.9691527, 0.9981357, -1.264992, 0.9568627, 1, 0, 1,
-0.9652585, -0.6817002, -3.589105, 0.9490196, 1, 0, 1,
-0.963711, -1.764108, -2.873878, 0.945098, 1, 0, 1,
-0.9614596, -2.46814, -2.843575, 0.9372549, 1, 0, 1,
-0.9569983, 0.9718705, -0.5959709, 0.9333333, 1, 0, 1,
-0.9550396, -0.3653197, -1.875145, 0.9254902, 1, 0, 1,
-0.9529379, 0.5004733, -0.5366228, 0.9215686, 1, 0, 1,
-0.9500818, -0.9617946, -1.980449, 0.9137255, 1, 0, 1,
-0.9500209, -0.9529124, -2.906013, 0.9098039, 1, 0, 1,
-0.9380375, 0.9651666, -0.3238913, 0.9019608, 1, 0, 1,
-0.9377694, 0.6044629, -1.91267, 0.8941177, 1, 0, 1,
-0.9363317, -2.026154, -2.426581, 0.8901961, 1, 0, 1,
-0.9320117, -0.7648848, -2.993452, 0.8823529, 1, 0, 1,
-0.9279724, -1.057263, -3.788749, 0.8784314, 1, 0, 1,
-0.9248264, 0.8780709, -1.234433, 0.8705882, 1, 0, 1,
-0.9207786, -1.331584, -1.496135, 0.8666667, 1, 0, 1,
-0.9142423, -1.883242, -1.738667, 0.8588235, 1, 0, 1,
-0.9136165, -1.033582, -2.65667, 0.854902, 1, 0, 1,
-0.9065642, 0.4915971, -0.03480101, 0.8470588, 1, 0, 1,
-0.8951936, -1.068734, -3.17661, 0.8431373, 1, 0, 1,
-0.8946522, 0.2868652, -1.713767, 0.8352941, 1, 0, 1,
-0.8933698, -0.7096437, -2.237207, 0.8313726, 1, 0, 1,
-0.8915185, -0.6839685, -1.998659, 0.8235294, 1, 0, 1,
-0.8852362, -0.3275647, -0.8495929, 0.8196079, 1, 0, 1,
-0.882725, -0.5570157, -1.342194, 0.8117647, 1, 0, 1,
-0.8772673, 0.4999568, -1.660316, 0.8078431, 1, 0, 1,
-0.8767157, 0.7886373, -0.6135956, 0.8, 1, 0, 1,
-0.875751, 1.825131, -0.4122967, 0.7921569, 1, 0, 1,
-0.8698074, 1.09736, -1.576763, 0.7882353, 1, 0, 1,
-0.859233, -0.6877006, -2.416703, 0.7803922, 1, 0, 1,
-0.8553762, -1.21201, -2.48221, 0.7764706, 1, 0, 1,
-0.85295, 0.02018694, -1.006737, 0.7686275, 1, 0, 1,
-0.8489205, 0.454728, -1.094627, 0.7647059, 1, 0, 1,
-0.8470526, -0.7456571, -2.045461, 0.7568628, 1, 0, 1,
-0.8455644, 2.3767, -1.936725, 0.7529412, 1, 0, 1,
-0.8448625, 0.7821287, -0.04609347, 0.7450981, 1, 0, 1,
-0.8427392, -0.5721584, -1.658139, 0.7411765, 1, 0, 1,
-0.8335773, 1.397137, 0.2392826, 0.7333333, 1, 0, 1,
-0.8333676, 0.7977609, -2.241972, 0.7294118, 1, 0, 1,
-0.8325584, -0.4276721, -0.9174711, 0.7215686, 1, 0, 1,
-0.8234412, -0.3583274, -1.634382, 0.7176471, 1, 0, 1,
-0.8192332, -1.039064, -1.635774, 0.7098039, 1, 0, 1,
-0.8188694, -0.3725424, -2.488461, 0.7058824, 1, 0, 1,
-0.8132044, 0.2268309, -1.260653, 0.6980392, 1, 0, 1,
-0.8069457, 1.539894, -0.6581433, 0.6901961, 1, 0, 1,
-0.7977867, 2.154233, 1.022919, 0.6862745, 1, 0, 1,
-0.7907652, -0.0334754, -0.0914977, 0.6784314, 1, 0, 1,
-0.7831826, 0.7797358, -0.7068862, 0.6745098, 1, 0, 1,
-0.7808431, 0.01437919, -2.233223, 0.6666667, 1, 0, 1,
-0.7802876, 1.571892, -0.3550277, 0.6627451, 1, 0, 1,
-0.7797796, -0.6408265, -2.295754, 0.654902, 1, 0, 1,
-0.774235, -0.323392, -2.706695, 0.6509804, 1, 0, 1,
-0.7741172, -1.216015, -1.513497, 0.6431373, 1, 0, 1,
-0.7728527, 0.1265287, -1.668302, 0.6392157, 1, 0, 1,
-0.7725267, -0.2773438, -0.07870751, 0.6313726, 1, 0, 1,
-0.7701831, -0.304108, -1.69345, 0.627451, 1, 0, 1,
-0.7647943, -0.9937663, -1.752759, 0.6196079, 1, 0, 1,
-0.764615, 1.410579, -1.009457, 0.6156863, 1, 0, 1,
-0.7632042, 0.5876024, -0.9083102, 0.6078432, 1, 0, 1,
-0.7582707, 0.8262137, -0.9936044, 0.6039216, 1, 0, 1,
-0.7529883, -0.3323049, -1.662998, 0.5960785, 1, 0, 1,
-0.7463662, -1.332298, -3.466976, 0.5882353, 1, 0, 1,
-0.7453021, -1.741359, -3.010343, 0.5843138, 1, 0, 1,
-0.7437508, -1.977961, -3.716343, 0.5764706, 1, 0, 1,
-0.7410006, 0.3434297, -0.5558165, 0.572549, 1, 0, 1,
-0.7406698, -2.236754, -3.423501, 0.5647059, 1, 0, 1,
-0.7393658, -0.1482639, -2.27858, 0.5607843, 1, 0, 1,
-0.7362906, -0.8351709, -3.935409, 0.5529412, 1, 0, 1,
-0.736186, -0.9048764, -3.10878, 0.5490196, 1, 0, 1,
-0.7352973, -0.38361, -2.238036, 0.5411765, 1, 0, 1,
-0.734515, -0.4491906, -3.049152, 0.5372549, 1, 0, 1,
-0.7315181, -0.650849, -2.116036, 0.5294118, 1, 0, 1,
-0.7283913, -0.4064743, -2.219993, 0.5254902, 1, 0, 1,
-0.7256986, 0.1368505, -2.389652, 0.5176471, 1, 0, 1,
-0.7123592, -0.2895433, -0.8539756, 0.5137255, 1, 0, 1,
-0.7109308, 1.295915, -0.1345589, 0.5058824, 1, 0, 1,
-0.7070195, 1.276546, 0.5604587, 0.5019608, 1, 0, 1,
-0.7030098, -1.138119, -2.683594, 0.4941176, 1, 0, 1,
-0.7028219, -0.03347808, -2.183366, 0.4862745, 1, 0, 1,
-0.7004226, -0.4058779, -0.00513766, 0.4823529, 1, 0, 1,
-0.6994314, -0.1158349, -2.371568, 0.4745098, 1, 0, 1,
-0.6970314, -0.6613792, -1.570747, 0.4705882, 1, 0, 1,
-0.6930097, -1.077308, -2.422737, 0.4627451, 1, 0, 1,
-0.6895633, -0.8440636, -2.173759, 0.4588235, 1, 0, 1,
-0.6815696, -2.184128, -2.121283, 0.4509804, 1, 0, 1,
-0.6780253, 0.3292724, -0.7058378, 0.4470588, 1, 0, 1,
-0.6736764, -0.08941545, -2.117169, 0.4392157, 1, 0, 1,
-0.6735125, -0.6036482, -1.432004, 0.4352941, 1, 0, 1,
-0.6720343, 0.9364656, -1.20715, 0.427451, 1, 0, 1,
-0.6651281, 0.2746728, -2.668577, 0.4235294, 1, 0, 1,
-0.6615759, -2.276706, -2.872284, 0.4156863, 1, 0, 1,
-0.6559086, 0.9059312, -1.459802, 0.4117647, 1, 0, 1,
-0.6524693, -0.4681811, -3.051952, 0.4039216, 1, 0, 1,
-0.6510425, -0.3149182, -2.850535, 0.3960784, 1, 0, 1,
-0.6508956, 0.9278724, -1.998626, 0.3921569, 1, 0, 1,
-0.6485941, 1.387004, 1.998541, 0.3843137, 1, 0, 1,
-0.6400088, -1.145802, -2.067587, 0.3803922, 1, 0, 1,
-0.6313552, 0.2469465, 0.0008227099, 0.372549, 1, 0, 1,
-0.6287874, 0.7513933, 0.1855051, 0.3686275, 1, 0, 1,
-0.6252499, -1.61401, -4.120013, 0.3607843, 1, 0, 1,
-0.6248835, -0.1294932, -2.540332, 0.3568628, 1, 0, 1,
-0.6196892, 0.5927985, -3.126155, 0.3490196, 1, 0, 1,
-0.6192175, -0.6184544, -2.931613, 0.345098, 1, 0, 1,
-0.6182492, -0.933495, -2.897804, 0.3372549, 1, 0, 1,
-0.6147875, -0.4143415, -3.841208, 0.3333333, 1, 0, 1,
-0.6142905, 0.2506188, -2.298413, 0.3254902, 1, 0, 1,
-0.6125407, -0.5459419, -2.177307, 0.3215686, 1, 0, 1,
-0.6074358, -0.8939539, -0.5486641, 0.3137255, 1, 0, 1,
-0.6063206, -0.5306349, -1.754438, 0.3098039, 1, 0, 1,
-0.6053614, -0.1981579, -1.869144, 0.3019608, 1, 0, 1,
-0.6042001, 1.517663, -0.7405041, 0.2941177, 1, 0, 1,
-0.6009209, 1.513427, -0.7791963, 0.2901961, 1, 0, 1,
-0.6003143, -0.01277338, -2.559575, 0.282353, 1, 0, 1,
-0.5995712, 0.6177006, -0.9452466, 0.2784314, 1, 0, 1,
-0.5989564, 1.031212, -1.366955, 0.2705882, 1, 0, 1,
-0.5963362, -0.5125554, -3.318428, 0.2666667, 1, 0, 1,
-0.592245, -0.4393984, -1.90967, 0.2588235, 1, 0, 1,
-0.5875451, 0.2798271, -2.42117, 0.254902, 1, 0, 1,
-0.5869706, -0.2885281, -1.132535, 0.2470588, 1, 0, 1,
-0.5828594, 0.4364522, -0.4918977, 0.2431373, 1, 0, 1,
-0.5815986, 1.987355, -1.983353, 0.2352941, 1, 0, 1,
-0.580609, 0.5564151, -0.4279537, 0.2313726, 1, 0, 1,
-0.5787657, 0.06001524, -0.3027321, 0.2235294, 1, 0, 1,
-0.5784627, 1.482183, -0.4299273, 0.2196078, 1, 0, 1,
-0.5773694, 1.275802, -0.7176336, 0.2117647, 1, 0, 1,
-0.5755926, -0.4530396, -2.964923, 0.2078431, 1, 0, 1,
-0.5733085, -1.345307, -2.669391, 0.2, 1, 0, 1,
-0.5731197, -0.3086347, -2.151274, 0.1921569, 1, 0, 1,
-0.5712517, 1.275725, -0.3222965, 0.1882353, 1, 0, 1,
-0.5710741, -0.03030886, -1.489661, 0.1803922, 1, 0, 1,
-0.5662833, -0.4940309, -0.7113125, 0.1764706, 1, 0, 1,
-0.5641654, 0.5623598, -0.1536101, 0.1686275, 1, 0, 1,
-0.5628243, 0.2467808, -1.096287, 0.1647059, 1, 0, 1,
-0.5533158, 0.4153906, 0.05326495, 0.1568628, 1, 0, 1,
-0.5486702, 1.745073, -0.2568004, 0.1529412, 1, 0, 1,
-0.5458739, 1.51562, -0.8999965, 0.145098, 1, 0, 1,
-0.5450627, -1.037784, -1.769825, 0.1411765, 1, 0, 1,
-0.5445819, -0.2203985, -2.53424, 0.1333333, 1, 0, 1,
-0.5402724, 0.4238696, 0.1117319, 0.1294118, 1, 0, 1,
-0.5349547, -1.569241, -2.361115, 0.1215686, 1, 0, 1,
-0.5322589, -0.6666178, -3.444397, 0.1176471, 1, 0, 1,
-0.5263783, 0.01064669, -2.334193, 0.1098039, 1, 0, 1,
-0.5223227, -0.01548035, -1.867358, 0.1058824, 1, 0, 1,
-0.5185037, -0.6988934, -1.820838, 0.09803922, 1, 0, 1,
-0.5184314, -1.352746, -4.567191, 0.09019608, 1, 0, 1,
-0.5151198, 0.1341335, -1.97422, 0.08627451, 1, 0, 1,
-0.5146086, -1.055007, -2.444801, 0.07843138, 1, 0, 1,
-0.5134726, -2.407392, -3.345672, 0.07450981, 1, 0, 1,
-0.5126531, -0.7387623, -2.527497, 0.06666667, 1, 0, 1,
-0.5062631, -0.6821269, -1.872042, 0.0627451, 1, 0, 1,
-0.500693, 0.2813094, -1.911249, 0.05490196, 1, 0, 1,
-0.4978935, -0.3030799, -1.844804, 0.05098039, 1, 0, 1,
-0.4974616, 0.8957195, 0.9948118, 0.04313726, 1, 0, 1,
-0.493928, 1.454471, -1.32968, 0.03921569, 1, 0, 1,
-0.4932038, 0.4963264, -0.2715526, 0.03137255, 1, 0, 1,
-0.4918641, -0.56442, -1.507145, 0.02745098, 1, 0, 1,
-0.4908777, 0.1401977, -1.948145, 0.01960784, 1, 0, 1,
-0.4904944, 0.1898026, -1.376706, 0.01568628, 1, 0, 1,
-0.4877026, -0.2243992, -0.3900851, 0.007843138, 1, 0, 1,
-0.4858643, 0.0252672, -0.8739433, 0.003921569, 1, 0, 1,
-0.4849344, -0.1867892, -2.63353, 0, 1, 0.003921569, 1,
-0.4840703, -0.2214342, -0.2499727, 0, 1, 0.01176471, 1,
-0.4811607, 0.6094664, -1.475717, 0, 1, 0.01568628, 1,
-0.4776359, -0.04243072, -1.563248, 0, 1, 0.02352941, 1,
-0.4758002, 1.571287, -0.3818313, 0, 1, 0.02745098, 1,
-0.4664949, 0.6978932, -1.236257, 0, 1, 0.03529412, 1,
-0.4651131, 0.3856336, -1.118272, 0, 1, 0.03921569, 1,
-0.4626635, -2.112146, -2.538131, 0, 1, 0.04705882, 1,
-0.4554269, 0.5761234, -0.8265696, 0, 1, 0.05098039, 1,
-0.4526386, -0.05103473, -2.598275, 0, 1, 0.05882353, 1,
-0.4525605, -0.4070015, -3.302526, 0, 1, 0.0627451, 1,
-0.45147, -0.8175277, -3.205519, 0, 1, 0.07058824, 1,
-0.448943, 0.3032683, -1.192095, 0, 1, 0.07450981, 1,
-0.4451065, -0.0370329, -0.6611075, 0, 1, 0.08235294, 1,
-0.441046, 0.9970198, -1.974491, 0, 1, 0.08627451, 1,
-0.4407416, -0.09234191, -1.440503, 0, 1, 0.09411765, 1,
-0.4375353, -0.5592648, -2.324202, 0, 1, 0.1019608, 1,
-0.4363408, -1.079889, -2.309425, 0, 1, 0.1058824, 1,
-0.4356005, -0.676804, -2.001095, 0, 1, 0.1137255, 1,
-0.4348402, 0.7443209, -0.9916072, 0, 1, 0.1176471, 1,
-0.4347611, -0.3208002, -3.346667, 0, 1, 0.1254902, 1,
-0.4335385, 1.018735, -0.9488186, 0, 1, 0.1294118, 1,
-0.4281538, -0.007095142, -3.328309, 0, 1, 0.1372549, 1,
-0.4264163, -0.1217128, -1.466926, 0, 1, 0.1411765, 1,
-0.4213222, 0.03970983, -3.626319, 0, 1, 0.1490196, 1,
-0.420197, -1.475149, -4.659282, 0, 1, 0.1529412, 1,
-0.4176441, -1.596016, -2.926023, 0, 1, 0.1607843, 1,
-0.4124209, 0.9364173, -2.2062, 0, 1, 0.1647059, 1,
-0.41019, -1.665772, -4.24638, 0, 1, 0.172549, 1,
-0.4097898, -0.2280701, -2.258866, 0, 1, 0.1764706, 1,
-0.4071403, -1.483429, -2.166896, 0, 1, 0.1843137, 1,
-0.4046553, -0.9017527, -3.941222, 0, 1, 0.1882353, 1,
-0.4001704, 1.095336, -0.1881009, 0, 1, 0.1960784, 1,
-0.3949073, 1.323386, -1.433342, 0, 1, 0.2039216, 1,
-0.3945858, 0.2714436, 1.286581, 0, 1, 0.2078431, 1,
-0.3924102, -1.825168, -1.646515, 0, 1, 0.2156863, 1,
-0.3877651, 0.4878814, -0.6261174, 0, 1, 0.2196078, 1,
-0.3825705, 0.05761346, -2.34604, 0, 1, 0.227451, 1,
-0.3813882, -0.9671242, -3.443798, 0, 1, 0.2313726, 1,
-0.3812217, -0.01663708, -1.314622, 0, 1, 0.2392157, 1,
-0.3780836, 0.9268844, -0.8088471, 0, 1, 0.2431373, 1,
-0.3776169, -2.373608, -3.53244, 0, 1, 0.2509804, 1,
-0.3750929, -0.4903851, -3.682193, 0, 1, 0.254902, 1,
-0.369713, 0.1975068, -1.967006, 0, 1, 0.2627451, 1,
-0.3676705, 0.1814259, -3.152308, 0, 1, 0.2666667, 1,
-0.3622553, -0.6940542, -2.172699, 0, 1, 0.2745098, 1,
-0.3599581, -1.32804, -2.581175, 0, 1, 0.2784314, 1,
-0.3590541, 0.9907063, -2.966497, 0, 1, 0.2862745, 1,
-0.3590326, 0.941395, -0.1857941, 0, 1, 0.2901961, 1,
-0.3575918, -0.6123571, -2.253639, 0, 1, 0.2980392, 1,
-0.3488288, -0.6901624, -3.414696, 0, 1, 0.3058824, 1,
-0.3484729, 0.02640769, 0.1288325, 0, 1, 0.3098039, 1,
-0.3416779, -0.5384524, -3.625377, 0, 1, 0.3176471, 1,
-0.3402958, 0.5088311, 0.3319735, 0, 1, 0.3215686, 1,
-0.3400025, 0.7761487, 0.546452, 0, 1, 0.3294118, 1,
-0.3380174, -0.3099494, -1.373591, 0, 1, 0.3333333, 1,
-0.3356951, -0.08916461, -2.318155, 0, 1, 0.3411765, 1,
-0.331478, 1.056752, -1.627716, 0, 1, 0.345098, 1,
-0.3312836, -0.3598938, -1.508618, 0, 1, 0.3529412, 1,
-0.3252302, 0.777913, -0.5076859, 0, 1, 0.3568628, 1,
-0.3245233, 0.5894727, -2.371426, 0, 1, 0.3647059, 1,
-0.3243055, -0.5494455, -3.566335, 0, 1, 0.3686275, 1,
-0.3238396, 0.4826537, 1.385068, 0, 1, 0.3764706, 1,
-0.3195116, 2.281551, -0.3913293, 0, 1, 0.3803922, 1,
-0.3157644, -0.5638915, -1.103137, 0, 1, 0.3882353, 1,
-0.3135474, 0.1872461, -1.382823, 0, 1, 0.3921569, 1,
-0.3124455, -1.552456, -3.982559, 0, 1, 0.4, 1,
-0.3045854, -0.1556618, -1.757821, 0, 1, 0.4078431, 1,
-0.3031991, 0.1395121, -2.076409, 0, 1, 0.4117647, 1,
-0.3016215, 0.8821621, 0.01431035, 0, 1, 0.4196078, 1,
-0.2957189, 0.4821352, -0.5502409, 0, 1, 0.4235294, 1,
-0.2914808, -0.2561892, -4.255092, 0, 1, 0.4313726, 1,
-0.2895799, -1.640198, -4.776422, 0, 1, 0.4352941, 1,
-0.2853849, -0.7677152, -1.650914, 0, 1, 0.4431373, 1,
-0.2820765, -0.530416, -3.481782, 0, 1, 0.4470588, 1,
-0.2769947, 0.3391899, -1.518678, 0, 1, 0.454902, 1,
-0.2729739, 0.4317173, -1.864546, 0, 1, 0.4588235, 1,
-0.2705656, -0.1079809, -0.7195185, 0, 1, 0.4666667, 1,
-0.2701394, 0.1346672, -0.8141097, 0, 1, 0.4705882, 1,
-0.2648315, 0.923495, -1.543177, 0, 1, 0.4784314, 1,
-0.2641648, -0.9943489, -3.864686, 0, 1, 0.4823529, 1,
-0.263302, 1.77223, 0.02798878, 0, 1, 0.4901961, 1,
-0.2561378, 0.4107898, -0.6128374, 0, 1, 0.4941176, 1,
-0.2559974, -1.48311, -2.109986, 0, 1, 0.5019608, 1,
-0.2532111, 1.331748, 0.1773802, 0, 1, 0.509804, 1,
-0.2522254, 0.03125721, -0.8213518, 0, 1, 0.5137255, 1,
-0.2521058, -0.7039917, -3.494011, 0, 1, 0.5215687, 1,
-0.2505135, 1.025143, 0.2162996, 0, 1, 0.5254902, 1,
-0.2471645, 0.7565647, -0.5485418, 0, 1, 0.5333334, 1,
-0.2429662, -1.3647, -2.337188, 0, 1, 0.5372549, 1,
-0.2377727, 1.502302, 1.103272, 0, 1, 0.5450981, 1,
-0.235893, -0.1568708, -1.44401, 0, 1, 0.5490196, 1,
-0.2319421, -0.5662098, -3.87286, 0, 1, 0.5568628, 1,
-0.228842, 1.2207, 0.4112346, 0, 1, 0.5607843, 1,
-0.2263575, -0.9727398, -1.481005, 0, 1, 0.5686275, 1,
-0.2188706, 0.1506889, -1.490943, 0, 1, 0.572549, 1,
-0.2176421, 0.7997859, 1.514812, 0, 1, 0.5803922, 1,
-0.2141046, 0.2835906, -1.944862, 0, 1, 0.5843138, 1,
-0.2110064, 0.713553, 1.628245, 0, 1, 0.5921569, 1,
-0.2080122, -0.2665273, -2.99243, 0, 1, 0.5960785, 1,
-0.2071119, 0.3961999, -1.457384, 0, 1, 0.6039216, 1,
-0.2061283, 1.372893, -0.641252, 0, 1, 0.6117647, 1,
-0.2029697, 0.6025784, -1.351097, 0, 1, 0.6156863, 1,
-0.2004743, 0.1873627, -1.883084, 0, 1, 0.6235294, 1,
-0.1949626, -0.8409274, -3.61506, 0, 1, 0.627451, 1,
-0.1933913, 1.685087, -0.1982571, 0, 1, 0.6352941, 1,
-0.1898751, 0.8795444, -0.398986, 0, 1, 0.6392157, 1,
-0.1827796, -1.137455, -3.13318, 0, 1, 0.6470588, 1,
-0.1810995, 0.2738412, -0.4145399, 0, 1, 0.6509804, 1,
-0.1757216, 0.3407655, -0.03289175, 0, 1, 0.6588235, 1,
-0.1722835, -1.301849, -2.917202, 0, 1, 0.6627451, 1,
-0.1715264, -0.1200116, -2.404398, 0, 1, 0.6705883, 1,
-0.1668177, 0.09695597, -0.9044166, 0, 1, 0.6745098, 1,
-0.1636724, 0.4195234, 0.136524, 0, 1, 0.682353, 1,
-0.1603521, -0.606952, -2.3801, 0, 1, 0.6862745, 1,
-0.1575949, 0.3903427, -0.3313152, 0, 1, 0.6941177, 1,
-0.1520348, -0.9701723, -2.50865, 0, 1, 0.7019608, 1,
-0.1506262, 0.1079503, -1.29365, 0, 1, 0.7058824, 1,
-0.1460309, 0.5641035, -1.106025, 0, 1, 0.7137255, 1,
-0.1450002, 0.9405311, -0.7816848, 0, 1, 0.7176471, 1,
-0.1393748, 1.783755, 1.543758, 0, 1, 0.7254902, 1,
-0.1386364, 0.9286231, -0.03380258, 0, 1, 0.7294118, 1,
-0.1369077, -1.109962, -3.196913, 0, 1, 0.7372549, 1,
-0.1337565, -1.856635, -1.89782, 0, 1, 0.7411765, 1,
-0.1308192, -1.42667, -2.986031, 0, 1, 0.7490196, 1,
-0.1284826, 0.8634359, -0.03971408, 0, 1, 0.7529412, 1,
-0.1279775, 1.033265, -0.9736682, 0, 1, 0.7607843, 1,
-0.1252877, 0.2359731, -2.03675, 0, 1, 0.7647059, 1,
-0.1208532, 1.870238, -0.9734447, 0, 1, 0.772549, 1,
-0.1184128, 0.5844612, 1.097918, 0, 1, 0.7764706, 1,
-0.1172878, 1.140732, 0.9526259, 0, 1, 0.7843137, 1,
-0.1148569, 0.5409401, 0.2634237, 0, 1, 0.7882353, 1,
-0.109882, 1.088885, 0.392035, 0, 1, 0.7960784, 1,
-0.1052981, 1.364649, -1.437279, 0, 1, 0.8039216, 1,
-0.105142, 0.2275798, -0.2388714, 0, 1, 0.8078431, 1,
-0.1007024, -0.4522551, -0.922331, 0, 1, 0.8156863, 1,
-0.09836487, -0.05164581, -2.239967, 0, 1, 0.8196079, 1,
-0.09534024, 0.2099799, -0.821968, 0, 1, 0.827451, 1,
-0.09266012, -0.753431, -4.116129, 0, 1, 0.8313726, 1,
-0.08914976, -0.1000418, -0.3655698, 0, 1, 0.8392157, 1,
-0.08809734, -0.2209221, -2.334773, 0, 1, 0.8431373, 1,
-0.08417454, -1.0589, -3.092565, 0, 1, 0.8509804, 1,
-0.08119006, -0.1336883, -2.431146, 0, 1, 0.854902, 1,
-0.07723644, 0.1877472, -0.8327989, 0, 1, 0.8627451, 1,
-0.07389484, 1.039149, 2.146839, 0, 1, 0.8666667, 1,
-0.07295656, -0.4326238, -1.346939, 0, 1, 0.8745098, 1,
-0.07035241, 1.462234, -0.3758048, 0, 1, 0.8784314, 1,
-0.06970404, 1.217069, 0.1413674, 0, 1, 0.8862745, 1,
-0.06863135, -1.775183, -3.156578, 0, 1, 0.8901961, 1,
-0.06675477, -0.02052838, -2.151334, 0, 1, 0.8980392, 1,
-0.06649259, -0.901263, -3.914766, 0, 1, 0.9058824, 1,
-0.06599353, -1.026498, -2.735144, 0, 1, 0.9098039, 1,
-0.05169439, -0.5760595, -3.10221, 0, 1, 0.9176471, 1,
-0.05065633, -1.120939, -1.059081, 0, 1, 0.9215686, 1,
-0.0478128, 2.083694, -0.763372, 0, 1, 0.9294118, 1,
-0.0466224, -0.5893975, -1.991218, 0, 1, 0.9333333, 1,
-0.04638286, 0.2647376, -0.2404074, 0, 1, 0.9411765, 1,
-0.04567267, 2.329527, -1.32672, 0, 1, 0.945098, 1,
-0.04082094, 0.4770902, 0.1999748, 0, 1, 0.9529412, 1,
-0.03632872, -0.8170168, -2.211312, 0, 1, 0.9568627, 1,
-0.03364493, 0.2047187, 0.1173262, 0, 1, 0.9647059, 1,
-0.03325403, -0.389207, -3.50767, 0, 1, 0.9686275, 1,
-0.03224767, 1.008923, -0.5599971, 0, 1, 0.9764706, 1,
-0.03109931, 0.003855494, -2.647493, 0, 1, 0.9803922, 1,
-0.02669847, 0.1409885, -0.388564, 0, 1, 0.9882353, 1,
-0.02323515, -0.05550899, -2.455151, 0, 1, 0.9921569, 1,
-0.02218636, -1.699365, -3.238496, 0, 1, 1, 1,
-0.02212523, -0.3169883, -2.463459, 0, 0.9921569, 1, 1,
-0.02152217, -0.7437742, -2.543541, 0, 0.9882353, 1, 1,
-0.02032972, 1.204806, 1.032442, 0, 0.9803922, 1, 1,
-0.01681726, 0.5251653, -0.2901964, 0, 0.9764706, 1, 1,
-0.01518424, 0.880351, -1.015591, 0, 0.9686275, 1, 1,
-0.01370296, 0.4795337, -0.5754699, 0, 0.9647059, 1, 1,
-0.01130441, -0.0318866, -3.255781, 0, 0.9568627, 1, 1,
-0.009457606, -0.1390971, -2.475224, 0, 0.9529412, 1, 1,
-0.002415724, -0.3545919, -2.523889, 0, 0.945098, 1, 1,
-0.001496238, 0.8212616, -1.189228, 0, 0.9411765, 1, 1,
0.00340044, 0.2623442, -0.1427855, 0, 0.9333333, 1, 1,
0.007941892, -0.1275577, 3.28353, 0, 0.9294118, 1, 1,
0.009147032, 0.3408666, 0.5655352, 0, 0.9215686, 1, 1,
0.01013298, -2.127703, 2.411988, 0, 0.9176471, 1, 1,
0.0110392, -0.5597042, 2.618012, 0, 0.9098039, 1, 1,
0.01562496, -0.7433649, 1.737853, 0, 0.9058824, 1, 1,
0.02041299, -1.274624, 4.250986, 0, 0.8980392, 1, 1,
0.02451592, -1.16037, 3.284297, 0, 0.8901961, 1, 1,
0.02502565, 0.5337249, 2.649063, 0, 0.8862745, 1, 1,
0.02638545, -0.9031393, 3.234763, 0, 0.8784314, 1, 1,
0.03074823, -0.9712166, 3.524668, 0, 0.8745098, 1, 1,
0.03426158, -0.9205406, 4.53939, 0, 0.8666667, 1, 1,
0.0408517, -0.8314897, 4.317914, 0, 0.8627451, 1, 1,
0.04319621, 0.9570506, 1.181258, 0, 0.854902, 1, 1,
0.04643361, 1.08813, -0.4891995, 0, 0.8509804, 1, 1,
0.04842795, -0.7432711, 2.45696, 0, 0.8431373, 1, 1,
0.0553138, -0.6533534, 4.076838, 0, 0.8392157, 1, 1,
0.05630998, -1.21342, 2.489883, 0, 0.8313726, 1, 1,
0.05664251, 2.453395, -0.3988387, 0, 0.827451, 1, 1,
0.05679278, 0.04112992, 0.7618112, 0, 0.8196079, 1, 1,
0.05756986, 0.2952275, -0.1629134, 0, 0.8156863, 1, 1,
0.06304736, -0.09237263, 3.12908, 0, 0.8078431, 1, 1,
0.06700213, -0.3008901, 2.179567, 0, 0.8039216, 1, 1,
0.06825592, -0.1633928, 1.870264, 0, 0.7960784, 1, 1,
0.06974246, 0.5617325, -0.7580179, 0, 0.7882353, 1, 1,
0.06982112, 0.2454321, 1.62664, 0, 0.7843137, 1, 1,
0.07299096, 1.490198, -1.350214, 0, 0.7764706, 1, 1,
0.07564027, -1.203986, 4.116306, 0, 0.772549, 1, 1,
0.07751521, 0.4319938, 1.058545, 0, 0.7647059, 1, 1,
0.08064676, 0.5123591, -0.3700335, 0, 0.7607843, 1, 1,
0.08073967, -1.45307, 3.662133, 0, 0.7529412, 1, 1,
0.08204074, -1.36109, 3.843871, 0, 0.7490196, 1, 1,
0.08504988, 0.2363523, 0.7807422, 0, 0.7411765, 1, 1,
0.08625703, -1.257509, 4.552631, 0, 0.7372549, 1, 1,
0.08839586, 0.2425912, -1.434544, 0, 0.7294118, 1, 1,
0.09013733, -1.221153, 0.9003443, 0, 0.7254902, 1, 1,
0.09027354, 0.1552223, 2.57893, 0, 0.7176471, 1, 1,
0.09240907, -1.516322, 2.347598, 0, 0.7137255, 1, 1,
0.09419744, -1.166859, 3.762331, 0, 0.7058824, 1, 1,
0.09700766, -0.9585068, 3.771909, 0, 0.6980392, 1, 1,
0.0984614, 0.6182635, -0.03985779, 0, 0.6941177, 1, 1,
0.1004319, -0.1819489, 2.900142, 0, 0.6862745, 1, 1,
0.104638, 0.299465, 1.211814, 0, 0.682353, 1, 1,
0.1053812, -0.4897714, 2.906647, 0, 0.6745098, 1, 1,
0.1065399, 0.9543624, 0.2623793, 0, 0.6705883, 1, 1,
0.1075149, 0.2822403, 0.6121529, 0, 0.6627451, 1, 1,
0.107602, 0.125226, 0.5863261, 0, 0.6588235, 1, 1,
0.1076414, -0.01332995, 1.516366, 0, 0.6509804, 1, 1,
0.1107659, -0.1241655, 0.0009425936, 0, 0.6470588, 1, 1,
0.1114497, 0.2097181, -0.02670099, 0, 0.6392157, 1, 1,
0.1207307, -1.950426, 2.435348, 0, 0.6352941, 1, 1,
0.1208981, 0.2306474, 0.6691885, 0, 0.627451, 1, 1,
0.1218363, -0.3055657, 4.61455, 0, 0.6235294, 1, 1,
0.1230825, -0.01526707, 1.819836, 0, 0.6156863, 1, 1,
0.1263153, -1.326711, 4.402134, 0, 0.6117647, 1, 1,
0.1308904, -1.109669, 1.890177, 0, 0.6039216, 1, 1,
0.1319642, -0.7318311, 0.8942198, 0, 0.5960785, 1, 1,
0.1337469, 1.240671, -0.6287726, 0, 0.5921569, 1, 1,
0.137021, -0.3214869, 3.411015, 0, 0.5843138, 1, 1,
0.1406567, -0.7569971, 3.070473, 0, 0.5803922, 1, 1,
0.1419975, 1.868782, 0.01241328, 0, 0.572549, 1, 1,
0.1453648, 0.3185726, -0.7623509, 0, 0.5686275, 1, 1,
0.1465565, 0.4351864, 1.563679, 0, 0.5607843, 1, 1,
0.147783, -2.673294, 1.915097, 0, 0.5568628, 1, 1,
0.1532052, -0.725626, 4.284595, 0, 0.5490196, 1, 1,
0.1532591, -1.243526, 3.795672, 0, 0.5450981, 1, 1,
0.1535114, 0.00181043, 1.795375, 0, 0.5372549, 1, 1,
0.1548281, 1.989153, 0.8305076, 0, 0.5333334, 1, 1,
0.1575398, 2.235351, -0.9590549, 0, 0.5254902, 1, 1,
0.1610985, -0.3618834, 1.739939, 0, 0.5215687, 1, 1,
0.1619764, -0.4814558, 3.373316, 0, 0.5137255, 1, 1,
0.1658965, -3.263309, 1.651413, 0, 0.509804, 1, 1,
0.1675069, 0.2653466, 0.5233496, 0, 0.5019608, 1, 1,
0.1676844, 1.516195, 1.339994, 0, 0.4941176, 1, 1,
0.1724182, 1.366444, -1.664678, 0, 0.4901961, 1, 1,
0.1753636, 0.6535916, -1.096598, 0, 0.4823529, 1, 1,
0.1779271, 0.3537576, 0.06790045, 0, 0.4784314, 1, 1,
0.1796329, -1.156953, 2.928142, 0, 0.4705882, 1, 1,
0.1824659, -1.314007, 3.573578, 0, 0.4666667, 1, 1,
0.1850317, 0.3253305, 2.684042, 0, 0.4588235, 1, 1,
0.1857528, -0.7954385, 2.992095, 0, 0.454902, 1, 1,
0.1947474, -0.3542293, 3.06751, 0, 0.4470588, 1, 1,
0.1961341, -0.07522815, 4.319184, 0, 0.4431373, 1, 1,
0.1971305, 1.469215, 1.370935, 0, 0.4352941, 1, 1,
0.1985939, -0.8984817, 2.932807, 0, 0.4313726, 1, 1,
0.1986802, 0.3971457, 1.335923, 0, 0.4235294, 1, 1,
0.1992663, -0.1097438, 1.04824, 0, 0.4196078, 1, 1,
0.2014474, 0.7863597, -0.8984895, 0, 0.4117647, 1, 1,
0.2020388, 0.986034, -1.026419, 0, 0.4078431, 1, 1,
0.2021767, 0.9712949, 1.317847, 0, 0.4, 1, 1,
0.2059295, -0.8023768, 2.548899, 0, 0.3921569, 1, 1,
0.2095167, 0.9920255, 1.329944, 0, 0.3882353, 1, 1,
0.2105342, 0.3159198, 0.8014215, 0, 0.3803922, 1, 1,
0.2146506, 0.4474384, -0.1957684, 0, 0.3764706, 1, 1,
0.2283161, 0.09552729, 1.42133, 0, 0.3686275, 1, 1,
0.2295885, 0.09995518, 1.070138, 0, 0.3647059, 1, 1,
0.2321056, -0.1558753, 2.228876, 0, 0.3568628, 1, 1,
0.2321189, 1.505883, -0.4075396, 0, 0.3529412, 1, 1,
0.2385098, 1.614097, 0.2179317, 0, 0.345098, 1, 1,
0.2417894, 0.6618382, 0.08032986, 0, 0.3411765, 1, 1,
0.2429719, -0.8699496, 3.800494, 0, 0.3333333, 1, 1,
0.2436259, 0.756241, 0.5389436, 0, 0.3294118, 1, 1,
0.2480009, -0.3779958, 2.301709, 0, 0.3215686, 1, 1,
0.2503136, -0.02058331, 1.308151, 0, 0.3176471, 1, 1,
0.2538476, -1.05003, 2.565084, 0, 0.3098039, 1, 1,
0.2551369, 0.4334538, -0.3007039, 0, 0.3058824, 1, 1,
0.2559832, 1.335451, 2.20606, 0, 0.2980392, 1, 1,
0.2577475, 0.8126785, 0.7173707, 0, 0.2901961, 1, 1,
0.261406, -0.2515205, 2.247068, 0, 0.2862745, 1, 1,
0.2619051, -0.7993281, 2.677369, 0, 0.2784314, 1, 1,
0.2619545, -0.588586, 4.38729, 0, 0.2745098, 1, 1,
0.2626913, -1.327276, 3.280652, 0, 0.2666667, 1, 1,
0.2691659, 0.9192618, -1.014824, 0, 0.2627451, 1, 1,
0.2699101, -0.01495081, 3.298654, 0, 0.254902, 1, 1,
0.2722716, 0.2585194, 1.323515, 0, 0.2509804, 1, 1,
0.2764899, 0.5570222, 0.7537121, 0, 0.2431373, 1, 1,
0.2789382, 1.178441, -0.213117, 0, 0.2392157, 1, 1,
0.2805237, -0.9159017, 3.174417, 0, 0.2313726, 1, 1,
0.2813761, -1.044877, 4.787104, 0, 0.227451, 1, 1,
0.2821668, 0.8505129, 1.678125, 0, 0.2196078, 1, 1,
0.2834081, -1.194828, 2.011675, 0, 0.2156863, 1, 1,
0.2834202, -0.9933871, 3.071268, 0, 0.2078431, 1, 1,
0.2874927, 1.869086, 2.530166, 0, 0.2039216, 1, 1,
0.2953089, -0.2000023, 3.608891, 0, 0.1960784, 1, 1,
0.2955948, -1.216813, 3.299132, 0, 0.1882353, 1, 1,
0.3009842, 1.405059, 0.7267455, 0, 0.1843137, 1, 1,
0.3013476, 1.03529, -1.3815, 0, 0.1764706, 1, 1,
0.304638, -1.079751, 2.722102, 0, 0.172549, 1, 1,
0.306639, -1.175515, 5.082064, 0, 0.1647059, 1, 1,
0.3073677, -2.183262, 4.207875, 0, 0.1607843, 1, 1,
0.3101258, 1.424817, -0.7210563, 0, 0.1529412, 1, 1,
0.310826, -0.4835877, 2.664738, 0, 0.1490196, 1, 1,
0.3131651, 1.394927, 1.790086, 0, 0.1411765, 1, 1,
0.314665, 0.3024986, 1.40274, 0, 0.1372549, 1, 1,
0.3150749, 0.1384629, 0.01032714, 0, 0.1294118, 1, 1,
0.3153371, -0.5372432, 1.72138, 0, 0.1254902, 1, 1,
0.3227358, -0.362891, 1.913259, 0, 0.1176471, 1, 1,
0.3289771, -1.004255, 2.649013, 0, 0.1137255, 1, 1,
0.3451861, -0.7579367, 4.089609, 0, 0.1058824, 1, 1,
0.3478345, -1.443765, 3.146817, 0, 0.09803922, 1, 1,
0.3490727, 1.239291, -0.9686523, 0, 0.09411765, 1, 1,
0.3596765, 0.8704059, 0.5646427, 0, 0.08627451, 1, 1,
0.3613229, -1.200087, 3.425328, 0, 0.08235294, 1, 1,
0.3619567, -1.05848, 3.080739, 0, 0.07450981, 1, 1,
0.3712772, 0.472311, 0.4547147, 0, 0.07058824, 1, 1,
0.3727576, 0.1665622, 0.08978598, 0, 0.0627451, 1, 1,
0.3730258, 0.6103389, 1.703993, 0, 0.05882353, 1, 1,
0.3739643, 0.3895919, 0.09092731, 0, 0.05098039, 1, 1,
0.3810646, -0.6736846, 4.671747, 0, 0.04705882, 1, 1,
0.3853663, -0.9207475, 0.2369785, 0, 0.03921569, 1, 1,
0.3860446, -1.533527, 2.517155, 0, 0.03529412, 1, 1,
0.3862277, -0.6535901, 2.681897, 0, 0.02745098, 1, 1,
0.3892886, 0.1932067, 0.2953581, 0, 0.02352941, 1, 1,
0.3913618, -1.174383, 2.637631, 0, 0.01568628, 1, 1,
0.392909, -0.3816253, 3.451605, 0, 0.01176471, 1, 1,
0.3942439, 0.9692316, 1.225485, 0, 0.003921569, 1, 1,
0.3958837, -0.663964, 3.289759, 0.003921569, 0, 1, 1,
0.3976969, -0.6181245, 1.658643, 0.007843138, 0, 1, 1,
0.4008371, -0.4144138, 2.146949, 0.01568628, 0, 1, 1,
0.4035706, -0.1679197, 1.981647, 0.01960784, 0, 1, 1,
0.4040487, -1.017388, 2.664016, 0.02745098, 0, 1, 1,
0.4087526, -0.1561071, 0.3392546, 0.03137255, 0, 1, 1,
0.4095435, -1.727343, 3.562622, 0.03921569, 0, 1, 1,
0.4102639, -1.002058, 2.431021, 0.04313726, 0, 1, 1,
0.4288868, 0.1130127, 0.8237798, 0.05098039, 0, 1, 1,
0.4296412, 0.003035382, 3.132752, 0.05490196, 0, 1, 1,
0.4299206, 0.7599406, -0.3788403, 0.0627451, 0, 1, 1,
0.4300227, -0.6341016, 1.431373, 0.06666667, 0, 1, 1,
0.4318437, -0.678206, 3.939105, 0.07450981, 0, 1, 1,
0.4329595, -2.144519, 0.8079355, 0.07843138, 0, 1, 1,
0.434035, -0.01155814, 1.642027, 0.08627451, 0, 1, 1,
0.4341548, 0.3752837, 0.4860105, 0.09019608, 0, 1, 1,
0.4396929, -1.439606, 0.2322782, 0.09803922, 0, 1, 1,
0.4413034, -0.5952876, 2.178996, 0.1058824, 0, 1, 1,
0.4414736, -1.414301, 1.977657, 0.1098039, 0, 1, 1,
0.441588, -0.7821243, 2.644276, 0.1176471, 0, 1, 1,
0.4442623, 2.178978, 0.9836837, 0.1215686, 0, 1, 1,
0.4465041, 0.807462, 2.338444, 0.1294118, 0, 1, 1,
0.4524545, -0.3110111, 1.937439, 0.1333333, 0, 1, 1,
0.4537455, 0.6383902, 0.6868199, 0.1411765, 0, 1, 1,
0.4591814, 0.9900283, -0.5406322, 0.145098, 0, 1, 1,
0.462741, -0.8199052, 2.010411, 0.1529412, 0, 1, 1,
0.4656609, 0.3577544, -0.6311971, 0.1568628, 0, 1, 1,
0.4657687, 1.811269, 1.095677, 0.1647059, 0, 1, 1,
0.4677908, -0.389971, 1.580981, 0.1686275, 0, 1, 1,
0.4748504, 1.597154, 1.343936, 0.1764706, 0, 1, 1,
0.4761338, -1.103971, 2.620955, 0.1803922, 0, 1, 1,
0.4784807, 0.5762647, 0.2274188, 0.1882353, 0, 1, 1,
0.4794765, 0.975112, 1.567441, 0.1921569, 0, 1, 1,
0.4839496, -1.007704, 1.987149, 0.2, 0, 1, 1,
0.4855884, -1.479561, 2.633475, 0.2078431, 0, 1, 1,
0.4881493, 0.1811991, 0.09256471, 0.2117647, 0, 1, 1,
0.4899355, -1.810001, 1.851828, 0.2196078, 0, 1, 1,
0.4990481, 0.314162, 2.047305, 0.2235294, 0, 1, 1,
0.5035608, 1.029737, -0.9877834, 0.2313726, 0, 1, 1,
0.5063359, -1.520144, -0.005050891, 0.2352941, 0, 1, 1,
0.5120057, -1.41919, 2.061838, 0.2431373, 0, 1, 1,
0.512747, 0.8090565, 1.10021, 0.2470588, 0, 1, 1,
0.513817, -0.8701078, 2.899984, 0.254902, 0, 1, 1,
0.5166604, 1.026529, 1.276004, 0.2588235, 0, 1, 1,
0.5214357, 0.2089254, -0.02772434, 0.2666667, 0, 1, 1,
0.5269861, 1.399013, -0.5107179, 0.2705882, 0, 1, 1,
0.5368462, -1.734926, 2.663761, 0.2784314, 0, 1, 1,
0.5390677, -0.06287934, 0.8981532, 0.282353, 0, 1, 1,
0.5395564, 0.7470881, 0.1193622, 0.2901961, 0, 1, 1,
0.5404014, -0.5187491, 2.497967, 0.2941177, 0, 1, 1,
0.5413752, 0.8016435, -0.4234192, 0.3019608, 0, 1, 1,
0.5430633, 1.583217, -1.80495, 0.3098039, 0, 1, 1,
0.5448189, -0.93205, 1.523759, 0.3137255, 0, 1, 1,
0.5464929, 0.04366013, 1.895072, 0.3215686, 0, 1, 1,
0.5477997, -0.0470946, 1.69749, 0.3254902, 0, 1, 1,
0.558857, -1.262453, 3.281672, 0.3333333, 0, 1, 1,
0.5625017, 1.089682, 0.5292014, 0.3372549, 0, 1, 1,
0.5654244, -1.281408, 4.677413, 0.345098, 0, 1, 1,
0.5677876, -1.222011, 3.301218, 0.3490196, 0, 1, 1,
0.5725541, -0.1263847, 3.282141, 0.3568628, 0, 1, 1,
0.5744026, 2.165433, -0.8314068, 0.3607843, 0, 1, 1,
0.5863239, 1.009109, -1.45367, 0.3686275, 0, 1, 1,
0.5880216, -0.009033843, 4.025156, 0.372549, 0, 1, 1,
0.6018165, 1.528577, 0.2475382, 0.3803922, 0, 1, 1,
0.6021792, -0.7684234, 2.195647, 0.3843137, 0, 1, 1,
0.6065261, -1.174397, 1.371171, 0.3921569, 0, 1, 1,
0.6075007, 0.8066511, -0.3819938, 0.3960784, 0, 1, 1,
0.613299, -0.3915868, 1.2957, 0.4039216, 0, 1, 1,
0.6146355, 0.4332958, 0.7137829, 0.4117647, 0, 1, 1,
0.6148322, 0.1506307, 1.349605, 0.4156863, 0, 1, 1,
0.6248047, 0.04446511, 2.42517, 0.4235294, 0, 1, 1,
0.6331204, 0.1740406, 0.7774704, 0.427451, 0, 1, 1,
0.6337634, 0.3197395, 0.1916526, 0.4352941, 0, 1, 1,
0.6374534, 1.337584, 1.514847, 0.4392157, 0, 1, 1,
0.6385416, -0.05931059, 2.467052, 0.4470588, 0, 1, 1,
0.6397339, 0.0853051, 1.205273, 0.4509804, 0, 1, 1,
0.6460479, 0.938013, -1.337054, 0.4588235, 0, 1, 1,
0.6670533, -1.745254, 2.864767, 0.4627451, 0, 1, 1,
0.668007, -1.136084, 2.508255, 0.4705882, 0, 1, 1,
0.6688834, -0.06181577, 0.4305386, 0.4745098, 0, 1, 1,
0.6716884, 1.412004, 0.4371823, 0.4823529, 0, 1, 1,
0.6732911, 1.157457, 1.394791, 0.4862745, 0, 1, 1,
0.6739199, -0.5176321, 1.712938, 0.4941176, 0, 1, 1,
0.679343, 0.2410416, 1.558105, 0.5019608, 0, 1, 1,
0.6847169, -1.541013, 4.469549, 0.5058824, 0, 1, 1,
0.6847358, -2.751429, 3.395611, 0.5137255, 0, 1, 1,
0.6851729, 0.5126452, 1.374834, 0.5176471, 0, 1, 1,
0.6859663, -2.048855, 1.835615, 0.5254902, 0, 1, 1,
0.6900126, -0.1047815, 0.3907184, 0.5294118, 0, 1, 1,
0.6964436, -0.1591315, 3.118241, 0.5372549, 0, 1, 1,
0.7007805, 0.6190499, 0.8610467, 0.5411765, 0, 1, 1,
0.7018152, -0.3050664, 2.361524, 0.5490196, 0, 1, 1,
0.7028717, 0.03279886, 1.425848, 0.5529412, 0, 1, 1,
0.7037618, -0.2061076, 3.253725, 0.5607843, 0, 1, 1,
0.7044165, 0.2991231, 2.624158, 0.5647059, 0, 1, 1,
0.7147955, -0.5207397, 2.605197, 0.572549, 0, 1, 1,
0.7211173, -0.1185923, 1.470872, 0.5764706, 0, 1, 1,
0.7212373, -2.1415, 3.266067, 0.5843138, 0, 1, 1,
0.7284195, -0.3061195, 1.879306, 0.5882353, 0, 1, 1,
0.732276, -0.09552458, 1.054836, 0.5960785, 0, 1, 1,
0.7435238, 0.2084144, 1.351391, 0.6039216, 0, 1, 1,
0.7461644, -0.8244672, 1.175648, 0.6078432, 0, 1, 1,
0.7509586, 1.251316, -0.9078046, 0.6156863, 0, 1, 1,
0.7515557, -0.2065051, 0.06826437, 0.6196079, 0, 1, 1,
0.7528228, 0.6503437, 1.353128, 0.627451, 0, 1, 1,
0.7557315, 0.4332086, 1.438024, 0.6313726, 0, 1, 1,
0.7566718, -2.818573, 3.948366, 0.6392157, 0, 1, 1,
0.7634411, -0.5830858, 0.4270431, 0.6431373, 0, 1, 1,
0.7673575, 1.071212, -0.1547362, 0.6509804, 0, 1, 1,
0.7709183, -0.3148263, 3.427262, 0.654902, 0, 1, 1,
0.7732517, 1.790097, 1.190026, 0.6627451, 0, 1, 1,
0.7796977, 1.654219, 0.9553246, 0.6666667, 0, 1, 1,
0.7797459, 0.441079, 1.382138, 0.6745098, 0, 1, 1,
0.7821961, 1.069441, 0.7127891, 0.6784314, 0, 1, 1,
0.7831978, 1.469883, 1.458821, 0.6862745, 0, 1, 1,
0.7851757, 0.73974, 1.600613, 0.6901961, 0, 1, 1,
0.786357, -1.253104, 0.8071159, 0.6980392, 0, 1, 1,
0.7885606, 1.275476, -0.2610287, 0.7058824, 0, 1, 1,
0.7909403, 1.012175, 0.5045793, 0.7098039, 0, 1, 1,
0.808112, -0.8370864, 3.303905, 0.7176471, 0, 1, 1,
0.8110175, 1.010844, 1.513623, 0.7215686, 0, 1, 1,
0.8222282, -0.1899891, 2.318378, 0.7294118, 0, 1, 1,
0.8224233, -1.097937, 4.212423, 0.7333333, 0, 1, 1,
0.8229369, -1.97493, 2.22832, 0.7411765, 0, 1, 1,
0.8264048, 1.496473, 1.265796, 0.7450981, 0, 1, 1,
0.8279803, 1.271185, 0.003518615, 0.7529412, 0, 1, 1,
0.8280191, -0.6520815, 1.034614, 0.7568628, 0, 1, 1,
0.8331137, 0.577101, 1.103012, 0.7647059, 0, 1, 1,
0.8367031, 0.780333, 1.195878, 0.7686275, 0, 1, 1,
0.8390059, -0.4589991, 0.5814192, 0.7764706, 0, 1, 1,
0.8543006, -0.2788047, 2.959099, 0.7803922, 0, 1, 1,
0.8544145, -0.3820803, -0.776597, 0.7882353, 0, 1, 1,
0.8569912, 0.6272948, -0.5897212, 0.7921569, 0, 1, 1,
0.8666574, -1.243794, 2.932476, 0.8, 0, 1, 1,
0.8690465, -0.1819306, 2.055406, 0.8078431, 0, 1, 1,
0.8779569, -1.037256, 2.146926, 0.8117647, 0, 1, 1,
0.8779629, -0.4687229, 0.4885009, 0.8196079, 0, 1, 1,
0.8813783, 0.7083412, 1.967948, 0.8235294, 0, 1, 1,
0.8824828, -0.5111119, 1.14903, 0.8313726, 0, 1, 1,
0.8877141, -0.5710615, 0.3231405, 0.8352941, 0, 1, 1,
0.8885984, -0.7317587, 1.846811, 0.8431373, 0, 1, 1,
0.8940501, -0.08157711, -0.4224246, 0.8470588, 0, 1, 1,
0.8983586, -0.627748, 2.945622, 0.854902, 0, 1, 1,
0.9029242, 1.056982, 0.01510568, 0.8588235, 0, 1, 1,
0.9029871, 0.5756451, 1.246958, 0.8666667, 0, 1, 1,
0.9094745, 1.176131, -0.9166037, 0.8705882, 0, 1, 1,
0.912969, -0.381989, 1.388853, 0.8784314, 0, 1, 1,
0.9130011, -0.1564838, 1.318335, 0.8823529, 0, 1, 1,
0.9142327, -0.06015372, 0.5668927, 0.8901961, 0, 1, 1,
0.9145926, -0.9019263, 2.933954, 0.8941177, 0, 1, 1,
0.9176762, -0.2035477, 2.945633, 0.9019608, 0, 1, 1,
0.9204029, 0.4868123, -0.1524989, 0.9098039, 0, 1, 1,
0.9241582, -1.066682, 1.882893, 0.9137255, 0, 1, 1,
0.9280115, -0.3527131, 2.920883, 0.9215686, 0, 1, 1,
0.9365116, -0.558039, 0.8785309, 0.9254902, 0, 1, 1,
0.9421558, 0.8785232, 1.434261, 0.9333333, 0, 1, 1,
0.9498588, 0.7857001, 0.7220592, 0.9372549, 0, 1, 1,
0.9566149, -1.671251, 1.701298, 0.945098, 0, 1, 1,
0.9566741, 1.086178, 0.3115522, 0.9490196, 0, 1, 1,
0.9581962, 1.213134, 1.703992, 0.9568627, 0, 1, 1,
0.9634386, 1.561676, -1.405334, 0.9607843, 0, 1, 1,
0.9639101, 0.06624141, 1.044022, 0.9686275, 0, 1, 1,
0.9703126, -0.1605456, 1.140644, 0.972549, 0, 1, 1,
0.9759134, -1.012954, 1.446812, 0.9803922, 0, 1, 1,
0.9783958, -0.9856758, 2.819215, 0.9843137, 0, 1, 1,
0.9840244, -0.1348439, 2.055879, 0.9921569, 0, 1, 1,
0.9856131, 1.181918, 0.5225404, 0.9960784, 0, 1, 1,
0.988369, 0.6366248, 2.474428, 1, 0, 0.9960784, 1,
0.9927234, -1.856621, 2.991526, 1, 0, 0.9882353, 1,
0.9942898, 0.4105644, -0.7340475, 1, 0, 0.9843137, 1,
0.9948406, -0.9743246, 1.918068, 1, 0, 0.9764706, 1,
0.9960193, 0.9799208, -0.1821987, 1, 0, 0.972549, 1,
1.004106, 0.06735071, 1.029021, 1, 0, 0.9647059, 1,
1.005333, -1.152267, 3.020886, 1, 0, 0.9607843, 1,
1.012347, -1.042831, 2.05114, 1, 0, 0.9529412, 1,
1.024387, 0.8165818, -0.5606217, 1, 0, 0.9490196, 1,
1.025161, 0.2786795, 0.09228935, 1, 0, 0.9411765, 1,
1.027259, 0.5058219, 1.423318, 1, 0, 0.9372549, 1,
1.042947, -0.2901997, 0.8953243, 1, 0, 0.9294118, 1,
1.044752, -1.533177, 3.093802, 1, 0, 0.9254902, 1,
1.045876, -0.1211177, 1.589302, 1, 0, 0.9176471, 1,
1.049877, -0.1998702, 1.211289, 1, 0, 0.9137255, 1,
1.055246, 1.906847, 0.5585017, 1, 0, 0.9058824, 1,
1.063067, -0.3540121, 0.7295003, 1, 0, 0.9019608, 1,
1.063789, 1.907665, -0.1777956, 1, 0, 0.8941177, 1,
1.068104, 0.1580498, 1.562833, 1, 0, 0.8862745, 1,
1.069908, 1.253897, 0.3062157, 1, 0, 0.8823529, 1,
1.077129, 1.490602, -0.5388869, 1, 0, 0.8745098, 1,
1.079692, 0.008572254, 1.591772, 1, 0, 0.8705882, 1,
1.083288, -0.0322498, -0.1553789, 1, 0, 0.8627451, 1,
1.101768, -1.683749, 3.097223, 1, 0, 0.8588235, 1,
1.108506, -1.133246, 4.043057, 1, 0, 0.8509804, 1,
1.111506, -1.293875, 2.119058, 1, 0, 0.8470588, 1,
1.114796, 0.1038715, 1.957765, 1, 0, 0.8392157, 1,
1.120849, 0.8448114, 1.125842, 1, 0, 0.8352941, 1,
1.128641, -0.7765023, 2.421803, 1, 0, 0.827451, 1,
1.128708, 1.329379, -0.1403534, 1, 0, 0.8235294, 1,
1.133584, 0.212253, 2.529996, 1, 0, 0.8156863, 1,
1.134053, -1.806176, 3.352605, 1, 0, 0.8117647, 1,
1.134998, 2.365237, 1.351286, 1, 0, 0.8039216, 1,
1.136874, -2.143383, 3.303368, 1, 0, 0.7960784, 1,
1.142639, 1.009371, 0.8890102, 1, 0, 0.7921569, 1,
1.156503, 0.1439921, 2.348726, 1, 0, 0.7843137, 1,
1.164187, -1.578342, 2.582193, 1, 0, 0.7803922, 1,
1.170219, -0.260748, 1.335861, 1, 0, 0.772549, 1,
1.172333, -0.4081169, 3.809829, 1, 0, 0.7686275, 1,
1.176803, 0.03820731, 1.54595, 1, 0, 0.7607843, 1,
1.185068, 1.845874, 0.1321015, 1, 0, 0.7568628, 1,
1.193375, -0.3161964, 0.8999856, 1, 0, 0.7490196, 1,
1.219213, 0.5273937, -0.01401425, 1, 0, 0.7450981, 1,
1.221998, 0.4024229, 1.024097, 1, 0, 0.7372549, 1,
1.232162, -0.09856347, 1.205558, 1, 0, 0.7333333, 1,
1.232997, -0.7319986, 1.973252, 1, 0, 0.7254902, 1,
1.236024, 0.5687149, 1.718557, 1, 0, 0.7215686, 1,
1.237632, 0.09226441, 1.53589, 1, 0, 0.7137255, 1,
1.252883, -0.5298537, 3.888844, 1, 0, 0.7098039, 1,
1.263727, 0.4602666, 0.817881, 1, 0, 0.7019608, 1,
1.266006, 0.664156, 1.74616, 1, 0, 0.6941177, 1,
1.268093, 0.3329022, 1.851732, 1, 0, 0.6901961, 1,
1.279417, 0.1597597, 0.5694305, 1, 0, 0.682353, 1,
1.285123, -0.03812723, 0.7732085, 1, 0, 0.6784314, 1,
1.287878, 0.1433683, 2.891092, 1, 0, 0.6705883, 1,
1.292442, 1.842205, 0.3728672, 1, 0, 0.6666667, 1,
1.298806, -0.515845, 2.275948, 1, 0, 0.6588235, 1,
1.298948, -1.42823, 2.684592, 1, 0, 0.654902, 1,
1.308154, 0.3438856, -0.04657898, 1, 0, 0.6470588, 1,
1.31434, -1.217731, 2.427775, 1, 0, 0.6431373, 1,
1.318983, -0.5288881, 1.609075, 1, 0, 0.6352941, 1,
1.323509, 2.958302, 0.727213, 1, 0, 0.6313726, 1,
1.323634, 1.005708, 1.333931, 1, 0, 0.6235294, 1,
1.329046, -0.824764, 1.352652, 1, 0, 0.6196079, 1,
1.332584, -0.1940012, -0.07421601, 1, 0, 0.6117647, 1,
1.332643, 0.5131291, 2.272207, 1, 0, 0.6078432, 1,
1.341901, 0.9168532, 3.184271, 1, 0, 0.6, 1,
1.342412, -1.450961, 0.9493354, 1, 0, 0.5921569, 1,
1.344203, -0.855087, 1.782481, 1, 0, 0.5882353, 1,
1.35519, -0.1496625, 0.9438387, 1, 0, 0.5803922, 1,
1.373358, 1.662458, 1.867871, 1, 0, 0.5764706, 1,
1.382748, 0.148986, 0.9337707, 1, 0, 0.5686275, 1,
1.385534, 1.067266, 0.8273003, 1, 0, 0.5647059, 1,
1.38815, 1.543785, -0.2254435, 1, 0, 0.5568628, 1,
1.404149, -0.5022073, 2.875293, 1, 0, 0.5529412, 1,
1.415184, -0.9629088, 1.168693, 1, 0, 0.5450981, 1,
1.416802, -1.158259, 2.090621, 1, 0, 0.5411765, 1,
1.426873, -2.673499, 3.605932, 1, 0, 0.5333334, 1,
1.430412, 0.2496553, 2.771214, 1, 0, 0.5294118, 1,
1.432424, -0.08605992, 1.734407, 1, 0, 0.5215687, 1,
1.432624, 0.7015414, 1.052799, 1, 0, 0.5176471, 1,
1.433523, 0.7037953, 1.016203, 1, 0, 0.509804, 1,
1.436256, 0.9476823, 1.422625, 1, 0, 0.5058824, 1,
1.441208, -1.836454, 2.609488, 1, 0, 0.4980392, 1,
1.444541, 0.6024837, 3.069993, 1, 0, 0.4901961, 1,
1.447616, -0.6346574, 2.557851, 1, 0, 0.4862745, 1,
1.449, -1.186247, 0.4789665, 1, 0, 0.4784314, 1,
1.45197, 0.8191115, 0.8567947, 1, 0, 0.4745098, 1,
1.45875, -0.06948232, 1.402165, 1, 0, 0.4666667, 1,
1.465904, -1.583626, 3.023319, 1, 0, 0.4627451, 1,
1.483885, 0.2218198, 0.6446538, 1, 0, 0.454902, 1,
1.484745, 0.7663832, 0.6850678, 1, 0, 0.4509804, 1,
1.487406, 0.96839, 1.321836, 1, 0, 0.4431373, 1,
1.500592, 1.878188, 1.115896, 1, 0, 0.4392157, 1,
1.506788, 1.820035, 2.15238, 1, 0, 0.4313726, 1,
1.507334, 1.133701, 0.008089529, 1, 0, 0.427451, 1,
1.510313, 1.029423, 0.8625656, 1, 0, 0.4196078, 1,
1.51556, -1.066914, 0.9888434, 1, 0, 0.4156863, 1,
1.528004, -0.3912885, 2.899314, 1, 0, 0.4078431, 1,
1.537234, 0.3267098, -0.08868287, 1, 0, 0.4039216, 1,
1.539919, -0.4417621, 3.458731, 1, 0, 0.3960784, 1,
1.54217, -0.4662147, 1.6644, 1, 0, 0.3882353, 1,
1.547156, 1.027932, 1.21449, 1, 0, 0.3843137, 1,
1.547688, 0.741725, 0.8347172, 1, 0, 0.3764706, 1,
1.548687, 1.856671, -0.7097143, 1, 0, 0.372549, 1,
1.549703, 0.6006418, 2.5026, 1, 0, 0.3647059, 1,
1.57409, -1.331199, 2.893823, 1, 0, 0.3607843, 1,
1.581421, 0.2520134, 2.909559, 1, 0, 0.3529412, 1,
1.584303, 1.124365, 1.67443, 1, 0, 0.3490196, 1,
1.587963, -0.7183079, 0.5031257, 1, 0, 0.3411765, 1,
1.589582, 0.4982817, -0.8493239, 1, 0, 0.3372549, 1,
1.603715, 0.05782159, 1.20582, 1, 0, 0.3294118, 1,
1.612864, -0.5273237, 2.650621, 1, 0, 0.3254902, 1,
1.624531, -0.5675619, 1.709776, 1, 0, 0.3176471, 1,
1.627491, -1.695812, 3.807952, 1, 0, 0.3137255, 1,
1.650784, 0.2147543, 3.665395, 1, 0, 0.3058824, 1,
1.652644, -0.06326481, -0.01296753, 1, 0, 0.2980392, 1,
1.667276, 0.3572226, 2.749441, 1, 0, 0.2941177, 1,
1.686388, 0.1791046, 1.103315, 1, 0, 0.2862745, 1,
1.706488, -0.233486, 3.765564, 1, 0, 0.282353, 1,
1.706963, 0.6872038, 1.112454, 1, 0, 0.2745098, 1,
1.709167, 1.119335, 0.6253691, 1, 0, 0.2705882, 1,
1.715605, -0.6481028, 2.668785, 1, 0, 0.2627451, 1,
1.72038, -0.09349412, 1.673867, 1, 0, 0.2588235, 1,
1.744825, 0.8239132, 2.305952, 1, 0, 0.2509804, 1,
1.760437, -1.017286, 0.8643458, 1, 0, 0.2470588, 1,
1.769975, 0.03209125, 0.9847194, 1, 0, 0.2392157, 1,
1.782462, -0.3619197, 2.881127, 1, 0, 0.2352941, 1,
1.783691, -0.126986, 1.262921, 1, 0, 0.227451, 1,
1.818745, 1.344751, 1.752051, 1, 0, 0.2235294, 1,
1.824635, 0.2962722, 0.7389237, 1, 0, 0.2156863, 1,
1.836408, 1.632254, -0.09495141, 1, 0, 0.2117647, 1,
1.843241, 0.8369584, 0.4442537, 1, 0, 0.2039216, 1,
1.843704, -0.2838981, 1.976206, 1, 0, 0.1960784, 1,
1.854069, -1.515757, 0.3398917, 1, 0, 0.1921569, 1,
1.864841, -0.06519275, 1.746798, 1, 0, 0.1843137, 1,
1.891566, -1.552493, 0.4482031, 1, 0, 0.1803922, 1,
1.905095, -0.3230772, 3.510035, 1, 0, 0.172549, 1,
1.93253, 1.587535, 1.741418, 1, 0, 0.1686275, 1,
1.961705, 1.312674, 1.702209, 1, 0, 0.1607843, 1,
1.965101, -0.3789379, 2.064351, 1, 0, 0.1568628, 1,
1.986604, 0.2047193, 1.115349, 1, 0, 0.1490196, 1,
1.9892, 0.8082771, -0.8482389, 1, 0, 0.145098, 1,
1.99436, 1.807757, 0.72489, 1, 0, 0.1372549, 1,
2.020359, 0.01456877, 3.594732, 1, 0, 0.1333333, 1,
2.025649, -0.1343516, 2.077168, 1, 0, 0.1254902, 1,
2.032686, 0.6504299, -0.6326696, 1, 0, 0.1215686, 1,
2.041739, 1.933919, 1.215155, 1, 0, 0.1137255, 1,
2.070977, 0.8591539, 0.8007259, 1, 0, 0.1098039, 1,
2.090708, 0.708791, 0.8078045, 1, 0, 0.1019608, 1,
2.129738, -0.08218787, 1.951922, 1, 0, 0.09411765, 1,
2.236327, 0.08514241, 0.4394716, 1, 0, 0.09019608, 1,
2.248332, -1.292651, 1.646249, 1, 0, 0.08235294, 1,
2.28014, -0.4532059, 1.656386, 1, 0, 0.07843138, 1,
2.290555, -0.01465175, -0.140315, 1, 0, 0.07058824, 1,
2.347201, -1.191295, 1.154203, 1, 0, 0.06666667, 1,
2.355258, 1.443056, 1.192148, 1, 0, 0.05882353, 1,
2.404635, 0.534089, 0.383306, 1, 0, 0.05490196, 1,
2.436922, -0.4120469, -0.4587815, 1, 0, 0.04705882, 1,
2.47029, 0.5487256, 1.871054, 1, 0, 0.04313726, 1,
2.516098, 0.04826917, 0.653574, 1, 0, 0.03529412, 1,
2.558437, -0.7666807, 2.198475, 1, 0, 0.03137255, 1,
2.589763, -0.3897148, 2.269613, 1, 0, 0.02352941, 1,
2.728032, -0.6599421, 2.613154, 1, 0, 0.01960784, 1,
2.804336, 1.478277, 3.360264, 1, 0, 0.01176471, 1,
3.613731, 2.254859, 1.467122, 1, 0, 0.007843138, 1
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
0.430812, -4.382113, -6.447435, 0, -0.5, 0.5, 0.5,
0.430812, -4.382113, -6.447435, 1, -0.5, 0.5, 0.5,
0.430812, -4.382113, -6.447435, 1, 1.5, 0.5, 0.5,
0.430812, -4.382113, -6.447435, 0, 1.5, 0.5, 0.5
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
-3.831116, 0.03699803, -6.447435, 0, -0.5, 0.5, 0.5,
-3.831116, 0.03699803, -6.447435, 1, -0.5, 0.5, 0.5,
-3.831116, 0.03699803, -6.447435, 1, 1.5, 0.5, 0.5,
-3.831116, 0.03699803, -6.447435, 0, 1.5, 0.5, 0.5
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
-3.831116, -4.382113, 0.1528213, 0, -0.5, 0.5, 0.5,
-3.831116, -4.382113, 0.1528213, 1, -0.5, 0.5, 0.5,
-3.831116, -4.382113, 0.1528213, 1, 1.5, 0.5, 0.5,
-3.831116, -4.382113, 0.1528213, 0, 1.5, 0.5, 0.5
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
-2, -3.362318, -4.924299,
3, -3.362318, -4.924299,
-2, -3.362318, -4.924299,
-2, -3.532284, -5.178155,
-1, -3.362318, -4.924299,
-1, -3.532284, -5.178155,
0, -3.362318, -4.924299,
0, -3.532284, -5.178155,
1, -3.362318, -4.924299,
1, -3.532284, -5.178155,
2, -3.362318, -4.924299,
2, -3.532284, -5.178155,
3, -3.362318, -4.924299,
3, -3.532284, -5.178155
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
-2, -3.872215, -5.685867, 0, -0.5, 0.5, 0.5,
-2, -3.872215, -5.685867, 1, -0.5, 0.5, 0.5,
-2, -3.872215, -5.685867, 1, 1.5, 0.5, 0.5,
-2, -3.872215, -5.685867, 0, 1.5, 0.5, 0.5,
-1, -3.872215, -5.685867, 0, -0.5, 0.5, 0.5,
-1, -3.872215, -5.685867, 1, -0.5, 0.5, 0.5,
-1, -3.872215, -5.685867, 1, 1.5, 0.5, 0.5,
-1, -3.872215, -5.685867, 0, 1.5, 0.5, 0.5,
0, -3.872215, -5.685867, 0, -0.5, 0.5, 0.5,
0, -3.872215, -5.685867, 1, -0.5, 0.5, 0.5,
0, -3.872215, -5.685867, 1, 1.5, 0.5, 0.5,
0, -3.872215, -5.685867, 0, 1.5, 0.5, 0.5,
1, -3.872215, -5.685867, 0, -0.5, 0.5, 0.5,
1, -3.872215, -5.685867, 1, -0.5, 0.5, 0.5,
1, -3.872215, -5.685867, 1, 1.5, 0.5, 0.5,
1, -3.872215, -5.685867, 0, 1.5, 0.5, 0.5,
2, -3.872215, -5.685867, 0, -0.5, 0.5, 0.5,
2, -3.872215, -5.685867, 1, -0.5, 0.5, 0.5,
2, -3.872215, -5.685867, 1, 1.5, 0.5, 0.5,
2, -3.872215, -5.685867, 0, 1.5, 0.5, 0.5,
3, -3.872215, -5.685867, 0, -0.5, 0.5, 0.5,
3, -3.872215, -5.685867, 1, -0.5, 0.5, 0.5,
3, -3.872215, -5.685867, 1, 1.5, 0.5, 0.5,
3, -3.872215, -5.685867, 0, 1.5, 0.5, 0.5
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
-2.847594, -3, -4.924299,
-2.847594, 3, -4.924299,
-2.847594, -3, -4.924299,
-3.011514, -3, -5.178155,
-2.847594, -2, -4.924299,
-3.011514, -2, -5.178155,
-2.847594, -1, -4.924299,
-3.011514, -1, -5.178155,
-2.847594, 0, -4.924299,
-3.011514, 0, -5.178155,
-2.847594, 1, -4.924299,
-3.011514, 1, -5.178155,
-2.847594, 2, -4.924299,
-3.011514, 2, -5.178155,
-2.847594, 3, -4.924299,
-3.011514, 3, -5.178155
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
-3.339355, -3, -5.685867, 0, -0.5, 0.5, 0.5,
-3.339355, -3, -5.685867, 1, -0.5, 0.5, 0.5,
-3.339355, -3, -5.685867, 1, 1.5, 0.5, 0.5,
-3.339355, -3, -5.685867, 0, 1.5, 0.5, 0.5,
-3.339355, -2, -5.685867, 0, -0.5, 0.5, 0.5,
-3.339355, -2, -5.685867, 1, -0.5, 0.5, 0.5,
-3.339355, -2, -5.685867, 1, 1.5, 0.5, 0.5,
-3.339355, -2, -5.685867, 0, 1.5, 0.5, 0.5,
-3.339355, -1, -5.685867, 0, -0.5, 0.5, 0.5,
-3.339355, -1, -5.685867, 1, -0.5, 0.5, 0.5,
-3.339355, -1, -5.685867, 1, 1.5, 0.5, 0.5,
-3.339355, -1, -5.685867, 0, 1.5, 0.5, 0.5,
-3.339355, 0, -5.685867, 0, -0.5, 0.5, 0.5,
-3.339355, 0, -5.685867, 1, -0.5, 0.5, 0.5,
-3.339355, 0, -5.685867, 1, 1.5, 0.5, 0.5,
-3.339355, 0, -5.685867, 0, 1.5, 0.5, 0.5,
-3.339355, 1, -5.685867, 0, -0.5, 0.5, 0.5,
-3.339355, 1, -5.685867, 1, -0.5, 0.5, 0.5,
-3.339355, 1, -5.685867, 1, 1.5, 0.5, 0.5,
-3.339355, 1, -5.685867, 0, 1.5, 0.5, 0.5,
-3.339355, 2, -5.685867, 0, -0.5, 0.5, 0.5,
-3.339355, 2, -5.685867, 1, -0.5, 0.5, 0.5,
-3.339355, 2, -5.685867, 1, 1.5, 0.5, 0.5,
-3.339355, 2, -5.685867, 0, 1.5, 0.5, 0.5,
-3.339355, 3, -5.685867, 0, -0.5, 0.5, 0.5,
-3.339355, 3, -5.685867, 1, -0.5, 0.5, 0.5,
-3.339355, 3, -5.685867, 1, 1.5, 0.5, 0.5,
-3.339355, 3, -5.685867, 0, 1.5, 0.5, 0.5
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
-2.847594, -3.362318, -4,
-2.847594, -3.362318, 4,
-2.847594, -3.362318, -4,
-3.011514, -3.532284, -4,
-2.847594, -3.362318, -2,
-3.011514, -3.532284, -2,
-2.847594, -3.362318, 0,
-3.011514, -3.532284, 0,
-2.847594, -3.362318, 2,
-3.011514, -3.532284, 2,
-2.847594, -3.362318, 4,
-3.011514, -3.532284, 4
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
-3.339355, -3.872215, -4, 0, -0.5, 0.5, 0.5,
-3.339355, -3.872215, -4, 1, -0.5, 0.5, 0.5,
-3.339355, -3.872215, -4, 1, 1.5, 0.5, 0.5,
-3.339355, -3.872215, -4, 0, 1.5, 0.5, 0.5,
-3.339355, -3.872215, -2, 0, -0.5, 0.5, 0.5,
-3.339355, -3.872215, -2, 1, -0.5, 0.5, 0.5,
-3.339355, -3.872215, -2, 1, 1.5, 0.5, 0.5,
-3.339355, -3.872215, -2, 0, 1.5, 0.5, 0.5,
-3.339355, -3.872215, 0, 0, -0.5, 0.5, 0.5,
-3.339355, -3.872215, 0, 1, -0.5, 0.5, 0.5,
-3.339355, -3.872215, 0, 1, 1.5, 0.5, 0.5,
-3.339355, -3.872215, 0, 0, 1.5, 0.5, 0.5,
-3.339355, -3.872215, 2, 0, -0.5, 0.5, 0.5,
-3.339355, -3.872215, 2, 1, -0.5, 0.5, 0.5,
-3.339355, -3.872215, 2, 1, 1.5, 0.5, 0.5,
-3.339355, -3.872215, 2, 0, 1.5, 0.5, 0.5,
-3.339355, -3.872215, 4, 0, -0.5, 0.5, 0.5,
-3.339355, -3.872215, 4, 1, -0.5, 0.5, 0.5,
-3.339355, -3.872215, 4, 1, 1.5, 0.5, 0.5,
-3.339355, -3.872215, 4, 0, 1.5, 0.5, 0.5
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
-2.847594, -3.362318, -4.924299,
-2.847594, 3.436314, -4.924299,
-2.847594, -3.362318, 5.229941,
-2.847594, 3.436314, 5.229941,
-2.847594, -3.362318, -4.924299,
-2.847594, -3.362318, 5.229941,
-2.847594, 3.436314, -4.924299,
-2.847594, 3.436314, 5.229941,
-2.847594, -3.362318, -4.924299,
3.709218, -3.362318, -4.924299,
-2.847594, -3.362318, 5.229941,
3.709218, -3.362318, 5.229941,
-2.847594, 3.436314, -4.924299,
3.709218, 3.436314, -4.924299,
-2.847594, 3.436314, 5.229941,
3.709218, 3.436314, 5.229941,
3.709218, -3.362318, -4.924299,
3.709218, 3.436314, -4.924299,
3.709218, -3.362318, 5.229941,
3.709218, 3.436314, 5.229941,
3.709218, -3.362318, -4.924299,
3.709218, -3.362318, 5.229941,
3.709218, 3.436314, -4.924299,
3.709218, 3.436314, 5.229941
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
var radius = 7.40525;
var distance = 32.94679;
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
mvMatrix.translate( -0.430812, -0.03699803, -0.1528213 );
mvMatrix.scale( 1.221127, 1.177693, 0.7885081 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.94679);
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
Benzanilide<-read.table("Benzanilide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Benzanilide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Benzanilide' not found
```

```r
y<-Benzanilide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Benzanilide' not found
```

```r
z<-Benzanilide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Benzanilide' not found
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
-2.752107, -2.274674, -2.36947, 0, 0, 1, 1, 1,
-2.615122, 0.7063028, -1.839223, 1, 0, 0, 1, 1,
-2.614826, 0.2551279, -1.827263, 1, 0, 0, 1, 1,
-2.605853, 0.4809242, -0.1080566, 1, 0, 0, 1, 1,
-2.539371, 1.148416, -2.340015, 1, 0, 0, 1, 1,
-2.397381, -0.8759646, -4.258821, 1, 0, 0, 1, 1,
-2.390078, -1.403282, -2.73082, 0, 0, 0, 1, 1,
-2.352401, 0.8815902, -1.224956, 0, 0, 0, 1, 1,
-2.314098, 2.227448, -1.232302, 0, 0, 0, 1, 1,
-2.314049, -1.506667, -2.289696, 0, 0, 0, 1, 1,
-2.310763, 1.339981, -2.249932, 0, 0, 0, 1, 1,
-2.276065, -0.2058999, -1.610467, 0, 0, 0, 1, 1,
-2.2105, 1.052987, -0.4627879, 0, 0, 0, 1, 1,
-2.203084, -0.5217517, -3.417697, 1, 1, 1, 1, 1,
-2.169107, 0.1652589, 0.971476, 1, 1, 1, 1, 1,
-2.160566, -1.491824, -1.265352, 1, 1, 1, 1, 1,
-2.153202, -1.271973, -1.430876, 1, 1, 1, 1, 1,
-2.146786, -2.538652, -3.997312, 1, 1, 1, 1, 1,
-2.146554, -0.1610609, -1.547605, 1, 1, 1, 1, 1,
-2.14169, 0.8349596, -1.84538, 1, 1, 1, 1, 1,
-2.12379, 0.7417843, -0.8440166, 1, 1, 1, 1, 1,
-2.099518, -0.0882687, -0.9514801, 1, 1, 1, 1, 1,
-2.088143, 1.017797, -2.822605, 1, 1, 1, 1, 1,
-2.084168, 1.145694, 1.497578, 1, 1, 1, 1, 1,
-2.032935, -1.450555, -2.046458, 1, 1, 1, 1, 1,
-2.031326, 2.041131, -1.691246, 1, 1, 1, 1, 1,
-2.007598, 0.7128775, -1.072135, 1, 1, 1, 1, 1,
-2.000023, -0.3443011, -2.553411, 1, 1, 1, 1, 1,
-1.965359, -1.14188, -2.089378, 0, 0, 1, 1, 1,
-1.963721, 0.8994918, -2.505469, 1, 0, 0, 1, 1,
-1.95351, 0.2972732, -0.5068104, 1, 0, 0, 1, 1,
-1.947175, -1.145591, -2.715371, 1, 0, 0, 1, 1,
-1.941446, 0.5731931, -0.5129676, 1, 0, 0, 1, 1,
-1.936012, -0.3812908, -2.937196, 1, 0, 0, 1, 1,
-1.920609, 0.6341993, -1.016783, 0, 0, 0, 1, 1,
-1.882931, -0.419009, -2.989929, 0, 0, 0, 1, 1,
-1.856394, -0.279977, -1.710069, 0, 0, 0, 1, 1,
-1.856017, 1.932088, -1.704038, 0, 0, 0, 1, 1,
-1.820576, 0.6859201, -0.2158404, 0, 0, 0, 1, 1,
-1.805349, -0.476604, -0.9249202, 0, 0, 0, 1, 1,
-1.793308, -2.147366, -2.417915, 0, 0, 0, 1, 1,
-1.78665, -0.6992749, -2.479204, 1, 1, 1, 1, 1,
-1.779994, 1.26549, -1.275771, 1, 1, 1, 1, 1,
-1.774282, 1.119018, -0.07129982, 1, 1, 1, 1, 1,
-1.76299, -0.9295715, -0.9876569, 1, 1, 1, 1, 1,
-1.745098, -0.341205, -1.547428, 1, 1, 1, 1, 1,
-1.726039, 0.5326756, -0.4210433, 1, 1, 1, 1, 1,
-1.720515, -0.06677482, -1.159794, 1, 1, 1, 1, 1,
-1.6941, 0.2362887, -1.582249, 1, 1, 1, 1, 1,
-1.691007, 0.4751277, -1.74086, 1, 1, 1, 1, 1,
-1.662999, 0.8844719, 0.7950074, 1, 1, 1, 1, 1,
-1.662922, 0.1676925, -2.520327, 1, 1, 1, 1, 1,
-1.655379, -1.866074, -2.786701, 1, 1, 1, 1, 1,
-1.633451, 0.07756493, -2.822779, 1, 1, 1, 1, 1,
-1.623058, -1.116415, -1.753176, 1, 1, 1, 1, 1,
-1.595879, 0.007639255, -1.665165, 1, 1, 1, 1, 1,
-1.588107, -0.0003802, -2.352266, 0, 0, 1, 1, 1,
-1.587596, -1.747977, -0.01577467, 1, 0, 0, 1, 1,
-1.543811, -1.050537, -0.8056534, 1, 0, 0, 1, 1,
-1.541552, 0.5632197, -0.8292724, 1, 0, 0, 1, 1,
-1.539302, 1.363593, -1.146461, 1, 0, 0, 1, 1,
-1.539118, 0.4589533, -0.5859205, 1, 0, 0, 1, 1,
-1.532225, -0.6603179, -4.282459, 0, 0, 0, 1, 1,
-1.53087, -0.9353896, -2.46718, 0, 0, 0, 1, 1,
-1.529935, -0.2764176, 0.3950511, 0, 0, 0, 1, 1,
-1.529359, 1.0022, -1.431357, 0, 0, 0, 1, 1,
-1.524698, -0.5577235, -2.28835, 0, 0, 0, 1, 1,
-1.517438, -0.8179176, -1.540616, 0, 0, 0, 1, 1,
-1.505443, -1.316942, -2.779076, 0, 0, 0, 1, 1,
-1.497751, -0.5367041, -3.525777, 1, 1, 1, 1, 1,
-1.495397, -1.075453, -1.719987, 1, 1, 1, 1, 1,
-1.494805, 1.261623, -1.779294, 1, 1, 1, 1, 1,
-1.492136, 0.4618544, -0.8113599, 1, 1, 1, 1, 1,
-1.486177, 0.6598349, -2.108417, 1, 1, 1, 1, 1,
-1.480811, -1.465724, -1.598676, 1, 1, 1, 1, 1,
-1.465413, 0.2215846, -0.196143, 1, 1, 1, 1, 1,
-1.463354, 0.2116755, -1.887813, 1, 1, 1, 1, 1,
-1.457419, 0.3973873, -1.717882, 1, 1, 1, 1, 1,
-1.450774, -1.239563, -1.268239, 1, 1, 1, 1, 1,
-1.441705, 0.4637139, -2.995595, 1, 1, 1, 1, 1,
-1.440935, 1.075232, -1.214999, 1, 1, 1, 1, 1,
-1.440126, 0.2188773, 0.966513, 1, 1, 1, 1, 1,
-1.436982, 0.3851322, -0.8126211, 1, 1, 1, 1, 1,
-1.436973, 0.3643302, -2.553333, 1, 1, 1, 1, 1,
-1.424487, 1.788039, -1.570188, 0, 0, 1, 1, 1,
-1.422169, 1.825451, -1.004721, 1, 0, 0, 1, 1,
-1.405969, 0.2803662, -1.111958, 1, 0, 0, 1, 1,
-1.390275, 0.1874814, -1.363196, 1, 0, 0, 1, 1,
-1.387453, 0.6595523, -1.391812, 1, 0, 0, 1, 1,
-1.386202, -1.331128, -2.38243, 1, 0, 0, 1, 1,
-1.371347, 1.68268, -0.1439831, 0, 0, 0, 1, 1,
-1.368191, -0.1719087, -2.274059, 0, 0, 0, 1, 1,
-1.358408, -0.3271783, -0.6989354, 0, 0, 0, 1, 1,
-1.345636, 0.8108854, -0.2045584, 0, 0, 0, 1, 1,
-1.341411, -0.9863729, -0.9516068, 0, 0, 0, 1, 1,
-1.330496, 2.041519, 1.020641, 0, 0, 0, 1, 1,
-1.329107, -2.116052, -1.123181, 0, 0, 0, 1, 1,
-1.303664, 0.7072242, -1.624171, 1, 1, 1, 1, 1,
-1.302112, -1.536125, -3.043033, 1, 1, 1, 1, 1,
-1.29655, 0.249204, -3.023013, 1, 1, 1, 1, 1,
-1.286486, 1.036313, -0.7013434, 1, 1, 1, 1, 1,
-1.283484, 0.8005468, -0.728952, 1, 1, 1, 1, 1,
-1.272507, 1.917338, -2.365167, 1, 1, 1, 1, 1,
-1.271191, -0.4577042, -2.309615, 1, 1, 1, 1, 1,
-1.263777, -0.1342512, -3.215868, 1, 1, 1, 1, 1,
-1.257996, -0.2605515, -1.73222, 1, 1, 1, 1, 1,
-1.251174, -0.5226401, -2.538624, 1, 1, 1, 1, 1,
-1.237122, -0.4132298, -2.558247, 1, 1, 1, 1, 1,
-1.236239, 0.9555267, 0.08106057, 1, 1, 1, 1, 1,
-1.228987, -0.3591554, 0.4211375, 1, 1, 1, 1, 1,
-1.227063, -0.6692083, -1.653741, 1, 1, 1, 1, 1,
-1.222012, -0.100025, -3.377231, 1, 1, 1, 1, 1,
-1.221075, 0.8543699, 0.9664375, 0, 0, 1, 1, 1,
-1.220329, 1.169784, -0.8478057, 1, 0, 0, 1, 1,
-1.216817, -2.407778, -2.951521, 1, 0, 0, 1, 1,
-1.206705, 0.08875412, -2.097366, 1, 0, 0, 1, 1,
-1.201877, 1.195923, 0.5276939, 1, 0, 0, 1, 1,
-1.200823, -1.36436, -1.750663, 1, 0, 0, 1, 1,
-1.178782, -1.280038, -2.023022, 0, 0, 0, 1, 1,
-1.165625, 1.519696, -0.4739724, 0, 0, 0, 1, 1,
-1.155109, -0.2598391, -1.636081, 0, 0, 0, 1, 1,
-1.153979, 0.378179, -1.599646, 0, 0, 0, 1, 1,
-1.150167, -2.196097, -3.493663, 0, 0, 0, 1, 1,
-1.149215, -1.930381, -0.5800728, 0, 0, 0, 1, 1,
-1.147301, 0.8940873, 0.9393463, 0, 0, 0, 1, 1,
-1.137486, 0.160279, -3.311797, 1, 1, 1, 1, 1,
-1.137259, 1.556051, 0.02126789, 1, 1, 1, 1, 1,
-1.136014, -0.2024369, -2.31133, 1, 1, 1, 1, 1,
-1.130325, 0.640197, -1.542627, 1, 1, 1, 1, 1,
-1.12958, 0.1337661, -2.850855, 1, 1, 1, 1, 1,
-1.129548, -0.2511767, -3.061721, 1, 1, 1, 1, 1,
-1.129539, -0.6784295, -3.0147, 1, 1, 1, 1, 1,
-1.127601, 0.1817439, 0.06740446, 1, 1, 1, 1, 1,
-1.117696, 1.032756, -0.7155688, 1, 1, 1, 1, 1,
-1.115434, -1.152288, -3.546968, 1, 1, 1, 1, 1,
-1.114299, 1.975607, -0.1515992, 1, 1, 1, 1, 1,
-1.111802, 0.1855374, -1.727537, 1, 1, 1, 1, 1,
-1.104487, 1.568504, -0.01407158, 1, 1, 1, 1, 1,
-1.102743, 1.443955, 0.2900134, 1, 1, 1, 1, 1,
-1.095476, 0.04676444, -1.323893, 1, 1, 1, 1, 1,
-1.088417, -2.399533, -2.979929, 0, 0, 1, 1, 1,
-1.087731, -2.126682, -2.543951, 1, 0, 0, 1, 1,
-1.083767, 0.08227235, -1.557668, 1, 0, 0, 1, 1,
-1.080923, -0.3136736, 0.00169674, 1, 0, 0, 1, 1,
-1.07887, 1.173007, -1.622405, 1, 0, 0, 1, 1,
-1.078484, -1.420984, -1.277404, 1, 0, 0, 1, 1,
-1.077428, -0.8207735, -0.1970425, 0, 0, 0, 1, 1,
-1.074759, -0.8447937, -0.9727086, 0, 0, 0, 1, 1,
-1.074363, -0.2270504, -2.404218, 0, 0, 0, 1, 1,
-1.074342, 0.006686681, -1.099445, 0, 0, 0, 1, 1,
-1.072856, 0.9516772, -2.070925, 0, 0, 0, 1, 1,
-1.06633, -0.07495339, -1.672796, 0, 0, 0, 1, 1,
-1.064175, -0.4462416, -1.497591, 0, 0, 0, 1, 1,
-1.057703, -2.489199, -3.290379, 1, 1, 1, 1, 1,
-1.05684, -0.006632459, -0.5582997, 1, 1, 1, 1, 1,
-1.048004, 1.861346, -1.060375, 1, 1, 1, 1, 1,
-1.04385, -0.4423116, -3.627484, 1, 1, 1, 1, 1,
-1.042149, -1.817012, -3.532284, 1, 1, 1, 1, 1,
-1.039793, -1.757831, -3.930163, 1, 1, 1, 1, 1,
-1.035775, 0.1243983, -1.192156, 1, 1, 1, 1, 1,
-1.03323, 3.337305, 0.434818, 1, 1, 1, 1, 1,
-1.031434, 1.152071, -3.47989, 1, 1, 1, 1, 1,
-1.031384, 0.2576488, -3.518836, 1, 1, 1, 1, 1,
-1.024162, 1.502179, 0.2017715, 1, 1, 1, 1, 1,
-1.02355, 1.514342, -0.1977637, 1, 1, 1, 1, 1,
-1.02044, -0.6375122, -2.6321, 1, 1, 1, 1, 1,
-1.014439, 0.1406042, -2.087249, 1, 1, 1, 1, 1,
-1.012375, -0.6713862, -3.599381, 1, 1, 1, 1, 1,
-1.011291, 0.4889501, -1.025342, 0, 0, 1, 1, 1,
-1.010459, -0.6496661, -2.534033, 1, 0, 0, 1, 1,
-0.9965985, -0.336581, -0.8170878, 1, 0, 0, 1, 1,
-0.9833283, 1.075862, -0.09579761, 1, 0, 0, 1, 1,
-0.9824678, -0.1603232, -0.3026368, 1, 0, 0, 1, 1,
-0.9823351, -0.006572407, -1.254576, 1, 0, 0, 1, 1,
-0.9691527, 0.9981357, -1.264992, 0, 0, 0, 1, 1,
-0.9652585, -0.6817002, -3.589105, 0, 0, 0, 1, 1,
-0.963711, -1.764108, -2.873878, 0, 0, 0, 1, 1,
-0.9614596, -2.46814, -2.843575, 0, 0, 0, 1, 1,
-0.9569983, 0.9718705, -0.5959709, 0, 0, 0, 1, 1,
-0.9550396, -0.3653197, -1.875145, 0, 0, 0, 1, 1,
-0.9529379, 0.5004733, -0.5366228, 0, 0, 0, 1, 1,
-0.9500818, -0.9617946, -1.980449, 1, 1, 1, 1, 1,
-0.9500209, -0.9529124, -2.906013, 1, 1, 1, 1, 1,
-0.9380375, 0.9651666, -0.3238913, 1, 1, 1, 1, 1,
-0.9377694, 0.6044629, -1.91267, 1, 1, 1, 1, 1,
-0.9363317, -2.026154, -2.426581, 1, 1, 1, 1, 1,
-0.9320117, -0.7648848, -2.993452, 1, 1, 1, 1, 1,
-0.9279724, -1.057263, -3.788749, 1, 1, 1, 1, 1,
-0.9248264, 0.8780709, -1.234433, 1, 1, 1, 1, 1,
-0.9207786, -1.331584, -1.496135, 1, 1, 1, 1, 1,
-0.9142423, -1.883242, -1.738667, 1, 1, 1, 1, 1,
-0.9136165, -1.033582, -2.65667, 1, 1, 1, 1, 1,
-0.9065642, 0.4915971, -0.03480101, 1, 1, 1, 1, 1,
-0.8951936, -1.068734, -3.17661, 1, 1, 1, 1, 1,
-0.8946522, 0.2868652, -1.713767, 1, 1, 1, 1, 1,
-0.8933698, -0.7096437, -2.237207, 1, 1, 1, 1, 1,
-0.8915185, -0.6839685, -1.998659, 0, 0, 1, 1, 1,
-0.8852362, -0.3275647, -0.8495929, 1, 0, 0, 1, 1,
-0.882725, -0.5570157, -1.342194, 1, 0, 0, 1, 1,
-0.8772673, 0.4999568, -1.660316, 1, 0, 0, 1, 1,
-0.8767157, 0.7886373, -0.6135956, 1, 0, 0, 1, 1,
-0.875751, 1.825131, -0.4122967, 1, 0, 0, 1, 1,
-0.8698074, 1.09736, -1.576763, 0, 0, 0, 1, 1,
-0.859233, -0.6877006, -2.416703, 0, 0, 0, 1, 1,
-0.8553762, -1.21201, -2.48221, 0, 0, 0, 1, 1,
-0.85295, 0.02018694, -1.006737, 0, 0, 0, 1, 1,
-0.8489205, 0.454728, -1.094627, 0, 0, 0, 1, 1,
-0.8470526, -0.7456571, -2.045461, 0, 0, 0, 1, 1,
-0.8455644, 2.3767, -1.936725, 0, 0, 0, 1, 1,
-0.8448625, 0.7821287, -0.04609347, 1, 1, 1, 1, 1,
-0.8427392, -0.5721584, -1.658139, 1, 1, 1, 1, 1,
-0.8335773, 1.397137, 0.2392826, 1, 1, 1, 1, 1,
-0.8333676, 0.7977609, -2.241972, 1, 1, 1, 1, 1,
-0.8325584, -0.4276721, -0.9174711, 1, 1, 1, 1, 1,
-0.8234412, -0.3583274, -1.634382, 1, 1, 1, 1, 1,
-0.8192332, -1.039064, -1.635774, 1, 1, 1, 1, 1,
-0.8188694, -0.3725424, -2.488461, 1, 1, 1, 1, 1,
-0.8132044, 0.2268309, -1.260653, 1, 1, 1, 1, 1,
-0.8069457, 1.539894, -0.6581433, 1, 1, 1, 1, 1,
-0.7977867, 2.154233, 1.022919, 1, 1, 1, 1, 1,
-0.7907652, -0.0334754, -0.0914977, 1, 1, 1, 1, 1,
-0.7831826, 0.7797358, -0.7068862, 1, 1, 1, 1, 1,
-0.7808431, 0.01437919, -2.233223, 1, 1, 1, 1, 1,
-0.7802876, 1.571892, -0.3550277, 1, 1, 1, 1, 1,
-0.7797796, -0.6408265, -2.295754, 0, 0, 1, 1, 1,
-0.774235, -0.323392, -2.706695, 1, 0, 0, 1, 1,
-0.7741172, -1.216015, -1.513497, 1, 0, 0, 1, 1,
-0.7728527, 0.1265287, -1.668302, 1, 0, 0, 1, 1,
-0.7725267, -0.2773438, -0.07870751, 1, 0, 0, 1, 1,
-0.7701831, -0.304108, -1.69345, 1, 0, 0, 1, 1,
-0.7647943, -0.9937663, -1.752759, 0, 0, 0, 1, 1,
-0.764615, 1.410579, -1.009457, 0, 0, 0, 1, 1,
-0.7632042, 0.5876024, -0.9083102, 0, 0, 0, 1, 1,
-0.7582707, 0.8262137, -0.9936044, 0, 0, 0, 1, 1,
-0.7529883, -0.3323049, -1.662998, 0, 0, 0, 1, 1,
-0.7463662, -1.332298, -3.466976, 0, 0, 0, 1, 1,
-0.7453021, -1.741359, -3.010343, 0, 0, 0, 1, 1,
-0.7437508, -1.977961, -3.716343, 1, 1, 1, 1, 1,
-0.7410006, 0.3434297, -0.5558165, 1, 1, 1, 1, 1,
-0.7406698, -2.236754, -3.423501, 1, 1, 1, 1, 1,
-0.7393658, -0.1482639, -2.27858, 1, 1, 1, 1, 1,
-0.7362906, -0.8351709, -3.935409, 1, 1, 1, 1, 1,
-0.736186, -0.9048764, -3.10878, 1, 1, 1, 1, 1,
-0.7352973, -0.38361, -2.238036, 1, 1, 1, 1, 1,
-0.734515, -0.4491906, -3.049152, 1, 1, 1, 1, 1,
-0.7315181, -0.650849, -2.116036, 1, 1, 1, 1, 1,
-0.7283913, -0.4064743, -2.219993, 1, 1, 1, 1, 1,
-0.7256986, 0.1368505, -2.389652, 1, 1, 1, 1, 1,
-0.7123592, -0.2895433, -0.8539756, 1, 1, 1, 1, 1,
-0.7109308, 1.295915, -0.1345589, 1, 1, 1, 1, 1,
-0.7070195, 1.276546, 0.5604587, 1, 1, 1, 1, 1,
-0.7030098, -1.138119, -2.683594, 1, 1, 1, 1, 1,
-0.7028219, -0.03347808, -2.183366, 0, 0, 1, 1, 1,
-0.7004226, -0.4058779, -0.00513766, 1, 0, 0, 1, 1,
-0.6994314, -0.1158349, -2.371568, 1, 0, 0, 1, 1,
-0.6970314, -0.6613792, -1.570747, 1, 0, 0, 1, 1,
-0.6930097, -1.077308, -2.422737, 1, 0, 0, 1, 1,
-0.6895633, -0.8440636, -2.173759, 1, 0, 0, 1, 1,
-0.6815696, -2.184128, -2.121283, 0, 0, 0, 1, 1,
-0.6780253, 0.3292724, -0.7058378, 0, 0, 0, 1, 1,
-0.6736764, -0.08941545, -2.117169, 0, 0, 0, 1, 1,
-0.6735125, -0.6036482, -1.432004, 0, 0, 0, 1, 1,
-0.6720343, 0.9364656, -1.20715, 0, 0, 0, 1, 1,
-0.6651281, 0.2746728, -2.668577, 0, 0, 0, 1, 1,
-0.6615759, -2.276706, -2.872284, 0, 0, 0, 1, 1,
-0.6559086, 0.9059312, -1.459802, 1, 1, 1, 1, 1,
-0.6524693, -0.4681811, -3.051952, 1, 1, 1, 1, 1,
-0.6510425, -0.3149182, -2.850535, 1, 1, 1, 1, 1,
-0.6508956, 0.9278724, -1.998626, 1, 1, 1, 1, 1,
-0.6485941, 1.387004, 1.998541, 1, 1, 1, 1, 1,
-0.6400088, -1.145802, -2.067587, 1, 1, 1, 1, 1,
-0.6313552, 0.2469465, 0.0008227099, 1, 1, 1, 1, 1,
-0.6287874, 0.7513933, 0.1855051, 1, 1, 1, 1, 1,
-0.6252499, -1.61401, -4.120013, 1, 1, 1, 1, 1,
-0.6248835, -0.1294932, -2.540332, 1, 1, 1, 1, 1,
-0.6196892, 0.5927985, -3.126155, 1, 1, 1, 1, 1,
-0.6192175, -0.6184544, -2.931613, 1, 1, 1, 1, 1,
-0.6182492, -0.933495, -2.897804, 1, 1, 1, 1, 1,
-0.6147875, -0.4143415, -3.841208, 1, 1, 1, 1, 1,
-0.6142905, 0.2506188, -2.298413, 1, 1, 1, 1, 1,
-0.6125407, -0.5459419, -2.177307, 0, 0, 1, 1, 1,
-0.6074358, -0.8939539, -0.5486641, 1, 0, 0, 1, 1,
-0.6063206, -0.5306349, -1.754438, 1, 0, 0, 1, 1,
-0.6053614, -0.1981579, -1.869144, 1, 0, 0, 1, 1,
-0.6042001, 1.517663, -0.7405041, 1, 0, 0, 1, 1,
-0.6009209, 1.513427, -0.7791963, 1, 0, 0, 1, 1,
-0.6003143, -0.01277338, -2.559575, 0, 0, 0, 1, 1,
-0.5995712, 0.6177006, -0.9452466, 0, 0, 0, 1, 1,
-0.5989564, 1.031212, -1.366955, 0, 0, 0, 1, 1,
-0.5963362, -0.5125554, -3.318428, 0, 0, 0, 1, 1,
-0.592245, -0.4393984, -1.90967, 0, 0, 0, 1, 1,
-0.5875451, 0.2798271, -2.42117, 0, 0, 0, 1, 1,
-0.5869706, -0.2885281, -1.132535, 0, 0, 0, 1, 1,
-0.5828594, 0.4364522, -0.4918977, 1, 1, 1, 1, 1,
-0.5815986, 1.987355, -1.983353, 1, 1, 1, 1, 1,
-0.580609, 0.5564151, -0.4279537, 1, 1, 1, 1, 1,
-0.5787657, 0.06001524, -0.3027321, 1, 1, 1, 1, 1,
-0.5784627, 1.482183, -0.4299273, 1, 1, 1, 1, 1,
-0.5773694, 1.275802, -0.7176336, 1, 1, 1, 1, 1,
-0.5755926, -0.4530396, -2.964923, 1, 1, 1, 1, 1,
-0.5733085, -1.345307, -2.669391, 1, 1, 1, 1, 1,
-0.5731197, -0.3086347, -2.151274, 1, 1, 1, 1, 1,
-0.5712517, 1.275725, -0.3222965, 1, 1, 1, 1, 1,
-0.5710741, -0.03030886, -1.489661, 1, 1, 1, 1, 1,
-0.5662833, -0.4940309, -0.7113125, 1, 1, 1, 1, 1,
-0.5641654, 0.5623598, -0.1536101, 1, 1, 1, 1, 1,
-0.5628243, 0.2467808, -1.096287, 1, 1, 1, 1, 1,
-0.5533158, 0.4153906, 0.05326495, 1, 1, 1, 1, 1,
-0.5486702, 1.745073, -0.2568004, 0, 0, 1, 1, 1,
-0.5458739, 1.51562, -0.8999965, 1, 0, 0, 1, 1,
-0.5450627, -1.037784, -1.769825, 1, 0, 0, 1, 1,
-0.5445819, -0.2203985, -2.53424, 1, 0, 0, 1, 1,
-0.5402724, 0.4238696, 0.1117319, 1, 0, 0, 1, 1,
-0.5349547, -1.569241, -2.361115, 1, 0, 0, 1, 1,
-0.5322589, -0.6666178, -3.444397, 0, 0, 0, 1, 1,
-0.5263783, 0.01064669, -2.334193, 0, 0, 0, 1, 1,
-0.5223227, -0.01548035, -1.867358, 0, 0, 0, 1, 1,
-0.5185037, -0.6988934, -1.820838, 0, 0, 0, 1, 1,
-0.5184314, -1.352746, -4.567191, 0, 0, 0, 1, 1,
-0.5151198, 0.1341335, -1.97422, 0, 0, 0, 1, 1,
-0.5146086, -1.055007, -2.444801, 0, 0, 0, 1, 1,
-0.5134726, -2.407392, -3.345672, 1, 1, 1, 1, 1,
-0.5126531, -0.7387623, -2.527497, 1, 1, 1, 1, 1,
-0.5062631, -0.6821269, -1.872042, 1, 1, 1, 1, 1,
-0.500693, 0.2813094, -1.911249, 1, 1, 1, 1, 1,
-0.4978935, -0.3030799, -1.844804, 1, 1, 1, 1, 1,
-0.4974616, 0.8957195, 0.9948118, 1, 1, 1, 1, 1,
-0.493928, 1.454471, -1.32968, 1, 1, 1, 1, 1,
-0.4932038, 0.4963264, -0.2715526, 1, 1, 1, 1, 1,
-0.4918641, -0.56442, -1.507145, 1, 1, 1, 1, 1,
-0.4908777, 0.1401977, -1.948145, 1, 1, 1, 1, 1,
-0.4904944, 0.1898026, -1.376706, 1, 1, 1, 1, 1,
-0.4877026, -0.2243992, -0.3900851, 1, 1, 1, 1, 1,
-0.4858643, 0.0252672, -0.8739433, 1, 1, 1, 1, 1,
-0.4849344, -0.1867892, -2.63353, 1, 1, 1, 1, 1,
-0.4840703, -0.2214342, -0.2499727, 1, 1, 1, 1, 1,
-0.4811607, 0.6094664, -1.475717, 0, 0, 1, 1, 1,
-0.4776359, -0.04243072, -1.563248, 1, 0, 0, 1, 1,
-0.4758002, 1.571287, -0.3818313, 1, 0, 0, 1, 1,
-0.4664949, 0.6978932, -1.236257, 1, 0, 0, 1, 1,
-0.4651131, 0.3856336, -1.118272, 1, 0, 0, 1, 1,
-0.4626635, -2.112146, -2.538131, 1, 0, 0, 1, 1,
-0.4554269, 0.5761234, -0.8265696, 0, 0, 0, 1, 1,
-0.4526386, -0.05103473, -2.598275, 0, 0, 0, 1, 1,
-0.4525605, -0.4070015, -3.302526, 0, 0, 0, 1, 1,
-0.45147, -0.8175277, -3.205519, 0, 0, 0, 1, 1,
-0.448943, 0.3032683, -1.192095, 0, 0, 0, 1, 1,
-0.4451065, -0.0370329, -0.6611075, 0, 0, 0, 1, 1,
-0.441046, 0.9970198, -1.974491, 0, 0, 0, 1, 1,
-0.4407416, -0.09234191, -1.440503, 1, 1, 1, 1, 1,
-0.4375353, -0.5592648, -2.324202, 1, 1, 1, 1, 1,
-0.4363408, -1.079889, -2.309425, 1, 1, 1, 1, 1,
-0.4356005, -0.676804, -2.001095, 1, 1, 1, 1, 1,
-0.4348402, 0.7443209, -0.9916072, 1, 1, 1, 1, 1,
-0.4347611, -0.3208002, -3.346667, 1, 1, 1, 1, 1,
-0.4335385, 1.018735, -0.9488186, 1, 1, 1, 1, 1,
-0.4281538, -0.007095142, -3.328309, 1, 1, 1, 1, 1,
-0.4264163, -0.1217128, -1.466926, 1, 1, 1, 1, 1,
-0.4213222, 0.03970983, -3.626319, 1, 1, 1, 1, 1,
-0.420197, -1.475149, -4.659282, 1, 1, 1, 1, 1,
-0.4176441, -1.596016, -2.926023, 1, 1, 1, 1, 1,
-0.4124209, 0.9364173, -2.2062, 1, 1, 1, 1, 1,
-0.41019, -1.665772, -4.24638, 1, 1, 1, 1, 1,
-0.4097898, -0.2280701, -2.258866, 1, 1, 1, 1, 1,
-0.4071403, -1.483429, -2.166896, 0, 0, 1, 1, 1,
-0.4046553, -0.9017527, -3.941222, 1, 0, 0, 1, 1,
-0.4001704, 1.095336, -0.1881009, 1, 0, 0, 1, 1,
-0.3949073, 1.323386, -1.433342, 1, 0, 0, 1, 1,
-0.3945858, 0.2714436, 1.286581, 1, 0, 0, 1, 1,
-0.3924102, -1.825168, -1.646515, 1, 0, 0, 1, 1,
-0.3877651, 0.4878814, -0.6261174, 0, 0, 0, 1, 1,
-0.3825705, 0.05761346, -2.34604, 0, 0, 0, 1, 1,
-0.3813882, -0.9671242, -3.443798, 0, 0, 0, 1, 1,
-0.3812217, -0.01663708, -1.314622, 0, 0, 0, 1, 1,
-0.3780836, 0.9268844, -0.8088471, 0, 0, 0, 1, 1,
-0.3776169, -2.373608, -3.53244, 0, 0, 0, 1, 1,
-0.3750929, -0.4903851, -3.682193, 0, 0, 0, 1, 1,
-0.369713, 0.1975068, -1.967006, 1, 1, 1, 1, 1,
-0.3676705, 0.1814259, -3.152308, 1, 1, 1, 1, 1,
-0.3622553, -0.6940542, -2.172699, 1, 1, 1, 1, 1,
-0.3599581, -1.32804, -2.581175, 1, 1, 1, 1, 1,
-0.3590541, 0.9907063, -2.966497, 1, 1, 1, 1, 1,
-0.3590326, 0.941395, -0.1857941, 1, 1, 1, 1, 1,
-0.3575918, -0.6123571, -2.253639, 1, 1, 1, 1, 1,
-0.3488288, -0.6901624, -3.414696, 1, 1, 1, 1, 1,
-0.3484729, 0.02640769, 0.1288325, 1, 1, 1, 1, 1,
-0.3416779, -0.5384524, -3.625377, 1, 1, 1, 1, 1,
-0.3402958, 0.5088311, 0.3319735, 1, 1, 1, 1, 1,
-0.3400025, 0.7761487, 0.546452, 1, 1, 1, 1, 1,
-0.3380174, -0.3099494, -1.373591, 1, 1, 1, 1, 1,
-0.3356951, -0.08916461, -2.318155, 1, 1, 1, 1, 1,
-0.331478, 1.056752, -1.627716, 1, 1, 1, 1, 1,
-0.3312836, -0.3598938, -1.508618, 0, 0, 1, 1, 1,
-0.3252302, 0.777913, -0.5076859, 1, 0, 0, 1, 1,
-0.3245233, 0.5894727, -2.371426, 1, 0, 0, 1, 1,
-0.3243055, -0.5494455, -3.566335, 1, 0, 0, 1, 1,
-0.3238396, 0.4826537, 1.385068, 1, 0, 0, 1, 1,
-0.3195116, 2.281551, -0.3913293, 1, 0, 0, 1, 1,
-0.3157644, -0.5638915, -1.103137, 0, 0, 0, 1, 1,
-0.3135474, 0.1872461, -1.382823, 0, 0, 0, 1, 1,
-0.3124455, -1.552456, -3.982559, 0, 0, 0, 1, 1,
-0.3045854, -0.1556618, -1.757821, 0, 0, 0, 1, 1,
-0.3031991, 0.1395121, -2.076409, 0, 0, 0, 1, 1,
-0.3016215, 0.8821621, 0.01431035, 0, 0, 0, 1, 1,
-0.2957189, 0.4821352, -0.5502409, 0, 0, 0, 1, 1,
-0.2914808, -0.2561892, -4.255092, 1, 1, 1, 1, 1,
-0.2895799, -1.640198, -4.776422, 1, 1, 1, 1, 1,
-0.2853849, -0.7677152, -1.650914, 1, 1, 1, 1, 1,
-0.2820765, -0.530416, -3.481782, 1, 1, 1, 1, 1,
-0.2769947, 0.3391899, -1.518678, 1, 1, 1, 1, 1,
-0.2729739, 0.4317173, -1.864546, 1, 1, 1, 1, 1,
-0.2705656, -0.1079809, -0.7195185, 1, 1, 1, 1, 1,
-0.2701394, 0.1346672, -0.8141097, 1, 1, 1, 1, 1,
-0.2648315, 0.923495, -1.543177, 1, 1, 1, 1, 1,
-0.2641648, -0.9943489, -3.864686, 1, 1, 1, 1, 1,
-0.263302, 1.77223, 0.02798878, 1, 1, 1, 1, 1,
-0.2561378, 0.4107898, -0.6128374, 1, 1, 1, 1, 1,
-0.2559974, -1.48311, -2.109986, 1, 1, 1, 1, 1,
-0.2532111, 1.331748, 0.1773802, 1, 1, 1, 1, 1,
-0.2522254, 0.03125721, -0.8213518, 1, 1, 1, 1, 1,
-0.2521058, -0.7039917, -3.494011, 0, 0, 1, 1, 1,
-0.2505135, 1.025143, 0.2162996, 1, 0, 0, 1, 1,
-0.2471645, 0.7565647, -0.5485418, 1, 0, 0, 1, 1,
-0.2429662, -1.3647, -2.337188, 1, 0, 0, 1, 1,
-0.2377727, 1.502302, 1.103272, 1, 0, 0, 1, 1,
-0.235893, -0.1568708, -1.44401, 1, 0, 0, 1, 1,
-0.2319421, -0.5662098, -3.87286, 0, 0, 0, 1, 1,
-0.228842, 1.2207, 0.4112346, 0, 0, 0, 1, 1,
-0.2263575, -0.9727398, -1.481005, 0, 0, 0, 1, 1,
-0.2188706, 0.1506889, -1.490943, 0, 0, 0, 1, 1,
-0.2176421, 0.7997859, 1.514812, 0, 0, 0, 1, 1,
-0.2141046, 0.2835906, -1.944862, 0, 0, 0, 1, 1,
-0.2110064, 0.713553, 1.628245, 0, 0, 0, 1, 1,
-0.2080122, -0.2665273, -2.99243, 1, 1, 1, 1, 1,
-0.2071119, 0.3961999, -1.457384, 1, 1, 1, 1, 1,
-0.2061283, 1.372893, -0.641252, 1, 1, 1, 1, 1,
-0.2029697, 0.6025784, -1.351097, 1, 1, 1, 1, 1,
-0.2004743, 0.1873627, -1.883084, 1, 1, 1, 1, 1,
-0.1949626, -0.8409274, -3.61506, 1, 1, 1, 1, 1,
-0.1933913, 1.685087, -0.1982571, 1, 1, 1, 1, 1,
-0.1898751, 0.8795444, -0.398986, 1, 1, 1, 1, 1,
-0.1827796, -1.137455, -3.13318, 1, 1, 1, 1, 1,
-0.1810995, 0.2738412, -0.4145399, 1, 1, 1, 1, 1,
-0.1757216, 0.3407655, -0.03289175, 1, 1, 1, 1, 1,
-0.1722835, -1.301849, -2.917202, 1, 1, 1, 1, 1,
-0.1715264, -0.1200116, -2.404398, 1, 1, 1, 1, 1,
-0.1668177, 0.09695597, -0.9044166, 1, 1, 1, 1, 1,
-0.1636724, 0.4195234, 0.136524, 1, 1, 1, 1, 1,
-0.1603521, -0.606952, -2.3801, 0, 0, 1, 1, 1,
-0.1575949, 0.3903427, -0.3313152, 1, 0, 0, 1, 1,
-0.1520348, -0.9701723, -2.50865, 1, 0, 0, 1, 1,
-0.1506262, 0.1079503, -1.29365, 1, 0, 0, 1, 1,
-0.1460309, 0.5641035, -1.106025, 1, 0, 0, 1, 1,
-0.1450002, 0.9405311, -0.7816848, 1, 0, 0, 1, 1,
-0.1393748, 1.783755, 1.543758, 0, 0, 0, 1, 1,
-0.1386364, 0.9286231, -0.03380258, 0, 0, 0, 1, 1,
-0.1369077, -1.109962, -3.196913, 0, 0, 0, 1, 1,
-0.1337565, -1.856635, -1.89782, 0, 0, 0, 1, 1,
-0.1308192, -1.42667, -2.986031, 0, 0, 0, 1, 1,
-0.1284826, 0.8634359, -0.03971408, 0, 0, 0, 1, 1,
-0.1279775, 1.033265, -0.9736682, 0, 0, 0, 1, 1,
-0.1252877, 0.2359731, -2.03675, 1, 1, 1, 1, 1,
-0.1208532, 1.870238, -0.9734447, 1, 1, 1, 1, 1,
-0.1184128, 0.5844612, 1.097918, 1, 1, 1, 1, 1,
-0.1172878, 1.140732, 0.9526259, 1, 1, 1, 1, 1,
-0.1148569, 0.5409401, 0.2634237, 1, 1, 1, 1, 1,
-0.109882, 1.088885, 0.392035, 1, 1, 1, 1, 1,
-0.1052981, 1.364649, -1.437279, 1, 1, 1, 1, 1,
-0.105142, 0.2275798, -0.2388714, 1, 1, 1, 1, 1,
-0.1007024, -0.4522551, -0.922331, 1, 1, 1, 1, 1,
-0.09836487, -0.05164581, -2.239967, 1, 1, 1, 1, 1,
-0.09534024, 0.2099799, -0.821968, 1, 1, 1, 1, 1,
-0.09266012, -0.753431, -4.116129, 1, 1, 1, 1, 1,
-0.08914976, -0.1000418, -0.3655698, 1, 1, 1, 1, 1,
-0.08809734, -0.2209221, -2.334773, 1, 1, 1, 1, 1,
-0.08417454, -1.0589, -3.092565, 1, 1, 1, 1, 1,
-0.08119006, -0.1336883, -2.431146, 0, 0, 1, 1, 1,
-0.07723644, 0.1877472, -0.8327989, 1, 0, 0, 1, 1,
-0.07389484, 1.039149, 2.146839, 1, 0, 0, 1, 1,
-0.07295656, -0.4326238, -1.346939, 1, 0, 0, 1, 1,
-0.07035241, 1.462234, -0.3758048, 1, 0, 0, 1, 1,
-0.06970404, 1.217069, 0.1413674, 1, 0, 0, 1, 1,
-0.06863135, -1.775183, -3.156578, 0, 0, 0, 1, 1,
-0.06675477, -0.02052838, -2.151334, 0, 0, 0, 1, 1,
-0.06649259, -0.901263, -3.914766, 0, 0, 0, 1, 1,
-0.06599353, -1.026498, -2.735144, 0, 0, 0, 1, 1,
-0.05169439, -0.5760595, -3.10221, 0, 0, 0, 1, 1,
-0.05065633, -1.120939, -1.059081, 0, 0, 0, 1, 1,
-0.0478128, 2.083694, -0.763372, 0, 0, 0, 1, 1,
-0.0466224, -0.5893975, -1.991218, 1, 1, 1, 1, 1,
-0.04638286, 0.2647376, -0.2404074, 1, 1, 1, 1, 1,
-0.04567267, 2.329527, -1.32672, 1, 1, 1, 1, 1,
-0.04082094, 0.4770902, 0.1999748, 1, 1, 1, 1, 1,
-0.03632872, -0.8170168, -2.211312, 1, 1, 1, 1, 1,
-0.03364493, 0.2047187, 0.1173262, 1, 1, 1, 1, 1,
-0.03325403, -0.389207, -3.50767, 1, 1, 1, 1, 1,
-0.03224767, 1.008923, -0.5599971, 1, 1, 1, 1, 1,
-0.03109931, 0.003855494, -2.647493, 1, 1, 1, 1, 1,
-0.02669847, 0.1409885, -0.388564, 1, 1, 1, 1, 1,
-0.02323515, -0.05550899, -2.455151, 1, 1, 1, 1, 1,
-0.02218636, -1.699365, -3.238496, 1, 1, 1, 1, 1,
-0.02212523, -0.3169883, -2.463459, 1, 1, 1, 1, 1,
-0.02152217, -0.7437742, -2.543541, 1, 1, 1, 1, 1,
-0.02032972, 1.204806, 1.032442, 1, 1, 1, 1, 1,
-0.01681726, 0.5251653, -0.2901964, 0, 0, 1, 1, 1,
-0.01518424, 0.880351, -1.015591, 1, 0, 0, 1, 1,
-0.01370296, 0.4795337, -0.5754699, 1, 0, 0, 1, 1,
-0.01130441, -0.0318866, -3.255781, 1, 0, 0, 1, 1,
-0.009457606, -0.1390971, -2.475224, 1, 0, 0, 1, 1,
-0.002415724, -0.3545919, -2.523889, 1, 0, 0, 1, 1,
-0.001496238, 0.8212616, -1.189228, 0, 0, 0, 1, 1,
0.00340044, 0.2623442, -0.1427855, 0, 0, 0, 1, 1,
0.007941892, -0.1275577, 3.28353, 0, 0, 0, 1, 1,
0.009147032, 0.3408666, 0.5655352, 0, 0, 0, 1, 1,
0.01013298, -2.127703, 2.411988, 0, 0, 0, 1, 1,
0.0110392, -0.5597042, 2.618012, 0, 0, 0, 1, 1,
0.01562496, -0.7433649, 1.737853, 0, 0, 0, 1, 1,
0.02041299, -1.274624, 4.250986, 1, 1, 1, 1, 1,
0.02451592, -1.16037, 3.284297, 1, 1, 1, 1, 1,
0.02502565, 0.5337249, 2.649063, 1, 1, 1, 1, 1,
0.02638545, -0.9031393, 3.234763, 1, 1, 1, 1, 1,
0.03074823, -0.9712166, 3.524668, 1, 1, 1, 1, 1,
0.03426158, -0.9205406, 4.53939, 1, 1, 1, 1, 1,
0.0408517, -0.8314897, 4.317914, 1, 1, 1, 1, 1,
0.04319621, 0.9570506, 1.181258, 1, 1, 1, 1, 1,
0.04643361, 1.08813, -0.4891995, 1, 1, 1, 1, 1,
0.04842795, -0.7432711, 2.45696, 1, 1, 1, 1, 1,
0.0553138, -0.6533534, 4.076838, 1, 1, 1, 1, 1,
0.05630998, -1.21342, 2.489883, 1, 1, 1, 1, 1,
0.05664251, 2.453395, -0.3988387, 1, 1, 1, 1, 1,
0.05679278, 0.04112992, 0.7618112, 1, 1, 1, 1, 1,
0.05756986, 0.2952275, -0.1629134, 1, 1, 1, 1, 1,
0.06304736, -0.09237263, 3.12908, 0, 0, 1, 1, 1,
0.06700213, -0.3008901, 2.179567, 1, 0, 0, 1, 1,
0.06825592, -0.1633928, 1.870264, 1, 0, 0, 1, 1,
0.06974246, 0.5617325, -0.7580179, 1, 0, 0, 1, 1,
0.06982112, 0.2454321, 1.62664, 1, 0, 0, 1, 1,
0.07299096, 1.490198, -1.350214, 1, 0, 0, 1, 1,
0.07564027, -1.203986, 4.116306, 0, 0, 0, 1, 1,
0.07751521, 0.4319938, 1.058545, 0, 0, 0, 1, 1,
0.08064676, 0.5123591, -0.3700335, 0, 0, 0, 1, 1,
0.08073967, -1.45307, 3.662133, 0, 0, 0, 1, 1,
0.08204074, -1.36109, 3.843871, 0, 0, 0, 1, 1,
0.08504988, 0.2363523, 0.7807422, 0, 0, 0, 1, 1,
0.08625703, -1.257509, 4.552631, 0, 0, 0, 1, 1,
0.08839586, 0.2425912, -1.434544, 1, 1, 1, 1, 1,
0.09013733, -1.221153, 0.9003443, 1, 1, 1, 1, 1,
0.09027354, 0.1552223, 2.57893, 1, 1, 1, 1, 1,
0.09240907, -1.516322, 2.347598, 1, 1, 1, 1, 1,
0.09419744, -1.166859, 3.762331, 1, 1, 1, 1, 1,
0.09700766, -0.9585068, 3.771909, 1, 1, 1, 1, 1,
0.0984614, 0.6182635, -0.03985779, 1, 1, 1, 1, 1,
0.1004319, -0.1819489, 2.900142, 1, 1, 1, 1, 1,
0.104638, 0.299465, 1.211814, 1, 1, 1, 1, 1,
0.1053812, -0.4897714, 2.906647, 1, 1, 1, 1, 1,
0.1065399, 0.9543624, 0.2623793, 1, 1, 1, 1, 1,
0.1075149, 0.2822403, 0.6121529, 1, 1, 1, 1, 1,
0.107602, 0.125226, 0.5863261, 1, 1, 1, 1, 1,
0.1076414, -0.01332995, 1.516366, 1, 1, 1, 1, 1,
0.1107659, -0.1241655, 0.0009425936, 1, 1, 1, 1, 1,
0.1114497, 0.2097181, -0.02670099, 0, 0, 1, 1, 1,
0.1207307, -1.950426, 2.435348, 1, 0, 0, 1, 1,
0.1208981, 0.2306474, 0.6691885, 1, 0, 0, 1, 1,
0.1218363, -0.3055657, 4.61455, 1, 0, 0, 1, 1,
0.1230825, -0.01526707, 1.819836, 1, 0, 0, 1, 1,
0.1263153, -1.326711, 4.402134, 1, 0, 0, 1, 1,
0.1308904, -1.109669, 1.890177, 0, 0, 0, 1, 1,
0.1319642, -0.7318311, 0.8942198, 0, 0, 0, 1, 1,
0.1337469, 1.240671, -0.6287726, 0, 0, 0, 1, 1,
0.137021, -0.3214869, 3.411015, 0, 0, 0, 1, 1,
0.1406567, -0.7569971, 3.070473, 0, 0, 0, 1, 1,
0.1419975, 1.868782, 0.01241328, 0, 0, 0, 1, 1,
0.1453648, 0.3185726, -0.7623509, 0, 0, 0, 1, 1,
0.1465565, 0.4351864, 1.563679, 1, 1, 1, 1, 1,
0.147783, -2.673294, 1.915097, 1, 1, 1, 1, 1,
0.1532052, -0.725626, 4.284595, 1, 1, 1, 1, 1,
0.1532591, -1.243526, 3.795672, 1, 1, 1, 1, 1,
0.1535114, 0.00181043, 1.795375, 1, 1, 1, 1, 1,
0.1548281, 1.989153, 0.8305076, 1, 1, 1, 1, 1,
0.1575398, 2.235351, -0.9590549, 1, 1, 1, 1, 1,
0.1610985, -0.3618834, 1.739939, 1, 1, 1, 1, 1,
0.1619764, -0.4814558, 3.373316, 1, 1, 1, 1, 1,
0.1658965, -3.263309, 1.651413, 1, 1, 1, 1, 1,
0.1675069, 0.2653466, 0.5233496, 1, 1, 1, 1, 1,
0.1676844, 1.516195, 1.339994, 1, 1, 1, 1, 1,
0.1724182, 1.366444, -1.664678, 1, 1, 1, 1, 1,
0.1753636, 0.6535916, -1.096598, 1, 1, 1, 1, 1,
0.1779271, 0.3537576, 0.06790045, 1, 1, 1, 1, 1,
0.1796329, -1.156953, 2.928142, 0, 0, 1, 1, 1,
0.1824659, -1.314007, 3.573578, 1, 0, 0, 1, 1,
0.1850317, 0.3253305, 2.684042, 1, 0, 0, 1, 1,
0.1857528, -0.7954385, 2.992095, 1, 0, 0, 1, 1,
0.1947474, -0.3542293, 3.06751, 1, 0, 0, 1, 1,
0.1961341, -0.07522815, 4.319184, 1, 0, 0, 1, 1,
0.1971305, 1.469215, 1.370935, 0, 0, 0, 1, 1,
0.1985939, -0.8984817, 2.932807, 0, 0, 0, 1, 1,
0.1986802, 0.3971457, 1.335923, 0, 0, 0, 1, 1,
0.1992663, -0.1097438, 1.04824, 0, 0, 0, 1, 1,
0.2014474, 0.7863597, -0.8984895, 0, 0, 0, 1, 1,
0.2020388, 0.986034, -1.026419, 0, 0, 0, 1, 1,
0.2021767, 0.9712949, 1.317847, 0, 0, 0, 1, 1,
0.2059295, -0.8023768, 2.548899, 1, 1, 1, 1, 1,
0.2095167, 0.9920255, 1.329944, 1, 1, 1, 1, 1,
0.2105342, 0.3159198, 0.8014215, 1, 1, 1, 1, 1,
0.2146506, 0.4474384, -0.1957684, 1, 1, 1, 1, 1,
0.2283161, 0.09552729, 1.42133, 1, 1, 1, 1, 1,
0.2295885, 0.09995518, 1.070138, 1, 1, 1, 1, 1,
0.2321056, -0.1558753, 2.228876, 1, 1, 1, 1, 1,
0.2321189, 1.505883, -0.4075396, 1, 1, 1, 1, 1,
0.2385098, 1.614097, 0.2179317, 1, 1, 1, 1, 1,
0.2417894, 0.6618382, 0.08032986, 1, 1, 1, 1, 1,
0.2429719, -0.8699496, 3.800494, 1, 1, 1, 1, 1,
0.2436259, 0.756241, 0.5389436, 1, 1, 1, 1, 1,
0.2480009, -0.3779958, 2.301709, 1, 1, 1, 1, 1,
0.2503136, -0.02058331, 1.308151, 1, 1, 1, 1, 1,
0.2538476, -1.05003, 2.565084, 1, 1, 1, 1, 1,
0.2551369, 0.4334538, -0.3007039, 0, 0, 1, 1, 1,
0.2559832, 1.335451, 2.20606, 1, 0, 0, 1, 1,
0.2577475, 0.8126785, 0.7173707, 1, 0, 0, 1, 1,
0.261406, -0.2515205, 2.247068, 1, 0, 0, 1, 1,
0.2619051, -0.7993281, 2.677369, 1, 0, 0, 1, 1,
0.2619545, -0.588586, 4.38729, 1, 0, 0, 1, 1,
0.2626913, -1.327276, 3.280652, 0, 0, 0, 1, 1,
0.2691659, 0.9192618, -1.014824, 0, 0, 0, 1, 1,
0.2699101, -0.01495081, 3.298654, 0, 0, 0, 1, 1,
0.2722716, 0.2585194, 1.323515, 0, 0, 0, 1, 1,
0.2764899, 0.5570222, 0.7537121, 0, 0, 0, 1, 1,
0.2789382, 1.178441, -0.213117, 0, 0, 0, 1, 1,
0.2805237, -0.9159017, 3.174417, 0, 0, 0, 1, 1,
0.2813761, -1.044877, 4.787104, 1, 1, 1, 1, 1,
0.2821668, 0.8505129, 1.678125, 1, 1, 1, 1, 1,
0.2834081, -1.194828, 2.011675, 1, 1, 1, 1, 1,
0.2834202, -0.9933871, 3.071268, 1, 1, 1, 1, 1,
0.2874927, 1.869086, 2.530166, 1, 1, 1, 1, 1,
0.2953089, -0.2000023, 3.608891, 1, 1, 1, 1, 1,
0.2955948, -1.216813, 3.299132, 1, 1, 1, 1, 1,
0.3009842, 1.405059, 0.7267455, 1, 1, 1, 1, 1,
0.3013476, 1.03529, -1.3815, 1, 1, 1, 1, 1,
0.304638, -1.079751, 2.722102, 1, 1, 1, 1, 1,
0.306639, -1.175515, 5.082064, 1, 1, 1, 1, 1,
0.3073677, -2.183262, 4.207875, 1, 1, 1, 1, 1,
0.3101258, 1.424817, -0.7210563, 1, 1, 1, 1, 1,
0.310826, -0.4835877, 2.664738, 1, 1, 1, 1, 1,
0.3131651, 1.394927, 1.790086, 1, 1, 1, 1, 1,
0.314665, 0.3024986, 1.40274, 0, 0, 1, 1, 1,
0.3150749, 0.1384629, 0.01032714, 1, 0, 0, 1, 1,
0.3153371, -0.5372432, 1.72138, 1, 0, 0, 1, 1,
0.3227358, -0.362891, 1.913259, 1, 0, 0, 1, 1,
0.3289771, -1.004255, 2.649013, 1, 0, 0, 1, 1,
0.3451861, -0.7579367, 4.089609, 1, 0, 0, 1, 1,
0.3478345, -1.443765, 3.146817, 0, 0, 0, 1, 1,
0.3490727, 1.239291, -0.9686523, 0, 0, 0, 1, 1,
0.3596765, 0.8704059, 0.5646427, 0, 0, 0, 1, 1,
0.3613229, -1.200087, 3.425328, 0, 0, 0, 1, 1,
0.3619567, -1.05848, 3.080739, 0, 0, 0, 1, 1,
0.3712772, 0.472311, 0.4547147, 0, 0, 0, 1, 1,
0.3727576, 0.1665622, 0.08978598, 0, 0, 0, 1, 1,
0.3730258, 0.6103389, 1.703993, 1, 1, 1, 1, 1,
0.3739643, 0.3895919, 0.09092731, 1, 1, 1, 1, 1,
0.3810646, -0.6736846, 4.671747, 1, 1, 1, 1, 1,
0.3853663, -0.9207475, 0.2369785, 1, 1, 1, 1, 1,
0.3860446, -1.533527, 2.517155, 1, 1, 1, 1, 1,
0.3862277, -0.6535901, 2.681897, 1, 1, 1, 1, 1,
0.3892886, 0.1932067, 0.2953581, 1, 1, 1, 1, 1,
0.3913618, -1.174383, 2.637631, 1, 1, 1, 1, 1,
0.392909, -0.3816253, 3.451605, 1, 1, 1, 1, 1,
0.3942439, 0.9692316, 1.225485, 1, 1, 1, 1, 1,
0.3958837, -0.663964, 3.289759, 1, 1, 1, 1, 1,
0.3976969, -0.6181245, 1.658643, 1, 1, 1, 1, 1,
0.4008371, -0.4144138, 2.146949, 1, 1, 1, 1, 1,
0.4035706, -0.1679197, 1.981647, 1, 1, 1, 1, 1,
0.4040487, -1.017388, 2.664016, 1, 1, 1, 1, 1,
0.4087526, -0.1561071, 0.3392546, 0, 0, 1, 1, 1,
0.4095435, -1.727343, 3.562622, 1, 0, 0, 1, 1,
0.4102639, -1.002058, 2.431021, 1, 0, 0, 1, 1,
0.4288868, 0.1130127, 0.8237798, 1, 0, 0, 1, 1,
0.4296412, 0.003035382, 3.132752, 1, 0, 0, 1, 1,
0.4299206, 0.7599406, -0.3788403, 1, 0, 0, 1, 1,
0.4300227, -0.6341016, 1.431373, 0, 0, 0, 1, 1,
0.4318437, -0.678206, 3.939105, 0, 0, 0, 1, 1,
0.4329595, -2.144519, 0.8079355, 0, 0, 0, 1, 1,
0.434035, -0.01155814, 1.642027, 0, 0, 0, 1, 1,
0.4341548, 0.3752837, 0.4860105, 0, 0, 0, 1, 1,
0.4396929, -1.439606, 0.2322782, 0, 0, 0, 1, 1,
0.4413034, -0.5952876, 2.178996, 0, 0, 0, 1, 1,
0.4414736, -1.414301, 1.977657, 1, 1, 1, 1, 1,
0.441588, -0.7821243, 2.644276, 1, 1, 1, 1, 1,
0.4442623, 2.178978, 0.9836837, 1, 1, 1, 1, 1,
0.4465041, 0.807462, 2.338444, 1, 1, 1, 1, 1,
0.4524545, -0.3110111, 1.937439, 1, 1, 1, 1, 1,
0.4537455, 0.6383902, 0.6868199, 1, 1, 1, 1, 1,
0.4591814, 0.9900283, -0.5406322, 1, 1, 1, 1, 1,
0.462741, -0.8199052, 2.010411, 1, 1, 1, 1, 1,
0.4656609, 0.3577544, -0.6311971, 1, 1, 1, 1, 1,
0.4657687, 1.811269, 1.095677, 1, 1, 1, 1, 1,
0.4677908, -0.389971, 1.580981, 1, 1, 1, 1, 1,
0.4748504, 1.597154, 1.343936, 1, 1, 1, 1, 1,
0.4761338, -1.103971, 2.620955, 1, 1, 1, 1, 1,
0.4784807, 0.5762647, 0.2274188, 1, 1, 1, 1, 1,
0.4794765, 0.975112, 1.567441, 1, 1, 1, 1, 1,
0.4839496, -1.007704, 1.987149, 0, 0, 1, 1, 1,
0.4855884, -1.479561, 2.633475, 1, 0, 0, 1, 1,
0.4881493, 0.1811991, 0.09256471, 1, 0, 0, 1, 1,
0.4899355, -1.810001, 1.851828, 1, 0, 0, 1, 1,
0.4990481, 0.314162, 2.047305, 1, 0, 0, 1, 1,
0.5035608, 1.029737, -0.9877834, 1, 0, 0, 1, 1,
0.5063359, -1.520144, -0.005050891, 0, 0, 0, 1, 1,
0.5120057, -1.41919, 2.061838, 0, 0, 0, 1, 1,
0.512747, 0.8090565, 1.10021, 0, 0, 0, 1, 1,
0.513817, -0.8701078, 2.899984, 0, 0, 0, 1, 1,
0.5166604, 1.026529, 1.276004, 0, 0, 0, 1, 1,
0.5214357, 0.2089254, -0.02772434, 0, 0, 0, 1, 1,
0.5269861, 1.399013, -0.5107179, 0, 0, 0, 1, 1,
0.5368462, -1.734926, 2.663761, 1, 1, 1, 1, 1,
0.5390677, -0.06287934, 0.8981532, 1, 1, 1, 1, 1,
0.5395564, 0.7470881, 0.1193622, 1, 1, 1, 1, 1,
0.5404014, -0.5187491, 2.497967, 1, 1, 1, 1, 1,
0.5413752, 0.8016435, -0.4234192, 1, 1, 1, 1, 1,
0.5430633, 1.583217, -1.80495, 1, 1, 1, 1, 1,
0.5448189, -0.93205, 1.523759, 1, 1, 1, 1, 1,
0.5464929, 0.04366013, 1.895072, 1, 1, 1, 1, 1,
0.5477997, -0.0470946, 1.69749, 1, 1, 1, 1, 1,
0.558857, -1.262453, 3.281672, 1, 1, 1, 1, 1,
0.5625017, 1.089682, 0.5292014, 1, 1, 1, 1, 1,
0.5654244, -1.281408, 4.677413, 1, 1, 1, 1, 1,
0.5677876, -1.222011, 3.301218, 1, 1, 1, 1, 1,
0.5725541, -0.1263847, 3.282141, 1, 1, 1, 1, 1,
0.5744026, 2.165433, -0.8314068, 1, 1, 1, 1, 1,
0.5863239, 1.009109, -1.45367, 0, 0, 1, 1, 1,
0.5880216, -0.009033843, 4.025156, 1, 0, 0, 1, 1,
0.6018165, 1.528577, 0.2475382, 1, 0, 0, 1, 1,
0.6021792, -0.7684234, 2.195647, 1, 0, 0, 1, 1,
0.6065261, -1.174397, 1.371171, 1, 0, 0, 1, 1,
0.6075007, 0.8066511, -0.3819938, 1, 0, 0, 1, 1,
0.613299, -0.3915868, 1.2957, 0, 0, 0, 1, 1,
0.6146355, 0.4332958, 0.7137829, 0, 0, 0, 1, 1,
0.6148322, 0.1506307, 1.349605, 0, 0, 0, 1, 1,
0.6248047, 0.04446511, 2.42517, 0, 0, 0, 1, 1,
0.6331204, 0.1740406, 0.7774704, 0, 0, 0, 1, 1,
0.6337634, 0.3197395, 0.1916526, 0, 0, 0, 1, 1,
0.6374534, 1.337584, 1.514847, 0, 0, 0, 1, 1,
0.6385416, -0.05931059, 2.467052, 1, 1, 1, 1, 1,
0.6397339, 0.0853051, 1.205273, 1, 1, 1, 1, 1,
0.6460479, 0.938013, -1.337054, 1, 1, 1, 1, 1,
0.6670533, -1.745254, 2.864767, 1, 1, 1, 1, 1,
0.668007, -1.136084, 2.508255, 1, 1, 1, 1, 1,
0.6688834, -0.06181577, 0.4305386, 1, 1, 1, 1, 1,
0.6716884, 1.412004, 0.4371823, 1, 1, 1, 1, 1,
0.6732911, 1.157457, 1.394791, 1, 1, 1, 1, 1,
0.6739199, -0.5176321, 1.712938, 1, 1, 1, 1, 1,
0.679343, 0.2410416, 1.558105, 1, 1, 1, 1, 1,
0.6847169, -1.541013, 4.469549, 1, 1, 1, 1, 1,
0.6847358, -2.751429, 3.395611, 1, 1, 1, 1, 1,
0.6851729, 0.5126452, 1.374834, 1, 1, 1, 1, 1,
0.6859663, -2.048855, 1.835615, 1, 1, 1, 1, 1,
0.6900126, -0.1047815, 0.3907184, 1, 1, 1, 1, 1,
0.6964436, -0.1591315, 3.118241, 0, 0, 1, 1, 1,
0.7007805, 0.6190499, 0.8610467, 1, 0, 0, 1, 1,
0.7018152, -0.3050664, 2.361524, 1, 0, 0, 1, 1,
0.7028717, 0.03279886, 1.425848, 1, 0, 0, 1, 1,
0.7037618, -0.2061076, 3.253725, 1, 0, 0, 1, 1,
0.7044165, 0.2991231, 2.624158, 1, 0, 0, 1, 1,
0.7147955, -0.5207397, 2.605197, 0, 0, 0, 1, 1,
0.7211173, -0.1185923, 1.470872, 0, 0, 0, 1, 1,
0.7212373, -2.1415, 3.266067, 0, 0, 0, 1, 1,
0.7284195, -0.3061195, 1.879306, 0, 0, 0, 1, 1,
0.732276, -0.09552458, 1.054836, 0, 0, 0, 1, 1,
0.7435238, 0.2084144, 1.351391, 0, 0, 0, 1, 1,
0.7461644, -0.8244672, 1.175648, 0, 0, 0, 1, 1,
0.7509586, 1.251316, -0.9078046, 1, 1, 1, 1, 1,
0.7515557, -0.2065051, 0.06826437, 1, 1, 1, 1, 1,
0.7528228, 0.6503437, 1.353128, 1, 1, 1, 1, 1,
0.7557315, 0.4332086, 1.438024, 1, 1, 1, 1, 1,
0.7566718, -2.818573, 3.948366, 1, 1, 1, 1, 1,
0.7634411, -0.5830858, 0.4270431, 1, 1, 1, 1, 1,
0.7673575, 1.071212, -0.1547362, 1, 1, 1, 1, 1,
0.7709183, -0.3148263, 3.427262, 1, 1, 1, 1, 1,
0.7732517, 1.790097, 1.190026, 1, 1, 1, 1, 1,
0.7796977, 1.654219, 0.9553246, 1, 1, 1, 1, 1,
0.7797459, 0.441079, 1.382138, 1, 1, 1, 1, 1,
0.7821961, 1.069441, 0.7127891, 1, 1, 1, 1, 1,
0.7831978, 1.469883, 1.458821, 1, 1, 1, 1, 1,
0.7851757, 0.73974, 1.600613, 1, 1, 1, 1, 1,
0.786357, -1.253104, 0.8071159, 1, 1, 1, 1, 1,
0.7885606, 1.275476, -0.2610287, 0, 0, 1, 1, 1,
0.7909403, 1.012175, 0.5045793, 1, 0, 0, 1, 1,
0.808112, -0.8370864, 3.303905, 1, 0, 0, 1, 1,
0.8110175, 1.010844, 1.513623, 1, 0, 0, 1, 1,
0.8222282, -0.1899891, 2.318378, 1, 0, 0, 1, 1,
0.8224233, -1.097937, 4.212423, 1, 0, 0, 1, 1,
0.8229369, -1.97493, 2.22832, 0, 0, 0, 1, 1,
0.8264048, 1.496473, 1.265796, 0, 0, 0, 1, 1,
0.8279803, 1.271185, 0.003518615, 0, 0, 0, 1, 1,
0.8280191, -0.6520815, 1.034614, 0, 0, 0, 1, 1,
0.8331137, 0.577101, 1.103012, 0, 0, 0, 1, 1,
0.8367031, 0.780333, 1.195878, 0, 0, 0, 1, 1,
0.8390059, -0.4589991, 0.5814192, 0, 0, 0, 1, 1,
0.8543006, -0.2788047, 2.959099, 1, 1, 1, 1, 1,
0.8544145, -0.3820803, -0.776597, 1, 1, 1, 1, 1,
0.8569912, 0.6272948, -0.5897212, 1, 1, 1, 1, 1,
0.8666574, -1.243794, 2.932476, 1, 1, 1, 1, 1,
0.8690465, -0.1819306, 2.055406, 1, 1, 1, 1, 1,
0.8779569, -1.037256, 2.146926, 1, 1, 1, 1, 1,
0.8779629, -0.4687229, 0.4885009, 1, 1, 1, 1, 1,
0.8813783, 0.7083412, 1.967948, 1, 1, 1, 1, 1,
0.8824828, -0.5111119, 1.14903, 1, 1, 1, 1, 1,
0.8877141, -0.5710615, 0.3231405, 1, 1, 1, 1, 1,
0.8885984, -0.7317587, 1.846811, 1, 1, 1, 1, 1,
0.8940501, -0.08157711, -0.4224246, 1, 1, 1, 1, 1,
0.8983586, -0.627748, 2.945622, 1, 1, 1, 1, 1,
0.9029242, 1.056982, 0.01510568, 1, 1, 1, 1, 1,
0.9029871, 0.5756451, 1.246958, 1, 1, 1, 1, 1,
0.9094745, 1.176131, -0.9166037, 0, 0, 1, 1, 1,
0.912969, -0.381989, 1.388853, 1, 0, 0, 1, 1,
0.9130011, -0.1564838, 1.318335, 1, 0, 0, 1, 1,
0.9142327, -0.06015372, 0.5668927, 1, 0, 0, 1, 1,
0.9145926, -0.9019263, 2.933954, 1, 0, 0, 1, 1,
0.9176762, -0.2035477, 2.945633, 1, 0, 0, 1, 1,
0.9204029, 0.4868123, -0.1524989, 0, 0, 0, 1, 1,
0.9241582, -1.066682, 1.882893, 0, 0, 0, 1, 1,
0.9280115, -0.3527131, 2.920883, 0, 0, 0, 1, 1,
0.9365116, -0.558039, 0.8785309, 0, 0, 0, 1, 1,
0.9421558, 0.8785232, 1.434261, 0, 0, 0, 1, 1,
0.9498588, 0.7857001, 0.7220592, 0, 0, 0, 1, 1,
0.9566149, -1.671251, 1.701298, 0, 0, 0, 1, 1,
0.9566741, 1.086178, 0.3115522, 1, 1, 1, 1, 1,
0.9581962, 1.213134, 1.703992, 1, 1, 1, 1, 1,
0.9634386, 1.561676, -1.405334, 1, 1, 1, 1, 1,
0.9639101, 0.06624141, 1.044022, 1, 1, 1, 1, 1,
0.9703126, -0.1605456, 1.140644, 1, 1, 1, 1, 1,
0.9759134, -1.012954, 1.446812, 1, 1, 1, 1, 1,
0.9783958, -0.9856758, 2.819215, 1, 1, 1, 1, 1,
0.9840244, -0.1348439, 2.055879, 1, 1, 1, 1, 1,
0.9856131, 1.181918, 0.5225404, 1, 1, 1, 1, 1,
0.988369, 0.6366248, 2.474428, 1, 1, 1, 1, 1,
0.9927234, -1.856621, 2.991526, 1, 1, 1, 1, 1,
0.9942898, 0.4105644, -0.7340475, 1, 1, 1, 1, 1,
0.9948406, -0.9743246, 1.918068, 1, 1, 1, 1, 1,
0.9960193, 0.9799208, -0.1821987, 1, 1, 1, 1, 1,
1.004106, 0.06735071, 1.029021, 1, 1, 1, 1, 1,
1.005333, -1.152267, 3.020886, 0, 0, 1, 1, 1,
1.012347, -1.042831, 2.05114, 1, 0, 0, 1, 1,
1.024387, 0.8165818, -0.5606217, 1, 0, 0, 1, 1,
1.025161, 0.2786795, 0.09228935, 1, 0, 0, 1, 1,
1.027259, 0.5058219, 1.423318, 1, 0, 0, 1, 1,
1.042947, -0.2901997, 0.8953243, 1, 0, 0, 1, 1,
1.044752, -1.533177, 3.093802, 0, 0, 0, 1, 1,
1.045876, -0.1211177, 1.589302, 0, 0, 0, 1, 1,
1.049877, -0.1998702, 1.211289, 0, 0, 0, 1, 1,
1.055246, 1.906847, 0.5585017, 0, 0, 0, 1, 1,
1.063067, -0.3540121, 0.7295003, 0, 0, 0, 1, 1,
1.063789, 1.907665, -0.1777956, 0, 0, 0, 1, 1,
1.068104, 0.1580498, 1.562833, 0, 0, 0, 1, 1,
1.069908, 1.253897, 0.3062157, 1, 1, 1, 1, 1,
1.077129, 1.490602, -0.5388869, 1, 1, 1, 1, 1,
1.079692, 0.008572254, 1.591772, 1, 1, 1, 1, 1,
1.083288, -0.0322498, -0.1553789, 1, 1, 1, 1, 1,
1.101768, -1.683749, 3.097223, 1, 1, 1, 1, 1,
1.108506, -1.133246, 4.043057, 1, 1, 1, 1, 1,
1.111506, -1.293875, 2.119058, 1, 1, 1, 1, 1,
1.114796, 0.1038715, 1.957765, 1, 1, 1, 1, 1,
1.120849, 0.8448114, 1.125842, 1, 1, 1, 1, 1,
1.128641, -0.7765023, 2.421803, 1, 1, 1, 1, 1,
1.128708, 1.329379, -0.1403534, 1, 1, 1, 1, 1,
1.133584, 0.212253, 2.529996, 1, 1, 1, 1, 1,
1.134053, -1.806176, 3.352605, 1, 1, 1, 1, 1,
1.134998, 2.365237, 1.351286, 1, 1, 1, 1, 1,
1.136874, -2.143383, 3.303368, 1, 1, 1, 1, 1,
1.142639, 1.009371, 0.8890102, 0, 0, 1, 1, 1,
1.156503, 0.1439921, 2.348726, 1, 0, 0, 1, 1,
1.164187, -1.578342, 2.582193, 1, 0, 0, 1, 1,
1.170219, -0.260748, 1.335861, 1, 0, 0, 1, 1,
1.172333, -0.4081169, 3.809829, 1, 0, 0, 1, 1,
1.176803, 0.03820731, 1.54595, 1, 0, 0, 1, 1,
1.185068, 1.845874, 0.1321015, 0, 0, 0, 1, 1,
1.193375, -0.3161964, 0.8999856, 0, 0, 0, 1, 1,
1.219213, 0.5273937, -0.01401425, 0, 0, 0, 1, 1,
1.221998, 0.4024229, 1.024097, 0, 0, 0, 1, 1,
1.232162, -0.09856347, 1.205558, 0, 0, 0, 1, 1,
1.232997, -0.7319986, 1.973252, 0, 0, 0, 1, 1,
1.236024, 0.5687149, 1.718557, 0, 0, 0, 1, 1,
1.237632, 0.09226441, 1.53589, 1, 1, 1, 1, 1,
1.252883, -0.5298537, 3.888844, 1, 1, 1, 1, 1,
1.263727, 0.4602666, 0.817881, 1, 1, 1, 1, 1,
1.266006, 0.664156, 1.74616, 1, 1, 1, 1, 1,
1.268093, 0.3329022, 1.851732, 1, 1, 1, 1, 1,
1.279417, 0.1597597, 0.5694305, 1, 1, 1, 1, 1,
1.285123, -0.03812723, 0.7732085, 1, 1, 1, 1, 1,
1.287878, 0.1433683, 2.891092, 1, 1, 1, 1, 1,
1.292442, 1.842205, 0.3728672, 1, 1, 1, 1, 1,
1.298806, -0.515845, 2.275948, 1, 1, 1, 1, 1,
1.298948, -1.42823, 2.684592, 1, 1, 1, 1, 1,
1.308154, 0.3438856, -0.04657898, 1, 1, 1, 1, 1,
1.31434, -1.217731, 2.427775, 1, 1, 1, 1, 1,
1.318983, -0.5288881, 1.609075, 1, 1, 1, 1, 1,
1.323509, 2.958302, 0.727213, 1, 1, 1, 1, 1,
1.323634, 1.005708, 1.333931, 0, 0, 1, 1, 1,
1.329046, -0.824764, 1.352652, 1, 0, 0, 1, 1,
1.332584, -0.1940012, -0.07421601, 1, 0, 0, 1, 1,
1.332643, 0.5131291, 2.272207, 1, 0, 0, 1, 1,
1.341901, 0.9168532, 3.184271, 1, 0, 0, 1, 1,
1.342412, -1.450961, 0.9493354, 1, 0, 0, 1, 1,
1.344203, -0.855087, 1.782481, 0, 0, 0, 1, 1,
1.35519, -0.1496625, 0.9438387, 0, 0, 0, 1, 1,
1.373358, 1.662458, 1.867871, 0, 0, 0, 1, 1,
1.382748, 0.148986, 0.9337707, 0, 0, 0, 1, 1,
1.385534, 1.067266, 0.8273003, 0, 0, 0, 1, 1,
1.38815, 1.543785, -0.2254435, 0, 0, 0, 1, 1,
1.404149, -0.5022073, 2.875293, 0, 0, 0, 1, 1,
1.415184, -0.9629088, 1.168693, 1, 1, 1, 1, 1,
1.416802, -1.158259, 2.090621, 1, 1, 1, 1, 1,
1.426873, -2.673499, 3.605932, 1, 1, 1, 1, 1,
1.430412, 0.2496553, 2.771214, 1, 1, 1, 1, 1,
1.432424, -0.08605992, 1.734407, 1, 1, 1, 1, 1,
1.432624, 0.7015414, 1.052799, 1, 1, 1, 1, 1,
1.433523, 0.7037953, 1.016203, 1, 1, 1, 1, 1,
1.436256, 0.9476823, 1.422625, 1, 1, 1, 1, 1,
1.441208, -1.836454, 2.609488, 1, 1, 1, 1, 1,
1.444541, 0.6024837, 3.069993, 1, 1, 1, 1, 1,
1.447616, -0.6346574, 2.557851, 1, 1, 1, 1, 1,
1.449, -1.186247, 0.4789665, 1, 1, 1, 1, 1,
1.45197, 0.8191115, 0.8567947, 1, 1, 1, 1, 1,
1.45875, -0.06948232, 1.402165, 1, 1, 1, 1, 1,
1.465904, -1.583626, 3.023319, 1, 1, 1, 1, 1,
1.483885, 0.2218198, 0.6446538, 0, 0, 1, 1, 1,
1.484745, 0.7663832, 0.6850678, 1, 0, 0, 1, 1,
1.487406, 0.96839, 1.321836, 1, 0, 0, 1, 1,
1.500592, 1.878188, 1.115896, 1, 0, 0, 1, 1,
1.506788, 1.820035, 2.15238, 1, 0, 0, 1, 1,
1.507334, 1.133701, 0.008089529, 1, 0, 0, 1, 1,
1.510313, 1.029423, 0.8625656, 0, 0, 0, 1, 1,
1.51556, -1.066914, 0.9888434, 0, 0, 0, 1, 1,
1.528004, -0.3912885, 2.899314, 0, 0, 0, 1, 1,
1.537234, 0.3267098, -0.08868287, 0, 0, 0, 1, 1,
1.539919, -0.4417621, 3.458731, 0, 0, 0, 1, 1,
1.54217, -0.4662147, 1.6644, 0, 0, 0, 1, 1,
1.547156, 1.027932, 1.21449, 0, 0, 0, 1, 1,
1.547688, 0.741725, 0.8347172, 1, 1, 1, 1, 1,
1.548687, 1.856671, -0.7097143, 1, 1, 1, 1, 1,
1.549703, 0.6006418, 2.5026, 1, 1, 1, 1, 1,
1.57409, -1.331199, 2.893823, 1, 1, 1, 1, 1,
1.581421, 0.2520134, 2.909559, 1, 1, 1, 1, 1,
1.584303, 1.124365, 1.67443, 1, 1, 1, 1, 1,
1.587963, -0.7183079, 0.5031257, 1, 1, 1, 1, 1,
1.589582, 0.4982817, -0.8493239, 1, 1, 1, 1, 1,
1.603715, 0.05782159, 1.20582, 1, 1, 1, 1, 1,
1.612864, -0.5273237, 2.650621, 1, 1, 1, 1, 1,
1.624531, -0.5675619, 1.709776, 1, 1, 1, 1, 1,
1.627491, -1.695812, 3.807952, 1, 1, 1, 1, 1,
1.650784, 0.2147543, 3.665395, 1, 1, 1, 1, 1,
1.652644, -0.06326481, -0.01296753, 1, 1, 1, 1, 1,
1.667276, 0.3572226, 2.749441, 1, 1, 1, 1, 1,
1.686388, 0.1791046, 1.103315, 0, 0, 1, 1, 1,
1.706488, -0.233486, 3.765564, 1, 0, 0, 1, 1,
1.706963, 0.6872038, 1.112454, 1, 0, 0, 1, 1,
1.709167, 1.119335, 0.6253691, 1, 0, 0, 1, 1,
1.715605, -0.6481028, 2.668785, 1, 0, 0, 1, 1,
1.72038, -0.09349412, 1.673867, 1, 0, 0, 1, 1,
1.744825, 0.8239132, 2.305952, 0, 0, 0, 1, 1,
1.760437, -1.017286, 0.8643458, 0, 0, 0, 1, 1,
1.769975, 0.03209125, 0.9847194, 0, 0, 0, 1, 1,
1.782462, -0.3619197, 2.881127, 0, 0, 0, 1, 1,
1.783691, -0.126986, 1.262921, 0, 0, 0, 1, 1,
1.818745, 1.344751, 1.752051, 0, 0, 0, 1, 1,
1.824635, 0.2962722, 0.7389237, 0, 0, 0, 1, 1,
1.836408, 1.632254, -0.09495141, 1, 1, 1, 1, 1,
1.843241, 0.8369584, 0.4442537, 1, 1, 1, 1, 1,
1.843704, -0.2838981, 1.976206, 1, 1, 1, 1, 1,
1.854069, -1.515757, 0.3398917, 1, 1, 1, 1, 1,
1.864841, -0.06519275, 1.746798, 1, 1, 1, 1, 1,
1.891566, -1.552493, 0.4482031, 1, 1, 1, 1, 1,
1.905095, -0.3230772, 3.510035, 1, 1, 1, 1, 1,
1.93253, 1.587535, 1.741418, 1, 1, 1, 1, 1,
1.961705, 1.312674, 1.702209, 1, 1, 1, 1, 1,
1.965101, -0.3789379, 2.064351, 1, 1, 1, 1, 1,
1.986604, 0.2047193, 1.115349, 1, 1, 1, 1, 1,
1.9892, 0.8082771, -0.8482389, 1, 1, 1, 1, 1,
1.99436, 1.807757, 0.72489, 1, 1, 1, 1, 1,
2.020359, 0.01456877, 3.594732, 1, 1, 1, 1, 1,
2.025649, -0.1343516, 2.077168, 1, 1, 1, 1, 1,
2.032686, 0.6504299, -0.6326696, 0, 0, 1, 1, 1,
2.041739, 1.933919, 1.215155, 1, 0, 0, 1, 1,
2.070977, 0.8591539, 0.8007259, 1, 0, 0, 1, 1,
2.090708, 0.708791, 0.8078045, 1, 0, 0, 1, 1,
2.129738, -0.08218787, 1.951922, 1, 0, 0, 1, 1,
2.236327, 0.08514241, 0.4394716, 1, 0, 0, 1, 1,
2.248332, -1.292651, 1.646249, 0, 0, 0, 1, 1,
2.28014, -0.4532059, 1.656386, 0, 0, 0, 1, 1,
2.290555, -0.01465175, -0.140315, 0, 0, 0, 1, 1,
2.347201, -1.191295, 1.154203, 0, 0, 0, 1, 1,
2.355258, 1.443056, 1.192148, 0, 0, 0, 1, 1,
2.404635, 0.534089, 0.383306, 0, 0, 0, 1, 1,
2.436922, -0.4120469, -0.4587815, 0, 0, 0, 1, 1,
2.47029, 0.5487256, 1.871054, 1, 1, 1, 1, 1,
2.516098, 0.04826917, 0.653574, 1, 1, 1, 1, 1,
2.558437, -0.7666807, 2.198475, 1, 1, 1, 1, 1,
2.589763, -0.3897148, 2.269613, 1, 1, 1, 1, 1,
2.728032, -0.6599421, 2.613154, 1, 1, 1, 1, 1,
2.804336, 1.478277, 3.360264, 1, 1, 1, 1, 1,
3.613731, 2.254859, 1.467122, 1, 1, 1, 1, 1
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
var radius = 9.278248;
var distance = 32.58945;
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
mvMatrix.translate( -0.4308119, -0.03699803, -0.1528213 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.58945);
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