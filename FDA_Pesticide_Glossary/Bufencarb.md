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
-3.246323, 0.9898115, -0.6253906, 1, 0, 0, 1,
-3.064817, -1.108785, -2.790061, 1, 0.007843138, 0, 1,
-2.738133, -0.8486751, -3.951802, 1, 0.01176471, 0, 1,
-2.717659, -2.348283, -4.018886, 1, 0.01960784, 0, 1,
-2.626958, 1.950273, -1.45368, 1, 0.02352941, 0, 1,
-2.608773, 1.972303, 0.07147533, 1, 0.03137255, 0, 1,
-2.579096, 0.4114406, -1.985851, 1, 0.03529412, 0, 1,
-2.529527, 0.9434559, -1.305238, 1, 0.04313726, 0, 1,
-2.46381, -0.8208249, -3.430792, 1, 0.04705882, 0, 1,
-2.434238, 1.861986, -2.433425, 1, 0.05490196, 0, 1,
-2.417969, 1.020673, -0.9033728, 1, 0.05882353, 0, 1,
-2.400132, 0.1541338, -1.592209, 1, 0.06666667, 0, 1,
-2.380151, -1.226266, -2.937438, 1, 0.07058824, 0, 1,
-2.353824, -1.302945, -0.8748293, 1, 0.07843138, 0, 1,
-2.262997, -1.282297, -2.310179, 1, 0.08235294, 0, 1,
-2.187345, -1.189413, -2.266034, 1, 0.09019608, 0, 1,
-2.185625, 0.3774777, -1.606609, 1, 0.09411765, 0, 1,
-2.18158, 1.289935, -1.929918, 1, 0.1019608, 0, 1,
-2.161752, -1.032357, -1.406123, 1, 0.1098039, 0, 1,
-2.148397, -0.5298937, -2.119303, 1, 0.1137255, 0, 1,
-2.141075, 0.4641624, -0.3368343, 1, 0.1215686, 0, 1,
-2.102033, -1.457155, -3.591771, 1, 0.1254902, 0, 1,
-2.101643, 0.5361551, -0.9024769, 1, 0.1333333, 0, 1,
-2.058058, -0.495957, -0.8863025, 1, 0.1372549, 0, 1,
-2.04673, -0.6032862, -2.267109, 1, 0.145098, 0, 1,
-2.034778, -1.395874, -2.741272, 1, 0.1490196, 0, 1,
-2.01612, -1.790483, -2.866611, 1, 0.1568628, 0, 1,
-2.012259, 0.3329029, -1.732831, 1, 0.1607843, 0, 1,
-1.993211, 0.520048, 0.2197568, 1, 0.1686275, 0, 1,
-1.965956, -0.09086835, -1.853883, 1, 0.172549, 0, 1,
-1.936909, 0.7385277, -2.04799, 1, 0.1803922, 0, 1,
-1.92455, 0.06371929, -0.5364323, 1, 0.1843137, 0, 1,
-1.920467, -1.498661, -1.409752, 1, 0.1921569, 0, 1,
-1.912891, 1.204894, -0.4730981, 1, 0.1960784, 0, 1,
-1.901521, 0.4463436, -3.277604, 1, 0.2039216, 0, 1,
-1.89302, 0.04525553, -2.565886, 1, 0.2117647, 0, 1,
-1.889656, 0.04224461, -0.962749, 1, 0.2156863, 0, 1,
-1.884747, -1.465783, -2.28751, 1, 0.2235294, 0, 1,
-1.849574, 0.3839589, -1.930458, 1, 0.227451, 0, 1,
-1.832355, 0.3225131, -1.641898, 1, 0.2352941, 0, 1,
-1.805023, 0.014419, -1.473147, 1, 0.2392157, 0, 1,
-1.793656, -0.9470977, -1.933038, 1, 0.2470588, 0, 1,
-1.787662, -0.424588, -2.857063, 1, 0.2509804, 0, 1,
-1.78221, 0.02384475, -2.09706, 1, 0.2588235, 0, 1,
-1.778793, -1.31496, -2.659228, 1, 0.2627451, 0, 1,
-1.75375, 1.425949, 0.06311231, 1, 0.2705882, 0, 1,
-1.74311, 0.9806696, -0.1479347, 1, 0.2745098, 0, 1,
-1.730775, -1.034821, -2.931895, 1, 0.282353, 0, 1,
-1.726723, -1.018175, -2.304291, 1, 0.2862745, 0, 1,
-1.718581, -0.2286674, -1.901953, 1, 0.2941177, 0, 1,
-1.70499, 1.208704, -1.30878, 1, 0.3019608, 0, 1,
-1.700912, -0.3788711, -3.019735, 1, 0.3058824, 0, 1,
-1.700744, -1.782348, -3.446972, 1, 0.3137255, 0, 1,
-1.694095, -0.9443185, -2.548064, 1, 0.3176471, 0, 1,
-1.693836, -0.2360298, -1.507339, 1, 0.3254902, 0, 1,
-1.692546, 1.215656, -1.271761, 1, 0.3294118, 0, 1,
-1.675134, 1.755927, -0.3902157, 1, 0.3372549, 0, 1,
-1.674512, -0.01214563, -2.025092, 1, 0.3411765, 0, 1,
-1.673211, -0.3642582, -0.5634638, 1, 0.3490196, 0, 1,
-1.654824, -0.832435, -1.976208, 1, 0.3529412, 0, 1,
-1.6383, 1.801184, 0.4133834, 1, 0.3607843, 0, 1,
-1.62285, 0.148892, -0.2461177, 1, 0.3647059, 0, 1,
-1.617553, -0.6886791, -3.068602, 1, 0.372549, 0, 1,
-1.612723, 0.483193, -2.214113, 1, 0.3764706, 0, 1,
-1.61058, 0.9062456, -1.54939, 1, 0.3843137, 0, 1,
-1.608091, -0.6850856, -1.640977, 1, 0.3882353, 0, 1,
-1.604309, 1.005087, -2.714866, 1, 0.3960784, 0, 1,
-1.596736, 0.578916, -2.520652, 1, 0.4039216, 0, 1,
-1.585685, -1.639728, -2.462324, 1, 0.4078431, 0, 1,
-1.57801, -1.187962, -0.4916548, 1, 0.4156863, 0, 1,
-1.57342, 1.05626, -1.298375, 1, 0.4196078, 0, 1,
-1.570955, -1.156862, -0.9374983, 1, 0.427451, 0, 1,
-1.54575, 0.3721901, -1.39484, 1, 0.4313726, 0, 1,
-1.544988, 0.5651086, -1.391119, 1, 0.4392157, 0, 1,
-1.532835, 0.7754705, -1.964026, 1, 0.4431373, 0, 1,
-1.487256, 0.8002841, -0.7705919, 1, 0.4509804, 0, 1,
-1.483506, 0.3655168, -0.1053104, 1, 0.454902, 0, 1,
-1.478955, 0.3084581, -2.340492, 1, 0.4627451, 0, 1,
-1.454194, -1.00824, -1.403275, 1, 0.4666667, 0, 1,
-1.454168, -0.3076386, -2.277783, 1, 0.4745098, 0, 1,
-1.453545, -1.568422, -2.27706, 1, 0.4784314, 0, 1,
-1.448525, -0.5106424, -1.013676, 1, 0.4862745, 0, 1,
-1.441835, -0.2346773, -2.423662, 1, 0.4901961, 0, 1,
-1.420095, 1.430977, -1.859785, 1, 0.4980392, 0, 1,
-1.415253, 0.7965801, -1.096534, 1, 0.5058824, 0, 1,
-1.413733, -1.580537, -1.945045, 1, 0.509804, 0, 1,
-1.386413, -1.503258, -1.129604, 1, 0.5176471, 0, 1,
-1.385017, -1.109621, -3.058359, 1, 0.5215687, 0, 1,
-1.37606, 0.3757373, -1.015925, 1, 0.5294118, 0, 1,
-1.374006, -0.6971475, -1.810567, 1, 0.5333334, 0, 1,
-1.362983, 1.522402, -1.617181, 1, 0.5411765, 0, 1,
-1.356542, 1.492015, -2.345069, 1, 0.5450981, 0, 1,
-1.351859, -0.05018232, -0.8633586, 1, 0.5529412, 0, 1,
-1.348028, -1.433529, -2.791688, 1, 0.5568628, 0, 1,
-1.328242, 0.6678727, 0.4664436, 1, 0.5647059, 0, 1,
-1.324457, -1.080121, -1.501016, 1, 0.5686275, 0, 1,
-1.323616, -0.1952261, -0.872776, 1, 0.5764706, 0, 1,
-1.323528, 1.213969, -0.1938983, 1, 0.5803922, 0, 1,
-1.321683, -0.481268, -2.872216, 1, 0.5882353, 0, 1,
-1.317951, -0.9160438, -2.731798, 1, 0.5921569, 0, 1,
-1.297531, -0.3974598, -2.510819, 1, 0.6, 0, 1,
-1.296596, -1.267525, -3.44587, 1, 0.6078432, 0, 1,
-1.296174, -0.379048, -0.1251748, 1, 0.6117647, 0, 1,
-1.294881, 0.3142661, -1.410889, 1, 0.6196079, 0, 1,
-1.290406, 0.4854913, -0.9877996, 1, 0.6235294, 0, 1,
-1.288179, 0.1844982, -2.360495, 1, 0.6313726, 0, 1,
-1.28649, 0.2374674, -0.1765342, 1, 0.6352941, 0, 1,
-1.280952, 0.07072008, -1.265754, 1, 0.6431373, 0, 1,
-1.273571, 0.4710152, -1.922147, 1, 0.6470588, 0, 1,
-1.269953, -0.8053454, -4.023219, 1, 0.654902, 0, 1,
-1.252309, 0.7577442, -1.246341, 1, 0.6588235, 0, 1,
-1.236211, 1.855448, -0.8227743, 1, 0.6666667, 0, 1,
-1.22823, 0.607243, -0.6226422, 1, 0.6705883, 0, 1,
-1.226595, 1.208602, -2.437893, 1, 0.6784314, 0, 1,
-1.220447, 0.4114642, -2.899679, 1, 0.682353, 0, 1,
-1.210381, -0.6433554, -3.559508, 1, 0.6901961, 0, 1,
-1.209343, -0.02007099, -1.181761, 1, 0.6941177, 0, 1,
-1.208854, 0.3960834, -0.9855129, 1, 0.7019608, 0, 1,
-1.206039, 1.089607, -2.131947, 1, 0.7098039, 0, 1,
-1.204623, -0.6953329, -2.340552, 1, 0.7137255, 0, 1,
-1.198406, -0.09427334, -4.444086, 1, 0.7215686, 0, 1,
-1.184443, -0.77585, -2.382443, 1, 0.7254902, 0, 1,
-1.182784, 0.1175105, -0.18018, 1, 0.7333333, 0, 1,
-1.180711, -1.062523, -3.443374, 1, 0.7372549, 0, 1,
-1.145999, 1.325422, -1.043336, 1, 0.7450981, 0, 1,
-1.145967, 0.4413822, -0.3441104, 1, 0.7490196, 0, 1,
-1.13666, -0.2513105, -3.546432, 1, 0.7568628, 0, 1,
-1.136129, 0.5740926, -3.901483, 1, 0.7607843, 0, 1,
-1.135823, 0.1780872, -1.243189, 1, 0.7686275, 0, 1,
-1.133484, 0.9614628, 0.7786581, 1, 0.772549, 0, 1,
-1.13098, -1.494901, -2.548493, 1, 0.7803922, 0, 1,
-1.120026, 0.008980324, -0.850814, 1, 0.7843137, 0, 1,
-1.117093, 1.19791, -0.8787779, 1, 0.7921569, 0, 1,
-1.113219, 1.474475, -2.464544, 1, 0.7960784, 0, 1,
-1.111521, 0.3768403, 0.9949079, 1, 0.8039216, 0, 1,
-1.111485, 0.4142542, -1.159008, 1, 0.8117647, 0, 1,
-1.108961, 1.64436, -0.3716216, 1, 0.8156863, 0, 1,
-1.10467, 1.379326, -0.03129353, 1, 0.8235294, 0, 1,
-1.102783, -0.7256575, -1.038298, 1, 0.827451, 0, 1,
-1.098766, -1.162183, -3.458513, 1, 0.8352941, 0, 1,
-1.097226, 0.3253608, -1.609876, 1, 0.8392157, 0, 1,
-1.096556, 0.8495227, -2.521174, 1, 0.8470588, 0, 1,
-1.096125, -0.9956583, -2.190952, 1, 0.8509804, 0, 1,
-1.094357, -0.1134836, 0.793089, 1, 0.8588235, 0, 1,
-1.094268, 0.5784556, -0.5060653, 1, 0.8627451, 0, 1,
-1.083778, -0.1936892, -0.4495798, 1, 0.8705882, 0, 1,
-1.083127, -0.03916452, -3.444956, 1, 0.8745098, 0, 1,
-1.082597, -0.658421, -1.467933, 1, 0.8823529, 0, 1,
-1.08252, 1.980904, -0.1207062, 1, 0.8862745, 0, 1,
-1.081125, -0.8648159, -1.611247, 1, 0.8941177, 0, 1,
-1.079721, 1.537834, -2.347548, 1, 0.8980392, 0, 1,
-1.074101, -1.403232, -1.571872, 1, 0.9058824, 0, 1,
-1.071183, -0.1552183, -1.768988, 1, 0.9137255, 0, 1,
-1.067632, 0.386532, -3.759266, 1, 0.9176471, 0, 1,
-1.065732, 0.6594099, -1.707226, 1, 0.9254902, 0, 1,
-1.061345, 1.957592, -0.4373743, 1, 0.9294118, 0, 1,
-1.057739, 1.022631, 0.6763899, 1, 0.9372549, 0, 1,
-1.049905, -0.2725879, -2.954332, 1, 0.9411765, 0, 1,
-1.048234, -0.6250115, -2.581035, 1, 0.9490196, 0, 1,
-1.04394, 0.7035352, -1.010091, 1, 0.9529412, 0, 1,
-1.039832, -1.001341, -1.002507, 1, 0.9607843, 0, 1,
-1.039418, 0.2812583, -1.746832, 1, 0.9647059, 0, 1,
-1.03876, 0.03028471, -1.803304, 1, 0.972549, 0, 1,
-1.033075, -0.2816055, -1.899869, 1, 0.9764706, 0, 1,
-1.031011, -0.1325002, -0.5749, 1, 0.9843137, 0, 1,
-1.020986, 0.3799946, -1.517759, 1, 0.9882353, 0, 1,
-1.007582, 0.8130597, -0.4656162, 1, 0.9960784, 0, 1,
-1.004107, -0.8210465, 0.1591855, 0.9960784, 1, 0, 1,
-1.002054, -0.2422059, -1.798683, 0.9921569, 1, 0, 1,
-0.9994926, 0.3682598, -0.2307212, 0.9843137, 1, 0, 1,
-0.9967328, 2.164606, -0.3506309, 0.9803922, 1, 0, 1,
-0.9912045, 0.6176864, -2.769563, 0.972549, 1, 0, 1,
-0.9883468, 1.011333, -1.997576, 0.9686275, 1, 0, 1,
-0.9834778, 0.3712881, -0.533461, 0.9607843, 1, 0, 1,
-0.9802723, 0.6191549, 0.03808611, 0.9568627, 1, 0, 1,
-0.9777221, 0.7954804, 0.1145629, 0.9490196, 1, 0, 1,
-0.9772301, -1.093982, -2.963881, 0.945098, 1, 0, 1,
-0.9752374, 0.7345874, 1.19799, 0.9372549, 1, 0, 1,
-0.9734516, -0.1536268, -1.515203, 0.9333333, 1, 0, 1,
-0.9536767, -0.8213351, -4.058855, 0.9254902, 1, 0, 1,
-0.9532763, 0.3472842, -0.8270888, 0.9215686, 1, 0, 1,
-0.943405, -0.4611819, -0.9840027, 0.9137255, 1, 0, 1,
-0.9386682, -0.2293377, -2.666782, 0.9098039, 1, 0, 1,
-0.9316169, -1.455606, -1.525612, 0.9019608, 1, 0, 1,
-0.9280567, -0.1125977, -0.808572, 0.8941177, 1, 0, 1,
-0.9266769, 0.6402707, 0.4672941, 0.8901961, 1, 0, 1,
-0.9178839, -0.968288, -2.370191, 0.8823529, 1, 0, 1,
-0.9084464, 0.3087776, -1.066005, 0.8784314, 1, 0, 1,
-0.9075302, -1.580644, -3.311301, 0.8705882, 1, 0, 1,
-0.9055199, -0.244823, -2.646424, 0.8666667, 1, 0, 1,
-0.894325, 0.8394563, -0.03412493, 0.8588235, 1, 0, 1,
-0.8929836, -0.7140978, -1.063861, 0.854902, 1, 0, 1,
-0.8877338, -1.500063, -1.918825, 0.8470588, 1, 0, 1,
-0.8821342, 0.2604748, -1.337139, 0.8431373, 1, 0, 1,
-0.8818084, -0.8098769, -2.238873, 0.8352941, 1, 0, 1,
-0.8787628, -0.2450359, -1.222381, 0.8313726, 1, 0, 1,
-0.8747995, 1.60244, 0.2819155, 0.8235294, 1, 0, 1,
-0.8724186, -0.2111956, -1.217171, 0.8196079, 1, 0, 1,
-0.8711722, 0.09388992, -0.2263804, 0.8117647, 1, 0, 1,
-0.8627318, 0.8652331, -0.0005925601, 0.8078431, 1, 0, 1,
-0.8615941, -1.36574, -3.326023, 0.8, 1, 0, 1,
-0.8608809, 0.6528638, -0.08824718, 0.7921569, 1, 0, 1,
-0.8607547, 1.877234, -0.2878038, 0.7882353, 1, 0, 1,
-0.8509812, 0.917483, -0.7806434, 0.7803922, 1, 0, 1,
-0.8480769, -0.4567141, -3.012305, 0.7764706, 1, 0, 1,
-0.8452812, -0.6864618, -3.057241, 0.7686275, 1, 0, 1,
-0.8439903, -0.516327, -1.71989, 0.7647059, 1, 0, 1,
-0.8413701, 1.599331, -1.046103, 0.7568628, 1, 0, 1,
-0.841238, 0.3258073, -0.646955, 0.7529412, 1, 0, 1,
-0.8402998, -1.289325, -3.19301, 0.7450981, 1, 0, 1,
-0.8399773, 0.7238254, 0.1190405, 0.7411765, 1, 0, 1,
-0.8346178, 0.3567681, -2.06019, 0.7333333, 1, 0, 1,
-0.8343287, -0.5666338, -1.013821, 0.7294118, 1, 0, 1,
-0.8264653, -0.01140404, -2.308081, 0.7215686, 1, 0, 1,
-0.8198245, -0.09459256, -0.8827603, 0.7176471, 1, 0, 1,
-0.8130657, 0.03408315, -0.4627247, 0.7098039, 1, 0, 1,
-0.8098365, 1.194611, 0.1017216, 0.7058824, 1, 0, 1,
-0.7970209, 0.6532931, -1.509872, 0.6980392, 1, 0, 1,
-0.7959712, 1.232135, -0.1964178, 0.6901961, 1, 0, 1,
-0.7952183, 1.726107, 0.4383783, 0.6862745, 1, 0, 1,
-0.7928346, -0.9282646, -1.585247, 0.6784314, 1, 0, 1,
-0.787523, 0.4730186, -0.7869698, 0.6745098, 1, 0, 1,
-0.7859907, 1.630504, -0.707669, 0.6666667, 1, 0, 1,
-0.7835943, -0.7192597, -4.362963, 0.6627451, 1, 0, 1,
-0.780153, -0.9008148, -0.6353112, 0.654902, 1, 0, 1,
-0.7778603, 1.577353, -1.275699, 0.6509804, 1, 0, 1,
-0.7738218, -1.426592, -1.426397, 0.6431373, 1, 0, 1,
-0.7704911, -0.05749726, -0.6194863, 0.6392157, 1, 0, 1,
-0.7605399, 0.01059672, -2.050755, 0.6313726, 1, 0, 1,
-0.7597996, -0.6192151, -2.936191, 0.627451, 1, 0, 1,
-0.7584618, 0.5419527, -1.091601, 0.6196079, 1, 0, 1,
-0.7562893, -0.3168043, -1.334683, 0.6156863, 1, 0, 1,
-0.7509884, 0.09487711, -2.072698, 0.6078432, 1, 0, 1,
-0.7500968, 0.6554949, -2.109323, 0.6039216, 1, 0, 1,
-0.7447142, 1.105088, -0.3889333, 0.5960785, 1, 0, 1,
-0.7431272, 0.1137921, -2.922115, 0.5882353, 1, 0, 1,
-0.7411571, 2.219727, -0.04141807, 0.5843138, 1, 0, 1,
-0.734786, -0.3506769, -1.733794, 0.5764706, 1, 0, 1,
-0.7262984, -0.9316775, -2.880239, 0.572549, 1, 0, 1,
-0.7257453, -0.3479696, -3.891859, 0.5647059, 1, 0, 1,
-0.7151341, -1.417965, -3.343087, 0.5607843, 1, 0, 1,
-0.7099493, 0.2151932, 0.3907357, 0.5529412, 1, 0, 1,
-0.7074068, 0.106581, -1.779613, 0.5490196, 1, 0, 1,
-0.7060105, -0.3972421, -3.199717, 0.5411765, 1, 0, 1,
-0.7041208, 1.419575, -1.074386, 0.5372549, 1, 0, 1,
-0.6974329, -0.1098137, -1.661234, 0.5294118, 1, 0, 1,
-0.6954908, -2.199463, -1.111696, 0.5254902, 1, 0, 1,
-0.6916765, 0.4109803, -1.373944, 0.5176471, 1, 0, 1,
-0.6915939, 0.05298274, -1.587875, 0.5137255, 1, 0, 1,
-0.6913152, -1.918667, -3.221903, 0.5058824, 1, 0, 1,
-0.6892507, 0.017137, -1.642421, 0.5019608, 1, 0, 1,
-0.6871889, 1.229133, -0.7550751, 0.4941176, 1, 0, 1,
-0.6862894, 2.200711, 1.440159, 0.4862745, 1, 0, 1,
-0.6822289, -0.4732059, -0.2669837, 0.4823529, 1, 0, 1,
-0.6819924, -2.464383, -2.093633, 0.4745098, 1, 0, 1,
-0.6799158, -0.7119466, -1.813515, 0.4705882, 1, 0, 1,
-0.6777691, 1.199481, -0.3219979, 0.4627451, 1, 0, 1,
-0.677698, 1.634943, 1.1475, 0.4588235, 1, 0, 1,
-0.6760408, -0.4278874, -2.752565, 0.4509804, 1, 0, 1,
-0.674445, -0.2994246, -0.3806266, 0.4470588, 1, 0, 1,
-0.6713774, -2.563222, -4.308294, 0.4392157, 1, 0, 1,
-0.6707819, 1.229858, -0.8086567, 0.4352941, 1, 0, 1,
-0.6692939, 0.9142768, -1.166927, 0.427451, 1, 0, 1,
-0.6654679, -0.1372822, -1.560229, 0.4235294, 1, 0, 1,
-0.6626318, -0.06649174, -1.284661, 0.4156863, 1, 0, 1,
-0.6601639, 1.249287, -1.486773, 0.4117647, 1, 0, 1,
-0.6591576, 1.298147, -1.080696, 0.4039216, 1, 0, 1,
-0.6569349, -3.153884, -2.090987, 0.3960784, 1, 0, 1,
-0.656341, 0.2430995, -1.13574, 0.3921569, 1, 0, 1,
-0.6549404, -0.08704974, -2.176575, 0.3843137, 1, 0, 1,
-0.6537862, -0.0985286, -1.157246, 0.3803922, 1, 0, 1,
-0.6513401, 2.062405, -0.2331207, 0.372549, 1, 0, 1,
-0.6499135, 1.403064, -0.7508773, 0.3686275, 1, 0, 1,
-0.6478301, -1.8803, -4.073207, 0.3607843, 1, 0, 1,
-0.6468167, -2.144533, -2.475127, 0.3568628, 1, 0, 1,
-0.6448463, -0.2704884, -1.474802, 0.3490196, 1, 0, 1,
-0.6407524, -0.5192186, -1.822874, 0.345098, 1, 0, 1,
-0.6373009, 0.9081296, -1.11987, 0.3372549, 1, 0, 1,
-0.6372859, -0.621034, -2.12811, 0.3333333, 1, 0, 1,
-0.6355239, -1.219282, -2.412533, 0.3254902, 1, 0, 1,
-0.634746, 0.3110167, -0.7118009, 0.3215686, 1, 0, 1,
-0.616322, -1.180433, -2.103627, 0.3137255, 1, 0, 1,
-0.6151506, 0.4317684, -0.7508281, 0.3098039, 1, 0, 1,
-0.61338, -0.9283749, -2.229045, 0.3019608, 1, 0, 1,
-0.6006049, -0.6380101, -1.721905, 0.2941177, 1, 0, 1,
-0.5981503, -0.1447993, -3.120946, 0.2901961, 1, 0, 1,
-0.5973397, 0.9654893, -0.4897171, 0.282353, 1, 0, 1,
-0.5929021, -1.319892, -3.609083, 0.2784314, 1, 0, 1,
-0.5917637, -0.4158196, -1.234325, 0.2705882, 1, 0, 1,
-0.5878924, 0.1340216, -1.203216, 0.2666667, 1, 0, 1,
-0.5791982, -0.8338068, -2.739523, 0.2588235, 1, 0, 1,
-0.5773855, 1.687162, -1.814533, 0.254902, 1, 0, 1,
-0.568862, 0.07564356, -1.961743, 0.2470588, 1, 0, 1,
-0.562314, 0.8203533, -0.8033041, 0.2431373, 1, 0, 1,
-0.5572655, -0.01116377, -2.074554, 0.2352941, 1, 0, 1,
-0.5567597, 0.263922, -1.206689, 0.2313726, 1, 0, 1,
-0.5558246, 1.079578, 0.03219239, 0.2235294, 1, 0, 1,
-0.5501766, 0.03835288, -3.09849, 0.2196078, 1, 0, 1,
-0.5487434, -1.665113, -2.832073, 0.2117647, 1, 0, 1,
-0.548441, -0.7118874, -2.260358, 0.2078431, 1, 0, 1,
-0.5472602, -0.313099, -0.5255311, 0.2, 1, 0, 1,
-0.5440564, -1.246166, -4.37229, 0.1921569, 1, 0, 1,
-0.5344203, -0.9453625, -2.539145, 0.1882353, 1, 0, 1,
-0.5343767, 0.4669753, -0.9155653, 0.1803922, 1, 0, 1,
-0.5328382, -0.4683452, -2.178984, 0.1764706, 1, 0, 1,
-0.5289671, 0.0890991, -2.389116, 0.1686275, 1, 0, 1,
-0.5287995, 0.7818987, 0.2762244, 0.1647059, 1, 0, 1,
-0.5263816, -0.5791603, -4.633172, 0.1568628, 1, 0, 1,
-0.5239222, 0.5605443, 0.1084101, 0.1529412, 1, 0, 1,
-0.5179807, 1.199832, -1.155544, 0.145098, 1, 0, 1,
-0.5141205, 1.395127, -1.07331, 0.1411765, 1, 0, 1,
-0.5134608, -2.11637, -1.273002, 0.1333333, 1, 0, 1,
-0.5119934, 0.34115, 0.1867871, 0.1294118, 1, 0, 1,
-0.5050027, -0.2926595, -1.853449, 0.1215686, 1, 0, 1,
-0.5000268, 1.226757, -0.4270389, 0.1176471, 1, 0, 1,
-0.4973763, -2.531459, -4.082175, 0.1098039, 1, 0, 1,
-0.4946075, -0.08967419, -1.693676, 0.1058824, 1, 0, 1,
-0.4928513, -1.357437, -4.43643, 0.09803922, 1, 0, 1,
-0.489898, -0.662871, -1.489001, 0.09019608, 1, 0, 1,
-0.4866977, 0.5635735, -0.5534706, 0.08627451, 1, 0, 1,
-0.4846818, 0.8661712, -3.012203, 0.07843138, 1, 0, 1,
-0.4786475, 1.010709, -0.4121782, 0.07450981, 1, 0, 1,
-0.4777128, -2.409583, -3.141835, 0.06666667, 1, 0, 1,
-0.4717588, -0.2727955, -3.101552, 0.0627451, 1, 0, 1,
-0.4688418, -2.135279, -2.985159, 0.05490196, 1, 0, 1,
-0.4667691, 0.1364433, -1.464234, 0.05098039, 1, 0, 1,
-0.4661414, 0.2463132, -0.8396057, 0.04313726, 1, 0, 1,
-0.4635033, 0.5045187, -2.599034, 0.03921569, 1, 0, 1,
-0.4627937, -0.3147229, -0.6591284, 0.03137255, 1, 0, 1,
-0.4621244, -0.04769883, -2.556205, 0.02745098, 1, 0, 1,
-0.4620016, -0.6722561, -2.683678, 0.01960784, 1, 0, 1,
-0.4541322, -0.1279453, -1.063192, 0.01568628, 1, 0, 1,
-0.447216, 1.674268, -0.5756077, 0.007843138, 1, 0, 1,
-0.4427725, -0.1207845, -0.6125034, 0.003921569, 1, 0, 1,
-0.4422442, -0.2077805, -1.732325, 0, 1, 0.003921569, 1,
-0.4366209, 0.9912392, -1.625752, 0, 1, 0.01176471, 1,
-0.4346708, -1.57182, -1.397594, 0, 1, 0.01568628, 1,
-0.4343928, 0.9929225, 0.7619612, 0, 1, 0.02352941, 1,
-0.4341664, 0.5959508, -0.09968123, 0, 1, 0.02745098, 1,
-0.4310064, 0.3299169, -1.088979, 0, 1, 0.03529412, 1,
-0.4300652, 0.3957168, 0.3128196, 0, 1, 0.03921569, 1,
-0.427114, 1.298969, -0.2268897, 0, 1, 0.04705882, 1,
-0.4258691, -1.13844, -2.042815, 0, 1, 0.05098039, 1,
-0.4232433, 0.9626646, -0.3049979, 0, 1, 0.05882353, 1,
-0.4216237, 1.167744, 0.3175517, 0, 1, 0.0627451, 1,
-0.4182611, 0.8121694, -0.3619584, 0, 1, 0.07058824, 1,
-0.4163904, -0.3885514, -3.573905, 0, 1, 0.07450981, 1,
-0.4153768, 1.485901, -2.898295, 0, 1, 0.08235294, 1,
-0.4095713, -0.5497946, -2.395196, 0, 1, 0.08627451, 1,
-0.4055915, -2.654449, -3.28303, 0, 1, 0.09411765, 1,
-0.3977316, -0.2916342, -3.865215, 0, 1, 0.1019608, 1,
-0.3953058, -1.076028, -2.895481, 0, 1, 0.1058824, 1,
-0.3852457, 0.961934, -1.94807, 0, 1, 0.1137255, 1,
-0.3838262, 0.8315159, -0.1285911, 0, 1, 0.1176471, 1,
-0.381995, -0.2504801, -2.333194, 0, 1, 0.1254902, 1,
-0.3818517, -0.7773601, -3.350391, 0, 1, 0.1294118, 1,
-0.3808672, 1.144677, -0.7584504, 0, 1, 0.1372549, 1,
-0.373353, 1.205984, 0.5527267, 0, 1, 0.1411765, 1,
-0.3680238, -2.982728, -4.274752, 0, 1, 0.1490196, 1,
-0.3663763, -0.6657645, -2.539068, 0, 1, 0.1529412, 1,
-0.3659287, -0.01712085, -2.252312, 0, 1, 0.1607843, 1,
-0.3652383, 0.05269823, -0.6478249, 0, 1, 0.1647059, 1,
-0.3648608, -0.06176561, -1.017768, 0, 1, 0.172549, 1,
-0.3636252, -0.7291397, -3.159346, 0, 1, 0.1764706, 1,
-0.3634956, -0.1204289, -1.574211, 0, 1, 0.1843137, 1,
-0.3631343, -0.3197442, -1.674063, 0, 1, 0.1882353, 1,
-0.358319, 0.8153257, 0.3778024, 0, 1, 0.1960784, 1,
-0.3563593, -0.09891925, -1.83827, 0, 1, 0.2039216, 1,
-0.3510443, 0.9516929, -0.2678831, 0, 1, 0.2078431, 1,
-0.3488677, -0.1562224, -2.791347, 0, 1, 0.2156863, 1,
-0.3471573, -0.1410509, -2.583766, 0, 1, 0.2196078, 1,
-0.3463371, -0.5351626, -3.568879, 0, 1, 0.227451, 1,
-0.3460425, 0.1876675, -0.3074613, 0, 1, 0.2313726, 1,
-0.3431343, 0.6260611, -2.548171, 0, 1, 0.2392157, 1,
-0.3417147, -0.1471288, -1.561779, 0, 1, 0.2431373, 1,
-0.3365456, 0.07987238, -1.723392, 0, 1, 0.2509804, 1,
-0.3338739, 1.592861, -0.04811789, 0, 1, 0.254902, 1,
-0.3307692, -1.060562, -2.7809, 0, 1, 0.2627451, 1,
-0.3261336, -0.1471586, -3.083062, 0, 1, 0.2666667, 1,
-0.3243241, -0.06763023, -2.016136, 0, 1, 0.2745098, 1,
-0.3242936, -1.521393, -3.418132, 0, 1, 0.2784314, 1,
-0.3212965, 0.1696628, -0.6328734, 0, 1, 0.2862745, 1,
-0.3182521, 1.763304, -1.518092, 0, 1, 0.2901961, 1,
-0.315044, -0.5675849, -0.871317, 0, 1, 0.2980392, 1,
-0.314279, -1.213591, -3.480352, 0, 1, 0.3058824, 1,
-0.3138365, 1.469687, -0.1722554, 0, 1, 0.3098039, 1,
-0.3113226, -1.992212, -3.150276, 0, 1, 0.3176471, 1,
-0.310474, -0.5369425, -3.545795, 0, 1, 0.3215686, 1,
-0.3097641, -0.914103, -1.593348, 0, 1, 0.3294118, 1,
-0.3058858, -0.2770553, 0.0593578, 0, 1, 0.3333333, 1,
-0.304621, -0.2366521, -3.08874, 0, 1, 0.3411765, 1,
-0.3038625, -0.002944292, 0.183903, 0, 1, 0.345098, 1,
-0.3022999, -2.790816, -3.322959, 0, 1, 0.3529412, 1,
-0.294906, 0.3987778, -0.4651134, 0, 1, 0.3568628, 1,
-0.2946979, -0.1783617, -2.823886, 0, 1, 0.3647059, 1,
-0.2946709, -0.36116, -3.357057, 0, 1, 0.3686275, 1,
-0.2922611, 0.04269279, -2.068311, 0, 1, 0.3764706, 1,
-0.2890267, 0.7593269, 2.825952, 0, 1, 0.3803922, 1,
-0.2816603, 0.3506044, -0.8222234, 0, 1, 0.3882353, 1,
-0.2813603, 0.7254875, 0.7001969, 0, 1, 0.3921569, 1,
-0.2794664, -1.759679, -4.405779, 0, 1, 0.4, 1,
-0.268773, 0.0602106, -2.343517, 0, 1, 0.4078431, 1,
-0.2678465, -0.04797484, -0.1742764, 0, 1, 0.4117647, 1,
-0.2619831, 0.0325935, -3.269575, 0, 1, 0.4196078, 1,
-0.2594251, 1.20648, -0.5389655, 0, 1, 0.4235294, 1,
-0.2555014, -1.087472, -4.25281, 0, 1, 0.4313726, 1,
-0.2525645, 0.4842364, -2.367938, 0, 1, 0.4352941, 1,
-0.2518052, -0.713857, -2.666956, 0, 1, 0.4431373, 1,
-0.2504484, 0.1202527, -2.606378, 0, 1, 0.4470588, 1,
-0.2498586, 0.3371042, 0.7602715, 0, 1, 0.454902, 1,
-0.2450345, 1.357051, 0.08890242, 0, 1, 0.4588235, 1,
-0.2414221, -1.44967, -1.466189, 0, 1, 0.4666667, 1,
-0.235352, 0.5502732, -0.09713043, 0, 1, 0.4705882, 1,
-0.2296776, -0.09523643, -3.152496, 0, 1, 0.4784314, 1,
-0.2288694, -1.108697, -2.438927, 0, 1, 0.4823529, 1,
-0.2278143, 0.8045277, -0.9760278, 0, 1, 0.4901961, 1,
-0.2267976, -0.3442177, -1.96537, 0, 1, 0.4941176, 1,
-0.2200951, -0.2794729, -1.802441, 0, 1, 0.5019608, 1,
-0.2182013, 0.4963681, -0.6596533, 0, 1, 0.509804, 1,
-0.2170692, -0.6552198, -3.269001, 0, 1, 0.5137255, 1,
-0.2152404, 1.334813, 1.43522, 0, 1, 0.5215687, 1,
-0.2100415, 1.04823, -0.8972934, 0, 1, 0.5254902, 1,
-0.2081631, -0.4224308, -1.191454, 0, 1, 0.5333334, 1,
-0.2052651, -2.292857, -1.522149, 0, 1, 0.5372549, 1,
-0.1966714, 2.173229, -1.232127, 0, 1, 0.5450981, 1,
-0.1937351, 1.61304, 0.0009486183, 0, 1, 0.5490196, 1,
-0.1922347, -0.5789519, -2.614802, 0, 1, 0.5568628, 1,
-0.1921344, -1.091141, -3.408773, 0, 1, 0.5607843, 1,
-0.1893157, 0.8149013, 0.1264129, 0, 1, 0.5686275, 1,
-0.1882722, -2.605068, -1.623499, 0, 1, 0.572549, 1,
-0.1877941, -0.4539834, -2.080921, 0, 1, 0.5803922, 1,
-0.1851979, 0.3860865, -1.58808, 0, 1, 0.5843138, 1,
-0.1837863, 1.343912, -0.116269, 0, 1, 0.5921569, 1,
-0.1810066, -1.368943, -2.247737, 0, 1, 0.5960785, 1,
-0.1788983, -0.484216, -4.32746, 0, 1, 0.6039216, 1,
-0.1781027, 1.270576, -0.3282574, 0, 1, 0.6117647, 1,
-0.1776694, 1.087612, -0.4479669, 0, 1, 0.6156863, 1,
-0.1751682, 1.28133, -0.02890421, 0, 1, 0.6235294, 1,
-0.1746282, 2.425532, -0.8740096, 0, 1, 0.627451, 1,
-0.1737285, -0.9294805, -3.710997, 0, 1, 0.6352941, 1,
-0.1735115, -0.5843562, -6.936163, 0, 1, 0.6392157, 1,
-0.1716087, 0.830151, -1.171486, 0, 1, 0.6470588, 1,
-0.1675861, 0.2492799, -1.354168, 0, 1, 0.6509804, 1,
-0.1666751, -0.8479427, -4.444918, 0, 1, 0.6588235, 1,
-0.1659359, -0.4158872, -4.404854, 0, 1, 0.6627451, 1,
-0.163525, 0.7305875, 1.22382, 0, 1, 0.6705883, 1,
-0.1571285, 0.2437051, -2.195585, 0, 1, 0.6745098, 1,
-0.1532516, -1.124666, -3.138326, 0, 1, 0.682353, 1,
-0.1526377, -1.156155, -2.924638, 0, 1, 0.6862745, 1,
-0.1450863, -0.8060783, -3.008334, 0, 1, 0.6941177, 1,
-0.1428955, -0.2606349, -4.107208, 0, 1, 0.7019608, 1,
-0.1396557, 0.3010648, -0.185562, 0, 1, 0.7058824, 1,
-0.1378586, 0.2597876, 1.041741, 0, 1, 0.7137255, 1,
-0.1353126, -2.261583, -3.891072, 0, 1, 0.7176471, 1,
-0.1257225, -0.3130495, -1.156718, 0, 1, 0.7254902, 1,
-0.1245196, 1.057656, 0.6977213, 0, 1, 0.7294118, 1,
-0.1219943, 1.014587, 1.170158, 0, 1, 0.7372549, 1,
-0.1205888, -1.005612, -1.725176, 0, 1, 0.7411765, 1,
-0.1181739, 0.0827981, -0.8127457, 0, 1, 0.7490196, 1,
-0.1170878, -0.7688165, -1.789566, 0, 1, 0.7529412, 1,
-0.1169996, -0.8270299, -2.776913, 0, 1, 0.7607843, 1,
-0.1169123, 1.198698, -2.953816, 0, 1, 0.7647059, 1,
-0.1139244, -1.521142, -1.727317, 0, 1, 0.772549, 1,
-0.1139193, -0.2808909, -1.973255, 0, 1, 0.7764706, 1,
-0.1126917, -0.8487276, -2.651988, 0, 1, 0.7843137, 1,
-0.1056542, -0.5264855, -3.801105, 0, 1, 0.7882353, 1,
-0.1041865, 0.4392889, 1.256084, 0, 1, 0.7960784, 1,
-0.1036728, -1.605795, -1.916042, 0, 1, 0.8039216, 1,
-0.1000584, 1.333087, -1.400746, 0, 1, 0.8078431, 1,
-0.09578309, -0.07951087, -0.8693994, 0, 1, 0.8156863, 1,
-0.09502316, -1.253029, -2.864415, 0, 1, 0.8196079, 1,
-0.09472057, -1.530332, -4.202881, 0, 1, 0.827451, 1,
-0.08895414, 1.759116, -2.022328, 0, 1, 0.8313726, 1,
-0.08681771, 1.188247, 0.1018399, 0, 1, 0.8392157, 1,
-0.08469903, 0.6558892, -0.1202055, 0, 1, 0.8431373, 1,
-0.08314869, -0.5737625, -3.198232, 0, 1, 0.8509804, 1,
-0.0826737, -0.0166183, -0.6994851, 0, 1, 0.854902, 1,
-0.08185317, -0.3832916, -3.701541, 0, 1, 0.8627451, 1,
-0.07765723, -0.002712269, 0.7958543, 0, 1, 0.8666667, 1,
-0.0746154, 1.040759, -1.297761, 0, 1, 0.8745098, 1,
-0.07169698, 0.9481699, 0.5913887, 0, 1, 0.8784314, 1,
-0.06963587, 1.012476, 0.1799676, 0, 1, 0.8862745, 1,
-0.06798883, 0.9952625, -0.7299697, 0, 1, 0.8901961, 1,
-0.06683274, -1.556561, -2.111405, 0, 1, 0.8980392, 1,
-0.0655644, -1.014152, -2.933491, 0, 1, 0.9058824, 1,
-0.06488487, 0.5833199, 1.419533, 0, 1, 0.9098039, 1,
-0.06406632, -2.139314, -2.917395, 0, 1, 0.9176471, 1,
-0.06203166, 1.242249, -2.48841, 0, 1, 0.9215686, 1,
-0.05898809, 0.8305769, 0.1496118, 0, 1, 0.9294118, 1,
-0.05606968, 2.342683, 3.000634, 0, 1, 0.9333333, 1,
-0.05604555, -2.056468, -2.426393, 0, 1, 0.9411765, 1,
-0.05527437, 0.06098126, -0.8505663, 0, 1, 0.945098, 1,
-0.05496759, -0.1096962, -1.76945, 0, 1, 0.9529412, 1,
-0.04921658, 0.2772792, 0.5352156, 0, 1, 0.9568627, 1,
-0.03991694, -0.5967658, -3.244872, 0, 1, 0.9647059, 1,
-0.03986931, 0.4667557, 0.853906, 0, 1, 0.9686275, 1,
-0.03866732, -0.2129507, -1.776326, 0, 1, 0.9764706, 1,
-0.0333938, -1.699988, -4.705059, 0, 1, 0.9803922, 1,
-0.03303105, 0.1880643, -1.01379, 0, 1, 0.9882353, 1,
-0.02955947, -1.04749, -2.122803, 0, 1, 0.9921569, 1,
-0.028597, 0.6766341, 0.3926362, 0, 1, 1, 1,
-0.0272494, -1.741554, -4.230902, 0, 0.9921569, 1, 1,
-0.02481627, -0.6320028, -4.065224, 0, 0.9882353, 1, 1,
-0.02437362, 0.1933978, -0.3738613, 0, 0.9803922, 1, 1,
-0.02332832, 0.06263953, 0.08302575, 0, 0.9764706, 1, 1,
-0.01804984, 1.128761, -0.2694086, 0, 0.9686275, 1, 1,
-0.007375778, -0.008635883, -2.541597, 0, 0.9647059, 1, 1,
-0.007086818, 0.1268703, 0.5989836, 0, 0.9568627, 1, 1,
-0.005287134, 0.6598993, 0.4789489, 0, 0.9529412, 1, 1,
-0.0009485443, -0.1999817, -2.32347, 0, 0.945098, 1, 1,
0.002309551, -1.667449, 2.242548, 0, 0.9411765, 1, 1,
0.002477012, 0.8595929, -0.2389723, 0, 0.9333333, 1, 1,
0.003321431, -0.5709066, 1.914505, 0, 0.9294118, 1, 1,
0.004195224, -1.18382, 0.984079, 0, 0.9215686, 1, 1,
0.006895159, 0.3162559, -0.5697577, 0, 0.9176471, 1, 1,
0.008914561, 0.3585326, 0.9129841, 0, 0.9098039, 1, 1,
0.01303767, 1.225886, 0.2247992, 0, 0.9058824, 1, 1,
0.01323608, 1.699472, 1.279117, 0, 0.8980392, 1, 1,
0.01529136, 0.9522983, 1.408946, 0, 0.8901961, 1, 1,
0.02458671, -1.205201, 3.033863, 0, 0.8862745, 1, 1,
0.02590209, -1.100077, 2.679126, 0, 0.8784314, 1, 1,
0.03086681, -0.780635, 2.656389, 0, 0.8745098, 1, 1,
0.03090779, -0.09188594, 1.043053, 0, 0.8666667, 1, 1,
0.03235441, -0.6472486, 3.723062, 0, 0.8627451, 1, 1,
0.03486891, -0.2230912, 3.982853, 0, 0.854902, 1, 1,
0.03557439, -0.2516019, 2.362669, 0, 0.8509804, 1, 1,
0.04162345, 0.3118162, 0.268579, 0, 0.8431373, 1, 1,
0.04402447, 0.2330404, 0.3546236, 0, 0.8392157, 1, 1,
0.04741504, 0.06524061, 0.8730931, 0, 0.8313726, 1, 1,
0.04894701, 0.9683022, -0.4202811, 0, 0.827451, 1, 1,
0.05543868, -0.7588315, 3.227938, 0, 0.8196079, 1, 1,
0.05655978, 0.4361931, -0.748432, 0, 0.8156863, 1, 1,
0.05758338, 0.1811211, 0.8903773, 0, 0.8078431, 1, 1,
0.0580369, -0.4658959, 3.075946, 0, 0.8039216, 1, 1,
0.06072967, 0.8178356, 0.2749307, 0, 0.7960784, 1, 1,
0.0633039, 1.993799, -2.572675, 0, 0.7882353, 1, 1,
0.06540221, -0.578591, 5.141465, 0, 0.7843137, 1, 1,
0.06654281, -0.4858983, 2.941895, 0, 0.7764706, 1, 1,
0.06810702, -1.770868, 3.28947, 0, 0.772549, 1, 1,
0.06861049, 0.5505154, 0.0836143, 0, 0.7647059, 1, 1,
0.06897862, -1.613479, 1.874339, 0, 0.7607843, 1, 1,
0.07155675, 0.5530919, -0.65569, 0, 0.7529412, 1, 1,
0.0720716, 1.296217, -0.6172989, 0, 0.7490196, 1, 1,
0.07295071, 0.1487265, -0.4836538, 0, 0.7411765, 1, 1,
0.07298352, -1.028802, 2.952133, 0, 0.7372549, 1, 1,
0.07317342, 1.720136, -0.5922974, 0, 0.7294118, 1, 1,
0.07665753, 0.2698036, -1.473861, 0, 0.7254902, 1, 1,
0.07822817, -1.175777, 3.397621, 0, 0.7176471, 1, 1,
0.07864741, 0.8211336, -0.8960719, 0, 0.7137255, 1, 1,
0.07923381, 0.6716393, -0.380058, 0, 0.7058824, 1, 1,
0.08219542, 1.241267, -0.2484974, 0, 0.6980392, 1, 1,
0.08581659, 0.02035527, 1.09646, 0, 0.6941177, 1, 1,
0.08623163, 0.389701, 1.392042, 0, 0.6862745, 1, 1,
0.08707258, 0.3152385, 0.441403, 0, 0.682353, 1, 1,
0.08758084, -0.2905859, 1.451607, 0, 0.6745098, 1, 1,
0.08846717, 0.7397848, -0.3910519, 0, 0.6705883, 1, 1,
0.08960978, -0.2151394, 2.976716, 0, 0.6627451, 1, 1,
0.09069352, -0.07329067, 0.535926, 0, 0.6588235, 1, 1,
0.09119992, 0.4464573, -0.04603298, 0, 0.6509804, 1, 1,
0.0967943, -0.8731406, 2.09615, 0, 0.6470588, 1, 1,
0.09683122, 0.6036094, -0.7464647, 0, 0.6392157, 1, 1,
0.09900178, -0.31152, 3.009771, 0, 0.6352941, 1, 1,
0.09908664, -0.7599918, 2.387568, 0, 0.627451, 1, 1,
0.09963111, 1.433063, -0.3047639, 0, 0.6235294, 1, 1,
0.09998292, -0.9413407, 3.431371, 0, 0.6156863, 1, 1,
0.1002349, -0.5458732, 2.561265, 0, 0.6117647, 1, 1,
0.1005527, 1.532393, 1.627186, 0, 0.6039216, 1, 1,
0.1025289, 0.3127143, 0.4804163, 0, 0.5960785, 1, 1,
0.1049234, 0.4155594, 0.803521, 0, 0.5921569, 1, 1,
0.1056219, -0.2500938, 3.022446, 0, 0.5843138, 1, 1,
0.1091329, 0.03163317, 0.4523436, 0, 0.5803922, 1, 1,
0.1097502, 0.449313, 2.102048, 0, 0.572549, 1, 1,
0.1226752, 0.156156, 1.086899, 0, 0.5686275, 1, 1,
0.122941, 0.4310243, -1.2889, 0, 0.5607843, 1, 1,
0.128282, -0.8875062, 4.663029, 0, 0.5568628, 1, 1,
0.1316577, -0.3033475, 2.038613, 0, 0.5490196, 1, 1,
0.1320681, 0.2982193, 1.426452, 0, 0.5450981, 1, 1,
0.1416755, 0.2040828, -0.34794, 0, 0.5372549, 1, 1,
0.1422182, 0.3897446, 1.323479, 0, 0.5333334, 1, 1,
0.1445825, 1.413964, 0.3875255, 0, 0.5254902, 1, 1,
0.1461082, 0.3103373, -0.1132163, 0, 0.5215687, 1, 1,
0.1471021, -1.08433, 3.486875, 0, 0.5137255, 1, 1,
0.1516733, 0.7332943, -1.24684, 0, 0.509804, 1, 1,
0.1517894, -0.8415564, 2.822993, 0, 0.5019608, 1, 1,
0.1576346, 0.9910468, 0.7519764, 0, 0.4941176, 1, 1,
0.1596428, -0.3540795, 2.373397, 0, 0.4901961, 1, 1,
0.1633097, 0.5904365, 0.4415196, 0, 0.4823529, 1, 1,
0.1656425, 0.273413, 0.07768418, 0, 0.4784314, 1, 1,
0.1663345, 0.6254003, -0.4566458, 0, 0.4705882, 1, 1,
0.1663474, -0.3148289, 1.692903, 0, 0.4666667, 1, 1,
0.1737104, 0.3010664, 1.344116, 0, 0.4588235, 1, 1,
0.1781369, -0.9523266, 1.869656, 0, 0.454902, 1, 1,
0.1799012, 0.3960661, 0.6413215, 0, 0.4470588, 1, 1,
0.1842639, -0.1153612, 2.475559, 0, 0.4431373, 1, 1,
0.1916979, -0.2826194, 3.766637, 0, 0.4352941, 1, 1,
0.1960185, 1.926588, -0.07350866, 0, 0.4313726, 1, 1,
0.1981275, 0.4543388, -0.07756957, 0, 0.4235294, 1, 1,
0.2007715, 0.724585, 1.922899, 0, 0.4196078, 1, 1,
0.2029639, -0.4638929, 2.279304, 0, 0.4117647, 1, 1,
0.2036182, -0.5940685, 2.632919, 0, 0.4078431, 1, 1,
0.2063889, 0.1287544, -0.3013227, 0, 0.4, 1, 1,
0.2073926, -0.4056894, 4.026533, 0, 0.3921569, 1, 1,
0.2077937, -0.6752705, 2.943397, 0, 0.3882353, 1, 1,
0.2091564, -0.9808377, 3.775995, 0, 0.3803922, 1, 1,
0.2111308, -1.678796, 2.599459, 0, 0.3764706, 1, 1,
0.2140904, -1.088603, 2.930219, 0, 0.3686275, 1, 1,
0.2152047, 0.5341387, 1.572197, 0, 0.3647059, 1, 1,
0.2156624, -0.0965307, 3.092274, 0, 0.3568628, 1, 1,
0.2158349, 1.09514, 2.601635, 0, 0.3529412, 1, 1,
0.2181615, 0.584344, -0.9109697, 0, 0.345098, 1, 1,
0.2198009, -0.9094241, 3.155224, 0, 0.3411765, 1, 1,
0.2199341, 1.929497, -0.7626594, 0, 0.3333333, 1, 1,
0.2261848, 1.975925, 0.6501402, 0, 0.3294118, 1, 1,
0.2473708, -0.3399582, 0.5835416, 0, 0.3215686, 1, 1,
0.2510008, -0.2829637, 2.270981, 0, 0.3176471, 1, 1,
0.2519043, -0.07210424, 2.582147, 0, 0.3098039, 1, 1,
0.2521389, 1.096894, -0.2939909, 0, 0.3058824, 1, 1,
0.2535843, 0.06573049, 1.398153, 0, 0.2980392, 1, 1,
0.2543567, -1.556018, 2.651809, 0, 0.2901961, 1, 1,
0.2570126, -0.8047572, 1.657634, 0, 0.2862745, 1, 1,
0.2579395, -1.553072, 2.207829, 0, 0.2784314, 1, 1,
0.2616066, -2.91007, 2.024569, 0, 0.2745098, 1, 1,
0.2638382, 0.2427704, 0.843621, 0, 0.2666667, 1, 1,
0.2641336, 0.1608801, 1.304637, 0, 0.2627451, 1, 1,
0.2731824, 0.06908845, 2.751215, 0, 0.254902, 1, 1,
0.2754325, 0.7878798, 0.2938114, 0, 0.2509804, 1, 1,
0.2760808, -0.785208, 2.509596, 0, 0.2431373, 1, 1,
0.2806651, 0.1224662, 0.9042756, 0, 0.2392157, 1, 1,
0.2825026, 0.5230874, 0.7259179, 0, 0.2313726, 1, 1,
0.2839809, 0.3716141, 0.06610763, 0, 0.227451, 1, 1,
0.2856894, 0.03006755, 1.884142, 0, 0.2196078, 1, 1,
0.2877347, 0.5045106, 0.3632225, 0, 0.2156863, 1, 1,
0.2886453, 0.6714245, 0.559968, 0, 0.2078431, 1, 1,
0.2940225, -0.2580914, 3.810945, 0, 0.2039216, 1, 1,
0.2958874, 0.1497343, 1.205291, 0, 0.1960784, 1, 1,
0.2981081, -1.173313, 3.689306, 0, 0.1882353, 1, 1,
0.2988895, -0.466741, 1.041989, 0, 0.1843137, 1, 1,
0.2990436, -0.3060806, 1.225358, 0, 0.1764706, 1, 1,
0.2999474, -0.9637312, 3.550931, 0, 0.172549, 1, 1,
0.30304, -0.9780105, 3.096162, 0, 0.1647059, 1, 1,
0.3089614, 0.4591264, -1.476568, 0, 0.1607843, 1, 1,
0.3149299, 1.285104, -0.01003346, 0, 0.1529412, 1, 1,
0.3155989, 0.4623441, 1.866173, 0, 0.1490196, 1, 1,
0.3206914, -0.1201431, 1.822706, 0, 0.1411765, 1, 1,
0.3258152, 0.2703821, -0.3486974, 0, 0.1372549, 1, 1,
0.3271638, -2.337285, 2.004869, 0, 0.1294118, 1, 1,
0.3346063, -0.455021, 1.966789, 0, 0.1254902, 1, 1,
0.3347182, 0.3786135, 1.544445, 0, 0.1176471, 1, 1,
0.3375226, -1.233933, 1.327791, 0, 0.1137255, 1, 1,
0.3453614, 0.2018715, 1.775797, 0, 0.1058824, 1, 1,
0.3474758, -1.282595, 4.00582, 0, 0.09803922, 1, 1,
0.3497833, 0.3884076, 0.2370691, 0, 0.09411765, 1, 1,
0.3502791, 1.257572, -0.2651575, 0, 0.08627451, 1, 1,
0.3514319, -1.578615, 3.784941, 0, 0.08235294, 1, 1,
0.3593707, -0.6476774, 1.967643, 0, 0.07450981, 1, 1,
0.3600127, -0.07247199, 0.3435503, 0, 0.07058824, 1, 1,
0.3653837, 0.7935141, -1.609286, 0, 0.0627451, 1, 1,
0.3659034, 0.385023, -0.5570976, 0, 0.05882353, 1, 1,
0.3668237, -0.9064768, 2.091255, 0, 0.05098039, 1, 1,
0.3687889, 0.3988108, 3.309341, 0, 0.04705882, 1, 1,
0.3702624, 0.7374594, 1.317424, 0, 0.03921569, 1, 1,
0.3730575, -2.283938, 3.208593, 0, 0.03529412, 1, 1,
0.3752681, 0.4682382, 0.6732393, 0, 0.02745098, 1, 1,
0.3753159, -1.785593, 3.147825, 0, 0.02352941, 1, 1,
0.3840537, 1.12006, -0.5301712, 0, 0.01568628, 1, 1,
0.3888197, 0.2116562, 0.3312265, 0, 0.01176471, 1, 1,
0.3892823, -1.028955, 3.268268, 0, 0.003921569, 1, 1,
0.3905583, 1.458402, 0.07055834, 0.003921569, 0, 1, 1,
0.3909581, 0.8785584, 0.2699002, 0.007843138, 0, 1, 1,
0.3913845, -0.5733848, 3.748075, 0.01568628, 0, 1, 1,
0.3954649, 0.2647738, 2.818991, 0.01960784, 0, 1, 1,
0.3965766, 0.1811489, 0.5203674, 0.02745098, 0, 1, 1,
0.3996055, -0.1286223, 1.869964, 0.03137255, 0, 1, 1,
0.4007474, -0.8194174, 1.505209, 0.03921569, 0, 1, 1,
0.4054229, -2.112032, 3.187921, 0.04313726, 0, 1, 1,
0.4057529, -2.604988, 1.122431, 0.05098039, 0, 1, 1,
0.4092768, -0.4038674, 2.71716, 0.05490196, 0, 1, 1,
0.409472, -0.7988248, 3.086238, 0.0627451, 0, 1, 1,
0.41026, 0.08773243, 1.907225, 0.06666667, 0, 1, 1,
0.4106717, -1.59888, 2.332856, 0.07450981, 0, 1, 1,
0.4151248, -0.6755286, 4.692364, 0.07843138, 0, 1, 1,
0.4200339, 0.8740743, -0.9814859, 0.08627451, 0, 1, 1,
0.4245347, 2.318529, -0.1479014, 0.09019608, 0, 1, 1,
0.4250308, -0.3646342, 3.463336, 0.09803922, 0, 1, 1,
0.4284395, 1.216606, 0.8118812, 0.1058824, 0, 1, 1,
0.4391375, 1.711605, 0.2877181, 0.1098039, 0, 1, 1,
0.4467134, -0.7747023, 2.419855, 0.1176471, 0, 1, 1,
0.4474571, 0.5210122, 0.06487189, 0.1215686, 0, 1, 1,
0.448439, -0.7843009, 3.410696, 0.1294118, 0, 1, 1,
0.4575484, -0.3970919, 2.553434, 0.1333333, 0, 1, 1,
0.4603058, -2.712823, 3.694009, 0.1411765, 0, 1, 1,
0.4604589, 0.2541621, 0.7297521, 0.145098, 0, 1, 1,
0.4626603, -1.787062, 3.147639, 0.1529412, 0, 1, 1,
0.4637128, -0.4930396, 2.669638, 0.1568628, 0, 1, 1,
0.4689215, -0.5653017, 2.295314, 0.1647059, 0, 1, 1,
0.4709482, 2.042999, 0.07901298, 0.1686275, 0, 1, 1,
0.4731991, 1.056252, 0.6042635, 0.1764706, 0, 1, 1,
0.4747108, -0.6988042, 3.091226, 0.1803922, 0, 1, 1,
0.475821, -0.09346658, 2.115194, 0.1882353, 0, 1, 1,
0.4771864, -0.6576417, 1.837584, 0.1921569, 0, 1, 1,
0.4781201, 0.4982387, 0.1320449, 0.2, 0, 1, 1,
0.4795913, 1.313955, 1.383064, 0.2078431, 0, 1, 1,
0.4801477, -0.4004106, 1.266733, 0.2117647, 0, 1, 1,
0.4871952, 0.3504873, 0.8609159, 0.2196078, 0, 1, 1,
0.489521, -0.1498849, 0.7328107, 0.2235294, 0, 1, 1,
0.4934532, -0.3703679, 3.084787, 0.2313726, 0, 1, 1,
0.4966347, 0.5771168, 0.1054955, 0.2352941, 0, 1, 1,
0.4978581, -1.161448, 1.09393, 0.2431373, 0, 1, 1,
0.4989576, 0.2449657, 0.3987521, 0.2470588, 0, 1, 1,
0.5083249, -0.6690849, 2.597775, 0.254902, 0, 1, 1,
0.5098002, 0.28622, 0.3455564, 0.2588235, 0, 1, 1,
0.5139292, -1.197191, 2.405716, 0.2666667, 0, 1, 1,
0.5149573, 0.4645063, -0.1467941, 0.2705882, 0, 1, 1,
0.5178928, 0.9973658, 0.08716573, 0.2784314, 0, 1, 1,
0.5185057, 1.550588, 0.1205363, 0.282353, 0, 1, 1,
0.5243205, 0.4326632, -0.3776992, 0.2901961, 0, 1, 1,
0.5378016, 0.3162325, 1.666941, 0.2941177, 0, 1, 1,
0.5433987, -1.040299, 1.372699, 0.3019608, 0, 1, 1,
0.5527434, 0.2085278, 0.8058277, 0.3098039, 0, 1, 1,
0.5543826, -0.840367, 1.9521, 0.3137255, 0, 1, 1,
0.5561579, -0.7712477, 3.10217, 0.3215686, 0, 1, 1,
0.5590398, 0.5658957, 0.4782023, 0.3254902, 0, 1, 1,
0.5696868, -0.4835417, 0.8787305, 0.3333333, 0, 1, 1,
0.5783343, 0.4794725, 1.907213, 0.3372549, 0, 1, 1,
0.583158, -0.2437914, 2.036966, 0.345098, 0, 1, 1,
0.5879965, -0.7269118, 3.054976, 0.3490196, 0, 1, 1,
0.5890805, 0.3089695, 2.884666, 0.3568628, 0, 1, 1,
0.5922229, 0.9160125, 0.8674515, 0.3607843, 0, 1, 1,
0.5948052, -0.8654737, 2.553195, 0.3686275, 0, 1, 1,
0.6013019, 0.3961318, 1.366292, 0.372549, 0, 1, 1,
0.601386, 0.6995814, 0.7166188, 0.3803922, 0, 1, 1,
0.6037709, 0.5546826, 1.26749, 0.3843137, 0, 1, 1,
0.6136269, 0.8276697, 0.1267454, 0.3921569, 0, 1, 1,
0.6165468, -0.5948697, 2.60044, 0.3960784, 0, 1, 1,
0.6173659, -1.072129, 2.546537, 0.4039216, 0, 1, 1,
0.6207783, -0.757352, 0.9130674, 0.4117647, 0, 1, 1,
0.6259711, -0.8920332, 2.240248, 0.4156863, 0, 1, 1,
0.6260502, 0.7999794, -0.2709934, 0.4235294, 0, 1, 1,
0.6275046, -0.7959386, 1.851315, 0.427451, 0, 1, 1,
0.6287282, 1.009333, 1.359827, 0.4352941, 0, 1, 1,
0.6367228, 0.6498778, 0.6385794, 0.4392157, 0, 1, 1,
0.6367969, -0.7206933, 1.852588, 0.4470588, 0, 1, 1,
0.6474637, -0.9786977, 2.980065, 0.4509804, 0, 1, 1,
0.6475078, -0.07878521, 1.542972, 0.4588235, 0, 1, 1,
0.6486773, -0.385102, 2.25869, 0.4627451, 0, 1, 1,
0.6487043, -1.141912, 3.262825, 0.4705882, 0, 1, 1,
0.6501951, -0.5317494, 1.268249, 0.4745098, 0, 1, 1,
0.6513534, -0.1284041, 2.77558, 0.4823529, 0, 1, 1,
0.6552415, 0.04861906, 0.4055286, 0.4862745, 0, 1, 1,
0.660885, 0.3939495, 2.017369, 0.4941176, 0, 1, 1,
0.6624552, -1.018169, 1.099269, 0.5019608, 0, 1, 1,
0.6625223, -1.426009, 2.821374, 0.5058824, 0, 1, 1,
0.6707061, -0.09321135, 0.7880971, 0.5137255, 0, 1, 1,
0.6707799, 0.887413, 0.3409374, 0.5176471, 0, 1, 1,
0.6733633, -0.7746152, 2.352689, 0.5254902, 0, 1, 1,
0.6747234, -0.0833643, 1.627681, 0.5294118, 0, 1, 1,
0.6760932, -0.057044, 2.473215, 0.5372549, 0, 1, 1,
0.6785556, -0.3099272, 1.785517, 0.5411765, 0, 1, 1,
0.6797089, -0.755495, 3.808636, 0.5490196, 0, 1, 1,
0.680146, 0.690789, 2.597896, 0.5529412, 0, 1, 1,
0.6801999, -0.1821647, 2.172097, 0.5607843, 0, 1, 1,
0.6820673, 2.763377, -0.01920391, 0.5647059, 0, 1, 1,
0.694352, -0.818177, 3.302234, 0.572549, 0, 1, 1,
0.6953033, -1.624849, 3.037595, 0.5764706, 0, 1, 1,
0.6999866, 0.2534317, 0.2675645, 0.5843138, 0, 1, 1,
0.707341, 0.3117852, 0.04793673, 0.5882353, 0, 1, 1,
0.7073961, 0.4041258, 1.348486, 0.5960785, 0, 1, 1,
0.7096698, 0.616485, 2.295635, 0.6039216, 0, 1, 1,
0.7131056, -0.6631405, 1.799659, 0.6078432, 0, 1, 1,
0.7178931, 0.02268847, 1.744295, 0.6156863, 0, 1, 1,
0.7322556, 0.6119089, 2.740158, 0.6196079, 0, 1, 1,
0.7363085, -0.485982, 2.576833, 0.627451, 0, 1, 1,
0.7370305, -0.3868546, -0.7627653, 0.6313726, 0, 1, 1,
0.738624, -0.4322758, 1.81177, 0.6392157, 0, 1, 1,
0.7436444, -0.08733211, 1.285657, 0.6431373, 0, 1, 1,
0.7480729, -1.086713, 4.089818, 0.6509804, 0, 1, 1,
0.7519871, 1.173103, 0.5219027, 0.654902, 0, 1, 1,
0.7552562, 1.445573, -0.1736584, 0.6627451, 0, 1, 1,
0.7586758, 0.07616534, 0.4975964, 0.6666667, 0, 1, 1,
0.7618983, -0.3075096, 2.103031, 0.6745098, 0, 1, 1,
0.7697524, 1.059687, 1.472013, 0.6784314, 0, 1, 1,
0.7746957, 0.8158734, 0.2029966, 0.6862745, 0, 1, 1,
0.7760035, 1.274615, -0.9162013, 0.6901961, 0, 1, 1,
0.7763935, 0.1646917, -1.262771, 0.6980392, 0, 1, 1,
0.7765589, -0.6878197, 2.877529, 0.7058824, 0, 1, 1,
0.7819911, -0.260225, 2.783008, 0.7098039, 0, 1, 1,
0.7836739, -0.895329, 2.939583, 0.7176471, 0, 1, 1,
0.7857878, -0.1289231, 3.08982, 0.7215686, 0, 1, 1,
0.7868457, -1.513246, 2.878249, 0.7294118, 0, 1, 1,
0.7888775, 1.077444, 1.144266, 0.7333333, 0, 1, 1,
0.793511, 0.6221091, 1.178207, 0.7411765, 0, 1, 1,
0.7962371, -0.7132776, 1.411248, 0.7450981, 0, 1, 1,
0.7972293, -0.4273775, 2.279007, 0.7529412, 0, 1, 1,
0.7986761, -1.504319, 2.462973, 0.7568628, 0, 1, 1,
0.8077644, 1.74547, -0.7560808, 0.7647059, 0, 1, 1,
0.8180799, -0.7034413, 2.117204, 0.7686275, 0, 1, 1,
0.8198858, 0.7894399, -0.5346838, 0.7764706, 0, 1, 1,
0.8280324, -0.3972026, 1.77174, 0.7803922, 0, 1, 1,
0.8383375, -0.4293263, 1.546197, 0.7882353, 0, 1, 1,
0.8391803, -0.4285057, 0.5641677, 0.7921569, 0, 1, 1,
0.8402003, 0.4110488, 1.022607, 0.8, 0, 1, 1,
0.8403882, -1.501047, 2.14749, 0.8078431, 0, 1, 1,
0.8507926, 0.03203807, 2.822604, 0.8117647, 0, 1, 1,
0.8539191, -1.006223, 2.18448, 0.8196079, 0, 1, 1,
0.8589429, -1.115534, 3.061806, 0.8235294, 0, 1, 1,
0.862556, -0.09627288, 0.1602145, 0.8313726, 0, 1, 1,
0.8642622, -0.7392674, 1.035973, 0.8352941, 0, 1, 1,
0.868023, 0.1792444, 1.153812, 0.8431373, 0, 1, 1,
0.8685888, -0.4273376, 3.408115, 0.8470588, 0, 1, 1,
0.876597, 0.1379147, 1.686993, 0.854902, 0, 1, 1,
0.8880898, 0.09711684, 3.22288, 0.8588235, 0, 1, 1,
0.89136, -0.02306795, 2.256706, 0.8666667, 0, 1, 1,
0.9026249, -0.1916636, 2.240336, 0.8705882, 0, 1, 1,
0.9045677, -0.3473391, 1.370314, 0.8784314, 0, 1, 1,
0.9047229, -0.1744259, 0.5177638, 0.8823529, 0, 1, 1,
0.9054281, -0.1124569, 2.225493, 0.8901961, 0, 1, 1,
0.9055712, 0.7630356, 0.6219574, 0.8941177, 0, 1, 1,
0.9172667, -1.325691, 2.910781, 0.9019608, 0, 1, 1,
0.9191014, 1.89769, 0.6850109, 0.9098039, 0, 1, 1,
0.9192075, 0.8153204, 0.6766751, 0.9137255, 0, 1, 1,
0.9213691, 0.7045162, -0.4762497, 0.9215686, 0, 1, 1,
0.9301593, -0.5693204, 1.876779, 0.9254902, 0, 1, 1,
0.9310702, -0.2347296, 2.873088, 0.9333333, 0, 1, 1,
0.9325908, -0.6779315, 3.025531, 0.9372549, 0, 1, 1,
0.9421948, -1.828426, 3.571497, 0.945098, 0, 1, 1,
0.9426693, 0.8858602, 0.8818092, 0.9490196, 0, 1, 1,
0.9481893, 1.607997, 0.8340849, 0.9568627, 0, 1, 1,
0.9493545, 0.3945575, 1.091378, 0.9607843, 0, 1, 1,
0.9544125, -1.080004, 2.780886, 0.9686275, 0, 1, 1,
0.9575049, 2.358508, -0.467621, 0.972549, 0, 1, 1,
0.964691, 0.1581515, 2.426985, 0.9803922, 0, 1, 1,
0.9654371, 0.1660579, 0.04152213, 0.9843137, 0, 1, 1,
0.9715117, 1.474397, 1.545545, 0.9921569, 0, 1, 1,
0.9800875, 1.841953, -0.4565989, 0.9960784, 0, 1, 1,
0.9853217, -0.3496537, 2.724308, 1, 0, 0.9960784, 1,
0.9860734, 2.022014, -0.313726, 1, 0, 0.9882353, 1,
0.9864268, -0.7148946, 3.743083, 1, 0, 0.9843137, 1,
0.9870986, -0.2254422, 0.4974608, 1, 0, 0.9764706, 1,
0.9875227, 1.188459, 1.112457, 1, 0, 0.972549, 1,
0.9921926, 0.7468461, -0.7533149, 1, 0, 0.9647059, 1,
0.9944536, -0.2290464, 2.608363, 1, 0, 0.9607843, 1,
1.006351, -0.5157852, 2.53135, 1, 0, 0.9529412, 1,
1.009777, -0.4889053, 2.26497, 1, 0, 0.9490196, 1,
1.010324, -0.8033936, 1.154312, 1, 0, 0.9411765, 1,
1.018078, -0.8650426, 4.122842, 1, 0, 0.9372549, 1,
1.021883, -3.344908, 2.933736, 1, 0, 0.9294118, 1,
1.027197, 0.6641344, 2.056651, 1, 0, 0.9254902, 1,
1.027925, -1.164813, 2.563338, 1, 0, 0.9176471, 1,
1.028543, 1.598678, 1.60017, 1, 0, 0.9137255, 1,
1.029849, 0.7580506, -0.4045581, 1, 0, 0.9058824, 1,
1.030152, 0.2749292, 2.809174, 1, 0, 0.9019608, 1,
1.039391, 1.131389, 1.956644, 1, 0, 0.8941177, 1,
1.039811, 0.02112009, 1.660683, 1, 0, 0.8862745, 1,
1.04742, 0.5381809, 1.804151, 1, 0, 0.8823529, 1,
1.053208, -0.5089343, 1.005817, 1, 0, 0.8745098, 1,
1.054851, 0.956344, -0.3639663, 1, 0, 0.8705882, 1,
1.055412, 0.7172199, 0.3521793, 1, 0, 0.8627451, 1,
1.060404, 0.5440717, 2.614498, 1, 0, 0.8588235, 1,
1.064731, -0.2519653, 1.802399, 1, 0, 0.8509804, 1,
1.065438, 0.4390715, 0.9840938, 1, 0, 0.8470588, 1,
1.067527, -0.02386704, 0.4631047, 1, 0, 0.8392157, 1,
1.076096, 2.402527, -0.6277417, 1, 0, 0.8352941, 1,
1.076487, 0.8072073, 2.5311, 1, 0, 0.827451, 1,
1.079351, -0.5678315, 1.702665, 1, 0, 0.8235294, 1,
1.080898, 0.7381111, 0.1052558, 1, 0, 0.8156863, 1,
1.083007, -0.9536951, 2.294004, 1, 0, 0.8117647, 1,
1.084037, 1.384338, 1.497847, 1, 0, 0.8039216, 1,
1.085385, 0.7940847, 1.004147, 1, 0, 0.7960784, 1,
1.107576, 0.7051482, 0.6260134, 1, 0, 0.7921569, 1,
1.118273, 0.2607801, 1.292779, 1, 0, 0.7843137, 1,
1.118277, -0.3481371, 3.092156, 1, 0, 0.7803922, 1,
1.118665, 0.3927954, 1.490225, 1, 0, 0.772549, 1,
1.124015, 2.172341, 0.2821249, 1, 0, 0.7686275, 1,
1.125501, 1.204044, 1.287888, 1, 0, 0.7607843, 1,
1.132057, -1.330927, 2.854785, 1, 0, 0.7568628, 1,
1.136211, -0.6934694, 2.975586, 1, 0, 0.7490196, 1,
1.145811, 0.2120069, 1.57898, 1, 0, 0.7450981, 1,
1.15414, 1.134181, 0.3708003, 1, 0, 0.7372549, 1,
1.160757, 0.493367, 2.947027, 1, 0, 0.7333333, 1,
1.163482, -1.699023, 3.357481, 1, 0, 0.7254902, 1,
1.165439, -1.161027, 3.219049, 1, 0, 0.7215686, 1,
1.165599, -0.2070049, 2.483734, 1, 0, 0.7137255, 1,
1.172589, -2.147045, 3.062597, 1, 0, 0.7098039, 1,
1.174134, -1.176605, 2.498403, 1, 0, 0.7019608, 1,
1.184067, 2.001365, 0.1027621, 1, 0, 0.6941177, 1,
1.194654, -0.4213375, 0.9104924, 1, 0, 0.6901961, 1,
1.197136, 0.2029377, 1.531825, 1, 0, 0.682353, 1,
1.208982, -0.3534531, 2.320398, 1, 0, 0.6784314, 1,
1.209406, 1.547021, 0.3635887, 1, 0, 0.6705883, 1,
1.21333, 1.693289, -0.2582352, 1, 0, 0.6666667, 1,
1.216189, -1.490118, 4.753662, 1, 0, 0.6588235, 1,
1.21703, -0.3261237, 1.696062, 1, 0, 0.654902, 1,
1.219145, -0.09888075, 1.716933, 1, 0, 0.6470588, 1,
1.220241, 1.325704, 2.418325, 1, 0, 0.6431373, 1,
1.221649, -1.016174, 1.520087, 1, 0, 0.6352941, 1,
1.222081, -0.6165921, 1.785092, 1, 0, 0.6313726, 1,
1.224685, -2.231759, 3.195029, 1, 0, 0.6235294, 1,
1.228194, -0.05883725, 1.939445, 1, 0, 0.6196079, 1,
1.229037, -0.6432193, 2.06289, 1, 0, 0.6117647, 1,
1.239487, -0.2681749, 2.882972, 1, 0, 0.6078432, 1,
1.241458, -0.9661922, 3.469601, 1, 0, 0.6, 1,
1.250415, -0.3531172, 1.718808, 1, 0, 0.5921569, 1,
1.251006, 0.4368044, 1.230301, 1, 0, 0.5882353, 1,
1.256876, 0.1693738, 2.8244, 1, 0, 0.5803922, 1,
1.258717, 0.7936774, 0.9277825, 1, 0, 0.5764706, 1,
1.259937, 0.983764, 1.00254, 1, 0, 0.5686275, 1,
1.263157, -0.4233378, 2.62088, 1, 0, 0.5647059, 1,
1.263774, 0.453646, 0.9944689, 1, 0, 0.5568628, 1,
1.263965, 0.5897775, 0.1857999, 1, 0, 0.5529412, 1,
1.265765, -0.4899372, 2.07232, 1, 0, 0.5450981, 1,
1.268121, -1.07034, 1.815146, 1, 0, 0.5411765, 1,
1.2683, -0.1290806, 2.153502, 1, 0, 0.5333334, 1,
1.284045, -0.6548958, 2.193826, 1, 0, 0.5294118, 1,
1.306559, 2.548244, -0.3019727, 1, 0, 0.5215687, 1,
1.311633, 1.5421, 0.5303704, 1, 0, 0.5176471, 1,
1.316941, -0.03943642, 1.062246, 1, 0, 0.509804, 1,
1.319327, 0.5654097, 1.371085, 1, 0, 0.5058824, 1,
1.323995, 0.1386285, 1.868028, 1, 0, 0.4980392, 1,
1.32527, -0.05207217, 2.004521, 1, 0, 0.4901961, 1,
1.328182, -0.0927513, 1.608027, 1, 0, 0.4862745, 1,
1.332291, 0.01364565, 1.32321, 1, 0, 0.4784314, 1,
1.341421, -0.4859447, 4.013314, 1, 0, 0.4745098, 1,
1.376194, 0.5373745, 2.202382, 1, 0, 0.4666667, 1,
1.382367, 1.074751, 1.501961, 1, 0, 0.4627451, 1,
1.397162, -1.971299, 2.84792, 1, 0, 0.454902, 1,
1.39852, -2.506209, 3.773981, 1, 0, 0.4509804, 1,
1.400025, -0.3352251, -0.3030443, 1, 0, 0.4431373, 1,
1.409656, 0.1477275, 0.383903, 1, 0, 0.4392157, 1,
1.419927, -0.5094834, 1.663014, 1, 0, 0.4313726, 1,
1.42744, 0.2600258, -0.1023057, 1, 0, 0.427451, 1,
1.429164, 0.1563257, 2.258516, 1, 0, 0.4196078, 1,
1.431312, 0.879097, 1.544017, 1, 0, 0.4156863, 1,
1.436733, 0.1601287, 1.991598, 1, 0, 0.4078431, 1,
1.437718, -0.81326, 2.808329, 1, 0, 0.4039216, 1,
1.447499, -0.1781835, 2.575489, 1, 0, 0.3960784, 1,
1.451425, -1.555709, 2.136711, 1, 0, 0.3882353, 1,
1.463216, -0.1274979, 1.295494, 1, 0, 0.3843137, 1,
1.479658, 0.6428652, 0.1063091, 1, 0, 0.3764706, 1,
1.493108, 0.7056782, -0.5701302, 1, 0, 0.372549, 1,
1.493241, -0.7830423, 3.488822, 1, 0, 0.3647059, 1,
1.494035, -1.183839, 1.823286, 1, 0, 0.3607843, 1,
1.505129, 0.9567038, 1.08392, 1, 0, 0.3529412, 1,
1.507669, -1.091051, 1.651441, 1, 0, 0.3490196, 1,
1.525234, 0.656319, 0.5262636, 1, 0, 0.3411765, 1,
1.52827, 0.2712191, 1.216684, 1, 0, 0.3372549, 1,
1.542112, -0.06622495, 0.7936376, 1, 0, 0.3294118, 1,
1.547158, 2.282792, 1.033073, 1, 0, 0.3254902, 1,
1.556386, 0.6879171, 1.628242, 1, 0, 0.3176471, 1,
1.56354, -0.6015528, 0.6810834, 1, 0, 0.3137255, 1,
1.566161, -0.09083656, 0.9617221, 1, 0, 0.3058824, 1,
1.578094, -0.5947114, 1.28223, 1, 0, 0.2980392, 1,
1.590264, 1.098662, 1.15299, 1, 0, 0.2941177, 1,
1.595893, -1.347593, 2.802405, 1, 0, 0.2862745, 1,
1.601362, 0.0377474, 1.751823, 1, 0, 0.282353, 1,
1.607098, 1.097313, 1.072812, 1, 0, 0.2745098, 1,
1.607216, -0.4602477, 0.8639497, 1, 0, 0.2705882, 1,
1.61357, -0.8328856, 0.6604268, 1, 0, 0.2627451, 1,
1.623429, -0.1440063, 1.032372, 1, 0, 0.2588235, 1,
1.665365, 2.336144, 0.3664296, 1, 0, 0.2509804, 1,
1.666475, -0.7285604, 2.893606, 1, 0, 0.2470588, 1,
1.672539, 0.129665, 1.125553, 1, 0, 0.2392157, 1,
1.700184, 0.5840535, -0.02674749, 1, 0, 0.2352941, 1,
1.705464, 2.426545, -0.6315672, 1, 0, 0.227451, 1,
1.711701, -1.284261, 3.035365, 1, 0, 0.2235294, 1,
1.718101, 1.29072, 0.7660256, 1, 0, 0.2156863, 1,
1.734067, 1.028897, -0.1321791, 1, 0, 0.2117647, 1,
1.734074, -1.03757, 3.456756, 1, 0, 0.2039216, 1,
1.735529, 1.955065, -0.3915107, 1, 0, 0.1960784, 1,
1.740534, -0.3808047, 0.6032807, 1, 0, 0.1921569, 1,
1.74145, 1.353213, 1.01549, 1, 0, 0.1843137, 1,
1.744855, -1.202912, 3.143921, 1, 0, 0.1803922, 1,
1.768565, 0.2852164, 1.552049, 1, 0, 0.172549, 1,
1.829011, 0.9142132, 1.321404, 1, 0, 0.1686275, 1,
1.837405, 0.1546564, 2.049282, 1, 0, 0.1607843, 1,
1.845006, 0.9481939, 1.986901, 1, 0, 0.1568628, 1,
1.852385, 0.5880724, 0.8917107, 1, 0, 0.1490196, 1,
1.86774, 2.014729, 2.279963, 1, 0, 0.145098, 1,
1.875165, -0.5304819, 3.864244, 1, 0, 0.1372549, 1,
1.878812, 0.1208708, 0.6795162, 1, 0, 0.1333333, 1,
1.886824, -0.6356854, 1.402459, 1, 0, 0.1254902, 1,
1.929023, -0.5134995, 2.651686, 1, 0, 0.1215686, 1,
1.971276, 0.7269273, 2.88121, 1, 0, 0.1137255, 1,
1.97663, 0.1449726, 1.963508, 1, 0, 0.1098039, 1,
1.990636, 1.237871, 2.64405, 1, 0, 0.1019608, 1,
2.013508, 0.836162, 2.116545, 1, 0, 0.09411765, 1,
2.022038, -1.0954, 2.730698, 1, 0, 0.09019608, 1,
2.052323, -0.9963915, 2.389096, 1, 0, 0.08235294, 1,
2.053449, -0.5631815, 2.457013, 1, 0, 0.07843138, 1,
2.074638, 0.2503315, -0.2667317, 1, 0, 0.07058824, 1,
2.135236, 3.219783, 0.2543344, 1, 0, 0.06666667, 1,
2.295451, -1.741896, 0.8520833, 1, 0, 0.05882353, 1,
2.307638, 1.217587, 1.198466, 1, 0, 0.05490196, 1,
2.360735, -0.8203036, 2.050537, 1, 0, 0.04705882, 1,
2.473853, 0.7603388, 1.409944, 1, 0, 0.04313726, 1,
2.617345, 0.2772442, 1.510372, 1, 0, 0.03529412, 1,
2.715974, 0.8232492, 1.870436, 1, 0, 0.03137255, 1,
2.952472, -0.1575096, 1.817478, 1, 0, 0.02352941, 1,
3.024579, -0.4582647, 3.41959, 1, 0, 0.01960784, 1,
3.134026, 1.961523, 1.619897, 1, 0, 0.01176471, 1,
3.345198, 0.9874829, 1.793136, 1, 0, 0.007843138, 1
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
0.04943752, -4.457623, -8.983321, 0, -0.5, 0.5, 0.5,
0.04943752, -4.457623, -8.983321, 1, -0.5, 0.5, 0.5,
0.04943752, -4.457623, -8.983321, 1, 1.5, 0.5, 0.5,
0.04943752, -4.457623, -8.983321, 0, 1.5, 0.5, 0.5
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
-4.363586, -0.06256294, -8.983321, 0, -0.5, 0.5, 0.5,
-4.363586, -0.06256294, -8.983321, 1, -0.5, 0.5, 0.5,
-4.363586, -0.06256294, -8.983321, 1, 1.5, 0.5, 0.5,
-4.363586, -0.06256294, -8.983321, 0, 1.5, 0.5, 0.5
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
-4.363586, -4.457623, -0.8973489, 0, -0.5, 0.5, 0.5,
-4.363586, -4.457623, -0.8973489, 1, -0.5, 0.5, 0.5,
-4.363586, -4.457623, -0.8973489, 1, 1.5, 0.5, 0.5,
-4.363586, -4.457623, -0.8973489, 0, 1.5, 0.5, 0.5
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
-3, -3.443379, -7.117327,
3, -3.443379, -7.117327,
-3, -3.443379, -7.117327,
-3, -3.61242, -7.428326,
-2, -3.443379, -7.117327,
-2, -3.61242, -7.428326,
-1, -3.443379, -7.117327,
-1, -3.61242, -7.428326,
0, -3.443379, -7.117327,
0, -3.61242, -7.428326,
1, -3.443379, -7.117327,
1, -3.61242, -7.428326,
2, -3.443379, -7.117327,
2, -3.61242, -7.428326,
3, -3.443379, -7.117327,
3, -3.61242, -7.428326
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
-3, -3.950501, -8.050324, 0, -0.5, 0.5, 0.5,
-3, -3.950501, -8.050324, 1, -0.5, 0.5, 0.5,
-3, -3.950501, -8.050324, 1, 1.5, 0.5, 0.5,
-3, -3.950501, -8.050324, 0, 1.5, 0.5, 0.5,
-2, -3.950501, -8.050324, 0, -0.5, 0.5, 0.5,
-2, -3.950501, -8.050324, 1, -0.5, 0.5, 0.5,
-2, -3.950501, -8.050324, 1, 1.5, 0.5, 0.5,
-2, -3.950501, -8.050324, 0, 1.5, 0.5, 0.5,
-1, -3.950501, -8.050324, 0, -0.5, 0.5, 0.5,
-1, -3.950501, -8.050324, 1, -0.5, 0.5, 0.5,
-1, -3.950501, -8.050324, 1, 1.5, 0.5, 0.5,
-1, -3.950501, -8.050324, 0, 1.5, 0.5, 0.5,
0, -3.950501, -8.050324, 0, -0.5, 0.5, 0.5,
0, -3.950501, -8.050324, 1, -0.5, 0.5, 0.5,
0, -3.950501, -8.050324, 1, 1.5, 0.5, 0.5,
0, -3.950501, -8.050324, 0, 1.5, 0.5, 0.5,
1, -3.950501, -8.050324, 0, -0.5, 0.5, 0.5,
1, -3.950501, -8.050324, 1, -0.5, 0.5, 0.5,
1, -3.950501, -8.050324, 1, 1.5, 0.5, 0.5,
1, -3.950501, -8.050324, 0, 1.5, 0.5, 0.5,
2, -3.950501, -8.050324, 0, -0.5, 0.5, 0.5,
2, -3.950501, -8.050324, 1, -0.5, 0.5, 0.5,
2, -3.950501, -8.050324, 1, 1.5, 0.5, 0.5,
2, -3.950501, -8.050324, 0, 1.5, 0.5, 0.5,
3, -3.950501, -8.050324, 0, -0.5, 0.5, 0.5,
3, -3.950501, -8.050324, 1, -0.5, 0.5, 0.5,
3, -3.950501, -8.050324, 1, 1.5, 0.5, 0.5,
3, -3.950501, -8.050324, 0, 1.5, 0.5, 0.5
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
-3.345196, -3, -7.117327,
-3.345196, 3, -7.117327,
-3.345196, -3, -7.117327,
-3.514928, -3, -7.428326,
-3.345196, -2, -7.117327,
-3.514928, -2, -7.428326,
-3.345196, -1, -7.117327,
-3.514928, -1, -7.428326,
-3.345196, 0, -7.117327,
-3.514928, 0, -7.428326,
-3.345196, 1, -7.117327,
-3.514928, 1, -7.428326,
-3.345196, 2, -7.117327,
-3.514928, 2, -7.428326,
-3.345196, 3, -7.117327,
-3.514928, 3, -7.428326
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
-3.854391, -3, -8.050324, 0, -0.5, 0.5, 0.5,
-3.854391, -3, -8.050324, 1, -0.5, 0.5, 0.5,
-3.854391, -3, -8.050324, 1, 1.5, 0.5, 0.5,
-3.854391, -3, -8.050324, 0, 1.5, 0.5, 0.5,
-3.854391, -2, -8.050324, 0, -0.5, 0.5, 0.5,
-3.854391, -2, -8.050324, 1, -0.5, 0.5, 0.5,
-3.854391, -2, -8.050324, 1, 1.5, 0.5, 0.5,
-3.854391, -2, -8.050324, 0, 1.5, 0.5, 0.5,
-3.854391, -1, -8.050324, 0, -0.5, 0.5, 0.5,
-3.854391, -1, -8.050324, 1, -0.5, 0.5, 0.5,
-3.854391, -1, -8.050324, 1, 1.5, 0.5, 0.5,
-3.854391, -1, -8.050324, 0, 1.5, 0.5, 0.5,
-3.854391, 0, -8.050324, 0, -0.5, 0.5, 0.5,
-3.854391, 0, -8.050324, 1, -0.5, 0.5, 0.5,
-3.854391, 0, -8.050324, 1, 1.5, 0.5, 0.5,
-3.854391, 0, -8.050324, 0, 1.5, 0.5, 0.5,
-3.854391, 1, -8.050324, 0, -0.5, 0.5, 0.5,
-3.854391, 1, -8.050324, 1, -0.5, 0.5, 0.5,
-3.854391, 1, -8.050324, 1, 1.5, 0.5, 0.5,
-3.854391, 1, -8.050324, 0, 1.5, 0.5, 0.5,
-3.854391, 2, -8.050324, 0, -0.5, 0.5, 0.5,
-3.854391, 2, -8.050324, 1, -0.5, 0.5, 0.5,
-3.854391, 2, -8.050324, 1, 1.5, 0.5, 0.5,
-3.854391, 2, -8.050324, 0, 1.5, 0.5, 0.5,
-3.854391, 3, -8.050324, 0, -0.5, 0.5, 0.5,
-3.854391, 3, -8.050324, 1, -0.5, 0.5, 0.5,
-3.854391, 3, -8.050324, 1, 1.5, 0.5, 0.5,
-3.854391, 3, -8.050324, 0, 1.5, 0.5, 0.5
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
-3.345196, -3.443379, -6,
-3.345196, -3.443379, 4,
-3.345196, -3.443379, -6,
-3.514928, -3.61242, -6,
-3.345196, -3.443379, -4,
-3.514928, -3.61242, -4,
-3.345196, -3.443379, -2,
-3.514928, -3.61242, -2,
-3.345196, -3.443379, 0,
-3.514928, -3.61242, 0,
-3.345196, -3.443379, 2,
-3.514928, -3.61242, 2,
-3.345196, -3.443379, 4,
-3.514928, -3.61242, 4
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
-3.854391, -3.950501, -6, 0, -0.5, 0.5, 0.5,
-3.854391, -3.950501, -6, 1, -0.5, 0.5, 0.5,
-3.854391, -3.950501, -6, 1, 1.5, 0.5, 0.5,
-3.854391, -3.950501, -6, 0, 1.5, 0.5, 0.5,
-3.854391, -3.950501, -4, 0, -0.5, 0.5, 0.5,
-3.854391, -3.950501, -4, 1, -0.5, 0.5, 0.5,
-3.854391, -3.950501, -4, 1, 1.5, 0.5, 0.5,
-3.854391, -3.950501, -4, 0, 1.5, 0.5, 0.5,
-3.854391, -3.950501, -2, 0, -0.5, 0.5, 0.5,
-3.854391, -3.950501, -2, 1, -0.5, 0.5, 0.5,
-3.854391, -3.950501, -2, 1, 1.5, 0.5, 0.5,
-3.854391, -3.950501, -2, 0, 1.5, 0.5, 0.5,
-3.854391, -3.950501, 0, 0, -0.5, 0.5, 0.5,
-3.854391, -3.950501, 0, 1, -0.5, 0.5, 0.5,
-3.854391, -3.950501, 0, 1, 1.5, 0.5, 0.5,
-3.854391, -3.950501, 0, 0, 1.5, 0.5, 0.5,
-3.854391, -3.950501, 2, 0, -0.5, 0.5, 0.5,
-3.854391, -3.950501, 2, 1, -0.5, 0.5, 0.5,
-3.854391, -3.950501, 2, 1, 1.5, 0.5, 0.5,
-3.854391, -3.950501, 2, 0, 1.5, 0.5, 0.5,
-3.854391, -3.950501, 4, 0, -0.5, 0.5, 0.5,
-3.854391, -3.950501, 4, 1, -0.5, 0.5, 0.5,
-3.854391, -3.950501, 4, 1, 1.5, 0.5, 0.5,
-3.854391, -3.950501, 4, 0, 1.5, 0.5, 0.5
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
-3.345196, -3.443379, -7.117327,
-3.345196, 3.318253, -7.117327,
-3.345196, -3.443379, 5.322629,
-3.345196, 3.318253, 5.322629,
-3.345196, -3.443379, -7.117327,
-3.345196, -3.443379, 5.322629,
-3.345196, 3.318253, -7.117327,
-3.345196, 3.318253, 5.322629,
-3.345196, -3.443379, -7.117327,
3.444071, -3.443379, -7.117327,
-3.345196, -3.443379, 5.322629,
3.444071, -3.443379, 5.322629,
-3.345196, 3.318253, -7.117327,
3.444071, 3.318253, -7.117327,
-3.345196, 3.318253, 5.322629,
3.444071, 3.318253, 5.322629,
3.444071, -3.443379, -7.117327,
3.444071, 3.318253, -7.117327,
3.444071, -3.443379, 5.322629,
3.444071, 3.318253, 5.322629,
3.444071, -3.443379, -7.117327,
3.444071, -3.443379, 5.322629,
3.444071, 3.318253, -7.117327,
3.444071, 3.318253, 5.322629
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
var radius = 8.384794;
var distance = 37.30489;
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
mvMatrix.translate( -0.04943752, 0.06256294, 0.8973489 );
mvMatrix.scale( 1.335314, 1.340771, 0.7287648 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.30489);
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
Bufencarb<-read.table("Bufencarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Bufencarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Bufencarb' not found
```

```r
y<-Bufencarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Bufencarb' not found
```

```r
z<-Bufencarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Bufencarb' not found
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
-3.246323, 0.9898115, -0.6253906, 0, 0, 1, 1, 1,
-3.064817, -1.108785, -2.790061, 1, 0, 0, 1, 1,
-2.738133, -0.8486751, -3.951802, 1, 0, 0, 1, 1,
-2.717659, -2.348283, -4.018886, 1, 0, 0, 1, 1,
-2.626958, 1.950273, -1.45368, 1, 0, 0, 1, 1,
-2.608773, 1.972303, 0.07147533, 1, 0, 0, 1, 1,
-2.579096, 0.4114406, -1.985851, 0, 0, 0, 1, 1,
-2.529527, 0.9434559, -1.305238, 0, 0, 0, 1, 1,
-2.46381, -0.8208249, -3.430792, 0, 0, 0, 1, 1,
-2.434238, 1.861986, -2.433425, 0, 0, 0, 1, 1,
-2.417969, 1.020673, -0.9033728, 0, 0, 0, 1, 1,
-2.400132, 0.1541338, -1.592209, 0, 0, 0, 1, 1,
-2.380151, -1.226266, -2.937438, 0, 0, 0, 1, 1,
-2.353824, -1.302945, -0.8748293, 1, 1, 1, 1, 1,
-2.262997, -1.282297, -2.310179, 1, 1, 1, 1, 1,
-2.187345, -1.189413, -2.266034, 1, 1, 1, 1, 1,
-2.185625, 0.3774777, -1.606609, 1, 1, 1, 1, 1,
-2.18158, 1.289935, -1.929918, 1, 1, 1, 1, 1,
-2.161752, -1.032357, -1.406123, 1, 1, 1, 1, 1,
-2.148397, -0.5298937, -2.119303, 1, 1, 1, 1, 1,
-2.141075, 0.4641624, -0.3368343, 1, 1, 1, 1, 1,
-2.102033, -1.457155, -3.591771, 1, 1, 1, 1, 1,
-2.101643, 0.5361551, -0.9024769, 1, 1, 1, 1, 1,
-2.058058, -0.495957, -0.8863025, 1, 1, 1, 1, 1,
-2.04673, -0.6032862, -2.267109, 1, 1, 1, 1, 1,
-2.034778, -1.395874, -2.741272, 1, 1, 1, 1, 1,
-2.01612, -1.790483, -2.866611, 1, 1, 1, 1, 1,
-2.012259, 0.3329029, -1.732831, 1, 1, 1, 1, 1,
-1.993211, 0.520048, 0.2197568, 0, 0, 1, 1, 1,
-1.965956, -0.09086835, -1.853883, 1, 0, 0, 1, 1,
-1.936909, 0.7385277, -2.04799, 1, 0, 0, 1, 1,
-1.92455, 0.06371929, -0.5364323, 1, 0, 0, 1, 1,
-1.920467, -1.498661, -1.409752, 1, 0, 0, 1, 1,
-1.912891, 1.204894, -0.4730981, 1, 0, 0, 1, 1,
-1.901521, 0.4463436, -3.277604, 0, 0, 0, 1, 1,
-1.89302, 0.04525553, -2.565886, 0, 0, 0, 1, 1,
-1.889656, 0.04224461, -0.962749, 0, 0, 0, 1, 1,
-1.884747, -1.465783, -2.28751, 0, 0, 0, 1, 1,
-1.849574, 0.3839589, -1.930458, 0, 0, 0, 1, 1,
-1.832355, 0.3225131, -1.641898, 0, 0, 0, 1, 1,
-1.805023, 0.014419, -1.473147, 0, 0, 0, 1, 1,
-1.793656, -0.9470977, -1.933038, 1, 1, 1, 1, 1,
-1.787662, -0.424588, -2.857063, 1, 1, 1, 1, 1,
-1.78221, 0.02384475, -2.09706, 1, 1, 1, 1, 1,
-1.778793, -1.31496, -2.659228, 1, 1, 1, 1, 1,
-1.75375, 1.425949, 0.06311231, 1, 1, 1, 1, 1,
-1.74311, 0.9806696, -0.1479347, 1, 1, 1, 1, 1,
-1.730775, -1.034821, -2.931895, 1, 1, 1, 1, 1,
-1.726723, -1.018175, -2.304291, 1, 1, 1, 1, 1,
-1.718581, -0.2286674, -1.901953, 1, 1, 1, 1, 1,
-1.70499, 1.208704, -1.30878, 1, 1, 1, 1, 1,
-1.700912, -0.3788711, -3.019735, 1, 1, 1, 1, 1,
-1.700744, -1.782348, -3.446972, 1, 1, 1, 1, 1,
-1.694095, -0.9443185, -2.548064, 1, 1, 1, 1, 1,
-1.693836, -0.2360298, -1.507339, 1, 1, 1, 1, 1,
-1.692546, 1.215656, -1.271761, 1, 1, 1, 1, 1,
-1.675134, 1.755927, -0.3902157, 0, 0, 1, 1, 1,
-1.674512, -0.01214563, -2.025092, 1, 0, 0, 1, 1,
-1.673211, -0.3642582, -0.5634638, 1, 0, 0, 1, 1,
-1.654824, -0.832435, -1.976208, 1, 0, 0, 1, 1,
-1.6383, 1.801184, 0.4133834, 1, 0, 0, 1, 1,
-1.62285, 0.148892, -0.2461177, 1, 0, 0, 1, 1,
-1.617553, -0.6886791, -3.068602, 0, 0, 0, 1, 1,
-1.612723, 0.483193, -2.214113, 0, 0, 0, 1, 1,
-1.61058, 0.9062456, -1.54939, 0, 0, 0, 1, 1,
-1.608091, -0.6850856, -1.640977, 0, 0, 0, 1, 1,
-1.604309, 1.005087, -2.714866, 0, 0, 0, 1, 1,
-1.596736, 0.578916, -2.520652, 0, 0, 0, 1, 1,
-1.585685, -1.639728, -2.462324, 0, 0, 0, 1, 1,
-1.57801, -1.187962, -0.4916548, 1, 1, 1, 1, 1,
-1.57342, 1.05626, -1.298375, 1, 1, 1, 1, 1,
-1.570955, -1.156862, -0.9374983, 1, 1, 1, 1, 1,
-1.54575, 0.3721901, -1.39484, 1, 1, 1, 1, 1,
-1.544988, 0.5651086, -1.391119, 1, 1, 1, 1, 1,
-1.532835, 0.7754705, -1.964026, 1, 1, 1, 1, 1,
-1.487256, 0.8002841, -0.7705919, 1, 1, 1, 1, 1,
-1.483506, 0.3655168, -0.1053104, 1, 1, 1, 1, 1,
-1.478955, 0.3084581, -2.340492, 1, 1, 1, 1, 1,
-1.454194, -1.00824, -1.403275, 1, 1, 1, 1, 1,
-1.454168, -0.3076386, -2.277783, 1, 1, 1, 1, 1,
-1.453545, -1.568422, -2.27706, 1, 1, 1, 1, 1,
-1.448525, -0.5106424, -1.013676, 1, 1, 1, 1, 1,
-1.441835, -0.2346773, -2.423662, 1, 1, 1, 1, 1,
-1.420095, 1.430977, -1.859785, 1, 1, 1, 1, 1,
-1.415253, 0.7965801, -1.096534, 0, 0, 1, 1, 1,
-1.413733, -1.580537, -1.945045, 1, 0, 0, 1, 1,
-1.386413, -1.503258, -1.129604, 1, 0, 0, 1, 1,
-1.385017, -1.109621, -3.058359, 1, 0, 0, 1, 1,
-1.37606, 0.3757373, -1.015925, 1, 0, 0, 1, 1,
-1.374006, -0.6971475, -1.810567, 1, 0, 0, 1, 1,
-1.362983, 1.522402, -1.617181, 0, 0, 0, 1, 1,
-1.356542, 1.492015, -2.345069, 0, 0, 0, 1, 1,
-1.351859, -0.05018232, -0.8633586, 0, 0, 0, 1, 1,
-1.348028, -1.433529, -2.791688, 0, 0, 0, 1, 1,
-1.328242, 0.6678727, 0.4664436, 0, 0, 0, 1, 1,
-1.324457, -1.080121, -1.501016, 0, 0, 0, 1, 1,
-1.323616, -0.1952261, -0.872776, 0, 0, 0, 1, 1,
-1.323528, 1.213969, -0.1938983, 1, 1, 1, 1, 1,
-1.321683, -0.481268, -2.872216, 1, 1, 1, 1, 1,
-1.317951, -0.9160438, -2.731798, 1, 1, 1, 1, 1,
-1.297531, -0.3974598, -2.510819, 1, 1, 1, 1, 1,
-1.296596, -1.267525, -3.44587, 1, 1, 1, 1, 1,
-1.296174, -0.379048, -0.1251748, 1, 1, 1, 1, 1,
-1.294881, 0.3142661, -1.410889, 1, 1, 1, 1, 1,
-1.290406, 0.4854913, -0.9877996, 1, 1, 1, 1, 1,
-1.288179, 0.1844982, -2.360495, 1, 1, 1, 1, 1,
-1.28649, 0.2374674, -0.1765342, 1, 1, 1, 1, 1,
-1.280952, 0.07072008, -1.265754, 1, 1, 1, 1, 1,
-1.273571, 0.4710152, -1.922147, 1, 1, 1, 1, 1,
-1.269953, -0.8053454, -4.023219, 1, 1, 1, 1, 1,
-1.252309, 0.7577442, -1.246341, 1, 1, 1, 1, 1,
-1.236211, 1.855448, -0.8227743, 1, 1, 1, 1, 1,
-1.22823, 0.607243, -0.6226422, 0, 0, 1, 1, 1,
-1.226595, 1.208602, -2.437893, 1, 0, 0, 1, 1,
-1.220447, 0.4114642, -2.899679, 1, 0, 0, 1, 1,
-1.210381, -0.6433554, -3.559508, 1, 0, 0, 1, 1,
-1.209343, -0.02007099, -1.181761, 1, 0, 0, 1, 1,
-1.208854, 0.3960834, -0.9855129, 1, 0, 0, 1, 1,
-1.206039, 1.089607, -2.131947, 0, 0, 0, 1, 1,
-1.204623, -0.6953329, -2.340552, 0, 0, 0, 1, 1,
-1.198406, -0.09427334, -4.444086, 0, 0, 0, 1, 1,
-1.184443, -0.77585, -2.382443, 0, 0, 0, 1, 1,
-1.182784, 0.1175105, -0.18018, 0, 0, 0, 1, 1,
-1.180711, -1.062523, -3.443374, 0, 0, 0, 1, 1,
-1.145999, 1.325422, -1.043336, 0, 0, 0, 1, 1,
-1.145967, 0.4413822, -0.3441104, 1, 1, 1, 1, 1,
-1.13666, -0.2513105, -3.546432, 1, 1, 1, 1, 1,
-1.136129, 0.5740926, -3.901483, 1, 1, 1, 1, 1,
-1.135823, 0.1780872, -1.243189, 1, 1, 1, 1, 1,
-1.133484, 0.9614628, 0.7786581, 1, 1, 1, 1, 1,
-1.13098, -1.494901, -2.548493, 1, 1, 1, 1, 1,
-1.120026, 0.008980324, -0.850814, 1, 1, 1, 1, 1,
-1.117093, 1.19791, -0.8787779, 1, 1, 1, 1, 1,
-1.113219, 1.474475, -2.464544, 1, 1, 1, 1, 1,
-1.111521, 0.3768403, 0.9949079, 1, 1, 1, 1, 1,
-1.111485, 0.4142542, -1.159008, 1, 1, 1, 1, 1,
-1.108961, 1.64436, -0.3716216, 1, 1, 1, 1, 1,
-1.10467, 1.379326, -0.03129353, 1, 1, 1, 1, 1,
-1.102783, -0.7256575, -1.038298, 1, 1, 1, 1, 1,
-1.098766, -1.162183, -3.458513, 1, 1, 1, 1, 1,
-1.097226, 0.3253608, -1.609876, 0, 0, 1, 1, 1,
-1.096556, 0.8495227, -2.521174, 1, 0, 0, 1, 1,
-1.096125, -0.9956583, -2.190952, 1, 0, 0, 1, 1,
-1.094357, -0.1134836, 0.793089, 1, 0, 0, 1, 1,
-1.094268, 0.5784556, -0.5060653, 1, 0, 0, 1, 1,
-1.083778, -0.1936892, -0.4495798, 1, 0, 0, 1, 1,
-1.083127, -0.03916452, -3.444956, 0, 0, 0, 1, 1,
-1.082597, -0.658421, -1.467933, 0, 0, 0, 1, 1,
-1.08252, 1.980904, -0.1207062, 0, 0, 0, 1, 1,
-1.081125, -0.8648159, -1.611247, 0, 0, 0, 1, 1,
-1.079721, 1.537834, -2.347548, 0, 0, 0, 1, 1,
-1.074101, -1.403232, -1.571872, 0, 0, 0, 1, 1,
-1.071183, -0.1552183, -1.768988, 0, 0, 0, 1, 1,
-1.067632, 0.386532, -3.759266, 1, 1, 1, 1, 1,
-1.065732, 0.6594099, -1.707226, 1, 1, 1, 1, 1,
-1.061345, 1.957592, -0.4373743, 1, 1, 1, 1, 1,
-1.057739, 1.022631, 0.6763899, 1, 1, 1, 1, 1,
-1.049905, -0.2725879, -2.954332, 1, 1, 1, 1, 1,
-1.048234, -0.6250115, -2.581035, 1, 1, 1, 1, 1,
-1.04394, 0.7035352, -1.010091, 1, 1, 1, 1, 1,
-1.039832, -1.001341, -1.002507, 1, 1, 1, 1, 1,
-1.039418, 0.2812583, -1.746832, 1, 1, 1, 1, 1,
-1.03876, 0.03028471, -1.803304, 1, 1, 1, 1, 1,
-1.033075, -0.2816055, -1.899869, 1, 1, 1, 1, 1,
-1.031011, -0.1325002, -0.5749, 1, 1, 1, 1, 1,
-1.020986, 0.3799946, -1.517759, 1, 1, 1, 1, 1,
-1.007582, 0.8130597, -0.4656162, 1, 1, 1, 1, 1,
-1.004107, -0.8210465, 0.1591855, 1, 1, 1, 1, 1,
-1.002054, -0.2422059, -1.798683, 0, 0, 1, 1, 1,
-0.9994926, 0.3682598, -0.2307212, 1, 0, 0, 1, 1,
-0.9967328, 2.164606, -0.3506309, 1, 0, 0, 1, 1,
-0.9912045, 0.6176864, -2.769563, 1, 0, 0, 1, 1,
-0.9883468, 1.011333, -1.997576, 1, 0, 0, 1, 1,
-0.9834778, 0.3712881, -0.533461, 1, 0, 0, 1, 1,
-0.9802723, 0.6191549, 0.03808611, 0, 0, 0, 1, 1,
-0.9777221, 0.7954804, 0.1145629, 0, 0, 0, 1, 1,
-0.9772301, -1.093982, -2.963881, 0, 0, 0, 1, 1,
-0.9752374, 0.7345874, 1.19799, 0, 0, 0, 1, 1,
-0.9734516, -0.1536268, -1.515203, 0, 0, 0, 1, 1,
-0.9536767, -0.8213351, -4.058855, 0, 0, 0, 1, 1,
-0.9532763, 0.3472842, -0.8270888, 0, 0, 0, 1, 1,
-0.943405, -0.4611819, -0.9840027, 1, 1, 1, 1, 1,
-0.9386682, -0.2293377, -2.666782, 1, 1, 1, 1, 1,
-0.9316169, -1.455606, -1.525612, 1, 1, 1, 1, 1,
-0.9280567, -0.1125977, -0.808572, 1, 1, 1, 1, 1,
-0.9266769, 0.6402707, 0.4672941, 1, 1, 1, 1, 1,
-0.9178839, -0.968288, -2.370191, 1, 1, 1, 1, 1,
-0.9084464, 0.3087776, -1.066005, 1, 1, 1, 1, 1,
-0.9075302, -1.580644, -3.311301, 1, 1, 1, 1, 1,
-0.9055199, -0.244823, -2.646424, 1, 1, 1, 1, 1,
-0.894325, 0.8394563, -0.03412493, 1, 1, 1, 1, 1,
-0.8929836, -0.7140978, -1.063861, 1, 1, 1, 1, 1,
-0.8877338, -1.500063, -1.918825, 1, 1, 1, 1, 1,
-0.8821342, 0.2604748, -1.337139, 1, 1, 1, 1, 1,
-0.8818084, -0.8098769, -2.238873, 1, 1, 1, 1, 1,
-0.8787628, -0.2450359, -1.222381, 1, 1, 1, 1, 1,
-0.8747995, 1.60244, 0.2819155, 0, 0, 1, 1, 1,
-0.8724186, -0.2111956, -1.217171, 1, 0, 0, 1, 1,
-0.8711722, 0.09388992, -0.2263804, 1, 0, 0, 1, 1,
-0.8627318, 0.8652331, -0.0005925601, 1, 0, 0, 1, 1,
-0.8615941, -1.36574, -3.326023, 1, 0, 0, 1, 1,
-0.8608809, 0.6528638, -0.08824718, 1, 0, 0, 1, 1,
-0.8607547, 1.877234, -0.2878038, 0, 0, 0, 1, 1,
-0.8509812, 0.917483, -0.7806434, 0, 0, 0, 1, 1,
-0.8480769, -0.4567141, -3.012305, 0, 0, 0, 1, 1,
-0.8452812, -0.6864618, -3.057241, 0, 0, 0, 1, 1,
-0.8439903, -0.516327, -1.71989, 0, 0, 0, 1, 1,
-0.8413701, 1.599331, -1.046103, 0, 0, 0, 1, 1,
-0.841238, 0.3258073, -0.646955, 0, 0, 0, 1, 1,
-0.8402998, -1.289325, -3.19301, 1, 1, 1, 1, 1,
-0.8399773, 0.7238254, 0.1190405, 1, 1, 1, 1, 1,
-0.8346178, 0.3567681, -2.06019, 1, 1, 1, 1, 1,
-0.8343287, -0.5666338, -1.013821, 1, 1, 1, 1, 1,
-0.8264653, -0.01140404, -2.308081, 1, 1, 1, 1, 1,
-0.8198245, -0.09459256, -0.8827603, 1, 1, 1, 1, 1,
-0.8130657, 0.03408315, -0.4627247, 1, 1, 1, 1, 1,
-0.8098365, 1.194611, 0.1017216, 1, 1, 1, 1, 1,
-0.7970209, 0.6532931, -1.509872, 1, 1, 1, 1, 1,
-0.7959712, 1.232135, -0.1964178, 1, 1, 1, 1, 1,
-0.7952183, 1.726107, 0.4383783, 1, 1, 1, 1, 1,
-0.7928346, -0.9282646, -1.585247, 1, 1, 1, 1, 1,
-0.787523, 0.4730186, -0.7869698, 1, 1, 1, 1, 1,
-0.7859907, 1.630504, -0.707669, 1, 1, 1, 1, 1,
-0.7835943, -0.7192597, -4.362963, 1, 1, 1, 1, 1,
-0.780153, -0.9008148, -0.6353112, 0, 0, 1, 1, 1,
-0.7778603, 1.577353, -1.275699, 1, 0, 0, 1, 1,
-0.7738218, -1.426592, -1.426397, 1, 0, 0, 1, 1,
-0.7704911, -0.05749726, -0.6194863, 1, 0, 0, 1, 1,
-0.7605399, 0.01059672, -2.050755, 1, 0, 0, 1, 1,
-0.7597996, -0.6192151, -2.936191, 1, 0, 0, 1, 1,
-0.7584618, 0.5419527, -1.091601, 0, 0, 0, 1, 1,
-0.7562893, -0.3168043, -1.334683, 0, 0, 0, 1, 1,
-0.7509884, 0.09487711, -2.072698, 0, 0, 0, 1, 1,
-0.7500968, 0.6554949, -2.109323, 0, 0, 0, 1, 1,
-0.7447142, 1.105088, -0.3889333, 0, 0, 0, 1, 1,
-0.7431272, 0.1137921, -2.922115, 0, 0, 0, 1, 1,
-0.7411571, 2.219727, -0.04141807, 0, 0, 0, 1, 1,
-0.734786, -0.3506769, -1.733794, 1, 1, 1, 1, 1,
-0.7262984, -0.9316775, -2.880239, 1, 1, 1, 1, 1,
-0.7257453, -0.3479696, -3.891859, 1, 1, 1, 1, 1,
-0.7151341, -1.417965, -3.343087, 1, 1, 1, 1, 1,
-0.7099493, 0.2151932, 0.3907357, 1, 1, 1, 1, 1,
-0.7074068, 0.106581, -1.779613, 1, 1, 1, 1, 1,
-0.7060105, -0.3972421, -3.199717, 1, 1, 1, 1, 1,
-0.7041208, 1.419575, -1.074386, 1, 1, 1, 1, 1,
-0.6974329, -0.1098137, -1.661234, 1, 1, 1, 1, 1,
-0.6954908, -2.199463, -1.111696, 1, 1, 1, 1, 1,
-0.6916765, 0.4109803, -1.373944, 1, 1, 1, 1, 1,
-0.6915939, 0.05298274, -1.587875, 1, 1, 1, 1, 1,
-0.6913152, -1.918667, -3.221903, 1, 1, 1, 1, 1,
-0.6892507, 0.017137, -1.642421, 1, 1, 1, 1, 1,
-0.6871889, 1.229133, -0.7550751, 1, 1, 1, 1, 1,
-0.6862894, 2.200711, 1.440159, 0, 0, 1, 1, 1,
-0.6822289, -0.4732059, -0.2669837, 1, 0, 0, 1, 1,
-0.6819924, -2.464383, -2.093633, 1, 0, 0, 1, 1,
-0.6799158, -0.7119466, -1.813515, 1, 0, 0, 1, 1,
-0.6777691, 1.199481, -0.3219979, 1, 0, 0, 1, 1,
-0.677698, 1.634943, 1.1475, 1, 0, 0, 1, 1,
-0.6760408, -0.4278874, -2.752565, 0, 0, 0, 1, 1,
-0.674445, -0.2994246, -0.3806266, 0, 0, 0, 1, 1,
-0.6713774, -2.563222, -4.308294, 0, 0, 0, 1, 1,
-0.6707819, 1.229858, -0.8086567, 0, 0, 0, 1, 1,
-0.6692939, 0.9142768, -1.166927, 0, 0, 0, 1, 1,
-0.6654679, -0.1372822, -1.560229, 0, 0, 0, 1, 1,
-0.6626318, -0.06649174, -1.284661, 0, 0, 0, 1, 1,
-0.6601639, 1.249287, -1.486773, 1, 1, 1, 1, 1,
-0.6591576, 1.298147, -1.080696, 1, 1, 1, 1, 1,
-0.6569349, -3.153884, -2.090987, 1, 1, 1, 1, 1,
-0.656341, 0.2430995, -1.13574, 1, 1, 1, 1, 1,
-0.6549404, -0.08704974, -2.176575, 1, 1, 1, 1, 1,
-0.6537862, -0.0985286, -1.157246, 1, 1, 1, 1, 1,
-0.6513401, 2.062405, -0.2331207, 1, 1, 1, 1, 1,
-0.6499135, 1.403064, -0.7508773, 1, 1, 1, 1, 1,
-0.6478301, -1.8803, -4.073207, 1, 1, 1, 1, 1,
-0.6468167, -2.144533, -2.475127, 1, 1, 1, 1, 1,
-0.6448463, -0.2704884, -1.474802, 1, 1, 1, 1, 1,
-0.6407524, -0.5192186, -1.822874, 1, 1, 1, 1, 1,
-0.6373009, 0.9081296, -1.11987, 1, 1, 1, 1, 1,
-0.6372859, -0.621034, -2.12811, 1, 1, 1, 1, 1,
-0.6355239, -1.219282, -2.412533, 1, 1, 1, 1, 1,
-0.634746, 0.3110167, -0.7118009, 0, 0, 1, 1, 1,
-0.616322, -1.180433, -2.103627, 1, 0, 0, 1, 1,
-0.6151506, 0.4317684, -0.7508281, 1, 0, 0, 1, 1,
-0.61338, -0.9283749, -2.229045, 1, 0, 0, 1, 1,
-0.6006049, -0.6380101, -1.721905, 1, 0, 0, 1, 1,
-0.5981503, -0.1447993, -3.120946, 1, 0, 0, 1, 1,
-0.5973397, 0.9654893, -0.4897171, 0, 0, 0, 1, 1,
-0.5929021, -1.319892, -3.609083, 0, 0, 0, 1, 1,
-0.5917637, -0.4158196, -1.234325, 0, 0, 0, 1, 1,
-0.5878924, 0.1340216, -1.203216, 0, 0, 0, 1, 1,
-0.5791982, -0.8338068, -2.739523, 0, 0, 0, 1, 1,
-0.5773855, 1.687162, -1.814533, 0, 0, 0, 1, 1,
-0.568862, 0.07564356, -1.961743, 0, 0, 0, 1, 1,
-0.562314, 0.8203533, -0.8033041, 1, 1, 1, 1, 1,
-0.5572655, -0.01116377, -2.074554, 1, 1, 1, 1, 1,
-0.5567597, 0.263922, -1.206689, 1, 1, 1, 1, 1,
-0.5558246, 1.079578, 0.03219239, 1, 1, 1, 1, 1,
-0.5501766, 0.03835288, -3.09849, 1, 1, 1, 1, 1,
-0.5487434, -1.665113, -2.832073, 1, 1, 1, 1, 1,
-0.548441, -0.7118874, -2.260358, 1, 1, 1, 1, 1,
-0.5472602, -0.313099, -0.5255311, 1, 1, 1, 1, 1,
-0.5440564, -1.246166, -4.37229, 1, 1, 1, 1, 1,
-0.5344203, -0.9453625, -2.539145, 1, 1, 1, 1, 1,
-0.5343767, 0.4669753, -0.9155653, 1, 1, 1, 1, 1,
-0.5328382, -0.4683452, -2.178984, 1, 1, 1, 1, 1,
-0.5289671, 0.0890991, -2.389116, 1, 1, 1, 1, 1,
-0.5287995, 0.7818987, 0.2762244, 1, 1, 1, 1, 1,
-0.5263816, -0.5791603, -4.633172, 1, 1, 1, 1, 1,
-0.5239222, 0.5605443, 0.1084101, 0, 0, 1, 1, 1,
-0.5179807, 1.199832, -1.155544, 1, 0, 0, 1, 1,
-0.5141205, 1.395127, -1.07331, 1, 0, 0, 1, 1,
-0.5134608, -2.11637, -1.273002, 1, 0, 0, 1, 1,
-0.5119934, 0.34115, 0.1867871, 1, 0, 0, 1, 1,
-0.5050027, -0.2926595, -1.853449, 1, 0, 0, 1, 1,
-0.5000268, 1.226757, -0.4270389, 0, 0, 0, 1, 1,
-0.4973763, -2.531459, -4.082175, 0, 0, 0, 1, 1,
-0.4946075, -0.08967419, -1.693676, 0, 0, 0, 1, 1,
-0.4928513, -1.357437, -4.43643, 0, 0, 0, 1, 1,
-0.489898, -0.662871, -1.489001, 0, 0, 0, 1, 1,
-0.4866977, 0.5635735, -0.5534706, 0, 0, 0, 1, 1,
-0.4846818, 0.8661712, -3.012203, 0, 0, 0, 1, 1,
-0.4786475, 1.010709, -0.4121782, 1, 1, 1, 1, 1,
-0.4777128, -2.409583, -3.141835, 1, 1, 1, 1, 1,
-0.4717588, -0.2727955, -3.101552, 1, 1, 1, 1, 1,
-0.4688418, -2.135279, -2.985159, 1, 1, 1, 1, 1,
-0.4667691, 0.1364433, -1.464234, 1, 1, 1, 1, 1,
-0.4661414, 0.2463132, -0.8396057, 1, 1, 1, 1, 1,
-0.4635033, 0.5045187, -2.599034, 1, 1, 1, 1, 1,
-0.4627937, -0.3147229, -0.6591284, 1, 1, 1, 1, 1,
-0.4621244, -0.04769883, -2.556205, 1, 1, 1, 1, 1,
-0.4620016, -0.6722561, -2.683678, 1, 1, 1, 1, 1,
-0.4541322, -0.1279453, -1.063192, 1, 1, 1, 1, 1,
-0.447216, 1.674268, -0.5756077, 1, 1, 1, 1, 1,
-0.4427725, -0.1207845, -0.6125034, 1, 1, 1, 1, 1,
-0.4422442, -0.2077805, -1.732325, 1, 1, 1, 1, 1,
-0.4366209, 0.9912392, -1.625752, 1, 1, 1, 1, 1,
-0.4346708, -1.57182, -1.397594, 0, 0, 1, 1, 1,
-0.4343928, 0.9929225, 0.7619612, 1, 0, 0, 1, 1,
-0.4341664, 0.5959508, -0.09968123, 1, 0, 0, 1, 1,
-0.4310064, 0.3299169, -1.088979, 1, 0, 0, 1, 1,
-0.4300652, 0.3957168, 0.3128196, 1, 0, 0, 1, 1,
-0.427114, 1.298969, -0.2268897, 1, 0, 0, 1, 1,
-0.4258691, -1.13844, -2.042815, 0, 0, 0, 1, 1,
-0.4232433, 0.9626646, -0.3049979, 0, 0, 0, 1, 1,
-0.4216237, 1.167744, 0.3175517, 0, 0, 0, 1, 1,
-0.4182611, 0.8121694, -0.3619584, 0, 0, 0, 1, 1,
-0.4163904, -0.3885514, -3.573905, 0, 0, 0, 1, 1,
-0.4153768, 1.485901, -2.898295, 0, 0, 0, 1, 1,
-0.4095713, -0.5497946, -2.395196, 0, 0, 0, 1, 1,
-0.4055915, -2.654449, -3.28303, 1, 1, 1, 1, 1,
-0.3977316, -0.2916342, -3.865215, 1, 1, 1, 1, 1,
-0.3953058, -1.076028, -2.895481, 1, 1, 1, 1, 1,
-0.3852457, 0.961934, -1.94807, 1, 1, 1, 1, 1,
-0.3838262, 0.8315159, -0.1285911, 1, 1, 1, 1, 1,
-0.381995, -0.2504801, -2.333194, 1, 1, 1, 1, 1,
-0.3818517, -0.7773601, -3.350391, 1, 1, 1, 1, 1,
-0.3808672, 1.144677, -0.7584504, 1, 1, 1, 1, 1,
-0.373353, 1.205984, 0.5527267, 1, 1, 1, 1, 1,
-0.3680238, -2.982728, -4.274752, 1, 1, 1, 1, 1,
-0.3663763, -0.6657645, -2.539068, 1, 1, 1, 1, 1,
-0.3659287, -0.01712085, -2.252312, 1, 1, 1, 1, 1,
-0.3652383, 0.05269823, -0.6478249, 1, 1, 1, 1, 1,
-0.3648608, -0.06176561, -1.017768, 1, 1, 1, 1, 1,
-0.3636252, -0.7291397, -3.159346, 1, 1, 1, 1, 1,
-0.3634956, -0.1204289, -1.574211, 0, 0, 1, 1, 1,
-0.3631343, -0.3197442, -1.674063, 1, 0, 0, 1, 1,
-0.358319, 0.8153257, 0.3778024, 1, 0, 0, 1, 1,
-0.3563593, -0.09891925, -1.83827, 1, 0, 0, 1, 1,
-0.3510443, 0.9516929, -0.2678831, 1, 0, 0, 1, 1,
-0.3488677, -0.1562224, -2.791347, 1, 0, 0, 1, 1,
-0.3471573, -0.1410509, -2.583766, 0, 0, 0, 1, 1,
-0.3463371, -0.5351626, -3.568879, 0, 0, 0, 1, 1,
-0.3460425, 0.1876675, -0.3074613, 0, 0, 0, 1, 1,
-0.3431343, 0.6260611, -2.548171, 0, 0, 0, 1, 1,
-0.3417147, -0.1471288, -1.561779, 0, 0, 0, 1, 1,
-0.3365456, 0.07987238, -1.723392, 0, 0, 0, 1, 1,
-0.3338739, 1.592861, -0.04811789, 0, 0, 0, 1, 1,
-0.3307692, -1.060562, -2.7809, 1, 1, 1, 1, 1,
-0.3261336, -0.1471586, -3.083062, 1, 1, 1, 1, 1,
-0.3243241, -0.06763023, -2.016136, 1, 1, 1, 1, 1,
-0.3242936, -1.521393, -3.418132, 1, 1, 1, 1, 1,
-0.3212965, 0.1696628, -0.6328734, 1, 1, 1, 1, 1,
-0.3182521, 1.763304, -1.518092, 1, 1, 1, 1, 1,
-0.315044, -0.5675849, -0.871317, 1, 1, 1, 1, 1,
-0.314279, -1.213591, -3.480352, 1, 1, 1, 1, 1,
-0.3138365, 1.469687, -0.1722554, 1, 1, 1, 1, 1,
-0.3113226, -1.992212, -3.150276, 1, 1, 1, 1, 1,
-0.310474, -0.5369425, -3.545795, 1, 1, 1, 1, 1,
-0.3097641, -0.914103, -1.593348, 1, 1, 1, 1, 1,
-0.3058858, -0.2770553, 0.0593578, 1, 1, 1, 1, 1,
-0.304621, -0.2366521, -3.08874, 1, 1, 1, 1, 1,
-0.3038625, -0.002944292, 0.183903, 1, 1, 1, 1, 1,
-0.3022999, -2.790816, -3.322959, 0, 0, 1, 1, 1,
-0.294906, 0.3987778, -0.4651134, 1, 0, 0, 1, 1,
-0.2946979, -0.1783617, -2.823886, 1, 0, 0, 1, 1,
-0.2946709, -0.36116, -3.357057, 1, 0, 0, 1, 1,
-0.2922611, 0.04269279, -2.068311, 1, 0, 0, 1, 1,
-0.2890267, 0.7593269, 2.825952, 1, 0, 0, 1, 1,
-0.2816603, 0.3506044, -0.8222234, 0, 0, 0, 1, 1,
-0.2813603, 0.7254875, 0.7001969, 0, 0, 0, 1, 1,
-0.2794664, -1.759679, -4.405779, 0, 0, 0, 1, 1,
-0.268773, 0.0602106, -2.343517, 0, 0, 0, 1, 1,
-0.2678465, -0.04797484, -0.1742764, 0, 0, 0, 1, 1,
-0.2619831, 0.0325935, -3.269575, 0, 0, 0, 1, 1,
-0.2594251, 1.20648, -0.5389655, 0, 0, 0, 1, 1,
-0.2555014, -1.087472, -4.25281, 1, 1, 1, 1, 1,
-0.2525645, 0.4842364, -2.367938, 1, 1, 1, 1, 1,
-0.2518052, -0.713857, -2.666956, 1, 1, 1, 1, 1,
-0.2504484, 0.1202527, -2.606378, 1, 1, 1, 1, 1,
-0.2498586, 0.3371042, 0.7602715, 1, 1, 1, 1, 1,
-0.2450345, 1.357051, 0.08890242, 1, 1, 1, 1, 1,
-0.2414221, -1.44967, -1.466189, 1, 1, 1, 1, 1,
-0.235352, 0.5502732, -0.09713043, 1, 1, 1, 1, 1,
-0.2296776, -0.09523643, -3.152496, 1, 1, 1, 1, 1,
-0.2288694, -1.108697, -2.438927, 1, 1, 1, 1, 1,
-0.2278143, 0.8045277, -0.9760278, 1, 1, 1, 1, 1,
-0.2267976, -0.3442177, -1.96537, 1, 1, 1, 1, 1,
-0.2200951, -0.2794729, -1.802441, 1, 1, 1, 1, 1,
-0.2182013, 0.4963681, -0.6596533, 1, 1, 1, 1, 1,
-0.2170692, -0.6552198, -3.269001, 1, 1, 1, 1, 1,
-0.2152404, 1.334813, 1.43522, 0, 0, 1, 1, 1,
-0.2100415, 1.04823, -0.8972934, 1, 0, 0, 1, 1,
-0.2081631, -0.4224308, -1.191454, 1, 0, 0, 1, 1,
-0.2052651, -2.292857, -1.522149, 1, 0, 0, 1, 1,
-0.1966714, 2.173229, -1.232127, 1, 0, 0, 1, 1,
-0.1937351, 1.61304, 0.0009486183, 1, 0, 0, 1, 1,
-0.1922347, -0.5789519, -2.614802, 0, 0, 0, 1, 1,
-0.1921344, -1.091141, -3.408773, 0, 0, 0, 1, 1,
-0.1893157, 0.8149013, 0.1264129, 0, 0, 0, 1, 1,
-0.1882722, -2.605068, -1.623499, 0, 0, 0, 1, 1,
-0.1877941, -0.4539834, -2.080921, 0, 0, 0, 1, 1,
-0.1851979, 0.3860865, -1.58808, 0, 0, 0, 1, 1,
-0.1837863, 1.343912, -0.116269, 0, 0, 0, 1, 1,
-0.1810066, -1.368943, -2.247737, 1, 1, 1, 1, 1,
-0.1788983, -0.484216, -4.32746, 1, 1, 1, 1, 1,
-0.1781027, 1.270576, -0.3282574, 1, 1, 1, 1, 1,
-0.1776694, 1.087612, -0.4479669, 1, 1, 1, 1, 1,
-0.1751682, 1.28133, -0.02890421, 1, 1, 1, 1, 1,
-0.1746282, 2.425532, -0.8740096, 1, 1, 1, 1, 1,
-0.1737285, -0.9294805, -3.710997, 1, 1, 1, 1, 1,
-0.1735115, -0.5843562, -6.936163, 1, 1, 1, 1, 1,
-0.1716087, 0.830151, -1.171486, 1, 1, 1, 1, 1,
-0.1675861, 0.2492799, -1.354168, 1, 1, 1, 1, 1,
-0.1666751, -0.8479427, -4.444918, 1, 1, 1, 1, 1,
-0.1659359, -0.4158872, -4.404854, 1, 1, 1, 1, 1,
-0.163525, 0.7305875, 1.22382, 1, 1, 1, 1, 1,
-0.1571285, 0.2437051, -2.195585, 1, 1, 1, 1, 1,
-0.1532516, -1.124666, -3.138326, 1, 1, 1, 1, 1,
-0.1526377, -1.156155, -2.924638, 0, 0, 1, 1, 1,
-0.1450863, -0.8060783, -3.008334, 1, 0, 0, 1, 1,
-0.1428955, -0.2606349, -4.107208, 1, 0, 0, 1, 1,
-0.1396557, 0.3010648, -0.185562, 1, 0, 0, 1, 1,
-0.1378586, 0.2597876, 1.041741, 1, 0, 0, 1, 1,
-0.1353126, -2.261583, -3.891072, 1, 0, 0, 1, 1,
-0.1257225, -0.3130495, -1.156718, 0, 0, 0, 1, 1,
-0.1245196, 1.057656, 0.6977213, 0, 0, 0, 1, 1,
-0.1219943, 1.014587, 1.170158, 0, 0, 0, 1, 1,
-0.1205888, -1.005612, -1.725176, 0, 0, 0, 1, 1,
-0.1181739, 0.0827981, -0.8127457, 0, 0, 0, 1, 1,
-0.1170878, -0.7688165, -1.789566, 0, 0, 0, 1, 1,
-0.1169996, -0.8270299, -2.776913, 0, 0, 0, 1, 1,
-0.1169123, 1.198698, -2.953816, 1, 1, 1, 1, 1,
-0.1139244, -1.521142, -1.727317, 1, 1, 1, 1, 1,
-0.1139193, -0.2808909, -1.973255, 1, 1, 1, 1, 1,
-0.1126917, -0.8487276, -2.651988, 1, 1, 1, 1, 1,
-0.1056542, -0.5264855, -3.801105, 1, 1, 1, 1, 1,
-0.1041865, 0.4392889, 1.256084, 1, 1, 1, 1, 1,
-0.1036728, -1.605795, -1.916042, 1, 1, 1, 1, 1,
-0.1000584, 1.333087, -1.400746, 1, 1, 1, 1, 1,
-0.09578309, -0.07951087, -0.8693994, 1, 1, 1, 1, 1,
-0.09502316, -1.253029, -2.864415, 1, 1, 1, 1, 1,
-0.09472057, -1.530332, -4.202881, 1, 1, 1, 1, 1,
-0.08895414, 1.759116, -2.022328, 1, 1, 1, 1, 1,
-0.08681771, 1.188247, 0.1018399, 1, 1, 1, 1, 1,
-0.08469903, 0.6558892, -0.1202055, 1, 1, 1, 1, 1,
-0.08314869, -0.5737625, -3.198232, 1, 1, 1, 1, 1,
-0.0826737, -0.0166183, -0.6994851, 0, 0, 1, 1, 1,
-0.08185317, -0.3832916, -3.701541, 1, 0, 0, 1, 1,
-0.07765723, -0.002712269, 0.7958543, 1, 0, 0, 1, 1,
-0.0746154, 1.040759, -1.297761, 1, 0, 0, 1, 1,
-0.07169698, 0.9481699, 0.5913887, 1, 0, 0, 1, 1,
-0.06963587, 1.012476, 0.1799676, 1, 0, 0, 1, 1,
-0.06798883, 0.9952625, -0.7299697, 0, 0, 0, 1, 1,
-0.06683274, -1.556561, -2.111405, 0, 0, 0, 1, 1,
-0.0655644, -1.014152, -2.933491, 0, 0, 0, 1, 1,
-0.06488487, 0.5833199, 1.419533, 0, 0, 0, 1, 1,
-0.06406632, -2.139314, -2.917395, 0, 0, 0, 1, 1,
-0.06203166, 1.242249, -2.48841, 0, 0, 0, 1, 1,
-0.05898809, 0.8305769, 0.1496118, 0, 0, 0, 1, 1,
-0.05606968, 2.342683, 3.000634, 1, 1, 1, 1, 1,
-0.05604555, -2.056468, -2.426393, 1, 1, 1, 1, 1,
-0.05527437, 0.06098126, -0.8505663, 1, 1, 1, 1, 1,
-0.05496759, -0.1096962, -1.76945, 1, 1, 1, 1, 1,
-0.04921658, 0.2772792, 0.5352156, 1, 1, 1, 1, 1,
-0.03991694, -0.5967658, -3.244872, 1, 1, 1, 1, 1,
-0.03986931, 0.4667557, 0.853906, 1, 1, 1, 1, 1,
-0.03866732, -0.2129507, -1.776326, 1, 1, 1, 1, 1,
-0.0333938, -1.699988, -4.705059, 1, 1, 1, 1, 1,
-0.03303105, 0.1880643, -1.01379, 1, 1, 1, 1, 1,
-0.02955947, -1.04749, -2.122803, 1, 1, 1, 1, 1,
-0.028597, 0.6766341, 0.3926362, 1, 1, 1, 1, 1,
-0.0272494, -1.741554, -4.230902, 1, 1, 1, 1, 1,
-0.02481627, -0.6320028, -4.065224, 1, 1, 1, 1, 1,
-0.02437362, 0.1933978, -0.3738613, 1, 1, 1, 1, 1,
-0.02332832, 0.06263953, 0.08302575, 0, 0, 1, 1, 1,
-0.01804984, 1.128761, -0.2694086, 1, 0, 0, 1, 1,
-0.007375778, -0.008635883, -2.541597, 1, 0, 0, 1, 1,
-0.007086818, 0.1268703, 0.5989836, 1, 0, 0, 1, 1,
-0.005287134, 0.6598993, 0.4789489, 1, 0, 0, 1, 1,
-0.0009485443, -0.1999817, -2.32347, 1, 0, 0, 1, 1,
0.002309551, -1.667449, 2.242548, 0, 0, 0, 1, 1,
0.002477012, 0.8595929, -0.2389723, 0, 0, 0, 1, 1,
0.003321431, -0.5709066, 1.914505, 0, 0, 0, 1, 1,
0.004195224, -1.18382, 0.984079, 0, 0, 0, 1, 1,
0.006895159, 0.3162559, -0.5697577, 0, 0, 0, 1, 1,
0.008914561, 0.3585326, 0.9129841, 0, 0, 0, 1, 1,
0.01303767, 1.225886, 0.2247992, 0, 0, 0, 1, 1,
0.01323608, 1.699472, 1.279117, 1, 1, 1, 1, 1,
0.01529136, 0.9522983, 1.408946, 1, 1, 1, 1, 1,
0.02458671, -1.205201, 3.033863, 1, 1, 1, 1, 1,
0.02590209, -1.100077, 2.679126, 1, 1, 1, 1, 1,
0.03086681, -0.780635, 2.656389, 1, 1, 1, 1, 1,
0.03090779, -0.09188594, 1.043053, 1, 1, 1, 1, 1,
0.03235441, -0.6472486, 3.723062, 1, 1, 1, 1, 1,
0.03486891, -0.2230912, 3.982853, 1, 1, 1, 1, 1,
0.03557439, -0.2516019, 2.362669, 1, 1, 1, 1, 1,
0.04162345, 0.3118162, 0.268579, 1, 1, 1, 1, 1,
0.04402447, 0.2330404, 0.3546236, 1, 1, 1, 1, 1,
0.04741504, 0.06524061, 0.8730931, 1, 1, 1, 1, 1,
0.04894701, 0.9683022, -0.4202811, 1, 1, 1, 1, 1,
0.05543868, -0.7588315, 3.227938, 1, 1, 1, 1, 1,
0.05655978, 0.4361931, -0.748432, 1, 1, 1, 1, 1,
0.05758338, 0.1811211, 0.8903773, 0, 0, 1, 1, 1,
0.0580369, -0.4658959, 3.075946, 1, 0, 0, 1, 1,
0.06072967, 0.8178356, 0.2749307, 1, 0, 0, 1, 1,
0.0633039, 1.993799, -2.572675, 1, 0, 0, 1, 1,
0.06540221, -0.578591, 5.141465, 1, 0, 0, 1, 1,
0.06654281, -0.4858983, 2.941895, 1, 0, 0, 1, 1,
0.06810702, -1.770868, 3.28947, 0, 0, 0, 1, 1,
0.06861049, 0.5505154, 0.0836143, 0, 0, 0, 1, 1,
0.06897862, -1.613479, 1.874339, 0, 0, 0, 1, 1,
0.07155675, 0.5530919, -0.65569, 0, 0, 0, 1, 1,
0.0720716, 1.296217, -0.6172989, 0, 0, 0, 1, 1,
0.07295071, 0.1487265, -0.4836538, 0, 0, 0, 1, 1,
0.07298352, -1.028802, 2.952133, 0, 0, 0, 1, 1,
0.07317342, 1.720136, -0.5922974, 1, 1, 1, 1, 1,
0.07665753, 0.2698036, -1.473861, 1, 1, 1, 1, 1,
0.07822817, -1.175777, 3.397621, 1, 1, 1, 1, 1,
0.07864741, 0.8211336, -0.8960719, 1, 1, 1, 1, 1,
0.07923381, 0.6716393, -0.380058, 1, 1, 1, 1, 1,
0.08219542, 1.241267, -0.2484974, 1, 1, 1, 1, 1,
0.08581659, 0.02035527, 1.09646, 1, 1, 1, 1, 1,
0.08623163, 0.389701, 1.392042, 1, 1, 1, 1, 1,
0.08707258, 0.3152385, 0.441403, 1, 1, 1, 1, 1,
0.08758084, -0.2905859, 1.451607, 1, 1, 1, 1, 1,
0.08846717, 0.7397848, -0.3910519, 1, 1, 1, 1, 1,
0.08960978, -0.2151394, 2.976716, 1, 1, 1, 1, 1,
0.09069352, -0.07329067, 0.535926, 1, 1, 1, 1, 1,
0.09119992, 0.4464573, -0.04603298, 1, 1, 1, 1, 1,
0.0967943, -0.8731406, 2.09615, 1, 1, 1, 1, 1,
0.09683122, 0.6036094, -0.7464647, 0, 0, 1, 1, 1,
0.09900178, -0.31152, 3.009771, 1, 0, 0, 1, 1,
0.09908664, -0.7599918, 2.387568, 1, 0, 0, 1, 1,
0.09963111, 1.433063, -0.3047639, 1, 0, 0, 1, 1,
0.09998292, -0.9413407, 3.431371, 1, 0, 0, 1, 1,
0.1002349, -0.5458732, 2.561265, 1, 0, 0, 1, 1,
0.1005527, 1.532393, 1.627186, 0, 0, 0, 1, 1,
0.1025289, 0.3127143, 0.4804163, 0, 0, 0, 1, 1,
0.1049234, 0.4155594, 0.803521, 0, 0, 0, 1, 1,
0.1056219, -0.2500938, 3.022446, 0, 0, 0, 1, 1,
0.1091329, 0.03163317, 0.4523436, 0, 0, 0, 1, 1,
0.1097502, 0.449313, 2.102048, 0, 0, 0, 1, 1,
0.1226752, 0.156156, 1.086899, 0, 0, 0, 1, 1,
0.122941, 0.4310243, -1.2889, 1, 1, 1, 1, 1,
0.128282, -0.8875062, 4.663029, 1, 1, 1, 1, 1,
0.1316577, -0.3033475, 2.038613, 1, 1, 1, 1, 1,
0.1320681, 0.2982193, 1.426452, 1, 1, 1, 1, 1,
0.1416755, 0.2040828, -0.34794, 1, 1, 1, 1, 1,
0.1422182, 0.3897446, 1.323479, 1, 1, 1, 1, 1,
0.1445825, 1.413964, 0.3875255, 1, 1, 1, 1, 1,
0.1461082, 0.3103373, -0.1132163, 1, 1, 1, 1, 1,
0.1471021, -1.08433, 3.486875, 1, 1, 1, 1, 1,
0.1516733, 0.7332943, -1.24684, 1, 1, 1, 1, 1,
0.1517894, -0.8415564, 2.822993, 1, 1, 1, 1, 1,
0.1576346, 0.9910468, 0.7519764, 1, 1, 1, 1, 1,
0.1596428, -0.3540795, 2.373397, 1, 1, 1, 1, 1,
0.1633097, 0.5904365, 0.4415196, 1, 1, 1, 1, 1,
0.1656425, 0.273413, 0.07768418, 1, 1, 1, 1, 1,
0.1663345, 0.6254003, -0.4566458, 0, 0, 1, 1, 1,
0.1663474, -0.3148289, 1.692903, 1, 0, 0, 1, 1,
0.1737104, 0.3010664, 1.344116, 1, 0, 0, 1, 1,
0.1781369, -0.9523266, 1.869656, 1, 0, 0, 1, 1,
0.1799012, 0.3960661, 0.6413215, 1, 0, 0, 1, 1,
0.1842639, -0.1153612, 2.475559, 1, 0, 0, 1, 1,
0.1916979, -0.2826194, 3.766637, 0, 0, 0, 1, 1,
0.1960185, 1.926588, -0.07350866, 0, 0, 0, 1, 1,
0.1981275, 0.4543388, -0.07756957, 0, 0, 0, 1, 1,
0.2007715, 0.724585, 1.922899, 0, 0, 0, 1, 1,
0.2029639, -0.4638929, 2.279304, 0, 0, 0, 1, 1,
0.2036182, -0.5940685, 2.632919, 0, 0, 0, 1, 1,
0.2063889, 0.1287544, -0.3013227, 0, 0, 0, 1, 1,
0.2073926, -0.4056894, 4.026533, 1, 1, 1, 1, 1,
0.2077937, -0.6752705, 2.943397, 1, 1, 1, 1, 1,
0.2091564, -0.9808377, 3.775995, 1, 1, 1, 1, 1,
0.2111308, -1.678796, 2.599459, 1, 1, 1, 1, 1,
0.2140904, -1.088603, 2.930219, 1, 1, 1, 1, 1,
0.2152047, 0.5341387, 1.572197, 1, 1, 1, 1, 1,
0.2156624, -0.0965307, 3.092274, 1, 1, 1, 1, 1,
0.2158349, 1.09514, 2.601635, 1, 1, 1, 1, 1,
0.2181615, 0.584344, -0.9109697, 1, 1, 1, 1, 1,
0.2198009, -0.9094241, 3.155224, 1, 1, 1, 1, 1,
0.2199341, 1.929497, -0.7626594, 1, 1, 1, 1, 1,
0.2261848, 1.975925, 0.6501402, 1, 1, 1, 1, 1,
0.2473708, -0.3399582, 0.5835416, 1, 1, 1, 1, 1,
0.2510008, -0.2829637, 2.270981, 1, 1, 1, 1, 1,
0.2519043, -0.07210424, 2.582147, 1, 1, 1, 1, 1,
0.2521389, 1.096894, -0.2939909, 0, 0, 1, 1, 1,
0.2535843, 0.06573049, 1.398153, 1, 0, 0, 1, 1,
0.2543567, -1.556018, 2.651809, 1, 0, 0, 1, 1,
0.2570126, -0.8047572, 1.657634, 1, 0, 0, 1, 1,
0.2579395, -1.553072, 2.207829, 1, 0, 0, 1, 1,
0.2616066, -2.91007, 2.024569, 1, 0, 0, 1, 1,
0.2638382, 0.2427704, 0.843621, 0, 0, 0, 1, 1,
0.2641336, 0.1608801, 1.304637, 0, 0, 0, 1, 1,
0.2731824, 0.06908845, 2.751215, 0, 0, 0, 1, 1,
0.2754325, 0.7878798, 0.2938114, 0, 0, 0, 1, 1,
0.2760808, -0.785208, 2.509596, 0, 0, 0, 1, 1,
0.2806651, 0.1224662, 0.9042756, 0, 0, 0, 1, 1,
0.2825026, 0.5230874, 0.7259179, 0, 0, 0, 1, 1,
0.2839809, 0.3716141, 0.06610763, 1, 1, 1, 1, 1,
0.2856894, 0.03006755, 1.884142, 1, 1, 1, 1, 1,
0.2877347, 0.5045106, 0.3632225, 1, 1, 1, 1, 1,
0.2886453, 0.6714245, 0.559968, 1, 1, 1, 1, 1,
0.2940225, -0.2580914, 3.810945, 1, 1, 1, 1, 1,
0.2958874, 0.1497343, 1.205291, 1, 1, 1, 1, 1,
0.2981081, -1.173313, 3.689306, 1, 1, 1, 1, 1,
0.2988895, -0.466741, 1.041989, 1, 1, 1, 1, 1,
0.2990436, -0.3060806, 1.225358, 1, 1, 1, 1, 1,
0.2999474, -0.9637312, 3.550931, 1, 1, 1, 1, 1,
0.30304, -0.9780105, 3.096162, 1, 1, 1, 1, 1,
0.3089614, 0.4591264, -1.476568, 1, 1, 1, 1, 1,
0.3149299, 1.285104, -0.01003346, 1, 1, 1, 1, 1,
0.3155989, 0.4623441, 1.866173, 1, 1, 1, 1, 1,
0.3206914, -0.1201431, 1.822706, 1, 1, 1, 1, 1,
0.3258152, 0.2703821, -0.3486974, 0, 0, 1, 1, 1,
0.3271638, -2.337285, 2.004869, 1, 0, 0, 1, 1,
0.3346063, -0.455021, 1.966789, 1, 0, 0, 1, 1,
0.3347182, 0.3786135, 1.544445, 1, 0, 0, 1, 1,
0.3375226, -1.233933, 1.327791, 1, 0, 0, 1, 1,
0.3453614, 0.2018715, 1.775797, 1, 0, 0, 1, 1,
0.3474758, -1.282595, 4.00582, 0, 0, 0, 1, 1,
0.3497833, 0.3884076, 0.2370691, 0, 0, 0, 1, 1,
0.3502791, 1.257572, -0.2651575, 0, 0, 0, 1, 1,
0.3514319, -1.578615, 3.784941, 0, 0, 0, 1, 1,
0.3593707, -0.6476774, 1.967643, 0, 0, 0, 1, 1,
0.3600127, -0.07247199, 0.3435503, 0, 0, 0, 1, 1,
0.3653837, 0.7935141, -1.609286, 0, 0, 0, 1, 1,
0.3659034, 0.385023, -0.5570976, 1, 1, 1, 1, 1,
0.3668237, -0.9064768, 2.091255, 1, 1, 1, 1, 1,
0.3687889, 0.3988108, 3.309341, 1, 1, 1, 1, 1,
0.3702624, 0.7374594, 1.317424, 1, 1, 1, 1, 1,
0.3730575, -2.283938, 3.208593, 1, 1, 1, 1, 1,
0.3752681, 0.4682382, 0.6732393, 1, 1, 1, 1, 1,
0.3753159, -1.785593, 3.147825, 1, 1, 1, 1, 1,
0.3840537, 1.12006, -0.5301712, 1, 1, 1, 1, 1,
0.3888197, 0.2116562, 0.3312265, 1, 1, 1, 1, 1,
0.3892823, -1.028955, 3.268268, 1, 1, 1, 1, 1,
0.3905583, 1.458402, 0.07055834, 1, 1, 1, 1, 1,
0.3909581, 0.8785584, 0.2699002, 1, 1, 1, 1, 1,
0.3913845, -0.5733848, 3.748075, 1, 1, 1, 1, 1,
0.3954649, 0.2647738, 2.818991, 1, 1, 1, 1, 1,
0.3965766, 0.1811489, 0.5203674, 1, 1, 1, 1, 1,
0.3996055, -0.1286223, 1.869964, 0, 0, 1, 1, 1,
0.4007474, -0.8194174, 1.505209, 1, 0, 0, 1, 1,
0.4054229, -2.112032, 3.187921, 1, 0, 0, 1, 1,
0.4057529, -2.604988, 1.122431, 1, 0, 0, 1, 1,
0.4092768, -0.4038674, 2.71716, 1, 0, 0, 1, 1,
0.409472, -0.7988248, 3.086238, 1, 0, 0, 1, 1,
0.41026, 0.08773243, 1.907225, 0, 0, 0, 1, 1,
0.4106717, -1.59888, 2.332856, 0, 0, 0, 1, 1,
0.4151248, -0.6755286, 4.692364, 0, 0, 0, 1, 1,
0.4200339, 0.8740743, -0.9814859, 0, 0, 0, 1, 1,
0.4245347, 2.318529, -0.1479014, 0, 0, 0, 1, 1,
0.4250308, -0.3646342, 3.463336, 0, 0, 0, 1, 1,
0.4284395, 1.216606, 0.8118812, 0, 0, 0, 1, 1,
0.4391375, 1.711605, 0.2877181, 1, 1, 1, 1, 1,
0.4467134, -0.7747023, 2.419855, 1, 1, 1, 1, 1,
0.4474571, 0.5210122, 0.06487189, 1, 1, 1, 1, 1,
0.448439, -0.7843009, 3.410696, 1, 1, 1, 1, 1,
0.4575484, -0.3970919, 2.553434, 1, 1, 1, 1, 1,
0.4603058, -2.712823, 3.694009, 1, 1, 1, 1, 1,
0.4604589, 0.2541621, 0.7297521, 1, 1, 1, 1, 1,
0.4626603, -1.787062, 3.147639, 1, 1, 1, 1, 1,
0.4637128, -0.4930396, 2.669638, 1, 1, 1, 1, 1,
0.4689215, -0.5653017, 2.295314, 1, 1, 1, 1, 1,
0.4709482, 2.042999, 0.07901298, 1, 1, 1, 1, 1,
0.4731991, 1.056252, 0.6042635, 1, 1, 1, 1, 1,
0.4747108, -0.6988042, 3.091226, 1, 1, 1, 1, 1,
0.475821, -0.09346658, 2.115194, 1, 1, 1, 1, 1,
0.4771864, -0.6576417, 1.837584, 1, 1, 1, 1, 1,
0.4781201, 0.4982387, 0.1320449, 0, 0, 1, 1, 1,
0.4795913, 1.313955, 1.383064, 1, 0, 0, 1, 1,
0.4801477, -0.4004106, 1.266733, 1, 0, 0, 1, 1,
0.4871952, 0.3504873, 0.8609159, 1, 0, 0, 1, 1,
0.489521, -0.1498849, 0.7328107, 1, 0, 0, 1, 1,
0.4934532, -0.3703679, 3.084787, 1, 0, 0, 1, 1,
0.4966347, 0.5771168, 0.1054955, 0, 0, 0, 1, 1,
0.4978581, -1.161448, 1.09393, 0, 0, 0, 1, 1,
0.4989576, 0.2449657, 0.3987521, 0, 0, 0, 1, 1,
0.5083249, -0.6690849, 2.597775, 0, 0, 0, 1, 1,
0.5098002, 0.28622, 0.3455564, 0, 0, 0, 1, 1,
0.5139292, -1.197191, 2.405716, 0, 0, 0, 1, 1,
0.5149573, 0.4645063, -0.1467941, 0, 0, 0, 1, 1,
0.5178928, 0.9973658, 0.08716573, 1, 1, 1, 1, 1,
0.5185057, 1.550588, 0.1205363, 1, 1, 1, 1, 1,
0.5243205, 0.4326632, -0.3776992, 1, 1, 1, 1, 1,
0.5378016, 0.3162325, 1.666941, 1, 1, 1, 1, 1,
0.5433987, -1.040299, 1.372699, 1, 1, 1, 1, 1,
0.5527434, 0.2085278, 0.8058277, 1, 1, 1, 1, 1,
0.5543826, -0.840367, 1.9521, 1, 1, 1, 1, 1,
0.5561579, -0.7712477, 3.10217, 1, 1, 1, 1, 1,
0.5590398, 0.5658957, 0.4782023, 1, 1, 1, 1, 1,
0.5696868, -0.4835417, 0.8787305, 1, 1, 1, 1, 1,
0.5783343, 0.4794725, 1.907213, 1, 1, 1, 1, 1,
0.583158, -0.2437914, 2.036966, 1, 1, 1, 1, 1,
0.5879965, -0.7269118, 3.054976, 1, 1, 1, 1, 1,
0.5890805, 0.3089695, 2.884666, 1, 1, 1, 1, 1,
0.5922229, 0.9160125, 0.8674515, 1, 1, 1, 1, 1,
0.5948052, -0.8654737, 2.553195, 0, 0, 1, 1, 1,
0.6013019, 0.3961318, 1.366292, 1, 0, 0, 1, 1,
0.601386, 0.6995814, 0.7166188, 1, 0, 0, 1, 1,
0.6037709, 0.5546826, 1.26749, 1, 0, 0, 1, 1,
0.6136269, 0.8276697, 0.1267454, 1, 0, 0, 1, 1,
0.6165468, -0.5948697, 2.60044, 1, 0, 0, 1, 1,
0.6173659, -1.072129, 2.546537, 0, 0, 0, 1, 1,
0.6207783, -0.757352, 0.9130674, 0, 0, 0, 1, 1,
0.6259711, -0.8920332, 2.240248, 0, 0, 0, 1, 1,
0.6260502, 0.7999794, -0.2709934, 0, 0, 0, 1, 1,
0.6275046, -0.7959386, 1.851315, 0, 0, 0, 1, 1,
0.6287282, 1.009333, 1.359827, 0, 0, 0, 1, 1,
0.6367228, 0.6498778, 0.6385794, 0, 0, 0, 1, 1,
0.6367969, -0.7206933, 1.852588, 1, 1, 1, 1, 1,
0.6474637, -0.9786977, 2.980065, 1, 1, 1, 1, 1,
0.6475078, -0.07878521, 1.542972, 1, 1, 1, 1, 1,
0.6486773, -0.385102, 2.25869, 1, 1, 1, 1, 1,
0.6487043, -1.141912, 3.262825, 1, 1, 1, 1, 1,
0.6501951, -0.5317494, 1.268249, 1, 1, 1, 1, 1,
0.6513534, -0.1284041, 2.77558, 1, 1, 1, 1, 1,
0.6552415, 0.04861906, 0.4055286, 1, 1, 1, 1, 1,
0.660885, 0.3939495, 2.017369, 1, 1, 1, 1, 1,
0.6624552, -1.018169, 1.099269, 1, 1, 1, 1, 1,
0.6625223, -1.426009, 2.821374, 1, 1, 1, 1, 1,
0.6707061, -0.09321135, 0.7880971, 1, 1, 1, 1, 1,
0.6707799, 0.887413, 0.3409374, 1, 1, 1, 1, 1,
0.6733633, -0.7746152, 2.352689, 1, 1, 1, 1, 1,
0.6747234, -0.0833643, 1.627681, 1, 1, 1, 1, 1,
0.6760932, -0.057044, 2.473215, 0, 0, 1, 1, 1,
0.6785556, -0.3099272, 1.785517, 1, 0, 0, 1, 1,
0.6797089, -0.755495, 3.808636, 1, 0, 0, 1, 1,
0.680146, 0.690789, 2.597896, 1, 0, 0, 1, 1,
0.6801999, -0.1821647, 2.172097, 1, 0, 0, 1, 1,
0.6820673, 2.763377, -0.01920391, 1, 0, 0, 1, 1,
0.694352, -0.818177, 3.302234, 0, 0, 0, 1, 1,
0.6953033, -1.624849, 3.037595, 0, 0, 0, 1, 1,
0.6999866, 0.2534317, 0.2675645, 0, 0, 0, 1, 1,
0.707341, 0.3117852, 0.04793673, 0, 0, 0, 1, 1,
0.7073961, 0.4041258, 1.348486, 0, 0, 0, 1, 1,
0.7096698, 0.616485, 2.295635, 0, 0, 0, 1, 1,
0.7131056, -0.6631405, 1.799659, 0, 0, 0, 1, 1,
0.7178931, 0.02268847, 1.744295, 1, 1, 1, 1, 1,
0.7322556, 0.6119089, 2.740158, 1, 1, 1, 1, 1,
0.7363085, -0.485982, 2.576833, 1, 1, 1, 1, 1,
0.7370305, -0.3868546, -0.7627653, 1, 1, 1, 1, 1,
0.738624, -0.4322758, 1.81177, 1, 1, 1, 1, 1,
0.7436444, -0.08733211, 1.285657, 1, 1, 1, 1, 1,
0.7480729, -1.086713, 4.089818, 1, 1, 1, 1, 1,
0.7519871, 1.173103, 0.5219027, 1, 1, 1, 1, 1,
0.7552562, 1.445573, -0.1736584, 1, 1, 1, 1, 1,
0.7586758, 0.07616534, 0.4975964, 1, 1, 1, 1, 1,
0.7618983, -0.3075096, 2.103031, 1, 1, 1, 1, 1,
0.7697524, 1.059687, 1.472013, 1, 1, 1, 1, 1,
0.7746957, 0.8158734, 0.2029966, 1, 1, 1, 1, 1,
0.7760035, 1.274615, -0.9162013, 1, 1, 1, 1, 1,
0.7763935, 0.1646917, -1.262771, 1, 1, 1, 1, 1,
0.7765589, -0.6878197, 2.877529, 0, 0, 1, 1, 1,
0.7819911, -0.260225, 2.783008, 1, 0, 0, 1, 1,
0.7836739, -0.895329, 2.939583, 1, 0, 0, 1, 1,
0.7857878, -0.1289231, 3.08982, 1, 0, 0, 1, 1,
0.7868457, -1.513246, 2.878249, 1, 0, 0, 1, 1,
0.7888775, 1.077444, 1.144266, 1, 0, 0, 1, 1,
0.793511, 0.6221091, 1.178207, 0, 0, 0, 1, 1,
0.7962371, -0.7132776, 1.411248, 0, 0, 0, 1, 1,
0.7972293, -0.4273775, 2.279007, 0, 0, 0, 1, 1,
0.7986761, -1.504319, 2.462973, 0, 0, 0, 1, 1,
0.8077644, 1.74547, -0.7560808, 0, 0, 0, 1, 1,
0.8180799, -0.7034413, 2.117204, 0, 0, 0, 1, 1,
0.8198858, 0.7894399, -0.5346838, 0, 0, 0, 1, 1,
0.8280324, -0.3972026, 1.77174, 1, 1, 1, 1, 1,
0.8383375, -0.4293263, 1.546197, 1, 1, 1, 1, 1,
0.8391803, -0.4285057, 0.5641677, 1, 1, 1, 1, 1,
0.8402003, 0.4110488, 1.022607, 1, 1, 1, 1, 1,
0.8403882, -1.501047, 2.14749, 1, 1, 1, 1, 1,
0.8507926, 0.03203807, 2.822604, 1, 1, 1, 1, 1,
0.8539191, -1.006223, 2.18448, 1, 1, 1, 1, 1,
0.8589429, -1.115534, 3.061806, 1, 1, 1, 1, 1,
0.862556, -0.09627288, 0.1602145, 1, 1, 1, 1, 1,
0.8642622, -0.7392674, 1.035973, 1, 1, 1, 1, 1,
0.868023, 0.1792444, 1.153812, 1, 1, 1, 1, 1,
0.8685888, -0.4273376, 3.408115, 1, 1, 1, 1, 1,
0.876597, 0.1379147, 1.686993, 1, 1, 1, 1, 1,
0.8880898, 0.09711684, 3.22288, 1, 1, 1, 1, 1,
0.89136, -0.02306795, 2.256706, 1, 1, 1, 1, 1,
0.9026249, -0.1916636, 2.240336, 0, 0, 1, 1, 1,
0.9045677, -0.3473391, 1.370314, 1, 0, 0, 1, 1,
0.9047229, -0.1744259, 0.5177638, 1, 0, 0, 1, 1,
0.9054281, -0.1124569, 2.225493, 1, 0, 0, 1, 1,
0.9055712, 0.7630356, 0.6219574, 1, 0, 0, 1, 1,
0.9172667, -1.325691, 2.910781, 1, 0, 0, 1, 1,
0.9191014, 1.89769, 0.6850109, 0, 0, 0, 1, 1,
0.9192075, 0.8153204, 0.6766751, 0, 0, 0, 1, 1,
0.9213691, 0.7045162, -0.4762497, 0, 0, 0, 1, 1,
0.9301593, -0.5693204, 1.876779, 0, 0, 0, 1, 1,
0.9310702, -0.2347296, 2.873088, 0, 0, 0, 1, 1,
0.9325908, -0.6779315, 3.025531, 0, 0, 0, 1, 1,
0.9421948, -1.828426, 3.571497, 0, 0, 0, 1, 1,
0.9426693, 0.8858602, 0.8818092, 1, 1, 1, 1, 1,
0.9481893, 1.607997, 0.8340849, 1, 1, 1, 1, 1,
0.9493545, 0.3945575, 1.091378, 1, 1, 1, 1, 1,
0.9544125, -1.080004, 2.780886, 1, 1, 1, 1, 1,
0.9575049, 2.358508, -0.467621, 1, 1, 1, 1, 1,
0.964691, 0.1581515, 2.426985, 1, 1, 1, 1, 1,
0.9654371, 0.1660579, 0.04152213, 1, 1, 1, 1, 1,
0.9715117, 1.474397, 1.545545, 1, 1, 1, 1, 1,
0.9800875, 1.841953, -0.4565989, 1, 1, 1, 1, 1,
0.9853217, -0.3496537, 2.724308, 1, 1, 1, 1, 1,
0.9860734, 2.022014, -0.313726, 1, 1, 1, 1, 1,
0.9864268, -0.7148946, 3.743083, 1, 1, 1, 1, 1,
0.9870986, -0.2254422, 0.4974608, 1, 1, 1, 1, 1,
0.9875227, 1.188459, 1.112457, 1, 1, 1, 1, 1,
0.9921926, 0.7468461, -0.7533149, 1, 1, 1, 1, 1,
0.9944536, -0.2290464, 2.608363, 0, 0, 1, 1, 1,
1.006351, -0.5157852, 2.53135, 1, 0, 0, 1, 1,
1.009777, -0.4889053, 2.26497, 1, 0, 0, 1, 1,
1.010324, -0.8033936, 1.154312, 1, 0, 0, 1, 1,
1.018078, -0.8650426, 4.122842, 1, 0, 0, 1, 1,
1.021883, -3.344908, 2.933736, 1, 0, 0, 1, 1,
1.027197, 0.6641344, 2.056651, 0, 0, 0, 1, 1,
1.027925, -1.164813, 2.563338, 0, 0, 0, 1, 1,
1.028543, 1.598678, 1.60017, 0, 0, 0, 1, 1,
1.029849, 0.7580506, -0.4045581, 0, 0, 0, 1, 1,
1.030152, 0.2749292, 2.809174, 0, 0, 0, 1, 1,
1.039391, 1.131389, 1.956644, 0, 0, 0, 1, 1,
1.039811, 0.02112009, 1.660683, 0, 0, 0, 1, 1,
1.04742, 0.5381809, 1.804151, 1, 1, 1, 1, 1,
1.053208, -0.5089343, 1.005817, 1, 1, 1, 1, 1,
1.054851, 0.956344, -0.3639663, 1, 1, 1, 1, 1,
1.055412, 0.7172199, 0.3521793, 1, 1, 1, 1, 1,
1.060404, 0.5440717, 2.614498, 1, 1, 1, 1, 1,
1.064731, -0.2519653, 1.802399, 1, 1, 1, 1, 1,
1.065438, 0.4390715, 0.9840938, 1, 1, 1, 1, 1,
1.067527, -0.02386704, 0.4631047, 1, 1, 1, 1, 1,
1.076096, 2.402527, -0.6277417, 1, 1, 1, 1, 1,
1.076487, 0.8072073, 2.5311, 1, 1, 1, 1, 1,
1.079351, -0.5678315, 1.702665, 1, 1, 1, 1, 1,
1.080898, 0.7381111, 0.1052558, 1, 1, 1, 1, 1,
1.083007, -0.9536951, 2.294004, 1, 1, 1, 1, 1,
1.084037, 1.384338, 1.497847, 1, 1, 1, 1, 1,
1.085385, 0.7940847, 1.004147, 1, 1, 1, 1, 1,
1.107576, 0.7051482, 0.6260134, 0, 0, 1, 1, 1,
1.118273, 0.2607801, 1.292779, 1, 0, 0, 1, 1,
1.118277, -0.3481371, 3.092156, 1, 0, 0, 1, 1,
1.118665, 0.3927954, 1.490225, 1, 0, 0, 1, 1,
1.124015, 2.172341, 0.2821249, 1, 0, 0, 1, 1,
1.125501, 1.204044, 1.287888, 1, 0, 0, 1, 1,
1.132057, -1.330927, 2.854785, 0, 0, 0, 1, 1,
1.136211, -0.6934694, 2.975586, 0, 0, 0, 1, 1,
1.145811, 0.2120069, 1.57898, 0, 0, 0, 1, 1,
1.15414, 1.134181, 0.3708003, 0, 0, 0, 1, 1,
1.160757, 0.493367, 2.947027, 0, 0, 0, 1, 1,
1.163482, -1.699023, 3.357481, 0, 0, 0, 1, 1,
1.165439, -1.161027, 3.219049, 0, 0, 0, 1, 1,
1.165599, -0.2070049, 2.483734, 1, 1, 1, 1, 1,
1.172589, -2.147045, 3.062597, 1, 1, 1, 1, 1,
1.174134, -1.176605, 2.498403, 1, 1, 1, 1, 1,
1.184067, 2.001365, 0.1027621, 1, 1, 1, 1, 1,
1.194654, -0.4213375, 0.9104924, 1, 1, 1, 1, 1,
1.197136, 0.2029377, 1.531825, 1, 1, 1, 1, 1,
1.208982, -0.3534531, 2.320398, 1, 1, 1, 1, 1,
1.209406, 1.547021, 0.3635887, 1, 1, 1, 1, 1,
1.21333, 1.693289, -0.2582352, 1, 1, 1, 1, 1,
1.216189, -1.490118, 4.753662, 1, 1, 1, 1, 1,
1.21703, -0.3261237, 1.696062, 1, 1, 1, 1, 1,
1.219145, -0.09888075, 1.716933, 1, 1, 1, 1, 1,
1.220241, 1.325704, 2.418325, 1, 1, 1, 1, 1,
1.221649, -1.016174, 1.520087, 1, 1, 1, 1, 1,
1.222081, -0.6165921, 1.785092, 1, 1, 1, 1, 1,
1.224685, -2.231759, 3.195029, 0, 0, 1, 1, 1,
1.228194, -0.05883725, 1.939445, 1, 0, 0, 1, 1,
1.229037, -0.6432193, 2.06289, 1, 0, 0, 1, 1,
1.239487, -0.2681749, 2.882972, 1, 0, 0, 1, 1,
1.241458, -0.9661922, 3.469601, 1, 0, 0, 1, 1,
1.250415, -0.3531172, 1.718808, 1, 0, 0, 1, 1,
1.251006, 0.4368044, 1.230301, 0, 0, 0, 1, 1,
1.256876, 0.1693738, 2.8244, 0, 0, 0, 1, 1,
1.258717, 0.7936774, 0.9277825, 0, 0, 0, 1, 1,
1.259937, 0.983764, 1.00254, 0, 0, 0, 1, 1,
1.263157, -0.4233378, 2.62088, 0, 0, 0, 1, 1,
1.263774, 0.453646, 0.9944689, 0, 0, 0, 1, 1,
1.263965, 0.5897775, 0.1857999, 0, 0, 0, 1, 1,
1.265765, -0.4899372, 2.07232, 1, 1, 1, 1, 1,
1.268121, -1.07034, 1.815146, 1, 1, 1, 1, 1,
1.2683, -0.1290806, 2.153502, 1, 1, 1, 1, 1,
1.284045, -0.6548958, 2.193826, 1, 1, 1, 1, 1,
1.306559, 2.548244, -0.3019727, 1, 1, 1, 1, 1,
1.311633, 1.5421, 0.5303704, 1, 1, 1, 1, 1,
1.316941, -0.03943642, 1.062246, 1, 1, 1, 1, 1,
1.319327, 0.5654097, 1.371085, 1, 1, 1, 1, 1,
1.323995, 0.1386285, 1.868028, 1, 1, 1, 1, 1,
1.32527, -0.05207217, 2.004521, 1, 1, 1, 1, 1,
1.328182, -0.0927513, 1.608027, 1, 1, 1, 1, 1,
1.332291, 0.01364565, 1.32321, 1, 1, 1, 1, 1,
1.341421, -0.4859447, 4.013314, 1, 1, 1, 1, 1,
1.376194, 0.5373745, 2.202382, 1, 1, 1, 1, 1,
1.382367, 1.074751, 1.501961, 1, 1, 1, 1, 1,
1.397162, -1.971299, 2.84792, 0, 0, 1, 1, 1,
1.39852, -2.506209, 3.773981, 1, 0, 0, 1, 1,
1.400025, -0.3352251, -0.3030443, 1, 0, 0, 1, 1,
1.409656, 0.1477275, 0.383903, 1, 0, 0, 1, 1,
1.419927, -0.5094834, 1.663014, 1, 0, 0, 1, 1,
1.42744, 0.2600258, -0.1023057, 1, 0, 0, 1, 1,
1.429164, 0.1563257, 2.258516, 0, 0, 0, 1, 1,
1.431312, 0.879097, 1.544017, 0, 0, 0, 1, 1,
1.436733, 0.1601287, 1.991598, 0, 0, 0, 1, 1,
1.437718, -0.81326, 2.808329, 0, 0, 0, 1, 1,
1.447499, -0.1781835, 2.575489, 0, 0, 0, 1, 1,
1.451425, -1.555709, 2.136711, 0, 0, 0, 1, 1,
1.463216, -0.1274979, 1.295494, 0, 0, 0, 1, 1,
1.479658, 0.6428652, 0.1063091, 1, 1, 1, 1, 1,
1.493108, 0.7056782, -0.5701302, 1, 1, 1, 1, 1,
1.493241, -0.7830423, 3.488822, 1, 1, 1, 1, 1,
1.494035, -1.183839, 1.823286, 1, 1, 1, 1, 1,
1.505129, 0.9567038, 1.08392, 1, 1, 1, 1, 1,
1.507669, -1.091051, 1.651441, 1, 1, 1, 1, 1,
1.525234, 0.656319, 0.5262636, 1, 1, 1, 1, 1,
1.52827, 0.2712191, 1.216684, 1, 1, 1, 1, 1,
1.542112, -0.06622495, 0.7936376, 1, 1, 1, 1, 1,
1.547158, 2.282792, 1.033073, 1, 1, 1, 1, 1,
1.556386, 0.6879171, 1.628242, 1, 1, 1, 1, 1,
1.56354, -0.6015528, 0.6810834, 1, 1, 1, 1, 1,
1.566161, -0.09083656, 0.9617221, 1, 1, 1, 1, 1,
1.578094, -0.5947114, 1.28223, 1, 1, 1, 1, 1,
1.590264, 1.098662, 1.15299, 1, 1, 1, 1, 1,
1.595893, -1.347593, 2.802405, 0, 0, 1, 1, 1,
1.601362, 0.0377474, 1.751823, 1, 0, 0, 1, 1,
1.607098, 1.097313, 1.072812, 1, 0, 0, 1, 1,
1.607216, -0.4602477, 0.8639497, 1, 0, 0, 1, 1,
1.61357, -0.8328856, 0.6604268, 1, 0, 0, 1, 1,
1.623429, -0.1440063, 1.032372, 1, 0, 0, 1, 1,
1.665365, 2.336144, 0.3664296, 0, 0, 0, 1, 1,
1.666475, -0.7285604, 2.893606, 0, 0, 0, 1, 1,
1.672539, 0.129665, 1.125553, 0, 0, 0, 1, 1,
1.700184, 0.5840535, -0.02674749, 0, 0, 0, 1, 1,
1.705464, 2.426545, -0.6315672, 0, 0, 0, 1, 1,
1.711701, -1.284261, 3.035365, 0, 0, 0, 1, 1,
1.718101, 1.29072, 0.7660256, 0, 0, 0, 1, 1,
1.734067, 1.028897, -0.1321791, 1, 1, 1, 1, 1,
1.734074, -1.03757, 3.456756, 1, 1, 1, 1, 1,
1.735529, 1.955065, -0.3915107, 1, 1, 1, 1, 1,
1.740534, -0.3808047, 0.6032807, 1, 1, 1, 1, 1,
1.74145, 1.353213, 1.01549, 1, 1, 1, 1, 1,
1.744855, -1.202912, 3.143921, 1, 1, 1, 1, 1,
1.768565, 0.2852164, 1.552049, 1, 1, 1, 1, 1,
1.829011, 0.9142132, 1.321404, 1, 1, 1, 1, 1,
1.837405, 0.1546564, 2.049282, 1, 1, 1, 1, 1,
1.845006, 0.9481939, 1.986901, 1, 1, 1, 1, 1,
1.852385, 0.5880724, 0.8917107, 1, 1, 1, 1, 1,
1.86774, 2.014729, 2.279963, 1, 1, 1, 1, 1,
1.875165, -0.5304819, 3.864244, 1, 1, 1, 1, 1,
1.878812, 0.1208708, 0.6795162, 1, 1, 1, 1, 1,
1.886824, -0.6356854, 1.402459, 1, 1, 1, 1, 1,
1.929023, -0.5134995, 2.651686, 0, 0, 1, 1, 1,
1.971276, 0.7269273, 2.88121, 1, 0, 0, 1, 1,
1.97663, 0.1449726, 1.963508, 1, 0, 0, 1, 1,
1.990636, 1.237871, 2.64405, 1, 0, 0, 1, 1,
2.013508, 0.836162, 2.116545, 1, 0, 0, 1, 1,
2.022038, -1.0954, 2.730698, 1, 0, 0, 1, 1,
2.052323, -0.9963915, 2.389096, 0, 0, 0, 1, 1,
2.053449, -0.5631815, 2.457013, 0, 0, 0, 1, 1,
2.074638, 0.2503315, -0.2667317, 0, 0, 0, 1, 1,
2.135236, 3.219783, 0.2543344, 0, 0, 0, 1, 1,
2.295451, -1.741896, 0.8520833, 0, 0, 0, 1, 1,
2.307638, 1.217587, 1.198466, 0, 0, 0, 1, 1,
2.360735, -0.8203036, 2.050537, 0, 0, 0, 1, 1,
2.473853, 0.7603388, 1.409944, 1, 1, 1, 1, 1,
2.617345, 0.2772442, 1.510372, 1, 1, 1, 1, 1,
2.715974, 0.8232492, 1.870436, 1, 1, 1, 1, 1,
2.952472, -0.1575096, 1.817478, 1, 1, 1, 1, 1,
3.024579, -0.4582647, 3.41959, 1, 1, 1, 1, 1,
3.134026, 1.961523, 1.619897, 1, 1, 1, 1, 1,
3.345198, 0.9874829, 1.793136, 1, 1, 1, 1, 1
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
var radius = 10.22094;
var distance = 35.90063;
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
mvMatrix.translate( -0.04943752, 0.06256294, 0.8973489 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.90063);
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
