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
-3.496502, -1.467102, -1.836213, 1, 0, 0, 1,
-3.011334, -0.04960606, -1.576461, 1, 0.007843138, 0, 1,
-2.70388, -2.537602, -3.144635, 1, 0.01176471, 0, 1,
-2.662272, 0.7194597, -1.348658, 1, 0.01960784, 0, 1,
-2.573339, -0.2361619, -1.547246, 1, 0.02352941, 0, 1,
-2.517477, 0.00176622, -2.285313, 1, 0.03137255, 0, 1,
-2.477847, 1.606953, -0.6952421, 1, 0.03529412, 0, 1,
-2.395445, -0.1393992, -1.579213, 1, 0.04313726, 0, 1,
-2.39262, 0.5429336, 0.4650266, 1, 0.04705882, 0, 1,
-2.292818, -0.7681278, -3.508209, 1, 0.05490196, 0, 1,
-2.274908, 1.430181, -2.374645, 1, 0.05882353, 0, 1,
-2.243843, -0.9982699, -1.16749, 1, 0.06666667, 0, 1,
-2.224864, -0.2594879, -1.56103, 1, 0.07058824, 0, 1,
-2.194632, -0.03398779, -1.924769, 1, 0.07843138, 0, 1,
-2.11066, -0.05540375, -0.2970787, 1, 0.08235294, 0, 1,
-2.108271, -0.7029926, -2.005478, 1, 0.09019608, 0, 1,
-2.084714, 1.196645, -2.581235, 1, 0.09411765, 0, 1,
-2.070823, 0.1349654, -0.02276405, 1, 0.1019608, 0, 1,
-2.042234, 1.837884, -1.521314, 1, 0.1098039, 0, 1,
-2.039823, -0.8439955, -1.846842, 1, 0.1137255, 0, 1,
-2.03306, 1.605127, -0.4873993, 1, 0.1215686, 0, 1,
-2.02439, -1.136026, -2.356169, 1, 0.1254902, 0, 1,
-2.022631, -0.01421085, -0.2803975, 1, 0.1333333, 0, 1,
-2.014994, 1.094661, -2.348134, 1, 0.1372549, 0, 1,
-1.981736, 0.07769448, -1.268804, 1, 0.145098, 0, 1,
-1.970524, 0.2211483, -2.586351, 1, 0.1490196, 0, 1,
-1.943741, -2.742876, -3.625374, 1, 0.1568628, 0, 1,
-1.918215, -0.5051188, -3.386307, 1, 0.1607843, 0, 1,
-1.911542, 1.192485, 0.9049779, 1, 0.1686275, 0, 1,
-1.87592, -3.70944, -1.395241, 1, 0.172549, 0, 1,
-1.87372, -1.194254, -2.475452, 1, 0.1803922, 0, 1,
-1.854559, -0.7275411, -3.095967, 1, 0.1843137, 0, 1,
-1.846955, 0.9190546, -1.313025, 1, 0.1921569, 0, 1,
-1.845634, -0.5812127, -2.501347, 1, 0.1960784, 0, 1,
-1.838695, -0.2560862, -0.5785519, 1, 0.2039216, 0, 1,
-1.835386, 0.7522112, -1.397061, 1, 0.2117647, 0, 1,
-1.82447, 1.018945, -0.6844292, 1, 0.2156863, 0, 1,
-1.813558, 1.332508, 1.585131, 1, 0.2235294, 0, 1,
-1.813491, -0.2254968, -1.79826, 1, 0.227451, 0, 1,
-1.811421, 0.5896389, -2.568768, 1, 0.2352941, 0, 1,
-1.809185, -1.232469, -3.61252, 1, 0.2392157, 0, 1,
-1.769299, 1.094964, -0.6280512, 1, 0.2470588, 0, 1,
-1.762126, -0.1326283, -2.297744, 1, 0.2509804, 0, 1,
-1.758994, -0.9709742, -3.268213, 1, 0.2588235, 0, 1,
-1.758829, 0.7316361, -1.767519, 1, 0.2627451, 0, 1,
-1.753609, 0.2883334, -1.342792, 1, 0.2705882, 0, 1,
-1.750255, -1.185074, -4.306898, 1, 0.2745098, 0, 1,
-1.748165, -2.799852, -3.118451, 1, 0.282353, 0, 1,
-1.718802, -1.061096, -4.481312, 1, 0.2862745, 0, 1,
-1.678786, 0.115619, -1.479267, 1, 0.2941177, 0, 1,
-1.678208, 0.5514665, -1.553295, 1, 0.3019608, 0, 1,
-1.665572, -0.7155877, -1.441332, 1, 0.3058824, 0, 1,
-1.661121, -1.342558, -3.755055, 1, 0.3137255, 0, 1,
-1.659023, 0.07592057, 0.002366483, 1, 0.3176471, 0, 1,
-1.624227, 0.06138419, -3.019091, 1, 0.3254902, 0, 1,
-1.613585, 0.04423757, -2.494067, 1, 0.3294118, 0, 1,
-1.593554, 1.432824, -1.037565, 1, 0.3372549, 0, 1,
-1.568934, 2.811106, -0.2368244, 1, 0.3411765, 0, 1,
-1.556167, 0.9594278, -2.455401, 1, 0.3490196, 0, 1,
-1.553751, -3.223637, -1.104713, 1, 0.3529412, 0, 1,
-1.549098, 2.116277, -1.132834, 1, 0.3607843, 0, 1,
-1.547216, -1.069876, -4.285571, 1, 0.3647059, 0, 1,
-1.529703, -0.4270889, -2.527695, 1, 0.372549, 0, 1,
-1.5272, 0.7197679, -1.319444, 1, 0.3764706, 0, 1,
-1.52229, -0.2849666, -1.542381, 1, 0.3843137, 0, 1,
-1.518393, -0.5154019, -2.34709, 1, 0.3882353, 0, 1,
-1.493902, 0.9731401, -1.099052, 1, 0.3960784, 0, 1,
-1.479241, -0.5468923, -1.589903, 1, 0.4039216, 0, 1,
-1.469782, 0.4169089, -3.72247, 1, 0.4078431, 0, 1,
-1.467739, 0.5052074, -1.453268, 1, 0.4156863, 0, 1,
-1.462898, -0.002543799, -2.578798, 1, 0.4196078, 0, 1,
-1.45988, 0.3808141, 0.1311664, 1, 0.427451, 0, 1,
-1.458617, 2.381099, -0.5060204, 1, 0.4313726, 0, 1,
-1.454936, -0.2154633, -1.086047, 1, 0.4392157, 0, 1,
-1.452608, 0.3208132, -1.754974, 1, 0.4431373, 0, 1,
-1.446369, 0.7158465, -1.321402, 1, 0.4509804, 0, 1,
-1.431769, 0.7513573, -0.8728889, 1, 0.454902, 0, 1,
-1.423902, 1.346314, -1.161771, 1, 0.4627451, 0, 1,
-1.413878, 0.8675661, 0.4770901, 1, 0.4666667, 0, 1,
-1.408951, -1.850957, -3.656849, 1, 0.4745098, 0, 1,
-1.408404, -0.4336801, -3.308487, 1, 0.4784314, 0, 1,
-1.399256, -1.440724, -4.11217, 1, 0.4862745, 0, 1,
-1.394496, -0.1452139, -1.779844, 1, 0.4901961, 0, 1,
-1.333339, -1.000095, -2.467557, 1, 0.4980392, 0, 1,
-1.330144, -0.09814922, -2.115042, 1, 0.5058824, 0, 1,
-1.322803, 0.1390956, -0.4271445, 1, 0.509804, 0, 1,
-1.316019, 0.227161, -0.7491902, 1, 0.5176471, 0, 1,
-1.31581, -0.09532121, -2.301248, 1, 0.5215687, 0, 1,
-1.314376, 0.5288751, 0.4969113, 1, 0.5294118, 0, 1,
-1.302377, 0.04616447, -1.640658, 1, 0.5333334, 0, 1,
-1.296081, -0.4758202, -1.340917, 1, 0.5411765, 0, 1,
-1.283431, -0.3064961, -2.694259, 1, 0.5450981, 0, 1,
-1.277594, 1.87647, -1.49585, 1, 0.5529412, 0, 1,
-1.275214, 0.7634376, -1.442153, 1, 0.5568628, 0, 1,
-1.264977, -0.4277923, -1.707372, 1, 0.5647059, 0, 1,
-1.261671, -1.430285, -1.32478, 1, 0.5686275, 0, 1,
-1.24764, -0.6441633, -1.524626, 1, 0.5764706, 0, 1,
-1.236043, 0.08249362, -2.632298, 1, 0.5803922, 0, 1,
-1.233977, -0.4616188, -1.861568, 1, 0.5882353, 0, 1,
-1.229783, -0.6146189, -3.33897, 1, 0.5921569, 0, 1,
-1.226156, 1.234151, -2.148928, 1, 0.6, 0, 1,
-1.199977, 2.270078, -1.67557, 1, 0.6078432, 0, 1,
-1.197571, -1.494686, -1.185952, 1, 0.6117647, 0, 1,
-1.19065, -0.4119241, -1.24932, 1, 0.6196079, 0, 1,
-1.184952, -1.924673, -3.204394, 1, 0.6235294, 0, 1,
-1.176459, -1.323341, -3.324844, 1, 0.6313726, 0, 1,
-1.169173, 0.1000899, -0.258693, 1, 0.6352941, 0, 1,
-1.169134, -2.393811, -3.069129, 1, 0.6431373, 0, 1,
-1.168524, -0.5532416, -2.188401, 1, 0.6470588, 0, 1,
-1.166787, -1.355316, -2.623835, 1, 0.654902, 0, 1,
-1.159668, 1.111075, -1.886691, 1, 0.6588235, 0, 1,
-1.157794, -0.8304994, -2.701543, 1, 0.6666667, 0, 1,
-1.155474, 1.31101, -0.7325897, 1, 0.6705883, 0, 1,
-1.153156, -1.145608, -2.880926, 1, 0.6784314, 0, 1,
-1.147519, 0.1343548, -2.993581, 1, 0.682353, 0, 1,
-1.141454, -1.670524, -1.084036, 1, 0.6901961, 0, 1,
-1.137494, 0.05048708, -1.082887, 1, 0.6941177, 0, 1,
-1.135201, -0.4720257, -1.369717, 1, 0.7019608, 0, 1,
-1.134867, -0.1577996, 0.1573176, 1, 0.7098039, 0, 1,
-1.130981, -1.038944, -1.468383, 1, 0.7137255, 0, 1,
-1.124909, -1.321556, -3.22121, 1, 0.7215686, 0, 1,
-1.124596, -0.7511439, -2.326606, 1, 0.7254902, 0, 1,
-1.123959, 0.8222052, -2.353948, 1, 0.7333333, 0, 1,
-1.121111, 0.07207242, -1.938601, 1, 0.7372549, 0, 1,
-1.113211, -0.5687249, -2.677368, 1, 0.7450981, 0, 1,
-1.096231, 0.08125794, -0.07250821, 1, 0.7490196, 0, 1,
-1.093908, -1.94562, -1.865261, 1, 0.7568628, 0, 1,
-1.089955, 1.004267, -1.803233, 1, 0.7607843, 0, 1,
-1.086646, -0.6139292, -2.076458, 1, 0.7686275, 0, 1,
-1.085082, -0.7100037, -1.561939, 1, 0.772549, 0, 1,
-1.083786, 0.2436182, -3.068566, 1, 0.7803922, 0, 1,
-1.083716, 0.9374548, -2.387356, 1, 0.7843137, 0, 1,
-1.069585, -0.8313814, -1.769856, 1, 0.7921569, 0, 1,
-1.050605, -0.4381244, -2.886269, 1, 0.7960784, 0, 1,
-1.046522, 1.199418, -1.660913, 1, 0.8039216, 0, 1,
-1.037751, -0.7639433, -0.4316448, 1, 0.8117647, 0, 1,
-1.036816, 0.3256584, 0.3544323, 1, 0.8156863, 0, 1,
-1.023132, 0.2166365, -1.592209, 1, 0.8235294, 0, 1,
-1.022714, 1.095743, -0.4885655, 1, 0.827451, 0, 1,
-1.016758, 1.17347, -1.25623, 1, 0.8352941, 0, 1,
-1.014167, -0.908659, -4.638207, 1, 0.8392157, 0, 1,
-1.007643, 0.8369429, -1.047904, 1, 0.8470588, 0, 1,
-1.006313, -1.517811, -2.764997, 1, 0.8509804, 0, 1,
-1.002153, 0.3390583, -0.8433637, 1, 0.8588235, 0, 1,
-0.9991319, -0.3070871, -1.479649, 1, 0.8627451, 0, 1,
-0.9988684, -1.569911, -2.135432, 1, 0.8705882, 0, 1,
-0.9964912, 0.05293971, -0.7997859, 1, 0.8745098, 0, 1,
-0.992231, 0.4831783, -1.156086, 1, 0.8823529, 0, 1,
-0.9875255, 1.154857, -1.82936, 1, 0.8862745, 0, 1,
-0.9867396, 0.8299872, 1.84312, 1, 0.8941177, 0, 1,
-0.9825679, 0.3452373, -2.110627, 1, 0.8980392, 0, 1,
-0.9797922, -2.159045, -3.581011, 1, 0.9058824, 0, 1,
-0.9721473, -0.9459597, -2.261593, 1, 0.9137255, 0, 1,
-0.9694686, -0.07487654, -2.43182, 1, 0.9176471, 0, 1,
-0.967469, -0.4903778, -3.09608, 1, 0.9254902, 0, 1,
-0.9649426, 0.8945122, -0.2059025, 1, 0.9294118, 0, 1,
-0.9629377, -0.3449924, -2.482255, 1, 0.9372549, 0, 1,
-0.960116, 1.098155, -0.6342485, 1, 0.9411765, 0, 1,
-0.9578566, 1.453983, 0.321398, 1, 0.9490196, 0, 1,
-0.9569364, -0.5535128, -2.408542, 1, 0.9529412, 0, 1,
-0.941986, -1.032475, -2.54382, 1, 0.9607843, 0, 1,
-0.9300572, 0.0599287, -1.529007, 1, 0.9647059, 0, 1,
-0.9290316, -0.173336, -2.227497, 1, 0.972549, 0, 1,
-0.928201, 0.3870331, -0.6956399, 1, 0.9764706, 0, 1,
-0.9217441, 0.1452212, -4.337986, 1, 0.9843137, 0, 1,
-0.9200061, -0.1007498, -1.176108, 1, 0.9882353, 0, 1,
-0.9185739, -0.286004, -2.018224, 1, 0.9960784, 0, 1,
-0.9177194, 0.170416, -2.35078, 0.9960784, 1, 0, 1,
-0.9037115, 0.7355878, -0.6601181, 0.9921569, 1, 0, 1,
-0.9000784, 1.703377, -0.9534609, 0.9843137, 1, 0, 1,
-0.8956367, -0.6605713, -3.03653, 0.9803922, 1, 0, 1,
-0.8919215, 1.560272, -1.924975, 0.972549, 1, 0, 1,
-0.886473, -2.118476, -3.477575, 0.9686275, 1, 0, 1,
-0.8840103, -1.911162, -3.654195, 0.9607843, 1, 0, 1,
-0.8827637, -0.3199525, -2.057547, 0.9568627, 1, 0, 1,
-0.8804941, 0.9522858, -0.6065585, 0.9490196, 1, 0, 1,
-0.8764499, -0.3004453, -1.442053, 0.945098, 1, 0, 1,
-0.8735908, 0.7007112, -0.6310445, 0.9372549, 1, 0, 1,
-0.8675841, 0.0631451, -2.076411, 0.9333333, 1, 0, 1,
-0.8675587, 0.4831849, -2.034445, 0.9254902, 1, 0, 1,
-0.8665236, 0.5378979, -2.180398, 0.9215686, 1, 0, 1,
-0.8664755, -1.973008, -3.788369, 0.9137255, 1, 0, 1,
-0.8629016, 0.5989535, -1.715976, 0.9098039, 1, 0, 1,
-0.8616287, -0.08968934, -1.560833, 0.9019608, 1, 0, 1,
-0.8598103, 0.2611999, 0.06925733, 0.8941177, 1, 0, 1,
-0.8577702, -0.4012683, -1.571148, 0.8901961, 1, 0, 1,
-0.8563862, 1.630096, -0.9384417, 0.8823529, 1, 0, 1,
-0.8558722, 0.5898671, -0.5978138, 0.8784314, 1, 0, 1,
-0.843666, -0.2445443, -1.022404, 0.8705882, 1, 0, 1,
-0.8397879, -2.698587, -0.6313494, 0.8666667, 1, 0, 1,
-0.8336071, 0.3105764, 0.5110844, 0.8588235, 1, 0, 1,
-0.832462, -0.5841152, -1.8997, 0.854902, 1, 0, 1,
-0.8307956, -0.5911316, 0.5371081, 0.8470588, 1, 0, 1,
-0.8267988, -0.3072256, -2.017106, 0.8431373, 1, 0, 1,
-0.8217853, -0.838101, -3.134876, 0.8352941, 1, 0, 1,
-0.8210172, -0.4816934, -0.7956601, 0.8313726, 1, 0, 1,
-0.8205343, -0.07584608, -1.134659, 0.8235294, 1, 0, 1,
-0.8163414, -0.283256, -3.572665, 0.8196079, 1, 0, 1,
-0.8095376, 0.3871013, 2.041688, 0.8117647, 1, 0, 1,
-0.8050318, 0.8810685, -1.285098, 0.8078431, 1, 0, 1,
-0.803362, 0.4960731, -0.6127782, 0.8, 1, 0, 1,
-0.7985935, -0.5601301, -1.534205, 0.7921569, 1, 0, 1,
-0.7985025, -0.4638764, -0.3797551, 0.7882353, 1, 0, 1,
-0.7943916, -0.07584909, -1.472395, 0.7803922, 1, 0, 1,
-0.7884818, -0.3380711, -2.486307, 0.7764706, 1, 0, 1,
-0.7877973, -0.05524456, -2.492144, 0.7686275, 1, 0, 1,
-0.7847744, -0.105545, -3.184907, 0.7647059, 1, 0, 1,
-0.7820007, 0.1676713, -1.951564, 0.7568628, 1, 0, 1,
-0.7803987, -0.5985252, -2.733739, 0.7529412, 1, 0, 1,
-0.7754785, 0.4747122, 0.03907125, 0.7450981, 1, 0, 1,
-0.7726378, -0.06386584, -1.078308, 0.7411765, 1, 0, 1,
-0.7694266, 0.1454809, -1.57442, 0.7333333, 1, 0, 1,
-0.7629274, 0.8424326, 0.8419369, 0.7294118, 1, 0, 1,
-0.7577515, 0.7903693, 0.2417038, 0.7215686, 1, 0, 1,
-0.7554129, 0.4938228, 0.0442309, 0.7176471, 1, 0, 1,
-0.754498, 1.580149, 0.2994696, 0.7098039, 1, 0, 1,
-0.7485505, -0.2903659, -0.7986476, 0.7058824, 1, 0, 1,
-0.7478283, -0.4816822, 0.4050194, 0.6980392, 1, 0, 1,
-0.7454278, 0.07319972, -1.421929, 0.6901961, 1, 0, 1,
-0.7369503, -1.453741, -3.208924, 0.6862745, 1, 0, 1,
-0.7340312, 1.348908, -1.591637, 0.6784314, 1, 0, 1,
-0.7291379, -0.2124859, -1.898449, 0.6745098, 1, 0, 1,
-0.7283292, -0.4551432, -3.055408, 0.6666667, 1, 0, 1,
-0.7238252, 2.244465, -0.5381249, 0.6627451, 1, 0, 1,
-0.7195134, -1.178123, -1.958082, 0.654902, 1, 0, 1,
-0.7045735, 0.467376, -1.177673, 0.6509804, 1, 0, 1,
-0.6984922, -0.9223218, -3.352257, 0.6431373, 1, 0, 1,
-0.6883068, 0.4947558, -1.010465, 0.6392157, 1, 0, 1,
-0.6849881, -0.315787, -1.665811, 0.6313726, 1, 0, 1,
-0.6816327, -0.4648012, -1.766675, 0.627451, 1, 0, 1,
-0.6799328, 0.7927551, -0.5260083, 0.6196079, 1, 0, 1,
-0.6796007, -0.05864352, -2.060942, 0.6156863, 1, 0, 1,
-0.6789905, -2.182522, -2.320795, 0.6078432, 1, 0, 1,
-0.6771241, -0.3052555, -1.262123, 0.6039216, 1, 0, 1,
-0.6684036, -0.6447142, -1.739201, 0.5960785, 1, 0, 1,
-0.6675686, -0.5334457, -3.474283, 0.5882353, 1, 0, 1,
-0.6664442, 0.9740562, 1.110234, 0.5843138, 1, 0, 1,
-0.6642883, -1.332232, -1.17352, 0.5764706, 1, 0, 1,
-0.659164, -0.4562575, -1.875839, 0.572549, 1, 0, 1,
-0.6556038, 0.6488838, -1.709844, 0.5647059, 1, 0, 1,
-0.6517609, -1.095792, -2.750687, 0.5607843, 1, 0, 1,
-0.6495833, 0.1950534, -0.6934515, 0.5529412, 1, 0, 1,
-0.6472359, 0.387005, -1.256436, 0.5490196, 1, 0, 1,
-0.6470538, 1.270926, -1.187707, 0.5411765, 1, 0, 1,
-0.6463764, 0.8000045, -0.2777535, 0.5372549, 1, 0, 1,
-0.640932, -1.207505, -2.089607, 0.5294118, 1, 0, 1,
-0.6277452, 0.1096214, -1.332132, 0.5254902, 1, 0, 1,
-0.6208321, -0.1731569, -1.94662, 0.5176471, 1, 0, 1,
-0.6082375, 0.936074, 3.001328, 0.5137255, 1, 0, 1,
-0.6030523, 0.1207172, -1.392792, 0.5058824, 1, 0, 1,
-0.6003765, 0.9843894, 0.8082926, 0.5019608, 1, 0, 1,
-0.593681, 0.263023, -1.645418, 0.4941176, 1, 0, 1,
-0.5930513, -0.947348, -3.482719, 0.4862745, 1, 0, 1,
-0.5915028, -0.4057578, -1.648139, 0.4823529, 1, 0, 1,
-0.5914911, 0.5067582, -0.8599483, 0.4745098, 1, 0, 1,
-0.5887266, -0.3234827, -0.9841305, 0.4705882, 1, 0, 1,
-0.5885475, -0.7809628, -2.718271, 0.4627451, 1, 0, 1,
-0.5863717, 0.7802678, -0.886284, 0.4588235, 1, 0, 1,
-0.5845141, 0.01175392, -2.92657, 0.4509804, 1, 0, 1,
-0.5797939, 1.05699, 0.6370087, 0.4470588, 1, 0, 1,
-0.5770948, -1.409306, -4.475693, 0.4392157, 1, 0, 1,
-0.5745525, -0.8304344, -1.611096, 0.4352941, 1, 0, 1,
-0.5695235, 0.2174078, -1.828636, 0.427451, 1, 0, 1,
-0.5689176, -0.4056971, -3.917898, 0.4235294, 1, 0, 1,
-0.568194, -0.3937003, -0.6124803, 0.4156863, 1, 0, 1,
-0.565125, 0.6384011, 2.153713, 0.4117647, 1, 0, 1,
-0.5589437, 1.344499, -1.221807, 0.4039216, 1, 0, 1,
-0.5587384, 0.3163061, -1.33686, 0.3960784, 1, 0, 1,
-0.5557707, -2.235156, -2.355703, 0.3921569, 1, 0, 1,
-0.5544922, 0.9830886, -0.117882, 0.3843137, 1, 0, 1,
-0.5502594, 0.7775654, -0.4771672, 0.3803922, 1, 0, 1,
-0.5496626, 2.162876, 0.9310837, 0.372549, 1, 0, 1,
-0.5490373, -0.6987417, -2.206661, 0.3686275, 1, 0, 1,
-0.5461133, 0.6016495, 0.4535547, 0.3607843, 1, 0, 1,
-0.5446445, 0.7479618, -0.6846274, 0.3568628, 1, 0, 1,
-0.5435713, -0.241428, 0.04069628, 0.3490196, 1, 0, 1,
-0.5425096, -3.62125, -2.608112, 0.345098, 1, 0, 1,
-0.5359052, 0.5605022, -1.665311, 0.3372549, 1, 0, 1,
-0.534219, 0.793161, -0.003721562, 0.3333333, 1, 0, 1,
-0.5312548, -0.03893582, -2.284754, 0.3254902, 1, 0, 1,
-0.530138, -0.2262102, -0.6018637, 0.3215686, 1, 0, 1,
-0.5287469, 0.7976147, 1.61444, 0.3137255, 1, 0, 1,
-0.528425, 0.01286007, -3.058481, 0.3098039, 1, 0, 1,
-0.5098181, 0.2551525, -0.01771755, 0.3019608, 1, 0, 1,
-0.5093031, 0.3730904, 0.2757516, 0.2941177, 1, 0, 1,
-0.508984, 0.8536668, -1.026464, 0.2901961, 1, 0, 1,
-0.5073116, -1.953656, -3.289417, 0.282353, 1, 0, 1,
-0.506219, 0.1369892, -2.116873, 0.2784314, 1, 0, 1,
-0.5055385, 0.7111601, -0.4491699, 0.2705882, 1, 0, 1,
-0.5012607, 1.346678, -1.367033, 0.2666667, 1, 0, 1,
-0.5006013, -0.06145631, -0.8499391, 0.2588235, 1, 0, 1,
-0.4999444, 1.579279, -0.4415544, 0.254902, 1, 0, 1,
-0.4970264, -0.08870186, -3.757835, 0.2470588, 1, 0, 1,
-0.495813, 0.03619375, -1.743403, 0.2431373, 1, 0, 1,
-0.4915207, 0.1157445, 1.119845, 0.2352941, 1, 0, 1,
-0.484738, -2.508292, -2.200847, 0.2313726, 1, 0, 1,
-0.4813991, -0.3070866, -2.506436, 0.2235294, 1, 0, 1,
-0.4723266, -0.569572, -4.058925, 0.2196078, 1, 0, 1,
-0.4699029, -0.7247556, -3.143345, 0.2117647, 1, 0, 1,
-0.468689, 0.957133, -0.6858063, 0.2078431, 1, 0, 1,
-0.4682808, -0.7019085, -2.558093, 0.2, 1, 0, 1,
-0.4664827, -1.515457, -2.456262, 0.1921569, 1, 0, 1,
-0.4655262, 0.523806, -1.320405, 0.1882353, 1, 0, 1,
-0.4629825, -0.6193604, -3.777331, 0.1803922, 1, 0, 1,
-0.4627652, -1.51603, -2.65759, 0.1764706, 1, 0, 1,
-0.4624257, -0.1873968, -1.82079, 0.1686275, 1, 0, 1,
-0.4585969, 1.095695, -0.1234585, 0.1647059, 1, 0, 1,
-0.4570212, 0.8230438, -1.631114, 0.1568628, 1, 0, 1,
-0.4568069, -0.3001575, -3.633372, 0.1529412, 1, 0, 1,
-0.4533657, 0.3805504, -1.862718, 0.145098, 1, 0, 1,
-0.4478004, 1.18151, -1.299198, 0.1411765, 1, 0, 1,
-0.4439501, -1.210157, -4.234743, 0.1333333, 1, 0, 1,
-0.4429399, 2.136562, -0.8590141, 0.1294118, 1, 0, 1,
-0.4404714, -0.2817473, -2.450578, 0.1215686, 1, 0, 1,
-0.4388105, 1.447873, 0.2657878, 0.1176471, 1, 0, 1,
-0.4371541, 1.109518, 0.1952791, 0.1098039, 1, 0, 1,
-0.4361973, 0.2126489, 0.3368889, 0.1058824, 1, 0, 1,
-0.435305, -1.564872, -1.685387, 0.09803922, 1, 0, 1,
-0.4350376, -0.4458283, -2.569998, 0.09019608, 1, 0, 1,
-0.4342264, -0.1835441, -3.2007, 0.08627451, 1, 0, 1,
-0.4297387, -1.29195, -3.719004, 0.07843138, 1, 0, 1,
-0.4278194, -0.2040491, -1.208853, 0.07450981, 1, 0, 1,
-0.4273309, -0.1640791, -2.715901, 0.06666667, 1, 0, 1,
-0.4260101, -1.705624, -3.251163, 0.0627451, 1, 0, 1,
-0.4219649, 0.4160813, -0.6233247, 0.05490196, 1, 0, 1,
-0.4217932, -0.9582696, -1.899883, 0.05098039, 1, 0, 1,
-0.4197072, 1.275734, -0.7232009, 0.04313726, 1, 0, 1,
-0.4190171, 1.282572, 1.466796, 0.03921569, 1, 0, 1,
-0.4171529, 0.2945553, -1.793402, 0.03137255, 1, 0, 1,
-0.4144579, 0.4083164, 0.1098667, 0.02745098, 1, 0, 1,
-0.4139955, -0.09149256, -1.592001, 0.01960784, 1, 0, 1,
-0.4134886, 0.2873189, -0.3769736, 0.01568628, 1, 0, 1,
-0.4082503, -1.070139, -0.9935088, 0.007843138, 1, 0, 1,
-0.4065003, 0.3643278, 0.1760255, 0.003921569, 1, 0, 1,
-0.4051287, -0.4069304, -0.5668051, 0, 1, 0.003921569, 1,
-0.4003442, -0.01712313, -2.632362, 0, 1, 0.01176471, 1,
-0.3961634, -0.162708, -1.674769, 0, 1, 0.01568628, 1,
-0.3946937, -0.5646932, -1.406371, 0, 1, 0.02352941, 1,
-0.3938574, 0.287482, -3.145386, 0, 1, 0.02745098, 1,
-0.3905398, -0.6041015, -3.044862, 0, 1, 0.03529412, 1,
-0.3896459, 0.3126347, -0.4628863, 0, 1, 0.03921569, 1,
-0.3875213, -1.021201, -3.165374, 0, 1, 0.04705882, 1,
-0.3839068, 0.7263399, 0.4339516, 0, 1, 0.05098039, 1,
-0.3817598, -1.281101, -2.882426, 0, 1, 0.05882353, 1,
-0.3794462, 1.70215, -1.986966, 0, 1, 0.0627451, 1,
-0.3789432, 0.2607161, -2.392035, 0, 1, 0.07058824, 1,
-0.3739988, 0.1082884, -1.238512, 0, 1, 0.07450981, 1,
-0.372787, -0.03270174, -0.2875893, 0, 1, 0.08235294, 1,
-0.3693565, 1.013498, -0.01285249, 0, 1, 0.08627451, 1,
-0.3647909, -0.8380996, -2.661195, 0, 1, 0.09411765, 1,
-0.3627293, 1.053736, 0.3990731, 0, 1, 0.1019608, 1,
-0.3613744, 0.6993938, -0.3746012, 0, 1, 0.1058824, 1,
-0.360271, -0.05316634, -2.071855, 0, 1, 0.1137255, 1,
-0.3572864, 0.9877233, -1.648851, 0, 1, 0.1176471, 1,
-0.3567821, 1.264578, 1.646125, 0, 1, 0.1254902, 1,
-0.3524677, 0.8095136, 0.2991011, 0, 1, 0.1294118, 1,
-0.3518673, 0.7694197, 1.365698, 0, 1, 0.1372549, 1,
-0.3485696, 0.60934, -1.208623, 0, 1, 0.1411765, 1,
-0.3473271, 0.2162469, -1.153337, 0, 1, 0.1490196, 1,
-0.3415091, 0.3063188, 0.3090099, 0, 1, 0.1529412, 1,
-0.3370076, 0.2133151, -1.911837, 0, 1, 0.1607843, 1,
-0.3334372, -2.338323, -2.965967, 0, 1, 0.1647059, 1,
-0.3326699, 0.5227177, 0.6509509, 0, 1, 0.172549, 1,
-0.3269153, 0.1417805, -1.101554, 0, 1, 0.1764706, 1,
-0.3257965, 0.4625079, -1.546266, 0, 1, 0.1843137, 1,
-0.3239697, 0.5800312, -0.4331676, 0, 1, 0.1882353, 1,
-0.3208527, 1.286353, -0.07508039, 0, 1, 0.1960784, 1,
-0.3161792, -0.3847139, -2.050729, 0, 1, 0.2039216, 1,
-0.3141312, 0.06518099, -1.661804, 0, 1, 0.2078431, 1,
-0.306564, -1.570274, -3.467906, 0, 1, 0.2156863, 1,
-0.3056819, 0.3366142, -0.06015362, 0, 1, 0.2196078, 1,
-0.3048586, 1.428784, 1.192437, 0, 1, 0.227451, 1,
-0.3028707, -0.03576628, -2.478791, 0, 1, 0.2313726, 1,
-0.3002978, -1.516388, -2.205779, 0, 1, 0.2392157, 1,
-0.2993673, 1.193054, -1.690107, 0, 1, 0.2431373, 1,
-0.2935843, 0.5428136, 1.172898, 0, 1, 0.2509804, 1,
-0.2924967, -1.00644, -4.41424, 0, 1, 0.254902, 1,
-0.2906476, 0.1211005, -1.093623, 0, 1, 0.2627451, 1,
-0.2906131, -0.3882897, -1.0444, 0, 1, 0.2666667, 1,
-0.2856581, -0.465478, 0.3265004, 0, 1, 0.2745098, 1,
-0.2793818, -0.2892815, -2.08158, 0, 1, 0.2784314, 1,
-0.2772214, -0.1986528, -0.1460194, 0, 1, 0.2862745, 1,
-0.2748228, 0.1931593, -1.847087, 0, 1, 0.2901961, 1,
-0.2734615, -0.571118, -2.395311, 0, 1, 0.2980392, 1,
-0.2733783, 1.873823, 0.0408794, 0, 1, 0.3058824, 1,
-0.2726889, -0.09894494, -3.513372, 0, 1, 0.3098039, 1,
-0.2650139, -0.9360614, -1.431226, 0, 1, 0.3176471, 1,
-0.2624379, -0.03384038, -3.093631, 0, 1, 0.3215686, 1,
-0.2617258, -1.729798, -4.109475, 0, 1, 0.3294118, 1,
-0.2524682, 0.4873619, 1.161279, 0, 1, 0.3333333, 1,
-0.2501599, -1.270151, -3.60495, 0, 1, 0.3411765, 1,
-0.2493043, 1.422232, 0.9565158, 0, 1, 0.345098, 1,
-0.24853, 1.394467, 0.3429178, 0, 1, 0.3529412, 1,
-0.2455065, 1.585827, 0.5633546, 0, 1, 0.3568628, 1,
-0.2439809, -0.09247309, -3.719008, 0, 1, 0.3647059, 1,
-0.2432083, -0.8407596, -4.826433, 0, 1, 0.3686275, 1,
-0.2429442, -1.269983, -2.890074, 0, 1, 0.3764706, 1,
-0.2425824, -0.1597317, -1.541153, 0, 1, 0.3803922, 1,
-0.2408065, -0.9278693, -2.627437, 0, 1, 0.3882353, 1,
-0.2337003, -0.08263439, -1.027098, 0, 1, 0.3921569, 1,
-0.2317947, -0.3487231, -2.998784, 0, 1, 0.4, 1,
-0.2244367, -0.141459, -2.254261, 0, 1, 0.4078431, 1,
-0.2175639, 1.491447, -0.4796299, 0, 1, 0.4117647, 1,
-0.2175003, 0.2418696, -1.552742, 0, 1, 0.4196078, 1,
-0.2113054, -0.1000698, 0.2471025, 0, 1, 0.4235294, 1,
-0.2094411, -0.2425202, -2.836316, 0, 1, 0.4313726, 1,
-0.2088026, -1.68093, -4.417527, 0, 1, 0.4352941, 1,
-0.2072281, 1.277678, -0.533341, 0, 1, 0.4431373, 1,
-0.2009504, -0.5854631, -2.145288, 0, 1, 0.4470588, 1,
-0.1991321, -0.4627621, -3.08141, 0, 1, 0.454902, 1,
-0.19879, 0.898325, 0.1186519, 0, 1, 0.4588235, 1,
-0.1977559, 0.5535955, 1.038334, 0, 1, 0.4666667, 1,
-0.1828292, 0.7269835, -1.61714, 0, 1, 0.4705882, 1,
-0.1814531, 0.8343609, -0.6747512, 0, 1, 0.4784314, 1,
-0.1754187, 0.7853431, 0.4932089, 0, 1, 0.4823529, 1,
-0.1751129, -0.5985133, -3.115713, 0, 1, 0.4901961, 1,
-0.1708809, 0.5768161, 0.1864067, 0, 1, 0.4941176, 1,
-0.1587303, -2.233187, -2.174624, 0, 1, 0.5019608, 1,
-0.1577509, 2.240767, -0.1997591, 0, 1, 0.509804, 1,
-0.1565634, 0.3939479, -0.7166343, 0, 1, 0.5137255, 1,
-0.1564008, 0.1375196, -0.02355024, 0, 1, 0.5215687, 1,
-0.1500608, -0.553732, -4.828465, 0, 1, 0.5254902, 1,
-0.1432699, 0.7251164, -0.8404588, 0, 1, 0.5333334, 1,
-0.1428684, -1.241921, -2.535013, 0, 1, 0.5372549, 1,
-0.1399999, -1.026234, -3.575201, 0, 1, 0.5450981, 1,
-0.13659, 0.10281, 0.8849332, 0, 1, 0.5490196, 1,
-0.1339828, 1.723713, -0.8077995, 0, 1, 0.5568628, 1,
-0.133328, 2.093372, 0.4396135, 0, 1, 0.5607843, 1,
-0.1330101, 0.1622349, 1.346624, 0, 1, 0.5686275, 1,
-0.1287927, 0.4365441, 0.4239354, 0, 1, 0.572549, 1,
-0.1248785, -0.2149357, -2.953116, 0, 1, 0.5803922, 1,
-0.1233409, -1.052358, -3.244228, 0, 1, 0.5843138, 1,
-0.1230903, 1.775205, 0.2369047, 0, 1, 0.5921569, 1,
-0.1215817, 1.009354, -1.016441, 0, 1, 0.5960785, 1,
-0.1101457, 0.8760168, 1.414474, 0, 1, 0.6039216, 1,
-0.1062539, -1.052713, -2.602112, 0, 1, 0.6117647, 1,
-0.1051212, 0.6793042, 1.113287, 0, 1, 0.6156863, 1,
-0.1048259, 1.014664, 1.392435, 0, 1, 0.6235294, 1,
-0.1026023, 1.013251, -1.200465, 0, 1, 0.627451, 1,
-0.1024231, 1.639263, 2.125098, 0, 1, 0.6352941, 1,
-0.102328, -0.7744876, -3.445578, 0, 1, 0.6392157, 1,
-0.09838805, -0.09764197, -4.57473, 0, 1, 0.6470588, 1,
-0.09564777, -0.6076919, -2.373273, 0, 1, 0.6509804, 1,
-0.0921543, 0.5186155, 1.278088, 0, 1, 0.6588235, 1,
-0.08702295, -0.06687833, -3.278748, 0, 1, 0.6627451, 1,
-0.08609553, 0.7314653, -0.7038662, 0, 1, 0.6705883, 1,
-0.08533917, 0.2744448, -0.0177687, 0, 1, 0.6745098, 1,
-0.08128337, -0.1173642, -2.502254, 0, 1, 0.682353, 1,
-0.07559136, 0.1518173, -0.1163746, 0, 1, 0.6862745, 1,
-0.07300446, -0.805068, -5.284722, 0, 1, 0.6941177, 1,
-0.0723794, 1.23983, 0.4006544, 0, 1, 0.7019608, 1,
-0.06949464, -0.3779719, -3.056797, 0, 1, 0.7058824, 1,
-0.06753168, -1.251303, -3.276752, 0, 1, 0.7137255, 1,
-0.06643235, -0.4032639, -2.969208, 0, 1, 0.7176471, 1,
-0.06420341, -0.4725683, -1.807318, 0, 1, 0.7254902, 1,
-0.06325059, 0.5827779, 0.9091688, 0, 1, 0.7294118, 1,
-0.06239818, 0.2507064, -0.02385833, 0, 1, 0.7372549, 1,
-0.05395235, 0.975568, -0.2041361, 0, 1, 0.7411765, 1,
-0.05262566, 0.9555071, 0.663395, 0, 1, 0.7490196, 1,
-0.05192826, 0.5422903, 0.3274522, 0, 1, 0.7529412, 1,
-0.05088243, -1.191323, -1.619372, 0, 1, 0.7607843, 1,
-0.05026557, -0.2921915, -3.301635, 0, 1, 0.7647059, 1,
-0.04863088, 1.672951, 0.7946002, 0, 1, 0.772549, 1,
-0.04065206, -0.06484156, -1.842614, 0, 1, 0.7764706, 1,
-0.03588671, -0.02961805, -3.387574, 0, 1, 0.7843137, 1,
-0.03585232, 0.6331908, -0.04330062, 0, 1, 0.7882353, 1,
-0.03336454, -1.091526, -3.092228, 0, 1, 0.7960784, 1,
-0.03319268, -1.025236, -3.938514, 0, 1, 0.8039216, 1,
-0.03282164, -0.7741227, -3.38306, 0, 1, 0.8078431, 1,
-0.03141466, -1.78856, -2.637617, 0, 1, 0.8156863, 1,
-0.01860981, 0.9857778, 0.8129944, 0, 1, 0.8196079, 1,
-0.01797741, 0.8842974, -0.4710914, 0, 1, 0.827451, 1,
-0.01717498, -0.8786484, -2.342496, 0, 1, 0.8313726, 1,
-0.01662953, 0.8960834, -0.4580284, 0, 1, 0.8392157, 1,
-0.0126261, 0.7640484, -0.249095, 0, 1, 0.8431373, 1,
-0.01054556, -0.432469, -2.394078, 0, 1, 0.8509804, 1,
-0.003328886, -2.705781, -4.265542, 0, 1, 0.854902, 1,
0.002227103, 0.9527281, 1.296015, 0, 1, 0.8627451, 1,
0.002987017, -0.009412467, 3.408011, 0, 1, 0.8666667, 1,
0.003347265, 0.1192971, -0.721831, 0, 1, 0.8745098, 1,
0.005306433, 0.1054856, -0.7919935, 0, 1, 0.8784314, 1,
0.01446965, 1.984887, 1.246235, 0, 1, 0.8862745, 1,
0.01637197, -0.7526627, 3.290021, 0, 1, 0.8901961, 1,
0.01679039, 0.8285094, -0.591432, 0, 1, 0.8980392, 1,
0.02274754, 1.488797, -0.05770878, 0, 1, 0.9058824, 1,
0.02382831, -1.217244, 4.071244, 0, 1, 0.9098039, 1,
0.0273814, 0.3015253, -1.026134, 0, 1, 0.9176471, 1,
0.03296005, 2.725406, -0.2399997, 0, 1, 0.9215686, 1,
0.03703608, 0.6915134, -0.5475702, 0, 1, 0.9294118, 1,
0.03850724, 0.5149553, -1.861971, 0, 1, 0.9333333, 1,
0.04011964, 0.725207, 0.2491675, 0, 1, 0.9411765, 1,
0.04226968, 1.076802, -0.1026648, 0, 1, 0.945098, 1,
0.04310342, 0.1373343, 0.1715637, 0, 1, 0.9529412, 1,
0.04377747, 0.2993391, 0.9655896, 0, 1, 0.9568627, 1,
0.0506934, 0.6653152, -0.8259852, 0, 1, 0.9647059, 1,
0.05359856, -0.950394, 3.805026, 0, 1, 0.9686275, 1,
0.05406904, -0.2274223, 3.169381, 0, 1, 0.9764706, 1,
0.05897124, -0.6591247, 3.341301, 0, 1, 0.9803922, 1,
0.0601059, 1.799729, -0.08822367, 0, 1, 0.9882353, 1,
0.06051432, 0.8752177, -0.6893094, 0, 1, 0.9921569, 1,
0.06301513, 0.8224137, -1.137754, 0, 1, 1, 1,
0.06315219, 0.5465198, 1.210281, 0, 0.9921569, 1, 1,
0.06800935, 0.3914419, -0.08906517, 0, 0.9882353, 1, 1,
0.07068083, 0.499815, 0.5227321, 0, 0.9803922, 1, 1,
0.07321456, 0.07901506, 0.2210178, 0, 0.9764706, 1, 1,
0.07445823, 0.6061314, -0.4708706, 0, 0.9686275, 1, 1,
0.07463901, 0.7588109, 1.451783, 0, 0.9647059, 1, 1,
0.07723044, -1.967496, 4.056798, 0, 0.9568627, 1, 1,
0.07939192, -0.9815235, 3.777405, 0, 0.9529412, 1, 1,
0.08285523, -1.234568, 3.556634, 0, 0.945098, 1, 1,
0.0864338, -0.7044777, 2.953162, 0, 0.9411765, 1, 1,
0.08937542, -1.978474, 5.85336, 0, 0.9333333, 1, 1,
0.09119852, 0.3329526, 1.224558, 0, 0.9294118, 1, 1,
0.098182, 0.2235642, 0.2310058, 0, 0.9215686, 1, 1,
0.1014285, -0.1871416, 3.330275, 0, 0.9176471, 1, 1,
0.1071504, 1.128802, 1.359457, 0, 0.9098039, 1, 1,
0.1100089, 0.0120828, 1.565076, 0, 0.9058824, 1, 1,
0.1121028, 0.2516388, 0.814239, 0, 0.8980392, 1, 1,
0.1139112, 1.610892, -0.6140756, 0, 0.8901961, 1, 1,
0.1152089, 0.2518604, 2.746409, 0, 0.8862745, 1, 1,
0.122112, 1.140632, -0.1452598, 0, 0.8784314, 1, 1,
0.1258328, -0.9942417, 1.379496, 0, 0.8745098, 1, 1,
0.1271119, -0.9448043, 4.298769, 0, 0.8666667, 1, 1,
0.1326699, 2.165818, 0.2876276, 0, 0.8627451, 1, 1,
0.1343659, 0.9553212, 0.2049827, 0, 0.854902, 1, 1,
0.1347041, -1.132543, 5.822168, 0, 0.8509804, 1, 1,
0.1359794, 1.270963, -0.4721632, 0, 0.8431373, 1, 1,
0.1379278, 0.4490022, 0.1565985, 0, 0.8392157, 1, 1,
0.1382857, 0.7038003, 2.732654, 0, 0.8313726, 1, 1,
0.1390662, -0.8253773, 1.336562, 0, 0.827451, 1, 1,
0.141181, -0.9302216, 1.663647, 0, 0.8196079, 1, 1,
0.1473944, 0.3350115, 0.6239702, 0, 0.8156863, 1, 1,
0.1481011, -1.328121, 3.680485, 0, 0.8078431, 1, 1,
0.1481617, -0.9711163, 4.282497, 0, 0.8039216, 1, 1,
0.1506063, 0.3478777, -0.2148824, 0, 0.7960784, 1, 1,
0.1516776, 1.569494, 0.1616748, 0, 0.7882353, 1, 1,
0.1613778, -0.8005104, 2.951823, 0, 0.7843137, 1, 1,
0.1643456, -1.389969, 1.477256, 0, 0.7764706, 1, 1,
0.1691087, 0.01529369, 0.6286143, 0, 0.772549, 1, 1,
0.1695019, 0.4345494, 1.86104, 0, 0.7647059, 1, 1,
0.1698792, -1.465441, 3.896585, 0, 0.7607843, 1, 1,
0.1758638, 1.509995, -0.4551415, 0, 0.7529412, 1, 1,
0.1780349, -0.30837, 1.784323, 0, 0.7490196, 1, 1,
0.1806679, -1.315563, 3.331697, 0, 0.7411765, 1, 1,
0.1809507, -0.06786673, 0.7554113, 0, 0.7372549, 1, 1,
0.1883057, -2.136801, 3.718694, 0, 0.7294118, 1, 1,
0.1906727, 0.5397137, 1.554409, 0, 0.7254902, 1, 1,
0.1922765, 1.515089, 1.668958, 0, 0.7176471, 1, 1,
0.1938718, -1.690014, 3.597681, 0, 0.7137255, 1, 1,
0.1943602, 0.9627355, 0.9267271, 0, 0.7058824, 1, 1,
0.1985352, 0.387653, -1.54679, 0, 0.6980392, 1, 1,
0.200144, 0.2555937, 0.671555, 0, 0.6941177, 1, 1,
0.2002721, 0.1262511, 0.9972555, 0, 0.6862745, 1, 1,
0.2060322, -0.7717842, 2.82757, 0, 0.682353, 1, 1,
0.2060456, 1.304874, 2.457348, 0, 0.6745098, 1, 1,
0.2073131, -1.063866, 5.862352, 0, 0.6705883, 1, 1,
0.207353, -0.3698744, 3.774728, 0, 0.6627451, 1, 1,
0.2107048, 0.3113545, 2.71162, 0, 0.6588235, 1, 1,
0.2122989, -1.605665, 1.650936, 0, 0.6509804, 1, 1,
0.216085, 0.5600128, 0.7984326, 0, 0.6470588, 1, 1,
0.2183237, 0.9155424, 0.1219663, 0, 0.6392157, 1, 1,
0.2229172, -0.3918885, 3.815266, 0, 0.6352941, 1, 1,
0.2230507, -0.02567034, 1.840559, 0, 0.627451, 1, 1,
0.2248582, -0.3822061, 0.8121735, 0, 0.6235294, 1, 1,
0.2268628, 0.02862379, 0.08005252, 0, 0.6156863, 1, 1,
0.2310068, -0.6671155, 3.50853, 0, 0.6117647, 1, 1,
0.2325104, -1.090952, 3.074829, 0, 0.6039216, 1, 1,
0.2344473, -0.5302118, 3.274601, 0, 0.5960785, 1, 1,
0.2368964, 0.1898897, 0.2846693, 0, 0.5921569, 1, 1,
0.2370173, -0.1833751, 1.475264, 0, 0.5843138, 1, 1,
0.2391153, -0.3917376, 2.280408, 0, 0.5803922, 1, 1,
0.2411675, 0.54079, 0.1266684, 0, 0.572549, 1, 1,
0.2415926, 0.1560222, 2.990836, 0, 0.5686275, 1, 1,
0.2421703, 1.388018, 0.4048031, 0, 0.5607843, 1, 1,
0.2450119, 0.196913, 0.3360412, 0, 0.5568628, 1, 1,
0.2464368, 0.4180082, 1.397098, 0, 0.5490196, 1, 1,
0.2469363, 0.5577027, 0.2888626, 0, 0.5450981, 1, 1,
0.2494005, 0.2788932, 1.17691, 0, 0.5372549, 1, 1,
0.2516054, 0.871676, 0.762631, 0, 0.5333334, 1, 1,
0.2538557, -0.2728099, 3.281259, 0, 0.5254902, 1, 1,
0.2542898, 0.3661626, 2.031052, 0, 0.5215687, 1, 1,
0.2560685, -0.5948151, 2.572299, 0, 0.5137255, 1, 1,
0.2572059, -0.6285095, 1.320795, 0, 0.509804, 1, 1,
0.2575257, -1.533593, 0.6010888, 0, 0.5019608, 1, 1,
0.2594998, -0.2639472, 1.862156, 0, 0.4941176, 1, 1,
0.260994, -0.5165454, 2.337358, 0, 0.4901961, 1, 1,
0.2621675, 1.377601, 0.2941354, 0, 0.4823529, 1, 1,
0.262949, 1.451762, -0.0587901, 0, 0.4784314, 1, 1,
0.2633621, -1.935214, 2.282976, 0, 0.4705882, 1, 1,
0.2637143, -0.3724725, 4.514356, 0, 0.4666667, 1, 1,
0.2653881, 0.7072657, 0.3524941, 0, 0.4588235, 1, 1,
0.2674766, -1.187143, 3.314644, 0, 0.454902, 1, 1,
0.2708536, 0.4981423, 0.9514236, 0, 0.4470588, 1, 1,
0.2764803, -1.138334, 3.117808, 0, 0.4431373, 1, 1,
0.2790198, -1.289991, 4.33684, 0, 0.4352941, 1, 1,
0.2790574, 0.5028127, 0.1592604, 0, 0.4313726, 1, 1,
0.2849126, -0.5672014, 2.267555, 0, 0.4235294, 1, 1,
0.2870394, -1.563176, 3.400837, 0, 0.4196078, 1, 1,
0.2873754, -1.510511, 3.154386, 0, 0.4117647, 1, 1,
0.2893588, -0.2006277, 2.360708, 0, 0.4078431, 1, 1,
0.2917729, 0.4706475, 1.35728, 0, 0.4, 1, 1,
0.2933204, 0.6651143, -0.03668612, 0, 0.3921569, 1, 1,
0.2956358, -0.5518482, 3.287413, 0, 0.3882353, 1, 1,
0.2992277, 0.02248035, 3.153548, 0, 0.3803922, 1, 1,
0.2995082, -1.111268, 1.959478, 0, 0.3764706, 1, 1,
0.3017002, -0.7031479, 3.200918, 0, 0.3686275, 1, 1,
0.3037054, 0.6097499, -0.1668555, 0, 0.3647059, 1, 1,
0.3070486, 1.445176, -0.1681525, 0, 0.3568628, 1, 1,
0.3081339, 1.80431, 1.821639, 0, 0.3529412, 1, 1,
0.3098742, -0.2964568, 3.076095, 0, 0.345098, 1, 1,
0.3111781, -0.6937932, 2.267339, 0, 0.3411765, 1, 1,
0.3153832, 1.204035, 3.64167, 0, 0.3333333, 1, 1,
0.3263063, -0.2983279, 3.199703, 0, 0.3294118, 1, 1,
0.3314491, 0.005075304, 1.142621, 0, 0.3215686, 1, 1,
0.3316392, -0.4036225, 4.208578, 0, 0.3176471, 1, 1,
0.3326745, -0.163267, 1.203086, 0, 0.3098039, 1, 1,
0.335214, 0.7536631, 0.9333891, 0, 0.3058824, 1, 1,
0.3374003, -0.5466241, 1.362447, 0, 0.2980392, 1, 1,
0.3383602, 0.2682675, 1.832183, 0, 0.2901961, 1, 1,
0.3388746, 0.3737682, -0.4503065, 0, 0.2862745, 1, 1,
0.34215, -0.1532609, 1.045129, 0, 0.2784314, 1, 1,
0.342543, 1.37401, -0.841083, 0, 0.2745098, 1, 1,
0.3431555, -0.6440939, 3.262681, 0, 0.2666667, 1, 1,
0.3444144, 1.228296, 0.3069701, 0, 0.2627451, 1, 1,
0.3456026, 0.9807022, 0.6334539, 0, 0.254902, 1, 1,
0.3466144, -0.3185472, 0.6609707, 0, 0.2509804, 1, 1,
0.3476515, 0.1607432, 0.6292608, 0, 0.2431373, 1, 1,
0.3498361, 2.301371, 0.497756, 0, 0.2392157, 1, 1,
0.3563453, 1.645621, 0.5691951, 0, 0.2313726, 1, 1,
0.3600512, 0.3493103, 0.540718, 0, 0.227451, 1, 1,
0.3620695, 0.5432376, 1.286911, 0, 0.2196078, 1, 1,
0.3633684, -1.051726, 2.463671, 0, 0.2156863, 1, 1,
0.3652618, -0.04217786, 2.984269, 0, 0.2078431, 1, 1,
0.3724566, 1.730191, 1.506637, 0, 0.2039216, 1, 1,
0.3745623, 0.7823756, 1.301133, 0, 0.1960784, 1, 1,
0.37857, -1.04679, 3.934214, 0, 0.1882353, 1, 1,
0.3823892, 1.483148, 0.6414371, 0, 0.1843137, 1, 1,
0.3840403, 0.2629513, -0.4172405, 0, 0.1764706, 1, 1,
0.3879775, 1.777435, 0.7434586, 0, 0.172549, 1, 1,
0.3883868, -0.3553407, 1.157238, 0, 0.1647059, 1, 1,
0.3918664, 0.9791035, 0.2288681, 0, 0.1607843, 1, 1,
0.3951728, -1.126444, 3.848529, 0, 0.1529412, 1, 1,
0.3961939, -2.113815, 1.89589, 0, 0.1490196, 1, 1,
0.3963238, 1.187978, 0.8244702, 0, 0.1411765, 1, 1,
0.4022877, -0.5248533, 1.453383, 0, 0.1372549, 1, 1,
0.404579, 1.800178, 0.7102978, 0, 0.1294118, 1, 1,
0.4063426, 0.3339824, 1.006495, 0, 0.1254902, 1, 1,
0.4123858, -1.125247, 3.440826, 0, 0.1176471, 1, 1,
0.41607, 0.4363937, 0.3078967, 0, 0.1137255, 1, 1,
0.4170533, -0.8877093, 3.863733, 0, 0.1058824, 1, 1,
0.4177605, 1.333845, -0.9637893, 0, 0.09803922, 1, 1,
0.4187113, -1.503642, 2.321286, 0, 0.09411765, 1, 1,
0.4199926, -0.01024349, 1.871685, 0, 0.08627451, 1, 1,
0.4237754, 1.126561, -0.01340075, 0, 0.08235294, 1, 1,
0.4241993, -0.9950467, 5.020412, 0, 0.07450981, 1, 1,
0.425172, 0.02803703, 0.5258082, 0, 0.07058824, 1, 1,
0.4256617, 1.23608, 1.04884, 0, 0.0627451, 1, 1,
0.427303, -0.8822147, 3.23082, 0, 0.05882353, 1, 1,
0.4297464, -0.2068563, 2.408845, 0, 0.05098039, 1, 1,
0.4312297, -0.02242385, 2.688628, 0, 0.04705882, 1, 1,
0.4328339, 0.1473461, 1.71017, 0, 0.03921569, 1, 1,
0.4339653, 0.3362363, 1.104921, 0, 0.03529412, 1, 1,
0.4441376, -1.575028, 1.795383, 0, 0.02745098, 1, 1,
0.4458265, 1.115426, -0.4684957, 0, 0.02352941, 1, 1,
0.448039, -2.289836, 1.491327, 0, 0.01568628, 1, 1,
0.4511781, -0.9676847, 2.402531, 0, 0.01176471, 1, 1,
0.4540421, 0.9107229, -1.288071, 0, 0.003921569, 1, 1,
0.4574311, 0.7612275, 0.2443412, 0.003921569, 0, 1, 1,
0.4578522, 0.2762106, 0.8048189, 0.007843138, 0, 1, 1,
0.4604022, -2.174998, 4.763156, 0.01568628, 0, 1, 1,
0.4636954, 0.440637, -0.6844794, 0.01960784, 0, 1, 1,
0.4698735, 0.6256057, -0.08681198, 0.02745098, 0, 1, 1,
0.4700598, -0.4246421, 2.528509, 0.03137255, 0, 1, 1,
0.4723329, -0.5539235, 2.247428, 0.03921569, 0, 1, 1,
0.4726578, -0.3166869, 1.850025, 0.04313726, 0, 1, 1,
0.4727485, -0.5241995, 2.668989, 0.05098039, 0, 1, 1,
0.4765493, 0.8134376, -0.1739059, 0.05490196, 0, 1, 1,
0.4771878, -0.1129691, 1.752018, 0.0627451, 0, 1, 1,
0.4794388, 1.014319, 1.60148, 0.06666667, 0, 1, 1,
0.4822644, 0.6297999, -0.2862674, 0.07450981, 0, 1, 1,
0.4839991, 1.181709, 1.546669, 0.07843138, 0, 1, 1,
0.4874663, -0.1512741, 0.8896295, 0.08627451, 0, 1, 1,
0.4896685, 1.04918, 2.055129, 0.09019608, 0, 1, 1,
0.4913597, -0.2830365, 2.989676, 0.09803922, 0, 1, 1,
0.4986616, -0.1613086, 0.3720943, 0.1058824, 0, 1, 1,
0.5001956, 0.3902338, -0.4057734, 0.1098039, 0, 1, 1,
0.501343, 0.1162294, 2.089819, 0.1176471, 0, 1, 1,
0.5040053, -0.8878044, 2.820027, 0.1215686, 0, 1, 1,
0.5085697, -1.569338, 2.989742, 0.1294118, 0, 1, 1,
0.5112289, -1.824089, 4.971212, 0.1333333, 0, 1, 1,
0.512589, 1.815839, 0.376135, 0.1411765, 0, 1, 1,
0.5136147, -0.4629799, 1.756427, 0.145098, 0, 1, 1,
0.5167357, 0.3289062, 0.1321154, 0.1529412, 0, 1, 1,
0.5176913, 0.1188086, 1.894983, 0.1568628, 0, 1, 1,
0.5178894, 0.7504247, 2.64298, 0.1647059, 0, 1, 1,
0.5179341, 1.365857, 0.04194866, 0.1686275, 0, 1, 1,
0.5189054, 0.2393901, 1.677809, 0.1764706, 0, 1, 1,
0.5192165, 1.678105, -0.4045991, 0.1803922, 0, 1, 1,
0.5195256, 0.9952728, -0.1433928, 0.1882353, 0, 1, 1,
0.5216832, 0.1857628, 1.207873, 0.1921569, 0, 1, 1,
0.5230865, -0.8637754, 2.624289, 0.2, 0, 1, 1,
0.5249511, -1.204226, 3.316984, 0.2078431, 0, 1, 1,
0.5296144, -1.882951, 6.406801, 0.2117647, 0, 1, 1,
0.5377409, 0.3232298, -0.448614, 0.2196078, 0, 1, 1,
0.5381913, -1.568331, 2.70429, 0.2235294, 0, 1, 1,
0.5392618, 0.1026646, 0.1665001, 0.2313726, 0, 1, 1,
0.539848, -1.194778, 2.543659, 0.2352941, 0, 1, 1,
0.541505, 1.048889, 2.052766, 0.2431373, 0, 1, 1,
0.542078, -2.611054, 3.627385, 0.2470588, 0, 1, 1,
0.543448, 1.711269, 0.9811216, 0.254902, 0, 1, 1,
0.5490259, 2.474281, 0.008825605, 0.2588235, 0, 1, 1,
0.5501482, 1.905664, 0.08374903, 0.2666667, 0, 1, 1,
0.5506095, -0.4626499, 2.984331, 0.2705882, 0, 1, 1,
0.5571048, 0.2392933, 1.394199, 0.2784314, 0, 1, 1,
0.5582857, -0.6210586, 2.350915, 0.282353, 0, 1, 1,
0.561195, -0.4618558, 3.2892, 0.2901961, 0, 1, 1,
0.562386, -1.877141, 3.211078, 0.2941177, 0, 1, 1,
0.5642037, -0.7360318, 3.049506, 0.3019608, 0, 1, 1,
0.5649142, 0.7824849, 0.8540764, 0.3098039, 0, 1, 1,
0.5690523, 0.3434963, 0.3790596, 0.3137255, 0, 1, 1,
0.5739742, -0.8366776, 1.965253, 0.3215686, 0, 1, 1,
0.576864, -1.010712, 1.927798, 0.3254902, 0, 1, 1,
0.5809767, 0.05583486, 1.044791, 0.3333333, 0, 1, 1,
0.5834282, 0.8504493, -0.2311079, 0.3372549, 0, 1, 1,
0.5850434, -0.3714837, 2.932586, 0.345098, 0, 1, 1,
0.5928583, 1.027696, 0.2709318, 0.3490196, 0, 1, 1,
0.5997077, -0.9710382, 2.098909, 0.3568628, 0, 1, 1,
0.600437, 0.1680967, -0.747842, 0.3607843, 0, 1, 1,
0.6016098, -0.4234506, 0.8550816, 0.3686275, 0, 1, 1,
0.6023924, -0.741654, 1.119887, 0.372549, 0, 1, 1,
0.6033523, -1.035053, 3.143874, 0.3803922, 0, 1, 1,
0.6062944, 1.709522, 1.130207, 0.3843137, 0, 1, 1,
0.6072803, -1.063464, 3.611577, 0.3921569, 0, 1, 1,
0.6132806, 0.216456, -0.2116645, 0.3960784, 0, 1, 1,
0.614632, -2.624012, 3.623244, 0.4039216, 0, 1, 1,
0.617821, 0.8180124, -1.041167, 0.4117647, 0, 1, 1,
0.6182929, 0.6777081, 0.7566791, 0.4156863, 0, 1, 1,
0.6237231, 1.2248, 0.3781991, 0.4235294, 0, 1, 1,
0.6329502, -0.8847852, 4.478878, 0.427451, 0, 1, 1,
0.6338488, -0.5157747, 3.029629, 0.4352941, 0, 1, 1,
0.6356242, 0.1569154, 2.260403, 0.4392157, 0, 1, 1,
0.6373338, -0.9182854, 3.201826, 0.4470588, 0, 1, 1,
0.6393017, 0.07581826, 1.134492, 0.4509804, 0, 1, 1,
0.6406024, -0.1129049, 0.9844149, 0.4588235, 0, 1, 1,
0.6422797, 0.4873524, 0.7166561, 0.4627451, 0, 1, 1,
0.6445171, -1.09733, 4.183579, 0.4705882, 0, 1, 1,
0.6460276, -0.2504546, 2.428572, 0.4745098, 0, 1, 1,
0.6498837, 1.929108, 1.01559, 0.4823529, 0, 1, 1,
0.6508616, 1.535027, -0.02873357, 0.4862745, 0, 1, 1,
0.6573647, -1.086389, 2.806959, 0.4941176, 0, 1, 1,
0.6582868, 1.13523, -0.4262713, 0.5019608, 0, 1, 1,
0.6598926, 0.1914828, 1.498273, 0.5058824, 0, 1, 1,
0.6615993, 1.219861, 0.8596576, 0.5137255, 0, 1, 1,
0.6647683, 0.5548936, 1.166962, 0.5176471, 0, 1, 1,
0.6726373, -0.7586072, 1.346749, 0.5254902, 0, 1, 1,
0.6739597, 0.03334487, 2.070192, 0.5294118, 0, 1, 1,
0.6805211, -2.015556, 3.580259, 0.5372549, 0, 1, 1,
0.6814227, -0.7707251, 2.26181, 0.5411765, 0, 1, 1,
0.6967033, -0.4194897, 2.645259, 0.5490196, 0, 1, 1,
0.6975584, -0.4367161, 3.066959, 0.5529412, 0, 1, 1,
0.6978754, 0.0386435, 2.768582, 0.5607843, 0, 1, 1,
0.7036598, 0.3844905, 0.9749183, 0.5647059, 0, 1, 1,
0.7125318, 0.6531129, 0.1037655, 0.572549, 0, 1, 1,
0.7145987, -1.75025, 2.72304, 0.5764706, 0, 1, 1,
0.7210113, 0.470405, -1.104183, 0.5843138, 0, 1, 1,
0.7213346, 1.51704, -0.1026295, 0.5882353, 0, 1, 1,
0.7237923, -0.5859584, 1.208537, 0.5960785, 0, 1, 1,
0.7265531, -0.04606146, 2.863092, 0.6039216, 0, 1, 1,
0.7309155, 0.8691154, 1.212436, 0.6078432, 0, 1, 1,
0.7390797, -0.3792432, -0.015991, 0.6156863, 0, 1, 1,
0.7425647, 0.8854706, 2.168844, 0.6196079, 0, 1, 1,
0.7523695, -0.8592808, 3.002937, 0.627451, 0, 1, 1,
0.752798, -1.341177, 1.583853, 0.6313726, 0, 1, 1,
0.7550878, 1.670845, -0.2278602, 0.6392157, 0, 1, 1,
0.7574359, 1.232156, 1.104351, 0.6431373, 0, 1, 1,
0.7575089, 1.121816, -0.7856541, 0.6509804, 0, 1, 1,
0.7599645, -0.5702547, 1.913058, 0.654902, 0, 1, 1,
0.7643968, -0.6462364, 2.153449, 0.6627451, 0, 1, 1,
0.7655692, 0.5693609, 1.686699, 0.6666667, 0, 1, 1,
0.7692201, 0.3094252, 0.8045053, 0.6745098, 0, 1, 1,
0.7709174, 0.07934456, 1.543316, 0.6784314, 0, 1, 1,
0.7762334, 1.679453, -0.06352324, 0.6862745, 0, 1, 1,
0.7782162, 0.03087873, 1.707287, 0.6901961, 0, 1, 1,
0.7811879, 0.2667386, 2.642073, 0.6980392, 0, 1, 1,
0.7859869, 1.122746, 0.4905219, 0.7058824, 0, 1, 1,
0.7879893, 0.7190827, 2.206688, 0.7098039, 0, 1, 1,
0.7905161, -1.259218, 3.281207, 0.7176471, 0, 1, 1,
0.7958314, -0.1406563, 0.9453316, 0.7215686, 0, 1, 1,
0.7965311, 0.6477066, 1.918627, 0.7294118, 0, 1, 1,
0.8024023, -2.069617, 5.002573, 0.7333333, 0, 1, 1,
0.8101789, 0.8860026, -0.4529839, 0.7411765, 0, 1, 1,
0.8217884, 0.4812793, 1.314413, 0.7450981, 0, 1, 1,
0.822714, -0.5549134, 2.363689, 0.7529412, 0, 1, 1,
0.8235514, 0.5613853, 1.292105, 0.7568628, 0, 1, 1,
0.8241709, -0.9452168, 3.780052, 0.7647059, 0, 1, 1,
0.8281646, -1.400073, 2.332694, 0.7686275, 0, 1, 1,
0.8303123, -0.8819058, 2.337819, 0.7764706, 0, 1, 1,
0.8328761, -0.8708214, 4.324844, 0.7803922, 0, 1, 1,
0.8381739, 0.2824417, 1.054346, 0.7882353, 0, 1, 1,
0.8388724, 1.613869, 0.8922536, 0.7921569, 0, 1, 1,
0.840126, 0.8833911, 0.8906835, 0.8, 0, 1, 1,
0.8467839, 0.1405857, 0.5793329, 0.8078431, 0, 1, 1,
0.8470296, -1.002918, 1.763729, 0.8117647, 0, 1, 1,
0.847078, 0.4307602, 0.8149105, 0.8196079, 0, 1, 1,
0.8476905, 0.7619122, 1.372772, 0.8235294, 0, 1, 1,
0.8484944, 0.2888287, 2.061373, 0.8313726, 0, 1, 1,
0.8511705, 0.9395694, 0.5570516, 0.8352941, 0, 1, 1,
0.8628779, 0.3898987, 1.20252, 0.8431373, 0, 1, 1,
0.8657331, 1.116724, -0.8400749, 0.8470588, 0, 1, 1,
0.8693764, -0.07674771, 2.571645, 0.854902, 0, 1, 1,
0.8765321, 0.8156849, 1.105875, 0.8588235, 0, 1, 1,
0.8773603, 0.1420399, 1.357737, 0.8666667, 0, 1, 1,
0.8821925, -0.08350156, 2.528223, 0.8705882, 0, 1, 1,
0.883067, -0.5073214, 2.798888, 0.8784314, 0, 1, 1,
0.8865136, -2.488741, 3.927848, 0.8823529, 0, 1, 1,
0.8871607, 1.498741, 0.2853343, 0.8901961, 0, 1, 1,
0.8877416, -0.213294, 0.9155421, 0.8941177, 0, 1, 1,
0.892729, -2.184851, 1.484189, 0.9019608, 0, 1, 1,
0.8967795, 1.403372, 1.16117, 0.9098039, 0, 1, 1,
0.8995603, 0.4784767, 0.7826369, 0.9137255, 0, 1, 1,
0.9011025, -0.3412592, 2.465732, 0.9215686, 0, 1, 1,
0.90149, 0.2601959, 2.025829, 0.9254902, 0, 1, 1,
0.9026378, 0.2379805, 0.4109958, 0.9333333, 0, 1, 1,
0.9035296, 0.8162299, 1.280469, 0.9372549, 0, 1, 1,
0.9106243, 1.153122, 0.01483857, 0.945098, 0, 1, 1,
0.9155286, -0.9965396, 3.104586, 0.9490196, 0, 1, 1,
0.9161158, 0.09889156, 2.206075, 0.9568627, 0, 1, 1,
0.9194998, 0.4841766, 1.904434, 0.9607843, 0, 1, 1,
0.9227875, 0.2474023, 1.975046, 0.9686275, 0, 1, 1,
0.9279022, 1.496389, 1.013365, 0.972549, 0, 1, 1,
0.9316095, -0.7845468, 2.019845, 0.9803922, 0, 1, 1,
0.9406103, -1.372935, 2.749754, 0.9843137, 0, 1, 1,
0.9497601, 0.9290211, 0.5670439, 0.9921569, 0, 1, 1,
0.9604362, 0.6547235, -0.4110337, 0.9960784, 0, 1, 1,
0.963931, 0.1413544, 0.7261969, 1, 0, 0.9960784, 1,
0.9657146, 0.3711444, -0.3754536, 1, 0, 0.9882353, 1,
0.9658871, -0.3171941, 0.3302198, 1, 0, 0.9843137, 1,
0.9686249, 1.608572, 0.2914458, 1, 0, 0.9764706, 1,
0.9697608, 1.034486, -0.2861992, 1, 0, 0.972549, 1,
0.971684, 0.05073256, 0.9071794, 1, 0, 0.9647059, 1,
0.9744766, -0.7300225, 0.09348217, 1, 0, 0.9607843, 1,
0.9759436, 0.1920908, 1.946598, 1, 0, 0.9529412, 1,
0.9772372, -0.2438311, 2.054001, 1, 0, 0.9490196, 1,
0.9838369, 0.1656482, 0.809248, 1, 0, 0.9411765, 1,
0.9859776, -0.1672046, 1.502376, 1, 0, 0.9372549, 1,
0.9930777, -1.087883, 3.311861, 1, 0, 0.9294118, 1,
0.9965689, -0.3340823, 3.219517, 1, 0, 0.9254902, 1,
1.001099, -1.767609, 3.890446, 1, 0, 0.9176471, 1,
1.0022, 0.8076946, 2.069008, 1, 0, 0.9137255, 1,
1.006199, -1.094754, 3.717404, 1, 0, 0.9058824, 1,
1.01149, 0.4005074, 1.140028, 1, 0, 0.9019608, 1,
1.01279, -0.6158397, 1.950525, 1, 0, 0.8941177, 1,
1.013807, -2.541378, 1.798659, 1, 0, 0.8862745, 1,
1.016399, 0.2386546, 0.4190605, 1, 0, 0.8823529, 1,
1.016437, -0.7169423, 1.715491, 1, 0, 0.8745098, 1,
1.018445, 0.6783395, 0.9670381, 1, 0, 0.8705882, 1,
1.019652, -1.029827, 2.579686, 1, 0, 0.8627451, 1,
1.025201, -1.213274, 1.887813, 1, 0, 0.8588235, 1,
1.026362, 0.8396521, 2.117285, 1, 0, 0.8509804, 1,
1.027446, 0.3842255, -0.3662748, 1, 0, 0.8470588, 1,
1.040987, -0.872121, 4.287686, 1, 0, 0.8392157, 1,
1.042013, -0.1160132, 1.333942, 1, 0, 0.8352941, 1,
1.042707, 0.5119026, -1.001753, 1, 0, 0.827451, 1,
1.048632, 1.4628, 1.522975, 1, 0, 0.8235294, 1,
1.060538, 0.08595417, 0.1497661, 1, 0, 0.8156863, 1,
1.078297, -0.5944456, 1.552197, 1, 0, 0.8117647, 1,
1.087088, 1.062584, 0.4336693, 1, 0, 0.8039216, 1,
1.087657, 1.354955, 1.737654, 1, 0, 0.7960784, 1,
1.088113, 1.101197, 0.9802387, 1, 0, 0.7921569, 1,
1.089571, 0.09875036, 0.4993493, 1, 0, 0.7843137, 1,
1.089623, 0.1556798, 0.6226391, 1, 0, 0.7803922, 1,
1.092289, -0.6623004, 0.2068271, 1, 0, 0.772549, 1,
1.10065, 0.1272252, 1.450132, 1, 0, 0.7686275, 1,
1.110419, -0.2996112, 2.520695, 1, 0, 0.7607843, 1,
1.117453, -1.43273, 1.837647, 1, 0, 0.7568628, 1,
1.122884, -0.005973483, 2.48728, 1, 0, 0.7490196, 1,
1.132093, 0.1496143, 2.765791, 1, 0, 0.7450981, 1,
1.134462, -0.4220151, 1.451185, 1, 0, 0.7372549, 1,
1.14236, -0.2514628, 3.481575, 1, 0, 0.7333333, 1,
1.155482, 0.9119531, 0.6405478, 1, 0, 0.7254902, 1,
1.160547, -1.520449, 2.079829, 1, 0, 0.7215686, 1,
1.166288, 0.5951363, 1.332992, 1, 0, 0.7137255, 1,
1.177206, -0.3211148, 2.341955, 1, 0, 0.7098039, 1,
1.181601, -1.498613, 3.110242, 1, 0, 0.7019608, 1,
1.185678, 0.4584618, 1.682634, 1, 0, 0.6941177, 1,
1.185761, 1.743308, 0.3506379, 1, 0, 0.6901961, 1,
1.208836, 0.1126136, 2.46379, 1, 0, 0.682353, 1,
1.221287, -0.1874695, 1.726889, 1, 0, 0.6784314, 1,
1.227552, 0.260648, 0.881227, 1, 0, 0.6705883, 1,
1.23098, -1.933553, 2.684874, 1, 0, 0.6666667, 1,
1.233684, -0.6695015, 3.706647, 1, 0, 0.6588235, 1,
1.238517, 1.649798, 0.2639406, 1, 0, 0.654902, 1,
1.238659, 0.8168639, 0.8284086, 1, 0, 0.6470588, 1,
1.23995, 2.158811, 0.25572, 1, 0, 0.6431373, 1,
1.249573, -0.3473351, 2.486586, 1, 0, 0.6352941, 1,
1.258786, 0.3405891, 2.082276, 1, 0, 0.6313726, 1,
1.27374, -0.810252, 2.231949, 1, 0, 0.6235294, 1,
1.282168, 1.019566, 2.654522, 1, 0, 0.6196079, 1,
1.288258, -0.2907966, 1.592317, 1, 0, 0.6117647, 1,
1.293187, -1.417571, 1.834035, 1, 0, 0.6078432, 1,
1.29327, 0.5132468, 1.489451, 1, 0, 0.6, 1,
1.295781, -0.05957251, 1.355887, 1, 0, 0.5921569, 1,
1.296212, -0.8764687, 1.134345, 1, 0, 0.5882353, 1,
1.299984, -2.105491, 3.6674, 1, 0, 0.5803922, 1,
1.302144, 1.120896, 1.915093, 1, 0, 0.5764706, 1,
1.307187, 0.9033116, -0.1794508, 1, 0, 0.5686275, 1,
1.310969, 1.330947, 0.7348006, 1, 0, 0.5647059, 1,
1.325841, -1.564484, 2.35128, 1, 0, 0.5568628, 1,
1.32692, -1.018449, 3.666195, 1, 0, 0.5529412, 1,
1.329611, -1.888889, 2.662569, 1, 0, 0.5450981, 1,
1.334162, 1.537374, 1.320286, 1, 0, 0.5411765, 1,
1.345462, 0.3550398, 3.060291, 1, 0, 0.5333334, 1,
1.36051, 1.2623, 0.4830716, 1, 0, 0.5294118, 1,
1.364601, -0.4228854, 0.1058408, 1, 0, 0.5215687, 1,
1.371155, 0.4740449, 0.3897855, 1, 0, 0.5176471, 1,
1.381239, 1.296237, 0.6799273, 1, 0, 0.509804, 1,
1.382154, 0.6365179, -0.75321, 1, 0, 0.5058824, 1,
1.384905, 0.7007183, 0.9913641, 1, 0, 0.4980392, 1,
1.385181, 0.3586093, 0.7596141, 1, 0, 0.4901961, 1,
1.403084, -1.936294, 2.207734, 1, 0, 0.4862745, 1,
1.404838, -0.4626206, 0.7936888, 1, 0, 0.4784314, 1,
1.406996, -0.2742401, 0.7544659, 1, 0, 0.4745098, 1,
1.411106, -0.9740777, 2.597533, 1, 0, 0.4666667, 1,
1.42302, 0.8606437, 1.925889, 1, 0, 0.4627451, 1,
1.424571, -0.3243819, 2.725907, 1, 0, 0.454902, 1,
1.437395, -0.4270438, 1.50545, 1, 0, 0.4509804, 1,
1.454178, 0.0797732, 1.539659, 1, 0, 0.4431373, 1,
1.460602, -0.3172234, 2.128267, 1, 0, 0.4392157, 1,
1.465873, 0.3440434, -0.4306836, 1, 0, 0.4313726, 1,
1.473932, -0.8689187, 2.485986, 1, 0, 0.427451, 1,
1.477863, 1.405717, 0.093601, 1, 0, 0.4196078, 1,
1.485204, 0.7831042, 1.651635, 1, 0, 0.4156863, 1,
1.502081, 0.5417655, 0.6826663, 1, 0, 0.4078431, 1,
1.502093, -1.492599, 2.343471, 1, 0, 0.4039216, 1,
1.503747, 0.1101501, -0.3128345, 1, 0, 0.3960784, 1,
1.505281, -0.1344081, 3.702212, 1, 0, 0.3882353, 1,
1.505836, 1.794061, 1.10696, 1, 0, 0.3843137, 1,
1.518383, 0.4245281, 0.7343291, 1, 0, 0.3764706, 1,
1.523756, 1.279182, 0.4630008, 1, 0, 0.372549, 1,
1.5359, 0.2188989, 2.084896, 1, 0, 0.3647059, 1,
1.545886, -0.1160689, 0.401655, 1, 0, 0.3607843, 1,
1.561873, 1.696906, 0.9450939, 1, 0, 0.3529412, 1,
1.565731, 1.825666, -0.3383151, 1, 0, 0.3490196, 1,
1.565735, 1.102906, 0.495259, 1, 0, 0.3411765, 1,
1.572155, -1.102021, 1.221795, 1, 0, 0.3372549, 1,
1.574547, -0.7730485, 0.5078438, 1, 0, 0.3294118, 1,
1.582895, -0.183717, 1.125106, 1, 0, 0.3254902, 1,
1.583025, -0.05464953, 1.815086, 1, 0, 0.3176471, 1,
1.598062, -1.517739, 1.407489, 1, 0, 0.3137255, 1,
1.599857, 1.119423, 1.024005, 1, 0, 0.3058824, 1,
1.608144, 2.646348, -1.45731, 1, 0, 0.2980392, 1,
1.611305, -0.9620064, 1.743854, 1, 0, 0.2941177, 1,
1.611924, 0.7238294, 2.654398, 1, 0, 0.2862745, 1,
1.620692, 1.465463, 1.492748, 1, 0, 0.282353, 1,
1.623646, -0.7514554, 2.92666, 1, 0, 0.2745098, 1,
1.628058, 1.56658, 1.247252, 1, 0, 0.2705882, 1,
1.654841, -0.1509332, 1.618061, 1, 0, 0.2627451, 1,
1.687974, -2.108735, 2.813008, 1, 0, 0.2588235, 1,
1.712674, 1.076801, 0.4781568, 1, 0, 0.2509804, 1,
1.757798, -0.4795065, 1.661603, 1, 0, 0.2470588, 1,
1.761544, -1.015336, 1.565986, 1, 0, 0.2392157, 1,
1.780617, 0.4053359, 1.035697, 1, 0, 0.2352941, 1,
1.787316, -0.05678768, -0.4113423, 1, 0, 0.227451, 1,
1.805506, 1.628383, 0.7450367, 1, 0, 0.2235294, 1,
1.811402, -0.1957869, 1.247354, 1, 0, 0.2156863, 1,
1.827708, 0.3853823, 1.459263, 1, 0, 0.2117647, 1,
1.848672, 1.375012, 3.226056, 1, 0, 0.2039216, 1,
1.858797, 0.1044302, 2.222526, 1, 0, 0.1960784, 1,
1.859002, -1.071842, 2.694957, 1, 0, 0.1921569, 1,
1.884523, 1.266777, 0.5315894, 1, 0, 0.1843137, 1,
1.93775, -1.350276, 4.471733, 1, 0, 0.1803922, 1,
1.950665, 0.3655446, 0.9289449, 1, 0, 0.172549, 1,
1.957121, 1.508769, 2.618563, 1, 0, 0.1686275, 1,
1.964259, -0.706059, 0.7098205, 1, 0, 0.1607843, 1,
1.986112, -0.1702912, 3.03769, 1, 0, 0.1568628, 1,
2.017381, -1.921565, 1.971666, 1, 0, 0.1490196, 1,
2.044159, -0.7065369, 3.668994, 1, 0, 0.145098, 1,
2.059515, -0.04120458, 1.515918, 1, 0, 0.1372549, 1,
2.181344, 1.462109, -0.005810859, 1, 0, 0.1333333, 1,
2.192107, -0.7749621, 2.611942, 1, 0, 0.1254902, 1,
2.214354, 0.3150633, 0.732572, 1, 0, 0.1215686, 1,
2.232208, -0.288639, 1.947333, 1, 0, 0.1137255, 1,
2.286052, -0.7991599, 1.884021, 1, 0, 0.1098039, 1,
2.303182, 1.321548, 2.208014, 1, 0, 0.1019608, 1,
2.307673, 0.4035845, 1.505137, 1, 0, 0.09411765, 1,
2.318796, 1.680335, 1.300628, 1, 0, 0.09019608, 1,
2.331696, 0.8561324, 1.587735, 1, 0, 0.08235294, 1,
2.344779, 0.4887184, 1.536775, 1, 0, 0.07843138, 1,
2.356588, -1.56838, 1.240095, 1, 0, 0.07058824, 1,
2.391971, -0.6084026, 0.6800942, 1, 0, 0.06666667, 1,
2.426155, 0.07772221, 2.147603, 1, 0, 0.05882353, 1,
2.453137, 0.6605667, 2.620628, 1, 0, 0.05490196, 1,
2.596056, -1.390027, 3.960439, 1, 0, 0.04705882, 1,
2.644352, -1.054583, 1.464756, 1, 0, 0.04313726, 1,
2.685838, 0.1060909, 1.910161, 1, 0, 0.03529412, 1,
2.812793, -0.8150802, 1.385163, 1, 0, 0.03137255, 1,
3.010117, 2.133088, 1.215057, 1, 0, 0.02352941, 1,
3.080797, -1.798634, 5.23725, 1, 0, 0.01960784, 1,
3.375825, -2.87917, 5.187717, 1, 0, 0.01176471, 1,
3.579772, 0.2931637, 0.4955037, 1, 0, 0.007843138, 1
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
0.04163527, -4.814672, -7.266435, 0, -0.5, 0.5, 0.5,
0.04163527, -4.814672, -7.266435, 1, -0.5, 0.5, 0.5,
0.04163527, -4.814672, -7.266435, 1, 1.5, 0.5, 0.5,
0.04163527, -4.814672, -7.266435, 0, 1.5, 0.5, 0.5
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
-4.69593, -0.4491669, -7.266435, 0, -0.5, 0.5, 0.5,
-4.69593, -0.4491669, -7.266435, 1, -0.5, 0.5, 0.5,
-4.69593, -0.4491669, -7.266435, 1, 1.5, 0.5, 0.5,
-4.69593, -0.4491669, -7.266435, 0, 1.5, 0.5, 0.5
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
-4.69593, -4.814672, 0.5610394, 0, -0.5, 0.5, 0.5,
-4.69593, -4.814672, 0.5610394, 1, -0.5, 0.5, 0.5,
-4.69593, -4.814672, 0.5610394, 1, 1.5, 0.5, 0.5,
-4.69593, -4.814672, 0.5610394, 0, 1.5, 0.5, 0.5
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
-2, -3.807248, -5.460094,
2, -3.807248, -5.460094,
-2, -3.807248, -5.460094,
-2, -3.975152, -5.761151,
0, -3.807248, -5.460094,
0, -3.975152, -5.761151,
2, -3.807248, -5.460094,
2, -3.975152, -5.761151
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
-2, -4.31096, -6.363265, 0, -0.5, 0.5, 0.5,
-2, -4.31096, -6.363265, 1, -0.5, 0.5, 0.5,
-2, -4.31096, -6.363265, 1, 1.5, 0.5, 0.5,
-2, -4.31096, -6.363265, 0, 1.5, 0.5, 0.5,
0, -4.31096, -6.363265, 0, -0.5, 0.5, 0.5,
0, -4.31096, -6.363265, 1, -0.5, 0.5, 0.5,
0, -4.31096, -6.363265, 1, 1.5, 0.5, 0.5,
0, -4.31096, -6.363265, 0, 1.5, 0.5, 0.5,
2, -4.31096, -6.363265, 0, -0.5, 0.5, 0.5,
2, -4.31096, -6.363265, 1, -0.5, 0.5, 0.5,
2, -4.31096, -6.363265, 1, 1.5, 0.5, 0.5,
2, -4.31096, -6.363265, 0, 1.5, 0.5, 0.5
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
-3.602646, -3, -5.460094,
-3.602646, 2, -5.460094,
-3.602646, -3, -5.460094,
-3.78486, -3, -5.761151,
-3.602646, -2, -5.460094,
-3.78486, -2, -5.761151,
-3.602646, -1, -5.460094,
-3.78486, -1, -5.761151,
-3.602646, 0, -5.460094,
-3.78486, 0, -5.761151,
-3.602646, 1, -5.460094,
-3.78486, 1, -5.761151,
-3.602646, 2, -5.460094,
-3.78486, 2, -5.761151
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
-4.149288, -3, -6.363265, 0, -0.5, 0.5, 0.5,
-4.149288, -3, -6.363265, 1, -0.5, 0.5, 0.5,
-4.149288, -3, -6.363265, 1, 1.5, 0.5, 0.5,
-4.149288, -3, -6.363265, 0, 1.5, 0.5, 0.5,
-4.149288, -2, -6.363265, 0, -0.5, 0.5, 0.5,
-4.149288, -2, -6.363265, 1, -0.5, 0.5, 0.5,
-4.149288, -2, -6.363265, 1, 1.5, 0.5, 0.5,
-4.149288, -2, -6.363265, 0, 1.5, 0.5, 0.5,
-4.149288, -1, -6.363265, 0, -0.5, 0.5, 0.5,
-4.149288, -1, -6.363265, 1, -0.5, 0.5, 0.5,
-4.149288, -1, -6.363265, 1, 1.5, 0.5, 0.5,
-4.149288, -1, -6.363265, 0, 1.5, 0.5, 0.5,
-4.149288, 0, -6.363265, 0, -0.5, 0.5, 0.5,
-4.149288, 0, -6.363265, 1, -0.5, 0.5, 0.5,
-4.149288, 0, -6.363265, 1, 1.5, 0.5, 0.5,
-4.149288, 0, -6.363265, 0, 1.5, 0.5, 0.5,
-4.149288, 1, -6.363265, 0, -0.5, 0.5, 0.5,
-4.149288, 1, -6.363265, 1, -0.5, 0.5, 0.5,
-4.149288, 1, -6.363265, 1, 1.5, 0.5, 0.5,
-4.149288, 1, -6.363265, 0, 1.5, 0.5, 0.5,
-4.149288, 2, -6.363265, 0, -0.5, 0.5, 0.5,
-4.149288, 2, -6.363265, 1, -0.5, 0.5, 0.5,
-4.149288, 2, -6.363265, 1, 1.5, 0.5, 0.5,
-4.149288, 2, -6.363265, 0, 1.5, 0.5, 0.5
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
-3.602646, -3.807248, -4,
-3.602646, -3.807248, 6,
-3.602646, -3.807248, -4,
-3.78486, -3.975152, -4,
-3.602646, -3.807248, -2,
-3.78486, -3.975152, -2,
-3.602646, -3.807248, 0,
-3.78486, -3.975152, 0,
-3.602646, -3.807248, 2,
-3.78486, -3.975152, 2,
-3.602646, -3.807248, 4,
-3.78486, -3.975152, 4,
-3.602646, -3.807248, 6,
-3.78486, -3.975152, 6
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
"4",
"6"
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
-4.149288, -4.31096, -4, 0, -0.5, 0.5, 0.5,
-4.149288, -4.31096, -4, 1, -0.5, 0.5, 0.5,
-4.149288, -4.31096, -4, 1, 1.5, 0.5, 0.5,
-4.149288, -4.31096, -4, 0, 1.5, 0.5, 0.5,
-4.149288, -4.31096, -2, 0, -0.5, 0.5, 0.5,
-4.149288, -4.31096, -2, 1, -0.5, 0.5, 0.5,
-4.149288, -4.31096, -2, 1, 1.5, 0.5, 0.5,
-4.149288, -4.31096, -2, 0, 1.5, 0.5, 0.5,
-4.149288, -4.31096, 0, 0, -0.5, 0.5, 0.5,
-4.149288, -4.31096, 0, 1, -0.5, 0.5, 0.5,
-4.149288, -4.31096, 0, 1, 1.5, 0.5, 0.5,
-4.149288, -4.31096, 0, 0, 1.5, 0.5, 0.5,
-4.149288, -4.31096, 2, 0, -0.5, 0.5, 0.5,
-4.149288, -4.31096, 2, 1, -0.5, 0.5, 0.5,
-4.149288, -4.31096, 2, 1, 1.5, 0.5, 0.5,
-4.149288, -4.31096, 2, 0, 1.5, 0.5, 0.5,
-4.149288, -4.31096, 4, 0, -0.5, 0.5, 0.5,
-4.149288, -4.31096, 4, 1, -0.5, 0.5, 0.5,
-4.149288, -4.31096, 4, 1, 1.5, 0.5, 0.5,
-4.149288, -4.31096, 4, 0, 1.5, 0.5, 0.5,
-4.149288, -4.31096, 6, 0, -0.5, 0.5, 0.5,
-4.149288, -4.31096, 6, 1, -0.5, 0.5, 0.5,
-4.149288, -4.31096, 6, 1, 1.5, 0.5, 0.5,
-4.149288, -4.31096, 6, 0, 1.5, 0.5, 0.5
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
-3.602646, -3.807248, -5.460094,
-3.602646, 2.908914, -5.460094,
-3.602646, -3.807248, 6.582173,
-3.602646, 2.908914, 6.582173,
-3.602646, -3.807248, -5.460094,
-3.602646, -3.807248, 6.582173,
-3.602646, 2.908914, -5.460094,
-3.602646, 2.908914, 6.582173,
-3.602646, -3.807248, -5.460094,
3.685917, -3.807248, -5.460094,
-3.602646, -3.807248, 6.582173,
3.685917, -3.807248, 6.582173,
-3.602646, 2.908914, -5.460094,
3.685917, 2.908914, -5.460094,
-3.602646, 2.908914, 6.582173,
3.685917, 2.908914, 6.582173,
3.685917, -3.807248, -5.460094,
3.685917, 2.908914, -5.460094,
3.685917, -3.807248, 6.582173,
3.685917, 2.908914, 6.582173,
3.685917, -3.807248, -5.460094,
3.685917, -3.807248, 6.582173,
3.685917, 2.908914, -5.460094,
3.685917, 2.908914, 6.582173
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
var radius = 8.328149;
var distance = 37.05288;
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
mvMatrix.translate( -0.04163527, 0.4491669, -0.5610394 );
mvMatrix.scale( 1.235437, 1.34073, 0.7477461 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.05288);
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
Briton<-read.table("Briton.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.496502, -1.467102, -1.836213, 0, 0, 1, 1, 1,
-3.011334, -0.04960606, -1.576461, 1, 0, 0, 1, 1,
-2.70388, -2.537602, -3.144635, 1, 0, 0, 1, 1,
-2.662272, 0.7194597, -1.348658, 1, 0, 0, 1, 1,
-2.573339, -0.2361619, -1.547246, 1, 0, 0, 1, 1,
-2.517477, 0.00176622, -2.285313, 1, 0, 0, 1, 1,
-2.477847, 1.606953, -0.6952421, 0, 0, 0, 1, 1,
-2.395445, -0.1393992, -1.579213, 0, 0, 0, 1, 1,
-2.39262, 0.5429336, 0.4650266, 0, 0, 0, 1, 1,
-2.292818, -0.7681278, -3.508209, 0, 0, 0, 1, 1,
-2.274908, 1.430181, -2.374645, 0, 0, 0, 1, 1,
-2.243843, -0.9982699, -1.16749, 0, 0, 0, 1, 1,
-2.224864, -0.2594879, -1.56103, 0, 0, 0, 1, 1,
-2.194632, -0.03398779, -1.924769, 1, 1, 1, 1, 1,
-2.11066, -0.05540375, -0.2970787, 1, 1, 1, 1, 1,
-2.108271, -0.7029926, -2.005478, 1, 1, 1, 1, 1,
-2.084714, 1.196645, -2.581235, 1, 1, 1, 1, 1,
-2.070823, 0.1349654, -0.02276405, 1, 1, 1, 1, 1,
-2.042234, 1.837884, -1.521314, 1, 1, 1, 1, 1,
-2.039823, -0.8439955, -1.846842, 1, 1, 1, 1, 1,
-2.03306, 1.605127, -0.4873993, 1, 1, 1, 1, 1,
-2.02439, -1.136026, -2.356169, 1, 1, 1, 1, 1,
-2.022631, -0.01421085, -0.2803975, 1, 1, 1, 1, 1,
-2.014994, 1.094661, -2.348134, 1, 1, 1, 1, 1,
-1.981736, 0.07769448, -1.268804, 1, 1, 1, 1, 1,
-1.970524, 0.2211483, -2.586351, 1, 1, 1, 1, 1,
-1.943741, -2.742876, -3.625374, 1, 1, 1, 1, 1,
-1.918215, -0.5051188, -3.386307, 1, 1, 1, 1, 1,
-1.911542, 1.192485, 0.9049779, 0, 0, 1, 1, 1,
-1.87592, -3.70944, -1.395241, 1, 0, 0, 1, 1,
-1.87372, -1.194254, -2.475452, 1, 0, 0, 1, 1,
-1.854559, -0.7275411, -3.095967, 1, 0, 0, 1, 1,
-1.846955, 0.9190546, -1.313025, 1, 0, 0, 1, 1,
-1.845634, -0.5812127, -2.501347, 1, 0, 0, 1, 1,
-1.838695, -0.2560862, -0.5785519, 0, 0, 0, 1, 1,
-1.835386, 0.7522112, -1.397061, 0, 0, 0, 1, 1,
-1.82447, 1.018945, -0.6844292, 0, 0, 0, 1, 1,
-1.813558, 1.332508, 1.585131, 0, 0, 0, 1, 1,
-1.813491, -0.2254968, -1.79826, 0, 0, 0, 1, 1,
-1.811421, 0.5896389, -2.568768, 0, 0, 0, 1, 1,
-1.809185, -1.232469, -3.61252, 0, 0, 0, 1, 1,
-1.769299, 1.094964, -0.6280512, 1, 1, 1, 1, 1,
-1.762126, -0.1326283, -2.297744, 1, 1, 1, 1, 1,
-1.758994, -0.9709742, -3.268213, 1, 1, 1, 1, 1,
-1.758829, 0.7316361, -1.767519, 1, 1, 1, 1, 1,
-1.753609, 0.2883334, -1.342792, 1, 1, 1, 1, 1,
-1.750255, -1.185074, -4.306898, 1, 1, 1, 1, 1,
-1.748165, -2.799852, -3.118451, 1, 1, 1, 1, 1,
-1.718802, -1.061096, -4.481312, 1, 1, 1, 1, 1,
-1.678786, 0.115619, -1.479267, 1, 1, 1, 1, 1,
-1.678208, 0.5514665, -1.553295, 1, 1, 1, 1, 1,
-1.665572, -0.7155877, -1.441332, 1, 1, 1, 1, 1,
-1.661121, -1.342558, -3.755055, 1, 1, 1, 1, 1,
-1.659023, 0.07592057, 0.002366483, 1, 1, 1, 1, 1,
-1.624227, 0.06138419, -3.019091, 1, 1, 1, 1, 1,
-1.613585, 0.04423757, -2.494067, 1, 1, 1, 1, 1,
-1.593554, 1.432824, -1.037565, 0, 0, 1, 1, 1,
-1.568934, 2.811106, -0.2368244, 1, 0, 0, 1, 1,
-1.556167, 0.9594278, -2.455401, 1, 0, 0, 1, 1,
-1.553751, -3.223637, -1.104713, 1, 0, 0, 1, 1,
-1.549098, 2.116277, -1.132834, 1, 0, 0, 1, 1,
-1.547216, -1.069876, -4.285571, 1, 0, 0, 1, 1,
-1.529703, -0.4270889, -2.527695, 0, 0, 0, 1, 1,
-1.5272, 0.7197679, -1.319444, 0, 0, 0, 1, 1,
-1.52229, -0.2849666, -1.542381, 0, 0, 0, 1, 1,
-1.518393, -0.5154019, -2.34709, 0, 0, 0, 1, 1,
-1.493902, 0.9731401, -1.099052, 0, 0, 0, 1, 1,
-1.479241, -0.5468923, -1.589903, 0, 0, 0, 1, 1,
-1.469782, 0.4169089, -3.72247, 0, 0, 0, 1, 1,
-1.467739, 0.5052074, -1.453268, 1, 1, 1, 1, 1,
-1.462898, -0.002543799, -2.578798, 1, 1, 1, 1, 1,
-1.45988, 0.3808141, 0.1311664, 1, 1, 1, 1, 1,
-1.458617, 2.381099, -0.5060204, 1, 1, 1, 1, 1,
-1.454936, -0.2154633, -1.086047, 1, 1, 1, 1, 1,
-1.452608, 0.3208132, -1.754974, 1, 1, 1, 1, 1,
-1.446369, 0.7158465, -1.321402, 1, 1, 1, 1, 1,
-1.431769, 0.7513573, -0.8728889, 1, 1, 1, 1, 1,
-1.423902, 1.346314, -1.161771, 1, 1, 1, 1, 1,
-1.413878, 0.8675661, 0.4770901, 1, 1, 1, 1, 1,
-1.408951, -1.850957, -3.656849, 1, 1, 1, 1, 1,
-1.408404, -0.4336801, -3.308487, 1, 1, 1, 1, 1,
-1.399256, -1.440724, -4.11217, 1, 1, 1, 1, 1,
-1.394496, -0.1452139, -1.779844, 1, 1, 1, 1, 1,
-1.333339, -1.000095, -2.467557, 1, 1, 1, 1, 1,
-1.330144, -0.09814922, -2.115042, 0, 0, 1, 1, 1,
-1.322803, 0.1390956, -0.4271445, 1, 0, 0, 1, 1,
-1.316019, 0.227161, -0.7491902, 1, 0, 0, 1, 1,
-1.31581, -0.09532121, -2.301248, 1, 0, 0, 1, 1,
-1.314376, 0.5288751, 0.4969113, 1, 0, 0, 1, 1,
-1.302377, 0.04616447, -1.640658, 1, 0, 0, 1, 1,
-1.296081, -0.4758202, -1.340917, 0, 0, 0, 1, 1,
-1.283431, -0.3064961, -2.694259, 0, 0, 0, 1, 1,
-1.277594, 1.87647, -1.49585, 0, 0, 0, 1, 1,
-1.275214, 0.7634376, -1.442153, 0, 0, 0, 1, 1,
-1.264977, -0.4277923, -1.707372, 0, 0, 0, 1, 1,
-1.261671, -1.430285, -1.32478, 0, 0, 0, 1, 1,
-1.24764, -0.6441633, -1.524626, 0, 0, 0, 1, 1,
-1.236043, 0.08249362, -2.632298, 1, 1, 1, 1, 1,
-1.233977, -0.4616188, -1.861568, 1, 1, 1, 1, 1,
-1.229783, -0.6146189, -3.33897, 1, 1, 1, 1, 1,
-1.226156, 1.234151, -2.148928, 1, 1, 1, 1, 1,
-1.199977, 2.270078, -1.67557, 1, 1, 1, 1, 1,
-1.197571, -1.494686, -1.185952, 1, 1, 1, 1, 1,
-1.19065, -0.4119241, -1.24932, 1, 1, 1, 1, 1,
-1.184952, -1.924673, -3.204394, 1, 1, 1, 1, 1,
-1.176459, -1.323341, -3.324844, 1, 1, 1, 1, 1,
-1.169173, 0.1000899, -0.258693, 1, 1, 1, 1, 1,
-1.169134, -2.393811, -3.069129, 1, 1, 1, 1, 1,
-1.168524, -0.5532416, -2.188401, 1, 1, 1, 1, 1,
-1.166787, -1.355316, -2.623835, 1, 1, 1, 1, 1,
-1.159668, 1.111075, -1.886691, 1, 1, 1, 1, 1,
-1.157794, -0.8304994, -2.701543, 1, 1, 1, 1, 1,
-1.155474, 1.31101, -0.7325897, 0, 0, 1, 1, 1,
-1.153156, -1.145608, -2.880926, 1, 0, 0, 1, 1,
-1.147519, 0.1343548, -2.993581, 1, 0, 0, 1, 1,
-1.141454, -1.670524, -1.084036, 1, 0, 0, 1, 1,
-1.137494, 0.05048708, -1.082887, 1, 0, 0, 1, 1,
-1.135201, -0.4720257, -1.369717, 1, 0, 0, 1, 1,
-1.134867, -0.1577996, 0.1573176, 0, 0, 0, 1, 1,
-1.130981, -1.038944, -1.468383, 0, 0, 0, 1, 1,
-1.124909, -1.321556, -3.22121, 0, 0, 0, 1, 1,
-1.124596, -0.7511439, -2.326606, 0, 0, 0, 1, 1,
-1.123959, 0.8222052, -2.353948, 0, 0, 0, 1, 1,
-1.121111, 0.07207242, -1.938601, 0, 0, 0, 1, 1,
-1.113211, -0.5687249, -2.677368, 0, 0, 0, 1, 1,
-1.096231, 0.08125794, -0.07250821, 1, 1, 1, 1, 1,
-1.093908, -1.94562, -1.865261, 1, 1, 1, 1, 1,
-1.089955, 1.004267, -1.803233, 1, 1, 1, 1, 1,
-1.086646, -0.6139292, -2.076458, 1, 1, 1, 1, 1,
-1.085082, -0.7100037, -1.561939, 1, 1, 1, 1, 1,
-1.083786, 0.2436182, -3.068566, 1, 1, 1, 1, 1,
-1.083716, 0.9374548, -2.387356, 1, 1, 1, 1, 1,
-1.069585, -0.8313814, -1.769856, 1, 1, 1, 1, 1,
-1.050605, -0.4381244, -2.886269, 1, 1, 1, 1, 1,
-1.046522, 1.199418, -1.660913, 1, 1, 1, 1, 1,
-1.037751, -0.7639433, -0.4316448, 1, 1, 1, 1, 1,
-1.036816, 0.3256584, 0.3544323, 1, 1, 1, 1, 1,
-1.023132, 0.2166365, -1.592209, 1, 1, 1, 1, 1,
-1.022714, 1.095743, -0.4885655, 1, 1, 1, 1, 1,
-1.016758, 1.17347, -1.25623, 1, 1, 1, 1, 1,
-1.014167, -0.908659, -4.638207, 0, 0, 1, 1, 1,
-1.007643, 0.8369429, -1.047904, 1, 0, 0, 1, 1,
-1.006313, -1.517811, -2.764997, 1, 0, 0, 1, 1,
-1.002153, 0.3390583, -0.8433637, 1, 0, 0, 1, 1,
-0.9991319, -0.3070871, -1.479649, 1, 0, 0, 1, 1,
-0.9988684, -1.569911, -2.135432, 1, 0, 0, 1, 1,
-0.9964912, 0.05293971, -0.7997859, 0, 0, 0, 1, 1,
-0.992231, 0.4831783, -1.156086, 0, 0, 0, 1, 1,
-0.9875255, 1.154857, -1.82936, 0, 0, 0, 1, 1,
-0.9867396, 0.8299872, 1.84312, 0, 0, 0, 1, 1,
-0.9825679, 0.3452373, -2.110627, 0, 0, 0, 1, 1,
-0.9797922, -2.159045, -3.581011, 0, 0, 0, 1, 1,
-0.9721473, -0.9459597, -2.261593, 0, 0, 0, 1, 1,
-0.9694686, -0.07487654, -2.43182, 1, 1, 1, 1, 1,
-0.967469, -0.4903778, -3.09608, 1, 1, 1, 1, 1,
-0.9649426, 0.8945122, -0.2059025, 1, 1, 1, 1, 1,
-0.9629377, -0.3449924, -2.482255, 1, 1, 1, 1, 1,
-0.960116, 1.098155, -0.6342485, 1, 1, 1, 1, 1,
-0.9578566, 1.453983, 0.321398, 1, 1, 1, 1, 1,
-0.9569364, -0.5535128, -2.408542, 1, 1, 1, 1, 1,
-0.941986, -1.032475, -2.54382, 1, 1, 1, 1, 1,
-0.9300572, 0.0599287, -1.529007, 1, 1, 1, 1, 1,
-0.9290316, -0.173336, -2.227497, 1, 1, 1, 1, 1,
-0.928201, 0.3870331, -0.6956399, 1, 1, 1, 1, 1,
-0.9217441, 0.1452212, -4.337986, 1, 1, 1, 1, 1,
-0.9200061, -0.1007498, -1.176108, 1, 1, 1, 1, 1,
-0.9185739, -0.286004, -2.018224, 1, 1, 1, 1, 1,
-0.9177194, 0.170416, -2.35078, 1, 1, 1, 1, 1,
-0.9037115, 0.7355878, -0.6601181, 0, 0, 1, 1, 1,
-0.9000784, 1.703377, -0.9534609, 1, 0, 0, 1, 1,
-0.8956367, -0.6605713, -3.03653, 1, 0, 0, 1, 1,
-0.8919215, 1.560272, -1.924975, 1, 0, 0, 1, 1,
-0.886473, -2.118476, -3.477575, 1, 0, 0, 1, 1,
-0.8840103, -1.911162, -3.654195, 1, 0, 0, 1, 1,
-0.8827637, -0.3199525, -2.057547, 0, 0, 0, 1, 1,
-0.8804941, 0.9522858, -0.6065585, 0, 0, 0, 1, 1,
-0.8764499, -0.3004453, -1.442053, 0, 0, 0, 1, 1,
-0.8735908, 0.7007112, -0.6310445, 0, 0, 0, 1, 1,
-0.8675841, 0.0631451, -2.076411, 0, 0, 0, 1, 1,
-0.8675587, 0.4831849, -2.034445, 0, 0, 0, 1, 1,
-0.8665236, 0.5378979, -2.180398, 0, 0, 0, 1, 1,
-0.8664755, -1.973008, -3.788369, 1, 1, 1, 1, 1,
-0.8629016, 0.5989535, -1.715976, 1, 1, 1, 1, 1,
-0.8616287, -0.08968934, -1.560833, 1, 1, 1, 1, 1,
-0.8598103, 0.2611999, 0.06925733, 1, 1, 1, 1, 1,
-0.8577702, -0.4012683, -1.571148, 1, 1, 1, 1, 1,
-0.8563862, 1.630096, -0.9384417, 1, 1, 1, 1, 1,
-0.8558722, 0.5898671, -0.5978138, 1, 1, 1, 1, 1,
-0.843666, -0.2445443, -1.022404, 1, 1, 1, 1, 1,
-0.8397879, -2.698587, -0.6313494, 1, 1, 1, 1, 1,
-0.8336071, 0.3105764, 0.5110844, 1, 1, 1, 1, 1,
-0.832462, -0.5841152, -1.8997, 1, 1, 1, 1, 1,
-0.8307956, -0.5911316, 0.5371081, 1, 1, 1, 1, 1,
-0.8267988, -0.3072256, -2.017106, 1, 1, 1, 1, 1,
-0.8217853, -0.838101, -3.134876, 1, 1, 1, 1, 1,
-0.8210172, -0.4816934, -0.7956601, 1, 1, 1, 1, 1,
-0.8205343, -0.07584608, -1.134659, 0, 0, 1, 1, 1,
-0.8163414, -0.283256, -3.572665, 1, 0, 0, 1, 1,
-0.8095376, 0.3871013, 2.041688, 1, 0, 0, 1, 1,
-0.8050318, 0.8810685, -1.285098, 1, 0, 0, 1, 1,
-0.803362, 0.4960731, -0.6127782, 1, 0, 0, 1, 1,
-0.7985935, -0.5601301, -1.534205, 1, 0, 0, 1, 1,
-0.7985025, -0.4638764, -0.3797551, 0, 0, 0, 1, 1,
-0.7943916, -0.07584909, -1.472395, 0, 0, 0, 1, 1,
-0.7884818, -0.3380711, -2.486307, 0, 0, 0, 1, 1,
-0.7877973, -0.05524456, -2.492144, 0, 0, 0, 1, 1,
-0.7847744, -0.105545, -3.184907, 0, 0, 0, 1, 1,
-0.7820007, 0.1676713, -1.951564, 0, 0, 0, 1, 1,
-0.7803987, -0.5985252, -2.733739, 0, 0, 0, 1, 1,
-0.7754785, 0.4747122, 0.03907125, 1, 1, 1, 1, 1,
-0.7726378, -0.06386584, -1.078308, 1, 1, 1, 1, 1,
-0.7694266, 0.1454809, -1.57442, 1, 1, 1, 1, 1,
-0.7629274, 0.8424326, 0.8419369, 1, 1, 1, 1, 1,
-0.7577515, 0.7903693, 0.2417038, 1, 1, 1, 1, 1,
-0.7554129, 0.4938228, 0.0442309, 1, 1, 1, 1, 1,
-0.754498, 1.580149, 0.2994696, 1, 1, 1, 1, 1,
-0.7485505, -0.2903659, -0.7986476, 1, 1, 1, 1, 1,
-0.7478283, -0.4816822, 0.4050194, 1, 1, 1, 1, 1,
-0.7454278, 0.07319972, -1.421929, 1, 1, 1, 1, 1,
-0.7369503, -1.453741, -3.208924, 1, 1, 1, 1, 1,
-0.7340312, 1.348908, -1.591637, 1, 1, 1, 1, 1,
-0.7291379, -0.2124859, -1.898449, 1, 1, 1, 1, 1,
-0.7283292, -0.4551432, -3.055408, 1, 1, 1, 1, 1,
-0.7238252, 2.244465, -0.5381249, 1, 1, 1, 1, 1,
-0.7195134, -1.178123, -1.958082, 0, 0, 1, 1, 1,
-0.7045735, 0.467376, -1.177673, 1, 0, 0, 1, 1,
-0.6984922, -0.9223218, -3.352257, 1, 0, 0, 1, 1,
-0.6883068, 0.4947558, -1.010465, 1, 0, 0, 1, 1,
-0.6849881, -0.315787, -1.665811, 1, 0, 0, 1, 1,
-0.6816327, -0.4648012, -1.766675, 1, 0, 0, 1, 1,
-0.6799328, 0.7927551, -0.5260083, 0, 0, 0, 1, 1,
-0.6796007, -0.05864352, -2.060942, 0, 0, 0, 1, 1,
-0.6789905, -2.182522, -2.320795, 0, 0, 0, 1, 1,
-0.6771241, -0.3052555, -1.262123, 0, 0, 0, 1, 1,
-0.6684036, -0.6447142, -1.739201, 0, 0, 0, 1, 1,
-0.6675686, -0.5334457, -3.474283, 0, 0, 0, 1, 1,
-0.6664442, 0.9740562, 1.110234, 0, 0, 0, 1, 1,
-0.6642883, -1.332232, -1.17352, 1, 1, 1, 1, 1,
-0.659164, -0.4562575, -1.875839, 1, 1, 1, 1, 1,
-0.6556038, 0.6488838, -1.709844, 1, 1, 1, 1, 1,
-0.6517609, -1.095792, -2.750687, 1, 1, 1, 1, 1,
-0.6495833, 0.1950534, -0.6934515, 1, 1, 1, 1, 1,
-0.6472359, 0.387005, -1.256436, 1, 1, 1, 1, 1,
-0.6470538, 1.270926, -1.187707, 1, 1, 1, 1, 1,
-0.6463764, 0.8000045, -0.2777535, 1, 1, 1, 1, 1,
-0.640932, -1.207505, -2.089607, 1, 1, 1, 1, 1,
-0.6277452, 0.1096214, -1.332132, 1, 1, 1, 1, 1,
-0.6208321, -0.1731569, -1.94662, 1, 1, 1, 1, 1,
-0.6082375, 0.936074, 3.001328, 1, 1, 1, 1, 1,
-0.6030523, 0.1207172, -1.392792, 1, 1, 1, 1, 1,
-0.6003765, 0.9843894, 0.8082926, 1, 1, 1, 1, 1,
-0.593681, 0.263023, -1.645418, 1, 1, 1, 1, 1,
-0.5930513, -0.947348, -3.482719, 0, 0, 1, 1, 1,
-0.5915028, -0.4057578, -1.648139, 1, 0, 0, 1, 1,
-0.5914911, 0.5067582, -0.8599483, 1, 0, 0, 1, 1,
-0.5887266, -0.3234827, -0.9841305, 1, 0, 0, 1, 1,
-0.5885475, -0.7809628, -2.718271, 1, 0, 0, 1, 1,
-0.5863717, 0.7802678, -0.886284, 1, 0, 0, 1, 1,
-0.5845141, 0.01175392, -2.92657, 0, 0, 0, 1, 1,
-0.5797939, 1.05699, 0.6370087, 0, 0, 0, 1, 1,
-0.5770948, -1.409306, -4.475693, 0, 0, 0, 1, 1,
-0.5745525, -0.8304344, -1.611096, 0, 0, 0, 1, 1,
-0.5695235, 0.2174078, -1.828636, 0, 0, 0, 1, 1,
-0.5689176, -0.4056971, -3.917898, 0, 0, 0, 1, 1,
-0.568194, -0.3937003, -0.6124803, 0, 0, 0, 1, 1,
-0.565125, 0.6384011, 2.153713, 1, 1, 1, 1, 1,
-0.5589437, 1.344499, -1.221807, 1, 1, 1, 1, 1,
-0.5587384, 0.3163061, -1.33686, 1, 1, 1, 1, 1,
-0.5557707, -2.235156, -2.355703, 1, 1, 1, 1, 1,
-0.5544922, 0.9830886, -0.117882, 1, 1, 1, 1, 1,
-0.5502594, 0.7775654, -0.4771672, 1, 1, 1, 1, 1,
-0.5496626, 2.162876, 0.9310837, 1, 1, 1, 1, 1,
-0.5490373, -0.6987417, -2.206661, 1, 1, 1, 1, 1,
-0.5461133, 0.6016495, 0.4535547, 1, 1, 1, 1, 1,
-0.5446445, 0.7479618, -0.6846274, 1, 1, 1, 1, 1,
-0.5435713, -0.241428, 0.04069628, 1, 1, 1, 1, 1,
-0.5425096, -3.62125, -2.608112, 1, 1, 1, 1, 1,
-0.5359052, 0.5605022, -1.665311, 1, 1, 1, 1, 1,
-0.534219, 0.793161, -0.003721562, 1, 1, 1, 1, 1,
-0.5312548, -0.03893582, -2.284754, 1, 1, 1, 1, 1,
-0.530138, -0.2262102, -0.6018637, 0, 0, 1, 1, 1,
-0.5287469, 0.7976147, 1.61444, 1, 0, 0, 1, 1,
-0.528425, 0.01286007, -3.058481, 1, 0, 0, 1, 1,
-0.5098181, 0.2551525, -0.01771755, 1, 0, 0, 1, 1,
-0.5093031, 0.3730904, 0.2757516, 1, 0, 0, 1, 1,
-0.508984, 0.8536668, -1.026464, 1, 0, 0, 1, 1,
-0.5073116, -1.953656, -3.289417, 0, 0, 0, 1, 1,
-0.506219, 0.1369892, -2.116873, 0, 0, 0, 1, 1,
-0.5055385, 0.7111601, -0.4491699, 0, 0, 0, 1, 1,
-0.5012607, 1.346678, -1.367033, 0, 0, 0, 1, 1,
-0.5006013, -0.06145631, -0.8499391, 0, 0, 0, 1, 1,
-0.4999444, 1.579279, -0.4415544, 0, 0, 0, 1, 1,
-0.4970264, -0.08870186, -3.757835, 0, 0, 0, 1, 1,
-0.495813, 0.03619375, -1.743403, 1, 1, 1, 1, 1,
-0.4915207, 0.1157445, 1.119845, 1, 1, 1, 1, 1,
-0.484738, -2.508292, -2.200847, 1, 1, 1, 1, 1,
-0.4813991, -0.3070866, -2.506436, 1, 1, 1, 1, 1,
-0.4723266, -0.569572, -4.058925, 1, 1, 1, 1, 1,
-0.4699029, -0.7247556, -3.143345, 1, 1, 1, 1, 1,
-0.468689, 0.957133, -0.6858063, 1, 1, 1, 1, 1,
-0.4682808, -0.7019085, -2.558093, 1, 1, 1, 1, 1,
-0.4664827, -1.515457, -2.456262, 1, 1, 1, 1, 1,
-0.4655262, 0.523806, -1.320405, 1, 1, 1, 1, 1,
-0.4629825, -0.6193604, -3.777331, 1, 1, 1, 1, 1,
-0.4627652, -1.51603, -2.65759, 1, 1, 1, 1, 1,
-0.4624257, -0.1873968, -1.82079, 1, 1, 1, 1, 1,
-0.4585969, 1.095695, -0.1234585, 1, 1, 1, 1, 1,
-0.4570212, 0.8230438, -1.631114, 1, 1, 1, 1, 1,
-0.4568069, -0.3001575, -3.633372, 0, 0, 1, 1, 1,
-0.4533657, 0.3805504, -1.862718, 1, 0, 0, 1, 1,
-0.4478004, 1.18151, -1.299198, 1, 0, 0, 1, 1,
-0.4439501, -1.210157, -4.234743, 1, 0, 0, 1, 1,
-0.4429399, 2.136562, -0.8590141, 1, 0, 0, 1, 1,
-0.4404714, -0.2817473, -2.450578, 1, 0, 0, 1, 1,
-0.4388105, 1.447873, 0.2657878, 0, 0, 0, 1, 1,
-0.4371541, 1.109518, 0.1952791, 0, 0, 0, 1, 1,
-0.4361973, 0.2126489, 0.3368889, 0, 0, 0, 1, 1,
-0.435305, -1.564872, -1.685387, 0, 0, 0, 1, 1,
-0.4350376, -0.4458283, -2.569998, 0, 0, 0, 1, 1,
-0.4342264, -0.1835441, -3.2007, 0, 0, 0, 1, 1,
-0.4297387, -1.29195, -3.719004, 0, 0, 0, 1, 1,
-0.4278194, -0.2040491, -1.208853, 1, 1, 1, 1, 1,
-0.4273309, -0.1640791, -2.715901, 1, 1, 1, 1, 1,
-0.4260101, -1.705624, -3.251163, 1, 1, 1, 1, 1,
-0.4219649, 0.4160813, -0.6233247, 1, 1, 1, 1, 1,
-0.4217932, -0.9582696, -1.899883, 1, 1, 1, 1, 1,
-0.4197072, 1.275734, -0.7232009, 1, 1, 1, 1, 1,
-0.4190171, 1.282572, 1.466796, 1, 1, 1, 1, 1,
-0.4171529, 0.2945553, -1.793402, 1, 1, 1, 1, 1,
-0.4144579, 0.4083164, 0.1098667, 1, 1, 1, 1, 1,
-0.4139955, -0.09149256, -1.592001, 1, 1, 1, 1, 1,
-0.4134886, 0.2873189, -0.3769736, 1, 1, 1, 1, 1,
-0.4082503, -1.070139, -0.9935088, 1, 1, 1, 1, 1,
-0.4065003, 0.3643278, 0.1760255, 1, 1, 1, 1, 1,
-0.4051287, -0.4069304, -0.5668051, 1, 1, 1, 1, 1,
-0.4003442, -0.01712313, -2.632362, 1, 1, 1, 1, 1,
-0.3961634, -0.162708, -1.674769, 0, 0, 1, 1, 1,
-0.3946937, -0.5646932, -1.406371, 1, 0, 0, 1, 1,
-0.3938574, 0.287482, -3.145386, 1, 0, 0, 1, 1,
-0.3905398, -0.6041015, -3.044862, 1, 0, 0, 1, 1,
-0.3896459, 0.3126347, -0.4628863, 1, 0, 0, 1, 1,
-0.3875213, -1.021201, -3.165374, 1, 0, 0, 1, 1,
-0.3839068, 0.7263399, 0.4339516, 0, 0, 0, 1, 1,
-0.3817598, -1.281101, -2.882426, 0, 0, 0, 1, 1,
-0.3794462, 1.70215, -1.986966, 0, 0, 0, 1, 1,
-0.3789432, 0.2607161, -2.392035, 0, 0, 0, 1, 1,
-0.3739988, 0.1082884, -1.238512, 0, 0, 0, 1, 1,
-0.372787, -0.03270174, -0.2875893, 0, 0, 0, 1, 1,
-0.3693565, 1.013498, -0.01285249, 0, 0, 0, 1, 1,
-0.3647909, -0.8380996, -2.661195, 1, 1, 1, 1, 1,
-0.3627293, 1.053736, 0.3990731, 1, 1, 1, 1, 1,
-0.3613744, 0.6993938, -0.3746012, 1, 1, 1, 1, 1,
-0.360271, -0.05316634, -2.071855, 1, 1, 1, 1, 1,
-0.3572864, 0.9877233, -1.648851, 1, 1, 1, 1, 1,
-0.3567821, 1.264578, 1.646125, 1, 1, 1, 1, 1,
-0.3524677, 0.8095136, 0.2991011, 1, 1, 1, 1, 1,
-0.3518673, 0.7694197, 1.365698, 1, 1, 1, 1, 1,
-0.3485696, 0.60934, -1.208623, 1, 1, 1, 1, 1,
-0.3473271, 0.2162469, -1.153337, 1, 1, 1, 1, 1,
-0.3415091, 0.3063188, 0.3090099, 1, 1, 1, 1, 1,
-0.3370076, 0.2133151, -1.911837, 1, 1, 1, 1, 1,
-0.3334372, -2.338323, -2.965967, 1, 1, 1, 1, 1,
-0.3326699, 0.5227177, 0.6509509, 1, 1, 1, 1, 1,
-0.3269153, 0.1417805, -1.101554, 1, 1, 1, 1, 1,
-0.3257965, 0.4625079, -1.546266, 0, 0, 1, 1, 1,
-0.3239697, 0.5800312, -0.4331676, 1, 0, 0, 1, 1,
-0.3208527, 1.286353, -0.07508039, 1, 0, 0, 1, 1,
-0.3161792, -0.3847139, -2.050729, 1, 0, 0, 1, 1,
-0.3141312, 0.06518099, -1.661804, 1, 0, 0, 1, 1,
-0.306564, -1.570274, -3.467906, 1, 0, 0, 1, 1,
-0.3056819, 0.3366142, -0.06015362, 0, 0, 0, 1, 1,
-0.3048586, 1.428784, 1.192437, 0, 0, 0, 1, 1,
-0.3028707, -0.03576628, -2.478791, 0, 0, 0, 1, 1,
-0.3002978, -1.516388, -2.205779, 0, 0, 0, 1, 1,
-0.2993673, 1.193054, -1.690107, 0, 0, 0, 1, 1,
-0.2935843, 0.5428136, 1.172898, 0, 0, 0, 1, 1,
-0.2924967, -1.00644, -4.41424, 0, 0, 0, 1, 1,
-0.2906476, 0.1211005, -1.093623, 1, 1, 1, 1, 1,
-0.2906131, -0.3882897, -1.0444, 1, 1, 1, 1, 1,
-0.2856581, -0.465478, 0.3265004, 1, 1, 1, 1, 1,
-0.2793818, -0.2892815, -2.08158, 1, 1, 1, 1, 1,
-0.2772214, -0.1986528, -0.1460194, 1, 1, 1, 1, 1,
-0.2748228, 0.1931593, -1.847087, 1, 1, 1, 1, 1,
-0.2734615, -0.571118, -2.395311, 1, 1, 1, 1, 1,
-0.2733783, 1.873823, 0.0408794, 1, 1, 1, 1, 1,
-0.2726889, -0.09894494, -3.513372, 1, 1, 1, 1, 1,
-0.2650139, -0.9360614, -1.431226, 1, 1, 1, 1, 1,
-0.2624379, -0.03384038, -3.093631, 1, 1, 1, 1, 1,
-0.2617258, -1.729798, -4.109475, 1, 1, 1, 1, 1,
-0.2524682, 0.4873619, 1.161279, 1, 1, 1, 1, 1,
-0.2501599, -1.270151, -3.60495, 1, 1, 1, 1, 1,
-0.2493043, 1.422232, 0.9565158, 1, 1, 1, 1, 1,
-0.24853, 1.394467, 0.3429178, 0, 0, 1, 1, 1,
-0.2455065, 1.585827, 0.5633546, 1, 0, 0, 1, 1,
-0.2439809, -0.09247309, -3.719008, 1, 0, 0, 1, 1,
-0.2432083, -0.8407596, -4.826433, 1, 0, 0, 1, 1,
-0.2429442, -1.269983, -2.890074, 1, 0, 0, 1, 1,
-0.2425824, -0.1597317, -1.541153, 1, 0, 0, 1, 1,
-0.2408065, -0.9278693, -2.627437, 0, 0, 0, 1, 1,
-0.2337003, -0.08263439, -1.027098, 0, 0, 0, 1, 1,
-0.2317947, -0.3487231, -2.998784, 0, 0, 0, 1, 1,
-0.2244367, -0.141459, -2.254261, 0, 0, 0, 1, 1,
-0.2175639, 1.491447, -0.4796299, 0, 0, 0, 1, 1,
-0.2175003, 0.2418696, -1.552742, 0, 0, 0, 1, 1,
-0.2113054, -0.1000698, 0.2471025, 0, 0, 0, 1, 1,
-0.2094411, -0.2425202, -2.836316, 1, 1, 1, 1, 1,
-0.2088026, -1.68093, -4.417527, 1, 1, 1, 1, 1,
-0.2072281, 1.277678, -0.533341, 1, 1, 1, 1, 1,
-0.2009504, -0.5854631, -2.145288, 1, 1, 1, 1, 1,
-0.1991321, -0.4627621, -3.08141, 1, 1, 1, 1, 1,
-0.19879, 0.898325, 0.1186519, 1, 1, 1, 1, 1,
-0.1977559, 0.5535955, 1.038334, 1, 1, 1, 1, 1,
-0.1828292, 0.7269835, -1.61714, 1, 1, 1, 1, 1,
-0.1814531, 0.8343609, -0.6747512, 1, 1, 1, 1, 1,
-0.1754187, 0.7853431, 0.4932089, 1, 1, 1, 1, 1,
-0.1751129, -0.5985133, -3.115713, 1, 1, 1, 1, 1,
-0.1708809, 0.5768161, 0.1864067, 1, 1, 1, 1, 1,
-0.1587303, -2.233187, -2.174624, 1, 1, 1, 1, 1,
-0.1577509, 2.240767, -0.1997591, 1, 1, 1, 1, 1,
-0.1565634, 0.3939479, -0.7166343, 1, 1, 1, 1, 1,
-0.1564008, 0.1375196, -0.02355024, 0, 0, 1, 1, 1,
-0.1500608, -0.553732, -4.828465, 1, 0, 0, 1, 1,
-0.1432699, 0.7251164, -0.8404588, 1, 0, 0, 1, 1,
-0.1428684, -1.241921, -2.535013, 1, 0, 0, 1, 1,
-0.1399999, -1.026234, -3.575201, 1, 0, 0, 1, 1,
-0.13659, 0.10281, 0.8849332, 1, 0, 0, 1, 1,
-0.1339828, 1.723713, -0.8077995, 0, 0, 0, 1, 1,
-0.133328, 2.093372, 0.4396135, 0, 0, 0, 1, 1,
-0.1330101, 0.1622349, 1.346624, 0, 0, 0, 1, 1,
-0.1287927, 0.4365441, 0.4239354, 0, 0, 0, 1, 1,
-0.1248785, -0.2149357, -2.953116, 0, 0, 0, 1, 1,
-0.1233409, -1.052358, -3.244228, 0, 0, 0, 1, 1,
-0.1230903, 1.775205, 0.2369047, 0, 0, 0, 1, 1,
-0.1215817, 1.009354, -1.016441, 1, 1, 1, 1, 1,
-0.1101457, 0.8760168, 1.414474, 1, 1, 1, 1, 1,
-0.1062539, -1.052713, -2.602112, 1, 1, 1, 1, 1,
-0.1051212, 0.6793042, 1.113287, 1, 1, 1, 1, 1,
-0.1048259, 1.014664, 1.392435, 1, 1, 1, 1, 1,
-0.1026023, 1.013251, -1.200465, 1, 1, 1, 1, 1,
-0.1024231, 1.639263, 2.125098, 1, 1, 1, 1, 1,
-0.102328, -0.7744876, -3.445578, 1, 1, 1, 1, 1,
-0.09838805, -0.09764197, -4.57473, 1, 1, 1, 1, 1,
-0.09564777, -0.6076919, -2.373273, 1, 1, 1, 1, 1,
-0.0921543, 0.5186155, 1.278088, 1, 1, 1, 1, 1,
-0.08702295, -0.06687833, -3.278748, 1, 1, 1, 1, 1,
-0.08609553, 0.7314653, -0.7038662, 1, 1, 1, 1, 1,
-0.08533917, 0.2744448, -0.0177687, 1, 1, 1, 1, 1,
-0.08128337, -0.1173642, -2.502254, 1, 1, 1, 1, 1,
-0.07559136, 0.1518173, -0.1163746, 0, 0, 1, 1, 1,
-0.07300446, -0.805068, -5.284722, 1, 0, 0, 1, 1,
-0.0723794, 1.23983, 0.4006544, 1, 0, 0, 1, 1,
-0.06949464, -0.3779719, -3.056797, 1, 0, 0, 1, 1,
-0.06753168, -1.251303, -3.276752, 1, 0, 0, 1, 1,
-0.06643235, -0.4032639, -2.969208, 1, 0, 0, 1, 1,
-0.06420341, -0.4725683, -1.807318, 0, 0, 0, 1, 1,
-0.06325059, 0.5827779, 0.9091688, 0, 0, 0, 1, 1,
-0.06239818, 0.2507064, -0.02385833, 0, 0, 0, 1, 1,
-0.05395235, 0.975568, -0.2041361, 0, 0, 0, 1, 1,
-0.05262566, 0.9555071, 0.663395, 0, 0, 0, 1, 1,
-0.05192826, 0.5422903, 0.3274522, 0, 0, 0, 1, 1,
-0.05088243, -1.191323, -1.619372, 0, 0, 0, 1, 1,
-0.05026557, -0.2921915, -3.301635, 1, 1, 1, 1, 1,
-0.04863088, 1.672951, 0.7946002, 1, 1, 1, 1, 1,
-0.04065206, -0.06484156, -1.842614, 1, 1, 1, 1, 1,
-0.03588671, -0.02961805, -3.387574, 1, 1, 1, 1, 1,
-0.03585232, 0.6331908, -0.04330062, 1, 1, 1, 1, 1,
-0.03336454, -1.091526, -3.092228, 1, 1, 1, 1, 1,
-0.03319268, -1.025236, -3.938514, 1, 1, 1, 1, 1,
-0.03282164, -0.7741227, -3.38306, 1, 1, 1, 1, 1,
-0.03141466, -1.78856, -2.637617, 1, 1, 1, 1, 1,
-0.01860981, 0.9857778, 0.8129944, 1, 1, 1, 1, 1,
-0.01797741, 0.8842974, -0.4710914, 1, 1, 1, 1, 1,
-0.01717498, -0.8786484, -2.342496, 1, 1, 1, 1, 1,
-0.01662953, 0.8960834, -0.4580284, 1, 1, 1, 1, 1,
-0.0126261, 0.7640484, -0.249095, 1, 1, 1, 1, 1,
-0.01054556, -0.432469, -2.394078, 1, 1, 1, 1, 1,
-0.003328886, -2.705781, -4.265542, 0, 0, 1, 1, 1,
0.002227103, 0.9527281, 1.296015, 1, 0, 0, 1, 1,
0.002987017, -0.009412467, 3.408011, 1, 0, 0, 1, 1,
0.003347265, 0.1192971, -0.721831, 1, 0, 0, 1, 1,
0.005306433, 0.1054856, -0.7919935, 1, 0, 0, 1, 1,
0.01446965, 1.984887, 1.246235, 1, 0, 0, 1, 1,
0.01637197, -0.7526627, 3.290021, 0, 0, 0, 1, 1,
0.01679039, 0.8285094, -0.591432, 0, 0, 0, 1, 1,
0.02274754, 1.488797, -0.05770878, 0, 0, 0, 1, 1,
0.02382831, -1.217244, 4.071244, 0, 0, 0, 1, 1,
0.0273814, 0.3015253, -1.026134, 0, 0, 0, 1, 1,
0.03296005, 2.725406, -0.2399997, 0, 0, 0, 1, 1,
0.03703608, 0.6915134, -0.5475702, 0, 0, 0, 1, 1,
0.03850724, 0.5149553, -1.861971, 1, 1, 1, 1, 1,
0.04011964, 0.725207, 0.2491675, 1, 1, 1, 1, 1,
0.04226968, 1.076802, -0.1026648, 1, 1, 1, 1, 1,
0.04310342, 0.1373343, 0.1715637, 1, 1, 1, 1, 1,
0.04377747, 0.2993391, 0.9655896, 1, 1, 1, 1, 1,
0.0506934, 0.6653152, -0.8259852, 1, 1, 1, 1, 1,
0.05359856, -0.950394, 3.805026, 1, 1, 1, 1, 1,
0.05406904, -0.2274223, 3.169381, 1, 1, 1, 1, 1,
0.05897124, -0.6591247, 3.341301, 1, 1, 1, 1, 1,
0.0601059, 1.799729, -0.08822367, 1, 1, 1, 1, 1,
0.06051432, 0.8752177, -0.6893094, 1, 1, 1, 1, 1,
0.06301513, 0.8224137, -1.137754, 1, 1, 1, 1, 1,
0.06315219, 0.5465198, 1.210281, 1, 1, 1, 1, 1,
0.06800935, 0.3914419, -0.08906517, 1, 1, 1, 1, 1,
0.07068083, 0.499815, 0.5227321, 1, 1, 1, 1, 1,
0.07321456, 0.07901506, 0.2210178, 0, 0, 1, 1, 1,
0.07445823, 0.6061314, -0.4708706, 1, 0, 0, 1, 1,
0.07463901, 0.7588109, 1.451783, 1, 0, 0, 1, 1,
0.07723044, -1.967496, 4.056798, 1, 0, 0, 1, 1,
0.07939192, -0.9815235, 3.777405, 1, 0, 0, 1, 1,
0.08285523, -1.234568, 3.556634, 1, 0, 0, 1, 1,
0.0864338, -0.7044777, 2.953162, 0, 0, 0, 1, 1,
0.08937542, -1.978474, 5.85336, 0, 0, 0, 1, 1,
0.09119852, 0.3329526, 1.224558, 0, 0, 0, 1, 1,
0.098182, 0.2235642, 0.2310058, 0, 0, 0, 1, 1,
0.1014285, -0.1871416, 3.330275, 0, 0, 0, 1, 1,
0.1071504, 1.128802, 1.359457, 0, 0, 0, 1, 1,
0.1100089, 0.0120828, 1.565076, 0, 0, 0, 1, 1,
0.1121028, 0.2516388, 0.814239, 1, 1, 1, 1, 1,
0.1139112, 1.610892, -0.6140756, 1, 1, 1, 1, 1,
0.1152089, 0.2518604, 2.746409, 1, 1, 1, 1, 1,
0.122112, 1.140632, -0.1452598, 1, 1, 1, 1, 1,
0.1258328, -0.9942417, 1.379496, 1, 1, 1, 1, 1,
0.1271119, -0.9448043, 4.298769, 1, 1, 1, 1, 1,
0.1326699, 2.165818, 0.2876276, 1, 1, 1, 1, 1,
0.1343659, 0.9553212, 0.2049827, 1, 1, 1, 1, 1,
0.1347041, -1.132543, 5.822168, 1, 1, 1, 1, 1,
0.1359794, 1.270963, -0.4721632, 1, 1, 1, 1, 1,
0.1379278, 0.4490022, 0.1565985, 1, 1, 1, 1, 1,
0.1382857, 0.7038003, 2.732654, 1, 1, 1, 1, 1,
0.1390662, -0.8253773, 1.336562, 1, 1, 1, 1, 1,
0.141181, -0.9302216, 1.663647, 1, 1, 1, 1, 1,
0.1473944, 0.3350115, 0.6239702, 1, 1, 1, 1, 1,
0.1481011, -1.328121, 3.680485, 0, 0, 1, 1, 1,
0.1481617, -0.9711163, 4.282497, 1, 0, 0, 1, 1,
0.1506063, 0.3478777, -0.2148824, 1, 0, 0, 1, 1,
0.1516776, 1.569494, 0.1616748, 1, 0, 0, 1, 1,
0.1613778, -0.8005104, 2.951823, 1, 0, 0, 1, 1,
0.1643456, -1.389969, 1.477256, 1, 0, 0, 1, 1,
0.1691087, 0.01529369, 0.6286143, 0, 0, 0, 1, 1,
0.1695019, 0.4345494, 1.86104, 0, 0, 0, 1, 1,
0.1698792, -1.465441, 3.896585, 0, 0, 0, 1, 1,
0.1758638, 1.509995, -0.4551415, 0, 0, 0, 1, 1,
0.1780349, -0.30837, 1.784323, 0, 0, 0, 1, 1,
0.1806679, -1.315563, 3.331697, 0, 0, 0, 1, 1,
0.1809507, -0.06786673, 0.7554113, 0, 0, 0, 1, 1,
0.1883057, -2.136801, 3.718694, 1, 1, 1, 1, 1,
0.1906727, 0.5397137, 1.554409, 1, 1, 1, 1, 1,
0.1922765, 1.515089, 1.668958, 1, 1, 1, 1, 1,
0.1938718, -1.690014, 3.597681, 1, 1, 1, 1, 1,
0.1943602, 0.9627355, 0.9267271, 1, 1, 1, 1, 1,
0.1985352, 0.387653, -1.54679, 1, 1, 1, 1, 1,
0.200144, 0.2555937, 0.671555, 1, 1, 1, 1, 1,
0.2002721, 0.1262511, 0.9972555, 1, 1, 1, 1, 1,
0.2060322, -0.7717842, 2.82757, 1, 1, 1, 1, 1,
0.2060456, 1.304874, 2.457348, 1, 1, 1, 1, 1,
0.2073131, -1.063866, 5.862352, 1, 1, 1, 1, 1,
0.207353, -0.3698744, 3.774728, 1, 1, 1, 1, 1,
0.2107048, 0.3113545, 2.71162, 1, 1, 1, 1, 1,
0.2122989, -1.605665, 1.650936, 1, 1, 1, 1, 1,
0.216085, 0.5600128, 0.7984326, 1, 1, 1, 1, 1,
0.2183237, 0.9155424, 0.1219663, 0, 0, 1, 1, 1,
0.2229172, -0.3918885, 3.815266, 1, 0, 0, 1, 1,
0.2230507, -0.02567034, 1.840559, 1, 0, 0, 1, 1,
0.2248582, -0.3822061, 0.8121735, 1, 0, 0, 1, 1,
0.2268628, 0.02862379, 0.08005252, 1, 0, 0, 1, 1,
0.2310068, -0.6671155, 3.50853, 1, 0, 0, 1, 1,
0.2325104, -1.090952, 3.074829, 0, 0, 0, 1, 1,
0.2344473, -0.5302118, 3.274601, 0, 0, 0, 1, 1,
0.2368964, 0.1898897, 0.2846693, 0, 0, 0, 1, 1,
0.2370173, -0.1833751, 1.475264, 0, 0, 0, 1, 1,
0.2391153, -0.3917376, 2.280408, 0, 0, 0, 1, 1,
0.2411675, 0.54079, 0.1266684, 0, 0, 0, 1, 1,
0.2415926, 0.1560222, 2.990836, 0, 0, 0, 1, 1,
0.2421703, 1.388018, 0.4048031, 1, 1, 1, 1, 1,
0.2450119, 0.196913, 0.3360412, 1, 1, 1, 1, 1,
0.2464368, 0.4180082, 1.397098, 1, 1, 1, 1, 1,
0.2469363, 0.5577027, 0.2888626, 1, 1, 1, 1, 1,
0.2494005, 0.2788932, 1.17691, 1, 1, 1, 1, 1,
0.2516054, 0.871676, 0.762631, 1, 1, 1, 1, 1,
0.2538557, -0.2728099, 3.281259, 1, 1, 1, 1, 1,
0.2542898, 0.3661626, 2.031052, 1, 1, 1, 1, 1,
0.2560685, -0.5948151, 2.572299, 1, 1, 1, 1, 1,
0.2572059, -0.6285095, 1.320795, 1, 1, 1, 1, 1,
0.2575257, -1.533593, 0.6010888, 1, 1, 1, 1, 1,
0.2594998, -0.2639472, 1.862156, 1, 1, 1, 1, 1,
0.260994, -0.5165454, 2.337358, 1, 1, 1, 1, 1,
0.2621675, 1.377601, 0.2941354, 1, 1, 1, 1, 1,
0.262949, 1.451762, -0.0587901, 1, 1, 1, 1, 1,
0.2633621, -1.935214, 2.282976, 0, 0, 1, 1, 1,
0.2637143, -0.3724725, 4.514356, 1, 0, 0, 1, 1,
0.2653881, 0.7072657, 0.3524941, 1, 0, 0, 1, 1,
0.2674766, -1.187143, 3.314644, 1, 0, 0, 1, 1,
0.2708536, 0.4981423, 0.9514236, 1, 0, 0, 1, 1,
0.2764803, -1.138334, 3.117808, 1, 0, 0, 1, 1,
0.2790198, -1.289991, 4.33684, 0, 0, 0, 1, 1,
0.2790574, 0.5028127, 0.1592604, 0, 0, 0, 1, 1,
0.2849126, -0.5672014, 2.267555, 0, 0, 0, 1, 1,
0.2870394, -1.563176, 3.400837, 0, 0, 0, 1, 1,
0.2873754, -1.510511, 3.154386, 0, 0, 0, 1, 1,
0.2893588, -0.2006277, 2.360708, 0, 0, 0, 1, 1,
0.2917729, 0.4706475, 1.35728, 0, 0, 0, 1, 1,
0.2933204, 0.6651143, -0.03668612, 1, 1, 1, 1, 1,
0.2956358, -0.5518482, 3.287413, 1, 1, 1, 1, 1,
0.2992277, 0.02248035, 3.153548, 1, 1, 1, 1, 1,
0.2995082, -1.111268, 1.959478, 1, 1, 1, 1, 1,
0.3017002, -0.7031479, 3.200918, 1, 1, 1, 1, 1,
0.3037054, 0.6097499, -0.1668555, 1, 1, 1, 1, 1,
0.3070486, 1.445176, -0.1681525, 1, 1, 1, 1, 1,
0.3081339, 1.80431, 1.821639, 1, 1, 1, 1, 1,
0.3098742, -0.2964568, 3.076095, 1, 1, 1, 1, 1,
0.3111781, -0.6937932, 2.267339, 1, 1, 1, 1, 1,
0.3153832, 1.204035, 3.64167, 1, 1, 1, 1, 1,
0.3263063, -0.2983279, 3.199703, 1, 1, 1, 1, 1,
0.3314491, 0.005075304, 1.142621, 1, 1, 1, 1, 1,
0.3316392, -0.4036225, 4.208578, 1, 1, 1, 1, 1,
0.3326745, -0.163267, 1.203086, 1, 1, 1, 1, 1,
0.335214, 0.7536631, 0.9333891, 0, 0, 1, 1, 1,
0.3374003, -0.5466241, 1.362447, 1, 0, 0, 1, 1,
0.3383602, 0.2682675, 1.832183, 1, 0, 0, 1, 1,
0.3388746, 0.3737682, -0.4503065, 1, 0, 0, 1, 1,
0.34215, -0.1532609, 1.045129, 1, 0, 0, 1, 1,
0.342543, 1.37401, -0.841083, 1, 0, 0, 1, 1,
0.3431555, -0.6440939, 3.262681, 0, 0, 0, 1, 1,
0.3444144, 1.228296, 0.3069701, 0, 0, 0, 1, 1,
0.3456026, 0.9807022, 0.6334539, 0, 0, 0, 1, 1,
0.3466144, -0.3185472, 0.6609707, 0, 0, 0, 1, 1,
0.3476515, 0.1607432, 0.6292608, 0, 0, 0, 1, 1,
0.3498361, 2.301371, 0.497756, 0, 0, 0, 1, 1,
0.3563453, 1.645621, 0.5691951, 0, 0, 0, 1, 1,
0.3600512, 0.3493103, 0.540718, 1, 1, 1, 1, 1,
0.3620695, 0.5432376, 1.286911, 1, 1, 1, 1, 1,
0.3633684, -1.051726, 2.463671, 1, 1, 1, 1, 1,
0.3652618, -0.04217786, 2.984269, 1, 1, 1, 1, 1,
0.3724566, 1.730191, 1.506637, 1, 1, 1, 1, 1,
0.3745623, 0.7823756, 1.301133, 1, 1, 1, 1, 1,
0.37857, -1.04679, 3.934214, 1, 1, 1, 1, 1,
0.3823892, 1.483148, 0.6414371, 1, 1, 1, 1, 1,
0.3840403, 0.2629513, -0.4172405, 1, 1, 1, 1, 1,
0.3879775, 1.777435, 0.7434586, 1, 1, 1, 1, 1,
0.3883868, -0.3553407, 1.157238, 1, 1, 1, 1, 1,
0.3918664, 0.9791035, 0.2288681, 1, 1, 1, 1, 1,
0.3951728, -1.126444, 3.848529, 1, 1, 1, 1, 1,
0.3961939, -2.113815, 1.89589, 1, 1, 1, 1, 1,
0.3963238, 1.187978, 0.8244702, 1, 1, 1, 1, 1,
0.4022877, -0.5248533, 1.453383, 0, 0, 1, 1, 1,
0.404579, 1.800178, 0.7102978, 1, 0, 0, 1, 1,
0.4063426, 0.3339824, 1.006495, 1, 0, 0, 1, 1,
0.4123858, -1.125247, 3.440826, 1, 0, 0, 1, 1,
0.41607, 0.4363937, 0.3078967, 1, 0, 0, 1, 1,
0.4170533, -0.8877093, 3.863733, 1, 0, 0, 1, 1,
0.4177605, 1.333845, -0.9637893, 0, 0, 0, 1, 1,
0.4187113, -1.503642, 2.321286, 0, 0, 0, 1, 1,
0.4199926, -0.01024349, 1.871685, 0, 0, 0, 1, 1,
0.4237754, 1.126561, -0.01340075, 0, 0, 0, 1, 1,
0.4241993, -0.9950467, 5.020412, 0, 0, 0, 1, 1,
0.425172, 0.02803703, 0.5258082, 0, 0, 0, 1, 1,
0.4256617, 1.23608, 1.04884, 0, 0, 0, 1, 1,
0.427303, -0.8822147, 3.23082, 1, 1, 1, 1, 1,
0.4297464, -0.2068563, 2.408845, 1, 1, 1, 1, 1,
0.4312297, -0.02242385, 2.688628, 1, 1, 1, 1, 1,
0.4328339, 0.1473461, 1.71017, 1, 1, 1, 1, 1,
0.4339653, 0.3362363, 1.104921, 1, 1, 1, 1, 1,
0.4441376, -1.575028, 1.795383, 1, 1, 1, 1, 1,
0.4458265, 1.115426, -0.4684957, 1, 1, 1, 1, 1,
0.448039, -2.289836, 1.491327, 1, 1, 1, 1, 1,
0.4511781, -0.9676847, 2.402531, 1, 1, 1, 1, 1,
0.4540421, 0.9107229, -1.288071, 1, 1, 1, 1, 1,
0.4574311, 0.7612275, 0.2443412, 1, 1, 1, 1, 1,
0.4578522, 0.2762106, 0.8048189, 1, 1, 1, 1, 1,
0.4604022, -2.174998, 4.763156, 1, 1, 1, 1, 1,
0.4636954, 0.440637, -0.6844794, 1, 1, 1, 1, 1,
0.4698735, 0.6256057, -0.08681198, 1, 1, 1, 1, 1,
0.4700598, -0.4246421, 2.528509, 0, 0, 1, 1, 1,
0.4723329, -0.5539235, 2.247428, 1, 0, 0, 1, 1,
0.4726578, -0.3166869, 1.850025, 1, 0, 0, 1, 1,
0.4727485, -0.5241995, 2.668989, 1, 0, 0, 1, 1,
0.4765493, 0.8134376, -0.1739059, 1, 0, 0, 1, 1,
0.4771878, -0.1129691, 1.752018, 1, 0, 0, 1, 1,
0.4794388, 1.014319, 1.60148, 0, 0, 0, 1, 1,
0.4822644, 0.6297999, -0.2862674, 0, 0, 0, 1, 1,
0.4839991, 1.181709, 1.546669, 0, 0, 0, 1, 1,
0.4874663, -0.1512741, 0.8896295, 0, 0, 0, 1, 1,
0.4896685, 1.04918, 2.055129, 0, 0, 0, 1, 1,
0.4913597, -0.2830365, 2.989676, 0, 0, 0, 1, 1,
0.4986616, -0.1613086, 0.3720943, 0, 0, 0, 1, 1,
0.5001956, 0.3902338, -0.4057734, 1, 1, 1, 1, 1,
0.501343, 0.1162294, 2.089819, 1, 1, 1, 1, 1,
0.5040053, -0.8878044, 2.820027, 1, 1, 1, 1, 1,
0.5085697, -1.569338, 2.989742, 1, 1, 1, 1, 1,
0.5112289, -1.824089, 4.971212, 1, 1, 1, 1, 1,
0.512589, 1.815839, 0.376135, 1, 1, 1, 1, 1,
0.5136147, -0.4629799, 1.756427, 1, 1, 1, 1, 1,
0.5167357, 0.3289062, 0.1321154, 1, 1, 1, 1, 1,
0.5176913, 0.1188086, 1.894983, 1, 1, 1, 1, 1,
0.5178894, 0.7504247, 2.64298, 1, 1, 1, 1, 1,
0.5179341, 1.365857, 0.04194866, 1, 1, 1, 1, 1,
0.5189054, 0.2393901, 1.677809, 1, 1, 1, 1, 1,
0.5192165, 1.678105, -0.4045991, 1, 1, 1, 1, 1,
0.5195256, 0.9952728, -0.1433928, 1, 1, 1, 1, 1,
0.5216832, 0.1857628, 1.207873, 1, 1, 1, 1, 1,
0.5230865, -0.8637754, 2.624289, 0, 0, 1, 1, 1,
0.5249511, -1.204226, 3.316984, 1, 0, 0, 1, 1,
0.5296144, -1.882951, 6.406801, 1, 0, 0, 1, 1,
0.5377409, 0.3232298, -0.448614, 1, 0, 0, 1, 1,
0.5381913, -1.568331, 2.70429, 1, 0, 0, 1, 1,
0.5392618, 0.1026646, 0.1665001, 1, 0, 0, 1, 1,
0.539848, -1.194778, 2.543659, 0, 0, 0, 1, 1,
0.541505, 1.048889, 2.052766, 0, 0, 0, 1, 1,
0.542078, -2.611054, 3.627385, 0, 0, 0, 1, 1,
0.543448, 1.711269, 0.9811216, 0, 0, 0, 1, 1,
0.5490259, 2.474281, 0.008825605, 0, 0, 0, 1, 1,
0.5501482, 1.905664, 0.08374903, 0, 0, 0, 1, 1,
0.5506095, -0.4626499, 2.984331, 0, 0, 0, 1, 1,
0.5571048, 0.2392933, 1.394199, 1, 1, 1, 1, 1,
0.5582857, -0.6210586, 2.350915, 1, 1, 1, 1, 1,
0.561195, -0.4618558, 3.2892, 1, 1, 1, 1, 1,
0.562386, -1.877141, 3.211078, 1, 1, 1, 1, 1,
0.5642037, -0.7360318, 3.049506, 1, 1, 1, 1, 1,
0.5649142, 0.7824849, 0.8540764, 1, 1, 1, 1, 1,
0.5690523, 0.3434963, 0.3790596, 1, 1, 1, 1, 1,
0.5739742, -0.8366776, 1.965253, 1, 1, 1, 1, 1,
0.576864, -1.010712, 1.927798, 1, 1, 1, 1, 1,
0.5809767, 0.05583486, 1.044791, 1, 1, 1, 1, 1,
0.5834282, 0.8504493, -0.2311079, 1, 1, 1, 1, 1,
0.5850434, -0.3714837, 2.932586, 1, 1, 1, 1, 1,
0.5928583, 1.027696, 0.2709318, 1, 1, 1, 1, 1,
0.5997077, -0.9710382, 2.098909, 1, 1, 1, 1, 1,
0.600437, 0.1680967, -0.747842, 1, 1, 1, 1, 1,
0.6016098, -0.4234506, 0.8550816, 0, 0, 1, 1, 1,
0.6023924, -0.741654, 1.119887, 1, 0, 0, 1, 1,
0.6033523, -1.035053, 3.143874, 1, 0, 0, 1, 1,
0.6062944, 1.709522, 1.130207, 1, 0, 0, 1, 1,
0.6072803, -1.063464, 3.611577, 1, 0, 0, 1, 1,
0.6132806, 0.216456, -0.2116645, 1, 0, 0, 1, 1,
0.614632, -2.624012, 3.623244, 0, 0, 0, 1, 1,
0.617821, 0.8180124, -1.041167, 0, 0, 0, 1, 1,
0.6182929, 0.6777081, 0.7566791, 0, 0, 0, 1, 1,
0.6237231, 1.2248, 0.3781991, 0, 0, 0, 1, 1,
0.6329502, -0.8847852, 4.478878, 0, 0, 0, 1, 1,
0.6338488, -0.5157747, 3.029629, 0, 0, 0, 1, 1,
0.6356242, 0.1569154, 2.260403, 0, 0, 0, 1, 1,
0.6373338, -0.9182854, 3.201826, 1, 1, 1, 1, 1,
0.6393017, 0.07581826, 1.134492, 1, 1, 1, 1, 1,
0.6406024, -0.1129049, 0.9844149, 1, 1, 1, 1, 1,
0.6422797, 0.4873524, 0.7166561, 1, 1, 1, 1, 1,
0.6445171, -1.09733, 4.183579, 1, 1, 1, 1, 1,
0.6460276, -0.2504546, 2.428572, 1, 1, 1, 1, 1,
0.6498837, 1.929108, 1.01559, 1, 1, 1, 1, 1,
0.6508616, 1.535027, -0.02873357, 1, 1, 1, 1, 1,
0.6573647, -1.086389, 2.806959, 1, 1, 1, 1, 1,
0.6582868, 1.13523, -0.4262713, 1, 1, 1, 1, 1,
0.6598926, 0.1914828, 1.498273, 1, 1, 1, 1, 1,
0.6615993, 1.219861, 0.8596576, 1, 1, 1, 1, 1,
0.6647683, 0.5548936, 1.166962, 1, 1, 1, 1, 1,
0.6726373, -0.7586072, 1.346749, 1, 1, 1, 1, 1,
0.6739597, 0.03334487, 2.070192, 1, 1, 1, 1, 1,
0.6805211, -2.015556, 3.580259, 0, 0, 1, 1, 1,
0.6814227, -0.7707251, 2.26181, 1, 0, 0, 1, 1,
0.6967033, -0.4194897, 2.645259, 1, 0, 0, 1, 1,
0.6975584, -0.4367161, 3.066959, 1, 0, 0, 1, 1,
0.6978754, 0.0386435, 2.768582, 1, 0, 0, 1, 1,
0.7036598, 0.3844905, 0.9749183, 1, 0, 0, 1, 1,
0.7125318, 0.6531129, 0.1037655, 0, 0, 0, 1, 1,
0.7145987, -1.75025, 2.72304, 0, 0, 0, 1, 1,
0.7210113, 0.470405, -1.104183, 0, 0, 0, 1, 1,
0.7213346, 1.51704, -0.1026295, 0, 0, 0, 1, 1,
0.7237923, -0.5859584, 1.208537, 0, 0, 0, 1, 1,
0.7265531, -0.04606146, 2.863092, 0, 0, 0, 1, 1,
0.7309155, 0.8691154, 1.212436, 0, 0, 0, 1, 1,
0.7390797, -0.3792432, -0.015991, 1, 1, 1, 1, 1,
0.7425647, 0.8854706, 2.168844, 1, 1, 1, 1, 1,
0.7523695, -0.8592808, 3.002937, 1, 1, 1, 1, 1,
0.752798, -1.341177, 1.583853, 1, 1, 1, 1, 1,
0.7550878, 1.670845, -0.2278602, 1, 1, 1, 1, 1,
0.7574359, 1.232156, 1.104351, 1, 1, 1, 1, 1,
0.7575089, 1.121816, -0.7856541, 1, 1, 1, 1, 1,
0.7599645, -0.5702547, 1.913058, 1, 1, 1, 1, 1,
0.7643968, -0.6462364, 2.153449, 1, 1, 1, 1, 1,
0.7655692, 0.5693609, 1.686699, 1, 1, 1, 1, 1,
0.7692201, 0.3094252, 0.8045053, 1, 1, 1, 1, 1,
0.7709174, 0.07934456, 1.543316, 1, 1, 1, 1, 1,
0.7762334, 1.679453, -0.06352324, 1, 1, 1, 1, 1,
0.7782162, 0.03087873, 1.707287, 1, 1, 1, 1, 1,
0.7811879, 0.2667386, 2.642073, 1, 1, 1, 1, 1,
0.7859869, 1.122746, 0.4905219, 0, 0, 1, 1, 1,
0.7879893, 0.7190827, 2.206688, 1, 0, 0, 1, 1,
0.7905161, -1.259218, 3.281207, 1, 0, 0, 1, 1,
0.7958314, -0.1406563, 0.9453316, 1, 0, 0, 1, 1,
0.7965311, 0.6477066, 1.918627, 1, 0, 0, 1, 1,
0.8024023, -2.069617, 5.002573, 1, 0, 0, 1, 1,
0.8101789, 0.8860026, -0.4529839, 0, 0, 0, 1, 1,
0.8217884, 0.4812793, 1.314413, 0, 0, 0, 1, 1,
0.822714, -0.5549134, 2.363689, 0, 0, 0, 1, 1,
0.8235514, 0.5613853, 1.292105, 0, 0, 0, 1, 1,
0.8241709, -0.9452168, 3.780052, 0, 0, 0, 1, 1,
0.8281646, -1.400073, 2.332694, 0, 0, 0, 1, 1,
0.8303123, -0.8819058, 2.337819, 0, 0, 0, 1, 1,
0.8328761, -0.8708214, 4.324844, 1, 1, 1, 1, 1,
0.8381739, 0.2824417, 1.054346, 1, 1, 1, 1, 1,
0.8388724, 1.613869, 0.8922536, 1, 1, 1, 1, 1,
0.840126, 0.8833911, 0.8906835, 1, 1, 1, 1, 1,
0.8467839, 0.1405857, 0.5793329, 1, 1, 1, 1, 1,
0.8470296, -1.002918, 1.763729, 1, 1, 1, 1, 1,
0.847078, 0.4307602, 0.8149105, 1, 1, 1, 1, 1,
0.8476905, 0.7619122, 1.372772, 1, 1, 1, 1, 1,
0.8484944, 0.2888287, 2.061373, 1, 1, 1, 1, 1,
0.8511705, 0.9395694, 0.5570516, 1, 1, 1, 1, 1,
0.8628779, 0.3898987, 1.20252, 1, 1, 1, 1, 1,
0.8657331, 1.116724, -0.8400749, 1, 1, 1, 1, 1,
0.8693764, -0.07674771, 2.571645, 1, 1, 1, 1, 1,
0.8765321, 0.8156849, 1.105875, 1, 1, 1, 1, 1,
0.8773603, 0.1420399, 1.357737, 1, 1, 1, 1, 1,
0.8821925, -0.08350156, 2.528223, 0, 0, 1, 1, 1,
0.883067, -0.5073214, 2.798888, 1, 0, 0, 1, 1,
0.8865136, -2.488741, 3.927848, 1, 0, 0, 1, 1,
0.8871607, 1.498741, 0.2853343, 1, 0, 0, 1, 1,
0.8877416, -0.213294, 0.9155421, 1, 0, 0, 1, 1,
0.892729, -2.184851, 1.484189, 1, 0, 0, 1, 1,
0.8967795, 1.403372, 1.16117, 0, 0, 0, 1, 1,
0.8995603, 0.4784767, 0.7826369, 0, 0, 0, 1, 1,
0.9011025, -0.3412592, 2.465732, 0, 0, 0, 1, 1,
0.90149, 0.2601959, 2.025829, 0, 0, 0, 1, 1,
0.9026378, 0.2379805, 0.4109958, 0, 0, 0, 1, 1,
0.9035296, 0.8162299, 1.280469, 0, 0, 0, 1, 1,
0.9106243, 1.153122, 0.01483857, 0, 0, 0, 1, 1,
0.9155286, -0.9965396, 3.104586, 1, 1, 1, 1, 1,
0.9161158, 0.09889156, 2.206075, 1, 1, 1, 1, 1,
0.9194998, 0.4841766, 1.904434, 1, 1, 1, 1, 1,
0.9227875, 0.2474023, 1.975046, 1, 1, 1, 1, 1,
0.9279022, 1.496389, 1.013365, 1, 1, 1, 1, 1,
0.9316095, -0.7845468, 2.019845, 1, 1, 1, 1, 1,
0.9406103, -1.372935, 2.749754, 1, 1, 1, 1, 1,
0.9497601, 0.9290211, 0.5670439, 1, 1, 1, 1, 1,
0.9604362, 0.6547235, -0.4110337, 1, 1, 1, 1, 1,
0.963931, 0.1413544, 0.7261969, 1, 1, 1, 1, 1,
0.9657146, 0.3711444, -0.3754536, 1, 1, 1, 1, 1,
0.9658871, -0.3171941, 0.3302198, 1, 1, 1, 1, 1,
0.9686249, 1.608572, 0.2914458, 1, 1, 1, 1, 1,
0.9697608, 1.034486, -0.2861992, 1, 1, 1, 1, 1,
0.971684, 0.05073256, 0.9071794, 1, 1, 1, 1, 1,
0.9744766, -0.7300225, 0.09348217, 0, 0, 1, 1, 1,
0.9759436, 0.1920908, 1.946598, 1, 0, 0, 1, 1,
0.9772372, -0.2438311, 2.054001, 1, 0, 0, 1, 1,
0.9838369, 0.1656482, 0.809248, 1, 0, 0, 1, 1,
0.9859776, -0.1672046, 1.502376, 1, 0, 0, 1, 1,
0.9930777, -1.087883, 3.311861, 1, 0, 0, 1, 1,
0.9965689, -0.3340823, 3.219517, 0, 0, 0, 1, 1,
1.001099, -1.767609, 3.890446, 0, 0, 0, 1, 1,
1.0022, 0.8076946, 2.069008, 0, 0, 0, 1, 1,
1.006199, -1.094754, 3.717404, 0, 0, 0, 1, 1,
1.01149, 0.4005074, 1.140028, 0, 0, 0, 1, 1,
1.01279, -0.6158397, 1.950525, 0, 0, 0, 1, 1,
1.013807, -2.541378, 1.798659, 0, 0, 0, 1, 1,
1.016399, 0.2386546, 0.4190605, 1, 1, 1, 1, 1,
1.016437, -0.7169423, 1.715491, 1, 1, 1, 1, 1,
1.018445, 0.6783395, 0.9670381, 1, 1, 1, 1, 1,
1.019652, -1.029827, 2.579686, 1, 1, 1, 1, 1,
1.025201, -1.213274, 1.887813, 1, 1, 1, 1, 1,
1.026362, 0.8396521, 2.117285, 1, 1, 1, 1, 1,
1.027446, 0.3842255, -0.3662748, 1, 1, 1, 1, 1,
1.040987, -0.872121, 4.287686, 1, 1, 1, 1, 1,
1.042013, -0.1160132, 1.333942, 1, 1, 1, 1, 1,
1.042707, 0.5119026, -1.001753, 1, 1, 1, 1, 1,
1.048632, 1.4628, 1.522975, 1, 1, 1, 1, 1,
1.060538, 0.08595417, 0.1497661, 1, 1, 1, 1, 1,
1.078297, -0.5944456, 1.552197, 1, 1, 1, 1, 1,
1.087088, 1.062584, 0.4336693, 1, 1, 1, 1, 1,
1.087657, 1.354955, 1.737654, 1, 1, 1, 1, 1,
1.088113, 1.101197, 0.9802387, 0, 0, 1, 1, 1,
1.089571, 0.09875036, 0.4993493, 1, 0, 0, 1, 1,
1.089623, 0.1556798, 0.6226391, 1, 0, 0, 1, 1,
1.092289, -0.6623004, 0.2068271, 1, 0, 0, 1, 1,
1.10065, 0.1272252, 1.450132, 1, 0, 0, 1, 1,
1.110419, -0.2996112, 2.520695, 1, 0, 0, 1, 1,
1.117453, -1.43273, 1.837647, 0, 0, 0, 1, 1,
1.122884, -0.005973483, 2.48728, 0, 0, 0, 1, 1,
1.132093, 0.1496143, 2.765791, 0, 0, 0, 1, 1,
1.134462, -0.4220151, 1.451185, 0, 0, 0, 1, 1,
1.14236, -0.2514628, 3.481575, 0, 0, 0, 1, 1,
1.155482, 0.9119531, 0.6405478, 0, 0, 0, 1, 1,
1.160547, -1.520449, 2.079829, 0, 0, 0, 1, 1,
1.166288, 0.5951363, 1.332992, 1, 1, 1, 1, 1,
1.177206, -0.3211148, 2.341955, 1, 1, 1, 1, 1,
1.181601, -1.498613, 3.110242, 1, 1, 1, 1, 1,
1.185678, 0.4584618, 1.682634, 1, 1, 1, 1, 1,
1.185761, 1.743308, 0.3506379, 1, 1, 1, 1, 1,
1.208836, 0.1126136, 2.46379, 1, 1, 1, 1, 1,
1.221287, -0.1874695, 1.726889, 1, 1, 1, 1, 1,
1.227552, 0.260648, 0.881227, 1, 1, 1, 1, 1,
1.23098, -1.933553, 2.684874, 1, 1, 1, 1, 1,
1.233684, -0.6695015, 3.706647, 1, 1, 1, 1, 1,
1.238517, 1.649798, 0.2639406, 1, 1, 1, 1, 1,
1.238659, 0.8168639, 0.8284086, 1, 1, 1, 1, 1,
1.23995, 2.158811, 0.25572, 1, 1, 1, 1, 1,
1.249573, -0.3473351, 2.486586, 1, 1, 1, 1, 1,
1.258786, 0.3405891, 2.082276, 1, 1, 1, 1, 1,
1.27374, -0.810252, 2.231949, 0, 0, 1, 1, 1,
1.282168, 1.019566, 2.654522, 1, 0, 0, 1, 1,
1.288258, -0.2907966, 1.592317, 1, 0, 0, 1, 1,
1.293187, -1.417571, 1.834035, 1, 0, 0, 1, 1,
1.29327, 0.5132468, 1.489451, 1, 0, 0, 1, 1,
1.295781, -0.05957251, 1.355887, 1, 0, 0, 1, 1,
1.296212, -0.8764687, 1.134345, 0, 0, 0, 1, 1,
1.299984, -2.105491, 3.6674, 0, 0, 0, 1, 1,
1.302144, 1.120896, 1.915093, 0, 0, 0, 1, 1,
1.307187, 0.9033116, -0.1794508, 0, 0, 0, 1, 1,
1.310969, 1.330947, 0.7348006, 0, 0, 0, 1, 1,
1.325841, -1.564484, 2.35128, 0, 0, 0, 1, 1,
1.32692, -1.018449, 3.666195, 0, 0, 0, 1, 1,
1.329611, -1.888889, 2.662569, 1, 1, 1, 1, 1,
1.334162, 1.537374, 1.320286, 1, 1, 1, 1, 1,
1.345462, 0.3550398, 3.060291, 1, 1, 1, 1, 1,
1.36051, 1.2623, 0.4830716, 1, 1, 1, 1, 1,
1.364601, -0.4228854, 0.1058408, 1, 1, 1, 1, 1,
1.371155, 0.4740449, 0.3897855, 1, 1, 1, 1, 1,
1.381239, 1.296237, 0.6799273, 1, 1, 1, 1, 1,
1.382154, 0.6365179, -0.75321, 1, 1, 1, 1, 1,
1.384905, 0.7007183, 0.9913641, 1, 1, 1, 1, 1,
1.385181, 0.3586093, 0.7596141, 1, 1, 1, 1, 1,
1.403084, -1.936294, 2.207734, 1, 1, 1, 1, 1,
1.404838, -0.4626206, 0.7936888, 1, 1, 1, 1, 1,
1.406996, -0.2742401, 0.7544659, 1, 1, 1, 1, 1,
1.411106, -0.9740777, 2.597533, 1, 1, 1, 1, 1,
1.42302, 0.8606437, 1.925889, 1, 1, 1, 1, 1,
1.424571, -0.3243819, 2.725907, 0, 0, 1, 1, 1,
1.437395, -0.4270438, 1.50545, 1, 0, 0, 1, 1,
1.454178, 0.0797732, 1.539659, 1, 0, 0, 1, 1,
1.460602, -0.3172234, 2.128267, 1, 0, 0, 1, 1,
1.465873, 0.3440434, -0.4306836, 1, 0, 0, 1, 1,
1.473932, -0.8689187, 2.485986, 1, 0, 0, 1, 1,
1.477863, 1.405717, 0.093601, 0, 0, 0, 1, 1,
1.485204, 0.7831042, 1.651635, 0, 0, 0, 1, 1,
1.502081, 0.5417655, 0.6826663, 0, 0, 0, 1, 1,
1.502093, -1.492599, 2.343471, 0, 0, 0, 1, 1,
1.503747, 0.1101501, -0.3128345, 0, 0, 0, 1, 1,
1.505281, -0.1344081, 3.702212, 0, 0, 0, 1, 1,
1.505836, 1.794061, 1.10696, 0, 0, 0, 1, 1,
1.518383, 0.4245281, 0.7343291, 1, 1, 1, 1, 1,
1.523756, 1.279182, 0.4630008, 1, 1, 1, 1, 1,
1.5359, 0.2188989, 2.084896, 1, 1, 1, 1, 1,
1.545886, -0.1160689, 0.401655, 1, 1, 1, 1, 1,
1.561873, 1.696906, 0.9450939, 1, 1, 1, 1, 1,
1.565731, 1.825666, -0.3383151, 1, 1, 1, 1, 1,
1.565735, 1.102906, 0.495259, 1, 1, 1, 1, 1,
1.572155, -1.102021, 1.221795, 1, 1, 1, 1, 1,
1.574547, -0.7730485, 0.5078438, 1, 1, 1, 1, 1,
1.582895, -0.183717, 1.125106, 1, 1, 1, 1, 1,
1.583025, -0.05464953, 1.815086, 1, 1, 1, 1, 1,
1.598062, -1.517739, 1.407489, 1, 1, 1, 1, 1,
1.599857, 1.119423, 1.024005, 1, 1, 1, 1, 1,
1.608144, 2.646348, -1.45731, 1, 1, 1, 1, 1,
1.611305, -0.9620064, 1.743854, 1, 1, 1, 1, 1,
1.611924, 0.7238294, 2.654398, 0, 0, 1, 1, 1,
1.620692, 1.465463, 1.492748, 1, 0, 0, 1, 1,
1.623646, -0.7514554, 2.92666, 1, 0, 0, 1, 1,
1.628058, 1.56658, 1.247252, 1, 0, 0, 1, 1,
1.654841, -0.1509332, 1.618061, 1, 0, 0, 1, 1,
1.687974, -2.108735, 2.813008, 1, 0, 0, 1, 1,
1.712674, 1.076801, 0.4781568, 0, 0, 0, 1, 1,
1.757798, -0.4795065, 1.661603, 0, 0, 0, 1, 1,
1.761544, -1.015336, 1.565986, 0, 0, 0, 1, 1,
1.780617, 0.4053359, 1.035697, 0, 0, 0, 1, 1,
1.787316, -0.05678768, -0.4113423, 0, 0, 0, 1, 1,
1.805506, 1.628383, 0.7450367, 0, 0, 0, 1, 1,
1.811402, -0.1957869, 1.247354, 0, 0, 0, 1, 1,
1.827708, 0.3853823, 1.459263, 1, 1, 1, 1, 1,
1.848672, 1.375012, 3.226056, 1, 1, 1, 1, 1,
1.858797, 0.1044302, 2.222526, 1, 1, 1, 1, 1,
1.859002, -1.071842, 2.694957, 1, 1, 1, 1, 1,
1.884523, 1.266777, 0.5315894, 1, 1, 1, 1, 1,
1.93775, -1.350276, 4.471733, 1, 1, 1, 1, 1,
1.950665, 0.3655446, 0.9289449, 1, 1, 1, 1, 1,
1.957121, 1.508769, 2.618563, 1, 1, 1, 1, 1,
1.964259, -0.706059, 0.7098205, 1, 1, 1, 1, 1,
1.986112, -0.1702912, 3.03769, 1, 1, 1, 1, 1,
2.017381, -1.921565, 1.971666, 1, 1, 1, 1, 1,
2.044159, -0.7065369, 3.668994, 1, 1, 1, 1, 1,
2.059515, -0.04120458, 1.515918, 1, 1, 1, 1, 1,
2.181344, 1.462109, -0.005810859, 1, 1, 1, 1, 1,
2.192107, -0.7749621, 2.611942, 1, 1, 1, 1, 1,
2.214354, 0.3150633, 0.732572, 0, 0, 1, 1, 1,
2.232208, -0.288639, 1.947333, 1, 0, 0, 1, 1,
2.286052, -0.7991599, 1.884021, 1, 0, 0, 1, 1,
2.303182, 1.321548, 2.208014, 1, 0, 0, 1, 1,
2.307673, 0.4035845, 1.505137, 1, 0, 0, 1, 1,
2.318796, 1.680335, 1.300628, 1, 0, 0, 1, 1,
2.331696, 0.8561324, 1.587735, 0, 0, 0, 1, 1,
2.344779, 0.4887184, 1.536775, 0, 0, 0, 1, 1,
2.356588, -1.56838, 1.240095, 0, 0, 0, 1, 1,
2.391971, -0.6084026, 0.6800942, 0, 0, 0, 1, 1,
2.426155, 0.07772221, 2.147603, 0, 0, 0, 1, 1,
2.453137, 0.6605667, 2.620628, 0, 0, 0, 1, 1,
2.596056, -1.390027, 3.960439, 0, 0, 0, 1, 1,
2.644352, -1.054583, 1.464756, 1, 1, 1, 1, 1,
2.685838, 0.1060909, 1.910161, 1, 1, 1, 1, 1,
2.812793, -0.8150802, 1.385163, 1, 1, 1, 1, 1,
3.010117, 2.133088, 1.215057, 1, 1, 1, 1, 1,
3.080797, -1.798634, 5.23725, 1, 1, 1, 1, 1,
3.375825, -2.87917, 5.187717, 1, 1, 1, 1, 1,
3.579772, 0.2931637, 0.4955037, 1, 1, 1, 1, 1
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
var radius = 10.17777;
var distance = 35.74898;
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
mvMatrix.translate( -0.04163527, 0.449167, -0.5610394 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.74898);
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