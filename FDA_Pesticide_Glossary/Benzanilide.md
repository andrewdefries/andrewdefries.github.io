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
-3.521785, 1.527128, -1.47374, 1, 0, 0, 1,
-2.915995, -1.28997, -1.532402, 1, 0.007843138, 0, 1,
-2.902408, -1.220496, -1.781998, 1, 0.01176471, 0, 1,
-2.842787, -0.2729513, -1.477304, 1, 0.01960784, 0, 1,
-2.823874, 1.07604, -1.348982, 1, 0.02352941, 0, 1,
-2.780752, 0.1363912, -0.8218409, 1, 0.03137255, 0, 1,
-2.774458, -0.4719423, -1.314952, 1, 0.03529412, 0, 1,
-2.745694, 0.760719, -1.570205, 1, 0.04313726, 0, 1,
-2.745579, -1.474699, -3.134063, 1, 0.04705882, 0, 1,
-2.615808, -0.7416907, -1.759847, 1, 0.05490196, 0, 1,
-2.601649, -0.07910675, -1.475766, 1, 0.05882353, 0, 1,
-2.590688, 1.274744, -1.36309, 1, 0.06666667, 0, 1,
-2.500567, -0.1823853, -2.728129, 1, 0.07058824, 0, 1,
-2.489659, 1.299119, 0.2989765, 1, 0.07843138, 0, 1,
-2.418139, 1.885854, -1.630238, 1, 0.08235294, 0, 1,
-2.321218, -0.886183, -2.002639, 1, 0.09019608, 0, 1,
-2.275448, 0.6998417, -0.871322, 1, 0.09411765, 0, 1,
-2.242944, -0.6727524, 0.08588368, 1, 0.1019608, 0, 1,
-2.217297, -0.8994491, -1.131896, 1, 0.1098039, 0, 1,
-2.190964, 0.777009, -1.202856, 1, 0.1137255, 0, 1,
-2.190108, 2.671048, -1.253136, 1, 0.1215686, 0, 1,
-2.166553, -1.158144, -1.588597, 1, 0.1254902, 0, 1,
-2.162355, -0.4741535, -0.5578783, 1, 0.1333333, 0, 1,
-2.149917, 0.9303792, -2.729044, 1, 0.1372549, 0, 1,
-2.144945, 0.07181642, -1.129862, 1, 0.145098, 0, 1,
-2.143677, -0.7453208, -2.266446, 1, 0.1490196, 0, 1,
-2.128284, 2.201982, -0.2524383, 1, 0.1568628, 0, 1,
-2.119323, -0.6769755, -3.378426, 1, 0.1607843, 0, 1,
-2.058595, -2.679818, -3.460594, 1, 0.1686275, 0, 1,
-2.057954, 1.895474, 1.307063, 1, 0.172549, 0, 1,
-2.011835, 2.486885, -0.9620006, 1, 0.1803922, 0, 1,
-1.99582, 0.9214703, -0.02496427, 1, 0.1843137, 0, 1,
-1.989732, 0.1448508, -1.373679, 1, 0.1921569, 0, 1,
-1.934872, 1.050683, -0.3598234, 1, 0.1960784, 0, 1,
-1.896899, 0.1984945, -1.894143, 1, 0.2039216, 0, 1,
-1.893628, 0.6069623, -1.639804, 1, 0.2117647, 0, 1,
-1.886625, 1.601543, -1.211411, 1, 0.2156863, 0, 1,
-1.845732, 0.3275816, -1.393137, 1, 0.2235294, 0, 1,
-1.833829, 0.5599182, -0.0297207, 1, 0.227451, 0, 1,
-1.814155, 1.436639, -1.405141, 1, 0.2352941, 0, 1,
-1.800269, 0.4685362, -3.239175, 1, 0.2392157, 0, 1,
-1.798694, 1.305978, -2.931286, 1, 0.2470588, 0, 1,
-1.794385, -0.5899805, -2.222762, 1, 0.2509804, 0, 1,
-1.773913, -0.7863291, -1.75869, 1, 0.2588235, 0, 1,
-1.769657, 1.586917, 0.3591416, 1, 0.2627451, 0, 1,
-1.74473, 0.3050261, -1.304834, 1, 0.2705882, 0, 1,
-1.729477, -0.9230279, -2.765552, 1, 0.2745098, 0, 1,
-1.728402, -0.006436954, -3.062297, 1, 0.282353, 0, 1,
-1.727349, 0.6169077, -0.6508017, 1, 0.2862745, 0, 1,
-1.724378, -0.2867959, -3.135656, 1, 0.2941177, 0, 1,
-1.723096, 1.075145, -0.5905985, 1, 0.3019608, 0, 1,
-1.701879, 0.1807273, -0.800572, 1, 0.3058824, 0, 1,
-1.699736, -1.491021, 0.02688485, 1, 0.3137255, 0, 1,
-1.698777, 0.7037901, -0.9137152, 1, 0.3176471, 0, 1,
-1.687453, -0.1443959, -2.117864, 1, 0.3254902, 0, 1,
-1.68255, 0.4536048, -0.3426113, 1, 0.3294118, 0, 1,
-1.672878, -0.5947561, -0.3818287, 1, 0.3372549, 0, 1,
-1.666777, 2.728864, -0.4697745, 1, 0.3411765, 0, 1,
-1.652706, 0.4707396, -0.7963375, 1, 0.3490196, 0, 1,
-1.652363, -0.3286372, -3.235125, 1, 0.3529412, 0, 1,
-1.640885, 0.1918565, -1.71586, 1, 0.3607843, 0, 1,
-1.636635, -0.2916128, -1.451814, 1, 0.3647059, 0, 1,
-1.63541, -0.7473737, -2.247092, 1, 0.372549, 0, 1,
-1.616049, -1.752613, -1.711844, 1, 0.3764706, 0, 1,
-1.612664, -0.9715062, -1.391274, 1, 0.3843137, 0, 1,
-1.605481, -0.5503154, -0.360287, 1, 0.3882353, 0, 1,
-1.544376, -0.7183555, -3.016823, 1, 0.3960784, 0, 1,
-1.530473, -1.111457, -2.344167, 1, 0.4039216, 0, 1,
-1.515112, -1.299291, -2.53378, 1, 0.4078431, 0, 1,
-1.509895, -0.4777554, -0.4523588, 1, 0.4156863, 0, 1,
-1.506746, 0.3658918, -2.962271, 1, 0.4196078, 0, 1,
-1.503243, -0.5492145, -2.169791, 1, 0.427451, 0, 1,
-1.49219, -1.290359, 0.1702165, 1, 0.4313726, 0, 1,
-1.490589, -0.4502556, -1.848078, 1, 0.4392157, 0, 1,
-1.490548, 0.4565521, -1.543426, 1, 0.4431373, 0, 1,
-1.479488, 0.8901456, -0.7765719, 1, 0.4509804, 0, 1,
-1.471163, -0.08386565, -1.357391, 1, 0.454902, 0, 1,
-1.463551, -0.5280221, -0.8011811, 1, 0.4627451, 0, 1,
-1.456453, 0.1885506, -0.2284087, 1, 0.4666667, 0, 1,
-1.440518, -2.081366, -4.152626, 1, 0.4745098, 0, 1,
-1.439456, -0.5966887, -3.461744, 1, 0.4784314, 0, 1,
-1.433195, 0.6443046, -1.970508, 1, 0.4862745, 0, 1,
-1.430404, -0.1700766, -2.645432, 1, 0.4901961, 0, 1,
-1.429888, 1.422793, -1.497535, 1, 0.4980392, 0, 1,
-1.398681, 0.3834266, -2.568095, 1, 0.5058824, 0, 1,
-1.377938, 0.09356897, -1.348942, 1, 0.509804, 0, 1,
-1.37552, 1.594951, -1.480396, 1, 0.5176471, 0, 1,
-1.367858, -1.085216, -2.185354, 1, 0.5215687, 0, 1,
-1.364837, 0.08707395, -3.236023, 1, 0.5294118, 0, 1,
-1.357643, -0.7515292, -2.390316, 1, 0.5333334, 0, 1,
-1.357567, -0.7562331, -1.5947, 1, 0.5411765, 0, 1,
-1.339194, 1.70549, 0.2695213, 1, 0.5450981, 0, 1,
-1.326813, 0.343869, -1.980372, 1, 0.5529412, 0, 1,
-1.326029, 1.773326, -1.496276, 1, 0.5568628, 0, 1,
-1.313824, 0.009141422, -1.837223, 1, 0.5647059, 0, 1,
-1.301356, -0.8176993, -2.841174, 1, 0.5686275, 0, 1,
-1.298053, 0.3467839, -1.027317, 1, 0.5764706, 0, 1,
-1.296071, 2.351875, -0.8746878, 1, 0.5803922, 0, 1,
-1.291497, 1.122618, -0.8552014, 1, 0.5882353, 0, 1,
-1.288586, -0.3123135, -3.363491, 1, 0.5921569, 0, 1,
-1.275893, -1.732475, -0.6916323, 1, 0.6, 0, 1,
-1.253668, 0.2908893, -0.6414248, 1, 0.6078432, 0, 1,
-1.24809, -0.556945, -0.9162549, 1, 0.6117647, 0, 1,
-1.238549, -3.815209, -1.025627, 1, 0.6196079, 0, 1,
-1.2361, -0.2552067, -1.248714, 1, 0.6235294, 0, 1,
-1.230179, 0.4398819, -2.58422, 1, 0.6313726, 0, 1,
-1.226477, -1.326015, -3.693353, 1, 0.6352941, 0, 1,
-1.218785, -0.3031574, -2.147611, 1, 0.6431373, 0, 1,
-1.218397, 0.8234851, -1.713732, 1, 0.6470588, 0, 1,
-1.218052, -0.3466302, -3.125875, 1, 0.654902, 0, 1,
-1.212204, -0.4709176, -1.422315, 1, 0.6588235, 0, 1,
-1.204398, 1.144722, -1.32883, 1, 0.6666667, 0, 1,
-1.188915, -0.3141579, -1.574853, 1, 0.6705883, 0, 1,
-1.18718, -2.078613, -2.277663, 1, 0.6784314, 0, 1,
-1.178938, -0.5911595, -2.978664, 1, 0.682353, 0, 1,
-1.178608, 0.5461375, -1.42921, 1, 0.6901961, 0, 1,
-1.17823, 0.4625789, -1.737986, 1, 0.6941177, 0, 1,
-1.176713, 0.6214935, -2.061422, 1, 0.7019608, 0, 1,
-1.160682, 0.7264983, -1.633427, 1, 0.7098039, 0, 1,
-1.141477, 1.062199, 0.08917367, 1, 0.7137255, 0, 1,
-1.13921, 1.126903, -2.823907, 1, 0.7215686, 0, 1,
-1.139128, -0.4229218, -2.116963, 1, 0.7254902, 0, 1,
-1.133907, -1.614775, -1.609908, 1, 0.7333333, 0, 1,
-1.132733, 0.9621069, -0.5362616, 1, 0.7372549, 0, 1,
-1.127365, 0.04576639, -2.612503, 1, 0.7450981, 0, 1,
-1.127119, 0.9884033, -2.458113, 1, 0.7490196, 0, 1,
-1.126542, 1.20448, -1.552902, 1, 0.7568628, 0, 1,
-1.122454, -0.6366678, -0.925809, 1, 0.7607843, 0, 1,
-1.121164, 1.049695, -0.8303003, 1, 0.7686275, 0, 1,
-1.111477, -0.109436, -2.643439, 1, 0.772549, 0, 1,
-1.099559, -1.355549, -2.355678, 1, 0.7803922, 0, 1,
-1.098958, 0.07759104, -2.423882, 1, 0.7843137, 0, 1,
-1.09864, 0.796064, 0.5262372, 1, 0.7921569, 0, 1,
-1.093523, 1.194415, -1.463081, 1, 0.7960784, 0, 1,
-1.08809, 2.260561, -0.6280223, 1, 0.8039216, 0, 1,
-1.084643, -0.503006, -2.03138, 1, 0.8117647, 0, 1,
-1.07692, -1.964715, -2.581786, 1, 0.8156863, 0, 1,
-1.075439, -0.8267979, -0.7198531, 1, 0.8235294, 0, 1,
-1.07192, 0.9261023, -0.7882765, 1, 0.827451, 0, 1,
-1.071001, -0.04105059, -2.279, 1, 0.8352941, 0, 1,
-1.070292, 0.05965048, -2.843465, 1, 0.8392157, 0, 1,
-1.066085, 1.37266, -0.8642009, 1, 0.8470588, 0, 1,
-1.05283, -0.3291861, -0.1335873, 1, 0.8509804, 0, 1,
-1.049799, 1.710096, -0.6091588, 1, 0.8588235, 0, 1,
-1.038948, 0.4075733, -0.2458432, 1, 0.8627451, 0, 1,
-1.032542, -0.782052, -1.813741, 1, 0.8705882, 0, 1,
-1.027936, 1.372385, -0.6602494, 1, 0.8745098, 0, 1,
-1.012325, -0.08905071, -2.190598, 1, 0.8823529, 0, 1,
-1.009322, 1.55955, -1.753997, 1, 0.8862745, 0, 1,
-1.005453, -1.71987, -3.144513, 1, 0.8941177, 0, 1,
-1.005044, 1.106996, -1.723441, 1, 0.8980392, 0, 1,
-1.004233, 0.7037075, 0.1429002, 1, 0.9058824, 0, 1,
-1.002848, 1.133848, -1.445546, 1, 0.9137255, 0, 1,
-0.9991866, 0.436563, -0.8268527, 1, 0.9176471, 0, 1,
-0.9953119, -1.76367, -2.79784, 1, 0.9254902, 0, 1,
-0.9948255, -1.000818, -1.598557, 1, 0.9294118, 0, 1,
-0.9807907, -0.7181584, -2.802351, 1, 0.9372549, 0, 1,
-0.9801224, -1.468487, -2.927423, 1, 0.9411765, 0, 1,
-0.9672283, -0.6366807, -2.413578, 1, 0.9490196, 0, 1,
-0.9669013, 0.8775977, -0.9773309, 1, 0.9529412, 0, 1,
-0.9643627, 0.9037942, -0.3760296, 1, 0.9607843, 0, 1,
-0.9525197, 0.1509531, -1.961709, 1, 0.9647059, 0, 1,
-0.9496749, 0.2764263, -2.314626, 1, 0.972549, 0, 1,
-0.9489582, -1.643462, -5.706654, 1, 0.9764706, 0, 1,
-0.9477219, 0.1354101, -2.838294, 1, 0.9843137, 0, 1,
-0.9378216, 0.1095603, -2.207909, 1, 0.9882353, 0, 1,
-0.9355527, 0.215227, -1.652894, 1, 0.9960784, 0, 1,
-0.9319984, -0.5291957, -2.399977, 0.9960784, 1, 0, 1,
-0.9316069, -0.3280089, -1.759106, 0.9921569, 1, 0, 1,
-0.9303998, 0.5612574, -0.8487499, 0.9843137, 1, 0, 1,
-0.9249374, -0.115493, -0.8799561, 0.9803922, 1, 0, 1,
-0.9218926, 0.9597431, -2.028594, 0.972549, 1, 0, 1,
-0.9173104, 0.2440646, -0.07930142, 0.9686275, 1, 0, 1,
-0.9119166, 0.9231322, 0.7255465, 0.9607843, 1, 0, 1,
-0.9083064, 0.3340448, -2.117145, 0.9568627, 1, 0, 1,
-0.8993547, -1.035448, -1.589867, 0.9490196, 1, 0, 1,
-0.8979703, -0.6953428, -2.830887, 0.945098, 1, 0, 1,
-0.8846967, 0.8788592, -0.3363615, 0.9372549, 1, 0, 1,
-0.883809, 2.418276, 1.443851, 0.9333333, 1, 0, 1,
-0.8777421, -0.0007998949, -0.313535, 0.9254902, 1, 0, 1,
-0.8764985, -0.2772542, -1.583554, 0.9215686, 1, 0, 1,
-0.8757082, -1.146109, -2.629923, 0.9137255, 1, 0, 1,
-0.8684547, -0.06305137, -0.03439254, 0.9098039, 1, 0, 1,
-0.8626094, -1.068602, -1.415198, 0.9019608, 1, 0, 1,
-0.8621264, -0.9494159, -2.4045, 0.8941177, 1, 0, 1,
-0.8618623, -0.5906603, -2.393904, 0.8901961, 1, 0, 1,
-0.8539088, 0.5534011, -1.473101, 0.8823529, 1, 0, 1,
-0.8469654, -0.6403872, -2.788302, 0.8784314, 1, 0, 1,
-0.8458015, -1.55384, -3.014581, 0.8705882, 1, 0, 1,
-0.8447015, 0.4362873, -1.975241, 0.8666667, 1, 0, 1,
-0.8406263, -0.9109423, -2.80481, 0.8588235, 1, 0, 1,
-0.8363397, 2.0649, -0.4774809, 0.854902, 1, 0, 1,
-0.8356194, -0.2440539, -2.922056, 0.8470588, 1, 0, 1,
-0.8292974, 0.6974765, -0.2956528, 0.8431373, 1, 0, 1,
-0.8234528, -1.998098, -2.482421, 0.8352941, 1, 0, 1,
-0.8220927, 1.35538, -0.2240185, 0.8313726, 1, 0, 1,
-0.8208923, 1.499753, -1.469871, 0.8235294, 1, 0, 1,
-0.8192859, -0.2707657, -1.436493, 0.8196079, 1, 0, 1,
-0.8178756, -0.8554751, -2.779063, 0.8117647, 1, 0, 1,
-0.8141446, 0.9996426, -0.4760145, 0.8078431, 1, 0, 1,
-0.8093015, -0.8344945, -2.209749, 0.8, 1, 0, 1,
-0.8046616, -1.868281, -3.910744, 0.7921569, 1, 0, 1,
-0.7978946, -0.9960463, -2.047855, 0.7882353, 1, 0, 1,
-0.791963, 0.5442755, -2.367072, 0.7803922, 1, 0, 1,
-0.7808567, 1.599376, 1.446163, 0.7764706, 1, 0, 1,
-0.7796678, -0.437536, -1.270685, 0.7686275, 1, 0, 1,
-0.7791623, -0.3680475, -2.185895, 0.7647059, 1, 0, 1,
-0.7790952, -0.4377803, -2.517377, 0.7568628, 1, 0, 1,
-0.7772013, -0.3631999, -4.248523, 0.7529412, 1, 0, 1,
-0.776538, -0.816672, -1.749502, 0.7450981, 1, 0, 1,
-0.7752098, -2.395698, -3.501145, 0.7411765, 1, 0, 1,
-0.7751404, 0.9933065, -0.6889959, 0.7333333, 1, 0, 1,
-0.7727145, -0.9677193, -1.375212, 0.7294118, 1, 0, 1,
-0.7711502, 0.1545913, -1.595002, 0.7215686, 1, 0, 1,
-0.7658169, 0.4478628, 0.2100182, 0.7176471, 1, 0, 1,
-0.7639662, 1.795412, -1.261275, 0.7098039, 1, 0, 1,
-0.7592937, 0.4192738, -1.559012, 0.7058824, 1, 0, 1,
-0.7576551, -0.03625849, -1.904361, 0.6980392, 1, 0, 1,
-0.7559525, -0.02971214, -1.198312, 0.6901961, 1, 0, 1,
-0.7558084, -0.9387221, -1.964031, 0.6862745, 1, 0, 1,
-0.7496179, 0.7464281, -0.4405901, 0.6784314, 1, 0, 1,
-0.7442027, 0.2687573, -1.679572, 0.6745098, 1, 0, 1,
-0.7383584, 1.209351, -0.3842635, 0.6666667, 1, 0, 1,
-0.7330484, -0.3218507, -0.3504935, 0.6627451, 1, 0, 1,
-0.7286726, -1.04733, -3.631202, 0.654902, 1, 0, 1,
-0.7266479, -1.186682, -2.17138, 0.6509804, 1, 0, 1,
-0.7253439, 2.833123, 0.1563142, 0.6431373, 1, 0, 1,
-0.7156115, 1.112865, -0.3219167, 0.6392157, 1, 0, 1,
-0.7142906, 0.8116406, -2.955061, 0.6313726, 1, 0, 1,
-0.7122396, -0.3178045, -1.930014, 0.627451, 1, 0, 1,
-0.7081316, 0.8288605, -0.3937674, 0.6196079, 1, 0, 1,
-0.7063845, 0.6450787, -0.1811553, 0.6156863, 1, 0, 1,
-0.7054901, -0.4826442, -3.603173, 0.6078432, 1, 0, 1,
-0.7053109, -0.8512363, -1.489283, 0.6039216, 1, 0, 1,
-0.7049623, -0.2029572, -2.829286, 0.5960785, 1, 0, 1,
-0.7045227, -0.1817902, -0.2573974, 0.5882353, 1, 0, 1,
-0.7031863, 1.192118, -0.2606004, 0.5843138, 1, 0, 1,
-0.6980885, 0.7383272, -0.3018267, 0.5764706, 1, 0, 1,
-0.6961203, -0.4105108, -2.351858, 0.572549, 1, 0, 1,
-0.6946478, 1.22579, -1.412781, 0.5647059, 1, 0, 1,
-0.6925404, -0.6645615, -1.627496, 0.5607843, 1, 0, 1,
-0.6916766, 0.1953779, -1.738754, 0.5529412, 1, 0, 1,
-0.6874585, 0.387924, -0.5707078, 0.5490196, 1, 0, 1,
-0.6843902, 0.946259, -0.5094262, 0.5411765, 1, 0, 1,
-0.6827439, -0.2983211, -3.325155, 0.5372549, 1, 0, 1,
-0.6823524, 0.5606694, -2.609377, 0.5294118, 1, 0, 1,
-0.6748877, -0.2470398, -2.500204, 0.5254902, 1, 0, 1,
-0.6689165, 0.4651395, -1.714147, 0.5176471, 1, 0, 1,
-0.6623898, -0.8169107, -2.700388, 0.5137255, 1, 0, 1,
-0.6617849, -0.6205218, -0.7398543, 0.5058824, 1, 0, 1,
-0.6572384, 0.1743266, -0.616007, 0.5019608, 1, 0, 1,
-0.6547492, 1.15455, -1.18441, 0.4941176, 1, 0, 1,
-0.6533986, -1.577421, -1.906417, 0.4862745, 1, 0, 1,
-0.6477973, 0.1382176, -1.707004, 0.4823529, 1, 0, 1,
-0.6471505, -0.4161434, -1.11196, 0.4745098, 1, 0, 1,
-0.6444224, 0.8060053, -1.522628, 0.4705882, 1, 0, 1,
-0.6424778, -1.148855, -1.425099, 0.4627451, 1, 0, 1,
-0.6388772, -0.727341, -1.343007, 0.4588235, 1, 0, 1,
-0.6383395, -2.206466, -3.168296, 0.4509804, 1, 0, 1,
-0.6368474, 0.399727, 0.06156736, 0.4470588, 1, 0, 1,
-0.6325005, 1.348331, -0.9941085, 0.4392157, 1, 0, 1,
-0.6302246, -1.091315, -2.614865, 0.4352941, 1, 0, 1,
-0.6254001, -0.5677739, -2.508175, 0.427451, 1, 0, 1,
-0.6196101, -0.1801358, -0.2454626, 0.4235294, 1, 0, 1,
-0.6176023, -1.179515, -2.981516, 0.4156863, 1, 0, 1,
-0.6148274, -1.079103, -3.166087, 0.4117647, 1, 0, 1,
-0.6147889, -0.4684539, -2.916009, 0.4039216, 1, 0, 1,
-0.6136451, -0.7180097, -3.745385, 0.3960784, 1, 0, 1,
-0.6094579, 0.8626478, -1.798335, 0.3921569, 1, 0, 1,
-0.6053128, -0.4036193, -1.762159, 0.3843137, 1, 0, 1,
-0.6022763, 0.6801836, 1.052083, 0.3803922, 1, 0, 1,
-0.596229, -0.1319756, -1.370465, 0.372549, 1, 0, 1,
-0.5926146, -1.621827, -1.796551, 0.3686275, 1, 0, 1,
-0.5916833, 1.211059, 0.8258142, 0.3607843, 1, 0, 1,
-0.5873643, 0.3403322, -0.3016728, 0.3568628, 1, 0, 1,
-0.5814095, 0.5751778, -0.3585704, 0.3490196, 1, 0, 1,
-0.5798459, 1.962319, 0.05111621, 0.345098, 1, 0, 1,
-0.5782705, -0.2300956, -1.992842, 0.3372549, 1, 0, 1,
-0.5643589, -1.330069, -1.586907, 0.3333333, 1, 0, 1,
-0.5600002, -0.2588523, -3.980644, 0.3254902, 1, 0, 1,
-0.5525487, -1.58186, -1.693152, 0.3215686, 1, 0, 1,
-0.5474777, 0.28049, -0.398551, 0.3137255, 1, 0, 1,
-0.5444035, 0.1369971, -2.369736, 0.3098039, 1, 0, 1,
-0.5431128, -0.01962499, -2.728524, 0.3019608, 1, 0, 1,
-0.5403957, 1.656988, 0.4756744, 0.2941177, 1, 0, 1,
-0.5395516, -0.03099994, -1.783391, 0.2901961, 1, 0, 1,
-0.5384671, -0.4137218, -0.9698171, 0.282353, 1, 0, 1,
-0.5350461, 1.84331, -1.268402, 0.2784314, 1, 0, 1,
-0.5348188, 0.5092593, -0.06218236, 0.2705882, 1, 0, 1,
-0.5328727, -1.083712, -2.134847, 0.2666667, 1, 0, 1,
-0.5243471, -0.5122755, -3.704946, 0.2588235, 1, 0, 1,
-0.5227677, 0.1969162, -3.886944, 0.254902, 1, 0, 1,
-0.52074, 1.721364, -1.644815, 0.2470588, 1, 0, 1,
-0.518463, 1.75066, -0.5107701, 0.2431373, 1, 0, 1,
-0.5159639, -0.1683292, -1.729899, 0.2352941, 1, 0, 1,
-0.5125057, 1.0776, -0.5330409, 0.2313726, 1, 0, 1,
-0.504023, -1.609754, -3.849907, 0.2235294, 1, 0, 1,
-0.4991092, -0.6450177, -2.605995, 0.2196078, 1, 0, 1,
-0.4990081, 0.7517872, -0.946348, 0.2117647, 1, 0, 1,
-0.4988003, 0.2954032, -2.062485, 0.2078431, 1, 0, 1,
-0.4968339, 0.4636935, -2.149195, 0.2, 1, 0, 1,
-0.4940433, -0.6801203, -3.718364, 0.1921569, 1, 0, 1,
-0.4930221, 0.1906709, -1.375573, 0.1882353, 1, 0, 1,
-0.4903451, -0.2381189, -1.215994, 0.1803922, 1, 0, 1,
-0.4894249, 0.2999519, -0.2560868, 0.1764706, 1, 0, 1,
-0.4876397, 0.9636251, -0.003838907, 0.1686275, 1, 0, 1,
-0.4830453, 1.247542, -0.09919604, 0.1647059, 1, 0, 1,
-0.4802205, -1.409919, -3.65338, 0.1568628, 1, 0, 1,
-0.4793612, 0.5550522, -0.2308718, 0.1529412, 1, 0, 1,
-0.475708, -0.3316848, -0.7834936, 0.145098, 1, 0, 1,
-0.4753327, -0.2108732, -1.522627, 0.1411765, 1, 0, 1,
-0.4723809, -0.7208782, -1.840349, 0.1333333, 1, 0, 1,
-0.470318, -1.093665, -2.66979, 0.1294118, 1, 0, 1,
-0.4699635, -0.4076524, -1.811256, 0.1215686, 1, 0, 1,
-0.4698074, -2.435312, -2.708073, 0.1176471, 1, 0, 1,
-0.4667051, 0.7271006, -0.8292527, 0.1098039, 1, 0, 1,
-0.4626286, -2.330108, -2.339687, 0.1058824, 1, 0, 1,
-0.4545211, -0.007363554, -2.753993, 0.09803922, 1, 0, 1,
-0.4506094, 0.3110599, -2.936611, 0.09019608, 1, 0, 1,
-0.4434426, -0.7045442, -2.140093, 0.08627451, 1, 0, 1,
-0.4424018, 0.7397344, -1.099531, 0.07843138, 1, 0, 1,
-0.4415604, 2.265011, 0.8913985, 0.07450981, 1, 0, 1,
-0.4410142, -0.01103586, -0.7047815, 0.06666667, 1, 0, 1,
-0.438204, 0.308917, -0.8254807, 0.0627451, 1, 0, 1,
-0.4346278, 0.3272213, -0.3539756, 0.05490196, 1, 0, 1,
-0.4301359, -0.05836705, -2.845814, 0.05098039, 1, 0, 1,
-0.4222048, 0.6264299, -0.9988423, 0.04313726, 1, 0, 1,
-0.4183948, 2.098749, -2.002999, 0.03921569, 1, 0, 1,
-0.4165301, -0.7336156, -2.158196, 0.03137255, 1, 0, 1,
-0.4163437, -0.3208087, -2.845631, 0.02745098, 1, 0, 1,
-0.4138532, -0.5480794, -2.553426, 0.01960784, 1, 0, 1,
-0.4137117, 2.152188, -0.5212392, 0.01568628, 1, 0, 1,
-0.4108048, -1.146409, -3.384175, 0.007843138, 1, 0, 1,
-0.4020737, -1.129211, -3.678, 0.003921569, 1, 0, 1,
-0.3997919, 2.045833, -2.05363, 0, 1, 0.003921569, 1,
-0.3986372, 0.6422787, -1.247916, 0, 1, 0.01176471, 1,
-0.3981462, 0.6227569, -1.399222, 0, 1, 0.01568628, 1,
-0.3972189, 0.4712986, -3.431662, 0, 1, 0.02352941, 1,
-0.3947863, -0.8881658, -3.164648, 0, 1, 0.02745098, 1,
-0.3874584, -0.9169296, -0.2667702, 0, 1, 0.03529412, 1,
-0.3865774, -0.3926446, -2.621156, 0, 1, 0.03921569, 1,
-0.3863409, 0.4048011, -1.324088, 0, 1, 0.04705882, 1,
-0.3844794, -0.5081341, -4.445025, 0, 1, 0.05098039, 1,
-0.3840013, 2.138772, -1.285837, 0, 1, 0.05882353, 1,
-0.3774391, 1.179843, 0.2379997, 0, 1, 0.0627451, 1,
-0.3766452, -1.090753, -2.803177, 0, 1, 0.07058824, 1,
-0.3760879, 0.9458026, 1.415472, 0, 1, 0.07450981, 1,
-0.3748012, -1.053064, -3.37797, 0, 1, 0.08235294, 1,
-0.3734935, 0.6155021, -3.016237, 0, 1, 0.08627451, 1,
-0.3727145, 1.700879, -1.669131, 0, 1, 0.09411765, 1,
-0.372223, 1.388243, 1.433861, 0, 1, 0.1019608, 1,
-0.3667155, -0.07437631, -0.9877351, 0, 1, 0.1058824, 1,
-0.3660968, 0.7128986, 0.2225807, 0, 1, 0.1137255, 1,
-0.3602028, 1.209264, -0.9117831, 0, 1, 0.1176471, 1,
-0.3578781, -0.5316064, -3.237682, 0, 1, 0.1254902, 1,
-0.3540839, 0.3648346, -1.59538, 0, 1, 0.1294118, 1,
-0.3536898, 0.1346032, 0.2030856, 0, 1, 0.1372549, 1,
-0.3528557, 0.7526295, 0.5824457, 0, 1, 0.1411765, 1,
-0.3522895, -0.7503002, -3.533794, 0, 1, 0.1490196, 1,
-0.3519408, -1.463715, -2.693392, 0, 1, 0.1529412, 1,
-0.3515263, -0.6839227, -2.770651, 0, 1, 0.1607843, 1,
-0.3505113, -0.3546405, -3.435143, 0, 1, 0.1647059, 1,
-0.3502864, 0.9614589, 0.7250216, 0, 1, 0.172549, 1,
-0.3486888, 0.7461472, 0.09055378, 0, 1, 0.1764706, 1,
-0.3485807, 1.398001, -0.7532881, 0, 1, 0.1843137, 1,
-0.3484072, -1.365465, -0.5088517, 0, 1, 0.1882353, 1,
-0.3479834, 0.9812427, -0.08348083, 0, 1, 0.1960784, 1,
-0.3455298, -0.4820765, -2.989937, 0, 1, 0.2039216, 1,
-0.3402339, -1.153333, -2.329816, 0, 1, 0.2078431, 1,
-0.3384191, 0.1129119, -1.298715, 0, 1, 0.2156863, 1,
-0.3377434, -0.2778326, 0.7315221, 0, 1, 0.2196078, 1,
-0.3371299, 2.884708, -1.05636, 0, 1, 0.227451, 1,
-0.3320522, -1.289666, -2.320732, 0, 1, 0.2313726, 1,
-0.3319269, 1.012001, 0.4803001, 0, 1, 0.2392157, 1,
-0.3285432, 1.214698, -1.477558, 0, 1, 0.2431373, 1,
-0.3280873, 1.69708, -0.660361, 0, 1, 0.2509804, 1,
-0.3277001, 1.026916, -1.399098, 0, 1, 0.254902, 1,
-0.3243392, 0.3882457, -0.3259919, 0, 1, 0.2627451, 1,
-0.3239629, -0.2518949, -2.905609, 0, 1, 0.2666667, 1,
-0.3053008, -1.327641, -3.037896, 0, 1, 0.2745098, 1,
-0.3032134, -0.1312018, -2.731283, 0, 1, 0.2784314, 1,
-0.2968372, -0.3357913, -1.619092, 0, 1, 0.2862745, 1,
-0.2964288, 0.3732724, -0.6582674, 0, 1, 0.2901961, 1,
-0.2935628, -1.077293, -3.793167, 0, 1, 0.2980392, 1,
-0.2891206, -2.95182, -3.921263, 0, 1, 0.3058824, 1,
-0.2888319, -1.757392, -1.688284, 0, 1, 0.3098039, 1,
-0.2869053, -0.8047842, -3.227779, 0, 1, 0.3176471, 1,
-0.2841449, 0.412559, -1.185757, 0, 1, 0.3215686, 1,
-0.2839577, -0.02623613, -1.321726, 0, 1, 0.3294118, 1,
-0.2838178, -0.06247409, -1.754179, 0, 1, 0.3333333, 1,
-0.2816464, -0.2114633, -3.25694, 0, 1, 0.3411765, 1,
-0.2794222, 0.02320965, 0.3644839, 0, 1, 0.345098, 1,
-0.2789493, -0.5807748, -2.731042, 0, 1, 0.3529412, 1,
-0.2780795, 0.5466206, -0.1222614, 0, 1, 0.3568628, 1,
-0.2769797, -1.359718, -4.339647, 0, 1, 0.3647059, 1,
-0.2738575, 1.38964, -0.3799261, 0, 1, 0.3686275, 1,
-0.2723752, -0.1088236, -0.8092901, 0, 1, 0.3764706, 1,
-0.2700884, 1.884959, 0.7897041, 0, 1, 0.3803922, 1,
-0.2698794, -0.487076, -1.655, 0, 1, 0.3882353, 1,
-0.2663945, 1.322073, 0.4114711, 0, 1, 0.3921569, 1,
-0.266007, 0.007579995, -1.384135, 0, 1, 0.4, 1,
-0.2657175, 0.03221722, -2.457914, 0, 1, 0.4078431, 1,
-0.2641341, 0.1691397, -1.966245, 0, 1, 0.4117647, 1,
-0.2639641, -1.056209, -2.612869, 0, 1, 0.4196078, 1,
-0.2631108, -1.233149, -3.277611, 0, 1, 0.4235294, 1,
-0.2589809, -1.916249, -2.228242, 0, 1, 0.4313726, 1,
-0.2502913, 1.392597, 0.3550734, 0, 1, 0.4352941, 1,
-0.2502486, 0.01246879, -2.183263, 0, 1, 0.4431373, 1,
-0.2492365, -0.255927, -2.288787, 0, 1, 0.4470588, 1,
-0.248064, -1.088613, -3.543252, 0, 1, 0.454902, 1,
-0.2479618, 1.899131, -0.3174866, 0, 1, 0.4588235, 1,
-0.2475514, 0.4387058, -1.407492, 0, 1, 0.4666667, 1,
-0.2462789, 2.255074, -1.791668, 0, 1, 0.4705882, 1,
-0.2453553, 0.4598089, -0.3818421, 0, 1, 0.4784314, 1,
-0.2426705, 0.0966212, -2.096815, 0, 1, 0.4823529, 1,
-0.2412552, 0.4152011, -0.2826212, 0, 1, 0.4901961, 1,
-0.2396393, 1.32179, 1.497656, 0, 1, 0.4941176, 1,
-0.2370306, 0.1033512, -2.1674, 0, 1, 0.5019608, 1,
-0.236467, 0.1052516, -0.4869441, 0, 1, 0.509804, 1,
-0.2355091, 0.4239863, -1.658563, 0, 1, 0.5137255, 1,
-0.2354679, -1.382617, -1.364958, 0, 1, 0.5215687, 1,
-0.2311387, 0.3437045, -1.432532, 0, 1, 0.5254902, 1,
-0.2296883, -0.7561689, -2.512244, 0, 1, 0.5333334, 1,
-0.2281457, -0.5007458, -2.420409, 0, 1, 0.5372549, 1,
-0.2262876, 2.397475, -0.2911809, 0, 1, 0.5450981, 1,
-0.2259716, 1.294201, 1.388446, 0, 1, 0.5490196, 1,
-0.2226436, 0.05496961, -1.979074, 0, 1, 0.5568628, 1,
-0.2133125, -0.3743406, -1.155249, 0, 1, 0.5607843, 1,
-0.2129954, 1.58143, -0.319196, 0, 1, 0.5686275, 1,
-0.2118379, 0.5774707, -2.74562, 0, 1, 0.572549, 1,
-0.2084241, -0.1469758, -2.020482, 0, 1, 0.5803922, 1,
-0.2071799, 1.161239, 0.109449, 0, 1, 0.5843138, 1,
-0.2068669, -0.05720158, -2.932487, 0, 1, 0.5921569, 1,
-0.2053493, -0.6137871, -3.137419, 0, 1, 0.5960785, 1,
-0.2026123, -0.3362484, -3.316542, 0, 1, 0.6039216, 1,
-0.1831356, 0.2987892, -0.06459629, 0, 1, 0.6117647, 1,
-0.1791777, -0.03019206, -2.113518, 0, 1, 0.6156863, 1,
-0.178906, 0.4213844, -1.958971, 0, 1, 0.6235294, 1,
-0.1762714, 1.203749, 1.245652, 0, 1, 0.627451, 1,
-0.1714571, -0.4291405, -3.520898, 0, 1, 0.6352941, 1,
-0.1691086, 0.2169667, -1.475199, 0, 1, 0.6392157, 1,
-0.1688076, 1.710753, 0.4873142, 0, 1, 0.6470588, 1,
-0.1658582, 0.1160652, -0.450727, 0, 1, 0.6509804, 1,
-0.160935, 1.89597, -0.06650164, 0, 1, 0.6588235, 1,
-0.1572904, 1.172303, 0.10255, 0, 1, 0.6627451, 1,
-0.1570966, -2.274865, -4.547668, 0, 1, 0.6705883, 1,
-0.1534357, 0.6905791, 1.368652, 0, 1, 0.6745098, 1,
-0.1423054, -1.236508, -4.533807, 0, 1, 0.682353, 1,
-0.1365849, -1.461518, -3.634504, 0, 1, 0.6862745, 1,
-0.135609, -0.932853, -0.7800158, 0, 1, 0.6941177, 1,
-0.1340605, 1.509473, -0.4095647, 0, 1, 0.7019608, 1,
-0.1312035, 1.180219, 1.214699, 0, 1, 0.7058824, 1,
-0.1261484, -1.203019, -2.636197, 0, 1, 0.7137255, 1,
-0.1251944, -1.284825, -4.194093, 0, 1, 0.7176471, 1,
-0.1247832, -0.5578359, -1.290176, 0, 1, 0.7254902, 1,
-0.1047055, 0.1594895, -1.493709, 0, 1, 0.7294118, 1,
-0.1030495, 1.252019, 0.09509037, 0, 1, 0.7372549, 1,
-0.1016811, 0.06115488, -1.618615, 0, 1, 0.7411765, 1,
-0.09281424, 0.007457986, -2.681693, 0, 1, 0.7490196, 1,
-0.0906223, -0.01315658, -1.799109, 0, 1, 0.7529412, 1,
-0.0901271, 0.4836384, -0.6230711, 0, 1, 0.7607843, 1,
-0.0900796, 0.2508875, 1.664098, 0, 1, 0.7647059, 1,
-0.08333569, 0.08894669, -0.7680098, 0, 1, 0.772549, 1,
-0.0818847, -0.2266839, -2.453648, 0, 1, 0.7764706, 1,
-0.08136269, 0.6606328, 1.522807, 0, 1, 0.7843137, 1,
-0.07404337, 1.561356, 0.357019, 0, 1, 0.7882353, 1,
-0.0694056, -0.09441399, -1.340845, 0, 1, 0.7960784, 1,
-0.0685266, -1.232281, -4.693449, 0, 1, 0.8039216, 1,
-0.06475799, -0.1990512, -1.569145, 0, 1, 0.8078431, 1,
-0.06460737, 0.3209745, -0.7947185, 0, 1, 0.8156863, 1,
-0.06121147, 1.356079, -0.5185767, 0, 1, 0.8196079, 1,
-0.05861583, -0.6753787, -0.5157013, 0, 1, 0.827451, 1,
-0.05687909, 1.093507, -0.7568198, 0, 1, 0.8313726, 1,
-0.05644169, 1.663949, 0.562046, 0, 1, 0.8392157, 1,
-0.05005218, -0.7997089, -1.843675, 0, 1, 0.8431373, 1,
-0.04716306, -1.251254, -2.325055, 0, 1, 0.8509804, 1,
-0.0470286, -0.5272284, -1.776631, 0, 1, 0.854902, 1,
-0.04619241, 0.2565831, 0.3308434, 0, 1, 0.8627451, 1,
-0.04592416, -1.286172, -4.765323, 0, 1, 0.8666667, 1,
-0.04488729, 1.387706, -0.8563897, 0, 1, 0.8745098, 1,
-0.04095236, 0.6344966, -0.6877515, 0, 1, 0.8784314, 1,
-0.03897755, -0.24741, -2.424327, 0, 1, 0.8862745, 1,
-0.03890212, 0.4624258, -1.220008, 0, 1, 0.8901961, 1,
-0.03792359, 2.016733, 0.8750283, 0, 1, 0.8980392, 1,
-0.03530493, -0.2583195, -2.825251, 0, 1, 0.9058824, 1,
-0.0312628, 0.1782454, -2.314816, 0, 1, 0.9098039, 1,
-0.02896111, 0.6863436, -0.4055343, 0, 1, 0.9176471, 1,
-0.02880085, -0.9509579, -4.613471, 0, 1, 0.9215686, 1,
-0.02848328, 1.529328, 0.08894341, 0, 1, 0.9294118, 1,
-0.02719142, -2.410116, -2.677612, 0, 1, 0.9333333, 1,
-0.02570205, 0.4105996, 0.5354439, 0, 1, 0.9411765, 1,
-0.02186093, 1.681191, -2.392891, 0, 1, 0.945098, 1,
-0.01379038, -0.3367452, -2.883396, 0, 1, 0.9529412, 1,
-0.0118575, 0.1441992, 1.052874, 0, 1, 0.9568627, 1,
-0.01018523, -0.2453912, -1.872571, 0, 1, 0.9647059, 1,
-0.009797676, -0.8720322, -5.230983, 0, 1, 0.9686275, 1,
-0.008677443, -0.3882933, -3.369388, 0, 1, 0.9764706, 1,
-0.007803066, -0.4629706, -1.880161, 0, 1, 0.9803922, 1,
0.001203375, 0.1944909, 1.760226, 0, 1, 0.9882353, 1,
0.00326708, -1.16512, 1.232912, 0, 1, 0.9921569, 1,
0.004950202, -1.153267, 4.01377, 0, 1, 1, 1,
0.006080037, -0.2735175, 1.871029, 0, 0.9921569, 1, 1,
0.007545684, -1.669597, 2.537602, 0, 0.9882353, 1, 1,
0.008345087, -0.6175728, 3.940234, 0, 0.9803922, 1, 1,
0.009766408, -0.8621755, 2.298284, 0, 0.9764706, 1, 1,
0.0103431, 0.9662628, 1.190715, 0, 0.9686275, 1, 1,
0.01320165, -0.6836281, 3.927145, 0, 0.9647059, 1, 1,
0.01573752, -0.6487759, 3.35162, 0, 0.9568627, 1, 1,
0.01610921, 0.7492674, -2.320781, 0, 0.9529412, 1, 1,
0.01731325, -1.540082, 0.6872932, 0, 0.945098, 1, 1,
0.0173831, -0.6723354, 4.846831, 0, 0.9411765, 1, 1,
0.0208983, -0.9158564, 2.52301, 0, 0.9333333, 1, 1,
0.02168007, 1.999331, 0.5707632, 0, 0.9294118, 1, 1,
0.0224393, 1.062189, -0.882817, 0, 0.9215686, 1, 1,
0.02360993, 1.283278, 2.336704, 0, 0.9176471, 1, 1,
0.02399683, 0.4642942, -0.1591569, 0, 0.9098039, 1, 1,
0.02534356, 1.9912, 2.43475, 0, 0.9058824, 1, 1,
0.02759566, -0.8070484, 2.613998, 0, 0.8980392, 1, 1,
0.02899392, 0.7222761, -0.8540406, 0, 0.8901961, 1, 1,
0.03827719, -0.8121294, 2.731848, 0, 0.8862745, 1, 1,
0.03993044, -0.7418489, 3.43763, 0, 0.8784314, 1, 1,
0.04044932, 1.290232, -0.4448754, 0, 0.8745098, 1, 1,
0.04227408, -0.2348816, 3.680691, 0, 0.8666667, 1, 1,
0.04320608, -0.02451312, -0.8404254, 0, 0.8627451, 1, 1,
0.04391682, -0.452867, 1.437501, 0, 0.854902, 1, 1,
0.04717254, -0.8714681, 2.866994, 0, 0.8509804, 1, 1,
0.05031263, 1.074487, 0.1583559, 0, 0.8431373, 1, 1,
0.0533308, -0.4611524, 2.799893, 0, 0.8392157, 1, 1,
0.05704113, -1.145774, 4.504073, 0, 0.8313726, 1, 1,
0.05820299, -0.7026444, 4.428349, 0, 0.827451, 1, 1,
0.05926683, 1.822788, 0.142138, 0, 0.8196079, 1, 1,
0.0620455, -1.11874, 4.394791, 0, 0.8156863, 1, 1,
0.06688964, 1.045494, 0.1299026, 0, 0.8078431, 1, 1,
0.06766623, 0.772778, -0.5218286, 0, 0.8039216, 1, 1,
0.06935206, 0.7387401, -1.326802, 0, 0.7960784, 1, 1,
0.07202909, -0.8761659, 3.493453, 0, 0.7882353, 1, 1,
0.07603499, -1.576704, 3.333822, 0, 0.7843137, 1, 1,
0.0762019, 0.884883, 0.5128551, 0, 0.7764706, 1, 1,
0.07680077, -1.560502, 3.316387, 0, 0.772549, 1, 1,
0.0772587, -0.1106003, 3.253424, 0, 0.7647059, 1, 1,
0.07855958, 0.3576068, 1.35519, 0, 0.7607843, 1, 1,
0.07868344, -0.943295, 2.708094, 0, 0.7529412, 1, 1,
0.0861683, -0.2050424, 3.445096, 0, 0.7490196, 1, 1,
0.08975934, -0.3381222, 1.682611, 0, 0.7411765, 1, 1,
0.09016082, 0.1947204, 1.825374, 0, 0.7372549, 1, 1,
0.09211928, 0.1873876, -0.2245921, 0, 0.7294118, 1, 1,
0.09576605, -1.06975, 3.216952, 0, 0.7254902, 1, 1,
0.09634442, -0.4757892, 4.483797, 0, 0.7176471, 1, 1,
0.0964966, -0.256474, 4.650541, 0, 0.7137255, 1, 1,
0.09696131, -0.2203258, 3.64394, 0, 0.7058824, 1, 1,
0.09993572, -0.396099, 4.574645, 0, 0.6980392, 1, 1,
0.1002387, 1.16753, 0.956275, 0, 0.6941177, 1, 1,
0.1020113, 1.406672, 2.596008, 0, 0.6862745, 1, 1,
0.1031102, 0.4972765, -0.09707516, 0, 0.682353, 1, 1,
0.1059365, 0.08200594, 2.285455, 0, 0.6745098, 1, 1,
0.1079078, -1.286706, 4.732761, 0, 0.6705883, 1, 1,
0.1104358, -1.521066, 2.722051, 0, 0.6627451, 1, 1,
0.115214, 0.6282459, 0.8839096, 0, 0.6588235, 1, 1,
0.1171744, 0.004067157, 2.075372, 0, 0.6509804, 1, 1,
0.1181647, -0.1761601, 2.21083, 0, 0.6470588, 1, 1,
0.1201428, 0.2201815, 0.8986307, 0, 0.6392157, 1, 1,
0.1238193, 0.6490267, 1.545087, 0, 0.6352941, 1, 1,
0.1246963, 0.05618224, 0.01633338, 0, 0.627451, 1, 1,
0.1271023, -0.7050356, 2.849896, 0, 0.6235294, 1, 1,
0.1373737, -0.9151411, 2.845307, 0, 0.6156863, 1, 1,
0.1384615, 0.664727, 2.530106, 0, 0.6117647, 1, 1,
0.1396415, 1.144917, -0.5207819, 0, 0.6039216, 1, 1,
0.1436408, -1.606561, 2.720755, 0, 0.5960785, 1, 1,
0.1487588, -0.3041445, 2.700481, 0, 0.5921569, 1, 1,
0.1509189, 0.503612, -0.3565288, 0, 0.5843138, 1, 1,
0.1538535, -1.885233, 3.413725, 0, 0.5803922, 1, 1,
0.1549402, -0.4886796, 2.17731, 0, 0.572549, 1, 1,
0.15624, 1.237225, 0.08964439, 0, 0.5686275, 1, 1,
0.161551, 0.1014199, 0.02444861, 0, 0.5607843, 1, 1,
0.1702961, -0.1605579, 4.35434, 0, 0.5568628, 1, 1,
0.1770256, -0.7984392, 1.766296, 0, 0.5490196, 1, 1,
0.1793153, 0.02223418, 2.251313, 0, 0.5450981, 1, 1,
0.1797278, 2.269409, 0.02325892, 0, 0.5372549, 1, 1,
0.1797665, 2.343208, -0.03203608, 0, 0.5333334, 1, 1,
0.192144, 0.4935874, 1.01147, 0, 0.5254902, 1, 1,
0.2019667, 0.5389208, 1.30354, 0, 0.5215687, 1, 1,
0.2023406, -0.2197218, 2.34921, 0, 0.5137255, 1, 1,
0.2034052, -0.8465603, 3.274337, 0, 0.509804, 1, 1,
0.2236662, 1.020748, 1.069709, 0, 0.5019608, 1, 1,
0.2286712, 0.6575367, -1.675206, 0, 0.4941176, 1, 1,
0.2377211, -1.384032, 4.002483, 0, 0.4901961, 1, 1,
0.2435895, -0.6751449, 0.9311933, 0, 0.4823529, 1, 1,
0.2444041, 1.137899, -0.3673151, 0, 0.4784314, 1, 1,
0.2487965, 0.7721257, 1.303213, 0, 0.4705882, 1, 1,
0.249162, 1.753142, -0.2082136, 0, 0.4666667, 1, 1,
0.2492355, -0.3562156, 3.509871, 0, 0.4588235, 1, 1,
0.2568028, -0.04414994, 0.6255961, 0, 0.454902, 1, 1,
0.2582804, 0.250312, 0.7494031, 0, 0.4470588, 1, 1,
0.2623783, 1.046482, 2.05557, 0, 0.4431373, 1, 1,
0.2640289, -0.9916636, 2.317787, 0, 0.4352941, 1, 1,
0.2669234, -0.5408508, 3.492484, 0, 0.4313726, 1, 1,
0.2715771, 0.2033816, -0.9117369, 0, 0.4235294, 1, 1,
0.2739087, 0.8387558, -0.0840154, 0, 0.4196078, 1, 1,
0.2780831, 0.2384974, 2.399548, 0, 0.4117647, 1, 1,
0.2786738, -0.1733181, 2.764554, 0, 0.4078431, 1, 1,
0.2787667, -0.2944723, 2.599825, 0, 0.4, 1, 1,
0.2826926, -0.9936242, 2.685401, 0, 0.3921569, 1, 1,
0.283359, -1.603948, 4.871603, 0, 0.3882353, 1, 1,
0.2866579, -2.28934, 2.847188, 0, 0.3803922, 1, 1,
0.2873541, -0.5229583, 3.418521, 0, 0.3764706, 1, 1,
0.28762, -0.9123777, 2.784891, 0, 0.3686275, 1, 1,
0.2903036, -0.1443482, 0.5491298, 0, 0.3647059, 1, 1,
0.2913369, 0.5836961, 0.6855548, 0, 0.3568628, 1, 1,
0.2991973, -2.874269, 3.807171, 0, 0.3529412, 1, 1,
0.2999228, 0.5428043, -0.3266091, 0, 0.345098, 1, 1,
0.3009726, 0.962685, 0.9272197, 0, 0.3411765, 1, 1,
0.301785, -1.740874, 3.104334, 0, 0.3333333, 1, 1,
0.3023741, 2.239539, -0.1409111, 0, 0.3294118, 1, 1,
0.3035748, -0.7018979, 3.117344, 0, 0.3215686, 1, 1,
0.3099971, 1.217313, 0.3576714, 0, 0.3176471, 1, 1,
0.3220586, 0.9961018, -1.591249, 0, 0.3098039, 1, 1,
0.3231001, 1.021821, 0.7516237, 0, 0.3058824, 1, 1,
0.3252919, 0.09225915, 1.493074, 0, 0.2980392, 1, 1,
0.3265642, -0.5041246, 3.576679, 0, 0.2901961, 1, 1,
0.3269666, -0.331179, 2.082878, 0, 0.2862745, 1, 1,
0.3332237, -1.06373, 2.951723, 0, 0.2784314, 1, 1,
0.3337413, -1.651096, 3.069417, 0, 0.2745098, 1, 1,
0.3350521, 0.2611453, 0.6919051, 0, 0.2666667, 1, 1,
0.3362026, 0.5893398, 0.6458259, 0, 0.2627451, 1, 1,
0.339173, -1.330968, 3.35925, 0, 0.254902, 1, 1,
0.339336, 1.413883, 1.948913, 0, 0.2509804, 1, 1,
0.3409584, -0.9782461, 1.660487, 0, 0.2431373, 1, 1,
0.3434857, -1.817608, 2.858455, 0, 0.2392157, 1, 1,
0.3439753, -0.8437602, 0.7467352, 0, 0.2313726, 1, 1,
0.3505365, 1.5154, -0.4766417, 0, 0.227451, 1, 1,
0.3530363, -0.7049475, 3.42736, 0, 0.2196078, 1, 1,
0.3558283, -0.5267773, 3.09754, 0, 0.2156863, 1, 1,
0.3680382, 0.5042088, 2.879844, 0, 0.2078431, 1, 1,
0.3686867, 0.1884963, -0.3202385, 0, 0.2039216, 1, 1,
0.3694837, 1.141158, 1.196245, 0, 0.1960784, 1, 1,
0.37568, 0.6396534, 1.329326, 0, 0.1882353, 1, 1,
0.3819051, -0.6468309, 3.585221, 0, 0.1843137, 1, 1,
0.3855194, -1.05548, 2.244167, 0, 0.1764706, 1, 1,
0.3885953, -0.8194221, 3.294883, 0, 0.172549, 1, 1,
0.3933721, -1.263747, 2.580602, 0, 0.1647059, 1, 1,
0.3993674, -1.175218, 2.651209, 0, 0.1607843, 1, 1,
0.403425, -1.234124, 1.661772, 0, 0.1529412, 1, 1,
0.4091231, 0.5577444, 1.673994, 0, 0.1490196, 1, 1,
0.415346, -0.1827316, 0.689842, 0, 0.1411765, 1, 1,
0.4162281, -0.5275804, 3.675891, 0, 0.1372549, 1, 1,
0.4170927, 1.147419, -0.7233788, 0, 0.1294118, 1, 1,
0.4172736, -0.2855086, 4.01379, 0, 0.1254902, 1, 1,
0.4177017, -1.537612, 3.64037, 0, 0.1176471, 1, 1,
0.4189658, -1.020443, 3.006618, 0, 0.1137255, 1, 1,
0.4195912, -0.5872553, 2.541782, 0, 0.1058824, 1, 1,
0.4200273, 2.069898, 0.960939, 0, 0.09803922, 1, 1,
0.4216365, 0.07290027, -0.1472783, 0, 0.09411765, 1, 1,
0.4218755, 0.2395614, 2.762126, 0, 0.08627451, 1, 1,
0.4231236, 1.026019, -1.542052, 0, 0.08235294, 1, 1,
0.4241485, 0.5856028, 1.837284, 0, 0.07450981, 1, 1,
0.4257224, -0.01377241, 2.155854, 0, 0.07058824, 1, 1,
0.4263395, 1.710229, -1.857965, 0, 0.0627451, 1, 1,
0.4321232, -0.254728, 3.44571, 0, 0.05882353, 1, 1,
0.4327801, -1.818705, 3.875018, 0, 0.05098039, 1, 1,
0.433077, -1.044995, 3.262477, 0, 0.04705882, 1, 1,
0.434857, 0.5229348, 1.01539, 0, 0.03921569, 1, 1,
0.4353678, 0.5844613, 0.3809474, 0, 0.03529412, 1, 1,
0.4366344, 0.02901615, 2.523594, 0, 0.02745098, 1, 1,
0.4373584, -1.355878, 3.721413, 0, 0.02352941, 1, 1,
0.4417066, -0.7990549, 3.356292, 0, 0.01568628, 1, 1,
0.444038, -0.3556674, 0.1631426, 0, 0.01176471, 1, 1,
0.4526319, -1.747333, 2.702551, 0, 0.003921569, 1, 1,
0.4555904, -0.4085328, 2.333305, 0.003921569, 0, 1, 1,
0.4558145, 2.452978, 0.01148091, 0.007843138, 0, 1, 1,
0.4566538, 0.8623877, -0.3106827, 0.01568628, 0, 1, 1,
0.4590798, 0.2202417, 1.149898, 0.01960784, 0, 1, 1,
0.4592174, -1.821577, 3.69766, 0.02745098, 0, 1, 1,
0.4654999, -1.075416, 3.056571, 0.03137255, 0, 1, 1,
0.4655488, -0.1824733, 1.908839, 0.03921569, 0, 1, 1,
0.4676034, -0.7482356, 2.642954, 0.04313726, 0, 1, 1,
0.4686561, -0.01964217, 1.765413, 0.05098039, 0, 1, 1,
0.4693959, -0.5275776, 3.999813, 0.05490196, 0, 1, 1,
0.470528, -1.60487, 4.393036, 0.0627451, 0, 1, 1,
0.4731611, 0.03006797, 0.8308234, 0.06666667, 0, 1, 1,
0.4768983, -0.6929215, 2.584392, 0.07450981, 0, 1, 1,
0.4835577, 1.001779, 0.4369741, 0.07843138, 0, 1, 1,
0.4838958, -0.6013209, 3.327176, 0.08627451, 0, 1, 1,
0.4878362, -1.459316, 3.462209, 0.09019608, 0, 1, 1,
0.4915578, 1.320145, 3.17222, 0.09803922, 0, 1, 1,
0.4983158, 0.6983545, 0.2428527, 0.1058824, 0, 1, 1,
0.4995696, 1.213382, -0.0311779, 0.1098039, 0, 1, 1,
0.501408, -0.4439611, 3.008021, 0.1176471, 0, 1, 1,
0.5060059, 0.2928011, -2.09852, 0.1215686, 0, 1, 1,
0.5170308, -0.1320039, 0.9481015, 0.1294118, 0, 1, 1,
0.5178291, -0.4454649, 3.769439, 0.1333333, 0, 1, 1,
0.5213524, -0.0444911, 1.900123, 0.1411765, 0, 1, 1,
0.5240069, 0.6317951, -1.522611, 0.145098, 0, 1, 1,
0.525071, -0.4186522, 2.481045, 0.1529412, 0, 1, 1,
0.5251974, -3.247205, 3.236173, 0.1568628, 0, 1, 1,
0.533374, -0.06191448, 0.006466432, 0.1647059, 0, 1, 1,
0.5334467, 2.024806, 1.154178, 0.1686275, 0, 1, 1,
0.5365577, -0.2680805, 1.466485, 0.1764706, 0, 1, 1,
0.5385731, 0.8784533, 1.204903, 0.1803922, 0, 1, 1,
0.5405105, 0.8680579, 0.07557012, 0.1882353, 0, 1, 1,
0.5414469, 0.1739577, 0.2943132, 0.1921569, 0, 1, 1,
0.5432305, -1.508641, 1.449382, 0.2, 0, 1, 1,
0.5435171, 1.825086, 0.4925953, 0.2078431, 0, 1, 1,
0.5454518, -0.5608689, 2.107642, 0.2117647, 0, 1, 1,
0.5493023, -1.283737, 2.622118, 0.2196078, 0, 1, 1,
0.5521516, -0.8366222, 1.182849, 0.2235294, 0, 1, 1,
0.5615743, -0.9905528, 1.598339, 0.2313726, 0, 1, 1,
0.5727874, -1.658926, 2.889593, 0.2352941, 0, 1, 1,
0.574038, -2.422445, 3.873045, 0.2431373, 0, 1, 1,
0.5743399, 0.07089528, 0.2872966, 0.2470588, 0, 1, 1,
0.5764045, 1.669405, 1.194707, 0.254902, 0, 1, 1,
0.5804349, 2.039747, 0.2249198, 0.2588235, 0, 1, 1,
0.5817909, -0.07266851, 2.655223, 0.2666667, 0, 1, 1,
0.5827547, 0.2263674, 0.9648979, 0.2705882, 0, 1, 1,
0.5860129, 1.683047, -0.4615902, 0.2784314, 0, 1, 1,
0.5898131, -0.9329268, 3.44119, 0.282353, 0, 1, 1,
0.5970285, 1.828042, -0.1984878, 0.2901961, 0, 1, 1,
0.5975264, 0.5094535, 2.472763, 0.2941177, 0, 1, 1,
0.6046084, 1.085033, -1.430447, 0.3019608, 0, 1, 1,
0.6074988, -1.21638, 2.498175, 0.3098039, 0, 1, 1,
0.6087935, 2.676061, -0.8684751, 0.3137255, 0, 1, 1,
0.6126652, -0.8986089, 4.044051, 0.3215686, 0, 1, 1,
0.6151664, 0.7134125, 1.075872, 0.3254902, 0, 1, 1,
0.6229413, -1.658824, 3.23718, 0.3333333, 0, 1, 1,
0.6322019, 1.806403, 0.3316942, 0.3372549, 0, 1, 1,
0.6341725, -1.155078, 1.689316, 0.345098, 0, 1, 1,
0.6344283, -1.428951, 1.796184, 0.3490196, 0, 1, 1,
0.6346147, -0.4285721, 3.347856, 0.3568628, 0, 1, 1,
0.6346773, -0.3149139, 1.854073, 0.3607843, 0, 1, 1,
0.6384537, -0.3388121, 2.780232, 0.3686275, 0, 1, 1,
0.6411374, -0.04522157, 4.339518, 0.372549, 0, 1, 1,
0.6446394, -0.08698694, 1.64539, 0.3803922, 0, 1, 1,
0.6462521, -3.328255, 4.821422, 0.3843137, 0, 1, 1,
0.6498147, -0.09017576, 1.318243, 0.3921569, 0, 1, 1,
0.6508767, 0.07091349, 1.63543, 0.3960784, 0, 1, 1,
0.6566656, 0.06234835, 0.1181326, 0.4039216, 0, 1, 1,
0.6578133, -0.6337059, 1.490634, 0.4117647, 0, 1, 1,
0.6590139, -0.1911834, 1.812746, 0.4156863, 0, 1, 1,
0.6606299, 0.9607546, -0.6823881, 0.4235294, 0, 1, 1,
0.6643562, -0.006276111, 1.645439, 0.427451, 0, 1, 1,
0.668765, -0.9858834, 2.785606, 0.4352941, 0, 1, 1,
0.6736662, -1.436119, 3.159323, 0.4392157, 0, 1, 1,
0.67549, -0.9199386, 1.510878, 0.4470588, 0, 1, 1,
0.6802791, 1.998103, -1.467488, 0.4509804, 0, 1, 1,
0.6814007, 0.5430434, 0.6697133, 0.4588235, 0, 1, 1,
0.6848038, 0.4264191, 0.7408656, 0.4627451, 0, 1, 1,
0.6849094, 1.488923, 0.4834246, 0.4705882, 0, 1, 1,
0.6883666, -0.7898981, 4.931611, 0.4745098, 0, 1, 1,
0.6987907, -0.6071206, 2.266675, 0.4823529, 0, 1, 1,
0.698807, 0.2384489, 3.160266, 0.4862745, 0, 1, 1,
0.6995733, -1.518795, 2.756269, 0.4941176, 0, 1, 1,
0.7020112, 1.890429, 0.4222037, 0.5019608, 0, 1, 1,
0.7034798, -0.1846874, 1.151592, 0.5058824, 0, 1, 1,
0.7044091, 0.08941913, 2.004129, 0.5137255, 0, 1, 1,
0.7047368, -0.1226865, 0.82426, 0.5176471, 0, 1, 1,
0.7066396, 0.5152951, 2.483753, 0.5254902, 0, 1, 1,
0.7130828, -0.2832015, 0.6866713, 0.5294118, 0, 1, 1,
0.7164086, 1.035181, 1.686279, 0.5372549, 0, 1, 1,
0.7186307, -1.159039, 2.209143, 0.5411765, 0, 1, 1,
0.7353728, 1.742506, 1.122354, 0.5490196, 0, 1, 1,
0.7361767, 1.481237, -0.1861827, 0.5529412, 0, 1, 1,
0.7364633, 1.055654, 2.635044, 0.5607843, 0, 1, 1,
0.738188, -0.9778241, 2.216335, 0.5647059, 0, 1, 1,
0.7391097, -2.266521, 4.104764, 0.572549, 0, 1, 1,
0.7409566, 1.046327, 0.04666274, 0.5764706, 0, 1, 1,
0.7444862, 0.5428309, 0.4200408, 0.5843138, 0, 1, 1,
0.7458192, 0.2308751, 0.2947061, 0.5882353, 0, 1, 1,
0.756643, 1.433635, 0.362846, 0.5960785, 0, 1, 1,
0.7573585, -1.385165, 0.6673055, 0.6039216, 0, 1, 1,
0.7586806, -0.131356, 0.8407188, 0.6078432, 0, 1, 1,
0.7614816, 1.208608, 0.4364502, 0.6156863, 0, 1, 1,
0.7624106, -0.8728302, 3.045016, 0.6196079, 0, 1, 1,
0.7660848, -1.894058, 2.597669, 0.627451, 0, 1, 1,
0.7695924, -0.6215209, 2.907933, 0.6313726, 0, 1, 1,
0.7701521, 0.7339274, -0.3210216, 0.6392157, 0, 1, 1,
0.77735, 1.606739, -0.3276522, 0.6431373, 0, 1, 1,
0.7774807, 1.25853, 0.3613116, 0.6509804, 0, 1, 1,
0.7800281, 0.1535098, 0.8647554, 0.654902, 0, 1, 1,
0.780916, -1.461079, 2.458542, 0.6627451, 0, 1, 1,
0.7833483, -0.08344931, 2.329745, 0.6666667, 0, 1, 1,
0.7854901, -0.007979856, 3.346021, 0.6745098, 0, 1, 1,
0.7880083, 1.279001, -1.003896, 0.6784314, 0, 1, 1,
0.7912505, -0.004023076, -0.9980267, 0.6862745, 0, 1, 1,
0.7934711, -0.3396276, 3.13092, 0.6901961, 0, 1, 1,
0.7987282, 0.002818596, 2.284578, 0.6980392, 0, 1, 1,
0.7995774, -0.6278898, 2.378476, 0.7058824, 0, 1, 1,
0.8012382, 0.2942099, 0.1316905, 0.7098039, 0, 1, 1,
0.8062037, -0.9623914, 0.07221362, 0.7176471, 0, 1, 1,
0.8076857, -1.343849, 3.244573, 0.7215686, 0, 1, 1,
0.8116395, -0.07205701, 1.522602, 0.7294118, 0, 1, 1,
0.8177462, -1.266895, 2.718601, 0.7333333, 0, 1, 1,
0.8233426, 1.225968, 3.44714, 0.7411765, 0, 1, 1,
0.8248879, 0.797344, -0.2276649, 0.7450981, 0, 1, 1,
0.8287119, 0.7022135, 1.791088, 0.7529412, 0, 1, 1,
0.8307683, 0.8746658, 0.8213873, 0.7568628, 0, 1, 1,
0.8362647, -1.099463, 3.888585, 0.7647059, 0, 1, 1,
0.8394628, -0.3316023, 2.885202, 0.7686275, 0, 1, 1,
0.8404351, 0.5954049, 0.9185813, 0.7764706, 0, 1, 1,
0.8407734, 0.02964702, 3.437942, 0.7803922, 0, 1, 1,
0.8416659, -1.665826, 3.248898, 0.7882353, 0, 1, 1,
0.8591831, 1.5638, -0.5655422, 0.7921569, 0, 1, 1,
0.8651611, -1.107584, 2.39173, 0.8, 0, 1, 1,
0.8662811, 0.182489, 0.472087, 0.8078431, 0, 1, 1,
0.8670574, 0.8479141, 0.9051051, 0.8117647, 0, 1, 1,
0.8684362, 0.4862011, 1.387608, 0.8196079, 0, 1, 1,
0.8699279, -0.1482504, 2.338665, 0.8235294, 0, 1, 1,
0.8705194, -1.866847, 3.133416, 0.8313726, 0, 1, 1,
0.8727297, -0.1257326, 2.140287, 0.8352941, 0, 1, 1,
0.8750383, 0.1761212, 0.5853083, 0.8431373, 0, 1, 1,
0.8836274, -0.9203144, 1.487775, 0.8470588, 0, 1, 1,
0.8854516, 1.061781, 0.5601448, 0.854902, 0, 1, 1,
0.8856298, 1.10298, -0.3293431, 0.8588235, 0, 1, 1,
0.8902842, -0.1223318, 2.170191, 0.8666667, 0, 1, 1,
0.8929026, 0.09202782, 0.4520407, 0.8705882, 0, 1, 1,
0.8975827, 0.3439186, 0.4160377, 0.8784314, 0, 1, 1,
0.9110943, 0.6412142, -0.5901267, 0.8823529, 0, 1, 1,
0.9163982, 1.699643, 0.1382261, 0.8901961, 0, 1, 1,
0.9193919, 0.4603543, 3.034442, 0.8941177, 0, 1, 1,
0.9197614, 0.5831003, 0.9588509, 0.9019608, 0, 1, 1,
0.9220013, -1.350834, 2.622905, 0.9098039, 0, 1, 1,
0.924266, -0.3553842, 3.256704, 0.9137255, 0, 1, 1,
0.924295, 0.2882743, 1.475232, 0.9215686, 0, 1, 1,
0.9245018, -1.323712, 3.071452, 0.9254902, 0, 1, 1,
0.9302527, 0.2250568, 1.453283, 0.9333333, 0, 1, 1,
0.9335615, -0.3701463, 0.8999612, 0.9372549, 0, 1, 1,
0.934256, 1.638208, 0.5259392, 0.945098, 0, 1, 1,
0.937906, -1.490663, 3.523713, 0.9490196, 0, 1, 1,
0.9385587, -2.314497, 3.318326, 0.9568627, 0, 1, 1,
0.9411255, 1.35006, 1.572621, 0.9607843, 0, 1, 1,
0.945002, -0.2808684, 0.4081993, 0.9686275, 0, 1, 1,
0.9452198, -1.130006, 1.626163, 0.972549, 0, 1, 1,
0.9538181, 0.2904474, 1.593642, 0.9803922, 0, 1, 1,
0.9603668, -0.3164335, 1.976873, 0.9843137, 0, 1, 1,
0.9750558, 1.913118, 1.47796, 0.9921569, 0, 1, 1,
0.9919907, 0.1005242, 2.204075, 0.9960784, 0, 1, 1,
0.9956063, 0.3284821, 0.8497185, 1, 0, 0.9960784, 1,
1.014611, -0.9402236, 2.82162, 1, 0, 0.9882353, 1,
1.019252, -0.7306279, 0.8711802, 1, 0, 0.9843137, 1,
1.02014, 1.474006, 1.663625, 1, 0, 0.9764706, 1,
1.0207, 0.5191095, 2.072917, 1, 0, 0.972549, 1,
1.028891, 1.857948, 1.038197, 1, 0, 0.9647059, 1,
1.04068, -0.2406161, 2.646577, 1, 0, 0.9607843, 1,
1.042855, 1.379364, 1.647858, 1, 0, 0.9529412, 1,
1.057596, 0.01683919, 1.676432, 1, 0, 0.9490196, 1,
1.05851, -0.5562969, 1.383587, 1, 0, 0.9411765, 1,
1.072882, -0.7871492, 2.761519, 1, 0, 0.9372549, 1,
1.07613, -0.002087048, 0.886216, 1, 0, 0.9294118, 1,
1.078752, 0.5077434, 1.946334, 1, 0, 0.9254902, 1,
1.083372, -0.1554026, 3.032575, 1, 0, 0.9176471, 1,
1.086336, 0.649096, -1.177626, 1, 0, 0.9137255, 1,
1.091492, -2.089435, 2.909763, 1, 0, 0.9058824, 1,
1.091988, -0.9183683, 1.699568, 1, 0, 0.9019608, 1,
1.095828, 0.2029526, 1.962, 1, 0, 0.8941177, 1,
1.097255, -1.208567, 1.754466, 1, 0, 0.8862745, 1,
1.098719, -0.5353261, 2.618077, 1, 0, 0.8823529, 1,
1.104815, -0.4768157, 2.182512, 1, 0, 0.8745098, 1,
1.108225, 0.01491844, 2.940285, 1, 0, 0.8705882, 1,
1.109023, 1.723739, -2.14699, 1, 0, 0.8627451, 1,
1.110912, -0.9684424, 1.66914, 1, 0, 0.8588235, 1,
1.113587, 0.7097502, 0.2770081, 1, 0, 0.8509804, 1,
1.119844, 1.219447, 2.58099, 1, 0, 0.8470588, 1,
1.125078, 0.6996827, -0.005336061, 1, 0, 0.8392157, 1,
1.142561, -0.4079096, 0.9301978, 1, 0, 0.8352941, 1,
1.142594, -1.153262, 0.7621371, 1, 0, 0.827451, 1,
1.146566, -0.9136058, 0.8922659, 1, 0, 0.8235294, 1,
1.148793, 0.4177449, 1.665877, 1, 0, 0.8156863, 1,
1.156852, 0.8764719, 1.165064, 1, 0, 0.8117647, 1,
1.160264, 1.229659, 0.7361618, 1, 0, 0.8039216, 1,
1.171471, 1.655811, 1.562797, 1, 0, 0.7960784, 1,
1.183777, -0.4935169, 2.091416, 1, 0, 0.7921569, 1,
1.184026, -1.156615, 1.022977, 1, 0, 0.7843137, 1,
1.189958, 0.7382853, 2.143278, 1, 0, 0.7803922, 1,
1.193964, 2.786855, 0.2795697, 1, 0, 0.772549, 1,
1.194886, -0.4957033, 1.852948, 1, 0, 0.7686275, 1,
1.199149, -0.479803, 1.437134, 1, 0, 0.7607843, 1,
1.202617, -0.5172156, 3.315012, 1, 0, 0.7568628, 1,
1.214043, 0.3233461, 1.236885, 1, 0, 0.7490196, 1,
1.217646, 0.1196556, 2.173299, 1, 0, 0.7450981, 1,
1.223788, 1.020026, 0.3825062, 1, 0, 0.7372549, 1,
1.226124, -0.6158087, 1.232891, 1, 0, 0.7333333, 1,
1.228552, -0.7882227, 3.327563, 1, 0, 0.7254902, 1,
1.231553, -0.2207815, 1.245213, 1, 0, 0.7215686, 1,
1.233435, -0.6609868, 1.209093, 1, 0, 0.7137255, 1,
1.237748, 0.07415741, 2.534183, 1, 0, 0.7098039, 1,
1.243118, 0.09906019, 1.56509, 1, 0, 0.7019608, 1,
1.243571, -0.1057204, 2.276039, 1, 0, 0.6941177, 1,
1.254754, 0.08394171, 1.609549, 1, 0, 0.6901961, 1,
1.271011, -2.036081, 2.732537, 1, 0, 0.682353, 1,
1.272563, -0.7864563, 2.59645, 1, 0, 0.6784314, 1,
1.274279, 3.020599, 0.3750521, 1, 0, 0.6705883, 1,
1.280143, 0.1805762, 2.550395, 1, 0, 0.6666667, 1,
1.284286, -0.9789082, 1.436987, 1, 0, 0.6588235, 1,
1.286893, 1.597636, -0.12052, 1, 0, 0.654902, 1,
1.290571, -0.7355834, 3.647026, 1, 0, 0.6470588, 1,
1.293594, 0.1361741, 1.444714, 1, 0, 0.6431373, 1,
1.294314, -0.8326913, 2.678735, 1, 0, 0.6352941, 1,
1.302872, 1.039207, 0.7674415, 1, 0, 0.6313726, 1,
1.305509, -1.480555, 0.9624822, 1, 0, 0.6235294, 1,
1.312286, -0.09764319, 1.183377, 1, 0, 0.6196079, 1,
1.335843, 0.5510597, -0.09747048, 1, 0, 0.6117647, 1,
1.338108, 1.108346, 0.5953904, 1, 0, 0.6078432, 1,
1.339636, -0.2114732, 2.404737, 1, 0, 0.6, 1,
1.343246, 0.3963085, 1.281406, 1, 0, 0.5921569, 1,
1.347075, -0.9030793, 3.369875, 1, 0, 0.5882353, 1,
1.34818, 1.115476, 2.286359, 1, 0, 0.5803922, 1,
1.348622, -0.1894776, 0.3929205, 1, 0, 0.5764706, 1,
1.355062, -0.8447791, 4.899094, 1, 0, 0.5686275, 1,
1.357441, -1.02148, 1.168393, 1, 0, 0.5647059, 1,
1.367689, 1.055797, 1.506901, 1, 0, 0.5568628, 1,
1.376885, 0.03572219, 1.13004, 1, 0, 0.5529412, 1,
1.388118, -1.902239, 1.087615, 1, 0, 0.5450981, 1,
1.391145, -0.8882822, 2.700071, 1, 0, 0.5411765, 1,
1.398183, -1.462885, 3.023217, 1, 0, 0.5333334, 1,
1.400084, 1.103319, 0.6519493, 1, 0, 0.5294118, 1,
1.410624, 1.578826, -1.223239, 1, 0, 0.5215687, 1,
1.417745, 2.071658, -0.385627, 1, 0, 0.5176471, 1,
1.421774, -0.7320383, 2.495022, 1, 0, 0.509804, 1,
1.42228, -0.9243701, 1.537943, 1, 0, 0.5058824, 1,
1.424042, -2.719452, 2.658769, 1, 0, 0.4980392, 1,
1.427452, -0.6543574, 4.065582, 1, 0, 0.4901961, 1,
1.437464, 0.09193537, 2.41318, 1, 0, 0.4862745, 1,
1.450232, -0.6872084, 2.58279, 1, 0, 0.4784314, 1,
1.45241, -0.42011, -0.07210013, 1, 0, 0.4745098, 1,
1.467444, 2.834593, 1.366271, 1, 0, 0.4666667, 1,
1.475988, -2.217412, 2.935767, 1, 0, 0.4627451, 1,
1.479541, 1.194472, 2.49068, 1, 0, 0.454902, 1,
1.496737, 0.08088537, 0.4944063, 1, 0, 0.4509804, 1,
1.504037, 0.7222159, 2.005028, 1, 0, 0.4431373, 1,
1.512215, -0.7964734, 0.4839034, 1, 0, 0.4392157, 1,
1.513442, -0.2227199, 2.301365, 1, 0, 0.4313726, 1,
1.516817, 1.366366, -0.06522068, 1, 0, 0.427451, 1,
1.519993, 1.071271, 0.6358742, 1, 0, 0.4196078, 1,
1.526167, 0.4592722, 1.817075, 1, 0, 0.4156863, 1,
1.539565, -1.658147, 2.161684, 1, 0, 0.4078431, 1,
1.551035, 0.3738208, -0.6724588, 1, 0, 0.4039216, 1,
1.551162, -0.905957, 2.656274, 1, 0, 0.3960784, 1,
1.560067, 1.836523, 1.628641, 1, 0, 0.3882353, 1,
1.560121, 1.971283, 0.5818488, 1, 0, 0.3843137, 1,
1.593922, -0.4323177, 3.133115, 1, 0, 0.3764706, 1,
1.597751, 0.3710976, 2.350932, 1, 0, 0.372549, 1,
1.599425, 0.3682045, 1.41738, 1, 0, 0.3647059, 1,
1.600147, 0.6127942, 1.743923, 1, 0, 0.3607843, 1,
1.637601, 0.1095142, 1.911447, 1, 0, 0.3529412, 1,
1.642511, -0.4462656, 3.490246, 1, 0, 0.3490196, 1,
1.652903, 0.4656013, 1.01454, 1, 0, 0.3411765, 1,
1.66154, 0.1397043, 1.184806, 1, 0, 0.3372549, 1,
1.681404, -0.4600104, 2.024041, 1, 0, 0.3294118, 1,
1.694548, -0.1217566, 0.7823149, 1, 0, 0.3254902, 1,
1.695258, 0.4795343, 2.007357, 1, 0, 0.3176471, 1,
1.72885, 0.9959573, 0.6741083, 1, 0, 0.3137255, 1,
1.735114, 0.5223547, 2.778285, 1, 0, 0.3058824, 1,
1.737472, 0.3548823, 1.513835, 1, 0, 0.2980392, 1,
1.738236, -0.9336415, 1.811769, 1, 0, 0.2941177, 1,
1.739137, -0.58943, -0.2105148, 1, 0, 0.2862745, 1,
1.745806, -2.216498, 2.893448, 1, 0, 0.282353, 1,
1.747764, -2.643624, 2.338563, 1, 0, 0.2745098, 1,
1.749668, -0.7347178, 1.313772, 1, 0, 0.2705882, 1,
1.755804, 0.8161684, 2.872457, 1, 0, 0.2627451, 1,
1.769229, -0.02534253, 2.967107, 1, 0, 0.2588235, 1,
1.770215, 0.09401701, 1.16894, 1, 0, 0.2509804, 1,
1.779604, -0.4319122, 3.535936, 1, 0, 0.2470588, 1,
1.779675, -0.2288021, 2.109063, 1, 0, 0.2392157, 1,
1.804721, 0.8195736, 1.823616, 1, 0, 0.2352941, 1,
1.8095, -1.365177, 2.227476, 1, 0, 0.227451, 1,
1.817219, -0.03433087, 2.9499, 1, 0, 0.2235294, 1,
1.820992, 0.6072851, 1.117887, 1, 0, 0.2156863, 1,
1.82645, 3.228783, 0.3776124, 1, 0, 0.2117647, 1,
1.826734, 0.6042302, 3.709999, 1, 0, 0.2039216, 1,
1.840301, -0.2954064, 0.7863604, 1, 0, 0.1960784, 1,
1.841256, 1.364718, 0.8597926, 1, 0, 0.1921569, 1,
1.84844, 0.4065953, -0.2000476, 1, 0, 0.1843137, 1,
1.862545, 0.2584, 1.473996, 1, 0, 0.1803922, 1,
1.876958, -0.7842319, 3.249448, 1, 0, 0.172549, 1,
1.881469, 0.4352902, 2.095021, 1, 0, 0.1686275, 1,
1.883216, -2.316153, 2.056108, 1, 0, 0.1607843, 1,
1.92067, -0.07016216, 2.314048, 1, 0, 0.1568628, 1,
1.954613, -0.7214046, 2.536551, 1, 0, 0.1490196, 1,
1.96055, -0.1677011, 0.8706461, 1, 0, 0.145098, 1,
1.970586, -1.107847, 2.404944, 1, 0, 0.1372549, 1,
2.010684, -0.1192539, 0.8338816, 1, 0, 0.1333333, 1,
2.013369, 0.8470674, 1.493698, 1, 0, 0.1254902, 1,
2.035702, 0.01517473, 1.185849, 1, 0, 0.1215686, 1,
2.038934, 0.5203568, 2.171328, 1, 0, 0.1137255, 1,
2.082475, 0.4198116, 1.423605, 1, 0, 0.1098039, 1,
2.122732, 0.03088598, 0.7289647, 1, 0, 0.1019608, 1,
2.155803, -1.297243, 3.128981, 1, 0, 0.09411765, 1,
2.17902, -1.228808, 1.762602, 1, 0, 0.09019608, 1,
2.186552, -1.080119, 0.8941755, 1, 0, 0.08235294, 1,
2.196019, 0.3505526, 1.076147, 1, 0, 0.07843138, 1,
2.281286, 0.461957, 1.492944, 1, 0, 0.07058824, 1,
2.316014, 0.2868066, 1.710768, 1, 0, 0.06666667, 1,
2.39565, 0.7551981, 2.079835, 1, 0, 0.05882353, 1,
2.407948, 0.7883535, -0.9644315, 1, 0, 0.05490196, 1,
2.417408, -0.4268691, 0.8785532, 1, 0, 0.04705882, 1,
2.429686, -0.8169188, 0.7391217, 1, 0, 0.04313726, 1,
2.506016, 1.023883, 1.521448, 1, 0, 0.03529412, 1,
2.558805, 1.526303, 0.331436, 1, 0, 0.03137255, 1,
2.728407, -1.318596, 0.8222628, 1, 0, 0.02352941, 1,
2.894787, 0.3446569, 0.2423437, 1, 0, 0.01960784, 1,
3.037481, -1.070064, 1.932269, 1, 0, 0.01176471, 1,
3.32919, -0.3356929, 2.358713, 1, 0, 0.007843138, 1
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
-0.09629726, -5.009165, -7.50984, 0, -0.5, 0.5, 0.5,
-0.09629726, -5.009165, -7.50984, 1, -0.5, 0.5, 0.5,
-0.09629726, -5.009165, -7.50984, 1, 1.5, 0.5, 0.5,
-0.09629726, -5.009165, -7.50984, 0, 1.5, 0.5, 0.5
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
-4.683025, -0.2932131, -7.50984, 0, -0.5, 0.5, 0.5,
-4.683025, -0.2932131, -7.50984, 1, -0.5, 0.5, 0.5,
-4.683025, -0.2932131, -7.50984, 1, 1.5, 0.5, 0.5,
-4.683025, -0.2932131, -7.50984, 0, 1.5, 0.5, 0.5
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
-4.683025, -5.009165, -0.3875213, 0, -0.5, 0.5, 0.5,
-4.683025, -5.009165, -0.3875213, 1, -0.5, 0.5, 0.5,
-4.683025, -5.009165, -0.3875213, 1, 1.5, 0.5, 0.5,
-4.683025, -5.009165, -0.3875213, 0, 1.5, 0.5, 0.5
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
-3, -3.920869, -5.866228,
3, -3.920869, -5.866228,
-3, -3.920869, -5.866228,
-3, -4.102252, -6.140163,
-2, -3.920869, -5.866228,
-2, -4.102252, -6.140163,
-1, -3.920869, -5.866228,
-1, -4.102252, -6.140163,
0, -3.920869, -5.866228,
0, -4.102252, -6.140163,
1, -3.920869, -5.866228,
1, -4.102252, -6.140163,
2, -3.920869, -5.866228,
2, -4.102252, -6.140163,
3, -3.920869, -5.866228,
3, -4.102252, -6.140163
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
-3, -4.465017, -6.688034, 0, -0.5, 0.5, 0.5,
-3, -4.465017, -6.688034, 1, -0.5, 0.5, 0.5,
-3, -4.465017, -6.688034, 1, 1.5, 0.5, 0.5,
-3, -4.465017, -6.688034, 0, 1.5, 0.5, 0.5,
-2, -4.465017, -6.688034, 0, -0.5, 0.5, 0.5,
-2, -4.465017, -6.688034, 1, -0.5, 0.5, 0.5,
-2, -4.465017, -6.688034, 1, 1.5, 0.5, 0.5,
-2, -4.465017, -6.688034, 0, 1.5, 0.5, 0.5,
-1, -4.465017, -6.688034, 0, -0.5, 0.5, 0.5,
-1, -4.465017, -6.688034, 1, -0.5, 0.5, 0.5,
-1, -4.465017, -6.688034, 1, 1.5, 0.5, 0.5,
-1, -4.465017, -6.688034, 0, 1.5, 0.5, 0.5,
0, -4.465017, -6.688034, 0, -0.5, 0.5, 0.5,
0, -4.465017, -6.688034, 1, -0.5, 0.5, 0.5,
0, -4.465017, -6.688034, 1, 1.5, 0.5, 0.5,
0, -4.465017, -6.688034, 0, 1.5, 0.5, 0.5,
1, -4.465017, -6.688034, 0, -0.5, 0.5, 0.5,
1, -4.465017, -6.688034, 1, -0.5, 0.5, 0.5,
1, -4.465017, -6.688034, 1, 1.5, 0.5, 0.5,
1, -4.465017, -6.688034, 0, 1.5, 0.5, 0.5,
2, -4.465017, -6.688034, 0, -0.5, 0.5, 0.5,
2, -4.465017, -6.688034, 1, -0.5, 0.5, 0.5,
2, -4.465017, -6.688034, 1, 1.5, 0.5, 0.5,
2, -4.465017, -6.688034, 0, 1.5, 0.5, 0.5,
3, -4.465017, -6.688034, 0, -0.5, 0.5, 0.5,
3, -4.465017, -6.688034, 1, -0.5, 0.5, 0.5,
3, -4.465017, -6.688034, 1, 1.5, 0.5, 0.5,
3, -4.465017, -6.688034, 0, 1.5, 0.5, 0.5
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
-3.624549, -2, -5.866228,
-3.624549, 2, -5.866228,
-3.624549, -2, -5.866228,
-3.800962, -2, -6.140163,
-3.624549, 0, -5.866228,
-3.800962, 0, -6.140163,
-3.624549, 2, -5.866228,
-3.800962, 2, -6.140163
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
"0",
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
-4.153787, -2, -6.688034, 0, -0.5, 0.5, 0.5,
-4.153787, -2, -6.688034, 1, -0.5, 0.5, 0.5,
-4.153787, -2, -6.688034, 1, 1.5, 0.5, 0.5,
-4.153787, -2, -6.688034, 0, 1.5, 0.5, 0.5,
-4.153787, 0, -6.688034, 0, -0.5, 0.5, 0.5,
-4.153787, 0, -6.688034, 1, -0.5, 0.5, 0.5,
-4.153787, 0, -6.688034, 1, 1.5, 0.5, 0.5,
-4.153787, 0, -6.688034, 0, 1.5, 0.5, 0.5,
-4.153787, 2, -6.688034, 0, -0.5, 0.5, 0.5,
-4.153787, 2, -6.688034, 1, -0.5, 0.5, 0.5,
-4.153787, 2, -6.688034, 1, 1.5, 0.5, 0.5,
-4.153787, 2, -6.688034, 0, 1.5, 0.5, 0.5
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
-3.624549, -3.920869, -4,
-3.624549, -3.920869, 4,
-3.624549, -3.920869, -4,
-3.800962, -4.102252, -4,
-3.624549, -3.920869, -2,
-3.800962, -4.102252, -2,
-3.624549, -3.920869, 0,
-3.800962, -4.102252, 0,
-3.624549, -3.920869, 2,
-3.800962, -4.102252, 2,
-3.624549, -3.920869, 4,
-3.800962, -4.102252, 4
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
-4.153787, -4.465017, -4, 0, -0.5, 0.5, 0.5,
-4.153787, -4.465017, -4, 1, -0.5, 0.5, 0.5,
-4.153787, -4.465017, -4, 1, 1.5, 0.5, 0.5,
-4.153787, -4.465017, -4, 0, 1.5, 0.5, 0.5,
-4.153787, -4.465017, -2, 0, -0.5, 0.5, 0.5,
-4.153787, -4.465017, -2, 1, -0.5, 0.5, 0.5,
-4.153787, -4.465017, -2, 1, 1.5, 0.5, 0.5,
-4.153787, -4.465017, -2, 0, 1.5, 0.5, 0.5,
-4.153787, -4.465017, 0, 0, -0.5, 0.5, 0.5,
-4.153787, -4.465017, 0, 1, -0.5, 0.5, 0.5,
-4.153787, -4.465017, 0, 1, 1.5, 0.5, 0.5,
-4.153787, -4.465017, 0, 0, 1.5, 0.5, 0.5,
-4.153787, -4.465017, 2, 0, -0.5, 0.5, 0.5,
-4.153787, -4.465017, 2, 1, -0.5, 0.5, 0.5,
-4.153787, -4.465017, 2, 1, 1.5, 0.5, 0.5,
-4.153787, -4.465017, 2, 0, 1.5, 0.5, 0.5,
-4.153787, -4.465017, 4, 0, -0.5, 0.5, 0.5,
-4.153787, -4.465017, 4, 1, -0.5, 0.5, 0.5,
-4.153787, -4.465017, 4, 1, 1.5, 0.5, 0.5,
-4.153787, -4.465017, 4, 0, 1.5, 0.5, 0.5
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
-3.624549, -3.920869, -5.866228,
-3.624549, 3.334443, -5.866228,
-3.624549, -3.920869, 5.091185,
-3.624549, 3.334443, 5.091185,
-3.624549, -3.920869, -5.866228,
-3.624549, -3.920869, 5.091185,
-3.624549, 3.334443, -5.866228,
-3.624549, 3.334443, 5.091185,
-3.624549, -3.920869, -5.866228,
3.431955, -3.920869, -5.866228,
-3.624549, -3.920869, 5.091185,
3.431955, -3.920869, 5.091185,
-3.624549, 3.334443, -5.866228,
3.431955, 3.334443, -5.866228,
-3.624549, 3.334443, 5.091185,
3.431955, 3.334443, 5.091185,
3.431955, -3.920869, -5.866228,
3.431955, 3.334443, -5.866228,
3.431955, -3.920869, 5.091185,
3.431955, 3.334443, 5.091185,
3.431955, -3.920869, -5.866228,
3.431955, -3.920869, 5.091185,
3.431955, 3.334443, -5.866228,
3.431955, 3.334443, 5.091185
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
var radius = 7.965062;
var distance = 35.43746;
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
mvMatrix.translate( 0.09629726, 0.2932131, 0.3875213 );
mvMatrix.scale( 1.220432, 1.18699, 0.7859503 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.43746);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Benzanilide<-read.table("Benzanilide.xyz")
```

```
## Error in read.table("Benzanilide.xyz"): no lines available in input
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
-3.521785, 1.527128, -1.47374, 0, 0, 1, 1, 1,
-2.915995, -1.28997, -1.532402, 1, 0, 0, 1, 1,
-2.902408, -1.220496, -1.781998, 1, 0, 0, 1, 1,
-2.842787, -0.2729513, -1.477304, 1, 0, 0, 1, 1,
-2.823874, 1.07604, -1.348982, 1, 0, 0, 1, 1,
-2.780752, 0.1363912, -0.8218409, 1, 0, 0, 1, 1,
-2.774458, -0.4719423, -1.314952, 0, 0, 0, 1, 1,
-2.745694, 0.760719, -1.570205, 0, 0, 0, 1, 1,
-2.745579, -1.474699, -3.134063, 0, 0, 0, 1, 1,
-2.615808, -0.7416907, -1.759847, 0, 0, 0, 1, 1,
-2.601649, -0.07910675, -1.475766, 0, 0, 0, 1, 1,
-2.590688, 1.274744, -1.36309, 0, 0, 0, 1, 1,
-2.500567, -0.1823853, -2.728129, 0, 0, 0, 1, 1,
-2.489659, 1.299119, 0.2989765, 1, 1, 1, 1, 1,
-2.418139, 1.885854, -1.630238, 1, 1, 1, 1, 1,
-2.321218, -0.886183, -2.002639, 1, 1, 1, 1, 1,
-2.275448, 0.6998417, -0.871322, 1, 1, 1, 1, 1,
-2.242944, -0.6727524, 0.08588368, 1, 1, 1, 1, 1,
-2.217297, -0.8994491, -1.131896, 1, 1, 1, 1, 1,
-2.190964, 0.777009, -1.202856, 1, 1, 1, 1, 1,
-2.190108, 2.671048, -1.253136, 1, 1, 1, 1, 1,
-2.166553, -1.158144, -1.588597, 1, 1, 1, 1, 1,
-2.162355, -0.4741535, -0.5578783, 1, 1, 1, 1, 1,
-2.149917, 0.9303792, -2.729044, 1, 1, 1, 1, 1,
-2.144945, 0.07181642, -1.129862, 1, 1, 1, 1, 1,
-2.143677, -0.7453208, -2.266446, 1, 1, 1, 1, 1,
-2.128284, 2.201982, -0.2524383, 1, 1, 1, 1, 1,
-2.119323, -0.6769755, -3.378426, 1, 1, 1, 1, 1,
-2.058595, -2.679818, -3.460594, 0, 0, 1, 1, 1,
-2.057954, 1.895474, 1.307063, 1, 0, 0, 1, 1,
-2.011835, 2.486885, -0.9620006, 1, 0, 0, 1, 1,
-1.99582, 0.9214703, -0.02496427, 1, 0, 0, 1, 1,
-1.989732, 0.1448508, -1.373679, 1, 0, 0, 1, 1,
-1.934872, 1.050683, -0.3598234, 1, 0, 0, 1, 1,
-1.896899, 0.1984945, -1.894143, 0, 0, 0, 1, 1,
-1.893628, 0.6069623, -1.639804, 0, 0, 0, 1, 1,
-1.886625, 1.601543, -1.211411, 0, 0, 0, 1, 1,
-1.845732, 0.3275816, -1.393137, 0, 0, 0, 1, 1,
-1.833829, 0.5599182, -0.0297207, 0, 0, 0, 1, 1,
-1.814155, 1.436639, -1.405141, 0, 0, 0, 1, 1,
-1.800269, 0.4685362, -3.239175, 0, 0, 0, 1, 1,
-1.798694, 1.305978, -2.931286, 1, 1, 1, 1, 1,
-1.794385, -0.5899805, -2.222762, 1, 1, 1, 1, 1,
-1.773913, -0.7863291, -1.75869, 1, 1, 1, 1, 1,
-1.769657, 1.586917, 0.3591416, 1, 1, 1, 1, 1,
-1.74473, 0.3050261, -1.304834, 1, 1, 1, 1, 1,
-1.729477, -0.9230279, -2.765552, 1, 1, 1, 1, 1,
-1.728402, -0.006436954, -3.062297, 1, 1, 1, 1, 1,
-1.727349, 0.6169077, -0.6508017, 1, 1, 1, 1, 1,
-1.724378, -0.2867959, -3.135656, 1, 1, 1, 1, 1,
-1.723096, 1.075145, -0.5905985, 1, 1, 1, 1, 1,
-1.701879, 0.1807273, -0.800572, 1, 1, 1, 1, 1,
-1.699736, -1.491021, 0.02688485, 1, 1, 1, 1, 1,
-1.698777, 0.7037901, -0.9137152, 1, 1, 1, 1, 1,
-1.687453, -0.1443959, -2.117864, 1, 1, 1, 1, 1,
-1.68255, 0.4536048, -0.3426113, 1, 1, 1, 1, 1,
-1.672878, -0.5947561, -0.3818287, 0, 0, 1, 1, 1,
-1.666777, 2.728864, -0.4697745, 1, 0, 0, 1, 1,
-1.652706, 0.4707396, -0.7963375, 1, 0, 0, 1, 1,
-1.652363, -0.3286372, -3.235125, 1, 0, 0, 1, 1,
-1.640885, 0.1918565, -1.71586, 1, 0, 0, 1, 1,
-1.636635, -0.2916128, -1.451814, 1, 0, 0, 1, 1,
-1.63541, -0.7473737, -2.247092, 0, 0, 0, 1, 1,
-1.616049, -1.752613, -1.711844, 0, 0, 0, 1, 1,
-1.612664, -0.9715062, -1.391274, 0, 0, 0, 1, 1,
-1.605481, -0.5503154, -0.360287, 0, 0, 0, 1, 1,
-1.544376, -0.7183555, -3.016823, 0, 0, 0, 1, 1,
-1.530473, -1.111457, -2.344167, 0, 0, 0, 1, 1,
-1.515112, -1.299291, -2.53378, 0, 0, 0, 1, 1,
-1.509895, -0.4777554, -0.4523588, 1, 1, 1, 1, 1,
-1.506746, 0.3658918, -2.962271, 1, 1, 1, 1, 1,
-1.503243, -0.5492145, -2.169791, 1, 1, 1, 1, 1,
-1.49219, -1.290359, 0.1702165, 1, 1, 1, 1, 1,
-1.490589, -0.4502556, -1.848078, 1, 1, 1, 1, 1,
-1.490548, 0.4565521, -1.543426, 1, 1, 1, 1, 1,
-1.479488, 0.8901456, -0.7765719, 1, 1, 1, 1, 1,
-1.471163, -0.08386565, -1.357391, 1, 1, 1, 1, 1,
-1.463551, -0.5280221, -0.8011811, 1, 1, 1, 1, 1,
-1.456453, 0.1885506, -0.2284087, 1, 1, 1, 1, 1,
-1.440518, -2.081366, -4.152626, 1, 1, 1, 1, 1,
-1.439456, -0.5966887, -3.461744, 1, 1, 1, 1, 1,
-1.433195, 0.6443046, -1.970508, 1, 1, 1, 1, 1,
-1.430404, -0.1700766, -2.645432, 1, 1, 1, 1, 1,
-1.429888, 1.422793, -1.497535, 1, 1, 1, 1, 1,
-1.398681, 0.3834266, -2.568095, 0, 0, 1, 1, 1,
-1.377938, 0.09356897, -1.348942, 1, 0, 0, 1, 1,
-1.37552, 1.594951, -1.480396, 1, 0, 0, 1, 1,
-1.367858, -1.085216, -2.185354, 1, 0, 0, 1, 1,
-1.364837, 0.08707395, -3.236023, 1, 0, 0, 1, 1,
-1.357643, -0.7515292, -2.390316, 1, 0, 0, 1, 1,
-1.357567, -0.7562331, -1.5947, 0, 0, 0, 1, 1,
-1.339194, 1.70549, 0.2695213, 0, 0, 0, 1, 1,
-1.326813, 0.343869, -1.980372, 0, 0, 0, 1, 1,
-1.326029, 1.773326, -1.496276, 0, 0, 0, 1, 1,
-1.313824, 0.009141422, -1.837223, 0, 0, 0, 1, 1,
-1.301356, -0.8176993, -2.841174, 0, 0, 0, 1, 1,
-1.298053, 0.3467839, -1.027317, 0, 0, 0, 1, 1,
-1.296071, 2.351875, -0.8746878, 1, 1, 1, 1, 1,
-1.291497, 1.122618, -0.8552014, 1, 1, 1, 1, 1,
-1.288586, -0.3123135, -3.363491, 1, 1, 1, 1, 1,
-1.275893, -1.732475, -0.6916323, 1, 1, 1, 1, 1,
-1.253668, 0.2908893, -0.6414248, 1, 1, 1, 1, 1,
-1.24809, -0.556945, -0.9162549, 1, 1, 1, 1, 1,
-1.238549, -3.815209, -1.025627, 1, 1, 1, 1, 1,
-1.2361, -0.2552067, -1.248714, 1, 1, 1, 1, 1,
-1.230179, 0.4398819, -2.58422, 1, 1, 1, 1, 1,
-1.226477, -1.326015, -3.693353, 1, 1, 1, 1, 1,
-1.218785, -0.3031574, -2.147611, 1, 1, 1, 1, 1,
-1.218397, 0.8234851, -1.713732, 1, 1, 1, 1, 1,
-1.218052, -0.3466302, -3.125875, 1, 1, 1, 1, 1,
-1.212204, -0.4709176, -1.422315, 1, 1, 1, 1, 1,
-1.204398, 1.144722, -1.32883, 1, 1, 1, 1, 1,
-1.188915, -0.3141579, -1.574853, 0, 0, 1, 1, 1,
-1.18718, -2.078613, -2.277663, 1, 0, 0, 1, 1,
-1.178938, -0.5911595, -2.978664, 1, 0, 0, 1, 1,
-1.178608, 0.5461375, -1.42921, 1, 0, 0, 1, 1,
-1.17823, 0.4625789, -1.737986, 1, 0, 0, 1, 1,
-1.176713, 0.6214935, -2.061422, 1, 0, 0, 1, 1,
-1.160682, 0.7264983, -1.633427, 0, 0, 0, 1, 1,
-1.141477, 1.062199, 0.08917367, 0, 0, 0, 1, 1,
-1.13921, 1.126903, -2.823907, 0, 0, 0, 1, 1,
-1.139128, -0.4229218, -2.116963, 0, 0, 0, 1, 1,
-1.133907, -1.614775, -1.609908, 0, 0, 0, 1, 1,
-1.132733, 0.9621069, -0.5362616, 0, 0, 0, 1, 1,
-1.127365, 0.04576639, -2.612503, 0, 0, 0, 1, 1,
-1.127119, 0.9884033, -2.458113, 1, 1, 1, 1, 1,
-1.126542, 1.20448, -1.552902, 1, 1, 1, 1, 1,
-1.122454, -0.6366678, -0.925809, 1, 1, 1, 1, 1,
-1.121164, 1.049695, -0.8303003, 1, 1, 1, 1, 1,
-1.111477, -0.109436, -2.643439, 1, 1, 1, 1, 1,
-1.099559, -1.355549, -2.355678, 1, 1, 1, 1, 1,
-1.098958, 0.07759104, -2.423882, 1, 1, 1, 1, 1,
-1.09864, 0.796064, 0.5262372, 1, 1, 1, 1, 1,
-1.093523, 1.194415, -1.463081, 1, 1, 1, 1, 1,
-1.08809, 2.260561, -0.6280223, 1, 1, 1, 1, 1,
-1.084643, -0.503006, -2.03138, 1, 1, 1, 1, 1,
-1.07692, -1.964715, -2.581786, 1, 1, 1, 1, 1,
-1.075439, -0.8267979, -0.7198531, 1, 1, 1, 1, 1,
-1.07192, 0.9261023, -0.7882765, 1, 1, 1, 1, 1,
-1.071001, -0.04105059, -2.279, 1, 1, 1, 1, 1,
-1.070292, 0.05965048, -2.843465, 0, 0, 1, 1, 1,
-1.066085, 1.37266, -0.8642009, 1, 0, 0, 1, 1,
-1.05283, -0.3291861, -0.1335873, 1, 0, 0, 1, 1,
-1.049799, 1.710096, -0.6091588, 1, 0, 0, 1, 1,
-1.038948, 0.4075733, -0.2458432, 1, 0, 0, 1, 1,
-1.032542, -0.782052, -1.813741, 1, 0, 0, 1, 1,
-1.027936, 1.372385, -0.6602494, 0, 0, 0, 1, 1,
-1.012325, -0.08905071, -2.190598, 0, 0, 0, 1, 1,
-1.009322, 1.55955, -1.753997, 0, 0, 0, 1, 1,
-1.005453, -1.71987, -3.144513, 0, 0, 0, 1, 1,
-1.005044, 1.106996, -1.723441, 0, 0, 0, 1, 1,
-1.004233, 0.7037075, 0.1429002, 0, 0, 0, 1, 1,
-1.002848, 1.133848, -1.445546, 0, 0, 0, 1, 1,
-0.9991866, 0.436563, -0.8268527, 1, 1, 1, 1, 1,
-0.9953119, -1.76367, -2.79784, 1, 1, 1, 1, 1,
-0.9948255, -1.000818, -1.598557, 1, 1, 1, 1, 1,
-0.9807907, -0.7181584, -2.802351, 1, 1, 1, 1, 1,
-0.9801224, -1.468487, -2.927423, 1, 1, 1, 1, 1,
-0.9672283, -0.6366807, -2.413578, 1, 1, 1, 1, 1,
-0.9669013, 0.8775977, -0.9773309, 1, 1, 1, 1, 1,
-0.9643627, 0.9037942, -0.3760296, 1, 1, 1, 1, 1,
-0.9525197, 0.1509531, -1.961709, 1, 1, 1, 1, 1,
-0.9496749, 0.2764263, -2.314626, 1, 1, 1, 1, 1,
-0.9489582, -1.643462, -5.706654, 1, 1, 1, 1, 1,
-0.9477219, 0.1354101, -2.838294, 1, 1, 1, 1, 1,
-0.9378216, 0.1095603, -2.207909, 1, 1, 1, 1, 1,
-0.9355527, 0.215227, -1.652894, 1, 1, 1, 1, 1,
-0.9319984, -0.5291957, -2.399977, 1, 1, 1, 1, 1,
-0.9316069, -0.3280089, -1.759106, 0, 0, 1, 1, 1,
-0.9303998, 0.5612574, -0.8487499, 1, 0, 0, 1, 1,
-0.9249374, -0.115493, -0.8799561, 1, 0, 0, 1, 1,
-0.9218926, 0.9597431, -2.028594, 1, 0, 0, 1, 1,
-0.9173104, 0.2440646, -0.07930142, 1, 0, 0, 1, 1,
-0.9119166, 0.9231322, 0.7255465, 1, 0, 0, 1, 1,
-0.9083064, 0.3340448, -2.117145, 0, 0, 0, 1, 1,
-0.8993547, -1.035448, -1.589867, 0, 0, 0, 1, 1,
-0.8979703, -0.6953428, -2.830887, 0, 0, 0, 1, 1,
-0.8846967, 0.8788592, -0.3363615, 0, 0, 0, 1, 1,
-0.883809, 2.418276, 1.443851, 0, 0, 0, 1, 1,
-0.8777421, -0.0007998949, -0.313535, 0, 0, 0, 1, 1,
-0.8764985, -0.2772542, -1.583554, 0, 0, 0, 1, 1,
-0.8757082, -1.146109, -2.629923, 1, 1, 1, 1, 1,
-0.8684547, -0.06305137, -0.03439254, 1, 1, 1, 1, 1,
-0.8626094, -1.068602, -1.415198, 1, 1, 1, 1, 1,
-0.8621264, -0.9494159, -2.4045, 1, 1, 1, 1, 1,
-0.8618623, -0.5906603, -2.393904, 1, 1, 1, 1, 1,
-0.8539088, 0.5534011, -1.473101, 1, 1, 1, 1, 1,
-0.8469654, -0.6403872, -2.788302, 1, 1, 1, 1, 1,
-0.8458015, -1.55384, -3.014581, 1, 1, 1, 1, 1,
-0.8447015, 0.4362873, -1.975241, 1, 1, 1, 1, 1,
-0.8406263, -0.9109423, -2.80481, 1, 1, 1, 1, 1,
-0.8363397, 2.0649, -0.4774809, 1, 1, 1, 1, 1,
-0.8356194, -0.2440539, -2.922056, 1, 1, 1, 1, 1,
-0.8292974, 0.6974765, -0.2956528, 1, 1, 1, 1, 1,
-0.8234528, -1.998098, -2.482421, 1, 1, 1, 1, 1,
-0.8220927, 1.35538, -0.2240185, 1, 1, 1, 1, 1,
-0.8208923, 1.499753, -1.469871, 0, 0, 1, 1, 1,
-0.8192859, -0.2707657, -1.436493, 1, 0, 0, 1, 1,
-0.8178756, -0.8554751, -2.779063, 1, 0, 0, 1, 1,
-0.8141446, 0.9996426, -0.4760145, 1, 0, 0, 1, 1,
-0.8093015, -0.8344945, -2.209749, 1, 0, 0, 1, 1,
-0.8046616, -1.868281, -3.910744, 1, 0, 0, 1, 1,
-0.7978946, -0.9960463, -2.047855, 0, 0, 0, 1, 1,
-0.791963, 0.5442755, -2.367072, 0, 0, 0, 1, 1,
-0.7808567, 1.599376, 1.446163, 0, 0, 0, 1, 1,
-0.7796678, -0.437536, -1.270685, 0, 0, 0, 1, 1,
-0.7791623, -0.3680475, -2.185895, 0, 0, 0, 1, 1,
-0.7790952, -0.4377803, -2.517377, 0, 0, 0, 1, 1,
-0.7772013, -0.3631999, -4.248523, 0, 0, 0, 1, 1,
-0.776538, -0.816672, -1.749502, 1, 1, 1, 1, 1,
-0.7752098, -2.395698, -3.501145, 1, 1, 1, 1, 1,
-0.7751404, 0.9933065, -0.6889959, 1, 1, 1, 1, 1,
-0.7727145, -0.9677193, -1.375212, 1, 1, 1, 1, 1,
-0.7711502, 0.1545913, -1.595002, 1, 1, 1, 1, 1,
-0.7658169, 0.4478628, 0.2100182, 1, 1, 1, 1, 1,
-0.7639662, 1.795412, -1.261275, 1, 1, 1, 1, 1,
-0.7592937, 0.4192738, -1.559012, 1, 1, 1, 1, 1,
-0.7576551, -0.03625849, -1.904361, 1, 1, 1, 1, 1,
-0.7559525, -0.02971214, -1.198312, 1, 1, 1, 1, 1,
-0.7558084, -0.9387221, -1.964031, 1, 1, 1, 1, 1,
-0.7496179, 0.7464281, -0.4405901, 1, 1, 1, 1, 1,
-0.7442027, 0.2687573, -1.679572, 1, 1, 1, 1, 1,
-0.7383584, 1.209351, -0.3842635, 1, 1, 1, 1, 1,
-0.7330484, -0.3218507, -0.3504935, 1, 1, 1, 1, 1,
-0.7286726, -1.04733, -3.631202, 0, 0, 1, 1, 1,
-0.7266479, -1.186682, -2.17138, 1, 0, 0, 1, 1,
-0.7253439, 2.833123, 0.1563142, 1, 0, 0, 1, 1,
-0.7156115, 1.112865, -0.3219167, 1, 0, 0, 1, 1,
-0.7142906, 0.8116406, -2.955061, 1, 0, 0, 1, 1,
-0.7122396, -0.3178045, -1.930014, 1, 0, 0, 1, 1,
-0.7081316, 0.8288605, -0.3937674, 0, 0, 0, 1, 1,
-0.7063845, 0.6450787, -0.1811553, 0, 0, 0, 1, 1,
-0.7054901, -0.4826442, -3.603173, 0, 0, 0, 1, 1,
-0.7053109, -0.8512363, -1.489283, 0, 0, 0, 1, 1,
-0.7049623, -0.2029572, -2.829286, 0, 0, 0, 1, 1,
-0.7045227, -0.1817902, -0.2573974, 0, 0, 0, 1, 1,
-0.7031863, 1.192118, -0.2606004, 0, 0, 0, 1, 1,
-0.6980885, 0.7383272, -0.3018267, 1, 1, 1, 1, 1,
-0.6961203, -0.4105108, -2.351858, 1, 1, 1, 1, 1,
-0.6946478, 1.22579, -1.412781, 1, 1, 1, 1, 1,
-0.6925404, -0.6645615, -1.627496, 1, 1, 1, 1, 1,
-0.6916766, 0.1953779, -1.738754, 1, 1, 1, 1, 1,
-0.6874585, 0.387924, -0.5707078, 1, 1, 1, 1, 1,
-0.6843902, 0.946259, -0.5094262, 1, 1, 1, 1, 1,
-0.6827439, -0.2983211, -3.325155, 1, 1, 1, 1, 1,
-0.6823524, 0.5606694, -2.609377, 1, 1, 1, 1, 1,
-0.6748877, -0.2470398, -2.500204, 1, 1, 1, 1, 1,
-0.6689165, 0.4651395, -1.714147, 1, 1, 1, 1, 1,
-0.6623898, -0.8169107, -2.700388, 1, 1, 1, 1, 1,
-0.6617849, -0.6205218, -0.7398543, 1, 1, 1, 1, 1,
-0.6572384, 0.1743266, -0.616007, 1, 1, 1, 1, 1,
-0.6547492, 1.15455, -1.18441, 1, 1, 1, 1, 1,
-0.6533986, -1.577421, -1.906417, 0, 0, 1, 1, 1,
-0.6477973, 0.1382176, -1.707004, 1, 0, 0, 1, 1,
-0.6471505, -0.4161434, -1.11196, 1, 0, 0, 1, 1,
-0.6444224, 0.8060053, -1.522628, 1, 0, 0, 1, 1,
-0.6424778, -1.148855, -1.425099, 1, 0, 0, 1, 1,
-0.6388772, -0.727341, -1.343007, 1, 0, 0, 1, 1,
-0.6383395, -2.206466, -3.168296, 0, 0, 0, 1, 1,
-0.6368474, 0.399727, 0.06156736, 0, 0, 0, 1, 1,
-0.6325005, 1.348331, -0.9941085, 0, 0, 0, 1, 1,
-0.6302246, -1.091315, -2.614865, 0, 0, 0, 1, 1,
-0.6254001, -0.5677739, -2.508175, 0, 0, 0, 1, 1,
-0.6196101, -0.1801358, -0.2454626, 0, 0, 0, 1, 1,
-0.6176023, -1.179515, -2.981516, 0, 0, 0, 1, 1,
-0.6148274, -1.079103, -3.166087, 1, 1, 1, 1, 1,
-0.6147889, -0.4684539, -2.916009, 1, 1, 1, 1, 1,
-0.6136451, -0.7180097, -3.745385, 1, 1, 1, 1, 1,
-0.6094579, 0.8626478, -1.798335, 1, 1, 1, 1, 1,
-0.6053128, -0.4036193, -1.762159, 1, 1, 1, 1, 1,
-0.6022763, 0.6801836, 1.052083, 1, 1, 1, 1, 1,
-0.596229, -0.1319756, -1.370465, 1, 1, 1, 1, 1,
-0.5926146, -1.621827, -1.796551, 1, 1, 1, 1, 1,
-0.5916833, 1.211059, 0.8258142, 1, 1, 1, 1, 1,
-0.5873643, 0.3403322, -0.3016728, 1, 1, 1, 1, 1,
-0.5814095, 0.5751778, -0.3585704, 1, 1, 1, 1, 1,
-0.5798459, 1.962319, 0.05111621, 1, 1, 1, 1, 1,
-0.5782705, -0.2300956, -1.992842, 1, 1, 1, 1, 1,
-0.5643589, -1.330069, -1.586907, 1, 1, 1, 1, 1,
-0.5600002, -0.2588523, -3.980644, 1, 1, 1, 1, 1,
-0.5525487, -1.58186, -1.693152, 0, 0, 1, 1, 1,
-0.5474777, 0.28049, -0.398551, 1, 0, 0, 1, 1,
-0.5444035, 0.1369971, -2.369736, 1, 0, 0, 1, 1,
-0.5431128, -0.01962499, -2.728524, 1, 0, 0, 1, 1,
-0.5403957, 1.656988, 0.4756744, 1, 0, 0, 1, 1,
-0.5395516, -0.03099994, -1.783391, 1, 0, 0, 1, 1,
-0.5384671, -0.4137218, -0.9698171, 0, 0, 0, 1, 1,
-0.5350461, 1.84331, -1.268402, 0, 0, 0, 1, 1,
-0.5348188, 0.5092593, -0.06218236, 0, 0, 0, 1, 1,
-0.5328727, -1.083712, -2.134847, 0, 0, 0, 1, 1,
-0.5243471, -0.5122755, -3.704946, 0, 0, 0, 1, 1,
-0.5227677, 0.1969162, -3.886944, 0, 0, 0, 1, 1,
-0.52074, 1.721364, -1.644815, 0, 0, 0, 1, 1,
-0.518463, 1.75066, -0.5107701, 1, 1, 1, 1, 1,
-0.5159639, -0.1683292, -1.729899, 1, 1, 1, 1, 1,
-0.5125057, 1.0776, -0.5330409, 1, 1, 1, 1, 1,
-0.504023, -1.609754, -3.849907, 1, 1, 1, 1, 1,
-0.4991092, -0.6450177, -2.605995, 1, 1, 1, 1, 1,
-0.4990081, 0.7517872, -0.946348, 1, 1, 1, 1, 1,
-0.4988003, 0.2954032, -2.062485, 1, 1, 1, 1, 1,
-0.4968339, 0.4636935, -2.149195, 1, 1, 1, 1, 1,
-0.4940433, -0.6801203, -3.718364, 1, 1, 1, 1, 1,
-0.4930221, 0.1906709, -1.375573, 1, 1, 1, 1, 1,
-0.4903451, -0.2381189, -1.215994, 1, 1, 1, 1, 1,
-0.4894249, 0.2999519, -0.2560868, 1, 1, 1, 1, 1,
-0.4876397, 0.9636251, -0.003838907, 1, 1, 1, 1, 1,
-0.4830453, 1.247542, -0.09919604, 1, 1, 1, 1, 1,
-0.4802205, -1.409919, -3.65338, 1, 1, 1, 1, 1,
-0.4793612, 0.5550522, -0.2308718, 0, 0, 1, 1, 1,
-0.475708, -0.3316848, -0.7834936, 1, 0, 0, 1, 1,
-0.4753327, -0.2108732, -1.522627, 1, 0, 0, 1, 1,
-0.4723809, -0.7208782, -1.840349, 1, 0, 0, 1, 1,
-0.470318, -1.093665, -2.66979, 1, 0, 0, 1, 1,
-0.4699635, -0.4076524, -1.811256, 1, 0, 0, 1, 1,
-0.4698074, -2.435312, -2.708073, 0, 0, 0, 1, 1,
-0.4667051, 0.7271006, -0.8292527, 0, 0, 0, 1, 1,
-0.4626286, -2.330108, -2.339687, 0, 0, 0, 1, 1,
-0.4545211, -0.007363554, -2.753993, 0, 0, 0, 1, 1,
-0.4506094, 0.3110599, -2.936611, 0, 0, 0, 1, 1,
-0.4434426, -0.7045442, -2.140093, 0, 0, 0, 1, 1,
-0.4424018, 0.7397344, -1.099531, 0, 0, 0, 1, 1,
-0.4415604, 2.265011, 0.8913985, 1, 1, 1, 1, 1,
-0.4410142, -0.01103586, -0.7047815, 1, 1, 1, 1, 1,
-0.438204, 0.308917, -0.8254807, 1, 1, 1, 1, 1,
-0.4346278, 0.3272213, -0.3539756, 1, 1, 1, 1, 1,
-0.4301359, -0.05836705, -2.845814, 1, 1, 1, 1, 1,
-0.4222048, 0.6264299, -0.9988423, 1, 1, 1, 1, 1,
-0.4183948, 2.098749, -2.002999, 1, 1, 1, 1, 1,
-0.4165301, -0.7336156, -2.158196, 1, 1, 1, 1, 1,
-0.4163437, -0.3208087, -2.845631, 1, 1, 1, 1, 1,
-0.4138532, -0.5480794, -2.553426, 1, 1, 1, 1, 1,
-0.4137117, 2.152188, -0.5212392, 1, 1, 1, 1, 1,
-0.4108048, -1.146409, -3.384175, 1, 1, 1, 1, 1,
-0.4020737, -1.129211, -3.678, 1, 1, 1, 1, 1,
-0.3997919, 2.045833, -2.05363, 1, 1, 1, 1, 1,
-0.3986372, 0.6422787, -1.247916, 1, 1, 1, 1, 1,
-0.3981462, 0.6227569, -1.399222, 0, 0, 1, 1, 1,
-0.3972189, 0.4712986, -3.431662, 1, 0, 0, 1, 1,
-0.3947863, -0.8881658, -3.164648, 1, 0, 0, 1, 1,
-0.3874584, -0.9169296, -0.2667702, 1, 0, 0, 1, 1,
-0.3865774, -0.3926446, -2.621156, 1, 0, 0, 1, 1,
-0.3863409, 0.4048011, -1.324088, 1, 0, 0, 1, 1,
-0.3844794, -0.5081341, -4.445025, 0, 0, 0, 1, 1,
-0.3840013, 2.138772, -1.285837, 0, 0, 0, 1, 1,
-0.3774391, 1.179843, 0.2379997, 0, 0, 0, 1, 1,
-0.3766452, -1.090753, -2.803177, 0, 0, 0, 1, 1,
-0.3760879, 0.9458026, 1.415472, 0, 0, 0, 1, 1,
-0.3748012, -1.053064, -3.37797, 0, 0, 0, 1, 1,
-0.3734935, 0.6155021, -3.016237, 0, 0, 0, 1, 1,
-0.3727145, 1.700879, -1.669131, 1, 1, 1, 1, 1,
-0.372223, 1.388243, 1.433861, 1, 1, 1, 1, 1,
-0.3667155, -0.07437631, -0.9877351, 1, 1, 1, 1, 1,
-0.3660968, 0.7128986, 0.2225807, 1, 1, 1, 1, 1,
-0.3602028, 1.209264, -0.9117831, 1, 1, 1, 1, 1,
-0.3578781, -0.5316064, -3.237682, 1, 1, 1, 1, 1,
-0.3540839, 0.3648346, -1.59538, 1, 1, 1, 1, 1,
-0.3536898, 0.1346032, 0.2030856, 1, 1, 1, 1, 1,
-0.3528557, 0.7526295, 0.5824457, 1, 1, 1, 1, 1,
-0.3522895, -0.7503002, -3.533794, 1, 1, 1, 1, 1,
-0.3519408, -1.463715, -2.693392, 1, 1, 1, 1, 1,
-0.3515263, -0.6839227, -2.770651, 1, 1, 1, 1, 1,
-0.3505113, -0.3546405, -3.435143, 1, 1, 1, 1, 1,
-0.3502864, 0.9614589, 0.7250216, 1, 1, 1, 1, 1,
-0.3486888, 0.7461472, 0.09055378, 1, 1, 1, 1, 1,
-0.3485807, 1.398001, -0.7532881, 0, 0, 1, 1, 1,
-0.3484072, -1.365465, -0.5088517, 1, 0, 0, 1, 1,
-0.3479834, 0.9812427, -0.08348083, 1, 0, 0, 1, 1,
-0.3455298, -0.4820765, -2.989937, 1, 0, 0, 1, 1,
-0.3402339, -1.153333, -2.329816, 1, 0, 0, 1, 1,
-0.3384191, 0.1129119, -1.298715, 1, 0, 0, 1, 1,
-0.3377434, -0.2778326, 0.7315221, 0, 0, 0, 1, 1,
-0.3371299, 2.884708, -1.05636, 0, 0, 0, 1, 1,
-0.3320522, -1.289666, -2.320732, 0, 0, 0, 1, 1,
-0.3319269, 1.012001, 0.4803001, 0, 0, 0, 1, 1,
-0.3285432, 1.214698, -1.477558, 0, 0, 0, 1, 1,
-0.3280873, 1.69708, -0.660361, 0, 0, 0, 1, 1,
-0.3277001, 1.026916, -1.399098, 0, 0, 0, 1, 1,
-0.3243392, 0.3882457, -0.3259919, 1, 1, 1, 1, 1,
-0.3239629, -0.2518949, -2.905609, 1, 1, 1, 1, 1,
-0.3053008, -1.327641, -3.037896, 1, 1, 1, 1, 1,
-0.3032134, -0.1312018, -2.731283, 1, 1, 1, 1, 1,
-0.2968372, -0.3357913, -1.619092, 1, 1, 1, 1, 1,
-0.2964288, 0.3732724, -0.6582674, 1, 1, 1, 1, 1,
-0.2935628, -1.077293, -3.793167, 1, 1, 1, 1, 1,
-0.2891206, -2.95182, -3.921263, 1, 1, 1, 1, 1,
-0.2888319, -1.757392, -1.688284, 1, 1, 1, 1, 1,
-0.2869053, -0.8047842, -3.227779, 1, 1, 1, 1, 1,
-0.2841449, 0.412559, -1.185757, 1, 1, 1, 1, 1,
-0.2839577, -0.02623613, -1.321726, 1, 1, 1, 1, 1,
-0.2838178, -0.06247409, -1.754179, 1, 1, 1, 1, 1,
-0.2816464, -0.2114633, -3.25694, 1, 1, 1, 1, 1,
-0.2794222, 0.02320965, 0.3644839, 1, 1, 1, 1, 1,
-0.2789493, -0.5807748, -2.731042, 0, 0, 1, 1, 1,
-0.2780795, 0.5466206, -0.1222614, 1, 0, 0, 1, 1,
-0.2769797, -1.359718, -4.339647, 1, 0, 0, 1, 1,
-0.2738575, 1.38964, -0.3799261, 1, 0, 0, 1, 1,
-0.2723752, -0.1088236, -0.8092901, 1, 0, 0, 1, 1,
-0.2700884, 1.884959, 0.7897041, 1, 0, 0, 1, 1,
-0.2698794, -0.487076, -1.655, 0, 0, 0, 1, 1,
-0.2663945, 1.322073, 0.4114711, 0, 0, 0, 1, 1,
-0.266007, 0.007579995, -1.384135, 0, 0, 0, 1, 1,
-0.2657175, 0.03221722, -2.457914, 0, 0, 0, 1, 1,
-0.2641341, 0.1691397, -1.966245, 0, 0, 0, 1, 1,
-0.2639641, -1.056209, -2.612869, 0, 0, 0, 1, 1,
-0.2631108, -1.233149, -3.277611, 0, 0, 0, 1, 1,
-0.2589809, -1.916249, -2.228242, 1, 1, 1, 1, 1,
-0.2502913, 1.392597, 0.3550734, 1, 1, 1, 1, 1,
-0.2502486, 0.01246879, -2.183263, 1, 1, 1, 1, 1,
-0.2492365, -0.255927, -2.288787, 1, 1, 1, 1, 1,
-0.248064, -1.088613, -3.543252, 1, 1, 1, 1, 1,
-0.2479618, 1.899131, -0.3174866, 1, 1, 1, 1, 1,
-0.2475514, 0.4387058, -1.407492, 1, 1, 1, 1, 1,
-0.2462789, 2.255074, -1.791668, 1, 1, 1, 1, 1,
-0.2453553, 0.4598089, -0.3818421, 1, 1, 1, 1, 1,
-0.2426705, 0.0966212, -2.096815, 1, 1, 1, 1, 1,
-0.2412552, 0.4152011, -0.2826212, 1, 1, 1, 1, 1,
-0.2396393, 1.32179, 1.497656, 1, 1, 1, 1, 1,
-0.2370306, 0.1033512, -2.1674, 1, 1, 1, 1, 1,
-0.236467, 0.1052516, -0.4869441, 1, 1, 1, 1, 1,
-0.2355091, 0.4239863, -1.658563, 1, 1, 1, 1, 1,
-0.2354679, -1.382617, -1.364958, 0, 0, 1, 1, 1,
-0.2311387, 0.3437045, -1.432532, 1, 0, 0, 1, 1,
-0.2296883, -0.7561689, -2.512244, 1, 0, 0, 1, 1,
-0.2281457, -0.5007458, -2.420409, 1, 0, 0, 1, 1,
-0.2262876, 2.397475, -0.2911809, 1, 0, 0, 1, 1,
-0.2259716, 1.294201, 1.388446, 1, 0, 0, 1, 1,
-0.2226436, 0.05496961, -1.979074, 0, 0, 0, 1, 1,
-0.2133125, -0.3743406, -1.155249, 0, 0, 0, 1, 1,
-0.2129954, 1.58143, -0.319196, 0, 0, 0, 1, 1,
-0.2118379, 0.5774707, -2.74562, 0, 0, 0, 1, 1,
-0.2084241, -0.1469758, -2.020482, 0, 0, 0, 1, 1,
-0.2071799, 1.161239, 0.109449, 0, 0, 0, 1, 1,
-0.2068669, -0.05720158, -2.932487, 0, 0, 0, 1, 1,
-0.2053493, -0.6137871, -3.137419, 1, 1, 1, 1, 1,
-0.2026123, -0.3362484, -3.316542, 1, 1, 1, 1, 1,
-0.1831356, 0.2987892, -0.06459629, 1, 1, 1, 1, 1,
-0.1791777, -0.03019206, -2.113518, 1, 1, 1, 1, 1,
-0.178906, 0.4213844, -1.958971, 1, 1, 1, 1, 1,
-0.1762714, 1.203749, 1.245652, 1, 1, 1, 1, 1,
-0.1714571, -0.4291405, -3.520898, 1, 1, 1, 1, 1,
-0.1691086, 0.2169667, -1.475199, 1, 1, 1, 1, 1,
-0.1688076, 1.710753, 0.4873142, 1, 1, 1, 1, 1,
-0.1658582, 0.1160652, -0.450727, 1, 1, 1, 1, 1,
-0.160935, 1.89597, -0.06650164, 1, 1, 1, 1, 1,
-0.1572904, 1.172303, 0.10255, 1, 1, 1, 1, 1,
-0.1570966, -2.274865, -4.547668, 1, 1, 1, 1, 1,
-0.1534357, 0.6905791, 1.368652, 1, 1, 1, 1, 1,
-0.1423054, -1.236508, -4.533807, 1, 1, 1, 1, 1,
-0.1365849, -1.461518, -3.634504, 0, 0, 1, 1, 1,
-0.135609, -0.932853, -0.7800158, 1, 0, 0, 1, 1,
-0.1340605, 1.509473, -0.4095647, 1, 0, 0, 1, 1,
-0.1312035, 1.180219, 1.214699, 1, 0, 0, 1, 1,
-0.1261484, -1.203019, -2.636197, 1, 0, 0, 1, 1,
-0.1251944, -1.284825, -4.194093, 1, 0, 0, 1, 1,
-0.1247832, -0.5578359, -1.290176, 0, 0, 0, 1, 1,
-0.1047055, 0.1594895, -1.493709, 0, 0, 0, 1, 1,
-0.1030495, 1.252019, 0.09509037, 0, 0, 0, 1, 1,
-0.1016811, 0.06115488, -1.618615, 0, 0, 0, 1, 1,
-0.09281424, 0.007457986, -2.681693, 0, 0, 0, 1, 1,
-0.0906223, -0.01315658, -1.799109, 0, 0, 0, 1, 1,
-0.0901271, 0.4836384, -0.6230711, 0, 0, 0, 1, 1,
-0.0900796, 0.2508875, 1.664098, 1, 1, 1, 1, 1,
-0.08333569, 0.08894669, -0.7680098, 1, 1, 1, 1, 1,
-0.0818847, -0.2266839, -2.453648, 1, 1, 1, 1, 1,
-0.08136269, 0.6606328, 1.522807, 1, 1, 1, 1, 1,
-0.07404337, 1.561356, 0.357019, 1, 1, 1, 1, 1,
-0.0694056, -0.09441399, -1.340845, 1, 1, 1, 1, 1,
-0.0685266, -1.232281, -4.693449, 1, 1, 1, 1, 1,
-0.06475799, -0.1990512, -1.569145, 1, 1, 1, 1, 1,
-0.06460737, 0.3209745, -0.7947185, 1, 1, 1, 1, 1,
-0.06121147, 1.356079, -0.5185767, 1, 1, 1, 1, 1,
-0.05861583, -0.6753787, -0.5157013, 1, 1, 1, 1, 1,
-0.05687909, 1.093507, -0.7568198, 1, 1, 1, 1, 1,
-0.05644169, 1.663949, 0.562046, 1, 1, 1, 1, 1,
-0.05005218, -0.7997089, -1.843675, 1, 1, 1, 1, 1,
-0.04716306, -1.251254, -2.325055, 1, 1, 1, 1, 1,
-0.0470286, -0.5272284, -1.776631, 0, 0, 1, 1, 1,
-0.04619241, 0.2565831, 0.3308434, 1, 0, 0, 1, 1,
-0.04592416, -1.286172, -4.765323, 1, 0, 0, 1, 1,
-0.04488729, 1.387706, -0.8563897, 1, 0, 0, 1, 1,
-0.04095236, 0.6344966, -0.6877515, 1, 0, 0, 1, 1,
-0.03897755, -0.24741, -2.424327, 1, 0, 0, 1, 1,
-0.03890212, 0.4624258, -1.220008, 0, 0, 0, 1, 1,
-0.03792359, 2.016733, 0.8750283, 0, 0, 0, 1, 1,
-0.03530493, -0.2583195, -2.825251, 0, 0, 0, 1, 1,
-0.0312628, 0.1782454, -2.314816, 0, 0, 0, 1, 1,
-0.02896111, 0.6863436, -0.4055343, 0, 0, 0, 1, 1,
-0.02880085, -0.9509579, -4.613471, 0, 0, 0, 1, 1,
-0.02848328, 1.529328, 0.08894341, 0, 0, 0, 1, 1,
-0.02719142, -2.410116, -2.677612, 1, 1, 1, 1, 1,
-0.02570205, 0.4105996, 0.5354439, 1, 1, 1, 1, 1,
-0.02186093, 1.681191, -2.392891, 1, 1, 1, 1, 1,
-0.01379038, -0.3367452, -2.883396, 1, 1, 1, 1, 1,
-0.0118575, 0.1441992, 1.052874, 1, 1, 1, 1, 1,
-0.01018523, -0.2453912, -1.872571, 1, 1, 1, 1, 1,
-0.009797676, -0.8720322, -5.230983, 1, 1, 1, 1, 1,
-0.008677443, -0.3882933, -3.369388, 1, 1, 1, 1, 1,
-0.007803066, -0.4629706, -1.880161, 1, 1, 1, 1, 1,
0.001203375, 0.1944909, 1.760226, 1, 1, 1, 1, 1,
0.00326708, -1.16512, 1.232912, 1, 1, 1, 1, 1,
0.004950202, -1.153267, 4.01377, 1, 1, 1, 1, 1,
0.006080037, -0.2735175, 1.871029, 1, 1, 1, 1, 1,
0.007545684, -1.669597, 2.537602, 1, 1, 1, 1, 1,
0.008345087, -0.6175728, 3.940234, 1, 1, 1, 1, 1,
0.009766408, -0.8621755, 2.298284, 0, 0, 1, 1, 1,
0.0103431, 0.9662628, 1.190715, 1, 0, 0, 1, 1,
0.01320165, -0.6836281, 3.927145, 1, 0, 0, 1, 1,
0.01573752, -0.6487759, 3.35162, 1, 0, 0, 1, 1,
0.01610921, 0.7492674, -2.320781, 1, 0, 0, 1, 1,
0.01731325, -1.540082, 0.6872932, 1, 0, 0, 1, 1,
0.0173831, -0.6723354, 4.846831, 0, 0, 0, 1, 1,
0.0208983, -0.9158564, 2.52301, 0, 0, 0, 1, 1,
0.02168007, 1.999331, 0.5707632, 0, 0, 0, 1, 1,
0.0224393, 1.062189, -0.882817, 0, 0, 0, 1, 1,
0.02360993, 1.283278, 2.336704, 0, 0, 0, 1, 1,
0.02399683, 0.4642942, -0.1591569, 0, 0, 0, 1, 1,
0.02534356, 1.9912, 2.43475, 0, 0, 0, 1, 1,
0.02759566, -0.8070484, 2.613998, 1, 1, 1, 1, 1,
0.02899392, 0.7222761, -0.8540406, 1, 1, 1, 1, 1,
0.03827719, -0.8121294, 2.731848, 1, 1, 1, 1, 1,
0.03993044, -0.7418489, 3.43763, 1, 1, 1, 1, 1,
0.04044932, 1.290232, -0.4448754, 1, 1, 1, 1, 1,
0.04227408, -0.2348816, 3.680691, 1, 1, 1, 1, 1,
0.04320608, -0.02451312, -0.8404254, 1, 1, 1, 1, 1,
0.04391682, -0.452867, 1.437501, 1, 1, 1, 1, 1,
0.04717254, -0.8714681, 2.866994, 1, 1, 1, 1, 1,
0.05031263, 1.074487, 0.1583559, 1, 1, 1, 1, 1,
0.0533308, -0.4611524, 2.799893, 1, 1, 1, 1, 1,
0.05704113, -1.145774, 4.504073, 1, 1, 1, 1, 1,
0.05820299, -0.7026444, 4.428349, 1, 1, 1, 1, 1,
0.05926683, 1.822788, 0.142138, 1, 1, 1, 1, 1,
0.0620455, -1.11874, 4.394791, 1, 1, 1, 1, 1,
0.06688964, 1.045494, 0.1299026, 0, 0, 1, 1, 1,
0.06766623, 0.772778, -0.5218286, 1, 0, 0, 1, 1,
0.06935206, 0.7387401, -1.326802, 1, 0, 0, 1, 1,
0.07202909, -0.8761659, 3.493453, 1, 0, 0, 1, 1,
0.07603499, -1.576704, 3.333822, 1, 0, 0, 1, 1,
0.0762019, 0.884883, 0.5128551, 1, 0, 0, 1, 1,
0.07680077, -1.560502, 3.316387, 0, 0, 0, 1, 1,
0.0772587, -0.1106003, 3.253424, 0, 0, 0, 1, 1,
0.07855958, 0.3576068, 1.35519, 0, 0, 0, 1, 1,
0.07868344, -0.943295, 2.708094, 0, 0, 0, 1, 1,
0.0861683, -0.2050424, 3.445096, 0, 0, 0, 1, 1,
0.08975934, -0.3381222, 1.682611, 0, 0, 0, 1, 1,
0.09016082, 0.1947204, 1.825374, 0, 0, 0, 1, 1,
0.09211928, 0.1873876, -0.2245921, 1, 1, 1, 1, 1,
0.09576605, -1.06975, 3.216952, 1, 1, 1, 1, 1,
0.09634442, -0.4757892, 4.483797, 1, 1, 1, 1, 1,
0.0964966, -0.256474, 4.650541, 1, 1, 1, 1, 1,
0.09696131, -0.2203258, 3.64394, 1, 1, 1, 1, 1,
0.09993572, -0.396099, 4.574645, 1, 1, 1, 1, 1,
0.1002387, 1.16753, 0.956275, 1, 1, 1, 1, 1,
0.1020113, 1.406672, 2.596008, 1, 1, 1, 1, 1,
0.1031102, 0.4972765, -0.09707516, 1, 1, 1, 1, 1,
0.1059365, 0.08200594, 2.285455, 1, 1, 1, 1, 1,
0.1079078, -1.286706, 4.732761, 1, 1, 1, 1, 1,
0.1104358, -1.521066, 2.722051, 1, 1, 1, 1, 1,
0.115214, 0.6282459, 0.8839096, 1, 1, 1, 1, 1,
0.1171744, 0.004067157, 2.075372, 1, 1, 1, 1, 1,
0.1181647, -0.1761601, 2.21083, 1, 1, 1, 1, 1,
0.1201428, 0.2201815, 0.8986307, 0, 0, 1, 1, 1,
0.1238193, 0.6490267, 1.545087, 1, 0, 0, 1, 1,
0.1246963, 0.05618224, 0.01633338, 1, 0, 0, 1, 1,
0.1271023, -0.7050356, 2.849896, 1, 0, 0, 1, 1,
0.1373737, -0.9151411, 2.845307, 1, 0, 0, 1, 1,
0.1384615, 0.664727, 2.530106, 1, 0, 0, 1, 1,
0.1396415, 1.144917, -0.5207819, 0, 0, 0, 1, 1,
0.1436408, -1.606561, 2.720755, 0, 0, 0, 1, 1,
0.1487588, -0.3041445, 2.700481, 0, 0, 0, 1, 1,
0.1509189, 0.503612, -0.3565288, 0, 0, 0, 1, 1,
0.1538535, -1.885233, 3.413725, 0, 0, 0, 1, 1,
0.1549402, -0.4886796, 2.17731, 0, 0, 0, 1, 1,
0.15624, 1.237225, 0.08964439, 0, 0, 0, 1, 1,
0.161551, 0.1014199, 0.02444861, 1, 1, 1, 1, 1,
0.1702961, -0.1605579, 4.35434, 1, 1, 1, 1, 1,
0.1770256, -0.7984392, 1.766296, 1, 1, 1, 1, 1,
0.1793153, 0.02223418, 2.251313, 1, 1, 1, 1, 1,
0.1797278, 2.269409, 0.02325892, 1, 1, 1, 1, 1,
0.1797665, 2.343208, -0.03203608, 1, 1, 1, 1, 1,
0.192144, 0.4935874, 1.01147, 1, 1, 1, 1, 1,
0.2019667, 0.5389208, 1.30354, 1, 1, 1, 1, 1,
0.2023406, -0.2197218, 2.34921, 1, 1, 1, 1, 1,
0.2034052, -0.8465603, 3.274337, 1, 1, 1, 1, 1,
0.2236662, 1.020748, 1.069709, 1, 1, 1, 1, 1,
0.2286712, 0.6575367, -1.675206, 1, 1, 1, 1, 1,
0.2377211, -1.384032, 4.002483, 1, 1, 1, 1, 1,
0.2435895, -0.6751449, 0.9311933, 1, 1, 1, 1, 1,
0.2444041, 1.137899, -0.3673151, 1, 1, 1, 1, 1,
0.2487965, 0.7721257, 1.303213, 0, 0, 1, 1, 1,
0.249162, 1.753142, -0.2082136, 1, 0, 0, 1, 1,
0.2492355, -0.3562156, 3.509871, 1, 0, 0, 1, 1,
0.2568028, -0.04414994, 0.6255961, 1, 0, 0, 1, 1,
0.2582804, 0.250312, 0.7494031, 1, 0, 0, 1, 1,
0.2623783, 1.046482, 2.05557, 1, 0, 0, 1, 1,
0.2640289, -0.9916636, 2.317787, 0, 0, 0, 1, 1,
0.2669234, -0.5408508, 3.492484, 0, 0, 0, 1, 1,
0.2715771, 0.2033816, -0.9117369, 0, 0, 0, 1, 1,
0.2739087, 0.8387558, -0.0840154, 0, 0, 0, 1, 1,
0.2780831, 0.2384974, 2.399548, 0, 0, 0, 1, 1,
0.2786738, -0.1733181, 2.764554, 0, 0, 0, 1, 1,
0.2787667, -0.2944723, 2.599825, 0, 0, 0, 1, 1,
0.2826926, -0.9936242, 2.685401, 1, 1, 1, 1, 1,
0.283359, -1.603948, 4.871603, 1, 1, 1, 1, 1,
0.2866579, -2.28934, 2.847188, 1, 1, 1, 1, 1,
0.2873541, -0.5229583, 3.418521, 1, 1, 1, 1, 1,
0.28762, -0.9123777, 2.784891, 1, 1, 1, 1, 1,
0.2903036, -0.1443482, 0.5491298, 1, 1, 1, 1, 1,
0.2913369, 0.5836961, 0.6855548, 1, 1, 1, 1, 1,
0.2991973, -2.874269, 3.807171, 1, 1, 1, 1, 1,
0.2999228, 0.5428043, -0.3266091, 1, 1, 1, 1, 1,
0.3009726, 0.962685, 0.9272197, 1, 1, 1, 1, 1,
0.301785, -1.740874, 3.104334, 1, 1, 1, 1, 1,
0.3023741, 2.239539, -0.1409111, 1, 1, 1, 1, 1,
0.3035748, -0.7018979, 3.117344, 1, 1, 1, 1, 1,
0.3099971, 1.217313, 0.3576714, 1, 1, 1, 1, 1,
0.3220586, 0.9961018, -1.591249, 1, 1, 1, 1, 1,
0.3231001, 1.021821, 0.7516237, 0, 0, 1, 1, 1,
0.3252919, 0.09225915, 1.493074, 1, 0, 0, 1, 1,
0.3265642, -0.5041246, 3.576679, 1, 0, 0, 1, 1,
0.3269666, -0.331179, 2.082878, 1, 0, 0, 1, 1,
0.3332237, -1.06373, 2.951723, 1, 0, 0, 1, 1,
0.3337413, -1.651096, 3.069417, 1, 0, 0, 1, 1,
0.3350521, 0.2611453, 0.6919051, 0, 0, 0, 1, 1,
0.3362026, 0.5893398, 0.6458259, 0, 0, 0, 1, 1,
0.339173, -1.330968, 3.35925, 0, 0, 0, 1, 1,
0.339336, 1.413883, 1.948913, 0, 0, 0, 1, 1,
0.3409584, -0.9782461, 1.660487, 0, 0, 0, 1, 1,
0.3434857, -1.817608, 2.858455, 0, 0, 0, 1, 1,
0.3439753, -0.8437602, 0.7467352, 0, 0, 0, 1, 1,
0.3505365, 1.5154, -0.4766417, 1, 1, 1, 1, 1,
0.3530363, -0.7049475, 3.42736, 1, 1, 1, 1, 1,
0.3558283, -0.5267773, 3.09754, 1, 1, 1, 1, 1,
0.3680382, 0.5042088, 2.879844, 1, 1, 1, 1, 1,
0.3686867, 0.1884963, -0.3202385, 1, 1, 1, 1, 1,
0.3694837, 1.141158, 1.196245, 1, 1, 1, 1, 1,
0.37568, 0.6396534, 1.329326, 1, 1, 1, 1, 1,
0.3819051, -0.6468309, 3.585221, 1, 1, 1, 1, 1,
0.3855194, -1.05548, 2.244167, 1, 1, 1, 1, 1,
0.3885953, -0.8194221, 3.294883, 1, 1, 1, 1, 1,
0.3933721, -1.263747, 2.580602, 1, 1, 1, 1, 1,
0.3993674, -1.175218, 2.651209, 1, 1, 1, 1, 1,
0.403425, -1.234124, 1.661772, 1, 1, 1, 1, 1,
0.4091231, 0.5577444, 1.673994, 1, 1, 1, 1, 1,
0.415346, -0.1827316, 0.689842, 1, 1, 1, 1, 1,
0.4162281, -0.5275804, 3.675891, 0, 0, 1, 1, 1,
0.4170927, 1.147419, -0.7233788, 1, 0, 0, 1, 1,
0.4172736, -0.2855086, 4.01379, 1, 0, 0, 1, 1,
0.4177017, -1.537612, 3.64037, 1, 0, 0, 1, 1,
0.4189658, -1.020443, 3.006618, 1, 0, 0, 1, 1,
0.4195912, -0.5872553, 2.541782, 1, 0, 0, 1, 1,
0.4200273, 2.069898, 0.960939, 0, 0, 0, 1, 1,
0.4216365, 0.07290027, -0.1472783, 0, 0, 0, 1, 1,
0.4218755, 0.2395614, 2.762126, 0, 0, 0, 1, 1,
0.4231236, 1.026019, -1.542052, 0, 0, 0, 1, 1,
0.4241485, 0.5856028, 1.837284, 0, 0, 0, 1, 1,
0.4257224, -0.01377241, 2.155854, 0, 0, 0, 1, 1,
0.4263395, 1.710229, -1.857965, 0, 0, 0, 1, 1,
0.4321232, -0.254728, 3.44571, 1, 1, 1, 1, 1,
0.4327801, -1.818705, 3.875018, 1, 1, 1, 1, 1,
0.433077, -1.044995, 3.262477, 1, 1, 1, 1, 1,
0.434857, 0.5229348, 1.01539, 1, 1, 1, 1, 1,
0.4353678, 0.5844613, 0.3809474, 1, 1, 1, 1, 1,
0.4366344, 0.02901615, 2.523594, 1, 1, 1, 1, 1,
0.4373584, -1.355878, 3.721413, 1, 1, 1, 1, 1,
0.4417066, -0.7990549, 3.356292, 1, 1, 1, 1, 1,
0.444038, -0.3556674, 0.1631426, 1, 1, 1, 1, 1,
0.4526319, -1.747333, 2.702551, 1, 1, 1, 1, 1,
0.4555904, -0.4085328, 2.333305, 1, 1, 1, 1, 1,
0.4558145, 2.452978, 0.01148091, 1, 1, 1, 1, 1,
0.4566538, 0.8623877, -0.3106827, 1, 1, 1, 1, 1,
0.4590798, 0.2202417, 1.149898, 1, 1, 1, 1, 1,
0.4592174, -1.821577, 3.69766, 1, 1, 1, 1, 1,
0.4654999, -1.075416, 3.056571, 0, 0, 1, 1, 1,
0.4655488, -0.1824733, 1.908839, 1, 0, 0, 1, 1,
0.4676034, -0.7482356, 2.642954, 1, 0, 0, 1, 1,
0.4686561, -0.01964217, 1.765413, 1, 0, 0, 1, 1,
0.4693959, -0.5275776, 3.999813, 1, 0, 0, 1, 1,
0.470528, -1.60487, 4.393036, 1, 0, 0, 1, 1,
0.4731611, 0.03006797, 0.8308234, 0, 0, 0, 1, 1,
0.4768983, -0.6929215, 2.584392, 0, 0, 0, 1, 1,
0.4835577, 1.001779, 0.4369741, 0, 0, 0, 1, 1,
0.4838958, -0.6013209, 3.327176, 0, 0, 0, 1, 1,
0.4878362, -1.459316, 3.462209, 0, 0, 0, 1, 1,
0.4915578, 1.320145, 3.17222, 0, 0, 0, 1, 1,
0.4983158, 0.6983545, 0.2428527, 0, 0, 0, 1, 1,
0.4995696, 1.213382, -0.0311779, 1, 1, 1, 1, 1,
0.501408, -0.4439611, 3.008021, 1, 1, 1, 1, 1,
0.5060059, 0.2928011, -2.09852, 1, 1, 1, 1, 1,
0.5170308, -0.1320039, 0.9481015, 1, 1, 1, 1, 1,
0.5178291, -0.4454649, 3.769439, 1, 1, 1, 1, 1,
0.5213524, -0.0444911, 1.900123, 1, 1, 1, 1, 1,
0.5240069, 0.6317951, -1.522611, 1, 1, 1, 1, 1,
0.525071, -0.4186522, 2.481045, 1, 1, 1, 1, 1,
0.5251974, -3.247205, 3.236173, 1, 1, 1, 1, 1,
0.533374, -0.06191448, 0.006466432, 1, 1, 1, 1, 1,
0.5334467, 2.024806, 1.154178, 1, 1, 1, 1, 1,
0.5365577, -0.2680805, 1.466485, 1, 1, 1, 1, 1,
0.5385731, 0.8784533, 1.204903, 1, 1, 1, 1, 1,
0.5405105, 0.8680579, 0.07557012, 1, 1, 1, 1, 1,
0.5414469, 0.1739577, 0.2943132, 1, 1, 1, 1, 1,
0.5432305, -1.508641, 1.449382, 0, 0, 1, 1, 1,
0.5435171, 1.825086, 0.4925953, 1, 0, 0, 1, 1,
0.5454518, -0.5608689, 2.107642, 1, 0, 0, 1, 1,
0.5493023, -1.283737, 2.622118, 1, 0, 0, 1, 1,
0.5521516, -0.8366222, 1.182849, 1, 0, 0, 1, 1,
0.5615743, -0.9905528, 1.598339, 1, 0, 0, 1, 1,
0.5727874, -1.658926, 2.889593, 0, 0, 0, 1, 1,
0.574038, -2.422445, 3.873045, 0, 0, 0, 1, 1,
0.5743399, 0.07089528, 0.2872966, 0, 0, 0, 1, 1,
0.5764045, 1.669405, 1.194707, 0, 0, 0, 1, 1,
0.5804349, 2.039747, 0.2249198, 0, 0, 0, 1, 1,
0.5817909, -0.07266851, 2.655223, 0, 0, 0, 1, 1,
0.5827547, 0.2263674, 0.9648979, 0, 0, 0, 1, 1,
0.5860129, 1.683047, -0.4615902, 1, 1, 1, 1, 1,
0.5898131, -0.9329268, 3.44119, 1, 1, 1, 1, 1,
0.5970285, 1.828042, -0.1984878, 1, 1, 1, 1, 1,
0.5975264, 0.5094535, 2.472763, 1, 1, 1, 1, 1,
0.6046084, 1.085033, -1.430447, 1, 1, 1, 1, 1,
0.6074988, -1.21638, 2.498175, 1, 1, 1, 1, 1,
0.6087935, 2.676061, -0.8684751, 1, 1, 1, 1, 1,
0.6126652, -0.8986089, 4.044051, 1, 1, 1, 1, 1,
0.6151664, 0.7134125, 1.075872, 1, 1, 1, 1, 1,
0.6229413, -1.658824, 3.23718, 1, 1, 1, 1, 1,
0.6322019, 1.806403, 0.3316942, 1, 1, 1, 1, 1,
0.6341725, -1.155078, 1.689316, 1, 1, 1, 1, 1,
0.6344283, -1.428951, 1.796184, 1, 1, 1, 1, 1,
0.6346147, -0.4285721, 3.347856, 1, 1, 1, 1, 1,
0.6346773, -0.3149139, 1.854073, 1, 1, 1, 1, 1,
0.6384537, -0.3388121, 2.780232, 0, 0, 1, 1, 1,
0.6411374, -0.04522157, 4.339518, 1, 0, 0, 1, 1,
0.6446394, -0.08698694, 1.64539, 1, 0, 0, 1, 1,
0.6462521, -3.328255, 4.821422, 1, 0, 0, 1, 1,
0.6498147, -0.09017576, 1.318243, 1, 0, 0, 1, 1,
0.6508767, 0.07091349, 1.63543, 1, 0, 0, 1, 1,
0.6566656, 0.06234835, 0.1181326, 0, 0, 0, 1, 1,
0.6578133, -0.6337059, 1.490634, 0, 0, 0, 1, 1,
0.6590139, -0.1911834, 1.812746, 0, 0, 0, 1, 1,
0.6606299, 0.9607546, -0.6823881, 0, 0, 0, 1, 1,
0.6643562, -0.006276111, 1.645439, 0, 0, 0, 1, 1,
0.668765, -0.9858834, 2.785606, 0, 0, 0, 1, 1,
0.6736662, -1.436119, 3.159323, 0, 0, 0, 1, 1,
0.67549, -0.9199386, 1.510878, 1, 1, 1, 1, 1,
0.6802791, 1.998103, -1.467488, 1, 1, 1, 1, 1,
0.6814007, 0.5430434, 0.6697133, 1, 1, 1, 1, 1,
0.6848038, 0.4264191, 0.7408656, 1, 1, 1, 1, 1,
0.6849094, 1.488923, 0.4834246, 1, 1, 1, 1, 1,
0.6883666, -0.7898981, 4.931611, 1, 1, 1, 1, 1,
0.6987907, -0.6071206, 2.266675, 1, 1, 1, 1, 1,
0.698807, 0.2384489, 3.160266, 1, 1, 1, 1, 1,
0.6995733, -1.518795, 2.756269, 1, 1, 1, 1, 1,
0.7020112, 1.890429, 0.4222037, 1, 1, 1, 1, 1,
0.7034798, -0.1846874, 1.151592, 1, 1, 1, 1, 1,
0.7044091, 0.08941913, 2.004129, 1, 1, 1, 1, 1,
0.7047368, -0.1226865, 0.82426, 1, 1, 1, 1, 1,
0.7066396, 0.5152951, 2.483753, 1, 1, 1, 1, 1,
0.7130828, -0.2832015, 0.6866713, 1, 1, 1, 1, 1,
0.7164086, 1.035181, 1.686279, 0, 0, 1, 1, 1,
0.7186307, -1.159039, 2.209143, 1, 0, 0, 1, 1,
0.7353728, 1.742506, 1.122354, 1, 0, 0, 1, 1,
0.7361767, 1.481237, -0.1861827, 1, 0, 0, 1, 1,
0.7364633, 1.055654, 2.635044, 1, 0, 0, 1, 1,
0.738188, -0.9778241, 2.216335, 1, 0, 0, 1, 1,
0.7391097, -2.266521, 4.104764, 0, 0, 0, 1, 1,
0.7409566, 1.046327, 0.04666274, 0, 0, 0, 1, 1,
0.7444862, 0.5428309, 0.4200408, 0, 0, 0, 1, 1,
0.7458192, 0.2308751, 0.2947061, 0, 0, 0, 1, 1,
0.756643, 1.433635, 0.362846, 0, 0, 0, 1, 1,
0.7573585, -1.385165, 0.6673055, 0, 0, 0, 1, 1,
0.7586806, -0.131356, 0.8407188, 0, 0, 0, 1, 1,
0.7614816, 1.208608, 0.4364502, 1, 1, 1, 1, 1,
0.7624106, -0.8728302, 3.045016, 1, 1, 1, 1, 1,
0.7660848, -1.894058, 2.597669, 1, 1, 1, 1, 1,
0.7695924, -0.6215209, 2.907933, 1, 1, 1, 1, 1,
0.7701521, 0.7339274, -0.3210216, 1, 1, 1, 1, 1,
0.77735, 1.606739, -0.3276522, 1, 1, 1, 1, 1,
0.7774807, 1.25853, 0.3613116, 1, 1, 1, 1, 1,
0.7800281, 0.1535098, 0.8647554, 1, 1, 1, 1, 1,
0.780916, -1.461079, 2.458542, 1, 1, 1, 1, 1,
0.7833483, -0.08344931, 2.329745, 1, 1, 1, 1, 1,
0.7854901, -0.007979856, 3.346021, 1, 1, 1, 1, 1,
0.7880083, 1.279001, -1.003896, 1, 1, 1, 1, 1,
0.7912505, -0.004023076, -0.9980267, 1, 1, 1, 1, 1,
0.7934711, -0.3396276, 3.13092, 1, 1, 1, 1, 1,
0.7987282, 0.002818596, 2.284578, 1, 1, 1, 1, 1,
0.7995774, -0.6278898, 2.378476, 0, 0, 1, 1, 1,
0.8012382, 0.2942099, 0.1316905, 1, 0, 0, 1, 1,
0.8062037, -0.9623914, 0.07221362, 1, 0, 0, 1, 1,
0.8076857, -1.343849, 3.244573, 1, 0, 0, 1, 1,
0.8116395, -0.07205701, 1.522602, 1, 0, 0, 1, 1,
0.8177462, -1.266895, 2.718601, 1, 0, 0, 1, 1,
0.8233426, 1.225968, 3.44714, 0, 0, 0, 1, 1,
0.8248879, 0.797344, -0.2276649, 0, 0, 0, 1, 1,
0.8287119, 0.7022135, 1.791088, 0, 0, 0, 1, 1,
0.8307683, 0.8746658, 0.8213873, 0, 0, 0, 1, 1,
0.8362647, -1.099463, 3.888585, 0, 0, 0, 1, 1,
0.8394628, -0.3316023, 2.885202, 0, 0, 0, 1, 1,
0.8404351, 0.5954049, 0.9185813, 0, 0, 0, 1, 1,
0.8407734, 0.02964702, 3.437942, 1, 1, 1, 1, 1,
0.8416659, -1.665826, 3.248898, 1, 1, 1, 1, 1,
0.8591831, 1.5638, -0.5655422, 1, 1, 1, 1, 1,
0.8651611, -1.107584, 2.39173, 1, 1, 1, 1, 1,
0.8662811, 0.182489, 0.472087, 1, 1, 1, 1, 1,
0.8670574, 0.8479141, 0.9051051, 1, 1, 1, 1, 1,
0.8684362, 0.4862011, 1.387608, 1, 1, 1, 1, 1,
0.8699279, -0.1482504, 2.338665, 1, 1, 1, 1, 1,
0.8705194, -1.866847, 3.133416, 1, 1, 1, 1, 1,
0.8727297, -0.1257326, 2.140287, 1, 1, 1, 1, 1,
0.8750383, 0.1761212, 0.5853083, 1, 1, 1, 1, 1,
0.8836274, -0.9203144, 1.487775, 1, 1, 1, 1, 1,
0.8854516, 1.061781, 0.5601448, 1, 1, 1, 1, 1,
0.8856298, 1.10298, -0.3293431, 1, 1, 1, 1, 1,
0.8902842, -0.1223318, 2.170191, 1, 1, 1, 1, 1,
0.8929026, 0.09202782, 0.4520407, 0, 0, 1, 1, 1,
0.8975827, 0.3439186, 0.4160377, 1, 0, 0, 1, 1,
0.9110943, 0.6412142, -0.5901267, 1, 0, 0, 1, 1,
0.9163982, 1.699643, 0.1382261, 1, 0, 0, 1, 1,
0.9193919, 0.4603543, 3.034442, 1, 0, 0, 1, 1,
0.9197614, 0.5831003, 0.9588509, 1, 0, 0, 1, 1,
0.9220013, -1.350834, 2.622905, 0, 0, 0, 1, 1,
0.924266, -0.3553842, 3.256704, 0, 0, 0, 1, 1,
0.924295, 0.2882743, 1.475232, 0, 0, 0, 1, 1,
0.9245018, -1.323712, 3.071452, 0, 0, 0, 1, 1,
0.9302527, 0.2250568, 1.453283, 0, 0, 0, 1, 1,
0.9335615, -0.3701463, 0.8999612, 0, 0, 0, 1, 1,
0.934256, 1.638208, 0.5259392, 0, 0, 0, 1, 1,
0.937906, -1.490663, 3.523713, 1, 1, 1, 1, 1,
0.9385587, -2.314497, 3.318326, 1, 1, 1, 1, 1,
0.9411255, 1.35006, 1.572621, 1, 1, 1, 1, 1,
0.945002, -0.2808684, 0.4081993, 1, 1, 1, 1, 1,
0.9452198, -1.130006, 1.626163, 1, 1, 1, 1, 1,
0.9538181, 0.2904474, 1.593642, 1, 1, 1, 1, 1,
0.9603668, -0.3164335, 1.976873, 1, 1, 1, 1, 1,
0.9750558, 1.913118, 1.47796, 1, 1, 1, 1, 1,
0.9919907, 0.1005242, 2.204075, 1, 1, 1, 1, 1,
0.9956063, 0.3284821, 0.8497185, 1, 1, 1, 1, 1,
1.014611, -0.9402236, 2.82162, 1, 1, 1, 1, 1,
1.019252, -0.7306279, 0.8711802, 1, 1, 1, 1, 1,
1.02014, 1.474006, 1.663625, 1, 1, 1, 1, 1,
1.0207, 0.5191095, 2.072917, 1, 1, 1, 1, 1,
1.028891, 1.857948, 1.038197, 1, 1, 1, 1, 1,
1.04068, -0.2406161, 2.646577, 0, 0, 1, 1, 1,
1.042855, 1.379364, 1.647858, 1, 0, 0, 1, 1,
1.057596, 0.01683919, 1.676432, 1, 0, 0, 1, 1,
1.05851, -0.5562969, 1.383587, 1, 0, 0, 1, 1,
1.072882, -0.7871492, 2.761519, 1, 0, 0, 1, 1,
1.07613, -0.002087048, 0.886216, 1, 0, 0, 1, 1,
1.078752, 0.5077434, 1.946334, 0, 0, 0, 1, 1,
1.083372, -0.1554026, 3.032575, 0, 0, 0, 1, 1,
1.086336, 0.649096, -1.177626, 0, 0, 0, 1, 1,
1.091492, -2.089435, 2.909763, 0, 0, 0, 1, 1,
1.091988, -0.9183683, 1.699568, 0, 0, 0, 1, 1,
1.095828, 0.2029526, 1.962, 0, 0, 0, 1, 1,
1.097255, -1.208567, 1.754466, 0, 0, 0, 1, 1,
1.098719, -0.5353261, 2.618077, 1, 1, 1, 1, 1,
1.104815, -0.4768157, 2.182512, 1, 1, 1, 1, 1,
1.108225, 0.01491844, 2.940285, 1, 1, 1, 1, 1,
1.109023, 1.723739, -2.14699, 1, 1, 1, 1, 1,
1.110912, -0.9684424, 1.66914, 1, 1, 1, 1, 1,
1.113587, 0.7097502, 0.2770081, 1, 1, 1, 1, 1,
1.119844, 1.219447, 2.58099, 1, 1, 1, 1, 1,
1.125078, 0.6996827, -0.005336061, 1, 1, 1, 1, 1,
1.142561, -0.4079096, 0.9301978, 1, 1, 1, 1, 1,
1.142594, -1.153262, 0.7621371, 1, 1, 1, 1, 1,
1.146566, -0.9136058, 0.8922659, 1, 1, 1, 1, 1,
1.148793, 0.4177449, 1.665877, 1, 1, 1, 1, 1,
1.156852, 0.8764719, 1.165064, 1, 1, 1, 1, 1,
1.160264, 1.229659, 0.7361618, 1, 1, 1, 1, 1,
1.171471, 1.655811, 1.562797, 1, 1, 1, 1, 1,
1.183777, -0.4935169, 2.091416, 0, 0, 1, 1, 1,
1.184026, -1.156615, 1.022977, 1, 0, 0, 1, 1,
1.189958, 0.7382853, 2.143278, 1, 0, 0, 1, 1,
1.193964, 2.786855, 0.2795697, 1, 0, 0, 1, 1,
1.194886, -0.4957033, 1.852948, 1, 0, 0, 1, 1,
1.199149, -0.479803, 1.437134, 1, 0, 0, 1, 1,
1.202617, -0.5172156, 3.315012, 0, 0, 0, 1, 1,
1.214043, 0.3233461, 1.236885, 0, 0, 0, 1, 1,
1.217646, 0.1196556, 2.173299, 0, 0, 0, 1, 1,
1.223788, 1.020026, 0.3825062, 0, 0, 0, 1, 1,
1.226124, -0.6158087, 1.232891, 0, 0, 0, 1, 1,
1.228552, -0.7882227, 3.327563, 0, 0, 0, 1, 1,
1.231553, -0.2207815, 1.245213, 0, 0, 0, 1, 1,
1.233435, -0.6609868, 1.209093, 1, 1, 1, 1, 1,
1.237748, 0.07415741, 2.534183, 1, 1, 1, 1, 1,
1.243118, 0.09906019, 1.56509, 1, 1, 1, 1, 1,
1.243571, -0.1057204, 2.276039, 1, 1, 1, 1, 1,
1.254754, 0.08394171, 1.609549, 1, 1, 1, 1, 1,
1.271011, -2.036081, 2.732537, 1, 1, 1, 1, 1,
1.272563, -0.7864563, 2.59645, 1, 1, 1, 1, 1,
1.274279, 3.020599, 0.3750521, 1, 1, 1, 1, 1,
1.280143, 0.1805762, 2.550395, 1, 1, 1, 1, 1,
1.284286, -0.9789082, 1.436987, 1, 1, 1, 1, 1,
1.286893, 1.597636, -0.12052, 1, 1, 1, 1, 1,
1.290571, -0.7355834, 3.647026, 1, 1, 1, 1, 1,
1.293594, 0.1361741, 1.444714, 1, 1, 1, 1, 1,
1.294314, -0.8326913, 2.678735, 1, 1, 1, 1, 1,
1.302872, 1.039207, 0.7674415, 1, 1, 1, 1, 1,
1.305509, -1.480555, 0.9624822, 0, 0, 1, 1, 1,
1.312286, -0.09764319, 1.183377, 1, 0, 0, 1, 1,
1.335843, 0.5510597, -0.09747048, 1, 0, 0, 1, 1,
1.338108, 1.108346, 0.5953904, 1, 0, 0, 1, 1,
1.339636, -0.2114732, 2.404737, 1, 0, 0, 1, 1,
1.343246, 0.3963085, 1.281406, 1, 0, 0, 1, 1,
1.347075, -0.9030793, 3.369875, 0, 0, 0, 1, 1,
1.34818, 1.115476, 2.286359, 0, 0, 0, 1, 1,
1.348622, -0.1894776, 0.3929205, 0, 0, 0, 1, 1,
1.355062, -0.8447791, 4.899094, 0, 0, 0, 1, 1,
1.357441, -1.02148, 1.168393, 0, 0, 0, 1, 1,
1.367689, 1.055797, 1.506901, 0, 0, 0, 1, 1,
1.376885, 0.03572219, 1.13004, 0, 0, 0, 1, 1,
1.388118, -1.902239, 1.087615, 1, 1, 1, 1, 1,
1.391145, -0.8882822, 2.700071, 1, 1, 1, 1, 1,
1.398183, -1.462885, 3.023217, 1, 1, 1, 1, 1,
1.400084, 1.103319, 0.6519493, 1, 1, 1, 1, 1,
1.410624, 1.578826, -1.223239, 1, 1, 1, 1, 1,
1.417745, 2.071658, -0.385627, 1, 1, 1, 1, 1,
1.421774, -0.7320383, 2.495022, 1, 1, 1, 1, 1,
1.42228, -0.9243701, 1.537943, 1, 1, 1, 1, 1,
1.424042, -2.719452, 2.658769, 1, 1, 1, 1, 1,
1.427452, -0.6543574, 4.065582, 1, 1, 1, 1, 1,
1.437464, 0.09193537, 2.41318, 1, 1, 1, 1, 1,
1.450232, -0.6872084, 2.58279, 1, 1, 1, 1, 1,
1.45241, -0.42011, -0.07210013, 1, 1, 1, 1, 1,
1.467444, 2.834593, 1.366271, 1, 1, 1, 1, 1,
1.475988, -2.217412, 2.935767, 1, 1, 1, 1, 1,
1.479541, 1.194472, 2.49068, 0, 0, 1, 1, 1,
1.496737, 0.08088537, 0.4944063, 1, 0, 0, 1, 1,
1.504037, 0.7222159, 2.005028, 1, 0, 0, 1, 1,
1.512215, -0.7964734, 0.4839034, 1, 0, 0, 1, 1,
1.513442, -0.2227199, 2.301365, 1, 0, 0, 1, 1,
1.516817, 1.366366, -0.06522068, 1, 0, 0, 1, 1,
1.519993, 1.071271, 0.6358742, 0, 0, 0, 1, 1,
1.526167, 0.4592722, 1.817075, 0, 0, 0, 1, 1,
1.539565, -1.658147, 2.161684, 0, 0, 0, 1, 1,
1.551035, 0.3738208, -0.6724588, 0, 0, 0, 1, 1,
1.551162, -0.905957, 2.656274, 0, 0, 0, 1, 1,
1.560067, 1.836523, 1.628641, 0, 0, 0, 1, 1,
1.560121, 1.971283, 0.5818488, 0, 0, 0, 1, 1,
1.593922, -0.4323177, 3.133115, 1, 1, 1, 1, 1,
1.597751, 0.3710976, 2.350932, 1, 1, 1, 1, 1,
1.599425, 0.3682045, 1.41738, 1, 1, 1, 1, 1,
1.600147, 0.6127942, 1.743923, 1, 1, 1, 1, 1,
1.637601, 0.1095142, 1.911447, 1, 1, 1, 1, 1,
1.642511, -0.4462656, 3.490246, 1, 1, 1, 1, 1,
1.652903, 0.4656013, 1.01454, 1, 1, 1, 1, 1,
1.66154, 0.1397043, 1.184806, 1, 1, 1, 1, 1,
1.681404, -0.4600104, 2.024041, 1, 1, 1, 1, 1,
1.694548, -0.1217566, 0.7823149, 1, 1, 1, 1, 1,
1.695258, 0.4795343, 2.007357, 1, 1, 1, 1, 1,
1.72885, 0.9959573, 0.6741083, 1, 1, 1, 1, 1,
1.735114, 0.5223547, 2.778285, 1, 1, 1, 1, 1,
1.737472, 0.3548823, 1.513835, 1, 1, 1, 1, 1,
1.738236, -0.9336415, 1.811769, 1, 1, 1, 1, 1,
1.739137, -0.58943, -0.2105148, 0, 0, 1, 1, 1,
1.745806, -2.216498, 2.893448, 1, 0, 0, 1, 1,
1.747764, -2.643624, 2.338563, 1, 0, 0, 1, 1,
1.749668, -0.7347178, 1.313772, 1, 0, 0, 1, 1,
1.755804, 0.8161684, 2.872457, 1, 0, 0, 1, 1,
1.769229, -0.02534253, 2.967107, 1, 0, 0, 1, 1,
1.770215, 0.09401701, 1.16894, 0, 0, 0, 1, 1,
1.779604, -0.4319122, 3.535936, 0, 0, 0, 1, 1,
1.779675, -0.2288021, 2.109063, 0, 0, 0, 1, 1,
1.804721, 0.8195736, 1.823616, 0, 0, 0, 1, 1,
1.8095, -1.365177, 2.227476, 0, 0, 0, 1, 1,
1.817219, -0.03433087, 2.9499, 0, 0, 0, 1, 1,
1.820992, 0.6072851, 1.117887, 0, 0, 0, 1, 1,
1.82645, 3.228783, 0.3776124, 1, 1, 1, 1, 1,
1.826734, 0.6042302, 3.709999, 1, 1, 1, 1, 1,
1.840301, -0.2954064, 0.7863604, 1, 1, 1, 1, 1,
1.841256, 1.364718, 0.8597926, 1, 1, 1, 1, 1,
1.84844, 0.4065953, -0.2000476, 1, 1, 1, 1, 1,
1.862545, 0.2584, 1.473996, 1, 1, 1, 1, 1,
1.876958, -0.7842319, 3.249448, 1, 1, 1, 1, 1,
1.881469, 0.4352902, 2.095021, 1, 1, 1, 1, 1,
1.883216, -2.316153, 2.056108, 1, 1, 1, 1, 1,
1.92067, -0.07016216, 2.314048, 1, 1, 1, 1, 1,
1.954613, -0.7214046, 2.536551, 1, 1, 1, 1, 1,
1.96055, -0.1677011, 0.8706461, 1, 1, 1, 1, 1,
1.970586, -1.107847, 2.404944, 1, 1, 1, 1, 1,
2.010684, -0.1192539, 0.8338816, 1, 1, 1, 1, 1,
2.013369, 0.8470674, 1.493698, 1, 1, 1, 1, 1,
2.035702, 0.01517473, 1.185849, 0, 0, 1, 1, 1,
2.038934, 0.5203568, 2.171328, 1, 0, 0, 1, 1,
2.082475, 0.4198116, 1.423605, 1, 0, 0, 1, 1,
2.122732, 0.03088598, 0.7289647, 1, 0, 0, 1, 1,
2.155803, -1.297243, 3.128981, 1, 0, 0, 1, 1,
2.17902, -1.228808, 1.762602, 1, 0, 0, 1, 1,
2.186552, -1.080119, 0.8941755, 0, 0, 0, 1, 1,
2.196019, 0.3505526, 1.076147, 0, 0, 0, 1, 1,
2.281286, 0.461957, 1.492944, 0, 0, 0, 1, 1,
2.316014, 0.2868066, 1.710768, 0, 0, 0, 1, 1,
2.39565, 0.7551981, 2.079835, 0, 0, 0, 1, 1,
2.407948, 0.7883535, -0.9644315, 0, 0, 0, 1, 1,
2.417408, -0.4268691, 0.8785532, 0, 0, 0, 1, 1,
2.429686, -0.8169188, 0.7391217, 1, 1, 1, 1, 1,
2.506016, 1.023883, 1.521448, 1, 1, 1, 1, 1,
2.558805, 1.526303, 0.331436, 1, 1, 1, 1, 1,
2.728407, -1.318596, 0.8222628, 1, 1, 1, 1, 1,
2.894787, 0.3446569, 0.2423437, 1, 1, 1, 1, 1,
3.037481, -1.070064, 1.932269, 1, 1, 1, 1, 1,
3.32919, -0.3356929, 2.358713, 1, 1, 1, 1, 1
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
var radius = 9.836536;
var distance = 34.55042;
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
mvMatrix.translate( 0.09629726, 0.2932131, 0.3875213 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.55042);
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
