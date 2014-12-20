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
-3.071701, 1.692619, -3.076829, 1, 0, 0, 1,
-2.762375, -0.718612, -2.234659, 1, 0.007843138, 0, 1,
-2.592057, -0.09079363, -0.006488146, 1, 0.01176471, 0, 1,
-2.513604, 2.3993, -1.298236, 1, 0.01960784, 0, 1,
-2.491968, -1.560423, -2.044203, 1, 0.02352941, 0, 1,
-2.403059, -0.5327652, -2.18107, 1, 0.03137255, 0, 1,
-2.386313, 0.1694933, 0.3211169, 1, 0.03529412, 0, 1,
-2.238055, 0.6731787, -1.174359, 1, 0.04313726, 0, 1,
-2.235701, -0.7659394, -1.39665, 1, 0.04705882, 0, 1,
-2.185498, -1.651216, -4.29583, 1, 0.05490196, 0, 1,
-2.181391, 1.165644, -1.80832, 1, 0.05882353, 0, 1,
-2.038708, 1.286975, -1.886572, 1, 0.06666667, 0, 1,
-2.038548, -0.7096034, -2.283471, 1, 0.07058824, 0, 1,
-2.03576, -0.4376719, -1.587696, 1, 0.07843138, 0, 1,
-2.025191, -0.930262, -2.283863, 1, 0.08235294, 0, 1,
-2.00183, -0.2344914, -1.240371, 1, 0.09019608, 0, 1,
-1.99612, 0.7961046, -1.579988, 1, 0.09411765, 0, 1,
-1.957809, 1.271306, 0.03979707, 1, 0.1019608, 0, 1,
-1.956763, 0.1808293, -1.359654, 1, 0.1098039, 0, 1,
-1.932814, 0.396066, -1.684638, 1, 0.1137255, 0, 1,
-1.910459, 0.05814961, -1.519884, 1, 0.1215686, 0, 1,
-1.904966, 1.023168, -1.974779, 1, 0.1254902, 0, 1,
-1.898298, -1.043283, -2.360325, 1, 0.1333333, 0, 1,
-1.879882, -0.1831629, -1.4737, 1, 0.1372549, 0, 1,
-1.876697, -0.8414931, -2.642901, 1, 0.145098, 0, 1,
-1.862168, 0.7231251, -2.140568, 1, 0.1490196, 0, 1,
-1.861993, -0.9326106, -1.957796, 1, 0.1568628, 0, 1,
-1.858726, -0.8814803, -3.085652, 1, 0.1607843, 0, 1,
-1.857428, 2.241719, -1.854178, 1, 0.1686275, 0, 1,
-1.851195, 0.6576642, -1.811367, 1, 0.172549, 0, 1,
-1.799748, -1.259538, -1.694269, 1, 0.1803922, 0, 1,
-1.790832, -0.8841531, -2.222166, 1, 0.1843137, 0, 1,
-1.788177, 0.928136, 0.1753502, 1, 0.1921569, 0, 1,
-1.779313, 1.795142, -2.625068, 1, 0.1960784, 0, 1,
-1.775756, -0.1097543, -2.207134, 1, 0.2039216, 0, 1,
-1.74697, 1.223919, 0.2003072, 1, 0.2117647, 0, 1,
-1.744295, -1.901962, -2.395171, 1, 0.2156863, 0, 1,
-1.739303, -0.445866, -2.59177, 1, 0.2235294, 0, 1,
-1.738726, 0.4983739, 0.83279, 1, 0.227451, 0, 1,
-1.727393, -0.6597018, -1.662, 1, 0.2352941, 0, 1,
-1.719043, -1.739578, -1.985228, 1, 0.2392157, 0, 1,
-1.718647, 0.569581, -0.2511708, 1, 0.2470588, 0, 1,
-1.705561, -1.667164, -1.985984, 1, 0.2509804, 0, 1,
-1.667261, 1.792384, -0.9367872, 1, 0.2588235, 0, 1,
-1.653317, 0.2892843, -3.192517, 1, 0.2627451, 0, 1,
-1.627573, -1.054516, -0.5554839, 1, 0.2705882, 0, 1,
-1.624032, 1.285673, 0.2531562, 1, 0.2745098, 0, 1,
-1.579401, 2.490362, -1.036528, 1, 0.282353, 0, 1,
-1.573088, 1.792423, -0.7557822, 1, 0.2862745, 0, 1,
-1.569091, -0.3693611, -2.479084, 1, 0.2941177, 0, 1,
-1.560045, 0.002256542, -2.816775, 1, 0.3019608, 0, 1,
-1.559883, -1.615219, -2.654824, 1, 0.3058824, 0, 1,
-1.528315, 0.02727672, -1.414804, 1, 0.3137255, 0, 1,
-1.518041, -0.2773029, -2.951736, 1, 0.3176471, 0, 1,
-1.517986, -0.2883399, -0.7253008, 1, 0.3254902, 0, 1,
-1.516716, 0.4681541, -1.340642, 1, 0.3294118, 0, 1,
-1.505199, 0.1636133, -1.056381, 1, 0.3372549, 0, 1,
-1.501469, -0.7637249, -0.6499551, 1, 0.3411765, 0, 1,
-1.487906, 0.4485093, -0.4913248, 1, 0.3490196, 0, 1,
-1.48401, -0.8386203, -2.302598, 1, 0.3529412, 0, 1,
-1.480343, 0.2521471, -1.088388, 1, 0.3607843, 0, 1,
-1.47675, -0.07991631, -2.445558, 1, 0.3647059, 0, 1,
-1.474182, 1.154382, 0.1810229, 1, 0.372549, 0, 1,
-1.473616, -0.07808493, -2.285045, 1, 0.3764706, 0, 1,
-1.472616, -0.4628157, -2.199211, 1, 0.3843137, 0, 1,
-1.458781, -0.2282183, -2.091694, 1, 0.3882353, 0, 1,
-1.456547, 0.292779, -0.04618725, 1, 0.3960784, 0, 1,
-1.45027, 0.7800817, -0.5820744, 1, 0.4039216, 0, 1,
-1.447571, -0.2449719, -2.016693, 1, 0.4078431, 0, 1,
-1.433336, 0.001712963, -0.06630717, 1, 0.4156863, 0, 1,
-1.432803, 1.070528, -0.2772099, 1, 0.4196078, 0, 1,
-1.420315, -1.245105, -2.645282, 1, 0.427451, 0, 1,
-1.416804, 0.8887029, -0.1734619, 1, 0.4313726, 0, 1,
-1.413359, -2.449135, -2.441647, 1, 0.4392157, 0, 1,
-1.393698, -0.640646, -1.756516, 1, 0.4431373, 0, 1,
-1.388704, -0.06155365, -0.7063174, 1, 0.4509804, 0, 1,
-1.370073, -0.574746, -1.275875, 1, 0.454902, 0, 1,
-1.362773, -1.103047, -0.2942261, 1, 0.4627451, 0, 1,
-1.349556, -0.2043008, -1.216023, 1, 0.4666667, 0, 1,
-1.326748, 1.826513, -1.211101, 1, 0.4745098, 0, 1,
-1.313669, 0.2074024, -0.372434, 1, 0.4784314, 0, 1,
-1.299681, 1.055007, 0.305385, 1, 0.4862745, 0, 1,
-1.298555, 0.5991665, -0.8871613, 1, 0.4901961, 0, 1,
-1.297532, 0.5437354, -1.486745, 1, 0.4980392, 0, 1,
-1.296292, 1.534355, -2.78875, 1, 0.5058824, 0, 1,
-1.288052, -0.02903427, -1.283208, 1, 0.509804, 0, 1,
-1.286377, 0.4416871, -0.6051934, 1, 0.5176471, 0, 1,
-1.271118, 0.2680755, -0.4845997, 1, 0.5215687, 0, 1,
-1.265686, -0.5717613, -0.8001109, 1, 0.5294118, 0, 1,
-1.257784, 0.7347183, -1.554798, 1, 0.5333334, 0, 1,
-1.257776, 0.6943358, -0.07014789, 1, 0.5411765, 0, 1,
-1.255072, -0.6738431, -2.297357, 1, 0.5450981, 0, 1,
-1.25046, 0.5593832, 0.4289299, 1, 0.5529412, 0, 1,
-1.236999, 0.5676209, -0.7211906, 1, 0.5568628, 0, 1,
-1.222884, -0.8078644, -0.9684597, 1, 0.5647059, 0, 1,
-1.22215, 0.03805048, -1.060639, 1, 0.5686275, 0, 1,
-1.211476, 2.647325, 0.6986787, 1, 0.5764706, 0, 1,
-1.209332, 1.235215, -0.8222785, 1, 0.5803922, 0, 1,
-1.208502, 0.2087181, -2.673241, 1, 0.5882353, 0, 1,
-1.203991, 1.455461, -0.8426336, 1, 0.5921569, 0, 1,
-1.202463, -1.432494, -4.563158, 1, 0.6, 0, 1,
-1.201422, -0.9119503, -3.584283, 1, 0.6078432, 0, 1,
-1.200312, 0.7531024, -0.07530627, 1, 0.6117647, 0, 1,
-1.199198, -0.3073351, -2.722779, 1, 0.6196079, 0, 1,
-1.195946, 1.310281, 1.036317, 1, 0.6235294, 0, 1,
-1.179107, 0.4522088, -0.2023578, 1, 0.6313726, 0, 1,
-1.17867, -0.09243364, -3.091719, 1, 0.6352941, 0, 1,
-1.17716, 0.9218495, -2.17815, 1, 0.6431373, 0, 1,
-1.174812, -0.6888967, -3.016143, 1, 0.6470588, 0, 1,
-1.163885, -1.104471, -2.463253, 1, 0.654902, 0, 1,
-1.159679, 0.7114234, -1.038351, 1, 0.6588235, 0, 1,
-1.156767, -0.9832169, -1.922752, 1, 0.6666667, 0, 1,
-1.143751, 0.1239196, -0.316011, 1, 0.6705883, 0, 1,
-1.142341, -0.2425679, -3.66296, 1, 0.6784314, 0, 1,
-1.142169, 0.5172465, -0.5047712, 1, 0.682353, 0, 1,
-1.139061, -0.506747, -1.538009, 1, 0.6901961, 0, 1,
-1.134622, 0.1130883, -3.737001, 1, 0.6941177, 0, 1,
-1.131775, 0.4847888, -2.596487, 1, 0.7019608, 0, 1,
-1.12824, -0.9092498, -1.497765, 1, 0.7098039, 0, 1,
-1.101509, -0.3432172, -0.5257378, 1, 0.7137255, 0, 1,
-1.0978, 0.1941802, -2.17289, 1, 0.7215686, 0, 1,
-1.093407, -0.3153013, -2.590925, 1, 0.7254902, 0, 1,
-1.091331, -0.2408439, -2.815276, 1, 0.7333333, 0, 1,
-1.089494, -0.5514089, -1.133317, 1, 0.7372549, 0, 1,
-1.085656, 0.9008377, -1.928386, 1, 0.7450981, 0, 1,
-1.076799, 0.149512, -2.794511, 1, 0.7490196, 0, 1,
-1.075977, -0.8317799, -3.482948, 1, 0.7568628, 0, 1,
-1.068984, -0.5884874, -3.709645, 1, 0.7607843, 0, 1,
-1.060153, -0.09082323, -2.257604, 1, 0.7686275, 0, 1,
-1.059045, -1.614109, -1.47958, 1, 0.772549, 0, 1,
-1.040008, 0.02604556, -2.12852, 1, 0.7803922, 0, 1,
-1.039602, 0.2472015, -1.492997, 1, 0.7843137, 0, 1,
-1.039301, 0.6968705, -1.099636, 1, 0.7921569, 0, 1,
-1.028502, -0.7665991, -1.510216, 1, 0.7960784, 0, 1,
-1.027539, -1.334317, -2.041901, 1, 0.8039216, 0, 1,
-1.012475, 0.38771, -2.471247, 1, 0.8117647, 0, 1,
-1.010441, -0.4870271, -4.282005, 1, 0.8156863, 0, 1,
-1.010008, 1.585612, 0.6629127, 1, 0.8235294, 0, 1,
-1.009383, 0.8485753, -1.62437, 1, 0.827451, 0, 1,
-1.00853, -0.1839395, 0.007130453, 1, 0.8352941, 0, 1,
-1.008326, -0.2875154, -1.006626, 1, 0.8392157, 0, 1,
-1.007761, 1.464013, 0.8421379, 1, 0.8470588, 0, 1,
-1.000775, -0.05096384, -0.8273744, 1, 0.8509804, 0, 1,
-0.9951637, -1.515223, -3.080459, 1, 0.8588235, 0, 1,
-0.9943142, 0.7984272, 0.110384, 1, 0.8627451, 0, 1,
-0.9897675, 0.1254731, -1.62596, 1, 0.8705882, 0, 1,
-0.9859743, -1.666553, -2.884135, 1, 0.8745098, 0, 1,
-0.9844564, 1.357309, -2.301433, 1, 0.8823529, 0, 1,
-0.9835719, 0.9587165, -1.149778, 1, 0.8862745, 0, 1,
-0.9822661, 0.5545037, -0.02537084, 1, 0.8941177, 0, 1,
-0.97752, -0.4021605, -2.862735, 1, 0.8980392, 0, 1,
-0.9727407, 0.6557112, -0.3474807, 1, 0.9058824, 0, 1,
-0.9641181, 0.3679831, -2.912598, 1, 0.9137255, 0, 1,
-0.9638681, 0.4186351, -0.1694011, 1, 0.9176471, 0, 1,
-0.9484054, -0.4173809, -0.3980907, 1, 0.9254902, 0, 1,
-0.9438682, -1.705114, -1.149351, 1, 0.9294118, 0, 1,
-0.9432833, -0.8919941, -2.217566, 1, 0.9372549, 0, 1,
-0.9400426, -0.4469032, -1.169053, 1, 0.9411765, 0, 1,
-0.9383342, 0.8613117, 0.2648394, 1, 0.9490196, 0, 1,
-0.9319602, -1.508526, -2.929722, 1, 0.9529412, 0, 1,
-0.9310977, -0.8312715, -2.608249, 1, 0.9607843, 0, 1,
-0.9285293, 1.311273, -1.771134, 1, 0.9647059, 0, 1,
-0.9279972, 1.29392, 0.65979, 1, 0.972549, 0, 1,
-0.9244596, -1.164746, -3.011541, 1, 0.9764706, 0, 1,
-0.9243214, 0.1132988, -1.201728, 1, 0.9843137, 0, 1,
-0.9217399, 2.932537, -2.220084, 1, 0.9882353, 0, 1,
-0.9216094, 0.8445492, -0.08213033, 1, 0.9960784, 0, 1,
-0.9117709, 0.6512488, -2.176443, 0.9960784, 1, 0, 1,
-0.9107971, -0.03539003, -1.154619, 0.9921569, 1, 0, 1,
-0.9106386, -2.172588, -2.129644, 0.9843137, 1, 0, 1,
-0.9095362, 0.09164163, -0.9363638, 0.9803922, 1, 0, 1,
-0.9072818, -0.3610974, -1.458145, 0.972549, 1, 0, 1,
-0.9068425, 0.5895538, -1.316296, 0.9686275, 1, 0, 1,
-0.9043659, 0.7589348, 0.6689841, 0.9607843, 1, 0, 1,
-0.9028268, 0.3425981, -0.6362473, 0.9568627, 1, 0, 1,
-0.8950262, 0.07849294, -1.245672, 0.9490196, 1, 0, 1,
-0.8899072, -0.7819569, -1.42926, 0.945098, 1, 0, 1,
-0.8877761, -0.05231092, -0.4437751, 0.9372549, 1, 0, 1,
-0.8799282, 1.554179, -2.379539, 0.9333333, 1, 0, 1,
-0.8794411, -0.07376587, -1.16671, 0.9254902, 1, 0, 1,
-0.8698794, 0.4935376, -1.487193, 0.9215686, 1, 0, 1,
-0.8667991, -1.650411, -1.504779, 0.9137255, 1, 0, 1,
-0.8659855, 0.314085, -2.328622, 0.9098039, 1, 0, 1,
-0.8656617, 1.859541, -1.165824, 0.9019608, 1, 0, 1,
-0.8611816, -0.4240016, -1.450577, 0.8941177, 1, 0, 1,
-0.8573971, 0.4400233, -0.9889334, 0.8901961, 1, 0, 1,
-0.8546877, -0.9494815, -3.122323, 0.8823529, 1, 0, 1,
-0.842815, -0.6525092, -3.682151, 0.8784314, 1, 0, 1,
-0.8389737, 0.05174162, -2.055004, 0.8705882, 1, 0, 1,
-0.8365189, 0.151913, -0.7584199, 0.8666667, 1, 0, 1,
-0.8345229, 0.8931808, -0.3661123, 0.8588235, 1, 0, 1,
-0.8281512, -1.360376, -2.253151, 0.854902, 1, 0, 1,
-0.827281, -0.4228278, -1.498811, 0.8470588, 1, 0, 1,
-0.8203, 0.5382421, -0.9519737, 0.8431373, 1, 0, 1,
-0.8183278, -0.4843842, -2.093364, 0.8352941, 1, 0, 1,
-0.8177505, -0.3807339, -3.470758, 0.8313726, 1, 0, 1,
-0.8171375, -0.09128042, 0.6843225, 0.8235294, 1, 0, 1,
-0.8158337, 0.2371218, -1.502247, 0.8196079, 1, 0, 1,
-0.811831, -1.048234, -1.864701, 0.8117647, 1, 0, 1,
-0.8097345, 0.4332106, -0.3409736, 0.8078431, 1, 0, 1,
-0.8094704, -0.3445553, -1.197499, 0.8, 1, 0, 1,
-0.8070586, -1.985061, -4.028965, 0.7921569, 1, 0, 1,
-0.8037408, -1.091174, -1.869015, 0.7882353, 1, 0, 1,
-0.8036618, -0.2883338, -0.5447626, 0.7803922, 1, 0, 1,
-0.7997481, 1.729481, -0.5657709, 0.7764706, 1, 0, 1,
-0.7968464, 0.3207954, -1.394968, 0.7686275, 1, 0, 1,
-0.7903557, 1.963586, -2.009997, 0.7647059, 1, 0, 1,
-0.7858202, -0.3069218, -3.363324, 0.7568628, 1, 0, 1,
-0.7754605, 0.4581873, -1.572868, 0.7529412, 1, 0, 1,
-0.7733412, -1.345731, -1.865254, 0.7450981, 1, 0, 1,
-0.7727823, 0.5326622, -1.281166, 0.7411765, 1, 0, 1,
-0.7648834, -0.1102948, -1.493043, 0.7333333, 1, 0, 1,
-0.7595085, -0.3928008, -2.486548, 0.7294118, 1, 0, 1,
-0.756237, 0.783399, -0.3101384, 0.7215686, 1, 0, 1,
-0.7537234, 1.002896, -1.213568, 0.7176471, 1, 0, 1,
-0.7506894, 0.6975581, -2.73261, 0.7098039, 1, 0, 1,
-0.7497553, 0.9003731, -0.2844743, 0.7058824, 1, 0, 1,
-0.7435717, 0.0995103, -2.429084, 0.6980392, 1, 0, 1,
-0.7433222, -0.1758122, -3.060511, 0.6901961, 1, 0, 1,
-0.7426624, -1.668189, -3.376785, 0.6862745, 1, 0, 1,
-0.7415221, 0.1137595, -2.394596, 0.6784314, 1, 0, 1,
-0.739925, 1.408538, -0.9281539, 0.6745098, 1, 0, 1,
-0.7396191, 0.3535933, -1.509726, 0.6666667, 1, 0, 1,
-0.7394838, 0.8633239, -0.1455122, 0.6627451, 1, 0, 1,
-0.7393081, -0.00159423, -0.01422239, 0.654902, 1, 0, 1,
-0.7374237, -0.9425442, -3.120136, 0.6509804, 1, 0, 1,
-0.7369562, 0.1057413, -1.160945, 0.6431373, 1, 0, 1,
-0.7336596, 1.480764, -0.03796059, 0.6392157, 1, 0, 1,
-0.7304838, -0.1066257, -2.292858, 0.6313726, 1, 0, 1,
-0.730243, 0.1750257, -0.781373, 0.627451, 1, 0, 1,
-0.7250599, -0.6543438, -2.590735, 0.6196079, 1, 0, 1,
-0.7243633, 1.038333, -1.097597, 0.6156863, 1, 0, 1,
-0.7202342, -0.7376314, -2.430493, 0.6078432, 1, 0, 1,
-0.719135, 0.5595803, 0.6079915, 0.6039216, 1, 0, 1,
-0.7177148, -2.233736, -2.775783, 0.5960785, 1, 0, 1,
-0.7153938, 0.009749452, 0.2680962, 0.5882353, 1, 0, 1,
-0.7139936, -1.791294, -3.87115, 0.5843138, 1, 0, 1,
-0.7137508, 0.8963185, 0.5459501, 0.5764706, 1, 0, 1,
-0.7051988, 0.7700975, 0.3566724, 0.572549, 1, 0, 1,
-0.7051248, -0.1664657, -0.9212673, 0.5647059, 1, 0, 1,
-0.7011523, -0.4580624, -1.130146, 0.5607843, 1, 0, 1,
-0.7004601, 0.01660902, -1.18589, 0.5529412, 1, 0, 1,
-0.6875123, 0.3555286, -1.496361, 0.5490196, 1, 0, 1,
-0.6856334, 0.3141794, -0.3847813, 0.5411765, 1, 0, 1,
-0.6848462, 0.7727292, -1.481581, 0.5372549, 1, 0, 1,
-0.6837531, 0.5989888, -1.492547, 0.5294118, 1, 0, 1,
-0.681734, -1.503706, -0.9006423, 0.5254902, 1, 0, 1,
-0.6685271, 0.3106942, -2.701204, 0.5176471, 1, 0, 1,
-0.6677245, 0.3295249, -0.5306287, 0.5137255, 1, 0, 1,
-0.6633033, -1.286185, -3.978373, 0.5058824, 1, 0, 1,
-0.658739, -0.1144077, -2.051594, 0.5019608, 1, 0, 1,
-0.6582193, -1.843697, -1.576278, 0.4941176, 1, 0, 1,
-0.6580982, -0.9478126, -3.188866, 0.4862745, 1, 0, 1,
-0.6571862, 0.2837611, -0.7654256, 0.4823529, 1, 0, 1,
-0.6553404, 0.55299, -0.5251675, 0.4745098, 1, 0, 1,
-0.6548675, -1.111208, -3.842726, 0.4705882, 1, 0, 1,
-0.6475508, -0.3330778, -2.576608, 0.4627451, 1, 0, 1,
-0.6420941, 0.79562, 1.065596, 0.4588235, 1, 0, 1,
-0.6394431, -0.525132, -2.425662, 0.4509804, 1, 0, 1,
-0.6383051, -0.1543367, -2.514325, 0.4470588, 1, 0, 1,
-0.634939, 0.1109546, -2.010572, 0.4392157, 1, 0, 1,
-0.6334299, -0.1481945, -1.682265, 0.4352941, 1, 0, 1,
-0.6307532, 0.9932423, -0.448382, 0.427451, 1, 0, 1,
-0.6305817, -1.393538, -4.657885, 0.4235294, 1, 0, 1,
-0.6295733, -1.937374, -1.388177, 0.4156863, 1, 0, 1,
-0.6286976, 1.226858, 0.04861812, 0.4117647, 1, 0, 1,
-0.6285254, -0.002747067, -1.076353, 0.4039216, 1, 0, 1,
-0.6263459, -0.6707902, -4.297092, 0.3960784, 1, 0, 1,
-0.6254104, -0.9978516, -2.234309, 0.3921569, 1, 0, 1,
-0.6218611, 0.3241669, 0.3742825, 0.3843137, 1, 0, 1,
-0.6213624, 1.63036, -0.5053515, 0.3803922, 1, 0, 1,
-0.6200692, -1.627255, -2.730461, 0.372549, 1, 0, 1,
-0.6099812, -0.9179848, -1.60829, 0.3686275, 1, 0, 1,
-0.6093435, -2.124431, -2.642441, 0.3607843, 1, 0, 1,
-0.6048555, 0.85804, 0.02516855, 0.3568628, 1, 0, 1,
-0.5983762, -1.41643, -3.058666, 0.3490196, 1, 0, 1,
-0.5981333, 1.085056, 0.2542629, 0.345098, 1, 0, 1,
-0.590107, 0.2667535, -2.415263, 0.3372549, 1, 0, 1,
-0.5884539, 0.5289313, -0.3999016, 0.3333333, 1, 0, 1,
-0.587821, 0.3011759, -0.2498612, 0.3254902, 1, 0, 1,
-0.5855479, -1.333194, 0.0007141958, 0.3215686, 1, 0, 1,
-0.5847192, -0.6646411, -3.036533, 0.3137255, 1, 0, 1,
-0.5833274, -0.5639234, -4.353798, 0.3098039, 1, 0, 1,
-0.583049, -0.2755371, -1.817812, 0.3019608, 1, 0, 1,
-0.5791423, 0.5812786, 0.2688082, 0.2941177, 1, 0, 1,
-0.5777464, 0.2028708, 0.6477565, 0.2901961, 1, 0, 1,
-0.5776684, -0.06175962, -3.091727, 0.282353, 1, 0, 1,
-0.5767119, 0.02857593, -2.041929, 0.2784314, 1, 0, 1,
-0.575031, 0.03726134, -3.104351, 0.2705882, 1, 0, 1,
-0.5731071, -0.7274625, -4.351598, 0.2666667, 1, 0, 1,
-0.563548, 0.9774888, -1.500566, 0.2588235, 1, 0, 1,
-0.5582053, -0.326549, -1.43197, 0.254902, 1, 0, 1,
-0.5569369, -0.7712021, -2.345427, 0.2470588, 1, 0, 1,
-0.5523463, 0.8019918, -0.2042541, 0.2431373, 1, 0, 1,
-0.5452291, 0.615598, -0.3722459, 0.2352941, 1, 0, 1,
-0.5415946, -0.1225014, -2.800559, 0.2313726, 1, 0, 1,
-0.5396799, 0.6157242, -3.030349, 0.2235294, 1, 0, 1,
-0.5353634, 1.277755, 0.6962885, 0.2196078, 1, 0, 1,
-0.5342845, -0.8339998, -3.981631, 0.2117647, 1, 0, 1,
-0.5322574, -0.5377613, -3.372671, 0.2078431, 1, 0, 1,
-0.5314506, 0.4357282, 0.4717953, 0.2, 1, 0, 1,
-0.5245258, -0.2941226, -1.362111, 0.1921569, 1, 0, 1,
-0.5232777, 0.9601185, -1.733397, 0.1882353, 1, 0, 1,
-0.5227498, -0.4777661, -1.62558, 0.1803922, 1, 0, 1,
-0.5190222, 1.102317, -0.9389668, 0.1764706, 1, 0, 1,
-0.513152, -0.46858, -4.018672, 0.1686275, 1, 0, 1,
-0.5107461, -1.323663, -2.494485, 0.1647059, 1, 0, 1,
-0.5104957, -2.00093, -1.841187, 0.1568628, 1, 0, 1,
-0.509837, 1.787519, -1.931734, 0.1529412, 1, 0, 1,
-0.5097138, 0.4258738, -0.2700678, 0.145098, 1, 0, 1,
-0.5096763, -1.351082, -4.327963, 0.1411765, 1, 0, 1,
-0.5061819, -0.401284, -2.654251, 0.1333333, 1, 0, 1,
-0.5041632, -0.650413, -1.007216, 0.1294118, 1, 0, 1,
-0.4981053, 1.015411, -0.9714745, 0.1215686, 1, 0, 1,
-0.4976029, 1.391273, -0.4750636, 0.1176471, 1, 0, 1,
-0.4902219, -1.546561, -3.383803, 0.1098039, 1, 0, 1,
-0.4848092, 0.01497753, -2.044261, 0.1058824, 1, 0, 1,
-0.4841431, -0.4400573, -2.251854, 0.09803922, 1, 0, 1,
-0.4785224, 0.9282447, 0.1559044, 0.09019608, 1, 0, 1,
-0.4770363, -0.8043464, -1.19474, 0.08627451, 1, 0, 1,
-0.4763195, 1.605325, 0.7002727, 0.07843138, 1, 0, 1,
-0.4746105, -1.208738, -3.511083, 0.07450981, 1, 0, 1,
-0.4734238, -0.1884155, -2.637843, 0.06666667, 1, 0, 1,
-0.4732089, -0.7444221, -2.737127, 0.0627451, 1, 0, 1,
-0.468391, 1.443074, 0.3157872, 0.05490196, 1, 0, 1,
-0.4627528, 0.1509945, -2.710046, 0.05098039, 1, 0, 1,
-0.4605982, 0.160413, -1.656574, 0.04313726, 1, 0, 1,
-0.4572139, 0.284015, -0.8579734, 0.03921569, 1, 0, 1,
-0.456732, 0.3271407, -1.28309, 0.03137255, 1, 0, 1,
-0.4430073, 0.1930913, -1.61604, 0.02745098, 1, 0, 1,
-0.4423958, 0.6190424, -0.6461, 0.01960784, 1, 0, 1,
-0.4410337, -0.4981067, -2.470361, 0.01568628, 1, 0, 1,
-0.4409035, -1.593727, -3.952844, 0.007843138, 1, 0, 1,
-0.4391277, 2.283469, 0.1935907, 0.003921569, 1, 0, 1,
-0.4307545, -1.266979, -1.562784, 0, 1, 0.003921569, 1,
-0.4299973, 0.05021626, -0.3181123, 0, 1, 0.01176471, 1,
-0.4177505, -0.5870582, -1.145087, 0, 1, 0.01568628, 1,
-0.4169053, 0.1280208, -1.468517, 0, 1, 0.02352941, 1,
-0.4093411, 0.3417857, 0.4815787, 0, 1, 0.02745098, 1,
-0.4004954, 0.293934, 0.2396822, 0, 1, 0.03529412, 1,
-0.3995038, -1.326271, -3.802923, 0, 1, 0.03921569, 1,
-0.3994075, -2.177161, -3.423643, 0, 1, 0.04705882, 1,
-0.3897887, 0.8189009, 0.308977, 0, 1, 0.05098039, 1,
-0.3889364, 1.986426, 0.8487214, 0, 1, 0.05882353, 1,
-0.3844564, -0.1592561, -2.09607, 0, 1, 0.0627451, 1,
-0.3814804, 1.20086, -0.1317503, 0, 1, 0.07058824, 1,
-0.3811909, 1.802997, -2.839075, 0, 1, 0.07450981, 1,
-0.3756085, -0.8076664, -3.789632, 0, 1, 0.08235294, 1,
-0.3754355, -0.377229, -2.932683, 0, 1, 0.08627451, 1,
-0.3712316, -1.068412, -2.923376, 0, 1, 0.09411765, 1,
-0.3705129, 0.5248483, -1.313015, 0, 1, 0.1019608, 1,
-0.3654723, 0.4400793, -0.9017661, 0, 1, 0.1058824, 1,
-0.3637199, 2.601444, 0.5673563, 0, 1, 0.1137255, 1,
-0.3630537, 1.822327, -0.008948741, 0, 1, 0.1176471, 1,
-0.3620911, -0.2692557, -4.291787, 0, 1, 0.1254902, 1,
-0.3597135, 1.368022, -1.965745, 0, 1, 0.1294118, 1,
-0.3469307, -1.034275, -2.620813, 0, 1, 0.1372549, 1,
-0.3446395, -1.440861, -3.321163, 0, 1, 0.1411765, 1,
-0.343108, 0.09141177, -1.835009, 0, 1, 0.1490196, 1,
-0.3414768, -1.436965, -2.745085, 0, 1, 0.1529412, 1,
-0.3412783, 0.4563391, -1.944926, 0, 1, 0.1607843, 1,
-0.3377148, -0.4668712, -2.980988, 0, 1, 0.1647059, 1,
-0.3351062, 0.9929811, -0.5546466, 0, 1, 0.172549, 1,
-0.3345787, -0.03655683, -1.769688, 0, 1, 0.1764706, 1,
-0.3299666, -0.4625974, -0.6354105, 0, 1, 0.1843137, 1,
-0.3274944, -1.849879, -3.539627, 0, 1, 0.1882353, 1,
-0.3269813, 1.23066, -0.3192759, 0, 1, 0.1960784, 1,
-0.3261347, -0.3592734, -1.204404, 0, 1, 0.2039216, 1,
-0.3236661, -0.3628659, -2.959404, 0, 1, 0.2078431, 1,
-0.3202257, 0.5641176, -0.07261406, 0, 1, 0.2156863, 1,
-0.3127089, -0.8203818, -2.321639, 0, 1, 0.2196078, 1,
-0.3089609, 2.521096, -0.3530619, 0, 1, 0.227451, 1,
-0.3088908, -0.4559247, -3.523857, 0, 1, 0.2313726, 1,
-0.3058479, 0.9593152, -0.6868523, 0, 1, 0.2392157, 1,
-0.3050615, -0.4139669, -3.484006, 0, 1, 0.2431373, 1,
-0.3040811, 1.589525, 2.33633, 0, 1, 0.2509804, 1,
-0.3027629, -0.5073429, -3.889583, 0, 1, 0.254902, 1,
-0.2951281, 0.2898262, 1.558449, 0, 1, 0.2627451, 1,
-0.2925954, 0.8844247, -1.035177, 0, 1, 0.2666667, 1,
-0.2893162, 0.00162828, -2.20202, 0, 1, 0.2745098, 1,
-0.2845923, -0.5522436, -3.211475, 0, 1, 0.2784314, 1,
-0.283502, -2.30609, -3.62974, 0, 1, 0.2862745, 1,
-0.2745452, 1.172504, 0.1333248, 0, 1, 0.2901961, 1,
-0.2698655, -1.010683, -3.054036, 0, 1, 0.2980392, 1,
-0.2696327, 0.3407996, -0.7740355, 0, 1, 0.3058824, 1,
-0.2656559, 0.6818181, 0.04412002, 0, 1, 0.3098039, 1,
-0.2643476, -1.360919, -2.992287, 0, 1, 0.3176471, 1,
-0.2641013, -1.300185, -2.281087, 0, 1, 0.3215686, 1,
-0.2630595, 1.159127, 1.055793, 0, 1, 0.3294118, 1,
-0.2601794, -0.9555117, -2.371954, 0, 1, 0.3333333, 1,
-0.2576645, 1.058535, 0.1796374, 0, 1, 0.3411765, 1,
-0.2528777, -0.7857625, -1.695592, 0, 1, 0.345098, 1,
-0.2505745, -1.027158, -3.267828, 0, 1, 0.3529412, 1,
-0.2504642, 3.857882, 0.2715989, 0, 1, 0.3568628, 1,
-0.2498906, 0.6313303, 0.04671693, 0, 1, 0.3647059, 1,
-0.2460942, -0.8450199, -1.464571, 0, 1, 0.3686275, 1,
-0.2458398, -0.9700183, -3.406755, 0, 1, 0.3764706, 1,
-0.2453, -0.7388588, -1.564666, 0, 1, 0.3803922, 1,
-0.2444737, 0.5244737, -0.08652036, 0, 1, 0.3882353, 1,
-0.2414696, 0.428067, -0.4087526, 0, 1, 0.3921569, 1,
-0.2380233, 2.264071, -0.8213089, 0, 1, 0.4, 1,
-0.2342705, 0.04404447, 0.1747907, 0, 1, 0.4078431, 1,
-0.2304658, 2.737457, -0.3934158, 0, 1, 0.4117647, 1,
-0.2265442, 0.5740545, 0.7601508, 0, 1, 0.4196078, 1,
-0.2236949, 1.498022, -1.909552, 0, 1, 0.4235294, 1,
-0.2222849, -0.15433, -2.39247, 0, 1, 0.4313726, 1,
-0.2187719, -0.7219471, -3.982527, 0, 1, 0.4352941, 1,
-0.2134608, 1.225127, 0.573502, 0, 1, 0.4431373, 1,
-0.2103445, 0.9159163, 0.4500868, 0, 1, 0.4470588, 1,
-0.2093121, -0.8360851, -5.197251, 0, 1, 0.454902, 1,
-0.2081032, 0.1126742, -0.9976035, 0, 1, 0.4588235, 1,
-0.2029093, -1.468028, -2.818104, 0, 1, 0.4666667, 1,
-0.1995098, -0.2770413, -2.287847, 0, 1, 0.4705882, 1,
-0.193315, -1.256266, -3.179758, 0, 1, 0.4784314, 1,
-0.192769, -1.137836, -4.132876, 0, 1, 0.4823529, 1,
-0.1923051, 1.325253, -0.1958363, 0, 1, 0.4901961, 1,
-0.1921334, -0.387353, -1.757922, 0, 1, 0.4941176, 1,
-0.1873766, -0.3400952, -4.564678, 0, 1, 0.5019608, 1,
-0.1803929, -0.3204008, -2.377349, 0, 1, 0.509804, 1,
-0.1801169, 1.651601, 0.9765961, 0, 1, 0.5137255, 1,
-0.1784026, 1.861946, 3.473224, 0, 1, 0.5215687, 1,
-0.1763088, -0.7796778, -3.579184, 0, 1, 0.5254902, 1,
-0.1702288, 0.4859313, 0.5682453, 0, 1, 0.5333334, 1,
-0.170182, -0.984387, -3.672945, 0, 1, 0.5372549, 1,
-0.1693408, -1.484149, -3.460897, 0, 1, 0.5450981, 1,
-0.1687952, 0.9595697, 0.9452343, 0, 1, 0.5490196, 1,
-0.1645732, -0.4055633, -4.655962, 0, 1, 0.5568628, 1,
-0.1645481, 0.1005038, 0.3790258, 0, 1, 0.5607843, 1,
-0.1631957, -0.1360557, -2.205677, 0, 1, 0.5686275, 1,
-0.1626336, 0.1894431, -0.08659953, 0, 1, 0.572549, 1,
-0.1596173, -0.5152043, -3.48933, 0, 1, 0.5803922, 1,
-0.1580186, -0.545283, -2.968308, 0, 1, 0.5843138, 1,
-0.1555759, 0.9376066, -1.393723, 0, 1, 0.5921569, 1,
-0.1550258, -1.479054, -1.157469, 0, 1, 0.5960785, 1,
-0.1529019, -1.234941, -2.304307, 0, 1, 0.6039216, 1,
-0.1519922, -0.2838521, -3.201635, 0, 1, 0.6117647, 1,
-0.1510647, -2.690656, -3.186949, 0, 1, 0.6156863, 1,
-0.1502673, -0.1858392, -2.029598, 0, 1, 0.6235294, 1,
-0.1486309, -1.525967, -4.826033, 0, 1, 0.627451, 1,
-0.1483434, 0.8792177, -1.026374, 0, 1, 0.6352941, 1,
-0.1478313, 0.6518155, -0.3250976, 0, 1, 0.6392157, 1,
-0.1430198, -0.4794441, -2.600818, 0, 1, 0.6470588, 1,
-0.1405525, -1.64187, -4.429322, 0, 1, 0.6509804, 1,
-0.139227, -1.662879, -3.002316, 0, 1, 0.6588235, 1,
-0.1384426, 0.8995562, 0.4268669, 0, 1, 0.6627451, 1,
-0.1304542, 0.8432953, -0.5953929, 0, 1, 0.6705883, 1,
-0.1296183, 0.7644891, -0.1293404, 0, 1, 0.6745098, 1,
-0.1292739, 0.00149173, -1.519697, 0, 1, 0.682353, 1,
-0.1274431, -1.535379, -3.746224, 0, 1, 0.6862745, 1,
-0.1242477, 0.3850071, 0.2675389, 0, 1, 0.6941177, 1,
-0.1165451, -0.07236879, -1.191208, 0, 1, 0.7019608, 1,
-0.1159551, -0.2896462, -3.060875, 0, 1, 0.7058824, 1,
-0.1092696, -1.03273, -3.977108, 0, 1, 0.7137255, 1,
-0.1084699, -1.145167, -1.619403, 0, 1, 0.7176471, 1,
-0.1076735, 1.134603, 0.01386983, 0, 1, 0.7254902, 1,
-0.1052777, 0.2583349, 0.1163702, 0, 1, 0.7294118, 1,
-0.1050761, 0.6901416, 0.4850404, 0, 1, 0.7372549, 1,
-0.1045613, 1.413393, 1.140261, 0, 1, 0.7411765, 1,
-0.09837842, 1.37874e-05, -1.839131, 0, 1, 0.7490196, 1,
-0.09825908, 0.3829205, -0.4086519, 0, 1, 0.7529412, 1,
-0.0957089, 0.7315642, -0.905973, 0, 1, 0.7607843, 1,
-0.09560928, -0.5524046, -2.548112, 0, 1, 0.7647059, 1,
-0.09370253, -1.899287, -4.495275, 0, 1, 0.772549, 1,
-0.09329924, 0.2874728, 0.7925045, 0, 1, 0.7764706, 1,
-0.08877598, -1.226972, -0.4912308, 0, 1, 0.7843137, 1,
-0.08340061, -0.9567292, -3.392332, 0, 1, 0.7882353, 1,
-0.07870797, 0.6636657, 0.04604718, 0, 1, 0.7960784, 1,
-0.07251784, 1.176832, 0.3714474, 0, 1, 0.8039216, 1,
-0.0677046, 1.470376, -0.6934161, 0, 1, 0.8078431, 1,
-0.06444703, 0.3161842, -0.02636246, 0, 1, 0.8156863, 1,
-0.06147492, 1.46326, -0.003923672, 0, 1, 0.8196079, 1,
-0.0577067, -0.9439691, -3.554063, 0, 1, 0.827451, 1,
-0.05499344, -0.7283973, -2.734901, 0, 1, 0.8313726, 1,
-0.05358789, -0.675782, -3.119702, 0, 1, 0.8392157, 1,
-0.05353436, -1.355716, -4.718387, 0, 1, 0.8431373, 1,
-0.0529402, -1.426306, -0.7350376, 0, 1, 0.8509804, 1,
-0.05224337, -0.6093115, -3.353266, 0, 1, 0.854902, 1,
-0.05114566, -0.7547458, -2.032137, 0, 1, 0.8627451, 1,
-0.04665237, -0.01795299, 0.08359508, 0, 1, 0.8666667, 1,
-0.03841921, 0.8549379, 0.7979066, 0, 1, 0.8745098, 1,
-0.03665254, -0.386002, -2.46053, 0, 1, 0.8784314, 1,
-0.03363228, 0.304101, 0.9835448, 0, 1, 0.8862745, 1,
-0.03300488, 0.7196391, -2.058574, 0, 1, 0.8901961, 1,
-0.03222978, 0.5348458, -1.20283, 0, 1, 0.8980392, 1,
-0.03027829, 0.7717124, 0.9299571, 0, 1, 0.9058824, 1,
-0.02688706, 0.4660245, -2.260897, 0, 1, 0.9098039, 1,
-0.02198577, -0.1849293, -3.766992, 0, 1, 0.9176471, 1,
-0.02122481, -0.225307, -2.330447, 0, 1, 0.9215686, 1,
-0.01110631, -0.4912254, -4.484373, 0, 1, 0.9294118, 1,
-0.008840819, -0.1662287, -2.469662, 0, 1, 0.9333333, 1,
0.001127801, 0.8406614, 0.1553624, 0, 1, 0.9411765, 1,
0.00147462, -0.6695838, 4.517564, 0, 1, 0.945098, 1,
0.007312302, 1.424228, -1.56176, 0, 1, 0.9529412, 1,
0.009010808, -0.6814994, 2.403791, 0, 1, 0.9568627, 1,
0.01003668, 0.1366007, -0.9499459, 0, 1, 0.9647059, 1,
0.01156067, -1.30909, 2.722271, 0, 1, 0.9686275, 1,
0.01552384, 1.38346, -0.5071722, 0, 1, 0.9764706, 1,
0.0185148, 1.631396, 1.895544, 0, 1, 0.9803922, 1,
0.02290284, 0.3399065, -1.727431, 0, 1, 0.9882353, 1,
0.02785873, -0.5942793, 2.657703, 0, 1, 0.9921569, 1,
0.03002071, -1.196424, 3.642876, 0, 1, 1, 1,
0.03200715, 0.6874682, -1.567952, 0, 0.9921569, 1, 1,
0.03587576, -1.239359, 2.0905, 0, 0.9882353, 1, 1,
0.03619786, 1.68949, 0.0003846584, 0, 0.9803922, 1, 1,
0.03923517, -1.571785, 3.817106, 0, 0.9764706, 1, 1,
0.03933277, -1.842394, 3.387563, 0, 0.9686275, 1, 1,
0.04066982, -0.6173911, 3.852109, 0, 0.9647059, 1, 1,
0.04217605, -0.5110509, 2.626916, 0, 0.9568627, 1, 1,
0.04287325, 0.4607144, -1.568916, 0, 0.9529412, 1, 1,
0.04813851, -0.03416507, 0.05385001, 0, 0.945098, 1, 1,
0.05141569, -0.6525327, 3.498808, 0, 0.9411765, 1, 1,
0.05230293, -0.6268094, 4.601371, 0, 0.9333333, 1, 1,
0.05240069, -0.7076725, 4.221872, 0, 0.9294118, 1, 1,
0.05362939, -1.157544, 2.580868, 0, 0.9215686, 1, 1,
0.05437478, -0.4460942, 2.50599, 0, 0.9176471, 1, 1,
0.05683975, -1.090376, 4.256593, 0, 0.9098039, 1, 1,
0.06151127, 0.139372, 1.015785, 0, 0.9058824, 1, 1,
0.06156036, 2.91963, -0.5144368, 0, 0.8980392, 1, 1,
0.07315521, -0.3952567, 3.585237, 0, 0.8901961, 1, 1,
0.07612443, -1.334871, 3.666772, 0, 0.8862745, 1, 1,
0.07711221, -0.1611491, 1.867968, 0, 0.8784314, 1, 1,
0.07866227, -0.2523988, 3.913786, 0, 0.8745098, 1, 1,
0.07913141, -0.2507731, 1.247754, 0, 0.8666667, 1, 1,
0.08094777, -0.580759, 3.818865, 0, 0.8627451, 1, 1,
0.08210986, 0.8834438, 1.011789, 0, 0.854902, 1, 1,
0.08493383, 0.05256529, 1.830709, 0, 0.8509804, 1, 1,
0.08849833, -1.79204, 4.119622, 0, 0.8431373, 1, 1,
0.08904362, -0.04856117, 4.042556, 0, 0.8392157, 1, 1,
0.09180397, 0.7239355, -1.630957, 0, 0.8313726, 1, 1,
0.09416307, 1.150633, 0.8639028, 0, 0.827451, 1, 1,
0.09964901, 0.5812631, 0.6698365, 0, 0.8196079, 1, 1,
0.09965412, 0.6489768, -0.8304398, 0, 0.8156863, 1, 1,
0.1049988, 0.3258426, 1.079254, 0, 0.8078431, 1, 1,
0.1077676, -0.4552186, 2.024896, 0, 0.8039216, 1, 1,
0.1116962, 0.7809938, -0.3117343, 0, 0.7960784, 1, 1,
0.1155427, -1.095006, 4.466915, 0, 0.7882353, 1, 1,
0.117074, 0.8781608, 1.36579, 0, 0.7843137, 1, 1,
0.1188881, 0.9694532, -0.2497491, 0, 0.7764706, 1, 1,
0.1199599, -0.2249357, 1.731411, 0, 0.772549, 1, 1,
0.1200763, -0.7718704, 2.343935, 0, 0.7647059, 1, 1,
0.1201295, 0.06728005, 0.2562679, 0, 0.7607843, 1, 1,
0.12693, -0.859226, 4.044901, 0, 0.7529412, 1, 1,
0.128398, -0.1166979, 3.144921, 0, 0.7490196, 1, 1,
0.1289582, -1.243016, 3.885767, 0, 0.7411765, 1, 1,
0.1320347, -1.198631, 1.783463, 0, 0.7372549, 1, 1,
0.1327032, -1.277749, 2.386443, 0, 0.7294118, 1, 1,
0.1338077, -0.7967901, 3.859426, 0, 0.7254902, 1, 1,
0.1389467, -2.219566, 3.594565, 0, 0.7176471, 1, 1,
0.1405932, 0.2673448, 2.257768, 0, 0.7137255, 1, 1,
0.1440426, -2.350509, 2.29752, 0, 0.7058824, 1, 1,
0.1479531, -0.1278931, 2.500897, 0, 0.6980392, 1, 1,
0.1488153, -0.5806606, 2.191223, 0, 0.6941177, 1, 1,
0.1509658, 0.07968815, 1.869605, 0, 0.6862745, 1, 1,
0.1523444, -1.077438, 3.675734, 0, 0.682353, 1, 1,
0.1532314, -1.189997, 3.332591, 0, 0.6745098, 1, 1,
0.1586308, -1.28375, 1.504025, 0, 0.6705883, 1, 1,
0.1586778, 0.3364, -1.029872, 0, 0.6627451, 1, 1,
0.1643904, 1.892934, 1.185947, 0, 0.6588235, 1, 1,
0.1663639, 0.7458206, -0.8381791, 0, 0.6509804, 1, 1,
0.1688983, 1.589353, 0.3276512, 0, 0.6470588, 1, 1,
0.1715927, 0.7560471, 2.207874, 0, 0.6392157, 1, 1,
0.1767628, -0.1757642, 1.321384, 0, 0.6352941, 1, 1,
0.1800236, 0.4759662, 1.579731, 0, 0.627451, 1, 1,
0.1816131, -0.9509301, 2.749253, 0, 0.6235294, 1, 1,
0.1920843, 0.02733732, -0.269669, 0, 0.6156863, 1, 1,
0.1993672, 1.195614, -1.038581, 0, 0.6117647, 1, 1,
0.2009735, 0.6723515, -0.5084774, 0, 0.6039216, 1, 1,
0.2009777, 0.05466, 0.7032571, 0, 0.5960785, 1, 1,
0.2038892, 1.096285, -0.6332303, 0, 0.5921569, 1, 1,
0.2070163, 0.09274168, -1.12114, 0, 0.5843138, 1, 1,
0.2085263, 1.501579, -0.05635528, 0, 0.5803922, 1, 1,
0.2106632, 0.4098952, -0.05276813, 0, 0.572549, 1, 1,
0.2129773, 3.09447, 0.6517796, 0, 0.5686275, 1, 1,
0.2135591, -0.2227767, 3.433345, 0, 0.5607843, 1, 1,
0.2150297, -0.3570693, 1.240846, 0, 0.5568628, 1, 1,
0.2195174, -0.9223178, 0.8746806, 0, 0.5490196, 1, 1,
0.2203993, -3.548348, 2.628008, 0, 0.5450981, 1, 1,
0.2294438, 0.8920159, -0.4181558, 0, 0.5372549, 1, 1,
0.2303097, -0.07971172, 3.225519, 0, 0.5333334, 1, 1,
0.2305192, 0.26943, -0.6363437, 0, 0.5254902, 1, 1,
0.2315968, 0.4811363, 0.2926382, 0, 0.5215687, 1, 1,
0.2354239, -1.020128, 1.86732, 0, 0.5137255, 1, 1,
0.2372443, -0.822687, 2.307335, 0, 0.509804, 1, 1,
0.2390804, 0.5094967, 1.338193, 0, 0.5019608, 1, 1,
0.2392489, -1.339039, 2.005501, 0, 0.4941176, 1, 1,
0.2398402, -1.430778, 2.972196, 0, 0.4901961, 1, 1,
0.240617, -2.531599, 2.282431, 0, 0.4823529, 1, 1,
0.2413431, 1.289338, 0.05732057, 0, 0.4784314, 1, 1,
0.2473114, 0.4702103, 0.6555099, 0, 0.4705882, 1, 1,
0.2484756, 1.605768, 0.317398, 0, 0.4666667, 1, 1,
0.2533583, -0.123343, 1.859531, 0, 0.4588235, 1, 1,
0.2548881, -1.888217, 3.469931, 0, 0.454902, 1, 1,
0.2622226, 0.01539023, 2.429645, 0, 0.4470588, 1, 1,
0.2630746, -1.271462, 4.892949, 0, 0.4431373, 1, 1,
0.2659034, 0.3536263, 0.920893, 0, 0.4352941, 1, 1,
0.2673594, -0.5394034, 3.267725, 0, 0.4313726, 1, 1,
0.2693194, 0.3062166, 0.7936356, 0, 0.4235294, 1, 1,
0.271595, 0.5024149, 0.6494474, 0, 0.4196078, 1, 1,
0.2740988, 0.2971101, -0.7355034, 0, 0.4117647, 1, 1,
0.2798812, -0.4467254, 3.034797, 0, 0.4078431, 1, 1,
0.281122, -0.5224255, 0.481635, 0, 0.4, 1, 1,
0.2817004, -0.1251388, 0.08846819, 0, 0.3921569, 1, 1,
0.2866223, -1.60876, 3.515608, 0, 0.3882353, 1, 1,
0.2866367, 0.1594403, -0.7218101, 0, 0.3803922, 1, 1,
0.2889695, -0.9109089, 2.837565, 0, 0.3764706, 1, 1,
0.291337, -0.3788385, 2.973265, 0, 0.3686275, 1, 1,
0.2931919, -0.4821711, 2.08907, 0, 0.3647059, 1, 1,
0.294598, -2.051085, 4.049426, 0, 0.3568628, 1, 1,
0.3000972, 0.6035413, 0.5701041, 0, 0.3529412, 1, 1,
0.3109718, -1.126276, 2.843034, 0, 0.345098, 1, 1,
0.3110374, 0.5019149, -0.02501846, 0, 0.3411765, 1, 1,
0.3119938, -0.4663552, 2.924617, 0, 0.3333333, 1, 1,
0.3128048, -1.362142, 2.319431, 0, 0.3294118, 1, 1,
0.3174156, -0.4413122, 2.087615, 0, 0.3215686, 1, 1,
0.320731, -0.883229, 1.19291, 0, 0.3176471, 1, 1,
0.321644, -2.054451, 3.387755, 0, 0.3098039, 1, 1,
0.3235455, 1.088888, 2.1918, 0, 0.3058824, 1, 1,
0.3295663, 0.01254927, 1.575, 0, 0.2980392, 1, 1,
0.330512, -1.106054, 3.11178, 0, 0.2901961, 1, 1,
0.3332175, -0.3561072, 1.316393, 0, 0.2862745, 1, 1,
0.3384644, 0.7707412, 0.4433368, 0, 0.2784314, 1, 1,
0.3411123, 2.076871, -0.4808893, 0, 0.2745098, 1, 1,
0.3416068, -0.6883602, 2.287565, 0, 0.2666667, 1, 1,
0.3439614, -0.1197898, 0.2982363, 0, 0.2627451, 1, 1,
0.3450244, -1.437025, 2.765197, 0, 0.254902, 1, 1,
0.3463952, 0.1640061, 1.427938, 0, 0.2509804, 1, 1,
0.3488894, 0.6450687, -0.001918185, 0, 0.2431373, 1, 1,
0.3504593, -1.153108, 4.637158, 0, 0.2392157, 1, 1,
0.3509446, -1.069492, 3.826425, 0, 0.2313726, 1, 1,
0.352826, -0.7507619, 3.151676, 0, 0.227451, 1, 1,
0.3568965, -0.2375439, 1.725097, 0, 0.2196078, 1, 1,
0.357379, 1.216769, 1.029558, 0, 0.2156863, 1, 1,
0.3585706, 0.3841744, 1.095844, 0, 0.2078431, 1, 1,
0.3589524, 1.014532, 0.8061747, 0, 0.2039216, 1, 1,
0.3614735, -1.245591, 0.9723856, 0, 0.1960784, 1, 1,
0.3638103, 0.4340268, -0.5525171, 0, 0.1882353, 1, 1,
0.3642519, -0.6357229, 3.104758, 0, 0.1843137, 1, 1,
0.3660624, 2.04755, -0.2924461, 0, 0.1764706, 1, 1,
0.3662799, -0.605267, 0.703671, 0, 0.172549, 1, 1,
0.3689417, -1.357049, 1.857226, 0, 0.1647059, 1, 1,
0.374239, 0.7540056, 0.4526051, 0, 0.1607843, 1, 1,
0.3747248, 1.163399, -0.3298792, 0, 0.1529412, 1, 1,
0.3757999, 0.1288469, 1.019813, 0, 0.1490196, 1, 1,
0.3764193, -1.549745, 2.2249, 0, 0.1411765, 1, 1,
0.3797293, 0.1057488, 1.261689, 0, 0.1372549, 1, 1,
0.3830869, 1.914502, -0.2364323, 0, 0.1294118, 1, 1,
0.3901256, -0.4821671, 2.688751, 0, 0.1254902, 1, 1,
0.3915774, 1.319583, -0.4557727, 0, 0.1176471, 1, 1,
0.3979661, 0.5649281, 2.117595, 0, 0.1137255, 1, 1,
0.4040741, 0.4617118, 0.9980941, 0, 0.1058824, 1, 1,
0.4048877, 0.5497331, 0.1596814, 0, 0.09803922, 1, 1,
0.4078977, 1.302535, 1.032875, 0, 0.09411765, 1, 1,
0.4106803, 1.757082, 0.4755306, 0, 0.08627451, 1, 1,
0.4172694, 0.8771902, 1.737129, 0, 0.08235294, 1, 1,
0.4229548, 0.1955063, 1.308975, 0, 0.07450981, 1, 1,
0.4341688, 1.209302, 1.2911, 0, 0.07058824, 1, 1,
0.4354633, -0.3269343, -0.06405166, 0, 0.0627451, 1, 1,
0.4390311, 1.478552, 1.233913, 0, 0.05882353, 1, 1,
0.4419603, -0.1953193, 1.92985, 0, 0.05098039, 1, 1,
0.446407, -0.9807531, 3.818866, 0, 0.04705882, 1, 1,
0.4544758, -1.048991, 2.409803, 0, 0.03921569, 1, 1,
0.4548168, -0.2185331, 2.456383, 0, 0.03529412, 1, 1,
0.4575433, -0.005046443, 1.741092, 0, 0.02745098, 1, 1,
0.4596851, 1.11913, 1.530938, 0, 0.02352941, 1, 1,
0.4640159, 0.982269, 1.268641, 0, 0.01568628, 1, 1,
0.4652934, 1.167297, 0.9339877, 0, 0.01176471, 1, 1,
0.4661528, 0.505107, 2.142376, 0, 0.003921569, 1, 1,
0.4684538, -2.018548, 2.167222, 0.003921569, 0, 1, 1,
0.46953, -1.238696, 3.823263, 0.007843138, 0, 1, 1,
0.4723403, -0.2123263, 1.707133, 0.01568628, 0, 1, 1,
0.4741791, -2.403798, 4.413589, 0.01960784, 0, 1, 1,
0.4760411, 0.4030096, 1.923911, 0.02745098, 0, 1, 1,
0.4767843, 1.038995, 1.661467, 0.03137255, 0, 1, 1,
0.4779968, -0.6879847, 2.348751, 0.03921569, 0, 1, 1,
0.4816333, 0.2468659, 2.188801, 0.04313726, 0, 1, 1,
0.4839912, -1.132861, 3.873481, 0.05098039, 0, 1, 1,
0.4884279, 0.03840748, 1.706815, 0.05490196, 0, 1, 1,
0.4889668, 0.2778142, 1.420227, 0.0627451, 0, 1, 1,
0.4913319, 0.1785339, 2.211597, 0.06666667, 0, 1, 1,
0.4952048, -0.5515938, 2.112458, 0.07450981, 0, 1, 1,
0.4986891, -0.6580898, 2.743288, 0.07843138, 0, 1, 1,
0.4988372, -0.0004044115, 2.660187, 0.08627451, 0, 1, 1,
0.5009757, 1.431362, 1.798091, 0.09019608, 0, 1, 1,
0.5024698, 0.09511976, 1.457437, 0.09803922, 0, 1, 1,
0.5038821, 2.222807, 0.6458379, 0.1058824, 0, 1, 1,
0.5047176, -0.3456333, 1.8434, 0.1098039, 0, 1, 1,
0.5049509, -0.7742507, 1.058362, 0.1176471, 0, 1, 1,
0.5090771, 0.3879188, -1.027718, 0.1215686, 0, 1, 1,
0.5093296, 0.9954781, 1.848491, 0.1294118, 0, 1, 1,
0.5116968, 1.139145, -0.6047398, 0.1333333, 0, 1, 1,
0.5125388, -0.5250173, 2.382463, 0.1411765, 0, 1, 1,
0.5163352, -0.6165635, 1.814757, 0.145098, 0, 1, 1,
0.5171201, 0.2063656, 2.216599, 0.1529412, 0, 1, 1,
0.5200025, -0.3681317, 1.912855, 0.1568628, 0, 1, 1,
0.522105, 0.9101861, -0.007857156, 0.1647059, 0, 1, 1,
0.5261487, -0.5515399, 4.884652, 0.1686275, 0, 1, 1,
0.5303142, -1.428717, 0.6260032, 0.1764706, 0, 1, 1,
0.5307834, 0.9497845, -0.7890787, 0.1803922, 0, 1, 1,
0.5310242, -0.3592362, 1.824736, 0.1882353, 0, 1, 1,
0.5387278, -0.9172791, 1.128902, 0.1921569, 0, 1, 1,
0.5413451, 1.040054, 0.4292073, 0.2, 0, 1, 1,
0.5445384, 0.2438417, 1.996134, 0.2078431, 0, 1, 1,
0.5462276, 0.1513784, 1.561314, 0.2117647, 0, 1, 1,
0.5480395, 0.1122597, 1.944551, 0.2196078, 0, 1, 1,
0.5507238, 0.4620008, 0.9915103, 0.2235294, 0, 1, 1,
0.5561787, 0.2323309, -0.2024703, 0.2313726, 0, 1, 1,
0.5580066, -1.453789, 1.236989, 0.2352941, 0, 1, 1,
0.5581658, -0.3589309, 1.968042, 0.2431373, 0, 1, 1,
0.5627298, -0.06229776, 0.3074326, 0.2470588, 0, 1, 1,
0.5641651, 1.105853, 1.613443, 0.254902, 0, 1, 1,
0.5652497, -1.468573, 3.815028, 0.2588235, 0, 1, 1,
0.5665093, -0.004090906, 0.9597734, 0.2666667, 0, 1, 1,
0.5674423, -0.9695243, 2.305423, 0.2705882, 0, 1, 1,
0.5689968, 0.7030094, -0.5029042, 0.2784314, 0, 1, 1,
0.5707039, -0.6382511, 1.746662, 0.282353, 0, 1, 1,
0.5732684, -2.330692, 3.348736, 0.2901961, 0, 1, 1,
0.5736847, 0.7578032, 0.6426085, 0.2941177, 0, 1, 1,
0.5739486, -0.1489787, 2.267037, 0.3019608, 0, 1, 1,
0.5765686, 0.02117652, 1.503985, 0.3098039, 0, 1, 1,
0.5768438, -0.1745123, 1.745986, 0.3137255, 0, 1, 1,
0.579563, 0.4856253, -1.721702, 0.3215686, 0, 1, 1,
0.5972825, -1.175736, 4.541688, 0.3254902, 0, 1, 1,
0.5980468, 0.9550438, -0.5088102, 0.3333333, 0, 1, 1,
0.5986857, -1.089446, 2.217336, 0.3372549, 0, 1, 1,
0.6007223, 1.204952, 1.465983, 0.345098, 0, 1, 1,
0.6009548, 0.3853269, -0.4929117, 0.3490196, 0, 1, 1,
0.6020843, 1.984869, -0.6080578, 0.3568628, 0, 1, 1,
0.6029961, -2.737733, 2.922818, 0.3607843, 0, 1, 1,
0.6060253, -0.6784613, 1.002954, 0.3686275, 0, 1, 1,
0.6077002, -1.506784, 3.341514, 0.372549, 0, 1, 1,
0.6110024, 1.106521, 1.541135, 0.3803922, 0, 1, 1,
0.6154387, 1.791318, 0.6263962, 0.3843137, 0, 1, 1,
0.6186317, 1.334133, 0.3321787, 0.3921569, 0, 1, 1,
0.6200384, 0.9178945, -0.8854424, 0.3960784, 0, 1, 1,
0.6213437, -0.8785837, 3.237245, 0.4039216, 0, 1, 1,
0.6255766, -0.0478063, 1.484256, 0.4117647, 0, 1, 1,
0.6294933, 0.1419409, 1.149896, 0.4156863, 0, 1, 1,
0.6300345, 1.515339, -0.6403309, 0.4235294, 0, 1, 1,
0.6402625, -0.2358532, 2.649676, 0.427451, 0, 1, 1,
0.6411209, 0.3156173, 3.169338, 0.4352941, 0, 1, 1,
0.6416098, -1.018635, 3.035257, 0.4392157, 0, 1, 1,
0.6417436, -0.2529166, 3.269587, 0.4470588, 0, 1, 1,
0.6419181, -0.753724, 2.351735, 0.4509804, 0, 1, 1,
0.6442655, 1.800076, 0.3213402, 0.4588235, 0, 1, 1,
0.6454935, 0.01264444, 3.220713, 0.4627451, 0, 1, 1,
0.6460941, 0.2847122, 1.618431, 0.4705882, 0, 1, 1,
0.6461938, 0.8332965, 1.159319, 0.4745098, 0, 1, 1,
0.656632, -1.874145, 2.852643, 0.4823529, 0, 1, 1,
0.6588399, -0.4451423, 1.719175, 0.4862745, 0, 1, 1,
0.6612643, 2.558044, 0.7842246, 0.4941176, 0, 1, 1,
0.661971, -0.4641838, 1.898008, 0.5019608, 0, 1, 1,
0.6663865, 0.9307915, 0.1256094, 0.5058824, 0, 1, 1,
0.6685646, 1.421571, 1.121128, 0.5137255, 0, 1, 1,
0.6740941, -0.4663511, 1.341687, 0.5176471, 0, 1, 1,
0.6878908, 2.144758, 0.656566, 0.5254902, 0, 1, 1,
0.6921988, -1.778007, 1.334608, 0.5294118, 0, 1, 1,
0.6935232, 1.029527, 0.134492, 0.5372549, 0, 1, 1,
0.6962405, 0.06827194, 0.8317479, 0.5411765, 0, 1, 1,
0.6965345, 0.1459623, 0.2150039, 0.5490196, 0, 1, 1,
0.7008002, -0.4600492, 3.652182, 0.5529412, 0, 1, 1,
0.7049758, 0.854099, 1.357682, 0.5607843, 0, 1, 1,
0.7091944, 1.287627, -0.9882667, 0.5647059, 0, 1, 1,
0.712987, -0.4603871, 2.087196, 0.572549, 0, 1, 1,
0.714976, -1.634525, 1.944713, 0.5764706, 0, 1, 1,
0.7150184, 1.196676, -0.06227418, 0.5843138, 0, 1, 1,
0.7224093, -0.2192594, 3.002706, 0.5882353, 0, 1, 1,
0.7232517, 3.091508, 0.5736086, 0.5960785, 0, 1, 1,
0.7244868, -0.7403873, 3.10531, 0.6039216, 0, 1, 1,
0.7281151, 0.6397341, 0.7438427, 0.6078432, 0, 1, 1,
0.7357526, -0.2675918, 3.300528, 0.6156863, 0, 1, 1,
0.7394955, -1.894454, 1.336173, 0.6196079, 0, 1, 1,
0.7506244, -0.2516467, 3.111947, 0.627451, 0, 1, 1,
0.7520424, 1.260025, 0.3100229, 0.6313726, 0, 1, 1,
0.753367, 1.670606, 0.2570676, 0.6392157, 0, 1, 1,
0.7556611, -0.5571004, 1.041508, 0.6431373, 0, 1, 1,
0.756026, 0.009239408, 0.1276414, 0.6509804, 0, 1, 1,
0.7591166, -0.07179861, 1.913116, 0.654902, 0, 1, 1,
0.7595924, 0.7085522, 0.8107682, 0.6627451, 0, 1, 1,
0.7671298, 1.771242, 2.677602, 0.6666667, 0, 1, 1,
0.7679197, -0.08782304, 0.7412159, 0.6745098, 0, 1, 1,
0.7755413, -1.03866, 2.533463, 0.6784314, 0, 1, 1,
0.781849, 0.1399651, -0.405, 0.6862745, 0, 1, 1,
0.784803, 1.627638, 1.055217, 0.6901961, 0, 1, 1,
0.7898659, -0.282562, 2.230319, 0.6980392, 0, 1, 1,
0.7948225, 0.304288, 1.566789, 0.7058824, 0, 1, 1,
0.7957873, 1.223619, 0.5415932, 0.7098039, 0, 1, 1,
0.7975078, -0.1248144, 3.124537, 0.7176471, 0, 1, 1,
0.8022236, 1.097971, 0.5280784, 0.7215686, 0, 1, 1,
0.8064608, 1.119212, -0.1508207, 0.7294118, 0, 1, 1,
0.8110521, 0.5639607, 0.5438942, 0.7333333, 0, 1, 1,
0.8115001, -0.005581853, 1.663224, 0.7411765, 0, 1, 1,
0.8188437, -0.6411062, 1.626762, 0.7450981, 0, 1, 1,
0.82195, -1.088619, 1.397879, 0.7529412, 0, 1, 1,
0.8223743, 0.8114943, 1.004247, 0.7568628, 0, 1, 1,
0.8246882, 0.2716994, 1.238245, 0.7647059, 0, 1, 1,
0.829994, 0.775503, -0.8268707, 0.7686275, 0, 1, 1,
0.8335383, 1.24583, -0.1643489, 0.7764706, 0, 1, 1,
0.8359084, 0.2254105, 1.864137, 0.7803922, 0, 1, 1,
0.8384343, -1.068408, 1.565284, 0.7882353, 0, 1, 1,
0.8394171, -0.5912264, 2.769008, 0.7921569, 0, 1, 1,
0.845134, -0.5522388, 2.014758, 0.8, 0, 1, 1,
0.8506854, 1.725171, 1.007636, 0.8078431, 0, 1, 1,
0.853443, 1.193356, 0.5345138, 0.8117647, 0, 1, 1,
0.8534983, -0.339132, 3.236657, 0.8196079, 0, 1, 1,
0.8574139, 0.7680686, 0.1371458, 0.8235294, 0, 1, 1,
0.8612836, 0.004613769, 1.682878, 0.8313726, 0, 1, 1,
0.8641753, -0.5692317, 1.460826, 0.8352941, 0, 1, 1,
0.8725964, 0.6548851, 2.118396, 0.8431373, 0, 1, 1,
0.8739458, -0.2807081, 2.155978, 0.8470588, 0, 1, 1,
0.878664, -0.636115, 2.630827, 0.854902, 0, 1, 1,
0.8796251, -1.796482, 3.336867, 0.8588235, 0, 1, 1,
0.8802094, -1.154304, 3.809618, 0.8666667, 0, 1, 1,
0.8870932, 0.02089405, 1.380897, 0.8705882, 0, 1, 1,
0.8890746, 0.3744565, 1.0807, 0.8784314, 0, 1, 1,
0.8902006, -1.646134, 2.398799, 0.8823529, 0, 1, 1,
0.8941089, -1.640057, 2.420933, 0.8901961, 0, 1, 1,
0.8958781, 0.8220462, 0.9805415, 0.8941177, 0, 1, 1,
0.8963898, 0.2236904, 0.566502, 0.9019608, 0, 1, 1,
0.9020487, 0.8617423, 1.372228, 0.9098039, 0, 1, 1,
0.9041746, 1.567979, 0.8408548, 0.9137255, 0, 1, 1,
0.9085893, -0.07557215, 2.059746, 0.9215686, 0, 1, 1,
0.9132649, 0.9045369, 0.6246245, 0.9254902, 0, 1, 1,
0.9141518, 0.8117229, 1.863896, 0.9333333, 0, 1, 1,
0.9168996, 0.6281644, 1.309376, 0.9372549, 0, 1, 1,
0.9262078, -0.3388433, 1.465087, 0.945098, 0, 1, 1,
0.9262305, -0.4180004, 2.528963, 0.9490196, 0, 1, 1,
0.9333111, 0.7197718, 1.400554, 0.9568627, 0, 1, 1,
0.9334309, -0.4941205, 2.706955, 0.9607843, 0, 1, 1,
0.9386243, -1.545797, 1.777657, 0.9686275, 0, 1, 1,
0.9439653, -0.8846118, 2.30443, 0.972549, 0, 1, 1,
0.9454542, -1.51801, 0.8536596, 0.9803922, 0, 1, 1,
0.9476349, 1.254506, 0.8602264, 0.9843137, 0, 1, 1,
0.951215, -0.5125948, 1.153382, 0.9921569, 0, 1, 1,
0.9565119, 0.3568309, 0.9260029, 0.9960784, 0, 1, 1,
0.9575778, 0.265232, 0.3543855, 1, 0, 0.9960784, 1,
0.9601638, -0.49466, 1.375103, 1, 0, 0.9882353, 1,
0.9620788, 1.413148, 0.561898, 1, 0, 0.9843137, 1,
0.9625154, -0.7361385, 3.622359, 1, 0, 0.9764706, 1,
0.9625348, -0.8496612, 1.183038, 1, 0, 0.972549, 1,
0.9711133, 0.7522894, 1.192101, 1, 0, 0.9647059, 1,
0.9759725, 1.783539, 0.9005709, 1, 0, 0.9607843, 1,
0.9799615, -0.8120863, 1.491983, 1, 0, 0.9529412, 1,
0.9826943, -0.4400899, 3.01153, 1, 0, 0.9490196, 1,
0.9853505, 0.3162622, 1.941957, 1, 0, 0.9411765, 1,
0.9931777, 0.3818614, 0.8070896, 1, 0, 0.9372549, 1,
0.9981856, 0.159307, 0.8434442, 1, 0, 0.9294118, 1,
0.9982207, -0.199108, -0.0518, 1, 0, 0.9254902, 1,
1.000744, 1.98692, -0.4794897, 1, 0, 0.9176471, 1,
1.004487, -0.3042983, 2.524024, 1, 0, 0.9137255, 1,
1.007218, 0.002171653, 1.430334, 1, 0, 0.9058824, 1,
1.007304, -0.5675001, 2.03603, 1, 0, 0.9019608, 1,
1.00834, 0.6624582, 1.965745, 1, 0, 0.8941177, 1,
1.011241, -2.687611, 1.923233, 1, 0, 0.8862745, 1,
1.01873, -0.001272846, 0.7935819, 1, 0, 0.8823529, 1,
1.024087, -2.228304, 4.052684, 1, 0, 0.8745098, 1,
1.035215, 1.03388, 0.7059475, 1, 0, 0.8705882, 1,
1.066868, -0.8274525, 1.4753, 1, 0, 0.8627451, 1,
1.067389, -0.3427299, 1.156944, 1, 0, 0.8588235, 1,
1.073939, -0.2415205, 0.8278425, 1, 0, 0.8509804, 1,
1.082599, 1.088075, 0.5873568, 1, 0, 0.8470588, 1,
1.085995, 0.01304955, 2.624855, 1, 0, 0.8392157, 1,
1.095411, 0.4600542, 1.535447, 1, 0, 0.8352941, 1,
1.100605, -0.6247621, 1.961798, 1, 0, 0.827451, 1,
1.101603, -0.8480318, 0.52157, 1, 0, 0.8235294, 1,
1.110026, 0.3833129, 1.495941, 1, 0, 0.8156863, 1,
1.117543, 1.19599, 0.05069274, 1, 0, 0.8117647, 1,
1.124427, 0.3326579, 1.213633, 1, 0, 0.8039216, 1,
1.126968, 0.5072091, 1.235521, 1, 0, 0.7960784, 1,
1.130774, 0.4226971, 2.374861, 1, 0, 0.7921569, 1,
1.145233, -0.6605372, 2.054428, 1, 0, 0.7843137, 1,
1.145952, 0.1890006, 0.3401282, 1, 0, 0.7803922, 1,
1.146434, 0.1077708, 1.075592, 1, 0, 0.772549, 1,
1.149883, 1.151916, -1.961722, 1, 0, 0.7686275, 1,
1.15492, -1.607166, 3.37763, 1, 0, 0.7607843, 1,
1.15703, 0.9248508, 0.7786446, 1, 0, 0.7568628, 1,
1.158987, -0.8680673, 0.7280411, 1, 0, 0.7490196, 1,
1.160955, -0.257971, 2.320363, 1, 0, 0.7450981, 1,
1.166408, -1.517935, 2.271188, 1, 0, 0.7372549, 1,
1.176023, 0.750404, 1.150957, 1, 0, 0.7333333, 1,
1.179385, 1.088237, 0.6493926, 1, 0, 0.7254902, 1,
1.179606, -0.1591942, 3.091261, 1, 0, 0.7215686, 1,
1.181022, 0.9556922, 1.332024, 1, 0, 0.7137255, 1,
1.186908, 1.721319, -0.3533971, 1, 0, 0.7098039, 1,
1.192899, 1.529291, 2.622364, 1, 0, 0.7019608, 1,
1.19298, 0.352592, 2.065933, 1, 0, 0.6941177, 1,
1.194274, 0.242533, 1.47158, 1, 0, 0.6901961, 1,
1.200341, -0.042168, 3.652853, 1, 0, 0.682353, 1,
1.200364, -1.768034, 3.130704, 1, 0, 0.6784314, 1,
1.206498, 0.3315216, 1.092525, 1, 0, 0.6705883, 1,
1.219895, -0.9175995, 3.423043, 1, 0, 0.6666667, 1,
1.219917, 0.03450622, 0.7150325, 1, 0, 0.6588235, 1,
1.221919, -0.09594177, 2.697651, 1, 0, 0.654902, 1,
1.225282, 1.308421, -0.8404506, 1, 0, 0.6470588, 1,
1.231882, -1.298951, 1.475912, 1, 0, 0.6431373, 1,
1.233873, -0.1680558, 2.115428, 1, 0, 0.6352941, 1,
1.239126, -0.041245, 2.260419, 1, 0, 0.6313726, 1,
1.248027, 0.9570774, -0.5063885, 1, 0, 0.6235294, 1,
1.261247, 1.43979, 1.875146, 1, 0, 0.6196079, 1,
1.264742, 0.7358897, 1.150726, 1, 0, 0.6117647, 1,
1.272637, 2.056146, 1.369937, 1, 0, 0.6078432, 1,
1.276995, 2.621141, 0.5104254, 1, 0, 0.6, 1,
1.277318, 2.006673, 0.9472721, 1, 0, 0.5921569, 1,
1.279571, -0.7656671, 3.430306, 1, 0, 0.5882353, 1,
1.280638, 0.6584985, -0.1911727, 1, 0, 0.5803922, 1,
1.280947, 0.541469, 1.812516, 1, 0, 0.5764706, 1,
1.281221, 0.4869734, 0.5357451, 1, 0, 0.5686275, 1,
1.287682, 1.281545, -0.08771087, 1, 0, 0.5647059, 1,
1.292152, -1.295377, 2.293978, 1, 0, 0.5568628, 1,
1.301697, 0.7807304, 1.650688, 1, 0, 0.5529412, 1,
1.304721, -0.2273142, 2.227897, 1, 0, 0.5450981, 1,
1.314824, -0.8281879, 2.581911, 1, 0, 0.5411765, 1,
1.332207, 2.026367, 1.339091, 1, 0, 0.5333334, 1,
1.341316, 1.109966, 1.943117, 1, 0, 0.5294118, 1,
1.341976, -0.3245594, 3.101918, 1, 0, 0.5215687, 1,
1.345613, -0.729763, 3.166569, 1, 0, 0.5176471, 1,
1.352191, -0.5901189, 1.712476, 1, 0, 0.509804, 1,
1.367934, -0.09603463, 1.11137, 1, 0, 0.5058824, 1,
1.371257, -0.001107425, 0.9127206, 1, 0, 0.4980392, 1,
1.371717, -1.714876, 3.176058, 1, 0, 0.4901961, 1,
1.372879, 0.6625896, 2.11328, 1, 0, 0.4862745, 1,
1.389223, -0.6488358, 0.9361997, 1, 0, 0.4784314, 1,
1.403663, 0.731402, 2.486817, 1, 0, 0.4745098, 1,
1.408321, 2.099379, 0.9068063, 1, 0, 0.4666667, 1,
1.409002, 1.137534, 0.4356345, 1, 0, 0.4627451, 1,
1.413237, 0.2064665, 1.865305, 1, 0, 0.454902, 1,
1.414046, 0.5989369, -0.4285096, 1, 0, 0.4509804, 1,
1.414804, -0.8010428, 3.870695, 1, 0, 0.4431373, 1,
1.414872, -0.1884977, 2.691403, 1, 0, 0.4392157, 1,
1.415876, -0.9852686, 1.749631, 1, 0, 0.4313726, 1,
1.421397, -0.5810735, 1.839093, 1, 0, 0.427451, 1,
1.439065, 1.440904, 2.68657, 1, 0, 0.4196078, 1,
1.443041, -0.5733845, 4.49614, 1, 0, 0.4156863, 1,
1.474396, 0.7549368, 1.940669, 1, 0, 0.4078431, 1,
1.476244, 0.1770811, 2.23883, 1, 0, 0.4039216, 1,
1.480962, -0.005080611, 0.4957544, 1, 0, 0.3960784, 1,
1.487579, -0.9970312, 1.453563, 1, 0, 0.3882353, 1,
1.491817, 0.4191543, 2.148842, 1, 0, 0.3843137, 1,
1.492425, 0.4779077, -1.335961, 1, 0, 0.3764706, 1,
1.496239, 0.001722896, -0.312356, 1, 0, 0.372549, 1,
1.49644, -0.2512316, 2.687771, 1, 0, 0.3647059, 1,
1.497926, 0.1458084, 1.280418, 1, 0, 0.3607843, 1,
1.503664, 1.146783, -1.047138, 1, 0, 0.3529412, 1,
1.516789, 1.848032, -0.03252133, 1, 0, 0.3490196, 1,
1.525139, -0.07778966, 0.533733, 1, 0, 0.3411765, 1,
1.553405, 0.4951897, -0.2231312, 1, 0, 0.3372549, 1,
1.566047, -0.1019402, 0.273255, 1, 0, 0.3294118, 1,
1.577699, -0.4790234, 0.6567675, 1, 0, 0.3254902, 1,
1.587816, 0.8825324, 1.424096, 1, 0, 0.3176471, 1,
1.587883, 1.151969, 2.014442, 1, 0, 0.3137255, 1,
1.604946, -0.2506359, 2.182469, 1, 0, 0.3058824, 1,
1.621341, -1.345783, 1.943314, 1, 0, 0.2980392, 1,
1.642117, -1.214049, 1.77416, 1, 0, 0.2941177, 1,
1.643053, 0.5593363, 1.001496, 1, 0, 0.2862745, 1,
1.650463, 0.7765884, 0.05749312, 1, 0, 0.282353, 1,
1.655106, 0.6165664, 0.1568029, 1, 0, 0.2745098, 1,
1.664266, -0.7023082, 0.9005499, 1, 0, 0.2705882, 1,
1.685257, -0.495118, 0.9676379, 1, 0, 0.2627451, 1,
1.69102, -0.5374447, 1.125433, 1, 0, 0.2588235, 1,
1.708631, -0.8574164, 1.001621, 1, 0, 0.2509804, 1,
1.716797, 0.8549604, 0.2224468, 1, 0, 0.2470588, 1,
1.717309, 1.722142, 0.81279, 1, 0, 0.2392157, 1,
1.729174, 1.78196, -1.148201, 1, 0, 0.2352941, 1,
1.731515, 0.904157, 1.741431, 1, 0, 0.227451, 1,
1.734369, 1.000613, 2.117944, 1, 0, 0.2235294, 1,
1.736066, 0.8256099, -0.5356231, 1, 0, 0.2156863, 1,
1.736222, 0.4017969, 1.965738, 1, 0, 0.2117647, 1,
1.74031, 0.513324, 3.589029, 1, 0, 0.2039216, 1,
1.776163, 0.7123039, -0.6458471, 1, 0, 0.1960784, 1,
1.780268, -0.814859, 2.379104, 1, 0, 0.1921569, 1,
1.781246, -0.9009651, 0.3679034, 1, 0, 0.1843137, 1,
1.795773, 0.06969534, 0.171044, 1, 0, 0.1803922, 1,
1.798862, 0.132516, 1.676577, 1, 0, 0.172549, 1,
1.811067, 0.1803602, 0.9748336, 1, 0, 0.1686275, 1,
1.841612, 1.970438, 1.663382, 1, 0, 0.1607843, 1,
1.853782, 0.5079859, 1.700135, 1, 0, 0.1568628, 1,
1.862908, 0.8620137, 2.102071, 1, 0, 0.1490196, 1,
1.924745, 1.284921, 1.377819, 1, 0, 0.145098, 1,
1.93449, 1.648059, 2.173557, 1, 0, 0.1372549, 1,
1.935708, -0.377614, 2.793861, 1, 0, 0.1333333, 1,
1.953259, -1.560107, 2.154951, 1, 0, 0.1254902, 1,
1.963375, 0.9399519, 3.063659, 1, 0, 0.1215686, 1,
1.968267, -0.8825621, 1.378261, 1, 0, 0.1137255, 1,
1.975617, 0.1563907, 0.8919959, 1, 0, 0.1098039, 1,
2.067724, -0.5183375, 2.300609, 1, 0, 0.1019608, 1,
2.09228, 0.9333469, 1.101514, 1, 0, 0.09411765, 1,
2.100001, 0.3278489, 0.4543212, 1, 0, 0.09019608, 1,
2.106862, -0.9630719, 1.032916, 1, 0, 0.08235294, 1,
2.112116, 0.8828496, 0.07007263, 1, 0, 0.07843138, 1,
2.16189, -0.383913, 2.294685, 1, 0, 0.07058824, 1,
2.16885, 2.571811, -1.300248, 1, 0, 0.06666667, 1,
2.196801, 1.070073, 1.450118, 1, 0, 0.05882353, 1,
2.286697, 1.192356, 0.4496739, 1, 0, 0.05490196, 1,
2.398659, -0.5081933, 1.606964, 1, 0, 0.04705882, 1,
2.408635, 0.5756626, 0.1297042, 1, 0, 0.04313726, 1,
2.518162, 0.006509345, 1.904967, 1, 0, 0.03529412, 1,
2.578268, 0.3452964, 1.66679, 1, 0, 0.03137255, 1,
2.590495, -0.3966077, 2.346991, 1, 0, 0.02352941, 1,
2.708266, 1.459876, 1.275375, 1, 0, 0.01960784, 1,
2.818337, -0.950692, 0.8889865, 1, 0, 0.01176471, 1,
2.833388, 0.1371735, 1.456331, 1, 0, 0.007843138, 1
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
-0.1191565, -4.803704, -6.90754, 0, -0.5, 0.5, 0.5,
-0.1191565, -4.803704, -6.90754, 1, -0.5, 0.5, 0.5,
-0.1191565, -4.803704, -6.90754, 1, 1.5, 0.5, 0.5,
-0.1191565, -4.803704, -6.90754, 0, 1.5, 0.5, 0.5
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
-4.072614, 0.1547668, -6.90754, 0, -0.5, 0.5, 0.5,
-4.072614, 0.1547668, -6.90754, 1, -0.5, 0.5, 0.5,
-4.072614, 0.1547668, -6.90754, 1, 1.5, 0.5, 0.5,
-4.072614, 0.1547668, -6.90754, 0, 1.5, 0.5, 0.5
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
-4.072614, -4.803704, -0.1521513, 0, -0.5, 0.5, 0.5,
-4.072614, -4.803704, -0.1521513, 1, -0.5, 0.5, 0.5,
-4.072614, -4.803704, -0.1521513, 1, 1.5, 0.5, 0.5,
-4.072614, -4.803704, -0.1521513, 0, 1.5, 0.5, 0.5
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
-3, -3.659442, -5.348604,
2, -3.659442, -5.348604,
-3, -3.659442, -5.348604,
-3, -3.850152, -5.608427,
-2, -3.659442, -5.348604,
-2, -3.850152, -5.608427,
-1, -3.659442, -5.348604,
-1, -3.850152, -5.608427,
0, -3.659442, -5.348604,
0, -3.850152, -5.608427,
1, -3.659442, -5.348604,
1, -3.850152, -5.608427,
2, -3.659442, -5.348604,
2, -3.850152, -5.608427
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
-3, -4.231573, -6.128072, 0, -0.5, 0.5, 0.5,
-3, -4.231573, -6.128072, 1, -0.5, 0.5, 0.5,
-3, -4.231573, -6.128072, 1, 1.5, 0.5, 0.5,
-3, -4.231573, -6.128072, 0, 1.5, 0.5, 0.5,
-2, -4.231573, -6.128072, 0, -0.5, 0.5, 0.5,
-2, -4.231573, -6.128072, 1, -0.5, 0.5, 0.5,
-2, -4.231573, -6.128072, 1, 1.5, 0.5, 0.5,
-2, -4.231573, -6.128072, 0, 1.5, 0.5, 0.5,
-1, -4.231573, -6.128072, 0, -0.5, 0.5, 0.5,
-1, -4.231573, -6.128072, 1, -0.5, 0.5, 0.5,
-1, -4.231573, -6.128072, 1, 1.5, 0.5, 0.5,
-1, -4.231573, -6.128072, 0, 1.5, 0.5, 0.5,
0, -4.231573, -6.128072, 0, -0.5, 0.5, 0.5,
0, -4.231573, -6.128072, 1, -0.5, 0.5, 0.5,
0, -4.231573, -6.128072, 1, 1.5, 0.5, 0.5,
0, -4.231573, -6.128072, 0, 1.5, 0.5, 0.5,
1, -4.231573, -6.128072, 0, -0.5, 0.5, 0.5,
1, -4.231573, -6.128072, 1, -0.5, 0.5, 0.5,
1, -4.231573, -6.128072, 1, 1.5, 0.5, 0.5,
1, -4.231573, -6.128072, 0, 1.5, 0.5, 0.5,
2, -4.231573, -6.128072, 0, -0.5, 0.5, 0.5,
2, -4.231573, -6.128072, 1, -0.5, 0.5, 0.5,
2, -4.231573, -6.128072, 1, 1.5, 0.5, 0.5,
2, -4.231573, -6.128072, 0, 1.5, 0.5, 0.5
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
-3.160277, -2, -5.348604,
-3.160277, 2, -5.348604,
-3.160277, -2, -5.348604,
-3.312333, -2, -5.608427,
-3.160277, 0, -5.348604,
-3.312333, 0, -5.608427,
-3.160277, 2, -5.348604,
-3.312333, 2, -5.608427
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
-3.616446, -2, -6.128072, 0, -0.5, 0.5, 0.5,
-3.616446, -2, -6.128072, 1, -0.5, 0.5, 0.5,
-3.616446, -2, -6.128072, 1, 1.5, 0.5, 0.5,
-3.616446, -2, -6.128072, 0, 1.5, 0.5, 0.5,
-3.616446, 0, -6.128072, 0, -0.5, 0.5, 0.5,
-3.616446, 0, -6.128072, 1, -0.5, 0.5, 0.5,
-3.616446, 0, -6.128072, 1, 1.5, 0.5, 0.5,
-3.616446, 0, -6.128072, 0, 1.5, 0.5, 0.5,
-3.616446, 2, -6.128072, 0, -0.5, 0.5, 0.5,
-3.616446, 2, -6.128072, 1, -0.5, 0.5, 0.5,
-3.616446, 2, -6.128072, 1, 1.5, 0.5, 0.5,
-3.616446, 2, -6.128072, 0, 1.5, 0.5, 0.5
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
-3.160277, -3.659442, -4,
-3.160277, -3.659442, 4,
-3.160277, -3.659442, -4,
-3.312333, -3.850152, -4,
-3.160277, -3.659442, -2,
-3.312333, -3.850152, -2,
-3.160277, -3.659442, 0,
-3.312333, -3.850152, 0,
-3.160277, -3.659442, 2,
-3.312333, -3.850152, 2,
-3.160277, -3.659442, 4,
-3.312333, -3.850152, 4
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
-3.616446, -4.231573, -4, 0, -0.5, 0.5, 0.5,
-3.616446, -4.231573, -4, 1, -0.5, 0.5, 0.5,
-3.616446, -4.231573, -4, 1, 1.5, 0.5, 0.5,
-3.616446, -4.231573, -4, 0, 1.5, 0.5, 0.5,
-3.616446, -4.231573, -2, 0, -0.5, 0.5, 0.5,
-3.616446, -4.231573, -2, 1, -0.5, 0.5, 0.5,
-3.616446, -4.231573, -2, 1, 1.5, 0.5, 0.5,
-3.616446, -4.231573, -2, 0, 1.5, 0.5, 0.5,
-3.616446, -4.231573, 0, 0, -0.5, 0.5, 0.5,
-3.616446, -4.231573, 0, 1, -0.5, 0.5, 0.5,
-3.616446, -4.231573, 0, 1, 1.5, 0.5, 0.5,
-3.616446, -4.231573, 0, 0, 1.5, 0.5, 0.5,
-3.616446, -4.231573, 2, 0, -0.5, 0.5, 0.5,
-3.616446, -4.231573, 2, 1, -0.5, 0.5, 0.5,
-3.616446, -4.231573, 2, 1, 1.5, 0.5, 0.5,
-3.616446, -4.231573, 2, 0, 1.5, 0.5, 0.5,
-3.616446, -4.231573, 4, 0, -0.5, 0.5, 0.5,
-3.616446, -4.231573, 4, 1, -0.5, 0.5, 0.5,
-3.616446, -4.231573, 4, 1, 1.5, 0.5, 0.5,
-3.616446, -4.231573, 4, 0, 1.5, 0.5, 0.5
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
-3.160277, -3.659442, -5.348604,
-3.160277, 3.968976, -5.348604,
-3.160277, -3.659442, 5.044302,
-3.160277, 3.968976, 5.044302,
-3.160277, -3.659442, -5.348604,
-3.160277, -3.659442, 5.044302,
-3.160277, 3.968976, -5.348604,
-3.160277, 3.968976, 5.044302,
-3.160277, -3.659442, -5.348604,
2.921964, -3.659442, -5.348604,
-3.160277, -3.659442, 5.044302,
2.921964, -3.659442, 5.044302,
-3.160277, 3.968976, -5.348604,
2.921964, 3.968976, -5.348604,
-3.160277, 3.968976, 5.044302,
2.921964, 3.968976, 5.044302,
2.921964, -3.659442, -5.348604,
2.921964, 3.968976, -5.348604,
2.921964, -3.659442, 5.044302,
2.921964, 3.968976, 5.044302,
2.921964, -3.659442, -5.348604,
2.921964, -3.659442, 5.044302,
2.921964, 3.968976, -5.348604,
2.921964, 3.968976, 5.044302
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
var radius = 7.611779;
var distance = 33.86566;
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
mvMatrix.translate( 0.1191565, -0.1547668, 0.1521513 );
mvMatrix.scale( 1.35312, 1.078861, 0.7918867 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.86566);
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
Biphenylol<-read.table("Biphenylol.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Biphenylol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Biphenylol' not found
```

```r
y<-Biphenylol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Biphenylol' not found
```

```r
z<-Biphenylol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Biphenylol' not found
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
-3.071701, 1.692619, -3.076829, 0, 0, 1, 1, 1,
-2.762375, -0.718612, -2.234659, 1, 0, 0, 1, 1,
-2.592057, -0.09079363, -0.006488146, 1, 0, 0, 1, 1,
-2.513604, 2.3993, -1.298236, 1, 0, 0, 1, 1,
-2.491968, -1.560423, -2.044203, 1, 0, 0, 1, 1,
-2.403059, -0.5327652, -2.18107, 1, 0, 0, 1, 1,
-2.386313, 0.1694933, 0.3211169, 0, 0, 0, 1, 1,
-2.238055, 0.6731787, -1.174359, 0, 0, 0, 1, 1,
-2.235701, -0.7659394, -1.39665, 0, 0, 0, 1, 1,
-2.185498, -1.651216, -4.29583, 0, 0, 0, 1, 1,
-2.181391, 1.165644, -1.80832, 0, 0, 0, 1, 1,
-2.038708, 1.286975, -1.886572, 0, 0, 0, 1, 1,
-2.038548, -0.7096034, -2.283471, 0, 0, 0, 1, 1,
-2.03576, -0.4376719, -1.587696, 1, 1, 1, 1, 1,
-2.025191, -0.930262, -2.283863, 1, 1, 1, 1, 1,
-2.00183, -0.2344914, -1.240371, 1, 1, 1, 1, 1,
-1.99612, 0.7961046, -1.579988, 1, 1, 1, 1, 1,
-1.957809, 1.271306, 0.03979707, 1, 1, 1, 1, 1,
-1.956763, 0.1808293, -1.359654, 1, 1, 1, 1, 1,
-1.932814, 0.396066, -1.684638, 1, 1, 1, 1, 1,
-1.910459, 0.05814961, -1.519884, 1, 1, 1, 1, 1,
-1.904966, 1.023168, -1.974779, 1, 1, 1, 1, 1,
-1.898298, -1.043283, -2.360325, 1, 1, 1, 1, 1,
-1.879882, -0.1831629, -1.4737, 1, 1, 1, 1, 1,
-1.876697, -0.8414931, -2.642901, 1, 1, 1, 1, 1,
-1.862168, 0.7231251, -2.140568, 1, 1, 1, 1, 1,
-1.861993, -0.9326106, -1.957796, 1, 1, 1, 1, 1,
-1.858726, -0.8814803, -3.085652, 1, 1, 1, 1, 1,
-1.857428, 2.241719, -1.854178, 0, 0, 1, 1, 1,
-1.851195, 0.6576642, -1.811367, 1, 0, 0, 1, 1,
-1.799748, -1.259538, -1.694269, 1, 0, 0, 1, 1,
-1.790832, -0.8841531, -2.222166, 1, 0, 0, 1, 1,
-1.788177, 0.928136, 0.1753502, 1, 0, 0, 1, 1,
-1.779313, 1.795142, -2.625068, 1, 0, 0, 1, 1,
-1.775756, -0.1097543, -2.207134, 0, 0, 0, 1, 1,
-1.74697, 1.223919, 0.2003072, 0, 0, 0, 1, 1,
-1.744295, -1.901962, -2.395171, 0, 0, 0, 1, 1,
-1.739303, -0.445866, -2.59177, 0, 0, 0, 1, 1,
-1.738726, 0.4983739, 0.83279, 0, 0, 0, 1, 1,
-1.727393, -0.6597018, -1.662, 0, 0, 0, 1, 1,
-1.719043, -1.739578, -1.985228, 0, 0, 0, 1, 1,
-1.718647, 0.569581, -0.2511708, 1, 1, 1, 1, 1,
-1.705561, -1.667164, -1.985984, 1, 1, 1, 1, 1,
-1.667261, 1.792384, -0.9367872, 1, 1, 1, 1, 1,
-1.653317, 0.2892843, -3.192517, 1, 1, 1, 1, 1,
-1.627573, -1.054516, -0.5554839, 1, 1, 1, 1, 1,
-1.624032, 1.285673, 0.2531562, 1, 1, 1, 1, 1,
-1.579401, 2.490362, -1.036528, 1, 1, 1, 1, 1,
-1.573088, 1.792423, -0.7557822, 1, 1, 1, 1, 1,
-1.569091, -0.3693611, -2.479084, 1, 1, 1, 1, 1,
-1.560045, 0.002256542, -2.816775, 1, 1, 1, 1, 1,
-1.559883, -1.615219, -2.654824, 1, 1, 1, 1, 1,
-1.528315, 0.02727672, -1.414804, 1, 1, 1, 1, 1,
-1.518041, -0.2773029, -2.951736, 1, 1, 1, 1, 1,
-1.517986, -0.2883399, -0.7253008, 1, 1, 1, 1, 1,
-1.516716, 0.4681541, -1.340642, 1, 1, 1, 1, 1,
-1.505199, 0.1636133, -1.056381, 0, 0, 1, 1, 1,
-1.501469, -0.7637249, -0.6499551, 1, 0, 0, 1, 1,
-1.487906, 0.4485093, -0.4913248, 1, 0, 0, 1, 1,
-1.48401, -0.8386203, -2.302598, 1, 0, 0, 1, 1,
-1.480343, 0.2521471, -1.088388, 1, 0, 0, 1, 1,
-1.47675, -0.07991631, -2.445558, 1, 0, 0, 1, 1,
-1.474182, 1.154382, 0.1810229, 0, 0, 0, 1, 1,
-1.473616, -0.07808493, -2.285045, 0, 0, 0, 1, 1,
-1.472616, -0.4628157, -2.199211, 0, 0, 0, 1, 1,
-1.458781, -0.2282183, -2.091694, 0, 0, 0, 1, 1,
-1.456547, 0.292779, -0.04618725, 0, 0, 0, 1, 1,
-1.45027, 0.7800817, -0.5820744, 0, 0, 0, 1, 1,
-1.447571, -0.2449719, -2.016693, 0, 0, 0, 1, 1,
-1.433336, 0.001712963, -0.06630717, 1, 1, 1, 1, 1,
-1.432803, 1.070528, -0.2772099, 1, 1, 1, 1, 1,
-1.420315, -1.245105, -2.645282, 1, 1, 1, 1, 1,
-1.416804, 0.8887029, -0.1734619, 1, 1, 1, 1, 1,
-1.413359, -2.449135, -2.441647, 1, 1, 1, 1, 1,
-1.393698, -0.640646, -1.756516, 1, 1, 1, 1, 1,
-1.388704, -0.06155365, -0.7063174, 1, 1, 1, 1, 1,
-1.370073, -0.574746, -1.275875, 1, 1, 1, 1, 1,
-1.362773, -1.103047, -0.2942261, 1, 1, 1, 1, 1,
-1.349556, -0.2043008, -1.216023, 1, 1, 1, 1, 1,
-1.326748, 1.826513, -1.211101, 1, 1, 1, 1, 1,
-1.313669, 0.2074024, -0.372434, 1, 1, 1, 1, 1,
-1.299681, 1.055007, 0.305385, 1, 1, 1, 1, 1,
-1.298555, 0.5991665, -0.8871613, 1, 1, 1, 1, 1,
-1.297532, 0.5437354, -1.486745, 1, 1, 1, 1, 1,
-1.296292, 1.534355, -2.78875, 0, 0, 1, 1, 1,
-1.288052, -0.02903427, -1.283208, 1, 0, 0, 1, 1,
-1.286377, 0.4416871, -0.6051934, 1, 0, 0, 1, 1,
-1.271118, 0.2680755, -0.4845997, 1, 0, 0, 1, 1,
-1.265686, -0.5717613, -0.8001109, 1, 0, 0, 1, 1,
-1.257784, 0.7347183, -1.554798, 1, 0, 0, 1, 1,
-1.257776, 0.6943358, -0.07014789, 0, 0, 0, 1, 1,
-1.255072, -0.6738431, -2.297357, 0, 0, 0, 1, 1,
-1.25046, 0.5593832, 0.4289299, 0, 0, 0, 1, 1,
-1.236999, 0.5676209, -0.7211906, 0, 0, 0, 1, 1,
-1.222884, -0.8078644, -0.9684597, 0, 0, 0, 1, 1,
-1.22215, 0.03805048, -1.060639, 0, 0, 0, 1, 1,
-1.211476, 2.647325, 0.6986787, 0, 0, 0, 1, 1,
-1.209332, 1.235215, -0.8222785, 1, 1, 1, 1, 1,
-1.208502, 0.2087181, -2.673241, 1, 1, 1, 1, 1,
-1.203991, 1.455461, -0.8426336, 1, 1, 1, 1, 1,
-1.202463, -1.432494, -4.563158, 1, 1, 1, 1, 1,
-1.201422, -0.9119503, -3.584283, 1, 1, 1, 1, 1,
-1.200312, 0.7531024, -0.07530627, 1, 1, 1, 1, 1,
-1.199198, -0.3073351, -2.722779, 1, 1, 1, 1, 1,
-1.195946, 1.310281, 1.036317, 1, 1, 1, 1, 1,
-1.179107, 0.4522088, -0.2023578, 1, 1, 1, 1, 1,
-1.17867, -0.09243364, -3.091719, 1, 1, 1, 1, 1,
-1.17716, 0.9218495, -2.17815, 1, 1, 1, 1, 1,
-1.174812, -0.6888967, -3.016143, 1, 1, 1, 1, 1,
-1.163885, -1.104471, -2.463253, 1, 1, 1, 1, 1,
-1.159679, 0.7114234, -1.038351, 1, 1, 1, 1, 1,
-1.156767, -0.9832169, -1.922752, 1, 1, 1, 1, 1,
-1.143751, 0.1239196, -0.316011, 0, 0, 1, 1, 1,
-1.142341, -0.2425679, -3.66296, 1, 0, 0, 1, 1,
-1.142169, 0.5172465, -0.5047712, 1, 0, 0, 1, 1,
-1.139061, -0.506747, -1.538009, 1, 0, 0, 1, 1,
-1.134622, 0.1130883, -3.737001, 1, 0, 0, 1, 1,
-1.131775, 0.4847888, -2.596487, 1, 0, 0, 1, 1,
-1.12824, -0.9092498, -1.497765, 0, 0, 0, 1, 1,
-1.101509, -0.3432172, -0.5257378, 0, 0, 0, 1, 1,
-1.0978, 0.1941802, -2.17289, 0, 0, 0, 1, 1,
-1.093407, -0.3153013, -2.590925, 0, 0, 0, 1, 1,
-1.091331, -0.2408439, -2.815276, 0, 0, 0, 1, 1,
-1.089494, -0.5514089, -1.133317, 0, 0, 0, 1, 1,
-1.085656, 0.9008377, -1.928386, 0, 0, 0, 1, 1,
-1.076799, 0.149512, -2.794511, 1, 1, 1, 1, 1,
-1.075977, -0.8317799, -3.482948, 1, 1, 1, 1, 1,
-1.068984, -0.5884874, -3.709645, 1, 1, 1, 1, 1,
-1.060153, -0.09082323, -2.257604, 1, 1, 1, 1, 1,
-1.059045, -1.614109, -1.47958, 1, 1, 1, 1, 1,
-1.040008, 0.02604556, -2.12852, 1, 1, 1, 1, 1,
-1.039602, 0.2472015, -1.492997, 1, 1, 1, 1, 1,
-1.039301, 0.6968705, -1.099636, 1, 1, 1, 1, 1,
-1.028502, -0.7665991, -1.510216, 1, 1, 1, 1, 1,
-1.027539, -1.334317, -2.041901, 1, 1, 1, 1, 1,
-1.012475, 0.38771, -2.471247, 1, 1, 1, 1, 1,
-1.010441, -0.4870271, -4.282005, 1, 1, 1, 1, 1,
-1.010008, 1.585612, 0.6629127, 1, 1, 1, 1, 1,
-1.009383, 0.8485753, -1.62437, 1, 1, 1, 1, 1,
-1.00853, -0.1839395, 0.007130453, 1, 1, 1, 1, 1,
-1.008326, -0.2875154, -1.006626, 0, 0, 1, 1, 1,
-1.007761, 1.464013, 0.8421379, 1, 0, 0, 1, 1,
-1.000775, -0.05096384, -0.8273744, 1, 0, 0, 1, 1,
-0.9951637, -1.515223, -3.080459, 1, 0, 0, 1, 1,
-0.9943142, 0.7984272, 0.110384, 1, 0, 0, 1, 1,
-0.9897675, 0.1254731, -1.62596, 1, 0, 0, 1, 1,
-0.9859743, -1.666553, -2.884135, 0, 0, 0, 1, 1,
-0.9844564, 1.357309, -2.301433, 0, 0, 0, 1, 1,
-0.9835719, 0.9587165, -1.149778, 0, 0, 0, 1, 1,
-0.9822661, 0.5545037, -0.02537084, 0, 0, 0, 1, 1,
-0.97752, -0.4021605, -2.862735, 0, 0, 0, 1, 1,
-0.9727407, 0.6557112, -0.3474807, 0, 0, 0, 1, 1,
-0.9641181, 0.3679831, -2.912598, 0, 0, 0, 1, 1,
-0.9638681, 0.4186351, -0.1694011, 1, 1, 1, 1, 1,
-0.9484054, -0.4173809, -0.3980907, 1, 1, 1, 1, 1,
-0.9438682, -1.705114, -1.149351, 1, 1, 1, 1, 1,
-0.9432833, -0.8919941, -2.217566, 1, 1, 1, 1, 1,
-0.9400426, -0.4469032, -1.169053, 1, 1, 1, 1, 1,
-0.9383342, 0.8613117, 0.2648394, 1, 1, 1, 1, 1,
-0.9319602, -1.508526, -2.929722, 1, 1, 1, 1, 1,
-0.9310977, -0.8312715, -2.608249, 1, 1, 1, 1, 1,
-0.9285293, 1.311273, -1.771134, 1, 1, 1, 1, 1,
-0.9279972, 1.29392, 0.65979, 1, 1, 1, 1, 1,
-0.9244596, -1.164746, -3.011541, 1, 1, 1, 1, 1,
-0.9243214, 0.1132988, -1.201728, 1, 1, 1, 1, 1,
-0.9217399, 2.932537, -2.220084, 1, 1, 1, 1, 1,
-0.9216094, 0.8445492, -0.08213033, 1, 1, 1, 1, 1,
-0.9117709, 0.6512488, -2.176443, 1, 1, 1, 1, 1,
-0.9107971, -0.03539003, -1.154619, 0, 0, 1, 1, 1,
-0.9106386, -2.172588, -2.129644, 1, 0, 0, 1, 1,
-0.9095362, 0.09164163, -0.9363638, 1, 0, 0, 1, 1,
-0.9072818, -0.3610974, -1.458145, 1, 0, 0, 1, 1,
-0.9068425, 0.5895538, -1.316296, 1, 0, 0, 1, 1,
-0.9043659, 0.7589348, 0.6689841, 1, 0, 0, 1, 1,
-0.9028268, 0.3425981, -0.6362473, 0, 0, 0, 1, 1,
-0.8950262, 0.07849294, -1.245672, 0, 0, 0, 1, 1,
-0.8899072, -0.7819569, -1.42926, 0, 0, 0, 1, 1,
-0.8877761, -0.05231092, -0.4437751, 0, 0, 0, 1, 1,
-0.8799282, 1.554179, -2.379539, 0, 0, 0, 1, 1,
-0.8794411, -0.07376587, -1.16671, 0, 0, 0, 1, 1,
-0.8698794, 0.4935376, -1.487193, 0, 0, 0, 1, 1,
-0.8667991, -1.650411, -1.504779, 1, 1, 1, 1, 1,
-0.8659855, 0.314085, -2.328622, 1, 1, 1, 1, 1,
-0.8656617, 1.859541, -1.165824, 1, 1, 1, 1, 1,
-0.8611816, -0.4240016, -1.450577, 1, 1, 1, 1, 1,
-0.8573971, 0.4400233, -0.9889334, 1, 1, 1, 1, 1,
-0.8546877, -0.9494815, -3.122323, 1, 1, 1, 1, 1,
-0.842815, -0.6525092, -3.682151, 1, 1, 1, 1, 1,
-0.8389737, 0.05174162, -2.055004, 1, 1, 1, 1, 1,
-0.8365189, 0.151913, -0.7584199, 1, 1, 1, 1, 1,
-0.8345229, 0.8931808, -0.3661123, 1, 1, 1, 1, 1,
-0.8281512, -1.360376, -2.253151, 1, 1, 1, 1, 1,
-0.827281, -0.4228278, -1.498811, 1, 1, 1, 1, 1,
-0.8203, 0.5382421, -0.9519737, 1, 1, 1, 1, 1,
-0.8183278, -0.4843842, -2.093364, 1, 1, 1, 1, 1,
-0.8177505, -0.3807339, -3.470758, 1, 1, 1, 1, 1,
-0.8171375, -0.09128042, 0.6843225, 0, 0, 1, 1, 1,
-0.8158337, 0.2371218, -1.502247, 1, 0, 0, 1, 1,
-0.811831, -1.048234, -1.864701, 1, 0, 0, 1, 1,
-0.8097345, 0.4332106, -0.3409736, 1, 0, 0, 1, 1,
-0.8094704, -0.3445553, -1.197499, 1, 0, 0, 1, 1,
-0.8070586, -1.985061, -4.028965, 1, 0, 0, 1, 1,
-0.8037408, -1.091174, -1.869015, 0, 0, 0, 1, 1,
-0.8036618, -0.2883338, -0.5447626, 0, 0, 0, 1, 1,
-0.7997481, 1.729481, -0.5657709, 0, 0, 0, 1, 1,
-0.7968464, 0.3207954, -1.394968, 0, 0, 0, 1, 1,
-0.7903557, 1.963586, -2.009997, 0, 0, 0, 1, 1,
-0.7858202, -0.3069218, -3.363324, 0, 0, 0, 1, 1,
-0.7754605, 0.4581873, -1.572868, 0, 0, 0, 1, 1,
-0.7733412, -1.345731, -1.865254, 1, 1, 1, 1, 1,
-0.7727823, 0.5326622, -1.281166, 1, 1, 1, 1, 1,
-0.7648834, -0.1102948, -1.493043, 1, 1, 1, 1, 1,
-0.7595085, -0.3928008, -2.486548, 1, 1, 1, 1, 1,
-0.756237, 0.783399, -0.3101384, 1, 1, 1, 1, 1,
-0.7537234, 1.002896, -1.213568, 1, 1, 1, 1, 1,
-0.7506894, 0.6975581, -2.73261, 1, 1, 1, 1, 1,
-0.7497553, 0.9003731, -0.2844743, 1, 1, 1, 1, 1,
-0.7435717, 0.0995103, -2.429084, 1, 1, 1, 1, 1,
-0.7433222, -0.1758122, -3.060511, 1, 1, 1, 1, 1,
-0.7426624, -1.668189, -3.376785, 1, 1, 1, 1, 1,
-0.7415221, 0.1137595, -2.394596, 1, 1, 1, 1, 1,
-0.739925, 1.408538, -0.9281539, 1, 1, 1, 1, 1,
-0.7396191, 0.3535933, -1.509726, 1, 1, 1, 1, 1,
-0.7394838, 0.8633239, -0.1455122, 1, 1, 1, 1, 1,
-0.7393081, -0.00159423, -0.01422239, 0, 0, 1, 1, 1,
-0.7374237, -0.9425442, -3.120136, 1, 0, 0, 1, 1,
-0.7369562, 0.1057413, -1.160945, 1, 0, 0, 1, 1,
-0.7336596, 1.480764, -0.03796059, 1, 0, 0, 1, 1,
-0.7304838, -0.1066257, -2.292858, 1, 0, 0, 1, 1,
-0.730243, 0.1750257, -0.781373, 1, 0, 0, 1, 1,
-0.7250599, -0.6543438, -2.590735, 0, 0, 0, 1, 1,
-0.7243633, 1.038333, -1.097597, 0, 0, 0, 1, 1,
-0.7202342, -0.7376314, -2.430493, 0, 0, 0, 1, 1,
-0.719135, 0.5595803, 0.6079915, 0, 0, 0, 1, 1,
-0.7177148, -2.233736, -2.775783, 0, 0, 0, 1, 1,
-0.7153938, 0.009749452, 0.2680962, 0, 0, 0, 1, 1,
-0.7139936, -1.791294, -3.87115, 0, 0, 0, 1, 1,
-0.7137508, 0.8963185, 0.5459501, 1, 1, 1, 1, 1,
-0.7051988, 0.7700975, 0.3566724, 1, 1, 1, 1, 1,
-0.7051248, -0.1664657, -0.9212673, 1, 1, 1, 1, 1,
-0.7011523, -0.4580624, -1.130146, 1, 1, 1, 1, 1,
-0.7004601, 0.01660902, -1.18589, 1, 1, 1, 1, 1,
-0.6875123, 0.3555286, -1.496361, 1, 1, 1, 1, 1,
-0.6856334, 0.3141794, -0.3847813, 1, 1, 1, 1, 1,
-0.6848462, 0.7727292, -1.481581, 1, 1, 1, 1, 1,
-0.6837531, 0.5989888, -1.492547, 1, 1, 1, 1, 1,
-0.681734, -1.503706, -0.9006423, 1, 1, 1, 1, 1,
-0.6685271, 0.3106942, -2.701204, 1, 1, 1, 1, 1,
-0.6677245, 0.3295249, -0.5306287, 1, 1, 1, 1, 1,
-0.6633033, -1.286185, -3.978373, 1, 1, 1, 1, 1,
-0.658739, -0.1144077, -2.051594, 1, 1, 1, 1, 1,
-0.6582193, -1.843697, -1.576278, 1, 1, 1, 1, 1,
-0.6580982, -0.9478126, -3.188866, 0, 0, 1, 1, 1,
-0.6571862, 0.2837611, -0.7654256, 1, 0, 0, 1, 1,
-0.6553404, 0.55299, -0.5251675, 1, 0, 0, 1, 1,
-0.6548675, -1.111208, -3.842726, 1, 0, 0, 1, 1,
-0.6475508, -0.3330778, -2.576608, 1, 0, 0, 1, 1,
-0.6420941, 0.79562, 1.065596, 1, 0, 0, 1, 1,
-0.6394431, -0.525132, -2.425662, 0, 0, 0, 1, 1,
-0.6383051, -0.1543367, -2.514325, 0, 0, 0, 1, 1,
-0.634939, 0.1109546, -2.010572, 0, 0, 0, 1, 1,
-0.6334299, -0.1481945, -1.682265, 0, 0, 0, 1, 1,
-0.6307532, 0.9932423, -0.448382, 0, 0, 0, 1, 1,
-0.6305817, -1.393538, -4.657885, 0, 0, 0, 1, 1,
-0.6295733, -1.937374, -1.388177, 0, 0, 0, 1, 1,
-0.6286976, 1.226858, 0.04861812, 1, 1, 1, 1, 1,
-0.6285254, -0.002747067, -1.076353, 1, 1, 1, 1, 1,
-0.6263459, -0.6707902, -4.297092, 1, 1, 1, 1, 1,
-0.6254104, -0.9978516, -2.234309, 1, 1, 1, 1, 1,
-0.6218611, 0.3241669, 0.3742825, 1, 1, 1, 1, 1,
-0.6213624, 1.63036, -0.5053515, 1, 1, 1, 1, 1,
-0.6200692, -1.627255, -2.730461, 1, 1, 1, 1, 1,
-0.6099812, -0.9179848, -1.60829, 1, 1, 1, 1, 1,
-0.6093435, -2.124431, -2.642441, 1, 1, 1, 1, 1,
-0.6048555, 0.85804, 0.02516855, 1, 1, 1, 1, 1,
-0.5983762, -1.41643, -3.058666, 1, 1, 1, 1, 1,
-0.5981333, 1.085056, 0.2542629, 1, 1, 1, 1, 1,
-0.590107, 0.2667535, -2.415263, 1, 1, 1, 1, 1,
-0.5884539, 0.5289313, -0.3999016, 1, 1, 1, 1, 1,
-0.587821, 0.3011759, -0.2498612, 1, 1, 1, 1, 1,
-0.5855479, -1.333194, 0.0007141958, 0, 0, 1, 1, 1,
-0.5847192, -0.6646411, -3.036533, 1, 0, 0, 1, 1,
-0.5833274, -0.5639234, -4.353798, 1, 0, 0, 1, 1,
-0.583049, -0.2755371, -1.817812, 1, 0, 0, 1, 1,
-0.5791423, 0.5812786, 0.2688082, 1, 0, 0, 1, 1,
-0.5777464, 0.2028708, 0.6477565, 1, 0, 0, 1, 1,
-0.5776684, -0.06175962, -3.091727, 0, 0, 0, 1, 1,
-0.5767119, 0.02857593, -2.041929, 0, 0, 0, 1, 1,
-0.575031, 0.03726134, -3.104351, 0, 0, 0, 1, 1,
-0.5731071, -0.7274625, -4.351598, 0, 0, 0, 1, 1,
-0.563548, 0.9774888, -1.500566, 0, 0, 0, 1, 1,
-0.5582053, -0.326549, -1.43197, 0, 0, 0, 1, 1,
-0.5569369, -0.7712021, -2.345427, 0, 0, 0, 1, 1,
-0.5523463, 0.8019918, -0.2042541, 1, 1, 1, 1, 1,
-0.5452291, 0.615598, -0.3722459, 1, 1, 1, 1, 1,
-0.5415946, -0.1225014, -2.800559, 1, 1, 1, 1, 1,
-0.5396799, 0.6157242, -3.030349, 1, 1, 1, 1, 1,
-0.5353634, 1.277755, 0.6962885, 1, 1, 1, 1, 1,
-0.5342845, -0.8339998, -3.981631, 1, 1, 1, 1, 1,
-0.5322574, -0.5377613, -3.372671, 1, 1, 1, 1, 1,
-0.5314506, 0.4357282, 0.4717953, 1, 1, 1, 1, 1,
-0.5245258, -0.2941226, -1.362111, 1, 1, 1, 1, 1,
-0.5232777, 0.9601185, -1.733397, 1, 1, 1, 1, 1,
-0.5227498, -0.4777661, -1.62558, 1, 1, 1, 1, 1,
-0.5190222, 1.102317, -0.9389668, 1, 1, 1, 1, 1,
-0.513152, -0.46858, -4.018672, 1, 1, 1, 1, 1,
-0.5107461, -1.323663, -2.494485, 1, 1, 1, 1, 1,
-0.5104957, -2.00093, -1.841187, 1, 1, 1, 1, 1,
-0.509837, 1.787519, -1.931734, 0, 0, 1, 1, 1,
-0.5097138, 0.4258738, -0.2700678, 1, 0, 0, 1, 1,
-0.5096763, -1.351082, -4.327963, 1, 0, 0, 1, 1,
-0.5061819, -0.401284, -2.654251, 1, 0, 0, 1, 1,
-0.5041632, -0.650413, -1.007216, 1, 0, 0, 1, 1,
-0.4981053, 1.015411, -0.9714745, 1, 0, 0, 1, 1,
-0.4976029, 1.391273, -0.4750636, 0, 0, 0, 1, 1,
-0.4902219, -1.546561, -3.383803, 0, 0, 0, 1, 1,
-0.4848092, 0.01497753, -2.044261, 0, 0, 0, 1, 1,
-0.4841431, -0.4400573, -2.251854, 0, 0, 0, 1, 1,
-0.4785224, 0.9282447, 0.1559044, 0, 0, 0, 1, 1,
-0.4770363, -0.8043464, -1.19474, 0, 0, 0, 1, 1,
-0.4763195, 1.605325, 0.7002727, 0, 0, 0, 1, 1,
-0.4746105, -1.208738, -3.511083, 1, 1, 1, 1, 1,
-0.4734238, -0.1884155, -2.637843, 1, 1, 1, 1, 1,
-0.4732089, -0.7444221, -2.737127, 1, 1, 1, 1, 1,
-0.468391, 1.443074, 0.3157872, 1, 1, 1, 1, 1,
-0.4627528, 0.1509945, -2.710046, 1, 1, 1, 1, 1,
-0.4605982, 0.160413, -1.656574, 1, 1, 1, 1, 1,
-0.4572139, 0.284015, -0.8579734, 1, 1, 1, 1, 1,
-0.456732, 0.3271407, -1.28309, 1, 1, 1, 1, 1,
-0.4430073, 0.1930913, -1.61604, 1, 1, 1, 1, 1,
-0.4423958, 0.6190424, -0.6461, 1, 1, 1, 1, 1,
-0.4410337, -0.4981067, -2.470361, 1, 1, 1, 1, 1,
-0.4409035, -1.593727, -3.952844, 1, 1, 1, 1, 1,
-0.4391277, 2.283469, 0.1935907, 1, 1, 1, 1, 1,
-0.4307545, -1.266979, -1.562784, 1, 1, 1, 1, 1,
-0.4299973, 0.05021626, -0.3181123, 1, 1, 1, 1, 1,
-0.4177505, -0.5870582, -1.145087, 0, 0, 1, 1, 1,
-0.4169053, 0.1280208, -1.468517, 1, 0, 0, 1, 1,
-0.4093411, 0.3417857, 0.4815787, 1, 0, 0, 1, 1,
-0.4004954, 0.293934, 0.2396822, 1, 0, 0, 1, 1,
-0.3995038, -1.326271, -3.802923, 1, 0, 0, 1, 1,
-0.3994075, -2.177161, -3.423643, 1, 0, 0, 1, 1,
-0.3897887, 0.8189009, 0.308977, 0, 0, 0, 1, 1,
-0.3889364, 1.986426, 0.8487214, 0, 0, 0, 1, 1,
-0.3844564, -0.1592561, -2.09607, 0, 0, 0, 1, 1,
-0.3814804, 1.20086, -0.1317503, 0, 0, 0, 1, 1,
-0.3811909, 1.802997, -2.839075, 0, 0, 0, 1, 1,
-0.3756085, -0.8076664, -3.789632, 0, 0, 0, 1, 1,
-0.3754355, -0.377229, -2.932683, 0, 0, 0, 1, 1,
-0.3712316, -1.068412, -2.923376, 1, 1, 1, 1, 1,
-0.3705129, 0.5248483, -1.313015, 1, 1, 1, 1, 1,
-0.3654723, 0.4400793, -0.9017661, 1, 1, 1, 1, 1,
-0.3637199, 2.601444, 0.5673563, 1, 1, 1, 1, 1,
-0.3630537, 1.822327, -0.008948741, 1, 1, 1, 1, 1,
-0.3620911, -0.2692557, -4.291787, 1, 1, 1, 1, 1,
-0.3597135, 1.368022, -1.965745, 1, 1, 1, 1, 1,
-0.3469307, -1.034275, -2.620813, 1, 1, 1, 1, 1,
-0.3446395, -1.440861, -3.321163, 1, 1, 1, 1, 1,
-0.343108, 0.09141177, -1.835009, 1, 1, 1, 1, 1,
-0.3414768, -1.436965, -2.745085, 1, 1, 1, 1, 1,
-0.3412783, 0.4563391, -1.944926, 1, 1, 1, 1, 1,
-0.3377148, -0.4668712, -2.980988, 1, 1, 1, 1, 1,
-0.3351062, 0.9929811, -0.5546466, 1, 1, 1, 1, 1,
-0.3345787, -0.03655683, -1.769688, 1, 1, 1, 1, 1,
-0.3299666, -0.4625974, -0.6354105, 0, 0, 1, 1, 1,
-0.3274944, -1.849879, -3.539627, 1, 0, 0, 1, 1,
-0.3269813, 1.23066, -0.3192759, 1, 0, 0, 1, 1,
-0.3261347, -0.3592734, -1.204404, 1, 0, 0, 1, 1,
-0.3236661, -0.3628659, -2.959404, 1, 0, 0, 1, 1,
-0.3202257, 0.5641176, -0.07261406, 1, 0, 0, 1, 1,
-0.3127089, -0.8203818, -2.321639, 0, 0, 0, 1, 1,
-0.3089609, 2.521096, -0.3530619, 0, 0, 0, 1, 1,
-0.3088908, -0.4559247, -3.523857, 0, 0, 0, 1, 1,
-0.3058479, 0.9593152, -0.6868523, 0, 0, 0, 1, 1,
-0.3050615, -0.4139669, -3.484006, 0, 0, 0, 1, 1,
-0.3040811, 1.589525, 2.33633, 0, 0, 0, 1, 1,
-0.3027629, -0.5073429, -3.889583, 0, 0, 0, 1, 1,
-0.2951281, 0.2898262, 1.558449, 1, 1, 1, 1, 1,
-0.2925954, 0.8844247, -1.035177, 1, 1, 1, 1, 1,
-0.2893162, 0.00162828, -2.20202, 1, 1, 1, 1, 1,
-0.2845923, -0.5522436, -3.211475, 1, 1, 1, 1, 1,
-0.283502, -2.30609, -3.62974, 1, 1, 1, 1, 1,
-0.2745452, 1.172504, 0.1333248, 1, 1, 1, 1, 1,
-0.2698655, -1.010683, -3.054036, 1, 1, 1, 1, 1,
-0.2696327, 0.3407996, -0.7740355, 1, 1, 1, 1, 1,
-0.2656559, 0.6818181, 0.04412002, 1, 1, 1, 1, 1,
-0.2643476, -1.360919, -2.992287, 1, 1, 1, 1, 1,
-0.2641013, -1.300185, -2.281087, 1, 1, 1, 1, 1,
-0.2630595, 1.159127, 1.055793, 1, 1, 1, 1, 1,
-0.2601794, -0.9555117, -2.371954, 1, 1, 1, 1, 1,
-0.2576645, 1.058535, 0.1796374, 1, 1, 1, 1, 1,
-0.2528777, -0.7857625, -1.695592, 1, 1, 1, 1, 1,
-0.2505745, -1.027158, -3.267828, 0, 0, 1, 1, 1,
-0.2504642, 3.857882, 0.2715989, 1, 0, 0, 1, 1,
-0.2498906, 0.6313303, 0.04671693, 1, 0, 0, 1, 1,
-0.2460942, -0.8450199, -1.464571, 1, 0, 0, 1, 1,
-0.2458398, -0.9700183, -3.406755, 1, 0, 0, 1, 1,
-0.2453, -0.7388588, -1.564666, 1, 0, 0, 1, 1,
-0.2444737, 0.5244737, -0.08652036, 0, 0, 0, 1, 1,
-0.2414696, 0.428067, -0.4087526, 0, 0, 0, 1, 1,
-0.2380233, 2.264071, -0.8213089, 0, 0, 0, 1, 1,
-0.2342705, 0.04404447, 0.1747907, 0, 0, 0, 1, 1,
-0.2304658, 2.737457, -0.3934158, 0, 0, 0, 1, 1,
-0.2265442, 0.5740545, 0.7601508, 0, 0, 0, 1, 1,
-0.2236949, 1.498022, -1.909552, 0, 0, 0, 1, 1,
-0.2222849, -0.15433, -2.39247, 1, 1, 1, 1, 1,
-0.2187719, -0.7219471, -3.982527, 1, 1, 1, 1, 1,
-0.2134608, 1.225127, 0.573502, 1, 1, 1, 1, 1,
-0.2103445, 0.9159163, 0.4500868, 1, 1, 1, 1, 1,
-0.2093121, -0.8360851, -5.197251, 1, 1, 1, 1, 1,
-0.2081032, 0.1126742, -0.9976035, 1, 1, 1, 1, 1,
-0.2029093, -1.468028, -2.818104, 1, 1, 1, 1, 1,
-0.1995098, -0.2770413, -2.287847, 1, 1, 1, 1, 1,
-0.193315, -1.256266, -3.179758, 1, 1, 1, 1, 1,
-0.192769, -1.137836, -4.132876, 1, 1, 1, 1, 1,
-0.1923051, 1.325253, -0.1958363, 1, 1, 1, 1, 1,
-0.1921334, -0.387353, -1.757922, 1, 1, 1, 1, 1,
-0.1873766, -0.3400952, -4.564678, 1, 1, 1, 1, 1,
-0.1803929, -0.3204008, -2.377349, 1, 1, 1, 1, 1,
-0.1801169, 1.651601, 0.9765961, 1, 1, 1, 1, 1,
-0.1784026, 1.861946, 3.473224, 0, 0, 1, 1, 1,
-0.1763088, -0.7796778, -3.579184, 1, 0, 0, 1, 1,
-0.1702288, 0.4859313, 0.5682453, 1, 0, 0, 1, 1,
-0.170182, -0.984387, -3.672945, 1, 0, 0, 1, 1,
-0.1693408, -1.484149, -3.460897, 1, 0, 0, 1, 1,
-0.1687952, 0.9595697, 0.9452343, 1, 0, 0, 1, 1,
-0.1645732, -0.4055633, -4.655962, 0, 0, 0, 1, 1,
-0.1645481, 0.1005038, 0.3790258, 0, 0, 0, 1, 1,
-0.1631957, -0.1360557, -2.205677, 0, 0, 0, 1, 1,
-0.1626336, 0.1894431, -0.08659953, 0, 0, 0, 1, 1,
-0.1596173, -0.5152043, -3.48933, 0, 0, 0, 1, 1,
-0.1580186, -0.545283, -2.968308, 0, 0, 0, 1, 1,
-0.1555759, 0.9376066, -1.393723, 0, 0, 0, 1, 1,
-0.1550258, -1.479054, -1.157469, 1, 1, 1, 1, 1,
-0.1529019, -1.234941, -2.304307, 1, 1, 1, 1, 1,
-0.1519922, -0.2838521, -3.201635, 1, 1, 1, 1, 1,
-0.1510647, -2.690656, -3.186949, 1, 1, 1, 1, 1,
-0.1502673, -0.1858392, -2.029598, 1, 1, 1, 1, 1,
-0.1486309, -1.525967, -4.826033, 1, 1, 1, 1, 1,
-0.1483434, 0.8792177, -1.026374, 1, 1, 1, 1, 1,
-0.1478313, 0.6518155, -0.3250976, 1, 1, 1, 1, 1,
-0.1430198, -0.4794441, -2.600818, 1, 1, 1, 1, 1,
-0.1405525, -1.64187, -4.429322, 1, 1, 1, 1, 1,
-0.139227, -1.662879, -3.002316, 1, 1, 1, 1, 1,
-0.1384426, 0.8995562, 0.4268669, 1, 1, 1, 1, 1,
-0.1304542, 0.8432953, -0.5953929, 1, 1, 1, 1, 1,
-0.1296183, 0.7644891, -0.1293404, 1, 1, 1, 1, 1,
-0.1292739, 0.00149173, -1.519697, 1, 1, 1, 1, 1,
-0.1274431, -1.535379, -3.746224, 0, 0, 1, 1, 1,
-0.1242477, 0.3850071, 0.2675389, 1, 0, 0, 1, 1,
-0.1165451, -0.07236879, -1.191208, 1, 0, 0, 1, 1,
-0.1159551, -0.2896462, -3.060875, 1, 0, 0, 1, 1,
-0.1092696, -1.03273, -3.977108, 1, 0, 0, 1, 1,
-0.1084699, -1.145167, -1.619403, 1, 0, 0, 1, 1,
-0.1076735, 1.134603, 0.01386983, 0, 0, 0, 1, 1,
-0.1052777, 0.2583349, 0.1163702, 0, 0, 0, 1, 1,
-0.1050761, 0.6901416, 0.4850404, 0, 0, 0, 1, 1,
-0.1045613, 1.413393, 1.140261, 0, 0, 0, 1, 1,
-0.09837842, 1.37874e-05, -1.839131, 0, 0, 0, 1, 1,
-0.09825908, 0.3829205, -0.4086519, 0, 0, 0, 1, 1,
-0.0957089, 0.7315642, -0.905973, 0, 0, 0, 1, 1,
-0.09560928, -0.5524046, -2.548112, 1, 1, 1, 1, 1,
-0.09370253, -1.899287, -4.495275, 1, 1, 1, 1, 1,
-0.09329924, 0.2874728, 0.7925045, 1, 1, 1, 1, 1,
-0.08877598, -1.226972, -0.4912308, 1, 1, 1, 1, 1,
-0.08340061, -0.9567292, -3.392332, 1, 1, 1, 1, 1,
-0.07870797, 0.6636657, 0.04604718, 1, 1, 1, 1, 1,
-0.07251784, 1.176832, 0.3714474, 1, 1, 1, 1, 1,
-0.0677046, 1.470376, -0.6934161, 1, 1, 1, 1, 1,
-0.06444703, 0.3161842, -0.02636246, 1, 1, 1, 1, 1,
-0.06147492, 1.46326, -0.003923672, 1, 1, 1, 1, 1,
-0.0577067, -0.9439691, -3.554063, 1, 1, 1, 1, 1,
-0.05499344, -0.7283973, -2.734901, 1, 1, 1, 1, 1,
-0.05358789, -0.675782, -3.119702, 1, 1, 1, 1, 1,
-0.05353436, -1.355716, -4.718387, 1, 1, 1, 1, 1,
-0.0529402, -1.426306, -0.7350376, 1, 1, 1, 1, 1,
-0.05224337, -0.6093115, -3.353266, 0, 0, 1, 1, 1,
-0.05114566, -0.7547458, -2.032137, 1, 0, 0, 1, 1,
-0.04665237, -0.01795299, 0.08359508, 1, 0, 0, 1, 1,
-0.03841921, 0.8549379, 0.7979066, 1, 0, 0, 1, 1,
-0.03665254, -0.386002, -2.46053, 1, 0, 0, 1, 1,
-0.03363228, 0.304101, 0.9835448, 1, 0, 0, 1, 1,
-0.03300488, 0.7196391, -2.058574, 0, 0, 0, 1, 1,
-0.03222978, 0.5348458, -1.20283, 0, 0, 0, 1, 1,
-0.03027829, 0.7717124, 0.9299571, 0, 0, 0, 1, 1,
-0.02688706, 0.4660245, -2.260897, 0, 0, 0, 1, 1,
-0.02198577, -0.1849293, -3.766992, 0, 0, 0, 1, 1,
-0.02122481, -0.225307, -2.330447, 0, 0, 0, 1, 1,
-0.01110631, -0.4912254, -4.484373, 0, 0, 0, 1, 1,
-0.008840819, -0.1662287, -2.469662, 1, 1, 1, 1, 1,
0.001127801, 0.8406614, 0.1553624, 1, 1, 1, 1, 1,
0.00147462, -0.6695838, 4.517564, 1, 1, 1, 1, 1,
0.007312302, 1.424228, -1.56176, 1, 1, 1, 1, 1,
0.009010808, -0.6814994, 2.403791, 1, 1, 1, 1, 1,
0.01003668, 0.1366007, -0.9499459, 1, 1, 1, 1, 1,
0.01156067, -1.30909, 2.722271, 1, 1, 1, 1, 1,
0.01552384, 1.38346, -0.5071722, 1, 1, 1, 1, 1,
0.0185148, 1.631396, 1.895544, 1, 1, 1, 1, 1,
0.02290284, 0.3399065, -1.727431, 1, 1, 1, 1, 1,
0.02785873, -0.5942793, 2.657703, 1, 1, 1, 1, 1,
0.03002071, -1.196424, 3.642876, 1, 1, 1, 1, 1,
0.03200715, 0.6874682, -1.567952, 1, 1, 1, 1, 1,
0.03587576, -1.239359, 2.0905, 1, 1, 1, 1, 1,
0.03619786, 1.68949, 0.0003846584, 1, 1, 1, 1, 1,
0.03923517, -1.571785, 3.817106, 0, 0, 1, 1, 1,
0.03933277, -1.842394, 3.387563, 1, 0, 0, 1, 1,
0.04066982, -0.6173911, 3.852109, 1, 0, 0, 1, 1,
0.04217605, -0.5110509, 2.626916, 1, 0, 0, 1, 1,
0.04287325, 0.4607144, -1.568916, 1, 0, 0, 1, 1,
0.04813851, -0.03416507, 0.05385001, 1, 0, 0, 1, 1,
0.05141569, -0.6525327, 3.498808, 0, 0, 0, 1, 1,
0.05230293, -0.6268094, 4.601371, 0, 0, 0, 1, 1,
0.05240069, -0.7076725, 4.221872, 0, 0, 0, 1, 1,
0.05362939, -1.157544, 2.580868, 0, 0, 0, 1, 1,
0.05437478, -0.4460942, 2.50599, 0, 0, 0, 1, 1,
0.05683975, -1.090376, 4.256593, 0, 0, 0, 1, 1,
0.06151127, 0.139372, 1.015785, 0, 0, 0, 1, 1,
0.06156036, 2.91963, -0.5144368, 1, 1, 1, 1, 1,
0.07315521, -0.3952567, 3.585237, 1, 1, 1, 1, 1,
0.07612443, -1.334871, 3.666772, 1, 1, 1, 1, 1,
0.07711221, -0.1611491, 1.867968, 1, 1, 1, 1, 1,
0.07866227, -0.2523988, 3.913786, 1, 1, 1, 1, 1,
0.07913141, -0.2507731, 1.247754, 1, 1, 1, 1, 1,
0.08094777, -0.580759, 3.818865, 1, 1, 1, 1, 1,
0.08210986, 0.8834438, 1.011789, 1, 1, 1, 1, 1,
0.08493383, 0.05256529, 1.830709, 1, 1, 1, 1, 1,
0.08849833, -1.79204, 4.119622, 1, 1, 1, 1, 1,
0.08904362, -0.04856117, 4.042556, 1, 1, 1, 1, 1,
0.09180397, 0.7239355, -1.630957, 1, 1, 1, 1, 1,
0.09416307, 1.150633, 0.8639028, 1, 1, 1, 1, 1,
0.09964901, 0.5812631, 0.6698365, 1, 1, 1, 1, 1,
0.09965412, 0.6489768, -0.8304398, 1, 1, 1, 1, 1,
0.1049988, 0.3258426, 1.079254, 0, 0, 1, 1, 1,
0.1077676, -0.4552186, 2.024896, 1, 0, 0, 1, 1,
0.1116962, 0.7809938, -0.3117343, 1, 0, 0, 1, 1,
0.1155427, -1.095006, 4.466915, 1, 0, 0, 1, 1,
0.117074, 0.8781608, 1.36579, 1, 0, 0, 1, 1,
0.1188881, 0.9694532, -0.2497491, 1, 0, 0, 1, 1,
0.1199599, -0.2249357, 1.731411, 0, 0, 0, 1, 1,
0.1200763, -0.7718704, 2.343935, 0, 0, 0, 1, 1,
0.1201295, 0.06728005, 0.2562679, 0, 0, 0, 1, 1,
0.12693, -0.859226, 4.044901, 0, 0, 0, 1, 1,
0.128398, -0.1166979, 3.144921, 0, 0, 0, 1, 1,
0.1289582, -1.243016, 3.885767, 0, 0, 0, 1, 1,
0.1320347, -1.198631, 1.783463, 0, 0, 0, 1, 1,
0.1327032, -1.277749, 2.386443, 1, 1, 1, 1, 1,
0.1338077, -0.7967901, 3.859426, 1, 1, 1, 1, 1,
0.1389467, -2.219566, 3.594565, 1, 1, 1, 1, 1,
0.1405932, 0.2673448, 2.257768, 1, 1, 1, 1, 1,
0.1440426, -2.350509, 2.29752, 1, 1, 1, 1, 1,
0.1479531, -0.1278931, 2.500897, 1, 1, 1, 1, 1,
0.1488153, -0.5806606, 2.191223, 1, 1, 1, 1, 1,
0.1509658, 0.07968815, 1.869605, 1, 1, 1, 1, 1,
0.1523444, -1.077438, 3.675734, 1, 1, 1, 1, 1,
0.1532314, -1.189997, 3.332591, 1, 1, 1, 1, 1,
0.1586308, -1.28375, 1.504025, 1, 1, 1, 1, 1,
0.1586778, 0.3364, -1.029872, 1, 1, 1, 1, 1,
0.1643904, 1.892934, 1.185947, 1, 1, 1, 1, 1,
0.1663639, 0.7458206, -0.8381791, 1, 1, 1, 1, 1,
0.1688983, 1.589353, 0.3276512, 1, 1, 1, 1, 1,
0.1715927, 0.7560471, 2.207874, 0, 0, 1, 1, 1,
0.1767628, -0.1757642, 1.321384, 1, 0, 0, 1, 1,
0.1800236, 0.4759662, 1.579731, 1, 0, 0, 1, 1,
0.1816131, -0.9509301, 2.749253, 1, 0, 0, 1, 1,
0.1920843, 0.02733732, -0.269669, 1, 0, 0, 1, 1,
0.1993672, 1.195614, -1.038581, 1, 0, 0, 1, 1,
0.2009735, 0.6723515, -0.5084774, 0, 0, 0, 1, 1,
0.2009777, 0.05466, 0.7032571, 0, 0, 0, 1, 1,
0.2038892, 1.096285, -0.6332303, 0, 0, 0, 1, 1,
0.2070163, 0.09274168, -1.12114, 0, 0, 0, 1, 1,
0.2085263, 1.501579, -0.05635528, 0, 0, 0, 1, 1,
0.2106632, 0.4098952, -0.05276813, 0, 0, 0, 1, 1,
0.2129773, 3.09447, 0.6517796, 0, 0, 0, 1, 1,
0.2135591, -0.2227767, 3.433345, 1, 1, 1, 1, 1,
0.2150297, -0.3570693, 1.240846, 1, 1, 1, 1, 1,
0.2195174, -0.9223178, 0.8746806, 1, 1, 1, 1, 1,
0.2203993, -3.548348, 2.628008, 1, 1, 1, 1, 1,
0.2294438, 0.8920159, -0.4181558, 1, 1, 1, 1, 1,
0.2303097, -0.07971172, 3.225519, 1, 1, 1, 1, 1,
0.2305192, 0.26943, -0.6363437, 1, 1, 1, 1, 1,
0.2315968, 0.4811363, 0.2926382, 1, 1, 1, 1, 1,
0.2354239, -1.020128, 1.86732, 1, 1, 1, 1, 1,
0.2372443, -0.822687, 2.307335, 1, 1, 1, 1, 1,
0.2390804, 0.5094967, 1.338193, 1, 1, 1, 1, 1,
0.2392489, -1.339039, 2.005501, 1, 1, 1, 1, 1,
0.2398402, -1.430778, 2.972196, 1, 1, 1, 1, 1,
0.240617, -2.531599, 2.282431, 1, 1, 1, 1, 1,
0.2413431, 1.289338, 0.05732057, 1, 1, 1, 1, 1,
0.2473114, 0.4702103, 0.6555099, 0, 0, 1, 1, 1,
0.2484756, 1.605768, 0.317398, 1, 0, 0, 1, 1,
0.2533583, -0.123343, 1.859531, 1, 0, 0, 1, 1,
0.2548881, -1.888217, 3.469931, 1, 0, 0, 1, 1,
0.2622226, 0.01539023, 2.429645, 1, 0, 0, 1, 1,
0.2630746, -1.271462, 4.892949, 1, 0, 0, 1, 1,
0.2659034, 0.3536263, 0.920893, 0, 0, 0, 1, 1,
0.2673594, -0.5394034, 3.267725, 0, 0, 0, 1, 1,
0.2693194, 0.3062166, 0.7936356, 0, 0, 0, 1, 1,
0.271595, 0.5024149, 0.6494474, 0, 0, 0, 1, 1,
0.2740988, 0.2971101, -0.7355034, 0, 0, 0, 1, 1,
0.2798812, -0.4467254, 3.034797, 0, 0, 0, 1, 1,
0.281122, -0.5224255, 0.481635, 0, 0, 0, 1, 1,
0.2817004, -0.1251388, 0.08846819, 1, 1, 1, 1, 1,
0.2866223, -1.60876, 3.515608, 1, 1, 1, 1, 1,
0.2866367, 0.1594403, -0.7218101, 1, 1, 1, 1, 1,
0.2889695, -0.9109089, 2.837565, 1, 1, 1, 1, 1,
0.291337, -0.3788385, 2.973265, 1, 1, 1, 1, 1,
0.2931919, -0.4821711, 2.08907, 1, 1, 1, 1, 1,
0.294598, -2.051085, 4.049426, 1, 1, 1, 1, 1,
0.3000972, 0.6035413, 0.5701041, 1, 1, 1, 1, 1,
0.3109718, -1.126276, 2.843034, 1, 1, 1, 1, 1,
0.3110374, 0.5019149, -0.02501846, 1, 1, 1, 1, 1,
0.3119938, -0.4663552, 2.924617, 1, 1, 1, 1, 1,
0.3128048, -1.362142, 2.319431, 1, 1, 1, 1, 1,
0.3174156, -0.4413122, 2.087615, 1, 1, 1, 1, 1,
0.320731, -0.883229, 1.19291, 1, 1, 1, 1, 1,
0.321644, -2.054451, 3.387755, 1, 1, 1, 1, 1,
0.3235455, 1.088888, 2.1918, 0, 0, 1, 1, 1,
0.3295663, 0.01254927, 1.575, 1, 0, 0, 1, 1,
0.330512, -1.106054, 3.11178, 1, 0, 0, 1, 1,
0.3332175, -0.3561072, 1.316393, 1, 0, 0, 1, 1,
0.3384644, 0.7707412, 0.4433368, 1, 0, 0, 1, 1,
0.3411123, 2.076871, -0.4808893, 1, 0, 0, 1, 1,
0.3416068, -0.6883602, 2.287565, 0, 0, 0, 1, 1,
0.3439614, -0.1197898, 0.2982363, 0, 0, 0, 1, 1,
0.3450244, -1.437025, 2.765197, 0, 0, 0, 1, 1,
0.3463952, 0.1640061, 1.427938, 0, 0, 0, 1, 1,
0.3488894, 0.6450687, -0.001918185, 0, 0, 0, 1, 1,
0.3504593, -1.153108, 4.637158, 0, 0, 0, 1, 1,
0.3509446, -1.069492, 3.826425, 0, 0, 0, 1, 1,
0.352826, -0.7507619, 3.151676, 1, 1, 1, 1, 1,
0.3568965, -0.2375439, 1.725097, 1, 1, 1, 1, 1,
0.357379, 1.216769, 1.029558, 1, 1, 1, 1, 1,
0.3585706, 0.3841744, 1.095844, 1, 1, 1, 1, 1,
0.3589524, 1.014532, 0.8061747, 1, 1, 1, 1, 1,
0.3614735, -1.245591, 0.9723856, 1, 1, 1, 1, 1,
0.3638103, 0.4340268, -0.5525171, 1, 1, 1, 1, 1,
0.3642519, -0.6357229, 3.104758, 1, 1, 1, 1, 1,
0.3660624, 2.04755, -0.2924461, 1, 1, 1, 1, 1,
0.3662799, -0.605267, 0.703671, 1, 1, 1, 1, 1,
0.3689417, -1.357049, 1.857226, 1, 1, 1, 1, 1,
0.374239, 0.7540056, 0.4526051, 1, 1, 1, 1, 1,
0.3747248, 1.163399, -0.3298792, 1, 1, 1, 1, 1,
0.3757999, 0.1288469, 1.019813, 1, 1, 1, 1, 1,
0.3764193, -1.549745, 2.2249, 1, 1, 1, 1, 1,
0.3797293, 0.1057488, 1.261689, 0, 0, 1, 1, 1,
0.3830869, 1.914502, -0.2364323, 1, 0, 0, 1, 1,
0.3901256, -0.4821671, 2.688751, 1, 0, 0, 1, 1,
0.3915774, 1.319583, -0.4557727, 1, 0, 0, 1, 1,
0.3979661, 0.5649281, 2.117595, 1, 0, 0, 1, 1,
0.4040741, 0.4617118, 0.9980941, 1, 0, 0, 1, 1,
0.4048877, 0.5497331, 0.1596814, 0, 0, 0, 1, 1,
0.4078977, 1.302535, 1.032875, 0, 0, 0, 1, 1,
0.4106803, 1.757082, 0.4755306, 0, 0, 0, 1, 1,
0.4172694, 0.8771902, 1.737129, 0, 0, 0, 1, 1,
0.4229548, 0.1955063, 1.308975, 0, 0, 0, 1, 1,
0.4341688, 1.209302, 1.2911, 0, 0, 0, 1, 1,
0.4354633, -0.3269343, -0.06405166, 0, 0, 0, 1, 1,
0.4390311, 1.478552, 1.233913, 1, 1, 1, 1, 1,
0.4419603, -0.1953193, 1.92985, 1, 1, 1, 1, 1,
0.446407, -0.9807531, 3.818866, 1, 1, 1, 1, 1,
0.4544758, -1.048991, 2.409803, 1, 1, 1, 1, 1,
0.4548168, -0.2185331, 2.456383, 1, 1, 1, 1, 1,
0.4575433, -0.005046443, 1.741092, 1, 1, 1, 1, 1,
0.4596851, 1.11913, 1.530938, 1, 1, 1, 1, 1,
0.4640159, 0.982269, 1.268641, 1, 1, 1, 1, 1,
0.4652934, 1.167297, 0.9339877, 1, 1, 1, 1, 1,
0.4661528, 0.505107, 2.142376, 1, 1, 1, 1, 1,
0.4684538, -2.018548, 2.167222, 1, 1, 1, 1, 1,
0.46953, -1.238696, 3.823263, 1, 1, 1, 1, 1,
0.4723403, -0.2123263, 1.707133, 1, 1, 1, 1, 1,
0.4741791, -2.403798, 4.413589, 1, 1, 1, 1, 1,
0.4760411, 0.4030096, 1.923911, 1, 1, 1, 1, 1,
0.4767843, 1.038995, 1.661467, 0, 0, 1, 1, 1,
0.4779968, -0.6879847, 2.348751, 1, 0, 0, 1, 1,
0.4816333, 0.2468659, 2.188801, 1, 0, 0, 1, 1,
0.4839912, -1.132861, 3.873481, 1, 0, 0, 1, 1,
0.4884279, 0.03840748, 1.706815, 1, 0, 0, 1, 1,
0.4889668, 0.2778142, 1.420227, 1, 0, 0, 1, 1,
0.4913319, 0.1785339, 2.211597, 0, 0, 0, 1, 1,
0.4952048, -0.5515938, 2.112458, 0, 0, 0, 1, 1,
0.4986891, -0.6580898, 2.743288, 0, 0, 0, 1, 1,
0.4988372, -0.0004044115, 2.660187, 0, 0, 0, 1, 1,
0.5009757, 1.431362, 1.798091, 0, 0, 0, 1, 1,
0.5024698, 0.09511976, 1.457437, 0, 0, 0, 1, 1,
0.5038821, 2.222807, 0.6458379, 0, 0, 0, 1, 1,
0.5047176, -0.3456333, 1.8434, 1, 1, 1, 1, 1,
0.5049509, -0.7742507, 1.058362, 1, 1, 1, 1, 1,
0.5090771, 0.3879188, -1.027718, 1, 1, 1, 1, 1,
0.5093296, 0.9954781, 1.848491, 1, 1, 1, 1, 1,
0.5116968, 1.139145, -0.6047398, 1, 1, 1, 1, 1,
0.5125388, -0.5250173, 2.382463, 1, 1, 1, 1, 1,
0.5163352, -0.6165635, 1.814757, 1, 1, 1, 1, 1,
0.5171201, 0.2063656, 2.216599, 1, 1, 1, 1, 1,
0.5200025, -0.3681317, 1.912855, 1, 1, 1, 1, 1,
0.522105, 0.9101861, -0.007857156, 1, 1, 1, 1, 1,
0.5261487, -0.5515399, 4.884652, 1, 1, 1, 1, 1,
0.5303142, -1.428717, 0.6260032, 1, 1, 1, 1, 1,
0.5307834, 0.9497845, -0.7890787, 1, 1, 1, 1, 1,
0.5310242, -0.3592362, 1.824736, 1, 1, 1, 1, 1,
0.5387278, -0.9172791, 1.128902, 1, 1, 1, 1, 1,
0.5413451, 1.040054, 0.4292073, 0, 0, 1, 1, 1,
0.5445384, 0.2438417, 1.996134, 1, 0, 0, 1, 1,
0.5462276, 0.1513784, 1.561314, 1, 0, 0, 1, 1,
0.5480395, 0.1122597, 1.944551, 1, 0, 0, 1, 1,
0.5507238, 0.4620008, 0.9915103, 1, 0, 0, 1, 1,
0.5561787, 0.2323309, -0.2024703, 1, 0, 0, 1, 1,
0.5580066, -1.453789, 1.236989, 0, 0, 0, 1, 1,
0.5581658, -0.3589309, 1.968042, 0, 0, 0, 1, 1,
0.5627298, -0.06229776, 0.3074326, 0, 0, 0, 1, 1,
0.5641651, 1.105853, 1.613443, 0, 0, 0, 1, 1,
0.5652497, -1.468573, 3.815028, 0, 0, 0, 1, 1,
0.5665093, -0.004090906, 0.9597734, 0, 0, 0, 1, 1,
0.5674423, -0.9695243, 2.305423, 0, 0, 0, 1, 1,
0.5689968, 0.7030094, -0.5029042, 1, 1, 1, 1, 1,
0.5707039, -0.6382511, 1.746662, 1, 1, 1, 1, 1,
0.5732684, -2.330692, 3.348736, 1, 1, 1, 1, 1,
0.5736847, 0.7578032, 0.6426085, 1, 1, 1, 1, 1,
0.5739486, -0.1489787, 2.267037, 1, 1, 1, 1, 1,
0.5765686, 0.02117652, 1.503985, 1, 1, 1, 1, 1,
0.5768438, -0.1745123, 1.745986, 1, 1, 1, 1, 1,
0.579563, 0.4856253, -1.721702, 1, 1, 1, 1, 1,
0.5972825, -1.175736, 4.541688, 1, 1, 1, 1, 1,
0.5980468, 0.9550438, -0.5088102, 1, 1, 1, 1, 1,
0.5986857, -1.089446, 2.217336, 1, 1, 1, 1, 1,
0.6007223, 1.204952, 1.465983, 1, 1, 1, 1, 1,
0.6009548, 0.3853269, -0.4929117, 1, 1, 1, 1, 1,
0.6020843, 1.984869, -0.6080578, 1, 1, 1, 1, 1,
0.6029961, -2.737733, 2.922818, 1, 1, 1, 1, 1,
0.6060253, -0.6784613, 1.002954, 0, 0, 1, 1, 1,
0.6077002, -1.506784, 3.341514, 1, 0, 0, 1, 1,
0.6110024, 1.106521, 1.541135, 1, 0, 0, 1, 1,
0.6154387, 1.791318, 0.6263962, 1, 0, 0, 1, 1,
0.6186317, 1.334133, 0.3321787, 1, 0, 0, 1, 1,
0.6200384, 0.9178945, -0.8854424, 1, 0, 0, 1, 1,
0.6213437, -0.8785837, 3.237245, 0, 0, 0, 1, 1,
0.6255766, -0.0478063, 1.484256, 0, 0, 0, 1, 1,
0.6294933, 0.1419409, 1.149896, 0, 0, 0, 1, 1,
0.6300345, 1.515339, -0.6403309, 0, 0, 0, 1, 1,
0.6402625, -0.2358532, 2.649676, 0, 0, 0, 1, 1,
0.6411209, 0.3156173, 3.169338, 0, 0, 0, 1, 1,
0.6416098, -1.018635, 3.035257, 0, 0, 0, 1, 1,
0.6417436, -0.2529166, 3.269587, 1, 1, 1, 1, 1,
0.6419181, -0.753724, 2.351735, 1, 1, 1, 1, 1,
0.6442655, 1.800076, 0.3213402, 1, 1, 1, 1, 1,
0.6454935, 0.01264444, 3.220713, 1, 1, 1, 1, 1,
0.6460941, 0.2847122, 1.618431, 1, 1, 1, 1, 1,
0.6461938, 0.8332965, 1.159319, 1, 1, 1, 1, 1,
0.656632, -1.874145, 2.852643, 1, 1, 1, 1, 1,
0.6588399, -0.4451423, 1.719175, 1, 1, 1, 1, 1,
0.6612643, 2.558044, 0.7842246, 1, 1, 1, 1, 1,
0.661971, -0.4641838, 1.898008, 1, 1, 1, 1, 1,
0.6663865, 0.9307915, 0.1256094, 1, 1, 1, 1, 1,
0.6685646, 1.421571, 1.121128, 1, 1, 1, 1, 1,
0.6740941, -0.4663511, 1.341687, 1, 1, 1, 1, 1,
0.6878908, 2.144758, 0.656566, 1, 1, 1, 1, 1,
0.6921988, -1.778007, 1.334608, 1, 1, 1, 1, 1,
0.6935232, 1.029527, 0.134492, 0, 0, 1, 1, 1,
0.6962405, 0.06827194, 0.8317479, 1, 0, 0, 1, 1,
0.6965345, 0.1459623, 0.2150039, 1, 0, 0, 1, 1,
0.7008002, -0.4600492, 3.652182, 1, 0, 0, 1, 1,
0.7049758, 0.854099, 1.357682, 1, 0, 0, 1, 1,
0.7091944, 1.287627, -0.9882667, 1, 0, 0, 1, 1,
0.712987, -0.4603871, 2.087196, 0, 0, 0, 1, 1,
0.714976, -1.634525, 1.944713, 0, 0, 0, 1, 1,
0.7150184, 1.196676, -0.06227418, 0, 0, 0, 1, 1,
0.7224093, -0.2192594, 3.002706, 0, 0, 0, 1, 1,
0.7232517, 3.091508, 0.5736086, 0, 0, 0, 1, 1,
0.7244868, -0.7403873, 3.10531, 0, 0, 0, 1, 1,
0.7281151, 0.6397341, 0.7438427, 0, 0, 0, 1, 1,
0.7357526, -0.2675918, 3.300528, 1, 1, 1, 1, 1,
0.7394955, -1.894454, 1.336173, 1, 1, 1, 1, 1,
0.7506244, -0.2516467, 3.111947, 1, 1, 1, 1, 1,
0.7520424, 1.260025, 0.3100229, 1, 1, 1, 1, 1,
0.753367, 1.670606, 0.2570676, 1, 1, 1, 1, 1,
0.7556611, -0.5571004, 1.041508, 1, 1, 1, 1, 1,
0.756026, 0.009239408, 0.1276414, 1, 1, 1, 1, 1,
0.7591166, -0.07179861, 1.913116, 1, 1, 1, 1, 1,
0.7595924, 0.7085522, 0.8107682, 1, 1, 1, 1, 1,
0.7671298, 1.771242, 2.677602, 1, 1, 1, 1, 1,
0.7679197, -0.08782304, 0.7412159, 1, 1, 1, 1, 1,
0.7755413, -1.03866, 2.533463, 1, 1, 1, 1, 1,
0.781849, 0.1399651, -0.405, 1, 1, 1, 1, 1,
0.784803, 1.627638, 1.055217, 1, 1, 1, 1, 1,
0.7898659, -0.282562, 2.230319, 1, 1, 1, 1, 1,
0.7948225, 0.304288, 1.566789, 0, 0, 1, 1, 1,
0.7957873, 1.223619, 0.5415932, 1, 0, 0, 1, 1,
0.7975078, -0.1248144, 3.124537, 1, 0, 0, 1, 1,
0.8022236, 1.097971, 0.5280784, 1, 0, 0, 1, 1,
0.8064608, 1.119212, -0.1508207, 1, 0, 0, 1, 1,
0.8110521, 0.5639607, 0.5438942, 1, 0, 0, 1, 1,
0.8115001, -0.005581853, 1.663224, 0, 0, 0, 1, 1,
0.8188437, -0.6411062, 1.626762, 0, 0, 0, 1, 1,
0.82195, -1.088619, 1.397879, 0, 0, 0, 1, 1,
0.8223743, 0.8114943, 1.004247, 0, 0, 0, 1, 1,
0.8246882, 0.2716994, 1.238245, 0, 0, 0, 1, 1,
0.829994, 0.775503, -0.8268707, 0, 0, 0, 1, 1,
0.8335383, 1.24583, -0.1643489, 0, 0, 0, 1, 1,
0.8359084, 0.2254105, 1.864137, 1, 1, 1, 1, 1,
0.8384343, -1.068408, 1.565284, 1, 1, 1, 1, 1,
0.8394171, -0.5912264, 2.769008, 1, 1, 1, 1, 1,
0.845134, -0.5522388, 2.014758, 1, 1, 1, 1, 1,
0.8506854, 1.725171, 1.007636, 1, 1, 1, 1, 1,
0.853443, 1.193356, 0.5345138, 1, 1, 1, 1, 1,
0.8534983, -0.339132, 3.236657, 1, 1, 1, 1, 1,
0.8574139, 0.7680686, 0.1371458, 1, 1, 1, 1, 1,
0.8612836, 0.004613769, 1.682878, 1, 1, 1, 1, 1,
0.8641753, -0.5692317, 1.460826, 1, 1, 1, 1, 1,
0.8725964, 0.6548851, 2.118396, 1, 1, 1, 1, 1,
0.8739458, -0.2807081, 2.155978, 1, 1, 1, 1, 1,
0.878664, -0.636115, 2.630827, 1, 1, 1, 1, 1,
0.8796251, -1.796482, 3.336867, 1, 1, 1, 1, 1,
0.8802094, -1.154304, 3.809618, 1, 1, 1, 1, 1,
0.8870932, 0.02089405, 1.380897, 0, 0, 1, 1, 1,
0.8890746, 0.3744565, 1.0807, 1, 0, 0, 1, 1,
0.8902006, -1.646134, 2.398799, 1, 0, 0, 1, 1,
0.8941089, -1.640057, 2.420933, 1, 0, 0, 1, 1,
0.8958781, 0.8220462, 0.9805415, 1, 0, 0, 1, 1,
0.8963898, 0.2236904, 0.566502, 1, 0, 0, 1, 1,
0.9020487, 0.8617423, 1.372228, 0, 0, 0, 1, 1,
0.9041746, 1.567979, 0.8408548, 0, 0, 0, 1, 1,
0.9085893, -0.07557215, 2.059746, 0, 0, 0, 1, 1,
0.9132649, 0.9045369, 0.6246245, 0, 0, 0, 1, 1,
0.9141518, 0.8117229, 1.863896, 0, 0, 0, 1, 1,
0.9168996, 0.6281644, 1.309376, 0, 0, 0, 1, 1,
0.9262078, -0.3388433, 1.465087, 0, 0, 0, 1, 1,
0.9262305, -0.4180004, 2.528963, 1, 1, 1, 1, 1,
0.9333111, 0.7197718, 1.400554, 1, 1, 1, 1, 1,
0.9334309, -0.4941205, 2.706955, 1, 1, 1, 1, 1,
0.9386243, -1.545797, 1.777657, 1, 1, 1, 1, 1,
0.9439653, -0.8846118, 2.30443, 1, 1, 1, 1, 1,
0.9454542, -1.51801, 0.8536596, 1, 1, 1, 1, 1,
0.9476349, 1.254506, 0.8602264, 1, 1, 1, 1, 1,
0.951215, -0.5125948, 1.153382, 1, 1, 1, 1, 1,
0.9565119, 0.3568309, 0.9260029, 1, 1, 1, 1, 1,
0.9575778, 0.265232, 0.3543855, 1, 1, 1, 1, 1,
0.9601638, -0.49466, 1.375103, 1, 1, 1, 1, 1,
0.9620788, 1.413148, 0.561898, 1, 1, 1, 1, 1,
0.9625154, -0.7361385, 3.622359, 1, 1, 1, 1, 1,
0.9625348, -0.8496612, 1.183038, 1, 1, 1, 1, 1,
0.9711133, 0.7522894, 1.192101, 1, 1, 1, 1, 1,
0.9759725, 1.783539, 0.9005709, 0, 0, 1, 1, 1,
0.9799615, -0.8120863, 1.491983, 1, 0, 0, 1, 1,
0.9826943, -0.4400899, 3.01153, 1, 0, 0, 1, 1,
0.9853505, 0.3162622, 1.941957, 1, 0, 0, 1, 1,
0.9931777, 0.3818614, 0.8070896, 1, 0, 0, 1, 1,
0.9981856, 0.159307, 0.8434442, 1, 0, 0, 1, 1,
0.9982207, -0.199108, -0.0518, 0, 0, 0, 1, 1,
1.000744, 1.98692, -0.4794897, 0, 0, 0, 1, 1,
1.004487, -0.3042983, 2.524024, 0, 0, 0, 1, 1,
1.007218, 0.002171653, 1.430334, 0, 0, 0, 1, 1,
1.007304, -0.5675001, 2.03603, 0, 0, 0, 1, 1,
1.00834, 0.6624582, 1.965745, 0, 0, 0, 1, 1,
1.011241, -2.687611, 1.923233, 0, 0, 0, 1, 1,
1.01873, -0.001272846, 0.7935819, 1, 1, 1, 1, 1,
1.024087, -2.228304, 4.052684, 1, 1, 1, 1, 1,
1.035215, 1.03388, 0.7059475, 1, 1, 1, 1, 1,
1.066868, -0.8274525, 1.4753, 1, 1, 1, 1, 1,
1.067389, -0.3427299, 1.156944, 1, 1, 1, 1, 1,
1.073939, -0.2415205, 0.8278425, 1, 1, 1, 1, 1,
1.082599, 1.088075, 0.5873568, 1, 1, 1, 1, 1,
1.085995, 0.01304955, 2.624855, 1, 1, 1, 1, 1,
1.095411, 0.4600542, 1.535447, 1, 1, 1, 1, 1,
1.100605, -0.6247621, 1.961798, 1, 1, 1, 1, 1,
1.101603, -0.8480318, 0.52157, 1, 1, 1, 1, 1,
1.110026, 0.3833129, 1.495941, 1, 1, 1, 1, 1,
1.117543, 1.19599, 0.05069274, 1, 1, 1, 1, 1,
1.124427, 0.3326579, 1.213633, 1, 1, 1, 1, 1,
1.126968, 0.5072091, 1.235521, 1, 1, 1, 1, 1,
1.130774, 0.4226971, 2.374861, 0, 0, 1, 1, 1,
1.145233, -0.6605372, 2.054428, 1, 0, 0, 1, 1,
1.145952, 0.1890006, 0.3401282, 1, 0, 0, 1, 1,
1.146434, 0.1077708, 1.075592, 1, 0, 0, 1, 1,
1.149883, 1.151916, -1.961722, 1, 0, 0, 1, 1,
1.15492, -1.607166, 3.37763, 1, 0, 0, 1, 1,
1.15703, 0.9248508, 0.7786446, 0, 0, 0, 1, 1,
1.158987, -0.8680673, 0.7280411, 0, 0, 0, 1, 1,
1.160955, -0.257971, 2.320363, 0, 0, 0, 1, 1,
1.166408, -1.517935, 2.271188, 0, 0, 0, 1, 1,
1.176023, 0.750404, 1.150957, 0, 0, 0, 1, 1,
1.179385, 1.088237, 0.6493926, 0, 0, 0, 1, 1,
1.179606, -0.1591942, 3.091261, 0, 0, 0, 1, 1,
1.181022, 0.9556922, 1.332024, 1, 1, 1, 1, 1,
1.186908, 1.721319, -0.3533971, 1, 1, 1, 1, 1,
1.192899, 1.529291, 2.622364, 1, 1, 1, 1, 1,
1.19298, 0.352592, 2.065933, 1, 1, 1, 1, 1,
1.194274, 0.242533, 1.47158, 1, 1, 1, 1, 1,
1.200341, -0.042168, 3.652853, 1, 1, 1, 1, 1,
1.200364, -1.768034, 3.130704, 1, 1, 1, 1, 1,
1.206498, 0.3315216, 1.092525, 1, 1, 1, 1, 1,
1.219895, -0.9175995, 3.423043, 1, 1, 1, 1, 1,
1.219917, 0.03450622, 0.7150325, 1, 1, 1, 1, 1,
1.221919, -0.09594177, 2.697651, 1, 1, 1, 1, 1,
1.225282, 1.308421, -0.8404506, 1, 1, 1, 1, 1,
1.231882, -1.298951, 1.475912, 1, 1, 1, 1, 1,
1.233873, -0.1680558, 2.115428, 1, 1, 1, 1, 1,
1.239126, -0.041245, 2.260419, 1, 1, 1, 1, 1,
1.248027, 0.9570774, -0.5063885, 0, 0, 1, 1, 1,
1.261247, 1.43979, 1.875146, 1, 0, 0, 1, 1,
1.264742, 0.7358897, 1.150726, 1, 0, 0, 1, 1,
1.272637, 2.056146, 1.369937, 1, 0, 0, 1, 1,
1.276995, 2.621141, 0.5104254, 1, 0, 0, 1, 1,
1.277318, 2.006673, 0.9472721, 1, 0, 0, 1, 1,
1.279571, -0.7656671, 3.430306, 0, 0, 0, 1, 1,
1.280638, 0.6584985, -0.1911727, 0, 0, 0, 1, 1,
1.280947, 0.541469, 1.812516, 0, 0, 0, 1, 1,
1.281221, 0.4869734, 0.5357451, 0, 0, 0, 1, 1,
1.287682, 1.281545, -0.08771087, 0, 0, 0, 1, 1,
1.292152, -1.295377, 2.293978, 0, 0, 0, 1, 1,
1.301697, 0.7807304, 1.650688, 0, 0, 0, 1, 1,
1.304721, -0.2273142, 2.227897, 1, 1, 1, 1, 1,
1.314824, -0.8281879, 2.581911, 1, 1, 1, 1, 1,
1.332207, 2.026367, 1.339091, 1, 1, 1, 1, 1,
1.341316, 1.109966, 1.943117, 1, 1, 1, 1, 1,
1.341976, -0.3245594, 3.101918, 1, 1, 1, 1, 1,
1.345613, -0.729763, 3.166569, 1, 1, 1, 1, 1,
1.352191, -0.5901189, 1.712476, 1, 1, 1, 1, 1,
1.367934, -0.09603463, 1.11137, 1, 1, 1, 1, 1,
1.371257, -0.001107425, 0.9127206, 1, 1, 1, 1, 1,
1.371717, -1.714876, 3.176058, 1, 1, 1, 1, 1,
1.372879, 0.6625896, 2.11328, 1, 1, 1, 1, 1,
1.389223, -0.6488358, 0.9361997, 1, 1, 1, 1, 1,
1.403663, 0.731402, 2.486817, 1, 1, 1, 1, 1,
1.408321, 2.099379, 0.9068063, 1, 1, 1, 1, 1,
1.409002, 1.137534, 0.4356345, 1, 1, 1, 1, 1,
1.413237, 0.2064665, 1.865305, 0, 0, 1, 1, 1,
1.414046, 0.5989369, -0.4285096, 1, 0, 0, 1, 1,
1.414804, -0.8010428, 3.870695, 1, 0, 0, 1, 1,
1.414872, -0.1884977, 2.691403, 1, 0, 0, 1, 1,
1.415876, -0.9852686, 1.749631, 1, 0, 0, 1, 1,
1.421397, -0.5810735, 1.839093, 1, 0, 0, 1, 1,
1.439065, 1.440904, 2.68657, 0, 0, 0, 1, 1,
1.443041, -0.5733845, 4.49614, 0, 0, 0, 1, 1,
1.474396, 0.7549368, 1.940669, 0, 0, 0, 1, 1,
1.476244, 0.1770811, 2.23883, 0, 0, 0, 1, 1,
1.480962, -0.005080611, 0.4957544, 0, 0, 0, 1, 1,
1.487579, -0.9970312, 1.453563, 0, 0, 0, 1, 1,
1.491817, 0.4191543, 2.148842, 0, 0, 0, 1, 1,
1.492425, 0.4779077, -1.335961, 1, 1, 1, 1, 1,
1.496239, 0.001722896, -0.312356, 1, 1, 1, 1, 1,
1.49644, -0.2512316, 2.687771, 1, 1, 1, 1, 1,
1.497926, 0.1458084, 1.280418, 1, 1, 1, 1, 1,
1.503664, 1.146783, -1.047138, 1, 1, 1, 1, 1,
1.516789, 1.848032, -0.03252133, 1, 1, 1, 1, 1,
1.525139, -0.07778966, 0.533733, 1, 1, 1, 1, 1,
1.553405, 0.4951897, -0.2231312, 1, 1, 1, 1, 1,
1.566047, -0.1019402, 0.273255, 1, 1, 1, 1, 1,
1.577699, -0.4790234, 0.6567675, 1, 1, 1, 1, 1,
1.587816, 0.8825324, 1.424096, 1, 1, 1, 1, 1,
1.587883, 1.151969, 2.014442, 1, 1, 1, 1, 1,
1.604946, -0.2506359, 2.182469, 1, 1, 1, 1, 1,
1.621341, -1.345783, 1.943314, 1, 1, 1, 1, 1,
1.642117, -1.214049, 1.77416, 1, 1, 1, 1, 1,
1.643053, 0.5593363, 1.001496, 0, 0, 1, 1, 1,
1.650463, 0.7765884, 0.05749312, 1, 0, 0, 1, 1,
1.655106, 0.6165664, 0.1568029, 1, 0, 0, 1, 1,
1.664266, -0.7023082, 0.9005499, 1, 0, 0, 1, 1,
1.685257, -0.495118, 0.9676379, 1, 0, 0, 1, 1,
1.69102, -0.5374447, 1.125433, 1, 0, 0, 1, 1,
1.708631, -0.8574164, 1.001621, 0, 0, 0, 1, 1,
1.716797, 0.8549604, 0.2224468, 0, 0, 0, 1, 1,
1.717309, 1.722142, 0.81279, 0, 0, 0, 1, 1,
1.729174, 1.78196, -1.148201, 0, 0, 0, 1, 1,
1.731515, 0.904157, 1.741431, 0, 0, 0, 1, 1,
1.734369, 1.000613, 2.117944, 0, 0, 0, 1, 1,
1.736066, 0.8256099, -0.5356231, 0, 0, 0, 1, 1,
1.736222, 0.4017969, 1.965738, 1, 1, 1, 1, 1,
1.74031, 0.513324, 3.589029, 1, 1, 1, 1, 1,
1.776163, 0.7123039, -0.6458471, 1, 1, 1, 1, 1,
1.780268, -0.814859, 2.379104, 1, 1, 1, 1, 1,
1.781246, -0.9009651, 0.3679034, 1, 1, 1, 1, 1,
1.795773, 0.06969534, 0.171044, 1, 1, 1, 1, 1,
1.798862, 0.132516, 1.676577, 1, 1, 1, 1, 1,
1.811067, 0.1803602, 0.9748336, 1, 1, 1, 1, 1,
1.841612, 1.970438, 1.663382, 1, 1, 1, 1, 1,
1.853782, 0.5079859, 1.700135, 1, 1, 1, 1, 1,
1.862908, 0.8620137, 2.102071, 1, 1, 1, 1, 1,
1.924745, 1.284921, 1.377819, 1, 1, 1, 1, 1,
1.93449, 1.648059, 2.173557, 1, 1, 1, 1, 1,
1.935708, -0.377614, 2.793861, 1, 1, 1, 1, 1,
1.953259, -1.560107, 2.154951, 1, 1, 1, 1, 1,
1.963375, 0.9399519, 3.063659, 0, 0, 1, 1, 1,
1.968267, -0.8825621, 1.378261, 1, 0, 0, 1, 1,
1.975617, 0.1563907, 0.8919959, 1, 0, 0, 1, 1,
2.067724, -0.5183375, 2.300609, 1, 0, 0, 1, 1,
2.09228, 0.9333469, 1.101514, 1, 0, 0, 1, 1,
2.100001, 0.3278489, 0.4543212, 1, 0, 0, 1, 1,
2.106862, -0.9630719, 1.032916, 0, 0, 0, 1, 1,
2.112116, 0.8828496, 0.07007263, 0, 0, 0, 1, 1,
2.16189, -0.383913, 2.294685, 0, 0, 0, 1, 1,
2.16885, 2.571811, -1.300248, 0, 0, 0, 1, 1,
2.196801, 1.070073, 1.450118, 0, 0, 0, 1, 1,
2.286697, 1.192356, 0.4496739, 0, 0, 0, 1, 1,
2.398659, -0.5081933, 1.606964, 0, 0, 0, 1, 1,
2.408635, 0.5756626, 0.1297042, 1, 1, 1, 1, 1,
2.518162, 0.006509345, 1.904967, 1, 1, 1, 1, 1,
2.578268, 0.3452964, 1.66679, 1, 1, 1, 1, 1,
2.590495, -0.3966077, 2.346991, 1, 1, 1, 1, 1,
2.708266, 1.459876, 1.275375, 1, 1, 1, 1, 1,
2.818337, -0.950692, 0.8889865, 1, 1, 1, 1, 1,
2.833388, 0.1371735, 1.456331, 1, 1, 1, 1, 1
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
var radius = 9.480771;
var distance = 33.30081;
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
mvMatrix.translate( 0.1191565, -0.1547668, 0.1521513 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30081);
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
