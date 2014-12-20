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
-2.633193, 0.7322275, -1.688943, 1, 0, 0, 1,
-2.626924, -0.346367, -2.619087, 1, 0.007843138, 0, 1,
-2.52661, 1.930372, -2.592535, 1, 0.01176471, 0, 1,
-2.490313, -1.635845, -1.816266, 1, 0.01960784, 0, 1,
-2.371516, 0.5884555, -1.006072, 1, 0.02352941, 0, 1,
-2.29415, 0.8279424, -0.2728749, 1, 0.03137255, 0, 1,
-2.290102, -0.09012736, -2.432385, 1, 0.03529412, 0, 1,
-2.200437, -0.8597066, -4.320473, 1, 0.04313726, 0, 1,
-2.168462, 0.007072489, -1.40155, 1, 0.04705882, 0, 1,
-2.144108, -1.337057, -1.819655, 1, 0.05490196, 0, 1,
-2.129393, -1.043997, -2.575445, 1, 0.05882353, 0, 1,
-2.080914, -1.112915, -1.84247, 1, 0.06666667, 0, 1,
-2.076592, -0.09650215, -1.824504, 1, 0.07058824, 0, 1,
-2.053851, -0.6591261, -0.2780009, 1, 0.07843138, 0, 1,
-2.044426, -0.04937106, -0.06665937, 1, 0.08235294, 0, 1,
-2.007734, 2.900666, -0.2640914, 1, 0.09019608, 0, 1,
-2.007221, -0.7979823, -4.181162, 1, 0.09411765, 0, 1,
-2.002546, 0.7548757, -0.7897295, 1, 0.1019608, 0, 1,
-2.002533, -0.2001901, -1.331756, 1, 0.1098039, 0, 1,
-1.941563, -0.256973, -1.114609, 1, 0.1137255, 0, 1,
-1.940074, 0.9853061, -2.135165, 1, 0.1215686, 0, 1,
-1.937, 1.766271, -0.465312, 1, 0.1254902, 0, 1,
-1.9346, 0.5061712, -0.8330991, 1, 0.1333333, 0, 1,
-1.916525, 0.6297708, -1.967951, 1, 0.1372549, 0, 1,
-1.901858, 1.125887, -0.05221461, 1, 0.145098, 0, 1,
-1.895514, 1.967612, -0.6957932, 1, 0.1490196, 0, 1,
-1.893343, -1.630949, -2.342589, 1, 0.1568628, 0, 1,
-1.890307, 0.9189123, -1.282365, 1, 0.1607843, 0, 1,
-1.865942, -0.3592194, -1.12993, 1, 0.1686275, 0, 1,
-1.849762, 0.9941789, -1.283815, 1, 0.172549, 0, 1,
-1.841874, -0.1167738, -1.898488, 1, 0.1803922, 0, 1,
-1.824546, 1.39887, -0.3145699, 1, 0.1843137, 0, 1,
-1.797126, 0.8344857, -3.302443, 1, 0.1921569, 0, 1,
-1.782143, -1.348424, -2.703458, 1, 0.1960784, 0, 1,
-1.767984, 1.249167, 0.07356763, 1, 0.2039216, 0, 1,
-1.752784, 0.3524904, -0.1393487, 1, 0.2117647, 0, 1,
-1.749426, 0.796837, -0.08730675, 1, 0.2156863, 0, 1,
-1.734056, -0.2205318, -2.02512, 1, 0.2235294, 0, 1,
-1.729434, -0.2959523, -0.3783155, 1, 0.227451, 0, 1,
-1.717099, 0.4493597, 0.2272829, 1, 0.2352941, 0, 1,
-1.681157, -1.533362, -1.987218, 1, 0.2392157, 0, 1,
-1.665491, -0.1480632, -1.964493, 1, 0.2470588, 0, 1,
-1.661339, 0.05830599, -0.9845867, 1, 0.2509804, 0, 1,
-1.652597, 0.07790209, -1.93962, 1, 0.2588235, 0, 1,
-1.629784, 0.1221756, -2.499132, 1, 0.2627451, 0, 1,
-1.618896, -0.159049, -2.569999, 1, 0.2705882, 0, 1,
-1.618637, 1.874739, 0.3451535, 1, 0.2745098, 0, 1,
-1.611647, 0.4878569, -1.741613, 1, 0.282353, 0, 1,
-1.610901, 0.4123764, -1.729596, 1, 0.2862745, 0, 1,
-1.609601, 1.120564, -0.9486623, 1, 0.2941177, 0, 1,
-1.604501, -0.3878619, -1.965726, 1, 0.3019608, 0, 1,
-1.582331, 1.153795, -1.747156, 1, 0.3058824, 0, 1,
-1.547741, 0.391434, -1.522219, 1, 0.3137255, 0, 1,
-1.52366, 0.7691093, -2.315027, 1, 0.3176471, 0, 1,
-1.51853, -1.281983, -0.4715864, 1, 0.3254902, 0, 1,
-1.5157, -0.02513112, -1.804555, 1, 0.3294118, 0, 1,
-1.514804, -0.2463546, -1.86018, 1, 0.3372549, 0, 1,
-1.506827, -1.2661, -1.405616, 1, 0.3411765, 0, 1,
-1.505972, -0.8733722, -1.830831, 1, 0.3490196, 0, 1,
-1.505816, 2.35302, -0.3855198, 1, 0.3529412, 0, 1,
-1.498264, -0.7833663, -0.4925183, 1, 0.3607843, 0, 1,
-1.496763, 0.5903526, -0.2127005, 1, 0.3647059, 0, 1,
-1.482939, -1.082654, -1.518896, 1, 0.372549, 0, 1,
-1.482451, 0.5768288, -2.563531, 1, 0.3764706, 0, 1,
-1.478146, 0.4554972, -1.125314, 1, 0.3843137, 0, 1,
-1.477298, 0.2929349, -2.655985, 1, 0.3882353, 0, 1,
-1.470586, 0.9359889, -1.828956, 1, 0.3960784, 0, 1,
-1.454305, -0.3142875, -0.7214966, 1, 0.4039216, 0, 1,
-1.446756, 0.1967159, -1.276012, 1, 0.4078431, 0, 1,
-1.433904, 1.087713, -1.473102, 1, 0.4156863, 0, 1,
-1.432998, -0.1796927, -1.60095, 1, 0.4196078, 0, 1,
-1.411703, 0.3361613, -1.505724, 1, 0.427451, 0, 1,
-1.411356, -0.278668, -3.252626, 1, 0.4313726, 0, 1,
-1.40373, 0.3737174, -3.063043, 1, 0.4392157, 0, 1,
-1.39617, 0.5815707, -0.823586, 1, 0.4431373, 0, 1,
-1.396008, -0.4310908, -1.215828, 1, 0.4509804, 0, 1,
-1.39378, -1.036515, -3.091985, 1, 0.454902, 0, 1,
-1.389231, -1.10372, -3.0772, 1, 0.4627451, 0, 1,
-1.381496, 0.5834431, -1.24138, 1, 0.4666667, 0, 1,
-1.374212, -1.774994, -2.550531, 1, 0.4745098, 0, 1,
-1.366563, 0.4862608, -1.260932, 1, 0.4784314, 0, 1,
-1.358883, -0.5150273, -3.409841, 1, 0.4862745, 0, 1,
-1.355503, -2.109536, -3.031679, 1, 0.4901961, 0, 1,
-1.354273, 1.009384, -0.2938382, 1, 0.4980392, 0, 1,
-1.345015, 0.1562712, -1.054918, 1, 0.5058824, 0, 1,
-1.344089, -0.4815607, -3.028499, 1, 0.509804, 0, 1,
-1.342997, 0.7609168, -1.449586, 1, 0.5176471, 0, 1,
-1.340865, -0.4406611, -1.640554, 1, 0.5215687, 0, 1,
-1.338289, 0.7753498, -1.460706, 1, 0.5294118, 0, 1,
-1.327078, 0.9565037, -1.761884, 1, 0.5333334, 0, 1,
-1.297695, 1.166003, -1.236116, 1, 0.5411765, 0, 1,
-1.294849, -0.3785641, -2.445673, 1, 0.5450981, 0, 1,
-1.291928, 1.680853, -1.614784, 1, 0.5529412, 0, 1,
-1.288373, -0.5283182, -1.48763, 1, 0.5568628, 0, 1,
-1.286111, 0.57626, -0.4085337, 1, 0.5647059, 0, 1,
-1.284751, 0.8755567, -1.94659, 1, 0.5686275, 0, 1,
-1.280016, -1.652795, -2.22322, 1, 0.5764706, 0, 1,
-1.274066, -1.719349, -3.090584, 1, 0.5803922, 0, 1,
-1.272717, 0.4859532, -0.09242052, 1, 0.5882353, 0, 1,
-1.264642, -1.406704, -2.080008, 1, 0.5921569, 0, 1,
-1.264138, 0.2593575, -2.695174, 1, 0.6, 0, 1,
-1.263929, -1.1935, -3.999243, 1, 0.6078432, 0, 1,
-1.254071, -0.375548, -1.686879, 1, 0.6117647, 0, 1,
-1.252498, 0.2398576, 0.09494004, 1, 0.6196079, 0, 1,
-1.251694, -0.5536392, -0.7889566, 1, 0.6235294, 0, 1,
-1.25135, 2.894088, -1.430664, 1, 0.6313726, 0, 1,
-1.250996, -2.443044, -3.165988, 1, 0.6352941, 0, 1,
-1.243282, -2.104691, -2.598119, 1, 0.6431373, 0, 1,
-1.238395, -1.649335, -2.537428, 1, 0.6470588, 0, 1,
-1.221543, 0.3022548, -1.172591, 1, 0.654902, 0, 1,
-1.215396, -1.703518, -2.201066, 1, 0.6588235, 0, 1,
-1.213491, 0.1010612, -0.6023438, 1, 0.6666667, 0, 1,
-1.204526, -0.1055946, -0.5597293, 1, 0.6705883, 0, 1,
-1.196378, 0.8086926, -0.6438746, 1, 0.6784314, 0, 1,
-1.196235, 0.4325359, -1.545349, 1, 0.682353, 0, 1,
-1.195144, -0.05191502, -1.743241, 1, 0.6901961, 0, 1,
-1.193838, 1.484264, -1.676541, 1, 0.6941177, 0, 1,
-1.192545, -1.107829, -2.560656, 1, 0.7019608, 0, 1,
-1.186325, 0.1120724, -0.5705999, 1, 0.7098039, 0, 1,
-1.186289, -0.6654817, -1.178245, 1, 0.7137255, 0, 1,
-1.183092, -0.8284694, -1.28807, 1, 0.7215686, 0, 1,
-1.18157, 1.606015, -0.9734585, 1, 0.7254902, 0, 1,
-1.176282, -0.9629363, -3.213315, 1, 0.7333333, 0, 1,
-1.166825, 0.8519584, -1.811206, 1, 0.7372549, 0, 1,
-1.166189, -0.3558459, -1.328822, 1, 0.7450981, 0, 1,
-1.154168, -0.5212411, -2.212501, 1, 0.7490196, 0, 1,
-1.146428, -0.6834559, -1.676126, 1, 0.7568628, 0, 1,
-1.141384, 0.1506868, -2.359605, 1, 0.7607843, 0, 1,
-1.139455, 0.007846601, -2.565821, 1, 0.7686275, 0, 1,
-1.132919, 0.6269101, -1.468691, 1, 0.772549, 0, 1,
-1.130297, 0.3541998, -1.261102, 1, 0.7803922, 0, 1,
-1.118822, -1.044947, -2.500377, 1, 0.7843137, 0, 1,
-1.106733, 0.7833359, -1.171806, 1, 0.7921569, 0, 1,
-1.10505, -0.4833072, -0.7765927, 1, 0.7960784, 0, 1,
-1.102625, 1.165709, -1.447576, 1, 0.8039216, 0, 1,
-1.093929, 0.6853675, 0.9087138, 1, 0.8117647, 0, 1,
-1.091487, 1.029075, -2.00614, 1, 0.8156863, 0, 1,
-1.086071, 0.8325176, -2.785991, 1, 0.8235294, 0, 1,
-1.072888, -0.8061488, -2.021193, 1, 0.827451, 0, 1,
-1.072252, 0.9860989, -1.157769, 1, 0.8352941, 0, 1,
-1.072188, -0.2750097, -0.8385836, 1, 0.8392157, 0, 1,
-1.070824, 0.7486814, -0.8151033, 1, 0.8470588, 0, 1,
-1.051523, -1.180905, -3.243984, 1, 0.8509804, 0, 1,
-1.049999, -0.3024618, -1.345881, 1, 0.8588235, 0, 1,
-1.035145, -0.5277132, -3.402871, 1, 0.8627451, 0, 1,
-1.034355, -1.199516, -3.623103, 1, 0.8705882, 0, 1,
-1.023998, -2.032195, -2.044896, 1, 0.8745098, 0, 1,
-1.01708, -1.247148, -2.892555, 1, 0.8823529, 0, 1,
-1.013456, -0.2732379, -1.507106, 1, 0.8862745, 0, 1,
-0.9997472, 1.808662, -0.6529809, 1, 0.8941177, 0, 1,
-0.9942902, -0.1969672, -3.188641, 1, 0.8980392, 0, 1,
-0.975324, 0.1526733, -3.169944, 1, 0.9058824, 0, 1,
-0.9730263, 0.1354302, -2.511244, 1, 0.9137255, 0, 1,
-0.9679543, -1.26809, -2.302196, 1, 0.9176471, 0, 1,
-0.9653684, -0.354058, -1.713595, 1, 0.9254902, 0, 1,
-0.9633747, 0.758948, -1.22136, 1, 0.9294118, 0, 1,
-0.9571933, -1.900459, -3.213036, 1, 0.9372549, 0, 1,
-0.9566464, 1.137598, 0.5076558, 1, 0.9411765, 0, 1,
-0.9510992, 1.936039, 0.1692519, 1, 0.9490196, 0, 1,
-0.9399564, 0.1867807, -1.550922, 1, 0.9529412, 0, 1,
-0.9307519, -0.6976315, -6.029392, 1, 0.9607843, 0, 1,
-0.9293078, -1.147429, -1.83973, 1, 0.9647059, 0, 1,
-0.917802, 1.10596, -1.451977, 1, 0.972549, 0, 1,
-0.9010081, 0.9728794, -0.9770828, 1, 0.9764706, 0, 1,
-0.894599, -0.7369358, -2.376449, 1, 0.9843137, 0, 1,
-0.89188, -0.005229749, -1.418254, 1, 0.9882353, 0, 1,
-0.8888413, 0.9507025, -0.4141997, 1, 0.9960784, 0, 1,
-0.8859558, 0.02622287, -0.604793, 0.9960784, 1, 0, 1,
-0.8801545, -0.05591498, -0.5979499, 0.9921569, 1, 0, 1,
-0.8664399, 0.347947, -0.6217843, 0.9843137, 1, 0, 1,
-0.8584644, 0.1226426, -0.9670672, 0.9803922, 1, 0, 1,
-0.8569694, 1.120513, -1.072626, 0.972549, 1, 0, 1,
-0.8537288, -1.951104, -1.771522, 0.9686275, 1, 0, 1,
-0.8504478, 2.319378, -0.02737342, 0.9607843, 1, 0, 1,
-0.8498513, 0.5058716, -2.285263, 0.9568627, 1, 0, 1,
-0.8491642, -2.024052, -4.69943, 0.9490196, 1, 0, 1,
-0.8483705, 0.9708737, -1.253831, 0.945098, 1, 0, 1,
-0.8453264, 0.111327, -2.095641, 0.9372549, 1, 0, 1,
-0.8420453, -0.07495574, -1.885803, 0.9333333, 1, 0, 1,
-0.8406438, -1.276157, -3.840346, 0.9254902, 1, 0, 1,
-0.8397099, -0.1874646, -1.386201, 0.9215686, 1, 0, 1,
-0.8380563, -0.3551993, -2.927001, 0.9137255, 1, 0, 1,
-0.8358852, 0.8507264, -1.212973, 0.9098039, 1, 0, 1,
-0.8335558, -1.409797, -1.574605, 0.9019608, 1, 0, 1,
-0.8334877, 1.07585, 0.4867265, 0.8941177, 1, 0, 1,
-0.8307541, 1.311001, 0.03384166, 0.8901961, 1, 0, 1,
-0.8268373, 0.2550139, -1.897369, 0.8823529, 1, 0, 1,
-0.8254874, -0.78688, -2.627995, 0.8784314, 1, 0, 1,
-0.8242645, 0.9277096, 2.343003, 0.8705882, 1, 0, 1,
-0.8079259, -0.06684458, -2.142662, 0.8666667, 1, 0, 1,
-0.8073652, 0.405299, -1.014459, 0.8588235, 1, 0, 1,
-0.7988733, 0.8004131, -0.07087526, 0.854902, 1, 0, 1,
-0.7982041, -0.6268381, -2.084001, 0.8470588, 1, 0, 1,
-0.7967951, 0.1663403, -1.603137, 0.8431373, 1, 0, 1,
-0.7964898, 0.9632306, -0.2155214, 0.8352941, 1, 0, 1,
-0.7946602, 0.423552, 0.1960073, 0.8313726, 1, 0, 1,
-0.7923085, 1.543472, -0.9343452, 0.8235294, 1, 0, 1,
-0.7914914, -2.591294, -1.432252, 0.8196079, 1, 0, 1,
-0.7909576, 0.06277137, -1.635901, 0.8117647, 1, 0, 1,
-0.7907324, 1.517918, -0.1052822, 0.8078431, 1, 0, 1,
-0.7890228, 0.807329, -0.02115979, 0.8, 1, 0, 1,
-0.7791186, 0.7091551, -0.4680933, 0.7921569, 1, 0, 1,
-0.7776856, -0.1637868, -2.6199, 0.7882353, 1, 0, 1,
-0.7755243, 0.1073482, -1.256168, 0.7803922, 1, 0, 1,
-0.7737765, 0.8839824, -1.750945, 0.7764706, 1, 0, 1,
-0.7722238, 0.2182985, -1.74536, 0.7686275, 1, 0, 1,
-0.7717003, -1.227347, -1.378091, 0.7647059, 1, 0, 1,
-0.7676987, 0.1602256, -2.526577, 0.7568628, 1, 0, 1,
-0.7670909, 0.1120659, -3.031173, 0.7529412, 1, 0, 1,
-0.7650403, -0.9502472, -1.966301, 0.7450981, 1, 0, 1,
-0.7641646, -0.03715366, -0.5294256, 0.7411765, 1, 0, 1,
-0.7637873, -1.275708, -1.68499, 0.7333333, 1, 0, 1,
-0.7592569, -0.05337808, -0.9070509, 0.7294118, 1, 0, 1,
-0.7470992, 1.525166, -0.5380918, 0.7215686, 1, 0, 1,
-0.7424225, -0.1568073, -1.391798, 0.7176471, 1, 0, 1,
-0.7411355, -0.03364671, -0.7522712, 0.7098039, 1, 0, 1,
-0.7323144, -0.1629327, -1.612885, 0.7058824, 1, 0, 1,
-0.7319586, 0.8375953, -1.569946, 0.6980392, 1, 0, 1,
-0.7262616, 0.5705888, 0.1200002, 0.6901961, 1, 0, 1,
-0.7071779, -0.2264243, -2.167127, 0.6862745, 1, 0, 1,
-0.7036707, 0.0579356, -2.227989, 0.6784314, 1, 0, 1,
-0.6985808, 0.1723503, -1.528651, 0.6745098, 1, 0, 1,
-0.6947613, 0.3443933, -1.461785, 0.6666667, 1, 0, 1,
-0.6934286, 0.2368837, -1.709791, 0.6627451, 1, 0, 1,
-0.6915144, 0.05905185, -1.342441, 0.654902, 1, 0, 1,
-0.6909401, 0.964748, -0.05514612, 0.6509804, 1, 0, 1,
-0.6907244, 1.08864, -1.030743, 0.6431373, 1, 0, 1,
-0.6888098, -0.3224706, -2.635973, 0.6392157, 1, 0, 1,
-0.6873621, 1.629856, 0.3750757, 0.6313726, 1, 0, 1,
-0.6861199, -0.06024216, -1.596444, 0.627451, 1, 0, 1,
-0.6834345, -1.116014, -3.990871, 0.6196079, 1, 0, 1,
-0.6828113, -2.570458, -2.216003, 0.6156863, 1, 0, 1,
-0.669979, 2.075804, -0.1675583, 0.6078432, 1, 0, 1,
-0.6656094, -1.812416, -2.114237, 0.6039216, 1, 0, 1,
-0.6618103, -0.4038392, -2.102241, 0.5960785, 1, 0, 1,
-0.6608814, 1.814626, -0.2686115, 0.5882353, 1, 0, 1,
-0.6589188, 0.9102408, -0.8085027, 0.5843138, 1, 0, 1,
-0.6559603, -0.5494611, -2.456997, 0.5764706, 1, 0, 1,
-0.6437435, 1.60635, -0.1837409, 0.572549, 1, 0, 1,
-0.6419547, -0.4241666, -2.368297, 0.5647059, 1, 0, 1,
-0.6416898, 0.9003512, -1.695382, 0.5607843, 1, 0, 1,
-0.6364532, 0.8253943, -0.1949613, 0.5529412, 1, 0, 1,
-0.6334919, -0.7036275, -2.076703, 0.5490196, 1, 0, 1,
-0.6324384, 0.9239846, -1.152271, 0.5411765, 1, 0, 1,
-0.6263923, 0.7524412, -0.1601829, 0.5372549, 1, 0, 1,
-0.625201, 2.132157, 1.646845, 0.5294118, 1, 0, 1,
-0.6210374, -0.6827729, -2.7967, 0.5254902, 1, 0, 1,
-0.6209233, 1.146788, -1.131104, 0.5176471, 1, 0, 1,
-0.6155302, 2.539237, -0.6392116, 0.5137255, 1, 0, 1,
-0.6151821, 0.1166875, -1.179015, 0.5058824, 1, 0, 1,
-0.6142683, -0.1933483, -0.5011362, 0.5019608, 1, 0, 1,
-0.6114313, 0.4206858, -1.827909, 0.4941176, 1, 0, 1,
-0.6086164, -2.835828, -2.963069, 0.4862745, 1, 0, 1,
-0.6077405, -0.3770253, -1.894571, 0.4823529, 1, 0, 1,
-0.5980356, -0.493532, -3.634886, 0.4745098, 1, 0, 1,
-0.5972878, -1.121833, -2.411135, 0.4705882, 1, 0, 1,
-0.5951841, -0.570952, -2.215044, 0.4627451, 1, 0, 1,
-0.5933999, -0.09085532, -2.229503, 0.4588235, 1, 0, 1,
-0.5922738, -0.6220449, -1.631083, 0.4509804, 1, 0, 1,
-0.5799038, 1.498273, -0.4386932, 0.4470588, 1, 0, 1,
-0.5777084, 0.8755483, -1.458342, 0.4392157, 1, 0, 1,
-0.5774411, 0.8595076, -0.491919, 0.4352941, 1, 0, 1,
-0.5765095, -0.2351209, -1.088932, 0.427451, 1, 0, 1,
-0.5746508, 0.2754683, -0.3201752, 0.4235294, 1, 0, 1,
-0.5686741, -0.8485125, -2.213056, 0.4156863, 1, 0, 1,
-0.5684919, 2.250566, -1.524876, 0.4117647, 1, 0, 1,
-0.5668841, 0.6976792, -2.020061, 0.4039216, 1, 0, 1,
-0.5610467, 0.2072812, -1.101734, 0.3960784, 1, 0, 1,
-0.5564879, 1.206161, -1.528955, 0.3921569, 1, 0, 1,
-0.5550012, -0.7005872, -2.866197, 0.3843137, 1, 0, 1,
-0.5480281, 0.5031658, -0.4867369, 0.3803922, 1, 0, 1,
-0.5478802, -1.092659, -3.757234, 0.372549, 1, 0, 1,
-0.5441934, 0.3488836, 1.973873, 0.3686275, 1, 0, 1,
-0.5439364, 0.7607514, 1.077729, 0.3607843, 1, 0, 1,
-0.5411142, 0.4187291, 0.211892, 0.3568628, 1, 0, 1,
-0.5406726, -0.1924111, -1.341455, 0.3490196, 1, 0, 1,
-0.539987, 1.567276, 0.1364229, 0.345098, 1, 0, 1,
-0.5398763, -0.08203803, -2.350067, 0.3372549, 1, 0, 1,
-0.5390231, -1.005046, -3.723495, 0.3333333, 1, 0, 1,
-0.5383017, -0.6206508, -2.370151, 0.3254902, 1, 0, 1,
-0.538277, -0.05550622, -2.777181, 0.3215686, 1, 0, 1,
-0.5334976, 0.5638655, -0.4921107, 0.3137255, 1, 0, 1,
-0.530308, -0.3221684, -1.858556, 0.3098039, 1, 0, 1,
-0.5258745, 0.1611204, -2.126221, 0.3019608, 1, 0, 1,
-0.5258611, 0.1394852, -2.095651, 0.2941177, 1, 0, 1,
-0.5246507, 0.7020796, -0.8729097, 0.2901961, 1, 0, 1,
-0.5210136, -0.0590045, -1.036746, 0.282353, 1, 0, 1,
-0.5201603, 0.8578333, -1.267091, 0.2784314, 1, 0, 1,
-0.5159323, 0.1976507, -2.617726, 0.2705882, 1, 0, 1,
-0.5144699, 1.341083, 0.4528027, 0.2666667, 1, 0, 1,
-0.506961, -1.332707, -1.08212, 0.2588235, 1, 0, 1,
-0.5067357, 1.977597, 1.099969, 0.254902, 1, 0, 1,
-0.5038438, -0.6386651, -1.489987, 0.2470588, 1, 0, 1,
-0.5032087, 1.455981, -0.5135896, 0.2431373, 1, 0, 1,
-0.5031118, -0.4769686, -2.269509, 0.2352941, 1, 0, 1,
-0.5027503, 0.1168076, -1.031002, 0.2313726, 1, 0, 1,
-0.4998144, 1.055218, 0.07616556, 0.2235294, 1, 0, 1,
-0.4925807, -0.5239458, -2.059232, 0.2196078, 1, 0, 1,
-0.4907588, -0.06853767, -1.728541, 0.2117647, 1, 0, 1,
-0.4855327, -0.4660096, -2.701108, 0.2078431, 1, 0, 1,
-0.4840803, 1.059999, -0.5093415, 0.2, 1, 0, 1,
-0.4817234, 0.06162541, -2.149942, 0.1921569, 1, 0, 1,
-0.4793246, 1.283112, -0.06664854, 0.1882353, 1, 0, 1,
-0.4779103, 2.30489, 1.285704, 0.1803922, 1, 0, 1,
-0.4764698, 0.05760173, -2.565424, 0.1764706, 1, 0, 1,
-0.4752478, -0.4992554, -2.323201, 0.1686275, 1, 0, 1,
-0.473089, 0.6424946, -1.609215, 0.1647059, 1, 0, 1,
-0.4712357, 2.50475, -1.154849, 0.1568628, 1, 0, 1,
-0.4696576, -1.521173, -2.645595, 0.1529412, 1, 0, 1,
-0.4640677, 0.1408829, -1.261546, 0.145098, 1, 0, 1,
-0.4639075, 0.2494801, -0.1873944, 0.1411765, 1, 0, 1,
-0.4551443, 1.64002, 0.6103131, 0.1333333, 1, 0, 1,
-0.4544894, -0.0582633, -1.906286, 0.1294118, 1, 0, 1,
-0.4539037, -0.7204692, -3.934247, 0.1215686, 1, 0, 1,
-0.4507521, 1.251007, -0.8360161, 0.1176471, 1, 0, 1,
-0.441797, 1.295107, -1.684607, 0.1098039, 1, 0, 1,
-0.4369826, 1.24907, 1.009603, 0.1058824, 1, 0, 1,
-0.4343624, -0.5127087, -5.248974, 0.09803922, 1, 0, 1,
-0.4328543, 0.02508133, -0.0883413, 0.09019608, 1, 0, 1,
-0.4252526, 0.07679003, -0.7606435, 0.08627451, 1, 0, 1,
-0.4231293, 0.3750906, -2.675558, 0.07843138, 1, 0, 1,
-0.4229241, 0.016141, -3.29027, 0.07450981, 1, 0, 1,
-0.4220312, -0.388973, -1.5071, 0.06666667, 1, 0, 1,
-0.4217104, 1.532363, 0.796182, 0.0627451, 1, 0, 1,
-0.4159122, -0.7225814, -2.747406, 0.05490196, 1, 0, 1,
-0.4152196, -0.6539219, -3.610347, 0.05098039, 1, 0, 1,
-0.4116995, 0.5423927, -0.2921962, 0.04313726, 1, 0, 1,
-0.4072375, -0.9744598, -3.653318, 0.03921569, 1, 0, 1,
-0.4010318, 1.104082, -0.7452947, 0.03137255, 1, 0, 1,
-0.3981297, -1.656188, -3.348131, 0.02745098, 1, 0, 1,
-0.3905472, -0.1994181, -2.582606, 0.01960784, 1, 0, 1,
-0.3904184, 1.0185, -1.345203, 0.01568628, 1, 0, 1,
-0.3860792, -0.8344389, -4.795791, 0.007843138, 1, 0, 1,
-0.384472, -0.1769496, -2.59948, 0.003921569, 1, 0, 1,
-0.3841303, 1.366093, -1.048197, 0, 1, 0.003921569, 1,
-0.3805102, 0.2136247, -0.6019607, 0, 1, 0.01176471, 1,
-0.3802563, 1.201222, 0.1986376, 0, 1, 0.01568628, 1,
-0.3772039, -2.132051, -2.600031, 0, 1, 0.02352941, 1,
-0.3765091, 0.2978734, -1.336197, 0, 1, 0.02745098, 1,
-0.3738633, -0.06689712, -1.763679, 0, 1, 0.03529412, 1,
-0.3731773, 0.8895962, -0.4201576, 0, 1, 0.03921569, 1,
-0.3690134, 2.111428, 0.2094261, 0, 1, 0.04705882, 1,
-0.3684959, -1.262863, -3.684123, 0, 1, 0.05098039, 1,
-0.3652124, -0.668405, -1.803082, 0, 1, 0.05882353, 1,
-0.3625444, -0.9802924, -5.590588, 0, 1, 0.0627451, 1,
-0.3621633, 0.5364734, -1.219969, 0, 1, 0.07058824, 1,
-0.3621413, 2.595352, 0.2039278, 0, 1, 0.07450981, 1,
-0.3598828, -1.401692, -2.185582, 0, 1, 0.08235294, 1,
-0.3586679, -0.4569935, -2.98725, 0, 1, 0.08627451, 1,
-0.3558181, 0.2262934, 0.6242803, 0, 1, 0.09411765, 1,
-0.3547953, 0.2148176, -2.75197, 0, 1, 0.1019608, 1,
-0.3533336, -1.393915, -4.084601, 0, 1, 0.1058824, 1,
-0.3493678, -0.228404, -1.87907, 0, 1, 0.1137255, 1,
-0.3446322, -1.411283, -2.575177, 0, 1, 0.1176471, 1,
-0.3414064, -0.3936037, -1.906954, 0, 1, 0.1254902, 1,
-0.340147, -1.656535, -3.471661, 0, 1, 0.1294118, 1,
-0.3390833, 0.5725079, -2.790087, 0, 1, 0.1372549, 1,
-0.336397, 1.138824, 0.4755792, 0, 1, 0.1411765, 1,
-0.3335631, 1.117626, 2.445203, 0, 1, 0.1490196, 1,
-0.3331556, -0.8183842, -3.009857, 0, 1, 0.1529412, 1,
-0.326185, 0.6146882, 0.679715, 0, 1, 0.1607843, 1,
-0.3260078, 1.099907, -0.7298764, 0, 1, 0.1647059, 1,
-0.3257182, -0.3330227, -2.702832, 0, 1, 0.172549, 1,
-0.3151395, -0.8426026, -0.5165076, 0, 1, 0.1764706, 1,
-0.3145995, -0.6042136, -1.70202, 0, 1, 0.1843137, 1,
-0.308102, 0.7182278, -0.9174504, 0, 1, 0.1882353, 1,
-0.3077669, 1.095158, -0.8492658, 0, 1, 0.1960784, 1,
-0.3073428, 1.915747, 0.9851112, 0, 1, 0.2039216, 1,
-0.304152, 1.546812, -1.429178, 0, 1, 0.2078431, 1,
-0.3013442, 1.052296, -0.7098132, 0, 1, 0.2156863, 1,
-0.2971395, -0.2888421, -0.4302347, 0, 1, 0.2196078, 1,
-0.295701, -0.4606183, -1.979946, 0, 1, 0.227451, 1,
-0.2906899, 0.0130208, -1.539196, 0, 1, 0.2313726, 1,
-0.2904834, -0.09457348, -2.260081, 0, 1, 0.2392157, 1,
-0.2883636, 2.45876, -1.9008, 0, 1, 0.2431373, 1,
-0.2861566, -0.3202308, -2.809063, 0, 1, 0.2509804, 1,
-0.281573, -1.221737, -3.694867, 0, 1, 0.254902, 1,
-0.280685, 1.917471, 1.400719, 0, 1, 0.2627451, 1,
-0.2801397, -1.017929, -3.752527, 0, 1, 0.2666667, 1,
-0.2791955, 0.4632326, -0.2438102, 0, 1, 0.2745098, 1,
-0.2787444, -0.3138388, -1.598149, 0, 1, 0.2784314, 1,
-0.2770974, 0.2105189, -0.5303205, 0, 1, 0.2862745, 1,
-0.2768071, -1.840448, -1.89511, 0, 1, 0.2901961, 1,
-0.2761019, -0.6387506, -2.466648, 0, 1, 0.2980392, 1,
-0.2711288, 2.005368, 0.9877828, 0, 1, 0.3058824, 1,
-0.2605395, -0.5396162, -2.930836, 0, 1, 0.3098039, 1,
-0.2576219, -0.2347597, -2.404829, 0, 1, 0.3176471, 1,
-0.2549479, 0.7598625, -1.057608, 0, 1, 0.3215686, 1,
-0.2534334, 1.700441, 0.3260169, 0, 1, 0.3294118, 1,
-0.25238, 0.9293814, -0.2408693, 0, 1, 0.3333333, 1,
-0.2508788, -0.4376697, -2.258017, 0, 1, 0.3411765, 1,
-0.2485531, 0.3749923, -1.280264, 0, 1, 0.345098, 1,
-0.2422587, 0.9129472, 0.1026153, 0, 1, 0.3529412, 1,
-0.2419799, 0.6024764, 0.7690068, 0, 1, 0.3568628, 1,
-0.238978, 1.805836, 0.9067889, 0, 1, 0.3647059, 1,
-0.23796, -1.513884, -3.044874, 0, 1, 0.3686275, 1,
-0.2354725, -1.719914, -2.942369, 0, 1, 0.3764706, 1,
-0.2332962, 0.6269484, 0.2262966, 0, 1, 0.3803922, 1,
-0.232225, -0.7366311, -2.094856, 0, 1, 0.3882353, 1,
-0.23081, 1.819403, -0.9078163, 0, 1, 0.3921569, 1,
-0.2125397, -1.511518, -2.839858, 0, 1, 0.4, 1,
-0.2101872, 0.1705241, -0.09797943, 0, 1, 0.4078431, 1,
-0.2096154, 0.2277584, 0.1834812, 0, 1, 0.4117647, 1,
-0.2060946, -1.11076, -2.765975, 0, 1, 0.4196078, 1,
-0.2060076, 0.6252482, -0.9325843, 0, 1, 0.4235294, 1,
-0.2037757, 1.370299, 0.9060224, 0, 1, 0.4313726, 1,
-0.2032071, 0.03333933, -1.49332, 0, 1, 0.4352941, 1,
-0.1994053, 0.1068228, -0.7015932, 0, 1, 0.4431373, 1,
-0.1904042, 1.581921, 0.8582092, 0, 1, 0.4470588, 1,
-0.1855229, -2.077453, -3.384666, 0, 1, 0.454902, 1,
-0.1811295, 1.115064, 0.3419704, 0, 1, 0.4588235, 1,
-0.1810524, -0.4545563, -3.217248, 0, 1, 0.4666667, 1,
-0.1786413, 1.092105, 0.6161427, 0, 1, 0.4705882, 1,
-0.1704032, -0.115721, -2.409203, 0, 1, 0.4784314, 1,
-0.1691804, 0.5932047, -0.5577242, 0, 1, 0.4823529, 1,
-0.167364, 0.1896965, 0.8360346, 0, 1, 0.4901961, 1,
-0.1669923, 0.1602121, -1.60815, 0, 1, 0.4941176, 1,
-0.1656384, -0.9929092, -3.513125, 0, 1, 0.5019608, 1,
-0.1612904, 0.6660666, -0.9735984, 0, 1, 0.509804, 1,
-0.1586441, 0.08035501, -0.1066842, 0, 1, 0.5137255, 1,
-0.1576831, -0.6724012, -1.768217, 0, 1, 0.5215687, 1,
-0.1564071, -0.8920162, -1.876922, 0, 1, 0.5254902, 1,
-0.1551978, -1.743872, -3.732083, 0, 1, 0.5333334, 1,
-0.1551533, 0.08896296, -2.981028, 0, 1, 0.5372549, 1,
-0.1531803, 0.7541416, 0.005161959, 0, 1, 0.5450981, 1,
-0.1521452, -2.026096, -0.1674592, 0, 1, 0.5490196, 1,
-0.1519963, 0.3073769, -0.09924098, 0, 1, 0.5568628, 1,
-0.1483912, -1.046973, -2.632222, 0, 1, 0.5607843, 1,
-0.145879, 0.9550103, 1.267966, 0, 1, 0.5686275, 1,
-0.1457252, 0.1591063, -0.7333961, 0, 1, 0.572549, 1,
-0.144669, -0.4789723, -3.145227, 0, 1, 0.5803922, 1,
-0.1430669, 0.04099737, 0.6985543, 0, 1, 0.5843138, 1,
-0.142734, 0.6454582, -1.033214, 0, 1, 0.5921569, 1,
-0.1415814, -1.038479, -1.925395, 0, 1, 0.5960785, 1,
-0.1365138, 1.571014, 1.97563, 0, 1, 0.6039216, 1,
-0.1361961, 0.4945126, -1.083185, 0, 1, 0.6117647, 1,
-0.1350951, -1.176722, -4.592788, 0, 1, 0.6156863, 1,
-0.1347837, -0.4223942, -2.521619, 0, 1, 0.6235294, 1,
-0.1327258, 0.9737269, -0.6126011, 0, 1, 0.627451, 1,
-0.1317278, 1.768678, 0.858312, 0, 1, 0.6352941, 1,
-0.1315352, -1.280383, -2.841434, 0, 1, 0.6392157, 1,
-0.1295635, 0.1646436, 0.1393695, 0, 1, 0.6470588, 1,
-0.1293471, 1.489699, 0.1522389, 0, 1, 0.6509804, 1,
-0.1284801, -0.03624687, -1.823716, 0, 1, 0.6588235, 1,
-0.1259839, -0.4713456, -0.9831917, 0, 1, 0.6627451, 1,
-0.1259477, -0.5987602, -3.01268, 0, 1, 0.6705883, 1,
-0.1231463, 0.05688918, -1.445273, 0, 1, 0.6745098, 1,
-0.1229716, -0.4120778, -3.292125, 0, 1, 0.682353, 1,
-0.1177823, 1.192465, 1.115371, 0, 1, 0.6862745, 1,
-0.1168854, -0.6202659, -1.639282, 0, 1, 0.6941177, 1,
-0.1144805, -0.9850957, -3.11106, 0, 1, 0.7019608, 1,
-0.1135837, -1.073233, -2.993196, 0, 1, 0.7058824, 1,
-0.1134681, -0.1865522, -1.717261, 0, 1, 0.7137255, 1,
-0.1102688, -0.7654096, -2.461227, 0, 1, 0.7176471, 1,
-0.1100814, -0.8372449, -2.085151, 0, 1, 0.7254902, 1,
-0.1077676, -1.036481, -3.152753, 0, 1, 0.7294118, 1,
-0.1076042, 1.75134, 0.5500321, 0, 1, 0.7372549, 1,
-0.1068514, 1.811007, 0.8341517, 0, 1, 0.7411765, 1,
-0.1047288, -0.5749522, -2.620512, 0, 1, 0.7490196, 1,
-0.1037382, -0.6430036, -2.471505, 0, 1, 0.7529412, 1,
-0.1036748, -0.747417, -3.175578, 0, 1, 0.7607843, 1,
-0.1020628, -0.7874526, -2.837209, 0, 1, 0.7647059, 1,
-0.09931646, 0.5280118, -1.116175, 0, 1, 0.772549, 1,
-0.09774248, 0.8945466, -0.9273751, 0, 1, 0.7764706, 1,
-0.09698013, 0.8735865, 0.2556194, 0, 1, 0.7843137, 1,
-0.09416314, 1.195927, 0.9139643, 0, 1, 0.7882353, 1,
-0.08390362, -0.02887493, -1.624588, 0, 1, 0.7960784, 1,
-0.08250726, -1.081878, -3.179664, 0, 1, 0.8039216, 1,
-0.07952168, -0.2488519, -2.403337, 0, 1, 0.8078431, 1,
-0.07944475, 0.5435507, 0.4019413, 0, 1, 0.8156863, 1,
-0.07813244, 1.021117, -0.9078705, 0, 1, 0.8196079, 1,
-0.07800498, -1.078975, -3.885255, 0, 1, 0.827451, 1,
-0.07796437, 0.9500382, -0.3129767, 0, 1, 0.8313726, 1,
-0.07508252, -0.4762204, -2.689239, 0, 1, 0.8392157, 1,
-0.07461072, -0.06071558, -1.362094, 0, 1, 0.8431373, 1,
-0.06164542, -0.5134302, -3.775765, 0, 1, 0.8509804, 1,
-0.06084524, 1.358713, 0.8852186, 0, 1, 0.854902, 1,
-0.05744393, -1.459715, -3.418886, 0, 1, 0.8627451, 1,
-0.05709716, -0.1820079, -1.44283, 0, 1, 0.8666667, 1,
-0.05501691, 0.05015751, -2.842689, 0, 1, 0.8745098, 1,
-0.05483637, -0.8701462, -2.26121, 0, 1, 0.8784314, 1,
-0.05276661, -0.02333951, -2.474749, 0, 1, 0.8862745, 1,
-0.05235112, -2.042013, -2.002925, 0, 1, 0.8901961, 1,
-0.05115703, -0.8630154, -4.756411, 0, 1, 0.8980392, 1,
-0.05013766, -0.9481651, -3.26402, 0, 1, 0.9058824, 1,
-0.04641614, -0.5092211, -3.389385, 0, 1, 0.9098039, 1,
-0.0419131, 1.301056, 1.050611, 0, 1, 0.9176471, 1,
-0.03535065, 2.022428, -0.1777624, 0, 1, 0.9215686, 1,
-0.02814543, -0.3860983, -3.130159, 0, 1, 0.9294118, 1,
-0.02639285, -0.8503998, -2.932693, 0, 1, 0.9333333, 1,
-0.02099917, -1.032586, -3.855387, 0, 1, 0.9411765, 1,
-0.01700058, -0.6204726, -1.99555, 0, 1, 0.945098, 1,
-0.015846, 1.765453, 0.3071508, 0, 1, 0.9529412, 1,
-0.01526858, -0.4257916, -3.844768, 0, 1, 0.9568627, 1,
-0.0126081, -0.3781657, -3.007193, 0, 1, 0.9647059, 1,
-0.009749066, 1.882384, -0.8739282, 0, 1, 0.9686275, 1,
-0.009409354, -2.136448, -4.29889, 0, 1, 0.9764706, 1,
-0.006798451, 0.2085595, 0.5431073, 0, 1, 0.9803922, 1,
-0.005365252, -0.7211558, -3.324747, 0, 1, 0.9882353, 1,
-0.001666954, 0.3913003, -1.792478, 0, 1, 0.9921569, 1,
0.001594686, 0.6315636, 0.7464911, 0, 1, 1, 1,
0.009406944, 0.4497135, -0.2348897, 0, 0.9921569, 1, 1,
0.009469891, -0.9836806, 4.10843, 0, 0.9882353, 1, 1,
0.009840266, 0.4479618, 0.1728764, 0, 0.9803922, 1, 1,
0.01222789, -0.5131752, 2.484722, 0, 0.9764706, 1, 1,
0.01378884, 1.524656, -0.3879994, 0, 0.9686275, 1, 1,
0.01458969, 1.672401, -1.381178, 0, 0.9647059, 1, 1,
0.0151858, 0.40463, 0.7154824, 0, 0.9568627, 1, 1,
0.01890547, 0.524583, 1.54379, 0, 0.9529412, 1, 1,
0.02103199, 0.5900391, -0.08789638, 0, 0.945098, 1, 1,
0.02535704, -0.01468394, 1.378804, 0, 0.9411765, 1, 1,
0.02552783, 1.00973, -0.1194518, 0, 0.9333333, 1, 1,
0.02600835, -0.6916503, 4.246024, 0, 0.9294118, 1, 1,
0.02638993, -0.1415973, 2.532253, 0, 0.9215686, 1, 1,
0.02972637, -0.2028301, 2.62347, 0, 0.9176471, 1, 1,
0.0368556, -2.376204, 3.064188, 0, 0.9098039, 1, 1,
0.04270144, 1.110739, 1.125201, 0, 0.9058824, 1, 1,
0.04295603, -0.03310682, 4.756255, 0, 0.8980392, 1, 1,
0.0439249, 1.28391, -0.2509066, 0, 0.8901961, 1, 1,
0.04397459, -0.5084503, 2.90742, 0, 0.8862745, 1, 1,
0.04532535, 0.3176389, 0.5938122, 0, 0.8784314, 1, 1,
0.04796297, -0.3442364, 3.081698, 0, 0.8745098, 1, 1,
0.05164628, 0.2119762, 0.5791104, 0, 0.8666667, 1, 1,
0.05355929, 0.3199212, 2.495845, 0, 0.8627451, 1, 1,
0.05394211, -1.603415, 1.43742, 0, 0.854902, 1, 1,
0.05545769, -0.8701367, 2.027802, 0, 0.8509804, 1, 1,
0.0560993, -0.567021, 3.313611, 0, 0.8431373, 1, 1,
0.05656999, -1.894773, 3.183765, 0, 0.8392157, 1, 1,
0.05832624, 0.3620124, 1.034907, 0, 0.8313726, 1, 1,
0.06267205, 1.76695, -1.698984, 0, 0.827451, 1, 1,
0.06451979, -0.008397932, 1.199664, 0, 0.8196079, 1, 1,
0.06514639, 2.917158, -2.014606, 0, 0.8156863, 1, 1,
0.07342299, -0.03606748, 3.133055, 0, 0.8078431, 1, 1,
0.07547709, -1.681589, 2.061734, 0, 0.8039216, 1, 1,
0.07764793, 0.2614982, -0.7119524, 0, 0.7960784, 1, 1,
0.07985063, -0.777722, 2.268128, 0, 0.7882353, 1, 1,
0.07986777, 2.07587, -0.09834446, 0, 0.7843137, 1, 1,
0.08659974, -0.04389669, 1.114475, 0, 0.7764706, 1, 1,
0.08673961, -0.8526593, 3.219748, 0, 0.772549, 1, 1,
0.08710703, -0.5807504, 4.181916, 0, 0.7647059, 1, 1,
0.0878134, 0.3273615, -0.05284332, 0, 0.7607843, 1, 1,
0.09049453, 0.9463187, -0.7213391, 0, 0.7529412, 1, 1,
0.0925568, 1.496964, 0.389577, 0, 0.7490196, 1, 1,
0.09288635, 0.5066642, 0.1457333, 0, 0.7411765, 1, 1,
0.1042937, -3.061486, 3.92562, 0, 0.7372549, 1, 1,
0.1055069, 0.007158731, 2.165855, 0, 0.7294118, 1, 1,
0.1081361, -0.1103588, 1.915869, 0, 0.7254902, 1, 1,
0.1088662, -0.06472332, 2.777103, 0, 0.7176471, 1, 1,
0.1091745, -1.483662, 2.364972, 0, 0.7137255, 1, 1,
0.1121789, 0.957458, 0.2849309, 0, 0.7058824, 1, 1,
0.1167249, 0.1238773, 1.530318, 0, 0.6980392, 1, 1,
0.1224261, -0.1946966, 1.060476, 0, 0.6941177, 1, 1,
0.1249534, 1.244714, 2.20123, 0, 0.6862745, 1, 1,
0.1253905, 0.9584879, -0.9385622, 0, 0.682353, 1, 1,
0.1258168, 0.654098, 0.4729351, 0, 0.6745098, 1, 1,
0.1265833, -1.925432, 3.005878, 0, 0.6705883, 1, 1,
0.1287107, -0.01395217, 1.637719, 0, 0.6627451, 1, 1,
0.129734, -1.395553, 3.389009, 0, 0.6588235, 1, 1,
0.1321253, 0.207334, -0.612109, 0, 0.6509804, 1, 1,
0.1326694, 0.4997017, 0.38461, 0, 0.6470588, 1, 1,
0.1345302, 1.251277, 1.072328, 0, 0.6392157, 1, 1,
0.1355853, -0.106148, 4.855174, 0, 0.6352941, 1, 1,
0.1362173, -0.6657974, 1.862988, 0, 0.627451, 1, 1,
0.1363954, 1.211702, -0.7185006, 0, 0.6235294, 1, 1,
0.1401657, -0.1017472, 2.088941, 0, 0.6156863, 1, 1,
0.1433077, -0.4672085, 4.381016, 0, 0.6117647, 1, 1,
0.1472981, -0.1881205, 2.193325, 0, 0.6039216, 1, 1,
0.1477319, 0.4882065, 1.304289, 0, 0.5960785, 1, 1,
0.1486914, 0.4116257, -0.5165606, 0, 0.5921569, 1, 1,
0.151736, 1.546734, 1.249227, 0, 0.5843138, 1, 1,
0.153305, -0.2779607, 1.476671, 0, 0.5803922, 1, 1,
0.1537795, 0.0944244, 1.725899, 0, 0.572549, 1, 1,
0.1571854, -1.059189, 3.237413, 0, 0.5686275, 1, 1,
0.1597635, -0.04156451, 2.515941, 0, 0.5607843, 1, 1,
0.1610251, -1.104758, 3.750739, 0, 0.5568628, 1, 1,
0.1624088, 0.6843745, -0.672973, 0, 0.5490196, 1, 1,
0.1624631, -0.7129691, 3.379205, 0, 0.5450981, 1, 1,
0.1712638, -0.8980163, 3.245155, 0, 0.5372549, 1, 1,
0.1801012, 1.298651, 1.395626, 0, 0.5333334, 1, 1,
0.1811596, -0.2780507, 3.648576, 0, 0.5254902, 1, 1,
0.1877089, -1.073263, 4.341123, 0, 0.5215687, 1, 1,
0.1904754, -0.7386871, 3.10266, 0, 0.5137255, 1, 1,
0.1944577, -0.8831403, 2.957874, 0, 0.509804, 1, 1,
0.1947063, 0.09168961, -0.1128482, 0, 0.5019608, 1, 1,
0.1966808, 1.68734, -1.545339, 0, 0.4941176, 1, 1,
0.1984605, 0.2117566, -0.3060474, 0, 0.4901961, 1, 1,
0.2022734, 0.5736141, -0.5970981, 0, 0.4823529, 1, 1,
0.2026655, -2.248016, 4.645265, 0, 0.4784314, 1, 1,
0.2096676, -1.152752, 1.54976, 0, 0.4705882, 1, 1,
0.2117825, 0.7164134, 1.077658, 0, 0.4666667, 1, 1,
0.2132435, 1.055883, 0.9290994, 0, 0.4588235, 1, 1,
0.2132747, -0.3180873, 1.659017, 0, 0.454902, 1, 1,
0.2218983, 1.59169, -0.7114738, 0, 0.4470588, 1, 1,
0.2250501, 0.4156257, 0.2107901, 0, 0.4431373, 1, 1,
0.2260712, -1.761437, 3.872628, 0, 0.4352941, 1, 1,
0.226409, -1.067469, 3.750549, 0, 0.4313726, 1, 1,
0.2277219, 0.7888535, -0.7164623, 0, 0.4235294, 1, 1,
0.2289843, 1.444712, -0.3524898, 0, 0.4196078, 1, 1,
0.2346705, 0.3829798, 1.833447, 0, 0.4117647, 1, 1,
0.2364379, -1.113895, 4.148056, 0, 0.4078431, 1, 1,
0.2393664, 0.100067, 1.484582, 0, 0.4, 1, 1,
0.2395367, 0.007341289, 1.264168, 0, 0.3921569, 1, 1,
0.246535, 0.5819973, 0.184916, 0, 0.3882353, 1, 1,
0.2483532, 0.006679332, 1.16595, 0, 0.3803922, 1, 1,
0.2484137, 0.07722183, 2.017132, 0, 0.3764706, 1, 1,
0.24974, -0.7527682, 1.90144, 0, 0.3686275, 1, 1,
0.2501414, 0.9213231, -0.7028577, 0, 0.3647059, 1, 1,
0.2511042, 1.633861, -0.08386254, 0, 0.3568628, 1, 1,
0.2516672, 1.240692, -1.333926, 0, 0.3529412, 1, 1,
0.2555863, -1.666074, 1.729103, 0, 0.345098, 1, 1,
0.2570619, 0.09067803, -0.3830138, 0, 0.3411765, 1, 1,
0.2588822, -0.2321693, 2.186391, 0, 0.3333333, 1, 1,
0.2596932, -0.3171127, 3.232353, 0, 0.3294118, 1, 1,
0.2700168, 0.9799142, -1.864791, 0, 0.3215686, 1, 1,
0.2713396, 0.5492161, 0.1849507, 0, 0.3176471, 1, 1,
0.272048, 1.384236, -1.282308, 0, 0.3098039, 1, 1,
0.2721895, -0.612898, 1.948588, 0, 0.3058824, 1, 1,
0.2735936, 0.7632521, 1.918211, 0, 0.2980392, 1, 1,
0.2753807, -0.2152651, 3.152287, 0, 0.2901961, 1, 1,
0.2835326, -0.7985684, 1.717773, 0, 0.2862745, 1, 1,
0.2837653, 0.923969, 0.5939536, 0, 0.2784314, 1, 1,
0.2856552, -1.302574, 3.332369, 0, 0.2745098, 1, 1,
0.2890877, -0.419043, 2.459466, 0, 0.2666667, 1, 1,
0.2930538, -0.6717432, 1.773912, 0, 0.2627451, 1, 1,
0.2963571, 0.1711233, 2.572348, 0, 0.254902, 1, 1,
0.2995448, 0.6665851, 0.7156803, 0, 0.2509804, 1, 1,
0.305678, -0.2660477, 2.393265, 0, 0.2431373, 1, 1,
0.3080802, 2.540321, 0.2675028, 0, 0.2392157, 1, 1,
0.3143147, -1.395531, 2.658035, 0, 0.2313726, 1, 1,
0.3153507, -0.5701554, 3.238786, 0, 0.227451, 1, 1,
0.3157321, -0.8805389, 2.600842, 0, 0.2196078, 1, 1,
0.3157709, -1.411222, 3.082294, 0, 0.2156863, 1, 1,
0.316442, -0.6396768, 1.84663, 0, 0.2078431, 1, 1,
0.3172803, -0.112176, 0.05719702, 0, 0.2039216, 1, 1,
0.3237782, 0.389055, 1.635306, 0, 0.1960784, 1, 1,
0.3270454, -0.8313968, 3.671682, 0, 0.1882353, 1, 1,
0.3277899, -0.1206601, 1.406954, 0, 0.1843137, 1, 1,
0.328737, 0.201839, 0.3966493, 0, 0.1764706, 1, 1,
0.3302647, -2.444525, 4.438488, 0, 0.172549, 1, 1,
0.3354625, -0.330243, 2.708051, 0, 0.1647059, 1, 1,
0.3356893, 0.6882725, -0.7970582, 0, 0.1607843, 1, 1,
0.3388171, -1.503958, 3.256492, 0, 0.1529412, 1, 1,
0.3413546, -0.8843102, 2.217667, 0, 0.1490196, 1, 1,
0.3434713, -1.499252, 0.957889, 0, 0.1411765, 1, 1,
0.3494464, -0.6168444, 1.966272, 0, 0.1372549, 1, 1,
0.3506585, 0.4386182, 0.6441926, 0, 0.1294118, 1, 1,
0.3563751, -1.536183, 2.714023, 0, 0.1254902, 1, 1,
0.3583078, 0.1393819, -0.4922659, 0, 0.1176471, 1, 1,
0.360256, 0.6950455, 1.715622, 0, 0.1137255, 1, 1,
0.3674669, -0.7692872, 4.115139, 0, 0.1058824, 1, 1,
0.3688298, -0.4554226, 3.570752, 0, 0.09803922, 1, 1,
0.3694587, 1.207773, -0.2654801, 0, 0.09411765, 1, 1,
0.3695043, 1.091733, -0.7037125, 0, 0.08627451, 1, 1,
0.3697658, -0.8618193, 2.185569, 0, 0.08235294, 1, 1,
0.3715705, -1.654224, 4.590989, 0, 0.07450981, 1, 1,
0.3720454, 1.447486, 0.2306453, 0, 0.07058824, 1, 1,
0.3764511, -1.921257, 2.373639, 0, 0.0627451, 1, 1,
0.3766571, 1.668952, -0.3910542, 0, 0.05882353, 1, 1,
0.3796874, 1.425324, 0.4603783, 0, 0.05098039, 1, 1,
0.3858276, -1.381908, 2.010253, 0, 0.04705882, 1, 1,
0.3864063, 1.354361, -0.2271127, 0, 0.03921569, 1, 1,
0.3947939, -0.2017807, 2.736147, 0, 0.03529412, 1, 1,
0.3957483, -0.2577897, 2.621904, 0, 0.02745098, 1, 1,
0.3965403, -0.4443324, 2.828524, 0, 0.02352941, 1, 1,
0.396855, 0.9709242, 0.849116, 0, 0.01568628, 1, 1,
0.3993458, 1.159791, 0.7786002, 0, 0.01176471, 1, 1,
0.4010899, -0.07962988, 2.322805, 0, 0.003921569, 1, 1,
0.4030203, 0.1230947, 0.8799976, 0.003921569, 0, 1, 1,
0.4034144, 0.1112073, 2.623904, 0.007843138, 0, 1, 1,
0.4060965, -0.6268864, 2.759737, 0.01568628, 0, 1, 1,
0.4104599, -1.128723, 2.893222, 0.01960784, 0, 1, 1,
0.4140423, 0.2992128, -0.4954091, 0.02745098, 0, 1, 1,
0.4142742, 0.8124818, -0.08136623, 0.03137255, 0, 1, 1,
0.4169489, -0.08433141, 1.585495, 0.03921569, 0, 1, 1,
0.4211071, 1.81292, 0.7102224, 0.04313726, 0, 1, 1,
0.4222252, -0.1404777, 2.135483, 0.05098039, 0, 1, 1,
0.4225329, -2.39845, 2.778298, 0.05490196, 0, 1, 1,
0.4240789, -0.02200395, 1.820129, 0.0627451, 0, 1, 1,
0.4263518, -0.3065676, 2.579035, 0.06666667, 0, 1, 1,
0.4301763, -0.758552, 3.143471, 0.07450981, 0, 1, 1,
0.433216, 0.5241727, -0.866075, 0.07843138, 0, 1, 1,
0.4379813, 0.1031181, 0.6706425, 0.08627451, 0, 1, 1,
0.4457739, -2.283977, 2.358093, 0.09019608, 0, 1, 1,
0.4469247, 0.1820185, -0.100325, 0.09803922, 0, 1, 1,
0.4560397, 0.06236272, -1.005191, 0.1058824, 0, 1, 1,
0.4578557, -0.1691684, 1.23583, 0.1098039, 0, 1, 1,
0.4620471, 1.299036, 1.848297, 0.1176471, 0, 1, 1,
0.4664828, 0.530337, 0.3890915, 0.1215686, 0, 1, 1,
0.4736362, 0.797843, 0.0415455, 0.1294118, 0, 1, 1,
0.4747913, -1.42069, 2.501322, 0.1333333, 0, 1, 1,
0.4758799, -1.34309, 2.692978, 0.1411765, 0, 1, 1,
0.475899, -0.8697693, 2.258573, 0.145098, 0, 1, 1,
0.4791828, -0.3250052, 3.254978, 0.1529412, 0, 1, 1,
0.4794631, -1.177131, 2.589679, 0.1568628, 0, 1, 1,
0.4846828, -0.5684976, 2.814257, 0.1647059, 0, 1, 1,
0.4879402, 0.5196569, 0.4190414, 0.1686275, 0, 1, 1,
0.4883115, 0.6592034, 1.381221, 0.1764706, 0, 1, 1,
0.4962339, 0.3423762, -0.1896064, 0.1803922, 0, 1, 1,
0.5037773, 1.049471, -0.2697633, 0.1882353, 0, 1, 1,
0.5080432, 1.624398, 0.5634277, 0.1921569, 0, 1, 1,
0.5091539, -0.697446, 2.905622, 0.2, 0, 1, 1,
0.5119637, -0.4961044, 3.417518, 0.2078431, 0, 1, 1,
0.5130951, -0.08620715, 0.4287418, 0.2117647, 0, 1, 1,
0.5160101, -1.03148, 2.20498, 0.2196078, 0, 1, 1,
0.5169699, -0.3195436, 2.755196, 0.2235294, 0, 1, 1,
0.5181376, 0.4343364, 0.45487, 0.2313726, 0, 1, 1,
0.5183267, -0.6848398, 1.092058, 0.2352941, 0, 1, 1,
0.5232551, -0.4421015, 1.206, 0.2431373, 0, 1, 1,
0.5273944, -1.281104, 0.7476024, 0.2470588, 0, 1, 1,
0.5281842, 0.1797769, 2.405767, 0.254902, 0, 1, 1,
0.5285101, 0.6840535, -0.8095024, 0.2588235, 0, 1, 1,
0.5319425, 0.6565228, 1.092434, 0.2666667, 0, 1, 1,
0.5374182, -0.9127218, 1.574694, 0.2705882, 0, 1, 1,
0.5408316, -0.05463232, 2.913859, 0.2784314, 0, 1, 1,
0.541215, -0.4719519, 2.301582, 0.282353, 0, 1, 1,
0.5486047, 0.2649036, 1.645452, 0.2901961, 0, 1, 1,
0.5491968, -0.3779775, 2.732709, 0.2941177, 0, 1, 1,
0.5526458, -1.560607, 1.752766, 0.3019608, 0, 1, 1,
0.5526461, 0.8765654, 0.7036567, 0.3098039, 0, 1, 1,
0.5533377, 0.5457302, -0.945596, 0.3137255, 0, 1, 1,
0.5550746, -0.6840726, 3.597872, 0.3215686, 0, 1, 1,
0.5554424, -0.06302327, 2.40658, 0.3254902, 0, 1, 1,
0.5582511, 0.6155472, 2.368602, 0.3333333, 0, 1, 1,
0.5622305, -0.2325089, 1.776245, 0.3372549, 0, 1, 1,
0.5644907, -0.8264968, 3.660354, 0.345098, 0, 1, 1,
0.567169, 0.5630213, -0.2764835, 0.3490196, 0, 1, 1,
0.570052, 0.03282087, 1.338744, 0.3568628, 0, 1, 1,
0.5731615, 0.6812066, 1.159492, 0.3607843, 0, 1, 1,
0.5748294, 1.592283, 0.9939796, 0.3686275, 0, 1, 1,
0.5750676, 0.716469, 1.591881, 0.372549, 0, 1, 1,
0.577332, -0.6894289, 2.069295, 0.3803922, 0, 1, 1,
0.5813671, -0.6428611, 2.65258, 0.3843137, 0, 1, 1,
0.5819029, 0.08038036, 1.951981, 0.3921569, 0, 1, 1,
0.5827755, -0.1627491, 1.132157, 0.3960784, 0, 1, 1,
0.5852991, -1.404287, 2.919067, 0.4039216, 0, 1, 1,
0.587487, 1.24139, 1.341504, 0.4117647, 0, 1, 1,
0.5885932, 0.2912927, -0.04789242, 0.4156863, 0, 1, 1,
0.5892522, 1.186847, 0.1681875, 0.4235294, 0, 1, 1,
0.593134, 0.2962826, 2.948941, 0.427451, 0, 1, 1,
0.5971926, -0.4226238, 2.670816, 0.4352941, 0, 1, 1,
0.6073086, -0.3594305, 1.034318, 0.4392157, 0, 1, 1,
0.6086382, -1.034942, 3.148337, 0.4470588, 0, 1, 1,
0.6160782, -0.4024058, 2.491101, 0.4509804, 0, 1, 1,
0.6183029, -1.587527, 2.521184, 0.4588235, 0, 1, 1,
0.620742, 0.8837903, 0.006734142, 0.4627451, 0, 1, 1,
0.625293, -0.41696, 2.320978, 0.4705882, 0, 1, 1,
0.6255338, 0.6526499, 0.4104115, 0.4745098, 0, 1, 1,
0.6288932, -0.6985459, 2.468672, 0.4823529, 0, 1, 1,
0.6372184, -1.492312, 1.27232, 0.4862745, 0, 1, 1,
0.6377005, -0.6121315, 1.079013, 0.4941176, 0, 1, 1,
0.6405509, 0.01041177, 2.205053, 0.5019608, 0, 1, 1,
0.6458701, -0.09734777, 1.27856, 0.5058824, 0, 1, 1,
0.6467068, 0.7628019, -2.072036, 0.5137255, 0, 1, 1,
0.6523573, -0.01484034, 3.138083, 0.5176471, 0, 1, 1,
0.6580939, -0.3432256, 0.1991602, 0.5254902, 0, 1, 1,
0.6634881, 0.4367618, 0.8233969, 0.5294118, 0, 1, 1,
0.6652831, -0.1564788, 1.778723, 0.5372549, 0, 1, 1,
0.6682094, 0.50703, 1.996357, 0.5411765, 0, 1, 1,
0.672175, -0.6278306, 3.521272, 0.5490196, 0, 1, 1,
0.6768422, 1.407776, 0.2024449, 0.5529412, 0, 1, 1,
0.6785976, -1.227459, 1.238102, 0.5607843, 0, 1, 1,
0.6878663, 1.018159, 0.7412958, 0.5647059, 0, 1, 1,
0.6889482, -0.6838677, 4.078077, 0.572549, 0, 1, 1,
0.6984995, -1.17264, 1.754183, 0.5764706, 0, 1, 1,
0.7005491, 0.3349784, 1.648213, 0.5843138, 0, 1, 1,
0.7008867, -1.011179, 2.934329, 0.5882353, 0, 1, 1,
0.7030933, 0.1789384, 0.5551967, 0.5960785, 0, 1, 1,
0.7044447, 0.8221792, 1.345018, 0.6039216, 0, 1, 1,
0.7051213, 1.613374, 1.291596, 0.6078432, 0, 1, 1,
0.7072185, -0.9141147, 4.200311, 0.6156863, 0, 1, 1,
0.7076373, 0.5771977, 0.2462399, 0.6196079, 0, 1, 1,
0.7118944, -0.2959459, 0.7350485, 0.627451, 0, 1, 1,
0.7125329, 0.2324086, 2.14005, 0.6313726, 0, 1, 1,
0.7156258, -0.3495961, 2.38408, 0.6392157, 0, 1, 1,
0.7174608, -0.4951909, 0.4193784, 0.6431373, 0, 1, 1,
0.719549, 0.03585057, 2.207299, 0.6509804, 0, 1, 1,
0.7210885, 1.101953, 0.3408279, 0.654902, 0, 1, 1,
0.72126, 0.5340564, 1.392601, 0.6627451, 0, 1, 1,
0.7235835, -2.206393, 4.129591, 0.6666667, 0, 1, 1,
0.7245988, -1.484468, 3.337305, 0.6745098, 0, 1, 1,
0.7303471, -0.1135835, 0.7126037, 0.6784314, 0, 1, 1,
0.7313716, -0.2870785, 1.293429, 0.6862745, 0, 1, 1,
0.7352307, 0.154417, 2.110163, 0.6901961, 0, 1, 1,
0.7362753, -0.1499929, 1.682143, 0.6980392, 0, 1, 1,
0.7380569, -1.476973, 2.825183, 0.7058824, 0, 1, 1,
0.7399005, 0.2109653, 0.6751921, 0.7098039, 0, 1, 1,
0.7518693, 0.1428058, 2.647189, 0.7176471, 0, 1, 1,
0.7521552, -0.06922482, 2.157089, 0.7215686, 0, 1, 1,
0.753153, -1.392169, 2.168987, 0.7294118, 0, 1, 1,
0.7545897, 0.9540619, 1.621557, 0.7333333, 0, 1, 1,
0.7555068, -0.6130135, 1.849617, 0.7411765, 0, 1, 1,
0.7566442, -0.6924074, 1.898553, 0.7450981, 0, 1, 1,
0.7576521, 0.6931449, 0.6287416, 0.7529412, 0, 1, 1,
0.7589746, -1.049857, 3.061612, 0.7568628, 0, 1, 1,
0.7631029, -0.1715077, 2.262968, 0.7647059, 0, 1, 1,
0.7636346, -0.362727, 1.250528, 0.7686275, 0, 1, 1,
0.7656557, 0.8259284, 0.6580777, 0.7764706, 0, 1, 1,
0.7699053, -0.5563776, 1.970311, 0.7803922, 0, 1, 1,
0.7711201, -1.766786, 3.345638, 0.7882353, 0, 1, 1,
0.7734564, -0.7058598, 1.112957, 0.7921569, 0, 1, 1,
0.7736046, 0.7082402, 1.90463, 0.8, 0, 1, 1,
0.7739486, 0.5707953, 0.09767115, 0.8078431, 0, 1, 1,
0.7753369, -0.3774709, 1.090071, 0.8117647, 0, 1, 1,
0.779915, 1.944219, -0.9108023, 0.8196079, 0, 1, 1,
0.789165, -0.940775, 2.616428, 0.8235294, 0, 1, 1,
0.7893247, -0.4086193, 2.532236, 0.8313726, 0, 1, 1,
0.7946218, -0.634133, 2.465133, 0.8352941, 0, 1, 1,
0.7979605, -0.5146096, 2.176537, 0.8431373, 0, 1, 1,
0.8120461, 0.3254537, 1.126188, 0.8470588, 0, 1, 1,
0.8122262, -0.8183205, 2.250485, 0.854902, 0, 1, 1,
0.8146493, -0.7886858, 3.244827, 0.8588235, 0, 1, 1,
0.8161231, 1.902382, 1.150554, 0.8666667, 0, 1, 1,
0.8232732, -0.5184204, 4.251014, 0.8705882, 0, 1, 1,
0.829336, -0.7453231, 2.33773, 0.8784314, 0, 1, 1,
0.8294032, -0.2644978, 3.30275, 0.8823529, 0, 1, 1,
0.8320355, 0.198455, 1.783692, 0.8901961, 0, 1, 1,
0.8324717, 0.3112644, 0.4909071, 0.8941177, 0, 1, 1,
0.8345243, -1.602139, 2.740049, 0.9019608, 0, 1, 1,
0.8412235, 1.87697, 0.6820828, 0.9098039, 0, 1, 1,
0.8447237, -0.375175, 2.351441, 0.9137255, 0, 1, 1,
0.8454546, 1.599486, 1.040138, 0.9215686, 0, 1, 1,
0.8510917, -0.02076666, 2.44807, 0.9254902, 0, 1, 1,
0.8533897, -1.231068, 4.167415, 0.9333333, 0, 1, 1,
0.8536466, 0.4687334, 0.900423, 0.9372549, 0, 1, 1,
0.8606421, 1.070637, -0.2870071, 0.945098, 0, 1, 1,
0.8632981, 2.338546, 0.8428627, 0.9490196, 0, 1, 1,
0.8679264, 0.2652538, 0.5377674, 0.9568627, 0, 1, 1,
0.8687515, 1.362416, 0.7363994, 0.9607843, 0, 1, 1,
0.8825642, 0.2663444, -0.1070239, 0.9686275, 0, 1, 1,
0.8865493, 0.1801031, 2.032561, 0.972549, 0, 1, 1,
0.8940794, 2.22924, 0.02804541, 0.9803922, 0, 1, 1,
0.9064406, 0.5726117, 1.904262, 0.9843137, 0, 1, 1,
0.9152436, 0.5833352, 0.4409386, 0.9921569, 0, 1, 1,
0.9192987, -0.339698, 3.856487, 0.9960784, 0, 1, 1,
0.9231192, 0.4946856, -0.3340197, 1, 0, 0.9960784, 1,
0.9242969, -0.9011577, 2.508768, 1, 0, 0.9882353, 1,
0.9264098, -0.4041956, 2.353801, 1, 0, 0.9843137, 1,
0.9306177, 1.025235, -1.016955, 1, 0, 0.9764706, 1,
0.9306788, 1.397806, 0.4030675, 1, 0, 0.972549, 1,
0.9327452, 0.6898834, 0.1876403, 1, 0, 0.9647059, 1,
0.9348118, -0.6621529, 2.38921, 1, 0, 0.9607843, 1,
0.9495989, -0.9855958, 3.292885, 1, 0, 0.9529412, 1,
0.9510422, 0.8306978, -0.7044872, 1, 0, 0.9490196, 1,
0.9534672, -0.5794474, 2.949186, 1, 0, 0.9411765, 1,
0.9539731, 0.1342356, 0.1153996, 1, 0, 0.9372549, 1,
0.9581101, 0.01141574, 0.7990295, 1, 0, 0.9294118, 1,
0.9611292, 0.581183, 0.270934, 1, 0, 0.9254902, 1,
0.9631351, -2.157842, 2.946288, 1, 0, 0.9176471, 1,
0.9670826, 1.16652, 1.756561, 1, 0, 0.9137255, 1,
0.9775884, 0.5464049, -0.2818293, 1, 0, 0.9058824, 1,
0.9787713, 1.261567, 1.203053, 1, 0, 0.9019608, 1,
0.9791011, 0.6641253, 0.6798172, 1, 0, 0.8941177, 1,
0.9923205, -1.377035, 3.088565, 1, 0, 0.8862745, 1,
0.9944972, 0.58105, 3.370899, 1, 0, 0.8823529, 1,
1.004962, 0.3591979, 2.401443, 1, 0, 0.8745098, 1,
1.00661, 0.5292358, -0.3328442, 1, 0, 0.8705882, 1,
1.009161, -0.8086545, 0.9387373, 1, 0, 0.8627451, 1,
1.011132, 2.167859, -0.1416366, 1, 0, 0.8588235, 1,
1.019808, 0.6005993, -0.3373324, 1, 0, 0.8509804, 1,
1.02418, -0.1992378, 2.273295, 1, 0, 0.8470588, 1,
1.026565, 1.003566, -0.1719243, 1, 0, 0.8392157, 1,
1.02841, 0.3688813, 1.015041, 1, 0, 0.8352941, 1,
1.028848, 0.08042846, 1.585351, 1, 0, 0.827451, 1,
1.03388, -0.3300875, 1.349246, 1, 0, 0.8235294, 1,
1.034386, -0.7693681, 2.750065, 1, 0, 0.8156863, 1,
1.046606, 0.3511714, 0.3065024, 1, 0, 0.8117647, 1,
1.052349, 0.3558626, 2.503082, 1, 0, 0.8039216, 1,
1.053743, -0.7516661, 3.800632, 1, 0, 0.7960784, 1,
1.068367, -1.022203, 1.748194, 1, 0, 0.7921569, 1,
1.068522, -0.4298082, 2.693304, 1, 0, 0.7843137, 1,
1.071559, -1.340839, 3.090445, 1, 0, 0.7803922, 1,
1.073971, -0.8256429, 0.3848888, 1, 0, 0.772549, 1,
1.07428, 0.238905, 2.069364, 1, 0, 0.7686275, 1,
1.08092, -0.1886646, 1.432128, 1, 0, 0.7607843, 1,
1.08142, 0.0635747, 1.854776, 1, 0, 0.7568628, 1,
1.091615, 0.2672469, 0.5573323, 1, 0, 0.7490196, 1,
1.116842, -1.445741, 5.374529, 1, 0, 0.7450981, 1,
1.131432, -1.605449, 2.396411, 1, 0, 0.7372549, 1,
1.146604, 0.8974407, 2.190634, 1, 0, 0.7333333, 1,
1.147136, -0.1831533, 2.587014, 1, 0, 0.7254902, 1,
1.148367, -0.9990373, 2.290754, 1, 0, 0.7215686, 1,
1.15067, 0.3020272, 3.081444, 1, 0, 0.7137255, 1,
1.164791, 1.863651, 2.550184, 1, 0, 0.7098039, 1,
1.174681, -1.739631, 1.11447, 1, 0, 0.7019608, 1,
1.178306, 0.9071339, 0.5495992, 1, 0, 0.6941177, 1,
1.18713, -1.639378, 2.64845, 1, 0, 0.6901961, 1,
1.188882, -1.390547, 4.75433, 1, 0, 0.682353, 1,
1.19135, 1.000348, 0.6871931, 1, 0, 0.6784314, 1,
1.200883, 0.2556026, 1.029696, 1, 0, 0.6705883, 1,
1.201459, -0.1179956, 1.638455, 1, 0, 0.6666667, 1,
1.211635, -0.6910919, 1.525545, 1, 0, 0.6588235, 1,
1.215562, -0.6879474, 1.83675, 1, 0, 0.654902, 1,
1.216123, 0.9151548, 0.3842713, 1, 0, 0.6470588, 1,
1.218975, 0.1239953, 0.4577609, 1, 0, 0.6431373, 1,
1.221035, 0.09762549, 0.7829501, 1, 0, 0.6352941, 1,
1.225834, -0.757987, 2.260324, 1, 0, 0.6313726, 1,
1.230464, 0.0381592, 1.617506, 1, 0, 0.6235294, 1,
1.235046, -1.378788, 2.330618, 1, 0, 0.6196079, 1,
1.242023, 0.3481205, 0.7416469, 1, 0, 0.6117647, 1,
1.26091, -0.4859276, 3.050726, 1, 0, 0.6078432, 1,
1.266093, -1.19802, 2.951022, 1, 0, 0.6, 1,
1.270458, 0.5924087, 2.14816, 1, 0, 0.5921569, 1,
1.271392, 0.3098015, 0.7282957, 1, 0, 0.5882353, 1,
1.288285, 0.4127859, 0.4068567, 1, 0, 0.5803922, 1,
1.289471, -1.346581, 3.365744, 1, 0, 0.5764706, 1,
1.290426, -0.5476046, 1.74918, 1, 0, 0.5686275, 1,
1.293209, 0.4461899, 0.3714694, 1, 0, 0.5647059, 1,
1.313562, -0.3185223, 1.786177, 1, 0, 0.5568628, 1,
1.325161, 1.375729, 1.329022, 1, 0, 0.5529412, 1,
1.325521, 0.0004450668, 2.98632, 1, 0, 0.5450981, 1,
1.332323, -0.8713637, 1.953006, 1, 0, 0.5411765, 1,
1.338739, -0.3198828, 4.19662, 1, 0, 0.5333334, 1,
1.342566, -0.6666216, 1.602031, 1, 0, 0.5294118, 1,
1.354632, -1.315359, 2.592674, 1, 0, 0.5215687, 1,
1.369953, -1.259856, 1.151127, 1, 0, 0.5176471, 1,
1.375462, -0.1151166, 3.989962, 1, 0, 0.509804, 1,
1.38404, -0.2067212, 2.009031, 1, 0, 0.5058824, 1,
1.391711, -1.43223, 2.732706, 1, 0, 0.4980392, 1,
1.39521, 0.302448, -1.170491, 1, 0, 0.4901961, 1,
1.398129, 0.1277004, 1.6988, 1, 0, 0.4862745, 1,
1.407254, 0.4653028, 1.596694, 1, 0, 0.4784314, 1,
1.421844, -1.175335, 2.287223, 1, 0, 0.4745098, 1,
1.423505, -1.736164, 2.114511, 1, 0, 0.4666667, 1,
1.431352, 0.00592966, 2.144383, 1, 0, 0.4627451, 1,
1.435133, -0.2747837, 2.74394, 1, 0, 0.454902, 1,
1.438226, 0.223069, 0.8860019, 1, 0, 0.4509804, 1,
1.460545, -1.564741, 2.220839, 1, 0, 0.4431373, 1,
1.490917, 0.7515346, 1.251837, 1, 0, 0.4392157, 1,
1.49818, 1.083803, 1.984738, 1, 0, 0.4313726, 1,
1.505136, -1.465157, 0.9193971, 1, 0, 0.427451, 1,
1.50609, 1.547525, 0.03215794, 1, 0, 0.4196078, 1,
1.509368, 1.660444, -1.109084, 1, 0, 0.4156863, 1,
1.521753, -0.8053414, 1.869498, 1, 0, 0.4078431, 1,
1.538918, 0.9106048, 0.5664579, 1, 0, 0.4039216, 1,
1.561135, 0.437176, 0.9976416, 1, 0, 0.3960784, 1,
1.580528, 0.6114246, 3.487686, 1, 0, 0.3882353, 1,
1.581867, 1.470022, 2.41161, 1, 0, 0.3843137, 1,
1.583617, 1.738906, 0.2523533, 1, 0, 0.3764706, 1,
1.589025, 0.1825114, 3.100537, 1, 0, 0.372549, 1,
1.589504, -2.550557, 2.011638, 1, 0, 0.3647059, 1,
1.591036, 0.969687, 1.017553, 1, 0, 0.3607843, 1,
1.591696, -0.5224907, 1.104446, 1, 0, 0.3529412, 1,
1.595249, 0.1398575, 1.787603, 1, 0, 0.3490196, 1,
1.599167, -0.123447, 2.564844, 1, 0, 0.3411765, 1,
1.607651, -0.6173763, 1.573149, 1, 0, 0.3372549, 1,
1.635455, 0.8972535, 1.408357, 1, 0, 0.3294118, 1,
1.643008, -2.298352, 3.76583, 1, 0, 0.3254902, 1,
1.665882, -1.522605, 3.329938, 1, 0, 0.3176471, 1,
1.66908, 0.01143623, -0.4970264, 1, 0, 0.3137255, 1,
1.66979, -1.104935, 1.087201, 1, 0, 0.3058824, 1,
1.675916, 1.195929, 0.9027757, 1, 0, 0.2980392, 1,
1.678967, 0.8594719, 1.766655, 1, 0, 0.2941177, 1,
1.683045, -1.302805, 3.005898, 1, 0, 0.2862745, 1,
1.684661, 2.277245, 0.8190075, 1, 0, 0.282353, 1,
1.692919, 0.7840095, 1.675112, 1, 0, 0.2745098, 1,
1.710187, 1.091651, 0.5787112, 1, 0, 0.2705882, 1,
1.713661, -0.05278022, 1.051892, 1, 0, 0.2627451, 1,
1.724669, 1.30725, 1.605783, 1, 0, 0.2588235, 1,
1.750472, 1.519801, -0.197355, 1, 0, 0.2509804, 1,
1.761046, 0.5996222, 1.882672, 1, 0, 0.2470588, 1,
1.81684, -0.8790665, 2.921228, 1, 0, 0.2392157, 1,
1.81893, 2.022074, -0.2476242, 1, 0, 0.2352941, 1,
1.827381, -1.034767, 0.5423905, 1, 0, 0.227451, 1,
1.84076, 1.384305, 1.42625, 1, 0, 0.2235294, 1,
1.841539, -0.5983381, 2.004001, 1, 0, 0.2156863, 1,
1.841748, 1.984448, 0.8892705, 1, 0, 0.2117647, 1,
1.858167, 1.40506, 2.433933, 1, 0, 0.2039216, 1,
1.860105, 1.23508, 1.131465, 1, 0, 0.1960784, 1,
1.8871, -0.5651478, 2.128143, 1, 0, 0.1921569, 1,
1.90711, 0.6808227, 0.2714751, 1, 0, 0.1843137, 1,
1.919132, -0.03407591, 1.419198, 1, 0, 0.1803922, 1,
1.95048, 1.005253, 2.145025, 1, 0, 0.172549, 1,
1.956112, -0.02893823, 1.701511, 1, 0, 0.1686275, 1,
1.981102, 0.2965488, 1.875192, 1, 0, 0.1607843, 1,
1.990458, -0.6144593, 3.336343, 1, 0, 0.1568628, 1,
2.013427, -0.4637004, 2.556102, 1, 0, 0.1490196, 1,
2.0389, -0.8594782, 3.000634, 1, 0, 0.145098, 1,
2.04325, 1.257848, 0.4568641, 1, 0, 0.1372549, 1,
2.055071, 0.609875, 2.059911, 1, 0, 0.1333333, 1,
2.066622, -1.334802, 1.432567, 1, 0, 0.1254902, 1,
2.076725, 0.0185786, 0.9873577, 1, 0, 0.1215686, 1,
2.096354, -0.1038873, 1.645714, 1, 0, 0.1137255, 1,
2.10107, 0.4768574, 1.597797, 1, 0, 0.1098039, 1,
2.134588, -0.6107329, 1.107296, 1, 0, 0.1019608, 1,
2.176597, 1.724918, 2.232305, 1, 0, 0.09411765, 1,
2.179947, 1.143517, -0.009467211, 1, 0, 0.09019608, 1,
2.221424, -0.5697671, 2.006303, 1, 0, 0.08235294, 1,
2.26281, 1.032605, 2.606309, 1, 0, 0.07843138, 1,
2.265753, -0.2408102, 1.58754, 1, 0, 0.07058824, 1,
2.291983, -1.355593, 0.8989503, 1, 0, 0.06666667, 1,
2.294336, 0.4782122, 2.133181, 1, 0, 0.05882353, 1,
2.328709, -0.663056, 2.297893, 1, 0, 0.05490196, 1,
2.372412, 0.4031516, 0.7073374, 1, 0, 0.04705882, 1,
2.486105, 0.4427398, 1.320782, 1, 0, 0.04313726, 1,
2.506996, 1.582449, 0.7952538, 1, 0, 0.03529412, 1,
2.608865, 0.6689816, 1.3722, 1, 0, 0.03137255, 1,
2.924484, -0.9418606, 2.725676, 1, 0, 0.02352941, 1,
2.987464, 1.394742, 2.269408, 1, 0, 0.01960784, 1,
3.105664, -0.1294207, 0.1551598, 1, 0, 0.01176471, 1,
3.678392, -0.2533952, 1.026733, 1, 0, 0.007843138, 1
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
0.5225995, -4.074865, -7.962357, 0, -0.5, 0.5, 0.5,
0.5225995, -4.074865, -7.962357, 1, -0.5, 0.5, 0.5,
0.5225995, -4.074865, -7.962357, 1, 1.5, 0.5, 0.5,
0.5225995, -4.074865, -7.962357, 0, 1.5, 0.5, 0.5
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
-3.703007, -0.07216394, -7.962357, 0, -0.5, 0.5, 0.5,
-3.703007, -0.07216394, -7.962357, 1, -0.5, 0.5, 0.5,
-3.703007, -0.07216394, -7.962357, 1, 1.5, 0.5, 0.5,
-3.703007, -0.07216394, -7.962357, 0, 1.5, 0.5, 0.5
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
-3.703007, -4.074865, -0.3274312, 0, -0.5, 0.5, 0.5,
-3.703007, -4.074865, -0.3274312, 1, -0.5, 0.5, 0.5,
-3.703007, -4.074865, -0.3274312, 1, 1.5, 0.5, 0.5,
-3.703007, -4.074865, -0.3274312, 0, 1.5, 0.5, 0.5
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
-2, -3.151165, -6.20045,
3, -3.151165, -6.20045,
-2, -3.151165, -6.20045,
-2, -3.305115, -6.494102,
-1, -3.151165, -6.20045,
-1, -3.305115, -6.494102,
0, -3.151165, -6.20045,
0, -3.305115, -6.494102,
1, -3.151165, -6.20045,
1, -3.305115, -6.494102,
2, -3.151165, -6.20045,
2, -3.305115, -6.494102,
3, -3.151165, -6.20045,
3, -3.305115, -6.494102
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
-2, -3.613015, -7.081403, 0, -0.5, 0.5, 0.5,
-2, -3.613015, -7.081403, 1, -0.5, 0.5, 0.5,
-2, -3.613015, -7.081403, 1, 1.5, 0.5, 0.5,
-2, -3.613015, -7.081403, 0, 1.5, 0.5, 0.5,
-1, -3.613015, -7.081403, 0, -0.5, 0.5, 0.5,
-1, -3.613015, -7.081403, 1, -0.5, 0.5, 0.5,
-1, -3.613015, -7.081403, 1, 1.5, 0.5, 0.5,
-1, -3.613015, -7.081403, 0, 1.5, 0.5, 0.5,
0, -3.613015, -7.081403, 0, -0.5, 0.5, 0.5,
0, -3.613015, -7.081403, 1, -0.5, 0.5, 0.5,
0, -3.613015, -7.081403, 1, 1.5, 0.5, 0.5,
0, -3.613015, -7.081403, 0, 1.5, 0.5, 0.5,
1, -3.613015, -7.081403, 0, -0.5, 0.5, 0.5,
1, -3.613015, -7.081403, 1, -0.5, 0.5, 0.5,
1, -3.613015, -7.081403, 1, 1.5, 0.5, 0.5,
1, -3.613015, -7.081403, 0, 1.5, 0.5, 0.5,
2, -3.613015, -7.081403, 0, -0.5, 0.5, 0.5,
2, -3.613015, -7.081403, 1, -0.5, 0.5, 0.5,
2, -3.613015, -7.081403, 1, 1.5, 0.5, 0.5,
2, -3.613015, -7.081403, 0, 1.5, 0.5, 0.5,
3, -3.613015, -7.081403, 0, -0.5, 0.5, 0.5,
3, -3.613015, -7.081403, 1, -0.5, 0.5, 0.5,
3, -3.613015, -7.081403, 1, 1.5, 0.5, 0.5,
3, -3.613015, -7.081403, 0, 1.5, 0.5, 0.5
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
-2.727867, -3, -6.20045,
-2.727867, 2, -6.20045,
-2.727867, -3, -6.20045,
-2.89039, -3, -6.494102,
-2.727867, -2, -6.20045,
-2.89039, -2, -6.494102,
-2.727867, -1, -6.20045,
-2.89039, -1, -6.494102,
-2.727867, 0, -6.20045,
-2.89039, 0, -6.494102,
-2.727867, 1, -6.20045,
-2.89039, 1, -6.494102,
-2.727867, 2, -6.20045,
-2.89039, 2, -6.494102
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
-3.215437, -3, -7.081403, 0, -0.5, 0.5, 0.5,
-3.215437, -3, -7.081403, 1, -0.5, 0.5, 0.5,
-3.215437, -3, -7.081403, 1, 1.5, 0.5, 0.5,
-3.215437, -3, -7.081403, 0, 1.5, 0.5, 0.5,
-3.215437, -2, -7.081403, 0, -0.5, 0.5, 0.5,
-3.215437, -2, -7.081403, 1, -0.5, 0.5, 0.5,
-3.215437, -2, -7.081403, 1, 1.5, 0.5, 0.5,
-3.215437, -2, -7.081403, 0, 1.5, 0.5, 0.5,
-3.215437, -1, -7.081403, 0, -0.5, 0.5, 0.5,
-3.215437, -1, -7.081403, 1, -0.5, 0.5, 0.5,
-3.215437, -1, -7.081403, 1, 1.5, 0.5, 0.5,
-3.215437, -1, -7.081403, 0, 1.5, 0.5, 0.5,
-3.215437, 0, -7.081403, 0, -0.5, 0.5, 0.5,
-3.215437, 0, -7.081403, 1, -0.5, 0.5, 0.5,
-3.215437, 0, -7.081403, 1, 1.5, 0.5, 0.5,
-3.215437, 0, -7.081403, 0, 1.5, 0.5, 0.5,
-3.215437, 1, -7.081403, 0, -0.5, 0.5, 0.5,
-3.215437, 1, -7.081403, 1, -0.5, 0.5, 0.5,
-3.215437, 1, -7.081403, 1, 1.5, 0.5, 0.5,
-3.215437, 1, -7.081403, 0, 1.5, 0.5, 0.5,
-3.215437, 2, -7.081403, 0, -0.5, 0.5, 0.5,
-3.215437, 2, -7.081403, 1, -0.5, 0.5, 0.5,
-3.215437, 2, -7.081403, 1, 1.5, 0.5, 0.5,
-3.215437, 2, -7.081403, 0, 1.5, 0.5, 0.5
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
-2.727867, -3.151165, -6,
-2.727867, -3.151165, 4,
-2.727867, -3.151165, -6,
-2.89039, -3.305115, -6,
-2.727867, -3.151165, -4,
-2.89039, -3.305115, -4,
-2.727867, -3.151165, -2,
-2.89039, -3.305115, -2,
-2.727867, -3.151165, 0,
-2.89039, -3.305115, 0,
-2.727867, -3.151165, 2,
-2.89039, -3.305115, 2,
-2.727867, -3.151165, 4,
-2.89039, -3.305115, 4
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
"-6",
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
-3.215437, -3.613015, -6, 0, -0.5, 0.5, 0.5,
-3.215437, -3.613015, -6, 1, -0.5, 0.5, 0.5,
-3.215437, -3.613015, -6, 1, 1.5, 0.5, 0.5,
-3.215437, -3.613015, -6, 0, 1.5, 0.5, 0.5,
-3.215437, -3.613015, -4, 0, -0.5, 0.5, 0.5,
-3.215437, -3.613015, -4, 1, -0.5, 0.5, 0.5,
-3.215437, -3.613015, -4, 1, 1.5, 0.5, 0.5,
-3.215437, -3.613015, -4, 0, 1.5, 0.5, 0.5,
-3.215437, -3.613015, -2, 0, -0.5, 0.5, 0.5,
-3.215437, -3.613015, -2, 1, -0.5, 0.5, 0.5,
-3.215437, -3.613015, -2, 1, 1.5, 0.5, 0.5,
-3.215437, -3.613015, -2, 0, 1.5, 0.5, 0.5,
-3.215437, -3.613015, 0, 0, -0.5, 0.5, 0.5,
-3.215437, -3.613015, 0, 1, -0.5, 0.5, 0.5,
-3.215437, -3.613015, 0, 1, 1.5, 0.5, 0.5,
-3.215437, -3.613015, 0, 0, 1.5, 0.5, 0.5,
-3.215437, -3.613015, 2, 0, -0.5, 0.5, 0.5,
-3.215437, -3.613015, 2, 1, -0.5, 0.5, 0.5,
-3.215437, -3.613015, 2, 1, 1.5, 0.5, 0.5,
-3.215437, -3.613015, 2, 0, 1.5, 0.5, 0.5,
-3.215437, -3.613015, 4, 0, -0.5, 0.5, 0.5,
-3.215437, -3.613015, 4, 1, -0.5, 0.5, 0.5,
-3.215437, -3.613015, 4, 1, 1.5, 0.5, 0.5,
-3.215437, -3.613015, 4, 0, 1.5, 0.5, 0.5
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
-2.727867, -3.151165, -6.20045,
-2.727867, 3.006837, -6.20045,
-2.727867, -3.151165, 5.545588,
-2.727867, 3.006837, 5.545588,
-2.727867, -3.151165, -6.20045,
-2.727867, -3.151165, 5.545588,
-2.727867, 3.006837, -6.20045,
-2.727867, 3.006837, 5.545588,
-2.727867, -3.151165, -6.20045,
3.773066, -3.151165, -6.20045,
-2.727867, -3.151165, 5.545588,
3.773066, -3.151165, 5.545588,
-2.727867, 3.006837, -6.20045,
3.773066, 3.006837, -6.20045,
-2.727867, 3.006837, 5.545588,
3.773066, 3.006837, 5.545588,
3.773066, -3.151165, -6.20045,
3.773066, 3.006837, -6.20045,
3.773066, -3.151165, 5.545588,
3.773066, 3.006837, 5.545588,
3.773066, -3.151165, -6.20045,
3.773066, -3.151165, 5.545588,
3.773066, 3.006837, -6.20045,
3.773066, 3.006837, 5.545588
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
var radius = 7.886887;
var distance = 35.08965;
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
mvMatrix.translate( -0.5225995, 0.07216394, 0.3274312 );
mvMatrix.scale( 1.311728, 1.384776, 0.7259858 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.08965);
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
Benzolsulfonamid<-read.table("Benzolsulfonamid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Benzolsulfonamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'Benzolsulfonamid' not found
```

```r
y<-Benzolsulfonamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'Benzolsulfonamid' not found
```

```r
z<-Benzolsulfonamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'Benzolsulfonamid' not found
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
-2.633193, 0.7322275, -1.688943, 0, 0, 1, 1, 1,
-2.626924, -0.346367, -2.619087, 1, 0, 0, 1, 1,
-2.52661, 1.930372, -2.592535, 1, 0, 0, 1, 1,
-2.490313, -1.635845, -1.816266, 1, 0, 0, 1, 1,
-2.371516, 0.5884555, -1.006072, 1, 0, 0, 1, 1,
-2.29415, 0.8279424, -0.2728749, 1, 0, 0, 1, 1,
-2.290102, -0.09012736, -2.432385, 0, 0, 0, 1, 1,
-2.200437, -0.8597066, -4.320473, 0, 0, 0, 1, 1,
-2.168462, 0.007072489, -1.40155, 0, 0, 0, 1, 1,
-2.144108, -1.337057, -1.819655, 0, 0, 0, 1, 1,
-2.129393, -1.043997, -2.575445, 0, 0, 0, 1, 1,
-2.080914, -1.112915, -1.84247, 0, 0, 0, 1, 1,
-2.076592, -0.09650215, -1.824504, 0, 0, 0, 1, 1,
-2.053851, -0.6591261, -0.2780009, 1, 1, 1, 1, 1,
-2.044426, -0.04937106, -0.06665937, 1, 1, 1, 1, 1,
-2.007734, 2.900666, -0.2640914, 1, 1, 1, 1, 1,
-2.007221, -0.7979823, -4.181162, 1, 1, 1, 1, 1,
-2.002546, 0.7548757, -0.7897295, 1, 1, 1, 1, 1,
-2.002533, -0.2001901, -1.331756, 1, 1, 1, 1, 1,
-1.941563, -0.256973, -1.114609, 1, 1, 1, 1, 1,
-1.940074, 0.9853061, -2.135165, 1, 1, 1, 1, 1,
-1.937, 1.766271, -0.465312, 1, 1, 1, 1, 1,
-1.9346, 0.5061712, -0.8330991, 1, 1, 1, 1, 1,
-1.916525, 0.6297708, -1.967951, 1, 1, 1, 1, 1,
-1.901858, 1.125887, -0.05221461, 1, 1, 1, 1, 1,
-1.895514, 1.967612, -0.6957932, 1, 1, 1, 1, 1,
-1.893343, -1.630949, -2.342589, 1, 1, 1, 1, 1,
-1.890307, 0.9189123, -1.282365, 1, 1, 1, 1, 1,
-1.865942, -0.3592194, -1.12993, 0, 0, 1, 1, 1,
-1.849762, 0.9941789, -1.283815, 1, 0, 0, 1, 1,
-1.841874, -0.1167738, -1.898488, 1, 0, 0, 1, 1,
-1.824546, 1.39887, -0.3145699, 1, 0, 0, 1, 1,
-1.797126, 0.8344857, -3.302443, 1, 0, 0, 1, 1,
-1.782143, -1.348424, -2.703458, 1, 0, 0, 1, 1,
-1.767984, 1.249167, 0.07356763, 0, 0, 0, 1, 1,
-1.752784, 0.3524904, -0.1393487, 0, 0, 0, 1, 1,
-1.749426, 0.796837, -0.08730675, 0, 0, 0, 1, 1,
-1.734056, -0.2205318, -2.02512, 0, 0, 0, 1, 1,
-1.729434, -0.2959523, -0.3783155, 0, 0, 0, 1, 1,
-1.717099, 0.4493597, 0.2272829, 0, 0, 0, 1, 1,
-1.681157, -1.533362, -1.987218, 0, 0, 0, 1, 1,
-1.665491, -0.1480632, -1.964493, 1, 1, 1, 1, 1,
-1.661339, 0.05830599, -0.9845867, 1, 1, 1, 1, 1,
-1.652597, 0.07790209, -1.93962, 1, 1, 1, 1, 1,
-1.629784, 0.1221756, -2.499132, 1, 1, 1, 1, 1,
-1.618896, -0.159049, -2.569999, 1, 1, 1, 1, 1,
-1.618637, 1.874739, 0.3451535, 1, 1, 1, 1, 1,
-1.611647, 0.4878569, -1.741613, 1, 1, 1, 1, 1,
-1.610901, 0.4123764, -1.729596, 1, 1, 1, 1, 1,
-1.609601, 1.120564, -0.9486623, 1, 1, 1, 1, 1,
-1.604501, -0.3878619, -1.965726, 1, 1, 1, 1, 1,
-1.582331, 1.153795, -1.747156, 1, 1, 1, 1, 1,
-1.547741, 0.391434, -1.522219, 1, 1, 1, 1, 1,
-1.52366, 0.7691093, -2.315027, 1, 1, 1, 1, 1,
-1.51853, -1.281983, -0.4715864, 1, 1, 1, 1, 1,
-1.5157, -0.02513112, -1.804555, 1, 1, 1, 1, 1,
-1.514804, -0.2463546, -1.86018, 0, 0, 1, 1, 1,
-1.506827, -1.2661, -1.405616, 1, 0, 0, 1, 1,
-1.505972, -0.8733722, -1.830831, 1, 0, 0, 1, 1,
-1.505816, 2.35302, -0.3855198, 1, 0, 0, 1, 1,
-1.498264, -0.7833663, -0.4925183, 1, 0, 0, 1, 1,
-1.496763, 0.5903526, -0.2127005, 1, 0, 0, 1, 1,
-1.482939, -1.082654, -1.518896, 0, 0, 0, 1, 1,
-1.482451, 0.5768288, -2.563531, 0, 0, 0, 1, 1,
-1.478146, 0.4554972, -1.125314, 0, 0, 0, 1, 1,
-1.477298, 0.2929349, -2.655985, 0, 0, 0, 1, 1,
-1.470586, 0.9359889, -1.828956, 0, 0, 0, 1, 1,
-1.454305, -0.3142875, -0.7214966, 0, 0, 0, 1, 1,
-1.446756, 0.1967159, -1.276012, 0, 0, 0, 1, 1,
-1.433904, 1.087713, -1.473102, 1, 1, 1, 1, 1,
-1.432998, -0.1796927, -1.60095, 1, 1, 1, 1, 1,
-1.411703, 0.3361613, -1.505724, 1, 1, 1, 1, 1,
-1.411356, -0.278668, -3.252626, 1, 1, 1, 1, 1,
-1.40373, 0.3737174, -3.063043, 1, 1, 1, 1, 1,
-1.39617, 0.5815707, -0.823586, 1, 1, 1, 1, 1,
-1.396008, -0.4310908, -1.215828, 1, 1, 1, 1, 1,
-1.39378, -1.036515, -3.091985, 1, 1, 1, 1, 1,
-1.389231, -1.10372, -3.0772, 1, 1, 1, 1, 1,
-1.381496, 0.5834431, -1.24138, 1, 1, 1, 1, 1,
-1.374212, -1.774994, -2.550531, 1, 1, 1, 1, 1,
-1.366563, 0.4862608, -1.260932, 1, 1, 1, 1, 1,
-1.358883, -0.5150273, -3.409841, 1, 1, 1, 1, 1,
-1.355503, -2.109536, -3.031679, 1, 1, 1, 1, 1,
-1.354273, 1.009384, -0.2938382, 1, 1, 1, 1, 1,
-1.345015, 0.1562712, -1.054918, 0, 0, 1, 1, 1,
-1.344089, -0.4815607, -3.028499, 1, 0, 0, 1, 1,
-1.342997, 0.7609168, -1.449586, 1, 0, 0, 1, 1,
-1.340865, -0.4406611, -1.640554, 1, 0, 0, 1, 1,
-1.338289, 0.7753498, -1.460706, 1, 0, 0, 1, 1,
-1.327078, 0.9565037, -1.761884, 1, 0, 0, 1, 1,
-1.297695, 1.166003, -1.236116, 0, 0, 0, 1, 1,
-1.294849, -0.3785641, -2.445673, 0, 0, 0, 1, 1,
-1.291928, 1.680853, -1.614784, 0, 0, 0, 1, 1,
-1.288373, -0.5283182, -1.48763, 0, 0, 0, 1, 1,
-1.286111, 0.57626, -0.4085337, 0, 0, 0, 1, 1,
-1.284751, 0.8755567, -1.94659, 0, 0, 0, 1, 1,
-1.280016, -1.652795, -2.22322, 0, 0, 0, 1, 1,
-1.274066, -1.719349, -3.090584, 1, 1, 1, 1, 1,
-1.272717, 0.4859532, -0.09242052, 1, 1, 1, 1, 1,
-1.264642, -1.406704, -2.080008, 1, 1, 1, 1, 1,
-1.264138, 0.2593575, -2.695174, 1, 1, 1, 1, 1,
-1.263929, -1.1935, -3.999243, 1, 1, 1, 1, 1,
-1.254071, -0.375548, -1.686879, 1, 1, 1, 1, 1,
-1.252498, 0.2398576, 0.09494004, 1, 1, 1, 1, 1,
-1.251694, -0.5536392, -0.7889566, 1, 1, 1, 1, 1,
-1.25135, 2.894088, -1.430664, 1, 1, 1, 1, 1,
-1.250996, -2.443044, -3.165988, 1, 1, 1, 1, 1,
-1.243282, -2.104691, -2.598119, 1, 1, 1, 1, 1,
-1.238395, -1.649335, -2.537428, 1, 1, 1, 1, 1,
-1.221543, 0.3022548, -1.172591, 1, 1, 1, 1, 1,
-1.215396, -1.703518, -2.201066, 1, 1, 1, 1, 1,
-1.213491, 0.1010612, -0.6023438, 1, 1, 1, 1, 1,
-1.204526, -0.1055946, -0.5597293, 0, 0, 1, 1, 1,
-1.196378, 0.8086926, -0.6438746, 1, 0, 0, 1, 1,
-1.196235, 0.4325359, -1.545349, 1, 0, 0, 1, 1,
-1.195144, -0.05191502, -1.743241, 1, 0, 0, 1, 1,
-1.193838, 1.484264, -1.676541, 1, 0, 0, 1, 1,
-1.192545, -1.107829, -2.560656, 1, 0, 0, 1, 1,
-1.186325, 0.1120724, -0.5705999, 0, 0, 0, 1, 1,
-1.186289, -0.6654817, -1.178245, 0, 0, 0, 1, 1,
-1.183092, -0.8284694, -1.28807, 0, 0, 0, 1, 1,
-1.18157, 1.606015, -0.9734585, 0, 0, 0, 1, 1,
-1.176282, -0.9629363, -3.213315, 0, 0, 0, 1, 1,
-1.166825, 0.8519584, -1.811206, 0, 0, 0, 1, 1,
-1.166189, -0.3558459, -1.328822, 0, 0, 0, 1, 1,
-1.154168, -0.5212411, -2.212501, 1, 1, 1, 1, 1,
-1.146428, -0.6834559, -1.676126, 1, 1, 1, 1, 1,
-1.141384, 0.1506868, -2.359605, 1, 1, 1, 1, 1,
-1.139455, 0.007846601, -2.565821, 1, 1, 1, 1, 1,
-1.132919, 0.6269101, -1.468691, 1, 1, 1, 1, 1,
-1.130297, 0.3541998, -1.261102, 1, 1, 1, 1, 1,
-1.118822, -1.044947, -2.500377, 1, 1, 1, 1, 1,
-1.106733, 0.7833359, -1.171806, 1, 1, 1, 1, 1,
-1.10505, -0.4833072, -0.7765927, 1, 1, 1, 1, 1,
-1.102625, 1.165709, -1.447576, 1, 1, 1, 1, 1,
-1.093929, 0.6853675, 0.9087138, 1, 1, 1, 1, 1,
-1.091487, 1.029075, -2.00614, 1, 1, 1, 1, 1,
-1.086071, 0.8325176, -2.785991, 1, 1, 1, 1, 1,
-1.072888, -0.8061488, -2.021193, 1, 1, 1, 1, 1,
-1.072252, 0.9860989, -1.157769, 1, 1, 1, 1, 1,
-1.072188, -0.2750097, -0.8385836, 0, 0, 1, 1, 1,
-1.070824, 0.7486814, -0.8151033, 1, 0, 0, 1, 1,
-1.051523, -1.180905, -3.243984, 1, 0, 0, 1, 1,
-1.049999, -0.3024618, -1.345881, 1, 0, 0, 1, 1,
-1.035145, -0.5277132, -3.402871, 1, 0, 0, 1, 1,
-1.034355, -1.199516, -3.623103, 1, 0, 0, 1, 1,
-1.023998, -2.032195, -2.044896, 0, 0, 0, 1, 1,
-1.01708, -1.247148, -2.892555, 0, 0, 0, 1, 1,
-1.013456, -0.2732379, -1.507106, 0, 0, 0, 1, 1,
-0.9997472, 1.808662, -0.6529809, 0, 0, 0, 1, 1,
-0.9942902, -0.1969672, -3.188641, 0, 0, 0, 1, 1,
-0.975324, 0.1526733, -3.169944, 0, 0, 0, 1, 1,
-0.9730263, 0.1354302, -2.511244, 0, 0, 0, 1, 1,
-0.9679543, -1.26809, -2.302196, 1, 1, 1, 1, 1,
-0.9653684, -0.354058, -1.713595, 1, 1, 1, 1, 1,
-0.9633747, 0.758948, -1.22136, 1, 1, 1, 1, 1,
-0.9571933, -1.900459, -3.213036, 1, 1, 1, 1, 1,
-0.9566464, 1.137598, 0.5076558, 1, 1, 1, 1, 1,
-0.9510992, 1.936039, 0.1692519, 1, 1, 1, 1, 1,
-0.9399564, 0.1867807, -1.550922, 1, 1, 1, 1, 1,
-0.9307519, -0.6976315, -6.029392, 1, 1, 1, 1, 1,
-0.9293078, -1.147429, -1.83973, 1, 1, 1, 1, 1,
-0.917802, 1.10596, -1.451977, 1, 1, 1, 1, 1,
-0.9010081, 0.9728794, -0.9770828, 1, 1, 1, 1, 1,
-0.894599, -0.7369358, -2.376449, 1, 1, 1, 1, 1,
-0.89188, -0.005229749, -1.418254, 1, 1, 1, 1, 1,
-0.8888413, 0.9507025, -0.4141997, 1, 1, 1, 1, 1,
-0.8859558, 0.02622287, -0.604793, 1, 1, 1, 1, 1,
-0.8801545, -0.05591498, -0.5979499, 0, 0, 1, 1, 1,
-0.8664399, 0.347947, -0.6217843, 1, 0, 0, 1, 1,
-0.8584644, 0.1226426, -0.9670672, 1, 0, 0, 1, 1,
-0.8569694, 1.120513, -1.072626, 1, 0, 0, 1, 1,
-0.8537288, -1.951104, -1.771522, 1, 0, 0, 1, 1,
-0.8504478, 2.319378, -0.02737342, 1, 0, 0, 1, 1,
-0.8498513, 0.5058716, -2.285263, 0, 0, 0, 1, 1,
-0.8491642, -2.024052, -4.69943, 0, 0, 0, 1, 1,
-0.8483705, 0.9708737, -1.253831, 0, 0, 0, 1, 1,
-0.8453264, 0.111327, -2.095641, 0, 0, 0, 1, 1,
-0.8420453, -0.07495574, -1.885803, 0, 0, 0, 1, 1,
-0.8406438, -1.276157, -3.840346, 0, 0, 0, 1, 1,
-0.8397099, -0.1874646, -1.386201, 0, 0, 0, 1, 1,
-0.8380563, -0.3551993, -2.927001, 1, 1, 1, 1, 1,
-0.8358852, 0.8507264, -1.212973, 1, 1, 1, 1, 1,
-0.8335558, -1.409797, -1.574605, 1, 1, 1, 1, 1,
-0.8334877, 1.07585, 0.4867265, 1, 1, 1, 1, 1,
-0.8307541, 1.311001, 0.03384166, 1, 1, 1, 1, 1,
-0.8268373, 0.2550139, -1.897369, 1, 1, 1, 1, 1,
-0.8254874, -0.78688, -2.627995, 1, 1, 1, 1, 1,
-0.8242645, 0.9277096, 2.343003, 1, 1, 1, 1, 1,
-0.8079259, -0.06684458, -2.142662, 1, 1, 1, 1, 1,
-0.8073652, 0.405299, -1.014459, 1, 1, 1, 1, 1,
-0.7988733, 0.8004131, -0.07087526, 1, 1, 1, 1, 1,
-0.7982041, -0.6268381, -2.084001, 1, 1, 1, 1, 1,
-0.7967951, 0.1663403, -1.603137, 1, 1, 1, 1, 1,
-0.7964898, 0.9632306, -0.2155214, 1, 1, 1, 1, 1,
-0.7946602, 0.423552, 0.1960073, 1, 1, 1, 1, 1,
-0.7923085, 1.543472, -0.9343452, 0, 0, 1, 1, 1,
-0.7914914, -2.591294, -1.432252, 1, 0, 0, 1, 1,
-0.7909576, 0.06277137, -1.635901, 1, 0, 0, 1, 1,
-0.7907324, 1.517918, -0.1052822, 1, 0, 0, 1, 1,
-0.7890228, 0.807329, -0.02115979, 1, 0, 0, 1, 1,
-0.7791186, 0.7091551, -0.4680933, 1, 0, 0, 1, 1,
-0.7776856, -0.1637868, -2.6199, 0, 0, 0, 1, 1,
-0.7755243, 0.1073482, -1.256168, 0, 0, 0, 1, 1,
-0.7737765, 0.8839824, -1.750945, 0, 0, 0, 1, 1,
-0.7722238, 0.2182985, -1.74536, 0, 0, 0, 1, 1,
-0.7717003, -1.227347, -1.378091, 0, 0, 0, 1, 1,
-0.7676987, 0.1602256, -2.526577, 0, 0, 0, 1, 1,
-0.7670909, 0.1120659, -3.031173, 0, 0, 0, 1, 1,
-0.7650403, -0.9502472, -1.966301, 1, 1, 1, 1, 1,
-0.7641646, -0.03715366, -0.5294256, 1, 1, 1, 1, 1,
-0.7637873, -1.275708, -1.68499, 1, 1, 1, 1, 1,
-0.7592569, -0.05337808, -0.9070509, 1, 1, 1, 1, 1,
-0.7470992, 1.525166, -0.5380918, 1, 1, 1, 1, 1,
-0.7424225, -0.1568073, -1.391798, 1, 1, 1, 1, 1,
-0.7411355, -0.03364671, -0.7522712, 1, 1, 1, 1, 1,
-0.7323144, -0.1629327, -1.612885, 1, 1, 1, 1, 1,
-0.7319586, 0.8375953, -1.569946, 1, 1, 1, 1, 1,
-0.7262616, 0.5705888, 0.1200002, 1, 1, 1, 1, 1,
-0.7071779, -0.2264243, -2.167127, 1, 1, 1, 1, 1,
-0.7036707, 0.0579356, -2.227989, 1, 1, 1, 1, 1,
-0.6985808, 0.1723503, -1.528651, 1, 1, 1, 1, 1,
-0.6947613, 0.3443933, -1.461785, 1, 1, 1, 1, 1,
-0.6934286, 0.2368837, -1.709791, 1, 1, 1, 1, 1,
-0.6915144, 0.05905185, -1.342441, 0, 0, 1, 1, 1,
-0.6909401, 0.964748, -0.05514612, 1, 0, 0, 1, 1,
-0.6907244, 1.08864, -1.030743, 1, 0, 0, 1, 1,
-0.6888098, -0.3224706, -2.635973, 1, 0, 0, 1, 1,
-0.6873621, 1.629856, 0.3750757, 1, 0, 0, 1, 1,
-0.6861199, -0.06024216, -1.596444, 1, 0, 0, 1, 1,
-0.6834345, -1.116014, -3.990871, 0, 0, 0, 1, 1,
-0.6828113, -2.570458, -2.216003, 0, 0, 0, 1, 1,
-0.669979, 2.075804, -0.1675583, 0, 0, 0, 1, 1,
-0.6656094, -1.812416, -2.114237, 0, 0, 0, 1, 1,
-0.6618103, -0.4038392, -2.102241, 0, 0, 0, 1, 1,
-0.6608814, 1.814626, -0.2686115, 0, 0, 0, 1, 1,
-0.6589188, 0.9102408, -0.8085027, 0, 0, 0, 1, 1,
-0.6559603, -0.5494611, -2.456997, 1, 1, 1, 1, 1,
-0.6437435, 1.60635, -0.1837409, 1, 1, 1, 1, 1,
-0.6419547, -0.4241666, -2.368297, 1, 1, 1, 1, 1,
-0.6416898, 0.9003512, -1.695382, 1, 1, 1, 1, 1,
-0.6364532, 0.8253943, -0.1949613, 1, 1, 1, 1, 1,
-0.6334919, -0.7036275, -2.076703, 1, 1, 1, 1, 1,
-0.6324384, 0.9239846, -1.152271, 1, 1, 1, 1, 1,
-0.6263923, 0.7524412, -0.1601829, 1, 1, 1, 1, 1,
-0.625201, 2.132157, 1.646845, 1, 1, 1, 1, 1,
-0.6210374, -0.6827729, -2.7967, 1, 1, 1, 1, 1,
-0.6209233, 1.146788, -1.131104, 1, 1, 1, 1, 1,
-0.6155302, 2.539237, -0.6392116, 1, 1, 1, 1, 1,
-0.6151821, 0.1166875, -1.179015, 1, 1, 1, 1, 1,
-0.6142683, -0.1933483, -0.5011362, 1, 1, 1, 1, 1,
-0.6114313, 0.4206858, -1.827909, 1, 1, 1, 1, 1,
-0.6086164, -2.835828, -2.963069, 0, 0, 1, 1, 1,
-0.6077405, -0.3770253, -1.894571, 1, 0, 0, 1, 1,
-0.5980356, -0.493532, -3.634886, 1, 0, 0, 1, 1,
-0.5972878, -1.121833, -2.411135, 1, 0, 0, 1, 1,
-0.5951841, -0.570952, -2.215044, 1, 0, 0, 1, 1,
-0.5933999, -0.09085532, -2.229503, 1, 0, 0, 1, 1,
-0.5922738, -0.6220449, -1.631083, 0, 0, 0, 1, 1,
-0.5799038, 1.498273, -0.4386932, 0, 0, 0, 1, 1,
-0.5777084, 0.8755483, -1.458342, 0, 0, 0, 1, 1,
-0.5774411, 0.8595076, -0.491919, 0, 0, 0, 1, 1,
-0.5765095, -0.2351209, -1.088932, 0, 0, 0, 1, 1,
-0.5746508, 0.2754683, -0.3201752, 0, 0, 0, 1, 1,
-0.5686741, -0.8485125, -2.213056, 0, 0, 0, 1, 1,
-0.5684919, 2.250566, -1.524876, 1, 1, 1, 1, 1,
-0.5668841, 0.6976792, -2.020061, 1, 1, 1, 1, 1,
-0.5610467, 0.2072812, -1.101734, 1, 1, 1, 1, 1,
-0.5564879, 1.206161, -1.528955, 1, 1, 1, 1, 1,
-0.5550012, -0.7005872, -2.866197, 1, 1, 1, 1, 1,
-0.5480281, 0.5031658, -0.4867369, 1, 1, 1, 1, 1,
-0.5478802, -1.092659, -3.757234, 1, 1, 1, 1, 1,
-0.5441934, 0.3488836, 1.973873, 1, 1, 1, 1, 1,
-0.5439364, 0.7607514, 1.077729, 1, 1, 1, 1, 1,
-0.5411142, 0.4187291, 0.211892, 1, 1, 1, 1, 1,
-0.5406726, -0.1924111, -1.341455, 1, 1, 1, 1, 1,
-0.539987, 1.567276, 0.1364229, 1, 1, 1, 1, 1,
-0.5398763, -0.08203803, -2.350067, 1, 1, 1, 1, 1,
-0.5390231, -1.005046, -3.723495, 1, 1, 1, 1, 1,
-0.5383017, -0.6206508, -2.370151, 1, 1, 1, 1, 1,
-0.538277, -0.05550622, -2.777181, 0, 0, 1, 1, 1,
-0.5334976, 0.5638655, -0.4921107, 1, 0, 0, 1, 1,
-0.530308, -0.3221684, -1.858556, 1, 0, 0, 1, 1,
-0.5258745, 0.1611204, -2.126221, 1, 0, 0, 1, 1,
-0.5258611, 0.1394852, -2.095651, 1, 0, 0, 1, 1,
-0.5246507, 0.7020796, -0.8729097, 1, 0, 0, 1, 1,
-0.5210136, -0.0590045, -1.036746, 0, 0, 0, 1, 1,
-0.5201603, 0.8578333, -1.267091, 0, 0, 0, 1, 1,
-0.5159323, 0.1976507, -2.617726, 0, 0, 0, 1, 1,
-0.5144699, 1.341083, 0.4528027, 0, 0, 0, 1, 1,
-0.506961, -1.332707, -1.08212, 0, 0, 0, 1, 1,
-0.5067357, 1.977597, 1.099969, 0, 0, 0, 1, 1,
-0.5038438, -0.6386651, -1.489987, 0, 0, 0, 1, 1,
-0.5032087, 1.455981, -0.5135896, 1, 1, 1, 1, 1,
-0.5031118, -0.4769686, -2.269509, 1, 1, 1, 1, 1,
-0.5027503, 0.1168076, -1.031002, 1, 1, 1, 1, 1,
-0.4998144, 1.055218, 0.07616556, 1, 1, 1, 1, 1,
-0.4925807, -0.5239458, -2.059232, 1, 1, 1, 1, 1,
-0.4907588, -0.06853767, -1.728541, 1, 1, 1, 1, 1,
-0.4855327, -0.4660096, -2.701108, 1, 1, 1, 1, 1,
-0.4840803, 1.059999, -0.5093415, 1, 1, 1, 1, 1,
-0.4817234, 0.06162541, -2.149942, 1, 1, 1, 1, 1,
-0.4793246, 1.283112, -0.06664854, 1, 1, 1, 1, 1,
-0.4779103, 2.30489, 1.285704, 1, 1, 1, 1, 1,
-0.4764698, 0.05760173, -2.565424, 1, 1, 1, 1, 1,
-0.4752478, -0.4992554, -2.323201, 1, 1, 1, 1, 1,
-0.473089, 0.6424946, -1.609215, 1, 1, 1, 1, 1,
-0.4712357, 2.50475, -1.154849, 1, 1, 1, 1, 1,
-0.4696576, -1.521173, -2.645595, 0, 0, 1, 1, 1,
-0.4640677, 0.1408829, -1.261546, 1, 0, 0, 1, 1,
-0.4639075, 0.2494801, -0.1873944, 1, 0, 0, 1, 1,
-0.4551443, 1.64002, 0.6103131, 1, 0, 0, 1, 1,
-0.4544894, -0.0582633, -1.906286, 1, 0, 0, 1, 1,
-0.4539037, -0.7204692, -3.934247, 1, 0, 0, 1, 1,
-0.4507521, 1.251007, -0.8360161, 0, 0, 0, 1, 1,
-0.441797, 1.295107, -1.684607, 0, 0, 0, 1, 1,
-0.4369826, 1.24907, 1.009603, 0, 0, 0, 1, 1,
-0.4343624, -0.5127087, -5.248974, 0, 0, 0, 1, 1,
-0.4328543, 0.02508133, -0.0883413, 0, 0, 0, 1, 1,
-0.4252526, 0.07679003, -0.7606435, 0, 0, 0, 1, 1,
-0.4231293, 0.3750906, -2.675558, 0, 0, 0, 1, 1,
-0.4229241, 0.016141, -3.29027, 1, 1, 1, 1, 1,
-0.4220312, -0.388973, -1.5071, 1, 1, 1, 1, 1,
-0.4217104, 1.532363, 0.796182, 1, 1, 1, 1, 1,
-0.4159122, -0.7225814, -2.747406, 1, 1, 1, 1, 1,
-0.4152196, -0.6539219, -3.610347, 1, 1, 1, 1, 1,
-0.4116995, 0.5423927, -0.2921962, 1, 1, 1, 1, 1,
-0.4072375, -0.9744598, -3.653318, 1, 1, 1, 1, 1,
-0.4010318, 1.104082, -0.7452947, 1, 1, 1, 1, 1,
-0.3981297, -1.656188, -3.348131, 1, 1, 1, 1, 1,
-0.3905472, -0.1994181, -2.582606, 1, 1, 1, 1, 1,
-0.3904184, 1.0185, -1.345203, 1, 1, 1, 1, 1,
-0.3860792, -0.8344389, -4.795791, 1, 1, 1, 1, 1,
-0.384472, -0.1769496, -2.59948, 1, 1, 1, 1, 1,
-0.3841303, 1.366093, -1.048197, 1, 1, 1, 1, 1,
-0.3805102, 0.2136247, -0.6019607, 1, 1, 1, 1, 1,
-0.3802563, 1.201222, 0.1986376, 0, 0, 1, 1, 1,
-0.3772039, -2.132051, -2.600031, 1, 0, 0, 1, 1,
-0.3765091, 0.2978734, -1.336197, 1, 0, 0, 1, 1,
-0.3738633, -0.06689712, -1.763679, 1, 0, 0, 1, 1,
-0.3731773, 0.8895962, -0.4201576, 1, 0, 0, 1, 1,
-0.3690134, 2.111428, 0.2094261, 1, 0, 0, 1, 1,
-0.3684959, -1.262863, -3.684123, 0, 0, 0, 1, 1,
-0.3652124, -0.668405, -1.803082, 0, 0, 0, 1, 1,
-0.3625444, -0.9802924, -5.590588, 0, 0, 0, 1, 1,
-0.3621633, 0.5364734, -1.219969, 0, 0, 0, 1, 1,
-0.3621413, 2.595352, 0.2039278, 0, 0, 0, 1, 1,
-0.3598828, -1.401692, -2.185582, 0, 0, 0, 1, 1,
-0.3586679, -0.4569935, -2.98725, 0, 0, 0, 1, 1,
-0.3558181, 0.2262934, 0.6242803, 1, 1, 1, 1, 1,
-0.3547953, 0.2148176, -2.75197, 1, 1, 1, 1, 1,
-0.3533336, -1.393915, -4.084601, 1, 1, 1, 1, 1,
-0.3493678, -0.228404, -1.87907, 1, 1, 1, 1, 1,
-0.3446322, -1.411283, -2.575177, 1, 1, 1, 1, 1,
-0.3414064, -0.3936037, -1.906954, 1, 1, 1, 1, 1,
-0.340147, -1.656535, -3.471661, 1, 1, 1, 1, 1,
-0.3390833, 0.5725079, -2.790087, 1, 1, 1, 1, 1,
-0.336397, 1.138824, 0.4755792, 1, 1, 1, 1, 1,
-0.3335631, 1.117626, 2.445203, 1, 1, 1, 1, 1,
-0.3331556, -0.8183842, -3.009857, 1, 1, 1, 1, 1,
-0.326185, 0.6146882, 0.679715, 1, 1, 1, 1, 1,
-0.3260078, 1.099907, -0.7298764, 1, 1, 1, 1, 1,
-0.3257182, -0.3330227, -2.702832, 1, 1, 1, 1, 1,
-0.3151395, -0.8426026, -0.5165076, 1, 1, 1, 1, 1,
-0.3145995, -0.6042136, -1.70202, 0, 0, 1, 1, 1,
-0.308102, 0.7182278, -0.9174504, 1, 0, 0, 1, 1,
-0.3077669, 1.095158, -0.8492658, 1, 0, 0, 1, 1,
-0.3073428, 1.915747, 0.9851112, 1, 0, 0, 1, 1,
-0.304152, 1.546812, -1.429178, 1, 0, 0, 1, 1,
-0.3013442, 1.052296, -0.7098132, 1, 0, 0, 1, 1,
-0.2971395, -0.2888421, -0.4302347, 0, 0, 0, 1, 1,
-0.295701, -0.4606183, -1.979946, 0, 0, 0, 1, 1,
-0.2906899, 0.0130208, -1.539196, 0, 0, 0, 1, 1,
-0.2904834, -0.09457348, -2.260081, 0, 0, 0, 1, 1,
-0.2883636, 2.45876, -1.9008, 0, 0, 0, 1, 1,
-0.2861566, -0.3202308, -2.809063, 0, 0, 0, 1, 1,
-0.281573, -1.221737, -3.694867, 0, 0, 0, 1, 1,
-0.280685, 1.917471, 1.400719, 1, 1, 1, 1, 1,
-0.2801397, -1.017929, -3.752527, 1, 1, 1, 1, 1,
-0.2791955, 0.4632326, -0.2438102, 1, 1, 1, 1, 1,
-0.2787444, -0.3138388, -1.598149, 1, 1, 1, 1, 1,
-0.2770974, 0.2105189, -0.5303205, 1, 1, 1, 1, 1,
-0.2768071, -1.840448, -1.89511, 1, 1, 1, 1, 1,
-0.2761019, -0.6387506, -2.466648, 1, 1, 1, 1, 1,
-0.2711288, 2.005368, 0.9877828, 1, 1, 1, 1, 1,
-0.2605395, -0.5396162, -2.930836, 1, 1, 1, 1, 1,
-0.2576219, -0.2347597, -2.404829, 1, 1, 1, 1, 1,
-0.2549479, 0.7598625, -1.057608, 1, 1, 1, 1, 1,
-0.2534334, 1.700441, 0.3260169, 1, 1, 1, 1, 1,
-0.25238, 0.9293814, -0.2408693, 1, 1, 1, 1, 1,
-0.2508788, -0.4376697, -2.258017, 1, 1, 1, 1, 1,
-0.2485531, 0.3749923, -1.280264, 1, 1, 1, 1, 1,
-0.2422587, 0.9129472, 0.1026153, 0, 0, 1, 1, 1,
-0.2419799, 0.6024764, 0.7690068, 1, 0, 0, 1, 1,
-0.238978, 1.805836, 0.9067889, 1, 0, 0, 1, 1,
-0.23796, -1.513884, -3.044874, 1, 0, 0, 1, 1,
-0.2354725, -1.719914, -2.942369, 1, 0, 0, 1, 1,
-0.2332962, 0.6269484, 0.2262966, 1, 0, 0, 1, 1,
-0.232225, -0.7366311, -2.094856, 0, 0, 0, 1, 1,
-0.23081, 1.819403, -0.9078163, 0, 0, 0, 1, 1,
-0.2125397, -1.511518, -2.839858, 0, 0, 0, 1, 1,
-0.2101872, 0.1705241, -0.09797943, 0, 0, 0, 1, 1,
-0.2096154, 0.2277584, 0.1834812, 0, 0, 0, 1, 1,
-0.2060946, -1.11076, -2.765975, 0, 0, 0, 1, 1,
-0.2060076, 0.6252482, -0.9325843, 0, 0, 0, 1, 1,
-0.2037757, 1.370299, 0.9060224, 1, 1, 1, 1, 1,
-0.2032071, 0.03333933, -1.49332, 1, 1, 1, 1, 1,
-0.1994053, 0.1068228, -0.7015932, 1, 1, 1, 1, 1,
-0.1904042, 1.581921, 0.8582092, 1, 1, 1, 1, 1,
-0.1855229, -2.077453, -3.384666, 1, 1, 1, 1, 1,
-0.1811295, 1.115064, 0.3419704, 1, 1, 1, 1, 1,
-0.1810524, -0.4545563, -3.217248, 1, 1, 1, 1, 1,
-0.1786413, 1.092105, 0.6161427, 1, 1, 1, 1, 1,
-0.1704032, -0.115721, -2.409203, 1, 1, 1, 1, 1,
-0.1691804, 0.5932047, -0.5577242, 1, 1, 1, 1, 1,
-0.167364, 0.1896965, 0.8360346, 1, 1, 1, 1, 1,
-0.1669923, 0.1602121, -1.60815, 1, 1, 1, 1, 1,
-0.1656384, -0.9929092, -3.513125, 1, 1, 1, 1, 1,
-0.1612904, 0.6660666, -0.9735984, 1, 1, 1, 1, 1,
-0.1586441, 0.08035501, -0.1066842, 1, 1, 1, 1, 1,
-0.1576831, -0.6724012, -1.768217, 0, 0, 1, 1, 1,
-0.1564071, -0.8920162, -1.876922, 1, 0, 0, 1, 1,
-0.1551978, -1.743872, -3.732083, 1, 0, 0, 1, 1,
-0.1551533, 0.08896296, -2.981028, 1, 0, 0, 1, 1,
-0.1531803, 0.7541416, 0.005161959, 1, 0, 0, 1, 1,
-0.1521452, -2.026096, -0.1674592, 1, 0, 0, 1, 1,
-0.1519963, 0.3073769, -0.09924098, 0, 0, 0, 1, 1,
-0.1483912, -1.046973, -2.632222, 0, 0, 0, 1, 1,
-0.145879, 0.9550103, 1.267966, 0, 0, 0, 1, 1,
-0.1457252, 0.1591063, -0.7333961, 0, 0, 0, 1, 1,
-0.144669, -0.4789723, -3.145227, 0, 0, 0, 1, 1,
-0.1430669, 0.04099737, 0.6985543, 0, 0, 0, 1, 1,
-0.142734, 0.6454582, -1.033214, 0, 0, 0, 1, 1,
-0.1415814, -1.038479, -1.925395, 1, 1, 1, 1, 1,
-0.1365138, 1.571014, 1.97563, 1, 1, 1, 1, 1,
-0.1361961, 0.4945126, -1.083185, 1, 1, 1, 1, 1,
-0.1350951, -1.176722, -4.592788, 1, 1, 1, 1, 1,
-0.1347837, -0.4223942, -2.521619, 1, 1, 1, 1, 1,
-0.1327258, 0.9737269, -0.6126011, 1, 1, 1, 1, 1,
-0.1317278, 1.768678, 0.858312, 1, 1, 1, 1, 1,
-0.1315352, -1.280383, -2.841434, 1, 1, 1, 1, 1,
-0.1295635, 0.1646436, 0.1393695, 1, 1, 1, 1, 1,
-0.1293471, 1.489699, 0.1522389, 1, 1, 1, 1, 1,
-0.1284801, -0.03624687, -1.823716, 1, 1, 1, 1, 1,
-0.1259839, -0.4713456, -0.9831917, 1, 1, 1, 1, 1,
-0.1259477, -0.5987602, -3.01268, 1, 1, 1, 1, 1,
-0.1231463, 0.05688918, -1.445273, 1, 1, 1, 1, 1,
-0.1229716, -0.4120778, -3.292125, 1, 1, 1, 1, 1,
-0.1177823, 1.192465, 1.115371, 0, 0, 1, 1, 1,
-0.1168854, -0.6202659, -1.639282, 1, 0, 0, 1, 1,
-0.1144805, -0.9850957, -3.11106, 1, 0, 0, 1, 1,
-0.1135837, -1.073233, -2.993196, 1, 0, 0, 1, 1,
-0.1134681, -0.1865522, -1.717261, 1, 0, 0, 1, 1,
-0.1102688, -0.7654096, -2.461227, 1, 0, 0, 1, 1,
-0.1100814, -0.8372449, -2.085151, 0, 0, 0, 1, 1,
-0.1077676, -1.036481, -3.152753, 0, 0, 0, 1, 1,
-0.1076042, 1.75134, 0.5500321, 0, 0, 0, 1, 1,
-0.1068514, 1.811007, 0.8341517, 0, 0, 0, 1, 1,
-0.1047288, -0.5749522, -2.620512, 0, 0, 0, 1, 1,
-0.1037382, -0.6430036, -2.471505, 0, 0, 0, 1, 1,
-0.1036748, -0.747417, -3.175578, 0, 0, 0, 1, 1,
-0.1020628, -0.7874526, -2.837209, 1, 1, 1, 1, 1,
-0.09931646, 0.5280118, -1.116175, 1, 1, 1, 1, 1,
-0.09774248, 0.8945466, -0.9273751, 1, 1, 1, 1, 1,
-0.09698013, 0.8735865, 0.2556194, 1, 1, 1, 1, 1,
-0.09416314, 1.195927, 0.9139643, 1, 1, 1, 1, 1,
-0.08390362, -0.02887493, -1.624588, 1, 1, 1, 1, 1,
-0.08250726, -1.081878, -3.179664, 1, 1, 1, 1, 1,
-0.07952168, -0.2488519, -2.403337, 1, 1, 1, 1, 1,
-0.07944475, 0.5435507, 0.4019413, 1, 1, 1, 1, 1,
-0.07813244, 1.021117, -0.9078705, 1, 1, 1, 1, 1,
-0.07800498, -1.078975, -3.885255, 1, 1, 1, 1, 1,
-0.07796437, 0.9500382, -0.3129767, 1, 1, 1, 1, 1,
-0.07508252, -0.4762204, -2.689239, 1, 1, 1, 1, 1,
-0.07461072, -0.06071558, -1.362094, 1, 1, 1, 1, 1,
-0.06164542, -0.5134302, -3.775765, 1, 1, 1, 1, 1,
-0.06084524, 1.358713, 0.8852186, 0, 0, 1, 1, 1,
-0.05744393, -1.459715, -3.418886, 1, 0, 0, 1, 1,
-0.05709716, -0.1820079, -1.44283, 1, 0, 0, 1, 1,
-0.05501691, 0.05015751, -2.842689, 1, 0, 0, 1, 1,
-0.05483637, -0.8701462, -2.26121, 1, 0, 0, 1, 1,
-0.05276661, -0.02333951, -2.474749, 1, 0, 0, 1, 1,
-0.05235112, -2.042013, -2.002925, 0, 0, 0, 1, 1,
-0.05115703, -0.8630154, -4.756411, 0, 0, 0, 1, 1,
-0.05013766, -0.9481651, -3.26402, 0, 0, 0, 1, 1,
-0.04641614, -0.5092211, -3.389385, 0, 0, 0, 1, 1,
-0.0419131, 1.301056, 1.050611, 0, 0, 0, 1, 1,
-0.03535065, 2.022428, -0.1777624, 0, 0, 0, 1, 1,
-0.02814543, -0.3860983, -3.130159, 0, 0, 0, 1, 1,
-0.02639285, -0.8503998, -2.932693, 1, 1, 1, 1, 1,
-0.02099917, -1.032586, -3.855387, 1, 1, 1, 1, 1,
-0.01700058, -0.6204726, -1.99555, 1, 1, 1, 1, 1,
-0.015846, 1.765453, 0.3071508, 1, 1, 1, 1, 1,
-0.01526858, -0.4257916, -3.844768, 1, 1, 1, 1, 1,
-0.0126081, -0.3781657, -3.007193, 1, 1, 1, 1, 1,
-0.009749066, 1.882384, -0.8739282, 1, 1, 1, 1, 1,
-0.009409354, -2.136448, -4.29889, 1, 1, 1, 1, 1,
-0.006798451, 0.2085595, 0.5431073, 1, 1, 1, 1, 1,
-0.005365252, -0.7211558, -3.324747, 1, 1, 1, 1, 1,
-0.001666954, 0.3913003, -1.792478, 1, 1, 1, 1, 1,
0.001594686, 0.6315636, 0.7464911, 1, 1, 1, 1, 1,
0.009406944, 0.4497135, -0.2348897, 1, 1, 1, 1, 1,
0.009469891, -0.9836806, 4.10843, 1, 1, 1, 1, 1,
0.009840266, 0.4479618, 0.1728764, 1, 1, 1, 1, 1,
0.01222789, -0.5131752, 2.484722, 0, 0, 1, 1, 1,
0.01378884, 1.524656, -0.3879994, 1, 0, 0, 1, 1,
0.01458969, 1.672401, -1.381178, 1, 0, 0, 1, 1,
0.0151858, 0.40463, 0.7154824, 1, 0, 0, 1, 1,
0.01890547, 0.524583, 1.54379, 1, 0, 0, 1, 1,
0.02103199, 0.5900391, -0.08789638, 1, 0, 0, 1, 1,
0.02535704, -0.01468394, 1.378804, 0, 0, 0, 1, 1,
0.02552783, 1.00973, -0.1194518, 0, 0, 0, 1, 1,
0.02600835, -0.6916503, 4.246024, 0, 0, 0, 1, 1,
0.02638993, -0.1415973, 2.532253, 0, 0, 0, 1, 1,
0.02972637, -0.2028301, 2.62347, 0, 0, 0, 1, 1,
0.0368556, -2.376204, 3.064188, 0, 0, 0, 1, 1,
0.04270144, 1.110739, 1.125201, 0, 0, 0, 1, 1,
0.04295603, -0.03310682, 4.756255, 1, 1, 1, 1, 1,
0.0439249, 1.28391, -0.2509066, 1, 1, 1, 1, 1,
0.04397459, -0.5084503, 2.90742, 1, 1, 1, 1, 1,
0.04532535, 0.3176389, 0.5938122, 1, 1, 1, 1, 1,
0.04796297, -0.3442364, 3.081698, 1, 1, 1, 1, 1,
0.05164628, 0.2119762, 0.5791104, 1, 1, 1, 1, 1,
0.05355929, 0.3199212, 2.495845, 1, 1, 1, 1, 1,
0.05394211, -1.603415, 1.43742, 1, 1, 1, 1, 1,
0.05545769, -0.8701367, 2.027802, 1, 1, 1, 1, 1,
0.0560993, -0.567021, 3.313611, 1, 1, 1, 1, 1,
0.05656999, -1.894773, 3.183765, 1, 1, 1, 1, 1,
0.05832624, 0.3620124, 1.034907, 1, 1, 1, 1, 1,
0.06267205, 1.76695, -1.698984, 1, 1, 1, 1, 1,
0.06451979, -0.008397932, 1.199664, 1, 1, 1, 1, 1,
0.06514639, 2.917158, -2.014606, 1, 1, 1, 1, 1,
0.07342299, -0.03606748, 3.133055, 0, 0, 1, 1, 1,
0.07547709, -1.681589, 2.061734, 1, 0, 0, 1, 1,
0.07764793, 0.2614982, -0.7119524, 1, 0, 0, 1, 1,
0.07985063, -0.777722, 2.268128, 1, 0, 0, 1, 1,
0.07986777, 2.07587, -0.09834446, 1, 0, 0, 1, 1,
0.08659974, -0.04389669, 1.114475, 1, 0, 0, 1, 1,
0.08673961, -0.8526593, 3.219748, 0, 0, 0, 1, 1,
0.08710703, -0.5807504, 4.181916, 0, 0, 0, 1, 1,
0.0878134, 0.3273615, -0.05284332, 0, 0, 0, 1, 1,
0.09049453, 0.9463187, -0.7213391, 0, 0, 0, 1, 1,
0.0925568, 1.496964, 0.389577, 0, 0, 0, 1, 1,
0.09288635, 0.5066642, 0.1457333, 0, 0, 0, 1, 1,
0.1042937, -3.061486, 3.92562, 0, 0, 0, 1, 1,
0.1055069, 0.007158731, 2.165855, 1, 1, 1, 1, 1,
0.1081361, -0.1103588, 1.915869, 1, 1, 1, 1, 1,
0.1088662, -0.06472332, 2.777103, 1, 1, 1, 1, 1,
0.1091745, -1.483662, 2.364972, 1, 1, 1, 1, 1,
0.1121789, 0.957458, 0.2849309, 1, 1, 1, 1, 1,
0.1167249, 0.1238773, 1.530318, 1, 1, 1, 1, 1,
0.1224261, -0.1946966, 1.060476, 1, 1, 1, 1, 1,
0.1249534, 1.244714, 2.20123, 1, 1, 1, 1, 1,
0.1253905, 0.9584879, -0.9385622, 1, 1, 1, 1, 1,
0.1258168, 0.654098, 0.4729351, 1, 1, 1, 1, 1,
0.1265833, -1.925432, 3.005878, 1, 1, 1, 1, 1,
0.1287107, -0.01395217, 1.637719, 1, 1, 1, 1, 1,
0.129734, -1.395553, 3.389009, 1, 1, 1, 1, 1,
0.1321253, 0.207334, -0.612109, 1, 1, 1, 1, 1,
0.1326694, 0.4997017, 0.38461, 1, 1, 1, 1, 1,
0.1345302, 1.251277, 1.072328, 0, 0, 1, 1, 1,
0.1355853, -0.106148, 4.855174, 1, 0, 0, 1, 1,
0.1362173, -0.6657974, 1.862988, 1, 0, 0, 1, 1,
0.1363954, 1.211702, -0.7185006, 1, 0, 0, 1, 1,
0.1401657, -0.1017472, 2.088941, 1, 0, 0, 1, 1,
0.1433077, -0.4672085, 4.381016, 1, 0, 0, 1, 1,
0.1472981, -0.1881205, 2.193325, 0, 0, 0, 1, 1,
0.1477319, 0.4882065, 1.304289, 0, 0, 0, 1, 1,
0.1486914, 0.4116257, -0.5165606, 0, 0, 0, 1, 1,
0.151736, 1.546734, 1.249227, 0, 0, 0, 1, 1,
0.153305, -0.2779607, 1.476671, 0, 0, 0, 1, 1,
0.1537795, 0.0944244, 1.725899, 0, 0, 0, 1, 1,
0.1571854, -1.059189, 3.237413, 0, 0, 0, 1, 1,
0.1597635, -0.04156451, 2.515941, 1, 1, 1, 1, 1,
0.1610251, -1.104758, 3.750739, 1, 1, 1, 1, 1,
0.1624088, 0.6843745, -0.672973, 1, 1, 1, 1, 1,
0.1624631, -0.7129691, 3.379205, 1, 1, 1, 1, 1,
0.1712638, -0.8980163, 3.245155, 1, 1, 1, 1, 1,
0.1801012, 1.298651, 1.395626, 1, 1, 1, 1, 1,
0.1811596, -0.2780507, 3.648576, 1, 1, 1, 1, 1,
0.1877089, -1.073263, 4.341123, 1, 1, 1, 1, 1,
0.1904754, -0.7386871, 3.10266, 1, 1, 1, 1, 1,
0.1944577, -0.8831403, 2.957874, 1, 1, 1, 1, 1,
0.1947063, 0.09168961, -0.1128482, 1, 1, 1, 1, 1,
0.1966808, 1.68734, -1.545339, 1, 1, 1, 1, 1,
0.1984605, 0.2117566, -0.3060474, 1, 1, 1, 1, 1,
0.2022734, 0.5736141, -0.5970981, 1, 1, 1, 1, 1,
0.2026655, -2.248016, 4.645265, 1, 1, 1, 1, 1,
0.2096676, -1.152752, 1.54976, 0, 0, 1, 1, 1,
0.2117825, 0.7164134, 1.077658, 1, 0, 0, 1, 1,
0.2132435, 1.055883, 0.9290994, 1, 0, 0, 1, 1,
0.2132747, -0.3180873, 1.659017, 1, 0, 0, 1, 1,
0.2218983, 1.59169, -0.7114738, 1, 0, 0, 1, 1,
0.2250501, 0.4156257, 0.2107901, 1, 0, 0, 1, 1,
0.2260712, -1.761437, 3.872628, 0, 0, 0, 1, 1,
0.226409, -1.067469, 3.750549, 0, 0, 0, 1, 1,
0.2277219, 0.7888535, -0.7164623, 0, 0, 0, 1, 1,
0.2289843, 1.444712, -0.3524898, 0, 0, 0, 1, 1,
0.2346705, 0.3829798, 1.833447, 0, 0, 0, 1, 1,
0.2364379, -1.113895, 4.148056, 0, 0, 0, 1, 1,
0.2393664, 0.100067, 1.484582, 0, 0, 0, 1, 1,
0.2395367, 0.007341289, 1.264168, 1, 1, 1, 1, 1,
0.246535, 0.5819973, 0.184916, 1, 1, 1, 1, 1,
0.2483532, 0.006679332, 1.16595, 1, 1, 1, 1, 1,
0.2484137, 0.07722183, 2.017132, 1, 1, 1, 1, 1,
0.24974, -0.7527682, 1.90144, 1, 1, 1, 1, 1,
0.2501414, 0.9213231, -0.7028577, 1, 1, 1, 1, 1,
0.2511042, 1.633861, -0.08386254, 1, 1, 1, 1, 1,
0.2516672, 1.240692, -1.333926, 1, 1, 1, 1, 1,
0.2555863, -1.666074, 1.729103, 1, 1, 1, 1, 1,
0.2570619, 0.09067803, -0.3830138, 1, 1, 1, 1, 1,
0.2588822, -0.2321693, 2.186391, 1, 1, 1, 1, 1,
0.2596932, -0.3171127, 3.232353, 1, 1, 1, 1, 1,
0.2700168, 0.9799142, -1.864791, 1, 1, 1, 1, 1,
0.2713396, 0.5492161, 0.1849507, 1, 1, 1, 1, 1,
0.272048, 1.384236, -1.282308, 1, 1, 1, 1, 1,
0.2721895, -0.612898, 1.948588, 0, 0, 1, 1, 1,
0.2735936, 0.7632521, 1.918211, 1, 0, 0, 1, 1,
0.2753807, -0.2152651, 3.152287, 1, 0, 0, 1, 1,
0.2835326, -0.7985684, 1.717773, 1, 0, 0, 1, 1,
0.2837653, 0.923969, 0.5939536, 1, 0, 0, 1, 1,
0.2856552, -1.302574, 3.332369, 1, 0, 0, 1, 1,
0.2890877, -0.419043, 2.459466, 0, 0, 0, 1, 1,
0.2930538, -0.6717432, 1.773912, 0, 0, 0, 1, 1,
0.2963571, 0.1711233, 2.572348, 0, 0, 0, 1, 1,
0.2995448, 0.6665851, 0.7156803, 0, 0, 0, 1, 1,
0.305678, -0.2660477, 2.393265, 0, 0, 0, 1, 1,
0.3080802, 2.540321, 0.2675028, 0, 0, 0, 1, 1,
0.3143147, -1.395531, 2.658035, 0, 0, 0, 1, 1,
0.3153507, -0.5701554, 3.238786, 1, 1, 1, 1, 1,
0.3157321, -0.8805389, 2.600842, 1, 1, 1, 1, 1,
0.3157709, -1.411222, 3.082294, 1, 1, 1, 1, 1,
0.316442, -0.6396768, 1.84663, 1, 1, 1, 1, 1,
0.3172803, -0.112176, 0.05719702, 1, 1, 1, 1, 1,
0.3237782, 0.389055, 1.635306, 1, 1, 1, 1, 1,
0.3270454, -0.8313968, 3.671682, 1, 1, 1, 1, 1,
0.3277899, -0.1206601, 1.406954, 1, 1, 1, 1, 1,
0.328737, 0.201839, 0.3966493, 1, 1, 1, 1, 1,
0.3302647, -2.444525, 4.438488, 1, 1, 1, 1, 1,
0.3354625, -0.330243, 2.708051, 1, 1, 1, 1, 1,
0.3356893, 0.6882725, -0.7970582, 1, 1, 1, 1, 1,
0.3388171, -1.503958, 3.256492, 1, 1, 1, 1, 1,
0.3413546, -0.8843102, 2.217667, 1, 1, 1, 1, 1,
0.3434713, -1.499252, 0.957889, 1, 1, 1, 1, 1,
0.3494464, -0.6168444, 1.966272, 0, 0, 1, 1, 1,
0.3506585, 0.4386182, 0.6441926, 1, 0, 0, 1, 1,
0.3563751, -1.536183, 2.714023, 1, 0, 0, 1, 1,
0.3583078, 0.1393819, -0.4922659, 1, 0, 0, 1, 1,
0.360256, 0.6950455, 1.715622, 1, 0, 0, 1, 1,
0.3674669, -0.7692872, 4.115139, 1, 0, 0, 1, 1,
0.3688298, -0.4554226, 3.570752, 0, 0, 0, 1, 1,
0.3694587, 1.207773, -0.2654801, 0, 0, 0, 1, 1,
0.3695043, 1.091733, -0.7037125, 0, 0, 0, 1, 1,
0.3697658, -0.8618193, 2.185569, 0, 0, 0, 1, 1,
0.3715705, -1.654224, 4.590989, 0, 0, 0, 1, 1,
0.3720454, 1.447486, 0.2306453, 0, 0, 0, 1, 1,
0.3764511, -1.921257, 2.373639, 0, 0, 0, 1, 1,
0.3766571, 1.668952, -0.3910542, 1, 1, 1, 1, 1,
0.3796874, 1.425324, 0.4603783, 1, 1, 1, 1, 1,
0.3858276, -1.381908, 2.010253, 1, 1, 1, 1, 1,
0.3864063, 1.354361, -0.2271127, 1, 1, 1, 1, 1,
0.3947939, -0.2017807, 2.736147, 1, 1, 1, 1, 1,
0.3957483, -0.2577897, 2.621904, 1, 1, 1, 1, 1,
0.3965403, -0.4443324, 2.828524, 1, 1, 1, 1, 1,
0.396855, 0.9709242, 0.849116, 1, 1, 1, 1, 1,
0.3993458, 1.159791, 0.7786002, 1, 1, 1, 1, 1,
0.4010899, -0.07962988, 2.322805, 1, 1, 1, 1, 1,
0.4030203, 0.1230947, 0.8799976, 1, 1, 1, 1, 1,
0.4034144, 0.1112073, 2.623904, 1, 1, 1, 1, 1,
0.4060965, -0.6268864, 2.759737, 1, 1, 1, 1, 1,
0.4104599, -1.128723, 2.893222, 1, 1, 1, 1, 1,
0.4140423, 0.2992128, -0.4954091, 1, 1, 1, 1, 1,
0.4142742, 0.8124818, -0.08136623, 0, 0, 1, 1, 1,
0.4169489, -0.08433141, 1.585495, 1, 0, 0, 1, 1,
0.4211071, 1.81292, 0.7102224, 1, 0, 0, 1, 1,
0.4222252, -0.1404777, 2.135483, 1, 0, 0, 1, 1,
0.4225329, -2.39845, 2.778298, 1, 0, 0, 1, 1,
0.4240789, -0.02200395, 1.820129, 1, 0, 0, 1, 1,
0.4263518, -0.3065676, 2.579035, 0, 0, 0, 1, 1,
0.4301763, -0.758552, 3.143471, 0, 0, 0, 1, 1,
0.433216, 0.5241727, -0.866075, 0, 0, 0, 1, 1,
0.4379813, 0.1031181, 0.6706425, 0, 0, 0, 1, 1,
0.4457739, -2.283977, 2.358093, 0, 0, 0, 1, 1,
0.4469247, 0.1820185, -0.100325, 0, 0, 0, 1, 1,
0.4560397, 0.06236272, -1.005191, 0, 0, 0, 1, 1,
0.4578557, -0.1691684, 1.23583, 1, 1, 1, 1, 1,
0.4620471, 1.299036, 1.848297, 1, 1, 1, 1, 1,
0.4664828, 0.530337, 0.3890915, 1, 1, 1, 1, 1,
0.4736362, 0.797843, 0.0415455, 1, 1, 1, 1, 1,
0.4747913, -1.42069, 2.501322, 1, 1, 1, 1, 1,
0.4758799, -1.34309, 2.692978, 1, 1, 1, 1, 1,
0.475899, -0.8697693, 2.258573, 1, 1, 1, 1, 1,
0.4791828, -0.3250052, 3.254978, 1, 1, 1, 1, 1,
0.4794631, -1.177131, 2.589679, 1, 1, 1, 1, 1,
0.4846828, -0.5684976, 2.814257, 1, 1, 1, 1, 1,
0.4879402, 0.5196569, 0.4190414, 1, 1, 1, 1, 1,
0.4883115, 0.6592034, 1.381221, 1, 1, 1, 1, 1,
0.4962339, 0.3423762, -0.1896064, 1, 1, 1, 1, 1,
0.5037773, 1.049471, -0.2697633, 1, 1, 1, 1, 1,
0.5080432, 1.624398, 0.5634277, 1, 1, 1, 1, 1,
0.5091539, -0.697446, 2.905622, 0, 0, 1, 1, 1,
0.5119637, -0.4961044, 3.417518, 1, 0, 0, 1, 1,
0.5130951, -0.08620715, 0.4287418, 1, 0, 0, 1, 1,
0.5160101, -1.03148, 2.20498, 1, 0, 0, 1, 1,
0.5169699, -0.3195436, 2.755196, 1, 0, 0, 1, 1,
0.5181376, 0.4343364, 0.45487, 1, 0, 0, 1, 1,
0.5183267, -0.6848398, 1.092058, 0, 0, 0, 1, 1,
0.5232551, -0.4421015, 1.206, 0, 0, 0, 1, 1,
0.5273944, -1.281104, 0.7476024, 0, 0, 0, 1, 1,
0.5281842, 0.1797769, 2.405767, 0, 0, 0, 1, 1,
0.5285101, 0.6840535, -0.8095024, 0, 0, 0, 1, 1,
0.5319425, 0.6565228, 1.092434, 0, 0, 0, 1, 1,
0.5374182, -0.9127218, 1.574694, 0, 0, 0, 1, 1,
0.5408316, -0.05463232, 2.913859, 1, 1, 1, 1, 1,
0.541215, -0.4719519, 2.301582, 1, 1, 1, 1, 1,
0.5486047, 0.2649036, 1.645452, 1, 1, 1, 1, 1,
0.5491968, -0.3779775, 2.732709, 1, 1, 1, 1, 1,
0.5526458, -1.560607, 1.752766, 1, 1, 1, 1, 1,
0.5526461, 0.8765654, 0.7036567, 1, 1, 1, 1, 1,
0.5533377, 0.5457302, -0.945596, 1, 1, 1, 1, 1,
0.5550746, -0.6840726, 3.597872, 1, 1, 1, 1, 1,
0.5554424, -0.06302327, 2.40658, 1, 1, 1, 1, 1,
0.5582511, 0.6155472, 2.368602, 1, 1, 1, 1, 1,
0.5622305, -0.2325089, 1.776245, 1, 1, 1, 1, 1,
0.5644907, -0.8264968, 3.660354, 1, 1, 1, 1, 1,
0.567169, 0.5630213, -0.2764835, 1, 1, 1, 1, 1,
0.570052, 0.03282087, 1.338744, 1, 1, 1, 1, 1,
0.5731615, 0.6812066, 1.159492, 1, 1, 1, 1, 1,
0.5748294, 1.592283, 0.9939796, 0, 0, 1, 1, 1,
0.5750676, 0.716469, 1.591881, 1, 0, 0, 1, 1,
0.577332, -0.6894289, 2.069295, 1, 0, 0, 1, 1,
0.5813671, -0.6428611, 2.65258, 1, 0, 0, 1, 1,
0.5819029, 0.08038036, 1.951981, 1, 0, 0, 1, 1,
0.5827755, -0.1627491, 1.132157, 1, 0, 0, 1, 1,
0.5852991, -1.404287, 2.919067, 0, 0, 0, 1, 1,
0.587487, 1.24139, 1.341504, 0, 0, 0, 1, 1,
0.5885932, 0.2912927, -0.04789242, 0, 0, 0, 1, 1,
0.5892522, 1.186847, 0.1681875, 0, 0, 0, 1, 1,
0.593134, 0.2962826, 2.948941, 0, 0, 0, 1, 1,
0.5971926, -0.4226238, 2.670816, 0, 0, 0, 1, 1,
0.6073086, -0.3594305, 1.034318, 0, 0, 0, 1, 1,
0.6086382, -1.034942, 3.148337, 1, 1, 1, 1, 1,
0.6160782, -0.4024058, 2.491101, 1, 1, 1, 1, 1,
0.6183029, -1.587527, 2.521184, 1, 1, 1, 1, 1,
0.620742, 0.8837903, 0.006734142, 1, 1, 1, 1, 1,
0.625293, -0.41696, 2.320978, 1, 1, 1, 1, 1,
0.6255338, 0.6526499, 0.4104115, 1, 1, 1, 1, 1,
0.6288932, -0.6985459, 2.468672, 1, 1, 1, 1, 1,
0.6372184, -1.492312, 1.27232, 1, 1, 1, 1, 1,
0.6377005, -0.6121315, 1.079013, 1, 1, 1, 1, 1,
0.6405509, 0.01041177, 2.205053, 1, 1, 1, 1, 1,
0.6458701, -0.09734777, 1.27856, 1, 1, 1, 1, 1,
0.6467068, 0.7628019, -2.072036, 1, 1, 1, 1, 1,
0.6523573, -0.01484034, 3.138083, 1, 1, 1, 1, 1,
0.6580939, -0.3432256, 0.1991602, 1, 1, 1, 1, 1,
0.6634881, 0.4367618, 0.8233969, 1, 1, 1, 1, 1,
0.6652831, -0.1564788, 1.778723, 0, 0, 1, 1, 1,
0.6682094, 0.50703, 1.996357, 1, 0, 0, 1, 1,
0.672175, -0.6278306, 3.521272, 1, 0, 0, 1, 1,
0.6768422, 1.407776, 0.2024449, 1, 0, 0, 1, 1,
0.6785976, -1.227459, 1.238102, 1, 0, 0, 1, 1,
0.6878663, 1.018159, 0.7412958, 1, 0, 0, 1, 1,
0.6889482, -0.6838677, 4.078077, 0, 0, 0, 1, 1,
0.6984995, -1.17264, 1.754183, 0, 0, 0, 1, 1,
0.7005491, 0.3349784, 1.648213, 0, 0, 0, 1, 1,
0.7008867, -1.011179, 2.934329, 0, 0, 0, 1, 1,
0.7030933, 0.1789384, 0.5551967, 0, 0, 0, 1, 1,
0.7044447, 0.8221792, 1.345018, 0, 0, 0, 1, 1,
0.7051213, 1.613374, 1.291596, 0, 0, 0, 1, 1,
0.7072185, -0.9141147, 4.200311, 1, 1, 1, 1, 1,
0.7076373, 0.5771977, 0.2462399, 1, 1, 1, 1, 1,
0.7118944, -0.2959459, 0.7350485, 1, 1, 1, 1, 1,
0.7125329, 0.2324086, 2.14005, 1, 1, 1, 1, 1,
0.7156258, -0.3495961, 2.38408, 1, 1, 1, 1, 1,
0.7174608, -0.4951909, 0.4193784, 1, 1, 1, 1, 1,
0.719549, 0.03585057, 2.207299, 1, 1, 1, 1, 1,
0.7210885, 1.101953, 0.3408279, 1, 1, 1, 1, 1,
0.72126, 0.5340564, 1.392601, 1, 1, 1, 1, 1,
0.7235835, -2.206393, 4.129591, 1, 1, 1, 1, 1,
0.7245988, -1.484468, 3.337305, 1, 1, 1, 1, 1,
0.7303471, -0.1135835, 0.7126037, 1, 1, 1, 1, 1,
0.7313716, -0.2870785, 1.293429, 1, 1, 1, 1, 1,
0.7352307, 0.154417, 2.110163, 1, 1, 1, 1, 1,
0.7362753, -0.1499929, 1.682143, 1, 1, 1, 1, 1,
0.7380569, -1.476973, 2.825183, 0, 0, 1, 1, 1,
0.7399005, 0.2109653, 0.6751921, 1, 0, 0, 1, 1,
0.7518693, 0.1428058, 2.647189, 1, 0, 0, 1, 1,
0.7521552, -0.06922482, 2.157089, 1, 0, 0, 1, 1,
0.753153, -1.392169, 2.168987, 1, 0, 0, 1, 1,
0.7545897, 0.9540619, 1.621557, 1, 0, 0, 1, 1,
0.7555068, -0.6130135, 1.849617, 0, 0, 0, 1, 1,
0.7566442, -0.6924074, 1.898553, 0, 0, 0, 1, 1,
0.7576521, 0.6931449, 0.6287416, 0, 0, 0, 1, 1,
0.7589746, -1.049857, 3.061612, 0, 0, 0, 1, 1,
0.7631029, -0.1715077, 2.262968, 0, 0, 0, 1, 1,
0.7636346, -0.362727, 1.250528, 0, 0, 0, 1, 1,
0.7656557, 0.8259284, 0.6580777, 0, 0, 0, 1, 1,
0.7699053, -0.5563776, 1.970311, 1, 1, 1, 1, 1,
0.7711201, -1.766786, 3.345638, 1, 1, 1, 1, 1,
0.7734564, -0.7058598, 1.112957, 1, 1, 1, 1, 1,
0.7736046, 0.7082402, 1.90463, 1, 1, 1, 1, 1,
0.7739486, 0.5707953, 0.09767115, 1, 1, 1, 1, 1,
0.7753369, -0.3774709, 1.090071, 1, 1, 1, 1, 1,
0.779915, 1.944219, -0.9108023, 1, 1, 1, 1, 1,
0.789165, -0.940775, 2.616428, 1, 1, 1, 1, 1,
0.7893247, -0.4086193, 2.532236, 1, 1, 1, 1, 1,
0.7946218, -0.634133, 2.465133, 1, 1, 1, 1, 1,
0.7979605, -0.5146096, 2.176537, 1, 1, 1, 1, 1,
0.8120461, 0.3254537, 1.126188, 1, 1, 1, 1, 1,
0.8122262, -0.8183205, 2.250485, 1, 1, 1, 1, 1,
0.8146493, -0.7886858, 3.244827, 1, 1, 1, 1, 1,
0.8161231, 1.902382, 1.150554, 1, 1, 1, 1, 1,
0.8232732, -0.5184204, 4.251014, 0, 0, 1, 1, 1,
0.829336, -0.7453231, 2.33773, 1, 0, 0, 1, 1,
0.8294032, -0.2644978, 3.30275, 1, 0, 0, 1, 1,
0.8320355, 0.198455, 1.783692, 1, 0, 0, 1, 1,
0.8324717, 0.3112644, 0.4909071, 1, 0, 0, 1, 1,
0.8345243, -1.602139, 2.740049, 1, 0, 0, 1, 1,
0.8412235, 1.87697, 0.6820828, 0, 0, 0, 1, 1,
0.8447237, -0.375175, 2.351441, 0, 0, 0, 1, 1,
0.8454546, 1.599486, 1.040138, 0, 0, 0, 1, 1,
0.8510917, -0.02076666, 2.44807, 0, 0, 0, 1, 1,
0.8533897, -1.231068, 4.167415, 0, 0, 0, 1, 1,
0.8536466, 0.4687334, 0.900423, 0, 0, 0, 1, 1,
0.8606421, 1.070637, -0.2870071, 0, 0, 0, 1, 1,
0.8632981, 2.338546, 0.8428627, 1, 1, 1, 1, 1,
0.8679264, 0.2652538, 0.5377674, 1, 1, 1, 1, 1,
0.8687515, 1.362416, 0.7363994, 1, 1, 1, 1, 1,
0.8825642, 0.2663444, -0.1070239, 1, 1, 1, 1, 1,
0.8865493, 0.1801031, 2.032561, 1, 1, 1, 1, 1,
0.8940794, 2.22924, 0.02804541, 1, 1, 1, 1, 1,
0.9064406, 0.5726117, 1.904262, 1, 1, 1, 1, 1,
0.9152436, 0.5833352, 0.4409386, 1, 1, 1, 1, 1,
0.9192987, -0.339698, 3.856487, 1, 1, 1, 1, 1,
0.9231192, 0.4946856, -0.3340197, 1, 1, 1, 1, 1,
0.9242969, -0.9011577, 2.508768, 1, 1, 1, 1, 1,
0.9264098, -0.4041956, 2.353801, 1, 1, 1, 1, 1,
0.9306177, 1.025235, -1.016955, 1, 1, 1, 1, 1,
0.9306788, 1.397806, 0.4030675, 1, 1, 1, 1, 1,
0.9327452, 0.6898834, 0.1876403, 1, 1, 1, 1, 1,
0.9348118, -0.6621529, 2.38921, 0, 0, 1, 1, 1,
0.9495989, -0.9855958, 3.292885, 1, 0, 0, 1, 1,
0.9510422, 0.8306978, -0.7044872, 1, 0, 0, 1, 1,
0.9534672, -0.5794474, 2.949186, 1, 0, 0, 1, 1,
0.9539731, 0.1342356, 0.1153996, 1, 0, 0, 1, 1,
0.9581101, 0.01141574, 0.7990295, 1, 0, 0, 1, 1,
0.9611292, 0.581183, 0.270934, 0, 0, 0, 1, 1,
0.9631351, -2.157842, 2.946288, 0, 0, 0, 1, 1,
0.9670826, 1.16652, 1.756561, 0, 0, 0, 1, 1,
0.9775884, 0.5464049, -0.2818293, 0, 0, 0, 1, 1,
0.9787713, 1.261567, 1.203053, 0, 0, 0, 1, 1,
0.9791011, 0.6641253, 0.6798172, 0, 0, 0, 1, 1,
0.9923205, -1.377035, 3.088565, 0, 0, 0, 1, 1,
0.9944972, 0.58105, 3.370899, 1, 1, 1, 1, 1,
1.004962, 0.3591979, 2.401443, 1, 1, 1, 1, 1,
1.00661, 0.5292358, -0.3328442, 1, 1, 1, 1, 1,
1.009161, -0.8086545, 0.9387373, 1, 1, 1, 1, 1,
1.011132, 2.167859, -0.1416366, 1, 1, 1, 1, 1,
1.019808, 0.6005993, -0.3373324, 1, 1, 1, 1, 1,
1.02418, -0.1992378, 2.273295, 1, 1, 1, 1, 1,
1.026565, 1.003566, -0.1719243, 1, 1, 1, 1, 1,
1.02841, 0.3688813, 1.015041, 1, 1, 1, 1, 1,
1.028848, 0.08042846, 1.585351, 1, 1, 1, 1, 1,
1.03388, -0.3300875, 1.349246, 1, 1, 1, 1, 1,
1.034386, -0.7693681, 2.750065, 1, 1, 1, 1, 1,
1.046606, 0.3511714, 0.3065024, 1, 1, 1, 1, 1,
1.052349, 0.3558626, 2.503082, 1, 1, 1, 1, 1,
1.053743, -0.7516661, 3.800632, 1, 1, 1, 1, 1,
1.068367, -1.022203, 1.748194, 0, 0, 1, 1, 1,
1.068522, -0.4298082, 2.693304, 1, 0, 0, 1, 1,
1.071559, -1.340839, 3.090445, 1, 0, 0, 1, 1,
1.073971, -0.8256429, 0.3848888, 1, 0, 0, 1, 1,
1.07428, 0.238905, 2.069364, 1, 0, 0, 1, 1,
1.08092, -0.1886646, 1.432128, 1, 0, 0, 1, 1,
1.08142, 0.0635747, 1.854776, 0, 0, 0, 1, 1,
1.091615, 0.2672469, 0.5573323, 0, 0, 0, 1, 1,
1.116842, -1.445741, 5.374529, 0, 0, 0, 1, 1,
1.131432, -1.605449, 2.396411, 0, 0, 0, 1, 1,
1.146604, 0.8974407, 2.190634, 0, 0, 0, 1, 1,
1.147136, -0.1831533, 2.587014, 0, 0, 0, 1, 1,
1.148367, -0.9990373, 2.290754, 0, 0, 0, 1, 1,
1.15067, 0.3020272, 3.081444, 1, 1, 1, 1, 1,
1.164791, 1.863651, 2.550184, 1, 1, 1, 1, 1,
1.174681, -1.739631, 1.11447, 1, 1, 1, 1, 1,
1.178306, 0.9071339, 0.5495992, 1, 1, 1, 1, 1,
1.18713, -1.639378, 2.64845, 1, 1, 1, 1, 1,
1.188882, -1.390547, 4.75433, 1, 1, 1, 1, 1,
1.19135, 1.000348, 0.6871931, 1, 1, 1, 1, 1,
1.200883, 0.2556026, 1.029696, 1, 1, 1, 1, 1,
1.201459, -0.1179956, 1.638455, 1, 1, 1, 1, 1,
1.211635, -0.6910919, 1.525545, 1, 1, 1, 1, 1,
1.215562, -0.6879474, 1.83675, 1, 1, 1, 1, 1,
1.216123, 0.9151548, 0.3842713, 1, 1, 1, 1, 1,
1.218975, 0.1239953, 0.4577609, 1, 1, 1, 1, 1,
1.221035, 0.09762549, 0.7829501, 1, 1, 1, 1, 1,
1.225834, -0.757987, 2.260324, 1, 1, 1, 1, 1,
1.230464, 0.0381592, 1.617506, 0, 0, 1, 1, 1,
1.235046, -1.378788, 2.330618, 1, 0, 0, 1, 1,
1.242023, 0.3481205, 0.7416469, 1, 0, 0, 1, 1,
1.26091, -0.4859276, 3.050726, 1, 0, 0, 1, 1,
1.266093, -1.19802, 2.951022, 1, 0, 0, 1, 1,
1.270458, 0.5924087, 2.14816, 1, 0, 0, 1, 1,
1.271392, 0.3098015, 0.7282957, 0, 0, 0, 1, 1,
1.288285, 0.4127859, 0.4068567, 0, 0, 0, 1, 1,
1.289471, -1.346581, 3.365744, 0, 0, 0, 1, 1,
1.290426, -0.5476046, 1.74918, 0, 0, 0, 1, 1,
1.293209, 0.4461899, 0.3714694, 0, 0, 0, 1, 1,
1.313562, -0.3185223, 1.786177, 0, 0, 0, 1, 1,
1.325161, 1.375729, 1.329022, 0, 0, 0, 1, 1,
1.325521, 0.0004450668, 2.98632, 1, 1, 1, 1, 1,
1.332323, -0.8713637, 1.953006, 1, 1, 1, 1, 1,
1.338739, -0.3198828, 4.19662, 1, 1, 1, 1, 1,
1.342566, -0.6666216, 1.602031, 1, 1, 1, 1, 1,
1.354632, -1.315359, 2.592674, 1, 1, 1, 1, 1,
1.369953, -1.259856, 1.151127, 1, 1, 1, 1, 1,
1.375462, -0.1151166, 3.989962, 1, 1, 1, 1, 1,
1.38404, -0.2067212, 2.009031, 1, 1, 1, 1, 1,
1.391711, -1.43223, 2.732706, 1, 1, 1, 1, 1,
1.39521, 0.302448, -1.170491, 1, 1, 1, 1, 1,
1.398129, 0.1277004, 1.6988, 1, 1, 1, 1, 1,
1.407254, 0.4653028, 1.596694, 1, 1, 1, 1, 1,
1.421844, -1.175335, 2.287223, 1, 1, 1, 1, 1,
1.423505, -1.736164, 2.114511, 1, 1, 1, 1, 1,
1.431352, 0.00592966, 2.144383, 1, 1, 1, 1, 1,
1.435133, -0.2747837, 2.74394, 0, 0, 1, 1, 1,
1.438226, 0.223069, 0.8860019, 1, 0, 0, 1, 1,
1.460545, -1.564741, 2.220839, 1, 0, 0, 1, 1,
1.490917, 0.7515346, 1.251837, 1, 0, 0, 1, 1,
1.49818, 1.083803, 1.984738, 1, 0, 0, 1, 1,
1.505136, -1.465157, 0.9193971, 1, 0, 0, 1, 1,
1.50609, 1.547525, 0.03215794, 0, 0, 0, 1, 1,
1.509368, 1.660444, -1.109084, 0, 0, 0, 1, 1,
1.521753, -0.8053414, 1.869498, 0, 0, 0, 1, 1,
1.538918, 0.9106048, 0.5664579, 0, 0, 0, 1, 1,
1.561135, 0.437176, 0.9976416, 0, 0, 0, 1, 1,
1.580528, 0.6114246, 3.487686, 0, 0, 0, 1, 1,
1.581867, 1.470022, 2.41161, 0, 0, 0, 1, 1,
1.583617, 1.738906, 0.2523533, 1, 1, 1, 1, 1,
1.589025, 0.1825114, 3.100537, 1, 1, 1, 1, 1,
1.589504, -2.550557, 2.011638, 1, 1, 1, 1, 1,
1.591036, 0.969687, 1.017553, 1, 1, 1, 1, 1,
1.591696, -0.5224907, 1.104446, 1, 1, 1, 1, 1,
1.595249, 0.1398575, 1.787603, 1, 1, 1, 1, 1,
1.599167, -0.123447, 2.564844, 1, 1, 1, 1, 1,
1.607651, -0.6173763, 1.573149, 1, 1, 1, 1, 1,
1.635455, 0.8972535, 1.408357, 1, 1, 1, 1, 1,
1.643008, -2.298352, 3.76583, 1, 1, 1, 1, 1,
1.665882, -1.522605, 3.329938, 1, 1, 1, 1, 1,
1.66908, 0.01143623, -0.4970264, 1, 1, 1, 1, 1,
1.66979, -1.104935, 1.087201, 1, 1, 1, 1, 1,
1.675916, 1.195929, 0.9027757, 1, 1, 1, 1, 1,
1.678967, 0.8594719, 1.766655, 1, 1, 1, 1, 1,
1.683045, -1.302805, 3.005898, 0, 0, 1, 1, 1,
1.684661, 2.277245, 0.8190075, 1, 0, 0, 1, 1,
1.692919, 0.7840095, 1.675112, 1, 0, 0, 1, 1,
1.710187, 1.091651, 0.5787112, 1, 0, 0, 1, 1,
1.713661, -0.05278022, 1.051892, 1, 0, 0, 1, 1,
1.724669, 1.30725, 1.605783, 1, 0, 0, 1, 1,
1.750472, 1.519801, -0.197355, 0, 0, 0, 1, 1,
1.761046, 0.5996222, 1.882672, 0, 0, 0, 1, 1,
1.81684, -0.8790665, 2.921228, 0, 0, 0, 1, 1,
1.81893, 2.022074, -0.2476242, 0, 0, 0, 1, 1,
1.827381, -1.034767, 0.5423905, 0, 0, 0, 1, 1,
1.84076, 1.384305, 1.42625, 0, 0, 0, 1, 1,
1.841539, -0.5983381, 2.004001, 0, 0, 0, 1, 1,
1.841748, 1.984448, 0.8892705, 1, 1, 1, 1, 1,
1.858167, 1.40506, 2.433933, 1, 1, 1, 1, 1,
1.860105, 1.23508, 1.131465, 1, 1, 1, 1, 1,
1.8871, -0.5651478, 2.128143, 1, 1, 1, 1, 1,
1.90711, 0.6808227, 0.2714751, 1, 1, 1, 1, 1,
1.919132, -0.03407591, 1.419198, 1, 1, 1, 1, 1,
1.95048, 1.005253, 2.145025, 1, 1, 1, 1, 1,
1.956112, -0.02893823, 1.701511, 1, 1, 1, 1, 1,
1.981102, 0.2965488, 1.875192, 1, 1, 1, 1, 1,
1.990458, -0.6144593, 3.336343, 1, 1, 1, 1, 1,
2.013427, -0.4637004, 2.556102, 1, 1, 1, 1, 1,
2.0389, -0.8594782, 3.000634, 1, 1, 1, 1, 1,
2.04325, 1.257848, 0.4568641, 1, 1, 1, 1, 1,
2.055071, 0.609875, 2.059911, 1, 1, 1, 1, 1,
2.066622, -1.334802, 1.432567, 1, 1, 1, 1, 1,
2.076725, 0.0185786, 0.9873577, 0, 0, 1, 1, 1,
2.096354, -0.1038873, 1.645714, 1, 0, 0, 1, 1,
2.10107, 0.4768574, 1.597797, 1, 0, 0, 1, 1,
2.134588, -0.6107329, 1.107296, 1, 0, 0, 1, 1,
2.176597, 1.724918, 2.232305, 1, 0, 0, 1, 1,
2.179947, 1.143517, -0.009467211, 1, 0, 0, 1, 1,
2.221424, -0.5697671, 2.006303, 0, 0, 0, 1, 1,
2.26281, 1.032605, 2.606309, 0, 0, 0, 1, 1,
2.265753, -0.2408102, 1.58754, 0, 0, 0, 1, 1,
2.291983, -1.355593, 0.8989503, 0, 0, 0, 1, 1,
2.294336, 0.4782122, 2.133181, 0, 0, 0, 1, 1,
2.328709, -0.663056, 2.297893, 0, 0, 0, 1, 1,
2.372412, 0.4031516, 0.7073374, 0, 0, 0, 1, 1,
2.486105, 0.4427398, 1.320782, 1, 1, 1, 1, 1,
2.506996, 1.582449, 0.7952538, 1, 1, 1, 1, 1,
2.608865, 0.6689816, 1.3722, 1, 1, 1, 1, 1,
2.924484, -0.9418606, 2.725676, 1, 1, 1, 1, 1,
2.987464, 1.394742, 2.269408, 1, 1, 1, 1, 1,
3.105664, -0.1294207, 0.1551598, 1, 1, 1, 1, 1,
3.678392, -0.2533952, 1.026733, 1, 1, 1, 1, 1
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
var radius = 9.721261;
var distance = 34.14552;
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
mvMatrix.translate( -0.5225996, 0.07216382, 0.3274312 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.14552);
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
