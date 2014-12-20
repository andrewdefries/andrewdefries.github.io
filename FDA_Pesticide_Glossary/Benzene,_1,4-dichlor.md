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
-3.48085, 0.4516885, -1.723364, 1, 0, 0, 1,
-2.81234, -0.08143426, -2.092207, 1, 0.007843138, 0, 1,
-2.653625, 1.296835, -1.47262, 1, 0.01176471, 0, 1,
-2.463955, 0.1322893, -2.547945, 1, 0.01960784, 0, 1,
-2.418082, -0.5994282, 0.5495512, 1, 0.02352941, 0, 1,
-2.341264, -0.1663931, -0.9780818, 1, 0.03137255, 0, 1,
-2.311503, -0.6237357, -3.822695, 1, 0.03529412, 0, 1,
-2.304906, -0.3560472, -2.963706, 1, 0.04313726, 0, 1,
-2.289236, 0.4339811, -0.8288531, 1, 0.04705882, 0, 1,
-2.255931, 0.4390716, -2.515116, 1, 0.05490196, 0, 1,
-2.198703, 0.9559538, -3.10129, 1, 0.05882353, 0, 1,
-2.132002, 0.7413058, -1.13938, 1, 0.06666667, 0, 1,
-2.102434, 0.8114259, -0.8421401, 1, 0.07058824, 0, 1,
-2.085702, 0.2113696, -0.7793261, 1, 0.07843138, 0, 1,
-2.066628, 0.5623169, -2.161163, 1, 0.08235294, 0, 1,
-2.061462, -1.412533, -3.269547, 1, 0.09019608, 0, 1,
-2.02765, 1.082347, -0.6315835, 1, 0.09411765, 0, 1,
-2.018812, 2.394169, -1.380971, 1, 0.1019608, 0, 1,
-2.009441, -0.356202, -1.704318, 1, 0.1098039, 0, 1,
-1.997639, 0.324053, -1.44089, 1, 0.1137255, 0, 1,
-1.990284, 0.01002851, -1.2003, 1, 0.1215686, 0, 1,
-1.987958, 0.3962786, -1.631529, 1, 0.1254902, 0, 1,
-1.98529, -0.2091791, -2.594738, 1, 0.1333333, 0, 1,
-1.976148, -0.0842095, -3.493539, 1, 0.1372549, 0, 1,
-1.962023, 1.084068, -1.003173, 1, 0.145098, 0, 1,
-1.944587, -1.02357, -1.594647, 1, 0.1490196, 0, 1,
-1.91129, 1.736893, -0.6447613, 1, 0.1568628, 0, 1,
-1.908623, -0.4598693, -1.259804, 1, 0.1607843, 0, 1,
-1.901129, 1.594399, -0.6598994, 1, 0.1686275, 0, 1,
-1.892961, -0.2293584, -3.03981, 1, 0.172549, 0, 1,
-1.863147, 1.155434, -2.969528, 1, 0.1803922, 0, 1,
-1.839259, -1.092989, -3.056951, 1, 0.1843137, 0, 1,
-1.834084, -0.3324514, -1.904277, 1, 0.1921569, 0, 1,
-1.822133, 0.1780618, -2.135233, 1, 0.1960784, 0, 1,
-1.814965, 0.5084739, -1.882173, 1, 0.2039216, 0, 1,
-1.800385, 0.4267697, -2.081263, 1, 0.2117647, 0, 1,
-1.800067, -0.7525625, -1.400555, 1, 0.2156863, 0, 1,
-1.779933, -0.6940063, -2.28384, 1, 0.2235294, 0, 1,
-1.757398, 1.007967, -0.9255642, 1, 0.227451, 0, 1,
-1.753318, 1.143073, 0.1989297, 1, 0.2352941, 0, 1,
-1.741463, -1.469673, -3.028757, 1, 0.2392157, 0, 1,
-1.735976, 1.27704, -0.5304156, 1, 0.2470588, 0, 1,
-1.732955, -0.3112185, -0.7767681, 1, 0.2509804, 0, 1,
-1.732027, -2.315127, -1.775388, 1, 0.2588235, 0, 1,
-1.726636, 1.05453, -2.01323, 1, 0.2627451, 0, 1,
-1.722605, -0.6839285, -1.113865, 1, 0.2705882, 0, 1,
-1.711069, 0.1177856, -1.789657, 1, 0.2745098, 0, 1,
-1.706831, -0.5890502, -1.793061, 1, 0.282353, 0, 1,
-1.704252, -1.15358, -2.122575, 1, 0.2862745, 0, 1,
-1.695368, 1.122302, -0.5334606, 1, 0.2941177, 0, 1,
-1.665917, -1.379667, -1.730512, 1, 0.3019608, 0, 1,
-1.661903, 1.309692, -1.533781, 1, 0.3058824, 0, 1,
-1.658104, 1.413403, -1.704828, 1, 0.3137255, 0, 1,
-1.637771, -2.554784, -2.619154, 1, 0.3176471, 0, 1,
-1.630527, -0.2512018, -2.201857, 1, 0.3254902, 0, 1,
-1.6299, 1.43605, 0.7543101, 1, 0.3294118, 0, 1,
-1.622486, -0.6254334, -1.08866, 1, 0.3372549, 0, 1,
-1.616744, -0.6874766, -3.115598, 1, 0.3411765, 0, 1,
-1.615562, -0.2428156, -0.9524934, 1, 0.3490196, 0, 1,
-1.594743, 0.4715676, 0.00303957, 1, 0.3529412, 0, 1,
-1.593593, -0.621545, -3.556353, 1, 0.3607843, 0, 1,
-1.583475, -0.3711044, -2.46972, 1, 0.3647059, 0, 1,
-1.581458, -0.8911852, -2.059281, 1, 0.372549, 0, 1,
-1.56523, -0.8364958, -3.308189, 1, 0.3764706, 0, 1,
-1.547787, 0.3847006, -1.846924, 1, 0.3843137, 0, 1,
-1.538142, -1.115382, -1.053754, 1, 0.3882353, 0, 1,
-1.531536, -0.7382343, -1.220491, 1, 0.3960784, 0, 1,
-1.515683, 0.6787273, -1.19056, 1, 0.4039216, 0, 1,
-1.512994, 0.5910501, -0.671007, 1, 0.4078431, 0, 1,
-1.50994, 0.06834423, -1.18988, 1, 0.4156863, 0, 1,
-1.507203, -1.598262, -2.453338, 1, 0.4196078, 0, 1,
-1.491521, 1.156888, -0.8297952, 1, 0.427451, 0, 1,
-1.488861, 0.8267654, -1.175089, 1, 0.4313726, 0, 1,
-1.487974, 1.80932, -0.6427479, 1, 0.4392157, 0, 1,
-1.475894, 0.8012502, -0.1432148, 1, 0.4431373, 0, 1,
-1.473041, 0.6040439, -0.02762627, 1, 0.4509804, 0, 1,
-1.46729, -1.385048, -3.724381, 1, 0.454902, 0, 1,
-1.465343, -0.380897, -2.131565, 1, 0.4627451, 0, 1,
-1.453303, -0.1018239, -1.756882, 1, 0.4666667, 0, 1,
-1.452456, -2.026385, -1.474781, 1, 0.4745098, 0, 1,
-1.450908, -0.7254015, -0.259447, 1, 0.4784314, 0, 1,
-1.450021, -1.548761, -1.311319, 1, 0.4862745, 0, 1,
-1.44186, -0.09049517, -2.772116, 1, 0.4901961, 0, 1,
-1.431193, 1.315448, 0.490551, 1, 0.4980392, 0, 1,
-1.416206, -1.235212, -2.48214, 1, 0.5058824, 0, 1,
-1.415526, -0.5277649, -2.225829, 1, 0.509804, 0, 1,
-1.405969, -0.4309323, -1.628218, 1, 0.5176471, 0, 1,
-1.404881, -0.07506891, -3.958281, 1, 0.5215687, 0, 1,
-1.395778, -0.4166861, -4.081574, 1, 0.5294118, 0, 1,
-1.387758, 1.053798, -2.365873, 1, 0.5333334, 0, 1,
-1.385884, 1.378427, -0.3879728, 1, 0.5411765, 0, 1,
-1.377688, 1.207653, -0.2477683, 1, 0.5450981, 0, 1,
-1.374417, 0.1324707, -0.6426162, 1, 0.5529412, 0, 1,
-1.371868, 0.4501965, -3.092814, 1, 0.5568628, 0, 1,
-1.3708, -0.1617232, -0.7955352, 1, 0.5647059, 0, 1,
-1.369512, 1.111183, 1.005219, 1, 0.5686275, 0, 1,
-1.364285, 1.020204, -1.816323, 1, 0.5764706, 0, 1,
-1.359712, 0.5994023, -1.217952, 1, 0.5803922, 0, 1,
-1.350014, 0.4206292, -0.6392111, 1, 0.5882353, 0, 1,
-1.343683, 0.3023051, -0.5059716, 1, 0.5921569, 0, 1,
-1.343539, 1.474696, 0.01142184, 1, 0.6, 0, 1,
-1.331586, -2.509405, -5.647079, 1, 0.6078432, 0, 1,
-1.331201, -1.034199, -0.9245499, 1, 0.6117647, 0, 1,
-1.321475, -1.140622, -0.8445374, 1, 0.6196079, 0, 1,
-1.317469, 0.3508148, -0.4719935, 1, 0.6235294, 0, 1,
-1.311275, -1.234077, -3.113543, 1, 0.6313726, 0, 1,
-1.307453, -1.152784, -2.74446, 1, 0.6352941, 0, 1,
-1.307221, -0.5198478, -2.293645, 1, 0.6431373, 0, 1,
-1.307045, 0.2340776, -1.840294, 1, 0.6470588, 0, 1,
-1.300602, -0.35824, -0.2214201, 1, 0.654902, 0, 1,
-1.292566, 0.7272168, -0.6118592, 1, 0.6588235, 0, 1,
-1.280548, -0.1939299, -0.9961868, 1, 0.6666667, 0, 1,
-1.275553, -1.988155, -1.32839, 1, 0.6705883, 0, 1,
-1.275405, 0.642714, -2.447736, 1, 0.6784314, 0, 1,
-1.269711, -0.532381, -1.7541, 1, 0.682353, 0, 1,
-1.269043, 0.7234384, -0.4006412, 1, 0.6901961, 0, 1,
-1.268533, -2.348523, -0.5722761, 1, 0.6941177, 0, 1,
-1.23466, 0.6884479, -2.259985, 1, 0.7019608, 0, 1,
-1.220041, -0.8574304, -2.967398, 1, 0.7098039, 0, 1,
-1.216739, -0.4092682, -1.883383, 1, 0.7137255, 0, 1,
-1.215943, -0.2866288, 0.5946252, 1, 0.7215686, 0, 1,
-1.206756, -0.2089413, -1.578296, 1, 0.7254902, 0, 1,
-1.204916, 0.8425732, -0.04192977, 1, 0.7333333, 0, 1,
-1.204718, 0.02834331, -2.191034, 1, 0.7372549, 0, 1,
-1.188004, 0.8928826, -0.4322011, 1, 0.7450981, 0, 1,
-1.183156, 0.4524166, -1.82637, 1, 0.7490196, 0, 1,
-1.182421, -0.2513418, -1.295097, 1, 0.7568628, 0, 1,
-1.178787, -0.8291029, -1.580087, 1, 0.7607843, 0, 1,
-1.172268, -1.623369, -1.559081, 1, 0.7686275, 0, 1,
-1.171757, -0.3742505, -2.876086, 1, 0.772549, 0, 1,
-1.164304, -1.862162, -2.835931, 1, 0.7803922, 0, 1,
-1.161438, 0.1180594, -2.256576, 1, 0.7843137, 0, 1,
-1.160997, 1.756846, 0.3923478, 1, 0.7921569, 0, 1,
-1.151482, 0.2835589, -3.475245, 1, 0.7960784, 0, 1,
-1.147301, -0.7985791, -2.000989, 1, 0.8039216, 0, 1,
-1.147094, 1.823545, 0.7414868, 1, 0.8117647, 0, 1,
-1.144273, 0.7291926, -1.082589, 1, 0.8156863, 0, 1,
-1.138606, -0.108674, -2.26902, 1, 0.8235294, 0, 1,
-1.138159, -0.5962947, -2.038802, 1, 0.827451, 0, 1,
-1.127579, 0.965429, -0.9150178, 1, 0.8352941, 0, 1,
-1.117242, -0.0343833, 0.4112374, 1, 0.8392157, 0, 1,
-1.117236, 0.3348309, -0.9673345, 1, 0.8470588, 0, 1,
-1.11716, 0.5663452, -2.109038, 1, 0.8509804, 0, 1,
-1.11473, 0.7810994, 0.4120132, 1, 0.8588235, 0, 1,
-1.109177, -0.7588907, -2.184042, 1, 0.8627451, 0, 1,
-1.107795, -1.000815, -1.727442, 1, 0.8705882, 0, 1,
-1.097353, 1.134355, -0.8491277, 1, 0.8745098, 0, 1,
-1.092106, -0.2284238, -2.05573, 1, 0.8823529, 0, 1,
-1.090322, -0.6371915, -3.306142, 1, 0.8862745, 0, 1,
-1.081019, 0.08886929, -2.169963, 1, 0.8941177, 0, 1,
-1.071567, 1.037246, -0.04782085, 1, 0.8980392, 0, 1,
-1.068992, 1.199252, 0.298592, 1, 0.9058824, 0, 1,
-1.068501, -1.730156, -2.470682, 1, 0.9137255, 0, 1,
-1.063066, 0.8649655, -1.725383, 1, 0.9176471, 0, 1,
-1.058667, 0.7371839, -2.310305, 1, 0.9254902, 0, 1,
-1.056495, -0.8576776, -1.964265, 1, 0.9294118, 0, 1,
-1.053632, -2.343894, -1.919499, 1, 0.9372549, 0, 1,
-1.043651, -0.3881555, -2.582625, 1, 0.9411765, 0, 1,
-1.042653, -0.1330937, -2.758284, 1, 0.9490196, 0, 1,
-1.039603, 0.3432917, -1.252602, 1, 0.9529412, 0, 1,
-1.029663, 0.3297664, -1.803185, 1, 0.9607843, 0, 1,
-1.028909, -0.07643349, -1.757795, 1, 0.9647059, 0, 1,
-1.028143, 1.120353, 0.4366943, 1, 0.972549, 0, 1,
-1.021597, 0.04374504, -2.690948, 1, 0.9764706, 0, 1,
-1.017742, 1.30495, 0.5140101, 1, 0.9843137, 0, 1,
-1.006874, -1.484794, -2.344045, 1, 0.9882353, 0, 1,
-1.006047, 0.7431859, -0.9613568, 1, 0.9960784, 0, 1,
-1.004692, 0.2405297, -2.398585, 0.9960784, 1, 0, 1,
-0.9986463, -1.146917, -3.450056, 0.9921569, 1, 0, 1,
-0.9970125, -1.265368, -3.442599, 0.9843137, 1, 0, 1,
-0.9931221, 0.733942, -0.7121023, 0.9803922, 1, 0, 1,
-0.9884775, -1.466882, -3.935594, 0.972549, 1, 0, 1,
-0.9795733, 0.7585459, 0.2547472, 0.9686275, 1, 0, 1,
-0.9768482, 1.428239, -1.598755, 0.9607843, 1, 0, 1,
-0.9701362, -1.092179, -2.135216, 0.9568627, 1, 0, 1,
-0.9697776, -0.4595277, -2.362293, 0.9490196, 1, 0, 1,
-0.9675636, -1.223735, -3.829339, 0.945098, 1, 0, 1,
-0.9519271, 0.5615492, -1.200693, 0.9372549, 1, 0, 1,
-0.9517855, 0.1075865, -1.682974, 0.9333333, 1, 0, 1,
-0.9511588, -1.548781, -2.371023, 0.9254902, 1, 0, 1,
-0.9493822, -1.717542, -3.032898, 0.9215686, 1, 0, 1,
-0.9483449, 0.175999, -0.4536213, 0.9137255, 1, 0, 1,
-0.9443467, 0.1586597, -3.059873, 0.9098039, 1, 0, 1,
-0.9375438, 0.03279662, -1.513404, 0.9019608, 1, 0, 1,
-0.935011, 1.147716, -0.924973, 0.8941177, 1, 0, 1,
-0.9348149, 0.3148453, -1.4664, 0.8901961, 1, 0, 1,
-0.9298404, -0.1677654, -2.2103, 0.8823529, 1, 0, 1,
-0.9247501, -0.116721, -1.332201, 0.8784314, 1, 0, 1,
-0.9186037, 0.3895226, -0.9448083, 0.8705882, 1, 0, 1,
-0.9167256, -0.9768402, -2.746879, 0.8666667, 1, 0, 1,
-0.9079739, 3.150218, -0.2938946, 0.8588235, 1, 0, 1,
-0.9061541, -1.099376, -3.715984, 0.854902, 1, 0, 1,
-0.9048833, 1.036976, -0.3365496, 0.8470588, 1, 0, 1,
-0.9039542, 1.063498, 1.065023, 0.8431373, 1, 0, 1,
-0.9004518, -0.8907933, -2.741893, 0.8352941, 1, 0, 1,
-0.8931325, -2.781583, -3.600447, 0.8313726, 1, 0, 1,
-0.8914357, 0.1339278, -3.824694, 0.8235294, 1, 0, 1,
-0.8893606, -0.3785784, -2.377098, 0.8196079, 1, 0, 1,
-0.8861744, -1.47202, -0.6214501, 0.8117647, 1, 0, 1,
-0.8849765, -0.9194697, -1.184198, 0.8078431, 1, 0, 1,
-0.883083, -0.3372893, -2.593836, 0.8, 1, 0, 1,
-0.8803669, -0.293072, -3.13637, 0.7921569, 1, 0, 1,
-0.8799753, -0.4986305, -2.231183, 0.7882353, 1, 0, 1,
-0.879319, -0.8144876, -3.27266, 0.7803922, 1, 0, 1,
-0.8761444, -1.7359, -3.430233, 0.7764706, 1, 0, 1,
-0.8753368, -0.5683219, -1.650866, 0.7686275, 1, 0, 1,
-0.8742837, -0.3871951, -1.06456, 0.7647059, 1, 0, 1,
-0.8688491, -0.4425104, -0.8303292, 0.7568628, 1, 0, 1,
-0.865536, 0.846031, 0.4977033, 0.7529412, 1, 0, 1,
-0.8521286, -1.130334, -3.272336, 0.7450981, 1, 0, 1,
-0.8502756, -0.0161784, -1.023331, 0.7411765, 1, 0, 1,
-0.8488395, 0.4838575, -2.777159, 0.7333333, 1, 0, 1,
-0.8435987, 0.4254137, -2.284939, 0.7294118, 1, 0, 1,
-0.8423196, -1.136957, -1.721265, 0.7215686, 1, 0, 1,
-0.8398403, -0.1724168, 0.1226424, 0.7176471, 1, 0, 1,
-0.8396316, -1.11679, -3.437558, 0.7098039, 1, 0, 1,
-0.836978, 1.882924, 0.4298066, 0.7058824, 1, 0, 1,
-0.8345779, -1.681205, -0.4963243, 0.6980392, 1, 0, 1,
-0.8332764, -0.2365389, -1.030723, 0.6901961, 1, 0, 1,
-0.8175271, -2.195131, -3.473341, 0.6862745, 1, 0, 1,
-0.8163926, -0.3580566, -1.718199, 0.6784314, 1, 0, 1,
-0.8118778, -1.729033, -3.226111, 0.6745098, 1, 0, 1,
-0.8056065, -1.219459, -2.239096, 0.6666667, 1, 0, 1,
-0.7996823, 0.1600819, -1.681953, 0.6627451, 1, 0, 1,
-0.7985912, -0.2259257, -0.974948, 0.654902, 1, 0, 1,
-0.7983506, -0.3567712, -2.038765, 0.6509804, 1, 0, 1,
-0.7936991, -1.061903, -2.533523, 0.6431373, 1, 0, 1,
-0.7863497, -0.4834744, -1.1406, 0.6392157, 1, 0, 1,
-0.7858894, -0.8244115, -2.99937, 0.6313726, 1, 0, 1,
-0.781045, 2.121832, -0.7563683, 0.627451, 1, 0, 1,
-0.7744699, -1.682198, -1.616911, 0.6196079, 1, 0, 1,
-0.7713681, 1.80477, -1.647459, 0.6156863, 1, 0, 1,
-0.7655513, 0.2414603, -1.778448, 0.6078432, 1, 0, 1,
-0.7561668, 1.064537, -2.133376, 0.6039216, 1, 0, 1,
-0.7524626, -1.422744, -3.970986, 0.5960785, 1, 0, 1,
-0.7523223, -0.8051733, -3.690759, 0.5882353, 1, 0, 1,
-0.7515545, 0.5891864, -0.2280495, 0.5843138, 1, 0, 1,
-0.750397, 0.2889605, -0.6092892, 0.5764706, 1, 0, 1,
-0.74735, -1.349555, -2.930616, 0.572549, 1, 0, 1,
-0.7420262, -0.7304826, -0.7651598, 0.5647059, 1, 0, 1,
-0.7316422, -0.2621889, -1.231139, 0.5607843, 1, 0, 1,
-0.7291264, -1.324717, -2.574683, 0.5529412, 1, 0, 1,
-0.7209255, -1.557258, -2.678378, 0.5490196, 1, 0, 1,
-0.7155184, -2.743176, -1.380327, 0.5411765, 1, 0, 1,
-0.7124927, -0.5271446, -0.9917636, 0.5372549, 1, 0, 1,
-0.7074814, -0.569118, -2.605831, 0.5294118, 1, 0, 1,
-0.704869, -0.3222087, -3.619512, 0.5254902, 1, 0, 1,
-0.7002296, 0.3879334, -1.8539, 0.5176471, 1, 0, 1,
-0.6991003, 0.978021, -1.634359, 0.5137255, 1, 0, 1,
-0.6973937, -1.036483, -3.953394, 0.5058824, 1, 0, 1,
-0.6972414, 0.2737582, 0.9083287, 0.5019608, 1, 0, 1,
-0.6857681, -0.8966574, -3.053682, 0.4941176, 1, 0, 1,
-0.684687, -1.481985, -4.051653, 0.4862745, 1, 0, 1,
-0.6838818, -0.5576594, -1.875608, 0.4823529, 1, 0, 1,
-0.6807414, 2.056326, -0.2267879, 0.4745098, 1, 0, 1,
-0.6806567, -0.522812, -3.317334, 0.4705882, 1, 0, 1,
-0.6777808, -0.2297182, -2.140233, 0.4627451, 1, 0, 1,
-0.6777132, 1.391248, -0.8898371, 0.4588235, 1, 0, 1,
-0.6655041, 1.993192, -1.439464, 0.4509804, 1, 0, 1,
-0.6593115, -0.9574846, -3.490551, 0.4470588, 1, 0, 1,
-0.6592109, 1.964656, 0.6299735, 0.4392157, 1, 0, 1,
-0.6473329, 1.089772, -0.2539778, 0.4352941, 1, 0, 1,
-0.6434032, -0.3546272, -1.648655, 0.427451, 1, 0, 1,
-0.6423717, 0.6422534, -0.1708956, 0.4235294, 1, 0, 1,
-0.6346916, 1.519262, -0.7522461, 0.4156863, 1, 0, 1,
-0.6312423, -1.190948, -2.555108, 0.4117647, 1, 0, 1,
-0.630483, -0.6766349, -2.513757, 0.4039216, 1, 0, 1,
-0.6286348, 0.3090563, -0.3222412, 0.3960784, 1, 0, 1,
-0.612907, -0.3660331, 0.1061862, 0.3921569, 1, 0, 1,
-0.6128908, -2.59099, -2.440284, 0.3843137, 1, 0, 1,
-0.6092113, -0.7765328, -3.400862, 0.3803922, 1, 0, 1,
-0.608712, -0.159005, -0.9900404, 0.372549, 1, 0, 1,
-0.6085128, -0.02558496, -1.688448, 0.3686275, 1, 0, 1,
-0.6064271, 0.97282, 0.2697436, 0.3607843, 1, 0, 1,
-0.6035377, -1.40448, -3.20465, 0.3568628, 1, 0, 1,
-0.596203, -0.7519001, -3.273497, 0.3490196, 1, 0, 1,
-0.5950499, 0.3382375, -2.430411, 0.345098, 1, 0, 1,
-0.5940222, 0.3393261, -2.663809, 0.3372549, 1, 0, 1,
-0.5922836, 1.387451, -0.5637169, 0.3333333, 1, 0, 1,
-0.5909683, 0.7950556, -0.6735915, 0.3254902, 1, 0, 1,
-0.5794884, -1.342381, -2.773726, 0.3215686, 1, 0, 1,
-0.5760841, -0.3720337, -2.007051, 0.3137255, 1, 0, 1,
-0.5738227, -2.148627, -2.83184, 0.3098039, 1, 0, 1,
-0.5716343, -0.2351356, -2.245464, 0.3019608, 1, 0, 1,
-0.5703337, -0.5339671, -2.734051, 0.2941177, 1, 0, 1,
-0.5700412, 0.9139042, -1.473434, 0.2901961, 1, 0, 1,
-0.569796, 1.432284, -0.9049493, 0.282353, 1, 0, 1,
-0.5694142, 1.31415, -1.496227, 0.2784314, 1, 0, 1,
-0.5675089, -0.9286043, -3.109835, 0.2705882, 1, 0, 1,
-0.5666476, 2.299489, 0.2135329, 0.2666667, 1, 0, 1,
-0.5659803, 0.5434025, -1.891034, 0.2588235, 1, 0, 1,
-0.5654745, 0.1517987, -0.4893887, 0.254902, 1, 0, 1,
-0.5638456, -0.8621014, -4.260674, 0.2470588, 1, 0, 1,
-0.5617312, -0.1550447, -3.230503, 0.2431373, 1, 0, 1,
-0.5616674, 0.09679762, -0.7945211, 0.2352941, 1, 0, 1,
-0.5559983, 0.4096867, -0.2464989, 0.2313726, 1, 0, 1,
-0.5508698, 0.4168624, 1.094603, 0.2235294, 1, 0, 1,
-0.5465825, -0.8312348, -3.289027, 0.2196078, 1, 0, 1,
-0.5441355, -0.8057667, -2.913193, 0.2117647, 1, 0, 1,
-0.5431474, 0.5376391, -0.6858495, 0.2078431, 1, 0, 1,
-0.5423874, 0.008583692, -2.007254, 0.2, 1, 0, 1,
-0.5407614, 1.082153, 0.5987836, 0.1921569, 1, 0, 1,
-0.5398723, 0.4899482, -0.1631539, 0.1882353, 1, 0, 1,
-0.53751, -0.1932491, -1.741434, 0.1803922, 1, 0, 1,
-0.5365474, 1.064333, -0.5441245, 0.1764706, 1, 0, 1,
-0.5357981, -1.713479, -2.505717, 0.1686275, 1, 0, 1,
-0.5348398, -1.646839, -4.084342, 0.1647059, 1, 0, 1,
-0.5327831, 0.4907694, -0.4124791, 0.1568628, 1, 0, 1,
-0.5303568, 0.4902667, -1.185513, 0.1529412, 1, 0, 1,
-0.529503, 0.3995434, -1.234442, 0.145098, 1, 0, 1,
-0.5283465, 0.2065543, -0.9725505, 0.1411765, 1, 0, 1,
-0.5225484, -0.777284, -3.780499, 0.1333333, 1, 0, 1,
-0.5208659, 0.2032219, -1.68811, 0.1294118, 1, 0, 1,
-0.5122449, 0.2339632, -0.07117081, 0.1215686, 1, 0, 1,
-0.5119703, -0.8062696, -3.687942, 0.1176471, 1, 0, 1,
-0.5113385, -2.036707, -2.959253, 0.1098039, 1, 0, 1,
-0.5073529, 0.1140357, -0.9609551, 0.1058824, 1, 0, 1,
-0.5059747, -0.08468319, -1.825203, 0.09803922, 1, 0, 1,
-0.5057736, 1.4234, -1.522738, 0.09019608, 1, 0, 1,
-0.5016259, 1.026952, 0.4658263, 0.08627451, 1, 0, 1,
-0.5010799, 0.9386038, 1.093439, 0.07843138, 1, 0, 1,
-0.5008613, 0.2417562, -0.8599693, 0.07450981, 1, 0, 1,
-0.4975679, 1.642384, -1.132172, 0.06666667, 1, 0, 1,
-0.4958353, 0.1657509, -1.427461, 0.0627451, 1, 0, 1,
-0.486677, -1.407782, -2.707876, 0.05490196, 1, 0, 1,
-0.4852843, -0.4657022, -2.251462, 0.05098039, 1, 0, 1,
-0.4838257, 1.128948, -1.003365, 0.04313726, 1, 0, 1,
-0.4834735, -0.04065836, -3.345513, 0.03921569, 1, 0, 1,
-0.4830008, 0.9602427, -0.2451754, 0.03137255, 1, 0, 1,
-0.4829896, -0.1423981, -1.979372, 0.02745098, 1, 0, 1,
-0.482948, -0.7046785, -2.910367, 0.01960784, 1, 0, 1,
-0.4746206, 1.896258, -0.1688593, 0.01568628, 1, 0, 1,
-0.4738842, 0.3720679, -3.234696, 0.007843138, 1, 0, 1,
-0.4685555, 0.5318785, 0.3204761, 0.003921569, 1, 0, 1,
-0.4650283, 0.5375142, -1.620688, 0, 1, 0.003921569, 1,
-0.4636302, -1.622541, -5.21696, 0, 1, 0.01176471, 1,
-0.4625632, -0.8278602, -2.196056, 0, 1, 0.01568628, 1,
-0.4604302, -0.1139492, -0.5994793, 0, 1, 0.02352941, 1,
-0.4601756, 0.6673216, -0.4334523, 0, 1, 0.02745098, 1,
-0.4551323, 0.8376883, -0.5246769, 0, 1, 0.03529412, 1,
-0.4515144, 0.8111084, 0.8882489, 0, 1, 0.03921569, 1,
-0.4513556, -0.7638522, -2.600266, 0, 1, 0.04705882, 1,
-0.4494714, 0.07172878, 0.1332435, 0, 1, 0.05098039, 1,
-0.4446335, -0.2549405, -2.831956, 0, 1, 0.05882353, 1,
-0.4432578, 0.623737, -1.45846, 0, 1, 0.0627451, 1,
-0.4403327, -1.172879, -2.005213, 0, 1, 0.07058824, 1,
-0.4351723, -0.0822041, -2.551694, 0, 1, 0.07450981, 1,
-0.4299251, -0.6170207, -0.3090589, 0, 1, 0.08235294, 1,
-0.4287049, 0.0864566, -1.883151, 0, 1, 0.08627451, 1,
-0.4279508, 0.6421588, 1.623376, 0, 1, 0.09411765, 1,
-0.4278854, 0.4031119, -0.6824526, 0, 1, 0.1019608, 1,
-0.4205258, 2.5109, -0.2737328, 0, 1, 0.1058824, 1,
-0.4198383, -0.06341901, -1.639935, 0, 1, 0.1137255, 1,
-0.4145986, 0.6168914, 0.3224788, 0, 1, 0.1176471, 1,
-0.4086054, 0.2357292, -1.764625, 0, 1, 0.1254902, 1,
-0.4071242, 0.06568436, -1.35241, 0, 1, 0.1294118, 1,
-0.3984894, 0.5169309, 0.07114009, 0, 1, 0.1372549, 1,
-0.397967, 1.215879, 0.02265243, 0, 1, 0.1411765, 1,
-0.3971765, -0.564342, -2.754436, 0, 1, 0.1490196, 1,
-0.3924403, -0.03807929, -1.499003, 0, 1, 0.1529412, 1,
-0.3914125, -0.6439543, -3.651763, 0, 1, 0.1607843, 1,
-0.387963, 1.178945, -2.2644, 0, 1, 0.1647059, 1,
-0.3856156, -0.03682883, -2.258534, 0, 1, 0.172549, 1,
-0.3800926, -0.7697845, -1.671144, 0, 1, 0.1764706, 1,
-0.376419, 0.8270167, -0.1229397, 0, 1, 0.1843137, 1,
-0.3741304, 0.09605806, -2.678678, 0, 1, 0.1882353, 1,
-0.3674978, 0.8649604, 0.115164, 0, 1, 0.1960784, 1,
-0.3648211, -2.669503, -4.638494, 0, 1, 0.2039216, 1,
-0.364749, 0.4955731, -0.09510425, 0, 1, 0.2078431, 1,
-0.3581032, -0.634321, -2.252694, 0, 1, 0.2156863, 1,
-0.3574273, 0.3464743, -0.5699525, 0, 1, 0.2196078, 1,
-0.3499898, 0.9029958, -0.9541742, 0, 1, 0.227451, 1,
-0.3488078, 0.9535138, 0.5682828, 0, 1, 0.2313726, 1,
-0.3425444, -0.5701609, -2.523355, 0, 1, 0.2392157, 1,
-0.3416154, -0.4671725, -0.8709298, 0, 1, 0.2431373, 1,
-0.3397988, -0.2729068, -1.640403, 0, 1, 0.2509804, 1,
-0.3308926, -0.4267111, -0.6860643, 0, 1, 0.254902, 1,
-0.3274026, 0.2661371, -1.232343, 0, 1, 0.2627451, 1,
-0.323272, 0.3968222, 1.196077, 0, 1, 0.2666667, 1,
-0.322573, -0.3435243, -2.663533, 0, 1, 0.2745098, 1,
-0.3116976, -1.298146, -3.563432, 0, 1, 0.2784314, 1,
-0.3098417, -0.805815, -3.925711, 0, 1, 0.2862745, 1,
-0.3085949, -0.4212058, -2.621042, 0, 1, 0.2901961, 1,
-0.3080473, 0.7015886, -0.4097895, 0, 1, 0.2980392, 1,
-0.3058665, 0.042417, -2.253872, 0, 1, 0.3058824, 1,
-0.3051139, -1.247757, -4.127201, 0, 1, 0.3098039, 1,
-0.3015151, -0.1223202, -2.345317, 0, 1, 0.3176471, 1,
-0.2966042, -1.891549, -2.891906, 0, 1, 0.3215686, 1,
-0.2927442, 0.8898188, 0.02176319, 0, 1, 0.3294118, 1,
-0.2923498, -0.9258987, -2.122254, 0, 1, 0.3333333, 1,
-0.2843102, 0.2728636, -1.083923, 0, 1, 0.3411765, 1,
-0.2827082, -0.2379382, -1.489085, 0, 1, 0.345098, 1,
-0.2815065, -1.178241, -3.172561, 0, 1, 0.3529412, 1,
-0.2801535, -1.320292, -1.727765, 0, 1, 0.3568628, 1,
-0.2794234, -0.2660826, -2.674746, 0, 1, 0.3647059, 1,
-0.2759416, -0.3314858, -2.571063, 0, 1, 0.3686275, 1,
-0.2745135, 0.5343128, -0.8405992, 0, 1, 0.3764706, 1,
-0.2735169, 0.03460059, -2.436276, 0, 1, 0.3803922, 1,
-0.2734086, -1.24919, -1.990213, 0, 1, 0.3882353, 1,
-0.2717116, 0.7603208, -1.29549, 0, 1, 0.3921569, 1,
-0.2716933, -0.06803165, 0.1937281, 0, 1, 0.4, 1,
-0.2672428, 1.255434, -0.6307454, 0, 1, 0.4078431, 1,
-0.2656435, 0.7115412, -0.3899523, 0, 1, 0.4117647, 1,
-0.258674, -1.494997, -2.488341, 0, 1, 0.4196078, 1,
-0.2524358, 2.15494, 1.454668, 0, 1, 0.4235294, 1,
-0.2456105, -0.8211528, -3.237433, 0, 1, 0.4313726, 1,
-0.2332385, 1.62629, -1.628226, 0, 1, 0.4352941, 1,
-0.2214492, 1.541834, 0.04486655, 0, 1, 0.4431373, 1,
-0.2200166, -1.484884, -2.511286, 0, 1, 0.4470588, 1,
-0.2190249, -0.458866, -2.6987, 0, 1, 0.454902, 1,
-0.2181591, 1.228724, 0.6563784, 0, 1, 0.4588235, 1,
-0.2154545, 0.6142727, -1.0317, 0, 1, 0.4666667, 1,
-0.2145453, 0.2741637, -0.7676071, 0, 1, 0.4705882, 1,
-0.2042822, -0.4669001, -2.336768, 0, 1, 0.4784314, 1,
-0.1934981, 0.7909477, -1.05806, 0, 1, 0.4823529, 1,
-0.1907006, -1.455705, -4.379079, 0, 1, 0.4901961, 1,
-0.1863945, -0.6970572, -2.980114, 0, 1, 0.4941176, 1,
-0.1853929, -2.699366, -3.165463, 0, 1, 0.5019608, 1,
-0.1844795, -0.7515963, -3.570291, 0, 1, 0.509804, 1,
-0.1844067, -1.508425, -1.984492, 0, 1, 0.5137255, 1,
-0.1779188, 1.094661, -0.6804472, 0, 1, 0.5215687, 1,
-0.1743426, 1.037531, -0.8896918, 0, 1, 0.5254902, 1,
-0.1733108, -0.7091933, -2.175064, 0, 1, 0.5333334, 1,
-0.1718571, -1.207864, -1.910034, 0, 1, 0.5372549, 1,
-0.1702741, -1.708797, -2.63732, 0, 1, 0.5450981, 1,
-0.1701466, 1.128029, 1.062145, 0, 1, 0.5490196, 1,
-0.1616099, 0.09445464, -2.424506, 0, 1, 0.5568628, 1,
-0.1601685, 0.7149609, -0.03677065, 0, 1, 0.5607843, 1,
-0.1528262, -0.5007302, -2.977086, 0, 1, 0.5686275, 1,
-0.151195, 1.236662, 0.6054106, 0, 1, 0.572549, 1,
-0.1507515, -0.4098492, -0.08560012, 0, 1, 0.5803922, 1,
-0.1504855, 0.9461356, 1.181696, 0, 1, 0.5843138, 1,
-0.1411824, 0.7342507, -0.7485857, 0, 1, 0.5921569, 1,
-0.1410361, 0.3133269, -0.9281991, 0, 1, 0.5960785, 1,
-0.1365995, -2.03299, -2.677497, 0, 1, 0.6039216, 1,
-0.1349362, -0.883539, -3.381863, 0, 1, 0.6117647, 1,
-0.1348394, -1.492812, -2.792516, 0, 1, 0.6156863, 1,
-0.1343973, 0.2679541, -0.1661173, 0, 1, 0.6235294, 1,
-0.1328009, 1.709603, -0.4820536, 0, 1, 0.627451, 1,
-0.1304943, 0.7641901, -0.3552633, 0, 1, 0.6352941, 1,
-0.1298869, 0.1892307, -1.981558, 0, 1, 0.6392157, 1,
-0.1248584, -1.162573, -1.674046, 0, 1, 0.6470588, 1,
-0.1169824, -1.882366, -3.475456, 0, 1, 0.6509804, 1,
-0.1147634, -0.7444447, -1.485269, 0, 1, 0.6588235, 1,
-0.1132044, 0.1148993, 0.2099082, 0, 1, 0.6627451, 1,
-0.1082163, -0.5090103, -2.168127, 0, 1, 0.6705883, 1,
-0.1065544, -1.086497, -4.665397, 0, 1, 0.6745098, 1,
-0.105801, 0.7927263, -1.084447, 0, 1, 0.682353, 1,
-0.1025904, 0.3311342, 0.002586754, 0, 1, 0.6862745, 1,
-0.1002201, 1.676883, -0.4422097, 0, 1, 0.6941177, 1,
-0.09958994, -1.478539, -3.511519, 0, 1, 0.7019608, 1,
-0.0955776, 0.288519, -0.732553, 0, 1, 0.7058824, 1,
-0.09441056, -0.8632824, -2.110856, 0, 1, 0.7137255, 1,
-0.08795699, 1.301999, -0.2321644, 0, 1, 0.7176471, 1,
-0.08691121, 0.2361998, -1.278705, 0, 1, 0.7254902, 1,
-0.08646873, -1.719127, -4.334878, 0, 1, 0.7294118, 1,
-0.08569933, 0.7524843, -1.884187, 0, 1, 0.7372549, 1,
-0.08396235, 0.8421855, 0.7267863, 0, 1, 0.7411765, 1,
-0.07869364, -0.05935431, -1.389205, 0, 1, 0.7490196, 1,
-0.07845703, -0.06059363, -1.883205, 0, 1, 0.7529412, 1,
-0.07626173, -1.674458, -2.787736, 0, 1, 0.7607843, 1,
-0.07414873, -0.233017, -4.056988, 0, 1, 0.7647059, 1,
-0.07126594, -2.356421, -2.554295, 0, 1, 0.772549, 1,
-0.07089216, 0.3445707, -0.9049852, 0, 1, 0.7764706, 1,
-0.06769362, 0.6218552, -0.3890519, 0, 1, 0.7843137, 1,
-0.06670348, -0.937614, -2.724385, 0, 1, 0.7882353, 1,
-0.06586879, 0.8515587, -0.2999873, 0, 1, 0.7960784, 1,
-0.06260435, 0.7218463, 0.3580716, 0, 1, 0.8039216, 1,
-0.06038676, -1.242716, -3.536524, 0, 1, 0.8078431, 1,
-0.05788739, -0.008767674, -0.8128244, 0, 1, 0.8156863, 1,
-0.05717973, -0.6036811, -1.817117, 0, 1, 0.8196079, 1,
-0.05404826, 1.069936, 1.587993, 0, 1, 0.827451, 1,
-0.05304154, 0.6735697, -0.3262717, 0, 1, 0.8313726, 1,
-0.04994801, -0.5984258, -2.660937, 0, 1, 0.8392157, 1,
-0.04610065, 0.5731814, -0.4997271, 0, 1, 0.8431373, 1,
-0.0437277, -2.122147, -2.641821, 0, 1, 0.8509804, 1,
-0.04256514, -1.246949, -5.303374, 0, 1, 0.854902, 1,
-0.04230878, -0.4297556, -2.738878, 0, 1, 0.8627451, 1,
-0.03770353, 0.04454491, 0.03193471, 0, 1, 0.8666667, 1,
-0.03668823, 0.1171366, -1.831192, 0, 1, 0.8745098, 1,
-0.03357376, -0.5268382, -2.711467, 0, 1, 0.8784314, 1,
-0.03303568, 1.652679, 1.718879, 0, 1, 0.8862745, 1,
-0.03041378, 1.296818, -0.2111502, 0, 1, 0.8901961, 1,
-0.02890097, 0.9323727, 1.117023, 0, 1, 0.8980392, 1,
-0.02874779, 1.108939, 0.04527932, 0, 1, 0.9058824, 1,
-0.0251905, -0.5630352, -1.803778, 0, 1, 0.9098039, 1,
-0.02276871, -1.130256, -3.793409, 0, 1, 0.9176471, 1,
-0.01089006, -0.2241903, -4.039403, 0, 1, 0.9215686, 1,
-0.008690739, -0.921658, -4.364829, 0, 1, 0.9294118, 1,
-0.007380619, 2.84796, -1.44915, 0, 1, 0.9333333, 1,
-0.004909047, -0.3293748, -2.652322, 0, 1, 0.9411765, 1,
-0.004059715, -1.611031, -2.864603, 0, 1, 0.945098, 1,
-0.00345753, 0.3264199, -1.187633, 0, 1, 0.9529412, 1,
-0.003166798, -0.04254872, -4.804713, 0, 1, 0.9568627, 1,
0.0004165564, 1.390591, -2.470845, 0, 1, 0.9647059, 1,
0.003485512, -0.3916402, 3.950671, 0, 1, 0.9686275, 1,
0.004858715, 0.4510591, -0.6078452, 0, 1, 0.9764706, 1,
0.00639388, 0.4539469, 0.8390457, 0, 1, 0.9803922, 1,
0.006480989, 0.2296701, 0.878289, 0, 1, 0.9882353, 1,
0.006615522, -0.4608559, 0.8569551, 0, 1, 0.9921569, 1,
0.006695099, -0.4156312, 2.754443, 0, 1, 1, 1,
0.008050968, -0.2884125, 2.137437, 0, 0.9921569, 1, 1,
0.009983268, -1.16639, 3.256744, 0, 0.9882353, 1, 1,
0.01661703, -0.2836753, 3.899493, 0, 0.9803922, 1, 1,
0.01876136, -1.548848, 3.250377, 0, 0.9764706, 1, 1,
0.02130739, 1.000596, 1.755018, 0, 0.9686275, 1, 1,
0.02151681, -1.223136, 1.503637, 0, 0.9647059, 1, 1,
0.02410549, -1.357779, 3.018819, 0, 0.9568627, 1, 1,
0.02534745, 2.579083, 0.4097372, 0, 0.9529412, 1, 1,
0.02875173, 0.2228129, -0.3546946, 0, 0.945098, 1, 1,
0.03000757, -1.319679, 3.498102, 0, 0.9411765, 1, 1,
0.03371346, 0.2244895, 1.031617, 0, 0.9333333, 1, 1,
0.0353761, 0.216885, -1.235237, 0, 0.9294118, 1, 1,
0.03914648, 0.2824031, -0.6098555, 0, 0.9215686, 1, 1,
0.03925962, -0.5190199, 0.8379117, 0, 0.9176471, 1, 1,
0.04098902, -0.3255298, 3.413482, 0, 0.9098039, 1, 1,
0.04277018, -0.236722, 0.9568954, 0, 0.9058824, 1, 1,
0.05000438, -2.286404, 2.274312, 0, 0.8980392, 1, 1,
0.05150886, 2.246634, -0.9051456, 0, 0.8901961, 1, 1,
0.05169666, 0.07805146, 1.211674, 0, 0.8862745, 1, 1,
0.05296424, -0.05175175, 4.676566, 0, 0.8784314, 1, 1,
0.05343346, -0.807011, 2.86155, 0, 0.8745098, 1, 1,
0.05595451, 1.153505, 0.2484191, 0, 0.8666667, 1, 1,
0.05869285, 0.3447625, 0.5469316, 0, 0.8627451, 1, 1,
0.05874139, -0.407845, 2.582553, 0, 0.854902, 1, 1,
0.07601541, 1.764072, 0.08875076, 0, 0.8509804, 1, 1,
0.07785688, 0.8457668, 0.899691, 0, 0.8431373, 1, 1,
0.08381988, -1.142859, 3.168302, 0, 0.8392157, 1, 1,
0.08515137, 0.4341668, 0.7746634, 0, 0.8313726, 1, 1,
0.08577118, 1.026521, 0.166389, 0, 0.827451, 1, 1,
0.0897884, -0.8537157, 3.871572, 0, 0.8196079, 1, 1,
0.09158871, 0.7625464, -1.573378, 0, 0.8156863, 1, 1,
0.09276532, 0.5300623, -2.384264, 0, 0.8078431, 1, 1,
0.0937008, 0.5554942, 0.05921547, 0, 0.8039216, 1, 1,
0.09371244, 0.1901249, 0.6707759, 0, 0.7960784, 1, 1,
0.09376483, 1.104104, -0.3459838, 0, 0.7882353, 1, 1,
0.09720031, 0.3186425, -0.145496, 0, 0.7843137, 1, 1,
0.09728861, 0.75861, 1.188745, 0, 0.7764706, 1, 1,
0.1016631, 0.6941639, -0.1964484, 0, 0.772549, 1, 1,
0.1044221, -0.2834993, 4.608111, 0, 0.7647059, 1, 1,
0.1079796, 2.219483, 0.2554993, 0, 0.7607843, 1, 1,
0.1106561, 0.397034, -1.406493, 0, 0.7529412, 1, 1,
0.1128059, 0.1703607, 0.6206819, 0, 0.7490196, 1, 1,
0.1137751, -1.436891, 3.111132, 0, 0.7411765, 1, 1,
0.1145538, 0.948175, -1.549095, 0, 0.7372549, 1, 1,
0.1166006, -0.3918892, 3.388434, 0, 0.7294118, 1, 1,
0.118316, 0.5470363, 0.7935544, 0, 0.7254902, 1, 1,
0.1189144, 0.8294495, 0.5781038, 0, 0.7176471, 1, 1,
0.1205707, 1.739656, -0.5379556, 0, 0.7137255, 1, 1,
0.1283413, 0.2307653, 1.757165, 0, 0.7058824, 1, 1,
0.129632, -0.6904197, 1.70424, 0, 0.6980392, 1, 1,
0.1303659, -0.461638, 1.806643, 0, 0.6941177, 1, 1,
0.1304874, -0.00312796, 3.567908, 0, 0.6862745, 1, 1,
0.1316507, 0.5501056, -0.4712384, 0, 0.682353, 1, 1,
0.1449135, -0.9898226, 3.048351, 0, 0.6745098, 1, 1,
0.147571, -0.4200944, 2.362483, 0, 0.6705883, 1, 1,
0.1502481, 0.3117853, -0.4882875, 0, 0.6627451, 1, 1,
0.1511055, 0.04754751, 2.02811, 0, 0.6588235, 1, 1,
0.1535044, 0.4669957, 1.200594, 0, 0.6509804, 1, 1,
0.1552651, 0.6079642, 0.6975316, 0, 0.6470588, 1, 1,
0.15744, 0.07747318, 1.128644, 0, 0.6392157, 1, 1,
0.1606417, -0.3753011, 2.780879, 0, 0.6352941, 1, 1,
0.1616234, -0.5780495, 2.399531, 0, 0.627451, 1, 1,
0.1655525, -0.0627796, 1.546104, 0, 0.6235294, 1, 1,
0.1668593, -0.2052449, 3.338717, 0, 0.6156863, 1, 1,
0.1744158, 0.5428351, -1.5375, 0, 0.6117647, 1, 1,
0.175883, -2.513082, 2.434629, 0, 0.6039216, 1, 1,
0.1781743, -0.7052611, 3.867759, 0, 0.5960785, 1, 1,
0.1836088, -0.4409742, 1.600053, 0, 0.5921569, 1, 1,
0.1849621, 1.132316, 0.5190334, 0, 0.5843138, 1, 1,
0.1849766, -2.537626, 3.038228, 0, 0.5803922, 1, 1,
0.1880841, 0.04732505, 1.657441, 0, 0.572549, 1, 1,
0.1936005, -0.08071108, 1.867913, 0, 0.5686275, 1, 1,
0.1949434, -1.314764, 3.312501, 0, 0.5607843, 1, 1,
0.1967872, -1.10824, 3.283285, 0, 0.5568628, 1, 1,
0.1970207, 0.7997817, -0.3655332, 0, 0.5490196, 1, 1,
0.1970613, -2.32974, 3.252224, 0, 0.5450981, 1, 1,
0.1981579, 0.5925758, 0.3053989, 0, 0.5372549, 1, 1,
0.1989005, 1.596574, 0.7424983, 0, 0.5333334, 1, 1,
0.201665, -0.9634999, 3.017955, 0, 0.5254902, 1, 1,
0.2046009, 0.2265845, 2.296792, 0, 0.5215687, 1, 1,
0.21126, 0.1629031, 0.5288001, 0, 0.5137255, 1, 1,
0.213309, 0.489623, -0.990497, 0, 0.509804, 1, 1,
0.2180305, 0.196449, -0.296488, 0, 0.5019608, 1, 1,
0.2193544, 0.7313691, 0.05868927, 0, 0.4941176, 1, 1,
0.2235431, -0.137413, 2.227767, 0, 0.4901961, 1, 1,
0.2244822, 0.5089623, 1.383871, 0, 0.4823529, 1, 1,
0.228727, -1.147091, 2.871585, 0, 0.4784314, 1, 1,
0.2294812, 1.885698, 1.629926, 0, 0.4705882, 1, 1,
0.2303151, 1.082167, 0.440598, 0, 0.4666667, 1, 1,
0.2348171, -1.695747, 3.262193, 0, 0.4588235, 1, 1,
0.2383406, -1.980319, 4.847894, 0, 0.454902, 1, 1,
0.241167, 0.5891372, 1.697567, 0, 0.4470588, 1, 1,
0.2432668, -0.2150042, 2.525436, 0, 0.4431373, 1, 1,
0.2449175, -0.6434083, 2.361008, 0, 0.4352941, 1, 1,
0.2518867, -1.367035, 1.598173, 0, 0.4313726, 1, 1,
0.2527171, 0.3634769, 2.467509, 0, 0.4235294, 1, 1,
0.2545646, 1.753888, 0.3413482, 0, 0.4196078, 1, 1,
0.2561497, 0.1331935, -0.7041249, 0, 0.4117647, 1, 1,
0.2623443, -0.07363753, 1.97131, 0, 0.4078431, 1, 1,
0.265172, -1.409354, 1.448197, 0, 0.4, 1, 1,
0.2658368, 0.106662, 1.376576, 0, 0.3921569, 1, 1,
0.267143, -0.04509811, 1.929341, 0, 0.3882353, 1, 1,
0.2714062, -0.9885606, 2.421613, 0, 0.3803922, 1, 1,
0.2762828, -1.490278, 4.003514, 0, 0.3764706, 1, 1,
0.2798933, 0.258238, 0.2496335, 0, 0.3686275, 1, 1,
0.2806764, -0.7623951, 2.015032, 0, 0.3647059, 1, 1,
0.2823843, 0.9997993, 2.25941, 0, 0.3568628, 1, 1,
0.2869286, -0.3097301, 3.768818, 0, 0.3529412, 1, 1,
0.2880952, -0.3175594, 3.849857, 0, 0.345098, 1, 1,
0.2912176, 0.1706169, 2.117777, 0, 0.3411765, 1, 1,
0.2937709, 0.6719306, 2.053909, 0, 0.3333333, 1, 1,
0.2971037, 0.9922969, 1.096195, 0, 0.3294118, 1, 1,
0.2995251, -0.1899073, 3.418373, 0, 0.3215686, 1, 1,
0.3009238, -0.4580066, 4.227475, 0, 0.3176471, 1, 1,
0.3016468, 1.248216, -0.5783753, 0, 0.3098039, 1, 1,
0.3030734, -0.9185472, 3.721232, 0, 0.3058824, 1, 1,
0.3093845, 0.9800355, 1.588943, 0, 0.2980392, 1, 1,
0.3101583, -1.573852, 3.427632, 0, 0.2901961, 1, 1,
0.310718, -0.7360538, 4.042837, 0, 0.2862745, 1, 1,
0.3112012, -0.5300589, 0.6300829, 0, 0.2784314, 1, 1,
0.314183, -0.4033831, 2.608955, 0, 0.2745098, 1, 1,
0.3147151, 1.126027, -0.1132945, 0, 0.2666667, 1, 1,
0.3158511, 0.7568104, 0.7641547, 0, 0.2627451, 1, 1,
0.316446, -1.278133, 3.07553, 0, 0.254902, 1, 1,
0.3180574, 1.18309, 1.746835, 0, 0.2509804, 1, 1,
0.3235103, -1.15284, 0.6950446, 0, 0.2431373, 1, 1,
0.3248322, 1.906644, 0.5175402, 0, 0.2392157, 1, 1,
0.326954, 0.6794701, 1.682035, 0, 0.2313726, 1, 1,
0.3328838, -1.694339, 2.639205, 0, 0.227451, 1, 1,
0.3399847, -0.9591777, 4.190563, 0, 0.2196078, 1, 1,
0.3404265, 1.287053, 1.184079, 0, 0.2156863, 1, 1,
0.3406365, -0.387087, 2.798394, 0, 0.2078431, 1, 1,
0.3523907, 0.2145222, 1.54431, 0, 0.2039216, 1, 1,
0.3551539, 1.46791, -0.9098546, 0, 0.1960784, 1, 1,
0.3612456, -0.8444455, 3.881663, 0, 0.1882353, 1, 1,
0.3620473, 0.8175319, 0.5709302, 0, 0.1843137, 1, 1,
0.3677284, -0.9548714, 3.339832, 0, 0.1764706, 1, 1,
0.3683357, 1.457051, -1.19392, 0, 0.172549, 1, 1,
0.3686524, -0.1117464, 1.52529, 0, 0.1647059, 1, 1,
0.3726235, 1.18474, 0.4235506, 0, 0.1607843, 1, 1,
0.376603, -1.09287, 3.676892, 0, 0.1529412, 1, 1,
0.3799851, -0.3147527, 2.259823, 0, 0.1490196, 1, 1,
0.3822354, 0.916523, -0.08072567, 0, 0.1411765, 1, 1,
0.3829561, 0.4668851, -0.2169158, 0, 0.1372549, 1, 1,
0.3857301, -0.3463519, 2.89934, 0, 0.1294118, 1, 1,
0.3907492, -0.2468297, 0.7944478, 0, 0.1254902, 1, 1,
0.3910374, 0.5267373, -1.108971, 0, 0.1176471, 1, 1,
0.3939804, 1.233667, -0.385279, 0, 0.1137255, 1, 1,
0.3960704, -0.9462588, 1.975103, 0, 0.1058824, 1, 1,
0.3963686, -0.181492, 2.042516, 0, 0.09803922, 1, 1,
0.3968423, -1.503678, 3.075578, 0, 0.09411765, 1, 1,
0.3994163, -1.026428, 2.7939, 0, 0.08627451, 1, 1,
0.4045175, 0.660134, -1.004385, 0, 0.08235294, 1, 1,
0.4072576, 2.787129, 0.214481, 0, 0.07450981, 1, 1,
0.4088298, -1.211147, 4.023019, 0, 0.07058824, 1, 1,
0.4091856, 0.5659865, 0.5628157, 0, 0.0627451, 1, 1,
0.4092603, -0.7071125, 3.344718, 0, 0.05882353, 1, 1,
0.4097168, 1.927932, 1.14146, 0, 0.05098039, 1, 1,
0.4097191, -0.6955585, 3.047129, 0, 0.04705882, 1, 1,
0.4101112, 1.041874, 0.4459289, 0, 0.03921569, 1, 1,
0.4104338, 1.413444, 1.368567, 0, 0.03529412, 1, 1,
0.4124508, -0.5572119, 2.700866, 0, 0.02745098, 1, 1,
0.4149415, 1.050244, -0.5312203, 0, 0.02352941, 1, 1,
0.4195153, -2.369571, 3.742823, 0, 0.01568628, 1, 1,
0.4214078, 1.762573, 1.214913, 0, 0.01176471, 1, 1,
0.4282479, -0.2376385, 1.05582, 0, 0.003921569, 1, 1,
0.4325617, -0.4267446, 3.13359, 0.003921569, 0, 1, 1,
0.4327576, -0.8898804, 3.713826, 0.007843138, 0, 1, 1,
0.4327955, 0.03803379, 2.727752, 0.01568628, 0, 1, 1,
0.433953, -0.4747303, 1.877604, 0.01960784, 0, 1, 1,
0.4378416, -0.7218651, 3.130321, 0.02745098, 0, 1, 1,
0.437921, 0.218351, 2.520842, 0.03137255, 0, 1, 1,
0.4396342, 0.6380765, 1.171589, 0.03921569, 0, 1, 1,
0.4420765, 0.3704479, 1.152436, 0.04313726, 0, 1, 1,
0.4421326, 0.4487671, 0.08220815, 0.05098039, 0, 1, 1,
0.4436958, -1.045155, 3.04095, 0.05490196, 0, 1, 1,
0.443736, 1.547012, 1.240878, 0.0627451, 0, 1, 1,
0.4453042, 0.7665578, -0.3304907, 0.06666667, 0, 1, 1,
0.4517143, -0.06991183, 3.604592, 0.07450981, 0, 1, 1,
0.4530814, -0.02534717, 3.156814, 0.07843138, 0, 1, 1,
0.4555901, 0.989565, 0.961313, 0.08627451, 0, 1, 1,
0.455763, 1.168895, -0.5766388, 0.09019608, 0, 1, 1,
0.4567351, 0.0517684, -0.7105633, 0.09803922, 0, 1, 1,
0.4574687, -1.430504, 3.052804, 0.1058824, 0, 1, 1,
0.4577866, 0.7179809, 2.289678, 0.1098039, 0, 1, 1,
0.4589711, -1.187952, 4.338869, 0.1176471, 0, 1, 1,
0.4595616, -1.3935, 2.191602, 0.1215686, 0, 1, 1,
0.4637516, -0.8934574, 1.939927, 0.1294118, 0, 1, 1,
0.4653232, -0.1036476, 1.941484, 0.1333333, 0, 1, 1,
0.4663899, 0.04549074, 1.239639, 0.1411765, 0, 1, 1,
0.4695618, 0.1115752, 0.03367078, 0.145098, 0, 1, 1,
0.4729805, -0.9947024, 4.387379, 0.1529412, 0, 1, 1,
0.4773412, -1.086371, 2.717519, 0.1568628, 0, 1, 1,
0.4784871, -0.1280007, 1.900931, 0.1647059, 0, 1, 1,
0.4837138, 1.247439, 0.5818047, 0.1686275, 0, 1, 1,
0.4850248, 2.208734, -0.3467135, 0.1764706, 0, 1, 1,
0.4879896, -0.7894899, 1.619618, 0.1803922, 0, 1, 1,
0.4911941, 0.9420062, -0.9614537, 0.1882353, 0, 1, 1,
0.49416, 0.2752046, 1.884967, 0.1921569, 0, 1, 1,
0.4987853, 0.5176425, 0.09779804, 0.2, 0, 1, 1,
0.5053953, -1.580997, 1.910351, 0.2078431, 0, 1, 1,
0.5055813, -0.9315255, 1.589959, 0.2117647, 0, 1, 1,
0.5070326, 1.121083, 0.1030346, 0.2196078, 0, 1, 1,
0.5116649, -0.1337413, 1.135667, 0.2235294, 0, 1, 1,
0.5123386, 1.556386, 0.1776221, 0.2313726, 0, 1, 1,
0.5126494, -1.057348, 3.840829, 0.2352941, 0, 1, 1,
0.5143422, 1.251231, 0.7129164, 0.2431373, 0, 1, 1,
0.524191, 0.8578501, 2.104676, 0.2470588, 0, 1, 1,
0.5354476, -0.6670328, 2.328044, 0.254902, 0, 1, 1,
0.5376272, 1.383124, 0.5926201, 0.2588235, 0, 1, 1,
0.5430107, 0.4508476, 1.014053, 0.2666667, 0, 1, 1,
0.5470272, -0.2282349, 1.977425, 0.2705882, 0, 1, 1,
0.5481506, 0.8673036, 0.5849646, 0.2784314, 0, 1, 1,
0.5536174, -0.4167463, 1.768867, 0.282353, 0, 1, 1,
0.5566661, -1.300296, 3.21331, 0.2901961, 0, 1, 1,
0.5640116, -0.7810259, 2.851018, 0.2941177, 0, 1, 1,
0.5656944, -0.8055933, 2.86483, 0.3019608, 0, 1, 1,
0.5684883, -0.3961741, 1.730847, 0.3098039, 0, 1, 1,
0.5710778, -2.460795, 3.862222, 0.3137255, 0, 1, 1,
0.575322, -1.099162, 1.32097, 0.3215686, 0, 1, 1,
0.5847781, 0.2306939, 1.27031, 0.3254902, 0, 1, 1,
0.5864304, 1.860031, 0.09414618, 0.3333333, 0, 1, 1,
0.5870614, 0.4883406, -0.4358875, 0.3372549, 0, 1, 1,
0.5871118, 0.09191336, -0.2921111, 0.345098, 0, 1, 1,
0.5888041, -1.531638, 3.100197, 0.3490196, 0, 1, 1,
0.5893372, -0.1819313, 2.528847, 0.3568628, 0, 1, 1,
0.5909635, -0.2024478, 1.345988, 0.3607843, 0, 1, 1,
0.5938206, 2.142268, 0.3079654, 0.3686275, 0, 1, 1,
0.5997709, -0.1807245, 2.878611, 0.372549, 0, 1, 1,
0.6084868, -0.5045838, 2.705413, 0.3803922, 0, 1, 1,
0.6116893, -0.4158573, 1.599926, 0.3843137, 0, 1, 1,
0.6169682, -0.693705, 0.4254707, 0.3921569, 0, 1, 1,
0.6189336, -0.4539788, 3.374534, 0.3960784, 0, 1, 1,
0.6191215, 0.4259998, -1.470546, 0.4039216, 0, 1, 1,
0.6193104, 0.323074, 2.324175, 0.4117647, 0, 1, 1,
0.6195827, 0.2339317, 0.7430892, 0.4156863, 0, 1, 1,
0.6235295, -0.4380674, 2.120957, 0.4235294, 0, 1, 1,
0.6245996, 0.008436805, 2.759617, 0.427451, 0, 1, 1,
0.6247473, -1.641974, 1.168779, 0.4352941, 0, 1, 1,
0.62774, 1.145452, 0.8972291, 0.4392157, 0, 1, 1,
0.6281089, -0.7061812, 2.616329, 0.4470588, 0, 1, 1,
0.6291553, 1.7526, -0.9205909, 0.4509804, 0, 1, 1,
0.6294435, -0.7108487, 3.165585, 0.4588235, 0, 1, 1,
0.6300067, -1.407441, 5.651046, 0.4627451, 0, 1, 1,
0.6324263, -0.007730346, 2.053406, 0.4705882, 0, 1, 1,
0.6336206, 1.275409, 1.259415, 0.4745098, 0, 1, 1,
0.6345731, 0.2363078, 2.160409, 0.4823529, 0, 1, 1,
0.6375904, -0.1616432, 1.643138, 0.4862745, 0, 1, 1,
0.6416553, -0.3533413, 1.220774, 0.4941176, 0, 1, 1,
0.6450576, 0.8980527, -0.1360093, 0.5019608, 0, 1, 1,
0.6451787, 0.9578203, 1.693036, 0.5058824, 0, 1, 1,
0.6472525, -0.6259449, 3.139929, 0.5137255, 0, 1, 1,
0.6578135, -0.1509082, 1.783333, 0.5176471, 0, 1, 1,
0.6670212, 1.505801, -0.6395364, 0.5254902, 0, 1, 1,
0.6711046, -0.5011763, 3.634125, 0.5294118, 0, 1, 1,
0.6726074, 0.1293862, 2.022879, 0.5372549, 0, 1, 1,
0.6758274, -0.7103654, 1.886905, 0.5411765, 0, 1, 1,
0.6761484, 2.37105, -1.092728, 0.5490196, 0, 1, 1,
0.6780577, 0.2579355, 1.547205, 0.5529412, 0, 1, 1,
0.6798108, 0.8778467, 1.434207, 0.5607843, 0, 1, 1,
0.6839248, 1.610879, 0.1737075, 0.5647059, 0, 1, 1,
0.6843002, -1.099464, 4.710937, 0.572549, 0, 1, 1,
0.6854848, -0.9621195, 3.16768, 0.5764706, 0, 1, 1,
0.6870816, -1.247551, 3.960201, 0.5843138, 0, 1, 1,
0.6870878, 0.4858975, 2.898136, 0.5882353, 0, 1, 1,
0.6909025, -0.1876132, 2.315793, 0.5960785, 0, 1, 1,
0.6940124, -0.3135325, 1.906898, 0.6039216, 0, 1, 1,
0.7021042, 0.6657284, 1.443257, 0.6078432, 0, 1, 1,
0.7103491, 0.9405089, 0.8672535, 0.6156863, 0, 1, 1,
0.711364, 0.5105877, 2.629771, 0.6196079, 0, 1, 1,
0.7117283, 0.8533158, 0.9633117, 0.627451, 0, 1, 1,
0.71688, 0.4936078, 0.6332979, 0.6313726, 0, 1, 1,
0.7196129, 1.04167, -0.4594814, 0.6392157, 0, 1, 1,
0.7204955, -0.1672945, 3.318381, 0.6431373, 0, 1, 1,
0.7237154, 0.9847503, -0.03061722, 0.6509804, 0, 1, 1,
0.7277203, -0.3889922, 3.65713, 0.654902, 0, 1, 1,
0.7295859, 0.05650658, 0.760481, 0.6627451, 0, 1, 1,
0.7305901, 1.642768, -0.4668237, 0.6666667, 0, 1, 1,
0.7316382, -0.9183207, 2.229786, 0.6745098, 0, 1, 1,
0.7322243, -0.1818863, 1.991908, 0.6784314, 0, 1, 1,
0.7356852, -1.226491, 0.9088531, 0.6862745, 0, 1, 1,
0.7374504, 0.279614, 2.298676, 0.6901961, 0, 1, 1,
0.7446645, 2.892818, 0.5431867, 0.6980392, 0, 1, 1,
0.7495364, -0.5535952, 2.07308, 0.7058824, 0, 1, 1,
0.7561392, 0.2177788, 0.1725774, 0.7098039, 0, 1, 1,
0.7562537, 1.126899, -0.1120199, 0.7176471, 0, 1, 1,
0.7596134, 0.2092044, 0.8941031, 0.7215686, 0, 1, 1,
0.7606959, -0.4810759, 2.437052, 0.7294118, 0, 1, 1,
0.7624376, -1.368311, 3.428263, 0.7333333, 0, 1, 1,
0.7648275, -0.2547627, 2.367131, 0.7411765, 0, 1, 1,
0.7719153, 0.08396702, 1.543666, 0.7450981, 0, 1, 1,
0.7750989, 0.336663, 2.538759, 0.7529412, 0, 1, 1,
0.7922102, -0.2788187, 1.523288, 0.7568628, 0, 1, 1,
0.7925401, -0.3469962, 2.016125, 0.7647059, 0, 1, 1,
0.799602, 2.440896, 0.7483922, 0.7686275, 0, 1, 1,
0.8006539, -1.708183, 2.873293, 0.7764706, 0, 1, 1,
0.802268, 0.4672132, 1.225472, 0.7803922, 0, 1, 1,
0.8036041, 0.6532427, -0.226141, 0.7882353, 0, 1, 1,
0.8192919, -0.0001997336, 3.199631, 0.7921569, 0, 1, 1,
0.8255835, 1.400486, 2.757239, 0.8, 0, 1, 1,
0.8348303, 0.6930749, -0.07166722, 0.8078431, 0, 1, 1,
0.8371785, -0.6615534, 1.002642, 0.8117647, 0, 1, 1,
0.8382728, 0.1422075, 3.354569, 0.8196079, 0, 1, 1,
0.8456135, -1.033708, 1.440117, 0.8235294, 0, 1, 1,
0.8485618, 1.685053, -0.4640809, 0.8313726, 0, 1, 1,
0.8570158, -0.7098058, 2.147001, 0.8352941, 0, 1, 1,
0.8576527, 0.3114474, 0.6441062, 0.8431373, 0, 1, 1,
0.8597917, -0.5334055, 0.9593026, 0.8470588, 0, 1, 1,
0.8609823, 0.6394952, 2.421057, 0.854902, 0, 1, 1,
0.8616183, -0.4018784, 5.221064, 0.8588235, 0, 1, 1,
0.8619543, -0.8450338, 1.779832, 0.8666667, 0, 1, 1,
0.8674433, -0.1979938, 3.042904, 0.8705882, 0, 1, 1,
0.874003, 0.001641975, 1.097858, 0.8784314, 0, 1, 1,
0.8873531, -1.847423, 0.9098653, 0.8823529, 0, 1, 1,
0.8875011, 0.1503929, 0.8312004, 0.8901961, 0, 1, 1,
0.8906019, 2.135096, -1.242576, 0.8941177, 0, 1, 1,
0.8924215, 1.441329, -1.535929, 0.9019608, 0, 1, 1,
0.8954505, 0.5704392, 2.260226, 0.9098039, 0, 1, 1,
0.9001898, 1.729857, -0.03468535, 0.9137255, 0, 1, 1,
0.9040569, -0.6224418, 2.904646, 0.9215686, 0, 1, 1,
0.9041284, -0.8133456, 1.788536, 0.9254902, 0, 1, 1,
0.9060355, 0.7410385, 0.9755098, 0.9333333, 0, 1, 1,
0.9118649, -1.808471, 1.256054, 0.9372549, 0, 1, 1,
0.914112, -0.7199447, 2.790192, 0.945098, 0, 1, 1,
0.9144686, 1.312619, -0.09137102, 0.9490196, 0, 1, 1,
0.9167308, 0.2293308, 2.765941, 0.9568627, 0, 1, 1,
0.9200583, -0.6683888, 2.433765, 0.9607843, 0, 1, 1,
0.9214284, -0.9037234, 2.25045, 0.9686275, 0, 1, 1,
0.9258012, 0.8001515, 1.143279, 0.972549, 0, 1, 1,
0.9260299, 0.206102, 2.786159, 0.9803922, 0, 1, 1,
0.9313448, -0.08572853, 1.524899, 0.9843137, 0, 1, 1,
0.9332646, -0.1244456, 0.5332261, 0.9921569, 0, 1, 1,
0.9368161, -1.577712, 1.400031, 0.9960784, 0, 1, 1,
0.937539, 0.1311655, 1.387515, 1, 0, 0.9960784, 1,
0.9388793, -0.8890995, 3.340034, 1, 0, 0.9882353, 1,
0.9398341, 0.05530619, 1.295602, 1, 0, 0.9843137, 1,
0.94026, 0.5974558, 2.387686, 1, 0, 0.9764706, 1,
0.9520814, -0.09502855, 1.403037, 1, 0, 0.972549, 1,
0.9541793, -0.50348, 3.158326, 1, 0, 0.9647059, 1,
0.9546268, 2.316354, 1.162599, 1, 0, 0.9607843, 1,
0.9643912, -2.118443, 3.132606, 1, 0, 0.9529412, 1,
0.9657624, -0.02811346, 2.45298, 1, 0, 0.9490196, 1,
0.9666083, -0.401581, 1.31319, 1, 0, 0.9411765, 1,
0.983085, 0.7879297, 1.036649, 1, 0, 0.9372549, 1,
0.9852462, -0.468565, 1.828807, 1, 0, 0.9294118, 1,
0.9861956, -1.070246, 2.657984, 1, 0, 0.9254902, 1,
0.9864413, -1.320836, 3.277041, 1, 0, 0.9176471, 1,
0.9871147, 0.5478425, 1.413952, 1, 0, 0.9137255, 1,
0.9872922, 1.489555, 0.2182007, 1, 0, 0.9058824, 1,
0.9973089, 0.06639434, 1.506679, 1, 0, 0.9019608, 1,
1.002434, 0.003700513, 4.161187, 1, 0, 0.8941177, 1,
1.013232, 0.5308572, 0.6906493, 1, 0, 0.8862745, 1,
1.015708, -0.7505104, 1.904067, 1, 0, 0.8823529, 1,
1.017023, -0.02854925, 2.779311, 1, 0, 0.8745098, 1,
1.031768, -0.4946061, 2.222977, 1, 0, 0.8705882, 1,
1.040713, -1.84052, 1.70175, 1, 0, 0.8627451, 1,
1.057168, -0.3330764, 1.705077, 1, 0, 0.8588235, 1,
1.064649, -0.005591741, 1.513921, 1, 0, 0.8509804, 1,
1.071509, 1.538626, -0.6697235, 1, 0, 0.8470588, 1,
1.078181, -0.3623741, 2.711531, 1, 0, 0.8392157, 1,
1.078399, -0.3572904, 0.6514024, 1, 0, 0.8352941, 1,
1.090932, -0.4785914, 0.7430853, 1, 0, 0.827451, 1,
1.093587, 0.9228127, 0.9804485, 1, 0, 0.8235294, 1,
1.094276, 1.140412, 0.1547615, 1, 0, 0.8156863, 1,
1.095777, -0.09702428, 0.4127991, 1, 0, 0.8117647, 1,
1.099905, -1.09843, 3.182646, 1, 0, 0.8039216, 1,
1.105538, 0.3393254, 1.890786, 1, 0, 0.7960784, 1,
1.105735, -0.1202065, 2.406892, 1, 0, 0.7921569, 1,
1.106486, 0.16906, 0.7087247, 1, 0, 0.7843137, 1,
1.1079, -1.105922, 1.724562, 1, 0, 0.7803922, 1,
1.119536, 0.7741313, 1.779848, 1, 0, 0.772549, 1,
1.121072, -0.4849429, 1.595482, 1, 0, 0.7686275, 1,
1.121256, 0.9828401, 2.899815, 1, 0, 0.7607843, 1,
1.130546, -0.4037467, 0.6357093, 1, 0, 0.7568628, 1,
1.130985, -0.3763439, 1.35926, 1, 0, 0.7490196, 1,
1.131589, 0.7763779, -0.01937267, 1, 0, 0.7450981, 1,
1.142941, -0.8393949, 2.322608, 1, 0, 0.7372549, 1,
1.145504, -2.04492, 2.621063, 1, 0, 0.7333333, 1,
1.147269, 0.4764404, 0.7260656, 1, 0, 0.7254902, 1,
1.149217, -0.308428, 1.534292, 1, 0, 0.7215686, 1,
1.152173, -1.324959, 1.856421, 1, 0, 0.7137255, 1,
1.167735, 0.301382, 1.031008, 1, 0, 0.7098039, 1,
1.170966, -1.246163, 2.233231, 1, 0, 0.7019608, 1,
1.172699, -1.436123, 2.537262, 1, 0, 0.6941177, 1,
1.1771, -0.5876932, 2.002084, 1, 0, 0.6901961, 1,
1.179561, 1.262595, 1.960652, 1, 0, 0.682353, 1,
1.18136, 0.2497075, 0.6654477, 1, 0, 0.6784314, 1,
1.181587, -2.070065, 3.887415, 1, 0, 0.6705883, 1,
1.182269, 0.5933726, 1.09807, 1, 0, 0.6666667, 1,
1.192222, 0.3352126, 1.504142, 1, 0, 0.6588235, 1,
1.195859, 0.5354224, -0.0400925, 1, 0, 0.654902, 1,
1.19987, 0.1545054, 0.1125321, 1, 0, 0.6470588, 1,
1.202051, 0.7735754, 0.1088664, 1, 0, 0.6431373, 1,
1.203397, 0.6936151, 1.92959, 1, 0, 0.6352941, 1,
1.221323, 1.161008, -0.04765177, 1, 0, 0.6313726, 1,
1.230782, 1.37139, 1.021955, 1, 0, 0.6235294, 1,
1.231573, 0.09524846, 0.7681493, 1, 0, 0.6196079, 1,
1.24068, -0.1694481, 1.040883, 1, 0, 0.6117647, 1,
1.242139, -0.04542689, 0.8972176, 1, 0, 0.6078432, 1,
1.242425, 0.7380776, 0.2237399, 1, 0, 0.6, 1,
1.245731, 0.2797508, 1.354796, 1, 0, 0.5921569, 1,
1.255958, 0.302762, 1.064473, 1, 0, 0.5882353, 1,
1.260657, 0.3191194, 2.10344, 1, 0, 0.5803922, 1,
1.273929, 0.3357216, 3.07198, 1, 0, 0.5764706, 1,
1.27473, 0.5042458, 1.286489, 1, 0, 0.5686275, 1,
1.277296, -2.318859, 3.142391, 1, 0, 0.5647059, 1,
1.278637, 0.7159593, 2.027412, 1, 0, 0.5568628, 1,
1.289476, -2.077143, 2.147129, 1, 0, 0.5529412, 1,
1.301915, -1.358469, 2.788206, 1, 0, 0.5450981, 1,
1.303349, 0.07289097, 2.742855, 1, 0, 0.5411765, 1,
1.307069, 1.195478, 1.006634, 1, 0, 0.5333334, 1,
1.317438, -3.827613, 3.148552, 1, 0, 0.5294118, 1,
1.341586, 0.1187849, 1.843925, 1, 0, 0.5215687, 1,
1.354859, -2.808746, 2.323757, 1, 0, 0.5176471, 1,
1.357882, 0.4766353, 1.428692, 1, 0, 0.509804, 1,
1.372641, 0.4147226, 0.8845021, 1, 0, 0.5058824, 1,
1.378597, 0.8703389, 1.768629, 1, 0, 0.4980392, 1,
1.378891, -0.3235261, 0.03309158, 1, 0, 0.4901961, 1,
1.388819, 0.4784224, 0.3438133, 1, 0, 0.4862745, 1,
1.392726, -1.942182, 1.709068, 1, 0, 0.4784314, 1,
1.401998, -1.69814, 2.466488, 1, 0, 0.4745098, 1,
1.408799, 1.036201, 1.670514, 1, 0, 0.4666667, 1,
1.415118, 1.705631, -0.6162815, 1, 0, 0.4627451, 1,
1.44109, 0.6438448, 1.567152, 1, 0, 0.454902, 1,
1.445774, 0.6665058, -0.05330038, 1, 0, 0.4509804, 1,
1.445912, 0.563646, 0.2297536, 1, 0, 0.4431373, 1,
1.448146, -0.8466592, 1.957854, 1, 0, 0.4392157, 1,
1.448161, 0.5813405, 2.043966, 1, 0, 0.4313726, 1,
1.450277, 0.5659214, 1.12792, 1, 0, 0.427451, 1,
1.452385, 1.598122, -1.192112, 1, 0, 0.4196078, 1,
1.456908, 0.860378, 1.839649, 1, 0, 0.4156863, 1,
1.458402, 0.5538868, 1.251294, 1, 0, 0.4078431, 1,
1.460719, -1.101749, 1.798809, 1, 0, 0.4039216, 1,
1.484346, 0.8534099, 1.508945, 1, 0, 0.3960784, 1,
1.484963, 0.02105691, -0.08149128, 1, 0, 0.3882353, 1,
1.491869, -0.4821038, 1.60963, 1, 0, 0.3843137, 1,
1.499616, -1.936444, 2.622268, 1, 0, 0.3764706, 1,
1.500166, -0.2450436, 1.905613, 1, 0, 0.372549, 1,
1.503837, 0.1266628, 2.604828, 1, 0, 0.3647059, 1,
1.514641, -1.537088, 4.241472, 1, 0, 0.3607843, 1,
1.515531, 1.631343, 0.87698, 1, 0, 0.3529412, 1,
1.525593, 0.423826, 0.7019982, 1, 0, 0.3490196, 1,
1.532093, 0.5044527, 0.6327537, 1, 0, 0.3411765, 1,
1.535928, -0.6356546, 3.649298, 1, 0, 0.3372549, 1,
1.542738, 0.6768141, 0.9515406, 1, 0, 0.3294118, 1,
1.561506, 1.044532, -0.3783464, 1, 0, 0.3254902, 1,
1.569742, -0.768544, 2.11904, 1, 0, 0.3176471, 1,
1.583238, 0.1057122, 0.132887, 1, 0, 0.3137255, 1,
1.586642, -0.9541087, 2.516822, 1, 0, 0.3058824, 1,
1.59841, -1.405516, 2.162433, 1, 0, 0.2980392, 1,
1.617008, -0.3620166, 1.184409, 1, 0, 0.2941177, 1,
1.647469, 2.10335, -0.1031024, 1, 0, 0.2862745, 1,
1.653793, 1.293529, -1.053346, 1, 0, 0.282353, 1,
1.683889, -0.1780525, 1.270045, 1, 0, 0.2745098, 1,
1.713331, 0.7683389, 0.714465, 1, 0, 0.2705882, 1,
1.736074, -0.7375289, 0.3663037, 1, 0, 0.2627451, 1,
1.74038, -1.336645, 3.338965, 1, 0, 0.2588235, 1,
1.747128, 0.1463011, 1.545396, 1, 0, 0.2509804, 1,
1.756584, -1.250041, 2.50142, 1, 0, 0.2470588, 1,
1.764426, -1.030889, 3.291229, 1, 0, 0.2392157, 1,
1.77569, 0.4169218, 1.918093, 1, 0, 0.2352941, 1,
1.805996, -0.8496192, 2.677141, 1, 0, 0.227451, 1,
1.825571, 0.2430837, 2.877758, 1, 0, 0.2235294, 1,
1.828394, -1.299531, 2.191803, 1, 0, 0.2156863, 1,
1.831863, -0.09609125, 1.112483, 1, 0, 0.2117647, 1,
1.847981, -2.263836, 3.516857, 1, 0, 0.2039216, 1,
1.897209, 0.2257457, 3.791303, 1, 0, 0.1960784, 1,
1.898562, 0.4817858, 0.5790973, 1, 0, 0.1921569, 1,
1.900857, -0.1820814, 1.268504, 1, 0, 0.1843137, 1,
1.907032, -0.275811, 1.264727, 1, 0, 0.1803922, 1,
1.950029, 1.110484, 1.20652, 1, 0, 0.172549, 1,
1.971914, 1.41525, 1.620178, 1, 0, 0.1686275, 1,
1.974415, 1.583989, 0.6141644, 1, 0, 0.1607843, 1,
2.006839, 0.1441111, 1.611441, 1, 0, 0.1568628, 1,
2.009352, 1.196293, 1.897362, 1, 0, 0.1490196, 1,
2.01899, 0.474593, 1.195976, 1, 0, 0.145098, 1,
2.03896, 0.5289945, -0.01313785, 1, 0, 0.1372549, 1,
2.077731, -0.418778, 0.8855666, 1, 0, 0.1333333, 1,
2.093274, -1.086842, 2.839543, 1, 0, 0.1254902, 1,
2.09677, -0.4668307, 1.893886, 1, 0, 0.1215686, 1,
2.124551, 1.361718, 2.759585, 1, 0, 0.1137255, 1,
2.128303, 0.139481, -0.261075, 1, 0, 0.1098039, 1,
2.129901, -1.73237, 2.498729, 1, 0, 0.1019608, 1,
2.179472, -1.808523, 1.709236, 1, 0, 0.09411765, 1,
2.187603, -1.266045, 3.223373, 1, 0, 0.09019608, 1,
2.219735, 0.4776759, 0.08584118, 1, 0, 0.08235294, 1,
2.240962, 0.9075736, 0.9899793, 1, 0, 0.07843138, 1,
2.247944, 0.9060101, 0.8575408, 1, 0, 0.07058824, 1,
2.279635, 0.339563, -1.023812, 1, 0, 0.06666667, 1,
2.29134, -0.7869025, 2.095214, 1, 0, 0.05882353, 1,
2.302164, -0.5802543, 0.3970304, 1, 0, 0.05490196, 1,
2.341869, -0.9021333, 0.8198254, 1, 0, 0.04705882, 1,
2.356385, 0.9893116, 2.034928, 1, 0, 0.04313726, 1,
2.387291, 1.007358, 0.7428602, 1, 0, 0.03529412, 1,
2.478238, 2.358905, 2.23888, 1, 0, 0.03137255, 1,
2.705046, -0.5812739, 1.943446, 1, 0, 0.02352941, 1,
2.785288, 2.026152, 1.075827, 1, 0, 0.01960784, 1,
2.972919, -2.704427, 0.5270838, 1, 0, 0.01176471, 1,
3.545375, -1.026315, 2.105466, 1, 0, 0.007843138, 1
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
0.0322628, -5.010356, -7.562112, 0, -0.5, 0.5, 0.5,
0.0322628, -5.010356, -7.562112, 1, -0.5, 0.5, 0.5,
0.0322628, -5.010356, -7.562112, 1, 1.5, 0.5, 0.5,
0.0322628, -5.010356, -7.562112, 0, 1.5, 0.5, 0.5
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
-4.671795, -0.3386974, -7.562112, 0, -0.5, 0.5, 0.5,
-4.671795, -0.3386974, -7.562112, 1, -0.5, 0.5, 0.5,
-4.671795, -0.3386974, -7.562112, 1, 1.5, 0.5, 0.5,
-4.671795, -0.3386974, -7.562112, 0, 1.5, 0.5, 0.5
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
-4.671795, -5.010356, 0.001983166, 0, -0.5, 0.5, 0.5,
-4.671795, -5.010356, 0.001983166, 1, -0.5, 0.5, 0.5,
-4.671795, -5.010356, 0.001983166, 1, 1.5, 0.5, 0.5,
-4.671795, -5.010356, 0.001983166, 0, 1.5, 0.5, 0.5
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
-2, -3.932281, -5.816551,
2, -3.932281, -5.816551,
-2, -3.932281, -5.816551,
-2, -4.11196, -6.107478,
0, -3.932281, -5.816551,
0, -4.11196, -6.107478,
2, -3.932281, -5.816551,
2, -4.11196, -6.107478
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
-2, -4.471318, -6.689332, 0, -0.5, 0.5, 0.5,
-2, -4.471318, -6.689332, 1, -0.5, 0.5, 0.5,
-2, -4.471318, -6.689332, 1, 1.5, 0.5, 0.5,
-2, -4.471318, -6.689332, 0, 1.5, 0.5, 0.5,
0, -4.471318, -6.689332, 0, -0.5, 0.5, 0.5,
0, -4.471318, -6.689332, 1, -0.5, 0.5, 0.5,
0, -4.471318, -6.689332, 1, 1.5, 0.5, 0.5,
0, -4.471318, -6.689332, 0, 1.5, 0.5, 0.5,
2, -4.471318, -6.689332, 0, -0.5, 0.5, 0.5,
2, -4.471318, -6.689332, 1, -0.5, 0.5, 0.5,
2, -4.471318, -6.689332, 1, 1.5, 0.5, 0.5,
2, -4.471318, -6.689332, 0, 1.5, 0.5, 0.5
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
-3.586243, -3, -5.816551,
-3.586243, 3, -5.816551,
-3.586243, -3, -5.816551,
-3.767169, -3, -6.107478,
-3.586243, -2, -5.816551,
-3.767169, -2, -6.107478,
-3.586243, -1, -5.816551,
-3.767169, -1, -6.107478,
-3.586243, 0, -5.816551,
-3.767169, 0, -6.107478,
-3.586243, 1, -5.816551,
-3.767169, 1, -6.107478,
-3.586243, 2, -5.816551,
-3.767169, 2, -6.107478,
-3.586243, 3, -5.816551,
-3.767169, 3, -6.107478
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
-4.129019, -3, -6.689332, 0, -0.5, 0.5, 0.5,
-4.129019, -3, -6.689332, 1, -0.5, 0.5, 0.5,
-4.129019, -3, -6.689332, 1, 1.5, 0.5, 0.5,
-4.129019, -3, -6.689332, 0, 1.5, 0.5, 0.5,
-4.129019, -2, -6.689332, 0, -0.5, 0.5, 0.5,
-4.129019, -2, -6.689332, 1, -0.5, 0.5, 0.5,
-4.129019, -2, -6.689332, 1, 1.5, 0.5, 0.5,
-4.129019, -2, -6.689332, 0, 1.5, 0.5, 0.5,
-4.129019, -1, -6.689332, 0, -0.5, 0.5, 0.5,
-4.129019, -1, -6.689332, 1, -0.5, 0.5, 0.5,
-4.129019, -1, -6.689332, 1, 1.5, 0.5, 0.5,
-4.129019, -1, -6.689332, 0, 1.5, 0.5, 0.5,
-4.129019, 0, -6.689332, 0, -0.5, 0.5, 0.5,
-4.129019, 0, -6.689332, 1, -0.5, 0.5, 0.5,
-4.129019, 0, -6.689332, 1, 1.5, 0.5, 0.5,
-4.129019, 0, -6.689332, 0, 1.5, 0.5, 0.5,
-4.129019, 1, -6.689332, 0, -0.5, 0.5, 0.5,
-4.129019, 1, -6.689332, 1, -0.5, 0.5, 0.5,
-4.129019, 1, -6.689332, 1, 1.5, 0.5, 0.5,
-4.129019, 1, -6.689332, 0, 1.5, 0.5, 0.5,
-4.129019, 2, -6.689332, 0, -0.5, 0.5, 0.5,
-4.129019, 2, -6.689332, 1, -0.5, 0.5, 0.5,
-4.129019, 2, -6.689332, 1, 1.5, 0.5, 0.5,
-4.129019, 2, -6.689332, 0, 1.5, 0.5, 0.5,
-4.129019, 3, -6.689332, 0, -0.5, 0.5, 0.5,
-4.129019, 3, -6.689332, 1, -0.5, 0.5, 0.5,
-4.129019, 3, -6.689332, 1, 1.5, 0.5, 0.5,
-4.129019, 3, -6.689332, 0, 1.5, 0.5, 0.5
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
-3.586243, -3.932281, -4,
-3.586243, -3.932281, 4,
-3.586243, -3.932281, -4,
-3.767169, -4.11196, -4,
-3.586243, -3.932281, -2,
-3.767169, -4.11196, -2,
-3.586243, -3.932281, 0,
-3.767169, -4.11196, 0,
-3.586243, -3.932281, 2,
-3.767169, -4.11196, 2,
-3.586243, -3.932281, 4,
-3.767169, -4.11196, 4
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
-4.129019, -4.471318, -4, 0, -0.5, 0.5, 0.5,
-4.129019, -4.471318, -4, 1, -0.5, 0.5, 0.5,
-4.129019, -4.471318, -4, 1, 1.5, 0.5, 0.5,
-4.129019, -4.471318, -4, 0, 1.5, 0.5, 0.5,
-4.129019, -4.471318, -2, 0, -0.5, 0.5, 0.5,
-4.129019, -4.471318, -2, 1, -0.5, 0.5, 0.5,
-4.129019, -4.471318, -2, 1, 1.5, 0.5, 0.5,
-4.129019, -4.471318, -2, 0, 1.5, 0.5, 0.5,
-4.129019, -4.471318, 0, 0, -0.5, 0.5, 0.5,
-4.129019, -4.471318, 0, 1, -0.5, 0.5, 0.5,
-4.129019, -4.471318, 0, 1, 1.5, 0.5, 0.5,
-4.129019, -4.471318, 0, 0, 1.5, 0.5, 0.5,
-4.129019, -4.471318, 2, 0, -0.5, 0.5, 0.5,
-4.129019, -4.471318, 2, 1, -0.5, 0.5, 0.5,
-4.129019, -4.471318, 2, 1, 1.5, 0.5, 0.5,
-4.129019, -4.471318, 2, 0, 1.5, 0.5, 0.5,
-4.129019, -4.471318, 4, 0, -0.5, 0.5, 0.5,
-4.129019, -4.471318, 4, 1, -0.5, 0.5, 0.5,
-4.129019, -4.471318, 4, 1, 1.5, 0.5, 0.5,
-4.129019, -4.471318, 4, 0, 1.5, 0.5, 0.5
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
-3.586243, -3.932281, -5.816551,
-3.586243, 3.254886, -5.816551,
-3.586243, -3.932281, 5.820518,
-3.586243, 3.254886, 5.820518,
-3.586243, -3.932281, -5.816551,
-3.586243, -3.932281, 5.820518,
-3.586243, 3.254886, -5.816551,
-3.586243, 3.254886, 5.820518,
-3.586243, -3.932281, -5.816551,
3.650769, -3.932281, -5.816551,
-3.586243, -3.932281, 5.820518,
3.650769, -3.932281, 5.820518,
-3.586243, 3.254886, -5.816551,
3.650769, 3.254886, -5.816551,
-3.586243, 3.254886, 5.820518,
3.650769, 3.254886, 5.820518,
3.650769, -3.932281, -5.816551,
3.650769, 3.254886, -5.816551,
3.650769, -3.932281, 5.820518,
3.650769, 3.254886, 5.820518,
3.650769, -3.932281, -5.816551,
3.650769, -3.932281, 5.820518,
3.650769, 3.254886, -5.816551,
3.650769, 3.254886, 5.820518
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
var radius = 8.262926;
var distance = 36.76269;
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
mvMatrix.translate( -0.0322628, 0.3386974, -0.001983166 );
mvMatrix.scale( 1.234493, 1.243054, 0.7677223 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.76269);
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


