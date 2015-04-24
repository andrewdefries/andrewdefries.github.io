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
-3.289999, -1.163048, -2.126599, 1, 0, 0, 1,
-3.150563, 0.1645234, -2.447469, 1, 0.007843138, 0, 1,
-3.083061, 0.734818, -0.9566918, 1, 0.01176471, 0, 1,
-2.970362, 0.3993397, -0.6547166, 1, 0.01960784, 0, 1,
-2.872386, -0.2525329, -2.476738, 1, 0.02352941, 0, 1,
-2.629916, -1.309674, -1.860837, 1, 0.03137255, 0, 1,
-2.457484, 0.7872191, -0.3193511, 1, 0.03529412, 0, 1,
-2.429764, 0.04074984, 0.505551, 1, 0.04313726, 0, 1,
-2.403537, -0.2317154, -2.13709, 1, 0.04705882, 0, 1,
-2.292956, 0.1035276, -0.9975937, 1, 0.05490196, 0, 1,
-2.283773, 0.1498703, -2.354046, 1, 0.05882353, 0, 1,
-2.20103, 1.373524, -1.641223, 1, 0.06666667, 0, 1,
-2.17641, -1.019644, -3.572355, 1, 0.07058824, 0, 1,
-2.148911, 0.4654909, -1.52726, 1, 0.07843138, 0, 1,
-2.130941, -0.1045845, -0.6941851, 1, 0.08235294, 0, 1,
-2.121247, 0.05882854, -0.987804, 1, 0.09019608, 0, 1,
-2.108271, 1.013667, -0.1647394, 1, 0.09411765, 0, 1,
-2.102829, -1.405067, -1.900816, 1, 0.1019608, 0, 1,
-2.096345, 0.2998356, -1.585296, 1, 0.1098039, 0, 1,
-2.095685, -0.1472658, 0.247673, 1, 0.1137255, 0, 1,
-2.052461, -0.4573923, -1.601637, 1, 0.1215686, 0, 1,
-2.029649, 0.6203967, -0.2245792, 1, 0.1254902, 0, 1,
-2.027817, -0.9264358, -4.719398, 1, 0.1333333, 0, 1,
-2.015977, 0.8758782, -1.690606, 1, 0.1372549, 0, 1,
-2.013156, 1.347299, -1.386686, 1, 0.145098, 0, 1,
-2.012252, 0.1090767, -2.713528, 1, 0.1490196, 0, 1,
-1.994531, -1.360668, -2.796287, 1, 0.1568628, 0, 1,
-1.979464, -0.1800978, -2.006208, 1, 0.1607843, 0, 1,
-1.973223, 0.9205505, -0.9704379, 1, 0.1686275, 0, 1,
-1.966523, -0.8228149, -2.137994, 1, 0.172549, 0, 1,
-1.954665, -1.008541, -2.834371, 1, 0.1803922, 0, 1,
-1.951514, -0.1494887, -1.094223, 1, 0.1843137, 0, 1,
-1.945795, -0.413994, -2.591907, 1, 0.1921569, 0, 1,
-1.93757, -0.05876286, -1.407506, 1, 0.1960784, 0, 1,
-1.93756, 1.040662, -0.2131151, 1, 0.2039216, 0, 1,
-1.935991, -0.3506734, 0.2218303, 1, 0.2117647, 0, 1,
-1.908566, 0.9972671, -0.5056895, 1, 0.2156863, 0, 1,
-1.868187, -0.5423701, -3.067722, 1, 0.2235294, 0, 1,
-1.789788, -0.4663202, -0.5795094, 1, 0.227451, 0, 1,
-1.770222, 0.3679635, -1.391218, 1, 0.2352941, 0, 1,
-1.715932, 0.2010216, -1.219236, 1, 0.2392157, 0, 1,
-1.699216, -0.1244279, -1.057861, 1, 0.2470588, 0, 1,
-1.670135, -0.5066941, -1.383989, 1, 0.2509804, 0, 1,
-1.662026, -1.21126, -1.694982, 1, 0.2588235, 0, 1,
-1.657199, -0.05814718, -0.4174387, 1, 0.2627451, 0, 1,
-1.656755, 2.143435, -1.545443, 1, 0.2705882, 0, 1,
-1.638595, -0.06596754, -1.779644, 1, 0.2745098, 0, 1,
-1.62723, -1.791641, -2.19666, 1, 0.282353, 0, 1,
-1.6241, 1.161582, 0.3415563, 1, 0.2862745, 0, 1,
-1.608813, -0.001670928, -1.2781, 1, 0.2941177, 0, 1,
-1.606122, -1.041223, -2.481746, 1, 0.3019608, 0, 1,
-1.600887, -1.468384, -3.359914, 1, 0.3058824, 0, 1,
-1.599446, -0.2514297, 0.2795727, 1, 0.3137255, 0, 1,
-1.599432, -0.2668141, -2.866328, 1, 0.3176471, 0, 1,
-1.594671, 1.465476, -1.215934, 1, 0.3254902, 0, 1,
-1.591787, -0.9275095, -2.278246, 1, 0.3294118, 0, 1,
-1.584996, -0.9251238, -1.612933, 1, 0.3372549, 0, 1,
-1.573171, 0.2502138, -0.6727942, 1, 0.3411765, 0, 1,
-1.558689, 0.1121379, -0.8508837, 1, 0.3490196, 0, 1,
-1.551285, -0.5159698, -1.360413, 1, 0.3529412, 0, 1,
-1.548873, 0.0952622, -2.202567, 1, 0.3607843, 0, 1,
-1.545105, 0.3119358, -0.5828952, 1, 0.3647059, 0, 1,
-1.539341, -1.640133, -2.619439, 1, 0.372549, 0, 1,
-1.537374, 0.5926644, -0.005512934, 1, 0.3764706, 0, 1,
-1.533788, -0.9247066, -1.002278, 1, 0.3843137, 0, 1,
-1.512813, -0.2391634, -1.444994, 1, 0.3882353, 0, 1,
-1.511841, 0.8440181, -0.8382548, 1, 0.3960784, 0, 1,
-1.511075, -0.2395577, -2.012659, 1, 0.4039216, 0, 1,
-1.495418, 0.02067913, -2.068522, 1, 0.4078431, 0, 1,
-1.493092, 0.4578646, -0.9660363, 1, 0.4156863, 0, 1,
-1.484978, -0.7057716, -0.9190946, 1, 0.4196078, 0, 1,
-1.482336, 0.778496, -1.861465, 1, 0.427451, 0, 1,
-1.48129, -0.431947, -2.921954, 1, 0.4313726, 0, 1,
-1.477778, -1.536518, -0.8138025, 1, 0.4392157, 0, 1,
-1.477472, 0.3938063, -2.743299, 1, 0.4431373, 0, 1,
-1.475226, -1.02791, -1.217358, 1, 0.4509804, 0, 1,
-1.469171, -0.5180398, -2.918192, 1, 0.454902, 0, 1,
-1.466633, 1.923309, 0.1738421, 1, 0.4627451, 0, 1,
-1.462394, -0.6688511, -3.927469, 1, 0.4666667, 0, 1,
-1.458322, 0.4626058, -1.417819, 1, 0.4745098, 0, 1,
-1.458162, -1.935405, -0.6952015, 1, 0.4784314, 0, 1,
-1.456334, -0.8945732, -0.7387816, 1, 0.4862745, 0, 1,
-1.453008, -0.4258643, -0.3711705, 1, 0.4901961, 0, 1,
-1.442079, -1.562218, -1.706088, 1, 0.4980392, 0, 1,
-1.43933, 2.46249, -0.8263559, 1, 0.5058824, 0, 1,
-1.438151, -1.053054, -0.2339619, 1, 0.509804, 0, 1,
-1.427379, -0.3920108, -1.876007, 1, 0.5176471, 0, 1,
-1.424814, 1.573425, 0.4466414, 1, 0.5215687, 0, 1,
-1.419684, 0.3956397, -0.7924396, 1, 0.5294118, 0, 1,
-1.413013, 0.1965874, -1.747286, 1, 0.5333334, 0, 1,
-1.399984, -0.2984776, -2.373027, 1, 0.5411765, 0, 1,
-1.351402, 0.7715291, -1.064755, 1, 0.5450981, 0, 1,
-1.340609, -0.07190935, -2.546428, 1, 0.5529412, 0, 1,
-1.33062, 0.7883928, -0.213587, 1, 0.5568628, 0, 1,
-1.329442, 1.017395, -0.5137014, 1, 0.5647059, 0, 1,
-1.322187, -0.5767022, -0.922047, 1, 0.5686275, 0, 1,
-1.313348, -0.1624302, -2.269831, 1, 0.5764706, 0, 1,
-1.312558, 1.209047, -0.4619291, 1, 0.5803922, 0, 1,
-1.310353, -0.5759929, -0.7652924, 1, 0.5882353, 0, 1,
-1.307916, -0.7743973, -1.876781, 1, 0.5921569, 0, 1,
-1.294267, -1.008151, -2.74323, 1, 0.6, 0, 1,
-1.287691, -0.5777711, -1.20096, 1, 0.6078432, 0, 1,
-1.285065, -0.365196, -1.133627, 1, 0.6117647, 0, 1,
-1.278278, 3.429755, 0.5736234, 1, 0.6196079, 0, 1,
-1.277735, -0.733878, -2.655657, 1, 0.6235294, 0, 1,
-1.277596, 0.3300566, -1.028655, 1, 0.6313726, 0, 1,
-1.275327, -0.2690398, -1.726414, 1, 0.6352941, 0, 1,
-1.272272, 1.978863, -1.533333, 1, 0.6431373, 0, 1,
-1.269816, -0.8625124, -2.75701, 1, 0.6470588, 0, 1,
-1.258336, -0.4507505, -0.1587582, 1, 0.654902, 0, 1,
-1.24847, 1.168437, -0.808495, 1, 0.6588235, 0, 1,
-1.246193, 1.594817, 1.102834, 1, 0.6666667, 0, 1,
-1.232546, 1.356667, -1.00208, 1, 0.6705883, 0, 1,
-1.230589, -0.7605734, -2.812637, 1, 0.6784314, 0, 1,
-1.227113, 0.3473152, -2.19655, 1, 0.682353, 0, 1,
-1.225507, 0.6498697, -4.116264, 1, 0.6901961, 0, 1,
-1.222141, 0.854728, -2.91863, 1, 0.6941177, 0, 1,
-1.222016, 0.8953535, -1.698266, 1, 0.7019608, 0, 1,
-1.213657, 1.714298, -0.3455743, 1, 0.7098039, 0, 1,
-1.212212, 2.294537, -0.4070296, 1, 0.7137255, 0, 1,
-1.207418, -0.1339143, -3.879041, 1, 0.7215686, 0, 1,
-1.192773, 1.196616, -0.8275908, 1, 0.7254902, 0, 1,
-1.188038, 0.5619717, -0.8610178, 1, 0.7333333, 0, 1,
-1.180889, -1.165211, -2.474988, 1, 0.7372549, 0, 1,
-1.172095, -0.06145235, -2.349784, 1, 0.7450981, 0, 1,
-1.169964, -0.5707457, -3.555333, 1, 0.7490196, 0, 1,
-1.163582, -1.124517, -3.343195, 1, 0.7568628, 0, 1,
-1.161668, -1.33298, -3.320308, 1, 0.7607843, 0, 1,
-1.142694, 0.1682377, -1.291534, 1, 0.7686275, 0, 1,
-1.133935, 0.7504758, -0.9094161, 1, 0.772549, 0, 1,
-1.124498, 0.1488804, -1.549328, 1, 0.7803922, 0, 1,
-1.122711, -0.5599895, -2.130687, 1, 0.7843137, 0, 1,
-1.113842, -0.1031985, -0.9651634, 1, 0.7921569, 0, 1,
-1.107883, -0.6534284, -0.6325808, 1, 0.7960784, 0, 1,
-1.103692, 0.1438329, -1.865658, 1, 0.8039216, 0, 1,
-1.102596, 1.717479, -1.436888, 1, 0.8117647, 0, 1,
-1.094774, -0.5387475, -1.22957, 1, 0.8156863, 0, 1,
-1.079762, 2.22788, -0.141076, 1, 0.8235294, 0, 1,
-1.070599, -1.198769, -1.602415, 1, 0.827451, 0, 1,
-1.067826, 1.158221, -1.418043, 1, 0.8352941, 0, 1,
-1.062769, -0.610135, -2.183814, 1, 0.8392157, 0, 1,
-1.058417, -0.4158415, -2.548281, 1, 0.8470588, 0, 1,
-1.046477, -0.3628637, -1.869654, 1, 0.8509804, 0, 1,
-1.043501, 1.383649, -2.37274, 1, 0.8588235, 0, 1,
-1.039652, -1.334216, -1.63679, 1, 0.8627451, 0, 1,
-1.031933, 0.6805207, -1.322301, 1, 0.8705882, 0, 1,
-1.031746, -0.2295272, -2.089068, 1, 0.8745098, 0, 1,
-1.026212, 0.1002138, 0.01845218, 1, 0.8823529, 0, 1,
-1.025683, -0.7784404, -2.244818, 1, 0.8862745, 0, 1,
-1.024713, -0.01958744, -2.045827, 1, 0.8941177, 0, 1,
-1.019471, 0.07464259, -2.113618, 1, 0.8980392, 0, 1,
-1.019263, -1.530306, -0.6834705, 1, 0.9058824, 0, 1,
-1.016084, 1.035628, -1.70773, 1, 0.9137255, 0, 1,
-1.013321, 0.4713236, 0.2209793, 1, 0.9176471, 0, 1,
-1.010597, -0.1957296, -0.8716208, 1, 0.9254902, 0, 1,
-1.009421, 0.3551768, -0.9200056, 1, 0.9294118, 0, 1,
-1.00901, -0.4999942, -0.3058695, 1, 0.9372549, 0, 1,
-1.007199, 0.5056768, -1.18022, 1, 0.9411765, 0, 1,
-1.00275, -0.2057589, -3.025978, 1, 0.9490196, 0, 1,
-1.001537, -2.006245, -3.574686, 1, 0.9529412, 0, 1,
-0.9974371, -0.6860704, -1.592839, 1, 0.9607843, 0, 1,
-0.9944602, 0.8797609, -0.6804044, 1, 0.9647059, 0, 1,
-0.9904494, 1.49512, -0.6577441, 1, 0.972549, 0, 1,
-0.9881878, -0.7224399, -2.576105, 1, 0.9764706, 0, 1,
-0.9880226, -0.7668228, -2.52541, 1, 0.9843137, 0, 1,
-0.9791512, -0.5634059, -0.8484724, 1, 0.9882353, 0, 1,
-0.9756795, 0.5502625, -0.1942209, 1, 0.9960784, 0, 1,
-0.9606745, 1.27333, -0.7807503, 0.9960784, 1, 0, 1,
-0.9573944, 1.458543, -1.618786, 0.9921569, 1, 0, 1,
-0.9548714, -2.558388, -1.682933, 0.9843137, 1, 0, 1,
-0.954347, -1.555817, -2.361166, 0.9803922, 1, 0, 1,
-0.95392, 1.365268, -0.6217464, 0.972549, 1, 0, 1,
-0.9535731, -0.5658877, -1.139029, 0.9686275, 1, 0, 1,
-0.9437045, -1.484174, -2.477946, 0.9607843, 1, 0, 1,
-0.9407281, -0.8214302, -2.068938, 0.9568627, 1, 0, 1,
-0.9370267, -0.9943578, -1.985328, 0.9490196, 1, 0, 1,
-0.9323964, -0.7159672, -3.374292, 0.945098, 1, 0, 1,
-0.9122031, 1.088713, -1.190406, 0.9372549, 1, 0, 1,
-0.9078034, 0.9970247, -1.828017, 0.9333333, 1, 0, 1,
-0.9069617, 1.629851, -1.908723, 0.9254902, 1, 0, 1,
-0.9066504, -0.1160867, -2.458257, 0.9215686, 1, 0, 1,
-0.900018, -1.200261, -3.342534, 0.9137255, 1, 0, 1,
-0.8988478, -0.9632922, -2.000525, 0.9098039, 1, 0, 1,
-0.8983001, 0.8845308, -1.737717, 0.9019608, 1, 0, 1,
-0.8971009, -1.013174, -2.947891, 0.8941177, 1, 0, 1,
-0.8960156, 1.169269, -1.14261, 0.8901961, 1, 0, 1,
-0.8913499, -0.2990175, -0.08933332, 0.8823529, 1, 0, 1,
-0.8866276, -1.060289, -2.662912, 0.8784314, 1, 0, 1,
-0.8836614, 1.084503, 0.4005266, 0.8705882, 1, 0, 1,
-0.8748772, 0.5294819, -0.2720993, 0.8666667, 1, 0, 1,
-0.8745513, -2.147585, -2.161355, 0.8588235, 1, 0, 1,
-0.8670647, 0.7812113, -0.3261389, 0.854902, 1, 0, 1,
-0.8657662, -0.07944562, -1.540923, 0.8470588, 1, 0, 1,
-0.8610793, -0.09753133, 0.5194474, 0.8431373, 1, 0, 1,
-0.8575234, 0.2233444, -0.1005221, 0.8352941, 1, 0, 1,
-0.8557369, -2.132681, -1.257415, 0.8313726, 1, 0, 1,
-0.8407427, -0.3986407, -1.604315, 0.8235294, 1, 0, 1,
-0.8375018, 0.2680027, 0.1593628, 0.8196079, 1, 0, 1,
-0.8340095, -0.364241, -1.404557, 0.8117647, 1, 0, 1,
-0.8265599, 0.2918486, -1.705806, 0.8078431, 1, 0, 1,
-0.8226824, 2.026996, -0.4887004, 0.8, 1, 0, 1,
-0.8153784, -0.1348696, -2.021086, 0.7921569, 1, 0, 1,
-0.8153645, 0.01546279, -1.241589, 0.7882353, 1, 0, 1,
-0.8136194, 0.2100564, -3.116613, 0.7803922, 1, 0, 1,
-0.8126038, -0.5052088, -2.477388, 0.7764706, 1, 0, 1,
-0.8118983, 3.299302, -0.5784498, 0.7686275, 1, 0, 1,
-0.8090253, -0.1815079, -0.8484697, 0.7647059, 1, 0, 1,
-0.8047851, -0.8604633, -1.954057, 0.7568628, 1, 0, 1,
-0.8016585, -0.7348098, -0.9278455, 0.7529412, 1, 0, 1,
-0.7990283, 0.8022414, -0.9776236, 0.7450981, 1, 0, 1,
-0.7954003, 0.9942891, -1.295872, 0.7411765, 1, 0, 1,
-0.7943851, 0.158125, -0.8790313, 0.7333333, 1, 0, 1,
-0.7937083, 1.562904, -2.462844, 0.7294118, 1, 0, 1,
-0.7863869, -1.892018, -4.328997, 0.7215686, 1, 0, 1,
-0.7824339, 0.2556924, 0.01689934, 0.7176471, 1, 0, 1,
-0.7811555, -0.1581474, -2.151944, 0.7098039, 1, 0, 1,
-0.7800763, -0.2406539, -0.8641356, 0.7058824, 1, 0, 1,
-0.7789984, -0.3467105, 0.0815715, 0.6980392, 1, 0, 1,
-0.7616769, 1.320001, -0.4344589, 0.6901961, 1, 0, 1,
-0.7599257, -1.549854, -2.565522, 0.6862745, 1, 0, 1,
-0.7457366, 0.182543, -1.894341, 0.6784314, 1, 0, 1,
-0.7427421, 0.8472376, -1.350542, 0.6745098, 1, 0, 1,
-0.7418844, -0.5244417, -3.864127, 0.6666667, 1, 0, 1,
-0.7392507, -1.373061, -2.384855, 0.6627451, 1, 0, 1,
-0.7385675, 1.650639, 0.4973925, 0.654902, 1, 0, 1,
-0.7380761, 0.9452962, -0.4071878, 0.6509804, 1, 0, 1,
-0.737233, 0.4615919, 0.4052199, 0.6431373, 1, 0, 1,
-0.7363913, -1.1875, -1.782553, 0.6392157, 1, 0, 1,
-0.7338595, -1.829683, -3.435524, 0.6313726, 1, 0, 1,
-0.7245833, -1.212847, -3.451677, 0.627451, 1, 0, 1,
-0.7183234, 0.3027166, -1.723399, 0.6196079, 1, 0, 1,
-0.71585, -1.040305, -1.616607, 0.6156863, 1, 0, 1,
-0.7117985, -1.057427, -0.812857, 0.6078432, 1, 0, 1,
-0.7112758, 0.7750434, -0.9060137, 0.6039216, 1, 0, 1,
-0.7088094, -0.2873558, -3.270386, 0.5960785, 1, 0, 1,
-0.7053624, -0.3792943, -1.836238, 0.5882353, 1, 0, 1,
-0.7051237, 0.6491843, 0.1204799, 0.5843138, 1, 0, 1,
-0.6943995, 0.4605074, -1.9555, 0.5764706, 1, 0, 1,
-0.6922874, -0.7186148, -2.012048, 0.572549, 1, 0, 1,
-0.6919417, 0.7764265, -0.2365341, 0.5647059, 1, 0, 1,
-0.6903509, 1.111575, -0.5810088, 0.5607843, 1, 0, 1,
-0.6815042, -0.3570454, -1.838728, 0.5529412, 1, 0, 1,
-0.6811835, 0.5624287, -1.773247, 0.5490196, 1, 0, 1,
-0.6788895, -2.846287, -2.634921, 0.5411765, 1, 0, 1,
-0.6750518, -0.04950298, -3.464038, 0.5372549, 1, 0, 1,
-0.6739524, 1.520149, 0.2314303, 0.5294118, 1, 0, 1,
-0.6717101, -0.4674093, -1.646294, 0.5254902, 1, 0, 1,
-0.6620262, 0.5621067, -1.208154, 0.5176471, 1, 0, 1,
-0.6614171, 0.9834221, 1.33829, 0.5137255, 1, 0, 1,
-0.6535839, 1.87829, -0.3750232, 0.5058824, 1, 0, 1,
-0.6530585, -0.3946259, -0.4548861, 0.5019608, 1, 0, 1,
-0.6526603, -0.9270602, -3.108011, 0.4941176, 1, 0, 1,
-0.6495025, 1.125053, -0.8857477, 0.4862745, 1, 0, 1,
-0.6451598, -0.3831661, -3.018892, 0.4823529, 1, 0, 1,
-0.6441143, -0.3436185, -2.524524, 0.4745098, 1, 0, 1,
-0.6422179, 0.2859079, -1.735306, 0.4705882, 1, 0, 1,
-0.6358532, -1.205765, -3.628028, 0.4627451, 1, 0, 1,
-0.6354524, -0.5677445, -3.604301, 0.4588235, 1, 0, 1,
-0.6343319, 2.213311, 2.153604, 0.4509804, 1, 0, 1,
-0.6342247, -0.4925036, -2.311077, 0.4470588, 1, 0, 1,
-0.6300302, 0.06093598, -1.389668, 0.4392157, 1, 0, 1,
-0.6274543, -0.3377338, -1.605885, 0.4352941, 1, 0, 1,
-0.6270303, 0.7141708, -1.042928, 0.427451, 1, 0, 1,
-0.6257433, 0.2668399, -0.9247541, 0.4235294, 1, 0, 1,
-0.6237931, -0.1834367, -2.914433, 0.4156863, 1, 0, 1,
-0.6171641, 0.9974399, -0.7710156, 0.4117647, 1, 0, 1,
-0.61594, 1.024423, 1.052173, 0.4039216, 1, 0, 1,
-0.6144984, -0.2216504, -2.784431, 0.3960784, 1, 0, 1,
-0.6132237, 0.3768755, -1.125124, 0.3921569, 1, 0, 1,
-0.6120991, -0.1248569, -2.133362, 0.3843137, 1, 0, 1,
-0.6116185, -1.887343, -3.323912, 0.3803922, 1, 0, 1,
-0.607739, 1.376397, -0.2750821, 0.372549, 1, 0, 1,
-0.6031821, -1.064339, -3.482478, 0.3686275, 1, 0, 1,
-0.6016573, 0.1423386, 0.2502691, 0.3607843, 1, 0, 1,
-0.59899, -1.218042, -2.083735, 0.3568628, 1, 0, 1,
-0.5981038, -0.1177172, -0.391555, 0.3490196, 1, 0, 1,
-0.5908497, -0.5009981, -1.095417, 0.345098, 1, 0, 1,
-0.5904811, 0.3216885, -1.218182, 0.3372549, 1, 0, 1,
-0.5892873, -1.782738, -1.689876, 0.3333333, 1, 0, 1,
-0.5871961, -0.06759407, -2.05144, 0.3254902, 1, 0, 1,
-0.5819311, 0.05472811, -1.60714, 0.3215686, 1, 0, 1,
-0.5811874, -0.9879026, -2.593753, 0.3137255, 1, 0, 1,
-0.5745844, 0.8219455, -2.26332, 0.3098039, 1, 0, 1,
-0.5737641, 0.9159393, -1.578051, 0.3019608, 1, 0, 1,
-0.5730047, -0.5582352, -2.387657, 0.2941177, 1, 0, 1,
-0.57269, 0.2795734, -0.5510807, 0.2901961, 1, 0, 1,
-0.5678499, 0.8757827, -2.678257, 0.282353, 1, 0, 1,
-0.5653805, 0.388086, 0.5221341, 0.2784314, 1, 0, 1,
-0.5637519, 0.3239615, -1.204624, 0.2705882, 1, 0, 1,
-0.563301, -0.5761148, -4.204198, 0.2666667, 1, 0, 1,
-0.5614477, 1.188242, -1.884327, 0.2588235, 1, 0, 1,
-0.5585313, 1.884622, 1.513733, 0.254902, 1, 0, 1,
-0.5576139, -0.7732177, -3.010681, 0.2470588, 1, 0, 1,
-0.5537311, -1.079854, -2.211096, 0.2431373, 1, 0, 1,
-0.5507265, 0.390964, 0.2704671, 0.2352941, 1, 0, 1,
-0.55064, 1.567329, 0.2425598, 0.2313726, 1, 0, 1,
-0.5461817, -0.1568257, -0.4376446, 0.2235294, 1, 0, 1,
-0.5440424, -0.6162961, -1.861191, 0.2196078, 1, 0, 1,
-0.5376511, -0.6990302, -3.123441, 0.2117647, 1, 0, 1,
-0.5356279, -1.671702, -3.665827, 0.2078431, 1, 0, 1,
-0.534627, -0.3567311, -3.167251, 0.2, 1, 0, 1,
-0.5304889, 1.668424, -1.238889, 0.1921569, 1, 0, 1,
-0.5294523, 1.247947, -2.610066, 0.1882353, 1, 0, 1,
-0.5263746, -0.238248, -1.584264, 0.1803922, 1, 0, 1,
-0.5154155, -0.9349102, -1.826919, 0.1764706, 1, 0, 1,
-0.5141008, 1.0306, 0.1587319, 0.1686275, 1, 0, 1,
-0.5035437, -0.7640503, -2.527505, 0.1647059, 1, 0, 1,
-0.5030445, -1.125749, -2.533011, 0.1568628, 1, 0, 1,
-0.5020668, -1.000631, -1.863572, 0.1529412, 1, 0, 1,
-0.5010803, -0.4012433, -2.277878, 0.145098, 1, 0, 1,
-0.4939095, -1.133623, -3.649743, 0.1411765, 1, 0, 1,
-0.4923794, -0.9724329, 0.1907999, 0.1333333, 1, 0, 1,
-0.4904829, 2.138071, 1.0365, 0.1294118, 1, 0, 1,
-0.4885986, 0.9126579, -1.490835, 0.1215686, 1, 0, 1,
-0.4852629, -1.823625, -3.000514, 0.1176471, 1, 0, 1,
-0.4829889, -1.419898, -2.110801, 0.1098039, 1, 0, 1,
-0.482424, 0.08399782, -2.118315, 0.1058824, 1, 0, 1,
-0.4804428, -0.2328244, -2.096586, 0.09803922, 1, 0, 1,
-0.4795394, -0.1857285, -2.951314, 0.09019608, 1, 0, 1,
-0.468024, -0.9186806, -1.344863, 0.08627451, 1, 0, 1,
-0.466224, 0.4147466, 0.5425022, 0.07843138, 1, 0, 1,
-0.4660784, 0.4528946, -2.652368, 0.07450981, 1, 0, 1,
-0.4634595, -0.4851731, -2.457973, 0.06666667, 1, 0, 1,
-0.4607744, -0.09916754, -1.715755, 0.0627451, 1, 0, 1,
-0.4607143, 1.358728, 0.4932599, 0.05490196, 1, 0, 1,
-0.456926, -0.2678386, -2.456006, 0.05098039, 1, 0, 1,
-0.4569131, -0.7675979, -0.5217018, 0.04313726, 1, 0, 1,
-0.4535656, 0.4535486, -1.980353, 0.03921569, 1, 0, 1,
-0.4531174, 1.543963, -0.2557641, 0.03137255, 1, 0, 1,
-0.4504208, -2.204919, -2.935281, 0.02745098, 1, 0, 1,
-0.4400651, 0.1098776, -0.6752661, 0.01960784, 1, 0, 1,
-0.4392057, 2.041824, -0.5461369, 0.01568628, 1, 0, 1,
-0.43749, -0.6354283, -4.822001, 0.007843138, 1, 0, 1,
-0.4321694, -2.665345, -2.788864, 0.003921569, 1, 0, 1,
-0.42974, -0.2466165, -1.287781, 0, 1, 0.003921569, 1,
-0.4267193, 0.6938444, -1.280592, 0, 1, 0.01176471, 1,
-0.4262764, -0.3016821, -1.379093, 0, 1, 0.01568628, 1,
-0.4161986, -0.522875, -1.151828, 0, 1, 0.02352941, 1,
-0.4141428, -0.5847651, -3.476765, 0, 1, 0.02745098, 1,
-0.4127532, -0.8087865, -1.663481, 0, 1, 0.03529412, 1,
-0.4062012, -0.6076861, -0.2968121, 0, 1, 0.03921569, 1,
-0.4025539, 0.1324208, -3.385979, 0, 1, 0.04705882, 1,
-0.4017431, 0.2524458, -1.131091, 0, 1, 0.05098039, 1,
-0.4008157, -0.5019404, -2.129955, 0, 1, 0.05882353, 1,
-0.4007159, 0.9139596, -1.568457, 0, 1, 0.0627451, 1,
-0.3983833, -1.162383, -1.811057, 0, 1, 0.07058824, 1,
-0.3943823, 0.6289333, -2.148239, 0, 1, 0.07450981, 1,
-0.3908861, -0.4062523, -2.083752, 0, 1, 0.08235294, 1,
-0.3896192, -2.957378, -3.319139, 0, 1, 0.08627451, 1,
-0.3873066, -0.127866, -1.387773, 0, 1, 0.09411765, 1,
-0.3841024, -1.352545, -1.010949, 0, 1, 0.1019608, 1,
-0.3792312, -2.299067, -3.949252, 0, 1, 0.1058824, 1,
-0.3780632, -0.1154793, -2.595033, 0, 1, 0.1137255, 1,
-0.3771277, -1.649597, -1.917433, 0, 1, 0.1176471, 1,
-0.3758456, 0.01133746, -1.766235, 0, 1, 0.1254902, 1,
-0.3747346, -0.8623201, -3.618899, 0, 1, 0.1294118, 1,
-0.3608321, -0.9066762, -1.517544, 0, 1, 0.1372549, 1,
-0.3603141, 0.1063421, -1.559991, 0, 1, 0.1411765, 1,
-0.3595131, -1.303978, -2.649086, 0, 1, 0.1490196, 1,
-0.3572638, 0.3009125, -1.230301, 0, 1, 0.1529412, 1,
-0.3567567, 1.185995, -0.618239, 0, 1, 0.1607843, 1,
-0.3566098, 0.5425196, 0.1612128, 0, 1, 0.1647059, 1,
-0.3539554, -0.9692516, -1.624749, 0, 1, 0.172549, 1,
-0.3506801, -1.082691, -1.747425, 0, 1, 0.1764706, 1,
-0.3495727, -1.387081, -2.488081, 0, 1, 0.1843137, 1,
-0.3367223, -0.4999354, -1.650379, 0, 1, 0.1882353, 1,
-0.336713, 0.3443599, -1.217625, 0, 1, 0.1960784, 1,
-0.33652, -0.8741556, -3.94685, 0, 1, 0.2039216, 1,
-0.3290042, 1.248715, 0.3296627, 0, 1, 0.2078431, 1,
-0.3275389, -0.5600299, -1.8738, 0, 1, 0.2156863, 1,
-0.3273791, 1.160954, -0.381769, 0, 1, 0.2196078, 1,
-0.3270337, 2.230456, 0.745132, 0, 1, 0.227451, 1,
-0.3267387, 0.4326192, -0.2317546, 0, 1, 0.2313726, 1,
-0.3266147, 0.1062166, -2.070553, 0, 1, 0.2392157, 1,
-0.3258461, -0.002419144, -0.5915607, 0, 1, 0.2431373, 1,
-0.3256364, -0.2204529, -1.863124, 0, 1, 0.2509804, 1,
-0.3222905, 1.710526, 0.1595968, 0, 1, 0.254902, 1,
-0.3188861, 0.293051, -1.888401, 0, 1, 0.2627451, 1,
-0.3186338, -1.315876, -2.310174, 0, 1, 0.2666667, 1,
-0.316069, -2.222335, -3.149168, 0, 1, 0.2745098, 1,
-0.3159812, -1.647352, -3.574968, 0, 1, 0.2784314, 1,
-0.3143143, 1.336668, 0.1612335, 0, 1, 0.2862745, 1,
-0.3113949, -0.6980982, -2.75605, 0, 1, 0.2901961, 1,
-0.3053887, 0.9376914, -1.356446, 0, 1, 0.2980392, 1,
-0.3033148, -1.264728, -2.358381, 0, 1, 0.3058824, 1,
-0.3014134, 0.2605797, -0.1514848, 0, 1, 0.3098039, 1,
-0.3005151, 1.268345, 0.60293, 0, 1, 0.3176471, 1,
-0.2973794, -1.224222, -2.890044, 0, 1, 0.3215686, 1,
-0.2948538, 1.331992, 0.2907276, 0, 1, 0.3294118, 1,
-0.2894589, -0.4526461, -3.115305, 0, 1, 0.3333333, 1,
-0.2798039, 0.6524982, 0.5970036, 0, 1, 0.3411765, 1,
-0.2782178, -0.1194164, -3.058445, 0, 1, 0.345098, 1,
-0.2748179, -0.2589257, -4.254567, 0, 1, 0.3529412, 1,
-0.2677995, -0.5946335, -2.762263, 0, 1, 0.3568628, 1,
-0.2672525, 0.9496226, -0.3980098, 0, 1, 0.3647059, 1,
-0.2586629, -0.2047655, -1.352139, 0, 1, 0.3686275, 1,
-0.2586124, -0.2917999, -3.767397, 0, 1, 0.3764706, 1,
-0.2573443, -0.4092303, -1.354027, 0, 1, 0.3803922, 1,
-0.2558745, 1.134536, -1.390848, 0, 1, 0.3882353, 1,
-0.2557155, -0.8450611, -2.273434, 0, 1, 0.3921569, 1,
-0.2518907, 0.4734697, -0.2791986, 0, 1, 0.4, 1,
-0.2510264, 1.087655, -0.5874897, 0, 1, 0.4078431, 1,
-0.2465823, -0.5100912, -2.902401, 0, 1, 0.4117647, 1,
-0.2455346, 0.9116039, -1.749005, 0, 1, 0.4196078, 1,
-0.2415769, -0.4361621, -3.213081, 0, 1, 0.4235294, 1,
-0.235929, 1.305824, -0.8846556, 0, 1, 0.4313726, 1,
-0.2312801, -0.6900613, -2.103686, 0, 1, 0.4352941, 1,
-0.2304998, 0.8021155, 0.8358126, 0, 1, 0.4431373, 1,
-0.2299037, -0.4224569, -3.306567, 0, 1, 0.4470588, 1,
-0.2284968, -1.375773, -3.115349, 0, 1, 0.454902, 1,
-0.2270978, 1.359194, -0.253505, 0, 1, 0.4588235, 1,
-0.2263051, 1.665237, -0.7521306, 0, 1, 0.4666667, 1,
-0.2222596, 0.4416834, 0.5072669, 0, 1, 0.4705882, 1,
-0.2202703, 0.3586777, 0.4006802, 0, 1, 0.4784314, 1,
-0.2202229, -1.326862, -2.000926, 0, 1, 0.4823529, 1,
-0.2181289, -1.945657, -1.175527, 0, 1, 0.4901961, 1,
-0.2152472, 1.12715, -0.2280309, 0, 1, 0.4941176, 1,
-0.2141133, 0.9582453, -1.340012, 0, 1, 0.5019608, 1,
-0.2132786, -1.013117, -2.700859, 0, 1, 0.509804, 1,
-0.2068824, 0.6927972, -0.2206103, 0, 1, 0.5137255, 1,
-0.1996635, 0.1287495, -0.1626687, 0, 1, 0.5215687, 1,
-0.1974992, 0.7338348, -1.138237, 0, 1, 0.5254902, 1,
-0.197415, 0.8464474, -0.4025809, 0, 1, 0.5333334, 1,
-0.1954727, -0.3417399, -2.664422, 0, 1, 0.5372549, 1,
-0.1921883, -0.2424196, -2.616569, 0, 1, 0.5450981, 1,
-0.1901934, 1.869304, -0.4866696, 0, 1, 0.5490196, 1,
-0.1864972, 1.613462, -0.6328594, 0, 1, 0.5568628, 1,
-0.1840646, -1.374022, -3.64659, 0, 1, 0.5607843, 1,
-0.1816848, 0.4693015, 0.577183, 0, 1, 0.5686275, 1,
-0.1815084, -1.419371, -3.243226, 0, 1, 0.572549, 1,
-0.1814955, 1.485027, -0.1826718, 0, 1, 0.5803922, 1,
-0.176992, -0.8369012, -3.345562, 0, 1, 0.5843138, 1,
-0.1694389, 0.6302122, 1.086707, 0, 1, 0.5921569, 1,
-0.1678908, 0.1694214, 0.7483662, 0, 1, 0.5960785, 1,
-0.1637372, -0.39904, -2.019274, 0, 1, 0.6039216, 1,
-0.1540844, 0.279346, 0.6657411, 0, 1, 0.6117647, 1,
-0.1442001, 0.4506241, -0.8849431, 0, 1, 0.6156863, 1,
-0.1396638, 1.4835, -0.2600527, 0, 1, 0.6235294, 1,
-0.1342093, -0.5257978, -4.182867, 0, 1, 0.627451, 1,
-0.1282565, 0.8903466, 0.410485, 0, 1, 0.6352941, 1,
-0.1227428, 0.8147717, -0.2701303, 0, 1, 0.6392157, 1,
-0.1223222, 1.152073, 0.7308238, 0, 1, 0.6470588, 1,
-0.1202684, -0.8218876, -2.003011, 0, 1, 0.6509804, 1,
-0.1167426, 2.636842, -0.2677883, 0, 1, 0.6588235, 1,
-0.1157403, -0.1037211, -2.535393, 0, 1, 0.6627451, 1,
-0.1138071, -0.5915838, -2.202148, 0, 1, 0.6705883, 1,
-0.112618, 1.199288, -0.08267935, 0, 1, 0.6745098, 1,
-0.1106194, 0.1810369, -1.841311, 0, 1, 0.682353, 1,
-0.1090651, 0.2025849, -0.1174814, 0, 1, 0.6862745, 1,
-0.1064014, -0.2170766, -4.6027, 0, 1, 0.6941177, 1,
-0.1059313, 0.8290602, -0.5225339, 0, 1, 0.7019608, 1,
-0.1010104, -0.6654969, -2.257485, 0, 1, 0.7058824, 1,
-0.09936069, -1.144178, -3.951565, 0, 1, 0.7137255, 1,
-0.09757996, 0.004761443, 0.3420181, 0, 1, 0.7176471, 1,
-0.09486144, -0.7177413, -3.819249, 0, 1, 0.7254902, 1,
-0.09240822, 1.161717, 0.236166, 0, 1, 0.7294118, 1,
-0.0916789, 0.8740443, -1.855882, 0, 1, 0.7372549, 1,
-0.09165605, 0.3710177, -1.439248, 0, 1, 0.7411765, 1,
-0.09074739, -0.04617723, -2.661355, 0, 1, 0.7490196, 1,
-0.09049357, -1.325401, -3.043137, 0, 1, 0.7529412, 1,
-0.08996451, 0.8776262, -0.4553484, 0, 1, 0.7607843, 1,
-0.08654439, 0.9535195, -1.847494, 0, 1, 0.7647059, 1,
-0.08538938, 1.08138, -1.327528, 0, 1, 0.772549, 1,
-0.08431447, -0.3807699, -3.397625, 0, 1, 0.7764706, 1,
-0.0818543, 2.949238, 1.206921, 0, 1, 0.7843137, 1,
-0.08011791, -2.337229, -3.681849, 0, 1, 0.7882353, 1,
-0.07897072, -0.4059142, -1.879817, 0, 1, 0.7960784, 1,
-0.07545379, -1.527902, -2.169539, 0, 1, 0.8039216, 1,
-0.07247719, 1.26914, -0.298841, 0, 1, 0.8078431, 1,
-0.06876516, 0.5533291, -0.1663258, 0, 1, 0.8156863, 1,
-0.06736207, -0.3340352, -4.310957, 0, 1, 0.8196079, 1,
-0.06602099, -1.065053, -4.16778, 0, 1, 0.827451, 1,
-0.06491499, 0.6774558, -0.8125726, 0, 1, 0.8313726, 1,
-0.06235427, -0.8839412, -4.316252, 0, 1, 0.8392157, 1,
-0.06176741, 0.1158656, 0.7096827, 0, 1, 0.8431373, 1,
-0.05808641, 0.1509722, 0.08383582, 0, 1, 0.8509804, 1,
-0.05353202, 1.145421, -0.08528979, 0, 1, 0.854902, 1,
-0.05107238, 0.6833252, 1.443324, 0, 1, 0.8627451, 1,
-0.04913684, 0.6614164, 0.1329117, 0, 1, 0.8666667, 1,
-0.04607886, -0.9710793, -2.407996, 0, 1, 0.8745098, 1,
-0.04579183, 0.3569876, 1.457857, 0, 1, 0.8784314, 1,
-0.04545838, -2.130856, -3.737055, 0, 1, 0.8862745, 1,
-0.04291924, -1.555221, -3.119694, 0, 1, 0.8901961, 1,
-0.04278592, -0.5446325, -4.25686, 0, 1, 0.8980392, 1,
-0.03835246, 0.3891867, -0.4549277, 0, 1, 0.9058824, 1,
-0.03805639, 1.031204, -0.9307452, 0, 1, 0.9098039, 1,
-0.03620911, -0.5443725, -4.374807, 0, 1, 0.9176471, 1,
-0.0325929, 0.8339652, -0.26211, 0, 1, 0.9215686, 1,
-0.03040732, -1.247816, -6.240757, 0, 1, 0.9294118, 1,
-0.02832423, 0.2374362, 1.210411, 0, 1, 0.9333333, 1,
-0.02287829, -0.2470169, -2.556764, 0, 1, 0.9411765, 1,
-0.01926304, 1.350271, 0.1201789, 0, 1, 0.945098, 1,
-0.01132564, 1.200327, 0.5144603, 0, 1, 0.9529412, 1,
-0.01117804, 0.8227893, -0.2147645, 0, 1, 0.9568627, 1,
-0.01101761, -0.04411909, -2.876259, 0, 1, 0.9647059, 1,
-0.0105455, 1.282518, 1.104881, 0, 1, 0.9686275, 1,
-0.008035674, 1.218173, -2.002531, 0, 1, 0.9764706, 1,
-0.004783517, 0.736114, -0.7207933, 0, 1, 0.9803922, 1,
0.005058844, -0.2001014, 3.896623, 0, 1, 0.9882353, 1,
0.005394453, 0.1218765, -0.2317998, 0, 1, 0.9921569, 1,
0.006586548, -2.376788, 2.894235, 0, 1, 1, 1,
0.009491743, -0.1226591, 0.2793728, 0, 0.9921569, 1, 1,
0.01417905, 0.3897175, -0.2500181, 0, 0.9882353, 1, 1,
0.01628657, -0.7183406, 2.822975, 0, 0.9803922, 1, 1,
0.01684985, -0.2525491, 2.31584, 0, 0.9764706, 1, 1,
0.01928023, -0.8470935, 3.956532, 0, 0.9686275, 1, 1,
0.022058, 1.906336, -0.8549493, 0, 0.9647059, 1, 1,
0.02792276, 0.8044486, -0.6271164, 0, 0.9568627, 1, 1,
0.03098795, -1.337799, 3.739164, 0, 0.9529412, 1, 1,
0.03185052, -1.544893, 3.804071, 0, 0.945098, 1, 1,
0.03426513, -0.1824573, 3.431436, 0, 0.9411765, 1, 1,
0.03710975, -0.7708589, 3.388809, 0, 0.9333333, 1, 1,
0.04055661, -0.4536051, 1.961128, 0, 0.9294118, 1, 1,
0.04309751, -1.26395, 1.916009, 0, 0.9215686, 1, 1,
0.04466426, 0.1581144, -1.329963, 0, 0.9176471, 1, 1,
0.04698689, 0.2070758, 1.960343, 0, 0.9098039, 1, 1,
0.04792283, -1.529966, 1.516745, 0, 0.9058824, 1, 1,
0.05305213, -1.594735, 1.336553, 0, 0.8980392, 1, 1,
0.05374055, -0.9608909, 4.450637, 0, 0.8901961, 1, 1,
0.05614509, -1.290865, 2.149843, 0, 0.8862745, 1, 1,
0.05848622, -0.5096218, 2.257298, 0, 0.8784314, 1, 1,
0.05850984, -3.394744, 4.086104, 0, 0.8745098, 1, 1,
0.06021898, 1.53758, 0.6186109, 0, 0.8666667, 1, 1,
0.06244312, -0.7628619, 4.277386, 0, 0.8627451, 1, 1,
0.06541653, 0.6894113, 1.149261, 0, 0.854902, 1, 1,
0.07494808, 0.9625819, -1.179382, 0, 0.8509804, 1, 1,
0.07861473, 0.3916978, 0.7874101, 0, 0.8431373, 1, 1,
0.07926881, -0.7949672, 2.928732, 0, 0.8392157, 1, 1,
0.08273076, -1.281453, 4.819637, 0, 0.8313726, 1, 1,
0.08351815, 2.866007, -1.89385, 0, 0.827451, 1, 1,
0.08570137, -0.4897357, 2.856132, 0, 0.8196079, 1, 1,
0.08824654, 0.7599621, 0.0441129, 0, 0.8156863, 1, 1,
0.08834761, -2.026618, 2.270608, 0, 0.8078431, 1, 1,
0.08872616, -0.4576804, 1.969997, 0, 0.8039216, 1, 1,
0.09829517, -0.6180854, 1.595575, 0, 0.7960784, 1, 1,
0.09910552, -0.4488527, 1.308605, 0, 0.7882353, 1, 1,
0.1023841, -1.542922, 4.182308, 0, 0.7843137, 1, 1,
0.1029963, 1.079133, 0.5660341, 0, 0.7764706, 1, 1,
0.1042824, -1.017204, 2.323208, 0, 0.772549, 1, 1,
0.1062048, 0.655412, 0.1444896, 0, 0.7647059, 1, 1,
0.1075172, 0.536903, -1.543438, 0, 0.7607843, 1, 1,
0.1080861, 2.517162, 0.7008514, 0, 0.7529412, 1, 1,
0.1108103, 0.1947265, -1.689986, 0, 0.7490196, 1, 1,
0.1120056, 0.3964536, 0.7776389, 0, 0.7411765, 1, 1,
0.1121809, 0.3145231, 0.4202707, 0, 0.7372549, 1, 1,
0.1143364, 1.627057, 0.9913813, 0, 0.7294118, 1, 1,
0.1236429, 1.583726, -0.3464585, 0, 0.7254902, 1, 1,
0.1239415, 0.7998673, 0.738995, 0, 0.7176471, 1, 1,
0.1254394, 0.7568411, 1.233256, 0, 0.7137255, 1, 1,
0.1259786, 1.630989, 4.217809, 0, 0.7058824, 1, 1,
0.1298532, -0.817759, 1.073003, 0, 0.6980392, 1, 1,
0.1311471, 0.6851102, 0.6783636, 0, 0.6941177, 1, 1,
0.1337379, 0.1443311, 1.069638, 0, 0.6862745, 1, 1,
0.1341452, -1.496965, 2.105196, 0, 0.682353, 1, 1,
0.1348437, 0.6890677, -1.905842, 0, 0.6745098, 1, 1,
0.1375645, -0.5369927, 3.294174, 0, 0.6705883, 1, 1,
0.1450031, -1.256702, 2.768274, 0, 0.6627451, 1, 1,
0.1485713, 0.1689597, -0.447896, 0, 0.6588235, 1, 1,
0.1525657, 0.6381058, 0.2326984, 0, 0.6509804, 1, 1,
0.1527141, -0.4489436, 1.916071, 0, 0.6470588, 1, 1,
0.152763, -0.05596882, 2.363449, 0, 0.6392157, 1, 1,
0.1582197, -1.467894, 3.54827, 0, 0.6352941, 1, 1,
0.1596122, -1.19939, 3.878565, 0, 0.627451, 1, 1,
0.1663909, -1.147099, 4.745004, 0, 0.6235294, 1, 1,
0.1684881, -0.08102749, 3.231041, 0, 0.6156863, 1, 1,
0.1704449, 0.2548649, 1.296564, 0, 0.6117647, 1, 1,
0.1735066, -0.2721625, 1.698002, 0, 0.6039216, 1, 1,
0.1746984, -0.5392658, 0.4525172, 0, 0.5960785, 1, 1,
0.1838061, -0.8406605, 1.58221, 0, 0.5921569, 1, 1,
0.1870207, -2.270887, 3.486197, 0, 0.5843138, 1, 1,
0.1893464, -0.6787132, 4.508548, 0, 0.5803922, 1, 1,
0.1959331, 0.595598, -1.044157, 0, 0.572549, 1, 1,
0.2015749, 0.2747567, 1.070051, 0, 0.5686275, 1, 1,
0.2055396, -0.4946406, 2.584641, 0, 0.5607843, 1, 1,
0.2066924, 0.3968901, -1.985407, 0, 0.5568628, 1, 1,
0.210598, -0.5997213, 2.413443, 0, 0.5490196, 1, 1,
0.2109448, -1.466745, 2.051302, 0, 0.5450981, 1, 1,
0.2152223, 0.06611617, 1.472849, 0, 0.5372549, 1, 1,
0.2178759, -0.09483081, 2.958542, 0, 0.5333334, 1, 1,
0.2190517, -0.1539426, 2.918313, 0, 0.5254902, 1, 1,
0.2193397, 0.2395323, 1.773094, 0, 0.5215687, 1, 1,
0.2213242, -2.592355, 3.576548, 0, 0.5137255, 1, 1,
0.2244594, 1.046213, -0.8840907, 0, 0.509804, 1, 1,
0.2265039, -1.088861, 1.670921, 0, 0.5019608, 1, 1,
0.2273104, 0.1521601, 2.690018, 0, 0.4941176, 1, 1,
0.2296129, 2.152084, 0.8658183, 0, 0.4901961, 1, 1,
0.230225, -0.5548991, 3.090469, 0, 0.4823529, 1, 1,
0.2304321, -0.8186111, 3.084252, 0, 0.4784314, 1, 1,
0.2307731, -0.936694, 2.504224, 0, 0.4705882, 1, 1,
0.2311539, -0.01419096, 1.892393, 0, 0.4666667, 1, 1,
0.2325056, -0.4267431, 3.852728, 0, 0.4588235, 1, 1,
0.2378764, -0.07411243, 0.6680231, 0, 0.454902, 1, 1,
0.2388593, -0.4460606, 3.317739, 0, 0.4470588, 1, 1,
0.2390409, 1.924653, 0.007461245, 0, 0.4431373, 1, 1,
0.2414321, -0.2472223, 2.386088, 0, 0.4352941, 1, 1,
0.2431195, -0.8120346, 2.85484, 0, 0.4313726, 1, 1,
0.2438619, 0.8765821, -1.140048, 0, 0.4235294, 1, 1,
0.2443194, 1.119489, 1.75161, 0, 0.4196078, 1, 1,
0.2454329, 0.2464515, 0.2145233, 0, 0.4117647, 1, 1,
0.2479793, 0.5828313, 1.23748, 0, 0.4078431, 1, 1,
0.2526961, -0.4605445, 3.831413, 0, 0.4, 1, 1,
0.2529213, -0.07495984, 4.633232, 0, 0.3921569, 1, 1,
0.2534373, 0.2248095, 2.403136, 0, 0.3882353, 1, 1,
0.2548755, 0.4745303, 0.9794604, 0, 0.3803922, 1, 1,
0.2559965, 0.4548473, -0.722412, 0, 0.3764706, 1, 1,
0.2580214, 0.9685187, 0.7859565, 0, 0.3686275, 1, 1,
0.2583133, -0.1400581, 1.063545, 0, 0.3647059, 1, 1,
0.2674412, -0.1082456, 0.388962, 0, 0.3568628, 1, 1,
0.2677387, 0.9375553, -0.8201124, 0, 0.3529412, 1, 1,
0.2690698, -1.913543, 2.709277, 0, 0.345098, 1, 1,
0.2767214, -0.8215045, 3.818796, 0, 0.3411765, 1, 1,
0.276956, 0.3973321, 0.6692616, 0, 0.3333333, 1, 1,
0.2787713, -0.5092448, 2.896421, 0, 0.3294118, 1, 1,
0.2796894, 0.26956, 2.175689, 0, 0.3215686, 1, 1,
0.2906916, 1.171083, 1.141265, 0, 0.3176471, 1, 1,
0.2907827, 1.15518, 0.5915332, 0, 0.3098039, 1, 1,
0.2918036, 0.6733258, 1.195734, 0, 0.3058824, 1, 1,
0.2921593, 0.3261369, 1.384516, 0, 0.2980392, 1, 1,
0.2925451, -0.7807781, 4.515086, 0, 0.2901961, 1, 1,
0.2938716, 0.002155926, 0.07980237, 0, 0.2862745, 1, 1,
0.2947838, -0.05401054, 2.289606, 0, 0.2784314, 1, 1,
0.2962834, -0.6305112, 1.981698, 0, 0.2745098, 1, 1,
0.3033476, -0.5483754, 3.442051, 0, 0.2666667, 1, 1,
0.3076457, -1.963833, 3.552559, 0, 0.2627451, 1, 1,
0.3083583, -0.2278141, 1.424743, 0, 0.254902, 1, 1,
0.3105069, 0.01588068, -0.2031143, 0, 0.2509804, 1, 1,
0.3121865, -1.2987, 4.064406, 0, 0.2431373, 1, 1,
0.3173871, 1.342906, 1.003006, 0, 0.2392157, 1, 1,
0.3187108, 0.6545818, -0.5195086, 0, 0.2313726, 1, 1,
0.3213579, -1.062013, 4.83384, 0, 0.227451, 1, 1,
0.3220546, -1.856565, 2.024789, 0, 0.2196078, 1, 1,
0.3222614, -0.4593688, 3.823531, 0, 0.2156863, 1, 1,
0.3242887, -1.188971, 2.528758, 0, 0.2078431, 1, 1,
0.3254536, -0.4204687, 2.364313, 0, 0.2039216, 1, 1,
0.3266123, 0.2310207, 4.366419, 0, 0.1960784, 1, 1,
0.3284071, 0.4818045, -0.05576147, 0, 0.1882353, 1, 1,
0.3333398, 1.843537, 0.9760057, 0, 0.1843137, 1, 1,
0.3337583, -0.1695288, 2.678441, 0, 0.1764706, 1, 1,
0.3376008, 0.3585553, 0.3115569, 0, 0.172549, 1, 1,
0.3430565, 1.031596, -0.2444576, 0, 0.1647059, 1, 1,
0.3436033, 2.824485, 0.3547478, 0, 0.1607843, 1, 1,
0.3437925, -1.229411, 0.9761157, 0, 0.1529412, 1, 1,
0.3523363, 0.5465475, -0.3822246, 0, 0.1490196, 1, 1,
0.3547968, 2.253787, 0.7281168, 0, 0.1411765, 1, 1,
0.3569306, 0.542459, -0.7576593, 0, 0.1372549, 1, 1,
0.3591741, 0.003424254, 1.465418, 0, 0.1294118, 1, 1,
0.3613644, -1.041968, 2.845145, 0, 0.1254902, 1, 1,
0.3621981, 0.1281429, 0.6019613, 0, 0.1176471, 1, 1,
0.3659994, -0.6911066, 0.7918378, 0, 0.1137255, 1, 1,
0.3792582, 0.04354572, 2.23408, 0, 0.1058824, 1, 1,
0.3810832, -1.306884, -0.2489236, 0, 0.09803922, 1, 1,
0.3817455, 0.01656373, 3.043817, 0, 0.09411765, 1, 1,
0.3834849, -2.361027, 4.078708, 0, 0.08627451, 1, 1,
0.386957, 1.951142, 1.340259, 0, 0.08235294, 1, 1,
0.3882233, -0.7622679, 2.634852, 0, 0.07450981, 1, 1,
0.3892013, -0.2859909, 3.027844, 0, 0.07058824, 1, 1,
0.3895866, -0.5082731, 3.268265, 0, 0.0627451, 1, 1,
0.3939343, 0.6923354, 1.033658, 0, 0.05882353, 1, 1,
0.3977144, -0.4367302, 2.873062, 0, 0.05098039, 1, 1,
0.3989424, -1.472667, 3.622247, 0, 0.04705882, 1, 1,
0.4023283, -0.3250129, 1.567869, 0, 0.03921569, 1, 1,
0.4048055, 2.123523, -0.7166709, 0, 0.03529412, 1, 1,
0.4055386, 0.3318158, 1.119594, 0, 0.02745098, 1, 1,
0.4138961, 0.4171029, -0.0709181, 0, 0.02352941, 1, 1,
0.4195098, 0.168469, 1.230308, 0, 0.01568628, 1, 1,
0.4195965, -0.5313197, 0.9705886, 0, 0.01176471, 1, 1,
0.4202903, -1.06919, 3.823502, 0, 0.003921569, 1, 1,
0.420558, -0.8537449, 3.2981, 0.003921569, 0, 1, 1,
0.4266416, 0.05203456, 1.668738, 0.007843138, 0, 1, 1,
0.4269333, 1.709717, 1.052186, 0.01568628, 0, 1, 1,
0.4286619, 1.308734, 0.7057772, 0.01960784, 0, 1, 1,
0.4298049, -1.292156, 2.574144, 0.02745098, 0, 1, 1,
0.4348508, -1.157275, 4.212427, 0.03137255, 0, 1, 1,
0.4428986, 0.7598873, 0.622561, 0.03921569, 0, 1, 1,
0.4443191, 0.8761405, 1.323379, 0.04313726, 0, 1, 1,
0.4472051, 1.412324, 0.7618366, 0.05098039, 0, 1, 1,
0.4504384, 1.023389, -0.2879091, 0.05490196, 0, 1, 1,
0.4535689, -1.045243, 3.130255, 0.0627451, 0, 1, 1,
0.4546366, -1.905669, 3.273389, 0.06666667, 0, 1, 1,
0.4557113, 0.8109041, 1.68107, 0.07450981, 0, 1, 1,
0.4579055, -0.1643682, 3.771066, 0.07843138, 0, 1, 1,
0.4580153, -1.894754, 2.133954, 0.08627451, 0, 1, 1,
0.4585349, -0.4212908, 3.268262, 0.09019608, 0, 1, 1,
0.4620581, -1.719315, 3.734472, 0.09803922, 0, 1, 1,
0.462181, -0.6214417, 2.037029, 0.1058824, 0, 1, 1,
0.4654057, -0.8767787, 2.146082, 0.1098039, 0, 1, 1,
0.4666273, 1.218668, 0.1344663, 0.1176471, 0, 1, 1,
0.4728325, -0.5472742, 1.93668, 0.1215686, 0, 1, 1,
0.4764175, 0.4070957, 0.530583, 0.1294118, 0, 1, 1,
0.4767776, 0.2352472, 1.347593, 0.1333333, 0, 1, 1,
0.4796138, 1.47218, 0.2924041, 0.1411765, 0, 1, 1,
0.4834076, -0.6050143, 0.7870301, 0.145098, 0, 1, 1,
0.4902872, -0.2708298, 3.16898, 0.1529412, 0, 1, 1,
0.4908924, 0.2612507, 1.846271, 0.1568628, 0, 1, 1,
0.5039064, -0.3007624, 4.255005, 0.1647059, 0, 1, 1,
0.5045897, -0.9576457, 1.095792, 0.1686275, 0, 1, 1,
0.5059659, -0.7486784, 1.834998, 0.1764706, 0, 1, 1,
0.5066252, -0.3618092, 3.253257, 0.1803922, 0, 1, 1,
0.5174866, -2.395166, 2.664029, 0.1882353, 0, 1, 1,
0.5185282, -1.041596, 3.459602, 0.1921569, 0, 1, 1,
0.5205255, -0.6683151, 2.630081, 0.2, 0, 1, 1,
0.5230421, 0.09489746, 0.2119728, 0.2078431, 0, 1, 1,
0.5247245, -0.4874858, 3.142792, 0.2117647, 0, 1, 1,
0.526366, -0.43269, 2.618137, 0.2196078, 0, 1, 1,
0.5281667, 0.3329243, 2.43099, 0.2235294, 0, 1, 1,
0.530211, -0.7838249, 3.494381, 0.2313726, 0, 1, 1,
0.5333593, 0.4174379, -0.0531793, 0.2352941, 0, 1, 1,
0.5373737, 1.969584, 0.9301531, 0.2431373, 0, 1, 1,
0.5384945, 0.770322, 3.941429, 0.2470588, 0, 1, 1,
0.5393938, -1.256831, 2.746488, 0.254902, 0, 1, 1,
0.5408899, -0.5564381, 2.647816, 0.2588235, 0, 1, 1,
0.5417718, 0.01814857, 1.828151, 0.2666667, 0, 1, 1,
0.5418056, -1.355106, 2.621858, 0.2705882, 0, 1, 1,
0.5444203, 1.040148, 2.422636, 0.2784314, 0, 1, 1,
0.5451316, 1.396479, 0.2458085, 0.282353, 0, 1, 1,
0.5454836, 0.4396157, 0.6838768, 0.2901961, 0, 1, 1,
0.5480522, 0.296102, 1.935052, 0.2941177, 0, 1, 1,
0.5484297, 0.04290948, 2.520438, 0.3019608, 0, 1, 1,
0.5590838, 1.126227, 0.7416857, 0.3098039, 0, 1, 1,
0.5643608, -0.358713, 3.823506, 0.3137255, 0, 1, 1,
0.5655944, 1.201652, 1.450144, 0.3215686, 0, 1, 1,
0.5801845, -0.1134681, 2.465222, 0.3254902, 0, 1, 1,
0.5881413, -0.9788454, 1.512635, 0.3333333, 0, 1, 1,
0.5883085, 3.152283, 1.800466, 0.3372549, 0, 1, 1,
0.5915068, 0.9514228, 1.424101, 0.345098, 0, 1, 1,
0.5929753, -0.5740677, 2.122165, 0.3490196, 0, 1, 1,
0.5972992, 1.44761, 1.975615, 0.3568628, 0, 1, 1,
0.5999944, 1.042514, 0.4751017, 0.3607843, 0, 1, 1,
0.600944, -0.8342803, 2.012735, 0.3686275, 0, 1, 1,
0.6041775, -0.2350971, 2.623129, 0.372549, 0, 1, 1,
0.6180049, 0.665905, -0.401841, 0.3803922, 0, 1, 1,
0.6212718, -0.3961355, -0.3690548, 0.3843137, 0, 1, 1,
0.6343417, -0.1101532, 1.101875, 0.3921569, 0, 1, 1,
0.6343655, -1.686954, 2.533638, 0.3960784, 0, 1, 1,
0.6370969, 0.7318373, -0.5100963, 0.4039216, 0, 1, 1,
0.641385, 1.622527, 1.382464, 0.4117647, 0, 1, 1,
0.6450599, 1.629557, -1.58968, 0.4156863, 0, 1, 1,
0.6512684, 0.2629242, 1.484673, 0.4235294, 0, 1, 1,
0.6570137, -1.199679, 1.227133, 0.427451, 0, 1, 1,
0.6687995, 0.7452539, 0.8591082, 0.4352941, 0, 1, 1,
0.6704576, -0.8575413, 3.729218, 0.4392157, 0, 1, 1,
0.6756178, 0.3039555, 1.062901, 0.4470588, 0, 1, 1,
0.6785006, -0.1296095, 0.8286697, 0.4509804, 0, 1, 1,
0.6789417, 0.5797259, 2.492856, 0.4588235, 0, 1, 1,
0.6817868, 0.03360992, 1.210785, 0.4627451, 0, 1, 1,
0.6830795, 0.3925097, 1.221729, 0.4705882, 0, 1, 1,
0.7067411, 0.1718171, 0.8560677, 0.4745098, 0, 1, 1,
0.7084171, -0.6116686, 2.428506, 0.4823529, 0, 1, 1,
0.7102018, 0.1553949, 1.123551, 0.4862745, 0, 1, 1,
0.7132948, -1.562976, 1.673298, 0.4941176, 0, 1, 1,
0.7139349, -0.121874, 1.27928, 0.5019608, 0, 1, 1,
0.7143829, 0.5881932, 1.212171, 0.5058824, 0, 1, 1,
0.7149796, 0.6919339, 0.6007171, 0.5137255, 0, 1, 1,
0.7195645, -1.28189, 2.2423, 0.5176471, 0, 1, 1,
0.7207918, -0.6282376, 0.1528196, 0.5254902, 0, 1, 1,
0.7547534, 0.8645074, 0.9751573, 0.5294118, 0, 1, 1,
0.7584664, 0.5085354, 1.950939, 0.5372549, 0, 1, 1,
0.7649323, 1.131629, 0.1020126, 0.5411765, 0, 1, 1,
0.7665448, -0.8665153, 2.701494, 0.5490196, 0, 1, 1,
0.7668212, -2.044393, 2.511256, 0.5529412, 0, 1, 1,
0.7693689, -0.1921612, 1.283016, 0.5607843, 0, 1, 1,
0.7710229, -0.1420023, 3.226189, 0.5647059, 0, 1, 1,
0.7783284, 0.08583387, 1.58207, 0.572549, 0, 1, 1,
0.7814074, -0.8060963, 1.653024, 0.5764706, 0, 1, 1,
0.7821481, 0.6315009, 0.590002, 0.5843138, 0, 1, 1,
0.783026, -1.262502, 3.959822, 0.5882353, 0, 1, 1,
0.78563, 0.4493959, 0.07636394, 0.5960785, 0, 1, 1,
0.7856821, 0.337347, 0.5735996, 0.6039216, 0, 1, 1,
0.7885831, -0.3706931, 2.301262, 0.6078432, 0, 1, 1,
0.791145, -0.2920162, 2.467793, 0.6156863, 0, 1, 1,
0.793785, 1.24188, -0.9957874, 0.6196079, 0, 1, 1,
0.7957441, 1.348289, 1.183399, 0.627451, 0, 1, 1,
0.8025435, -0.3156663, 2.568786, 0.6313726, 0, 1, 1,
0.8049515, 1.837626, 0.8728421, 0.6392157, 0, 1, 1,
0.8053694, -0.7270849, 2.366606, 0.6431373, 0, 1, 1,
0.8064934, -1.810261, 1.743816, 0.6509804, 0, 1, 1,
0.8112279, 0.08774612, 1.406873, 0.654902, 0, 1, 1,
0.8158581, 1.473985, -1.171873, 0.6627451, 0, 1, 1,
0.8164973, -0.6530386, 1.564145, 0.6666667, 0, 1, 1,
0.8176252, -0.1986353, 1.555884, 0.6745098, 0, 1, 1,
0.8207768, 0.1886583, 2.834016, 0.6784314, 0, 1, 1,
0.8250194, 2.122143, -0.4969612, 0.6862745, 0, 1, 1,
0.8313948, 1.500541, 0.593293, 0.6901961, 0, 1, 1,
0.8353972, -1.108971, 2.443593, 0.6980392, 0, 1, 1,
0.8390054, 0.394934, 2.068057, 0.7058824, 0, 1, 1,
0.8431901, -1.676652, 2.997479, 0.7098039, 0, 1, 1,
0.8451219, 1.855125, 0.9603586, 0.7176471, 0, 1, 1,
0.8494581, -0.2160895, 2.955935, 0.7215686, 0, 1, 1,
0.8513325, -1.336025, 3.374465, 0.7294118, 0, 1, 1,
0.8514735, -0.05956024, 1.793126, 0.7333333, 0, 1, 1,
0.8521817, 0.7197164, 0.5296344, 0.7411765, 0, 1, 1,
0.8536396, 1.158343, 0.1034912, 0.7450981, 0, 1, 1,
0.8554328, -0.4468478, 1.876494, 0.7529412, 0, 1, 1,
0.8675935, 1.292515, -0.6994605, 0.7568628, 0, 1, 1,
0.8700387, -0.8550541, 1.861963, 0.7647059, 0, 1, 1,
0.8720415, -0.1001809, 3.037751, 0.7686275, 0, 1, 1,
0.8781178, -0.04131428, 1.204845, 0.7764706, 0, 1, 1,
0.8794702, -1.29276, 2.601948, 0.7803922, 0, 1, 1,
0.8817147, 0.349004, 1.799432, 0.7882353, 0, 1, 1,
0.8820593, -1.321549, 4.564429, 0.7921569, 0, 1, 1,
0.8859104, -0.4011464, 2.071545, 0.8, 0, 1, 1,
0.8867194, 1.66438, 0.2456059, 0.8078431, 0, 1, 1,
0.8937147, 1.136203, 1.266964, 0.8117647, 0, 1, 1,
0.8942174, 2.230491, 1.741965, 0.8196079, 0, 1, 1,
0.898202, 0.3006785, 0.8226964, 0.8235294, 0, 1, 1,
0.8983784, 2.011328, -1.242624, 0.8313726, 0, 1, 1,
0.9007919, -0.7626795, 3.158337, 0.8352941, 0, 1, 1,
0.9133831, -0.9464903, 4.017297, 0.8431373, 0, 1, 1,
0.9144637, 1.526003, 0.8550709, 0.8470588, 0, 1, 1,
0.9155551, 0.7720643, 1.145125, 0.854902, 0, 1, 1,
0.9201401, 0.2645362, 0.5811499, 0.8588235, 0, 1, 1,
0.9203032, 0.8228698, 0.2409653, 0.8666667, 0, 1, 1,
0.9209452, -1.617914, 2.899756, 0.8705882, 0, 1, 1,
0.9228498, -0.8683861, 3.277563, 0.8784314, 0, 1, 1,
0.9230659, -1.659165, 3.174433, 0.8823529, 0, 1, 1,
0.9264706, 0.2077049, 2.462729, 0.8901961, 0, 1, 1,
0.9331161, -0.4594181, 3.018894, 0.8941177, 0, 1, 1,
0.9385917, -0.005707127, 0.6736495, 0.9019608, 0, 1, 1,
0.9413903, 1.31592, 0.469674, 0.9098039, 0, 1, 1,
0.9434026, 0.3870168, 0.2025976, 0.9137255, 0, 1, 1,
0.9437374, 2.065586, 0.714357, 0.9215686, 0, 1, 1,
0.9447985, -1.550862, 2.483125, 0.9254902, 0, 1, 1,
0.9459747, -0.5404745, 1.818626, 0.9333333, 0, 1, 1,
0.947161, -0.3180671, 1.305629, 0.9372549, 0, 1, 1,
0.9472754, 0.3049788, 0.471438, 0.945098, 0, 1, 1,
0.9490138, 1.392002, -0.005903597, 0.9490196, 0, 1, 1,
0.9580984, -0.9605694, 3.627708, 0.9568627, 0, 1, 1,
0.9590936, 1.00105, 0.4399317, 0.9607843, 0, 1, 1,
0.9609707, -1.452683, 1.411289, 0.9686275, 0, 1, 1,
0.9646199, -0.468191, 2.284461, 0.972549, 0, 1, 1,
0.9681166, 0.3263592, 1.098643, 0.9803922, 0, 1, 1,
0.9759842, -0.6315225, 3.696189, 0.9843137, 0, 1, 1,
0.97736, 1.150464, 0.9607199, 0.9921569, 0, 1, 1,
0.9791492, 1.630582, 0.9001504, 0.9960784, 0, 1, 1,
0.9820688, 0.3614062, -1.44125, 1, 0, 0.9960784, 1,
0.9853776, 1.054064, 0.8612897, 1, 0, 0.9882353, 1,
0.9924442, -0.6137792, 2.334403, 1, 0, 0.9843137, 1,
0.9945597, 0.8964248, 2.563072, 1, 0, 0.9764706, 1,
0.9976886, 0.5643264, 3.742847, 1, 0, 0.972549, 1,
1.001603, 1.539191, -1.415598, 1, 0, 0.9647059, 1,
1.00261, 0.4829601, 1.163044, 1, 0, 0.9607843, 1,
1.005448, 1.495198, 1.595418, 1, 0, 0.9529412, 1,
1.008911, 0.3736954, 1.120613, 1, 0, 0.9490196, 1,
1.010026, 0.1706499, -0.1924527, 1, 0, 0.9411765, 1,
1.01054, -1.018513, 1.455838, 1, 0, 0.9372549, 1,
1.012227, 0.6998438, 0.136462, 1, 0, 0.9294118, 1,
1.015534, 1.840166, 2.15165, 1, 0, 0.9254902, 1,
1.019968, 0.8185539, 2.222275, 1, 0, 0.9176471, 1,
1.023579, -0.2749948, 2.629885, 1, 0, 0.9137255, 1,
1.024562, -0.9092196, 1.024944, 1, 0, 0.9058824, 1,
1.025358, -0.9916416, 3.223973, 1, 0, 0.9019608, 1,
1.02789, 0.3729748, 2.436974, 1, 0, 0.8941177, 1,
1.034377, 0.8003559, -0.7374033, 1, 0, 0.8862745, 1,
1.039916, 0.02334001, 1.710533, 1, 0, 0.8823529, 1,
1.043087, -0.2582571, 1.132026, 1, 0, 0.8745098, 1,
1.04994, 0.7146483, 1.689095, 1, 0, 0.8705882, 1,
1.052491, 0.09052458, 0.6436603, 1, 0, 0.8627451, 1,
1.058075, -1.051978, 3.176262, 1, 0, 0.8588235, 1,
1.0608, -0.3917069, 2.226812, 1, 0, 0.8509804, 1,
1.060964, -0.075187, 1.88773, 1, 0, 0.8470588, 1,
1.063578, -0.5048786, 0.7418118, 1, 0, 0.8392157, 1,
1.065429, -0.6516594, 1.867524, 1, 0, 0.8352941, 1,
1.072947, -0.8025606, 3.130774, 1, 0, 0.827451, 1,
1.077913, -0.4986819, 3.437121, 1, 0, 0.8235294, 1,
1.079522, 0.9220593, 0.3501279, 1, 0, 0.8156863, 1,
1.080372, 0.8916069, 0.3072967, 1, 0, 0.8117647, 1,
1.083635, 0.4628319, 1.947222, 1, 0, 0.8039216, 1,
1.090515, 1.167213, -0.2625104, 1, 0, 0.7960784, 1,
1.092912, -0.4582183, 0.9737769, 1, 0, 0.7921569, 1,
1.098557, -0.009997687, 1.317258, 1, 0, 0.7843137, 1,
1.112464, -1.568455, 2.286729, 1, 0, 0.7803922, 1,
1.115717, -0.5830216, 1.99933, 1, 0, 0.772549, 1,
1.1171, -0.4531122, -0.03655997, 1, 0, 0.7686275, 1,
1.119365, -1.06029, 1.058873, 1, 0, 0.7607843, 1,
1.126539, -0.8474782, 1.166545, 1, 0, 0.7568628, 1,
1.127975, -0.1181346, 0.8126409, 1, 0, 0.7490196, 1,
1.133663, -1.790855, 2.806896, 1, 0, 0.7450981, 1,
1.13545, -0.6682345, 0.7575137, 1, 0, 0.7372549, 1,
1.137009, 0.6815941, 0.9832992, 1, 0, 0.7333333, 1,
1.155071, 0.5459361, 0.8110342, 1, 0, 0.7254902, 1,
1.158878, 1.023971, 1.950304, 1, 0, 0.7215686, 1,
1.168284, 1.166527, 0.5729841, 1, 0, 0.7137255, 1,
1.169192, 0.7252057, 1.948427, 1, 0, 0.7098039, 1,
1.198471, -0.2456167, -0.1693768, 1, 0, 0.7019608, 1,
1.198506, 1.266883, 3.553346, 1, 0, 0.6941177, 1,
1.208552, 0.5799919, 2.400644, 1, 0, 0.6901961, 1,
1.21243, -0.8214473, 4.668551, 1, 0, 0.682353, 1,
1.219053, 0.3066345, 1.818286, 1, 0, 0.6784314, 1,
1.225192, 0.2752897, 1.010219, 1, 0, 0.6705883, 1,
1.229629, -2.316915, 0.7195898, 1, 0, 0.6666667, 1,
1.242967, 1.374471, 0.1540776, 1, 0, 0.6588235, 1,
1.246395, -0.310306, 2.338968, 1, 0, 0.654902, 1,
1.249738, 1.050952, 1.927312, 1, 0, 0.6470588, 1,
1.250368, -1.242435, 3.824361, 1, 0, 0.6431373, 1,
1.256641, -0.4692607, 1.120491, 1, 0, 0.6352941, 1,
1.260389, 0.4054698, 0.304937, 1, 0, 0.6313726, 1,
1.261221, -0.380589, 2.35178, 1, 0, 0.6235294, 1,
1.27175, -1.566085, 2.996616, 1, 0, 0.6196079, 1,
1.273646, -0.5382667, 1.263517, 1, 0, 0.6117647, 1,
1.276695, -0.3063943, 0.671722, 1, 0, 0.6078432, 1,
1.282544, 2.577961, -0.9157175, 1, 0, 0.6, 1,
1.288309, -1.331318, 3.994595, 1, 0, 0.5921569, 1,
1.290084, 0.2048452, 1.175606, 1, 0, 0.5882353, 1,
1.29146, -1.262871, 1.66461, 1, 0, 0.5803922, 1,
1.304007, 1.080627, 0.7670403, 1, 0, 0.5764706, 1,
1.305061, -0.5199407, 2.057622, 1, 0, 0.5686275, 1,
1.30888, 0.6948076, 1.335114, 1, 0, 0.5647059, 1,
1.309148, 0.7885161, 0.9917953, 1, 0, 0.5568628, 1,
1.31193, -0.3340596, 0.8392224, 1, 0, 0.5529412, 1,
1.323156, -0.2987293, 1.93538, 1, 0, 0.5450981, 1,
1.323526, 1.261216, -0.4034258, 1, 0, 0.5411765, 1,
1.32669, -0.3162676, -0.3170621, 1, 0, 0.5333334, 1,
1.332824, -3.314824, 2.425725, 1, 0, 0.5294118, 1,
1.337872, -0.1186329, 2.868973, 1, 0, 0.5215687, 1,
1.345382, 0.8946716, 0.6570941, 1, 0, 0.5176471, 1,
1.347715, 1.232404, -0.729861, 1, 0, 0.509804, 1,
1.351184, -0.5854753, 0.9122083, 1, 0, 0.5058824, 1,
1.35289, -0.3126805, 2.118806, 1, 0, 0.4980392, 1,
1.360827, 0.4466294, 2.693974, 1, 0, 0.4901961, 1,
1.361843, 0.5272252, 2.563607, 1, 0, 0.4862745, 1,
1.362015, -0.1564027, 1.942515, 1, 0, 0.4784314, 1,
1.374243, -0.2734449, 2.549102, 1, 0, 0.4745098, 1,
1.376912, 0.7434718, 0.1749734, 1, 0, 0.4666667, 1,
1.376951, -1.918363, 2.10743, 1, 0, 0.4627451, 1,
1.38172, 0.9139911, 1.975763, 1, 0, 0.454902, 1,
1.387305, 0.1915684, 1.560686, 1, 0, 0.4509804, 1,
1.387841, 0.4218214, 1.449225, 1, 0, 0.4431373, 1,
1.396303, -0.2245691, 1.693879, 1, 0, 0.4392157, 1,
1.398835, -1.870811, 2.657547, 1, 0, 0.4313726, 1,
1.402272, -0.1137178, 0.5567197, 1, 0, 0.427451, 1,
1.402343, -0.6040031, 0.3833635, 1, 0, 0.4196078, 1,
1.405326, -0.7741498, 1.359333, 1, 0, 0.4156863, 1,
1.416592, 0.7697345, 1.63473, 1, 0, 0.4078431, 1,
1.417202, -0.6844934, 2.154183, 1, 0, 0.4039216, 1,
1.417902, -0.4697551, 1.705482, 1, 0, 0.3960784, 1,
1.423546, 1.885339, 1.737398, 1, 0, 0.3882353, 1,
1.442649, 0.6904919, 0.9648284, 1, 0, 0.3843137, 1,
1.443917, -1.875933, 4.26297, 1, 0, 0.3764706, 1,
1.462706, -0.7988775, 1.856539, 1, 0, 0.372549, 1,
1.467155, -2.019112, 3.040955, 1, 0, 0.3647059, 1,
1.474528, 1.518524, 1.049634, 1, 0, 0.3607843, 1,
1.475056, 2.496776, -0.1243397, 1, 0, 0.3529412, 1,
1.482107, 0.5134163, 1.608803, 1, 0, 0.3490196, 1,
1.494263, 0.1371095, 1.950608, 1, 0, 0.3411765, 1,
1.497606, -0.6431274, 1.162073, 1, 0, 0.3372549, 1,
1.499159, 1.217277, 1.565982, 1, 0, 0.3294118, 1,
1.504444, 1.692493, 0.1234015, 1, 0, 0.3254902, 1,
1.504941, -0.7554049, 1.563538, 1, 0, 0.3176471, 1,
1.506647, 0.7381977, -0.6473218, 1, 0, 0.3137255, 1,
1.528251, -0.09209832, 1.492237, 1, 0, 0.3058824, 1,
1.538844, 1.944084, 0.9381279, 1, 0, 0.2980392, 1,
1.540209, -0.1618407, 2.3365, 1, 0, 0.2941177, 1,
1.587437, 0.4435445, 0.6998686, 1, 0, 0.2862745, 1,
1.603582, 0.07367373, 3.504331, 1, 0, 0.282353, 1,
1.610254, 1.761131, 0.3024937, 1, 0, 0.2745098, 1,
1.634059, -0.4535587, 3.117952, 1, 0, 0.2705882, 1,
1.650731, 0.4230732, 0.8668135, 1, 0, 0.2627451, 1,
1.65707, -0.706128, 0.01531835, 1, 0, 0.2588235, 1,
1.686035, 0.2300337, 0.8383046, 1, 0, 0.2509804, 1,
1.695322, 0.5288844, 0.1843392, 1, 0, 0.2470588, 1,
1.720978, -0.9586413, 1.770222, 1, 0, 0.2392157, 1,
1.740534, -2.635744, 3.257693, 1, 0, 0.2352941, 1,
1.760526, -0.1395928, 1.074413, 1, 0, 0.227451, 1,
1.765014, 1.227776, 1.265473, 1, 0, 0.2235294, 1,
1.783885, 0.3109533, 1.595769, 1, 0, 0.2156863, 1,
1.807706, -0.4812491, 3.461879, 1, 0, 0.2117647, 1,
1.807951, -0.4335492, 1.01979, 1, 0, 0.2039216, 1,
1.810478, 0.6878843, 1.74039, 1, 0, 0.1960784, 1,
1.820194, -1.031839, 0.7467291, 1, 0, 0.1921569, 1,
1.827089, -0.3587134, 1.157146, 1, 0, 0.1843137, 1,
1.835444, -1.183352, 1.685186, 1, 0, 0.1803922, 1,
1.925504, 1.414459, 1.38915, 1, 0, 0.172549, 1,
1.933272, -1.315574, 0.7016336, 1, 0, 0.1686275, 1,
1.935191, -0.5275244, 1.57305, 1, 0, 0.1607843, 1,
1.939413, -1.318286, 3.612162, 1, 0, 0.1568628, 1,
1.939515, -1.643349, 3.178164, 1, 0, 0.1490196, 1,
1.95702, -1.596865, 1.466092, 1, 0, 0.145098, 1,
1.963216, 0.4403208, 1.404538, 1, 0, 0.1372549, 1,
2.003331, 1.615534, 1.381454, 1, 0, 0.1333333, 1,
2.070709, 0.6282618, 1.716199, 1, 0, 0.1254902, 1,
2.104011, -1.02382, 2.999019, 1, 0, 0.1215686, 1,
2.105479, -1.364012, -0.02337877, 1, 0, 0.1137255, 1,
2.234384, 1.669491, 0.7133488, 1, 0, 0.1098039, 1,
2.254622, 1.515608, 0.9148301, 1, 0, 0.1019608, 1,
2.282865, -0.1702737, 1.168216, 1, 0, 0.09411765, 1,
2.301953, 0.5186882, 2.035122, 1, 0, 0.09019608, 1,
2.309562, -0.1457462, 1.943489, 1, 0, 0.08235294, 1,
2.326328, 1.287482, 1.074563, 1, 0, 0.07843138, 1,
2.342033, -1.390536, 1.507335, 1, 0, 0.07058824, 1,
2.352246, -0.7829786, 1.636022, 1, 0, 0.06666667, 1,
2.383378, 0.8204026, 0.4819284, 1, 0, 0.05882353, 1,
2.418302, 0.7710475, 1.414508, 1, 0, 0.05490196, 1,
2.428195, 0.05558201, 0.2808051, 1, 0, 0.04705882, 1,
2.438857, 0.3082832, 1.853017, 1, 0, 0.04313726, 1,
2.469801, -0.6473992, 0.8036833, 1, 0, 0.03529412, 1,
2.537709, -0.6276104, 2.927917, 1, 0, 0.03137255, 1,
2.810546, -0.3978414, 2.525549, 1, 0, 0.02352941, 1,
2.859273, 0.1460177, 0.8434764, 1, 0, 0.01960784, 1,
2.96596, -0.7325795, 3.61503, 1, 0, 0.01176471, 1,
3.13287, -0.8586472, 0.4878879, 1, 0, 0.007843138, 1
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
-0.07856417, -4.551497, -8.117902, 0, -0.5, 0.5, 0.5,
-0.07856417, -4.551497, -8.117902, 1, -0.5, 0.5, 0.5,
-0.07856417, -4.551497, -8.117902, 1, 1.5, 0.5, 0.5,
-0.07856417, -4.551497, -8.117902, 0, 1.5, 0.5, 0.5
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
-4.378675, 0.01750541, -8.117902, 0, -0.5, 0.5, 0.5,
-4.378675, 0.01750541, -8.117902, 1, -0.5, 0.5, 0.5,
-4.378675, 0.01750541, -8.117902, 1, 1.5, 0.5, 0.5,
-4.378675, 0.01750541, -8.117902, 0, 1.5, 0.5, 0.5
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
-4.378675, -4.551497, -0.7034588, 0, -0.5, 0.5, 0.5,
-4.378675, -4.551497, -0.7034588, 1, -0.5, 0.5, 0.5,
-4.378675, -4.551497, -0.7034588, 1, 1.5, 0.5, 0.5,
-4.378675, -4.551497, -0.7034588, 0, 1.5, 0.5, 0.5
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
-3, -3.497111, -6.406877,
3, -3.497111, -6.406877,
-3, -3.497111, -6.406877,
-3, -3.672842, -6.692047,
-2, -3.497111, -6.406877,
-2, -3.672842, -6.692047,
-1, -3.497111, -6.406877,
-1, -3.672842, -6.692047,
0, -3.497111, -6.406877,
0, -3.672842, -6.692047,
1, -3.497111, -6.406877,
1, -3.672842, -6.692047,
2, -3.497111, -6.406877,
2, -3.672842, -6.692047,
3, -3.497111, -6.406877,
3, -3.672842, -6.692047
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
-3, -4.024304, -7.262389, 0, -0.5, 0.5, 0.5,
-3, -4.024304, -7.262389, 1, -0.5, 0.5, 0.5,
-3, -4.024304, -7.262389, 1, 1.5, 0.5, 0.5,
-3, -4.024304, -7.262389, 0, 1.5, 0.5, 0.5,
-2, -4.024304, -7.262389, 0, -0.5, 0.5, 0.5,
-2, -4.024304, -7.262389, 1, -0.5, 0.5, 0.5,
-2, -4.024304, -7.262389, 1, 1.5, 0.5, 0.5,
-2, -4.024304, -7.262389, 0, 1.5, 0.5, 0.5,
-1, -4.024304, -7.262389, 0, -0.5, 0.5, 0.5,
-1, -4.024304, -7.262389, 1, -0.5, 0.5, 0.5,
-1, -4.024304, -7.262389, 1, 1.5, 0.5, 0.5,
-1, -4.024304, -7.262389, 0, 1.5, 0.5, 0.5,
0, -4.024304, -7.262389, 0, -0.5, 0.5, 0.5,
0, -4.024304, -7.262389, 1, -0.5, 0.5, 0.5,
0, -4.024304, -7.262389, 1, 1.5, 0.5, 0.5,
0, -4.024304, -7.262389, 0, 1.5, 0.5, 0.5,
1, -4.024304, -7.262389, 0, -0.5, 0.5, 0.5,
1, -4.024304, -7.262389, 1, -0.5, 0.5, 0.5,
1, -4.024304, -7.262389, 1, 1.5, 0.5, 0.5,
1, -4.024304, -7.262389, 0, 1.5, 0.5, 0.5,
2, -4.024304, -7.262389, 0, -0.5, 0.5, 0.5,
2, -4.024304, -7.262389, 1, -0.5, 0.5, 0.5,
2, -4.024304, -7.262389, 1, 1.5, 0.5, 0.5,
2, -4.024304, -7.262389, 0, 1.5, 0.5, 0.5,
3, -4.024304, -7.262389, 0, -0.5, 0.5, 0.5,
3, -4.024304, -7.262389, 1, -0.5, 0.5, 0.5,
3, -4.024304, -7.262389, 1, 1.5, 0.5, 0.5,
3, -4.024304, -7.262389, 0, 1.5, 0.5, 0.5
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
-3.386342, -3, -6.406877,
-3.386342, 3, -6.406877,
-3.386342, -3, -6.406877,
-3.55173, -3, -6.692047,
-3.386342, -2, -6.406877,
-3.55173, -2, -6.692047,
-3.386342, -1, -6.406877,
-3.55173, -1, -6.692047,
-3.386342, 0, -6.406877,
-3.55173, 0, -6.692047,
-3.386342, 1, -6.406877,
-3.55173, 1, -6.692047,
-3.386342, 2, -6.406877,
-3.55173, 2, -6.692047,
-3.386342, 3, -6.406877,
-3.55173, 3, -6.692047
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
-3.882508, -3, -7.262389, 0, -0.5, 0.5, 0.5,
-3.882508, -3, -7.262389, 1, -0.5, 0.5, 0.5,
-3.882508, -3, -7.262389, 1, 1.5, 0.5, 0.5,
-3.882508, -3, -7.262389, 0, 1.5, 0.5, 0.5,
-3.882508, -2, -7.262389, 0, -0.5, 0.5, 0.5,
-3.882508, -2, -7.262389, 1, -0.5, 0.5, 0.5,
-3.882508, -2, -7.262389, 1, 1.5, 0.5, 0.5,
-3.882508, -2, -7.262389, 0, 1.5, 0.5, 0.5,
-3.882508, -1, -7.262389, 0, -0.5, 0.5, 0.5,
-3.882508, -1, -7.262389, 1, -0.5, 0.5, 0.5,
-3.882508, -1, -7.262389, 1, 1.5, 0.5, 0.5,
-3.882508, -1, -7.262389, 0, 1.5, 0.5, 0.5,
-3.882508, 0, -7.262389, 0, -0.5, 0.5, 0.5,
-3.882508, 0, -7.262389, 1, -0.5, 0.5, 0.5,
-3.882508, 0, -7.262389, 1, 1.5, 0.5, 0.5,
-3.882508, 0, -7.262389, 0, 1.5, 0.5, 0.5,
-3.882508, 1, -7.262389, 0, -0.5, 0.5, 0.5,
-3.882508, 1, -7.262389, 1, -0.5, 0.5, 0.5,
-3.882508, 1, -7.262389, 1, 1.5, 0.5, 0.5,
-3.882508, 1, -7.262389, 0, 1.5, 0.5, 0.5,
-3.882508, 2, -7.262389, 0, -0.5, 0.5, 0.5,
-3.882508, 2, -7.262389, 1, -0.5, 0.5, 0.5,
-3.882508, 2, -7.262389, 1, 1.5, 0.5, 0.5,
-3.882508, 2, -7.262389, 0, 1.5, 0.5, 0.5,
-3.882508, 3, -7.262389, 0, -0.5, 0.5, 0.5,
-3.882508, 3, -7.262389, 1, -0.5, 0.5, 0.5,
-3.882508, 3, -7.262389, 1, 1.5, 0.5, 0.5,
-3.882508, 3, -7.262389, 0, 1.5, 0.5, 0.5
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
-3.386342, -3.497111, -6,
-3.386342, -3.497111, 4,
-3.386342, -3.497111, -6,
-3.55173, -3.672842, -6,
-3.386342, -3.497111, -4,
-3.55173, -3.672842, -4,
-3.386342, -3.497111, -2,
-3.55173, -3.672842, -2,
-3.386342, -3.497111, 0,
-3.55173, -3.672842, 0,
-3.386342, -3.497111, 2,
-3.55173, -3.672842, 2,
-3.386342, -3.497111, 4,
-3.55173, -3.672842, 4
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
-3.882508, -4.024304, -6, 0, -0.5, 0.5, 0.5,
-3.882508, -4.024304, -6, 1, -0.5, 0.5, 0.5,
-3.882508, -4.024304, -6, 1, 1.5, 0.5, 0.5,
-3.882508, -4.024304, -6, 0, 1.5, 0.5, 0.5,
-3.882508, -4.024304, -4, 0, -0.5, 0.5, 0.5,
-3.882508, -4.024304, -4, 1, -0.5, 0.5, 0.5,
-3.882508, -4.024304, -4, 1, 1.5, 0.5, 0.5,
-3.882508, -4.024304, -4, 0, 1.5, 0.5, 0.5,
-3.882508, -4.024304, -2, 0, -0.5, 0.5, 0.5,
-3.882508, -4.024304, -2, 1, -0.5, 0.5, 0.5,
-3.882508, -4.024304, -2, 1, 1.5, 0.5, 0.5,
-3.882508, -4.024304, -2, 0, 1.5, 0.5, 0.5,
-3.882508, -4.024304, 0, 0, -0.5, 0.5, 0.5,
-3.882508, -4.024304, 0, 1, -0.5, 0.5, 0.5,
-3.882508, -4.024304, 0, 1, 1.5, 0.5, 0.5,
-3.882508, -4.024304, 0, 0, 1.5, 0.5, 0.5,
-3.882508, -4.024304, 2, 0, -0.5, 0.5, 0.5,
-3.882508, -4.024304, 2, 1, -0.5, 0.5, 0.5,
-3.882508, -4.024304, 2, 1, 1.5, 0.5, 0.5,
-3.882508, -4.024304, 2, 0, 1.5, 0.5, 0.5,
-3.882508, -4.024304, 4, 0, -0.5, 0.5, 0.5,
-3.882508, -4.024304, 4, 1, -0.5, 0.5, 0.5,
-3.882508, -4.024304, 4, 1, 1.5, 0.5, 0.5,
-3.882508, -4.024304, 4, 0, 1.5, 0.5, 0.5
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
-3.386342, -3.497111, -6.406877,
-3.386342, 3.532122, -6.406877,
-3.386342, -3.497111, 4.999959,
-3.386342, 3.532122, 4.999959,
-3.386342, -3.497111, -6.406877,
-3.386342, -3.497111, 4.999959,
-3.386342, 3.532122, -6.406877,
-3.386342, 3.532122, 4.999959,
-3.386342, -3.497111, -6.406877,
3.229213, -3.497111, -6.406877,
-3.386342, -3.497111, 4.999959,
3.229213, -3.497111, 4.999959,
-3.386342, 3.532122, -6.406877,
3.229213, 3.532122, -6.406877,
-3.386342, 3.532122, 4.999959,
3.229213, 3.532122, 4.999959,
3.229213, -3.497111, -6.406877,
3.229213, 3.532122, -6.406877,
3.229213, -3.497111, 4.999959,
3.229213, 3.532122, 4.999959,
3.229213, -3.497111, -6.406877,
3.229213, -3.497111, 4.999959,
3.229213, 3.532122, -6.406877,
3.229213, 3.532122, 4.999959
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
var radius = 7.979242;
var distance = 35.50055;
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
mvMatrix.translate( 0.07856417, -0.01750541, 0.7034588 );
mvMatrix.scale( 1.304095, 1.227348, 0.7563283 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.50055);
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
Biphenylol<-read.table("Biphenylol.xyz", skip=1)
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
-3.289999, -1.163048, -2.126599, 0, 0, 1, 1, 1,
-3.150563, 0.1645234, -2.447469, 1, 0, 0, 1, 1,
-3.083061, 0.734818, -0.9566918, 1, 0, 0, 1, 1,
-2.970362, 0.3993397, -0.6547166, 1, 0, 0, 1, 1,
-2.872386, -0.2525329, -2.476738, 1, 0, 0, 1, 1,
-2.629916, -1.309674, -1.860837, 1, 0, 0, 1, 1,
-2.457484, 0.7872191, -0.3193511, 0, 0, 0, 1, 1,
-2.429764, 0.04074984, 0.505551, 0, 0, 0, 1, 1,
-2.403537, -0.2317154, -2.13709, 0, 0, 0, 1, 1,
-2.292956, 0.1035276, -0.9975937, 0, 0, 0, 1, 1,
-2.283773, 0.1498703, -2.354046, 0, 0, 0, 1, 1,
-2.20103, 1.373524, -1.641223, 0, 0, 0, 1, 1,
-2.17641, -1.019644, -3.572355, 0, 0, 0, 1, 1,
-2.148911, 0.4654909, -1.52726, 1, 1, 1, 1, 1,
-2.130941, -0.1045845, -0.6941851, 1, 1, 1, 1, 1,
-2.121247, 0.05882854, -0.987804, 1, 1, 1, 1, 1,
-2.108271, 1.013667, -0.1647394, 1, 1, 1, 1, 1,
-2.102829, -1.405067, -1.900816, 1, 1, 1, 1, 1,
-2.096345, 0.2998356, -1.585296, 1, 1, 1, 1, 1,
-2.095685, -0.1472658, 0.247673, 1, 1, 1, 1, 1,
-2.052461, -0.4573923, -1.601637, 1, 1, 1, 1, 1,
-2.029649, 0.6203967, -0.2245792, 1, 1, 1, 1, 1,
-2.027817, -0.9264358, -4.719398, 1, 1, 1, 1, 1,
-2.015977, 0.8758782, -1.690606, 1, 1, 1, 1, 1,
-2.013156, 1.347299, -1.386686, 1, 1, 1, 1, 1,
-2.012252, 0.1090767, -2.713528, 1, 1, 1, 1, 1,
-1.994531, -1.360668, -2.796287, 1, 1, 1, 1, 1,
-1.979464, -0.1800978, -2.006208, 1, 1, 1, 1, 1,
-1.973223, 0.9205505, -0.9704379, 0, 0, 1, 1, 1,
-1.966523, -0.8228149, -2.137994, 1, 0, 0, 1, 1,
-1.954665, -1.008541, -2.834371, 1, 0, 0, 1, 1,
-1.951514, -0.1494887, -1.094223, 1, 0, 0, 1, 1,
-1.945795, -0.413994, -2.591907, 1, 0, 0, 1, 1,
-1.93757, -0.05876286, -1.407506, 1, 0, 0, 1, 1,
-1.93756, 1.040662, -0.2131151, 0, 0, 0, 1, 1,
-1.935991, -0.3506734, 0.2218303, 0, 0, 0, 1, 1,
-1.908566, 0.9972671, -0.5056895, 0, 0, 0, 1, 1,
-1.868187, -0.5423701, -3.067722, 0, 0, 0, 1, 1,
-1.789788, -0.4663202, -0.5795094, 0, 0, 0, 1, 1,
-1.770222, 0.3679635, -1.391218, 0, 0, 0, 1, 1,
-1.715932, 0.2010216, -1.219236, 0, 0, 0, 1, 1,
-1.699216, -0.1244279, -1.057861, 1, 1, 1, 1, 1,
-1.670135, -0.5066941, -1.383989, 1, 1, 1, 1, 1,
-1.662026, -1.21126, -1.694982, 1, 1, 1, 1, 1,
-1.657199, -0.05814718, -0.4174387, 1, 1, 1, 1, 1,
-1.656755, 2.143435, -1.545443, 1, 1, 1, 1, 1,
-1.638595, -0.06596754, -1.779644, 1, 1, 1, 1, 1,
-1.62723, -1.791641, -2.19666, 1, 1, 1, 1, 1,
-1.6241, 1.161582, 0.3415563, 1, 1, 1, 1, 1,
-1.608813, -0.001670928, -1.2781, 1, 1, 1, 1, 1,
-1.606122, -1.041223, -2.481746, 1, 1, 1, 1, 1,
-1.600887, -1.468384, -3.359914, 1, 1, 1, 1, 1,
-1.599446, -0.2514297, 0.2795727, 1, 1, 1, 1, 1,
-1.599432, -0.2668141, -2.866328, 1, 1, 1, 1, 1,
-1.594671, 1.465476, -1.215934, 1, 1, 1, 1, 1,
-1.591787, -0.9275095, -2.278246, 1, 1, 1, 1, 1,
-1.584996, -0.9251238, -1.612933, 0, 0, 1, 1, 1,
-1.573171, 0.2502138, -0.6727942, 1, 0, 0, 1, 1,
-1.558689, 0.1121379, -0.8508837, 1, 0, 0, 1, 1,
-1.551285, -0.5159698, -1.360413, 1, 0, 0, 1, 1,
-1.548873, 0.0952622, -2.202567, 1, 0, 0, 1, 1,
-1.545105, 0.3119358, -0.5828952, 1, 0, 0, 1, 1,
-1.539341, -1.640133, -2.619439, 0, 0, 0, 1, 1,
-1.537374, 0.5926644, -0.005512934, 0, 0, 0, 1, 1,
-1.533788, -0.9247066, -1.002278, 0, 0, 0, 1, 1,
-1.512813, -0.2391634, -1.444994, 0, 0, 0, 1, 1,
-1.511841, 0.8440181, -0.8382548, 0, 0, 0, 1, 1,
-1.511075, -0.2395577, -2.012659, 0, 0, 0, 1, 1,
-1.495418, 0.02067913, -2.068522, 0, 0, 0, 1, 1,
-1.493092, 0.4578646, -0.9660363, 1, 1, 1, 1, 1,
-1.484978, -0.7057716, -0.9190946, 1, 1, 1, 1, 1,
-1.482336, 0.778496, -1.861465, 1, 1, 1, 1, 1,
-1.48129, -0.431947, -2.921954, 1, 1, 1, 1, 1,
-1.477778, -1.536518, -0.8138025, 1, 1, 1, 1, 1,
-1.477472, 0.3938063, -2.743299, 1, 1, 1, 1, 1,
-1.475226, -1.02791, -1.217358, 1, 1, 1, 1, 1,
-1.469171, -0.5180398, -2.918192, 1, 1, 1, 1, 1,
-1.466633, 1.923309, 0.1738421, 1, 1, 1, 1, 1,
-1.462394, -0.6688511, -3.927469, 1, 1, 1, 1, 1,
-1.458322, 0.4626058, -1.417819, 1, 1, 1, 1, 1,
-1.458162, -1.935405, -0.6952015, 1, 1, 1, 1, 1,
-1.456334, -0.8945732, -0.7387816, 1, 1, 1, 1, 1,
-1.453008, -0.4258643, -0.3711705, 1, 1, 1, 1, 1,
-1.442079, -1.562218, -1.706088, 1, 1, 1, 1, 1,
-1.43933, 2.46249, -0.8263559, 0, 0, 1, 1, 1,
-1.438151, -1.053054, -0.2339619, 1, 0, 0, 1, 1,
-1.427379, -0.3920108, -1.876007, 1, 0, 0, 1, 1,
-1.424814, 1.573425, 0.4466414, 1, 0, 0, 1, 1,
-1.419684, 0.3956397, -0.7924396, 1, 0, 0, 1, 1,
-1.413013, 0.1965874, -1.747286, 1, 0, 0, 1, 1,
-1.399984, -0.2984776, -2.373027, 0, 0, 0, 1, 1,
-1.351402, 0.7715291, -1.064755, 0, 0, 0, 1, 1,
-1.340609, -0.07190935, -2.546428, 0, 0, 0, 1, 1,
-1.33062, 0.7883928, -0.213587, 0, 0, 0, 1, 1,
-1.329442, 1.017395, -0.5137014, 0, 0, 0, 1, 1,
-1.322187, -0.5767022, -0.922047, 0, 0, 0, 1, 1,
-1.313348, -0.1624302, -2.269831, 0, 0, 0, 1, 1,
-1.312558, 1.209047, -0.4619291, 1, 1, 1, 1, 1,
-1.310353, -0.5759929, -0.7652924, 1, 1, 1, 1, 1,
-1.307916, -0.7743973, -1.876781, 1, 1, 1, 1, 1,
-1.294267, -1.008151, -2.74323, 1, 1, 1, 1, 1,
-1.287691, -0.5777711, -1.20096, 1, 1, 1, 1, 1,
-1.285065, -0.365196, -1.133627, 1, 1, 1, 1, 1,
-1.278278, 3.429755, 0.5736234, 1, 1, 1, 1, 1,
-1.277735, -0.733878, -2.655657, 1, 1, 1, 1, 1,
-1.277596, 0.3300566, -1.028655, 1, 1, 1, 1, 1,
-1.275327, -0.2690398, -1.726414, 1, 1, 1, 1, 1,
-1.272272, 1.978863, -1.533333, 1, 1, 1, 1, 1,
-1.269816, -0.8625124, -2.75701, 1, 1, 1, 1, 1,
-1.258336, -0.4507505, -0.1587582, 1, 1, 1, 1, 1,
-1.24847, 1.168437, -0.808495, 1, 1, 1, 1, 1,
-1.246193, 1.594817, 1.102834, 1, 1, 1, 1, 1,
-1.232546, 1.356667, -1.00208, 0, 0, 1, 1, 1,
-1.230589, -0.7605734, -2.812637, 1, 0, 0, 1, 1,
-1.227113, 0.3473152, -2.19655, 1, 0, 0, 1, 1,
-1.225507, 0.6498697, -4.116264, 1, 0, 0, 1, 1,
-1.222141, 0.854728, -2.91863, 1, 0, 0, 1, 1,
-1.222016, 0.8953535, -1.698266, 1, 0, 0, 1, 1,
-1.213657, 1.714298, -0.3455743, 0, 0, 0, 1, 1,
-1.212212, 2.294537, -0.4070296, 0, 0, 0, 1, 1,
-1.207418, -0.1339143, -3.879041, 0, 0, 0, 1, 1,
-1.192773, 1.196616, -0.8275908, 0, 0, 0, 1, 1,
-1.188038, 0.5619717, -0.8610178, 0, 0, 0, 1, 1,
-1.180889, -1.165211, -2.474988, 0, 0, 0, 1, 1,
-1.172095, -0.06145235, -2.349784, 0, 0, 0, 1, 1,
-1.169964, -0.5707457, -3.555333, 1, 1, 1, 1, 1,
-1.163582, -1.124517, -3.343195, 1, 1, 1, 1, 1,
-1.161668, -1.33298, -3.320308, 1, 1, 1, 1, 1,
-1.142694, 0.1682377, -1.291534, 1, 1, 1, 1, 1,
-1.133935, 0.7504758, -0.9094161, 1, 1, 1, 1, 1,
-1.124498, 0.1488804, -1.549328, 1, 1, 1, 1, 1,
-1.122711, -0.5599895, -2.130687, 1, 1, 1, 1, 1,
-1.113842, -0.1031985, -0.9651634, 1, 1, 1, 1, 1,
-1.107883, -0.6534284, -0.6325808, 1, 1, 1, 1, 1,
-1.103692, 0.1438329, -1.865658, 1, 1, 1, 1, 1,
-1.102596, 1.717479, -1.436888, 1, 1, 1, 1, 1,
-1.094774, -0.5387475, -1.22957, 1, 1, 1, 1, 1,
-1.079762, 2.22788, -0.141076, 1, 1, 1, 1, 1,
-1.070599, -1.198769, -1.602415, 1, 1, 1, 1, 1,
-1.067826, 1.158221, -1.418043, 1, 1, 1, 1, 1,
-1.062769, -0.610135, -2.183814, 0, 0, 1, 1, 1,
-1.058417, -0.4158415, -2.548281, 1, 0, 0, 1, 1,
-1.046477, -0.3628637, -1.869654, 1, 0, 0, 1, 1,
-1.043501, 1.383649, -2.37274, 1, 0, 0, 1, 1,
-1.039652, -1.334216, -1.63679, 1, 0, 0, 1, 1,
-1.031933, 0.6805207, -1.322301, 1, 0, 0, 1, 1,
-1.031746, -0.2295272, -2.089068, 0, 0, 0, 1, 1,
-1.026212, 0.1002138, 0.01845218, 0, 0, 0, 1, 1,
-1.025683, -0.7784404, -2.244818, 0, 0, 0, 1, 1,
-1.024713, -0.01958744, -2.045827, 0, 0, 0, 1, 1,
-1.019471, 0.07464259, -2.113618, 0, 0, 0, 1, 1,
-1.019263, -1.530306, -0.6834705, 0, 0, 0, 1, 1,
-1.016084, 1.035628, -1.70773, 0, 0, 0, 1, 1,
-1.013321, 0.4713236, 0.2209793, 1, 1, 1, 1, 1,
-1.010597, -0.1957296, -0.8716208, 1, 1, 1, 1, 1,
-1.009421, 0.3551768, -0.9200056, 1, 1, 1, 1, 1,
-1.00901, -0.4999942, -0.3058695, 1, 1, 1, 1, 1,
-1.007199, 0.5056768, -1.18022, 1, 1, 1, 1, 1,
-1.00275, -0.2057589, -3.025978, 1, 1, 1, 1, 1,
-1.001537, -2.006245, -3.574686, 1, 1, 1, 1, 1,
-0.9974371, -0.6860704, -1.592839, 1, 1, 1, 1, 1,
-0.9944602, 0.8797609, -0.6804044, 1, 1, 1, 1, 1,
-0.9904494, 1.49512, -0.6577441, 1, 1, 1, 1, 1,
-0.9881878, -0.7224399, -2.576105, 1, 1, 1, 1, 1,
-0.9880226, -0.7668228, -2.52541, 1, 1, 1, 1, 1,
-0.9791512, -0.5634059, -0.8484724, 1, 1, 1, 1, 1,
-0.9756795, 0.5502625, -0.1942209, 1, 1, 1, 1, 1,
-0.9606745, 1.27333, -0.7807503, 1, 1, 1, 1, 1,
-0.9573944, 1.458543, -1.618786, 0, 0, 1, 1, 1,
-0.9548714, -2.558388, -1.682933, 1, 0, 0, 1, 1,
-0.954347, -1.555817, -2.361166, 1, 0, 0, 1, 1,
-0.95392, 1.365268, -0.6217464, 1, 0, 0, 1, 1,
-0.9535731, -0.5658877, -1.139029, 1, 0, 0, 1, 1,
-0.9437045, -1.484174, -2.477946, 1, 0, 0, 1, 1,
-0.9407281, -0.8214302, -2.068938, 0, 0, 0, 1, 1,
-0.9370267, -0.9943578, -1.985328, 0, 0, 0, 1, 1,
-0.9323964, -0.7159672, -3.374292, 0, 0, 0, 1, 1,
-0.9122031, 1.088713, -1.190406, 0, 0, 0, 1, 1,
-0.9078034, 0.9970247, -1.828017, 0, 0, 0, 1, 1,
-0.9069617, 1.629851, -1.908723, 0, 0, 0, 1, 1,
-0.9066504, -0.1160867, -2.458257, 0, 0, 0, 1, 1,
-0.900018, -1.200261, -3.342534, 1, 1, 1, 1, 1,
-0.8988478, -0.9632922, -2.000525, 1, 1, 1, 1, 1,
-0.8983001, 0.8845308, -1.737717, 1, 1, 1, 1, 1,
-0.8971009, -1.013174, -2.947891, 1, 1, 1, 1, 1,
-0.8960156, 1.169269, -1.14261, 1, 1, 1, 1, 1,
-0.8913499, -0.2990175, -0.08933332, 1, 1, 1, 1, 1,
-0.8866276, -1.060289, -2.662912, 1, 1, 1, 1, 1,
-0.8836614, 1.084503, 0.4005266, 1, 1, 1, 1, 1,
-0.8748772, 0.5294819, -0.2720993, 1, 1, 1, 1, 1,
-0.8745513, -2.147585, -2.161355, 1, 1, 1, 1, 1,
-0.8670647, 0.7812113, -0.3261389, 1, 1, 1, 1, 1,
-0.8657662, -0.07944562, -1.540923, 1, 1, 1, 1, 1,
-0.8610793, -0.09753133, 0.5194474, 1, 1, 1, 1, 1,
-0.8575234, 0.2233444, -0.1005221, 1, 1, 1, 1, 1,
-0.8557369, -2.132681, -1.257415, 1, 1, 1, 1, 1,
-0.8407427, -0.3986407, -1.604315, 0, 0, 1, 1, 1,
-0.8375018, 0.2680027, 0.1593628, 1, 0, 0, 1, 1,
-0.8340095, -0.364241, -1.404557, 1, 0, 0, 1, 1,
-0.8265599, 0.2918486, -1.705806, 1, 0, 0, 1, 1,
-0.8226824, 2.026996, -0.4887004, 1, 0, 0, 1, 1,
-0.8153784, -0.1348696, -2.021086, 1, 0, 0, 1, 1,
-0.8153645, 0.01546279, -1.241589, 0, 0, 0, 1, 1,
-0.8136194, 0.2100564, -3.116613, 0, 0, 0, 1, 1,
-0.8126038, -0.5052088, -2.477388, 0, 0, 0, 1, 1,
-0.8118983, 3.299302, -0.5784498, 0, 0, 0, 1, 1,
-0.8090253, -0.1815079, -0.8484697, 0, 0, 0, 1, 1,
-0.8047851, -0.8604633, -1.954057, 0, 0, 0, 1, 1,
-0.8016585, -0.7348098, -0.9278455, 0, 0, 0, 1, 1,
-0.7990283, 0.8022414, -0.9776236, 1, 1, 1, 1, 1,
-0.7954003, 0.9942891, -1.295872, 1, 1, 1, 1, 1,
-0.7943851, 0.158125, -0.8790313, 1, 1, 1, 1, 1,
-0.7937083, 1.562904, -2.462844, 1, 1, 1, 1, 1,
-0.7863869, -1.892018, -4.328997, 1, 1, 1, 1, 1,
-0.7824339, 0.2556924, 0.01689934, 1, 1, 1, 1, 1,
-0.7811555, -0.1581474, -2.151944, 1, 1, 1, 1, 1,
-0.7800763, -0.2406539, -0.8641356, 1, 1, 1, 1, 1,
-0.7789984, -0.3467105, 0.0815715, 1, 1, 1, 1, 1,
-0.7616769, 1.320001, -0.4344589, 1, 1, 1, 1, 1,
-0.7599257, -1.549854, -2.565522, 1, 1, 1, 1, 1,
-0.7457366, 0.182543, -1.894341, 1, 1, 1, 1, 1,
-0.7427421, 0.8472376, -1.350542, 1, 1, 1, 1, 1,
-0.7418844, -0.5244417, -3.864127, 1, 1, 1, 1, 1,
-0.7392507, -1.373061, -2.384855, 1, 1, 1, 1, 1,
-0.7385675, 1.650639, 0.4973925, 0, 0, 1, 1, 1,
-0.7380761, 0.9452962, -0.4071878, 1, 0, 0, 1, 1,
-0.737233, 0.4615919, 0.4052199, 1, 0, 0, 1, 1,
-0.7363913, -1.1875, -1.782553, 1, 0, 0, 1, 1,
-0.7338595, -1.829683, -3.435524, 1, 0, 0, 1, 1,
-0.7245833, -1.212847, -3.451677, 1, 0, 0, 1, 1,
-0.7183234, 0.3027166, -1.723399, 0, 0, 0, 1, 1,
-0.71585, -1.040305, -1.616607, 0, 0, 0, 1, 1,
-0.7117985, -1.057427, -0.812857, 0, 0, 0, 1, 1,
-0.7112758, 0.7750434, -0.9060137, 0, 0, 0, 1, 1,
-0.7088094, -0.2873558, -3.270386, 0, 0, 0, 1, 1,
-0.7053624, -0.3792943, -1.836238, 0, 0, 0, 1, 1,
-0.7051237, 0.6491843, 0.1204799, 0, 0, 0, 1, 1,
-0.6943995, 0.4605074, -1.9555, 1, 1, 1, 1, 1,
-0.6922874, -0.7186148, -2.012048, 1, 1, 1, 1, 1,
-0.6919417, 0.7764265, -0.2365341, 1, 1, 1, 1, 1,
-0.6903509, 1.111575, -0.5810088, 1, 1, 1, 1, 1,
-0.6815042, -0.3570454, -1.838728, 1, 1, 1, 1, 1,
-0.6811835, 0.5624287, -1.773247, 1, 1, 1, 1, 1,
-0.6788895, -2.846287, -2.634921, 1, 1, 1, 1, 1,
-0.6750518, -0.04950298, -3.464038, 1, 1, 1, 1, 1,
-0.6739524, 1.520149, 0.2314303, 1, 1, 1, 1, 1,
-0.6717101, -0.4674093, -1.646294, 1, 1, 1, 1, 1,
-0.6620262, 0.5621067, -1.208154, 1, 1, 1, 1, 1,
-0.6614171, 0.9834221, 1.33829, 1, 1, 1, 1, 1,
-0.6535839, 1.87829, -0.3750232, 1, 1, 1, 1, 1,
-0.6530585, -0.3946259, -0.4548861, 1, 1, 1, 1, 1,
-0.6526603, -0.9270602, -3.108011, 1, 1, 1, 1, 1,
-0.6495025, 1.125053, -0.8857477, 0, 0, 1, 1, 1,
-0.6451598, -0.3831661, -3.018892, 1, 0, 0, 1, 1,
-0.6441143, -0.3436185, -2.524524, 1, 0, 0, 1, 1,
-0.6422179, 0.2859079, -1.735306, 1, 0, 0, 1, 1,
-0.6358532, -1.205765, -3.628028, 1, 0, 0, 1, 1,
-0.6354524, -0.5677445, -3.604301, 1, 0, 0, 1, 1,
-0.6343319, 2.213311, 2.153604, 0, 0, 0, 1, 1,
-0.6342247, -0.4925036, -2.311077, 0, 0, 0, 1, 1,
-0.6300302, 0.06093598, -1.389668, 0, 0, 0, 1, 1,
-0.6274543, -0.3377338, -1.605885, 0, 0, 0, 1, 1,
-0.6270303, 0.7141708, -1.042928, 0, 0, 0, 1, 1,
-0.6257433, 0.2668399, -0.9247541, 0, 0, 0, 1, 1,
-0.6237931, -0.1834367, -2.914433, 0, 0, 0, 1, 1,
-0.6171641, 0.9974399, -0.7710156, 1, 1, 1, 1, 1,
-0.61594, 1.024423, 1.052173, 1, 1, 1, 1, 1,
-0.6144984, -0.2216504, -2.784431, 1, 1, 1, 1, 1,
-0.6132237, 0.3768755, -1.125124, 1, 1, 1, 1, 1,
-0.6120991, -0.1248569, -2.133362, 1, 1, 1, 1, 1,
-0.6116185, -1.887343, -3.323912, 1, 1, 1, 1, 1,
-0.607739, 1.376397, -0.2750821, 1, 1, 1, 1, 1,
-0.6031821, -1.064339, -3.482478, 1, 1, 1, 1, 1,
-0.6016573, 0.1423386, 0.2502691, 1, 1, 1, 1, 1,
-0.59899, -1.218042, -2.083735, 1, 1, 1, 1, 1,
-0.5981038, -0.1177172, -0.391555, 1, 1, 1, 1, 1,
-0.5908497, -0.5009981, -1.095417, 1, 1, 1, 1, 1,
-0.5904811, 0.3216885, -1.218182, 1, 1, 1, 1, 1,
-0.5892873, -1.782738, -1.689876, 1, 1, 1, 1, 1,
-0.5871961, -0.06759407, -2.05144, 1, 1, 1, 1, 1,
-0.5819311, 0.05472811, -1.60714, 0, 0, 1, 1, 1,
-0.5811874, -0.9879026, -2.593753, 1, 0, 0, 1, 1,
-0.5745844, 0.8219455, -2.26332, 1, 0, 0, 1, 1,
-0.5737641, 0.9159393, -1.578051, 1, 0, 0, 1, 1,
-0.5730047, -0.5582352, -2.387657, 1, 0, 0, 1, 1,
-0.57269, 0.2795734, -0.5510807, 1, 0, 0, 1, 1,
-0.5678499, 0.8757827, -2.678257, 0, 0, 0, 1, 1,
-0.5653805, 0.388086, 0.5221341, 0, 0, 0, 1, 1,
-0.5637519, 0.3239615, -1.204624, 0, 0, 0, 1, 1,
-0.563301, -0.5761148, -4.204198, 0, 0, 0, 1, 1,
-0.5614477, 1.188242, -1.884327, 0, 0, 0, 1, 1,
-0.5585313, 1.884622, 1.513733, 0, 0, 0, 1, 1,
-0.5576139, -0.7732177, -3.010681, 0, 0, 0, 1, 1,
-0.5537311, -1.079854, -2.211096, 1, 1, 1, 1, 1,
-0.5507265, 0.390964, 0.2704671, 1, 1, 1, 1, 1,
-0.55064, 1.567329, 0.2425598, 1, 1, 1, 1, 1,
-0.5461817, -0.1568257, -0.4376446, 1, 1, 1, 1, 1,
-0.5440424, -0.6162961, -1.861191, 1, 1, 1, 1, 1,
-0.5376511, -0.6990302, -3.123441, 1, 1, 1, 1, 1,
-0.5356279, -1.671702, -3.665827, 1, 1, 1, 1, 1,
-0.534627, -0.3567311, -3.167251, 1, 1, 1, 1, 1,
-0.5304889, 1.668424, -1.238889, 1, 1, 1, 1, 1,
-0.5294523, 1.247947, -2.610066, 1, 1, 1, 1, 1,
-0.5263746, -0.238248, -1.584264, 1, 1, 1, 1, 1,
-0.5154155, -0.9349102, -1.826919, 1, 1, 1, 1, 1,
-0.5141008, 1.0306, 0.1587319, 1, 1, 1, 1, 1,
-0.5035437, -0.7640503, -2.527505, 1, 1, 1, 1, 1,
-0.5030445, -1.125749, -2.533011, 1, 1, 1, 1, 1,
-0.5020668, -1.000631, -1.863572, 0, 0, 1, 1, 1,
-0.5010803, -0.4012433, -2.277878, 1, 0, 0, 1, 1,
-0.4939095, -1.133623, -3.649743, 1, 0, 0, 1, 1,
-0.4923794, -0.9724329, 0.1907999, 1, 0, 0, 1, 1,
-0.4904829, 2.138071, 1.0365, 1, 0, 0, 1, 1,
-0.4885986, 0.9126579, -1.490835, 1, 0, 0, 1, 1,
-0.4852629, -1.823625, -3.000514, 0, 0, 0, 1, 1,
-0.4829889, -1.419898, -2.110801, 0, 0, 0, 1, 1,
-0.482424, 0.08399782, -2.118315, 0, 0, 0, 1, 1,
-0.4804428, -0.2328244, -2.096586, 0, 0, 0, 1, 1,
-0.4795394, -0.1857285, -2.951314, 0, 0, 0, 1, 1,
-0.468024, -0.9186806, -1.344863, 0, 0, 0, 1, 1,
-0.466224, 0.4147466, 0.5425022, 0, 0, 0, 1, 1,
-0.4660784, 0.4528946, -2.652368, 1, 1, 1, 1, 1,
-0.4634595, -0.4851731, -2.457973, 1, 1, 1, 1, 1,
-0.4607744, -0.09916754, -1.715755, 1, 1, 1, 1, 1,
-0.4607143, 1.358728, 0.4932599, 1, 1, 1, 1, 1,
-0.456926, -0.2678386, -2.456006, 1, 1, 1, 1, 1,
-0.4569131, -0.7675979, -0.5217018, 1, 1, 1, 1, 1,
-0.4535656, 0.4535486, -1.980353, 1, 1, 1, 1, 1,
-0.4531174, 1.543963, -0.2557641, 1, 1, 1, 1, 1,
-0.4504208, -2.204919, -2.935281, 1, 1, 1, 1, 1,
-0.4400651, 0.1098776, -0.6752661, 1, 1, 1, 1, 1,
-0.4392057, 2.041824, -0.5461369, 1, 1, 1, 1, 1,
-0.43749, -0.6354283, -4.822001, 1, 1, 1, 1, 1,
-0.4321694, -2.665345, -2.788864, 1, 1, 1, 1, 1,
-0.42974, -0.2466165, -1.287781, 1, 1, 1, 1, 1,
-0.4267193, 0.6938444, -1.280592, 1, 1, 1, 1, 1,
-0.4262764, -0.3016821, -1.379093, 0, 0, 1, 1, 1,
-0.4161986, -0.522875, -1.151828, 1, 0, 0, 1, 1,
-0.4141428, -0.5847651, -3.476765, 1, 0, 0, 1, 1,
-0.4127532, -0.8087865, -1.663481, 1, 0, 0, 1, 1,
-0.4062012, -0.6076861, -0.2968121, 1, 0, 0, 1, 1,
-0.4025539, 0.1324208, -3.385979, 1, 0, 0, 1, 1,
-0.4017431, 0.2524458, -1.131091, 0, 0, 0, 1, 1,
-0.4008157, -0.5019404, -2.129955, 0, 0, 0, 1, 1,
-0.4007159, 0.9139596, -1.568457, 0, 0, 0, 1, 1,
-0.3983833, -1.162383, -1.811057, 0, 0, 0, 1, 1,
-0.3943823, 0.6289333, -2.148239, 0, 0, 0, 1, 1,
-0.3908861, -0.4062523, -2.083752, 0, 0, 0, 1, 1,
-0.3896192, -2.957378, -3.319139, 0, 0, 0, 1, 1,
-0.3873066, -0.127866, -1.387773, 1, 1, 1, 1, 1,
-0.3841024, -1.352545, -1.010949, 1, 1, 1, 1, 1,
-0.3792312, -2.299067, -3.949252, 1, 1, 1, 1, 1,
-0.3780632, -0.1154793, -2.595033, 1, 1, 1, 1, 1,
-0.3771277, -1.649597, -1.917433, 1, 1, 1, 1, 1,
-0.3758456, 0.01133746, -1.766235, 1, 1, 1, 1, 1,
-0.3747346, -0.8623201, -3.618899, 1, 1, 1, 1, 1,
-0.3608321, -0.9066762, -1.517544, 1, 1, 1, 1, 1,
-0.3603141, 0.1063421, -1.559991, 1, 1, 1, 1, 1,
-0.3595131, -1.303978, -2.649086, 1, 1, 1, 1, 1,
-0.3572638, 0.3009125, -1.230301, 1, 1, 1, 1, 1,
-0.3567567, 1.185995, -0.618239, 1, 1, 1, 1, 1,
-0.3566098, 0.5425196, 0.1612128, 1, 1, 1, 1, 1,
-0.3539554, -0.9692516, -1.624749, 1, 1, 1, 1, 1,
-0.3506801, -1.082691, -1.747425, 1, 1, 1, 1, 1,
-0.3495727, -1.387081, -2.488081, 0, 0, 1, 1, 1,
-0.3367223, -0.4999354, -1.650379, 1, 0, 0, 1, 1,
-0.336713, 0.3443599, -1.217625, 1, 0, 0, 1, 1,
-0.33652, -0.8741556, -3.94685, 1, 0, 0, 1, 1,
-0.3290042, 1.248715, 0.3296627, 1, 0, 0, 1, 1,
-0.3275389, -0.5600299, -1.8738, 1, 0, 0, 1, 1,
-0.3273791, 1.160954, -0.381769, 0, 0, 0, 1, 1,
-0.3270337, 2.230456, 0.745132, 0, 0, 0, 1, 1,
-0.3267387, 0.4326192, -0.2317546, 0, 0, 0, 1, 1,
-0.3266147, 0.1062166, -2.070553, 0, 0, 0, 1, 1,
-0.3258461, -0.002419144, -0.5915607, 0, 0, 0, 1, 1,
-0.3256364, -0.2204529, -1.863124, 0, 0, 0, 1, 1,
-0.3222905, 1.710526, 0.1595968, 0, 0, 0, 1, 1,
-0.3188861, 0.293051, -1.888401, 1, 1, 1, 1, 1,
-0.3186338, -1.315876, -2.310174, 1, 1, 1, 1, 1,
-0.316069, -2.222335, -3.149168, 1, 1, 1, 1, 1,
-0.3159812, -1.647352, -3.574968, 1, 1, 1, 1, 1,
-0.3143143, 1.336668, 0.1612335, 1, 1, 1, 1, 1,
-0.3113949, -0.6980982, -2.75605, 1, 1, 1, 1, 1,
-0.3053887, 0.9376914, -1.356446, 1, 1, 1, 1, 1,
-0.3033148, -1.264728, -2.358381, 1, 1, 1, 1, 1,
-0.3014134, 0.2605797, -0.1514848, 1, 1, 1, 1, 1,
-0.3005151, 1.268345, 0.60293, 1, 1, 1, 1, 1,
-0.2973794, -1.224222, -2.890044, 1, 1, 1, 1, 1,
-0.2948538, 1.331992, 0.2907276, 1, 1, 1, 1, 1,
-0.2894589, -0.4526461, -3.115305, 1, 1, 1, 1, 1,
-0.2798039, 0.6524982, 0.5970036, 1, 1, 1, 1, 1,
-0.2782178, -0.1194164, -3.058445, 1, 1, 1, 1, 1,
-0.2748179, -0.2589257, -4.254567, 0, 0, 1, 1, 1,
-0.2677995, -0.5946335, -2.762263, 1, 0, 0, 1, 1,
-0.2672525, 0.9496226, -0.3980098, 1, 0, 0, 1, 1,
-0.2586629, -0.2047655, -1.352139, 1, 0, 0, 1, 1,
-0.2586124, -0.2917999, -3.767397, 1, 0, 0, 1, 1,
-0.2573443, -0.4092303, -1.354027, 1, 0, 0, 1, 1,
-0.2558745, 1.134536, -1.390848, 0, 0, 0, 1, 1,
-0.2557155, -0.8450611, -2.273434, 0, 0, 0, 1, 1,
-0.2518907, 0.4734697, -0.2791986, 0, 0, 0, 1, 1,
-0.2510264, 1.087655, -0.5874897, 0, 0, 0, 1, 1,
-0.2465823, -0.5100912, -2.902401, 0, 0, 0, 1, 1,
-0.2455346, 0.9116039, -1.749005, 0, 0, 0, 1, 1,
-0.2415769, -0.4361621, -3.213081, 0, 0, 0, 1, 1,
-0.235929, 1.305824, -0.8846556, 1, 1, 1, 1, 1,
-0.2312801, -0.6900613, -2.103686, 1, 1, 1, 1, 1,
-0.2304998, 0.8021155, 0.8358126, 1, 1, 1, 1, 1,
-0.2299037, -0.4224569, -3.306567, 1, 1, 1, 1, 1,
-0.2284968, -1.375773, -3.115349, 1, 1, 1, 1, 1,
-0.2270978, 1.359194, -0.253505, 1, 1, 1, 1, 1,
-0.2263051, 1.665237, -0.7521306, 1, 1, 1, 1, 1,
-0.2222596, 0.4416834, 0.5072669, 1, 1, 1, 1, 1,
-0.2202703, 0.3586777, 0.4006802, 1, 1, 1, 1, 1,
-0.2202229, -1.326862, -2.000926, 1, 1, 1, 1, 1,
-0.2181289, -1.945657, -1.175527, 1, 1, 1, 1, 1,
-0.2152472, 1.12715, -0.2280309, 1, 1, 1, 1, 1,
-0.2141133, 0.9582453, -1.340012, 1, 1, 1, 1, 1,
-0.2132786, -1.013117, -2.700859, 1, 1, 1, 1, 1,
-0.2068824, 0.6927972, -0.2206103, 1, 1, 1, 1, 1,
-0.1996635, 0.1287495, -0.1626687, 0, 0, 1, 1, 1,
-0.1974992, 0.7338348, -1.138237, 1, 0, 0, 1, 1,
-0.197415, 0.8464474, -0.4025809, 1, 0, 0, 1, 1,
-0.1954727, -0.3417399, -2.664422, 1, 0, 0, 1, 1,
-0.1921883, -0.2424196, -2.616569, 1, 0, 0, 1, 1,
-0.1901934, 1.869304, -0.4866696, 1, 0, 0, 1, 1,
-0.1864972, 1.613462, -0.6328594, 0, 0, 0, 1, 1,
-0.1840646, -1.374022, -3.64659, 0, 0, 0, 1, 1,
-0.1816848, 0.4693015, 0.577183, 0, 0, 0, 1, 1,
-0.1815084, -1.419371, -3.243226, 0, 0, 0, 1, 1,
-0.1814955, 1.485027, -0.1826718, 0, 0, 0, 1, 1,
-0.176992, -0.8369012, -3.345562, 0, 0, 0, 1, 1,
-0.1694389, 0.6302122, 1.086707, 0, 0, 0, 1, 1,
-0.1678908, 0.1694214, 0.7483662, 1, 1, 1, 1, 1,
-0.1637372, -0.39904, -2.019274, 1, 1, 1, 1, 1,
-0.1540844, 0.279346, 0.6657411, 1, 1, 1, 1, 1,
-0.1442001, 0.4506241, -0.8849431, 1, 1, 1, 1, 1,
-0.1396638, 1.4835, -0.2600527, 1, 1, 1, 1, 1,
-0.1342093, -0.5257978, -4.182867, 1, 1, 1, 1, 1,
-0.1282565, 0.8903466, 0.410485, 1, 1, 1, 1, 1,
-0.1227428, 0.8147717, -0.2701303, 1, 1, 1, 1, 1,
-0.1223222, 1.152073, 0.7308238, 1, 1, 1, 1, 1,
-0.1202684, -0.8218876, -2.003011, 1, 1, 1, 1, 1,
-0.1167426, 2.636842, -0.2677883, 1, 1, 1, 1, 1,
-0.1157403, -0.1037211, -2.535393, 1, 1, 1, 1, 1,
-0.1138071, -0.5915838, -2.202148, 1, 1, 1, 1, 1,
-0.112618, 1.199288, -0.08267935, 1, 1, 1, 1, 1,
-0.1106194, 0.1810369, -1.841311, 1, 1, 1, 1, 1,
-0.1090651, 0.2025849, -0.1174814, 0, 0, 1, 1, 1,
-0.1064014, -0.2170766, -4.6027, 1, 0, 0, 1, 1,
-0.1059313, 0.8290602, -0.5225339, 1, 0, 0, 1, 1,
-0.1010104, -0.6654969, -2.257485, 1, 0, 0, 1, 1,
-0.09936069, -1.144178, -3.951565, 1, 0, 0, 1, 1,
-0.09757996, 0.004761443, 0.3420181, 1, 0, 0, 1, 1,
-0.09486144, -0.7177413, -3.819249, 0, 0, 0, 1, 1,
-0.09240822, 1.161717, 0.236166, 0, 0, 0, 1, 1,
-0.0916789, 0.8740443, -1.855882, 0, 0, 0, 1, 1,
-0.09165605, 0.3710177, -1.439248, 0, 0, 0, 1, 1,
-0.09074739, -0.04617723, -2.661355, 0, 0, 0, 1, 1,
-0.09049357, -1.325401, -3.043137, 0, 0, 0, 1, 1,
-0.08996451, 0.8776262, -0.4553484, 0, 0, 0, 1, 1,
-0.08654439, 0.9535195, -1.847494, 1, 1, 1, 1, 1,
-0.08538938, 1.08138, -1.327528, 1, 1, 1, 1, 1,
-0.08431447, -0.3807699, -3.397625, 1, 1, 1, 1, 1,
-0.0818543, 2.949238, 1.206921, 1, 1, 1, 1, 1,
-0.08011791, -2.337229, -3.681849, 1, 1, 1, 1, 1,
-0.07897072, -0.4059142, -1.879817, 1, 1, 1, 1, 1,
-0.07545379, -1.527902, -2.169539, 1, 1, 1, 1, 1,
-0.07247719, 1.26914, -0.298841, 1, 1, 1, 1, 1,
-0.06876516, 0.5533291, -0.1663258, 1, 1, 1, 1, 1,
-0.06736207, -0.3340352, -4.310957, 1, 1, 1, 1, 1,
-0.06602099, -1.065053, -4.16778, 1, 1, 1, 1, 1,
-0.06491499, 0.6774558, -0.8125726, 1, 1, 1, 1, 1,
-0.06235427, -0.8839412, -4.316252, 1, 1, 1, 1, 1,
-0.06176741, 0.1158656, 0.7096827, 1, 1, 1, 1, 1,
-0.05808641, 0.1509722, 0.08383582, 1, 1, 1, 1, 1,
-0.05353202, 1.145421, -0.08528979, 0, 0, 1, 1, 1,
-0.05107238, 0.6833252, 1.443324, 1, 0, 0, 1, 1,
-0.04913684, 0.6614164, 0.1329117, 1, 0, 0, 1, 1,
-0.04607886, -0.9710793, -2.407996, 1, 0, 0, 1, 1,
-0.04579183, 0.3569876, 1.457857, 1, 0, 0, 1, 1,
-0.04545838, -2.130856, -3.737055, 1, 0, 0, 1, 1,
-0.04291924, -1.555221, -3.119694, 0, 0, 0, 1, 1,
-0.04278592, -0.5446325, -4.25686, 0, 0, 0, 1, 1,
-0.03835246, 0.3891867, -0.4549277, 0, 0, 0, 1, 1,
-0.03805639, 1.031204, -0.9307452, 0, 0, 0, 1, 1,
-0.03620911, -0.5443725, -4.374807, 0, 0, 0, 1, 1,
-0.0325929, 0.8339652, -0.26211, 0, 0, 0, 1, 1,
-0.03040732, -1.247816, -6.240757, 0, 0, 0, 1, 1,
-0.02832423, 0.2374362, 1.210411, 1, 1, 1, 1, 1,
-0.02287829, -0.2470169, -2.556764, 1, 1, 1, 1, 1,
-0.01926304, 1.350271, 0.1201789, 1, 1, 1, 1, 1,
-0.01132564, 1.200327, 0.5144603, 1, 1, 1, 1, 1,
-0.01117804, 0.8227893, -0.2147645, 1, 1, 1, 1, 1,
-0.01101761, -0.04411909, -2.876259, 1, 1, 1, 1, 1,
-0.0105455, 1.282518, 1.104881, 1, 1, 1, 1, 1,
-0.008035674, 1.218173, -2.002531, 1, 1, 1, 1, 1,
-0.004783517, 0.736114, -0.7207933, 1, 1, 1, 1, 1,
0.005058844, -0.2001014, 3.896623, 1, 1, 1, 1, 1,
0.005394453, 0.1218765, -0.2317998, 1, 1, 1, 1, 1,
0.006586548, -2.376788, 2.894235, 1, 1, 1, 1, 1,
0.009491743, -0.1226591, 0.2793728, 1, 1, 1, 1, 1,
0.01417905, 0.3897175, -0.2500181, 1, 1, 1, 1, 1,
0.01628657, -0.7183406, 2.822975, 1, 1, 1, 1, 1,
0.01684985, -0.2525491, 2.31584, 0, 0, 1, 1, 1,
0.01928023, -0.8470935, 3.956532, 1, 0, 0, 1, 1,
0.022058, 1.906336, -0.8549493, 1, 0, 0, 1, 1,
0.02792276, 0.8044486, -0.6271164, 1, 0, 0, 1, 1,
0.03098795, -1.337799, 3.739164, 1, 0, 0, 1, 1,
0.03185052, -1.544893, 3.804071, 1, 0, 0, 1, 1,
0.03426513, -0.1824573, 3.431436, 0, 0, 0, 1, 1,
0.03710975, -0.7708589, 3.388809, 0, 0, 0, 1, 1,
0.04055661, -0.4536051, 1.961128, 0, 0, 0, 1, 1,
0.04309751, -1.26395, 1.916009, 0, 0, 0, 1, 1,
0.04466426, 0.1581144, -1.329963, 0, 0, 0, 1, 1,
0.04698689, 0.2070758, 1.960343, 0, 0, 0, 1, 1,
0.04792283, -1.529966, 1.516745, 0, 0, 0, 1, 1,
0.05305213, -1.594735, 1.336553, 1, 1, 1, 1, 1,
0.05374055, -0.9608909, 4.450637, 1, 1, 1, 1, 1,
0.05614509, -1.290865, 2.149843, 1, 1, 1, 1, 1,
0.05848622, -0.5096218, 2.257298, 1, 1, 1, 1, 1,
0.05850984, -3.394744, 4.086104, 1, 1, 1, 1, 1,
0.06021898, 1.53758, 0.6186109, 1, 1, 1, 1, 1,
0.06244312, -0.7628619, 4.277386, 1, 1, 1, 1, 1,
0.06541653, 0.6894113, 1.149261, 1, 1, 1, 1, 1,
0.07494808, 0.9625819, -1.179382, 1, 1, 1, 1, 1,
0.07861473, 0.3916978, 0.7874101, 1, 1, 1, 1, 1,
0.07926881, -0.7949672, 2.928732, 1, 1, 1, 1, 1,
0.08273076, -1.281453, 4.819637, 1, 1, 1, 1, 1,
0.08351815, 2.866007, -1.89385, 1, 1, 1, 1, 1,
0.08570137, -0.4897357, 2.856132, 1, 1, 1, 1, 1,
0.08824654, 0.7599621, 0.0441129, 1, 1, 1, 1, 1,
0.08834761, -2.026618, 2.270608, 0, 0, 1, 1, 1,
0.08872616, -0.4576804, 1.969997, 1, 0, 0, 1, 1,
0.09829517, -0.6180854, 1.595575, 1, 0, 0, 1, 1,
0.09910552, -0.4488527, 1.308605, 1, 0, 0, 1, 1,
0.1023841, -1.542922, 4.182308, 1, 0, 0, 1, 1,
0.1029963, 1.079133, 0.5660341, 1, 0, 0, 1, 1,
0.1042824, -1.017204, 2.323208, 0, 0, 0, 1, 1,
0.1062048, 0.655412, 0.1444896, 0, 0, 0, 1, 1,
0.1075172, 0.536903, -1.543438, 0, 0, 0, 1, 1,
0.1080861, 2.517162, 0.7008514, 0, 0, 0, 1, 1,
0.1108103, 0.1947265, -1.689986, 0, 0, 0, 1, 1,
0.1120056, 0.3964536, 0.7776389, 0, 0, 0, 1, 1,
0.1121809, 0.3145231, 0.4202707, 0, 0, 0, 1, 1,
0.1143364, 1.627057, 0.9913813, 1, 1, 1, 1, 1,
0.1236429, 1.583726, -0.3464585, 1, 1, 1, 1, 1,
0.1239415, 0.7998673, 0.738995, 1, 1, 1, 1, 1,
0.1254394, 0.7568411, 1.233256, 1, 1, 1, 1, 1,
0.1259786, 1.630989, 4.217809, 1, 1, 1, 1, 1,
0.1298532, -0.817759, 1.073003, 1, 1, 1, 1, 1,
0.1311471, 0.6851102, 0.6783636, 1, 1, 1, 1, 1,
0.1337379, 0.1443311, 1.069638, 1, 1, 1, 1, 1,
0.1341452, -1.496965, 2.105196, 1, 1, 1, 1, 1,
0.1348437, 0.6890677, -1.905842, 1, 1, 1, 1, 1,
0.1375645, -0.5369927, 3.294174, 1, 1, 1, 1, 1,
0.1450031, -1.256702, 2.768274, 1, 1, 1, 1, 1,
0.1485713, 0.1689597, -0.447896, 1, 1, 1, 1, 1,
0.1525657, 0.6381058, 0.2326984, 1, 1, 1, 1, 1,
0.1527141, -0.4489436, 1.916071, 1, 1, 1, 1, 1,
0.152763, -0.05596882, 2.363449, 0, 0, 1, 1, 1,
0.1582197, -1.467894, 3.54827, 1, 0, 0, 1, 1,
0.1596122, -1.19939, 3.878565, 1, 0, 0, 1, 1,
0.1663909, -1.147099, 4.745004, 1, 0, 0, 1, 1,
0.1684881, -0.08102749, 3.231041, 1, 0, 0, 1, 1,
0.1704449, 0.2548649, 1.296564, 1, 0, 0, 1, 1,
0.1735066, -0.2721625, 1.698002, 0, 0, 0, 1, 1,
0.1746984, -0.5392658, 0.4525172, 0, 0, 0, 1, 1,
0.1838061, -0.8406605, 1.58221, 0, 0, 0, 1, 1,
0.1870207, -2.270887, 3.486197, 0, 0, 0, 1, 1,
0.1893464, -0.6787132, 4.508548, 0, 0, 0, 1, 1,
0.1959331, 0.595598, -1.044157, 0, 0, 0, 1, 1,
0.2015749, 0.2747567, 1.070051, 0, 0, 0, 1, 1,
0.2055396, -0.4946406, 2.584641, 1, 1, 1, 1, 1,
0.2066924, 0.3968901, -1.985407, 1, 1, 1, 1, 1,
0.210598, -0.5997213, 2.413443, 1, 1, 1, 1, 1,
0.2109448, -1.466745, 2.051302, 1, 1, 1, 1, 1,
0.2152223, 0.06611617, 1.472849, 1, 1, 1, 1, 1,
0.2178759, -0.09483081, 2.958542, 1, 1, 1, 1, 1,
0.2190517, -0.1539426, 2.918313, 1, 1, 1, 1, 1,
0.2193397, 0.2395323, 1.773094, 1, 1, 1, 1, 1,
0.2213242, -2.592355, 3.576548, 1, 1, 1, 1, 1,
0.2244594, 1.046213, -0.8840907, 1, 1, 1, 1, 1,
0.2265039, -1.088861, 1.670921, 1, 1, 1, 1, 1,
0.2273104, 0.1521601, 2.690018, 1, 1, 1, 1, 1,
0.2296129, 2.152084, 0.8658183, 1, 1, 1, 1, 1,
0.230225, -0.5548991, 3.090469, 1, 1, 1, 1, 1,
0.2304321, -0.8186111, 3.084252, 1, 1, 1, 1, 1,
0.2307731, -0.936694, 2.504224, 0, 0, 1, 1, 1,
0.2311539, -0.01419096, 1.892393, 1, 0, 0, 1, 1,
0.2325056, -0.4267431, 3.852728, 1, 0, 0, 1, 1,
0.2378764, -0.07411243, 0.6680231, 1, 0, 0, 1, 1,
0.2388593, -0.4460606, 3.317739, 1, 0, 0, 1, 1,
0.2390409, 1.924653, 0.007461245, 1, 0, 0, 1, 1,
0.2414321, -0.2472223, 2.386088, 0, 0, 0, 1, 1,
0.2431195, -0.8120346, 2.85484, 0, 0, 0, 1, 1,
0.2438619, 0.8765821, -1.140048, 0, 0, 0, 1, 1,
0.2443194, 1.119489, 1.75161, 0, 0, 0, 1, 1,
0.2454329, 0.2464515, 0.2145233, 0, 0, 0, 1, 1,
0.2479793, 0.5828313, 1.23748, 0, 0, 0, 1, 1,
0.2526961, -0.4605445, 3.831413, 0, 0, 0, 1, 1,
0.2529213, -0.07495984, 4.633232, 1, 1, 1, 1, 1,
0.2534373, 0.2248095, 2.403136, 1, 1, 1, 1, 1,
0.2548755, 0.4745303, 0.9794604, 1, 1, 1, 1, 1,
0.2559965, 0.4548473, -0.722412, 1, 1, 1, 1, 1,
0.2580214, 0.9685187, 0.7859565, 1, 1, 1, 1, 1,
0.2583133, -0.1400581, 1.063545, 1, 1, 1, 1, 1,
0.2674412, -0.1082456, 0.388962, 1, 1, 1, 1, 1,
0.2677387, 0.9375553, -0.8201124, 1, 1, 1, 1, 1,
0.2690698, -1.913543, 2.709277, 1, 1, 1, 1, 1,
0.2767214, -0.8215045, 3.818796, 1, 1, 1, 1, 1,
0.276956, 0.3973321, 0.6692616, 1, 1, 1, 1, 1,
0.2787713, -0.5092448, 2.896421, 1, 1, 1, 1, 1,
0.2796894, 0.26956, 2.175689, 1, 1, 1, 1, 1,
0.2906916, 1.171083, 1.141265, 1, 1, 1, 1, 1,
0.2907827, 1.15518, 0.5915332, 1, 1, 1, 1, 1,
0.2918036, 0.6733258, 1.195734, 0, 0, 1, 1, 1,
0.2921593, 0.3261369, 1.384516, 1, 0, 0, 1, 1,
0.2925451, -0.7807781, 4.515086, 1, 0, 0, 1, 1,
0.2938716, 0.002155926, 0.07980237, 1, 0, 0, 1, 1,
0.2947838, -0.05401054, 2.289606, 1, 0, 0, 1, 1,
0.2962834, -0.6305112, 1.981698, 1, 0, 0, 1, 1,
0.3033476, -0.5483754, 3.442051, 0, 0, 0, 1, 1,
0.3076457, -1.963833, 3.552559, 0, 0, 0, 1, 1,
0.3083583, -0.2278141, 1.424743, 0, 0, 0, 1, 1,
0.3105069, 0.01588068, -0.2031143, 0, 0, 0, 1, 1,
0.3121865, -1.2987, 4.064406, 0, 0, 0, 1, 1,
0.3173871, 1.342906, 1.003006, 0, 0, 0, 1, 1,
0.3187108, 0.6545818, -0.5195086, 0, 0, 0, 1, 1,
0.3213579, -1.062013, 4.83384, 1, 1, 1, 1, 1,
0.3220546, -1.856565, 2.024789, 1, 1, 1, 1, 1,
0.3222614, -0.4593688, 3.823531, 1, 1, 1, 1, 1,
0.3242887, -1.188971, 2.528758, 1, 1, 1, 1, 1,
0.3254536, -0.4204687, 2.364313, 1, 1, 1, 1, 1,
0.3266123, 0.2310207, 4.366419, 1, 1, 1, 1, 1,
0.3284071, 0.4818045, -0.05576147, 1, 1, 1, 1, 1,
0.3333398, 1.843537, 0.9760057, 1, 1, 1, 1, 1,
0.3337583, -0.1695288, 2.678441, 1, 1, 1, 1, 1,
0.3376008, 0.3585553, 0.3115569, 1, 1, 1, 1, 1,
0.3430565, 1.031596, -0.2444576, 1, 1, 1, 1, 1,
0.3436033, 2.824485, 0.3547478, 1, 1, 1, 1, 1,
0.3437925, -1.229411, 0.9761157, 1, 1, 1, 1, 1,
0.3523363, 0.5465475, -0.3822246, 1, 1, 1, 1, 1,
0.3547968, 2.253787, 0.7281168, 1, 1, 1, 1, 1,
0.3569306, 0.542459, -0.7576593, 0, 0, 1, 1, 1,
0.3591741, 0.003424254, 1.465418, 1, 0, 0, 1, 1,
0.3613644, -1.041968, 2.845145, 1, 0, 0, 1, 1,
0.3621981, 0.1281429, 0.6019613, 1, 0, 0, 1, 1,
0.3659994, -0.6911066, 0.7918378, 1, 0, 0, 1, 1,
0.3792582, 0.04354572, 2.23408, 1, 0, 0, 1, 1,
0.3810832, -1.306884, -0.2489236, 0, 0, 0, 1, 1,
0.3817455, 0.01656373, 3.043817, 0, 0, 0, 1, 1,
0.3834849, -2.361027, 4.078708, 0, 0, 0, 1, 1,
0.386957, 1.951142, 1.340259, 0, 0, 0, 1, 1,
0.3882233, -0.7622679, 2.634852, 0, 0, 0, 1, 1,
0.3892013, -0.2859909, 3.027844, 0, 0, 0, 1, 1,
0.3895866, -0.5082731, 3.268265, 0, 0, 0, 1, 1,
0.3939343, 0.6923354, 1.033658, 1, 1, 1, 1, 1,
0.3977144, -0.4367302, 2.873062, 1, 1, 1, 1, 1,
0.3989424, -1.472667, 3.622247, 1, 1, 1, 1, 1,
0.4023283, -0.3250129, 1.567869, 1, 1, 1, 1, 1,
0.4048055, 2.123523, -0.7166709, 1, 1, 1, 1, 1,
0.4055386, 0.3318158, 1.119594, 1, 1, 1, 1, 1,
0.4138961, 0.4171029, -0.0709181, 1, 1, 1, 1, 1,
0.4195098, 0.168469, 1.230308, 1, 1, 1, 1, 1,
0.4195965, -0.5313197, 0.9705886, 1, 1, 1, 1, 1,
0.4202903, -1.06919, 3.823502, 1, 1, 1, 1, 1,
0.420558, -0.8537449, 3.2981, 1, 1, 1, 1, 1,
0.4266416, 0.05203456, 1.668738, 1, 1, 1, 1, 1,
0.4269333, 1.709717, 1.052186, 1, 1, 1, 1, 1,
0.4286619, 1.308734, 0.7057772, 1, 1, 1, 1, 1,
0.4298049, -1.292156, 2.574144, 1, 1, 1, 1, 1,
0.4348508, -1.157275, 4.212427, 0, 0, 1, 1, 1,
0.4428986, 0.7598873, 0.622561, 1, 0, 0, 1, 1,
0.4443191, 0.8761405, 1.323379, 1, 0, 0, 1, 1,
0.4472051, 1.412324, 0.7618366, 1, 0, 0, 1, 1,
0.4504384, 1.023389, -0.2879091, 1, 0, 0, 1, 1,
0.4535689, -1.045243, 3.130255, 1, 0, 0, 1, 1,
0.4546366, -1.905669, 3.273389, 0, 0, 0, 1, 1,
0.4557113, 0.8109041, 1.68107, 0, 0, 0, 1, 1,
0.4579055, -0.1643682, 3.771066, 0, 0, 0, 1, 1,
0.4580153, -1.894754, 2.133954, 0, 0, 0, 1, 1,
0.4585349, -0.4212908, 3.268262, 0, 0, 0, 1, 1,
0.4620581, -1.719315, 3.734472, 0, 0, 0, 1, 1,
0.462181, -0.6214417, 2.037029, 0, 0, 0, 1, 1,
0.4654057, -0.8767787, 2.146082, 1, 1, 1, 1, 1,
0.4666273, 1.218668, 0.1344663, 1, 1, 1, 1, 1,
0.4728325, -0.5472742, 1.93668, 1, 1, 1, 1, 1,
0.4764175, 0.4070957, 0.530583, 1, 1, 1, 1, 1,
0.4767776, 0.2352472, 1.347593, 1, 1, 1, 1, 1,
0.4796138, 1.47218, 0.2924041, 1, 1, 1, 1, 1,
0.4834076, -0.6050143, 0.7870301, 1, 1, 1, 1, 1,
0.4902872, -0.2708298, 3.16898, 1, 1, 1, 1, 1,
0.4908924, 0.2612507, 1.846271, 1, 1, 1, 1, 1,
0.5039064, -0.3007624, 4.255005, 1, 1, 1, 1, 1,
0.5045897, -0.9576457, 1.095792, 1, 1, 1, 1, 1,
0.5059659, -0.7486784, 1.834998, 1, 1, 1, 1, 1,
0.5066252, -0.3618092, 3.253257, 1, 1, 1, 1, 1,
0.5174866, -2.395166, 2.664029, 1, 1, 1, 1, 1,
0.5185282, -1.041596, 3.459602, 1, 1, 1, 1, 1,
0.5205255, -0.6683151, 2.630081, 0, 0, 1, 1, 1,
0.5230421, 0.09489746, 0.2119728, 1, 0, 0, 1, 1,
0.5247245, -0.4874858, 3.142792, 1, 0, 0, 1, 1,
0.526366, -0.43269, 2.618137, 1, 0, 0, 1, 1,
0.5281667, 0.3329243, 2.43099, 1, 0, 0, 1, 1,
0.530211, -0.7838249, 3.494381, 1, 0, 0, 1, 1,
0.5333593, 0.4174379, -0.0531793, 0, 0, 0, 1, 1,
0.5373737, 1.969584, 0.9301531, 0, 0, 0, 1, 1,
0.5384945, 0.770322, 3.941429, 0, 0, 0, 1, 1,
0.5393938, -1.256831, 2.746488, 0, 0, 0, 1, 1,
0.5408899, -0.5564381, 2.647816, 0, 0, 0, 1, 1,
0.5417718, 0.01814857, 1.828151, 0, 0, 0, 1, 1,
0.5418056, -1.355106, 2.621858, 0, 0, 0, 1, 1,
0.5444203, 1.040148, 2.422636, 1, 1, 1, 1, 1,
0.5451316, 1.396479, 0.2458085, 1, 1, 1, 1, 1,
0.5454836, 0.4396157, 0.6838768, 1, 1, 1, 1, 1,
0.5480522, 0.296102, 1.935052, 1, 1, 1, 1, 1,
0.5484297, 0.04290948, 2.520438, 1, 1, 1, 1, 1,
0.5590838, 1.126227, 0.7416857, 1, 1, 1, 1, 1,
0.5643608, -0.358713, 3.823506, 1, 1, 1, 1, 1,
0.5655944, 1.201652, 1.450144, 1, 1, 1, 1, 1,
0.5801845, -0.1134681, 2.465222, 1, 1, 1, 1, 1,
0.5881413, -0.9788454, 1.512635, 1, 1, 1, 1, 1,
0.5883085, 3.152283, 1.800466, 1, 1, 1, 1, 1,
0.5915068, 0.9514228, 1.424101, 1, 1, 1, 1, 1,
0.5929753, -0.5740677, 2.122165, 1, 1, 1, 1, 1,
0.5972992, 1.44761, 1.975615, 1, 1, 1, 1, 1,
0.5999944, 1.042514, 0.4751017, 1, 1, 1, 1, 1,
0.600944, -0.8342803, 2.012735, 0, 0, 1, 1, 1,
0.6041775, -0.2350971, 2.623129, 1, 0, 0, 1, 1,
0.6180049, 0.665905, -0.401841, 1, 0, 0, 1, 1,
0.6212718, -0.3961355, -0.3690548, 1, 0, 0, 1, 1,
0.6343417, -0.1101532, 1.101875, 1, 0, 0, 1, 1,
0.6343655, -1.686954, 2.533638, 1, 0, 0, 1, 1,
0.6370969, 0.7318373, -0.5100963, 0, 0, 0, 1, 1,
0.641385, 1.622527, 1.382464, 0, 0, 0, 1, 1,
0.6450599, 1.629557, -1.58968, 0, 0, 0, 1, 1,
0.6512684, 0.2629242, 1.484673, 0, 0, 0, 1, 1,
0.6570137, -1.199679, 1.227133, 0, 0, 0, 1, 1,
0.6687995, 0.7452539, 0.8591082, 0, 0, 0, 1, 1,
0.6704576, -0.8575413, 3.729218, 0, 0, 0, 1, 1,
0.6756178, 0.3039555, 1.062901, 1, 1, 1, 1, 1,
0.6785006, -0.1296095, 0.8286697, 1, 1, 1, 1, 1,
0.6789417, 0.5797259, 2.492856, 1, 1, 1, 1, 1,
0.6817868, 0.03360992, 1.210785, 1, 1, 1, 1, 1,
0.6830795, 0.3925097, 1.221729, 1, 1, 1, 1, 1,
0.7067411, 0.1718171, 0.8560677, 1, 1, 1, 1, 1,
0.7084171, -0.6116686, 2.428506, 1, 1, 1, 1, 1,
0.7102018, 0.1553949, 1.123551, 1, 1, 1, 1, 1,
0.7132948, -1.562976, 1.673298, 1, 1, 1, 1, 1,
0.7139349, -0.121874, 1.27928, 1, 1, 1, 1, 1,
0.7143829, 0.5881932, 1.212171, 1, 1, 1, 1, 1,
0.7149796, 0.6919339, 0.6007171, 1, 1, 1, 1, 1,
0.7195645, -1.28189, 2.2423, 1, 1, 1, 1, 1,
0.7207918, -0.6282376, 0.1528196, 1, 1, 1, 1, 1,
0.7547534, 0.8645074, 0.9751573, 1, 1, 1, 1, 1,
0.7584664, 0.5085354, 1.950939, 0, 0, 1, 1, 1,
0.7649323, 1.131629, 0.1020126, 1, 0, 0, 1, 1,
0.7665448, -0.8665153, 2.701494, 1, 0, 0, 1, 1,
0.7668212, -2.044393, 2.511256, 1, 0, 0, 1, 1,
0.7693689, -0.1921612, 1.283016, 1, 0, 0, 1, 1,
0.7710229, -0.1420023, 3.226189, 1, 0, 0, 1, 1,
0.7783284, 0.08583387, 1.58207, 0, 0, 0, 1, 1,
0.7814074, -0.8060963, 1.653024, 0, 0, 0, 1, 1,
0.7821481, 0.6315009, 0.590002, 0, 0, 0, 1, 1,
0.783026, -1.262502, 3.959822, 0, 0, 0, 1, 1,
0.78563, 0.4493959, 0.07636394, 0, 0, 0, 1, 1,
0.7856821, 0.337347, 0.5735996, 0, 0, 0, 1, 1,
0.7885831, -0.3706931, 2.301262, 0, 0, 0, 1, 1,
0.791145, -0.2920162, 2.467793, 1, 1, 1, 1, 1,
0.793785, 1.24188, -0.9957874, 1, 1, 1, 1, 1,
0.7957441, 1.348289, 1.183399, 1, 1, 1, 1, 1,
0.8025435, -0.3156663, 2.568786, 1, 1, 1, 1, 1,
0.8049515, 1.837626, 0.8728421, 1, 1, 1, 1, 1,
0.8053694, -0.7270849, 2.366606, 1, 1, 1, 1, 1,
0.8064934, -1.810261, 1.743816, 1, 1, 1, 1, 1,
0.8112279, 0.08774612, 1.406873, 1, 1, 1, 1, 1,
0.8158581, 1.473985, -1.171873, 1, 1, 1, 1, 1,
0.8164973, -0.6530386, 1.564145, 1, 1, 1, 1, 1,
0.8176252, -0.1986353, 1.555884, 1, 1, 1, 1, 1,
0.8207768, 0.1886583, 2.834016, 1, 1, 1, 1, 1,
0.8250194, 2.122143, -0.4969612, 1, 1, 1, 1, 1,
0.8313948, 1.500541, 0.593293, 1, 1, 1, 1, 1,
0.8353972, -1.108971, 2.443593, 1, 1, 1, 1, 1,
0.8390054, 0.394934, 2.068057, 0, 0, 1, 1, 1,
0.8431901, -1.676652, 2.997479, 1, 0, 0, 1, 1,
0.8451219, 1.855125, 0.9603586, 1, 0, 0, 1, 1,
0.8494581, -0.2160895, 2.955935, 1, 0, 0, 1, 1,
0.8513325, -1.336025, 3.374465, 1, 0, 0, 1, 1,
0.8514735, -0.05956024, 1.793126, 1, 0, 0, 1, 1,
0.8521817, 0.7197164, 0.5296344, 0, 0, 0, 1, 1,
0.8536396, 1.158343, 0.1034912, 0, 0, 0, 1, 1,
0.8554328, -0.4468478, 1.876494, 0, 0, 0, 1, 1,
0.8675935, 1.292515, -0.6994605, 0, 0, 0, 1, 1,
0.8700387, -0.8550541, 1.861963, 0, 0, 0, 1, 1,
0.8720415, -0.1001809, 3.037751, 0, 0, 0, 1, 1,
0.8781178, -0.04131428, 1.204845, 0, 0, 0, 1, 1,
0.8794702, -1.29276, 2.601948, 1, 1, 1, 1, 1,
0.8817147, 0.349004, 1.799432, 1, 1, 1, 1, 1,
0.8820593, -1.321549, 4.564429, 1, 1, 1, 1, 1,
0.8859104, -0.4011464, 2.071545, 1, 1, 1, 1, 1,
0.8867194, 1.66438, 0.2456059, 1, 1, 1, 1, 1,
0.8937147, 1.136203, 1.266964, 1, 1, 1, 1, 1,
0.8942174, 2.230491, 1.741965, 1, 1, 1, 1, 1,
0.898202, 0.3006785, 0.8226964, 1, 1, 1, 1, 1,
0.8983784, 2.011328, -1.242624, 1, 1, 1, 1, 1,
0.9007919, -0.7626795, 3.158337, 1, 1, 1, 1, 1,
0.9133831, -0.9464903, 4.017297, 1, 1, 1, 1, 1,
0.9144637, 1.526003, 0.8550709, 1, 1, 1, 1, 1,
0.9155551, 0.7720643, 1.145125, 1, 1, 1, 1, 1,
0.9201401, 0.2645362, 0.5811499, 1, 1, 1, 1, 1,
0.9203032, 0.8228698, 0.2409653, 1, 1, 1, 1, 1,
0.9209452, -1.617914, 2.899756, 0, 0, 1, 1, 1,
0.9228498, -0.8683861, 3.277563, 1, 0, 0, 1, 1,
0.9230659, -1.659165, 3.174433, 1, 0, 0, 1, 1,
0.9264706, 0.2077049, 2.462729, 1, 0, 0, 1, 1,
0.9331161, -0.4594181, 3.018894, 1, 0, 0, 1, 1,
0.9385917, -0.005707127, 0.6736495, 1, 0, 0, 1, 1,
0.9413903, 1.31592, 0.469674, 0, 0, 0, 1, 1,
0.9434026, 0.3870168, 0.2025976, 0, 0, 0, 1, 1,
0.9437374, 2.065586, 0.714357, 0, 0, 0, 1, 1,
0.9447985, -1.550862, 2.483125, 0, 0, 0, 1, 1,
0.9459747, -0.5404745, 1.818626, 0, 0, 0, 1, 1,
0.947161, -0.3180671, 1.305629, 0, 0, 0, 1, 1,
0.9472754, 0.3049788, 0.471438, 0, 0, 0, 1, 1,
0.9490138, 1.392002, -0.005903597, 1, 1, 1, 1, 1,
0.9580984, -0.9605694, 3.627708, 1, 1, 1, 1, 1,
0.9590936, 1.00105, 0.4399317, 1, 1, 1, 1, 1,
0.9609707, -1.452683, 1.411289, 1, 1, 1, 1, 1,
0.9646199, -0.468191, 2.284461, 1, 1, 1, 1, 1,
0.9681166, 0.3263592, 1.098643, 1, 1, 1, 1, 1,
0.9759842, -0.6315225, 3.696189, 1, 1, 1, 1, 1,
0.97736, 1.150464, 0.9607199, 1, 1, 1, 1, 1,
0.9791492, 1.630582, 0.9001504, 1, 1, 1, 1, 1,
0.9820688, 0.3614062, -1.44125, 1, 1, 1, 1, 1,
0.9853776, 1.054064, 0.8612897, 1, 1, 1, 1, 1,
0.9924442, -0.6137792, 2.334403, 1, 1, 1, 1, 1,
0.9945597, 0.8964248, 2.563072, 1, 1, 1, 1, 1,
0.9976886, 0.5643264, 3.742847, 1, 1, 1, 1, 1,
1.001603, 1.539191, -1.415598, 1, 1, 1, 1, 1,
1.00261, 0.4829601, 1.163044, 0, 0, 1, 1, 1,
1.005448, 1.495198, 1.595418, 1, 0, 0, 1, 1,
1.008911, 0.3736954, 1.120613, 1, 0, 0, 1, 1,
1.010026, 0.1706499, -0.1924527, 1, 0, 0, 1, 1,
1.01054, -1.018513, 1.455838, 1, 0, 0, 1, 1,
1.012227, 0.6998438, 0.136462, 1, 0, 0, 1, 1,
1.015534, 1.840166, 2.15165, 0, 0, 0, 1, 1,
1.019968, 0.8185539, 2.222275, 0, 0, 0, 1, 1,
1.023579, -0.2749948, 2.629885, 0, 0, 0, 1, 1,
1.024562, -0.9092196, 1.024944, 0, 0, 0, 1, 1,
1.025358, -0.9916416, 3.223973, 0, 0, 0, 1, 1,
1.02789, 0.3729748, 2.436974, 0, 0, 0, 1, 1,
1.034377, 0.8003559, -0.7374033, 0, 0, 0, 1, 1,
1.039916, 0.02334001, 1.710533, 1, 1, 1, 1, 1,
1.043087, -0.2582571, 1.132026, 1, 1, 1, 1, 1,
1.04994, 0.7146483, 1.689095, 1, 1, 1, 1, 1,
1.052491, 0.09052458, 0.6436603, 1, 1, 1, 1, 1,
1.058075, -1.051978, 3.176262, 1, 1, 1, 1, 1,
1.0608, -0.3917069, 2.226812, 1, 1, 1, 1, 1,
1.060964, -0.075187, 1.88773, 1, 1, 1, 1, 1,
1.063578, -0.5048786, 0.7418118, 1, 1, 1, 1, 1,
1.065429, -0.6516594, 1.867524, 1, 1, 1, 1, 1,
1.072947, -0.8025606, 3.130774, 1, 1, 1, 1, 1,
1.077913, -0.4986819, 3.437121, 1, 1, 1, 1, 1,
1.079522, 0.9220593, 0.3501279, 1, 1, 1, 1, 1,
1.080372, 0.8916069, 0.3072967, 1, 1, 1, 1, 1,
1.083635, 0.4628319, 1.947222, 1, 1, 1, 1, 1,
1.090515, 1.167213, -0.2625104, 1, 1, 1, 1, 1,
1.092912, -0.4582183, 0.9737769, 0, 0, 1, 1, 1,
1.098557, -0.009997687, 1.317258, 1, 0, 0, 1, 1,
1.112464, -1.568455, 2.286729, 1, 0, 0, 1, 1,
1.115717, -0.5830216, 1.99933, 1, 0, 0, 1, 1,
1.1171, -0.4531122, -0.03655997, 1, 0, 0, 1, 1,
1.119365, -1.06029, 1.058873, 1, 0, 0, 1, 1,
1.126539, -0.8474782, 1.166545, 0, 0, 0, 1, 1,
1.127975, -0.1181346, 0.8126409, 0, 0, 0, 1, 1,
1.133663, -1.790855, 2.806896, 0, 0, 0, 1, 1,
1.13545, -0.6682345, 0.7575137, 0, 0, 0, 1, 1,
1.137009, 0.6815941, 0.9832992, 0, 0, 0, 1, 1,
1.155071, 0.5459361, 0.8110342, 0, 0, 0, 1, 1,
1.158878, 1.023971, 1.950304, 0, 0, 0, 1, 1,
1.168284, 1.166527, 0.5729841, 1, 1, 1, 1, 1,
1.169192, 0.7252057, 1.948427, 1, 1, 1, 1, 1,
1.198471, -0.2456167, -0.1693768, 1, 1, 1, 1, 1,
1.198506, 1.266883, 3.553346, 1, 1, 1, 1, 1,
1.208552, 0.5799919, 2.400644, 1, 1, 1, 1, 1,
1.21243, -0.8214473, 4.668551, 1, 1, 1, 1, 1,
1.219053, 0.3066345, 1.818286, 1, 1, 1, 1, 1,
1.225192, 0.2752897, 1.010219, 1, 1, 1, 1, 1,
1.229629, -2.316915, 0.7195898, 1, 1, 1, 1, 1,
1.242967, 1.374471, 0.1540776, 1, 1, 1, 1, 1,
1.246395, -0.310306, 2.338968, 1, 1, 1, 1, 1,
1.249738, 1.050952, 1.927312, 1, 1, 1, 1, 1,
1.250368, -1.242435, 3.824361, 1, 1, 1, 1, 1,
1.256641, -0.4692607, 1.120491, 1, 1, 1, 1, 1,
1.260389, 0.4054698, 0.304937, 1, 1, 1, 1, 1,
1.261221, -0.380589, 2.35178, 0, 0, 1, 1, 1,
1.27175, -1.566085, 2.996616, 1, 0, 0, 1, 1,
1.273646, -0.5382667, 1.263517, 1, 0, 0, 1, 1,
1.276695, -0.3063943, 0.671722, 1, 0, 0, 1, 1,
1.282544, 2.577961, -0.9157175, 1, 0, 0, 1, 1,
1.288309, -1.331318, 3.994595, 1, 0, 0, 1, 1,
1.290084, 0.2048452, 1.175606, 0, 0, 0, 1, 1,
1.29146, -1.262871, 1.66461, 0, 0, 0, 1, 1,
1.304007, 1.080627, 0.7670403, 0, 0, 0, 1, 1,
1.305061, -0.5199407, 2.057622, 0, 0, 0, 1, 1,
1.30888, 0.6948076, 1.335114, 0, 0, 0, 1, 1,
1.309148, 0.7885161, 0.9917953, 0, 0, 0, 1, 1,
1.31193, -0.3340596, 0.8392224, 0, 0, 0, 1, 1,
1.323156, -0.2987293, 1.93538, 1, 1, 1, 1, 1,
1.323526, 1.261216, -0.4034258, 1, 1, 1, 1, 1,
1.32669, -0.3162676, -0.3170621, 1, 1, 1, 1, 1,
1.332824, -3.314824, 2.425725, 1, 1, 1, 1, 1,
1.337872, -0.1186329, 2.868973, 1, 1, 1, 1, 1,
1.345382, 0.8946716, 0.6570941, 1, 1, 1, 1, 1,
1.347715, 1.232404, -0.729861, 1, 1, 1, 1, 1,
1.351184, -0.5854753, 0.9122083, 1, 1, 1, 1, 1,
1.35289, -0.3126805, 2.118806, 1, 1, 1, 1, 1,
1.360827, 0.4466294, 2.693974, 1, 1, 1, 1, 1,
1.361843, 0.5272252, 2.563607, 1, 1, 1, 1, 1,
1.362015, -0.1564027, 1.942515, 1, 1, 1, 1, 1,
1.374243, -0.2734449, 2.549102, 1, 1, 1, 1, 1,
1.376912, 0.7434718, 0.1749734, 1, 1, 1, 1, 1,
1.376951, -1.918363, 2.10743, 1, 1, 1, 1, 1,
1.38172, 0.9139911, 1.975763, 0, 0, 1, 1, 1,
1.387305, 0.1915684, 1.560686, 1, 0, 0, 1, 1,
1.387841, 0.4218214, 1.449225, 1, 0, 0, 1, 1,
1.396303, -0.2245691, 1.693879, 1, 0, 0, 1, 1,
1.398835, -1.870811, 2.657547, 1, 0, 0, 1, 1,
1.402272, -0.1137178, 0.5567197, 1, 0, 0, 1, 1,
1.402343, -0.6040031, 0.3833635, 0, 0, 0, 1, 1,
1.405326, -0.7741498, 1.359333, 0, 0, 0, 1, 1,
1.416592, 0.7697345, 1.63473, 0, 0, 0, 1, 1,
1.417202, -0.6844934, 2.154183, 0, 0, 0, 1, 1,
1.417902, -0.4697551, 1.705482, 0, 0, 0, 1, 1,
1.423546, 1.885339, 1.737398, 0, 0, 0, 1, 1,
1.442649, 0.6904919, 0.9648284, 0, 0, 0, 1, 1,
1.443917, -1.875933, 4.26297, 1, 1, 1, 1, 1,
1.462706, -0.7988775, 1.856539, 1, 1, 1, 1, 1,
1.467155, -2.019112, 3.040955, 1, 1, 1, 1, 1,
1.474528, 1.518524, 1.049634, 1, 1, 1, 1, 1,
1.475056, 2.496776, -0.1243397, 1, 1, 1, 1, 1,
1.482107, 0.5134163, 1.608803, 1, 1, 1, 1, 1,
1.494263, 0.1371095, 1.950608, 1, 1, 1, 1, 1,
1.497606, -0.6431274, 1.162073, 1, 1, 1, 1, 1,
1.499159, 1.217277, 1.565982, 1, 1, 1, 1, 1,
1.504444, 1.692493, 0.1234015, 1, 1, 1, 1, 1,
1.504941, -0.7554049, 1.563538, 1, 1, 1, 1, 1,
1.506647, 0.7381977, -0.6473218, 1, 1, 1, 1, 1,
1.528251, -0.09209832, 1.492237, 1, 1, 1, 1, 1,
1.538844, 1.944084, 0.9381279, 1, 1, 1, 1, 1,
1.540209, -0.1618407, 2.3365, 1, 1, 1, 1, 1,
1.587437, 0.4435445, 0.6998686, 0, 0, 1, 1, 1,
1.603582, 0.07367373, 3.504331, 1, 0, 0, 1, 1,
1.610254, 1.761131, 0.3024937, 1, 0, 0, 1, 1,
1.634059, -0.4535587, 3.117952, 1, 0, 0, 1, 1,
1.650731, 0.4230732, 0.8668135, 1, 0, 0, 1, 1,
1.65707, -0.706128, 0.01531835, 1, 0, 0, 1, 1,
1.686035, 0.2300337, 0.8383046, 0, 0, 0, 1, 1,
1.695322, 0.5288844, 0.1843392, 0, 0, 0, 1, 1,
1.720978, -0.9586413, 1.770222, 0, 0, 0, 1, 1,
1.740534, -2.635744, 3.257693, 0, 0, 0, 1, 1,
1.760526, -0.1395928, 1.074413, 0, 0, 0, 1, 1,
1.765014, 1.227776, 1.265473, 0, 0, 0, 1, 1,
1.783885, 0.3109533, 1.595769, 0, 0, 0, 1, 1,
1.807706, -0.4812491, 3.461879, 1, 1, 1, 1, 1,
1.807951, -0.4335492, 1.01979, 1, 1, 1, 1, 1,
1.810478, 0.6878843, 1.74039, 1, 1, 1, 1, 1,
1.820194, -1.031839, 0.7467291, 1, 1, 1, 1, 1,
1.827089, -0.3587134, 1.157146, 1, 1, 1, 1, 1,
1.835444, -1.183352, 1.685186, 1, 1, 1, 1, 1,
1.925504, 1.414459, 1.38915, 1, 1, 1, 1, 1,
1.933272, -1.315574, 0.7016336, 1, 1, 1, 1, 1,
1.935191, -0.5275244, 1.57305, 1, 1, 1, 1, 1,
1.939413, -1.318286, 3.612162, 1, 1, 1, 1, 1,
1.939515, -1.643349, 3.178164, 1, 1, 1, 1, 1,
1.95702, -1.596865, 1.466092, 1, 1, 1, 1, 1,
1.963216, 0.4403208, 1.404538, 1, 1, 1, 1, 1,
2.003331, 1.615534, 1.381454, 1, 1, 1, 1, 1,
2.070709, 0.6282618, 1.716199, 1, 1, 1, 1, 1,
2.104011, -1.02382, 2.999019, 0, 0, 1, 1, 1,
2.105479, -1.364012, -0.02337877, 1, 0, 0, 1, 1,
2.234384, 1.669491, 0.7133488, 1, 0, 0, 1, 1,
2.254622, 1.515608, 0.9148301, 1, 0, 0, 1, 1,
2.282865, -0.1702737, 1.168216, 1, 0, 0, 1, 1,
2.301953, 0.5186882, 2.035122, 1, 0, 0, 1, 1,
2.309562, -0.1457462, 1.943489, 0, 0, 0, 1, 1,
2.326328, 1.287482, 1.074563, 0, 0, 0, 1, 1,
2.342033, -1.390536, 1.507335, 0, 0, 0, 1, 1,
2.352246, -0.7829786, 1.636022, 0, 0, 0, 1, 1,
2.383378, 0.8204026, 0.4819284, 0, 0, 0, 1, 1,
2.418302, 0.7710475, 1.414508, 0, 0, 0, 1, 1,
2.428195, 0.05558201, 0.2808051, 0, 0, 0, 1, 1,
2.438857, 0.3082832, 1.853017, 1, 1, 1, 1, 1,
2.469801, -0.6473992, 0.8036833, 1, 1, 1, 1, 1,
2.537709, -0.6276104, 2.927917, 1, 1, 1, 1, 1,
2.810546, -0.3978414, 2.525549, 1, 1, 1, 1, 1,
2.859273, 0.1460177, 0.8434764, 1, 1, 1, 1, 1,
2.96596, -0.7325795, 3.61503, 1, 1, 1, 1, 1,
3.13287, -0.8586472, 0.4878879, 1, 1, 1, 1, 1
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
var radius = 9.835033;
var distance = 34.54514;
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
mvMatrix.translate( 0.07856417, -0.01750541, 0.7034588 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.54514);
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