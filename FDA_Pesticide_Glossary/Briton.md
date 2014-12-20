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
-2.894214, -0.5803571, -1.617845, 1, 0, 0, 1,
-2.804573, -0.02677299, -0.9937907, 1, 0.007843138, 0, 1,
-2.726972, -0.006909884, -2.722169, 1, 0.01176471, 0, 1,
-2.690773, 0.0733072, -0.7997155, 1, 0.01960784, 0, 1,
-2.674564, -0.8022176, -3.340415, 1, 0.02352941, 0, 1,
-2.476604, -0.8787966, -1.955878, 1, 0.03137255, 0, 1,
-2.418219, 0.5704716, -0.9840363, 1, 0.03529412, 0, 1,
-2.275795, -0.2341364, -2.163589, 1, 0.04313726, 0, 1,
-2.269538, 1.192691, -1.788953, 1, 0.04705882, 0, 1,
-2.25677, -0.2449094, -2.216278, 1, 0.05490196, 0, 1,
-2.216621, 0.3150616, -1.819103, 1, 0.05882353, 0, 1,
-2.202474, -0.1198828, -1.774317, 1, 0.06666667, 0, 1,
-2.202278, -0.7254608, -1.691814, 1, 0.07058824, 0, 1,
-2.166345, -0.3439153, -2.566512, 1, 0.07843138, 0, 1,
-2.142804, 0.1879239, -1.57955, 1, 0.08235294, 0, 1,
-2.10847, -0.7194313, -1.219194, 1, 0.09019608, 0, 1,
-2.030168, 0.2018365, -3.473235, 1, 0.09411765, 0, 1,
-2.015604, 2.474866, -0.9811438, 1, 0.1019608, 0, 1,
-2.002434, -0.03180262, -1.387768, 1, 0.1098039, 0, 1,
-1.997628, 0.6017623, -1.539421, 1, 0.1137255, 0, 1,
-1.996619, 0.415612, -2.121059, 1, 0.1215686, 0, 1,
-1.992103, -0.8516396, -3.288869, 1, 0.1254902, 0, 1,
-1.989644, -0.7473657, -2.458841, 1, 0.1333333, 0, 1,
-1.97762, 1.009471, -2.932463, 1, 0.1372549, 0, 1,
-1.953594, 0.3113642, 0.2072179, 1, 0.145098, 0, 1,
-1.947249, -0.5992166, -3.341024, 1, 0.1490196, 0, 1,
-1.944859, -0.7359719, -2.35917, 1, 0.1568628, 0, 1,
-1.905897, 0.9976285, -0.7280884, 1, 0.1607843, 0, 1,
-1.892191, -1.578238, -0.9699829, 1, 0.1686275, 0, 1,
-1.850342, 0.1400051, -2.253225, 1, 0.172549, 0, 1,
-1.831404, 1.860399, -1.209039, 1, 0.1803922, 0, 1,
-1.802082, -0.07352501, -2.18791, 1, 0.1843137, 0, 1,
-1.776642, -1.374399, -1.603845, 1, 0.1921569, 0, 1,
-1.7747, -0.5230422, -2.341096, 1, 0.1960784, 0, 1,
-1.754414, -0.8933461, -2.216023, 1, 0.2039216, 0, 1,
-1.75166, -0.8220716, -2.786637, 1, 0.2117647, 0, 1,
-1.750044, 0.1302746, -1.375652, 1, 0.2156863, 0, 1,
-1.747344, -0.4211475, -0.6407, 1, 0.2235294, 0, 1,
-1.730422, 1.927294, -0.4776824, 1, 0.227451, 0, 1,
-1.663553, -0.8593253, -2.464332, 1, 0.2352941, 0, 1,
-1.662536, 0.4055215, -2.132019, 1, 0.2392157, 0, 1,
-1.660032, -0.7983159, -1.374842, 1, 0.2470588, 0, 1,
-1.646365, 0.3259676, -1.335548, 1, 0.2509804, 0, 1,
-1.630106, -0.5130373, -0.1694416, 1, 0.2588235, 0, 1,
-1.611865, -1.583908, -1.170903, 1, 0.2627451, 0, 1,
-1.60029, 0.6325316, -0.764288, 1, 0.2705882, 0, 1,
-1.594844, 0.9195375, 1.259274, 1, 0.2745098, 0, 1,
-1.58733, 1.962887, -0.7638783, 1, 0.282353, 0, 1,
-1.58411, 0.5126468, -2.127291, 1, 0.2862745, 0, 1,
-1.583435, 1.060573, -0.8451453, 1, 0.2941177, 0, 1,
-1.58138, -1.80082, -2.343181, 1, 0.3019608, 0, 1,
-1.576951, -1.234378, -2.627215, 1, 0.3058824, 0, 1,
-1.572651, -0.7246801, -1.938647, 1, 0.3137255, 0, 1,
-1.561237, 1.614205, -1.309454, 1, 0.3176471, 0, 1,
-1.535342, -0.1243333, -3.114143, 1, 0.3254902, 0, 1,
-1.532996, 0.3401431, -2.428513, 1, 0.3294118, 0, 1,
-1.531465, 0.7111481, -1.225933, 1, 0.3372549, 0, 1,
-1.512859, -0.8763753, -4.671802, 1, 0.3411765, 0, 1,
-1.511769, -0.008964765, -2.66579, 1, 0.3490196, 0, 1,
-1.511191, -0.464282, -1.616328, 1, 0.3529412, 0, 1,
-1.508387, 0.8296248, -1.078879, 1, 0.3607843, 0, 1,
-1.489843, -1.451116, -1.17547, 1, 0.3647059, 0, 1,
-1.478823, 0.1282821, -0.8872129, 1, 0.372549, 0, 1,
-1.474876, 2.316339, -1.303987, 1, 0.3764706, 0, 1,
-1.470291, -0.9641745, -3.840709, 1, 0.3843137, 0, 1,
-1.464339, 0.4589006, -1.080777, 1, 0.3882353, 0, 1,
-1.451244, 1.547245, -1.44388, 1, 0.3960784, 0, 1,
-1.446347, 0.4039166, -1.739211, 1, 0.4039216, 0, 1,
-1.445583, 0.3567716, -0.5581136, 1, 0.4078431, 0, 1,
-1.44143, -0.7777216, -0.9172186, 1, 0.4156863, 0, 1,
-1.438483, -1.706828, -3.37551, 1, 0.4196078, 0, 1,
-1.435911, 0.578751, 1.089776, 1, 0.427451, 0, 1,
-1.42305, -0.2192958, -0.6390457, 1, 0.4313726, 0, 1,
-1.419398, 0.2918371, -1.380148, 1, 0.4392157, 0, 1,
-1.419281, 0.3909995, -0.721444, 1, 0.4431373, 0, 1,
-1.417352, 2.015643, -0.9005114, 1, 0.4509804, 0, 1,
-1.413729, -0.8420564, -3.5677, 1, 0.454902, 0, 1,
-1.413224, 0.1447963, -2.511793, 1, 0.4627451, 0, 1,
-1.407984, 0.678596, -1.283127, 1, 0.4666667, 0, 1,
-1.393709, -0.03780722, -2.196901, 1, 0.4745098, 0, 1,
-1.391527, 1.66833, -0.1647927, 1, 0.4784314, 0, 1,
-1.371895, -0.0582938, -3.70194, 1, 0.4862745, 0, 1,
-1.365137, -0.4791459, -2.582935, 1, 0.4901961, 0, 1,
-1.364732, 0.3010101, -1.050599, 1, 0.4980392, 0, 1,
-1.359704, -0.3755883, -1.941505, 1, 0.5058824, 0, 1,
-1.355492, -0.8702321, -3.544589, 1, 0.509804, 0, 1,
-1.341779, -1.027327, -1.470293, 1, 0.5176471, 0, 1,
-1.330478, 0.5319418, -1.690418, 1, 0.5215687, 0, 1,
-1.325254, 0.9087779, -1.566326, 1, 0.5294118, 0, 1,
-1.316602, 1.82592, -0.9050841, 1, 0.5333334, 0, 1,
-1.315302, 0.9285795, -0.08077718, 1, 0.5411765, 0, 1,
-1.297796, -0.5585931, -0.8910437, 1, 0.5450981, 0, 1,
-1.295506, -0.273305, -1.29547, 1, 0.5529412, 0, 1,
-1.295015, 0.64377, -1.395788, 1, 0.5568628, 0, 1,
-1.292679, -0.532871, -1.872559, 1, 0.5647059, 0, 1,
-1.292425, -1.168605, -2.726457, 1, 0.5686275, 0, 1,
-1.275148, -2.354208, -0.3793595, 1, 0.5764706, 0, 1,
-1.259902, 0.4497142, -3.82546, 1, 0.5803922, 0, 1,
-1.227491, -0.3365437, -2.167921, 1, 0.5882353, 0, 1,
-1.227345, -0.1071361, -3.075248, 1, 0.5921569, 0, 1,
-1.22566, 0.0765576, -1.094886, 1, 0.6, 0, 1,
-1.225303, -0.3054265, -2.076277, 1, 0.6078432, 0, 1,
-1.217953, -0.4995028, -1.074903, 1, 0.6117647, 0, 1,
-1.216457, 0.7429032, -2.190116, 1, 0.6196079, 0, 1,
-1.212901, -1.044395, -0.3768357, 1, 0.6235294, 0, 1,
-1.201512, 0.1352787, -1.96293, 1, 0.6313726, 0, 1,
-1.191264, -0.08716393, -1.397286, 1, 0.6352941, 0, 1,
-1.181474, 0.8274112, 1.289967, 1, 0.6431373, 0, 1,
-1.179811, -2.458566, -4.068803, 1, 0.6470588, 0, 1,
-1.17311, 1.664494, 0.5714299, 1, 0.654902, 0, 1,
-1.168106, -0.4356706, 0.04680779, 1, 0.6588235, 0, 1,
-1.167236, -0.7837126, -2.791764, 1, 0.6666667, 0, 1,
-1.159717, 0.2807284, -2.233894, 1, 0.6705883, 0, 1,
-1.15508, 0.1499914, -1.56497, 1, 0.6784314, 0, 1,
-1.153459, 0.2792433, -1.323612, 1, 0.682353, 0, 1,
-1.150589, -0.1038458, -1.432863, 1, 0.6901961, 0, 1,
-1.149871, -0.3816023, -1.727483, 1, 0.6941177, 0, 1,
-1.124962, -0.08582761, -1.658903, 1, 0.7019608, 0, 1,
-1.118984, 0.1223412, -1.638356, 1, 0.7098039, 0, 1,
-1.105069, 0.7321939, 0.2134553, 1, 0.7137255, 0, 1,
-1.096495, 0.825837, 0.08666845, 1, 0.7215686, 0, 1,
-1.089571, 1.025046, 0.5230176, 1, 0.7254902, 0, 1,
-1.086724, -0.4945855, -0.8505203, 1, 0.7333333, 0, 1,
-1.086094, 0.8303667, -1.357031, 1, 0.7372549, 0, 1,
-1.076669, 0.644311, 0.3019973, 1, 0.7450981, 0, 1,
-1.070459, 0.2701912, -0.6901572, 1, 0.7490196, 0, 1,
-1.064985, 0.3200719, -0.8742548, 1, 0.7568628, 0, 1,
-1.063026, 0.2100623, -1.187298, 1, 0.7607843, 0, 1,
-1.054337, -0.4372585, -2.015469, 1, 0.7686275, 0, 1,
-1.053388, 0.02408626, -2.758896, 1, 0.772549, 0, 1,
-1.052531, -1.253319, -2.10159, 1, 0.7803922, 0, 1,
-1.045866, -1.401198, -2.848324, 1, 0.7843137, 0, 1,
-1.035379, -0.9260378, -0.4519289, 1, 0.7921569, 0, 1,
-1.035144, -1.943075, -1.413017, 1, 0.7960784, 0, 1,
-1.034299, 1.113374, -0.0392129, 1, 0.8039216, 0, 1,
-1.031816, 0.302844, -1.945197, 1, 0.8117647, 0, 1,
-1.025395, -1.004236, -2.38103, 1, 0.8156863, 0, 1,
-1.023727, 1.490651, -2.115393, 1, 0.8235294, 0, 1,
-1.022544, 0.7709399, -1.371337, 1, 0.827451, 0, 1,
-1.021436, -0.7869861, -4.848108, 1, 0.8352941, 0, 1,
-1.017146, -0.9822011, -3.278785, 1, 0.8392157, 0, 1,
-1.012216, -0.6565732, -1.984447, 1, 0.8470588, 0, 1,
-1.007098, -1.222364, -1.738749, 1, 0.8509804, 0, 1,
-1.00041, -1.641021, -3.985247, 1, 0.8588235, 0, 1,
-0.9990036, -0.5037482, -2.055376, 1, 0.8627451, 0, 1,
-0.9966249, -1.053118, -3.937682, 1, 0.8705882, 0, 1,
-0.9958805, -0.1059589, -1.683758, 1, 0.8745098, 0, 1,
-0.9918712, -0.76744, -1.050216, 1, 0.8823529, 0, 1,
-0.9887382, -0.3460408, -1.628835, 1, 0.8862745, 0, 1,
-0.9838026, -0.823092, -2.047485, 1, 0.8941177, 0, 1,
-0.9708742, -0.4630062, -1.879518, 1, 0.8980392, 0, 1,
-0.9685862, 0.1845845, -2.985143, 1, 0.9058824, 0, 1,
-0.9654079, -1.255027, -2.797654, 1, 0.9137255, 0, 1,
-0.9615514, -2.144027, -3.749483, 1, 0.9176471, 0, 1,
-0.9610277, -0.7076649, -0.3625405, 1, 0.9254902, 0, 1,
-0.9531708, -0.3540468, -3.565609, 1, 0.9294118, 0, 1,
-0.9453168, -1.441891, -3.470167, 1, 0.9372549, 0, 1,
-0.9444222, -2.012274, -1.316294, 1, 0.9411765, 0, 1,
-0.9387324, 0.4008761, -0.5958945, 1, 0.9490196, 0, 1,
-0.9383596, -0.7060434, -1.723896, 1, 0.9529412, 0, 1,
-0.9303855, -0.0132347, -2.86339, 1, 0.9607843, 0, 1,
-0.9302307, -0.8365192, -1.934785, 1, 0.9647059, 0, 1,
-0.9282515, 0.2803295, -2.554565, 1, 0.972549, 0, 1,
-0.9194154, -0.8260772, -2.344012, 1, 0.9764706, 0, 1,
-0.9190301, -1.375792, -4.101571, 1, 0.9843137, 0, 1,
-0.9079257, 0.4600913, -1.149412, 1, 0.9882353, 0, 1,
-0.9076229, -0.4000617, -3.183841, 1, 0.9960784, 0, 1,
-0.9023781, 1.194872, 1.066009, 0.9960784, 1, 0, 1,
-0.8958494, -0.05842258, -1.277672, 0.9921569, 1, 0, 1,
-0.8903172, -1.780681, -5.087231, 0.9843137, 1, 0, 1,
-0.8888183, 0.2644848, -2.186628, 0.9803922, 1, 0, 1,
-0.8879519, -2.387262, -1.911224, 0.972549, 1, 0, 1,
-0.8842495, 0.1014505, -1.875557, 0.9686275, 1, 0, 1,
-0.8841413, 0.01694444, -1.065182, 0.9607843, 1, 0, 1,
-0.8778331, -0.8889999, -3.06385, 0.9568627, 1, 0, 1,
-0.8770522, 0.264586, 0.4108271, 0.9490196, 1, 0, 1,
-0.868428, -0.9879618, -1.27329, 0.945098, 1, 0, 1,
-0.8650232, -0.5544065, -2.399582, 0.9372549, 1, 0, 1,
-0.8600864, -0.5947312, -1.568592, 0.9333333, 1, 0, 1,
-0.857278, 0.7662622, -2.043398, 0.9254902, 1, 0, 1,
-0.8488311, -1.39594, -2.101885, 0.9215686, 1, 0, 1,
-0.8478613, 0.04923371, -3.975307, 0.9137255, 1, 0, 1,
-0.8429705, 1.359815, 0.3117355, 0.9098039, 1, 0, 1,
-0.8344203, -2.004639, -2.428192, 0.9019608, 1, 0, 1,
-0.8332098, -0.4901567, -2.794641, 0.8941177, 1, 0, 1,
-0.8316661, -1.128619, -2.890115, 0.8901961, 1, 0, 1,
-0.828761, -0.506704, -3.424272, 0.8823529, 1, 0, 1,
-0.8274025, 2.560048, -0.1803449, 0.8784314, 1, 0, 1,
-0.8269244, 1.802112, -0.2892392, 0.8705882, 1, 0, 1,
-0.8232554, 0.2152241, -1.50034, 0.8666667, 1, 0, 1,
-0.8224781, -0.3833241, -2.596694, 0.8588235, 1, 0, 1,
-0.8214521, 0.2850726, -1.258414, 0.854902, 1, 0, 1,
-0.8187384, 1.603647, -0.8820279, 0.8470588, 1, 0, 1,
-0.8080453, 0.7945766, 0.6641837, 0.8431373, 1, 0, 1,
-0.80528, 0.88388, -0.7793393, 0.8352941, 1, 0, 1,
-0.7978055, 1.133977, -0.4025029, 0.8313726, 1, 0, 1,
-0.7868785, -0.4008192, -2.929421, 0.8235294, 1, 0, 1,
-0.7833012, 1.046506, 0.1343336, 0.8196079, 1, 0, 1,
-0.7798446, 0.3524431, -1.798322, 0.8117647, 1, 0, 1,
-0.7777531, 0.06337085, -1.871747, 0.8078431, 1, 0, 1,
-0.7765873, -1.584652, -3.908987, 0.8, 1, 0, 1,
-0.7753842, -0.520515, -3.121648, 0.7921569, 1, 0, 1,
-0.7729883, -1.036392, -3.501607, 0.7882353, 1, 0, 1,
-0.7669091, -0.1825974, -0.9445379, 0.7803922, 1, 0, 1,
-0.7646664, 2.653108, 0.3854572, 0.7764706, 1, 0, 1,
-0.7605988, 1.415625, 1.565595, 0.7686275, 1, 0, 1,
-0.7581975, 0.3126779, -0.3180917, 0.7647059, 1, 0, 1,
-0.7546273, -0.2245209, -3.106042, 0.7568628, 1, 0, 1,
-0.7416494, -0.4146596, -2.380255, 0.7529412, 1, 0, 1,
-0.7365423, 1.327518, -0.7279583, 0.7450981, 1, 0, 1,
-0.733261, 0.5279824, -0.5426733, 0.7411765, 1, 0, 1,
-0.7324852, 0.2693977, -1.360416, 0.7333333, 1, 0, 1,
-0.7299844, 0.2472907, -2.462453, 0.7294118, 1, 0, 1,
-0.7193488, -1.43736, -3.187428, 0.7215686, 1, 0, 1,
-0.7146042, 1.247953, -0.1946404, 0.7176471, 1, 0, 1,
-0.7140704, -0.1806509, -0.9164553, 0.7098039, 1, 0, 1,
-0.7109541, -0.1921178, -1.890602, 0.7058824, 1, 0, 1,
-0.7098513, -1.36107, -2.421318, 0.6980392, 1, 0, 1,
-0.7091942, 0.635027, -2.590438, 0.6901961, 1, 0, 1,
-0.7091904, -0.2208816, -4.501499, 0.6862745, 1, 0, 1,
-0.708169, -0.9734223, -2.893713, 0.6784314, 1, 0, 1,
-0.6942483, -1.609206, -2.771129, 0.6745098, 1, 0, 1,
-0.6884956, 1.051601, 0.07705969, 0.6666667, 1, 0, 1,
-0.6861566, -0.2731327, -3.898682, 0.6627451, 1, 0, 1,
-0.6840793, -1.131141, -0.8145624, 0.654902, 1, 0, 1,
-0.681403, -0.1309911, -1.12936, 0.6509804, 1, 0, 1,
-0.6812723, 1.780962, -0.0003216278, 0.6431373, 1, 0, 1,
-0.6770963, 0.6623949, -1.209071, 0.6392157, 1, 0, 1,
-0.6693091, -0.9798526, -2.078138, 0.6313726, 1, 0, 1,
-0.6659399, -0.5556833, -1.620273, 0.627451, 1, 0, 1,
-0.6653214, 0.5102521, 0.3946956, 0.6196079, 1, 0, 1,
-0.6632324, -3.093713, -2.858391, 0.6156863, 1, 0, 1,
-0.6625683, -0.1283857, -2.693501, 0.6078432, 1, 0, 1,
-0.6605952, -0.05650985, -0.6167195, 0.6039216, 1, 0, 1,
-0.6599843, -2.123688, -3.658032, 0.5960785, 1, 0, 1,
-0.6598001, -0.2719998, -0.9749311, 0.5882353, 1, 0, 1,
-0.6596276, -0.1552682, -1.308771, 0.5843138, 1, 0, 1,
-0.6546675, 1.074539, 0.1681973, 0.5764706, 1, 0, 1,
-0.6434268, -0.9915987, -2.527435, 0.572549, 1, 0, 1,
-0.6351565, -0.7266044, -1.361725, 0.5647059, 1, 0, 1,
-0.6296777, 0.3196841, -1.432062, 0.5607843, 1, 0, 1,
-0.6296526, 0.119405, -0.9217159, 0.5529412, 1, 0, 1,
-0.6242706, -0.8507056, -2.265427, 0.5490196, 1, 0, 1,
-0.6232291, 1.20887, -0.3033249, 0.5411765, 1, 0, 1,
-0.6226664, -2.266695, -4.102637, 0.5372549, 1, 0, 1,
-0.6210862, -0.2960385, -0.6178483, 0.5294118, 1, 0, 1,
-0.6205802, 0.7980971, -2.537961, 0.5254902, 1, 0, 1,
-0.6181735, 1.237064, -1.827458, 0.5176471, 1, 0, 1,
-0.6131031, -0.131527, -2.50818, 0.5137255, 1, 0, 1,
-0.6104832, 1.89871, -0.2707398, 0.5058824, 1, 0, 1,
-0.6095977, 1.256266, -0.7453275, 0.5019608, 1, 0, 1,
-0.6095678, -1.047549, -1.867734, 0.4941176, 1, 0, 1,
-0.6081059, -1.223839, -2.951756, 0.4862745, 1, 0, 1,
-0.6018597, -0.0917677, -2.347059, 0.4823529, 1, 0, 1,
-0.6014945, -0.9245063, -3.406228, 0.4745098, 1, 0, 1,
-0.599868, -0.6096084, -3.194925, 0.4705882, 1, 0, 1,
-0.5971563, -0.2823105, -1.884086, 0.4627451, 1, 0, 1,
-0.5934106, 0.04507622, -0.4004971, 0.4588235, 1, 0, 1,
-0.5920874, -0.6282129, -2.490911, 0.4509804, 1, 0, 1,
-0.5896907, -0.4660369, -2.203722, 0.4470588, 1, 0, 1,
-0.5879248, -1.547765, -4.510011, 0.4392157, 1, 0, 1,
-0.5834708, -0.5012651, -1.670835, 0.4352941, 1, 0, 1,
-0.5826045, -1.71236, -2.334947, 0.427451, 1, 0, 1,
-0.5801162, 0.2578854, -1.45991, 0.4235294, 1, 0, 1,
-0.5775084, -0.4229877, -1.579908, 0.4156863, 1, 0, 1,
-0.5767852, -0.2211544, -1.855479, 0.4117647, 1, 0, 1,
-0.5748617, -0.178094, -3.242509, 0.4039216, 1, 0, 1,
-0.569723, 0.6182345, 0.4098237, 0.3960784, 1, 0, 1,
-0.5686393, 1.135061, -1.218506, 0.3921569, 1, 0, 1,
-0.5671253, -0.100622, -2.726702, 0.3843137, 1, 0, 1,
-0.5601503, -1.727347, -1.967331, 0.3803922, 1, 0, 1,
-0.55713, -1.075884, -1.700364, 0.372549, 1, 0, 1,
-0.5529535, -0.8444972, -2.480678, 0.3686275, 1, 0, 1,
-0.552339, 0.9143885, -2.511887, 0.3607843, 1, 0, 1,
-0.5517908, 0.6742483, 0.03623476, 0.3568628, 1, 0, 1,
-0.5507522, 0.5371684, -1.109994, 0.3490196, 1, 0, 1,
-0.5476556, 0.5767061, -1.769428, 0.345098, 1, 0, 1,
-0.5446429, -0.2027726, -1.166986, 0.3372549, 1, 0, 1,
-0.5436602, 0.4811015, 1.661341, 0.3333333, 1, 0, 1,
-0.5431961, 1.445266, 0.07224678, 0.3254902, 1, 0, 1,
-0.5404202, 0.455679, 0.1944488, 0.3215686, 1, 0, 1,
-0.5375571, -1.208606, -2.964191, 0.3137255, 1, 0, 1,
-0.5288224, -1.596327, -1.658797, 0.3098039, 1, 0, 1,
-0.5286031, -1.684535, -4.315789, 0.3019608, 1, 0, 1,
-0.5279301, -0.5358887, -2.5681, 0.2941177, 1, 0, 1,
-0.5277228, -0.05960581, -2.074385, 0.2901961, 1, 0, 1,
-0.5207471, 0.810271, -0.9069188, 0.282353, 1, 0, 1,
-0.5176274, -2.199577, -2.526233, 0.2784314, 1, 0, 1,
-0.5136979, 0.2123428, -0.6846948, 0.2705882, 1, 0, 1,
-0.5014359, 1.4825, 0.08425245, 0.2666667, 1, 0, 1,
-0.4918718, 0.1562459, -0.2523675, 0.2588235, 1, 0, 1,
-0.4918028, 1.2017, -0.3677559, 0.254902, 1, 0, 1,
-0.489819, -0.0271113, -1.260821, 0.2470588, 1, 0, 1,
-0.4896562, 1.25904, 0.7194965, 0.2431373, 1, 0, 1,
-0.4887249, -1.580486, -2.917397, 0.2352941, 1, 0, 1,
-0.4885279, 0.6755832, 1.487016, 0.2313726, 1, 0, 1,
-0.4880762, -0.2748363, -3.31339, 0.2235294, 1, 0, 1,
-0.4863181, -0.6627037, -1.745691, 0.2196078, 1, 0, 1,
-0.48238, -0.7967564, -0.6219671, 0.2117647, 1, 0, 1,
-0.4795588, -0.9481834, -0.625342, 0.2078431, 1, 0, 1,
-0.4769162, -1.425032, -3.038652, 0.2, 1, 0, 1,
-0.476194, -0.7105213, -3.201997, 0.1921569, 1, 0, 1,
-0.4742064, -0.682751, -2.539645, 0.1882353, 1, 0, 1,
-0.4715761, 1.272343, -0.9769251, 0.1803922, 1, 0, 1,
-0.4665983, 0.7658654, 0.1039191, 0.1764706, 1, 0, 1,
-0.4627117, 0.1764738, -2.806623, 0.1686275, 1, 0, 1,
-0.4604194, 0.723556, -0.2573896, 0.1647059, 1, 0, 1,
-0.4593369, 1.851658, 1.077547, 0.1568628, 1, 0, 1,
-0.4568579, 0.1684699, 0.8209386, 0.1529412, 1, 0, 1,
-0.4543802, 0.0473766, -1.292938, 0.145098, 1, 0, 1,
-0.4540531, 0.09323923, -1.409307, 0.1411765, 1, 0, 1,
-0.4517511, 0.569719, -0.4108003, 0.1333333, 1, 0, 1,
-0.443875, 0.2320308, -1.550789, 0.1294118, 1, 0, 1,
-0.4429532, 0.6296465, -1.255208, 0.1215686, 1, 0, 1,
-0.4426515, 0.08267578, -0.7809154, 0.1176471, 1, 0, 1,
-0.4420059, 0.03017678, -3.26141, 0.1098039, 1, 0, 1,
-0.440118, 0.4394692, -1.129807, 0.1058824, 1, 0, 1,
-0.4387192, 0.5218559, -0.8349748, 0.09803922, 1, 0, 1,
-0.4374511, 1.096754, 1.499306, 0.09019608, 1, 0, 1,
-0.4352798, 0.5794757, -0.6927669, 0.08627451, 1, 0, 1,
-0.4349451, 0.09573451, -3.686413, 0.07843138, 1, 0, 1,
-0.4346116, 0.03052419, -0.4008222, 0.07450981, 1, 0, 1,
-0.4345835, -0.9369016, -2.049137, 0.06666667, 1, 0, 1,
-0.4339442, -0.1544936, -1.489066, 0.0627451, 1, 0, 1,
-0.4322907, 0.5583645, -0.6848856, 0.05490196, 1, 0, 1,
-0.4315536, 1.655128, -1.469928, 0.05098039, 1, 0, 1,
-0.4296626, 0.1783329, -0.35843, 0.04313726, 1, 0, 1,
-0.4278603, 0.3950039, 0.4441019, 0.03921569, 1, 0, 1,
-0.4268798, 0.9330871, 0.1448069, 0.03137255, 1, 0, 1,
-0.422614, -1.025022, -3.29204, 0.02745098, 1, 0, 1,
-0.4178292, 0.3438363, -1.482765, 0.01960784, 1, 0, 1,
-0.4167847, 0.8151639, -0.9380175, 0.01568628, 1, 0, 1,
-0.4142321, -1.449838, -3.081261, 0.007843138, 1, 0, 1,
-0.4126906, -0.9598951, -4.049922, 0.003921569, 1, 0, 1,
-0.4109412, 0.5324537, -0.06323776, 0, 1, 0.003921569, 1,
-0.4080174, 0.1016793, -3.210058, 0, 1, 0.01176471, 1,
-0.4049352, -1.480271, -2.765844, 0, 1, 0.01568628, 1,
-0.4034408, -0.6807657, -3.65726, 0, 1, 0.02352941, 1,
-0.4009782, 0.5498185, -1.877132, 0, 1, 0.02745098, 1,
-0.4003922, -1.15049, -2.119643, 0, 1, 0.03529412, 1,
-0.3996857, -0.9932796, -1.777003, 0, 1, 0.03921569, 1,
-0.3995388, 1.262895, 0.1859844, 0, 1, 0.04705882, 1,
-0.3879461, -0.1554245, -4.568253, 0, 1, 0.05098039, 1,
-0.3823316, 0.4579325, -0.2054578, 0, 1, 0.05882353, 1,
-0.3815742, 0.6300818, 0.148374, 0, 1, 0.0627451, 1,
-0.3780219, 0.0757867, -0.4030138, 0, 1, 0.07058824, 1,
-0.3747234, -2.60579, -2.891679, 0, 1, 0.07450981, 1,
-0.3728045, 0.2149904, 1.92377, 0, 1, 0.08235294, 1,
-0.3716315, -1.836419, -2.650073, 0, 1, 0.08627451, 1,
-0.368918, 0.8156403, -0.1934845, 0, 1, 0.09411765, 1,
-0.3684413, 0.5055702, -0.4720129, 0, 1, 0.1019608, 1,
-0.3620268, -0.475799, -1.904084, 0, 1, 0.1058824, 1,
-0.3613745, 1.071722, -2.959897, 0, 1, 0.1137255, 1,
-0.3573003, 1.971159, -0.7518206, 0, 1, 0.1176471, 1,
-0.3544196, 1.316434, 0.3412939, 0, 1, 0.1254902, 1,
-0.3464479, 0.826826, 1.389851, 0, 1, 0.1294118, 1,
-0.3421629, -0.3766382, -2.254623, 0, 1, 0.1372549, 1,
-0.3411451, -0.8497788, -3.294663, 0, 1, 0.1411765, 1,
-0.3404137, 1.058385, -0.55477, 0, 1, 0.1490196, 1,
-0.3395783, 1.021621, -0.1917599, 0, 1, 0.1529412, 1,
-0.3373913, -0.399088, -2.919658, 0, 1, 0.1607843, 1,
-0.3369989, -0.4583297, -3.136693, 0, 1, 0.1647059, 1,
-0.3326713, 1.967257, 0.6330432, 0, 1, 0.172549, 1,
-0.3320667, 0.1148067, -0.465587, 0, 1, 0.1764706, 1,
-0.330316, 1.072721, -0.9168928, 0, 1, 0.1843137, 1,
-0.3273822, 1.009194, -1.023667, 0, 1, 0.1882353, 1,
-0.3211072, -0.3155181, -0.7495508, 0, 1, 0.1960784, 1,
-0.3195061, -0.9437564, -4.663386, 0, 1, 0.2039216, 1,
-0.3189008, -1.063493, -4.577952, 0, 1, 0.2078431, 1,
-0.31622, 0.8968241, 0.01022008, 0, 1, 0.2156863, 1,
-0.3129583, 0.8756889, 0.02578837, 0, 1, 0.2196078, 1,
-0.3106483, -1.051427, -3.987387, 0, 1, 0.227451, 1,
-0.3048338, 0.8875583, 0.1387239, 0, 1, 0.2313726, 1,
-0.3039918, -1.428313, -4.211598, 0, 1, 0.2392157, 1,
-0.3027317, -0.7573245, -2.207903, 0, 1, 0.2431373, 1,
-0.3018818, 2.27132, 0.6516308, 0, 1, 0.2509804, 1,
-0.2971168, -0.5159033, -3.117137, 0, 1, 0.254902, 1,
-0.2919505, -0.9464078, -3.078674, 0, 1, 0.2627451, 1,
-0.2895169, 0.8092628, 0.02235636, 0, 1, 0.2666667, 1,
-0.2894585, -2.09136, -2.591064, 0, 1, 0.2745098, 1,
-0.2822521, 0.0008338336, -1.312212, 0, 1, 0.2784314, 1,
-0.2796486, 0.7785406, -0.555461, 0, 1, 0.2862745, 1,
-0.2777383, 1.437503, 0.9075667, 0, 1, 0.2901961, 1,
-0.2695861, 0.1448151, 1.570751, 0, 1, 0.2980392, 1,
-0.2678068, -0.09615469, -0.6811398, 0, 1, 0.3058824, 1,
-0.2669762, -0.3449652, -0.6167746, 0, 1, 0.3098039, 1,
-0.2665628, -0.2436252, -3.40262, 0, 1, 0.3176471, 1,
-0.2660475, 0.5260096, -0.6442766, 0, 1, 0.3215686, 1,
-0.265792, 0.515618, -0.2444214, 0, 1, 0.3294118, 1,
-0.2655545, 0.5507892, 1.248835, 0, 1, 0.3333333, 1,
-0.2632351, -0.6150543, -2.722472, 0, 1, 0.3411765, 1,
-0.2627549, 0.8958113, 1.055488, 0, 1, 0.345098, 1,
-0.2613506, -0.8110425, -3.321607, 0, 1, 0.3529412, 1,
-0.2598532, -0.2070317, -4.792927, 0, 1, 0.3568628, 1,
-0.2566452, 0.9382103, -1.446475, 0, 1, 0.3647059, 1,
-0.2564193, -0.6473746, -1.812782, 0, 1, 0.3686275, 1,
-0.2494626, -0.8902759, -4.384738, 0, 1, 0.3764706, 1,
-0.2428298, 0.2515453, -0.8789202, 0, 1, 0.3803922, 1,
-0.2410957, -0.2711338, -3.955091, 0, 1, 0.3882353, 1,
-0.2391554, -0.9130907, -1.649296, 0, 1, 0.3921569, 1,
-0.2346426, -0.8619007, -2.124935, 0, 1, 0.4, 1,
-0.2344625, 0.9908076, 0.6652961, 0, 1, 0.4078431, 1,
-0.2290546, 0.1601407, -0.4048239, 0, 1, 0.4117647, 1,
-0.2285331, 0.3672409, 0.3060021, 0, 1, 0.4196078, 1,
-0.2256624, -0.4240013, -2.326799, 0, 1, 0.4235294, 1,
-0.2226639, -0.5982507, -3.600495, 0, 1, 0.4313726, 1,
-0.2224532, 1.231177, 0.5657129, 0, 1, 0.4352941, 1,
-0.2144071, -0.8797264, -2.222536, 0, 1, 0.4431373, 1,
-0.2109896, 2.140348, 0.1899643, 0, 1, 0.4470588, 1,
-0.2059267, 1.563362, 0.8166651, 0, 1, 0.454902, 1,
-0.2040094, 0.2406292, -0.976798, 0, 1, 0.4588235, 1,
-0.2027017, 0.8850042, -1.149803, 0, 1, 0.4666667, 1,
-0.2014201, 0.1744041, -0.9997544, 0, 1, 0.4705882, 1,
-0.2013461, 0.2650962, -1.095618, 0, 1, 0.4784314, 1,
-0.199236, 1.711053, -0.1377913, 0, 1, 0.4823529, 1,
-0.1959829, -1.218039, -3.269246, 0, 1, 0.4901961, 1,
-0.193345, -0.6251304, -0.8070277, 0, 1, 0.4941176, 1,
-0.1845462, 0.9705292, -2.204366, 0, 1, 0.5019608, 1,
-0.1837151, 0.1478038, -1.540717, 0, 1, 0.509804, 1,
-0.1774961, -0.28068, -2.409142, 0, 1, 0.5137255, 1,
-0.176608, -0.5740857, -0.7848531, 0, 1, 0.5215687, 1,
-0.1744556, 1.200815, -0.6720907, 0, 1, 0.5254902, 1,
-0.1729406, -1.135782, -1.804872, 0, 1, 0.5333334, 1,
-0.1697471, -0.5343915, -4.959719, 0, 1, 0.5372549, 1,
-0.165635, 1.384061, 0.5127257, 0, 1, 0.5450981, 1,
-0.1614828, 0.3960682, -2.42763, 0, 1, 0.5490196, 1,
-0.1614291, 0.3285156, 0.1005416, 0, 1, 0.5568628, 1,
-0.1597549, -0.1678715, -5.216166, 0, 1, 0.5607843, 1,
-0.1576723, 1.958426, -0.4539399, 0, 1, 0.5686275, 1,
-0.1550698, 0.119761, -0.06597158, 0, 1, 0.572549, 1,
-0.1526721, -0.5848007, -2.648222, 0, 1, 0.5803922, 1,
-0.1520879, 0.4184657, -1.867866, 0, 1, 0.5843138, 1,
-0.1519269, -1.612512, -3.358853, 0, 1, 0.5921569, 1,
-0.148223, -0.3700719, -3.088523, 0, 1, 0.5960785, 1,
-0.1474588, -1.365199, -5.180127, 0, 1, 0.6039216, 1,
-0.1471909, -0.3755555, -3.924678, 0, 1, 0.6117647, 1,
-0.1437322, 0.5939363, -1.085368, 0, 1, 0.6156863, 1,
-0.1413568, 0.04698821, -1.299877, 0, 1, 0.6235294, 1,
-0.1398069, 1.092983, -0.03014673, 0, 1, 0.627451, 1,
-0.1359603, 1.165797, -0.7284784, 0, 1, 0.6352941, 1,
-0.1339359, -0.1593412, -1.549359, 0, 1, 0.6392157, 1,
-0.1331496, -0.2830015, -1.440906, 0, 1, 0.6470588, 1,
-0.1325816, -0.8834315, -3.590347, 0, 1, 0.6509804, 1,
-0.1220388, -1.941666, -2.118858, 0, 1, 0.6588235, 1,
-0.1194622, 0.329257, -0.6253449, 0, 1, 0.6627451, 1,
-0.112869, -1.161204, -3.047039, 0, 1, 0.6705883, 1,
-0.1086795, -1.277115, -3.144116, 0, 1, 0.6745098, 1,
-0.1074262, 0.1859794, -1.233348, 0, 1, 0.682353, 1,
-0.1050241, 0.1140941, -0.9454151, 0, 1, 0.6862745, 1,
-0.1025006, -1.331097, -2.421854, 0, 1, 0.6941177, 1,
-0.07964478, -1.247521, -1.631034, 0, 1, 0.7019608, 1,
-0.07531995, -1.235899, -3.550558, 0, 1, 0.7058824, 1,
-0.07521259, -0.046147, -2.116921, 0, 1, 0.7137255, 1,
-0.06920482, -3.133971, -2.455518, 0, 1, 0.7176471, 1,
-0.06914463, -2.226314, -3.316753, 0, 1, 0.7254902, 1,
-0.06485026, -0.9261329, -3.343737, 0, 1, 0.7294118, 1,
-0.04568109, 0.644089, -2.251145, 0, 1, 0.7372549, 1,
-0.04305796, 0.282489, 2.1839, 0, 1, 0.7411765, 1,
-0.04294307, -1.59484, -2.939573, 0, 1, 0.7490196, 1,
-0.04194827, 0.04059657, 0.1815325, 0, 1, 0.7529412, 1,
-0.04043274, -0.5680209, -2.084001, 0, 1, 0.7607843, 1,
-0.03680619, -0.05084367, -2.84697, 0, 1, 0.7647059, 1,
-0.0320552, 0.3330176, -0.09272004, 0, 1, 0.772549, 1,
-0.02915122, -0.2101793, -3.048946, 0, 1, 0.7764706, 1,
-0.02645892, 0.3692554, 0.5542583, 0, 1, 0.7843137, 1,
-0.02557871, 1.176947, 1.411402, 0, 1, 0.7882353, 1,
-0.02353686, 1.256246, 0.3943377, 0, 1, 0.7960784, 1,
-0.01632348, 0.1707631, -0.2330994, 0, 1, 0.8039216, 1,
-0.01536197, 0.08155049, 1.566891, 0, 1, 0.8078431, 1,
-0.01370458, -1.196689, -1.715721, 0, 1, 0.8156863, 1,
-0.01298808, -1.248947, -2.271403, 0, 1, 0.8196079, 1,
-0.006501508, 0.9754461, -0.5620003, 0, 1, 0.827451, 1,
-0.005743099, 0.516102, 0.03262652, 0, 1, 0.8313726, 1,
-0.004044749, -0.1548813, -3.184264, 0, 1, 0.8392157, 1,
-0.00120522, 0.7389963, 0.7280575, 0, 1, 0.8431373, 1,
0.0001356595, 0.2108533, 0.4446679, 0, 1, 0.8509804, 1,
0.001713015, 1.3067, -0.05365548, 0, 1, 0.854902, 1,
0.003665891, 0.6109354, 1.901504, 0, 1, 0.8627451, 1,
0.005807241, 0.5012762, -0.08466101, 0, 1, 0.8666667, 1,
0.005926326, 1.180332, -0.1288075, 0, 1, 0.8745098, 1,
0.006227688, 0.980426, 1.268676, 0, 1, 0.8784314, 1,
0.007947356, -2.459201, 4.580645, 0, 1, 0.8862745, 1,
0.008302448, 0.718073, 0.302556, 0, 1, 0.8901961, 1,
0.009975409, 1.134871, 1.752651, 0, 1, 0.8980392, 1,
0.01075479, 0.03584388, 1.483489, 0, 1, 0.9058824, 1,
0.01223552, -1.566581, 3.590392, 0, 1, 0.9098039, 1,
0.01264995, -1.260424, 3.62587, 0, 1, 0.9176471, 1,
0.01450307, -1.462985, 3.500932, 0, 1, 0.9215686, 1,
0.0153051, 0.2237603, -0.9881058, 0, 1, 0.9294118, 1,
0.01655865, 0.02360311, 0.8306573, 0, 1, 0.9333333, 1,
0.01661181, 0.08118722, -0.124584, 0, 1, 0.9411765, 1,
0.01733874, 1.022754, 2.062673, 0, 1, 0.945098, 1,
0.01737968, -0.1231326, 3.369605, 0, 1, 0.9529412, 1,
0.02060315, 2.778073, 1.091055, 0, 1, 0.9568627, 1,
0.02131375, -0.6466897, 2.640718, 0, 1, 0.9647059, 1,
0.02191408, 1.830211, -0.2880343, 0, 1, 0.9686275, 1,
0.02301615, -0.48713, 2.72242, 0, 1, 0.9764706, 1,
0.02407648, 0.8737911, 1.997169, 0, 1, 0.9803922, 1,
0.02580013, -0.9672747, 2.903364, 0, 1, 0.9882353, 1,
0.02857546, -0.7313551, 2.076612, 0, 1, 0.9921569, 1,
0.03172461, -0.713201, 1.686368, 0, 1, 1, 1,
0.03353581, -0.2718319, 3.172948, 0, 0.9921569, 1, 1,
0.04005209, -0.4337293, 3.507756, 0, 0.9882353, 1, 1,
0.04100261, -1.479749, 2.707884, 0, 0.9803922, 1, 1,
0.04601444, 0.008918705, -0.1042695, 0, 0.9764706, 1, 1,
0.04889564, 1.501331, 0.2564913, 0, 0.9686275, 1, 1,
0.05009031, 0.1950437, -0.94414, 0, 0.9647059, 1, 1,
0.05536756, 0.1230576, 0.4059526, 0, 0.9568627, 1, 1,
0.0564079, -0.1801732, 2.801706, 0, 0.9529412, 1, 1,
0.0605128, -2.844092, 3.006142, 0, 0.945098, 1, 1,
0.06085631, 0.2552934, -0.2506997, 0, 0.9411765, 1, 1,
0.06287247, 1.111527, 0.7389517, 0, 0.9333333, 1, 1,
0.0699132, 0.994483, -0.5111635, 0, 0.9294118, 1, 1,
0.07114167, 0.5662604, 0.5850322, 0, 0.9215686, 1, 1,
0.071504, -0.8224716, 2.406291, 0, 0.9176471, 1, 1,
0.07494265, -0.161353, 3.05182, 0, 0.9098039, 1, 1,
0.07513171, 2.839328, 0.02374648, 0, 0.9058824, 1, 1,
0.07796329, 0.3282028, 2.038229, 0, 0.8980392, 1, 1,
0.07914194, -1.020463, 3.301738, 0, 0.8901961, 1, 1,
0.08073684, -0.02740043, 0.5187011, 0, 0.8862745, 1, 1,
0.0816414, 0.1214856, 1.59508, 0, 0.8784314, 1, 1,
0.08213519, -1.045322, 3.822807, 0, 0.8745098, 1, 1,
0.08425038, 0.3598389, -0.9883719, 0, 0.8666667, 1, 1,
0.08751193, 0.372539, 2.340084, 0, 0.8627451, 1, 1,
0.08826483, 0.2797997, -0.9111784, 0, 0.854902, 1, 1,
0.09058241, -0.08382804, 2.394877, 0, 0.8509804, 1, 1,
0.09229689, 0.9324964, -0.8040274, 0, 0.8431373, 1, 1,
0.09433064, 0.2876214, -0.5910597, 0, 0.8392157, 1, 1,
0.09483094, 0.02257972, 0.9584609, 0, 0.8313726, 1, 1,
0.09579369, 1.77172, 0.9890136, 0, 0.827451, 1, 1,
0.09592187, 0.9268427, 0.2794239, 0, 0.8196079, 1, 1,
0.09852643, 1.284264, -0.2679993, 0, 0.8156863, 1, 1,
0.1011539, -0.4978131, 3.863952, 0, 0.8078431, 1, 1,
0.1017984, 0.1553935, -0.911558, 0, 0.8039216, 1, 1,
0.1024206, 0.5367306, -0.2373391, 0, 0.7960784, 1, 1,
0.1032145, 0.2170332, 0.7731854, 0, 0.7882353, 1, 1,
0.1099886, -0.6579877, 4.054149, 0, 0.7843137, 1, 1,
0.1100352, -1.199137, 2.194616, 0, 0.7764706, 1, 1,
0.111755, -0.1544094, 3.854358, 0, 0.772549, 1, 1,
0.1125234, -1.322765, 3.097767, 0, 0.7647059, 1, 1,
0.1192383, -0.5228519, 2.782593, 0, 0.7607843, 1, 1,
0.1204247, -0.07811561, 0.2394232, 0, 0.7529412, 1, 1,
0.1241445, -0.04752452, 1.56524, 0, 0.7490196, 1, 1,
0.1260994, 0.3579451, 0.3341357, 0, 0.7411765, 1, 1,
0.1344892, -0.5561551, 2.573012, 0, 0.7372549, 1, 1,
0.1352493, 0.2473138, 0.8818172, 0, 0.7294118, 1, 1,
0.1398724, 0.704883, 0.2193321, 0, 0.7254902, 1, 1,
0.1453792, -2.466448, 2.475281, 0, 0.7176471, 1, 1,
0.1477217, 2.274048, -1.100492, 0, 0.7137255, 1, 1,
0.1479221, -1.610231, 1.982902, 0, 0.7058824, 1, 1,
0.1515018, 0.4355455, -0.3889075, 0, 0.6980392, 1, 1,
0.1535779, -0.8104455, 2.152517, 0, 0.6941177, 1, 1,
0.1544923, 0.6952825, 0.8226304, 0, 0.6862745, 1, 1,
0.1573277, 1.749574, -0.2711224, 0, 0.682353, 1, 1,
0.1574365, -1.323213, 2.184732, 0, 0.6745098, 1, 1,
0.1674236, 0.9423618, -0.4725421, 0, 0.6705883, 1, 1,
0.1677545, 0.2109288, 3.137779, 0, 0.6627451, 1, 1,
0.1703243, -0.7355268, 1.770437, 0, 0.6588235, 1, 1,
0.1730875, 0.05740536, -0.8776327, 0, 0.6509804, 1, 1,
0.1732924, 1.589861, 1.225364, 0, 0.6470588, 1, 1,
0.1795652, 0.07234424, 2.209484, 0, 0.6392157, 1, 1,
0.1844149, 1.8645, -0.2749666, 0, 0.6352941, 1, 1,
0.1861724, -1.118157, 3.874346, 0, 0.627451, 1, 1,
0.1999429, 1.330729, -0.3785474, 0, 0.6235294, 1, 1,
0.2003266, 0.5327191, -0.4450095, 0, 0.6156863, 1, 1,
0.2039175, -0.1126115, 3.064404, 0, 0.6117647, 1, 1,
0.2053452, 0.03237307, 3.246667, 0, 0.6039216, 1, 1,
0.206969, -0.8913113, 2.394203, 0, 0.5960785, 1, 1,
0.2075106, 0.5722066, 1.585407, 0, 0.5921569, 1, 1,
0.2096136, 1.588247, 0.4832889, 0, 0.5843138, 1, 1,
0.2122343, -0.05714885, 3.711364, 0, 0.5803922, 1, 1,
0.2136128, 0.05643631, 2.841866, 0, 0.572549, 1, 1,
0.2138119, -0.3212097, 2.055198, 0, 0.5686275, 1, 1,
0.2138423, 1.149774, 1.289848, 0, 0.5607843, 1, 1,
0.214695, -0.3215356, 1.981231, 0, 0.5568628, 1, 1,
0.2197493, 1.187327, 1.172806, 0, 0.5490196, 1, 1,
0.222804, 0.04720521, 0.6890043, 0, 0.5450981, 1, 1,
0.2266999, -0.8571405, 1.773463, 0, 0.5372549, 1, 1,
0.2326143, -0.3051576, 2.70522, 0, 0.5333334, 1, 1,
0.2385335, -0.03122976, 1.849477, 0, 0.5254902, 1, 1,
0.2469058, 0.3361287, -0.5323162, 0, 0.5215687, 1, 1,
0.2484297, 2.548859, 2.395476, 0, 0.5137255, 1, 1,
0.2489648, -1.738885, 4.275811, 0, 0.509804, 1, 1,
0.2515243, -0.8787412, 3.47926, 0, 0.5019608, 1, 1,
0.2555695, -0.1186813, 1.116509, 0, 0.4941176, 1, 1,
0.2587595, 0.6169984, 0.5059012, 0, 0.4901961, 1, 1,
0.2589145, 1.354667, 1.010501, 0, 0.4823529, 1, 1,
0.2623728, -0.4822471, 2.885172, 0, 0.4784314, 1, 1,
0.2660545, -0.5748103, 2.213129, 0, 0.4705882, 1, 1,
0.2683704, -0.6447907, 1.86937, 0, 0.4666667, 1, 1,
0.2703786, -1.35967, 2.201827, 0, 0.4588235, 1, 1,
0.2739385, -0.3483427, 3.1702, 0, 0.454902, 1, 1,
0.2788247, -1.154861, 1.432649, 0, 0.4470588, 1, 1,
0.2813455, 0.8619982, 1.043256, 0, 0.4431373, 1, 1,
0.2885833, -0.0834648, 0.6904536, 0, 0.4352941, 1, 1,
0.2886863, -0.8336853, 2.960645, 0, 0.4313726, 1, 1,
0.289303, -0.06494466, 2.626349, 0, 0.4235294, 1, 1,
0.2908691, -0.1979664, 1.823388, 0, 0.4196078, 1, 1,
0.2944479, 1.552767, -2.576022, 0, 0.4117647, 1, 1,
0.2964207, -0.9386058, 1.853659, 0, 0.4078431, 1, 1,
0.3008387, 1.602915, 1.588086, 0, 0.4, 1, 1,
0.3132836, 0.3332396, 0.003345647, 0, 0.3921569, 1, 1,
0.3152252, 1.57453, -0.06456018, 0, 0.3882353, 1, 1,
0.3166337, 1.258545, -0.9178136, 0, 0.3803922, 1, 1,
0.3170563, -1.561881, 3.789783, 0, 0.3764706, 1, 1,
0.3178256, 0.8919248, 1.987844, 0, 0.3686275, 1, 1,
0.3188468, -0.3720487, 0.39137, 0, 0.3647059, 1, 1,
0.3206877, 0.493221, 1.442653, 0, 0.3568628, 1, 1,
0.3210501, 1.029565, -0.6853709, 0, 0.3529412, 1, 1,
0.3235596, 0.4029273, 3.212949, 0, 0.345098, 1, 1,
0.3256641, 0.5327476, -0.06630412, 0, 0.3411765, 1, 1,
0.3315038, 0.2227282, 1.614009, 0, 0.3333333, 1, 1,
0.3351299, -1.617309, 2.736691, 0, 0.3294118, 1, 1,
0.3353191, 2.72479, 0.4101966, 0, 0.3215686, 1, 1,
0.3382942, 0.8262064, 0.1401167, 0, 0.3176471, 1, 1,
0.3412271, 0.7200668, 2.404184, 0, 0.3098039, 1, 1,
0.3422671, 0.9991191, -0.7653895, 0, 0.3058824, 1, 1,
0.3422847, -1.332084, 2.992082, 0, 0.2980392, 1, 1,
0.3432848, 0.512084, 1.590225, 0, 0.2901961, 1, 1,
0.3439865, -0.9318122, 1.603913, 0, 0.2862745, 1, 1,
0.3468652, 0.7430903, -0.4444632, 0, 0.2784314, 1, 1,
0.3483219, 0.6744044, 0.290045, 0, 0.2745098, 1, 1,
0.3568408, -0.6364644, 3.543309, 0, 0.2666667, 1, 1,
0.3697098, -0.5221425, 2.638483, 0, 0.2627451, 1, 1,
0.3708823, 1.259286, -0.1388499, 0, 0.254902, 1, 1,
0.375196, 0.9288018, -0.8683698, 0, 0.2509804, 1, 1,
0.3773719, 0.07961063, 2.350708, 0, 0.2431373, 1, 1,
0.378864, -1.428697, 4.254137, 0, 0.2392157, 1, 1,
0.3828935, -0.7369186, 2.032186, 0, 0.2313726, 1, 1,
0.3841352, 0.2575746, 0.4576588, 0, 0.227451, 1, 1,
0.3927945, 0.1945333, 2.252692, 0, 0.2196078, 1, 1,
0.3989848, -0.1851659, 1.426185, 0, 0.2156863, 1, 1,
0.4008104, 1.723707, -0.5580838, 0, 0.2078431, 1, 1,
0.402893, -0.2316067, 1.190237, 0, 0.2039216, 1, 1,
0.4057632, -1.841045, 3.156976, 0, 0.1960784, 1, 1,
0.4107898, 0.2605496, 1.123937, 0, 0.1882353, 1, 1,
0.4144756, 0.09781187, 0.8216079, 0, 0.1843137, 1, 1,
0.4224345, 0.9720301, -0.3922644, 0, 0.1764706, 1, 1,
0.422626, 0.6070373, 0.8418074, 0, 0.172549, 1, 1,
0.4268069, 0.4455198, 0.7101316, 0, 0.1647059, 1, 1,
0.4280489, 1.059604, 2.193514, 0, 0.1607843, 1, 1,
0.4284336, -0.2347692, 2.064054, 0, 0.1529412, 1, 1,
0.4290053, 0.7244009, 1.112392, 0, 0.1490196, 1, 1,
0.4298482, 0.1037676, 2.432549, 0, 0.1411765, 1, 1,
0.432085, -1.202982, 2.542588, 0, 0.1372549, 1, 1,
0.4336456, -0.2903251, 0.997032, 0, 0.1294118, 1, 1,
0.433711, -1.409003, 0.8659294, 0, 0.1254902, 1, 1,
0.4363431, -1.660592, 3.659918, 0, 0.1176471, 1, 1,
0.4376888, -0.5193436, 1.71032, 0, 0.1137255, 1, 1,
0.4395994, 2.035396, -0.2208175, 0, 0.1058824, 1, 1,
0.4486174, -0.09690488, 2.008968, 0, 0.09803922, 1, 1,
0.4489924, 0.3708624, 3.203036, 0, 0.09411765, 1, 1,
0.4517597, 1.868651, 0.004334456, 0, 0.08627451, 1, 1,
0.4529794, -0.4827197, 3.038074, 0, 0.08235294, 1, 1,
0.4549401, 0.3578745, 2.339225, 0, 0.07450981, 1, 1,
0.4575175, 0.01515559, 2.672057, 0, 0.07058824, 1, 1,
0.4599465, 0.4989204, 0.4802811, 0, 0.0627451, 1, 1,
0.465466, -0.8623148, 3.115119, 0, 0.05882353, 1, 1,
0.4692398, -0.7591195, 0.8361531, 0, 0.05098039, 1, 1,
0.4767326, 1.596566, 0.0735799, 0, 0.04705882, 1, 1,
0.4783121, 0.121757, 1.674738, 0, 0.03921569, 1, 1,
0.4888887, 1.31367, -2.370397, 0, 0.03529412, 1, 1,
0.4909601, 0.2418499, 1.664807, 0, 0.02745098, 1, 1,
0.4920468, 1.24106, -0.4528932, 0, 0.02352941, 1, 1,
0.4921328, -0.04142936, 3.164611, 0, 0.01568628, 1, 1,
0.4924268, -0.08418997, 2.14638, 0, 0.01176471, 1, 1,
0.5013696, -0.4736544, 3.615879, 0, 0.003921569, 1, 1,
0.5027141, -0.384814, 0.867171, 0.003921569, 0, 1, 1,
0.5027217, -1.15615, 3.607193, 0.007843138, 0, 1, 1,
0.5072225, -0.8130117, 2.630075, 0.01568628, 0, 1, 1,
0.5086379, -1.330125, 2.648023, 0.01960784, 0, 1, 1,
0.5106438, -0.2082557, 3.821524, 0.02745098, 0, 1, 1,
0.5149412, -1.050032, 3.159485, 0.03137255, 0, 1, 1,
0.5188656, 0.1968019, 0.143763, 0.03921569, 0, 1, 1,
0.5215969, 0.4943838, 2.313354, 0.04313726, 0, 1, 1,
0.5225605, -1.341613, 1.771767, 0.05098039, 0, 1, 1,
0.5252649, -0.5200408, 1.340617, 0.05490196, 0, 1, 1,
0.5254172, -0.7395523, 2.263359, 0.0627451, 0, 1, 1,
0.5277824, -0.09839702, 3.111099, 0.06666667, 0, 1, 1,
0.532737, 1.095821, 0.6781969, 0.07450981, 0, 1, 1,
0.5377454, 0.1571659, 1.859206, 0.07843138, 0, 1, 1,
0.540756, 0.2284631, -0.3148272, 0.08627451, 0, 1, 1,
0.5477732, -0.3005098, 1.07652, 0.09019608, 0, 1, 1,
0.553196, 0.925594, 0.6661566, 0.09803922, 0, 1, 1,
0.5533627, 0.4060088, 1.408735, 0.1058824, 0, 1, 1,
0.554377, 0.729108, -0.5689737, 0.1098039, 0, 1, 1,
0.5557141, 0.1194516, 2.769554, 0.1176471, 0, 1, 1,
0.5574125, -0.1033343, 0.7858428, 0.1215686, 0, 1, 1,
0.5652654, -1.222102, 3.224966, 0.1294118, 0, 1, 1,
0.5704358, 0.3404881, 1.031295, 0.1333333, 0, 1, 1,
0.5749941, -0.3402994, 3.982785, 0.1411765, 0, 1, 1,
0.5750077, 0.1183991, 1.456903, 0.145098, 0, 1, 1,
0.5796691, -0.1338338, 2.600328, 0.1529412, 0, 1, 1,
0.5810281, 1.268642, 0.4862183, 0.1568628, 0, 1, 1,
0.5823289, -0.7683918, 4.141292, 0.1647059, 0, 1, 1,
0.5907328, -0.2499301, -0.09488674, 0.1686275, 0, 1, 1,
0.5936549, -0.2494768, 1.358663, 0.1764706, 0, 1, 1,
0.5969969, 0.803481, -0.3857483, 0.1803922, 0, 1, 1,
0.5982253, 3.202028, 0.7505228, 0.1882353, 0, 1, 1,
0.5986883, -0.1063346, 2.666642, 0.1921569, 0, 1, 1,
0.5993572, -0.9277862, 1.623792, 0.2, 0, 1, 1,
0.6010894, 1.69774, 0.8533408, 0.2078431, 0, 1, 1,
0.6013142, -0.610084, 2.030811, 0.2117647, 0, 1, 1,
0.6099001, 1.191338, -0.7969562, 0.2196078, 0, 1, 1,
0.6102318, 0.7674928, 0.5090118, 0.2235294, 0, 1, 1,
0.6109157, 1.187556, -2.146685, 0.2313726, 0, 1, 1,
0.6121014, -0.7427575, 2.620654, 0.2352941, 0, 1, 1,
0.6127924, 0.7738867, 0.9553888, 0.2431373, 0, 1, 1,
0.6146972, -1.446432, 0.9555742, 0.2470588, 0, 1, 1,
0.6203774, 0.4326268, 1.935468, 0.254902, 0, 1, 1,
0.6210146, -0.6287292, 1.485822, 0.2588235, 0, 1, 1,
0.6225163, 1.251587, 0.4643739, 0.2666667, 0, 1, 1,
0.6243551, 0.8145339, 1.331847, 0.2705882, 0, 1, 1,
0.6259046, 0.890331, 0.5012834, 0.2784314, 0, 1, 1,
0.6331275, 0.6790884, -0.4634602, 0.282353, 0, 1, 1,
0.6359847, 0.06353923, 1.98782, 0.2901961, 0, 1, 1,
0.6389632, -0.6473014, 1.357357, 0.2941177, 0, 1, 1,
0.6399663, -0.2329581, 1.951889, 0.3019608, 0, 1, 1,
0.6428597, -0.4983921, 4.160172, 0.3098039, 0, 1, 1,
0.6428982, -0.07800604, 1.19087, 0.3137255, 0, 1, 1,
0.6490021, 0.6891116, 1.524425, 0.3215686, 0, 1, 1,
0.649965, -1.31029, 4.001303, 0.3254902, 0, 1, 1,
0.6502894, 1.317122, -0.8361586, 0.3333333, 0, 1, 1,
0.652714, 0.9878934, 3.005987, 0.3372549, 0, 1, 1,
0.6527604, -0.5790786, 2.319144, 0.345098, 0, 1, 1,
0.6535877, -1.545104, -0.6908555, 0.3490196, 0, 1, 1,
0.6601985, -1.558709, 4.753415, 0.3568628, 0, 1, 1,
0.6624904, 0.4853546, 0.4444662, 0.3607843, 0, 1, 1,
0.6628925, 1.144264, 2.514193, 0.3686275, 0, 1, 1,
0.6649384, 1.331209, 1.341174, 0.372549, 0, 1, 1,
0.6656911, -0.3396914, 0.4606465, 0.3803922, 0, 1, 1,
0.6665267, -0.1251674, 1.211644, 0.3843137, 0, 1, 1,
0.6705472, -2.593734, 3.533115, 0.3921569, 0, 1, 1,
0.6767156, 1.393602, 0.2561979, 0.3960784, 0, 1, 1,
0.6769405, -0.3094852, 0.6100599, 0.4039216, 0, 1, 1,
0.6784068, -0.5297551, 1.909435, 0.4117647, 0, 1, 1,
0.6857742, 0.7494293, 1.802475, 0.4156863, 0, 1, 1,
0.6877854, -0.8658369, 3.586605, 0.4235294, 0, 1, 1,
0.6948307, -0.2264951, 0.6120661, 0.427451, 0, 1, 1,
0.6982492, 0.1961846, 0.9361579, 0.4352941, 0, 1, 1,
0.7002032, -1.180728, 3.180171, 0.4392157, 0, 1, 1,
0.7019584, 0.0908714, 1.604146, 0.4470588, 0, 1, 1,
0.7095571, -0.4299235, 2.029223, 0.4509804, 0, 1, 1,
0.7132869, 2.197186, -0.004510195, 0.4588235, 0, 1, 1,
0.7193441, -0.2635418, 1.848507, 0.4627451, 0, 1, 1,
0.7195442, -0.6118016, 2.195702, 0.4705882, 0, 1, 1,
0.7276138, 0.3960904, 0.6917276, 0.4745098, 0, 1, 1,
0.7287536, 0.5165578, 0.5269815, 0.4823529, 0, 1, 1,
0.7293759, 0.8675898, 0.8853654, 0.4862745, 0, 1, 1,
0.7363498, -0.197118, 2.635056, 0.4941176, 0, 1, 1,
0.7404589, -0.6722497, 2.160163, 0.5019608, 0, 1, 1,
0.7413133, -1.099265, 1.782961, 0.5058824, 0, 1, 1,
0.7418095, 0.5362034, 1.410094, 0.5137255, 0, 1, 1,
0.7425421, 0.4856032, 1.538369, 0.5176471, 0, 1, 1,
0.7474757, -0.4476775, 1.197143, 0.5254902, 0, 1, 1,
0.7519857, 0.08841864, 1.74986, 0.5294118, 0, 1, 1,
0.7583693, -0.8807526, 3.446455, 0.5372549, 0, 1, 1,
0.7611392, -0.183882, 3.29791, 0.5411765, 0, 1, 1,
0.7669149, 0.6410249, 0.627579, 0.5490196, 0, 1, 1,
0.768792, -0.2468268, 2.343042, 0.5529412, 0, 1, 1,
0.7753034, 1.346562, -0.6426879, 0.5607843, 0, 1, 1,
0.7775472, 0.1534037, 2.083549, 0.5647059, 0, 1, 1,
0.7776666, -1.259793, 2.919117, 0.572549, 0, 1, 1,
0.7797297, 1.400143, 2.128208, 0.5764706, 0, 1, 1,
0.7801658, -0.6282322, 1.883877, 0.5843138, 0, 1, 1,
0.7856483, 0.7375731, 1.189594, 0.5882353, 0, 1, 1,
0.7944993, 1.490937, 1.713748, 0.5960785, 0, 1, 1,
0.7971396, 1.217734, 0.2788249, 0.6039216, 0, 1, 1,
0.8008262, -0.7719043, 0.7377269, 0.6078432, 0, 1, 1,
0.8010263, -0.8934844, 2.908756, 0.6156863, 0, 1, 1,
0.8041676, -0.4508648, 2.508831, 0.6196079, 0, 1, 1,
0.8075658, -0.5637496, 1.92384, 0.627451, 0, 1, 1,
0.8109863, 0.1496483, 0.2709753, 0.6313726, 0, 1, 1,
0.815922, 1.171549, 0.6542292, 0.6392157, 0, 1, 1,
0.8198075, -0.8322486, 0.7844415, 0.6431373, 0, 1, 1,
0.8222902, -0.7596368, 2.108723, 0.6509804, 0, 1, 1,
0.8223907, -0.6112348, 0.3921652, 0.654902, 0, 1, 1,
0.8235732, -0.1264851, 0.8646713, 0.6627451, 0, 1, 1,
0.8248314, -0.007994805, 1.795967, 0.6666667, 0, 1, 1,
0.8250549, -1.910555, 3.951927, 0.6745098, 0, 1, 1,
0.835031, 0.5574773, 0.8427371, 0.6784314, 0, 1, 1,
0.8429223, 0.4646807, 1.554802, 0.6862745, 0, 1, 1,
0.8434479, -1.728393, 2.884311, 0.6901961, 0, 1, 1,
0.8446749, 0.05724264, 0.8038985, 0.6980392, 0, 1, 1,
0.8493633, -0.680662, 2.896349, 0.7058824, 0, 1, 1,
0.8521587, -0.9542337, 2.03925, 0.7098039, 0, 1, 1,
0.8598896, -2.624026, 1.135385, 0.7176471, 0, 1, 1,
0.8668061, 0.001293144, 1.931085, 0.7215686, 0, 1, 1,
0.8743457, 0.8116404, 0.8995769, 0.7294118, 0, 1, 1,
0.874595, -0.414547, 2.394152, 0.7333333, 0, 1, 1,
0.8801625, 1.023642, 0.6077676, 0.7411765, 0, 1, 1,
0.885582, -0.7524245, 1.765871, 0.7450981, 0, 1, 1,
0.8908327, -0.6826645, 1.763179, 0.7529412, 0, 1, 1,
0.8929026, 1.252265, 0.5424854, 0.7568628, 0, 1, 1,
0.893728, -0.4072743, 1.828768, 0.7647059, 0, 1, 1,
0.8974246, 0.9381192, 0.3231217, 0.7686275, 0, 1, 1,
0.897528, -0.4474017, 3.370557, 0.7764706, 0, 1, 1,
0.8997672, 0.5551476, 1.112219, 0.7803922, 0, 1, 1,
0.9007981, -0.4473611, 2.02945, 0.7882353, 0, 1, 1,
0.9125702, -0.448844, 1.144708, 0.7921569, 0, 1, 1,
0.9145068, 0.8178907, -0.04100046, 0.8, 0, 1, 1,
0.915189, -0.8595107, 1.850203, 0.8078431, 0, 1, 1,
0.9152762, 1.248833, 2.065153, 0.8117647, 0, 1, 1,
0.9226792, 0.2020216, 0.01686044, 0.8196079, 0, 1, 1,
0.9228855, 0.3939609, 0.5886724, 0.8235294, 0, 1, 1,
0.9253546, -0.96794, 3.119235, 0.8313726, 0, 1, 1,
0.9279361, -1.575019, 2.997871, 0.8352941, 0, 1, 1,
0.9318306, 0.2207025, 0.9480715, 0.8431373, 0, 1, 1,
0.9355764, 0.5416606, 1.733233, 0.8470588, 0, 1, 1,
0.9367465, -0.9973689, 1.689046, 0.854902, 0, 1, 1,
0.9392797, 0.9628409, 0.8528645, 0.8588235, 0, 1, 1,
0.9434334, -0.09358553, 0.5733689, 0.8666667, 0, 1, 1,
0.9503064, 0.1087295, 0.9152361, 0.8705882, 0, 1, 1,
0.9611624, 0.6262463, -0.5123987, 0.8784314, 0, 1, 1,
0.964887, -0.6715835, 3.584566, 0.8823529, 0, 1, 1,
0.9713644, 1.25591, -0.72532, 0.8901961, 0, 1, 1,
0.9717398, -0.2056555, 1.959857, 0.8941177, 0, 1, 1,
0.9737223, 0.2380032, 1.081629, 0.9019608, 0, 1, 1,
0.9762178, -0.6802324, 3.435886, 0.9098039, 0, 1, 1,
0.9768406, -0.4183553, 3.141672, 0.9137255, 0, 1, 1,
0.9770021, -1.275676, 2.773039, 0.9215686, 0, 1, 1,
0.9788943, -0.3435479, 2.434032, 0.9254902, 0, 1, 1,
0.9814069, 0.1616247, 0.7192823, 0.9333333, 0, 1, 1,
0.9815361, -0.4377618, 0.588349, 0.9372549, 0, 1, 1,
0.9833578, 0.8663139, -0.7348193, 0.945098, 0, 1, 1,
0.9865316, -0.5170954, 2.272013, 0.9490196, 0, 1, 1,
0.98993, -1.873492, 2.355304, 0.9568627, 0, 1, 1,
0.9899949, -1.408402, 1.373128, 0.9607843, 0, 1, 1,
0.9905727, -0.3273188, 2.229516, 0.9686275, 0, 1, 1,
0.9981583, 0.9348938, 1.026573, 0.972549, 0, 1, 1,
1.001576, -1.692712, 4.344588, 0.9803922, 0, 1, 1,
1.009558, 0.07185144, 1.584164, 0.9843137, 0, 1, 1,
1.017827, 2.950158, 1.72977, 0.9921569, 0, 1, 1,
1.022824, -1.194088, 3.101856, 0.9960784, 0, 1, 1,
1.025313, 0.6391718, -0.01514814, 1, 0, 0.9960784, 1,
1.027148, -1.040993, 1.700044, 1, 0, 0.9882353, 1,
1.027831, 1.085756, 0.1930591, 1, 0, 0.9843137, 1,
1.043975, -0.8847018, 3.191505, 1, 0, 0.9764706, 1,
1.045218, -0.6659418, 1.603004, 1, 0, 0.972549, 1,
1.060212, -1.768833, 2.978122, 1, 0, 0.9647059, 1,
1.061463, -0.7627341, 2.044421, 1, 0, 0.9607843, 1,
1.065892, 0.1618577, 1.113442, 1, 0, 0.9529412, 1,
1.068467, -0.8308093, 2.803358, 1, 0, 0.9490196, 1,
1.076848, 0.5552808, 1.588797, 1, 0, 0.9411765, 1,
1.079245, 0.08025669, 1.720061, 1, 0, 0.9372549, 1,
1.083146, 0.7648197, 1.450707, 1, 0, 0.9294118, 1,
1.093081, -2.05811, 1.888599, 1, 0, 0.9254902, 1,
1.09628, -0.6151628, 2.476193, 1, 0, 0.9176471, 1,
1.099304, -0.7763975, 2.667545, 1, 0, 0.9137255, 1,
1.10779, -0.936685, 2.431376, 1, 0, 0.9058824, 1,
1.109822, -1.017806, 3.121728, 1, 0, 0.9019608, 1,
1.1151, 1.474591, 1.387032, 1, 0, 0.8941177, 1,
1.116624, 0.7191229, 1.090774, 1, 0, 0.8862745, 1,
1.119261, 0.2704041, 0.5012847, 1, 0, 0.8823529, 1,
1.119439, -0.08747238, 1.373971, 1, 0, 0.8745098, 1,
1.119614, 1.637614, 1.998734, 1, 0, 0.8705882, 1,
1.126729, -0.282717, 0.9518586, 1, 0, 0.8627451, 1,
1.132751, -0.1204066, 0.04671935, 1, 0, 0.8588235, 1,
1.133674, -1.395824, 2.663461, 1, 0, 0.8509804, 1,
1.135255, 0.1294268, 1.989731, 1, 0, 0.8470588, 1,
1.144909, -0.2219317, 1.964796, 1, 0, 0.8392157, 1,
1.151519, 0.9116597, 1.627714, 1, 0, 0.8352941, 1,
1.15241, -0.2812716, 3.28433, 1, 0, 0.827451, 1,
1.154427, -1.705122, 2.922982, 1, 0, 0.8235294, 1,
1.157179, 0.2747062, 0.4729933, 1, 0, 0.8156863, 1,
1.163813, 0.3760411, 3.028377, 1, 0, 0.8117647, 1,
1.163914, -1.300711, 1.832864, 1, 0, 0.8039216, 1,
1.167182, 1.403076, 1.424434, 1, 0, 0.7960784, 1,
1.170694, -0.223224, 3.067041, 1, 0, 0.7921569, 1,
1.171489, 0.6640484, -0.02364729, 1, 0, 0.7843137, 1,
1.179681, -0.4145533, 2.083725, 1, 0, 0.7803922, 1,
1.183733, 1.693487, -0.4930489, 1, 0, 0.772549, 1,
1.193736, -1.058361, 2.727873, 1, 0, 0.7686275, 1,
1.199188, 0.137465, 2.062648, 1, 0, 0.7607843, 1,
1.201777, -1.068438, 2.410169, 1, 0, 0.7568628, 1,
1.201817, -0.5009893, 1.476177, 1, 0, 0.7490196, 1,
1.203287, 2.344765, 0.2276224, 1, 0, 0.7450981, 1,
1.21357, 1.050722, 1.410814, 1, 0, 0.7372549, 1,
1.222626, -1.04912, 2.829325, 1, 0, 0.7333333, 1,
1.230113, -0.53456, 1.253288, 1, 0, 0.7254902, 1,
1.232233, -1.083573, 2.788798, 1, 0, 0.7215686, 1,
1.233779, 0.9432469, -0.1242785, 1, 0, 0.7137255, 1,
1.238792, -1.960131, 2.626756, 1, 0, 0.7098039, 1,
1.241612, -1.175607, 0.9598876, 1, 0, 0.7019608, 1,
1.244236, 0.2240239, 1.569955, 1, 0, 0.6941177, 1,
1.253508, 0.2149547, 1.406672, 1, 0, 0.6901961, 1,
1.263599, -0.9387994, 2.012126, 1, 0, 0.682353, 1,
1.267691, -0.3351206, 1.070593, 1, 0, 0.6784314, 1,
1.275802, 0.3654319, 1.792533, 1, 0, 0.6705883, 1,
1.278272, -1.115889, 2.00425, 1, 0, 0.6666667, 1,
1.278759, 1.305546, 0.4189218, 1, 0, 0.6588235, 1,
1.287828, -1.516211, 2.911354, 1, 0, 0.654902, 1,
1.289889, 1.263756, -0.6288401, 1, 0, 0.6470588, 1,
1.295476, 0.6510373, 0.605476, 1, 0, 0.6431373, 1,
1.296095, 0.6722463, 1.188148, 1, 0, 0.6352941, 1,
1.31053, -0.4291972, 1.521532, 1, 0, 0.6313726, 1,
1.317423, -1.856146, 2.149053, 1, 0, 0.6235294, 1,
1.317799, -1.1037, 0.6796644, 1, 0, 0.6196079, 1,
1.321393, -1.792623, 3.471108, 1, 0, 0.6117647, 1,
1.323777, 0.6484262, -0.7276969, 1, 0, 0.6078432, 1,
1.324099, -1.172995, 3.06057, 1, 0, 0.6, 1,
1.327381, 0.2425366, 2.454035, 1, 0, 0.5921569, 1,
1.329754, -0.3301392, 2.481659, 1, 0, 0.5882353, 1,
1.332798, -1.893426, 4.0472, 1, 0, 0.5803922, 1,
1.343608, 0.9474429, -0.4304185, 1, 0, 0.5764706, 1,
1.347051, 1.18375, 1.124254, 1, 0, 0.5686275, 1,
1.348058, 0.4295664, -0.4283814, 1, 0, 0.5647059, 1,
1.352082, -0.9945366, 1.940174, 1, 0, 0.5568628, 1,
1.360442, -0.61022, 2.077071, 1, 0, 0.5529412, 1,
1.370593, -0.1510192, 0.673661, 1, 0, 0.5450981, 1,
1.3734, -0.5870488, 2.974443, 1, 0, 0.5411765, 1,
1.382368, 0.1558703, 1.393102, 1, 0, 0.5333334, 1,
1.386532, 1.267898, 1.94953, 1, 0, 0.5294118, 1,
1.398666, 1.261013, 1.641338, 1, 0, 0.5215687, 1,
1.408672, 0.1199638, 0.4831244, 1, 0, 0.5176471, 1,
1.411063, 1.884878, 1.317942, 1, 0, 0.509804, 1,
1.446653, 0.7689333, 1.046581, 1, 0, 0.5058824, 1,
1.469522, 1.124706, 1.872058, 1, 0, 0.4980392, 1,
1.474621, 2.440345, 0.2449419, 1, 0, 0.4901961, 1,
1.476329, -1.993275, 2.055379, 1, 0, 0.4862745, 1,
1.480811, 1.158803, 0.2290904, 1, 0, 0.4784314, 1,
1.488224, 1.999942, 2.144478, 1, 0, 0.4745098, 1,
1.492316, 0.4392845, 1.516848, 1, 0, 0.4666667, 1,
1.498629, -1.126369, 3.123138, 1, 0, 0.4627451, 1,
1.499301, 1.829665, 2.469939, 1, 0, 0.454902, 1,
1.505841, 1.680455, -0.0807954, 1, 0, 0.4509804, 1,
1.520699, -0.5881262, -0.2181675, 1, 0, 0.4431373, 1,
1.525848, 1.291633, 1.037233, 1, 0, 0.4392157, 1,
1.528686, 0.3473007, 2.26691, 1, 0, 0.4313726, 1,
1.529053, 1.398484, 1.667633, 1, 0, 0.427451, 1,
1.530542, 0.9845036, 1.138326, 1, 0, 0.4196078, 1,
1.545419, -0.01078982, 0.5230446, 1, 0, 0.4156863, 1,
1.5476, 0.07914936, 1.037354, 1, 0, 0.4078431, 1,
1.556519, 0.09633858, 1.049595, 1, 0, 0.4039216, 1,
1.558217, -0.2985893, 3.667289, 1, 0, 0.3960784, 1,
1.560335, 0.9778888, 0.9312877, 1, 0, 0.3882353, 1,
1.564553, -0.2768912, 2.029326, 1, 0, 0.3843137, 1,
1.577073, 2.478909, 0.5466064, 1, 0, 0.3764706, 1,
1.579168, 1.433592, 0.2800386, 1, 0, 0.372549, 1,
1.580193, 0.356953, -0.3283333, 1, 0, 0.3647059, 1,
1.582842, -0.1796972, 1.105125, 1, 0, 0.3607843, 1,
1.592596, 0.7905599, 2.140253, 1, 0, 0.3529412, 1,
1.605692, 0.06129851, -0.3586874, 1, 0, 0.3490196, 1,
1.607336, -0.4051926, 1.749748, 1, 0, 0.3411765, 1,
1.611622, 0.3663905, 0.8456862, 1, 0, 0.3372549, 1,
1.629605, 0.9453562, 1.839872, 1, 0, 0.3294118, 1,
1.662193, -0.9906896, 2.629445, 1, 0, 0.3254902, 1,
1.665488, 1.784999, -0.8951567, 1, 0, 0.3176471, 1,
1.665905, -0.1291079, 2.434404, 1, 0, 0.3137255, 1,
1.680542, -0.1429813, 2.07667, 1, 0, 0.3058824, 1,
1.686907, 0.6594832, 2.070785, 1, 0, 0.2980392, 1,
1.708608, 0.3792444, 1.534685, 1, 0, 0.2941177, 1,
1.719091, 0.9650156, 2.477967, 1, 0, 0.2862745, 1,
1.726287, -0.1968877, 2.340512, 1, 0, 0.282353, 1,
1.728669, 0.3263841, 0.7846152, 1, 0, 0.2745098, 1,
1.754979, -0.1831866, 1.516981, 1, 0, 0.2705882, 1,
1.789704, -0.3103016, 2.131625, 1, 0, 0.2627451, 1,
1.810204, -1.258355, 4.697531, 1, 0, 0.2588235, 1,
1.842122, -0.2250161, 1.472619, 1, 0, 0.2509804, 1,
1.848481, 0.9697384, 3.011576, 1, 0, 0.2470588, 1,
1.850998, 1.438865, 1.566375, 1, 0, 0.2392157, 1,
1.867319, -1.24811, 1.942035, 1, 0, 0.2352941, 1,
1.889002, 0.5449024, 2.296654, 1, 0, 0.227451, 1,
1.906332, 0.4246336, 1.743832, 1, 0, 0.2235294, 1,
1.91531, -1.381861, 2.189435, 1, 0, 0.2156863, 1,
1.924422, -0.9233036, 2.083106, 1, 0, 0.2117647, 1,
1.937628, 0.3994316, 0.2014967, 1, 0, 0.2039216, 1,
1.93873, -0.3640693, 0.9516871, 1, 0, 0.1960784, 1,
1.939198, -0.4863637, 1.927521, 1, 0, 0.1921569, 1,
1.957384, 0.5015888, 1.368613, 1, 0, 0.1843137, 1,
1.966748, -2.521818, 3.773845, 1, 0, 0.1803922, 1,
2.038558, -0.3368872, 1.613962, 1, 0, 0.172549, 1,
2.048936, 0.3178142, 2.518827, 1, 0, 0.1686275, 1,
2.077344, 0.2987047, 1.789278, 1, 0, 0.1607843, 1,
2.095653, -0.1127641, -0.1292437, 1, 0, 0.1568628, 1,
2.104255, -0.7756069, 1.192832, 1, 0, 0.1490196, 1,
2.11089, -2.525985, 2.233201, 1, 0, 0.145098, 1,
2.11649, -1.379079, 2.303906, 1, 0, 0.1372549, 1,
2.148863, 2.141237, 2.057123, 1, 0, 0.1333333, 1,
2.158314, -1.077748, 2.04521, 1, 0, 0.1254902, 1,
2.177598, 0.1512372, 0.7221349, 1, 0, 0.1215686, 1,
2.19437, -0.1369855, 1.805087, 1, 0, 0.1137255, 1,
2.257736, 0.5172668, 2.050563, 1, 0, 0.1098039, 1,
2.271053, 0.4537703, 0.5743272, 1, 0, 0.1019608, 1,
2.277747, 1.230797, 1.837311, 1, 0, 0.09411765, 1,
2.294398, -0.5149371, 2.917731, 1, 0, 0.09019608, 1,
2.323166, -0.1544698, 1.862786, 1, 0, 0.08235294, 1,
2.333873, -0.5017128, 2.895215, 1, 0, 0.07843138, 1,
2.41409, -0.7813361, 0.5597341, 1, 0, 0.07058824, 1,
2.421093, -0.377009, 2.08353, 1, 0, 0.06666667, 1,
2.446236, -0.09226376, 3.198504, 1, 0, 0.05882353, 1,
2.485898, -1.628423, 3.145579, 1, 0, 0.05490196, 1,
2.537925, 1.359924, 2.937362, 1, 0, 0.04705882, 1,
2.599676, 1.399665, 0.6399532, 1, 0, 0.04313726, 1,
2.686102, -0.907269, 3.431123, 1, 0, 0.03529412, 1,
2.748902, 0.3381772, 1.541427, 1, 0, 0.03137255, 1,
3.006692, 1.566744, -0.5415974, 1, 0, 0.02352941, 1,
3.034616, -0.3619553, 2.400627, 1, 0, 0.01960784, 1,
3.069335, 1.656082, 1.483703, 1, 0, 0.01176471, 1,
3.080733, -0.4735591, 1.106435, 1, 0, 0.007843138, 1
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
0.09325981, -4.207922, -6.90601, 0, -0.5, 0.5, 0.5,
0.09325981, -4.207922, -6.90601, 1, -0.5, 0.5, 0.5,
0.09325981, -4.207922, -6.90601, 1, 1.5, 0.5, 0.5,
0.09325981, -4.207922, -6.90601, 0, 1.5, 0.5, 0.5
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
-3.906967, 0.03402865, -6.90601, 0, -0.5, 0.5, 0.5,
-3.906967, 0.03402865, -6.90601, 1, -0.5, 0.5, 0.5,
-3.906967, 0.03402865, -6.90601, 1, 1.5, 0.5, 0.5,
-3.906967, 0.03402865, -6.90601, 0, 1.5, 0.5, 0.5
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
-3.906967, -4.207922, -0.2313755, 0, -0.5, 0.5, 0.5,
-3.906967, -4.207922, -0.2313755, 1, -0.5, 0.5, 0.5,
-3.906967, -4.207922, -0.2313755, 1, 1.5, 0.5, 0.5,
-3.906967, -4.207922, -0.2313755, 0, 1.5, 0.5, 0.5
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
-2, -3.229011, -5.36571,
3, -3.229011, -5.36571,
-2, -3.229011, -5.36571,
-2, -3.392163, -5.622427,
-1, -3.229011, -5.36571,
-1, -3.392163, -5.622427,
0, -3.229011, -5.36571,
0, -3.392163, -5.622427,
1, -3.229011, -5.36571,
1, -3.392163, -5.622427,
2, -3.229011, -5.36571,
2, -3.392163, -5.622427,
3, -3.229011, -5.36571,
3, -3.392163, -5.622427
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
-2, -3.718467, -6.13586, 0, -0.5, 0.5, 0.5,
-2, -3.718467, -6.13586, 1, -0.5, 0.5, 0.5,
-2, -3.718467, -6.13586, 1, 1.5, 0.5, 0.5,
-2, -3.718467, -6.13586, 0, 1.5, 0.5, 0.5,
-1, -3.718467, -6.13586, 0, -0.5, 0.5, 0.5,
-1, -3.718467, -6.13586, 1, -0.5, 0.5, 0.5,
-1, -3.718467, -6.13586, 1, 1.5, 0.5, 0.5,
-1, -3.718467, -6.13586, 0, 1.5, 0.5, 0.5,
0, -3.718467, -6.13586, 0, -0.5, 0.5, 0.5,
0, -3.718467, -6.13586, 1, -0.5, 0.5, 0.5,
0, -3.718467, -6.13586, 1, 1.5, 0.5, 0.5,
0, -3.718467, -6.13586, 0, 1.5, 0.5, 0.5,
1, -3.718467, -6.13586, 0, -0.5, 0.5, 0.5,
1, -3.718467, -6.13586, 1, -0.5, 0.5, 0.5,
1, -3.718467, -6.13586, 1, 1.5, 0.5, 0.5,
1, -3.718467, -6.13586, 0, 1.5, 0.5, 0.5,
2, -3.718467, -6.13586, 0, -0.5, 0.5, 0.5,
2, -3.718467, -6.13586, 1, -0.5, 0.5, 0.5,
2, -3.718467, -6.13586, 1, 1.5, 0.5, 0.5,
2, -3.718467, -6.13586, 0, 1.5, 0.5, 0.5,
3, -3.718467, -6.13586, 0, -0.5, 0.5, 0.5,
3, -3.718467, -6.13586, 1, -0.5, 0.5, 0.5,
3, -3.718467, -6.13586, 1, 1.5, 0.5, 0.5,
3, -3.718467, -6.13586, 0, 1.5, 0.5, 0.5
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
-2.983838, -3, -5.36571,
-2.983838, 3, -5.36571,
-2.983838, -3, -5.36571,
-3.137693, -3, -5.622427,
-2.983838, -2, -5.36571,
-3.137693, -2, -5.622427,
-2.983838, -1, -5.36571,
-3.137693, -1, -5.622427,
-2.983838, 0, -5.36571,
-3.137693, 0, -5.622427,
-2.983838, 1, -5.36571,
-3.137693, 1, -5.622427,
-2.983838, 2, -5.36571,
-3.137693, 2, -5.622427,
-2.983838, 3, -5.36571,
-3.137693, 3, -5.622427
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
-3.445403, -3, -6.13586, 0, -0.5, 0.5, 0.5,
-3.445403, -3, -6.13586, 1, -0.5, 0.5, 0.5,
-3.445403, -3, -6.13586, 1, 1.5, 0.5, 0.5,
-3.445403, -3, -6.13586, 0, 1.5, 0.5, 0.5,
-3.445403, -2, -6.13586, 0, -0.5, 0.5, 0.5,
-3.445403, -2, -6.13586, 1, -0.5, 0.5, 0.5,
-3.445403, -2, -6.13586, 1, 1.5, 0.5, 0.5,
-3.445403, -2, -6.13586, 0, 1.5, 0.5, 0.5,
-3.445403, -1, -6.13586, 0, -0.5, 0.5, 0.5,
-3.445403, -1, -6.13586, 1, -0.5, 0.5, 0.5,
-3.445403, -1, -6.13586, 1, 1.5, 0.5, 0.5,
-3.445403, -1, -6.13586, 0, 1.5, 0.5, 0.5,
-3.445403, 0, -6.13586, 0, -0.5, 0.5, 0.5,
-3.445403, 0, -6.13586, 1, -0.5, 0.5, 0.5,
-3.445403, 0, -6.13586, 1, 1.5, 0.5, 0.5,
-3.445403, 0, -6.13586, 0, 1.5, 0.5, 0.5,
-3.445403, 1, -6.13586, 0, -0.5, 0.5, 0.5,
-3.445403, 1, -6.13586, 1, -0.5, 0.5, 0.5,
-3.445403, 1, -6.13586, 1, 1.5, 0.5, 0.5,
-3.445403, 1, -6.13586, 0, 1.5, 0.5, 0.5,
-3.445403, 2, -6.13586, 0, -0.5, 0.5, 0.5,
-3.445403, 2, -6.13586, 1, -0.5, 0.5, 0.5,
-3.445403, 2, -6.13586, 1, 1.5, 0.5, 0.5,
-3.445403, 2, -6.13586, 0, 1.5, 0.5, 0.5,
-3.445403, 3, -6.13586, 0, -0.5, 0.5, 0.5,
-3.445403, 3, -6.13586, 1, -0.5, 0.5, 0.5,
-3.445403, 3, -6.13586, 1, 1.5, 0.5, 0.5,
-3.445403, 3, -6.13586, 0, 1.5, 0.5, 0.5
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
-2.983838, -3.229011, -4,
-2.983838, -3.229011, 4,
-2.983838, -3.229011, -4,
-3.137693, -3.392163, -4,
-2.983838, -3.229011, -2,
-3.137693, -3.392163, -2,
-2.983838, -3.229011, 0,
-3.137693, -3.392163, 0,
-2.983838, -3.229011, 2,
-3.137693, -3.392163, 2,
-2.983838, -3.229011, 4,
-3.137693, -3.392163, 4
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
-3.445403, -3.718467, -4, 0, -0.5, 0.5, 0.5,
-3.445403, -3.718467, -4, 1, -0.5, 0.5, 0.5,
-3.445403, -3.718467, -4, 1, 1.5, 0.5, 0.5,
-3.445403, -3.718467, -4, 0, 1.5, 0.5, 0.5,
-3.445403, -3.718467, -2, 0, -0.5, 0.5, 0.5,
-3.445403, -3.718467, -2, 1, -0.5, 0.5, 0.5,
-3.445403, -3.718467, -2, 1, 1.5, 0.5, 0.5,
-3.445403, -3.718467, -2, 0, 1.5, 0.5, 0.5,
-3.445403, -3.718467, 0, 0, -0.5, 0.5, 0.5,
-3.445403, -3.718467, 0, 1, -0.5, 0.5, 0.5,
-3.445403, -3.718467, 0, 1, 1.5, 0.5, 0.5,
-3.445403, -3.718467, 0, 0, 1.5, 0.5, 0.5,
-3.445403, -3.718467, 2, 0, -0.5, 0.5, 0.5,
-3.445403, -3.718467, 2, 1, -0.5, 0.5, 0.5,
-3.445403, -3.718467, 2, 1, 1.5, 0.5, 0.5,
-3.445403, -3.718467, 2, 0, 1.5, 0.5, 0.5,
-3.445403, -3.718467, 4, 0, -0.5, 0.5, 0.5,
-3.445403, -3.718467, 4, 1, -0.5, 0.5, 0.5,
-3.445403, -3.718467, 4, 1, 1.5, 0.5, 0.5,
-3.445403, -3.718467, 4, 0, 1.5, 0.5, 0.5
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
-2.983838, -3.229011, -5.36571,
-2.983838, 3.297068, -5.36571,
-2.983838, -3.229011, 4.902959,
-2.983838, 3.297068, 4.902959,
-2.983838, -3.229011, -5.36571,
-2.983838, -3.229011, 4.902959,
-2.983838, 3.297068, -5.36571,
-2.983838, 3.297068, 4.902959,
-2.983838, -3.229011, -5.36571,
3.170357, -3.229011, -5.36571,
-2.983838, -3.229011, 4.902959,
3.170357, -3.229011, 4.902959,
-2.983838, 3.297068, -5.36571,
3.170357, 3.297068, -5.36571,
-2.983838, 3.297068, 4.902959,
3.170357, 3.297068, 4.902959,
3.170357, -3.229011, -5.36571,
3.170357, 3.297068, -5.36571,
3.170357, -3.229011, 4.902959,
3.170357, 3.297068, 4.902959,
3.170357, -3.229011, -5.36571,
3.170357, -3.229011, 4.902959,
3.170357, 3.297068, -5.36571,
3.170357, 3.297068, 4.902959
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
var radius = 7.28075;
var distance = 32.39288;
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
mvMatrix.translate( -0.09325981, -0.03402865, 0.2313755 );
mvMatrix.scale( 1.279142, 1.206251, 0.7666125 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.39288);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Briton<-read.table("Briton.xyz")
```

```
## Error in read.table("Briton.xyz"): no lines available in input
```

```r
x<-Briton$V2
```

```
## Error in eval(expr, envir, enclos): object 'Briton' not found
```

```r
y<-Briton$V3
```

```
## Error in eval(expr, envir, enclos): object 'Briton' not found
```

```r
z<-Briton$V4
```

```
## Error in eval(expr, envir, enclos): object 'Briton' not found
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
-2.894214, -0.5803571, -1.617845, 0, 0, 1, 1, 1,
-2.804573, -0.02677299, -0.9937907, 1, 0, 0, 1, 1,
-2.726972, -0.006909884, -2.722169, 1, 0, 0, 1, 1,
-2.690773, 0.0733072, -0.7997155, 1, 0, 0, 1, 1,
-2.674564, -0.8022176, -3.340415, 1, 0, 0, 1, 1,
-2.476604, -0.8787966, -1.955878, 1, 0, 0, 1, 1,
-2.418219, 0.5704716, -0.9840363, 0, 0, 0, 1, 1,
-2.275795, -0.2341364, -2.163589, 0, 0, 0, 1, 1,
-2.269538, 1.192691, -1.788953, 0, 0, 0, 1, 1,
-2.25677, -0.2449094, -2.216278, 0, 0, 0, 1, 1,
-2.216621, 0.3150616, -1.819103, 0, 0, 0, 1, 1,
-2.202474, -0.1198828, -1.774317, 0, 0, 0, 1, 1,
-2.202278, -0.7254608, -1.691814, 0, 0, 0, 1, 1,
-2.166345, -0.3439153, -2.566512, 1, 1, 1, 1, 1,
-2.142804, 0.1879239, -1.57955, 1, 1, 1, 1, 1,
-2.10847, -0.7194313, -1.219194, 1, 1, 1, 1, 1,
-2.030168, 0.2018365, -3.473235, 1, 1, 1, 1, 1,
-2.015604, 2.474866, -0.9811438, 1, 1, 1, 1, 1,
-2.002434, -0.03180262, -1.387768, 1, 1, 1, 1, 1,
-1.997628, 0.6017623, -1.539421, 1, 1, 1, 1, 1,
-1.996619, 0.415612, -2.121059, 1, 1, 1, 1, 1,
-1.992103, -0.8516396, -3.288869, 1, 1, 1, 1, 1,
-1.989644, -0.7473657, -2.458841, 1, 1, 1, 1, 1,
-1.97762, 1.009471, -2.932463, 1, 1, 1, 1, 1,
-1.953594, 0.3113642, 0.2072179, 1, 1, 1, 1, 1,
-1.947249, -0.5992166, -3.341024, 1, 1, 1, 1, 1,
-1.944859, -0.7359719, -2.35917, 1, 1, 1, 1, 1,
-1.905897, 0.9976285, -0.7280884, 1, 1, 1, 1, 1,
-1.892191, -1.578238, -0.9699829, 0, 0, 1, 1, 1,
-1.850342, 0.1400051, -2.253225, 1, 0, 0, 1, 1,
-1.831404, 1.860399, -1.209039, 1, 0, 0, 1, 1,
-1.802082, -0.07352501, -2.18791, 1, 0, 0, 1, 1,
-1.776642, -1.374399, -1.603845, 1, 0, 0, 1, 1,
-1.7747, -0.5230422, -2.341096, 1, 0, 0, 1, 1,
-1.754414, -0.8933461, -2.216023, 0, 0, 0, 1, 1,
-1.75166, -0.8220716, -2.786637, 0, 0, 0, 1, 1,
-1.750044, 0.1302746, -1.375652, 0, 0, 0, 1, 1,
-1.747344, -0.4211475, -0.6407, 0, 0, 0, 1, 1,
-1.730422, 1.927294, -0.4776824, 0, 0, 0, 1, 1,
-1.663553, -0.8593253, -2.464332, 0, 0, 0, 1, 1,
-1.662536, 0.4055215, -2.132019, 0, 0, 0, 1, 1,
-1.660032, -0.7983159, -1.374842, 1, 1, 1, 1, 1,
-1.646365, 0.3259676, -1.335548, 1, 1, 1, 1, 1,
-1.630106, -0.5130373, -0.1694416, 1, 1, 1, 1, 1,
-1.611865, -1.583908, -1.170903, 1, 1, 1, 1, 1,
-1.60029, 0.6325316, -0.764288, 1, 1, 1, 1, 1,
-1.594844, 0.9195375, 1.259274, 1, 1, 1, 1, 1,
-1.58733, 1.962887, -0.7638783, 1, 1, 1, 1, 1,
-1.58411, 0.5126468, -2.127291, 1, 1, 1, 1, 1,
-1.583435, 1.060573, -0.8451453, 1, 1, 1, 1, 1,
-1.58138, -1.80082, -2.343181, 1, 1, 1, 1, 1,
-1.576951, -1.234378, -2.627215, 1, 1, 1, 1, 1,
-1.572651, -0.7246801, -1.938647, 1, 1, 1, 1, 1,
-1.561237, 1.614205, -1.309454, 1, 1, 1, 1, 1,
-1.535342, -0.1243333, -3.114143, 1, 1, 1, 1, 1,
-1.532996, 0.3401431, -2.428513, 1, 1, 1, 1, 1,
-1.531465, 0.7111481, -1.225933, 0, 0, 1, 1, 1,
-1.512859, -0.8763753, -4.671802, 1, 0, 0, 1, 1,
-1.511769, -0.008964765, -2.66579, 1, 0, 0, 1, 1,
-1.511191, -0.464282, -1.616328, 1, 0, 0, 1, 1,
-1.508387, 0.8296248, -1.078879, 1, 0, 0, 1, 1,
-1.489843, -1.451116, -1.17547, 1, 0, 0, 1, 1,
-1.478823, 0.1282821, -0.8872129, 0, 0, 0, 1, 1,
-1.474876, 2.316339, -1.303987, 0, 0, 0, 1, 1,
-1.470291, -0.9641745, -3.840709, 0, 0, 0, 1, 1,
-1.464339, 0.4589006, -1.080777, 0, 0, 0, 1, 1,
-1.451244, 1.547245, -1.44388, 0, 0, 0, 1, 1,
-1.446347, 0.4039166, -1.739211, 0, 0, 0, 1, 1,
-1.445583, 0.3567716, -0.5581136, 0, 0, 0, 1, 1,
-1.44143, -0.7777216, -0.9172186, 1, 1, 1, 1, 1,
-1.438483, -1.706828, -3.37551, 1, 1, 1, 1, 1,
-1.435911, 0.578751, 1.089776, 1, 1, 1, 1, 1,
-1.42305, -0.2192958, -0.6390457, 1, 1, 1, 1, 1,
-1.419398, 0.2918371, -1.380148, 1, 1, 1, 1, 1,
-1.419281, 0.3909995, -0.721444, 1, 1, 1, 1, 1,
-1.417352, 2.015643, -0.9005114, 1, 1, 1, 1, 1,
-1.413729, -0.8420564, -3.5677, 1, 1, 1, 1, 1,
-1.413224, 0.1447963, -2.511793, 1, 1, 1, 1, 1,
-1.407984, 0.678596, -1.283127, 1, 1, 1, 1, 1,
-1.393709, -0.03780722, -2.196901, 1, 1, 1, 1, 1,
-1.391527, 1.66833, -0.1647927, 1, 1, 1, 1, 1,
-1.371895, -0.0582938, -3.70194, 1, 1, 1, 1, 1,
-1.365137, -0.4791459, -2.582935, 1, 1, 1, 1, 1,
-1.364732, 0.3010101, -1.050599, 1, 1, 1, 1, 1,
-1.359704, -0.3755883, -1.941505, 0, 0, 1, 1, 1,
-1.355492, -0.8702321, -3.544589, 1, 0, 0, 1, 1,
-1.341779, -1.027327, -1.470293, 1, 0, 0, 1, 1,
-1.330478, 0.5319418, -1.690418, 1, 0, 0, 1, 1,
-1.325254, 0.9087779, -1.566326, 1, 0, 0, 1, 1,
-1.316602, 1.82592, -0.9050841, 1, 0, 0, 1, 1,
-1.315302, 0.9285795, -0.08077718, 0, 0, 0, 1, 1,
-1.297796, -0.5585931, -0.8910437, 0, 0, 0, 1, 1,
-1.295506, -0.273305, -1.29547, 0, 0, 0, 1, 1,
-1.295015, 0.64377, -1.395788, 0, 0, 0, 1, 1,
-1.292679, -0.532871, -1.872559, 0, 0, 0, 1, 1,
-1.292425, -1.168605, -2.726457, 0, 0, 0, 1, 1,
-1.275148, -2.354208, -0.3793595, 0, 0, 0, 1, 1,
-1.259902, 0.4497142, -3.82546, 1, 1, 1, 1, 1,
-1.227491, -0.3365437, -2.167921, 1, 1, 1, 1, 1,
-1.227345, -0.1071361, -3.075248, 1, 1, 1, 1, 1,
-1.22566, 0.0765576, -1.094886, 1, 1, 1, 1, 1,
-1.225303, -0.3054265, -2.076277, 1, 1, 1, 1, 1,
-1.217953, -0.4995028, -1.074903, 1, 1, 1, 1, 1,
-1.216457, 0.7429032, -2.190116, 1, 1, 1, 1, 1,
-1.212901, -1.044395, -0.3768357, 1, 1, 1, 1, 1,
-1.201512, 0.1352787, -1.96293, 1, 1, 1, 1, 1,
-1.191264, -0.08716393, -1.397286, 1, 1, 1, 1, 1,
-1.181474, 0.8274112, 1.289967, 1, 1, 1, 1, 1,
-1.179811, -2.458566, -4.068803, 1, 1, 1, 1, 1,
-1.17311, 1.664494, 0.5714299, 1, 1, 1, 1, 1,
-1.168106, -0.4356706, 0.04680779, 1, 1, 1, 1, 1,
-1.167236, -0.7837126, -2.791764, 1, 1, 1, 1, 1,
-1.159717, 0.2807284, -2.233894, 0, 0, 1, 1, 1,
-1.15508, 0.1499914, -1.56497, 1, 0, 0, 1, 1,
-1.153459, 0.2792433, -1.323612, 1, 0, 0, 1, 1,
-1.150589, -0.1038458, -1.432863, 1, 0, 0, 1, 1,
-1.149871, -0.3816023, -1.727483, 1, 0, 0, 1, 1,
-1.124962, -0.08582761, -1.658903, 1, 0, 0, 1, 1,
-1.118984, 0.1223412, -1.638356, 0, 0, 0, 1, 1,
-1.105069, 0.7321939, 0.2134553, 0, 0, 0, 1, 1,
-1.096495, 0.825837, 0.08666845, 0, 0, 0, 1, 1,
-1.089571, 1.025046, 0.5230176, 0, 0, 0, 1, 1,
-1.086724, -0.4945855, -0.8505203, 0, 0, 0, 1, 1,
-1.086094, 0.8303667, -1.357031, 0, 0, 0, 1, 1,
-1.076669, 0.644311, 0.3019973, 0, 0, 0, 1, 1,
-1.070459, 0.2701912, -0.6901572, 1, 1, 1, 1, 1,
-1.064985, 0.3200719, -0.8742548, 1, 1, 1, 1, 1,
-1.063026, 0.2100623, -1.187298, 1, 1, 1, 1, 1,
-1.054337, -0.4372585, -2.015469, 1, 1, 1, 1, 1,
-1.053388, 0.02408626, -2.758896, 1, 1, 1, 1, 1,
-1.052531, -1.253319, -2.10159, 1, 1, 1, 1, 1,
-1.045866, -1.401198, -2.848324, 1, 1, 1, 1, 1,
-1.035379, -0.9260378, -0.4519289, 1, 1, 1, 1, 1,
-1.035144, -1.943075, -1.413017, 1, 1, 1, 1, 1,
-1.034299, 1.113374, -0.0392129, 1, 1, 1, 1, 1,
-1.031816, 0.302844, -1.945197, 1, 1, 1, 1, 1,
-1.025395, -1.004236, -2.38103, 1, 1, 1, 1, 1,
-1.023727, 1.490651, -2.115393, 1, 1, 1, 1, 1,
-1.022544, 0.7709399, -1.371337, 1, 1, 1, 1, 1,
-1.021436, -0.7869861, -4.848108, 1, 1, 1, 1, 1,
-1.017146, -0.9822011, -3.278785, 0, 0, 1, 1, 1,
-1.012216, -0.6565732, -1.984447, 1, 0, 0, 1, 1,
-1.007098, -1.222364, -1.738749, 1, 0, 0, 1, 1,
-1.00041, -1.641021, -3.985247, 1, 0, 0, 1, 1,
-0.9990036, -0.5037482, -2.055376, 1, 0, 0, 1, 1,
-0.9966249, -1.053118, -3.937682, 1, 0, 0, 1, 1,
-0.9958805, -0.1059589, -1.683758, 0, 0, 0, 1, 1,
-0.9918712, -0.76744, -1.050216, 0, 0, 0, 1, 1,
-0.9887382, -0.3460408, -1.628835, 0, 0, 0, 1, 1,
-0.9838026, -0.823092, -2.047485, 0, 0, 0, 1, 1,
-0.9708742, -0.4630062, -1.879518, 0, 0, 0, 1, 1,
-0.9685862, 0.1845845, -2.985143, 0, 0, 0, 1, 1,
-0.9654079, -1.255027, -2.797654, 0, 0, 0, 1, 1,
-0.9615514, -2.144027, -3.749483, 1, 1, 1, 1, 1,
-0.9610277, -0.7076649, -0.3625405, 1, 1, 1, 1, 1,
-0.9531708, -0.3540468, -3.565609, 1, 1, 1, 1, 1,
-0.9453168, -1.441891, -3.470167, 1, 1, 1, 1, 1,
-0.9444222, -2.012274, -1.316294, 1, 1, 1, 1, 1,
-0.9387324, 0.4008761, -0.5958945, 1, 1, 1, 1, 1,
-0.9383596, -0.7060434, -1.723896, 1, 1, 1, 1, 1,
-0.9303855, -0.0132347, -2.86339, 1, 1, 1, 1, 1,
-0.9302307, -0.8365192, -1.934785, 1, 1, 1, 1, 1,
-0.9282515, 0.2803295, -2.554565, 1, 1, 1, 1, 1,
-0.9194154, -0.8260772, -2.344012, 1, 1, 1, 1, 1,
-0.9190301, -1.375792, -4.101571, 1, 1, 1, 1, 1,
-0.9079257, 0.4600913, -1.149412, 1, 1, 1, 1, 1,
-0.9076229, -0.4000617, -3.183841, 1, 1, 1, 1, 1,
-0.9023781, 1.194872, 1.066009, 1, 1, 1, 1, 1,
-0.8958494, -0.05842258, -1.277672, 0, 0, 1, 1, 1,
-0.8903172, -1.780681, -5.087231, 1, 0, 0, 1, 1,
-0.8888183, 0.2644848, -2.186628, 1, 0, 0, 1, 1,
-0.8879519, -2.387262, -1.911224, 1, 0, 0, 1, 1,
-0.8842495, 0.1014505, -1.875557, 1, 0, 0, 1, 1,
-0.8841413, 0.01694444, -1.065182, 1, 0, 0, 1, 1,
-0.8778331, -0.8889999, -3.06385, 0, 0, 0, 1, 1,
-0.8770522, 0.264586, 0.4108271, 0, 0, 0, 1, 1,
-0.868428, -0.9879618, -1.27329, 0, 0, 0, 1, 1,
-0.8650232, -0.5544065, -2.399582, 0, 0, 0, 1, 1,
-0.8600864, -0.5947312, -1.568592, 0, 0, 0, 1, 1,
-0.857278, 0.7662622, -2.043398, 0, 0, 0, 1, 1,
-0.8488311, -1.39594, -2.101885, 0, 0, 0, 1, 1,
-0.8478613, 0.04923371, -3.975307, 1, 1, 1, 1, 1,
-0.8429705, 1.359815, 0.3117355, 1, 1, 1, 1, 1,
-0.8344203, -2.004639, -2.428192, 1, 1, 1, 1, 1,
-0.8332098, -0.4901567, -2.794641, 1, 1, 1, 1, 1,
-0.8316661, -1.128619, -2.890115, 1, 1, 1, 1, 1,
-0.828761, -0.506704, -3.424272, 1, 1, 1, 1, 1,
-0.8274025, 2.560048, -0.1803449, 1, 1, 1, 1, 1,
-0.8269244, 1.802112, -0.2892392, 1, 1, 1, 1, 1,
-0.8232554, 0.2152241, -1.50034, 1, 1, 1, 1, 1,
-0.8224781, -0.3833241, -2.596694, 1, 1, 1, 1, 1,
-0.8214521, 0.2850726, -1.258414, 1, 1, 1, 1, 1,
-0.8187384, 1.603647, -0.8820279, 1, 1, 1, 1, 1,
-0.8080453, 0.7945766, 0.6641837, 1, 1, 1, 1, 1,
-0.80528, 0.88388, -0.7793393, 1, 1, 1, 1, 1,
-0.7978055, 1.133977, -0.4025029, 1, 1, 1, 1, 1,
-0.7868785, -0.4008192, -2.929421, 0, 0, 1, 1, 1,
-0.7833012, 1.046506, 0.1343336, 1, 0, 0, 1, 1,
-0.7798446, 0.3524431, -1.798322, 1, 0, 0, 1, 1,
-0.7777531, 0.06337085, -1.871747, 1, 0, 0, 1, 1,
-0.7765873, -1.584652, -3.908987, 1, 0, 0, 1, 1,
-0.7753842, -0.520515, -3.121648, 1, 0, 0, 1, 1,
-0.7729883, -1.036392, -3.501607, 0, 0, 0, 1, 1,
-0.7669091, -0.1825974, -0.9445379, 0, 0, 0, 1, 1,
-0.7646664, 2.653108, 0.3854572, 0, 0, 0, 1, 1,
-0.7605988, 1.415625, 1.565595, 0, 0, 0, 1, 1,
-0.7581975, 0.3126779, -0.3180917, 0, 0, 0, 1, 1,
-0.7546273, -0.2245209, -3.106042, 0, 0, 0, 1, 1,
-0.7416494, -0.4146596, -2.380255, 0, 0, 0, 1, 1,
-0.7365423, 1.327518, -0.7279583, 1, 1, 1, 1, 1,
-0.733261, 0.5279824, -0.5426733, 1, 1, 1, 1, 1,
-0.7324852, 0.2693977, -1.360416, 1, 1, 1, 1, 1,
-0.7299844, 0.2472907, -2.462453, 1, 1, 1, 1, 1,
-0.7193488, -1.43736, -3.187428, 1, 1, 1, 1, 1,
-0.7146042, 1.247953, -0.1946404, 1, 1, 1, 1, 1,
-0.7140704, -0.1806509, -0.9164553, 1, 1, 1, 1, 1,
-0.7109541, -0.1921178, -1.890602, 1, 1, 1, 1, 1,
-0.7098513, -1.36107, -2.421318, 1, 1, 1, 1, 1,
-0.7091942, 0.635027, -2.590438, 1, 1, 1, 1, 1,
-0.7091904, -0.2208816, -4.501499, 1, 1, 1, 1, 1,
-0.708169, -0.9734223, -2.893713, 1, 1, 1, 1, 1,
-0.6942483, -1.609206, -2.771129, 1, 1, 1, 1, 1,
-0.6884956, 1.051601, 0.07705969, 1, 1, 1, 1, 1,
-0.6861566, -0.2731327, -3.898682, 1, 1, 1, 1, 1,
-0.6840793, -1.131141, -0.8145624, 0, 0, 1, 1, 1,
-0.681403, -0.1309911, -1.12936, 1, 0, 0, 1, 1,
-0.6812723, 1.780962, -0.0003216278, 1, 0, 0, 1, 1,
-0.6770963, 0.6623949, -1.209071, 1, 0, 0, 1, 1,
-0.6693091, -0.9798526, -2.078138, 1, 0, 0, 1, 1,
-0.6659399, -0.5556833, -1.620273, 1, 0, 0, 1, 1,
-0.6653214, 0.5102521, 0.3946956, 0, 0, 0, 1, 1,
-0.6632324, -3.093713, -2.858391, 0, 0, 0, 1, 1,
-0.6625683, -0.1283857, -2.693501, 0, 0, 0, 1, 1,
-0.6605952, -0.05650985, -0.6167195, 0, 0, 0, 1, 1,
-0.6599843, -2.123688, -3.658032, 0, 0, 0, 1, 1,
-0.6598001, -0.2719998, -0.9749311, 0, 0, 0, 1, 1,
-0.6596276, -0.1552682, -1.308771, 0, 0, 0, 1, 1,
-0.6546675, 1.074539, 0.1681973, 1, 1, 1, 1, 1,
-0.6434268, -0.9915987, -2.527435, 1, 1, 1, 1, 1,
-0.6351565, -0.7266044, -1.361725, 1, 1, 1, 1, 1,
-0.6296777, 0.3196841, -1.432062, 1, 1, 1, 1, 1,
-0.6296526, 0.119405, -0.9217159, 1, 1, 1, 1, 1,
-0.6242706, -0.8507056, -2.265427, 1, 1, 1, 1, 1,
-0.6232291, 1.20887, -0.3033249, 1, 1, 1, 1, 1,
-0.6226664, -2.266695, -4.102637, 1, 1, 1, 1, 1,
-0.6210862, -0.2960385, -0.6178483, 1, 1, 1, 1, 1,
-0.6205802, 0.7980971, -2.537961, 1, 1, 1, 1, 1,
-0.6181735, 1.237064, -1.827458, 1, 1, 1, 1, 1,
-0.6131031, -0.131527, -2.50818, 1, 1, 1, 1, 1,
-0.6104832, 1.89871, -0.2707398, 1, 1, 1, 1, 1,
-0.6095977, 1.256266, -0.7453275, 1, 1, 1, 1, 1,
-0.6095678, -1.047549, -1.867734, 1, 1, 1, 1, 1,
-0.6081059, -1.223839, -2.951756, 0, 0, 1, 1, 1,
-0.6018597, -0.0917677, -2.347059, 1, 0, 0, 1, 1,
-0.6014945, -0.9245063, -3.406228, 1, 0, 0, 1, 1,
-0.599868, -0.6096084, -3.194925, 1, 0, 0, 1, 1,
-0.5971563, -0.2823105, -1.884086, 1, 0, 0, 1, 1,
-0.5934106, 0.04507622, -0.4004971, 1, 0, 0, 1, 1,
-0.5920874, -0.6282129, -2.490911, 0, 0, 0, 1, 1,
-0.5896907, -0.4660369, -2.203722, 0, 0, 0, 1, 1,
-0.5879248, -1.547765, -4.510011, 0, 0, 0, 1, 1,
-0.5834708, -0.5012651, -1.670835, 0, 0, 0, 1, 1,
-0.5826045, -1.71236, -2.334947, 0, 0, 0, 1, 1,
-0.5801162, 0.2578854, -1.45991, 0, 0, 0, 1, 1,
-0.5775084, -0.4229877, -1.579908, 0, 0, 0, 1, 1,
-0.5767852, -0.2211544, -1.855479, 1, 1, 1, 1, 1,
-0.5748617, -0.178094, -3.242509, 1, 1, 1, 1, 1,
-0.569723, 0.6182345, 0.4098237, 1, 1, 1, 1, 1,
-0.5686393, 1.135061, -1.218506, 1, 1, 1, 1, 1,
-0.5671253, -0.100622, -2.726702, 1, 1, 1, 1, 1,
-0.5601503, -1.727347, -1.967331, 1, 1, 1, 1, 1,
-0.55713, -1.075884, -1.700364, 1, 1, 1, 1, 1,
-0.5529535, -0.8444972, -2.480678, 1, 1, 1, 1, 1,
-0.552339, 0.9143885, -2.511887, 1, 1, 1, 1, 1,
-0.5517908, 0.6742483, 0.03623476, 1, 1, 1, 1, 1,
-0.5507522, 0.5371684, -1.109994, 1, 1, 1, 1, 1,
-0.5476556, 0.5767061, -1.769428, 1, 1, 1, 1, 1,
-0.5446429, -0.2027726, -1.166986, 1, 1, 1, 1, 1,
-0.5436602, 0.4811015, 1.661341, 1, 1, 1, 1, 1,
-0.5431961, 1.445266, 0.07224678, 1, 1, 1, 1, 1,
-0.5404202, 0.455679, 0.1944488, 0, 0, 1, 1, 1,
-0.5375571, -1.208606, -2.964191, 1, 0, 0, 1, 1,
-0.5288224, -1.596327, -1.658797, 1, 0, 0, 1, 1,
-0.5286031, -1.684535, -4.315789, 1, 0, 0, 1, 1,
-0.5279301, -0.5358887, -2.5681, 1, 0, 0, 1, 1,
-0.5277228, -0.05960581, -2.074385, 1, 0, 0, 1, 1,
-0.5207471, 0.810271, -0.9069188, 0, 0, 0, 1, 1,
-0.5176274, -2.199577, -2.526233, 0, 0, 0, 1, 1,
-0.5136979, 0.2123428, -0.6846948, 0, 0, 0, 1, 1,
-0.5014359, 1.4825, 0.08425245, 0, 0, 0, 1, 1,
-0.4918718, 0.1562459, -0.2523675, 0, 0, 0, 1, 1,
-0.4918028, 1.2017, -0.3677559, 0, 0, 0, 1, 1,
-0.489819, -0.0271113, -1.260821, 0, 0, 0, 1, 1,
-0.4896562, 1.25904, 0.7194965, 1, 1, 1, 1, 1,
-0.4887249, -1.580486, -2.917397, 1, 1, 1, 1, 1,
-0.4885279, 0.6755832, 1.487016, 1, 1, 1, 1, 1,
-0.4880762, -0.2748363, -3.31339, 1, 1, 1, 1, 1,
-0.4863181, -0.6627037, -1.745691, 1, 1, 1, 1, 1,
-0.48238, -0.7967564, -0.6219671, 1, 1, 1, 1, 1,
-0.4795588, -0.9481834, -0.625342, 1, 1, 1, 1, 1,
-0.4769162, -1.425032, -3.038652, 1, 1, 1, 1, 1,
-0.476194, -0.7105213, -3.201997, 1, 1, 1, 1, 1,
-0.4742064, -0.682751, -2.539645, 1, 1, 1, 1, 1,
-0.4715761, 1.272343, -0.9769251, 1, 1, 1, 1, 1,
-0.4665983, 0.7658654, 0.1039191, 1, 1, 1, 1, 1,
-0.4627117, 0.1764738, -2.806623, 1, 1, 1, 1, 1,
-0.4604194, 0.723556, -0.2573896, 1, 1, 1, 1, 1,
-0.4593369, 1.851658, 1.077547, 1, 1, 1, 1, 1,
-0.4568579, 0.1684699, 0.8209386, 0, 0, 1, 1, 1,
-0.4543802, 0.0473766, -1.292938, 1, 0, 0, 1, 1,
-0.4540531, 0.09323923, -1.409307, 1, 0, 0, 1, 1,
-0.4517511, 0.569719, -0.4108003, 1, 0, 0, 1, 1,
-0.443875, 0.2320308, -1.550789, 1, 0, 0, 1, 1,
-0.4429532, 0.6296465, -1.255208, 1, 0, 0, 1, 1,
-0.4426515, 0.08267578, -0.7809154, 0, 0, 0, 1, 1,
-0.4420059, 0.03017678, -3.26141, 0, 0, 0, 1, 1,
-0.440118, 0.4394692, -1.129807, 0, 0, 0, 1, 1,
-0.4387192, 0.5218559, -0.8349748, 0, 0, 0, 1, 1,
-0.4374511, 1.096754, 1.499306, 0, 0, 0, 1, 1,
-0.4352798, 0.5794757, -0.6927669, 0, 0, 0, 1, 1,
-0.4349451, 0.09573451, -3.686413, 0, 0, 0, 1, 1,
-0.4346116, 0.03052419, -0.4008222, 1, 1, 1, 1, 1,
-0.4345835, -0.9369016, -2.049137, 1, 1, 1, 1, 1,
-0.4339442, -0.1544936, -1.489066, 1, 1, 1, 1, 1,
-0.4322907, 0.5583645, -0.6848856, 1, 1, 1, 1, 1,
-0.4315536, 1.655128, -1.469928, 1, 1, 1, 1, 1,
-0.4296626, 0.1783329, -0.35843, 1, 1, 1, 1, 1,
-0.4278603, 0.3950039, 0.4441019, 1, 1, 1, 1, 1,
-0.4268798, 0.9330871, 0.1448069, 1, 1, 1, 1, 1,
-0.422614, -1.025022, -3.29204, 1, 1, 1, 1, 1,
-0.4178292, 0.3438363, -1.482765, 1, 1, 1, 1, 1,
-0.4167847, 0.8151639, -0.9380175, 1, 1, 1, 1, 1,
-0.4142321, -1.449838, -3.081261, 1, 1, 1, 1, 1,
-0.4126906, -0.9598951, -4.049922, 1, 1, 1, 1, 1,
-0.4109412, 0.5324537, -0.06323776, 1, 1, 1, 1, 1,
-0.4080174, 0.1016793, -3.210058, 1, 1, 1, 1, 1,
-0.4049352, -1.480271, -2.765844, 0, 0, 1, 1, 1,
-0.4034408, -0.6807657, -3.65726, 1, 0, 0, 1, 1,
-0.4009782, 0.5498185, -1.877132, 1, 0, 0, 1, 1,
-0.4003922, -1.15049, -2.119643, 1, 0, 0, 1, 1,
-0.3996857, -0.9932796, -1.777003, 1, 0, 0, 1, 1,
-0.3995388, 1.262895, 0.1859844, 1, 0, 0, 1, 1,
-0.3879461, -0.1554245, -4.568253, 0, 0, 0, 1, 1,
-0.3823316, 0.4579325, -0.2054578, 0, 0, 0, 1, 1,
-0.3815742, 0.6300818, 0.148374, 0, 0, 0, 1, 1,
-0.3780219, 0.0757867, -0.4030138, 0, 0, 0, 1, 1,
-0.3747234, -2.60579, -2.891679, 0, 0, 0, 1, 1,
-0.3728045, 0.2149904, 1.92377, 0, 0, 0, 1, 1,
-0.3716315, -1.836419, -2.650073, 0, 0, 0, 1, 1,
-0.368918, 0.8156403, -0.1934845, 1, 1, 1, 1, 1,
-0.3684413, 0.5055702, -0.4720129, 1, 1, 1, 1, 1,
-0.3620268, -0.475799, -1.904084, 1, 1, 1, 1, 1,
-0.3613745, 1.071722, -2.959897, 1, 1, 1, 1, 1,
-0.3573003, 1.971159, -0.7518206, 1, 1, 1, 1, 1,
-0.3544196, 1.316434, 0.3412939, 1, 1, 1, 1, 1,
-0.3464479, 0.826826, 1.389851, 1, 1, 1, 1, 1,
-0.3421629, -0.3766382, -2.254623, 1, 1, 1, 1, 1,
-0.3411451, -0.8497788, -3.294663, 1, 1, 1, 1, 1,
-0.3404137, 1.058385, -0.55477, 1, 1, 1, 1, 1,
-0.3395783, 1.021621, -0.1917599, 1, 1, 1, 1, 1,
-0.3373913, -0.399088, -2.919658, 1, 1, 1, 1, 1,
-0.3369989, -0.4583297, -3.136693, 1, 1, 1, 1, 1,
-0.3326713, 1.967257, 0.6330432, 1, 1, 1, 1, 1,
-0.3320667, 0.1148067, -0.465587, 1, 1, 1, 1, 1,
-0.330316, 1.072721, -0.9168928, 0, 0, 1, 1, 1,
-0.3273822, 1.009194, -1.023667, 1, 0, 0, 1, 1,
-0.3211072, -0.3155181, -0.7495508, 1, 0, 0, 1, 1,
-0.3195061, -0.9437564, -4.663386, 1, 0, 0, 1, 1,
-0.3189008, -1.063493, -4.577952, 1, 0, 0, 1, 1,
-0.31622, 0.8968241, 0.01022008, 1, 0, 0, 1, 1,
-0.3129583, 0.8756889, 0.02578837, 0, 0, 0, 1, 1,
-0.3106483, -1.051427, -3.987387, 0, 0, 0, 1, 1,
-0.3048338, 0.8875583, 0.1387239, 0, 0, 0, 1, 1,
-0.3039918, -1.428313, -4.211598, 0, 0, 0, 1, 1,
-0.3027317, -0.7573245, -2.207903, 0, 0, 0, 1, 1,
-0.3018818, 2.27132, 0.6516308, 0, 0, 0, 1, 1,
-0.2971168, -0.5159033, -3.117137, 0, 0, 0, 1, 1,
-0.2919505, -0.9464078, -3.078674, 1, 1, 1, 1, 1,
-0.2895169, 0.8092628, 0.02235636, 1, 1, 1, 1, 1,
-0.2894585, -2.09136, -2.591064, 1, 1, 1, 1, 1,
-0.2822521, 0.0008338336, -1.312212, 1, 1, 1, 1, 1,
-0.2796486, 0.7785406, -0.555461, 1, 1, 1, 1, 1,
-0.2777383, 1.437503, 0.9075667, 1, 1, 1, 1, 1,
-0.2695861, 0.1448151, 1.570751, 1, 1, 1, 1, 1,
-0.2678068, -0.09615469, -0.6811398, 1, 1, 1, 1, 1,
-0.2669762, -0.3449652, -0.6167746, 1, 1, 1, 1, 1,
-0.2665628, -0.2436252, -3.40262, 1, 1, 1, 1, 1,
-0.2660475, 0.5260096, -0.6442766, 1, 1, 1, 1, 1,
-0.265792, 0.515618, -0.2444214, 1, 1, 1, 1, 1,
-0.2655545, 0.5507892, 1.248835, 1, 1, 1, 1, 1,
-0.2632351, -0.6150543, -2.722472, 1, 1, 1, 1, 1,
-0.2627549, 0.8958113, 1.055488, 1, 1, 1, 1, 1,
-0.2613506, -0.8110425, -3.321607, 0, 0, 1, 1, 1,
-0.2598532, -0.2070317, -4.792927, 1, 0, 0, 1, 1,
-0.2566452, 0.9382103, -1.446475, 1, 0, 0, 1, 1,
-0.2564193, -0.6473746, -1.812782, 1, 0, 0, 1, 1,
-0.2494626, -0.8902759, -4.384738, 1, 0, 0, 1, 1,
-0.2428298, 0.2515453, -0.8789202, 1, 0, 0, 1, 1,
-0.2410957, -0.2711338, -3.955091, 0, 0, 0, 1, 1,
-0.2391554, -0.9130907, -1.649296, 0, 0, 0, 1, 1,
-0.2346426, -0.8619007, -2.124935, 0, 0, 0, 1, 1,
-0.2344625, 0.9908076, 0.6652961, 0, 0, 0, 1, 1,
-0.2290546, 0.1601407, -0.4048239, 0, 0, 0, 1, 1,
-0.2285331, 0.3672409, 0.3060021, 0, 0, 0, 1, 1,
-0.2256624, -0.4240013, -2.326799, 0, 0, 0, 1, 1,
-0.2226639, -0.5982507, -3.600495, 1, 1, 1, 1, 1,
-0.2224532, 1.231177, 0.5657129, 1, 1, 1, 1, 1,
-0.2144071, -0.8797264, -2.222536, 1, 1, 1, 1, 1,
-0.2109896, 2.140348, 0.1899643, 1, 1, 1, 1, 1,
-0.2059267, 1.563362, 0.8166651, 1, 1, 1, 1, 1,
-0.2040094, 0.2406292, -0.976798, 1, 1, 1, 1, 1,
-0.2027017, 0.8850042, -1.149803, 1, 1, 1, 1, 1,
-0.2014201, 0.1744041, -0.9997544, 1, 1, 1, 1, 1,
-0.2013461, 0.2650962, -1.095618, 1, 1, 1, 1, 1,
-0.199236, 1.711053, -0.1377913, 1, 1, 1, 1, 1,
-0.1959829, -1.218039, -3.269246, 1, 1, 1, 1, 1,
-0.193345, -0.6251304, -0.8070277, 1, 1, 1, 1, 1,
-0.1845462, 0.9705292, -2.204366, 1, 1, 1, 1, 1,
-0.1837151, 0.1478038, -1.540717, 1, 1, 1, 1, 1,
-0.1774961, -0.28068, -2.409142, 1, 1, 1, 1, 1,
-0.176608, -0.5740857, -0.7848531, 0, 0, 1, 1, 1,
-0.1744556, 1.200815, -0.6720907, 1, 0, 0, 1, 1,
-0.1729406, -1.135782, -1.804872, 1, 0, 0, 1, 1,
-0.1697471, -0.5343915, -4.959719, 1, 0, 0, 1, 1,
-0.165635, 1.384061, 0.5127257, 1, 0, 0, 1, 1,
-0.1614828, 0.3960682, -2.42763, 1, 0, 0, 1, 1,
-0.1614291, 0.3285156, 0.1005416, 0, 0, 0, 1, 1,
-0.1597549, -0.1678715, -5.216166, 0, 0, 0, 1, 1,
-0.1576723, 1.958426, -0.4539399, 0, 0, 0, 1, 1,
-0.1550698, 0.119761, -0.06597158, 0, 0, 0, 1, 1,
-0.1526721, -0.5848007, -2.648222, 0, 0, 0, 1, 1,
-0.1520879, 0.4184657, -1.867866, 0, 0, 0, 1, 1,
-0.1519269, -1.612512, -3.358853, 0, 0, 0, 1, 1,
-0.148223, -0.3700719, -3.088523, 1, 1, 1, 1, 1,
-0.1474588, -1.365199, -5.180127, 1, 1, 1, 1, 1,
-0.1471909, -0.3755555, -3.924678, 1, 1, 1, 1, 1,
-0.1437322, 0.5939363, -1.085368, 1, 1, 1, 1, 1,
-0.1413568, 0.04698821, -1.299877, 1, 1, 1, 1, 1,
-0.1398069, 1.092983, -0.03014673, 1, 1, 1, 1, 1,
-0.1359603, 1.165797, -0.7284784, 1, 1, 1, 1, 1,
-0.1339359, -0.1593412, -1.549359, 1, 1, 1, 1, 1,
-0.1331496, -0.2830015, -1.440906, 1, 1, 1, 1, 1,
-0.1325816, -0.8834315, -3.590347, 1, 1, 1, 1, 1,
-0.1220388, -1.941666, -2.118858, 1, 1, 1, 1, 1,
-0.1194622, 0.329257, -0.6253449, 1, 1, 1, 1, 1,
-0.112869, -1.161204, -3.047039, 1, 1, 1, 1, 1,
-0.1086795, -1.277115, -3.144116, 1, 1, 1, 1, 1,
-0.1074262, 0.1859794, -1.233348, 1, 1, 1, 1, 1,
-0.1050241, 0.1140941, -0.9454151, 0, 0, 1, 1, 1,
-0.1025006, -1.331097, -2.421854, 1, 0, 0, 1, 1,
-0.07964478, -1.247521, -1.631034, 1, 0, 0, 1, 1,
-0.07531995, -1.235899, -3.550558, 1, 0, 0, 1, 1,
-0.07521259, -0.046147, -2.116921, 1, 0, 0, 1, 1,
-0.06920482, -3.133971, -2.455518, 1, 0, 0, 1, 1,
-0.06914463, -2.226314, -3.316753, 0, 0, 0, 1, 1,
-0.06485026, -0.9261329, -3.343737, 0, 0, 0, 1, 1,
-0.04568109, 0.644089, -2.251145, 0, 0, 0, 1, 1,
-0.04305796, 0.282489, 2.1839, 0, 0, 0, 1, 1,
-0.04294307, -1.59484, -2.939573, 0, 0, 0, 1, 1,
-0.04194827, 0.04059657, 0.1815325, 0, 0, 0, 1, 1,
-0.04043274, -0.5680209, -2.084001, 0, 0, 0, 1, 1,
-0.03680619, -0.05084367, -2.84697, 1, 1, 1, 1, 1,
-0.0320552, 0.3330176, -0.09272004, 1, 1, 1, 1, 1,
-0.02915122, -0.2101793, -3.048946, 1, 1, 1, 1, 1,
-0.02645892, 0.3692554, 0.5542583, 1, 1, 1, 1, 1,
-0.02557871, 1.176947, 1.411402, 1, 1, 1, 1, 1,
-0.02353686, 1.256246, 0.3943377, 1, 1, 1, 1, 1,
-0.01632348, 0.1707631, -0.2330994, 1, 1, 1, 1, 1,
-0.01536197, 0.08155049, 1.566891, 1, 1, 1, 1, 1,
-0.01370458, -1.196689, -1.715721, 1, 1, 1, 1, 1,
-0.01298808, -1.248947, -2.271403, 1, 1, 1, 1, 1,
-0.006501508, 0.9754461, -0.5620003, 1, 1, 1, 1, 1,
-0.005743099, 0.516102, 0.03262652, 1, 1, 1, 1, 1,
-0.004044749, -0.1548813, -3.184264, 1, 1, 1, 1, 1,
-0.00120522, 0.7389963, 0.7280575, 1, 1, 1, 1, 1,
0.0001356595, 0.2108533, 0.4446679, 1, 1, 1, 1, 1,
0.001713015, 1.3067, -0.05365548, 0, 0, 1, 1, 1,
0.003665891, 0.6109354, 1.901504, 1, 0, 0, 1, 1,
0.005807241, 0.5012762, -0.08466101, 1, 0, 0, 1, 1,
0.005926326, 1.180332, -0.1288075, 1, 0, 0, 1, 1,
0.006227688, 0.980426, 1.268676, 1, 0, 0, 1, 1,
0.007947356, -2.459201, 4.580645, 1, 0, 0, 1, 1,
0.008302448, 0.718073, 0.302556, 0, 0, 0, 1, 1,
0.009975409, 1.134871, 1.752651, 0, 0, 0, 1, 1,
0.01075479, 0.03584388, 1.483489, 0, 0, 0, 1, 1,
0.01223552, -1.566581, 3.590392, 0, 0, 0, 1, 1,
0.01264995, -1.260424, 3.62587, 0, 0, 0, 1, 1,
0.01450307, -1.462985, 3.500932, 0, 0, 0, 1, 1,
0.0153051, 0.2237603, -0.9881058, 0, 0, 0, 1, 1,
0.01655865, 0.02360311, 0.8306573, 1, 1, 1, 1, 1,
0.01661181, 0.08118722, -0.124584, 1, 1, 1, 1, 1,
0.01733874, 1.022754, 2.062673, 1, 1, 1, 1, 1,
0.01737968, -0.1231326, 3.369605, 1, 1, 1, 1, 1,
0.02060315, 2.778073, 1.091055, 1, 1, 1, 1, 1,
0.02131375, -0.6466897, 2.640718, 1, 1, 1, 1, 1,
0.02191408, 1.830211, -0.2880343, 1, 1, 1, 1, 1,
0.02301615, -0.48713, 2.72242, 1, 1, 1, 1, 1,
0.02407648, 0.8737911, 1.997169, 1, 1, 1, 1, 1,
0.02580013, -0.9672747, 2.903364, 1, 1, 1, 1, 1,
0.02857546, -0.7313551, 2.076612, 1, 1, 1, 1, 1,
0.03172461, -0.713201, 1.686368, 1, 1, 1, 1, 1,
0.03353581, -0.2718319, 3.172948, 1, 1, 1, 1, 1,
0.04005209, -0.4337293, 3.507756, 1, 1, 1, 1, 1,
0.04100261, -1.479749, 2.707884, 1, 1, 1, 1, 1,
0.04601444, 0.008918705, -0.1042695, 0, 0, 1, 1, 1,
0.04889564, 1.501331, 0.2564913, 1, 0, 0, 1, 1,
0.05009031, 0.1950437, -0.94414, 1, 0, 0, 1, 1,
0.05536756, 0.1230576, 0.4059526, 1, 0, 0, 1, 1,
0.0564079, -0.1801732, 2.801706, 1, 0, 0, 1, 1,
0.0605128, -2.844092, 3.006142, 1, 0, 0, 1, 1,
0.06085631, 0.2552934, -0.2506997, 0, 0, 0, 1, 1,
0.06287247, 1.111527, 0.7389517, 0, 0, 0, 1, 1,
0.0699132, 0.994483, -0.5111635, 0, 0, 0, 1, 1,
0.07114167, 0.5662604, 0.5850322, 0, 0, 0, 1, 1,
0.071504, -0.8224716, 2.406291, 0, 0, 0, 1, 1,
0.07494265, -0.161353, 3.05182, 0, 0, 0, 1, 1,
0.07513171, 2.839328, 0.02374648, 0, 0, 0, 1, 1,
0.07796329, 0.3282028, 2.038229, 1, 1, 1, 1, 1,
0.07914194, -1.020463, 3.301738, 1, 1, 1, 1, 1,
0.08073684, -0.02740043, 0.5187011, 1, 1, 1, 1, 1,
0.0816414, 0.1214856, 1.59508, 1, 1, 1, 1, 1,
0.08213519, -1.045322, 3.822807, 1, 1, 1, 1, 1,
0.08425038, 0.3598389, -0.9883719, 1, 1, 1, 1, 1,
0.08751193, 0.372539, 2.340084, 1, 1, 1, 1, 1,
0.08826483, 0.2797997, -0.9111784, 1, 1, 1, 1, 1,
0.09058241, -0.08382804, 2.394877, 1, 1, 1, 1, 1,
0.09229689, 0.9324964, -0.8040274, 1, 1, 1, 1, 1,
0.09433064, 0.2876214, -0.5910597, 1, 1, 1, 1, 1,
0.09483094, 0.02257972, 0.9584609, 1, 1, 1, 1, 1,
0.09579369, 1.77172, 0.9890136, 1, 1, 1, 1, 1,
0.09592187, 0.9268427, 0.2794239, 1, 1, 1, 1, 1,
0.09852643, 1.284264, -0.2679993, 1, 1, 1, 1, 1,
0.1011539, -0.4978131, 3.863952, 0, 0, 1, 1, 1,
0.1017984, 0.1553935, -0.911558, 1, 0, 0, 1, 1,
0.1024206, 0.5367306, -0.2373391, 1, 0, 0, 1, 1,
0.1032145, 0.2170332, 0.7731854, 1, 0, 0, 1, 1,
0.1099886, -0.6579877, 4.054149, 1, 0, 0, 1, 1,
0.1100352, -1.199137, 2.194616, 1, 0, 0, 1, 1,
0.111755, -0.1544094, 3.854358, 0, 0, 0, 1, 1,
0.1125234, -1.322765, 3.097767, 0, 0, 0, 1, 1,
0.1192383, -0.5228519, 2.782593, 0, 0, 0, 1, 1,
0.1204247, -0.07811561, 0.2394232, 0, 0, 0, 1, 1,
0.1241445, -0.04752452, 1.56524, 0, 0, 0, 1, 1,
0.1260994, 0.3579451, 0.3341357, 0, 0, 0, 1, 1,
0.1344892, -0.5561551, 2.573012, 0, 0, 0, 1, 1,
0.1352493, 0.2473138, 0.8818172, 1, 1, 1, 1, 1,
0.1398724, 0.704883, 0.2193321, 1, 1, 1, 1, 1,
0.1453792, -2.466448, 2.475281, 1, 1, 1, 1, 1,
0.1477217, 2.274048, -1.100492, 1, 1, 1, 1, 1,
0.1479221, -1.610231, 1.982902, 1, 1, 1, 1, 1,
0.1515018, 0.4355455, -0.3889075, 1, 1, 1, 1, 1,
0.1535779, -0.8104455, 2.152517, 1, 1, 1, 1, 1,
0.1544923, 0.6952825, 0.8226304, 1, 1, 1, 1, 1,
0.1573277, 1.749574, -0.2711224, 1, 1, 1, 1, 1,
0.1574365, -1.323213, 2.184732, 1, 1, 1, 1, 1,
0.1674236, 0.9423618, -0.4725421, 1, 1, 1, 1, 1,
0.1677545, 0.2109288, 3.137779, 1, 1, 1, 1, 1,
0.1703243, -0.7355268, 1.770437, 1, 1, 1, 1, 1,
0.1730875, 0.05740536, -0.8776327, 1, 1, 1, 1, 1,
0.1732924, 1.589861, 1.225364, 1, 1, 1, 1, 1,
0.1795652, 0.07234424, 2.209484, 0, 0, 1, 1, 1,
0.1844149, 1.8645, -0.2749666, 1, 0, 0, 1, 1,
0.1861724, -1.118157, 3.874346, 1, 0, 0, 1, 1,
0.1999429, 1.330729, -0.3785474, 1, 0, 0, 1, 1,
0.2003266, 0.5327191, -0.4450095, 1, 0, 0, 1, 1,
0.2039175, -0.1126115, 3.064404, 1, 0, 0, 1, 1,
0.2053452, 0.03237307, 3.246667, 0, 0, 0, 1, 1,
0.206969, -0.8913113, 2.394203, 0, 0, 0, 1, 1,
0.2075106, 0.5722066, 1.585407, 0, 0, 0, 1, 1,
0.2096136, 1.588247, 0.4832889, 0, 0, 0, 1, 1,
0.2122343, -0.05714885, 3.711364, 0, 0, 0, 1, 1,
0.2136128, 0.05643631, 2.841866, 0, 0, 0, 1, 1,
0.2138119, -0.3212097, 2.055198, 0, 0, 0, 1, 1,
0.2138423, 1.149774, 1.289848, 1, 1, 1, 1, 1,
0.214695, -0.3215356, 1.981231, 1, 1, 1, 1, 1,
0.2197493, 1.187327, 1.172806, 1, 1, 1, 1, 1,
0.222804, 0.04720521, 0.6890043, 1, 1, 1, 1, 1,
0.2266999, -0.8571405, 1.773463, 1, 1, 1, 1, 1,
0.2326143, -0.3051576, 2.70522, 1, 1, 1, 1, 1,
0.2385335, -0.03122976, 1.849477, 1, 1, 1, 1, 1,
0.2469058, 0.3361287, -0.5323162, 1, 1, 1, 1, 1,
0.2484297, 2.548859, 2.395476, 1, 1, 1, 1, 1,
0.2489648, -1.738885, 4.275811, 1, 1, 1, 1, 1,
0.2515243, -0.8787412, 3.47926, 1, 1, 1, 1, 1,
0.2555695, -0.1186813, 1.116509, 1, 1, 1, 1, 1,
0.2587595, 0.6169984, 0.5059012, 1, 1, 1, 1, 1,
0.2589145, 1.354667, 1.010501, 1, 1, 1, 1, 1,
0.2623728, -0.4822471, 2.885172, 1, 1, 1, 1, 1,
0.2660545, -0.5748103, 2.213129, 0, 0, 1, 1, 1,
0.2683704, -0.6447907, 1.86937, 1, 0, 0, 1, 1,
0.2703786, -1.35967, 2.201827, 1, 0, 0, 1, 1,
0.2739385, -0.3483427, 3.1702, 1, 0, 0, 1, 1,
0.2788247, -1.154861, 1.432649, 1, 0, 0, 1, 1,
0.2813455, 0.8619982, 1.043256, 1, 0, 0, 1, 1,
0.2885833, -0.0834648, 0.6904536, 0, 0, 0, 1, 1,
0.2886863, -0.8336853, 2.960645, 0, 0, 0, 1, 1,
0.289303, -0.06494466, 2.626349, 0, 0, 0, 1, 1,
0.2908691, -0.1979664, 1.823388, 0, 0, 0, 1, 1,
0.2944479, 1.552767, -2.576022, 0, 0, 0, 1, 1,
0.2964207, -0.9386058, 1.853659, 0, 0, 0, 1, 1,
0.3008387, 1.602915, 1.588086, 0, 0, 0, 1, 1,
0.3132836, 0.3332396, 0.003345647, 1, 1, 1, 1, 1,
0.3152252, 1.57453, -0.06456018, 1, 1, 1, 1, 1,
0.3166337, 1.258545, -0.9178136, 1, 1, 1, 1, 1,
0.3170563, -1.561881, 3.789783, 1, 1, 1, 1, 1,
0.3178256, 0.8919248, 1.987844, 1, 1, 1, 1, 1,
0.3188468, -0.3720487, 0.39137, 1, 1, 1, 1, 1,
0.3206877, 0.493221, 1.442653, 1, 1, 1, 1, 1,
0.3210501, 1.029565, -0.6853709, 1, 1, 1, 1, 1,
0.3235596, 0.4029273, 3.212949, 1, 1, 1, 1, 1,
0.3256641, 0.5327476, -0.06630412, 1, 1, 1, 1, 1,
0.3315038, 0.2227282, 1.614009, 1, 1, 1, 1, 1,
0.3351299, -1.617309, 2.736691, 1, 1, 1, 1, 1,
0.3353191, 2.72479, 0.4101966, 1, 1, 1, 1, 1,
0.3382942, 0.8262064, 0.1401167, 1, 1, 1, 1, 1,
0.3412271, 0.7200668, 2.404184, 1, 1, 1, 1, 1,
0.3422671, 0.9991191, -0.7653895, 0, 0, 1, 1, 1,
0.3422847, -1.332084, 2.992082, 1, 0, 0, 1, 1,
0.3432848, 0.512084, 1.590225, 1, 0, 0, 1, 1,
0.3439865, -0.9318122, 1.603913, 1, 0, 0, 1, 1,
0.3468652, 0.7430903, -0.4444632, 1, 0, 0, 1, 1,
0.3483219, 0.6744044, 0.290045, 1, 0, 0, 1, 1,
0.3568408, -0.6364644, 3.543309, 0, 0, 0, 1, 1,
0.3697098, -0.5221425, 2.638483, 0, 0, 0, 1, 1,
0.3708823, 1.259286, -0.1388499, 0, 0, 0, 1, 1,
0.375196, 0.9288018, -0.8683698, 0, 0, 0, 1, 1,
0.3773719, 0.07961063, 2.350708, 0, 0, 0, 1, 1,
0.378864, -1.428697, 4.254137, 0, 0, 0, 1, 1,
0.3828935, -0.7369186, 2.032186, 0, 0, 0, 1, 1,
0.3841352, 0.2575746, 0.4576588, 1, 1, 1, 1, 1,
0.3927945, 0.1945333, 2.252692, 1, 1, 1, 1, 1,
0.3989848, -0.1851659, 1.426185, 1, 1, 1, 1, 1,
0.4008104, 1.723707, -0.5580838, 1, 1, 1, 1, 1,
0.402893, -0.2316067, 1.190237, 1, 1, 1, 1, 1,
0.4057632, -1.841045, 3.156976, 1, 1, 1, 1, 1,
0.4107898, 0.2605496, 1.123937, 1, 1, 1, 1, 1,
0.4144756, 0.09781187, 0.8216079, 1, 1, 1, 1, 1,
0.4224345, 0.9720301, -0.3922644, 1, 1, 1, 1, 1,
0.422626, 0.6070373, 0.8418074, 1, 1, 1, 1, 1,
0.4268069, 0.4455198, 0.7101316, 1, 1, 1, 1, 1,
0.4280489, 1.059604, 2.193514, 1, 1, 1, 1, 1,
0.4284336, -0.2347692, 2.064054, 1, 1, 1, 1, 1,
0.4290053, 0.7244009, 1.112392, 1, 1, 1, 1, 1,
0.4298482, 0.1037676, 2.432549, 1, 1, 1, 1, 1,
0.432085, -1.202982, 2.542588, 0, 0, 1, 1, 1,
0.4336456, -0.2903251, 0.997032, 1, 0, 0, 1, 1,
0.433711, -1.409003, 0.8659294, 1, 0, 0, 1, 1,
0.4363431, -1.660592, 3.659918, 1, 0, 0, 1, 1,
0.4376888, -0.5193436, 1.71032, 1, 0, 0, 1, 1,
0.4395994, 2.035396, -0.2208175, 1, 0, 0, 1, 1,
0.4486174, -0.09690488, 2.008968, 0, 0, 0, 1, 1,
0.4489924, 0.3708624, 3.203036, 0, 0, 0, 1, 1,
0.4517597, 1.868651, 0.004334456, 0, 0, 0, 1, 1,
0.4529794, -0.4827197, 3.038074, 0, 0, 0, 1, 1,
0.4549401, 0.3578745, 2.339225, 0, 0, 0, 1, 1,
0.4575175, 0.01515559, 2.672057, 0, 0, 0, 1, 1,
0.4599465, 0.4989204, 0.4802811, 0, 0, 0, 1, 1,
0.465466, -0.8623148, 3.115119, 1, 1, 1, 1, 1,
0.4692398, -0.7591195, 0.8361531, 1, 1, 1, 1, 1,
0.4767326, 1.596566, 0.0735799, 1, 1, 1, 1, 1,
0.4783121, 0.121757, 1.674738, 1, 1, 1, 1, 1,
0.4888887, 1.31367, -2.370397, 1, 1, 1, 1, 1,
0.4909601, 0.2418499, 1.664807, 1, 1, 1, 1, 1,
0.4920468, 1.24106, -0.4528932, 1, 1, 1, 1, 1,
0.4921328, -0.04142936, 3.164611, 1, 1, 1, 1, 1,
0.4924268, -0.08418997, 2.14638, 1, 1, 1, 1, 1,
0.5013696, -0.4736544, 3.615879, 1, 1, 1, 1, 1,
0.5027141, -0.384814, 0.867171, 1, 1, 1, 1, 1,
0.5027217, -1.15615, 3.607193, 1, 1, 1, 1, 1,
0.5072225, -0.8130117, 2.630075, 1, 1, 1, 1, 1,
0.5086379, -1.330125, 2.648023, 1, 1, 1, 1, 1,
0.5106438, -0.2082557, 3.821524, 1, 1, 1, 1, 1,
0.5149412, -1.050032, 3.159485, 0, 0, 1, 1, 1,
0.5188656, 0.1968019, 0.143763, 1, 0, 0, 1, 1,
0.5215969, 0.4943838, 2.313354, 1, 0, 0, 1, 1,
0.5225605, -1.341613, 1.771767, 1, 0, 0, 1, 1,
0.5252649, -0.5200408, 1.340617, 1, 0, 0, 1, 1,
0.5254172, -0.7395523, 2.263359, 1, 0, 0, 1, 1,
0.5277824, -0.09839702, 3.111099, 0, 0, 0, 1, 1,
0.532737, 1.095821, 0.6781969, 0, 0, 0, 1, 1,
0.5377454, 0.1571659, 1.859206, 0, 0, 0, 1, 1,
0.540756, 0.2284631, -0.3148272, 0, 0, 0, 1, 1,
0.5477732, -0.3005098, 1.07652, 0, 0, 0, 1, 1,
0.553196, 0.925594, 0.6661566, 0, 0, 0, 1, 1,
0.5533627, 0.4060088, 1.408735, 0, 0, 0, 1, 1,
0.554377, 0.729108, -0.5689737, 1, 1, 1, 1, 1,
0.5557141, 0.1194516, 2.769554, 1, 1, 1, 1, 1,
0.5574125, -0.1033343, 0.7858428, 1, 1, 1, 1, 1,
0.5652654, -1.222102, 3.224966, 1, 1, 1, 1, 1,
0.5704358, 0.3404881, 1.031295, 1, 1, 1, 1, 1,
0.5749941, -0.3402994, 3.982785, 1, 1, 1, 1, 1,
0.5750077, 0.1183991, 1.456903, 1, 1, 1, 1, 1,
0.5796691, -0.1338338, 2.600328, 1, 1, 1, 1, 1,
0.5810281, 1.268642, 0.4862183, 1, 1, 1, 1, 1,
0.5823289, -0.7683918, 4.141292, 1, 1, 1, 1, 1,
0.5907328, -0.2499301, -0.09488674, 1, 1, 1, 1, 1,
0.5936549, -0.2494768, 1.358663, 1, 1, 1, 1, 1,
0.5969969, 0.803481, -0.3857483, 1, 1, 1, 1, 1,
0.5982253, 3.202028, 0.7505228, 1, 1, 1, 1, 1,
0.5986883, -0.1063346, 2.666642, 1, 1, 1, 1, 1,
0.5993572, -0.9277862, 1.623792, 0, 0, 1, 1, 1,
0.6010894, 1.69774, 0.8533408, 1, 0, 0, 1, 1,
0.6013142, -0.610084, 2.030811, 1, 0, 0, 1, 1,
0.6099001, 1.191338, -0.7969562, 1, 0, 0, 1, 1,
0.6102318, 0.7674928, 0.5090118, 1, 0, 0, 1, 1,
0.6109157, 1.187556, -2.146685, 1, 0, 0, 1, 1,
0.6121014, -0.7427575, 2.620654, 0, 0, 0, 1, 1,
0.6127924, 0.7738867, 0.9553888, 0, 0, 0, 1, 1,
0.6146972, -1.446432, 0.9555742, 0, 0, 0, 1, 1,
0.6203774, 0.4326268, 1.935468, 0, 0, 0, 1, 1,
0.6210146, -0.6287292, 1.485822, 0, 0, 0, 1, 1,
0.6225163, 1.251587, 0.4643739, 0, 0, 0, 1, 1,
0.6243551, 0.8145339, 1.331847, 0, 0, 0, 1, 1,
0.6259046, 0.890331, 0.5012834, 1, 1, 1, 1, 1,
0.6331275, 0.6790884, -0.4634602, 1, 1, 1, 1, 1,
0.6359847, 0.06353923, 1.98782, 1, 1, 1, 1, 1,
0.6389632, -0.6473014, 1.357357, 1, 1, 1, 1, 1,
0.6399663, -0.2329581, 1.951889, 1, 1, 1, 1, 1,
0.6428597, -0.4983921, 4.160172, 1, 1, 1, 1, 1,
0.6428982, -0.07800604, 1.19087, 1, 1, 1, 1, 1,
0.6490021, 0.6891116, 1.524425, 1, 1, 1, 1, 1,
0.649965, -1.31029, 4.001303, 1, 1, 1, 1, 1,
0.6502894, 1.317122, -0.8361586, 1, 1, 1, 1, 1,
0.652714, 0.9878934, 3.005987, 1, 1, 1, 1, 1,
0.6527604, -0.5790786, 2.319144, 1, 1, 1, 1, 1,
0.6535877, -1.545104, -0.6908555, 1, 1, 1, 1, 1,
0.6601985, -1.558709, 4.753415, 1, 1, 1, 1, 1,
0.6624904, 0.4853546, 0.4444662, 1, 1, 1, 1, 1,
0.6628925, 1.144264, 2.514193, 0, 0, 1, 1, 1,
0.6649384, 1.331209, 1.341174, 1, 0, 0, 1, 1,
0.6656911, -0.3396914, 0.4606465, 1, 0, 0, 1, 1,
0.6665267, -0.1251674, 1.211644, 1, 0, 0, 1, 1,
0.6705472, -2.593734, 3.533115, 1, 0, 0, 1, 1,
0.6767156, 1.393602, 0.2561979, 1, 0, 0, 1, 1,
0.6769405, -0.3094852, 0.6100599, 0, 0, 0, 1, 1,
0.6784068, -0.5297551, 1.909435, 0, 0, 0, 1, 1,
0.6857742, 0.7494293, 1.802475, 0, 0, 0, 1, 1,
0.6877854, -0.8658369, 3.586605, 0, 0, 0, 1, 1,
0.6948307, -0.2264951, 0.6120661, 0, 0, 0, 1, 1,
0.6982492, 0.1961846, 0.9361579, 0, 0, 0, 1, 1,
0.7002032, -1.180728, 3.180171, 0, 0, 0, 1, 1,
0.7019584, 0.0908714, 1.604146, 1, 1, 1, 1, 1,
0.7095571, -0.4299235, 2.029223, 1, 1, 1, 1, 1,
0.7132869, 2.197186, -0.004510195, 1, 1, 1, 1, 1,
0.7193441, -0.2635418, 1.848507, 1, 1, 1, 1, 1,
0.7195442, -0.6118016, 2.195702, 1, 1, 1, 1, 1,
0.7276138, 0.3960904, 0.6917276, 1, 1, 1, 1, 1,
0.7287536, 0.5165578, 0.5269815, 1, 1, 1, 1, 1,
0.7293759, 0.8675898, 0.8853654, 1, 1, 1, 1, 1,
0.7363498, -0.197118, 2.635056, 1, 1, 1, 1, 1,
0.7404589, -0.6722497, 2.160163, 1, 1, 1, 1, 1,
0.7413133, -1.099265, 1.782961, 1, 1, 1, 1, 1,
0.7418095, 0.5362034, 1.410094, 1, 1, 1, 1, 1,
0.7425421, 0.4856032, 1.538369, 1, 1, 1, 1, 1,
0.7474757, -0.4476775, 1.197143, 1, 1, 1, 1, 1,
0.7519857, 0.08841864, 1.74986, 1, 1, 1, 1, 1,
0.7583693, -0.8807526, 3.446455, 0, 0, 1, 1, 1,
0.7611392, -0.183882, 3.29791, 1, 0, 0, 1, 1,
0.7669149, 0.6410249, 0.627579, 1, 0, 0, 1, 1,
0.768792, -0.2468268, 2.343042, 1, 0, 0, 1, 1,
0.7753034, 1.346562, -0.6426879, 1, 0, 0, 1, 1,
0.7775472, 0.1534037, 2.083549, 1, 0, 0, 1, 1,
0.7776666, -1.259793, 2.919117, 0, 0, 0, 1, 1,
0.7797297, 1.400143, 2.128208, 0, 0, 0, 1, 1,
0.7801658, -0.6282322, 1.883877, 0, 0, 0, 1, 1,
0.7856483, 0.7375731, 1.189594, 0, 0, 0, 1, 1,
0.7944993, 1.490937, 1.713748, 0, 0, 0, 1, 1,
0.7971396, 1.217734, 0.2788249, 0, 0, 0, 1, 1,
0.8008262, -0.7719043, 0.7377269, 0, 0, 0, 1, 1,
0.8010263, -0.8934844, 2.908756, 1, 1, 1, 1, 1,
0.8041676, -0.4508648, 2.508831, 1, 1, 1, 1, 1,
0.8075658, -0.5637496, 1.92384, 1, 1, 1, 1, 1,
0.8109863, 0.1496483, 0.2709753, 1, 1, 1, 1, 1,
0.815922, 1.171549, 0.6542292, 1, 1, 1, 1, 1,
0.8198075, -0.8322486, 0.7844415, 1, 1, 1, 1, 1,
0.8222902, -0.7596368, 2.108723, 1, 1, 1, 1, 1,
0.8223907, -0.6112348, 0.3921652, 1, 1, 1, 1, 1,
0.8235732, -0.1264851, 0.8646713, 1, 1, 1, 1, 1,
0.8248314, -0.007994805, 1.795967, 1, 1, 1, 1, 1,
0.8250549, -1.910555, 3.951927, 1, 1, 1, 1, 1,
0.835031, 0.5574773, 0.8427371, 1, 1, 1, 1, 1,
0.8429223, 0.4646807, 1.554802, 1, 1, 1, 1, 1,
0.8434479, -1.728393, 2.884311, 1, 1, 1, 1, 1,
0.8446749, 0.05724264, 0.8038985, 1, 1, 1, 1, 1,
0.8493633, -0.680662, 2.896349, 0, 0, 1, 1, 1,
0.8521587, -0.9542337, 2.03925, 1, 0, 0, 1, 1,
0.8598896, -2.624026, 1.135385, 1, 0, 0, 1, 1,
0.8668061, 0.001293144, 1.931085, 1, 0, 0, 1, 1,
0.8743457, 0.8116404, 0.8995769, 1, 0, 0, 1, 1,
0.874595, -0.414547, 2.394152, 1, 0, 0, 1, 1,
0.8801625, 1.023642, 0.6077676, 0, 0, 0, 1, 1,
0.885582, -0.7524245, 1.765871, 0, 0, 0, 1, 1,
0.8908327, -0.6826645, 1.763179, 0, 0, 0, 1, 1,
0.8929026, 1.252265, 0.5424854, 0, 0, 0, 1, 1,
0.893728, -0.4072743, 1.828768, 0, 0, 0, 1, 1,
0.8974246, 0.9381192, 0.3231217, 0, 0, 0, 1, 1,
0.897528, -0.4474017, 3.370557, 0, 0, 0, 1, 1,
0.8997672, 0.5551476, 1.112219, 1, 1, 1, 1, 1,
0.9007981, -0.4473611, 2.02945, 1, 1, 1, 1, 1,
0.9125702, -0.448844, 1.144708, 1, 1, 1, 1, 1,
0.9145068, 0.8178907, -0.04100046, 1, 1, 1, 1, 1,
0.915189, -0.8595107, 1.850203, 1, 1, 1, 1, 1,
0.9152762, 1.248833, 2.065153, 1, 1, 1, 1, 1,
0.9226792, 0.2020216, 0.01686044, 1, 1, 1, 1, 1,
0.9228855, 0.3939609, 0.5886724, 1, 1, 1, 1, 1,
0.9253546, -0.96794, 3.119235, 1, 1, 1, 1, 1,
0.9279361, -1.575019, 2.997871, 1, 1, 1, 1, 1,
0.9318306, 0.2207025, 0.9480715, 1, 1, 1, 1, 1,
0.9355764, 0.5416606, 1.733233, 1, 1, 1, 1, 1,
0.9367465, -0.9973689, 1.689046, 1, 1, 1, 1, 1,
0.9392797, 0.9628409, 0.8528645, 1, 1, 1, 1, 1,
0.9434334, -0.09358553, 0.5733689, 1, 1, 1, 1, 1,
0.9503064, 0.1087295, 0.9152361, 0, 0, 1, 1, 1,
0.9611624, 0.6262463, -0.5123987, 1, 0, 0, 1, 1,
0.964887, -0.6715835, 3.584566, 1, 0, 0, 1, 1,
0.9713644, 1.25591, -0.72532, 1, 0, 0, 1, 1,
0.9717398, -0.2056555, 1.959857, 1, 0, 0, 1, 1,
0.9737223, 0.2380032, 1.081629, 1, 0, 0, 1, 1,
0.9762178, -0.6802324, 3.435886, 0, 0, 0, 1, 1,
0.9768406, -0.4183553, 3.141672, 0, 0, 0, 1, 1,
0.9770021, -1.275676, 2.773039, 0, 0, 0, 1, 1,
0.9788943, -0.3435479, 2.434032, 0, 0, 0, 1, 1,
0.9814069, 0.1616247, 0.7192823, 0, 0, 0, 1, 1,
0.9815361, -0.4377618, 0.588349, 0, 0, 0, 1, 1,
0.9833578, 0.8663139, -0.7348193, 0, 0, 0, 1, 1,
0.9865316, -0.5170954, 2.272013, 1, 1, 1, 1, 1,
0.98993, -1.873492, 2.355304, 1, 1, 1, 1, 1,
0.9899949, -1.408402, 1.373128, 1, 1, 1, 1, 1,
0.9905727, -0.3273188, 2.229516, 1, 1, 1, 1, 1,
0.9981583, 0.9348938, 1.026573, 1, 1, 1, 1, 1,
1.001576, -1.692712, 4.344588, 1, 1, 1, 1, 1,
1.009558, 0.07185144, 1.584164, 1, 1, 1, 1, 1,
1.017827, 2.950158, 1.72977, 1, 1, 1, 1, 1,
1.022824, -1.194088, 3.101856, 1, 1, 1, 1, 1,
1.025313, 0.6391718, -0.01514814, 1, 1, 1, 1, 1,
1.027148, -1.040993, 1.700044, 1, 1, 1, 1, 1,
1.027831, 1.085756, 0.1930591, 1, 1, 1, 1, 1,
1.043975, -0.8847018, 3.191505, 1, 1, 1, 1, 1,
1.045218, -0.6659418, 1.603004, 1, 1, 1, 1, 1,
1.060212, -1.768833, 2.978122, 1, 1, 1, 1, 1,
1.061463, -0.7627341, 2.044421, 0, 0, 1, 1, 1,
1.065892, 0.1618577, 1.113442, 1, 0, 0, 1, 1,
1.068467, -0.8308093, 2.803358, 1, 0, 0, 1, 1,
1.076848, 0.5552808, 1.588797, 1, 0, 0, 1, 1,
1.079245, 0.08025669, 1.720061, 1, 0, 0, 1, 1,
1.083146, 0.7648197, 1.450707, 1, 0, 0, 1, 1,
1.093081, -2.05811, 1.888599, 0, 0, 0, 1, 1,
1.09628, -0.6151628, 2.476193, 0, 0, 0, 1, 1,
1.099304, -0.7763975, 2.667545, 0, 0, 0, 1, 1,
1.10779, -0.936685, 2.431376, 0, 0, 0, 1, 1,
1.109822, -1.017806, 3.121728, 0, 0, 0, 1, 1,
1.1151, 1.474591, 1.387032, 0, 0, 0, 1, 1,
1.116624, 0.7191229, 1.090774, 0, 0, 0, 1, 1,
1.119261, 0.2704041, 0.5012847, 1, 1, 1, 1, 1,
1.119439, -0.08747238, 1.373971, 1, 1, 1, 1, 1,
1.119614, 1.637614, 1.998734, 1, 1, 1, 1, 1,
1.126729, -0.282717, 0.9518586, 1, 1, 1, 1, 1,
1.132751, -0.1204066, 0.04671935, 1, 1, 1, 1, 1,
1.133674, -1.395824, 2.663461, 1, 1, 1, 1, 1,
1.135255, 0.1294268, 1.989731, 1, 1, 1, 1, 1,
1.144909, -0.2219317, 1.964796, 1, 1, 1, 1, 1,
1.151519, 0.9116597, 1.627714, 1, 1, 1, 1, 1,
1.15241, -0.2812716, 3.28433, 1, 1, 1, 1, 1,
1.154427, -1.705122, 2.922982, 1, 1, 1, 1, 1,
1.157179, 0.2747062, 0.4729933, 1, 1, 1, 1, 1,
1.163813, 0.3760411, 3.028377, 1, 1, 1, 1, 1,
1.163914, -1.300711, 1.832864, 1, 1, 1, 1, 1,
1.167182, 1.403076, 1.424434, 1, 1, 1, 1, 1,
1.170694, -0.223224, 3.067041, 0, 0, 1, 1, 1,
1.171489, 0.6640484, -0.02364729, 1, 0, 0, 1, 1,
1.179681, -0.4145533, 2.083725, 1, 0, 0, 1, 1,
1.183733, 1.693487, -0.4930489, 1, 0, 0, 1, 1,
1.193736, -1.058361, 2.727873, 1, 0, 0, 1, 1,
1.199188, 0.137465, 2.062648, 1, 0, 0, 1, 1,
1.201777, -1.068438, 2.410169, 0, 0, 0, 1, 1,
1.201817, -0.5009893, 1.476177, 0, 0, 0, 1, 1,
1.203287, 2.344765, 0.2276224, 0, 0, 0, 1, 1,
1.21357, 1.050722, 1.410814, 0, 0, 0, 1, 1,
1.222626, -1.04912, 2.829325, 0, 0, 0, 1, 1,
1.230113, -0.53456, 1.253288, 0, 0, 0, 1, 1,
1.232233, -1.083573, 2.788798, 0, 0, 0, 1, 1,
1.233779, 0.9432469, -0.1242785, 1, 1, 1, 1, 1,
1.238792, -1.960131, 2.626756, 1, 1, 1, 1, 1,
1.241612, -1.175607, 0.9598876, 1, 1, 1, 1, 1,
1.244236, 0.2240239, 1.569955, 1, 1, 1, 1, 1,
1.253508, 0.2149547, 1.406672, 1, 1, 1, 1, 1,
1.263599, -0.9387994, 2.012126, 1, 1, 1, 1, 1,
1.267691, -0.3351206, 1.070593, 1, 1, 1, 1, 1,
1.275802, 0.3654319, 1.792533, 1, 1, 1, 1, 1,
1.278272, -1.115889, 2.00425, 1, 1, 1, 1, 1,
1.278759, 1.305546, 0.4189218, 1, 1, 1, 1, 1,
1.287828, -1.516211, 2.911354, 1, 1, 1, 1, 1,
1.289889, 1.263756, -0.6288401, 1, 1, 1, 1, 1,
1.295476, 0.6510373, 0.605476, 1, 1, 1, 1, 1,
1.296095, 0.6722463, 1.188148, 1, 1, 1, 1, 1,
1.31053, -0.4291972, 1.521532, 1, 1, 1, 1, 1,
1.317423, -1.856146, 2.149053, 0, 0, 1, 1, 1,
1.317799, -1.1037, 0.6796644, 1, 0, 0, 1, 1,
1.321393, -1.792623, 3.471108, 1, 0, 0, 1, 1,
1.323777, 0.6484262, -0.7276969, 1, 0, 0, 1, 1,
1.324099, -1.172995, 3.06057, 1, 0, 0, 1, 1,
1.327381, 0.2425366, 2.454035, 1, 0, 0, 1, 1,
1.329754, -0.3301392, 2.481659, 0, 0, 0, 1, 1,
1.332798, -1.893426, 4.0472, 0, 0, 0, 1, 1,
1.343608, 0.9474429, -0.4304185, 0, 0, 0, 1, 1,
1.347051, 1.18375, 1.124254, 0, 0, 0, 1, 1,
1.348058, 0.4295664, -0.4283814, 0, 0, 0, 1, 1,
1.352082, -0.9945366, 1.940174, 0, 0, 0, 1, 1,
1.360442, -0.61022, 2.077071, 0, 0, 0, 1, 1,
1.370593, -0.1510192, 0.673661, 1, 1, 1, 1, 1,
1.3734, -0.5870488, 2.974443, 1, 1, 1, 1, 1,
1.382368, 0.1558703, 1.393102, 1, 1, 1, 1, 1,
1.386532, 1.267898, 1.94953, 1, 1, 1, 1, 1,
1.398666, 1.261013, 1.641338, 1, 1, 1, 1, 1,
1.408672, 0.1199638, 0.4831244, 1, 1, 1, 1, 1,
1.411063, 1.884878, 1.317942, 1, 1, 1, 1, 1,
1.446653, 0.7689333, 1.046581, 1, 1, 1, 1, 1,
1.469522, 1.124706, 1.872058, 1, 1, 1, 1, 1,
1.474621, 2.440345, 0.2449419, 1, 1, 1, 1, 1,
1.476329, -1.993275, 2.055379, 1, 1, 1, 1, 1,
1.480811, 1.158803, 0.2290904, 1, 1, 1, 1, 1,
1.488224, 1.999942, 2.144478, 1, 1, 1, 1, 1,
1.492316, 0.4392845, 1.516848, 1, 1, 1, 1, 1,
1.498629, -1.126369, 3.123138, 1, 1, 1, 1, 1,
1.499301, 1.829665, 2.469939, 0, 0, 1, 1, 1,
1.505841, 1.680455, -0.0807954, 1, 0, 0, 1, 1,
1.520699, -0.5881262, -0.2181675, 1, 0, 0, 1, 1,
1.525848, 1.291633, 1.037233, 1, 0, 0, 1, 1,
1.528686, 0.3473007, 2.26691, 1, 0, 0, 1, 1,
1.529053, 1.398484, 1.667633, 1, 0, 0, 1, 1,
1.530542, 0.9845036, 1.138326, 0, 0, 0, 1, 1,
1.545419, -0.01078982, 0.5230446, 0, 0, 0, 1, 1,
1.5476, 0.07914936, 1.037354, 0, 0, 0, 1, 1,
1.556519, 0.09633858, 1.049595, 0, 0, 0, 1, 1,
1.558217, -0.2985893, 3.667289, 0, 0, 0, 1, 1,
1.560335, 0.9778888, 0.9312877, 0, 0, 0, 1, 1,
1.564553, -0.2768912, 2.029326, 0, 0, 0, 1, 1,
1.577073, 2.478909, 0.5466064, 1, 1, 1, 1, 1,
1.579168, 1.433592, 0.2800386, 1, 1, 1, 1, 1,
1.580193, 0.356953, -0.3283333, 1, 1, 1, 1, 1,
1.582842, -0.1796972, 1.105125, 1, 1, 1, 1, 1,
1.592596, 0.7905599, 2.140253, 1, 1, 1, 1, 1,
1.605692, 0.06129851, -0.3586874, 1, 1, 1, 1, 1,
1.607336, -0.4051926, 1.749748, 1, 1, 1, 1, 1,
1.611622, 0.3663905, 0.8456862, 1, 1, 1, 1, 1,
1.629605, 0.9453562, 1.839872, 1, 1, 1, 1, 1,
1.662193, -0.9906896, 2.629445, 1, 1, 1, 1, 1,
1.665488, 1.784999, -0.8951567, 1, 1, 1, 1, 1,
1.665905, -0.1291079, 2.434404, 1, 1, 1, 1, 1,
1.680542, -0.1429813, 2.07667, 1, 1, 1, 1, 1,
1.686907, 0.6594832, 2.070785, 1, 1, 1, 1, 1,
1.708608, 0.3792444, 1.534685, 1, 1, 1, 1, 1,
1.719091, 0.9650156, 2.477967, 0, 0, 1, 1, 1,
1.726287, -0.1968877, 2.340512, 1, 0, 0, 1, 1,
1.728669, 0.3263841, 0.7846152, 1, 0, 0, 1, 1,
1.754979, -0.1831866, 1.516981, 1, 0, 0, 1, 1,
1.789704, -0.3103016, 2.131625, 1, 0, 0, 1, 1,
1.810204, -1.258355, 4.697531, 1, 0, 0, 1, 1,
1.842122, -0.2250161, 1.472619, 0, 0, 0, 1, 1,
1.848481, 0.9697384, 3.011576, 0, 0, 0, 1, 1,
1.850998, 1.438865, 1.566375, 0, 0, 0, 1, 1,
1.867319, -1.24811, 1.942035, 0, 0, 0, 1, 1,
1.889002, 0.5449024, 2.296654, 0, 0, 0, 1, 1,
1.906332, 0.4246336, 1.743832, 0, 0, 0, 1, 1,
1.91531, -1.381861, 2.189435, 0, 0, 0, 1, 1,
1.924422, -0.9233036, 2.083106, 1, 1, 1, 1, 1,
1.937628, 0.3994316, 0.2014967, 1, 1, 1, 1, 1,
1.93873, -0.3640693, 0.9516871, 1, 1, 1, 1, 1,
1.939198, -0.4863637, 1.927521, 1, 1, 1, 1, 1,
1.957384, 0.5015888, 1.368613, 1, 1, 1, 1, 1,
1.966748, -2.521818, 3.773845, 1, 1, 1, 1, 1,
2.038558, -0.3368872, 1.613962, 1, 1, 1, 1, 1,
2.048936, 0.3178142, 2.518827, 1, 1, 1, 1, 1,
2.077344, 0.2987047, 1.789278, 1, 1, 1, 1, 1,
2.095653, -0.1127641, -0.1292437, 1, 1, 1, 1, 1,
2.104255, -0.7756069, 1.192832, 1, 1, 1, 1, 1,
2.11089, -2.525985, 2.233201, 1, 1, 1, 1, 1,
2.11649, -1.379079, 2.303906, 1, 1, 1, 1, 1,
2.148863, 2.141237, 2.057123, 1, 1, 1, 1, 1,
2.158314, -1.077748, 2.04521, 1, 1, 1, 1, 1,
2.177598, 0.1512372, 0.7221349, 0, 0, 1, 1, 1,
2.19437, -0.1369855, 1.805087, 1, 0, 0, 1, 1,
2.257736, 0.5172668, 2.050563, 1, 0, 0, 1, 1,
2.271053, 0.4537703, 0.5743272, 1, 0, 0, 1, 1,
2.277747, 1.230797, 1.837311, 1, 0, 0, 1, 1,
2.294398, -0.5149371, 2.917731, 1, 0, 0, 1, 1,
2.323166, -0.1544698, 1.862786, 0, 0, 0, 1, 1,
2.333873, -0.5017128, 2.895215, 0, 0, 0, 1, 1,
2.41409, -0.7813361, 0.5597341, 0, 0, 0, 1, 1,
2.421093, -0.377009, 2.08353, 0, 0, 0, 1, 1,
2.446236, -0.09226376, 3.198504, 0, 0, 0, 1, 1,
2.485898, -1.628423, 3.145579, 0, 0, 0, 1, 1,
2.537925, 1.359924, 2.937362, 0, 0, 0, 1, 1,
2.599676, 1.399665, 0.6399532, 1, 1, 1, 1, 1,
2.686102, -0.907269, 3.431123, 1, 1, 1, 1, 1,
2.748902, 0.3381772, 1.541427, 1, 1, 1, 1, 1,
3.006692, 1.566744, -0.5415974, 1, 1, 1, 1, 1,
3.034616, -0.3619553, 2.400627, 1, 1, 1, 1, 1,
3.069335, 1.656082, 1.483703, 1, 1, 1, 1, 1,
3.080733, -0.4735591, 1.106435, 1, 1, 1, 1, 1
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
var radius = 9.143236;
var distance = 32.11523;
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
mvMatrix.translate( -0.09325981, -0.03402877, 0.2313755 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.11523);
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
