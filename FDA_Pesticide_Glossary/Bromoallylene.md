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
-2.86568, 0.5910619, -2.382968, 1, 0, 0, 1,
-2.797816, -1.425563, -1.74679, 1, 0.007843138, 0, 1,
-2.696064, -0.9984513, -3.254511, 1, 0.01176471, 0, 1,
-2.583113, 1.730267, -1.731884, 1, 0.01960784, 0, 1,
-2.441881, 0.755475, -1.538688, 1, 0.02352941, 0, 1,
-2.406679, -1.351427, -1.339363, 1, 0.03137255, 0, 1,
-2.389962, 0.2599994, -2.231948, 1, 0.03529412, 0, 1,
-2.322291, -0.7152067, -0.1153219, 1, 0.04313726, 0, 1,
-2.255455, 0.08530293, -0.2802942, 1, 0.04705882, 0, 1,
-2.214379, -0.6416898, -1.302012, 1, 0.05490196, 0, 1,
-2.214231, -0.5435212, -2.244681, 1, 0.05882353, 0, 1,
-2.190053, 0.3157489, -0.9534945, 1, 0.06666667, 0, 1,
-2.174521, 1.210652, -0.1751051, 1, 0.07058824, 0, 1,
-2.152731, -1.150506, 0.2149827, 1, 0.07843138, 0, 1,
-2.109052, -1.162238, -1.413513, 1, 0.08235294, 0, 1,
-2.102227, 0.3479851, 1.003852, 1, 0.09019608, 0, 1,
-2.07518, 0.8277777, -0.5927442, 1, 0.09411765, 0, 1,
-2.016359, 1.240371, -2.627777, 1, 0.1019608, 0, 1,
-2.005744, -1.558342, -3.960174, 1, 0.1098039, 0, 1,
-1.9584, -0.06571665, -0.9186121, 1, 0.1137255, 0, 1,
-1.952743, 0.2479163, -0.7322079, 1, 0.1215686, 0, 1,
-1.937131, 1.088276, -1.744911, 1, 0.1254902, 0, 1,
-1.933592, 0.4327179, -1.356541, 1, 0.1333333, 0, 1,
-1.932071, -0.7433587, -1.599364, 1, 0.1372549, 0, 1,
-1.910197, 0.3469474, 0.3281287, 1, 0.145098, 0, 1,
-1.908118, -0.5225832, -2.374511, 1, 0.1490196, 0, 1,
-1.904774, -0.905194, -1.836236, 1, 0.1568628, 0, 1,
-1.879059, -1.450602, -2.853086, 1, 0.1607843, 0, 1,
-1.869698, -0.1603222, -1.133999, 1, 0.1686275, 0, 1,
-1.867257, 1.795405, 0.9569631, 1, 0.172549, 0, 1,
-1.867049, -2.634716, -3.752985, 1, 0.1803922, 0, 1,
-1.842905, -0.7584003, -1.609013, 1, 0.1843137, 0, 1,
-1.833402, 0.6650347, -2.749842, 1, 0.1921569, 0, 1,
-1.818953, -0.8164996, -0.5894338, 1, 0.1960784, 0, 1,
-1.806136, 0.2086866, -0.0188003, 1, 0.2039216, 0, 1,
-1.795017, 0.4070469, -1.201907, 1, 0.2117647, 0, 1,
-1.793561, 0.821367, -1.963809, 1, 0.2156863, 0, 1,
-1.772285, 0.1047244, -1.82689, 1, 0.2235294, 0, 1,
-1.769454, -0.001701879, -1.89859, 1, 0.227451, 0, 1,
-1.757499, 0.9214295, -0.111392, 1, 0.2352941, 0, 1,
-1.755892, 0.07446881, -2.21099, 1, 0.2392157, 0, 1,
-1.732591, -0.4309526, -1.030265, 1, 0.2470588, 0, 1,
-1.728563, 0.2151507, -0.4506819, 1, 0.2509804, 0, 1,
-1.724209, -0.2638861, -5.302644, 1, 0.2588235, 0, 1,
-1.712783, -0.739482, -2.747825, 1, 0.2627451, 0, 1,
-1.665711, 0.3998275, -1.18564, 1, 0.2705882, 0, 1,
-1.656738, 1.318229, -0.8280889, 1, 0.2745098, 0, 1,
-1.656108, 0.7822229, 0.2595269, 1, 0.282353, 0, 1,
-1.647536, 0.7474986, -3.11833, 1, 0.2862745, 0, 1,
-1.639341, -1.274338, -4.27542, 1, 0.2941177, 0, 1,
-1.637605, -0.141148, -2.817323, 1, 0.3019608, 0, 1,
-1.615306, -0.7957994, -2.120181, 1, 0.3058824, 0, 1,
-1.614016, 1.364287, -0.9362041, 1, 0.3137255, 0, 1,
-1.612085, -1.087255, 0.1223787, 1, 0.3176471, 0, 1,
-1.610759, -0.6734725, -2.583326, 1, 0.3254902, 0, 1,
-1.609741, 0.9605957, -0.6287798, 1, 0.3294118, 0, 1,
-1.604928, 0.8228818, -2.187585, 1, 0.3372549, 0, 1,
-1.596735, -0.1685349, -0.9044349, 1, 0.3411765, 0, 1,
-1.561391, -0.2762336, -0.6531086, 1, 0.3490196, 0, 1,
-1.543343, 0.8545885, 1.118463, 1, 0.3529412, 0, 1,
-1.536507, -1.007951, -3.459453, 1, 0.3607843, 0, 1,
-1.494475, 0.7081965, -2.622611, 1, 0.3647059, 0, 1,
-1.487781, -0.007550082, -1.815519, 1, 0.372549, 0, 1,
-1.475044, 0.4192089, -2.271141, 1, 0.3764706, 0, 1,
-1.459991, -0.7322176, -2.893015, 1, 0.3843137, 0, 1,
-1.457513, -0.006959034, -0.6446111, 1, 0.3882353, 0, 1,
-1.456429, 0.1700451, -3.054096, 1, 0.3960784, 0, 1,
-1.454416, 0.1168909, -3.132662, 1, 0.4039216, 0, 1,
-1.440493, -0.3902116, -0.6755531, 1, 0.4078431, 0, 1,
-1.440097, 2.024902, 1.413183, 1, 0.4156863, 0, 1,
-1.439422, 1.310394, -0.1909862, 1, 0.4196078, 0, 1,
-1.431907, 0.008752038, -1.570311, 1, 0.427451, 0, 1,
-1.43156, -0.6527352, -2.85316, 1, 0.4313726, 0, 1,
-1.410216, -0.689904, -4.107118, 1, 0.4392157, 0, 1,
-1.408439, -1.117697, -1.355221, 1, 0.4431373, 0, 1,
-1.399991, 0.8682166, 0.3577533, 1, 0.4509804, 0, 1,
-1.39533, 0.278707, -1.564825, 1, 0.454902, 0, 1,
-1.394083, -0.1272241, -3.185432, 1, 0.4627451, 0, 1,
-1.379249, -1.880136, -3.022389, 1, 0.4666667, 0, 1,
-1.377506, -0.6094415, -3.154888, 1, 0.4745098, 0, 1,
-1.376965, 0.4206935, -1.212211, 1, 0.4784314, 0, 1,
-1.364526, 0.5984486, -0.9694134, 1, 0.4862745, 0, 1,
-1.362117, 0.2050015, -1.413294, 1, 0.4901961, 0, 1,
-1.350292, 0.09650401, -1.357027, 1, 0.4980392, 0, 1,
-1.33707, -0.01437896, -0.5896695, 1, 0.5058824, 0, 1,
-1.332485, -0.7981327, -3.314085, 1, 0.509804, 0, 1,
-1.332185, -0.7186497, -1.035414, 1, 0.5176471, 0, 1,
-1.33209, -0.2399675, -1.428156, 1, 0.5215687, 0, 1,
-1.325555, -0.600984, -1.332544, 1, 0.5294118, 0, 1,
-1.315192, -0.3258193, -1.511676, 1, 0.5333334, 0, 1,
-1.313955, -0.1877691, -1.28229, 1, 0.5411765, 0, 1,
-1.312317, 0.134598, -0.6487569, 1, 0.5450981, 0, 1,
-1.305908, -0.6654317, -2.832347, 1, 0.5529412, 0, 1,
-1.300227, 0.273526, -0.281918, 1, 0.5568628, 0, 1,
-1.29102, -0.03251548, -1.034229, 1, 0.5647059, 0, 1,
-1.282587, -0.416664, -2.43743, 1, 0.5686275, 0, 1,
-1.278837, -1.516243, -1.936296, 1, 0.5764706, 0, 1,
-1.277422, -1.07761, -3.738595, 1, 0.5803922, 0, 1,
-1.275449, -0.5930779, -2.788037, 1, 0.5882353, 0, 1,
-1.270183, -0.08384469, -1.437367, 1, 0.5921569, 0, 1,
-1.269915, 0.06948618, -1.118718, 1, 0.6, 0, 1,
-1.260751, 0.6739148, -0.9060212, 1, 0.6078432, 0, 1,
-1.244943, 0.5731249, -1.347717, 1, 0.6117647, 0, 1,
-1.244095, -0.5334643, 0.264406, 1, 0.6196079, 0, 1,
-1.243239, -0.1393174, -0.3747432, 1, 0.6235294, 0, 1,
-1.233831, 1.305797, 0.03797844, 1, 0.6313726, 0, 1,
-1.232246, 0.5393786, -1.343678, 1, 0.6352941, 0, 1,
-1.226018, 1.248534, -1.751784, 1, 0.6431373, 0, 1,
-1.216853, -0.7148066, -1.205841, 1, 0.6470588, 0, 1,
-1.212242, 0.07828057, -1.654481, 1, 0.654902, 0, 1,
-1.209397, -0.6089349, -3.743872, 1, 0.6588235, 0, 1,
-1.20682, 0.5149451, 2.416059, 1, 0.6666667, 0, 1,
-1.191604, -0.6808479, -3.241392, 1, 0.6705883, 0, 1,
-1.184643, -0.3276546, -3.067573, 1, 0.6784314, 0, 1,
-1.18322, -0.02286995, -2.074304, 1, 0.682353, 0, 1,
-1.169302, -1.456013, -3.078377, 1, 0.6901961, 0, 1,
-1.167657, 0.485433, -0.5054817, 1, 0.6941177, 0, 1,
-1.163959, 0.7106676, -2.932838, 1, 0.7019608, 0, 1,
-1.151671, -0.3684449, -1.256406, 1, 0.7098039, 0, 1,
-1.146217, -2.011054, -2.62636, 1, 0.7137255, 0, 1,
-1.138684, -1.316316, -1.845407, 1, 0.7215686, 0, 1,
-1.132913, 0.2713781, -1.54125, 1, 0.7254902, 0, 1,
-1.131035, 0.1723724, -1.52221, 1, 0.7333333, 0, 1,
-1.13035, 1.211394, -0.927583, 1, 0.7372549, 0, 1,
-1.126416, 0.0864349, -3.333431, 1, 0.7450981, 0, 1,
-1.12608, -0.7932594, -1.900956, 1, 0.7490196, 0, 1,
-1.124817, -2.061934, -3.060364, 1, 0.7568628, 0, 1,
-1.116226, 0.1827349, -0.6658837, 1, 0.7607843, 0, 1,
-1.113535, -0.7976376, -1.986111, 1, 0.7686275, 0, 1,
-1.112395, 1.025656, 0.1112286, 1, 0.772549, 0, 1,
-1.111162, -1.282558, -4.207217, 1, 0.7803922, 0, 1,
-1.109091, 2.202127, -0.3001939, 1, 0.7843137, 0, 1,
-1.095587, 0.5233636, -0.2354559, 1, 0.7921569, 0, 1,
-1.095079, 0.2331564, -1.225357, 1, 0.7960784, 0, 1,
-1.085546, -2.02397, -3.91477, 1, 0.8039216, 0, 1,
-1.083314, 1.415545, 1.487519, 1, 0.8117647, 0, 1,
-1.079225, 1.811141, -0.03230315, 1, 0.8156863, 0, 1,
-1.074076, 0.2983278, 0.3813755, 1, 0.8235294, 0, 1,
-1.073729, 0.880013, -0.2565998, 1, 0.827451, 0, 1,
-1.073058, 0.3897749, -2.536375, 1, 0.8352941, 0, 1,
-1.067916, -0.6240878, -2.256914, 1, 0.8392157, 0, 1,
-1.064982, 1.471218, 0.9706356, 1, 0.8470588, 0, 1,
-1.063224, -0.8536872, -2.683167, 1, 0.8509804, 0, 1,
-1.05321, 0.2151197, -1.323146, 1, 0.8588235, 0, 1,
-1.042104, -0.1387043, -1.14461, 1, 0.8627451, 0, 1,
-1.041642, 0.1060756, -0.9193226, 1, 0.8705882, 0, 1,
-1.041244, -0.2080191, -2.154013, 1, 0.8745098, 0, 1,
-1.039552, 1.723061, 0.6532193, 1, 0.8823529, 0, 1,
-1.037811, 0.6562304, 0.3096431, 1, 0.8862745, 0, 1,
-1.037788, 0.1553371, -2.501796, 1, 0.8941177, 0, 1,
-1.036048, -0.2038224, -1.202236, 1, 0.8980392, 0, 1,
-1.032881, 0.3266173, -0.5965176, 1, 0.9058824, 0, 1,
-1.02909, -0.4718739, -1.985615, 1, 0.9137255, 0, 1,
-1.028622, -2.1049, -4.458454, 1, 0.9176471, 0, 1,
-1.023552, 0.9467009, -0.0411126, 1, 0.9254902, 0, 1,
-1.014101, -1.386298, -3.155677, 1, 0.9294118, 0, 1,
-1.013315, -2.006734, -2.192325, 1, 0.9372549, 0, 1,
-1.002828, -1.640561, -0.8335657, 1, 0.9411765, 0, 1,
-1.001629, -0.7261974, -3.847232, 1, 0.9490196, 0, 1,
-0.992128, 0.5825648, -0.9276829, 1, 0.9529412, 0, 1,
-0.9769144, 0.7464066, -0.3531742, 1, 0.9607843, 0, 1,
-0.9745588, -0.643942, -2.248145, 1, 0.9647059, 0, 1,
-0.9676901, -0.9290191, -4.118178, 1, 0.972549, 0, 1,
-0.9668981, -1.258961, -5.558238, 1, 0.9764706, 0, 1,
-0.9643145, -0.01225374, -1.987845, 1, 0.9843137, 0, 1,
-0.9632809, -0.6983613, -2.816172, 1, 0.9882353, 0, 1,
-0.9544001, 1.456147, -1.500362, 1, 0.9960784, 0, 1,
-0.9542363, -0.2986256, -1.872438, 0.9960784, 1, 0, 1,
-0.9531623, -0.4819033, -3.482845, 0.9921569, 1, 0, 1,
-0.9530313, -0.08956251, -0.5595551, 0.9843137, 1, 0, 1,
-0.949632, 0.1648994, -1.093939, 0.9803922, 1, 0, 1,
-0.9495376, 0.2606634, -2.022036, 0.972549, 1, 0, 1,
-0.9308846, -0.07992689, -0.8012867, 0.9686275, 1, 0, 1,
-0.9292401, 0.119462, -1.147464, 0.9607843, 1, 0, 1,
-0.9281385, -0.07721506, -1.467417, 0.9568627, 1, 0, 1,
-0.9244533, 0.1124188, 0.930471, 0.9490196, 1, 0, 1,
-0.9156136, 0.6527361, -1.509061, 0.945098, 1, 0, 1,
-0.913256, 0.3114656, -1.39751, 0.9372549, 1, 0, 1,
-0.9118789, 0.3287453, -2.01136, 0.9333333, 1, 0, 1,
-0.9113476, -0.6637582, -4.788328, 0.9254902, 1, 0, 1,
-0.9090208, -2.020131, -1.579209, 0.9215686, 1, 0, 1,
-0.9088399, 1.096206, -0.05073202, 0.9137255, 1, 0, 1,
-0.904192, -0.5993044, -2.800457, 0.9098039, 1, 0, 1,
-0.8998284, -0.6478115, -2.239409, 0.9019608, 1, 0, 1,
-0.8994489, -0.7005264, -2.255978, 0.8941177, 1, 0, 1,
-0.8962315, 1.788667, 0.6137269, 0.8901961, 1, 0, 1,
-0.8961816, -0.6524399, 0.4235897, 0.8823529, 1, 0, 1,
-0.8946221, -1.162996, -2.274942, 0.8784314, 1, 0, 1,
-0.8925069, -0.04197457, -0.9289041, 0.8705882, 1, 0, 1,
-0.8917422, 0.05001422, 0.2767582, 0.8666667, 1, 0, 1,
-0.8883923, -1.25407, -4.536501, 0.8588235, 1, 0, 1,
-0.8859288, 0.4909402, -1.408689, 0.854902, 1, 0, 1,
-0.8847512, 0.3558165, 0.7074163, 0.8470588, 1, 0, 1,
-0.8828898, 1.215272, -0.8770754, 0.8431373, 1, 0, 1,
-0.8791631, 0.9742398, 1.634379, 0.8352941, 1, 0, 1,
-0.8758414, -1.349092, -3.978248, 0.8313726, 1, 0, 1,
-0.8709052, -0.4104657, -1.926548, 0.8235294, 1, 0, 1,
-0.8607554, 0.9708218, -1.121436, 0.8196079, 1, 0, 1,
-0.8581791, -0.0977487, -1.20565, 0.8117647, 1, 0, 1,
-0.8559076, -1.538612, -2.361498, 0.8078431, 1, 0, 1,
-0.8541665, 1.425526, 0.3110644, 0.8, 1, 0, 1,
-0.8540853, -0.2974904, -2.964476, 0.7921569, 1, 0, 1,
-0.8493331, 0.191361, 1.117406, 0.7882353, 1, 0, 1,
-0.8479938, 1.287298, -1.625569, 0.7803922, 1, 0, 1,
-0.8421849, -1.021129, -1.614786, 0.7764706, 1, 0, 1,
-0.831478, -1.293683, -2.424849, 0.7686275, 1, 0, 1,
-0.8294736, 0.6616259, -1.27638, 0.7647059, 1, 0, 1,
-0.8293038, -0.3461004, -0.3710234, 0.7568628, 1, 0, 1,
-0.8246943, 0.05015175, -1.923009, 0.7529412, 1, 0, 1,
-0.8207843, 0.9265163, -1.659512, 0.7450981, 1, 0, 1,
-0.8176901, -1.257852, -3.997857, 0.7411765, 1, 0, 1,
-0.8175709, 0.5476746, -1.447711, 0.7333333, 1, 0, 1,
-0.8107553, 0.3299847, -0.7627105, 0.7294118, 1, 0, 1,
-0.8035197, 0.2055899, -1.563082, 0.7215686, 1, 0, 1,
-0.803158, -1.107606, -2.717657, 0.7176471, 1, 0, 1,
-0.8014373, 0.2291646, -2.80823, 0.7098039, 1, 0, 1,
-0.7953202, 0.3126731, -2.020713, 0.7058824, 1, 0, 1,
-0.7941089, -0.8642763, -3.384354, 0.6980392, 1, 0, 1,
-0.7923013, 1.083925, 0.3671024, 0.6901961, 1, 0, 1,
-0.7827648, 0.7952969, -2.411313, 0.6862745, 1, 0, 1,
-0.7796519, -0.09312045, -2.497067, 0.6784314, 1, 0, 1,
-0.7776588, -0.1356459, -3.843983, 0.6745098, 1, 0, 1,
-0.7770501, -0.1317161, 0.6408858, 0.6666667, 1, 0, 1,
-0.7729493, 1.26119, -0.651039, 0.6627451, 1, 0, 1,
-0.7715666, 0.9084981, -0.9591635, 0.654902, 1, 0, 1,
-0.7683835, 0.6732414, -1.022271, 0.6509804, 1, 0, 1,
-0.7667159, 0.3884672, -2.416346, 0.6431373, 1, 0, 1,
-0.7649168, 0.05534339, -1.294661, 0.6392157, 1, 0, 1,
-0.7642315, 0.5719314, -2.608307, 0.6313726, 1, 0, 1,
-0.7626584, 1.818654, -1.622751, 0.627451, 1, 0, 1,
-0.7598481, -0.7802361, -4.33814, 0.6196079, 1, 0, 1,
-0.7514346, -0.9974389, -2.869559, 0.6156863, 1, 0, 1,
-0.7478795, 0.5774657, -1.02894, 0.6078432, 1, 0, 1,
-0.7476759, -1.313641, -2.119216, 0.6039216, 1, 0, 1,
-0.7467464, 0.7871992, -0.9431221, 0.5960785, 1, 0, 1,
-0.7452534, -0.6378903, -1.420237, 0.5882353, 1, 0, 1,
-0.7390758, -0.3751993, -3.113982, 0.5843138, 1, 0, 1,
-0.7368627, -1.219289, -1.210958, 0.5764706, 1, 0, 1,
-0.7329805, 0.4522938, -1.083457, 0.572549, 1, 0, 1,
-0.732873, -0.6915653, -2.287169, 0.5647059, 1, 0, 1,
-0.7312219, 1.337633, -1.827477, 0.5607843, 1, 0, 1,
-0.7284352, -0.2301331, -2.072981, 0.5529412, 1, 0, 1,
-0.7064168, 0.7514338, -0.2114869, 0.5490196, 1, 0, 1,
-0.704996, 0.03981698, -2.25143, 0.5411765, 1, 0, 1,
-0.7014465, -0.2599239, -3.589235, 0.5372549, 1, 0, 1,
-0.6995715, -0.9544069, -0.7579492, 0.5294118, 1, 0, 1,
-0.6904123, 0.6259755, -1.935153, 0.5254902, 1, 0, 1,
-0.6871735, 0.5325242, -3.324615, 0.5176471, 1, 0, 1,
-0.6791265, -2.432762, -3.916835, 0.5137255, 1, 0, 1,
-0.6759788, 1.224252, -1.515099, 0.5058824, 1, 0, 1,
-0.6704589, 1.543056, 0.8099693, 0.5019608, 1, 0, 1,
-0.6698744, 1.34317, 0.614287, 0.4941176, 1, 0, 1,
-0.6673793, -0.6229521, -3.092317, 0.4862745, 1, 0, 1,
-0.6664284, 0.006205746, 0.0777853, 0.4823529, 1, 0, 1,
-0.6641114, 1.283373, 0.5763262, 0.4745098, 1, 0, 1,
-0.6638206, -0.8674034, -2.353341, 0.4705882, 1, 0, 1,
-0.65748, 0.06406128, -1.033232, 0.4627451, 1, 0, 1,
-0.636834, 1.568521, 0.2111942, 0.4588235, 1, 0, 1,
-0.6344008, -0.2477423, -0.5480222, 0.4509804, 1, 0, 1,
-0.634267, -1.340245, -1.745019, 0.4470588, 1, 0, 1,
-0.6336217, -0.6788123, -3.04661, 0.4392157, 1, 0, 1,
-0.6334617, 1.096595, -1.03874, 0.4352941, 1, 0, 1,
-0.6323301, 0.9911888, -1.658384, 0.427451, 1, 0, 1,
-0.6309004, 1.109599, -0.2179054, 0.4235294, 1, 0, 1,
-0.6285046, -0.3758761, -1.8781, 0.4156863, 1, 0, 1,
-0.6262777, 0.1514243, -1.221564, 0.4117647, 1, 0, 1,
-0.625461, -0.2108908, -2.839685, 0.4039216, 1, 0, 1,
-0.6232511, 2.326491, -1.187783, 0.3960784, 1, 0, 1,
-0.6232421, -1.345748, -3.345294, 0.3921569, 1, 0, 1,
-0.621655, -0.4512448, -2.255332, 0.3843137, 1, 0, 1,
-0.6198556, -0.9340503, -3.032763, 0.3803922, 1, 0, 1,
-0.6195409, 0.6773997, -1.202269, 0.372549, 1, 0, 1,
-0.6141716, -1.147284, -1.839861, 0.3686275, 1, 0, 1,
-0.6117823, -0.7246131, -3.969959, 0.3607843, 1, 0, 1,
-0.6105589, 1.908949, 1.738207, 0.3568628, 1, 0, 1,
-0.6099377, -0.04043293, -0.8052548, 0.3490196, 1, 0, 1,
-0.6094731, -0.0410222, -0.4454576, 0.345098, 1, 0, 1,
-0.6044844, 2.492809, -0.03485435, 0.3372549, 1, 0, 1,
-0.5915632, -0.09175593, -2.885489, 0.3333333, 1, 0, 1,
-0.5911486, 0.3917236, 0.3540908, 0.3254902, 1, 0, 1,
-0.5891581, -0.372736, -3.37734, 0.3215686, 1, 0, 1,
-0.5885289, 0.5296252, -2.22757, 0.3137255, 1, 0, 1,
-0.5841749, -0.1634527, -0.9878812, 0.3098039, 1, 0, 1,
-0.5793383, 1.450519, -1.041219, 0.3019608, 1, 0, 1,
-0.5785948, 0.8296093, 0.5562503, 0.2941177, 1, 0, 1,
-0.5772277, -0.2453893, -0.7483934, 0.2901961, 1, 0, 1,
-0.5696653, -0.0905616, -0.8631332, 0.282353, 1, 0, 1,
-0.5670853, 0.6299252, 1.541152, 0.2784314, 1, 0, 1,
-0.5582982, -0.4099748, -2.533051, 0.2705882, 1, 0, 1,
-0.5576945, 0.5777537, -3.476047, 0.2666667, 1, 0, 1,
-0.5570945, 0.957709, -0.9417505, 0.2588235, 1, 0, 1,
-0.5474849, 0.1959459, -1.521413, 0.254902, 1, 0, 1,
-0.544493, -0.9865036, -3.807665, 0.2470588, 1, 0, 1,
-0.5362532, 1.42021, -0.1335738, 0.2431373, 1, 0, 1,
-0.5320095, -0.145288, -1.427561, 0.2352941, 1, 0, 1,
-0.5254334, -0.07780132, -3.455074, 0.2313726, 1, 0, 1,
-0.5148436, 0.7177742, 0.6390526, 0.2235294, 1, 0, 1,
-0.5131794, -0.6826259, -2.529611, 0.2196078, 1, 0, 1,
-0.5127426, -1.620273, -3.475254, 0.2117647, 1, 0, 1,
-0.5123748, -0.2717395, -3.081694, 0.2078431, 1, 0, 1,
-0.5108827, -0.9072164, -3.096588, 0.2, 1, 0, 1,
-0.5070382, -0.6163539, -0.4222234, 0.1921569, 1, 0, 1,
-0.5070122, -0.3230316, -1.910924, 0.1882353, 1, 0, 1,
-0.5041856, -0.3772144, -1.957318, 0.1803922, 1, 0, 1,
-0.5035178, -1.079994, -2.174789, 0.1764706, 1, 0, 1,
-0.5001811, -2.195175, -2.14037, 0.1686275, 1, 0, 1,
-0.4985772, 0.5807429, -1.068468, 0.1647059, 1, 0, 1,
-0.4975269, 0.9048243, -0.5762095, 0.1568628, 1, 0, 1,
-0.496329, 0.6641275, -2.358797, 0.1529412, 1, 0, 1,
-0.4933117, -0.3284506, -1.816268, 0.145098, 1, 0, 1,
-0.4913777, 0.8293114, -0.7511905, 0.1411765, 1, 0, 1,
-0.4878693, 0.2748227, -2.079469, 0.1333333, 1, 0, 1,
-0.4850463, -1.2221, -3.229043, 0.1294118, 1, 0, 1,
-0.4842266, -2.967711, -3.410788, 0.1215686, 1, 0, 1,
-0.4821007, 0.6589865, -0.02326608, 0.1176471, 1, 0, 1,
-0.4758571, 0.630136, 0.400612, 0.1098039, 1, 0, 1,
-0.4697359, 0.909366, 0.583762, 0.1058824, 1, 0, 1,
-0.4665691, -0.09376241, -2.55888, 0.09803922, 1, 0, 1,
-0.4663612, 0.5109157, -2.35621, 0.09019608, 1, 0, 1,
-0.4651837, 1.100806, -0.2791231, 0.08627451, 1, 0, 1,
-0.4648373, 0.3091151, -1.630735, 0.07843138, 1, 0, 1,
-0.4627436, 0.5855664, -1.803303, 0.07450981, 1, 0, 1,
-0.4619321, 0.2616699, -0.5896629, 0.06666667, 1, 0, 1,
-0.4569466, 0.3639597, 0.4014276, 0.0627451, 1, 0, 1,
-0.4489163, -1.30442, -2.882208, 0.05490196, 1, 0, 1,
-0.445272, -0.4592435, -3.089473, 0.05098039, 1, 0, 1,
-0.4363539, -0.1359081, -2.55995, 0.04313726, 1, 0, 1,
-0.4355196, -0.1553228, -3.182507, 0.03921569, 1, 0, 1,
-0.4338204, 1.040915, 0.12927, 0.03137255, 1, 0, 1,
-0.430409, 2.238933, -1.006315, 0.02745098, 1, 0, 1,
-0.4297796, -0.3587026, -2.475078, 0.01960784, 1, 0, 1,
-0.4278606, -0.439207, -2.94304, 0.01568628, 1, 0, 1,
-0.4221689, -0.556249, -3.095691, 0.007843138, 1, 0, 1,
-0.421427, 0.9552094, 0.05313071, 0.003921569, 1, 0, 1,
-0.418954, 0.387198, -1.532286, 0, 1, 0.003921569, 1,
-0.4170641, -0.6956235, -3.010962, 0, 1, 0.01176471, 1,
-0.4169241, 0.6121596, -0.05201337, 0, 1, 0.01568628, 1,
-0.4129519, -2.281695, -3.535643, 0, 1, 0.02352941, 1,
-0.4118071, 0.07670783, -1.072453, 0, 1, 0.02745098, 1,
-0.4115314, 0.3398515, -0.4457449, 0, 1, 0.03529412, 1,
-0.4065646, -0.9189133, -4.39592, 0, 1, 0.03921569, 1,
-0.4001004, -1.123999, -3.672491, 0, 1, 0.04705882, 1,
-0.3994241, 0.6711386, 1.006792, 0, 1, 0.05098039, 1,
-0.394978, -0.7693939, -3.603537, 0, 1, 0.05882353, 1,
-0.39497, 1.164153, -2.498195, 0, 1, 0.0627451, 1,
-0.3860278, 0.3180106, 0.8187165, 0, 1, 0.07058824, 1,
-0.3836118, 1.275795, 1.45131, 0, 1, 0.07450981, 1,
-0.3835295, -1.109545, -2.338361, 0, 1, 0.08235294, 1,
-0.3835015, -2.436503, -1.942319, 0, 1, 0.08627451, 1,
-0.381624, -0.618833, -1.61943, 0, 1, 0.09411765, 1,
-0.3815738, 0.9517305, 0.7307806, 0, 1, 0.1019608, 1,
-0.3805903, -1.535544, -3.638647, 0, 1, 0.1058824, 1,
-0.3800589, 0.1391521, -2.665293, 0, 1, 0.1137255, 1,
-0.3771095, 0.03456783, -2.990123, 0, 1, 0.1176471, 1,
-0.3764927, -0.7729636, -1.083169, 0, 1, 0.1254902, 1,
-0.3733968, 0.9703445, -0.402005, 0, 1, 0.1294118, 1,
-0.3733922, 0.3592968, 0.3140763, 0, 1, 0.1372549, 1,
-0.3713725, -1.16302, -2.876833, 0, 1, 0.1411765, 1,
-0.371208, 1.30076, -0.4278303, 0, 1, 0.1490196, 1,
-0.3682237, 1.170891, -1.787118, 0, 1, 0.1529412, 1,
-0.3681679, -2.46212, -3.517206, 0, 1, 0.1607843, 1,
-0.359132, 0.1973382, 0.4746035, 0, 1, 0.1647059, 1,
-0.3578861, 0.3612747, -2.417854, 0, 1, 0.172549, 1,
-0.3547648, -1.510306, -1.951226, 0, 1, 0.1764706, 1,
-0.3519928, -1.184464, -4.271279, 0, 1, 0.1843137, 1,
-0.3370012, -0.3341057, -2.022874, 0, 1, 0.1882353, 1,
-0.3350717, 0.9792869, 0.4892274, 0, 1, 0.1960784, 1,
-0.3343472, -0.5454965, -3.019505, 0, 1, 0.2039216, 1,
-0.3270863, 0.4150187, -1.404142, 0, 1, 0.2078431, 1,
-0.3237644, 1.727688, -0.9342499, 0, 1, 0.2156863, 1,
-0.3237519, 2.132014, -0.4336839, 0, 1, 0.2196078, 1,
-0.3218277, 0.1289557, 0.4553649, 0, 1, 0.227451, 1,
-0.3218255, -0.100386, -0.8755258, 0, 1, 0.2313726, 1,
-0.3217092, -0.08154459, -0.3194703, 0, 1, 0.2392157, 1,
-0.3163127, 1.475896, 0.1327889, 0, 1, 0.2431373, 1,
-0.3107765, 1.400018, 1.04485, 0, 1, 0.2509804, 1,
-0.3106032, -1.334354, -4.038834, 0, 1, 0.254902, 1,
-0.3076773, -0.2658373, -1.316255, 0, 1, 0.2627451, 1,
-0.3058659, -0.1837861, -1.048532, 0, 1, 0.2666667, 1,
-0.2960803, -0.2900003, -3.759584, 0, 1, 0.2745098, 1,
-0.2947107, 0.1370354, -1.432877, 0, 1, 0.2784314, 1,
-0.2938648, 0.5584368, 1.269037, 0, 1, 0.2862745, 1,
-0.2922756, -0.9093512, -0.6035816, 0, 1, 0.2901961, 1,
-0.2921127, -1.037949, -3.568253, 0, 1, 0.2980392, 1,
-0.2892296, -0.0333745, -2.92748, 0, 1, 0.3058824, 1,
-0.2784832, 0.9141408, 0.1276533, 0, 1, 0.3098039, 1,
-0.2781418, 1.985637, 0.6097695, 0, 1, 0.3176471, 1,
-0.2739192, 0.6893361, 2.004837, 0, 1, 0.3215686, 1,
-0.2724056, -0.1522387, -1.871444, 0, 1, 0.3294118, 1,
-0.2716141, 0.6781553, -0.2568572, 0, 1, 0.3333333, 1,
-0.2623198, -0.7763811, -5.699187, 0, 1, 0.3411765, 1,
-0.2611747, -0.8789637, -4.079351, 0, 1, 0.345098, 1,
-0.2594422, -1.302646, -4.192674, 0, 1, 0.3529412, 1,
-0.2552609, 1.421884, -0.6112653, 0, 1, 0.3568628, 1,
-0.2504132, 0.2767457, -1.057431, 0, 1, 0.3647059, 1,
-0.2496789, 1.307223, -1.404218, 0, 1, 0.3686275, 1,
-0.2475487, 0.4692191, -0.06288148, 0, 1, 0.3764706, 1,
-0.2474369, -1.63077, -2.289751, 0, 1, 0.3803922, 1,
-0.2472278, 0.5362028, 0.5429559, 0, 1, 0.3882353, 1,
-0.247181, -1.25398, -3.24144, 0, 1, 0.3921569, 1,
-0.2470378, 1.676789, 0.635049, 0, 1, 0.4, 1,
-0.2462293, -0.9247062, -3.255393, 0, 1, 0.4078431, 1,
-0.2461128, 0.7347777, -0.108054, 0, 1, 0.4117647, 1,
-0.2445198, -1.34256, -1.696053, 0, 1, 0.4196078, 1,
-0.2386624, 0.08259555, -0.4492213, 0, 1, 0.4235294, 1,
-0.2365104, -0.1687048, -0.5714005, 0, 1, 0.4313726, 1,
-0.2305109, -0.1813031, -3.761457, 0, 1, 0.4352941, 1,
-0.2304778, 1.358594, 0.9099794, 0, 1, 0.4431373, 1,
-0.2294677, -1.075342, -2.716557, 0, 1, 0.4470588, 1,
-0.2284246, -0.8634132, -3.157282, 0, 1, 0.454902, 1,
-0.227037, 1.90061, 1.45663, 0, 1, 0.4588235, 1,
-0.222854, -0.9595408, -2.295895, 0, 1, 0.4666667, 1,
-0.2209407, 0.6644835, -0.7907553, 0, 1, 0.4705882, 1,
-0.2204455, 1.600959, 1.090044, 0, 1, 0.4784314, 1,
-0.2199147, -1.744932, -4.266344, 0, 1, 0.4823529, 1,
-0.2197025, -1.646474, -3.093681, 0, 1, 0.4901961, 1,
-0.2194802, -2.333217, -4.358269, 0, 1, 0.4941176, 1,
-0.2186577, 0.6756366, -0.4606147, 0, 1, 0.5019608, 1,
-0.2173428, 0.8709198, -1.394089, 0, 1, 0.509804, 1,
-0.2163701, -0.6922624, -2.400962, 0, 1, 0.5137255, 1,
-0.2083065, 0.2300062, -0.6462553, 0, 1, 0.5215687, 1,
-0.2078671, -0.5742938, -2.403541, 0, 1, 0.5254902, 1,
-0.2040826, 1.687423, -0.3822005, 0, 1, 0.5333334, 1,
-0.2024793, -0.7640918, -2.576052, 0, 1, 0.5372549, 1,
-0.2016937, -0.6267282, -4.457987, 0, 1, 0.5450981, 1,
-0.1998056, 1.911346, -0.6621166, 0, 1, 0.5490196, 1,
-0.1974465, -0.1673605, -2.823879, 0, 1, 0.5568628, 1,
-0.1972449, 0.1889656, -2.137439, 0, 1, 0.5607843, 1,
-0.1937917, -1.405071, -2.146399, 0, 1, 0.5686275, 1,
-0.1912861, -0.9352889, -1.254006, 0, 1, 0.572549, 1,
-0.1884179, -0.9597242, -2.985932, 0, 1, 0.5803922, 1,
-0.183587, 1.491524, -0.5777265, 0, 1, 0.5843138, 1,
-0.1825553, 0.3868004, -0.7182947, 0, 1, 0.5921569, 1,
-0.182417, 1.409956, 0.1358294, 0, 1, 0.5960785, 1,
-0.1824133, 0.8896424, -1.348637, 0, 1, 0.6039216, 1,
-0.1816882, -2.233828, -4.758036, 0, 1, 0.6117647, 1,
-0.1812207, -0.6477318, -3.264834, 0, 1, 0.6156863, 1,
-0.1800998, -1.331163, -2.923078, 0, 1, 0.6235294, 1,
-0.1797108, -0.1319038, -1.568485, 0, 1, 0.627451, 1,
-0.1792219, -0.489315, -1.582342, 0, 1, 0.6352941, 1,
-0.1789751, 1.14929, -1.42184, 0, 1, 0.6392157, 1,
-0.1736207, -1.451111, -3.233258, 0, 1, 0.6470588, 1,
-0.170516, -3.164456, -2.78542, 0, 1, 0.6509804, 1,
-0.1691565, 1.20532, -0.8250906, 0, 1, 0.6588235, 1,
-0.1686554, -1.526706, -1.976578, 0, 1, 0.6627451, 1,
-0.1681881, 0.08066116, -1.04936, 0, 1, 0.6705883, 1,
-0.1653768, -1.007296, -1.578344, 0, 1, 0.6745098, 1,
-0.1588011, -1.068838, -4.434046, 0, 1, 0.682353, 1,
-0.153803, -0.2119972, -1.993813, 0, 1, 0.6862745, 1,
-0.1451774, -0.3411703, -2.717535, 0, 1, 0.6941177, 1,
-0.1388413, -0.6262078, -2.052354, 0, 1, 0.7019608, 1,
-0.1379702, -1.15172, -2.796727, 0, 1, 0.7058824, 1,
-0.1356943, 2.569676, 1.758382, 0, 1, 0.7137255, 1,
-0.134929, -0.4617921, -1.571139, 0, 1, 0.7176471, 1,
-0.1345228, 0.8340935, -0.9172666, 0, 1, 0.7254902, 1,
-0.1325701, -0.9541438, -4.329628, 0, 1, 0.7294118, 1,
-0.1319133, 1.51111, 0.2824565, 0, 1, 0.7372549, 1,
-0.1280125, 0.6587244, 0.2768222, 0, 1, 0.7411765, 1,
-0.1279753, 0.183677, -0.1585351, 0, 1, 0.7490196, 1,
-0.1278735, -0.3823811, -0.9545953, 0, 1, 0.7529412, 1,
-0.1246811, 0.1467024, -1.783199, 0, 1, 0.7607843, 1,
-0.1228603, 0.2071265, 1.189403, 0, 1, 0.7647059, 1,
-0.1228152, -1.42302, -3.985015, 0, 1, 0.772549, 1,
-0.1195969, 0.02623178, -1.897208, 0, 1, 0.7764706, 1,
-0.1177439, -0.9300027, -4.324656, 0, 1, 0.7843137, 1,
-0.116491, -0.5775894, -4.312982, 0, 1, 0.7882353, 1,
-0.1155095, -1.385734, -1.961159, 0, 1, 0.7960784, 1,
-0.1134984, -1.496251, -2.565537, 0, 1, 0.8039216, 1,
-0.1080053, 1.102091, -1.023647, 0, 1, 0.8078431, 1,
-0.1070176, -1.078923, -5.632256, 0, 1, 0.8156863, 1,
-0.1032947, -0.8010748, -2.051986, 0, 1, 0.8196079, 1,
-0.100821, -0.5827405, -2.477994, 0, 1, 0.827451, 1,
-0.09682985, -0.831672, -3.594434, 0, 1, 0.8313726, 1,
-0.09340572, -0.3059703, -1.903808, 0, 1, 0.8392157, 1,
-0.09187324, -2.082486, -2.101087, 0, 1, 0.8431373, 1,
-0.09108049, -2.084229, -2.822657, 0, 1, 0.8509804, 1,
-0.09022215, 0.4424927, -0.5637579, 0, 1, 0.854902, 1,
-0.08968556, -0.4274054, -3.50926, 0, 1, 0.8627451, 1,
-0.08947906, 0.7778249, 1.41094, 0, 1, 0.8666667, 1,
-0.08677015, -0.1686437, -3.354568, 0, 1, 0.8745098, 1,
-0.08409086, -0.464245, -3.613692, 0, 1, 0.8784314, 1,
-0.08394091, 0.706372, 1.7255, 0, 1, 0.8862745, 1,
-0.08023816, 0.1010087, 0.2097827, 0, 1, 0.8901961, 1,
-0.07959566, 0.7088451, 0.3616047, 0, 1, 0.8980392, 1,
-0.07958713, 0.826928, 1.24911, 0, 1, 0.9058824, 1,
-0.07788029, 0.6082132, 0.958584, 0, 1, 0.9098039, 1,
-0.07376279, 1.145294, -0.216744, 0, 1, 0.9176471, 1,
-0.07026531, 0.2964422, -0.4620357, 0, 1, 0.9215686, 1,
-0.06766453, 0.4945664, 1.204356, 0, 1, 0.9294118, 1,
-0.0623218, 0.4843626, -0.7373946, 0, 1, 0.9333333, 1,
-0.06122798, 0.4670388, 1.422236, 0, 1, 0.9411765, 1,
-0.06069832, 0.07527173, -0.6435021, 0, 1, 0.945098, 1,
-0.05931485, 0.289076, -0.7368407, 0, 1, 0.9529412, 1,
-0.0554427, 1.824643, -0.1082256, 0, 1, 0.9568627, 1,
-0.05476194, -1.588941, -3.637475, 0, 1, 0.9647059, 1,
-0.04390055, -0.7343594, -3.231347, 0, 1, 0.9686275, 1,
-0.04369594, 1.863463, -0.7152444, 0, 1, 0.9764706, 1,
-0.04360939, 0.01640812, -1.710327, 0, 1, 0.9803922, 1,
-0.04215911, 0.155916, 2.097562, 0, 1, 0.9882353, 1,
-0.04173697, 0.001079859, -2.697212, 0, 1, 0.9921569, 1,
-0.0402818, 0.9104419, -1.000794, 0, 1, 1, 1,
-0.03880686, -1.274477, -4.189921, 0, 0.9921569, 1, 1,
-0.03781648, -0.5734593, -2.811392, 0, 0.9882353, 1, 1,
-0.03735251, 1.32663, 0.3397264, 0, 0.9803922, 1, 1,
-0.03612106, 0.471353, 1.900002, 0, 0.9764706, 1, 1,
-0.03169515, -1.085419, -2.455539, 0, 0.9686275, 1, 1,
-0.0297387, 0.902987, -0.5854278, 0, 0.9647059, 1, 1,
-0.02969046, -0.7298933, -3.156249, 0, 0.9568627, 1, 1,
-0.02892568, -2.119042, -2.407916, 0, 0.9529412, 1, 1,
-0.02888002, 0.8126974, -0.02452146, 0, 0.945098, 1, 1,
-0.02301311, 1.004123, -2.517852, 0, 0.9411765, 1, 1,
-0.02278314, 0.870275, -2.117429, 0, 0.9333333, 1, 1,
-0.01465258, 0.4760726, -1.284546, 0, 0.9294118, 1, 1,
-0.01337455, -0.1531977, -1.549486, 0, 0.9215686, 1, 1,
-0.003022076, -0.04897316, -3.250341, 0, 0.9176471, 1, 1,
0.004267432, 0.6708208, 0.9406299, 0, 0.9098039, 1, 1,
0.004775659, -0.1731041, 3.488959, 0, 0.9058824, 1, 1,
0.005429633, 0.7235162, 1.173671, 0, 0.8980392, 1, 1,
0.01158399, 0.9581522, -0.5644916, 0, 0.8901961, 1, 1,
0.01344238, -0.107439, 2.385289, 0, 0.8862745, 1, 1,
0.014664, 1.073161, -0.574278, 0, 0.8784314, 1, 1,
0.01472771, -1.328706, 2.998392, 0, 0.8745098, 1, 1,
0.01984336, -1.643189, 3.005038, 0, 0.8666667, 1, 1,
0.02429478, -1.046992, 0.5972329, 0, 0.8627451, 1, 1,
0.02690451, 0.712837, 0.1462977, 0, 0.854902, 1, 1,
0.03409633, -1.727819, 2.94996, 0, 0.8509804, 1, 1,
0.03908724, 0.9766104, 1.796952, 0, 0.8431373, 1, 1,
0.0405424, 1.561938, 0.4686637, 0, 0.8392157, 1, 1,
0.04096361, 0.5269703, -0.9886072, 0, 0.8313726, 1, 1,
0.04217967, 0.454926, -0.3731291, 0, 0.827451, 1, 1,
0.04434502, -0.6874156, 3.326779, 0, 0.8196079, 1, 1,
0.05004406, -1.651439, 1.690052, 0, 0.8156863, 1, 1,
0.05273498, 1.154313, 0.3449548, 0, 0.8078431, 1, 1,
0.05290823, -0.7347623, 1.688505, 0, 0.8039216, 1, 1,
0.05574581, -0.7704055, 3.209695, 0, 0.7960784, 1, 1,
0.05936439, 0.005644491, 0.7664734, 0, 0.7882353, 1, 1,
0.05951488, -0.7758602, 2.366077, 0, 0.7843137, 1, 1,
0.06017861, -1.625569, 3.833188, 0, 0.7764706, 1, 1,
0.0647447, 1.269145, -0.8931702, 0, 0.772549, 1, 1,
0.06563114, 1.572101, -0.09181301, 0, 0.7647059, 1, 1,
0.06832238, 0.07221086, 0.9698385, 0, 0.7607843, 1, 1,
0.07000092, -1.153613, 3.051703, 0, 0.7529412, 1, 1,
0.07100947, -0.8828139, 4.273069, 0, 0.7490196, 1, 1,
0.07163798, -0.2872572, 2.340799, 0, 0.7411765, 1, 1,
0.07846164, 0.09084571, 1.439354, 0, 0.7372549, 1, 1,
0.08171103, 1.636206, 0.278184, 0, 0.7294118, 1, 1,
0.08272506, -0.7637205, 4.319299, 0, 0.7254902, 1, 1,
0.08359818, -0.9151289, 2.518344, 0, 0.7176471, 1, 1,
0.08930042, -0.6716265, 4.03507, 0, 0.7137255, 1, 1,
0.08937589, 0.4144657, 0.5159636, 0, 0.7058824, 1, 1,
0.09426069, -0.08665124, 0.01252826, 0, 0.6980392, 1, 1,
0.1061613, 1.602076, -0.4806606, 0, 0.6941177, 1, 1,
0.1068898, 1.483146, 0.2848928, 0, 0.6862745, 1, 1,
0.1078525, -0.6615339, 1.505965, 0, 0.682353, 1, 1,
0.1094599, 0.6328434, 1.630605, 0, 0.6745098, 1, 1,
0.1095022, 1.119829, -0.9651817, 0, 0.6705883, 1, 1,
0.1135666, 1.503115, -0.387548, 0, 0.6627451, 1, 1,
0.1167152, -1.575643, 3.385382, 0, 0.6588235, 1, 1,
0.1192194, -0.2803307, 2.029673, 0, 0.6509804, 1, 1,
0.1238332, 2.834586, 1.171335, 0, 0.6470588, 1, 1,
0.1274754, -0.07982167, 2.661242, 0, 0.6392157, 1, 1,
0.1287121, -1.242633, 2.805984, 0, 0.6352941, 1, 1,
0.1295338, -1.710127, 2.024209, 0, 0.627451, 1, 1,
0.1325479, 0.07242434, 0.04993238, 0, 0.6235294, 1, 1,
0.1394147, 2.898487, 0.8879661, 0, 0.6156863, 1, 1,
0.1395654, 1.763949, 0.7429668, 0, 0.6117647, 1, 1,
0.1450178, -0.2950379, 2.877379, 0, 0.6039216, 1, 1,
0.145687, -0.6755586, 2.955442, 0, 0.5960785, 1, 1,
0.1480586, 1.521384, 0.5598027, 0, 0.5921569, 1, 1,
0.1487386, -0.2506494, 3.181808, 0, 0.5843138, 1, 1,
0.1531352, -0.1039511, 1.321942, 0, 0.5803922, 1, 1,
0.1533307, 0.4404061, -0.340211, 0, 0.572549, 1, 1,
0.1548885, 0.7454798, -0.1225107, 0, 0.5686275, 1, 1,
0.1629537, -0.4068019, 4.31435, 0, 0.5607843, 1, 1,
0.1638848, 0.2595932, 2.014447, 0, 0.5568628, 1, 1,
0.1688166, 1.050293, 0.1224029, 0, 0.5490196, 1, 1,
0.1721063, -0.1206606, 1.023922, 0, 0.5450981, 1, 1,
0.1741728, -0.0322395, 2.856144, 0, 0.5372549, 1, 1,
0.175109, 0.02727676, 1.169133, 0, 0.5333334, 1, 1,
0.1752309, -0.3197038, 2.478807, 0, 0.5254902, 1, 1,
0.1767363, -0.6005476, 3.325728, 0, 0.5215687, 1, 1,
0.180541, -0.9264449, 2.645459, 0, 0.5137255, 1, 1,
0.1846683, -0.004136394, 1.623378, 0, 0.509804, 1, 1,
0.1858453, -0.6699146, 2.338069, 0, 0.5019608, 1, 1,
0.1876241, 1.204002, 0.2888676, 0, 0.4941176, 1, 1,
0.188609, 0.07156224, 2.227978, 0, 0.4901961, 1, 1,
0.1917777, 1.239011, -0.5219459, 0, 0.4823529, 1, 1,
0.1939426, -1.162014, 4.877018, 0, 0.4784314, 1, 1,
0.1944586, 0.3683576, -0.124916, 0, 0.4705882, 1, 1,
0.1970447, -2.254907, 3.276941, 0, 0.4666667, 1, 1,
0.1977877, -1.075504, 3.448801, 0, 0.4588235, 1, 1,
0.1981823, 0.02546225, 1.556277, 0, 0.454902, 1, 1,
0.2043733, -0.1736902, 3.295694, 0, 0.4470588, 1, 1,
0.2044659, 0.8322755, 1.987343, 0, 0.4431373, 1, 1,
0.2121312, -0.7645833, 2.247221, 0, 0.4352941, 1, 1,
0.2137606, 0.8404787, -0.3554555, 0, 0.4313726, 1, 1,
0.2152403, 0.3955899, -1.003141, 0, 0.4235294, 1, 1,
0.2159382, 0.2057388, 1.799846, 0, 0.4196078, 1, 1,
0.2169058, -1.079237, 3.551689, 0, 0.4117647, 1, 1,
0.2175499, -0.3284246, 2.90622, 0, 0.4078431, 1, 1,
0.2277567, -0.6436482, 1.633702, 0, 0.4, 1, 1,
0.2278367, 2.216488, -0.8869805, 0, 0.3921569, 1, 1,
0.2304018, -1.149406, 2.416171, 0, 0.3882353, 1, 1,
0.2332519, 0.9132294, 0.7542681, 0, 0.3803922, 1, 1,
0.233423, -0.3319409, 2.878771, 0, 0.3764706, 1, 1,
0.2339642, -0.2564822, 1.509623, 0, 0.3686275, 1, 1,
0.2341015, 0.02325423, 1.651159, 0, 0.3647059, 1, 1,
0.234212, 1.245685, 1.32299, 0, 0.3568628, 1, 1,
0.2382936, -0.01092333, 3.586807, 0, 0.3529412, 1, 1,
0.2384901, 1.113829, 0.5063809, 0, 0.345098, 1, 1,
0.2393665, 1.002445, -0.729986, 0, 0.3411765, 1, 1,
0.239596, -0.5503864, 2.719113, 0, 0.3333333, 1, 1,
0.2405382, 0.073724, 2.168757, 0, 0.3294118, 1, 1,
0.2443591, -1.09617, 2.235688, 0, 0.3215686, 1, 1,
0.2451928, 0.469661, 0.7588867, 0, 0.3176471, 1, 1,
0.247455, 0.7657757, 0.06487779, 0, 0.3098039, 1, 1,
0.2554819, -0.0848883, 1.599886, 0, 0.3058824, 1, 1,
0.2640199, -0.01918879, 0.01927477, 0, 0.2980392, 1, 1,
0.2652141, 0.6731079, 0.1812239, 0, 0.2901961, 1, 1,
0.2659139, -0.827592, 2.774026, 0, 0.2862745, 1, 1,
0.2710006, 0.731142, -1.003154, 0, 0.2784314, 1, 1,
0.2723666, 1.834887, -1.538228, 0, 0.2745098, 1, 1,
0.2767631, -1.221508, 3.216401, 0, 0.2666667, 1, 1,
0.2842652, 0.8379856, 0.7679483, 0, 0.2627451, 1, 1,
0.2910791, 0.04963452, 2.18978, 0, 0.254902, 1, 1,
0.2976049, 0.3513934, 1.933948, 0, 0.2509804, 1, 1,
0.3021041, -1.219044, 3.015001, 0, 0.2431373, 1, 1,
0.3043962, -0.2596577, 3.030308, 0, 0.2392157, 1, 1,
0.304934, 0.7267524, -0.5430928, 0, 0.2313726, 1, 1,
0.3072096, 0.8668176, 2.137845, 0, 0.227451, 1, 1,
0.3084937, -0.2302268, 3.619773, 0, 0.2196078, 1, 1,
0.3085302, -1.18109, 3.44433, 0, 0.2156863, 1, 1,
0.3085365, 0.1385315, 1.571245, 0, 0.2078431, 1, 1,
0.3091814, -0.4652478, 1.502747, 0, 0.2039216, 1, 1,
0.311978, 0.428844, -0.3974658, 0, 0.1960784, 1, 1,
0.3149478, 0.2810509, 1.842176, 0, 0.1882353, 1, 1,
0.316924, -0.16231, 2.649103, 0, 0.1843137, 1, 1,
0.3191106, -1.204014, 3.953799, 0, 0.1764706, 1, 1,
0.3196153, -0.2746803, 2.430476, 0, 0.172549, 1, 1,
0.31981, 0.7497071, 0.1268385, 0, 0.1647059, 1, 1,
0.3213987, 3.069332, -0.8570605, 0, 0.1607843, 1, 1,
0.3214349, -1.156092, 3.573644, 0, 0.1529412, 1, 1,
0.3215159, -0.7124895, 3.93157, 0, 0.1490196, 1, 1,
0.3225483, 0.03699892, 1.667816, 0, 0.1411765, 1, 1,
0.3245464, 0.2045866, 0.1431085, 0, 0.1372549, 1, 1,
0.3246062, 0.3175, 3.32299, 0, 0.1294118, 1, 1,
0.3298814, -1.813495, 3.18752, 0, 0.1254902, 1, 1,
0.3302599, 0.4914711, -0.3708065, 0, 0.1176471, 1, 1,
0.333729, 1.109093, 0.8122617, 0, 0.1137255, 1, 1,
0.3372502, 1.226714, -1.033012, 0, 0.1058824, 1, 1,
0.3394195, 0.4415897, -0.5394322, 0, 0.09803922, 1, 1,
0.3409702, -0.4382768, 1.660804, 0, 0.09411765, 1, 1,
0.3412277, -0.7275426, 3.952752, 0, 0.08627451, 1, 1,
0.3450508, -0.140621, -0.7647091, 0, 0.08235294, 1, 1,
0.3460644, -0.3064281, 2.543945, 0, 0.07450981, 1, 1,
0.3462707, 0.8547228, -0.02072777, 0, 0.07058824, 1, 1,
0.3483818, -0.4665664, 2.389884, 0, 0.0627451, 1, 1,
0.351335, -0.5432876, 0.7912404, 0, 0.05882353, 1, 1,
0.3516694, -1.07596, 4.005251, 0, 0.05098039, 1, 1,
0.3526293, -1.338182, 3.16087, 0, 0.04705882, 1, 1,
0.3540917, 0.543816, 1.785975, 0, 0.03921569, 1, 1,
0.3556639, -0.5617537, 3.425093, 0, 0.03529412, 1, 1,
0.3592847, 1.663511, -0.3637153, 0, 0.02745098, 1, 1,
0.3606568, -0.1659368, 2.598838, 0, 0.02352941, 1, 1,
0.3627293, -0.3557456, 1.353707, 0, 0.01568628, 1, 1,
0.3627295, 0.4186129, -0.5630372, 0, 0.01176471, 1, 1,
0.3712061, 1.990197, 0.3259677, 0, 0.003921569, 1, 1,
0.3845906, -1.132563, 4.419195, 0.003921569, 0, 1, 1,
0.3865807, 1.102009, -1.26689, 0.007843138, 0, 1, 1,
0.387061, -0.8181143, 2.453323, 0.01568628, 0, 1, 1,
0.3893099, 0.6169341, -0.1919932, 0.01960784, 0, 1, 1,
0.3898562, -1.164356, 1.996921, 0.02745098, 0, 1, 1,
0.395168, 1.028371, -0.455859, 0.03137255, 0, 1, 1,
0.3974817, 1.410935, -0.02821084, 0.03921569, 0, 1, 1,
0.4049097, -0.3463868, 3.009218, 0.04313726, 0, 1, 1,
0.4055962, -0.5876881, 2.279395, 0.05098039, 0, 1, 1,
0.4085296, -0.8023165, 2.519606, 0.05490196, 0, 1, 1,
0.41004, -0.567345, 2.992567, 0.0627451, 0, 1, 1,
0.4100586, -1.274762, 3.3198, 0.06666667, 0, 1, 1,
0.41131, -0.9846258, 2.569218, 0.07450981, 0, 1, 1,
0.4218994, 1.149554, -0.778066, 0.07843138, 0, 1, 1,
0.4219332, -0.4744553, 3.838055, 0.08627451, 0, 1, 1,
0.426565, -1.635369, 4.163544, 0.09019608, 0, 1, 1,
0.4289761, 0.714068, -0.5212101, 0.09803922, 0, 1, 1,
0.429118, 0.1027466, 1.853384, 0.1058824, 0, 1, 1,
0.4298219, 0.8825385, -0.02761374, 0.1098039, 0, 1, 1,
0.4320597, -0.2762695, 2.062268, 0.1176471, 0, 1, 1,
0.4324019, -1.529942, 3.020075, 0.1215686, 0, 1, 1,
0.4345028, -1.651119, 2.919114, 0.1294118, 0, 1, 1,
0.4383216, 2.233974, -1.975149, 0.1333333, 0, 1, 1,
0.4426162, -1.048482, 2.671784, 0.1411765, 0, 1, 1,
0.4427466, -1.163242, 4.200866, 0.145098, 0, 1, 1,
0.4430495, 1.099361, 1.430129, 0.1529412, 0, 1, 1,
0.4454471, 0.01372008, -0.05176866, 0.1568628, 0, 1, 1,
0.450404, 0.00481772, 2.350287, 0.1647059, 0, 1, 1,
0.4508393, -1.552272, 3.110333, 0.1686275, 0, 1, 1,
0.4516048, -1.651132, 2.811137, 0.1764706, 0, 1, 1,
0.4534881, -0.3341239, 2.280336, 0.1803922, 0, 1, 1,
0.4560047, -1.685507, 1.830694, 0.1882353, 0, 1, 1,
0.456166, 0.5396199, 0.04613184, 0.1921569, 0, 1, 1,
0.4618318, -0.9818828, 4.208604, 0.2, 0, 1, 1,
0.4625829, 0.3095595, 0.1799426, 0.2078431, 0, 1, 1,
0.4626533, -0.3906805, 3.345488, 0.2117647, 0, 1, 1,
0.4631551, -0.01995158, 1.482171, 0.2196078, 0, 1, 1,
0.4664397, -0.9994726, 2.039299, 0.2235294, 0, 1, 1,
0.4671026, 0.1554942, 2.565706, 0.2313726, 0, 1, 1,
0.4706094, -0.4798903, 3.14903, 0.2352941, 0, 1, 1,
0.4768417, -0.12965, 1.547172, 0.2431373, 0, 1, 1,
0.4776366, -0.5478804, 2.773211, 0.2470588, 0, 1, 1,
0.4799969, 0.39223, -0.4552487, 0.254902, 0, 1, 1,
0.4860093, 0.259211, 0.006909001, 0.2588235, 0, 1, 1,
0.4864699, -0.1386581, 2.836337, 0.2666667, 0, 1, 1,
0.4876374, 0.747609, -0.4484603, 0.2705882, 0, 1, 1,
0.4905418, 1.293772, 2.675209, 0.2784314, 0, 1, 1,
0.4908056, 0.2556811, 1.269762, 0.282353, 0, 1, 1,
0.4942351, -1.949384, 3.827789, 0.2901961, 0, 1, 1,
0.4999049, 1.571566, -0.5800296, 0.2941177, 0, 1, 1,
0.5037904, 0.9279143, 0.4576988, 0.3019608, 0, 1, 1,
0.5043589, -0.9489075, 4.036497, 0.3098039, 0, 1, 1,
0.5122265, -0.9041674, 2.348969, 0.3137255, 0, 1, 1,
0.514664, 0.08861271, 0.9776257, 0.3215686, 0, 1, 1,
0.5187559, -0.1411337, 3.007107, 0.3254902, 0, 1, 1,
0.518837, 0.4684693, -0.1636131, 0.3333333, 0, 1, 1,
0.5225204, 1.526965, 0.8715975, 0.3372549, 0, 1, 1,
0.5262547, 0.1120812, 2.427875, 0.345098, 0, 1, 1,
0.529188, -0.214107, 0.2691453, 0.3490196, 0, 1, 1,
0.5342391, -0.6851795, 2.763287, 0.3568628, 0, 1, 1,
0.5403011, -0.05164616, 1.784171, 0.3607843, 0, 1, 1,
0.5455411, -1.210422, 3.301474, 0.3686275, 0, 1, 1,
0.5469271, 0.6010114, 1.018251, 0.372549, 0, 1, 1,
0.5470448, 0.5758984, 1.687578, 0.3803922, 0, 1, 1,
0.5511798, -0.277308, 3.681233, 0.3843137, 0, 1, 1,
0.5515201, -0.4274087, 2.61282, 0.3921569, 0, 1, 1,
0.5537513, 0.7115102, 0.6097593, 0.3960784, 0, 1, 1,
0.5568945, -1.196466, 2.37332, 0.4039216, 0, 1, 1,
0.5570821, -1.182842, 1.669426, 0.4117647, 0, 1, 1,
0.557638, -0.238342, 3.570763, 0.4156863, 0, 1, 1,
0.5616996, 0.5008928, 0.4947672, 0.4235294, 0, 1, 1,
0.5645651, 0.2247763, 1.309566, 0.427451, 0, 1, 1,
0.5671789, -1.146157, 2.923122, 0.4352941, 0, 1, 1,
0.5723215, -0.3538241, 1.532813, 0.4392157, 0, 1, 1,
0.5724577, 0.5514111, 0.8229203, 0.4470588, 0, 1, 1,
0.5725656, 0.4609362, 0.009162183, 0.4509804, 0, 1, 1,
0.5751255, 0.7405054, 0.008177892, 0.4588235, 0, 1, 1,
0.5832102, -0.8742887, 3.268494, 0.4627451, 0, 1, 1,
0.5833139, -0.2242439, 2.259917, 0.4705882, 0, 1, 1,
0.5867845, -0.03737528, 1.047608, 0.4745098, 0, 1, 1,
0.5881438, -1.796179, 2.314854, 0.4823529, 0, 1, 1,
0.5886846, -1.94532, 3.494691, 0.4862745, 0, 1, 1,
0.5887102, -1.8664, 1.530765, 0.4941176, 0, 1, 1,
0.591341, 0.2185889, 1.134303, 0.5019608, 0, 1, 1,
0.5944834, 0.3070202, 1.337217, 0.5058824, 0, 1, 1,
0.600181, -1.34206, 3.832178, 0.5137255, 0, 1, 1,
0.6018112, 0.7990894, 0.2238493, 0.5176471, 0, 1, 1,
0.6029803, -1.170618, 2.410959, 0.5254902, 0, 1, 1,
0.6044697, -0.2080806, 1.929785, 0.5294118, 0, 1, 1,
0.6057419, -0.3808036, 2.83559, 0.5372549, 0, 1, 1,
0.6075667, 0.2434634, 3.535261, 0.5411765, 0, 1, 1,
0.6083288, 0.1676543, 2.359543, 0.5490196, 0, 1, 1,
0.6196126, -0.5625573, 1.804437, 0.5529412, 0, 1, 1,
0.6298069, 1.028033, 0.9724823, 0.5607843, 0, 1, 1,
0.6324909, 0.04098452, 2.300532, 0.5647059, 0, 1, 1,
0.6326114, -1.458792, 2.941731, 0.572549, 0, 1, 1,
0.6363959, 1.285279, 1.217018, 0.5764706, 0, 1, 1,
0.6370705, 2.271497, -0.9092063, 0.5843138, 0, 1, 1,
0.6382943, -0.6497087, 1.768143, 0.5882353, 0, 1, 1,
0.6386306, -2.090995, 3.152076, 0.5960785, 0, 1, 1,
0.6411233, -1.390036, 3.506641, 0.6039216, 0, 1, 1,
0.6500647, -0.7360234, 2.229252, 0.6078432, 0, 1, 1,
0.6512752, -0.2537748, 2.673062, 0.6156863, 0, 1, 1,
0.657387, 1.109254, 1.101862, 0.6196079, 0, 1, 1,
0.658326, -0.1958668, 2.323448, 0.627451, 0, 1, 1,
0.6586922, 0.3160768, 1.488054, 0.6313726, 0, 1, 1,
0.6694426, -0.6207494, 2.959201, 0.6392157, 0, 1, 1,
0.6709661, -0.8626226, 1.897993, 0.6431373, 0, 1, 1,
0.6735855, 0.796667, 0.8229846, 0.6509804, 0, 1, 1,
0.6802318, -1.175977, 2.528826, 0.654902, 0, 1, 1,
0.6880253, -2.883955, 2.051846, 0.6627451, 0, 1, 1,
0.6938613, -0.213975, 3.768169, 0.6666667, 0, 1, 1,
0.7186363, -0.3144908, 1.209996, 0.6745098, 0, 1, 1,
0.7260609, 0.8338332, 0.3613525, 0.6784314, 0, 1, 1,
0.7261595, -1.409329, 1.977609, 0.6862745, 0, 1, 1,
0.7348805, 0.3677977, 0.5665728, 0.6901961, 0, 1, 1,
0.734928, 0.1280549, 2.227068, 0.6980392, 0, 1, 1,
0.7464835, -0.5738624, 1.410008, 0.7058824, 0, 1, 1,
0.746651, 1.443842, 0.2606809, 0.7098039, 0, 1, 1,
0.7475816, 0.8552675, 1.911747, 0.7176471, 0, 1, 1,
0.7477944, -0.5609461, 1.988446, 0.7215686, 0, 1, 1,
0.7533431, -0.3065755, 2.512479, 0.7294118, 0, 1, 1,
0.7571454, -0.3982878, 1.822607, 0.7333333, 0, 1, 1,
0.758411, -1.573126, 2.58035, 0.7411765, 0, 1, 1,
0.7620004, -0.8189089, 1.497761, 0.7450981, 0, 1, 1,
0.7639256, -0.04886101, 1.300885, 0.7529412, 0, 1, 1,
0.7701384, -1.256506, 3.440551, 0.7568628, 0, 1, 1,
0.7759886, 0.4429807, 0.557988, 0.7647059, 0, 1, 1,
0.776282, 1.583241, 1.881195, 0.7686275, 0, 1, 1,
0.7807557, -2.784678, 3.041396, 0.7764706, 0, 1, 1,
0.7824981, -0.4860381, 2.638359, 0.7803922, 0, 1, 1,
0.802003, 0.2633322, 0.7570089, 0.7882353, 0, 1, 1,
0.8080404, 1.442124, 0.3937459, 0.7921569, 0, 1, 1,
0.8122663, 1.608112, -0.6613615, 0.8, 0, 1, 1,
0.8126981, 0.5867781, 1.240201, 0.8078431, 0, 1, 1,
0.8134778, -3.34528, 2.861364, 0.8117647, 0, 1, 1,
0.8152404, 1.341769, 0.7034191, 0.8196079, 0, 1, 1,
0.8162804, 0.6359464, -0.8379587, 0.8235294, 0, 1, 1,
0.8251626, -0.1433635, 3.661088, 0.8313726, 0, 1, 1,
0.8284112, 1.037182, -0.346893, 0.8352941, 0, 1, 1,
0.8289033, 0.05853255, 2.202654, 0.8431373, 0, 1, 1,
0.8292219, -0.6523542, 1.80407, 0.8470588, 0, 1, 1,
0.8370826, -0.2594731, 1.322318, 0.854902, 0, 1, 1,
0.8389797, -1.408365, 3.943702, 0.8588235, 0, 1, 1,
0.8400438, 0.3132473, 1.189492, 0.8666667, 0, 1, 1,
0.8483977, 0.6434093, -0.2196076, 0.8705882, 0, 1, 1,
0.8510263, -0.07370005, 2.897499, 0.8784314, 0, 1, 1,
0.8513177, -0.02494375, 2.495966, 0.8823529, 0, 1, 1,
0.8628098, 0.1608773, 1.314421, 0.8901961, 0, 1, 1,
0.864476, -0.5085625, 2.24783, 0.8941177, 0, 1, 1,
0.8646501, -0.1540833, -0.398032, 0.9019608, 0, 1, 1,
0.8677987, -0.2591986, 0.8173929, 0.9098039, 0, 1, 1,
0.8731378, -0.6005542, 3.032544, 0.9137255, 0, 1, 1,
0.875533, 0.7595533, 2.089399, 0.9215686, 0, 1, 1,
0.8757984, 0.8632882, 0.03417404, 0.9254902, 0, 1, 1,
0.8758106, 1.747276, -0.0206549, 0.9333333, 0, 1, 1,
0.8758869, 0.727963, 1.002496, 0.9372549, 0, 1, 1,
0.8845142, 1.65313, 1.870924, 0.945098, 0, 1, 1,
0.8848473, 0.9552146, -0.2614477, 0.9490196, 0, 1, 1,
0.8946527, -2.112761, 2.423942, 0.9568627, 0, 1, 1,
0.9012851, 2.09751, 2.287105, 0.9607843, 0, 1, 1,
0.9052621, -0.578132, 2.39827, 0.9686275, 0, 1, 1,
0.9054794, -0.5019432, 1.545465, 0.972549, 0, 1, 1,
0.9083028, 0.2942156, 1.035451, 0.9803922, 0, 1, 1,
0.9114104, -0.3449441, -0.1183207, 0.9843137, 0, 1, 1,
0.9126518, -0.1183552, 2.09417, 0.9921569, 0, 1, 1,
0.9159989, 0.3063564, 0.6840301, 0.9960784, 0, 1, 1,
0.9165589, -0.3085163, 3.313943, 1, 0, 0.9960784, 1,
0.9166133, -1.162785, 1.540173, 1, 0, 0.9882353, 1,
0.9177524, -0.5941157, 2.438493, 1, 0, 0.9843137, 1,
0.9193459, 1.277913, 0.8180012, 1, 0, 0.9764706, 1,
0.921298, -1.077925, 3.075527, 1, 0, 0.972549, 1,
0.9222263, -0.4392646, 3.178458, 1, 0, 0.9647059, 1,
0.9280162, -0.8738774, 3.013104, 1, 0, 0.9607843, 1,
0.9302319, -0.8450558, 1.883107, 1, 0, 0.9529412, 1,
0.9355815, -0.4548585, 0.9605962, 1, 0, 0.9490196, 1,
0.9381241, 2.290851, 1.161501, 1, 0, 0.9411765, 1,
0.9558057, -0.2060942, 2.779578, 1, 0, 0.9372549, 1,
0.9578456, 0.0677892, 0.5079182, 1, 0, 0.9294118, 1,
0.9657915, -1.384769, 2.553204, 1, 0, 0.9254902, 1,
0.9695983, -1.56291, 2.040058, 1, 0, 0.9176471, 1,
0.9787416, -0.1739679, 1.412571, 1, 0, 0.9137255, 1,
0.9792901, -0.04460728, 2.105597, 1, 0, 0.9058824, 1,
0.9817235, -1.360705, 2.545062, 1, 0, 0.9019608, 1,
0.9833124, -0.6500918, 1.877718, 1, 0, 0.8941177, 1,
0.9841622, 0.01669811, 0.5505998, 1, 0, 0.8862745, 1,
0.991886, -2.344804, 1.713861, 1, 0, 0.8823529, 1,
0.999163, -0.9068546, 1.704858, 1, 0, 0.8745098, 1,
1.005336, -0.3673723, -0.01412739, 1, 0, 0.8705882, 1,
1.008379, -0.2213164, 3.715287, 1, 0, 0.8627451, 1,
1.014607, 0.8811795, 1.269459, 1, 0, 0.8588235, 1,
1.023323, -0.7816567, 1.404846, 1, 0, 0.8509804, 1,
1.025368, 0.7153168, 0.5276194, 1, 0, 0.8470588, 1,
1.028415, 0.1785779, 0.02418247, 1, 0, 0.8392157, 1,
1.029426, 0.90463, 2.102661, 1, 0, 0.8352941, 1,
1.03288, 0.384891, 1.502908, 1, 0, 0.827451, 1,
1.041853, -0.1134415, 1.259929, 1, 0, 0.8235294, 1,
1.044013, 0.5367415, 2.583955, 1, 0, 0.8156863, 1,
1.045329, -0.9097163, 1.787492, 1, 0, 0.8117647, 1,
1.061441, -2.155833, 1.157164, 1, 0, 0.8039216, 1,
1.061928, -1.134313, 3.124117, 1, 0, 0.7960784, 1,
1.062545, -1.291286, 2.309444, 1, 0, 0.7921569, 1,
1.068997, -1.630957, 2.571432, 1, 0, 0.7843137, 1,
1.070266, -0.07984968, 1.368058, 1, 0, 0.7803922, 1,
1.075954, -0.7847998, 2.140312, 1, 0, 0.772549, 1,
1.090775, 0.02260057, 2.390463, 1, 0, 0.7686275, 1,
1.095361, -0.5988623, 2.456417, 1, 0, 0.7607843, 1,
1.100761, 0.2405057, 0.3770354, 1, 0, 0.7568628, 1,
1.101728, -0.4615457, 0.9465353, 1, 0, 0.7490196, 1,
1.108842, 0.2104392, 0.6238897, 1, 0, 0.7450981, 1,
1.113262, 1.131501, 1.319393, 1, 0, 0.7372549, 1,
1.124347, 0.4026547, 1.916039, 1, 0, 0.7333333, 1,
1.130889, -0.2974422, 1.898012, 1, 0, 0.7254902, 1,
1.134256, 0.6411037, 0.2228374, 1, 0, 0.7215686, 1,
1.1414, -0.8493962, 2.502797, 1, 0, 0.7137255, 1,
1.141487, -0.8988989, 0.9483585, 1, 0, 0.7098039, 1,
1.145168, -0.2529446, 0.1810732, 1, 0, 0.7019608, 1,
1.145851, 0.4641078, 0.273152, 1, 0, 0.6941177, 1,
1.150064, -1.031513, 2.279957, 1, 0, 0.6901961, 1,
1.151134, -0.6410042, 2.572722, 1, 0, 0.682353, 1,
1.153434, -0.4761873, 2.939971, 1, 0, 0.6784314, 1,
1.170524, -1.317617, 1.596076, 1, 0, 0.6705883, 1,
1.177069, -0.9897245, 1.811262, 1, 0, 0.6666667, 1,
1.178718, -0.6268738, 1.668732, 1, 0, 0.6588235, 1,
1.179525, -1.759669, 3.815913, 1, 0, 0.654902, 1,
1.182088, -1.071555, 4.076244, 1, 0, 0.6470588, 1,
1.191327, -0.8945529, 0.2842473, 1, 0, 0.6431373, 1,
1.194942, -0.1868521, 2.144658, 1, 0, 0.6352941, 1,
1.199481, 0.4366523, 2.466182, 1, 0, 0.6313726, 1,
1.202013, -1.585912, 2.763678, 1, 0, 0.6235294, 1,
1.202354, 2.240038, 2.564729, 1, 0, 0.6196079, 1,
1.207991, 0.9922603, 0.9161999, 1, 0, 0.6117647, 1,
1.213972, 0.01932869, 0.5684289, 1, 0, 0.6078432, 1,
1.221528, 1.075773, 1.42379, 1, 0, 0.6, 1,
1.223858, 1.280143, 2.892989, 1, 0, 0.5921569, 1,
1.233997, -1.988415, 3.084234, 1, 0, 0.5882353, 1,
1.236046, 1.418785, 1.404077, 1, 0, 0.5803922, 1,
1.237327, -0.7000451, 1.909117, 1, 0, 0.5764706, 1,
1.250425, -0.5724717, 2.529361, 1, 0, 0.5686275, 1,
1.252044, -0.2070052, 2.425932, 1, 0, 0.5647059, 1,
1.252209, 0.2950667, 0.9551499, 1, 0, 0.5568628, 1,
1.254514, -0.3689927, 1.539257, 1, 0, 0.5529412, 1,
1.255727, -0.2251733, 1.433294, 1, 0, 0.5450981, 1,
1.260037, -1.573044, 1.808515, 1, 0, 0.5411765, 1,
1.268597, -0.4490308, 1.515467, 1, 0, 0.5333334, 1,
1.274969, -1.882533, 3.07394, 1, 0, 0.5294118, 1,
1.276976, -0.161158, 1.842148, 1, 0, 0.5215687, 1,
1.281123, -0.8109294, 2.406361, 1, 0, 0.5176471, 1,
1.28271, -0.06427459, 1.53639, 1, 0, 0.509804, 1,
1.286398, -1.363483, 1.603483, 1, 0, 0.5058824, 1,
1.288587, -1.14102, 1.637722, 1, 0, 0.4980392, 1,
1.293782, -1.354178, 3.3151, 1, 0, 0.4901961, 1,
1.299686, -1.476732, 3.036309, 1, 0, 0.4862745, 1,
1.306866, -0.7723422, 1.951224, 1, 0, 0.4784314, 1,
1.337631, -1.283277, 2.025808, 1, 0, 0.4745098, 1,
1.346137, -0.2522229, 2.140283, 1, 0, 0.4666667, 1,
1.353192, -0.4059629, 1.415319, 1, 0, 0.4627451, 1,
1.373563, 0.2255754, 1.734856, 1, 0, 0.454902, 1,
1.385353, 0.5080716, -0.1430996, 1, 0, 0.4509804, 1,
1.386177, -0.6315352, 2.666611, 1, 0, 0.4431373, 1,
1.389474, 0.7676418, -0.2259462, 1, 0, 0.4392157, 1,
1.395398, -0.0470826, 1.208661, 1, 0, 0.4313726, 1,
1.402064, -0.6365711, 3.575497, 1, 0, 0.427451, 1,
1.416305, 2.071402, -0.8274805, 1, 0, 0.4196078, 1,
1.422266, 0.05641934, 0.8428932, 1, 0, 0.4156863, 1,
1.427819, 0.3632637, 0.3579673, 1, 0, 0.4078431, 1,
1.438129, -0.2949781, 0.7866933, 1, 0, 0.4039216, 1,
1.446684, 1.172732, 1.075094, 1, 0, 0.3960784, 1,
1.451527, -1.074605, 3.95283, 1, 0, 0.3882353, 1,
1.453594, 0.5082061, -0.03309379, 1, 0, 0.3843137, 1,
1.457992, -0.8616667, 3.107233, 1, 0, 0.3764706, 1,
1.459177, 0.2414274, 1.249627, 1, 0, 0.372549, 1,
1.490347, 0.2636981, 1.859465, 1, 0, 0.3647059, 1,
1.493389, -1.943375, 2.60679, 1, 0, 0.3607843, 1,
1.505011, 0.0669492, 0.8715481, 1, 0, 0.3529412, 1,
1.512209, 0.6469035, 0.8581052, 1, 0, 0.3490196, 1,
1.516346, 1.34727, 0.2820065, 1, 0, 0.3411765, 1,
1.520816, 0.3927369, 2.211789, 1, 0, 0.3372549, 1,
1.543027, -1.338266, 3.263231, 1, 0, 0.3294118, 1,
1.554137, 0.38337, 2.690342, 1, 0, 0.3254902, 1,
1.554864, 0.4345367, 1.474567, 1, 0, 0.3176471, 1,
1.559391, 1.187395, 2.377156, 1, 0, 0.3137255, 1,
1.565832, 0.09902859, 0.919136, 1, 0, 0.3058824, 1,
1.567525, 0.9376493, 2.029359, 1, 0, 0.2980392, 1,
1.622029, 0.1278192, 3.189477, 1, 0, 0.2941177, 1,
1.627008, -0.4070423, 2.868144, 1, 0, 0.2862745, 1,
1.645851, 1.383397, 0.2708313, 1, 0, 0.282353, 1,
1.653554, 0.606838, 1.594353, 1, 0, 0.2745098, 1,
1.661206, 0.4777444, 0.5235816, 1, 0, 0.2705882, 1,
1.668914, -0.8258884, 1.579309, 1, 0, 0.2627451, 1,
1.674977, 0.5354957, 3.185127, 1, 0, 0.2588235, 1,
1.675954, 0.1655619, 1.253707, 1, 0, 0.2509804, 1,
1.676006, 0.402587, -0.0970589, 1, 0, 0.2470588, 1,
1.696402, -1.609781, 2.16851, 1, 0, 0.2392157, 1,
1.697933, -1.076275, 1.332075, 1, 0, 0.2352941, 1,
1.703035, -0.4590291, 1.758356, 1, 0, 0.227451, 1,
1.707814, -1.531184, 1.79374, 1, 0, 0.2235294, 1,
1.739315, -0.2284665, 0.80112, 1, 0, 0.2156863, 1,
1.758516, -1.893455, 0.7134408, 1, 0, 0.2117647, 1,
1.760274, 0.5195714, -0.5748061, 1, 0, 0.2039216, 1,
1.760641, 1.36048, 0.9328283, 1, 0, 0.1960784, 1,
1.781221, 0.7324361, 3.898253, 1, 0, 0.1921569, 1,
1.791562, 1.474326, 0.3750333, 1, 0, 0.1843137, 1,
1.794073, 1.396994, 2.35266, 1, 0, 0.1803922, 1,
1.82589, 1.055868, 1.462033, 1, 0, 0.172549, 1,
1.842739, -0.6130877, 2.395953, 1, 0, 0.1686275, 1,
1.862533, 0.1955648, 1.638023, 1, 0, 0.1607843, 1,
1.864467, 1.205979, 1.062181, 1, 0, 0.1568628, 1,
1.889117, -1.266869, 2.816017, 1, 0, 0.1490196, 1,
1.894819, 1.114419, 0.4705492, 1, 0, 0.145098, 1,
1.91164, -1.09584, 2.415699, 1, 0, 0.1372549, 1,
1.913034, 0.7046738, -0.5588349, 1, 0, 0.1333333, 1,
1.917814, 0.1572647, 1.226365, 1, 0, 0.1254902, 1,
1.936784, 0.8490552, 1.34682, 1, 0, 0.1215686, 1,
1.971055, -0.01783231, 2.887195, 1, 0, 0.1137255, 1,
1.982972, 0.7246966, 2.903024, 1, 0, 0.1098039, 1,
1.993918, 1.327625, 1.485876, 1, 0, 0.1019608, 1,
2.009629, -0.6300619, 0.9602855, 1, 0, 0.09411765, 1,
2.014748, 0.1529253, 0.9412864, 1, 0, 0.09019608, 1,
2.015179, -1.110276, 4.267367, 1, 0, 0.08235294, 1,
2.041201, -0.3489434, 1.048637, 1, 0, 0.07843138, 1,
2.044904, 0.9302989, 0.07613938, 1, 0, 0.07058824, 1,
2.052025, -0.2760389, 0.2657341, 1, 0, 0.06666667, 1,
2.07589, -0.7761405, 3.949733, 1, 0, 0.05882353, 1,
2.095169, -1.691448, 1.993493, 1, 0, 0.05490196, 1,
2.118301, -1.482288, 3.293513, 1, 0, 0.04705882, 1,
2.122145, 1.541054, -0.7220532, 1, 0, 0.04313726, 1,
2.185241, 0.1150766, 2.33414, 1, 0, 0.03529412, 1,
2.226654, 0.108045, 1.578871, 1, 0, 0.03137255, 1,
2.237391, -0.2597432, 1.09031, 1, 0, 0.02352941, 1,
2.268699, 1.027917, 1.298911, 1, 0, 0.01960784, 1,
2.524688, -1.822031, 0.4855941, 1, 0, 0.01176471, 1,
2.541563, 1.010223, 2.604002, 1, 0, 0.007843138, 1
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
-0.1620582, -4.432557, -7.491854, 0, -0.5, 0.5, 0.5,
-0.1620582, -4.432557, -7.491854, 1, -0.5, 0.5, 0.5,
-0.1620582, -4.432557, -7.491854, 1, 1.5, 0.5, 0.5,
-0.1620582, -4.432557, -7.491854, 0, 1.5, 0.5, 0.5
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
-3.782207, -0.1379741, -7.491854, 0, -0.5, 0.5, 0.5,
-3.782207, -0.1379741, -7.491854, 1, -0.5, 0.5, 0.5,
-3.782207, -0.1379741, -7.491854, 1, 1.5, 0.5, 0.5,
-3.782207, -0.1379741, -7.491854, 0, 1.5, 0.5, 0.5
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
-3.782207, -4.432557, -0.4110844, 0, -0.5, 0.5, 0.5,
-3.782207, -4.432557, -0.4110844, 1, -0.5, 0.5, 0.5,
-3.782207, -4.432557, -0.4110844, 1, 1.5, 0.5, 0.5,
-3.782207, -4.432557, -0.4110844, 0, 1.5, 0.5, 0.5
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
-2, -3.4415, -5.857831,
2, -3.4415, -5.857831,
-2, -3.4415, -5.857831,
-2, -3.606676, -6.130167,
-1, -3.4415, -5.857831,
-1, -3.606676, -6.130167,
0, -3.4415, -5.857831,
0, -3.606676, -6.130167,
1, -3.4415, -5.857831,
1, -3.606676, -6.130167,
2, -3.4415, -5.857831,
2, -3.606676, -6.130167
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
-2, -3.937028, -6.674842, 0, -0.5, 0.5, 0.5,
-2, -3.937028, -6.674842, 1, -0.5, 0.5, 0.5,
-2, -3.937028, -6.674842, 1, 1.5, 0.5, 0.5,
-2, -3.937028, -6.674842, 0, 1.5, 0.5, 0.5,
-1, -3.937028, -6.674842, 0, -0.5, 0.5, 0.5,
-1, -3.937028, -6.674842, 1, -0.5, 0.5, 0.5,
-1, -3.937028, -6.674842, 1, 1.5, 0.5, 0.5,
-1, -3.937028, -6.674842, 0, 1.5, 0.5, 0.5,
0, -3.937028, -6.674842, 0, -0.5, 0.5, 0.5,
0, -3.937028, -6.674842, 1, -0.5, 0.5, 0.5,
0, -3.937028, -6.674842, 1, 1.5, 0.5, 0.5,
0, -3.937028, -6.674842, 0, 1.5, 0.5, 0.5,
1, -3.937028, -6.674842, 0, -0.5, 0.5, 0.5,
1, -3.937028, -6.674842, 1, -0.5, 0.5, 0.5,
1, -3.937028, -6.674842, 1, 1.5, 0.5, 0.5,
1, -3.937028, -6.674842, 0, 1.5, 0.5, 0.5,
2, -3.937028, -6.674842, 0, -0.5, 0.5, 0.5,
2, -3.937028, -6.674842, 1, -0.5, 0.5, 0.5,
2, -3.937028, -6.674842, 1, 1.5, 0.5, 0.5,
2, -3.937028, -6.674842, 0, 1.5, 0.5, 0.5
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
-2.946788, -3, -5.857831,
-2.946788, 3, -5.857831,
-2.946788, -3, -5.857831,
-3.086025, -3, -6.130167,
-2.946788, -2, -5.857831,
-3.086025, -2, -6.130167,
-2.946788, -1, -5.857831,
-3.086025, -1, -6.130167,
-2.946788, 0, -5.857831,
-3.086025, 0, -6.130167,
-2.946788, 1, -5.857831,
-3.086025, 1, -6.130167,
-2.946788, 2, -5.857831,
-3.086025, 2, -6.130167,
-2.946788, 3, -5.857831,
-3.086025, 3, -6.130167
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
-3.364498, -3, -6.674842, 0, -0.5, 0.5, 0.5,
-3.364498, -3, -6.674842, 1, -0.5, 0.5, 0.5,
-3.364498, -3, -6.674842, 1, 1.5, 0.5, 0.5,
-3.364498, -3, -6.674842, 0, 1.5, 0.5, 0.5,
-3.364498, -2, -6.674842, 0, -0.5, 0.5, 0.5,
-3.364498, -2, -6.674842, 1, -0.5, 0.5, 0.5,
-3.364498, -2, -6.674842, 1, 1.5, 0.5, 0.5,
-3.364498, -2, -6.674842, 0, 1.5, 0.5, 0.5,
-3.364498, -1, -6.674842, 0, -0.5, 0.5, 0.5,
-3.364498, -1, -6.674842, 1, -0.5, 0.5, 0.5,
-3.364498, -1, -6.674842, 1, 1.5, 0.5, 0.5,
-3.364498, -1, -6.674842, 0, 1.5, 0.5, 0.5,
-3.364498, 0, -6.674842, 0, -0.5, 0.5, 0.5,
-3.364498, 0, -6.674842, 1, -0.5, 0.5, 0.5,
-3.364498, 0, -6.674842, 1, 1.5, 0.5, 0.5,
-3.364498, 0, -6.674842, 0, 1.5, 0.5, 0.5,
-3.364498, 1, -6.674842, 0, -0.5, 0.5, 0.5,
-3.364498, 1, -6.674842, 1, -0.5, 0.5, 0.5,
-3.364498, 1, -6.674842, 1, 1.5, 0.5, 0.5,
-3.364498, 1, -6.674842, 0, 1.5, 0.5, 0.5,
-3.364498, 2, -6.674842, 0, -0.5, 0.5, 0.5,
-3.364498, 2, -6.674842, 1, -0.5, 0.5, 0.5,
-3.364498, 2, -6.674842, 1, 1.5, 0.5, 0.5,
-3.364498, 2, -6.674842, 0, 1.5, 0.5, 0.5,
-3.364498, 3, -6.674842, 0, -0.5, 0.5, 0.5,
-3.364498, 3, -6.674842, 1, -0.5, 0.5, 0.5,
-3.364498, 3, -6.674842, 1, 1.5, 0.5, 0.5,
-3.364498, 3, -6.674842, 0, 1.5, 0.5, 0.5
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
-2.946788, -3.4415, -4,
-2.946788, -3.4415, 4,
-2.946788, -3.4415, -4,
-3.086025, -3.606676, -4,
-2.946788, -3.4415, -2,
-3.086025, -3.606676, -2,
-2.946788, -3.4415, 0,
-3.086025, -3.606676, 0,
-2.946788, -3.4415, 2,
-3.086025, -3.606676, 2,
-2.946788, -3.4415, 4,
-3.086025, -3.606676, 4
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
-3.364498, -3.937028, -4, 0, -0.5, 0.5, 0.5,
-3.364498, -3.937028, -4, 1, -0.5, 0.5, 0.5,
-3.364498, -3.937028, -4, 1, 1.5, 0.5, 0.5,
-3.364498, -3.937028, -4, 0, 1.5, 0.5, 0.5,
-3.364498, -3.937028, -2, 0, -0.5, 0.5, 0.5,
-3.364498, -3.937028, -2, 1, -0.5, 0.5, 0.5,
-3.364498, -3.937028, -2, 1, 1.5, 0.5, 0.5,
-3.364498, -3.937028, -2, 0, 1.5, 0.5, 0.5,
-3.364498, -3.937028, 0, 0, -0.5, 0.5, 0.5,
-3.364498, -3.937028, 0, 1, -0.5, 0.5, 0.5,
-3.364498, -3.937028, 0, 1, 1.5, 0.5, 0.5,
-3.364498, -3.937028, 0, 0, 1.5, 0.5, 0.5,
-3.364498, -3.937028, 2, 0, -0.5, 0.5, 0.5,
-3.364498, -3.937028, 2, 1, -0.5, 0.5, 0.5,
-3.364498, -3.937028, 2, 1, 1.5, 0.5, 0.5,
-3.364498, -3.937028, 2, 0, 1.5, 0.5, 0.5,
-3.364498, -3.937028, 4, 0, -0.5, 0.5, 0.5,
-3.364498, -3.937028, 4, 1, -0.5, 0.5, 0.5,
-3.364498, -3.937028, 4, 1, 1.5, 0.5, 0.5,
-3.364498, -3.937028, 4, 0, 1.5, 0.5, 0.5
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
-2.946788, -3.4415, -5.857831,
-2.946788, 3.165551, -5.857831,
-2.946788, -3.4415, 5.035662,
-2.946788, 3.165551, 5.035662,
-2.946788, -3.4415, -5.857831,
-2.946788, -3.4415, 5.035662,
-2.946788, 3.165551, -5.857831,
-2.946788, 3.165551, 5.035662,
-2.946788, -3.4415, -5.857831,
2.622672, -3.4415, -5.857831,
-2.946788, -3.4415, 5.035662,
2.622672, -3.4415, 5.035662,
-2.946788, 3.165551, -5.857831,
2.622672, 3.165551, -5.857831,
-2.946788, 3.165551, 5.035662,
2.622672, 3.165551, 5.035662,
2.622672, -3.4415, -5.857831,
2.622672, 3.165551, -5.857831,
2.622672, -3.4415, 5.035662,
2.622672, 3.165551, 5.035662,
2.622672, -3.4415, -5.857831,
2.622672, -3.4415, 5.035662,
2.622672, 3.165551, -5.857831,
2.622672, 3.165551, 5.035662
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
var radius = 7.42483;
var distance = 33.03391;
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
mvMatrix.translate( 0.1620582, 0.1379741, 0.4110844 );
mvMatrix.scale( 1.441409, 1.215046, 0.736942 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.03391);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Bromoallylene<-read.table("Bromoallylene.xyz")
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
-2.86568, 0.5910619, -2.382968, 0, 0, 1, 1, 1,
-2.797816, -1.425563, -1.74679, 1, 0, 0, 1, 1,
-2.696064, -0.9984513, -3.254511, 1, 0, 0, 1, 1,
-2.583113, 1.730267, -1.731884, 1, 0, 0, 1, 1,
-2.441881, 0.755475, -1.538688, 1, 0, 0, 1, 1,
-2.406679, -1.351427, -1.339363, 1, 0, 0, 1, 1,
-2.389962, 0.2599994, -2.231948, 0, 0, 0, 1, 1,
-2.322291, -0.7152067, -0.1153219, 0, 0, 0, 1, 1,
-2.255455, 0.08530293, -0.2802942, 0, 0, 0, 1, 1,
-2.214379, -0.6416898, -1.302012, 0, 0, 0, 1, 1,
-2.214231, -0.5435212, -2.244681, 0, 0, 0, 1, 1,
-2.190053, 0.3157489, -0.9534945, 0, 0, 0, 1, 1,
-2.174521, 1.210652, -0.1751051, 0, 0, 0, 1, 1,
-2.152731, -1.150506, 0.2149827, 1, 1, 1, 1, 1,
-2.109052, -1.162238, -1.413513, 1, 1, 1, 1, 1,
-2.102227, 0.3479851, 1.003852, 1, 1, 1, 1, 1,
-2.07518, 0.8277777, -0.5927442, 1, 1, 1, 1, 1,
-2.016359, 1.240371, -2.627777, 1, 1, 1, 1, 1,
-2.005744, -1.558342, -3.960174, 1, 1, 1, 1, 1,
-1.9584, -0.06571665, -0.9186121, 1, 1, 1, 1, 1,
-1.952743, 0.2479163, -0.7322079, 1, 1, 1, 1, 1,
-1.937131, 1.088276, -1.744911, 1, 1, 1, 1, 1,
-1.933592, 0.4327179, -1.356541, 1, 1, 1, 1, 1,
-1.932071, -0.7433587, -1.599364, 1, 1, 1, 1, 1,
-1.910197, 0.3469474, 0.3281287, 1, 1, 1, 1, 1,
-1.908118, -0.5225832, -2.374511, 1, 1, 1, 1, 1,
-1.904774, -0.905194, -1.836236, 1, 1, 1, 1, 1,
-1.879059, -1.450602, -2.853086, 1, 1, 1, 1, 1,
-1.869698, -0.1603222, -1.133999, 0, 0, 1, 1, 1,
-1.867257, 1.795405, 0.9569631, 1, 0, 0, 1, 1,
-1.867049, -2.634716, -3.752985, 1, 0, 0, 1, 1,
-1.842905, -0.7584003, -1.609013, 1, 0, 0, 1, 1,
-1.833402, 0.6650347, -2.749842, 1, 0, 0, 1, 1,
-1.818953, -0.8164996, -0.5894338, 1, 0, 0, 1, 1,
-1.806136, 0.2086866, -0.0188003, 0, 0, 0, 1, 1,
-1.795017, 0.4070469, -1.201907, 0, 0, 0, 1, 1,
-1.793561, 0.821367, -1.963809, 0, 0, 0, 1, 1,
-1.772285, 0.1047244, -1.82689, 0, 0, 0, 1, 1,
-1.769454, -0.001701879, -1.89859, 0, 0, 0, 1, 1,
-1.757499, 0.9214295, -0.111392, 0, 0, 0, 1, 1,
-1.755892, 0.07446881, -2.21099, 0, 0, 0, 1, 1,
-1.732591, -0.4309526, -1.030265, 1, 1, 1, 1, 1,
-1.728563, 0.2151507, -0.4506819, 1, 1, 1, 1, 1,
-1.724209, -0.2638861, -5.302644, 1, 1, 1, 1, 1,
-1.712783, -0.739482, -2.747825, 1, 1, 1, 1, 1,
-1.665711, 0.3998275, -1.18564, 1, 1, 1, 1, 1,
-1.656738, 1.318229, -0.8280889, 1, 1, 1, 1, 1,
-1.656108, 0.7822229, 0.2595269, 1, 1, 1, 1, 1,
-1.647536, 0.7474986, -3.11833, 1, 1, 1, 1, 1,
-1.639341, -1.274338, -4.27542, 1, 1, 1, 1, 1,
-1.637605, -0.141148, -2.817323, 1, 1, 1, 1, 1,
-1.615306, -0.7957994, -2.120181, 1, 1, 1, 1, 1,
-1.614016, 1.364287, -0.9362041, 1, 1, 1, 1, 1,
-1.612085, -1.087255, 0.1223787, 1, 1, 1, 1, 1,
-1.610759, -0.6734725, -2.583326, 1, 1, 1, 1, 1,
-1.609741, 0.9605957, -0.6287798, 1, 1, 1, 1, 1,
-1.604928, 0.8228818, -2.187585, 0, 0, 1, 1, 1,
-1.596735, -0.1685349, -0.9044349, 1, 0, 0, 1, 1,
-1.561391, -0.2762336, -0.6531086, 1, 0, 0, 1, 1,
-1.543343, 0.8545885, 1.118463, 1, 0, 0, 1, 1,
-1.536507, -1.007951, -3.459453, 1, 0, 0, 1, 1,
-1.494475, 0.7081965, -2.622611, 1, 0, 0, 1, 1,
-1.487781, -0.007550082, -1.815519, 0, 0, 0, 1, 1,
-1.475044, 0.4192089, -2.271141, 0, 0, 0, 1, 1,
-1.459991, -0.7322176, -2.893015, 0, 0, 0, 1, 1,
-1.457513, -0.006959034, -0.6446111, 0, 0, 0, 1, 1,
-1.456429, 0.1700451, -3.054096, 0, 0, 0, 1, 1,
-1.454416, 0.1168909, -3.132662, 0, 0, 0, 1, 1,
-1.440493, -0.3902116, -0.6755531, 0, 0, 0, 1, 1,
-1.440097, 2.024902, 1.413183, 1, 1, 1, 1, 1,
-1.439422, 1.310394, -0.1909862, 1, 1, 1, 1, 1,
-1.431907, 0.008752038, -1.570311, 1, 1, 1, 1, 1,
-1.43156, -0.6527352, -2.85316, 1, 1, 1, 1, 1,
-1.410216, -0.689904, -4.107118, 1, 1, 1, 1, 1,
-1.408439, -1.117697, -1.355221, 1, 1, 1, 1, 1,
-1.399991, 0.8682166, 0.3577533, 1, 1, 1, 1, 1,
-1.39533, 0.278707, -1.564825, 1, 1, 1, 1, 1,
-1.394083, -0.1272241, -3.185432, 1, 1, 1, 1, 1,
-1.379249, -1.880136, -3.022389, 1, 1, 1, 1, 1,
-1.377506, -0.6094415, -3.154888, 1, 1, 1, 1, 1,
-1.376965, 0.4206935, -1.212211, 1, 1, 1, 1, 1,
-1.364526, 0.5984486, -0.9694134, 1, 1, 1, 1, 1,
-1.362117, 0.2050015, -1.413294, 1, 1, 1, 1, 1,
-1.350292, 0.09650401, -1.357027, 1, 1, 1, 1, 1,
-1.33707, -0.01437896, -0.5896695, 0, 0, 1, 1, 1,
-1.332485, -0.7981327, -3.314085, 1, 0, 0, 1, 1,
-1.332185, -0.7186497, -1.035414, 1, 0, 0, 1, 1,
-1.33209, -0.2399675, -1.428156, 1, 0, 0, 1, 1,
-1.325555, -0.600984, -1.332544, 1, 0, 0, 1, 1,
-1.315192, -0.3258193, -1.511676, 1, 0, 0, 1, 1,
-1.313955, -0.1877691, -1.28229, 0, 0, 0, 1, 1,
-1.312317, 0.134598, -0.6487569, 0, 0, 0, 1, 1,
-1.305908, -0.6654317, -2.832347, 0, 0, 0, 1, 1,
-1.300227, 0.273526, -0.281918, 0, 0, 0, 1, 1,
-1.29102, -0.03251548, -1.034229, 0, 0, 0, 1, 1,
-1.282587, -0.416664, -2.43743, 0, 0, 0, 1, 1,
-1.278837, -1.516243, -1.936296, 0, 0, 0, 1, 1,
-1.277422, -1.07761, -3.738595, 1, 1, 1, 1, 1,
-1.275449, -0.5930779, -2.788037, 1, 1, 1, 1, 1,
-1.270183, -0.08384469, -1.437367, 1, 1, 1, 1, 1,
-1.269915, 0.06948618, -1.118718, 1, 1, 1, 1, 1,
-1.260751, 0.6739148, -0.9060212, 1, 1, 1, 1, 1,
-1.244943, 0.5731249, -1.347717, 1, 1, 1, 1, 1,
-1.244095, -0.5334643, 0.264406, 1, 1, 1, 1, 1,
-1.243239, -0.1393174, -0.3747432, 1, 1, 1, 1, 1,
-1.233831, 1.305797, 0.03797844, 1, 1, 1, 1, 1,
-1.232246, 0.5393786, -1.343678, 1, 1, 1, 1, 1,
-1.226018, 1.248534, -1.751784, 1, 1, 1, 1, 1,
-1.216853, -0.7148066, -1.205841, 1, 1, 1, 1, 1,
-1.212242, 0.07828057, -1.654481, 1, 1, 1, 1, 1,
-1.209397, -0.6089349, -3.743872, 1, 1, 1, 1, 1,
-1.20682, 0.5149451, 2.416059, 1, 1, 1, 1, 1,
-1.191604, -0.6808479, -3.241392, 0, 0, 1, 1, 1,
-1.184643, -0.3276546, -3.067573, 1, 0, 0, 1, 1,
-1.18322, -0.02286995, -2.074304, 1, 0, 0, 1, 1,
-1.169302, -1.456013, -3.078377, 1, 0, 0, 1, 1,
-1.167657, 0.485433, -0.5054817, 1, 0, 0, 1, 1,
-1.163959, 0.7106676, -2.932838, 1, 0, 0, 1, 1,
-1.151671, -0.3684449, -1.256406, 0, 0, 0, 1, 1,
-1.146217, -2.011054, -2.62636, 0, 0, 0, 1, 1,
-1.138684, -1.316316, -1.845407, 0, 0, 0, 1, 1,
-1.132913, 0.2713781, -1.54125, 0, 0, 0, 1, 1,
-1.131035, 0.1723724, -1.52221, 0, 0, 0, 1, 1,
-1.13035, 1.211394, -0.927583, 0, 0, 0, 1, 1,
-1.126416, 0.0864349, -3.333431, 0, 0, 0, 1, 1,
-1.12608, -0.7932594, -1.900956, 1, 1, 1, 1, 1,
-1.124817, -2.061934, -3.060364, 1, 1, 1, 1, 1,
-1.116226, 0.1827349, -0.6658837, 1, 1, 1, 1, 1,
-1.113535, -0.7976376, -1.986111, 1, 1, 1, 1, 1,
-1.112395, 1.025656, 0.1112286, 1, 1, 1, 1, 1,
-1.111162, -1.282558, -4.207217, 1, 1, 1, 1, 1,
-1.109091, 2.202127, -0.3001939, 1, 1, 1, 1, 1,
-1.095587, 0.5233636, -0.2354559, 1, 1, 1, 1, 1,
-1.095079, 0.2331564, -1.225357, 1, 1, 1, 1, 1,
-1.085546, -2.02397, -3.91477, 1, 1, 1, 1, 1,
-1.083314, 1.415545, 1.487519, 1, 1, 1, 1, 1,
-1.079225, 1.811141, -0.03230315, 1, 1, 1, 1, 1,
-1.074076, 0.2983278, 0.3813755, 1, 1, 1, 1, 1,
-1.073729, 0.880013, -0.2565998, 1, 1, 1, 1, 1,
-1.073058, 0.3897749, -2.536375, 1, 1, 1, 1, 1,
-1.067916, -0.6240878, -2.256914, 0, 0, 1, 1, 1,
-1.064982, 1.471218, 0.9706356, 1, 0, 0, 1, 1,
-1.063224, -0.8536872, -2.683167, 1, 0, 0, 1, 1,
-1.05321, 0.2151197, -1.323146, 1, 0, 0, 1, 1,
-1.042104, -0.1387043, -1.14461, 1, 0, 0, 1, 1,
-1.041642, 0.1060756, -0.9193226, 1, 0, 0, 1, 1,
-1.041244, -0.2080191, -2.154013, 0, 0, 0, 1, 1,
-1.039552, 1.723061, 0.6532193, 0, 0, 0, 1, 1,
-1.037811, 0.6562304, 0.3096431, 0, 0, 0, 1, 1,
-1.037788, 0.1553371, -2.501796, 0, 0, 0, 1, 1,
-1.036048, -0.2038224, -1.202236, 0, 0, 0, 1, 1,
-1.032881, 0.3266173, -0.5965176, 0, 0, 0, 1, 1,
-1.02909, -0.4718739, -1.985615, 0, 0, 0, 1, 1,
-1.028622, -2.1049, -4.458454, 1, 1, 1, 1, 1,
-1.023552, 0.9467009, -0.0411126, 1, 1, 1, 1, 1,
-1.014101, -1.386298, -3.155677, 1, 1, 1, 1, 1,
-1.013315, -2.006734, -2.192325, 1, 1, 1, 1, 1,
-1.002828, -1.640561, -0.8335657, 1, 1, 1, 1, 1,
-1.001629, -0.7261974, -3.847232, 1, 1, 1, 1, 1,
-0.992128, 0.5825648, -0.9276829, 1, 1, 1, 1, 1,
-0.9769144, 0.7464066, -0.3531742, 1, 1, 1, 1, 1,
-0.9745588, -0.643942, -2.248145, 1, 1, 1, 1, 1,
-0.9676901, -0.9290191, -4.118178, 1, 1, 1, 1, 1,
-0.9668981, -1.258961, -5.558238, 1, 1, 1, 1, 1,
-0.9643145, -0.01225374, -1.987845, 1, 1, 1, 1, 1,
-0.9632809, -0.6983613, -2.816172, 1, 1, 1, 1, 1,
-0.9544001, 1.456147, -1.500362, 1, 1, 1, 1, 1,
-0.9542363, -0.2986256, -1.872438, 1, 1, 1, 1, 1,
-0.9531623, -0.4819033, -3.482845, 0, 0, 1, 1, 1,
-0.9530313, -0.08956251, -0.5595551, 1, 0, 0, 1, 1,
-0.949632, 0.1648994, -1.093939, 1, 0, 0, 1, 1,
-0.9495376, 0.2606634, -2.022036, 1, 0, 0, 1, 1,
-0.9308846, -0.07992689, -0.8012867, 1, 0, 0, 1, 1,
-0.9292401, 0.119462, -1.147464, 1, 0, 0, 1, 1,
-0.9281385, -0.07721506, -1.467417, 0, 0, 0, 1, 1,
-0.9244533, 0.1124188, 0.930471, 0, 0, 0, 1, 1,
-0.9156136, 0.6527361, -1.509061, 0, 0, 0, 1, 1,
-0.913256, 0.3114656, -1.39751, 0, 0, 0, 1, 1,
-0.9118789, 0.3287453, -2.01136, 0, 0, 0, 1, 1,
-0.9113476, -0.6637582, -4.788328, 0, 0, 0, 1, 1,
-0.9090208, -2.020131, -1.579209, 0, 0, 0, 1, 1,
-0.9088399, 1.096206, -0.05073202, 1, 1, 1, 1, 1,
-0.904192, -0.5993044, -2.800457, 1, 1, 1, 1, 1,
-0.8998284, -0.6478115, -2.239409, 1, 1, 1, 1, 1,
-0.8994489, -0.7005264, -2.255978, 1, 1, 1, 1, 1,
-0.8962315, 1.788667, 0.6137269, 1, 1, 1, 1, 1,
-0.8961816, -0.6524399, 0.4235897, 1, 1, 1, 1, 1,
-0.8946221, -1.162996, -2.274942, 1, 1, 1, 1, 1,
-0.8925069, -0.04197457, -0.9289041, 1, 1, 1, 1, 1,
-0.8917422, 0.05001422, 0.2767582, 1, 1, 1, 1, 1,
-0.8883923, -1.25407, -4.536501, 1, 1, 1, 1, 1,
-0.8859288, 0.4909402, -1.408689, 1, 1, 1, 1, 1,
-0.8847512, 0.3558165, 0.7074163, 1, 1, 1, 1, 1,
-0.8828898, 1.215272, -0.8770754, 1, 1, 1, 1, 1,
-0.8791631, 0.9742398, 1.634379, 1, 1, 1, 1, 1,
-0.8758414, -1.349092, -3.978248, 1, 1, 1, 1, 1,
-0.8709052, -0.4104657, -1.926548, 0, 0, 1, 1, 1,
-0.8607554, 0.9708218, -1.121436, 1, 0, 0, 1, 1,
-0.8581791, -0.0977487, -1.20565, 1, 0, 0, 1, 1,
-0.8559076, -1.538612, -2.361498, 1, 0, 0, 1, 1,
-0.8541665, 1.425526, 0.3110644, 1, 0, 0, 1, 1,
-0.8540853, -0.2974904, -2.964476, 1, 0, 0, 1, 1,
-0.8493331, 0.191361, 1.117406, 0, 0, 0, 1, 1,
-0.8479938, 1.287298, -1.625569, 0, 0, 0, 1, 1,
-0.8421849, -1.021129, -1.614786, 0, 0, 0, 1, 1,
-0.831478, -1.293683, -2.424849, 0, 0, 0, 1, 1,
-0.8294736, 0.6616259, -1.27638, 0, 0, 0, 1, 1,
-0.8293038, -0.3461004, -0.3710234, 0, 0, 0, 1, 1,
-0.8246943, 0.05015175, -1.923009, 0, 0, 0, 1, 1,
-0.8207843, 0.9265163, -1.659512, 1, 1, 1, 1, 1,
-0.8176901, -1.257852, -3.997857, 1, 1, 1, 1, 1,
-0.8175709, 0.5476746, -1.447711, 1, 1, 1, 1, 1,
-0.8107553, 0.3299847, -0.7627105, 1, 1, 1, 1, 1,
-0.8035197, 0.2055899, -1.563082, 1, 1, 1, 1, 1,
-0.803158, -1.107606, -2.717657, 1, 1, 1, 1, 1,
-0.8014373, 0.2291646, -2.80823, 1, 1, 1, 1, 1,
-0.7953202, 0.3126731, -2.020713, 1, 1, 1, 1, 1,
-0.7941089, -0.8642763, -3.384354, 1, 1, 1, 1, 1,
-0.7923013, 1.083925, 0.3671024, 1, 1, 1, 1, 1,
-0.7827648, 0.7952969, -2.411313, 1, 1, 1, 1, 1,
-0.7796519, -0.09312045, -2.497067, 1, 1, 1, 1, 1,
-0.7776588, -0.1356459, -3.843983, 1, 1, 1, 1, 1,
-0.7770501, -0.1317161, 0.6408858, 1, 1, 1, 1, 1,
-0.7729493, 1.26119, -0.651039, 1, 1, 1, 1, 1,
-0.7715666, 0.9084981, -0.9591635, 0, 0, 1, 1, 1,
-0.7683835, 0.6732414, -1.022271, 1, 0, 0, 1, 1,
-0.7667159, 0.3884672, -2.416346, 1, 0, 0, 1, 1,
-0.7649168, 0.05534339, -1.294661, 1, 0, 0, 1, 1,
-0.7642315, 0.5719314, -2.608307, 1, 0, 0, 1, 1,
-0.7626584, 1.818654, -1.622751, 1, 0, 0, 1, 1,
-0.7598481, -0.7802361, -4.33814, 0, 0, 0, 1, 1,
-0.7514346, -0.9974389, -2.869559, 0, 0, 0, 1, 1,
-0.7478795, 0.5774657, -1.02894, 0, 0, 0, 1, 1,
-0.7476759, -1.313641, -2.119216, 0, 0, 0, 1, 1,
-0.7467464, 0.7871992, -0.9431221, 0, 0, 0, 1, 1,
-0.7452534, -0.6378903, -1.420237, 0, 0, 0, 1, 1,
-0.7390758, -0.3751993, -3.113982, 0, 0, 0, 1, 1,
-0.7368627, -1.219289, -1.210958, 1, 1, 1, 1, 1,
-0.7329805, 0.4522938, -1.083457, 1, 1, 1, 1, 1,
-0.732873, -0.6915653, -2.287169, 1, 1, 1, 1, 1,
-0.7312219, 1.337633, -1.827477, 1, 1, 1, 1, 1,
-0.7284352, -0.2301331, -2.072981, 1, 1, 1, 1, 1,
-0.7064168, 0.7514338, -0.2114869, 1, 1, 1, 1, 1,
-0.704996, 0.03981698, -2.25143, 1, 1, 1, 1, 1,
-0.7014465, -0.2599239, -3.589235, 1, 1, 1, 1, 1,
-0.6995715, -0.9544069, -0.7579492, 1, 1, 1, 1, 1,
-0.6904123, 0.6259755, -1.935153, 1, 1, 1, 1, 1,
-0.6871735, 0.5325242, -3.324615, 1, 1, 1, 1, 1,
-0.6791265, -2.432762, -3.916835, 1, 1, 1, 1, 1,
-0.6759788, 1.224252, -1.515099, 1, 1, 1, 1, 1,
-0.6704589, 1.543056, 0.8099693, 1, 1, 1, 1, 1,
-0.6698744, 1.34317, 0.614287, 1, 1, 1, 1, 1,
-0.6673793, -0.6229521, -3.092317, 0, 0, 1, 1, 1,
-0.6664284, 0.006205746, 0.0777853, 1, 0, 0, 1, 1,
-0.6641114, 1.283373, 0.5763262, 1, 0, 0, 1, 1,
-0.6638206, -0.8674034, -2.353341, 1, 0, 0, 1, 1,
-0.65748, 0.06406128, -1.033232, 1, 0, 0, 1, 1,
-0.636834, 1.568521, 0.2111942, 1, 0, 0, 1, 1,
-0.6344008, -0.2477423, -0.5480222, 0, 0, 0, 1, 1,
-0.634267, -1.340245, -1.745019, 0, 0, 0, 1, 1,
-0.6336217, -0.6788123, -3.04661, 0, 0, 0, 1, 1,
-0.6334617, 1.096595, -1.03874, 0, 0, 0, 1, 1,
-0.6323301, 0.9911888, -1.658384, 0, 0, 0, 1, 1,
-0.6309004, 1.109599, -0.2179054, 0, 0, 0, 1, 1,
-0.6285046, -0.3758761, -1.8781, 0, 0, 0, 1, 1,
-0.6262777, 0.1514243, -1.221564, 1, 1, 1, 1, 1,
-0.625461, -0.2108908, -2.839685, 1, 1, 1, 1, 1,
-0.6232511, 2.326491, -1.187783, 1, 1, 1, 1, 1,
-0.6232421, -1.345748, -3.345294, 1, 1, 1, 1, 1,
-0.621655, -0.4512448, -2.255332, 1, 1, 1, 1, 1,
-0.6198556, -0.9340503, -3.032763, 1, 1, 1, 1, 1,
-0.6195409, 0.6773997, -1.202269, 1, 1, 1, 1, 1,
-0.6141716, -1.147284, -1.839861, 1, 1, 1, 1, 1,
-0.6117823, -0.7246131, -3.969959, 1, 1, 1, 1, 1,
-0.6105589, 1.908949, 1.738207, 1, 1, 1, 1, 1,
-0.6099377, -0.04043293, -0.8052548, 1, 1, 1, 1, 1,
-0.6094731, -0.0410222, -0.4454576, 1, 1, 1, 1, 1,
-0.6044844, 2.492809, -0.03485435, 1, 1, 1, 1, 1,
-0.5915632, -0.09175593, -2.885489, 1, 1, 1, 1, 1,
-0.5911486, 0.3917236, 0.3540908, 1, 1, 1, 1, 1,
-0.5891581, -0.372736, -3.37734, 0, 0, 1, 1, 1,
-0.5885289, 0.5296252, -2.22757, 1, 0, 0, 1, 1,
-0.5841749, -0.1634527, -0.9878812, 1, 0, 0, 1, 1,
-0.5793383, 1.450519, -1.041219, 1, 0, 0, 1, 1,
-0.5785948, 0.8296093, 0.5562503, 1, 0, 0, 1, 1,
-0.5772277, -0.2453893, -0.7483934, 1, 0, 0, 1, 1,
-0.5696653, -0.0905616, -0.8631332, 0, 0, 0, 1, 1,
-0.5670853, 0.6299252, 1.541152, 0, 0, 0, 1, 1,
-0.5582982, -0.4099748, -2.533051, 0, 0, 0, 1, 1,
-0.5576945, 0.5777537, -3.476047, 0, 0, 0, 1, 1,
-0.5570945, 0.957709, -0.9417505, 0, 0, 0, 1, 1,
-0.5474849, 0.1959459, -1.521413, 0, 0, 0, 1, 1,
-0.544493, -0.9865036, -3.807665, 0, 0, 0, 1, 1,
-0.5362532, 1.42021, -0.1335738, 1, 1, 1, 1, 1,
-0.5320095, -0.145288, -1.427561, 1, 1, 1, 1, 1,
-0.5254334, -0.07780132, -3.455074, 1, 1, 1, 1, 1,
-0.5148436, 0.7177742, 0.6390526, 1, 1, 1, 1, 1,
-0.5131794, -0.6826259, -2.529611, 1, 1, 1, 1, 1,
-0.5127426, -1.620273, -3.475254, 1, 1, 1, 1, 1,
-0.5123748, -0.2717395, -3.081694, 1, 1, 1, 1, 1,
-0.5108827, -0.9072164, -3.096588, 1, 1, 1, 1, 1,
-0.5070382, -0.6163539, -0.4222234, 1, 1, 1, 1, 1,
-0.5070122, -0.3230316, -1.910924, 1, 1, 1, 1, 1,
-0.5041856, -0.3772144, -1.957318, 1, 1, 1, 1, 1,
-0.5035178, -1.079994, -2.174789, 1, 1, 1, 1, 1,
-0.5001811, -2.195175, -2.14037, 1, 1, 1, 1, 1,
-0.4985772, 0.5807429, -1.068468, 1, 1, 1, 1, 1,
-0.4975269, 0.9048243, -0.5762095, 1, 1, 1, 1, 1,
-0.496329, 0.6641275, -2.358797, 0, 0, 1, 1, 1,
-0.4933117, -0.3284506, -1.816268, 1, 0, 0, 1, 1,
-0.4913777, 0.8293114, -0.7511905, 1, 0, 0, 1, 1,
-0.4878693, 0.2748227, -2.079469, 1, 0, 0, 1, 1,
-0.4850463, -1.2221, -3.229043, 1, 0, 0, 1, 1,
-0.4842266, -2.967711, -3.410788, 1, 0, 0, 1, 1,
-0.4821007, 0.6589865, -0.02326608, 0, 0, 0, 1, 1,
-0.4758571, 0.630136, 0.400612, 0, 0, 0, 1, 1,
-0.4697359, 0.909366, 0.583762, 0, 0, 0, 1, 1,
-0.4665691, -0.09376241, -2.55888, 0, 0, 0, 1, 1,
-0.4663612, 0.5109157, -2.35621, 0, 0, 0, 1, 1,
-0.4651837, 1.100806, -0.2791231, 0, 0, 0, 1, 1,
-0.4648373, 0.3091151, -1.630735, 0, 0, 0, 1, 1,
-0.4627436, 0.5855664, -1.803303, 1, 1, 1, 1, 1,
-0.4619321, 0.2616699, -0.5896629, 1, 1, 1, 1, 1,
-0.4569466, 0.3639597, 0.4014276, 1, 1, 1, 1, 1,
-0.4489163, -1.30442, -2.882208, 1, 1, 1, 1, 1,
-0.445272, -0.4592435, -3.089473, 1, 1, 1, 1, 1,
-0.4363539, -0.1359081, -2.55995, 1, 1, 1, 1, 1,
-0.4355196, -0.1553228, -3.182507, 1, 1, 1, 1, 1,
-0.4338204, 1.040915, 0.12927, 1, 1, 1, 1, 1,
-0.430409, 2.238933, -1.006315, 1, 1, 1, 1, 1,
-0.4297796, -0.3587026, -2.475078, 1, 1, 1, 1, 1,
-0.4278606, -0.439207, -2.94304, 1, 1, 1, 1, 1,
-0.4221689, -0.556249, -3.095691, 1, 1, 1, 1, 1,
-0.421427, 0.9552094, 0.05313071, 1, 1, 1, 1, 1,
-0.418954, 0.387198, -1.532286, 1, 1, 1, 1, 1,
-0.4170641, -0.6956235, -3.010962, 1, 1, 1, 1, 1,
-0.4169241, 0.6121596, -0.05201337, 0, 0, 1, 1, 1,
-0.4129519, -2.281695, -3.535643, 1, 0, 0, 1, 1,
-0.4118071, 0.07670783, -1.072453, 1, 0, 0, 1, 1,
-0.4115314, 0.3398515, -0.4457449, 1, 0, 0, 1, 1,
-0.4065646, -0.9189133, -4.39592, 1, 0, 0, 1, 1,
-0.4001004, -1.123999, -3.672491, 1, 0, 0, 1, 1,
-0.3994241, 0.6711386, 1.006792, 0, 0, 0, 1, 1,
-0.394978, -0.7693939, -3.603537, 0, 0, 0, 1, 1,
-0.39497, 1.164153, -2.498195, 0, 0, 0, 1, 1,
-0.3860278, 0.3180106, 0.8187165, 0, 0, 0, 1, 1,
-0.3836118, 1.275795, 1.45131, 0, 0, 0, 1, 1,
-0.3835295, -1.109545, -2.338361, 0, 0, 0, 1, 1,
-0.3835015, -2.436503, -1.942319, 0, 0, 0, 1, 1,
-0.381624, -0.618833, -1.61943, 1, 1, 1, 1, 1,
-0.3815738, 0.9517305, 0.7307806, 1, 1, 1, 1, 1,
-0.3805903, -1.535544, -3.638647, 1, 1, 1, 1, 1,
-0.3800589, 0.1391521, -2.665293, 1, 1, 1, 1, 1,
-0.3771095, 0.03456783, -2.990123, 1, 1, 1, 1, 1,
-0.3764927, -0.7729636, -1.083169, 1, 1, 1, 1, 1,
-0.3733968, 0.9703445, -0.402005, 1, 1, 1, 1, 1,
-0.3733922, 0.3592968, 0.3140763, 1, 1, 1, 1, 1,
-0.3713725, -1.16302, -2.876833, 1, 1, 1, 1, 1,
-0.371208, 1.30076, -0.4278303, 1, 1, 1, 1, 1,
-0.3682237, 1.170891, -1.787118, 1, 1, 1, 1, 1,
-0.3681679, -2.46212, -3.517206, 1, 1, 1, 1, 1,
-0.359132, 0.1973382, 0.4746035, 1, 1, 1, 1, 1,
-0.3578861, 0.3612747, -2.417854, 1, 1, 1, 1, 1,
-0.3547648, -1.510306, -1.951226, 1, 1, 1, 1, 1,
-0.3519928, -1.184464, -4.271279, 0, 0, 1, 1, 1,
-0.3370012, -0.3341057, -2.022874, 1, 0, 0, 1, 1,
-0.3350717, 0.9792869, 0.4892274, 1, 0, 0, 1, 1,
-0.3343472, -0.5454965, -3.019505, 1, 0, 0, 1, 1,
-0.3270863, 0.4150187, -1.404142, 1, 0, 0, 1, 1,
-0.3237644, 1.727688, -0.9342499, 1, 0, 0, 1, 1,
-0.3237519, 2.132014, -0.4336839, 0, 0, 0, 1, 1,
-0.3218277, 0.1289557, 0.4553649, 0, 0, 0, 1, 1,
-0.3218255, -0.100386, -0.8755258, 0, 0, 0, 1, 1,
-0.3217092, -0.08154459, -0.3194703, 0, 0, 0, 1, 1,
-0.3163127, 1.475896, 0.1327889, 0, 0, 0, 1, 1,
-0.3107765, 1.400018, 1.04485, 0, 0, 0, 1, 1,
-0.3106032, -1.334354, -4.038834, 0, 0, 0, 1, 1,
-0.3076773, -0.2658373, -1.316255, 1, 1, 1, 1, 1,
-0.3058659, -0.1837861, -1.048532, 1, 1, 1, 1, 1,
-0.2960803, -0.2900003, -3.759584, 1, 1, 1, 1, 1,
-0.2947107, 0.1370354, -1.432877, 1, 1, 1, 1, 1,
-0.2938648, 0.5584368, 1.269037, 1, 1, 1, 1, 1,
-0.2922756, -0.9093512, -0.6035816, 1, 1, 1, 1, 1,
-0.2921127, -1.037949, -3.568253, 1, 1, 1, 1, 1,
-0.2892296, -0.0333745, -2.92748, 1, 1, 1, 1, 1,
-0.2784832, 0.9141408, 0.1276533, 1, 1, 1, 1, 1,
-0.2781418, 1.985637, 0.6097695, 1, 1, 1, 1, 1,
-0.2739192, 0.6893361, 2.004837, 1, 1, 1, 1, 1,
-0.2724056, -0.1522387, -1.871444, 1, 1, 1, 1, 1,
-0.2716141, 0.6781553, -0.2568572, 1, 1, 1, 1, 1,
-0.2623198, -0.7763811, -5.699187, 1, 1, 1, 1, 1,
-0.2611747, -0.8789637, -4.079351, 1, 1, 1, 1, 1,
-0.2594422, -1.302646, -4.192674, 0, 0, 1, 1, 1,
-0.2552609, 1.421884, -0.6112653, 1, 0, 0, 1, 1,
-0.2504132, 0.2767457, -1.057431, 1, 0, 0, 1, 1,
-0.2496789, 1.307223, -1.404218, 1, 0, 0, 1, 1,
-0.2475487, 0.4692191, -0.06288148, 1, 0, 0, 1, 1,
-0.2474369, -1.63077, -2.289751, 1, 0, 0, 1, 1,
-0.2472278, 0.5362028, 0.5429559, 0, 0, 0, 1, 1,
-0.247181, -1.25398, -3.24144, 0, 0, 0, 1, 1,
-0.2470378, 1.676789, 0.635049, 0, 0, 0, 1, 1,
-0.2462293, -0.9247062, -3.255393, 0, 0, 0, 1, 1,
-0.2461128, 0.7347777, -0.108054, 0, 0, 0, 1, 1,
-0.2445198, -1.34256, -1.696053, 0, 0, 0, 1, 1,
-0.2386624, 0.08259555, -0.4492213, 0, 0, 0, 1, 1,
-0.2365104, -0.1687048, -0.5714005, 1, 1, 1, 1, 1,
-0.2305109, -0.1813031, -3.761457, 1, 1, 1, 1, 1,
-0.2304778, 1.358594, 0.9099794, 1, 1, 1, 1, 1,
-0.2294677, -1.075342, -2.716557, 1, 1, 1, 1, 1,
-0.2284246, -0.8634132, -3.157282, 1, 1, 1, 1, 1,
-0.227037, 1.90061, 1.45663, 1, 1, 1, 1, 1,
-0.222854, -0.9595408, -2.295895, 1, 1, 1, 1, 1,
-0.2209407, 0.6644835, -0.7907553, 1, 1, 1, 1, 1,
-0.2204455, 1.600959, 1.090044, 1, 1, 1, 1, 1,
-0.2199147, -1.744932, -4.266344, 1, 1, 1, 1, 1,
-0.2197025, -1.646474, -3.093681, 1, 1, 1, 1, 1,
-0.2194802, -2.333217, -4.358269, 1, 1, 1, 1, 1,
-0.2186577, 0.6756366, -0.4606147, 1, 1, 1, 1, 1,
-0.2173428, 0.8709198, -1.394089, 1, 1, 1, 1, 1,
-0.2163701, -0.6922624, -2.400962, 1, 1, 1, 1, 1,
-0.2083065, 0.2300062, -0.6462553, 0, 0, 1, 1, 1,
-0.2078671, -0.5742938, -2.403541, 1, 0, 0, 1, 1,
-0.2040826, 1.687423, -0.3822005, 1, 0, 0, 1, 1,
-0.2024793, -0.7640918, -2.576052, 1, 0, 0, 1, 1,
-0.2016937, -0.6267282, -4.457987, 1, 0, 0, 1, 1,
-0.1998056, 1.911346, -0.6621166, 1, 0, 0, 1, 1,
-0.1974465, -0.1673605, -2.823879, 0, 0, 0, 1, 1,
-0.1972449, 0.1889656, -2.137439, 0, 0, 0, 1, 1,
-0.1937917, -1.405071, -2.146399, 0, 0, 0, 1, 1,
-0.1912861, -0.9352889, -1.254006, 0, 0, 0, 1, 1,
-0.1884179, -0.9597242, -2.985932, 0, 0, 0, 1, 1,
-0.183587, 1.491524, -0.5777265, 0, 0, 0, 1, 1,
-0.1825553, 0.3868004, -0.7182947, 0, 0, 0, 1, 1,
-0.182417, 1.409956, 0.1358294, 1, 1, 1, 1, 1,
-0.1824133, 0.8896424, -1.348637, 1, 1, 1, 1, 1,
-0.1816882, -2.233828, -4.758036, 1, 1, 1, 1, 1,
-0.1812207, -0.6477318, -3.264834, 1, 1, 1, 1, 1,
-0.1800998, -1.331163, -2.923078, 1, 1, 1, 1, 1,
-0.1797108, -0.1319038, -1.568485, 1, 1, 1, 1, 1,
-0.1792219, -0.489315, -1.582342, 1, 1, 1, 1, 1,
-0.1789751, 1.14929, -1.42184, 1, 1, 1, 1, 1,
-0.1736207, -1.451111, -3.233258, 1, 1, 1, 1, 1,
-0.170516, -3.164456, -2.78542, 1, 1, 1, 1, 1,
-0.1691565, 1.20532, -0.8250906, 1, 1, 1, 1, 1,
-0.1686554, -1.526706, -1.976578, 1, 1, 1, 1, 1,
-0.1681881, 0.08066116, -1.04936, 1, 1, 1, 1, 1,
-0.1653768, -1.007296, -1.578344, 1, 1, 1, 1, 1,
-0.1588011, -1.068838, -4.434046, 1, 1, 1, 1, 1,
-0.153803, -0.2119972, -1.993813, 0, 0, 1, 1, 1,
-0.1451774, -0.3411703, -2.717535, 1, 0, 0, 1, 1,
-0.1388413, -0.6262078, -2.052354, 1, 0, 0, 1, 1,
-0.1379702, -1.15172, -2.796727, 1, 0, 0, 1, 1,
-0.1356943, 2.569676, 1.758382, 1, 0, 0, 1, 1,
-0.134929, -0.4617921, -1.571139, 1, 0, 0, 1, 1,
-0.1345228, 0.8340935, -0.9172666, 0, 0, 0, 1, 1,
-0.1325701, -0.9541438, -4.329628, 0, 0, 0, 1, 1,
-0.1319133, 1.51111, 0.2824565, 0, 0, 0, 1, 1,
-0.1280125, 0.6587244, 0.2768222, 0, 0, 0, 1, 1,
-0.1279753, 0.183677, -0.1585351, 0, 0, 0, 1, 1,
-0.1278735, -0.3823811, -0.9545953, 0, 0, 0, 1, 1,
-0.1246811, 0.1467024, -1.783199, 0, 0, 0, 1, 1,
-0.1228603, 0.2071265, 1.189403, 1, 1, 1, 1, 1,
-0.1228152, -1.42302, -3.985015, 1, 1, 1, 1, 1,
-0.1195969, 0.02623178, -1.897208, 1, 1, 1, 1, 1,
-0.1177439, -0.9300027, -4.324656, 1, 1, 1, 1, 1,
-0.116491, -0.5775894, -4.312982, 1, 1, 1, 1, 1,
-0.1155095, -1.385734, -1.961159, 1, 1, 1, 1, 1,
-0.1134984, -1.496251, -2.565537, 1, 1, 1, 1, 1,
-0.1080053, 1.102091, -1.023647, 1, 1, 1, 1, 1,
-0.1070176, -1.078923, -5.632256, 1, 1, 1, 1, 1,
-0.1032947, -0.8010748, -2.051986, 1, 1, 1, 1, 1,
-0.100821, -0.5827405, -2.477994, 1, 1, 1, 1, 1,
-0.09682985, -0.831672, -3.594434, 1, 1, 1, 1, 1,
-0.09340572, -0.3059703, -1.903808, 1, 1, 1, 1, 1,
-0.09187324, -2.082486, -2.101087, 1, 1, 1, 1, 1,
-0.09108049, -2.084229, -2.822657, 1, 1, 1, 1, 1,
-0.09022215, 0.4424927, -0.5637579, 0, 0, 1, 1, 1,
-0.08968556, -0.4274054, -3.50926, 1, 0, 0, 1, 1,
-0.08947906, 0.7778249, 1.41094, 1, 0, 0, 1, 1,
-0.08677015, -0.1686437, -3.354568, 1, 0, 0, 1, 1,
-0.08409086, -0.464245, -3.613692, 1, 0, 0, 1, 1,
-0.08394091, 0.706372, 1.7255, 1, 0, 0, 1, 1,
-0.08023816, 0.1010087, 0.2097827, 0, 0, 0, 1, 1,
-0.07959566, 0.7088451, 0.3616047, 0, 0, 0, 1, 1,
-0.07958713, 0.826928, 1.24911, 0, 0, 0, 1, 1,
-0.07788029, 0.6082132, 0.958584, 0, 0, 0, 1, 1,
-0.07376279, 1.145294, -0.216744, 0, 0, 0, 1, 1,
-0.07026531, 0.2964422, -0.4620357, 0, 0, 0, 1, 1,
-0.06766453, 0.4945664, 1.204356, 0, 0, 0, 1, 1,
-0.0623218, 0.4843626, -0.7373946, 1, 1, 1, 1, 1,
-0.06122798, 0.4670388, 1.422236, 1, 1, 1, 1, 1,
-0.06069832, 0.07527173, -0.6435021, 1, 1, 1, 1, 1,
-0.05931485, 0.289076, -0.7368407, 1, 1, 1, 1, 1,
-0.0554427, 1.824643, -0.1082256, 1, 1, 1, 1, 1,
-0.05476194, -1.588941, -3.637475, 1, 1, 1, 1, 1,
-0.04390055, -0.7343594, -3.231347, 1, 1, 1, 1, 1,
-0.04369594, 1.863463, -0.7152444, 1, 1, 1, 1, 1,
-0.04360939, 0.01640812, -1.710327, 1, 1, 1, 1, 1,
-0.04215911, 0.155916, 2.097562, 1, 1, 1, 1, 1,
-0.04173697, 0.001079859, -2.697212, 1, 1, 1, 1, 1,
-0.0402818, 0.9104419, -1.000794, 1, 1, 1, 1, 1,
-0.03880686, -1.274477, -4.189921, 1, 1, 1, 1, 1,
-0.03781648, -0.5734593, -2.811392, 1, 1, 1, 1, 1,
-0.03735251, 1.32663, 0.3397264, 1, 1, 1, 1, 1,
-0.03612106, 0.471353, 1.900002, 0, 0, 1, 1, 1,
-0.03169515, -1.085419, -2.455539, 1, 0, 0, 1, 1,
-0.0297387, 0.902987, -0.5854278, 1, 0, 0, 1, 1,
-0.02969046, -0.7298933, -3.156249, 1, 0, 0, 1, 1,
-0.02892568, -2.119042, -2.407916, 1, 0, 0, 1, 1,
-0.02888002, 0.8126974, -0.02452146, 1, 0, 0, 1, 1,
-0.02301311, 1.004123, -2.517852, 0, 0, 0, 1, 1,
-0.02278314, 0.870275, -2.117429, 0, 0, 0, 1, 1,
-0.01465258, 0.4760726, -1.284546, 0, 0, 0, 1, 1,
-0.01337455, -0.1531977, -1.549486, 0, 0, 0, 1, 1,
-0.003022076, -0.04897316, -3.250341, 0, 0, 0, 1, 1,
0.004267432, 0.6708208, 0.9406299, 0, 0, 0, 1, 1,
0.004775659, -0.1731041, 3.488959, 0, 0, 0, 1, 1,
0.005429633, 0.7235162, 1.173671, 1, 1, 1, 1, 1,
0.01158399, 0.9581522, -0.5644916, 1, 1, 1, 1, 1,
0.01344238, -0.107439, 2.385289, 1, 1, 1, 1, 1,
0.014664, 1.073161, -0.574278, 1, 1, 1, 1, 1,
0.01472771, -1.328706, 2.998392, 1, 1, 1, 1, 1,
0.01984336, -1.643189, 3.005038, 1, 1, 1, 1, 1,
0.02429478, -1.046992, 0.5972329, 1, 1, 1, 1, 1,
0.02690451, 0.712837, 0.1462977, 1, 1, 1, 1, 1,
0.03409633, -1.727819, 2.94996, 1, 1, 1, 1, 1,
0.03908724, 0.9766104, 1.796952, 1, 1, 1, 1, 1,
0.0405424, 1.561938, 0.4686637, 1, 1, 1, 1, 1,
0.04096361, 0.5269703, -0.9886072, 1, 1, 1, 1, 1,
0.04217967, 0.454926, -0.3731291, 1, 1, 1, 1, 1,
0.04434502, -0.6874156, 3.326779, 1, 1, 1, 1, 1,
0.05004406, -1.651439, 1.690052, 1, 1, 1, 1, 1,
0.05273498, 1.154313, 0.3449548, 0, 0, 1, 1, 1,
0.05290823, -0.7347623, 1.688505, 1, 0, 0, 1, 1,
0.05574581, -0.7704055, 3.209695, 1, 0, 0, 1, 1,
0.05936439, 0.005644491, 0.7664734, 1, 0, 0, 1, 1,
0.05951488, -0.7758602, 2.366077, 1, 0, 0, 1, 1,
0.06017861, -1.625569, 3.833188, 1, 0, 0, 1, 1,
0.0647447, 1.269145, -0.8931702, 0, 0, 0, 1, 1,
0.06563114, 1.572101, -0.09181301, 0, 0, 0, 1, 1,
0.06832238, 0.07221086, 0.9698385, 0, 0, 0, 1, 1,
0.07000092, -1.153613, 3.051703, 0, 0, 0, 1, 1,
0.07100947, -0.8828139, 4.273069, 0, 0, 0, 1, 1,
0.07163798, -0.2872572, 2.340799, 0, 0, 0, 1, 1,
0.07846164, 0.09084571, 1.439354, 0, 0, 0, 1, 1,
0.08171103, 1.636206, 0.278184, 1, 1, 1, 1, 1,
0.08272506, -0.7637205, 4.319299, 1, 1, 1, 1, 1,
0.08359818, -0.9151289, 2.518344, 1, 1, 1, 1, 1,
0.08930042, -0.6716265, 4.03507, 1, 1, 1, 1, 1,
0.08937589, 0.4144657, 0.5159636, 1, 1, 1, 1, 1,
0.09426069, -0.08665124, 0.01252826, 1, 1, 1, 1, 1,
0.1061613, 1.602076, -0.4806606, 1, 1, 1, 1, 1,
0.1068898, 1.483146, 0.2848928, 1, 1, 1, 1, 1,
0.1078525, -0.6615339, 1.505965, 1, 1, 1, 1, 1,
0.1094599, 0.6328434, 1.630605, 1, 1, 1, 1, 1,
0.1095022, 1.119829, -0.9651817, 1, 1, 1, 1, 1,
0.1135666, 1.503115, -0.387548, 1, 1, 1, 1, 1,
0.1167152, -1.575643, 3.385382, 1, 1, 1, 1, 1,
0.1192194, -0.2803307, 2.029673, 1, 1, 1, 1, 1,
0.1238332, 2.834586, 1.171335, 1, 1, 1, 1, 1,
0.1274754, -0.07982167, 2.661242, 0, 0, 1, 1, 1,
0.1287121, -1.242633, 2.805984, 1, 0, 0, 1, 1,
0.1295338, -1.710127, 2.024209, 1, 0, 0, 1, 1,
0.1325479, 0.07242434, 0.04993238, 1, 0, 0, 1, 1,
0.1394147, 2.898487, 0.8879661, 1, 0, 0, 1, 1,
0.1395654, 1.763949, 0.7429668, 1, 0, 0, 1, 1,
0.1450178, -0.2950379, 2.877379, 0, 0, 0, 1, 1,
0.145687, -0.6755586, 2.955442, 0, 0, 0, 1, 1,
0.1480586, 1.521384, 0.5598027, 0, 0, 0, 1, 1,
0.1487386, -0.2506494, 3.181808, 0, 0, 0, 1, 1,
0.1531352, -0.1039511, 1.321942, 0, 0, 0, 1, 1,
0.1533307, 0.4404061, -0.340211, 0, 0, 0, 1, 1,
0.1548885, 0.7454798, -0.1225107, 0, 0, 0, 1, 1,
0.1629537, -0.4068019, 4.31435, 1, 1, 1, 1, 1,
0.1638848, 0.2595932, 2.014447, 1, 1, 1, 1, 1,
0.1688166, 1.050293, 0.1224029, 1, 1, 1, 1, 1,
0.1721063, -0.1206606, 1.023922, 1, 1, 1, 1, 1,
0.1741728, -0.0322395, 2.856144, 1, 1, 1, 1, 1,
0.175109, 0.02727676, 1.169133, 1, 1, 1, 1, 1,
0.1752309, -0.3197038, 2.478807, 1, 1, 1, 1, 1,
0.1767363, -0.6005476, 3.325728, 1, 1, 1, 1, 1,
0.180541, -0.9264449, 2.645459, 1, 1, 1, 1, 1,
0.1846683, -0.004136394, 1.623378, 1, 1, 1, 1, 1,
0.1858453, -0.6699146, 2.338069, 1, 1, 1, 1, 1,
0.1876241, 1.204002, 0.2888676, 1, 1, 1, 1, 1,
0.188609, 0.07156224, 2.227978, 1, 1, 1, 1, 1,
0.1917777, 1.239011, -0.5219459, 1, 1, 1, 1, 1,
0.1939426, -1.162014, 4.877018, 1, 1, 1, 1, 1,
0.1944586, 0.3683576, -0.124916, 0, 0, 1, 1, 1,
0.1970447, -2.254907, 3.276941, 1, 0, 0, 1, 1,
0.1977877, -1.075504, 3.448801, 1, 0, 0, 1, 1,
0.1981823, 0.02546225, 1.556277, 1, 0, 0, 1, 1,
0.2043733, -0.1736902, 3.295694, 1, 0, 0, 1, 1,
0.2044659, 0.8322755, 1.987343, 1, 0, 0, 1, 1,
0.2121312, -0.7645833, 2.247221, 0, 0, 0, 1, 1,
0.2137606, 0.8404787, -0.3554555, 0, 0, 0, 1, 1,
0.2152403, 0.3955899, -1.003141, 0, 0, 0, 1, 1,
0.2159382, 0.2057388, 1.799846, 0, 0, 0, 1, 1,
0.2169058, -1.079237, 3.551689, 0, 0, 0, 1, 1,
0.2175499, -0.3284246, 2.90622, 0, 0, 0, 1, 1,
0.2277567, -0.6436482, 1.633702, 0, 0, 0, 1, 1,
0.2278367, 2.216488, -0.8869805, 1, 1, 1, 1, 1,
0.2304018, -1.149406, 2.416171, 1, 1, 1, 1, 1,
0.2332519, 0.9132294, 0.7542681, 1, 1, 1, 1, 1,
0.233423, -0.3319409, 2.878771, 1, 1, 1, 1, 1,
0.2339642, -0.2564822, 1.509623, 1, 1, 1, 1, 1,
0.2341015, 0.02325423, 1.651159, 1, 1, 1, 1, 1,
0.234212, 1.245685, 1.32299, 1, 1, 1, 1, 1,
0.2382936, -0.01092333, 3.586807, 1, 1, 1, 1, 1,
0.2384901, 1.113829, 0.5063809, 1, 1, 1, 1, 1,
0.2393665, 1.002445, -0.729986, 1, 1, 1, 1, 1,
0.239596, -0.5503864, 2.719113, 1, 1, 1, 1, 1,
0.2405382, 0.073724, 2.168757, 1, 1, 1, 1, 1,
0.2443591, -1.09617, 2.235688, 1, 1, 1, 1, 1,
0.2451928, 0.469661, 0.7588867, 1, 1, 1, 1, 1,
0.247455, 0.7657757, 0.06487779, 1, 1, 1, 1, 1,
0.2554819, -0.0848883, 1.599886, 0, 0, 1, 1, 1,
0.2640199, -0.01918879, 0.01927477, 1, 0, 0, 1, 1,
0.2652141, 0.6731079, 0.1812239, 1, 0, 0, 1, 1,
0.2659139, -0.827592, 2.774026, 1, 0, 0, 1, 1,
0.2710006, 0.731142, -1.003154, 1, 0, 0, 1, 1,
0.2723666, 1.834887, -1.538228, 1, 0, 0, 1, 1,
0.2767631, -1.221508, 3.216401, 0, 0, 0, 1, 1,
0.2842652, 0.8379856, 0.7679483, 0, 0, 0, 1, 1,
0.2910791, 0.04963452, 2.18978, 0, 0, 0, 1, 1,
0.2976049, 0.3513934, 1.933948, 0, 0, 0, 1, 1,
0.3021041, -1.219044, 3.015001, 0, 0, 0, 1, 1,
0.3043962, -0.2596577, 3.030308, 0, 0, 0, 1, 1,
0.304934, 0.7267524, -0.5430928, 0, 0, 0, 1, 1,
0.3072096, 0.8668176, 2.137845, 1, 1, 1, 1, 1,
0.3084937, -0.2302268, 3.619773, 1, 1, 1, 1, 1,
0.3085302, -1.18109, 3.44433, 1, 1, 1, 1, 1,
0.3085365, 0.1385315, 1.571245, 1, 1, 1, 1, 1,
0.3091814, -0.4652478, 1.502747, 1, 1, 1, 1, 1,
0.311978, 0.428844, -0.3974658, 1, 1, 1, 1, 1,
0.3149478, 0.2810509, 1.842176, 1, 1, 1, 1, 1,
0.316924, -0.16231, 2.649103, 1, 1, 1, 1, 1,
0.3191106, -1.204014, 3.953799, 1, 1, 1, 1, 1,
0.3196153, -0.2746803, 2.430476, 1, 1, 1, 1, 1,
0.31981, 0.7497071, 0.1268385, 1, 1, 1, 1, 1,
0.3213987, 3.069332, -0.8570605, 1, 1, 1, 1, 1,
0.3214349, -1.156092, 3.573644, 1, 1, 1, 1, 1,
0.3215159, -0.7124895, 3.93157, 1, 1, 1, 1, 1,
0.3225483, 0.03699892, 1.667816, 1, 1, 1, 1, 1,
0.3245464, 0.2045866, 0.1431085, 0, 0, 1, 1, 1,
0.3246062, 0.3175, 3.32299, 1, 0, 0, 1, 1,
0.3298814, -1.813495, 3.18752, 1, 0, 0, 1, 1,
0.3302599, 0.4914711, -0.3708065, 1, 0, 0, 1, 1,
0.333729, 1.109093, 0.8122617, 1, 0, 0, 1, 1,
0.3372502, 1.226714, -1.033012, 1, 0, 0, 1, 1,
0.3394195, 0.4415897, -0.5394322, 0, 0, 0, 1, 1,
0.3409702, -0.4382768, 1.660804, 0, 0, 0, 1, 1,
0.3412277, -0.7275426, 3.952752, 0, 0, 0, 1, 1,
0.3450508, -0.140621, -0.7647091, 0, 0, 0, 1, 1,
0.3460644, -0.3064281, 2.543945, 0, 0, 0, 1, 1,
0.3462707, 0.8547228, -0.02072777, 0, 0, 0, 1, 1,
0.3483818, -0.4665664, 2.389884, 0, 0, 0, 1, 1,
0.351335, -0.5432876, 0.7912404, 1, 1, 1, 1, 1,
0.3516694, -1.07596, 4.005251, 1, 1, 1, 1, 1,
0.3526293, -1.338182, 3.16087, 1, 1, 1, 1, 1,
0.3540917, 0.543816, 1.785975, 1, 1, 1, 1, 1,
0.3556639, -0.5617537, 3.425093, 1, 1, 1, 1, 1,
0.3592847, 1.663511, -0.3637153, 1, 1, 1, 1, 1,
0.3606568, -0.1659368, 2.598838, 1, 1, 1, 1, 1,
0.3627293, -0.3557456, 1.353707, 1, 1, 1, 1, 1,
0.3627295, 0.4186129, -0.5630372, 1, 1, 1, 1, 1,
0.3712061, 1.990197, 0.3259677, 1, 1, 1, 1, 1,
0.3845906, -1.132563, 4.419195, 1, 1, 1, 1, 1,
0.3865807, 1.102009, -1.26689, 1, 1, 1, 1, 1,
0.387061, -0.8181143, 2.453323, 1, 1, 1, 1, 1,
0.3893099, 0.6169341, -0.1919932, 1, 1, 1, 1, 1,
0.3898562, -1.164356, 1.996921, 1, 1, 1, 1, 1,
0.395168, 1.028371, -0.455859, 0, 0, 1, 1, 1,
0.3974817, 1.410935, -0.02821084, 1, 0, 0, 1, 1,
0.4049097, -0.3463868, 3.009218, 1, 0, 0, 1, 1,
0.4055962, -0.5876881, 2.279395, 1, 0, 0, 1, 1,
0.4085296, -0.8023165, 2.519606, 1, 0, 0, 1, 1,
0.41004, -0.567345, 2.992567, 1, 0, 0, 1, 1,
0.4100586, -1.274762, 3.3198, 0, 0, 0, 1, 1,
0.41131, -0.9846258, 2.569218, 0, 0, 0, 1, 1,
0.4218994, 1.149554, -0.778066, 0, 0, 0, 1, 1,
0.4219332, -0.4744553, 3.838055, 0, 0, 0, 1, 1,
0.426565, -1.635369, 4.163544, 0, 0, 0, 1, 1,
0.4289761, 0.714068, -0.5212101, 0, 0, 0, 1, 1,
0.429118, 0.1027466, 1.853384, 0, 0, 0, 1, 1,
0.4298219, 0.8825385, -0.02761374, 1, 1, 1, 1, 1,
0.4320597, -0.2762695, 2.062268, 1, 1, 1, 1, 1,
0.4324019, -1.529942, 3.020075, 1, 1, 1, 1, 1,
0.4345028, -1.651119, 2.919114, 1, 1, 1, 1, 1,
0.4383216, 2.233974, -1.975149, 1, 1, 1, 1, 1,
0.4426162, -1.048482, 2.671784, 1, 1, 1, 1, 1,
0.4427466, -1.163242, 4.200866, 1, 1, 1, 1, 1,
0.4430495, 1.099361, 1.430129, 1, 1, 1, 1, 1,
0.4454471, 0.01372008, -0.05176866, 1, 1, 1, 1, 1,
0.450404, 0.00481772, 2.350287, 1, 1, 1, 1, 1,
0.4508393, -1.552272, 3.110333, 1, 1, 1, 1, 1,
0.4516048, -1.651132, 2.811137, 1, 1, 1, 1, 1,
0.4534881, -0.3341239, 2.280336, 1, 1, 1, 1, 1,
0.4560047, -1.685507, 1.830694, 1, 1, 1, 1, 1,
0.456166, 0.5396199, 0.04613184, 1, 1, 1, 1, 1,
0.4618318, -0.9818828, 4.208604, 0, 0, 1, 1, 1,
0.4625829, 0.3095595, 0.1799426, 1, 0, 0, 1, 1,
0.4626533, -0.3906805, 3.345488, 1, 0, 0, 1, 1,
0.4631551, -0.01995158, 1.482171, 1, 0, 0, 1, 1,
0.4664397, -0.9994726, 2.039299, 1, 0, 0, 1, 1,
0.4671026, 0.1554942, 2.565706, 1, 0, 0, 1, 1,
0.4706094, -0.4798903, 3.14903, 0, 0, 0, 1, 1,
0.4768417, -0.12965, 1.547172, 0, 0, 0, 1, 1,
0.4776366, -0.5478804, 2.773211, 0, 0, 0, 1, 1,
0.4799969, 0.39223, -0.4552487, 0, 0, 0, 1, 1,
0.4860093, 0.259211, 0.006909001, 0, 0, 0, 1, 1,
0.4864699, -0.1386581, 2.836337, 0, 0, 0, 1, 1,
0.4876374, 0.747609, -0.4484603, 0, 0, 0, 1, 1,
0.4905418, 1.293772, 2.675209, 1, 1, 1, 1, 1,
0.4908056, 0.2556811, 1.269762, 1, 1, 1, 1, 1,
0.4942351, -1.949384, 3.827789, 1, 1, 1, 1, 1,
0.4999049, 1.571566, -0.5800296, 1, 1, 1, 1, 1,
0.5037904, 0.9279143, 0.4576988, 1, 1, 1, 1, 1,
0.5043589, -0.9489075, 4.036497, 1, 1, 1, 1, 1,
0.5122265, -0.9041674, 2.348969, 1, 1, 1, 1, 1,
0.514664, 0.08861271, 0.9776257, 1, 1, 1, 1, 1,
0.5187559, -0.1411337, 3.007107, 1, 1, 1, 1, 1,
0.518837, 0.4684693, -0.1636131, 1, 1, 1, 1, 1,
0.5225204, 1.526965, 0.8715975, 1, 1, 1, 1, 1,
0.5262547, 0.1120812, 2.427875, 1, 1, 1, 1, 1,
0.529188, -0.214107, 0.2691453, 1, 1, 1, 1, 1,
0.5342391, -0.6851795, 2.763287, 1, 1, 1, 1, 1,
0.5403011, -0.05164616, 1.784171, 1, 1, 1, 1, 1,
0.5455411, -1.210422, 3.301474, 0, 0, 1, 1, 1,
0.5469271, 0.6010114, 1.018251, 1, 0, 0, 1, 1,
0.5470448, 0.5758984, 1.687578, 1, 0, 0, 1, 1,
0.5511798, -0.277308, 3.681233, 1, 0, 0, 1, 1,
0.5515201, -0.4274087, 2.61282, 1, 0, 0, 1, 1,
0.5537513, 0.7115102, 0.6097593, 1, 0, 0, 1, 1,
0.5568945, -1.196466, 2.37332, 0, 0, 0, 1, 1,
0.5570821, -1.182842, 1.669426, 0, 0, 0, 1, 1,
0.557638, -0.238342, 3.570763, 0, 0, 0, 1, 1,
0.5616996, 0.5008928, 0.4947672, 0, 0, 0, 1, 1,
0.5645651, 0.2247763, 1.309566, 0, 0, 0, 1, 1,
0.5671789, -1.146157, 2.923122, 0, 0, 0, 1, 1,
0.5723215, -0.3538241, 1.532813, 0, 0, 0, 1, 1,
0.5724577, 0.5514111, 0.8229203, 1, 1, 1, 1, 1,
0.5725656, 0.4609362, 0.009162183, 1, 1, 1, 1, 1,
0.5751255, 0.7405054, 0.008177892, 1, 1, 1, 1, 1,
0.5832102, -0.8742887, 3.268494, 1, 1, 1, 1, 1,
0.5833139, -0.2242439, 2.259917, 1, 1, 1, 1, 1,
0.5867845, -0.03737528, 1.047608, 1, 1, 1, 1, 1,
0.5881438, -1.796179, 2.314854, 1, 1, 1, 1, 1,
0.5886846, -1.94532, 3.494691, 1, 1, 1, 1, 1,
0.5887102, -1.8664, 1.530765, 1, 1, 1, 1, 1,
0.591341, 0.2185889, 1.134303, 1, 1, 1, 1, 1,
0.5944834, 0.3070202, 1.337217, 1, 1, 1, 1, 1,
0.600181, -1.34206, 3.832178, 1, 1, 1, 1, 1,
0.6018112, 0.7990894, 0.2238493, 1, 1, 1, 1, 1,
0.6029803, -1.170618, 2.410959, 1, 1, 1, 1, 1,
0.6044697, -0.2080806, 1.929785, 1, 1, 1, 1, 1,
0.6057419, -0.3808036, 2.83559, 0, 0, 1, 1, 1,
0.6075667, 0.2434634, 3.535261, 1, 0, 0, 1, 1,
0.6083288, 0.1676543, 2.359543, 1, 0, 0, 1, 1,
0.6196126, -0.5625573, 1.804437, 1, 0, 0, 1, 1,
0.6298069, 1.028033, 0.9724823, 1, 0, 0, 1, 1,
0.6324909, 0.04098452, 2.300532, 1, 0, 0, 1, 1,
0.6326114, -1.458792, 2.941731, 0, 0, 0, 1, 1,
0.6363959, 1.285279, 1.217018, 0, 0, 0, 1, 1,
0.6370705, 2.271497, -0.9092063, 0, 0, 0, 1, 1,
0.6382943, -0.6497087, 1.768143, 0, 0, 0, 1, 1,
0.6386306, -2.090995, 3.152076, 0, 0, 0, 1, 1,
0.6411233, -1.390036, 3.506641, 0, 0, 0, 1, 1,
0.6500647, -0.7360234, 2.229252, 0, 0, 0, 1, 1,
0.6512752, -0.2537748, 2.673062, 1, 1, 1, 1, 1,
0.657387, 1.109254, 1.101862, 1, 1, 1, 1, 1,
0.658326, -0.1958668, 2.323448, 1, 1, 1, 1, 1,
0.6586922, 0.3160768, 1.488054, 1, 1, 1, 1, 1,
0.6694426, -0.6207494, 2.959201, 1, 1, 1, 1, 1,
0.6709661, -0.8626226, 1.897993, 1, 1, 1, 1, 1,
0.6735855, 0.796667, 0.8229846, 1, 1, 1, 1, 1,
0.6802318, -1.175977, 2.528826, 1, 1, 1, 1, 1,
0.6880253, -2.883955, 2.051846, 1, 1, 1, 1, 1,
0.6938613, -0.213975, 3.768169, 1, 1, 1, 1, 1,
0.7186363, -0.3144908, 1.209996, 1, 1, 1, 1, 1,
0.7260609, 0.8338332, 0.3613525, 1, 1, 1, 1, 1,
0.7261595, -1.409329, 1.977609, 1, 1, 1, 1, 1,
0.7348805, 0.3677977, 0.5665728, 1, 1, 1, 1, 1,
0.734928, 0.1280549, 2.227068, 1, 1, 1, 1, 1,
0.7464835, -0.5738624, 1.410008, 0, 0, 1, 1, 1,
0.746651, 1.443842, 0.2606809, 1, 0, 0, 1, 1,
0.7475816, 0.8552675, 1.911747, 1, 0, 0, 1, 1,
0.7477944, -0.5609461, 1.988446, 1, 0, 0, 1, 1,
0.7533431, -0.3065755, 2.512479, 1, 0, 0, 1, 1,
0.7571454, -0.3982878, 1.822607, 1, 0, 0, 1, 1,
0.758411, -1.573126, 2.58035, 0, 0, 0, 1, 1,
0.7620004, -0.8189089, 1.497761, 0, 0, 0, 1, 1,
0.7639256, -0.04886101, 1.300885, 0, 0, 0, 1, 1,
0.7701384, -1.256506, 3.440551, 0, 0, 0, 1, 1,
0.7759886, 0.4429807, 0.557988, 0, 0, 0, 1, 1,
0.776282, 1.583241, 1.881195, 0, 0, 0, 1, 1,
0.7807557, -2.784678, 3.041396, 0, 0, 0, 1, 1,
0.7824981, -0.4860381, 2.638359, 1, 1, 1, 1, 1,
0.802003, 0.2633322, 0.7570089, 1, 1, 1, 1, 1,
0.8080404, 1.442124, 0.3937459, 1, 1, 1, 1, 1,
0.8122663, 1.608112, -0.6613615, 1, 1, 1, 1, 1,
0.8126981, 0.5867781, 1.240201, 1, 1, 1, 1, 1,
0.8134778, -3.34528, 2.861364, 1, 1, 1, 1, 1,
0.8152404, 1.341769, 0.7034191, 1, 1, 1, 1, 1,
0.8162804, 0.6359464, -0.8379587, 1, 1, 1, 1, 1,
0.8251626, -0.1433635, 3.661088, 1, 1, 1, 1, 1,
0.8284112, 1.037182, -0.346893, 1, 1, 1, 1, 1,
0.8289033, 0.05853255, 2.202654, 1, 1, 1, 1, 1,
0.8292219, -0.6523542, 1.80407, 1, 1, 1, 1, 1,
0.8370826, -0.2594731, 1.322318, 1, 1, 1, 1, 1,
0.8389797, -1.408365, 3.943702, 1, 1, 1, 1, 1,
0.8400438, 0.3132473, 1.189492, 1, 1, 1, 1, 1,
0.8483977, 0.6434093, -0.2196076, 0, 0, 1, 1, 1,
0.8510263, -0.07370005, 2.897499, 1, 0, 0, 1, 1,
0.8513177, -0.02494375, 2.495966, 1, 0, 0, 1, 1,
0.8628098, 0.1608773, 1.314421, 1, 0, 0, 1, 1,
0.864476, -0.5085625, 2.24783, 1, 0, 0, 1, 1,
0.8646501, -0.1540833, -0.398032, 1, 0, 0, 1, 1,
0.8677987, -0.2591986, 0.8173929, 0, 0, 0, 1, 1,
0.8731378, -0.6005542, 3.032544, 0, 0, 0, 1, 1,
0.875533, 0.7595533, 2.089399, 0, 0, 0, 1, 1,
0.8757984, 0.8632882, 0.03417404, 0, 0, 0, 1, 1,
0.8758106, 1.747276, -0.0206549, 0, 0, 0, 1, 1,
0.8758869, 0.727963, 1.002496, 0, 0, 0, 1, 1,
0.8845142, 1.65313, 1.870924, 0, 0, 0, 1, 1,
0.8848473, 0.9552146, -0.2614477, 1, 1, 1, 1, 1,
0.8946527, -2.112761, 2.423942, 1, 1, 1, 1, 1,
0.9012851, 2.09751, 2.287105, 1, 1, 1, 1, 1,
0.9052621, -0.578132, 2.39827, 1, 1, 1, 1, 1,
0.9054794, -0.5019432, 1.545465, 1, 1, 1, 1, 1,
0.9083028, 0.2942156, 1.035451, 1, 1, 1, 1, 1,
0.9114104, -0.3449441, -0.1183207, 1, 1, 1, 1, 1,
0.9126518, -0.1183552, 2.09417, 1, 1, 1, 1, 1,
0.9159989, 0.3063564, 0.6840301, 1, 1, 1, 1, 1,
0.9165589, -0.3085163, 3.313943, 1, 1, 1, 1, 1,
0.9166133, -1.162785, 1.540173, 1, 1, 1, 1, 1,
0.9177524, -0.5941157, 2.438493, 1, 1, 1, 1, 1,
0.9193459, 1.277913, 0.8180012, 1, 1, 1, 1, 1,
0.921298, -1.077925, 3.075527, 1, 1, 1, 1, 1,
0.9222263, -0.4392646, 3.178458, 1, 1, 1, 1, 1,
0.9280162, -0.8738774, 3.013104, 0, 0, 1, 1, 1,
0.9302319, -0.8450558, 1.883107, 1, 0, 0, 1, 1,
0.9355815, -0.4548585, 0.9605962, 1, 0, 0, 1, 1,
0.9381241, 2.290851, 1.161501, 1, 0, 0, 1, 1,
0.9558057, -0.2060942, 2.779578, 1, 0, 0, 1, 1,
0.9578456, 0.0677892, 0.5079182, 1, 0, 0, 1, 1,
0.9657915, -1.384769, 2.553204, 0, 0, 0, 1, 1,
0.9695983, -1.56291, 2.040058, 0, 0, 0, 1, 1,
0.9787416, -0.1739679, 1.412571, 0, 0, 0, 1, 1,
0.9792901, -0.04460728, 2.105597, 0, 0, 0, 1, 1,
0.9817235, -1.360705, 2.545062, 0, 0, 0, 1, 1,
0.9833124, -0.6500918, 1.877718, 0, 0, 0, 1, 1,
0.9841622, 0.01669811, 0.5505998, 0, 0, 0, 1, 1,
0.991886, -2.344804, 1.713861, 1, 1, 1, 1, 1,
0.999163, -0.9068546, 1.704858, 1, 1, 1, 1, 1,
1.005336, -0.3673723, -0.01412739, 1, 1, 1, 1, 1,
1.008379, -0.2213164, 3.715287, 1, 1, 1, 1, 1,
1.014607, 0.8811795, 1.269459, 1, 1, 1, 1, 1,
1.023323, -0.7816567, 1.404846, 1, 1, 1, 1, 1,
1.025368, 0.7153168, 0.5276194, 1, 1, 1, 1, 1,
1.028415, 0.1785779, 0.02418247, 1, 1, 1, 1, 1,
1.029426, 0.90463, 2.102661, 1, 1, 1, 1, 1,
1.03288, 0.384891, 1.502908, 1, 1, 1, 1, 1,
1.041853, -0.1134415, 1.259929, 1, 1, 1, 1, 1,
1.044013, 0.5367415, 2.583955, 1, 1, 1, 1, 1,
1.045329, -0.9097163, 1.787492, 1, 1, 1, 1, 1,
1.061441, -2.155833, 1.157164, 1, 1, 1, 1, 1,
1.061928, -1.134313, 3.124117, 1, 1, 1, 1, 1,
1.062545, -1.291286, 2.309444, 0, 0, 1, 1, 1,
1.068997, -1.630957, 2.571432, 1, 0, 0, 1, 1,
1.070266, -0.07984968, 1.368058, 1, 0, 0, 1, 1,
1.075954, -0.7847998, 2.140312, 1, 0, 0, 1, 1,
1.090775, 0.02260057, 2.390463, 1, 0, 0, 1, 1,
1.095361, -0.5988623, 2.456417, 1, 0, 0, 1, 1,
1.100761, 0.2405057, 0.3770354, 0, 0, 0, 1, 1,
1.101728, -0.4615457, 0.9465353, 0, 0, 0, 1, 1,
1.108842, 0.2104392, 0.6238897, 0, 0, 0, 1, 1,
1.113262, 1.131501, 1.319393, 0, 0, 0, 1, 1,
1.124347, 0.4026547, 1.916039, 0, 0, 0, 1, 1,
1.130889, -0.2974422, 1.898012, 0, 0, 0, 1, 1,
1.134256, 0.6411037, 0.2228374, 0, 0, 0, 1, 1,
1.1414, -0.8493962, 2.502797, 1, 1, 1, 1, 1,
1.141487, -0.8988989, 0.9483585, 1, 1, 1, 1, 1,
1.145168, -0.2529446, 0.1810732, 1, 1, 1, 1, 1,
1.145851, 0.4641078, 0.273152, 1, 1, 1, 1, 1,
1.150064, -1.031513, 2.279957, 1, 1, 1, 1, 1,
1.151134, -0.6410042, 2.572722, 1, 1, 1, 1, 1,
1.153434, -0.4761873, 2.939971, 1, 1, 1, 1, 1,
1.170524, -1.317617, 1.596076, 1, 1, 1, 1, 1,
1.177069, -0.9897245, 1.811262, 1, 1, 1, 1, 1,
1.178718, -0.6268738, 1.668732, 1, 1, 1, 1, 1,
1.179525, -1.759669, 3.815913, 1, 1, 1, 1, 1,
1.182088, -1.071555, 4.076244, 1, 1, 1, 1, 1,
1.191327, -0.8945529, 0.2842473, 1, 1, 1, 1, 1,
1.194942, -0.1868521, 2.144658, 1, 1, 1, 1, 1,
1.199481, 0.4366523, 2.466182, 1, 1, 1, 1, 1,
1.202013, -1.585912, 2.763678, 0, 0, 1, 1, 1,
1.202354, 2.240038, 2.564729, 1, 0, 0, 1, 1,
1.207991, 0.9922603, 0.9161999, 1, 0, 0, 1, 1,
1.213972, 0.01932869, 0.5684289, 1, 0, 0, 1, 1,
1.221528, 1.075773, 1.42379, 1, 0, 0, 1, 1,
1.223858, 1.280143, 2.892989, 1, 0, 0, 1, 1,
1.233997, -1.988415, 3.084234, 0, 0, 0, 1, 1,
1.236046, 1.418785, 1.404077, 0, 0, 0, 1, 1,
1.237327, -0.7000451, 1.909117, 0, 0, 0, 1, 1,
1.250425, -0.5724717, 2.529361, 0, 0, 0, 1, 1,
1.252044, -0.2070052, 2.425932, 0, 0, 0, 1, 1,
1.252209, 0.2950667, 0.9551499, 0, 0, 0, 1, 1,
1.254514, -0.3689927, 1.539257, 0, 0, 0, 1, 1,
1.255727, -0.2251733, 1.433294, 1, 1, 1, 1, 1,
1.260037, -1.573044, 1.808515, 1, 1, 1, 1, 1,
1.268597, -0.4490308, 1.515467, 1, 1, 1, 1, 1,
1.274969, -1.882533, 3.07394, 1, 1, 1, 1, 1,
1.276976, -0.161158, 1.842148, 1, 1, 1, 1, 1,
1.281123, -0.8109294, 2.406361, 1, 1, 1, 1, 1,
1.28271, -0.06427459, 1.53639, 1, 1, 1, 1, 1,
1.286398, -1.363483, 1.603483, 1, 1, 1, 1, 1,
1.288587, -1.14102, 1.637722, 1, 1, 1, 1, 1,
1.293782, -1.354178, 3.3151, 1, 1, 1, 1, 1,
1.299686, -1.476732, 3.036309, 1, 1, 1, 1, 1,
1.306866, -0.7723422, 1.951224, 1, 1, 1, 1, 1,
1.337631, -1.283277, 2.025808, 1, 1, 1, 1, 1,
1.346137, -0.2522229, 2.140283, 1, 1, 1, 1, 1,
1.353192, -0.4059629, 1.415319, 1, 1, 1, 1, 1,
1.373563, 0.2255754, 1.734856, 0, 0, 1, 1, 1,
1.385353, 0.5080716, -0.1430996, 1, 0, 0, 1, 1,
1.386177, -0.6315352, 2.666611, 1, 0, 0, 1, 1,
1.389474, 0.7676418, -0.2259462, 1, 0, 0, 1, 1,
1.395398, -0.0470826, 1.208661, 1, 0, 0, 1, 1,
1.402064, -0.6365711, 3.575497, 1, 0, 0, 1, 1,
1.416305, 2.071402, -0.8274805, 0, 0, 0, 1, 1,
1.422266, 0.05641934, 0.8428932, 0, 0, 0, 1, 1,
1.427819, 0.3632637, 0.3579673, 0, 0, 0, 1, 1,
1.438129, -0.2949781, 0.7866933, 0, 0, 0, 1, 1,
1.446684, 1.172732, 1.075094, 0, 0, 0, 1, 1,
1.451527, -1.074605, 3.95283, 0, 0, 0, 1, 1,
1.453594, 0.5082061, -0.03309379, 0, 0, 0, 1, 1,
1.457992, -0.8616667, 3.107233, 1, 1, 1, 1, 1,
1.459177, 0.2414274, 1.249627, 1, 1, 1, 1, 1,
1.490347, 0.2636981, 1.859465, 1, 1, 1, 1, 1,
1.493389, -1.943375, 2.60679, 1, 1, 1, 1, 1,
1.505011, 0.0669492, 0.8715481, 1, 1, 1, 1, 1,
1.512209, 0.6469035, 0.8581052, 1, 1, 1, 1, 1,
1.516346, 1.34727, 0.2820065, 1, 1, 1, 1, 1,
1.520816, 0.3927369, 2.211789, 1, 1, 1, 1, 1,
1.543027, -1.338266, 3.263231, 1, 1, 1, 1, 1,
1.554137, 0.38337, 2.690342, 1, 1, 1, 1, 1,
1.554864, 0.4345367, 1.474567, 1, 1, 1, 1, 1,
1.559391, 1.187395, 2.377156, 1, 1, 1, 1, 1,
1.565832, 0.09902859, 0.919136, 1, 1, 1, 1, 1,
1.567525, 0.9376493, 2.029359, 1, 1, 1, 1, 1,
1.622029, 0.1278192, 3.189477, 1, 1, 1, 1, 1,
1.627008, -0.4070423, 2.868144, 0, 0, 1, 1, 1,
1.645851, 1.383397, 0.2708313, 1, 0, 0, 1, 1,
1.653554, 0.606838, 1.594353, 1, 0, 0, 1, 1,
1.661206, 0.4777444, 0.5235816, 1, 0, 0, 1, 1,
1.668914, -0.8258884, 1.579309, 1, 0, 0, 1, 1,
1.674977, 0.5354957, 3.185127, 1, 0, 0, 1, 1,
1.675954, 0.1655619, 1.253707, 0, 0, 0, 1, 1,
1.676006, 0.402587, -0.0970589, 0, 0, 0, 1, 1,
1.696402, -1.609781, 2.16851, 0, 0, 0, 1, 1,
1.697933, -1.076275, 1.332075, 0, 0, 0, 1, 1,
1.703035, -0.4590291, 1.758356, 0, 0, 0, 1, 1,
1.707814, -1.531184, 1.79374, 0, 0, 0, 1, 1,
1.739315, -0.2284665, 0.80112, 0, 0, 0, 1, 1,
1.758516, -1.893455, 0.7134408, 1, 1, 1, 1, 1,
1.760274, 0.5195714, -0.5748061, 1, 1, 1, 1, 1,
1.760641, 1.36048, 0.9328283, 1, 1, 1, 1, 1,
1.781221, 0.7324361, 3.898253, 1, 1, 1, 1, 1,
1.791562, 1.474326, 0.3750333, 1, 1, 1, 1, 1,
1.794073, 1.396994, 2.35266, 1, 1, 1, 1, 1,
1.82589, 1.055868, 1.462033, 1, 1, 1, 1, 1,
1.842739, -0.6130877, 2.395953, 1, 1, 1, 1, 1,
1.862533, 0.1955648, 1.638023, 1, 1, 1, 1, 1,
1.864467, 1.205979, 1.062181, 1, 1, 1, 1, 1,
1.889117, -1.266869, 2.816017, 1, 1, 1, 1, 1,
1.894819, 1.114419, 0.4705492, 1, 1, 1, 1, 1,
1.91164, -1.09584, 2.415699, 1, 1, 1, 1, 1,
1.913034, 0.7046738, -0.5588349, 1, 1, 1, 1, 1,
1.917814, 0.1572647, 1.226365, 1, 1, 1, 1, 1,
1.936784, 0.8490552, 1.34682, 0, 0, 1, 1, 1,
1.971055, -0.01783231, 2.887195, 1, 0, 0, 1, 1,
1.982972, 0.7246966, 2.903024, 1, 0, 0, 1, 1,
1.993918, 1.327625, 1.485876, 1, 0, 0, 1, 1,
2.009629, -0.6300619, 0.9602855, 1, 0, 0, 1, 1,
2.014748, 0.1529253, 0.9412864, 1, 0, 0, 1, 1,
2.015179, -1.110276, 4.267367, 0, 0, 0, 1, 1,
2.041201, -0.3489434, 1.048637, 0, 0, 0, 1, 1,
2.044904, 0.9302989, 0.07613938, 0, 0, 0, 1, 1,
2.052025, -0.2760389, 0.2657341, 0, 0, 0, 1, 1,
2.07589, -0.7761405, 3.949733, 0, 0, 0, 1, 1,
2.095169, -1.691448, 1.993493, 0, 0, 0, 1, 1,
2.118301, -1.482288, 3.293513, 0, 0, 0, 1, 1,
2.122145, 1.541054, -0.7220532, 1, 1, 1, 1, 1,
2.185241, 0.1150766, 2.33414, 1, 1, 1, 1, 1,
2.226654, 0.108045, 1.578871, 1, 1, 1, 1, 1,
2.237391, -0.2597432, 1.09031, 1, 1, 1, 1, 1,
2.268699, 1.027917, 1.298911, 1, 1, 1, 1, 1,
2.524688, -1.822031, 0.4855941, 1, 1, 1, 1, 1,
2.541563, 1.010223, 2.604002, 1, 1, 1, 1, 1
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
var radius = 9.266054;
var distance = 32.54662;
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
mvMatrix.translate( 0.1620582, 0.1379743, 0.4110844 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.54662);
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
