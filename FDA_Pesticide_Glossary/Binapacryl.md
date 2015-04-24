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
-3.010994, 0.4229062, -1.547975, 1, 0, 0, 1,
-2.968167, -0.5534346, -0.5802684, 1, 0.007843138, 0, 1,
-2.960782, 0.009232095, -0.09828945, 1, 0.01176471, 0, 1,
-2.795836, -0.2843517, -0.3340446, 1, 0.01960784, 0, 1,
-2.541695, 0.6730266, -0.6320296, 1, 0.02352941, 0, 1,
-2.512334, -0.6101713, -1.401042, 1, 0.03137255, 0, 1,
-2.402665, -1.046064, -3.826796, 1, 0.03529412, 0, 1,
-2.372653, 1.137202, -0.8749155, 1, 0.04313726, 0, 1,
-2.365268, 0.0695845, -1.17264, 1, 0.04705882, 0, 1,
-2.303277, -0.1303146, -0.3391448, 1, 0.05490196, 0, 1,
-2.286264, -1.37424, -0.6785993, 1, 0.05882353, 0, 1,
-2.285543, 0.8798065, -0.6904319, 1, 0.06666667, 0, 1,
-2.273876, 0.8633735, 0.0924818, 1, 0.07058824, 0, 1,
-2.255527, -0.1280807, -1.992856, 1, 0.07843138, 0, 1,
-2.155921, 1.611148, -2.139077, 1, 0.08235294, 0, 1,
-2.125568, -1.520041, -2.014661, 1, 0.09019608, 0, 1,
-2.113024, 0.8140919, 0.4283041, 1, 0.09411765, 0, 1,
-2.112823, -0.01531568, -1.623804, 1, 0.1019608, 0, 1,
-2.109719, -0.1409861, -1.51613, 1, 0.1098039, 0, 1,
-2.042324, 1.018205, -1.978867, 1, 0.1137255, 0, 1,
-2.033221, 0.569113, -0.7941071, 1, 0.1215686, 0, 1,
-2.018574, -3.329357, -3.225567, 1, 0.1254902, 0, 1,
-1.994182, 1.049571, -1.044397, 1, 0.1333333, 0, 1,
-1.954794, 0.8025249, -0.734642, 1, 0.1372549, 0, 1,
-1.923379, -1.04859, -1.767442, 1, 0.145098, 0, 1,
-1.920843, -1.302077, -1.216553, 1, 0.1490196, 0, 1,
-1.90916, 3.275311, -1.286543, 1, 0.1568628, 0, 1,
-1.886591, -0.6532459, -3.02476, 1, 0.1607843, 0, 1,
-1.866314, 0.9816049, 0.8590037, 1, 0.1686275, 0, 1,
-1.8658, 0.5077989, 0.3398781, 1, 0.172549, 0, 1,
-1.810431, 0.8917557, -2.487421, 1, 0.1803922, 0, 1,
-1.808865, -0.2206809, -2.036801, 1, 0.1843137, 0, 1,
-1.793212, 0.3743012, -0.7333173, 1, 0.1921569, 0, 1,
-1.77508, 1.298245, -2.093286, 1, 0.1960784, 0, 1,
-1.761194, 0.03581592, -1.988271, 1, 0.2039216, 0, 1,
-1.746226, -0.07723038, -2.192079, 1, 0.2117647, 0, 1,
-1.713431, 0.3193958, -0.928813, 1, 0.2156863, 0, 1,
-1.677191, 0.8517222, -1.243323, 1, 0.2235294, 0, 1,
-1.662743, -0.3203433, -0.8670486, 1, 0.227451, 0, 1,
-1.651915, 1.81189, -1.885025, 1, 0.2352941, 0, 1,
-1.63324, -0.5177027, -2.280891, 1, 0.2392157, 0, 1,
-1.631935, -0.9596817, -1.28508, 1, 0.2470588, 0, 1,
-1.624382, 0.001187795, -1.766857, 1, 0.2509804, 0, 1,
-1.622676, -0.07088268, -1.046922, 1, 0.2588235, 0, 1,
-1.619666, 0.5203419, 1.032495, 1, 0.2627451, 0, 1,
-1.618007, -0.223642, -1.753829, 1, 0.2705882, 0, 1,
-1.615327, -0.6142862, -1.518873, 1, 0.2745098, 0, 1,
-1.602483, 1.685375, -1.432976, 1, 0.282353, 0, 1,
-1.600627, 0.7552385, -1.962093, 1, 0.2862745, 0, 1,
-1.579608, -0.5469514, -1.091725, 1, 0.2941177, 0, 1,
-1.565674, -0.2675235, -2.990134, 1, 0.3019608, 0, 1,
-1.555219, 0.7912573, -0.6766089, 1, 0.3058824, 0, 1,
-1.550974, -0.8175433, -0.6720679, 1, 0.3137255, 0, 1,
-1.547977, -0.641627, -1.310488, 1, 0.3176471, 0, 1,
-1.53735, 0.9675962, -1.853055, 1, 0.3254902, 0, 1,
-1.529239, 0.9043602, -2.184504, 1, 0.3294118, 0, 1,
-1.480845, -0.9206129, -1.510535, 1, 0.3372549, 0, 1,
-1.477108, 0.6383749, -0.7086869, 1, 0.3411765, 0, 1,
-1.476901, 1.862692, -1.30261, 1, 0.3490196, 0, 1,
-1.473282, -0.6456525, -2.35288, 1, 0.3529412, 0, 1,
-1.470367, 0.9402506, -0.1262564, 1, 0.3607843, 0, 1,
-1.45401, -0.4214763, -0.8739558, 1, 0.3647059, 0, 1,
-1.451409, -0.7428263, -1.738227, 1, 0.372549, 0, 1,
-1.440905, 0.02710989, -1.071375, 1, 0.3764706, 0, 1,
-1.434121, 0.1774943, -1.640155, 1, 0.3843137, 0, 1,
-1.425475, 2.150728, -0.03780806, 1, 0.3882353, 0, 1,
-1.412887, 1.558593, -0.6166508, 1, 0.3960784, 0, 1,
-1.409651, -0.02716793, -1.223465, 1, 0.4039216, 0, 1,
-1.406716, -0.2910296, -2.407892, 1, 0.4078431, 0, 1,
-1.40184, -0.2067133, -1.269926, 1, 0.4156863, 0, 1,
-1.398865, -1.510301, -0.07688583, 1, 0.4196078, 0, 1,
-1.397058, 0.3263126, -0.3113854, 1, 0.427451, 0, 1,
-1.39012, -0.1265337, -2.33747, 1, 0.4313726, 0, 1,
-1.38438, -1.400402, -3.138585, 1, 0.4392157, 0, 1,
-1.380278, 0.3065101, -0.791425, 1, 0.4431373, 0, 1,
-1.379206, -0.4497007, -1.64448, 1, 0.4509804, 0, 1,
-1.374759, 0.3777615, -1.059092, 1, 0.454902, 0, 1,
-1.37464, 1.474049, -0.4837459, 1, 0.4627451, 0, 1,
-1.372609, 0.3918529, -1.493315, 1, 0.4666667, 0, 1,
-1.368754, -0.7847264, -4.349142, 1, 0.4745098, 0, 1,
-1.368433, 0.8769541, 0.9595934, 1, 0.4784314, 0, 1,
-1.360044, 1.018409, 1.042798, 1, 0.4862745, 0, 1,
-1.35214, -0.2378708, -2.577763, 1, 0.4901961, 0, 1,
-1.343559, -1.55252, -2.198043, 1, 0.4980392, 0, 1,
-1.338725, 0.4158732, -0.5851682, 1, 0.5058824, 0, 1,
-1.328831, 0.8973151, 0.1657582, 1, 0.509804, 0, 1,
-1.325866, -0.2047213, -1.344428, 1, 0.5176471, 0, 1,
-1.319009, -0.1422428, -1.161589, 1, 0.5215687, 0, 1,
-1.315735, 0.2664609, -0.2832727, 1, 0.5294118, 0, 1,
-1.314429, -1.152883, -1.85789, 1, 0.5333334, 0, 1,
-1.31191, -0.6897073, -0.4534154, 1, 0.5411765, 0, 1,
-1.311362, 0.4131599, -2.058624, 1, 0.5450981, 0, 1,
-1.300026, 1.181815, -1.034879, 1, 0.5529412, 0, 1,
-1.297683, 0.4663279, -2.478364, 1, 0.5568628, 0, 1,
-1.295397, -0.631004, -2.742964, 1, 0.5647059, 0, 1,
-1.292494, -0.8471761, -1.825284, 1, 0.5686275, 0, 1,
-1.289855, 0.5286475, -1.355056, 1, 0.5764706, 0, 1,
-1.263159, -0.08976012, -0.7324199, 1, 0.5803922, 0, 1,
-1.261822, -2.194811, -2.88018, 1, 0.5882353, 0, 1,
-1.255386, -1.12209, -2.218705, 1, 0.5921569, 0, 1,
-1.253003, 0.4646904, -1.035504, 1, 0.6, 0, 1,
-1.252919, 1.199636, -2.236979, 1, 0.6078432, 0, 1,
-1.230872, 0.5846655, -1.827253, 1, 0.6117647, 0, 1,
-1.217693, 0.7995756, -0.1829103, 1, 0.6196079, 0, 1,
-1.211674, -2.36779, -1.301325, 1, 0.6235294, 0, 1,
-1.20614, -1.079157, -1.686038, 1, 0.6313726, 0, 1,
-1.192348, 1.316153, -0.2659347, 1, 0.6352941, 0, 1,
-1.191765, -0.6747456, -3.545928, 1, 0.6431373, 0, 1,
-1.179714, -0.3897669, -1.543236, 1, 0.6470588, 0, 1,
-1.169777, -0.09409853, -0.4599459, 1, 0.654902, 0, 1,
-1.165846, 1.104824, -1.672428, 1, 0.6588235, 0, 1,
-1.1648, 0.5595807, -0.7202529, 1, 0.6666667, 0, 1,
-1.164247, -0.2699119, -0.2214471, 1, 0.6705883, 0, 1,
-1.162729, 0.8944196, -2.654233, 1, 0.6784314, 0, 1,
-1.158395, -0.0762832, -1.666888, 1, 0.682353, 0, 1,
-1.157565, -1.147337, -2.163082, 1, 0.6901961, 0, 1,
-1.150122, -1.161109, -2.190016, 1, 0.6941177, 0, 1,
-1.146996, 0.8897328, -1.890864, 1, 0.7019608, 0, 1,
-1.14697, 0.6478014, -2.411517, 1, 0.7098039, 0, 1,
-1.145533, -0.734939, -1.963791, 1, 0.7137255, 0, 1,
-1.144109, 0.1992617, -1.771364, 1, 0.7215686, 0, 1,
-1.134768, 2.08361, 0.2821827, 1, 0.7254902, 0, 1,
-1.115973, 0.3923542, -3.15376, 1, 0.7333333, 0, 1,
-1.112429, -0.089567, -1.627962, 1, 0.7372549, 0, 1,
-1.109257, -0.2922219, -0.8163005, 1, 0.7450981, 0, 1,
-1.105965, -0.7826146, -2.700818, 1, 0.7490196, 0, 1,
-1.095751, 0.07875904, 1.400261, 1, 0.7568628, 0, 1,
-1.093621, 0.3649788, -1.567102, 1, 0.7607843, 0, 1,
-1.092854, -0.6372651, -2.811409, 1, 0.7686275, 0, 1,
-1.089779, 0.04827937, -1.581334, 1, 0.772549, 0, 1,
-1.08329, 0.3042513, -1.648269, 1, 0.7803922, 0, 1,
-1.081, -1.341219, -2.892788, 1, 0.7843137, 0, 1,
-1.078624, 2.089881, -1.222124, 1, 0.7921569, 0, 1,
-1.076629, 1.226813, -0.7680759, 1, 0.7960784, 0, 1,
-1.070739, -1.470934, -3.261171, 1, 0.8039216, 0, 1,
-1.061927, 0.7901598, -0.8340272, 1, 0.8117647, 0, 1,
-1.061918, 0.1739164, -0.9816331, 1, 0.8156863, 0, 1,
-1.059518, -1.453843, -2.401635, 1, 0.8235294, 0, 1,
-1.052453, -0.9244084, -0.8076257, 1, 0.827451, 0, 1,
-1.046023, -0.7720332, -3.647554, 1, 0.8352941, 0, 1,
-1.045969, 0.0982374, -1.735153, 1, 0.8392157, 0, 1,
-1.042619, -1.183645, -2.704037, 1, 0.8470588, 0, 1,
-1.041457, -0.8106431, -2.154202, 1, 0.8509804, 0, 1,
-1.04123, 0.05051634, -1.55804, 1, 0.8588235, 0, 1,
-1.039155, 1.514115, -0.4575602, 1, 0.8627451, 0, 1,
-1.031495, 0.1970319, -4.76245, 1, 0.8705882, 0, 1,
-1.028485, 0.717068, -1.531674, 1, 0.8745098, 0, 1,
-1.027941, -0.855149, -2.301286, 1, 0.8823529, 0, 1,
-1.021561, 1.012662, -0.7541317, 1, 0.8862745, 0, 1,
-1.020706, -0.8760841, -2.329015, 1, 0.8941177, 0, 1,
-1.012296, 1.86464, 0.5053827, 1, 0.8980392, 0, 1,
-1.00649, -0.07548512, -3.557763, 1, 0.9058824, 0, 1,
-1.006251, -0.2348081, -2.494808, 1, 0.9137255, 0, 1,
-1.005485, -0.707937, -1.934202, 1, 0.9176471, 0, 1,
-1.004335, 1.90033, -1.66742, 1, 0.9254902, 0, 1,
-1.002, -0.08204182, -2.516931, 1, 0.9294118, 0, 1,
-1.000516, 0.5240873, 0.5033693, 1, 0.9372549, 0, 1,
-0.9993235, -1.416671, -3.46705, 1, 0.9411765, 0, 1,
-0.9968565, 1.483568, -2.059078, 1, 0.9490196, 0, 1,
-0.9954609, -0.3251715, -1.977102, 1, 0.9529412, 0, 1,
-0.9902893, -0.6554326, -2.074191, 1, 0.9607843, 0, 1,
-0.9854695, -0.3646578, -3.156074, 1, 0.9647059, 0, 1,
-0.9793621, 0.1995078, -0.7897439, 1, 0.972549, 0, 1,
-0.9775345, -0.8670868, -4.367517, 1, 0.9764706, 0, 1,
-0.9698327, 0.7077492, -0.9669847, 1, 0.9843137, 0, 1,
-0.9603388, 0.4160838, -0.6456373, 1, 0.9882353, 0, 1,
-0.9600723, 0.1939635, 0.06423994, 1, 0.9960784, 0, 1,
-0.9578723, -0.2606875, -3.316099, 0.9960784, 1, 0, 1,
-0.956214, -0.385295, -2.091436, 0.9921569, 1, 0, 1,
-0.9531333, -0.27936, -1.40012, 0.9843137, 1, 0, 1,
-0.9485021, -0.1447764, -2.155795, 0.9803922, 1, 0, 1,
-0.9455316, 0.9401215, -1.596601, 0.972549, 1, 0, 1,
-0.9438378, 0.3667611, -1.140274, 0.9686275, 1, 0, 1,
-0.9423552, -0.5549636, -0.6615599, 0.9607843, 1, 0, 1,
-0.9417491, -0.09661194, -0.3781506, 0.9568627, 1, 0, 1,
-0.9370908, -0.4094657, -1.289056, 0.9490196, 1, 0, 1,
-0.9317535, 1.189756, -0.6629248, 0.945098, 1, 0, 1,
-0.9222795, -0.1186926, 0.4995328, 0.9372549, 1, 0, 1,
-0.9214426, 3.547556, -0.1439575, 0.9333333, 1, 0, 1,
-0.9144522, -0.6316211, -0.3536467, 0.9254902, 1, 0, 1,
-0.9106152, -0.1767584, -4.075908, 0.9215686, 1, 0, 1,
-0.9022438, 0.5798764, -1.559559, 0.9137255, 1, 0, 1,
-0.8966297, -0.08797386, -2.701448, 0.9098039, 1, 0, 1,
-0.8932123, -0.579356, -0.9072047, 0.9019608, 1, 0, 1,
-0.8930274, 0.004712451, -3.011766, 0.8941177, 1, 0, 1,
-0.8922638, -0.1942149, -1.942094, 0.8901961, 1, 0, 1,
-0.8861724, 0.4792243, -2.291017, 0.8823529, 1, 0, 1,
-0.8832249, -1.761603, -2.951932, 0.8784314, 1, 0, 1,
-0.8743782, 1.125621, 0.90552, 0.8705882, 1, 0, 1,
-0.8700603, -0.7347073, -3.729798, 0.8666667, 1, 0, 1,
-0.857608, -1.280406, -2.564985, 0.8588235, 1, 0, 1,
-0.8529642, -0.3505921, -3.608578, 0.854902, 1, 0, 1,
-0.8514978, 1.267964, -2.366561, 0.8470588, 1, 0, 1,
-0.8511857, 2.813111, -0.1793499, 0.8431373, 1, 0, 1,
-0.8459635, -0.1350852, -0.9529464, 0.8352941, 1, 0, 1,
-0.8453102, -1.256922, -1.812597, 0.8313726, 1, 0, 1,
-0.8448192, 0.5604681, 0.7734152, 0.8235294, 1, 0, 1,
-0.8447671, 0.5529777, -0.5867828, 0.8196079, 1, 0, 1,
-0.8445004, 0.5000458, -0.4136901, 0.8117647, 1, 0, 1,
-0.835398, -0.5358056, -2.048812, 0.8078431, 1, 0, 1,
-0.8351651, 0.3146695, -2.136527, 0.8, 1, 0, 1,
-0.8345358, -1.071351, -1.249234, 0.7921569, 1, 0, 1,
-0.830712, -0.1934697, -1.370889, 0.7882353, 1, 0, 1,
-0.8302612, -0.09130453, 0.4001336, 0.7803922, 1, 0, 1,
-0.8296343, 1.404562, -1.606964, 0.7764706, 1, 0, 1,
-0.8282446, -0.4741618, -2.822763, 0.7686275, 1, 0, 1,
-0.8259117, -0.5224646, -2.63158, 0.7647059, 1, 0, 1,
-0.8258812, -0.1547523, -2.807225, 0.7568628, 1, 0, 1,
-0.8130759, -0.6190208, -1.44779, 0.7529412, 1, 0, 1,
-0.8109071, 0.2646629, -4.002217, 0.7450981, 1, 0, 1,
-0.810722, 2.732406, 0.627381, 0.7411765, 1, 0, 1,
-0.8078441, -0.01401638, -1.579271, 0.7333333, 1, 0, 1,
-0.8058618, -0.0473909, -0.4874154, 0.7294118, 1, 0, 1,
-0.8045739, 1.004202, -1.810732, 0.7215686, 1, 0, 1,
-0.8045077, -0.8244843, -2.38153, 0.7176471, 1, 0, 1,
-0.8007184, 0.6633397, 0.5929356, 0.7098039, 1, 0, 1,
-0.7984265, -0.6427734, -2.326464, 0.7058824, 1, 0, 1,
-0.7982726, 0.9533521, -1.238547, 0.6980392, 1, 0, 1,
-0.7977259, 0.4978461, 0.5214765, 0.6901961, 1, 0, 1,
-0.7960101, -0.4862651, -1.904819, 0.6862745, 1, 0, 1,
-0.7864175, -0.350181, -1.402256, 0.6784314, 1, 0, 1,
-0.7841727, -2.352291, -3.522082, 0.6745098, 1, 0, 1,
-0.7788537, -1.163772, -3.229372, 0.6666667, 1, 0, 1,
-0.7736969, 2.431073, 0.2355331, 0.6627451, 1, 0, 1,
-0.7730263, -1.058924, -3.095714, 0.654902, 1, 0, 1,
-0.7711936, -0.5483074, -3.500582, 0.6509804, 1, 0, 1,
-0.7591943, -0.9991376, -1.042076, 0.6431373, 1, 0, 1,
-0.7448652, -2.225581, -2.679311, 0.6392157, 1, 0, 1,
-0.7434, 1.573206, -1.087871, 0.6313726, 1, 0, 1,
-0.7395778, 0.9327956, -1.462812, 0.627451, 1, 0, 1,
-0.7326024, -2.320824, -2.556709, 0.6196079, 1, 0, 1,
-0.7251074, -0.8636423, -2.309154, 0.6156863, 1, 0, 1,
-0.7226064, -0.06502979, -3.086047, 0.6078432, 1, 0, 1,
-0.7224342, 0.2663074, -1.111135, 0.6039216, 1, 0, 1,
-0.7170549, -1.003522, -1.380798, 0.5960785, 1, 0, 1,
-0.7136671, -2.621435, -1.391582, 0.5882353, 1, 0, 1,
-0.7131801, 0.362036, 0.4088629, 0.5843138, 1, 0, 1,
-0.711924, -1.413919, -4.701331, 0.5764706, 1, 0, 1,
-0.7023372, 1.087206, 0.2703386, 0.572549, 1, 0, 1,
-0.6994135, 1.534315, 0.4535584, 0.5647059, 1, 0, 1,
-0.6960915, -0.2915663, -1.942976, 0.5607843, 1, 0, 1,
-0.6952497, -0.3262254, -0.6731384, 0.5529412, 1, 0, 1,
-0.6877617, 1.516856, 0.938328, 0.5490196, 1, 0, 1,
-0.6875985, -0.7859712, -3.758077, 0.5411765, 1, 0, 1,
-0.6874036, 0.0334545, -1.527987, 0.5372549, 1, 0, 1,
-0.6857162, -0.2086312, -1.032689, 0.5294118, 1, 0, 1,
-0.6809139, 0.5920621, -1.375394, 0.5254902, 1, 0, 1,
-0.6741546, -0.8920203, -1.935405, 0.5176471, 1, 0, 1,
-0.6715719, -1.430509, -1.565742, 0.5137255, 1, 0, 1,
-0.6711363, -1.963603, -2.465957, 0.5058824, 1, 0, 1,
-0.6695074, -1.133711, -3.034519, 0.5019608, 1, 0, 1,
-0.6676997, -1.54702, -3.079934, 0.4941176, 1, 0, 1,
-0.6666179, -0.01744743, -3.165806, 0.4862745, 1, 0, 1,
-0.6642655, 0.163497, 0.4053966, 0.4823529, 1, 0, 1,
-0.661782, 0.04695078, -2.303174, 0.4745098, 1, 0, 1,
-0.6598211, 1.055353, -0.7921194, 0.4705882, 1, 0, 1,
-0.6594563, 1.374432, 0.9133455, 0.4627451, 1, 0, 1,
-0.6507015, 1.629302, -0.7310362, 0.4588235, 1, 0, 1,
-0.6470721, 0.3673933, -1.226032, 0.4509804, 1, 0, 1,
-0.6444169, -0.2311759, -2.545475, 0.4470588, 1, 0, 1,
-0.6357774, -1.043787, -1.497489, 0.4392157, 1, 0, 1,
-0.6324377, -1.430143, -3.722538, 0.4352941, 1, 0, 1,
-0.6301516, 0.02234132, -2.411907, 0.427451, 1, 0, 1,
-0.6263964, -1.921016, -4.473251, 0.4235294, 1, 0, 1,
-0.6193192, 0.3841136, -0.3164128, 0.4156863, 1, 0, 1,
-0.6111112, -0.3870167, -2.644442, 0.4117647, 1, 0, 1,
-0.608872, -0.4795837, -1.445304, 0.4039216, 1, 0, 1,
-0.6087092, -0.0657854, -3.737446, 0.3960784, 1, 0, 1,
-0.6052104, 0.468275, -0.6485298, 0.3921569, 1, 0, 1,
-0.6035033, 1.452198, -0.7702907, 0.3843137, 1, 0, 1,
-0.6028397, -0.172685, -2.812848, 0.3803922, 1, 0, 1,
-0.5953875, 0.5875486, -1.996532, 0.372549, 1, 0, 1,
-0.5947108, -0.1651112, -0.4678247, 0.3686275, 1, 0, 1,
-0.5913718, -0.1286663, 1.055733, 0.3607843, 1, 0, 1,
-0.5895523, -0.2856512, 0.4537877, 0.3568628, 1, 0, 1,
-0.5882046, -0.2106163, -0.968196, 0.3490196, 1, 0, 1,
-0.5841042, -0.2580732, -2.078676, 0.345098, 1, 0, 1,
-0.5719032, 1.337442, -0.6843488, 0.3372549, 1, 0, 1,
-0.5690969, -1.601764, -3.012449, 0.3333333, 1, 0, 1,
-0.5690497, 1.434686, 0.5617502, 0.3254902, 1, 0, 1,
-0.5671746, -1.406722, -1.666651, 0.3215686, 1, 0, 1,
-0.5649218, -2.354292, -1.894367, 0.3137255, 1, 0, 1,
-0.563361, 0.9809098, 0.5673087, 0.3098039, 1, 0, 1,
-0.5531991, 0.2523652, -2.472202, 0.3019608, 1, 0, 1,
-0.5527393, -1.065675, -1.454191, 0.2941177, 1, 0, 1,
-0.5509692, -0.05464137, -1.44155, 0.2901961, 1, 0, 1,
-0.5502796, -1.888219, 0.06962396, 0.282353, 1, 0, 1,
-0.5484517, -0.7347245, -2.340296, 0.2784314, 1, 0, 1,
-0.548069, -0.8769962, -3.435393, 0.2705882, 1, 0, 1,
-0.540898, 0.8052428, -0.3821184, 0.2666667, 1, 0, 1,
-0.5406885, -1.56852, -2.541832, 0.2588235, 1, 0, 1,
-0.5364246, 0.5453454, -0.9622146, 0.254902, 1, 0, 1,
-0.524412, -0.404371, 0.04017093, 0.2470588, 1, 0, 1,
-0.5227293, -0.4134099, -1.45658, 0.2431373, 1, 0, 1,
-0.5108317, -0.9893802, -2.75901, 0.2352941, 1, 0, 1,
-0.504673, 0.524621, -1.818679, 0.2313726, 1, 0, 1,
-0.4953388, -0.0738076, -0.7735629, 0.2235294, 1, 0, 1,
-0.4863477, -0.1485177, -1.789852, 0.2196078, 1, 0, 1,
-0.4842362, 1.115664, -0.1845611, 0.2117647, 1, 0, 1,
-0.4839912, 0.5412712, 0.2646227, 0.2078431, 1, 0, 1,
-0.4758797, -0.02738752, -2.057446, 0.2, 1, 0, 1,
-0.4747263, 0.4205455, -2.237358, 0.1921569, 1, 0, 1,
-0.4685632, -0.749775, -4.956857, 0.1882353, 1, 0, 1,
-0.4617434, -0.01452574, -2.004978, 0.1803922, 1, 0, 1,
-0.4603105, 0.8346684, 0.8191991, 0.1764706, 1, 0, 1,
-0.4510089, 0.4076881, 0.7303568, 0.1686275, 1, 0, 1,
-0.4483871, -1.482557, -2.069563, 0.1647059, 1, 0, 1,
-0.4423859, 1.367511, 0.5498787, 0.1568628, 1, 0, 1,
-0.434593, -0.3684193, -4.006932, 0.1529412, 1, 0, 1,
-0.4344949, -0.8701348, -1.817061, 0.145098, 1, 0, 1,
-0.4309983, -0.3249333, -1.797704, 0.1411765, 1, 0, 1,
-0.4301657, -1.345407, -2.757724, 0.1333333, 1, 0, 1,
-0.4289918, -0.7294284, -3.893476, 0.1294118, 1, 0, 1,
-0.4264247, -1.217752, -3.985958, 0.1215686, 1, 0, 1,
-0.42501, 0.391575, -1.394703, 0.1176471, 1, 0, 1,
-0.4169277, -1.016156, -3.158486, 0.1098039, 1, 0, 1,
-0.4147969, 0.33852, -0.4784845, 0.1058824, 1, 0, 1,
-0.4084415, -1.654333, -2.741301, 0.09803922, 1, 0, 1,
-0.4078538, 0.7312698, -1.513276, 0.09019608, 1, 0, 1,
-0.4032351, 0.06625984, -1.36338, 0.08627451, 1, 0, 1,
-0.4015561, 1.034925, -0.48376, 0.07843138, 1, 0, 1,
-0.3972897, 0.9818256, -0.6563182, 0.07450981, 1, 0, 1,
-0.3964928, -0.01712421, -0.7257063, 0.06666667, 1, 0, 1,
-0.3928381, 0.4141885, -0.6360863, 0.0627451, 1, 0, 1,
-0.3923962, 1.278764, -1.462216, 0.05490196, 1, 0, 1,
-0.3896719, -0.2545941, -0.3807496, 0.05098039, 1, 0, 1,
-0.3894605, 0.5551492, 0.5217497, 0.04313726, 1, 0, 1,
-0.3885393, -0.1533413, -0.1723978, 0.03921569, 1, 0, 1,
-0.3863114, 0.8629376, 1.385958, 0.03137255, 1, 0, 1,
-0.3835785, 0.06812831, -1.523843, 0.02745098, 1, 0, 1,
-0.3782474, 0.6359996, -1.221482, 0.01960784, 1, 0, 1,
-0.3740255, -1.327247, -2.223026, 0.01568628, 1, 0, 1,
-0.3737465, 0.5874438, -1.393219, 0.007843138, 1, 0, 1,
-0.3711613, -0.6119686, -1.688118, 0.003921569, 1, 0, 1,
-0.3686932, 0.5452383, 0.4308, 0, 1, 0.003921569, 1,
-0.3666921, 0.4452856, 1.449453, 0, 1, 0.01176471, 1,
-0.3644104, 0.8902428, -1.152961, 0, 1, 0.01568628, 1,
-0.3601216, 0.3206576, -1.206994, 0, 1, 0.02352941, 1,
-0.3560925, 0.2457151, 0.266961, 0, 1, 0.02745098, 1,
-0.354481, -0.3504289, -1.76929, 0, 1, 0.03529412, 1,
-0.3520118, -1.224261, -4.136613, 0, 1, 0.03921569, 1,
-0.3513106, 0.7528685, -2.161388, 0, 1, 0.04705882, 1,
-0.3399676, 0.1388839, -1.780848, 0, 1, 0.05098039, 1,
-0.3396971, 0.7327287, -0.9918494, 0, 1, 0.05882353, 1,
-0.3384104, -1.31769, -3.438982, 0, 1, 0.0627451, 1,
-0.3375484, -0.715323, -3.327095, 0, 1, 0.07058824, 1,
-0.3367488, 1.340864, 1.565057, 0, 1, 0.07450981, 1,
-0.3351914, -0.524262, -4.155984, 0, 1, 0.08235294, 1,
-0.3340148, -1.453897, -3.265166, 0, 1, 0.08627451, 1,
-0.3325028, 1.291706, -1.162935, 0, 1, 0.09411765, 1,
-0.330792, -0.1626357, -0.9712215, 0, 1, 0.1019608, 1,
-0.3282622, -1.818107, -2.540082, 0, 1, 0.1058824, 1,
-0.3269784, 0.4175031, -0.1069072, 0, 1, 0.1137255, 1,
-0.3232601, -0.008605351, 0.5053309, 0, 1, 0.1176471, 1,
-0.3227057, 0.6666846, -0.9715437, 0, 1, 0.1254902, 1,
-0.3225862, 0.6508962, 0.3931295, 0, 1, 0.1294118, 1,
-0.3224425, -0.2096556, -1.526005, 0, 1, 0.1372549, 1,
-0.3193261, -1.309681, -2.481657, 0, 1, 0.1411765, 1,
-0.3191841, 2.153733, 0.8621672, 0, 1, 0.1490196, 1,
-0.3185435, 0.1459206, -0.5136616, 0, 1, 0.1529412, 1,
-0.3179092, -1.71504, -2.369987, 0, 1, 0.1607843, 1,
-0.3173791, 0.3473497, -0.4397075, 0, 1, 0.1647059, 1,
-0.3170683, -0.2801725, -1.291656, 0, 1, 0.172549, 1,
-0.3170682, -1.692151, -1.800806, 0, 1, 0.1764706, 1,
-0.3164555, -0.5571408, -3.648222, 0, 1, 0.1843137, 1,
-0.3151276, -0.710628, -2.807948, 0, 1, 0.1882353, 1,
-0.3133093, 1.506275, -0.3788594, 0, 1, 0.1960784, 1,
-0.3112336, -0.4386555, -2.632952, 0, 1, 0.2039216, 1,
-0.3104111, -0.2924595, -4.627652, 0, 1, 0.2078431, 1,
-0.3074646, -0.8803958, -2.945864, 0, 1, 0.2156863, 1,
-0.3022078, -0.07196276, -2.352412, 0, 1, 0.2196078, 1,
-0.299762, 1.770785, -0.4724407, 0, 1, 0.227451, 1,
-0.2928845, -0.7574058, -3.549424, 0, 1, 0.2313726, 1,
-0.2928625, -1.501314, -1.709483, 0, 1, 0.2392157, 1,
-0.2923105, 1.808601, -0.7857904, 0, 1, 0.2431373, 1,
-0.2898442, 1.349818, 0.366561, 0, 1, 0.2509804, 1,
-0.2896745, 2.666137, 0.3239001, 0, 1, 0.254902, 1,
-0.2856829, -0.7558646, -3.312754, 0, 1, 0.2627451, 1,
-0.2774344, 0.9550157, 1.079946, 0, 1, 0.2666667, 1,
-0.2751522, -0.6975423, -3.856161, 0, 1, 0.2745098, 1,
-0.2715963, 1.170172, -1.859344, 0, 1, 0.2784314, 1,
-0.2682554, 1.066009, 0.3816831, 0, 1, 0.2862745, 1,
-0.2681068, 0.3299226, -1.622792, 0, 1, 0.2901961, 1,
-0.2675534, 0.5145621, -1.458728, 0, 1, 0.2980392, 1,
-0.2669362, -0.4242765, -3.85934, 0, 1, 0.3058824, 1,
-0.2625265, 0.7827251, 0.6528332, 0, 1, 0.3098039, 1,
-0.2602727, 0.3576383, -0.02004196, 0, 1, 0.3176471, 1,
-0.2596401, -1.672463, -4.088491, 0, 1, 0.3215686, 1,
-0.2585497, 0.9540405, -2.247624, 0, 1, 0.3294118, 1,
-0.2569695, 0.6648577, 1.898374, 0, 1, 0.3333333, 1,
-0.2553616, 0.7120044, -1.754548, 0, 1, 0.3411765, 1,
-0.254945, -0.9903343, -4.347077, 0, 1, 0.345098, 1,
-0.2516343, -1.184606, -3.354634, 0, 1, 0.3529412, 1,
-0.2513925, -0.5688929, -1.993363, 0, 1, 0.3568628, 1,
-0.2472629, -0.4239371, -2.073586, 0, 1, 0.3647059, 1,
-0.2471253, 0.6938396, -0.5297827, 0, 1, 0.3686275, 1,
-0.2466135, 0.0009294103, -1.207689, 0, 1, 0.3764706, 1,
-0.245598, 0.9271317, -2.404371, 0, 1, 0.3803922, 1,
-0.2448002, -0.4077232, -3.107726, 0, 1, 0.3882353, 1,
-0.2340552, -0.2815173, -2.215197, 0, 1, 0.3921569, 1,
-0.2322325, -0.8119777, -3.48353, 0, 1, 0.4, 1,
-0.2321109, -0.5034432, -1.290719, 0, 1, 0.4078431, 1,
-0.2289259, -0.284084, -1.08287, 0, 1, 0.4117647, 1,
-0.2231168, -0.3451323, -4.274876, 0, 1, 0.4196078, 1,
-0.2139663, -0.06310959, -2.607455, 0, 1, 0.4235294, 1,
-0.2128522, -1.159961, -1.659803, 0, 1, 0.4313726, 1,
-0.2083831, -0.6344324, -3.496461, 0, 1, 0.4352941, 1,
-0.2079743, -0.2092585, -2.126216, 0, 1, 0.4431373, 1,
-0.2077748, -0.104587, -1.95225, 0, 1, 0.4470588, 1,
-0.2050454, -2.419999, -3.486657, 0, 1, 0.454902, 1,
-0.2041585, -0.937735, -1.911167, 0, 1, 0.4588235, 1,
-0.204158, -0.4841052, -2.360627, 0, 1, 0.4666667, 1,
-0.1990045, 0.2877052, -0.1196219, 0, 1, 0.4705882, 1,
-0.1948117, -0.5751367, -4.420028, 0, 1, 0.4784314, 1,
-0.1932687, 1.413053, -0.6644367, 0, 1, 0.4823529, 1,
-0.1869871, -0.3986712, -3.576973, 0, 1, 0.4901961, 1,
-0.1832388, -0.8211808, -3.955075, 0, 1, 0.4941176, 1,
-0.1824082, 0.3140715, 1.360767, 0, 1, 0.5019608, 1,
-0.176585, 1.647147, -2.193199, 0, 1, 0.509804, 1,
-0.1738524, 0.375516, -1.255502, 0, 1, 0.5137255, 1,
-0.173339, -0.7668756, -2.167462, 0, 1, 0.5215687, 1,
-0.172491, 0.03729085, -0.6041523, 0, 1, 0.5254902, 1,
-0.1711595, -0.1436504, -1.662509, 0, 1, 0.5333334, 1,
-0.1707358, -0.6881511, -2.553834, 0, 1, 0.5372549, 1,
-0.1704982, 1.398234, 1.16141, 0, 1, 0.5450981, 1,
-0.1658638, 0.2979729, -0.3634955, 0, 1, 0.5490196, 1,
-0.1644964, 0.518073, -0.9639885, 0, 1, 0.5568628, 1,
-0.1613145, 0.2950024, -1.552042, 0, 1, 0.5607843, 1,
-0.1547519, 0.3844087, -1.698681, 0, 1, 0.5686275, 1,
-0.1534099, 0.31996, -0.2233085, 0, 1, 0.572549, 1,
-0.1476463, -0.1098287, -2.064611, 0, 1, 0.5803922, 1,
-0.1469397, 0.1048231, -0.4604258, 0, 1, 0.5843138, 1,
-0.1463568, 0.05152837, -0.5488458, 0, 1, 0.5921569, 1,
-0.1462393, 0.7228006, 0.5094819, 0, 1, 0.5960785, 1,
-0.1446416, 1.160747, -0.6374544, 0, 1, 0.6039216, 1,
-0.1439558, -0.7015488, -0.8309794, 0, 1, 0.6117647, 1,
-0.1435542, 0.4500876, 0.7238029, 0, 1, 0.6156863, 1,
-0.1427876, -1.162158, -1.886075, 0, 1, 0.6235294, 1,
-0.1393494, -1.028465, -3.223575, 0, 1, 0.627451, 1,
-0.1382417, 0.6102998, -0.09086679, 0, 1, 0.6352941, 1,
-0.1322446, 0.4855725, -1.149192, 0, 1, 0.6392157, 1,
-0.1309756, 0.3040324, -1.293787, 0, 1, 0.6470588, 1,
-0.1287182, -0.3361591, -3.927592, 0, 1, 0.6509804, 1,
-0.1270551, 0.4948792, 0.08113626, 0, 1, 0.6588235, 1,
-0.1260498, -1.712367, -3.940181, 0, 1, 0.6627451, 1,
-0.1256225, -1.494809, -2.103092, 0, 1, 0.6705883, 1,
-0.1247199, -0.9271979, -2.035413, 0, 1, 0.6745098, 1,
-0.1246115, 0.1969676, -1.663207, 0, 1, 0.682353, 1,
-0.1244751, -2.30427, -4.811907, 0, 1, 0.6862745, 1,
-0.1224376, 0.2853324, 0.7728945, 0, 1, 0.6941177, 1,
-0.1198919, 0.2323778, -0.329257, 0, 1, 0.7019608, 1,
-0.1158442, -0.2738076, -1.117453, 0, 1, 0.7058824, 1,
-0.1142813, -0.715163, -2.441103, 0, 1, 0.7137255, 1,
-0.1126008, 0.5588097, -0.6572957, 0, 1, 0.7176471, 1,
-0.09935754, 0.5879725, -1.759519, 0, 1, 0.7254902, 1,
-0.09676702, 0.4549153, -0.04744325, 0, 1, 0.7294118, 1,
-0.09496453, -0.5223523, -4.169029, 0, 1, 0.7372549, 1,
-0.08889335, 1.083098, -1.685407, 0, 1, 0.7411765, 1,
-0.08770104, -0.4825591, -3.968199, 0, 1, 0.7490196, 1,
-0.08479033, 1.38338, 0.9940209, 0, 1, 0.7529412, 1,
-0.08247551, -1.463004, -4.045073, 0, 1, 0.7607843, 1,
-0.08027805, 0.3661278, 1.606206, 0, 1, 0.7647059, 1,
-0.07335231, -0.1928599, -4.49552, 0, 1, 0.772549, 1,
-0.0684405, 1.309999, -0.1844751, 0, 1, 0.7764706, 1,
-0.0677411, -0.4838485, -3.150878, 0, 1, 0.7843137, 1,
-0.06704023, -0.7601978, -3.373887, 0, 1, 0.7882353, 1,
-0.06521653, -1.494803, -2.579614, 0, 1, 0.7960784, 1,
-0.06513745, 1.356763, -1.76488, 0, 1, 0.8039216, 1,
-0.05995568, -0.9892774, -2.80608, 0, 1, 0.8078431, 1,
-0.05994258, -1.371074, -3.155017, 0, 1, 0.8156863, 1,
-0.0573598, -1.356226, -4.238077, 0, 1, 0.8196079, 1,
-0.05695628, 2.770059, 1.515084, 0, 1, 0.827451, 1,
-0.0568333, 0.2079361, -0.3895621, 0, 1, 0.8313726, 1,
-0.05604737, 0.1559252, -1.35023, 0, 1, 0.8392157, 1,
-0.05601467, -0.4874803, -2.834878, 0, 1, 0.8431373, 1,
-0.05213767, -0.4880166, -2.750876, 0, 1, 0.8509804, 1,
-0.04888831, -0.3067437, -4.153187, 0, 1, 0.854902, 1,
-0.04731198, 0.8260117, -2.595215, 0, 1, 0.8627451, 1,
-0.04689606, 1.676029, -1.45318, 0, 1, 0.8666667, 1,
-0.04655415, -0.007251788, -2.124027, 0, 1, 0.8745098, 1,
-0.04540327, 0.9804302, 0.8594174, 0, 1, 0.8784314, 1,
-0.04346432, -1.217866, -4.196985, 0, 1, 0.8862745, 1,
-0.04079011, 0.8387398, -0.8088487, 0, 1, 0.8901961, 1,
-0.03869089, -1.064892, -4.066397, 0, 1, 0.8980392, 1,
-0.03853509, -0.59551, -4.044476, 0, 1, 0.9058824, 1,
-0.0325208, 1.868473, -0.7613958, 0, 1, 0.9098039, 1,
-0.03073021, 0.07352928, 0.1761808, 0, 1, 0.9176471, 1,
-0.02871934, 0.1624809, -1.438446, 0, 1, 0.9215686, 1,
-0.02713515, -1.014403, -4.463066, 0, 1, 0.9294118, 1,
-0.02706992, 0.7360354, 0.8950109, 0, 1, 0.9333333, 1,
-0.02585019, 0.3659494, -1.157474, 0, 1, 0.9411765, 1,
-0.0254461, 0.52632, 1.832662, 0, 1, 0.945098, 1,
-0.02449152, 0.9068801, -0.3366818, 0, 1, 0.9529412, 1,
-0.02187891, -0.504934, -2.093254, 0, 1, 0.9568627, 1,
-0.01937255, -0.6014428, -3.272038, 0, 1, 0.9647059, 1,
-0.01894828, -1.681951, -3.316283, 0, 1, 0.9686275, 1,
-0.01798471, -0.2696468, -3.93962, 0, 1, 0.9764706, 1,
-0.01711197, 0.8141363, -0.833611, 0, 1, 0.9803922, 1,
-0.0162678, -0.4106152, -3.305202, 0, 1, 0.9882353, 1,
-0.00941696, 0.2367577, -2.184942, 0, 1, 0.9921569, 1,
-0.008206772, -0.121122, -1.217708, 0, 1, 1, 1,
-0.005848528, 1.275827, 0.215821, 0, 0.9921569, 1, 1,
-0.002434483, 1.1714, 1.020129, 0, 0.9882353, 1, 1,
0.000719471, 1.098583, 0.7084052, 0, 0.9803922, 1, 1,
0.001018016, 0.4203258, -0.7571818, 0, 0.9764706, 1, 1,
0.003015317, 1.149252, 1.258555, 0, 0.9686275, 1, 1,
0.006516773, -1.4288, 2.594232, 0, 0.9647059, 1, 1,
0.01214282, 0.5571057, 0.3317758, 0, 0.9568627, 1, 1,
0.01604176, -0.1800182, 3.87222, 0, 0.9529412, 1, 1,
0.01750386, 0.08353762, 0.2539259, 0, 0.945098, 1, 1,
0.02105817, 1.540244, 0.9128612, 0, 0.9411765, 1, 1,
0.02142987, -0.2947307, 2.531659, 0, 0.9333333, 1, 1,
0.02279007, 0.8382128, 0.3226687, 0, 0.9294118, 1, 1,
0.02749553, 1.089502, -0.551734, 0, 0.9215686, 1, 1,
0.02837988, -0.7038757, 5.750876, 0, 0.9176471, 1, 1,
0.02847019, -0.9671488, 2.631537, 0, 0.9098039, 1, 1,
0.02991907, 1.026906, 1.290083, 0, 0.9058824, 1, 1,
0.03038895, -1.244434, 2.222736, 0, 0.8980392, 1, 1,
0.03105765, 0.4722464, -0.5947067, 0, 0.8901961, 1, 1,
0.03169363, -1.071262, 2.63888, 0, 0.8862745, 1, 1,
0.04259839, 0.3139977, 0.7210698, 0, 0.8784314, 1, 1,
0.0464489, 1.824202, 0.9912621, 0, 0.8745098, 1, 1,
0.04998863, 0.687282, -0.5862334, 0, 0.8666667, 1, 1,
0.05443255, 0.7812054, -1.326945, 0, 0.8627451, 1, 1,
0.0606631, 0.2461514, 1.080115, 0, 0.854902, 1, 1,
0.06120683, -0.987662, 2.448869, 0, 0.8509804, 1, 1,
0.06831178, 0.8119203, 0.6076687, 0, 0.8431373, 1, 1,
0.06871375, 0.6201788, 0.01320365, 0, 0.8392157, 1, 1,
0.06977597, -0.265585, 2.500591, 0, 0.8313726, 1, 1,
0.07375847, -0.5721952, 3.767364, 0, 0.827451, 1, 1,
0.07806469, 0.01961593, -0.4591304, 0, 0.8196079, 1, 1,
0.0800743, -1.833688, 3.138718, 0, 0.8156863, 1, 1,
0.08166397, 0.2193983, 0.5257254, 0, 0.8078431, 1, 1,
0.08382478, 0.4588512, 0.5066143, 0, 0.8039216, 1, 1,
0.08540063, -0.8733885, 4.085079, 0, 0.7960784, 1, 1,
0.08781787, -0.5244082, 2.707027, 0, 0.7882353, 1, 1,
0.08796705, -1.855665, 2.541368, 0, 0.7843137, 1, 1,
0.09003178, 0.7179173, -1.428553, 0, 0.7764706, 1, 1,
0.09336846, 0.45657, 1.894319, 0, 0.772549, 1, 1,
0.09515756, -0.76157, 1.808298, 0, 0.7647059, 1, 1,
0.09707084, 1.760397, 1.047317, 0, 0.7607843, 1, 1,
0.1001683, -1.200536, 0.5056928, 0, 0.7529412, 1, 1,
0.10096, -0.1271467, 2.206009, 0, 0.7490196, 1, 1,
0.108481, 0.8187748, -0.2214718, 0, 0.7411765, 1, 1,
0.1095972, -0.0630191, 3.796111, 0, 0.7372549, 1, 1,
0.1103201, 0.7462348, -1.900454, 0, 0.7294118, 1, 1,
0.1154284, -1.955892, 3.19175, 0, 0.7254902, 1, 1,
0.1161992, -1.247748, 2.60767, 0, 0.7176471, 1, 1,
0.1188411, 5.321829, 1.114231, 0, 0.7137255, 1, 1,
0.127434, 0.7200141, -1.084978, 0, 0.7058824, 1, 1,
0.1285904, 0.3856898, -0.262552, 0, 0.6980392, 1, 1,
0.1312975, -0.3924987, 2.050589, 0, 0.6941177, 1, 1,
0.1324786, 0.8708627, 0.5955157, 0, 0.6862745, 1, 1,
0.1327157, 0.8432537, -0.1695547, 0, 0.682353, 1, 1,
0.1353306, -0.05394157, 2.249864, 0, 0.6745098, 1, 1,
0.1379721, 0.1909006, 0.9553878, 0, 0.6705883, 1, 1,
0.138751, 0.4635865, -0.05842239, 0, 0.6627451, 1, 1,
0.1401052, -0.5816799, 3.024784, 0, 0.6588235, 1, 1,
0.1414121, -0.7906566, 1.25705, 0, 0.6509804, 1, 1,
0.1441925, 1.296161, -1.249499, 0, 0.6470588, 1, 1,
0.146374, 0.2880751, 0.56356, 0, 0.6392157, 1, 1,
0.1513189, 1.509893, 0.5579484, 0, 0.6352941, 1, 1,
0.1516173, -0.08018051, 2.727376, 0, 0.627451, 1, 1,
0.1562628, -0.3596504, 2.202256, 0, 0.6235294, 1, 1,
0.1589782, 0.3144016, 0.6492394, 0, 0.6156863, 1, 1,
0.1624053, -0.06936425, 3.254125, 0, 0.6117647, 1, 1,
0.1651477, 0.3734075, -0.09014994, 0, 0.6039216, 1, 1,
0.1680703, 0.4580444, 1.115311, 0, 0.5960785, 1, 1,
0.172657, 0.2012171, 0.4939665, 0, 0.5921569, 1, 1,
0.1778817, -1.325437, 2.714596, 0, 0.5843138, 1, 1,
0.1804361, -0.6362012, 1.898285, 0, 0.5803922, 1, 1,
0.1814476, -1.298952, 2.102374, 0, 0.572549, 1, 1,
0.1816663, 1.100278, 1.293707, 0, 0.5686275, 1, 1,
0.1817518, -0.7614472, 4.559557, 0, 0.5607843, 1, 1,
0.1855406, -0.9646907, 3.474305, 0, 0.5568628, 1, 1,
0.1889059, -0.3246263, 2.248249, 0, 0.5490196, 1, 1,
0.1940466, 1.516772, 1.895591, 0, 0.5450981, 1, 1,
0.1999302, 2.020375, 1.805944, 0, 0.5372549, 1, 1,
0.2032458, 0.9086041, -0.2803048, 0, 0.5333334, 1, 1,
0.2067022, -1.439889, 4.259477, 0, 0.5254902, 1, 1,
0.209763, -1.145106, 2.410863, 0, 0.5215687, 1, 1,
0.2102544, -1.100905, 4.005116, 0, 0.5137255, 1, 1,
0.211392, 0.6229616, -0.7635922, 0, 0.509804, 1, 1,
0.2116559, 0.4493538, 0.4234968, 0, 0.5019608, 1, 1,
0.2125184, 0.5010383, 1.067973, 0, 0.4941176, 1, 1,
0.2135363, -0.6174101, 1.945839, 0, 0.4901961, 1, 1,
0.2166614, -1.610615, 2.066813, 0, 0.4823529, 1, 1,
0.2194713, -2.407724, 4.093149, 0, 0.4784314, 1, 1,
0.2199394, -0.9498386, 3.547004, 0, 0.4705882, 1, 1,
0.221043, 0.871331, -1.792158, 0, 0.4666667, 1, 1,
0.2217915, -0.12074, 1.777026, 0, 0.4588235, 1, 1,
0.2241545, 0.04884293, 0.01222795, 0, 0.454902, 1, 1,
0.2262149, -0.2522152, 1.220801, 0, 0.4470588, 1, 1,
0.2295823, 0.08401293, 2.407694, 0, 0.4431373, 1, 1,
0.2296973, 0.3112442, -0.3553586, 0, 0.4352941, 1, 1,
0.2301822, 1.011574, -0.2891923, 0, 0.4313726, 1, 1,
0.230255, -1.401986, 2.125005, 0, 0.4235294, 1, 1,
0.2313871, 0.1653496, 1.294271, 0, 0.4196078, 1, 1,
0.2354294, 1.080934, -0.2674253, 0, 0.4117647, 1, 1,
0.2369994, -0.4022979, 2.793311, 0, 0.4078431, 1, 1,
0.238053, 1.144291, 0.808041, 0, 0.4, 1, 1,
0.2397755, 0.4761083, -1.555017, 0, 0.3921569, 1, 1,
0.2455824, -2.459361, 3.229936, 0, 0.3882353, 1, 1,
0.2463524, -1.769733, 1.830781, 0, 0.3803922, 1, 1,
0.2535675, -0.3384592, 2.615436, 0, 0.3764706, 1, 1,
0.2537612, -1.817458, 2.723506, 0, 0.3686275, 1, 1,
0.2585798, -1.382958, 2.000548, 0, 0.3647059, 1, 1,
0.2645466, -0.9699892, 3.259418, 0, 0.3568628, 1, 1,
0.2683623, -0.4177229, 2.088098, 0, 0.3529412, 1, 1,
0.2698941, 0.2770736, 0.4965803, 0, 0.345098, 1, 1,
0.2699707, 0.7710715, -0.3432013, 0, 0.3411765, 1, 1,
0.2704979, -0.01252188, 2.422715, 0, 0.3333333, 1, 1,
0.2710779, -0.05942729, 0.4949018, 0, 0.3294118, 1, 1,
0.2793124, 0.5790387, 1.297068, 0, 0.3215686, 1, 1,
0.2913157, -0.7242062, 4.21899, 0, 0.3176471, 1, 1,
0.3002633, -0.5543861, 2.236626, 0, 0.3098039, 1, 1,
0.3059943, -0.2373733, 1.964916, 0, 0.3058824, 1, 1,
0.3083234, -0.3464472, 2.484519, 0, 0.2980392, 1, 1,
0.3097654, -0.1343402, 4.216823, 0, 0.2901961, 1, 1,
0.3098166, -1.728935, 1.415444, 0, 0.2862745, 1, 1,
0.3126075, 1.406843, 0.7220984, 0, 0.2784314, 1, 1,
0.3189367, -0.7311224, 3.92088, 0, 0.2745098, 1, 1,
0.3196346, -1.42514, 3.494767, 0, 0.2666667, 1, 1,
0.3276531, -0.7570443, 2.617598, 0, 0.2627451, 1, 1,
0.3300926, -1.095308, 2.787161, 0, 0.254902, 1, 1,
0.3366601, -0.6820005, 3.980506, 0, 0.2509804, 1, 1,
0.3383303, 0.7151135, 1.062796, 0, 0.2431373, 1, 1,
0.3400898, -3.080729, 4.183276, 0, 0.2392157, 1, 1,
0.3403856, 0.2343239, 1.380371, 0, 0.2313726, 1, 1,
0.343088, 0.7652918, 0.9521866, 0, 0.227451, 1, 1,
0.3440564, -0.5152885, 0.9198244, 0, 0.2196078, 1, 1,
0.3480256, -1.885614, 1.261245, 0, 0.2156863, 1, 1,
0.3503365, 0.1281965, 2.263034, 0, 0.2078431, 1, 1,
0.351054, -1.320409, 2.125325, 0, 0.2039216, 1, 1,
0.3571059, -0.5457492, 3.122682, 0, 0.1960784, 1, 1,
0.3578999, -0.6973021, 2.846361, 0, 0.1882353, 1, 1,
0.3715301, 0.9508864, 0.7613457, 0, 0.1843137, 1, 1,
0.3730336, 0.5923759, 0.8011208, 0, 0.1764706, 1, 1,
0.3764057, -1.103639, 3.902003, 0, 0.172549, 1, 1,
0.3804642, 0.7409825, 0.1991758, 0, 0.1647059, 1, 1,
0.3845277, 1.73344, 1.426029, 0, 0.1607843, 1, 1,
0.3846067, 1.504455, -0.03437717, 0, 0.1529412, 1, 1,
0.3907052, 0.08173928, 0.6629148, 0, 0.1490196, 1, 1,
0.3925308, 0.5173488, 0.2570769, 0, 0.1411765, 1, 1,
0.3950032, 0.1856101, 1.548772, 0, 0.1372549, 1, 1,
0.4034928, 0.2774157, 0.9049497, 0, 0.1294118, 1, 1,
0.4048966, 0.4158104, 1.21822, 0, 0.1254902, 1, 1,
0.4108939, 1.496373, 1.752946, 0, 0.1176471, 1, 1,
0.4110486, 0.2163741, 1.661281, 0, 0.1137255, 1, 1,
0.4193621, 1.767387, -0.04630074, 0, 0.1058824, 1, 1,
0.419803, 0.4051682, 1.097753, 0, 0.09803922, 1, 1,
0.4218043, -0.01686995, 1.691027, 0, 0.09411765, 1, 1,
0.4249743, 1.923061, 0.6212258, 0, 0.08627451, 1, 1,
0.4315775, 0.3828776, 0.7371495, 0, 0.08235294, 1, 1,
0.4335799, 0.1203728, 1.598669, 0, 0.07450981, 1, 1,
0.4344636, -1.332508, 0.6831605, 0, 0.07058824, 1, 1,
0.4347108, 1.050437, 1.148027, 0, 0.0627451, 1, 1,
0.4473784, 0.8933423, 0.9212371, 0, 0.05882353, 1, 1,
0.4493418, -2.454066, 2.847679, 0, 0.05098039, 1, 1,
0.4555184, -0.8140658, 2.752486, 0, 0.04705882, 1, 1,
0.459785, -0.3835577, 1.41026, 0, 0.03921569, 1, 1,
0.4600481, -0.9265333, 3.442104, 0, 0.03529412, 1, 1,
0.4623524, -1.19327, 2.442847, 0, 0.02745098, 1, 1,
0.4631183, -0.1652142, 1.283436, 0, 0.02352941, 1, 1,
0.464889, -1.39044, 3.106704, 0, 0.01568628, 1, 1,
0.4651497, -0.3121108, 3.281605, 0, 0.01176471, 1, 1,
0.4657471, -0.08943982, 0.8710635, 0, 0.003921569, 1, 1,
0.4725419, 0.1770717, 1.218253, 0.003921569, 0, 1, 1,
0.4738108, -0.6088084, 2.815427, 0.007843138, 0, 1, 1,
0.474254, -1.422784, 3.384938, 0.01568628, 0, 1, 1,
0.4768245, 1.474402, 0.8109915, 0.01960784, 0, 1, 1,
0.4775731, 0.3203298, 0.6671677, 0.02745098, 0, 1, 1,
0.477656, 1.15337, -1.200908, 0.03137255, 0, 1, 1,
0.4816519, 0.9268335, 0.1636943, 0.03921569, 0, 1, 1,
0.4836856, 0.4426669, 0.5951698, 0.04313726, 0, 1, 1,
0.4843964, -1.384381, 1.610927, 0.05098039, 0, 1, 1,
0.4844291, 1.569465, -0.3424971, 0.05490196, 0, 1, 1,
0.4852721, 0.1913602, 0.2395426, 0.0627451, 0, 1, 1,
0.4903603, -0.4127905, 3.832165, 0.06666667, 0, 1, 1,
0.5036042, 1.354348, -0.1957365, 0.07450981, 0, 1, 1,
0.5053031, -2.038729, 1.286363, 0.07843138, 0, 1, 1,
0.5053898, -0.03200161, 2.289328, 0.08627451, 0, 1, 1,
0.5074958, 0.306058, 2.017618, 0.09019608, 0, 1, 1,
0.5082036, 0.1772235, -0.1881407, 0.09803922, 0, 1, 1,
0.5083706, 1.572244, 1.064418, 0.1058824, 0, 1, 1,
0.5112236, -2.020404, 3.016366, 0.1098039, 0, 1, 1,
0.5160575, -0.9575328, 1.821803, 0.1176471, 0, 1, 1,
0.5201478, 0.7068572, -0.9911759, 0.1215686, 0, 1, 1,
0.5201973, -0.8981652, 1.634018, 0.1294118, 0, 1, 1,
0.5267323, -0.9375994, 5.015731, 0.1333333, 0, 1, 1,
0.5297827, 0.0303371, 0.3247519, 0.1411765, 0, 1, 1,
0.5334619, -1.011936, 3.086441, 0.145098, 0, 1, 1,
0.5348668, -0.2191375, 1.542091, 0.1529412, 0, 1, 1,
0.5364717, 1.594373, 1.993775, 0.1568628, 0, 1, 1,
0.536771, 0.5108792, 0.8230366, 0.1647059, 0, 1, 1,
0.5387611, 0.06531801, 3.648355, 0.1686275, 0, 1, 1,
0.5390564, -0.2644607, 1.571043, 0.1764706, 0, 1, 1,
0.5400912, 0.5296947, -0.2495183, 0.1803922, 0, 1, 1,
0.5403191, 1.511804, -0.3532785, 0.1882353, 0, 1, 1,
0.5415352, -1.012027, 2.294084, 0.1921569, 0, 1, 1,
0.5435785, -0.4319262, 2.487524, 0.2, 0, 1, 1,
0.5442205, 0.5310637, 1.656517, 0.2078431, 0, 1, 1,
0.5485908, 0.5060008, 0.1568325, 0.2117647, 0, 1, 1,
0.552319, 1.328459, 0.3622534, 0.2196078, 0, 1, 1,
0.5560161, -2.088093, 3.326738, 0.2235294, 0, 1, 1,
0.5612519, 0.3220961, 2.162003, 0.2313726, 0, 1, 1,
0.5639321, -0.5941771, 1.357971, 0.2352941, 0, 1, 1,
0.5720381, -1.826774, 2.926301, 0.2431373, 0, 1, 1,
0.5735385, 0.3230703, 1.616201, 0.2470588, 0, 1, 1,
0.574084, 1.169132, 1.701356, 0.254902, 0, 1, 1,
0.5742498, -0.6663461, 3.36866, 0.2588235, 0, 1, 1,
0.5763034, 0.1731246, 1.404576, 0.2666667, 0, 1, 1,
0.57755, -0.1037961, 1.757825, 0.2705882, 0, 1, 1,
0.5842239, 0.09232284, -0.7801274, 0.2784314, 0, 1, 1,
0.585366, -0.09988485, 1.277306, 0.282353, 0, 1, 1,
0.5871524, 0.5904472, 0.9296907, 0.2901961, 0, 1, 1,
0.5878744, -0.9641168, 1.438342, 0.2941177, 0, 1, 1,
0.5924788, 1.532766, -0.2793632, 0.3019608, 0, 1, 1,
0.597567, -0.9245532, 0.6752306, 0.3098039, 0, 1, 1,
0.6038078, -1.54324, 2.226721, 0.3137255, 0, 1, 1,
0.6096148, -0.2825702, 4.565392, 0.3215686, 0, 1, 1,
0.6123626, 0.8859025, 0.4509055, 0.3254902, 0, 1, 1,
0.6136621, 0.7564867, 0.3537229, 0.3333333, 0, 1, 1,
0.6145936, -0.4631515, 2.206983, 0.3372549, 0, 1, 1,
0.6150962, -0.4636464, 0.5241483, 0.345098, 0, 1, 1,
0.6167527, 1.902856, 0.4232091, 0.3490196, 0, 1, 1,
0.6197735, 0.2353556, 0.2876223, 0.3568628, 0, 1, 1,
0.6206672, -1.196946, 3.788337, 0.3607843, 0, 1, 1,
0.62143, 0.01933628, 1.058273, 0.3686275, 0, 1, 1,
0.6271316, -0.1310839, 2.165532, 0.372549, 0, 1, 1,
0.6280767, 2.02783, 1.669201, 0.3803922, 0, 1, 1,
0.6342933, 1.416283, -0.03303915, 0.3843137, 0, 1, 1,
0.6356621, 0.177002, 0.7538775, 0.3921569, 0, 1, 1,
0.6357402, 1.228722, -0.7824239, 0.3960784, 0, 1, 1,
0.6451904, -2.050104, 2.747251, 0.4039216, 0, 1, 1,
0.6468453, -0.3849015, 2.680794, 0.4117647, 0, 1, 1,
0.6482036, -0.4255533, 3.554394, 0.4156863, 0, 1, 1,
0.649273, -0.8061046, 2.681219, 0.4235294, 0, 1, 1,
0.656184, 1.11238, -0.002592145, 0.427451, 0, 1, 1,
0.6595766, 1.293902, 0.4676911, 0.4352941, 0, 1, 1,
0.6664801, 0.5299557, 1.194558, 0.4392157, 0, 1, 1,
0.6718811, 0.6696852, 1.704224, 0.4470588, 0, 1, 1,
0.6969391, -0.1785112, 2.382965, 0.4509804, 0, 1, 1,
0.697699, -3.122683, 3.48771, 0.4588235, 0, 1, 1,
0.7017698, 0.8792533, -0.2931589, 0.4627451, 0, 1, 1,
0.70604, -0.4600896, 2.168455, 0.4705882, 0, 1, 1,
0.7072369, -2.032902, 3.367224, 0.4745098, 0, 1, 1,
0.7091884, -0.6569502, 2.473834, 0.4823529, 0, 1, 1,
0.7100952, 0.1104343, 0.818431, 0.4862745, 0, 1, 1,
0.710906, -1.692826, 4.040521, 0.4941176, 0, 1, 1,
0.7118665, -0.1869689, 2.169368, 0.5019608, 0, 1, 1,
0.7220677, -0.1387829, 1.504257, 0.5058824, 0, 1, 1,
0.7247299, 0.04876389, 1.424164, 0.5137255, 0, 1, 1,
0.7326623, 0.7801184, 1.428884, 0.5176471, 0, 1, 1,
0.7328764, -0.5357077, 3.343025, 0.5254902, 0, 1, 1,
0.7334564, 0.1912641, 1.431355, 0.5294118, 0, 1, 1,
0.7335922, 0.2181717, 3.146069, 0.5372549, 0, 1, 1,
0.7397701, -0.4580183, 2.274654, 0.5411765, 0, 1, 1,
0.7413679, -0.5333337, 1.717013, 0.5490196, 0, 1, 1,
0.7439435, -0.6208683, 1.409961, 0.5529412, 0, 1, 1,
0.7443704, -1.771704, 1.042807, 0.5607843, 0, 1, 1,
0.7449213, 0.8333854, 1.766608, 0.5647059, 0, 1, 1,
0.7472833, -0.8580667, 3.531491, 0.572549, 0, 1, 1,
0.7549633, 0.9543362, 1.09097, 0.5764706, 0, 1, 1,
0.7574264, -0.004574588, -0.09538434, 0.5843138, 0, 1, 1,
0.7668514, -0.7119185, 1.246474, 0.5882353, 0, 1, 1,
0.7770111, -0.07314125, 2.91934, 0.5960785, 0, 1, 1,
0.7855028, 0.9044563, -0.03261017, 0.6039216, 0, 1, 1,
0.7977476, 3.329672, 1.149546, 0.6078432, 0, 1, 1,
0.8018577, 0.8511224, 0.1282053, 0.6156863, 0, 1, 1,
0.8022867, 0.8264169, -1.195903, 0.6196079, 0, 1, 1,
0.8037345, -0.9113985, 1.134467, 0.627451, 0, 1, 1,
0.8083018, 1.729661, 1.173077, 0.6313726, 0, 1, 1,
0.8112414, -1.192626, 1.988017, 0.6392157, 0, 1, 1,
0.8131446, -1.251756, 0.5098768, 0.6431373, 0, 1, 1,
0.8183857, 0.3939386, 0.5975128, 0.6509804, 0, 1, 1,
0.8189048, 0.5412232, 0.66959, 0.654902, 0, 1, 1,
0.8289105, -0.0302923, 2.348499, 0.6627451, 0, 1, 1,
0.829419, 0.9589765, 2.855273, 0.6666667, 0, 1, 1,
0.8322253, -0.4067946, 0.9138716, 0.6745098, 0, 1, 1,
0.8324805, -1.807444, 2.443415, 0.6784314, 0, 1, 1,
0.8398623, -1.50386, 3.978126, 0.6862745, 0, 1, 1,
0.8413412, 1.780393, 1.184855, 0.6901961, 0, 1, 1,
0.8497939, -0.3171237, 1.646194, 0.6980392, 0, 1, 1,
0.8539121, 0.5550897, 0.9850255, 0.7058824, 0, 1, 1,
0.8544825, 0.7907677, -0.1630102, 0.7098039, 0, 1, 1,
0.8604093, 1.026539, 0.644286, 0.7176471, 0, 1, 1,
0.861378, -1.870634, 0.8130625, 0.7215686, 0, 1, 1,
0.8642446, 0.1920178, -0.01449807, 0.7294118, 0, 1, 1,
0.8667496, 0.1941323, -0.03417589, 0.7333333, 0, 1, 1,
0.8709711, -1.396842, 3.004431, 0.7411765, 0, 1, 1,
0.8718832, -1.055081, 1.129939, 0.7450981, 0, 1, 1,
0.8730046, 1.249531, 0.08459435, 0.7529412, 0, 1, 1,
0.8743271, -0.7163932, 3.649868, 0.7568628, 0, 1, 1,
0.8754448, 1.734436, 0.9139966, 0.7647059, 0, 1, 1,
0.8781301, 1.467216, 0.6663879, 0.7686275, 0, 1, 1,
0.8908036, 0.6239652, 0.06492992, 0.7764706, 0, 1, 1,
0.8910601, 0.2450198, -0.2176817, 0.7803922, 0, 1, 1,
0.8941284, 1.528236, -0.1446691, 0.7882353, 0, 1, 1,
0.8953928, 0.4014753, 3.506737, 0.7921569, 0, 1, 1,
0.8987338, -1.222235, 2.362182, 0.8, 0, 1, 1,
0.9029709, 1.82069, 0.5038383, 0.8078431, 0, 1, 1,
0.9080518, -0.503419, 3.620953, 0.8117647, 0, 1, 1,
0.917622, -1.679753, 3.218269, 0.8196079, 0, 1, 1,
0.9207065, -0.02661199, 2.779108, 0.8235294, 0, 1, 1,
0.9254233, 0.1974823, 2.948219, 0.8313726, 0, 1, 1,
0.9334392, -1.400032, 1.025142, 0.8352941, 0, 1, 1,
0.9377332, -1.952962, 3.633195, 0.8431373, 0, 1, 1,
0.9388599, -0.168458, 1.35758, 0.8470588, 0, 1, 1,
0.9540492, 0.8308556, 2.382452, 0.854902, 0, 1, 1,
0.9542465, -0.8571429, 2.811322, 0.8588235, 0, 1, 1,
0.9591043, -0.9499969, 1.968301, 0.8666667, 0, 1, 1,
0.9654796, 0.5496708, 2.011274, 0.8705882, 0, 1, 1,
0.9777943, 0.1014357, 1.24697, 0.8784314, 0, 1, 1,
0.9911964, -1.135589, 2.695032, 0.8823529, 0, 1, 1,
0.9970861, 1.514297, 0.1486505, 0.8901961, 0, 1, 1,
0.9981802, -0.01611286, 0.2147816, 0.8941177, 0, 1, 1,
1.003144, -1.667452, 3.902368, 0.9019608, 0, 1, 1,
1.003162, 1.495687, -0.7927428, 0.9098039, 0, 1, 1,
1.003665, 0.3388028, 0.9177287, 0.9137255, 0, 1, 1,
1.004716, -0.3221401, 3.11582, 0.9215686, 0, 1, 1,
1.005943, -1.147842, 1.092759, 0.9254902, 0, 1, 1,
1.00823, -2.01385, 2.783882, 0.9333333, 0, 1, 1,
1.021481, 1.296919, 0.3444794, 0.9372549, 0, 1, 1,
1.027697, -0.3586484, 1.818526, 0.945098, 0, 1, 1,
1.030038, -0.2033101, 0.9500932, 0.9490196, 0, 1, 1,
1.033376, 1.222131, 1.405989, 0.9568627, 0, 1, 1,
1.033436, 0.7858261, 0.3638775, 0.9607843, 0, 1, 1,
1.035091, -0.5198219, 1.713969, 0.9686275, 0, 1, 1,
1.035312, 1.476232, 1.685284, 0.972549, 0, 1, 1,
1.03533, -1.091313, 3.309677, 0.9803922, 0, 1, 1,
1.044859, 0.7203873, -0.5180799, 0.9843137, 0, 1, 1,
1.048574, -0.1433572, 3.086392, 0.9921569, 0, 1, 1,
1.053321, -0.3539419, 0.7693567, 0.9960784, 0, 1, 1,
1.054978, -2.050816, 2.263372, 1, 0, 0.9960784, 1,
1.056522, -0.08956115, 2.876754, 1, 0, 0.9882353, 1,
1.057045, -0.1399299, 0.497745, 1, 0, 0.9843137, 1,
1.059285, 1.91808, 0.2017909, 1, 0, 0.9764706, 1,
1.064366, 0.643176, 0.9271545, 1, 0, 0.972549, 1,
1.070172, -0.4507056, 1.889924, 1, 0, 0.9647059, 1,
1.075037, -0.3572305, 1.922529, 1, 0, 0.9607843, 1,
1.080412, -1.038172, 1.34963, 1, 0, 0.9529412, 1,
1.081282, -0.4628304, 0.5035561, 1, 0, 0.9490196, 1,
1.085402, 0.09096824, 0.08137611, 1, 0, 0.9411765, 1,
1.095802, 0.716778, 1.131522, 1, 0, 0.9372549, 1,
1.097703, 0.5672883, -0.4418064, 1, 0, 0.9294118, 1,
1.107572, 1.120988, 1.455428, 1, 0, 0.9254902, 1,
1.10865, 0.5329112, 2.46589, 1, 0, 0.9176471, 1,
1.11059, -0.7326176, 1.080435, 1, 0, 0.9137255, 1,
1.11164, 0.4559186, 0.6515378, 1, 0, 0.9058824, 1,
1.122554, 0.263552, 0.356472, 1, 0, 0.9019608, 1,
1.127447, -1.941709, 2.126235, 1, 0, 0.8941177, 1,
1.127645, 1.007807, -1.422763, 1, 0, 0.8862745, 1,
1.13388, 1.017348, 1.05886, 1, 0, 0.8823529, 1,
1.142704, 2.222093, 0.8271529, 1, 0, 0.8745098, 1,
1.142742, -1.222699, 4.332359, 1, 0, 0.8705882, 1,
1.142807, 0.3575951, 1.029686, 1, 0, 0.8627451, 1,
1.146955, -1.22715, 0.02490679, 1, 0, 0.8588235, 1,
1.167838, -1.208839, 3.085146, 1, 0, 0.8509804, 1,
1.17074, -0.1420773, 1.424686, 1, 0, 0.8470588, 1,
1.171203, -0.6871784, 0.2314963, 1, 0, 0.8392157, 1,
1.172066, -0.8957509, 3.385739, 1, 0, 0.8352941, 1,
1.172422, 1.498422, 0.9350038, 1, 0, 0.827451, 1,
1.186058, -0.6657419, 1.110439, 1, 0, 0.8235294, 1,
1.188657, -1.14369, 3.508264, 1, 0, 0.8156863, 1,
1.199195, 0.9758446, 2.401025, 1, 0, 0.8117647, 1,
1.199522, 0.4537616, -0.5294986, 1, 0, 0.8039216, 1,
1.201766, 0.6325125, 1.640455, 1, 0, 0.7960784, 1,
1.204607, 1.607555, 1.686457, 1, 0, 0.7921569, 1,
1.20804, 0.01069349, 1.181494, 1, 0, 0.7843137, 1,
1.218148, -0.2785328, 2.032993, 1, 0, 0.7803922, 1,
1.21947, -0.6130788, 1.288575, 1, 0, 0.772549, 1,
1.2219, -0.2347819, 1.764759, 1, 0, 0.7686275, 1,
1.227151, -0.08537617, 2.666089, 1, 0, 0.7607843, 1,
1.237712, -0.6629748, 3.359112, 1, 0, 0.7568628, 1,
1.239019, 0.5834875, 0.9987062, 1, 0, 0.7490196, 1,
1.248618, 0.8770854, -0.3008497, 1, 0, 0.7450981, 1,
1.254723, 1.364194, 2.372898, 1, 0, 0.7372549, 1,
1.255203, -2.017936, 1.823856, 1, 0, 0.7333333, 1,
1.256938, -0.7026337, 1.746188, 1, 0, 0.7254902, 1,
1.259324, 0.9789118, 1.259619, 1, 0, 0.7215686, 1,
1.265598, -0.569388, 1.630778, 1, 0, 0.7137255, 1,
1.267483, -0.8553437, 1.717493, 1, 0, 0.7098039, 1,
1.272472, -0.0736676, 1.28109, 1, 0, 0.7019608, 1,
1.290143, -0.3553389, 2.529473, 1, 0, 0.6941177, 1,
1.291601, -0.4272185, 1.548691, 1, 0, 0.6901961, 1,
1.292678, -0.4251304, 1.948886, 1, 0, 0.682353, 1,
1.29336, -0.1723173, 0.7947254, 1, 0, 0.6784314, 1,
1.296611, -0.4033497, 1.275605, 1, 0, 0.6705883, 1,
1.301037, -0.7034773, 1.948018, 1, 0, 0.6666667, 1,
1.305106, -1.084352, 1.899423, 1, 0, 0.6588235, 1,
1.315536, -1.742613, 4.287582, 1, 0, 0.654902, 1,
1.329031, -0.1858349, 3.087171, 1, 0, 0.6470588, 1,
1.344336, -0.3339995, 0.9969917, 1, 0, 0.6431373, 1,
1.344474, 0.4393944, 1.156599, 1, 0, 0.6352941, 1,
1.345752, 0.1909346, 0.7682827, 1, 0, 0.6313726, 1,
1.346436, 1.253868, -0.03120047, 1, 0, 0.6235294, 1,
1.350912, -0.9115685, 1.949636, 1, 0, 0.6196079, 1,
1.3566, 1.244664, -1.24788, 1, 0, 0.6117647, 1,
1.360608, 1.522907, 0.8037226, 1, 0, 0.6078432, 1,
1.37669, -0.5928762, 1.932752, 1, 0, 0.6, 1,
1.3851, -1.456218, 1.813545, 1, 0, 0.5921569, 1,
1.39619, -1.043794, 1.581495, 1, 0, 0.5882353, 1,
1.41979, -0.4175299, 2.006588, 1, 0, 0.5803922, 1,
1.424613, 0.9683237, 1.161809, 1, 0, 0.5764706, 1,
1.430494, -0.4472905, 2.227335, 1, 0, 0.5686275, 1,
1.432237, 0.9677061, -0.09240797, 1, 0, 0.5647059, 1,
1.432774, -1.695535, 4.021463, 1, 0, 0.5568628, 1,
1.434276, -0.6088725, 2.548018, 1, 0, 0.5529412, 1,
1.438144, 0.758075, -0.5627286, 1, 0, 0.5450981, 1,
1.444313, 0.7435418, 1.755996, 1, 0, 0.5411765, 1,
1.449093, 2.978488, 1.402139, 1, 0, 0.5333334, 1,
1.450947, 0.6692665, 1.687676, 1, 0, 0.5294118, 1,
1.451582, 1.503792, 0.8298851, 1, 0, 0.5215687, 1,
1.458747, -0.1547099, 1.012479, 1, 0, 0.5176471, 1,
1.463666, -0.3041774, 1.331681, 1, 0, 0.509804, 1,
1.476314, 0.9155844, 0.5250708, 1, 0, 0.5058824, 1,
1.479322, -0.2796936, 1.980176, 1, 0, 0.4980392, 1,
1.491275, -1.439485, 3.28125, 1, 0, 0.4901961, 1,
1.497332, -0.9454862, -1.275425, 1, 0, 0.4862745, 1,
1.498639, 0.7644066, -1.057223, 1, 0, 0.4784314, 1,
1.518639, -1.111027, 1.730958, 1, 0, 0.4745098, 1,
1.534973, 2.359707, 0.8943437, 1, 0, 0.4666667, 1,
1.535437, 1.001008, 0.8269098, 1, 0, 0.4627451, 1,
1.549514, 0.5191332, 1.012422, 1, 0, 0.454902, 1,
1.550436, -0.1638364, 2.44776, 1, 0, 0.4509804, 1,
1.555659, -0.7133084, 1.609234, 1, 0, 0.4431373, 1,
1.558516, 0.4103731, 1.402675, 1, 0, 0.4392157, 1,
1.559174, 0.6705084, 2.250338, 1, 0, 0.4313726, 1,
1.5618, -0.5624743, 2.53291, 1, 0, 0.427451, 1,
1.562122, 0.1265584, 2.27704, 1, 0, 0.4196078, 1,
1.581045, -0.003642648, 1.253796, 1, 0, 0.4156863, 1,
1.595462, -0.972014, 2.503403, 1, 0, 0.4078431, 1,
1.613481, 0.3731124, 1.998543, 1, 0, 0.4039216, 1,
1.616778, 1.039108, 1.183516, 1, 0, 0.3960784, 1,
1.620407, 0.01287422, 1.194889, 1, 0, 0.3882353, 1,
1.632179, -1.03486, 2.750236, 1, 0, 0.3843137, 1,
1.63372, -1.294535, 3.096427, 1, 0, 0.3764706, 1,
1.642749, 0.3643921, 1.444938, 1, 0, 0.372549, 1,
1.650231, 1.549428, 0.9945709, 1, 0, 0.3647059, 1,
1.650285, -0.09695921, 2.231986, 1, 0, 0.3607843, 1,
1.684312, -0.8188122, 1.344288, 1, 0, 0.3529412, 1,
1.690014, 0.3853277, 2.763858, 1, 0, 0.3490196, 1,
1.692166, 0.8088766, 1.095694, 1, 0, 0.3411765, 1,
1.70411, -0.7944365, 1.815514, 1, 0, 0.3372549, 1,
1.706558, 0.816915, 1.040776, 1, 0, 0.3294118, 1,
1.716128, -1.121045, 2.01216, 1, 0, 0.3254902, 1,
1.743237, 0.7592239, -0.3297483, 1, 0, 0.3176471, 1,
1.754435, 0.6634221, 1.511185, 1, 0, 0.3137255, 1,
1.759617, -1.270527, 1.54628, 1, 0, 0.3058824, 1,
1.761256, -1.167455, 3.108938, 1, 0, 0.2980392, 1,
1.764496, 2.233039, -0.217023, 1, 0, 0.2941177, 1,
1.773849, 0.1872993, 1.878511, 1, 0, 0.2862745, 1,
1.776572, -1.691568, 2.377228, 1, 0, 0.282353, 1,
1.777495, 0.6647194, 1.753568, 1, 0, 0.2745098, 1,
1.793483, 0.5902882, 1.0538, 1, 0, 0.2705882, 1,
1.794227, 0.7311062, 2.758322, 1, 0, 0.2627451, 1,
1.806141, 0.2508483, -0.3723819, 1, 0, 0.2588235, 1,
1.809119, -1.52748, 2.960346, 1, 0, 0.2509804, 1,
1.821535, 0.7920541, 2.204598, 1, 0, 0.2470588, 1,
1.825544, -0.7537853, 0.3904264, 1, 0, 0.2392157, 1,
1.827644, -1.427607, 3.302952, 1, 0, 0.2352941, 1,
1.845631, -1.3962, 1.059824, 1, 0, 0.227451, 1,
1.851752, 0.7353136, 2.352491, 1, 0, 0.2235294, 1,
1.869351, 1.359399, 2.348288, 1, 0, 0.2156863, 1,
1.870971, 0.7136836, 0.3996115, 1, 0, 0.2117647, 1,
1.883548, 1.071174, 1.737676, 1, 0, 0.2039216, 1,
1.909366, 1.210544, 2.409202, 1, 0, 0.1960784, 1,
1.915264, 0.6012043, 0.5828932, 1, 0, 0.1921569, 1,
1.921182, -0.9293502, 3.386816, 1, 0, 0.1843137, 1,
1.940722, 0.2413608, 2.61847, 1, 0, 0.1803922, 1,
1.953931, -0.544813, 2.379228, 1, 0, 0.172549, 1,
1.988454, 0.4060999, 0.681293, 1, 0, 0.1686275, 1,
1.988943, 0.03785066, 2.140528, 1, 0, 0.1607843, 1,
2.017137, -0.7361491, 3.278847, 1, 0, 0.1568628, 1,
2.030373, 0.3447268, 2.084998, 1, 0, 0.1490196, 1,
2.036049, -1.452185, 3.212362, 1, 0, 0.145098, 1,
2.064133, -1.542597, 2.127467, 1, 0, 0.1372549, 1,
2.086024, 0.7214211, 1.242545, 1, 0, 0.1333333, 1,
2.087409, -1.14539, 2.308189, 1, 0, 0.1254902, 1,
2.095998, -1.003122, 1.564914, 1, 0, 0.1215686, 1,
2.101964, 0.5816286, 2.084248, 1, 0, 0.1137255, 1,
2.168715, 1.155756, -0.363213, 1, 0, 0.1098039, 1,
2.195585, 2.344637, -0.1214759, 1, 0, 0.1019608, 1,
2.201184, -0.2931219, 1.778356, 1, 0, 0.09411765, 1,
2.228811, 0.2771429, 3.098814, 1, 0, 0.09019608, 1,
2.241405, -0.3482164, 2.57371, 1, 0, 0.08235294, 1,
2.246172, 1.016992, 1.35952, 1, 0, 0.07843138, 1,
2.251439, -0.269227, 2.167001, 1, 0, 0.07058824, 1,
2.261071, -0.04766023, 3.341218, 1, 0, 0.06666667, 1,
2.277185, 0.7205918, 1.311738, 1, 0, 0.05882353, 1,
2.372757, -0.2058643, 3.349504, 1, 0, 0.05490196, 1,
2.383883, 2.172148, 2.839401, 1, 0, 0.04705882, 1,
2.413956, 0.3371291, 1.690324, 1, 0, 0.04313726, 1,
2.417217, 1.045711, 0.2667607, 1, 0, 0.03529412, 1,
2.492148, -0.1523538, 2.188415, 1, 0, 0.03137255, 1,
2.49613, -0.5906805, 0.9587366, 1, 0, 0.02352941, 1,
2.593629, -0.4265315, 2.420751, 1, 0, 0.01960784, 1,
3.139454, 0.2216932, 0.6464371, 1, 0, 0.01176471, 1,
3.255378, 0.9956189, 1.588809, 1, 0, 0.007843138, 1
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
0.122192, -4.795733, -6.771818, 0, -0.5, 0.5, 0.5,
0.122192, -4.795733, -6.771818, 1, -0.5, 0.5, 0.5,
0.122192, -4.795733, -6.771818, 1, 1.5, 0.5, 0.5,
0.122192, -4.795733, -6.771818, 0, 1.5, 0.5, 0.5
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
-4.073144, 0.9962362, -6.771818, 0, -0.5, 0.5, 0.5,
-4.073144, 0.9962362, -6.771818, 1, -0.5, 0.5, 0.5,
-4.073144, 0.9962362, -6.771818, 1, 1.5, 0.5, 0.5,
-4.073144, 0.9962362, -6.771818, 0, 1.5, 0.5, 0.5
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
-4.073144, -4.795733, 0.3970096, 0, -0.5, 0.5, 0.5,
-4.073144, -4.795733, 0.3970096, 1, -0.5, 0.5, 0.5,
-4.073144, -4.795733, 0.3970096, 1, 1.5, 0.5, 0.5,
-4.073144, -4.795733, 0.3970096, 0, 1.5, 0.5, 0.5
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
-3, -3.459125, -5.117473,
3, -3.459125, -5.117473,
-3, -3.459125, -5.117473,
-3, -3.681893, -5.393198,
-2, -3.459125, -5.117473,
-2, -3.681893, -5.393198,
-1, -3.459125, -5.117473,
-1, -3.681893, -5.393198,
0, -3.459125, -5.117473,
0, -3.681893, -5.393198,
1, -3.459125, -5.117473,
1, -3.681893, -5.393198,
2, -3.459125, -5.117473,
2, -3.681893, -5.393198,
3, -3.459125, -5.117473,
3, -3.681893, -5.393198
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
-3, -4.127429, -5.944645, 0, -0.5, 0.5, 0.5,
-3, -4.127429, -5.944645, 1, -0.5, 0.5, 0.5,
-3, -4.127429, -5.944645, 1, 1.5, 0.5, 0.5,
-3, -4.127429, -5.944645, 0, 1.5, 0.5, 0.5,
-2, -4.127429, -5.944645, 0, -0.5, 0.5, 0.5,
-2, -4.127429, -5.944645, 1, -0.5, 0.5, 0.5,
-2, -4.127429, -5.944645, 1, 1.5, 0.5, 0.5,
-2, -4.127429, -5.944645, 0, 1.5, 0.5, 0.5,
-1, -4.127429, -5.944645, 0, -0.5, 0.5, 0.5,
-1, -4.127429, -5.944645, 1, -0.5, 0.5, 0.5,
-1, -4.127429, -5.944645, 1, 1.5, 0.5, 0.5,
-1, -4.127429, -5.944645, 0, 1.5, 0.5, 0.5,
0, -4.127429, -5.944645, 0, -0.5, 0.5, 0.5,
0, -4.127429, -5.944645, 1, -0.5, 0.5, 0.5,
0, -4.127429, -5.944645, 1, 1.5, 0.5, 0.5,
0, -4.127429, -5.944645, 0, 1.5, 0.5, 0.5,
1, -4.127429, -5.944645, 0, -0.5, 0.5, 0.5,
1, -4.127429, -5.944645, 1, -0.5, 0.5, 0.5,
1, -4.127429, -5.944645, 1, 1.5, 0.5, 0.5,
1, -4.127429, -5.944645, 0, 1.5, 0.5, 0.5,
2, -4.127429, -5.944645, 0, -0.5, 0.5, 0.5,
2, -4.127429, -5.944645, 1, -0.5, 0.5, 0.5,
2, -4.127429, -5.944645, 1, 1.5, 0.5, 0.5,
2, -4.127429, -5.944645, 0, 1.5, 0.5, 0.5,
3, -4.127429, -5.944645, 0, -0.5, 0.5, 0.5,
3, -4.127429, -5.944645, 1, -0.5, 0.5, 0.5,
3, -4.127429, -5.944645, 1, 1.5, 0.5, 0.5,
3, -4.127429, -5.944645, 0, 1.5, 0.5, 0.5
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
-3.10499, -2, -5.117473,
-3.10499, 4, -5.117473,
-3.10499, -2, -5.117473,
-3.266349, -2, -5.393198,
-3.10499, 0, -5.117473,
-3.266349, 0, -5.393198,
-3.10499, 2, -5.117473,
-3.266349, 2, -5.393198,
-3.10499, 4, -5.117473,
-3.266349, 4, -5.393198
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
"2",
"4"
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
-3.589067, -2, -5.944645, 0, -0.5, 0.5, 0.5,
-3.589067, -2, -5.944645, 1, -0.5, 0.5, 0.5,
-3.589067, -2, -5.944645, 1, 1.5, 0.5, 0.5,
-3.589067, -2, -5.944645, 0, 1.5, 0.5, 0.5,
-3.589067, 0, -5.944645, 0, -0.5, 0.5, 0.5,
-3.589067, 0, -5.944645, 1, -0.5, 0.5, 0.5,
-3.589067, 0, -5.944645, 1, 1.5, 0.5, 0.5,
-3.589067, 0, -5.944645, 0, 1.5, 0.5, 0.5,
-3.589067, 2, -5.944645, 0, -0.5, 0.5, 0.5,
-3.589067, 2, -5.944645, 1, -0.5, 0.5, 0.5,
-3.589067, 2, -5.944645, 1, 1.5, 0.5, 0.5,
-3.589067, 2, -5.944645, 0, 1.5, 0.5, 0.5,
-3.589067, 4, -5.944645, 0, -0.5, 0.5, 0.5,
-3.589067, 4, -5.944645, 1, -0.5, 0.5, 0.5,
-3.589067, 4, -5.944645, 1, 1.5, 0.5, 0.5,
-3.589067, 4, -5.944645, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.10499, -3.459125, -4,
-3.10499, -3.459125, 4,
-3.10499, -3.459125, -4,
-3.266349, -3.681893, -4,
-3.10499, -3.459125, -2,
-3.266349, -3.681893, -2,
-3.10499, -3.459125, 0,
-3.266349, -3.681893, 0,
-3.10499, -3.459125, 2,
-3.266349, -3.681893, 2,
-3.10499, -3.459125, 4,
-3.266349, -3.681893, 4
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
-3.589067, -4.127429, -4, 0, -0.5, 0.5, 0.5,
-3.589067, -4.127429, -4, 1, -0.5, 0.5, 0.5,
-3.589067, -4.127429, -4, 1, 1.5, 0.5, 0.5,
-3.589067, -4.127429, -4, 0, 1.5, 0.5, 0.5,
-3.589067, -4.127429, -2, 0, -0.5, 0.5, 0.5,
-3.589067, -4.127429, -2, 1, -0.5, 0.5, 0.5,
-3.589067, -4.127429, -2, 1, 1.5, 0.5, 0.5,
-3.589067, -4.127429, -2, 0, 1.5, 0.5, 0.5,
-3.589067, -4.127429, 0, 0, -0.5, 0.5, 0.5,
-3.589067, -4.127429, 0, 1, -0.5, 0.5, 0.5,
-3.589067, -4.127429, 0, 1, 1.5, 0.5, 0.5,
-3.589067, -4.127429, 0, 0, 1.5, 0.5, 0.5,
-3.589067, -4.127429, 2, 0, -0.5, 0.5, 0.5,
-3.589067, -4.127429, 2, 1, -0.5, 0.5, 0.5,
-3.589067, -4.127429, 2, 1, 1.5, 0.5, 0.5,
-3.589067, -4.127429, 2, 0, 1.5, 0.5, 0.5,
-3.589067, -4.127429, 4, 0, -0.5, 0.5, 0.5,
-3.589067, -4.127429, 4, 1, -0.5, 0.5, 0.5,
-3.589067, -4.127429, 4, 1, 1.5, 0.5, 0.5,
-3.589067, -4.127429, 4, 0, 1.5, 0.5, 0.5
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
-3.10499, -3.459125, -5.117473,
-3.10499, 5.451597, -5.117473,
-3.10499, -3.459125, 5.911492,
-3.10499, 5.451597, 5.911492,
-3.10499, -3.459125, -5.117473,
-3.10499, -3.459125, 5.911492,
-3.10499, 5.451597, -5.117473,
-3.10499, 5.451597, 5.911492,
-3.10499, -3.459125, -5.117473,
3.349374, -3.459125, -5.117473,
-3.10499, -3.459125, 5.911492,
3.349374, -3.459125, 5.911492,
-3.10499, 5.451597, -5.117473,
3.349374, 5.451597, -5.117473,
-3.10499, 5.451597, 5.911492,
3.349374, 5.451597, 5.911492,
3.349374, -3.459125, -5.117473,
3.349374, 5.451597, -5.117473,
3.349374, -3.459125, 5.911492,
3.349374, 5.451597, 5.911492,
3.349374, -3.459125, -5.117473,
3.349374, -3.459125, 5.911492,
3.349374, 5.451597, -5.117473,
3.349374, 5.451597, 5.911492
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
var radius = 8.318757;
var distance = 37.01109;
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
mvMatrix.translate( -0.122192, -0.9962362, -0.3970096 );
mvMatrix.scale( 1.393538, 1.009391, 0.8155255 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.01109);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Binapacryl<-read.table("Binapacryl.xyz", skip=1)
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
-3.010994, 0.4229062, -1.547975, 0, 0, 1, 1, 1,
-2.968167, -0.5534346, -0.5802684, 1, 0, 0, 1, 1,
-2.960782, 0.009232095, -0.09828945, 1, 0, 0, 1, 1,
-2.795836, -0.2843517, -0.3340446, 1, 0, 0, 1, 1,
-2.541695, 0.6730266, -0.6320296, 1, 0, 0, 1, 1,
-2.512334, -0.6101713, -1.401042, 1, 0, 0, 1, 1,
-2.402665, -1.046064, -3.826796, 0, 0, 0, 1, 1,
-2.372653, 1.137202, -0.8749155, 0, 0, 0, 1, 1,
-2.365268, 0.0695845, -1.17264, 0, 0, 0, 1, 1,
-2.303277, -0.1303146, -0.3391448, 0, 0, 0, 1, 1,
-2.286264, -1.37424, -0.6785993, 0, 0, 0, 1, 1,
-2.285543, 0.8798065, -0.6904319, 0, 0, 0, 1, 1,
-2.273876, 0.8633735, 0.0924818, 0, 0, 0, 1, 1,
-2.255527, -0.1280807, -1.992856, 1, 1, 1, 1, 1,
-2.155921, 1.611148, -2.139077, 1, 1, 1, 1, 1,
-2.125568, -1.520041, -2.014661, 1, 1, 1, 1, 1,
-2.113024, 0.8140919, 0.4283041, 1, 1, 1, 1, 1,
-2.112823, -0.01531568, -1.623804, 1, 1, 1, 1, 1,
-2.109719, -0.1409861, -1.51613, 1, 1, 1, 1, 1,
-2.042324, 1.018205, -1.978867, 1, 1, 1, 1, 1,
-2.033221, 0.569113, -0.7941071, 1, 1, 1, 1, 1,
-2.018574, -3.329357, -3.225567, 1, 1, 1, 1, 1,
-1.994182, 1.049571, -1.044397, 1, 1, 1, 1, 1,
-1.954794, 0.8025249, -0.734642, 1, 1, 1, 1, 1,
-1.923379, -1.04859, -1.767442, 1, 1, 1, 1, 1,
-1.920843, -1.302077, -1.216553, 1, 1, 1, 1, 1,
-1.90916, 3.275311, -1.286543, 1, 1, 1, 1, 1,
-1.886591, -0.6532459, -3.02476, 1, 1, 1, 1, 1,
-1.866314, 0.9816049, 0.8590037, 0, 0, 1, 1, 1,
-1.8658, 0.5077989, 0.3398781, 1, 0, 0, 1, 1,
-1.810431, 0.8917557, -2.487421, 1, 0, 0, 1, 1,
-1.808865, -0.2206809, -2.036801, 1, 0, 0, 1, 1,
-1.793212, 0.3743012, -0.7333173, 1, 0, 0, 1, 1,
-1.77508, 1.298245, -2.093286, 1, 0, 0, 1, 1,
-1.761194, 0.03581592, -1.988271, 0, 0, 0, 1, 1,
-1.746226, -0.07723038, -2.192079, 0, 0, 0, 1, 1,
-1.713431, 0.3193958, -0.928813, 0, 0, 0, 1, 1,
-1.677191, 0.8517222, -1.243323, 0, 0, 0, 1, 1,
-1.662743, -0.3203433, -0.8670486, 0, 0, 0, 1, 1,
-1.651915, 1.81189, -1.885025, 0, 0, 0, 1, 1,
-1.63324, -0.5177027, -2.280891, 0, 0, 0, 1, 1,
-1.631935, -0.9596817, -1.28508, 1, 1, 1, 1, 1,
-1.624382, 0.001187795, -1.766857, 1, 1, 1, 1, 1,
-1.622676, -0.07088268, -1.046922, 1, 1, 1, 1, 1,
-1.619666, 0.5203419, 1.032495, 1, 1, 1, 1, 1,
-1.618007, -0.223642, -1.753829, 1, 1, 1, 1, 1,
-1.615327, -0.6142862, -1.518873, 1, 1, 1, 1, 1,
-1.602483, 1.685375, -1.432976, 1, 1, 1, 1, 1,
-1.600627, 0.7552385, -1.962093, 1, 1, 1, 1, 1,
-1.579608, -0.5469514, -1.091725, 1, 1, 1, 1, 1,
-1.565674, -0.2675235, -2.990134, 1, 1, 1, 1, 1,
-1.555219, 0.7912573, -0.6766089, 1, 1, 1, 1, 1,
-1.550974, -0.8175433, -0.6720679, 1, 1, 1, 1, 1,
-1.547977, -0.641627, -1.310488, 1, 1, 1, 1, 1,
-1.53735, 0.9675962, -1.853055, 1, 1, 1, 1, 1,
-1.529239, 0.9043602, -2.184504, 1, 1, 1, 1, 1,
-1.480845, -0.9206129, -1.510535, 0, 0, 1, 1, 1,
-1.477108, 0.6383749, -0.7086869, 1, 0, 0, 1, 1,
-1.476901, 1.862692, -1.30261, 1, 0, 0, 1, 1,
-1.473282, -0.6456525, -2.35288, 1, 0, 0, 1, 1,
-1.470367, 0.9402506, -0.1262564, 1, 0, 0, 1, 1,
-1.45401, -0.4214763, -0.8739558, 1, 0, 0, 1, 1,
-1.451409, -0.7428263, -1.738227, 0, 0, 0, 1, 1,
-1.440905, 0.02710989, -1.071375, 0, 0, 0, 1, 1,
-1.434121, 0.1774943, -1.640155, 0, 0, 0, 1, 1,
-1.425475, 2.150728, -0.03780806, 0, 0, 0, 1, 1,
-1.412887, 1.558593, -0.6166508, 0, 0, 0, 1, 1,
-1.409651, -0.02716793, -1.223465, 0, 0, 0, 1, 1,
-1.406716, -0.2910296, -2.407892, 0, 0, 0, 1, 1,
-1.40184, -0.2067133, -1.269926, 1, 1, 1, 1, 1,
-1.398865, -1.510301, -0.07688583, 1, 1, 1, 1, 1,
-1.397058, 0.3263126, -0.3113854, 1, 1, 1, 1, 1,
-1.39012, -0.1265337, -2.33747, 1, 1, 1, 1, 1,
-1.38438, -1.400402, -3.138585, 1, 1, 1, 1, 1,
-1.380278, 0.3065101, -0.791425, 1, 1, 1, 1, 1,
-1.379206, -0.4497007, -1.64448, 1, 1, 1, 1, 1,
-1.374759, 0.3777615, -1.059092, 1, 1, 1, 1, 1,
-1.37464, 1.474049, -0.4837459, 1, 1, 1, 1, 1,
-1.372609, 0.3918529, -1.493315, 1, 1, 1, 1, 1,
-1.368754, -0.7847264, -4.349142, 1, 1, 1, 1, 1,
-1.368433, 0.8769541, 0.9595934, 1, 1, 1, 1, 1,
-1.360044, 1.018409, 1.042798, 1, 1, 1, 1, 1,
-1.35214, -0.2378708, -2.577763, 1, 1, 1, 1, 1,
-1.343559, -1.55252, -2.198043, 1, 1, 1, 1, 1,
-1.338725, 0.4158732, -0.5851682, 0, 0, 1, 1, 1,
-1.328831, 0.8973151, 0.1657582, 1, 0, 0, 1, 1,
-1.325866, -0.2047213, -1.344428, 1, 0, 0, 1, 1,
-1.319009, -0.1422428, -1.161589, 1, 0, 0, 1, 1,
-1.315735, 0.2664609, -0.2832727, 1, 0, 0, 1, 1,
-1.314429, -1.152883, -1.85789, 1, 0, 0, 1, 1,
-1.31191, -0.6897073, -0.4534154, 0, 0, 0, 1, 1,
-1.311362, 0.4131599, -2.058624, 0, 0, 0, 1, 1,
-1.300026, 1.181815, -1.034879, 0, 0, 0, 1, 1,
-1.297683, 0.4663279, -2.478364, 0, 0, 0, 1, 1,
-1.295397, -0.631004, -2.742964, 0, 0, 0, 1, 1,
-1.292494, -0.8471761, -1.825284, 0, 0, 0, 1, 1,
-1.289855, 0.5286475, -1.355056, 0, 0, 0, 1, 1,
-1.263159, -0.08976012, -0.7324199, 1, 1, 1, 1, 1,
-1.261822, -2.194811, -2.88018, 1, 1, 1, 1, 1,
-1.255386, -1.12209, -2.218705, 1, 1, 1, 1, 1,
-1.253003, 0.4646904, -1.035504, 1, 1, 1, 1, 1,
-1.252919, 1.199636, -2.236979, 1, 1, 1, 1, 1,
-1.230872, 0.5846655, -1.827253, 1, 1, 1, 1, 1,
-1.217693, 0.7995756, -0.1829103, 1, 1, 1, 1, 1,
-1.211674, -2.36779, -1.301325, 1, 1, 1, 1, 1,
-1.20614, -1.079157, -1.686038, 1, 1, 1, 1, 1,
-1.192348, 1.316153, -0.2659347, 1, 1, 1, 1, 1,
-1.191765, -0.6747456, -3.545928, 1, 1, 1, 1, 1,
-1.179714, -0.3897669, -1.543236, 1, 1, 1, 1, 1,
-1.169777, -0.09409853, -0.4599459, 1, 1, 1, 1, 1,
-1.165846, 1.104824, -1.672428, 1, 1, 1, 1, 1,
-1.1648, 0.5595807, -0.7202529, 1, 1, 1, 1, 1,
-1.164247, -0.2699119, -0.2214471, 0, 0, 1, 1, 1,
-1.162729, 0.8944196, -2.654233, 1, 0, 0, 1, 1,
-1.158395, -0.0762832, -1.666888, 1, 0, 0, 1, 1,
-1.157565, -1.147337, -2.163082, 1, 0, 0, 1, 1,
-1.150122, -1.161109, -2.190016, 1, 0, 0, 1, 1,
-1.146996, 0.8897328, -1.890864, 1, 0, 0, 1, 1,
-1.14697, 0.6478014, -2.411517, 0, 0, 0, 1, 1,
-1.145533, -0.734939, -1.963791, 0, 0, 0, 1, 1,
-1.144109, 0.1992617, -1.771364, 0, 0, 0, 1, 1,
-1.134768, 2.08361, 0.2821827, 0, 0, 0, 1, 1,
-1.115973, 0.3923542, -3.15376, 0, 0, 0, 1, 1,
-1.112429, -0.089567, -1.627962, 0, 0, 0, 1, 1,
-1.109257, -0.2922219, -0.8163005, 0, 0, 0, 1, 1,
-1.105965, -0.7826146, -2.700818, 1, 1, 1, 1, 1,
-1.095751, 0.07875904, 1.400261, 1, 1, 1, 1, 1,
-1.093621, 0.3649788, -1.567102, 1, 1, 1, 1, 1,
-1.092854, -0.6372651, -2.811409, 1, 1, 1, 1, 1,
-1.089779, 0.04827937, -1.581334, 1, 1, 1, 1, 1,
-1.08329, 0.3042513, -1.648269, 1, 1, 1, 1, 1,
-1.081, -1.341219, -2.892788, 1, 1, 1, 1, 1,
-1.078624, 2.089881, -1.222124, 1, 1, 1, 1, 1,
-1.076629, 1.226813, -0.7680759, 1, 1, 1, 1, 1,
-1.070739, -1.470934, -3.261171, 1, 1, 1, 1, 1,
-1.061927, 0.7901598, -0.8340272, 1, 1, 1, 1, 1,
-1.061918, 0.1739164, -0.9816331, 1, 1, 1, 1, 1,
-1.059518, -1.453843, -2.401635, 1, 1, 1, 1, 1,
-1.052453, -0.9244084, -0.8076257, 1, 1, 1, 1, 1,
-1.046023, -0.7720332, -3.647554, 1, 1, 1, 1, 1,
-1.045969, 0.0982374, -1.735153, 0, 0, 1, 1, 1,
-1.042619, -1.183645, -2.704037, 1, 0, 0, 1, 1,
-1.041457, -0.8106431, -2.154202, 1, 0, 0, 1, 1,
-1.04123, 0.05051634, -1.55804, 1, 0, 0, 1, 1,
-1.039155, 1.514115, -0.4575602, 1, 0, 0, 1, 1,
-1.031495, 0.1970319, -4.76245, 1, 0, 0, 1, 1,
-1.028485, 0.717068, -1.531674, 0, 0, 0, 1, 1,
-1.027941, -0.855149, -2.301286, 0, 0, 0, 1, 1,
-1.021561, 1.012662, -0.7541317, 0, 0, 0, 1, 1,
-1.020706, -0.8760841, -2.329015, 0, 0, 0, 1, 1,
-1.012296, 1.86464, 0.5053827, 0, 0, 0, 1, 1,
-1.00649, -0.07548512, -3.557763, 0, 0, 0, 1, 1,
-1.006251, -0.2348081, -2.494808, 0, 0, 0, 1, 1,
-1.005485, -0.707937, -1.934202, 1, 1, 1, 1, 1,
-1.004335, 1.90033, -1.66742, 1, 1, 1, 1, 1,
-1.002, -0.08204182, -2.516931, 1, 1, 1, 1, 1,
-1.000516, 0.5240873, 0.5033693, 1, 1, 1, 1, 1,
-0.9993235, -1.416671, -3.46705, 1, 1, 1, 1, 1,
-0.9968565, 1.483568, -2.059078, 1, 1, 1, 1, 1,
-0.9954609, -0.3251715, -1.977102, 1, 1, 1, 1, 1,
-0.9902893, -0.6554326, -2.074191, 1, 1, 1, 1, 1,
-0.9854695, -0.3646578, -3.156074, 1, 1, 1, 1, 1,
-0.9793621, 0.1995078, -0.7897439, 1, 1, 1, 1, 1,
-0.9775345, -0.8670868, -4.367517, 1, 1, 1, 1, 1,
-0.9698327, 0.7077492, -0.9669847, 1, 1, 1, 1, 1,
-0.9603388, 0.4160838, -0.6456373, 1, 1, 1, 1, 1,
-0.9600723, 0.1939635, 0.06423994, 1, 1, 1, 1, 1,
-0.9578723, -0.2606875, -3.316099, 1, 1, 1, 1, 1,
-0.956214, -0.385295, -2.091436, 0, 0, 1, 1, 1,
-0.9531333, -0.27936, -1.40012, 1, 0, 0, 1, 1,
-0.9485021, -0.1447764, -2.155795, 1, 0, 0, 1, 1,
-0.9455316, 0.9401215, -1.596601, 1, 0, 0, 1, 1,
-0.9438378, 0.3667611, -1.140274, 1, 0, 0, 1, 1,
-0.9423552, -0.5549636, -0.6615599, 1, 0, 0, 1, 1,
-0.9417491, -0.09661194, -0.3781506, 0, 0, 0, 1, 1,
-0.9370908, -0.4094657, -1.289056, 0, 0, 0, 1, 1,
-0.9317535, 1.189756, -0.6629248, 0, 0, 0, 1, 1,
-0.9222795, -0.1186926, 0.4995328, 0, 0, 0, 1, 1,
-0.9214426, 3.547556, -0.1439575, 0, 0, 0, 1, 1,
-0.9144522, -0.6316211, -0.3536467, 0, 0, 0, 1, 1,
-0.9106152, -0.1767584, -4.075908, 0, 0, 0, 1, 1,
-0.9022438, 0.5798764, -1.559559, 1, 1, 1, 1, 1,
-0.8966297, -0.08797386, -2.701448, 1, 1, 1, 1, 1,
-0.8932123, -0.579356, -0.9072047, 1, 1, 1, 1, 1,
-0.8930274, 0.004712451, -3.011766, 1, 1, 1, 1, 1,
-0.8922638, -0.1942149, -1.942094, 1, 1, 1, 1, 1,
-0.8861724, 0.4792243, -2.291017, 1, 1, 1, 1, 1,
-0.8832249, -1.761603, -2.951932, 1, 1, 1, 1, 1,
-0.8743782, 1.125621, 0.90552, 1, 1, 1, 1, 1,
-0.8700603, -0.7347073, -3.729798, 1, 1, 1, 1, 1,
-0.857608, -1.280406, -2.564985, 1, 1, 1, 1, 1,
-0.8529642, -0.3505921, -3.608578, 1, 1, 1, 1, 1,
-0.8514978, 1.267964, -2.366561, 1, 1, 1, 1, 1,
-0.8511857, 2.813111, -0.1793499, 1, 1, 1, 1, 1,
-0.8459635, -0.1350852, -0.9529464, 1, 1, 1, 1, 1,
-0.8453102, -1.256922, -1.812597, 1, 1, 1, 1, 1,
-0.8448192, 0.5604681, 0.7734152, 0, 0, 1, 1, 1,
-0.8447671, 0.5529777, -0.5867828, 1, 0, 0, 1, 1,
-0.8445004, 0.5000458, -0.4136901, 1, 0, 0, 1, 1,
-0.835398, -0.5358056, -2.048812, 1, 0, 0, 1, 1,
-0.8351651, 0.3146695, -2.136527, 1, 0, 0, 1, 1,
-0.8345358, -1.071351, -1.249234, 1, 0, 0, 1, 1,
-0.830712, -0.1934697, -1.370889, 0, 0, 0, 1, 1,
-0.8302612, -0.09130453, 0.4001336, 0, 0, 0, 1, 1,
-0.8296343, 1.404562, -1.606964, 0, 0, 0, 1, 1,
-0.8282446, -0.4741618, -2.822763, 0, 0, 0, 1, 1,
-0.8259117, -0.5224646, -2.63158, 0, 0, 0, 1, 1,
-0.8258812, -0.1547523, -2.807225, 0, 0, 0, 1, 1,
-0.8130759, -0.6190208, -1.44779, 0, 0, 0, 1, 1,
-0.8109071, 0.2646629, -4.002217, 1, 1, 1, 1, 1,
-0.810722, 2.732406, 0.627381, 1, 1, 1, 1, 1,
-0.8078441, -0.01401638, -1.579271, 1, 1, 1, 1, 1,
-0.8058618, -0.0473909, -0.4874154, 1, 1, 1, 1, 1,
-0.8045739, 1.004202, -1.810732, 1, 1, 1, 1, 1,
-0.8045077, -0.8244843, -2.38153, 1, 1, 1, 1, 1,
-0.8007184, 0.6633397, 0.5929356, 1, 1, 1, 1, 1,
-0.7984265, -0.6427734, -2.326464, 1, 1, 1, 1, 1,
-0.7982726, 0.9533521, -1.238547, 1, 1, 1, 1, 1,
-0.7977259, 0.4978461, 0.5214765, 1, 1, 1, 1, 1,
-0.7960101, -0.4862651, -1.904819, 1, 1, 1, 1, 1,
-0.7864175, -0.350181, -1.402256, 1, 1, 1, 1, 1,
-0.7841727, -2.352291, -3.522082, 1, 1, 1, 1, 1,
-0.7788537, -1.163772, -3.229372, 1, 1, 1, 1, 1,
-0.7736969, 2.431073, 0.2355331, 1, 1, 1, 1, 1,
-0.7730263, -1.058924, -3.095714, 0, 0, 1, 1, 1,
-0.7711936, -0.5483074, -3.500582, 1, 0, 0, 1, 1,
-0.7591943, -0.9991376, -1.042076, 1, 0, 0, 1, 1,
-0.7448652, -2.225581, -2.679311, 1, 0, 0, 1, 1,
-0.7434, 1.573206, -1.087871, 1, 0, 0, 1, 1,
-0.7395778, 0.9327956, -1.462812, 1, 0, 0, 1, 1,
-0.7326024, -2.320824, -2.556709, 0, 0, 0, 1, 1,
-0.7251074, -0.8636423, -2.309154, 0, 0, 0, 1, 1,
-0.7226064, -0.06502979, -3.086047, 0, 0, 0, 1, 1,
-0.7224342, 0.2663074, -1.111135, 0, 0, 0, 1, 1,
-0.7170549, -1.003522, -1.380798, 0, 0, 0, 1, 1,
-0.7136671, -2.621435, -1.391582, 0, 0, 0, 1, 1,
-0.7131801, 0.362036, 0.4088629, 0, 0, 0, 1, 1,
-0.711924, -1.413919, -4.701331, 1, 1, 1, 1, 1,
-0.7023372, 1.087206, 0.2703386, 1, 1, 1, 1, 1,
-0.6994135, 1.534315, 0.4535584, 1, 1, 1, 1, 1,
-0.6960915, -0.2915663, -1.942976, 1, 1, 1, 1, 1,
-0.6952497, -0.3262254, -0.6731384, 1, 1, 1, 1, 1,
-0.6877617, 1.516856, 0.938328, 1, 1, 1, 1, 1,
-0.6875985, -0.7859712, -3.758077, 1, 1, 1, 1, 1,
-0.6874036, 0.0334545, -1.527987, 1, 1, 1, 1, 1,
-0.6857162, -0.2086312, -1.032689, 1, 1, 1, 1, 1,
-0.6809139, 0.5920621, -1.375394, 1, 1, 1, 1, 1,
-0.6741546, -0.8920203, -1.935405, 1, 1, 1, 1, 1,
-0.6715719, -1.430509, -1.565742, 1, 1, 1, 1, 1,
-0.6711363, -1.963603, -2.465957, 1, 1, 1, 1, 1,
-0.6695074, -1.133711, -3.034519, 1, 1, 1, 1, 1,
-0.6676997, -1.54702, -3.079934, 1, 1, 1, 1, 1,
-0.6666179, -0.01744743, -3.165806, 0, 0, 1, 1, 1,
-0.6642655, 0.163497, 0.4053966, 1, 0, 0, 1, 1,
-0.661782, 0.04695078, -2.303174, 1, 0, 0, 1, 1,
-0.6598211, 1.055353, -0.7921194, 1, 0, 0, 1, 1,
-0.6594563, 1.374432, 0.9133455, 1, 0, 0, 1, 1,
-0.6507015, 1.629302, -0.7310362, 1, 0, 0, 1, 1,
-0.6470721, 0.3673933, -1.226032, 0, 0, 0, 1, 1,
-0.6444169, -0.2311759, -2.545475, 0, 0, 0, 1, 1,
-0.6357774, -1.043787, -1.497489, 0, 0, 0, 1, 1,
-0.6324377, -1.430143, -3.722538, 0, 0, 0, 1, 1,
-0.6301516, 0.02234132, -2.411907, 0, 0, 0, 1, 1,
-0.6263964, -1.921016, -4.473251, 0, 0, 0, 1, 1,
-0.6193192, 0.3841136, -0.3164128, 0, 0, 0, 1, 1,
-0.6111112, -0.3870167, -2.644442, 1, 1, 1, 1, 1,
-0.608872, -0.4795837, -1.445304, 1, 1, 1, 1, 1,
-0.6087092, -0.0657854, -3.737446, 1, 1, 1, 1, 1,
-0.6052104, 0.468275, -0.6485298, 1, 1, 1, 1, 1,
-0.6035033, 1.452198, -0.7702907, 1, 1, 1, 1, 1,
-0.6028397, -0.172685, -2.812848, 1, 1, 1, 1, 1,
-0.5953875, 0.5875486, -1.996532, 1, 1, 1, 1, 1,
-0.5947108, -0.1651112, -0.4678247, 1, 1, 1, 1, 1,
-0.5913718, -0.1286663, 1.055733, 1, 1, 1, 1, 1,
-0.5895523, -0.2856512, 0.4537877, 1, 1, 1, 1, 1,
-0.5882046, -0.2106163, -0.968196, 1, 1, 1, 1, 1,
-0.5841042, -0.2580732, -2.078676, 1, 1, 1, 1, 1,
-0.5719032, 1.337442, -0.6843488, 1, 1, 1, 1, 1,
-0.5690969, -1.601764, -3.012449, 1, 1, 1, 1, 1,
-0.5690497, 1.434686, 0.5617502, 1, 1, 1, 1, 1,
-0.5671746, -1.406722, -1.666651, 0, 0, 1, 1, 1,
-0.5649218, -2.354292, -1.894367, 1, 0, 0, 1, 1,
-0.563361, 0.9809098, 0.5673087, 1, 0, 0, 1, 1,
-0.5531991, 0.2523652, -2.472202, 1, 0, 0, 1, 1,
-0.5527393, -1.065675, -1.454191, 1, 0, 0, 1, 1,
-0.5509692, -0.05464137, -1.44155, 1, 0, 0, 1, 1,
-0.5502796, -1.888219, 0.06962396, 0, 0, 0, 1, 1,
-0.5484517, -0.7347245, -2.340296, 0, 0, 0, 1, 1,
-0.548069, -0.8769962, -3.435393, 0, 0, 0, 1, 1,
-0.540898, 0.8052428, -0.3821184, 0, 0, 0, 1, 1,
-0.5406885, -1.56852, -2.541832, 0, 0, 0, 1, 1,
-0.5364246, 0.5453454, -0.9622146, 0, 0, 0, 1, 1,
-0.524412, -0.404371, 0.04017093, 0, 0, 0, 1, 1,
-0.5227293, -0.4134099, -1.45658, 1, 1, 1, 1, 1,
-0.5108317, -0.9893802, -2.75901, 1, 1, 1, 1, 1,
-0.504673, 0.524621, -1.818679, 1, 1, 1, 1, 1,
-0.4953388, -0.0738076, -0.7735629, 1, 1, 1, 1, 1,
-0.4863477, -0.1485177, -1.789852, 1, 1, 1, 1, 1,
-0.4842362, 1.115664, -0.1845611, 1, 1, 1, 1, 1,
-0.4839912, 0.5412712, 0.2646227, 1, 1, 1, 1, 1,
-0.4758797, -0.02738752, -2.057446, 1, 1, 1, 1, 1,
-0.4747263, 0.4205455, -2.237358, 1, 1, 1, 1, 1,
-0.4685632, -0.749775, -4.956857, 1, 1, 1, 1, 1,
-0.4617434, -0.01452574, -2.004978, 1, 1, 1, 1, 1,
-0.4603105, 0.8346684, 0.8191991, 1, 1, 1, 1, 1,
-0.4510089, 0.4076881, 0.7303568, 1, 1, 1, 1, 1,
-0.4483871, -1.482557, -2.069563, 1, 1, 1, 1, 1,
-0.4423859, 1.367511, 0.5498787, 1, 1, 1, 1, 1,
-0.434593, -0.3684193, -4.006932, 0, 0, 1, 1, 1,
-0.4344949, -0.8701348, -1.817061, 1, 0, 0, 1, 1,
-0.4309983, -0.3249333, -1.797704, 1, 0, 0, 1, 1,
-0.4301657, -1.345407, -2.757724, 1, 0, 0, 1, 1,
-0.4289918, -0.7294284, -3.893476, 1, 0, 0, 1, 1,
-0.4264247, -1.217752, -3.985958, 1, 0, 0, 1, 1,
-0.42501, 0.391575, -1.394703, 0, 0, 0, 1, 1,
-0.4169277, -1.016156, -3.158486, 0, 0, 0, 1, 1,
-0.4147969, 0.33852, -0.4784845, 0, 0, 0, 1, 1,
-0.4084415, -1.654333, -2.741301, 0, 0, 0, 1, 1,
-0.4078538, 0.7312698, -1.513276, 0, 0, 0, 1, 1,
-0.4032351, 0.06625984, -1.36338, 0, 0, 0, 1, 1,
-0.4015561, 1.034925, -0.48376, 0, 0, 0, 1, 1,
-0.3972897, 0.9818256, -0.6563182, 1, 1, 1, 1, 1,
-0.3964928, -0.01712421, -0.7257063, 1, 1, 1, 1, 1,
-0.3928381, 0.4141885, -0.6360863, 1, 1, 1, 1, 1,
-0.3923962, 1.278764, -1.462216, 1, 1, 1, 1, 1,
-0.3896719, -0.2545941, -0.3807496, 1, 1, 1, 1, 1,
-0.3894605, 0.5551492, 0.5217497, 1, 1, 1, 1, 1,
-0.3885393, -0.1533413, -0.1723978, 1, 1, 1, 1, 1,
-0.3863114, 0.8629376, 1.385958, 1, 1, 1, 1, 1,
-0.3835785, 0.06812831, -1.523843, 1, 1, 1, 1, 1,
-0.3782474, 0.6359996, -1.221482, 1, 1, 1, 1, 1,
-0.3740255, -1.327247, -2.223026, 1, 1, 1, 1, 1,
-0.3737465, 0.5874438, -1.393219, 1, 1, 1, 1, 1,
-0.3711613, -0.6119686, -1.688118, 1, 1, 1, 1, 1,
-0.3686932, 0.5452383, 0.4308, 1, 1, 1, 1, 1,
-0.3666921, 0.4452856, 1.449453, 1, 1, 1, 1, 1,
-0.3644104, 0.8902428, -1.152961, 0, 0, 1, 1, 1,
-0.3601216, 0.3206576, -1.206994, 1, 0, 0, 1, 1,
-0.3560925, 0.2457151, 0.266961, 1, 0, 0, 1, 1,
-0.354481, -0.3504289, -1.76929, 1, 0, 0, 1, 1,
-0.3520118, -1.224261, -4.136613, 1, 0, 0, 1, 1,
-0.3513106, 0.7528685, -2.161388, 1, 0, 0, 1, 1,
-0.3399676, 0.1388839, -1.780848, 0, 0, 0, 1, 1,
-0.3396971, 0.7327287, -0.9918494, 0, 0, 0, 1, 1,
-0.3384104, -1.31769, -3.438982, 0, 0, 0, 1, 1,
-0.3375484, -0.715323, -3.327095, 0, 0, 0, 1, 1,
-0.3367488, 1.340864, 1.565057, 0, 0, 0, 1, 1,
-0.3351914, -0.524262, -4.155984, 0, 0, 0, 1, 1,
-0.3340148, -1.453897, -3.265166, 0, 0, 0, 1, 1,
-0.3325028, 1.291706, -1.162935, 1, 1, 1, 1, 1,
-0.330792, -0.1626357, -0.9712215, 1, 1, 1, 1, 1,
-0.3282622, -1.818107, -2.540082, 1, 1, 1, 1, 1,
-0.3269784, 0.4175031, -0.1069072, 1, 1, 1, 1, 1,
-0.3232601, -0.008605351, 0.5053309, 1, 1, 1, 1, 1,
-0.3227057, 0.6666846, -0.9715437, 1, 1, 1, 1, 1,
-0.3225862, 0.6508962, 0.3931295, 1, 1, 1, 1, 1,
-0.3224425, -0.2096556, -1.526005, 1, 1, 1, 1, 1,
-0.3193261, -1.309681, -2.481657, 1, 1, 1, 1, 1,
-0.3191841, 2.153733, 0.8621672, 1, 1, 1, 1, 1,
-0.3185435, 0.1459206, -0.5136616, 1, 1, 1, 1, 1,
-0.3179092, -1.71504, -2.369987, 1, 1, 1, 1, 1,
-0.3173791, 0.3473497, -0.4397075, 1, 1, 1, 1, 1,
-0.3170683, -0.2801725, -1.291656, 1, 1, 1, 1, 1,
-0.3170682, -1.692151, -1.800806, 1, 1, 1, 1, 1,
-0.3164555, -0.5571408, -3.648222, 0, 0, 1, 1, 1,
-0.3151276, -0.710628, -2.807948, 1, 0, 0, 1, 1,
-0.3133093, 1.506275, -0.3788594, 1, 0, 0, 1, 1,
-0.3112336, -0.4386555, -2.632952, 1, 0, 0, 1, 1,
-0.3104111, -0.2924595, -4.627652, 1, 0, 0, 1, 1,
-0.3074646, -0.8803958, -2.945864, 1, 0, 0, 1, 1,
-0.3022078, -0.07196276, -2.352412, 0, 0, 0, 1, 1,
-0.299762, 1.770785, -0.4724407, 0, 0, 0, 1, 1,
-0.2928845, -0.7574058, -3.549424, 0, 0, 0, 1, 1,
-0.2928625, -1.501314, -1.709483, 0, 0, 0, 1, 1,
-0.2923105, 1.808601, -0.7857904, 0, 0, 0, 1, 1,
-0.2898442, 1.349818, 0.366561, 0, 0, 0, 1, 1,
-0.2896745, 2.666137, 0.3239001, 0, 0, 0, 1, 1,
-0.2856829, -0.7558646, -3.312754, 1, 1, 1, 1, 1,
-0.2774344, 0.9550157, 1.079946, 1, 1, 1, 1, 1,
-0.2751522, -0.6975423, -3.856161, 1, 1, 1, 1, 1,
-0.2715963, 1.170172, -1.859344, 1, 1, 1, 1, 1,
-0.2682554, 1.066009, 0.3816831, 1, 1, 1, 1, 1,
-0.2681068, 0.3299226, -1.622792, 1, 1, 1, 1, 1,
-0.2675534, 0.5145621, -1.458728, 1, 1, 1, 1, 1,
-0.2669362, -0.4242765, -3.85934, 1, 1, 1, 1, 1,
-0.2625265, 0.7827251, 0.6528332, 1, 1, 1, 1, 1,
-0.2602727, 0.3576383, -0.02004196, 1, 1, 1, 1, 1,
-0.2596401, -1.672463, -4.088491, 1, 1, 1, 1, 1,
-0.2585497, 0.9540405, -2.247624, 1, 1, 1, 1, 1,
-0.2569695, 0.6648577, 1.898374, 1, 1, 1, 1, 1,
-0.2553616, 0.7120044, -1.754548, 1, 1, 1, 1, 1,
-0.254945, -0.9903343, -4.347077, 1, 1, 1, 1, 1,
-0.2516343, -1.184606, -3.354634, 0, 0, 1, 1, 1,
-0.2513925, -0.5688929, -1.993363, 1, 0, 0, 1, 1,
-0.2472629, -0.4239371, -2.073586, 1, 0, 0, 1, 1,
-0.2471253, 0.6938396, -0.5297827, 1, 0, 0, 1, 1,
-0.2466135, 0.0009294103, -1.207689, 1, 0, 0, 1, 1,
-0.245598, 0.9271317, -2.404371, 1, 0, 0, 1, 1,
-0.2448002, -0.4077232, -3.107726, 0, 0, 0, 1, 1,
-0.2340552, -0.2815173, -2.215197, 0, 0, 0, 1, 1,
-0.2322325, -0.8119777, -3.48353, 0, 0, 0, 1, 1,
-0.2321109, -0.5034432, -1.290719, 0, 0, 0, 1, 1,
-0.2289259, -0.284084, -1.08287, 0, 0, 0, 1, 1,
-0.2231168, -0.3451323, -4.274876, 0, 0, 0, 1, 1,
-0.2139663, -0.06310959, -2.607455, 0, 0, 0, 1, 1,
-0.2128522, -1.159961, -1.659803, 1, 1, 1, 1, 1,
-0.2083831, -0.6344324, -3.496461, 1, 1, 1, 1, 1,
-0.2079743, -0.2092585, -2.126216, 1, 1, 1, 1, 1,
-0.2077748, -0.104587, -1.95225, 1, 1, 1, 1, 1,
-0.2050454, -2.419999, -3.486657, 1, 1, 1, 1, 1,
-0.2041585, -0.937735, -1.911167, 1, 1, 1, 1, 1,
-0.204158, -0.4841052, -2.360627, 1, 1, 1, 1, 1,
-0.1990045, 0.2877052, -0.1196219, 1, 1, 1, 1, 1,
-0.1948117, -0.5751367, -4.420028, 1, 1, 1, 1, 1,
-0.1932687, 1.413053, -0.6644367, 1, 1, 1, 1, 1,
-0.1869871, -0.3986712, -3.576973, 1, 1, 1, 1, 1,
-0.1832388, -0.8211808, -3.955075, 1, 1, 1, 1, 1,
-0.1824082, 0.3140715, 1.360767, 1, 1, 1, 1, 1,
-0.176585, 1.647147, -2.193199, 1, 1, 1, 1, 1,
-0.1738524, 0.375516, -1.255502, 1, 1, 1, 1, 1,
-0.173339, -0.7668756, -2.167462, 0, 0, 1, 1, 1,
-0.172491, 0.03729085, -0.6041523, 1, 0, 0, 1, 1,
-0.1711595, -0.1436504, -1.662509, 1, 0, 0, 1, 1,
-0.1707358, -0.6881511, -2.553834, 1, 0, 0, 1, 1,
-0.1704982, 1.398234, 1.16141, 1, 0, 0, 1, 1,
-0.1658638, 0.2979729, -0.3634955, 1, 0, 0, 1, 1,
-0.1644964, 0.518073, -0.9639885, 0, 0, 0, 1, 1,
-0.1613145, 0.2950024, -1.552042, 0, 0, 0, 1, 1,
-0.1547519, 0.3844087, -1.698681, 0, 0, 0, 1, 1,
-0.1534099, 0.31996, -0.2233085, 0, 0, 0, 1, 1,
-0.1476463, -0.1098287, -2.064611, 0, 0, 0, 1, 1,
-0.1469397, 0.1048231, -0.4604258, 0, 0, 0, 1, 1,
-0.1463568, 0.05152837, -0.5488458, 0, 0, 0, 1, 1,
-0.1462393, 0.7228006, 0.5094819, 1, 1, 1, 1, 1,
-0.1446416, 1.160747, -0.6374544, 1, 1, 1, 1, 1,
-0.1439558, -0.7015488, -0.8309794, 1, 1, 1, 1, 1,
-0.1435542, 0.4500876, 0.7238029, 1, 1, 1, 1, 1,
-0.1427876, -1.162158, -1.886075, 1, 1, 1, 1, 1,
-0.1393494, -1.028465, -3.223575, 1, 1, 1, 1, 1,
-0.1382417, 0.6102998, -0.09086679, 1, 1, 1, 1, 1,
-0.1322446, 0.4855725, -1.149192, 1, 1, 1, 1, 1,
-0.1309756, 0.3040324, -1.293787, 1, 1, 1, 1, 1,
-0.1287182, -0.3361591, -3.927592, 1, 1, 1, 1, 1,
-0.1270551, 0.4948792, 0.08113626, 1, 1, 1, 1, 1,
-0.1260498, -1.712367, -3.940181, 1, 1, 1, 1, 1,
-0.1256225, -1.494809, -2.103092, 1, 1, 1, 1, 1,
-0.1247199, -0.9271979, -2.035413, 1, 1, 1, 1, 1,
-0.1246115, 0.1969676, -1.663207, 1, 1, 1, 1, 1,
-0.1244751, -2.30427, -4.811907, 0, 0, 1, 1, 1,
-0.1224376, 0.2853324, 0.7728945, 1, 0, 0, 1, 1,
-0.1198919, 0.2323778, -0.329257, 1, 0, 0, 1, 1,
-0.1158442, -0.2738076, -1.117453, 1, 0, 0, 1, 1,
-0.1142813, -0.715163, -2.441103, 1, 0, 0, 1, 1,
-0.1126008, 0.5588097, -0.6572957, 1, 0, 0, 1, 1,
-0.09935754, 0.5879725, -1.759519, 0, 0, 0, 1, 1,
-0.09676702, 0.4549153, -0.04744325, 0, 0, 0, 1, 1,
-0.09496453, -0.5223523, -4.169029, 0, 0, 0, 1, 1,
-0.08889335, 1.083098, -1.685407, 0, 0, 0, 1, 1,
-0.08770104, -0.4825591, -3.968199, 0, 0, 0, 1, 1,
-0.08479033, 1.38338, 0.9940209, 0, 0, 0, 1, 1,
-0.08247551, -1.463004, -4.045073, 0, 0, 0, 1, 1,
-0.08027805, 0.3661278, 1.606206, 1, 1, 1, 1, 1,
-0.07335231, -0.1928599, -4.49552, 1, 1, 1, 1, 1,
-0.0684405, 1.309999, -0.1844751, 1, 1, 1, 1, 1,
-0.0677411, -0.4838485, -3.150878, 1, 1, 1, 1, 1,
-0.06704023, -0.7601978, -3.373887, 1, 1, 1, 1, 1,
-0.06521653, -1.494803, -2.579614, 1, 1, 1, 1, 1,
-0.06513745, 1.356763, -1.76488, 1, 1, 1, 1, 1,
-0.05995568, -0.9892774, -2.80608, 1, 1, 1, 1, 1,
-0.05994258, -1.371074, -3.155017, 1, 1, 1, 1, 1,
-0.0573598, -1.356226, -4.238077, 1, 1, 1, 1, 1,
-0.05695628, 2.770059, 1.515084, 1, 1, 1, 1, 1,
-0.0568333, 0.2079361, -0.3895621, 1, 1, 1, 1, 1,
-0.05604737, 0.1559252, -1.35023, 1, 1, 1, 1, 1,
-0.05601467, -0.4874803, -2.834878, 1, 1, 1, 1, 1,
-0.05213767, -0.4880166, -2.750876, 1, 1, 1, 1, 1,
-0.04888831, -0.3067437, -4.153187, 0, 0, 1, 1, 1,
-0.04731198, 0.8260117, -2.595215, 1, 0, 0, 1, 1,
-0.04689606, 1.676029, -1.45318, 1, 0, 0, 1, 1,
-0.04655415, -0.007251788, -2.124027, 1, 0, 0, 1, 1,
-0.04540327, 0.9804302, 0.8594174, 1, 0, 0, 1, 1,
-0.04346432, -1.217866, -4.196985, 1, 0, 0, 1, 1,
-0.04079011, 0.8387398, -0.8088487, 0, 0, 0, 1, 1,
-0.03869089, -1.064892, -4.066397, 0, 0, 0, 1, 1,
-0.03853509, -0.59551, -4.044476, 0, 0, 0, 1, 1,
-0.0325208, 1.868473, -0.7613958, 0, 0, 0, 1, 1,
-0.03073021, 0.07352928, 0.1761808, 0, 0, 0, 1, 1,
-0.02871934, 0.1624809, -1.438446, 0, 0, 0, 1, 1,
-0.02713515, -1.014403, -4.463066, 0, 0, 0, 1, 1,
-0.02706992, 0.7360354, 0.8950109, 1, 1, 1, 1, 1,
-0.02585019, 0.3659494, -1.157474, 1, 1, 1, 1, 1,
-0.0254461, 0.52632, 1.832662, 1, 1, 1, 1, 1,
-0.02449152, 0.9068801, -0.3366818, 1, 1, 1, 1, 1,
-0.02187891, -0.504934, -2.093254, 1, 1, 1, 1, 1,
-0.01937255, -0.6014428, -3.272038, 1, 1, 1, 1, 1,
-0.01894828, -1.681951, -3.316283, 1, 1, 1, 1, 1,
-0.01798471, -0.2696468, -3.93962, 1, 1, 1, 1, 1,
-0.01711197, 0.8141363, -0.833611, 1, 1, 1, 1, 1,
-0.0162678, -0.4106152, -3.305202, 1, 1, 1, 1, 1,
-0.00941696, 0.2367577, -2.184942, 1, 1, 1, 1, 1,
-0.008206772, -0.121122, -1.217708, 1, 1, 1, 1, 1,
-0.005848528, 1.275827, 0.215821, 1, 1, 1, 1, 1,
-0.002434483, 1.1714, 1.020129, 1, 1, 1, 1, 1,
0.000719471, 1.098583, 0.7084052, 1, 1, 1, 1, 1,
0.001018016, 0.4203258, -0.7571818, 0, 0, 1, 1, 1,
0.003015317, 1.149252, 1.258555, 1, 0, 0, 1, 1,
0.006516773, -1.4288, 2.594232, 1, 0, 0, 1, 1,
0.01214282, 0.5571057, 0.3317758, 1, 0, 0, 1, 1,
0.01604176, -0.1800182, 3.87222, 1, 0, 0, 1, 1,
0.01750386, 0.08353762, 0.2539259, 1, 0, 0, 1, 1,
0.02105817, 1.540244, 0.9128612, 0, 0, 0, 1, 1,
0.02142987, -0.2947307, 2.531659, 0, 0, 0, 1, 1,
0.02279007, 0.8382128, 0.3226687, 0, 0, 0, 1, 1,
0.02749553, 1.089502, -0.551734, 0, 0, 0, 1, 1,
0.02837988, -0.7038757, 5.750876, 0, 0, 0, 1, 1,
0.02847019, -0.9671488, 2.631537, 0, 0, 0, 1, 1,
0.02991907, 1.026906, 1.290083, 0, 0, 0, 1, 1,
0.03038895, -1.244434, 2.222736, 1, 1, 1, 1, 1,
0.03105765, 0.4722464, -0.5947067, 1, 1, 1, 1, 1,
0.03169363, -1.071262, 2.63888, 1, 1, 1, 1, 1,
0.04259839, 0.3139977, 0.7210698, 1, 1, 1, 1, 1,
0.0464489, 1.824202, 0.9912621, 1, 1, 1, 1, 1,
0.04998863, 0.687282, -0.5862334, 1, 1, 1, 1, 1,
0.05443255, 0.7812054, -1.326945, 1, 1, 1, 1, 1,
0.0606631, 0.2461514, 1.080115, 1, 1, 1, 1, 1,
0.06120683, -0.987662, 2.448869, 1, 1, 1, 1, 1,
0.06831178, 0.8119203, 0.6076687, 1, 1, 1, 1, 1,
0.06871375, 0.6201788, 0.01320365, 1, 1, 1, 1, 1,
0.06977597, -0.265585, 2.500591, 1, 1, 1, 1, 1,
0.07375847, -0.5721952, 3.767364, 1, 1, 1, 1, 1,
0.07806469, 0.01961593, -0.4591304, 1, 1, 1, 1, 1,
0.0800743, -1.833688, 3.138718, 1, 1, 1, 1, 1,
0.08166397, 0.2193983, 0.5257254, 0, 0, 1, 1, 1,
0.08382478, 0.4588512, 0.5066143, 1, 0, 0, 1, 1,
0.08540063, -0.8733885, 4.085079, 1, 0, 0, 1, 1,
0.08781787, -0.5244082, 2.707027, 1, 0, 0, 1, 1,
0.08796705, -1.855665, 2.541368, 1, 0, 0, 1, 1,
0.09003178, 0.7179173, -1.428553, 1, 0, 0, 1, 1,
0.09336846, 0.45657, 1.894319, 0, 0, 0, 1, 1,
0.09515756, -0.76157, 1.808298, 0, 0, 0, 1, 1,
0.09707084, 1.760397, 1.047317, 0, 0, 0, 1, 1,
0.1001683, -1.200536, 0.5056928, 0, 0, 0, 1, 1,
0.10096, -0.1271467, 2.206009, 0, 0, 0, 1, 1,
0.108481, 0.8187748, -0.2214718, 0, 0, 0, 1, 1,
0.1095972, -0.0630191, 3.796111, 0, 0, 0, 1, 1,
0.1103201, 0.7462348, -1.900454, 1, 1, 1, 1, 1,
0.1154284, -1.955892, 3.19175, 1, 1, 1, 1, 1,
0.1161992, -1.247748, 2.60767, 1, 1, 1, 1, 1,
0.1188411, 5.321829, 1.114231, 1, 1, 1, 1, 1,
0.127434, 0.7200141, -1.084978, 1, 1, 1, 1, 1,
0.1285904, 0.3856898, -0.262552, 1, 1, 1, 1, 1,
0.1312975, -0.3924987, 2.050589, 1, 1, 1, 1, 1,
0.1324786, 0.8708627, 0.5955157, 1, 1, 1, 1, 1,
0.1327157, 0.8432537, -0.1695547, 1, 1, 1, 1, 1,
0.1353306, -0.05394157, 2.249864, 1, 1, 1, 1, 1,
0.1379721, 0.1909006, 0.9553878, 1, 1, 1, 1, 1,
0.138751, 0.4635865, -0.05842239, 1, 1, 1, 1, 1,
0.1401052, -0.5816799, 3.024784, 1, 1, 1, 1, 1,
0.1414121, -0.7906566, 1.25705, 1, 1, 1, 1, 1,
0.1441925, 1.296161, -1.249499, 1, 1, 1, 1, 1,
0.146374, 0.2880751, 0.56356, 0, 0, 1, 1, 1,
0.1513189, 1.509893, 0.5579484, 1, 0, 0, 1, 1,
0.1516173, -0.08018051, 2.727376, 1, 0, 0, 1, 1,
0.1562628, -0.3596504, 2.202256, 1, 0, 0, 1, 1,
0.1589782, 0.3144016, 0.6492394, 1, 0, 0, 1, 1,
0.1624053, -0.06936425, 3.254125, 1, 0, 0, 1, 1,
0.1651477, 0.3734075, -0.09014994, 0, 0, 0, 1, 1,
0.1680703, 0.4580444, 1.115311, 0, 0, 0, 1, 1,
0.172657, 0.2012171, 0.4939665, 0, 0, 0, 1, 1,
0.1778817, -1.325437, 2.714596, 0, 0, 0, 1, 1,
0.1804361, -0.6362012, 1.898285, 0, 0, 0, 1, 1,
0.1814476, -1.298952, 2.102374, 0, 0, 0, 1, 1,
0.1816663, 1.100278, 1.293707, 0, 0, 0, 1, 1,
0.1817518, -0.7614472, 4.559557, 1, 1, 1, 1, 1,
0.1855406, -0.9646907, 3.474305, 1, 1, 1, 1, 1,
0.1889059, -0.3246263, 2.248249, 1, 1, 1, 1, 1,
0.1940466, 1.516772, 1.895591, 1, 1, 1, 1, 1,
0.1999302, 2.020375, 1.805944, 1, 1, 1, 1, 1,
0.2032458, 0.9086041, -0.2803048, 1, 1, 1, 1, 1,
0.2067022, -1.439889, 4.259477, 1, 1, 1, 1, 1,
0.209763, -1.145106, 2.410863, 1, 1, 1, 1, 1,
0.2102544, -1.100905, 4.005116, 1, 1, 1, 1, 1,
0.211392, 0.6229616, -0.7635922, 1, 1, 1, 1, 1,
0.2116559, 0.4493538, 0.4234968, 1, 1, 1, 1, 1,
0.2125184, 0.5010383, 1.067973, 1, 1, 1, 1, 1,
0.2135363, -0.6174101, 1.945839, 1, 1, 1, 1, 1,
0.2166614, -1.610615, 2.066813, 1, 1, 1, 1, 1,
0.2194713, -2.407724, 4.093149, 1, 1, 1, 1, 1,
0.2199394, -0.9498386, 3.547004, 0, 0, 1, 1, 1,
0.221043, 0.871331, -1.792158, 1, 0, 0, 1, 1,
0.2217915, -0.12074, 1.777026, 1, 0, 0, 1, 1,
0.2241545, 0.04884293, 0.01222795, 1, 0, 0, 1, 1,
0.2262149, -0.2522152, 1.220801, 1, 0, 0, 1, 1,
0.2295823, 0.08401293, 2.407694, 1, 0, 0, 1, 1,
0.2296973, 0.3112442, -0.3553586, 0, 0, 0, 1, 1,
0.2301822, 1.011574, -0.2891923, 0, 0, 0, 1, 1,
0.230255, -1.401986, 2.125005, 0, 0, 0, 1, 1,
0.2313871, 0.1653496, 1.294271, 0, 0, 0, 1, 1,
0.2354294, 1.080934, -0.2674253, 0, 0, 0, 1, 1,
0.2369994, -0.4022979, 2.793311, 0, 0, 0, 1, 1,
0.238053, 1.144291, 0.808041, 0, 0, 0, 1, 1,
0.2397755, 0.4761083, -1.555017, 1, 1, 1, 1, 1,
0.2455824, -2.459361, 3.229936, 1, 1, 1, 1, 1,
0.2463524, -1.769733, 1.830781, 1, 1, 1, 1, 1,
0.2535675, -0.3384592, 2.615436, 1, 1, 1, 1, 1,
0.2537612, -1.817458, 2.723506, 1, 1, 1, 1, 1,
0.2585798, -1.382958, 2.000548, 1, 1, 1, 1, 1,
0.2645466, -0.9699892, 3.259418, 1, 1, 1, 1, 1,
0.2683623, -0.4177229, 2.088098, 1, 1, 1, 1, 1,
0.2698941, 0.2770736, 0.4965803, 1, 1, 1, 1, 1,
0.2699707, 0.7710715, -0.3432013, 1, 1, 1, 1, 1,
0.2704979, -0.01252188, 2.422715, 1, 1, 1, 1, 1,
0.2710779, -0.05942729, 0.4949018, 1, 1, 1, 1, 1,
0.2793124, 0.5790387, 1.297068, 1, 1, 1, 1, 1,
0.2913157, -0.7242062, 4.21899, 1, 1, 1, 1, 1,
0.3002633, -0.5543861, 2.236626, 1, 1, 1, 1, 1,
0.3059943, -0.2373733, 1.964916, 0, 0, 1, 1, 1,
0.3083234, -0.3464472, 2.484519, 1, 0, 0, 1, 1,
0.3097654, -0.1343402, 4.216823, 1, 0, 0, 1, 1,
0.3098166, -1.728935, 1.415444, 1, 0, 0, 1, 1,
0.3126075, 1.406843, 0.7220984, 1, 0, 0, 1, 1,
0.3189367, -0.7311224, 3.92088, 1, 0, 0, 1, 1,
0.3196346, -1.42514, 3.494767, 0, 0, 0, 1, 1,
0.3276531, -0.7570443, 2.617598, 0, 0, 0, 1, 1,
0.3300926, -1.095308, 2.787161, 0, 0, 0, 1, 1,
0.3366601, -0.6820005, 3.980506, 0, 0, 0, 1, 1,
0.3383303, 0.7151135, 1.062796, 0, 0, 0, 1, 1,
0.3400898, -3.080729, 4.183276, 0, 0, 0, 1, 1,
0.3403856, 0.2343239, 1.380371, 0, 0, 0, 1, 1,
0.343088, 0.7652918, 0.9521866, 1, 1, 1, 1, 1,
0.3440564, -0.5152885, 0.9198244, 1, 1, 1, 1, 1,
0.3480256, -1.885614, 1.261245, 1, 1, 1, 1, 1,
0.3503365, 0.1281965, 2.263034, 1, 1, 1, 1, 1,
0.351054, -1.320409, 2.125325, 1, 1, 1, 1, 1,
0.3571059, -0.5457492, 3.122682, 1, 1, 1, 1, 1,
0.3578999, -0.6973021, 2.846361, 1, 1, 1, 1, 1,
0.3715301, 0.9508864, 0.7613457, 1, 1, 1, 1, 1,
0.3730336, 0.5923759, 0.8011208, 1, 1, 1, 1, 1,
0.3764057, -1.103639, 3.902003, 1, 1, 1, 1, 1,
0.3804642, 0.7409825, 0.1991758, 1, 1, 1, 1, 1,
0.3845277, 1.73344, 1.426029, 1, 1, 1, 1, 1,
0.3846067, 1.504455, -0.03437717, 1, 1, 1, 1, 1,
0.3907052, 0.08173928, 0.6629148, 1, 1, 1, 1, 1,
0.3925308, 0.5173488, 0.2570769, 1, 1, 1, 1, 1,
0.3950032, 0.1856101, 1.548772, 0, 0, 1, 1, 1,
0.4034928, 0.2774157, 0.9049497, 1, 0, 0, 1, 1,
0.4048966, 0.4158104, 1.21822, 1, 0, 0, 1, 1,
0.4108939, 1.496373, 1.752946, 1, 0, 0, 1, 1,
0.4110486, 0.2163741, 1.661281, 1, 0, 0, 1, 1,
0.4193621, 1.767387, -0.04630074, 1, 0, 0, 1, 1,
0.419803, 0.4051682, 1.097753, 0, 0, 0, 1, 1,
0.4218043, -0.01686995, 1.691027, 0, 0, 0, 1, 1,
0.4249743, 1.923061, 0.6212258, 0, 0, 0, 1, 1,
0.4315775, 0.3828776, 0.7371495, 0, 0, 0, 1, 1,
0.4335799, 0.1203728, 1.598669, 0, 0, 0, 1, 1,
0.4344636, -1.332508, 0.6831605, 0, 0, 0, 1, 1,
0.4347108, 1.050437, 1.148027, 0, 0, 0, 1, 1,
0.4473784, 0.8933423, 0.9212371, 1, 1, 1, 1, 1,
0.4493418, -2.454066, 2.847679, 1, 1, 1, 1, 1,
0.4555184, -0.8140658, 2.752486, 1, 1, 1, 1, 1,
0.459785, -0.3835577, 1.41026, 1, 1, 1, 1, 1,
0.4600481, -0.9265333, 3.442104, 1, 1, 1, 1, 1,
0.4623524, -1.19327, 2.442847, 1, 1, 1, 1, 1,
0.4631183, -0.1652142, 1.283436, 1, 1, 1, 1, 1,
0.464889, -1.39044, 3.106704, 1, 1, 1, 1, 1,
0.4651497, -0.3121108, 3.281605, 1, 1, 1, 1, 1,
0.4657471, -0.08943982, 0.8710635, 1, 1, 1, 1, 1,
0.4725419, 0.1770717, 1.218253, 1, 1, 1, 1, 1,
0.4738108, -0.6088084, 2.815427, 1, 1, 1, 1, 1,
0.474254, -1.422784, 3.384938, 1, 1, 1, 1, 1,
0.4768245, 1.474402, 0.8109915, 1, 1, 1, 1, 1,
0.4775731, 0.3203298, 0.6671677, 1, 1, 1, 1, 1,
0.477656, 1.15337, -1.200908, 0, 0, 1, 1, 1,
0.4816519, 0.9268335, 0.1636943, 1, 0, 0, 1, 1,
0.4836856, 0.4426669, 0.5951698, 1, 0, 0, 1, 1,
0.4843964, -1.384381, 1.610927, 1, 0, 0, 1, 1,
0.4844291, 1.569465, -0.3424971, 1, 0, 0, 1, 1,
0.4852721, 0.1913602, 0.2395426, 1, 0, 0, 1, 1,
0.4903603, -0.4127905, 3.832165, 0, 0, 0, 1, 1,
0.5036042, 1.354348, -0.1957365, 0, 0, 0, 1, 1,
0.5053031, -2.038729, 1.286363, 0, 0, 0, 1, 1,
0.5053898, -0.03200161, 2.289328, 0, 0, 0, 1, 1,
0.5074958, 0.306058, 2.017618, 0, 0, 0, 1, 1,
0.5082036, 0.1772235, -0.1881407, 0, 0, 0, 1, 1,
0.5083706, 1.572244, 1.064418, 0, 0, 0, 1, 1,
0.5112236, -2.020404, 3.016366, 1, 1, 1, 1, 1,
0.5160575, -0.9575328, 1.821803, 1, 1, 1, 1, 1,
0.5201478, 0.7068572, -0.9911759, 1, 1, 1, 1, 1,
0.5201973, -0.8981652, 1.634018, 1, 1, 1, 1, 1,
0.5267323, -0.9375994, 5.015731, 1, 1, 1, 1, 1,
0.5297827, 0.0303371, 0.3247519, 1, 1, 1, 1, 1,
0.5334619, -1.011936, 3.086441, 1, 1, 1, 1, 1,
0.5348668, -0.2191375, 1.542091, 1, 1, 1, 1, 1,
0.5364717, 1.594373, 1.993775, 1, 1, 1, 1, 1,
0.536771, 0.5108792, 0.8230366, 1, 1, 1, 1, 1,
0.5387611, 0.06531801, 3.648355, 1, 1, 1, 1, 1,
0.5390564, -0.2644607, 1.571043, 1, 1, 1, 1, 1,
0.5400912, 0.5296947, -0.2495183, 1, 1, 1, 1, 1,
0.5403191, 1.511804, -0.3532785, 1, 1, 1, 1, 1,
0.5415352, -1.012027, 2.294084, 1, 1, 1, 1, 1,
0.5435785, -0.4319262, 2.487524, 0, 0, 1, 1, 1,
0.5442205, 0.5310637, 1.656517, 1, 0, 0, 1, 1,
0.5485908, 0.5060008, 0.1568325, 1, 0, 0, 1, 1,
0.552319, 1.328459, 0.3622534, 1, 0, 0, 1, 1,
0.5560161, -2.088093, 3.326738, 1, 0, 0, 1, 1,
0.5612519, 0.3220961, 2.162003, 1, 0, 0, 1, 1,
0.5639321, -0.5941771, 1.357971, 0, 0, 0, 1, 1,
0.5720381, -1.826774, 2.926301, 0, 0, 0, 1, 1,
0.5735385, 0.3230703, 1.616201, 0, 0, 0, 1, 1,
0.574084, 1.169132, 1.701356, 0, 0, 0, 1, 1,
0.5742498, -0.6663461, 3.36866, 0, 0, 0, 1, 1,
0.5763034, 0.1731246, 1.404576, 0, 0, 0, 1, 1,
0.57755, -0.1037961, 1.757825, 0, 0, 0, 1, 1,
0.5842239, 0.09232284, -0.7801274, 1, 1, 1, 1, 1,
0.585366, -0.09988485, 1.277306, 1, 1, 1, 1, 1,
0.5871524, 0.5904472, 0.9296907, 1, 1, 1, 1, 1,
0.5878744, -0.9641168, 1.438342, 1, 1, 1, 1, 1,
0.5924788, 1.532766, -0.2793632, 1, 1, 1, 1, 1,
0.597567, -0.9245532, 0.6752306, 1, 1, 1, 1, 1,
0.6038078, -1.54324, 2.226721, 1, 1, 1, 1, 1,
0.6096148, -0.2825702, 4.565392, 1, 1, 1, 1, 1,
0.6123626, 0.8859025, 0.4509055, 1, 1, 1, 1, 1,
0.6136621, 0.7564867, 0.3537229, 1, 1, 1, 1, 1,
0.6145936, -0.4631515, 2.206983, 1, 1, 1, 1, 1,
0.6150962, -0.4636464, 0.5241483, 1, 1, 1, 1, 1,
0.6167527, 1.902856, 0.4232091, 1, 1, 1, 1, 1,
0.6197735, 0.2353556, 0.2876223, 1, 1, 1, 1, 1,
0.6206672, -1.196946, 3.788337, 1, 1, 1, 1, 1,
0.62143, 0.01933628, 1.058273, 0, 0, 1, 1, 1,
0.6271316, -0.1310839, 2.165532, 1, 0, 0, 1, 1,
0.6280767, 2.02783, 1.669201, 1, 0, 0, 1, 1,
0.6342933, 1.416283, -0.03303915, 1, 0, 0, 1, 1,
0.6356621, 0.177002, 0.7538775, 1, 0, 0, 1, 1,
0.6357402, 1.228722, -0.7824239, 1, 0, 0, 1, 1,
0.6451904, -2.050104, 2.747251, 0, 0, 0, 1, 1,
0.6468453, -0.3849015, 2.680794, 0, 0, 0, 1, 1,
0.6482036, -0.4255533, 3.554394, 0, 0, 0, 1, 1,
0.649273, -0.8061046, 2.681219, 0, 0, 0, 1, 1,
0.656184, 1.11238, -0.002592145, 0, 0, 0, 1, 1,
0.6595766, 1.293902, 0.4676911, 0, 0, 0, 1, 1,
0.6664801, 0.5299557, 1.194558, 0, 0, 0, 1, 1,
0.6718811, 0.6696852, 1.704224, 1, 1, 1, 1, 1,
0.6969391, -0.1785112, 2.382965, 1, 1, 1, 1, 1,
0.697699, -3.122683, 3.48771, 1, 1, 1, 1, 1,
0.7017698, 0.8792533, -0.2931589, 1, 1, 1, 1, 1,
0.70604, -0.4600896, 2.168455, 1, 1, 1, 1, 1,
0.7072369, -2.032902, 3.367224, 1, 1, 1, 1, 1,
0.7091884, -0.6569502, 2.473834, 1, 1, 1, 1, 1,
0.7100952, 0.1104343, 0.818431, 1, 1, 1, 1, 1,
0.710906, -1.692826, 4.040521, 1, 1, 1, 1, 1,
0.7118665, -0.1869689, 2.169368, 1, 1, 1, 1, 1,
0.7220677, -0.1387829, 1.504257, 1, 1, 1, 1, 1,
0.7247299, 0.04876389, 1.424164, 1, 1, 1, 1, 1,
0.7326623, 0.7801184, 1.428884, 1, 1, 1, 1, 1,
0.7328764, -0.5357077, 3.343025, 1, 1, 1, 1, 1,
0.7334564, 0.1912641, 1.431355, 1, 1, 1, 1, 1,
0.7335922, 0.2181717, 3.146069, 0, 0, 1, 1, 1,
0.7397701, -0.4580183, 2.274654, 1, 0, 0, 1, 1,
0.7413679, -0.5333337, 1.717013, 1, 0, 0, 1, 1,
0.7439435, -0.6208683, 1.409961, 1, 0, 0, 1, 1,
0.7443704, -1.771704, 1.042807, 1, 0, 0, 1, 1,
0.7449213, 0.8333854, 1.766608, 1, 0, 0, 1, 1,
0.7472833, -0.8580667, 3.531491, 0, 0, 0, 1, 1,
0.7549633, 0.9543362, 1.09097, 0, 0, 0, 1, 1,
0.7574264, -0.004574588, -0.09538434, 0, 0, 0, 1, 1,
0.7668514, -0.7119185, 1.246474, 0, 0, 0, 1, 1,
0.7770111, -0.07314125, 2.91934, 0, 0, 0, 1, 1,
0.7855028, 0.9044563, -0.03261017, 0, 0, 0, 1, 1,
0.7977476, 3.329672, 1.149546, 0, 0, 0, 1, 1,
0.8018577, 0.8511224, 0.1282053, 1, 1, 1, 1, 1,
0.8022867, 0.8264169, -1.195903, 1, 1, 1, 1, 1,
0.8037345, -0.9113985, 1.134467, 1, 1, 1, 1, 1,
0.8083018, 1.729661, 1.173077, 1, 1, 1, 1, 1,
0.8112414, -1.192626, 1.988017, 1, 1, 1, 1, 1,
0.8131446, -1.251756, 0.5098768, 1, 1, 1, 1, 1,
0.8183857, 0.3939386, 0.5975128, 1, 1, 1, 1, 1,
0.8189048, 0.5412232, 0.66959, 1, 1, 1, 1, 1,
0.8289105, -0.0302923, 2.348499, 1, 1, 1, 1, 1,
0.829419, 0.9589765, 2.855273, 1, 1, 1, 1, 1,
0.8322253, -0.4067946, 0.9138716, 1, 1, 1, 1, 1,
0.8324805, -1.807444, 2.443415, 1, 1, 1, 1, 1,
0.8398623, -1.50386, 3.978126, 1, 1, 1, 1, 1,
0.8413412, 1.780393, 1.184855, 1, 1, 1, 1, 1,
0.8497939, -0.3171237, 1.646194, 1, 1, 1, 1, 1,
0.8539121, 0.5550897, 0.9850255, 0, 0, 1, 1, 1,
0.8544825, 0.7907677, -0.1630102, 1, 0, 0, 1, 1,
0.8604093, 1.026539, 0.644286, 1, 0, 0, 1, 1,
0.861378, -1.870634, 0.8130625, 1, 0, 0, 1, 1,
0.8642446, 0.1920178, -0.01449807, 1, 0, 0, 1, 1,
0.8667496, 0.1941323, -0.03417589, 1, 0, 0, 1, 1,
0.8709711, -1.396842, 3.004431, 0, 0, 0, 1, 1,
0.8718832, -1.055081, 1.129939, 0, 0, 0, 1, 1,
0.8730046, 1.249531, 0.08459435, 0, 0, 0, 1, 1,
0.8743271, -0.7163932, 3.649868, 0, 0, 0, 1, 1,
0.8754448, 1.734436, 0.9139966, 0, 0, 0, 1, 1,
0.8781301, 1.467216, 0.6663879, 0, 0, 0, 1, 1,
0.8908036, 0.6239652, 0.06492992, 0, 0, 0, 1, 1,
0.8910601, 0.2450198, -0.2176817, 1, 1, 1, 1, 1,
0.8941284, 1.528236, -0.1446691, 1, 1, 1, 1, 1,
0.8953928, 0.4014753, 3.506737, 1, 1, 1, 1, 1,
0.8987338, -1.222235, 2.362182, 1, 1, 1, 1, 1,
0.9029709, 1.82069, 0.5038383, 1, 1, 1, 1, 1,
0.9080518, -0.503419, 3.620953, 1, 1, 1, 1, 1,
0.917622, -1.679753, 3.218269, 1, 1, 1, 1, 1,
0.9207065, -0.02661199, 2.779108, 1, 1, 1, 1, 1,
0.9254233, 0.1974823, 2.948219, 1, 1, 1, 1, 1,
0.9334392, -1.400032, 1.025142, 1, 1, 1, 1, 1,
0.9377332, -1.952962, 3.633195, 1, 1, 1, 1, 1,
0.9388599, -0.168458, 1.35758, 1, 1, 1, 1, 1,
0.9540492, 0.8308556, 2.382452, 1, 1, 1, 1, 1,
0.9542465, -0.8571429, 2.811322, 1, 1, 1, 1, 1,
0.9591043, -0.9499969, 1.968301, 1, 1, 1, 1, 1,
0.9654796, 0.5496708, 2.011274, 0, 0, 1, 1, 1,
0.9777943, 0.1014357, 1.24697, 1, 0, 0, 1, 1,
0.9911964, -1.135589, 2.695032, 1, 0, 0, 1, 1,
0.9970861, 1.514297, 0.1486505, 1, 0, 0, 1, 1,
0.9981802, -0.01611286, 0.2147816, 1, 0, 0, 1, 1,
1.003144, -1.667452, 3.902368, 1, 0, 0, 1, 1,
1.003162, 1.495687, -0.7927428, 0, 0, 0, 1, 1,
1.003665, 0.3388028, 0.9177287, 0, 0, 0, 1, 1,
1.004716, -0.3221401, 3.11582, 0, 0, 0, 1, 1,
1.005943, -1.147842, 1.092759, 0, 0, 0, 1, 1,
1.00823, -2.01385, 2.783882, 0, 0, 0, 1, 1,
1.021481, 1.296919, 0.3444794, 0, 0, 0, 1, 1,
1.027697, -0.3586484, 1.818526, 0, 0, 0, 1, 1,
1.030038, -0.2033101, 0.9500932, 1, 1, 1, 1, 1,
1.033376, 1.222131, 1.405989, 1, 1, 1, 1, 1,
1.033436, 0.7858261, 0.3638775, 1, 1, 1, 1, 1,
1.035091, -0.5198219, 1.713969, 1, 1, 1, 1, 1,
1.035312, 1.476232, 1.685284, 1, 1, 1, 1, 1,
1.03533, -1.091313, 3.309677, 1, 1, 1, 1, 1,
1.044859, 0.7203873, -0.5180799, 1, 1, 1, 1, 1,
1.048574, -0.1433572, 3.086392, 1, 1, 1, 1, 1,
1.053321, -0.3539419, 0.7693567, 1, 1, 1, 1, 1,
1.054978, -2.050816, 2.263372, 1, 1, 1, 1, 1,
1.056522, -0.08956115, 2.876754, 1, 1, 1, 1, 1,
1.057045, -0.1399299, 0.497745, 1, 1, 1, 1, 1,
1.059285, 1.91808, 0.2017909, 1, 1, 1, 1, 1,
1.064366, 0.643176, 0.9271545, 1, 1, 1, 1, 1,
1.070172, -0.4507056, 1.889924, 1, 1, 1, 1, 1,
1.075037, -0.3572305, 1.922529, 0, 0, 1, 1, 1,
1.080412, -1.038172, 1.34963, 1, 0, 0, 1, 1,
1.081282, -0.4628304, 0.5035561, 1, 0, 0, 1, 1,
1.085402, 0.09096824, 0.08137611, 1, 0, 0, 1, 1,
1.095802, 0.716778, 1.131522, 1, 0, 0, 1, 1,
1.097703, 0.5672883, -0.4418064, 1, 0, 0, 1, 1,
1.107572, 1.120988, 1.455428, 0, 0, 0, 1, 1,
1.10865, 0.5329112, 2.46589, 0, 0, 0, 1, 1,
1.11059, -0.7326176, 1.080435, 0, 0, 0, 1, 1,
1.11164, 0.4559186, 0.6515378, 0, 0, 0, 1, 1,
1.122554, 0.263552, 0.356472, 0, 0, 0, 1, 1,
1.127447, -1.941709, 2.126235, 0, 0, 0, 1, 1,
1.127645, 1.007807, -1.422763, 0, 0, 0, 1, 1,
1.13388, 1.017348, 1.05886, 1, 1, 1, 1, 1,
1.142704, 2.222093, 0.8271529, 1, 1, 1, 1, 1,
1.142742, -1.222699, 4.332359, 1, 1, 1, 1, 1,
1.142807, 0.3575951, 1.029686, 1, 1, 1, 1, 1,
1.146955, -1.22715, 0.02490679, 1, 1, 1, 1, 1,
1.167838, -1.208839, 3.085146, 1, 1, 1, 1, 1,
1.17074, -0.1420773, 1.424686, 1, 1, 1, 1, 1,
1.171203, -0.6871784, 0.2314963, 1, 1, 1, 1, 1,
1.172066, -0.8957509, 3.385739, 1, 1, 1, 1, 1,
1.172422, 1.498422, 0.9350038, 1, 1, 1, 1, 1,
1.186058, -0.6657419, 1.110439, 1, 1, 1, 1, 1,
1.188657, -1.14369, 3.508264, 1, 1, 1, 1, 1,
1.199195, 0.9758446, 2.401025, 1, 1, 1, 1, 1,
1.199522, 0.4537616, -0.5294986, 1, 1, 1, 1, 1,
1.201766, 0.6325125, 1.640455, 1, 1, 1, 1, 1,
1.204607, 1.607555, 1.686457, 0, 0, 1, 1, 1,
1.20804, 0.01069349, 1.181494, 1, 0, 0, 1, 1,
1.218148, -0.2785328, 2.032993, 1, 0, 0, 1, 1,
1.21947, -0.6130788, 1.288575, 1, 0, 0, 1, 1,
1.2219, -0.2347819, 1.764759, 1, 0, 0, 1, 1,
1.227151, -0.08537617, 2.666089, 1, 0, 0, 1, 1,
1.237712, -0.6629748, 3.359112, 0, 0, 0, 1, 1,
1.239019, 0.5834875, 0.9987062, 0, 0, 0, 1, 1,
1.248618, 0.8770854, -0.3008497, 0, 0, 0, 1, 1,
1.254723, 1.364194, 2.372898, 0, 0, 0, 1, 1,
1.255203, -2.017936, 1.823856, 0, 0, 0, 1, 1,
1.256938, -0.7026337, 1.746188, 0, 0, 0, 1, 1,
1.259324, 0.9789118, 1.259619, 0, 0, 0, 1, 1,
1.265598, -0.569388, 1.630778, 1, 1, 1, 1, 1,
1.267483, -0.8553437, 1.717493, 1, 1, 1, 1, 1,
1.272472, -0.0736676, 1.28109, 1, 1, 1, 1, 1,
1.290143, -0.3553389, 2.529473, 1, 1, 1, 1, 1,
1.291601, -0.4272185, 1.548691, 1, 1, 1, 1, 1,
1.292678, -0.4251304, 1.948886, 1, 1, 1, 1, 1,
1.29336, -0.1723173, 0.7947254, 1, 1, 1, 1, 1,
1.296611, -0.4033497, 1.275605, 1, 1, 1, 1, 1,
1.301037, -0.7034773, 1.948018, 1, 1, 1, 1, 1,
1.305106, -1.084352, 1.899423, 1, 1, 1, 1, 1,
1.315536, -1.742613, 4.287582, 1, 1, 1, 1, 1,
1.329031, -0.1858349, 3.087171, 1, 1, 1, 1, 1,
1.344336, -0.3339995, 0.9969917, 1, 1, 1, 1, 1,
1.344474, 0.4393944, 1.156599, 1, 1, 1, 1, 1,
1.345752, 0.1909346, 0.7682827, 1, 1, 1, 1, 1,
1.346436, 1.253868, -0.03120047, 0, 0, 1, 1, 1,
1.350912, -0.9115685, 1.949636, 1, 0, 0, 1, 1,
1.3566, 1.244664, -1.24788, 1, 0, 0, 1, 1,
1.360608, 1.522907, 0.8037226, 1, 0, 0, 1, 1,
1.37669, -0.5928762, 1.932752, 1, 0, 0, 1, 1,
1.3851, -1.456218, 1.813545, 1, 0, 0, 1, 1,
1.39619, -1.043794, 1.581495, 0, 0, 0, 1, 1,
1.41979, -0.4175299, 2.006588, 0, 0, 0, 1, 1,
1.424613, 0.9683237, 1.161809, 0, 0, 0, 1, 1,
1.430494, -0.4472905, 2.227335, 0, 0, 0, 1, 1,
1.432237, 0.9677061, -0.09240797, 0, 0, 0, 1, 1,
1.432774, -1.695535, 4.021463, 0, 0, 0, 1, 1,
1.434276, -0.6088725, 2.548018, 0, 0, 0, 1, 1,
1.438144, 0.758075, -0.5627286, 1, 1, 1, 1, 1,
1.444313, 0.7435418, 1.755996, 1, 1, 1, 1, 1,
1.449093, 2.978488, 1.402139, 1, 1, 1, 1, 1,
1.450947, 0.6692665, 1.687676, 1, 1, 1, 1, 1,
1.451582, 1.503792, 0.8298851, 1, 1, 1, 1, 1,
1.458747, -0.1547099, 1.012479, 1, 1, 1, 1, 1,
1.463666, -0.3041774, 1.331681, 1, 1, 1, 1, 1,
1.476314, 0.9155844, 0.5250708, 1, 1, 1, 1, 1,
1.479322, -0.2796936, 1.980176, 1, 1, 1, 1, 1,
1.491275, -1.439485, 3.28125, 1, 1, 1, 1, 1,
1.497332, -0.9454862, -1.275425, 1, 1, 1, 1, 1,
1.498639, 0.7644066, -1.057223, 1, 1, 1, 1, 1,
1.518639, -1.111027, 1.730958, 1, 1, 1, 1, 1,
1.534973, 2.359707, 0.8943437, 1, 1, 1, 1, 1,
1.535437, 1.001008, 0.8269098, 1, 1, 1, 1, 1,
1.549514, 0.5191332, 1.012422, 0, 0, 1, 1, 1,
1.550436, -0.1638364, 2.44776, 1, 0, 0, 1, 1,
1.555659, -0.7133084, 1.609234, 1, 0, 0, 1, 1,
1.558516, 0.4103731, 1.402675, 1, 0, 0, 1, 1,
1.559174, 0.6705084, 2.250338, 1, 0, 0, 1, 1,
1.5618, -0.5624743, 2.53291, 1, 0, 0, 1, 1,
1.562122, 0.1265584, 2.27704, 0, 0, 0, 1, 1,
1.581045, -0.003642648, 1.253796, 0, 0, 0, 1, 1,
1.595462, -0.972014, 2.503403, 0, 0, 0, 1, 1,
1.613481, 0.3731124, 1.998543, 0, 0, 0, 1, 1,
1.616778, 1.039108, 1.183516, 0, 0, 0, 1, 1,
1.620407, 0.01287422, 1.194889, 0, 0, 0, 1, 1,
1.632179, -1.03486, 2.750236, 0, 0, 0, 1, 1,
1.63372, -1.294535, 3.096427, 1, 1, 1, 1, 1,
1.642749, 0.3643921, 1.444938, 1, 1, 1, 1, 1,
1.650231, 1.549428, 0.9945709, 1, 1, 1, 1, 1,
1.650285, -0.09695921, 2.231986, 1, 1, 1, 1, 1,
1.684312, -0.8188122, 1.344288, 1, 1, 1, 1, 1,
1.690014, 0.3853277, 2.763858, 1, 1, 1, 1, 1,
1.692166, 0.8088766, 1.095694, 1, 1, 1, 1, 1,
1.70411, -0.7944365, 1.815514, 1, 1, 1, 1, 1,
1.706558, 0.816915, 1.040776, 1, 1, 1, 1, 1,
1.716128, -1.121045, 2.01216, 1, 1, 1, 1, 1,
1.743237, 0.7592239, -0.3297483, 1, 1, 1, 1, 1,
1.754435, 0.6634221, 1.511185, 1, 1, 1, 1, 1,
1.759617, -1.270527, 1.54628, 1, 1, 1, 1, 1,
1.761256, -1.167455, 3.108938, 1, 1, 1, 1, 1,
1.764496, 2.233039, -0.217023, 1, 1, 1, 1, 1,
1.773849, 0.1872993, 1.878511, 0, 0, 1, 1, 1,
1.776572, -1.691568, 2.377228, 1, 0, 0, 1, 1,
1.777495, 0.6647194, 1.753568, 1, 0, 0, 1, 1,
1.793483, 0.5902882, 1.0538, 1, 0, 0, 1, 1,
1.794227, 0.7311062, 2.758322, 1, 0, 0, 1, 1,
1.806141, 0.2508483, -0.3723819, 1, 0, 0, 1, 1,
1.809119, -1.52748, 2.960346, 0, 0, 0, 1, 1,
1.821535, 0.7920541, 2.204598, 0, 0, 0, 1, 1,
1.825544, -0.7537853, 0.3904264, 0, 0, 0, 1, 1,
1.827644, -1.427607, 3.302952, 0, 0, 0, 1, 1,
1.845631, -1.3962, 1.059824, 0, 0, 0, 1, 1,
1.851752, 0.7353136, 2.352491, 0, 0, 0, 1, 1,
1.869351, 1.359399, 2.348288, 0, 0, 0, 1, 1,
1.870971, 0.7136836, 0.3996115, 1, 1, 1, 1, 1,
1.883548, 1.071174, 1.737676, 1, 1, 1, 1, 1,
1.909366, 1.210544, 2.409202, 1, 1, 1, 1, 1,
1.915264, 0.6012043, 0.5828932, 1, 1, 1, 1, 1,
1.921182, -0.9293502, 3.386816, 1, 1, 1, 1, 1,
1.940722, 0.2413608, 2.61847, 1, 1, 1, 1, 1,
1.953931, -0.544813, 2.379228, 1, 1, 1, 1, 1,
1.988454, 0.4060999, 0.681293, 1, 1, 1, 1, 1,
1.988943, 0.03785066, 2.140528, 1, 1, 1, 1, 1,
2.017137, -0.7361491, 3.278847, 1, 1, 1, 1, 1,
2.030373, 0.3447268, 2.084998, 1, 1, 1, 1, 1,
2.036049, -1.452185, 3.212362, 1, 1, 1, 1, 1,
2.064133, -1.542597, 2.127467, 1, 1, 1, 1, 1,
2.086024, 0.7214211, 1.242545, 1, 1, 1, 1, 1,
2.087409, -1.14539, 2.308189, 1, 1, 1, 1, 1,
2.095998, -1.003122, 1.564914, 0, 0, 1, 1, 1,
2.101964, 0.5816286, 2.084248, 1, 0, 0, 1, 1,
2.168715, 1.155756, -0.363213, 1, 0, 0, 1, 1,
2.195585, 2.344637, -0.1214759, 1, 0, 0, 1, 1,
2.201184, -0.2931219, 1.778356, 1, 0, 0, 1, 1,
2.228811, 0.2771429, 3.098814, 1, 0, 0, 1, 1,
2.241405, -0.3482164, 2.57371, 0, 0, 0, 1, 1,
2.246172, 1.016992, 1.35952, 0, 0, 0, 1, 1,
2.251439, -0.269227, 2.167001, 0, 0, 0, 1, 1,
2.261071, -0.04766023, 3.341218, 0, 0, 0, 1, 1,
2.277185, 0.7205918, 1.311738, 0, 0, 0, 1, 1,
2.372757, -0.2058643, 3.349504, 0, 0, 0, 1, 1,
2.383883, 2.172148, 2.839401, 0, 0, 0, 1, 1,
2.413956, 0.3371291, 1.690324, 1, 1, 1, 1, 1,
2.417217, 1.045711, 0.2667607, 1, 1, 1, 1, 1,
2.492148, -0.1523538, 2.188415, 1, 1, 1, 1, 1,
2.49613, -0.5906805, 0.9587366, 1, 1, 1, 1, 1,
2.593629, -0.4265315, 2.420751, 1, 1, 1, 1, 1,
3.139454, 0.2216932, 0.6464371, 1, 1, 1, 1, 1,
3.255378, 0.9956189, 1.588809, 1, 1, 1, 1, 1
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
var radius = 10.19011;
var distance = 35.79232;
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
mvMatrix.translate( -0.1221919, -0.9962361, -0.3970096 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.79232);
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