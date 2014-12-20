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
-3.257529, 1.319701, -1.105737, 1, 0, 0, 1,
-2.82471, 1.120585, -1.835068, 1, 0.007843138, 0, 1,
-2.678278, 0.9114972, -1.421729, 1, 0.01176471, 0, 1,
-2.634348, 0.4980394, -1.98827, 1, 0.01960784, 0, 1,
-2.447989, 0.5204173, 0.2881219, 1, 0.02352941, 0, 1,
-2.444676, 1.429463, -0.9828731, 1, 0.03137255, 0, 1,
-2.41295, 1.320259, -0.4272388, 1, 0.03529412, 0, 1,
-2.342925, 0.644376, -2.711759, 1, 0.04313726, 0, 1,
-2.240461, -1.487958, -2.373178, 1, 0.04705882, 0, 1,
-2.235531, -0.05364208, -0.0432491, 1, 0.05490196, 0, 1,
-2.195023, 0.3901996, -0.05650822, 1, 0.05882353, 0, 1,
-2.131263, 2.0298, -2.574866, 1, 0.06666667, 0, 1,
-2.130838, 1.345102, 0.199344, 1, 0.07058824, 0, 1,
-2.102143, -0.8209609, -2.956023, 1, 0.07843138, 0, 1,
-2.081141, -1.375255, -4.27212, 1, 0.08235294, 0, 1,
-2.076719, -2.047293, -2.06136, 1, 0.09019608, 0, 1,
-2.066217, 0.3354183, -0.4947168, 1, 0.09411765, 0, 1,
-2.021837, 1.254552, -3.858039, 1, 0.1019608, 0, 1,
-2.014138, 1.439125, -1.322761, 1, 0.1098039, 0, 1,
-1.976627, -2.057502, -2.811389, 1, 0.1137255, 0, 1,
-1.969891, -1.454204, -1.590827, 1, 0.1215686, 0, 1,
-1.945072, 1.073712, 0.2962539, 1, 0.1254902, 0, 1,
-1.929478, 0.3964844, -1.663882, 1, 0.1333333, 0, 1,
-1.898931, 0.02302992, -0.5885656, 1, 0.1372549, 0, 1,
-1.894884, -0.06335436, -1.649521, 1, 0.145098, 0, 1,
-1.887845, 0.5490875, -1.404156, 1, 0.1490196, 0, 1,
-1.83635, 1.14124, -1.166407, 1, 0.1568628, 0, 1,
-1.83624, 0.02075133, -2.768132, 1, 0.1607843, 0, 1,
-1.830775, -0.8118558, -2.269608, 1, 0.1686275, 0, 1,
-1.817708, 0.6413983, -0.7332275, 1, 0.172549, 0, 1,
-1.816352, 0.1297296, -2.052578, 1, 0.1803922, 0, 1,
-1.806514, -0.3886527, -2.056391, 1, 0.1843137, 0, 1,
-1.797247, 0.8619319, -1.375188, 1, 0.1921569, 0, 1,
-1.791401, -0.7964641, -1.306835, 1, 0.1960784, 0, 1,
-1.790754, -0.1654139, -2.123601, 1, 0.2039216, 0, 1,
-1.78628, 1.113883, 0.4062937, 1, 0.2117647, 0, 1,
-1.770547, -1.080709, -4.634095, 1, 0.2156863, 0, 1,
-1.769562, -0.1137512, -1.912751, 1, 0.2235294, 0, 1,
-1.766529, -0.8547652, -1.404303, 1, 0.227451, 0, 1,
-1.713854, -1.284816, -0.6913578, 1, 0.2352941, 0, 1,
-1.691841, -0.162132, -0.8056329, 1, 0.2392157, 0, 1,
-1.674837, 0.5759744, -2.446172, 1, 0.2470588, 0, 1,
-1.660209, -1.227093, -0.7629882, 1, 0.2509804, 0, 1,
-1.659, 0.6846779, -0.1438497, 1, 0.2588235, 0, 1,
-1.622331, 1.618782, -1.200849, 1, 0.2627451, 0, 1,
-1.617849, 0.2760576, -0.9794759, 1, 0.2705882, 0, 1,
-1.616372, -1.442506, -4.303589, 1, 0.2745098, 0, 1,
-1.607945, 1.507871, -0.7858997, 1, 0.282353, 0, 1,
-1.602635, -0.3526276, -2.64489, 1, 0.2862745, 0, 1,
-1.600155, 1.105323, -0.7558843, 1, 0.2941177, 0, 1,
-1.589763, 0.2505785, -0.7332575, 1, 0.3019608, 0, 1,
-1.589754, -1.397307, -2.052511, 1, 0.3058824, 0, 1,
-1.588301, 0.6719096, -2.158931, 1, 0.3137255, 0, 1,
-1.57961, 0.2808087, -2.106636, 1, 0.3176471, 0, 1,
-1.577924, -0.001290709, -2.600208, 1, 0.3254902, 0, 1,
-1.57192, 0.02420752, -1.898015, 1, 0.3294118, 0, 1,
-1.569188, -0.5121562, -0.7744104, 1, 0.3372549, 0, 1,
-1.567638, -0.03104581, -1.964536, 1, 0.3411765, 0, 1,
-1.555815, -0.6200951, -2.715657, 1, 0.3490196, 0, 1,
-1.554549, -0.8901511, -2.155354, 1, 0.3529412, 0, 1,
-1.554055, -0.2000568, -0.1504767, 1, 0.3607843, 0, 1,
-1.549017, -0.3018107, -0.8336859, 1, 0.3647059, 0, 1,
-1.544173, 0.2076409, -1.967912, 1, 0.372549, 0, 1,
-1.521339, -0.3138369, -1.065339, 1, 0.3764706, 0, 1,
-1.519738, -0.4276457, -2.661535, 1, 0.3843137, 0, 1,
-1.513676, -1.780104, -2.278299, 1, 0.3882353, 0, 1,
-1.508434, 2.245228, -1.544775, 1, 0.3960784, 0, 1,
-1.488827, -0.2898893, -0.2407957, 1, 0.4039216, 0, 1,
-1.482529, 1.166882, -1.946064, 1, 0.4078431, 0, 1,
-1.469975, -1.52303, -2.938463, 1, 0.4156863, 0, 1,
-1.460115, -0.2572497, -1.424507, 1, 0.4196078, 0, 1,
-1.458918, -2.437169, -4.479794, 1, 0.427451, 0, 1,
-1.457029, 1.03936, -1.487124, 1, 0.4313726, 0, 1,
-1.453497, 1.792143, -1.041225, 1, 0.4392157, 0, 1,
-1.435437, 0.1230333, -2.671715, 1, 0.4431373, 0, 1,
-1.403661, 1.651686, 0.6175443, 1, 0.4509804, 0, 1,
-1.398219, -1.047234, -1.600757, 1, 0.454902, 0, 1,
-1.393873, 0.1759275, -3.425414, 1, 0.4627451, 0, 1,
-1.380071, -1.748005, -1.867271, 1, 0.4666667, 0, 1,
-1.378799, 1.269429, -1.301652, 1, 0.4745098, 0, 1,
-1.371582, 0.6099048, 0.03471835, 1, 0.4784314, 0, 1,
-1.365215, -0.2444001, -2.576044, 1, 0.4862745, 0, 1,
-1.364282, 0.2580221, -1.463117, 1, 0.4901961, 0, 1,
-1.363894, -0.3876745, -0.654346, 1, 0.4980392, 0, 1,
-1.36032, -0.3481943, -1.320506, 1, 0.5058824, 0, 1,
-1.336613, 0.6632959, -0.9339554, 1, 0.509804, 0, 1,
-1.336505, 0.5660617, -0.7173831, 1, 0.5176471, 0, 1,
-1.33598, -0.8934125, -2.11368, 1, 0.5215687, 0, 1,
-1.330159, -0.8022151, -0.5530105, 1, 0.5294118, 0, 1,
-1.31618, 0.1494406, -1.72471, 1, 0.5333334, 0, 1,
-1.304368, -0.3950653, -1.375355, 1, 0.5411765, 0, 1,
-1.304259, -1.029581, -2.422919, 1, 0.5450981, 0, 1,
-1.295907, -0.5259813, -1.974571, 1, 0.5529412, 0, 1,
-1.28861, 0.2948939, -2.27071, 1, 0.5568628, 0, 1,
-1.287963, 0.269032, -1.406438, 1, 0.5647059, 0, 1,
-1.273232, 0.6970754, 0.242196, 1, 0.5686275, 0, 1,
-1.258273, 0.3793583, -0.974498, 1, 0.5764706, 0, 1,
-1.251796, 1.631672, -0.9598759, 1, 0.5803922, 0, 1,
-1.250164, 1.194832, -1.888795, 1, 0.5882353, 0, 1,
-1.2406, -0.788312, -2.76441, 1, 0.5921569, 0, 1,
-1.234719, 1.302141, 0.5779846, 1, 0.6, 0, 1,
-1.226146, -0.3672413, -2.643523, 1, 0.6078432, 0, 1,
-1.223302, -1.165105, -3.145254, 1, 0.6117647, 0, 1,
-1.20754, 1.312032, -1.74892, 1, 0.6196079, 0, 1,
-1.206831, -1.000312, -3.057854, 1, 0.6235294, 0, 1,
-1.200313, 1.080943, -2.036777, 1, 0.6313726, 0, 1,
-1.199626, 1.309937, -0.4314958, 1, 0.6352941, 0, 1,
-1.192493, 2.178031, -0.444434, 1, 0.6431373, 0, 1,
-1.192477, 0.6809065, -3.280888, 1, 0.6470588, 0, 1,
-1.192302, -0.4339024, -2.239264, 1, 0.654902, 0, 1,
-1.174352, 1.248079, -0.586339, 1, 0.6588235, 0, 1,
-1.16784, 0.3181143, -2.000395, 1, 0.6666667, 0, 1,
-1.161679, 0.610626, -0.4205699, 1, 0.6705883, 0, 1,
-1.156927, 1.278406, -0.5252578, 1, 0.6784314, 0, 1,
-1.139662, -0.7799046, -2.791892, 1, 0.682353, 0, 1,
-1.136392, 0.0441019, -1.459947, 1, 0.6901961, 0, 1,
-1.131805, 0.7594429, -0.748181, 1, 0.6941177, 0, 1,
-1.12808, -0.5573716, -1.679004, 1, 0.7019608, 0, 1,
-1.1267, -0.7074756, -3.814796, 1, 0.7098039, 0, 1,
-1.121578, 0.8017269, -0.2869666, 1, 0.7137255, 0, 1,
-1.116237, -0.6724214, -2.658577, 1, 0.7215686, 0, 1,
-1.111449, 0.3172249, 0.406168, 1, 0.7254902, 0, 1,
-1.106081, -0.2757809, -2.058144, 1, 0.7333333, 0, 1,
-1.104747, -1.693305, -2.614645, 1, 0.7372549, 0, 1,
-1.081063, -0.3217359, -1.017639, 1, 0.7450981, 0, 1,
-1.079753, 0.9435163, 1.232377, 1, 0.7490196, 0, 1,
-1.077285, -0.6022221, -1.871969, 1, 0.7568628, 0, 1,
-1.0723, 0.0953845, 0.004947264, 1, 0.7607843, 0, 1,
-1.071233, 1.159255, -0.7744762, 1, 0.7686275, 0, 1,
-1.069221, -0.8506581, -2.500825, 1, 0.772549, 0, 1,
-1.06843, 0.1627237, -1.748243, 1, 0.7803922, 0, 1,
-1.064922, 0.1959321, -2.149928, 1, 0.7843137, 0, 1,
-1.06422, 0.1789766, -0.7344307, 1, 0.7921569, 0, 1,
-1.060915, -0.7695283, -3.106638, 1, 0.7960784, 0, 1,
-1.057173, -0.2034238, -0.7373155, 1, 0.8039216, 0, 1,
-1.056186, 2.232644, -0.3853094, 1, 0.8117647, 0, 1,
-1.0546, -0.4629594, -3.701234, 1, 0.8156863, 0, 1,
-1.042594, 0.8970618, -0.7145266, 1, 0.8235294, 0, 1,
-1.038466, -0.4607258, -3.733101, 1, 0.827451, 0, 1,
-1.035442, -1.506029, -2.755121, 1, 0.8352941, 0, 1,
-1.016624, -0.7713919, -1.427274, 1, 0.8392157, 0, 1,
-1.00638, 0.5180179, -0.1674698, 1, 0.8470588, 0, 1,
-1.000963, 1.975164, -0.8566868, 1, 0.8509804, 0, 1,
-1.000668, -0.3264212, -0.05180108, 1, 0.8588235, 0, 1,
-0.9955105, 0.2221061, -1.747855, 1, 0.8627451, 0, 1,
-0.9904149, 0.495745, -2.149244, 1, 0.8705882, 0, 1,
-0.9889781, 0.2461191, 0.6210823, 1, 0.8745098, 0, 1,
-0.9844757, -0.9865552, -3.152319, 1, 0.8823529, 0, 1,
-0.9736, -0.1092982, -2.432557, 1, 0.8862745, 0, 1,
-0.9730352, -1.442052, -1.979422, 1, 0.8941177, 0, 1,
-0.9627022, 0.9357173, 0.710703, 1, 0.8980392, 0, 1,
-0.9619032, 0.6243757, -1.429487, 1, 0.9058824, 0, 1,
-0.947477, -0.2796551, -1.808573, 1, 0.9137255, 0, 1,
-0.9446893, 1.116545, 0.9756764, 1, 0.9176471, 0, 1,
-0.9397844, -1.062168, -3.739254, 1, 0.9254902, 0, 1,
-0.9351239, 0.3672417, -2.687282, 1, 0.9294118, 0, 1,
-0.9257195, -0.594771, -1.911577, 1, 0.9372549, 0, 1,
-0.9252144, 0.08053815, -1.40089, 1, 0.9411765, 0, 1,
-0.9226066, -1.124233, -2.220536, 1, 0.9490196, 0, 1,
-0.9218836, 1.082829, -1.256379, 1, 0.9529412, 0, 1,
-0.9188285, 1.390544, -0.3127231, 1, 0.9607843, 0, 1,
-0.9188086, 0.8002226, -1.436583, 1, 0.9647059, 0, 1,
-0.9156536, -0.3553281, -2.416013, 1, 0.972549, 0, 1,
-0.9062296, 0.1088983, -1.250604, 1, 0.9764706, 0, 1,
-0.905334, 0.2514512, -0.6645168, 1, 0.9843137, 0, 1,
-0.900852, 0.2939832, -1.735321, 1, 0.9882353, 0, 1,
-0.9006906, -0.0002241985, -2.3808, 1, 0.9960784, 0, 1,
-0.9006566, -1.217276, -2.981053, 0.9960784, 1, 0, 1,
-0.8941598, 0.3355733, -2.435766, 0.9921569, 1, 0, 1,
-0.8846422, 0.7940892, -1.020061, 0.9843137, 1, 0, 1,
-0.8811624, -0.2903334, -0.3142399, 0.9803922, 1, 0, 1,
-0.878381, -0.04245552, -2.054072, 0.972549, 1, 0, 1,
-0.8776144, 0.1443809, -0.053458, 0.9686275, 1, 0, 1,
-0.8765664, 0.7438713, -0.3912247, 0.9607843, 1, 0, 1,
-0.8757664, 1.204152, -1.725449, 0.9568627, 1, 0, 1,
-0.871514, -0.2050771, -0.3713786, 0.9490196, 1, 0, 1,
-0.8678811, 0.1182564, -2.594019, 0.945098, 1, 0, 1,
-0.8609373, -0.1673779, -1.483059, 0.9372549, 1, 0, 1,
-0.8602979, 0.5414954, -2.433805, 0.9333333, 1, 0, 1,
-0.8599721, 0.9504988, 1.348088, 0.9254902, 1, 0, 1,
-0.8580768, -1.005674, -1.574058, 0.9215686, 1, 0, 1,
-0.8514344, -0.3176856, -2.612547, 0.9137255, 1, 0, 1,
-0.8461563, -0.5041236, -2.345168, 0.9098039, 1, 0, 1,
-0.8448427, -0.6901698, -2.831525, 0.9019608, 1, 0, 1,
-0.8390781, 1.144376, -0.2641685, 0.8941177, 1, 0, 1,
-0.8380047, -0.2098221, -2.784867, 0.8901961, 1, 0, 1,
-0.8289135, -2.104424, -3.038548, 0.8823529, 1, 0, 1,
-0.8260145, 2.73956, -0.7289063, 0.8784314, 1, 0, 1,
-0.8069867, -0.8315727, -4.84017, 0.8705882, 1, 0, 1,
-0.804827, -0.9793285, -2.207663, 0.8666667, 1, 0, 1,
-0.790875, 1.977949, -0.7723819, 0.8588235, 1, 0, 1,
-0.7881246, 1.720643, 1.515803, 0.854902, 1, 0, 1,
-0.7852372, 1.325067, 1.296933, 0.8470588, 1, 0, 1,
-0.7838084, 0.8980457, -0.1389271, 0.8431373, 1, 0, 1,
-0.7820365, -0.2792179, -1.699593, 0.8352941, 1, 0, 1,
-0.7746668, -0.4777735, -1.991046, 0.8313726, 1, 0, 1,
-0.7715699, -0.05664476, -0.4609609, 0.8235294, 1, 0, 1,
-0.7712568, -0.03625773, -0.9470369, 0.8196079, 1, 0, 1,
-0.7679616, -0.9285509, -3.331933, 0.8117647, 1, 0, 1,
-0.7662171, 0.2110423, -1.817249, 0.8078431, 1, 0, 1,
-0.7636184, 1.722301, -0.1088093, 0.8, 1, 0, 1,
-0.7597314, 0.6281635, -0.6049779, 0.7921569, 1, 0, 1,
-0.7562165, -0.7195973, -2.553411, 0.7882353, 1, 0, 1,
-0.7512734, 0.1438778, -0.7984685, 0.7803922, 1, 0, 1,
-0.7448501, -0.9147418, -3.182537, 0.7764706, 1, 0, 1,
-0.7430249, 0.5408522, -0.05875793, 0.7686275, 1, 0, 1,
-0.7412822, 0.6241521, -0.9724705, 0.7647059, 1, 0, 1,
-0.7385803, -0.2582205, -2.425779, 0.7568628, 1, 0, 1,
-0.7344014, 0.8756611, -1.733846, 0.7529412, 1, 0, 1,
-0.7342523, -0.5788424, -2.873639, 0.7450981, 1, 0, 1,
-0.7307436, 0.5810416, -0.62931, 0.7411765, 1, 0, 1,
-0.7305272, 0.3474525, -1.801963, 0.7333333, 1, 0, 1,
-0.7273585, -0.7940137, -3.730168, 0.7294118, 1, 0, 1,
-0.7265657, -1.374389, -3.565647, 0.7215686, 1, 0, 1,
-0.7166438, 1.235242, 0.1010425, 0.7176471, 1, 0, 1,
-0.7151743, 1.299613, 1.066908, 0.7098039, 1, 0, 1,
-0.7127766, 0.3477134, -0.8925541, 0.7058824, 1, 0, 1,
-0.7112698, 0.8237082, -1.078156, 0.6980392, 1, 0, 1,
-0.7072759, -0.04560558, -1.448022, 0.6901961, 1, 0, 1,
-0.7059241, 0.3151745, -0.211985, 0.6862745, 1, 0, 1,
-0.7058294, -1.751668, -2.745476, 0.6784314, 1, 0, 1,
-0.7053741, 1.262373, -0.25538, 0.6745098, 1, 0, 1,
-0.7048723, -1.335485, -3.686458, 0.6666667, 1, 0, 1,
-0.7037753, 0.5798909, -0.847318, 0.6627451, 1, 0, 1,
-0.7032154, -0.0742779, -0.866598, 0.654902, 1, 0, 1,
-0.6872432, 0.7925008, 0.2328644, 0.6509804, 1, 0, 1,
-0.685695, 0.5110462, -2.014183, 0.6431373, 1, 0, 1,
-0.6837476, 1.558201, -0.3269352, 0.6392157, 1, 0, 1,
-0.6831784, 0.1722817, -1.358981, 0.6313726, 1, 0, 1,
-0.6766641, -1.588604, -1.435168, 0.627451, 1, 0, 1,
-0.6759269, 0.7703953, -3.011652, 0.6196079, 1, 0, 1,
-0.6750182, -1.540018, -2.814044, 0.6156863, 1, 0, 1,
-0.6746607, -0.1519928, -2.633307, 0.6078432, 1, 0, 1,
-0.6675127, 0.5598459, -0.2594788, 0.6039216, 1, 0, 1,
-0.6650019, 0.08471083, -1.395945, 0.5960785, 1, 0, 1,
-0.6615977, 1.599917, -0.8213038, 0.5882353, 1, 0, 1,
-0.6556432, -0.7069914, -2.739688, 0.5843138, 1, 0, 1,
-0.6550027, -0.5703675, -1.372164, 0.5764706, 1, 0, 1,
-0.6518926, 0.659668, 0.2958874, 0.572549, 1, 0, 1,
-0.649374, 0.5640216, -1.897227, 0.5647059, 1, 0, 1,
-0.6471682, -0.2825693, -0.9395657, 0.5607843, 1, 0, 1,
-0.6462331, -0.5007932, -3.24928, 0.5529412, 1, 0, 1,
-0.6448189, 0.6356095, 1.286705, 0.5490196, 1, 0, 1,
-0.643905, 2.356251, -1.773388, 0.5411765, 1, 0, 1,
-0.6317587, -1.101549, -3.355666, 0.5372549, 1, 0, 1,
-0.6258613, -0.5227239, -2.476973, 0.5294118, 1, 0, 1,
-0.6249627, 1.552155, -0.5275869, 0.5254902, 1, 0, 1,
-0.6228341, -0.2556599, -1.213234, 0.5176471, 1, 0, 1,
-0.6217431, -0.8061787, -4.021581, 0.5137255, 1, 0, 1,
-0.6155829, -0.2045609, -2.692008, 0.5058824, 1, 0, 1,
-0.6089883, -0.6708068, -1.041361, 0.5019608, 1, 0, 1,
-0.607731, 0.9487118, -1.568533, 0.4941176, 1, 0, 1,
-0.6023576, -0.4888214, -2.671279, 0.4862745, 1, 0, 1,
-0.6013401, 0.6497117, -2.821553, 0.4823529, 1, 0, 1,
-0.5975906, 0.351433, -2.22206, 0.4745098, 1, 0, 1,
-0.5835778, -0.942343, -1.416077, 0.4705882, 1, 0, 1,
-0.5780384, -0.5087143, -1.171882, 0.4627451, 1, 0, 1,
-0.5777378, -0.7278071, -2.418289, 0.4588235, 1, 0, 1,
-0.5760257, 0.4831515, -0.4414733, 0.4509804, 1, 0, 1,
-0.5756608, -1.893771, -2.827065, 0.4470588, 1, 0, 1,
-0.5735907, 1.342212, -0.5055676, 0.4392157, 1, 0, 1,
-0.5724153, -0.6968499, -3.351477, 0.4352941, 1, 0, 1,
-0.572174, 0.04251077, -0.2529655, 0.427451, 1, 0, 1,
-0.5639318, 0.6540627, 1.004909, 0.4235294, 1, 0, 1,
-0.563737, 0.1353588, 0.4512387, 0.4156863, 1, 0, 1,
-0.5630665, 0.0679195, -1.678235, 0.4117647, 1, 0, 1,
-0.5623178, 1.083104, -1.842438, 0.4039216, 1, 0, 1,
-0.5579027, -1.673613, -2.605034, 0.3960784, 1, 0, 1,
-0.556049, -0.2618434, -1.930731, 0.3921569, 1, 0, 1,
-0.5541776, -0.4087333, -3.939183, 0.3843137, 1, 0, 1,
-0.5540418, 0.7713033, -0.2888986, 0.3803922, 1, 0, 1,
-0.5449156, -1.419186, -2.642933, 0.372549, 1, 0, 1,
-0.5396481, 2.505459, -1.524948, 0.3686275, 1, 0, 1,
-0.5352442, -1.551147, -2.280544, 0.3607843, 1, 0, 1,
-0.5346997, -1.001858, -4.381175, 0.3568628, 1, 0, 1,
-0.5286876, 0.211977, -1.089589, 0.3490196, 1, 0, 1,
-0.5240884, -0.1549991, -3.897208, 0.345098, 1, 0, 1,
-0.5224031, 0.06936419, -0.9928302, 0.3372549, 1, 0, 1,
-0.5214697, 1.183529, -0.2792449, 0.3333333, 1, 0, 1,
-0.5166038, -1.060619, -2.192281, 0.3254902, 1, 0, 1,
-0.5075778, 0.7720505, 0.06586166, 0.3215686, 1, 0, 1,
-0.5012584, -1.498358, -1.812769, 0.3137255, 1, 0, 1,
-0.5000177, 0.3788435, 0.08755676, 0.3098039, 1, 0, 1,
-0.4989407, -0.2046546, -3.893652, 0.3019608, 1, 0, 1,
-0.4937195, 0.1619064, -0.07280315, 0.2941177, 1, 0, 1,
-0.4799096, 1.718107, -0.150013, 0.2901961, 1, 0, 1,
-0.4796123, 0.3707899, -0.1988737, 0.282353, 1, 0, 1,
-0.4786598, 2.133734, -1.282232, 0.2784314, 1, 0, 1,
-0.477466, -1.165844, -3.287386, 0.2705882, 1, 0, 1,
-0.4758547, -1.252889, -0.676525, 0.2666667, 1, 0, 1,
-0.4742975, -0.3909755, -1.759462, 0.2588235, 1, 0, 1,
-0.4739994, 1.647257, 1.181797, 0.254902, 1, 0, 1,
-0.472954, -0.5834516, -1.983079, 0.2470588, 1, 0, 1,
-0.4724097, -0.2400885, -2.405783, 0.2431373, 1, 0, 1,
-0.4713259, 0.09398548, -3.124805, 0.2352941, 1, 0, 1,
-0.4712588, -0.8330626, -2.555417, 0.2313726, 1, 0, 1,
-0.4695722, 0.17448, -1.676333, 0.2235294, 1, 0, 1,
-0.460411, 0.03524941, -2.769418, 0.2196078, 1, 0, 1,
-0.4590556, -1.072781, -3.588256, 0.2117647, 1, 0, 1,
-0.4567067, -0.6332654, -3.487796, 0.2078431, 1, 0, 1,
-0.4502397, -0.2164471, -1.698423, 0.2, 1, 0, 1,
-0.4437983, 1.076754, -1.396516, 0.1921569, 1, 0, 1,
-0.4423901, 0.9386946, -1.605049, 0.1882353, 1, 0, 1,
-0.4419198, 1.085408, 0.2284648, 0.1803922, 1, 0, 1,
-0.4403624, -1.974616, -2.582814, 0.1764706, 1, 0, 1,
-0.4389675, 0.04588188, -1.459714, 0.1686275, 1, 0, 1,
-0.438758, 1.218772, -1.4134, 0.1647059, 1, 0, 1,
-0.4367679, -0.680079, -1.736764, 0.1568628, 1, 0, 1,
-0.4358407, 0.3192407, -0.8199602, 0.1529412, 1, 0, 1,
-0.4345309, -0.483687, -3.444219, 0.145098, 1, 0, 1,
-0.432178, 0.8623635, 0.8087581, 0.1411765, 1, 0, 1,
-0.4318435, -0.3483326, -3.260818, 0.1333333, 1, 0, 1,
-0.4295116, 2.202825, -0.3796548, 0.1294118, 1, 0, 1,
-0.4224237, -1.477123, -4.248601, 0.1215686, 1, 0, 1,
-0.4221291, 0.7567816, -1.747753, 0.1176471, 1, 0, 1,
-0.4170153, 0.1842809, -1.395864, 0.1098039, 1, 0, 1,
-0.4158987, 0.563462, -1.352069, 0.1058824, 1, 0, 1,
-0.4070223, 0.6354089, -1.067911, 0.09803922, 1, 0, 1,
-0.4067548, -0.9691794, -2.58866, 0.09019608, 1, 0, 1,
-0.4066534, 0.8247247, -1.068773, 0.08627451, 1, 0, 1,
-0.4025232, -2.488992, -4.074677, 0.07843138, 1, 0, 1,
-0.3972961, 0.4235887, -0.4795635, 0.07450981, 1, 0, 1,
-0.3955882, 0.5961004, 0.6936345, 0.06666667, 1, 0, 1,
-0.3917935, 0.08420102, -1.826478, 0.0627451, 1, 0, 1,
-0.3914416, 0.2460067, -0.07062535, 0.05490196, 1, 0, 1,
-0.3881993, 0.02271865, -0.7123222, 0.05098039, 1, 0, 1,
-0.3879335, -1.015134, -1.672601, 0.04313726, 1, 0, 1,
-0.3843999, -0.8866619, -2.607353, 0.03921569, 1, 0, 1,
-0.3828364, -0.3057086, -3.225338, 0.03137255, 1, 0, 1,
-0.380641, 0.3861722, -0.5473741, 0.02745098, 1, 0, 1,
-0.3770394, 0.8544326, -0.3804176, 0.01960784, 1, 0, 1,
-0.3764165, -1.190706, -3.674087, 0.01568628, 1, 0, 1,
-0.3763149, 0.3434807, -0.4656176, 0.007843138, 1, 0, 1,
-0.3751092, 0.9511501, -0.01279333, 0.003921569, 1, 0, 1,
-0.3716026, -0.1419944, -0.3981243, 0, 1, 0.003921569, 1,
-0.3715329, -0.06023106, -2.133181, 0, 1, 0.01176471, 1,
-0.3691761, 1.104279, 0.8798406, 0, 1, 0.01568628, 1,
-0.3687318, 1.085776, 1.866642, 0, 1, 0.02352941, 1,
-0.3629655, 1.06294, -0.08428995, 0, 1, 0.02745098, 1,
-0.360325, -0.474693, -2.613823, 0, 1, 0.03529412, 1,
-0.3582833, -0.07199718, -1.419759, 0, 1, 0.03921569, 1,
-0.3566724, 0.2817618, -0.2744866, 0, 1, 0.04705882, 1,
-0.3566062, -0.9346174, -2.131321, 0, 1, 0.05098039, 1,
-0.3539105, -1.046105, -3.430532, 0, 1, 0.05882353, 1,
-0.3518825, -1.081699, -2.652878, 0, 1, 0.0627451, 1,
-0.3490534, 0.3465272, -2.485619, 0, 1, 0.07058824, 1,
-0.3455527, 0.2817989, -1.132641, 0, 1, 0.07450981, 1,
-0.3442732, 0.1532763, -1.17187, 0, 1, 0.08235294, 1,
-0.3431474, -0.5148856, -3.728279, 0, 1, 0.08627451, 1,
-0.3428701, 0.3458, -1.241972, 0, 1, 0.09411765, 1,
-0.3373756, -0.3637778, -1.061174, 0, 1, 0.1019608, 1,
-0.3369386, 1.303469, -0.1074791, 0, 1, 0.1058824, 1,
-0.3295487, -0.3328038, -1.982051, 0, 1, 0.1137255, 1,
-0.3281401, -0.1114877, -1.204633, 0, 1, 0.1176471, 1,
-0.328118, -0.9119189, -3.114254, 0, 1, 0.1254902, 1,
-0.3278889, -0.425458, -3.726377, 0, 1, 0.1294118, 1,
-0.3270777, 1.777063, 0.2429136, 0, 1, 0.1372549, 1,
-0.3269337, -0.5215442, -2.220015, 0, 1, 0.1411765, 1,
-0.3250261, -0.3450051, -1.872691, 0, 1, 0.1490196, 1,
-0.3235633, 0.6083789, 0.5800377, 0, 1, 0.1529412, 1,
-0.3225053, 0.1124317, -1.672177, 0, 1, 0.1607843, 1,
-0.3222729, -0.1175057, 0.042336, 0, 1, 0.1647059, 1,
-0.3204091, -0.1234974, -1.748829, 0, 1, 0.172549, 1,
-0.3202417, -0.8122536, -5.254291, 0, 1, 0.1764706, 1,
-0.3197961, 3.261251, 0.9736411, 0, 1, 0.1843137, 1,
-0.3190906, 0.3334805, 0.2658852, 0, 1, 0.1882353, 1,
-0.3166318, 0.1107454, -2.252849, 0, 1, 0.1960784, 1,
-0.3143148, 0.8032262, 1.128894, 0, 1, 0.2039216, 1,
-0.3135108, 1.122562, -0.05984791, 0, 1, 0.2078431, 1,
-0.3127533, -1.22593, -3.348038, 0, 1, 0.2156863, 1,
-0.3114095, 0.2294896, -0.151755, 0, 1, 0.2196078, 1,
-0.3109142, -0.6201521, -1.473734, 0, 1, 0.227451, 1,
-0.3079361, -1.681704, -3.114779, 0, 1, 0.2313726, 1,
-0.305245, 0.001595364, -3.650469, 0, 1, 0.2392157, 1,
-0.3052413, 1.270817, 0.8637317, 0, 1, 0.2431373, 1,
-0.3023925, 1.121813, -1.387975, 0, 1, 0.2509804, 1,
-0.2909595, 0.3037655, -2.473376, 0, 1, 0.254902, 1,
-0.2898111, 1.531648, 0.07473703, 0, 1, 0.2627451, 1,
-0.2777548, 1.158496, -0.7548095, 0, 1, 0.2666667, 1,
-0.2725189, 0.5796052, -0.2442563, 0, 1, 0.2745098, 1,
-0.2715766, 0.5076668, -0.8480381, 0, 1, 0.2784314, 1,
-0.2704955, -1.641439, -2.826432, 0, 1, 0.2862745, 1,
-0.2652754, 1.365481, 0.1394414, 0, 1, 0.2901961, 1,
-0.2648553, 0.1175738, -0.6167002, 0, 1, 0.2980392, 1,
-0.2624493, -0.5774482, -1.980838, 0, 1, 0.3058824, 1,
-0.2613183, -0.2627103, -3.381455, 0, 1, 0.3098039, 1,
-0.2609643, 0.402035, -1.011206, 0, 1, 0.3176471, 1,
-0.2600918, -0.067704, -0.5617288, 0, 1, 0.3215686, 1,
-0.2518824, -1.696097, -2.907918, 0, 1, 0.3294118, 1,
-0.2509676, -0.7918255, -3.311003, 0, 1, 0.3333333, 1,
-0.2508985, 0.5211422, -0.5763847, 0, 1, 0.3411765, 1,
-0.24772, -0.1827656, -2.526278, 0, 1, 0.345098, 1,
-0.2352987, 0.01150804, -0.5357221, 0, 1, 0.3529412, 1,
-0.2286635, -1.071663, -4.223176, 0, 1, 0.3568628, 1,
-0.2237138, -0.5220748, -1.872591, 0, 1, 0.3647059, 1,
-0.2189031, -0.1468519, -2.575948, 0, 1, 0.3686275, 1,
-0.2182653, 0.2719968, -1.661245, 0, 1, 0.3764706, 1,
-0.2101936, -0.5847356, -3.47635, 0, 1, 0.3803922, 1,
-0.2093849, 1.360556, -1.579324, 0, 1, 0.3882353, 1,
-0.2092402, 1.07758, 0.6846582, 0, 1, 0.3921569, 1,
-0.2088059, 0.1252436, -2.394292, 0, 1, 0.4, 1,
-0.2080962, 0.1082562, -0.4266875, 0, 1, 0.4078431, 1,
-0.1997238, 1.758821, -2.036863, 0, 1, 0.4117647, 1,
-0.1990439, -2.442032, -3.310782, 0, 1, 0.4196078, 1,
-0.193074, 1.249868, 0.7459467, 0, 1, 0.4235294, 1,
-0.1922596, -0.3783252, -1.981314, 0, 1, 0.4313726, 1,
-0.1908057, -0.6028785, -4.174075, 0, 1, 0.4352941, 1,
-0.1899187, 1.862349, 0.1947135, 0, 1, 0.4431373, 1,
-0.1831664, -0.3028703, -2.936639, 0, 1, 0.4470588, 1,
-0.1819382, 0.7745832, -1.916538, 0, 1, 0.454902, 1,
-0.1770151, 0.3105543, -0.7322783, 0, 1, 0.4588235, 1,
-0.1770134, 0.8710821, -1.168748, 0, 1, 0.4666667, 1,
-0.1764269, 1.741682, 2.243152, 0, 1, 0.4705882, 1,
-0.1753924, -0.1064976, -1.203202, 0, 1, 0.4784314, 1,
-0.1744621, 0.3367401, 0.1993082, 0, 1, 0.4823529, 1,
-0.1726509, 0.1593046, -1.413499, 0, 1, 0.4901961, 1,
-0.1671631, 2.638171, 0.1565675, 0, 1, 0.4941176, 1,
-0.1622951, -0.1226237, -1.226181, 0, 1, 0.5019608, 1,
-0.1621976, 0.4130876, -0.3000726, 0, 1, 0.509804, 1,
-0.1564607, 0.9752663, 0.003105478, 0, 1, 0.5137255, 1,
-0.1541416, -0.02569798, -3.37921, 0, 1, 0.5215687, 1,
-0.1533058, 0.2717307, 1.167612, 0, 1, 0.5254902, 1,
-0.152357, 0.1095255, 0.4600278, 0, 1, 0.5333334, 1,
-0.1493613, -0.6279482, -2.011865, 0, 1, 0.5372549, 1,
-0.1454973, 2.775205, 1.631318, 0, 1, 0.5450981, 1,
-0.1384907, 0.4921966, -2.220741, 0, 1, 0.5490196, 1,
-0.1360962, 0.215583, -1.252277, 0, 1, 0.5568628, 1,
-0.1355996, -0.6422632, -2.929364, 0, 1, 0.5607843, 1,
-0.1320535, 0.9310358, -1.281729, 0, 1, 0.5686275, 1,
-0.1315731, -1.576246, -2.577864, 0, 1, 0.572549, 1,
-0.1294826, -0.1964531, -3.195991, 0, 1, 0.5803922, 1,
-0.1247986, -0.1115568, -3.327014, 0, 1, 0.5843138, 1,
-0.1223629, 0.3608613, 0.9841861, 0, 1, 0.5921569, 1,
-0.1200814, -1.39237, -2.026205, 0, 1, 0.5960785, 1,
-0.1185503, 0.5203499, -1.326513, 0, 1, 0.6039216, 1,
-0.1168122, 1.288832, -1.264335, 0, 1, 0.6117647, 1,
-0.116313, -1.107096, -4.112207, 0, 1, 0.6156863, 1,
-0.1111399, -0.8450035, -3.062031, 0, 1, 0.6235294, 1,
-0.1106581, -1.86462, -1.653048, 0, 1, 0.627451, 1,
-0.1086422, -0.7866449, -3.073786, 0, 1, 0.6352941, 1,
-0.1048165, 0.1527716, 0.0899872, 0, 1, 0.6392157, 1,
-0.1034356, 0.7941092, 0.5526897, 0, 1, 0.6470588, 1,
-0.1029355, 0.4255844, 1.231505, 0, 1, 0.6509804, 1,
-0.09524617, 0.7369184, 0.8209641, 0, 1, 0.6588235, 1,
-0.09333856, 1.151397, -0.3358818, 0, 1, 0.6627451, 1,
-0.09026273, 0.02824393, -2.347361, 0, 1, 0.6705883, 1,
-0.0887322, -0.08992234, -2.401478, 0, 1, 0.6745098, 1,
-0.08773015, 1.315204, 1.255479, 0, 1, 0.682353, 1,
-0.0866091, -0.1516617, -4.150499, 0, 1, 0.6862745, 1,
-0.08652522, 0.6247305, 0.4755552, 0, 1, 0.6941177, 1,
-0.08188761, 1.709723, -0.4323427, 0, 1, 0.7019608, 1,
-0.07982931, -1.232035, -3.031396, 0, 1, 0.7058824, 1,
-0.0757061, -0.5720752, -4.286447, 0, 1, 0.7137255, 1,
-0.07195212, 0.2908844, -1.287788, 0, 1, 0.7176471, 1,
-0.0689657, 0.3587998, -0.4066268, 0, 1, 0.7254902, 1,
-0.06222159, 1.348188, 2.049999, 0, 1, 0.7294118, 1,
-0.06212154, -0.9335174, -2.558083, 0, 1, 0.7372549, 1,
-0.06006086, -0.4815959, -3.451546, 0, 1, 0.7411765, 1,
-0.05937979, 0.688708, 0.1941968, 0, 1, 0.7490196, 1,
-0.04972846, -0.2656425, -2.646944, 0, 1, 0.7529412, 1,
-0.04948839, -2.173702, -4.925159, 0, 1, 0.7607843, 1,
-0.04812224, 0.6038285, -1.056394, 0, 1, 0.7647059, 1,
-0.04666502, -1.780225, -2.56394, 0, 1, 0.772549, 1,
-0.03977653, -0.7242003, -3.862511, 0, 1, 0.7764706, 1,
-0.03666825, 0.9571864, 1.280132, 0, 1, 0.7843137, 1,
-0.03634015, -0.6504963, -5.423732, 0, 1, 0.7882353, 1,
-0.03559391, -1.367567, -2.766166, 0, 1, 0.7960784, 1,
-0.03504021, -1.487901, -3.171301, 0, 1, 0.8039216, 1,
-0.03487733, 0.01230767, -0.002304899, 0, 1, 0.8078431, 1,
-0.03238177, -0.8179017, -2.649195, 0, 1, 0.8156863, 1,
-0.02985414, -0.3238367, -3.628768, 0, 1, 0.8196079, 1,
-0.02838071, 0.6292681, 1.149813, 0, 1, 0.827451, 1,
-0.02746357, 0.09763403, -0.2442463, 0, 1, 0.8313726, 1,
-0.02636159, 0.4353035, 0.9882621, 0, 1, 0.8392157, 1,
-0.02554111, -0.4951663, -1.664884, 0, 1, 0.8431373, 1,
-0.02121653, 0.02373632, 0.6078308, 0, 1, 0.8509804, 1,
-0.02017059, -0.12417, -3.961468, 0, 1, 0.854902, 1,
-0.01721239, -1.35372, -2.783653, 0, 1, 0.8627451, 1,
-0.0170369, 1.231296, -0.1340677, 0, 1, 0.8666667, 1,
-0.01661556, -0.7781225, -3.40226, 0, 1, 0.8745098, 1,
-0.01503782, 0.5391276, -0.1662306, 0, 1, 0.8784314, 1,
-0.01242883, -0.2969288, -3.204789, 0, 1, 0.8862745, 1,
-0.003495572, -1.978146, -3.857312, 0, 1, 0.8901961, 1,
-0.002184642, -0.5851806, -1.827912, 0, 1, 0.8980392, 1,
-0.001635397, -1.356761, -4.047256, 0, 1, 0.9058824, 1,
-0.0001523385, -0.9132095, -1.403713, 0, 1, 0.9098039, 1,
0.001786544, -0.3804476, 2.114476, 0, 1, 0.9176471, 1,
0.003821576, 0.1890099, 0.7404926, 0, 1, 0.9215686, 1,
0.006031781, -0.995894, 4.276127, 0, 1, 0.9294118, 1,
0.006314186, -0.3367935, 2.032673, 0, 1, 0.9333333, 1,
0.007287728, -0.5084311, 2.8012, 0, 1, 0.9411765, 1,
0.01469282, -1.261786, 2.689325, 0, 1, 0.945098, 1,
0.01580872, -0.8041368, 2.388356, 0, 1, 0.9529412, 1,
0.01818633, -1.225321, 2.984527, 0, 1, 0.9568627, 1,
0.01941378, 1.553514, -0.7520619, 0, 1, 0.9647059, 1,
0.0248035, 0.3988551, 0.02215522, 0, 1, 0.9686275, 1,
0.02723141, 0.5410951, 0.4782947, 0, 1, 0.9764706, 1,
0.0298649, 0.1615383, 0.3528897, 0, 1, 0.9803922, 1,
0.03077845, -0.03108954, 1.551378, 0, 1, 0.9882353, 1,
0.03158809, -0.2970766, 2.820225, 0, 1, 0.9921569, 1,
0.0319242, 1.026115, -0.1772919, 0, 1, 1, 1,
0.03275144, -0.8602073, 4.244649, 0, 0.9921569, 1, 1,
0.03468704, 0.4628657, 0.2302974, 0, 0.9882353, 1, 1,
0.03623324, -0.8096352, 2.990664, 0, 0.9803922, 1, 1,
0.03841108, 1.861249, -1.474676, 0, 0.9764706, 1, 1,
0.04032702, 2.100624, -0.06529339, 0, 0.9686275, 1, 1,
0.0447835, 0.8252138, -3.001241, 0, 0.9647059, 1, 1,
0.04728081, 0.01094344, 2.778039, 0, 0.9568627, 1, 1,
0.050995, -0.02436565, 0.3245884, 0, 0.9529412, 1, 1,
0.0515295, -0.5579582, 3.762909, 0, 0.945098, 1, 1,
0.05580408, -0.3844281, 3.948115, 0, 0.9411765, 1, 1,
0.05791713, 0.7846735, 0.3906645, 0, 0.9333333, 1, 1,
0.05818369, -0.3365521, 2.361644, 0, 0.9294118, 1, 1,
0.05875569, -0.5895901, 1.053696, 0, 0.9215686, 1, 1,
0.06189897, 0.8681741, -2.133894, 0, 0.9176471, 1, 1,
0.06576987, -0.260969, 2.487807, 0, 0.9098039, 1, 1,
0.06582281, -0.2900012, 3.736028, 0, 0.9058824, 1, 1,
0.0667683, 0.4523242, 2.30125, 0, 0.8980392, 1, 1,
0.06993533, 1.378049, 1.727016, 0, 0.8901961, 1, 1,
0.07024045, -0.8526816, 1.897852, 0, 0.8862745, 1, 1,
0.07119077, -0.2155173, 1.337739, 0, 0.8784314, 1, 1,
0.07210878, -0.1514114, 2.537249, 0, 0.8745098, 1, 1,
0.07359574, 0.2968734, 0.6020896, 0, 0.8666667, 1, 1,
0.07713446, 0.07084559, 1.423665, 0, 0.8627451, 1, 1,
0.07944891, -1.065638, 0.639553, 0, 0.854902, 1, 1,
0.07959553, -0.4265367, 3.881204, 0, 0.8509804, 1, 1,
0.08154068, -0.7685495, 1.171319, 0, 0.8431373, 1, 1,
0.0840477, 0.6746333, 0.8889797, 0, 0.8392157, 1, 1,
0.08832034, -0.1239501, 3.796975, 0, 0.8313726, 1, 1,
0.08889902, 0.9497071, -0.5977198, 0, 0.827451, 1, 1,
0.08968922, -0.0564632, 1.516485, 0, 0.8196079, 1, 1,
0.09157702, -0.2433498, 1.721697, 0, 0.8156863, 1, 1,
0.09367135, -0.03572387, 3.141094, 0, 0.8078431, 1, 1,
0.1003506, -1.114601, 3.790127, 0, 0.8039216, 1, 1,
0.1048757, -0.02690608, 1.300195, 0, 0.7960784, 1, 1,
0.1063691, -0.4418264, 2.062124, 0, 0.7882353, 1, 1,
0.1084227, 0.3596562, 0.003640137, 0, 0.7843137, 1, 1,
0.1109715, -0.09351747, 2.39767, 0, 0.7764706, 1, 1,
0.1115144, 0.601564, 0.7961891, 0, 0.772549, 1, 1,
0.1150465, -2.260122, 1.731053, 0, 0.7647059, 1, 1,
0.1189372, 0.8758978, 0.3033252, 0, 0.7607843, 1, 1,
0.1222118, 1.558788, 1.501457, 0, 0.7529412, 1, 1,
0.1256581, -0.3039842, 1.89614, 0, 0.7490196, 1, 1,
0.1293173, 2.461607, 1.528673, 0, 0.7411765, 1, 1,
0.1310408, -0.7573464, 3.641418, 0, 0.7372549, 1, 1,
0.1319779, 0.02392633, 0.06191596, 0, 0.7294118, 1, 1,
0.1343057, 0.4946752, 2.194051, 0, 0.7254902, 1, 1,
0.1372668, -0.09552091, 0.2189421, 0, 0.7176471, 1, 1,
0.1378079, 0.03699623, 2.497643, 0, 0.7137255, 1, 1,
0.1391527, 0.8044804, 0.1712321, 0, 0.7058824, 1, 1,
0.1404981, 0.5296764, 1.456827, 0, 0.6980392, 1, 1,
0.1525662, -0.9118114, 3.642605, 0, 0.6941177, 1, 1,
0.1538814, -2.172106, 4.679142, 0, 0.6862745, 1, 1,
0.1539215, 0.01463395, 0.9463704, 0, 0.682353, 1, 1,
0.1543341, -1.344002, 2.855232, 0, 0.6745098, 1, 1,
0.1551029, -0.6310543, 1.923917, 0, 0.6705883, 1, 1,
0.1553444, 0.508206, 0.02614693, 0, 0.6627451, 1, 1,
0.1563953, 0.03050051, 1.899903, 0, 0.6588235, 1, 1,
0.1577366, -0.4835204, 1.805257, 0, 0.6509804, 1, 1,
0.1647106, 0.03319498, 3.227335, 0, 0.6470588, 1, 1,
0.1648273, 2.422649, -0.1259568, 0, 0.6392157, 1, 1,
0.1678842, 0.204767, 0.8200194, 0, 0.6352941, 1, 1,
0.1716664, -1.458731, 1.485476, 0, 0.627451, 1, 1,
0.1736201, -0.7349777, 2.370495, 0, 0.6235294, 1, 1,
0.1743561, -1.174475, 2.341983, 0, 0.6156863, 1, 1,
0.1752876, -0.4262064, 2.465199, 0, 0.6117647, 1, 1,
0.1757698, -0.7171329, 3.222639, 0, 0.6039216, 1, 1,
0.176029, -0.6438248, 3.69671, 0, 0.5960785, 1, 1,
0.181707, -0.3177706, 1.9453, 0, 0.5921569, 1, 1,
0.1835111, 1.436585, -0.01055506, 0, 0.5843138, 1, 1,
0.1855728, 0.5825101, 2.413316, 0, 0.5803922, 1, 1,
0.1871122, -0.2299495, 2.990441, 0, 0.572549, 1, 1,
0.1873687, -0.1905026, 2.149831, 0, 0.5686275, 1, 1,
0.1966699, 1.161243, 0.5889767, 0, 0.5607843, 1, 1,
0.1970271, 0.746306, 1.927749, 0, 0.5568628, 1, 1,
0.2036681, 0.3413086, -0.5257573, 0, 0.5490196, 1, 1,
0.206026, 0.04012069, 0.3873689, 0, 0.5450981, 1, 1,
0.2071334, -0.6977932, 2.351057, 0, 0.5372549, 1, 1,
0.2095279, 0.02765291, 0.6626502, 0, 0.5333334, 1, 1,
0.2098028, 0.7709522, 0.08301871, 0, 0.5254902, 1, 1,
0.2123025, -0.4336989, 2.338654, 0, 0.5215687, 1, 1,
0.2144017, -0.0876976, 2.347491, 0, 0.5137255, 1, 1,
0.2144869, -0.02275614, 2.866533, 0, 0.509804, 1, 1,
0.2171426, 1.263678, 0.8762445, 0, 0.5019608, 1, 1,
0.2179055, 0.2894363, -0.4682056, 0, 0.4941176, 1, 1,
0.2270204, 0.05495248, 1.905935, 0, 0.4901961, 1, 1,
0.2299707, -1.077879, 1.485761, 0, 0.4823529, 1, 1,
0.2331574, 0.1917001, 1.078781, 0, 0.4784314, 1, 1,
0.2334131, -1.234795, 2.810992, 0, 0.4705882, 1, 1,
0.2343311, -0.7477459, 2.502188, 0, 0.4666667, 1, 1,
0.2367547, -1.153055, 4.017494, 0, 0.4588235, 1, 1,
0.2407408, 0.7003731, 0.2776354, 0, 0.454902, 1, 1,
0.2460497, 1.618034, 0.01148429, 0, 0.4470588, 1, 1,
0.246825, 0.5188246, -0.05134313, 0, 0.4431373, 1, 1,
0.2469306, -0.3465219, 2.808919, 0, 0.4352941, 1, 1,
0.2487431, 0.2638099, 1.834149, 0, 0.4313726, 1, 1,
0.2503918, 0.3979101, 0.04608635, 0, 0.4235294, 1, 1,
0.2589594, 0.6477432, 1.199032, 0, 0.4196078, 1, 1,
0.2685811, 0.4496809, 0.2837489, 0, 0.4117647, 1, 1,
0.2717118, 0.4302416, 0.9429345, 0, 0.4078431, 1, 1,
0.2746838, -1.820192, 1.757978, 0, 0.4, 1, 1,
0.2785192, 0.8479294, 1.097262, 0, 0.3921569, 1, 1,
0.2799562, 0.6120617, 0.3372325, 0, 0.3882353, 1, 1,
0.2801715, 0.3742208, 1.831202, 0, 0.3803922, 1, 1,
0.2807226, -0.8086277, 1.816086, 0, 0.3764706, 1, 1,
0.2811065, -0.1049404, 1.760297, 0, 0.3686275, 1, 1,
0.2832786, -1.232344, 3.066322, 0, 0.3647059, 1, 1,
0.2835459, 0.5351966, -0.03523155, 0, 0.3568628, 1, 1,
0.2849491, 0.3269435, 1.15307, 0, 0.3529412, 1, 1,
0.2885598, 0.7361193, -0.7964455, 0, 0.345098, 1, 1,
0.2938082, -1.815786, 5.247247, 0, 0.3411765, 1, 1,
0.3018213, -0.3119031, 1.9302, 0, 0.3333333, 1, 1,
0.305034, -0.2846366, 2.846861, 0, 0.3294118, 1, 1,
0.3060779, -0.5119374, 3.091497, 0, 0.3215686, 1, 1,
0.3099974, 0.8161865, 1.109757, 0, 0.3176471, 1, 1,
0.3108592, 0.848912, 2.82588, 0, 0.3098039, 1, 1,
0.3110059, -0.8267065, 3.17043, 0, 0.3058824, 1, 1,
0.3130089, -0.7660982, 3.156336, 0, 0.2980392, 1, 1,
0.3172816, -1.433592, 4.367209, 0, 0.2901961, 1, 1,
0.3185048, -2.036846, 3.574786, 0, 0.2862745, 1, 1,
0.3185968, 0.8810962, -0.1502752, 0, 0.2784314, 1, 1,
0.3191796, 0.4628969, 1.444166, 0, 0.2745098, 1, 1,
0.3199316, -0.05032666, 0.5160679, 0, 0.2666667, 1, 1,
0.331535, 0.9390015, 1.84763, 0, 0.2627451, 1, 1,
0.3331945, 1.391044, 2.034103, 0, 0.254902, 1, 1,
0.334453, -0.09605817, 0.5756839, 0, 0.2509804, 1, 1,
0.3378372, 0.7540343, -0.06681825, 0, 0.2431373, 1, 1,
0.3390519, -0.02350514, 1.240231, 0, 0.2392157, 1, 1,
0.3394797, -1.571951, 2.306771, 0, 0.2313726, 1, 1,
0.3440748, -1.042619, 3.005215, 0, 0.227451, 1, 1,
0.3457836, -1.851902, 2.512423, 0, 0.2196078, 1, 1,
0.3523185, -0.2756665, 1.906451, 0, 0.2156863, 1, 1,
0.3570653, 0.6380469, 0.1763707, 0, 0.2078431, 1, 1,
0.3579366, -1.206762, 3.06046, 0, 0.2039216, 1, 1,
0.3663099, 0.3116928, 0.132692, 0, 0.1960784, 1, 1,
0.3729148, 0.068358, 1.531466, 0, 0.1882353, 1, 1,
0.3746747, 1.042388, -0.4729556, 0, 0.1843137, 1, 1,
0.3767492, 0.05571365, 0.1052886, 0, 0.1764706, 1, 1,
0.382553, 1.814054, -0.1268582, 0, 0.172549, 1, 1,
0.3900146, 0.9158539, 0.2384038, 0, 0.1647059, 1, 1,
0.3910126, -0.3063884, 2.597232, 0, 0.1607843, 1, 1,
0.3920544, 1.44614, 0.0110998, 0, 0.1529412, 1, 1,
0.3932152, -0.5866511, 1.64428, 0, 0.1490196, 1, 1,
0.395244, 0.8273247, 0.3784155, 0, 0.1411765, 1, 1,
0.4027372, -0.7808573, 2.903735, 0, 0.1372549, 1, 1,
0.4047429, 0.09413949, 0.8416959, 0, 0.1294118, 1, 1,
0.4107206, -1.061207, 1.293654, 0, 0.1254902, 1, 1,
0.4141883, 0.04684856, 1.09289, 0, 0.1176471, 1, 1,
0.4194084, -0.9265222, 1.614416, 0, 0.1137255, 1, 1,
0.4209034, -0.06120143, 0.738138, 0, 0.1058824, 1, 1,
0.4256645, 2.03788, -0.5517754, 0, 0.09803922, 1, 1,
0.4258162, -0.9739695, 2.890754, 0, 0.09411765, 1, 1,
0.4258559, 0.1803031, 1.20747, 0, 0.08627451, 1, 1,
0.4311914, -0.9176114, 4.689887, 0, 0.08235294, 1, 1,
0.4315855, 0.8869638, -0.4276924, 0, 0.07450981, 1, 1,
0.432538, -0.602913, 3.616965, 0, 0.07058824, 1, 1,
0.4338662, -1.176777, 3.485029, 0, 0.0627451, 1, 1,
0.4402856, 1.03287, -0.7383294, 0, 0.05882353, 1, 1,
0.4409428, 0.3385103, 0.07204711, 0, 0.05098039, 1, 1,
0.4447603, -1.800411, 3.148292, 0, 0.04705882, 1, 1,
0.4461398, 1.48351, -0.0002638243, 0, 0.03921569, 1, 1,
0.4522298, -1.254795, 3.541093, 0, 0.03529412, 1, 1,
0.4551415, -1.796076, 3.491393, 0, 0.02745098, 1, 1,
0.4553817, -0.7622705, 3.22458, 0, 0.02352941, 1, 1,
0.4631186, 1.26503, 0.6299713, 0, 0.01568628, 1, 1,
0.4639765, 1.078184, -0.1925704, 0, 0.01176471, 1, 1,
0.4762518, -0.6219283, 2.773652, 0, 0.003921569, 1, 1,
0.4763475, -0.1398165, 3.005434, 0.003921569, 0, 1, 1,
0.483565, -1.320025, 2.376156, 0.007843138, 0, 1, 1,
0.4843515, -1.308148, 2.751302, 0.01568628, 0, 1, 1,
0.4860432, 0.4703067, 0.4338234, 0.01960784, 0, 1, 1,
0.4958318, 0.809321, 0.6782303, 0.02745098, 0, 1, 1,
0.4970455, 0.4607421, -0.1150068, 0.03137255, 0, 1, 1,
0.4982275, -0.6800948, 1.562743, 0.03921569, 0, 1, 1,
0.500759, 1.137788, 2.681086, 0.04313726, 0, 1, 1,
0.5094651, 2.072973, 0.7553469, 0.05098039, 0, 1, 1,
0.5102983, 0.8678404, 0.1203551, 0.05490196, 0, 1, 1,
0.5133541, -0.7215872, 1.385628, 0.0627451, 0, 1, 1,
0.5150745, -1.181694, 2.278885, 0.06666667, 0, 1, 1,
0.5159417, -1.155858, 1.97472, 0.07450981, 0, 1, 1,
0.5190205, -0.2936774, 3.181844, 0.07843138, 0, 1, 1,
0.5208099, 0.6058546, 0.04689678, 0.08627451, 0, 1, 1,
0.5237257, 0.8852164, 0.8910548, 0.09019608, 0, 1, 1,
0.5283133, -0.5703614, -0.50595, 0.09803922, 0, 1, 1,
0.5293825, 0.930979, -0.2143391, 0.1058824, 0, 1, 1,
0.5364357, -2.070462, 3.884394, 0.1098039, 0, 1, 1,
0.5379859, 0.1430625, 1.469673, 0.1176471, 0, 1, 1,
0.5439537, -1.068037, 2.572429, 0.1215686, 0, 1, 1,
0.5459817, 0.6632807, -1.662358, 0.1294118, 0, 1, 1,
0.5483438, -0.8514373, 2.65227, 0.1333333, 0, 1, 1,
0.5490178, -0.09166044, 1.406969, 0.1411765, 0, 1, 1,
0.550405, 0.9816439, 0.1012155, 0.145098, 0, 1, 1,
0.5524864, 0.8464289, 1.839679, 0.1529412, 0, 1, 1,
0.5527724, -0.1523061, 1.649665, 0.1568628, 0, 1, 1,
0.5546151, -0.6095884, 1.559079, 0.1647059, 0, 1, 1,
0.5629627, 0.7879446, -0.410267, 0.1686275, 0, 1, 1,
0.5656912, -1.071996, 2.005008, 0.1764706, 0, 1, 1,
0.5657292, -1.070586, 2.772363, 0.1803922, 0, 1, 1,
0.569346, 2.00475, -0.1944022, 0.1882353, 0, 1, 1,
0.5693766, 0.5727129, 0.3371889, 0.1921569, 0, 1, 1,
0.5701852, 0.8719882, 0.6211807, 0.2, 0, 1, 1,
0.5703818, -0.08378001, -0.8666621, 0.2078431, 0, 1, 1,
0.5706089, -0.4619772, 3.519508, 0.2117647, 0, 1, 1,
0.5719733, 0.9336808, -0.34881, 0.2196078, 0, 1, 1,
0.5724306, -0.2961175, 1.854277, 0.2235294, 0, 1, 1,
0.5753891, 0.3594914, 1.086681, 0.2313726, 0, 1, 1,
0.5765579, -1.814449, 1.900345, 0.2352941, 0, 1, 1,
0.5766537, -1.633391, 1.560415, 0.2431373, 0, 1, 1,
0.5873107, -0.08797687, 1.373397, 0.2470588, 0, 1, 1,
0.5887426, -0.1902566, 1.88742, 0.254902, 0, 1, 1,
0.5894707, 0.6481919, 0.2137436, 0.2588235, 0, 1, 1,
0.5903394, -1.111916, 2.747517, 0.2666667, 0, 1, 1,
0.5917689, 1.562824, -0.4509164, 0.2705882, 0, 1, 1,
0.5943198, 0.4633564, 0.8750102, 0.2784314, 0, 1, 1,
0.5975246, 2.608412, 1.294167, 0.282353, 0, 1, 1,
0.6006755, -1.265808, 2.190791, 0.2901961, 0, 1, 1,
0.601258, 0.5604607, 0.5465079, 0.2941177, 0, 1, 1,
0.6014537, -0.6528305, 2.227346, 0.3019608, 0, 1, 1,
0.6025594, -0.9804837, 4.26099, 0.3098039, 0, 1, 1,
0.6035582, 0.6923156, 0.670862, 0.3137255, 0, 1, 1,
0.6104714, 2.15444, 0.311397, 0.3215686, 0, 1, 1,
0.6202193, -0.6121578, 2.732112, 0.3254902, 0, 1, 1,
0.6216396, 1.127855, -0.5748509, 0.3333333, 0, 1, 1,
0.6257102, 1.044032, 0.9068474, 0.3372549, 0, 1, 1,
0.6274614, -0.1712304, 2.466768, 0.345098, 0, 1, 1,
0.6384482, -0.2938886, 0.3928758, 0.3490196, 0, 1, 1,
0.6439318, 0.7442667, 0.525633, 0.3568628, 0, 1, 1,
0.6472577, 0.6327493, 1.552702, 0.3607843, 0, 1, 1,
0.6527643, 1.304494, 1.843079, 0.3686275, 0, 1, 1,
0.6535273, -0.1025093, 1.305738, 0.372549, 0, 1, 1,
0.6563116, 0.1793208, 1.062447, 0.3803922, 0, 1, 1,
0.6574906, 0.9660878, -0.3930297, 0.3843137, 0, 1, 1,
0.6629674, -0.4199584, 1.502477, 0.3921569, 0, 1, 1,
0.6671609, 0.1095796, 0.3763407, 0.3960784, 0, 1, 1,
0.6692643, 0.6026866, 1.783532, 0.4039216, 0, 1, 1,
0.6733698, -0.3771911, 1.814821, 0.4117647, 0, 1, 1,
0.6831689, -0.9195303, 4.381376, 0.4156863, 0, 1, 1,
0.6876974, 1.676296, -0.1528565, 0.4235294, 0, 1, 1,
0.6978341, 0.498917, 0.5557148, 0.427451, 0, 1, 1,
0.7021249, -0.3634322, 1.345063, 0.4352941, 0, 1, 1,
0.703913, 2.180731, 1.792022, 0.4392157, 0, 1, 1,
0.7041504, 1.404408, 0.3795672, 0.4470588, 0, 1, 1,
0.7068792, 0.5816021, 0.1354823, 0.4509804, 0, 1, 1,
0.7098445, -1.169573, 4.813357, 0.4588235, 0, 1, 1,
0.7101134, 0.002044206, 0.4143468, 0.4627451, 0, 1, 1,
0.7119226, 0.808785, 1.305421, 0.4705882, 0, 1, 1,
0.7129478, 0.3043182, 0.2387118, 0.4745098, 0, 1, 1,
0.713777, -0.786956, 2.478252, 0.4823529, 0, 1, 1,
0.7140123, -0.655326, 2.287988, 0.4862745, 0, 1, 1,
0.718562, 0.1605695, 0.7146482, 0.4941176, 0, 1, 1,
0.7239274, -1.914308, 2.953974, 0.5019608, 0, 1, 1,
0.7273055, -0.2045397, 1.653897, 0.5058824, 0, 1, 1,
0.7297781, -1.633926, 2.60329, 0.5137255, 0, 1, 1,
0.7298148, -0.5124004, 1.35019, 0.5176471, 0, 1, 1,
0.7306182, 1.310295, -0.09545822, 0.5254902, 0, 1, 1,
0.7347145, -0.2257002, 1.571308, 0.5294118, 0, 1, 1,
0.7392243, 0.3890342, 1.03071, 0.5372549, 0, 1, 1,
0.7398412, -1.245103, 2.534484, 0.5411765, 0, 1, 1,
0.7406767, -0.172907, 0.8754131, 0.5490196, 0, 1, 1,
0.7499656, -0.8999412, 1.725539, 0.5529412, 0, 1, 1,
0.7545955, 2.173148, 0.3412603, 0.5607843, 0, 1, 1,
0.7578118, -0.6207753, 2.213243, 0.5647059, 0, 1, 1,
0.7586213, 1.451498, 1.406221, 0.572549, 0, 1, 1,
0.758948, 0.8178971, 1.601777, 0.5764706, 0, 1, 1,
0.7618992, 0.3471754, 1.948726, 0.5843138, 0, 1, 1,
0.7678685, -1.196648, 3.594386, 0.5882353, 0, 1, 1,
0.7809305, -0.9923508, 2.85025, 0.5960785, 0, 1, 1,
0.782886, -0.6260756, 1.864474, 0.6039216, 0, 1, 1,
0.786738, -1.493538, 1.780335, 0.6078432, 0, 1, 1,
0.7884597, 0.9668961, 2.098552, 0.6156863, 0, 1, 1,
0.7906653, 1.429417, 1.72393, 0.6196079, 0, 1, 1,
0.7920673, 0.1833221, 2.212687, 0.627451, 0, 1, 1,
0.7926443, -0.5061249, 2.618289, 0.6313726, 0, 1, 1,
0.7954202, 0.8666948, 0.386613, 0.6392157, 0, 1, 1,
0.8000109, -0.7577342, 1.816262, 0.6431373, 0, 1, 1,
0.8002617, 1.504193, 1.147022, 0.6509804, 0, 1, 1,
0.8006224, -0.4417543, 2.501564, 0.654902, 0, 1, 1,
0.8011898, -0.08490939, 3.652385, 0.6627451, 0, 1, 1,
0.8052189, -0.7661521, 2.757146, 0.6666667, 0, 1, 1,
0.8073594, 0.3820023, 1.305849, 0.6745098, 0, 1, 1,
0.8095347, -0.5716318, 1.479425, 0.6784314, 0, 1, 1,
0.8143808, 1.435711, 1.429851, 0.6862745, 0, 1, 1,
0.8156783, 1.586424, 0.09597757, 0.6901961, 0, 1, 1,
0.8162249, -0.7798495, 1.151745, 0.6980392, 0, 1, 1,
0.8175089, -0.4795654, 1.474735, 0.7058824, 0, 1, 1,
0.821182, 1.062824, -0.8727884, 0.7098039, 0, 1, 1,
0.8222423, 0.1164618, 1.327965, 0.7176471, 0, 1, 1,
0.823114, 0.7292541, 0.9066986, 0.7215686, 0, 1, 1,
0.8287734, -0.359145, 2.18106, 0.7294118, 0, 1, 1,
0.8314077, -0.2688233, 1.928499, 0.7333333, 0, 1, 1,
0.8346709, -0.5489076, 2.417405, 0.7411765, 0, 1, 1,
0.8418254, 0.8206328, 1.309812, 0.7450981, 0, 1, 1,
0.8482659, -2.011017, 4.507986, 0.7529412, 0, 1, 1,
0.8485807, 0.5272257, 2.716155, 0.7568628, 0, 1, 1,
0.8543647, 0.5318912, 0.06765509, 0.7647059, 0, 1, 1,
0.8554717, -0.2077188, 2.260603, 0.7686275, 0, 1, 1,
0.8571562, -0.2406883, 0.8100426, 0.7764706, 0, 1, 1,
0.8639343, -0.9097359, 1.353448, 0.7803922, 0, 1, 1,
0.864704, -0.7550672, 2.417082, 0.7882353, 0, 1, 1,
0.8655421, 0.2320859, -0.1250803, 0.7921569, 0, 1, 1,
0.8675819, -0.5581384, 1.129893, 0.8, 0, 1, 1,
0.8678276, -1.076662, 3.915771, 0.8078431, 0, 1, 1,
0.8767782, 1.495853, 0.1640508, 0.8117647, 0, 1, 1,
0.8781902, 1.262726, 0.5703188, 0.8196079, 0, 1, 1,
0.8824211, -0.03898887, -1.34661, 0.8235294, 0, 1, 1,
0.8899599, -0.425415, 2.658677, 0.8313726, 0, 1, 1,
0.8907859, 2.959338, -0.3156716, 0.8352941, 0, 1, 1,
0.8912745, -0.06004491, 0.2930252, 0.8431373, 0, 1, 1,
0.8953975, -1.701104, 2.533377, 0.8470588, 0, 1, 1,
0.8963071, -0.683577, 2.607345, 0.854902, 0, 1, 1,
0.9242486, -0.2800827, 2.80853, 0.8588235, 0, 1, 1,
0.925256, 0.6530683, 1.541778, 0.8666667, 0, 1, 1,
0.9259212, -0.9026093, 2.845128, 0.8705882, 0, 1, 1,
0.9289964, -1.094421, 3.201, 0.8784314, 0, 1, 1,
0.9323772, 1.4989, 1.582951, 0.8823529, 0, 1, 1,
0.9327587, 0.4351388, -0.6895829, 0.8901961, 0, 1, 1,
0.9339206, 0.2313046, 1.686711, 0.8941177, 0, 1, 1,
0.9371727, 1.020613, 3.364402, 0.9019608, 0, 1, 1,
0.9399698, 1.333693, 0.3713111, 0.9098039, 0, 1, 1,
0.9416842, -0.07773246, 0.7743014, 0.9137255, 0, 1, 1,
0.9429914, 0.6038004, -0.154836, 0.9215686, 0, 1, 1,
0.943342, 0.4299319, 0.8475089, 0.9254902, 0, 1, 1,
0.9444091, 0.6519354, 2.303543, 0.9333333, 0, 1, 1,
0.9518798, 0.713868, 1.861483, 0.9372549, 0, 1, 1,
0.9547108, -0.4692436, 1.030467, 0.945098, 0, 1, 1,
0.9563832, 0.04550898, 0.5770311, 0.9490196, 0, 1, 1,
0.9594468, -0.8737576, 1.039502, 0.9568627, 0, 1, 1,
0.9603162, 0.3643783, -0.2580394, 0.9607843, 0, 1, 1,
0.9626775, 0.07149661, 0.2900306, 0.9686275, 0, 1, 1,
0.9712024, 0.2616035, 0.6845315, 0.972549, 0, 1, 1,
0.9719663, 0.5251138, 0.136346, 0.9803922, 0, 1, 1,
0.9729151, 0.4780557, 2.135694, 0.9843137, 0, 1, 1,
0.9731213, 0.2827004, 0.7498085, 0.9921569, 0, 1, 1,
0.9764224, -0.3370509, 3.048175, 0.9960784, 0, 1, 1,
0.9776772, 0.07428808, 0.6842659, 1, 0, 0.9960784, 1,
0.9784828, 0.6973935, 0.8312533, 1, 0, 0.9882353, 1,
0.979398, -0.6433846, 1.060477, 1, 0, 0.9843137, 1,
0.9795436, 2.174543, 0.703841, 1, 0, 0.9764706, 1,
0.987009, 1.048031, 0.4134013, 1, 0, 0.972549, 1,
0.9956767, 0.3052986, 0.2414764, 1, 0, 0.9647059, 1,
0.9961301, 2.054367, 1.82908, 1, 0, 0.9607843, 1,
0.9962775, 1.229611, 0.4590125, 1, 0, 0.9529412, 1,
0.9966389, -2.331079, 1.668215, 1, 0, 0.9490196, 1,
1.006784, 0.8193629, 1.147987, 1, 0, 0.9411765, 1,
1.006972, -1.646825, 2.411051, 1, 0, 0.9372549, 1,
1.013487, -0.07605674, 2.642568, 1, 0, 0.9294118, 1,
1.015153, 0.9787796, 0.4388805, 1, 0, 0.9254902, 1,
1.019327, 0.421403, 0.2959497, 1, 0, 0.9176471, 1,
1.02686, -0.4197226, 1.114982, 1, 0, 0.9137255, 1,
1.026905, 0.5503468, 1.064062, 1, 0, 0.9058824, 1,
1.03033, 0.06753911, 2.00892, 1, 0, 0.9019608, 1,
1.030782, 0.4208801, 0.292466, 1, 0, 0.8941177, 1,
1.035926, 1.424769, 0.6326227, 1, 0, 0.8862745, 1,
1.037735, -0.4475147, 1.254043, 1, 0, 0.8823529, 1,
1.044448, -0.6347698, 2.972342, 1, 0, 0.8745098, 1,
1.049688, -0.5957628, 0.8597037, 1, 0, 0.8705882, 1,
1.050275, 0.921401, 1.19363, 1, 0, 0.8627451, 1,
1.054151, 0.6617002, 0.08355408, 1, 0, 0.8588235, 1,
1.064523, 0.9025363, 1.991766, 1, 0, 0.8509804, 1,
1.064601, 0.2477659, 2.321877, 1, 0, 0.8470588, 1,
1.06721, 1.712341, 0.8333486, 1, 0, 0.8392157, 1,
1.067468, 1.134943, 0.4153304, 1, 0, 0.8352941, 1,
1.068374, -0.2911234, 1.835911, 1, 0, 0.827451, 1,
1.073094, -1.445248, 2.681844, 1, 0, 0.8235294, 1,
1.086575, -1.217079, 2.490355, 1, 0, 0.8156863, 1,
1.086715, -0.2037584, 1.260622, 1, 0, 0.8117647, 1,
1.091473, 0.1610962, 1.575759, 1, 0, 0.8039216, 1,
1.092536, -1.457463, 2.786556, 1, 0, 0.7960784, 1,
1.107427, -0.5698175, 2.263542, 1, 0, 0.7921569, 1,
1.112342, -0.06260008, 0.9192943, 1, 0, 0.7843137, 1,
1.118023, -0.3003761, 0.691829, 1, 0, 0.7803922, 1,
1.118326, 0.4345493, 1.078935, 1, 0, 0.772549, 1,
1.125273, 0.7759486, 0.2471698, 1, 0, 0.7686275, 1,
1.126826, 0.8806422, -1.15391, 1, 0, 0.7607843, 1,
1.12851, -1.068073, 2.792553, 1, 0, 0.7568628, 1,
1.131747, 0.2733344, 2.072607, 1, 0, 0.7490196, 1,
1.137187, 0.4944177, 1.048643, 1, 0, 0.7450981, 1,
1.138307, -0.1473622, 3.77465, 1, 0, 0.7372549, 1,
1.139426, 1.2419, 0.7516524, 1, 0, 0.7333333, 1,
1.140791, 1.208363, -1.557042, 1, 0, 0.7254902, 1,
1.143465, 0.7502272, 0.3798324, 1, 0, 0.7215686, 1,
1.153477, 1.043456, 0.4173327, 1, 0, 0.7137255, 1,
1.16387, 0.2665832, 1.973398, 1, 0, 0.7098039, 1,
1.164053, -1.873442, 1.985911, 1, 0, 0.7019608, 1,
1.167642, -0.789722, 0.8005595, 1, 0, 0.6941177, 1,
1.169254, -0.4625199, 1.688307, 1, 0, 0.6901961, 1,
1.171388, -1.402601, 1.678914, 1, 0, 0.682353, 1,
1.186401, 0.1874577, -0.3467552, 1, 0, 0.6784314, 1,
1.18769, 1.202301, 0.3353911, 1, 0, 0.6705883, 1,
1.192091, -0.9655908, 3.071336, 1, 0, 0.6666667, 1,
1.197091, -0.8759001, 0.9174295, 1, 0, 0.6588235, 1,
1.206935, -1.74996, 1.957109, 1, 0, 0.654902, 1,
1.210658, 1.938563, 0.6293679, 1, 0, 0.6470588, 1,
1.212872, 0.8694489, 2.052308, 1, 0, 0.6431373, 1,
1.218084, -1.770333, 3.134777, 1, 0, 0.6352941, 1,
1.220485, 1.05632, 1.805134, 1, 0, 0.6313726, 1,
1.221922, 0.5923437, 2.050439, 1, 0, 0.6235294, 1,
1.223761, -0.3701502, 2.021482, 1, 0, 0.6196079, 1,
1.224305, -1.220068, 2.593637, 1, 0, 0.6117647, 1,
1.22581, -1.279658, 2.74532, 1, 0, 0.6078432, 1,
1.230244, 0.3325959, 2.879235, 1, 0, 0.6, 1,
1.232896, -0.4590042, 3.052409, 1, 0, 0.5921569, 1,
1.233958, -2.404457, 2.142629, 1, 0, 0.5882353, 1,
1.23624, -0.4267204, 1.645483, 1, 0, 0.5803922, 1,
1.243173, 0.9299163, 0.7612358, 1, 0, 0.5764706, 1,
1.24383, 1.013064, 1.637815, 1, 0, 0.5686275, 1,
1.251917, -1.743035, 1.686614, 1, 0, 0.5647059, 1,
1.281701, -0.1507175, 2.293996, 1, 0, 0.5568628, 1,
1.282661, -0.6283419, 2.729122, 1, 0, 0.5529412, 1,
1.287425, 0.1316017, 1.721193, 1, 0, 0.5450981, 1,
1.29154, 1.189476, 0.7636927, 1, 0, 0.5411765, 1,
1.293629, -0.1908024, 2.016042, 1, 0, 0.5333334, 1,
1.295378, 1.453953, 1.516208, 1, 0, 0.5294118, 1,
1.306203, 1.26644, 0.7939721, 1, 0, 0.5215687, 1,
1.311761, -0.01167754, 1.168298, 1, 0, 0.5176471, 1,
1.332063, -0.2891184, 1.256768, 1, 0, 0.509804, 1,
1.332793, -1.059846, 3.019886, 1, 0, 0.5058824, 1,
1.335407, -0.635978, 1.085498, 1, 0, 0.4980392, 1,
1.350852, -1.856425, 2.61746, 1, 0, 0.4901961, 1,
1.362024, -0.5866315, 1.863333, 1, 0, 0.4862745, 1,
1.367666, 1.676592, 1.163193, 1, 0, 0.4784314, 1,
1.36866, 1.477618, 1.17916, 1, 0, 0.4745098, 1,
1.37486, 0.2557865, -0.2557774, 1, 0, 0.4666667, 1,
1.381108, -0.3276753, 1.506305, 1, 0, 0.4627451, 1,
1.38179, 0.6127458, 3.414349, 1, 0, 0.454902, 1,
1.38563, -0.1505697, 1.353103, 1, 0, 0.4509804, 1,
1.391919, -2.266433, 2.904234, 1, 0, 0.4431373, 1,
1.396623, 0.6576028, 0.5193352, 1, 0, 0.4392157, 1,
1.40171, -0.2316467, 1.299276, 1, 0, 0.4313726, 1,
1.405253, 0.9860241, 0.4664437, 1, 0, 0.427451, 1,
1.409685, -1.206138, 2.293698, 1, 0, 0.4196078, 1,
1.423228, -0.880954, 2.596978, 1, 0, 0.4156863, 1,
1.424114, -0.3418968, 2.286423, 1, 0, 0.4078431, 1,
1.435993, 1.080175, 0.7615712, 1, 0, 0.4039216, 1,
1.442988, 1.133073, -0.4071283, 1, 0, 0.3960784, 1,
1.459768, -0.265334, 2.77711, 1, 0, 0.3882353, 1,
1.467278, 0.5134214, 1.030383, 1, 0, 0.3843137, 1,
1.477722, 0.9703587, 1.520705, 1, 0, 0.3764706, 1,
1.483631, 0.6686021, 1.118602, 1, 0, 0.372549, 1,
1.494664, 0.3389654, -0.417636, 1, 0, 0.3647059, 1,
1.502325, -0.5307489, 1.516818, 1, 0, 0.3607843, 1,
1.508866, 0.9716925, 2.254123, 1, 0, 0.3529412, 1,
1.509655, -0.1570687, 0.2173745, 1, 0, 0.3490196, 1,
1.513714, 0.6330636, 0.4319498, 1, 0, 0.3411765, 1,
1.534813, 0.2229723, 2.935884, 1, 0, 0.3372549, 1,
1.536553, 0.2369366, 0.9123926, 1, 0, 0.3294118, 1,
1.548738, 0.3154059, 2.439391, 1, 0, 0.3254902, 1,
1.572443, -0.3220362, 3.322795, 1, 0, 0.3176471, 1,
1.584707, -0.4162437, 2.649034, 1, 0, 0.3137255, 1,
1.593351, -1.910169, 1.850757, 1, 0, 0.3058824, 1,
1.60254, 0.4552588, 0.8300049, 1, 0, 0.2980392, 1,
1.620961, 0.39645, 2.58496, 1, 0, 0.2941177, 1,
1.621139, 0.0659905, 1.639265, 1, 0, 0.2862745, 1,
1.656764, -0.7926626, 2.014151, 1, 0, 0.282353, 1,
1.671971, 1.288108, 0.6957788, 1, 0, 0.2745098, 1,
1.69057, -0.6502495, 2.637299, 1, 0, 0.2705882, 1,
1.703884, 0.0839975, 1.766491, 1, 0, 0.2627451, 1,
1.703939, -0.6111972, 2.799416, 1, 0, 0.2588235, 1,
1.71626, 1.957913, 2.17855, 1, 0, 0.2509804, 1,
1.724401, -0.5428515, 0.6614441, 1, 0, 0.2470588, 1,
1.731885, -0.848792, 1.825904, 1, 0, 0.2392157, 1,
1.73328, 1.192933, 1.032804, 1, 0, 0.2352941, 1,
1.73339, 0.5934845, 0.4025455, 1, 0, 0.227451, 1,
1.741004, 0.8898627, -0.3969111, 1, 0, 0.2235294, 1,
1.749086, 0.1626475, 2.647189, 1, 0, 0.2156863, 1,
1.769992, -1.887515, 2.350661, 1, 0, 0.2117647, 1,
1.787598, -1.688307, 1.951871, 1, 0, 0.2039216, 1,
1.793885, -0.7812998, 2.745612, 1, 0, 0.1960784, 1,
1.798546, -0.5885345, 1.942375, 1, 0, 0.1921569, 1,
1.814266, 1.836827, 1.444366, 1, 0, 0.1843137, 1,
1.837676, -1.661821, -0.4671324, 1, 0, 0.1803922, 1,
1.843962, 0.09473512, 1.009779, 1, 0, 0.172549, 1,
1.891649, -0.04952177, 2.792437, 1, 0, 0.1686275, 1,
1.898686, -0.6763746, 1.889038, 1, 0, 0.1607843, 1,
1.907729, 1.461519, 2.380643, 1, 0, 0.1568628, 1,
1.986602, -0.8624136, 2.353914, 1, 0, 0.1490196, 1,
1.990102, 1.72844, 1.665072, 1, 0, 0.145098, 1,
1.991742, -1.763856, 1.814704, 1, 0, 0.1372549, 1,
2.044734, -0.2755438, 2.297802, 1, 0, 0.1333333, 1,
2.074964, -0.2218544, 3.018822, 1, 0, 0.1254902, 1,
2.170555, -1.681272, 1.50136, 1, 0, 0.1215686, 1,
2.226354, 1.096494, 1.12055, 1, 0, 0.1137255, 1,
2.245443, -1.400725, 2.746962, 1, 0, 0.1098039, 1,
2.251371, -0.8867759, 1.928813, 1, 0, 0.1019608, 1,
2.258242, 1.097248, 0.03058411, 1, 0, 0.09411765, 1,
2.271397, -0.06616943, -1.212243, 1, 0, 0.09019608, 1,
2.285821, -0.6880237, 1.490233, 1, 0, 0.08235294, 1,
2.302607, 0.6909539, 2.016154, 1, 0, 0.07843138, 1,
2.330278, -0.1012725, 1.768034, 1, 0, 0.07058824, 1,
2.379914, -0.04427535, 1.56647, 1, 0, 0.06666667, 1,
2.382362, 0.8743328, 3.153203, 1, 0, 0.05882353, 1,
2.382613, -1.399926, 1.865442, 1, 0, 0.05490196, 1,
2.424136, 0.07230627, 2.990295, 1, 0, 0.04705882, 1,
2.439076, -0.0004859713, 0.7672207, 1, 0, 0.04313726, 1,
2.474847, -0.4475236, 1.036154, 1, 0, 0.03529412, 1,
2.5723, 1.515893, 1.491228, 1, 0, 0.03137255, 1,
2.5972, -0.2544631, 0.809086, 1, 0, 0.02352941, 1,
2.686029, -0.2060815, 1.631544, 1, 0, 0.01960784, 1,
2.878975, -0.220728, 1.957739, 1, 0, 0.01176471, 1,
3.345904, 0.9200076, 0.5475829, 1, 0, 0.007843138, 1
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
0.04418755, -3.463658, -7.232463, 0, -0.5, 0.5, 0.5,
0.04418755, -3.463658, -7.232463, 1, -0.5, 0.5, 0.5,
0.04418755, -3.463658, -7.232463, 1, 1.5, 0.5, 0.5,
0.04418755, -3.463658, -7.232463, 0, 1.5, 0.5, 0.5
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
-4.376811, 0.3861296, -7.232463, 0, -0.5, 0.5, 0.5,
-4.376811, 0.3861296, -7.232463, 1, -0.5, 0.5, 0.5,
-4.376811, 0.3861296, -7.232463, 1, 1.5, 0.5, 0.5,
-4.376811, 0.3861296, -7.232463, 0, 1.5, 0.5, 0.5
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
-4.376811, -3.463658, -0.08824253, 0, -0.5, 0.5, 0.5,
-4.376811, -3.463658, -0.08824253, 1, -0.5, 0.5, 0.5,
-4.376811, -3.463658, -0.08824253, 1, 1.5, 0.5, 0.5,
-4.376811, -3.463658, -0.08824253, 0, 1.5, 0.5, 0.5
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
-3, -2.575245, -5.583797,
3, -2.575245, -5.583797,
-3, -2.575245, -5.583797,
-3, -2.723314, -5.858575,
-2, -2.575245, -5.583797,
-2, -2.723314, -5.858575,
-1, -2.575245, -5.583797,
-1, -2.723314, -5.858575,
0, -2.575245, -5.583797,
0, -2.723314, -5.858575,
1, -2.575245, -5.583797,
1, -2.723314, -5.858575,
2, -2.575245, -5.583797,
2, -2.723314, -5.858575,
3, -2.575245, -5.583797,
3, -2.723314, -5.858575
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
-3, -3.019452, -6.40813, 0, -0.5, 0.5, 0.5,
-3, -3.019452, -6.40813, 1, -0.5, 0.5, 0.5,
-3, -3.019452, -6.40813, 1, 1.5, 0.5, 0.5,
-3, -3.019452, -6.40813, 0, 1.5, 0.5, 0.5,
-2, -3.019452, -6.40813, 0, -0.5, 0.5, 0.5,
-2, -3.019452, -6.40813, 1, -0.5, 0.5, 0.5,
-2, -3.019452, -6.40813, 1, 1.5, 0.5, 0.5,
-2, -3.019452, -6.40813, 0, 1.5, 0.5, 0.5,
-1, -3.019452, -6.40813, 0, -0.5, 0.5, 0.5,
-1, -3.019452, -6.40813, 1, -0.5, 0.5, 0.5,
-1, -3.019452, -6.40813, 1, 1.5, 0.5, 0.5,
-1, -3.019452, -6.40813, 0, 1.5, 0.5, 0.5,
0, -3.019452, -6.40813, 0, -0.5, 0.5, 0.5,
0, -3.019452, -6.40813, 1, -0.5, 0.5, 0.5,
0, -3.019452, -6.40813, 1, 1.5, 0.5, 0.5,
0, -3.019452, -6.40813, 0, 1.5, 0.5, 0.5,
1, -3.019452, -6.40813, 0, -0.5, 0.5, 0.5,
1, -3.019452, -6.40813, 1, -0.5, 0.5, 0.5,
1, -3.019452, -6.40813, 1, 1.5, 0.5, 0.5,
1, -3.019452, -6.40813, 0, 1.5, 0.5, 0.5,
2, -3.019452, -6.40813, 0, -0.5, 0.5, 0.5,
2, -3.019452, -6.40813, 1, -0.5, 0.5, 0.5,
2, -3.019452, -6.40813, 1, 1.5, 0.5, 0.5,
2, -3.019452, -6.40813, 0, 1.5, 0.5, 0.5,
3, -3.019452, -6.40813, 0, -0.5, 0.5, 0.5,
3, -3.019452, -6.40813, 1, -0.5, 0.5, 0.5,
3, -3.019452, -6.40813, 1, 1.5, 0.5, 0.5,
3, -3.019452, -6.40813, 0, 1.5, 0.5, 0.5
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
-3.356581, -2, -5.583797,
-3.356581, 3, -5.583797,
-3.356581, -2, -5.583797,
-3.526619, -2, -5.858575,
-3.356581, -1, -5.583797,
-3.526619, -1, -5.858575,
-3.356581, 0, -5.583797,
-3.526619, 0, -5.858575,
-3.356581, 1, -5.583797,
-3.526619, 1, -5.858575,
-3.356581, 2, -5.583797,
-3.526619, 2, -5.858575,
-3.356581, 3, -5.583797,
-3.526619, 3, -5.858575
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
-3.866696, -2, -6.40813, 0, -0.5, 0.5, 0.5,
-3.866696, -2, -6.40813, 1, -0.5, 0.5, 0.5,
-3.866696, -2, -6.40813, 1, 1.5, 0.5, 0.5,
-3.866696, -2, -6.40813, 0, 1.5, 0.5, 0.5,
-3.866696, -1, -6.40813, 0, -0.5, 0.5, 0.5,
-3.866696, -1, -6.40813, 1, -0.5, 0.5, 0.5,
-3.866696, -1, -6.40813, 1, 1.5, 0.5, 0.5,
-3.866696, -1, -6.40813, 0, 1.5, 0.5, 0.5,
-3.866696, 0, -6.40813, 0, -0.5, 0.5, 0.5,
-3.866696, 0, -6.40813, 1, -0.5, 0.5, 0.5,
-3.866696, 0, -6.40813, 1, 1.5, 0.5, 0.5,
-3.866696, 0, -6.40813, 0, 1.5, 0.5, 0.5,
-3.866696, 1, -6.40813, 0, -0.5, 0.5, 0.5,
-3.866696, 1, -6.40813, 1, -0.5, 0.5, 0.5,
-3.866696, 1, -6.40813, 1, 1.5, 0.5, 0.5,
-3.866696, 1, -6.40813, 0, 1.5, 0.5, 0.5,
-3.866696, 2, -6.40813, 0, -0.5, 0.5, 0.5,
-3.866696, 2, -6.40813, 1, -0.5, 0.5, 0.5,
-3.866696, 2, -6.40813, 1, 1.5, 0.5, 0.5,
-3.866696, 2, -6.40813, 0, 1.5, 0.5, 0.5,
-3.866696, 3, -6.40813, 0, -0.5, 0.5, 0.5,
-3.866696, 3, -6.40813, 1, -0.5, 0.5, 0.5,
-3.866696, 3, -6.40813, 1, 1.5, 0.5, 0.5,
-3.866696, 3, -6.40813, 0, 1.5, 0.5, 0.5
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
-3.356581, -2.575245, -4,
-3.356581, -2.575245, 4,
-3.356581, -2.575245, -4,
-3.526619, -2.723314, -4,
-3.356581, -2.575245, -2,
-3.526619, -2.723314, -2,
-3.356581, -2.575245, 0,
-3.526619, -2.723314, 0,
-3.356581, -2.575245, 2,
-3.526619, -2.723314, 2,
-3.356581, -2.575245, 4,
-3.526619, -2.723314, 4
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
-3.866696, -3.019452, -4, 0, -0.5, 0.5, 0.5,
-3.866696, -3.019452, -4, 1, -0.5, 0.5, 0.5,
-3.866696, -3.019452, -4, 1, 1.5, 0.5, 0.5,
-3.866696, -3.019452, -4, 0, 1.5, 0.5, 0.5,
-3.866696, -3.019452, -2, 0, -0.5, 0.5, 0.5,
-3.866696, -3.019452, -2, 1, -0.5, 0.5, 0.5,
-3.866696, -3.019452, -2, 1, 1.5, 0.5, 0.5,
-3.866696, -3.019452, -2, 0, 1.5, 0.5, 0.5,
-3.866696, -3.019452, 0, 0, -0.5, 0.5, 0.5,
-3.866696, -3.019452, 0, 1, -0.5, 0.5, 0.5,
-3.866696, -3.019452, 0, 1, 1.5, 0.5, 0.5,
-3.866696, -3.019452, 0, 0, 1.5, 0.5, 0.5,
-3.866696, -3.019452, 2, 0, -0.5, 0.5, 0.5,
-3.866696, -3.019452, 2, 1, -0.5, 0.5, 0.5,
-3.866696, -3.019452, 2, 1, 1.5, 0.5, 0.5,
-3.866696, -3.019452, 2, 0, 1.5, 0.5, 0.5,
-3.866696, -3.019452, 4, 0, -0.5, 0.5, 0.5,
-3.866696, -3.019452, 4, 1, -0.5, 0.5, 0.5,
-3.866696, -3.019452, 4, 1, 1.5, 0.5, 0.5,
-3.866696, -3.019452, 4, 0, 1.5, 0.5, 0.5
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
-3.356581, -2.575245, -5.583797,
-3.356581, 3.347505, -5.583797,
-3.356581, -2.575245, 5.407312,
-3.356581, 3.347505, 5.407312,
-3.356581, -2.575245, -5.583797,
-3.356581, -2.575245, 5.407312,
-3.356581, 3.347505, -5.583797,
-3.356581, 3.347505, 5.407312,
-3.356581, -2.575245, -5.583797,
3.444956, -2.575245, -5.583797,
-3.356581, -2.575245, 5.407312,
3.444956, -2.575245, 5.407312,
-3.356581, 3.347505, -5.583797,
3.444956, 3.347505, -5.583797,
-3.356581, 3.347505, 5.407312,
3.444956, 3.347505, 5.407312,
3.444956, -2.575245, -5.583797,
3.444956, 3.347505, -5.583797,
3.444956, -2.575245, 5.407312,
3.444956, 3.347505, 5.407312,
3.444956, -2.575245, -5.583797,
3.444956, -2.575245, 5.407312,
3.444956, 3.347505, -5.583797,
3.444956, 3.347505, 5.407312
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
var radius = 7.592001;
var distance = 33.77767;
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
mvMatrix.translate( -0.04418755, -0.3861296, 0.08824253 );
mvMatrix.scale( 1.206877, 1.385947, 0.7468418 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.77767);
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
Borea<-read.table("Borea.xyz", skip=1)
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
-3.257529, 1.319701, -1.105737, 0, 0, 1, 1, 1,
-2.82471, 1.120585, -1.835068, 1, 0, 0, 1, 1,
-2.678278, 0.9114972, -1.421729, 1, 0, 0, 1, 1,
-2.634348, 0.4980394, -1.98827, 1, 0, 0, 1, 1,
-2.447989, 0.5204173, 0.2881219, 1, 0, 0, 1, 1,
-2.444676, 1.429463, -0.9828731, 1, 0, 0, 1, 1,
-2.41295, 1.320259, -0.4272388, 0, 0, 0, 1, 1,
-2.342925, 0.644376, -2.711759, 0, 0, 0, 1, 1,
-2.240461, -1.487958, -2.373178, 0, 0, 0, 1, 1,
-2.235531, -0.05364208, -0.0432491, 0, 0, 0, 1, 1,
-2.195023, 0.3901996, -0.05650822, 0, 0, 0, 1, 1,
-2.131263, 2.0298, -2.574866, 0, 0, 0, 1, 1,
-2.130838, 1.345102, 0.199344, 0, 0, 0, 1, 1,
-2.102143, -0.8209609, -2.956023, 1, 1, 1, 1, 1,
-2.081141, -1.375255, -4.27212, 1, 1, 1, 1, 1,
-2.076719, -2.047293, -2.06136, 1, 1, 1, 1, 1,
-2.066217, 0.3354183, -0.4947168, 1, 1, 1, 1, 1,
-2.021837, 1.254552, -3.858039, 1, 1, 1, 1, 1,
-2.014138, 1.439125, -1.322761, 1, 1, 1, 1, 1,
-1.976627, -2.057502, -2.811389, 1, 1, 1, 1, 1,
-1.969891, -1.454204, -1.590827, 1, 1, 1, 1, 1,
-1.945072, 1.073712, 0.2962539, 1, 1, 1, 1, 1,
-1.929478, 0.3964844, -1.663882, 1, 1, 1, 1, 1,
-1.898931, 0.02302992, -0.5885656, 1, 1, 1, 1, 1,
-1.894884, -0.06335436, -1.649521, 1, 1, 1, 1, 1,
-1.887845, 0.5490875, -1.404156, 1, 1, 1, 1, 1,
-1.83635, 1.14124, -1.166407, 1, 1, 1, 1, 1,
-1.83624, 0.02075133, -2.768132, 1, 1, 1, 1, 1,
-1.830775, -0.8118558, -2.269608, 0, 0, 1, 1, 1,
-1.817708, 0.6413983, -0.7332275, 1, 0, 0, 1, 1,
-1.816352, 0.1297296, -2.052578, 1, 0, 0, 1, 1,
-1.806514, -0.3886527, -2.056391, 1, 0, 0, 1, 1,
-1.797247, 0.8619319, -1.375188, 1, 0, 0, 1, 1,
-1.791401, -0.7964641, -1.306835, 1, 0, 0, 1, 1,
-1.790754, -0.1654139, -2.123601, 0, 0, 0, 1, 1,
-1.78628, 1.113883, 0.4062937, 0, 0, 0, 1, 1,
-1.770547, -1.080709, -4.634095, 0, 0, 0, 1, 1,
-1.769562, -0.1137512, -1.912751, 0, 0, 0, 1, 1,
-1.766529, -0.8547652, -1.404303, 0, 0, 0, 1, 1,
-1.713854, -1.284816, -0.6913578, 0, 0, 0, 1, 1,
-1.691841, -0.162132, -0.8056329, 0, 0, 0, 1, 1,
-1.674837, 0.5759744, -2.446172, 1, 1, 1, 1, 1,
-1.660209, -1.227093, -0.7629882, 1, 1, 1, 1, 1,
-1.659, 0.6846779, -0.1438497, 1, 1, 1, 1, 1,
-1.622331, 1.618782, -1.200849, 1, 1, 1, 1, 1,
-1.617849, 0.2760576, -0.9794759, 1, 1, 1, 1, 1,
-1.616372, -1.442506, -4.303589, 1, 1, 1, 1, 1,
-1.607945, 1.507871, -0.7858997, 1, 1, 1, 1, 1,
-1.602635, -0.3526276, -2.64489, 1, 1, 1, 1, 1,
-1.600155, 1.105323, -0.7558843, 1, 1, 1, 1, 1,
-1.589763, 0.2505785, -0.7332575, 1, 1, 1, 1, 1,
-1.589754, -1.397307, -2.052511, 1, 1, 1, 1, 1,
-1.588301, 0.6719096, -2.158931, 1, 1, 1, 1, 1,
-1.57961, 0.2808087, -2.106636, 1, 1, 1, 1, 1,
-1.577924, -0.001290709, -2.600208, 1, 1, 1, 1, 1,
-1.57192, 0.02420752, -1.898015, 1, 1, 1, 1, 1,
-1.569188, -0.5121562, -0.7744104, 0, 0, 1, 1, 1,
-1.567638, -0.03104581, -1.964536, 1, 0, 0, 1, 1,
-1.555815, -0.6200951, -2.715657, 1, 0, 0, 1, 1,
-1.554549, -0.8901511, -2.155354, 1, 0, 0, 1, 1,
-1.554055, -0.2000568, -0.1504767, 1, 0, 0, 1, 1,
-1.549017, -0.3018107, -0.8336859, 1, 0, 0, 1, 1,
-1.544173, 0.2076409, -1.967912, 0, 0, 0, 1, 1,
-1.521339, -0.3138369, -1.065339, 0, 0, 0, 1, 1,
-1.519738, -0.4276457, -2.661535, 0, 0, 0, 1, 1,
-1.513676, -1.780104, -2.278299, 0, 0, 0, 1, 1,
-1.508434, 2.245228, -1.544775, 0, 0, 0, 1, 1,
-1.488827, -0.2898893, -0.2407957, 0, 0, 0, 1, 1,
-1.482529, 1.166882, -1.946064, 0, 0, 0, 1, 1,
-1.469975, -1.52303, -2.938463, 1, 1, 1, 1, 1,
-1.460115, -0.2572497, -1.424507, 1, 1, 1, 1, 1,
-1.458918, -2.437169, -4.479794, 1, 1, 1, 1, 1,
-1.457029, 1.03936, -1.487124, 1, 1, 1, 1, 1,
-1.453497, 1.792143, -1.041225, 1, 1, 1, 1, 1,
-1.435437, 0.1230333, -2.671715, 1, 1, 1, 1, 1,
-1.403661, 1.651686, 0.6175443, 1, 1, 1, 1, 1,
-1.398219, -1.047234, -1.600757, 1, 1, 1, 1, 1,
-1.393873, 0.1759275, -3.425414, 1, 1, 1, 1, 1,
-1.380071, -1.748005, -1.867271, 1, 1, 1, 1, 1,
-1.378799, 1.269429, -1.301652, 1, 1, 1, 1, 1,
-1.371582, 0.6099048, 0.03471835, 1, 1, 1, 1, 1,
-1.365215, -0.2444001, -2.576044, 1, 1, 1, 1, 1,
-1.364282, 0.2580221, -1.463117, 1, 1, 1, 1, 1,
-1.363894, -0.3876745, -0.654346, 1, 1, 1, 1, 1,
-1.36032, -0.3481943, -1.320506, 0, 0, 1, 1, 1,
-1.336613, 0.6632959, -0.9339554, 1, 0, 0, 1, 1,
-1.336505, 0.5660617, -0.7173831, 1, 0, 0, 1, 1,
-1.33598, -0.8934125, -2.11368, 1, 0, 0, 1, 1,
-1.330159, -0.8022151, -0.5530105, 1, 0, 0, 1, 1,
-1.31618, 0.1494406, -1.72471, 1, 0, 0, 1, 1,
-1.304368, -0.3950653, -1.375355, 0, 0, 0, 1, 1,
-1.304259, -1.029581, -2.422919, 0, 0, 0, 1, 1,
-1.295907, -0.5259813, -1.974571, 0, 0, 0, 1, 1,
-1.28861, 0.2948939, -2.27071, 0, 0, 0, 1, 1,
-1.287963, 0.269032, -1.406438, 0, 0, 0, 1, 1,
-1.273232, 0.6970754, 0.242196, 0, 0, 0, 1, 1,
-1.258273, 0.3793583, -0.974498, 0, 0, 0, 1, 1,
-1.251796, 1.631672, -0.9598759, 1, 1, 1, 1, 1,
-1.250164, 1.194832, -1.888795, 1, 1, 1, 1, 1,
-1.2406, -0.788312, -2.76441, 1, 1, 1, 1, 1,
-1.234719, 1.302141, 0.5779846, 1, 1, 1, 1, 1,
-1.226146, -0.3672413, -2.643523, 1, 1, 1, 1, 1,
-1.223302, -1.165105, -3.145254, 1, 1, 1, 1, 1,
-1.20754, 1.312032, -1.74892, 1, 1, 1, 1, 1,
-1.206831, -1.000312, -3.057854, 1, 1, 1, 1, 1,
-1.200313, 1.080943, -2.036777, 1, 1, 1, 1, 1,
-1.199626, 1.309937, -0.4314958, 1, 1, 1, 1, 1,
-1.192493, 2.178031, -0.444434, 1, 1, 1, 1, 1,
-1.192477, 0.6809065, -3.280888, 1, 1, 1, 1, 1,
-1.192302, -0.4339024, -2.239264, 1, 1, 1, 1, 1,
-1.174352, 1.248079, -0.586339, 1, 1, 1, 1, 1,
-1.16784, 0.3181143, -2.000395, 1, 1, 1, 1, 1,
-1.161679, 0.610626, -0.4205699, 0, 0, 1, 1, 1,
-1.156927, 1.278406, -0.5252578, 1, 0, 0, 1, 1,
-1.139662, -0.7799046, -2.791892, 1, 0, 0, 1, 1,
-1.136392, 0.0441019, -1.459947, 1, 0, 0, 1, 1,
-1.131805, 0.7594429, -0.748181, 1, 0, 0, 1, 1,
-1.12808, -0.5573716, -1.679004, 1, 0, 0, 1, 1,
-1.1267, -0.7074756, -3.814796, 0, 0, 0, 1, 1,
-1.121578, 0.8017269, -0.2869666, 0, 0, 0, 1, 1,
-1.116237, -0.6724214, -2.658577, 0, 0, 0, 1, 1,
-1.111449, 0.3172249, 0.406168, 0, 0, 0, 1, 1,
-1.106081, -0.2757809, -2.058144, 0, 0, 0, 1, 1,
-1.104747, -1.693305, -2.614645, 0, 0, 0, 1, 1,
-1.081063, -0.3217359, -1.017639, 0, 0, 0, 1, 1,
-1.079753, 0.9435163, 1.232377, 1, 1, 1, 1, 1,
-1.077285, -0.6022221, -1.871969, 1, 1, 1, 1, 1,
-1.0723, 0.0953845, 0.004947264, 1, 1, 1, 1, 1,
-1.071233, 1.159255, -0.7744762, 1, 1, 1, 1, 1,
-1.069221, -0.8506581, -2.500825, 1, 1, 1, 1, 1,
-1.06843, 0.1627237, -1.748243, 1, 1, 1, 1, 1,
-1.064922, 0.1959321, -2.149928, 1, 1, 1, 1, 1,
-1.06422, 0.1789766, -0.7344307, 1, 1, 1, 1, 1,
-1.060915, -0.7695283, -3.106638, 1, 1, 1, 1, 1,
-1.057173, -0.2034238, -0.7373155, 1, 1, 1, 1, 1,
-1.056186, 2.232644, -0.3853094, 1, 1, 1, 1, 1,
-1.0546, -0.4629594, -3.701234, 1, 1, 1, 1, 1,
-1.042594, 0.8970618, -0.7145266, 1, 1, 1, 1, 1,
-1.038466, -0.4607258, -3.733101, 1, 1, 1, 1, 1,
-1.035442, -1.506029, -2.755121, 1, 1, 1, 1, 1,
-1.016624, -0.7713919, -1.427274, 0, 0, 1, 1, 1,
-1.00638, 0.5180179, -0.1674698, 1, 0, 0, 1, 1,
-1.000963, 1.975164, -0.8566868, 1, 0, 0, 1, 1,
-1.000668, -0.3264212, -0.05180108, 1, 0, 0, 1, 1,
-0.9955105, 0.2221061, -1.747855, 1, 0, 0, 1, 1,
-0.9904149, 0.495745, -2.149244, 1, 0, 0, 1, 1,
-0.9889781, 0.2461191, 0.6210823, 0, 0, 0, 1, 1,
-0.9844757, -0.9865552, -3.152319, 0, 0, 0, 1, 1,
-0.9736, -0.1092982, -2.432557, 0, 0, 0, 1, 1,
-0.9730352, -1.442052, -1.979422, 0, 0, 0, 1, 1,
-0.9627022, 0.9357173, 0.710703, 0, 0, 0, 1, 1,
-0.9619032, 0.6243757, -1.429487, 0, 0, 0, 1, 1,
-0.947477, -0.2796551, -1.808573, 0, 0, 0, 1, 1,
-0.9446893, 1.116545, 0.9756764, 1, 1, 1, 1, 1,
-0.9397844, -1.062168, -3.739254, 1, 1, 1, 1, 1,
-0.9351239, 0.3672417, -2.687282, 1, 1, 1, 1, 1,
-0.9257195, -0.594771, -1.911577, 1, 1, 1, 1, 1,
-0.9252144, 0.08053815, -1.40089, 1, 1, 1, 1, 1,
-0.9226066, -1.124233, -2.220536, 1, 1, 1, 1, 1,
-0.9218836, 1.082829, -1.256379, 1, 1, 1, 1, 1,
-0.9188285, 1.390544, -0.3127231, 1, 1, 1, 1, 1,
-0.9188086, 0.8002226, -1.436583, 1, 1, 1, 1, 1,
-0.9156536, -0.3553281, -2.416013, 1, 1, 1, 1, 1,
-0.9062296, 0.1088983, -1.250604, 1, 1, 1, 1, 1,
-0.905334, 0.2514512, -0.6645168, 1, 1, 1, 1, 1,
-0.900852, 0.2939832, -1.735321, 1, 1, 1, 1, 1,
-0.9006906, -0.0002241985, -2.3808, 1, 1, 1, 1, 1,
-0.9006566, -1.217276, -2.981053, 1, 1, 1, 1, 1,
-0.8941598, 0.3355733, -2.435766, 0, 0, 1, 1, 1,
-0.8846422, 0.7940892, -1.020061, 1, 0, 0, 1, 1,
-0.8811624, -0.2903334, -0.3142399, 1, 0, 0, 1, 1,
-0.878381, -0.04245552, -2.054072, 1, 0, 0, 1, 1,
-0.8776144, 0.1443809, -0.053458, 1, 0, 0, 1, 1,
-0.8765664, 0.7438713, -0.3912247, 1, 0, 0, 1, 1,
-0.8757664, 1.204152, -1.725449, 0, 0, 0, 1, 1,
-0.871514, -0.2050771, -0.3713786, 0, 0, 0, 1, 1,
-0.8678811, 0.1182564, -2.594019, 0, 0, 0, 1, 1,
-0.8609373, -0.1673779, -1.483059, 0, 0, 0, 1, 1,
-0.8602979, 0.5414954, -2.433805, 0, 0, 0, 1, 1,
-0.8599721, 0.9504988, 1.348088, 0, 0, 0, 1, 1,
-0.8580768, -1.005674, -1.574058, 0, 0, 0, 1, 1,
-0.8514344, -0.3176856, -2.612547, 1, 1, 1, 1, 1,
-0.8461563, -0.5041236, -2.345168, 1, 1, 1, 1, 1,
-0.8448427, -0.6901698, -2.831525, 1, 1, 1, 1, 1,
-0.8390781, 1.144376, -0.2641685, 1, 1, 1, 1, 1,
-0.8380047, -0.2098221, -2.784867, 1, 1, 1, 1, 1,
-0.8289135, -2.104424, -3.038548, 1, 1, 1, 1, 1,
-0.8260145, 2.73956, -0.7289063, 1, 1, 1, 1, 1,
-0.8069867, -0.8315727, -4.84017, 1, 1, 1, 1, 1,
-0.804827, -0.9793285, -2.207663, 1, 1, 1, 1, 1,
-0.790875, 1.977949, -0.7723819, 1, 1, 1, 1, 1,
-0.7881246, 1.720643, 1.515803, 1, 1, 1, 1, 1,
-0.7852372, 1.325067, 1.296933, 1, 1, 1, 1, 1,
-0.7838084, 0.8980457, -0.1389271, 1, 1, 1, 1, 1,
-0.7820365, -0.2792179, -1.699593, 1, 1, 1, 1, 1,
-0.7746668, -0.4777735, -1.991046, 1, 1, 1, 1, 1,
-0.7715699, -0.05664476, -0.4609609, 0, 0, 1, 1, 1,
-0.7712568, -0.03625773, -0.9470369, 1, 0, 0, 1, 1,
-0.7679616, -0.9285509, -3.331933, 1, 0, 0, 1, 1,
-0.7662171, 0.2110423, -1.817249, 1, 0, 0, 1, 1,
-0.7636184, 1.722301, -0.1088093, 1, 0, 0, 1, 1,
-0.7597314, 0.6281635, -0.6049779, 1, 0, 0, 1, 1,
-0.7562165, -0.7195973, -2.553411, 0, 0, 0, 1, 1,
-0.7512734, 0.1438778, -0.7984685, 0, 0, 0, 1, 1,
-0.7448501, -0.9147418, -3.182537, 0, 0, 0, 1, 1,
-0.7430249, 0.5408522, -0.05875793, 0, 0, 0, 1, 1,
-0.7412822, 0.6241521, -0.9724705, 0, 0, 0, 1, 1,
-0.7385803, -0.2582205, -2.425779, 0, 0, 0, 1, 1,
-0.7344014, 0.8756611, -1.733846, 0, 0, 0, 1, 1,
-0.7342523, -0.5788424, -2.873639, 1, 1, 1, 1, 1,
-0.7307436, 0.5810416, -0.62931, 1, 1, 1, 1, 1,
-0.7305272, 0.3474525, -1.801963, 1, 1, 1, 1, 1,
-0.7273585, -0.7940137, -3.730168, 1, 1, 1, 1, 1,
-0.7265657, -1.374389, -3.565647, 1, 1, 1, 1, 1,
-0.7166438, 1.235242, 0.1010425, 1, 1, 1, 1, 1,
-0.7151743, 1.299613, 1.066908, 1, 1, 1, 1, 1,
-0.7127766, 0.3477134, -0.8925541, 1, 1, 1, 1, 1,
-0.7112698, 0.8237082, -1.078156, 1, 1, 1, 1, 1,
-0.7072759, -0.04560558, -1.448022, 1, 1, 1, 1, 1,
-0.7059241, 0.3151745, -0.211985, 1, 1, 1, 1, 1,
-0.7058294, -1.751668, -2.745476, 1, 1, 1, 1, 1,
-0.7053741, 1.262373, -0.25538, 1, 1, 1, 1, 1,
-0.7048723, -1.335485, -3.686458, 1, 1, 1, 1, 1,
-0.7037753, 0.5798909, -0.847318, 1, 1, 1, 1, 1,
-0.7032154, -0.0742779, -0.866598, 0, 0, 1, 1, 1,
-0.6872432, 0.7925008, 0.2328644, 1, 0, 0, 1, 1,
-0.685695, 0.5110462, -2.014183, 1, 0, 0, 1, 1,
-0.6837476, 1.558201, -0.3269352, 1, 0, 0, 1, 1,
-0.6831784, 0.1722817, -1.358981, 1, 0, 0, 1, 1,
-0.6766641, -1.588604, -1.435168, 1, 0, 0, 1, 1,
-0.6759269, 0.7703953, -3.011652, 0, 0, 0, 1, 1,
-0.6750182, -1.540018, -2.814044, 0, 0, 0, 1, 1,
-0.6746607, -0.1519928, -2.633307, 0, 0, 0, 1, 1,
-0.6675127, 0.5598459, -0.2594788, 0, 0, 0, 1, 1,
-0.6650019, 0.08471083, -1.395945, 0, 0, 0, 1, 1,
-0.6615977, 1.599917, -0.8213038, 0, 0, 0, 1, 1,
-0.6556432, -0.7069914, -2.739688, 0, 0, 0, 1, 1,
-0.6550027, -0.5703675, -1.372164, 1, 1, 1, 1, 1,
-0.6518926, 0.659668, 0.2958874, 1, 1, 1, 1, 1,
-0.649374, 0.5640216, -1.897227, 1, 1, 1, 1, 1,
-0.6471682, -0.2825693, -0.9395657, 1, 1, 1, 1, 1,
-0.6462331, -0.5007932, -3.24928, 1, 1, 1, 1, 1,
-0.6448189, 0.6356095, 1.286705, 1, 1, 1, 1, 1,
-0.643905, 2.356251, -1.773388, 1, 1, 1, 1, 1,
-0.6317587, -1.101549, -3.355666, 1, 1, 1, 1, 1,
-0.6258613, -0.5227239, -2.476973, 1, 1, 1, 1, 1,
-0.6249627, 1.552155, -0.5275869, 1, 1, 1, 1, 1,
-0.6228341, -0.2556599, -1.213234, 1, 1, 1, 1, 1,
-0.6217431, -0.8061787, -4.021581, 1, 1, 1, 1, 1,
-0.6155829, -0.2045609, -2.692008, 1, 1, 1, 1, 1,
-0.6089883, -0.6708068, -1.041361, 1, 1, 1, 1, 1,
-0.607731, 0.9487118, -1.568533, 1, 1, 1, 1, 1,
-0.6023576, -0.4888214, -2.671279, 0, 0, 1, 1, 1,
-0.6013401, 0.6497117, -2.821553, 1, 0, 0, 1, 1,
-0.5975906, 0.351433, -2.22206, 1, 0, 0, 1, 1,
-0.5835778, -0.942343, -1.416077, 1, 0, 0, 1, 1,
-0.5780384, -0.5087143, -1.171882, 1, 0, 0, 1, 1,
-0.5777378, -0.7278071, -2.418289, 1, 0, 0, 1, 1,
-0.5760257, 0.4831515, -0.4414733, 0, 0, 0, 1, 1,
-0.5756608, -1.893771, -2.827065, 0, 0, 0, 1, 1,
-0.5735907, 1.342212, -0.5055676, 0, 0, 0, 1, 1,
-0.5724153, -0.6968499, -3.351477, 0, 0, 0, 1, 1,
-0.572174, 0.04251077, -0.2529655, 0, 0, 0, 1, 1,
-0.5639318, 0.6540627, 1.004909, 0, 0, 0, 1, 1,
-0.563737, 0.1353588, 0.4512387, 0, 0, 0, 1, 1,
-0.5630665, 0.0679195, -1.678235, 1, 1, 1, 1, 1,
-0.5623178, 1.083104, -1.842438, 1, 1, 1, 1, 1,
-0.5579027, -1.673613, -2.605034, 1, 1, 1, 1, 1,
-0.556049, -0.2618434, -1.930731, 1, 1, 1, 1, 1,
-0.5541776, -0.4087333, -3.939183, 1, 1, 1, 1, 1,
-0.5540418, 0.7713033, -0.2888986, 1, 1, 1, 1, 1,
-0.5449156, -1.419186, -2.642933, 1, 1, 1, 1, 1,
-0.5396481, 2.505459, -1.524948, 1, 1, 1, 1, 1,
-0.5352442, -1.551147, -2.280544, 1, 1, 1, 1, 1,
-0.5346997, -1.001858, -4.381175, 1, 1, 1, 1, 1,
-0.5286876, 0.211977, -1.089589, 1, 1, 1, 1, 1,
-0.5240884, -0.1549991, -3.897208, 1, 1, 1, 1, 1,
-0.5224031, 0.06936419, -0.9928302, 1, 1, 1, 1, 1,
-0.5214697, 1.183529, -0.2792449, 1, 1, 1, 1, 1,
-0.5166038, -1.060619, -2.192281, 1, 1, 1, 1, 1,
-0.5075778, 0.7720505, 0.06586166, 0, 0, 1, 1, 1,
-0.5012584, -1.498358, -1.812769, 1, 0, 0, 1, 1,
-0.5000177, 0.3788435, 0.08755676, 1, 0, 0, 1, 1,
-0.4989407, -0.2046546, -3.893652, 1, 0, 0, 1, 1,
-0.4937195, 0.1619064, -0.07280315, 1, 0, 0, 1, 1,
-0.4799096, 1.718107, -0.150013, 1, 0, 0, 1, 1,
-0.4796123, 0.3707899, -0.1988737, 0, 0, 0, 1, 1,
-0.4786598, 2.133734, -1.282232, 0, 0, 0, 1, 1,
-0.477466, -1.165844, -3.287386, 0, 0, 0, 1, 1,
-0.4758547, -1.252889, -0.676525, 0, 0, 0, 1, 1,
-0.4742975, -0.3909755, -1.759462, 0, 0, 0, 1, 1,
-0.4739994, 1.647257, 1.181797, 0, 0, 0, 1, 1,
-0.472954, -0.5834516, -1.983079, 0, 0, 0, 1, 1,
-0.4724097, -0.2400885, -2.405783, 1, 1, 1, 1, 1,
-0.4713259, 0.09398548, -3.124805, 1, 1, 1, 1, 1,
-0.4712588, -0.8330626, -2.555417, 1, 1, 1, 1, 1,
-0.4695722, 0.17448, -1.676333, 1, 1, 1, 1, 1,
-0.460411, 0.03524941, -2.769418, 1, 1, 1, 1, 1,
-0.4590556, -1.072781, -3.588256, 1, 1, 1, 1, 1,
-0.4567067, -0.6332654, -3.487796, 1, 1, 1, 1, 1,
-0.4502397, -0.2164471, -1.698423, 1, 1, 1, 1, 1,
-0.4437983, 1.076754, -1.396516, 1, 1, 1, 1, 1,
-0.4423901, 0.9386946, -1.605049, 1, 1, 1, 1, 1,
-0.4419198, 1.085408, 0.2284648, 1, 1, 1, 1, 1,
-0.4403624, -1.974616, -2.582814, 1, 1, 1, 1, 1,
-0.4389675, 0.04588188, -1.459714, 1, 1, 1, 1, 1,
-0.438758, 1.218772, -1.4134, 1, 1, 1, 1, 1,
-0.4367679, -0.680079, -1.736764, 1, 1, 1, 1, 1,
-0.4358407, 0.3192407, -0.8199602, 0, 0, 1, 1, 1,
-0.4345309, -0.483687, -3.444219, 1, 0, 0, 1, 1,
-0.432178, 0.8623635, 0.8087581, 1, 0, 0, 1, 1,
-0.4318435, -0.3483326, -3.260818, 1, 0, 0, 1, 1,
-0.4295116, 2.202825, -0.3796548, 1, 0, 0, 1, 1,
-0.4224237, -1.477123, -4.248601, 1, 0, 0, 1, 1,
-0.4221291, 0.7567816, -1.747753, 0, 0, 0, 1, 1,
-0.4170153, 0.1842809, -1.395864, 0, 0, 0, 1, 1,
-0.4158987, 0.563462, -1.352069, 0, 0, 0, 1, 1,
-0.4070223, 0.6354089, -1.067911, 0, 0, 0, 1, 1,
-0.4067548, -0.9691794, -2.58866, 0, 0, 0, 1, 1,
-0.4066534, 0.8247247, -1.068773, 0, 0, 0, 1, 1,
-0.4025232, -2.488992, -4.074677, 0, 0, 0, 1, 1,
-0.3972961, 0.4235887, -0.4795635, 1, 1, 1, 1, 1,
-0.3955882, 0.5961004, 0.6936345, 1, 1, 1, 1, 1,
-0.3917935, 0.08420102, -1.826478, 1, 1, 1, 1, 1,
-0.3914416, 0.2460067, -0.07062535, 1, 1, 1, 1, 1,
-0.3881993, 0.02271865, -0.7123222, 1, 1, 1, 1, 1,
-0.3879335, -1.015134, -1.672601, 1, 1, 1, 1, 1,
-0.3843999, -0.8866619, -2.607353, 1, 1, 1, 1, 1,
-0.3828364, -0.3057086, -3.225338, 1, 1, 1, 1, 1,
-0.380641, 0.3861722, -0.5473741, 1, 1, 1, 1, 1,
-0.3770394, 0.8544326, -0.3804176, 1, 1, 1, 1, 1,
-0.3764165, -1.190706, -3.674087, 1, 1, 1, 1, 1,
-0.3763149, 0.3434807, -0.4656176, 1, 1, 1, 1, 1,
-0.3751092, 0.9511501, -0.01279333, 1, 1, 1, 1, 1,
-0.3716026, -0.1419944, -0.3981243, 1, 1, 1, 1, 1,
-0.3715329, -0.06023106, -2.133181, 1, 1, 1, 1, 1,
-0.3691761, 1.104279, 0.8798406, 0, 0, 1, 1, 1,
-0.3687318, 1.085776, 1.866642, 1, 0, 0, 1, 1,
-0.3629655, 1.06294, -0.08428995, 1, 0, 0, 1, 1,
-0.360325, -0.474693, -2.613823, 1, 0, 0, 1, 1,
-0.3582833, -0.07199718, -1.419759, 1, 0, 0, 1, 1,
-0.3566724, 0.2817618, -0.2744866, 1, 0, 0, 1, 1,
-0.3566062, -0.9346174, -2.131321, 0, 0, 0, 1, 1,
-0.3539105, -1.046105, -3.430532, 0, 0, 0, 1, 1,
-0.3518825, -1.081699, -2.652878, 0, 0, 0, 1, 1,
-0.3490534, 0.3465272, -2.485619, 0, 0, 0, 1, 1,
-0.3455527, 0.2817989, -1.132641, 0, 0, 0, 1, 1,
-0.3442732, 0.1532763, -1.17187, 0, 0, 0, 1, 1,
-0.3431474, -0.5148856, -3.728279, 0, 0, 0, 1, 1,
-0.3428701, 0.3458, -1.241972, 1, 1, 1, 1, 1,
-0.3373756, -0.3637778, -1.061174, 1, 1, 1, 1, 1,
-0.3369386, 1.303469, -0.1074791, 1, 1, 1, 1, 1,
-0.3295487, -0.3328038, -1.982051, 1, 1, 1, 1, 1,
-0.3281401, -0.1114877, -1.204633, 1, 1, 1, 1, 1,
-0.328118, -0.9119189, -3.114254, 1, 1, 1, 1, 1,
-0.3278889, -0.425458, -3.726377, 1, 1, 1, 1, 1,
-0.3270777, 1.777063, 0.2429136, 1, 1, 1, 1, 1,
-0.3269337, -0.5215442, -2.220015, 1, 1, 1, 1, 1,
-0.3250261, -0.3450051, -1.872691, 1, 1, 1, 1, 1,
-0.3235633, 0.6083789, 0.5800377, 1, 1, 1, 1, 1,
-0.3225053, 0.1124317, -1.672177, 1, 1, 1, 1, 1,
-0.3222729, -0.1175057, 0.042336, 1, 1, 1, 1, 1,
-0.3204091, -0.1234974, -1.748829, 1, 1, 1, 1, 1,
-0.3202417, -0.8122536, -5.254291, 1, 1, 1, 1, 1,
-0.3197961, 3.261251, 0.9736411, 0, 0, 1, 1, 1,
-0.3190906, 0.3334805, 0.2658852, 1, 0, 0, 1, 1,
-0.3166318, 0.1107454, -2.252849, 1, 0, 0, 1, 1,
-0.3143148, 0.8032262, 1.128894, 1, 0, 0, 1, 1,
-0.3135108, 1.122562, -0.05984791, 1, 0, 0, 1, 1,
-0.3127533, -1.22593, -3.348038, 1, 0, 0, 1, 1,
-0.3114095, 0.2294896, -0.151755, 0, 0, 0, 1, 1,
-0.3109142, -0.6201521, -1.473734, 0, 0, 0, 1, 1,
-0.3079361, -1.681704, -3.114779, 0, 0, 0, 1, 1,
-0.305245, 0.001595364, -3.650469, 0, 0, 0, 1, 1,
-0.3052413, 1.270817, 0.8637317, 0, 0, 0, 1, 1,
-0.3023925, 1.121813, -1.387975, 0, 0, 0, 1, 1,
-0.2909595, 0.3037655, -2.473376, 0, 0, 0, 1, 1,
-0.2898111, 1.531648, 0.07473703, 1, 1, 1, 1, 1,
-0.2777548, 1.158496, -0.7548095, 1, 1, 1, 1, 1,
-0.2725189, 0.5796052, -0.2442563, 1, 1, 1, 1, 1,
-0.2715766, 0.5076668, -0.8480381, 1, 1, 1, 1, 1,
-0.2704955, -1.641439, -2.826432, 1, 1, 1, 1, 1,
-0.2652754, 1.365481, 0.1394414, 1, 1, 1, 1, 1,
-0.2648553, 0.1175738, -0.6167002, 1, 1, 1, 1, 1,
-0.2624493, -0.5774482, -1.980838, 1, 1, 1, 1, 1,
-0.2613183, -0.2627103, -3.381455, 1, 1, 1, 1, 1,
-0.2609643, 0.402035, -1.011206, 1, 1, 1, 1, 1,
-0.2600918, -0.067704, -0.5617288, 1, 1, 1, 1, 1,
-0.2518824, -1.696097, -2.907918, 1, 1, 1, 1, 1,
-0.2509676, -0.7918255, -3.311003, 1, 1, 1, 1, 1,
-0.2508985, 0.5211422, -0.5763847, 1, 1, 1, 1, 1,
-0.24772, -0.1827656, -2.526278, 1, 1, 1, 1, 1,
-0.2352987, 0.01150804, -0.5357221, 0, 0, 1, 1, 1,
-0.2286635, -1.071663, -4.223176, 1, 0, 0, 1, 1,
-0.2237138, -0.5220748, -1.872591, 1, 0, 0, 1, 1,
-0.2189031, -0.1468519, -2.575948, 1, 0, 0, 1, 1,
-0.2182653, 0.2719968, -1.661245, 1, 0, 0, 1, 1,
-0.2101936, -0.5847356, -3.47635, 1, 0, 0, 1, 1,
-0.2093849, 1.360556, -1.579324, 0, 0, 0, 1, 1,
-0.2092402, 1.07758, 0.6846582, 0, 0, 0, 1, 1,
-0.2088059, 0.1252436, -2.394292, 0, 0, 0, 1, 1,
-0.2080962, 0.1082562, -0.4266875, 0, 0, 0, 1, 1,
-0.1997238, 1.758821, -2.036863, 0, 0, 0, 1, 1,
-0.1990439, -2.442032, -3.310782, 0, 0, 0, 1, 1,
-0.193074, 1.249868, 0.7459467, 0, 0, 0, 1, 1,
-0.1922596, -0.3783252, -1.981314, 1, 1, 1, 1, 1,
-0.1908057, -0.6028785, -4.174075, 1, 1, 1, 1, 1,
-0.1899187, 1.862349, 0.1947135, 1, 1, 1, 1, 1,
-0.1831664, -0.3028703, -2.936639, 1, 1, 1, 1, 1,
-0.1819382, 0.7745832, -1.916538, 1, 1, 1, 1, 1,
-0.1770151, 0.3105543, -0.7322783, 1, 1, 1, 1, 1,
-0.1770134, 0.8710821, -1.168748, 1, 1, 1, 1, 1,
-0.1764269, 1.741682, 2.243152, 1, 1, 1, 1, 1,
-0.1753924, -0.1064976, -1.203202, 1, 1, 1, 1, 1,
-0.1744621, 0.3367401, 0.1993082, 1, 1, 1, 1, 1,
-0.1726509, 0.1593046, -1.413499, 1, 1, 1, 1, 1,
-0.1671631, 2.638171, 0.1565675, 1, 1, 1, 1, 1,
-0.1622951, -0.1226237, -1.226181, 1, 1, 1, 1, 1,
-0.1621976, 0.4130876, -0.3000726, 1, 1, 1, 1, 1,
-0.1564607, 0.9752663, 0.003105478, 1, 1, 1, 1, 1,
-0.1541416, -0.02569798, -3.37921, 0, 0, 1, 1, 1,
-0.1533058, 0.2717307, 1.167612, 1, 0, 0, 1, 1,
-0.152357, 0.1095255, 0.4600278, 1, 0, 0, 1, 1,
-0.1493613, -0.6279482, -2.011865, 1, 0, 0, 1, 1,
-0.1454973, 2.775205, 1.631318, 1, 0, 0, 1, 1,
-0.1384907, 0.4921966, -2.220741, 1, 0, 0, 1, 1,
-0.1360962, 0.215583, -1.252277, 0, 0, 0, 1, 1,
-0.1355996, -0.6422632, -2.929364, 0, 0, 0, 1, 1,
-0.1320535, 0.9310358, -1.281729, 0, 0, 0, 1, 1,
-0.1315731, -1.576246, -2.577864, 0, 0, 0, 1, 1,
-0.1294826, -0.1964531, -3.195991, 0, 0, 0, 1, 1,
-0.1247986, -0.1115568, -3.327014, 0, 0, 0, 1, 1,
-0.1223629, 0.3608613, 0.9841861, 0, 0, 0, 1, 1,
-0.1200814, -1.39237, -2.026205, 1, 1, 1, 1, 1,
-0.1185503, 0.5203499, -1.326513, 1, 1, 1, 1, 1,
-0.1168122, 1.288832, -1.264335, 1, 1, 1, 1, 1,
-0.116313, -1.107096, -4.112207, 1, 1, 1, 1, 1,
-0.1111399, -0.8450035, -3.062031, 1, 1, 1, 1, 1,
-0.1106581, -1.86462, -1.653048, 1, 1, 1, 1, 1,
-0.1086422, -0.7866449, -3.073786, 1, 1, 1, 1, 1,
-0.1048165, 0.1527716, 0.0899872, 1, 1, 1, 1, 1,
-0.1034356, 0.7941092, 0.5526897, 1, 1, 1, 1, 1,
-0.1029355, 0.4255844, 1.231505, 1, 1, 1, 1, 1,
-0.09524617, 0.7369184, 0.8209641, 1, 1, 1, 1, 1,
-0.09333856, 1.151397, -0.3358818, 1, 1, 1, 1, 1,
-0.09026273, 0.02824393, -2.347361, 1, 1, 1, 1, 1,
-0.0887322, -0.08992234, -2.401478, 1, 1, 1, 1, 1,
-0.08773015, 1.315204, 1.255479, 1, 1, 1, 1, 1,
-0.0866091, -0.1516617, -4.150499, 0, 0, 1, 1, 1,
-0.08652522, 0.6247305, 0.4755552, 1, 0, 0, 1, 1,
-0.08188761, 1.709723, -0.4323427, 1, 0, 0, 1, 1,
-0.07982931, -1.232035, -3.031396, 1, 0, 0, 1, 1,
-0.0757061, -0.5720752, -4.286447, 1, 0, 0, 1, 1,
-0.07195212, 0.2908844, -1.287788, 1, 0, 0, 1, 1,
-0.0689657, 0.3587998, -0.4066268, 0, 0, 0, 1, 1,
-0.06222159, 1.348188, 2.049999, 0, 0, 0, 1, 1,
-0.06212154, -0.9335174, -2.558083, 0, 0, 0, 1, 1,
-0.06006086, -0.4815959, -3.451546, 0, 0, 0, 1, 1,
-0.05937979, 0.688708, 0.1941968, 0, 0, 0, 1, 1,
-0.04972846, -0.2656425, -2.646944, 0, 0, 0, 1, 1,
-0.04948839, -2.173702, -4.925159, 0, 0, 0, 1, 1,
-0.04812224, 0.6038285, -1.056394, 1, 1, 1, 1, 1,
-0.04666502, -1.780225, -2.56394, 1, 1, 1, 1, 1,
-0.03977653, -0.7242003, -3.862511, 1, 1, 1, 1, 1,
-0.03666825, 0.9571864, 1.280132, 1, 1, 1, 1, 1,
-0.03634015, -0.6504963, -5.423732, 1, 1, 1, 1, 1,
-0.03559391, -1.367567, -2.766166, 1, 1, 1, 1, 1,
-0.03504021, -1.487901, -3.171301, 1, 1, 1, 1, 1,
-0.03487733, 0.01230767, -0.002304899, 1, 1, 1, 1, 1,
-0.03238177, -0.8179017, -2.649195, 1, 1, 1, 1, 1,
-0.02985414, -0.3238367, -3.628768, 1, 1, 1, 1, 1,
-0.02838071, 0.6292681, 1.149813, 1, 1, 1, 1, 1,
-0.02746357, 0.09763403, -0.2442463, 1, 1, 1, 1, 1,
-0.02636159, 0.4353035, 0.9882621, 1, 1, 1, 1, 1,
-0.02554111, -0.4951663, -1.664884, 1, 1, 1, 1, 1,
-0.02121653, 0.02373632, 0.6078308, 1, 1, 1, 1, 1,
-0.02017059, -0.12417, -3.961468, 0, 0, 1, 1, 1,
-0.01721239, -1.35372, -2.783653, 1, 0, 0, 1, 1,
-0.0170369, 1.231296, -0.1340677, 1, 0, 0, 1, 1,
-0.01661556, -0.7781225, -3.40226, 1, 0, 0, 1, 1,
-0.01503782, 0.5391276, -0.1662306, 1, 0, 0, 1, 1,
-0.01242883, -0.2969288, -3.204789, 1, 0, 0, 1, 1,
-0.003495572, -1.978146, -3.857312, 0, 0, 0, 1, 1,
-0.002184642, -0.5851806, -1.827912, 0, 0, 0, 1, 1,
-0.001635397, -1.356761, -4.047256, 0, 0, 0, 1, 1,
-0.0001523385, -0.9132095, -1.403713, 0, 0, 0, 1, 1,
0.001786544, -0.3804476, 2.114476, 0, 0, 0, 1, 1,
0.003821576, 0.1890099, 0.7404926, 0, 0, 0, 1, 1,
0.006031781, -0.995894, 4.276127, 0, 0, 0, 1, 1,
0.006314186, -0.3367935, 2.032673, 1, 1, 1, 1, 1,
0.007287728, -0.5084311, 2.8012, 1, 1, 1, 1, 1,
0.01469282, -1.261786, 2.689325, 1, 1, 1, 1, 1,
0.01580872, -0.8041368, 2.388356, 1, 1, 1, 1, 1,
0.01818633, -1.225321, 2.984527, 1, 1, 1, 1, 1,
0.01941378, 1.553514, -0.7520619, 1, 1, 1, 1, 1,
0.0248035, 0.3988551, 0.02215522, 1, 1, 1, 1, 1,
0.02723141, 0.5410951, 0.4782947, 1, 1, 1, 1, 1,
0.0298649, 0.1615383, 0.3528897, 1, 1, 1, 1, 1,
0.03077845, -0.03108954, 1.551378, 1, 1, 1, 1, 1,
0.03158809, -0.2970766, 2.820225, 1, 1, 1, 1, 1,
0.0319242, 1.026115, -0.1772919, 1, 1, 1, 1, 1,
0.03275144, -0.8602073, 4.244649, 1, 1, 1, 1, 1,
0.03468704, 0.4628657, 0.2302974, 1, 1, 1, 1, 1,
0.03623324, -0.8096352, 2.990664, 1, 1, 1, 1, 1,
0.03841108, 1.861249, -1.474676, 0, 0, 1, 1, 1,
0.04032702, 2.100624, -0.06529339, 1, 0, 0, 1, 1,
0.0447835, 0.8252138, -3.001241, 1, 0, 0, 1, 1,
0.04728081, 0.01094344, 2.778039, 1, 0, 0, 1, 1,
0.050995, -0.02436565, 0.3245884, 1, 0, 0, 1, 1,
0.0515295, -0.5579582, 3.762909, 1, 0, 0, 1, 1,
0.05580408, -0.3844281, 3.948115, 0, 0, 0, 1, 1,
0.05791713, 0.7846735, 0.3906645, 0, 0, 0, 1, 1,
0.05818369, -0.3365521, 2.361644, 0, 0, 0, 1, 1,
0.05875569, -0.5895901, 1.053696, 0, 0, 0, 1, 1,
0.06189897, 0.8681741, -2.133894, 0, 0, 0, 1, 1,
0.06576987, -0.260969, 2.487807, 0, 0, 0, 1, 1,
0.06582281, -0.2900012, 3.736028, 0, 0, 0, 1, 1,
0.0667683, 0.4523242, 2.30125, 1, 1, 1, 1, 1,
0.06993533, 1.378049, 1.727016, 1, 1, 1, 1, 1,
0.07024045, -0.8526816, 1.897852, 1, 1, 1, 1, 1,
0.07119077, -0.2155173, 1.337739, 1, 1, 1, 1, 1,
0.07210878, -0.1514114, 2.537249, 1, 1, 1, 1, 1,
0.07359574, 0.2968734, 0.6020896, 1, 1, 1, 1, 1,
0.07713446, 0.07084559, 1.423665, 1, 1, 1, 1, 1,
0.07944891, -1.065638, 0.639553, 1, 1, 1, 1, 1,
0.07959553, -0.4265367, 3.881204, 1, 1, 1, 1, 1,
0.08154068, -0.7685495, 1.171319, 1, 1, 1, 1, 1,
0.0840477, 0.6746333, 0.8889797, 1, 1, 1, 1, 1,
0.08832034, -0.1239501, 3.796975, 1, 1, 1, 1, 1,
0.08889902, 0.9497071, -0.5977198, 1, 1, 1, 1, 1,
0.08968922, -0.0564632, 1.516485, 1, 1, 1, 1, 1,
0.09157702, -0.2433498, 1.721697, 1, 1, 1, 1, 1,
0.09367135, -0.03572387, 3.141094, 0, 0, 1, 1, 1,
0.1003506, -1.114601, 3.790127, 1, 0, 0, 1, 1,
0.1048757, -0.02690608, 1.300195, 1, 0, 0, 1, 1,
0.1063691, -0.4418264, 2.062124, 1, 0, 0, 1, 1,
0.1084227, 0.3596562, 0.003640137, 1, 0, 0, 1, 1,
0.1109715, -0.09351747, 2.39767, 1, 0, 0, 1, 1,
0.1115144, 0.601564, 0.7961891, 0, 0, 0, 1, 1,
0.1150465, -2.260122, 1.731053, 0, 0, 0, 1, 1,
0.1189372, 0.8758978, 0.3033252, 0, 0, 0, 1, 1,
0.1222118, 1.558788, 1.501457, 0, 0, 0, 1, 1,
0.1256581, -0.3039842, 1.89614, 0, 0, 0, 1, 1,
0.1293173, 2.461607, 1.528673, 0, 0, 0, 1, 1,
0.1310408, -0.7573464, 3.641418, 0, 0, 0, 1, 1,
0.1319779, 0.02392633, 0.06191596, 1, 1, 1, 1, 1,
0.1343057, 0.4946752, 2.194051, 1, 1, 1, 1, 1,
0.1372668, -0.09552091, 0.2189421, 1, 1, 1, 1, 1,
0.1378079, 0.03699623, 2.497643, 1, 1, 1, 1, 1,
0.1391527, 0.8044804, 0.1712321, 1, 1, 1, 1, 1,
0.1404981, 0.5296764, 1.456827, 1, 1, 1, 1, 1,
0.1525662, -0.9118114, 3.642605, 1, 1, 1, 1, 1,
0.1538814, -2.172106, 4.679142, 1, 1, 1, 1, 1,
0.1539215, 0.01463395, 0.9463704, 1, 1, 1, 1, 1,
0.1543341, -1.344002, 2.855232, 1, 1, 1, 1, 1,
0.1551029, -0.6310543, 1.923917, 1, 1, 1, 1, 1,
0.1553444, 0.508206, 0.02614693, 1, 1, 1, 1, 1,
0.1563953, 0.03050051, 1.899903, 1, 1, 1, 1, 1,
0.1577366, -0.4835204, 1.805257, 1, 1, 1, 1, 1,
0.1647106, 0.03319498, 3.227335, 1, 1, 1, 1, 1,
0.1648273, 2.422649, -0.1259568, 0, 0, 1, 1, 1,
0.1678842, 0.204767, 0.8200194, 1, 0, 0, 1, 1,
0.1716664, -1.458731, 1.485476, 1, 0, 0, 1, 1,
0.1736201, -0.7349777, 2.370495, 1, 0, 0, 1, 1,
0.1743561, -1.174475, 2.341983, 1, 0, 0, 1, 1,
0.1752876, -0.4262064, 2.465199, 1, 0, 0, 1, 1,
0.1757698, -0.7171329, 3.222639, 0, 0, 0, 1, 1,
0.176029, -0.6438248, 3.69671, 0, 0, 0, 1, 1,
0.181707, -0.3177706, 1.9453, 0, 0, 0, 1, 1,
0.1835111, 1.436585, -0.01055506, 0, 0, 0, 1, 1,
0.1855728, 0.5825101, 2.413316, 0, 0, 0, 1, 1,
0.1871122, -0.2299495, 2.990441, 0, 0, 0, 1, 1,
0.1873687, -0.1905026, 2.149831, 0, 0, 0, 1, 1,
0.1966699, 1.161243, 0.5889767, 1, 1, 1, 1, 1,
0.1970271, 0.746306, 1.927749, 1, 1, 1, 1, 1,
0.2036681, 0.3413086, -0.5257573, 1, 1, 1, 1, 1,
0.206026, 0.04012069, 0.3873689, 1, 1, 1, 1, 1,
0.2071334, -0.6977932, 2.351057, 1, 1, 1, 1, 1,
0.2095279, 0.02765291, 0.6626502, 1, 1, 1, 1, 1,
0.2098028, 0.7709522, 0.08301871, 1, 1, 1, 1, 1,
0.2123025, -0.4336989, 2.338654, 1, 1, 1, 1, 1,
0.2144017, -0.0876976, 2.347491, 1, 1, 1, 1, 1,
0.2144869, -0.02275614, 2.866533, 1, 1, 1, 1, 1,
0.2171426, 1.263678, 0.8762445, 1, 1, 1, 1, 1,
0.2179055, 0.2894363, -0.4682056, 1, 1, 1, 1, 1,
0.2270204, 0.05495248, 1.905935, 1, 1, 1, 1, 1,
0.2299707, -1.077879, 1.485761, 1, 1, 1, 1, 1,
0.2331574, 0.1917001, 1.078781, 1, 1, 1, 1, 1,
0.2334131, -1.234795, 2.810992, 0, 0, 1, 1, 1,
0.2343311, -0.7477459, 2.502188, 1, 0, 0, 1, 1,
0.2367547, -1.153055, 4.017494, 1, 0, 0, 1, 1,
0.2407408, 0.7003731, 0.2776354, 1, 0, 0, 1, 1,
0.2460497, 1.618034, 0.01148429, 1, 0, 0, 1, 1,
0.246825, 0.5188246, -0.05134313, 1, 0, 0, 1, 1,
0.2469306, -0.3465219, 2.808919, 0, 0, 0, 1, 1,
0.2487431, 0.2638099, 1.834149, 0, 0, 0, 1, 1,
0.2503918, 0.3979101, 0.04608635, 0, 0, 0, 1, 1,
0.2589594, 0.6477432, 1.199032, 0, 0, 0, 1, 1,
0.2685811, 0.4496809, 0.2837489, 0, 0, 0, 1, 1,
0.2717118, 0.4302416, 0.9429345, 0, 0, 0, 1, 1,
0.2746838, -1.820192, 1.757978, 0, 0, 0, 1, 1,
0.2785192, 0.8479294, 1.097262, 1, 1, 1, 1, 1,
0.2799562, 0.6120617, 0.3372325, 1, 1, 1, 1, 1,
0.2801715, 0.3742208, 1.831202, 1, 1, 1, 1, 1,
0.2807226, -0.8086277, 1.816086, 1, 1, 1, 1, 1,
0.2811065, -0.1049404, 1.760297, 1, 1, 1, 1, 1,
0.2832786, -1.232344, 3.066322, 1, 1, 1, 1, 1,
0.2835459, 0.5351966, -0.03523155, 1, 1, 1, 1, 1,
0.2849491, 0.3269435, 1.15307, 1, 1, 1, 1, 1,
0.2885598, 0.7361193, -0.7964455, 1, 1, 1, 1, 1,
0.2938082, -1.815786, 5.247247, 1, 1, 1, 1, 1,
0.3018213, -0.3119031, 1.9302, 1, 1, 1, 1, 1,
0.305034, -0.2846366, 2.846861, 1, 1, 1, 1, 1,
0.3060779, -0.5119374, 3.091497, 1, 1, 1, 1, 1,
0.3099974, 0.8161865, 1.109757, 1, 1, 1, 1, 1,
0.3108592, 0.848912, 2.82588, 1, 1, 1, 1, 1,
0.3110059, -0.8267065, 3.17043, 0, 0, 1, 1, 1,
0.3130089, -0.7660982, 3.156336, 1, 0, 0, 1, 1,
0.3172816, -1.433592, 4.367209, 1, 0, 0, 1, 1,
0.3185048, -2.036846, 3.574786, 1, 0, 0, 1, 1,
0.3185968, 0.8810962, -0.1502752, 1, 0, 0, 1, 1,
0.3191796, 0.4628969, 1.444166, 1, 0, 0, 1, 1,
0.3199316, -0.05032666, 0.5160679, 0, 0, 0, 1, 1,
0.331535, 0.9390015, 1.84763, 0, 0, 0, 1, 1,
0.3331945, 1.391044, 2.034103, 0, 0, 0, 1, 1,
0.334453, -0.09605817, 0.5756839, 0, 0, 0, 1, 1,
0.3378372, 0.7540343, -0.06681825, 0, 0, 0, 1, 1,
0.3390519, -0.02350514, 1.240231, 0, 0, 0, 1, 1,
0.3394797, -1.571951, 2.306771, 0, 0, 0, 1, 1,
0.3440748, -1.042619, 3.005215, 1, 1, 1, 1, 1,
0.3457836, -1.851902, 2.512423, 1, 1, 1, 1, 1,
0.3523185, -0.2756665, 1.906451, 1, 1, 1, 1, 1,
0.3570653, 0.6380469, 0.1763707, 1, 1, 1, 1, 1,
0.3579366, -1.206762, 3.06046, 1, 1, 1, 1, 1,
0.3663099, 0.3116928, 0.132692, 1, 1, 1, 1, 1,
0.3729148, 0.068358, 1.531466, 1, 1, 1, 1, 1,
0.3746747, 1.042388, -0.4729556, 1, 1, 1, 1, 1,
0.3767492, 0.05571365, 0.1052886, 1, 1, 1, 1, 1,
0.382553, 1.814054, -0.1268582, 1, 1, 1, 1, 1,
0.3900146, 0.9158539, 0.2384038, 1, 1, 1, 1, 1,
0.3910126, -0.3063884, 2.597232, 1, 1, 1, 1, 1,
0.3920544, 1.44614, 0.0110998, 1, 1, 1, 1, 1,
0.3932152, -0.5866511, 1.64428, 1, 1, 1, 1, 1,
0.395244, 0.8273247, 0.3784155, 1, 1, 1, 1, 1,
0.4027372, -0.7808573, 2.903735, 0, 0, 1, 1, 1,
0.4047429, 0.09413949, 0.8416959, 1, 0, 0, 1, 1,
0.4107206, -1.061207, 1.293654, 1, 0, 0, 1, 1,
0.4141883, 0.04684856, 1.09289, 1, 0, 0, 1, 1,
0.4194084, -0.9265222, 1.614416, 1, 0, 0, 1, 1,
0.4209034, -0.06120143, 0.738138, 1, 0, 0, 1, 1,
0.4256645, 2.03788, -0.5517754, 0, 0, 0, 1, 1,
0.4258162, -0.9739695, 2.890754, 0, 0, 0, 1, 1,
0.4258559, 0.1803031, 1.20747, 0, 0, 0, 1, 1,
0.4311914, -0.9176114, 4.689887, 0, 0, 0, 1, 1,
0.4315855, 0.8869638, -0.4276924, 0, 0, 0, 1, 1,
0.432538, -0.602913, 3.616965, 0, 0, 0, 1, 1,
0.4338662, -1.176777, 3.485029, 0, 0, 0, 1, 1,
0.4402856, 1.03287, -0.7383294, 1, 1, 1, 1, 1,
0.4409428, 0.3385103, 0.07204711, 1, 1, 1, 1, 1,
0.4447603, -1.800411, 3.148292, 1, 1, 1, 1, 1,
0.4461398, 1.48351, -0.0002638243, 1, 1, 1, 1, 1,
0.4522298, -1.254795, 3.541093, 1, 1, 1, 1, 1,
0.4551415, -1.796076, 3.491393, 1, 1, 1, 1, 1,
0.4553817, -0.7622705, 3.22458, 1, 1, 1, 1, 1,
0.4631186, 1.26503, 0.6299713, 1, 1, 1, 1, 1,
0.4639765, 1.078184, -0.1925704, 1, 1, 1, 1, 1,
0.4762518, -0.6219283, 2.773652, 1, 1, 1, 1, 1,
0.4763475, -0.1398165, 3.005434, 1, 1, 1, 1, 1,
0.483565, -1.320025, 2.376156, 1, 1, 1, 1, 1,
0.4843515, -1.308148, 2.751302, 1, 1, 1, 1, 1,
0.4860432, 0.4703067, 0.4338234, 1, 1, 1, 1, 1,
0.4958318, 0.809321, 0.6782303, 1, 1, 1, 1, 1,
0.4970455, 0.4607421, -0.1150068, 0, 0, 1, 1, 1,
0.4982275, -0.6800948, 1.562743, 1, 0, 0, 1, 1,
0.500759, 1.137788, 2.681086, 1, 0, 0, 1, 1,
0.5094651, 2.072973, 0.7553469, 1, 0, 0, 1, 1,
0.5102983, 0.8678404, 0.1203551, 1, 0, 0, 1, 1,
0.5133541, -0.7215872, 1.385628, 1, 0, 0, 1, 1,
0.5150745, -1.181694, 2.278885, 0, 0, 0, 1, 1,
0.5159417, -1.155858, 1.97472, 0, 0, 0, 1, 1,
0.5190205, -0.2936774, 3.181844, 0, 0, 0, 1, 1,
0.5208099, 0.6058546, 0.04689678, 0, 0, 0, 1, 1,
0.5237257, 0.8852164, 0.8910548, 0, 0, 0, 1, 1,
0.5283133, -0.5703614, -0.50595, 0, 0, 0, 1, 1,
0.5293825, 0.930979, -0.2143391, 0, 0, 0, 1, 1,
0.5364357, -2.070462, 3.884394, 1, 1, 1, 1, 1,
0.5379859, 0.1430625, 1.469673, 1, 1, 1, 1, 1,
0.5439537, -1.068037, 2.572429, 1, 1, 1, 1, 1,
0.5459817, 0.6632807, -1.662358, 1, 1, 1, 1, 1,
0.5483438, -0.8514373, 2.65227, 1, 1, 1, 1, 1,
0.5490178, -0.09166044, 1.406969, 1, 1, 1, 1, 1,
0.550405, 0.9816439, 0.1012155, 1, 1, 1, 1, 1,
0.5524864, 0.8464289, 1.839679, 1, 1, 1, 1, 1,
0.5527724, -0.1523061, 1.649665, 1, 1, 1, 1, 1,
0.5546151, -0.6095884, 1.559079, 1, 1, 1, 1, 1,
0.5629627, 0.7879446, -0.410267, 1, 1, 1, 1, 1,
0.5656912, -1.071996, 2.005008, 1, 1, 1, 1, 1,
0.5657292, -1.070586, 2.772363, 1, 1, 1, 1, 1,
0.569346, 2.00475, -0.1944022, 1, 1, 1, 1, 1,
0.5693766, 0.5727129, 0.3371889, 1, 1, 1, 1, 1,
0.5701852, 0.8719882, 0.6211807, 0, 0, 1, 1, 1,
0.5703818, -0.08378001, -0.8666621, 1, 0, 0, 1, 1,
0.5706089, -0.4619772, 3.519508, 1, 0, 0, 1, 1,
0.5719733, 0.9336808, -0.34881, 1, 0, 0, 1, 1,
0.5724306, -0.2961175, 1.854277, 1, 0, 0, 1, 1,
0.5753891, 0.3594914, 1.086681, 1, 0, 0, 1, 1,
0.5765579, -1.814449, 1.900345, 0, 0, 0, 1, 1,
0.5766537, -1.633391, 1.560415, 0, 0, 0, 1, 1,
0.5873107, -0.08797687, 1.373397, 0, 0, 0, 1, 1,
0.5887426, -0.1902566, 1.88742, 0, 0, 0, 1, 1,
0.5894707, 0.6481919, 0.2137436, 0, 0, 0, 1, 1,
0.5903394, -1.111916, 2.747517, 0, 0, 0, 1, 1,
0.5917689, 1.562824, -0.4509164, 0, 0, 0, 1, 1,
0.5943198, 0.4633564, 0.8750102, 1, 1, 1, 1, 1,
0.5975246, 2.608412, 1.294167, 1, 1, 1, 1, 1,
0.6006755, -1.265808, 2.190791, 1, 1, 1, 1, 1,
0.601258, 0.5604607, 0.5465079, 1, 1, 1, 1, 1,
0.6014537, -0.6528305, 2.227346, 1, 1, 1, 1, 1,
0.6025594, -0.9804837, 4.26099, 1, 1, 1, 1, 1,
0.6035582, 0.6923156, 0.670862, 1, 1, 1, 1, 1,
0.6104714, 2.15444, 0.311397, 1, 1, 1, 1, 1,
0.6202193, -0.6121578, 2.732112, 1, 1, 1, 1, 1,
0.6216396, 1.127855, -0.5748509, 1, 1, 1, 1, 1,
0.6257102, 1.044032, 0.9068474, 1, 1, 1, 1, 1,
0.6274614, -0.1712304, 2.466768, 1, 1, 1, 1, 1,
0.6384482, -0.2938886, 0.3928758, 1, 1, 1, 1, 1,
0.6439318, 0.7442667, 0.525633, 1, 1, 1, 1, 1,
0.6472577, 0.6327493, 1.552702, 1, 1, 1, 1, 1,
0.6527643, 1.304494, 1.843079, 0, 0, 1, 1, 1,
0.6535273, -0.1025093, 1.305738, 1, 0, 0, 1, 1,
0.6563116, 0.1793208, 1.062447, 1, 0, 0, 1, 1,
0.6574906, 0.9660878, -0.3930297, 1, 0, 0, 1, 1,
0.6629674, -0.4199584, 1.502477, 1, 0, 0, 1, 1,
0.6671609, 0.1095796, 0.3763407, 1, 0, 0, 1, 1,
0.6692643, 0.6026866, 1.783532, 0, 0, 0, 1, 1,
0.6733698, -0.3771911, 1.814821, 0, 0, 0, 1, 1,
0.6831689, -0.9195303, 4.381376, 0, 0, 0, 1, 1,
0.6876974, 1.676296, -0.1528565, 0, 0, 0, 1, 1,
0.6978341, 0.498917, 0.5557148, 0, 0, 0, 1, 1,
0.7021249, -0.3634322, 1.345063, 0, 0, 0, 1, 1,
0.703913, 2.180731, 1.792022, 0, 0, 0, 1, 1,
0.7041504, 1.404408, 0.3795672, 1, 1, 1, 1, 1,
0.7068792, 0.5816021, 0.1354823, 1, 1, 1, 1, 1,
0.7098445, -1.169573, 4.813357, 1, 1, 1, 1, 1,
0.7101134, 0.002044206, 0.4143468, 1, 1, 1, 1, 1,
0.7119226, 0.808785, 1.305421, 1, 1, 1, 1, 1,
0.7129478, 0.3043182, 0.2387118, 1, 1, 1, 1, 1,
0.713777, -0.786956, 2.478252, 1, 1, 1, 1, 1,
0.7140123, -0.655326, 2.287988, 1, 1, 1, 1, 1,
0.718562, 0.1605695, 0.7146482, 1, 1, 1, 1, 1,
0.7239274, -1.914308, 2.953974, 1, 1, 1, 1, 1,
0.7273055, -0.2045397, 1.653897, 1, 1, 1, 1, 1,
0.7297781, -1.633926, 2.60329, 1, 1, 1, 1, 1,
0.7298148, -0.5124004, 1.35019, 1, 1, 1, 1, 1,
0.7306182, 1.310295, -0.09545822, 1, 1, 1, 1, 1,
0.7347145, -0.2257002, 1.571308, 1, 1, 1, 1, 1,
0.7392243, 0.3890342, 1.03071, 0, 0, 1, 1, 1,
0.7398412, -1.245103, 2.534484, 1, 0, 0, 1, 1,
0.7406767, -0.172907, 0.8754131, 1, 0, 0, 1, 1,
0.7499656, -0.8999412, 1.725539, 1, 0, 0, 1, 1,
0.7545955, 2.173148, 0.3412603, 1, 0, 0, 1, 1,
0.7578118, -0.6207753, 2.213243, 1, 0, 0, 1, 1,
0.7586213, 1.451498, 1.406221, 0, 0, 0, 1, 1,
0.758948, 0.8178971, 1.601777, 0, 0, 0, 1, 1,
0.7618992, 0.3471754, 1.948726, 0, 0, 0, 1, 1,
0.7678685, -1.196648, 3.594386, 0, 0, 0, 1, 1,
0.7809305, -0.9923508, 2.85025, 0, 0, 0, 1, 1,
0.782886, -0.6260756, 1.864474, 0, 0, 0, 1, 1,
0.786738, -1.493538, 1.780335, 0, 0, 0, 1, 1,
0.7884597, 0.9668961, 2.098552, 1, 1, 1, 1, 1,
0.7906653, 1.429417, 1.72393, 1, 1, 1, 1, 1,
0.7920673, 0.1833221, 2.212687, 1, 1, 1, 1, 1,
0.7926443, -0.5061249, 2.618289, 1, 1, 1, 1, 1,
0.7954202, 0.8666948, 0.386613, 1, 1, 1, 1, 1,
0.8000109, -0.7577342, 1.816262, 1, 1, 1, 1, 1,
0.8002617, 1.504193, 1.147022, 1, 1, 1, 1, 1,
0.8006224, -0.4417543, 2.501564, 1, 1, 1, 1, 1,
0.8011898, -0.08490939, 3.652385, 1, 1, 1, 1, 1,
0.8052189, -0.7661521, 2.757146, 1, 1, 1, 1, 1,
0.8073594, 0.3820023, 1.305849, 1, 1, 1, 1, 1,
0.8095347, -0.5716318, 1.479425, 1, 1, 1, 1, 1,
0.8143808, 1.435711, 1.429851, 1, 1, 1, 1, 1,
0.8156783, 1.586424, 0.09597757, 1, 1, 1, 1, 1,
0.8162249, -0.7798495, 1.151745, 1, 1, 1, 1, 1,
0.8175089, -0.4795654, 1.474735, 0, 0, 1, 1, 1,
0.821182, 1.062824, -0.8727884, 1, 0, 0, 1, 1,
0.8222423, 0.1164618, 1.327965, 1, 0, 0, 1, 1,
0.823114, 0.7292541, 0.9066986, 1, 0, 0, 1, 1,
0.8287734, -0.359145, 2.18106, 1, 0, 0, 1, 1,
0.8314077, -0.2688233, 1.928499, 1, 0, 0, 1, 1,
0.8346709, -0.5489076, 2.417405, 0, 0, 0, 1, 1,
0.8418254, 0.8206328, 1.309812, 0, 0, 0, 1, 1,
0.8482659, -2.011017, 4.507986, 0, 0, 0, 1, 1,
0.8485807, 0.5272257, 2.716155, 0, 0, 0, 1, 1,
0.8543647, 0.5318912, 0.06765509, 0, 0, 0, 1, 1,
0.8554717, -0.2077188, 2.260603, 0, 0, 0, 1, 1,
0.8571562, -0.2406883, 0.8100426, 0, 0, 0, 1, 1,
0.8639343, -0.9097359, 1.353448, 1, 1, 1, 1, 1,
0.864704, -0.7550672, 2.417082, 1, 1, 1, 1, 1,
0.8655421, 0.2320859, -0.1250803, 1, 1, 1, 1, 1,
0.8675819, -0.5581384, 1.129893, 1, 1, 1, 1, 1,
0.8678276, -1.076662, 3.915771, 1, 1, 1, 1, 1,
0.8767782, 1.495853, 0.1640508, 1, 1, 1, 1, 1,
0.8781902, 1.262726, 0.5703188, 1, 1, 1, 1, 1,
0.8824211, -0.03898887, -1.34661, 1, 1, 1, 1, 1,
0.8899599, -0.425415, 2.658677, 1, 1, 1, 1, 1,
0.8907859, 2.959338, -0.3156716, 1, 1, 1, 1, 1,
0.8912745, -0.06004491, 0.2930252, 1, 1, 1, 1, 1,
0.8953975, -1.701104, 2.533377, 1, 1, 1, 1, 1,
0.8963071, -0.683577, 2.607345, 1, 1, 1, 1, 1,
0.9242486, -0.2800827, 2.80853, 1, 1, 1, 1, 1,
0.925256, 0.6530683, 1.541778, 1, 1, 1, 1, 1,
0.9259212, -0.9026093, 2.845128, 0, 0, 1, 1, 1,
0.9289964, -1.094421, 3.201, 1, 0, 0, 1, 1,
0.9323772, 1.4989, 1.582951, 1, 0, 0, 1, 1,
0.9327587, 0.4351388, -0.6895829, 1, 0, 0, 1, 1,
0.9339206, 0.2313046, 1.686711, 1, 0, 0, 1, 1,
0.9371727, 1.020613, 3.364402, 1, 0, 0, 1, 1,
0.9399698, 1.333693, 0.3713111, 0, 0, 0, 1, 1,
0.9416842, -0.07773246, 0.7743014, 0, 0, 0, 1, 1,
0.9429914, 0.6038004, -0.154836, 0, 0, 0, 1, 1,
0.943342, 0.4299319, 0.8475089, 0, 0, 0, 1, 1,
0.9444091, 0.6519354, 2.303543, 0, 0, 0, 1, 1,
0.9518798, 0.713868, 1.861483, 0, 0, 0, 1, 1,
0.9547108, -0.4692436, 1.030467, 0, 0, 0, 1, 1,
0.9563832, 0.04550898, 0.5770311, 1, 1, 1, 1, 1,
0.9594468, -0.8737576, 1.039502, 1, 1, 1, 1, 1,
0.9603162, 0.3643783, -0.2580394, 1, 1, 1, 1, 1,
0.9626775, 0.07149661, 0.2900306, 1, 1, 1, 1, 1,
0.9712024, 0.2616035, 0.6845315, 1, 1, 1, 1, 1,
0.9719663, 0.5251138, 0.136346, 1, 1, 1, 1, 1,
0.9729151, 0.4780557, 2.135694, 1, 1, 1, 1, 1,
0.9731213, 0.2827004, 0.7498085, 1, 1, 1, 1, 1,
0.9764224, -0.3370509, 3.048175, 1, 1, 1, 1, 1,
0.9776772, 0.07428808, 0.6842659, 1, 1, 1, 1, 1,
0.9784828, 0.6973935, 0.8312533, 1, 1, 1, 1, 1,
0.979398, -0.6433846, 1.060477, 1, 1, 1, 1, 1,
0.9795436, 2.174543, 0.703841, 1, 1, 1, 1, 1,
0.987009, 1.048031, 0.4134013, 1, 1, 1, 1, 1,
0.9956767, 0.3052986, 0.2414764, 1, 1, 1, 1, 1,
0.9961301, 2.054367, 1.82908, 0, 0, 1, 1, 1,
0.9962775, 1.229611, 0.4590125, 1, 0, 0, 1, 1,
0.9966389, -2.331079, 1.668215, 1, 0, 0, 1, 1,
1.006784, 0.8193629, 1.147987, 1, 0, 0, 1, 1,
1.006972, -1.646825, 2.411051, 1, 0, 0, 1, 1,
1.013487, -0.07605674, 2.642568, 1, 0, 0, 1, 1,
1.015153, 0.9787796, 0.4388805, 0, 0, 0, 1, 1,
1.019327, 0.421403, 0.2959497, 0, 0, 0, 1, 1,
1.02686, -0.4197226, 1.114982, 0, 0, 0, 1, 1,
1.026905, 0.5503468, 1.064062, 0, 0, 0, 1, 1,
1.03033, 0.06753911, 2.00892, 0, 0, 0, 1, 1,
1.030782, 0.4208801, 0.292466, 0, 0, 0, 1, 1,
1.035926, 1.424769, 0.6326227, 0, 0, 0, 1, 1,
1.037735, -0.4475147, 1.254043, 1, 1, 1, 1, 1,
1.044448, -0.6347698, 2.972342, 1, 1, 1, 1, 1,
1.049688, -0.5957628, 0.8597037, 1, 1, 1, 1, 1,
1.050275, 0.921401, 1.19363, 1, 1, 1, 1, 1,
1.054151, 0.6617002, 0.08355408, 1, 1, 1, 1, 1,
1.064523, 0.9025363, 1.991766, 1, 1, 1, 1, 1,
1.064601, 0.2477659, 2.321877, 1, 1, 1, 1, 1,
1.06721, 1.712341, 0.8333486, 1, 1, 1, 1, 1,
1.067468, 1.134943, 0.4153304, 1, 1, 1, 1, 1,
1.068374, -0.2911234, 1.835911, 1, 1, 1, 1, 1,
1.073094, -1.445248, 2.681844, 1, 1, 1, 1, 1,
1.086575, -1.217079, 2.490355, 1, 1, 1, 1, 1,
1.086715, -0.2037584, 1.260622, 1, 1, 1, 1, 1,
1.091473, 0.1610962, 1.575759, 1, 1, 1, 1, 1,
1.092536, -1.457463, 2.786556, 1, 1, 1, 1, 1,
1.107427, -0.5698175, 2.263542, 0, 0, 1, 1, 1,
1.112342, -0.06260008, 0.9192943, 1, 0, 0, 1, 1,
1.118023, -0.3003761, 0.691829, 1, 0, 0, 1, 1,
1.118326, 0.4345493, 1.078935, 1, 0, 0, 1, 1,
1.125273, 0.7759486, 0.2471698, 1, 0, 0, 1, 1,
1.126826, 0.8806422, -1.15391, 1, 0, 0, 1, 1,
1.12851, -1.068073, 2.792553, 0, 0, 0, 1, 1,
1.131747, 0.2733344, 2.072607, 0, 0, 0, 1, 1,
1.137187, 0.4944177, 1.048643, 0, 0, 0, 1, 1,
1.138307, -0.1473622, 3.77465, 0, 0, 0, 1, 1,
1.139426, 1.2419, 0.7516524, 0, 0, 0, 1, 1,
1.140791, 1.208363, -1.557042, 0, 0, 0, 1, 1,
1.143465, 0.7502272, 0.3798324, 0, 0, 0, 1, 1,
1.153477, 1.043456, 0.4173327, 1, 1, 1, 1, 1,
1.16387, 0.2665832, 1.973398, 1, 1, 1, 1, 1,
1.164053, -1.873442, 1.985911, 1, 1, 1, 1, 1,
1.167642, -0.789722, 0.8005595, 1, 1, 1, 1, 1,
1.169254, -0.4625199, 1.688307, 1, 1, 1, 1, 1,
1.171388, -1.402601, 1.678914, 1, 1, 1, 1, 1,
1.186401, 0.1874577, -0.3467552, 1, 1, 1, 1, 1,
1.18769, 1.202301, 0.3353911, 1, 1, 1, 1, 1,
1.192091, -0.9655908, 3.071336, 1, 1, 1, 1, 1,
1.197091, -0.8759001, 0.9174295, 1, 1, 1, 1, 1,
1.206935, -1.74996, 1.957109, 1, 1, 1, 1, 1,
1.210658, 1.938563, 0.6293679, 1, 1, 1, 1, 1,
1.212872, 0.8694489, 2.052308, 1, 1, 1, 1, 1,
1.218084, -1.770333, 3.134777, 1, 1, 1, 1, 1,
1.220485, 1.05632, 1.805134, 1, 1, 1, 1, 1,
1.221922, 0.5923437, 2.050439, 0, 0, 1, 1, 1,
1.223761, -0.3701502, 2.021482, 1, 0, 0, 1, 1,
1.224305, -1.220068, 2.593637, 1, 0, 0, 1, 1,
1.22581, -1.279658, 2.74532, 1, 0, 0, 1, 1,
1.230244, 0.3325959, 2.879235, 1, 0, 0, 1, 1,
1.232896, -0.4590042, 3.052409, 1, 0, 0, 1, 1,
1.233958, -2.404457, 2.142629, 0, 0, 0, 1, 1,
1.23624, -0.4267204, 1.645483, 0, 0, 0, 1, 1,
1.243173, 0.9299163, 0.7612358, 0, 0, 0, 1, 1,
1.24383, 1.013064, 1.637815, 0, 0, 0, 1, 1,
1.251917, -1.743035, 1.686614, 0, 0, 0, 1, 1,
1.281701, -0.1507175, 2.293996, 0, 0, 0, 1, 1,
1.282661, -0.6283419, 2.729122, 0, 0, 0, 1, 1,
1.287425, 0.1316017, 1.721193, 1, 1, 1, 1, 1,
1.29154, 1.189476, 0.7636927, 1, 1, 1, 1, 1,
1.293629, -0.1908024, 2.016042, 1, 1, 1, 1, 1,
1.295378, 1.453953, 1.516208, 1, 1, 1, 1, 1,
1.306203, 1.26644, 0.7939721, 1, 1, 1, 1, 1,
1.311761, -0.01167754, 1.168298, 1, 1, 1, 1, 1,
1.332063, -0.2891184, 1.256768, 1, 1, 1, 1, 1,
1.332793, -1.059846, 3.019886, 1, 1, 1, 1, 1,
1.335407, -0.635978, 1.085498, 1, 1, 1, 1, 1,
1.350852, -1.856425, 2.61746, 1, 1, 1, 1, 1,
1.362024, -0.5866315, 1.863333, 1, 1, 1, 1, 1,
1.367666, 1.676592, 1.163193, 1, 1, 1, 1, 1,
1.36866, 1.477618, 1.17916, 1, 1, 1, 1, 1,
1.37486, 0.2557865, -0.2557774, 1, 1, 1, 1, 1,
1.381108, -0.3276753, 1.506305, 1, 1, 1, 1, 1,
1.38179, 0.6127458, 3.414349, 0, 0, 1, 1, 1,
1.38563, -0.1505697, 1.353103, 1, 0, 0, 1, 1,
1.391919, -2.266433, 2.904234, 1, 0, 0, 1, 1,
1.396623, 0.6576028, 0.5193352, 1, 0, 0, 1, 1,
1.40171, -0.2316467, 1.299276, 1, 0, 0, 1, 1,
1.405253, 0.9860241, 0.4664437, 1, 0, 0, 1, 1,
1.409685, -1.206138, 2.293698, 0, 0, 0, 1, 1,
1.423228, -0.880954, 2.596978, 0, 0, 0, 1, 1,
1.424114, -0.3418968, 2.286423, 0, 0, 0, 1, 1,
1.435993, 1.080175, 0.7615712, 0, 0, 0, 1, 1,
1.442988, 1.133073, -0.4071283, 0, 0, 0, 1, 1,
1.459768, -0.265334, 2.77711, 0, 0, 0, 1, 1,
1.467278, 0.5134214, 1.030383, 0, 0, 0, 1, 1,
1.477722, 0.9703587, 1.520705, 1, 1, 1, 1, 1,
1.483631, 0.6686021, 1.118602, 1, 1, 1, 1, 1,
1.494664, 0.3389654, -0.417636, 1, 1, 1, 1, 1,
1.502325, -0.5307489, 1.516818, 1, 1, 1, 1, 1,
1.508866, 0.9716925, 2.254123, 1, 1, 1, 1, 1,
1.509655, -0.1570687, 0.2173745, 1, 1, 1, 1, 1,
1.513714, 0.6330636, 0.4319498, 1, 1, 1, 1, 1,
1.534813, 0.2229723, 2.935884, 1, 1, 1, 1, 1,
1.536553, 0.2369366, 0.9123926, 1, 1, 1, 1, 1,
1.548738, 0.3154059, 2.439391, 1, 1, 1, 1, 1,
1.572443, -0.3220362, 3.322795, 1, 1, 1, 1, 1,
1.584707, -0.4162437, 2.649034, 1, 1, 1, 1, 1,
1.593351, -1.910169, 1.850757, 1, 1, 1, 1, 1,
1.60254, 0.4552588, 0.8300049, 1, 1, 1, 1, 1,
1.620961, 0.39645, 2.58496, 1, 1, 1, 1, 1,
1.621139, 0.0659905, 1.639265, 0, 0, 1, 1, 1,
1.656764, -0.7926626, 2.014151, 1, 0, 0, 1, 1,
1.671971, 1.288108, 0.6957788, 1, 0, 0, 1, 1,
1.69057, -0.6502495, 2.637299, 1, 0, 0, 1, 1,
1.703884, 0.0839975, 1.766491, 1, 0, 0, 1, 1,
1.703939, -0.6111972, 2.799416, 1, 0, 0, 1, 1,
1.71626, 1.957913, 2.17855, 0, 0, 0, 1, 1,
1.724401, -0.5428515, 0.6614441, 0, 0, 0, 1, 1,
1.731885, -0.848792, 1.825904, 0, 0, 0, 1, 1,
1.73328, 1.192933, 1.032804, 0, 0, 0, 1, 1,
1.73339, 0.5934845, 0.4025455, 0, 0, 0, 1, 1,
1.741004, 0.8898627, -0.3969111, 0, 0, 0, 1, 1,
1.749086, 0.1626475, 2.647189, 0, 0, 0, 1, 1,
1.769992, -1.887515, 2.350661, 1, 1, 1, 1, 1,
1.787598, -1.688307, 1.951871, 1, 1, 1, 1, 1,
1.793885, -0.7812998, 2.745612, 1, 1, 1, 1, 1,
1.798546, -0.5885345, 1.942375, 1, 1, 1, 1, 1,
1.814266, 1.836827, 1.444366, 1, 1, 1, 1, 1,
1.837676, -1.661821, -0.4671324, 1, 1, 1, 1, 1,
1.843962, 0.09473512, 1.009779, 1, 1, 1, 1, 1,
1.891649, -0.04952177, 2.792437, 1, 1, 1, 1, 1,
1.898686, -0.6763746, 1.889038, 1, 1, 1, 1, 1,
1.907729, 1.461519, 2.380643, 1, 1, 1, 1, 1,
1.986602, -0.8624136, 2.353914, 1, 1, 1, 1, 1,
1.990102, 1.72844, 1.665072, 1, 1, 1, 1, 1,
1.991742, -1.763856, 1.814704, 1, 1, 1, 1, 1,
2.044734, -0.2755438, 2.297802, 1, 1, 1, 1, 1,
2.074964, -0.2218544, 3.018822, 1, 1, 1, 1, 1,
2.170555, -1.681272, 1.50136, 0, 0, 1, 1, 1,
2.226354, 1.096494, 1.12055, 1, 0, 0, 1, 1,
2.245443, -1.400725, 2.746962, 1, 0, 0, 1, 1,
2.251371, -0.8867759, 1.928813, 1, 0, 0, 1, 1,
2.258242, 1.097248, 0.03058411, 1, 0, 0, 1, 1,
2.271397, -0.06616943, -1.212243, 1, 0, 0, 1, 1,
2.285821, -0.6880237, 1.490233, 0, 0, 0, 1, 1,
2.302607, 0.6909539, 2.016154, 0, 0, 0, 1, 1,
2.330278, -0.1012725, 1.768034, 0, 0, 0, 1, 1,
2.379914, -0.04427535, 1.56647, 0, 0, 0, 1, 1,
2.382362, 0.8743328, 3.153203, 0, 0, 0, 1, 1,
2.382613, -1.399926, 1.865442, 0, 0, 0, 1, 1,
2.424136, 0.07230627, 2.990295, 0, 0, 0, 1, 1,
2.439076, -0.0004859713, 0.7672207, 1, 1, 1, 1, 1,
2.474847, -0.4475236, 1.036154, 1, 1, 1, 1, 1,
2.5723, 1.515893, 1.491228, 1, 1, 1, 1, 1,
2.5972, -0.2544631, 0.809086, 1, 1, 1, 1, 1,
2.686029, -0.2060815, 1.631544, 1, 1, 1, 1, 1,
2.878975, -0.220728, 1.957739, 1, 1, 1, 1, 1,
3.345904, 0.9200076, 0.5475829, 1, 1, 1, 1, 1
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
var radius = 9.440779;
var distance = 33.16034;
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
mvMatrix.translate( -0.04418755, -0.3861296, 0.08824253 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16034);
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
