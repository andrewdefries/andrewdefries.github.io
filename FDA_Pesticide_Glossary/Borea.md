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
-3.430221, -1.758596, -3.068051, 1, 0, 0, 1,
-3.344309, -0.2656679, -2.50492, 1, 0.007843138, 0, 1,
-3.159495, 0.1662775, -0.5265938, 1, 0.01176471, 0, 1,
-2.917244, -0.8529726, -1.581354, 1, 0.01960784, 0, 1,
-2.822662, -0.2525417, -1.639505, 1, 0.02352941, 0, 1,
-2.818084, -0.4919703, -1.210568, 1, 0.03137255, 0, 1,
-2.683055, -0.03748813, -2.793328, 1, 0.03529412, 0, 1,
-2.675409, -0.5615606, -0.8491669, 1, 0.04313726, 0, 1,
-2.496285, 1.421314, -2.42473, 1, 0.04705882, 0, 1,
-2.457188, -1.176487, -2.648875, 1, 0.05490196, 0, 1,
-2.427916, -0.6733032, -2.543767, 1, 0.05882353, 0, 1,
-2.401105, -0.5952677, -1.719403, 1, 0.06666667, 0, 1,
-2.380986, -0.7188766, -3.13919, 1, 0.07058824, 0, 1,
-2.366078, 0.1330062, -3.165083, 1, 0.07843138, 0, 1,
-2.335314, 0.1944443, -2.153143, 1, 0.08235294, 0, 1,
-2.329406, 1.167977, -2.047231, 1, 0.09019608, 0, 1,
-2.308848, 1.903054, -0.02238577, 1, 0.09411765, 0, 1,
-2.303322, 0.6568944, -2.029979, 1, 0.1019608, 0, 1,
-2.295625, -0.09934638, -2.260069, 1, 0.1098039, 0, 1,
-2.271752, -1.939505, -2.553648, 1, 0.1137255, 0, 1,
-2.189271, -1.604359, -1.927641, 1, 0.1215686, 0, 1,
-2.174935, 0.99188, -1.941604, 1, 0.1254902, 0, 1,
-2.17452, -0.2284947, -3.036278, 1, 0.1333333, 0, 1,
-2.174133, -0.5315648, -1.926392, 1, 0.1372549, 0, 1,
-2.150067, 0.3412702, -0.03634126, 1, 0.145098, 0, 1,
-2.098295, 2.29091, -1.15773, 1, 0.1490196, 0, 1,
-2.040376, -0.6489154, -3.206876, 1, 0.1568628, 0, 1,
-2.012959, -0.0534961, -1.361062, 1, 0.1607843, 0, 1,
-2.012703, 0.3577344, -1.470886, 1, 0.1686275, 0, 1,
-2.008979, -0.6252519, -0.4167528, 1, 0.172549, 0, 1,
-2.004316, -0.2036347, -0.7378542, 1, 0.1803922, 0, 1,
-1.997301, 0.9318671, -0.6790617, 1, 0.1843137, 0, 1,
-1.993178, -1.296187, -3.000107, 1, 0.1921569, 0, 1,
-1.946213, -0.6353812, -0.7531795, 1, 0.1960784, 0, 1,
-1.945747, -0.5010064, -0.5017453, 1, 0.2039216, 0, 1,
-1.932518, -0.1954234, -1.713369, 1, 0.2117647, 0, 1,
-1.930007, -1.111174, -1.875128, 1, 0.2156863, 0, 1,
-1.886835, -1.803673, -0.3459605, 1, 0.2235294, 0, 1,
-1.851697, -0.7057663, -2.614291, 1, 0.227451, 0, 1,
-1.834304, -0.04833032, -1.171883, 1, 0.2352941, 0, 1,
-1.830479, 0.3065156, -3.16504, 1, 0.2392157, 0, 1,
-1.829852, -0.4358507, -3.909422, 1, 0.2470588, 0, 1,
-1.810492, -1.346864, -2.31549, 1, 0.2509804, 0, 1,
-1.80684, 0.7187432, 0.2370031, 1, 0.2588235, 0, 1,
-1.804131, 2.109204, -0.3315836, 1, 0.2627451, 0, 1,
-1.800233, 1.101509, -2.110028, 1, 0.2705882, 0, 1,
-1.797728, -0.4068294, -2.978328, 1, 0.2745098, 0, 1,
-1.765246, 2.216098, -1.269949, 1, 0.282353, 0, 1,
-1.762918, 0.2100629, -1.24969, 1, 0.2862745, 0, 1,
-1.721649, 0.1146817, -2.338835, 1, 0.2941177, 0, 1,
-1.713758, -0.1728424, -1.59744, 1, 0.3019608, 0, 1,
-1.707837, 2.078707, -1.88149, 1, 0.3058824, 0, 1,
-1.680578, 0.6621496, -0.5897912, 1, 0.3137255, 0, 1,
-1.671799, 0.1762236, -1.308323, 1, 0.3176471, 0, 1,
-1.669784, -0.3961786, -2.172067, 1, 0.3254902, 0, 1,
-1.663036, 1.242152, -0.7366579, 1, 0.3294118, 0, 1,
-1.656248, 0.03294262, 1.507332, 1, 0.3372549, 0, 1,
-1.639828, -1.853167, -2.88755, 1, 0.3411765, 0, 1,
-1.624222, 0.3520795, -1.302367, 1, 0.3490196, 0, 1,
-1.615566, -1.021206, -2.007326, 1, 0.3529412, 0, 1,
-1.580365, -0.1436968, -1.414825, 1, 0.3607843, 0, 1,
-1.577509, -0.6966836, -1.49905, 1, 0.3647059, 0, 1,
-1.576957, -0.4099322, -2.165471, 1, 0.372549, 0, 1,
-1.575709, -0.03310561, -1.791916, 1, 0.3764706, 0, 1,
-1.557967, -1.442494, -4.372322, 1, 0.3843137, 0, 1,
-1.551976, 0.6398529, -0.5379733, 1, 0.3882353, 0, 1,
-1.547085, 1.152674, -0.7275012, 1, 0.3960784, 0, 1,
-1.507074, -0.9713272, -2.828763, 1, 0.4039216, 0, 1,
-1.505599, -2.581169, -2.354496, 1, 0.4078431, 0, 1,
-1.500703, 0.3872686, -0.6950346, 1, 0.4156863, 0, 1,
-1.481812, -0.3246777, -2.892663, 1, 0.4196078, 0, 1,
-1.479926, 0.8691722, -0.3870996, 1, 0.427451, 0, 1,
-1.471899, 0.3087063, -1.116802, 1, 0.4313726, 0, 1,
-1.468567, 1.139043, 0.03829389, 1, 0.4392157, 0, 1,
-1.462709, -0.5780544, -0.8892725, 1, 0.4431373, 0, 1,
-1.455972, -0.06609516, -1.719792, 1, 0.4509804, 0, 1,
-1.446034, 1.679552, -1.439879, 1, 0.454902, 0, 1,
-1.44418, -0.452277, -1.347481, 1, 0.4627451, 0, 1,
-1.438393, 1.019124, -0.5164821, 1, 0.4666667, 0, 1,
-1.433011, 0.7598183, -0.3562652, 1, 0.4745098, 0, 1,
-1.43026, 1.287943, -0.6318454, 1, 0.4784314, 0, 1,
-1.409288, -1.189365, -0.9220686, 1, 0.4862745, 0, 1,
-1.396716, 0.1894999, -0.1009572, 1, 0.4901961, 0, 1,
-1.392672, -1.058734, -1.398263, 1, 0.4980392, 0, 1,
-1.385582, 0.7487432, -0.3901545, 1, 0.5058824, 0, 1,
-1.385262, 0.6839695, -0.3048221, 1, 0.509804, 0, 1,
-1.382928, 0.3235983, -2.770939, 1, 0.5176471, 0, 1,
-1.378781, -0.4323904, -1.826807, 1, 0.5215687, 0, 1,
-1.375829, -0.7073769, -3.042631, 1, 0.5294118, 0, 1,
-1.373069, 2.893321, -0.7220108, 1, 0.5333334, 0, 1,
-1.3704, -0.3387371, -0.5252902, 1, 0.5411765, 0, 1,
-1.361885, -1.621429, -1.235241, 1, 0.5450981, 0, 1,
-1.360269, -0.03597914, -1.463521, 1, 0.5529412, 0, 1,
-1.358106, -1.257345, -1.351224, 1, 0.5568628, 0, 1,
-1.356762, 1.074407, -1.857108, 1, 0.5647059, 0, 1,
-1.353201, 0.3517093, -0.8705308, 1, 0.5686275, 0, 1,
-1.343588, -0.4543332, -2.312787, 1, 0.5764706, 0, 1,
-1.339921, -0.01620278, -1.578721, 1, 0.5803922, 0, 1,
-1.339864, -1.882188, -3.204771, 1, 0.5882353, 0, 1,
-1.330064, 0.3162472, -1.772477, 1, 0.5921569, 0, 1,
-1.323121, 0.1866831, 1.462806, 1, 0.6, 0, 1,
-1.318793, 0.1558533, -1.546053, 1, 0.6078432, 0, 1,
-1.312054, 1.253056, -0.4566256, 1, 0.6117647, 0, 1,
-1.306918, -0.1216324, -2.786767, 1, 0.6196079, 0, 1,
-1.301154, -0.05613006, -3.711364, 1, 0.6235294, 0, 1,
-1.291791, -0.6972005, -2.845604, 1, 0.6313726, 0, 1,
-1.288877, -1.611496, -2.966768, 1, 0.6352941, 0, 1,
-1.286957, 1.009448, -0.1433471, 1, 0.6431373, 0, 1,
-1.281869, 0.4178733, -0.4633251, 1, 0.6470588, 0, 1,
-1.25631, -1.117014, -0.6151335, 1, 0.654902, 0, 1,
-1.255399, 1.127605, -0.975575, 1, 0.6588235, 0, 1,
-1.238882, -0.3585101, -2.230296, 1, 0.6666667, 0, 1,
-1.23502, -1.284364, -2.510518, 1, 0.6705883, 0, 1,
-1.22626, -0.2295819, -1.784407, 1, 0.6784314, 0, 1,
-1.218456, -2.27202, -3.924985, 1, 0.682353, 0, 1,
-1.216034, -1.511209, -1.725459, 1, 0.6901961, 0, 1,
-1.210858, -0.6844589, -1.619215, 1, 0.6941177, 0, 1,
-1.204182, -0.5033103, -1.562579, 1, 0.7019608, 0, 1,
-1.204073, -0.3396757, -1.179602, 1, 0.7098039, 0, 1,
-1.19816, -0.6265448, -1.41058, 1, 0.7137255, 0, 1,
-1.193334, -0.3914174, -1.405994, 1, 0.7215686, 0, 1,
-1.184378, -1.003767, -3.408512, 1, 0.7254902, 0, 1,
-1.174317, -0.4423321, -2.69014, 1, 0.7333333, 0, 1,
-1.17029, -0.9779947, -4.606933, 1, 0.7372549, 0, 1,
-1.167607, -0.2821959, -2.968197, 1, 0.7450981, 0, 1,
-1.153444, 0.3522311, -0.7441961, 1, 0.7490196, 0, 1,
-1.152602, -0.1096107, -3.289916, 1, 0.7568628, 0, 1,
-1.151834, -0.6685188, -1.286074, 1, 0.7607843, 0, 1,
-1.151764, 1.100719, 0.9195534, 1, 0.7686275, 0, 1,
-1.150711, -1.617304, -2.800144, 1, 0.772549, 0, 1,
-1.148081, 0.1557206, -2.18194, 1, 0.7803922, 0, 1,
-1.141937, -0.6094309, -3.739953, 1, 0.7843137, 0, 1,
-1.140722, 0.5236778, -1.205455, 1, 0.7921569, 0, 1,
-1.134919, 0.2554587, -0.04847858, 1, 0.7960784, 0, 1,
-1.125661, 0.02437872, -2.656145, 1, 0.8039216, 0, 1,
-1.119736, 0.3117656, -1.331145, 1, 0.8117647, 0, 1,
-1.118608, -0.3100263, -1.184739, 1, 0.8156863, 0, 1,
-1.114106, -0.7311338, -3.151591, 1, 0.8235294, 0, 1,
-1.110546, -0.5073636, -2.080287, 1, 0.827451, 0, 1,
-1.101814, -0.1029524, -2.159723, 1, 0.8352941, 0, 1,
-1.101128, -1.9863, -3.080493, 1, 0.8392157, 0, 1,
-1.087274, 1.937143, -1.689692, 1, 0.8470588, 0, 1,
-1.079562, -0.8746552, -0.5340332, 1, 0.8509804, 0, 1,
-1.066934, -1.566008, -2.837576, 1, 0.8588235, 0, 1,
-1.066631, -0.6942575, -2.517575, 1, 0.8627451, 0, 1,
-1.056678, 0.7131996, -1.264048, 1, 0.8705882, 0, 1,
-1.054332, -1.201603, -0.944179, 1, 0.8745098, 0, 1,
-1.050328, 1.486014, -3.315191, 1, 0.8823529, 0, 1,
-1.045251, 0.1733921, -1.91537, 1, 0.8862745, 0, 1,
-1.03232, 1.458535, -0.3521583, 1, 0.8941177, 0, 1,
-1.027763, 0.6052081, -3.289088, 1, 0.8980392, 0, 1,
-1.015454, 0.03354701, -0.6183071, 1, 0.9058824, 0, 1,
-1.003564, -0.6825504, -1.72563, 1, 0.9137255, 0, 1,
-1.002303, -0.698613, -4.381676, 1, 0.9176471, 0, 1,
-1.001966, 0.8934911, -0.07840676, 1, 0.9254902, 0, 1,
-1.001353, 0.7098637, -0.01942743, 1, 0.9294118, 0, 1,
-1.000295, 0.1244089, -3.827377, 1, 0.9372549, 0, 1,
-0.9990342, 1.332351, -2.276425, 1, 0.9411765, 0, 1,
-0.9908131, -0.4402868, -3.152451, 1, 0.9490196, 0, 1,
-0.9865777, 0.2642506, 0.5659161, 1, 0.9529412, 0, 1,
-0.9822596, 0.3712676, -1.930608, 1, 0.9607843, 0, 1,
-0.9796679, 0.558031, -0.7502593, 1, 0.9647059, 0, 1,
-0.9761498, 0.1144276, -1.829095, 1, 0.972549, 0, 1,
-0.974287, -0.8581285, -2.547318, 1, 0.9764706, 0, 1,
-0.9741858, -1.762073, -2.438562, 1, 0.9843137, 0, 1,
-0.9717196, -0.2504986, -0.3869253, 1, 0.9882353, 0, 1,
-0.95202, 1.120787, -0.8623329, 1, 0.9960784, 0, 1,
-0.9519497, -0.04791736, -1.24612, 0.9960784, 1, 0, 1,
-0.9504778, 0.5807574, -0.532164, 0.9921569, 1, 0, 1,
-0.9451954, -1.000402, -2.638119, 0.9843137, 1, 0, 1,
-0.940362, -1.434746, -2.932156, 0.9803922, 1, 0, 1,
-0.9380845, -0.4996126, -1.112327, 0.972549, 1, 0, 1,
-0.9349846, 0.2891744, -1.594701, 0.9686275, 1, 0, 1,
-0.9306062, 0.7430748, -0.922654, 0.9607843, 1, 0, 1,
-0.919012, -1.005638, -3.720313, 0.9568627, 1, 0, 1,
-0.9113542, -1.501079, -3.337323, 0.9490196, 1, 0, 1,
-0.9096522, -0.4012055, -3.020441, 0.945098, 1, 0, 1,
-0.9086654, -0.7141696, -1.387114, 0.9372549, 1, 0, 1,
-0.9060727, 0.6876448, -1.670598, 0.9333333, 1, 0, 1,
-0.9049419, -0.6458598, -2.41782, 0.9254902, 1, 0, 1,
-0.8889303, 0.2077665, -1.57742, 0.9215686, 1, 0, 1,
-0.8855566, 1.527532, -0.5815756, 0.9137255, 1, 0, 1,
-0.8844684, -0.0990109, -1.422372, 0.9098039, 1, 0, 1,
-0.8830015, -2.529069, -1.824867, 0.9019608, 1, 0, 1,
-0.8825634, 1.09493, -0.04164953, 0.8941177, 1, 0, 1,
-0.8699044, 0.2265063, -1.700854, 0.8901961, 1, 0, 1,
-0.8654624, -0.2816512, -2.136369, 0.8823529, 1, 0, 1,
-0.8551988, 0.2942628, -0.9681947, 0.8784314, 1, 0, 1,
-0.846186, 0.9877388, -0.7495287, 0.8705882, 1, 0, 1,
-0.8448969, -1.29641, -1.221274, 0.8666667, 1, 0, 1,
-0.8441334, 2.572493, 0.6340485, 0.8588235, 1, 0, 1,
-0.8436373, -0.8421894, -4.085882, 0.854902, 1, 0, 1,
-0.8309759, -0.1318348, -1.840034, 0.8470588, 1, 0, 1,
-0.8255332, -1.417511, -1.8228, 0.8431373, 1, 0, 1,
-0.8248119, 1.030825, 0.8365403, 0.8352941, 1, 0, 1,
-0.820182, 1.322879, -0.09401257, 0.8313726, 1, 0, 1,
-0.8194982, -1.140539, -1.787504, 0.8235294, 1, 0, 1,
-0.8190093, -0.8486016, -2.71344, 0.8196079, 1, 0, 1,
-0.8072037, 2.24234, -1.413125, 0.8117647, 1, 0, 1,
-0.798833, 0.530172, 0.5042824, 0.8078431, 1, 0, 1,
-0.798511, -1.074934, -3.750682, 0.8, 1, 0, 1,
-0.789914, 2.690421, -2.217546, 0.7921569, 1, 0, 1,
-0.7895157, 0.5516567, -1.780532, 0.7882353, 1, 0, 1,
-0.7887886, 1.510364, -1.11454, 0.7803922, 1, 0, 1,
-0.78577, -0.3833981, -2.799257, 0.7764706, 1, 0, 1,
-0.77969, -1.843259, -3.126404, 0.7686275, 1, 0, 1,
-0.7788886, 1.535452, -0.5639595, 0.7647059, 1, 0, 1,
-0.7784783, -0.1392723, -1.897023, 0.7568628, 1, 0, 1,
-0.7751731, -1.626783, -2.313357, 0.7529412, 1, 0, 1,
-0.7692916, -0.2080544, -0.5126413, 0.7450981, 1, 0, 1,
-0.7682546, -0.5034382, -2.047388, 0.7411765, 1, 0, 1,
-0.7677839, 0.1357915, -2.016764, 0.7333333, 1, 0, 1,
-0.7644396, -0.008492324, -0.9418436, 0.7294118, 1, 0, 1,
-0.764279, -0.3281916, -2.129745, 0.7215686, 1, 0, 1,
-0.7606524, -0.6666154, -2.161049, 0.7176471, 1, 0, 1,
-0.7572803, 0.7946289, -1.292436, 0.7098039, 1, 0, 1,
-0.7563422, 0.4180616, -2.092562, 0.7058824, 1, 0, 1,
-0.756126, 0.3442252, -1.204273, 0.6980392, 1, 0, 1,
-0.7497445, 0.954215, 1.566778, 0.6901961, 1, 0, 1,
-0.7427024, 1.215174, -0.4585001, 0.6862745, 1, 0, 1,
-0.7299812, -0.3276846, -3.886642, 0.6784314, 1, 0, 1,
-0.7286606, -0.8456361, -2.34258, 0.6745098, 1, 0, 1,
-0.7210473, -1.130081, -1.776786, 0.6666667, 1, 0, 1,
-0.7138865, -1.900918, -1.408239, 0.6627451, 1, 0, 1,
-0.7086533, 1.374947, -2.001947, 0.654902, 1, 0, 1,
-0.70811, 0.8182824, -1.18974, 0.6509804, 1, 0, 1,
-0.7043107, -0.5094733, -2.96536, 0.6431373, 1, 0, 1,
-0.7034107, 2.371189, 0.6399651, 0.6392157, 1, 0, 1,
-0.6850096, -0.4574264, -2.952007, 0.6313726, 1, 0, 1,
-0.6843604, 0.1200943, -2.581815, 0.627451, 1, 0, 1,
-0.684158, -1.092487, -2.47275, 0.6196079, 1, 0, 1,
-0.6814715, 0.006782289, -1.237724, 0.6156863, 1, 0, 1,
-0.6805918, -0.785188, -1.612665, 0.6078432, 1, 0, 1,
-0.6772844, 0.1188652, -1.713478, 0.6039216, 1, 0, 1,
-0.6740969, 0.6854392, -0.2369272, 0.5960785, 1, 0, 1,
-0.668636, 0.353742, -1.358032, 0.5882353, 1, 0, 1,
-0.6639448, -0.4618904, -1.469317, 0.5843138, 1, 0, 1,
-0.6627828, -0.7617245, -3.008763, 0.5764706, 1, 0, 1,
-0.6592914, -0.5249844, -3.001968, 0.572549, 1, 0, 1,
-0.6535846, 0.6754079, 0.4812804, 0.5647059, 1, 0, 1,
-0.6533048, -0.5781393, -2.723616, 0.5607843, 1, 0, 1,
-0.6508206, 0.2800503, -0.0766298, 0.5529412, 1, 0, 1,
-0.6486965, -1.034075, -3.370912, 0.5490196, 1, 0, 1,
-0.6436976, -1.965552, -3.886988, 0.5411765, 1, 0, 1,
-0.6416907, -1.69927, -2.576886, 0.5372549, 1, 0, 1,
-0.637134, 1.350832, 0.9323688, 0.5294118, 1, 0, 1,
-0.6301845, -0.2682851, -2.169549, 0.5254902, 1, 0, 1,
-0.6241283, 1.01218, -1.501776, 0.5176471, 1, 0, 1,
-0.6203588, -0.6733471, -2.909277, 0.5137255, 1, 0, 1,
-0.619046, 1.296556, -1.041723, 0.5058824, 1, 0, 1,
-0.5919926, 1.692863, 0.5015054, 0.5019608, 1, 0, 1,
-0.5910546, 0.3198207, 0.7080998, 0.4941176, 1, 0, 1,
-0.5850965, 0.4481476, -1.49048, 0.4862745, 1, 0, 1,
-0.5829604, -0.2920069, -1.075048, 0.4823529, 1, 0, 1,
-0.5826606, 0.53346, -1.412634, 0.4745098, 1, 0, 1,
-0.5780085, -0.4776398, -1.414621, 0.4705882, 1, 0, 1,
-0.5753495, 0.6059116, -2.321388, 0.4627451, 1, 0, 1,
-0.5696776, 1.684272, -1.011658, 0.4588235, 1, 0, 1,
-0.5672599, -0.5635524, -0.7030389, 0.4509804, 1, 0, 1,
-0.5630876, -1.421872, -2.307301, 0.4470588, 1, 0, 1,
-0.5595316, -0.03357995, -0.1094833, 0.4392157, 1, 0, 1,
-0.5569511, -0.9140648, -3.521143, 0.4352941, 1, 0, 1,
-0.5566353, 1.102286, -0.2773347, 0.427451, 1, 0, 1,
-0.5564435, 0.158943, -0.9864793, 0.4235294, 1, 0, 1,
-0.5564422, -0.3531637, -4.16884, 0.4156863, 1, 0, 1,
-0.5561554, 1.083776, -0.475446, 0.4117647, 1, 0, 1,
-0.5450687, -0.4224993, -2.008155, 0.4039216, 1, 0, 1,
-0.5448961, 0.8793141, -1.040805, 0.3960784, 1, 0, 1,
-0.5420452, 1.133393, -0.7222711, 0.3921569, 1, 0, 1,
-0.5410895, -0.5827965, -3.602231, 0.3843137, 1, 0, 1,
-0.5382253, -0.8787962, -1.862791, 0.3803922, 1, 0, 1,
-0.5364552, 0.4351601, -1.46213, 0.372549, 1, 0, 1,
-0.5319238, -0.0386012, -1.686343, 0.3686275, 1, 0, 1,
-0.5315495, 0.5061085, 0.8987074, 0.3607843, 1, 0, 1,
-0.5311242, -0.1311454, -3.383179, 0.3568628, 1, 0, 1,
-0.5306832, 0.5592963, -1.409552, 0.3490196, 1, 0, 1,
-0.530381, -0.3835624, -2.636471, 0.345098, 1, 0, 1,
-0.5096433, 0.4824458, 0.7103134, 0.3372549, 1, 0, 1,
-0.5040056, 1.352629, 0.6816748, 0.3333333, 1, 0, 1,
-0.5037047, -1.752466, -3.374645, 0.3254902, 1, 0, 1,
-0.5008958, -2.695338, -1.728356, 0.3215686, 1, 0, 1,
-0.5001901, 1.265094, 0.9705015, 0.3137255, 1, 0, 1,
-0.4930296, 0.05035081, -1.379423, 0.3098039, 1, 0, 1,
-0.4907984, -0.2317686, -3.430273, 0.3019608, 1, 0, 1,
-0.4849425, -0.1305848, -2.919919, 0.2941177, 1, 0, 1,
-0.4818861, 0.1017217, -2.000879, 0.2901961, 1, 0, 1,
-0.4804799, 0.3127077, -1.254718, 0.282353, 1, 0, 1,
-0.4780281, 0.1632126, -0.9174037, 0.2784314, 1, 0, 1,
-0.4768808, -0.3847311, -3.220265, 0.2705882, 1, 0, 1,
-0.4768613, 0.1076258, -1.358348, 0.2666667, 1, 0, 1,
-0.470773, -2.952915, -2.49773, 0.2588235, 1, 0, 1,
-0.4656634, 0.9660447, -0.7561111, 0.254902, 1, 0, 1,
-0.4643056, -0.9068328, -2.080394, 0.2470588, 1, 0, 1,
-0.4590404, -0.7926783, -2.495435, 0.2431373, 1, 0, 1,
-0.4585643, 0.0568533, -1.009879, 0.2352941, 1, 0, 1,
-0.4547908, 0.9880546, -0.06442307, 0.2313726, 1, 0, 1,
-0.4530224, -1.055236, -3.864899, 0.2235294, 1, 0, 1,
-0.4471083, -2.840942, -2.591549, 0.2196078, 1, 0, 1,
-0.4465642, 0.02970782, -1.38029, 0.2117647, 1, 0, 1,
-0.4417756, -2.667927, -3.38482, 0.2078431, 1, 0, 1,
-0.4388053, -0.00934221, -3.335597, 0.2, 1, 0, 1,
-0.4382985, 0.514123, 0.1856214, 0.1921569, 1, 0, 1,
-0.4367922, 0.4516477, 0.1542696, 0.1882353, 1, 0, 1,
-0.4319511, 1.081023, -1.522836, 0.1803922, 1, 0, 1,
-0.4316936, -0.09465969, -1.318312, 0.1764706, 1, 0, 1,
-0.4301567, 0.1896398, -2.801477, 0.1686275, 1, 0, 1,
-0.4295763, -0.7025589, -1.359637, 0.1647059, 1, 0, 1,
-0.4258917, -0.1829548, -2.04562, 0.1568628, 1, 0, 1,
-0.4246445, -0.9399318, -3.187128, 0.1529412, 1, 0, 1,
-0.4210748, -0.2146449, -2.99499, 0.145098, 1, 0, 1,
-0.420586, 0.2603548, -1.141311, 0.1411765, 1, 0, 1,
-0.4189934, -0.3222669, -2.771563, 0.1333333, 1, 0, 1,
-0.4172568, 1.685563, 0.02294927, 0.1294118, 1, 0, 1,
-0.412365, -1.355051, -1.762359, 0.1215686, 1, 0, 1,
-0.4121395, 0.6561633, -1.851512, 0.1176471, 1, 0, 1,
-0.4114596, 1.576757, 0.6142844, 0.1098039, 1, 0, 1,
-0.410494, -0.2647159, -3.333551, 0.1058824, 1, 0, 1,
-0.4052373, -0.8343362, -3.060933, 0.09803922, 1, 0, 1,
-0.4002918, 1.20048, -1.550239, 0.09019608, 1, 0, 1,
-0.3954496, -0.5319486, -2.032199, 0.08627451, 1, 0, 1,
-0.3943523, 0.1628761, -1.004231, 0.07843138, 1, 0, 1,
-0.3926325, 0.1285923, -1.079966, 0.07450981, 1, 0, 1,
-0.3907145, 1.099249, -0.4539244, 0.06666667, 1, 0, 1,
-0.390303, 1.898446, -0.1242341, 0.0627451, 1, 0, 1,
-0.3895302, 1.446989, 0.6441419, 0.05490196, 1, 0, 1,
-0.3894795, 0.1974152, -1.070156, 0.05098039, 1, 0, 1,
-0.3882723, -0.9603038, -3.355891, 0.04313726, 1, 0, 1,
-0.3842672, -1.78819, -1.70725, 0.03921569, 1, 0, 1,
-0.381516, 1.540997, 0.2333703, 0.03137255, 1, 0, 1,
-0.3804688, -0.112716, -1.211645, 0.02745098, 1, 0, 1,
-0.3781791, 0.187683, -0.9173923, 0.01960784, 1, 0, 1,
-0.3691714, 0.4925931, -1.068218, 0.01568628, 1, 0, 1,
-0.3684784, -0.5045353, -2.289726, 0.007843138, 1, 0, 1,
-0.3597276, 0.3807819, -1.931622, 0.003921569, 1, 0, 1,
-0.3469948, 2.481437, 0.7157347, 0, 1, 0.003921569, 1,
-0.346735, 0.6487113, -2.047959, 0, 1, 0.01176471, 1,
-0.3461247, 0.4237614, -0.5511311, 0, 1, 0.01568628, 1,
-0.3457745, -0.5079072, -2.517049, 0, 1, 0.02352941, 1,
-0.3446548, 1.406875, 0.3809833, 0, 1, 0.02745098, 1,
-0.3443464, -0.3769286, -1.557051, 0, 1, 0.03529412, 1,
-0.3400189, -0.03842808, -1.207843, 0, 1, 0.03921569, 1,
-0.3395293, -1.125215, -2.385076, 0, 1, 0.04705882, 1,
-0.3395199, 1.605499, -0.7647606, 0, 1, 0.05098039, 1,
-0.3359994, 0.3564241, -1.505015, 0, 1, 0.05882353, 1,
-0.3357549, 0.7136366, -0.9505206, 0, 1, 0.0627451, 1,
-0.335675, -0.1909248, -2.351044, 0, 1, 0.07058824, 1,
-0.3340455, 0.7611141, -0.9425581, 0, 1, 0.07450981, 1,
-0.3338169, -0.3019189, -1.241541, 0, 1, 0.08235294, 1,
-0.3337221, 0.1006112, -0.1628022, 0, 1, 0.08627451, 1,
-0.3261016, -0.9746841, -1.949283, 0, 1, 0.09411765, 1,
-0.3254545, -0.1592001, -3.054557, 0, 1, 0.1019608, 1,
-0.324877, -0.7163972, -2.743934, 0, 1, 0.1058824, 1,
-0.3239994, 1.981715, -0.5649062, 0, 1, 0.1137255, 1,
-0.3233744, 0.6235429, -1.273042, 0, 1, 0.1176471, 1,
-0.3203717, 1.846435, 0.4188534, 0, 1, 0.1254902, 1,
-0.3171458, 0.5350745, 0.2437578, 0, 1, 0.1294118, 1,
-0.3129876, -0.8219683, -2.422915, 0, 1, 0.1372549, 1,
-0.3117727, -0.1420461, -1.707765, 0, 1, 0.1411765, 1,
-0.3056149, -0.3434828, -2.212931, 0, 1, 0.1490196, 1,
-0.3049371, 0.1957168, -2.281056, 0, 1, 0.1529412, 1,
-0.3045815, 0.01226128, -2.469681, 0, 1, 0.1607843, 1,
-0.2969027, -0.1133261, -1.014732, 0, 1, 0.1647059, 1,
-0.2968668, -2.195832, -1.207218, 0, 1, 0.172549, 1,
-0.2965657, 0.9938003, 0.2538483, 0, 1, 0.1764706, 1,
-0.2932823, -2.014167, -2.259507, 0, 1, 0.1843137, 1,
-0.292197, 0.7762154, -2.105246, 0, 1, 0.1882353, 1,
-0.2882469, 0.5376945, -2.70583, 0, 1, 0.1960784, 1,
-0.287409, -0.7250965, -3.504858, 0, 1, 0.2039216, 1,
-0.2784476, -0.3773745, -1.465018, 0, 1, 0.2078431, 1,
-0.2774611, -0.797323, -2.822501, 0, 1, 0.2156863, 1,
-0.2758034, -0.3313629, -3.545711, 0, 1, 0.2196078, 1,
-0.2717478, -0.8948945, -0.8609514, 0, 1, 0.227451, 1,
-0.2695935, -0.888248, -3.110729, 0, 1, 0.2313726, 1,
-0.2687816, 0.7149388, -0.1870928, 0, 1, 0.2392157, 1,
-0.2685729, 0.7977796, -0.1436792, 0, 1, 0.2431373, 1,
-0.2656022, -0.5584455, -2.379849, 0, 1, 0.2509804, 1,
-0.2647637, 0.3562075, -1.516615, 0, 1, 0.254902, 1,
-0.2632764, 0.6134402, -0.6948729, 0, 1, 0.2627451, 1,
-0.2601027, 0.6145214, -0.265089, 0, 1, 0.2666667, 1,
-0.2586912, -0.2625145, -1.307559, 0, 1, 0.2745098, 1,
-0.2575213, 1.810089, 1.911144, 0, 1, 0.2784314, 1,
-0.2574668, 0.3108808, -1.338081, 0, 1, 0.2862745, 1,
-0.2566162, 0.9079061, -0.9645109, 0, 1, 0.2901961, 1,
-0.2553428, -0.3404062, -0.4779328, 0, 1, 0.2980392, 1,
-0.2521354, 0.6352385, 0.6538015, 0, 1, 0.3058824, 1,
-0.2497053, -1.237678, -3.359318, 0, 1, 0.3098039, 1,
-0.2484986, -2.705059, -3.198643, 0, 1, 0.3176471, 1,
-0.2470569, 0.8272315, -2.167671, 0, 1, 0.3215686, 1,
-0.2439424, -0.6633666, -1.443255, 0, 1, 0.3294118, 1,
-0.2389816, 1.971723, 0.4639862, 0, 1, 0.3333333, 1,
-0.2382157, 0.4559411, 0.1026983, 0, 1, 0.3411765, 1,
-0.2368984, -0.09753581, -1.777716, 0, 1, 0.345098, 1,
-0.2364085, 0.3766381, 0.6323181, 0, 1, 0.3529412, 1,
-0.2344782, -0.1370792, -0.7977302, 0, 1, 0.3568628, 1,
-0.2292585, 0.3886085, -1.577067, 0, 1, 0.3647059, 1,
-0.2269549, 0.5588587, -0.4291742, 0, 1, 0.3686275, 1,
-0.219865, -0.1303117, -1.877957, 0, 1, 0.3764706, 1,
-0.2184649, -0.816328, -1.383413, 0, 1, 0.3803922, 1,
-0.2176959, -1.270005, -4.24006, 0, 1, 0.3882353, 1,
-0.2120971, -1.985832, -2.71352, 0, 1, 0.3921569, 1,
-0.2118004, -0.4533083, -1.718732, 0, 1, 0.4, 1,
-0.1955337, 2.068131, 0.429929, 0, 1, 0.4078431, 1,
-0.1949183, 0.5111443, -0.2267896, 0, 1, 0.4117647, 1,
-0.1894672, 0.393695, -0.9311982, 0, 1, 0.4196078, 1,
-0.1884952, -1.093907, -3.661071, 0, 1, 0.4235294, 1,
-0.1882784, 0.04229627, -1.274222, 0, 1, 0.4313726, 1,
-0.1869101, 0.1632215, -1.58458, 0, 1, 0.4352941, 1,
-0.1840491, 1.832439, 0.7214556, 0, 1, 0.4431373, 1,
-0.1837183, 0.4671226, -1.585741, 0, 1, 0.4470588, 1,
-0.1833746, -0.7691715, -4.287969, 0, 1, 0.454902, 1,
-0.1796655, -1.179485, -4.076864, 0, 1, 0.4588235, 1,
-0.179067, -0.09654766, -2.957972, 0, 1, 0.4666667, 1,
-0.1782943, 0.431534, -1.682228, 0, 1, 0.4705882, 1,
-0.1763494, 0.8875672, -0.6054347, 0, 1, 0.4784314, 1,
-0.1752222, -0.7959054, -2.175879, 0, 1, 0.4823529, 1,
-0.1746769, -0.5337461, -2.420454, 0, 1, 0.4901961, 1,
-0.1718186, -0.4163454, -5.070941, 0, 1, 0.4941176, 1,
-0.1707105, -1.562601, -4.170769, 0, 1, 0.5019608, 1,
-0.1705404, 0.8131003, 0.1016406, 0, 1, 0.509804, 1,
-0.1629936, 0.5058668, 0.7600247, 0, 1, 0.5137255, 1,
-0.1603996, -1.339124, -1.719426, 0, 1, 0.5215687, 1,
-0.1535511, 0.7338042, -0.4838553, 0, 1, 0.5254902, 1,
-0.1497584, 0.04210389, -1.960009, 0, 1, 0.5333334, 1,
-0.1471191, -3.163796, -1.237348, 0, 1, 0.5372549, 1,
-0.1464251, 0.121709, -0.1967841, 0, 1, 0.5450981, 1,
-0.1452958, 0.7087439, -0.79129, 0, 1, 0.5490196, 1,
-0.1451757, 0.04006571, 1.555835, 0, 1, 0.5568628, 1,
-0.1434012, -0.7725745, -4.299078, 0, 1, 0.5607843, 1,
-0.143389, -0.9724129, -2.877545, 0, 1, 0.5686275, 1,
-0.1364477, -0.2571437, -0.991222, 0, 1, 0.572549, 1,
-0.1362544, -0.9764759, -1.140648, 0, 1, 0.5803922, 1,
-0.1343938, -0.9097008, -3.00253, 0, 1, 0.5843138, 1,
-0.13403, -0.219955, -2.335547, 0, 1, 0.5921569, 1,
-0.1323434, 0.02541467, -2.636149, 0, 1, 0.5960785, 1,
-0.1268446, 0.3175129, -0.9602448, 0, 1, 0.6039216, 1,
-0.1260023, -0.5335182, -3.391958, 0, 1, 0.6117647, 1,
-0.1252527, -0.4937936, -2.976158, 0, 1, 0.6156863, 1,
-0.1190934, -0.3033052, -2.95237, 0, 1, 0.6235294, 1,
-0.1164111, 1.670153, -2.310242, 0, 1, 0.627451, 1,
-0.1124, -1.855803, -2.212282, 0, 1, 0.6352941, 1,
-0.1085704, -0.3190615, -4.532333, 0, 1, 0.6392157, 1,
-0.1077574, -0.445361, -2.66504, 0, 1, 0.6470588, 1,
-0.1066971, 0.01907095, -1.672478, 0, 1, 0.6509804, 1,
-0.1029723, 1.44245, -1.270344, 0, 1, 0.6588235, 1,
-0.1029616, -0.1929917, -4.215146, 0, 1, 0.6627451, 1,
-0.1019469, 0.01206144, -3.690373, 0, 1, 0.6705883, 1,
-0.1013569, 0.08618315, -2.064734, 0, 1, 0.6745098, 1,
-0.09594353, -0.3086435, -2.686544, 0, 1, 0.682353, 1,
-0.08970206, 1.190736, -0.2095099, 0, 1, 0.6862745, 1,
-0.08900008, 0.3950982, 0.8333851, 0, 1, 0.6941177, 1,
-0.08745309, -0.2588502, -2.000154, 0, 1, 0.7019608, 1,
-0.08654318, -0.440501, -3.824537, 0, 1, 0.7058824, 1,
-0.07787979, 0.1813641, -0.6521478, 0, 1, 0.7137255, 1,
-0.07734882, 0.629401, 0.7842512, 0, 1, 0.7176471, 1,
-0.07691273, 0.01385693, -2.205071, 0, 1, 0.7254902, 1,
-0.07177576, -0.9681978, -3.15971, 0, 1, 0.7294118, 1,
-0.07143647, -0.2560562, -3.486438, 0, 1, 0.7372549, 1,
-0.06978718, -1.167142, -3.128879, 0, 1, 0.7411765, 1,
-0.06503501, -2.177956, -4.355327, 0, 1, 0.7490196, 1,
-0.06496185, 0.1716151, 0.5317087, 0, 1, 0.7529412, 1,
-0.06298243, -0.4222972, -1.863661, 0, 1, 0.7607843, 1,
-0.06114014, -0.6157915, -2.833665, 0, 1, 0.7647059, 1,
-0.06042289, -1.4479, -3.711934, 0, 1, 0.772549, 1,
-0.05936754, 1.439027, -0.2998462, 0, 1, 0.7764706, 1,
-0.05813193, -0.5897431, -3.929429, 0, 1, 0.7843137, 1,
-0.05611758, 1.059665, 1.370584, 0, 1, 0.7882353, 1,
-0.05567216, -0.4301032, -2.56825, 0, 1, 0.7960784, 1,
-0.05121743, -0.8086081, -3.793718, 0, 1, 0.8039216, 1,
-0.04934774, 0.1696527, 1.110391, 0, 1, 0.8078431, 1,
-0.04921068, -0.3556159, -2.634824, 0, 1, 0.8156863, 1,
-0.04806066, -0.7539698, -2.592745, 0, 1, 0.8196079, 1,
-0.0467574, 0.06468529, -0.5038559, 0, 1, 0.827451, 1,
-0.04563613, 0.1537716, -2.292587, 0, 1, 0.8313726, 1,
-0.04519913, 0.09485874, -2.041729, 0, 1, 0.8392157, 1,
-0.04211881, -1.472028, -2.886642, 0, 1, 0.8431373, 1,
-0.03856242, -0.1130042, -1.601807, 0, 1, 0.8509804, 1,
-0.03571671, -2.34361, -3.007565, 0, 1, 0.854902, 1,
-0.03546239, -1.314602, -4.887036, 0, 1, 0.8627451, 1,
-0.03499731, -0.6905173, -1.587679, 0, 1, 0.8666667, 1,
-0.03276782, 0.7542599, -1.522529, 0, 1, 0.8745098, 1,
-0.03173352, -1.802191, -2.870489, 0, 1, 0.8784314, 1,
-0.03064504, 0.1959304, -0.42309, 0, 1, 0.8862745, 1,
-0.0280361, 1.717898, 0.6124128, 0, 1, 0.8901961, 1,
-0.02755507, 0.8454437, -1.381878, 0, 1, 0.8980392, 1,
-0.02684727, -0.2316505, -3.472381, 0, 1, 0.9058824, 1,
-0.02205796, -0.2856011, -4.038054, 0, 1, 0.9098039, 1,
-0.02058439, -0.3329411, -1.838294, 0, 1, 0.9176471, 1,
-0.01939521, 0.2349961, 0.5287729, 0, 1, 0.9215686, 1,
-0.0188638, 2.105744, -0.93688, 0, 1, 0.9294118, 1,
-0.01405516, -0.6798959, -2.979748, 0, 1, 0.9333333, 1,
-0.01376595, -0.8451918, -4.530119, 0, 1, 0.9411765, 1,
-0.009632898, 0.5278791, -1.1487, 0, 1, 0.945098, 1,
-0.009480019, -0.8546821, -3.692456, 0, 1, 0.9529412, 1,
-0.006162695, 0.8448324, -0.7609363, 0, 1, 0.9568627, 1,
-0.004675894, -0.5517384, -3.170064, 0, 1, 0.9647059, 1,
-0.003513599, -0.1075422, -3.883989, 0, 1, 0.9686275, 1,
-0.001895093, 1.58312, -0.2944246, 0, 1, 0.9764706, 1,
0.001943267, -1.507385, 3.350332, 0, 1, 0.9803922, 1,
0.00516479, -0.006616601, 2.126816, 0, 1, 0.9882353, 1,
0.007289566, -0.6452369, 2.328557, 0, 1, 0.9921569, 1,
0.007587927, 1.386425, -0.25532, 0, 1, 1, 1,
0.007649775, -0.1817247, 2.172037, 0, 0.9921569, 1, 1,
0.008358883, 1.494135, 0.1246505, 0, 0.9882353, 1, 1,
0.00959658, -1.003067, 1.545375, 0, 0.9803922, 1, 1,
0.009721906, -0.5199575, 3.613917, 0, 0.9764706, 1, 1,
0.009762541, -0.65807, 2.352429, 0, 0.9686275, 1, 1,
0.01044364, 2.063501, 0.04740866, 0, 0.9647059, 1, 1,
0.01177159, 0.3244792, 1.545266, 0, 0.9568627, 1, 1,
0.01201153, 1.661179, 2.659159, 0, 0.9529412, 1, 1,
0.0134046, -0.2233731, 2.500257, 0, 0.945098, 1, 1,
0.01379658, -1.010042, 4.718475, 0, 0.9411765, 1, 1,
0.01410949, 1.654049, 0.2651654, 0, 0.9333333, 1, 1,
0.01419174, 1.301028, 1.030543, 0, 0.9294118, 1, 1,
0.01487813, -0.5420227, 2.234804, 0, 0.9215686, 1, 1,
0.01953759, -0.3064872, 2.438244, 0, 0.9176471, 1, 1,
0.02027671, -0.5479876, 2.784242, 0, 0.9098039, 1, 1,
0.02236286, -0.4041672, 4.341177, 0, 0.9058824, 1, 1,
0.02490125, -0.4319825, 1.589114, 0, 0.8980392, 1, 1,
0.02590243, -0.5896812, 2.951228, 0, 0.8901961, 1, 1,
0.02806148, -0.8618286, 2.970004, 0, 0.8862745, 1, 1,
0.03003549, 1.093993, 2.009219, 0, 0.8784314, 1, 1,
0.03094623, -1.289867, 4.333981, 0, 0.8745098, 1, 1,
0.03785925, 0.8478968, -0.3170383, 0, 0.8666667, 1, 1,
0.04596766, -0.7053276, 4.063155, 0, 0.8627451, 1, 1,
0.04872983, 0.8815297, -0.08444792, 0, 0.854902, 1, 1,
0.04909325, 0.8446408, -0.9754111, 0, 0.8509804, 1, 1,
0.05010002, -1.693793, 2.578979, 0, 0.8431373, 1, 1,
0.05739204, 0.1087592, 0.7112242, 0, 0.8392157, 1, 1,
0.06144402, 0.8446223, -0.5863369, 0, 0.8313726, 1, 1,
0.06556473, -1.321122, 3.060885, 0, 0.827451, 1, 1,
0.07664147, 0.7955051, -1.098635, 0, 0.8196079, 1, 1,
0.07800353, 0.5936196, 0.9679333, 0, 0.8156863, 1, 1,
0.07870392, -1.063475, 3.222397, 0, 0.8078431, 1, 1,
0.07917365, -0.9960257, 1.203864, 0, 0.8039216, 1, 1,
0.08136234, -1.085597, 3.761407, 0, 0.7960784, 1, 1,
0.0885321, -3.022325, 2.418022, 0, 0.7882353, 1, 1,
0.09233255, 1.618928, 1.479871, 0, 0.7843137, 1, 1,
0.09247788, -1.610807, 1.171799, 0, 0.7764706, 1, 1,
0.09733628, -0.1860079, 2.537642, 0, 0.772549, 1, 1,
0.09887081, 0.3236743, 0.7427266, 0, 0.7647059, 1, 1,
0.1019496, 1.805789, 0.3849684, 0, 0.7607843, 1, 1,
0.1045923, 0.9414555, -0.6791429, 0, 0.7529412, 1, 1,
0.104977, 0.871002, 1.153682, 0, 0.7490196, 1, 1,
0.10751, -1.853066, 2.930202, 0, 0.7411765, 1, 1,
0.1090408, 0.3340339, 0.7372457, 0, 0.7372549, 1, 1,
0.1091468, 0.1805831, 0.3770169, 0, 0.7294118, 1, 1,
0.1092237, -0.1921125, 3.643475, 0, 0.7254902, 1, 1,
0.1121532, -0.1894632, 2.128501, 0, 0.7176471, 1, 1,
0.1148355, -1.894879, 1.261136, 0, 0.7137255, 1, 1,
0.118294, 1.269853, 1.988628, 0, 0.7058824, 1, 1,
0.1197725, 0.1930075, 0.3040915, 0, 0.6980392, 1, 1,
0.1198443, -0.5007469, 3.833321, 0, 0.6941177, 1, 1,
0.1205145, -0.524875, 1.764686, 0, 0.6862745, 1, 1,
0.1222314, 2.248745, -0.6455271, 0, 0.682353, 1, 1,
0.1226372, -1.394597, 1.236874, 0, 0.6745098, 1, 1,
0.122993, 0.8178515, 1.134736, 0, 0.6705883, 1, 1,
0.1263479, -1.240132, 1.746244, 0, 0.6627451, 1, 1,
0.1266153, 0.5566835, -0.4107682, 0, 0.6588235, 1, 1,
0.1277679, 0.6937125, -1.124445, 0, 0.6509804, 1, 1,
0.1297198, 1.08923, -0.6037481, 0, 0.6470588, 1, 1,
0.1350001, -0.2572923, 3.398143, 0, 0.6392157, 1, 1,
0.1374661, 0.4015251, 1.303174, 0, 0.6352941, 1, 1,
0.1395666, 0.4048803, -0.9005739, 0, 0.627451, 1, 1,
0.1501864, 0.4330021, 0.2139461, 0, 0.6235294, 1, 1,
0.1529676, -1.536716, 3.705682, 0, 0.6156863, 1, 1,
0.1577566, -0.7040198, 3.670673, 0, 0.6117647, 1, 1,
0.1598037, 0.3816709, -0.7256504, 0, 0.6039216, 1, 1,
0.1599055, -0.9447995, 1.866202, 0, 0.5960785, 1, 1,
0.1607246, -0.6369486, 1.857368, 0, 0.5921569, 1, 1,
0.1634004, 0.5187274, 2.632289, 0, 0.5843138, 1, 1,
0.1657065, -0.0849943, 0.8963932, 0, 0.5803922, 1, 1,
0.1693921, -1.053164, 2.013205, 0, 0.572549, 1, 1,
0.1696945, -0.1506289, 0.2321191, 0, 0.5686275, 1, 1,
0.1751341, 0.02101924, -0.5703152, 0, 0.5607843, 1, 1,
0.1755346, -1.912138, 4.934752, 0, 0.5568628, 1, 1,
0.1762445, -0.06612153, 2.008199, 0, 0.5490196, 1, 1,
0.1828152, 0.6043653, 0.7764471, 0, 0.5450981, 1, 1,
0.1898643, 1.240283, -0.6843482, 0, 0.5372549, 1, 1,
0.1906473, 0.1103464, 0.9868348, 0, 0.5333334, 1, 1,
0.1976155, 0.001369907, 1.081763, 0, 0.5254902, 1, 1,
0.197621, -1.331951, 3.471406, 0, 0.5215687, 1, 1,
0.2000346, -1.09794, 1.716197, 0, 0.5137255, 1, 1,
0.2009562, 1.097184, -0.2401069, 0, 0.509804, 1, 1,
0.2013093, 2.213718, -0.2241664, 0, 0.5019608, 1, 1,
0.2034553, -0.684487, 3.950881, 0, 0.4941176, 1, 1,
0.2053638, -0.9933938, 4.220016, 0, 0.4901961, 1, 1,
0.2126939, -0.1588027, 2.145202, 0, 0.4823529, 1, 1,
0.2137437, 0.04365684, -0.2417194, 0, 0.4784314, 1, 1,
0.2152538, -0.4394884, 1.339564, 0, 0.4705882, 1, 1,
0.2214894, 2.468708, -0.6598189, 0, 0.4666667, 1, 1,
0.227297, -0.8098032, 2.893645, 0, 0.4588235, 1, 1,
0.2273694, -0.3568923, 2.738528, 0, 0.454902, 1, 1,
0.2338355, 0.984839, 0.6782432, 0, 0.4470588, 1, 1,
0.2340592, -2.050418, 2.07658, 0, 0.4431373, 1, 1,
0.2347198, 0.7323479, 1.656171, 0, 0.4352941, 1, 1,
0.2354541, -0.7947168, 2.469748, 0, 0.4313726, 1, 1,
0.2356039, -0.321767, 2.58615, 0, 0.4235294, 1, 1,
0.2455739, 0.09722488, 0.5751757, 0, 0.4196078, 1, 1,
0.2486638, 0.9791636, 0.2990011, 0, 0.4117647, 1, 1,
0.2534585, 0.8284311, 0.4850408, 0, 0.4078431, 1, 1,
0.2542977, -0.2279311, 1.207305, 0, 0.4, 1, 1,
0.2584003, 0.1146679, 0.02402131, 0, 0.3921569, 1, 1,
0.2595695, -0.1583838, 3.031372, 0, 0.3882353, 1, 1,
0.2638173, 0.6701236, 0.1395227, 0, 0.3803922, 1, 1,
0.2652415, -0.6205022, 2.558632, 0, 0.3764706, 1, 1,
0.2665974, -0.3198078, 4.154071, 0, 0.3686275, 1, 1,
0.2674797, 0.3812902, 0.2103374, 0, 0.3647059, 1, 1,
0.2693348, 0.7747973, -1.530724, 0, 0.3568628, 1, 1,
0.2704524, -0.7089309, 3.324947, 0, 0.3529412, 1, 1,
0.2803921, 1.307778, 1.394986, 0, 0.345098, 1, 1,
0.2810891, -1.411533, 4.111092, 0, 0.3411765, 1, 1,
0.2811177, 0.3941756, 1.339697, 0, 0.3333333, 1, 1,
0.2856306, -1.63967, 3.575819, 0, 0.3294118, 1, 1,
0.2881556, 1.147579, 1.020249, 0, 0.3215686, 1, 1,
0.2947272, 0.1487644, 1.027895, 0, 0.3176471, 1, 1,
0.297898, 2.433118, -0.1344479, 0, 0.3098039, 1, 1,
0.2992335, -0.4699286, 2.471869, 0, 0.3058824, 1, 1,
0.2998205, -0.09540874, 1.304187, 0, 0.2980392, 1, 1,
0.3026769, -0.7217407, 3.108957, 0, 0.2901961, 1, 1,
0.3156983, 0.7549684, 0.9890579, 0, 0.2862745, 1, 1,
0.3186874, -0.07704235, 0.7564617, 0, 0.2784314, 1, 1,
0.3242717, -0.9489366, 4.00285, 0, 0.2745098, 1, 1,
0.3261584, -0.3750258, 1.776627, 0, 0.2666667, 1, 1,
0.3263741, -2.131078, 2.37573, 0, 0.2627451, 1, 1,
0.3277013, 1.247749, 0.4682043, 0, 0.254902, 1, 1,
0.3280088, -1.81832, 3.639689, 0, 0.2509804, 1, 1,
0.3302737, 0.5329294, 0.3774797, 0, 0.2431373, 1, 1,
0.3316232, 0.1749739, 0.1444208, 0, 0.2392157, 1, 1,
0.3339312, 0.7355744, 0.8450075, 0, 0.2313726, 1, 1,
0.334078, -1.324697, 2.413426, 0, 0.227451, 1, 1,
0.3363869, -0.6307021, 2.486276, 0, 0.2196078, 1, 1,
0.3368921, 0.1814103, 0.9120019, 0, 0.2156863, 1, 1,
0.3380969, -1.120217, 2.140476, 0, 0.2078431, 1, 1,
0.3398029, 0.00855491, 1.734977, 0, 0.2039216, 1, 1,
0.3429215, 0.1207891, 1.961989, 0, 0.1960784, 1, 1,
0.3439438, -0.3706226, 1.254877, 0, 0.1882353, 1, 1,
0.3464699, -0.5011463, 3.91783, 0, 0.1843137, 1, 1,
0.3467675, 0.8984336, -0.03241147, 0, 0.1764706, 1, 1,
0.3487203, 1.197917, 0.407346, 0, 0.172549, 1, 1,
0.3513293, -0.06237414, 1.300129, 0, 0.1647059, 1, 1,
0.3528177, 0.9889067, 1.133328, 0, 0.1607843, 1, 1,
0.356986, -1.098276, 3.376876, 0, 0.1529412, 1, 1,
0.357232, -2.125201, 2.205489, 0, 0.1490196, 1, 1,
0.359627, -0.4136847, 2.128643, 0, 0.1411765, 1, 1,
0.3640127, -1.652167, 4.011454, 0, 0.1372549, 1, 1,
0.3646201, 0.1119527, 1.2971, 0, 0.1294118, 1, 1,
0.3659919, 1.287421, 0.1532505, 0, 0.1254902, 1, 1,
0.3661464, 0.9378317, -0.1211215, 0, 0.1176471, 1, 1,
0.3665576, 0.4758003, -0.1875533, 0, 0.1137255, 1, 1,
0.3678178, -0.5711296, 3.182141, 0, 0.1058824, 1, 1,
0.3684949, -2.149402, 3.769591, 0, 0.09803922, 1, 1,
0.3690197, -2.112972, 3.569653, 0, 0.09411765, 1, 1,
0.3716186, -0.6777978, 1.757903, 0, 0.08627451, 1, 1,
0.3734096, 1.525534, -1.116027, 0, 0.08235294, 1, 1,
0.3775772, -0.9574595, 1.525627, 0, 0.07450981, 1, 1,
0.3785192, -0.7487557, 2.261434, 0, 0.07058824, 1, 1,
0.3819917, -0.9966864, 3.51354, 0, 0.0627451, 1, 1,
0.3839819, -1.064093, 4.282681, 0, 0.05882353, 1, 1,
0.3858851, 0.3088552, 0.3827619, 0, 0.05098039, 1, 1,
0.3864761, -1.007856, 4.317171, 0, 0.04705882, 1, 1,
0.3951998, 0.3820052, 0.6762132, 0, 0.03921569, 1, 1,
0.3983889, 0.1556702, 2.877738, 0, 0.03529412, 1, 1,
0.3984826, 0.8620454, 0.0002968395, 0, 0.02745098, 1, 1,
0.4041157, -1.186538, 3.271594, 0, 0.02352941, 1, 1,
0.4095415, -0.03998028, 2.630889, 0, 0.01568628, 1, 1,
0.4105304, -0.8906229, 2.069251, 0, 0.01176471, 1, 1,
0.4119541, -0.4589038, 1.952316, 0, 0.003921569, 1, 1,
0.4145654, 0.9498898, -0.9612712, 0.003921569, 0, 1, 1,
0.4177436, 0.6624713, 1.795008, 0.007843138, 0, 1, 1,
0.4190066, -0.4980287, 1.848719, 0.01568628, 0, 1, 1,
0.421132, 0.3986756, 1.278746, 0.01960784, 0, 1, 1,
0.4211497, -0.08957674, 0.04452802, 0.02745098, 0, 1, 1,
0.4215762, 1.445957, 1.360213, 0.03137255, 0, 1, 1,
0.4238145, -1.129016, 3.197273, 0.03921569, 0, 1, 1,
0.4311259, 2.278963, -0.818638, 0.04313726, 0, 1, 1,
0.4322447, -0.7972725, 2.497739, 0.05098039, 0, 1, 1,
0.4361441, -1.210769, 3.147208, 0.05490196, 0, 1, 1,
0.4394798, -0.7194459, 1.506105, 0.0627451, 0, 1, 1,
0.4441526, -0.5504169, 2.365714, 0.06666667, 0, 1, 1,
0.4442537, -0.5158193, 1.539434, 0.07450981, 0, 1, 1,
0.4498359, -0.02429421, 2.664171, 0.07843138, 0, 1, 1,
0.450629, -1.093623, 1.370346, 0.08627451, 0, 1, 1,
0.4558934, -0.2230782, 4.197927, 0.09019608, 0, 1, 1,
0.4564905, 1.778173, -0.3851545, 0.09803922, 0, 1, 1,
0.4593853, 0.8999071, 0.1345565, 0.1058824, 0, 1, 1,
0.4607978, -1.098785, 3.395791, 0.1098039, 0, 1, 1,
0.4633965, -1.246656, 3.784497, 0.1176471, 0, 1, 1,
0.4660706, -0.7740261, -0.7783499, 0.1215686, 0, 1, 1,
0.4674634, 1.762634, 1.083631, 0.1294118, 0, 1, 1,
0.4721687, -0.6564923, 2.068004, 0.1333333, 0, 1, 1,
0.4750862, -1.547846, 5.572716, 0.1411765, 0, 1, 1,
0.4752665, -1.963668, 4.017512, 0.145098, 0, 1, 1,
0.4772469, -1.859753, 1.653241, 0.1529412, 0, 1, 1,
0.4777554, 0.1300959, 1.148539, 0.1568628, 0, 1, 1,
0.481544, -0.2972114, 2.534607, 0.1647059, 0, 1, 1,
0.4826365, -2.675215, 3.467253, 0.1686275, 0, 1, 1,
0.4834951, 0.4518668, 2.609078, 0.1764706, 0, 1, 1,
0.4841116, -2.51582, 3.618416, 0.1803922, 0, 1, 1,
0.4886119, -0.4458688, 2.687682, 0.1882353, 0, 1, 1,
0.4891239, 0.2287937, 1.542429, 0.1921569, 0, 1, 1,
0.4894315, -0.6659045, 3.008369, 0.2, 0, 1, 1,
0.4895489, -0.1359657, 2.68988, 0.2078431, 0, 1, 1,
0.4896024, -1.214105, 2.73767, 0.2117647, 0, 1, 1,
0.490741, 1.187327, 0.5203397, 0.2196078, 0, 1, 1,
0.4980187, 0.6688353, 0.4843966, 0.2235294, 0, 1, 1,
0.4984344, 0.9604668, 1.0571, 0.2313726, 0, 1, 1,
0.4986596, 0.7709666, 2.080199, 0.2352941, 0, 1, 1,
0.5012224, -0.5387374, 2.621165, 0.2431373, 0, 1, 1,
0.5026394, -0.4734988, 1.881998, 0.2470588, 0, 1, 1,
0.503013, 0.6659573, 0.2749561, 0.254902, 0, 1, 1,
0.5042976, -0.2433387, 3.014733, 0.2588235, 0, 1, 1,
0.5127707, 1.128166, -0.5136244, 0.2666667, 0, 1, 1,
0.5128531, -1.149629, 3.674817, 0.2705882, 0, 1, 1,
0.5171645, 1.106141, -1.283389, 0.2784314, 0, 1, 1,
0.5200486, -0.5141578, 2.029485, 0.282353, 0, 1, 1,
0.5204391, -1.518614, 2.495391, 0.2901961, 0, 1, 1,
0.5252506, -1.313912, 1.578855, 0.2941177, 0, 1, 1,
0.5258102, 1.293624, 1.831033, 0.3019608, 0, 1, 1,
0.5301703, -0.3673797, 0.8225632, 0.3098039, 0, 1, 1,
0.530944, -0.7072242, 3.656165, 0.3137255, 0, 1, 1,
0.53225, -0.1443482, 3.503438, 0.3215686, 0, 1, 1,
0.5338904, 1.102817, -0.7158821, 0.3254902, 0, 1, 1,
0.5359026, -0.6614921, 3.320385, 0.3333333, 0, 1, 1,
0.5373011, 0.373147, 2.262233, 0.3372549, 0, 1, 1,
0.5402941, 0.4373745, 1.364303, 0.345098, 0, 1, 1,
0.5516957, -0.175512, 2.424077, 0.3490196, 0, 1, 1,
0.5551173, 0.4738278, 1.789165, 0.3568628, 0, 1, 1,
0.5594196, 1.10582, 0.4497676, 0.3607843, 0, 1, 1,
0.5614995, 1.509389, -0.9422449, 0.3686275, 0, 1, 1,
0.5620607, -1.337271, 2.944313, 0.372549, 0, 1, 1,
0.5675238, -1.364256, 2.21691, 0.3803922, 0, 1, 1,
0.5677023, -0.9352729, 2.367658, 0.3843137, 0, 1, 1,
0.575667, 0.8510563, 1.865316, 0.3921569, 0, 1, 1,
0.5826745, 0.1649415, 0.6061091, 0.3960784, 0, 1, 1,
0.5917193, 0.5502762, 1.367879, 0.4039216, 0, 1, 1,
0.5919006, -1.420401, 1.777366, 0.4117647, 0, 1, 1,
0.5966899, -0.8525724, 4.504144, 0.4156863, 0, 1, 1,
0.6091351, -0.9214606, 2.075289, 0.4235294, 0, 1, 1,
0.6097414, 0.345426, 0.06853301, 0.427451, 0, 1, 1,
0.6104767, 0.9678195, -0.04631257, 0.4352941, 0, 1, 1,
0.6159333, -1.036318, 1.445921, 0.4392157, 0, 1, 1,
0.6169975, -0.403067, 1.696581, 0.4470588, 0, 1, 1,
0.6174324, 0.3423967, 0.01395455, 0.4509804, 0, 1, 1,
0.6202151, -0.4823691, 2.164675, 0.4588235, 0, 1, 1,
0.6215768, -1.312657, 3.266469, 0.4627451, 0, 1, 1,
0.6266049, -0.3060443, 2.383296, 0.4705882, 0, 1, 1,
0.6280599, 1.808054, 1.732792, 0.4745098, 0, 1, 1,
0.6284648, -0.04330499, 0.5008369, 0.4823529, 0, 1, 1,
0.6321489, 0.003397157, 3.067387, 0.4862745, 0, 1, 1,
0.6324155, 0.2377566, 1.680107, 0.4941176, 0, 1, 1,
0.6360011, 0.3994534, -0.7363561, 0.5019608, 0, 1, 1,
0.6430104, 0.8402822, 1.456424, 0.5058824, 0, 1, 1,
0.6573629, -0.4094628, 2.971485, 0.5137255, 0, 1, 1,
0.6645409, 0.5218973, 0.3949056, 0.5176471, 0, 1, 1,
0.6647598, -0.1222363, 2.555976, 0.5254902, 0, 1, 1,
0.6681346, -0.3972551, 3.042325, 0.5294118, 0, 1, 1,
0.6699711, 0.008084641, 2.36566, 0.5372549, 0, 1, 1,
0.6709835, 0.9541612, 0.5839952, 0.5411765, 0, 1, 1,
0.6711969, 1.509003, 0.3455905, 0.5490196, 0, 1, 1,
0.6733081, 0.5230004, 1.541247, 0.5529412, 0, 1, 1,
0.6756626, 1.158952, 1.003032, 0.5607843, 0, 1, 1,
0.6857176, -1.28682, 3.318961, 0.5647059, 0, 1, 1,
0.6949687, -2.165939, 1.016112, 0.572549, 0, 1, 1,
0.6992245, 1.212143, -1.549291, 0.5764706, 0, 1, 1,
0.7055653, -0.3199115, -0.2041504, 0.5843138, 0, 1, 1,
0.7077003, -0.8517994, 1.497221, 0.5882353, 0, 1, 1,
0.708025, 0.8479365, -1.243297, 0.5960785, 0, 1, 1,
0.7082214, -0.7904221, 2.81487, 0.6039216, 0, 1, 1,
0.7112814, -0.158704, 2.826652, 0.6078432, 0, 1, 1,
0.7167088, 0.645717, 1.536336, 0.6156863, 0, 1, 1,
0.7198187, 1.482959, 0.9294809, 0.6196079, 0, 1, 1,
0.7199504, -0.908619, 1.077167, 0.627451, 0, 1, 1,
0.7243034, 0.5440087, -0.2951494, 0.6313726, 0, 1, 1,
0.7325974, -0.7386031, 3.145713, 0.6392157, 0, 1, 1,
0.734556, -0.8903956, 3.053782, 0.6431373, 0, 1, 1,
0.7367607, -0.8793555, 3.946558, 0.6509804, 0, 1, 1,
0.7432649, 0.3158299, 1.144197, 0.654902, 0, 1, 1,
0.7433855, -0.343943, 3.122449, 0.6627451, 0, 1, 1,
0.7446701, 1.887186, 0.845225, 0.6666667, 0, 1, 1,
0.7475392, -2.119938, 2.779085, 0.6745098, 0, 1, 1,
0.7516716, 0.03148516, 1.141953, 0.6784314, 0, 1, 1,
0.7618748, -0.716584, 2.678291, 0.6862745, 0, 1, 1,
0.76224, 0.5505233, 0.0186727, 0.6901961, 0, 1, 1,
0.7636696, -0.6186484, 1.977826, 0.6980392, 0, 1, 1,
0.7638586, 0.9366286, 1.042223, 0.7058824, 0, 1, 1,
0.7652339, 0.2913675, -0.9069597, 0.7098039, 0, 1, 1,
0.7722926, -0.358889, 2.208525, 0.7176471, 0, 1, 1,
0.7747633, -0.7093852, 1.638895, 0.7215686, 0, 1, 1,
0.7814726, 1.21901, 0.8037974, 0.7294118, 0, 1, 1,
0.7833184, -0.9920886, 0.4259958, 0.7333333, 0, 1, 1,
0.7855614, -1.121685, 2.85428, 0.7411765, 0, 1, 1,
0.7995503, 0.8871949, 0.5613528, 0.7450981, 0, 1, 1,
0.7996176, 1.536399, 0.5353107, 0.7529412, 0, 1, 1,
0.8024367, -1.857934, 2.314558, 0.7568628, 0, 1, 1,
0.8075707, 0.2693329, 1.989471, 0.7647059, 0, 1, 1,
0.808347, 0.6580505, 0.007169202, 0.7686275, 0, 1, 1,
0.8094772, 0.2516189, 2.065924, 0.7764706, 0, 1, 1,
0.8179232, -1.805406, 1.391781, 0.7803922, 0, 1, 1,
0.8226846, -0.7844501, 2.440585, 0.7882353, 0, 1, 1,
0.8259568, -0.5858533, 3.075569, 0.7921569, 0, 1, 1,
0.8279424, -0.3753179, 1.786659, 0.8, 0, 1, 1,
0.8299668, 0.5782624, -0.6389618, 0.8078431, 0, 1, 1,
0.837906, -0.7531332, 2.677515, 0.8117647, 0, 1, 1,
0.8398641, -0.7854283, 1.728338, 0.8196079, 0, 1, 1,
0.8516873, 0.6093509, 1.575307, 0.8235294, 0, 1, 1,
0.8563111, 0.6161504, 0.3610457, 0.8313726, 0, 1, 1,
0.8565443, 0.9268191, 0.5791582, 0.8352941, 0, 1, 1,
0.8590903, -0.8405349, 2.131041, 0.8431373, 0, 1, 1,
0.8632863, -0.08358825, -1.690106, 0.8470588, 0, 1, 1,
0.8746201, 0.08834353, 1.47759, 0.854902, 0, 1, 1,
0.8829717, -0.5349551, 2.247458, 0.8588235, 0, 1, 1,
0.883165, -0.8043145, 0.5039259, 0.8666667, 0, 1, 1,
0.8842667, 0.2604319, 1.399913, 0.8705882, 0, 1, 1,
0.8857859, 0.4026239, 0.2095277, 0.8784314, 0, 1, 1,
0.8976249, -0.67458, 2.732103, 0.8823529, 0, 1, 1,
0.8992333, -0.1903769, 1.850337, 0.8901961, 0, 1, 1,
0.8995024, 0.5937596, 0.4136046, 0.8941177, 0, 1, 1,
0.9003488, -1.388031, 3.778368, 0.9019608, 0, 1, 1,
0.9004322, 1.248741, -1.082029, 0.9098039, 0, 1, 1,
0.9028606, 0.837045, 1.261749, 0.9137255, 0, 1, 1,
0.9042788, 0.1942159, 3.302665, 0.9215686, 0, 1, 1,
0.9106535, 1.629015, 1.16827, 0.9254902, 0, 1, 1,
0.9158539, -0.06094532, -0.3629032, 0.9333333, 0, 1, 1,
0.9246278, 0.4492099, 0.8532049, 0.9372549, 0, 1, 1,
0.9246309, -1.225079, 2.025756, 0.945098, 0, 1, 1,
0.9280837, 0.5890608, 1.231954, 0.9490196, 0, 1, 1,
0.9315549, 1.28819, 0.7355889, 0.9568627, 0, 1, 1,
0.9348212, 1.179202, 0.7115911, 0.9607843, 0, 1, 1,
0.9366768, -0.9559915, 3.369104, 0.9686275, 0, 1, 1,
0.9370321, 0.3459982, 1.323541, 0.972549, 0, 1, 1,
0.9391617, -0.1901966, 1.591953, 0.9803922, 0, 1, 1,
0.9493805, -1.370588, 0.6800914, 0.9843137, 0, 1, 1,
0.9495903, -0.1494941, 3.641676, 0.9921569, 0, 1, 1,
0.9508741, -1.155938, 1.946161, 0.9960784, 0, 1, 1,
0.9640689, 0.471826, -0.6232331, 1, 0, 0.9960784, 1,
0.9660667, 0.1743392, 1.721026, 1, 0, 0.9882353, 1,
0.9665484, 2.244969, 1.295518, 1, 0, 0.9843137, 1,
0.9738529, -0.3940535, -1.168501, 1, 0, 0.9764706, 1,
0.9834824, 0.6552919, 1.160682, 1, 0, 0.972549, 1,
0.9840296, 0.1261818, 1.898065, 1, 0, 0.9647059, 1,
0.9875695, 0.7853094, 1.372232, 1, 0, 0.9607843, 1,
0.9889886, -0.8835719, 2.04271, 1, 0, 0.9529412, 1,
0.9905807, 0.2229455, -0.02672792, 1, 0, 0.9490196, 1,
1.003184, 1.405196, 1.681769, 1, 0, 0.9411765, 1,
1.005254, -1.474157, 2.681865, 1, 0, 0.9372549, 1,
1.011688, -0.3403473, 1.008254, 1, 0, 0.9294118, 1,
1.018871, -0.9420531, 2.268212, 1, 0, 0.9254902, 1,
1.019059, 1.207345, 0.03470268, 1, 0, 0.9176471, 1,
1.02521, 0.5859734, 0.49156, 1, 0, 0.9137255, 1,
1.030586, 2.188231, -0.1292626, 1, 0, 0.9058824, 1,
1.030816, -1.718282, 2.900087, 1, 0, 0.9019608, 1,
1.040623, 0.8586292, 1.970261, 1, 0, 0.8941177, 1,
1.041661, -0.3722105, 2.436337, 1, 0, 0.8862745, 1,
1.042132, 0.9924828, 0.1182573, 1, 0, 0.8823529, 1,
1.04325, -1.301326, 1.599304, 1, 0, 0.8745098, 1,
1.044293, 0.1951524, 0.9853811, 1, 0, 0.8705882, 1,
1.047985, 0.6116636, 1.037089, 1, 0, 0.8627451, 1,
1.057293, -0.9446439, 1.230257, 1, 0, 0.8588235, 1,
1.060683, 0.6445282, 0.8344567, 1, 0, 0.8509804, 1,
1.061631, 1.480875, 0.6964112, 1, 0, 0.8470588, 1,
1.062878, 0.3347615, 2.12607, 1, 0, 0.8392157, 1,
1.064656, 0.6954756, 1.693858, 1, 0, 0.8352941, 1,
1.066519, 0.2506391, 0.3020682, 1, 0, 0.827451, 1,
1.070553, -1.161394, 2.408337, 1, 0, 0.8235294, 1,
1.070761, 0.6981657, -0.6375048, 1, 0, 0.8156863, 1,
1.072035, -0.6743271, 2.864865, 1, 0, 0.8117647, 1,
1.072277, 2.238407, 0.751654, 1, 0, 0.8039216, 1,
1.080106, 0.7335804, 0.8570113, 1, 0, 0.7960784, 1,
1.080488, -0.4887376, 2.557427, 1, 0, 0.7921569, 1,
1.082495, -1.166854, 3.549241, 1, 0, 0.7843137, 1,
1.084683, 1.471727, 3.2441, 1, 0, 0.7803922, 1,
1.094119, -0.9473159, 3.183633, 1, 0, 0.772549, 1,
1.095261, -0.5490825, 2.651544, 1, 0, 0.7686275, 1,
1.097902, 0.8937823, 0.7861801, 1, 0, 0.7607843, 1,
1.098311, 2.470787, 1.023869, 1, 0, 0.7568628, 1,
1.104993, -0.4736769, 2.038291, 1, 0, 0.7490196, 1,
1.121686, -1.11354, 3.938238, 1, 0, 0.7450981, 1,
1.126937, 1.047847, 2.973761, 1, 0, 0.7372549, 1,
1.133196, 0.09432957, 0.2336944, 1, 0, 0.7333333, 1,
1.139, -0.3482588, 1.661722, 1, 0, 0.7254902, 1,
1.140555, -0.2191577, 2.456511, 1, 0, 0.7215686, 1,
1.14624, -2.017394, 3.116528, 1, 0, 0.7137255, 1,
1.152979, 2.434018, 1.304007, 1, 0, 0.7098039, 1,
1.16175, 1.317074, 1.153262, 1, 0, 0.7019608, 1,
1.167404, -0.883543, 4.74902, 1, 0, 0.6941177, 1,
1.17601, -0.3535717, 2.226444, 1, 0, 0.6901961, 1,
1.179053, 0.3924509, 0.2371053, 1, 0, 0.682353, 1,
1.181936, -0.4548292, 1.470281, 1, 0, 0.6784314, 1,
1.191116, 1.184709, -0.2270629, 1, 0, 0.6705883, 1,
1.195038, 1.515875, 0.07428106, 1, 0, 0.6666667, 1,
1.19815, 1.012082, 1.911796, 1, 0, 0.6588235, 1,
1.203589, 1.261305, -0.1881468, 1, 0, 0.654902, 1,
1.209846, 0.2943515, 0.4393339, 1, 0, 0.6470588, 1,
1.217744, 0.6097817, 1.028657, 1, 0, 0.6431373, 1,
1.217963, -1.616438, 1.773306, 1, 0, 0.6352941, 1,
1.226038, -0.2886968, 1.920813, 1, 0, 0.6313726, 1,
1.228426, -1.315183, 2.630046, 1, 0, 0.6235294, 1,
1.229672, -0.2377051, 1.566362, 1, 0, 0.6196079, 1,
1.24033, -1.39368, 3.134312, 1, 0, 0.6117647, 1,
1.251539, 1.016312, -0.3415693, 1, 0, 0.6078432, 1,
1.256058, 1.00999, -0.4742598, 1, 0, 0.6, 1,
1.276879, -0.9236951, 2.006262, 1, 0, 0.5921569, 1,
1.278739, 0.7120517, 3.007354, 1, 0, 0.5882353, 1,
1.281103, 0.61788, 3.265694, 1, 0, 0.5803922, 1,
1.288719, -0.3581284, 0.8710088, 1, 0, 0.5764706, 1,
1.290669, -0.3573257, 1.616557, 1, 0, 0.5686275, 1,
1.299405, 0.9538106, 1.563446, 1, 0, 0.5647059, 1,
1.300291, 0.7347413, 0.8379007, 1, 0, 0.5568628, 1,
1.301168, 2.2697, -1.421015, 1, 0, 0.5529412, 1,
1.313842, -0.2981612, 2.019938, 1, 0, 0.5450981, 1,
1.315112, -2.452295, 1.670048, 1, 0, 0.5411765, 1,
1.328109, 0.2028513, 1.661287, 1, 0, 0.5333334, 1,
1.331448, -1.420574, 2.597684, 1, 0, 0.5294118, 1,
1.333162, 0.2239962, 2.355924, 1, 0, 0.5215687, 1,
1.336837, 0.9835577, 1.093269, 1, 0, 0.5176471, 1,
1.341312, -0.8861079, 3.400423, 1, 0, 0.509804, 1,
1.344499, -0.09039985, 1.897282, 1, 0, 0.5058824, 1,
1.369708, -0.2225769, 0.7203786, 1, 0, 0.4980392, 1,
1.372668, 0.6028539, -0.3490276, 1, 0, 0.4901961, 1,
1.379961, 0.5055384, 0.9895824, 1, 0, 0.4862745, 1,
1.398037, 0.3079565, 1.449273, 1, 0, 0.4784314, 1,
1.404943, -0.1404693, -0.8551681, 1, 0, 0.4745098, 1,
1.405693, -0.2369762, 2.292938, 1, 0, 0.4666667, 1,
1.407458, 0.2618802, -1.535437, 1, 0, 0.4627451, 1,
1.410433, 0.2281049, 0.6379489, 1, 0, 0.454902, 1,
1.413266, 0.03544126, 0.8648217, 1, 0, 0.4509804, 1,
1.41651, 0.2148497, 1.127662, 1, 0, 0.4431373, 1,
1.422203, 0.7379972, 0.4244477, 1, 0, 0.4392157, 1,
1.424656, -0.8705176, 5.028539, 1, 0, 0.4313726, 1,
1.424701, 0.6047817, -0.7516623, 1, 0, 0.427451, 1,
1.429731, -0.195465, 0.8442086, 1, 0, 0.4196078, 1,
1.43027, -1.580526, 1.971837, 1, 0, 0.4156863, 1,
1.430524, 1.255688, 0.583828, 1, 0, 0.4078431, 1,
1.437559, 0.7049336, 0.3115519, 1, 0, 0.4039216, 1,
1.452152, 1.401324, 0.7622716, 1, 0, 0.3960784, 1,
1.456924, -0.03983359, 2.897459, 1, 0, 0.3882353, 1,
1.458191, 0.5822973, 0.9659255, 1, 0, 0.3843137, 1,
1.462263, 1.336245, 1.119346, 1, 0, 0.3764706, 1,
1.473425, -1.018918, 1.845879, 1, 0, 0.372549, 1,
1.473883, -0.2841212, 0.8039781, 1, 0, 0.3647059, 1,
1.482873, -1.646645, 2.902137, 1, 0, 0.3607843, 1,
1.483109, -0.1007439, 1.013607, 1, 0, 0.3529412, 1,
1.488372, -0.8628501, 1.482957, 1, 0, 0.3490196, 1,
1.500338, -0.3248357, 2.852069, 1, 0, 0.3411765, 1,
1.53016, -0.2524184, 1.41975, 1, 0, 0.3372549, 1,
1.560422, -0.1512308, 1.202314, 1, 0, 0.3294118, 1,
1.57735, 0.07317287, 1.527261, 1, 0, 0.3254902, 1,
1.593043, -1.021176, 1.637855, 1, 0, 0.3176471, 1,
1.593665, -0.254122, 1.464756, 1, 0, 0.3137255, 1,
1.600043, 1.848369, 1.506105, 1, 0, 0.3058824, 1,
1.601703, 1.163699, 1.315285, 1, 0, 0.2980392, 1,
1.615377, 0.2212725, 0.3533027, 1, 0, 0.2941177, 1,
1.628271, -0.1786879, 0.07117604, 1, 0, 0.2862745, 1,
1.628346, 0.4950784, 0.7234381, 1, 0, 0.282353, 1,
1.642211, 0.7678216, 0.7888604, 1, 0, 0.2745098, 1,
1.667546, -0.9740474, 3.196146, 1, 0, 0.2705882, 1,
1.673067, 0.1779592, 2.635827, 1, 0, 0.2627451, 1,
1.736964, -0.62873, 1.763978, 1, 0, 0.2588235, 1,
1.742517, 0.3384313, 1.026883, 1, 0, 0.2509804, 1,
1.751363, 0.186508, 1.329718, 1, 0, 0.2470588, 1,
1.786114, 1.057613, 1.295977, 1, 0, 0.2392157, 1,
1.798146, -1.943786, 3.394106, 1, 0, 0.2352941, 1,
1.798934, 1.313615, 0.9652919, 1, 0, 0.227451, 1,
1.799022, -2.198567, 3.023859, 1, 0, 0.2235294, 1,
1.807919, -0.8383219, 0.3746852, 1, 0, 0.2156863, 1,
1.816619, -0.6035668, 2.046629, 1, 0, 0.2117647, 1,
1.840243, 0.9943209, 1.246967, 1, 0, 0.2039216, 1,
1.856536, 1.223292, 1.18273, 1, 0, 0.1960784, 1,
1.858113, -1.029201, 1.965909, 1, 0, 0.1921569, 1,
1.859251, -0.2441427, 1.235548, 1, 0, 0.1843137, 1,
1.880195, -0.56195, 0.9729986, 1, 0, 0.1803922, 1,
1.884983, 2.126492, 1.809605, 1, 0, 0.172549, 1,
1.888783, -1.35562, 2.835586, 1, 0, 0.1686275, 1,
1.889553, -1.400294, 1.867396, 1, 0, 0.1607843, 1,
1.895604, 1.345886, 1.937813, 1, 0, 0.1568628, 1,
1.909589, -1.647028, 2.102587, 1, 0, 0.1490196, 1,
1.922727, -0.5710457, 0.1956931, 1, 0, 0.145098, 1,
1.954685, 0.2272596, 0.8509345, 1, 0, 0.1372549, 1,
1.977109, -1.327376, 2.400594, 1, 0, 0.1333333, 1,
1.999609, -1.162995, 3.05753, 1, 0, 0.1254902, 1,
2.009131, 0.3998339, 0.003465355, 1, 0, 0.1215686, 1,
2.080208, 0.5891086, 1.194176, 1, 0, 0.1137255, 1,
2.086048, -0.2351873, 0.8115346, 1, 0, 0.1098039, 1,
2.089238, -1.089188, 0.0757038, 1, 0, 0.1019608, 1,
2.138114, -0.05769537, 1.779396, 1, 0, 0.09411765, 1,
2.150548, -1.750668, 3.11368, 1, 0, 0.09019608, 1,
2.169418, -1.084867, 2.679404, 1, 0, 0.08235294, 1,
2.171353, -0.986842, 2.225304, 1, 0, 0.07843138, 1,
2.228366, -0.4776118, 1.412674, 1, 0, 0.07058824, 1,
2.235614, -0.5925971, 1.842836, 1, 0, 0.06666667, 1,
2.346367, 0.2843419, 2.074977, 1, 0, 0.05882353, 1,
2.411861, 0.8995675, 0.632081, 1, 0, 0.05490196, 1,
2.483252, -1.301743, 2.672845, 1, 0, 0.04705882, 1,
2.61248, -1.418486, 2.187033, 1, 0, 0.04313726, 1,
2.847133, 0.184652, 2.478918, 1, 0, 0.03529412, 1,
2.857709, -1.552721, 1.13544, 1, 0, 0.03137255, 1,
2.942383, 0.1655119, 1.22772, 1, 0, 0.02352941, 1,
3.069617, 0.1323814, 0.7467889, 1, 0, 0.01960784, 1,
3.210438, -0.3941547, 1.77491, 1, 0, 0.01176471, 1,
3.264771, -0.2042253, 0.9276689, 1, 0, 0.007843138, 1
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
-0.08272469, -4.190477, -6.875041, 0, -0.5, 0.5, 0.5,
-0.08272469, -4.190477, -6.875041, 1, -0.5, 0.5, 0.5,
-0.08272469, -4.190477, -6.875041, 1, 1.5, 0.5, 0.5,
-0.08272469, -4.190477, -6.875041, 0, 1.5, 0.5, 0.5
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
-4.565022, -0.1352372, -6.875041, 0, -0.5, 0.5, 0.5,
-4.565022, -0.1352372, -6.875041, 1, -0.5, 0.5, 0.5,
-4.565022, -0.1352372, -6.875041, 1, 1.5, 0.5, 0.5,
-4.565022, -0.1352372, -6.875041, 0, 1.5, 0.5, 0.5
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
-4.565022, -4.190477, 0.2508874, 0, -0.5, 0.5, 0.5,
-4.565022, -4.190477, 0.2508874, 1, -0.5, 0.5, 0.5,
-4.565022, -4.190477, 0.2508874, 1, 1.5, 0.5, 0.5,
-4.565022, -4.190477, 0.2508874, 0, 1.5, 0.5, 0.5
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
-3, -3.254653, -5.230597,
3, -3.254653, -5.230597,
-3, -3.254653, -5.230597,
-3, -3.410623, -5.504671,
-2, -3.254653, -5.230597,
-2, -3.410623, -5.504671,
-1, -3.254653, -5.230597,
-1, -3.410623, -5.504671,
0, -3.254653, -5.230597,
0, -3.410623, -5.504671,
1, -3.254653, -5.230597,
1, -3.410623, -5.504671,
2, -3.254653, -5.230597,
2, -3.410623, -5.504671,
3, -3.254653, -5.230597,
3, -3.410623, -5.504671
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
-3, -3.722565, -6.052819, 0, -0.5, 0.5, 0.5,
-3, -3.722565, -6.052819, 1, -0.5, 0.5, 0.5,
-3, -3.722565, -6.052819, 1, 1.5, 0.5, 0.5,
-3, -3.722565, -6.052819, 0, 1.5, 0.5, 0.5,
-2, -3.722565, -6.052819, 0, -0.5, 0.5, 0.5,
-2, -3.722565, -6.052819, 1, -0.5, 0.5, 0.5,
-2, -3.722565, -6.052819, 1, 1.5, 0.5, 0.5,
-2, -3.722565, -6.052819, 0, 1.5, 0.5, 0.5,
-1, -3.722565, -6.052819, 0, -0.5, 0.5, 0.5,
-1, -3.722565, -6.052819, 1, -0.5, 0.5, 0.5,
-1, -3.722565, -6.052819, 1, 1.5, 0.5, 0.5,
-1, -3.722565, -6.052819, 0, 1.5, 0.5, 0.5,
0, -3.722565, -6.052819, 0, -0.5, 0.5, 0.5,
0, -3.722565, -6.052819, 1, -0.5, 0.5, 0.5,
0, -3.722565, -6.052819, 1, 1.5, 0.5, 0.5,
0, -3.722565, -6.052819, 0, 1.5, 0.5, 0.5,
1, -3.722565, -6.052819, 0, -0.5, 0.5, 0.5,
1, -3.722565, -6.052819, 1, -0.5, 0.5, 0.5,
1, -3.722565, -6.052819, 1, 1.5, 0.5, 0.5,
1, -3.722565, -6.052819, 0, 1.5, 0.5, 0.5,
2, -3.722565, -6.052819, 0, -0.5, 0.5, 0.5,
2, -3.722565, -6.052819, 1, -0.5, 0.5, 0.5,
2, -3.722565, -6.052819, 1, 1.5, 0.5, 0.5,
2, -3.722565, -6.052819, 0, 1.5, 0.5, 0.5,
3, -3.722565, -6.052819, 0, -0.5, 0.5, 0.5,
3, -3.722565, -6.052819, 1, -0.5, 0.5, 0.5,
3, -3.722565, -6.052819, 1, 1.5, 0.5, 0.5,
3, -3.722565, -6.052819, 0, 1.5, 0.5, 0.5
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
-3.530645, -3, -5.230597,
-3.530645, 2, -5.230597,
-3.530645, -3, -5.230597,
-3.703042, -3, -5.504671,
-3.530645, -2, -5.230597,
-3.703042, -2, -5.504671,
-3.530645, -1, -5.230597,
-3.703042, -1, -5.504671,
-3.530645, 0, -5.230597,
-3.703042, 0, -5.504671,
-3.530645, 1, -5.230597,
-3.703042, 1, -5.504671,
-3.530645, 2, -5.230597,
-3.703042, 2, -5.504671
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
-4.047833, -3, -6.052819, 0, -0.5, 0.5, 0.5,
-4.047833, -3, -6.052819, 1, -0.5, 0.5, 0.5,
-4.047833, -3, -6.052819, 1, 1.5, 0.5, 0.5,
-4.047833, -3, -6.052819, 0, 1.5, 0.5, 0.5,
-4.047833, -2, -6.052819, 0, -0.5, 0.5, 0.5,
-4.047833, -2, -6.052819, 1, -0.5, 0.5, 0.5,
-4.047833, -2, -6.052819, 1, 1.5, 0.5, 0.5,
-4.047833, -2, -6.052819, 0, 1.5, 0.5, 0.5,
-4.047833, -1, -6.052819, 0, -0.5, 0.5, 0.5,
-4.047833, -1, -6.052819, 1, -0.5, 0.5, 0.5,
-4.047833, -1, -6.052819, 1, 1.5, 0.5, 0.5,
-4.047833, -1, -6.052819, 0, 1.5, 0.5, 0.5,
-4.047833, 0, -6.052819, 0, -0.5, 0.5, 0.5,
-4.047833, 0, -6.052819, 1, -0.5, 0.5, 0.5,
-4.047833, 0, -6.052819, 1, 1.5, 0.5, 0.5,
-4.047833, 0, -6.052819, 0, 1.5, 0.5, 0.5,
-4.047833, 1, -6.052819, 0, -0.5, 0.5, 0.5,
-4.047833, 1, -6.052819, 1, -0.5, 0.5, 0.5,
-4.047833, 1, -6.052819, 1, 1.5, 0.5, 0.5,
-4.047833, 1, -6.052819, 0, 1.5, 0.5, 0.5,
-4.047833, 2, -6.052819, 0, -0.5, 0.5, 0.5,
-4.047833, 2, -6.052819, 1, -0.5, 0.5, 0.5,
-4.047833, 2, -6.052819, 1, 1.5, 0.5, 0.5,
-4.047833, 2, -6.052819, 0, 1.5, 0.5, 0.5
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
-3.530645, -3.254653, -4,
-3.530645, -3.254653, 4,
-3.530645, -3.254653, -4,
-3.703042, -3.410623, -4,
-3.530645, -3.254653, -2,
-3.703042, -3.410623, -2,
-3.530645, -3.254653, 0,
-3.703042, -3.410623, 0,
-3.530645, -3.254653, 2,
-3.703042, -3.410623, 2,
-3.530645, -3.254653, 4,
-3.703042, -3.410623, 4
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
-4.047833, -3.722565, -4, 0, -0.5, 0.5, 0.5,
-4.047833, -3.722565, -4, 1, -0.5, 0.5, 0.5,
-4.047833, -3.722565, -4, 1, 1.5, 0.5, 0.5,
-4.047833, -3.722565, -4, 0, 1.5, 0.5, 0.5,
-4.047833, -3.722565, -2, 0, -0.5, 0.5, 0.5,
-4.047833, -3.722565, -2, 1, -0.5, 0.5, 0.5,
-4.047833, -3.722565, -2, 1, 1.5, 0.5, 0.5,
-4.047833, -3.722565, -2, 0, 1.5, 0.5, 0.5,
-4.047833, -3.722565, 0, 0, -0.5, 0.5, 0.5,
-4.047833, -3.722565, 0, 1, -0.5, 0.5, 0.5,
-4.047833, -3.722565, 0, 1, 1.5, 0.5, 0.5,
-4.047833, -3.722565, 0, 0, 1.5, 0.5, 0.5,
-4.047833, -3.722565, 2, 0, -0.5, 0.5, 0.5,
-4.047833, -3.722565, 2, 1, -0.5, 0.5, 0.5,
-4.047833, -3.722565, 2, 1, 1.5, 0.5, 0.5,
-4.047833, -3.722565, 2, 0, 1.5, 0.5, 0.5,
-4.047833, -3.722565, 4, 0, -0.5, 0.5, 0.5,
-4.047833, -3.722565, 4, 1, -0.5, 0.5, 0.5,
-4.047833, -3.722565, 4, 1, 1.5, 0.5, 0.5,
-4.047833, -3.722565, 4, 0, 1.5, 0.5, 0.5
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
-3.530645, -3.254653, -5.230597,
-3.530645, 2.984178, -5.230597,
-3.530645, -3.254653, 5.732371,
-3.530645, 2.984178, 5.732371,
-3.530645, -3.254653, -5.230597,
-3.530645, -3.254653, 5.732371,
-3.530645, 2.984178, -5.230597,
-3.530645, 2.984178, 5.732371,
-3.530645, -3.254653, -5.230597,
3.365196, -3.254653, -5.230597,
-3.530645, -3.254653, 5.732371,
3.365196, -3.254653, 5.732371,
-3.530645, 2.984178, -5.230597,
3.365196, 2.984178, -5.230597,
-3.530645, 2.984178, 5.732371,
3.365196, 2.984178, 5.732371,
3.365196, -3.254653, -5.230597,
3.365196, 2.984178, -5.230597,
3.365196, -3.254653, 5.732371,
3.365196, 2.984178, 5.732371,
3.365196, -3.254653, -5.230597,
3.365196, -3.254653, 5.732371,
3.365196, 2.984178, -5.230597,
3.365196, 2.984178, 5.732371
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
var radius = 7.676373;
var distance = 34.15305;
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
mvMatrix.translate( 0.08272469, 0.1352372, -0.2508874 );
mvMatrix.scale( 1.203601, 1.330353, 0.7570802 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.15305);
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
Borea<-read.table("Borea.xyz")
```

```
## Error in read.table("Borea.xyz"): no lines available in input
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
-3.430221, -1.758596, -3.068051, 0, 0, 1, 1, 1,
-3.344309, -0.2656679, -2.50492, 1, 0, 0, 1, 1,
-3.159495, 0.1662775, -0.5265938, 1, 0, 0, 1, 1,
-2.917244, -0.8529726, -1.581354, 1, 0, 0, 1, 1,
-2.822662, -0.2525417, -1.639505, 1, 0, 0, 1, 1,
-2.818084, -0.4919703, -1.210568, 1, 0, 0, 1, 1,
-2.683055, -0.03748813, -2.793328, 0, 0, 0, 1, 1,
-2.675409, -0.5615606, -0.8491669, 0, 0, 0, 1, 1,
-2.496285, 1.421314, -2.42473, 0, 0, 0, 1, 1,
-2.457188, -1.176487, -2.648875, 0, 0, 0, 1, 1,
-2.427916, -0.6733032, -2.543767, 0, 0, 0, 1, 1,
-2.401105, -0.5952677, -1.719403, 0, 0, 0, 1, 1,
-2.380986, -0.7188766, -3.13919, 0, 0, 0, 1, 1,
-2.366078, 0.1330062, -3.165083, 1, 1, 1, 1, 1,
-2.335314, 0.1944443, -2.153143, 1, 1, 1, 1, 1,
-2.329406, 1.167977, -2.047231, 1, 1, 1, 1, 1,
-2.308848, 1.903054, -0.02238577, 1, 1, 1, 1, 1,
-2.303322, 0.6568944, -2.029979, 1, 1, 1, 1, 1,
-2.295625, -0.09934638, -2.260069, 1, 1, 1, 1, 1,
-2.271752, -1.939505, -2.553648, 1, 1, 1, 1, 1,
-2.189271, -1.604359, -1.927641, 1, 1, 1, 1, 1,
-2.174935, 0.99188, -1.941604, 1, 1, 1, 1, 1,
-2.17452, -0.2284947, -3.036278, 1, 1, 1, 1, 1,
-2.174133, -0.5315648, -1.926392, 1, 1, 1, 1, 1,
-2.150067, 0.3412702, -0.03634126, 1, 1, 1, 1, 1,
-2.098295, 2.29091, -1.15773, 1, 1, 1, 1, 1,
-2.040376, -0.6489154, -3.206876, 1, 1, 1, 1, 1,
-2.012959, -0.0534961, -1.361062, 1, 1, 1, 1, 1,
-2.012703, 0.3577344, -1.470886, 0, 0, 1, 1, 1,
-2.008979, -0.6252519, -0.4167528, 1, 0, 0, 1, 1,
-2.004316, -0.2036347, -0.7378542, 1, 0, 0, 1, 1,
-1.997301, 0.9318671, -0.6790617, 1, 0, 0, 1, 1,
-1.993178, -1.296187, -3.000107, 1, 0, 0, 1, 1,
-1.946213, -0.6353812, -0.7531795, 1, 0, 0, 1, 1,
-1.945747, -0.5010064, -0.5017453, 0, 0, 0, 1, 1,
-1.932518, -0.1954234, -1.713369, 0, 0, 0, 1, 1,
-1.930007, -1.111174, -1.875128, 0, 0, 0, 1, 1,
-1.886835, -1.803673, -0.3459605, 0, 0, 0, 1, 1,
-1.851697, -0.7057663, -2.614291, 0, 0, 0, 1, 1,
-1.834304, -0.04833032, -1.171883, 0, 0, 0, 1, 1,
-1.830479, 0.3065156, -3.16504, 0, 0, 0, 1, 1,
-1.829852, -0.4358507, -3.909422, 1, 1, 1, 1, 1,
-1.810492, -1.346864, -2.31549, 1, 1, 1, 1, 1,
-1.80684, 0.7187432, 0.2370031, 1, 1, 1, 1, 1,
-1.804131, 2.109204, -0.3315836, 1, 1, 1, 1, 1,
-1.800233, 1.101509, -2.110028, 1, 1, 1, 1, 1,
-1.797728, -0.4068294, -2.978328, 1, 1, 1, 1, 1,
-1.765246, 2.216098, -1.269949, 1, 1, 1, 1, 1,
-1.762918, 0.2100629, -1.24969, 1, 1, 1, 1, 1,
-1.721649, 0.1146817, -2.338835, 1, 1, 1, 1, 1,
-1.713758, -0.1728424, -1.59744, 1, 1, 1, 1, 1,
-1.707837, 2.078707, -1.88149, 1, 1, 1, 1, 1,
-1.680578, 0.6621496, -0.5897912, 1, 1, 1, 1, 1,
-1.671799, 0.1762236, -1.308323, 1, 1, 1, 1, 1,
-1.669784, -0.3961786, -2.172067, 1, 1, 1, 1, 1,
-1.663036, 1.242152, -0.7366579, 1, 1, 1, 1, 1,
-1.656248, 0.03294262, 1.507332, 0, 0, 1, 1, 1,
-1.639828, -1.853167, -2.88755, 1, 0, 0, 1, 1,
-1.624222, 0.3520795, -1.302367, 1, 0, 0, 1, 1,
-1.615566, -1.021206, -2.007326, 1, 0, 0, 1, 1,
-1.580365, -0.1436968, -1.414825, 1, 0, 0, 1, 1,
-1.577509, -0.6966836, -1.49905, 1, 0, 0, 1, 1,
-1.576957, -0.4099322, -2.165471, 0, 0, 0, 1, 1,
-1.575709, -0.03310561, -1.791916, 0, 0, 0, 1, 1,
-1.557967, -1.442494, -4.372322, 0, 0, 0, 1, 1,
-1.551976, 0.6398529, -0.5379733, 0, 0, 0, 1, 1,
-1.547085, 1.152674, -0.7275012, 0, 0, 0, 1, 1,
-1.507074, -0.9713272, -2.828763, 0, 0, 0, 1, 1,
-1.505599, -2.581169, -2.354496, 0, 0, 0, 1, 1,
-1.500703, 0.3872686, -0.6950346, 1, 1, 1, 1, 1,
-1.481812, -0.3246777, -2.892663, 1, 1, 1, 1, 1,
-1.479926, 0.8691722, -0.3870996, 1, 1, 1, 1, 1,
-1.471899, 0.3087063, -1.116802, 1, 1, 1, 1, 1,
-1.468567, 1.139043, 0.03829389, 1, 1, 1, 1, 1,
-1.462709, -0.5780544, -0.8892725, 1, 1, 1, 1, 1,
-1.455972, -0.06609516, -1.719792, 1, 1, 1, 1, 1,
-1.446034, 1.679552, -1.439879, 1, 1, 1, 1, 1,
-1.44418, -0.452277, -1.347481, 1, 1, 1, 1, 1,
-1.438393, 1.019124, -0.5164821, 1, 1, 1, 1, 1,
-1.433011, 0.7598183, -0.3562652, 1, 1, 1, 1, 1,
-1.43026, 1.287943, -0.6318454, 1, 1, 1, 1, 1,
-1.409288, -1.189365, -0.9220686, 1, 1, 1, 1, 1,
-1.396716, 0.1894999, -0.1009572, 1, 1, 1, 1, 1,
-1.392672, -1.058734, -1.398263, 1, 1, 1, 1, 1,
-1.385582, 0.7487432, -0.3901545, 0, 0, 1, 1, 1,
-1.385262, 0.6839695, -0.3048221, 1, 0, 0, 1, 1,
-1.382928, 0.3235983, -2.770939, 1, 0, 0, 1, 1,
-1.378781, -0.4323904, -1.826807, 1, 0, 0, 1, 1,
-1.375829, -0.7073769, -3.042631, 1, 0, 0, 1, 1,
-1.373069, 2.893321, -0.7220108, 1, 0, 0, 1, 1,
-1.3704, -0.3387371, -0.5252902, 0, 0, 0, 1, 1,
-1.361885, -1.621429, -1.235241, 0, 0, 0, 1, 1,
-1.360269, -0.03597914, -1.463521, 0, 0, 0, 1, 1,
-1.358106, -1.257345, -1.351224, 0, 0, 0, 1, 1,
-1.356762, 1.074407, -1.857108, 0, 0, 0, 1, 1,
-1.353201, 0.3517093, -0.8705308, 0, 0, 0, 1, 1,
-1.343588, -0.4543332, -2.312787, 0, 0, 0, 1, 1,
-1.339921, -0.01620278, -1.578721, 1, 1, 1, 1, 1,
-1.339864, -1.882188, -3.204771, 1, 1, 1, 1, 1,
-1.330064, 0.3162472, -1.772477, 1, 1, 1, 1, 1,
-1.323121, 0.1866831, 1.462806, 1, 1, 1, 1, 1,
-1.318793, 0.1558533, -1.546053, 1, 1, 1, 1, 1,
-1.312054, 1.253056, -0.4566256, 1, 1, 1, 1, 1,
-1.306918, -0.1216324, -2.786767, 1, 1, 1, 1, 1,
-1.301154, -0.05613006, -3.711364, 1, 1, 1, 1, 1,
-1.291791, -0.6972005, -2.845604, 1, 1, 1, 1, 1,
-1.288877, -1.611496, -2.966768, 1, 1, 1, 1, 1,
-1.286957, 1.009448, -0.1433471, 1, 1, 1, 1, 1,
-1.281869, 0.4178733, -0.4633251, 1, 1, 1, 1, 1,
-1.25631, -1.117014, -0.6151335, 1, 1, 1, 1, 1,
-1.255399, 1.127605, -0.975575, 1, 1, 1, 1, 1,
-1.238882, -0.3585101, -2.230296, 1, 1, 1, 1, 1,
-1.23502, -1.284364, -2.510518, 0, 0, 1, 1, 1,
-1.22626, -0.2295819, -1.784407, 1, 0, 0, 1, 1,
-1.218456, -2.27202, -3.924985, 1, 0, 0, 1, 1,
-1.216034, -1.511209, -1.725459, 1, 0, 0, 1, 1,
-1.210858, -0.6844589, -1.619215, 1, 0, 0, 1, 1,
-1.204182, -0.5033103, -1.562579, 1, 0, 0, 1, 1,
-1.204073, -0.3396757, -1.179602, 0, 0, 0, 1, 1,
-1.19816, -0.6265448, -1.41058, 0, 0, 0, 1, 1,
-1.193334, -0.3914174, -1.405994, 0, 0, 0, 1, 1,
-1.184378, -1.003767, -3.408512, 0, 0, 0, 1, 1,
-1.174317, -0.4423321, -2.69014, 0, 0, 0, 1, 1,
-1.17029, -0.9779947, -4.606933, 0, 0, 0, 1, 1,
-1.167607, -0.2821959, -2.968197, 0, 0, 0, 1, 1,
-1.153444, 0.3522311, -0.7441961, 1, 1, 1, 1, 1,
-1.152602, -0.1096107, -3.289916, 1, 1, 1, 1, 1,
-1.151834, -0.6685188, -1.286074, 1, 1, 1, 1, 1,
-1.151764, 1.100719, 0.9195534, 1, 1, 1, 1, 1,
-1.150711, -1.617304, -2.800144, 1, 1, 1, 1, 1,
-1.148081, 0.1557206, -2.18194, 1, 1, 1, 1, 1,
-1.141937, -0.6094309, -3.739953, 1, 1, 1, 1, 1,
-1.140722, 0.5236778, -1.205455, 1, 1, 1, 1, 1,
-1.134919, 0.2554587, -0.04847858, 1, 1, 1, 1, 1,
-1.125661, 0.02437872, -2.656145, 1, 1, 1, 1, 1,
-1.119736, 0.3117656, -1.331145, 1, 1, 1, 1, 1,
-1.118608, -0.3100263, -1.184739, 1, 1, 1, 1, 1,
-1.114106, -0.7311338, -3.151591, 1, 1, 1, 1, 1,
-1.110546, -0.5073636, -2.080287, 1, 1, 1, 1, 1,
-1.101814, -0.1029524, -2.159723, 1, 1, 1, 1, 1,
-1.101128, -1.9863, -3.080493, 0, 0, 1, 1, 1,
-1.087274, 1.937143, -1.689692, 1, 0, 0, 1, 1,
-1.079562, -0.8746552, -0.5340332, 1, 0, 0, 1, 1,
-1.066934, -1.566008, -2.837576, 1, 0, 0, 1, 1,
-1.066631, -0.6942575, -2.517575, 1, 0, 0, 1, 1,
-1.056678, 0.7131996, -1.264048, 1, 0, 0, 1, 1,
-1.054332, -1.201603, -0.944179, 0, 0, 0, 1, 1,
-1.050328, 1.486014, -3.315191, 0, 0, 0, 1, 1,
-1.045251, 0.1733921, -1.91537, 0, 0, 0, 1, 1,
-1.03232, 1.458535, -0.3521583, 0, 0, 0, 1, 1,
-1.027763, 0.6052081, -3.289088, 0, 0, 0, 1, 1,
-1.015454, 0.03354701, -0.6183071, 0, 0, 0, 1, 1,
-1.003564, -0.6825504, -1.72563, 0, 0, 0, 1, 1,
-1.002303, -0.698613, -4.381676, 1, 1, 1, 1, 1,
-1.001966, 0.8934911, -0.07840676, 1, 1, 1, 1, 1,
-1.001353, 0.7098637, -0.01942743, 1, 1, 1, 1, 1,
-1.000295, 0.1244089, -3.827377, 1, 1, 1, 1, 1,
-0.9990342, 1.332351, -2.276425, 1, 1, 1, 1, 1,
-0.9908131, -0.4402868, -3.152451, 1, 1, 1, 1, 1,
-0.9865777, 0.2642506, 0.5659161, 1, 1, 1, 1, 1,
-0.9822596, 0.3712676, -1.930608, 1, 1, 1, 1, 1,
-0.9796679, 0.558031, -0.7502593, 1, 1, 1, 1, 1,
-0.9761498, 0.1144276, -1.829095, 1, 1, 1, 1, 1,
-0.974287, -0.8581285, -2.547318, 1, 1, 1, 1, 1,
-0.9741858, -1.762073, -2.438562, 1, 1, 1, 1, 1,
-0.9717196, -0.2504986, -0.3869253, 1, 1, 1, 1, 1,
-0.95202, 1.120787, -0.8623329, 1, 1, 1, 1, 1,
-0.9519497, -0.04791736, -1.24612, 1, 1, 1, 1, 1,
-0.9504778, 0.5807574, -0.532164, 0, 0, 1, 1, 1,
-0.9451954, -1.000402, -2.638119, 1, 0, 0, 1, 1,
-0.940362, -1.434746, -2.932156, 1, 0, 0, 1, 1,
-0.9380845, -0.4996126, -1.112327, 1, 0, 0, 1, 1,
-0.9349846, 0.2891744, -1.594701, 1, 0, 0, 1, 1,
-0.9306062, 0.7430748, -0.922654, 1, 0, 0, 1, 1,
-0.919012, -1.005638, -3.720313, 0, 0, 0, 1, 1,
-0.9113542, -1.501079, -3.337323, 0, 0, 0, 1, 1,
-0.9096522, -0.4012055, -3.020441, 0, 0, 0, 1, 1,
-0.9086654, -0.7141696, -1.387114, 0, 0, 0, 1, 1,
-0.9060727, 0.6876448, -1.670598, 0, 0, 0, 1, 1,
-0.9049419, -0.6458598, -2.41782, 0, 0, 0, 1, 1,
-0.8889303, 0.2077665, -1.57742, 0, 0, 0, 1, 1,
-0.8855566, 1.527532, -0.5815756, 1, 1, 1, 1, 1,
-0.8844684, -0.0990109, -1.422372, 1, 1, 1, 1, 1,
-0.8830015, -2.529069, -1.824867, 1, 1, 1, 1, 1,
-0.8825634, 1.09493, -0.04164953, 1, 1, 1, 1, 1,
-0.8699044, 0.2265063, -1.700854, 1, 1, 1, 1, 1,
-0.8654624, -0.2816512, -2.136369, 1, 1, 1, 1, 1,
-0.8551988, 0.2942628, -0.9681947, 1, 1, 1, 1, 1,
-0.846186, 0.9877388, -0.7495287, 1, 1, 1, 1, 1,
-0.8448969, -1.29641, -1.221274, 1, 1, 1, 1, 1,
-0.8441334, 2.572493, 0.6340485, 1, 1, 1, 1, 1,
-0.8436373, -0.8421894, -4.085882, 1, 1, 1, 1, 1,
-0.8309759, -0.1318348, -1.840034, 1, 1, 1, 1, 1,
-0.8255332, -1.417511, -1.8228, 1, 1, 1, 1, 1,
-0.8248119, 1.030825, 0.8365403, 1, 1, 1, 1, 1,
-0.820182, 1.322879, -0.09401257, 1, 1, 1, 1, 1,
-0.8194982, -1.140539, -1.787504, 0, 0, 1, 1, 1,
-0.8190093, -0.8486016, -2.71344, 1, 0, 0, 1, 1,
-0.8072037, 2.24234, -1.413125, 1, 0, 0, 1, 1,
-0.798833, 0.530172, 0.5042824, 1, 0, 0, 1, 1,
-0.798511, -1.074934, -3.750682, 1, 0, 0, 1, 1,
-0.789914, 2.690421, -2.217546, 1, 0, 0, 1, 1,
-0.7895157, 0.5516567, -1.780532, 0, 0, 0, 1, 1,
-0.7887886, 1.510364, -1.11454, 0, 0, 0, 1, 1,
-0.78577, -0.3833981, -2.799257, 0, 0, 0, 1, 1,
-0.77969, -1.843259, -3.126404, 0, 0, 0, 1, 1,
-0.7788886, 1.535452, -0.5639595, 0, 0, 0, 1, 1,
-0.7784783, -0.1392723, -1.897023, 0, 0, 0, 1, 1,
-0.7751731, -1.626783, -2.313357, 0, 0, 0, 1, 1,
-0.7692916, -0.2080544, -0.5126413, 1, 1, 1, 1, 1,
-0.7682546, -0.5034382, -2.047388, 1, 1, 1, 1, 1,
-0.7677839, 0.1357915, -2.016764, 1, 1, 1, 1, 1,
-0.7644396, -0.008492324, -0.9418436, 1, 1, 1, 1, 1,
-0.764279, -0.3281916, -2.129745, 1, 1, 1, 1, 1,
-0.7606524, -0.6666154, -2.161049, 1, 1, 1, 1, 1,
-0.7572803, 0.7946289, -1.292436, 1, 1, 1, 1, 1,
-0.7563422, 0.4180616, -2.092562, 1, 1, 1, 1, 1,
-0.756126, 0.3442252, -1.204273, 1, 1, 1, 1, 1,
-0.7497445, 0.954215, 1.566778, 1, 1, 1, 1, 1,
-0.7427024, 1.215174, -0.4585001, 1, 1, 1, 1, 1,
-0.7299812, -0.3276846, -3.886642, 1, 1, 1, 1, 1,
-0.7286606, -0.8456361, -2.34258, 1, 1, 1, 1, 1,
-0.7210473, -1.130081, -1.776786, 1, 1, 1, 1, 1,
-0.7138865, -1.900918, -1.408239, 1, 1, 1, 1, 1,
-0.7086533, 1.374947, -2.001947, 0, 0, 1, 1, 1,
-0.70811, 0.8182824, -1.18974, 1, 0, 0, 1, 1,
-0.7043107, -0.5094733, -2.96536, 1, 0, 0, 1, 1,
-0.7034107, 2.371189, 0.6399651, 1, 0, 0, 1, 1,
-0.6850096, -0.4574264, -2.952007, 1, 0, 0, 1, 1,
-0.6843604, 0.1200943, -2.581815, 1, 0, 0, 1, 1,
-0.684158, -1.092487, -2.47275, 0, 0, 0, 1, 1,
-0.6814715, 0.006782289, -1.237724, 0, 0, 0, 1, 1,
-0.6805918, -0.785188, -1.612665, 0, 0, 0, 1, 1,
-0.6772844, 0.1188652, -1.713478, 0, 0, 0, 1, 1,
-0.6740969, 0.6854392, -0.2369272, 0, 0, 0, 1, 1,
-0.668636, 0.353742, -1.358032, 0, 0, 0, 1, 1,
-0.6639448, -0.4618904, -1.469317, 0, 0, 0, 1, 1,
-0.6627828, -0.7617245, -3.008763, 1, 1, 1, 1, 1,
-0.6592914, -0.5249844, -3.001968, 1, 1, 1, 1, 1,
-0.6535846, 0.6754079, 0.4812804, 1, 1, 1, 1, 1,
-0.6533048, -0.5781393, -2.723616, 1, 1, 1, 1, 1,
-0.6508206, 0.2800503, -0.0766298, 1, 1, 1, 1, 1,
-0.6486965, -1.034075, -3.370912, 1, 1, 1, 1, 1,
-0.6436976, -1.965552, -3.886988, 1, 1, 1, 1, 1,
-0.6416907, -1.69927, -2.576886, 1, 1, 1, 1, 1,
-0.637134, 1.350832, 0.9323688, 1, 1, 1, 1, 1,
-0.6301845, -0.2682851, -2.169549, 1, 1, 1, 1, 1,
-0.6241283, 1.01218, -1.501776, 1, 1, 1, 1, 1,
-0.6203588, -0.6733471, -2.909277, 1, 1, 1, 1, 1,
-0.619046, 1.296556, -1.041723, 1, 1, 1, 1, 1,
-0.5919926, 1.692863, 0.5015054, 1, 1, 1, 1, 1,
-0.5910546, 0.3198207, 0.7080998, 1, 1, 1, 1, 1,
-0.5850965, 0.4481476, -1.49048, 0, 0, 1, 1, 1,
-0.5829604, -0.2920069, -1.075048, 1, 0, 0, 1, 1,
-0.5826606, 0.53346, -1.412634, 1, 0, 0, 1, 1,
-0.5780085, -0.4776398, -1.414621, 1, 0, 0, 1, 1,
-0.5753495, 0.6059116, -2.321388, 1, 0, 0, 1, 1,
-0.5696776, 1.684272, -1.011658, 1, 0, 0, 1, 1,
-0.5672599, -0.5635524, -0.7030389, 0, 0, 0, 1, 1,
-0.5630876, -1.421872, -2.307301, 0, 0, 0, 1, 1,
-0.5595316, -0.03357995, -0.1094833, 0, 0, 0, 1, 1,
-0.5569511, -0.9140648, -3.521143, 0, 0, 0, 1, 1,
-0.5566353, 1.102286, -0.2773347, 0, 0, 0, 1, 1,
-0.5564435, 0.158943, -0.9864793, 0, 0, 0, 1, 1,
-0.5564422, -0.3531637, -4.16884, 0, 0, 0, 1, 1,
-0.5561554, 1.083776, -0.475446, 1, 1, 1, 1, 1,
-0.5450687, -0.4224993, -2.008155, 1, 1, 1, 1, 1,
-0.5448961, 0.8793141, -1.040805, 1, 1, 1, 1, 1,
-0.5420452, 1.133393, -0.7222711, 1, 1, 1, 1, 1,
-0.5410895, -0.5827965, -3.602231, 1, 1, 1, 1, 1,
-0.5382253, -0.8787962, -1.862791, 1, 1, 1, 1, 1,
-0.5364552, 0.4351601, -1.46213, 1, 1, 1, 1, 1,
-0.5319238, -0.0386012, -1.686343, 1, 1, 1, 1, 1,
-0.5315495, 0.5061085, 0.8987074, 1, 1, 1, 1, 1,
-0.5311242, -0.1311454, -3.383179, 1, 1, 1, 1, 1,
-0.5306832, 0.5592963, -1.409552, 1, 1, 1, 1, 1,
-0.530381, -0.3835624, -2.636471, 1, 1, 1, 1, 1,
-0.5096433, 0.4824458, 0.7103134, 1, 1, 1, 1, 1,
-0.5040056, 1.352629, 0.6816748, 1, 1, 1, 1, 1,
-0.5037047, -1.752466, -3.374645, 1, 1, 1, 1, 1,
-0.5008958, -2.695338, -1.728356, 0, 0, 1, 1, 1,
-0.5001901, 1.265094, 0.9705015, 1, 0, 0, 1, 1,
-0.4930296, 0.05035081, -1.379423, 1, 0, 0, 1, 1,
-0.4907984, -0.2317686, -3.430273, 1, 0, 0, 1, 1,
-0.4849425, -0.1305848, -2.919919, 1, 0, 0, 1, 1,
-0.4818861, 0.1017217, -2.000879, 1, 0, 0, 1, 1,
-0.4804799, 0.3127077, -1.254718, 0, 0, 0, 1, 1,
-0.4780281, 0.1632126, -0.9174037, 0, 0, 0, 1, 1,
-0.4768808, -0.3847311, -3.220265, 0, 0, 0, 1, 1,
-0.4768613, 0.1076258, -1.358348, 0, 0, 0, 1, 1,
-0.470773, -2.952915, -2.49773, 0, 0, 0, 1, 1,
-0.4656634, 0.9660447, -0.7561111, 0, 0, 0, 1, 1,
-0.4643056, -0.9068328, -2.080394, 0, 0, 0, 1, 1,
-0.4590404, -0.7926783, -2.495435, 1, 1, 1, 1, 1,
-0.4585643, 0.0568533, -1.009879, 1, 1, 1, 1, 1,
-0.4547908, 0.9880546, -0.06442307, 1, 1, 1, 1, 1,
-0.4530224, -1.055236, -3.864899, 1, 1, 1, 1, 1,
-0.4471083, -2.840942, -2.591549, 1, 1, 1, 1, 1,
-0.4465642, 0.02970782, -1.38029, 1, 1, 1, 1, 1,
-0.4417756, -2.667927, -3.38482, 1, 1, 1, 1, 1,
-0.4388053, -0.00934221, -3.335597, 1, 1, 1, 1, 1,
-0.4382985, 0.514123, 0.1856214, 1, 1, 1, 1, 1,
-0.4367922, 0.4516477, 0.1542696, 1, 1, 1, 1, 1,
-0.4319511, 1.081023, -1.522836, 1, 1, 1, 1, 1,
-0.4316936, -0.09465969, -1.318312, 1, 1, 1, 1, 1,
-0.4301567, 0.1896398, -2.801477, 1, 1, 1, 1, 1,
-0.4295763, -0.7025589, -1.359637, 1, 1, 1, 1, 1,
-0.4258917, -0.1829548, -2.04562, 1, 1, 1, 1, 1,
-0.4246445, -0.9399318, -3.187128, 0, 0, 1, 1, 1,
-0.4210748, -0.2146449, -2.99499, 1, 0, 0, 1, 1,
-0.420586, 0.2603548, -1.141311, 1, 0, 0, 1, 1,
-0.4189934, -0.3222669, -2.771563, 1, 0, 0, 1, 1,
-0.4172568, 1.685563, 0.02294927, 1, 0, 0, 1, 1,
-0.412365, -1.355051, -1.762359, 1, 0, 0, 1, 1,
-0.4121395, 0.6561633, -1.851512, 0, 0, 0, 1, 1,
-0.4114596, 1.576757, 0.6142844, 0, 0, 0, 1, 1,
-0.410494, -0.2647159, -3.333551, 0, 0, 0, 1, 1,
-0.4052373, -0.8343362, -3.060933, 0, 0, 0, 1, 1,
-0.4002918, 1.20048, -1.550239, 0, 0, 0, 1, 1,
-0.3954496, -0.5319486, -2.032199, 0, 0, 0, 1, 1,
-0.3943523, 0.1628761, -1.004231, 0, 0, 0, 1, 1,
-0.3926325, 0.1285923, -1.079966, 1, 1, 1, 1, 1,
-0.3907145, 1.099249, -0.4539244, 1, 1, 1, 1, 1,
-0.390303, 1.898446, -0.1242341, 1, 1, 1, 1, 1,
-0.3895302, 1.446989, 0.6441419, 1, 1, 1, 1, 1,
-0.3894795, 0.1974152, -1.070156, 1, 1, 1, 1, 1,
-0.3882723, -0.9603038, -3.355891, 1, 1, 1, 1, 1,
-0.3842672, -1.78819, -1.70725, 1, 1, 1, 1, 1,
-0.381516, 1.540997, 0.2333703, 1, 1, 1, 1, 1,
-0.3804688, -0.112716, -1.211645, 1, 1, 1, 1, 1,
-0.3781791, 0.187683, -0.9173923, 1, 1, 1, 1, 1,
-0.3691714, 0.4925931, -1.068218, 1, 1, 1, 1, 1,
-0.3684784, -0.5045353, -2.289726, 1, 1, 1, 1, 1,
-0.3597276, 0.3807819, -1.931622, 1, 1, 1, 1, 1,
-0.3469948, 2.481437, 0.7157347, 1, 1, 1, 1, 1,
-0.346735, 0.6487113, -2.047959, 1, 1, 1, 1, 1,
-0.3461247, 0.4237614, -0.5511311, 0, 0, 1, 1, 1,
-0.3457745, -0.5079072, -2.517049, 1, 0, 0, 1, 1,
-0.3446548, 1.406875, 0.3809833, 1, 0, 0, 1, 1,
-0.3443464, -0.3769286, -1.557051, 1, 0, 0, 1, 1,
-0.3400189, -0.03842808, -1.207843, 1, 0, 0, 1, 1,
-0.3395293, -1.125215, -2.385076, 1, 0, 0, 1, 1,
-0.3395199, 1.605499, -0.7647606, 0, 0, 0, 1, 1,
-0.3359994, 0.3564241, -1.505015, 0, 0, 0, 1, 1,
-0.3357549, 0.7136366, -0.9505206, 0, 0, 0, 1, 1,
-0.335675, -0.1909248, -2.351044, 0, 0, 0, 1, 1,
-0.3340455, 0.7611141, -0.9425581, 0, 0, 0, 1, 1,
-0.3338169, -0.3019189, -1.241541, 0, 0, 0, 1, 1,
-0.3337221, 0.1006112, -0.1628022, 0, 0, 0, 1, 1,
-0.3261016, -0.9746841, -1.949283, 1, 1, 1, 1, 1,
-0.3254545, -0.1592001, -3.054557, 1, 1, 1, 1, 1,
-0.324877, -0.7163972, -2.743934, 1, 1, 1, 1, 1,
-0.3239994, 1.981715, -0.5649062, 1, 1, 1, 1, 1,
-0.3233744, 0.6235429, -1.273042, 1, 1, 1, 1, 1,
-0.3203717, 1.846435, 0.4188534, 1, 1, 1, 1, 1,
-0.3171458, 0.5350745, 0.2437578, 1, 1, 1, 1, 1,
-0.3129876, -0.8219683, -2.422915, 1, 1, 1, 1, 1,
-0.3117727, -0.1420461, -1.707765, 1, 1, 1, 1, 1,
-0.3056149, -0.3434828, -2.212931, 1, 1, 1, 1, 1,
-0.3049371, 0.1957168, -2.281056, 1, 1, 1, 1, 1,
-0.3045815, 0.01226128, -2.469681, 1, 1, 1, 1, 1,
-0.2969027, -0.1133261, -1.014732, 1, 1, 1, 1, 1,
-0.2968668, -2.195832, -1.207218, 1, 1, 1, 1, 1,
-0.2965657, 0.9938003, 0.2538483, 1, 1, 1, 1, 1,
-0.2932823, -2.014167, -2.259507, 0, 0, 1, 1, 1,
-0.292197, 0.7762154, -2.105246, 1, 0, 0, 1, 1,
-0.2882469, 0.5376945, -2.70583, 1, 0, 0, 1, 1,
-0.287409, -0.7250965, -3.504858, 1, 0, 0, 1, 1,
-0.2784476, -0.3773745, -1.465018, 1, 0, 0, 1, 1,
-0.2774611, -0.797323, -2.822501, 1, 0, 0, 1, 1,
-0.2758034, -0.3313629, -3.545711, 0, 0, 0, 1, 1,
-0.2717478, -0.8948945, -0.8609514, 0, 0, 0, 1, 1,
-0.2695935, -0.888248, -3.110729, 0, 0, 0, 1, 1,
-0.2687816, 0.7149388, -0.1870928, 0, 0, 0, 1, 1,
-0.2685729, 0.7977796, -0.1436792, 0, 0, 0, 1, 1,
-0.2656022, -0.5584455, -2.379849, 0, 0, 0, 1, 1,
-0.2647637, 0.3562075, -1.516615, 0, 0, 0, 1, 1,
-0.2632764, 0.6134402, -0.6948729, 1, 1, 1, 1, 1,
-0.2601027, 0.6145214, -0.265089, 1, 1, 1, 1, 1,
-0.2586912, -0.2625145, -1.307559, 1, 1, 1, 1, 1,
-0.2575213, 1.810089, 1.911144, 1, 1, 1, 1, 1,
-0.2574668, 0.3108808, -1.338081, 1, 1, 1, 1, 1,
-0.2566162, 0.9079061, -0.9645109, 1, 1, 1, 1, 1,
-0.2553428, -0.3404062, -0.4779328, 1, 1, 1, 1, 1,
-0.2521354, 0.6352385, 0.6538015, 1, 1, 1, 1, 1,
-0.2497053, -1.237678, -3.359318, 1, 1, 1, 1, 1,
-0.2484986, -2.705059, -3.198643, 1, 1, 1, 1, 1,
-0.2470569, 0.8272315, -2.167671, 1, 1, 1, 1, 1,
-0.2439424, -0.6633666, -1.443255, 1, 1, 1, 1, 1,
-0.2389816, 1.971723, 0.4639862, 1, 1, 1, 1, 1,
-0.2382157, 0.4559411, 0.1026983, 1, 1, 1, 1, 1,
-0.2368984, -0.09753581, -1.777716, 1, 1, 1, 1, 1,
-0.2364085, 0.3766381, 0.6323181, 0, 0, 1, 1, 1,
-0.2344782, -0.1370792, -0.7977302, 1, 0, 0, 1, 1,
-0.2292585, 0.3886085, -1.577067, 1, 0, 0, 1, 1,
-0.2269549, 0.5588587, -0.4291742, 1, 0, 0, 1, 1,
-0.219865, -0.1303117, -1.877957, 1, 0, 0, 1, 1,
-0.2184649, -0.816328, -1.383413, 1, 0, 0, 1, 1,
-0.2176959, -1.270005, -4.24006, 0, 0, 0, 1, 1,
-0.2120971, -1.985832, -2.71352, 0, 0, 0, 1, 1,
-0.2118004, -0.4533083, -1.718732, 0, 0, 0, 1, 1,
-0.1955337, 2.068131, 0.429929, 0, 0, 0, 1, 1,
-0.1949183, 0.5111443, -0.2267896, 0, 0, 0, 1, 1,
-0.1894672, 0.393695, -0.9311982, 0, 0, 0, 1, 1,
-0.1884952, -1.093907, -3.661071, 0, 0, 0, 1, 1,
-0.1882784, 0.04229627, -1.274222, 1, 1, 1, 1, 1,
-0.1869101, 0.1632215, -1.58458, 1, 1, 1, 1, 1,
-0.1840491, 1.832439, 0.7214556, 1, 1, 1, 1, 1,
-0.1837183, 0.4671226, -1.585741, 1, 1, 1, 1, 1,
-0.1833746, -0.7691715, -4.287969, 1, 1, 1, 1, 1,
-0.1796655, -1.179485, -4.076864, 1, 1, 1, 1, 1,
-0.179067, -0.09654766, -2.957972, 1, 1, 1, 1, 1,
-0.1782943, 0.431534, -1.682228, 1, 1, 1, 1, 1,
-0.1763494, 0.8875672, -0.6054347, 1, 1, 1, 1, 1,
-0.1752222, -0.7959054, -2.175879, 1, 1, 1, 1, 1,
-0.1746769, -0.5337461, -2.420454, 1, 1, 1, 1, 1,
-0.1718186, -0.4163454, -5.070941, 1, 1, 1, 1, 1,
-0.1707105, -1.562601, -4.170769, 1, 1, 1, 1, 1,
-0.1705404, 0.8131003, 0.1016406, 1, 1, 1, 1, 1,
-0.1629936, 0.5058668, 0.7600247, 1, 1, 1, 1, 1,
-0.1603996, -1.339124, -1.719426, 0, 0, 1, 1, 1,
-0.1535511, 0.7338042, -0.4838553, 1, 0, 0, 1, 1,
-0.1497584, 0.04210389, -1.960009, 1, 0, 0, 1, 1,
-0.1471191, -3.163796, -1.237348, 1, 0, 0, 1, 1,
-0.1464251, 0.121709, -0.1967841, 1, 0, 0, 1, 1,
-0.1452958, 0.7087439, -0.79129, 1, 0, 0, 1, 1,
-0.1451757, 0.04006571, 1.555835, 0, 0, 0, 1, 1,
-0.1434012, -0.7725745, -4.299078, 0, 0, 0, 1, 1,
-0.143389, -0.9724129, -2.877545, 0, 0, 0, 1, 1,
-0.1364477, -0.2571437, -0.991222, 0, 0, 0, 1, 1,
-0.1362544, -0.9764759, -1.140648, 0, 0, 0, 1, 1,
-0.1343938, -0.9097008, -3.00253, 0, 0, 0, 1, 1,
-0.13403, -0.219955, -2.335547, 0, 0, 0, 1, 1,
-0.1323434, 0.02541467, -2.636149, 1, 1, 1, 1, 1,
-0.1268446, 0.3175129, -0.9602448, 1, 1, 1, 1, 1,
-0.1260023, -0.5335182, -3.391958, 1, 1, 1, 1, 1,
-0.1252527, -0.4937936, -2.976158, 1, 1, 1, 1, 1,
-0.1190934, -0.3033052, -2.95237, 1, 1, 1, 1, 1,
-0.1164111, 1.670153, -2.310242, 1, 1, 1, 1, 1,
-0.1124, -1.855803, -2.212282, 1, 1, 1, 1, 1,
-0.1085704, -0.3190615, -4.532333, 1, 1, 1, 1, 1,
-0.1077574, -0.445361, -2.66504, 1, 1, 1, 1, 1,
-0.1066971, 0.01907095, -1.672478, 1, 1, 1, 1, 1,
-0.1029723, 1.44245, -1.270344, 1, 1, 1, 1, 1,
-0.1029616, -0.1929917, -4.215146, 1, 1, 1, 1, 1,
-0.1019469, 0.01206144, -3.690373, 1, 1, 1, 1, 1,
-0.1013569, 0.08618315, -2.064734, 1, 1, 1, 1, 1,
-0.09594353, -0.3086435, -2.686544, 1, 1, 1, 1, 1,
-0.08970206, 1.190736, -0.2095099, 0, 0, 1, 1, 1,
-0.08900008, 0.3950982, 0.8333851, 1, 0, 0, 1, 1,
-0.08745309, -0.2588502, -2.000154, 1, 0, 0, 1, 1,
-0.08654318, -0.440501, -3.824537, 1, 0, 0, 1, 1,
-0.07787979, 0.1813641, -0.6521478, 1, 0, 0, 1, 1,
-0.07734882, 0.629401, 0.7842512, 1, 0, 0, 1, 1,
-0.07691273, 0.01385693, -2.205071, 0, 0, 0, 1, 1,
-0.07177576, -0.9681978, -3.15971, 0, 0, 0, 1, 1,
-0.07143647, -0.2560562, -3.486438, 0, 0, 0, 1, 1,
-0.06978718, -1.167142, -3.128879, 0, 0, 0, 1, 1,
-0.06503501, -2.177956, -4.355327, 0, 0, 0, 1, 1,
-0.06496185, 0.1716151, 0.5317087, 0, 0, 0, 1, 1,
-0.06298243, -0.4222972, -1.863661, 0, 0, 0, 1, 1,
-0.06114014, -0.6157915, -2.833665, 1, 1, 1, 1, 1,
-0.06042289, -1.4479, -3.711934, 1, 1, 1, 1, 1,
-0.05936754, 1.439027, -0.2998462, 1, 1, 1, 1, 1,
-0.05813193, -0.5897431, -3.929429, 1, 1, 1, 1, 1,
-0.05611758, 1.059665, 1.370584, 1, 1, 1, 1, 1,
-0.05567216, -0.4301032, -2.56825, 1, 1, 1, 1, 1,
-0.05121743, -0.8086081, -3.793718, 1, 1, 1, 1, 1,
-0.04934774, 0.1696527, 1.110391, 1, 1, 1, 1, 1,
-0.04921068, -0.3556159, -2.634824, 1, 1, 1, 1, 1,
-0.04806066, -0.7539698, -2.592745, 1, 1, 1, 1, 1,
-0.0467574, 0.06468529, -0.5038559, 1, 1, 1, 1, 1,
-0.04563613, 0.1537716, -2.292587, 1, 1, 1, 1, 1,
-0.04519913, 0.09485874, -2.041729, 1, 1, 1, 1, 1,
-0.04211881, -1.472028, -2.886642, 1, 1, 1, 1, 1,
-0.03856242, -0.1130042, -1.601807, 1, 1, 1, 1, 1,
-0.03571671, -2.34361, -3.007565, 0, 0, 1, 1, 1,
-0.03546239, -1.314602, -4.887036, 1, 0, 0, 1, 1,
-0.03499731, -0.6905173, -1.587679, 1, 0, 0, 1, 1,
-0.03276782, 0.7542599, -1.522529, 1, 0, 0, 1, 1,
-0.03173352, -1.802191, -2.870489, 1, 0, 0, 1, 1,
-0.03064504, 0.1959304, -0.42309, 1, 0, 0, 1, 1,
-0.0280361, 1.717898, 0.6124128, 0, 0, 0, 1, 1,
-0.02755507, 0.8454437, -1.381878, 0, 0, 0, 1, 1,
-0.02684727, -0.2316505, -3.472381, 0, 0, 0, 1, 1,
-0.02205796, -0.2856011, -4.038054, 0, 0, 0, 1, 1,
-0.02058439, -0.3329411, -1.838294, 0, 0, 0, 1, 1,
-0.01939521, 0.2349961, 0.5287729, 0, 0, 0, 1, 1,
-0.0188638, 2.105744, -0.93688, 0, 0, 0, 1, 1,
-0.01405516, -0.6798959, -2.979748, 1, 1, 1, 1, 1,
-0.01376595, -0.8451918, -4.530119, 1, 1, 1, 1, 1,
-0.009632898, 0.5278791, -1.1487, 1, 1, 1, 1, 1,
-0.009480019, -0.8546821, -3.692456, 1, 1, 1, 1, 1,
-0.006162695, 0.8448324, -0.7609363, 1, 1, 1, 1, 1,
-0.004675894, -0.5517384, -3.170064, 1, 1, 1, 1, 1,
-0.003513599, -0.1075422, -3.883989, 1, 1, 1, 1, 1,
-0.001895093, 1.58312, -0.2944246, 1, 1, 1, 1, 1,
0.001943267, -1.507385, 3.350332, 1, 1, 1, 1, 1,
0.00516479, -0.006616601, 2.126816, 1, 1, 1, 1, 1,
0.007289566, -0.6452369, 2.328557, 1, 1, 1, 1, 1,
0.007587927, 1.386425, -0.25532, 1, 1, 1, 1, 1,
0.007649775, -0.1817247, 2.172037, 1, 1, 1, 1, 1,
0.008358883, 1.494135, 0.1246505, 1, 1, 1, 1, 1,
0.00959658, -1.003067, 1.545375, 1, 1, 1, 1, 1,
0.009721906, -0.5199575, 3.613917, 0, 0, 1, 1, 1,
0.009762541, -0.65807, 2.352429, 1, 0, 0, 1, 1,
0.01044364, 2.063501, 0.04740866, 1, 0, 0, 1, 1,
0.01177159, 0.3244792, 1.545266, 1, 0, 0, 1, 1,
0.01201153, 1.661179, 2.659159, 1, 0, 0, 1, 1,
0.0134046, -0.2233731, 2.500257, 1, 0, 0, 1, 1,
0.01379658, -1.010042, 4.718475, 0, 0, 0, 1, 1,
0.01410949, 1.654049, 0.2651654, 0, 0, 0, 1, 1,
0.01419174, 1.301028, 1.030543, 0, 0, 0, 1, 1,
0.01487813, -0.5420227, 2.234804, 0, 0, 0, 1, 1,
0.01953759, -0.3064872, 2.438244, 0, 0, 0, 1, 1,
0.02027671, -0.5479876, 2.784242, 0, 0, 0, 1, 1,
0.02236286, -0.4041672, 4.341177, 0, 0, 0, 1, 1,
0.02490125, -0.4319825, 1.589114, 1, 1, 1, 1, 1,
0.02590243, -0.5896812, 2.951228, 1, 1, 1, 1, 1,
0.02806148, -0.8618286, 2.970004, 1, 1, 1, 1, 1,
0.03003549, 1.093993, 2.009219, 1, 1, 1, 1, 1,
0.03094623, -1.289867, 4.333981, 1, 1, 1, 1, 1,
0.03785925, 0.8478968, -0.3170383, 1, 1, 1, 1, 1,
0.04596766, -0.7053276, 4.063155, 1, 1, 1, 1, 1,
0.04872983, 0.8815297, -0.08444792, 1, 1, 1, 1, 1,
0.04909325, 0.8446408, -0.9754111, 1, 1, 1, 1, 1,
0.05010002, -1.693793, 2.578979, 1, 1, 1, 1, 1,
0.05739204, 0.1087592, 0.7112242, 1, 1, 1, 1, 1,
0.06144402, 0.8446223, -0.5863369, 1, 1, 1, 1, 1,
0.06556473, -1.321122, 3.060885, 1, 1, 1, 1, 1,
0.07664147, 0.7955051, -1.098635, 1, 1, 1, 1, 1,
0.07800353, 0.5936196, 0.9679333, 1, 1, 1, 1, 1,
0.07870392, -1.063475, 3.222397, 0, 0, 1, 1, 1,
0.07917365, -0.9960257, 1.203864, 1, 0, 0, 1, 1,
0.08136234, -1.085597, 3.761407, 1, 0, 0, 1, 1,
0.0885321, -3.022325, 2.418022, 1, 0, 0, 1, 1,
0.09233255, 1.618928, 1.479871, 1, 0, 0, 1, 1,
0.09247788, -1.610807, 1.171799, 1, 0, 0, 1, 1,
0.09733628, -0.1860079, 2.537642, 0, 0, 0, 1, 1,
0.09887081, 0.3236743, 0.7427266, 0, 0, 0, 1, 1,
0.1019496, 1.805789, 0.3849684, 0, 0, 0, 1, 1,
0.1045923, 0.9414555, -0.6791429, 0, 0, 0, 1, 1,
0.104977, 0.871002, 1.153682, 0, 0, 0, 1, 1,
0.10751, -1.853066, 2.930202, 0, 0, 0, 1, 1,
0.1090408, 0.3340339, 0.7372457, 0, 0, 0, 1, 1,
0.1091468, 0.1805831, 0.3770169, 1, 1, 1, 1, 1,
0.1092237, -0.1921125, 3.643475, 1, 1, 1, 1, 1,
0.1121532, -0.1894632, 2.128501, 1, 1, 1, 1, 1,
0.1148355, -1.894879, 1.261136, 1, 1, 1, 1, 1,
0.118294, 1.269853, 1.988628, 1, 1, 1, 1, 1,
0.1197725, 0.1930075, 0.3040915, 1, 1, 1, 1, 1,
0.1198443, -0.5007469, 3.833321, 1, 1, 1, 1, 1,
0.1205145, -0.524875, 1.764686, 1, 1, 1, 1, 1,
0.1222314, 2.248745, -0.6455271, 1, 1, 1, 1, 1,
0.1226372, -1.394597, 1.236874, 1, 1, 1, 1, 1,
0.122993, 0.8178515, 1.134736, 1, 1, 1, 1, 1,
0.1263479, -1.240132, 1.746244, 1, 1, 1, 1, 1,
0.1266153, 0.5566835, -0.4107682, 1, 1, 1, 1, 1,
0.1277679, 0.6937125, -1.124445, 1, 1, 1, 1, 1,
0.1297198, 1.08923, -0.6037481, 1, 1, 1, 1, 1,
0.1350001, -0.2572923, 3.398143, 0, 0, 1, 1, 1,
0.1374661, 0.4015251, 1.303174, 1, 0, 0, 1, 1,
0.1395666, 0.4048803, -0.9005739, 1, 0, 0, 1, 1,
0.1501864, 0.4330021, 0.2139461, 1, 0, 0, 1, 1,
0.1529676, -1.536716, 3.705682, 1, 0, 0, 1, 1,
0.1577566, -0.7040198, 3.670673, 1, 0, 0, 1, 1,
0.1598037, 0.3816709, -0.7256504, 0, 0, 0, 1, 1,
0.1599055, -0.9447995, 1.866202, 0, 0, 0, 1, 1,
0.1607246, -0.6369486, 1.857368, 0, 0, 0, 1, 1,
0.1634004, 0.5187274, 2.632289, 0, 0, 0, 1, 1,
0.1657065, -0.0849943, 0.8963932, 0, 0, 0, 1, 1,
0.1693921, -1.053164, 2.013205, 0, 0, 0, 1, 1,
0.1696945, -0.1506289, 0.2321191, 0, 0, 0, 1, 1,
0.1751341, 0.02101924, -0.5703152, 1, 1, 1, 1, 1,
0.1755346, -1.912138, 4.934752, 1, 1, 1, 1, 1,
0.1762445, -0.06612153, 2.008199, 1, 1, 1, 1, 1,
0.1828152, 0.6043653, 0.7764471, 1, 1, 1, 1, 1,
0.1898643, 1.240283, -0.6843482, 1, 1, 1, 1, 1,
0.1906473, 0.1103464, 0.9868348, 1, 1, 1, 1, 1,
0.1976155, 0.001369907, 1.081763, 1, 1, 1, 1, 1,
0.197621, -1.331951, 3.471406, 1, 1, 1, 1, 1,
0.2000346, -1.09794, 1.716197, 1, 1, 1, 1, 1,
0.2009562, 1.097184, -0.2401069, 1, 1, 1, 1, 1,
0.2013093, 2.213718, -0.2241664, 1, 1, 1, 1, 1,
0.2034553, -0.684487, 3.950881, 1, 1, 1, 1, 1,
0.2053638, -0.9933938, 4.220016, 1, 1, 1, 1, 1,
0.2126939, -0.1588027, 2.145202, 1, 1, 1, 1, 1,
0.2137437, 0.04365684, -0.2417194, 1, 1, 1, 1, 1,
0.2152538, -0.4394884, 1.339564, 0, 0, 1, 1, 1,
0.2214894, 2.468708, -0.6598189, 1, 0, 0, 1, 1,
0.227297, -0.8098032, 2.893645, 1, 0, 0, 1, 1,
0.2273694, -0.3568923, 2.738528, 1, 0, 0, 1, 1,
0.2338355, 0.984839, 0.6782432, 1, 0, 0, 1, 1,
0.2340592, -2.050418, 2.07658, 1, 0, 0, 1, 1,
0.2347198, 0.7323479, 1.656171, 0, 0, 0, 1, 1,
0.2354541, -0.7947168, 2.469748, 0, 0, 0, 1, 1,
0.2356039, -0.321767, 2.58615, 0, 0, 0, 1, 1,
0.2455739, 0.09722488, 0.5751757, 0, 0, 0, 1, 1,
0.2486638, 0.9791636, 0.2990011, 0, 0, 0, 1, 1,
0.2534585, 0.8284311, 0.4850408, 0, 0, 0, 1, 1,
0.2542977, -0.2279311, 1.207305, 0, 0, 0, 1, 1,
0.2584003, 0.1146679, 0.02402131, 1, 1, 1, 1, 1,
0.2595695, -0.1583838, 3.031372, 1, 1, 1, 1, 1,
0.2638173, 0.6701236, 0.1395227, 1, 1, 1, 1, 1,
0.2652415, -0.6205022, 2.558632, 1, 1, 1, 1, 1,
0.2665974, -0.3198078, 4.154071, 1, 1, 1, 1, 1,
0.2674797, 0.3812902, 0.2103374, 1, 1, 1, 1, 1,
0.2693348, 0.7747973, -1.530724, 1, 1, 1, 1, 1,
0.2704524, -0.7089309, 3.324947, 1, 1, 1, 1, 1,
0.2803921, 1.307778, 1.394986, 1, 1, 1, 1, 1,
0.2810891, -1.411533, 4.111092, 1, 1, 1, 1, 1,
0.2811177, 0.3941756, 1.339697, 1, 1, 1, 1, 1,
0.2856306, -1.63967, 3.575819, 1, 1, 1, 1, 1,
0.2881556, 1.147579, 1.020249, 1, 1, 1, 1, 1,
0.2947272, 0.1487644, 1.027895, 1, 1, 1, 1, 1,
0.297898, 2.433118, -0.1344479, 1, 1, 1, 1, 1,
0.2992335, -0.4699286, 2.471869, 0, 0, 1, 1, 1,
0.2998205, -0.09540874, 1.304187, 1, 0, 0, 1, 1,
0.3026769, -0.7217407, 3.108957, 1, 0, 0, 1, 1,
0.3156983, 0.7549684, 0.9890579, 1, 0, 0, 1, 1,
0.3186874, -0.07704235, 0.7564617, 1, 0, 0, 1, 1,
0.3242717, -0.9489366, 4.00285, 1, 0, 0, 1, 1,
0.3261584, -0.3750258, 1.776627, 0, 0, 0, 1, 1,
0.3263741, -2.131078, 2.37573, 0, 0, 0, 1, 1,
0.3277013, 1.247749, 0.4682043, 0, 0, 0, 1, 1,
0.3280088, -1.81832, 3.639689, 0, 0, 0, 1, 1,
0.3302737, 0.5329294, 0.3774797, 0, 0, 0, 1, 1,
0.3316232, 0.1749739, 0.1444208, 0, 0, 0, 1, 1,
0.3339312, 0.7355744, 0.8450075, 0, 0, 0, 1, 1,
0.334078, -1.324697, 2.413426, 1, 1, 1, 1, 1,
0.3363869, -0.6307021, 2.486276, 1, 1, 1, 1, 1,
0.3368921, 0.1814103, 0.9120019, 1, 1, 1, 1, 1,
0.3380969, -1.120217, 2.140476, 1, 1, 1, 1, 1,
0.3398029, 0.00855491, 1.734977, 1, 1, 1, 1, 1,
0.3429215, 0.1207891, 1.961989, 1, 1, 1, 1, 1,
0.3439438, -0.3706226, 1.254877, 1, 1, 1, 1, 1,
0.3464699, -0.5011463, 3.91783, 1, 1, 1, 1, 1,
0.3467675, 0.8984336, -0.03241147, 1, 1, 1, 1, 1,
0.3487203, 1.197917, 0.407346, 1, 1, 1, 1, 1,
0.3513293, -0.06237414, 1.300129, 1, 1, 1, 1, 1,
0.3528177, 0.9889067, 1.133328, 1, 1, 1, 1, 1,
0.356986, -1.098276, 3.376876, 1, 1, 1, 1, 1,
0.357232, -2.125201, 2.205489, 1, 1, 1, 1, 1,
0.359627, -0.4136847, 2.128643, 1, 1, 1, 1, 1,
0.3640127, -1.652167, 4.011454, 0, 0, 1, 1, 1,
0.3646201, 0.1119527, 1.2971, 1, 0, 0, 1, 1,
0.3659919, 1.287421, 0.1532505, 1, 0, 0, 1, 1,
0.3661464, 0.9378317, -0.1211215, 1, 0, 0, 1, 1,
0.3665576, 0.4758003, -0.1875533, 1, 0, 0, 1, 1,
0.3678178, -0.5711296, 3.182141, 1, 0, 0, 1, 1,
0.3684949, -2.149402, 3.769591, 0, 0, 0, 1, 1,
0.3690197, -2.112972, 3.569653, 0, 0, 0, 1, 1,
0.3716186, -0.6777978, 1.757903, 0, 0, 0, 1, 1,
0.3734096, 1.525534, -1.116027, 0, 0, 0, 1, 1,
0.3775772, -0.9574595, 1.525627, 0, 0, 0, 1, 1,
0.3785192, -0.7487557, 2.261434, 0, 0, 0, 1, 1,
0.3819917, -0.9966864, 3.51354, 0, 0, 0, 1, 1,
0.3839819, -1.064093, 4.282681, 1, 1, 1, 1, 1,
0.3858851, 0.3088552, 0.3827619, 1, 1, 1, 1, 1,
0.3864761, -1.007856, 4.317171, 1, 1, 1, 1, 1,
0.3951998, 0.3820052, 0.6762132, 1, 1, 1, 1, 1,
0.3983889, 0.1556702, 2.877738, 1, 1, 1, 1, 1,
0.3984826, 0.8620454, 0.0002968395, 1, 1, 1, 1, 1,
0.4041157, -1.186538, 3.271594, 1, 1, 1, 1, 1,
0.4095415, -0.03998028, 2.630889, 1, 1, 1, 1, 1,
0.4105304, -0.8906229, 2.069251, 1, 1, 1, 1, 1,
0.4119541, -0.4589038, 1.952316, 1, 1, 1, 1, 1,
0.4145654, 0.9498898, -0.9612712, 1, 1, 1, 1, 1,
0.4177436, 0.6624713, 1.795008, 1, 1, 1, 1, 1,
0.4190066, -0.4980287, 1.848719, 1, 1, 1, 1, 1,
0.421132, 0.3986756, 1.278746, 1, 1, 1, 1, 1,
0.4211497, -0.08957674, 0.04452802, 1, 1, 1, 1, 1,
0.4215762, 1.445957, 1.360213, 0, 0, 1, 1, 1,
0.4238145, -1.129016, 3.197273, 1, 0, 0, 1, 1,
0.4311259, 2.278963, -0.818638, 1, 0, 0, 1, 1,
0.4322447, -0.7972725, 2.497739, 1, 0, 0, 1, 1,
0.4361441, -1.210769, 3.147208, 1, 0, 0, 1, 1,
0.4394798, -0.7194459, 1.506105, 1, 0, 0, 1, 1,
0.4441526, -0.5504169, 2.365714, 0, 0, 0, 1, 1,
0.4442537, -0.5158193, 1.539434, 0, 0, 0, 1, 1,
0.4498359, -0.02429421, 2.664171, 0, 0, 0, 1, 1,
0.450629, -1.093623, 1.370346, 0, 0, 0, 1, 1,
0.4558934, -0.2230782, 4.197927, 0, 0, 0, 1, 1,
0.4564905, 1.778173, -0.3851545, 0, 0, 0, 1, 1,
0.4593853, 0.8999071, 0.1345565, 0, 0, 0, 1, 1,
0.4607978, -1.098785, 3.395791, 1, 1, 1, 1, 1,
0.4633965, -1.246656, 3.784497, 1, 1, 1, 1, 1,
0.4660706, -0.7740261, -0.7783499, 1, 1, 1, 1, 1,
0.4674634, 1.762634, 1.083631, 1, 1, 1, 1, 1,
0.4721687, -0.6564923, 2.068004, 1, 1, 1, 1, 1,
0.4750862, -1.547846, 5.572716, 1, 1, 1, 1, 1,
0.4752665, -1.963668, 4.017512, 1, 1, 1, 1, 1,
0.4772469, -1.859753, 1.653241, 1, 1, 1, 1, 1,
0.4777554, 0.1300959, 1.148539, 1, 1, 1, 1, 1,
0.481544, -0.2972114, 2.534607, 1, 1, 1, 1, 1,
0.4826365, -2.675215, 3.467253, 1, 1, 1, 1, 1,
0.4834951, 0.4518668, 2.609078, 1, 1, 1, 1, 1,
0.4841116, -2.51582, 3.618416, 1, 1, 1, 1, 1,
0.4886119, -0.4458688, 2.687682, 1, 1, 1, 1, 1,
0.4891239, 0.2287937, 1.542429, 1, 1, 1, 1, 1,
0.4894315, -0.6659045, 3.008369, 0, 0, 1, 1, 1,
0.4895489, -0.1359657, 2.68988, 1, 0, 0, 1, 1,
0.4896024, -1.214105, 2.73767, 1, 0, 0, 1, 1,
0.490741, 1.187327, 0.5203397, 1, 0, 0, 1, 1,
0.4980187, 0.6688353, 0.4843966, 1, 0, 0, 1, 1,
0.4984344, 0.9604668, 1.0571, 1, 0, 0, 1, 1,
0.4986596, 0.7709666, 2.080199, 0, 0, 0, 1, 1,
0.5012224, -0.5387374, 2.621165, 0, 0, 0, 1, 1,
0.5026394, -0.4734988, 1.881998, 0, 0, 0, 1, 1,
0.503013, 0.6659573, 0.2749561, 0, 0, 0, 1, 1,
0.5042976, -0.2433387, 3.014733, 0, 0, 0, 1, 1,
0.5127707, 1.128166, -0.5136244, 0, 0, 0, 1, 1,
0.5128531, -1.149629, 3.674817, 0, 0, 0, 1, 1,
0.5171645, 1.106141, -1.283389, 1, 1, 1, 1, 1,
0.5200486, -0.5141578, 2.029485, 1, 1, 1, 1, 1,
0.5204391, -1.518614, 2.495391, 1, 1, 1, 1, 1,
0.5252506, -1.313912, 1.578855, 1, 1, 1, 1, 1,
0.5258102, 1.293624, 1.831033, 1, 1, 1, 1, 1,
0.5301703, -0.3673797, 0.8225632, 1, 1, 1, 1, 1,
0.530944, -0.7072242, 3.656165, 1, 1, 1, 1, 1,
0.53225, -0.1443482, 3.503438, 1, 1, 1, 1, 1,
0.5338904, 1.102817, -0.7158821, 1, 1, 1, 1, 1,
0.5359026, -0.6614921, 3.320385, 1, 1, 1, 1, 1,
0.5373011, 0.373147, 2.262233, 1, 1, 1, 1, 1,
0.5402941, 0.4373745, 1.364303, 1, 1, 1, 1, 1,
0.5516957, -0.175512, 2.424077, 1, 1, 1, 1, 1,
0.5551173, 0.4738278, 1.789165, 1, 1, 1, 1, 1,
0.5594196, 1.10582, 0.4497676, 1, 1, 1, 1, 1,
0.5614995, 1.509389, -0.9422449, 0, 0, 1, 1, 1,
0.5620607, -1.337271, 2.944313, 1, 0, 0, 1, 1,
0.5675238, -1.364256, 2.21691, 1, 0, 0, 1, 1,
0.5677023, -0.9352729, 2.367658, 1, 0, 0, 1, 1,
0.575667, 0.8510563, 1.865316, 1, 0, 0, 1, 1,
0.5826745, 0.1649415, 0.6061091, 1, 0, 0, 1, 1,
0.5917193, 0.5502762, 1.367879, 0, 0, 0, 1, 1,
0.5919006, -1.420401, 1.777366, 0, 0, 0, 1, 1,
0.5966899, -0.8525724, 4.504144, 0, 0, 0, 1, 1,
0.6091351, -0.9214606, 2.075289, 0, 0, 0, 1, 1,
0.6097414, 0.345426, 0.06853301, 0, 0, 0, 1, 1,
0.6104767, 0.9678195, -0.04631257, 0, 0, 0, 1, 1,
0.6159333, -1.036318, 1.445921, 0, 0, 0, 1, 1,
0.6169975, -0.403067, 1.696581, 1, 1, 1, 1, 1,
0.6174324, 0.3423967, 0.01395455, 1, 1, 1, 1, 1,
0.6202151, -0.4823691, 2.164675, 1, 1, 1, 1, 1,
0.6215768, -1.312657, 3.266469, 1, 1, 1, 1, 1,
0.6266049, -0.3060443, 2.383296, 1, 1, 1, 1, 1,
0.6280599, 1.808054, 1.732792, 1, 1, 1, 1, 1,
0.6284648, -0.04330499, 0.5008369, 1, 1, 1, 1, 1,
0.6321489, 0.003397157, 3.067387, 1, 1, 1, 1, 1,
0.6324155, 0.2377566, 1.680107, 1, 1, 1, 1, 1,
0.6360011, 0.3994534, -0.7363561, 1, 1, 1, 1, 1,
0.6430104, 0.8402822, 1.456424, 1, 1, 1, 1, 1,
0.6573629, -0.4094628, 2.971485, 1, 1, 1, 1, 1,
0.6645409, 0.5218973, 0.3949056, 1, 1, 1, 1, 1,
0.6647598, -0.1222363, 2.555976, 1, 1, 1, 1, 1,
0.6681346, -0.3972551, 3.042325, 1, 1, 1, 1, 1,
0.6699711, 0.008084641, 2.36566, 0, 0, 1, 1, 1,
0.6709835, 0.9541612, 0.5839952, 1, 0, 0, 1, 1,
0.6711969, 1.509003, 0.3455905, 1, 0, 0, 1, 1,
0.6733081, 0.5230004, 1.541247, 1, 0, 0, 1, 1,
0.6756626, 1.158952, 1.003032, 1, 0, 0, 1, 1,
0.6857176, -1.28682, 3.318961, 1, 0, 0, 1, 1,
0.6949687, -2.165939, 1.016112, 0, 0, 0, 1, 1,
0.6992245, 1.212143, -1.549291, 0, 0, 0, 1, 1,
0.7055653, -0.3199115, -0.2041504, 0, 0, 0, 1, 1,
0.7077003, -0.8517994, 1.497221, 0, 0, 0, 1, 1,
0.708025, 0.8479365, -1.243297, 0, 0, 0, 1, 1,
0.7082214, -0.7904221, 2.81487, 0, 0, 0, 1, 1,
0.7112814, -0.158704, 2.826652, 0, 0, 0, 1, 1,
0.7167088, 0.645717, 1.536336, 1, 1, 1, 1, 1,
0.7198187, 1.482959, 0.9294809, 1, 1, 1, 1, 1,
0.7199504, -0.908619, 1.077167, 1, 1, 1, 1, 1,
0.7243034, 0.5440087, -0.2951494, 1, 1, 1, 1, 1,
0.7325974, -0.7386031, 3.145713, 1, 1, 1, 1, 1,
0.734556, -0.8903956, 3.053782, 1, 1, 1, 1, 1,
0.7367607, -0.8793555, 3.946558, 1, 1, 1, 1, 1,
0.7432649, 0.3158299, 1.144197, 1, 1, 1, 1, 1,
0.7433855, -0.343943, 3.122449, 1, 1, 1, 1, 1,
0.7446701, 1.887186, 0.845225, 1, 1, 1, 1, 1,
0.7475392, -2.119938, 2.779085, 1, 1, 1, 1, 1,
0.7516716, 0.03148516, 1.141953, 1, 1, 1, 1, 1,
0.7618748, -0.716584, 2.678291, 1, 1, 1, 1, 1,
0.76224, 0.5505233, 0.0186727, 1, 1, 1, 1, 1,
0.7636696, -0.6186484, 1.977826, 1, 1, 1, 1, 1,
0.7638586, 0.9366286, 1.042223, 0, 0, 1, 1, 1,
0.7652339, 0.2913675, -0.9069597, 1, 0, 0, 1, 1,
0.7722926, -0.358889, 2.208525, 1, 0, 0, 1, 1,
0.7747633, -0.7093852, 1.638895, 1, 0, 0, 1, 1,
0.7814726, 1.21901, 0.8037974, 1, 0, 0, 1, 1,
0.7833184, -0.9920886, 0.4259958, 1, 0, 0, 1, 1,
0.7855614, -1.121685, 2.85428, 0, 0, 0, 1, 1,
0.7995503, 0.8871949, 0.5613528, 0, 0, 0, 1, 1,
0.7996176, 1.536399, 0.5353107, 0, 0, 0, 1, 1,
0.8024367, -1.857934, 2.314558, 0, 0, 0, 1, 1,
0.8075707, 0.2693329, 1.989471, 0, 0, 0, 1, 1,
0.808347, 0.6580505, 0.007169202, 0, 0, 0, 1, 1,
0.8094772, 0.2516189, 2.065924, 0, 0, 0, 1, 1,
0.8179232, -1.805406, 1.391781, 1, 1, 1, 1, 1,
0.8226846, -0.7844501, 2.440585, 1, 1, 1, 1, 1,
0.8259568, -0.5858533, 3.075569, 1, 1, 1, 1, 1,
0.8279424, -0.3753179, 1.786659, 1, 1, 1, 1, 1,
0.8299668, 0.5782624, -0.6389618, 1, 1, 1, 1, 1,
0.837906, -0.7531332, 2.677515, 1, 1, 1, 1, 1,
0.8398641, -0.7854283, 1.728338, 1, 1, 1, 1, 1,
0.8516873, 0.6093509, 1.575307, 1, 1, 1, 1, 1,
0.8563111, 0.6161504, 0.3610457, 1, 1, 1, 1, 1,
0.8565443, 0.9268191, 0.5791582, 1, 1, 1, 1, 1,
0.8590903, -0.8405349, 2.131041, 1, 1, 1, 1, 1,
0.8632863, -0.08358825, -1.690106, 1, 1, 1, 1, 1,
0.8746201, 0.08834353, 1.47759, 1, 1, 1, 1, 1,
0.8829717, -0.5349551, 2.247458, 1, 1, 1, 1, 1,
0.883165, -0.8043145, 0.5039259, 1, 1, 1, 1, 1,
0.8842667, 0.2604319, 1.399913, 0, 0, 1, 1, 1,
0.8857859, 0.4026239, 0.2095277, 1, 0, 0, 1, 1,
0.8976249, -0.67458, 2.732103, 1, 0, 0, 1, 1,
0.8992333, -0.1903769, 1.850337, 1, 0, 0, 1, 1,
0.8995024, 0.5937596, 0.4136046, 1, 0, 0, 1, 1,
0.9003488, -1.388031, 3.778368, 1, 0, 0, 1, 1,
0.9004322, 1.248741, -1.082029, 0, 0, 0, 1, 1,
0.9028606, 0.837045, 1.261749, 0, 0, 0, 1, 1,
0.9042788, 0.1942159, 3.302665, 0, 0, 0, 1, 1,
0.9106535, 1.629015, 1.16827, 0, 0, 0, 1, 1,
0.9158539, -0.06094532, -0.3629032, 0, 0, 0, 1, 1,
0.9246278, 0.4492099, 0.8532049, 0, 0, 0, 1, 1,
0.9246309, -1.225079, 2.025756, 0, 0, 0, 1, 1,
0.9280837, 0.5890608, 1.231954, 1, 1, 1, 1, 1,
0.9315549, 1.28819, 0.7355889, 1, 1, 1, 1, 1,
0.9348212, 1.179202, 0.7115911, 1, 1, 1, 1, 1,
0.9366768, -0.9559915, 3.369104, 1, 1, 1, 1, 1,
0.9370321, 0.3459982, 1.323541, 1, 1, 1, 1, 1,
0.9391617, -0.1901966, 1.591953, 1, 1, 1, 1, 1,
0.9493805, -1.370588, 0.6800914, 1, 1, 1, 1, 1,
0.9495903, -0.1494941, 3.641676, 1, 1, 1, 1, 1,
0.9508741, -1.155938, 1.946161, 1, 1, 1, 1, 1,
0.9640689, 0.471826, -0.6232331, 1, 1, 1, 1, 1,
0.9660667, 0.1743392, 1.721026, 1, 1, 1, 1, 1,
0.9665484, 2.244969, 1.295518, 1, 1, 1, 1, 1,
0.9738529, -0.3940535, -1.168501, 1, 1, 1, 1, 1,
0.9834824, 0.6552919, 1.160682, 1, 1, 1, 1, 1,
0.9840296, 0.1261818, 1.898065, 1, 1, 1, 1, 1,
0.9875695, 0.7853094, 1.372232, 0, 0, 1, 1, 1,
0.9889886, -0.8835719, 2.04271, 1, 0, 0, 1, 1,
0.9905807, 0.2229455, -0.02672792, 1, 0, 0, 1, 1,
1.003184, 1.405196, 1.681769, 1, 0, 0, 1, 1,
1.005254, -1.474157, 2.681865, 1, 0, 0, 1, 1,
1.011688, -0.3403473, 1.008254, 1, 0, 0, 1, 1,
1.018871, -0.9420531, 2.268212, 0, 0, 0, 1, 1,
1.019059, 1.207345, 0.03470268, 0, 0, 0, 1, 1,
1.02521, 0.5859734, 0.49156, 0, 0, 0, 1, 1,
1.030586, 2.188231, -0.1292626, 0, 0, 0, 1, 1,
1.030816, -1.718282, 2.900087, 0, 0, 0, 1, 1,
1.040623, 0.8586292, 1.970261, 0, 0, 0, 1, 1,
1.041661, -0.3722105, 2.436337, 0, 0, 0, 1, 1,
1.042132, 0.9924828, 0.1182573, 1, 1, 1, 1, 1,
1.04325, -1.301326, 1.599304, 1, 1, 1, 1, 1,
1.044293, 0.1951524, 0.9853811, 1, 1, 1, 1, 1,
1.047985, 0.6116636, 1.037089, 1, 1, 1, 1, 1,
1.057293, -0.9446439, 1.230257, 1, 1, 1, 1, 1,
1.060683, 0.6445282, 0.8344567, 1, 1, 1, 1, 1,
1.061631, 1.480875, 0.6964112, 1, 1, 1, 1, 1,
1.062878, 0.3347615, 2.12607, 1, 1, 1, 1, 1,
1.064656, 0.6954756, 1.693858, 1, 1, 1, 1, 1,
1.066519, 0.2506391, 0.3020682, 1, 1, 1, 1, 1,
1.070553, -1.161394, 2.408337, 1, 1, 1, 1, 1,
1.070761, 0.6981657, -0.6375048, 1, 1, 1, 1, 1,
1.072035, -0.6743271, 2.864865, 1, 1, 1, 1, 1,
1.072277, 2.238407, 0.751654, 1, 1, 1, 1, 1,
1.080106, 0.7335804, 0.8570113, 1, 1, 1, 1, 1,
1.080488, -0.4887376, 2.557427, 0, 0, 1, 1, 1,
1.082495, -1.166854, 3.549241, 1, 0, 0, 1, 1,
1.084683, 1.471727, 3.2441, 1, 0, 0, 1, 1,
1.094119, -0.9473159, 3.183633, 1, 0, 0, 1, 1,
1.095261, -0.5490825, 2.651544, 1, 0, 0, 1, 1,
1.097902, 0.8937823, 0.7861801, 1, 0, 0, 1, 1,
1.098311, 2.470787, 1.023869, 0, 0, 0, 1, 1,
1.104993, -0.4736769, 2.038291, 0, 0, 0, 1, 1,
1.121686, -1.11354, 3.938238, 0, 0, 0, 1, 1,
1.126937, 1.047847, 2.973761, 0, 0, 0, 1, 1,
1.133196, 0.09432957, 0.2336944, 0, 0, 0, 1, 1,
1.139, -0.3482588, 1.661722, 0, 0, 0, 1, 1,
1.140555, -0.2191577, 2.456511, 0, 0, 0, 1, 1,
1.14624, -2.017394, 3.116528, 1, 1, 1, 1, 1,
1.152979, 2.434018, 1.304007, 1, 1, 1, 1, 1,
1.16175, 1.317074, 1.153262, 1, 1, 1, 1, 1,
1.167404, -0.883543, 4.74902, 1, 1, 1, 1, 1,
1.17601, -0.3535717, 2.226444, 1, 1, 1, 1, 1,
1.179053, 0.3924509, 0.2371053, 1, 1, 1, 1, 1,
1.181936, -0.4548292, 1.470281, 1, 1, 1, 1, 1,
1.191116, 1.184709, -0.2270629, 1, 1, 1, 1, 1,
1.195038, 1.515875, 0.07428106, 1, 1, 1, 1, 1,
1.19815, 1.012082, 1.911796, 1, 1, 1, 1, 1,
1.203589, 1.261305, -0.1881468, 1, 1, 1, 1, 1,
1.209846, 0.2943515, 0.4393339, 1, 1, 1, 1, 1,
1.217744, 0.6097817, 1.028657, 1, 1, 1, 1, 1,
1.217963, -1.616438, 1.773306, 1, 1, 1, 1, 1,
1.226038, -0.2886968, 1.920813, 1, 1, 1, 1, 1,
1.228426, -1.315183, 2.630046, 0, 0, 1, 1, 1,
1.229672, -0.2377051, 1.566362, 1, 0, 0, 1, 1,
1.24033, -1.39368, 3.134312, 1, 0, 0, 1, 1,
1.251539, 1.016312, -0.3415693, 1, 0, 0, 1, 1,
1.256058, 1.00999, -0.4742598, 1, 0, 0, 1, 1,
1.276879, -0.9236951, 2.006262, 1, 0, 0, 1, 1,
1.278739, 0.7120517, 3.007354, 0, 0, 0, 1, 1,
1.281103, 0.61788, 3.265694, 0, 0, 0, 1, 1,
1.288719, -0.3581284, 0.8710088, 0, 0, 0, 1, 1,
1.290669, -0.3573257, 1.616557, 0, 0, 0, 1, 1,
1.299405, 0.9538106, 1.563446, 0, 0, 0, 1, 1,
1.300291, 0.7347413, 0.8379007, 0, 0, 0, 1, 1,
1.301168, 2.2697, -1.421015, 0, 0, 0, 1, 1,
1.313842, -0.2981612, 2.019938, 1, 1, 1, 1, 1,
1.315112, -2.452295, 1.670048, 1, 1, 1, 1, 1,
1.328109, 0.2028513, 1.661287, 1, 1, 1, 1, 1,
1.331448, -1.420574, 2.597684, 1, 1, 1, 1, 1,
1.333162, 0.2239962, 2.355924, 1, 1, 1, 1, 1,
1.336837, 0.9835577, 1.093269, 1, 1, 1, 1, 1,
1.341312, -0.8861079, 3.400423, 1, 1, 1, 1, 1,
1.344499, -0.09039985, 1.897282, 1, 1, 1, 1, 1,
1.369708, -0.2225769, 0.7203786, 1, 1, 1, 1, 1,
1.372668, 0.6028539, -0.3490276, 1, 1, 1, 1, 1,
1.379961, 0.5055384, 0.9895824, 1, 1, 1, 1, 1,
1.398037, 0.3079565, 1.449273, 1, 1, 1, 1, 1,
1.404943, -0.1404693, -0.8551681, 1, 1, 1, 1, 1,
1.405693, -0.2369762, 2.292938, 1, 1, 1, 1, 1,
1.407458, 0.2618802, -1.535437, 1, 1, 1, 1, 1,
1.410433, 0.2281049, 0.6379489, 0, 0, 1, 1, 1,
1.413266, 0.03544126, 0.8648217, 1, 0, 0, 1, 1,
1.41651, 0.2148497, 1.127662, 1, 0, 0, 1, 1,
1.422203, 0.7379972, 0.4244477, 1, 0, 0, 1, 1,
1.424656, -0.8705176, 5.028539, 1, 0, 0, 1, 1,
1.424701, 0.6047817, -0.7516623, 1, 0, 0, 1, 1,
1.429731, -0.195465, 0.8442086, 0, 0, 0, 1, 1,
1.43027, -1.580526, 1.971837, 0, 0, 0, 1, 1,
1.430524, 1.255688, 0.583828, 0, 0, 0, 1, 1,
1.437559, 0.7049336, 0.3115519, 0, 0, 0, 1, 1,
1.452152, 1.401324, 0.7622716, 0, 0, 0, 1, 1,
1.456924, -0.03983359, 2.897459, 0, 0, 0, 1, 1,
1.458191, 0.5822973, 0.9659255, 0, 0, 0, 1, 1,
1.462263, 1.336245, 1.119346, 1, 1, 1, 1, 1,
1.473425, -1.018918, 1.845879, 1, 1, 1, 1, 1,
1.473883, -0.2841212, 0.8039781, 1, 1, 1, 1, 1,
1.482873, -1.646645, 2.902137, 1, 1, 1, 1, 1,
1.483109, -0.1007439, 1.013607, 1, 1, 1, 1, 1,
1.488372, -0.8628501, 1.482957, 1, 1, 1, 1, 1,
1.500338, -0.3248357, 2.852069, 1, 1, 1, 1, 1,
1.53016, -0.2524184, 1.41975, 1, 1, 1, 1, 1,
1.560422, -0.1512308, 1.202314, 1, 1, 1, 1, 1,
1.57735, 0.07317287, 1.527261, 1, 1, 1, 1, 1,
1.593043, -1.021176, 1.637855, 1, 1, 1, 1, 1,
1.593665, -0.254122, 1.464756, 1, 1, 1, 1, 1,
1.600043, 1.848369, 1.506105, 1, 1, 1, 1, 1,
1.601703, 1.163699, 1.315285, 1, 1, 1, 1, 1,
1.615377, 0.2212725, 0.3533027, 1, 1, 1, 1, 1,
1.628271, -0.1786879, 0.07117604, 0, 0, 1, 1, 1,
1.628346, 0.4950784, 0.7234381, 1, 0, 0, 1, 1,
1.642211, 0.7678216, 0.7888604, 1, 0, 0, 1, 1,
1.667546, -0.9740474, 3.196146, 1, 0, 0, 1, 1,
1.673067, 0.1779592, 2.635827, 1, 0, 0, 1, 1,
1.736964, -0.62873, 1.763978, 1, 0, 0, 1, 1,
1.742517, 0.3384313, 1.026883, 0, 0, 0, 1, 1,
1.751363, 0.186508, 1.329718, 0, 0, 0, 1, 1,
1.786114, 1.057613, 1.295977, 0, 0, 0, 1, 1,
1.798146, -1.943786, 3.394106, 0, 0, 0, 1, 1,
1.798934, 1.313615, 0.9652919, 0, 0, 0, 1, 1,
1.799022, -2.198567, 3.023859, 0, 0, 0, 1, 1,
1.807919, -0.8383219, 0.3746852, 0, 0, 0, 1, 1,
1.816619, -0.6035668, 2.046629, 1, 1, 1, 1, 1,
1.840243, 0.9943209, 1.246967, 1, 1, 1, 1, 1,
1.856536, 1.223292, 1.18273, 1, 1, 1, 1, 1,
1.858113, -1.029201, 1.965909, 1, 1, 1, 1, 1,
1.859251, -0.2441427, 1.235548, 1, 1, 1, 1, 1,
1.880195, -0.56195, 0.9729986, 1, 1, 1, 1, 1,
1.884983, 2.126492, 1.809605, 1, 1, 1, 1, 1,
1.888783, -1.35562, 2.835586, 1, 1, 1, 1, 1,
1.889553, -1.400294, 1.867396, 1, 1, 1, 1, 1,
1.895604, 1.345886, 1.937813, 1, 1, 1, 1, 1,
1.909589, -1.647028, 2.102587, 1, 1, 1, 1, 1,
1.922727, -0.5710457, 0.1956931, 1, 1, 1, 1, 1,
1.954685, 0.2272596, 0.8509345, 1, 1, 1, 1, 1,
1.977109, -1.327376, 2.400594, 1, 1, 1, 1, 1,
1.999609, -1.162995, 3.05753, 1, 1, 1, 1, 1,
2.009131, 0.3998339, 0.003465355, 0, 0, 1, 1, 1,
2.080208, 0.5891086, 1.194176, 1, 0, 0, 1, 1,
2.086048, -0.2351873, 0.8115346, 1, 0, 0, 1, 1,
2.089238, -1.089188, 0.0757038, 1, 0, 0, 1, 1,
2.138114, -0.05769537, 1.779396, 1, 0, 0, 1, 1,
2.150548, -1.750668, 3.11368, 1, 0, 0, 1, 1,
2.169418, -1.084867, 2.679404, 0, 0, 0, 1, 1,
2.171353, -0.986842, 2.225304, 0, 0, 0, 1, 1,
2.228366, -0.4776118, 1.412674, 0, 0, 0, 1, 1,
2.235614, -0.5925971, 1.842836, 0, 0, 0, 1, 1,
2.346367, 0.2843419, 2.074977, 0, 0, 0, 1, 1,
2.411861, 0.8995675, 0.632081, 0, 0, 0, 1, 1,
2.483252, -1.301743, 2.672845, 0, 0, 0, 1, 1,
2.61248, -1.418486, 2.187033, 1, 1, 1, 1, 1,
2.847133, 0.184652, 2.478918, 1, 1, 1, 1, 1,
2.857709, -1.552721, 1.13544, 1, 1, 1, 1, 1,
2.942383, 0.1655119, 1.22772, 1, 1, 1, 1, 1,
3.069617, 0.1323814, 0.7467889, 1, 1, 1, 1, 1,
3.210438, -0.3941547, 1.77491, 1, 1, 1, 1, 1,
3.264771, -0.2042253, 0.9276689, 1, 1, 1, 1, 1
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
var radius = 9.532344;
var distance = 33.48195;
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
mvMatrix.translate( 0.08272457, 0.1352371, -0.2508874 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.48195);
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
