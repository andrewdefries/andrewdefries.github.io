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
-3.18846, -0.8625514, -0.976581, 1, 0, 0, 1,
-2.869861, -0.4113877, -2.904647, 1, 0.007843138, 0, 1,
-2.794684, -1.713556, -1.683615, 1, 0.01176471, 0, 1,
-2.627716, -1.331587, -3.332628, 1, 0.01960784, 0, 1,
-2.440286, 1.577206, -1.966794, 1, 0.02352941, 0, 1,
-2.431886, 0.961994, -1.392179, 1, 0.03137255, 0, 1,
-2.399348, -0.2178566, -2.126209, 1, 0.03529412, 0, 1,
-2.370618, -0.3646694, -3.027367, 1, 0.04313726, 0, 1,
-2.349992, -0.3839964, -1.875114, 1, 0.04705882, 0, 1,
-2.338702, 0.8358516, -0.8734993, 1, 0.05490196, 0, 1,
-2.332893, 0.5514538, 0.5790848, 1, 0.05882353, 0, 1,
-2.322126, -0.4329266, -0.9805633, 1, 0.06666667, 0, 1,
-2.320208, -1.06278, -2.986926, 1, 0.07058824, 0, 1,
-2.304757, 1.599113, -0.05513133, 1, 0.07843138, 0, 1,
-2.292407, 0.9477361, -2.122852, 1, 0.08235294, 0, 1,
-2.25945, -0.7201007, -4.925366, 1, 0.09019608, 0, 1,
-2.202964, 0.6228997, -1.124151, 1, 0.09411765, 0, 1,
-2.201116, 0.4940884, -0.757692, 1, 0.1019608, 0, 1,
-2.137328, 0.384711, -1.38085, 1, 0.1098039, 0, 1,
-2.124893, -0.06112568, -0.8822697, 1, 0.1137255, 0, 1,
-2.060794, -0.1678135, -3.179919, 1, 0.1215686, 0, 1,
-2.032128, -0.7911937, -1.679898, 1, 0.1254902, 0, 1,
-2.018097, 1.096439, -2.980269, 1, 0.1333333, 0, 1,
-2.015547, 1.024157, -1.678983, 1, 0.1372549, 0, 1,
-1.994125, 0.06094598, -0.6410516, 1, 0.145098, 0, 1,
-1.989424, -0.8663136, -0.9109244, 1, 0.1490196, 0, 1,
-1.973601, 1.436174, -0.5365635, 1, 0.1568628, 0, 1,
-1.972272, -1.38652, -1.200509, 1, 0.1607843, 0, 1,
-1.971433, -1.028911, -3.63744, 1, 0.1686275, 0, 1,
-1.94856, 0.02481304, -3.303551, 1, 0.172549, 0, 1,
-1.934812, -1.138639, -2.513142, 1, 0.1803922, 0, 1,
-1.919442, -1.400548, -2.92, 1, 0.1843137, 0, 1,
-1.909331, -1.217175, -2.434252, 1, 0.1921569, 0, 1,
-1.895368, -1.322052, -3.029869, 1, 0.1960784, 0, 1,
-1.890462, -0.6466973, -1.454746, 1, 0.2039216, 0, 1,
-1.88599, 0.2541596, -0.2128157, 1, 0.2117647, 0, 1,
-1.871216, -1.080962, -1.512957, 1, 0.2156863, 0, 1,
-1.870446, -0.03441732, -0.1833251, 1, 0.2235294, 0, 1,
-1.864814, -0.03604864, -1.514744, 1, 0.227451, 0, 1,
-1.850593, -1.986844, -2.132433, 1, 0.2352941, 0, 1,
-1.847834, 0.3233405, -2.080872, 1, 0.2392157, 0, 1,
-1.813994, 0.3480346, -1.641552, 1, 0.2470588, 0, 1,
-1.809019, 0.5719694, -0.6416973, 1, 0.2509804, 0, 1,
-1.80016, 0.2540878, -1.034153, 1, 0.2588235, 0, 1,
-1.792681, -0.007710335, -0.3589025, 1, 0.2627451, 0, 1,
-1.788332, 0.6876222, -0.05912342, 1, 0.2705882, 0, 1,
-1.774536, 1.752328, 0.5921714, 1, 0.2745098, 0, 1,
-1.759609, -0.6194017, -1.886545, 1, 0.282353, 0, 1,
-1.758649, -2.500674, -3.522532, 1, 0.2862745, 0, 1,
-1.742402, 0.4170314, -2.443321, 1, 0.2941177, 0, 1,
-1.718819, -0.1520863, -1.779365, 1, 0.3019608, 0, 1,
-1.70034, 0.2281775, -1.716458, 1, 0.3058824, 0, 1,
-1.696755, 0.6549094, 0.47146, 1, 0.3137255, 0, 1,
-1.690954, -0.06223283, -3.596009, 1, 0.3176471, 0, 1,
-1.684697, -0.3300707, -1.003199, 1, 0.3254902, 0, 1,
-1.682058, 1.621925, -0.8854997, 1, 0.3294118, 0, 1,
-1.681417, 0.08998619, -1.78476, 1, 0.3372549, 0, 1,
-1.675522, -0.1685201, -0.5268167, 1, 0.3411765, 0, 1,
-1.675284, -0.4141758, -0.1477804, 1, 0.3490196, 0, 1,
-1.668423, 0.7349566, -1.61835, 1, 0.3529412, 0, 1,
-1.665627, 0.002895372, -3.157576, 1, 0.3607843, 0, 1,
-1.642632, 1.186561, -1.142959, 1, 0.3647059, 0, 1,
-1.641865, -0.2613226, -1.66513, 1, 0.372549, 0, 1,
-1.635795, -2.12621, -2.3035, 1, 0.3764706, 0, 1,
-1.624501, 0.6468399, 1.792862, 1, 0.3843137, 0, 1,
-1.600036, 0.4674048, -1.227159, 1, 0.3882353, 0, 1,
-1.589244, 0.3371621, -0.4704669, 1, 0.3960784, 0, 1,
-1.587236, 0.7563261, 0.3151128, 1, 0.4039216, 0, 1,
-1.579243, 1.516351, -0.276954, 1, 0.4078431, 0, 1,
-1.565032, -0.2794972, -1.032026, 1, 0.4156863, 0, 1,
-1.561407, 0.7665104, 0.6691837, 1, 0.4196078, 0, 1,
-1.559997, -0.9517292, -0.007340188, 1, 0.427451, 0, 1,
-1.54958, -0.1455467, -1.178867, 1, 0.4313726, 0, 1,
-1.546352, -0.3679954, -0.4050473, 1, 0.4392157, 0, 1,
-1.546099, 1.618889, -0.6727157, 1, 0.4431373, 0, 1,
-1.542587, 0.08636966, -1.029213, 1, 0.4509804, 0, 1,
-1.539337, -1.518127, -1.548836, 1, 0.454902, 0, 1,
-1.537832, 0.1957157, -1.454908, 1, 0.4627451, 0, 1,
-1.536095, 0.3587697, -1.374951, 1, 0.4666667, 0, 1,
-1.529059, -0.3674631, -0.8126734, 1, 0.4745098, 0, 1,
-1.526854, 0.5800451, -0.2973035, 1, 0.4784314, 0, 1,
-1.526018, 0.7749395, -0.4148537, 1, 0.4862745, 0, 1,
-1.51961, -0.3250305, -1.266313, 1, 0.4901961, 0, 1,
-1.515148, -2.226237, -2.561086, 1, 0.4980392, 0, 1,
-1.514878, -1.791566, -2.328118, 1, 0.5058824, 0, 1,
-1.508504, -0.1674841, -2.00199, 1, 0.509804, 0, 1,
-1.497955, -0.1504017, -1.294355, 1, 0.5176471, 0, 1,
-1.495746, 1.444625, -0.7787965, 1, 0.5215687, 0, 1,
-1.474931, -0.5592051, -1.553682, 1, 0.5294118, 0, 1,
-1.474548, 1.278423, -2.645575, 1, 0.5333334, 0, 1,
-1.460833, -1.625439, -1.640949, 1, 0.5411765, 0, 1,
-1.449163, -0.1521084, -1.591247, 1, 0.5450981, 0, 1,
-1.447881, 0.3405702, 0.2249564, 1, 0.5529412, 0, 1,
-1.444905, -1.976561, -2.988937, 1, 0.5568628, 0, 1,
-1.435711, -0.4016747, -1.514843, 1, 0.5647059, 0, 1,
-1.431703, 0.2561893, -1.392305, 1, 0.5686275, 0, 1,
-1.426932, 0.1879195, -1.671517, 1, 0.5764706, 0, 1,
-1.418047, 0.5622446, -2.373391, 1, 0.5803922, 0, 1,
-1.398676, -0.512592, -2.531379, 1, 0.5882353, 0, 1,
-1.389114, 1.825155, -1.190223, 1, 0.5921569, 0, 1,
-1.386488, -2.725586, -2.449437, 1, 0.6, 0, 1,
-1.380986, 1.277222, -0.7851634, 1, 0.6078432, 0, 1,
-1.374137, -0.9179979, -2.744154, 1, 0.6117647, 0, 1,
-1.360842, -0.1926926, -2.741949, 1, 0.6196079, 0, 1,
-1.357992, 0.3402549, -1.636362, 1, 0.6235294, 0, 1,
-1.354083, 0.2625845, -2.301077, 1, 0.6313726, 0, 1,
-1.3507, -0.8330182, -2.511271, 1, 0.6352941, 0, 1,
-1.346213, 0.2674381, -1.841728, 1, 0.6431373, 0, 1,
-1.336773, -0.2912086, -1.824756, 1, 0.6470588, 0, 1,
-1.333844, -0.546919, -2.936379, 1, 0.654902, 0, 1,
-1.32957, -0.5386849, -0.7787559, 1, 0.6588235, 0, 1,
-1.317593, -0.7799507, -1.599883, 1, 0.6666667, 0, 1,
-1.30102, -0.02277553, -2.583482, 1, 0.6705883, 0, 1,
-1.271426, -0.2675713, -2.527016, 1, 0.6784314, 0, 1,
-1.267106, 1.556862, -0.8940387, 1, 0.682353, 0, 1,
-1.262043, -2.526287, -3.059178, 1, 0.6901961, 0, 1,
-1.244322, -0.07573295, -1.565728, 1, 0.6941177, 0, 1,
-1.236703, -0.1449041, -1.075078, 1, 0.7019608, 0, 1,
-1.22518, -0.7215707, -1.8786, 1, 0.7098039, 0, 1,
-1.224432, -0.03291827, -0.7787122, 1, 0.7137255, 0, 1,
-1.215116, -0.7299576, -3.124003, 1, 0.7215686, 0, 1,
-1.20855, 1.435727, -1.22761, 1, 0.7254902, 0, 1,
-1.203193, -0.7846567, -3.452675, 1, 0.7333333, 0, 1,
-1.201218, 0.4846283, 0.4772955, 1, 0.7372549, 0, 1,
-1.19572, 1.939059, -0.9562543, 1, 0.7450981, 0, 1,
-1.19244, -0.7484544, -0.703462, 1, 0.7490196, 0, 1,
-1.190198, 1.831354, -1.915159, 1, 0.7568628, 0, 1,
-1.178629, 0.3072215, -1.576289, 1, 0.7607843, 0, 1,
-1.174545, -0.4748026, -2.515774, 1, 0.7686275, 0, 1,
-1.167909, 0.1412719, -0.5355721, 1, 0.772549, 0, 1,
-1.165222, 0.4488162, -1.968337, 1, 0.7803922, 0, 1,
-1.161489, 0.453548, -0.7887145, 1, 0.7843137, 0, 1,
-1.149742, 0.2984655, -0.3554611, 1, 0.7921569, 0, 1,
-1.145345, 0.01569535, -1.621757, 1, 0.7960784, 0, 1,
-1.139461, 0.02484076, -1.192055, 1, 0.8039216, 0, 1,
-1.139032, 0.6214442, -2.319053, 1, 0.8117647, 0, 1,
-1.133514, 1.582594, 0.7533424, 1, 0.8156863, 0, 1,
-1.127404, 0.3471941, -0.07351125, 1, 0.8235294, 0, 1,
-1.127068, 1.406937, -0.6497628, 1, 0.827451, 0, 1,
-1.121642, 0.2764139, -0.7443287, 1, 0.8352941, 0, 1,
-1.119487, -1.141818, -1.287961, 1, 0.8392157, 0, 1,
-1.115861, 0.5307438, -0.2866879, 1, 0.8470588, 0, 1,
-1.114145, 1.663635, 1.515259, 1, 0.8509804, 0, 1,
-1.109415, 0.9096617, 1.409276, 1, 0.8588235, 0, 1,
-1.099361, 0.9021876, -0.8771795, 1, 0.8627451, 0, 1,
-1.091362, 0.1994895, -1.787382, 1, 0.8705882, 0, 1,
-1.089774, 1.252904, -2.325172, 1, 0.8745098, 0, 1,
-1.085219, 0.5383469, -0.8394679, 1, 0.8823529, 0, 1,
-1.079884, 0.04970097, -1.196598, 1, 0.8862745, 0, 1,
-1.078889, 1.21624, 0.4539025, 1, 0.8941177, 0, 1,
-1.071762, 0.5419055, -0.8137062, 1, 0.8980392, 0, 1,
-1.064461, -1.021537, -2.01811, 1, 0.9058824, 0, 1,
-1.038214, 1.246449, -0.619333, 1, 0.9137255, 0, 1,
-1.037245, -0.03521044, -2.507739, 1, 0.9176471, 0, 1,
-1.035298, 1.206108, -0.8642825, 1, 0.9254902, 0, 1,
-1.029254, 0.2248472, -2.753417, 1, 0.9294118, 0, 1,
-1.027759, 0.9630868, -0.51525, 1, 0.9372549, 0, 1,
-1.027752, -0.125916, -1.917418, 1, 0.9411765, 0, 1,
-1.026313, -0.2114645, -1.194843, 1, 0.9490196, 0, 1,
-1.009437, 0.007255137, -0.9576958, 1, 0.9529412, 0, 1,
-1.007666, -1.620278, -4.169054, 1, 0.9607843, 0, 1,
-1.007486, -0.7353712, -3.672781, 1, 0.9647059, 0, 1,
-1.006225, 1.8421, -2.001813, 1, 0.972549, 0, 1,
-0.9999477, 0.1689813, -1.449294, 1, 0.9764706, 0, 1,
-0.9986561, 1.276577, 0.9112299, 1, 0.9843137, 0, 1,
-0.99471, 0.3838114, -2.546428, 1, 0.9882353, 0, 1,
-0.9945942, -1.290521, -2.066247, 1, 0.9960784, 0, 1,
-0.9898888, -0.8383243, -3.220542, 0.9960784, 1, 0, 1,
-0.978182, 1.787509, 1.006441, 0.9921569, 1, 0, 1,
-0.9771792, -1.210205, -1.635919, 0.9843137, 1, 0, 1,
-0.9728515, 0.2058652, -2.882094, 0.9803922, 1, 0, 1,
-0.9700429, 0.2838347, -0.8916999, 0.972549, 1, 0, 1,
-0.9669359, -0.06086092, -2.189731, 0.9686275, 1, 0, 1,
-0.9651255, -1.261402, -3.617893, 0.9607843, 1, 0, 1,
-0.9626102, -1.400776, -2.812971, 0.9568627, 1, 0, 1,
-0.9588253, 1.133561, -0.2621567, 0.9490196, 1, 0, 1,
-0.9584675, -0.06724647, -3.19621, 0.945098, 1, 0, 1,
-0.9555333, -0.789983, -2.912083, 0.9372549, 1, 0, 1,
-0.9490888, 0.6561126, -1.367229, 0.9333333, 1, 0, 1,
-0.9478735, 0.4878365, -1.660141, 0.9254902, 1, 0, 1,
-0.9407364, -0.01948313, -3.179516, 0.9215686, 1, 0, 1,
-0.939527, -0.8041195, -4.970006, 0.9137255, 1, 0, 1,
-0.9340102, -0.7626644, -3.4433, 0.9098039, 1, 0, 1,
-0.9203841, 2.36912, -0.1452858, 0.9019608, 1, 0, 1,
-0.9196778, 0.2682613, -0.5180512, 0.8941177, 1, 0, 1,
-0.9150189, -1.105842, -1.823616, 0.8901961, 1, 0, 1,
-0.9142789, 0.4457711, -1.084131, 0.8823529, 1, 0, 1,
-0.913554, 1.096861, -0.5341802, 0.8784314, 1, 0, 1,
-0.9085851, 0.947625, -2.38638, 0.8705882, 1, 0, 1,
-0.8972712, 0.5898526, -1.728609, 0.8666667, 1, 0, 1,
-0.8884481, -1.291703, -2.749688, 0.8588235, 1, 0, 1,
-0.8800746, 0.5678564, 0.5408685, 0.854902, 1, 0, 1,
-0.8792277, 0.3604895, -0.1378038, 0.8470588, 1, 0, 1,
-0.8739107, -0.2990533, -0.6066484, 0.8431373, 1, 0, 1,
-0.8664558, 0.3762911, -1.68357, 0.8352941, 1, 0, 1,
-0.8650596, -0.3299275, -1.731806, 0.8313726, 1, 0, 1,
-0.8647708, 0.02024197, -1.928621, 0.8235294, 1, 0, 1,
-0.8617205, 0.07132375, -2.023036, 0.8196079, 1, 0, 1,
-0.8611098, 0.1189068, -2.454741, 0.8117647, 1, 0, 1,
-0.8606323, -0.9071079, -1.708874, 0.8078431, 1, 0, 1,
-0.8578357, -0.08023018, -0.2015973, 0.8, 1, 0, 1,
-0.8559971, -0.09026759, -0.0812799, 0.7921569, 1, 0, 1,
-0.8537573, -0.0296313, -1.357075, 0.7882353, 1, 0, 1,
-0.8476149, -0.6393701, -1.55371, 0.7803922, 1, 0, 1,
-0.8471992, -1.346093, -3.109089, 0.7764706, 1, 0, 1,
-0.8450663, 0.1099425, -0.6235363, 0.7686275, 1, 0, 1,
-0.8440529, -2.203359, -3.532484, 0.7647059, 1, 0, 1,
-0.8430771, -1.357382, -5.621776, 0.7568628, 1, 0, 1,
-0.8316662, -0.8315072, -3.331562, 0.7529412, 1, 0, 1,
-0.8306857, -0.8293185, -2.409213, 0.7450981, 1, 0, 1,
-0.8212036, -1.524796, -2.962911, 0.7411765, 1, 0, 1,
-0.8198025, -0.260964, -1.251325, 0.7333333, 1, 0, 1,
-0.8078752, -0.5789932, -2.089831, 0.7294118, 1, 0, 1,
-0.8061854, -1.510297, -2.612934, 0.7215686, 1, 0, 1,
-0.8026507, -0.7224283, -3.819789, 0.7176471, 1, 0, 1,
-0.7992029, -2.123988, -2.973331, 0.7098039, 1, 0, 1,
-0.7935719, -1.028794, -1.691522, 0.7058824, 1, 0, 1,
-0.7921406, -2.219074, -3.154186, 0.6980392, 1, 0, 1,
-0.7820351, -1.491173, -3.964252, 0.6901961, 1, 0, 1,
-0.7807077, 0.7808889, -0.7741342, 0.6862745, 1, 0, 1,
-0.7771759, -0.5341384, -1.704734, 0.6784314, 1, 0, 1,
-0.7690024, -1.322898, -3.657285, 0.6745098, 1, 0, 1,
-0.7661057, -0.7706046, -1.906366, 0.6666667, 1, 0, 1,
-0.7646973, 0.7472524, -1.791322, 0.6627451, 1, 0, 1,
-0.7601114, 0.2473684, 0.3136446, 0.654902, 1, 0, 1,
-0.7274763, 0.02859189, -1.393255, 0.6509804, 1, 0, 1,
-0.7261049, -0.2006511, -0.6499777, 0.6431373, 1, 0, 1,
-0.7258758, -1.250084, -1.803776, 0.6392157, 1, 0, 1,
-0.7164785, 0.3995123, -0.7114881, 0.6313726, 1, 0, 1,
-0.7162351, -0.5967926, -3.899284, 0.627451, 1, 0, 1,
-0.7137306, -0.9313682, -2.195876, 0.6196079, 1, 0, 1,
-0.7022097, -0.7772852, -3.80716, 0.6156863, 1, 0, 1,
-0.7014316, -0.3613111, -3.485516, 0.6078432, 1, 0, 1,
-0.7001017, 0.7650323, -0.9690676, 0.6039216, 1, 0, 1,
-0.6988847, -1.924071, -2.537206, 0.5960785, 1, 0, 1,
-0.6975078, 0.5740372, -0.8066123, 0.5882353, 1, 0, 1,
-0.694409, -1.886583, -3.093892, 0.5843138, 1, 0, 1,
-0.6918235, 0.8064681, 1.491679, 0.5764706, 1, 0, 1,
-0.6908112, 0.6936228, -1.598692, 0.572549, 1, 0, 1,
-0.6899081, 0.8660678, -1.690795, 0.5647059, 1, 0, 1,
-0.6835151, 0.8317201, -1.361353, 0.5607843, 1, 0, 1,
-0.6736967, -0.9609921, -2.896708, 0.5529412, 1, 0, 1,
-0.6722083, 0.5871108, -1.126004, 0.5490196, 1, 0, 1,
-0.6721872, 1.563748, 0.7072979, 0.5411765, 1, 0, 1,
-0.6673916, 0.9989488, 0.1207676, 0.5372549, 1, 0, 1,
-0.6667442, 0.4364302, -0.4337345, 0.5294118, 1, 0, 1,
-0.6665322, -1.224854, -2.78585, 0.5254902, 1, 0, 1,
-0.65873, -1.317659, -2.882261, 0.5176471, 1, 0, 1,
-0.6559297, 0.7122441, -1.204724, 0.5137255, 1, 0, 1,
-0.6510711, -0.4449017, -2.54289, 0.5058824, 1, 0, 1,
-0.6507524, -1.071854, -2.043432, 0.5019608, 1, 0, 1,
-0.6429666, 0.792482, -0.6801473, 0.4941176, 1, 0, 1,
-0.6426687, 0.6278096, -1.164528, 0.4862745, 1, 0, 1,
-0.6416209, 1.218817, -0.9070434, 0.4823529, 1, 0, 1,
-0.6414871, -0.7494257, -2.837641, 0.4745098, 1, 0, 1,
-0.6412342, -0.7095741, -3.020947, 0.4705882, 1, 0, 1,
-0.64046, -0.9746021, -3.222349, 0.4627451, 1, 0, 1,
-0.6382707, -0.5080164, -3.825526, 0.4588235, 1, 0, 1,
-0.6215993, 2.029039, -1.440805, 0.4509804, 1, 0, 1,
-0.619018, -1.178099, -2.65425, 0.4470588, 1, 0, 1,
-0.6189838, -0.5021555, -2.036752, 0.4392157, 1, 0, 1,
-0.6184626, 0.9631093, -1.427488, 0.4352941, 1, 0, 1,
-0.6161089, -0.3628572, -2.943072, 0.427451, 1, 0, 1,
-0.6149291, 1.537861, -1.38596, 0.4235294, 1, 0, 1,
-0.6138934, 1.848445, -1.116751, 0.4156863, 1, 0, 1,
-0.6129312, -0.473206, -2.867819, 0.4117647, 1, 0, 1,
-0.6128055, 0.07517149, -2.156655, 0.4039216, 1, 0, 1,
-0.6109809, 0.7055133, -1.574901, 0.3960784, 1, 0, 1,
-0.6092925, -0.6409752, -1.293983, 0.3921569, 1, 0, 1,
-0.5999233, -0.6553923, -1.706863, 0.3843137, 1, 0, 1,
-0.5979162, -1.018977, -3.710242, 0.3803922, 1, 0, 1,
-0.597859, -0.1521232, -0.8881276, 0.372549, 1, 0, 1,
-0.5935978, -0.9093283, -0.7272244, 0.3686275, 1, 0, 1,
-0.5925443, -0.5540599, -4.129706, 0.3607843, 1, 0, 1,
-0.5914564, -0.4289401, -1.614152, 0.3568628, 1, 0, 1,
-0.5866572, 0.4028292, -1.076388, 0.3490196, 1, 0, 1,
-0.5857366, 0.4803057, -0.59839, 0.345098, 1, 0, 1,
-0.5842205, -0.5237059, -2.701324, 0.3372549, 1, 0, 1,
-0.5810816, -0.7151736, -2.940693, 0.3333333, 1, 0, 1,
-0.5781705, -1.220077, -1.347707, 0.3254902, 1, 0, 1,
-0.5764009, 1.009499, -0.4464349, 0.3215686, 1, 0, 1,
-0.5702789, -1.234238, -3.759735, 0.3137255, 1, 0, 1,
-0.5632972, -1.74667, -2.298207, 0.3098039, 1, 0, 1,
-0.5554628, 0.3807322, -1.053287, 0.3019608, 1, 0, 1,
-0.5541319, 0.5891223, -0.6326795, 0.2941177, 1, 0, 1,
-0.5537754, 0.1334039, -0.3644259, 0.2901961, 1, 0, 1,
-0.5528371, -1.161018, -1.095159, 0.282353, 1, 0, 1,
-0.5453089, 0.2533651, -0.8239622, 0.2784314, 1, 0, 1,
-0.5448812, 0.7459476, -1.237989, 0.2705882, 1, 0, 1,
-0.5413597, -0.9907406, -3.236264, 0.2666667, 1, 0, 1,
-0.5402856, 0.8798196, -0.5667939, 0.2588235, 1, 0, 1,
-0.5300665, 0.7447453, 0.467566, 0.254902, 1, 0, 1,
-0.5275925, -0.57765, -3.58314, 0.2470588, 1, 0, 1,
-0.5209557, 1.087469, 0.2114794, 0.2431373, 1, 0, 1,
-0.5207281, 0.6771893, -0.7277195, 0.2352941, 1, 0, 1,
-0.5197664, 1.525451, -0.9955547, 0.2313726, 1, 0, 1,
-0.5180335, -0.8540547, -1.754491, 0.2235294, 1, 0, 1,
-0.5173789, 0.7452341, -0.6468453, 0.2196078, 1, 0, 1,
-0.5133123, 0.6197011, -1.514309, 0.2117647, 1, 0, 1,
-0.5130564, -0.9330252, -4.231721, 0.2078431, 1, 0, 1,
-0.5098472, -0.1163946, -1.349398, 0.2, 1, 0, 1,
-0.5007237, -0.5578943, -1.92356, 0.1921569, 1, 0, 1,
-0.5005767, -0.6403396, -1.918164, 0.1882353, 1, 0, 1,
-0.4966653, -1.15185, -0.119813, 0.1803922, 1, 0, 1,
-0.4957569, -1.385452, -5.713573, 0.1764706, 1, 0, 1,
-0.4953175, -0.9873532, 0.03820343, 0.1686275, 1, 0, 1,
-0.4941111, -0.5064467, -3.145999, 0.1647059, 1, 0, 1,
-0.492258, 0.2782174, -0.6836985, 0.1568628, 1, 0, 1,
-0.491582, 0.5393167, 0.7268729, 0.1529412, 1, 0, 1,
-0.4914415, 0.4434618, 1.102352, 0.145098, 1, 0, 1,
-0.4891224, -1.460217, -2.986598, 0.1411765, 1, 0, 1,
-0.488872, -0.5510071, -1.87316, 0.1333333, 1, 0, 1,
-0.4827802, 0.410827, -0.9616426, 0.1294118, 1, 0, 1,
-0.4816864, 1.012374, 1.494957, 0.1215686, 1, 0, 1,
-0.4799927, 0.5127077, -1.462948, 0.1176471, 1, 0, 1,
-0.4768717, 0.3256162, -1.655404, 0.1098039, 1, 0, 1,
-0.4686697, 0.2446674, -0.7161911, 0.1058824, 1, 0, 1,
-0.4658008, 0.7820953, -0.3314378, 0.09803922, 1, 0, 1,
-0.4614509, 1.213704, -0.7001937, 0.09019608, 1, 0, 1,
-0.4575286, -0.4812004, -3.241596, 0.08627451, 1, 0, 1,
-0.4553013, 1.943728, -2.282342, 0.07843138, 1, 0, 1,
-0.455209, 1.222123, 1.475258, 0.07450981, 1, 0, 1,
-0.4472042, 0.399574, -1.095576, 0.06666667, 1, 0, 1,
-0.4452744, -0.9217817, -3.49737, 0.0627451, 1, 0, 1,
-0.4439135, 1.402496, -0.4543595, 0.05490196, 1, 0, 1,
-0.4353924, -0.4135462, -1.823263, 0.05098039, 1, 0, 1,
-0.426119, 1.02184, -1.372811, 0.04313726, 1, 0, 1,
-0.4241491, 0.1560759, -2.079267, 0.03921569, 1, 0, 1,
-0.4226372, -1.251515, -3.308862, 0.03137255, 1, 0, 1,
-0.4201476, 1.119139, -0.7568099, 0.02745098, 1, 0, 1,
-0.4197758, 1.409331, -0.06856293, 0.01960784, 1, 0, 1,
-0.4157609, 0.2534901, -0.7775147, 0.01568628, 1, 0, 1,
-0.4136874, -0.01744199, -3.134137, 0.007843138, 1, 0, 1,
-0.4126467, -0.294685, -3.719378, 0.003921569, 1, 0, 1,
-0.4121275, 1.39441, 0.3627337, 0, 1, 0.003921569, 1,
-0.405243, -0.8559212, -2.314234, 0, 1, 0.01176471, 1,
-0.4035316, 0.2617414, 0.1726131, 0, 1, 0.01568628, 1,
-0.4024153, 1.283842, -2.069659, 0, 1, 0.02352941, 1,
-0.400578, -1.221205, -4.237767, 0, 1, 0.02745098, 1,
-0.3976776, 1.665591, -0.6150144, 0, 1, 0.03529412, 1,
-0.3965925, 0.5238633, -1.847644, 0, 1, 0.03921569, 1,
-0.3947052, 1.434482, -0.8511769, 0, 1, 0.04705882, 1,
-0.3938654, -0.5018044, -1.052902, 0, 1, 0.05098039, 1,
-0.3936813, 2.16998, -0.6959206, 0, 1, 0.05882353, 1,
-0.3898991, 1.092973, 0.2322758, 0, 1, 0.0627451, 1,
-0.3840533, -0.3159713, -1.71434, 0, 1, 0.07058824, 1,
-0.3825832, -2.492894, -3.691883, 0, 1, 0.07450981, 1,
-0.3818246, 0.1234433, -0.8809072, 0, 1, 0.08235294, 1,
-0.3802252, 0.9571248, 0.06652162, 0, 1, 0.08627451, 1,
-0.376887, -0.1245876, -2.519106, 0, 1, 0.09411765, 1,
-0.3734104, -0.4222366, -0.36273, 0, 1, 0.1019608, 1,
-0.3678265, 0.3255672, -0.09050129, 0, 1, 0.1058824, 1,
-0.3630458, 0.08796209, -1.320958, 0, 1, 0.1137255, 1,
-0.3603426, 0.5081962, 0.9411284, 0, 1, 0.1176471, 1,
-0.3580345, 1.419424, -1.479216, 0, 1, 0.1254902, 1,
-0.3463809, 0.04451928, -4.013184, 0, 1, 0.1294118, 1,
-0.3452357, 1.918557, -1.955124, 0, 1, 0.1372549, 1,
-0.3439307, -0.1423932, -0.03162919, 0, 1, 0.1411765, 1,
-0.342748, -0.1587861, -4.696784, 0, 1, 0.1490196, 1,
-0.3398974, 0.3797398, -1.607257, 0, 1, 0.1529412, 1,
-0.3384755, 0.9450395, -0.6781867, 0, 1, 0.1607843, 1,
-0.3342218, 0.8855323, -0.4957336, 0, 1, 0.1647059, 1,
-0.3311443, 0.8367292, -1.496765, 0, 1, 0.172549, 1,
-0.3298421, 0.5982861, 1.674643, 0, 1, 0.1764706, 1,
-0.3223942, 2.532951, -0.4144371, 0, 1, 0.1843137, 1,
-0.3138829, -1.114627, -1.140796, 0, 1, 0.1882353, 1,
-0.3127391, 0.6283264, 1.005172, 0, 1, 0.1960784, 1,
-0.3125965, 0.254114, -1.276981, 0, 1, 0.2039216, 1,
-0.3082524, -0.8106679, -2.072089, 0, 1, 0.2078431, 1,
-0.3065473, 0.09393705, -1.24331, 0, 1, 0.2156863, 1,
-0.3063603, 1.299385, -1.465409, 0, 1, 0.2196078, 1,
-0.3015036, -0.1937957, -3.495718, 0, 1, 0.227451, 1,
-0.2991963, 0.9585207, -1.223176, 0, 1, 0.2313726, 1,
-0.2976618, -0.3053403, -1.815459, 0, 1, 0.2392157, 1,
-0.2964944, 0.8503841, 1.852811, 0, 1, 0.2431373, 1,
-0.295751, -2.859334, -3.723513, 0, 1, 0.2509804, 1,
-0.2941278, -1.04659, -3.05357, 0, 1, 0.254902, 1,
-0.2926722, 0.6472655, 0.6418671, 0, 1, 0.2627451, 1,
-0.2891947, 0.3283011, -0.616834, 0, 1, 0.2666667, 1,
-0.2882886, -0.5751975, -2.504715, 0, 1, 0.2745098, 1,
-0.2882528, 1.313551, -0.1061753, 0, 1, 0.2784314, 1,
-0.2842801, -0.8299124, -3.686445, 0, 1, 0.2862745, 1,
-0.2783531, 0.1829344, -1.431425, 0, 1, 0.2901961, 1,
-0.2773815, 0.05502913, -1.54375, 0, 1, 0.2980392, 1,
-0.2771361, -1.447311, -2.560675, 0, 1, 0.3058824, 1,
-0.2769048, 2.087545, -0.3258122, 0, 1, 0.3098039, 1,
-0.2719566, -1.453718, -4.932264, 0, 1, 0.3176471, 1,
-0.2717918, -0.2233541, -2.669822, 0, 1, 0.3215686, 1,
-0.2708227, -0.9207383, -5.006467, 0, 1, 0.3294118, 1,
-0.270536, 0.5279006, 1.170069, 0, 1, 0.3333333, 1,
-0.2676245, 0.05217551, -3.338154, 0, 1, 0.3411765, 1,
-0.26705, -1.633118, -2.698084, 0, 1, 0.345098, 1,
-0.2669107, -0.8468706, -3.089885, 0, 1, 0.3529412, 1,
-0.2663416, -1.826272, -3.302126, 0, 1, 0.3568628, 1,
-0.2632031, 0.1825257, 0.4748861, 0, 1, 0.3647059, 1,
-0.2625275, 0.7908406, -1.029494, 0, 1, 0.3686275, 1,
-0.2607532, -0.642275, -1.781254, 0, 1, 0.3764706, 1,
-0.2605421, 0.9349378, -0.429914, 0, 1, 0.3803922, 1,
-0.2561286, -0.7917524, -4.299589, 0, 1, 0.3882353, 1,
-0.2539059, 0.4354926, 1.547483, 0, 1, 0.3921569, 1,
-0.2508073, 0.1153031, -1.317341, 0, 1, 0.4, 1,
-0.2482417, -0.2330197, -1.65764, 0, 1, 0.4078431, 1,
-0.2459156, 0.07777529, -2.129147, 0, 1, 0.4117647, 1,
-0.2427381, -0.3851075, -4.359692, 0, 1, 0.4196078, 1,
-0.2413801, -1.676341, -3.010146, 0, 1, 0.4235294, 1,
-0.240146, 0.1985641, -0.4296857, 0, 1, 0.4313726, 1,
-0.234811, 1.00136, 1.021508, 0, 1, 0.4352941, 1,
-0.2290633, -0.561887, -3.723831, 0, 1, 0.4431373, 1,
-0.2251853, -0.7455446, -3.142856, 0, 1, 0.4470588, 1,
-0.2185314, -0.3037774, -1.266673, 0, 1, 0.454902, 1,
-0.215713, 0.9087315, 1.669877, 0, 1, 0.4588235, 1,
-0.2149372, -0.4864313, -1.32067, 0, 1, 0.4666667, 1,
-0.2143242, -1.430077, -4.042026, 0, 1, 0.4705882, 1,
-0.2118766, 0.6473158, -2.134226, 0, 1, 0.4784314, 1,
-0.2093862, -0.7409058, -3.181146, 0, 1, 0.4823529, 1,
-0.2074567, -1.389712, -4.616032, 0, 1, 0.4901961, 1,
-0.2073162, -1.23205, -2.872603, 0, 1, 0.4941176, 1,
-0.2035043, 0.1678553, -0.1947116, 0, 1, 0.5019608, 1,
-0.200711, -1.002277, -2.689974, 0, 1, 0.509804, 1,
-0.1920665, -0.8819556, -4.406653, 0, 1, 0.5137255, 1,
-0.1868997, -0.1851899, -0.3636986, 0, 1, 0.5215687, 1,
-0.1867778, 1.279302, 0.2298492, 0, 1, 0.5254902, 1,
-0.1800457, 0.1901406, 0.4791622, 0, 1, 0.5333334, 1,
-0.1774654, 0.1113652, -0.8225356, 0, 1, 0.5372549, 1,
-0.1738586, 0.8362089, -0.6048663, 0, 1, 0.5450981, 1,
-0.165195, 1.468998, -0.2211849, 0, 1, 0.5490196, 1,
-0.1638195, 0.05875085, 0.1906845, 0, 1, 0.5568628, 1,
-0.1621509, -0.1917998, -4.338558, 0, 1, 0.5607843, 1,
-0.1612019, 0.7622731, -1.560373, 0, 1, 0.5686275, 1,
-0.1561288, -0.1355695, -2.251185, 0, 1, 0.572549, 1,
-0.1549871, 0.7910288, 0.8163068, 0, 1, 0.5803922, 1,
-0.1548947, -0.6247486, -3.535214, 0, 1, 0.5843138, 1,
-0.1533474, 0.8013294, -0.6257303, 0, 1, 0.5921569, 1,
-0.1504771, 1.363132, 0.2537371, 0, 1, 0.5960785, 1,
-0.1492283, -0.328194, -1.571574, 0, 1, 0.6039216, 1,
-0.1480728, -0.1333036, -2.811806, 0, 1, 0.6117647, 1,
-0.1465229, 1.325004, -0.8301279, 0, 1, 0.6156863, 1,
-0.1448216, 1.617686, 0.5744148, 0, 1, 0.6235294, 1,
-0.1442042, -0.1158556, -0.6942278, 0, 1, 0.627451, 1,
-0.1436317, -0.118011, -1.375831, 0, 1, 0.6352941, 1,
-0.1400944, 0.4511986, -1.164083, 0, 1, 0.6392157, 1,
-0.1388092, 0.07633447, -1.396851, 0, 1, 0.6470588, 1,
-0.1379285, 1.465225, 0.3366368, 0, 1, 0.6509804, 1,
-0.1372363, 0.9416376, -0.98561, 0, 1, 0.6588235, 1,
-0.1350093, 1.490576, 1.016121, 0, 1, 0.6627451, 1,
-0.1332483, 0.1672082, -0.826535, 0, 1, 0.6705883, 1,
-0.1259941, -0.09491653, -0.6786291, 0, 1, 0.6745098, 1,
-0.1236233, -1.179393, -1.851608, 0, 1, 0.682353, 1,
-0.1216792, -0.8289293, -2.861334, 0, 1, 0.6862745, 1,
-0.1161619, 0.5865224, -2.012247, 0, 1, 0.6941177, 1,
-0.1161347, -0.8731874, -5.838073, 0, 1, 0.7019608, 1,
-0.1160352, 0.02962644, -1.013752, 0, 1, 0.7058824, 1,
-0.1141436, -0.5977848, -2.321656, 0, 1, 0.7137255, 1,
-0.1137456, 1.053227, -1.447735, 0, 1, 0.7176471, 1,
-0.1120973, -0.3808841, -4.649184, 0, 1, 0.7254902, 1,
-0.1045252, -1.702559, -2.506775, 0, 1, 0.7294118, 1,
-0.1039923, -0.08152147, -1.867008, 0, 1, 0.7372549, 1,
-0.1009979, -1.429982, -1.397718, 0, 1, 0.7411765, 1,
-0.09307018, 0.4648693, -0.4924832, 0, 1, 0.7490196, 1,
-0.08967327, 0.4429693, 1.558951, 0, 1, 0.7529412, 1,
-0.08835827, 0.2565562, 1.064923, 0, 1, 0.7607843, 1,
-0.0872077, -0.3261827, -3.573031, 0, 1, 0.7647059, 1,
-0.07750158, 0.7598004, -1.129335, 0, 1, 0.772549, 1,
-0.07337847, -0.06353264, -1.114329, 0, 1, 0.7764706, 1,
-0.07269181, -0.927995, -1.952185, 0, 1, 0.7843137, 1,
-0.07121179, 1.264044, -1.241035, 0, 1, 0.7882353, 1,
-0.06849626, -0.3316151, -3.666346, 0, 1, 0.7960784, 1,
-0.06356496, 0.2783614, -0.7824866, 0, 1, 0.8039216, 1,
-0.06004541, 0.9816252, -0.1151247, 0, 1, 0.8078431, 1,
-0.05980515, -1.415016, -3.686445, 0, 1, 0.8156863, 1,
-0.05932312, 1.020604, 0.02715894, 0, 1, 0.8196079, 1,
-0.05856368, 0.6150432, 0.4016899, 0, 1, 0.827451, 1,
-0.05643776, -0.5790743, -1.782485, 0, 1, 0.8313726, 1,
-0.05468026, -0.7617583, -3.668517, 0, 1, 0.8392157, 1,
-0.05368137, -0.6744764, -4.392203, 0, 1, 0.8431373, 1,
-0.04967976, 0.1140163, -0.9258968, 0, 1, 0.8509804, 1,
-0.04499928, 0.7968377, -0.4584668, 0, 1, 0.854902, 1,
-0.04493517, -1.021441, -0.9486542, 0, 1, 0.8627451, 1,
-0.04414943, 1.005234, 0.2627079, 0, 1, 0.8666667, 1,
-0.04170762, 0.1243612, 0.09188578, 0, 1, 0.8745098, 1,
-0.04164003, 0.8800891, 1.275718, 0, 1, 0.8784314, 1,
-0.03892765, -0.3403196, -2.502004, 0, 1, 0.8862745, 1,
-0.03326825, 0.9871208, -0.2846548, 0, 1, 0.8901961, 1,
-0.02844648, 0.6320363, 0.06647694, 0, 1, 0.8980392, 1,
-0.02834912, -0.2098024, -2.571825, 0, 1, 0.9058824, 1,
-0.02678766, 0.1591983, -0.4840267, 0, 1, 0.9098039, 1,
-0.02566285, -0.6148857, -1.494037, 0, 1, 0.9176471, 1,
-0.0192904, 1.821796, -1.465093, 0, 1, 0.9215686, 1,
-0.01665089, 1.293047, 0.1210344, 0, 1, 0.9294118, 1,
-0.01601093, -1.19114, -1.599129, 0, 1, 0.9333333, 1,
-0.001188675, -1.214828, -4.028139, 0, 1, 0.9411765, 1,
0.001298442, 2.137974, 0.7036061, 0, 1, 0.945098, 1,
0.00393151, 0.8948925, -0.09042121, 0, 1, 0.9529412, 1,
0.007629535, -0.7966921, 2.429526, 0, 1, 0.9568627, 1,
0.009257902, 0.7910789, -0.2978357, 0, 1, 0.9647059, 1,
0.01025831, -0.8397012, 1.613943, 0, 1, 0.9686275, 1,
0.01437669, 1.984155, 0.3672223, 0, 1, 0.9764706, 1,
0.01981561, 1.487684, -0.4238398, 0, 1, 0.9803922, 1,
0.02306549, -1.737667, 3.520826, 0, 1, 0.9882353, 1,
0.02540505, -0.1419632, 4.951929, 0, 1, 0.9921569, 1,
0.02568899, 1.004361, 0.5618741, 0, 1, 1, 1,
0.02578389, -0.9425359, 4.726181, 0, 0.9921569, 1, 1,
0.02646244, 1.386857, 0.2410017, 0, 0.9882353, 1, 1,
0.02715103, -1.521327, 3.19127, 0, 0.9803922, 1, 1,
0.02963815, -0.9993599, 3.864213, 0, 0.9764706, 1, 1,
0.03358692, -0.0364209, 3.278836, 0, 0.9686275, 1, 1,
0.03732087, -0.3863942, 2.755028, 0, 0.9647059, 1, 1,
0.03801939, 0.713071, 0.3659783, 0, 0.9568627, 1, 1,
0.04050095, 2.23519, -1.054624, 0, 0.9529412, 1, 1,
0.0424558, -0.4444758, 3.409431, 0, 0.945098, 1, 1,
0.04952938, -2.729094, 3.18696, 0, 0.9411765, 1, 1,
0.05353665, -0.7836502, 4.334951, 0, 0.9333333, 1, 1,
0.05376169, 0.2450164, 2.92217, 0, 0.9294118, 1, 1,
0.05567102, 0.01794943, 0.6343975, 0, 0.9215686, 1, 1,
0.05743908, 0.4583292, 1.782452, 0, 0.9176471, 1, 1,
0.06307632, 0.1371315, -0.4588662, 0, 0.9098039, 1, 1,
0.06555744, 0.8816603, -0.7171479, 0, 0.9058824, 1, 1,
0.06997084, 0.01277165, 0.4166205, 0, 0.8980392, 1, 1,
0.07006634, -1.170088, 1.239537, 0, 0.8901961, 1, 1,
0.0785765, 0.2810554, -0.6356527, 0, 0.8862745, 1, 1,
0.07953028, -0.4655515, 1.835628, 0, 0.8784314, 1, 1,
0.08250791, 0.6153165, 0.6291899, 0, 0.8745098, 1, 1,
0.08297212, 1.031183, 1.937545, 0, 0.8666667, 1, 1,
0.08581544, -0.5909774, 3.260856, 0, 0.8627451, 1, 1,
0.09218004, 0.004466615, 1.446336, 0, 0.854902, 1, 1,
0.09570716, -0.4015933, 2.866724, 0, 0.8509804, 1, 1,
0.09826201, -0.6819028, 3.611262, 0, 0.8431373, 1, 1,
0.1034289, 0.2453842, 1.938292, 0, 0.8392157, 1, 1,
0.1042886, -0.2746758, 1.978999, 0, 0.8313726, 1, 1,
0.108359, -1.814772, 3.937573, 0, 0.827451, 1, 1,
0.109536, -0.6179691, 1.765947, 0, 0.8196079, 1, 1,
0.1101472, -0.1176237, 1.593165, 0, 0.8156863, 1, 1,
0.1151061, -1.703537, 4.019362, 0, 0.8078431, 1, 1,
0.116304, 0.7414048, -0.1607407, 0, 0.8039216, 1, 1,
0.1169003, -1.687761, 2.778256, 0, 0.7960784, 1, 1,
0.1234252, -0.4748204, 1.964978, 0, 0.7882353, 1, 1,
0.1240163, 0.5156853, -1.500283, 0, 0.7843137, 1, 1,
0.1245228, -0.08185893, 3.653043, 0, 0.7764706, 1, 1,
0.1259648, -0.5630968, 2.256263, 0, 0.772549, 1, 1,
0.1261836, 1.546456, 1.312539, 0, 0.7647059, 1, 1,
0.1270231, 0.2063072, -0.9641605, 0, 0.7607843, 1, 1,
0.1304325, 1.995068, 0.0536192, 0, 0.7529412, 1, 1,
0.1338465, 0.3874767, 0.8322377, 0, 0.7490196, 1, 1,
0.1346761, -0.8601764, 2.664721, 0, 0.7411765, 1, 1,
0.1373184, 0.3377764, 0.2830128, 0, 0.7372549, 1, 1,
0.1427279, 0.1268707, 0.5788308, 0, 0.7294118, 1, 1,
0.1471967, -0.9003831, 2.734562, 0, 0.7254902, 1, 1,
0.1497664, -1.079954, 6.280083, 0, 0.7176471, 1, 1,
0.154513, 1.421132, -0.1638357, 0, 0.7137255, 1, 1,
0.1553419, -0.474946, 3.431864, 0, 0.7058824, 1, 1,
0.1562588, 0.9615346, 2.145875, 0, 0.6980392, 1, 1,
0.1578938, 0.5343143, -0.7182536, 0, 0.6941177, 1, 1,
0.1632525, -0.739359, 2.133811, 0, 0.6862745, 1, 1,
0.164301, 0.2678655, 1.559123, 0, 0.682353, 1, 1,
0.1644477, -0.2912202, 2.962157, 0, 0.6745098, 1, 1,
0.1674336, 1.200052, 1.926263, 0, 0.6705883, 1, 1,
0.1688984, 0.5440649, -0.7637456, 0, 0.6627451, 1, 1,
0.1738462, 0.1404542, 0.7547612, 0, 0.6588235, 1, 1,
0.1769182, -0.1686089, 1.76382, 0, 0.6509804, 1, 1,
0.1798782, -0.3794379, 2.797085, 0, 0.6470588, 1, 1,
0.1802057, 1.95311, -0.7151393, 0, 0.6392157, 1, 1,
0.1814328, -0.09895422, 0.8373011, 0, 0.6352941, 1, 1,
0.1815713, -0.608025, 2.756998, 0, 0.627451, 1, 1,
0.1839851, 0.2196942, -0.04679929, 0, 0.6235294, 1, 1,
0.1873045, 0.5157357, 0.1800948, 0, 0.6156863, 1, 1,
0.1873818, 1.195275, 0.6577132, 0, 0.6117647, 1, 1,
0.1892985, 0.1240332, 0.5164642, 0, 0.6039216, 1, 1,
0.1905971, 0.4782024, 0.5241419, 0, 0.5960785, 1, 1,
0.1941366, 1.180761, 0.4544671, 0, 0.5921569, 1, 1,
0.1973176, 0.21748, 0.6739092, 0, 0.5843138, 1, 1,
0.2011083, 0.003697081, 2.446251, 0, 0.5803922, 1, 1,
0.2047536, -0.4407251, 1.20363, 0, 0.572549, 1, 1,
0.2108669, -0.6017303, 4.070476, 0, 0.5686275, 1, 1,
0.2124937, -0.9591219, 3.807933, 0, 0.5607843, 1, 1,
0.2134912, -0.4362208, 2.383724, 0, 0.5568628, 1, 1,
0.2157107, -1.318237, 2.68729, 0, 0.5490196, 1, 1,
0.2247387, 0.5438624, -0.5662767, 0, 0.5450981, 1, 1,
0.2279566, 1.554809, 0.3870425, 0, 0.5372549, 1, 1,
0.2285574, 0.04644751, 0.5144827, 0, 0.5333334, 1, 1,
0.2294117, -0.6795397, 1.651981, 0, 0.5254902, 1, 1,
0.229443, -0.1451556, 2.782425, 0, 0.5215687, 1, 1,
0.2305599, -0.5096783, 2.173852, 0, 0.5137255, 1, 1,
0.2312205, 0.6540155, 0.8154226, 0, 0.509804, 1, 1,
0.2349423, -0.5918633, 1.372629, 0, 0.5019608, 1, 1,
0.2365639, 0.6084995, -0.1296697, 0, 0.4941176, 1, 1,
0.2375467, -1.251193, 3.9517, 0, 0.4901961, 1, 1,
0.2376561, 0.06604334, 1.339748, 0, 0.4823529, 1, 1,
0.2426666, 0.06724445, -0.6382661, 0, 0.4784314, 1, 1,
0.247034, 1.633749, 0.6176068, 0, 0.4705882, 1, 1,
0.2532474, -1.084198, 2.761367, 0, 0.4666667, 1, 1,
0.2542815, 0.07854167, -1.089005, 0, 0.4588235, 1, 1,
0.2553901, 0.001644419, 2.16374, 0, 0.454902, 1, 1,
0.2567614, 1.490588, 0.840771, 0, 0.4470588, 1, 1,
0.2599426, -0.2805122, 1.878403, 0, 0.4431373, 1, 1,
0.2603956, 0.3585912, 2.041903, 0, 0.4352941, 1, 1,
0.2611735, -0.01740212, 0.3311259, 0, 0.4313726, 1, 1,
0.2613634, -0.4278177, 1.837049, 0, 0.4235294, 1, 1,
0.2623183, -0.4961303, 0.9521465, 0, 0.4196078, 1, 1,
0.263424, -0.2538612, 1.87437, 0, 0.4117647, 1, 1,
0.2677036, 0.7513725, 0.2508531, 0, 0.4078431, 1, 1,
0.2697573, -1.095581, 2.008626, 0, 0.4, 1, 1,
0.2705228, -0.5016626, 2.945765, 0, 0.3921569, 1, 1,
0.2757427, -0.6816651, 4.593192, 0, 0.3882353, 1, 1,
0.2785487, -0.4441024, 2.860457, 0, 0.3803922, 1, 1,
0.2789375, 1.363227, -0.2508547, 0, 0.3764706, 1, 1,
0.2793572, 0.8669848, -0.399622, 0, 0.3686275, 1, 1,
0.2809173, 0.4980427, 1.161731, 0, 0.3647059, 1, 1,
0.2809321, -0.03746739, 3.580087, 0, 0.3568628, 1, 1,
0.2845287, -0.2694645, 2.188398, 0, 0.3529412, 1, 1,
0.2872702, 0.2677134, 0.2156751, 0, 0.345098, 1, 1,
0.2877951, -0.858216, 2.560551, 0, 0.3411765, 1, 1,
0.2926003, -0.5059214, 3.106596, 0, 0.3333333, 1, 1,
0.2946052, -0.02879201, 1.424074, 0, 0.3294118, 1, 1,
0.2962506, -0.1120005, 2.026443, 0, 0.3215686, 1, 1,
0.2965217, -1.293636, 3.487187, 0, 0.3176471, 1, 1,
0.3026276, -0.3548427, 2.573188, 0, 0.3098039, 1, 1,
0.305115, 0.9409085, 0.4515139, 0, 0.3058824, 1, 1,
0.306278, -1.359181, 3.754917, 0, 0.2980392, 1, 1,
0.3077552, -0.4391589, 2.374413, 0, 0.2901961, 1, 1,
0.3080027, -0.7989972, 4.684413, 0, 0.2862745, 1, 1,
0.3113962, 0.5245034, 2.149162, 0, 0.2784314, 1, 1,
0.3114062, 1.121322, 0.8196786, 0, 0.2745098, 1, 1,
0.3130638, -0.5495349, 2.588611, 0, 0.2666667, 1, 1,
0.3138678, 0.3732044, 1.857678, 0, 0.2627451, 1, 1,
0.3177564, -2.016225, 2.300114, 0, 0.254902, 1, 1,
0.3197305, -0.2169778, 0.02984381, 0, 0.2509804, 1, 1,
0.3257841, -0.4704769, 2.471379, 0, 0.2431373, 1, 1,
0.3338441, 0.7223575, -1.149185, 0, 0.2392157, 1, 1,
0.334954, 1.320949, 1.812791, 0, 0.2313726, 1, 1,
0.3375043, 0.5701793, 0.1323994, 0, 0.227451, 1, 1,
0.3399338, -0.5071717, 1.991594, 0, 0.2196078, 1, 1,
0.3411525, 0.7346537, 2.64676, 0, 0.2156863, 1, 1,
0.3413744, 0.2937566, 2.452373, 0, 0.2078431, 1, 1,
0.3467655, 0.9685903, 0.06046901, 0, 0.2039216, 1, 1,
0.3512717, -2.461913, 2.724709, 0, 0.1960784, 1, 1,
0.3556331, -1.056774, 3.499214, 0, 0.1882353, 1, 1,
0.3558806, 0.01640409, 1.503595, 0, 0.1843137, 1, 1,
0.3571913, 0.2330416, 2.218953, 0, 0.1764706, 1, 1,
0.3582391, -0.1577739, 4.144347, 0, 0.172549, 1, 1,
0.3588519, 0.2691691, 1.213722, 0, 0.1647059, 1, 1,
0.359113, -0.2788212, 1.859717, 0, 0.1607843, 1, 1,
0.362153, 0.6280126, -1.05437, 0, 0.1529412, 1, 1,
0.3631076, -0.6554365, 2.350123, 0, 0.1490196, 1, 1,
0.3632779, 1.01141, 0.1732348, 0, 0.1411765, 1, 1,
0.3635189, 2.058539, 0.3014155, 0, 0.1372549, 1, 1,
0.3656222, 0.5995048, 0.4601471, 0, 0.1294118, 1, 1,
0.3703794, 0.6774824, 1.304701, 0, 0.1254902, 1, 1,
0.3708259, -0.9685836, 3.16833, 0, 0.1176471, 1, 1,
0.3751063, 1.74747, 1.355942, 0, 0.1137255, 1, 1,
0.3792033, 0.2015214, -0.1044225, 0, 0.1058824, 1, 1,
0.3814671, -0.8654895, 2.842996, 0, 0.09803922, 1, 1,
0.3820727, -0.3189095, 3.337239, 0, 0.09411765, 1, 1,
0.387274, -0.6743945, 3.414219, 0, 0.08627451, 1, 1,
0.3927232, -0.6083145, 2.650049, 0, 0.08235294, 1, 1,
0.3976035, -0.8819773, 2.042815, 0, 0.07450981, 1, 1,
0.4009089, 0.6330897, -0.6055064, 0, 0.07058824, 1, 1,
0.4019623, -1.449662, 3.896271, 0, 0.0627451, 1, 1,
0.4061539, -0.1063454, 3.425489, 0, 0.05882353, 1, 1,
0.4062337, 1.208485, -0.2647366, 0, 0.05098039, 1, 1,
0.4082691, -1.084526, 1.178218, 0, 0.04705882, 1, 1,
0.4121763, -0.8092786, 0.1251615, 0, 0.03921569, 1, 1,
0.4184134, 1.338994, 0.2604502, 0, 0.03529412, 1, 1,
0.4216771, 0.2978922, 0.4281721, 0, 0.02745098, 1, 1,
0.4229213, -0.4383386, 1.349419, 0, 0.02352941, 1, 1,
0.4255283, 0.2649259, -1.002467, 0, 0.01568628, 1, 1,
0.4259609, -0.6604795, 2.447339, 0, 0.01176471, 1, 1,
0.4278294, 2.037564, -0.8955277, 0, 0.003921569, 1, 1,
0.4288332, -1.835126, 3.317056, 0.003921569, 0, 1, 1,
0.4289001, 0.5223319, 2.619797, 0.007843138, 0, 1, 1,
0.4317327, 0.9836143, 0.577297, 0.01568628, 0, 1, 1,
0.4335352, -0.7980198, 0.8985096, 0.01960784, 0, 1, 1,
0.435043, -0.2083606, 3.326864, 0.02745098, 0, 1, 1,
0.4384529, 1.121546, 1.196001, 0.03137255, 0, 1, 1,
0.4388933, 0.310462, 0.6826434, 0.03921569, 0, 1, 1,
0.4407899, 1.146912, -0.887959, 0.04313726, 0, 1, 1,
0.4424157, 0.8181145, 2.165058, 0.05098039, 0, 1, 1,
0.4443211, -0.3641511, 2.617884, 0.05490196, 0, 1, 1,
0.4454018, -0.1353486, 1.079276, 0.0627451, 0, 1, 1,
0.4473835, -2.075073, 3.59065, 0.06666667, 0, 1, 1,
0.448625, 0.4693008, 2.306782, 0.07450981, 0, 1, 1,
0.4502774, -0.7099523, 1.868309, 0.07843138, 0, 1, 1,
0.4527011, -1.311797, 1.386803, 0.08627451, 0, 1, 1,
0.4532017, -1.116639, 0.8802633, 0.09019608, 0, 1, 1,
0.4550617, -0.6185659, 2.218909, 0.09803922, 0, 1, 1,
0.4552072, -0.6030803, 2.334447, 0.1058824, 0, 1, 1,
0.4605606, -0.7562214, 2.43261, 0.1098039, 0, 1, 1,
0.46207, -0.7334607, 1.609058, 0.1176471, 0, 1, 1,
0.4632072, -1.199617, 3.335765, 0.1215686, 0, 1, 1,
0.4633355, -0.8706474, 3.836529, 0.1294118, 0, 1, 1,
0.4638221, 0.2122537, 1.317839, 0.1333333, 0, 1, 1,
0.4642808, -1.55713, 3.243248, 0.1411765, 0, 1, 1,
0.4682634, 0.3726408, 2.203498, 0.145098, 0, 1, 1,
0.4692209, -1.597422, 2.586429, 0.1529412, 0, 1, 1,
0.4719588, 0.4137949, 1.270962, 0.1568628, 0, 1, 1,
0.473297, 1.654447, -0.2178323, 0.1647059, 0, 1, 1,
0.4736243, 0.2064385, 2.415996, 0.1686275, 0, 1, 1,
0.4748039, -0.8751429, 1.497341, 0.1764706, 0, 1, 1,
0.4769108, 0.7103184, -1.01128, 0.1803922, 0, 1, 1,
0.47885, 2.030368, 0.5918729, 0.1882353, 0, 1, 1,
0.4833856, 1.305568, 0.07437894, 0.1921569, 0, 1, 1,
0.4839486, 0.3542363, 0.9017356, 0.2, 0, 1, 1,
0.4851216, 0.4134745, 0.1957257, 0.2078431, 0, 1, 1,
0.4860791, -2.487667, 3.339694, 0.2117647, 0, 1, 1,
0.4871495, 0.6495443, 0.2614011, 0.2196078, 0, 1, 1,
0.4883905, -2.506228, 1.65298, 0.2235294, 0, 1, 1,
0.5004169, -1.536283, 3.339833, 0.2313726, 0, 1, 1,
0.5062896, 1.953705, 0.1529346, 0.2352941, 0, 1, 1,
0.5111707, -1.569795, 3.768138, 0.2431373, 0, 1, 1,
0.5137103, -0.1628613, 1.604611, 0.2470588, 0, 1, 1,
0.5141941, -1.135407, 2.314485, 0.254902, 0, 1, 1,
0.5162503, -0.638719, 3.048048, 0.2588235, 0, 1, 1,
0.5164297, 0.06646889, 2.834833, 0.2666667, 0, 1, 1,
0.5179756, -0.4759055, 1.634607, 0.2705882, 0, 1, 1,
0.5196718, -0.5287255, 2.407999, 0.2784314, 0, 1, 1,
0.5246108, 1.491469, -0.6031283, 0.282353, 0, 1, 1,
0.526661, -0.9120068, 2.801631, 0.2901961, 0, 1, 1,
0.529541, 0.03155171, 0.4051385, 0.2941177, 0, 1, 1,
0.5308855, -0.3239315, 2.25913, 0.3019608, 0, 1, 1,
0.5329178, 0.3667214, 2.797792, 0.3098039, 0, 1, 1,
0.5342737, 2.202079, 0.2912808, 0.3137255, 0, 1, 1,
0.5354409, -2.073612, 2.890317, 0.3215686, 0, 1, 1,
0.5367182, -1.206794, 2.957989, 0.3254902, 0, 1, 1,
0.5372042, -1.007984, 3.005302, 0.3333333, 0, 1, 1,
0.5374497, 1.883866, -0.3319262, 0.3372549, 0, 1, 1,
0.5384476, 1.470466, 0.2549755, 0.345098, 0, 1, 1,
0.5396067, 0.9986159, 1.998881, 0.3490196, 0, 1, 1,
0.5409682, 0.7022746, 1.30998, 0.3568628, 0, 1, 1,
0.5412527, 0.7984415, -0.07423304, 0.3607843, 0, 1, 1,
0.5467584, 0.6381558, -1.068078, 0.3686275, 0, 1, 1,
0.5546867, -0.2044623, 2.644723, 0.372549, 0, 1, 1,
0.5561916, 0.8318043, 0.005124127, 0.3803922, 0, 1, 1,
0.5593064, -0.469035, 1.957245, 0.3843137, 0, 1, 1,
0.5724001, -2.325359, 3.087454, 0.3921569, 0, 1, 1,
0.5754947, -0.98057, 2.669214, 0.3960784, 0, 1, 1,
0.5803067, -0.07253706, -0.2019332, 0.4039216, 0, 1, 1,
0.5856656, -1.221883, 3.529401, 0.4117647, 0, 1, 1,
0.5859776, -1.308247, 1.678545, 0.4156863, 0, 1, 1,
0.5863075, 1.172451, -1.418983, 0.4235294, 0, 1, 1,
0.5892084, -0.1617992, 3.497843, 0.427451, 0, 1, 1,
0.5925791, 0.5128205, 0.2083327, 0.4352941, 0, 1, 1,
0.5975686, 0.02484952, 2.096524, 0.4392157, 0, 1, 1,
0.607435, 0.5865886, 0.8094994, 0.4470588, 0, 1, 1,
0.6075485, -1.431902, 1.82241, 0.4509804, 0, 1, 1,
0.6081821, 2.056694, -0.09693491, 0.4588235, 0, 1, 1,
0.6190307, -0.4037196, 1.747992, 0.4627451, 0, 1, 1,
0.6233478, -0.3467487, 3.005966, 0.4705882, 0, 1, 1,
0.6247021, -0.9158567, 2.06002, 0.4745098, 0, 1, 1,
0.6254181, 0.3895647, 1.791939, 0.4823529, 0, 1, 1,
0.6260849, -0.3451632, 0.6981131, 0.4862745, 0, 1, 1,
0.6330608, -1.657693, 2.639717, 0.4941176, 0, 1, 1,
0.6342884, -0.9613624, 0.704385, 0.5019608, 0, 1, 1,
0.6343617, -0.3795347, 1.744235, 0.5058824, 0, 1, 1,
0.6426053, 0.6430683, 0.5587755, 0.5137255, 0, 1, 1,
0.6460988, 0.2238722, -0.9964458, 0.5176471, 0, 1, 1,
0.6481142, -0.512446, 2.825273, 0.5254902, 0, 1, 1,
0.6506934, 1.440216, -0.1509224, 0.5294118, 0, 1, 1,
0.6510954, -1.348993, 3.843212, 0.5372549, 0, 1, 1,
0.6519894, -1.044281, 2.679508, 0.5411765, 0, 1, 1,
0.6527159, -0.5865009, 3.031017, 0.5490196, 0, 1, 1,
0.6599429, -0.3913288, 2.623396, 0.5529412, 0, 1, 1,
0.6615695, -1.92838, 2.929604, 0.5607843, 0, 1, 1,
0.6660196, -0.6459267, 0.8828945, 0.5647059, 0, 1, 1,
0.6698982, 1.465108, -1.256371, 0.572549, 0, 1, 1,
0.6747424, 0.5795215, 0.6546038, 0.5764706, 0, 1, 1,
0.6748325, 0.793835, 0.1603644, 0.5843138, 0, 1, 1,
0.6785123, -0.8722398, 1.998434, 0.5882353, 0, 1, 1,
0.6813043, -2.60721, 3.185814, 0.5960785, 0, 1, 1,
0.6877316, 0.8564415, 2.259583, 0.6039216, 0, 1, 1,
0.6921561, -0.1410772, 1.92705, 0.6078432, 0, 1, 1,
0.7034414, -0.1274084, 1.234067, 0.6156863, 0, 1, 1,
0.7048433, -0.6800098, 3.089275, 0.6196079, 0, 1, 1,
0.7156177, -0.212807, 1.293602, 0.627451, 0, 1, 1,
0.7191103, 1.514171, -1.886884, 0.6313726, 0, 1, 1,
0.7238477, 0.07833926, 1.934018, 0.6392157, 0, 1, 1,
0.7322995, -1.406994, 1.36269, 0.6431373, 0, 1, 1,
0.7327813, 0.3275231, 0.8898437, 0.6509804, 0, 1, 1,
0.7328068, 1.035651, -0.6421701, 0.654902, 0, 1, 1,
0.7345229, 1.532373, 0.0286913, 0.6627451, 0, 1, 1,
0.7355517, 0.3456537, 1.527117, 0.6666667, 0, 1, 1,
0.740156, -1.812594, 2.21129, 0.6745098, 0, 1, 1,
0.7428821, -0.3230963, 0.8737632, 0.6784314, 0, 1, 1,
0.7432719, 1.549746, -0.1127525, 0.6862745, 0, 1, 1,
0.7556146, -1.739285, 0.5719697, 0.6901961, 0, 1, 1,
0.7558109, 0.4118271, 1.295033, 0.6980392, 0, 1, 1,
0.7582516, 1.400459, 2.358465, 0.7058824, 0, 1, 1,
0.7658093, -0.06698593, 2.095373, 0.7098039, 0, 1, 1,
0.7686111, 0.7161853, 2.596372, 0.7176471, 0, 1, 1,
0.7694237, 2.474412, 0.5301632, 0.7215686, 0, 1, 1,
0.7722257, 0.6305729, 1.890064, 0.7294118, 0, 1, 1,
0.7736741, -0.1394221, 1.105259, 0.7333333, 0, 1, 1,
0.7750667, -0.8715036, 2.589233, 0.7411765, 0, 1, 1,
0.7869886, -0.1120291, 2.451529, 0.7450981, 0, 1, 1,
0.7928577, -0.3619972, 0.5909284, 0.7529412, 0, 1, 1,
0.794693, -0.2321489, 3.453904, 0.7568628, 0, 1, 1,
0.7950409, -0.5943876, 2.423261, 0.7647059, 0, 1, 1,
0.7979754, 0.6260222, -0.05337675, 0.7686275, 0, 1, 1,
0.798942, 0.5816901, 0.4333895, 0.7764706, 0, 1, 1,
0.8013097, 0.1091013, 0.3088787, 0.7803922, 0, 1, 1,
0.8036351, 0.9867866, -0.7291964, 0.7882353, 0, 1, 1,
0.8196082, -0.8992337, 1.622614, 0.7921569, 0, 1, 1,
0.8197724, -0.7048614, 2.000661, 0.8, 0, 1, 1,
0.8315234, -1.146992, 2.875765, 0.8078431, 0, 1, 1,
0.8332084, -0.6112285, 1.007525, 0.8117647, 0, 1, 1,
0.8378013, 1.523385, 1.894838, 0.8196079, 0, 1, 1,
0.8425155, -0.7399673, 3.740752, 0.8235294, 0, 1, 1,
0.8432598, -0.4776876, 1.522166, 0.8313726, 0, 1, 1,
0.851493, -0.3568698, 2.712928, 0.8352941, 0, 1, 1,
0.854787, 1.457161, -0.06193134, 0.8431373, 0, 1, 1,
0.8623948, -1.059098, 2.759538, 0.8470588, 0, 1, 1,
0.8736272, 0.07819599, 0.07541405, 0.854902, 0, 1, 1,
0.8748041, -0.8559562, 2.725741, 0.8588235, 0, 1, 1,
0.8814989, -0.7417901, 0.6132642, 0.8666667, 0, 1, 1,
0.8821319, -1.361283, 3.974039, 0.8705882, 0, 1, 1,
0.892877, -1.06489, 2.037702, 0.8784314, 0, 1, 1,
0.8992255, 0.585982, 3.325176, 0.8823529, 0, 1, 1,
0.8998786, -1.88584, 0.5180353, 0.8901961, 0, 1, 1,
0.9008289, -1.624132, 2.770586, 0.8941177, 0, 1, 1,
0.9031556, -1.533064, 2.96485, 0.9019608, 0, 1, 1,
0.919313, -0.5561864, 2.225016, 0.9098039, 0, 1, 1,
0.9202282, -1.692857, 1.799127, 0.9137255, 0, 1, 1,
0.9205406, -0.6381447, 2.018225, 0.9215686, 0, 1, 1,
0.921788, -0.2834177, 2.168961, 0.9254902, 0, 1, 1,
0.92466, 0.914282, 0.6350828, 0.9333333, 0, 1, 1,
0.931109, -1.011661, 3.597378, 0.9372549, 0, 1, 1,
0.9366733, 0.9697298, -0.5035062, 0.945098, 0, 1, 1,
0.936721, 1.128193, 1.122371, 0.9490196, 0, 1, 1,
0.9409162, 0.04141375, 2.430019, 0.9568627, 0, 1, 1,
0.9437745, -0.1267799, 2.838058, 0.9607843, 0, 1, 1,
0.9453063, -0.06986526, 2.172246, 0.9686275, 0, 1, 1,
0.9492938, 0.402251, -0.4485008, 0.972549, 0, 1, 1,
0.9510629, -2.364223, 3.034532, 0.9803922, 0, 1, 1,
0.9607242, -0.9317088, 3.519213, 0.9843137, 0, 1, 1,
0.9681633, -1.125156, 2.994785, 0.9921569, 0, 1, 1,
0.9749393, 0.5359339, 1.59713, 0.9960784, 0, 1, 1,
0.9815752, -0.0453394, 1.827638, 1, 0, 0.9960784, 1,
0.987713, -0.7872741, 4.303336, 1, 0, 0.9882353, 1,
0.9933662, 1.283025, -0.007954207, 1, 0, 0.9843137, 1,
0.9938635, -0.8346516, 3.522655, 1, 0, 0.9764706, 1,
0.9939281, -0.8282111, 3.873617, 1, 0, 0.972549, 1,
0.99544, -1.072798, 1.47238, 1, 0, 0.9647059, 1,
0.9964296, 0.6251709, 0.8807168, 1, 0, 0.9607843, 1,
1.000537, 2.762805, -1.589301, 1, 0, 0.9529412, 1,
1.001764, -0.3062739, 1.523187, 1, 0, 0.9490196, 1,
1.004875, -1.226682, 3.123091, 1, 0, 0.9411765, 1,
1.005982, 1.340661, 2.072287, 1, 0, 0.9372549, 1,
1.018384, -1.113817, 3.586529, 1, 0, 0.9294118, 1,
1.031028, 0.9528654, 0.2277778, 1, 0, 0.9254902, 1,
1.034675, 1.608857, 0.8730006, 1, 0, 0.9176471, 1,
1.050884, 1.046533, -0.1063795, 1, 0, 0.9137255, 1,
1.066652, -0.05339008, 4.196146, 1, 0, 0.9058824, 1,
1.06731, -0.610121, 3.979869, 1, 0, 0.9019608, 1,
1.081643, 1.002245, 0.5131779, 1, 0, 0.8941177, 1,
1.081853, -0.6492211, 1.265466, 1, 0, 0.8862745, 1,
1.083005, 0.1401897, 0.7400809, 1, 0, 0.8823529, 1,
1.086036, 0.7024796, 2.969972, 1, 0, 0.8745098, 1,
1.109064, -1.477687, 1.207247, 1, 0, 0.8705882, 1,
1.116733, 1.232447, 1.03371, 1, 0, 0.8627451, 1,
1.124838, -0.8299283, 1.586891, 1, 0, 0.8588235, 1,
1.127624, 0.1721864, 0.7865519, 1, 0, 0.8509804, 1,
1.129762, 0.2558879, -0.2109822, 1, 0, 0.8470588, 1,
1.139655, 1.068739, 0.4335625, 1, 0, 0.8392157, 1,
1.141569, -0.7606079, 3.374063, 1, 0, 0.8352941, 1,
1.143117, -1.11398, 2.057402, 1, 0, 0.827451, 1,
1.144061, -0.0750199, 1.343755, 1, 0, 0.8235294, 1,
1.144529, 1.490198, 1.298068, 1, 0, 0.8156863, 1,
1.149334, -0.1230601, 3.639086, 1, 0, 0.8117647, 1,
1.156729, -0.2350148, 1.275067, 1, 0, 0.8039216, 1,
1.159928, -0.02245664, 3.386519, 1, 0, 0.7960784, 1,
1.161184, -0.508216, 2.182139, 1, 0, 0.7921569, 1,
1.173078, -1.583822, 1.863441, 1, 0, 0.7843137, 1,
1.181248, -0.04917791, 0.5046787, 1, 0, 0.7803922, 1,
1.185743, 0.6889969, 2.833707, 1, 0, 0.772549, 1,
1.187634, -0.6921008, 3.173779, 1, 0, 0.7686275, 1,
1.188577, 0.5576935, 1.473732, 1, 0, 0.7607843, 1,
1.189571, -0.1322233, 2.372226, 1, 0, 0.7568628, 1,
1.19382, 1.823587, -0.7822438, 1, 0, 0.7490196, 1,
1.19816, -1.56805, 2.13496, 1, 0, 0.7450981, 1,
1.237918, -0.7113972, 2.43653, 1, 0, 0.7372549, 1,
1.252548, -0.09376734, 1.083197, 1, 0, 0.7333333, 1,
1.252758, 1.219476, 1.051418, 1, 0, 0.7254902, 1,
1.254998, 0.4379971, 2.021208, 1, 0, 0.7215686, 1,
1.257675, 0.2797156, 0.3821329, 1, 0, 0.7137255, 1,
1.274355, 0.4311413, 0.555606, 1, 0, 0.7098039, 1,
1.274633, 1.425666, 0.382806, 1, 0, 0.7019608, 1,
1.287952, -0.2823567, 1.913585, 1, 0, 0.6941177, 1,
1.294721, -0.4912556, 2.101344, 1, 0, 0.6901961, 1,
1.297985, 1.4131, -0.1330765, 1, 0, 0.682353, 1,
1.314792, 0.06462002, -0.4076075, 1, 0, 0.6784314, 1,
1.323688, -0.6834165, 0.7704458, 1, 0, 0.6705883, 1,
1.324566, -1.282067, 0.9930955, 1, 0, 0.6666667, 1,
1.326415, -0.5434417, 1.660781, 1, 0, 0.6588235, 1,
1.332339, -0.4988309, 3.31484, 1, 0, 0.654902, 1,
1.355638, 0.2824458, 1.295294, 1, 0, 0.6470588, 1,
1.361764, 0.8684911, 2.498322, 1, 0, 0.6431373, 1,
1.36426, -1.079643, 1.765052, 1, 0, 0.6352941, 1,
1.372811, 0.6148418, 1.97078, 1, 0, 0.6313726, 1,
1.400716, 0.8980238, -1.409079, 1, 0, 0.6235294, 1,
1.405107, 0.1748515, 3.195568, 1, 0, 0.6196079, 1,
1.41579, -0.1768316, 1.679343, 1, 0, 0.6117647, 1,
1.416916, -0.806592, 2.241503, 1, 0, 0.6078432, 1,
1.420055, 0.2384311, -0.5643349, 1, 0, 0.6, 1,
1.420428, -0.7592984, 2.774289, 1, 0, 0.5921569, 1,
1.424195, -0.1986393, 1.249388, 1, 0, 0.5882353, 1,
1.424366, -1.030375, 1.711458, 1, 0, 0.5803922, 1,
1.425167, -1.853319, 4.750758, 1, 0, 0.5764706, 1,
1.428841, -0.8141371, 2.125908, 1, 0, 0.5686275, 1,
1.431868, 0.1516473, -0.0619447, 1, 0, 0.5647059, 1,
1.437854, 0.1673617, 2.322772, 1, 0, 0.5568628, 1,
1.440273, -0.8659849, 4.028116, 1, 0, 0.5529412, 1,
1.447332, -0.9316591, 2.475339, 1, 0, 0.5450981, 1,
1.450652, -0.201193, 1.403501, 1, 0, 0.5411765, 1,
1.452032, -0.8255603, 0.06077389, 1, 0, 0.5333334, 1,
1.452384, 0.3029613, 1.510229, 1, 0, 0.5294118, 1,
1.46574, 0.6941772, -0.1629558, 1, 0, 0.5215687, 1,
1.471589, -1.905383, 2.439207, 1, 0, 0.5176471, 1,
1.484463, 1.340354, -0.717048, 1, 0, 0.509804, 1,
1.493177, 0.6696355, 1.241167, 1, 0, 0.5058824, 1,
1.494542, -1.853641, 2.4383, 1, 0, 0.4980392, 1,
1.49745, -1.036849, 2.641394, 1, 0, 0.4901961, 1,
1.507475, -0.4936273, 2.522202, 1, 0, 0.4862745, 1,
1.509734, -1.219782, 1.598972, 1, 0, 0.4784314, 1,
1.510749, -1.384354, 2.030414, 1, 0, 0.4745098, 1,
1.513394, -0.9238897, 1.193101, 1, 0, 0.4666667, 1,
1.513426, 0.4514961, -0.6104993, 1, 0, 0.4627451, 1,
1.518341, 0.03608924, 1.742658, 1, 0, 0.454902, 1,
1.518718, -1.272745, 1.030934, 1, 0, 0.4509804, 1,
1.51937, -0.08975512, 1.641739, 1, 0, 0.4431373, 1,
1.521119, -0.5336673, 1.58692, 1, 0, 0.4392157, 1,
1.541637, -2.803901, 2.466997, 1, 0, 0.4313726, 1,
1.549914, 0.5605406, 1.365655, 1, 0, 0.427451, 1,
1.555999, 0.6109854, -1.004236, 1, 0, 0.4196078, 1,
1.561342, -0.680545, 0.3724766, 1, 0, 0.4156863, 1,
1.572051, 0.3180823, 1.422758, 1, 0, 0.4078431, 1,
1.572328, 0.719409, 2.021199, 1, 0, 0.4039216, 1,
1.579669, -0.142893, 1.079959, 1, 0, 0.3960784, 1,
1.597514, 0.4107986, 3.776845, 1, 0, 0.3882353, 1,
1.601175, 0.3973579, -0.6013675, 1, 0, 0.3843137, 1,
1.604699, -0.1467888, 1.910798, 1, 0, 0.3764706, 1,
1.609503, 1.185915, 2.42009, 1, 0, 0.372549, 1,
1.629143, -0.2745345, 0.9766386, 1, 0, 0.3647059, 1,
1.651136, 0.8898987, 0.1173806, 1, 0, 0.3607843, 1,
1.663623, 0.9084772, 2.554282, 1, 0, 0.3529412, 1,
1.697015, -1.014836, 1.250949, 1, 0, 0.3490196, 1,
1.697116, 0.8404663, 1.632048, 1, 0, 0.3411765, 1,
1.708745, -1.814446, 1.716761, 1, 0, 0.3372549, 1,
1.71226, -0.2412675, 0.3061168, 1, 0, 0.3294118, 1,
1.715373, -1.411238, 2.59273, 1, 0, 0.3254902, 1,
1.719979, 0.289414, 3.232773, 1, 0, 0.3176471, 1,
1.726412, -1.92012, 0.9206308, 1, 0, 0.3137255, 1,
1.727731, 0.5030613, 0.1451013, 1, 0, 0.3058824, 1,
1.739737, -0.05405639, 0.4052036, 1, 0, 0.2980392, 1,
1.745404, -1.263217, 1.335235, 1, 0, 0.2941177, 1,
1.748746, -0.2114109, 0.3946646, 1, 0, 0.2862745, 1,
1.774689, 1.30699, 1.547576, 1, 0, 0.282353, 1,
1.7787, -0.4016067, 2.206397, 1, 0, 0.2745098, 1,
1.779288, 0.3999776, -0.2581935, 1, 0, 0.2705882, 1,
1.788011, -0.6515472, 1.094462, 1, 0, 0.2627451, 1,
1.825439, 0.01820406, 1.167987, 1, 0, 0.2588235, 1,
1.832923, -2.478168, 1.918748, 1, 0, 0.2509804, 1,
1.844223, -1.134707, 2.169821, 1, 0, 0.2470588, 1,
1.850234, -0.7727168, -0.05164979, 1, 0, 0.2392157, 1,
1.852572, -0.04558775, 1.395589, 1, 0, 0.2352941, 1,
1.858128, 1.810296, -1.455324, 1, 0, 0.227451, 1,
1.861846, 0.7342492, 1.134398, 1, 0, 0.2235294, 1,
1.862835, 1.348698, 0.3331298, 1, 0, 0.2156863, 1,
1.880257, 0.8555681, 2.127851, 1, 0, 0.2117647, 1,
1.894968, -1.412744, 1.878767, 1, 0, 0.2039216, 1,
1.909499, 1.298162, 1.123277, 1, 0, 0.1960784, 1,
1.909883, -0.5847605, -0.5548944, 1, 0, 0.1921569, 1,
1.937748, -1.565711, 2.692553, 1, 0, 0.1843137, 1,
1.94695, -0.7098777, 3.593136, 1, 0, 0.1803922, 1,
1.974865, -0.9848952, 1.830732, 1, 0, 0.172549, 1,
1.975163, 0.3669876, 1.181508, 1, 0, 0.1686275, 1,
1.982021, -0.5515063, 1.644016, 1, 0, 0.1607843, 1,
1.993869, -0.04004358, 2.078352, 1, 0, 0.1568628, 1,
1.998932, 1.503571, -0.3268875, 1, 0, 0.1490196, 1,
2.074963, -0.6629896, 2.383629, 1, 0, 0.145098, 1,
2.079586, -0.66047, 2.055228, 1, 0, 0.1372549, 1,
2.087043, 0.320842, -0.3678737, 1, 0, 0.1333333, 1,
2.088004, -0.2262394, 2.030247, 1, 0, 0.1254902, 1,
2.100008, -0.0415893, 0.9135455, 1, 0, 0.1215686, 1,
2.149458, 1.093288, -0.04101818, 1, 0, 0.1137255, 1,
2.168279, 0.4674684, 0.4573206, 1, 0, 0.1098039, 1,
2.174411, -0.4898885, 1.339469, 1, 0, 0.1019608, 1,
2.197933, -0.4162435, 3.26369, 1, 0, 0.09411765, 1,
2.247241, -1.026865, 0.3208702, 1, 0, 0.09019608, 1,
2.275287, -2.616743, 3.751654, 1, 0, 0.08235294, 1,
2.308532, 2.015955, 0.6448522, 1, 0, 0.07843138, 1,
2.326558, 0.08683695, 1.668699, 1, 0, 0.07058824, 1,
2.357944, 0.07714713, 1.59478, 1, 0, 0.06666667, 1,
2.452584, 0.841265, 2.320246, 1, 0, 0.05882353, 1,
2.468529, -0.5114056, 1.21812, 1, 0, 0.05490196, 1,
2.556465, 1.170528, 2.116363, 1, 0, 0.04705882, 1,
2.568957, -0.2692796, 0.5751571, 1, 0, 0.04313726, 1,
2.584055, -1.999108, 1.004942, 1, 0, 0.03529412, 1,
2.664149, 0.05151298, -0.6383049, 1, 0, 0.03137255, 1,
2.802562, 0.4115608, 1.007136, 1, 0, 0.02352941, 1,
2.899561, -0.03892212, 2.757416, 1, 0, 0.01960784, 1,
3.025853, 0.01675108, 0.401695, 1, 0, 0.01176471, 1,
3.071547, -0.1905886, 2.277246, 1, 0, 0.007843138, 1
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
-0.05845666, -3.812287, -7.8921, 0, -0.5, 0.5, 0.5,
-0.05845666, -3.812287, -7.8921, 1, -0.5, 0.5, 0.5,
-0.05845666, -3.812287, -7.8921, 1, 1.5, 0.5, 0.5,
-0.05845666, -3.812287, -7.8921, 0, 1.5, 0.5, 0.5
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
-4.249531, -0.04826498, -7.8921, 0, -0.5, 0.5, 0.5,
-4.249531, -0.04826498, -7.8921, 1, -0.5, 0.5, 0.5,
-4.249531, -0.04826498, -7.8921, 1, 1.5, 0.5, 0.5,
-4.249531, -0.04826498, -7.8921, 0, 1.5, 0.5, 0.5
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
-4.249531, -3.812287, 0.2210052, 0, -0.5, 0.5, 0.5,
-4.249531, -3.812287, 0.2210052, 1, -0.5, 0.5, 0.5,
-4.249531, -3.812287, 0.2210052, 1, 1.5, 0.5, 0.5,
-4.249531, -3.812287, 0.2210052, 0, 1.5, 0.5, 0.5
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
-3, -2.943666, -6.019845,
3, -2.943666, -6.019845,
-3, -2.943666, -6.019845,
-3, -3.088437, -6.331888,
-2, -2.943666, -6.019845,
-2, -3.088437, -6.331888,
-1, -2.943666, -6.019845,
-1, -3.088437, -6.331888,
0, -2.943666, -6.019845,
0, -3.088437, -6.331888,
1, -2.943666, -6.019845,
1, -3.088437, -6.331888,
2, -2.943666, -6.019845,
2, -3.088437, -6.331888,
3, -2.943666, -6.019845,
3, -3.088437, -6.331888
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
-3, -3.377977, -6.955973, 0, -0.5, 0.5, 0.5,
-3, -3.377977, -6.955973, 1, -0.5, 0.5, 0.5,
-3, -3.377977, -6.955973, 1, 1.5, 0.5, 0.5,
-3, -3.377977, -6.955973, 0, 1.5, 0.5, 0.5,
-2, -3.377977, -6.955973, 0, -0.5, 0.5, 0.5,
-2, -3.377977, -6.955973, 1, -0.5, 0.5, 0.5,
-2, -3.377977, -6.955973, 1, 1.5, 0.5, 0.5,
-2, -3.377977, -6.955973, 0, 1.5, 0.5, 0.5,
-1, -3.377977, -6.955973, 0, -0.5, 0.5, 0.5,
-1, -3.377977, -6.955973, 1, -0.5, 0.5, 0.5,
-1, -3.377977, -6.955973, 1, 1.5, 0.5, 0.5,
-1, -3.377977, -6.955973, 0, 1.5, 0.5, 0.5,
0, -3.377977, -6.955973, 0, -0.5, 0.5, 0.5,
0, -3.377977, -6.955973, 1, -0.5, 0.5, 0.5,
0, -3.377977, -6.955973, 1, 1.5, 0.5, 0.5,
0, -3.377977, -6.955973, 0, 1.5, 0.5, 0.5,
1, -3.377977, -6.955973, 0, -0.5, 0.5, 0.5,
1, -3.377977, -6.955973, 1, -0.5, 0.5, 0.5,
1, -3.377977, -6.955973, 1, 1.5, 0.5, 0.5,
1, -3.377977, -6.955973, 0, 1.5, 0.5, 0.5,
2, -3.377977, -6.955973, 0, -0.5, 0.5, 0.5,
2, -3.377977, -6.955973, 1, -0.5, 0.5, 0.5,
2, -3.377977, -6.955973, 1, 1.5, 0.5, 0.5,
2, -3.377977, -6.955973, 0, 1.5, 0.5, 0.5,
3, -3.377977, -6.955973, 0, -0.5, 0.5, 0.5,
3, -3.377977, -6.955973, 1, -0.5, 0.5, 0.5,
3, -3.377977, -6.955973, 1, 1.5, 0.5, 0.5,
3, -3.377977, -6.955973, 0, 1.5, 0.5, 0.5
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
-3.28236, -2, -6.019845,
-3.28236, 2, -6.019845,
-3.28236, -2, -6.019845,
-3.443555, -2, -6.331888,
-3.28236, -1, -6.019845,
-3.443555, -1, -6.331888,
-3.28236, 0, -6.019845,
-3.443555, 0, -6.331888,
-3.28236, 1, -6.019845,
-3.443555, 1, -6.331888,
-3.28236, 2, -6.019845,
-3.443555, 2, -6.331888
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
-3.765946, -2, -6.955973, 0, -0.5, 0.5, 0.5,
-3.765946, -2, -6.955973, 1, -0.5, 0.5, 0.5,
-3.765946, -2, -6.955973, 1, 1.5, 0.5, 0.5,
-3.765946, -2, -6.955973, 0, 1.5, 0.5, 0.5,
-3.765946, -1, -6.955973, 0, -0.5, 0.5, 0.5,
-3.765946, -1, -6.955973, 1, -0.5, 0.5, 0.5,
-3.765946, -1, -6.955973, 1, 1.5, 0.5, 0.5,
-3.765946, -1, -6.955973, 0, 1.5, 0.5, 0.5,
-3.765946, 0, -6.955973, 0, -0.5, 0.5, 0.5,
-3.765946, 0, -6.955973, 1, -0.5, 0.5, 0.5,
-3.765946, 0, -6.955973, 1, 1.5, 0.5, 0.5,
-3.765946, 0, -6.955973, 0, 1.5, 0.5, 0.5,
-3.765946, 1, -6.955973, 0, -0.5, 0.5, 0.5,
-3.765946, 1, -6.955973, 1, -0.5, 0.5, 0.5,
-3.765946, 1, -6.955973, 1, 1.5, 0.5, 0.5,
-3.765946, 1, -6.955973, 0, 1.5, 0.5, 0.5,
-3.765946, 2, -6.955973, 0, -0.5, 0.5, 0.5,
-3.765946, 2, -6.955973, 1, -0.5, 0.5, 0.5,
-3.765946, 2, -6.955973, 1, 1.5, 0.5, 0.5,
-3.765946, 2, -6.955973, 0, 1.5, 0.5, 0.5
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
-3.28236, -2.943666, -4,
-3.28236, -2.943666, 6,
-3.28236, -2.943666, -4,
-3.443555, -3.088437, -4,
-3.28236, -2.943666, -2,
-3.443555, -3.088437, -2,
-3.28236, -2.943666, 0,
-3.443555, -3.088437, 0,
-3.28236, -2.943666, 2,
-3.443555, -3.088437, 2,
-3.28236, -2.943666, 4,
-3.443555, -3.088437, 4,
-3.28236, -2.943666, 6,
-3.443555, -3.088437, 6
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
-3.765946, -3.377977, -4, 0, -0.5, 0.5, 0.5,
-3.765946, -3.377977, -4, 1, -0.5, 0.5, 0.5,
-3.765946, -3.377977, -4, 1, 1.5, 0.5, 0.5,
-3.765946, -3.377977, -4, 0, 1.5, 0.5, 0.5,
-3.765946, -3.377977, -2, 0, -0.5, 0.5, 0.5,
-3.765946, -3.377977, -2, 1, -0.5, 0.5, 0.5,
-3.765946, -3.377977, -2, 1, 1.5, 0.5, 0.5,
-3.765946, -3.377977, -2, 0, 1.5, 0.5, 0.5,
-3.765946, -3.377977, 0, 0, -0.5, 0.5, 0.5,
-3.765946, -3.377977, 0, 1, -0.5, 0.5, 0.5,
-3.765946, -3.377977, 0, 1, 1.5, 0.5, 0.5,
-3.765946, -3.377977, 0, 0, 1.5, 0.5, 0.5,
-3.765946, -3.377977, 2, 0, -0.5, 0.5, 0.5,
-3.765946, -3.377977, 2, 1, -0.5, 0.5, 0.5,
-3.765946, -3.377977, 2, 1, 1.5, 0.5, 0.5,
-3.765946, -3.377977, 2, 0, 1.5, 0.5, 0.5,
-3.765946, -3.377977, 4, 0, -0.5, 0.5, 0.5,
-3.765946, -3.377977, 4, 1, -0.5, 0.5, 0.5,
-3.765946, -3.377977, 4, 1, 1.5, 0.5, 0.5,
-3.765946, -3.377977, 4, 0, 1.5, 0.5, 0.5,
-3.765946, -3.377977, 6, 0, -0.5, 0.5, 0.5,
-3.765946, -3.377977, 6, 1, -0.5, 0.5, 0.5,
-3.765946, -3.377977, 6, 1, 1.5, 0.5, 0.5,
-3.765946, -3.377977, 6, 0, 1.5, 0.5, 0.5
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
-3.28236, -2.943666, -6.019845,
-3.28236, 2.847136, -6.019845,
-3.28236, -2.943666, 6.461855,
-3.28236, 2.847136, 6.461855,
-3.28236, -2.943666, -6.019845,
-3.28236, -2.943666, 6.461855,
-3.28236, 2.847136, -6.019845,
-3.28236, 2.847136, 6.461855,
-3.28236, -2.943666, -6.019845,
3.165447, -2.943666, -6.019845,
-3.28236, -2.943666, 6.461855,
3.165447, -2.943666, 6.461855,
-3.28236, 2.847136, -6.019845,
3.165447, 2.847136, -6.019845,
-3.28236, 2.847136, 6.461855,
3.165447, 2.847136, 6.461855,
3.165447, -2.943666, -6.019845,
3.165447, 2.847136, -6.019845,
3.165447, -2.943666, 6.461855,
3.165447, 2.847136, 6.461855,
3.165447, -2.943666, -6.019845,
3.165447, -2.943666, 6.461855,
3.165447, 2.847136, -6.019845,
3.165447, 2.847136, 6.461855
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
var radius = 8.114054;
var distance = 36.10034;
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
mvMatrix.translate( 0.05845666, 0.04826498, -0.2210052 );
mvMatrix.scale( 1.360629, 1.515001, 0.7028749 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.10034);
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
Bromoallylene<-read.table("Bromoallylene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Bromoallylene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Bromoallylene' not found
```

```r
y<-Bromoallylene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Bromoallylene' not found
```

```r
z<-Bromoallylene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Bromoallylene' not found
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
-3.18846, -0.8625514, -0.976581, 0, 0, 1, 1, 1,
-2.869861, -0.4113877, -2.904647, 1, 0, 0, 1, 1,
-2.794684, -1.713556, -1.683615, 1, 0, 0, 1, 1,
-2.627716, -1.331587, -3.332628, 1, 0, 0, 1, 1,
-2.440286, 1.577206, -1.966794, 1, 0, 0, 1, 1,
-2.431886, 0.961994, -1.392179, 1, 0, 0, 1, 1,
-2.399348, -0.2178566, -2.126209, 0, 0, 0, 1, 1,
-2.370618, -0.3646694, -3.027367, 0, 0, 0, 1, 1,
-2.349992, -0.3839964, -1.875114, 0, 0, 0, 1, 1,
-2.338702, 0.8358516, -0.8734993, 0, 0, 0, 1, 1,
-2.332893, 0.5514538, 0.5790848, 0, 0, 0, 1, 1,
-2.322126, -0.4329266, -0.9805633, 0, 0, 0, 1, 1,
-2.320208, -1.06278, -2.986926, 0, 0, 0, 1, 1,
-2.304757, 1.599113, -0.05513133, 1, 1, 1, 1, 1,
-2.292407, 0.9477361, -2.122852, 1, 1, 1, 1, 1,
-2.25945, -0.7201007, -4.925366, 1, 1, 1, 1, 1,
-2.202964, 0.6228997, -1.124151, 1, 1, 1, 1, 1,
-2.201116, 0.4940884, -0.757692, 1, 1, 1, 1, 1,
-2.137328, 0.384711, -1.38085, 1, 1, 1, 1, 1,
-2.124893, -0.06112568, -0.8822697, 1, 1, 1, 1, 1,
-2.060794, -0.1678135, -3.179919, 1, 1, 1, 1, 1,
-2.032128, -0.7911937, -1.679898, 1, 1, 1, 1, 1,
-2.018097, 1.096439, -2.980269, 1, 1, 1, 1, 1,
-2.015547, 1.024157, -1.678983, 1, 1, 1, 1, 1,
-1.994125, 0.06094598, -0.6410516, 1, 1, 1, 1, 1,
-1.989424, -0.8663136, -0.9109244, 1, 1, 1, 1, 1,
-1.973601, 1.436174, -0.5365635, 1, 1, 1, 1, 1,
-1.972272, -1.38652, -1.200509, 1, 1, 1, 1, 1,
-1.971433, -1.028911, -3.63744, 0, 0, 1, 1, 1,
-1.94856, 0.02481304, -3.303551, 1, 0, 0, 1, 1,
-1.934812, -1.138639, -2.513142, 1, 0, 0, 1, 1,
-1.919442, -1.400548, -2.92, 1, 0, 0, 1, 1,
-1.909331, -1.217175, -2.434252, 1, 0, 0, 1, 1,
-1.895368, -1.322052, -3.029869, 1, 0, 0, 1, 1,
-1.890462, -0.6466973, -1.454746, 0, 0, 0, 1, 1,
-1.88599, 0.2541596, -0.2128157, 0, 0, 0, 1, 1,
-1.871216, -1.080962, -1.512957, 0, 0, 0, 1, 1,
-1.870446, -0.03441732, -0.1833251, 0, 0, 0, 1, 1,
-1.864814, -0.03604864, -1.514744, 0, 0, 0, 1, 1,
-1.850593, -1.986844, -2.132433, 0, 0, 0, 1, 1,
-1.847834, 0.3233405, -2.080872, 0, 0, 0, 1, 1,
-1.813994, 0.3480346, -1.641552, 1, 1, 1, 1, 1,
-1.809019, 0.5719694, -0.6416973, 1, 1, 1, 1, 1,
-1.80016, 0.2540878, -1.034153, 1, 1, 1, 1, 1,
-1.792681, -0.007710335, -0.3589025, 1, 1, 1, 1, 1,
-1.788332, 0.6876222, -0.05912342, 1, 1, 1, 1, 1,
-1.774536, 1.752328, 0.5921714, 1, 1, 1, 1, 1,
-1.759609, -0.6194017, -1.886545, 1, 1, 1, 1, 1,
-1.758649, -2.500674, -3.522532, 1, 1, 1, 1, 1,
-1.742402, 0.4170314, -2.443321, 1, 1, 1, 1, 1,
-1.718819, -0.1520863, -1.779365, 1, 1, 1, 1, 1,
-1.70034, 0.2281775, -1.716458, 1, 1, 1, 1, 1,
-1.696755, 0.6549094, 0.47146, 1, 1, 1, 1, 1,
-1.690954, -0.06223283, -3.596009, 1, 1, 1, 1, 1,
-1.684697, -0.3300707, -1.003199, 1, 1, 1, 1, 1,
-1.682058, 1.621925, -0.8854997, 1, 1, 1, 1, 1,
-1.681417, 0.08998619, -1.78476, 0, 0, 1, 1, 1,
-1.675522, -0.1685201, -0.5268167, 1, 0, 0, 1, 1,
-1.675284, -0.4141758, -0.1477804, 1, 0, 0, 1, 1,
-1.668423, 0.7349566, -1.61835, 1, 0, 0, 1, 1,
-1.665627, 0.002895372, -3.157576, 1, 0, 0, 1, 1,
-1.642632, 1.186561, -1.142959, 1, 0, 0, 1, 1,
-1.641865, -0.2613226, -1.66513, 0, 0, 0, 1, 1,
-1.635795, -2.12621, -2.3035, 0, 0, 0, 1, 1,
-1.624501, 0.6468399, 1.792862, 0, 0, 0, 1, 1,
-1.600036, 0.4674048, -1.227159, 0, 0, 0, 1, 1,
-1.589244, 0.3371621, -0.4704669, 0, 0, 0, 1, 1,
-1.587236, 0.7563261, 0.3151128, 0, 0, 0, 1, 1,
-1.579243, 1.516351, -0.276954, 0, 0, 0, 1, 1,
-1.565032, -0.2794972, -1.032026, 1, 1, 1, 1, 1,
-1.561407, 0.7665104, 0.6691837, 1, 1, 1, 1, 1,
-1.559997, -0.9517292, -0.007340188, 1, 1, 1, 1, 1,
-1.54958, -0.1455467, -1.178867, 1, 1, 1, 1, 1,
-1.546352, -0.3679954, -0.4050473, 1, 1, 1, 1, 1,
-1.546099, 1.618889, -0.6727157, 1, 1, 1, 1, 1,
-1.542587, 0.08636966, -1.029213, 1, 1, 1, 1, 1,
-1.539337, -1.518127, -1.548836, 1, 1, 1, 1, 1,
-1.537832, 0.1957157, -1.454908, 1, 1, 1, 1, 1,
-1.536095, 0.3587697, -1.374951, 1, 1, 1, 1, 1,
-1.529059, -0.3674631, -0.8126734, 1, 1, 1, 1, 1,
-1.526854, 0.5800451, -0.2973035, 1, 1, 1, 1, 1,
-1.526018, 0.7749395, -0.4148537, 1, 1, 1, 1, 1,
-1.51961, -0.3250305, -1.266313, 1, 1, 1, 1, 1,
-1.515148, -2.226237, -2.561086, 1, 1, 1, 1, 1,
-1.514878, -1.791566, -2.328118, 0, 0, 1, 1, 1,
-1.508504, -0.1674841, -2.00199, 1, 0, 0, 1, 1,
-1.497955, -0.1504017, -1.294355, 1, 0, 0, 1, 1,
-1.495746, 1.444625, -0.7787965, 1, 0, 0, 1, 1,
-1.474931, -0.5592051, -1.553682, 1, 0, 0, 1, 1,
-1.474548, 1.278423, -2.645575, 1, 0, 0, 1, 1,
-1.460833, -1.625439, -1.640949, 0, 0, 0, 1, 1,
-1.449163, -0.1521084, -1.591247, 0, 0, 0, 1, 1,
-1.447881, 0.3405702, 0.2249564, 0, 0, 0, 1, 1,
-1.444905, -1.976561, -2.988937, 0, 0, 0, 1, 1,
-1.435711, -0.4016747, -1.514843, 0, 0, 0, 1, 1,
-1.431703, 0.2561893, -1.392305, 0, 0, 0, 1, 1,
-1.426932, 0.1879195, -1.671517, 0, 0, 0, 1, 1,
-1.418047, 0.5622446, -2.373391, 1, 1, 1, 1, 1,
-1.398676, -0.512592, -2.531379, 1, 1, 1, 1, 1,
-1.389114, 1.825155, -1.190223, 1, 1, 1, 1, 1,
-1.386488, -2.725586, -2.449437, 1, 1, 1, 1, 1,
-1.380986, 1.277222, -0.7851634, 1, 1, 1, 1, 1,
-1.374137, -0.9179979, -2.744154, 1, 1, 1, 1, 1,
-1.360842, -0.1926926, -2.741949, 1, 1, 1, 1, 1,
-1.357992, 0.3402549, -1.636362, 1, 1, 1, 1, 1,
-1.354083, 0.2625845, -2.301077, 1, 1, 1, 1, 1,
-1.3507, -0.8330182, -2.511271, 1, 1, 1, 1, 1,
-1.346213, 0.2674381, -1.841728, 1, 1, 1, 1, 1,
-1.336773, -0.2912086, -1.824756, 1, 1, 1, 1, 1,
-1.333844, -0.546919, -2.936379, 1, 1, 1, 1, 1,
-1.32957, -0.5386849, -0.7787559, 1, 1, 1, 1, 1,
-1.317593, -0.7799507, -1.599883, 1, 1, 1, 1, 1,
-1.30102, -0.02277553, -2.583482, 0, 0, 1, 1, 1,
-1.271426, -0.2675713, -2.527016, 1, 0, 0, 1, 1,
-1.267106, 1.556862, -0.8940387, 1, 0, 0, 1, 1,
-1.262043, -2.526287, -3.059178, 1, 0, 0, 1, 1,
-1.244322, -0.07573295, -1.565728, 1, 0, 0, 1, 1,
-1.236703, -0.1449041, -1.075078, 1, 0, 0, 1, 1,
-1.22518, -0.7215707, -1.8786, 0, 0, 0, 1, 1,
-1.224432, -0.03291827, -0.7787122, 0, 0, 0, 1, 1,
-1.215116, -0.7299576, -3.124003, 0, 0, 0, 1, 1,
-1.20855, 1.435727, -1.22761, 0, 0, 0, 1, 1,
-1.203193, -0.7846567, -3.452675, 0, 0, 0, 1, 1,
-1.201218, 0.4846283, 0.4772955, 0, 0, 0, 1, 1,
-1.19572, 1.939059, -0.9562543, 0, 0, 0, 1, 1,
-1.19244, -0.7484544, -0.703462, 1, 1, 1, 1, 1,
-1.190198, 1.831354, -1.915159, 1, 1, 1, 1, 1,
-1.178629, 0.3072215, -1.576289, 1, 1, 1, 1, 1,
-1.174545, -0.4748026, -2.515774, 1, 1, 1, 1, 1,
-1.167909, 0.1412719, -0.5355721, 1, 1, 1, 1, 1,
-1.165222, 0.4488162, -1.968337, 1, 1, 1, 1, 1,
-1.161489, 0.453548, -0.7887145, 1, 1, 1, 1, 1,
-1.149742, 0.2984655, -0.3554611, 1, 1, 1, 1, 1,
-1.145345, 0.01569535, -1.621757, 1, 1, 1, 1, 1,
-1.139461, 0.02484076, -1.192055, 1, 1, 1, 1, 1,
-1.139032, 0.6214442, -2.319053, 1, 1, 1, 1, 1,
-1.133514, 1.582594, 0.7533424, 1, 1, 1, 1, 1,
-1.127404, 0.3471941, -0.07351125, 1, 1, 1, 1, 1,
-1.127068, 1.406937, -0.6497628, 1, 1, 1, 1, 1,
-1.121642, 0.2764139, -0.7443287, 1, 1, 1, 1, 1,
-1.119487, -1.141818, -1.287961, 0, 0, 1, 1, 1,
-1.115861, 0.5307438, -0.2866879, 1, 0, 0, 1, 1,
-1.114145, 1.663635, 1.515259, 1, 0, 0, 1, 1,
-1.109415, 0.9096617, 1.409276, 1, 0, 0, 1, 1,
-1.099361, 0.9021876, -0.8771795, 1, 0, 0, 1, 1,
-1.091362, 0.1994895, -1.787382, 1, 0, 0, 1, 1,
-1.089774, 1.252904, -2.325172, 0, 0, 0, 1, 1,
-1.085219, 0.5383469, -0.8394679, 0, 0, 0, 1, 1,
-1.079884, 0.04970097, -1.196598, 0, 0, 0, 1, 1,
-1.078889, 1.21624, 0.4539025, 0, 0, 0, 1, 1,
-1.071762, 0.5419055, -0.8137062, 0, 0, 0, 1, 1,
-1.064461, -1.021537, -2.01811, 0, 0, 0, 1, 1,
-1.038214, 1.246449, -0.619333, 0, 0, 0, 1, 1,
-1.037245, -0.03521044, -2.507739, 1, 1, 1, 1, 1,
-1.035298, 1.206108, -0.8642825, 1, 1, 1, 1, 1,
-1.029254, 0.2248472, -2.753417, 1, 1, 1, 1, 1,
-1.027759, 0.9630868, -0.51525, 1, 1, 1, 1, 1,
-1.027752, -0.125916, -1.917418, 1, 1, 1, 1, 1,
-1.026313, -0.2114645, -1.194843, 1, 1, 1, 1, 1,
-1.009437, 0.007255137, -0.9576958, 1, 1, 1, 1, 1,
-1.007666, -1.620278, -4.169054, 1, 1, 1, 1, 1,
-1.007486, -0.7353712, -3.672781, 1, 1, 1, 1, 1,
-1.006225, 1.8421, -2.001813, 1, 1, 1, 1, 1,
-0.9999477, 0.1689813, -1.449294, 1, 1, 1, 1, 1,
-0.9986561, 1.276577, 0.9112299, 1, 1, 1, 1, 1,
-0.99471, 0.3838114, -2.546428, 1, 1, 1, 1, 1,
-0.9945942, -1.290521, -2.066247, 1, 1, 1, 1, 1,
-0.9898888, -0.8383243, -3.220542, 1, 1, 1, 1, 1,
-0.978182, 1.787509, 1.006441, 0, 0, 1, 1, 1,
-0.9771792, -1.210205, -1.635919, 1, 0, 0, 1, 1,
-0.9728515, 0.2058652, -2.882094, 1, 0, 0, 1, 1,
-0.9700429, 0.2838347, -0.8916999, 1, 0, 0, 1, 1,
-0.9669359, -0.06086092, -2.189731, 1, 0, 0, 1, 1,
-0.9651255, -1.261402, -3.617893, 1, 0, 0, 1, 1,
-0.9626102, -1.400776, -2.812971, 0, 0, 0, 1, 1,
-0.9588253, 1.133561, -0.2621567, 0, 0, 0, 1, 1,
-0.9584675, -0.06724647, -3.19621, 0, 0, 0, 1, 1,
-0.9555333, -0.789983, -2.912083, 0, 0, 0, 1, 1,
-0.9490888, 0.6561126, -1.367229, 0, 0, 0, 1, 1,
-0.9478735, 0.4878365, -1.660141, 0, 0, 0, 1, 1,
-0.9407364, -0.01948313, -3.179516, 0, 0, 0, 1, 1,
-0.939527, -0.8041195, -4.970006, 1, 1, 1, 1, 1,
-0.9340102, -0.7626644, -3.4433, 1, 1, 1, 1, 1,
-0.9203841, 2.36912, -0.1452858, 1, 1, 1, 1, 1,
-0.9196778, 0.2682613, -0.5180512, 1, 1, 1, 1, 1,
-0.9150189, -1.105842, -1.823616, 1, 1, 1, 1, 1,
-0.9142789, 0.4457711, -1.084131, 1, 1, 1, 1, 1,
-0.913554, 1.096861, -0.5341802, 1, 1, 1, 1, 1,
-0.9085851, 0.947625, -2.38638, 1, 1, 1, 1, 1,
-0.8972712, 0.5898526, -1.728609, 1, 1, 1, 1, 1,
-0.8884481, -1.291703, -2.749688, 1, 1, 1, 1, 1,
-0.8800746, 0.5678564, 0.5408685, 1, 1, 1, 1, 1,
-0.8792277, 0.3604895, -0.1378038, 1, 1, 1, 1, 1,
-0.8739107, -0.2990533, -0.6066484, 1, 1, 1, 1, 1,
-0.8664558, 0.3762911, -1.68357, 1, 1, 1, 1, 1,
-0.8650596, -0.3299275, -1.731806, 1, 1, 1, 1, 1,
-0.8647708, 0.02024197, -1.928621, 0, 0, 1, 1, 1,
-0.8617205, 0.07132375, -2.023036, 1, 0, 0, 1, 1,
-0.8611098, 0.1189068, -2.454741, 1, 0, 0, 1, 1,
-0.8606323, -0.9071079, -1.708874, 1, 0, 0, 1, 1,
-0.8578357, -0.08023018, -0.2015973, 1, 0, 0, 1, 1,
-0.8559971, -0.09026759, -0.0812799, 1, 0, 0, 1, 1,
-0.8537573, -0.0296313, -1.357075, 0, 0, 0, 1, 1,
-0.8476149, -0.6393701, -1.55371, 0, 0, 0, 1, 1,
-0.8471992, -1.346093, -3.109089, 0, 0, 0, 1, 1,
-0.8450663, 0.1099425, -0.6235363, 0, 0, 0, 1, 1,
-0.8440529, -2.203359, -3.532484, 0, 0, 0, 1, 1,
-0.8430771, -1.357382, -5.621776, 0, 0, 0, 1, 1,
-0.8316662, -0.8315072, -3.331562, 0, 0, 0, 1, 1,
-0.8306857, -0.8293185, -2.409213, 1, 1, 1, 1, 1,
-0.8212036, -1.524796, -2.962911, 1, 1, 1, 1, 1,
-0.8198025, -0.260964, -1.251325, 1, 1, 1, 1, 1,
-0.8078752, -0.5789932, -2.089831, 1, 1, 1, 1, 1,
-0.8061854, -1.510297, -2.612934, 1, 1, 1, 1, 1,
-0.8026507, -0.7224283, -3.819789, 1, 1, 1, 1, 1,
-0.7992029, -2.123988, -2.973331, 1, 1, 1, 1, 1,
-0.7935719, -1.028794, -1.691522, 1, 1, 1, 1, 1,
-0.7921406, -2.219074, -3.154186, 1, 1, 1, 1, 1,
-0.7820351, -1.491173, -3.964252, 1, 1, 1, 1, 1,
-0.7807077, 0.7808889, -0.7741342, 1, 1, 1, 1, 1,
-0.7771759, -0.5341384, -1.704734, 1, 1, 1, 1, 1,
-0.7690024, -1.322898, -3.657285, 1, 1, 1, 1, 1,
-0.7661057, -0.7706046, -1.906366, 1, 1, 1, 1, 1,
-0.7646973, 0.7472524, -1.791322, 1, 1, 1, 1, 1,
-0.7601114, 0.2473684, 0.3136446, 0, 0, 1, 1, 1,
-0.7274763, 0.02859189, -1.393255, 1, 0, 0, 1, 1,
-0.7261049, -0.2006511, -0.6499777, 1, 0, 0, 1, 1,
-0.7258758, -1.250084, -1.803776, 1, 0, 0, 1, 1,
-0.7164785, 0.3995123, -0.7114881, 1, 0, 0, 1, 1,
-0.7162351, -0.5967926, -3.899284, 1, 0, 0, 1, 1,
-0.7137306, -0.9313682, -2.195876, 0, 0, 0, 1, 1,
-0.7022097, -0.7772852, -3.80716, 0, 0, 0, 1, 1,
-0.7014316, -0.3613111, -3.485516, 0, 0, 0, 1, 1,
-0.7001017, 0.7650323, -0.9690676, 0, 0, 0, 1, 1,
-0.6988847, -1.924071, -2.537206, 0, 0, 0, 1, 1,
-0.6975078, 0.5740372, -0.8066123, 0, 0, 0, 1, 1,
-0.694409, -1.886583, -3.093892, 0, 0, 0, 1, 1,
-0.6918235, 0.8064681, 1.491679, 1, 1, 1, 1, 1,
-0.6908112, 0.6936228, -1.598692, 1, 1, 1, 1, 1,
-0.6899081, 0.8660678, -1.690795, 1, 1, 1, 1, 1,
-0.6835151, 0.8317201, -1.361353, 1, 1, 1, 1, 1,
-0.6736967, -0.9609921, -2.896708, 1, 1, 1, 1, 1,
-0.6722083, 0.5871108, -1.126004, 1, 1, 1, 1, 1,
-0.6721872, 1.563748, 0.7072979, 1, 1, 1, 1, 1,
-0.6673916, 0.9989488, 0.1207676, 1, 1, 1, 1, 1,
-0.6667442, 0.4364302, -0.4337345, 1, 1, 1, 1, 1,
-0.6665322, -1.224854, -2.78585, 1, 1, 1, 1, 1,
-0.65873, -1.317659, -2.882261, 1, 1, 1, 1, 1,
-0.6559297, 0.7122441, -1.204724, 1, 1, 1, 1, 1,
-0.6510711, -0.4449017, -2.54289, 1, 1, 1, 1, 1,
-0.6507524, -1.071854, -2.043432, 1, 1, 1, 1, 1,
-0.6429666, 0.792482, -0.6801473, 1, 1, 1, 1, 1,
-0.6426687, 0.6278096, -1.164528, 0, 0, 1, 1, 1,
-0.6416209, 1.218817, -0.9070434, 1, 0, 0, 1, 1,
-0.6414871, -0.7494257, -2.837641, 1, 0, 0, 1, 1,
-0.6412342, -0.7095741, -3.020947, 1, 0, 0, 1, 1,
-0.64046, -0.9746021, -3.222349, 1, 0, 0, 1, 1,
-0.6382707, -0.5080164, -3.825526, 1, 0, 0, 1, 1,
-0.6215993, 2.029039, -1.440805, 0, 0, 0, 1, 1,
-0.619018, -1.178099, -2.65425, 0, 0, 0, 1, 1,
-0.6189838, -0.5021555, -2.036752, 0, 0, 0, 1, 1,
-0.6184626, 0.9631093, -1.427488, 0, 0, 0, 1, 1,
-0.6161089, -0.3628572, -2.943072, 0, 0, 0, 1, 1,
-0.6149291, 1.537861, -1.38596, 0, 0, 0, 1, 1,
-0.6138934, 1.848445, -1.116751, 0, 0, 0, 1, 1,
-0.6129312, -0.473206, -2.867819, 1, 1, 1, 1, 1,
-0.6128055, 0.07517149, -2.156655, 1, 1, 1, 1, 1,
-0.6109809, 0.7055133, -1.574901, 1, 1, 1, 1, 1,
-0.6092925, -0.6409752, -1.293983, 1, 1, 1, 1, 1,
-0.5999233, -0.6553923, -1.706863, 1, 1, 1, 1, 1,
-0.5979162, -1.018977, -3.710242, 1, 1, 1, 1, 1,
-0.597859, -0.1521232, -0.8881276, 1, 1, 1, 1, 1,
-0.5935978, -0.9093283, -0.7272244, 1, 1, 1, 1, 1,
-0.5925443, -0.5540599, -4.129706, 1, 1, 1, 1, 1,
-0.5914564, -0.4289401, -1.614152, 1, 1, 1, 1, 1,
-0.5866572, 0.4028292, -1.076388, 1, 1, 1, 1, 1,
-0.5857366, 0.4803057, -0.59839, 1, 1, 1, 1, 1,
-0.5842205, -0.5237059, -2.701324, 1, 1, 1, 1, 1,
-0.5810816, -0.7151736, -2.940693, 1, 1, 1, 1, 1,
-0.5781705, -1.220077, -1.347707, 1, 1, 1, 1, 1,
-0.5764009, 1.009499, -0.4464349, 0, 0, 1, 1, 1,
-0.5702789, -1.234238, -3.759735, 1, 0, 0, 1, 1,
-0.5632972, -1.74667, -2.298207, 1, 0, 0, 1, 1,
-0.5554628, 0.3807322, -1.053287, 1, 0, 0, 1, 1,
-0.5541319, 0.5891223, -0.6326795, 1, 0, 0, 1, 1,
-0.5537754, 0.1334039, -0.3644259, 1, 0, 0, 1, 1,
-0.5528371, -1.161018, -1.095159, 0, 0, 0, 1, 1,
-0.5453089, 0.2533651, -0.8239622, 0, 0, 0, 1, 1,
-0.5448812, 0.7459476, -1.237989, 0, 0, 0, 1, 1,
-0.5413597, -0.9907406, -3.236264, 0, 0, 0, 1, 1,
-0.5402856, 0.8798196, -0.5667939, 0, 0, 0, 1, 1,
-0.5300665, 0.7447453, 0.467566, 0, 0, 0, 1, 1,
-0.5275925, -0.57765, -3.58314, 0, 0, 0, 1, 1,
-0.5209557, 1.087469, 0.2114794, 1, 1, 1, 1, 1,
-0.5207281, 0.6771893, -0.7277195, 1, 1, 1, 1, 1,
-0.5197664, 1.525451, -0.9955547, 1, 1, 1, 1, 1,
-0.5180335, -0.8540547, -1.754491, 1, 1, 1, 1, 1,
-0.5173789, 0.7452341, -0.6468453, 1, 1, 1, 1, 1,
-0.5133123, 0.6197011, -1.514309, 1, 1, 1, 1, 1,
-0.5130564, -0.9330252, -4.231721, 1, 1, 1, 1, 1,
-0.5098472, -0.1163946, -1.349398, 1, 1, 1, 1, 1,
-0.5007237, -0.5578943, -1.92356, 1, 1, 1, 1, 1,
-0.5005767, -0.6403396, -1.918164, 1, 1, 1, 1, 1,
-0.4966653, -1.15185, -0.119813, 1, 1, 1, 1, 1,
-0.4957569, -1.385452, -5.713573, 1, 1, 1, 1, 1,
-0.4953175, -0.9873532, 0.03820343, 1, 1, 1, 1, 1,
-0.4941111, -0.5064467, -3.145999, 1, 1, 1, 1, 1,
-0.492258, 0.2782174, -0.6836985, 1, 1, 1, 1, 1,
-0.491582, 0.5393167, 0.7268729, 0, 0, 1, 1, 1,
-0.4914415, 0.4434618, 1.102352, 1, 0, 0, 1, 1,
-0.4891224, -1.460217, -2.986598, 1, 0, 0, 1, 1,
-0.488872, -0.5510071, -1.87316, 1, 0, 0, 1, 1,
-0.4827802, 0.410827, -0.9616426, 1, 0, 0, 1, 1,
-0.4816864, 1.012374, 1.494957, 1, 0, 0, 1, 1,
-0.4799927, 0.5127077, -1.462948, 0, 0, 0, 1, 1,
-0.4768717, 0.3256162, -1.655404, 0, 0, 0, 1, 1,
-0.4686697, 0.2446674, -0.7161911, 0, 0, 0, 1, 1,
-0.4658008, 0.7820953, -0.3314378, 0, 0, 0, 1, 1,
-0.4614509, 1.213704, -0.7001937, 0, 0, 0, 1, 1,
-0.4575286, -0.4812004, -3.241596, 0, 0, 0, 1, 1,
-0.4553013, 1.943728, -2.282342, 0, 0, 0, 1, 1,
-0.455209, 1.222123, 1.475258, 1, 1, 1, 1, 1,
-0.4472042, 0.399574, -1.095576, 1, 1, 1, 1, 1,
-0.4452744, -0.9217817, -3.49737, 1, 1, 1, 1, 1,
-0.4439135, 1.402496, -0.4543595, 1, 1, 1, 1, 1,
-0.4353924, -0.4135462, -1.823263, 1, 1, 1, 1, 1,
-0.426119, 1.02184, -1.372811, 1, 1, 1, 1, 1,
-0.4241491, 0.1560759, -2.079267, 1, 1, 1, 1, 1,
-0.4226372, -1.251515, -3.308862, 1, 1, 1, 1, 1,
-0.4201476, 1.119139, -0.7568099, 1, 1, 1, 1, 1,
-0.4197758, 1.409331, -0.06856293, 1, 1, 1, 1, 1,
-0.4157609, 0.2534901, -0.7775147, 1, 1, 1, 1, 1,
-0.4136874, -0.01744199, -3.134137, 1, 1, 1, 1, 1,
-0.4126467, -0.294685, -3.719378, 1, 1, 1, 1, 1,
-0.4121275, 1.39441, 0.3627337, 1, 1, 1, 1, 1,
-0.405243, -0.8559212, -2.314234, 1, 1, 1, 1, 1,
-0.4035316, 0.2617414, 0.1726131, 0, 0, 1, 1, 1,
-0.4024153, 1.283842, -2.069659, 1, 0, 0, 1, 1,
-0.400578, -1.221205, -4.237767, 1, 0, 0, 1, 1,
-0.3976776, 1.665591, -0.6150144, 1, 0, 0, 1, 1,
-0.3965925, 0.5238633, -1.847644, 1, 0, 0, 1, 1,
-0.3947052, 1.434482, -0.8511769, 1, 0, 0, 1, 1,
-0.3938654, -0.5018044, -1.052902, 0, 0, 0, 1, 1,
-0.3936813, 2.16998, -0.6959206, 0, 0, 0, 1, 1,
-0.3898991, 1.092973, 0.2322758, 0, 0, 0, 1, 1,
-0.3840533, -0.3159713, -1.71434, 0, 0, 0, 1, 1,
-0.3825832, -2.492894, -3.691883, 0, 0, 0, 1, 1,
-0.3818246, 0.1234433, -0.8809072, 0, 0, 0, 1, 1,
-0.3802252, 0.9571248, 0.06652162, 0, 0, 0, 1, 1,
-0.376887, -0.1245876, -2.519106, 1, 1, 1, 1, 1,
-0.3734104, -0.4222366, -0.36273, 1, 1, 1, 1, 1,
-0.3678265, 0.3255672, -0.09050129, 1, 1, 1, 1, 1,
-0.3630458, 0.08796209, -1.320958, 1, 1, 1, 1, 1,
-0.3603426, 0.5081962, 0.9411284, 1, 1, 1, 1, 1,
-0.3580345, 1.419424, -1.479216, 1, 1, 1, 1, 1,
-0.3463809, 0.04451928, -4.013184, 1, 1, 1, 1, 1,
-0.3452357, 1.918557, -1.955124, 1, 1, 1, 1, 1,
-0.3439307, -0.1423932, -0.03162919, 1, 1, 1, 1, 1,
-0.342748, -0.1587861, -4.696784, 1, 1, 1, 1, 1,
-0.3398974, 0.3797398, -1.607257, 1, 1, 1, 1, 1,
-0.3384755, 0.9450395, -0.6781867, 1, 1, 1, 1, 1,
-0.3342218, 0.8855323, -0.4957336, 1, 1, 1, 1, 1,
-0.3311443, 0.8367292, -1.496765, 1, 1, 1, 1, 1,
-0.3298421, 0.5982861, 1.674643, 1, 1, 1, 1, 1,
-0.3223942, 2.532951, -0.4144371, 0, 0, 1, 1, 1,
-0.3138829, -1.114627, -1.140796, 1, 0, 0, 1, 1,
-0.3127391, 0.6283264, 1.005172, 1, 0, 0, 1, 1,
-0.3125965, 0.254114, -1.276981, 1, 0, 0, 1, 1,
-0.3082524, -0.8106679, -2.072089, 1, 0, 0, 1, 1,
-0.3065473, 0.09393705, -1.24331, 1, 0, 0, 1, 1,
-0.3063603, 1.299385, -1.465409, 0, 0, 0, 1, 1,
-0.3015036, -0.1937957, -3.495718, 0, 0, 0, 1, 1,
-0.2991963, 0.9585207, -1.223176, 0, 0, 0, 1, 1,
-0.2976618, -0.3053403, -1.815459, 0, 0, 0, 1, 1,
-0.2964944, 0.8503841, 1.852811, 0, 0, 0, 1, 1,
-0.295751, -2.859334, -3.723513, 0, 0, 0, 1, 1,
-0.2941278, -1.04659, -3.05357, 0, 0, 0, 1, 1,
-0.2926722, 0.6472655, 0.6418671, 1, 1, 1, 1, 1,
-0.2891947, 0.3283011, -0.616834, 1, 1, 1, 1, 1,
-0.2882886, -0.5751975, -2.504715, 1, 1, 1, 1, 1,
-0.2882528, 1.313551, -0.1061753, 1, 1, 1, 1, 1,
-0.2842801, -0.8299124, -3.686445, 1, 1, 1, 1, 1,
-0.2783531, 0.1829344, -1.431425, 1, 1, 1, 1, 1,
-0.2773815, 0.05502913, -1.54375, 1, 1, 1, 1, 1,
-0.2771361, -1.447311, -2.560675, 1, 1, 1, 1, 1,
-0.2769048, 2.087545, -0.3258122, 1, 1, 1, 1, 1,
-0.2719566, -1.453718, -4.932264, 1, 1, 1, 1, 1,
-0.2717918, -0.2233541, -2.669822, 1, 1, 1, 1, 1,
-0.2708227, -0.9207383, -5.006467, 1, 1, 1, 1, 1,
-0.270536, 0.5279006, 1.170069, 1, 1, 1, 1, 1,
-0.2676245, 0.05217551, -3.338154, 1, 1, 1, 1, 1,
-0.26705, -1.633118, -2.698084, 1, 1, 1, 1, 1,
-0.2669107, -0.8468706, -3.089885, 0, 0, 1, 1, 1,
-0.2663416, -1.826272, -3.302126, 1, 0, 0, 1, 1,
-0.2632031, 0.1825257, 0.4748861, 1, 0, 0, 1, 1,
-0.2625275, 0.7908406, -1.029494, 1, 0, 0, 1, 1,
-0.2607532, -0.642275, -1.781254, 1, 0, 0, 1, 1,
-0.2605421, 0.9349378, -0.429914, 1, 0, 0, 1, 1,
-0.2561286, -0.7917524, -4.299589, 0, 0, 0, 1, 1,
-0.2539059, 0.4354926, 1.547483, 0, 0, 0, 1, 1,
-0.2508073, 0.1153031, -1.317341, 0, 0, 0, 1, 1,
-0.2482417, -0.2330197, -1.65764, 0, 0, 0, 1, 1,
-0.2459156, 0.07777529, -2.129147, 0, 0, 0, 1, 1,
-0.2427381, -0.3851075, -4.359692, 0, 0, 0, 1, 1,
-0.2413801, -1.676341, -3.010146, 0, 0, 0, 1, 1,
-0.240146, 0.1985641, -0.4296857, 1, 1, 1, 1, 1,
-0.234811, 1.00136, 1.021508, 1, 1, 1, 1, 1,
-0.2290633, -0.561887, -3.723831, 1, 1, 1, 1, 1,
-0.2251853, -0.7455446, -3.142856, 1, 1, 1, 1, 1,
-0.2185314, -0.3037774, -1.266673, 1, 1, 1, 1, 1,
-0.215713, 0.9087315, 1.669877, 1, 1, 1, 1, 1,
-0.2149372, -0.4864313, -1.32067, 1, 1, 1, 1, 1,
-0.2143242, -1.430077, -4.042026, 1, 1, 1, 1, 1,
-0.2118766, 0.6473158, -2.134226, 1, 1, 1, 1, 1,
-0.2093862, -0.7409058, -3.181146, 1, 1, 1, 1, 1,
-0.2074567, -1.389712, -4.616032, 1, 1, 1, 1, 1,
-0.2073162, -1.23205, -2.872603, 1, 1, 1, 1, 1,
-0.2035043, 0.1678553, -0.1947116, 1, 1, 1, 1, 1,
-0.200711, -1.002277, -2.689974, 1, 1, 1, 1, 1,
-0.1920665, -0.8819556, -4.406653, 1, 1, 1, 1, 1,
-0.1868997, -0.1851899, -0.3636986, 0, 0, 1, 1, 1,
-0.1867778, 1.279302, 0.2298492, 1, 0, 0, 1, 1,
-0.1800457, 0.1901406, 0.4791622, 1, 0, 0, 1, 1,
-0.1774654, 0.1113652, -0.8225356, 1, 0, 0, 1, 1,
-0.1738586, 0.8362089, -0.6048663, 1, 0, 0, 1, 1,
-0.165195, 1.468998, -0.2211849, 1, 0, 0, 1, 1,
-0.1638195, 0.05875085, 0.1906845, 0, 0, 0, 1, 1,
-0.1621509, -0.1917998, -4.338558, 0, 0, 0, 1, 1,
-0.1612019, 0.7622731, -1.560373, 0, 0, 0, 1, 1,
-0.1561288, -0.1355695, -2.251185, 0, 0, 0, 1, 1,
-0.1549871, 0.7910288, 0.8163068, 0, 0, 0, 1, 1,
-0.1548947, -0.6247486, -3.535214, 0, 0, 0, 1, 1,
-0.1533474, 0.8013294, -0.6257303, 0, 0, 0, 1, 1,
-0.1504771, 1.363132, 0.2537371, 1, 1, 1, 1, 1,
-0.1492283, -0.328194, -1.571574, 1, 1, 1, 1, 1,
-0.1480728, -0.1333036, -2.811806, 1, 1, 1, 1, 1,
-0.1465229, 1.325004, -0.8301279, 1, 1, 1, 1, 1,
-0.1448216, 1.617686, 0.5744148, 1, 1, 1, 1, 1,
-0.1442042, -0.1158556, -0.6942278, 1, 1, 1, 1, 1,
-0.1436317, -0.118011, -1.375831, 1, 1, 1, 1, 1,
-0.1400944, 0.4511986, -1.164083, 1, 1, 1, 1, 1,
-0.1388092, 0.07633447, -1.396851, 1, 1, 1, 1, 1,
-0.1379285, 1.465225, 0.3366368, 1, 1, 1, 1, 1,
-0.1372363, 0.9416376, -0.98561, 1, 1, 1, 1, 1,
-0.1350093, 1.490576, 1.016121, 1, 1, 1, 1, 1,
-0.1332483, 0.1672082, -0.826535, 1, 1, 1, 1, 1,
-0.1259941, -0.09491653, -0.6786291, 1, 1, 1, 1, 1,
-0.1236233, -1.179393, -1.851608, 1, 1, 1, 1, 1,
-0.1216792, -0.8289293, -2.861334, 0, 0, 1, 1, 1,
-0.1161619, 0.5865224, -2.012247, 1, 0, 0, 1, 1,
-0.1161347, -0.8731874, -5.838073, 1, 0, 0, 1, 1,
-0.1160352, 0.02962644, -1.013752, 1, 0, 0, 1, 1,
-0.1141436, -0.5977848, -2.321656, 1, 0, 0, 1, 1,
-0.1137456, 1.053227, -1.447735, 1, 0, 0, 1, 1,
-0.1120973, -0.3808841, -4.649184, 0, 0, 0, 1, 1,
-0.1045252, -1.702559, -2.506775, 0, 0, 0, 1, 1,
-0.1039923, -0.08152147, -1.867008, 0, 0, 0, 1, 1,
-0.1009979, -1.429982, -1.397718, 0, 0, 0, 1, 1,
-0.09307018, 0.4648693, -0.4924832, 0, 0, 0, 1, 1,
-0.08967327, 0.4429693, 1.558951, 0, 0, 0, 1, 1,
-0.08835827, 0.2565562, 1.064923, 0, 0, 0, 1, 1,
-0.0872077, -0.3261827, -3.573031, 1, 1, 1, 1, 1,
-0.07750158, 0.7598004, -1.129335, 1, 1, 1, 1, 1,
-0.07337847, -0.06353264, -1.114329, 1, 1, 1, 1, 1,
-0.07269181, -0.927995, -1.952185, 1, 1, 1, 1, 1,
-0.07121179, 1.264044, -1.241035, 1, 1, 1, 1, 1,
-0.06849626, -0.3316151, -3.666346, 1, 1, 1, 1, 1,
-0.06356496, 0.2783614, -0.7824866, 1, 1, 1, 1, 1,
-0.06004541, 0.9816252, -0.1151247, 1, 1, 1, 1, 1,
-0.05980515, -1.415016, -3.686445, 1, 1, 1, 1, 1,
-0.05932312, 1.020604, 0.02715894, 1, 1, 1, 1, 1,
-0.05856368, 0.6150432, 0.4016899, 1, 1, 1, 1, 1,
-0.05643776, -0.5790743, -1.782485, 1, 1, 1, 1, 1,
-0.05468026, -0.7617583, -3.668517, 1, 1, 1, 1, 1,
-0.05368137, -0.6744764, -4.392203, 1, 1, 1, 1, 1,
-0.04967976, 0.1140163, -0.9258968, 1, 1, 1, 1, 1,
-0.04499928, 0.7968377, -0.4584668, 0, 0, 1, 1, 1,
-0.04493517, -1.021441, -0.9486542, 1, 0, 0, 1, 1,
-0.04414943, 1.005234, 0.2627079, 1, 0, 0, 1, 1,
-0.04170762, 0.1243612, 0.09188578, 1, 0, 0, 1, 1,
-0.04164003, 0.8800891, 1.275718, 1, 0, 0, 1, 1,
-0.03892765, -0.3403196, -2.502004, 1, 0, 0, 1, 1,
-0.03326825, 0.9871208, -0.2846548, 0, 0, 0, 1, 1,
-0.02844648, 0.6320363, 0.06647694, 0, 0, 0, 1, 1,
-0.02834912, -0.2098024, -2.571825, 0, 0, 0, 1, 1,
-0.02678766, 0.1591983, -0.4840267, 0, 0, 0, 1, 1,
-0.02566285, -0.6148857, -1.494037, 0, 0, 0, 1, 1,
-0.0192904, 1.821796, -1.465093, 0, 0, 0, 1, 1,
-0.01665089, 1.293047, 0.1210344, 0, 0, 0, 1, 1,
-0.01601093, -1.19114, -1.599129, 1, 1, 1, 1, 1,
-0.001188675, -1.214828, -4.028139, 1, 1, 1, 1, 1,
0.001298442, 2.137974, 0.7036061, 1, 1, 1, 1, 1,
0.00393151, 0.8948925, -0.09042121, 1, 1, 1, 1, 1,
0.007629535, -0.7966921, 2.429526, 1, 1, 1, 1, 1,
0.009257902, 0.7910789, -0.2978357, 1, 1, 1, 1, 1,
0.01025831, -0.8397012, 1.613943, 1, 1, 1, 1, 1,
0.01437669, 1.984155, 0.3672223, 1, 1, 1, 1, 1,
0.01981561, 1.487684, -0.4238398, 1, 1, 1, 1, 1,
0.02306549, -1.737667, 3.520826, 1, 1, 1, 1, 1,
0.02540505, -0.1419632, 4.951929, 1, 1, 1, 1, 1,
0.02568899, 1.004361, 0.5618741, 1, 1, 1, 1, 1,
0.02578389, -0.9425359, 4.726181, 1, 1, 1, 1, 1,
0.02646244, 1.386857, 0.2410017, 1, 1, 1, 1, 1,
0.02715103, -1.521327, 3.19127, 1, 1, 1, 1, 1,
0.02963815, -0.9993599, 3.864213, 0, 0, 1, 1, 1,
0.03358692, -0.0364209, 3.278836, 1, 0, 0, 1, 1,
0.03732087, -0.3863942, 2.755028, 1, 0, 0, 1, 1,
0.03801939, 0.713071, 0.3659783, 1, 0, 0, 1, 1,
0.04050095, 2.23519, -1.054624, 1, 0, 0, 1, 1,
0.0424558, -0.4444758, 3.409431, 1, 0, 0, 1, 1,
0.04952938, -2.729094, 3.18696, 0, 0, 0, 1, 1,
0.05353665, -0.7836502, 4.334951, 0, 0, 0, 1, 1,
0.05376169, 0.2450164, 2.92217, 0, 0, 0, 1, 1,
0.05567102, 0.01794943, 0.6343975, 0, 0, 0, 1, 1,
0.05743908, 0.4583292, 1.782452, 0, 0, 0, 1, 1,
0.06307632, 0.1371315, -0.4588662, 0, 0, 0, 1, 1,
0.06555744, 0.8816603, -0.7171479, 0, 0, 0, 1, 1,
0.06997084, 0.01277165, 0.4166205, 1, 1, 1, 1, 1,
0.07006634, -1.170088, 1.239537, 1, 1, 1, 1, 1,
0.0785765, 0.2810554, -0.6356527, 1, 1, 1, 1, 1,
0.07953028, -0.4655515, 1.835628, 1, 1, 1, 1, 1,
0.08250791, 0.6153165, 0.6291899, 1, 1, 1, 1, 1,
0.08297212, 1.031183, 1.937545, 1, 1, 1, 1, 1,
0.08581544, -0.5909774, 3.260856, 1, 1, 1, 1, 1,
0.09218004, 0.004466615, 1.446336, 1, 1, 1, 1, 1,
0.09570716, -0.4015933, 2.866724, 1, 1, 1, 1, 1,
0.09826201, -0.6819028, 3.611262, 1, 1, 1, 1, 1,
0.1034289, 0.2453842, 1.938292, 1, 1, 1, 1, 1,
0.1042886, -0.2746758, 1.978999, 1, 1, 1, 1, 1,
0.108359, -1.814772, 3.937573, 1, 1, 1, 1, 1,
0.109536, -0.6179691, 1.765947, 1, 1, 1, 1, 1,
0.1101472, -0.1176237, 1.593165, 1, 1, 1, 1, 1,
0.1151061, -1.703537, 4.019362, 0, 0, 1, 1, 1,
0.116304, 0.7414048, -0.1607407, 1, 0, 0, 1, 1,
0.1169003, -1.687761, 2.778256, 1, 0, 0, 1, 1,
0.1234252, -0.4748204, 1.964978, 1, 0, 0, 1, 1,
0.1240163, 0.5156853, -1.500283, 1, 0, 0, 1, 1,
0.1245228, -0.08185893, 3.653043, 1, 0, 0, 1, 1,
0.1259648, -0.5630968, 2.256263, 0, 0, 0, 1, 1,
0.1261836, 1.546456, 1.312539, 0, 0, 0, 1, 1,
0.1270231, 0.2063072, -0.9641605, 0, 0, 0, 1, 1,
0.1304325, 1.995068, 0.0536192, 0, 0, 0, 1, 1,
0.1338465, 0.3874767, 0.8322377, 0, 0, 0, 1, 1,
0.1346761, -0.8601764, 2.664721, 0, 0, 0, 1, 1,
0.1373184, 0.3377764, 0.2830128, 0, 0, 0, 1, 1,
0.1427279, 0.1268707, 0.5788308, 1, 1, 1, 1, 1,
0.1471967, -0.9003831, 2.734562, 1, 1, 1, 1, 1,
0.1497664, -1.079954, 6.280083, 1, 1, 1, 1, 1,
0.154513, 1.421132, -0.1638357, 1, 1, 1, 1, 1,
0.1553419, -0.474946, 3.431864, 1, 1, 1, 1, 1,
0.1562588, 0.9615346, 2.145875, 1, 1, 1, 1, 1,
0.1578938, 0.5343143, -0.7182536, 1, 1, 1, 1, 1,
0.1632525, -0.739359, 2.133811, 1, 1, 1, 1, 1,
0.164301, 0.2678655, 1.559123, 1, 1, 1, 1, 1,
0.1644477, -0.2912202, 2.962157, 1, 1, 1, 1, 1,
0.1674336, 1.200052, 1.926263, 1, 1, 1, 1, 1,
0.1688984, 0.5440649, -0.7637456, 1, 1, 1, 1, 1,
0.1738462, 0.1404542, 0.7547612, 1, 1, 1, 1, 1,
0.1769182, -0.1686089, 1.76382, 1, 1, 1, 1, 1,
0.1798782, -0.3794379, 2.797085, 1, 1, 1, 1, 1,
0.1802057, 1.95311, -0.7151393, 0, 0, 1, 1, 1,
0.1814328, -0.09895422, 0.8373011, 1, 0, 0, 1, 1,
0.1815713, -0.608025, 2.756998, 1, 0, 0, 1, 1,
0.1839851, 0.2196942, -0.04679929, 1, 0, 0, 1, 1,
0.1873045, 0.5157357, 0.1800948, 1, 0, 0, 1, 1,
0.1873818, 1.195275, 0.6577132, 1, 0, 0, 1, 1,
0.1892985, 0.1240332, 0.5164642, 0, 0, 0, 1, 1,
0.1905971, 0.4782024, 0.5241419, 0, 0, 0, 1, 1,
0.1941366, 1.180761, 0.4544671, 0, 0, 0, 1, 1,
0.1973176, 0.21748, 0.6739092, 0, 0, 0, 1, 1,
0.2011083, 0.003697081, 2.446251, 0, 0, 0, 1, 1,
0.2047536, -0.4407251, 1.20363, 0, 0, 0, 1, 1,
0.2108669, -0.6017303, 4.070476, 0, 0, 0, 1, 1,
0.2124937, -0.9591219, 3.807933, 1, 1, 1, 1, 1,
0.2134912, -0.4362208, 2.383724, 1, 1, 1, 1, 1,
0.2157107, -1.318237, 2.68729, 1, 1, 1, 1, 1,
0.2247387, 0.5438624, -0.5662767, 1, 1, 1, 1, 1,
0.2279566, 1.554809, 0.3870425, 1, 1, 1, 1, 1,
0.2285574, 0.04644751, 0.5144827, 1, 1, 1, 1, 1,
0.2294117, -0.6795397, 1.651981, 1, 1, 1, 1, 1,
0.229443, -0.1451556, 2.782425, 1, 1, 1, 1, 1,
0.2305599, -0.5096783, 2.173852, 1, 1, 1, 1, 1,
0.2312205, 0.6540155, 0.8154226, 1, 1, 1, 1, 1,
0.2349423, -0.5918633, 1.372629, 1, 1, 1, 1, 1,
0.2365639, 0.6084995, -0.1296697, 1, 1, 1, 1, 1,
0.2375467, -1.251193, 3.9517, 1, 1, 1, 1, 1,
0.2376561, 0.06604334, 1.339748, 1, 1, 1, 1, 1,
0.2426666, 0.06724445, -0.6382661, 1, 1, 1, 1, 1,
0.247034, 1.633749, 0.6176068, 0, 0, 1, 1, 1,
0.2532474, -1.084198, 2.761367, 1, 0, 0, 1, 1,
0.2542815, 0.07854167, -1.089005, 1, 0, 0, 1, 1,
0.2553901, 0.001644419, 2.16374, 1, 0, 0, 1, 1,
0.2567614, 1.490588, 0.840771, 1, 0, 0, 1, 1,
0.2599426, -0.2805122, 1.878403, 1, 0, 0, 1, 1,
0.2603956, 0.3585912, 2.041903, 0, 0, 0, 1, 1,
0.2611735, -0.01740212, 0.3311259, 0, 0, 0, 1, 1,
0.2613634, -0.4278177, 1.837049, 0, 0, 0, 1, 1,
0.2623183, -0.4961303, 0.9521465, 0, 0, 0, 1, 1,
0.263424, -0.2538612, 1.87437, 0, 0, 0, 1, 1,
0.2677036, 0.7513725, 0.2508531, 0, 0, 0, 1, 1,
0.2697573, -1.095581, 2.008626, 0, 0, 0, 1, 1,
0.2705228, -0.5016626, 2.945765, 1, 1, 1, 1, 1,
0.2757427, -0.6816651, 4.593192, 1, 1, 1, 1, 1,
0.2785487, -0.4441024, 2.860457, 1, 1, 1, 1, 1,
0.2789375, 1.363227, -0.2508547, 1, 1, 1, 1, 1,
0.2793572, 0.8669848, -0.399622, 1, 1, 1, 1, 1,
0.2809173, 0.4980427, 1.161731, 1, 1, 1, 1, 1,
0.2809321, -0.03746739, 3.580087, 1, 1, 1, 1, 1,
0.2845287, -0.2694645, 2.188398, 1, 1, 1, 1, 1,
0.2872702, 0.2677134, 0.2156751, 1, 1, 1, 1, 1,
0.2877951, -0.858216, 2.560551, 1, 1, 1, 1, 1,
0.2926003, -0.5059214, 3.106596, 1, 1, 1, 1, 1,
0.2946052, -0.02879201, 1.424074, 1, 1, 1, 1, 1,
0.2962506, -0.1120005, 2.026443, 1, 1, 1, 1, 1,
0.2965217, -1.293636, 3.487187, 1, 1, 1, 1, 1,
0.3026276, -0.3548427, 2.573188, 1, 1, 1, 1, 1,
0.305115, 0.9409085, 0.4515139, 0, 0, 1, 1, 1,
0.306278, -1.359181, 3.754917, 1, 0, 0, 1, 1,
0.3077552, -0.4391589, 2.374413, 1, 0, 0, 1, 1,
0.3080027, -0.7989972, 4.684413, 1, 0, 0, 1, 1,
0.3113962, 0.5245034, 2.149162, 1, 0, 0, 1, 1,
0.3114062, 1.121322, 0.8196786, 1, 0, 0, 1, 1,
0.3130638, -0.5495349, 2.588611, 0, 0, 0, 1, 1,
0.3138678, 0.3732044, 1.857678, 0, 0, 0, 1, 1,
0.3177564, -2.016225, 2.300114, 0, 0, 0, 1, 1,
0.3197305, -0.2169778, 0.02984381, 0, 0, 0, 1, 1,
0.3257841, -0.4704769, 2.471379, 0, 0, 0, 1, 1,
0.3338441, 0.7223575, -1.149185, 0, 0, 0, 1, 1,
0.334954, 1.320949, 1.812791, 0, 0, 0, 1, 1,
0.3375043, 0.5701793, 0.1323994, 1, 1, 1, 1, 1,
0.3399338, -0.5071717, 1.991594, 1, 1, 1, 1, 1,
0.3411525, 0.7346537, 2.64676, 1, 1, 1, 1, 1,
0.3413744, 0.2937566, 2.452373, 1, 1, 1, 1, 1,
0.3467655, 0.9685903, 0.06046901, 1, 1, 1, 1, 1,
0.3512717, -2.461913, 2.724709, 1, 1, 1, 1, 1,
0.3556331, -1.056774, 3.499214, 1, 1, 1, 1, 1,
0.3558806, 0.01640409, 1.503595, 1, 1, 1, 1, 1,
0.3571913, 0.2330416, 2.218953, 1, 1, 1, 1, 1,
0.3582391, -0.1577739, 4.144347, 1, 1, 1, 1, 1,
0.3588519, 0.2691691, 1.213722, 1, 1, 1, 1, 1,
0.359113, -0.2788212, 1.859717, 1, 1, 1, 1, 1,
0.362153, 0.6280126, -1.05437, 1, 1, 1, 1, 1,
0.3631076, -0.6554365, 2.350123, 1, 1, 1, 1, 1,
0.3632779, 1.01141, 0.1732348, 1, 1, 1, 1, 1,
0.3635189, 2.058539, 0.3014155, 0, 0, 1, 1, 1,
0.3656222, 0.5995048, 0.4601471, 1, 0, 0, 1, 1,
0.3703794, 0.6774824, 1.304701, 1, 0, 0, 1, 1,
0.3708259, -0.9685836, 3.16833, 1, 0, 0, 1, 1,
0.3751063, 1.74747, 1.355942, 1, 0, 0, 1, 1,
0.3792033, 0.2015214, -0.1044225, 1, 0, 0, 1, 1,
0.3814671, -0.8654895, 2.842996, 0, 0, 0, 1, 1,
0.3820727, -0.3189095, 3.337239, 0, 0, 0, 1, 1,
0.387274, -0.6743945, 3.414219, 0, 0, 0, 1, 1,
0.3927232, -0.6083145, 2.650049, 0, 0, 0, 1, 1,
0.3976035, -0.8819773, 2.042815, 0, 0, 0, 1, 1,
0.4009089, 0.6330897, -0.6055064, 0, 0, 0, 1, 1,
0.4019623, -1.449662, 3.896271, 0, 0, 0, 1, 1,
0.4061539, -0.1063454, 3.425489, 1, 1, 1, 1, 1,
0.4062337, 1.208485, -0.2647366, 1, 1, 1, 1, 1,
0.4082691, -1.084526, 1.178218, 1, 1, 1, 1, 1,
0.4121763, -0.8092786, 0.1251615, 1, 1, 1, 1, 1,
0.4184134, 1.338994, 0.2604502, 1, 1, 1, 1, 1,
0.4216771, 0.2978922, 0.4281721, 1, 1, 1, 1, 1,
0.4229213, -0.4383386, 1.349419, 1, 1, 1, 1, 1,
0.4255283, 0.2649259, -1.002467, 1, 1, 1, 1, 1,
0.4259609, -0.6604795, 2.447339, 1, 1, 1, 1, 1,
0.4278294, 2.037564, -0.8955277, 1, 1, 1, 1, 1,
0.4288332, -1.835126, 3.317056, 1, 1, 1, 1, 1,
0.4289001, 0.5223319, 2.619797, 1, 1, 1, 1, 1,
0.4317327, 0.9836143, 0.577297, 1, 1, 1, 1, 1,
0.4335352, -0.7980198, 0.8985096, 1, 1, 1, 1, 1,
0.435043, -0.2083606, 3.326864, 1, 1, 1, 1, 1,
0.4384529, 1.121546, 1.196001, 0, 0, 1, 1, 1,
0.4388933, 0.310462, 0.6826434, 1, 0, 0, 1, 1,
0.4407899, 1.146912, -0.887959, 1, 0, 0, 1, 1,
0.4424157, 0.8181145, 2.165058, 1, 0, 0, 1, 1,
0.4443211, -0.3641511, 2.617884, 1, 0, 0, 1, 1,
0.4454018, -0.1353486, 1.079276, 1, 0, 0, 1, 1,
0.4473835, -2.075073, 3.59065, 0, 0, 0, 1, 1,
0.448625, 0.4693008, 2.306782, 0, 0, 0, 1, 1,
0.4502774, -0.7099523, 1.868309, 0, 0, 0, 1, 1,
0.4527011, -1.311797, 1.386803, 0, 0, 0, 1, 1,
0.4532017, -1.116639, 0.8802633, 0, 0, 0, 1, 1,
0.4550617, -0.6185659, 2.218909, 0, 0, 0, 1, 1,
0.4552072, -0.6030803, 2.334447, 0, 0, 0, 1, 1,
0.4605606, -0.7562214, 2.43261, 1, 1, 1, 1, 1,
0.46207, -0.7334607, 1.609058, 1, 1, 1, 1, 1,
0.4632072, -1.199617, 3.335765, 1, 1, 1, 1, 1,
0.4633355, -0.8706474, 3.836529, 1, 1, 1, 1, 1,
0.4638221, 0.2122537, 1.317839, 1, 1, 1, 1, 1,
0.4642808, -1.55713, 3.243248, 1, 1, 1, 1, 1,
0.4682634, 0.3726408, 2.203498, 1, 1, 1, 1, 1,
0.4692209, -1.597422, 2.586429, 1, 1, 1, 1, 1,
0.4719588, 0.4137949, 1.270962, 1, 1, 1, 1, 1,
0.473297, 1.654447, -0.2178323, 1, 1, 1, 1, 1,
0.4736243, 0.2064385, 2.415996, 1, 1, 1, 1, 1,
0.4748039, -0.8751429, 1.497341, 1, 1, 1, 1, 1,
0.4769108, 0.7103184, -1.01128, 1, 1, 1, 1, 1,
0.47885, 2.030368, 0.5918729, 1, 1, 1, 1, 1,
0.4833856, 1.305568, 0.07437894, 1, 1, 1, 1, 1,
0.4839486, 0.3542363, 0.9017356, 0, 0, 1, 1, 1,
0.4851216, 0.4134745, 0.1957257, 1, 0, 0, 1, 1,
0.4860791, -2.487667, 3.339694, 1, 0, 0, 1, 1,
0.4871495, 0.6495443, 0.2614011, 1, 0, 0, 1, 1,
0.4883905, -2.506228, 1.65298, 1, 0, 0, 1, 1,
0.5004169, -1.536283, 3.339833, 1, 0, 0, 1, 1,
0.5062896, 1.953705, 0.1529346, 0, 0, 0, 1, 1,
0.5111707, -1.569795, 3.768138, 0, 0, 0, 1, 1,
0.5137103, -0.1628613, 1.604611, 0, 0, 0, 1, 1,
0.5141941, -1.135407, 2.314485, 0, 0, 0, 1, 1,
0.5162503, -0.638719, 3.048048, 0, 0, 0, 1, 1,
0.5164297, 0.06646889, 2.834833, 0, 0, 0, 1, 1,
0.5179756, -0.4759055, 1.634607, 0, 0, 0, 1, 1,
0.5196718, -0.5287255, 2.407999, 1, 1, 1, 1, 1,
0.5246108, 1.491469, -0.6031283, 1, 1, 1, 1, 1,
0.526661, -0.9120068, 2.801631, 1, 1, 1, 1, 1,
0.529541, 0.03155171, 0.4051385, 1, 1, 1, 1, 1,
0.5308855, -0.3239315, 2.25913, 1, 1, 1, 1, 1,
0.5329178, 0.3667214, 2.797792, 1, 1, 1, 1, 1,
0.5342737, 2.202079, 0.2912808, 1, 1, 1, 1, 1,
0.5354409, -2.073612, 2.890317, 1, 1, 1, 1, 1,
0.5367182, -1.206794, 2.957989, 1, 1, 1, 1, 1,
0.5372042, -1.007984, 3.005302, 1, 1, 1, 1, 1,
0.5374497, 1.883866, -0.3319262, 1, 1, 1, 1, 1,
0.5384476, 1.470466, 0.2549755, 1, 1, 1, 1, 1,
0.5396067, 0.9986159, 1.998881, 1, 1, 1, 1, 1,
0.5409682, 0.7022746, 1.30998, 1, 1, 1, 1, 1,
0.5412527, 0.7984415, -0.07423304, 1, 1, 1, 1, 1,
0.5467584, 0.6381558, -1.068078, 0, 0, 1, 1, 1,
0.5546867, -0.2044623, 2.644723, 1, 0, 0, 1, 1,
0.5561916, 0.8318043, 0.005124127, 1, 0, 0, 1, 1,
0.5593064, -0.469035, 1.957245, 1, 0, 0, 1, 1,
0.5724001, -2.325359, 3.087454, 1, 0, 0, 1, 1,
0.5754947, -0.98057, 2.669214, 1, 0, 0, 1, 1,
0.5803067, -0.07253706, -0.2019332, 0, 0, 0, 1, 1,
0.5856656, -1.221883, 3.529401, 0, 0, 0, 1, 1,
0.5859776, -1.308247, 1.678545, 0, 0, 0, 1, 1,
0.5863075, 1.172451, -1.418983, 0, 0, 0, 1, 1,
0.5892084, -0.1617992, 3.497843, 0, 0, 0, 1, 1,
0.5925791, 0.5128205, 0.2083327, 0, 0, 0, 1, 1,
0.5975686, 0.02484952, 2.096524, 0, 0, 0, 1, 1,
0.607435, 0.5865886, 0.8094994, 1, 1, 1, 1, 1,
0.6075485, -1.431902, 1.82241, 1, 1, 1, 1, 1,
0.6081821, 2.056694, -0.09693491, 1, 1, 1, 1, 1,
0.6190307, -0.4037196, 1.747992, 1, 1, 1, 1, 1,
0.6233478, -0.3467487, 3.005966, 1, 1, 1, 1, 1,
0.6247021, -0.9158567, 2.06002, 1, 1, 1, 1, 1,
0.6254181, 0.3895647, 1.791939, 1, 1, 1, 1, 1,
0.6260849, -0.3451632, 0.6981131, 1, 1, 1, 1, 1,
0.6330608, -1.657693, 2.639717, 1, 1, 1, 1, 1,
0.6342884, -0.9613624, 0.704385, 1, 1, 1, 1, 1,
0.6343617, -0.3795347, 1.744235, 1, 1, 1, 1, 1,
0.6426053, 0.6430683, 0.5587755, 1, 1, 1, 1, 1,
0.6460988, 0.2238722, -0.9964458, 1, 1, 1, 1, 1,
0.6481142, -0.512446, 2.825273, 1, 1, 1, 1, 1,
0.6506934, 1.440216, -0.1509224, 1, 1, 1, 1, 1,
0.6510954, -1.348993, 3.843212, 0, 0, 1, 1, 1,
0.6519894, -1.044281, 2.679508, 1, 0, 0, 1, 1,
0.6527159, -0.5865009, 3.031017, 1, 0, 0, 1, 1,
0.6599429, -0.3913288, 2.623396, 1, 0, 0, 1, 1,
0.6615695, -1.92838, 2.929604, 1, 0, 0, 1, 1,
0.6660196, -0.6459267, 0.8828945, 1, 0, 0, 1, 1,
0.6698982, 1.465108, -1.256371, 0, 0, 0, 1, 1,
0.6747424, 0.5795215, 0.6546038, 0, 0, 0, 1, 1,
0.6748325, 0.793835, 0.1603644, 0, 0, 0, 1, 1,
0.6785123, -0.8722398, 1.998434, 0, 0, 0, 1, 1,
0.6813043, -2.60721, 3.185814, 0, 0, 0, 1, 1,
0.6877316, 0.8564415, 2.259583, 0, 0, 0, 1, 1,
0.6921561, -0.1410772, 1.92705, 0, 0, 0, 1, 1,
0.7034414, -0.1274084, 1.234067, 1, 1, 1, 1, 1,
0.7048433, -0.6800098, 3.089275, 1, 1, 1, 1, 1,
0.7156177, -0.212807, 1.293602, 1, 1, 1, 1, 1,
0.7191103, 1.514171, -1.886884, 1, 1, 1, 1, 1,
0.7238477, 0.07833926, 1.934018, 1, 1, 1, 1, 1,
0.7322995, -1.406994, 1.36269, 1, 1, 1, 1, 1,
0.7327813, 0.3275231, 0.8898437, 1, 1, 1, 1, 1,
0.7328068, 1.035651, -0.6421701, 1, 1, 1, 1, 1,
0.7345229, 1.532373, 0.0286913, 1, 1, 1, 1, 1,
0.7355517, 0.3456537, 1.527117, 1, 1, 1, 1, 1,
0.740156, -1.812594, 2.21129, 1, 1, 1, 1, 1,
0.7428821, -0.3230963, 0.8737632, 1, 1, 1, 1, 1,
0.7432719, 1.549746, -0.1127525, 1, 1, 1, 1, 1,
0.7556146, -1.739285, 0.5719697, 1, 1, 1, 1, 1,
0.7558109, 0.4118271, 1.295033, 1, 1, 1, 1, 1,
0.7582516, 1.400459, 2.358465, 0, 0, 1, 1, 1,
0.7658093, -0.06698593, 2.095373, 1, 0, 0, 1, 1,
0.7686111, 0.7161853, 2.596372, 1, 0, 0, 1, 1,
0.7694237, 2.474412, 0.5301632, 1, 0, 0, 1, 1,
0.7722257, 0.6305729, 1.890064, 1, 0, 0, 1, 1,
0.7736741, -0.1394221, 1.105259, 1, 0, 0, 1, 1,
0.7750667, -0.8715036, 2.589233, 0, 0, 0, 1, 1,
0.7869886, -0.1120291, 2.451529, 0, 0, 0, 1, 1,
0.7928577, -0.3619972, 0.5909284, 0, 0, 0, 1, 1,
0.794693, -0.2321489, 3.453904, 0, 0, 0, 1, 1,
0.7950409, -0.5943876, 2.423261, 0, 0, 0, 1, 1,
0.7979754, 0.6260222, -0.05337675, 0, 0, 0, 1, 1,
0.798942, 0.5816901, 0.4333895, 0, 0, 0, 1, 1,
0.8013097, 0.1091013, 0.3088787, 1, 1, 1, 1, 1,
0.8036351, 0.9867866, -0.7291964, 1, 1, 1, 1, 1,
0.8196082, -0.8992337, 1.622614, 1, 1, 1, 1, 1,
0.8197724, -0.7048614, 2.000661, 1, 1, 1, 1, 1,
0.8315234, -1.146992, 2.875765, 1, 1, 1, 1, 1,
0.8332084, -0.6112285, 1.007525, 1, 1, 1, 1, 1,
0.8378013, 1.523385, 1.894838, 1, 1, 1, 1, 1,
0.8425155, -0.7399673, 3.740752, 1, 1, 1, 1, 1,
0.8432598, -0.4776876, 1.522166, 1, 1, 1, 1, 1,
0.851493, -0.3568698, 2.712928, 1, 1, 1, 1, 1,
0.854787, 1.457161, -0.06193134, 1, 1, 1, 1, 1,
0.8623948, -1.059098, 2.759538, 1, 1, 1, 1, 1,
0.8736272, 0.07819599, 0.07541405, 1, 1, 1, 1, 1,
0.8748041, -0.8559562, 2.725741, 1, 1, 1, 1, 1,
0.8814989, -0.7417901, 0.6132642, 1, 1, 1, 1, 1,
0.8821319, -1.361283, 3.974039, 0, 0, 1, 1, 1,
0.892877, -1.06489, 2.037702, 1, 0, 0, 1, 1,
0.8992255, 0.585982, 3.325176, 1, 0, 0, 1, 1,
0.8998786, -1.88584, 0.5180353, 1, 0, 0, 1, 1,
0.9008289, -1.624132, 2.770586, 1, 0, 0, 1, 1,
0.9031556, -1.533064, 2.96485, 1, 0, 0, 1, 1,
0.919313, -0.5561864, 2.225016, 0, 0, 0, 1, 1,
0.9202282, -1.692857, 1.799127, 0, 0, 0, 1, 1,
0.9205406, -0.6381447, 2.018225, 0, 0, 0, 1, 1,
0.921788, -0.2834177, 2.168961, 0, 0, 0, 1, 1,
0.92466, 0.914282, 0.6350828, 0, 0, 0, 1, 1,
0.931109, -1.011661, 3.597378, 0, 0, 0, 1, 1,
0.9366733, 0.9697298, -0.5035062, 0, 0, 0, 1, 1,
0.936721, 1.128193, 1.122371, 1, 1, 1, 1, 1,
0.9409162, 0.04141375, 2.430019, 1, 1, 1, 1, 1,
0.9437745, -0.1267799, 2.838058, 1, 1, 1, 1, 1,
0.9453063, -0.06986526, 2.172246, 1, 1, 1, 1, 1,
0.9492938, 0.402251, -0.4485008, 1, 1, 1, 1, 1,
0.9510629, -2.364223, 3.034532, 1, 1, 1, 1, 1,
0.9607242, -0.9317088, 3.519213, 1, 1, 1, 1, 1,
0.9681633, -1.125156, 2.994785, 1, 1, 1, 1, 1,
0.9749393, 0.5359339, 1.59713, 1, 1, 1, 1, 1,
0.9815752, -0.0453394, 1.827638, 1, 1, 1, 1, 1,
0.987713, -0.7872741, 4.303336, 1, 1, 1, 1, 1,
0.9933662, 1.283025, -0.007954207, 1, 1, 1, 1, 1,
0.9938635, -0.8346516, 3.522655, 1, 1, 1, 1, 1,
0.9939281, -0.8282111, 3.873617, 1, 1, 1, 1, 1,
0.99544, -1.072798, 1.47238, 1, 1, 1, 1, 1,
0.9964296, 0.6251709, 0.8807168, 0, 0, 1, 1, 1,
1.000537, 2.762805, -1.589301, 1, 0, 0, 1, 1,
1.001764, -0.3062739, 1.523187, 1, 0, 0, 1, 1,
1.004875, -1.226682, 3.123091, 1, 0, 0, 1, 1,
1.005982, 1.340661, 2.072287, 1, 0, 0, 1, 1,
1.018384, -1.113817, 3.586529, 1, 0, 0, 1, 1,
1.031028, 0.9528654, 0.2277778, 0, 0, 0, 1, 1,
1.034675, 1.608857, 0.8730006, 0, 0, 0, 1, 1,
1.050884, 1.046533, -0.1063795, 0, 0, 0, 1, 1,
1.066652, -0.05339008, 4.196146, 0, 0, 0, 1, 1,
1.06731, -0.610121, 3.979869, 0, 0, 0, 1, 1,
1.081643, 1.002245, 0.5131779, 0, 0, 0, 1, 1,
1.081853, -0.6492211, 1.265466, 0, 0, 0, 1, 1,
1.083005, 0.1401897, 0.7400809, 1, 1, 1, 1, 1,
1.086036, 0.7024796, 2.969972, 1, 1, 1, 1, 1,
1.109064, -1.477687, 1.207247, 1, 1, 1, 1, 1,
1.116733, 1.232447, 1.03371, 1, 1, 1, 1, 1,
1.124838, -0.8299283, 1.586891, 1, 1, 1, 1, 1,
1.127624, 0.1721864, 0.7865519, 1, 1, 1, 1, 1,
1.129762, 0.2558879, -0.2109822, 1, 1, 1, 1, 1,
1.139655, 1.068739, 0.4335625, 1, 1, 1, 1, 1,
1.141569, -0.7606079, 3.374063, 1, 1, 1, 1, 1,
1.143117, -1.11398, 2.057402, 1, 1, 1, 1, 1,
1.144061, -0.0750199, 1.343755, 1, 1, 1, 1, 1,
1.144529, 1.490198, 1.298068, 1, 1, 1, 1, 1,
1.149334, -0.1230601, 3.639086, 1, 1, 1, 1, 1,
1.156729, -0.2350148, 1.275067, 1, 1, 1, 1, 1,
1.159928, -0.02245664, 3.386519, 1, 1, 1, 1, 1,
1.161184, -0.508216, 2.182139, 0, 0, 1, 1, 1,
1.173078, -1.583822, 1.863441, 1, 0, 0, 1, 1,
1.181248, -0.04917791, 0.5046787, 1, 0, 0, 1, 1,
1.185743, 0.6889969, 2.833707, 1, 0, 0, 1, 1,
1.187634, -0.6921008, 3.173779, 1, 0, 0, 1, 1,
1.188577, 0.5576935, 1.473732, 1, 0, 0, 1, 1,
1.189571, -0.1322233, 2.372226, 0, 0, 0, 1, 1,
1.19382, 1.823587, -0.7822438, 0, 0, 0, 1, 1,
1.19816, -1.56805, 2.13496, 0, 0, 0, 1, 1,
1.237918, -0.7113972, 2.43653, 0, 0, 0, 1, 1,
1.252548, -0.09376734, 1.083197, 0, 0, 0, 1, 1,
1.252758, 1.219476, 1.051418, 0, 0, 0, 1, 1,
1.254998, 0.4379971, 2.021208, 0, 0, 0, 1, 1,
1.257675, 0.2797156, 0.3821329, 1, 1, 1, 1, 1,
1.274355, 0.4311413, 0.555606, 1, 1, 1, 1, 1,
1.274633, 1.425666, 0.382806, 1, 1, 1, 1, 1,
1.287952, -0.2823567, 1.913585, 1, 1, 1, 1, 1,
1.294721, -0.4912556, 2.101344, 1, 1, 1, 1, 1,
1.297985, 1.4131, -0.1330765, 1, 1, 1, 1, 1,
1.314792, 0.06462002, -0.4076075, 1, 1, 1, 1, 1,
1.323688, -0.6834165, 0.7704458, 1, 1, 1, 1, 1,
1.324566, -1.282067, 0.9930955, 1, 1, 1, 1, 1,
1.326415, -0.5434417, 1.660781, 1, 1, 1, 1, 1,
1.332339, -0.4988309, 3.31484, 1, 1, 1, 1, 1,
1.355638, 0.2824458, 1.295294, 1, 1, 1, 1, 1,
1.361764, 0.8684911, 2.498322, 1, 1, 1, 1, 1,
1.36426, -1.079643, 1.765052, 1, 1, 1, 1, 1,
1.372811, 0.6148418, 1.97078, 1, 1, 1, 1, 1,
1.400716, 0.8980238, -1.409079, 0, 0, 1, 1, 1,
1.405107, 0.1748515, 3.195568, 1, 0, 0, 1, 1,
1.41579, -0.1768316, 1.679343, 1, 0, 0, 1, 1,
1.416916, -0.806592, 2.241503, 1, 0, 0, 1, 1,
1.420055, 0.2384311, -0.5643349, 1, 0, 0, 1, 1,
1.420428, -0.7592984, 2.774289, 1, 0, 0, 1, 1,
1.424195, -0.1986393, 1.249388, 0, 0, 0, 1, 1,
1.424366, -1.030375, 1.711458, 0, 0, 0, 1, 1,
1.425167, -1.853319, 4.750758, 0, 0, 0, 1, 1,
1.428841, -0.8141371, 2.125908, 0, 0, 0, 1, 1,
1.431868, 0.1516473, -0.0619447, 0, 0, 0, 1, 1,
1.437854, 0.1673617, 2.322772, 0, 0, 0, 1, 1,
1.440273, -0.8659849, 4.028116, 0, 0, 0, 1, 1,
1.447332, -0.9316591, 2.475339, 1, 1, 1, 1, 1,
1.450652, -0.201193, 1.403501, 1, 1, 1, 1, 1,
1.452032, -0.8255603, 0.06077389, 1, 1, 1, 1, 1,
1.452384, 0.3029613, 1.510229, 1, 1, 1, 1, 1,
1.46574, 0.6941772, -0.1629558, 1, 1, 1, 1, 1,
1.471589, -1.905383, 2.439207, 1, 1, 1, 1, 1,
1.484463, 1.340354, -0.717048, 1, 1, 1, 1, 1,
1.493177, 0.6696355, 1.241167, 1, 1, 1, 1, 1,
1.494542, -1.853641, 2.4383, 1, 1, 1, 1, 1,
1.49745, -1.036849, 2.641394, 1, 1, 1, 1, 1,
1.507475, -0.4936273, 2.522202, 1, 1, 1, 1, 1,
1.509734, -1.219782, 1.598972, 1, 1, 1, 1, 1,
1.510749, -1.384354, 2.030414, 1, 1, 1, 1, 1,
1.513394, -0.9238897, 1.193101, 1, 1, 1, 1, 1,
1.513426, 0.4514961, -0.6104993, 1, 1, 1, 1, 1,
1.518341, 0.03608924, 1.742658, 0, 0, 1, 1, 1,
1.518718, -1.272745, 1.030934, 1, 0, 0, 1, 1,
1.51937, -0.08975512, 1.641739, 1, 0, 0, 1, 1,
1.521119, -0.5336673, 1.58692, 1, 0, 0, 1, 1,
1.541637, -2.803901, 2.466997, 1, 0, 0, 1, 1,
1.549914, 0.5605406, 1.365655, 1, 0, 0, 1, 1,
1.555999, 0.6109854, -1.004236, 0, 0, 0, 1, 1,
1.561342, -0.680545, 0.3724766, 0, 0, 0, 1, 1,
1.572051, 0.3180823, 1.422758, 0, 0, 0, 1, 1,
1.572328, 0.719409, 2.021199, 0, 0, 0, 1, 1,
1.579669, -0.142893, 1.079959, 0, 0, 0, 1, 1,
1.597514, 0.4107986, 3.776845, 0, 0, 0, 1, 1,
1.601175, 0.3973579, -0.6013675, 0, 0, 0, 1, 1,
1.604699, -0.1467888, 1.910798, 1, 1, 1, 1, 1,
1.609503, 1.185915, 2.42009, 1, 1, 1, 1, 1,
1.629143, -0.2745345, 0.9766386, 1, 1, 1, 1, 1,
1.651136, 0.8898987, 0.1173806, 1, 1, 1, 1, 1,
1.663623, 0.9084772, 2.554282, 1, 1, 1, 1, 1,
1.697015, -1.014836, 1.250949, 1, 1, 1, 1, 1,
1.697116, 0.8404663, 1.632048, 1, 1, 1, 1, 1,
1.708745, -1.814446, 1.716761, 1, 1, 1, 1, 1,
1.71226, -0.2412675, 0.3061168, 1, 1, 1, 1, 1,
1.715373, -1.411238, 2.59273, 1, 1, 1, 1, 1,
1.719979, 0.289414, 3.232773, 1, 1, 1, 1, 1,
1.726412, -1.92012, 0.9206308, 1, 1, 1, 1, 1,
1.727731, 0.5030613, 0.1451013, 1, 1, 1, 1, 1,
1.739737, -0.05405639, 0.4052036, 1, 1, 1, 1, 1,
1.745404, -1.263217, 1.335235, 1, 1, 1, 1, 1,
1.748746, -0.2114109, 0.3946646, 0, 0, 1, 1, 1,
1.774689, 1.30699, 1.547576, 1, 0, 0, 1, 1,
1.7787, -0.4016067, 2.206397, 1, 0, 0, 1, 1,
1.779288, 0.3999776, -0.2581935, 1, 0, 0, 1, 1,
1.788011, -0.6515472, 1.094462, 1, 0, 0, 1, 1,
1.825439, 0.01820406, 1.167987, 1, 0, 0, 1, 1,
1.832923, -2.478168, 1.918748, 0, 0, 0, 1, 1,
1.844223, -1.134707, 2.169821, 0, 0, 0, 1, 1,
1.850234, -0.7727168, -0.05164979, 0, 0, 0, 1, 1,
1.852572, -0.04558775, 1.395589, 0, 0, 0, 1, 1,
1.858128, 1.810296, -1.455324, 0, 0, 0, 1, 1,
1.861846, 0.7342492, 1.134398, 0, 0, 0, 1, 1,
1.862835, 1.348698, 0.3331298, 0, 0, 0, 1, 1,
1.880257, 0.8555681, 2.127851, 1, 1, 1, 1, 1,
1.894968, -1.412744, 1.878767, 1, 1, 1, 1, 1,
1.909499, 1.298162, 1.123277, 1, 1, 1, 1, 1,
1.909883, -0.5847605, -0.5548944, 1, 1, 1, 1, 1,
1.937748, -1.565711, 2.692553, 1, 1, 1, 1, 1,
1.94695, -0.7098777, 3.593136, 1, 1, 1, 1, 1,
1.974865, -0.9848952, 1.830732, 1, 1, 1, 1, 1,
1.975163, 0.3669876, 1.181508, 1, 1, 1, 1, 1,
1.982021, -0.5515063, 1.644016, 1, 1, 1, 1, 1,
1.993869, -0.04004358, 2.078352, 1, 1, 1, 1, 1,
1.998932, 1.503571, -0.3268875, 1, 1, 1, 1, 1,
2.074963, -0.6629896, 2.383629, 1, 1, 1, 1, 1,
2.079586, -0.66047, 2.055228, 1, 1, 1, 1, 1,
2.087043, 0.320842, -0.3678737, 1, 1, 1, 1, 1,
2.088004, -0.2262394, 2.030247, 1, 1, 1, 1, 1,
2.100008, -0.0415893, 0.9135455, 0, 0, 1, 1, 1,
2.149458, 1.093288, -0.04101818, 1, 0, 0, 1, 1,
2.168279, 0.4674684, 0.4573206, 1, 0, 0, 1, 1,
2.174411, -0.4898885, 1.339469, 1, 0, 0, 1, 1,
2.197933, -0.4162435, 3.26369, 1, 0, 0, 1, 1,
2.247241, -1.026865, 0.3208702, 1, 0, 0, 1, 1,
2.275287, -2.616743, 3.751654, 0, 0, 0, 1, 1,
2.308532, 2.015955, 0.6448522, 0, 0, 0, 1, 1,
2.326558, 0.08683695, 1.668699, 0, 0, 0, 1, 1,
2.357944, 0.07714713, 1.59478, 0, 0, 0, 1, 1,
2.452584, 0.841265, 2.320246, 0, 0, 0, 1, 1,
2.468529, -0.5114056, 1.21812, 0, 0, 0, 1, 1,
2.556465, 1.170528, 2.116363, 0, 0, 0, 1, 1,
2.568957, -0.2692796, 0.5751571, 1, 1, 1, 1, 1,
2.584055, -1.999108, 1.004942, 1, 1, 1, 1, 1,
2.664149, 0.05151298, -0.6383049, 1, 1, 1, 1, 1,
2.802562, 0.4115608, 1.007136, 1, 1, 1, 1, 1,
2.899561, -0.03892212, 2.757416, 1, 1, 1, 1, 1,
3.025853, 0.01675108, 0.401695, 1, 1, 1, 1, 1,
3.071547, -0.1905886, 2.277246, 1, 1, 1, 1, 1
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
var radius = 9.925131;
var distance = 34.8616;
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
mvMatrix.translate( 0.0584569, 0.04826498, -0.2210052 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.8616);
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