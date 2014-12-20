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
-2.994603, -0.04817464, -1.787054, 1, 0, 0, 1,
-2.972382, -0.2233283, -1.786484, 1, 0.007843138, 0, 1,
-2.872335, 0.2178963, -1.684423, 1, 0.01176471, 0, 1,
-2.759112, -0.6463507, -2.202472, 1, 0.01960784, 0, 1,
-2.741114, -0.3305865, -2.560151, 1, 0.02352941, 0, 1,
-2.734884, 1.603807, -1.031368, 1, 0.03137255, 0, 1,
-2.585427, -0.03163202, -2.186306, 1, 0.03529412, 0, 1,
-2.512483, -1.639286, -0.7943529, 1, 0.04313726, 0, 1,
-2.410236, -1.614857, -1.501833, 1, 0.04705882, 0, 1,
-2.330531, 0.3353052, -1.363453, 1, 0.05490196, 0, 1,
-2.318436, -2.48493, -2.866618, 1, 0.05882353, 0, 1,
-2.246229, 0.5274881, 1.116374, 1, 0.06666667, 0, 1,
-2.208276, -0.7062382, -2.404109, 1, 0.07058824, 0, 1,
-2.199987, -1.009279, -3.140821, 1, 0.07843138, 0, 1,
-2.128534, 0.2732723, -2.067676, 1, 0.08235294, 0, 1,
-2.086752, 0.3525848, -2.519469, 1, 0.09019608, 0, 1,
-2.041126, 0.5135899, -1.853459, 1, 0.09411765, 0, 1,
-2.030628, 0.6889733, 0.03727483, 1, 0.1019608, 0, 1,
-2.022914, 0.2576507, -0.8438919, 1, 0.1098039, 0, 1,
-2.016609, -0.05074959, 0.1596037, 1, 0.1137255, 0, 1,
-2.011456, -1.526657, -0.2839513, 1, 0.1215686, 0, 1,
-1.986238, -0.7690066, -2.461071, 1, 0.1254902, 0, 1,
-1.980184, 0.2063463, -0.09818161, 1, 0.1333333, 0, 1,
-1.963001, -0.5776471, -1.504619, 1, 0.1372549, 0, 1,
-1.95715, 0.701795, -1.353251, 1, 0.145098, 0, 1,
-1.944681, -0.1901481, -0.3474514, 1, 0.1490196, 0, 1,
-1.937569, 1.228896, -0.9303591, 1, 0.1568628, 0, 1,
-1.923306, 0.5795988, -0.1099848, 1, 0.1607843, 0, 1,
-1.90776, 0.2327945, -1.129764, 1, 0.1686275, 0, 1,
-1.888784, 0.1806912, 0.3480009, 1, 0.172549, 0, 1,
-1.882585, -0.2660248, -1.786143, 1, 0.1803922, 0, 1,
-1.875174, -0.1599997, -2.188447, 1, 0.1843137, 0, 1,
-1.86266, -0.2444779, -2.455167, 1, 0.1921569, 0, 1,
-1.862025, -1.395884, -3.504025, 1, 0.1960784, 0, 1,
-1.85459, -0.7118843, -2.207447, 1, 0.2039216, 0, 1,
-1.838482, -1.782703, -4.409218, 1, 0.2117647, 0, 1,
-1.831981, -0.009152101, -3.241867, 1, 0.2156863, 0, 1,
-1.82045, -0.5376317, -0.7883922, 1, 0.2235294, 0, 1,
-1.817066, 0.320978, -2.137881, 1, 0.227451, 0, 1,
-1.812376, -0.9110981, -3.14632, 1, 0.2352941, 0, 1,
-1.783842, -0.4539481, -0.4469693, 1, 0.2392157, 0, 1,
-1.765943, 0.2335899, -1.638811, 1, 0.2470588, 0, 1,
-1.752146, -1.16479, -2.086461, 1, 0.2509804, 0, 1,
-1.728307, -0.1610467, -2.658428, 1, 0.2588235, 0, 1,
-1.727728, 1.617194, -1.948405, 1, 0.2627451, 0, 1,
-1.704579, 0.4858508, 0.09321845, 1, 0.2705882, 0, 1,
-1.682059, 0.8625345, -2.048597, 1, 0.2745098, 0, 1,
-1.6814, -0.6399466, -1.470161, 1, 0.282353, 0, 1,
-1.661633, 0.643133, -0.7315673, 1, 0.2862745, 0, 1,
-1.654313, -0.6707527, -1.155336, 1, 0.2941177, 0, 1,
-1.634455, 0.5420521, -0.604024, 1, 0.3019608, 0, 1,
-1.632163, -0.242003, -0.2955677, 1, 0.3058824, 0, 1,
-1.624596, -1.892503, -3.954461, 1, 0.3137255, 0, 1,
-1.622163, -0.105082, -0.6914673, 1, 0.3176471, 0, 1,
-1.580016, -0.1018214, -2.51702, 1, 0.3254902, 0, 1,
-1.572744, -1.260186, -2.606354, 1, 0.3294118, 0, 1,
-1.565971, -0.4929625, -0.3184507, 1, 0.3372549, 0, 1,
-1.565764, 1.037463, -0.6952846, 1, 0.3411765, 0, 1,
-1.563148, 1.32788, -0.7619506, 1, 0.3490196, 0, 1,
-1.559814, -1.008902, -1.284956, 1, 0.3529412, 0, 1,
-1.554743, -1.310297, -2.392795, 1, 0.3607843, 0, 1,
-1.54192, -1.056277, -0.8596333, 1, 0.3647059, 0, 1,
-1.514854, -0.2471409, -1.082177, 1, 0.372549, 0, 1,
-1.509476, -0.07769219, -0.6295443, 1, 0.3764706, 0, 1,
-1.507079, 0.5987371, -1.139616, 1, 0.3843137, 0, 1,
-1.501186, 0.1877902, -3.097646, 1, 0.3882353, 0, 1,
-1.49949, -1.296982, -0.8472705, 1, 0.3960784, 0, 1,
-1.486045, 0.3157236, -1.723304, 1, 0.4039216, 0, 1,
-1.478441, 2.5185, 0.108763, 1, 0.4078431, 0, 1,
-1.477026, 0.1131886, -0.783663, 1, 0.4156863, 0, 1,
-1.458042, -0.9265947, -0.6630413, 1, 0.4196078, 0, 1,
-1.452111, 0.6056771, -1.082714, 1, 0.427451, 0, 1,
-1.451875, 0.9239348, 0.4998364, 1, 0.4313726, 0, 1,
-1.441682, -0.7177693, -1.418804, 1, 0.4392157, 0, 1,
-1.429507, 0.8582973, -0.6913201, 1, 0.4431373, 0, 1,
-1.429404, 0.1238815, -0.9623077, 1, 0.4509804, 0, 1,
-1.418184, -0.9178011, -1.013081, 1, 0.454902, 0, 1,
-1.417031, -0.03449724, -1.075314, 1, 0.4627451, 0, 1,
-1.415224, 0.7819961, 0.03404641, 1, 0.4666667, 0, 1,
-1.395781, 0.1236371, -0.4385819, 1, 0.4745098, 0, 1,
-1.393973, 1.605304, -1.005602, 1, 0.4784314, 0, 1,
-1.391272, -0.1535284, -2.957175, 1, 0.4862745, 0, 1,
-1.386371, 2.335833, -1.576963, 1, 0.4901961, 0, 1,
-1.381136, 0.5397386, -0.3228178, 1, 0.4980392, 0, 1,
-1.37385, -1.309424, -1.63805, 1, 0.5058824, 0, 1,
-1.368748, 0.08250894, -2.328205, 1, 0.509804, 0, 1,
-1.364122, 1.403412, -2.100911, 1, 0.5176471, 0, 1,
-1.354673, 0.2567194, -2.628878, 1, 0.5215687, 0, 1,
-1.346764, 0.746761, 0.003603526, 1, 0.5294118, 0, 1,
-1.346014, -0.4812622, -2.601254, 1, 0.5333334, 0, 1,
-1.338912, 0.2134141, 0.02017144, 1, 0.5411765, 0, 1,
-1.318843, -0.3094119, -1.962011, 1, 0.5450981, 0, 1,
-1.311909, 0.3082572, -0.2636338, 1, 0.5529412, 0, 1,
-1.304138, 0.9905546, 0.3953679, 1, 0.5568628, 0, 1,
-1.298115, 0.3761915, -2.185462, 1, 0.5647059, 0, 1,
-1.298089, 0.213762, -1.337249, 1, 0.5686275, 0, 1,
-1.287435, -0.4217592, -1.114051, 1, 0.5764706, 0, 1,
-1.285275, 2.25603, 0.01550089, 1, 0.5803922, 0, 1,
-1.284958, -0.3734129, -1.586762, 1, 0.5882353, 0, 1,
-1.279366, 0.4077287, -1.179011, 1, 0.5921569, 0, 1,
-1.279045, 0.669105, 1.107475, 1, 0.6, 0, 1,
-1.268203, 0.4708098, -2.097996, 1, 0.6078432, 0, 1,
-1.262738, 0.7795988, -3.325604, 1, 0.6117647, 0, 1,
-1.246363, -1.647047, -2.017859, 1, 0.6196079, 0, 1,
-1.243274, 0.7570829, -0.8226772, 1, 0.6235294, 0, 1,
-1.239801, -0.8259304, -2.566781, 1, 0.6313726, 0, 1,
-1.237104, -0.338259, -1.691751, 1, 0.6352941, 0, 1,
-1.234943, -0.1102287, 0.9324191, 1, 0.6431373, 0, 1,
-1.228559, 0.3941081, 0.8685752, 1, 0.6470588, 0, 1,
-1.223429, 0.3842533, -0.1447434, 1, 0.654902, 0, 1,
-1.211582, 0.4620551, -1.911884, 1, 0.6588235, 0, 1,
-1.205898, -0.9467488, -2.970456, 1, 0.6666667, 0, 1,
-1.19461, 1.150437, -0.4634438, 1, 0.6705883, 0, 1,
-1.192454, 2.447416, 0.01500813, 1, 0.6784314, 0, 1,
-1.19114, -2.168976, -3.098189, 1, 0.682353, 0, 1,
-1.18299, 0.9549834, -2.107908, 1, 0.6901961, 0, 1,
-1.17784, -0.3037216, -1.82796, 1, 0.6941177, 0, 1,
-1.170687, 0.6570991, -0.6160446, 1, 0.7019608, 0, 1,
-1.167141, -0.4544074, -2.107324, 1, 0.7098039, 0, 1,
-1.161768, 0.7674507, -0.335933, 1, 0.7137255, 0, 1,
-1.15898, -1.17958, -1.541507, 1, 0.7215686, 0, 1,
-1.153853, -0.2314341, -3.891464, 1, 0.7254902, 0, 1,
-1.153273, -0.274965, -1.616693, 1, 0.7333333, 0, 1,
-1.153244, 0.02588126, -1.138769, 1, 0.7372549, 0, 1,
-1.153043, 0.1954201, 0.9961911, 1, 0.7450981, 0, 1,
-1.149026, -0.2112082, -1.62375, 1, 0.7490196, 0, 1,
-1.146879, -1.44483, -0.8920755, 1, 0.7568628, 0, 1,
-1.146744, -0.137715, -0.3156313, 1, 0.7607843, 0, 1,
-1.146688, -0.4955983, -0.7192917, 1, 0.7686275, 0, 1,
-1.145158, 0.5562529, -1.194322, 1, 0.772549, 0, 1,
-1.142776, 0.4735855, 0.2034921, 1, 0.7803922, 0, 1,
-1.130034, 2.393022, -0.4222379, 1, 0.7843137, 0, 1,
-1.12589, 1.139832, 0.5641665, 1, 0.7921569, 0, 1,
-1.125368, -1.19843, -2.859044, 1, 0.7960784, 0, 1,
-1.121144, -1.529677, -3.33996, 1, 0.8039216, 0, 1,
-1.118314, 0.1286096, -0.6123105, 1, 0.8117647, 0, 1,
-1.095959, -0.4417313, -1.106646, 1, 0.8156863, 0, 1,
-1.093919, 0.5441397, -0.6858748, 1, 0.8235294, 0, 1,
-1.092956, -1.948626, -1.430766, 1, 0.827451, 0, 1,
-1.088297, 0.2037296, -2.146648, 1, 0.8352941, 0, 1,
-1.087621, 0.6401404, -2.063551, 1, 0.8392157, 0, 1,
-1.087233, -1.694714, -2.655365, 1, 0.8470588, 0, 1,
-1.081646, 1.003473, -0.4380248, 1, 0.8509804, 0, 1,
-1.080194, 2.04566, 1.241122, 1, 0.8588235, 0, 1,
-1.066234, 0.7375749, -2.835439, 1, 0.8627451, 0, 1,
-1.064393, 0.612675, -0.7450541, 1, 0.8705882, 0, 1,
-1.039485, 0.645546, -2.316724, 1, 0.8745098, 0, 1,
-1.034704, -0.2683665, -0.192631, 1, 0.8823529, 0, 1,
-1.016174, 0.2859575, -0.2073459, 1, 0.8862745, 0, 1,
-1.016109, -0.001972334, -1.768172, 1, 0.8941177, 0, 1,
-1.003763, -1.41078, -1.336194, 1, 0.8980392, 0, 1,
-1.002246, 0.5305227, -1.741577, 1, 0.9058824, 0, 1,
-0.9995729, -0.159298, -2.99542, 1, 0.9137255, 0, 1,
-0.9991414, 0.4788644, -1.215879, 1, 0.9176471, 0, 1,
-0.998603, 0.3098873, -1.623096, 1, 0.9254902, 0, 1,
-0.9980054, -0.08294301, -2.003568, 1, 0.9294118, 0, 1,
-0.9966873, -1.365896, -1.60454, 1, 0.9372549, 0, 1,
-0.9942588, 1.98597, -1.052035, 1, 0.9411765, 0, 1,
-0.9883696, -0.6879779, -1.988998, 1, 0.9490196, 0, 1,
-0.9877115, 0.4048572, -0.5978714, 1, 0.9529412, 0, 1,
-0.9841843, 1.114109, -0.6408657, 1, 0.9607843, 0, 1,
-0.9792863, -1.222191, -1.512654, 1, 0.9647059, 0, 1,
-0.9655457, 1.811454, -0.8453177, 1, 0.972549, 0, 1,
-0.9622317, -0.3247789, -1.895205, 1, 0.9764706, 0, 1,
-0.9612108, -0.2150384, -0.546221, 1, 0.9843137, 0, 1,
-0.9606747, 1.200461, -0.03177427, 1, 0.9882353, 0, 1,
-0.9499764, -1.475671, -2.798697, 1, 0.9960784, 0, 1,
-0.9464962, 1.060914, -0.07139768, 0.9960784, 1, 0, 1,
-0.9435585, -0.4987779, -0.7813589, 0.9921569, 1, 0, 1,
-0.9427823, -0.9115057, -5.422387, 0.9843137, 1, 0, 1,
-0.9410923, -0.9657124, -1.698614, 0.9803922, 1, 0, 1,
-0.931215, 0.3371113, -1.067131, 0.972549, 1, 0, 1,
-0.9233769, -1.121093, -1.748843, 0.9686275, 1, 0, 1,
-0.9207127, -2.161795, -2.70535, 0.9607843, 1, 0, 1,
-0.9148595, -0.6092448, -2.999368, 0.9568627, 1, 0, 1,
-0.913496, 0.6676847, -0.01224754, 0.9490196, 1, 0, 1,
-0.9101556, 0.2567677, -2.594324, 0.945098, 1, 0, 1,
-0.9059316, -1.261029, -1.447088, 0.9372549, 1, 0, 1,
-0.905351, -1.075694, -2.558432, 0.9333333, 1, 0, 1,
-0.9036685, 0.7560624, -3.533126, 0.9254902, 1, 0, 1,
-0.8998287, 1.345923, -2.688353, 0.9215686, 1, 0, 1,
-0.8997526, 0.3099242, -2.133128, 0.9137255, 1, 0, 1,
-0.8993792, 0.8780251, -1.333326, 0.9098039, 1, 0, 1,
-0.8925152, -0.1357754, -3.301886, 0.9019608, 1, 0, 1,
-0.8918244, -1.806445, -1.381912, 0.8941177, 1, 0, 1,
-0.8860629, -0.0402436, -0.3940152, 0.8901961, 1, 0, 1,
-0.8764838, -1.738389, -3.186003, 0.8823529, 1, 0, 1,
-0.8612961, 1.498059, -1.289234, 0.8784314, 1, 0, 1,
-0.860871, -0.427107, -1.390113, 0.8705882, 1, 0, 1,
-0.8606586, -1.154119, -1.86064, 0.8666667, 1, 0, 1,
-0.859022, 0.4972434, 0.8529067, 0.8588235, 1, 0, 1,
-0.8525598, 0.2437224, 0.4143427, 0.854902, 1, 0, 1,
-0.8508744, 1.892732, 0.5324787, 0.8470588, 1, 0, 1,
-0.8496991, -0.09322854, -1.451546, 0.8431373, 1, 0, 1,
-0.8431981, -0.6654082, -4.720358, 0.8352941, 1, 0, 1,
-0.8385972, -0.3257966, -2.159925, 0.8313726, 1, 0, 1,
-0.8327531, -0.5902172, -3.529217, 0.8235294, 1, 0, 1,
-0.8308061, 1.928389, -0.9248871, 0.8196079, 1, 0, 1,
-0.830281, 0.4592202, -3.215455, 0.8117647, 1, 0, 1,
-0.822717, -0.9767992, -2.826356, 0.8078431, 1, 0, 1,
-0.8219259, -0.7103431, -2.277274, 0.8, 1, 0, 1,
-0.8184786, 0.2920638, 0.3948655, 0.7921569, 1, 0, 1,
-0.815819, 2.34442, 0.2980416, 0.7882353, 1, 0, 1,
-0.8109381, 1.131949, -0.8302166, 0.7803922, 1, 0, 1,
-0.8074894, -0.8433711, -1.865597, 0.7764706, 1, 0, 1,
-0.8055829, -1.045401, -1.470759, 0.7686275, 1, 0, 1,
-0.8021013, -0.6003027, -2.567588, 0.7647059, 1, 0, 1,
-0.8014941, -0.634841, -3.20791, 0.7568628, 1, 0, 1,
-0.78763, -1.301815, -0.9853724, 0.7529412, 1, 0, 1,
-0.7842555, -0.8776078, -4.062564, 0.7450981, 1, 0, 1,
-0.7839524, 0.5582169, 0.700857, 0.7411765, 1, 0, 1,
-0.7819251, -0.1632789, -2.337823, 0.7333333, 1, 0, 1,
-0.7806305, 1.862493, 0.4070216, 0.7294118, 1, 0, 1,
-0.7743781, 1.626667, -0.9507585, 0.7215686, 1, 0, 1,
-0.7741358, 0.3880505, -0.6943055, 0.7176471, 1, 0, 1,
-0.7672228, 0.4024872, -1.984498, 0.7098039, 1, 0, 1,
-0.7623727, -0.1233745, -0.4205949, 0.7058824, 1, 0, 1,
-0.7606881, 0.892068, -1.315543, 0.6980392, 1, 0, 1,
-0.7602095, -1.0511, -2.415925, 0.6901961, 1, 0, 1,
-0.7582971, 0.6692943, 0.9731857, 0.6862745, 1, 0, 1,
-0.7530143, 1.961613, -1.003312, 0.6784314, 1, 0, 1,
-0.7490286, -0.4430131, -2.999906, 0.6745098, 1, 0, 1,
-0.7430321, 0.2671439, -1.921937, 0.6666667, 1, 0, 1,
-0.7380623, -0.05498084, -1.691641, 0.6627451, 1, 0, 1,
-0.7294339, 0.9807125, 1.28099, 0.654902, 1, 0, 1,
-0.7268469, -1.535103, -2.588055, 0.6509804, 1, 0, 1,
-0.7267305, -1.434216, -2.777777, 0.6431373, 1, 0, 1,
-0.7237346, 2.286947, 0.3097433, 0.6392157, 1, 0, 1,
-0.723003, 0.6929393, -1.298153, 0.6313726, 1, 0, 1,
-0.7210647, 1.764455, 0.3845716, 0.627451, 1, 0, 1,
-0.7201341, -0.5309865, -2.296154, 0.6196079, 1, 0, 1,
-0.7186512, -0.9235915, -1.797764, 0.6156863, 1, 0, 1,
-0.7178335, 0.727798, 0.7198333, 0.6078432, 1, 0, 1,
-0.7174487, 0.6852878, 0.4787875, 0.6039216, 1, 0, 1,
-0.7123699, -1.001258, -4.322762, 0.5960785, 1, 0, 1,
-0.7105384, 0.2102517, -2.454167, 0.5882353, 1, 0, 1,
-0.7000698, 1.510558, -2.88065, 0.5843138, 1, 0, 1,
-0.6985406, -0.4008168, -1.15115, 0.5764706, 1, 0, 1,
-0.6980112, 0.3723737, -0.4701164, 0.572549, 1, 0, 1,
-0.6948414, 0.4295686, -1.554082, 0.5647059, 1, 0, 1,
-0.6934298, 1.071314, -0.4944625, 0.5607843, 1, 0, 1,
-0.6931864, 1.1813, 0.08691356, 0.5529412, 1, 0, 1,
-0.6929879, 0.6081411, -0.8677663, 0.5490196, 1, 0, 1,
-0.6906934, -1.091206, -2.564774, 0.5411765, 1, 0, 1,
-0.6892518, -1.447037, -3.514915, 0.5372549, 1, 0, 1,
-0.6881369, 2.254005, 0.3957184, 0.5294118, 1, 0, 1,
-0.6836589, -1.16296, -2.36889, 0.5254902, 1, 0, 1,
-0.6776662, -2.066758, -2.161577, 0.5176471, 1, 0, 1,
-0.6771401, -0.1159277, -3.200575, 0.5137255, 1, 0, 1,
-0.6731501, -2.625787, -3.438025, 0.5058824, 1, 0, 1,
-0.6687876, 1.534736, 0.2771188, 0.5019608, 1, 0, 1,
-0.664849, 1.73435, -0.3784961, 0.4941176, 1, 0, 1,
-0.6646445, -0.297691, -0.669808, 0.4862745, 1, 0, 1,
-0.6633622, 0.5566236, -0.7256479, 0.4823529, 1, 0, 1,
-0.6609669, 0.5457184, -0.8649084, 0.4745098, 1, 0, 1,
-0.6474931, -1.476553, -2.389514, 0.4705882, 1, 0, 1,
-0.6471432, -0.7825291, -1.954627, 0.4627451, 1, 0, 1,
-0.646108, 0.1132279, -1.407776, 0.4588235, 1, 0, 1,
-0.6442979, -0.9981252, -1.859329, 0.4509804, 1, 0, 1,
-0.6391861, 0.120588, -2.195692, 0.4470588, 1, 0, 1,
-0.6349103, 0.3785039, -0.6869724, 0.4392157, 1, 0, 1,
-0.6333172, 0.4742243, -0.5911137, 0.4352941, 1, 0, 1,
-0.6330641, -1.082473, -1.734137, 0.427451, 1, 0, 1,
-0.6231732, -0.0566451, -2.292609, 0.4235294, 1, 0, 1,
-0.6202385, 1.481367, -0.3327022, 0.4156863, 1, 0, 1,
-0.6198891, -1.767603, -2.718975, 0.4117647, 1, 0, 1,
-0.6198567, 0.4650244, -1.021759, 0.4039216, 1, 0, 1,
-0.6194098, -0.3333969, -4.006237, 0.3960784, 1, 0, 1,
-0.6187172, -1.078354, -3.241786, 0.3921569, 1, 0, 1,
-0.6171629, 0.1657581, -0.1608055, 0.3843137, 1, 0, 1,
-0.610001, 0.8167885, -0.09225643, 0.3803922, 1, 0, 1,
-0.6069585, 0.2572103, -1.68791, 0.372549, 1, 0, 1,
-0.60623, 0.5982563, -0.9435607, 0.3686275, 1, 0, 1,
-0.5991968, 0.4454366, -0.159333, 0.3607843, 1, 0, 1,
-0.5990172, -0.1666066, 0.01678148, 0.3568628, 1, 0, 1,
-0.5964335, 0.1217596, -1.309117, 0.3490196, 1, 0, 1,
-0.5929216, -0.1214515, -2.582743, 0.345098, 1, 0, 1,
-0.5911873, 0.5523571, -1.360353, 0.3372549, 1, 0, 1,
-0.5872878, 1.593842, -1.654887, 0.3333333, 1, 0, 1,
-0.5849673, -1.190829, -3.271757, 0.3254902, 1, 0, 1,
-0.5842426, 1.662809, -0.3919767, 0.3215686, 1, 0, 1,
-0.5790667, 0.8049797, -1.592807, 0.3137255, 1, 0, 1,
-0.5789302, -2.487201, -3.541409, 0.3098039, 1, 0, 1,
-0.5743546, 2.575115, -0.6491549, 0.3019608, 1, 0, 1,
-0.5690226, -0.5175409, -0.6758378, 0.2941177, 1, 0, 1,
-0.5680889, 2.404372, 0.8843651, 0.2901961, 1, 0, 1,
-0.5671861, -0.04649257, -0.7900512, 0.282353, 1, 0, 1,
-0.5612127, 0.01549474, -1.027587, 0.2784314, 1, 0, 1,
-0.5610778, 0.3448849, -0.8004819, 0.2705882, 1, 0, 1,
-0.557066, -1.019152, -1.672156, 0.2666667, 1, 0, 1,
-0.5531466, 0.3590907, -0.7836385, 0.2588235, 1, 0, 1,
-0.5518634, 0.8509163, 0.2643903, 0.254902, 1, 0, 1,
-0.5486134, 0.7901269, 0.06825714, 0.2470588, 1, 0, 1,
-0.5475773, 0.650402, 0.4753298, 0.2431373, 1, 0, 1,
-0.5473648, 0.05193208, -0.8181874, 0.2352941, 1, 0, 1,
-0.5469632, -0.72658, -4.141501, 0.2313726, 1, 0, 1,
-0.5458997, 2.133004, 0.8259726, 0.2235294, 1, 0, 1,
-0.5443401, 1.550418, -1.526782, 0.2196078, 1, 0, 1,
-0.5397379, -0.2554535, -2.510917, 0.2117647, 1, 0, 1,
-0.5266884, -1.273643, -1.428631, 0.2078431, 1, 0, 1,
-0.5254521, -0.4786378, -1.357841, 0.2, 1, 0, 1,
-0.5223521, -0.8423104, -3.446873, 0.1921569, 1, 0, 1,
-0.5131677, -0.9975653, -2.121554, 0.1882353, 1, 0, 1,
-0.5114098, 1.232571, 0.4816279, 0.1803922, 1, 0, 1,
-0.5108425, 0.6005893, -0.6670368, 0.1764706, 1, 0, 1,
-0.508042, -1.194559, -3.004285, 0.1686275, 1, 0, 1,
-0.5076995, -0.896534, -2.127899, 0.1647059, 1, 0, 1,
-0.5045476, -0.1609082, -2.418577, 0.1568628, 1, 0, 1,
-0.4992321, 1.43346, 0.2332186, 0.1529412, 1, 0, 1,
-0.494766, 0.07145151, -1.086529, 0.145098, 1, 0, 1,
-0.4935784, -0.2877784, -3.688551, 0.1411765, 1, 0, 1,
-0.4878111, 1.094859, -0.01643701, 0.1333333, 1, 0, 1,
-0.4867363, -0.06244907, 0.4653077, 0.1294118, 1, 0, 1,
-0.4858613, -0.4325713, -1.51132, 0.1215686, 1, 0, 1,
-0.4852542, -0.5307842, -3.903153, 0.1176471, 1, 0, 1,
-0.4811113, -0.6844055, -0.9664806, 0.1098039, 1, 0, 1,
-0.4795249, -0.4700665, -4.25355, 0.1058824, 1, 0, 1,
-0.4777045, 1.120519, 0.948577, 0.09803922, 1, 0, 1,
-0.4750586, -2.443706, -4.279181, 0.09019608, 1, 0, 1,
-0.4730449, -1.121731, -2.774993, 0.08627451, 1, 0, 1,
-0.4714526, -0.7617045, -3.12521, 0.07843138, 1, 0, 1,
-0.4682088, 0.7169756, 0.2265383, 0.07450981, 1, 0, 1,
-0.467878, -0.5692354, -3.096493, 0.06666667, 1, 0, 1,
-0.4644853, -1.145821, -3.135133, 0.0627451, 1, 0, 1,
-0.4643117, 1.170983, -0.7565268, 0.05490196, 1, 0, 1,
-0.4636616, 2.526811, -0.7205076, 0.05098039, 1, 0, 1,
-0.4592535, -1.468021, -3.02255, 0.04313726, 1, 0, 1,
-0.4586147, 0.2679492, -1.759547, 0.03921569, 1, 0, 1,
-0.4549676, -0.2405051, -1.809905, 0.03137255, 1, 0, 1,
-0.4448436, 1.279043, -1.101868, 0.02745098, 1, 0, 1,
-0.443884, -0.9075323, -2.267695, 0.01960784, 1, 0, 1,
-0.4404175, -1.007467, -3.083358, 0.01568628, 1, 0, 1,
-0.4349824, 0.3018738, -2.629521, 0.007843138, 1, 0, 1,
-0.4284687, 0.1684336, -0.6364473, 0.003921569, 1, 0, 1,
-0.4236482, 1.61447, 0.3747807, 0, 1, 0.003921569, 1,
-0.4187475, -0.6976823, -1.767944, 0, 1, 0.01176471, 1,
-0.4173473, -0.3711118, -2.461235, 0, 1, 0.01568628, 1,
-0.4171801, 0.01021397, -2.546636, 0, 1, 0.02352941, 1,
-0.4133017, 0.03243735, -2.946123, 0, 1, 0.02745098, 1,
-0.4129479, -1.223934, -1.889563, 0, 1, 0.03529412, 1,
-0.4128518, 1.872065, -0.1189779, 0, 1, 0.03921569, 1,
-0.4123303, 1.353878, 0.7052281, 0, 1, 0.04705882, 1,
-0.4091086, 0.9427615, 0.3885944, 0, 1, 0.05098039, 1,
-0.4057893, -2.155766, -2.633829, 0, 1, 0.05882353, 1,
-0.4045812, 0.04430505, -0.9700103, 0, 1, 0.0627451, 1,
-0.3967737, 0.02512059, -2.338009, 0, 1, 0.07058824, 1,
-0.3950957, -0.2509529, -2.552807, 0, 1, 0.07450981, 1,
-0.3945183, -1.042759, -3.421366, 0, 1, 0.08235294, 1,
-0.3905829, 0.4839818, -1.024404, 0, 1, 0.08627451, 1,
-0.3901842, -0.2753011, -3.133684, 0, 1, 0.09411765, 1,
-0.3869103, 0.7673987, 0.6321639, 0, 1, 0.1019608, 1,
-0.3841213, 0.3582925, -0.6059397, 0, 1, 0.1058824, 1,
-0.3815114, -0.6192052, -1.524178, 0, 1, 0.1137255, 1,
-0.3812148, 0.1285124, -1.08745, 0, 1, 0.1176471, 1,
-0.3805354, -0.7482858, -2.840056, 0, 1, 0.1254902, 1,
-0.3802609, 1.501518, -0.2333338, 0, 1, 0.1294118, 1,
-0.3784338, -1.509986, -3.279354, 0, 1, 0.1372549, 1,
-0.37546, 0.1446063, -0.8988926, 0, 1, 0.1411765, 1,
-0.3735408, 0.5755736, -0.0220466, 0, 1, 0.1490196, 1,
-0.3684849, -0.2895731, -0.9976799, 0, 1, 0.1529412, 1,
-0.3675848, -0.5562963, -1.031014, 0, 1, 0.1607843, 1,
-0.3543712, -0.7545681, -1.906085, 0, 1, 0.1647059, 1,
-0.3535484, -0.9831564, -1.687882, 0, 1, 0.172549, 1,
-0.3532479, 0.5281742, -1.415729, 0, 1, 0.1764706, 1,
-0.351062, 0.377638, -1.374558, 0, 1, 0.1843137, 1,
-0.3502006, 0.2779029, -1.686523, 0, 1, 0.1882353, 1,
-0.3409176, 0.7541386, -0.8249314, 0, 1, 0.1960784, 1,
-0.3393796, 1.193544, 0.07562014, 0, 1, 0.2039216, 1,
-0.3351005, 0.9095252, -1.053469, 0, 1, 0.2078431, 1,
-0.3340365, -1.076829, -4.944361, 0, 1, 0.2156863, 1,
-0.3232495, 0.00221848, -2.174154, 0, 1, 0.2196078, 1,
-0.3228094, 0.4898168, -0.122232, 0, 1, 0.227451, 1,
-0.3226123, -0.318676, -2.971826, 0, 1, 0.2313726, 1,
-0.3225774, 0.681313, 0.4491735, 0, 1, 0.2392157, 1,
-0.3205995, 0.0405361, -3.396543, 0, 1, 0.2431373, 1,
-0.3175838, 0.4853, -1.462558, 0, 1, 0.2509804, 1,
-0.3171974, -0.1062922, -0.7703032, 0, 1, 0.254902, 1,
-0.3148539, -0.2812479, -3.053809, 0, 1, 0.2627451, 1,
-0.3106847, -1.685855, -2.721859, 0, 1, 0.2666667, 1,
-0.3071901, -0.5065164, -3.168818, 0, 1, 0.2745098, 1,
-0.3067689, 0.5643867, -0.6013651, 0, 1, 0.2784314, 1,
-0.3062269, 0.6543589, -1.161154, 0, 1, 0.2862745, 1,
-0.3016649, -2.966837, -1.372871, 0, 1, 0.2901961, 1,
-0.3004785, -0.4565805, -1.521382, 0, 1, 0.2980392, 1,
-0.2969, 0.4495325, 0.4746006, 0, 1, 0.3058824, 1,
-0.2946426, -0.8881257, -2.685544, 0, 1, 0.3098039, 1,
-0.2850666, 0.6140034, -0.6464985, 0, 1, 0.3176471, 1,
-0.2837535, 1.18877, -2.159412, 0, 1, 0.3215686, 1,
-0.2813365, -0.6916667, -3.220483, 0, 1, 0.3294118, 1,
-0.2805381, 2.264459, 0.8007273, 0, 1, 0.3333333, 1,
-0.2783694, -1.197681, -2.253983, 0, 1, 0.3411765, 1,
-0.2780809, 0.1605347, -0.8328112, 0, 1, 0.345098, 1,
-0.2742285, -0.0768926, -2.481694, 0, 1, 0.3529412, 1,
-0.2719343, 0.04921359, -0.09990828, 0, 1, 0.3568628, 1,
-0.2684388, -0.1041664, -1.664666, 0, 1, 0.3647059, 1,
-0.2669027, -1.119447, -2.897326, 0, 1, 0.3686275, 1,
-0.2630492, -0.9067193, -2.800238, 0, 1, 0.3764706, 1,
-0.2590174, -1.008599, -1.246775, 0, 1, 0.3803922, 1,
-0.2584969, -0.5198007, -4.134817, 0, 1, 0.3882353, 1,
-0.2578796, 0.138937, -0.6839809, 0, 1, 0.3921569, 1,
-0.252898, 0.9630473, 0.2536609, 0, 1, 0.4, 1,
-0.2502231, 0.3338915, 1.731597, 0, 1, 0.4078431, 1,
-0.2445435, -0.1791411, -0.7298731, 0, 1, 0.4117647, 1,
-0.2418125, -2.359871, -3.522656, 0, 1, 0.4196078, 1,
-0.237397, -0.2371715, -4.48006, 0, 1, 0.4235294, 1,
-0.2362787, -0.7776043, -3.400759, 0, 1, 0.4313726, 1,
-0.2331719, -0.6509597, -4.19628, 0, 1, 0.4352941, 1,
-0.2326469, 0.05151586, -1.319725, 0, 1, 0.4431373, 1,
-0.2305902, 0.08557665, -1.275408, 0, 1, 0.4470588, 1,
-0.228057, 0.1749282, -0.4985852, 0, 1, 0.454902, 1,
-0.2275315, 0.002343344, -2.153532, 0, 1, 0.4588235, 1,
-0.226069, 0.6951724, 0.109796, 0, 1, 0.4666667, 1,
-0.2237606, 0.9086777, -0.2685075, 0, 1, 0.4705882, 1,
-0.2236676, -1.312545, -3.236904, 0, 1, 0.4784314, 1,
-0.22324, 0.8607076, -1.306308, 0, 1, 0.4823529, 1,
-0.2156471, -0.5365751, -2.59238, 0, 1, 0.4901961, 1,
-0.2156356, 0.5742316, -1.311367, 0, 1, 0.4941176, 1,
-0.2065152, -1.01136, -2.112505, 0, 1, 0.5019608, 1,
-0.2060585, -0.9921297, -3.802065, 0, 1, 0.509804, 1,
-0.2018642, -0.1513589, -2.520386, 0, 1, 0.5137255, 1,
-0.19951, -2.061686, -3.306849, 0, 1, 0.5215687, 1,
-0.1982275, -2.688099, -2.749593, 0, 1, 0.5254902, 1,
-0.1970602, -0.03731469, -2.629323, 0, 1, 0.5333334, 1,
-0.1967527, 0.3643118, -0.4486639, 0, 1, 0.5372549, 1,
-0.1938239, -0.8474184, 0.1072939, 0, 1, 0.5450981, 1,
-0.1918004, -0.08443613, -3.817798, 0, 1, 0.5490196, 1,
-0.1916316, -0.9785541, -2.478176, 0, 1, 0.5568628, 1,
-0.1892216, -0.5107179, -2.741111, 0, 1, 0.5607843, 1,
-0.1876451, 1.505654, -0.4452169, 0, 1, 0.5686275, 1,
-0.1869773, 0.3009265, -0.7224643, 0, 1, 0.572549, 1,
-0.1814958, -0.1656155, -1.272911, 0, 1, 0.5803922, 1,
-0.1769494, 0.3241932, 0.5244461, 0, 1, 0.5843138, 1,
-0.1760332, -0.8874947, -1.962245, 0, 1, 0.5921569, 1,
-0.1760198, -0.2603003, -1.291208, 0, 1, 0.5960785, 1,
-0.1692284, -2.293534, -3.505898, 0, 1, 0.6039216, 1,
-0.1689342, -1.833127, -2.512414, 0, 1, 0.6117647, 1,
-0.1666003, 1.121546, -1.343036, 0, 1, 0.6156863, 1,
-0.1642712, 0.7628077, 0.3644468, 0, 1, 0.6235294, 1,
-0.1612758, -0.3078825, -2.521547, 0, 1, 0.627451, 1,
-0.1604536, 0.6663024, -1.087305, 0, 1, 0.6352941, 1,
-0.1561288, 2.560271, 0.04839716, 0, 1, 0.6392157, 1,
-0.1559306, -0.1065816, -1.211437, 0, 1, 0.6470588, 1,
-0.1550667, -1.50076, -2.609109, 0, 1, 0.6509804, 1,
-0.152725, -0.5216904, -2.000471, 0, 1, 0.6588235, 1,
-0.1508665, -1.146526, -3.547067, 0, 1, 0.6627451, 1,
-0.1479664, 0.1063054, -1.943588, 0, 1, 0.6705883, 1,
-0.140489, -1.223344, -1.458934, 0, 1, 0.6745098, 1,
-0.1401103, -1.281559, -2.872347, 0, 1, 0.682353, 1,
-0.1384833, 0.25166, -1.950504, 0, 1, 0.6862745, 1,
-0.1380268, -1.40391, -3.461605, 0, 1, 0.6941177, 1,
-0.1379702, 0.5534745, -0.4958, 0, 1, 0.7019608, 1,
-0.1313923, 0.2540082, -0.02955389, 0, 1, 0.7058824, 1,
-0.1307509, 0.1936099, 1.232713, 0, 1, 0.7137255, 1,
-0.1292907, 1.493832, -1.31712, 0, 1, 0.7176471, 1,
-0.1287129, 1.581536, -1.561213, 0, 1, 0.7254902, 1,
-0.1200024, 0.007127705, -3.030312, 0, 1, 0.7294118, 1,
-0.1191065, -1.156905, -1.300298, 0, 1, 0.7372549, 1,
-0.1185116, -2.993935, -4.039338, 0, 1, 0.7411765, 1,
-0.1154698, -0.0424681, -2.485086, 0, 1, 0.7490196, 1,
-0.1123883, -0.9133277, -2.656252, 0, 1, 0.7529412, 1,
-0.1120871, -1.183246, -1.531321, 0, 1, 0.7607843, 1,
-0.1007824, 1.306741, -0.635885, 0, 1, 0.7647059, 1,
-0.09955029, -1.401874, -2.91913, 0, 1, 0.772549, 1,
-0.0968632, -0.5769735, -2.916443, 0, 1, 0.7764706, 1,
-0.09374693, 0.5021938, 1.392523, 0, 1, 0.7843137, 1,
-0.09311582, -0.6670038, -3.099856, 0, 1, 0.7882353, 1,
-0.0908802, -1.82439, -2.029531, 0, 1, 0.7960784, 1,
-0.08972967, 1.041227, 0.2537052, 0, 1, 0.8039216, 1,
-0.08858524, 0.5751788, -1.871144, 0, 1, 0.8078431, 1,
-0.08802355, 0.3376235, 2.319778, 0, 1, 0.8156863, 1,
-0.08480472, 0.896513, -1.572276, 0, 1, 0.8196079, 1,
-0.08466665, 0.04167408, -1.097716, 0, 1, 0.827451, 1,
-0.08460594, -0.4997125, -2.963134, 0, 1, 0.8313726, 1,
-0.08030628, -0.0878627, -3.067374, 0, 1, 0.8392157, 1,
-0.07957153, -0.4397919, -1.502092, 0, 1, 0.8431373, 1,
-0.0785595, -1.003218, -3.681466, 0, 1, 0.8509804, 1,
-0.07725912, 0.1755902, -0.4465374, 0, 1, 0.854902, 1,
-0.07166805, -0.8964241, -2.144113, 0, 1, 0.8627451, 1,
-0.07146127, -0.1910161, -2.808838, 0, 1, 0.8666667, 1,
-0.06432149, -0.07017319, -3.498703, 0, 1, 0.8745098, 1,
-0.06168588, 1.140344, -0.1924657, 0, 1, 0.8784314, 1,
-0.06057163, -1.190891, -4.387237, 0, 1, 0.8862745, 1,
-0.05257609, 0.02901065, 0.6411931, 0, 1, 0.8901961, 1,
-0.04955693, 0.5687214, 0.5199143, 0, 1, 0.8980392, 1,
-0.04848446, 0.7565773, -0.8403648, 0, 1, 0.9058824, 1,
-0.04844204, 0.5648744, 0.04959679, 0, 1, 0.9098039, 1,
-0.04303518, 1.256716, -0.2080731, 0, 1, 0.9176471, 1,
-0.04076071, 0.549374, -1.870547, 0, 1, 0.9215686, 1,
-0.03991225, 0.8303581, -0.0163282, 0, 1, 0.9294118, 1,
-0.03967008, 1.487569, 0.1653993, 0, 1, 0.9333333, 1,
-0.03511965, 0.5802917, 0.7487969, 0, 1, 0.9411765, 1,
-0.03510286, 0.4011615, -0.8683391, 0, 1, 0.945098, 1,
-0.02734277, 0.8883547, 0.3258547, 0, 1, 0.9529412, 1,
-0.0272618, 1.072522, 0.5027364, 0, 1, 0.9568627, 1,
-0.02692642, -1.781141, -2.029502, 0, 1, 0.9647059, 1,
-0.02636964, 0.9587147, 0.2990909, 0, 1, 0.9686275, 1,
-0.02189655, 0.7171476, -0.7521637, 0, 1, 0.9764706, 1,
-0.01771842, 1.599831, -1.502282, 0, 1, 0.9803922, 1,
-0.01769229, 1.526014, 0.08825823, 0, 1, 0.9882353, 1,
-0.01582446, -0.3109311, -4.660177, 0, 1, 0.9921569, 1,
-0.01576567, -1.617568, -1.003418, 0, 1, 1, 1,
-0.01367593, 0.3560837, 1.326504, 0, 0.9921569, 1, 1,
-0.00547561, -2.128585, -4.381728, 0, 0.9882353, 1, 1,
-0.004661866, -0.5796267, -2.278206, 0, 0.9803922, 1, 1,
-0.002680519, 0.05816201, -0.615046, 0, 0.9764706, 1, 1,
0.0001443236, 0.1747586, 1.7695, 0, 0.9686275, 1, 1,
0.002810028, 0.8274093, -0.3841975, 0, 0.9647059, 1, 1,
0.002853032, 0.3115023, -1.589757, 0, 0.9568627, 1, 1,
0.004426453, 0.4821833, 0.793583, 0, 0.9529412, 1, 1,
0.005752983, 1.551683, -1.240463, 0, 0.945098, 1, 1,
0.01088104, -0.5805249, 3.786217, 0, 0.9411765, 1, 1,
0.01134387, 0.5784518, -1.119323, 0, 0.9333333, 1, 1,
0.01343455, -0.7901468, 3.446875, 0, 0.9294118, 1, 1,
0.01400031, -0.910656, 3.103429, 0, 0.9215686, 1, 1,
0.0147357, -0.259317, 2.786236, 0, 0.9176471, 1, 1,
0.01564856, -0.04057452, 4.089864, 0, 0.9098039, 1, 1,
0.01771512, -1.459774, 3.89489, 0, 0.9058824, 1, 1,
0.01827259, -0.2183191, 1.473822, 0, 0.8980392, 1, 1,
0.0187889, -0.4779157, 3.324305, 0, 0.8901961, 1, 1,
0.01945445, -0.8183879, 2.370409, 0, 0.8862745, 1, 1,
0.02065441, -0.9635021, 3.830434, 0, 0.8784314, 1, 1,
0.02134194, -0.5587692, 4.364003, 0, 0.8745098, 1, 1,
0.02244546, 0.3121561, -1.937016, 0, 0.8666667, 1, 1,
0.02421528, 0.02218691, 2.767289, 0, 0.8627451, 1, 1,
0.03125509, -0.7731741, 1.631054, 0, 0.854902, 1, 1,
0.03241337, -2.061554, 3.723864, 0, 0.8509804, 1, 1,
0.03278966, 1.284723, -0.6573287, 0, 0.8431373, 1, 1,
0.04356984, -0.4744149, 2.324091, 0, 0.8392157, 1, 1,
0.04637214, -0.01478147, 0.4069319, 0, 0.8313726, 1, 1,
0.04991742, 0.2701207, 1.662369, 0, 0.827451, 1, 1,
0.05859821, -0.5120604, 3.949022, 0, 0.8196079, 1, 1,
0.06022048, 0.3790105, -0.2064089, 0, 0.8156863, 1, 1,
0.06152398, -0.1066749, 1.69797, 0, 0.8078431, 1, 1,
0.06609047, 0.4441243, 0.7667374, 0, 0.8039216, 1, 1,
0.06909572, -0.6478271, 3.969088, 0, 0.7960784, 1, 1,
0.06911233, 0.9574016, 0.6815445, 0, 0.7882353, 1, 1,
0.07172675, -0.3780742, 1.592474, 0, 0.7843137, 1, 1,
0.07464536, -0.8372206, 3.005171, 0, 0.7764706, 1, 1,
0.07770612, 0.7711967, -0.5080644, 0, 0.772549, 1, 1,
0.07811594, 0.5336661, 0.2757388, 0, 0.7647059, 1, 1,
0.08130605, 1.623668, 0.799803, 0, 0.7607843, 1, 1,
0.08192982, -1.167671, 4.61003, 0, 0.7529412, 1, 1,
0.08200444, 1.366966, -0.1504608, 0, 0.7490196, 1, 1,
0.08421501, 2.260821, 1.358803, 0, 0.7411765, 1, 1,
0.08494955, 0.1202352, 0.8425297, 0, 0.7372549, 1, 1,
0.09264094, 1.801268, 0.7589459, 0, 0.7294118, 1, 1,
0.09569103, 1.402649, -0.198314, 0, 0.7254902, 1, 1,
0.09699383, 0.1808906, 0.6495196, 0, 0.7176471, 1, 1,
0.09982575, -0.3988622, 3.940234, 0, 0.7137255, 1, 1,
0.1003214, 0.3803262, -0.3847819, 0, 0.7058824, 1, 1,
0.1009614, 0.2470651, -1.213197, 0, 0.6980392, 1, 1,
0.1026755, 0.5233853, 0.5256295, 0, 0.6941177, 1, 1,
0.103554, 0.7524204, 1.345207, 0, 0.6862745, 1, 1,
0.1048107, 1.9915, 0.887243, 0, 0.682353, 1, 1,
0.1134816, -1.470932, 3.724592, 0, 0.6745098, 1, 1,
0.1174685, -0.2341796, 3.02212, 0, 0.6705883, 1, 1,
0.1183701, 0.4592319, -0.3214771, 0, 0.6627451, 1, 1,
0.1232393, -0.8410147, 3.601997, 0, 0.6588235, 1, 1,
0.1240809, 0.5596984, 1.262998, 0, 0.6509804, 1, 1,
0.1249975, -0.1383806, 3.431768, 0, 0.6470588, 1, 1,
0.126574, 0.9257923, 1.57269, 0, 0.6392157, 1, 1,
0.1269043, 0.3808568, -0.7829965, 0, 0.6352941, 1, 1,
0.1286189, -2.026623, 1.890789, 0, 0.627451, 1, 1,
0.1374699, -0.8197221, 2.992748, 0, 0.6235294, 1, 1,
0.143191, -0.9156043, 4.039294, 0, 0.6156863, 1, 1,
0.1444949, -0.9895433, 4.77125, 0, 0.6117647, 1, 1,
0.1477402, -0.1649512, 3.529341, 0, 0.6039216, 1, 1,
0.1529749, 0.4440998, 0.4847368, 0, 0.5960785, 1, 1,
0.1566479, -0.8220925, 3.058325, 0, 0.5921569, 1, 1,
0.1571974, 0.5676079, -0.521675, 0, 0.5843138, 1, 1,
0.1577083, 0.9531059, 0.4697083, 0, 0.5803922, 1, 1,
0.1584339, 0.7107151, 0.8582941, 0, 0.572549, 1, 1,
0.1591873, 0.2761895, -0.1921768, 0, 0.5686275, 1, 1,
0.16206, 0.2846921, -1.430399, 0, 0.5607843, 1, 1,
0.1644619, 0.7659654, 0.796663, 0, 0.5568628, 1, 1,
0.166312, -0.9418728, 3.046992, 0, 0.5490196, 1, 1,
0.1739148, 0.8806617, 1.249706, 0, 0.5450981, 1, 1,
0.1747317, -0.6299137, 2.898773, 0, 0.5372549, 1, 1,
0.1779225, 0.6091099, 1.543004, 0, 0.5333334, 1, 1,
0.183447, -0.3545822, 1.617931, 0, 0.5254902, 1, 1,
0.1852902, 0.1405061, 1.687221, 0, 0.5215687, 1, 1,
0.1867729, 0.4310232, 0.9235134, 0, 0.5137255, 1, 1,
0.1886936, -2.117692, 3.751652, 0, 0.509804, 1, 1,
0.1901213, 1.140036, 0.3802767, 0, 0.5019608, 1, 1,
0.193008, 0.01100917, 1.49845, 0, 0.4941176, 1, 1,
0.1947323, -0.6049984, 3.667406, 0, 0.4901961, 1, 1,
0.1970593, -0.6719843, 3.34098, 0, 0.4823529, 1, 1,
0.1983161, -0.1436822, 2.635826, 0, 0.4784314, 1, 1,
0.2028221, 0.4348498, 0.915357, 0, 0.4705882, 1, 1,
0.2040235, -1.280348, 2.318815, 0, 0.4666667, 1, 1,
0.2042295, -1.623104, 2.861432, 0, 0.4588235, 1, 1,
0.2087422, -1.427104, 2.497258, 0, 0.454902, 1, 1,
0.2089329, -1.063481, 2.759078, 0, 0.4470588, 1, 1,
0.209206, -0.2401734, 0.7323003, 0, 0.4431373, 1, 1,
0.2137604, 1.496211, 1.392956, 0, 0.4352941, 1, 1,
0.2140868, -0.956942, 2.803461, 0, 0.4313726, 1, 1,
0.2206742, 2.02535, -1.050257, 0, 0.4235294, 1, 1,
0.2222033, 0.06428087, 1.730702, 0, 0.4196078, 1, 1,
0.2244494, -0.7632174, 2.206495, 0, 0.4117647, 1, 1,
0.231673, -0.02701454, 0.5070964, 0, 0.4078431, 1, 1,
0.2319595, -0.9502161, 1.219585, 0, 0.4, 1, 1,
0.2343839, -0.8883525, 1.581643, 0, 0.3921569, 1, 1,
0.2352005, 0.2976806, 0.2446479, 0, 0.3882353, 1, 1,
0.236021, -0.1334416, 3.930606, 0, 0.3803922, 1, 1,
0.2372507, -0.3072688, 1.968121, 0, 0.3764706, 1, 1,
0.2421363, 2.470664, -0.7248588, 0, 0.3686275, 1, 1,
0.2421618, 0.0991594, 1.669095, 0, 0.3647059, 1, 1,
0.2422887, -0.8942014, 1.077619, 0, 0.3568628, 1, 1,
0.2424608, 0.4533578, 0.3482643, 0, 0.3529412, 1, 1,
0.2427945, 0.1139691, 0.2446186, 0, 0.345098, 1, 1,
0.2430719, 1.062132, 0.6320072, 0, 0.3411765, 1, 1,
0.2474084, 1.371707, 0.4864328, 0, 0.3333333, 1, 1,
0.249445, -0.4878078, 2.431791, 0, 0.3294118, 1, 1,
0.2496387, -2.983839, 3.539971, 0, 0.3215686, 1, 1,
0.2514877, -0.7311395, 2.204836, 0, 0.3176471, 1, 1,
0.2522304, -2.847646, 2.959521, 0, 0.3098039, 1, 1,
0.2561768, 2.164215, -1.722773, 0, 0.3058824, 1, 1,
0.2584698, 1.353412, -0.6446038, 0, 0.2980392, 1, 1,
0.2610557, -0.7133281, 1.551243, 0, 0.2901961, 1, 1,
0.2718109, -0.9585078, 2.280954, 0, 0.2862745, 1, 1,
0.2735894, 1.300466, -0.1959039, 0, 0.2784314, 1, 1,
0.2741632, -0.1350591, 1.456472, 0, 0.2745098, 1, 1,
0.2788876, 0.4531367, 1.04788, 0, 0.2666667, 1, 1,
0.2824214, 1.067971, 1.726282, 0, 0.2627451, 1, 1,
0.2841638, -1.380213, 2.230023, 0, 0.254902, 1, 1,
0.2866211, -0.9651142, 1.851393, 0, 0.2509804, 1, 1,
0.2866728, -0.05216439, 3.028832, 0, 0.2431373, 1, 1,
0.2898327, 0.3449664, 0.7840671, 0, 0.2392157, 1, 1,
0.2942871, 0.3618982, 0.4919903, 0, 0.2313726, 1, 1,
0.2943273, -0.2950936, 3.308777, 0, 0.227451, 1, 1,
0.2946743, -1.327953, 3.49492, 0, 0.2196078, 1, 1,
0.2952434, 1.253514, 1.992383, 0, 0.2156863, 1, 1,
0.2965683, 0.9142783, 1.927266, 0, 0.2078431, 1, 1,
0.3014745, 0.2184178, -0.2447504, 0, 0.2039216, 1, 1,
0.3037395, 0.6671031, 2.031621, 0, 0.1960784, 1, 1,
0.3061448, -0.3955616, 2.497351, 0, 0.1882353, 1, 1,
0.3062381, -1.452212, 3.78202, 0, 0.1843137, 1, 1,
0.3095921, 0.8699658, 0.4419704, 0, 0.1764706, 1, 1,
0.312239, -0.1031984, 2.547506, 0, 0.172549, 1, 1,
0.3128898, 0.1175828, 0.643179, 0, 0.1647059, 1, 1,
0.3157272, 0.5903007, -0.06223822, 0, 0.1607843, 1, 1,
0.3167288, 0.329689, 3.374453, 0, 0.1529412, 1, 1,
0.3197456, 0.5403354, 1.270173, 0, 0.1490196, 1, 1,
0.3214485, 0.7354656, 0.2575648, 0, 0.1411765, 1, 1,
0.3234, 0.3661892, 1.432094, 0, 0.1372549, 1, 1,
0.3270275, 0.439274, -0.2390088, 0, 0.1294118, 1, 1,
0.3293102, 2.035659, 0.9848861, 0, 0.1254902, 1, 1,
0.3295834, -1.59762, 2.823185, 0, 0.1176471, 1, 1,
0.3308382, 0.04628034, 1.289241, 0, 0.1137255, 1, 1,
0.3339787, 1.001402, -0.1734125, 0, 0.1058824, 1, 1,
0.3369615, 2.998052, 0.9607897, 0, 0.09803922, 1, 1,
0.3385877, 1.282093, 0.9925672, 0, 0.09411765, 1, 1,
0.3408623, 1.831126, 0.5987967, 0, 0.08627451, 1, 1,
0.342382, 1.034761, -0.463258, 0, 0.08235294, 1, 1,
0.3442347, -1.18429, 4.295165, 0, 0.07450981, 1, 1,
0.3468689, -0.2793639, 2.846067, 0, 0.07058824, 1, 1,
0.3482569, 1.169206, 0.3520603, 0, 0.0627451, 1, 1,
0.3487037, -1.13147, 3.152229, 0, 0.05882353, 1, 1,
0.3494451, -2.860367, 5.0794, 0, 0.05098039, 1, 1,
0.3511318, 1.345968, 1.079499, 0, 0.04705882, 1, 1,
0.3670925, 0.4329973, 1.212589, 0, 0.03921569, 1, 1,
0.3675968, 0.7887243, -1.573318, 0, 0.03529412, 1, 1,
0.3676063, -1.502155, 3.00655, 0, 0.02745098, 1, 1,
0.3688377, 1.153198, -0.3117321, 0, 0.02352941, 1, 1,
0.3693846, -0.9306844, 5.268459, 0, 0.01568628, 1, 1,
0.3708924, 0.2338149, -0.3279467, 0, 0.01176471, 1, 1,
0.3812462, 0.9047427, -0.6464953, 0, 0.003921569, 1, 1,
0.3862493, 0.2988475, -0.6472428, 0.003921569, 0, 1, 1,
0.4009068, 1.30902, 0.8700784, 0.007843138, 0, 1, 1,
0.4023595, -0.02647879, 2.003686, 0.01568628, 0, 1, 1,
0.4041093, -2.562313, 1.37579, 0.01960784, 0, 1, 1,
0.4061203, 0.4088431, -0.5447567, 0.02745098, 0, 1, 1,
0.4071766, -0.4680736, 2.354662, 0.03137255, 0, 1, 1,
0.4112723, -1.35434, 1.243306, 0.03921569, 0, 1, 1,
0.4192269, 0.9833508, -2.264369, 0.04313726, 0, 1, 1,
0.4199921, -0.2004987, 0.6667652, 0.05098039, 0, 1, 1,
0.4215907, -0.2846321, 1.852863, 0.05490196, 0, 1, 1,
0.4218712, 1.305446, -0.9019217, 0.0627451, 0, 1, 1,
0.4250777, 0.8378344, 1.151387, 0.06666667, 0, 1, 1,
0.4320578, -0.3094347, 2.263684, 0.07450981, 0, 1, 1,
0.4354359, -1.597939, 3.6851, 0.07843138, 0, 1, 1,
0.4374785, 1.619162, 0.008075984, 0.08627451, 0, 1, 1,
0.4378753, -0.2660522, 1.034401, 0.09019608, 0, 1, 1,
0.4378859, -0.3546982, 2.484038, 0.09803922, 0, 1, 1,
0.4389044, -1.312501, 2.067726, 0.1058824, 0, 1, 1,
0.4406236, -1.015485, 1.90088, 0.1098039, 0, 1, 1,
0.4442582, 2.141999, 0.8900679, 0.1176471, 0, 1, 1,
0.445495, 0.01112494, 2.937974, 0.1215686, 0, 1, 1,
0.449881, -1.404467, 1.688295, 0.1294118, 0, 1, 1,
0.4552698, -0.07332171, 2.073904, 0.1333333, 0, 1, 1,
0.4571392, -0.2282172, 4.003799, 0.1411765, 0, 1, 1,
0.4580905, 0.3563653, 1.871198, 0.145098, 0, 1, 1,
0.4587134, 0.531448, 0.3429442, 0.1529412, 0, 1, 1,
0.4607948, 0.4924538, 2.040423, 0.1568628, 0, 1, 1,
0.461878, -0.4124707, 4.954528, 0.1647059, 0, 1, 1,
0.4622633, -0.02976956, 1.302706, 0.1686275, 0, 1, 1,
0.4631151, 0.2288263, 0.3336248, 0.1764706, 0, 1, 1,
0.4631695, -0.08427325, 1.775413, 0.1803922, 0, 1, 1,
0.4643672, 0.6358734, 1.837678, 0.1882353, 0, 1, 1,
0.4680226, 1.2069, -1.000316, 0.1921569, 0, 1, 1,
0.4683525, 1.132157, 1.698025, 0.2, 0, 1, 1,
0.4718904, -0.1292309, 2.317611, 0.2078431, 0, 1, 1,
0.4721406, -1.173909, 3.181027, 0.2117647, 0, 1, 1,
0.4722688, -0.8808354, 3.642831, 0.2196078, 0, 1, 1,
0.4730981, -1.45275, 2.556207, 0.2235294, 0, 1, 1,
0.4738822, 0.1904827, 2.228634, 0.2313726, 0, 1, 1,
0.475024, 2.289875, 1.041798, 0.2352941, 0, 1, 1,
0.4753747, 0.9166047, -0.7833358, 0.2431373, 0, 1, 1,
0.4831732, -0.6355061, 2.212958, 0.2470588, 0, 1, 1,
0.4864237, 0.4095836, -0.09809469, 0.254902, 0, 1, 1,
0.4881849, 1.317242, 1.299918, 0.2588235, 0, 1, 1,
0.490263, 0.391545, 1.057729, 0.2666667, 0, 1, 1,
0.4917942, -1.101616, 2.436787, 0.2705882, 0, 1, 1,
0.4926471, -0.60517, 1.833686, 0.2784314, 0, 1, 1,
0.4941699, -0.2541947, 4.067954, 0.282353, 0, 1, 1,
0.4943565, 0.7591531, 1.343477, 0.2901961, 0, 1, 1,
0.4974671, 0.7092339, 0.391928, 0.2941177, 0, 1, 1,
0.4984954, 0.3048541, 2.034487, 0.3019608, 0, 1, 1,
0.5046462, 2.201178, -0.639694, 0.3098039, 0, 1, 1,
0.5076082, 1.271633, 0.6891122, 0.3137255, 0, 1, 1,
0.510035, 0.658416, -0.8491763, 0.3215686, 0, 1, 1,
0.5172217, 0.18131, 1.659673, 0.3254902, 0, 1, 1,
0.5217596, -0.6721649, 2.147093, 0.3333333, 0, 1, 1,
0.5232358, -0.9347573, 4.154939, 0.3372549, 0, 1, 1,
0.5271763, -0.8545338, 4.189149, 0.345098, 0, 1, 1,
0.5385903, -0.5068012, 3.320976, 0.3490196, 0, 1, 1,
0.540778, -0.5262914, 4.338593, 0.3568628, 0, 1, 1,
0.5439355, 0.05503823, -0.6347404, 0.3607843, 0, 1, 1,
0.5444298, 0.04673292, 1.981073, 0.3686275, 0, 1, 1,
0.5670453, 0.6420385, -0.2093922, 0.372549, 0, 1, 1,
0.5701436, -0.4650487, 2.336692, 0.3803922, 0, 1, 1,
0.5751616, 0.861009, 2.432751, 0.3843137, 0, 1, 1,
0.5758331, -0.5810735, 1.972928, 0.3921569, 0, 1, 1,
0.5780913, -1.323446, 2.762845, 0.3960784, 0, 1, 1,
0.5791767, 0.7701982, 0.6117052, 0.4039216, 0, 1, 1,
0.57942, -1.335264, 3.469088, 0.4117647, 0, 1, 1,
0.5803992, 1.709846, 0.9317067, 0.4156863, 0, 1, 1,
0.5861464, -0.4327844, 3.10868, 0.4235294, 0, 1, 1,
0.5909295, 0.8361109, -0.3372764, 0.427451, 0, 1, 1,
0.5925108, -1.214461, 4.46354, 0.4352941, 0, 1, 1,
0.594154, 0.004250518, 1.468139, 0.4392157, 0, 1, 1,
0.6015847, -0.4326957, 1.504225, 0.4470588, 0, 1, 1,
0.6016816, 0.6712753, 0.4083669, 0.4509804, 0, 1, 1,
0.6110665, 0.8660156, 0.5156398, 0.4588235, 0, 1, 1,
0.6128365, -0.07623614, 0.3378118, 0.4627451, 0, 1, 1,
0.6186098, -0.2233853, 2.026578, 0.4705882, 0, 1, 1,
0.6190048, 2.490882, -1.071077, 0.4745098, 0, 1, 1,
0.6201246, -1.26351, 3.094486, 0.4823529, 0, 1, 1,
0.6215525, 0.01770258, 0.2787903, 0.4862745, 0, 1, 1,
0.6260763, 0.2719856, -0.500423, 0.4941176, 0, 1, 1,
0.6290396, -0.5245776, 4.154224, 0.5019608, 0, 1, 1,
0.6318806, -0.07388242, 3.047118, 0.5058824, 0, 1, 1,
0.6350592, -0.6923355, 3.058818, 0.5137255, 0, 1, 1,
0.636148, -0.1502088, 0.6243554, 0.5176471, 0, 1, 1,
0.6368818, -0.3237196, 1.769599, 0.5254902, 0, 1, 1,
0.6372482, 0.5296054, -0.3570268, 0.5294118, 0, 1, 1,
0.6387414, -1.118869, 2.668302, 0.5372549, 0, 1, 1,
0.6424348, 0.2228242, 0.2114917, 0.5411765, 0, 1, 1,
0.6453167, 0.3627753, 0.5469959, 0.5490196, 0, 1, 1,
0.6454139, 0.06780296, -0.4237803, 0.5529412, 0, 1, 1,
0.6508937, -0.1951321, 2.278839, 0.5607843, 0, 1, 1,
0.6528761, -0.5384434, 1.130349, 0.5647059, 0, 1, 1,
0.6531283, -1.336027, 3.594147, 0.572549, 0, 1, 1,
0.6540921, 1.048944, 0.2746684, 0.5764706, 0, 1, 1,
0.6582099, -0.6545155, 3.234478, 0.5843138, 0, 1, 1,
0.6600568, 0.8622174, 0.1237544, 0.5882353, 0, 1, 1,
0.6617826, -1.832537, 3.011508, 0.5960785, 0, 1, 1,
0.6621618, 1.105425, 1.613563, 0.6039216, 0, 1, 1,
0.6644821, 0.6835939, 1.07182, 0.6078432, 0, 1, 1,
0.6646971, 1.566891, 1.665529, 0.6156863, 0, 1, 1,
0.6668823, 0.1537926, 0.5397376, 0.6196079, 0, 1, 1,
0.6704477, 0.1018485, 1.109662, 0.627451, 0, 1, 1,
0.6713641, 0.3031688, 1.73365, 0.6313726, 0, 1, 1,
0.6758673, 0.1463761, 0.4476987, 0.6392157, 0, 1, 1,
0.6841101, -0.2736649, 2.1587, 0.6431373, 0, 1, 1,
0.6849457, -0.2344176, 1.384374, 0.6509804, 0, 1, 1,
0.685313, -0.6674894, 1.800716, 0.654902, 0, 1, 1,
0.6866186, -0.3132268, 3.289165, 0.6627451, 0, 1, 1,
0.6916018, -2.543343, 4.266181, 0.6666667, 0, 1, 1,
0.692682, 0.5072491, 1.586011, 0.6745098, 0, 1, 1,
0.6950591, 0.9533461, 1.960989, 0.6784314, 0, 1, 1,
0.6961032, -0.2710515, 2.359786, 0.6862745, 0, 1, 1,
0.7018416, 1.151267, 0.2284195, 0.6901961, 0, 1, 1,
0.7021856, -0.8036238, 0.793306, 0.6980392, 0, 1, 1,
0.7061222, 0.3929069, 0.9022674, 0.7058824, 0, 1, 1,
0.7100521, -1.759883, 5.308974, 0.7098039, 0, 1, 1,
0.7174636, 0.6662704, 0.09068333, 0.7176471, 0, 1, 1,
0.7238166, 0.1972974, 1.788285, 0.7215686, 0, 1, 1,
0.7246065, 1.812509, 0.1653509, 0.7294118, 0, 1, 1,
0.7250981, -0.5416291, 2.860134, 0.7333333, 0, 1, 1,
0.7257974, -1.112228, 3.97801, 0.7411765, 0, 1, 1,
0.7258021, -1.707015, 2.466889, 0.7450981, 0, 1, 1,
0.7276808, -1.752109, 3.248457, 0.7529412, 0, 1, 1,
0.740267, -0.5289868, 1.800611, 0.7568628, 0, 1, 1,
0.7452171, 1.001893, -0.03177264, 0.7647059, 0, 1, 1,
0.7452951, 0.01980575, 1.668923, 0.7686275, 0, 1, 1,
0.7542043, 0.5666118, 0.1429339, 0.7764706, 0, 1, 1,
0.7597729, 0.5960765, 1.349798, 0.7803922, 0, 1, 1,
0.7608499, 1.030872, 1.438206, 0.7882353, 0, 1, 1,
0.7616084, 0.5311163, -0.2305991, 0.7921569, 0, 1, 1,
0.7637307, 1.065096, -0.754935, 0.8, 0, 1, 1,
0.7642124, 1.966793, -0.5239875, 0.8078431, 0, 1, 1,
0.7720392, 0.003695039, 0.05838468, 0.8117647, 0, 1, 1,
0.777453, -0.6575828, 1.891845, 0.8196079, 0, 1, 1,
0.7781067, -0.5151619, 1.54595, 0.8235294, 0, 1, 1,
0.7840261, 1.533491, 0.8156286, 0.8313726, 0, 1, 1,
0.786045, -0.3799194, 3.662155, 0.8352941, 0, 1, 1,
0.7860621, 0.4278282, 2.444825, 0.8431373, 0, 1, 1,
0.7871307, 1.819956, 0.259708, 0.8470588, 0, 1, 1,
0.7894351, -0.6304643, 3.03157, 0.854902, 0, 1, 1,
0.7947887, -1.348905, 1.176735, 0.8588235, 0, 1, 1,
0.7978507, 0.5744332, 1.960449, 0.8666667, 0, 1, 1,
0.7982553, -1.018168, 1.346482, 0.8705882, 0, 1, 1,
0.7995842, -0.5594237, 3.799304, 0.8784314, 0, 1, 1,
0.8014491, -0.3538726, 3.044946, 0.8823529, 0, 1, 1,
0.8018546, -1.501619, 3.592431, 0.8901961, 0, 1, 1,
0.8069932, 1.151433, 2.010973, 0.8941177, 0, 1, 1,
0.8095311, 0.1109648, 1.094151, 0.9019608, 0, 1, 1,
0.8114634, -0.2903093, 1.74967, 0.9098039, 0, 1, 1,
0.8118876, -0.842539, 4.000442, 0.9137255, 0, 1, 1,
0.8235886, -1.510293, 4.611026, 0.9215686, 0, 1, 1,
0.8300884, 0.04287786, 1.693081, 0.9254902, 0, 1, 1,
0.8314779, -0.3561837, 1.231975, 0.9333333, 0, 1, 1,
0.8501785, -1.019377, 2.531503, 0.9372549, 0, 1, 1,
0.855062, -0.6933372, -0.3244088, 0.945098, 0, 1, 1,
0.8560542, 0.01761393, 1.763616, 0.9490196, 0, 1, 1,
0.8569887, 0.132463, 1.809895, 0.9568627, 0, 1, 1,
0.8576545, 0.9186581, 0.7703049, 0.9607843, 0, 1, 1,
0.8598235, -0.7720097, 0.821902, 0.9686275, 0, 1, 1,
0.8613212, 1.228519, 0.8853762, 0.972549, 0, 1, 1,
0.8625859, 1.034724, 1.322965, 0.9803922, 0, 1, 1,
0.8727018, -0.2511519, 2.288846, 0.9843137, 0, 1, 1,
0.8735736, -2.684866, 1.849908, 0.9921569, 0, 1, 1,
0.8829126, 0.6990104, -1.98454, 0.9960784, 0, 1, 1,
0.8878285, 1.332195, 0.4960542, 1, 0, 0.9960784, 1,
0.8880963, 1.09024, 0.4753154, 1, 0, 0.9882353, 1,
0.8926499, -1.577787, 2.746797, 1, 0, 0.9843137, 1,
0.9093261, 0.6337937, -0.1895672, 1, 0, 0.9764706, 1,
0.9106553, 1.640651, 0.9915612, 1, 0, 0.972549, 1,
0.913615, -0.5292247, 2.680089, 1, 0, 0.9647059, 1,
0.928012, -0.6929974, 3.553908, 1, 0, 0.9607843, 1,
0.9290873, -0.0205997, 2.384884, 1, 0, 0.9529412, 1,
0.9294766, -0.1149792, 1.860396, 1, 0, 0.9490196, 1,
0.9299159, -0.270522, 1.48479, 1, 0, 0.9411765, 1,
0.9406285, -0.1309529, 0.7857906, 1, 0, 0.9372549, 1,
0.9412407, 1.577704, 1.344277, 1, 0, 0.9294118, 1,
0.942799, -1.190884, 1.663596, 1, 0, 0.9254902, 1,
0.9478478, 2.10026, -0.8261008, 1, 0, 0.9176471, 1,
0.9494853, -0.2718969, 0.4520532, 1, 0, 0.9137255, 1,
0.958194, 1.28452, 0.6637637, 1, 0, 0.9058824, 1,
0.9660662, -1.056636, 1.680967, 1, 0, 0.9019608, 1,
0.9759773, 0.4294866, 1.815955, 1, 0, 0.8941177, 1,
0.9908459, 2.272276, -0.9905105, 1, 0, 0.8862745, 1,
0.9913514, 0.653289, 1.691009, 1, 0, 0.8823529, 1,
0.9936746, 0.2665301, 0.5855622, 1, 0, 0.8745098, 1,
0.9973217, 1.223115, 0.2244707, 1, 0, 0.8705882, 1,
1.001093, 0.4689153, 1.633515, 1, 0, 0.8627451, 1,
1.002184, -1.384195, 2.299389, 1, 0, 0.8588235, 1,
1.008496, -0.4415296, 0.9733486, 1, 0, 0.8509804, 1,
1.011128, -0.2682678, 1.378116, 1, 0, 0.8470588, 1,
1.021491, -1.501993, 4.535913, 1, 0, 0.8392157, 1,
1.022786, 0.7808689, 0.1297541, 1, 0, 0.8352941, 1,
1.024483, 0.5857266, 0.6473635, 1, 0, 0.827451, 1,
1.027007, -0.634249, 1.828164, 1, 0, 0.8235294, 1,
1.032833, 0.6109751, 1.615412, 1, 0, 0.8156863, 1,
1.034784, 1.792458, 0.4893517, 1, 0, 0.8117647, 1,
1.039, -0.3208815, 2.611388, 1, 0, 0.8039216, 1,
1.039449, -0.1089903, 0.4661299, 1, 0, 0.7960784, 1,
1.042556, -1.364998, 1.423444, 1, 0, 0.7921569, 1,
1.043135, 0.9937742, -1.131681, 1, 0, 0.7843137, 1,
1.044803, -0.9620493, 1.871165, 1, 0, 0.7803922, 1,
1.047545, 0.07279201, 0.8822042, 1, 0, 0.772549, 1,
1.063083, -1.426841, 2.771887, 1, 0, 0.7686275, 1,
1.066087, 0.1468049, -0.5164946, 1, 0, 0.7607843, 1,
1.074548, -1.348109, 2.111439, 1, 0, 0.7568628, 1,
1.080874, 0.08647249, 1.957303, 1, 0, 0.7490196, 1,
1.081635, 0.1261348, 0.6423912, 1, 0, 0.7450981, 1,
1.082224, -1.536095, 3.361479, 1, 0, 0.7372549, 1,
1.089622, 0.8263457, -0.2395788, 1, 0, 0.7333333, 1,
1.094868, 0.5428181, 0.2558372, 1, 0, 0.7254902, 1,
1.098001, -1.017091, 2.508807, 1, 0, 0.7215686, 1,
1.108431, 1.231732, 0.7116677, 1, 0, 0.7137255, 1,
1.109018, 0.07193108, 2.936539, 1, 0, 0.7098039, 1,
1.109553, 0.0455512, 0.4319005, 1, 0, 0.7019608, 1,
1.111488, 0.3416258, 1.606168, 1, 0, 0.6941177, 1,
1.113213, 0.3299232, 1.581962, 1, 0, 0.6901961, 1,
1.113254, -1.994966, 1.680533, 1, 0, 0.682353, 1,
1.120762, -0.3266355, 0.7833177, 1, 0, 0.6784314, 1,
1.129606, 1.210641, -2.596145, 1, 0, 0.6705883, 1,
1.13525, -0.5527923, 2.522072, 1, 0, 0.6666667, 1,
1.159077, 0.1065414, 0.6979865, 1, 0, 0.6588235, 1,
1.159152, 0.5639181, -0.6585684, 1, 0, 0.654902, 1,
1.161235, -0.8064321, 2.338513, 1, 0, 0.6470588, 1,
1.164461, 1.300454, -0.242511, 1, 0, 0.6431373, 1,
1.166439, -1.152983, 0.5064989, 1, 0, 0.6352941, 1,
1.176178, -1.468538, 1.970064, 1, 0, 0.6313726, 1,
1.181766, 0.1311612, 0.3634422, 1, 0, 0.6235294, 1,
1.192136, -2.537131, 3.035253, 1, 0, 0.6196079, 1,
1.202288, -1.740392, 3.118326, 1, 0, 0.6117647, 1,
1.203595, 0.228168, 2.796484, 1, 0, 0.6078432, 1,
1.210898, -0.285165, 1.101504, 1, 0, 0.6, 1,
1.21611, -0.6478626, 0.1508171, 1, 0, 0.5921569, 1,
1.220943, 1.694909, 0.4844967, 1, 0, 0.5882353, 1,
1.227403, -0.6680961, 3.498581, 1, 0, 0.5803922, 1,
1.229028, -2.223039, 2.726315, 1, 0, 0.5764706, 1,
1.229461, 0.4305422, -0.08291589, 1, 0, 0.5686275, 1,
1.230939, 0.1243519, 1.468565, 1, 0, 0.5647059, 1,
1.23425, 0.1197999, 1.916903, 1, 0, 0.5568628, 1,
1.242052, 1.043874, -0.5390674, 1, 0, 0.5529412, 1,
1.244502, -0.3902895, 0.7700543, 1, 0, 0.5450981, 1,
1.244691, 0.9015158, 1.582235, 1, 0, 0.5411765, 1,
1.248801, -0.2666581, 0.4471344, 1, 0, 0.5333334, 1,
1.260486, 1.545717, 2.262569, 1, 0, 0.5294118, 1,
1.262093, -1.607472, 2.347557, 1, 0, 0.5215687, 1,
1.27231, 1.535378, -0.3647138, 1, 0, 0.5176471, 1,
1.27257, 0.1455693, 1.263706, 1, 0, 0.509804, 1,
1.273771, -0.1557143, -0.1682414, 1, 0, 0.5058824, 1,
1.278609, 0.256212, 0.9712436, 1, 0, 0.4980392, 1,
1.287193, 0.2778864, 2.335587, 1, 0, 0.4901961, 1,
1.291313, 0.05516112, 1.443471, 1, 0, 0.4862745, 1,
1.297065, -1.903261, 1.967537, 1, 0, 0.4784314, 1,
1.308067, 0.3741605, 2.150353, 1, 0, 0.4745098, 1,
1.316757, 0.1233534, -0.5005463, 1, 0, 0.4666667, 1,
1.327601, 1.048795, 0.5734619, 1, 0, 0.4627451, 1,
1.33645, -1.324957, 0.2831829, 1, 0, 0.454902, 1,
1.344895, 0.0008854849, 1.180198, 1, 0, 0.4509804, 1,
1.357538, -1.202964, 2.111516, 1, 0, 0.4431373, 1,
1.357772, -0.4434707, 0.4818415, 1, 0, 0.4392157, 1,
1.369123, -1.668776, 3.605146, 1, 0, 0.4313726, 1,
1.374153, -0.4100285, -0.03310545, 1, 0, 0.427451, 1,
1.383483, -0.3504857, 1.284451, 1, 0, 0.4196078, 1,
1.392392, 0.615609, -0.1924015, 1, 0, 0.4156863, 1,
1.396753, -0.9383762, 2.560125, 1, 0, 0.4078431, 1,
1.397186, 0.9246984, -0.4609443, 1, 0, 0.4039216, 1,
1.405209, 0.4501208, 1.798342, 1, 0, 0.3960784, 1,
1.409089, 0.2890704, 1.768991, 1, 0, 0.3882353, 1,
1.413468, -0.5874687, 1.204125, 1, 0, 0.3843137, 1,
1.414184, -0.2487124, 1.180982, 1, 0, 0.3764706, 1,
1.421232, 1.331403, 2.262861, 1, 0, 0.372549, 1,
1.429358, 1.207779, 1.472711, 1, 0, 0.3647059, 1,
1.443014, 0.001442727, -0.9110505, 1, 0, 0.3607843, 1,
1.452415, -0.4455234, 2.064732, 1, 0, 0.3529412, 1,
1.473283, -0.04105323, 2.445778, 1, 0, 0.3490196, 1,
1.514904, 1.504569, -0.07306424, 1, 0, 0.3411765, 1,
1.532923, 1.234828, 3.371277, 1, 0, 0.3372549, 1,
1.535123, 0.9939913, 2.000144, 1, 0, 0.3294118, 1,
1.535424, 1.434381, 1.638844, 1, 0, 0.3254902, 1,
1.538395, 0.8421313, -0.0388045, 1, 0, 0.3176471, 1,
1.539415, 0.1005789, 1.206474, 1, 0, 0.3137255, 1,
1.540251, -1.553167, 1.661484, 1, 0, 0.3058824, 1,
1.550508, 0.1289562, -0.1139826, 1, 0, 0.2980392, 1,
1.567634, 0.1592653, 3.011356, 1, 0, 0.2941177, 1,
1.60488, -2.133052, 1.33095, 1, 0, 0.2862745, 1,
1.606936, 0.8062115, 0.591308, 1, 0, 0.282353, 1,
1.612844, 0.5421255, -0.3125585, 1, 0, 0.2745098, 1,
1.61391, 1.002707, 2.723485, 1, 0, 0.2705882, 1,
1.616296, 0.1726333, -0.8285031, 1, 0, 0.2627451, 1,
1.62109, -0.06106035, 2.154025, 1, 0, 0.2588235, 1,
1.633262, 1.63882, -0.482032, 1, 0, 0.2509804, 1,
1.63446, -0.8138286, 2.858249, 1, 0, 0.2470588, 1,
1.646318, -0.7858527, 1.405674, 1, 0, 0.2392157, 1,
1.6504, -0.1461281, 0.5446027, 1, 0, 0.2352941, 1,
1.672285, 0.2251189, 0.1152747, 1, 0, 0.227451, 1,
1.674377, -0.9041829, 2.500466, 1, 0, 0.2235294, 1,
1.684497, -0.8608779, 2.289986, 1, 0, 0.2156863, 1,
1.733755, -0.6990801, 1.381411, 1, 0, 0.2117647, 1,
1.740915, 0.8126864, 1.476707, 1, 0, 0.2039216, 1,
1.783322, -0.2978936, 1.057462, 1, 0, 0.1960784, 1,
1.793315, 0.2980402, 2.178415, 1, 0, 0.1921569, 1,
1.812033, -0.8375461, 2.065775, 1, 0, 0.1843137, 1,
1.828393, -0.2707317, 2.63307, 1, 0, 0.1803922, 1,
1.833453, 0.0301805, -1.025954, 1, 0, 0.172549, 1,
1.840138, 1.102823, -0.6979975, 1, 0, 0.1686275, 1,
1.843091, -0.3026053, 2.445341, 1, 0, 0.1607843, 1,
1.852317, -0.5523924, 0.9983209, 1, 0, 0.1568628, 1,
1.883915, -1.757455, 2.820871, 1, 0, 0.1490196, 1,
1.910285, -1.104059, 0.5881159, 1, 0, 0.145098, 1,
1.913181, -0.4435007, 1.492786, 1, 0, 0.1372549, 1,
1.917429, 0.9048519, 1.228722, 1, 0, 0.1333333, 1,
1.938065, -0.9970955, 1.035218, 1, 0, 0.1254902, 1,
1.943739, -0.382397, 2.520055, 1, 0, 0.1215686, 1,
1.998713, 1.386769, 0.1611816, 1, 0, 0.1137255, 1,
2.016265, -0.5091713, 1.614258, 1, 0, 0.1098039, 1,
2.027692, 0.7322348, 0.6868, 1, 0, 0.1019608, 1,
2.123533, -0.05803528, -0.5656425, 1, 0, 0.09411765, 1,
2.125242, 0.610352, 1.152231, 1, 0, 0.09019608, 1,
2.139071, -0.3309382, 0.8579755, 1, 0, 0.08235294, 1,
2.186039, -0.3262311, 1.527907, 1, 0, 0.07843138, 1,
2.190094, -1.047999, 2.910307, 1, 0, 0.07058824, 1,
2.191319, 0.3704669, 1.025053, 1, 0, 0.06666667, 1,
2.244264, -0.1941384, 0.3561169, 1, 0, 0.05882353, 1,
2.446212, -0.6062492, 2.121443, 1, 0, 0.05490196, 1,
2.467068, 1.822932, 0.5945583, 1, 0, 0.04705882, 1,
2.495351, 0.7627349, 1.82933, 1, 0, 0.04313726, 1,
2.502758, 1.53769, 0.7914198, 1, 0, 0.03529412, 1,
2.592949, -1.166499, 2.139457, 1, 0, 0.03137255, 1,
2.75934, 0.07779758, 1.419801, 1, 0, 0.02352941, 1,
2.764439, 1.765354, 1.19146, 1, 0, 0.01960784, 1,
2.777349, -1.666455, 2.540457, 1, 0, 0.01176471, 1,
3.44162, 0.8556578, 4.236115, 1, 0, 0.007843138, 1
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
0.2235084, -4.009577, -7.241353, 0, -0.5, 0.5, 0.5,
0.2235084, -4.009577, -7.241353, 1, -0.5, 0.5, 0.5,
0.2235084, -4.009577, -7.241353, 1, 1.5, 0.5, 0.5,
0.2235084, -4.009577, -7.241353, 0, 1.5, 0.5, 0.5
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
-4.085543, 0.002058506, -7.241353, 0, -0.5, 0.5, 0.5,
-4.085543, 0.002058506, -7.241353, 1, -0.5, 0.5, 0.5,
-4.085543, 0.002058506, -7.241353, 1, 1.5, 0.5, 0.5,
-4.085543, 0.002058506, -7.241353, 0, 1.5, 0.5, 0.5
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
-4.085543, -4.009577, -0.05670643, 0, -0.5, 0.5, 0.5,
-4.085543, -4.009577, -0.05670643, 1, -0.5, 0.5, 0.5,
-4.085543, -4.009577, -0.05670643, 1, 1.5, 0.5, 0.5,
-4.085543, -4.009577, -0.05670643, 0, 1.5, 0.5, 0.5
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
-2, -3.083815, -5.583357,
3, -3.083815, -5.583357,
-2, -3.083815, -5.583357,
-2, -3.238109, -5.85969,
-1, -3.083815, -5.583357,
-1, -3.238109, -5.85969,
0, -3.083815, -5.583357,
0, -3.238109, -5.85969,
1, -3.083815, -5.583357,
1, -3.238109, -5.85969,
2, -3.083815, -5.583357,
2, -3.238109, -5.85969,
3, -3.083815, -5.583357,
3, -3.238109, -5.85969
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
-2, -3.546696, -6.412355, 0, -0.5, 0.5, 0.5,
-2, -3.546696, -6.412355, 1, -0.5, 0.5, 0.5,
-2, -3.546696, -6.412355, 1, 1.5, 0.5, 0.5,
-2, -3.546696, -6.412355, 0, 1.5, 0.5, 0.5,
-1, -3.546696, -6.412355, 0, -0.5, 0.5, 0.5,
-1, -3.546696, -6.412355, 1, -0.5, 0.5, 0.5,
-1, -3.546696, -6.412355, 1, 1.5, 0.5, 0.5,
-1, -3.546696, -6.412355, 0, 1.5, 0.5, 0.5,
0, -3.546696, -6.412355, 0, -0.5, 0.5, 0.5,
0, -3.546696, -6.412355, 1, -0.5, 0.5, 0.5,
0, -3.546696, -6.412355, 1, 1.5, 0.5, 0.5,
0, -3.546696, -6.412355, 0, 1.5, 0.5, 0.5,
1, -3.546696, -6.412355, 0, -0.5, 0.5, 0.5,
1, -3.546696, -6.412355, 1, -0.5, 0.5, 0.5,
1, -3.546696, -6.412355, 1, 1.5, 0.5, 0.5,
1, -3.546696, -6.412355, 0, 1.5, 0.5, 0.5,
2, -3.546696, -6.412355, 0, -0.5, 0.5, 0.5,
2, -3.546696, -6.412355, 1, -0.5, 0.5, 0.5,
2, -3.546696, -6.412355, 1, 1.5, 0.5, 0.5,
2, -3.546696, -6.412355, 0, 1.5, 0.5, 0.5,
3, -3.546696, -6.412355, 0, -0.5, 0.5, 0.5,
3, -3.546696, -6.412355, 1, -0.5, 0.5, 0.5,
3, -3.546696, -6.412355, 1, 1.5, 0.5, 0.5,
3, -3.546696, -6.412355, 0, 1.5, 0.5, 0.5
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
-3.091146, -2, -5.583357,
-3.091146, 2, -5.583357,
-3.091146, -2, -5.583357,
-3.256879, -2, -5.85969,
-3.091146, -1, -5.583357,
-3.256879, -1, -5.85969,
-3.091146, 0, -5.583357,
-3.256879, 0, -5.85969,
-3.091146, 1, -5.583357,
-3.256879, 1, -5.85969,
-3.091146, 2, -5.583357,
-3.256879, 2, -5.85969
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
-3.588345, -2, -6.412355, 0, -0.5, 0.5, 0.5,
-3.588345, -2, -6.412355, 1, -0.5, 0.5, 0.5,
-3.588345, -2, -6.412355, 1, 1.5, 0.5, 0.5,
-3.588345, -2, -6.412355, 0, 1.5, 0.5, 0.5,
-3.588345, -1, -6.412355, 0, -0.5, 0.5, 0.5,
-3.588345, -1, -6.412355, 1, -0.5, 0.5, 0.5,
-3.588345, -1, -6.412355, 1, 1.5, 0.5, 0.5,
-3.588345, -1, -6.412355, 0, 1.5, 0.5, 0.5,
-3.588345, 0, -6.412355, 0, -0.5, 0.5, 0.5,
-3.588345, 0, -6.412355, 1, -0.5, 0.5, 0.5,
-3.588345, 0, -6.412355, 1, 1.5, 0.5, 0.5,
-3.588345, 0, -6.412355, 0, 1.5, 0.5, 0.5,
-3.588345, 1, -6.412355, 0, -0.5, 0.5, 0.5,
-3.588345, 1, -6.412355, 1, -0.5, 0.5, 0.5,
-3.588345, 1, -6.412355, 1, 1.5, 0.5, 0.5,
-3.588345, 1, -6.412355, 0, 1.5, 0.5, 0.5,
-3.588345, 2, -6.412355, 0, -0.5, 0.5, 0.5,
-3.588345, 2, -6.412355, 1, -0.5, 0.5, 0.5,
-3.588345, 2, -6.412355, 1, 1.5, 0.5, 0.5,
-3.588345, 2, -6.412355, 0, 1.5, 0.5, 0.5
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
-3.091146, -3.083815, -4,
-3.091146, -3.083815, 4,
-3.091146, -3.083815, -4,
-3.256879, -3.238109, -4,
-3.091146, -3.083815, -2,
-3.256879, -3.238109, -2,
-3.091146, -3.083815, 0,
-3.256879, -3.238109, 0,
-3.091146, -3.083815, 2,
-3.256879, -3.238109, 2,
-3.091146, -3.083815, 4,
-3.256879, -3.238109, 4
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
-3.588345, -3.546696, -4, 0, -0.5, 0.5, 0.5,
-3.588345, -3.546696, -4, 1, -0.5, 0.5, 0.5,
-3.588345, -3.546696, -4, 1, 1.5, 0.5, 0.5,
-3.588345, -3.546696, -4, 0, 1.5, 0.5, 0.5,
-3.588345, -3.546696, -2, 0, -0.5, 0.5, 0.5,
-3.588345, -3.546696, -2, 1, -0.5, 0.5, 0.5,
-3.588345, -3.546696, -2, 1, 1.5, 0.5, 0.5,
-3.588345, -3.546696, -2, 0, 1.5, 0.5, 0.5,
-3.588345, -3.546696, 0, 0, -0.5, 0.5, 0.5,
-3.588345, -3.546696, 0, 1, -0.5, 0.5, 0.5,
-3.588345, -3.546696, 0, 1, 1.5, 0.5, 0.5,
-3.588345, -3.546696, 0, 0, 1.5, 0.5, 0.5,
-3.588345, -3.546696, 2, 0, -0.5, 0.5, 0.5,
-3.588345, -3.546696, 2, 1, -0.5, 0.5, 0.5,
-3.588345, -3.546696, 2, 1, 1.5, 0.5, 0.5,
-3.588345, -3.546696, 2, 0, 1.5, 0.5, 0.5,
-3.588345, -3.546696, 4, 0, -0.5, 0.5, 0.5,
-3.588345, -3.546696, 4, 1, -0.5, 0.5, 0.5,
-3.588345, -3.546696, 4, 1, 1.5, 0.5, 0.5,
-3.588345, -3.546696, 4, 0, 1.5, 0.5, 0.5
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
-3.091146, -3.083815, -5.583357,
-3.091146, 3.087932, -5.583357,
-3.091146, -3.083815, 5.469944,
-3.091146, 3.087932, 5.469944,
-3.091146, -3.083815, -5.583357,
-3.091146, -3.083815, 5.469944,
-3.091146, 3.087932, -5.583357,
-3.091146, 3.087932, 5.469944,
-3.091146, -3.083815, -5.583357,
3.538163, -3.083815, -5.583357,
-3.091146, -3.083815, 5.469944,
3.538163, -3.083815, 5.469944,
-3.091146, 3.087932, -5.583357,
3.538163, 3.087932, -5.583357,
-3.091146, 3.087932, 5.469944,
3.538163, 3.087932, 5.469944,
3.538163, -3.083815, -5.583357,
3.538163, 3.087932, -5.583357,
3.538163, -3.083815, 5.469944,
3.538163, 3.087932, 5.469944,
3.538163, -3.083815, -5.583357,
3.538163, -3.083815, 5.469944,
3.538163, 3.087932, -5.583357,
3.538163, 3.087932, 5.469944
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
var radius = 7.630762;
var distance = 33.95012;
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
mvMatrix.translate( -0.2235084, -0.002058506, 0.05670643 );
mvMatrix.scale( 1.244553, 1.336822, 0.7464312 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.95012);
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
Binapacryl<-read.table("Binapacryl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Binapacryl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Binapacryl' not found
```

```r
y<-Binapacryl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Binapacryl' not found
```

```r
z<-Binapacryl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Binapacryl' not found
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
-2.994603, -0.04817464, -1.787054, 0, 0, 1, 1, 1,
-2.972382, -0.2233283, -1.786484, 1, 0, 0, 1, 1,
-2.872335, 0.2178963, -1.684423, 1, 0, 0, 1, 1,
-2.759112, -0.6463507, -2.202472, 1, 0, 0, 1, 1,
-2.741114, -0.3305865, -2.560151, 1, 0, 0, 1, 1,
-2.734884, 1.603807, -1.031368, 1, 0, 0, 1, 1,
-2.585427, -0.03163202, -2.186306, 0, 0, 0, 1, 1,
-2.512483, -1.639286, -0.7943529, 0, 0, 0, 1, 1,
-2.410236, -1.614857, -1.501833, 0, 0, 0, 1, 1,
-2.330531, 0.3353052, -1.363453, 0, 0, 0, 1, 1,
-2.318436, -2.48493, -2.866618, 0, 0, 0, 1, 1,
-2.246229, 0.5274881, 1.116374, 0, 0, 0, 1, 1,
-2.208276, -0.7062382, -2.404109, 0, 0, 0, 1, 1,
-2.199987, -1.009279, -3.140821, 1, 1, 1, 1, 1,
-2.128534, 0.2732723, -2.067676, 1, 1, 1, 1, 1,
-2.086752, 0.3525848, -2.519469, 1, 1, 1, 1, 1,
-2.041126, 0.5135899, -1.853459, 1, 1, 1, 1, 1,
-2.030628, 0.6889733, 0.03727483, 1, 1, 1, 1, 1,
-2.022914, 0.2576507, -0.8438919, 1, 1, 1, 1, 1,
-2.016609, -0.05074959, 0.1596037, 1, 1, 1, 1, 1,
-2.011456, -1.526657, -0.2839513, 1, 1, 1, 1, 1,
-1.986238, -0.7690066, -2.461071, 1, 1, 1, 1, 1,
-1.980184, 0.2063463, -0.09818161, 1, 1, 1, 1, 1,
-1.963001, -0.5776471, -1.504619, 1, 1, 1, 1, 1,
-1.95715, 0.701795, -1.353251, 1, 1, 1, 1, 1,
-1.944681, -0.1901481, -0.3474514, 1, 1, 1, 1, 1,
-1.937569, 1.228896, -0.9303591, 1, 1, 1, 1, 1,
-1.923306, 0.5795988, -0.1099848, 1, 1, 1, 1, 1,
-1.90776, 0.2327945, -1.129764, 0, 0, 1, 1, 1,
-1.888784, 0.1806912, 0.3480009, 1, 0, 0, 1, 1,
-1.882585, -0.2660248, -1.786143, 1, 0, 0, 1, 1,
-1.875174, -0.1599997, -2.188447, 1, 0, 0, 1, 1,
-1.86266, -0.2444779, -2.455167, 1, 0, 0, 1, 1,
-1.862025, -1.395884, -3.504025, 1, 0, 0, 1, 1,
-1.85459, -0.7118843, -2.207447, 0, 0, 0, 1, 1,
-1.838482, -1.782703, -4.409218, 0, 0, 0, 1, 1,
-1.831981, -0.009152101, -3.241867, 0, 0, 0, 1, 1,
-1.82045, -0.5376317, -0.7883922, 0, 0, 0, 1, 1,
-1.817066, 0.320978, -2.137881, 0, 0, 0, 1, 1,
-1.812376, -0.9110981, -3.14632, 0, 0, 0, 1, 1,
-1.783842, -0.4539481, -0.4469693, 0, 0, 0, 1, 1,
-1.765943, 0.2335899, -1.638811, 1, 1, 1, 1, 1,
-1.752146, -1.16479, -2.086461, 1, 1, 1, 1, 1,
-1.728307, -0.1610467, -2.658428, 1, 1, 1, 1, 1,
-1.727728, 1.617194, -1.948405, 1, 1, 1, 1, 1,
-1.704579, 0.4858508, 0.09321845, 1, 1, 1, 1, 1,
-1.682059, 0.8625345, -2.048597, 1, 1, 1, 1, 1,
-1.6814, -0.6399466, -1.470161, 1, 1, 1, 1, 1,
-1.661633, 0.643133, -0.7315673, 1, 1, 1, 1, 1,
-1.654313, -0.6707527, -1.155336, 1, 1, 1, 1, 1,
-1.634455, 0.5420521, -0.604024, 1, 1, 1, 1, 1,
-1.632163, -0.242003, -0.2955677, 1, 1, 1, 1, 1,
-1.624596, -1.892503, -3.954461, 1, 1, 1, 1, 1,
-1.622163, -0.105082, -0.6914673, 1, 1, 1, 1, 1,
-1.580016, -0.1018214, -2.51702, 1, 1, 1, 1, 1,
-1.572744, -1.260186, -2.606354, 1, 1, 1, 1, 1,
-1.565971, -0.4929625, -0.3184507, 0, 0, 1, 1, 1,
-1.565764, 1.037463, -0.6952846, 1, 0, 0, 1, 1,
-1.563148, 1.32788, -0.7619506, 1, 0, 0, 1, 1,
-1.559814, -1.008902, -1.284956, 1, 0, 0, 1, 1,
-1.554743, -1.310297, -2.392795, 1, 0, 0, 1, 1,
-1.54192, -1.056277, -0.8596333, 1, 0, 0, 1, 1,
-1.514854, -0.2471409, -1.082177, 0, 0, 0, 1, 1,
-1.509476, -0.07769219, -0.6295443, 0, 0, 0, 1, 1,
-1.507079, 0.5987371, -1.139616, 0, 0, 0, 1, 1,
-1.501186, 0.1877902, -3.097646, 0, 0, 0, 1, 1,
-1.49949, -1.296982, -0.8472705, 0, 0, 0, 1, 1,
-1.486045, 0.3157236, -1.723304, 0, 0, 0, 1, 1,
-1.478441, 2.5185, 0.108763, 0, 0, 0, 1, 1,
-1.477026, 0.1131886, -0.783663, 1, 1, 1, 1, 1,
-1.458042, -0.9265947, -0.6630413, 1, 1, 1, 1, 1,
-1.452111, 0.6056771, -1.082714, 1, 1, 1, 1, 1,
-1.451875, 0.9239348, 0.4998364, 1, 1, 1, 1, 1,
-1.441682, -0.7177693, -1.418804, 1, 1, 1, 1, 1,
-1.429507, 0.8582973, -0.6913201, 1, 1, 1, 1, 1,
-1.429404, 0.1238815, -0.9623077, 1, 1, 1, 1, 1,
-1.418184, -0.9178011, -1.013081, 1, 1, 1, 1, 1,
-1.417031, -0.03449724, -1.075314, 1, 1, 1, 1, 1,
-1.415224, 0.7819961, 0.03404641, 1, 1, 1, 1, 1,
-1.395781, 0.1236371, -0.4385819, 1, 1, 1, 1, 1,
-1.393973, 1.605304, -1.005602, 1, 1, 1, 1, 1,
-1.391272, -0.1535284, -2.957175, 1, 1, 1, 1, 1,
-1.386371, 2.335833, -1.576963, 1, 1, 1, 1, 1,
-1.381136, 0.5397386, -0.3228178, 1, 1, 1, 1, 1,
-1.37385, -1.309424, -1.63805, 0, 0, 1, 1, 1,
-1.368748, 0.08250894, -2.328205, 1, 0, 0, 1, 1,
-1.364122, 1.403412, -2.100911, 1, 0, 0, 1, 1,
-1.354673, 0.2567194, -2.628878, 1, 0, 0, 1, 1,
-1.346764, 0.746761, 0.003603526, 1, 0, 0, 1, 1,
-1.346014, -0.4812622, -2.601254, 1, 0, 0, 1, 1,
-1.338912, 0.2134141, 0.02017144, 0, 0, 0, 1, 1,
-1.318843, -0.3094119, -1.962011, 0, 0, 0, 1, 1,
-1.311909, 0.3082572, -0.2636338, 0, 0, 0, 1, 1,
-1.304138, 0.9905546, 0.3953679, 0, 0, 0, 1, 1,
-1.298115, 0.3761915, -2.185462, 0, 0, 0, 1, 1,
-1.298089, 0.213762, -1.337249, 0, 0, 0, 1, 1,
-1.287435, -0.4217592, -1.114051, 0, 0, 0, 1, 1,
-1.285275, 2.25603, 0.01550089, 1, 1, 1, 1, 1,
-1.284958, -0.3734129, -1.586762, 1, 1, 1, 1, 1,
-1.279366, 0.4077287, -1.179011, 1, 1, 1, 1, 1,
-1.279045, 0.669105, 1.107475, 1, 1, 1, 1, 1,
-1.268203, 0.4708098, -2.097996, 1, 1, 1, 1, 1,
-1.262738, 0.7795988, -3.325604, 1, 1, 1, 1, 1,
-1.246363, -1.647047, -2.017859, 1, 1, 1, 1, 1,
-1.243274, 0.7570829, -0.8226772, 1, 1, 1, 1, 1,
-1.239801, -0.8259304, -2.566781, 1, 1, 1, 1, 1,
-1.237104, -0.338259, -1.691751, 1, 1, 1, 1, 1,
-1.234943, -0.1102287, 0.9324191, 1, 1, 1, 1, 1,
-1.228559, 0.3941081, 0.8685752, 1, 1, 1, 1, 1,
-1.223429, 0.3842533, -0.1447434, 1, 1, 1, 1, 1,
-1.211582, 0.4620551, -1.911884, 1, 1, 1, 1, 1,
-1.205898, -0.9467488, -2.970456, 1, 1, 1, 1, 1,
-1.19461, 1.150437, -0.4634438, 0, 0, 1, 1, 1,
-1.192454, 2.447416, 0.01500813, 1, 0, 0, 1, 1,
-1.19114, -2.168976, -3.098189, 1, 0, 0, 1, 1,
-1.18299, 0.9549834, -2.107908, 1, 0, 0, 1, 1,
-1.17784, -0.3037216, -1.82796, 1, 0, 0, 1, 1,
-1.170687, 0.6570991, -0.6160446, 1, 0, 0, 1, 1,
-1.167141, -0.4544074, -2.107324, 0, 0, 0, 1, 1,
-1.161768, 0.7674507, -0.335933, 0, 0, 0, 1, 1,
-1.15898, -1.17958, -1.541507, 0, 0, 0, 1, 1,
-1.153853, -0.2314341, -3.891464, 0, 0, 0, 1, 1,
-1.153273, -0.274965, -1.616693, 0, 0, 0, 1, 1,
-1.153244, 0.02588126, -1.138769, 0, 0, 0, 1, 1,
-1.153043, 0.1954201, 0.9961911, 0, 0, 0, 1, 1,
-1.149026, -0.2112082, -1.62375, 1, 1, 1, 1, 1,
-1.146879, -1.44483, -0.8920755, 1, 1, 1, 1, 1,
-1.146744, -0.137715, -0.3156313, 1, 1, 1, 1, 1,
-1.146688, -0.4955983, -0.7192917, 1, 1, 1, 1, 1,
-1.145158, 0.5562529, -1.194322, 1, 1, 1, 1, 1,
-1.142776, 0.4735855, 0.2034921, 1, 1, 1, 1, 1,
-1.130034, 2.393022, -0.4222379, 1, 1, 1, 1, 1,
-1.12589, 1.139832, 0.5641665, 1, 1, 1, 1, 1,
-1.125368, -1.19843, -2.859044, 1, 1, 1, 1, 1,
-1.121144, -1.529677, -3.33996, 1, 1, 1, 1, 1,
-1.118314, 0.1286096, -0.6123105, 1, 1, 1, 1, 1,
-1.095959, -0.4417313, -1.106646, 1, 1, 1, 1, 1,
-1.093919, 0.5441397, -0.6858748, 1, 1, 1, 1, 1,
-1.092956, -1.948626, -1.430766, 1, 1, 1, 1, 1,
-1.088297, 0.2037296, -2.146648, 1, 1, 1, 1, 1,
-1.087621, 0.6401404, -2.063551, 0, 0, 1, 1, 1,
-1.087233, -1.694714, -2.655365, 1, 0, 0, 1, 1,
-1.081646, 1.003473, -0.4380248, 1, 0, 0, 1, 1,
-1.080194, 2.04566, 1.241122, 1, 0, 0, 1, 1,
-1.066234, 0.7375749, -2.835439, 1, 0, 0, 1, 1,
-1.064393, 0.612675, -0.7450541, 1, 0, 0, 1, 1,
-1.039485, 0.645546, -2.316724, 0, 0, 0, 1, 1,
-1.034704, -0.2683665, -0.192631, 0, 0, 0, 1, 1,
-1.016174, 0.2859575, -0.2073459, 0, 0, 0, 1, 1,
-1.016109, -0.001972334, -1.768172, 0, 0, 0, 1, 1,
-1.003763, -1.41078, -1.336194, 0, 0, 0, 1, 1,
-1.002246, 0.5305227, -1.741577, 0, 0, 0, 1, 1,
-0.9995729, -0.159298, -2.99542, 0, 0, 0, 1, 1,
-0.9991414, 0.4788644, -1.215879, 1, 1, 1, 1, 1,
-0.998603, 0.3098873, -1.623096, 1, 1, 1, 1, 1,
-0.9980054, -0.08294301, -2.003568, 1, 1, 1, 1, 1,
-0.9966873, -1.365896, -1.60454, 1, 1, 1, 1, 1,
-0.9942588, 1.98597, -1.052035, 1, 1, 1, 1, 1,
-0.9883696, -0.6879779, -1.988998, 1, 1, 1, 1, 1,
-0.9877115, 0.4048572, -0.5978714, 1, 1, 1, 1, 1,
-0.9841843, 1.114109, -0.6408657, 1, 1, 1, 1, 1,
-0.9792863, -1.222191, -1.512654, 1, 1, 1, 1, 1,
-0.9655457, 1.811454, -0.8453177, 1, 1, 1, 1, 1,
-0.9622317, -0.3247789, -1.895205, 1, 1, 1, 1, 1,
-0.9612108, -0.2150384, -0.546221, 1, 1, 1, 1, 1,
-0.9606747, 1.200461, -0.03177427, 1, 1, 1, 1, 1,
-0.9499764, -1.475671, -2.798697, 1, 1, 1, 1, 1,
-0.9464962, 1.060914, -0.07139768, 1, 1, 1, 1, 1,
-0.9435585, -0.4987779, -0.7813589, 0, 0, 1, 1, 1,
-0.9427823, -0.9115057, -5.422387, 1, 0, 0, 1, 1,
-0.9410923, -0.9657124, -1.698614, 1, 0, 0, 1, 1,
-0.931215, 0.3371113, -1.067131, 1, 0, 0, 1, 1,
-0.9233769, -1.121093, -1.748843, 1, 0, 0, 1, 1,
-0.9207127, -2.161795, -2.70535, 1, 0, 0, 1, 1,
-0.9148595, -0.6092448, -2.999368, 0, 0, 0, 1, 1,
-0.913496, 0.6676847, -0.01224754, 0, 0, 0, 1, 1,
-0.9101556, 0.2567677, -2.594324, 0, 0, 0, 1, 1,
-0.9059316, -1.261029, -1.447088, 0, 0, 0, 1, 1,
-0.905351, -1.075694, -2.558432, 0, 0, 0, 1, 1,
-0.9036685, 0.7560624, -3.533126, 0, 0, 0, 1, 1,
-0.8998287, 1.345923, -2.688353, 0, 0, 0, 1, 1,
-0.8997526, 0.3099242, -2.133128, 1, 1, 1, 1, 1,
-0.8993792, 0.8780251, -1.333326, 1, 1, 1, 1, 1,
-0.8925152, -0.1357754, -3.301886, 1, 1, 1, 1, 1,
-0.8918244, -1.806445, -1.381912, 1, 1, 1, 1, 1,
-0.8860629, -0.0402436, -0.3940152, 1, 1, 1, 1, 1,
-0.8764838, -1.738389, -3.186003, 1, 1, 1, 1, 1,
-0.8612961, 1.498059, -1.289234, 1, 1, 1, 1, 1,
-0.860871, -0.427107, -1.390113, 1, 1, 1, 1, 1,
-0.8606586, -1.154119, -1.86064, 1, 1, 1, 1, 1,
-0.859022, 0.4972434, 0.8529067, 1, 1, 1, 1, 1,
-0.8525598, 0.2437224, 0.4143427, 1, 1, 1, 1, 1,
-0.8508744, 1.892732, 0.5324787, 1, 1, 1, 1, 1,
-0.8496991, -0.09322854, -1.451546, 1, 1, 1, 1, 1,
-0.8431981, -0.6654082, -4.720358, 1, 1, 1, 1, 1,
-0.8385972, -0.3257966, -2.159925, 1, 1, 1, 1, 1,
-0.8327531, -0.5902172, -3.529217, 0, 0, 1, 1, 1,
-0.8308061, 1.928389, -0.9248871, 1, 0, 0, 1, 1,
-0.830281, 0.4592202, -3.215455, 1, 0, 0, 1, 1,
-0.822717, -0.9767992, -2.826356, 1, 0, 0, 1, 1,
-0.8219259, -0.7103431, -2.277274, 1, 0, 0, 1, 1,
-0.8184786, 0.2920638, 0.3948655, 1, 0, 0, 1, 1,
-0.815819, 2.34442, 0.2980416, 0, 0, 0, 1, 1,
-0.8109381, 1.131949, -0.8302166, 0, 0, 0, 1, 1,
-0.8074894, -0.8433711, -1.865597, 0, 0, 0, 1, 1,
-0.8055829, -1.045401, -1.470759, 0, 0, 0, 1, 1,
-0.8021013, -0.6003027, -2.567588, 0, 0, 0, 1, 1,
-0.8014941, -0.634841, -3.20791, 0, 0, 0, 1, 1,
-0.78763, -1.301815, -0.9853724, 0, 0, 0, 1, 1,
-0.7842555, -0.8776078, -4.062564, 1, 1, 1, 1, 1,
-0.7839524, 0.5582169, 0.700857, 1, 1, 1, 1, 1,
-0.7819251, -0.1632789, -2.337823, 1, 1, 1, 1, 1,
-0.7806305, 1.862493, 0.4070216, 1, 1, 1, 1, 1,
-0.7743781, 1.626667, -0.9507585, 1, 1, 1, 1, 1,
-0.7741358, 0.3880505, -0.6943055, 1, 1, 1, 1, 1,
-0.7672228, 0.4024872, -1.984498, 1, 1, 1, 1, 1,
-0.7623727, -0.1233745, -0.4205949, 1, 1, 1, 1, 1,
-0.7606881, 0.892068, -1.315543, 1, 1, 1, 1, 1,
-0.7602095, -1.0511, -2.415925, 1, 1, 1, 1, 1,
-0.7582971, 0.6692943, 0.9731857, 1, 1, 1, 1, 1,
-0.7530143, 1.961613, -1.003312, 1, 1, 1, 1, 1,
-0.7490286, -0.4430131, -2.999906, 1, 1, 1, 1, 1,
-0.7430321, 0.2671439, -1.921937, 1, 1, 1, 1, 1,
-0.7380623, -0.05498084, -1.691641, 1, 1, 1, 1, 1,
-0.7294339, 0.9807125, 1.28099, 0, 0, 1, 1, 1,
-0.7268469, -1.535103, -2.588055, 1, 0, 0, 1, 1,
-0.7267305, -1.434216, -2.777777, 1, 0, 0, 1, 1,
-0.7237346, 2.286947, 0.3097433, 1, 0, 0, 1, 1,
-0.723003, 0.6929393, -1.298153, 1, 0, 0, 1, 1,
-0.7210647, 1.764455, 0.3845716, 1, 0, 0, 1, 1,
-0.7201341, -0.5309865, -2.296154, 0, 0, 0, 1, 1,
-0.7186512, -0.9235915, -1.797764, 0, 0, 0, 1, 1,
-0.7178335, 0.727798, 0.7198333, 0, 0, 0, 1, 1,
-0.7174487, 0.6852878, 0.4787875, 0, 0, 0, 1, 1,
-0.7123699, -1.001258, -4.322762, 0, 0, 0, 1, 1,
-0.7105384, 0.2102517, -2.454167, 0, 0, 0, 1, 1,
-0.7000698, 1.510558, -2.88065, 0, 0, 0, 1, 1,
-0.6985406, -0.4008168, -1.15115, 1, 1, 1, 1, 1,
-0.6980112, 0.3723737, -0.4701164, 1, 1, 1, 1, 1,
-0.6948414, 0.4295686, -1.554082, 1, 1, 1, 1, 1,
-0.6934298, 1.071314, -0.4944625, 1, 1, 1, 1, 1,
-0.6931864, 1.1813, 0.08691356, 1, 1, 1, 1, 1,
-0.6929879, 0.6081411, -0.8677663, 1, 1, 1, 1, 1,
-0.6906934, -1.091206, -2.564774, 1, 1, 1, 1, 1,
-0.6892518, -1.447037, -3.514915, 1, 1, 1, 1, 1,
-0.6881369, 2.254005, 0.3957184, 1, 1, 1, 1, 1,
-0.6836589, -1.16296, -2.36889, 1, 1, 1, 1, 1,
-0.6776662, -2.066758, -2.161577, 1, 1, 1, 1, 1,
-0.6771401, -0.1159277, -3.200575, 1, 1, 1, 1, 1,
-0.6731501, -2.625787, -3.438025, 1, 1, 1, 1, 1,
-0.6687876, 1.534736, 0.2771188, 1, 1, 1, 1, 1,
-0.664849, 1.73435, -0.3784961, 1, 1, 1, 1, 1,
-0.6646445, -0.297691, -0.669808, 0, 0, 1, 1, 1,
-0.6633622, 0.5566236, -0.7256479, 1, 0, 0, 1, 1,
-0.6609669, 0.5457184, -0.8649084, 1, 0, 0, 1, 1,
-0.6474931, -1.476553, -2.389514, 1, 0, 0, 1, 1,
-0.6471432, -0.7825291, -1.954627, 1, 0, 0, 1, 1,
-0.646108, 0.1132279, -1.407776, 1, 0, 0, 1, 1,
-0.6442979, -0.9981252, -1.859329, 0, 0, 0, 1, 1,
-0.6391861, 0.120588, -2.195692, 0, 0, 0, 1, 1,
-0.6349103, 0.3785039, -0.6869724, 0, 0, 0, 1, 1,
-0.6333172, 0.4742243, -0.5911137, 0, 0, 0, 1, 1,
-0.6330641, -1.082473, -1.734137, 0, 0, 0, 1, 1,
-0.6231732, -0.0566451, -2.292609, 0, 0, 0, 1, 1,
-0.6202385, 1.481367, -0.3327022, 0, 0, 0, 1, 1,
-0.6198891, -1.767603, -2.718975, 1, 1, 1, 1, 1,
-0.6198567, 0.4650244, -1.021759, 1, 1, 1, 1, 1,
-0.6194098, -0.3333969, -4.006237, 1, 1, 1, 1, 1,
-0.6187172, -1.078354, -3.241786, 1, 1, 1, 1, 1,
-0.6171629, 0.1657581, -0.1608055, 1, 1, 1, 1, 1,
-0.610001, 0.8167885, -0.09225643, 1, 1, 1, 1, 1,
-0.6069585, 0.2572103, -1.68791, 1, 1, 1, 1, 1,
-0.60623, 0.5982563, -0.9435607, 1, 1, 1, 1, 1,
-0.5991968, 0.4454366, -0.159333, 1, 1, 1, 1, 1,
-0.5990172, -0.1666066, 0.01678148, 1, 1, 1, 1, 1,
-0.5964335, 0.1217596, -1.309117, 1, 1, 1, 1, 1,
-0.5929216, -0.1214515, -2.582743, 1, 1, 1, 1, 1,
-0.5911873, 0.5523571, -1.360353, 1, 1, 1, 1, 1,
-0.5872878, 1.593842, -1.654887, 1, 1, 1, 1, 1,
-0.5849673, -1.190829, -3.271757, 1, 1, 1, 1, 1,
-0.5842426, 1.662809, -0.3919767, 0, 0, 1, 1, 1,
-0.5790667, 0.8049797, -1.592807, 1, 0, 0, 1, 1,
-0.5789302, -2.487201, -3.541409, 1, 0, 0, 1, 1,
-0.5743546, 2.575115, -0.6491549, 1, 0, 0, 1, 1,
-0.5690226, -0.5175409, -0.6758378, 1, 0, 0, 1, 1,
-0.5680889, 2.404372, 0.8843651, 1, 0, 0, 1, 1,
-0.5671861, -0.04649257, -0.7900512, 0, 0, 0, 1, 1,
-0.5612127, 0.01549474, -1.027587, 0, 0, 0, 1, 1,
-0.5610778, 0.3448849, -0.8004819, 0, 0, 0, 1, 1,
-0.557066, -1.019152, -1.672156, 0, 0, 0, 1, 1,
-0.5531466, 0.3590907, -0.7836385, 0, 0, 0, 1, 1,
-0.5518634, 0.8509163, 0.2643903, 0, 0, 0, 1, 1,
-0.5486134, 0.7901269, 0.06825714, 0, 0, 0, 1, 1,
-0.5475773, 0.650402, 0.4753298, 1, 1, 1, 1, 1,
-0.5473648, 0.05193208, -0.8181874, 1, 1, 1, 1, 1,
-0.5469632, -0.72658, -4.141501, 1, 1, 1, 1, 1,
-0.5458997, 2.133004, 0.8259726, 1, 1, 1, 1, 1,
-0.5443401, 1.550418, -1.526782, 1, 1, 1, 1, 1,
-0.5397379, -0.2554535, -2.510917, 1, 1, 1, 1, 1,
-0.5266884, -1.273643, -1.428631, 1, 1, 1, 1, 1,
-0.5254521, -0.4786378, -1.357841, 1, 1, 1, 1, 1,
-0.5223521, -0.8423104, -3.446873, 1, 1, 1, 1, 1,
-0.5131677, -0.9975653, -2.121554, 1, 1, 1, 1, 1,
-0.5114098, 1.232571, 0.4816279, 1, 1, 1, 1, 1,
-0.5108425, 0.6005893, -0.6670368, 1, 1, 1, 1, 1,
-0.508042, -1.194559, -3.004285, 1, 1, 1, 1, 1,
-0.5076995, -0.896534, -2.127899, 1, 1, 1, 1, 1,
-0.5045476, -0.1609082, -2.418577, 1, 1, 1, 1, 1,
-0.4992321, 1.43346, 0.2332186, 0, 0, 1, 1, 1,
-0.494766, 0.07145151, -1.086529, 1, 0, 0, 1, 1,
-0.4935784, -0.2877784, -3.688551, 1, 0, 0, 1, 1,
-0.4878111, 1.094859, -0.01643701, 1, 0, 0, 1, 1,
-0.4867363, -0.06244907, 0.4653077, 1, 0, 0, 1, 1,
-0.4858613, -0.4325713, -1.51132, 1, 0, 0, 1, 1,
-0.4852542, -0.5307842, -3.903153, 0, 0, 0, 1, 1,
-0.4811113, -0.6844055, -0.9664806, 0, 0, 0, 1, 1,
-0.4795249, -0.4700665, -4.25355, 0, 0, 0, 1, 1,
-0.4777045, 1.120519, 0.948577, 0, 0, 0, 1, 1,
-0.4750586, -2.443706, -4.279181, 0, 0, 0, 1, 1,
-0.4730449, -1.121731, -2.774993, 0, 0, 0, 1, 1,
-0.4714526, -0.7617045, -3.12521, 0, 0, 0, 1, 1,
-0.4682088, 0.7169756, 0.2265383, 1, 1, 1, 1, 1,
-0.467878, -0.5692354, -3.096493, 1, 1, 1, 1, 1,
-0.4644853, -1.145821, -3.135133, 1, 1, 1, 1, 1,
-0.4643117, 1.170983, -0.7565268, 1, 1, 1, 1, 1,
-0.4636616, 2.526811, -0.7205076, 1, 1, 1, 1, 1,
-0.4592535, -1.468021, -3.02255, 1, 1, 1, 1, 1,
-0.4586147, 0.2679492, -1.759547, 1, 1, 1, 1, 1,
-0.4549676, -0.2405051, -1.809905, 1, 1, 1, 1, 1,
-0.4448436, 1.279043, -1.101868, 1, 1, 1, 1, 1,
-0.443884, -0.9075323, -2.267695, 1, 1, 1, 1, 1,
-0.4404175, -1.007467, -3.083358, 1, 1, 1, 1, 1,
-0.4349824, 0.3018738, -2.629521, 1, 1, 1, 1, 1,
-0.4284687, 0.1684336, -0.6364473, 1, 1, 1, 1, 1,
-0.4236482, 1.61447, 0.3747807, 1, 1, 1, 1, 1,
-0.4187475, -0.6976823, -1.767944, 1, 1, 1, 1, 1,
-0.4173473, -0.3711118, -2.461235, 0, 0, 1, 1, 1,
-0.4171801, 0.01021397, -2.546636, 1, 0, 0, 1, 1,
-0.4133017, 0.03243735, -2.946123, 1, 0, 0, 1, 1,
-0.4129479, -1.223934, -1.889563, 1, 0, 0, 1, 1,
-0.4128518, 1.872065, -0.1189779, 1, 0, 0, 1, 1,
-0.4123303, 1.353878, 0.7052281, 1, 0, 0, 1, 1,
-0.4091086, 0.9427615, 0.3885944, 0, 0, 0, 1, 1,
-0.4057893, -2.155766, -2.633829, 0, 0, 0, 1, 1,
-0.4045812, 0.04430505, -0.9700103, 0, 0, 0, 1, 1,
-0.3967737, 0.02512059, -2.338009, 0, 0, 0, 1, 1,
-0.3950957, -0.2509529, -2.552807, 0, 0, 0, 1, 1,
-0.3945183, -1.042759, -3.421366, 0, 0, 0, 1, 1,
-0.3905829, 0.4839818, -1.024404, 0, 0, 0, 1, 1,
-0.3901842, -0.2753011, -3.133684, 1, 1, 1, 1, 1,
-0.3869103, 0.7673987, 0.6321639, 1, 1, 1, 1, 1,
-0.3841213, 0.3582925, -0.6059397, 1, 1, 1, 1, 1,
-0.3815114, -0.6192052, -1.524178, 1, 1, 1, 1, 1,
-0.3812148, 0.1285124, -1.08745, 1, 1, 1, 1, 1,
-0.3805354, -0.7482858, -2.840056, 1, 1, 1, 1, 1,
-0.3802609, 1.501518, -0.2333338, 1, 1, 1, 1, 1,
-0.3784338, -1.509986, -3.279354, 1, 1, 1, 1, 1,
-0.37546, 0.1446063, -0.8988926, 1, 1, 1, 1, 1,
-0.3735408, 0.5755736, -0.0220466, 1, 1, 1, 1, 1,
-0.3684849, -0.2895731, -0.9976799, 1, 1, 1, 1, 1,
-0.3675848, -0.5562963, -1.031014, 1, 1, 1, 1, 1,
-0.3543712, -0.7545681, -1.906085, 1, 1, 1, 1, 1,
-0.3535484, -0.9831564, -1.687882, 1, 1, 1, 1, 1,
-0.3532479, 0.5281742, -1.415729, 1, 1, 1, 1, 1,
-0.351062, 0.377638, -1.374558, 0, 0, 1, 1, 1,
-0.3502006, 0.2779029, -1.686523, 1, 0, 0, 1, 1,
-0.3409176, 0.7541386, -0.8249314, 1, 0, 0, 1, 1,
-0.3393796, 1.193544, 0.07562014, 1, 0, 0, 1, 1,
-0.3351005, 0.9095252, -1.053469, 1, 0, 0, 1, 1,
-0.3340365, -1.076829, -4.944361, 1, 0, 0, 1, 1,
-0.3232495, 0.00221848, -2.174154, 0, 0, 0, 1, 1,
-0.3228094, 0.4898168, -0.122232, 0, 0, 0, 1, 1,
-0.3226123, -0.318676, -2.971826, 0, 0, 0, 1, 1,
-0.3225774, 0.681313, 0.4491735, 0, 0, 0, 1, 1,
-0.3205995, 0.0405361, -3.396543, 0, 0, 0, 1, 1,
-0.3175838, 0.4853, -1.462558, 0, 0, 0, 1, 1,
-0.3171974, -0.1062922, -0.7703032, 0, 0, 0, 1, 1,
-0.3148539, -0.2812479, -3.053809, 1, 1, 1, 1, 1,
-0.3106847, -1.685855, -2.721859, 1, 1, 1, 1, 1,
-0.3071901, -0.5065164, -3.168818, 1, 1, 1, 1, 1,
-0.3067689, 0.5643867, -0.6013651, 1, 1, 1, 1, 1,
-0.3062269, 0.6543589, -1.161154, 1, 1, 1, 1, 1,
-0.3016649, -2.966837, -1.372871, 1, 1, 1, 1, 1,
-0.3004785, -0.4565805, -1.521382, 1, 1, 1, 1, 1,
-0.2969, 0.4495325, 0.4746006, 1, 1, 1, 1, 1,
-0.2946426, -0.8881257, -2.685544, 1, 1, 1, 1, 1,
-0.2850666, 0.6140034, -0.6464985, 1, 1, 1, 1, 1,
-0.2837535, 1.18877, -2.159412, 1, 1, 1, 1, 1,
-0.2813365, -0.6916667, -3.220483, 1, 1, 1, 1, 1,
-0.2805381, 2.264459, 0.8007273, 1, 1, 1, 1, 1,
-0.2783694, -1.197681, -2.253983, 1, 1, 1, 1, 1,
-0.2780809, 0.1605347, -0.8328112, 1, 1, 1, 1, 1,
-0.2742285, -0.0768926, -2.481694, 0, 0, 1, 1, 1,
-0.2719343, 0.04921359, -0.09990828, 1, 0, 0, 1, 1,
-0.2684388, -0.1041664, -1.664666, 1, 0, 0, 1, 1,
-0.2669027, -1.119447, -2.897326, 1, 0, 0, 1, 1,
-0.2630492, -0.9067193, -2.800238, 1, 0, 0, 1, 1,
-0.2590174, -1.008599, -1.246775, 1, 0, 0, 1, 1,
-0.2584969, -0.5198007, -4.134817, 0, 0, 0, 1, 1,
-0.2578796, 0.138937, -0.6839809, 0, 0, 0, 1, 1,
-0.252898, 0.9630473, 0.2536609, 0, 0, 0, 1, 1,
-0.2502231, 0.3338915, 1.731597, 0, 0, 0, 1, 1,
-0.2445435, -0.1791411, -0.7298731, 0, 0, 0, 1, 1,
-0.2418125, -2.359871, -3.522656, 0, 0, 0, 1, 1,
-0.237397, -0.2371715, -4.48006, 0, 0, 0, 1, 1,
-0.2362787, -0.7776043, -3.400759, 1, 1, 1, 1, 1,
-0.2331719, -0.6509597, -4.19628, 1, 1, 1, 1, 1,
-0.2326469, 0.05151586, -1.319725, 1, 1, 1, 1, 1,
-0.2305902, 0.08557665, -1.275408, 1, 1, 1, 1, 1,
-0.228057, 0.1749282, -0.4985852, 1, 1, 1, 1, 1,
-0.2275315, 0.002343344, -2.153532, 1, 1, 1, 1, 1,
-0.226069, 0.6951724, 0.109796, 1, 1, 1, 1, 1,
-0.2237606, 0.9086777, -0.2685075, 1, 1, 1, 1, 1,
-0.2236676, -1.312545, -3.236904, 1, 1, 1, 1, 1,
-0.22324, 0.8607076, -1.306308, 1, 1, 1, 1, 1,
-0.2156471, -0.5365751, -2.59238, 1, 1, 1, 1, 1,
-0.2156356, 0.5742316, -1.311367, 1, 1, 1, 1, 1,
-0.2065152, -1.01136, -2.112505, 1, 1, 1, 1, 1,
-0.2060585, -0.9921297, -3.802065, 1, 1, 1, 1, 1,
-0.2018642, -0.1513589, -2.520386, 1, 1, 1, 1, 1,
-0.19951, -2.061686, -3.306849, 0, 0, 1, 1, 1,
-0.1982275, -2.688099, -2.749593, 1, 0, 0, 1, 1,
-0.1970602, -0.03731469, -2.629323, 1, 0, 0, 1, 1,
-0.1967527, 0.3643118, -0.4486639, 1, 0, 0, 1, 1,
-0.1938239, -0.8474184, 0.1072939, 1, 0, 0, 1, 1,
-0.1918004, -0.08443613, -3.817798, 1, 0, 0, 1, 1,
-0.1916316, -0.9785541, -2.478176, 0, 0, 0, 1, 1,
-0.1892216, -0.5107179, -2.741111, 0, 0, 0, 1, 1,
-0.1876451, 1.505654, -0.4452169, 0, 0, 0, 1, 1,
-0.1869773, 0.3009265, -0.7224643, 0, 0, 0, 1, 1,
-0.1814958, -0.1656155, -1.272911, 0, 0, 0, 1, 1,
-0.1769494, 0.3241932, 0.5244461, 0, 0, 0, 1, 1,
-0.1760332, -0.8874947, -1.962245, 0, 0, 0, 1, 1,
-0.1760198, -0.2603003, -1.291208, 1, 1, 1, 1, 1,
-0.1692284, -2.293534, -3.505898, 1, 1, 1, 1, 1,
-0.1689342, -1.833127, -2.512414, 1, 1, 1, 1, 1,
-0.1666003, 1.121546, -1.343036, 1, 1, 1, 1, 1,
-0.1642712, 0.7628077, 0.3644468, 1, 1, 1, 1, 1,
-0.1612758, -0.3078825, -2.521547, 1, 1, 1, 1, 1,
-0.1604536, 0.6663024, -1.087305, 1, 1, 1, 1, 1,
-0.1561288, 2.560271, 0.04839716, 1, 1, 1, 1, 1,
-0.1559306, -0.1065816, -1.211437, 1, 1, 1, 1, 1,
-0.1550667, -1.50076, -2.609109, 1, 1, 1, 1, 1,
-0.152725, -0.5216904, -2.000471, 1, 1, 1, 1, 1,
-0.1508665, -1.146526, -3.547067, 1, 1, 1, 1, 1,
-0.1479664, 0.1063054, -1.943588, 1, 1, 1, 1, 1,
-0.140489, -1.223344, -1.458934, 1, 1, 1, 1, 1,
-0.1401103, -1.281559, -2.872347, 1, 1, 1, 1, 1,
-0.1384833, 0.25166, -1.950504, 0, 0, 1, 1, 1,
-0.1380268, -1.40391, -3.461605, 1, 0, 0, 1, 1,
-0.1379702, 0.5534745, -0.4958, 1, 0, 0, 1, 1,
-0.1313923, 0.2540082, -0.02955389, 1, 0, 0, 1, 1,
-0.1307509, 0.1936099, 1.232713, 1, 0, 0, 1, 1,
-0.1292907, 1.493832, -1.31712, 1, 0, 0, 1, 1,
-0.1287129, 1.581536, -1.561213, 0, 0, 0, 1, 1,
-0.1200024, 0.007127705, -3.030312, 0, 0, 0, 1, 1,
-0.1191065, -1.156905, -1.300298, 0, 0, 0, 1, 1,
-0.1185116, -2.993935, -4.039338, 0, 0, 0, 1, 1,
-0.1154698, -0.0424681, -2.485086, 0, 0, 0, 1, 1,
-0.1123883, -0.9133277, -2.656252, 0, 0, 0, 1, 1,
-0.1120871, -1.183246, -1.531321, 0, 0, 0, 1, 1,
-0.1007824, 1.306741, -0.635885, 1, 1, 1, 1, 1,
-0.09955029, -1.401874, -2.91913, 1, 1, 1, 1, 1,
-0.0968632, -0.5769735, -2.916443, 1, 1, 1, 1, 1,
-0.09374693, 0.5021938, 1.392523, 1, 1, 1, 1, 1,
-0.09311582, -0.6670038, -3.099856, 1, 1, 1, 1, 1,
-0.0908802, -1.82439, -2.029531, 1, 1, 1, 1, 1,
-0.08972967, 1.041227, 0.2537052, 1, 1, 1, 1, 1,
-0.08858524, 0.5751788, -1.871144, 1, 1, 1, 1, 1,
-0.08802355, 0.3376235, 2.319778, 1, 1, 1, 1, 1,
-0.08480472, 0.896513, -1.572276, 1, 1, 1, 1, 1,
-0.08466665, 0.04167408, -1.097716, 1, 1, 1, 1, 1,
-0.08460594, -0.4997125, -2.963134, 1, 1, 1, 1, 1,
-0.08030628, -0.0878627, -3.067374, 1, 1, 1, 1, 1,
-0.07957153, -0.4397919, -1.502092, 1, 1, 1, 1, 1,
-0.0785595, -1.003218, -3.681466, 1, 1, 1, 1, 1,
-0.07725912, 0.1755902, -0.4465374, 0, 0, 1, 1, 1,
-0.07166805, -0.8964241, -2.144113, 1, 0, 0, 1, 1,
-0.07146127, -0.1910161, -2.808838, 1, 0, 0, 1, 1,
-0.06432149, -0.07017319, -3.498703, 1, 0, 0, 1, 1,
-0.06168588, 1.140344, -0.1924657, 1, 0, 0, 1, 1,
-0.06057163, -1.190891, -4.387237, 1, 0, 0, 1, 1,
-0.05257609, 0.02901065, 0.6411931, 0, 0, 0, 1, 1,
-0.04955693, 0.5687214, 0.5199143, 0, 0, 0, 1, 1,
-0.04848446, 0.7565773, -0.8403648, 0, 0, 0, 1, 1,
-0.04844204, 0.5648744, 0.04959679, 0, 0, 0, 1, 1,
-0.04303518, 1.256716, -0.2080731, 0, 0, 0, 1, 1,
-0.04076071, 0.549374, -1.870547, 0, 0, 0, 1, 1,
-0.03991225, 0.8303581, -0.0163282, 0, 0, 0, 1, 1,
-0.03967008, 1.487569, 0.1653993, 1, 1, 1, 1, 1,
-0.03511965, 0.5802917, 0.7487969, 1, 1, 1, 1, 1,
-0.03510286, 0.4011615, -0.8683391, 1, 1, 1, 1, 1,
-0.02734277, 0.8883547, 0.3258547, 1, 1, 1, 1, 1,
-0.0272618, 1.072522, 0.5027364, 1, 1, 1, 1, 1,
-0.02692642, -1.781141, -2.029502, 1, 1, 1, 1, 1,
-0.02636964, 0.9587147, 0.2990909, 1, 1, 1, 1, 1,
-0.02189655, 0.7171476, -0.7521637, 1, 1, 1, 1, 1,
-0.01771842, 1.599831, -1.502282, 1, 1, 1, 1, 1,
-0.01769229, 1.526014, 0.08825823, 1, 1, 1, 1, 1,
-0.01582446, -0.3109311, -4.660177, 1, 1, 1, 1, 1,
-0.01576567, -1.617568, -1.003418, 1, 1, 1, 1, 1,
-0.01367593, 0.3560837, 1.326504, 1, 1, 1, 1, 1,
-0.00547561, -2.128585, -4.381728, 1, 1, 1, 1, 1,
-0.004661866, -0.5796267, -2.278206, 1, 1, 1, 1, 1,
-0.002680519, 0.05816201, -0.615046, 0, 0, 1, 1, 1,
0.0001443236, 0.1747586, 1.7695, 1, 0, 0, 1, 1,
0.002810028, 0.8274093, -0.3841975, 1, 0, 0, 1, 1,
0.002853032, 0.3115023, -1.589757, 1, 0, 0, 1, 1,
0.004426453, 0.4821833, 0.793583, 1, 0, 0, 1, 1,
0.005752983, 1.551683, -1.240463, 1, 0, 0, 1, 1,
0.01088104, -0.5805249, 3.786217, 0, 0, 0, 1, 1,
0.01134387, 0.5784518, -1.119323, 0, 0, 0, 1, 1,
0.01343455, -0.7901468, 3.446875, 0, 0, 0, 1, 1,
0.01400031, -0.910656, 3.103429, 0, 0, 0, 1, 1,
0.0147357, -0.259317, 2.786236, 0, 0, 0, 1, 1,
0.01564856, -0.04057452, 4.089864, 0, 0, 0, 1, 1,
0.01771512, -1.459774, 3.89489, 0, 0, 0, 1, 1,
0.01827259, -0.2183191, 1.473822, 1, 1, 1, 1, 1,
0.0187889, -0.4779157, 3.324305, 1, 1, 1, 1, 1,
0.01945445, -0.8183879, 2.370409, 1, 1, 1, 1, 1,
0.02065441, -0.9635021, 3.830434, 1, 1, 1, 1, 1,
0.02134194, -0.5587692, 4.364003, 1, 1, 1, 1, 1,
0.02244546, 0.3121561, -1.937016, 1, 1, 1, 1, 1,
0.02421528, 0.02218691, 2.767289, 1, 1, 1, 1, 1,
0.03125509, -0.7731741, 1.631054, 1, 1, 1, 1, 1,
0.03241337, -2.061554, 3.723864, 1, 1, 1, 1, 1,
0.03278966, 1.284723, -0.6573287, 1, 1, 1, 1, 1,
0.04356984, -0.4744149, 2.324091, 1, 1, 1, 1, 1,
0.04637214, -0.01478147, 0.4069319, 1, 1, 1, 1, 1,
0.04991742, 0.2701207, 1.662369, 1, 1, 1, 1, 1,
0.05859821, -0.5120604, 3.949022, 1, 1, 1, 1, 1,
0.06022048, 0.3790105, -0.2064089, 1, 1, 1, 1, 1,
0.06152398, -0.1066749, 1.69797, 0, 0, 1, 1, 1,
0.06609047, 0.4441243, 0.7667374, 1, 0, 0, 1, 1,
0.06909572, -0.6478271, 3.969088, 1, 0, 0, 1, 1,
0.06911233, 0.9574016, 0.6815445, 1, 0, 0, 1, 1,
0.07172675, -0.3780742, 1.592474, 1, 0, 0, 1, 1,
0.07464536, -0.8372206, 3.005171, 1, 0, 0, 1, 1,
0.07770612, 0.7711967, -0.5080644, 0, 0, 0, 1, 1,
0.07811594, 0.5336661, 0.2757388, 0, 0, 0, 1, 1,
0.08130605, 1.623668, 0.799803, 0, 0, 0, 1, 1,
0.08192982, -1.167671, 4.61003, 0, 0, 0, 1, 1,
0.08200444, 1.366966, -0.1504608, 0, 0, 0, 1, 1,
0.08421501, 2.260821, 1.358803, 0, 0, 0, 1, 1,
0.08494955, 0.1202352, 0.8425297, 0, 0, 0, 1, 1,
0.09264094, 1.801268, 0.7589459, 1, 1, 1, 1, 1,
0.09569103, 1.402649, -0.198314, 1, 1, 1, 1, 1,
0.09699383, 0.1808906, 0.6495196, 1, 1, 1, 1, 1,
0.09982575, -0.3988622, 3.940234, 1, 1, 1, 1, 1,
0.1003214, 0.3803262, -0.3847819, 1, 1, 1, 1, 1,
0.1009614, 0.2470651, -1.213197, 1, 1, 1, 1, 1,
0.1026755, 0.5233853, 0.5256295, 1, 1, 1, 1, 1,
0.103554, 0.7524204, 1.345207, 1, 1, 1, 1, 1,
0.1048107, 1.9915, 0.887243, 1, 1, 1, 1, 1,
0.1134816, -1.470932, 3.724592, 1, 1, 1, 1, 1,
0.1174685, -0.2341796, 3.02212, 1, 1, 1, 1, 1,
0.1183701, 0.4592319, -0.3214771, 1, 1, 1, 1, 1,
0.1232393, -0.8410147, 3.601997, 1, 1, 1, 1, 1,
0.1240809, 0.5596984, 1.262998, 1, 1, 1, 1, 1,
0.1249975, -0.1383806, 3.431768, 1, 1, 1, 1, 1,
0.126574, 0.9257923, 1.57269, 0, 0, 1, 1, 1,
0.1269043, 0.3808568, -0.7829965, 1, 0, 0, 1, 1,
0.1286189, -2.026623, 1.890789, 1, 0, 0, 1, 1,
0.1374699, -0.8197221, 2.992748, 1, 0, 0, 1, 1,
0.143191, -0.9156043, 4.039294, 1, 0, 0, 1, 1,
0.1444949, -0.9895433, 4.77125, 1, 0, 0, 1, 1,
0.1477402, -0.1649512, 3.529341, 0, 0, 0, 1, 1,
0.1529749, 0.4440998, 0.4847368, 0, 0, 0, 1, 1,
0.1566479, -0.8220925, 3.058325, 0, 0, 0, 1, 1,
0.1571974, 0.5676079, -0.521675, 0, 0, 0, 1, 1,
0.1577083, 0.9531059, 0.4697083, 0, 0, 0, 1, 1,
0.1584339, 0.7107151, 0.8582941, 0, 0, 0, 1, 1,
0.1591873, 0.2761895, -0.1921768, 0, 0, 0, 1, 1,
0.16206, 0.2846921, -1.430399, 1, 1, 1, 1, 1,
0.1644619, 0.7659654, 0.796663, 1, 1, 1, 1, 1,
0.166312, -0.9418728, 3.046992, 1, 1, 1, 1, 1,
0.1739148, 0.8806617, 1.249706, 1, 1, 1, 1, 1,
0.1747317, -0.6299137, 2.898773, 1, 1, 1, 1, 1,
0.1779225, 0.6091099, 1.543004, 1, 1, 1, 1, 1,
0.183447, -0.3545822, 1.617931, 1, 1, 1, 1, 1,
0.1852902, 0.1405061, 1.687221, 1, 1, 1, 1, 1,
0.1867729, 0.4310232, 0.9235134, 1, 1, 1, 1, 1,
0.1886936, -2.117692, 3.751652, 1, 1, 1, 1, 1,
0.1901213, 1.140036, 0.3802767, 1, 1, 1, 1, 1,
0.193008, 0.01100917, 1.49845, 1, 1, 1, 1, 1,
0.1947323, -0.6049984, 3.667406, 1, 1, 1, 1, 1,
0.1970593, -0.6719843, 3.34098, 1, 1, 1, 1, 1,
0.1983161, -0.1436822, 2.635826, 1, 1, 1, 1, 1,
0.2028221, 0.4348498, 0.915357, 0, 0, 1, 1, 1,
0.2040235, -1.280348, 2.318815, 1, 0, 0, 1, 1,
0.2042295, -1.623104, 2.861432, 1, 0, 0, 1, 1,
0.2087422, -1.427104, 2.497258, 1, 0, 0, 1, 1,
0.2089329, -1.063481, 2.759078, 1, 0, 0, 1, 1,
0.209206, -0.2401734, 0.7323003, 1, 0, 0, 1, 1,
0.2137604, 1.496211, 1.392956, 0, 0, 0, 1, 1,
0.2140868, -0.956942, 2.803461, 0, 0, 0, 1, 1,
0.2206742, 2.02535, -1.050257, 0, 0, 0, 1, 1,
0.2222033, 0.06428087, 1.730702, 0, 0, 0, 1, 1,
0.2244494, -0.7632174, 2.206495, 0, 0, 0, 1, 1,
0.231673, -0.02701454, 0.5070964, 0, 0, 0, 1, 1,
0.2319595, -0.9502161, 1.219585, 0, 0, 0, 1, 1,
0.2343839, -0.8883525, 1.581643, 1, 1, 1, 1, 1,
0.2352005, 0.2976806, 0.2446479, 1, 1, 1, 1, 1,
0.236021, -0.1334416, 3.930606, 1, 1, 1, 1, 1,
0.2372507, -0.3072688, 1.968121, 1, 1, 1, 1, 1,
0.2421363, 2.470664, -0.7248588, 1, 1, 1, 1, 1,
0.2421618, 0.0991594, 1.669095, 1, 1, 1, 1, 1,
0.2422887, -0.8942014, 1.077619, 1, 1, 1, 1, 1,
0.2424608, 0.4533578, 0.3482643, 1, 1, 1, 1, 1,
0.2427945, 0.1139691, 0.2446186, 1, 1, 1, 1, 1,
0.2430719, 1.062132, 0.6320072, 1, 1, 1, 1, 1,
0.2474084, 1.371707, 0.4864328, 1, 1, 1, 1, 1,
0.249445, -0.4878078, 2.431791, 1, 1, 1, 1, 1,
0.2496387, -2.983839, 3.539971, 1, 1, 1, 1, 1,
0.2514877, -0.7311395, 2.204836, 1, 1, 1, 1, 1,
0.2522304, -2.847646, 2.959521, 1, 1, 1, 1, 1,
0.2561768, 2.164215, -1.722773, 0, 0, 1, 1, 1,
0.2584698, 1.353412, -0.6446038, 1, 0, 0, 1, 1,
0.2610557, -0.7133281, 1.551243, 1, 0, 0, 1, 1,
0.2718109, -0.9585078, 2.280954, 1, 0, 0, 1, 1,
0.2735894, 1.300466, -0.1959039, 1, 0, 0, 1, 1,
0.2741632, -0.1350591, 1.456472, 1, 0, 0, 1, 1,
0.2788876, 0.4531367, 1.04788, 0, 0, 0, 1, 1,
0.2824214, 1.067971, 1.726282, 0, 0, 0, 1, 1,
0.2841638, -1.380213, 2.230023, 0, 0, 0, 1, 1,
0.2866211, -0.9651142, 1.851393, 0, 0, 0, 1, 1,
0.2866728, -0.05216439, 3.028832, 0, 0, 0, 1, 1,
0.2898327, 0.3449664, 0.7840671, 0, 0, 0, 1, 1,
0.2942871, 0.3618982, 0.4919903, 0, 0, 0, 1, 1,
0.2943273, -0.2950936, 3.308777, 1, 1, 1, 1, 1,
0.2946743, -1.327953, 3.49492, 1, 1, 1, 1, 1,
0.2952434, 1.253514, 1.992383, 1, 1, 1, 1, 1,
0.2965683, 0.9142783, 1.927266, 1, 1, 1, 1, 1,
0.3014745, 0.2184178, -0.2447504, 1, 1, 1, 1, 1,
0.3037395, 0.6671031, 2.031621, 1, 1, 1, 1, 1,
0.3061448, -0.3955616, 2.497351, 1, 1, 1, 1, 1,
0.3062381, -1.452212, 3.78202, 1, 1, 1, 1, 1,
0.3095921, 0.8699658, 0.4419704, 1, 1, 1, 1, 1,
0.312239, -0.1031984, 2.547506, 1, 1, 1, 1, 1,
0.3128898, 0.1175828, 0.643179, 1, 1, 1, 1, 1,
0.3157272, 0.5903007, -0.06223822, 1, 1, 1, 1, 1,
0.3167288, 0.329689, 3.374453, 1, 1, 1, 1, 1,
0.3197456, 0.5403354, 1.270173, 1, 1, 1, 1, 1,
0.3214485, 0.7354656, 0.2575648, 1, 1, 1, 1, 1,
0.3234, 0.3661892, 1.432094, 0, 0, 1, 1, 1,
0.3270275, 0.439274, -0.2390088, 1, 0, 0, 1, 1,
0.3293102, 2.035659, 0.9848861, 1, 0, 0, 1, 1,
0.3295834, -1.59762, 2.823185, 1, 0, 0, 1, 1,
0.3308382, 0.04628034, 1.289241, 1, 0, 0, 1, 1,
0.3339787, 1.001402, -0.1734125, 1, 0, 0, 1, 1,
0.3369615, 2.998052, 0.9607897, 0, 0, 0, 1, 1,
0.3385877, 1.282093, 0.9925672, 0, 0, 0, 1, 1,
0.3408623, 1.831126, 0.5987967, 0, 0, 0, 1, 1,
0.342382, 1.034761, -0.463258, 0, 0, 0, 1, 1,
0.3442347, -1.18429, 4.295165, 0, 0, 0, 1, 1,
0.3468689, -0.2793639, 2.846067, 0, 0, 0, 1, 1,
0.3482569, 1.169206, 0.3520603, 0, 0, 0, 1, 1,
0.3487037, -1.13147, 3.152229, 1, 1, 1, 1, 1,
0.3494451, -2.860367, 5.0794, 1, 1, 1, 1, 1,
0.3511318, 1.345968, 1.079499, 1, 1, 1, 1, 1,
0.3670925, 0.4329973, 1.212589, 1, 1, 1, 1, 1,
0.3675968, 0.7887243, -1.573318, 1, 1, 1, 1, 1,
0.3676063, -1.502155, 3.00655, 1, 1, 1, 1, 1,
0.3688377, 1.153198, -0.3117321, 1, 1, 1, 1, 1,
0.3693846, -0.9306844, 5.268459, 1, 1, 1, 1, 1,
0.3708924, 0.2338149, -0.3279467, 1, 1, 1, 1, 1,
0.3812462, 0.9047427, -0.6464953, 1, 1, 1, 1, 1,
0.3862493, 0.2988475, -0.6472428, 1, 1, 1, 1, 1,
0.4009068, 1.30902, 0.8700784, 1, 1, 1, 1, 1,
0.4023595, -0.02647879, 2.003686, 1, 1, 1, 1, 1,
0.4041093, -2.562313, 1.37579, 1, 1, 1, 1, 1,
0.4061203, 0.4088431, -0.5447567, 1, 1, 1, 1, 1,
0.4071766, -0.4680736, 2.354662, 0, 0, 1, 1, 1,
0.4112723, -1.35434, 1.243306, 1, 0, 0, 1, 1,
0.4192269, 0.9833508, -2.264369, 1, 0, 0, 1, 1,
0.4199921, -0.2004987, 0.6667652, 1, 0, 0, 1, 1,
0.4215907, -0.2846321, 1.852863, 1, 0, 0, 1, 1,
0.4218712, 1.305446, -0.9019217, 1, 0, 0, 1, 1,
0.4250777, 0.8378344, 1.151387, 0, 0, 0, 1, 1,
0.4320578, -0.3094347, 2.263684, 0, 0, 0, 1, 1,
0.4354359, -1.597939, 3.6851, 0, 0, 0, 1, 1,
0.4374785, 1.619162, 0.008075984, 0, 0, 0, 1, 1,
0.4378753, -0.2660522, 1.034401, 0, 0, 0, 1, 1,
0.4378859, -0.3546982, 2.484038, 0, 0, 0, 1, 1,
0.4389044, -1.312501, 2.067726, 0, 0, 0, 1, 1,
0.4406236, -1.015485, 1.90088, 1, 1, 1, 1, 1,
0.4442582, 2.141999, 0.8900679, 1, 1, 1, 1, 1,
0.445495, 0.01112494, 2.937974, 1, 1, 1, 1, 1,
0.449881, -1.404467, 1.688295, 1, 1, 1, 1, 1,
0.4552698, -0.07332171, 2.073904, 1, 1, 1, 1, 1,
0.4571392, -0.2282172, 4.003799, 1, 1, 1, 1, 1,
0.4580905, 0.3563653, 1.871198, 1, 1, 1, 1, 1,
0.4587134, 0.531448, 0.3429442, 1, 1, 1, 1, 1,
0.4607948, 0.4924538, 2.040423, 1, 1, 1, 1, 1,
0.461878, -0.4124707, 4.954528, 1, 1, 1, 1, 1,
0.4622633, -0.02976956, 1.302706, 1, 1, 1, 1, 1,
0.4631151, 0.2288263, 0.3336248, 1, 1, 1, 1, 1,
0.4631695, -0.08427325, 1.775413, 1, 1, 1, 1, 1,
0.4643672, 0.6358734, 1.837678, 1, 1, 1, 1, 1,
0.4680226, 1.2069, -1.000316, 1, 1, 1, 1, 1,
0.4683525, 1.132157, 1.698025, 0, 0, 1, 1, 1,
0.4718904, -0.1292309, 2.317611, 1, 0, 0, 1, 1,
0.4721406, -1.173909, 3.181027, 1, 0, 0, 1, 1,
0.4722688, -0.8808354, 3.642831, 1, 0, 0, 1, 1,
0.4730981, -1.45275, 2.556207, 1, 0, 0, 1, 1,
0.4738822, 0.1904827, 2.228634, 1, 0, 0, 1, 1,
0.475024, 2.289875, 1.041798, 0, 0, 0, 1, 1,
0.4753747, 0.9166047, -0.7833358, 0, 0, 0, 1, 1,
0.4831732, -0.6355061, 2.212958, 0, 0, 0, 1, 1,
0.4864237, 0.4095836, -0.09809469, 0, 0, 0, 1, 1,
0.4881849, 1.317242, 1.299918, 0, 0, 0, 1, 1,
0.490263, 0.391545, 1.057729, 0, 0, 0, 1, 1,
0.4917942, -1.101616, 2.436787, 0, 0, 0, 1, 1,
0.4926471, -0.60517, 1.833686, 1, 1, 1, 1, 1,
0.4941699, -0.2541947, 4.067954, 1, 1, 1, 1, 1,
0.4943565, 0.7591531, 1.343477, 1, 1, 1, 1, 1,
0.4974671, 0.7092339, 0.391928, 1, 1, 1, 1, 1,
0.4984954, 0.3048541, 2.034487, 1, 1, 1, 1, 1,
0.5046462, 2.201178, -0.639694, 1, 1, 1, 1, 1,
0.5076082, 1.271633, 0.6891122, 1, 1, 1, 1, 1,
0.510035, 0.658416, -0.8491763, 1, 1, 1, 1, 1,
0.5172217, 0.18131, 1.659673, 1, 1, 1, 1, 1,
0.5217596, -0.6721649, 2.147093, 1, 1, 1, 1, 1,
0.5232358, -0.9347573, 4.154939, 1, 1, 1, 1, 1,
0.5271763, -0.8545338, 4.189149, 1, 1, 1, 1, 1,
0.5385903, -0.5068012, 3.320976, 1, 1, 1, 1, 1,
0.540778, -0.5262914, 4.338593, 1, 1, 1, 1, 1,
0.5439355, 0.05503823, -0.6347404, 1, 1, 1, 1, 1,
0.5444298, 0.04673292, 1.981073, 0, 0, 1, 1, 1,
0.5670453, 0.6420385, -0.2093922, 1, 0, 0, 1, 1,
0.5701436, -0.4650487, 2.336692, 1, 0, 0, 1, 1,
0.5751616, 0.861009, 2.432751, 1, 0, 0, 1, 1,
0.5758331, -0.5810735, 1.972928, 1, 0, 0, 1, 1,
0.5780913, -1.323446, 2.762845, 1, 0, 0, 1, 1,
0.5791767, 0.7701982, 0.6117052, 0, 0, 0, 1, 1,
0.57942, -1.335264, 3.469088, 0, 0, 0, 1, 1,
0.5803992, 1.709846, 0.9317067, 0, 0, 0, 1, 1,
0.5861464, -0.4327844, 3.10868, 0, 0, 0, 1, 1,
0.5909295, 0.8361109, -0.3372764, 0, 0, 0, 1, 1,
0.5925108, -1.214461, 4.46354, 0, 0, 0, 1, 1,
0.594154, 0.004250518, 1.468139, 0, 0, 0, 1, 1,
0.6015847, -0.4326957, 1.504225, 1, 1, 1, 1, 1,
0.6016816, 0.6712753, 0.4083669, 1, 1, 1, 1, 1,
0.6110665, 0.8660156, 0.5156398, 1, 1, 1, 1, 1,
0.6128365, -0.07623614, 0.3378118, 1, 1, 1, 1, 1,
0.6186098, -0.2233853, 2.026578, 1, 1, 1, 1, 1,
0.6190048, 2.490882, -1.071077, 1, 1, 1, 1, 1,
0.6201246, -1.26351, 3.094486, 1, 1, 1, 1, 1,
0.6215525, 0.01770258, 0.2787903, 1, 1, 1, 1, 1,
0.6260763, 0.2719856, -0.500423, 1, 1, 1, 1, 1,
0.6290396, -0.5245776, 4.154224, 1, 1, 1, 1, 1,
0.6318806, -0.07388242, 3.047118, 1, 1, 1, 1, 1,
0.6350592, -0.6923355, 3.058818, 1, 1, 1, 1, 1,
0.636148, -0.1502088, 0.6243554, 1, 1, 1, 1, 1,
0.6368818, -0.3237196, 1.769599, 1, 1, 1, 1, 1,
0.6372482, 0.5296054, -0.3570268, 1, 1, 1, 1, 1,
0.6387414, -1.118869, 2.668302, 0, 0, 1, 1, 1,
0.6424348, 0.2228242, 0.2114917, 1, 0, 0, 1, 1,
0.6453167, 0.3627753, 0.5469959, 1, 0, 0, 1, 1,
0.6454139, 0.06780296, -0.4237803, 1, 0, 0, 1, 1,
0.6508937, -0.1951321, 2.278839, 1, 0, 0, 1, 1,
0.6528761, -0.5384434, 1.130349, 1, 0, 0, 1, 1,
0.6531283, -1.336027, 3.594147, 0, 0, 0, 1, 1,
0.6540921, 1.048944, 0.2746684, 0, 0, 0, 1, 1,
0.6582099, -0.6545155, 3.234478, 0, 0, 0, 1, 1,
0.6600568, 0.8622174, 0.1237544, 0, 0, 0, 1, 1,
0.6617826, -1.832537, 3.011508, 0, 0, 0, 1, 1,
0.6621618, 1.105425, 1.613563, 0, 0, 0, 1, 1,
0.6644821, 0.6835939, 1.07182, 0, 0, 0, 1, 1,
0.6646971, 1.566891, 1.665529, 1, 1, 1, 1, 1,
0.6668823, 0.1537926, 0.5397376, 1, 1, 1, 1, 1,
0.6704477, 0.1018485, 1.109662, 1, 1, 1, 1, 1,
0.6713641, 0.3031688, 1.73365, 1, 1, 1, 1, 1,
0.6758673, 0.1463761, 0.4476987, 1, 1, 1, 1, 1,
0.6841101, -0.2736649, 2.1587, 1, 1, 1, 1, 1,
0.6849457, -0.2344176, 1.384374, 1, 1, 1, 1, 1,
0.685313, -0.6674894, 1.800716, 1, 1, 1, 1, 1,
0.6866186, -0.3132268, 3.289165, 1, 1, 1, 1, 1,
0.6916018, -2.543343, 4.266181, 1, 1, 1, 1, 1,
0.692682, 0.5072491, 1.586011, 1, 1, 1, 1, 1,
0.6950591, 0.9533461, 1.960989, 1, 1, 1, 1, 1,
0.6961032, -0.2710515, 2.359786, 1, 1, 1, 1, 1,
0.7018416, 1.151267, 0.2284195, 1, 1, 1, 1, 1,
0.7021856, -0.8036238, 0.793306, 1, 1, 1, 1, 1,
0.7061222, 0.3929069, 0.9022674, 0, 0, 1, 1, 1,
0.7100521, -1.759883, 5.308974, 1, 0, 0, 1, 1,
0.7174636, 0.6662704, 0.09068333, 1, 0, 0, 1, 1,
0.7238166, 0.1972974, 1.788285, 1, 0, 0, 1, 1,
0.7246065, 1.812509, 0.1653509, 1, 0, 0, 1, 1,
0.7250981, -0.5416291, 2.860134, 1, 0, 0, 1, 1,
0.7257974, -1.112228, 3.97801, 0, 0, 0, 1, 1,
0.7258021, -1.707015, 2.466889, 0, 0, 0, 1, 1,
0.7276808, -1.752109, 3.248457, 0, 0, 0, 1, 1,
0.740267, -0.5289868, 1.800611, 0, 0, 0, 1, 1,
0.7452171, 1.001893, -0.03177264, 0, 0, 0, 1, 1,
0.7452951, 0.01980575, 1.668923, 0, 0, 0, 1, 1,
0.7542043, 0.5666118, 0.1429339, 0, 0, 0, 1, 1,
0.7597729, 0.5960765, 1.349798, 1, 1, 1, 1, 1,
0.7608499, 1.030872, 1.438206, 1, 1, 1, 1, 1,
0.7616084, 0.5311163, -0.2305991, 1, 1, 1, 1, 1,
0.7637307, 1.065096, -0.754935, 1, 1, 1, 1, 1,
0.7642124, 1.966793, -0.5239875, 1, 1, 1, 1, 1,
0.7720392, 0.003695039, 0.05838468, 1, 1, 1, 1, 1,
0.777453, -0.6575828, 1.891845, 1, 1, 1, 1, 1,
0.7781067, -0.5151619, 1.54595, 1, 1, 1, 1, 1,
0.7840261, 1.533491, 0.8156286, 1, 1, 1, 1, 1,
0.786045, -0.3799194, 3.662155, 1, 1, 1, 1, 1,
0.7860621, 0.4278282, 2.444825, 1, 1, 1, 1, 1,
0.7871307, 1.819956, 0.259708, 1, 1, 1, 1, 1,
0.7894351, -0.6304643, 3.03157, 1, 1, 1, 1, 1,
0.7947887, -1.348905, 1.176735, 1, 1, 1, 1, 1,
0.7978507, 0.5744332, 1.960449, 1, 1, 1, 1, 1,
0.7982553, -1.018168, 1.346482, 0, 0, 1, 1, 1,
0.7995842, -0.5594237, 3.799304, 1, 0, 0, 1, 1,
0.8014491, -0.3538726, 3.044946, 1, 0, 0, 1, 1,
0.8018546, -1.501619, 3.592431, 1, 0, 0, 1, 1,
0.8069932, 1.151433, 2.010973, 1, 0, 0, 1, 1,
0.8095311, 0.1109648, 1.094151, 1, 0, 0, 1, 1,
0.8114634, -0.2903093, 1.74967, 0, 0, 0, 1, 1,
0.8118876, -0.842539, 4.000442, 0, 0, 0, 1, 1,
0.8235886, -1.510293, 4.611026, 0, 0, 0, 1, 1,
0.8300884, 0.04287786, 1.693081, 0, 0, 0, 1, 1,
0.8314779, -0.3561837, 1.231975, 0, 0, 0, 1, 1,
0.8501785, -1.019377, 2.531503, 0, 0, 0, 1, 1,
0.855062, -0.6933372, -0.3244088, 0, 0, 0, 1, 1,
0.8560542, 0.01761393, 1.763616, 1, 1, 1, 1, 1,
0.8569887, 0.132463, 1.809895, 1, 1, 1, 1, 1,
0.8576545, 0.9186581, 0.7703049, 1, 1, 1, 1, 1,
0.8598235, -0.7720097, 0.821902, 1, 1, 1, 1, 1,
0.8613212, 1.228519, 0.8853762, 1, 1, 1, 1, 1,
0.8625859, 1.034724, 1.322965, 1, 1, 1, 1, 1,
0.8727018, -0.2511519, 2.288846, 1, 1, 1, 1, 1,
0.8735736, -2.684866, 1.849908, 1, 1, 1, 1, 1,
0.8829126, 0.6990104, -1.98454, 1, 1, 1, 1, 1,
0.8878285, 1.332195, 0.4960542, 1, 1, 1, 1, 1,
0.8880963, 1.09024, 0.4753154, 1, 1, 1, 1, 1,
0.8926499, -1.577787, 2.746797, 1, 1, 1, 1, 1,
0.9093261, 0.6337937, -0.1895672, 1, 1, 1, 1, 1,
0.9106553, 1.640651, 0.9915612, 1, 1, 1, 1, 1,
0.913615, -0.5292247, 2.680089, 1, 1, 1, 1, 1,
0.928012, -0.6929974, 3.553908, 0, 0, 1, 1, 1,
0.9290873, -0.0205997, 2.384884, 1, 0, 0, 1, 1,
0.9294766, -0.1149792, 1.860396, 1, 0, 0, 1, 1,
0.9299159, -0.270522, 1.48479, 1, 0, 0, 1, 1,
0.9406285, -0.1309529, 0.7857906, 1, 0, 0, 1, 1,
0.9412407, 1.577704, 1.344277, 1, 0, 0, 1, 1,
0.942799, -1.190884, 1.663596, 0, 0, 0, 1, 1,
0.9478478, 2.10026, -0.8261008, 0, 0, 0, 1, 1,
0.9494853, -0.2718969, 0.4520532, 0, 0, 0, 1, 1,
0.958194, 1.28452, 0.6637637, 0, 0, 0, 1, 1,
0.9660662, -1.056636, 1.680967, 0, 0, 0, 1, 1,
0.9759773, 0.4294866, 1.815955, 0, 0, 0, 1, 1,
0.9908459, 2.272276, -0.9905105, 0, 0, 0, 1, 1,
0.9913514, 0.653289, 1.691009, 1, 1, 1, 1, 1,
0.9936746, 0.2665301, 0.5855622, 1, 1, 1, 1, 1,
0.9973217, 1.223115, 0.2244707, 1, 1, 1, 1, 1,
1.001093, 0.4689153, 1.633515, 1, 1, 1, 1, 1,
1.002184, -1.384195, 2.299389, 1, 1, 1, 1, 1,
1.008496, -0.4415296, 0.9733486, 1, 1, 1, 1, 1,
1.011128, -0.2682678, 1.378116, 1, 1, 1, 1, 1,
1.021491, -1.501993, 4.535913, 1, 1, 1, 1, 1,
1.022786, 0.7808689, 0.1297541, 1, 1, 1, 1, 1,
1.024483, 0.5857266, 0.6473635, 1, 1, 1, 1, 1,
1.027007, -0.634249, 1.828164, 1, 1, 1, 1, 1,
1.032833, 0.6109751, 1.615412, 1, 1, 1, 1, 1,
1.034784, 1.792458, 0.4893517, 1, 1, 1, 1, 1,
1.039, -0.3208815, 2.611388, 1, 1, 1, 1, 1,
1.039449, -0.1089903, 0.4661299, 1, 1, 1, 1, 1,
1.042556, -1.364998, 1.423444, 0, 0, 1, 1, 1,
1.043135, 0.9937742, -1.131681, 1, 0, 0, 1, 1,
1.044803, -0.9620493, 1.871165, 1, 0, 0, 1, 1,
1.047545, 0.07279201, 0.8822042, 1, 0, 0, 1, 1,
1.063083, -1.426841, 2.771887, 1, 0, 0, 1, 1,
1.066087, 0.1468049, -0.5164946, 1, 0, 0, 1, 1,
1.074548, -1.348109, 2.111439, 0, 0, 0, 1, 1,
1.080874, 0.08647249, 1.957303, 0, 0, 0, 1, 1,
1.081635, 0.1261348, 0.6423912, 0, 0, 0, 1, 1,
1.082224, -1.536095, 3.361479, 0, 0, 0, 1, 1,
1.089622, 0.8263457, -0.2395788, 0, 0, 0, 1, 1,
1.094868, 0.5428181, 0.2558372, 0, 0, 0, 1, 1,
1.098001, -1.017091, 2.508807, 0, 0, 0, 1, 1,
1.108431, 1.231732, 0.7116677, 1, 1, 1, 1, 1,
1.109018, 0.07193108, 2.936539, 1, 1, 1, 1, 1,
1.109553, 0.0455512, 0.4319005, 1, 1, 1, 1, 1,
1.111488, 0.3416258, 1.606168, 1, 1, 1, 1, 1,
1.113213, 0.3299232, 1.581962, 1, 1, 1, 1, 1,
1.113254, -1.994966, 1.680533, 1, 1, 1, 1, 1,
1.120762, -0.3266355, 0.7833177, 1, 1, 1, 1, 1,
1.129606, 1.210641, -2.596145, 1, 1, 1, 1, 1,
1.13525, -0.5527923, 2.522072, 1, 1, 1, 1, 1,
1.159077, 0.1065414, 0.6979865, 1, 1, 1, 1, 1,
1.159152, 0.5639181, -0.6585684, 1, 1, 1, 1, 1,
1.161235, -0.8064321, 2.338513, 1, 1, 1, 1, 1,
1.164461, 1.300454, -0.242511, 1, 1, 1, 1, 1,
1.166439, -1.152983, 0.5064989, 1, 1, 1, 1, 1,
1.176178, -1.468538, 1.970064, 1, 1, 1, 1, 1,
1.181766, 0.1311612, 0.3634422, 0, 0, 1, 1, 1,
1.192136, -2.537131, 3.035253, 1, 0, 0, 1, 1,
1.202288, -1.740392, 3.118326, 1, 0, 0, 1, 1,
1.203595, 0.228168, 2.796484, 1, 0, 0, 1, 1,
1.210898, -0.285165, 1.101504, 1, 0, 0, 1, 1,
1.21611, -0.6478626, 0.1508171, 1, 0, 0, 1, 1,
1.220943, 1.694909, 0.4844967, 0, 0, 0, 1, 1,
1.227403, -0.6680961, 3.498581, 0, 0, 0, 1, 1,
1.229028, -2.223039, 2.726315, 0, 0, 0, 1, 1,
1.229461, 0.4305422, -0.08291589, 0, 0, 0, 1, 1,
1.230939, 0.1243519, 1.468565, 0, 0, 0, 1, 1,
1.23425, 0.1197999, 1.916903, 0, 0, 0, 1, 1,
1.242052, 1.043874, -0.5390674, 0, 0, 0, 1, 1,
1.244502, -0.3902895, 0.7700543, 1, 1, 1, 1, 1,
1.244691, 0.9015158, 1.582235, 1, 1, 1, 1, 1,
1.248801, -0.2666581, 0.4471344, 1, 1, 1, 1, 1,
1.260486, 1.545717, 2.262569, 1, 1, 1, 1, 1,
1.262093, -1.607472, 2.347557, 1, 1, 1, 1, 1,
1.27231, 1.535378, -0.3647138, 1, 1, 1, 1, 1,
1.27257, 0.1455693, 1.263706, 1, 1, 1, 1, 1,
1.273771, -0.1557143, -0.1682414, 1, 1, 1, 1, 1,
1.278609, 0.256212, 0.9712436, 1, 1, 1, 1, 1,
1.287193, 0.2778864, 2.335587, 1, 1, 1, 1, 1,
1.291313, 0.05516112, 1.443471, 1, 1, 1, 1, 1,
1.297065, -1.903261, 1.967537, 1, 1, 1, 1, 1,
1.308067, 0.3741605, 2.150353, 1, 1, 1, 1, 1,
1.316757, 0.1233534, -0.5005463, 1, 1, 1, 1, 1,
1.327601, 1.048795, 0.5734619, 1, 1, 1, 1, 1,
1.33645, -1.324957, 0.2831829, 0, 0, 1, 1, 1,
1.344895, 0.0008854849, 1.180198, 1, 0, 0, 1, 1,
1.357538, -1.202964, 2.111516, 1, 0, 0, 1, 1,
1.357772, -0.4434707, 0.4818415, 1, 0, 0, 1, 1,
1.369123, -1.668776, 3.605146, 1, 0, 0, 1, 1,
1.374153, -0.4100285, -0.03310545, 1, 0, 0, 1, 1,
1.383483, -0.3504857, 1.284451, 0, 0, 0, 1, 1,
1.392392, 0.615609, -0.1924015, 0, 0, 0, 1, 1,
1.396753, -0.9383762, 2.560125, 0, 0, 0, 1, 1,
1.397186, 0.9246984, -0.4609443, 0, 0, 0, 1, 1,
1.405209, 0.4501208, 1.798342, 0, 0, 0, 1, 1,
1.409089, 0.2890704, 1.768991, 0, 0, 0, 1, 1,
1.413468, -0.5874687, 1.204125, 0, 0, 0, 1, 1,
1.414184, -0.2487124, 1.180982, 1, 1, 1, 1, 1,
1.421232, 1.331403, 2.262861, 1, 1, 1, 1, 1,
1.429358, 1.207779, 1.472711, 1, 1, 1, 1, 1,
1.443014, 0.001442727, -0.9110505, 1, 1, 1, 1, 1,
1.452415, -0.4455234, 2.064732, 1, 1, 1, 1, 1,
1.473283, -0.04105323, 2.445778, 1, 1, 1, 1, 1,
1.514904, 1.504569, -0.07306424, 1, 1, 1, 1, 1,
1.532923, 1.234828, 3.371277, 1, 1, 1, 1, 1,
1.535123, 0.9939913, 2.000144, 1, 1, 1, 1, 1,
1.535424, 1.434381, 1.638844, 1, 1, 1, 1, 1,
1.538395, 0.8421313, -0.0388045, 1, 1, 1, 1, 1,
1.539415, 0.1005789, 1.206474, 1, 1, 1, 1, 1,
1.540251, -1.553167, 1.661484, 1, 1, 1, 1, 1,
1.550508, 0.1289562, -0.1139826, 1, 1, 1, 1, 1,
1.567634, 0.1592653, 3.011356, 1, 1, 1, 1, 1,
1.60488, -2.133052, 1.33095, 0, 0, 1, 1, 1,
1.606936, 0.8062115, 0.591308, 1, 0, 0, 1, 1,
1.612844, 0.5421255, -0.3125585, 1, 0, 0, 1, 1,
1.61391, 1.002707, 2.723485, 1, 0, 0, 1, 1,
1.616296, 0.1726333, -0.8285031, 1, 0, 0, 1, 1,
1.62109, -0.06106035, 2.154025, 1, 0, 0, 1, 1,
1.633262, 1.63882, -0.482032, 0, 0, 0, 1, 1,
1.63446, -0.8138286, 2.858249, 0, 0, 0, 1, 1,
1.646318, -0.7858527, 1.405674, 0, 0, 0, 1, 1,
1.6504, -0.1461281, 0.5446027, 0, 0, 0, 1, 1,
1.672285, 0.2251189, 0.1152747, 0, 0, 0, 1, 1,
1.674377, -0.9041829, 2.500466, 0, 0, 0, 1, 1,
1.684497, -0.8608779, 2.289986, 0, 0, 0, 1, 1,
1.733755, -0.6990801, 1.381411, 1, 1, 1, 1, 1,
1.740915, 0.8126864, 1.476707, 1, 1, 1, 1, 1,
1.783322, -0.2978936, 1.057462, 1, 1, 1, 1, 1,
1.793315, 0.2980402, 2.178415, 1, 1, 1, 1, 1,
1.812033, -0.8375461, 2.065775, 1, 1, 1, 1, 1,
1.828393, -0.2707317, 2.63307, 1, 1, 1, 1, 1,
1.833453, 0.0301805, -1.025954, 1, 1, 1, 1, 1,
1.840138, 1.102823, -0.6979975, 1, 1, 1, 1, 1,
1.843091, -0.3026053, 2.445341, 1, 1, 1, 1, 1,
1.852317, -0.5523924, 0.9983209, 1, 1, 1, 1, 1,
1.883915, -1.757455, 2.820871, 1, 1, 1, 1, 1,
1.910285, -1.104059, 0.5881159, 1, 1, 1, 1, 1,
1.913181, -0.4435007, 1.492786, 1, 1, 1, 1, 1,
1.917429, 0.9048519, 1.228722, 1, 1, 1, 1, 1,
1.938065, -0.9970955, 1.035218, 1, 1, 1, 1, 1,
1.943739, -0.382397, 2.520055, 0, 0, 1, 1, 1,
1.998713, 1.386769, 0.1611816, 1, 0, 0, 1, 1,
2.016265, -0.5091713, 1.614258, 1, 0, 0, 1, 1,
2.027692, 0.7322348, 0.6868, 1, 0, 0, 1, 1,
2.123533, -0.05803528, -0.5656425, 1, 0, 0, 1, 1,
2.125242, 0.610352, 1.152231, 1, 0, 0, 1, 1,
2.139071, -0.3309382, 0.8579755, 0, 0, 0, 1, 1,
2.186039, -0.3262311, 1.527907, 0, 0, 0, 1, 1,
2.190094, -1.047999, 2.910307, 0, 0, 0, 1, 1,
2.191319, 0.3704669, 1.025053, 0, 0, 0, 1, 1,
2.244264, -0.1941384, 0.3561169, 0, 0, 0, 1, 1,
2.446212, -0.6062492, 2.121443, 0, 0, 0, 1, 1,
2.467068, 1.822932, 0.5945583, 0, 0, 0, 1, 1,
2.495351, 0.7627349, 1.82933, 1, 1, 1, 1, 1,
2.502758, 1.53769, 0.7914198, 1, 1, 1, 1, 1,
2.592949, -1.166499, 2.139457, 1, 1, 1, 1, 1,
2.75934, 0.07779758, 1.419801, 1, 1, 1, 1, 1,
2.764439, 1.765354, 1.19146, 1, 1, 1, 1, 1,
2.777349, -1.666455, 2.540457, 1, 1, 1, 1, 1,
3.44162, 0.8556578, 4.236115, 1, 1, 1, 1, 1
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
var radius = 9.480591;
var distance = 33.30017;
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
mvMatrix.translate( -0.2235084, -0.002058506, 0.05670643 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30017);
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
