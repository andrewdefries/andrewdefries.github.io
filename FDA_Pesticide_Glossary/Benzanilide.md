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
-4.168535, 0.3946344, -2.058452, 1, 0, 0, 1,
-3.696553, 0.4217998, -2.759476, 1, 0.007843138, 0, 1,
-3.552062, 0.6334666, -0.9699734, 1, 0.01176471, 0, 1,
-3.191287, -0.5926002, -2.423213, 1, 0.01960784, 0, 1,
-2.801866, -1.068487, -2.444082, 1, 0.02352941, 0, 1,
-2.765999, 1.816191, -1.88666, 1, 0.03137255, 0, 1,
-2.757935, -0.04137063, 0.06484668, 1, 0.03529412, 0, 1,
-2.707831, -2.176728, -2.30005, 1, 0.04313726, 0, 1,
-2.631336, 0.02299631, -1.413439, 1, 0.04705882, 0, 1,
-2.54316, -1.350448, -1.855349, 1, 0.05490196, 0, 1,
-2.54064, -0.2977089, -2.044754, 1, 0.05882353, 0, 1,
-2.51339, 1.476616, -1.521276, 1, 0.06666667, 0, 1,
-2.474366, -0.1011094, -2.715252, 1, 0.07058824, 0, 1,
-2.426451, 0.08892182, -1.699997, 1, 0.07843138, 0, 1,
-2.407596, -0.3527968, -2.330321, 1, 0.08235294, 0, 1,
-2.406632, -2.47296, -1.462164, 1, 0.09019608, 0, 1,
-2.235246, -0.06444063, -1.312812, 1, 0.09411765, 0, 1,
-2.228981, 0.2889552, -0.8182376, 1, 0.1019608, 0, 1,
-2.210077, 0.5049613, -1.160276, 1, 0.1098039, 0, 1,
-2.139264, 0.7271368, -2.26666, 1, 0.1137255, 0, 1,
-2.066371, 0.696089, -1.119553, 1, 0.1215686, 0, 1,
-2.058554, 0.01157601, -0.8081619, 1, 0.1254902, 0, 1,
-1.990845, -0.2722923, -2.938249, 1, 0.1333333, 0, 1,
-1.982373, -0.2533972, -0.9828373, 1, 0.1372549, 0, 1,
-1.980486, 1.761435, -0.5275194, 1, 0.145098, 0, 1,
-1.978341, -2.191957, -1.248267, 1, 0.1490196, 0, 1,
-1.947489, -0.4666873, -0.6045237, 1, 0.1568628, 0, 1,
-1.928535, -0.3763133, -1.678616, 1, 0.1607843, 0, 1,
-1.923628, 1.518164, -0.5100576, 1, 0.1686275, 0, 1,
-1.904186, -0.08449745, -0.9999421, 1, 0.172549, 0, 1,
-1.886581, -0.3593797, -2.670285, 1, 0.1803922, 0, 1,
-1.880943, -0.5523212, -1.587046, 1, 0.1843137, 0, 1,
-1.878804, 0.1585038, -3.105165, 1, 0.1921569, 0, 1,
-1.868849, -2.018306, -4.192087, 1, 0.1960784, 0, 1,
-1.813653, -0.4870202, 1.111592, 1, 0.2039216, 0, 1,
-1.784283, -0.1885196, -0.9654681, 1, 0.2117647, 0, 1,
-1.777048, -1.564905, -4.157249, 1, 0.2156863, 0, 1,
-1.768627, 0.1082801, -2.126654, 1, 0.2235294, 0, 1,
-1.724151, 0.5771345, -0.9933958, 1, 0.227451, 0, 1,
-1.716564, -0.5927249, -2.542096, 1, 0.2352941, 0, 1,
-1.698115, -0.3977004, -2.898202, 1, 0.2392157, 0, 1,
-1.688166, -0.1758754, -1.855067, 1, 0.2470588, 0, 1,
-1.671165, 0.6554881, -0.2885089, 1, 0.2509804, 0, 1,
-1.64793, -1.457613, -3.924635, 1, 0.2588235, 0, 1,
-1.635186, -0.1277081, -3.053186, 1, 0.2627451, 0, 1,
-1.632077, -1.804131, -1.453094, 1, 0.2705882, 0, 1,
-1.627746, 0.1793932, -0.8847945, 1, 0.2745098, 0, 1,
-1.624274, 0.1046972, -0.6113767, 1, 0.282353, 0, 1,
-1.593528, -1.430572, -3.394387, 1, 0.2862745, 0, 1,
-1.569752, -0.5826958, -1.405099, 1, 0.2941177, 0, 1,
-1.544532, 0.02102599, -1.830152, 1, 0.3019608, 0, 1,
-1.544275, -0.4330205, -2.087719, 1, 0.3058824, 0, 1,
-1.534341, -1.175057, -3.09145, 1, 0.3137255, 0, 1,
-1.534307, -0.6278177, -1.030775, 1, 0.3176471, 0, 1,
-1.519202, 0.1885362, -1.26162, 1, 0.3254902, 0, 1,
-1.515949, 0.1677655, -1.665257, 1, 0.3294118, 0, 1,
-1.508221, 1.336457, -1.359693, 1, 0.3372549, 0, 1,
-1.486189, -0.9010621, -3.477561, 1, 0.3411765, 0, 1,
-1.481001, -0.1016263, -0.9780745, 1, 0.3490196, 0, 1,
-1.477673, -1.443157, -2.617562, 1, 0.3529412, 0, 1,
-1.469107, -0.7705625, -1.681425, 1, 0.3607843, 0, 1,
-1.468769, -1.843717, 0.1273459, 1, 0.3647059, 0, 1,
-1.457338, -1.394659, -3.852987, 1, 0.372549, 0, 1,
-1.455351, -0.3392135, -1.339417, 1, 0.3764706, 0, 1,
-1.45476, 0.9808894, 0.6594175, 1, 0.3843137, 0, 1,
-1.45311, -0.4740847, -2.706143, 1, 0.3882353, 0, 1,
-1.448423, -0.9157462, -2.769088, 1, 0.3960784, 0, 1,
-1.438528, 1.742132, -0.6672481, 1, 0.4039216, 0, 1,
-1.429173, -1.079909, -2.69634, 1, 0.4078431, 0, 1,
-1.420888, 0.02433175, -0.04325712, 1, 0.4156863, 0, 1,
-1.416336, 0.06301697, -0.8397067, 1, 0.4196078, 0, 1,
-1.415146, -0.2886713, -2.153822, 1, 0.427451, 0, 1,
-1.406362, -0.4175862, -0.4937622, 1, 0.4313726, 0, 1,
-1.387952, 1.511555, 0.1896458, 1, 0.4392157, 0, 1,
-1.387478, 0.1104517, -0.6471947, 1, 0.4431373, 0, 1,
-1.365185, 1.783929, -0.7260774, 1, 0.4509804, 0, 1,
-1.356659, 0.4569174, -1.659255, 1, 0.454902, 0, 1,
-1.352457, -0.704842, -1.858036, 1, 0.4627451, 0, 1,
-1.34953, 0.4596682, -2.503468, 1, 0.4666667, 0, 1,
-1.34612, -0.3617576, -1.909446, 1, 0.4745098, 0, 1,
-1.344723, 0.09606244, -0.5471998, 1, 0.4784314, 0, 1,
-1.343179, -0.3422144, -2.862482, 1, 0.4862745, 0, 1,
-1.343057, 0.9080666, -0.2728199, 1, 0.4901961, 0, 1,
-1.341669, -1.323452, -3.413032, 1, 0.4980392, 0, 1,
-1.335918, -0.08566335, 0.3305151, 1, 0.5058824, 0, 1,
-1.33506, -0.38163, -2.78362, 1, 0.509804, 0, 1,
-1.334134, -0.4806188, -1.148175, 1, 0.5176471, 0, 1,
-1.327965, 1.115598, -0.4295409, 1, 0.5215687, 0, 1,
-1.320236, -0.4007975, -2.696359, 1, 0.5294118, 0, 1,
-1.292534, -0.9221108, -0.5260512, 1, 0.5333334, 0, 1,
-1.289357, 0.912294, -0.4599037, 1, 0.5411765, 0, 1,
-1.275982, -0.9502153, -1.859108, 1, 0.5450981, 0, 1,
-1.263456, -0.6486757, -1.575782, 1, 0.5529412, 0, 1,
-1.262409, -1.180356, -1.319898, 1, 0.5568628, 0, 1,
-1.261703, 0.8221847, -0.4450597, 1, 0.5647059, 0, 1,
-1.240264, -0.9879788, -1.181552, 1, 0.5686275, 0, 1,
-1.233036, 1.134632, -1.260701, 1, 0.5764706, 0, 1,
-1.230663, -0.2853341, -1.979464, 1, 0.5803922, 0, 1,
-1.223815, -0.6741961, -2.554651, 1, 0.5882353, 0, 1,
-1.219094, -0.2426646, -3.444378, 1, 0.5921569, 0, 1,
-1.217064, -0.5277992, -1.042207, 1, 0.6, 0, 1,
-1.217044, 0.6536832, -0.3141058, 1, 0.6078432, 0, 1,
-1.207875, -0.1781495, 0.005813886, 1, 0.6117647, 0, 1,
-1.200608, 1.476104, -0.545858, 1, 0.6196079, 0, 1,
-1.189192, 0.7938768, -0.1729486, 1, 0.6235294, 0, 1,
-1.178704, 0.809172, -3.154006, 1, 0.6313726, 0, 1,
-1.177595, 0.3934968, -2.63349, 1, 0.6352941, 0, 1,
-1.177503, -1.640435, -2.605677, 1, 0.6431373, 0, 1,
-1.176732, 1.463638, -0.9075313, 1, 0.6470588, 0, 1,
-1.172954, 0.386275, -2.457157, 1, 0.654902, 0, 1,
-1.172663, 0.5666225, -1.770726, 1, 0.6588235, 0, 1,
-1.170931, -1.205487, -0.4560569, 1, 0.6666667, 0, 1,
-1.167401, 0.7866091, 0.9200503, 1, 0.6705883, 0, 1,
-1.165272, 0.9662951, -1.820134, 1, 0.6784314, 0, 1,
-1.165032, -0.08740322, -2.630107, 1, 0.682353, 0, 1,
-1.156039, 0.9854059, -1.51231, 1, 0.6901961, 0, 1,
-1.129663, 1.123433, 1.248277, 1, 0.6941177, 0, 1,
-1.126903, -0.2424462, -2.22857, 1, 0.7019608, 0, 1,
-1.118035, 0.4664207, -2.25901, 1, 0.7098039, 0, 1,
-1.116608, 0.09991213, -1.063788, 1, 0.7137255, 0, 1,
-1.116567, 0.412808, -1.278958, 1, 0.7215686, 0, 1,
-1.113452, 0.8460538, -1.169792, 1, 0.7254902, 0, 1,
-1.110093, -0.7929609, -1.628041, 1, 0.7333333, 0, 1,
-1.107574, -0.1456777, -2.6158, 1, 0.7372549, 0, 1,
-1.104731, -0.4415039, -1.577909, 1, 0.7450981, 0, 1,
-1.100306, -2.773569, -1.59015, 1, 0.7490196, 0, 1,
-1.096053, -0.7813849, -2.588374, 1, 0.7568628, 0, 1,
-1.08901, 1.011706, -0.8913908, 1, 0.7607843, 0, 1,
-1.088875, -0.5409403, -1.290452, 1, 0.7686275, 0, 1,
-1.085171, 0.2800395, -1.02712, 1, 0.772549, 0, 1,
-1.080632, 0.1457883, -2.627269, 1, 0.7803922, 0, 1,
-1.076461, 2.656445, -0.9433608, 1, 0.7843137, 0, 1,
-1.075144, 1.038353, -1.261728, 1, 0.7921569, 0, 1,
-1.067032, 0.2369894, -0.9616727, 1, 0.7960784, 0, 1,
-1.065846, -1.445226, -1.672996, 1, 0.8039216, 0, 1,
-1.065347, 0.7580283, -1.459602, 1, 0.8117647, 0, 1,
-1.053238, -0.5519288, -3.117147, 1, 0.8156863, 0, 1,
-1.050532, 0.3935084, -1.553512, 1, 0.8235294, 0, 1,
-1.050467, -0.3204861, -2.862216, 1, 0.827451, 0, 1,
-1.049964, -1.350497, -1.887316, 1, 0.8352941, 0, 1,
-1.04254, -0.9772288, -1.413725, 1, 0.8392157, 0, 1,
-1.030991, 0.9017229, -1.268644, 1, 0.8470588, 0, 1,
-1.029941, 1.62482, -0.02541373, 1, 0.8509804, 0, 1,
-1.027614, -0.8239983, -2.831877, 1, 0.8588235, 0, 1,
-1.025202, 1.758345, 0.7912246, 1, 0.8627451, 0, 1,
-1.022131, 0.8128922, -1.399265, 1, 0.8705882, 0, 1,
-1.000641, -0.8391342, -1.759363, 1, 0.8745098, 0, 1,
-0.9935088, -0.5265405, -3.216605, 1, 0.8823529, 0, 1,
-0.991915, 1.894356, 0.2680754, 1, 0.8862745, 0, 1,
-0.9885639, -0.909048, -1.07412, 1, 0.8941177, 0, 1,
-0.977829, -0.6911928, -1.956125, 1, 0.8980392, 0, 1,
-0.9738644, -0.009931807, -0.9258446, 1, 0.9058824, 0, 1,
-0.9649105, -0.3333117, -2.389914, 1, 0.9137255, 0, 1,
-0.9530315, -0.6009114, -0.3837835, 1, 0.9176471, 0, 1,
-0.952727, -0.6023635, -3.077932, 1, 0.9254902, 0, 1,
-0.9393693, -0.5954574, -3.004304, 1, 0.9294118, 0, 1,
-0.9244664, 0.3824698, -1.397439, 1, 0.9372549, 0, 1,
-0.9228176, -1.489257, -1.374847, 1, 0.9411765, 0, 1,
-0.9218252, 0.909138, 0.9245189, 1, 0.9490196, 0, 1,
-0.9196357, -0.8457106, -1.901634, 1, 0.9529412, 0, 1,
-0.9102385, -0.7900558, -3.034869, 1, 0.9607843, 0, 1,
-0.8977893, 0.5881436, 0.2955903, 1, 0.9647059, 0, 1,
-0.8976659, -0.8242308, -1.861044, 1, 0.972549, 0, 1,
-0.8962065, -1.327587, -1.694782, 1, 0.9764706, 0, 1,
-0.8942736, -0.04630711, -2.290554, 1, 0.9843137, 0, 1,
-0.8895949, 0.1110912, -1.802944, 1, 0.9882353, 0, 1,
-0.8763323, -0.7111696, -3.86561, 1, 0.9960784, 0, 1,
-0.8757101, -0.002496859, -0.5320885, 0.9960784, 1, 0, 1,
-0.8691086, 0.1623283, -1.342661, 0.9921569, 1, 0, 1,
-0.8684214, -1.095417, -1.94854, 0.9843137, 1, 0, 1,
-0.8613074, 0.3352077, -1.650405, 0.9803922, 1, 0, 1,
-0.8436351, -0.3957289, -1.831324, 0.972549, 1, 0, 1,
-0.8370801, -2.266284, -2.823785, 0.9686275, 1, 0, 1,
-0.8294529, 0.04872461, -1.080788, 0.9607843, 1, 0, 1,
-0.8285854, 2.360764, -1.695846, 0.9568627, 1, 0, 1,
-0.8262708, -0.3003088, -0.9890553, 0.9490196, 1, 0, 1,
-0.8259448, -0.06094747, -2.276009, 0.945098, 1, 0, 1,
-0.8247027, 1.380032, -0.5934374, 0.9372549, 1, 0, 1,
-0.822164, -1.573662, -1.415677, 0.9333333, 1, 0, 1,
-0.8221264, -0.8606141, -0.9253609, 0.9254902, 1, 0, 1,
-0.8213313, -2.187984, -3.679224, 0.9215686, 1, 0, 1,
-0.8206943, 0.5129683, -0.5789953, 0.9137255, 1, 0, 1,
-0.8069762, -0.1636899, -2.209438, 0.9098039, 1, 0, 1,
-0.804135, 1.840532, -1.364623, 0.9019608, 1, 0, 1,
-0.8039155, 0.8989826, -0.3210066, 0.8941177, 1, 0, 1,
-0.7933398, -0.6969755, -2.967872, 0.8901961, 1, 0, 1,
-0.79204, 0.7527407, -0.1909062, 0.8823529, 1, 0, 1,
-0.7891428, -0.5719535, -2.965402, 0.8784314, 1, 0, 1,
-0.7877593, 0.6270905, -1.672404, 0.8705882, 1, 0, 1,
-0.7861348, 0.07997377, -1.956339, 0.8666667, 1, 0, 1,
-0.7827524, -0.8753659, -2.051254, 0.8588235, 1, 0, 1,
-0.7818314, -0.1557499, -1.885014, 0.854902, 1, 0, 1,
-0.776724, 0.487533, -0.9887127, 0.8470588, 1, 0, 1,
-0.7755452, 0.653551, -1.365114, 0.8431373, 1, 0, 1,
-0.7711959, 0.8964486, -0.4212408, 0.8352941, 1, 0, 1,
-0.7693787, 0.0426479, -1.584654, 0.8313726, 1, 0, 1,
-0.7644377, 0.9224113, 0.1231124, 0.8235294, 1, 0, 1,
-0.7631879, -0.0414545, -1.651921, 0.8196079, 1, 0, 1,
-0.7616242, 0.4598758, -0.9535715, 0.8117647, 1, 0, 1,
-0.7589366, -1.598784, -5.14917, 0.8078431, 1, 0, 1,
-0.7586377, 0.0876209, -1.192258, 0.8, 1, 0, 1,
-0.7525987, 0.6767997, 0.3759862, 0.7921569, 1, 0, 1,
-0.7406303, 0.3719023, 0.1153151, 0.7882353, 1, 0, 1,
-0.7380099, 0.1151299, -1.780423, 0.7803922, 1, 0, 1,
-0.7379524, 1.869842, 0.6266579, 0.7764706, 1, 0, 1,
-0.734439, -1.126704, -3.95747, 0.7686275, 1, 0, 1,
-0.7286407, -0.3670328, -0.9597562, 0.7647059, 1, 0, 1,
-0.722571, 0.3128749, -2.327404, 0.7568628, 1, 0, 1,
-0.7204239, 0.8418059, -1.758363, 0.7529412, 1, 0, 1,
-0.7151859, 0.4566057, -2.617124, 0.7450981, 1, 0, 1,
-0.7129539, -1.465381, -3.240782, 0.7411765, 1, 0, 1,
-0.7128735, -1.843621, -2.205158, 0.7333333, 1, 0, 1,
-0.7114578, 0.04920788, -1.639933, 0.7294118, 1, 0, 1,
-0.7109844, -0.2105277, -1.971339, 0.7215686, 1, 0, 1,
-0.7092825, 2.08733, -1.164974, 0.7176471, 1, 0, 1,
-0.7046855, -1.69108, -2.231005, 0.7098039, 1, 0, 1,
-0.7022503, 1.396973, 0.1878406, 0.7058824, 1, 0, 1,
-0.6961673, -0.2697787, -1.610033, 0.6980392, 1, 0, 1,
-0.6957636, 1.491792, -1.36619, 0.6901961, 1, 0, 1,
-0.6852065, 1.558235, -1.54147, 0.6862745, 1, 0, 1,
-0.6812577, 0.1791768, -1.470938, 0.6784314, 1, 0, 1,
-0.6801518, 0.8585237, 0.6249667, 0.6745098, 1, 0, 1,
-0.6782776, 1.022268, 0.03643338, 0.6666667, 1, 0, 1,
-0.6700314, 1.023265, 1.82536, 0.6627451, 1, 0, 1,
-0.669369, 0.5461082, -0.9544521, 0.654902, 1, 0, 1,
-0.6691243, -1.122899, -2.110008, 0.6509804, 1, 0, 1,
-0.6642507, 0.09046989, -0.7295628, 0.6431373, 1, 0, 1,
-0.6633047, 0.2620887, -2.072181, 0.6392157, 1, 0, 1,
-0.6590541, -0.3752095, -2.421199, 0.6313726, 1, 0, 1,
-0.6565448, 0.3315633, -1.221886, 0.627451, 1, 0, 1,
-0.6516653, -0.2310932, -2.622911, 0.6196079, 1, 0, 1,
-0.6516293, 1.986925, 0.302057, 0.6156863, 1, 0, 1,
-0.6504294, 1.093207, 1.121659, 0.6078432, 1, 0, 1,
-0.6434991, -0.3420286, -1.230777, 0.6039216, 1, 0, 1,
-0.6430089, -0.4026085, -3.446195, 0.5960785, 1, 0, 1,
-0.6423872, -1.462438, -3.553847, 0.5882353, 1, 0, 1,
-0.6295531, -1.370949, -0.9701277, 0.5843138, 1, 0, 1,
-0.62862, 0.2521574, -1.512856, 0.5764706, 1, 0, 1,
-0.6268057, 0.497416, -0.5750262, 0.572549, 1, 0, 1,
-0.6263341, -0.0007757175, -1.425996, 0.5647059, 1, 0, 1,
-0.6250759, -2.326316, -3.855516, 0.5607843, 1, 0, 1,
-0.6153271, 0.8795772, 0.5204518, 0.5529412, 1, 0, 1,
-0.615032, -0.7543824, -2.647693, 0.5490196, 1, 0, 1,
-0.6132326, -0.4891005, -1.824842, 0.5411765, 1, 0, 1,
-0.6128044, 0.3072984, -1.867733, 0.5372549, 1, 0, 1,
-0.6052317, -1.08323, -1.652465, 0.5294118, 1, 0, 1,
-0.6050037, -0.07230414, -1.914158, 0.5254902, 1, 0, 1,
-0.5990316, 1.090869, -1.524195, 0.5176471, 1, 0, 1,
-0.5986799, -0.3119158, -0.7465385, 0.5137255, 1, 0, 1,
-0.5956644, -0.1659247, -1.018664, 0.5058824, 1, 0, 1,
-0.5950878, 0.7895885, 0.716868, 0.5019608, 1, 0, 1,
-0.5944978, 0.2163835, 1.584355, 0.4941176, 1, 0, 1,
-0.5901201, -1.827716, -2.722483, 0.4862745, 1, 0, 1,
-0.5798561, 0.8232009, -0.6643786, 0.4823529, 1, 0, 1,
-0.57803, 0.08959461, -0.6258752, 0.4745098, 1, 0, 1,
-0.5618874, -0.7123235, -2.389401, 0.4705882, 1, 0, 1,
-0.5591881, -0.02603039, -1.554956, 0.4627451, 1, 0, 1,
-0.5543637, 1.602256, -1.802304, 0.4588235, 1, 0, 1,
-0.550576, -1.315673, -2.599152, 0.4509804, 1, 0, 1,
-0.5504009, 0.4351166, -1.328176, 0.4470588, 1, 0, 1,
-0.5465693, -0.684174, -1.948721, 0.4392157, 1, 0, 1,
-0.5459944, -0.9070915, -2.983356, 0.4352941, 1, 0, 1,
-0.5444741, 2.044143, -0.9872085, 0.427451, 1, 0, 1,
-0.5366476, 2.12113, -0.1157082, 0.4235294, 1, 0, 1,
-0.5354503, 0.2744875, 0.593566, 0.4156863, 1, 0, 1,
-0.5333864, 0.404485, -0.7674338, 0.4117647, 1, 0, 1,
-0.5254509, 0.6665134, 0.272602, 0.4039216, 1, 0, 1,
-0.5211338, 1.406083, -0.6867812, 0.3960784, 1, 0, 1,
-0.5155203, 0.883907, -0.3410859, 0.3921569, 1, 0, 1,
-0.515339, -1.513752, -2.675853, 0.3843137, 1, 0, 1,
-0.5122626, 1.467459, -1.837282, 0.3803922, 1, 0, 1,
-0.5105611, 0.4257044, 0.8267574, 0.372549, 1, 0, 1,
-0.504764, 0.8912622, -0.6473708, 0.3686275, 1, 0, 1,
-0.5023785, -1.192598, -4.280849, 0.3607843, 1, 0, 1,
-0.5017289, -0.4223119, -2.51624, 0.3568628, 1, 0, 1,
-0.4947662, -0.5051692, -2.891922, 0.3490196, 1, 0, 1,
-0.4886463, 1.014175, -0.2607682, 0.345098, 1, 0, 1,
-0.488514, 0.05982696, -4.443113, 0.3372549, 1, 0, 1,
-0.4880023, -0.465676, -1.871205, 0.3333333, 1, 0, 1,
-0.4811156, -0.6056058, -2.790214, 0.3254902, 1, 0, 1,
-0.4780155, -0.7922502, -1.965639, 0.3215686, 1, 0, 1,
-0.4775745, 0.5336853, -1.026299, 0.3137255, 1, 0, 1,
-0.4760425, 0.6262699, 0.02137747, 0.3098039, 1, 0, 1,
-0.475655, -0.9744446, -2.085374, 0.3019608, 1, 0, 1,
-0.4750696, 0.1682068, -1.488551, 0.2941177, 1, 0, 1,
-0.4707876, -1.07012, -3.654419, 0.2901961, 1, 0, 1,
-0.4696111, 0.8631525, 0.1200579, 0.282353, 1, 0, 1,
-0.4670397, 0.685625, -0.4407491, 0.2784314, 1, 0, 1,
-0.4664131, -0.3760617, -0.7187114, 0.2705882, 1, 0, 1,
-0.4606601, -0.2422953, -1.715145, 0.2666667, 1, 0, 1,
-0.4562976, -1.314136, -1.406697, 0.2588235, 1, 0, 1,
-0.455659, 0.3719013, -3.517874, 0.254902, 1, 0, 1,
-0.4554061, -0.3836437, -1.926725, 0.2470588, 1, 0, 1,
-0.4523634, -1.041007, -2.980768, 0.2431373, 1, 0, 1,
-0.4514019, 3.027405, 1.334238, 0.2352941, 1, 0, 1,
-0.4505987, 0.2925844, 0.4369405, 0.2313726, 1, 0, 1,
-0.4438267, -0.3837324, -0.997704, 0.2235294, 1, 0, 1,
-0.4424747, 0.4695682, -1.074607, 0.2196078, 1, 0, 1,
-0.4399909, -0.9667338, -1.75101, 0.2117647, 1, 0, 1,
-0.43999, -0.5224274, -1.924103, 0.2078431, 1, 0, 1,
-0.4399194, -0.03076961, -2.00836, 0.2, 1, 0, 1,
-0.434842, 0.4739064, -0.3091371, 0.1921569, 1, 0, 1,
-0.4321622, -0.5203046, -2.713167, 0.1882353, 1, 0, 1,
-0.423698, 0.3383605, 0.6730937, 0.1803922, 1, 0, 1,
-0.4235691, 0.06047025, -1.388015, 0.1764706, 1, 0, 1,
-0.4179856, -0.9837196, -2.153082, 0.1686275, 1, 0, 1,
-0.4174616, -0.7035882, -2.224165, 0.1647059, 1, 0, 1,
-0.4169027, -0.9238589, -2.106404, 0.1568628, 1, 0, 1,
-0.4162424, -0.1082186, -1.886174, 0.1529412, 1, 0, 1,
-0.4137661, -1.288252, -2.886648, 0.145098, 1, 0, 1,
-0.4133269, -0.12703, -3.041556, 0.1411765, 1, 0, 1,
-0.4110012, -0.06473155, -2.587506, 0.1333333, 1, 0, 1,
-0.4068715, 0.09242646, -0.5521788, 0.1294118, 1, 0, 1,
-0.396579, -0.4821669, -2.820714, 0.1215686, 1, 0, 1,
-0.3958555, 0.5162529, 0.3978144, 0.1176471, 1, 0, 1,
-0.395784, 1.200801, -0.4223328, 0.1098039, 1, 0, 1,
-0.390443, 0.1491851, -1.276717, 0.1058824, 1, 0, 1,
-0.3904315, -0.01894193, -1.130553, 0.09803922, 1, 0, 1,
-0.388719, 0.4825242, 0.4364428, 0.09019608, 1, 0, 1,
-0.3866137, -2.525543, -3.05594, 0.08627451, 1, 0, 1,
-0.3817038, -0.523366, -3.608706, 0.07843138, 1, 0, 1,
-0.3736362, 0.6695157, -0.333038, 0.07450981, 1, 0, 1,
-0.3699601, 1.933514, -0.4807487, 0.06666667, 1, 0, 1,
-0.3648013, 0.9228805, 1.862244, 0.0627451, 1, 0, 1,
-0.3625808, 0.7437696, 0.473873, 0.05490196, 1, 0, 1,
-0.3590086, -1.388358, -4.15232, 0.05098039, 1, 0, 1,
-0.3560654, -0.06026432, -1.640784, 0.04313726, 1, 0, 1,
-0.3533706, -0.02547249, -1.073741, 0.03921569, 1, 0, 1,
-0.3502136, 0.8843139, -1.879745, 0.03137255, 1, 0, 1,
-0.3397112, -0.678374, -1.388572, 0.02745098, 1, 0, 1,
-0.3352641, -0.7116467, -1.914419, 0.01960784, 1, 0, 1,
-0.3297234, 1.50107, -1.949248, 0.01568628, 1, 0, 1,
-0.3279909, 0.3850621, -0.6889644, 0.007843138, 1, 0, 1,
-0.3250834, -0.3469426, -2.594592, 0.003921569, 1, 0, 1,
-0.3217211, -0.7273175, -2.576917, 0, 1, 0.003921569, 1,
-0.3207694, 0.9816978, -0.9326403, 0, 1, 0.01176471, 1,
-0.3198355, 0.6400964, 0.669382, 0, 1, 0.01568628, 1,
-0.3194045, -0.6063406, -2.227452, 0, 1, 0.02352941, 1,
-0.3114658, 1.413546, -0.7121796, 0, 1, 0.02745098, 1,
-0.3111755, -0.4707869, -3.127679, 0, 1, 0.03529412, 1,
-0.3078027, 0.02215138, -0.2477057, 0, 1, 0.03921569, 1,
-0.3075141, -0.6071597, -2.165775, 0, 1, 0.04705882, 1,
-0.307146, 1.170986, 1.129315, 0, 1, 0.05098039, 1,
-0.3034573, 1.4474, -1.128531, 0, 1, 0.05882353, 1,
-0.3010981, -0.2578362, -0.2213005, 0, 1, 0.0627451, 1,
-0.300104, -0.04429732, -2.376762, 0, 1, 0.07058824, 1,
-0.295856, 0.458439, -2.310891, 0, 1, 0.07450981, 1,
-0.2918287, 0.4181896, -0.782307, 0, 1, 0.08235294, 1,
-0.2889157, -0.8777106, -2.067317, 0, 1, 0.08627451, 1,
-0.288855, -0.3264086, -1.348889, 0, 1, 0.09411765, 1,
-0.2872014, -0.8228534, -1.781736, 0, 1, 0.1019608, 1,
-0.2855953, 1.51292, 0.6240615, 0, 1, 0.1058824, 1,
-0.2848379, -0.6170698, -3.48269, 0, 1, 0.1137255, 1,
-0.2843599, 1.561069, 0.1383903, 0, 1, 0.1176471, 1,
-0.284076, 1.043043, -0.7676669, 0, 1, 0.1254902, 1,
-0.2830785, -0.1821348, -2.785964, 0, 1, 0.1294118, 1,
-0.2825234, -1.269661, -1.746125, 0, 1, 0.1372549, 1,
-0.2815334, 1.314481, 0.05890432, 0, 1, 0.1411765, 1,
-0.2804761, 0.459439, -0.1250832, 0, 1, 0.1490196, 1,
-0.2760542, -1.243929, -3.370422, 0, 1, 0.1529412, 1,
-0.2716012, -0.4539616, -2.836598, 0, 1, 0.1607843, 1,
-0.270746, -0.8837445, -2.891862, 0, 1, 0.1647059, 1,
-0.2667428, 1.136989, 0.7579168, 0, 1, 0.172549, 1,
-0.2588058, -0.6230378, -4.180852, 0, 1, 0.1764706, 1,
-0.2481402, 1.443289, 1.424106, 0, 1, 0.1843137, 1,
-0.244834, -1.381153, -3.709884, 0, 1, 0.1882353, 1,
-0.2420739, 1.077805, -0.2560732, 0, 1, 0.1960784, 1,
-0.2420173, 0.8219386, -0.04861365, 0, 1, 0.2039216, 1,
-0.2404428, -1.023162, -2.845514, 0, 1, 0.2078431, 1,
-0.2390806, 0.6954429, -0.7067446, 0, 1, 0.2156863, 1,
-0.2374893, -0.1316292, -3.45044, 0, 1, 0.2196078, 1,
-0.2358298, -1.634557, -3.637685, 0, 1, 0.227451, 1,
-0.2351111, -1.62244, -3.452045, 0, 1, 0.2313726, 1,
-0.2337768, -0.8957966, -4.548391, 0, 1, 0.2392157, 1,
-0.2299628, 1.920489, 1.722317, 0, 1, 0.2431373, 1,
-0.2296798, 0.1677779, 0.2524585, 0, 1, 0.2509804, 1,
-0.2295713, 0.0833662, -1.326445, 0, 1, 0.254902, 1,
-0.2235542, -0.1708485, -2.144914, 0, 1, 0.2627451, 1,
-0.2207379, 0.575534, -0.657793, 0, 1, 0.2666667, 1,
-0.2197076, 0.7483348, -2.301976, 0, 1, 0.2745098, 1,
-0.216363, -0.3268833, -3.278979, 0, 1, 0.2784314, 1,
-0.2156238, -0.1930499, -1.044913, 0, 1, 0.2862745, 1,
-0.2117444, -0.6445732, -1.898972, 0, 1, 0.2901961, 1,
-0.2103104, -0.8934194, -2.265402, 0, 1, 0.2980392, 1,
-0.2091241, 2.653711, -1.864554, 0, 1, 0.3058824, 1,
-0.2091081, 0.4546667, -1.380794, 0, 1, 0.3098039, 1,
-0.2084306, -1.097149, -0.5525727, 0, 1, 0.3176471, 1,
-0.208135, 1.109671, 0.8231703, 0, 1, 0.3215686, 1,
-0.2024547, 1.768587, -0.7716028, 0, 1, 0.3294118, 1,
-0.1998055, 0.2724028, 0.2565335, 0, 1, 0.3333333, 1,
-0.1994554, 0.671261, -0.09427239, 0, 1, 0.3411765, 1,
-0.1988912, 0.6313162, -1.911427, 0, 1, 0.345098, 1,
-0.1988688, -0.306185, -0.4550595, 0, 1, 0.3529412, 1,
-0.1966956, -2.959254, -3.046487, 0, 1, 0.3568628, 1,
-0.1955254, 0.8197691, -0.2014718, 0, 1, 0.3647059, 1,
-0.1946079, -1.128272, -3.740347, 0, 1, 0.3686275, 1,
-0.1892955, 2.068101, 0.5068561, 0, 1, 0.3764706, 1,
-0.1860827, -1.162142, -3.552068, 0, 1, 0.3803922, 1,
-0.184804, 0.8094631, -1.118331, 0, 1, 0.3882353, 1,
-0.181375, -1.561609, -2.275386, 0, 1, 0.3921569, 1,
-0.1792961, -1.674204, -3.209976, 0, 1, 0.4, 1,
-0.1781348, 0.1628276, -1.789118, 0, 1, 0.4078431, 1,
-0.1740794, -1.182981, -2.808614, 0, 1, 0.4117647, 1,
-0.1739794, 0.2042525, -0.8975818, 0, 1, 0.4196078, 1,
-0.172104, -0.769535, -2.233597, 0, 1, 0.4235294, 1,
-0.1708522, -1.273169, -2.097441, 0, 1, 0.4313726, 1,
-0.1698658, -0.8121396, -1.323329, 0, 1, 0.4352941, 1,
-0.1681691, 0.008237629, -1.424414, 0, 1, 0.4431373, 1,
-0.162437, -1.408268, -4.762776, 0, 1, 0.4470588, 1,
-0.1577248, 0.7289786, 0.001661069, 0, 1, 0.454902, 1,
-0.1564569, -1.213719, -2.603621, 0, 1, 0.4588235, 1,
-0.1552917, -0.7499225, -3.465508, 0, 1, 0.4666667, 1,
-0.154218, -0.08344699, -0.3481231, 0, 1, 0.4705882, 1,
-0.1540655, 1.35507, -0.09443182, 0, 1, 0.4784314, 1,
-0.1529932, -0.84236, -4.307053, 0, 1, 0.4823529, 1,
-0.1524484, -0.6288601, -4.691024, 0, 1, 0.4901961, 1,
-0.1510645, -0.5079257, -3.493227, 0, 1, 0.4941176, 1,
-0.1486152, 0.5194428, 0.2552567, 0, 1, 0.5019608, 1,
-0.1485187, 0.01337045, -1.670197, 0, 1, 0.509804, 1,
-0.1483137, 1.179384, -1.582727, 0, 1, 0.5137255, 1,
-0.146705, -0.6448884, -2.739729, 0, 1, 0.5215687, 1,
-0.1450397, -2.059124, -2.264172, 0, 1, 0.5254902, 1,
-0.1436715, 1.517121, 0.1617837, 0, 1, 0.5333334, 1,
-0.1427898, -0.156243, -2.253137, 0, 1, 0.5372549, 1,
-0.1416274, 0.01459922, -1.021862, 0, 1, 0.5450981, 1,
-0.1407624, -0.6699533, -3.599784, 0, 1, 0.5490196, 1,
-0.140578, -0.1762864, -2.202916, 0, 1, 0.5568628, 1,
-0.1373793, -0.4192738, -1.112976, 0, 1, 0.5607843, 1,
-0.1365013, 1.200937, 0.6255069, 0, 1, 0.5686275, 1,
-0.1339631, -0.5110005, -2.852755, 0, 1, 0.572549, 1,
-0.1330418, -0.5988479, -1.749403, 0, 1, 0.5803922, 1,
-0.1321049, 0.1281209, 0.2145304, 0, 1, 0.5843138, 1,
-0.1218819, -2.444631, -3.666395, 0, 1, 0.5921569, 1,
-0.1206216, -0.8493068, -3.026573, 0, 1, 0.5960785, 1,
-0.1145927, -0.8079474, -1.817981, 0, 1, 0.6039216, 1,
-0.1144634, -0.06740989, -0.8830557, 0, 1, 0.6117647, 1,
-0.1100204, -1.977199, -4.445423, 0, 1, 0.6156863, 1,
-0.1091745, -0.08968326, -2.078085, 0, 1, 0.6235294, 1,
-0.1056731, -1.273687, -3.692801, 0, 1, 0.627451, 1,
-0.09389696, 1.631432, 0.5039787, 0, 1, 0.6352941, 1,
-0.0938685, 0.513183, 2.111091, 0, 1, 0.6392157, 1,
-0.09101121, -1.069353, -2.113641, 0, 1, 0.6470588, 1,
-0.08804837, -0.2285808, -2.176986, 0, 1, 0.6509804, 1,
-0.0877685, 0.5646855, 0.1366642, 0, 1, 0.6588235, 1,
-0.08196793, 0.2711736, -0.215333, 0, 1, 0.6627451, 1,
-0.0807075, -1.779166, -4.264333, 0, 1, 0.6705883, 1,
-0.08008414, 1.50819, 0.0470199, 0, 1, 0.6745098, 1,
-0.07746769, 0.6233574, 0.9581125, 0, 1, 0.682353, 1,
-0.07647628, 0.771243, -0.2344063, 0, 1, 0.6862745, 1,
-0.07578599, -0.01392504, -2.734441, 0, 1, 0.6941177, 1,
-0.07153562, 0.4873953, 0.2763239, 0, 1, 0.7019608, 1,
-0.06920078, -1.462012, -2.909164, 0, 1, 0.7058824, 1,
-0.06551059, 0.00322404, -0.4151455, 0, 1, 0.7137255, 1,
-0.06533991, -0.8501924, -3.945276, 0, 1, 0.7176471, 1,
-0.06172007, 0.4016919, -0.7538951, 0, 1, 0.7254902, 1,
-0.06148773, 0.5782965, -0.9321918, 0, 1, 0.7294118, 1,
-0.06026228, -1.269404, -2.508956, 0, 1, 0.7372549, 1,
-0.05893942, 0.3966408, 0.462347, 0, 1, 0.7411765, 1,
-0.05872273, 0.5277006, 1.031236, 0, 1, 0.7490196, 1,
-0.05845113, 0.1792526, -0.872947, 0, 1, 0.7529412, 1,
-0.05820289, -0.9616475, -2.835084, 0, 1, 0.7607843, 1,
-0.05461454, 0.1415645, -0.8453434, 0, 1, 0.7647059, 1,
-0.0534886, -0.01196677, -1.062752, 0, 1, 0.772549, 1,
-0.04876128, -0.6699154, -3.676511, 0, 1, 0.7764706, 1,
-0.04602149, -1.08291, -2.637056, 0, 1, 0.7843137, 1,
-0.04581881, -0.4806169, -2.177623, 0, 1, 0.7882353, 1,
-0.04291946, 0.7957857, 1.866245, 0, 1, 0.7960784, 1,
-0.04022582, -0.4368569, -4.064723, 0, 1, 0.8039216, 1,
-0.04022049, -2.671353, -2.701891, 0, 1, 0.8078431, 1,
-0.03775911, 0.1814601, 0.1203921, 0, 1, 0.8156863, 1,
-0.0377499, 0.9536449, 0.6741257, 0, 1, 0.8196079, 1,
-0.03537609, -0.2685156, -2.948414, 0, 1, 0.827451, 1,
-0.03191344, 0.02286043, -1.757673, 0, 1, 0.8313726, 1,
-0.03125605, 0.5055971, -1.350453, 0, 1, 0.8392157, 1,
-0.03032261, 0.2587419, -0.8127248, 0, 1, 0.8431373, 1,
-0.02869966, 0.3846529, -0.6099961, 0, 1, 0.8509804, 1,
-0.01984792, -0.2474847, -1.778441, 0, 1, 0.854902, 1,
-0.01897728, 0.4353826, -0.1506498, 0, 1, 0.8627451, 1,
-0.01544381, 2.086926, 0.4067405, 0, 1, 0.8666667, 1,
-0.01336258, 0.3115616, -0.3707598, 0, 1, 0.8745098, 1,
-0.01270228, 0.7283677, 0.7078747, 0, 1, 0.8784314, 1,
-0.01147899, -1.059646, -2.392942, 0, 1, 0.8862745, 1,
-0.009062889, -2.016401, -4.108103, 0, 1, 0.8901961, 1,
-0.002285151, -0.3820513, -3.286151, 0, 1, 0.8980392, 1,
0.00116484, 1.528349, -0.1186003, 0, 1, 0.9058824, 1,
0.002567985, 0.4287331, -1.744939, 0, 1, 0.9098039, 1,
0.003184006, -1.454142, 1.82256, 0, 1, 0.9176471, 1,
0.006555333, -0.9491102, 2.255985, 0, 1, 0.9215686, 1,
0.006982845, 0.05971195, 1.420594, 0, 1, 0.9294118, 1,
0.009395543, 1.59568, 0.1919592, 0, 1, 0.9333333, 1,
0.01547515, -0.3472792, 2.499839, 0, 1, 0.9411765, 1,
0.01899204, -0.5753269, 5.38841, 0, 1, 0.945098, 1,
0.03432553, -0.233967, 5.174733, 0, 1, 0.9529412, 1,
0.03484744, 0.6766926, -0.8399646, 0, 1, 0.9568627, 1,
0.03856809, 0.4784668, -0.2337952, 0, 1, 0.9647059, 1,
0.04422436, 1.034602, 1.373293, 0, 1, 0.9686275, 1,
0.0469853, 0.5543153, -2.061888, 0, 1, 0.9764706, 1,
0.05014329, 0.3566225, 1.089964, 0, 1, 0.9803922, 1,
0.05225841, 0.1240934, -0.3193274, 0, 1, 0.9882353, 1,
0.05529071, -1.772381, 3.800883, 0, 1, 0.9921569, 1,
0.05646991, -0.6980299, 3.73841, 0, 1, 1, 1,
0.05892292, 0.1258659, -0.5227781, 0, 0.9921569, 1, 1,
0.06094957, 1.866515, 0.7960876, 0, 0.9882353, 1, 1,
0.06097902, 0.06649812, 1.154409, 0, 0.9803922, 1, 1,
0.06177297, 0.0993384, 0.8134779, 0, 0.9764706, 1, 1,
0.0712025, -1.56381, 2.597775, 0, 0.9686275, 1, 1,
0.07635995, -0.000323812, 2.696869, 0, 0.9647059, 1, 1,
0.0769951, 1.039154, 0.7595547, 0, 0.9568627, 1, 1,
0.08301456, -2.191479, 5.346143, 0, 0.9529412, 1, 1,
0.08611201, 0.1291395, -0.1172382, 0, 0.945098, 1, 1,
0.09032714, 0.3608651, 0.5182173, 0, 0.9411765, 1, 1,
0.09161434, -0.5620368, 3.407147, 0, 0.9333333, 1, 1,
0.09209929, 1.168456, 2.341373, 0, 0.9294118, 1, 1,
0.09655003, -0.5203719, 0.8839838, 0, 0.9215686, 1, 1,
0.1005196, 0.279635, 1.07742, 0, 0.9176471, 1, 1,
0.1013378, 0.1434013, 0.9815363, 0, 0.9098039, 1, 1,
0.101663, -1.499133, 3.991866, 0, 0.9058824, 1, 1,
0.1028088, -0.4984564, 3.26602, 0, 0.8980392, 1, 1,
0.103472, 0.2205308, 2.000747, 0, 0.8901961, 1, 1,
0.1044909, 2.032438, 0.1243274, 0, 0.8862745, 1, 1,
0.1058931, 1.009813, 0.01789542, 0, 0.8784314, 1, 1,
0.106496, -0.3777141, 3.638678, 0, 0.8745098, 1, 1,
0.1092129, -1.320659, 3.288, 0, 0.8666667, 1, 1,
0.1116766, -1.708534, 3.773274, 0, 0.8627451, 1, 1,
0.1144576, -1.105739, 3.179737, 0, 0.854902, 1, 1,
0.1208018, 0.007441194, 0.9685271, 0, 0.8509804, 1, 1,
0.1226443, -0.4661274, 3.92057, 0, 0.8431373, 1, 1,
0.1230388, -1.279104, 2.688864, 0, 0.8392157, 1, 1,
0.1232765, -0.8405991, 5.144463, 0, 0.8313726, 1, 1,
0.1252766, -0.504548, 2.254859, 0, 0.827451, 1, 1,
0.1267651, -0.4387106, 3.175135, 0, 0.8196079, 1, 1,
0.1302726, 1.204844, 1.806948, 0, 0.8156863, 1, 1,
0.1308378, 0.4260125, 1.760495, 0, 0.8078431, 1, 1,
0.1358296, -1.881159, 2.942168, 0, 0.8039216, 1, 1,
0.1362053, 0.7284891, 1.940593, 0, 0.7960784, 1, 1,
0.1378364, -0.6221436, 2.389454, 0, 0.7882353, 1, 1,
0.1403337, -0.05867933, 2.56931, 0, 0.7843137, 1, 1,
0.1440393, -0.640698, 2.385551, 0, 0.7764706, 1, 1,
0.1511705, -0.8600633, 3.379805, 0, 0.772549, 1, 1,
0.1535099, -0.052479, 1.248829, 0, 0.7647059, 1, 1,
0.1540589, 0.6146696, -1.005597, 0, 0.7607843, 1, 1,
0.1586633, 0.03734266, -0.1073761, 0, 0.7529412, 1, 1,
0.1592125, 1.80546, -1.863048, 0, 0.7490196, 1, 1,
0.1641691, 0.1932442, -1.07071, 0, 0.7411765, 1, 1,
0.164974, -1.300587, 2.374998, 0, 0.7372549, 1, 1,
0.1652643, -0.1428042, 2.14987, 0, 0.7294118, 1, 1,
0.170062, 1.716334, 0.613966, 0, 0.7254902, 1, 1,
0.1701289, -1.203881, 3.158535, 0, 0.7176471, 1, 1,
0.1705462, 0.3170992, -0.1809839, 0, 0.7137255, 1, 1,
0.1801348, 1.043942, -0.831524, 0, 0.7058824, 1, 1,
0.1809102, -0.460702, 2.19353, 0, 0.6980392, 1, 1,
0.1853475, 0.01638928, 0.7642435, 0, 0.6941177, 1, 1,
0.1882394, 0.1581824, 2.315814, 0, 0.6862745, 1, 1,
0.1882884, 0.7925581, 2.883868, 0, 0.682353, 1, 1,
0.1904936, 0.6502058, -0.5716453, 0, 0.6745098, 1, 1,
0.1909368, 0.03610583, 0.3060596, 0, 0.6705883, 1, 1,
0.1910421, -0.3578388, 1.6484, 0, 0.6627451, 1, 1,
0.1919625, 1.158181, 1.729104, 0, 0.6588235, 1, 1,
0.1933281, -0.3700901, 1.769336, 0, 0.6509804, 1, 1,
0.1977239, 1.133146, 1.818992, 0, 0.6470588, 1, 1,
0.1982903, 0.4907945, -0.04524445, 0, 0.6392157, 1, 1,
0.1999007, 1.321836, -0.3666087, 0, 0.6352941, 1, 1,
0.2047554, 0.07409488, 0.7228544, 0, 0.627451, 1, 1,
0.2073156, 1.086294, 0.735701, 0, 0.6235294, 1, 1,
0.208499, 0.2565311, 0.9063386, 0, 0.6156863, 1, 1,
0.2085858, -0.3749492, 2.916915, 0, 0.6117647, 1, 1,
0.210283, 0.9634001, 0.4499227, 0, 0.6039216, 1, 1,
0.2103007, -0.8472448, 3.209438, 0, 0.5960785, 1, 1,
0.2108205, 1.091138, 1.159832, 0, 0.5921569, 1, 1,
0.2123437, 0.2521063, 2.536623, 0, 0.5843138, 1, 1,
0.214572, -0.3307647, 3.199023, 0, 0.5803922, 1, 1,
0.2146992, 0.2811662, -0.6609142, 0, 0.572549, 1, 1,
0.2180559, 0.4532086, 0.279971, 0, 0.5686275, 1, 1,
0.2181622, -2.122605, 1.930461, 0, 0.5607843, 1, 1,
0.2184948, -0.237401, 1.261544, 0, 0.5568628, 1, 1,
0.2245389, 0.477578, -1.173893, 0, 0.5490196, 1, 1,
0.2260401, 1.292946, -0.07814503, 0, 0.5450981, 1, 1,
0.2282252, -0.618108, 3.392199, 0, 0.5372549, 1, 1,
0.2291223, 0.00626521, 2.499974, 0, 0.5333334, 1, 1,
0.2364644, -2.555295, 1.545663, 0, 0.5254902, 1, 1,
0.2377029, -1.280021, 4.373002, 0, 0.5215687, 1, 1,
0.2384385, 0.7058802, 0.4245439, 0, 0.5137255, 1, 1,
0.2386079, -0.1174795, 1.1441, 0, 0.509804, 1, 1,
0.240922, -0.1719782, 2.051937, 0, 0.5019608, 1, 1,
0.2416805, -2.068497, 3.841562, 0, 0.4941176, 1, 1,
0.2465701, -0.9513137, 2.10337, 0, 0.4901961, 1, 1,
0.2470756, 0.03957709, 1.110977, 0, 0.4823529, 1, 1,
0.2503754, 0.06027295, 0.3899486, 0, 0.4784314, 1, 1,
0.2508894, 0.5969399, 1.03727, 0, 0.4705882, 1, 1,
0.2540746, -0.5390262, 4.012649, 0, 0.4666667, 1, 1,
0.2551072, 0.1025884, 0.5271406, 0, 0.4588235, 1, 1,
0.2582221, 1.113254, 0.1462322, 0, 0.454902, 1, 1,
0.2582708, -0.5638931, 2.372727, 0, 0.4470588, 1, 1,
0.2614669, 0.2832801, 1.680272, 0, 0.4431373, 1, 1,
0.2632717, -2.301999, 3.458616, 0, 0.4352941, 1, 1,
0.2708242, -0.866281, 2.498759, 0, 0.4313726, 1, 1,
0.2723382, -0.3262183, 2.960668, 0, 0.4235294, 1, 1,
0.2752714, -0.9534091, 1.891099, 0, 0.4196078, 1, 1,
0.2759523, -0.1316033, 1.701432, 0, 0.4117647, 1, 1,
0.2770224, 0.2133636, 1.975196, 0, 0.4078431, 1, 1,
0.2771887, -0.1319697, 2.300995, 0, 0.4, 1, 1,
0.2811572, 1.749684, -0.1791242, 0, 0.3921569, 1, 1,
0.2816844, -0.2715994, 3.924202, 0, 0.3882353, 1, 1,
0.2831037, 0.2385669, 0.5752153, 0, 0.3803922, 1, 1,
0.2847617, -0.2261557, 1.298761, 0, 0.3764706, 1, 1,
0.2883834, 1.476241, 0.1053994, 0, 0.3686275, 1, 1,
0.2909739, 0.1757295, 0.3421442, 0, 0.3647059, 1, 1,
0.2950532, -1.260499, 3.457849, 0, 0.3568628, 1, 1,
0.2963622, 0.9362082, -0.02707977, 0, 0.3529412, 1, 1,
0.3038014, 0.2515886, 2.473904, 0, 0.345098, 1, 1,
0.308783, 0.4742155, 0.5515538, 0, 0.3411765, 1, 1,
0.308851, 0.4227245, 0.3815008, 0, 0.3333333, 1, 1,
0.3106052, -1.070338, 2.319862, 0, 0.3294118, 1, 1,
0.3107899, -1.66148, 1.478768, 0, 0.3215686, 1, 1,
0.3114083, 0.1997276, 1.250595, 0, 0.3176471, 1, 1,
0.3143466, -0.217426, 3.5252, 0, 0.3098039, 1, 1,
0.3193887, -0.3775328, 1.166688, 0, 0.3058824, 1, 1,
0.3194115, 1.537611, -0.4195443, 0, 0.2980392, 1, 1,
0.3303718, -0.3982681, 3.400869, 0, 0.2901961, 1, 1,
0.3311087, -2.324966, 2.668265, 0, 0.2862745, 1, 1,
0.3315497, 0.4875093, 1.780796, 0, 0.2784314, 1, 1,
0.3345963, -0.2463345, 3.101369, 0, 0.2745098, 1, 1,
0.3353726, 1.167369, 2.371502, 0, 0.2666667, 1, 1,
0.3362054, 0.4234799, -0.7579156, 0, 0.2627451, 1, 1,
0.3390444, 0.8671784, 2.142463, 0, 0.254902, 1, 1,
0.339722, 0.03303991, 0.8452987, 0, 0.2509804, 1, 1,
0.3430437, -0.3479837, 1.764434, 0, 0.2431373, 1, 1,
0.3456296, 0.09887729, 2.009356, 0, 0.2392157, 1, 1,
0.3529032, 0.4468822, 2.640009, 0, 0.2313726, 1, 1,
0.3558182, 0.2931201, -0.9559861, 0, 0.227451, 1, 1,
0.356639, 0.5584254, -0.8962738, 0, 0.2196078, 1, 1,
0.3577819, -0.07555302, 2.19733, 0, 0.2156863, 1, 1,
0.3593974, 0.4299374, 1.774286, 0, 0.2078431, 1, 1,
0.3623244, 0.6033115, 0.801835, 0, 0.2039216, 1, 1,
0.3626342, 0.863026, -2.133852, 0, 0.1960784, 1, 1,
0.3715357, 2.647567, 0.9449308, 0, 0.1882353, 1, 1,
0.3717745, -0.6416611, 1.358657, 0, 0.1843137, 1, 1,
0.373264, 1.917318, -0.4036656, 0, 0.1764706, 1, 1,
0.3736466, 0.323673, 0.5538396, 0, 0.172549, 1, 1,
0.3771722, 0.6933811, 1.547506, 0, 0.1647059, 1, 1,
0.3784717, 0.4777966, 0.6273565, 0, 0.1607843, 1, 1,
0.3806228, -0.2627789, 3.386169, 0, 0.1529412, 1, 1,
0.3842126, -0.6067522, 3.74084, 0, 0.1490196, 1, 1,
0.3853191, 1.193372, 0.8857062, 0, 0.1411765, 1, 1,
0.3894562, -0.3975161, 2.868096, 0, 0.1372549, 1, 1,
0.3933047, 0.9801177, -0.114853, 0, 0.1294118, 1, 1,
0.3945169, 0.9560564, 1.998283, 0, 0.1254902, 1, 1,
0.3974104, -0.5473122, 2.236847, 0, 0.1176471, 1, 1,
0.3992253, -0.4842197, 3.171973, 0, 0.1137255, 1, 1,
0.4029891, -1.273681, 4.973979, 0, 0.1058824, 1, 1,
0.4032947, -0.3831021, 2.064017, 0, 0.09803922, 1, 1,
0.4034315, -2.296162, 3.668514, 0, 0.09411765, 1, 1,
0.4054897, -2.137895, 4.429268, 0, 0.08627451, 1, 1,
0.4055164, 0.4261222, -0.7611447, 0, 0.08235294, 1, 1,
0.4068805, -0.6359404, 1.453145, 0, 0.07450981, 1, 1,
0.4095697, 1.085141, -0.7063824, 0, 0.07058824, 1, 1,
0.4102914, 1.089956, 0.1968867, 0, 0.0627451, 1, 1,
0.4103616, 0.2364886, 3.023293, 0, 0.05882353, 1, 1,
0.4148526, -0.7747831, 3.413982, 0, 0.05098039, 1, 1,
0.4162619, -1.655905, 2.792244, 0, 0.04705882, 1, 1,
0.4175994, -1.491617, 2.251459, 0, 0.03921569, 1, 1,
0.4199451, -0.6114763, 2.984313, 0, 0.03529412, 1, 1,
0.4200166, -1.444657, 3.208624, 0, 0.02745098, 1, 1,
0.4233129, 1.168224, 1.076567, 0, 0.02352941, 1, 1,
0.4281746, -1.61121, 2.431963, 0, 0.01568628, 1, 1,
0.4303441, -1.219485, 2.696605, 0, 0.01176471, 1, 1,
0.4329001, -0.2082957, 1.595207, 0, 0.003921569, 1, 1,
0.4348729, -0.3069637, 3.462159, 0.003921569, 0, 1, 1,
0.4366699, -1.392103, 3.538494, 0.007843138, 0, 1, 1,
0.4372754, -0.8741488, 3.571152, 0.01568628, 0, 1, 1,
0.437476, 3.000853, 0.3678897, 0.01960784, 0, 1, 1,
0.4376172, 0.8179691, 1.179802, 0.02745098, 0, 1, 1,
0.4389631, -2.28411, 2.110597, 0.03137255, 0, 1, 1,
0.4390503, 0.5007685, 0.8369283, 0.03921569, 0, 1, 1,
0.4403846, 0.4016033, -0.3250124, 0.04313726, 0, 1, 1,
0.4436405, -2.108394, 2.362121, 0.05098039, 0, 1, 1,
0.4477402, -0.8909701, 1.965392, 0.05490196, 0, 1, 1,
0.4487529, -0.185206, 1.735847, 0.0627451, 0, 1, 1,
0.4518303, -0.09152617, 1.45695, 0.06666667, 0, 1, 1,
0.452839, 0.8723443, -0.3452764, 0.07450981, 0, 1, 1,
0.4529788, -0.4776393, 1.91415, 0.07843138, 0, 1, 1,
0.4533333, -0.09678089, 1.097037, 0.08627451, 0, 1, 1,
0.4579452, 0.1431597, 1.471841, 0.09019608, 0, 1, 1,
0.4630351, -0.8335998, 2.94614, 0.09803922, 0, 1, 1,
0.4639284, 0.822144, -0.6509737, 0.1058824, 0, 1, 1,
0.4646013, 0.3911328, 1.444124, 0.1098039, 0, 1, 1,
0.4722994, 0.7402096, 0.6052793, 0.1176471, 0, 1, 1,
0.4841271, -0.5866964, 3.633873, 0.1215686, 0, 1, 1,
0.4843295, 0.2904832, 0.9430936, 0.1294118, 0, 1, 1,
0.4862085, -0.2338882, 1.264991, 0.1333333, 0, 1, 1,
0.4899746, 0.5123708, 1.535623, 0.1411765, 0, 1, 1,
0.4920095, 0.6746681, 1.503831, 0.145098, 0, 1, 1,
0.4942711, 1.680632, -2.166943, 0.1529412, 0, 1, 1,
0.4949702, 1.015908, -0.530656, 0.1568628, 0, 1, 1,
0.5040027, -0.2833534, 1.625578, 0.1647059, 0, 1, 1,
0.5073416, 1.166585, 0.1886045, 0.1686275, 0, 1, 1,
0.5203671, -2.495236, 2.795174, 0.1764706, 0, 1, 1,
0.5204396, -0.5051706, 2.527533, 0.1803922, 0, 1, 1,
0.5289901, -0.3223948, 2.62803, 0.1882353, 0, 1, 1,
0.5332577, 0.1677817, 3.690338, 0.1921569, 0, 1, 1,
0.5367458, -1.016572, 3.461335, 0.2, 0, 1, 1,
0.5370132, 0.8877804, 2.29952, 0.2078431, 0, 1, 1,
0.5385868, -0.1634495, 1.943902, 0.2117647, 0, 1, 1,
0.5463925, -1.732076, 3.646411, 0.2196078, 0, 1, 1,
0.5482574, -0.9284353, -0.9983273, 0.2235294, 0, 1, 1,
0.5490547, 0.7608951, 1.110929, 0.2313726, 0, 1, 1,
0.5619368, 0.6371556, -0.3122802, 0.2352941, 0, 1, 1,
0.5620562, -0.9718668, 1.644373, 0.2431373, 0, 1, 1,
0.5655511, -0.8195643, 3.318995, 0.2470588, 0, 1, 1,
0.5702176, 0.2179525, 0.4358462, 0.254902, 0, 1, 1,
0.5739262, -0.7481904, 2.584673, 0.2588235, 0, 1, 1,
0.5774661, -0.3215229, 2.335999, 0.2666667, 0, 1, 1,
0.5779069, 1.618341, 0.6700143, 0.2705882, 0, 1, 1,
0.5813752, -0.3225771, 2.432707, 0.2784314, 0, 1, 1,
0.5815066, 0.6341789, -0.3366576, 0.282353, 0, 1, 1,
0.5817039, -1.696101, 2.649131, 0.2901961, 0, 1, 1,
0.5843306, 0.5134145, 0.2390364, 0.2941177, 0, 1, 1,
0.5871455, 0.0005258772, 1.603177, 0.3019608, 0, 1, 1,
0.5880845, 0.8942475, 0.8440261, 0.3098039, 0, 1, 1,
0.5882541, -1.883721, 2.487787, 0.3137255, 0, 1, 1,
0.5900844, -0.3634657, 2.063082, 0.3215686, 0, 1, 1,
0.5926875, -0.2975377, 2.847384, 0.3254902, 0, 1, 1,
0.596235, 1.57768, 1.7124, 0.3333333, 0, 1, 1,
0.5964727, -0.8802355, 3.045767, 0.3372549, 0, 1, 1,
0.6010774, 0.9048687, 1.214327, 0.345098, 0, 1, 1,
0.6033374, 0.6857551, 1.133043, 0.3490196, 0, 1, 1,
0.6052899, -0.1210381, 0.7797135, 0.3568628, 0, 1, 1,
0.6074392, -0.9129544, 2.587261, 0.3607843, 0, 1, 1,
0.6088341, -2.22044, 2.10991, 0.3686275, 0, 1, 1,
0.6096123, 3.320227, 0.3260414, 0.372549, 0, 1, 1,
0.6097957, -0.3090222, 0.9395555, 0.3803922, 0, 1, 1,
0.614301, -0.7780579, 2.143653, 0.3843137, 0, 1, 1,
0.6165832, 1.790291, 0.4190293, 0.3921569, 0, 1, 1,
0.6167387, 0.3206413, 0.7359191, 0.3960784, 0, 1, 1,
0.6198509, 0.6474329, 0.3748502, 0.4039216, 0, 1, 1,
0.62061, -0.216328, 2.050663, 0.4117647, 0, 1, 1,
0.6222339, 0.6325667, -0.09867236, 0.4156863, 0, 1, 1,
0.6225756, -0.1701958, 2.397115, 0.4235294, 0, 1, 1,
0.6244833, 1.547966, 1.317101, 0.427451, 0, 1, 1,
0.6252164, -0.4134496, 0.8182545, 0.4352941, 0, 1, 1,
0.6338547, 0.4854813, -0.2816405, 0.4392157, 0, 1, 1,
0.6363026, -0.578753, 3.227518, 0.4470588, 0, 1, 1,
0.6460007, -0.6696493, 1.327009, 0.4509804, 0, 1, 1,
0.6471558, -0.7886721, 2.075412, 0.4588235, 0, 1, 1,
0.6473504, -0.3958494, 3.008262, 0.4627451, 0, 1, 1,
0.6500176, 0.2441898, 0.8355291, 0.4705882, 0, 1, 1,
0.6555788, -0.7915453, 3.316621, 0.4745098, 0, 1, 1,
0.6584938, -0.3702263, 1.683683, 0.4823529, 0, 1, 1,
0.6592072, 1.50157, 0.0262826, 0.4862745, 0, 1, 1,
0.6635485, -0.324646, 3.883601, 0.4941176, 0, 1, 1,
0.6663544, -0.7168357, 2.264199, 0.5019608, 0, 1, 1,
0.6701618, 0.3840511, 0.3670015, 0.5058824, 0, 1, 1,
0.6712221, 0.7622361, 2.34314, 0.5137255, 0, 1, 1,
0.6728047, -0.1450173, 2.165896, 0.5176471, 0, 1, 1,
0.6731043, 2.405952, 0.5553707, 0.5254902, 0, 1, 1,
0.6744902, -0.2062016, 1.569916, 0.5294118, 0, 1, 1,
0.6843202, -1.230138, 0.461291, 0.5372549, 0, 1, 1,
0.6845692, 1.170972, 0.6755046, 0.5411765, 0, 1, 1,
0.6871947, 0.6107884, -0.3676001, 0.5490196, 0, 1, 1,
0.6911119, -0.8041036, 3.823189, 0.5529412, 0, 1, 1,
0.7015575, -0.3350969, 2.733216, 0.5607843, 0, 1, 1,
0.7016124, -1.882117, 2.679842, 0.5647059, 0, 1, 1,
0.7028124, -1.649612, 3.195403, 0.572549, 0, 1, 1,
0.7028692, -0.2097086, 1.150904, 0.5764706, 0, 1, 1,
0.7051634, -2.346198, 2.936159, 0.5843138, 0, 1, 1,
0.7081811, -0.6784301, 2.65288, 0.5882353, 0, 1, 1,
0.7086081, -1.023624, 3.923079, 0.5960785, 0, 1, 1,
0.7101804, 0.3539054, 0.7142517, 0.6039216, 0, 1, 1,
0.7124589, -1.237151, 3.917027, 0.6078432, 0, 1, 1,
0.7171945, -0.07456002, 3.124688, 0.6156863, 0, 1, 1,
0.7191304, -0.2041383, -0.6376123, 0.6196079, 0, 1, 1,
0.7207179, -1.320801, 5.883106, 0.627451, 0, 1, 1,
0.7266439, -1.976856, 2.203748, 0.6313726, 0, 1, 1,
0.7276135, -0.2952434, 1.163816, 0.6392157, 0, 1, 1,
0.7315081, -0.3026988, 2.210725, 0.6431373, 0, 1, 1,
0.7396118, -0.5901457, 3.086793, 0.6509804, 0, 1, 1,
0.7415002, -0.6146602, 3.2773, 0.654902, 0, 1, 1,
0.7437107, -0.4798872, 1.944536, 0.6627451, 0, 1, 1,
0.7437891, 0.5184806, 1.320698, 0.6666667, 0, 1, 1,
0.7465409, 2.278109, 0.2595153, 0.6745098, 0, 1, 1,
0.751255, -0.8867286, 3.506117, 0.6784314, 0, 1, 1,
0.756779, -0.4897564, 2.434932, 0.6862745, 0, 1, 1,
0.7620488, 0.7290905, 1.353672, 0.6901961, 0, 1, 1,
0.769702, -0.8859686, 0.4115772, 0.6980392, 0, 1, 1,
0.7725399, 1.855484, -1.112243, 0.7058824, 0, 1, 1,
0.7730197, -0.7666295, 3.053726, 0.7098039, 0, 1, 1,
0.7745969, 0.3462748, -0.2413003, 0.7176471, 0, 1, 1,
0.7761469, 0.8361516, 0.4547158, 0.7215686, 0, 1, 1,
0.7768586, -0.4343271, 1.289929, 0.7294118, 0, 1, 1,
0.7774724, 0.2628156, 1.603482, 0.7333333, 0, 1, 1,
0.7825015, 1.097831, 0.6571068, 0.7411765, 0, 1, 1,
0.7829909, 1.045606, 1.31045, 0.7450981, 0, 1, 1,
0.7837055, 0.7285156, 2.406505, 0.7529412, 0, 1, 1,
0.788262, 0.09637681, 2.754, 0.7568628, 0, 1, 1,
0.7931891, 0.8115298, 2.405349, 0.7647059, 0, 1, 1,
0.7938761, 1.446673, -0.5035474, 0.7686275, 0, 1, 1,
0.8002769, 0.5031683, 1.764161, 0.7764706, 0, 1, 1,
0.8011829, 2.034415, 0.197749, 0.7803922, 0, 1, 1,
0.8024332, -0.6208555, 1.408014, 0.7882353, 0, 1, 1,
0.8041439, -2.1316, 2.999436, 0.7921569, 0, 1, 1,
0.8163882, -1.306738, 3.248399, 0.8, 0, 1, 1,
0.8163915, 0.5530227, 2.095774, 0.8078431, 0, 1, 1,
0.8205122, 0.3114586, 0.6689186, 0.8117647, 0, 1, 1,
0.822688, -0.5987943, 1.563674, 0.8196079, 0, 1, 1,
0.8232878, 1.085057, -0.0259502, 0.8235294, 0, 1, 1,
0.826076, -0.2804379, 2.010531, 0.8313726, 0, 1, 1,
0.8379695, -0.7700922, 2.510226, 0.8352941, 0, 1, 1,
0.8406907, 0.5106141, 1.962589, 0.8431373, 0, 1, 1,
0.8411185, 0.9221511, 0.248567, 0.8470588, 0, 1, 1,
0.8411777, -0.8985581, 1.835525, 0.854902, 0, 1, 1,
0.8412069, -0.142887, 1.779961, 0.8588235, 0, 1, 1,
0.8459285, 0.8472633, 0.3230614, 0.8666667, 0, 1, 1,
0.8507336, 3.082106, 1.387058, 0.8705882, 0, 1, 1,
0.8519942, -0.5981482, 2.041751, 0.8784314, 0, 1, 1,
0.8569769, -0.8907027, 1.308861, 0.8823529, 0, 1, 1,
0.8630816, 0.2336292, 0.6460643, 0.8901961, 0, 1, 1,
0.8658532, 2.263913, -0.22005, 0.8941177, 0, 1, 1,
0.8671455, -0.4677828, 0.3508124, 0.9019608, 0, 1, 1,
0.8681406, -0.5262883, 1.713012, 0.9098039, 0, 1, 1,
0.8683285, 0.5533718, 1.780694, 0.9137255, 0, 1, 1,
0.8699703, -2.510596, 3.334868, 0.9215686, 0, 1, 1,
0.8740993, 0.4194799, 1.746886, 0.9254902, 0, 1, 1,
0.8781734, 0.1841812, 1.354925, 0.9333333, 0, 1, 1,
0.8785678, -0.272621, 2.411744, 0.9372549, 0, 1, 1,
0.8795581, 0.1238507, 1.082141, 0.945098, 0, 1, 1,
0.9059529, -1.338239, 0.7431329, 0.9490196, 0, 1, 1,
0.9121122, 0.4904408, -1.106149, 0.9568627, 0, 1, 1,
0.9122925, 1.29105, -1.002132, 0.9607843, 0, 1, 1,
0.9144781, -0.2682878, 0.8381304, 0.9686275, 0, 1, 1,
0.9164088, 0.7174164, 1.693374, 0.972549, 0, 1, 1,
0.9208818, -1.022362, 2.680935, 0.9803922, 0, 1, 1,
0.9311749, 0.4919521, 0.5293378, 0.9843137, 0, 1, 1,
0.9363517, 0.7237965, 0.175692, 0.9921569, 0, 1, 1,
0.9382384, 0.4820252, -0.489424, 0.9960784, 0, 1, 1,
0.9408367, -0.620747, 2.560665, 1, 0, 0.9960784, 1,
0.9445042, 0.7587845, 0.9639531, 1, 0, 0.9882353, 1,
0.9471016, 0.8322055, 1.581301, 1, 0, 0.9843137, 1,
0.9557905, 1.356678, -0.1891803, 1, 0, 0.9764706, 1,
0.9568096, -1.18067, 4.546237, 1, 0, 0.972549, 1,
0.9591222, 1.685064, -0.2308506, 1, 0, 0.9647059, 1,
0.9594707, 0.4175088, 1.583778, 1, 0, 0.9607843, 1,
0.9619967, -1.07356, 0.6548572, 1, 0, 0.9529412, 1,
0.9735258, 1.771018, 0.3357035, 1, 0, 0.9490196, 1,
0.9759745, 0.2087106, -1.274166, 1, 0, 0.9411765, 1,
0.9760534, 2.495603, 0.9171175, 1, 0, 0.9372549, 1,
0.9776508, -2.077807, 4.383574, 1, 0, 0.9294118, 1,
0.9786003, -1.370072, 2.251239, 1, 0, 0.9254902, 1,
0.9950549, 0.8984935, 0.1379875, 1, 0, 0.9176471, 1,
0.9982181, 2.104351, 1.605992, 1, 0, 0.9137255, 1,
1.002128, 0.9380187, 1.56604, 1, 0, 0.9058824, 1,
1.00271, 0.8617995, 2.385504, 1, 0, 0.9019608, 1,
1.002867, -0.2246452, 1.604742, 1, 0, 0.8941177, 1,
1.012851, -0.6723677, 4.07055, 1, 0, 0.8862745, 1,
1.014151, -1.387591, 1.994479, 1, 0, 0.8823529, 1,
1.014549, -0.308505, 1.874021, 1, 0, 0.8745098, 1,
1.017492, 0.1633439, 2.006163, 1, 0, 0.8705882, 1,
1.021124, 0.5791769, -0.7552806, 1, 0, 0.8627451, 1,
1.024866, -0.2910304, 2.436384, 1, 0, 0.8588235, 1,
1.026001, 0.01057213, -0.1060163, 1, 0, 0.8509804, 1,
1.031533, -0.412796, 2.378572, 1, 0, 0.8470588, 1,
1.050302, -0.06022059, 2.641508, 1, 0, 0.8392157, 1,
1.050705, 0.3232502, 1.214231, 1, 0, 0.8352941, 1,
1.052011, -0.4728666, 0.01978052, 1, 0, 0.827451, 1,
1.05912, 0.2579909, 1.958709, 1, 0, 0.8235294, 1,
1.062083, 0.2627178, 1.816723, 1, 0, 0.8156863, 1,
1.063012, 2.13681, 3.013218, 1, 0, 0.8117647, 1,
1.071946, 0.9419356, 0.4531087, 1, 0, 0.8039216, 1,
1.076212, 1.176338, 0.8226194, 1, 0, 0.7960784, 1,
1.079194, 0.65301, 1.05326, 1, 0, 0.7921569, 1,
1.081203, 0.1551965, 2.635365, 1, 0, 0.7843137, 1,
1.081423, -0.003068486, 0.8170114, 1, 0, 0.7803922, 1,
1.082822, -1.660508, 3.618147, 1, 0, 0.772549, 1,
1.085414, -0.4441159, 3.74886, 1, 0, 0.7686275, 1,
1.102181, 0.008142184, 2.813186, 1, 0, 0.7607843, 1,
1.122352, -0.6790674, 1.361368, 1, 0, 0.7568628, 1,
1.12519, -0.8720563, 2.904003, 1, 0, 0.7490196, 1,
1.127722, -1.410486, 2.407417, 1, 0, 0.7450981, 1,
1.132564, -0.3287768, 0.4545064, 1, 0, 0.7372549, 1,
1.141184, 0.01312334, 1.46107, 1, 0, 0.7333333, 1,
1.147809, 0.2779022, 0.4813119, 1, 0, 0.7254902, 1,
1.165139, 0.5020544, 1.102584, 1, 0, 0.7215686, 1,
1.165806, -0.8384865, 2.536688, 1, 0, 0.7137255, 1,
1.171264, 0.7806051, 0.8786609, 1, 0, 0.7098039, 1,
1.175505, -1.940898, 2.182029, 1, 0, 0.7019608, 1,
1.183275, 0.1264322, 1.15492, 1, 0, 0.6941177, 1,
1.187603, 1.872435, 2.119293, 1, 0, 0.6901961, 1,
1.189019, -0.2172162, 2.678897, 1, 0, 0.682353, 1,
1.19693, -0.1687758, 2.582127, 1, 0, 0.6784314, 1,
1.201279, 0.3090047, 2.894791, 1, 0, 0.6705883, 1,
1.201832, 1.219466, 2.10111, 1, 0, 0.6666667, 1,
1.205941, 1.92917, -0.0784085, 1, 0, 0.6588235, 1,
1.210506, 0.4623332, 0.5251998, 1, 0, 0.654902, 1,
1.210678, 0.1072329, 0.231785, 1, 0, 0.6470588, 1,
1.211957, -0.7373874, 2.262693, 1, 0, 0.6431373, 1,
1.21257, 1.022693, 0.4043331, 1, 0, 0.6352941, 1,
1.217622, 1.09101, 1.392876, 1, 0, 0.6313726, 1,
1.218521, -0.4758884, 3.323656, 1, 0, 0.6235294, 1,
1.224346, 2.087172, 0.3056036, 1, 0, 0.6196079, 1,
1.247, -0.7856107, 3.781442, 1, 0, 0.6117647, 1,
1.247949, 1.236533, 2.971539, 1, 0, 0.6078432, 1,
1.252114, 1.143867, 2.008965, 1, 0, 0.6, 1,
1.256487, -0.2933524, 3.054998, 1, 0, 0.5921569, 1,
1.264713, 0.3400306, -0.400047, 1, 0, 0.5882353, 1,
1.269779, -0.1131678, 0.58408, 1, 0, 0.5803922, 1,
1.272841, 1.562128, 0.4780249, 1, 0, 0.5764706, 1,
1.276279, 0.6507488, 1.153536, 1, 0, 0.5686275, 1,
1.27975, -2.097485, 1.844595, 1, 0, 0.5647059, 1,
1.281016, 1.110404, 0.763621, 1, 0, 0.5568628, 1,
1.283627, 1.250394, 0.5716978, 1, 0, 0.5529412, 1,
1.293203, 0.5018312, -0.1868426, 1, 0, 0.5450981, 1,
1.294692, 0.4498411, 1.17827, 1, 0, 0.5411765, 1,
1.296622, 0.1057223, 0.5867243, 1, 0, 0.5333334, 1,
1.314791, -0.2912499, 1.601413, 1, 0, 0.5294118, 1,
1.318999, -0.5304755, 1.98064, 1, 0, 0.5215687, 1,
1.337226, -0.3632807, 0.6482356, 1, 0, 0.5176471, 1,
1.347255, 0.7336408, 0.5015622, 1, 0, 0.509804, 1,
1.353496, 1.173777, 1.195171, 1, 0, 0.5058824, 1,
1.360994, -0.6897647, 3.421075, 1, 0, 0.4980392, 1,
1.363553, 1.529085, 0.923815, 1, 0, 0.4901961, 1,
1.392464, -1.565163, 1.149184, 1, 0, 0.4862745, 1,
1.426332, 0.3289345, 1.007168, 1, 0, 0.4784314, 1,
1.434004, -0.5482814, 0.4499231, 1, 0, 0.4745098, 1,
1.435204, -0.4226283, 2.324806, 1, 0, 0.4666667, 1,
1.437957, 0.867128, -0.07502757, 1, 0, 0.4627451, 1,
1.439011, -0.3959416, 3.193451, 1, 0, 0.454902, 1,
1.443639, 0.9014983, -0.09657972, 1, 0, 0.4509804, 1,
1.459063, 0.2576734, 2.287267, 1, 0, 0.4431373, 1,
1.461432, 1.411863, 1.019476, 1, 0, 0.4392157, 1,
1.463107, -0.8065849, 1.197228, 1, 0, 0.4313726, 1,
1.463355, -0.8776628, 0.1166791, 1, 0, 0.427451, 1,
1.46547, -1.624421, 3.625161, 1, 0, 0.4196078, 1,
1.482466, -0.1317505, 1.035713, 1, 0, 0.4156863, 1,
1.484909, 0.4669148, 2.740833, 1, 0, 0.4078431, 1,
1.488414, -0.9278796, 3.088306, 1, 0, 0.4039216, 1,
1.492034, -1.251209, 3.49568, 1, 0, 0.3960784, 1,
1.492239, -1.110731, 2.973466, 1, 0, 0.3882353, 1,
1.495212, 0.05381877, 1.071173, 1, 0, 0.3843137, 1,
1.510244, 0.5339329, 1.096548, 1, 0, 0.3764706, 1,
1.513561, 1.039387, 0.1903681, 1, 0, 0.372549, 1,
1.527785, -0.1617779, 4.134105, 1, 0, 0.3647059, 1,
1.533839, -0.2866723, 1.474734, 1, 0, 0.3607843, 1,
1.540965, -0.7843871, 2.263994, 1, 0, 0.3529412, 1,
1.546813, 1.093357, 0.2445589, 1, 0, 0.3490196, 1,
1.551633, 2.83853, 2.091861, 1, 0, 0.3411765, 1,
1.551888, 1.419276, 0.3497369, 1, 0, 0.3372549, 1,
1.56306, 0.8743597, 0.3605027, 1, 0, 0.3294118, 1,
1.571728, 1.429615, 0.3022417, 1, 0, 0.3254902, 1,
1.5719, -0.2070272, 3.168344, 1, 0, 0.3176471, 1,
1.573288, -0.3040483, 0.3484709, 1, 0, 0.3137255, 1,
1.574769, -0.959164, 0.2025378, 1, 0, 0.3058824, 1,
1.591413, 0.75524, 1.155922, 1, 0, 0.2980392, 1,
1.592148, 2.045263, 1.432457, 1, 0, 0.2941177, 1,
1.598933, 0.9695373, 0.4985289, 1, 0, 0.2862745, 1,
1.60205, 1.166676, 0.6225207, 1, 0, 0.282353, 1,
1.612038, -0.9347336, 2.176241, 1, 0, 0.2745098, 1,
1.616706, -0.9442131, 2.6575, 1, 0, 0.2705882, 1,
1.616709, -0.9202693, 2.145772, 1, 0, 0.2627451, 1,
1.639632, 1.453191, 1.287094, 1, 0, 0.2588235, 1,
1.643399, -1.420314, 2.935711, 1, 0, 0.2509804, 1,
1.643461, 2.201658, 0.6947823, 1, 0, 0.2470588, 1,
1.678595, -0.5744894, 2.183779, 1, 0, 0.2392157, 1,
1.693885, 0.2121905, 0.3114738, 1, 0, 0.2352941, 1,
1.696203, -1.281982, 3.299619, 1, 0, 0.227451, 1,
1.706932, 0.3517824, 1.245971, 1, 0, 0.2235294, 1,
1.728162, -0.4933245, 0.06513646, 1, 0, 0.2156863, 1,
1.73203, -0.1426096, 2.697069, 1, 0, 0.2117647, 1,
1.739143, -0.2950913, 1.826816, 1, 0, 0.2039216, 1,
1.764376, 0.9485549, 1.13157, 1, 0, 0.1960784, 1,
1.764543, -1.316213, 2.686355, 1, 0, 0.1921569, 1,
1.768547, -0.6970327, 0.8761784, 1, 0, 0.1843137, 1,
1.778057, -1.403302, 0.8905249, 1, 0, 0.1803922, 1,
1.780481, -0.5300931, 0.9956927, 1, 0, 0.172549, 1,
1.876419, -2.105652, 1.753432, 1, 0, 0.1686275, 1,
1.893441, 0.07501888, 1.494395, 1, 0, 0.1607843, 1,
1.909707, -1.177256, 1.079137, 1, 0, 0.1568628, 1,
1.910832, -1.818914, 3.072792, 1, 0, 0.1490196, 1,
1.914921, 0.3798246, 2.052652, 1, 0, 0.145098, 1,
1.931232, 1.190086, 1.811458, 1, 0, 0.1372549, 1,
1.96166, 0.4852152, 1.819371, 1, 0, 0.1333333, 1,
1.965144, -0.9210103, 2.853675, 1, 0, 0.1254902, 1,
1.96535, 0.2596967, 2.570814, 1, 0, 0.1215686, 1,
1.970942, -0.8406296, 0.9988841, 1, 0, 0.1137255, 1,
1.972918, -0.3185316, 1.303696, 1, 0, 0.1098039, 1,
1.999303, 1.646817, 1.399804, 1, 0, 0.1019608, 1,
2.022131, -0.4329221, 1.378159, 1, 0, 0.09411765, 1,
2.040935, -0.4048414, 2.063845, 1, 0, 0.09019608, 1,
2.060693, -1.831157, 2.15349, 1, 0, 0.08235294, 1,
2.077155, 0.4887996, 0.5172652, 1, 0, 0.07843138, 1,
2.124052, -0.5069898, 3.868953, 1, 0, 0.07058824, 1,
2.135369, 0.3522115, 2.688451, 1, 0, 0.06666667, 1,
2.150424, 0.2259894, 0.4743648, 1, 0, 0.05882353, 1,
2.153109, 0.4242446, 2.912266, 1, 0, 0.05490196, 1,
2.181194, -0.3648632, 1.276943, 1, 0, 0.04705882, 1,
2.192433, 0.2229279, 1.575641, 1, 0, 0.04313726, 1,
2.275416, 1.431138, 2.161071, 1, 0, 0.03529412, 1,
2.312025, 0.4278056, 0.3157324, 1, 0, 0.03137255, 1,
2.460881, 0.4675118, 0.4139488, 1, 0, 0.02352941, 1,
2.608738, 2.246881, -0.07855523, 1, 0, 0.01960784, 1,
2.668333, 0.2989424, 1.431103, 1, 0, 0.01176471, 1,
2.730562, 1.494183, -0.4063161, 1, 0, 0.007843138, 1
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
-0.7189865, -4.023625, -7.019141, 0, -0.5, 0.5, 0.5,
-0.7189865, -4.023625, -7.019141, 1, -0.5, 0.5, 0.5,
-0.7189865, -4.023625, -7.019141, 1, 1.5, 0.5, 0.5,
-0.7189865, -4.023625, -7.019141, 0, 1.5, 0.5, 0.5
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
-5.337932, 0.1804869, -7.019141, 0, -0.5, 0.5, 0.5,
-5.337932, 0.1804869, -7.019141, 1, -0.5, 0.5, 0.5,
-5.337932, 0.1804869, -7.019141, 1, 1.5, 0.5, 0.5,
-5.337932, 0.1804869, -7.019141, 0, 1.5, 0.5, 0.5
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
-5.337932, -4.023625, 0.3669679, 0, -0.5, 0.5, 0.5,
-5.337932, -4.023625, 0.3669679, 1, -0.5, 0.5, 0.5,
-5.337932, -4.023625, 0.3669679, 1, 1.5, 0.5, 0.5,
-5.337932, -4.023625, 0.3669679, 0, 1.5, 0.5, 0.5
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
-4, -3.053446, -5.314654,
2, -3.053446, -5.314654,
-4, -3.053446, -5.314654,
-4, -3.215142, -5.598735,
-3, -3.053446, -5.314654,
-3, -3.215142, -5.598735,
-2, -3.053446, -5.314654,
-2, -3.215142, -5.598735,
-1, -3.053446, -5.314654,
-1, -3.215142, -5.598735,
0, -3.053446, -5.314654,
0, -3.215142, -5.598735,
1, -3.053446, -5.314654,
1, -3.215142, -5.598735,
2, -3.053446, -5.314654,
2, -3.215142, -5.598735
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
"-4",
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
-4, -3.538536, -6.166897, 0, -0.5, 0.5, 0.5,
-4, -3.538536, -6.166897, 1, -0.5, 0.5, 0.5,
-4, -3.538536, -6.166897, 1, 1.5, 0.5, 0.5,
-4, -3.538536, -6.166897, 0, 1.5, 0.5, 0.5,
-3, -3.538536, -6.166897, 0, -0.5, 0.5, 0.5,
-3, -3.538536, -6.166897, 1, -0.5, 0.5, 0.5,
-3, -3.538536, -6.166897, 1, 1.5, 0.5, 0.5,
-3, -3.538536, -6.166897, 0, 1.5, 0.5, 0.5,
-2, -3.538536, -6.166897, 0, -0.5, 0.5, 0.5,
-2, -3.538536, -6.166897, 1, -0.5, 0.5, 0.5,
-2, -3.538536, -6.166897, 1, 1.5, 0.5, 0.5,
-2, -3.538536, -6.166897, 0, 1.5, 0.5, 0.5,
-1, -3.538536, -6.166897, 0, -0.5, 0.5, 0.5,
-1, -3.538536, -6.166897, 1, -0.5, 0.5, 0.5,
-1, -3.538536, -6.166897, 1, 1.5, 0.5, 0.5,
-1, -3.538536, -6.166897, 0, 1.5, 0.5, 0.5,
0, -3.538536, -6.166897, 0, -0.5, 0.5, 0.5,
0, -3.538536, -6.166897, 1, -0.5, 0.5, 0.5,
0, -3.538536, -6.166897, 1, 1.5, 0.5, 0.5,
0, -3.538536, -6.166897, 0, 1.5, 0.5, 0.5,
1, -3.538536, -6.166897, 0, -0.5, 0.5, 0.5,
1, -3.538536, -6.166897, 1, -0.5, 0.5, 0.5,
1, -3.538536, -6.166897, 1, 1.5, 0.5, 0.5,
1, -3.538536, -6.166897, 0, 1.5, 0.5, 0.5,
2, -3.538536, -6.166897, 0, -0.5, 0.5, 0.5,
2, -3.538536, -6.166897, 1, -0.5, 0.5, 0.5,
2, -3.538536, -6.166897, 1, 1.5, 0.5, 0.5,
2, -3.538536, -6.166897, 0, 1.5, 0.5, 0.5
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
-4.272021, -2, -5.314654,
-4.272021, 3, -5.314654,
-4.272021, -2, -5.314654,
-4.449673, -2, -5.598735,
-4.272021, -1, -5.314654,
-4.449673, -1, -5.598735,
-4.272021, 0, -5.314654,
-4.449673, 0, -5.598735,
-4.272021, 1, -5.314654,
-4.449673, 1, -5.598735,
-4.272021, 2, -5.314654,
-4.449673, 2, -5.598735,
-4.272021, 3, -5.314654,
-4.449673, 3, -5.598735
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
-4.804976, -2, -6.166897, 0, -0.5, 0.5, 0.5,
-4.804976, -2, -6.166897, 1, -0.5, 0.5, 0.5,
-4.804976, -2, -6.166897, 1, 1.5, 0.5, 0.5,
-4.804976, -2, -6.166897, 0, 1.5, 0.5, 0.5,
-4.804976, -1, -6.166897, 0, -0.5, 0.5, 0.5,
-4.804976, -1, -6.166897, 1, -0.5, 0.5, 0.5,
-4.804976, -1, -6.166897, 1, 1.5, 0.5, 0.5,
-4.804976, -1, -6.166897, 0, 1.5, 0.5, 0.5,
-4.804976, 0, -6.166897, 0, -0.5, 0.5, 0.5,
-4.804976, 0, -6.166897, 1, -0.5, 0.5, 0.5,
-4.804976, 0, -6.166897, 1, 1.5, 0.5, 0.5,
-4.804976, 0, -6.166897, 0, 1.5, 0.5, 0.5,
-4.804976, 1, -6.166897, 0, -0.5, 0.5, 0.5,
-4.804976, 1, -6.166897, 1, -0.5, 0.5, 0.5,
-4.804976, 1, -6.166897, 1, 1.5, 0.5, 0.5,
-4.804976, 1, -6.166897, 0, 1.5, 0.5, 0.5,
-4.804976, 2, -6.166897, 0, -0.5, 0.5, 0.5,
-4.804976, 2, -6.166897, 1, -0.5, 0.5, 0.5,
-4.804976, 2, -6.166897, 1, 1.5, 0.5, 0.5,
-4.804976, 2, -6.166897, 0, 1.5, 0.5, 0.5,
-4.804976, 3, -6.166897, 0, -0.5, 0.5, 0.5,
-4.804976, 3, -6.166897, 1, -0.5, 0.5, 0.5,
-4.804976, 3, -6.166897, 1, 1.5, 0.5, 0.5,
-4.804976, 3, -6.166897, 0, 1.5, 0.5, 0.5
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
-4.272021, -3.053446, -4,
-4.272021, -3.053446, 4,
-4.272021, -3.053446, -4,
-4.449673, -3.215142, -4,
-4.272021, -3.053446, -2,
-4.449673, -3.215142, -2,
-4.272021, -3.053446, 0,
-4.449673, -3.215142, 0,
-4.272021, -3.053446, 2,
-4.449673, -3.215142, 2,
-4.272021, -3.053446, 4,
-4.449673, -3.215142, 4
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
-4.804976, -3.538536, -4, 0, -0.5, 0.5, 0.5,
-4.804976, -3.538536, -4, 1, -0.5, 0.5, 0.5,
-4.804976, -3.538536, -4, 1, 1.5, 0.5, 0.5,
-4.804976, -3.538536, -4, 0, 1.5, 0.5, 0.5,
-4.804976, -3.538536, -2, 0, -0.5, 0.5, 0.5,
-4.804976, -3.538536, -2, 1, -0.5, 0.5, 0.5,
-4.804976, -3.538536, -2, 1, 1.5, 0.5, 0.5,
-4.804976, -3.538536, -2, 0, 1.5, 0.5, 0.5,
-4.804976, -3.538536, 0, 0, -0.5, 0.5, 0.5,
-4.804976, -3.538536, 0, 1, -0.5, 0.5, 0.5,
-4.804976, -3.538536, 0, 1, 1.5, 0.5, 0.5,
-4.804976, -3.538536, 0, 0, 1.5, 0.5, 0.5,
-4.804976, -3.538536, 2, 0, -0.5, 0.5, 0.5,
-4.804976, -3.538536, 2, 1, -0.5, 0.5, 0.5,
-4.804976, -3.538536, 2, 1, 1.5, 0.5, 0.5,
-4.804976, -3.538536, 2, 0, 1.5, 0.5, 0.5,
-4.804976, -3.538536, 4, 0, -0.5, 0.5, 0.5,
-4.804976, -3.538536, 4, 1, -0.5, 0.5, 0.5,
-4.804976, -3.538536, 4, 1, 1.5, 0.5, 0.5,
-4.804976, -3.538536, 4, 0, 1.5, 0.5, 0.5
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
-4.272021, -3.053446, -5.314654,
-4.272021, 3.41442, -5.314654,
-4.272021, -3.053446, 6.04859,
-4.272021, 3.41442, 6.04859,
-4.272021, -3.053446, -5.314654,
-4.272021, -3.053446, 6.04859,
-4.272021, 3.41442, -5.314654,
-4.272021, 3.41442, 6.04859,
-4.272021, -3.053446, -5.314654,
2.834048, -3.053446, -5.314654,
-4.272021, -3.053446, 6.04859,
2.834048, -3.053446, 6.04859,
-4.272021, 3.41442, -5.314654,
2.834048, 3.41442, -5.314654,
-4.272021, 3.41442, 6.04859,
2.834048, 3.41442, 6.04859,
2.834048, -3.053446, -5.314654,
2.834048, 3.41442, -5.314654,
2.834048, -3.053446, 6.04859,
2.834048, 3.41442, 6.04859,
2.834048, -3.053446, -5.314654,
2.834048, -3.053446, 6.04859,
2.834048, 3.41442, -5.314654,
2.834048, 3.41442, 6.04859
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
var radius = 7.94632;
var distance = 35.35408;
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
mvMatrix.translate( 0.7189865, -0.1804869, -0.3669679 );
mvMatrix.scale( 1.209067, 1.32837, 0.7560973 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.35408);
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
Benzanilide<-read.table("Benzanilide.xyz")
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
-4.168535, 0.3946344, -2.058452, 0, 0, 1, 1, 1,
-3.696553, 0.4217998, -2.759476, 1, 0, 0, 1, 1,
-3.552062, 0.6334666, -0.9699734, 1, 0, 0, 1, 1,
-3.191287, -0.5926002, -2.423213, 1, 0, 0, 1, 1,
-2.801866, -1.068487, -2.444082, 1, 0, 0, 1, 1,
-2.765999, 1.816191, -1.88666, 1, 0, 0, 1, 1,
-2.757935, -0.04137063, 0.06484668, 0, 0, 0, 1, 1,
-2.707831, -2.176728, -2.30005, 0, 0, 0, 1, 1,
-2.631336, 0.02299631, -1.413439, 0, 0, 0, 1, 1,
-2.54316, -1.350448, -1.855349, 0, 0, 0, 1, 1,
-2.54064, -0.2977089, -2.044754, 0, 0, 0, 1, 1,
-2.51339, 1.476616, -1.521276, 0, 0, 0, 1, 1,
-2.474366, -0.1011094, -2.715252, 0, 0, 0, 1, 1,
-2.426451, 0.08892182, -1.699997, 1, 1, 1, 1, 1,
-2.407596, -0.3527968, -2.330321, 1, 1, 1, 1, 1,
-2.406632, -2.47296, -1.462164, 1, 1, 1, 1, 1,
-2.235246, -0.06444063, -1.312812, 1, 1, 1, 1, 1,
-2.228981, 0.2889552, -0.8182376, 1, 1, 1, 1, 1,
-2.210077, 0.5049613, -1.160276, 1, 1, 1, 1, 1,
-2.139264, 0.7271368, -2.26666, 1, 1, 1, 1, 1,
-2.066371, 0.696089, -1.119553, 1, 1, 1, 1, 1,
-2.058554, 0.01157601, -0.8081619, 1, 1, 1, 1, 1,
-1.990845, -0.2722923, -2.938249, 1, 1, 1, 1, 1,
-1.982373, -0.2533972, -0.9828373, 1, 1, 1, 1, 1,
-1.980486, 1.761435, -0.5275194, 1, 1, 1, 1, 1,
-1.978341, -2.191957, -1.248267, 1, 1, 1, 1, 1,
-1.947489, -0.4666873, -0.6045237, 1, 1, 1, 1, 1,
-1.928535, -0.3763133, -1.678616, 1, 1, 1, 1, 1,
-1.923628, 1.518164, -0.5100576, 0, 0, 1, 1, 1,
-1.904186, -0.08449745, -0.9999421, 1, 0, 0, 1, 1,
-1.886581, -0.3593797, -2.670285, 1, 0, 0, 1, 1,
-1.880943, -0.5523212, -1.587046, 1, 0, 0, 1, 1,
-1.878804, 0.1585038, -3.105165, 1, 0, 0, 1, 1,
-1.868849, -2.018306, -4.192087, 1, 0, 0, 1, 1,
-1.813653, -0.4870202, 1.111592, 0, 0, 0, 1, 1,
-1.784283, -0.1885196, -0.9654681, 0, 0, 0, 1, 1,
-1.777048, -1.564905, -4.157249, 0, 0, 0, 1, 1,
-1.768627, 0.1082801, -2.126654, 0, 0, 0, 1, 1,
-1.724151, 0.5771345, -0.9933958, 0, 0, 0, 1, 1,
-1.716564, -0.5927249, -2.542096, 0, 0, 0, 1, 1,
-1.698115, -0.3977004, -2.898202, 0, 0, 0, 1, 1,
-1.688166, -0.1758754, -1.855067, 1, 1, 1, 1, 1,
-1.671165, 0.6554881, -0.2885089, 1, 1, 1, 1, 1,
-1.64793, -1.457613, -3.924635, 1, 1, 1, 1, 1,
-1.635186, -0.1277081, -3.053186, 1, 1, 1, 1, 1,
-1.632077, -1.804131, -1.453094, 1, 1, 1, 1, 1,
-1.627746, 0.1793932, -0.8847945, 1, 1, 1, 1, 1,
-1.624274, 0.1046972, -0.6113767, 1, 1, 1, 1, 1,
-1.593528, -1.430572, -3.394387, 1, 1, 1, 1, 1,
-1.569752, -0.5826958, -1.405099, 1, 1, 1, 1, 1,
-1.544532, 0.02102599, -1.830152, 1, 1, 1, 1, 1,
-1.544275, -0.4330205, -2.087719, 1, 1, 1, 1, 1,
-1.534341, -1.175057, -3.09145, 1, 1, 1, 1, 1,
-1.534307, -0.6278177, -1.030775, 1, 1, 1, 1, 1,
-1.519202, 0.1885362, -1.26162, 1, 1, 1, 1, 1,
-1.515949, 0.1677655, -1.665257, 1, 1, 1, 1, 1,
-1.508221, 1.336457, -1.359693, 0, 0, 1, 1, 1,
-1.486189, -0.9010621, -3.477561, 1, 0, 0, 1, 1,
-1.481001, -0.1016263, -0.9780745, 1, 0, 0, 1, 1,
-1.477673, -1.443157, -2.617562, 1, 0, 0, 1, 1,
-1.469107, -0.7705625, -1.681425, 1, 0, 0, 1, 1,
-1.468769, -1.843717, 0.1273459, 1, 0, 0, 1, 1,
-1.457338, -1.394659, -3.852987, 0, 0, 0, 1, 1,
-1.455351, -0.3392135, -1.339417, 0, 0, 0, 1, 1,
-1.45476, 0.9808894, 0.6594175, 0, 0, 0, 1, 1,
-1.45311, -0.4740847, -2.706143, 0, 0, 0, 1, 1,
-1.448423, -0.9157462, -2.769088, 0, 0, 0, 1, 1,
-1.438528, 1.742132, -0.6672481, 0, 0, 0, 1, 1,
-1.429173, -1.079909, -2.69634, 0, 0, 0, 1, 1,
-1.420888, 0.02433175, -0.04325712, 1, 1, 1, 1, 1,
-1.416336, 0.06301697, -0.8397067, 1, 1, 1, 1, 1,
-1.415146, -0.2886713, -2.153822, 1, 1, 1, 1, 1,
-1.406362, -0.4175862, -0.4937622, 1, 1, 1, 1, 1,
-1.387952, 1.511555, 0.1896458, 1, 1, 1, 1, 1,
-1.387478, 0.1104517, -0.6471947, 1, 1, 1, 1, 1,
-1.365185, 1.783929, -0.7260774, 1, 1, 1, 1, 1,
-1.356659, 0.4569174, -1.659255, 1, 1, 1, 1, 1,
-1.352457, -0.704842, -1.858036, 1, 1, 1, 1, 1,
-1.34953, 0.4596682, -2.503468, 1, 1, 1, 1, 1,
-1.34612, -0.3617576, -1.909446, 1, 1, 1, 1, 1,
-1.344723, 0.09606244, -0.5471998, 1, 1, 1, 1, 1,
-1.343179, -0.3422144, -2.862482, 1, 1, 1, 1, 1,
-1.343057, 0.9080666, -0.2728199, 1, 1, 1, 1, 1,
-1.341669, -1.323452, -3.413032, 1, 1, 1, 1, 1,
-1.335918, -0.08566335, 0.3305151, 0, 0, 1, 1, 1,
-1.33506, -0.38163, -2.78362, 1, 0, 0, 1, 1,
-1.334134, -0.4806188, -1.148175, 1, 0, 0, 1, 1,
-1.327965, 1.115598, -0.4295409, 1, 0, 0, 1, 1,
-1.320236, -0.4007975, -2.696359, 1, 0, 0, 1, 1,
-1.292534, -0.9221108, -0.5260512, 1, 0, 0, 1, 1,
-1.289357, 0.912294, -0.4599037, 0, 0, 0, 1, 1,
-1.275982, -0.9502153, -1.859108, 0, 0, 0, 1, 1,
-1.263456, -0.6486757, -1.575782, 0, 0, 0, 1, 1,
-1.262409, -1.180356, -1.319898, 0, 0, 0, 1, 1,
-1.261703, 0.8221847, -0.4450597, 0, 0, 0, 1, 1,
-1.240264, -0.9879788, -1.181552, 0, 0, 0, 1, 1,
-1.233036, 1.134632, -1.260701, 0, 0, 0, 1, 1,
-1.230663, -0.2853341, -1.979464, 1, 1, 1, 1, 1,
-1.223815, -0.6741961, -2.554651, 1, 1, 1, 1, 1,
-1.219094, -0.2426646, -3.444378, 1, 1, 1, 1, 1,
-1.217064, -0.5277992, -1.042207, 1, 1, 1, 1, 1,
-1.217044, 0.6536832, -0.3141058, 1, 1, 1, 1, 1,
-1.207875, -0.1781495, 0.005813886, 1, 1, 1, 1, 1,
-1.200608, 1.476104, -0.545858, 1, 1, 1, 1, 1,
-1.189192, 0.7938768, -0.1729486, 1, 1, 1, 1, 1,
-1.178704, 0.809172, -3.154006, 1, 1, 1, 1, 1,
-1.177595, 0.3934968, -2.63349, 1, 1, 1, 1, 1,
-1.177503, -1.640435, -2.605677, 1, 1, 1, 1, 1,
-1.176732, 1.463638, -0.9075313, 1, 1, 1, 1, 1,
-1.172954, 0.386275, -2.457157, 1, 1, 1, 1, 1,
-1.172663, 0.5666225, -1.770726, 1, 1, 1, 1, 1,
-1.170931, -1.205487, -0.4560569, 1, 1, 1, 1, 1,
-1.167401, 0.7866091, 0.9200503, 0, 0, 1, 1, 1,
-1.165272, 0.9662951, -1.820134, 1, 0, 0, 1, 1,
-1.165032, -0.08740322, -2.630107, 1, 0, 0, 1, 1,
-1.156039, 0.9854059, -1.51231, 1, 0, 0, 1, 1,
-1.129663, 1.123433, 1.248277, 1, 0, 0, 1, 1,
-1.126903, -0.2424462, -2.22857, 1, 0, 0, 1, 1,
-1.118035, 0.4664207, -2.25901, 0, 0, 0, 1, 1,
-1.116608, 0.09991213, -1.063788, 0, 0, 0, 1, 1,
-1.116567, 0.412808, -1.278958, 0, 0, 0, 1, 1,
-1.113452, 0.8460538, -1.169792, 0, 0, 0, 1, 1,
-1.110093, -0.7929609, -1.628041, 0, 0, 0, 1, 1,
-1.107574, -0.1456777, -2.6158, 0, 0, 0, 1, 1,
-1.104731, -0.4415039, -1.577909, 0, 0, 0, 1, 1,
-1.100306, -2.773569, -1.59015, 1, 1, 1, 1, 1,
-1.096053, -0.7813849, -2.588374, 1, 1, 1, 1, 1,
-1.08901, 1.011706, -0.8913908, 1, 1, 1, 1, 1,
-1.088875, -0.5409403, -1.290452, 1, 1, 1, 1, 1,
-1.085171, 0.2800395, -1.02712, 1, 1, 1, 1, 1,
-1.080632, 0.1457883, -2.627269, 1, 1, 1, 1, 1,
-1.076461, 2.656445, -0.9433608, 1, 1, 1, 1, 1,
-1.075144, 1.038353, -1.261728, 1, 1, 1, 1, 1,
-1.067032, 0.2369894, -0.9616727, 1, 1, 1, 1, 1,
-1.065846, -1.445226, -1.672996, 1, 1, 1, 1, 1,
-1.065347, 0.7580283, -1.459602, 1, 1, 1, 1, 1,
-1.053238, -0.5519288, -3.117147, 1, 1, 1, 1, 1,
-1.050532, 0.3935084, -1.553512, 1, 1, 1, 1, 1,
-1.050467, -0.3204861, -2.862216, 1, 1, 1, 1, 1,
-1.049964, -1.350497, -1.887316, 1, 1, 1, 1, 1,
-1.04254, -0.9772288, -1.413725, 0, 0, 1, 1, 1,
-1.030991, 0.9017229, -1.268644, 1, 0, 0, 1, 1,
-1.029941, 1.62482, -0.02541373, 1, 0, 0, 1, 1,
-1.027614, -0.8239983, -2.831877, 1, 0, 0, 1, 1,
-1.025202, 1.758345, 0.7912246, 1, 0, 0, 1, 1,
-1.022131, 0.8128922, -1.399265, 1, 0, 0, 1, 1,
-1.000641, -0.8391342, -1.759363, 0, 0, 0, 1, 1,
-0.9935088, -0.5265405, -3.216605, 0, 0, 0, 1, 1,
-0.991915, 1.894356, 0.2680754, 0, 0, 0, 1, 1,
-0.9885639, -0.909048, -1.07412, 0, 0, 0, 1, 1,
-0.977829, -0.6911928, -1.956125, 0, 0, 0, 1, 1,
-0.9738644, -0.009931807, -0.9258446, 0, 0, 0, 1, 1,
-0.9649105, -0.3333117, -2.389914, 0, 0, 0, 1, 1,
-0.9530315, -0.6009114, -0.3837835, 1, 1, 1, 1, 1,
-0.952727, -0.6023635, -3.077932, 1, 1, 1, 1, 1,
-0.9393693, -0.5954574, -3.004304, 1, 1, 1, 1, 1,
-0.9244664, 0.3824698, -1.397439, 1, 1, 1, 1, 1,
-0.9228176, -1.489257, -1.374847, 1, 1, 1, 1, 1,
-0.9218252, 0.909138, 0.9245189, 1, 1, 1, 1, 1,
-0.9196357, -0.8457106, -1.901634, 1, 1, 1, 1, 1,
-0.9102385, -0.7900558, -3.034869, 1, 1, 1, 1, 1,
-0.8977893, 0.5881436, 0.2955903, 1, 1, 1, 1, 1,
-0.8976659, -0.8242308, -1.861044, 1, 1, 1, 1, 1,
-0.8962065, -1.327587, -1.694782, 1, 1, 1, 1, 1,
-0.8942736, -0.04630711, -2.290554, 1, 1, 1, 1, 1,
-0.8895949, 0.1110912, -1.802944, 1, 1, 1, 1, 1,
-0.8763323, -0.7111696, -3.86561, 1, 1, 1, 1, 1,
-0.8757101, -0.002496859, -0.5320885, 1, 1, 1, 1, 1,
-0.8691086, 0.1623283, -1.342661, 0, 0, 1, 1, 1,
-0.8684214, -1.095417, -1.94854, 1, 0, 0, 1, 1,
-0.8613074, 0.3352077, -1.650405, 1, 0, 0, 1, 1,
-0.8436351, -0.3957289, -1.831324, 1, 0, 0, 1, 1,
-0.8370801, -2.266284, -2.823785, 1, 0, 0, 1, 1,
-0.8294529, 0.04872461, -1.080788, 1, 0, 0, 1, 1,
-0.8285854, 2.360764, -1.695846, 0, 0, 0, 1, 1,
-0.8262708, -0.3003088, -0.9890553, 0, 0, 0, 1, 1,
-0.8259448, -0.06094747, -2.276009, 0, 0, 0, 1, 1,
-0.8247027, 1.380032, -0.5934374, 0, 0, 0, 1, 1,
-0.822164, -1.573662, -1.415677, 0, 0, 0, 1, 1,
-0.8221264, -0.8606141, -0.9253609, 0, 0, 0, 1, 1,
-0.8213313, -2.187984, -3.679224, 0, 0, 0, 1, 1,
-0.8206943, 0.5129683, -0.5789953, 1, 1, 1, 1, 1,
-0.8069762, -0.1636899, -2.209438, 1, 1, 1, 1, 1,
-0.804135, 1.840532, -1.364623, 1, 1, 1, 1, 1,
-0.8039155, 0.8989826, -0.3210066, 1, 1, 1, 1, 1,
-0.7933398, -0.6969755, -2.967872, 1, 1, 1, 1, 1,
-0.79204, 0.7527407, -0.1909062, 1, 1, 1, 1, 1,
-0.7891428, -0.5719535, -2.965402, 1, 1, 1, 1, 1,
-0.7877593, 0.6270905, -1.672404, 1, 1, 1, 1, 1,
-0.7861348, 0.07997377, -1.956339, 1, 1, 1, 1, 1,
-0.7827524, -0.8753659, -2.051254, 1, 1, 1, 1, 1,
-0.7818314, -0.1557499, -1.885014, 1, 1, 1, 1, 1,
-0.776724, 0.487533, -0.9887127, 1, 1, 1, 1, 1,
-0.7755452, 0.653551, -1.365114, 1, 1, 1, 1, 1,
-0.7711959, 0.8964486, -0.4212408, 1, 1, 1, 1, 1,
-0.7693787, 0.0426479, -1.584654, 1, 1, 1, 1, 1,
-0.7644377, 0.9224113, 0.1231124, 0, 0, 1, 1, 1,
-0.7631879, -0.0414545, -1.651921, 1, 0, 0, 1, 1,
-0.7616242, 0.4598758, -0.9535715, 1, 0, 0, 1, 1,
-0.7589366, -1.598784, -5.14917, 1, 0, 0, 1, 1,
-0.7586377, 0.0876209, -1.192258, 1, 0, 0, 1, 1,
-0.7525987, 0.6767997, 0.3759862, 1, 0, 0, 1, 1,
-0.7406303, 0.3719023, 0.1153151, 0, 0, 0, 1, 1,
-0.7380099, 0.1151299, -1.780423, 0, 0, 0, 1, 1,
-0.7379524, 1.869842, 0.6266579, 0, 0, 0, 1, 1,
-0.734439, -1.126704, -3.95747, 0, 0, 0, 1, 1,
-0.7286407, -0.3670328, -0.9597562, 0, 0, 0, 1, 1,
-0.722571, 0.3128749, -2.327404, 0, 0, 0, 1, 1,
-0.7204239, 0.8418059, -1.758363, 0, 0, 0, 1, 1,
-0.7151859, 0.4566057, -2.617124, 1, 1, 1, 1, 1,
-0.7129539, -1.465381, -3.240782, 1, 1, 1, 1, 1,
-0.7128735, -1.843621, -2.205158, 1, 1, 1, 1, 1,
-0.7114578, 0.04920788, -1.639933, 1, 1, 1, 1, 1,
-0.7109844, -0.2105277, -1.971339, 1, 1, 1, 1, 1,
-0.7092825, 2.08733, -1.164974, 1, 1, 1, 1, 1,
-0.7046855, -1.69108, -2.231005, 1, 1, 1, 1, 1,
-0.7022503, 1.396973, 0.1878406, 1, 1, 1, 1, 1,
-0.6961673, -0.2697787, -1.610033, 1, 1, 1, 1, 1,
-0.6957636, 1.491792, -1.36619, 1, 1, 1, 1, 1,
-0.6852065, 1.558235, -1.54147, 1, 1, 1, 1, 1,
-0.6812577, 0.1791768, -1.470938, 1, 1, 1, 1, 1,
-0.6801518, 0.8585237, 0.6249667, 1, 1, 1, 1, 1,
-0.6782776, 1.022268, 0.03643338, 1, 1, 1, 1, 1,
-0.6700314, 1.023265, 1.82536, 1, 1, 1, 1, 1,
-0.669369, 0.5461082, -0.9544521, 0, 0, 1, 1, 1,
-0.6691243, -1.122899, -2.110008, 1, 0, 0, 1, 1,
-0.6642507, 0.09046989, -0.7295628, 1, 0, 0, 1, 1,
-0.6633047, 0.2620887, -2.072181, 1, 0, 0, 1, 1,
-0.6590541, -0.3752095, -2.421199, 1, 0, 0, 1, 1,
-0.6565448, 0.3315633, -1.221886, 1, 0, 0, 1, 1,
-0.6516653, -0.2310932, -2.622911, 0, 0, 0, 1, 1,
-0.6516293, 1.986925, 0.302057, 0, 0, 0, 1, 1,
-0.6504294, 1.093207, 1.121659, 0, 0, 0, 1, 1,
-0.6434991, -0.3420286, -1.230777, 0, 0, 0, 1, 1,
-0.6430089, -0.4026085, -3.446195, 0, 0, 0, 1, 1,
-0.6423872, -1.462438, -3.553847, 0, 0, 0, 1, 1,
-0.6295531, -1.370949, -0.9701277, 0, 0, 0, 1, 1,
-0.62862, 0.2521574, -1.512856, 1, 1, 1, 1, 1,
-0.6268057, 0.497416, -0.5750262, 1, 1, 1, 1, 1,
-0.6263341, -0.0007757175, -1.425996, 1, 1, 1, 1, 1,
-0.6250759, -2.326316, -3.855516, 1, 1, 1, 1, 1,
-0.6153271, 0.8795772, 0.5204518, 1, 1, 1, 1, 1,
-0.615032, -0.7543824, -2.647693, 1, 1, 1, 1, 1,
-0.6132326, -0.4891005, -1.824842, 1, 1, 1, 1, 1,
-0.6128044, 0.3072984, -1.867733, 1, 1, 1, 1, 1,
-0.6052317, -1.08323, -1.652465, 1, 1, 1, 1, 1,
-0.6050037, -0.07230414, -1.914158, 1, 1, 1, 1, 1,
-0.5990316, 1.090869, -1.524195, 1, 1, 1, 1, 1,
-0.5986799, -0.3119158, -0.7465385, 1, 1, 1, 1, 1,
-0.5956644, -0.1659247, -1.018664, 1, 1, 1, 1, 1,
-0.5950878, 0.7895885, 0.716868, 1, 1, 1, 1, 1,
-0.5944978, 0.2163835, 1.584355, 1, 1, 1, 1, 1,
-0.5901201, -1.827716, -2.722483, 0, 0, 1, 1, 1,
-0.5798561, 0.8232009, -0.6643786, 1, 0, 0, 1, 1,
-0.57803, 0.08959461, -0.6258752, 1, 0, 0, 1, 1,
-0.5618874, -0.7123235, -2.389401, 1, 0, 0, 1, 1,
-0.5591881, -0.02603039, -1.554956, 1, 0, 0, 1, 1,
-0.5543637, 1.602256, -1.802304, 1, 0, 0, 1, 1,
-0.550576, -1.315673, -2.599152, 0, 0, 0, 1, 1,
-0.5504009, 0.4351166, -1.328176, 0, 0, 0, 1, 1,
-0.5465693, -0.684174, -1.948721, 0, 0, 0, 1, 1,
-0.5459944, -0.9070915, -2.983356, 0, 0, 0, 1, 1,
-0.5444741, 2.044143, -0.9872085, 0, 0, 0, 1, 1,
-0.5366476, 2.12113, -0.1157082, 0, 0, 0, 1, 1,
-0.5354503, 0.2744875, 0.593566, 0, 0, 0, 1, 1,
-0.5333864, 0.404485, -0.7674338, 1, 1, 1, 1, 1,
-0.5254509, 0.6665134, 0.272602, 1, 1, 1, 1, 1,
-0.5211338, 1.406083, -0.6867812, 1, 1, 1, 1, 1,
-0.5155203, 0.883907, -0.3410859, 1, 1, 1, 1, 1,
-0.515339, -1.513752, -2.675853, 1, 1, 1, 1, 1,
-0.5122626, 1.467459, -1.837282, 1, 1, 1, 1, 1,
-0.5105611, 0.4257044, 0.8267574, 1, 1, 1, 1, 1,
-0.504764, 0.8912622, -0.6473708, 1, 1, 1, 1, 1,
-0.5023785, -1.192598, -4.280849, 1, 1, 1, 1, 1,
-0.5017289, -0.4223119, -2.51624, 1, 1, 1, 1, 1,
-0.4947662, -0.5051692, -2.891922, 1, 1, 1, 1, 1,
-0.4886463, 1.014175, -0.2607682, 1, 1, 1, 1, 1,
-0.488514, 0.05982696, -4.443113, 1, 1, 1, 1, 1,
-0.4880023, -0.465676, -1.871205, 1, 1, 1, 1, 1,
-0.4811156, -0.6056058, -2.790214, 1, 1, 1, 1, 1,
-0.4780155, -0.7922502, -1.965639, 0, 0, 1, 1, 1,
-0.4775745, 0.5336853, -1.026299, 1, 0, 0, 1, 1,
-0.4760425, 0.6262699, 0.02137747, 1, 0, 0, 1, 1,
-0.475655, -0.9744446, -2.085374, 1, 0, 0, 1, 1,
-0.4750696, 0.1682068, -1.488551, 1, 0, 0, 1, 1,
-0.4707876, -1.07012, -3.654419, 1, 0, 0, 1, 1,
-0.4696111, 0.8631525, 0.1200579, 0, 0, 0, 1, 1,
-0.4670397, 0.685625, -0.4407491, 0, 0, 0, 1, 1,
-0.4664131, -0.3760617, -0.7187114, 0, 0, 0, 1, 1,
-0.4606601, -0.2422953, -1.715145, 0, 0, 0, 1, 1,
-0.4562976, -1.314136, -1.406697, 0, 0, 0, 1, 1,
-0.455659, 0.3719013, -3.517874, 0, 0, 0, 1, 1,
-0.4554061, -0.3836437, -1.926725, 0, 0, 0, 1, 1,
-0.4523634, -1.041007, -2.980768, 1, 1, 1, 1, 1,
-0.4514019, 3.027405, 1.334238, 1, 1, 1, 1, 1,
-0.4505987, 0.2925844, 0.4369405, 1, 1, 1, 1, 1,
-0.4438267, -0.3837324, -0.997704, 1, 1, 1, 1, 1,
-0.4424747, 0.4695682, -1.074607, 1, 1, 1, 1, 1,
-0.4399909, -0.9667338, -1.75101, 1, 1, 1, 1, 1,
-0.43999, -0.5224274, -1.924103, 1, 1, 1, 1, 1,
-0.4399194, -0.03076961, -2.00836, 1, 1, 1, 1, 1,
-0.434842, 0.4739064, -0.3091371, 1, 1, 1, 1, 1,
-0.4321622, -0.5203046, -2.713167, 1, 1, 1, 1, 1,
-0.423698, 0.3383605, 0.6730937, 1, 1, 1, 1, 1,
-0.4235691, 0.06047025, -1.388015, 1, 1, 1, 1, 1,
-0.4179856, -0.9837196, -2.153082, 1, 1, 1, 1, 1,
-0.4174616, -0.7035882, -2.224165, 1, 1, 1, 1, 1,
-0.4169027, -0.9238589, -2.106404, 1, 1, 1, 1, 1,
-0.4162424, -0.1082186, -1.886174, 0, 0, 1, 1, 1,
-0.4137661, -1.288252, -2.886648, 1, 0, 0, 1, 1,
-0.4133269, -0.12703, -3.041556, 1, 0, 0, 1, 1,
-0.4110012, -0.06473155, -2.587506, 1, 0, 0, 1, 1,
-0.4068715, 0.09242646, -0.5521788, 1, 0, 0, 1, 1,
-0.396579, -0.4821669, -2.820714, 1, 0, 0, 1, 1,
-0.3958555, 0.5162529, 0.3978144, 0, 0, 0, 1, 1,
-0.395784, 1.200801, -0.4223328, 0, 0, 0, 1, 1,
-0.390443, 0.1491851, -1.276717, 0, 0, 0, 1, 1,
-0.3904315, -0.01894193, -1.130553, 0, 0, 0, 1, 1,
-0.388719, 0.4825242, 0.4364428, 0, 0, 0, 1, 1,
-0.3866137, -2.525543, -3.05594, 0, 0, 0, 1, 1,
-0.3817038, -0.523366, -3.608706, 0, 0, 0, 1, 1,
-0.3736362, 0.6695157, -0.333038, 1, 1, 1, 1, 1,
-0.3699601, 1.933514, -0.4807487, 1, 1, 1, 1, 1,
-0.3648013, 0.9228805, 1.862244, 1, 1, 1, 1, 1,
-0.3625808, 0.7437696, 0.473873, 1, 1, 1, 1, 1,
-0.3590086, -1.388358, -4.15232, 1, 1, 1, 1, 1,
-0.3560654, -0.06026432, -1.640784, 1, 1, 1, 1, 1,
-0.3533706, -0.02547249, -1.073741, 1, 1, 1, 1, 1,
-0.3502136, 0.8843139, -1.879745, 1, 1, 1, 1, 1,
-0.3397112, -0.678374, -1.388572, 1, 1, 1, 1, 1,
-0.3352641, -0.7116467, -1.914419, 1, 1, 1, 1, 1,
-0.3297234, 1.50107, -1.949248, 1, 1, 1, 1, 1,
-0.3279909, 0.3850621, -0.6889644, 1, 1, 1, 1, 1,
-0.3250834, -0.3469426, -2.594592, 1, 1, 1, 1, 1,
-0.3217211, -0.7273175, -2.576917, 1, 1, 1, 1, 1,
-0.3207694, 0.9816978, -0.9326403, 1, 1, 1, 1, 1,
-0.3198355, 0.6400964, 0.669382, 0, 0, 1, 1, 1,
-0.3194045, -0.6063406, -2.227452, 1, 0, 0, 1, 1,
-0.3114658, 1.413546, -0.7121796, 1, 0, 0, 1, 1,
-0.3111755, -0.4707869, -3.127679, 1, 0, 0, 1, 1,
-0.3078027, 0.02215138, -0.2477057, 1, 0, 0, 1, 1,
-0.3075141, -0.6071597, -2.165775, 1, 0, 0, 1, 1,
-0.307146, 1.170986, 1.129315, 0, 0, 0, 1, 1,
-0.3034573, 1.4474, -1.128531, 0, 0, 0, 1, 1,
-0.3010981, -0.2578362, -0.2213005, 0, 0, 0, 1, 1,
-0.300104, -0.04429732, -2.376762, 0, 0, 0, 1, 1,
-0.295856, 0.458439, -2.310891, 0, 0, 0, 1, 1,
-0.2918287, 0.4181896, -0.782307, 0, 0, 0, 1, 1,
-0.2889157, -0.8777106, -2.067317, 0, 0, 0, 1, 1,
-0.288855, -0.3264086, -1.348889, 1, 1, 1, 1, 1,
-0.2872014, -0.8228534, -1.781736, 1, 1, 1, 1, 1,
-0.2855953, 1.51292, 0.6240615, 1, 1, 1, 1, 1,
-0.2848379, -0.6170698, -3.48269, 1, 1, 1, 1, 1,
-0.2843599, 1.561069, 0.1383903, 1, 1, 1, 1, 1,
-0.284076, 1.043043, -0.7676669, 1, 1, 1, 1, 1,
-0.2830785, -0.1821348, -2.785964, 1, 1, 1, 1, 1,
-0.2825234, -1.269661, -1.746125, 1, 1, 1, 1, 1,
-0.2815334, 1.314481, 0.05890432, 1, 1, 1, 1, 1,
-0.2804761, 0.459439, -0.1250832, 1, 1, 1, 1, 1,
-0.2760542, -1.243929, -3.370422, 1, 1, 1, 1, 1,
-0.2716012, -0.4539616, -2.836598, 1, 1, 1, 1, 1,
-0.270746, -0.8837445, -2.891862, 1, 1, 1, 1, 1,
-0.2667428, 1.136989, 0.7579168, 1, 1, 1, 1, 1,
-0.2588058, -0.6230378, -4.180852, 1, 1, 1, 1, 1,
-0.2481402, 1.443289, 1.424106, 0, 0, 1, 1, 1,
-0.244834, -1.381153, -3.709884, 1, 0, 0, 1, 1,
-0.2420739, 1.077805, -0.2560732, 1, 0, 0, 1, 1,
-0.2420173, 0.8219386, -0.04861365, 1, 0, 0, 1, 1,
-0.2404428, -1.023162, -2.845514, 1, 0, 0, 1, 1,
-0.2390806, 0.6954429, -0.7067446, 1, 0, 0, 1, 1,
-0.2374893, -0.1316292, -3.45044, 0, 0, 0, 1, 1,
-0.2358298, -1.634557, -3.637685, 0, 0, 0, 1, 1,
-0.2351111, -1.62244, -3.452045, 0, 0, 0, 1, 1,
-0.2337768, -0.8957966, -4.548391, 0, 0, 0, 1, 1,
-0.2299628, 1.920489, 1.722317, 0, 0, 0, 1, 1,
-0.2296798, 0.1677779, 0.2524585, 0, 0, 0, 1, 1,
-0.2295713, 0.0833662, -1.326445, 0, 0, 0, 1, 1,
-0.2235542, -0.1708485, -2.144914, 1, 1, 1, 1, 1,
-0.2207379, 0.575534, -0.657793, 1, 1, 1, 1, 1,
-0.2197076, 0.7483348, -2.301976, 1, 1, 1, 1, 1,
-0.216363, -0.3268833, -3.278979, 1, 1, 1, 1, 1,
-0.2156238, -0.1930499, -1.044913, 1, 1, 1, 1, 1,
-0.2117444, -0.6445732, -1.898972, 1, 1, 1, 1, 1,
-0.2103104, -0.8934194, -2.265402, 1, 1, 1, 1, 1,
-0.2091241, 2.653711, -1.864554, 1, 1, 1, 1, 1,
-0.2091081, 0.4546667, -1.380794, 1, 1, 1, 1, 1,
-0.2084306, -1.097149, -0.5525727, 1, 1, 1, 1, 1,
-0.208135, 1.109671, 0.8231703, 1, 1, 1, 1, 1,
-0.2024547, 1.768587, -0.7716028, 1, 1, 1, 1, 1,
-0.1998055, 0.2724028, 0.2565335, 1, 1, 1, 1, 1,
-0.1994554, 0.671261, -0.09427239, 1, 1, 1, 1, 1,
-0.1988912, 0.6313162, -1.911427, 1, 1, 1, 1, 1,
-0.1988688, -0.306185, -0.4550595, 0, 0, 1, 1, 1,
-0.1966956, -2.959254, -3.046487, 1, 0, 0, 1, 1,
-0.1955254, 0.8197691, -0.2014718, 1, 0, 0, 1, 1,
-0.1946079, -1.128272, -3.740347, 1, 0, 0, 1, 1,
-0.1892955, 2.068101, 0.5068561, 1, 0, 0, 1, 1,
-0.1860827, -1.162142, -3.552068, 1, 0, 0, 1, 1,
-0.184804, 0.8094631, -1.118331, 0, 0, 0, 1, 1,
-0.181375, -1.561609, -2.275386, 0, 0, 0, 1, 1,
-0.1792961, -1.674204, -3.209976, 0, 0, 0, 1, 1,
-0.1781348, 0.1628276, -1.789118, 0, 0, 0, 1, 1,
-0.1740794, -1.182981, -2.808614, 0, 0, 0, 1, 1,
-0.1739794, 0.2042525, -0.8975818, 0, 0, 0, 1, 1,
-0.172104, -0.769535, -2.233597, 0, 0, 0, 1, 1,
-0.1708522, -1.273169, -2.097441, 1, 1, 1, 1, 1,
-0.1698658, -0.8121396, -1.323329, 1, 1, 1, 1, 1,
-0.1681691, 0.008237629, -1.424414, 1, 1, 1, 1, 1,
-0.162437, -1.408268, -4.762776, 1, 1, 1, 1, 1,
-0.1577248, 0.7289786, 0.001661069, 1, 1, 1, 1, 1,
-0.1564569, -1.213719, -2.603621, 1, 1, 1, 1, 1,
-0.1552917, -0.7499225, -3.465508, 1, 1, 1, 1, 1,
-0.154218, -0.08344699, -0.3481231, 1, 1, 1, 1, 1,
-0.1540655, 1.35507, -0.09443182, 1, 1, 1, 1, 1,
-0.1529932, -0.84236, -4.307053, 1, 1, 1, 1, 1,
-0.1524484, -0.6288601, -4.691024, 1, 1, 1, 1, 1,
-0.1510645, -0.5079257, -3.493227, 1, 1, 1, 1, 1,
-0.1486152, 0.5194428, 0.2552567, 1, 1, 1, 1, 1,
-0.1485187, 0.01337045, -1.670197, 1, 1, 1, 1, 1,
-0.1483137, 1.179384, -1.582727, 1, 1, 1, 1, 1,
-0.146705, -0.6448884, -2.739729, 0, 0, 1, 1, 1,
-0.1450397, -2.059124, -2.264172, 1, 0, 0, 1, 1,
-0.1436715, 1.517121, 0.1617837, 1, 0, 0, 1, 1,
-0.1427898, -0.156243, -2.253137, 1, 0, 0, 1, 1,
-0.1416274, 0.01459922, -1.021862, 1, 0, 0, 1, 1,
-0.1407624, -0.6699533, -3.599784, 1, 0, 0, 1, 1,
-0.140578, -0.1762864, -2.202916, 0, 0, 0, 1, 1,
-0.1373793, -0.4192738, -1.112976, 0, 0, 0, 1, 1,
-0.1365013, 1.200937, 0.6255069, 0, 0, 0, 1, 1,
-0.1339631, -0.5110005, -2.852755, 0, 0, 0, 1, 1,
-0.1330418, -0.5988479, -1.749403, 0, 0, 0, 1, 1,
-0.1321049, 0.1281209, 0.2145304, 0, 0, 0, 1, 1,
-0.1218819, -2.444631, -3.666395, 0, 0, 0, 1, 1,
-0.1206216, -0.8493068, -3.026573, 1, 1, 1, 1, 1,
-0.1145927, -0.8079474, -1.817981, 1, 1, 1, 1, 1,
-0.1144634, -0.06740989, -0.8830557, 1, 1, 1, 1, 1,
-0.1100204, -1.977199, -4.445423, 1, 1, 1, 1, 1,
-0.1091745, -0.08968326, -2.078085, 1, 1, 1, 1, 1,
-0.1056731, -1.273687, -3.692801, 1, 1, 1, 1, 1,
-0.09389696, 1.631432, 0.5039787, 1, 1, 1, 1, 1,
-0.0938685, 0.513183, 2.111091, 1, 1, 1, 1, 1,
-0.09101121, -1.069353, -2.113641, 1, 1, 1, 1, 1,
-0.08804837, -0.2285808, -2.176986, 1, 1, 1, 1, 1,
-0.0877685, 0.5646855, 0.1366642, 1, 1, 1, 1, 1,
-0.08196793, 0.2711736, -0.215333, 1, 1, 1, 1, 1,
-0.0807075, -1.779166, -4.264333, 1, 1, 1, 1, 1,
-0.08008414, 1.50819, 0.0470199, 1, 1, 1, 1, 1,
-0.07746769, 0.6233574, 0.9581125, 1, 1, 1, 1, 1,
-0.07647628, 0.771243, -0.2344063, 0, 0, 1, 1, 1,
-0.07578599, -0.01392504, -2.734441, 1, 0, 0, 1, 1,
-0.07153562, 0.4873953, 0.2763239, 1, 0, 0, 1, 1,
-0.06920078, -1.462012, -2.909164, 1, 0, 0, 1, 1,
-0.06551059, 0.00322404, -0.4151455, 1, 0, 0, 1, 1,
-0.06533991, -0.8501924, -3.945276, 1, 0, 0, 1, 1,
-0.06172007, 0.4016919, -0.7538951, 0, 0, 0, 1, 1,
-0.06148773, 0.5782965, -0.9321918, 0, 0, 0, 1, 1,
-0.06026228, -1.269404, -2.508956, 0, 0, 0, 1, 1,
-0.05893942, 0.3966408, 0.462347, 0, 0, 0, 1, 1,
-0.05872273, 0.5277006, 1.031236, 0, 0, 0, 1, 1,
-0.05845113, 0.1792526, -0.872947, 0, 0, 0, 1, 1,
-0.05820289, -0.9616475, -2.835084, 0, 0, 0, 1, 1,
-0.05461454, 0.1415645, -0.8453434, 1, 1, 1, 1, 1,
-0.0534886, -0.01196677, -1.062752, 1, 1, 1, 1, 1,
-0.04876128, -0.6699154, -3.676511, 1, 1, 1, 1, 1,
-0.04602149, -1.08291, -2.637056, 1, 1, 1, 1, 1,
-0.04581881, -0.4806169, -2.177623, 1, 1, 1, 1, 1,
-0.04291946, 0.7957857, 1.866245, 1, 1, 1, 1, 1,
-0.04022582, -0.4368569, -4.064723, 1, 1, 1, 1, 1,
-0.04022049, -2.671353, -2.701891, 1, 1, 1, 1, 1,
-0.03775911, 0.1814601, 0.1203921, 1, 1, 1, 1, 1,
-0.0377499, 0.9536449, 0.6741257, 1, 1, 1, 1, 1,
-0.03537609, -0.2685156, -2.948414, 1, 1, 1, 1, 1,
-0.03191344, 0.02286043, -1.757673, 1, 1, 1, 1, 1,
-0.03125605, 0.5055971, -1.350453, 1, 1, 1, 1, 1,
-0.03032261, 0.2587419, -0.8127248, 1, 1, 1, 1, 1,
-0.02869966, 0.3846529, -0.6099961, 1, 1, 1, 1, 1,
-0.01984792, -0.2474847, -1.778441, 0, 0, 1, 1, 1,
-0.01897728, 0.4353826, -0.1506498, 1, 0, 0, 1, 1,
-0.01544381, 2.086926, 0.4067405, 1, 0, 0, 1, 1,
-0.01336258, 0.3115616, -0.3707598, 1, 0, 0, 1, 1,
-0.01270228, 0.7283677, 0.7078747, 1, 0, 0, 1, 1,
-0.01147899, -1.059646, -2.392942, 1, 0, 0, 1, 1,
-0.009062889, -2.016401, -4.108103, 0, 0, 0, 1, 1,
-0.002285151, -0.3820513, -3.286151, 0, 0, 0, 1, 1,
0.00116484, 1.528349, -0.1186003, 0, 0, 0, 1, 1,
0.002567985, 0.4287331, -1.744939, 0, 0, 0, 1, 1,
0.003184006, -1.454142, 1.82256, 0, 0, 0, 1, 1,
0.006555333, -0.9491102, 2.255985, 0, 0, 0, 1, 1,
0.006982845, 0.05971195, 1.420594, 0, 0, 0, 1, 1,
0.009395543, 1.59568, 0.1919592, 1, 1, 1, 1, 1,
0.01547515, -0.3472792, 2.499839, 1, 1, 1, 1, 1,
0.01899204, -0.5753269, 5.38841, 1, 1, 1, 1, 1,
0.03432553, -0.233967, 5.174733, 1, 1, 1, 1, 1,
0.03484744, 0.6766926, -0.8399646, 1, 1, 1, 1, 1,
0.03856809, 0.4784668, -0.2337952, 1, 1, 1, 1, 1,
0.04422436, 1.034602, 1.373293, 1, 1, 1, 1, 1,
0.0469853, 0.5543153, -2.061888, 1, 1, 1, 1, 1,
0.05014329, 0.3566225, 1.089964, 1, 1, 1, 1, 1,
0.05225841, 0.1240934, -0.3193274, 1, 1, 1, 1, 1,
0.05529071, -1.772381, 3.800883, 1, 1, 1, 1, 1,
0.05646991, -0.6980299, 3.73841, 1, 1, 1, 1, 1,
0.05892292, 0.1258659, -0.5227781, 1, 1, 1, 1, 1,
0.06094957, 1.866515, 0.7960876, 1, 1, 1, 1, 1,
0.06097902, 0.06649812, 1.154409, 1, 1, 1, 1, 1,
0.06177297, 0.0993384, 0.8134779, 0, 0, 1, 1, 1,
0.0712025, -1.56381, 2.597775, 1, 0, 0, 1, 1,
0.07635995, -0.000323812, 2.696869, 1, 0, 0, 1, 1,
0.0769951, 1.039154, 0.7595547, 1, 0, 0, 1, 1,
0.08301456, -2.191479, 5.346143, 1, 0, 0, 1, 1,
0.08611201, 0.1291395, -0.1172382, 1, 0, 0, 1, 1,
0.09032714, 0.3608651, 0.5182173, 0, 0, 0, 1, 1,
0.09161434, -0.5620368, 3.407147, 0, 0, 0, 1, 1,
0.09209929, 1.168456, 2.341373, 0, 0, 0, 1, 1,
0.09655003, -0.5203719, 0.8839838, 0, 0, 0, 1, 1,
0.1005196, 0.279635, 1.07742, 0, 0, 0, 1, 1,
0.1013378, 0.1434013, 0.9815363, 0, 0, 0, 1, 1,
0.101663, -1.499133, 3.991866, 0, 0, 0, 1, 1,
0.1028088, -0.4984564, 3.26602, 1, 1, 1, 1, 1,
0.103472, 0.2205308, 2.000747, 1, 1, 1, 1, 1,
0.1044909, 2.032438, 0.1243274, 1, 1, 1, 1, 1,
0.1058931, 1.009813, 0.01789542, 1, 1, 1, 1, 1,
0.106496, -0.3777141, 3.638678, 1, 1, 1, 1, 1,
0.1092129, -1.320659, 3.288, 1, 1, 1, 1, 1,
0.1116766, -1.708534, 3.773274, 1, 1, 1, 1, 1,
0.1144576, -1.105739, 3.179737, 1, 1, 1, 1, 1,
0.1208018, 0.007441194, 0.9685271, 1, 1, 1, 1, 1,
0.1226443, -0.4661274, 3.92057, 1, 1, 1, 1, 1,
0.1230388, -1.279104, 2.688864, 1, 1, 1, 1, 1,
0.1232765, -0.8405991, 5.144463, 1, 1, 1, 1, 1,
0.1252766, -0.504548, 2.254859, 1, 1, 1, 1, 1,
0.1267651, -0.4387106, 3.175135, 1, 1, 1, 1, 1,
0.1302726, 1.204844, 1.806948, 1, 1, 1, 1, 1,
0.1308378, 0.4260125, 1.760495, 0, 0, 1, 1, 1,
0.1358296, -1.881159, 2.942168, 1, 0, 0, 1, 1,
0.1362053, 0.7284891, 1.940593, 1, 0, 0, 1, 1,
0.1378364, -0.6221436, 2.389454, 1, 0, 0, 1, 1,
0.1403337, -0.05867933, 2.56931, 1, 0, 0, 1, 1,
0.1440393, -0.640698, 2.385551, 1, 0, 0, 1, 1,
0.1511705, -0.8600633, 3.379805, 0, 0, 0, 1, 1,
0.1535099, -0.052479, 1.248829, 0, 0, 0, 1, 1,
0.1540589, 0.6146696, -1.005597, 0, 0, 0, 1, 1,
0.1586633, 0.03734266, -0.1073761, 0, 0, 0, 1, 1,
0.1592125, 1.80546, -1.863048, 0, 0, 0, 1, 1,
0.1641691, 0.1932442, -1.07071, 0, 0, 0, 1, 1,
0.164974, -1.300587, 2.374998, 0, 0, 0, 1, 1,
0.1652643, -0.1428042, 2.14987, 1, 1, 1, 1, 1,
0.170062, 1.716334, 0.613966, 1, 1, 1, 1, 1,
0.1701289, -1.203881, 3.158535, 1, 1, 1, 1, 1,
0.1705462, 0.3170992, -0.1809839, 1, 1, 1, 1, 1,
0.1801348, 1.043942, -0.831524, 1, 1, 1, 1, 1,
0.1809102, -0.460702, 2.19353, 1, 1, 1, 1, 1,
0.1853475, 0.01638928, 0.7642435, 1, 1, 1, 1, 1,
0.1882394, 0.1581824, 2.315814, 1, 1, 1, 1, 1,
0.1882884, 0.7925581, 2.883868, 1, 1, 1, 1, 1,
0.1904936, 0.6502058, -0.5716453, 1, 1, 1, 1, 1,
0.1909368, 0.03610583, 0.3060596, 1, 1, 1, 1, 1,
0.1910421, -0.3578388, 1.6484, 1, 1, 1, 1, 1,
0.1919625, 1.158181, 1.729104, 1, 1, 1, 1, 1,
0.1933281, -0.3700901, 1.769336, 1, 1, 1, 1, 1,
0.1977239, 1.133146, 1.818992, 1, 1, 1, 1, 1,
0.1982903, 0.4907945, -0.04524445, 0, 0, 1, 1, 1,
0.1999007, 1.321836, -0.3666087, 1, 0, 0, 1, 1,
0.2047554, 0.07409488, 0.7228544, 1, 0, 0, 1, 1,
0.2073156, 1.086294, 0.735701, 1, 0, 0, 1, 1,
0.208499, 0.2565311, 0.9063386, 1, 0, 0, 1, 1,
0.2085858, -0.3749492, 2.916915, 1, 0, 0, 1, 1,
0.210283, 0.9634001, 0.4499227, 0, 0, 0, 1, 1,
0.2103007, -0.8472448, 3.209438, 0, 0, 0, 1, 1,
0.2108205, 1.091138, 1.159832, 0, 0, 0, 1, 1,
0.2123437, 0.2521063, 2.536623, 0, 0, 0, 1, 1,
0.214572, -0.3307647, 3.199023, 0, 0, 0, 1, 1,
0.2146992, 0.2811662, -0.6609142, 0, 0, 0, 1, 1,
0.2180559, 0.4532086, 0.279971, 0, 0, 0, 1, 1,
0.2181622, -2.122605, 1.930461, 1, 1, 1, 1, 1,
0.2184948, -0.237401, 1.261544, 1, 1, 1, 1, 1,
0.2245389, 0.477578, -1.173893, 1, 1, 1, 1, 1,
0.2260401, 1.292946, -0.07814503, 1, 1, 1, 1, 1,
0.2282252, -0.618108, 3.392199, 1, 1, 1, 1, 1,
0.2291223, 0.00626521, 2.499974, 1, 1, 1, 1, 1,
0.2364644, -2.555295, 1.545663, 1, 1, 1, 1, 1,
0.2377029, -1.280021, 4.373002, 1, 1, 1, 1, 1,
0.2384385, 0.7058802, 0.4245439, 1, 1, 1, 1, 1,
0.2386079, -0.1174795, 1.1441, 1, 1, 1, 1, 1,
0.240922, -0.1719782, 2.051937, 1, 1, 1, 1, 1,
0.2416805, -2.068497, 3.841562, 1, 1, 1, 1, 1,
0.2465701, -0.9513137, 2.10337, 1, 1, 1, 1, 1,
0.2470756, 0.03957709, 1.110977, 1, 1, 1, 1, 1,
0.2503754, 0.06027295, 0.3899486, 1, 1, 1, 1, 1,
0.2508894, 0.5969399, 1.03727, 0, 0, 1, 1, 1,
0.2540746, -0.5390262, 4.012649, 1, 0, 0, 1, 1,
0.2551072, 0.1025884, 0.5271406, 1, 0, 0, 1, 1,
0.2582221, 1.113254, 0.1462322, 1, 0, 0, 1, 1,
0.2582708, -0.5638931, 2.372727, 1, 0, 0, 1, 1,
0.2614669, 0.2832801, 1.680272, 1, 0, 0, 1, 1,
0.2632717, -2.301999, 3.458616, 0, 0, 0, 1, 1,
0.2708242, -0.866281, 2.498759, 0, 0, 0, 1, 1,
0.2723382, -0.3262183, 2.960668, 0, 0, 0, 1, 1,
0.2752714, -0.9534091, 1.891099, 0, 0, 0, 1, 1,
0.2759523, -0.1316033, 1.701432, 0, 0, 0, 1, 1,
0.2770224, 0.2133636, 1.975196, 0, 0, 0, 1, 1,
0.2771887, -0.1319697, 2.300995, 0, 0, 0, 1, 1,
0.2811572, 1.749684, -0.1791242, 1, 1, 1, 1, 1,
0.2816844, -0.2715994, 3.924202, 1, 1, 1, 1, 1,
0.2831037, 0.2385669, 0.5752153, 1, 1, 1, 1, 1,
0.2847617, -0.2261557, 1.298761, 1, 1, 1, 1, 1,
0.2883834, 1.476241, 0.1053994, 1, 1, 1, 1, 1,
0.2909739, 0.1757295, 0.3421442, 1, 1, 1, 1, 1,
0.2950532, -1.260499, 3.457849, 1, 1, 1, 1, 1,
0.2963622, 0.9362082, -0.02707977, 1, 1, 1, 1, 1,
0.3038014, 0.2515886, 2.473904, 1, 1, 1, 1, 1,
0.308783, 0.4742155, 0.5515538, 1, 1, 1, 1, 1,
0.308851, 0.4227245, 0.3815008, 1, 1, 1, 1, 1,
0.3106052, -1.070338, 2.319862, 1, 1, 1, 1, 1,
0.3107899, -1.66148, 1.478768, 1, 1, 1, 1, 1,
0.3114083, 0.1997276, 1.250595, 1, 1, 1, 1, 1,
0.3143466, -0.217426, 3.5252, 1, 1, 1, 1, 1,
0.3193887, -0.3775328, 1.166688, 0, 0, 1, 1, 1,
0.3194115, 1.537611, -0.4195443, 1, 0, 0, 1, 1,
0.3303718, -0.3982681, 3.400869, 1, 0, 0, 1, 1,
0.3311087, -2.324966, 2.668265, 1, 0, 0, 1, 1,
0.3315497, 0.4875093, 1.780796, 1, 0, 0, 1, 1,
0.3345963, -0.2463345, 3.101369, 1, 0, 0, 1, 1,
0.3353726, 1.167369, 2.371502, 0, 0, 0, 1, 1,
0.3362054, 0.4234799, -0.7579156, 0, 0, 0, 1, 1,
0.3390444, 0.8671784, 2.142463, 0, 0, 0, 1, 1,
0.339722, 0.03303991, 0.8452987, 0, 0, 0, 1, 1,
0.3430437, -0.3479837, 1.764434, 0, 0, 0, 1, 1,
0.3456296, 0.09887729, 2.009356, 0, 0, 0, 1, 1,
0.3529032, 0.4468822, 2.640009, 0, 0, 0, 1, 1,
0.3558182, 0.2931201, -0.9559861, 1, 1, 1, 1, 1,
0.356639, 0.5584254, -0.8962738, 1, 1, 1, 1, 1,
0.3577819, -0.07555302, 2.19733, 1, 1, 1, 1, 1,
0.3593974, 0.4299374, 1.774286, 1, 1, 1, 1, 1,
0.3623244, 0.6033115, 0.801835, 1, 1, 1, 1, 1,
0.3626342, 0.863026, -2.133852, 1, 1, 1, 1, 1,
0.3715357, 2.647567, 0.9449308, 1, 1, 1, 1, 1,
0.3717745, -0.6416611, 1.358657, 1, 1, 1, 1, 1,
0.373264, 1.917318, -0.4036656, 1, 1, 1, 1, 1,
0.3736466, 0.323673, 0.5538396, 1, 1, 1, 1, 1,
0.3771722, 0.6933811, 1.547506, 1, 1, 1, 1, 1,
0.3784717, 0.4777966, 0.6273565, 1, 1, 1, 1, 1,
0.3806228, -0.2627789, 3.386169, 1, 1, 1, 1, 1,
0.3842126, -0.6067522, 3.74084, 1, 1, 1, 1, 1,
0.3853191, 1.193372, 0.8857062, 1, 1, 1, 1, 1,
0.3894562, -0.3975161, 2.868096, 0, 0, 1, 1, 1,
0.3933047, 0.9801177, -0.114853, 1, 0, 0, 1, 1,
0.3945169, 0.9560564, 1.998283, 1, 0, 0, 1, 1,
0.3974104, -0.5473122, 2.236847, 1, 0, 0, 1, 1,
0.3992253, -0.4842197, 3.171973, 1, 0, 0, 1, 1,
0.4029891, -1.273681, 4.973979, 1, 0, 0, 1, 1,
0.4032947, -0.3831021, 2.064017, 0, 0, 0, 1, 1,
0.4034315, -2.296162, 3.668514, 0, 0, 0, 1, 1,
0.4054897, -2.137895, 4.429268, 0, 0, 0, 1, 1,
0.4055164, 0.4261222, -0.7611447, 0, 0, 0, 1, 1,
0.4068805, -0.6359404, 1.453145, 0, 0, 0, 1, 1,
0.4095697, 1.085141, -0.7063824, 0, 0, 0, 1, 1,
0.4102914, 1.089956, 0.1968867, 0, 0, 0, 1, 1,
0.4103616, 0.2364886, 3.023293, 1, 1, 1, 1, 1,
0.4148526, -0.7747831, 3.413982, 1, 1, 1, 1, 1,
0.4162619, -1.655905, 2.792244, 1, 1, 1, 1, 1,
0.4175994, -1.491617, 2.251459, 1, 1, 1, 1, 1,
0.4199451, -0.6114763, 2.984313, 1, 1, 1, 1, 1,
0.4200166, -1.444657, 3.208624, 1, 1, 1, 1, 1,
0.4233129, 1.168224, 1.076567, 1, 1, 1, 1, 1,
0.4281746, -1.61121, 2.431963, 1, 1, 1, 1, 1,
0.4303441, -1.219485, 2.696605, 1, 1, 1, 1, 1,
0.4329001, -0.2082957, 1.595207, 1, 1, 1, 1, 1,
0.4348729, -0.3069637, 3.462159, 1, 1, 1, 1, 1,
0.4366699, -1.392103, 3.538494, 1, 1, 1, 1, 1,
0.4372754, -0.8741488, 3.571152, 1, 1, 1, 1, 1,
0.437476, 3.000853, 0.3678897, 1, 1, 1, 1, 1,
0.4376172, 0.8179691, 1.179802, 1, 1, 1, 1, 1,
0.4389631, -2.28411, 2.110597, 0, 0, 1, 1, 1,
0.4390503, 0.5007685, 0.8369283, 1, 0, 0, 1, 1,
0.4403846, 0.4016033, -0.3250124, 1, 0, 0, 1, 1,
0.4436405, -2.108394, 2.362121, 1, 0, 0, 1, 1,
0.4477402, -0.8909701, 1.965392, 1, 0, 0, 1, 1,
0.4487529, -0.185206, 1.735847, 1, 0, 0, 1, 1,
0.4518303, -0.09152617, 1.45695, 0, 0, 0, 1, 1,
0.452839, 0.8723443, -0.3452764, 0, 0, 0, 1, 1,
0.4529788, -0.4776393, 1.91415, 0, 0, 0, 1, 1,
0.4533333, -0.09678089, 1.097037, 0, 0, 0, 1, 1,
0.4579452, 0.1431597, 1.471841, 0, 0, 0, 1, 1,
0.4630351, -0.8335998, 2.94614, 0, 0, 0, 1, 1,
0.4639284, 0.822144, -0.6509737, 0, 0, 0, 1, 1,
0.4646013, 0.3911328, 1.444124, 1, 1, 1, 1, 1,
0.4722994, 0.7402096, 0.6052793, 1, 1, 1, 1, 1,
0.4841271, -0.5866964, 3.633873, 1, 1, 1, 1, 1,
0.4843295, 0.2904832, 0.9430936, 1, 1, 1, 1, 1,
0.4862085, -0.2338882, 1.264991, 1, 1, 1, 1, 1,
0.4899746, 0.5123708, 1.535623, 1, 1, 1, 1, 1,
0.4920095, 0.6746681, 1.503831, 1, 1, 1, 1, 1,
0.4942711, 1.680632, -2.166943, 1, 1, 1, 1, 1,
0.4949702, 1.015908, -0.530656, 1, 1, 1, 1, 1,
0.5040027, -0.2833534, 1.625578, 1, 1, 1, 1, 1,
0.5073416, 1.166585, 0.1886045, 1, 1, 1, 1, 1,
0.5203671, -2.495236, 2.795174, 1, 1, 1, 1, 1,
0.5204396, -0.5051706, 2.527533, 1, 1, 1, 1, 1,
0.5289901, -0.3223948, 2.62803, 1, 1, 1, 1, 1,
0.5332577, 0.1677817, 3.690338, 1, 1, 1, 1, 1,
0.5367458, -1.016572, 3.461335, 0, 0, 1, 1, 1,
0.5370132, 0.8877804, 2.29952, 1, 0, 0, 1, 1,
0.5385868, -0.1634495, 1.943902, 1, 0, 0, 1, 1,
0.5463925, -1.732076, 3.646411, 1, 0, 0, 1, 1,
0.5482574, -0.9284353, -0.9983273, 1, 0, 0, 1, 1,
0.5490547, 0.7608951, 1.110929, 1, 0, 0, 1, 1,
0.5619368, 0.6371556, -0.3122802, 0, 0, 0, 1, 1,
0.5620562, -0.9718668, 1.644373, 0, 0, 0, 1, 1,
0.5655511, -0.8195643, 3.318995, 0, 0, 0, 1, 1,
0.5702176, 0.2179525, 0.4358462, 0, 0, 0, 1, 1,
0.5739262, -0.7481904, 2.584673, 0, 0, 0, 1, 1,
0.5774661, -0.3215229, 2.335999, 0, 0, 0, 1, 1,
0.5779069, 1.618341, 0.6700143, 0, 0, 0, 1, 1,
0.5813752, -0.3225771, 2.432707, 1, 1, 1, 1, 1,
0.5815066, 0.6341789, -0.3366576, 1, 1, 1, 1, 1,
0.5817039, -1.696101, 2.649131, 1, 1, 1, 1, 1,
0.5843306, 0.5134145, 0.2390364, 1, 1, 1, 1, 1,
0.5871455, 0.0005258772, 1.603177, 1, 1, 1, 1, 1,
0.5880845, 0.8942475, 0.8440261, 1, 1, 1, 1, 1,
0.5882541, -1.883721, 2.487787, 1, 1, 1, 1, 1,
0.5900844, -0.3634657, 2.063082, 1, 1, 1, 1, 1,
0.5926875, -0.2975377, 2.847384, 1, 1, 1, 1, 1,
0.596235, 1.57768, 1.7124, 1, 1, 1, 1, 1,
0.5964727, -0.8802355, 3.045767, 1, 1, 1, 1, 1,
0.6010774, 0.9048687, 1.214327, 1, 1, 1, 1, 1,
0.6033374, 0.6857551, 1.133043, 1, 1, 1, 1, 1,
0.6052899, -0.1210381, 0.7797135, 1, 1, 1, 1, 1,
0.6074392, -0.9129544, 2.587261, 1, 1, 1, 1, 1,
0.6088341, -2.22044, 2.10991, 0, 0, 1, 1, 1,
0.6096123, 3.320227, 0.3260414, 1, 0, 0, 1, 1,
0.6097957, -0.3090222, 0.9395555, 1, 0, 0, 1, 1,
0.614301, -0.7780579, 2.143653, 1, 0, 0, 1, 1,
0.6165832, 1.790291, 0.4190293, 1, 0, 0, 1, 1,
0.6167387, 0.3206413, 0.7359191, 1, 0, 0, 1, 1,
0.6198509, 0.6474329, 0.3748502, 0, 0, 0, 1, 1,
0.62061, -0.216328, 2.050663, 0, 0, 0, 1, 1,
0.6222339, 0.6325667, -0.09867236, 0, 0, 0, 1, 1,
0.6225756, -0.1701958, 2.397115, 0, 0, 0, 1, 1,
0.6244833, 1.547966, 1.317101, 0, 0, 0, 1, 1,
0.6252164, -0.4134496, 0.8182545, 0, 0, 0, 1, 1,
0.6338547, 0.4854813, -0.2816405, 0, 0, 0, 1, 1,
0.6363026, -0.578753, 3.227518, 1, 1, 1, 1, 1,
0.6460007, -0.6696493, 1.327009, 1, 1, 1, 1, 1,
0.6471558, -0.7886721, 2.075412, 1, 1, 1, 1, 1,
0.6473504, -0.3958494, 3.008262, 1, 1, 1, 1, 1,
0.6500176, 0.2441898, 0.8355291, 1, 1, 1, 1, 1,
0.6555788, -0.7915453, 3.316621, 1, 1, 1, 1, 1,
0.6584938, -0.3702263, 1.683683, 1, 1, 1, 1, 1,
0.6592072, 1.50157, 0.0262826, 1, 1, 1, 1, 1,
0.6635485, -0.324646, 3.883601, 1, 1, 1, 1, 1,
0.6663544, -0.7168357, 2.264199, 1, 1, 1, 1, 1,
0.6701618, 0.3840511, 0.3670015, 1, 1, 1, 1, 1,
0.6712221, 0.7622361, 2.34314, 1, 1, 1, 1, 1,
0.6728047, -0.1450173, 2.165896, 1, 1, 1, 1, 1,
0.6731043, 2.405952, 0.5553707, 1, 1, 1, 1, 1,
0.6744902, -0.2062016, 1.569916, 1, 1, 1, 1, 1,
0.6843202, -1.230138, 0.461291, 0, 0, 1, 1, 1,
0.6845692, 1.170972, 0.6755046, 1, 0, 0, 1, 1,
0.6871947, 0.6107884, -0.3676001, 1, 0, 0, 1, 1,
0.6911119, -0.8041036, 3.823189, 1, 0, 0, 1, 1,
0.7015575, -0.3350969, 2.733216, 1, 0, 0, 1, 1,
0.7016124, -1.882117, 2.679842, 1, 0, 0, 1, 1,
0.7028124, -1.649612, 3.195403, 0, 0, 0, 1, 1,
0.7028692, -0.2097086, 1.150904, 0, 0, 0, 1, 1,
0.7051634, -2.346198, 2.936159, 0, 0, 0, 1, 1,
0.7081811, -0.6784301, 2.65288, 0, 0, 0, 1, 1,
0.7086081, -1.023624, 3.923079, 0, 0, 0, 1, 1,
0.7101804, 0.3539054, 0.7142517, 0, 0, 0, 1, 1,
0.7124589, -1.237151, 3.917027, 0, 0, 0, 1, 1,
0.7171945, -0.07456002, 3.124688, 1, 1, 1, 1, 1,
0.7191304, -0.2041383, -0.6376123, 1, 1, 1, 1, 1,
0.7207179, -1.320801, 5.883106, 1, 1, 1, 1, 1,
0.7266439, -1.976856, 2.203748, 1, 1, 1, 1, 1,
0.7276135, -0.2952434, 1.163816, 1, 1, 1, 1, 1,
0.7315081, -0.3026988, 2.210725, 1, 1, 1, 1, 1,
0.7396118, -0.5901457, 3.086793, 1, 1, 1, 1, 1,
0.7415002, -0.6146602, 3.2773, 1, 1, 1, 1, 1,
0.7437107, -0.4798872, 1.944536, 1, 1, 1, 1, 1,
0.7437891, 0.5184806, 1.320698, 1, 1, 1, 1, 1,
0.7465409, 2.278109, 0.2595153, 1, 1, 1, 1, 1,
0.751255, -0.8867286, 3.506117, 1, 1, 1, 1, 1,
0.756779, -0.4897564, 2.434932, 1, 1, 1, 1, 1,
0.7620488, 0.7290905, 1.353672, 1, 1, 1, 1, 1,
0.769702, -0.8859686, 0.4115772, 1, 1, 1, 1, 1,
0.7725399, 1.855484, -1.112243, 0, 0, 1, 1, 1,
0.7730197, -0.7666295, 3.053726, 1, 0, 0, 1, 1,
0.7745969, 0.3462748, -0.2413003, 1, 0, 0, 1, 1,
0.7761469, 0.8361516, 0.4547158, 1, 0, 0, 1, 1,
0.7768586, -0.4343271, 1.289929, 1, 0, 0, 1, 1,
0.7774724, 0.2628156, 1.603482, 1, 0, 0, 1, 1,
0.7825015, 1.097831, 0.6571068, 0, 0, 0, 1, 1,
0.7829909, 1.045606, 1.31045, 0, 0, 0, 1, 1,
0.7837055, 0.7285156, 2.406505, 0, 0, 0, 1, 1,
0.788262, 0.09637681, 2.754, 0, 0, 0, 1, 1,
0.7931891, 0.8115298, 2.405349, 0, 0, 0, 1, 1,
0.7938761, 1.446673, -0.5035474, 0, 0, 0, 1, 1,
0.8002769, 0.5031683, 1.764161, 0, 0, 0, 1, 1,
0.8011829, 2.034415, 0.197749, 1, 1, 1, 1, 1,
0.8024332, -0.6208555, 1.408014, 1, 1, 1, 1, 1,
0.8041439, -2.1316, 2.999436, 1, 1, 1, 1, 1,
0.8163882, -1.306738, 3.248399, 1, 1, 1, 1, 1,
0.8163915, 0.5530227, 2.095774, 1, 1, 1, 1, 1,
0.8205122, 0.3114586, 0.6689186, 1, 1, 1, 1, 1,
0.822688, -0.5987943, 1.563674, 1, 1, 1, 1, 1,
0.8232878, 1.085057, -0.0259502, 1, 1, 1, 1, 1,
0.826076, -0.2804379, 2.010531, 1, 1, 1, 1, 1,
0.8379695, -0.7700922, 2.510226, 1, 1, 1, 1, 1,
0.8406907, 0.5106141, 1.962589, 1, 1, 1, 1, 1,
0.8411185, 0.9221511, 0.248567, 1, 1, 1, 1, 1,
0.8411777, -0.8985581, 1.835525, 1, 1, 1, 1, 1,
0.8412069, -0.142887, 1.779961, 1, 1, 1, 1, 1,
0.8459285, 0.8472633, 0.3230614, 1, 1, 1, 1, 1,
0.8507336, 3.082106, 1.387058, 0, 0, 1, 1, 1,
0.8519942, -0.5981482, 2.041751, 1, 0, 0, 1, 1,
0.8569769, -0.8907027, 1.308861, 1, 0, 0, 1, 1,
0.8630816, 0.2336292, 0.6460643, 1, 0, 0, 1, 1,
0.8658532, 2.263913, -0.22005, 1, 0, 0, 1, 1,
0.8671455, -0.4677828, 0.3508124, 1, 0, 0, 1, 1,
0.8681406, -0.5262883, 1.713012, 0, 0, 0, 1, 1,
0.8683285, 0.5533718, 1.780694, 0, 0, 0, 1, 1,
0.8699703, -2.510596, 3.334868, 0, 0, 0, 1, 1,
0.8740993, 0.4194799, 1.746886, 0, 0, 0, 1, 1,
0.8781734, 0.1841812, 1.354925, 0, 0, 0, 1, 1,
0.8785678, -0.272621, 2.411744, 0, 0, 0, 1, 1,
0.8795581, 0.1238507, 1.082141, 0, 0, 0, 1, 1,
0.9059529, -1.338239, 0.7431329, 1, 1, 1, 1, 1,
0.9121122, 0.4904408, -1.106149, 1, 1, 1, 1, 1,
0.9122925, 1.29105, -1.002132, 1, 1, 1, 1, 1,
0.9144781, -0.2682878, 0.8381304, 1, 1, 1, 1, 1,
0.9164088, 0.7174164, 1.693374, 1, 1, 1, 1, 1,
0.9208818, -1.022362, 2.680935, 1, 1, 1, 1, 1,
0.9311749, 0.4919521, 0.5293378, 1, 1, 1, 1, 1,
0.9363517, 0.7237965, 0.175692, 1, 1, 1, 1, 1,
0.9382384, 0.4820252, -0.489424, 1, 1, 1, 1, 1,
0.9408367, -0.620747, 2.560665, 1, 1, 1, 1, 1,
0.9445042, 0.7587845, 0.9639531, 1, 1, 1, 1, 1,
0.9471016, 0.8322055, 1.581301, 1, 1, 1, 1, 1,
0.9557905, 1.356678, -0.1891803, 1, 1, 1, 1, 1,
0.9568096, -1.18067, 4.546237, 1, 1, 1, 1, 1,
0.9591222, 1.685064, -0.2308506, 1, 1, 1, 1, 1,
0.9594707, 0.4175088, 1.583778, 0, 0, 1, 1, 1,
0.9619967, -1.07356, 0.6548572, 1, 0, 0, 1, 1,
0.9735258, 1.771018, 0.3357035, 1, 0, 0, 1, 1,
0.9759745, 0.2087106, -1.274166, 1, 0, 0, 1, 1,
0.9760534, 2.495603, 0.9171175, 1, 0, 0, 1, 1,
0.9776508, -2.077807, 4.383574, 1, 0, 0, 1, 1,
0.9786003, -1.370072, 2.251239, 0, 0, 0, 1, 1,
0.9950549, 0.8984935, 0.1379875, 0, 0, 0, 1, 1,
0.9982181, 2.104351, 1.605992, 0, 0, 0, 1, 1,
1.002128, 0.9380187, 1.56604, 0, 0, 0, 1, 1,
1.00271, 0.8617995, 2.385504, 0, 0, 0, 1, 1,
1.002867, -0.2246452, 1.604742, 0, 0, 0, 1, 1,
1.012851, -0.6723677, 4.07055, 0, 0, 0, 1, 1,
1.014151, -1.387591, 1.994479, 1, 1, 1, 1, 1,
1.014549, -0.308505, 1.874021, 1, 1, 1, 1, 1,
1.017492, 0.1633439, 2.006163, 1, 1, 1, 1, 1,
1.021124, 0.5791769, -0.7552806, 1, 1, 1, 1, 1,
1.024866, -0.2910304, 2.436384, 1, 1, 1, 1, 1,
1.026001, 0.01057213, -0.1060163, 1, 1, 1, 1, 1,
1.031533, -0.412796, 2.378572, 1, 1, 1, 1, 1,
1.050302, -0.06022059, 2.641508, 1, 1, 1, 1, 1,
1.050705, 0.3232502, 1.214231, 1, 1, 1, 1, 1,
1.052011, -0.4728666, 0.01978052, 1, 1, 1, 1, 1,
1.05912, 0.2579909, 1.958709, 1, 1, 1, 1, 1,
1.062083, 0.2627178, 1.816723, 1, 1, 1, 1, 1,
1.063012, 2.13681, 3.013218, 1, 1, 1, 1, 1,
1.071946, 0.9419356, 0.4531087, 1, 1, 1, 1, 1,
1.076212, 1.176338, 0.8226194, 1, 1, 1, 1, 1,
1.079194, 0.65301, 1.05326, 0, 0, 1, 1, 1,
1.081203, 0.1551965, 2.635365, 1, 0, 0, 1, 1,
1.081423, -0.003068486, 0.8170114, 1, 0, 0, 1, 1,
1.082822, -1.660508, 3.618147, 1, 0, 0, 1, 1,
1.085414, -0.4441159, 3.74886, 1, 0, 0, 1, 1,
1.102181, 0.008142184, 2.813186, 1, 0, 0, 1, 1,
1.122352, -0.6790674, 1.361368, 0, 0, 0, 1, 1,
1.12519, -0.8720563, 2.904003, 0, 0, 0, 1, 1,
1.127722, -1.410486, 2.407417, 0, 0, 0, 1, 1,
1.132564, -0.3287768, 0.4545064, 0, 0, 0, 1, 1,
1.141184, 0.01312334, 1.46107, 0, 0, 0, 1, 1,
1.147809, 0.2779022, 0.4813119, 0, 0, 0, 1, 1,
1.165139, 0.5020544, 1.102584, 0, 0, 0, 1, 1,
1.165806, -0.8384865, 2.536688, 1, 1, 1, 1, 1,
1.171264, 0.7806051, 0.8786609, 1, 1, 1, 1, 1,
1.175505, -1.940898, 2.182029, 1, 1, 1, 1, 1,
1.183275, 0.1264322, 1.15492, 1, 1, 1, 1, 1,
1.187603, 1.872435, 2.119293, 1, 1, 1, 1, 1,
1.189019, -0.2172162, 2.678897, 1, 1, 1, 1, 1,
1.19693, -0.1687758, 2.582127, 1, 1, 1, 1, 1,
1.201279, 0.3090047, 2.894791, 1, 1, 1, 1, 1,
1.201832, 1.219466, 2.10111, 1, 1, 1, 1, 1,
1.205941, 1.92917, -0.0784085, 1, 1, 1, 1, 1,
1.210506, 0.4623332, 0.5251998, 1, 1, 1, 1, 1,
1.210678, 0.1072329, 0.231785, 1, 1, 1, 1, 1,
1.211957, -0.7373874, 2.262693, 1, 1, 1, 1, 1,
1.21257, 1.022693, 0.4043331, 1, 1, 1, 1, 1,
1.217622, 1.09101, 1.392876, 1, 1, 1, 1, 1,
1.218521, -0.4758884, 3.323656, 0, 0, 1, 1, 1,
1.224346, 2.087172, 0.3056036, 1, 0, 0, 1, 1,
1.247, -0.7856107, 3.781442, 1, 0, 0, 1, 1,
1.247949, 1.236533, 2.971539, 1, 0, 0, 1, 1,
1.252114, 1.143867, 2.008965, 1, 0, 0, 1, 1,
1.256487, -0.2933524, 3.054998, 1, 0, 0, 1, 1,
1.264713, 0.3400306, -0.400047, 0, 0, 0, 1, 1,
1.269779, -0.1131678, 0.58408, 0, 0, 0, 1, 1,
1.272841, 1.562128, 0.4780249, 0, 0, 0, 1, 1,
1.276279, 0.6507488, 1.153536, 0, 0, 0, 1, 1,
1.27975, -2.097485, 1.844595, 0, 0, 0, 1, 1,
1.281016, 1.110404, 0.763621, 0, 0, 0, 1, 1,
1.283627, 1.250394, 0.5716978, 0, 0, 0, 1, 1,
1.293203, 0.5018312, -0.1868426, 1, 1, 1, 1, 1,
1.294692, 0.4498411, 1.17827, 1, 1, 1, 1, 1,
1.296622, 0.1057223, 0.5867243, 1, 1, 1, 1, 1,
1.314791, -0.2912499, 1.601413, 1, 1, 1, 1, 1,
1.318999, -0.5304755, 1.98064, 1, 1, 1, 1, 1,
1.337226, -0.3632807, 0.6482356, 1, 1, 1, 1, 1,
1.347255, 0.7336408, 0.5015622, 1, 1, 1, 1, 1,
1.353496, 1.173777, 1.195171, 1, 1, 1, 1, 1,
1.360994, -0.6897647, 3.421075, 1, 1, 1, 1, 1,
1.363553, 1.529085, 0.923815, 1, 1, 1, 1, 1,
1.392464, -1.565163, 1.149184, 1, 1, 1, 1, 1,
1.426332, 0.3289345, 1.007168, 1, 1, 1, 1, 1,
1.434004, -0.5482814, 0.4499231, 1, 1, 1, 1, 1,
1.435204, -0.4226283, 2.324806, 1, 1, 1, 1, 1,
1.437957, 0.867128, -0.07502757, 1, 1, 1, 1, 1,
1.439011, -0.3959416, 3.193451, 0, 0, 1, 1, 1,
1.443639, 0.9014983, -0.09657972, 1, 0, 0, 1, 1,
1.459063, 0.2576734, 2.287267, 1, 0, 0, 1, 1,
1.461432, 1.411863, 1.019476, 1, 0, 0, 1, 1,
1.463107, -0.8065849, 1.197228, 1, 0, 0, 1, 1,
1.463355, -0.8776628, 0.1166791, 1, 0, 0, 1, 1,
1.46547, -1.624421, 3.625161, 0, 0, 0, 1, 1,
1.482466, -0.1317505, 1.035713, 0, 0, 0, 1, 1,
1.484909, 0.4669148, 2.740833, 0, 0, 0, 1, 1,
1.488414, -0.9278796, 3.088306, 0, 0, 0, 1, 1,
1.492034, -1.251209, 3.49568, 0, 0, 0, 1, 1,
1.492239, -1.110731, 2.973466, 0, 0, 0, 1, 1,
1.495212, 0.05381877, 1.071173, 0, 0, 0, 1, 1,
1.510244, 0.5339329, 1.096548, 1, 1, 1, 1, 1,
1.513561, 1.039387, 0.1903681, 1, 1, 1, 1, 1,
1.527785, -0.1617779, 4.134105, 1, 1, 1, 1, 1,
1.533839, -0.2866723, 1.474734, 1, 1, 1, 1, 1,
1.540965, -0.7843871, 2.263994, 1, 1, 1, 1, 1,
1.546813, 1.093357, 0.2445589, 1, 1, 1, 1, 1,
1.551633, 2.83853, 2.091861, 1, 1, 1, 1, 1,
1.551888, 1.419276, 0.3497369, 1, 1, 1, 1, 1,
1.56306, 0.8743597, 0.3605027, 1, 1, 1, 1, 1,
1.571728, 1.429615, 0.3022417, 1, 1, 1, 1, 1,
1.5719, -0.2070272, 3.168344, 1, 1, 1, 1, 1,
1.573288, -0.3040483, 0.3484709, 1, 1, 1, 1, 1,
1.574769, -0.959164, 0.2025378, 1, 1, 1, 1, 1,
1.591413, 0.75524, 1.155922, 1, 1, 1, 1, 1,
1.592148, 2.045263, 1.432457, 1, 1, 1, 1, 1,
1.598933, 0.9695373, 0.4985289, 0, 0, 1, 1, 1,
1.60205, 1.166676, 0.6225207, 1, 0, 0, 1, 1,
1.612038, -0.9347336, 2.176241, 1, 0, 0, 1, 1,
1.616706, -0.9442131, 2.6575, 1, 0, 0, 1, 1,
1.616709, -0.9202693, 2.145772, 1, 0, 0, 1, 1,
1.639632, 1.453191, 1.287094, 1, 0, 0, 1, 1,
1.643399, -1.420314, 2.935711, 0, 0, 0, 1, 1,
1.643461, 2.201658, 0.6947823, 0, 0, 0, 1, 1,
1.678595, -0.5744894, 2.183779, 0, 0, 0, 1, 1,
1.693885, 0.2121905, 0.3114738, 0, 0, 0, 1, 1,
1.696203, -1.281982, 3.299619, 0, 0, 0, 1, 1,
1.706932, 0.3517824, 1.245971, 0, 0, 0, 1, 1,
1.728162, -0.4933245, 0.06513646, 0, 0, 0, 1, 1,
1.73203, -0.1426096, 2.697069, 1, 1, 1, 1, 1,
1.739143, -0.2950913, 1.826816, 1, 1, 1, 1, 1,
1.764376, 0.9485549, 1.13157, 1, 1, 1, 1, 1,
1.764543, -1.316213, 2.686355, 1, 1, 1, 1, 1,
1.768547, -0.6970327, 0.8761784, 1, 1, 1, 1, 1,
1.778057, -1.403302, 0.8905249, 1, 1, 1, 1, 1,
1.780481, -0.5300931, 0.9956927, 1, 1, 1, 1, 1,
1.876419, -2.105652, 1.753432, 1, 1, 1, 1, 1,
1.893441, 0.07501888, 1.494395, 1, 1, 1, 1, 1,
1.909707, -1.177256, 1.079137, 1, 1, 1, 1, 1,
1.910832, -1.818914, 3.072792, 1, 1, 1, 1, 1,
1.914921, 0.3798246, 2.052652, 1, 1, 1, 1, 1,
1.931232, 1.190086, 1.811458, 1, 1, 1, 1, 1,
1.96166, 0.4852152, 1.819371, 1, 1, 1, 1, 1,
1.965144, -0.9210103, 2.853675, 1, 1, 1, 1, 1,
1.96535, 0.2596967, 2.570814, 0, 0, 1, 1, 1,
1.970942, -0.8406296, 0.9988841, 1, 0, 0, 1, 1,
1.972918, -0.3185316, 1.303696, 1, 0, 0, 1, 1,
1.999303, 1.646817, 1.399804, 1, 0, 0, 1, 1,
2.022131, -0.4329221, 1.378159, 1, 0, 0, 1, 1,
2.040935, -0.4048414, 2.063845, 1, 0, 0, 1, 1,
2.060693, -1.831157, 2.15349, 0, 0, 0, 1, 1,
2.077155, 0.4887996, 0.5172652, 0, 0, 0, 1, 1,
2.124052, -0.5069898, 3.868953, 0, 0, 0, 1, 1,
2.135369, 0.3522115, 2.688451, 0, 0, 0, 1, 1,
2.150424, 0.2259894, 0.4743648, 0, 0, 0, 1, 1,
2.153109, 0.4242446, 2.912266, 0, 0, 0, 1, 1,
2.181194, -0.3648632, 1.276943, 0, 0, 0, 1, 1,
2.192433, 0.2229279, 1.575641, 1, 1, 1, 1, 1,
2.275416, 1.431138, 2.161071, 1, 1, 1, 1, 1,
2.312025, 0.4278056, 0.3157324, 1, 1, 1, 1, 1,
2.460881, 0.4675118, 0.4139488, 1, 1, 1, 1, 1,
2.608738, 2.246881, -0.07855523, 1, 1, 1, 1, 1,
2.668333, 0.2989424, 1.431103, 1, 1, 1, 1, 1,
2.730562, 1.494183, -0.4063161, 1, 1, 1, 1, 1
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
var radius = 9.801487;
var distance = 34.42731;
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
mvMatrix.translate( 0.7189865, -0.180487, -0.3669679 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.42731);
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
