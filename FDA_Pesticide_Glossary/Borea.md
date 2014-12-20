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
-3.777925, -0.6564465, -1.346326, 1, 0, 0, 1,
-3.677483, -0.9802321, -3.431971, 1, 0.007843138, 0, 1,
-3.372538, -1.145645, -1.347411, 1, 0.01176471, 0, 1,
-3.262417, 2.058083, -1.284214, 1, 0.01960784, 0, 1,
-2.771166, -0.9928614, 0.2944035, 1, 0.02352941, 0, 1,
-2.593875, -0.4411512, -1.147128, 1, 0.03137255, 0, 1,
-2.557489, 0.8146623, 1.139239, 1, 0.03529412, 0, 1,
-2.458387, 0.02681904, -3.102756, 1, 0.04313726, 0, 1,
-2.369199, 0.8020396, -1.991338, 1, 0.04705882, 0, 1,
-2.294379, -0.3171729, -2.801926, 1, 0.05490196, 0, 1,
-2.283562, -0.02032382, -1.239652, 1, 0.05882353, 0, 1,
-2.221832, 0.9964366, -2.533984, 1, 0.06666667, 0, 1,
-2.063678, 0.8803844, -1.520892, 1, 0.07058824, 0, 1,
-2.055598, -0.3830284, -1.51554, 1, 0.07843138, 0, 1,
-2.052636, -1.220709, -2.494995, 1, 0.08235294, 0, 1,
-2.050262, -0.9275567, -0.8572168, 1, 0.09019608, 0, 1,
-2.046281, 0.1558164, -3.174825, 1, 0.09411765, 0, 1,
-2.04616, 1.063091, -1.845519, 1, 0.1019608, 0, 1,
-2.027041, 0.7061256, -0.8994383, 1, 0.1098039, 0, 1,
-2.017644, -1.500433, -1.466128, 1, 0.1137255, 0, 1,
-2.013624, 0.6385673, -1.490035, 1, 0.1215686, 0, 1,
-2.001254, 0.4092544, -1.627496, 1, 0.1254902, 0, 1,
-1.988296, -0.3879048, -0.6442623, 1, 0.1333333, 0, 1,
-1.987009, -0.457588, -2.855752, 1, 0.1372549, 0, 1,
-1.933007, -0.7792749, -3.55978, 1, 0.145098, 0, 1,
-1.925439, 0.1720987, -1.014688, 1, 0.1490196, 0, 1,
-1.909024, -2.125821, -2.678759, 1, 0.1568628, 0, 1,
-1.888762, -0.03354094, -2.719817, 1, 0.1607843, 0, 1,
-1.822321, 0.6602609, -1.933259, 1, 0.1686275, 0, 1,
-1.812455, -0.6792135, -1.090332, 1, 0.172549, 0, 1,
-1.810172, -1.139546, -1.989608, 1, 0.1803922, 0, 1,
-1.795635, 0.953775, -1.759092, 1, 0.1843137, 0, 1,
-1.767981, -1.124291, -0.06244817, 1, 0.1921569, 0, 1,
-1.761117, 0.5298868, -0.7681798, 1, 0.1960784, 0, 1,
-1.755095, 1.143034, -1.920847, 1, 0.2039216, 0, 1,
-1.753554, -0.2691501, -1.28715, 1, 0.2117647, 0, 1,
-1.75009, -0.4956205, -1.512054, 1, 0.2156863, 0, 1,
-1.739247, 1.388565, -2.35282, 1, 0.2235294, 0, 1,
-1.738853, 1.433726, -0.9475514, 1, 0.227451, 0, 1,
-1.730807, -0.2919526, -0.4104258, 1, 0.2352941, 0, 1,
-1.719922, 0.8148216, -4.308159, 1, 0.2392157, 0, 1,
-1.705439, -0.646624, -1.306904, 1, 0.2470588, 0, 1,
-1.696966, 1.292233, -0.2575908, 1, 0.2509804, 0, 1,
-1.687219, -0.4026077, -0.4213283, 1, 0.2588235, 0, 1,
-1.680331, 0.0186756, -2.387992, 1, 0.2627451, 0, 1,
-1.650222, 1.350412, 0.8557402, 1, 0.2705882, 0, 1,
-1.63856, -0.1573281, -1.345024, 1, 0.2745098, 0, 1,
-1.636746, -0.5500851, -1.14668, 1, 0.282353, 0, 1,
-1.622468, 0.7665212, -2.249897, 1, 0.2862745, 0, 1,
-1.599539, 0.7388393, -2.342287, 1, 0.2941177, 0, 1,
-1.59234, -1.347, -1.255991, 1, 0.3019608, 0, 1,
-1.58953, -0.06256159, -2.492157, 1, 0.3058824, 0, 1,
-1.5848, 1.039126, -1.043545, 1, 0.3137255, 0, 1,
-1.564639, 0.9432054, -1.665126, 1, 0.3176471, 0, 1,
-1.56097, 0.9420794, -1.519345, 1, 0.3254902, 0, 1,
-1.555349, -1.290017, -2.660291, 1, 0.3294118, 0, 1,
-1.549303, 0.3182599, -0.1249477, 1, 0.3372549, 0, 1,
-1.537917, 1.563886, -0.105609, 1, 0.3411765, 0, 1,
-1.534759, 1.544213, -0.05650854, 1, 0.3490196, 0, 1,
-1.514277, -0.1906847, -0.9465231, 1, 0.3529412, 0, 1,
-1.505482, -1.124346, -3.20037, 1, 0.3607843, 0, 1,
-1.493635, 0.6199536, 0.4932283, 1, 0.3647059, 0, 1,
-1.486286, -0.01961141, -1.862731, 1, 0.372549, 0, 1,
-1.485312, 0.1879746, -1.98291, 1, 0.3764706, 0, 1,
-1.467505, -0.9581569, -2.771089, 1, 0.3843137, 0, 1,
-1.456979, 1.155413, -0.1194057, 1, 0.3882353, 0, 1,
-1.452367, -0.8723599, -2.457077, 1, 0.3960784, 0, 1,
-1.446988, -1.631941, -3.149944, 1, 0.4039216, 0, 1,
-1.4437, 0.5305805, -2.454407, 1, 0.4078431, 0, 1,
-1.431599, 1.909156, 0.05395791, 1, 0.4156863, 0, 1,
-1.420354, -1.520052, -1.766045, 1, 0.4196078, 0, 1,
-1.417197, -0.5920364, -0.657513, 1, 0.427451, 0, 1,
-1.410803, -0.1902071, 0.5143335, 1, 0.4313726, 0, 1,
-1.406992, -0.9802447, -3.726366, 1, 0.4392157, 0, 1,
-1.39998, 0.5116828, -2.155603, 1, 0.4431373, 0, 1,
-1.396338, 0.9396445, -1.511916, 1, 0.4509804, 0, 1,
-1.389652, -0.6147044, -0.5417979, 1, 0.454902, 0, 1,
-1.382506, -0.3073355, -2.30693, 1, 0.4627451, 0, 1,
-1.37946, -0.06422804, -1.635061, 1, 0.4666667, 0, 1,
-1.362488, -0.3166176, -2.103587, 1, 0.4745098, 0, 1,
-1.353793, -0.9554166, -1.780897, 1, 0.4784314, 0, 1,
-1.351982, 0.6375179, -0.9485359, 1, 0.4862745, 0, 1,
-1.350824, 0.823148, -1.027487, 1, 0.4901961, 0, 1,
-1.344347, 0.9519194, -0.5352004, 1, 0.4980392, 0, 1,
-1.343009, -0.6533644, -0.3970121, 1, 0.5058824, 0, 1,
-1.335493, -0.1492927, -4.003313, 1, 0.509804, 0, 1,
-1.335128, -0.797321, -3.814672, 1, 0.5176471, 0, 1,
-1.331785, 0.1833938, -1.302113, 1, 0.5215687, 0, 1,
-1.327506, 0.2309064, -2.447769, 1, 0.5294118, 0, 1,
-1.325881, -0.641511, -2.035178, 1, 0.5333334, 0, 1,
-1.305852, -0.01005778, -2.380433, 1, 0.5411765, 0, 1,
-1.304805, -0.5995704, -3.459091, 1, 0.5450981, 0, 1,
-1.303239, 0.3307245, -0.1455305, 1, 0.5529412, 0, 1,
-1.297319, 1.059035, -1.794994, 1, 0.5568628, 0, 1,
-1.292466, 0.0621021, -1.51341, 1, 0.5647059, 0, 1,
-1.289574, -0.9374493, -2.524452, 1, 0.5686275, 0, 1,
-1.284994, -0.3947071, -3.683519, 1, 0.5764706, 0, 1,
-1.280463, 0.3863967, -1.262306, 1, 0.5803922, 0, 1,
-1.276144, -0.7447951, -3.364871, 1, 0.5882353, 0, 1,
-1.27444, -0.3184094, -1.260953, 1, 0.5921569, 0, 1,
-1.265712, 0.02751584, -1.20721, 1, 0.6, 0, 1,
-1.262289, -0.8370069, -0.7584448, 1, 0.6078432, 0, 1,
-1.261978, -0.3585433, -1.656831, 1, 0.6117647, 0, 1,
-1.259082, 0.4957156, -1.103313, 1, 0.6196079, 0, 1,
-1.256873, 0.1017575, -0.7220926, 1, 0.6235294, 0, 1,
-1.250871, 1.144276, -0.3200938, 1, 0.6313726, 0, 1,
-1.247641, -0.3787284, -1.83113, 1, 0.6352941, 0, 1,
-1.240299, 1.607633, 0.2121447, 1, 0.6431373, 0, 1,
-1.239442, -0.9630015, -1.958489, 1, 0.6470588, 0, 1,
-1.234712, 0.0628132, -0.5415735, 1, 0.654902, 0, 1,
-1.233707, 1.553632, -1.208508, 1, 0.6588235, 0, 1,
-1.233306, 0.9744621, -2.157631, 1, 0.6666667, 0, 1,
-1.233082, -1.702937, -2.00151, 1, 0.6705883, 0, 1,
-1.211772, -0.7288201, -2.02251, 1, 0.6784314, 0, 1,
-1.200197, 1.240091, -1.841286, 1, 0.682353, 0, 1,
-1.183872, 0.1119901, -0.112279, 1, 0.6901961, 0, 1,
-1.176794, 0.8871202, 0.2095329, 1, 0.6941177, 0, 1,
-1.169028, -1.215939, -1.008764, 1, 0.7019608, 0, 1,
-1.168501, 0.7947257, -1.493922, 1, 0.7098039, 0, 1,
-1.156262, -0.2840962, -1.722065, 1, 0.7137255, 0, 1,
-1.146729, -0.3921773, -1.800783, 1, 0.7215686, 0, 1,
-1.143315, -1.155115, -1.775707, 1, 0.7254902, 0, 1,
-1.141917, -0.7199798, -2.689423, 1, 0.7333333, 0, 1,
-1.13476, -0.2070397, -0.5236895, 1, 0.7372549, 0, 1,
-1.134204, 0.4134195, -2.179234, 1, 0.7450981, 0, 1,
-1.130648, -0.1743593, -1.928452, 1, 0.7490196, 0, 1,
-1.125525, 0.3029395, 0.3047822, 1, 0.7568628, 0, 1,
-1.121753, 0.6050445, -2.639338, 1, 0.7607843, 0, 1,
-1.110455, -0.1093411, -2.198167, 1, 0.7686275, 0, 1,
-1.104588, -1.170464, -3.905089, 1, 0.772549, 0, 1,
-1.093881, -0.3343823, -0.7361534, 1, 0.7803922, 0, 1,
-1.087031, -1.037154, -1.424571, 1, 0.7843137, 0, 1,
-1.085932, -0.4707311, -1.38436, 1, 0.7921569, 0, 1,
-1.083456, 0.2568075, -2.484817, 1, 0.7960784, 0, 1,
-1.073068, -0.0273493, -0.8767444, 1, 0.8039216, 0, 1,
-1.071232, -0.3676669, -0.2491875, 1, 0.8117647, 0, 1,
-1.066904, -0.7103845, -1.277051, 1, 0.8156863, 0, 1,
-1.066611, -0.7551581, -0.9551984, 1, 0.8235294, 0, 1,
-1.065388, 1.194895, -0.1504404, 1, 0.827451, 0, 1,
-1.05859, 0.4039877, -1.802208, 1, 0.8352941, 0, 1,
-1.056603, -2.710012, -2.833216, 1, 0.8392157, 0, 1,
-1.05549, -2.100656, -1.6008, 1, 0.8470588, 0, 1,
-1.055002, -0.637539, -2.610148, 1, 0.8509804, 0, 1,
-1.052539, 1.764966, -1.177854, 1, 0.8588235, 0, 1,
-1.05164, -0.552785, -3.520535, 1, 0.8627451, 0, 1,
-1.045936, -0.2312501, -1.514444, 1, 0.8705882, 0, 1,
-1.038666, -2.567415, -1.737077, 1, 0.8745098, 0, 1,
-1.035833, 0.4453894, -0.6359257, 1, 0.8823529, 0, 1,
-1.033424, 0.6103218, -1.428151, 1, 0.8862745, 0, 1,
-1.033399, -0.2621655, -3.239349, 1, 0.8941177, 0, 1,
-1.030362, -1.20188, -2.384226, 1, 0.8980392, 0, 1,
-1.015443, 0.8452548, -1.790924, 1, 0.9058824, 0, 1,
-0.9956954, -1.861567, -2.692916, 1, 0.9137255, 0, 1,
-0.9894792, 1.515042, -0.8361951, 1, 0.9176471, 0, 1,
-0.9877292, 0.1756089, -3.531641, 1, 0.9254902, 0, 1,
-0.98641, 0.1512662, -0.625595, 1, 0.9294118, 0, 1,
-0.9826988, -0.9335727, -1.569166, 1, 0.9372549, 0, 1,
-0.9792604, 0.9032359, -1.259059, 1, 0.9411765, 0, 1,
-0.9764884, -0.4182531, -1.540461, 1, 0.9490196, 0, 1,
-0.9759687, -0.3230834, -1.950127, 1, 0.9529412, 0, 1,
-0.974053, -1.237304, -3.835793, 1, 0.9607843, 0, 1,
-0.9699054, -0.4388518, -0.2280732, 1, 0.9647059, 0, 1,
-0.9670978, 1.874776, 0.9203858, 1, 0.972549, 0, 1,
-0.9664214, -0.3086133, 0.6509924, 1, 0.9764706, 0, 1,
-0.956985, -0.5089231, -3.537076, 1, 0.9843137, 0, 1,
-0.9566464, -0.1397265, -0.8650789, 1, 0.9882353, 0, 1,
-0.9554016, -0.005182371, -1.995843, 1, 0.9960784, 0, 1,
-0.9547947, 1.604992, -1.406981, 0.9960784, 1, 0, 1,
-0.94318, 1.298479, 0.784105, 0.9921569, 1, 0, 1,
-0.9415007, 1.607536, 1.308788, 0.9843137, 1, 0, 1,
-0.9396902, -1.220725, -3.012985, 0.9803922, 1, 0, 1,
-0.9382945, -1.138447, -2.392318, 0.972549, 1, 0, 1,
-0.9267995, 1.524163, -0.2848117, 0.9686275, 1, 0, 1,
-0.926479, 0.03118813, -0.546901, 0.9607843, 1, 0, 1,
-0.9230335, -0.4619687, -1.224245, 0.9568627, 1, 0, 1,
-0.9210685, 0.3308136, -1.786997, 0.9490196, 1, 0, 1,
-0.9203891, 1.781585, -0.7326757, 0.945098, 1, 0, 1,
-0.9189643, 3.844346, -0.4888895, 0.9372549, 1, 0, 1,
-0.9160936, 0.9600804, -1.063296, 0.9333333, 1, 0, 1,
-0.9119641, 0.9180846, -0.04461438, 0.9254902, 1, 0, 1,
-0.9105748, 0.411087, -0.7142873, 0.9215686, 1, 0, 1,
-0.9083403, 1.128759, -1.993968, 0.9137255, 1, 0, 1,
-0.9014911, 0.8963814, -2.498537, 0.9098039, 1, 0, 1,
-0.9010994, 0.8668706, -0.2938919, 0.9019608, 1, 0, 1,
-0.8963717, -1.23775, -1.951349, 0.8941177, 1, 0, 1,
-0.8959983, -0.5740137, -3.470622, 0.8901961, 1, 0, 1,
-0.8954484, 0.2255881, -1.876554, 0.8823529, 1, 0, 1,
-0.8898556, -0.3637901, -1.848906, 0.8784314, 1, 0, 1,
-0.888853, -1.590188, -2.271281, 0.8705882, 1, 0, 1,
-0.8865978, 1.25436, 1.579343, 0.8666667, 1, 0, 1,
-0.8775799, -0.6812786, -1.81753, 0.8588235, 1, 0, 1,
-0.8756814, -0.7732596, -3.991258, 0.854902, 1, 0, 1,
-0.8732679, -0.5033264, -4.63625, 0.8470588, 1, 0, 1,
-0.8727647, -0.6936208, -4.189734, 0.8431373, 1, 0, 1,
-0.8713179, 1.485057, -0.4802572, 0.8352941, 1, 0, 1,
-0.8706384, -0.9129325, -0.9894023, 0.8313726, 1, 0, 1,
-0.8703005, -0.4812843, -2.444535, 0.8235294, 1, 0, 1,
-0.869339, -0.5888746, -2.128521, 0.8196079, 1, 0, 1,
-0.8653456, -0.3898172, -2.97532, 0.8117647, 1, 0, 1,
-0.8567991, -1.027305, -1.136247, 0.8078431, 1, 0, 1,
-0.8391005, -0.6799432, -1.942101, 0.8, 1, 0, 1,
-0.8291218, -1.209202, -3.493325, 0.7921569, 1, 0, 1,
-0.8269112, -1.491288, -3.131493, 0.7882353, 1, 0, 1,
-0.8219678, -0.2490986, -1.497808, 0.7803922, 1, 0, 1,
-0.8168249, 1.345187, 0.9898794, 0.7764706, 1, 0, 1,
-0.8105639, -0.9582403, -3.328946, 0.7686275, 1, 0, 1,
-0.8070487, 0.3938183, 0.5894047, 0.7647059, 1, 0, 1,
-0.8047541, 0.0626884, -1.631055, 0.7568628, 1, 0, 1,
-0.8021893, 1.647655, -1.430307, 0.7529412, 1, 0, 1,
-0.8004061, 0.6666842, -2.934753, 0.7450981, 1, 0, 1,
-0.8002308, -0.9380094, -3.19146, 0.7411765, 1, 0, 1,
-0.7882587, 3.44105, 0.8801993, 0.7333333, 1, 0, 1,
-0.7870222, -1.389132, -2.128035, 0.7294118, 1, 0, 1,
-0.7867467, -0.9538394, -4.046663, 0.7215686, 1, 0, 1,
-0.7855257, -0.445158, -1.997055, 0.7176471, 1, 0, 1,
-0.7832294, -0.4720949, -0.8361173, 0.7098039, 1, 0, 1,
-0.7827606, -0.167986, -2.109012, 0.7058824, 1, 0, 1,
-0.7822281, -0.2526501, -3.293041, 0.6980392, 1, 0, 1,
-0.7814035, 1.845482, -1.036904, 0.6901961, 1, 0, 1,
-0.7754967, 1.719374, -1.254153, 0.6862745, 1, 0, 1,
-0.7752787, 0.3740883, -1.016922, 0.6784314, 1, 0, 1,
-0.7739092, 1.1744, -0.8282052, 0.6745098, 1, 0, 1,
-0.7735956, 1.648629, 0.7901809, 0.6666667, 1, 0, 1,
-0.7664562, -0.8317459, -4.092773, 0.6627451, 1, 0, 1,
-0.7607843, -0.5731541, -2.699105, 0.654902, 1, 0, 1,
-0.7587234, -0.366179, -2.262451, 0.6509804, 1, 0, 1,
-0.7556919, 0.6592156, -0.6374596, 0.6431373, 1, 0, 1,
-0.7506716, 0.976431, 0.02215625, 0.6392157, 1, 0, 1,
-0.7489301, 2.101809, 0.5089324, 0.6313726, 1, 0, 1,
-0.748329, 1.270034, 0.9592564, 0.627451, 1, 0, 1,
-0.7370138, -0.1425427, -0.4963335, 0.6196079, 1, 0, 1,
-0.7338673, -0.6341631, -2.654674, 0.6156863, 1, 0, 1,
-0.7240654, 0.5963775, -1.300075, 0.6078432, 1, 0, 1,
-0.7217775, 0.2895913, -0.9825711, 0.6039216, 1, 0, 1,
-0.7214326, -1.069002, -3.453645, 0.5960785, 1, 0, 1,
-0.7165793, -0.6056212, -1.635753, 0.5882353, 1, 0, 1,
-0.7103944, -0.3093937, -2.851243, 0.5843138, 1, 0, 1,
-0.7089869, -2.033322, -3.48851, 0.5764706, 1, 0, 1,
-0.704996, 0.2622882, -0.4994358, 0.572549, 1, 0, 1,
-0.7047771, 0.6377724, -1.906048, 0.5647059, 1, 0, 1,
-0.7044829, 0.7804841, -1.966574, 0.5607843, 1, 0, 1,
-0.7027177, 2.317542, 0.2496027, 0.5529412, 1, 0, 1,
-0.7006203, 0.9438927, 0.3122032, 0.5490196, 1, 0, 1,
-0.6955954, 0.6103762, 1.146816, 0.5411765, 1, 0, 1,
-0.6950389, 1.346859, -1.888661, 0.5372549, 1, 0, 1,
-0.6909055, -0.302397, -0.9794323, 0.5294118, 1, 0, 1,
-0.6908576, 0.647824, -0.3192258, 0.5254902, 1, 0, 1,
-0.6835421, -1.208795, -1.952198, 0.5176471, 1, 0, 1,
-0.6729855, -0.8229728, -1.182331, 0.5137255, 1, 0, 1,
-0.6722482, 1.129809, -0.4531291, 0.5058824, 1, 0, 1,
-0.6686311, 0.8059083, -0.5699717, 0.5019608, 1, 0, 1,
-0.6667051, 1.287923, -1.576944, 0.4941176, 1, 0, 1,
-0.6631179, -1.581149, -1.151413, 0.4862745, 1, 0, 1,
-0.6630613, -0.5697951, -2.923111, 0.4823529, 1, 0, 1,
-0.6618601, -0.7746357, -3.036422, 0.4745098, 1, 0, 1,
-0.6616526, -1.128769, -2.611912, 0.4705882, 1, 0, 1,
-0.660185, 0.3532388, -1.204325, 0.4627451, 1, 0, 1,
-0.6584603, 1.938866, -0.8557339, 0.4588235, 1, 0, 1,
-0.6539584, 1.80804, -0.8525094, 0.4509804, 1, 0, 1,
-0.6524642, -0.8475437, -1.009405, 0.4470588, 1, 0, 1,
-0.6477062, -1.069509, -2.139595, 0.4392157, 1, 0, 1,
-0.6475903, 0.7121108, 0.2687209, 0.4352941, 1, 0, 1,
-0.6467649, -0.5592378, -1.40819, 0.427451, 1, 0, 1,
-0.6417857, 1.979173, -0.9761932, 0.4235294, 1, 0, 1,
-0.6396221, 1.150581, 0.563716, 0.4156863, 1, 0, 1,
-0.6378686, -0.9795191, -4.650221, 0.4117647, 1, 0, 1,
-0.6351475, -1.070132, -2.685451, 0.4039216, 1, 0, 1,
-0.6315343, 0.73882, -3.907412, 0.3960784, 1, 0, 1,
-0.6295229, -0.07825079, -1.690955, 0.3921569, 1, 0, 1,
-0.6266461, 0.2650763, 1.371502, 0.3843137, 1, 0, 1,
-0.6257412, -0.4965336, -1.760834, 0.3803922, 1, 0, 1,
-0.6214362, 2.139829, 2.165026, 0.372549, 1, 0, 1,
-0.6214336, 1.874874, -1.893034, 0.3686275, 1, 0, 1,
-0.6205866, -0.5018989, -2.469437, 0.3607843, 1, 0, 1,
-0.6184911, 0.4098563, 0.1767814, 0.3568628, 1, 0, 1,
-0.617152, 0.6583184, 0.3638619, 0.3490196, 1, 0, 1,
-0.6151333, 0.7602118, -1.372547, 0.345098, 1, 0, 1,
-0.6108618, -1.077161, -3.080974, 0.3372549, 1, 0, 1,
-0.6084132, 0.05725908, -0.1868224, 0.3333333, 1, 0, 1,
-0.6082052, -0.5121576, -3.322069, 0.3254902, 1, 0, 1,
-0.6070567, -0.3258466, -2.047316, 0.3215686, 1, 0, 1,
-0.6026375, -0.1978099, -1.946071, 0.3137255, 1, 0, 1,
-0.598218, 0.9879514, 0.4705759, 0.3098039, 1, 0, 1,
-0.5971755, -1.711409, -2.942537, 0.3019608, 1, 0, 1,
-0.5903249, 0.1836789, 0.04529488, 0.2941177, 1, 0, 1,
-0.5852702, 0.3996958, 0.3996674, 0.2901961, 1, 0, 1,
-0.5852051, -0.05889829, -1.76806, 0.282353, 1, 0, 1,
-0.5748369, 0.7300686, -0.05184071, 0.2784314, 1, 0, 1,
-0.5671926, 0.2823618, -2.205189, 0.2705882, 1, 0, 1,
-0.5651171, 0.998091, -0.1492225, 0.2666667, 1, 0, 1,
-0.5553157, -1.062648, -3.977902, 0.2588235, 1, 0, 1,
-0.5509533, 0.6380555, 0.5931262, 0.254902, 1, 0, 1,
-0.5457781, -2.006818, -2.974463, 0.2470588, 1, 0, 1,
-0.5454174, 3.427529, -0.3622867, 0.2431373, 1, 0, 1,
-0.5435121, -0.7003601, -2.936266, 0.2352941, 1, 0, 1,
-0.5429574, -0.4812022, -2.799483, 0.2313726, 1, 0, 1,
-0.5400298, -1.271889, -1.054083, 0.2235294, 1, 0, 1,
-0.5375046, -1.808426, -2.770066, 0.2196078, 1, 0, 1,
-0.5355169, 1.589055, -1.444379, 0.2117647, 1, 0, 1,
-0.5319795, 0.2533396, -1.015127, 0.2078431, 1, 0, 1,
-0.5305427, -1.067906, -2.554292, 0.2, 1, 0, 1,
-0.5192751, -1.206922, -3.090019, 0.1921569, 1, 0, 1,
-0.5123246, -1.683029, -2.134912, 0.1882353, 1, 0, 1,
-0.5053802, -1.99114, -2.198266, 0.1803922, 1, 0, 1,
-0.5052634, 0.9711276, -1.762534, 0.1764706, 1, 0, 1,
-0.5037042, 0.671483, -0.5614214, 0.1686275, 1, 0, 1,
-0.4965544, -0.5337284, -3.284904, 0.1647059, 1, 0, 1,
-0.4945538, -1.188008, 0.1249511, 0.1568628, 1, 0, 1,
-0.4938821, 0.447675, -0.5962616, 0.1529412, 1, 0, 1,
-0.491588, -0.2568327, -1.778282, 0.145098, 1, 0, 1,
-0.4839776, 0.5182447, -0.7254615, 0.1411765, 1, 0, 1,
-0.4826195, 0.834662, 0.1023006, 0.1333333, 1, 0, 1,
-0.4819234, -0.005644247, 0.3921906, 0.1294118, 1, 0, 1,
-0.4812544, -1.207679, -1.74196, 0.1215686, 1, 0, 1,
-0.4799441, -0.291634, -3.650071, 0.1176471, 1, 0, 1,
-0.4793099, -0.6524241, -1.291019, 0.1098039, 1, 0, 1,
-0.4782039, -1.050556, -1.481671, 0.1058824, 1, 0, 1,
-0.4775994, -0.2461162, -2.070066, 0.09803922, 1, 0, 1,
-0.4768297, 0.9988271, 0.5367352, 0.09019608, 1, 0, 1,
-0.4745376, 0.4728052, -0.5543811, 0.08627451, 1, 0, 1,
-0.4740317, 0.1580572, -1.842141, 0.07843138, 1, 0, 1,
-0.4731244, -0.4110411, -0.4849228, 0.07450981, 1, 0, 1,
-0.4681529, 0.5183248, -1.352284, 0.06666667, 1, 0, 1,
-0.4600536, -0.7220907, -2.342651, 0.0627451, 1, 0, 1,
-0.4552322, 0.5225474, -2.423272, 0.05490196, 1, 0, 1,
-0.4534649, -0.8746034, -1.320542, 0.05098039, 1, 0, 1,
-0.4492679, -0.08813542, -2.138797, 0.04313726, 1, 0, 1,
-0.4456251, -0.4017508, -1.259358, 0.03921569, 1, 0, 1,
-0.4421886, 0.4937752, 1.222784, 0.03137255, 1, 0, 1,
-0.4398388, -1.751615, -2.486607, 0.02745098, 1, 0, 1,
-0.4380836, -0.1523312, -1.043882, 0.01960784, 1, 0, 1,
-0.4367442, 0.3228942, 0.6840776, 0.01568628, 1, 0, 1,
-0.4358644, -0.2556071, -1.575355, 0.007843138, 1, 0, 1,
-0.4321556, -0.6528473, -3.837156, 0.003921569, 1, 0, 1,
-0.4309233, 0.2184636, -1.154164, 0, 1, 0.003921569, 1,
-0.4278485, 0.05024724, -2.800562, 0, 1, 0.01176471, 1,
-0.4237203, -0.3744937, -3.496451, 0, 1, 0.01568628, 1,
-0.4194633, 0.654434, -0.4385858, 0, 1, 0.02352941, 1,
-0.419321, -0.5309727, -1.756451, 0, 1, 0.02745098, 1,
-0.4176395, -0.7233351, -2.605516, 0, 1, 0.03529412, 1,
-0.4145172, 0.7383142, -0.006618882, 0, 1, 0.03921569, 1,
-0.4109877, 1.776506, -0.5028039, 0, 1, 0.04705882, 1,
-0.410769, 2.134426, -0.870712, 0, 1, 0.05098039, 1,
-0.4097829, -0.9293708, -3.207054, 0, 1, 0.05882353, 1,
-0.4080892, 0.01767085, -0.5001938, 0, 1, 0.0627451, 1,
-0.4033961, 2.167792, -1.5819, 0, 1, 0.07058824, 1,
-0.4016162, -0.972038, -2.732854, 0, 1, 0.07450981, 1,
-0.4013157, -1.18472, -2.644812, 0, 1, 0.08235294, 1,
-0.3982151, -1.947142, -4.028595, 0, 1, 0.08627451, 1,
-0.3964742, 0.2205988, -2.345205, 0, 1, 0.09411765, 1,
-0.3934359, -1.704319, -3.443045, 0, 1, 0.1019608, 1,
-0.3920926, 0.8516922, -0.5808282, 0, 1, 0.1058824, 1,
-0.3917605, 0.1487402, -2.44348, 0, 1, 0.1137255, 1,
-0.3906147, 1.716408, -1.111019, 0, 1, 0.1176471, 1,
-0.3894795, 0.07999341, -1.755801, 0, 1, 0.1254902, 1,
-0.3886516, -0.4600477, -2.919431, 0, 1, 0.1294118, 1,
-0.3880139, -0.7219714, -3.08634, 0, 1, 0.1372549, 1,
-0.3879537, -0.8808854, -2.938215, 0, 1, 0.1411765, 1,
-0.3842794, 2.333942, -0.5059723, 0, 1, 0.1490196, 1,
-0.3838762, -0.5804651, -2.540093, 0, 1, 0.1529412, 1,
-0.382053, -1.661698, -3.622261, 0, 1, 0.1607843, 1,
-0.38031, 0.7730525, -1.918437, 0, 1, 0.1647059, 1,
-0.378268, 0.4320769, -0.9640078, 0, 1, 0.172549, 1,
-0.3771437, -0.5709871, -2.691405, 0, 1, 0.1764706, 1,
-0.372106, -0.9448492, -1.339326, 0, 1, 0.1843137, 1,
-0.3625574, -0.01851141, -1.72351, 0, 1, 0.1882353, 1,
-0.3601565, -2.233038, -3.438681, 0, 1, 0.1960784, 1,
-0.3592566, 0.1708413, -1.209631, 0, 1, 0.2039216, 1,
-0.356764, -1.89486, -3.955343, 0, 1, 0.2078431, 1,
-0.3548666, -0.3794479, -2.599845, 0, 1, 0.2156863, 1,
-0.3522138, -0.7654608, -2.480537, 0, 1, 0.2196078, 1,
-0.3485639, -0.7898775, -2.289857, 0, 1, 0.227451, 1,
-0.3481207, 1.279522, 0.286426, 0, 1, 0.2313726, 1,
-0.3467345, 1.679358, -1.508251, 0, 1, 0.2392157, 1,
-0.341339, -2.058656, -4.017764, 0, 1, 0.2431373, 1,
-0.340036, 0.5953619, -1.384576, 0, 1, 0.2509804, 1,
-0.3377119, 0.7629026, -1.28994, 0, 1, 0.254902, 1,
-0.3341095, 0.01886222, -2.041407, 0, 1, 0.2627451, 1,
-0.3333031, -0.441572, -3.172218, 0, 1, 0.2666667, 1,
-0.3330615, 0.06202002, -0.6658686, 0, 1, 0.2745098, 1,
-0.3260224, 1.323087, -0.4644838, 0, 1, 0.2784314, 1,
-0.3242564, 1.039533, 1.211164, 0, 1, 0.2862745, 1,
-0.3229388, -0.02125889, -0.7442873, 0, 1, 0.2901961, 1,
-0.3228768, 0.6438266, 0.006704167, 0, 1, 0.2980392, 1,
-0.3155314, -1.27169, -4.271301, 0, 1, 0.3058824, 1,
-0.3134993, -0.5126695, -2.336074, 0, 1, 0.3098039, 1,
-0.3097869, -0.6930421, -2.582549, 0, 1, 0.3176471, 1,
-0.3066247, -1.527285, -4.865135, 0, 1, 0.3215686, 1,
-0.3057696, -0.2670079, -2.467895, 0, 1, 0.3294118, 1,
-0.3013218, -0.209773, -1.863437, 0, 1, 0.3333333, 1,
-0.3012159, 0.2912886, 1.277166, 0, 1, 0.3411765, 1,
-0.3004026, 0.3837997, -0.8162464, 0, 1, 0.345098, 1,
-0.298574, -0.8945774, -2.630864, 0, 1, 0.3529412, 1,
-0.2898864, -0.931268, -1.638821, 0, 1, 0.3568628, 1,
-0.2861557, -0.08957256, -0.1107291, 0, 1, 0.3647059, 1,
-0.2782133, -0.3316873, -4.902147, 0, 1, 0.3686275, 1,
-0.2726805, -0.0287052, -0.6437891, 0, 1, 0.3764706, 1,
-0.2726112, -0.6369882, -3.132244, 0, 1, 0.3803922, 1,
-0.2722958, -0.2561416, -1.730193, 0, 1, 0.3882353, 1,
-0.2712691, 1.40618, -0.4688733, 0, 1, 0.3921569, 1,
-0.2694688, -1.32702, -4.187246, 0, 1, 0.4, 1,
-0.2692974, -0.8844027, -3.994614, 0, 1, 0.4078431, 1,
-0.2651275, -2.331379, -3.178612, 0, 1, 0.4117647, 1,
-0.2639845, -0.7188737, -1.112224, 0, 1, 0.4196078, 1,
-0.2630699, -0.7231997, -2.339169, 0, 1, 0.4235294, 1,
-0.2629669, 1.253186, 0.4880485, 0, 1, 0.4313726, 1,
-0.2609063, -0.2986703, -1.906511, 0, 1, 0.4352941, 1,
-0.2543698, -1.409363, -4.799533, 0, 1, 0.4431373, 1,
-0.2537762, -0.7167724, -2.754073, 0, 1, 0.4470588, 1,
-0.2510739, 1.359568, -2.386309, 0, 1, 0.454902, 1,
-0.2501618, -1.323399, -3.747507, 0, 1, 0.4588235, 1,
-0.2482871, 0.3656904, 1.167732, 0, 1, 0.4666667, 1,
-0.2433351, -0.6383381, -5.311805, 0, 1, 0.4705882, 1,
-0.2407293, 0.2628378, -1.989474, 0, 1, 0.4784314, 1,
-0.235018, -1.128201, -3.511254, 0, 1, 0.4823529, 1,
-0.2292866, 0.2119212, -1.197952, 0, 1, 0.4901961, 1,
-0.2289857, 1.24091, -0.04098944, 0, 1, 0.4941176, 1,
-0.2289829, 1.392654, -0.842383, 0, 1, 0.5019608, 1,
-0.2284572, 2.581168, 0.6981442, 0, 1, 0.509804, 1,
-0.2242043, -0.03472763, -5.174115, 0, 1, 0.5137255, 1,
-0.2232488, 0.02713546, -1.832596, 0, 1, 0.5215687, 1,
-0.222331, -0.4761861, -2.342061, 0, 1, 0.5254902, 1,
-0.2219102, 0.3842041, -0.859573, 0, 1, 0.5333334, 1,
-0.2192942, -1.417683, -2.000226, 0, 1, 0.5372549, 1,
-0.2186647, 2.858211, -0.4609176, 0, 1, 0.5450981, 1,
-0.2166225, 0.9707009, 0.5213087, 0, 1, 0.5490196, 1,
-0.2108818, -1.476152, -2.691883, 0, 1, 0.5568628, 1,
-0.2056364, -0.2595746, -2.133893, 0, 1, 0.5607843, 1,
-0.205313, -0.1076582, -3.053112, 0, 1, 0.5686275, 1,
-0.204135, 0.7440929, -0.589716, 0, 1, 0.572549, 1,
-0.2028273, -1.25962, -2.068336, 0, 1, 0.5803922, 1,
-0.2002844, 0.1869852, -0.3372568, 0, 1, 0.5843138, 1,
-0.1964396, -0.08651635, -1.822326, 0, 1, 0.5921569, 1,
-0.1938951, 0.3689795, 0.4185943, 0, 1, 0.5960785, 1,
-0.1926145, 1.757146, 0.5231569, 0, 1, 0.6039216, 1,
-0.1914488, -0.9247717, -2.885922, 0, 1, 0.6117647, 1,
-0.1880364, 0.3692028, -0.9164413, 0, 1, 0.6156863, 1,
-0.1854918, 1.526802, 0.1196266, 0, 1, 0.6235294, 1,
-0.1841877, 0.9780247, -0.9830157, 0, 1, 0.627451, 1,
-0.173094, 1.073953, 0.3558405, 0, 1, 0.6352941, 1,
-0.172355, 0.4774143, -0.9445555, 0, 1, 0.6392157, 1,
-0.1688139, -0.8085923, -2.487775, 0, 1, 0.6470588, 1,
-0.1681355, 1.512086, 0.0270674, 0, 1, 0.6509804, 1,
-0.1676704, -0.2166416, -2.654325, 0, 1, 0.6588235, 1,
-0.161435, 1.513596, -0.5669065, 0, 1, 0.6627451, 1,
-0.1592229, 1.558832, 0.4653883, 0, 1, 0.6705883, 1,
-0.1573436, 0.7630588, -2.622453, 0, 1, 0.6745098, 1,
-0.1558244, 0.2400487, 0.1350981, 0, 1, 0.682353, 1,
-0.154771, -1.014089, -1.288217, 0, 1, 0.6862745, 1,
-0.1499107, 1.184708, -0.1197969, 0, 1, 0.6941177, 1,
-0.1487343, 0.9308503, 0.09561505, 0, 1, 0.7019608, 1,
-0.1479232, -1.929117, -3.184757, 0, 1, 0.7058824, 1,
-0.1452974, 0.4564431, -0.3387335, 0, 1, 0.7137255, 1,
-0.1452338, 0.3292585, -0.5925282, 0, 1, 0.7176471, 1,
-0.143372, 1.34075, -1.709662, 0, 1, 0.7254902, 1,
-0.1413918, -1.11167, -4.702066, 0, 1, 0.7294118, 1,
-0.1380234, 0.4080067, -1.734016, 0, 1, 0.7372549, 1,
-0.1359986, -0.1879086, -2.366377, 0, 1, 0.7411765, 1,
-0.1301282, -0.7938376, -2.799962, 0, 1, 0.7490196, 1,
-0.1282914, 0.2068005, -0.7139444, 0, 1, 0.7529412, 1,
-0.1275948, -1.644565, -3.94181, 0, 1, 0.7607843, 1,
-0.1269411, 0.7756328, -0.1414734, 0, 1, 0.7647059, 1,
-0.1228124, 0.3248548, -3.06817, 0, 1, 0.772549, 1,
-0.1202358, -1.337444, -2.772915, 0, 1, 0.7764706, 1,
-0.1197294, -0.6858546, -0.7976177, 0, 1, 0.7843137, 1,
-0.1187375, -0.1387122, -4.605572, 0, 1, 0.7882353, 1,
-0.1175145, 1.703367, 0.2885881, 0, 1, 0.7960784, 1,
-0.1141263, -0.7237705, -2.466409, 0, 1, 0.8039216, 1,
-0.1116755, 2.499084, -0.6715193, 0, 1, 0.8078431, 1,
-0.1082631, 0.1091354, -1.86196, 0, 1, 0.8156863, 1,
-0.1063153, 0.4486051, -0.4024718, 0, 1, 0.8196079, 1,
-0.105925, -0.8942961, -2.80644, 0, 1, 0.827451, 1,
-0.09674186, -0.5690287, -3.773684, 0, 1, 0.8313726, 1,
-0.09611276, -0.0009514173, -0.4422221, 0, 1, 0.8392157, 1,
-0.09105238, 0.9707485, -0.5953931, 0, 1, 0.8431373, 1,
-0.08964353, -0.6763542, -0.6175666, 0, 1, 0.8509804, 1,
-0.08947209, -0.1216707, -2.86606, 0, 1, 0.854902, 1,
-0.0850942, 1.374665, -0.02748121, 0, 1, 0.8627451, 1,
-0.08139274, 0.6872654, 1.395739, 0, 1, 0.8666667, 1,
-0.08100743, 1.373862, 1.527948, 0, 1, 0.8745098, 1,
-0.07625549, 0.3510657, -0.4849746, 0, 1, 0.8784314, 1,
-0.07230981, 1.816296, -0.6274442, 0, 1, 0.8862745, 1,
-0.06815489, -1.741911, -3.170262, 0, 1, 0.8901961, 1,
-0.06533408, -0.599155, -3.480797, 0, 1, 0.8980392, 1,
-0.06241477, 2.381959, -0.8528565, 0, 1, 0.9058824, 1,
-0.06186317, -0.6253639, -4.003166, 0, 1, 0.9098039, 1,
-0.06175753, 1.029952, -1.214113, 0, 1, 0.9176471, 1,
-0.06059595, -1.093073, -2.646227, 0, 1, 0.9215686, 1,
-0.05378139, 0.3408504, 0.7774459, 0, 1, 0.9294118, 1,
-0.04283488, -0.7147296, -3.241013, 0, 1, 0.9333333, 1,
-0.03938858, 0.9518651, 1.039266, 0, 1, 0.9411765, 1,
-0.03935994, 1.339454, -0.1827813, 0, 1, 0.945098, 1,
-0.03705962, 1.69375, 1.466115, 0, 1, 0.9529412, 1,
-0.03671105, -0.1052599, -4.186179, 0, 1, 0.9568627, 1,
-0.02517877, 0.9940581, -2.200181, 0, 1, 0.9647059, 1,
-0.02486659, -0.8303151, -1.779098, 0, 1, 0.9686275, 1,
-0.02272819, -0.5523131, -2.559351, 0, 1, 0.9764706, 1,
-0.01883062, -0.6437456, -4.198427, 0, 1, 0.9803922, 1,
-0.01559667, -0.3533943, -2.471924, 0, 1, 0.9882353, 1,
-0.01543328, 0.3054065, 0.2891739, 0, 1, 0.9921569, 1,
-0.0135337, 1.017344, 0.6861336, 0, 1, 1, 1,
-0.0135035, 1.631365, 0.02214458, 0, 0.9921569, 1, 1,
-0.01250274, -0.9482476, -4.037956, 0, 0.9882353, 1, 1,
-0.01187503, -0.7470619, -2.7542, 0, 0.9803922, 1, 1,
-0.007540799, 0.0003418409, -0.8289261, 0, 0.9764706, 1, 1,
-0.006396348, 0.3045286, 0.8168153, 0, 0.9686275, 1, 1,
-0.002619498, -1.866703, -2.159514, 0, 0.9647059, 1, 1,
-0.0002806068, -0.3706458, -3.974067, 0, 0.9568627, 1, 1,
-0.0001166917, -1.375515, -3.200108, 0, 0.9529412, 1, 1,
0.002066724, -0.7564611, 2.682372, 0, 0.945098, 1, 1,
0.006064155, -0.3296174, 3.489677, 0, 0.9411765, 1, 1,
0.007042261, 1.029356, 0.07902443, 0, 0.9333333, 1, 1,
0.007369871, -1.329492, 3.457537, 0, 0.9294118, 1, 1,
0.01226235, 0.555861, -2.037391, 0, 0.9215686, 1, 1,
0.01292904, 0.5076178, 0.6221895, 0, 0.9176471, 1, 1,
0.01904523, -1.716985, 4.305955, 0, 0.9098039, 1, 1,
0.01968717, 0.8533866, -1.350301, 0, 0.9058824, 1, 1,
0.02193534, 0.6655731, 0.7204968, 0, 0.8980392, 1, 1,
0.02507756, 0.618486, -0.2298649, 0, 0.8901961, 1, 1,
0.02777739, 0.9635674, -0.1722336, 0, 0.8862745, 1, 1,
0.03431302, -0.3802077, 2.325102, 0, 0.8784314, 1, 1,
0.05076629, -0.2241519, 2.895464, 0, 0.8745098, 1, 1,
0.05176786, -1.506864, 2.974013, 0, 0.8666667, 1, 1,
0.05315688, -0.9141908, 2.230895, 0, 0.8627451, 1, 1,
0.05654424, -0.806733, 3.016605, 0, 0.854902, 1, 1,
0.06399105, 0.9083061, 0.2184, 0, 0.8509804, 1, 1,
0.07498132, -1.22093, 2.803533, 0, 0.8431373, 1, 1,
0.07595468, -0.924818, 4.148418, 0, 0.8392157, 1, 1,
0.0773893, -0.5234384, 3.396607, 0, 0.8313726, 1, 1,
0.08458991, 0.02447383, 1.085672, 0, 0.827451, 1, 1,
0.08561044, 0.7877797, 0.8637273, 0, 0.8196079, 1, 1,
0.08605458, -0.329848, 4.210821, 0, 0.8156863, 1, 1,
0.08939002, 0.9825605, 0.2751884, 0, 0.8078431, 1, 1,
0.08983225, -1.583035, 2.009343, 0, 0.8039216, 1, 1,
0.09155151, 0.35317, -0.7978429, 0, 0.7960784, 1, 1,
0.09194642, 0.1355631, 0.1656659, 0, 0.7882353, 1, 1,
0.0943997, 0.1453752, -0.6272027, 0, 0.7843137, 1, 1,
0.09865241, -0.8927752, 2.937926, 0, 0.7764706, 1, 1,
0.09899478, 0.01759182, 0.2354313, 0, 0.772549, 1, 1,
0.09934887, 0.9920486, -0.09147274, 0, 0.7647059, 1, 1,
0.1002063, -0.7487798, 3.503298, 0, 0.7607843, 1, 1,
0.1015041, 0.8401269, 0.410635, 0, 0.7529412, 1, 1,
0.1018234, -0.8630016, 4.317442, 0, 0.7490196, 1, 1,
0.1020223, 0.9649696, 1.18702, 0, 0.7411765, 1, 1,
0.1029008, 0.732263, 2.563622, 0, 0.7372549, 1, 1,
0.1039861, 0.2426203, 0.5217879, 0, 0.7294118, 1, 1,
0.1053598, -0.6489345, 3.146895, 0, 0.7254902, 1, 1,
0.1063654, 0.1563615, 1.797112, 0, 0.7176471, 1, 1,
0.1078563, -0.5310934, 1.258492, 0, 0.7137255, 1, 1,
0.1215499, -0.3747161, 1.239523, 0, 0.7058824, 1, 1,
0.1223719, 0.05942725, 0.6676185, 0, 0.6980392, 1, 1,
0.1242609, -0.1501988, 1.885453, 0, 0.6941177, 1, 1,
0.1245833, -0.3955299, 3.338377, 0, 0.6862745, 1, 1,
0.132161, -2.07149, 3.609968, 0, 0.682353, 1, 1,
0.1395181, -1.442805, 2.932657, 0, 0.6745098, 1, 1,
0.1431684, -1.850142, 5.079059, 0, 0.6705883, 1, 1,
0.143793, 0.6671277, 0.3160092, 0, 0.6627451, 1, 1,
0.1466312, 0.1905826, 0.3664575, 0, 0.6588235, 1, 1,
0.1466881, -0.3150501, 1.909975, 0, 0.6509804, 1, 1,
0.1491701, -0.02777861, 1.12798, 0, 0.6470588, 1, 1,
0.1498553, 0.8635445, 1.774073, 0, 0.6392157, 1, 1,
0.1520064, -0.8815691, 5.429668, 0, 0.6352941, 1, 1,
0.1540211, -1.846187, 3.763407, 0, 0.627451, 1, 1,
0.1548979, -0.1024176, 3.145639, 0, 0.6235294, 1, 1,
0.1562906, -2.137286, 3.757946, 0, 0.6156863, 1, 1,
0.1612937, -1.538128, 1.201135, 0, 0.6117647, 1, 1,
0.1625141, 0.2530693, 0.4022546, 0, 0.6039216, 1, 1,
0.1685141, 1.235413, -0.2173443, 0, 0.5960785, 1, 1,
0.1709799, 0.53907, 0.7194017, 0, 0.5921569, 1, 1,
0.1744915, -2.159543, 3.513091, 0, 0.5843138, 1, 1,
0.183355, -0.3338597, 2.903955, 0, 0.5803922, 1, 1,
0.1863666, -0.8848748, 1.48958, 0, 0.572549, 1, 1,
0.1871735, -0.415603, 3.614598, 0, 0.5686275, 1, 1,
0.1887864, 1.383564, -2.925591, 0, 0.5607843, 1, 1,
0.1893837, -1.559987, 1.181416, 0, 0.5568628, 1, 1,
0.189778, -0.3273448, 3.64838, 0, 0.5490196, 1, 1,
0.1906445, 1.162331, 0.7605261, 0, 0.5450981, 1, 1,
0.1957056, 2.901548, 0.2493037, 0, 0.5372549, 1, 1,
0.1969704, 0.3932256, 0.1432465, 0, 0.5333334, 1, 1,
0.1970538, 0.152917, 2.155042, 0, 0.5254902, 1, 1,
0.2021283, -0.317212, 2.655113, 0, 0.5215687, 1, 1,
0.2030953, 0.8789289, 0.7104348, 0, 0.5137255, 1, 1,
0.2043547, -0.3618257, 2.489415, 0, 0.509804, 1, 1,
0.2064168, -1.04305, 2.732089, 0, 0.5019608, 1, 1,
0.2091969, -0.7173035, 2.803889, 0, 0.4941176, 1, 1,
0.2120462, -0.9238932, 2.169359, 0, 0.4901961, 1, 1,
0.2127482, 0.3609807, 0.556967, 0, 0.4823529, 1, 1,
0.2146986, -2.089218, 2.827879, 0, 0.4784314, 1, 1,
0.2272913, 1.197707, 0.9983336, 0, 0.4705882, 1, 1,
0.230305, -0.8433429, 2.651194, 0, 0.4666667, 1, 1,
0.23215, 0.2667335, 0.2478487, 0, 0.4588235, 1, 1,
0.2347637, -0.2595926, 0.783142, 0, 0.454902, 1, 1,
0.2358736, 1.099526, -1.380048, 0, 0.4470588, 1, 1,
0.2369281, 0.9609919, 0.5515748, 0, 0.4431373, 1, 1,
0.2384674, 1.308776, 0.7590439, 0, 0.4352941, 1, 1,
0.2398503, -1.520343, 2.721252, 0, 0.4313726, 1, 1,
0.2421015, 0.8016089, 1.666562, 0, 0.4235294, 1, 1,
0.2425023, 0.6004518, 0.03395744, 0, 0.4196078, 1, 1,
0.2453126, 0.6510643, 0.6668081, 0, 0.4117647, 1, 1,
0.2542795, 1.426917, -0.0794577, 0, 0.4078431, 1, 1,
0.2571407, -1.276972, 1.837995, 0, 0.4, 1, 1,
0.2599058, -0.05561763, 2.077986, 0, 0.3921569, 1, 1,
0.2601279, 1.702608, 0.4272898, 0, 0.3882353, 1, 1,
0.2611572, -1.367337, 3.441987, 0, 0.3803922, 1, 1,
0.2646899, 1.333225, 2.186659, 0, 0.3764706, 1, 1,
0.2659788, -0.2414553, 2.091235, 0, 0.3686275, 1, 1,
0.2677889, 0.1373766, 1.813837, 0, 0.3647059, 1, 1,
0.268469, -0.6620575, 3.074536, 0, 0.3568628, 1, 1,
0.2714382, -0.9689132, 2.317655, 0, 0.3529412, 1, 1,
0.2744296, 1.252244, 1.399698, 0, 0.345098, 1, 1,
0.2744856, -0.4368188, 3.273398, 0, 0.3411765, 1, 1,
0.2805946, 0.1245486, 0.5834787, 0, 0.3333333, 1, 1,
0.2868086, -1.644761, 4.002969, 0, 0.3294118, 1, 1,
0.2892047, 0.8661115, 1.129392, 0, 0.3215686, 1, 1,
0.2916372, -0.7573535, 1.790284, 0, 0.3176471, 1, 1,
0.2918372, -2.152676, 1.3678, 0, 0.3098039, 1, 1,
0.292729, 0.5675055, -1.253236, 0, 0.3058824, 1, 1,
0.2981035, 0.5929061, 0.1359095, 0, 0.2980392, 1, 1,
0.2998462, -0.3067438, 2.911382, 0, 0.2901961, 1, 1,
0.3000509, 0.9997986, -2.212827, 0, 0.2862745, 1, 1,
0.3011969, -1.354604, 1.422026, 0, 0.2784314, 1, 1,
0.3095083, -0.1476531, 2.037037, 0, 0.2745098, 1, 1,
0.3129623, 1.163561, 1.103782, 0, 0.2666667, 1, 1,
0.3164578, 1.691437, 3.295456, 0, 0.2627451, 1, 1,
0.3169773, -1.433023, 2.156328, 0, 0.254902, 1, 1,
0.320304, -0.537912, 0.3848854, 0, 0.2509804, 1, 1,
0.323064, -0.1394673, 1.466713, 0, 0.2431373, 1, 1,
0.3258399, -0.9477203, 1.905845, 0, 0.2392157, 1, 1,
0.3284346, -0.6551751, 2.679458, 0, 0.2313726, 1, 1,
0.329987, -0.296385, 2.914673, 0, 0.227451, 1, 1,
0.3307779, 1.873354, 0.2265272, 0, 0.2196078, 1, 1,
0.3345661, 0.2326689, 2.697865, 0, 0.2156863, 1, 1,
0.3363321, 1.152904, 0.5621589, 0, 0.2078431, 1, 1,
0.3382443, 0.1801666, -0.4805879, 0, 0.2039216, 1, 1,
0.3383857, -0.3166161, 3.105613, 0, 0.1960784, 1, 1,
0.3394234, 0.7536293, -0.3150061, 0, 0.1882353, 1, 1,
0.3416558, 0.4799375, 1.304167, 0, 0.1843137, 1, 1,
0.3430326, 1.02636, 0.5538987, 0, 0.1764706, 1, 1,
0.3438607, -0.8003358, 3.467174, 0, 0.172549, 1, 1,
0.3456966, 0.5346448, 0.969043, 0, 0.1647059, 1, 1,
0.3480619, 0.5642184, 0.3928346, 0, 0.1607843, 1, 1,
0.348615, 1.008133, 1.818445, 0, 0.1529412, 1, 1,
0.3540219, 1.336368, 1.986104, 0, 0.1490196, 1, 1,
0.3669836, 1.847366, -1.126446, 0, 0.1411765, 1, 1,
0.3684124, 0.3618195, 1.202184, 0, 0.1372549, 1, 1,
0.3685343, -0.5240179, 0.6730633, 0, 0.1294118, 1, 1,
0.3719637, 1.207277, 0.3749458, 0, 0.1254902, 1, 1,
0.3734535, -0.3045751, 2.453727, 0, 0.1176471, 1, 1,
0.3753056, 0.3988903, 0.4362927, 0, 0.1137255, 1, 1,
0.3810319, -0.5561839, 1.874096, 0, 0.1058824, 1, 1,
0.3818039, 0.9612959, 1.363234, 0, 0.09803922, 1, 1,
0.3836012, 0.4280654, 0.8883442, 0, 0.09411765, 1, 1,
0.383639, -0.7148156, 1.158462, 0, 0.08627451, 1, 1,
0.3862954, -0.5583149, 2.639986, 0, 0.08235294, 1, 1,
0.3888676, 1.696328, 2.13784, 0, 0.07450981, 1, 1,
0.3913457, 0.4064386, 1.828421, 0, 0.07058824, 1, 1,
0.4025619, -1.422036, 2.740925, 0, 0.0627451, 1, 1,
0.4056252, 0.349983, 1.351408, 0, 0.05882353, 1, 1,
0.4119042, -2.062079, 2.260539, 0, 0.05098039, 1, 1,
0.4142165, 3.052464, -1.032438, 0, 0.04705882, 1, 1,
0.4154472, 0.4190304, 1.340454, 0, 0.03921569, 1, 1,
0.4178045, -1.095801, 3.61934, 0, 0.03529412, 1, 1,
0.4180756, 2.034477, 0.4143991, 0, 0.02745098, 1, 1,
0.4260385, -0.5019887, 3.130387, 0, 0.02352941, 1, 1,
0.4262009, -3.298011, 3.816405, 0, 0.01568628, 1, 1,
0.4293514, -0.8106308, 2.923085, 0, 0.01176471, 1, 1,
0.439685, -0.4548958, 3.47147, 0, 0.003921569, 1, 1,
0.4406399, 2.260715, 0.6169289, 0.003921569, 0, 1, 1,
0.4426695, 0.2457819, -0.03514906, 0.007843138, 0, 1, 1,
0.4438205, 0.5553235, -1.022601, 0.01568628, 0, 1, 1,
0.4442614, -0.5613754, 3.085688, 0.01960784, 0, 1, 1,
0.4482659, 0.8852541, -1.449, 0.02745098, 0, 1, 1,
0.4497622, -0.0189287, 2.412902, 0.03137255, 0, 1, 1,
0.4506854, 0.04747196, 1.031002, 0.03921569, 0, 1, 1,
0.4512124, 1.187602, 1.511423, 0.04313726, 0, 1, 1,
0.455541, 1.902158, -0.1805594, 0.05098039, 0, 1, 1,
0.4571178, -0.3931509, 3.903566, 0.05490196, 0, 1, 1,
0.4603, 0.953883, 2.096336, 0.0627451, 0, 1, 1,
0.463497, 0.3180346, 1.531527, 0.06666667, 0, 1, 1,
0.4692348, 0.6596, -0.2731133, 0.07450981, 0, 1, 1,
0.4721471, -0.05703925, 2.833339, 0.07843138, 0, 1, 1,
0.4748008, -0.4093941, 2.298341, 0.08627451, 0, 1, 1,
0.4808012, -0.3002315, 3.182744, 0.09019608, 0, 1, 1,
0.4812178, -0.3960363, 2.645156, 0.09803922, 0, 1, 1,
0.4820574, -0.507411, 1.954506, 0.1058824, 0, 1, 1,
0.486122, -0.2483041, 1.519379, 0.1098039, 0, 1, 1,
0.4877283, 0.5039896, 1.372188, 0.1176471, 0, 1, 1,
0.4902304, 0.2407673, 0.5191416, 0.1215686, 0, 1, 1,
0.4957216, 1.002828, 2.856616, 0.1294118, 0, 1, 1,
0.4976959, 0.3837687, 1.240118, 0.1333333, 0, 1, 1,
0.4988133, -2.117661, 2.85094, 0.1411765, 0, 1, 1,
0.5006682, 1.209101, -2.442425, 0.145098, 0, 1, 1,
0.5024061, 0.7868235, 1.529986, 0.1529412, 0, 1, 1,
0.5050278, 0.904224, 0.2510593, 0.1568628, 0, 1, 1,
0.5157301, 1.622085, 0.2013331, 0.1647059, 0, 1, 1,
0.5346081, -0.4314468, 0.7013111, 0.1686275, 0, 1, 1,
0.5415756, 0.2995608, -0.8425324, 0.1764706, 0, 1, 1,
0.5464914, -1.113718, 1.690579, 0.1803922, 0, 1, 1,
0.5478151, 0.04619041, 1.553347, 0.1882353, 0, 1, 1,
0.5493346, -0.6000364, 2.855822, 0.1921569, 0, 1, 1,
0.5495953, -0.4777641, 0.3965761, 0.2, 0, 1, 1,
0.5540882, 0.2078764, -0.895062, 0.2078431, 0, 1, 1,
0.5600999, 1.17662, -0.2640651, 0.2117647, 0, 1, 1,
0.5673178, -0.5549898, 3.492631, 0.2196078, 0, 1, 1,
0.5726848, -0.05994597, 2.299587, 0.2235294, 0, 1, 1,
0.5738111, 0.05811771, 1.471066, 0.2313726, 0, 1, 1,
0.5807908, -0.534574, 2.543264, 0.2352941, 0, 1, 1,
0.5815616, 0.3419613, 2.481941, 0.2431373, 0, 1, 1,
0.5835555, -0.4119985, 2.569482, 0.2470588, 0, 1, 1,
0.5900201, -0.918559, 2.82252, 0.254902, 0, 1, 1,
0.5910638, -0.01614356, 0.992596, 0.2588235, 0, 1, 1,
0.5915899, -0.3782531, 2.895648, 0.2666667, 0, 1, 1,
0.6002673, -0.7316399, 3.736151, 0.2705882, 0, 1, 1,
0.612719, 0.07854354, 0.6454669, 0.2784314, 0, 1, 1,
0.6129977, -1.236426, 3.381905, 0.282353, 0, 1, 1,
0.6142856, -0.3164721, 2.326921, 0.2901961, 0, 1, 1,
0.6165763, 0.6074775, 0.7228276, 0.2941177, 0, 1, 1,
0.6209542, 0.24909, 1.308336, 0.3019608, 0, 1, 1,
0.6227764, 1.417412, -0.286034, 0.3098039, 0, 1, 1,
0.6238181, -2.222444, 4.483888, 0.3137255, 0, 1, 1,
0.6240082, 0.1680665, 1.627569, 0.3215686, 0, 1, 1,
0.6247933, 0.8540445, 0.2893083, 0.3254902, 0, 1, 1,
0.6257836, -0.1006629, 1.650388, 0.3333333, 0, 1, 1,
0.6332203, -2.582249, 3.209731, 0.3372549, 0, 1, 1,
0.6349718, 0.6562705, -0.5854881, 0.345098, 0, 1, 1,
0.6405062, 0.2639003, 0.4755131, 0.3490196, 0, 1, 1,
0.6504808, -0.1757932, 1.876628, 0.3568628, 0, 1, 1,
0.6519492, 0.8895859, -0.3305064, 0.3607843, 0, 1, 1,
0.6571421, -0.158238, 3.111855, 0.3686275, 0, 1, 1,
0.6604713, -3.33459, 1.146192, 0.372549, 0, 1, 1,
0.6625348, -0.09563257, 2.062423, 0.3803922, 0, 1, 1,
0.6673839, 1.221202, 0.7110131, 0.3843137, 0, 1, 1,
0.673223, 2.064761, 1.312736, 0.3921569, 0, 1, 1,
0.676032, 1.395475, 2.684264, 0.3960784, 0, 1, 1,
0.6777567, -0.9982596, 3.655352, 0.4039216, 0, 1, 1,
0.6800635, -0.8494024, 1.354058, 0.4117647, 0, 1, 1,
0.6815373, -1.045228, 1.770616, 0.4156863, 0, 1, 1,
0.6856854, 0.8390836, -1.218759, 0.4235294, 0, 1, 1,
0.6866048, 0.3701863, 0.02720935, 0.427451, 0, 1, 1,
0.6935023, -0.7166573, 1.378641, 0.4352941, 0, 1, 1,
0.6942779, 0.05580818, 1.551658, 0.4392157, 0, 1, 1,
0.6952785, 1.370697, 1.479793, 0.4470588, 0, 1, 1,
0.6972705, -0.645314, 0.744552, 0.4509804, 0, 1, 1,
0.7091387, -0.6129962, 2.745065, 0.4588235, 0, 1, 1,
0.7229189, 0.4519613, 0.1424923, 0.4627451, 0, 1, 1,
0.7256421, -1.201171, 2.425107, 0.4705882, 0, 1, 1,
0.7271815, 0.8580838, 1.708879, 0.4745098, 0, 1, 1,
0.7282984, -0.1804673, 3.409572, 0.4823529, 0, 1, 1,
0.7285678, -0.2288321, 3.299979, 0.4862745, 0, 1, 1,
0.7313041, -0.8368196, 3.508571, 0.4941176, 0, 1, 1,
0.7327768, -1.353399, 0.9921478, 0.5019608, 0, 1, 1,
0.7339208, -0.9228987, 0.3588719, 0.5058824, 0, 1, 1,
0.7381148, 0.4223019, 0.3650905, 0.5137255, 0, 1, 1,
0.7389163, -0.3114506, 0.7107623, 0.5176471, 0, 1, 1,
0.7399703, 0.5038404, 1.086073, 0.5254902, 0, 1, 1,
0.7409207, -1.402341, 2.616017, 0.5294118, 0, 1, 1,
0.7417989, -0.4954079, 4.398056, 0.5372549, 0, 1, 1,
0.7423369, 0.7381549, -0.2586849, 0.5411765, 0, 1, 1,
0.7499644, -0.620603, 2.469234, 0.5490196, 0, 1, 1,
0.7507085, -0.08390178, 1.383692, 0.5529412, 0, 1, 1,
0.7528007, -0.5087911, 2.172977, 0.5607843, 0, 1, 1,
0.7531326, 0.1075433, 0.1139077, 0.5647059, 0, 1, 1,
0.7555397, -0.7863094, 1.039428, 0.572549, 0, 1, 1,
0.755572, -0.6783966, 2.133922, 0.5764706, 0, 1, 1,
0.7635475, 0.6947832, 0.8230086, 0.5843138, 0, 1, 1,
0.7637336, 0.5126847, -0.1095854, 0.5882353, 0, 1, 1,
0.7642532, 0.7725909, 1.225987, 0.5960785, 0, 1, 1,
0.7660447, 1.384405, 0.3878769, 0.6039216, 0, 1, 1,
0.7678664, -1.077706, 2.708425, 0.6078432, 0, 1, 1,
0.7686063, 0.8927948, -0.4013495, 0.6156863, 0, 1, 1,
0.770731, 0.1128847, 0.8388375, 0.6196079, 0, 1, 1,
0.7743152, -1.483984, 2.837565, 0.627451, 0, 1, 1,
0.774617, 1.265628, -0.3272977, 0.6313726, 0, 1, 1,
0.7768327, -0.3245679, 2.302537, 0.6392157, 0, 1, 1,
0.7772504, -1.394995, 2.247536, 0.6431373, 0, 1, 1,
0.7808511, 0.8128711, 1.77452, 0.6509804, 0, 1, 1,
0.7814242, 0.8606172, 1.341533, 0.654902, 0, 1, 1,
0.7831272, -0.4849222, 1.458125, 0.6627451, 0, 1, 1,
0.7909961, -0.4240688, 2.429866, 0.6666667, 0, 1, 1,
0.7946044, 0.3563712, 1.386162, 0.6745098, 0, 1, 1,
0.7955059, 1.072843, 0.176746, 0.6784314, 0, 1, 1,
0.7977256, 1.247825, 2.130161, 0.6862745, 0, 1, 1,
0.7982203, 0.7122278, 1.816518, 0.6901961, 0, 1, 1,
0.8054596, 1.022995, 0.7212321, 0.6980392, 0, 1, 1,
0.8158811, 1.089234, -0.04424965, 0.7058824, 0, 1, 1,
0.8190839, 1.237736, 2.855838, 0.7098039, 0, 1, 1,
0.8191115, 2.574236, 1.649839, 0.7176471, 0, 1, 1,
0.8192075, 0.565016, 1.587079, 0.7215686, 0, 1, 1,
0.819523, 0.9503174, -0.5724363, 0.7294118, 0, 1, 1,
0.8229847, -0.5776874, 1.058027, 0.7333333, 0, 1, 1,
0.8259599, -0.90284, 3.182099, 0.7411765, 0, 1, 1,
0.8261654, -1.250714, 0.1223147, 0.7450981, 0, 1, 1,
0.8274125, -0.07457296, 1.851455, 0.7529412, 0, 1, 1,
0.8304352, 0.2432511, 1.228098, 0.7568628, 0, 1, 1,
0.8372379, -0.8694177, 0.06501722, 0.7647059, 0, 1, 1,
0.8383949, -0.03908743, 2.246265, 0.7686275, 0, 1, 1,
0.8387965, -1.016599, 1.540998, 0.7764706, 0, 1, 1,
0.8397824, -0.6960742, 3.717309, 0.7803922, 0, 1, 1,
0.8415651, 2.590325, 1.103033, 0.7882353, 0, 1, 1,
0.8416206, -2.374079, 2.088575, 0.7921569, 0, 1, 1,
0.8489931, -0.5646374, 2.417801, 0.8, 0, 1, 1,
0.8508772, 0.2011666, -0.9913918, 0.8078431, 0, 1, 1,
0.8509871, -0.8003653, 1.797259, 0.8117647, 0, 1, 1,
0.8513106, -0.4028926, 2.486634, 0.8196079, 0, 1, 1,
0.8567022, 0.08968919, 3.244156, 0.8235294, 0, 1, 1,
0.8567795, 1.629564, -0.9622977, 0.8313726, 0, 1, 1,
0.8582878, 0.6276691, 0.3143066, 0.8352941, 0, 1, 1,
0.8598527, 0.1124145, 1.164061, 0.8431373, 0, 1, 1,
0.8641514, 0.4509151, 2.364159, 0.8470588, 0, 1, 1,
0.8831286, -0.01762519, 3.843463, 0.854902, 0, 1, 1,
0.8885345, -0.7029304, 1.818575, 0.8588235, 0, 1, 1,
0.8916491, -0.5749651, 0.2962473, 0.8666667, 0, 1, 1,
0.898323, 0.6615247, 1.703117, 0.8705882, 0, 1, 1,
0.8991447, -1.131115, 2.814656, 0.8784314, 0, 1, 1,
0.9053772, 0.4461139, 2.853585, 0.8823529, 0, 1, 1,
0.9059201, 0.3829146, 0.971561, 0.8901961, 0, 1, 1,
0.9077006, 0.4888208, 1.815942, 0.8941177, 0, 1, 1,
0.9078223, 0.9690331, -0.6116376, 0.9019608, 0, 1, 1,
0.9115005, -0.1592089, 0.4758733, 0.9098039, 0, 1, 1,
0.9146677, 0.1559344, 3.316479, 0.9137255, 0, 1, 1,
0.9163587, -1.194631, 2.284024, 0.9215686, 0, 1, 1,
0.9188836, 0.3559775, 0.9901191, 0.9254902, 0, 1, 1,
0.9202151, 1.212737, 0.3757814, 0.9333333, 0, 1, 1,
0.924634, -0.1938899, 3.400181, 0.9372549, 0, 1, 1,
0.9281999, -0.9533207, 3.356824, 0.945098, 0, 1, 1,
0.9291392, -0.3864767, 2.733235, 0.9490196, 0, 1, 1,
0.9298293, -2.132295, 3.413975, 0.9568627, 0, 1, 1,
0.9301847, 0.3157096, 0.7437217, 0.9607843, 0, 1, 1,
0.9405946, 0.2906354, 2.026129, 0.9686275, 0, 1, 1,
0.9432411, -0.2195917, 4.1482, 0.972549, 0, 1, 1,
0.9481127, 1.613325, -1.081022, 0.9803922, 0, 1, 1,
0.9487215, 0.2100715, 1.558035, 0.9843137, 0, 1, 1,
0.9508886, 0.2506404, 1.654965, 0.9921569, 0, 1, 1,
0.9533707, 0.8088867, -0.5412872, 0.9960784, 0, 1, 1,
0.9572302, -0.1429132, 2.925918, 1, 0, 0.9960784, 1,
0.9602516, 0.338178, 0.07549258, 1, 0, 0.9882353, 1,
0.9670424, 0.5413454, 4.502364, 1, 0, 0.9843137, 1,
0.9724049, 0.4177273, 1.291805, 1, 0, 0.9764706, 1,
0.9755156, 0.5456201, -0.1581112, 1, 0, 0.972549, 1,
0.9829062, -0.6588776, 1.266098, 1, 0, 0.9647059, 1,
0.9839898, 0.1773209, 0.1556384, 1, 0, 0.9607843, 1,
0.9890124, 1.280039, -0.3078962, 1, 0, 0.9529412, 1,
0.9947627, 0.4533904, 1.001456, 1, 0, 0.9490196, 1,
0.9966543, 0.5577562, 1.745077, 1, 0, 0.9411765, 1,
1.000695, 0.3004496, 1.511412, 1, 0, 0.9372549, 1,
1.006023, -2.68126, 2.291264, 1, 0, 0.9294118, 1,
1.01, -0.9684181, 2.790145, 1, 0, 0.9254902, 1,
1.011788, 0.347774, 1.468019, 1, 0, 0.9176471, 1,
1.024634, -0.9560136, 2.825127, 1, 0, 0.9137255, 1,
1.02907, 0.6530344, 2.938441, 1, 0, 0.9058824, 1,
1.034439, 0.6713102, -0.8266248, 1, 0, 0.9019608, 1,
1.035588, -1.15938, 3.270001, 1, 0, 0.8941177, 1,
1.039097, 0.7597672, 1.142308, 1, 0, 0.8862745, 1,
1.042062, -1.834279, 2.49109, 1, 0, 0.8823529, 1,
1.042868, 0.9665253, 0.2471878, 1, 0, 0.8745098, 1,
1.043865, 0.6843541, 0.9076816, 1, 0, 0.8705882, 1,
1.048125, -0.1575791, 1.006405, 1, 0, 0.8627451, 1,
1.053992, 0.2115701, 2.027825, 1, 0, 0.8588235, 1,
1.05746, 0.315527, 1.750573, 1, 0, 0.8509804, 1,
1.058178, 0.8052847, 1.537258, 1, 0, 0.8470588, 1,
1.064753, 0.4787223, 0.8898857, 1, 0, 0.8392157, 1,
1.067821, -0.3874173, 4.057459, 1, 0, 0.8352941, 1,
1.076148, -0.1166032, 2.590208, 1, 0, 0.827451, 1,
1.077457, 1.371075, 0.6451518, 1, 0, 0.8235294, 1,
1.077563, -0.3847076, 1.352533, 1, 0, 0.8156863, 1,
1.079395, -1.363446, 1.669385, 1, 0, 0.8117647, 1,
1.081389, -0.7599999, 1.40277, 1, 0, 0.8039216, 1,
1.084348, -0.5158135, 1.400601, 1, 0, 0.7960784, 1,
1.090623, 0.4158231, 1.035704, 1, 0, 0.7921569, 1,
1.091277, 1.361624, 0.1501416, 1, 0, 0.7843137, 1,
1.093967, -0.09084915, 1.589685, 1, 0, 0.7803922, 1,
1.114495, 0.09373761, 1.403837, 1, 0, 0.772549, 1,
1.119359, 2.486907, 1.248707, 1, 0, 0.7686275, 1,
1.123006, 0.9879378, 2.451617, 1, 0, 0.7607843, 1,
1.123353, 0.5762731, 1.706721, 1, 0, 0.7568628, 1,
1.130769, -0.7120515, 2.050445, 1, 0, 0.7490196, 1,
1.132521, -0.5297375, 2.426893, 1, 0, 0.7450981, 1,
1.136553, -1.657206, 1.857357, 1, 0, 0.7372549, 1,
1.141318, -1.027682, 2.368283, 1, 0, 0.7333333, 1,
1.142234, 0.6762379, -0.3007452, 1, 0, 0.7254902, 1,
1.143427, -0.2446638, 3.757066, 1, 0, 0.7215686, 1,
1.145329, -2.066756, 1.092567, 1, 0, 0.7137255, 1,
1.165024, -0.1748006, 1.199126, 1, 0, 0.7098039, 1,
1.168468, -1.335705, 1.745833, 1, 0, 0.7019608, 1,
1.171304, 0.8247536, -0.01194043, 1, 0, 0.6941177, 1,
1.173129, 0.6497688, 1.191195, 1, 0, 0.6901961, 1,
1.189445, -2.167507, 3.539999, 1, 0, 0.682353, 1,
1.206241, 0.9659459, 1.02889, 1, 0, 0.6784314, 1,
1.210934, 0.8063212, 1.01944, 1, 0, 0.6705883, 1,
1.212161, 0.9133394, 0.2679549, 1, 0, 0.6666667, 1,
1.213532, -0.06592061, 0.3769119, 1, 0, 0.6588235, 1,
1.218235, -0.2671645, 0.2079374, 1, 0, 0.654902, 1,
1.218831, -0.5006458, 1.801322, 1, 0, 0.6470588, 1,
1.222418, -0.2602928, 1.127592, 1, 0, 0.6431373, 1,
1.231218, -0.2410959, 0.4590286, 1, 0, 0.6352941, 1,
1.234086, -0.4116004, 1.94188, 1, 0, 0.6313726, 1,
1.235072, -0.8126959, 1.615416, 1, 0, 0.6235294, 1,
1.235212, -1.078712, 3.462003, 1, 0, 0.6196079, 1,
1.248463, 0.5500865, 2.753707, 1, 0, 0.6117647, 1,
1.251799, 1.430147, 0.5704554, 1, 0, 0.6078432, 1,
1.256304, -0.2875694, 2.887154, 1, 0, 0.6, 1,
1.259219, 0.08787419, -0.2077637, 1, 0, 0.5921569, 1,
1.260781, -0.5868368, 3.974528, 1, 0, 0.5882353, 1,
1.262098, -0.0701073, 1.489806, 1, 0, 0.5803922, 1,
1.267103, -0.03719605, 0.6296383, 1, 0, 0.5764706, 1,
1.270714, 0.008853292, 1.381108, 1, 0, 0.5686275, 1,
1.286307, 0.4240645, 1.801198, 1, 0, 0.5647059, 1,
1.289123, -0.5036637, 2.587594, 1, 0, 0.5568628, 1,
1.291824, 0.09400992, 1.70273, 1, 0, 0.5529412, 1,
1.293754, -1.166799, 2.204109, 1, 0, 0.5450981, 1,
1.295048, -0.9437748, 1.337355, 1, 0, 0.5411765, 1,
1.316762, 0.2196338, 3.094237, 1, 0, 0.5333334, 1,
1.319721, -0.2288533, 1.620836, 1, 0, 0.5294118, 1,
1.326012, -0.3694367, 1.951535, 1, 0, 0.5215687, 1,
1.330723, 1.705015, 0.8986492, 1, 0, 0.5176471, 1,
1.336818, 0.2429049, 0.4816756, 1, 0, 0.509804, 1,
1.34349, 0.02791198, 1.231629, 1, 0, 0.5058824, 1,
1.347151, 1.322125, 1.788883, 1, 0, 0.4980392, 1,
1.352341, -0.3362633, 0.8875495, 1, 0, 0.4901961, 1,
1.356549, 0.1742961, 3.724871, 1, 0, 0.4862745, 1,
1.357403, -1.64845, 3.991583, 1, 0, 0.4784314, 1,
1.360397, -0.8338583, 1.892673, 1, 0, 0.4745098, 1,
1.378333, 1.472628, -0.9271502, 1, 0, 0.4666667, 1,
1.38028, 0.6469882, 0.3822632, 1, 0, 0.4627451, 1,
1.397734, -1.354051, 4.112928, 1, 0, 0.454902, 1,
1.400604, -0.1293079, 1.693652, 1, 0, 0.4509804, 1,
1.400879, -0.2357718, 0.236057, 1, 0, 0.4431373, 1,
1.427235, -0.4048221, 1.155064, 1, 0, 0.4392157, 1,
1.430164, -0.1124087, 1.720262, 1, 0, 0.4313726, 1,
1.43051, -1.348539, 0.9128576, 1, 0, 0.427451, 1,
1.439611, 0.5043823, 1.155104, 1, 0, 0.4196078, 1,
1.446449, 0.9110473, 0.5623884, 1, 0, 0.4156863, 1,
1.467393, 0.474289, 1.055166, 1, 0, 0.4078431, 1,
1.47328, 1.209666, 2.438998, 1, 0, 0.4039216, 1,
1.47351, -0.7310146, 2.994107, 1, 0, 0.3960784, 1,
1.484803, -1.107673, 3.30946, 1, 0, 0.3882353, 1,
1.490892, 0.4449671, 1.416579, 1, 0, 0.3843137, 1,
1.496252, 0.4344154, 0.6298152, 1, 0, 0.3764706, 1,
1.507645, -0.2194462, 2.263053, 1, 0, 0.372549, 1,
1.511653, 2.375005, 1.016372, 1, 0, 0.3647059, 1,
1.51609, 0.757001, 2.754075, 1, 0, 0.3607843, 1,
1.526133, 0.1617346, 1.845682, 1, 0, 0.3529412, 1,
1.528917, -0.5250751, 1.213731, 1, 0, 0.3490196, 1,
1.531826, -0.5503297, 3.58297, 1, 0, 0.3411765, 1,
1.53323, -0.9953875, 2.078639, 1, 0, 0.3372549, 1,
1.552842, 1.188985, 1.99004, 1, 0, 0.3294118, 1,
1.559328, -1.712456, 3.466956, 1, 0, 0.3254902, 1,
1.562994, 1.251612, 1.542992, 1, 0, 0.3176471, 1,
1.588796, 0.6667809, 0.7941391, 1, 0, 0.3137255, 1,
1.597558, 1.249282, -0.5209571, 1, 0, 0.3058824, 1,
1.599548, 0.4096752, 1.07112, 1, 0, 0.2980392, 1,
1.608148, -0.1773362, 3.40371, 1, 0, 0.2941177, 1,
1.612625, 0.6068901, 2.885806, 1, 0, 0.2862745, 1,
1.615372, -0.6007058, 1.444211, 1, 0, 0.282353, 1,
1.617897, -0.01702537, 1.111694, 1, 0, 0.2745098, 1,
1.624509, -0.09774517, 2.878202, 1, 0, 0.2705882, 1,
1.646844, -0.5259138, 1.713874, 1, 0, 0.2627451, 1,
1.647537, -1.477211, 2.368236, 1, 0, 0.2588235, 1,
1.648541, 0.8018351, 2.619379, 1, 0, 0.2509804, 1,
1.657359, -1.373455, 3.473378, 1, 0, 0.2470588, 1,
1.66894, -0.9284734, 2.368654, 1, 0, 0.2392157, 1,
1.703474, 1.413754, -0.08851473, 1, 0, 0.2352941, 1,
1.704518, 0.949674, 2.175233, 1, 0, 0.227451, 1,
1.706536, 0.5803583, 1.556184, 1, 0, 0.2235294, 1,
1.738968, 1.348735, 1.271239, 1, 0, 0.2156863, 1,
1.748749, 0.4885187, 0.9633954, 1, 0, 0.2117647, 1,
1.782619, -0.7244931, 2.525105, 1, 0, 0.2039216, 1,
1.785498, -1.035165, 4.38672, 1, 0, 0.1960784, 1,
1.79155, -0.02259883, 1.531195, 1, 0, 0.1921569, 1,
1.842925, -0.02520728, 1.215017, 1, 0, 0.1843137, 1,
1.84851, -0.7308844, 3.128355, 1, 0, 0.1803922, 1,
1.860088, -0.687804, 0.9363213, 1, 0, 0.172549, 1,
1.869047, -1.024501, 0.6665459, 1, 0, 0.1686275, 1,
1.871529, -0.2952959, 1.154325, 1, 0, 0.1607843, 1,
1.895911, -0.3781424, 1.367501, 1, 0, 0.1568628, 1,
1.903758, -0.2570163, 1.342577, 1, 0, 0.1490196, 1,
1.904313, 1.098466, -0.04721657, 1, 0, 0.145098, 1,
1.908663, 0.3983623, 0.6904854, 1, 0, 0.1372549, 1,
1.913071, 0.2236611, 0.1709717, 1, 0, 0.1333333, 1,
1.913599, -1.46222, 1.328169, 1, 0, 0.1254902, 1,
1.918504, -0.8128663, 2.217512, 1, 0, 0.1215686, 1,
1.928008, -1.103114, 0.8135362, 1, 0, 0.1137255, 1,
1.971474, -0.4317003, 2.051124, 1, 0, 0.1098039, 1,
2.011761, -0.3075926, 2.867652, 1, 0, 0.1019608, 1,
2.015573, 0.5147865, 2.085705, 1, 0, 0.09411765, 1,
2.106247, -0.342427, 2.07069, 1, 0, 0.09019608, 1,
2.161515, -1.760152, 3.175018, 1, 0, 0.08235294, 1,
2.260283, -1.404809, 2.945721, 1, 0, 0.07843138, 1,
2.274407, -0.0812263, 1.149771, 1, 0, 0.07058824, 1,
2.277037, -0.06664302, 1.781649, 1, 0, 0.06666667, 1,
2.285411, 2.272393, 0.2792501, 1, 0, 0.05882353, 1,
2.289915, -1.575988, 2.862579, 1, 0, 0.05490196, 1,
2.292621, 1.459002, 0.05525689, 1, 0, 0.04705882, 1,
2.304375, 0.7651319, 0.4389732, 1, 0, 0.04313726, 1,
2.337264, -0.05619133, 2.038843, 1, 0, 0.03529412, 1,
2.343622, -2.391595, 2.376002, 1, 0, 0.03137255, 1,
2.402839, -0.1093512, 2.48492, 1, 0, 0.02352941, 1,
2.827662, -1.428568, 0.8183436, 1, 0, 0.01960784, 1,
2.884147, -0.5731452, 0.7947491, 1, 0, 0.01176471, 1,
3.130029, 0.6740538, 1.366115, 1, 0, 0.007843138, 1
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
-0.3239478, -4.55142, -7.132485, 0, -0.5, 0.5, 0.5,
-0.3239478, -4.55142, -7.132485, 1, -0.5, 0.5, 0.5,
-0.3239478, -4.55142, -7.132485, 1, 1.5, 0.5, 0.5,
-0.3239478, -4.55142, -7.132485, 0, 1.5, 0.5, 0.5
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
-4.948823, 0.2548776, -7.132485, 0, -0.5, 0.5, 0.5,
-4.948823, 0.2548776, -7.132485, 1, -0.5, 0.5, 0.5,
-4.948823, 0.2548776, -7.132485, 1, 1.5, 0.5, 0.5,
-4.948823, 0.2548776, -7.132485, 0, 1.5, 0.5, 0.5
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
-4.948823, -4.55142, 0.05893159, 0, -0.5, 0.5, 0.5,
-4.948823, -4.55142, 0.05893159, 1, -0.5, 0.5, 0.5,
-4.948823, -4.55142, 0.05893159, 1, 1.5, 0.5, 0.5,
-4.948823, -4.55142, 0.05893159, 0, 1.5, 0.5, 0.5
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
-3, -3.442275, -5.472928,
3, -3.442275, -5.472928,
-3, -3.442275, -5.472928,
-3, -3.627132, -5.74952,
-2, -3.442275, -5.472928,
-2, -3.627132, -5.74952,
-1, -3.442275, -5.472928,
-1, -3.627132, -5.74952,
0, -3.442275, -5.472928,
0, -3.627132, -5.74952,
1, -3.442275, -5.472928,
1, -3.627132, -5.74952,
2, -3.442275, -5.472928,
2, -3.627132, -5.74952,
3, -3.442275, -5.472928,
3, -3.627132, -5.74952
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
-3, -3.996847, -6.302706, 0, -0.5, 0.5, 0.5,
-3, -3.996847, -6.302706, 1, -0.5, 0.5, 0.5,
-3, -3.996847, -6.302706, 1, 1.5, 0.5, 0.5,
-3, -3.996847, -6.302706, 0, 1.5, 0.5, 0.5,
-2, -3.996847, -6.302706, 0, -0.5, 0.5, 0.5,
-2, -3.996847, -6.302706, 1, -0.5, 0.5, 0.5,
-2, -3.996847, -6.302706, 1, 1.5, 0.5, 0.5,
-2, -3.996847, -6.302706, 0, 1.5, 0.5, 0.5,
-1, -3.996847, -6.302706, 0, -0.5, 0.5, 0.5,
-1, -3.996847, -6.302706, 1, -0.5, 0.5, 0.5,
-1, -3.996847, -6.302706, 1, 1.5, 0.5, 0.5,
-1, -3.996847, -6.302706, 0, 1.5, 0.5, 0.5,
0, -3.996847, -6.302706, 0, -0.5, 0.5, 0.5,
0, -3.996847, -6.302706, 1, -0.5, 0.5, 0.5,
0, -3.996847, -6.302706, 1, 1.5, 0.5, 0.5,
0, -3.996847, -6.302706, 0, 1.5, 0.5, 0.5,
1, -3.996847, -6.302706, 0, -0.5, 0.5, 0.5,
1, -3.996847, -6.302706, 1, -0.5, 0.5, 0.5,
1, -3.996847, -6.302706, 1, 1.5, 0.5, 0.5,
1, -3.996847, -6.302706, 0, 1.5, 0.5, 0.5,
2, -3.996847, -6.302706, 0, -0.5, 0.5, 0.5,
2, -3.996847, -6.302706, 1, -0.5, 0.5, 0.5,
2, -3.996847, -6.302706, 1, 1.5, 0.5, 0.5,
2, -3.996847, -6.302706, 0, 1.5, 0.5, 0.5,
3, -3.996847, -6.302706, 0, -0.5, 0.5, 0.5,
3, -3.996847, -6.302706, 1, -0.5, 0.5, 0.5,
3, -3.996847, -6.302706, 1, 1.5, 0.5, 0.5,
3, -3.996847, -6.302706, 0, 1.5, 0.5, 0.5
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
-3.881544, -2, -5.472928,
-3.881544, 2, -5.472928,
-3.881544, -2, -5.472928,
-4.059424, -2, -5.74952,
-3.881544, 0, -5.472928,
-4.059424, 0, -5.74952,
-3.881544, 2, -5.472928,
-4.059424, 2, -5.74952
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
-4.415184, -2, -6.302706, 0, -0.5, 0.5, 0.5,
-4.415184, -2, -6.302706, 1, -0.5, 0.5, 0.5,
-4.415184, -2, -6.302706, 1, 1.5, 0.5, 0.5,
-4.415184, -2, -6.302706, 0, 1.5, 0.5, 0.5,
-4.415184, 0, -6.302706, 0, -0.5, 0.5, 0.5,
-4.415184, 0, -6.302706, 1, -0.5, 0.5, 0.5,
-4.415184, 0, -6.302706, 1, 1.5, 0.5, 0.5,
-4.415184, 0, -6.302706, 0, 1.5, 0.5, 0.5,
-4.415184, 2, -6.302706, 0, -0.5, 0.5, 0.5,
-4.415184, 2, -6.302706, 1, -0.5, 0.5, 0.5,
-4.415184, 2, -6.302706, 1, 1.5, 0.5, 0.5,
-4.415184, 2, -6.302706, 0, 1.5, 0.5, 0.5
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
-3.881544, -3.442275, -4,
-3.881544, -3.442275, 4,
-3.881544, -3.442275, -4,
-4.059424, -3.627132, -4,
-3.881544, -3.442275, -2,
-4.059424, -3.627132, -2,
-3.881544, -3.442275, 0,
-4.059424, -3.627132, 0,
-3.881544, -3.442275, 2,
-4.059424, -3.627132, 2,
-3.881544, -3.442275, 4,
-4.059424, -3.627132, 4
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
-4.415184, -3.996847, -4, 0, -0.5, 0.5, 0.5,
-4.415184, -3.996847, -4, 1, -0.5, 0.5, 0.5,
-4.415184, -3.996847, -4, 1, 1.5, 0.5, 0.5,
-4.415184, -3.996847, -4, 0, 1.5, 0.5, 0.5,
-4.415184, -3.996847, -2, 0, -0.5, 0.5, 0.5,
-4.415184, -3.996847, -2, 1, -0.5, 0.5, 0.5,
-4.415184, -3.996847, -2, 1, 1.5, 0.5, 0.5,
-4.415184, -3.996847, -2, 0, 1.5, 0.5, 0.5,
-4.415184, -3.996847, 0, 0, -0.5, 0.5, 0.5,
-4.415184, -3.996847, 0, 1, -0.5, 0.5, 0.5,
-4.415184, -3.996847, 0, 1, 1.5, 0.5, 0.5,
-4.415184, -3.996847, 0, 0, 1.5, 0.5, 0.5,
-4.415184, -3.996847, 2, 0, -0.5, 0.5, 0.5,
-4.415184, -3.996847, 2, 1, -0.5, 0.5, 0.5,
-4.415184, -3.996847, 2, 1, 1.5, 0.5, 0.5,
-4.415184, -3.996847, 2, 0, 1.5, 0.5, 0.5,
-4.415184, -3.996847, 4, 0, -0.5, 0.5, 0.5,
-4.415184, -3.996847, 4, 1, -0.5, 0.5, 0.5,
-4.415184, -3.996847, 4, 1, 1.5, 0.5, 0.5,
-4.415184, -3.996847, 4, 0, 1.5, 0.5, 0.5
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
-3.881544, -3.442275, -5.472928,
-3.881544, 3.95203, -5.472928,
-3.881544, -3.442275, 5.590791,
-3.881544, 3.95203, 5.590791,
-3.881544, -3.442275, -5.472928,
-3.881544, -3.442275, 5.590791,
-3.881544, 3.95203, -5.472928,
-3.881544, 3.95203, 5.590791,
-3.881544, -3.442275, -5.472928,
3.233649, -3.442275, -5.472928,
-3.881544, -3.442275, 5.590791,
3.233649, -3.442275, 5.590791,
-3.881544, 3.95203, -5.472928,
3.233649, 3.95203, -5.472928,
-3.881544, 3.95203, 5.590791,
3.233649, 3.95203, 5.590791,
3.233649, -3.442275, -5.472928,
3.233649, 3.95203, -5.472928,
3.233649, -3.442275, 5.590791,
3.233649, 3.95203, 5.590791,
3.233649, -3.442275, -5.472928,
3.233649, -3.442275, 5.590791,
3.233649, 3.95203, -5.472928,
3.233649, 3.95203, 5.590791
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
var radius = 8.057757;
var distance = 35.84988;
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
mvMatrix.translate( 0.3239478, -0.2548776, -0.05893159 );
mvMatrix.scale( 1.224451, 1.178232, 0.7874573 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.84988);
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
Borea<-read.table("Borea.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Borea$V2
```

```
## Error in eval(expr, envir, enclos): object 'Borea' not found
```

```r
y<-Borea$V3
```

```
## Error in eval(expr, envir, enclos): object 'Borea' not found
```

```r
z<-Borea$V4
```

```
## Error in eval(expr, envir, enclos): object 'Borea' not found
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
-3.777925, -0.6564465, -1.346326, 0, 0, 1, 1, 1,
-3.677483, -0.9802321, -3.431971, 1, 0, 0, 1, 1,
-3.372538, -1.145645, -1.347411, 1, 0, 0, 1, 1,
-3.262417, 2.058083, -1.284214, 1, 0, 0, 1, 1,
-2.771166, -0.9928614, 0.2944035, 1, 0, 0, 1, 1,
-2.593875, -0.4411512, -1.147128, 1, 0, 0, 1, 1,
-2.557489, 0.8146623, 1.139239, 0, 0, 0, 1, 1,
-2.458387, 0.02681904, -3.102756, 0, 0, 0, 1, 1,
-2.369199, 0.8020396, -1.991338, 0, 0, 0, 1, 1,
-2.294379, -0.3171729, -2.801926, 0, 0, 0, 1, 1,
-2.283562, -0.02032382, -1.239652, 0, 0, 0, 1, 1,
-2.221832, 0.9964366, -2.533984, 0, 0, 0, 1, 1,
-2.063678, 0.8803844, -1.520892, 0, 0, 0, 1, 1,
-2.055598, -0.3830284, -1.51554, 1, 1, 1, 1, 1,
-2.052636, -1.220709, -2.494995, 1, 1, 1, 1, 1,
-2.050262, -0.9275567, -0.8572168, 1, 1, 1, 1, 1,
-2.046281, 0.1558164, -3.174825, 1, 1, 1, 1, 1,
-2.04616, 1.063091, -1.845519, 1, 1, 1, 1, 1,
-2.027041, 0.7061256, -0.8994383, 1, 1, 1, 1, 1,
-2.017644, -1.500433, -1.466128, 1, 1, 1, 1, 1,
-2.013624, 0.6385673, -1.490035, 1, 1, 1, 1, 1,
-2.001254, 0.4092544, -1.627496, 1, 1, 1, 1, 1,
-1.988296, -0.3879048, -0.6442623, 1, 1, 1, 1, 1,
-1.987009, -0.457588, -2.855752, 1, 1, 1, 1, 1,
-1.933007, -0.7792749, -3.55978, 1, 1, 1, 1, 1,
-1.925439, 0.1720987, -1.014688, 1, 1, 1, 1, 1,
-1.909024, -2.125821, -2.678759, 1, 1, 1, 1, 1,
-1.888762, -0.03354094, -2.719817, 1, 1, 1, 1, 1,
-1.822321, 0.6602609, -1.933259, 0, 0, 1, 1, 1,
-1.812455, -0.6792135, -1.090332, 1, 0, 0, 1, 1,
-1.810172, -1.139546, -1.989608, 1, 0, 0, 1, 1,
-1.795635, 0.953775, -1.759092, 1, 0, 0, 1, 1,
-1.767981, -1.124291, -0.06244817, 1, 0, 0, 1, 1,
-1.761117, 0.5298868, -0.7681798, 1, 0, 0, 1, 1,
-1.755095, 1.143034, -1.920847, 0, 0, 0, 1, 1,
-1.753554, -0.2691501, -1.28715, 0, 0, 0, 1, 1,
-1.75009, -0.4956205, -1.512054, 0, 0, 0, 1, 1,
-1.739247, 1.388565, -2.35282, 0, 0, 0, 1, 1,
-1.738853, 1.433726, -0.9475514, 0, 0, 0, 1, 1,
-1.730807, -0.2919526, -0.4104258, 0, 0, 0, 1, 1,
-1.719922, 0.8148216, -4.308159, 0, 0, 0, 1, 1,
-1.705439, -0.646624, -1.306904, 1, 1, 1, 1, 1,
-1.696966, 1.292233, -0.2575908, 1, 1, 1, 1, 1,
-1.687219, -0.4026077, -0.4213283, 1, 1, 1, 1, 1,
-1.680331, 0.0186756, -2.387992, 1, 1, 1, 1, 1,
-1.650222, 1.350412, 0.8557402, 1, 1, 1, 1, 1,
-1.63856, -0.1573281, -1.345024, 1, 1, 1, 1, 1,
-1.636746, -0.5500851, -1.14668, 1, 1, 1, 1, 1,
-1.622468, 0.7665212, -2.249897, 1, 1, 1, 1, 1,
-1.599539, 0.7388393, -2.342287, 1, 1, 1, 1, 1,
-1.59234, -1.347, -1.255991, 1, 1, 1, 1, 1,
-1.58953, -0.06256159, -2.492157, 1, 1, 1, 1, 1,
-1.5848, 1.039126, -1.043545, 1, 1, 1, 1, 1,
-1.564639, 0.9432054, -1.665126, 1, 1, 1, 1, 1,
-1.56097, 0.9420794, -1.519345, 1, 1, 1, 1, 1,
-1.555349, -1.290017, -2.660291, 1, 1, 1, 1, 1,
-1.549303, 0.3182599, -0.1249477, 0, 0, 1, 1, 1,
-1.537917, 1.563886, -0.105609, 1, 0, 0, 1, 1,
-1.534759, 1.544213, -0.05650854, 1, 0, 0, 1, 1,
-1.514277, -0.1906847, -0.9465231, 1, 0, 0, 1, 1,
-1.505482, -1.124346, -3.20037, 1, 0, 0, 1, 1,
-1.493635, 0.6199536, 0.4932283, 1, 0, 0, 1, 1,
-1.486286, -0.01961141, -1.862731, 0, 0, 0, 1, 1,
-1.485312, 0.1879746, -1.98291, 0, 0, 0, 1, 1,
-1.467505, -0.9581569, -2.771089, 0, 0, 0, 1, 1,
-1.456979, 1.155413, -0.1194057, 0, 0, 0, 1, 1,
-1.452367, -0.8723599, -2.457077, 0, 0, 0, 1, 1,
-1.446988, -1.631941, -3.149944, 0, 0, 0, 1, 1,
-1.4437, 0.5305805, -2.454407, 0, 0, 0, 1, 1,
-1.431599, 1.909156, 0.05395791, 1, 1, 1, 1, 1,
-1.420354, -1.520052, -1.766045, 1, 1, 1, 1, 1,
-1.417197, -0.5920364, -0.657513, 1, 1, 1, 1, 1,
-1.410803, -0.1902071, 0.5143335, 1, 1, 1, 1, 1,
-1.406992, -0.9802447, -3.726366, 1, 1, 1, 1, 1,
-1.39998, 0.5116828, -2.155603, 1, 1, 1, 1, 1,
-1.396338, 0.9396445, -1.511916, 1, 1, 1, 1, 1,
-1.389652, -0.6147044, -0.5417979, 1, 1, 1, 1, 1,
-1.382506, -0.3073355, -2.30693, 1, 1, 1, 1, 1,
-1.37946, -0.06422804, -1.635061, 1, 1, 1, 1, 1,
-1.362488, -0.3166176, -2.103587, 1, 1, 1, 1, 1,
-1.353793, -0.9554166, -1.780897, 1, 1, 1, 1, 1,
-1.351982, 0.6375179, -0.9485359, 1, 1, 1, 1, 1,
-1.350824, 0.823148, -1.027487, 1, 1, 1, 1, 1,
-1.344347, 0.9519194, -0.5352004, 1, 1, 1, 1, 1,
-1.343009, -0.6533644, -0.3970121, 0, 0, 1, 1, 1,
-1.335493, -0.1492927, -4.003313, 1, 0, 0, 1, 1,
-1.335128, -0.797321, -3.814672, 1, 0, 0, 1, 1,
-1.331785, 0.1833938, -1.302113, 1, 0, 0, 1, 1,
-1.327506, 0.2309064, -2.447769, 1, 0, 0, 1, 1,
-1.325881, -0.641511, -2.035178, 1, 0, 0, 1, 1,
-1.305852, -0.01005778, -2.380433, 0, 0, 0, 1, 1,
-1.304805, -0.5995704, -3.459091, 0, 0, 0, 1, 1,
-1.303239, 0.3307245, -0.1455305, 0, 0, 0, 1, 1,
-1.297319, 1.059035, -1.794994, 0, 0, 0, 1, 1,
-1.292466, 0.0621021, -1.51341, 0, 0, 0, 1, 1,
-1.289574, -0.9374493, -2.524452, 0, 0, 0, 1, 1,
-1.284994, -0.3947071, -3.683519, 0, 0, 0, 1, 1,
-1.280463, 0.3863967, -1.262306, 1, 1, 1, 1, 1,
-1.276144, -0.7447951, -3.364871, 1, 1, 1, 1, 1,
-1.27444, -0.3184094, -1.260953, 1, 1, 1, 1, 1,
-1.265712, 0.02751584, -1.20721, 1, 1, 1, 1, 1,
-1.262289, -0.8370069, -0.7584448, 1, 1, 1, 1, 1,
-1.261978, -0.3585433, -1.656831, 1, 1, 1, 1, 1,
-1.259082, 0.4957156, -1.103313, 1, 1, 1, 1, 1,
-1.256873, 0.1017575, -0.7220926, 1, 1, 1, 1, 1,
-1.250871, 1.144276, -0.3200938, 1, 1, 1, 1, 1,
-1.247641, -0.3787284, -1.83113, 1, 1, 1, 1, 1,
-1.240299, 1.607633, 0.2121447, 1, 1, 1, 1, 1,
-1.239442, -0.9630015, -1.958489, 1, 1, 1, 1, 1,
-1.234712, 0.0628132, -0.5415735, 1, 1, 1, 1, 1,
-1.233707, 1.553632, -1.208508, 1, 1, 1, 1, 1,
-1.233306, 0.9744621, -2.157631, 1, 1, 1, 1, 1,
-1.233082, -1.702937, -2.00151, 0, 0, 1, 1, 1,
-1.211772, -0.7288201, -2.02251, 1, 0, 0, 1, 1,
-1.200197, 1.240091, -1.841286, 1, 0, 0, 1, 1,
-1.183872, 0.1119901, -0.112279, 1, 0, 0, 1, 1,
-1.176794, 0.8871202, 0.2095329, 1, 0, 0, 1, 1,
-1.169028, -1.215939, -1.008764, 1, 0, 0, 1, 1,
-1.168501, 0.7947257, -1.493922, 0, 0, 0, 1, 1,
-1.156262, -0.2840962, -1.722065, 0, 0, 0, 1, 1,
-1.146729, -0.3921773, -1.800783, 0, 0, 0, 1, 1,
-1.143315, -1.155115, -1.775707, 0, 0, 0, 1, 1,
-1.141917, -0.7199798, -2.689423, 0, 0, 0, 1, 1,
-1.13476, -0.2070397, -0.5236895, 0, 0, 0, 1, 1,
-1.134204, 0.4134195, -2.179234, 0, 0, 0, 1, 1,
-1.130648, -0.1743593, -1.928452, 1, 1, 1, 1, 1,
-1.125525, 0.3029395, 0.3047822, 1, 1, 1, 1, 1,
-1.121753, 0.6050445, -2.639338, 1, 1, 1, 1, 1,
-1.110455, -0.1093411, -2.198167, 1, 1, 1, 1, 1,
-1.104588, -1.170464, -3.905089, 1, 1, 1, 1, 1,
-1.093881, -0.3343823, -0.7361534, 1, 1, 1, 1, 1,
-1.087031, -1.037154, -1.424571, 1, 1, 1, 1, 1,
-1.085932, -0.4707311, -1.38436, 1, 1, 1, 1, 1,
-1.083456, 0.2568075, -2.484817, 1, 1, 1, 1, 1,
-1.073068, -0.0273493, -0.8767444, 1, 1, 1, 1, 1,
-1.071232, -0.3676669, -0.2491875, 1, 1, 1, 1, 1,
-1.066904, -0.7103845, -1.277051, 1, 1, 1, 1, 1,
-1.066611, -0.7551581, -0.9551984, 1, 1, 1, 1, 1,
-1.065388, 1.194895, -0.1504404, 1, 1, 1, 1, 1,
-1.05859, 0.4039877, -1.802208, 1, 1, 1, 1, 1,
-1.056603, -2.710012, -2.833216, 0, 0, 1, 1, 1,
-1.05549, -2.100656, -1.6008, 1, 0, 0, 1, 1,
-1.055002, -0.637539, -2.610148, 1, 0, 0, 1, 1,
-1.052539, 1.764966, -1.177854, 1, 0, 0, 1, 1,
-1.05164, -0.552785, -3.520535, 1, 0, 0, 1, 1,
-1.045936, -0.2312501, -1.514444, 1, 0, 0, 1, 1,
-1.038666, -2.567415, -1.737077, 0, 0, 0, 1, 1,
-1.035833, 0.4453894, -0.6359257, 0, 0, 0, 1, 1,
-1.033424, 0.6103218, -1.428151, 0, 0, 0, 1, 1,
-1.033399, -0.2621655, -3.239349, 0, 0, 0, 1, 1,
-1.030362, -1.20188, -2.384226, 0, 0, 0, 1, 1,
-1.015443, 0.8452548, -1.790924, 0, 0, 0, 1, 1,
-0.9956954, -1.861567, -2.692916, 0, 0, 0, 1, 1,
-0.9894792, 1.515042, -0.8361951, 1, 1, 1, 1, 1,
-0.9877292, 0.1756089, -3.531641, 1, 1, 1, 1, 1,
-0.98641, 0.1512662, -0.625595, 1, 1, 1, 1, 1,
-0.9826988, -0.9335727, -1.569166, 1, 1, 1, 1, 1,
-0.9792604, 0.9032359, -1.259059, 1, 1, 1, 1, 1,
-0.9764884, -0.4182531, -1.540461, 1, 1, 1, 1, 1,
-0.9759687, -0.3230834, -1.950127, 1, 1, 1, 1, 1,
-0.974053, -1.237304, -3.835793, 1, 1, 1, 1, 1,
-0.9699054, -0.4388518, -0.2280732, 1, 1, 1, 1, 1,
-0.9670978, 1.874776, 0.9203858, 1, 1, 1, 1, 1,
-0.9664214, -0.3086133, 0.6509924, 1, 1, 1, 1, 1,
-0.956985, -0.5089231, -3.537076, 1, 1, 1, 1, 1,
-0.9566464, -0.1397265, -0.8650789, 1, 1, 1, 1, 1,
-0.9554016, -0.005182371, -1.995843, 1, 1, 1, 1, 1,
-0.9547947, 1.604992, -1.406981, 1, 1, 1, 1, 1,
-0.94318, 1.298479, 0.784105, 0, 0, 1, 1, 1,
-0.9415007, 1.607536, 1.308788, 1, 0, 0, 1, 1,
-0.9396902, -1.220725, -3.012985, 1, 0, 0, 1, 1,
-0.9382945, -1.138447, -2.392318, 1, 0, 0, 1, 1,
-0.9267995, 1.524163, -0.2848117, 1, 0, 0, 1, 1,
-0.926479, 0.03118813, -0.546901, 1, 0, 0, 1, 1,
-0.9230335, -0.4619687, -1.224245, 0, 0, 0, 1, 1,
-0.9210685, 0.3308136, -1.786997, 0, 0, 0, 1, 1,
-0.9203891, 1.781585, -0.7326757, 0, 0, 0, 1, 1,
-0.9189643, 3.844346, -0.4888895, 0, 0, 0, 1, 1,
-0.9160936, 0.9600804, -1.063296, 0, 0, 0, 1, 1,
-0.9119641, 0.9180846, -0.04461438, 0, 0, 0, 1, 1,
-0.9105748, 0.411087, -0.7142873, 0, 0, 0, 1, 1,
-0.9083403, 1.128759, -1.993968, 1, 1, 1, 1, 1,
-0.9014911, 0.8963814, -2.498537, 1, 1, 1, 1, 1,
-0.9010994, 0.8668706, -0.2938919, 1, 1, 1, 1, 1,
-0.8963717, -1.23775, -1.951349, 1, 1, 1, 1, 1,
-0.8959983, -0.5740137, -3.470622, 1, 1, 1, 1, 1,
-0.8954484, 0.2255881, -1.876554, 1, 1, 1, 1, 1,
-0.8898556, -0.3637901, -1.848906, 1, 1, 1, 1, 1,
-0.888853, -1.590188, -2.271281, 1, 1, 1, 1, 1,
-0.8865978, 1.25436, 1.579343, 1, 1, 1, 1, 1,
-0.8775799, -0.6812786, -1.81753, 1, 1, 1, 1, 1,
-0.8756814, -0.7732596, -3.991258, 1, 1, 1, 1, 1,
-0.8732679, -0.5033264, -4.63625, 1, 1, 1, 1, 1,
-0.8727647, -0.6936208, -4.189734, 1, 1, 1, 1, 1,
-0.8713179, 1.485057, -0.4802572, 1, 1, 1, 1, 1,
-0.8706384, -0.9129325, -0.9894023, 1, 1, 1, 1, 1,
-0.8703005, -0.4812843, -2.444535, 0, 0, 1, 1, 1,
-0.869339, -0.5888746, -2.128521, 1, 0, 0, 1, 1,
-0.8653456, -0.3898172, -2.97532, 1, 0, 0, 1, 1,
-0.8567991, -1.027305, -1.136247, 1, 0, 0, 1, 1,
-0.8391005, -0.6799432, -1.942101, 1, 0, 0, 1, 1,
-0.8291218, -1.209202, -3.493325, 1, 0, 0, 1, 1,
-0.8269112, -1.491288, -3.131493, 0, 0, 0, 1, 1,
-0.8219678, -0.2490986, -1.497808, 0, 0, 0, 1, 1,
-0.8168249, 1.345187, 0.9898794, 0, 0, 0, 1, 1,
-0.8105639, -0.9582403, -3.328946, 0, 0, 0, 1, 1,
-0.8070487, 0.3938183, 0.5894047, 0, 0, 0, 1, 1,
-0.8047541, 0.0626884, -1.631055, 0, 0, 0, 1, 1,
-0.8021893, 1.647655, -1.430307, 0, 0, 0, 1, 1,
-0.8004061, 0.6666842, -2.934753, 1, 1, 1, 1, 1,
-0.8002308, -0.9380094, -3.19146, 1, 1, 1, 1, 1,
-0.7882587, 3.44105, 0.8801993, 1, 1, 1, 1, 1,
-0.7870222, -1.389132, -2.128035, 1, 1, 1, 1, 1,
-0.7867467, -0.9538394, -4.046663, 1, 1, 1, 1, 1,
-0.7855257, -0.445158, -1.997055, 1, 1, 1, 1, 1,
-0.7832294, -0.4720949, -0.8361173, 1, 1, 1, 1, 1,
-0.7827606, -0.167986, -2.109012, 1, 1, 1, 1, 1,
-0.7822281, -0.2526501, -3.293041, 1, 1, 1, 1, 1,
-0.7814035, 1.845482, -1.036904, 1, 1, 1, 1, 1,
-0.7754967, 1.719374, -1.254153, 1, 1, 1, 1, 1,
-0.7752787, 0.3740883, -1.016922, 1, 1, 1, 1, 1,
-0.7739092, 1.1744, -0.8282052, 1, 1, 1, 1, 1,
-0.7735956, 1.648629, 0.7901809, 1, 1, 1, 1, 1,
-0.7664562, -0.8317459, -4.092773, 1, 1, 1, 1, 1,
-0.7607843, -0.5731541, -2.699105, 0, 0, 1, 1, 1,
-0.7587234, -0.366179, -2.262451, 1, 0, 0, 1, 1,
-0.7556919, 0.6592156, -0.6374596, 1, 0, 0, 1, 1,
-0.7506716, 0.976431, 0.02215625, 1, 0, 0, 1, 1,
-0.7489301, 2.101809, 0.5089324, 1, 0, 0, 1, 1,
-0.748329, 1.270034, 0.9592564, 1, 0, 0, 1, 1,
-0.7370138, -0.1425427, -0.4963335, 0, 0, 0, 1, 1,
-0.7338673, -0.6341631, -2.654674, 0, 0, 0, 1, 1,
-0.7240654, 0.5963775, -1.300075, 0, 0, 0, 1, 1,
-0.7217775, 0.2895913, -0.9825711, 0, 0, 0, 1, 1,
-0.7214326, -1.069002, -3.453645, 0, 0, 0, 1, 1,
-0.7165793, -0.6056212, -1.635753, 0, 0, 0, 1, 1,
-0.7103944, -0.3093937, -2.851243, 0, 0, 0, 1, 1,
-0.7089869, -2.033322, -3.48851, 1, 1, 1, 1, 1,
-0.704996, 0.2622882, -0.4994358, 1, 1, 1, 1, 1,
-0.7047771, 0.6377724, -1.906048, 1, 1, 1, 1, 1,
-0.7044829, 0.7804841, -1.966574, 1, 1, 1, 1, 1,
-0.7027177, 2.317542, 0.2496027, 1, 1, 1, 1, 1,
-0.7006203, 0.9438927, 0.3122032, 1, 1, 1, 1, 1,
-0.6955954, 0.6103762, 1.146816, 1, 1, 1, 1, 1,
-0.6950389, 1.346859, -1.888661, 1, 1, 1, 1, 1,
-0.6909055, -0.302397, -0.9794323, 1, 1, 1, 1, 1,
-0.6908576, 0.647824, -0.3192258, 1, 1, 1, 1, 1,
-0.6835421, -1.208795, -1.952198, 1, 1, 1, 1, 1,
-0.6729855, -0.8229728, -1.182331, 1, 1, 1, 1, 1,
-0.6722482, 1.129809, -0.4531291, 1, 1, 1, 1, 1,
-0.6686311, 0.8059083, -0.5699717, 1, 1, 1, 1, 1,
-0.6667051, 1.287923, -1.576944, 1, 1, 1, 1, 1,
-0.6631179, -1.581149, -1.151413, 0, 0, 1, 1, 1,
-0.6630613, -0.5697951, -2.923111, 1, 0, 0, 1, 1,
-0.6618601, -0.7746357, -3.036422, 1, 0, 0, 1, 1,
-0.6616526, -1.128769, -2.611912, 1, 0, 0, 1, 1,
-0.660185, 0.3532388, -1.204325, 1, 0, 0, 1, 1,
-0.6584603, 1.938866, -0.8557339, 1, 0, 0, 1, 1,
-0.6539584, 1.80804, -0.8525094, 0, 0, 0, 1, 1,
-0.6524642, -0.8475437, -1.009405, 0, 0, 0, 1, 1,
-0.6477062, -1.069509, -2.139595, 0, 0, 0, 1, 1,
-0.6475903, 0.7121108, 0.2687209, 0, 0, 0, 1, 1,
-0.6467649, -0.5592378, -1.40819, 0, 0, 0, 1, 1,
-0.6417857, 1.979173, -0.9761932, 0, 0, 0, 1, 1,
-0.6396221, 1.150581, 0.563716, 0, 0, 0, 1, 1,
-0.6378686, -0.9795191, -4.650221, 1, 1, 1, 1, 1,
-0.6351475, -1.070132, -2.685451, 1, 1, 1, 1, 1,
-0.6315343, 0.73882, -3.907412, 1, 1, 1, 1, 1,
-0.6295229, -0.07825079, -1.690955, 1, 1, 1, 1, 1,
-0.6266461, 0.2650763, 1.371502, 1, 1, 1, 1, 1,
-0.6257412, -0.4965336, -1.760834, 1, 1, 1, 1, 1,
-0.6214362, 2.139829, 2.165026, 1, 1, 1, 1, 1,
-0.6214336, 1.874874, -1.893034, 1, 1, 1, 1, 1,
-0.6205866, -0.5018989, -2.469437, 1, 1, 1, 1, 1,
-0.6184911, 0.4098563, 0.1767814, 1, 1, 1, 1, 1,
-0.617152, 0.6583184, 0.3638619, 1, 1, 1, 1, 1,
-0.6151333, 0.7602118, -1.372547, 1, 1, 1, 1, 1,
-0.6108618, -1.077161, -3.080974, 1, 1, 1, 1, 1,
-0.6084132, 0.05725908, -0.1868224, 1, 1, 1, 1, 1,
-0.6082052, -0.5121576, -3.322069, 1, 1, 1, 1, 1,
-0.6070567, -0.3258466, -2.047316, 0, 0, 1, 1, 1,
-0.6026375, -0.1978099, -1.946071, 1, 0, 0, 1, 1,
-0.598218, 0.9879514, 0.4705759, 1, 0, 0, 1, 1,
-0.5971755, -1.711409, -2.942537, 1, 0, 0, 1, 1,
-0.5903249, 0.1836789, 0.04529488, 1, 0, 0, 1, 1,
-0.5852702, 0.3996958, 0.3996674, 1, 0, 0, 1, 1,
-0.5852051, -0.05889829, -1.76806, 0, 0, 0, 1, 1,
-0.5748369, 0.7300686, -0.05184071, 0, 0, 0, 1, 1,
-0.5671926, 0.2823618, -2.205189, 0, 0, 0, 1, 1,
-0.5651171, 0.998091, -0.1492225, 0, 0, 0, 1, 1,
-0.5553157, -1.062648, -3.977902, 0, 0, 0, 1, 1,
-0.5509533, 0.6380555, 0.5931262, 0, 0, 0, 1, 1,
-0.5457781, -2.006818, -2.974463, 0, 0, 0, 1, 1,
-0.5454174, 3.427529, -0.3622867, 1, 1, 1, 1, 1,
-0.5435121, -0.7003601, -2.936266, 1, 1, 1, 1, 1,
-0.5429574, -0.4812022, -2.799483, 1, 1, 1, 1, 1,
-0.5400298, -1.271889, -1.054083, 1, 1, 1, 1, 1,
-0.5375046, -1.808426, -2.770066, 1, 1, 1, 1, 1,
-0.5355169, 1.589055, -1.444379, 1, 1, 1, 1, 1,
-0.5319795, 0.2533396, -1.015127, 1, 1, 1, 1, 1,
-0.5305427, -1.067906, -2.554292, 1, 1, 1, 1, 1,
-0.5192751, -1.206922, -3.090019, 1, 1, 1, 1, 1,
-0.5123246, -1.683029, -2.134912, 1, 1, 1, 1, 1,
-0.5053802, -1.99114, -2.198266, 1, 1, 1, 1, 1,
-0.5052634, 0.9711276, -1.762534, 1, 1, 1, 1, 1,
-0.5037042, 0.671483, -0.5614214, 1, 1, 1, 1, 1,
-0.4965544, -0.5337284, -3.284904, 1, 1, 1, 1, 1,
-0.4945538, -1.188008, 0.1249511, 1, 1, 1, 1, 1,
-0.4938821, 0.447675, -0.5962616, 0, 0, 1, 1, 1,
-0.491588, -0.2568327, -1.778282, 1, 0, 0, 1, 1,
-0.4839776, 0.5182447, -0.7254615, 1, 0, 0, 1, 1,
-0.4826195, 0.834662, 0.1023006, 1, 0, 0, 1, 1,
-0.4819234, -0.005644247, 0.3921906, 1, 0, 0, 1, 1,
-0.4812544, -1.207679, -1.74196, 1, 0, 0, 1, 1,
-0.4799441, -0.291634, -3.650071, 0, 0, 0, 1, 1,
-0.4793099, -0.6524241, -1.291019, 0, 0, 0, 1, 1,
-0.4782039, -1.050556, -1.481671, 0, 0, 0, 1, 1,
-0.4775994, -0.2461162, -2.070066, 0, 0, 0, 1, 1,
-0.4768297, 0.9988271, 0.5367352, 0, 0, 0, 1, 1,
-0.4745376, 0.4728052, -0.5543811, 0, 0, 0, 1, 1,
-0.4740317, 0.1580572, -1.842141, 0, 0, 0, 1, 1,
-0.4731244, -0.4110411, -0.4849228, 1, 1, 1, 1, 1,
-0.4681529, 0.5183248, -1.352284, 1, 1, 1, 1, 1,
-0.4600536, -0.7220907, -2.342651, 1, 1, 1, 1, 1,
-0.4552322, 0.5225474, -2.423272, 1, 1, 1, 1, 1,
-0.4534649, -0.8746034, -1.320542, 1, 1, 1, 1, 1,
-0.4492679, -0.08813542, -2.138797, 1, 1, 1, 1, 1,
-0.4456251, -0.4017508, -1.259358, 1, 1, 1, 1, 1,
-0.4421886, 0.4937752, 1.222784, 1, 1, 1, 1, 1,
-0.4398388, -1.751615, -2.486607, 1, 1, 1, 1, 1,
-0.4380836, -0.1523312, -1.043882, 1, 1, 1, 1, 1,
-0.4367442, 0.3228942, 0.6840776, 1, 1, 1, 1, 1,
-0.4358644, -0.2556071, -1.575355, 1, 1, 1, 1, 1,
-0.4321556, -0.6528473, -3.837156, 1, 1, 1, 1, 1,
-0.4309233, 0.2184636, -1.154164, 1, 1, 1, 1, 1,
-0.4278485, 0.05024724, -2.800562, 1, 1, 1, 1, 1,
-0.4237203, -0.3744937, -3.496451, 0, 0, 1, 1, 1,
-0.4194633, 0.654434, -0.4385858, 1, 0, 0, 1, 1,
-0.419321, -0.5309727, -1.756451, 1, 0, 0, 1, 1,
-0.4176395, -0.7233351, -2.605516, 1, 0, 0, 1, 1,
-0.4145172, 0.7383142, -0.006618882, 1, 0, 0, 1, 1,
-0.4109877, 1.776506, -0.5028039, 1, 0, 0, 1, 1,
-0.410769, 2.134426, -0.870712, 0, 0, 0, 1, 1,
-0.4097829, -0.9293708, -3.207054, 0, 0, 0, 1, 1,
-0.4080892, 0.01767085, -0.5001938, 0, 0, 0, 1, 1,
-0.4033961, 2.167792, -1.5819, 0, 0, 0, 1, 1,
-0.4016162, -0.972038, -2.732854, 0, 0, 0, 1, 1,
-0.4013157, -1.18472, -2.644812, 0, 0, 0, 1, 1,
-0.3982151, -1.947142, -4.028595, 0, 0, 0, 1, 1,
-0.3964742, 0.2205988, -2.345205, 1, 1, 1, 1, 1,
-0.3934359, -1.704319, -3.443045, 1, 1, 1, 1, 1,
-0.3920926, 0.8516922, -0.5808282, 1, 1, 1, 1, 1,
-0.3917605, 0.1487402, -2.44348, 1, 1, 1, 1, 1,
-0.3906147, 1.716408, -1.111019, 1, 1, 1, 1, 1,
-0.3894795, 0.07999341, -1.755801, 1, 1, 1, 1, 1,
-0.3886516, -0.4600477, -2.919431, 1, 1, 1, 1, 1,
-0.3880139, -0.7219714, -3.08634, 1, 1, 1, 1, 1,
-0.3879537, -0.8808854, -2.938215, 1, 1, 1, 1, 1,
-0.3842794, 2.333942, -0.5059723, 1, 1, 1, 1, 1,
-0.3838762, -0.5804651, -2.540093, 1, 1, 1, 1, 1,
-0.382053, -1.661698, -3.622261, 1, 1, 1, 1, 1,
-0.38031, 0.7730525, -1.918437, 1, 1, 1, 1, 1,
-0.378268, 0.4320769, -0.9640078, 1, 1, 1, 1, 1,
-0.3771437, -0.5709871, -2.691405, 1, 1, 1, 1, 1,
-0.372106, -0.9448492, -1.339326, 0, 0, 1, 1, 1,
-0.3625574, -0.01851141, -1.72351, 1, 0, 0, 1, 1,
-0.3601565, -2.233038, -3.438681, 1, 0, 0, 1, 1,
-0.3592566, 0.1708413, -1.209631, 1, 0, 0, 1, 1,
-0.356764, -1.89486, -3.955343, 1, 0, 0, 1, 1,
-0.3548666, -0.3794479, -2.599845, 1, 0, 0, 1, 1,
-0.3522138, -0.7654608, -2.480537, 0, 0, 0, 1, 1,
-0.3485639, -0.7898775, -2.289857, 0, 0, 0, 1, 1,
-0.3481207, 1.279522, 0.286426, 0, 0, 0, 1, 1,
-0.3467345, 1.679358, -1.508251, 0, 0, 0, 1, 1,
-0.341339, -2.058656, -4.017764, 0, 0, 0, 1, 1,
-0.340036, 0.5953619, -1.384576, 0, 0, 0, 1, 1,
-0.3377119, 0.7629026, -1.28994, 0, 0, 0, 1, 1,
-0.3341095, 0.01886222, -2.041407, 1, 1, 1, 1, 1,
-0.3333031, -0.441572, -3.172218, 1, 1, 1, 1, 1,
-0.3330615, 0.06202002, -0.6658686, 1, 1, 1, 1, 1,
-0.3260224, 1.323087, -0.4644838, 1, 1, 1, 1, 1,
-0.3242564, 1.039533, 1.211164, 1, 1, 1, 1, 1,
-0.3229388, -0.02125889, -0.7442873, 1, 1, 1, 1, 1,
-0.3228768, 0.6438266, 0.006704167, 1, 1, 1, 1, 1,
-0.3155314, -1.27169, -4.271301, 1, 1, 1, 1, 1,
-0.3134993, -0.5126695, -2.336074, 1, 1, 1, 1, 1,
-0.3097869, -0.6930421, -2.582549, 1, 1, 1, 1, 1,
-0.3066247, -1.527285, -4.865135, 1, 1, 1, 1, 1,
-0.3057696, -0.2670079, -2.467895, 1, 1, 1, 1, 1,
-0.3013218, -0.209773, -1.863437, 1, 1, 1, 1, 1,
-0.3012159, 0.2912886, 1.277166, 1, 1, 1, 1, 1,
-0.3004026, 0.3837997, -0.8162464, 1, 1, 1, 1, 1,
-0.298574, -0.8945774, -2.630864, 0, 0, 1, 1, 1,
-0.2898864, -0.931268, -1.638821, 1, 0, 0, 1, 1,
-0.2861557, -0.08957256, -0.1107291, 1, 0, 0, 1, 1,
-0.2782133, -0.3316873, -4.902147, 1, 0, 0, 1, 1,
-0.2726805, -0.0287052, -0.6437891, 1, 0, 0, 1, 1,
-0.2726112, -0.6369882, -3.132244, 1, 0, 0, 1, 1,
-0.2722958, -0.2561416, -1.730193, 0, 0, 0, 1, 1,
-0.2712691, 1.40618, -0.4688733, 0, 0, 0, 1, 1,
-0.2694688, -1.32702, -4.187246, 0, 0, 0, 1, 1,
-0.2692974, -0.8844027, -3.994614, 0, 0, 0, 1, 1,
-0.2651275, -2.331379, -3.178612, 0, 0, 0, 1, 1,
-0.2639845, -0.7188737, -1.112224, 0, 0, 0, 1, 1,
-0.2630699, -0.7231997, -2.339169, 0, 0, 0, 1, 1,
-0.2629669, 1.253186, 0.4880485, 1, 1, 1, 1, 1,
-0.2609063, -0.2986703, -1.906511, 1, 1, 1, 1, 1,
-0.2543698, -1.409363, -4.799533, 1, 1, 1, 1, 1,
-0.2537762, -0.7167724, -2.754073, 1, 1, 1, 1, 1,
-0.2510739, 1.359568, -2.386309, 1, 1, 1, 1, 1,
-0.2501618, -1.323399, -3.747507, 1, 1, 1, 1, 1,
-0.2482871, 0.3656904, 1.167732, 1, 1, 1, 1, 1,
-0.2433351, -0.6383381, -5.311805, 1, 1, 1, 1, 1,
-0.2407293, 0.2628378, -1.989474, 1, 1, 1, 1, 1,
-0.235018, -1.128201, -3.511254, 1, 1, 1, 1, 1,
-0.2292866, 0.2119212, -1.197952, 1, 1, 1, 1, 1,
-0.2289857, 1.24091, -0.04098944, 1, 1, 1, 1, 1,
-0.2289829, 1.392654, -0.842383, 1, 1, 1, 1, 1,
-0.2284572, 2.581168, 0.6981442, 1, 1, 1, 1, 1,
-0.2242043, -0.03472763, -5.174115, 1, 1, 1, 1, 1,
-0.2232488, 0.02713546, -1.832596, 0, 0, 1, 1, 1,
-0.222331, -0.4761861, -2.342061, 1, 0, 0, 1, 1,
-0.2219102, 0.3842041, -0.859573, 1, 0, 0, 1, 1,
-0.2192942, -1.417683, -2.000226, 1, 0, 0, 1, 1,
-0.2186647, 2.858211, -0.4609176, 1, 0, 0, 1, 1,
-0.2166225, 0.9707009, 0.5213087, 1, 0, 0, 1, 1,
-0.2108818, -1.476152, -2.691883, 0, 0, 0, 1, 1,
-0.2056364, -0.2595746, -2.133893, 0, 0, 0, 1, 1,
-0.205313, -0.1076582, -3.053112, 0, 0, 0, 1, 1,
-0.204135, 0.7440929, -0.589716, 0, 0, 0, 1, 1,
-0.2028273, -1.25962, -2.068336, 0, 0, 0, 1, 1,
-0.2002844, 0.1869852, -0.3372568, 0, 0, 0, 1, 1,
-0.1964396, -0.08651635, -1.822326, 0, 0, 0, 1, 1,
-0.1938951, 0.3689795, 0.4185943, 1, 1, 1, 1, 1,
-0.1926145, 1.757146, 0.5231569, 1, 1, 1, 1, 1,
-0.1914488, -0.9247717, -2.885922, 1, 1, 1, 1, 1,
-0.1880364, 0.3692028, -0.9164413, 1, 1, 1, 1, 1,
-0.1854918, 1.526802, 0.1196266, 1, 1, 1, 1, 1,
-0.1841877, 0.9780247, -0.9830157, 1, 1, 1, 1, 1,
-0.173094, 1.073953, 0.3558405, 1, 1, 1, 1, 1,
-0.172355, 0.4774143, -0.9445555, 1, 1, 1, 1, 1,
-0.1688139, -0.8085923, -2.487775, 1, 1, 1, 1, 1,
-0.1681355, 1.512086, 0.0270674, 1, 1, 1, 1, 1,
-0.1676704, -0.2166416, -2.654325, 1, 1, 1, 1, 1,
-0.161435, 1.513596, -0.5669065, 1, 1, 1, 1, 1,
-0.1592229, 1.558832, 0.4653883, 1, 1, 1, 1, 1,
-0.1573436, 0.7630588, -2.622453, 1, 1, 1, 1, 1,
-0.1558244, 0.2400487, 0.1350981, 1, 1, 1, 1, 1,
-0.154771, -1.014089, -1.288217, 0, 0, 1, 1, 1,
-0.1499107, 1.184708, -0.1197969, 1, 0, 0, 1, 1,
-0.1487343, 0.9308503, 0.09561505, 1, 0, 0, 1, 1,
-0.1479232, -1.929117, -3.184757, 1, 0, 0, 1, 1,
-0.1452974, 0.4564431, -0.3387335, 1, 0, 0, 1, 1,
-0.1452338, 0.3292585, -0.5925282, 1, 0, 0, 1, 1,
-0.143372, 1.34075, -1.709662, 0, 0, 0, 1, 1,
-0.1413918, -1.11167, -4.702066, 0, 0, 0, 1, 1,
-0.1380234, 0.4080067, -1.734016, 0, 0, 0, 1, 1,
-0.1359986, -0.1879086, -2.366377, 0, 0, 0, 1, 1,
-0.1301282, -0.7938376, -2.799962, 0, 0, 0, 1, 1,
-0.1282914, 0.2068005, -0.7139444, 0, 0, 0, 1, 1,
-0.1275948, -1.644565, -3.94181, 0, 0, 0, 1, 1,
-0.1269411, 0.7756328, -0.1414734, 1, 1, 1, 1, 1,
-0.1228124, 0.3248548, -3.06817, 1, 1, 1, 1, 1,
-0.1202358, -1.337444, -2.772915, 1, 1, 1, 1, 1,
-0.1197294, -0.6858546, -0.7976177, 1, 1, 1, 1, 1,
-0.1187375, -0.1387122, -4.605572, 1, 1, 1, 1, 1,
-0.1175145, 1.703367, 0.2885881, 1, 1, 1, 1, 1,
-0.1141263, -0.7237705, -2.466409, 1, 1, 1, 1, 1,
-0.1116755, 2.499084, -0.6715193, 1, 1, 1, 1, 1,
-0.1082631, 0.1091354, -1.86196, 1, 1, 1, 1, 1,
-0.1063153, 0.4486051, -0.4024718, 1, 1, 1, 1, 1,
-0.105925, -0.8942961, -2.80644, 1, 1, 1, 1, 1,
-0.09674186, -0.5690287, -3.773684, 1, 1, 1, 1, 1,
-0.09611276, -0.0009514173, -0.4422221, 1, 1, 1, 1, 1,
-0.09105238, 0.9707485, -0.5953931, 1, 1, 1, 1, 1,
-0.08964353, -0.6763542, -0.6175666, 1, 1, 1, 1, 1,
-0.08947209, -0.1216707, -2.86606, 0, 0, 1, 1, 1,
-0.0850942, 1.374665, -0.02748121, 1, 0, 0, 1, 1,
-0.08139274, 0.6872654, 1.395739, 1, 0, 0, 1, 1,
-0.08100743, 1.373862, 1.527948, 1, 0, 0, 1, 1,
-0.07625549, 0.3510657, -0.4849746, 1, 0, 0, 1, 1,
-0.07230981, 1.816296, -0.6274442, 1, 0, 0, 1, 1,
-0.06815489, -1.741911, -3.170262, 0, 0, 0, 1, 1,
-0.06533408, -0.599155, -3.480797, 0, 0, 0, 1, 1,
-0.06241477, 2.381959, -0.8528565, 0, 0, 0, 1, 1,
-0.06186317, -0.6253639, -4.003166, 0, 0, 0, 1, 1,
-0.06175753, 1.029952, -1.214113, 0, 0, 0, 1, 1,
-0.06059595, -1.093073, -2.646227, 0, 0, 0, 1, 1,
-0.05378139, 0.3408504, 0.7774459, 0, 0, 0, 1, 1,
-0.04283488, -0.7147296, -3.241013, 1, 1, 1, 1, 1,
-0.03938858, 0.9518651, 1.039266, 1, 1, 1, 1, 1,
-0.03935994, 1.339454, -0.1827813, 1, 1, 1, 1, 1,
-0.03705962, 1.69375, 1.466115, 1, 1, 1, 1, 1,
-0.03671105, -0.1052599, -4.186179, 1, 1, 1, 1, 1,
-0.02517877, 0.9940581, -2.200181, 1, 1, 1, 1, 1,
-0.02486659, -0.8303151, -1.779098, 1, 1, 1, 1, 1,
-0.02272819, -0.5523131, -2.559351, 1, 1, 1, 1, 1,
-0.01883062, -0.6437456, -4.198427, 1, 1, 1, 1, 1,
-0.01559667, -0.3533943, -2.471924, 1, 1, 1, 1, 1,
-0.01543328, 0.3054065, 0.2891739, 1, 1, 1, 1, 1,
-0.0135337, 1.017344, 0.6861336, 1, 1, 1, 1, 1,
-0.0135035, 1.631365, 0.02214458, 1, 1, 1, 1, 1,
-0.01250274, -0.9482476, -4.037956, 1, 1, 1, 1, 1,
-0.01187503, -0.7470619, -2.7542, 1, 1, 1, 1, 1,
-0.007540799, 0.0003418409, -0.8289261, 0, 0, 1, 1, 1,
-0.006396348, 0.3045286, 0.8168153, 1, 0, 0, 1, 1,
-0.002619498, -1.866703, -2.159514, 1, 0, 0, 1, 1,
-0.0002806068, -0.3706458, -3.974067, 1, 0, 0, 1, 1,
-0.0001166917, -1.375515, -3.200108, 1, 0, 0, 1, 1,
0.002066724, -0.7564611, 2.682372, 1, 0, 0, 1, 1,
0.006064155, -0.3296174, 3.489677, 0, 0, 0, 1, 1,
0.007042261, 1.029356, 0.07902443, 0, 0, 0, 1, 1,
0.007369871, -1.329492, 3.457537, 0, 0, 0, 1, 1,
0.01226235, 0.555861, -2.037391, 0, 0, 0, 1, 1,
0.01292904, 0.5076178, 0.6221895, 0, 0, 0, 1, 1,
0.01904523, -1.716985, 4.305955, 0, 0, 0, 1, 1,
0.01968717, 0.8533866, -1.350301, 0, 0, 0, 1, 1,
0.02193534, 0.6655731, 0.7204968, 1, 1, 1, 1, 1,
0.02507756, 0.618486, -0.2298649, 1, 1, 1, 1, 1,
0.02777739, 0.9635674, -0.1722336, 1, 1, 1, 1, 1,
0.03431302, -0.3802077, 2.325102, 1, 1, 1, 1, 1,
0.05076629, -0.2241519, 2.895464, 1, 1, 1, 1, 1,
0.05176786, -1.506864, 2.974013, 1, 1, 1, 1, 1,
0.05315688, -0.9141908, 2.230895, 1, 1, 1, 1, 1,
0.05654424, -0.806733, 3.016605, 1, 1, 1, 1, 1,
0.06399105, 0.9083061, 0.2184, 1, 1, 1, 1, 1,
0.07498132, -1.22093, 2.803533, 1, 1, 1, 1, 1,
0.07595468, -0.924818, 4.148418, 1, 1, 1, 1, 1,
0.0773893, -0.5234384, 3.396607, 1, 1, 1, 1, 1,
0.08458991, 0.02447383, 1.085672, 1, 1, 1, 1, 1,
0.08561044, 0.7877797, 0.8637273, 1, 1, 1, 1, 1,
0.08605458, -0.329848, 4.210821, 1, 1, 1, 1, 1,
0.08939002, 0.9825605, 0.2751884, 0, 0, 1, 1, 1,
0.08983225, -1.583035, 2.009343, 1, 0, 0, 1, 1,
0.09155151, 0.35317, -0.7978429, 1, 0, 0, 1, 1,
0.09194642, 0.1355631, 0.1656659, 1, 0, 0, 1, 1,
0.0943997, 0.1453752, -0.6272027, 1, 0, 0, 1, 1,
0.09865241, -0.8927752, 2.937926, 1, 0, 0, 1, 1,
0.09899478, 0.01759182, 0.2354313, 0, 0, 0, 1, 1,
0.09934887, 0.9920486, -0.09147274, 0, 0, 0, 1, 1,
0.1002063, -0.7487798, 3.503298, 0, 0, 0, 1, 1,
0.1015041, 0.8401269, 0.410635, 0, 0, 0, 1, 1,
0.1018234, -0.8630016, 4.317442, 0, 0, 0, 1, 1,
0.1020223, 0.9649696, 1.18702, 0, 0, 0, 1, 1,
0.1029008, 0.732263, 2.563622, 0, 0, 0, 1, 1,
0.1039861, 0.2426203, 0.5217879, 1, 1, 1, 1, 1,
0.1053598, -0.6489345, 3.146895, 1, 1, 1, 1, 1,
0.1063654, 0.1563615, 1.797112, 1, 1, 1, 1, 1,
0.1078563, -0.5310934, 1.258492, 1, 1, 1, 1, 1,
0.1215499, -0.3747161, 1.239523, 1, 1, 1, 1, 1,
0.1223719, 0.05942725, 0.6676185, 1, 1, 1, 1, 1,
0.1242609, -0.1501988, 1.885453, 1, 1, 1, 1, 1,
0.1245833, -0.3955299, 3.338377, 1, 1, 1, 1, 1,
0.132161, -2.07149, 3.609968, 1, 1, 1, 1, 1,
0.1395181, -1.442805, 2.932657, 1, 1, 1, 1, 1,
0.1431684, -1.850142, 5.079059, 1, 1, 1, 1, 1,
0.143793, 0.6671277, 0.3160092, 1, 1, 1, 1, 1,
0.1466312, 0.1905826, 0.3664575, 1, 1, 1, 1, 1,
0.1466881, -0.3150501, 1.909975, 1, 1, 1, 1, 1,
0.1491701, -0.02777861, 1.12798, 1, 1, 1, 1, 1,
0.1498553, 0.8635445, 1.774073, 0, 0, 1, 1, 1,
0.1520064, -0.8815691, 5.429668, 1, 0, 0, 1, 1,
0.1540211, -1.846187, 3.763407, 1, 0, 0, 1, 1,
0.1548979, -0.1024176, 3.145639, 1, 0, 0, 1, 1,
0.1562906, -2.137286, 3.757946, 1, 0, 0, 1, 1,
0.1612937, -1.538128, 1.201135, 1, 0, 0, 1, 1,
0.1625141, 0.2530693, 0.4022546, 0, 0, 0, 1, 1,
0.1685141, 1.235413, -0.2173443, 0, 0, 0, 1, 1,
0.1709799, 0.53907, 0.7194017, 0, 0, 0, 1, 1,
0.1744915, -2.159543, 3.513091, 0, 0, 0, 1, 1,
0.183355, -0.3338597, 2.903955, 0, 0, 0, 1, 1,
0.1863666, -0.8848748, 1.48958, 0, 0, 0, 1, 1,
0.1871735, -0.415603, 3.614598, 0, 0, 0, 1, 1,
0.1887864, 1.383564, -2.925591, 1, 1, 1, 1, 1,
0.1893837, -1.559987, 1.181416, 1, 1, 1, 1, 1,
0.189778, -0.3273448, 3.64838, 1, 1, 1, 1, 1,
0.1906445, 1.162331, 0.7605261, 1, 1, 1, 1, 1,
0.1957056, 2.901548, 0.2493037, 1, 1, 1, 1, 1,
0.1969704, 0.3932256, 0.1432465, 1, 1, 1, 1, 1,
0.1970538, 0.152917, 2.155042, 1, 1, 1, 1, 1,
0.2021283, -0.317212, 2.655113, 1, 1, 1, 1, 1,
0.2030953, 0.8789289, 0.7104348, 1, 1, 1, 1, 1,
0.2043547, -0.3618257, 2.489415, 1, 1, 1, 1, 1,
0.2064168, -1.04305, 2.732089, 1, 1, 1, 1, 1,
0.2091969, -0.7173035, 2.803889, 1, 1, 1, 1, 1,
0.2120462, -0.9238932, 2.169359, 1, 1, 1, 1, 1,
0.2127482, 0.3609807, 0.556967, 1, 1, 1, 1, 1,
0.2146986, -2.089218, 2.827879, 1, 1, 1, 1, 1,
0.2272913, 1.197707, 0.9983336, 0, 0, 1, 1, 1,
0.230305, -0.8433429, 2.651194, 1, 0, 0, 1, 1,
0.23215, 0.2667335, 0.2478487, 1, 0, 0, 1, 1,
0.2347637, -0.2595926, 0.783142, 1, 0, 0, 1, 1,
0.2358736, 1.099526, -1.380048, 1, 0, 0, 1, 1,
0.2369281, 0.9609919, 0.5515748, 1, 0, 0, 1, 1,
0.2384674, 1.308776, 0.7590439, 0, 0, 0, 1, 1,
0.2398503, -1.520343, 2.721252, 0, 0, 0, 1, 1,
0.2421015, 0.8016089, 1.666562, 0, 0, 0, 1, 1,
0.2425023, 0.6004518, 0.03395744, 0, 0, 0, 1, 1,
0.2453126, 0.6510643, 0.6668081, 0, 0, 0, 1, 1,
0.2542795, 1.426917, -0.0794577, 0, 0, 0, 1, 1,
0.2571407, -1.276972, 1.837995, 0, 0, 0, 1, 1,
0.2599058, -0.05561763, 2.077986, 1, 1, 1, 1, 1,
0.2601279, 1.702608, 0.4272898, 1, 1, 1, 1, 1,
0.2611572, -1.367337, 3.441987, 1, 1, 1, 1, 1,
0.2646899, 1.333225, 2.186659, 1, 1, 1, 1, 1,
0.2659788, -0.2414553, 2.091235, 1, 1, 1, 1, 1,
0.2677889, 0.1373766, 1.813837, 1, 1, 1, 1, 1,
0.268469, -0.6620575, 3.074536, 1, 1, 1, 1, 1,
0.2714382, -0.9689132, 2.317655, 1, 1, 1, 1, 1,
0.2744296, 1.252244, 1.399698, 1, 1, 1, 1, 1,
0.2744856, -0.4368188, 3.273398, 1, 1, 1, 1, 1,
0.2805946, 0.1245486, 0.5834787, 1, 1, 1, 1, 1,
0.2868086, -1.644761, 4.002969, 1, 1, 1, 1, 1,
0.2892047, 0.8661115, 1.129392, 1, 1, 1, 1, 1,
0.2916372, -0.7573535, 1.790284, 1, 1, 1, 1, 1,
0.2918372, -2.152676, 1.3678, 1, 1, 1, 1, 1,
0.292729, 0.5675055, -1.253236, 0, 0, 1, 1, 1,
0.2981035, 0.5929061, 0.1359095, 1, 0, 0, 1, 1,
0.2998462, -0.3067438, 2.911382, 1, 0, 0, 1, 1,
0.3000509, 0.9997986, -2.212827, 1, 0, 0, 1, 1,
0.3011969, -1.354604, 1.422026, 1, 0, 0, 1, 1,
0.3095083, -0.1476531, 2.037037, 1, 0, 0, 1, 1,
0.3129623, 1.163561, 1.103782, 0, 0, 0, 1, 1,
0.3164578, 1.691437, 3.295456, 0, 0, 0, 1, 1,
0.3169773, -1.433023, 2.156328, 0, 0, 0, 1, 1,
0.320304, -0.537912, 0.3848854, 0, 0, 0, 1, 1,
0.323064, -0.1394673, 1.466713, 0, 0, 0, 1, 1,
0.3258399, -0.9477203, 1.905845, 0, 0, 0, 1, 1,
0.3284346, -0.6551751, 2.679458, 0, 0, 0, 1, 1,
0.329987, -0.296385, 2.914673, 1, 1, 1, 1, 1,
0.3307779, 1.873354, 0.2265272, 1, 1, 1, 1, 1,
0.3345661, 0.2326689, 2.697865, 1, 1, 1, 1, 1,
0.3363321, 1.152904, 0.5621589, 1, 1, 1, 1, 1,
0.3382443, 0.1801666, -0.4805879, 1, 1, 1, 1, 1,
0.3383857, -0.3166161, 3.105613, 1, 1, 1, 1, 1,
0.3394234, 0.7536293, -0.3150061, 1, 1, 1, 1, 1,
0.3416558, 0.4799375, 1.304167, 1, 1, 1, 1, 1,
0.3430326, 1.02636, 0.5538987, 1, 1, 1, 1, 1,
0.3438607, -0.8003358, 3.467174, 1, 1, 1, 1, 1,
0.3456966, 0.5346448, 0.969043, 1, 1, 1, 1, 1,
0.3480619, 0.5642184, 0.3928346, 1, 1, 1, 1, 1,
0.348615, 1.008133, 1.818445, 1, 1, 1, 1, 1,
0.3540219, 1.336368, 1.986104, 1, 1, 1, 1, 1,
0.3669836, 1.847366, -1.126446, 1, 1, 1, 1, 1,
0.3684124, 0.3618195, 1.202184, 0, 0, 1, 1, 1,
0.3685343, -0.5240179, 0.6730633, 1, 0, 0, 1, 1,
0.3719637, 1.207277, 0.3749458, 1, 0, 0, 1, 1,
0.3734535, -0.3045751, 2.453727, 1, 0, 0, 1, 1,
0.3753056, 0.3988903, 0.4362927, 1, 0, 0, 1, 1,
0.3810319, -0.5561839, 1.874096, 1, 0, 0, 1, 1,
0.3818039, 0.9612959, 1.363234, 0, 0, 0, 1, 1,
0.3836012, 0.4280654, 0.8883442, 0, 0, 0, 1, 1,
0.383639, -0.7148156, 1.158462, 0, 0, 0, 1, 1,
0.3862954, -0.5583149, 2.639986, 0, 0, 0, 1, 1,
0.3888676, 1.696328, 2.13784, 0, 0, 0, 1, 1,
0.3913457, 0.4064386, 1.828421, 0, 0, 0, 1, 1,
0.4025619, -1.422036, 2.740925, 0, 0, 0, 1, 1,
0.4056252, 0.349983, 1.351408, 1, 1, 1, 1, 1,
0.4119042, -2.062079, 2.260539, 1, 1, 1, 1, 1,
0.4142165, 3.052464, -1.032438, 1, 1, 1, 1, 1,
0.4154472, 0.4190304, 1.340454, 1, 1, 1, 1, 1,
0.4178045, -1.095801, 3.61934, 1, 1, 1, 1, 1,
0.4180756, 2.034477, 0.4143991, 1, 1, 1, 1, 1,
0.4260385, -0.5019887, 3.130387, 1, 1, 1, 1, 1,
0.4262009, -3.298011, 3.816405, 1, 1, 1, 1, 1,
0.4293514, -0.8106308, 2.923085, 1, 1, 1, 1, 1,
0.439685, -0.4548958, 3.47147, 1, 1, 1, 1, 1,
0.4406399, 2.260715, 0.6169289, 1, 1, 1, 1, 1,
0.4426695, 0.2457819, -0.03514906, 1, 1, 1, 1, 1,
0.4438205, 0.5553235, -1.022601, 1, 1, 1, 1, 1,
0.4442614, -0.5613754, 3.085688, 1, 1, 1, 1, 1,
0.4482659, 0.8852541, -1.449, 1, 1, 1, 1, 1,
0.4497622, -0.0189287, 2.412902, 0, 0, 1, 1, 1,
0.4506854, 0.04747196, 1.031002, 1, 0, 0, 1, 1,
0.4512124, 1.187602, 1.511423, 1, 0, 0, 1, 1,
0.455541, 1.902158, -0.1805594, 1, 0, 0, 1, 1,
0.4571178, -0.3931509, 3.903566, 1, 0, 0, 1, 1,
0.4603, 0.953883, 2.096336, 1, 0, 0, 1, 1,
0.463497, 0.3180346, 1.531527, 0, 0, 0, 1, 1,
0.4692348, 0.6596, -0.2731133, 0, 0, 0, 1, 1,
0.4721471, -0.05703925, 2.833339, 0, 0, 0, 1, 1,
0.4748008, -0.4093941, 2.298341, 0, 0, 0, 1, 1,
0.4808012, -0.3002315, 3.182744, 0, 0, 0, 1, 1,
0.4812178, -0.3960363, 2.645156, 0, 0, 0, 1, 1,
0.4820574, -0.507411, 1.954506, 0, 0, 0, 1, 1,
0.486122, -0.2483041, 1.519379, 1, 1, 1, 1, 1,
0.4877283, 0.5039896, 1.372188, 1, 1, 1, 1, 1,
0.4902304, 0.2407673, 0.5191416, 1, 1, 1, 1, 1,
0.4957216, 1.002828, 2.856616, 1, 1, 1, 1, 1,
0.4976959, 0.3837687, 1.240118, 1, 1, 1, 1, 1,
0.4988133, -2.117661, 2.85094, 1, 1, 1, 1, 1,
0.5006682, 1.209101, -2.442425, 1, 1, 1, 1, 1,
0.5024061, 0.7868235, 1.529986, 1, 1, 1, 1, 1,
0.5050278, 0.904224, 0.2510593, 1, 1, 1, 1, 1,
0.5157301, 1.622085, 0.2013331, 1, 1, 1, 1, 1,
0.5346081, -0.4314468, 0.7013111, 1, 1, 1, 1, 1,
0.5415756, 0.2995608, -0.8425324, 1, 1, 1, 1, 1,
0.5464914, -1.113718, 1.690579, 1, 1, 1, 1, 1,
0.5478151, 0.04619041, 1.553347, 1, 1, 1, 1, 1,
0.5493346, -0.6000364, 2.855822, 1, 1, 1, 1, 1,
0.5495953, -0.4777641, 0.3965761, 0, 0, 1, 1, 1,
0.5540882, 0.2078764, -0.895062, 1, 0, 0, 1, 1,
0.5600999, 1.17662, -0.2640651, 1, 0, 0, 1, 1,
0.5673178, -0.5549898, 3.492631, 1, 0, 0, 1, 1,
0.5726848, -0.05994597, 2.299587, 1, 0, 0, 1, 1,
0.5738111, 0.05811771, 1.471066, 1, 0, 0, 1, 1,
0.5807908, -0.534574, 2.543264, 0, 0, 0, 1, 1,
0.5815616, 0.3419613, 2.481941, 0, 0, 0, 1, 1,
0.5835555, -0.4119985, 2.569482, 0, 0, 0, 1, 1,
0.5900201, -0.918559, 2.82252, 0, 0, 0, 1, 1,
0.5910638, -0.01614356, 0.992596, 0, 0, 0, 1, 1,
0.5915899, -0.3782531, 2.895648, 0, 0, 0, 1, 1,
0.6002673, -0.7316399, 3.736151, 0, 0, 0, 1, 1,
0.612719, 0.07854354, 0.6454669, 1, 1, 1, 1, 1,
0.6129977, -1.236426, 3.381905, 1, 1, 1, 1, 1,
0.6142856, -0.3164721, 2.326921, 1, 1, 1, 1, 1,
0.6165763, 0.6074775, 0.7228276, 1, 1, 1, 1, 1,
0.6209542, 0.24909, 1.308336, 1, 1, 1, 1, 1,
0.6227764, 1.417412, -0.286034, 1, 1, 1, 1, 1,
0.6238181, -2.222444, 4.483888, 1, 1, 1, 1, 1,
0.6240082, 0.1680665, 1.627569, 1, 1, 1, 1, 1,
0.6247933, 0.8540445, 0.2893083, 1, 1, 1, 1, 1,
0.6257836, -0.1006629, 1.650388, 1, 1, 1, 1, 1,
0.6332203, -2.582249, 3.209731, 1, 1, 1, 1, 1,
0.6349718, 0.6562705, -0.5854881, 1, 1, 1, 1, 1,
0.6405062, 0.2639003, 0.4755131, 1, 1, 1, 1, 1,
0.6504808, -0.1757932, 1.876628, 1, 1, 1, 1, 1,
0.6519492, 0.8895859, -0.3305064, 1, 1, 1, 1, 1,
0.6571421, -0.158238, 3.111855, 0, 0, 1, 1, 1,
0.6604713, -3.33459, 1.146192, 1, 0, 0, 1, 1,
0.6625348, -0.09563257, 2.062423, 1, 0, 0, 1, 1,
0.6673839, 1.221202, 0.7110131, 1, 0, 0, 1, 1,
0.673223, 2.064761, 1.312736, 1, 0, 0, 1, 1,
0.676032, 1.395475, 2.684264, 1, 0, 0, 1, 1,
0.6777567, -0.9982596, 3.655352, 0, 0, 0, 1, 1,
0.6800635, -0.8494024, 1.354058, 0, 0, 0, 1, 1,
0.6815373, -1.045228, 1.770616, 0, 0, 0, 1, 1,
0.6856854, 0.8390836, -1.218759, 0, 0, 0, 1, 1,
0.6866048, 0.3701863, 0.02720935, 0, 0, 0, 1, 1,
0.6935023, -0.7166573, 1.378641, 0, 0, 0, 1, 1,
0.6942779, 0.05580818, 1.551658, 0, 0, 0, 1, 1,
0.6952785, 1.370697, 1.479793, 1, 1, 1, 1, 1,
0.6972705, -0.645314, 0.744552, 1, 1, 1, 1, 1,
0.7091387, -0.6129962, 2.745065, 1, 1, 1, 1, 1,
0.7229189, 0.4519613, 0.1424923, 1, 1, 1, 1, 1,
0.7256421, -1.201171, 2.425107, 1, 1, 1, 1, 1,
0.7271815, 0.8580838, 1.708879, 1, 1, 1, 1, 1,
0.7282984, -0.1804673, 3.409572, 1, 1, 1, 1, 1,
0.7285678, -0.2288321, 3.299979, 1, 1, 1, 1, 1,
0.7313041, -0.8368196, 3.508571, 1, 1, 1, 1, 1,
0.7327768, -1.353399, 0.9921478, 1, 1, 1, 1, 1,
0.7339208, -0.9228987, 0.3588719, 1, 1, 1, 1, 1,
0.7381148, 0.4223019, 0.3650905, 1, 1, 1, 1, 1,
0.7389163, -0.3114506, 0.7107623, 1, 1, 1, 1, 1,
0.7399703, 0.5038404, 1.086073, 1, 1, 1, 1, 1,
0.7409207, -1.402341, 2.616017, 1, 1, 1, 1, 1,
0.7417989, -0.4954079, 4.398056, 0, 0, 1, 1, 1,
0.7423369, 0.7381549, -0.2586849, 1, 0, 0, 1, 1,
0.7499644, -0.620603, 2.469234, 1, 0, 0, 1, 1,
0.7507085, -0.08390178, 1.383692, 1, 0, 0, 1, 1,
0.7528007, -0.5087911, 2.172977, 1, 0, 0, 1, 1,
0.7531326, 0.1075433, 0.1139077, 1, 0, 0, 1, 1,
0.7555397, -0.7863094, 1.039428, 0, 0, 0, 1, 1,
0.755572, -0.6783966, 2.133922, 0, 0, 0, 1, 1,
0.7635475, 0.6947832, 0.8230086, 0, 0, 0, 1, 1,
0.7637336, 0.5126847, -0.1095854, 0, 0, 0, 1, 1,
0.7642532, 0.7725909, 1.225987, 0, 0, 0, 1, 1,
0.7660447, 1.384405, 0.3878769, 0, 0, 0, 1, 1,
0.7678664, -1.077706, 2.708425, 0, 0, 0, 1, 1,
0.7686063, 0.8927948, -0.4013495, 1, 1, 1, 1, 1,
0.770731, 0.1128847, 0.8388375, 1, 1, 1, 1, 1,
0.7743152, -1.483984, 2.837565, 1, 1, 1, 1, 1,
0.774617, 1.265628, -0.3272977, 1, 1, 1, 1, 1,
0.7768327, -0.3245679, 2.302537, 1, 1, 1, 1, 1,
0.7772504, -1.394995, 2.247536, 1, 1, 1, 1, 1,
0.7808511, 0.8128711, 1.77452, 1, 1, 1, 1, 1,
0.7814242, 0.8606172, 1.341533, 1, 1, 1, 1, 1,
0.7831272, -0.4849222, 1.458125, 1, 1, 1, 1, 1,
0.7909961, -0.4240688, 2.429866, 1, 1, 1, 1, 1,
0.7946044, 0.3563712, 1.386162, 1, 1, 1, 1, 1,
0.7955059, 1.072843, 0.176746, 1, 1, 1, 1, 1,
0.7977256, 1.247825, 2.130161, 1, 1, 1, 1, 1,
0.7982203, 0.7122278, 1.816518, 1, 1, 1, 1, 1,
0.8054596, 1.022995, 0.7212321, 1, 1, 1, 1, 1,
0.8158811, 1.089234, -0.04424965, 0, 0, 1, 1, 1,
0.8190839, 1.237736, 2.855838, 1, 0, 0, 1, 1,
0.8191115, 2.574236, 1.649839, 1, 0, 0, 1, 1,
0.8192075, 0.565016, 1.587079, 1, 0, 0, 1, 1,
0.819523, 0.9503174, -0.5724363, 1, 0, 0, 1, 1,
0.8229847, -0.5776874, 1.058027, 1, 0, 0, 1, 1,
0.8259599, -0.90284, 3.182099, 0, 0, 0, 1, 1,
0.8261654, -1.250714, 0.1223147, 0, 0, 0, 1, 1,
0.8274125, -0.07457296, 1.851455, 0, 0, 0, 1, 1,
0.8304352, 0.2432511, 1.228098, 0, 0, 0, 1, 1,
0.8372379, -0.8694177, 0.06501722, 0, 0, 0, 1, 1,
0.8383949, -0.03908743, 2.246265, 0, 0, 0, 1, 1,
0.8387965, -1.016599, 1.540998, 0, 0, 0, 1, 1,
0.8397824, -0.6960742, 3.717309, 1, 1, 1, 1, 1,
0.8415651, 2.590325, 1.103033, 1, 1, 1, 1, 1,
0.8416206, -2.374079, 2.088575, 1, 1, 1, 1, 1,
0.8489931, -0.5646374, 2.417801, 1, 1, 1, 1, 1,
0.8508772, 0.2011666, -0.9913918, 1, 1, 1, 1, 1,
0.8509871, -0.8003653, 1.797259, 1, 1, 1, 1, 1,
0.8513106, -0.4028926, 2.486634, 1, 1, 1, 1, 1,
0.8567022, 0.08968919, 3.244156, 1, 1, 1, 1, 1,
0.8567795, 1.629564, -0.9622977, 1, 1, 1, 1, 1,
0.8582878, 0.6276691, 0.3143066, 1, 1, 1, 1, 1,
0.8598527, 0.1124145, 1.164061, 1, 1, 1, 1, 1,
0.8641514, 0.4509151, 2.364159, 1, 1, 1, 1, 1,
0.8831286, -0.01762519, 3.843463, 1, 1, 1, 1, 1,
0.8885345, -0.7029304, 1.818575, 1, 1, 1, 1, 1,
0.8916491, -0.5749651, 0.2962473, 1, 1, 1, 1, 1,
0.898323, 0.6615247, 1.703117, 0, 0, 1, 1, 1,
0.8991447, -1.131115, 2.814656, 1, 0, 0, 1, 1,
0.9053772, 0.4461139, 2.853585, 1, 0, 0, 1, 1,
0.9059201, 0.3829146, 0.971561, 1, 0, 0, 1, 1,
0.9077006, 0.4888208, 1.815942, 1, 0, 0, 1, 1,
0.9078223, 0.9690331, -0.6116376, 1, 0, 0, 1, 1,
0.9115005, -0.1592089, 0.4758733, 0, 0, 0, 1, 1,
0.9146677, 0.1559344, 3.316479, 0, 0, 0, 1, 1,
0.9163587, -1.194631, 2.284024, 0, 0, 0, 1, 1,
0.9188836, 0.3559775, 0.9901191, 0, 0, 0, 1, 1,
0.9202151, 1.212737, 0.3757814, 0, 0, 0, 1, 1,
0.924634, -0.1938899, 3.400181, 0, 0, 0, 1, 1,
0.9281999, -0.9533207, 3.356824, 0, 0, 0, 1, 1,
0.9291392, -0.3864767, 2.733235, 1, 1, 1, 1, 1,
0.9298293, -2.132295, 3.413975, 1, 1, 1, 1, 1,
0.9301847, 0.3157096, 0.7437217, 1, 1, 1, 1, 1,
0.9405946, 0.2906354, 2.026129, 1, 1, 1, 1, 1,
0.9432411, -0.2195917, 4.1482, 1, 1, 1, 1, 1,
0.9481127, 1.613325, -1.081022, 1, 1, 1, 1, 1,
0.9487215, 0.2100715, 1.558035, 1, 1, 1, 1, 1,
0.9508886, 0.2506404, 1.654965, 1, 1, 1, 1, 1,
0.9533707, 0.8088867, -0.5412872, 1, 1, 1, 1, 1,
0.9572302, -0.1429132, 2.925918, 1, 1, 1, 1, 1,
0.9602516, 0.338178, 0.07549258, 1, 1, 1, 1, 1,
0.9670424, 0.5413454, 4.502364, 1, 1, 1, 1, 1,
0.9724049, 0.4177273, 1.291805, 1, 1, 1, 1, 1,
0.9755156, 0.5456201, -0.1581112, 1, 1, 1, 1, 1,
0.9829062, -0.6588776, 1.266098, 1, 1, 1, 1, 1,
0.9839898, 0.1773209, 0.1556384, 0, 0, 1, 1, 1,
0.9890124, 1.280039, -0.3078962, 1, 0, 0, 1, 1,
0.9947627, 0.4533904, 1.001456, 1, 0, 0, 1, 1,
0.9966543, 0.5577562, 1.745077, 1, 0, 0, 1, 1,
1.000695, 0.3004496, 1.511412, 1, 0, 0, 1, 1,
1.006023, -2.68126, 2.291264, 1, 0, 0, 1, 1,
1.01, -0.9684181, 2.790145, 0, 0, 0, 1, 1,
1.011788, 0.347774, 1.468019, 0, 0, 0, 1, 1,
1.024634, -0.9560136, 2.825127, 0, 0, 0, 1, 1,
1.02907, 0.6530344, 2.938441, 0, 0, 0, 1, 1,
1.034439, 0.6713102, -0.8266248, 0, 0, 0, 1, 1,
1.035588, -1.15938, 3.270001, 0, 0, 0, 1, 1,
1.039097, 0.7597672, 1.142308, 0, 0, 0, 1, 1,
1.042062, -1.834279, 2.49109, 1, 1, 1, 1, 1,
1.042868, 0.9665253, 0.2471878, 1, 1, 1, 1, 1,
1.043865, 0.6843541, 0.9076816, 1, 1, 1, 1, 1,
1.048125, -0.1575791, 1.006405, 1, 1, 1, 1, 1,
1.053992, 0.2115701, 2.027825, 1, 1, 1, 1, 1,
1.05746, 0.315527, 1.750573, 1, 1, 1, 1, 1,
1.058178, 0.8052847, 1.537258, 1, 1, 1, 1, 1,
1.064753, 0.4787223, 0.8898857, 1, 1, 1, 1, 1,
1.067821, -0.3874173, 4.057459, 1, 1, 1, 1, 1,
1.076148, -0.1166032, 2.590208, 1, 1, 1, 1, 1,
1.077457, 1.371075, 0.6451518, 1, 1, 1, 1, 1,
1.077563, -0.3847076, 1.352533, 1, 1, 1, 1, 1,
1.079395, -1.363446, 1.669385, 1, 1, 1, 1, 1,
1.081389, -0.7599999, 1.40277, 1, 1, 1, 1, 1,
1.084348, -0.5158135, 1.400601, 1, 1, 1, 1, 1,
1.090623, 0.4158231, 1.035704, 0, 0, 1, 1, 1,
1.091277, 1.361624, 0.1501416, 1, 0, 0, 1, 1,
1.093967, -0.09084915, 1.589685, 1, 0, 0, 1, 1,
1.114495, 0.09373761, 1.403837, 1, 0, 0, 1, 1,
1.119359, 2.486907, 1.248707, 1, 0, 0, 1, 1,
1.123006, 0.9879378, 2.451617, 1, 0, 0, 1, 1,
1.123353, 0.5762731, 1.706721, 0, 0, 0, 1, 1,
1.130769, -0.7120515, 2.050445, 0, 0, 0, 1, 1,
1.132521, -0.5297375, 2.426893, 0, 0, 0, 1, 1,
1.136553, -1.657206, 1.857357, 0, 0, 0, 1, 1,
1.141318, -1.027682, 2.368283, 0, 0, 0, 1, 1,
1.142234, 0.6762379, -0.3007452, 0, 0, 0, 1, 1,
1.143427, -0.2446638, 3.757066, 0, 0, 0, 1, 1,
1.145329, -2.066756, 1.092567, 1, 1, 1, 1, 1,
1.165024, -0.1748006, 1.199126, 1, 1, 1, 1, 1,
1.168468, -1.335705, 1.745833, 1, 1, 1, 1, 1,
1.171304, 0.8247536, -0.01194043, 1, 1, 1, 1, 1,
1.173129, 0.6497688, 1.191195, 1, 1, 1, 1, 1,
1.189445, -2.167507, 3.539999, 1, 1, 1, 1, 1,
1.206241, 0.9659459, 1.02889, 1, 1, 1, 1, 1,
1.210934, 0.8063212, 1.01944, 1, 1, 1, 1, 1,
1.212161, 0.9133394, 0.2679549, 1, 1, 1, 1, 1,
1.213532, -0.06592061, 0.3769119, 1, 1, 1, 1, 1,
1.218235, -0.2671645, 0.2079374, 1, 1, 1, 1, 1,
1.218831, -0.5006458, 1.801322, 1, 1, 1, 1, 1,
1.222418, -0.2602928, 1.127592, 1, 1, 1, 1, 1,
1.231218, -0.2410959, 0.4590286, 1, 1, 1, 1, 1,
1.234086, -0.4116004, 1.94188, 1, 1, 1, 1, 1,
1.235072, -0.8126959, 1.615416, 0, 0, 1, 1, 1,
1.235212, -1.078712, 3.462003, 1, 0, 0, 1, 1,
1.248463, 0.5500865, 2.753707, 1, 0, 0, 1, 1,
1.251799, 1.430147, 0.5704554, 1, 0, 0, 1, 1,
1.256304, -0.2875694, 2.887154, 1, 0, 0, 1, 1,
1.259219, 0.08787419, -0.2077637, 1, 0, 0, 1, 1,
1.260781, -0.5868368, 3.974528, 0, 0, 0, 1, 1,
1.262098, -0.0701073, 1.489806, 0, 0, 0, 1, 1,
1.267103, -0.03719605, 0.6296383, 0, 0, 0, 1, 1,
1.270714, 0.008853292, 1.381108, 0, 0, 0, 1, 1,
1.286307, 0.4240645, 1.801198, 0, 0, 0, 1, 1,
1.289123, -0.5036637, 2.587594, 0, 0, 0, 1, 1,
1.291824, 0.09400992, 1.70273, 0, 0, 0, 1, 1,
1.293754, -1.166799, 2.204109, 1, 1, 1, 1, 1,
1.295048, -0.9437748, 1.337355, 1, 1, 1, 1, 1,
1.316762, 0.2196338, 3.094237, 1, 1, 1, 1, 1,
1.319721, -0.2288533, 1.620836, 1, 1, 1, 1, 1,
1.326012, -0.3694367, 1.951535, 1, 1, 1, 1, 1,
1.330723, 1.705015, 0.8986492, 1, 1, 1, 1, 1,
1.336818, 0.2429049, 0.4816756, 1, 1, 1, 1, 1,
1.34349, 0.02791198, 1.231629, 1, 1, 1, 1, 1,
1.347151, 1.322125, 1.788883, 1, 1, 1, 1, 1,
1.352341, -0.3362633, 0.8875495, 1, 1, 1, 1, 1,
1.356549, 0.1742961, 3.724871, 1, 1, 1, 1, 1,
1.357403, -1.64845, 3.991583, 1, 1, 1, 1, 1,
1.360397, -0.8338583, 1.892673, 1, 1, 1, 1, 1,
1.378333, 1.472628, -0.9271502, 1, 1, 1, 1, 1,
1.38028, 0.6469882, 0.3822632, 1, 1, 1, 1, 1,
1.397734, -1.354051, 4.112928, 0, 0, 1, 1, 1,
1.400604, -0.1293079, 1.693652, 1, 0, 0, 1, 1,
1.400879, -0.2357718, 0.236057, 1, 0, 0, 1, 1,
1.427235, -0.4048221, 1.155064, 1, 0, 0, 1, 1,
1.430164, -0.1124087, 1.720262, 1, 0, 0, 1, 1,
1.43051, -1.348539, 0.9128576, 1, 0, 0, 1, 1,
1.439611, 0.5043823, 1.155104, 0, 0, 0, 1, 1,
1.446449, 0.9110473, 0.5623884, 0, 0, 0, 1, 1,
1.467393, 0.474289, 1.055166, 0, 0, 0, 1, 1,
1.47328, 1.209666, 2.438998, 0, 0, 0, 1, 1,
1.47351, -0.7310146, 2.994107, 0, 0, 0, 1, 1,
1.484803, -1.107673, 3.30946, 0, 0, 0, 1, 1,
1.490892, 0.4449671, 1.416579, 0, 0, 0, 1, 1,
1.496252, 0.4344154, 0.6298152, 1, 1, 1, 1, 1,
1.507645, -0.2194462, 2.263053, 1, 1, 1, 1, 1,
1.511653, 2.375005, 1.016372, 1, 1, 1, 1, 1,
1.51609, 0.757001, 2.754075, 1, 1, 1, 1, 1,
1.526133, 0.1617346, 1.845682, 1, 1, 1, 1, 1,
1.528917, -0.5250751, 1.213731, 1, 1, 1, 1, 1,
1.531826, -0.5503297, 3.58297, 1, 1, 1, 1, 1,
1.53323, -0.9953875, 2.078639, 1, 1, 1, 1, 1,
1.552842, 1.188985, 1.99004, 1, 1, 1, 1, 1,
1.559328, -1.712456, 3.466956, 1, 1, 1, 1, 1,
1.562994, 1.251612, 1.542992, 1, 1, 1, 1, 1,
1.588796, 0.6667809, 0.7941391, 1, 1, 1, 1, 1,
1.597558, 1.249282, -0.5209571, 1, 1, 1, 1, 1,
1.599548, 0.4096752, 1.07112, 1, 1, 1, 1, 1,
1.608148, -0.1773362, 3.40371, 1, 1, 1, 1, 1,
1.612625, 0.6068901, 2.885806, 0, 0, 1, 1, 1,
1.615372, -0.6007058, 1.444211, 1, 0, 0, 1, 1,
1.617897, -0.01702537, 1.111694, 1, 0, 0, 1, 1,
1.624509, -0.09774517, 2.878202, 1, 0, 0, 1, 1,
1.646844, -0.5259138, 1.713874, 1, 0, 0, 1, 1,
1.647537, -1.477211, 2.368236, 1, 0, 0, 1, 1,
1.648541, 0.8018351, 2.619379, 0, 0, 0, 1, 1,
1.657359, -1.373455, 3.473378, 0, 0, 0, 1, 1,
1.66894, -0.9284734, 2.368654, 0, 0, 0, 1, 1,
1.703474, 1.413754, -0.08851473, 0, 0, 0, 1, 1,
1.704518, 0.949674, 2.175233, 0, 0, 0, 1, 1,
1.706536, 0.5803583, 1.556184, 0, 0, 0, 1, 1,
1.738968, 1.348735, 1.271239, 0, 0, 0, 1, 1,
1.748749, 0.4885187, 0.9633954, 1, 1, 1, 1, 1,
1.782619, -0.7244931, 2.525105, 1, 1, 1, 1, 1,
1.785498, -1.035165, 4.38672, 1, 1, 1, 1, 1,
1.79155, -0.02259883, 1.531195, 1, 1, 1, 1, 1,
1.842925, -0.02520728, 1.215017, 1, 1, 1, 1, 1,
1.84851, -0.7308844, 3.128355, 1, 1, 1, 1, 1,
1.860088, -0.687804, 0.9363213, 1, 1, 1, 1, 1,
1.869047, -1.024501, 0.6665459, 1, 1, 1, 1, 1,
1.871529, -0.2952959, 1.154325, 1, 1, 1, 1, 1,
1.895911, -0.3781424, 1.367501, 1, 1, 1, 1, 1,
1.903758, -0.2570163, 1.342577, 1, 1, 1, 1, 1,
1.904313, 1.098466, -0.04721657, 1, 1, 1, 1, 1,
1.908663, 0.3983623, 0.6904854, 1, 1, 1, 1, 1,
1.913071, 0.2236611, 0.1709717, 1, 1, 1, 1, 1,
1.913599, -1.46222, 1.328169, 1, 1, 1, 1, 1,
1.918504, -0.8128663, 2.217512, 0, 0, 1, 1, 1,
1.928008, -1.103114, 0.8135362, 1, 0, 0, 1, 1,
1.971474, -0.4317003, 2.051124, 1, 0, 0, 1, 1,
2.011761, -0.3075926, 2.867652, 1, 0, 0, 1, 1,
2.015573, 0.5147865, 2.085705, 1, 0, 0, 1, 1,
2.106247, -0.342427, 2.07069, 1, 0, 0, 1, 1,
2.161515, -1.760152, 3.175018, 0, 0, 0, 1, 1,
2.260283, -1.404809, 2.945721, 0, 0, 0, 1, 1,
2.274407, -0.0812263, 1.149771, 0, 0, 0, 1, 1,
2.277037, -0.06664302, 1.781649, 0, 0, 0, 1, 1,
2.285411, 2.272393, 0.2792501, 0, 0, 0, 1, 1,
2.289915, -1.575988, 2.862579, 0, 0, 0, 1, 1,
2.292621, 1.459002, 0.05525689, 0, 0, 0, 1, 1,
2.304375, 0.7651319, 0.4389732, 1, 1, 1, 1, 1,
2.337264, -0.05619133, 2.038843, 1, 1, 1, 1, 1,
2.343622, -2.391595, 2.376002, 1, 1, 1, 1, 1,
2.402839, -0.1093512, 2.48492, 1, 1, 1, 1, 1,
2.827662, -1.428568, 0.8183436, 1, 1, 1, 1, 1,
2.884147, -0.5731452, 0.7947491, 1, 1, 1, 1, 1,
3.130029, 0.6740538, 1.366115, 1, 1, 1, 1, 1
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
var radius = 9.929742;
var distance = 34.8778;
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
mvMatrix.translate( 0.3239477, -0.2548776, -0.05893159 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.8778);
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
