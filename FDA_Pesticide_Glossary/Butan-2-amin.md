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
-3.236847, 0.8163785, -2.411088, 1, 0, 0, 1,
-3.168307, -0.3993465, 0.3703667, 1, 0.007843138, 0, 1,
-2.859596, -1.876453, -0.7822027, 1, 0.01176471, 0, 1,
-2.770787, -0.5275582, 0.1413125, 1, 0.01960784, 0, 1,
-2.722239, -0.1907528, -1.98569, 1, 0.02352941, 0, 1,
-2.667529, 0.6552007, -3.524021, 1, 0.03137255, 0, 1,
-2.636007, -0.5912023, -0.7116651, 1, 0.03529412, 0, 1,
-2.5374, 1.344103, -1.83519, 1, 0.04313726, 0, 1,
-2.513958, 0.7486813, -0.9187211, 1, 0.04705882, 0, 1,
-2.491515, 0.3459323, -0.7142833, 1, 0.05490196, 0, 1,
-2.367116, 0.372676, -1.306201, 1, 0.05882353, 0, 1,
-2.348325, 1.686592, -1.609596, 1, 0.06666667, 0, 1,
-2.289373, -0.3695427, -2.359352, 1, 0.07058824, 0, 1,
-2.16851, -0.5978913, -2.775809, 1, 0.07843138, 0, 1,
-2.155997, -1.839094, -2.216723, 1, 0.08235294, 0, 1,
-2.146303, 0.7513071, -1.08859, 1, 0.09019608, 0, 1,
-2.127106, -0.5633614, -1.800427, 1, 0.09411765, 0, 1,
-2.108609, 0.5147653, 2.193496, 1, 0.1019608, 0, 1,
-2.099216, -0.3215335, -3.718563, 1, 0.1098039, 0, 1,
-2.098968, -0.5829033, -2.867927, 1, 0.1137255, 0, 1,
-2.085426, 0.6395436, -2.05722, 1, 0.1215686, 0, 1,
-2.039664, -0.1648839, -3.603401, 1, 0.1254902, 0, 1,
-2.037688, 0.947148, -2.889003, 1, 0.1333333, 0, 1,
-2.034305, 2.236396, -0.2581167, 1, 0.1372549, 0, 1,
-2.033916, 0.8344163, -1.616341, 1, 0.145098, 0, 1,
-2.031976, -0.6637368, -1.308233, 1, 0.1490196, 0, 1,
-1.99483, 0.2334644, -1.081782, 1, 0.1568628, 0, 1,
-1.983003, 0.3069036, -1.550141, 1, 0.1607843, 0, 1,
-1.962338, -0.02116525, -1.231206, 1, 0.1686275, 0, 1,
-1.950516, 0.8288129, 0.1306053, 1, 0.172549, 0, 1,
-1.945755, -1.313513, -3.753428, 1, 0.1803922, 0, 1,
-1.925654, 0.3649256, -1.816039, 1, 0.1843137, 0, 1,
-1.898638, -0.06245902, -0.2825027, 1, 0.1921569, 0, 1,
-1.894094, 0.7800094, 0.5620608, 1, 0.1960784, 0, 1,
-1.886113, 0.8100847, -1.45069, 1, 0.2039216, 0, 1,
-1.858287, 1.133806, -2.241063, 1, 0.2117647, 0, 1,
-1.84751, -0.5633795, -2.271046, 1, 0.2156863, 0, 1,
-1.840926, 0.5433941, -1.232396, 1, 0.2235294, 0, 1,
-1.836303, 0.2441179, 0.1390837, 1, 0.227451, 0, 1,
-1.824992, -0.322316, -1.578296, 1, 0.2352941, 0, 1,
-1.8243, -0.293459, -1.065451, 1, 0.2392157, 0, 1,
-1.822059, -1.280296, -2.973802, 1, 0.2470588, 0, 1,
-1.821082, -0.1636615, -0.9561232, 1, 0.2509804, 0, 1,
-1.80988, -1.496712, -2.808108, 1, 0.2588235, 0, 1,
-1.79569, 1.313634, 0.1640799, 1, 0.2627451, 0, 1,
-1.758889, -1.157009, -1.095202, 1, 0.2705882, 0, 1,
-1.757633, 0.04191271, -2.613384, 1, 0.2745098, 0, 1,
-1.740014, 1.598802, -0.7914676, 1, 0.282353, 0, 1,
-1.738061, -0.9306653, -2.791656, 1, 0.2862745, 0, 1,
-1.725055, -0.4816672, -2.428747, 1, 0.2941177, 0, 1,
-1.671408, -0.7052338, -1.570854, 1, 0.3019608, 0, 1,
-1.623958, 0.6018789, -1.704881, 1, 0.3058824, 0, 1,
-1.583912, 1.03103, -1.325706, 1, 0.3137255, 0, 1,
-1.562111, -1.125166, -2.596246, 1, 0.3176471, 0, 1,
-1.552867, -0.8092811, -0.6481754, 1, 0.3254902, 0, 1,
-1.543903, 0.4891724, -1.353747, 1, 0.3294118, 0, 1,
-1.543592, 0.1808368, 0.4153704, 1, 0.3372549, 0, 1,
-1.54162, -0.5449618, -2.087735, 1, 0.3411765, 0, 1,
-1.525568, -0.1050379, -2.518304, 1, 0.3490196, 0, 1,
-1.519192, -0.1349862, -1.14085, 1, 0.3529412, 0, 1,
-1.511896, 0.1772514, -2.058781, 1, 0.3607843, 0, 1,
-1.509002, 0.252593, -0.09254186, 1, 0.3647059, 0, 1,
-1.505619, 0.4723423, -0.9032728, 1, 0.372549, 0, 1,
-1.504076, -1.267053, -3.71214, 1, 0.3764706, 0, 1,
-1.498644, -1.33274, -2.457048, 1, 0.3843137, 0, 1,
-1.494245, -0.64473, -1.483352, 1, 0.3882353, 0, 1,
-1.493557, -0.8036318, -3.026052, 1, 0.3960784, 0, 1,
-1.491457, 1.301596, -0.1439248, 1, 0.4039216, 0, 1,
-1.465069, -1.527601, -4.461132, 1, 0.4078431, 0, 1,
-1.445761, 0.5225374, -1.113106, 1, 0.4156863, 0, 1,
-1.44265, 1.872271, -0.4194514, 1, 0.4196078, 0, 1,
-1.430996, -0.3877311, -2.519164, 1, 0.427451, 0, 1,
-1.42718, 0.5147582, -0.6798996, 1, 0.4313726, 0, 1,
-1.406753, 1.371219, -1.760941, 1, 0.4392157, 0, 1,
-1.40144, 1.565432, -0.8344067, 1, 0.4431373, 0, 1,
-1.40016, -0.2716741, -0.7307171, 1, 0.4509804, 0, 1,
-1.394907, 1.461785, -1.70981, 1, 0.454902, 0, 1,
-1.388622, 0.1398852, -3.50199, 1, 0.4627451, 0, 1,
-1.387583, -1.093938, -2.481597, 1, 0.4666667, 0, 1,
-1.384708, -0.3562505, -2.252428, 1, 0.4745098, 0, 1,
-1.374641, 0.04958716, 0.1632983, 1, 0.4784314, 0, 1,
-1.369022, -0.5439696, -1.553602, 1, 0.4862745, 0, 1,
-1.363372, 2.137265, -0.06744466, 1, 0.4901961, 0, 1,
-1.345502, -1.655914, -2.849062, 1, 0.4980392, 0, 1,
-1.332501, 2.1963, -0.1234528, 1, 0.5058824, 0, 1,
-1.328276, -1.234004, -2.420367, 1, 0.509804, 0, 1,
-1.323006, 0.2175699, -1.101992, 1, 0.5176471, 0, 1,
-1.321841, -0.5342674, -4.156439, 1, 0.5215687, 0, 1,
-1.316662, 0.8441361, 0.8359959, 1, 0.5294118, 0, 1,
-1.298311, 0.7008569, -2.021908, 1, 0.5333334, 0, 1,
-1.284689, 0.2062896, -2.703125, 1, 0.5411765, 0, 1,
-1.280954, 0.7448457, -2.289368, 1, 0.5450981, 0, 1,
-1.278218, 0.7271284, 0.6819507, 1, 0.5529412, 0, 1,
-1.273631, -1.169865, -1.320114, 1, 0.5568628, 0, 1,
-1.273516, -0.7824435, -2.666076, 1, 0.5647059, 0, 1,
-1.261143, 0.7996588, -1.326148, 1, 0.5686275, 0, 1,
-1.253907, 0.7192394, -0.7595546, 1, 0.5764706, 0, 1,
-1.251709, 1.726874, -0.31267, 1, 0.5803922, 0, 1,
-1.23918, 0.1929319, -2.558354, 1, 0.5882353, 0, 1,
-1.238268, -1.07002, -3.345063, 1, 0.5921569, 0, 1,
-1.236391, -0.2907881, -1.681541, 1, 0.6, 0, 1,
-1.236093, -1.267339, -0.7922263, 1, 0.6078432, 0, 1,
-1.234067, -0.2209772, -1.371396, 1, 0.6117647, 0, 1,
-1.22604, -0.5237112, -2.006497, 1, 0.6196079, 0, 1,
-1.221822, -2.098522, -2.027238, 1, 0.6235294, 0, 1,
-1.221149, 0.005055435, -3.20786, 1, 0.6313726, 0, 1,
-1.220274, 0.1762141, -1.676325, 1, 0.6352941, 0, 1,
-1.201614, 1.482133, -0.7909359, 1, 0.6431373, 0, 1,
-1.196094, 0.6855997, 0.4724874, 1, 0.6470588, 0, 1,
-1.195498, 0.1297888, -2.231508, 1, 0.654902, 0, 1,
-1.185822, 0.907164, -0.1234806, 1, 0.6588235, 0, 1,
-1.17764, -0.4939875, -2.715634, 1, 0.6666667, 0, 1,
-1.177526, 0.1311822, -2.556312, 1, 0.6705883, 0, 1,
-1.168546, 0.2308463, -0.9231073, 1, 0.6784314, 0, 1,
-1.165236, 0.925366, -1.491704, 1, 0.682353, 0, 1,
-1.16463, -1.719844, -1.710627, 1, 0.6901961, 0, 1,
-1.162123, -0.1107647, -0.7899659, 1, 0.6941177, 0, 1,
-1.158194, -0.9303776, -2.840365, 1, 0.7019608, 0, 1,
-1.157267, -0.1627195, -2.383036, 1, 0.7098039, 0, 1,
-1.136262, -1.282668, -3.281093, 1, 0.7137255, 0, 1,
-1.132717, 1.735242, 0.388471, 1, 0.7215686, 0, 1,
-1.126916, -0.7333145, -1.416235, 1, 0.7254902, 0, 1,
-1.113881, -0.2539764, -1.981633, 1, 0.7333333, 0, 1,
-1.113114, -1.114561, -1.195517, 1, 0.7372549, 0, 1,
-1.096931, -1.056706, -2.607207, 1, 0.7450981, 0, 1,
-1.084069, -0.8499793, -1.077336, 1, 0.7490196, 0, 1,
-1.082079, -0.6427642, -2.643368, 1, 0.7568628, 0, 1,
-1.070938, -1.539164, -3.545444, 1, 0.7607843, 0, 1,
-1.068907, 1.296665, -1.095758, 1, 0.7686275, 0, 1,
-1.061416, 1.651434, -1.475015, 1, 0.772549, 0, 1,
-1.058183, 0.2293853, -1.986491, 1, 0.7803922, 0, 1,
-1.044353, 0.7271256, -1.980671, 1, 0.7843137, 0, 1,
-1.039247, -0.3252371, -1.512246, 1, 0.7921569, 0, 1,
-1.037444, -1.04435, -0.2715035, 1, 0.7960784, 0, 1,
-1.037067, -0.06200392, -4.300382, 1, 0.8039216, 0, 1,
-1.033544, 0.5920945, -1.898424, 1, 0.8117647, 0, 1,
-1.028253, 1.112365, -0.2184837, 1, 0.8156863, 0, 1,
-1.026611, -0.6351616, -4.548736, 1, 0.8235294, 0, 1,
-1.021772, 0.0692496, -0.9763991, 1, 0.827451, 0, 1,
-1.020179, -1.182285, -1.731237, 1, 0.8352941, 0, 1,
-1.01146, 1.255528, 0.3820336, 1, 0.8392157, 0, 1,
-1.005618, -0.5856508, -2.426311, 1, 0.8470588, 0, 1,
-1.003134, -2.149747, -3.96891, 1, 0.8509804, 0, 1,
-1.003119, 1.838039, -0.4274217, 1, 0.8588235, 0, 1,
-1.002423, 1.25185, -1.332817, 1, 0.8627451, 0, 1,
-0.9955181, -0.07078772, -1.664721, 1, 0.8705882, 0, 1,
-0.9931142, 0.2896255, -2.258578, 1, 0.8745098, 0, 1,
-0.9918689, -0.04789729, -1.177886, 1, 0.8823529, 0, 1,
-0.9912123, -0.3573529, -2.583529, 1, 0.8862745, 0, 1,
-0.9824584, 0.1326815, -4.097313, 1, 0.8941177, 0, 1,
-0.9818888, 0.4367458, -2.357628, 1, 0.8980392, 0, 1,
-0.9793823, -1.068787, -3.02904, 1, 0.9058824, 0, 1,
-0.975185, -1.38785, -2.282171, 1, 0.9137255, 0, 1,
-0.9701404, -0.658235, -1.551107, 1, 0.9176471, 0, 1,
-0.9571282, -0.4949665, -1.463185, 1, 0.9254902, 0, 1,
-0.95475, -0.2125506, -1.196731, 1, 0.9294118, 0, 1,
-0.9506798, -0.002806423, -0.2682042, 1, 0.9372549, 0, 1,
-0.9466993, 0.5626469, -2.771784, 1, 0.9411765, 0, 1,
-0.9421646, 0.7598917, -1.305231, 1, 0.9490196, 0, 1,
-0.9367357, 1.708853, -0.9920731, 1, 0.9529412, 0, 1,
-0.9354929, 0.7723755, -0.6843776, 1, 0.9607843, 0, 1,
-0.9134229, 0.7691275, 0.8422133, 1, 0.9647059, 0, 1,
-0.909647, -0.1076473, -0.163939, 1, 0.972549, 0, 1,
-0.9062387, -1.088489, -3.139805, 1, 0.9764706, 0, 1,
-0.9042649, -1.454058, -2.887352, 1, 0.9843137, 0, 1,
-0.9040037, 0.6539868, -1.892574, 1, 0.9882353, 0, 1,
-0.8999835, 1.979261, -0.5659301, 1, 0.9960784, 0, 1,
-0.8962274, -0.1439082, -3.065227, 0.9960784, 1, 0, 1,
-0.8953503, 0.3952448, -0.1463289, 0.9921569, 1, 0, 1,
-0.8944123, 1.830365, -1.892624, 0.9843137, 1, 0, 1,
-0.8936431, 0.193701, -2.155198, 0.9803922, 1, 0, 1,
-0.892123, 1.147897, -0.2711426, 0.972549, 1, 0, 1,
-0.888333, -1.264781, -3.391166, 0.9686275, 1, 0, 1,
-0.886826, 1.521446, -1.066941, 0.9607843, 1, 0, 1,
-0.885783, -0.9576631, -1.104708, 0.9568627, 1, 0, 1,
-0.8807712, -1.317284, -2.23128, 0.9490196, 1, 0, 1,
-0.8784129, 1.453934, -1.076398, 0.945098, 1, 0, 1,
-0.8779191, -0.1210472, 1.011281, 0.9372549, 1, 0, 1,
-0.8764096, 0.3990216, -1.88209, 0.9333333, 1, 0, 1,
-0.8755761, 0.20249, -0.8849277, 0.9254902, 1, 0, 1,
-0.8753291, 0.2187453, -0.6301153, 0.9215686, 1, 0, 1,
-0.8684611, 0.2482667, -2.748564, 0.9137255, 1, 0, 1,
-0.8563493, 0.7056653, -1.015167, 0.9098039, 1, 0, 1,
-0.8550613, 1.719216, -0.7587794, 0.9019608, 1, 0, 1,
-0.8506526, -0.4694415, -3.883344, 0.8941177, 1, 0, 1,
-0.8498203, 0.5663953, 0.3191614, 0.8901961, 1, 0, 1,
-0.8483143, 1.015854, -0.06807891, 0.8823529, 1, 0, 1,
-0.8468601, 0.1822098, 0.04607413, 0.8784314, 1, 0, 1,
-0.8447319, 0.1388264, -2.268599, 0.8705882, 1, 0, 1,
-0.8396844, 0.0588128, -2.560132, 0.8666667, 1, 0, 1,
-0.8363393, -1.069541, -2.052396, 0.8588235, 1, 0, 1,
-0.8347802, 1.153565, 2.368239, 0.854902, 1, 0, 1,
-0.8327583, 0.7391688, 0.9943962, 0.8470588, 1, 0, 1,
-0.8321264, 0.9566758, -2.852087, 0.8431373, 1, 0, 1,
-0.8261931, -0.6016426, -3.221743, 0.8352941, 1, 0, 1,
-0.8259998, 1.420117, -1.361996, 0.8313726, 1, 0, 1,
-0.8258367, -0.09371273, -1.798458, 0.8235294, 1, 0, 1,
-0.8236433, 2.03392, -1.594907, 0.8196079, 1, 0, 1,
-0.8207753, 0.5133961, -1.493448, 0.8117647, 1, 0, 1,
-0.8201759, 1.51642, 0.2329478, 0.8078431, 1, 0, 1,
-0.8188562, -0.6919486, -4.247703, 0.8, 1, 0, 1,
-0.8143649, -0.5468011, -1.369932, 0.7921569, 1, 0, 1,
-0.8112136, -0.2450905, -1.46429, 0.7882353, 1, 0, 1,
-0.8094676, 0.9380527, -2.11504, 0.7803922, 1, 0, 1,
-0.8092902, -0.2706626, -0.6736826, 0.7764706, 1, 0, 1,
-0.8090427, 1.48026, -1.153012, 0.7686275, 1, 0, 1,
-0.8024694, 1.014474, -1.122605, 0.7647059, 1, 0, 1,
-0.8020958, -1.613503, -2.005632, 0.7568628, 1, 0, 1,
-0.7968193, -0.3887618, -2.794866, 0.7529412, 1, 0, 1,
-0.7857421, 0.4660538, -0.6607139, 0.7450981, 1, 0, 1,
-0.7828388, -0.8538418, -3.353189, 0.7411765, 1, 0, 1,
-0.7794055, 0.1798195, -1.761389, 0.7333333, 1, 0, 1,
-0.7654311, 0.2648862, -2.420317, 0.7294118, 1, 0, 1,
-0.7606601, 1.162629, 1.216153, 0.7215686, 1, 0, 1,
-0.7586243, -0.6303096, -1.962945, 0.7176471, 1, 0, 1,
-0.755567, 2.705675, -0.4005415, 0.7098039, 1, 0, 1,
-0.7516934, -1.056926, -1.395224, 0.7058824, 1, 0, 1,
-0.751577, -0.5923979, -1.56221, 0.6980392, 1, 0, 1,
-0.7508469, 1.151617, -0.1960121, 0.6901961, 1, 0, 1,
-0.7479519, -1.499486, -3.540302, 0.6862745, 1, 0, 1,
-0.7445192, 0.09500784, -1.314123, 0.6784314, 1, 0, 1,
-0.7430084, -0.3347952, -0.4140445, 0.6745098, 1, 0, 1,
-0.7421989, -0.7441223, -4.250428, 0.6666667, 1, 0, 1,
-0.7340657, 0.07455009, 0.6379548, 0.6627451, 1, 0, 1,
-0.7284702, -0.1577236, -2.532629, 0.654902, 1, 0, 1,
-0.7146773, -0.2633016, -1.421974, 0.6509804, 1, 0, 1,
-0.7144364, -0.9900993, -1.688356, 0.6431373, 1, 0, 1,
-0.7083196, -0.1820419, -2.288096, 0.6392157, 1, 0, 1,
-0.7053407, 0.7477016, -0.7388324, 0.6313726, 1, 0, 1,
-0.6971251, -0.3348895, -3.512307, 0.627451, 1, 0, 1,
-0.6934895, -0.6287709, -3.165831, 0.6196079, 1, 0, 1,
-0.6847544, 0.1017133, -2.347097, 0.6156863, 1, 0, 1,
-0.6830702, 0.5262961, -1.804371, 0.6078432, 1, 0, 1,
-0.6801114, 0.5522614, -1.810993, 0.6039216, 1, 0, 1,
-0.669091, 2.404912, -0.5482321, 0.5960785, 1, 0, 1,
-0.6682692, -0.5309773, -2.265369, 0.5882353, 1, 0, 1,
-0.6546172, 1.564498, -0.5838211, 0.5843138, 1, 0, 1,
-0.6522416, -0.7131353, -2.088552, 0.5764706, 1, 0, 1,
-0.6519128, -0.8394051, -3.823821, 0.572549, 1, 0, 1,
-0.6514868, -0.5073318, -2.98475, 0.5647059, 1, 0, 1,
-0.649577, 1.01462, -0.2274271, 0.5607843, 1, 0, 1,
-0.6436411, 0.1166743, -0.5993656, 0.5529412, 1, 0, 1,
-0.6420499, 0.8961125, -0.900771, 0.5490196, 1, 0, 1,
-0.6343019, -0.8798291, -3.722177, 0.5411765, 1, 0, 1,
-0.6334476, -0.7896382, -1.952501, 0.5372549, 1, 0, 1,
-0.6329982, -0.6797115, -3.659603, 0.5294118, 1, 0, 1,
-0.6300815, 1.175922, -1.314127, 0.5254902, 1, 0, 1,
-0.6273304, -0.5409862, -1.318751, 0.5176471, 1, 0, 1,
-0.625394, 0.3166286, -0.4231271, 0.5137255, 1, 0, 1,
-0.6237096, -0.5836948, -3.378663, 0.5058824, 1, 0, 1,
-0.6175669, -1.268131, -2.259199, 0.5019608, 1, 0, 1,
-0.6147252, -0.3690613, -1.282537, 0.4941176, 1, 0, 1,
-0.6136115, -0.1446484, -1.959602, 0.4862745, 1, 0, 1,
-0.6134923, 0.6021438, -0.1574083, 0.4823529, 1, 0, 1,
-0.6122093, 0.7222461, -0.2998286, 0.4745098, 1, 0, 1,
-0.6106687, -0.1438846, -0.4298039, 0.4705882, 1, 0, 1,
-0.6082787, -0.647365, -3.041985, 0.4627451, 1, 0, 1,
-0.6079574, 0.1094491, -2.700737, 0.4588235, 1, 0, 1,
-0.5982733, -1.223528, -3.4019, 0.4509804, 1, 0, 1,
-0.5922154, 1.518814, -0.5495261, 0.4470588, 1, 0, 1,
-0.5912143, 0.9195878, 0.9789802, 0.4392157, 1, 0, 1,
-0.5907004, 1.562172, 0.2066996, 0.4352941, 1, 0, 1,
-0.5894934, 0.6692172, 0.3206515, 0.427451, 1, 0, 1,
-0.5841536, -0.4670781, -1.900894, 0.4235294, 1, 0, 1,
-0.5815281, 1.221257, 0.8229937, 0.4156863, 1, 0, 1,
-0.5808601, -0.8223648, -2.869151, 0.4117647, 1, 0, 1,
-0.577992, 0.09294426, -1.522491, 0.4039216, 1, 0, 1,
-0.5775884, -1.011698, -3.507519, 0.3960784, 1, 0, 1,
-0.577284, -1.140875, -1.447797, 0.3921569, 1, 0, 1,
-0.5737919, -0.8399097, -0.937736, 0.3843137, 1, 0, 1,
-0.569308, 0.04356856, -0.2085361, 0.3803922, 1, 0, 1,
-0.5677364, -0.5230002, -1.714419, 0.372549, 1, 0, 1,
-0.5669013, -1.861776, -2.359961, 0.3686275, 1, 0, 1,
-0.559469, 0.6406166, -1.316096, 0.3607843, 1, 0, 1,
-0.5479457, 1.862292, -0.7701135, 0.3568628, 1, 0, 1,
-0.5412334, -0.8172394, -1.693538, 0.3490196, 1, 0, 1,
-0.5359228, 0.01291527, -2.111233, 0.345098, 1, 0, 1,
-0.5358669, -0.289807, -0.4737155, 0.3372549, 1, 0, 1,
-0.5354608, -0.04686245, -2.423852, 0.3333333, 1, 0, 1,
-0.533681, -0.9478813, -1.813445, 0.3254902, 1, 0, 1,
-0.5243391, 0.7500628, -0.08487061, 0.3215686, 1, 0, 1,
-0.5241561, -0.2601554, -3.908246, 0.3137255, 1, 0, 1,
-0.5203678, 0.1566106, -0.8894891, 0.3098039, 1, 0, 1,
-0.5196404, 0.7486422, 0.4884999, 0.3019608, 1, 0, 1,
-0.518667, 0.8573173, -1.042412, 0.2941177, 1, 0, 1,
-0.5145687, 1.159869, 0.882711, 0.2901961, 1, 0, 1,
-0.5126045, 0.1373132, -3.109867, 0.282353, 1, 0, 1,
-0.5114723, 0.001043643, -1.635574, 0.2784314, 1, 0, 1,
-0.5110606, -0.3858272, -1.530228, 0.2705882, 1, 0, 1,
-0.5101194, -0.1330967, -0.973365, 0.2666667, 1, 0, 1,
-0.5061573, 0.1779408, -1.044407, 0.2588235, 1, 0, 1,
-0.4982882, -0.134694, -2.330813, 0.254902, 1, 0, 1,
-0.496332, -0.9896964, -1.521986, 0.2470588, 1, 0, 1,
-0.4960876, -0.879212, -1.977823, 0.2431373, 1, 0, 1,
-0.495844, -2.039668, -3.285706, 0.2352941, 1, 0, 1,
-0.4920053, -0.3773097, -1.948281, 0.2313726, 1, 0, 1,
-0.4900334, -0.1898365, -1.787069, 0.2235294, 1, 0, 1,
-0.4896159, 1.036344, 0.5607486, 0.2196078, 1, 0, 1,
-0.4887752, 0.9078319, 1.073558, 0.2117647, 1, 0, 1,
-0.4878457, -0.2537672, -2.796192, 0.2078431, 1, 0, 1,
-0.4833329, -0.3162831, -3.145051, 0.2, 1, 0, 1,
-0.4822316, 0.2084113, -0.5255808, 0.1921569, 1, 0, 1,
-0.4817788, -0.1160672, -2.168251, 0.1882353, 1, 0, 1,
-0.4781676, 0.2491252, -1.727516, 0.1803922, 1, 0, 1,
-0.4768421, -0.1121816, -2.810622, 0.1764706, 1, 0, 1,
-0.4730964, -0.3856197, -2.486133, 0.1686275, 1, 0, 1,
-0.4728208, -1.261715, -2.588523, 0.1647059, 1, 0, 1,
-0.4599701, 0.4442404, -1.458337, 0.1568628, 1, 0, 1,
-0.4588189, 0.4282209, -0.04035852, 0.1529412, 1, 0, 1,
-0.4515553, -0.3740674, -3.550033, 0.145098, 1, 0, 1,
-0.4505197, -0.528606, -3.460253, 0.1411765, 1, 0, 1,
-0.4499431, -1.016363, -4.211035, 0.1333333, 1, 0, 1,
-0.4452004, -0.2120329, -1.035675, 0.1294118, 1, 0, 1,
-0.4448636, 1.387268, 0.753058, 0.1215686, 1, 0, 1,
-0.4422547, -0.8184031, -2.869563, 0.1176471, 1, 0, 1,
-0.4390424, -0.2511053, -0.6825635, 0.1098039, 1, 0, 1,
-0.4365962, 1.303765, 0.1798475, 0.1058824, 1, 0, 1,
-0.4237944, 0.1825684, -2.526306, 0.09803922, 1, 0, 1,
-0.4210505, 0.8296313, 1.115187, 0.09019608, 1, 0, 1,
-0.4080593, -0.04979088, -0.4346063, 0.08627451, 1, 0, 1,
-0.4069305, -2.169314, -3.417063, 0.07843138, 1, 0, 1,
-0.4061666, -2.314073, -2.325791, 0.07450981, 1, 0, 1,
-0.4041565, -0.392823, -3.689088, 0.06666667, 1, 0, 1,
-0.402519, 1.341465, -0.8079621, 0.0627451, 1, 0, 1,
-0.3983679, -0.03337343, -2.033715, 0.05490196, 1, 0, 1,
-0.3959902, -1.572047, -2.537091, 0.05098039, 1, 0, 1,
-0.3905964, -1.90342, -2.573871, 0.04313726, 1, 0, 1,
-0.3881654, 0.5891995, -0.953566, 0.03921569, 1, 0, 1,
-0.3852468, 0.8587095, 1.399215, 0.03137255, 1, 0, 1,
-0.3820062, 0.2609559, -1.810696, 0.02745098, 1, 0, 1,
-0.3808421, -0.5804483, -2.55804, 0.01960784, 1, 0, 1,
-0.3785203, 0.8210043, 0.05826569, 0.01568628, 1, 0, 1,
-0.3763659, 0.1698337, -0.7031744, 0.007843138, 1, 0, 1,
-0.3693909, -0.4846243, -4.351651, 0.003921569, 1, 0, 1,
-0.3523215, -1.420504, -5.27594, 0, 1, 0.003921569, 1,
-0.3515282, -1.157583, -0.4166743, 0, 1, 0.01176471, 1,
-0.345452, -0.8754602, -2.298759, 0, 1, 0.01568628, 1,
-0.342519, -0.4494316, -2.161726, 0, 1, 0.02352941, 1,
-0.3419259, -0.3234308, -2.15308, 0, 1, 0.02745098, 1,
-0.34178, 0.6299642, -0.7747262, 0, 1, 0.03529412, 1,
-0.3404506, 1.253735, 0.8455697, 0, 1, 0.03921569, 1,
-0.3393385, -1.543764, -3.709782, 0, 1, 0.04705882, 1,
-0.338248, -0.08811903, -2.366348, 0, 1, 0.05098039, 1,
-0.330743, -1.881096, -1.605723, 0, 1, 0.05882353, 1,
-0.327848, -0.15508, -1.009305, 0, 1, 0.0627451, 1,
-0.323901, -0.7980899, -1.99027, 0, 1, 0.07058824, 1,
-0.3232609, 0.5024633, -0.03824792, 0, 1, 0.07450981, 1,
-0.3229767, 0.9942577, 0.6399605, 0, 1, 0.08235294, 1,
-0.3218636, 0.2422805, -0.9206082, 0, 1, 0.08627451, 1,
-0.3153669, -1.758397, -2.649454, 0, 1, 0.09411765, 1,
-0.3149478, 1.170841, -0.210197, 0, 1, 0.1019608, 1,
-0.3147615, 0.0376399, -1.787882, 0, 1, 0.1058824, 1,
-0.314325, 1.854185, -0.1219212, 0, 1, 0.1137255, 1,
-0.3084798, 0.04714112, -0.9513524, 0, 1, 0.1176471, 1,
-0.3081129, 1.056135, -0.03508797, 0, 1, 0.1254902, 1,
-0.3044036, -1.541545, -2.603233, 0, 1, 0.1294118, 1,
-0.3020745, 1.695833, 0.3674084, 0, 1, 0.1372549, 1,
-0.2937938, -1.048356, -2.0009, 0, 1, 0.1411765, 1,
-0.2927437, 0.3906364, -1.154918, 0, 1, 0.1490196, 1,
-0.2915753, -1.136129, -4.424455, 0, 1, 0.1529412, 1,
-0.2897856, 0.6903852, -1.336433, 0, 1, 0.1607843, 1,
-0.28617, -0.6186866, -3.007451, 0, 1, 0.1647059, 1,
-0.283421, -0.641022, -3.222731, 0, 1, 0.172549, 1,
-0.2765549, 0.7065284, 1.744783, 0, 1, 0.1764706, 1,
-0.2754144, -0.8820166, -3.697462, 0, 1, 0.1843137, 1,
-0.272438, 0.384796, -1.149437, 0, 1, 0.1882353, 1,
-0.2687384, -0.4142964, -2.776604, 0, 1, 0.1960784, 1,
-0.2646383, 0.1552049, -1.273319, 0, 1, 0.2039216, 1,
-0.2645361, 0.01326532, -1.922172, 0, 1, 0.2078431, 1,
-0.2527894, 0.8262048, 0.2243575, 0, 1, 0.2156863, 1,
-0.2522171, -0.5437729, -2.551847, 0, 1, 0.2196078, 1,
-0.2486365, -0.5526956, -3.649732, 0, 1, 0.227451, 1,
-0.2475864, -0.4950637, -3.250468, 0, 1, 0.2313726, 1,
-0.2452266, 0.366018, -0.9901277, 0, 1, 0.2392157, 1,
-0.2408916, -1.006053, -3.286704, 0, 1, 0.2431373, 1,
-0.237601, -1.52099, -4.574526, 0, 1, 0.2509804, 1,
-0.2371213, 2.329701, 0.4949257, 0, 1, 0.254902, 1,
-0.2354266, -0.04815042, -1.742203, 0, 1, 0.2627451, 1,
-0.2333017, -0.216233, -2.450038, 0, 1, 0.2666667, 1,
-0.2296285, -0.4111436, -1.439904, 0, 1, 0.2745098, 1,
-0.22935, 0.07770219, -0.6206704, 0, 1, 0.2784314, 1,
-0.2290675, 0.849722, -0.4032751, 0, 1, 0.2862745, 1,
-0.2286481, -0.05721906, -1.025708, 0, 1, 0.2901961, 1,
-0.2255259, -1.204875, -2.452309, 0, 1, 0.2980392, 1,
-0.223588, 0.282872, -2.080896, 0, 1, 0.3058824, 1,
-0.2187729, 1.231546, -2.875019, 0, 1, 0.3098039, 1,
-0.2141761, -0.2556987, -1.906487, 0, 1, 0.3176471, 1,
-0.2134983, -0.3052388, -1.45784, 0, 1, 0.3215686, 1,
-0.210368, 0.9558473, -0.5982056, 0, 1, 0.3294118, 1,
-0.2091501, -1.267656, -1.425781, 0, 1, 0.3333333, 1,
-0.2035745, 0.7383116, -1.342802, 0, 1, 0.3411765, 1,
-0.2024723, -0.264587, -2.507325, 0, 1, 0.345098, 1,
-0.2016174, 0.9838489, -1.747797, 0, 1, 0.3529412, 1,
-0.196188, 0.7317222, 0.3462143, 0, 1, 0.3568628, 1,
-0.1915949, 0.1531133, -0.3911022, 0, 1, 0.3647059, 1,
-0.1872883, -0.5307672, -3.841194, 0, 1, 0.3686275, 1,
-0.1856569, -1.027189, -2.494714, 0, 1, 0.3764706, 1,
-0.1847277, 0.6829849, -0.3948972, 0, 1, 0.3803922, 1,
-0.1846652, -0.2902413, -1.577219, 0, 1, 0.3882353, 1,
-0.1845024, -0.5183138, -3.910231, 0, 1, 0.3921569, 1,
-0.1842285, -0.9378523, -3.995623, 0, 1, 0.4, 1,
-0.1832616, -1.37737, -2.592185, 0, 1, 0.4078431, 1,
-0.1817255, -0.4773282, -4.060456, 0, 1, 0.4117647, 1,
-0.1810787, 3.493137, -0.9287269, 0, 1, 0.4196078, 1,
-0.1810011, -1.572712, -4.068053, 0, 1, 0.4235294, 1,
-0.179945, -1.667722, -2.471096, 0, 1, 0.4313726, 1,
-0.1781085, 0.3775966, -0.7687397, 0, 1, 0.4352941, 1,
-0.1708525, -1.467156, -4.173841, 0, 1, 0.4431373, 1,
-0.1686835, -0.6606617, -2.091774, 0, 1, 0.4470588, 1,
-0.1661804, -1.52935, -4.589404, 0, 1, 0.454902, 1,
-0.1606406, -0.4868696, -2.113348, 0, 1, 0.4588235, 1,
-0.1549144, -0.1205806, -2.38758, 0, 1, 0.4666667, 1,
-0.1503934, 1.136211, -0.4226447, 0, 1, 0.4705882, 1,
-0.1453437, -0.6526311, -3.616494, 0, 1, 0.4784314, 1,
-0.1451886, 0.2731647, -0.3779385, 0, 1, 0.4823529, 1,
-0.1448552, -0.6291676, -2.714732, 0, 1, 0.4901961, 1,
-0.1420955, 1.334505, -0.09495662, 0, 1, 0.4941176, 1,
-0.1418639, 1.266988, -0.2323619, 0, 1, 0.5019608, 1,
-0.1413609, 1.305214, 0.8364807, 0, 1, 0.509804, 1,
-0.1319503, -1.20657, -1.895068, 0, 1, 0.5137255, 1,
-0.1293148, -0.1203664, -0.9262877, 0, 1, 0.5215687, 1,
-0.1268787, -0.4861386, -3.488464, 0, 1, 0.5254902, 1,
-0.1230746, 1.320233, 0.1243924, 0, 1, 0.5333334, 1,
-0.1221233, 0.6649443, -1.822247, 0, 1, 0.5372549, 1,
-0.1218055, -0.2954141, -2.053958, 0, 1, 0.5450981, 1,
-0.1211018, -0.9673218, -4.791876, 0, 1, 0.5490196, 1,
-0.11684, 0.4529082, 1.32565, 0, 1, 0.5568628, 1,
-0.1091222, -0.8402219, -4.784876, 0, 1, 0.5607843, 1,
-0.1052611, 0.7419388, 0.4978642, 0, 1, 0.5686275, 1,
-0.09629056, -0.490554, -2.008364, 0, 1, 0.572549, 1,
-0.09493498, 1.239432, 1.085082, 0, 1, 0.5803922, 1,
-0.09390738, 1.816024, 0.6957937, 0, 1, 0.5843138, 1,
-0.09129351, -0.6992294, -2.625624, 0, 1, 0.5921569, 1,
-0.0861415, 0.455402, -0.4726947, 0, 1, 0.5960785, 1,
-0.08554037, -0.6269138, -4.048329, 0, 1, 0.6039216, 1,
-0.08116643, -0.997973, -3.261201, 0, 1, 0.6117647, 1,
-0.07943733, 1.064824, -0.2649217, 0, 1, 0.6156863, 1,
-0.07843035, -0.5128534, -2.877556, 0, 1, 0.6235294, 1,
-0.07719272, -0.1684197, -2.63742, 0, 1, 0.627451, 1,
-0.07706998, 0.6762725, 1.740948, 0, 1, 0.6352941, 1,
-0.07676195, -0.8579195, -2.099207, 0, 1, 0.6392157, 1,
-0.0756586, -0.1712683, -2.500422, 0, 1, 0.6470588, 1,
-0.07106796, 0.1208096, -1.199487, 0, 1, 0.6509804, 1,
-0.07007135, -1.685696, -2.224411, 0, 1, 0.6588235, 1,
-0.06882686, 0.9851493, -1.133077, 0, 1, 0.6627451, 1,
-0.06468597, -1.342839, -3.301639, 0, 1, 0.6705883, 1,
-0.05964666, 0.2062105, 0.1414998, 0, 1, 0.6745098, 1,
-0.05909872, 1.370045, -2.640523, 0, 1, 0.682353, 1,
-0.0570512, -0.588976, -4.368684, 0, 1, 0.6862745, 1,
-0.0562631, 0.8830405, -0.6904326, 0, 1, 0.6941177, 1,
-0.05214424, -1.159448, -1.64572, 0, 1, 0.7019608, 1,
-0.04773222, 1.284375, 0.7197583, 0, 1, 0.7058824, 1,
-0.04634831, -0.4113486, -0.8999394, 0, 1, 0.7137255, 1,
-0.04626188, 1.297626, 0.7363124, 0, 1, 0.7176471, 1,
-0.03867301, -1.389228, -3.626847, 0, 1, 0.7254902, 1,
-0.03826718, -0.07693256, -4.207252, 0, 1, 0.7294118, 1,
-0.03811304, 0.2369928, -0.3741372, 0, 1, 0.7372549, 1,
-0.0274484, 0.1753432, 0.6513188, 0, 1, 0.7411765, 1,
-0.02539574, -0.3572527, -3.617293, 0, 1, 0.7490196, 1,
-0.02436797, 0.702095, 0.7059545, 0, 1, 0.7529412, 1,
-0.02186559, -0.408356, -3.010763, 0, 1, 0.7607843, 1,
-0.02151819, 0.8800432, 0.3322589, 0, 1, 0.7647059, 1,
-0.01918856, -0.3040861, -4.037225, 0, 1, 0.772549, 1,
-0.01396657, 2.000151, -0.6702158, 0, 1, 0.7764706, 1,
-0.01173091, 0.7164435, 0.6798838, 0, 1, 0.7843137, 1,
-0.01002314, 1.329379, 1.820842, 0, 1, 0.7882353, 1,
-0.008509098, -1.075344, -3.201714, 0, 1, 0.7960784, 1,
-0.006847976, 1.309112, -0.9376433, 0, 1, 0.8039216, 1,
-0.006357788, 0.5274567, -0.4058414, 0, 1, 0.8078431, 1,
-0.006166584, 1.957677, -1.022556, 0, 1, 0.8156863, 1,
0.000875134, 0.7882728, -1.212231, 0, 1, 0.8196079, 1,
0.008118234, -0.1123443, 2.751918, 0, 1, 0.827451, 1,
0.009328248, 0.1496406, 0.3333691, 0, 1, 0.8313726, 1,
0.01606909, 0.6625516, 0.4372198, 0, 1, 0.8392157, 1,
0.01675612, 1.385354, -1.142457, 0, 1, 0.8431373, 1,
0.01750416, -0.8067589, 4.392311, 0, 1, 0.8509804, 1,
0.017925, -0.2848678, 2.709621, 0, 1, 0.854902, 1,
0.02052862, -0.733291, 2.274866, 0, 1, 0.8627451, 1,
0.02129418, -0.7140816, 1.376958, 0, 1, 0.8666667, 1,
0.02392616, -0.05917976, 3.208673, 0, 1, 0.8745098, 1,
0.02664433, 0.3630973, -0.9920663, 0, 1, 0.8784314, 1,
0.0284192, 1.700574, 0.8206753, 0, 1, 0.8862745, 1,
0.02922334, -0.1396771, 2.656616, 0, 1, 0.8901961, 1,
0.03010693, -1.707071, 3.095258, 0, 1, 0.8980392, 1,
0.03122379, 1.244221, 1.325161, 0, 1, 0.9058824, 1,
0.03177257, 0.1190396, -0.2119712, 0, 1, 0.9098039, 1,
0.03273526, -0.1240759, 2.349923, 0, 1, 0.9176471, 1,
0.04398563, 0.2522376, -0.9512266, 0, 1, 0.9215686, 1,
0.04525208, -1.468676, 1.45101, 0, 1, 0.9294118, 1,
0.05066367, -1.284005, 1.608589, 0, 1, 0.9333333, 1,
0.0511481, 1.418225, -1.531245, 0, 1, 0.9411765, 1,
0.05665928, 0.2350489, 1.025824, 0, 1, 0.945098, 1,
0.05865169, 1.043549, -1.317197, 0, 1, 0.9529412, 1,
0.05902756, -0.4203337, 2.96231, 0, 1, 0.9568627, 1,
0.06468111, 0.1190401, 0.1625891, 0, 1, 0.9647059, 1,
0.07179986, 1.17347, 0.3540605, 0, 1, 0.9686275, 1,
0.07565647, -1.602666, 3.349524, 0, 1, 0.9764706, 1,
0.07584309, 0.01414272, 0.04425596, 0, 1, 0.9803922, 1,
0.07648311, -1.090727, 4.132179, 0, 1, 0.9882353, 1,
0.07985631, 1.720882, -0.4830945, 0, 1, 0.9921569, 1,
0.08472408, -0.1489259, 4.762094, 0, 1, 1, 1,
0.08606692, -0.1914257, 2.265203, 0, 0.9921569, 1, 1,
0.08777677, 1.44524, -0.4186337, 0, 0.9882353, 1, 1,
0.0892062, 0.442071, 0.2741204, 0, 0.9803922, 1, 1,
0.09497233, 0.0632442, 0.9598771, 0, 0.9764706, 1, 1,
0.09570448, -1.740632, 3.337884, 0, 0.9686275, 1, 1,
0.09724135, -0.8985787, 3.126168, 0, 0.9647059, 1, 1,
0.1033445, -1.293807, 1.491277, 0, 0.9568627, 1, 1,
0.1058674, 0.6072279, -0.9975182, 0, 0.9529412, 1, 1,
0.1105084, 0.4085444, 0.5364262, 0, 0.945098, 1, 1,
0.1108372, 0.4532555, 1.743034, 0, 0.9411765, 1, 1,
0.1174059, 1.097046, 0.1464502, 0, 0.9333333, 1, 1,
0.1209159, 2.076641, 0.31006, 0, 0.9294118, 1, 1,
0.1267356, -1.048601, 1.759805, 0, 0.9215686, 1, 1,
0.1281841, -1.311663, 3.279845, 0, 0.9176471, 1, 1,
0.1303138, -0.2336363, 3.967475, 0, 0.9098039, 1, 1,
0.1319228, 0.4967299, -1.031077, 0, 0.9058824, 1, 1,
0.1449761, 0.2481307, 0.6682863, 0, 0.8980392, 1, 1,
0.1452409, 0.6281341, 1.461163, 0, 0.8901961, 1, 1,
0.1454685, -0.89815, 2.899532, 0, 0.8862745, 1, 1,
0.1480329, 1.423746, 0.6780697, 0, 0.8784314, 1, 1,
0.1499446, -0.5637981, 4.369172, 0, 0.8745098, 1, 1,
0.1501661, 0.07517336, 3.200058, 0, 0.8666667, 1, 1,
0.1535434, 2.112611, -0.1007509, 0, 0.8627451, 1, 1,
0.1546097, -0.2140452, 1.227497, 0, 0.854902, 1, 1,
0.1547066, -0.7865915, 4.452086, 0, 0.8509804, 1, 1,
0.1565124, 0.2316706, 1.76688, 0, 0.8431373, 1, 1,
0.1567587, 0.9325302, -0.8161188, 0, 0.8392157, 1, 1,
0.1678164, -0.3098703, 2.465025, 0, 0.8313726, 1, 1,
0.1682893, 0.7149025, 0.764459, 0, 0.827451, 1, 1,
0.1715195, -1.311752, 5.048432, 0, 0.8196079, 1, 1,
0.1751509, 0.02854348, 0.7732671, 0, 0.8156863, 1, 1,
0.1799074, -0.3799819, 2.624394, 0, 0.8078431, 1, 1,
0.18113, -1.606986, 2.805342, 0, 0.8039216, 1, 1,
0.1814977, -0.3472019, 1.580555, 0, 0.7960784, 1, 1,
0.1832968, -0.4606192, 4.072552, 0, 0.7882353, 1, 1,
0.1926425, 0.5450323, -0.4558766, 0, 0.7843137, 1, 1,
0.1954083, -1.568998, 1.434932, 0, 0.7764706, 1, 1,
0.196482, 0.9539854, -0.1714622, 0, 0.772549, 1, 1,
0.1966334, -1.281331, 3.244465, 0, 0.7647059, 1, 1,
0.1991347, -1.53595, 2.472059, 0, 0.7607843, 1, 1,
0.2026433, 1.128526, -0.7143751, 0, 0.7529412, 1, 1,
0.2061577, 1.091238, 0.9972363, 0, 0.7490196, 1, 1,
0.2069222, -0.1566302, 1.935363, 0, 0.7411765, 1, 1,
0.2085279, -0.1288225, 0.8935771, 0, 0.7372549, 1, 1,
0.2127173, 0.6788827, -0.7920144, 0, 0.7294118, 1, 1,
0.2144137, 1.459676, 2.205268, 0, 0.7254902, 1, 1,
0.2187019, -0.3401527, 2.823261, 0, 0.7176471, 1, 1,
0.2218814, 0.2903694, 0.2718576, 0, 0.7137255, 1, 1,
0.2249887, -0.5675114, 2.69584, 0, 0.7058824, 1, 1,
0.2265053, -1.56375, 3.749201, 0, 0.6980392, 1, 1,
0.227042, -0.4578238, 2.167487, 0, 0.6941177, 1, 1,
0.2282511, -1.287341, 4.300934, 0, 0.6862745, 1, 1,
0.2326653, -0.7438133, 0.74856, 0, 0.682353, 1, 1,
0.2330395, -0.2543046, 2.628804, 0, 0.6745098, 1, 1,
0.2333657, -2.004275, 2.50576, 0, 0.6705883, 1, 1,
0.2456307, -0.03802903, 1.386763, 0, 0.6627451, 1, 1,
0.2458702, -1.437897, 2.97717, 0, 0.6588235, 1, 1,
0.2507084, 0.2305095, -1.824955, 0, 0.6509804, 1, 1,
0.2511451, -2.047164, 2.587228, 0, 0.6470588, 1, 1,
0.2519005, 0.08511358, 1.83701, 0, 0.6392157, 1, 1,
0.2542613, -0.3187172, 3.016579, 0, 0.6352941, 1, 1,
0.2616735, 1.844496, -1.068469, 0, 0.627451, 1, 1,
0.2626164, 0.9641475, -1.068581, 0, 0.6235294, 1, 1,
0.2674787, 0.3609889, 0.09259737, 0, 0.6156863, 1, 1,
0.2722021, 0.223679, -0.2758119, 0, 0.6117647, 1, 1,
0.2737639, -1.447341, 4.080815, 0, 0.6039216, 1, 1,
0.2829767, -0.5512048, 2.199067, 0, 0.5960785, 1, 1,
0.2835418, -0.4969116, 1.983399, 0, 0.5921569, 1, 1,
0.2908723, -1.194931, 3.282716, 0, 0.5843138, 1, 1,
0.3005874, -1.374612, 2.572538, 0, 0.5803922, 1, 1,
0.3100404, -0.6395376, 2.630194, 0, 0.572549, 1, 1,
0.3210261, -0.8876123, 2.030766, 0, 0.5686275, 1, 1,
0.3229574, -0.4208012, 2.169225, 0, 0.5607843, 1, 1,
0.323679, 0.7588862, 0.2083318, 0, 0.5568628, 1, 1,
0.3305384, -0.1296099, 0.6797777, 0, 0.5490196, 1, 1,
0.3306888, 0.482646, -1.045279, 0, 0.5450981, 1, 1,
0.3315848, -2.102602, 3.375254, 0, 0.5372549, 1, 1,
0.3336022, -1.200529, 1.501263, 0, 0.5333334, 1, 1,
0.3357365, -1.521911, 1.984897, 0, 0.5254902, 1, 1,
0.3364818, -0.4163201, 0.3817042, 0, 0.5215687, 1, 1,
0.3419439, -1.578876, 4.46437, 0, 0.5137255, 1, 1,
0.3420902, -0.3985444, 1.865069, 0, 0.509804, 1, 1,
0.3443972, -2.154686, 1.495675, 0, 0.5019608, 1, 1,
0.3459417, 0.1032278, 0.305476, 0, 0.4941176, 1, 1,
0.3463019, 0.05961636, 2.168615, 0, 0.4901961, 1, 1,
0.3475124, -0.5031125, 1.329764, 0, 0.4823529, 1, 1,
0.3512159, -0.05471808, 1.798222, 0, 0.4784314, 1, 1,
0.3533952, -0.1533384, 2.809645, 0, 0.4705882, 1, 1,
0.3557324, 1.258237, 1.261071, 0, 0.4666667, 1, 1,
0.3601743, 1.735499, 0.2184769, 0, 0.4588235, 1, 1,
0.3609008, 0.05889269, 1.194154, 0, 0.454902, 1, 1,
0.3617612, 0.9650321, 0.5794151, 0, 0.4470588, 1, 1,
0.3620321, -0.8973204, 2.338934, 0, 0.4431373, 1, 1,
0.3670419, 2.198053, -0.9537157, 0, 0.4352941, 1, 1,
0.372682, -1.03871, 1.500734, 0, 0.4313726, 1, 1,
0.3743771, 1.827655, -0.4677733, 0, 0.4235294, 1, 1,
0.3785742, 0.5948783, 0.3186826, 0, 0.4196078, 1, 1,
0.3842879, -0.1794816, 2.495598, 0, 0.4117647, 1, 1,
0.3880138, -0.5545778, 2.754516, 0, 0.4078431, 1, 1,
0.3897211, -0.9641851, 2.39552, 0, 0.4, 1, 1,
0.3904116, 1.401908, -0.6357805, 0, 0.3921569, 1, 1,
0.3909968, -1.258277, 3.557088, 0, 0.3882353, 1, 1,
0.3913264, 0.7532324, -0.01155, 0, 0.3803922, 1, 1,
0.3930747, -2.315943, 3.581856, 0, 0.3764706, 1, 1,
0.4011611, 2.086538, 2.778285, 0, 0.3686275, 1, 1,
0.4078708, 1.321385, -0.09567932, 0, 0.3647059, 1, 1,
0.4090575, -1.242107, 3.912661, 0, 0.3568628, 1, 1,
0.4128343, -0.8392069, 1.468813, 0, 0.3529412, 1, 1,
0.4132214, 0.8166047, 1.115867, 0, 0.345098, 1, 1,
0.4212504, -0.7928614, 4.890422, 0, 0.3411765, 1, 1,
0.4217876, -0.5516335, 3.549424, 0, 0.3333333, 1, 1,
0.4279858, 0.2724873, 1.350049, 0, 0.3294118, 1, 1,
0.4287587, -1.150492, 3.894493, 0, 0.3215686, 1, 1,
0.4331841, -1.29455, 2.974982, 0, 0.3176471, 1, 1,
0.4335094, -0.1499635, 0.6775706, 0, 0.3098039, 1, 1,
0.4358098, 0.2214248, 1.967483, 0, 0.3058824, 1, 1,
0.4378253, 0.06146444, 0.4031916, 0, 0.2980392, 1, 1,
0.4405487, -0.7516827, 5.199907, 0, 0.2901961, 1, 1,
0.4445093, 0.2209074, 0.5251955, 0, 0.2862745, 1, 1,
0.4474406, -0.2741394, 1.873817, 0, 0.2784314, 1, 1,
0.4479388, -0.6506463, 0.2781332, 0, 0.2745098, 1, 1,
0.4482861, -0.6265898, 1.926232, 0, 0.2666667, 1, 1,
0.4520382, -0.09375338, 1.963178, 0, 0.2627451, 1, 1,
0.4522845, -1.035556, 2.193775, 0, 0.254902, 1, 1,
0.4570115, -0.1456853, 2.638478, 0, 0.2509804, 1, 1,
0.4611484, -0.8063447, 3.691711, 0, 0.2431373, 1, 1,
0.4628434, -0.1880996, 2.316346, 0, 0.2392157, 1, 1,
0.4635232, -1.860213, 3.57787, 0, 0.2313726, 1, 1,
0.4659254, -1.365006, 2.365735, 0, 0.227451, 1, 1,
0.4666767, 0.2501667, 0.8985836, 0, 0.2196078, 1, 1,
0.4698361, 1.211894, -2.3569, 0, 0.2156863, 1, 1,
0.4714521, 1.806981, 0.2794461, 0, 0.2078431, 1, 1,
0.4731506, -0.3836495, 2.028419, 0, 0.2039216, 1, 1,
0.4745453, -0.7412463, 1.954855, 0, 0.1960784, 1, 1,
0.4766093, 0.710995, 0.8355458, 0, 0.1882353, 1, 1,
0.481024, -0.01233571, 2.498005, 0, 0.1843137, 1, 1,
0.4887012, 0.6602914, -0.03182993, 0, 0.1764706, 1, 1,
0.4913841, 0.5118315, 0.1055609, 0, 0.172549, 1, 1,
0.4969586, -1.2152, 2.68358, 0, 0.1647059, 1, 1,
0.497256, -0.02755746, 0.3934447, 0, 0.1607843, 1, 1,
0.4998688, 0.401753, 1.253517, 0, 0.1529412, 1, 1,
0.5012025, -0.01684974, 1.115234, 0, 0.1490196, 1, 1,
0.5014966, 0.1478134, 1.136333, 0, 0.1411765, 1, 1,
0.5057904, 1.044375, 2.075994, 0, 0.1372549, 1, 1,
0.5062464, -1.132312, 2.63235, 0, 0.1294118, 1, 1,
0.5069834, 0.3265615, 1.10076, 0, 0.1254902, 1, 1,
0.5172271, -0.1033272, 2.511828, 0, 0.1176471, 1, 1,
0.5184287, -0.3885683, 5.208506, 0, 0.1137255, 1, 1,
0.519436, -0.8685308, 3.324749, 0, 0.1058824, 1, 1,
0.5203551, -0.7567434, 1.622222, 0, 0.09803922, 1, 1,
0.5206297, 1.558361, 1.647143, 0, 0.09411765, 1, 1,
0.5214319, -0.2884899, 2.661602, 0, 0.08627451, 1, 1,
0.5264376, -0.1519075, -0.4223289, 0, 0.08235294, 1, 1,
0.5376697, 1.439501, 0.5403494, 0, 0.07450981, 1, 1,
0.5470638, 0.6463593, 0.6557649, 0, 0.07058824, 1, 1,
0.5482282, -0.2936562, 1.212847, 0, 0.0627451, 1, 1,
0.5522969, -0.6384992, 3.139296, 0, 0.05882353, 1, 1,
0.5547879, -1.603748, 2.674937, 0, 0.05098039, 1, 1,
0.5589274, 1.122807, -1.672566, 0, 0.04705882, 1, 1,
0.567196, -0.1378935, 1.558119, 0, 0.03921569, 1, 1,
0.5677103, -0.5298846, 3.660866, 0, 0.03529412, 1, 1,
0.5839757, 0.01767623, 1.041129, 0, 0.02745098, 1, 1,
0.5845277, 1.805096, 0.1107879, 0, 0.02352941, 1, 1,
0.5935634, 0.3369427, 2.414521, 0, 0.01568628, 1, 1,
0.5963417, -0.4788703, 2.12935, 0, 0.01176471, 1, 1,
0.5971605, -0.2585036, 0.9877885, 0, 0.003921569, 1, 1,
0.601314, 0.6487668, 0.3894889, 0.003921569, 0, 1, 1,
0.6013222, -0.6999876, 4.030623, 0.007843138, 0, 1, 1,
0.6016092, 1.463702, -0.5508832, 0.01568628, 0, 1, 1,
0.6137117, -0.08407925, 1.170478, 0.01960784, 0, 1, 1,
0.6164894, -0.4192645, 2.536632, 0.02745098, 0, 1, 1,
0.6208075, -0.05133934, 2.85743, 0.03137255, 0, 1, 1,
0.6243365, 1.161758, 1.427816, 0.03921569, 0, 1, 1,
0.6246318, -0.1532946, -0.2951716, 0.04313726, 0, 1, 1,
0.6263604, -0.6423842, 3.753539, 0.05098039, 0, 1, 1,
0.6351779, -0.3544364, 3.603361, 0.05490196, 0, 1, 1,
0.6374937, -1.243843, 3.150233, 0.0627451, 0, 1, 1,
0.6406918, 0.08612157, 2.434844, 0.06666667, 0, 1, 1,
0.6430866, 0.5293534, 0.2998443, 0.07450981, 0, 1, 1,
0.6459183, 0.2858628, 0.2897412, 0.07843138, 0, 1, 1,
0.6494141, 0.8647597, 0.7465935, 0.08627451, 0, 1, 1,
0.6546619, -1.338703, 2.573988, 0.09019608, 0, 1, 1,
0.6588916, -0.1487177, 0.9467126, 0.09803922, 0, 1, 1,
0.6590143, 0.2476803, 0.3876885, 0.1058824, 0, 1, 1,
0.6618248, 0.6526791, 1.378901, 0.1098039, 0, 1, 1,
0.6644523, -1.253622, 1.6139, 0.1176471, 0, 1, 1,
0.6664645, 0.8597652, 0.05041819, 0.1215686, 0, 1, 1,
0.6668903, -0.300698, 3.721148, 0.1294118, 0, 1, 1,
0.6687785, 0.05733106, 1.547259, 0.1333333, 0, 1, 1,
0.6689343, 0.6902394, 2.252853, 0.1411765, 0, 1, 1,
0.6699407, -1.188451, 2.058624, 0.145098, 0, 1, 1,
0.6703041, -0.4628685, 1.275953, 0.1529412, 0, 1, 1,
0.6742514, -0.9490449, 0.637449, 0.1568628, 0, 1, 1,
0.6798901, 1.168572, -0.5581927, 0.1647059, 0, 1, 1,
0.6804118, 0.6439099, 0.4083856, 0.1686275, 0, 1, 1,
0.6810864, 0.09119505, 1.509618, 0.1764706, 0, 1, 1,
0.6816533, 2.278574, 0.2984703, 0.1803922, 0, 1, 1,
0.6826271, 1.250958, 1.564332, 0.1882353, 0, 1, 1,
0.6830742, 0.2627047, 1.00158, 0.1921569, 0, 1, 1,
0.6837867, 0.9671718, 0.4495268, 0.2, 0, 1, 1,
0.6857627, 1.444391, 1.569218, 0.2078431, 0, 1, 1,
0.6882024, 2.006256, -1.395744, 0.2117647, 0, 1, 1,
0.6898507, 1.246404, 0.1838396, 0.2196078, 0, 1, 1,
0.6904134, 1.66272, 0.4581616, 0.2235294, 0, 1, 1,
0.6955822, -0.08959568, 0.8104469, 0.2313726, 0, 1, 1,
0.6979312, 1.036128, -0.07038881, 0.2352941, 0, 1, 1,
0.6984795, -0.6044101, 1.396585, 0.2431373, 0, 1, 1,
0.6988376, -0.7065656, 3.411124, 0.2470588, 0, 1, 1,
0.7017553, 1.228246, 0.4323807, 0.254902, 0, 1, 1,
0.7083697, -1.341483, 3.107122, 0.2588235, 0, 1, 1,
0.7111216, -0.5325301, 3.431181, 0.2666667, 0, 1, 1,
0.7138259, -0.3166349, 1.754785, 0.2705882, 0, 1, 1,
0.7142982, -0.08987589, 2.704324, 0.2784314, 0, 1, 1,
0.7159103, -0.882811, 2.798792, 0.282353, 0, 1, 1,
0.7189808, -0.2246665, 2.20185, 0.2901961, 0, 1, 1,
0.7205316, 1.083786, -0.5770573, 0.2941177, 0, 1, 1,
0.7224823, 0.704653, 0.5726483, 0.3019608, 0, 1, 1,
0.7243662, -1.729471, 2.802753, 0.3098039, 0, 1, 1,
0.7258432, -0.6836229, 2.42226, 0.3137255, 0, 1, 1,
0.7303697, -1.443303, 2.762144, 0.3215686, 0, 1, 1,
0.7329535, -1.778385, 2.520449, 0.3254902, 0, 1, 1,
0.7331111, -0.7029179, 1.885739, 0.3333333, 0, 1, 1,
0.7345303, -1.026582, 2.95538, 0.3372549, 0, 1, 1,
0.7399954, 1.477179, 1.279354, 0.345098, 0, 1, 1,
0.7418322, -1.719943, 2.3246, 0.3490196, 0, 1, 1,
0.7438323, 0.3953307, 1.023762, 0.3568628, 0, 1, 1,
0.7450919, 0.2168474, 1.283143, 0.3607843, 0, 1, 1,
0.7474227, 1.37725, 0.3140711, 0.3686275, 0, 1, 1,
0.7511851, 1.474692, 0.7609835, 0.372549, 0, 1, 1,
0.7594066, 0.2666167, 0.1332697, 0.3803922, 0, 1, 1,
0.7610257, 1.716358, 1.774314, 0.3843137, 0, 1, 1,
0.7629873, 0.5636725, 0.4775322, 0.3921569, 0, 1, 1,
0.7647101, -0.3948812, 1.675799, 0.3960784, 0, 1, 1,
0.7647241, 0.3064265, 1.112084, 0.4039216, 0, 1, 1,
0.764905, 2.089603, 1.180347, 0.4117647, 0, 1, 1,
0.7667001, -1.66836, 2.513887, 0.4156863, 0, 1, 1,
0.7669998, 0.07450716, 0.661656, 0.4235294, 0, 1, 1,
0.7674681, 1.223075, -0.7228866, 0.427451, 0, 1, 1,
0.7721207, 1.072854, 0.3924221, 0.4352941, 0, 1, 1,
0.7733211, 1.770862, 1.689132, 0.4392157, 0, 1, 1,
0.7735361, -0.3552306, 0.9359649, 0.4470588, 0, 1, 1,
0.7744091, -0.09273735, 0.9479017, 0.4509804, 0, 1, 1,
0.774889, 0.5652403, 2.3961, 0.4588235, 0, 1, 1,
0.7765443, -0.4452494, 1.415013, 0.4627451, 0, 1, 1,
0.7782806, -0.4933591, 0.5681418, 0.4705882, 0, 1, 1,
0.7803527, 0.4413964, 0.8888742, 0.4745098, 0, 1, 1,
0.7809044, -0.1170811, 1.763736, 0.4823529, 0, 1, 1,
0.7825761, -0.2030776, 0.9656156, 0.4862745, 0, 1, 1,
0.7863556, 2.174825, -0.3466517, 0.4941176, 0, 1, 1,
0.789749, 0.4035147, 0.1687031, 0.5019608, 0, 1, 1,
0.7906417, -0.7913987, 1.713632, 0.5058824, 0, 1, 1,
0.7918066, 2.650628, 0.06506479, 0.5137255, 0, 1, 1,
0.7946676, -0.1302316, 2.171376, 0.5176471, 0, 1, 1,
0.7984965, 1.343176, 3.653495, 0.5254902, 0, 1, 1,
0.8007662, -0.4195861, 3.292678, 0.5294118, 0, 1, 1,
0.8012818, 0.1238752, 0.04275483, 0.5372549, 0, 1, 1,
0.8039014, 0.9572625, 1.537861, 0.5411765, 0, 1, 1,
0.8049798, -1.770572, 3.315877, 0.5490196, 0, 1, 1,
0.8079519, 0.3565379, 1.534915, 0.5529412, 0, 1, 1,
0.8121465, -0.1519997, 2.483276, 0.5607843, 0, 1, 1,
0.8128163, 0.8546146, 2.492028, 0.5647059, 0, 1, 1,
0.8166934, -0.6961507, 1.850533, 0.572549, 0, 1, 1,
0.8212609, -0.5716567, 2.300206, 0.5764706, 0, 1, 1,
0.8311967, -0.1669778, 1.847694, 0.5843138, 0, 1, 1,
0.8321986, 0.2156825, 1.378818, 0.5882353, 0, 1, 1,
0.8335128, 0.4023133, 0.4694117, 0.5960785, 0, 1, 1,
0.8361998, 0.1042377, 0.4269126, 0.6039216, 0, 1, 1,
0.8378555, -0.06592089, 1.486436, 0.6078432, 0, 1, 1,
0.8416682, 0.08717981, 0.7635823, 0.6156863, 0, 1, 1,
0.8429908, -0.1162159, 1.244171, 0.6196079, 0, 1, 1,
0.8442678, 0.775225, 0.3861608, 0.627451, 0, 1, 1,
0.8448902, -0.6518857, 2.614023, 0.6313726, 0, 1, 1,
0.8537002, 0.159927, 2.984201, 0.6392157, 0, 1, 1,
0.8627254, -0.5768406, 0.9214846, 0.6431373, 0, 1, 1,
0.8651649, 0.4012884, 0.5918893, 0.6509804, 0, 1, 1,
0.8668993, 0.1647098, 0.6310444, 0.654902, 0, 1, 1,
0.8794796, -1.113036, 2.738683, 0.6627451, 0, 1, 1,
0.879719, 0.6346529, 0.4554572, 0.6666667, 0, 1, 1,
0.8800766, -2.255999, 3.815284, 0.6745098, 0, 1, 1,
0.8816216, 0.08750591, 3.305417, 0.6784314, 0, 1, 1,
0.8826646, -0.2750204, 1.749218, 0.6862745, 0, 1, 1,
0.8861905, -0.5262207, 3.365717, 0.6901961, 0, 1, 1,
0.8871639, -1.804497, 2.205275, 0.6980392, 0, 1, 1,
0.8903968, -1.564102, 3.136059, 0.7058824, 0, 1, 1,
0.8904355, -0.5861825, 0.9290291, 0.7098039, 0, 1, 1,
0.8950301, -0.6664309, 3.374324, 0.7176471, 0, 1, 1,
0.8951403, 0.9835858, 0.8726595, 0.7215686, 0, 1, 1,
0.898815, 0.8168574, -0.2520742, 0.7294118, 0, 1, 1,
0.9048109, -0.1018553, 1.541551, 0.7333333, 0, 1, 1,
0.9069777, 0.11615, 1.709175, 0.7411765, 0, 1, 1,
0.911207, -1.490492, 4.000272, 0.7450981, 0, 1, 1,
0.9136358, -1.252621, 4.539512, 0.7529412, 0, 1, 1,
0.9150366, 1.126819, 1.979553, 0.7568628, 0, 1, 1,
0.9194069, -0.2968547, 2.284647, 0.7647059, 0, 1, 1,
0.9243808, 0.0009896918, 1.717891, 0.7686275, 0, 1, 1,
0.9255034, 1.457347, 0.9028176, 0.7764706, 0, 1, 1,
0.9361517, -1.720873, 3.585388, 0.7803922, 0, 1, 1,
0.9383294, -2.312454, 2.036367, 0.7882353, 0, 1, 1,
0.9475889, -1.457292, 2.72651, 0.7921569, 0, 1, 1,
0.9480608, 0.2677389, 1.826221, 0.8, 0, 1, 1,
0.9489922, 1.080688, 0.605059, 0.8078431, 0, 1, 1,
0.9560778, 1.022148, 1.670036, 0.8117647, 0, 1, 1,
0.9614391, 0.1100025, 2.303736, 0.8196079, 0, 1, 1,
0.9617267, 1.406329, 0.9993628, 0.8235294, 0, 1, 1,
0.962359, 0.8224159, 0.9782004, 0.8313726, 0, 1, 1,
0.9634168, -1.327004, 2.809183, 0.8352941, 0, 1, 1,
0.9640086, 0.6652098, 1.5598, 0.8431373, 0, 1, 1,
0.9665652, -0.3737348, 2.246146, 0.8470588, 0, 1, 1,
0.9728554, 0.320408, -0.415236, 0.854902, 0, 1, 1,
0.9737384, -1.248312, 3.206445, 0.8588235, 0, 1, 1,
0.9761451, 0.1489034, 0.4908121, 0.8666667, 0, 1, 1,
0.9840977, 0.5715704, 0.2644806, 0.8705882, 0, 1, 1,
0.9869401, 1.592205, 0.5691671, 0.8784314, 0, 1, 1,
0.9877877, -0.07276146, 0.3946116, 0.8823529, 0, 1, 1,
0.9928888, 0.148465, 0.8841664, 0.8901961, 0, 1, 1,
1.00308, -0.01314457, 0.6455881, 0.8941177, 0, 1, 1,
1.00387, 3.254495, 0.3195811, 0.9019608, 0, 1, 1,
1.00533, -0.7382995, 1.692232, 0.9098039, 0, 1, 1,
1.006519, -0.2601012, 1.942088, 0.9137255, 0, 1, 1,
1.008154, -2.64009, 1.296171, 0.9215686, 0, 1, 1,
1.012368, 0.3512729, 2.809062, 0.9254902, 0, 1, 1,
1.015027, -0.81374, 2.03418, 0.9333333, 0, 1, 1,
1.022683, 0.2531944, 1.978959, 0.9372549, 0, 1, 1,
1.023077, 0.3397085, 2.902798, 0.945098, 0, 1, 1,
1.025276, 0.1851041, 3.320911, 0.9490196, 0, 1, 1,
1.025657, -0.3235383, 1.39476, 0.9568627, 0, 1, 1,
1.03168, -0.1488537, 3.685804, 0.9607843, 0, 1, 1,
1.032473, 0.2586527, 2.351287, 0.9686275, 0, 1, 1,
1.034344, 0.817549, -0.05845321, 0.972549, 0, 1, 1,
1.038889, 0.9368851, 0.6771426, 0.9803922, 0, 1, 1,
1.039454, -0.6408186, 2.72213, 0.9843137, 0, 1, 1,
1.043641, -0.210084, 1.672944, 0.9921569, 0, 1, 1,
1.048211, 1.589332, 1.20587, 0.9960784, 0, 1, 1,
1.048995, -0.338781, 3.279238, 1, 0, 0.9960784, 1,
1.053503, -0.8747285, 1.899358, 1, 0, 0.9882353, 1,
1.055221, -0.7501123, 2.797092, 1, 0, 0.9843137, 1,
1.060404, 0.7046586, 0.1690529, 1, 0, 0.9764706, 1,
1.068304, -0.1398558, 0.753383, 1, 0, 0.972549, 1,
1.075639, -0.9694421, 1.479724, 1, 0, 0.9647059, 1,
1.075997, -1.568693, 1.782539, 1, 0, 0.9607843, 1,
1.07884, 0.3476966, 1.517528, 1, 0, 0.9529412, 1,
1.082547, -0.3887986, 1.225479, 1, 0, 0.9490196, 1,
1.086278, -0.08297653, 2.996868, 1, 0, 0.9411765, 1,
1.098166, 0.843749, 0.9583994, 1, 0, 0.9372549, 1,
1.104853, 0.9359906, 0.9949206, 1, 0, 0.9294118, 1,
1.106393, -0.2797897, 2.555561, 1, 0, 0.9254902, 1,
1.109365, 1.298833, -1.070269, 1, 0, 0.9176471, 1,
1.115752, -0.9759625, 1.866808, 1, 0, 0.9137255, 1,
1.129026, 0.04802171, 1.624163, 1, 0, 0.9058824, 1,
1.131271, 0.8893248, 1.630439, 1, 0, 0.9019608, 1,
1.134066, 0.7035603, 0.6130744, 1, 0, 0.8941177, 1,
1.134078, 0.7278659, 1.885016, 1, 0, 0.8862745, 1,
1.137455, 0.6156991, 1.046218, 1, 0, 0.8823529, 1,
1.138905, 0.5586572, 0.1266293, 1, 0, 0.8745098, 1,
1.141854, -0.2213015, 0.8110417, 1, 0, 0.8705882, 1,
1.147547, 1.143831, 0.5347216, 1, 0, 0.8627451, 1,
1.150133, 0.515709, -0.2373151, 1, 0, 0.8588235, 1,
1.153247, 0.5548369, 2.205553, 1, 0, 0.8509804, 1,
1.15435, -0.4233, 3.906945, 1, 0, 0.8470588, 1,
1.157529, -1.060107, 2.952991, 1, 0, 0.8392157, 1,
1.15906, 0.2719037, 1.323674, 1, 0, 0.8352941, 1,
1.166911, -0.001463822, 1.679633, 1, 0, 0.827451, 1,
1.168643, 0.07228384, 2.648782, 1, 0, 0.8235294, 1,
1.173457, 0.9300588, 0.9237823, 1, 0, 0.8156863, 1,
1.180117, -0.09606246, 1.752329, 1, 0, 0.8117647, 1,
1.184577, -0.1084893, 2.04956, 1, 0, 0.8039216, 1,
1.186249, -0.1740044, 0.3615749, 1, 0, 0.7960784, 1,
1.187002, -1.230455, 3.656939, 1, 0, 0.7921569, 1,
1.189061, 0.5665218, 1.379975, 1, 0, 0.7843137, 1,
1.189248, -0.6638187, 1.501233, 1, 0, 0.7803922, 1,
1.189401, -0.2991792, 0.6300865, 1, 0, 0.772549, 1,
1.201871, 0.936619, -0.8320389, 1, 0, 0.7686275, 1,
1.214199, 0.2000055, 1.387389, 1, 0, 0.7607843, 1,
1.221592, 0.8901886, 1.381837, 1, 0, 0.7568628, 1,
1.228791, 1.950091, 0.3695617, 1, 0, 0.7490196, 1,
1.23407, 1.544958, 2.985157, 1, 0, 0.7450981, 1,
1.240358, -0.7943056, 2.816338, 1, 0, 0.7372549, 1,
1.245794, -0.9058735, 3.086654, 1, 0, 0.7333333, 1,
1.248375, -0.06070286, 1.650655, 1, 0, 0.7254902, 1,
1.249106, 1.372387, 0.08775058, 1, 0, 0.7215686, 1,
1.259455, -0.3529604, 1.353574, 1, 0, 0.7137255, 1,
1.267105, 0.1034993, 2.103814, 1, 0, 0.7098039, 1,
1.268156, 0.309603, 2.195067, 1, 0, 0.7019608, 1,
1.283796, -0.2607908, 2.341303, 1, 0, 0.6941177, 1,
1.286717, 0.7263275, 0.5860988, 1, 0, 0.6901961, 1,
1.287649, -0.1819059, 2.967904, 1, 0, 0.682353, 1,
1.295309, 0.7044671, 2.351729, 1, 0, 0.6784314, 1,
1.300745, 0.7448621, 1.034032, 1, 0, 0.6705883, 1,
1.309912, -0.8907905, 1.713707, 1, 0, 0.6666667, 1,
1.326231, -2.055199, 3.806175, 1, 0, 0.6588235, 1,
1.330783, -0.6025021, 3.170987, 1, 0, 0.654902, 1,
1.331663, -1.664175, 2.319405, 1, 0, 0.6470588, 1,
1.334829, 0.1024412, -0.7993799, 1, 0, 0.6431373, 1,
1.342969, -0.9462624, 2.69662, 1, 0, 0.6352941, 1,
1.346298, 0.3920753, 1.531282, 1, 0, 0.6313726, 1,
1.347535, -0.2349726, 3.752653, 1, 0, 0.6235294, 1,
1.353603, -0.295837, 2.443343, 1, 0, 0.6196079, 1,
1.355033, 0.7804672, -0.4606507, 1, 0, 0.6117647, 1,
1.367837, 1.370555, 1.576105, 1, 0, 0.6078432, 1,
1.375383, 1.52102, 1.469728, 1, 0, 0.6, 1,
1.387877, 0.6442857, 2.070191, 1, 0, 0.5921569, 1,
1.388379, 2.304661, 1.923447, 1, 0, 0.5882353, 1,
1.400626, 0.02298803, 1.368396, 1, 0, 0.5803922, 1,
1.400989, 0.09220976, -0.3673197, 1, 0, 0.5764706, 1,
1.408754, 0.5926722, 1.007527, 1, 0, 0.5686275, 1,
1.410521, 0.00382487, 1.311665, 1, 0, 0.5647059, 1,
1.412226, 0.2948142, -0.4014384, 1, 0, 0.5568628, 1,
1.419651, -1.582889, 1.769246, 1, 0, 0.5529412, 1,
1.420842, -1.951847, 3.267982, 1, 0, 0.5450981, 1,
1.42188, 1.029446, 0.8125384, 1, 0, 0.5411765, 1,
1.424659, 0.08862232, 0.6594073, 1, 0, 0.5333334, 1,
1.432647, -2.448082, 1.64441, 1, 0, 0.5294118, 1,
1.434072, 0.7758547, 1.460244, 1, 0, 0.5215687, 1,
1.435673, 0.2294382, 2.29796, 1, 0, 0.5176471, 1,
1.436053, -0.7556262, 3.244845, 1, 0, 0.509804, 1,
1.485899, -0.467926, 1.924881, 1, 0, 0.5058824, 1,
1.502855, 0.5214285, 0.4437717, 1, 0, 0.4980392, 1,
1.50999, -0.3102224, 1.643323, 1, 0, 0.4901961, 1,
1.521739, 1.723729, 0.7001225, 1, 0, 0.4862745, 1,
1.530334, 0.5029669, 2.366502, 1, 0, 0.4784314, 1,
1.531495, -1.288609, 1.76463, 1, 0, 0.4745098, 1,
1.537444, 1.1888, -0.2804772, 1, 0, 0.4666667, 1,
1.544487, -1.177179, 2.35191, 1, 0, 0.4627451, 1,
1.547215, -1.637589, 2.208695, 1, 0, 0.454902, 1,
1.563699, -0.6838992, 0.02584426, 1, 0, 0.4509804, 1,
1.566273, -0.9770036, 2.55629, 1, 0, 0.4431373, 1,
1.571257, 0.2138761, 2.032081, 1, 0, 0.4392157, 1,
1.575992, 0.1246153, 3.11413, 1, 0, 0.4313726, 1,
1.576344, -1.292055, 2.713546, 1, 0, 0.427451, 1,
1.578737, -2.777564, 1.968796, 1, 0, 0.4196078, 1,
1.585426, -2.095981, 3.19785, 1, 0, 0.4156863, 1,
1.58677, -1.051639, 2.305161, 1, 0, 0.4078431, 1,
1.593279, -1.525882, 2.41163, 1, 0, 0.4039216, 1,
1.598826, -1.800175, 2.754752, 1, 0, 0.3960784, 1,
1.602388, 1.01146, 2.040126, 1, 0, 0.3882353, 1,
1.615652, 0.136699, 3.735373, 1, 0, 0.3843137, 1,
1.616363, 0.6594688, 0.03134411, 1, 0, 0.3764706, 1,
1.646533, -1.50702, 4.397991, 1, 0, 0.372549, 1,
1.651636, 0.08649878, 1.165505, 1, 0, 0.3647059, 1,
1.662072, -1.100306, 4.060759, 1, 0, 0.3607843, 1,
1.694199, 1.594136, 1.000033, 1, 0, 0.3529412, 1,
1.699676, -1.802904, 2.991579, 1, 0, 0.3490196, 1,
1.711571, -0.3735305, 1.983869, 1, 0, 0.3411765, 1,
1.716578, 0.6033888, 1.425838, 1, 0, 0.3372549, 1,
1.720574, 1.98706, 2.842328, 1, 0, 0.3294118, 1,
1.74245, -2.461293, 1.117628, 1, 0, 0.3254902, 1,
1.748351, 0.7490022, 0.4251243, 1, 0, 0.3176471, 1,
1.756287, 0.9139639, 2.234736, 1, 0, 0.3137255, 1,
1.760084, 2.138289, 0.6627006, 1, 0, 0.3058824, 1,
1.763259, 1.238828, 1.975093, 1, 0, 0.2980392, 1,
1.76378, 0.399064, 1.290057, 1, 0, 0.2941177, 1,
1.785138, 0.9831371, 1.510018, 1, 0, 0.2862745, 1,
1.789599, 0.6425917, 0.9273892, 1, 0, 0.282353, 1,
1.79001, 0.9791498, -0.07050085, 1, 0, 0.2745098, 1,
1.797164, -0.2599, 1.250584, 1, 0, 0.2705882, 1,
1.797469, 2.902212, -0.8146338, 1, 0, 0.2627451, 1,
1.832911, -1.738469, 1.769773, 1, 0, 0.2588235, 1,
1.838761, -0.9236485, 2.080737, 1, 0, 0.2509804, 1,
1.841186, 0.6233327, 1.954476, 1, 0, 0.2470588, 1,
1.848241, 0.132227, 0.3727785, 1, 0, 0.2392157, 1,
1.857477, -0.4118353, 1.699649, 1, 0, 0.2352941, 1,
1.868976, 0.6270072, 1.006406, 1, 0, 0.227451, 1,
1.871616, -1.779069, 1.706048, 1, 0, 0.2235294, 1,
1.91355, 0.3403487, 2.373602, 1, 0, 0.2156863, 1,
1.923151, -0.08461929, 2.324313, 1, 0, 0.2117647, 1,
1.93959, -0.1320284, -0.2392474, 1, 0, 0.2039216, 1,
1.952672, -1.328353, 2.173001, 1, 0, 0.1960784, 1,
1.96346, -0.053749, 0.7619532, 1, 0, 0.1921569, 1,
1.970554, 0.2730812, 1.146982, 1, 0, 0.1843137, 1,
2.019252, 2.071218, -0.7950074, 1, 0, 0.1803922, 1,
2.07415, -0.0742132, 0.01758102, 1, 0, 0.172549, 1,
2.075357, 0.2134754, 0.4678183, 1, 0, 0.1686275, 1,
2.07612, 0.04544897, 1.169129, 1, 0, 0.1607843, 1,
2.082151, -0.4938996, 2.764588, 1, 0, 0.1568628, 1,
2.092264, -1.187896, 3.909312, 1, 0, 0.1490196, 1,
2.108453, 1.030143, 0.8253378, 1, 0, 0.145098, 1,
2.114496, -0.5033028, 1.7054, 1, 0, 0.1372549, 1,
2.120816, -0.3655921, 1.677619, 1, 0, 0.1333333, 1,
2.163401, -0.03657539, 0.6357247, 1, 0, 0.1254902, 1,
2.222506, 0.2064127, 0.9655244, 1, 0, 0.1215686, 1,
2.243781, 0.2352537, 0.9799734, 1, 0, 0.1137255, 1,
2.286744, -1.256639, 1.992077, 1, 0, 0.1098039, 1,
2.298997, 1.28203, -0.2264144, 1, 0, 0.1019608, 1,
2.335433, -1.165648, 1.806385, 1, 0, 0.09411765, 1,
2.337489, -1.421993, -0.004984796, 1, 0, 0.09019608, 1,
2.397354, 0.7267847, -0.21527, 1, 0, 0.08235294, 1,
2.425606, -0.7581817, 1.60022, 1, 0, 0.07843138, 1,
2.449933, -1.556405, 2.584598, 1, 0, 0.07058824, 1,
2.473849, -0.472499, 1.226762, 1, 0, 0.06666667, 1,
2.531902, -1.116095, 0.508847, 1, 0, 0.05882353, 1,
2.643877, -1.553718, 2.367222, 1, 0, 0.05490196, 1,
2.745331, 0.5022193, 0.4239556, 1, 0, 0.04705882, 1,
2.776697, 1.630993, 0.1050382, 1, 0, 0.04313726, 1,
2.796942, 1.164118, 1.37543, 1, 0, 0.03529412, 1,
2.830644, 0.3665582, 1.750349, 1, 0, 0.03137255, 1,
2.910313, -0.2657333, 2.329524, 1, 0, 0.02352941, 1,
3.176313, 0.1438696, 1.997319, 1, 0, 0.01960784, 1,
3.42276, -0.4540232, 1.998974, 1, 0, 0.01176471, 1,
3.645416, 1.491341, 0.04268076, 1, 0, 0.007843138, 1
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
0.2042843, -3.840447, -7.053053, 0, -0.5, 0.5, 0.5,
0.2042843, -3.840447, -7.053053, 1, -0.5, 0.5, 0.5,
0.2042843, -3.840447, -7.053053, 1, 1.5, 0.5, 0.5,
0.2042843, -3.840447, -7.053053, 0, 1.5, 0.5, 0.5
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
-4.40339, 0.3577865, -7.053053, 0, -0.5, 0.5, 0.5,
-4.40339, 0.3577865, -7.053053, 1, -0.5, 0.5, 0.5,
-4.40339, 0.3577865, -7.053053, 1, 1.5, 0.5, 0.5,
-4.40339, 0.3577865, -7.053053, 0, 1.5, 0.5, 0.5
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
-4.40339, -3.840447, -0.03371692, 0, -0.5, 0.5, 0.5,
-4.40339, -3.840447, -0.03371692, 1, -0.5, 0.5, 0.5,
-4.40339, -3.840447, -0.03371692, 1, 1.5, 0.5, 0.5,
-4.40339, -3.840447, -0.03371692, 0, 1.5, 0.5, 0.5
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
-3, -2.871624, -5.433207,
3, -2.871624, -5.433207,
-3, -2.871624, -5.433207,
-3, -3.033095, -5.703181,
-2, -2.871624, -5.433207,
-2, -3.033095, -5.703181,
-1, -2.871624, -5.433207,
-1, -3.033095, -5.703181,
0, -2.871624, -5.433207,
0, -3.033095, -5.703181,
1, -2.871624, -5.433207,
1, -3.033095, -5.703181,
2, -2.871624, -5.433207,
2, -3.033095, -5.703181,
3, -2.871624, -5.433207,
3, -3.033095, -5.703181
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
-3, -3.356036, -6.24313, 0, -0.5, 0.5, 0.5,
-3, -3.356036, -6.24313, 1, -0.5, 0.5, 0.5,
-3, -3.356036, -6.24313, 1, 1.5, 0.5, 0.5,
-3, -3.356036, -6.24313, 0, 1.5, 0.5, 0.5,
-2, -3.356036, -6.24313, 0, -0.5, 0.5, 0.5,
-2, -3.356036, -6.24313, 1, -0.5, 0.5, 0.5,
-2, -3.356036, -6.24313, 1, 1.5, 0.5, 0.5,
-2, -3.356036, -6.24313, 0, 1.5, 0.5, 0.5,
-1, -3.356036, -6.24313, 0, -0.5, 0.5, 0.5,
-1, -3.356036, -6.24313, 1, -0.5, 0.5, 0.5,
-1, -3.356036, -6.24313, 1, 1.5, 0.5, 0.5,
-1, -3.356036, -6.24313, 0, 1.5, 0.5, 0.5,
0, -3.356036, -6.24313, 0, -0.5, 0.5, 0.5,
0, -3.356036, -6.24313, 1, -0.5, 0.5, 0.5,
0, -3.356036, -6.24313, 1, 1.5, 0.5, 0.5,
0, -3.356036, -6.24313, 0, 1.5, 0.5, 0.5,
1, -3.356036, -6.24313, 0, -0.5, 0.5, 0.5,
1, -3.356036, -6.24313, 1, -0.5, 0.5, 0.5,
1, -3.356036, -6.24313, 1, 1.5, 0.5, 0.5,
1, -3.356036, -6.24313, 0, 1.5, 0.5, 0.5,
2, -3.356036, -6.24313, 0, -0.5, 0.5, 0.5,
2, -3.356036, -6.24313, 1, -0.5, 0.5, 0.5,
2, -3.356036, -6.24313, 1, 1.5, 0.5, 0.5,
2, -3.356036, -6.24313, 0, 1.5, 0.5, 0.5,
3, -3.356036, -6.24313, 0, -0.5, 0.5, 0.5,
3, -3.356036, -6.24313, 1, -0.5, 0.5, 0.5,
3, -3.356036, -6.24313, 1, 1.5, 0.5, 0.5,
3, -3.356036, -6.24313, 0, 1.5, 0.5, 0.5
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
-3.340081, -2, -5.433207,
-3.340081, 3, -5.433207,
-3.340081, -2, -5.433207,
-3.517299, -2, -5.703181,
-3.340081, -1, -5.433207,
-3.517299, -1, -5.703181,
-3.340081, 0, -5.433207,
-3.517299, 0, -5.703181,
-3.340081, 1, -5.433207,
-3.517299, 1, -5.703181,
-3.340081, 2, -5.433207,
-3.517299, 2, -5.703181,
-3.340081, 3, -5.433207,
-3.517299, 3, -5.703181
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
-3.871736, -2, -6.24313, 0, -0.5, 0.5, 0.5,
-3.871736, -2, -6.24313, 1, -0.5, 0.5, 0.5,
-3.871736, -2, -6.24313, 1, 1.5, 0.5, 0.5,
-3.871736, -2, -6.24313, 0, 1.5, 0.5, 0.5,
-3.871736, -1, -6.24313, 0, -0.5, 0.5, 0.5,
-3.871736, -1, -6.24313, 1, -0.5, 0.5, 0.5,
-3.871736, -1, -6.24313, 1, 1.5, 0.5, 0.5,
-3.871736, -1, -6.24313, 0, 1.5, 0.5, 0.5,
-3.871736, 0, -6.24313, 0, -0.5, 0.5, 0.5,
-3.871736, 0, -6.24313, 1, -0.5, 0.5, 0.5,
-3.871736, 0, -6.24313, 1, 1.5, 0.5, 0.5,
-3.871736, 0, -6.24313, 0, 1.5, 0.5, 0.5,
-3.871736, 1, -6.24313, 0, -0.5, 0.5, 0.5,
-3.871736, 1, -6.24313, 1, -0.5, 0.5, 0.5,
-3.871736, 1, -6.24313, 1, 1.5, 0.5, 0.5,
-3.871736, 1, -6.24313, 0, 1.5, 0.5, 0.5,
-3.871736, 2, -6.24313, 0, -0.5, 0.5, 0.5,
-3.871736, 2, -6.24313, 1, -0.5, 0.5, 0.5,
-3.871736, 2, -6.24313, 1, 1.5, 0.5, 0.5,
-3.871736, 2, -6.24313, 0, 1.5, 0.5, 0.5,
-3.871736, 3, -6.24313, 0, -0.5, 0.5, 0.5,
-3.871736, 3, -6.24313, 1, -0.5, 0.5, 0.5,
-3.871736, 3, -6.24313, 1, 1.5, 0.5, 0.5,
-3.871736, 3, -6.24313, 0, 1.5, 0.5, 0.5
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
-3.340081, -2.871624, -4,
-3.340081, -2.871624, 4,
-3.340081, -2.871624, -4,
-3.517299, -3.033095, -4,
-3.340081, -2.871624, -2,
-3.517299, -3.033095, -2,
-3.340081, -2.871624, 0,
-3.517299, -3.033095, 0,
-3.340081, -2.871624, 2,
-3.517299, -3.033095, 2,
-3.340081, -2.871624, 4,
-3.517299, -3.033095, 4
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
-3.871736, -3.356036, -4, 0, -0.5, 0.5, 0.5,
-3.871736, -3.356036, -4, 1, -0.5, 0.5, 0.5,
-3.871736, -3.356036, -4, 1, 1.5, 0.5, 0.5,
-3.871736, -3.356036, -4, 0, 1.5, 0.5, 0.5,
-3.871736, -3.356036, -2, 0, -0.5, 0.5, 0.5,
-3.871736, -3.356036, -2, 1, -0.5, 0.5, 0.5,
-3.871736, -3.356036, -2, 1, 1.5, 0.5, 0.5,
-3.871736, -3.356036, -2, 0, 1.5, 0.5, 0.5,
-3.871736, -3.356036, 0, 0, -0.5, 0.5, 0.5,
-3.871736, -3.356036, 0, 1, -0.5, 0.5, 0.5,
-3.871736, -3.356036, 0, 1, 1.5, 0.5, 0.5,
-3.871736, -3.356036, 0, 0, 1.5, 0.5, 0.5,
-3.871736, -3.356036, 2, 0, -0.5, 0.5, 0.5,
-3.871736, -3.356036, 2, 1, -0.5, 0.5, 0.5,
-3.871736, -3.356036, 2, 1, 1.5, 0.5, 0.5,
-3.871736, -3.356036, 2, 0, 1.5, 0.5, 0.5,
-3.871736, -3.356036, 4, 0, -0.5, 0.5, 0.5,
-3.871736, -3.356036, 4, 1, -0.5, 0.5, 0.5,
-3.871736, -3.356036, 4, 1, 1.5, 0.5, 0.5,
-3.871736, -3.356036, 4, 0, 1.5, 0.5, 0.5
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
-3.340081, -2.871624, -5.433207,
-3.340081, 3.587197, -5.433207,
-3.340081, -2.871624, 5.365773,
-3.340081, 3.587197, 5.365773,
-3.340081, -2.871624, -5.433207,
-3.340081, -2.871624, 5.365773,
-3.340081, 3.587197, -5.433207,
-3.340081, 3.587197, 5.365773,
-3.340081, -2.871624, -5.433207,
3.74865, -2.871624, -5.433207,
-3.340081, -2.871624, 5.365773,
3.74865, -2.871624, 5.365773,
-3.340081, 3.587197, -5.433207,
3.74865, 3.587197, -5.433207,
-3.340081, 3.587197, 5.365773,
3.74865, 3.587197, 5.365773,
3.74865, -2.871624, -5.433207,
3.74865, 3.587197, -5.433207,
3.74865, -2.871624, 5.365773,
3.74865, 3.587197, 5.365773,
3.74865, -2.871624, -5.433207,
3.74865, -2.871624, 5.365773,
3.74865, 3.587197, -5.433207,
3.74865, 3.587197, 5.365773
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
var radius = 7.711989;
var distance = 34.31151;
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
mvMatrix.translate( -0.2042843, -0.3577865, 0.03371692 );
mvMatrix.scale( 1.176283, 1.291002, 0.7721428 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.31151);
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
Butan-2-amin<-read.table("Butan-2-amin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Butan-2-amin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Butan' not found
```

```r
y<-Butan-2-amin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Butan' not found
```

```r
z<-Butan-2-amin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Butan' not found
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
-3.236847, 0.8163785, -2.411088, 0, 0, 1, 1, 1,
-3.168307, -0.3993465, 0.3703667, 1, 0, 0, 1, 1,
-2.859596, -1.876453, -0.7822027, 1, 0, 0, 1, 1,
-2.770787, -0.5275582, 0.1413125, 1, 0, 0, 1, 1,
-2.722239, -0.1907528, -1.98569, 1, 0, 0, 1, 1,
-2.667529, 0.6552007, -3.524021, 1, 0, 0, 1, 1,
-2.636007, -0.5912023, -0.7116651, 0, 0, 0, 1, 1,
-2.5374, 1.344103, -1.83519, 0, 0, 0, 1, 1,
-2.513958, 0.7486813, -0.9187211, 0, 0, 0, 1, 1,
-2.491515, 0.3459323, -0.7142833, 0, 0, 0, 1, 1,
-2.367116, 0.372676, -1.306201, 0, 0, 0, 1, 1,
-2.348325, 1.686592, -1.609596, 0, 0, 0, 1, 1,
-2.289373, -0.3695427, -2.359352, 0, 0, 0, 1, 1,
-2.16851, -0.5978913, -2.775809, 1, 1, 1, 1, 1,
-2.155997, -1.839094, -2.216723, 1, 1, 1, 1, 1,
-2.146303, 0.7513071, -1.08859, 1, 1, 1, 1, 1,
-2.127106, -0.5633614, -1.800427, 1, 1, 1, 1, 1,
-2.108609, 0.5147653, 2.193496, 1, 1, 1, 1, 1,
-2.099216, -0.3215335, -3.718563, 1, 1, 1, 1, 1,
-2.098968, -0.5829033, -2.867927, 1, 1, 1, 1, 1,
-2.085426, 0.6395436, -2.05722, 1, 1, 1, 1, 1,
-2.039664, -0.1648839, -3.603401, 1, 1, 1, 1, 1,
-2.037688, 0.947148, -2.889003, 1, 1, 1, 1, 1,
-2.034305, 2.236396, -0.2581167, 1, 1, 1, 1, 1,
-2.033916, 0.8344163, -1.616341, 1, 1, 1, 1, 1,
-2.031976, -0.6637368, -1.308233, 1, 1, 1, 1, 1,
-1.99483, 0.2334644, -1.081782, 1, 1, 1, 1, 1,
-1.983003, 0.3069036, -1.550141, 1, 1, 1, 1, 1,
-1.962338, -0.02116525, -1.231206, 0, 0, 1, 1, 1,
-1.950516, 0.8288129, 0.1306053, 1, 0, 0, 1, 1,
-1.945755, -1.313513, -3.753428, 1, 0, 0, 1, 1,
-1.925654, 0.3649256, -1.816039, 1, 0, 0, 1, 1,
-1.898638, -0.06245902, -0.2825027, 1, 0, 0, 1, 1,
-1.894094, 0.7800094, 0.5620608, 1, 0, 0, 1, 1,
-1.886113, 0.8100847, -1.45069, 0, 0, 0, 1, 1,
-1.858287, 1.133806, -2.241063, 0, 0, 0, 1, 1,
-1.84751, -0.5633795, -2.271046, 0, 0, 0, 1, 1,
-1.840926, 0.5433941, -1.232396, 0, 0, 0, 1, 1,
-1.836303, 0.2441179, 0.1390837, 0, 0, 0, 1, 1,
-1.824992, -0.322316, -1.578296, 0, 0, 0, 1, 1,
-1.8243, -0.293459, -1.065451, 0, 0, 0, 1, 1,
-1.822059, -1.280296, -2.973802, 1, 1, 1, 1, 1,
-1.821082, -0.1636615, -0.9561232, 1, 1, 1, 1, 1,
-1.80988, -1.496712, -2.808108, 1, 1, 1, 1, 1,
-1.79569, 1.313634, 0.1640799, 1, 1, 1, 1, 1,
-1.758889, -1.157009, -1.095202, 1, 1, 1, 1, 1,
-1.757633, 0.04191271, -2.613384, 1, 1, 1, 1, 1,
-1.740014, 1.598802, -0.7914676, 1, 1, 1, 1, 1,
-1.738061, -0.9306653, -2.791656, 1, 1, 1, 1, 1,
-1.725055, -0.4816672, -2.428747, 1, 1, 1, 1, 1,
-1.671408, -0.7052338, -1.570854, 1, 1, 1, 1, 1,
-1.623958, 0.6018789, -1.704881, 1, 1, 1, 1, 1,
-1.583912, 1.03103, -1.325706, 1, 1, 1, 1, 1,
-1.562111, -1.125166, -2.596246, 1, 1, 1, 1, 1,
-1.552867, -0.8092811, -0.6481754, 1, 1, 1, 1, 1,
-1.543903, 0.4891724, -1.353747, 1, 1, 1, 1, 1,
-1.543592, 0.1808368, 0.4153704, 0, 0, 1, 1, 1,
-1.54162, -0.5449618, -2.087735, 1, 0, 0, 1, 1,
-1.525568, -0.1050379, -2.518304, 1, 0, 0, 1, 1,
-1.519192, -0.1349862, -1.14085, 1, 0, 0, 1, 1,
-1.511896, 0.1772514, -2.058781, 1, 0, 0, 1, 1,
-1.509002, 0.252593, -0.09254186, 1, 0, 0, 1, 1,
-1.505619, 0.4723423, -0.9032728, 0, 0, 0, 1, 1,
-1.504076, -1.267053, -3.71214, 0, 0, 0, 1, 1,
-1.498644, -1.33274, -2.457048, 0, 0, 0, 1, 1,
-1.494245, -0.64473, -1.483352, 0, 0, 0, 1, 1,
-1.493557, -0.8036318, -3.026052, 0, 0, 0, 1, 1,
-1.491457, 1.301596, -0.1439248, 0, 0, 0, 1, 1,
-1.465069, -1.527601, -4.461132, 0, 0, 0, 1, 1,
-1.445761, 0.5225374, -1.113106, 1, 1, 1, 1, 1,
-1.44265, 1.872271, -0.4194514, 1, 1, 1, 1, 1,
-1.430996, -0.3877311, -2.519164, 1, 1, 1, 1, 1,
-1.42718, 0.5147582, -0.6798996, 1, 1, 1, 1, 1,
-1.406753, 1.371219, -1.760941, 1, 1, 1, 1, 1,
-1.40144, 1.565432, -0.8344067, 1, 1, 1, 1, 1,
-1.40016, -0.2716741, -0.7307171, 1, 1, 1, 1, 1,
-1.394907, 1.461785, -1.70981, 1, 1, 1, 1, 1,
-1.388622, 0.1398852, -3.50199, 1, 1, 1, 1, 1,
-1.387583, -1.093938, -2.481597, 1, 1, 1, 1, 1,
-1.384708, -0.3562505, -2.252428, 1, 1, 1, 1, 1,
-1.374641, 0.04958716, 0.1632983, 1, 1, 1, 1, 1,
-1.369022, -0.5439696, -1.553602, 1, 1, 1, 1, 1,
-1.363372, 2.137265, -0.06744466, 1, 1, 1, 1, 1,
-1.345502, -1.655914, -2.849062, 1, 1, 1, 1, 1,
-1.332501, 2.1963, -0.1234528, 0, 0, 1, 1, 1,
-1.328276, -1.234004, -2.420367, 1, 0, 0, 1, 1,
-1.323006, 0.2175699, -1.101992, 1, 0, 0, 1, 1,
-1.321841, -0.5342674, -4.156439, 1, 0, 0, 1, 1,
-1.316662, 0.8441361, 0.8359959, 1, 0, 0, 1, 1,
-1.298311, 0.7008569, -2.021908, 1, 0, 0, 1, 1,
-1.284689, 0.2062896, -2.703125, 0, 0, 0, 1, 1,
-1.280954, 0.7448457, -2.289368, 0, 0, 0, 1, 1,
-1.278218, 0.7271284, 0.6819507, 0, 0, 0, 1, 1,
-1.273631, -1.169865, -1.320114, 0, 0, 0, 1, 1,
-1.273516, -0.7824435, -2.666076, 0, 0, 0, 1, 1,
-1.261143, 0.7996588, -1.326148, 0, 0, 0, 1, 1,
-1.253907, 0.7192394, -0.7595546, 0, 0, 0, 1, 1,
-1.251709, 1.726874, -0.31267, 1, 1, 1, 1, 1,
-1.23918, 0.1929319, -2.558354, 1, 1, 1, 1, 1,
-1.238268, -1.07002, -3.345063, 1, 1, 1, 1, 1,
-1.236391, -0.2907881, -1.681541, 1, 1, 1, 1, 1,
-1.236093, -1.267339, -0.7922263, 1, 1, 1, 1, 1,
-1.234067, -0.2209772, -1.371396, 1, 1, 1, 1, 1,
-1.22604, -0.5237112, -2.006497, 1, 1, 1, 1, 1,
-1.221822, -2.098522, -2.027238, 1, 1, 1, 1, 1,
-1.221149, 0.005055435, -3.20786, 1, 1, 1, 1, 1,
-1.220274, 0.1762141, -1.676325, 1, 1, 1, 1, 1,
-1.201614, 1.482133, -0.7909359, 1, 1, 1, 1, 1,
-1.196094, 0.6855997, 0.4724874, 1, 1, 1, 1, 1,
-1.195498, 0.1297888, -2.231508, 1, 1, 1, 1, 1,
-1.185822, 0.907164, -0.1234806, 1, 1, 1, 1, 1,
-1.17764, -0.4939875, -2.715634, 1, 1, 1, 1, 1,
-1.177526, 0.1311822, -2.556312, 0, 0, 1, 1, 1,
-1.168546, 0.2308463, -0.9231073, 1, 0, 0, 1, 1,
-1.165236, 0.925366, -1.491704, 1, 0, 0, 1, 1,
-1.16463, -1.719844, -1.710627, 1, 0, 0, 1, 1,
-1.162123, -0.1107647, -0.7899659, 1, 0, 0, 1, 1,
-1.158194, -0.9303776, -2.840365, 1, 0, 0, 1, 1,
-1.157267, -0.1627195, -2.383036, 0, 0, 0, 1, 1,
-1.136262, -1.282668, -3.281093, 0, 0, 0, 1, 1,
-1.132717, 1.735242, 0.388471, 0, 0, 0, 1, 1,
-1.126916, -0.7333145, -1.416235, 0, 0, 0, 1, 1,
-1.113881, -0.2539764, -1.981633, 0, 0, 0, 1, 1,
-1.113114, -1.114561, -1.195517, 0, 0, 0, 1, 1,
-1.096931, -1.056706, -2.607207, 0, 0, 0, 1, 1,
-1.084069, -0.8499793, -1.077336, 1, 1, 1, 1, 1,
-1.082079, -0.6427642, -2.643368, 1, 1, 1, 1, 1,
-1.070938, -1.539164, -3.545444, 1, 1, 1, 1, 1,
-1.068907, 1.296665, -1.095758, 1, 1, 1, 1, 1,
-1.061416, 1.651434, -1.475015, 1, 1, 1, 1, 1,
-1.058183, 0.2293853, -1.986491, 1, 1, 1, 1, 1,
-1.044353, 0.7271256, -1.980671, 1, 1, 1, 1, 1,
-1.039247, -0.3252371, -1.512246, 1, 1, 1, 1, 1,
-1.037444, -1.04435, -0.2715035, 1, 1, 1, 1, 1,
-1.037067, -0.06200392, -4.300382, 1, 1, 1, 1, 1,
-1.033544, 0.5920945, -1.898424, 1, 1, 1, 1, 1,
-1.028253, 1.112365, -0.2184837, 1, 1, 1, 1, 1,
-1.026611, -0.6351616, -4.548736, 1, 1, 1, 1, 1,
-1.021772, 0.0692496, -0.9763991, 1, 1, 1, 1, 1,
-1.020179, -1.182285, -1.731237, 1, 1, 1, 1, 1,
-1.01146, 1.255528, 0.3820336, 0, 0, 1, 1, 1,
-1.005618, -0.5856508, -2.426311, 1, 0, 0, 1, 1,
-1.003134, -2.149747, -3.96891, 1, 0, 0, 1, 1,
-1.003119, 1.838039, -0.4274217, 1, 0, 0, 1, 1,
-1.002423, 1.25185, -1.332817, 1, 0, 0, 1, 1,
-0.9955181, -0.07078772, -1.664721, 1, 0, 0, 1, 1,
-0.9931142, 0.2896255, -2.258578, 0, 0, 0, 1, 1,
-0.9918689, -0.04789729, -1.177886, 0, 0, 0, 1, 1,
-0.9912123, -0.3573529, -2.583529, 0, 0, 0, 1, 1,
-0.9824584, 0.1326815, -4.097313, 0, 0, 0, 1, 1,
-0.9818888, 0.4367458, -2.357628, 0, 0, 0, 1, 1,
-0.9793823, -1.068787, -3.02904, 0, 0, 0, 1, 1,
-0.975185, -1.38785, -2.282171, 0, 0, 0, 1, 1,
-0.9701404, -0.658235, -1.551107, 1, 1, 1, 1, 1,
-0.9571282, -0.4949665, -1.463185, 1, 1, 1, 1, 1,
-0.95475, -0.2125506, -1.196731, 1, 1, 1, 1, 1,
-0.9506798, -0.002806423, -0.2682042, 1, 1, 1, 1, 1,
-0.9466993, 0.5626469, -2.771784, 1, 1, 1, 1, 1,
-0.9421646, 0.7598917, -1.305231, 1, 1, 1, 1, 1,
-0.9367357, 1.708853, -0.9920731, 1, 1, 1, 1, 1,
-0.9354929, 0.7723755, -0.6843776, 1, 1, 1, 1, 1,
-0.9134229, 0.7691275, 0.8422133, 1, 1, 1, 1, 1,
-0.909647, -0.1076473, -0.163939, 1, 1, 1, 1, 1,
-0.9062387, -1.088489, -3.139805, 1, 1, 1, 1, 1,
-0.9042649, -1.454058, -2.887352, 1, 1, 1, 1, 1,
-0.9040037, 0.6539868, -1.892574, 1, 1, 1, 1, 1,
-0.8999835, 1.979261, -0.5659301, 1, 1, 1, 1, 1,
-0.8962274, -0.1439082, -3.065227, 1, 1, 1, 1, 1,
-0.8953503, 0.3952448, -0.1463289, 0, 0, 1, 1, 1,
-0.8944123, 1.830365, -1.892624, 1, 0, 0, 1, 1,
-0.8936431, 0.193701, -2.155198, 1, 0, 0, 1, 1,
-0.892123, 1.147897, -0.2711426, 1, 0, 0, 1, 1,
-0.888333, -1.264781, -3.391166, 1, 0, 0, 1, 1,
-0.886826, 1.521446, -1.066941, 1, 0, 0, 1, 1,
-0.885783, -0.9576631, -1.104708, 0, 0, 0, 1, 1,
-0.8807712, -1.317284, -2.23128, 0, 0, 0, 1, 1,
-0.8784129, 1.453934, -1.076398, 0, 0, 0, 1, 1,
-0.8779191, -0.1210472, 1.011281, 0, 0, 0, 1, 1,
-0.8764096, 0.3990216, -1.88209, 0, 0, 0, 1, 1,
-0.8755761, 0.20249, -0.8849277, 0, 0, 0, 1, 1,
-0.8753291, 0.2187453, -0.6301153, 0, 0, 0, 1, 1,
-0.8684611, 0.2482667, -2.748564, 1, 1, 1, 1, 1,
-0.8563493, 0.7056653, -1.015167, 1, 1, 1, 1, 1,
-0.8550613, 1.719216, -0.7587794, 1, 1, 1, 1, 1,
-0.8506526, -0.4694415, -3.883344, 1, 1, 1, 1, 1,
-0.8498203, 0.5663953, 0.3191614, 1, 1, 1, 1, 1,
-0.8483143, 1.015854, -0.06807891, 1, 1, 1, 1, 1,
-0.8468601, 0.1822098, 0.04607413, 1, 1, 1, 1, 1,
-0.8447319, 0.1388264, -2.268599, 1, 1, 1, 1, 1,
-0.8396844, 0.0588128, -2.560132, 1, 1, 1, 1, 1,
-0.8363393, -1.069541, -2.052396, 1, 1, 1, 1, 1,
-0.8347802, 1.153565, 2.368239, 1, 1, 1, 1, 1,
-0.8327583, 0.7391688, 0.9943962, 1, 1, 1, 1, 1,
-0.8321264, 0.9566758, -2.852087, 1, 1, 1, 1, 1,
-0.8261931, -0.6016426, -3.221743, 1, 1, 1, 1, 1,
-0.8259998, 1.420117, -1.361996, 1, 1, 1, 1, 1,
-0.8258367, -0.09371273, -1.798458, 0, 0, 1, 1, 1,
-0.8236433, 2.03392, -1.594907, 1, 0, 0, 1, 1,
-0.8207753, 0.5133961, -1.493448, 1, 0, 0, 1, 1,
-0.8201759, 1.51642, 0.2329478, 1, 0, 0, 1, 1,
-0.8188562, -0.6919486, -4.247703, 1, 0, 0, 1, 1,
-0.8143649, -0.5468011, -1.369932, 1, 0, 0, 1, 1,
-0.8112136, -0.2450905, -1.46429, 0, 0, 0, 1, 1,
-0.8094676, 0.9380527, -2.11504, 0, 0, 0, 1, 1,
-0.8092902, -0.2706626, -0.6736826, 0, 0, 0, 1, 1,
-0.8090427, 1.48026, -1.153012, 0, 0, 0, 1, 1,
-0.8024694, 1.014474, -1.122605, 0, 0, 0, 1, 1,
-0.8020958, -1.613503, -2.005632, 0, 0, 0, 1, 1,
-0.7968193, -0.3887618, -2.794866, 0, 0, 0, 1, 1,
-0.7857421, 0.4660538, -0.6607139, 1, 1, 1, 1, 1,
-0.7828388, -0.8538418, -3.353189, 1, 1, 1, 1, 1,
-0.7794055, 0.1798195, -1.761389, 1, 1, 1, 1, 1,
-0.7654311, 0.2648862, -2.420317, 1, 1, 1, 1, 1,
-0.7606601, 1.162629, 1.216153, 1, 1, 1, 1, 1,
-0.7586243, -0.6303096, -1.962945, 1, 1, 1, 1, 1,
-0.755567, 2.705675, -0.4005415, 1, 1, 1, 1, 1,
-0.7516934, -1.056926, -1.395224, 1, 1, 1, 1, 1,
-0.751577, -0.5923979, -1.56221, 1, 1, 1, 1, 1,
-0.7508469, 1.151617, -0.1960121, 1, 1, 1, 1, 1,
-0.7479519, -1.499486, -3.540302, 1, 1, 1, 1, 1,
-0.7445192, 0.09500784, -1.314123, 1, 1, 1, 1, 1,
-0.7430084, -0.3347952, -0.4140445, 1, 1, 1, 1, 1,
-0.7421989, -0.7441223, -4.250428, 1, 1, 1, 1, 1,
-0.7340657, 0.07455009, 0.6379548, 1, 1, 1, 1, 1,
-0.7284702, -0.1577236, -2.532629, 0, 0, 1, 1, 1,
-0.7146773, -0.2633016, -1.421974, 1, 0, 0, 1, 1,
-0.7144364, -0.9900993, -1.688356, 1, 0, 0, 1, 1,
-0.7083196, -0.1820419, -2.288096, 1, 0, 0, 1, 1,
-0.7053407, 0.7477016, -0.7388324, 1, 0, 0, 1, 1,
-0.6971251, -0.3348895, -3.512307, 1, 0, 0, 1, 1,
-0.6934895, -0.6287709, -3.165831, 0, 0, 0, 1, 1,
-0.6847544, 0.1017133, -2.347097, 0, 0, 0, 1, 1,
-0.6830702, 0.5262961, -1.804371, 0, 0, 0, 1, 1,
-0.6801114, 0.5522614, -1.810993, 0, 0, 0, 1, 1,
-0.669091, 2.404912, -0.5482321, 0, 0, 0, 1, 1,
-0.6682692, -0.5309773, -2.265369, 0, 0, 0, 1, 1,
-0.6546172, 1.564498, -0.5838211, 0, 0, 0, 1, 1,
-0.6522416, -0.7131353, -2.088552, 1, 1, 1, 1, 1,
-0.6519128, -0.8394051, -3.823821, 1, 1, 1, 1, 1,
-0.6514868, -0.5073318, -2.98475, 1, 1, 1, 1, 1,
-0.649577, 1.01462, -0.2274271, 1, 1, 1, 1, 1,
-0.6436411, 0.1166743, -0.5993656, 1, 1, 1, 1, 1,
-0.6420499, 0.8961125, -0.900771, 1, 1, 1, 1, 1,
-0.6343019, -0.8798291, -3.722177, 1, 1, 1, 1, 1,
-0.6334476, -0.7896382, -1.952501, 1, 1, 1, 1, 1,
-0.6329982, -0.6797115, -3.659603, 1, 1, 1, 1, 1,
-0.6300815, 1.175922, -1.314127, 1, 1, 1, 1, 1,
-0.6273304, -0.5409862, -1.318751, 1, 1, 1, 1, 1,
-0.625394, 0.3166286, -0.4231271, 1, 1, 1, 1, 1,
-0.6237096, -0.5836948, -3.378663, 1, 1, 1, 1, 1,
-0.6175669, -1.268131, -2.259199, 1, 1, 1, 1, 1,
-0.6147252, -0.3690613, -1.282537, 1, 1, 1, 1, 1,
-0.6136115, -0.1446484, -1.959602, 0, 0, 1, 1, 1,
-0.6134923, 0.6021438, -0.1574083, 1, 0, 0, 1, 1,
-0.6122093, 0.7222461, -0.2998286, 1, 0, 0, 1, 1,
-0.6106687, -0.1438846, -0.4298039, 1, 0, 0, 1, 1,
-0.6082787, -0.647365, -3.041985, 1, 0, 0, 1, 1,
-0.6079574, 0.1094491, -2.700737, 1, 0, 0, 1, 1,
-0.5982733, -1.223528, -3.4019, 0, 0, 0, 1, 1,
-0.5922154, 1.518814, -0.5495261, 0, 0, 0, 1, 1,
-0.5912143, 0.9195878, 0.9789802, 0, 0, 0, 1, 1,
-0.5907004, 1.562172, 0.2066996, 0, 0, 0, 1, 1,
-0.5894934, 0.6692172, 0.3206515, 0, 0, 0, 1, 1,
-0.5841536, -0.4670781, -1.900894, 0, 0, 0, 1, 1,
-0.5815281, 1.221257, 0.8229937, 0, 0, 0, 1, 1,
-0.5808601, -0.8223648, -2.869151, 1, 1, 1, 1, 1,
-0.577992, 0.09294426, -1.522491, 1, 1, 1, 1, 1,
-0.5775884, -1.011698, -3.507519, 1, 1, 1, 1, 1,
-0.577284, -1.140875, -1.447797, 1, 1, 1, 1, 1,
-0.5737919, -0.8399097, -0.937736, 1, 1, 1, 1, 1,
-0.569308, 0.04356856, -0.2085361, 1, 1, 1, 1, 1,
-0.5677364, -0.5230002, -1.714419, 1, 1, 1, 1, 1,
-0.5669013, -1.861776, -2.359961, 1, 1, 1, 1, 1,
-0.559469, 0.6406166, -1.316096, 1, 1, 1, 1, 1,
-0.5479457, 1.862292, -0.7701135, 1, 1, 1, 1, 1,
-0.5412334, -0.8172394, -1.693538, 1, 1, 1, 1, 1,
-0.5359228, 0.01291527, -2.111233, 1, 1, 1, 1, 1,
-0.5358669, -0.289807, -0.4737155, 1, 1, 1, 1, 1,
-0.5354608, -0.04686245, -2.423852, 1, 1, 1, 1, 1,
-0.533681, -0.9478813, -1.813445, 1, 1, 1, 1, 1,
-0.5243391, 0.7500628, -0.08487061, 0, 0, 1, 1, 1,
-0.5241561, -0.2601554, -3.908246, 1, 0, 0, 1, 1,
-0.5203678, 0.1566106, -0.8894891, 1, 0, 0, 1, 1,
-0.5196404, 0.7486422, 0.4884999, 1, 0, 0, 1, 1,
-0.518667, 0.8573173, -1.042412, 1, 0, 0, 1, 1,
-0.5145687, 1.159869, 0.882711, 1, 0, 0, 1, 1,
-0.5126045, 0.1373132, -3.109867, 0, 0, 0, 1, 1,
-0.5114723, 0.001043643, -1.635574, 0, 0, 0, 1, 1,
-0.5110606, -0.3858272, -1.530228, 0, 0, 0, 1, 1,
-0.5101194, -0.1330967, -0.973365, 0, 0, 0, 1, 1,
-0.5061573, 0.1779408, -1.044407, 0, 0, 0, 1, 1,
-0.4982882, -0.134694, -2.330813, 0, 0, 0, 1, 1,
-0.496332, -0.9896964, -1.521986, 0, 0, 0, 1, 1,
-0.4960876, -0.879212, -1.977823, 1, 1, 1, 1, 1,
-0.495844, -2.039668, -3.285706, 1, 1, 1, 1, 1,
-0.4920053, -0.3773097, -1.948281, 1, 1, 1, 1, 1,
-0.4900334, -0.1898365, -1.787069, 1, 1, 1, 1, 1,
-0.4896159, 1.036344, 0.5607486, 1, 1, 1, 1, 1,
-0.4887752, 0.9078319, 1.073558, 1, 1, 1, 1, 1,
-0.4878457, -0.2537672, -2.796192, 1, 1, 1, 1, 1,
-0.4833329, -0.3162831, -3.145051, 1, 1, 1, 1, 1,
-0.4822316, 0.2084113, -0.5255808, 1, 1, 1, 1, 1,
-0.4817788, -0.1160672, -2.168251, 1, 1, 1, 1, 1,
-0.4781676, 0.2491252, -1.727516, 1, 1, 1, 1, 1,
-0.4768421, -0.1121816, -2.810622, 1, 1, 1, 1, 1,
-0.4730964, -0.3856197, -2.486133, 1, 1, 1, 1, 1,
-0.4728208, -1.261715, -2.588523, 1, 1, 1, 1, 1,
-0.4599701, 0.4442404, -1.458337, 1, 1, 1, 1, 1,
-0.4588189, 0.4282209, -0.04035852, 0, 0, 1, 1, 1,
-0.4515553, -0.3740674, -3.550033, 1, 0, 0, 1, 1,
-0.4505197, -0.528606, -3.460253, 1, 0, 0, 1, 1,
-0.4499431, -1.016363, -4.211035, 1, 0, 0, 1, 1,
-0.4452004, -0.2120329, -1.035675, 1, 0, 0, 1, 1,
-0.4448636, 1.387268, 0.753058, 1, 0, 0, 1, 1,
-0.4422547, -0.8184031, -2.869563, 0, 0, 0, 1, 1,
-0.4390424, -0.2511053, -0.6825635, 0, 0, 0, 1, 1,
-0.4365962, 1.303765, 0.1798475, 0, 0, 0, 1, 1,
-0.4237944, 0.1825684, -2.526306, 0, 0, 0, 1, 1,
-0.4210505, 0.8296313, 1.115187, 0, 0, 0, 1, 1,
-0.4080593, -0.04979088, -0.4346063, 0, 0, 0, 1, 1,
-0.4069305, -2.169314, -3.417063, 0, 0, 0, 1, 1,
-0.4061666, -2.314073, -2.325791, 1, 1, 1, 1, 1,
-0.4041565, -0.392823, -3.689088, 1, 1, 1, 1, 1,
-0.402519, 1.341465, -0.8079621, 1, 1, 1, 1, 1,
-0.3983679, -0.03337343, -2.033715, 1, 1, 1, 1, 1,
-0.3959902, -1.572047, -2.537091, 1, 1, 1, 1, 1,
-0.3905964, -1.90342, -2.573871, 1, 1, 1, 1, 1,
-0.3881654, 0.5891995, -0.953566, 1, 1, 1, 1, 1,
-0.3852468, 0.8587095, 1.399215, 1, 1, 1, 1, 1,
-0.3820062, 0.2609559, -1.810696, 1, 1, 1, 1, 1,
-0.3808421, -0.5804483, -2.55804, 1, 1, 1, 1, 1,
-0.3785203, 0.8210043, 0.05826569, 1, 1, 1, 1, 1,
-0.3763659, 0.1698337, -0.7031744, 1, 1, 1, 1, 1,
-0.3693909, -0.4846243, -4.351651, 1, 1, 1, 1, 1,
-0.3523215, -1.420504, -5.27594, 1, 1, 1, 1, 1,
-0.3515282, -1.157583, -0.4166743, 1, 1, 1, 1, 1,
-0.345452, -0.8754602, -2.298759, 0, 0, 1, 1, 1,
-0.342519, -0.4494316, -2.161726, 1, 0, 0, 1, 1,
-0.3419259, -0.3234308, -2.15308, 1, 0, 0, 1, 1,
-0.34178, 0.6299642, -0.7747262, 1, 0, 0, 1, 1,
-0.3404506, 1.253735, 0.8455697, 1, 0, 0, 1, 1,
-0.3393385, -1.543764, -3.709782, 1, 0, 0, 1, 1,
-0.338248, -0.08811903, -2.366348, 0, 0, 0, 1, 1,
-0.330743, -1.881096, -1.605723, 0, 0, 0, 1, 1,
-0.327848, -0.15508, -1.009305, 0, 0, 0, 1, 1,
-0.323901, -0.7980899, -1.99027, 0, 0, 0, 1, 1,
-0.3232609, 0.5024633, -0.03824792, 0, 0, 0, 1, 1,
-0.3229767, 0.9942577, 0.6399605, 0, 0, 0, 1, 1,
-0.3218636, 0.2422805, -0.9206082, 0, 0, 0, 1, 1,
-0.3153669, -1.758397, -2.649454, 1, 1, 1, 1, 1,
-0.3149478, 1.170841, -0.210197, 1, 1, 1, 1, 1,
-0.3147615, 0.0376399, -1.787882, 1, 1, 1, 1, 1,
-0.314325, 1.854185, -0.1219212, 1, 1, 1, 1, 1,
-0.3084798, 0.04714112, -0.9513524, 1, 1, 1, 1, 1,
-0.3081129, 1.056135, -0.03508797, 1, 1, 1, 1, 1,
-0.3044036, -1.541545, -2.603233, 1, 1, 1, 1, 1,
-0.3020745, 1.695833, 0.3674084, 1, 1, 1, 1, 1,
-0.2937938, -1.048356, -2.0009, 1, 1, 1, 1, 1,
-0.2927437, 0.3906364, -1.154918, 1, 1, 1, 1, 1,
-0.2915753, -1.136129, -4.424455, 1, 1, 1, 1, 1,
-0.2897856, 0.6903852, -1.336433, 1, 1, 1, 1, 1,
-0.28617, -0.6186866, -3.007451, 1, 1, 1, 1, 1,
-0.283421, -0.641022, -3.222731, 1, 1, 1, 1, 1,
-0.2765549, 0.7065284, 1.744783, 1, 1, 1, 1, 1,
-0.2754144, -0.8820166, -3.697462, 0, 0, 1, 1, 1,
-0.272438, 0.384796, -1.149437, 1, 0, 0, 1, 1,
-0.2687384, -0.4142964, -2.776604, 1, 0, 0, 1, 1,
-0.2646383, 0.1552049, -1.273319, 1, 0, 0, 1, 1,
-0.2645361, 0.01326532, -1.922172, 1, 0, 0, 1, 1,
-0.2527894, 0.8262048, 0.2243575, 1, 0, 0, 1, 1,
-0.2522171, -0.5437729, -2.551847, 0, 0, 0, 1, 1,
-0.2486365, -0.5526956, -3.649732, 0, 0, 0, 1, 1,
-0.2475864, -0.4950637, -3.250468, 0, 0, 0, 1, 1,
-0.2452266, 0.366018, -0.9901277, 0, 0, 0, 1, 1,
-0.2408916, -1.006053, -3.286704, 0, 0, 0, 1, 1,
-0.237601, -1.52099, -4.574526, 0, 0, 0, 1, 1,
-0.2371213, 2.329701, 0.4949257, 0, 0, 0, 1, 1,
-0.2354266, -0.04815042, -1.742203, 1, 1, 1, 1, 1,
-0.2333017, -0.216233, -2.450038, 1, 1, 1, 1, 1,
-0.2296285, -0.4111436, -1.439904, 1, 1, 1, 1, 1,
-0.22935, 0.07770219, -0.6206704, 1, 1, 1, 1, 1,
-0.2290675, 0.849722, -0.4032751, 1, 1, 1, 1, 1,
-0.2286481, -0.05721906, -1.025708, 1, 1, 1, 1, 1,
-0.2255259, -1.204875, -2.452309, 1, 1, 1, 1, 1,
-0.223588, 0.282872, -2.080896, 1, 1, 1, 1, 1,
-0.2187729, 1.231546, -2.875019, 1, 1, 1, 1, 1,
-0.2141761, -0.2556987, -1.906487, 1, 1, 1, 1, 1,
-0.2134983, -0.3052388, -1.45784, 1, 1, 1, 1, 1,
-0.210368, 0.9558473, -0.5982056, 1, 1, 1, 1, 1,
-0.2091501, -1.267656, -1.425781, 1, 1, 1, 1, 1,
-0.2035745, 0.7383116, -1.342802, 1, 1, 1, 1, 1,
-0.2024723, -0.264587, -2.507325, 1, 1, 1, 1, 1,
-0.2016174, 0.9838489, -1.747797, 0, 0, 1, 1, 1,
-0.196188, 0.7317222, 0.3462143, 1, 0, 0, 1, 1,
-0.1915949, 0.1531133, -0.3911022, 1, 0, 0, 1, 1,
-0.1872883, -0.5307672, -3.841194, 1, 0, 0, 1, 1,
-0.1856569, -1.027189, -2.494714, 1, 0, 0, 1, 1,
-0.1847277, 0.6829849, -0.3948972, 1, 0, 0, 1, 1,
-0.1846652, -0.2902413, -1.577219, 0, 0, 0, 1, 1,
-0.1845024, -0.5183138, -3.910231, 0, 0, 0, 1, 1,
-0.1842285, -0.9378523, -3.995623, 0, 0, 0, 1, 1,
-0.1832616, -1.37737, -2.592185, 0, 0, 0, 1, 1,
-0.1817255, -0.4773282, -4.060456, 0, 0, 0, 1, 1,
-0.1810787, 3.493137, -0.9287269, 0, 0, 0, 1, 1,
-0.1810011, -1.572712, -4.068053, 0, 0, 0, 1, 1,
-0.179945, -1.667722, -2.471096, 1, 1, 1, 1, 1,
-0.1781085, 0.3775966, -0.7687397, 1, 1, 1, 1, 1,
-0.1708525, -1.467156, -4.173841, 1, 1, 1, 1, 1,
-0.1686835, -0.6606617, -2.091774, 1, 1, 1, 1, 1,
-0.1661804, -1.52935, -4.589404, 1, 1, 1, 1, 1,
-0.1606406, -0.4868696, -2.113348, 1, 1, 1, 1, 1,
-0.1549144, -0.1205806, -2.38758, 1, 1, 1, 1, 1,
-0.1503934, 1.136211, -0.4226447, 1, 1, 1, 1, 1,
-0.1453437, -0.6526311, -3.616494, 1, 1, 1, 1, 1,
-0.1451886, 0.2731647, -0.3779385, 1, 1, 1, 1, 1,
-0.1448552, -0.6291676, -2.714732, 1, 1, 1, 1, 1,
-0.1420955, 1.334505, -0.09495662, 1, 1, 1, 1, 1,
-0.1418639, 1.266988, -0.2323619, 1, 1, 1, 1, 1,
-0.1413609, 1.305214, 0.8364807, 1, 1, 1, 1, 1,
-0.1319503, -1.20657, -1.895068, 1, 1, 1, 1, 1,
-0.1293148, -0.1203664, -0.9262877, 0, 0, 1, 1, 1,
-0.1268787, -0.4861386, -3.488464, 1, 0, 0, 1, 1,
-0.1230746, 1.320233, 0.1243924, 1, 0, 0, 1, 1,
-0.1221233, 0.6649443, -1.822247, 1, 0, 0, 1, 1,
-0.1218055, -0.2954141, -2.053958, 1, 0, 0, 1, 1,
-0.1211018, -0.9673218, -4.791876, 1, 0, 0, 1, 1,
-0.11684, 0.4529082, 1.32565, 0, 0, 0, 1, 1,
-0.1091222, -0.8402219, -4.784876, 0, 0, 0, 1, 1,
-0.1052611, 0.7419388, 0.4978642, 0, 0, 0, 1, 1,
-0.09629056, -0.490554, -2.008364, 0, 0, 0, 1, 1,
-0.09493498, 1.239432, 1.085082, 0, 0, 0, 1, 1,
-0.09390738, 1.816024, 0.6957937, 0, 0, 0, 1, 1,
-0.09129351, -0.6992294, -2.625624, 0, 0, 0, 1, 1,
-0.0861415, 0.455402, -0.4726947, 1, 1, 1, 1, 1,
-0.08554037, -0.6269138, -4.048329, 1, 1, 1, 1, 1,
-0.08116643, -0.997973, -3.261201, 1, 1, 1, 1, 1,
-0.07943733, 1.064824, -0.2649217, 1, 1, 1, 1, 1,
-0.07843035, -0.5128534, -2.877556, 1, 1, 1, 1, 1,
-0.07719272, -0.1684197, -2.63742, 1, 1, 1, 1, 1,
-0.07706998, 0.6762725, 1.740948, 1, 1, 1, 1, 1,
-0.07676195, -0.8579195, -2.099207, 1, 1, 1, 1, 1,
-0.0756586, -0.1712683, -2.500422, 1, 1, 1, 1, 1,
-0.07106796, 0.1208096, -1.199487, 1, 1, 1, 1, 1,
-0.07007135, -1.685696, -2.224411, 1, 1, 1, 1, 1,
-0.06882686, 0.9851493, -1.133077, 1, 1, 1, 1, 1,
-0.06468597, -1.342839, -3.301639, 1, 1, 1, 1, 1,
-0.05964666, 0.2062105, 0.1414998, 1, 1, 1, 1, 1,
-0.05909872, 1.370045, -2.640523, 1, 1, 1, 1, 1,
-0.0570512, -0.588976, -4.368684, 0, 0, 1, 1, 1,
-0.0562631, 0.8830405, -0.6904326, 1, 0, 0, 1, 1,
-0.05214424, -1.159448, -1.64572, 1, 0, 0, 1, 1,
-0.04773222, 1.284375, 0.7197583, 1, 0, 0, 1, 1,
-0.04634831, -0.4113486, -0.8999394, 1, 0, 0, 1, 1,
-0.04626188, 1.297626, 0.7363124, 1, 0, 0, 1, 1,
-0.03867301, -1.389228, -3.626847, 0, 0, 0, 1, 1,
-0.03826718, -0.07693256, -4.207252, 0, 0, 0, 1, 1,
-0.03811304, 0.2369928, -0.3741372, 0, 0, 0, 1, 1,
-0.0274484, 0.1753432, 0.6513188, 0, 0, 0, 1, 1,
-0.02539574, -0.3572527, -3.617293, 0, 0, 0, 1, 1,
-0.02436797, 0.702095, 0.7059545, 0, 0, 0, 1, 1,
-0.02186559, -0.408356, -3.010763, 0, 0, 0, 1, 1,
-0.02151819, 0.8800432, 0.3322589, 1, 1, 1, 1, 1,
-0.01918856, -0.3040861, -4.037225, 1, 1, 1, 1, 1,
-0.01396657, 2.000151, -0.6702158, 1, 1, 1, 1, 1,
-0.01173091, 0.7164435, 0.6798838, 1, 1, 1, 1, 1,
-0.01002314, 1.329379, 1.820842, 1, 1, 1, 1, 1,
-0.008509098, -1.075344, -3.201714, 1, 1, 1, 1, 1,
-0.006847976, 1.309112, -0.9376433, 1, 1, 1, 1, 1,
-0.006357788, 0.5274567, -0.4058414, 1, 1, 1, 1, 1,
-0.006166584, 1.957677, -1.022556, 1, 1, 1, 1, 1,
0.000875134, 0.7882728, -1.212231, 1, 1, 1, 1, 1,
0.008118234, -0.1123443, 2.751918, 1, 1, 1, 1, 1,
0.009328248, 0.1496406, 0.3333691, 1, 1, 1, 1, 1,
0.01606909, 0.6625516, 0.4372198, 1, 1, 1, 1, 1,
0.01675612, 1.385354, -1.142457, 1, 1, 1, 1, 1,
0.01750416, -0.8067589, 4.392311, 1, 1, 1, 1, 1,
0.017925, -0.2848678, 2.709621, 0, 0, 1, 1, 1,
0.02052862, -0.733291, 2.274866, 1, 0, 0, 1, 1,
0.02129418, -0.7140816, 1.376958, 1, 0, 0, 1, 1,
0.02392616, -0.05917976, 3.208673, 1, 0, 0, 1, 1,
0.02664433, 0.3630973, -0.9920663, 1, 0, 0, 1, 1,
0.0284192, 1.700574, 0.8206753, 1, 0, 0, 1, 1,
0.02922334, -0.1396771, 2.656616, 0, 0, 0, 1, 1,
0.03010693, -1.707071, 3.095258, 0, 0, 0, 1, 1,
0.03122379, 1.244221, 1.325161, 0, 0, 0, 1, 1,
0.03177257, 0.1190396, -0.2119712, 0, 0, 0, 1, 1,
0.03273526, -0.1240759, 2.349923, 0, 0, 0, 1, 1,
0.04398563, 0.2522376, -0.9512266, 0, 0, 0, 1, 1,
0.04525208, -1.468676, 1.45101, 0, 0, 0, 1, 1,
0.05066367, -1.284005, 1.608589, 1, 1, 1, 1, 1,
0.0511481, 1.418225, -1.531245, 1, 1, 1, 1, 1,
0.05665928, 0.2350489, 1.025824, 1, 1, 1, 1, 1,
0.05865169, 1.043549, -1.317197, 1, 1, 1, 1, 1,
0.05902756, -0.4203337, 2.96231, 1, 1, 1, 1, 1,
0.06468111, 0.1190401, 0.1625891, 1, 1, 1, 1, 1,
0.07179986, 1.17347, 0.3540605, 1, 1, 1, 1, 1,
0.07565647, -1.602666, 3.349524, 1, 1, 1, 1, 1,
0.07584309, 0.01414272, 0.04425596, 1, 1, 1, 1, 1,
0.07648311, -1.090727, 4.132179, 1, 1, 1, 1, 1,
0.07985631, 1.720882, -0.4830945, 1, 1, 1, 1, 1,
0.08472408, -0.1489259, 4.762094, 1, 1, 1, 1, 1,
0.08606692, -0.1914257, 2.265203, 1, 1, 1, 1, 1,
0.08777677, 1.44524, -0.4186337, 1, 1, 1, 1, 1,
0.0892062, 0.442071, 0.2741204, 1, 1, 1, 1, 1,
0.09497233, 0.0632442, 0.9598771, 0, 0, 1, 1, 1,
0.09570448, -1.740632, 3.337884, 1, 0, 0, 1, 1,
0.09724135, -0.8985787, 3.126168, 1, 0, 0, 1, 1,
0.1033445, -1.293807, 1.491277, 1, 0, 0, 1, 1,
0.1058674, 0.6072279, -0.9975182, 1, 0, 0, 1, 1,
0.1105084, 0.4085444, 0.5364262, 1, 0, 0, 1, 1,
0.1108372, 0.4532555, 1.743034, 0, 0, 0, 1, 1,
0.1174059, 1.097046, 0.1464502, 0, 0, 0, 1, 1,
0.1209159, 2.076641, 0.31006, 0, 0, 0, 1, 1,
0.1267356, -1.048601, 1.759805, 0, 0, 0, 1, 1,
0.1281841, -1.311663, 3.279845, 0, 0, 0, 1, 1,
0.1303138, -0.2336363, 3.967475, 0, 0, 0, 1, 1,
0.1319228, 0.4967299, -1.031077, 0, 0, 0, 1, 1,
0.1449761, 0.2481307, 0.6682863, 1, 1, 1, 1, 1,
0.1452409, 0.6281341, 1.461163, 1, 1, 1, 1, 1,
0.1454685, -0.89815, 2.899532, 1, 1, 1, 1, 1,
0.1480329, 1.423746, 0.6780697, 1, 1, 1, 1, 1,
0.1499446, -0.5637981, 4.369172, 1, 1, 1, 1, 1,
0.1501661, 0.07517336, 3.200058, 1, 1, 1, 1, 1,
0.1535434, 2.112611, -0.1007509, 1, 1, 1, 1, 1,
0.1546097, -0.2140452, 1.227497, 1, 1, 1, 1, 1,
0.1547066, -0.7865915, 4.452086, 1, 1, 1, 1, 1,
0.1565124, 0.2316706, 1.76688, 1, 1, 1, 1, 1,
0.1567587, 0.9325302, -0.8161188, 1, 1, 1, 1, 1,
0.1678164, -0.3098703, 2.465025, 1, 1, 1, 1, 1,
0.1682893, 0.7149025, 0.764459, 1, 1, 1, 1, 1,
0.1715195, -1.311752, 5.048432, 1, 1, 1, 1, 1,
0.1751509, 0.02854348, 0.7732671, 1, 1, 1, 1, 1,
0.1799074, -0.3799819, 2.624394, 0, 0, 1, 1, 1,
0.18113, -1.606986, 2.805342, 1, 0, 0, 1, 1,
0.1814977, -0.3472019, 1.580555, 1, 0, 0, 1, 1,
0.1832968, -0.4606192, 4.072552, 1, 0, 0, 1, 1,
0.1926425, 0.5450323, -0.4558766, 1, 0, 0, 1, 1,
0.1954083, -1.568998, 1.434932, 1, 0, 0, 1, 1,
0.196482, 0.9539854, -0.1714622, 0, 0, 0, 1, 1,
0.1966334, -1.281331, 3.244465, 0, 0, 0, 1, 1,
0.1991347, -1.53595, 2.472059, 0, 0, 0, 1, 1,
0.2026433, 1.128526, -0.7143751, 0, 0, 0, 1, 1,
0.2061577, 1.091238, 0.9972363, 0, 0, 0, 1, 1,
0.2069222, -0.1566302, 1.935363, 0, 0, 0, 1, 1,
0.2085279, -0.1288225, 0.8935771, 0, 0, 0, 1, 1,
0.2127173, 0.6788827, -0.7920144, 1, 1, 1, 1, 1,
0.2144137, 1.459676, 2.205268, 1, 1, 1, 1, 1,
0.2187019, -0.3401527, 2.823261, 1, 1, 1, 1, 1,
0.2218814, 0.2903694, 0.2718576, 1, 1, 1, 1, 1,
0.2249887, -0.5675114, 2.69584, 1, 1, 1, 1, 1,
0.2265053, -1.56375, 3.749201, 1, 1, 1, 1, 1,
0.227042, -0.4578238, 2.167487, 1, 1, 1, 1, 1,
0.2282511, -1.287341, 4.300934, 1, 1, 1, 1, 1,
0.2326653, -0.7438133, 0.74856, 1, 1, 1, 1, 1,
0.2330395, -0.2543046, 2.628804, 1, 1, 1, 1, 1,
0.2333657, -2.004275, 2.50576, 1, 1, 1, 1, 1,
0.2456307, -0.03802903, 1.386763, 1, 1, 1, 1, 1,
0.2458702, -1.437897, 2.97717, 1, 1, 1, 1, 1,
0.2507084, 0.2305095, -1.824955, 1, 1, 1, 1, 1,
0.2511451, -2.047164, 2.587228, 1, 1, 1, 1, 1,
0.2519005, 0.08511358, 1.83701, 0, 0, 1, 1, 1,
0.2542613, -0.3187172, 3.016579, 1, 0, 0, 1, 1,
0.2616735, 1.844496, -1.068469, 1, 0, 0, 1, 1,
0.2626164, 0.9641475, -1.068581, 1, 0, 0, 1, 1,
0.2674787, 0.3609889, 0.09259737, 1, 0, 0, 1, 1,
0.2722021, 0.223679, -0.2758119, 1, 0, 0, 1, 1,
0.2737639, -1.447341, 4.080815, 0, 0, 0, 1, 1,
0.2829767, -0.5512048, 2.199067, 0, 0, 0, 1, 1,
0.2835418, -0.4969116, 1.983399, 0, 0, 0, 1, 1,
0.2908723, -1.194931, 3.282716, 0, 0, 0, 1, 1,
0.3005874, -1.374612, 2.572538, 0, 0, 0, 1, 1,
0.3100404, -0.6395376, 2.630194, 0, 0, 0, 1, 1,
0.3210261, -0.8876123, 2.030766, 0, 0, 0, 1, 1,
0.3229574, -0.4208012, 2.169225, 1, 1, 1, 1, 1,
0.323679, 0.7588862, 0.2083318, 1, 1, 1, 1, 1,
0.3305384, -0.1296099, 0.6797777, 1, 1, 1, 1, 1,
0.3306888, 0.482646, -1.045279, 1, 1, 1, 1, 1,
0.3315848, -2.102602, 3.375254, 1, 1, 1, 1, 1,
0.3336022, -1.200529, 1.501263, 1, 1, 1, 1, 1,
0.3357365, -1.521911, 1.984897, 1, 1, 1, 1, 1,
0.3364818, -0.4163201, 0.3817042, 1, 1, 1, 1, 1,
0.3419439, -1.578876, 4.46437, 1, 1, 1, 1, 1,
0.3420902, -0.3985444, 1.865069, 1, 1, 1, 1, 1,
0.3443972, -2.154686, 1.495675, 1, 1, 1, 1, 1,
0.3459417, 0.1032278, 0.305476, 1, 1, 1, 1, 1,
0.3463019, 0.05961636, 2.168615, 1, 1, 1, 1, 1,
0.3475124, -0.5031125, 1.329764, 1, 1, 1, 1, 1,
0.3512159, -0.05471808, 1.798222, 1, 1, 1, 1, 1,
0.3533952, -0.1533384, 2.809645, 0, 0, 1, 1, 1,
0.3557324, 1.258237, 1.261071, 1, 0, 0, 1, 1,
0.3601743, 1.735499, 0.2184769, 1, 0, 0, 1, 1,
0.3609008, 0.05889269, 1.194154, 1, 0, 0, 1, 1,
0.3617612, 0.9650321, 0.5794151, 1, 0, 0, 1, 1,
0.3620321, -0.8973204, 2.338934, 1, 0, 0, 1, 1,
0.3670419, 2.198053, -0.9537157, 0, 0, 0, 1, 1,
0.372682, -1.03871, 1.500734, 0, 0, 0, 1, 1,
0.3743771, 1.827655, -0.4677733, 0, 0, 0, 1, 1,
0.3785742, 0.5948783, 0.3186826, 0, 0, 0, 1, 1,
0.3842879, -0.1794816, 2.495598, 0, 0, 0, 1, 1,
0.3880138, -0.5545778, 2.754516, 0, 0, 0, 1, 1,
0.3897211, -0.9641851, 2.39552, 0, 0, 0, 1, 1,
0.3904116, 1.401908, -0.6357805, 1, 1, 1, 1, 1,
0.3909968, -1.258277, 3.557088, 1, 1, 1, 1, 1,
0.3913264, 0.7532324, -0.01155, 1, 1, 1, 1, 1,
0.3930747, -2.315943, 3.581856, 1, 1, 1, 1, 1,
0.4011611, 2.086538, 2.778285, 1, 1, 1, 1, 1,
0.4078708, 1.321385, -0.09567932, 1, 1, 1, 1, 1,
0.4090575, -1.242107, 3.912661, 1, 1, 1, 1, 1,
0.4128343, -0.8392069, 1.468813, 1, 1, 1, 1, 1,
0.4132214, 0.8166047, 1.115867, 1, 1, 1, 1, 1,
0.4212504, -0.7928614, 4.890422, 1, 1, 1, 1, 1,
0.4217876, -0.5516335, 3.549424, 1, 1, 1, 1, 1,
0.4279858, 0.2724873, 1.350049, 1, 1, 1, 1, 1,
0.4287587, -1.150492, 3.894493, 1, 1, 1, 1, 1,
0.4331841, -1.29455, 2.974982, 1, 1, 1, 1, 1,
0.4335094, -0.1499635, 0.6775706, 1, 1, 1, 1, 1,
0.4358098, 0.2214248, 1.967483, 0, 0, 1, 1, 1,
0.4378253, 0.06146444, 0.4031916, 1, 0, 0, 1, 1,
0.4405487, -0.7516827, 5.199907, 1, 0, 0, 1, 1,
0.4445093, 0.2209074, 0.5251955, 1, 0, 0, 1, 1,
0.4474406, -0.2741394, 1.873817, 1, 0, 0, 1, 1,
0.4479388, -0.6506463, 0.2781332, 1, 0, 0, 1, 1,
0.4482861, -0.6265898, 1.926232, 0, 0, 0, 1, 1,
0.4520382, -0.09375338, 1.963178, 0, 0, 0, 1, 1,
0.4522845, -1.035556, 2.193775, 0, 0, 0, 1, 1,
0.4570115, -0.1456853, 2.638478, 0, 0, 0, 1, 1,
0.4611484, -0.8063447, 3.691711, 0, 0, 0, 1, 1,
0.4628434, -0.1880996, 2.316346, 0, 0, 0, 1, 1,
0.4635232, -1.860213, 3.57787, 0, 0, 0, 1, 1,
0.4659254, -1.365006, 2.365735, 1, 1, 1, 1, 1,
0.4666767, 0.2501667, 0.8985836, 1, 1, 1, 1, 1,
0.4698361, 1.211894, -2.3569, 1, 1, 1, 1, 1,
0.4714521, 1.806981, 0.2794461, 1, 1, 1, 1, 1,
0.4731506, -0.3836495, 2.028419, 1, 1, 1, 1, 1,
0.4745453, -0.7412463, 1.954855, 1, 1, 1, 1, 1,
0.4766093, 0.710995, 0.8355458, 1, 1, 1, 1, 1,
0.481024, -0.01233571, 2.498005, 1, 1, 1, 1, 1,
0.4887012, 0.6602914, -0.03182993, 1, 1, 1, 1, 1,
0.4913841, 0.5118315, 0.1055609, 1, 1, 1, 1, 1,
0.4969586, -1.2152, 2.68358, 1, 1, 1, 1, 1,
0.497256, -0.02755746, 0.3934447, 1, 1, 1, 1, 1,
0.4998688, 0.401753, 1.253517, 1, 1, 1, 1, 1,
0.5012025, -0.01684974, 1.115234, 1, 1, 1, 1, 1,
0.5014966, 0.1478134, 1.136333, 1, 1, 1, 1, 1,
0.5057904, 1.044375, 2.075994, 0, 0, 1, 1, 1,
0.5062464, -1.132312, 2.63235, 1, 0, 0, 1, 1,
0.5069834, 0.3265615, 1.10076, 1, 0, 0, 1, 1,
0.5172271, -0.1033272, 2.511828, 1, 0, 0, 1, 1,
0.5184287, -0.3885683, 5.208506, 1, 0, 0, 1, 1,
0.519436, -0.8685308, 3.324749, 1, 0, 0, 1, 1,
0.5203551, -0.7567434, 1.622222, 0, 0, 0, 1, 1,
0.5206297, 1.558361, 1.647143, 0, 0, 0, 1, 1,
0.5214319, -0.2884899, 2.661602, 0, 0, 0, 1, 1,
0.5264376, -0.1519075, -0.4223289, 0, 0, 0, 1, 1,
0.5376697, 1.439501, 0.5403494, 0, 0, 0, 1, 1,
0.5470638, 0.6463593, 0.6557649, 0, 0, 0, 1, 1,
0.5482282, -0.2936562, 1.212847, 0, 0, 0, 1, 1,
0.5522969, -0.6384992, 3.139296, 1, 1, 1, 1, 1,
0.5547879, -1.603748, 2.674937, 1, 1, 1, 1, 1,
0.5589274, 1.122807, -1.672566, 1, 1, 1, 1, 1,
0.567196, -0.1378935, 1.558119, 1, 1, 1, 1, 1,
0.5677103, -0.5298846, 3.660866, 1, 1, 1, 1, 1,
0.5839757, 0.01767623, 1.041129, 1, 1, 1, 1, 1,
0.5845277, 1.805096, 0.1107879, 1, 1, 1, 1, 1,
0.5935634, 0.3369427, 2.414521, 1, 1, 1, 1, 1,
0.5963417, -0.4788703, 2.12935, 1, 1, 1, 1, 1,
0.5971605, -0.2585036, 0.9877885, 1, 1, 1, 1, 1,
0.601314, 0.6487668, 0.3894889, 1, 1, 1, 1, 1,
0.6013222, -0.6999876, 4.030623, 1, 1, 1, 1, 1,
0.6016092, 1.463702, -0.5508832, 1, 1, 1, 1, 1,
0.6137117, -0.08407925, 1.170478, 1, 1, 1, 1, 1,
0.6164894, -0.4192645, 2.536632, 1, 1, 1, 1, 1,
0.6208075, -0.05133934, 2.85743, 0, 0, 1, 1, 1,
0.6243365, 1.161758, 1.427816, 1, 0, 0, 1, 1,
0.6246318, -0.1532946, -0.2951716, 1, 0, 0, 1, 1,
0.6263604, -0.6423842, 3.753539, 1, 0, 0, 1, 1,
0.6351779, -0.3544364, 3.603361, 1, 0, 0, 1, 1,
0.6374937, -1.243843, 3.150233, 1, 0, 0, 1, 1,
0.6406918, 0.08612157, 2.434844, 0, 0, 0, 1, 1,
0.6430866, 0.5293534, 0.2998443, 0, 0, 0, 1, 1,
0.6459183, 0.2858628, 0.2897412, 0, 0, 0, 1, 1,
0.6494141, 0.8647597, 0.7465935, 0, 0, 0, 1, 1,
0.6546619, -1.338703, 2.573988, 0, 0, 0, 1, 1,
0.6588916, -0.1487177, 0.9467126, 0, 0, 0, 1, 1,
0.6590143, 0.2476803, 0.3876885, 0, 0, 0, 1, 1,
0.6618248, 0.6526791, 1.378901, 1, 1, 1, 1, 1,
0.6644523, -1.253622, 1.6139, 1, 1, 1, 1, 1,
0.6664645, 0.8597652, 0.05041819, 1, 1, 1, 1, 1,
0.6668903, -0.300698, 3.721148, 1, 1, 1, 1, 1,
0.6687785, 0.05733106, 1.547259, 1, 1, 1, 1, 1,
0.6689343, 0.6902394, 2.252853, 1, 1, 1, 1, 1,
0.6699407, -1.188451, 2.058624, 1, 1, 1, 1, 1,
0.6703041, -0.4628685, 1.275953, 1, 1, 1, 1, 1,
0.6742514, -0.9490449, 0.637449, 1, 1, 1, 1, 1,
0.6798901, 1.168572, -0.5581927, 1, 1, 1, 1, 1,
0.6804118, 0.6439099, 0.4083856, 1, 1, 1, 1, 1,
0.6810864, 0.09119505, 1.509618, 1, 1, 1, 1, 1,
0.6816533, 2.278574, 0.2984703, 1, 1, 1, 1, 1,
0.6826271, 1.250958, 1.564332, 1, 1, 1, 1, 1,
0.6830742, 0.2627047, 1.00158, 1, 1, 1, 1, 1,
0.6837867, 0.9671718, 0.4495268, 0, 0, 1, 1, 1,
0.6857627, 1.444391, 1.569218, 1, 0, 0, 1, 1,
0.6882024, 2.006256, -1.395744, 1, 0, 0, 1, 1,
0.6898507, 1.246404, 0.1838396, 1, 0, 0, 1, 1,
0.6904134, 1.66272, 0.4581616, 1, 0, 0, 1, 1,
0.6955822, -0.08959568, 0.8104469, 1, 0, 0, 1, 1,
0.6979312, 1.036128, -0.07038881, 0, 0, 0, 1, 1,
0.6984795, -0.6044101, 1.396585, 0, 0, 0, 1, 1,
0.6988376, -0.7065656, 3.411124, 0, 0, 0, 1, 1,
0.7017553, 1.228246, 0.4323807, 0, 0, 0, 1, 1,
0.7083697, -1.341483, 3.107122, 0, 0, 0, 1, 1,
0.7111216, -0.5325301, 3.431181, 0, 0, 0, 1, 1,
0.7138259, -0.3166349, 1.754785, 0, 0, 0, 1, 1,
0.7142982, -0.08987589, 2.704324, 1, 1, 1, 1, 1,
0.7159103, -0.882811, 2.798792, 1, 1, 1, 1, 1,
0.7189808, -0.2246665, 2.20185, 1, 1, 1, 1, 1,
0.7205316, 1.083786, -0.5770573, 1, 1, 1, 1, 1,
0.7224823, 0.704653, 0.5726483, 1, 1, 1, 1, 1,
0.7243662, -1.729471, 2.802753, 1, 1, 1, 1, 1,
0.7258432, -0.6836229, 2.42226, 1, 1, 1, 1, 1,
0.7303697, -1.443303, 2.762144, 1, 1, 1, 1, 1,
0.7329535, -1.778385, 2.520449, 1, 1, 1, 1, 1,
0.7331111, -0.7029179, 1.885739, 1, 1, 1, 1, 1,
0.7345303, -1.026582, 2.95538, 1, 1, 1, 1, 1,
0.7399954, 1.477179, 1.279354, 1, 1, 1, 1, 1,
0.7418322, -1.719943, 2.3246, 1, 1, 1, 1, 1,
0.7438323, 0.3953307, 1.023762, 1, 1, 1, 1, 1,
0.7450919, 0.2168474, 1.283143, 1, 1, 1, 1, 1,
0.7474227, 1.37725, 0.3140711, 0, 0, 1, 1, 1,
0.7511851, 1.474692, 0.7609835, 1, 0, 0, 1, 1,
0.7594066, 0.2666167, 0.1332697, 1, 0, 0, 1, 1,
0.7610257, 1.716358, 1.774314, 1, 0, 0, 1, 1,
0.7629873, 0.5636725, 0.4775322, 1, 0, 0, 1, 1,
0.7647101, -0.3948812, 1.675799, 1, 0, 0, 1, 1,
0.7647241, 0.3064265, 1.112084, 0, 0, 0, 1, 1,
0.764905, 2.089603, 1.180347, 0, 0, 0, 1, 1,
0.7667001, -1.66836, 2.513887, 0, 0, 0, 1, 1,
0.7669998, 0.07450716, 0.661656, 0, 0, 0, 1, 1,
0.7674681, 1.223075, -0.7228866, 0, 0, 0, 1, 1,
0.7721207, 1.072854, 0.3924221, 0, 0, 0, 1, 1,
0.7733211, 1.770862, 1.689132, 0, 0, 0, 1, 1,
0.7735361, -0.3552306, 0.9359649, 1, 1, 1, 1, 1,
0.7744091, -0.09273735, 0.9479017, 1, 1, 1, 1, 1,
0.774889, 0.5652403, 2.3961, 1, 1, 1, 1, 1,
0.7765443, -0.4452494, 1.415013, 1, 1, 1, 1, 1,
0.7782806, -0.4933591, 0.5681418, 1, 1, 1, 1, 1,
0.7803527, 0.4413964, 0.8888742, 1, 1, 1, 1, 1,
0.7809044, -0.1170811, 1.763736, 1, 1, 1, 1, 1,
0.7825761, -0.2030776, 0.9656156, 1, 1, 1, 1, 1,
0.7863556, 2.174825, -0.3466517, 1, 1, 1, 1, 1,
0.789749, 0.4035147, 0.1687031, 1, 1, 1, 1, 1,
0.7906417, -0.7913987, 1.713632, 1, 1, 1, 1, 1,
0.7918066, 2.650628, 0.06506479, 1, 1, 1, 1, 1,
0.7946676, -0.1302316, 2.171376, 1, 1, 1, 1, 1,
0.7984965, 1.343176, 3.653495, 1, 1, 1, 1, 1,
0.8007662, -0.4195861, 3.292678, 1, 1, 1, 1, 1,
0.8012818, 0.1238752, 0.04275483, 0, 0, 1, 1, 1,
0.8039014, 0.9572625, 1.537861, 1, 0, 0, 1, 1,
0.8049798, -1.770572, 3.315877, 1, 0, 0, 1, 1,
0.8079519, 0.3565379, 1.534915, 1, 0, 0, 1, 1,
0.8121465, -0.1519997, 2.483276, 1, 0, 0, 1, 1,
0.8128163, 0.8546146, 2.492028, 1, 0, 0, 1, 1,
0.8166934, -0.6961507, 1.850533, 0, 0, 0, 1, 1,
0.8212609, -0.5716567, 2.300206, 0, 0, 0, 1, 1,
0.8311967, -0.1669778, 1.847694, 0, 0, 0, 1, 1,
0.8321986, 0.2156825, 1.378818, 0, 0, 0, 1, 1,
0.8335128, 0.4023133, 0.4694117, 0, 0, 0, 1, 1,
0.8361998, 0.1042377, 0.4269126, 0, 0, 0, 1, 1,
0.8378555, -0.06592089, 1.486436, 0, 0, 0, 1, 1,
0.8416682, 0.08717981, 0.7635823, 1, 1, 1, 1, 1,
0.8429908, -0.1162159, 1.244171, 1, 1, 1, 1, 1,
0.8442678, 0.775225, 0.3861608, 1, 1, 1, 1, 1,
0.8448902, -0.6518857, 2.614023, 1, 1, 1, 1, 1,
0.8537002, 0.159927, 2.984201, 1, 1, 1, 1, 1,
0.8627254, -0.5768406, 0.9214846, 1, 1, 1, 1, 1,
0.8651649, 0.4012884, 0.5918893, 1, 1, 1, 1, 1,
0.8668993, 0.1647098, 0.6310444, 1, 1, 1, 1, 1,
0.8794796, -1.113036, 2.738683, 1, 1, 1, 1, 1,
0.879719, 0.6346529, 0.4554572, 1, 1, 1, 1, 1,
0.8800766, -2.255999, 3.815284, 1, 1, 1, 1, 1,
0.8816216, 0.08750591, 3.305417, 1, 1, 1, 1, 1,
0.8826646, -0.2750204, 1.749218, 1, 1, 1, 1, 1,
0.8861905, -0.5262207, 3.365717, 1, 1, 1, 1, 1,
0.8871639, -1.804497, 2.205275, 1, 1, 1, 1, 1,
0.8903968, -1.564102, 3.136059, 0, 0, 1, 1, 1,
0.8904355, -0.5861825, 0.9290291, 1, 0, 0, 1, 1,
0.8950301, -0.6664309, 3.374324, 1, 0, 0, 1, 1,
0.8951403, 0.9835858, 0.8726595, 1, 0, 0, 1, 1,
0.898815, 0.8168574, -0.2520742, 1, 0, 0, 1, 1,
0.9048109, -0.1018553, 1.541551, 1, 0, 0, 1, 1,
0.9069777, 0.11615, 1.709175, 0, 0, 0, 1, 1,
0.911207, -1.490492, 4.000272, 0, 0, 0, 1, 1,
0.9136358, -1.252621, 4.539512, 0, 0, 0, 1, 1,
0.9150366, 1.126819, 1.979553, 0, 0, 0, 1, 1,
0.9194069, -0.2968547, 2.284647, 0, 0, 0, 1, 1,
0.9243808, 0.0009896918, 1.717891, 0, 0, 0, 1, 1,
0.9255034, 1.457347, 0.9028176, 0, 0, 0, 1, 1,
0.9361517, -1.720873, 3.585388, 1, 1, 1, 1, 1,
0.9383294, -2.312454, 2.036367, 1, 1, 1, 1, 1,
0.9475889, -1.457292, 2.72651, 1, 1, 1, 1, 1,
0.9480608, 0.2677389, 1.826221, 1, 1, 1, 1, 1,
0.9489922, 1.080688, 0.605059, 1, 1, 1, 1, 1,
0.9560778, 1.022148, 1.670036, 1, 1, 1, 1, 1,
0.9614391, 0.1100025, 2.303736, 1, 1, 1, 1, 1,
0.9617267, 1.406329, 0.9993628, 1, 1, 1, 1, 1,
0.962359, 0.8224159, 0.9782004, 1, 1, 1, 1, 1,
0.9634168, -1.327004, 2.809183, 1, 1, 1, 1, 1,
0.9640086, 0.6652098, 1.5598, 1, 1, 1, 1, 1,
0.9665652, -0.3737348, 2.246146, 1, 1, 1, 1, 1,
0.9728554, 0.320408, -0.415236, 1, 1, 1, 1, 1,
0.9737384, -1.248312, 3.206445, 1, 1, 1, 1, 1,
0.9761451, 0.1489034, 0.4908121, 1, 1, 1, 1, 1,
0.9840977, 0.5715704, 0.2644806, 0, 0, 1, 1, 1,
0.9869401, 1.592205, 0.5691671, 1, 0, 0, 1, 1,
0.9877877, -0.07276146, 0.3946116, 1, 0, 0, 1, 1,
0.9928888, 0.148465, 0.8841664, 1, 0, 0, 1, 1,
1.00308, -0.01314457, 0.6455881, 1, 0, 0, 1, 1,
1.00387, 3.254495, 0.3195811, 1, 0, 0, 1, 1,
1.00533, -0.7382995, 1.692232, 0, 0, 0, 1, 1,
1.006519, -0.2601012, 1.942088, 0, 0, 0, 1, 1,
1.008154, -2.64009, 1.296171, 0, 0, 0, 1, 1,
1.012368, 0.3512729, 2.809062, 0, 0, 0, 1, 1,
1.015027, -0.81374, 2.03418, 0, 0, 0, 1, 1,
1.022683, 0.2531944, 1.978959, 0, 0, 0, 1, 1,
1.023077, 0.3397085, 2.902798, 0, 0, 0, 1, 1,
1.025276, 0.1851041, 3.320911, 1, 1, 1, 1, 1,
1.025657, -0.3235383, 1.39476, 1, 1, 1, 1, 1,
1.03168, -0.1488537, 3.685804, 1, 1, 1, 1, 1,
1.032473, 0.2586527, 2.351287, 1, 1, 1, 1, 1,
1.034344, 0.817549, -0.05845321, 1, 1, 1, 1, 1,
1.038889, 0.9368851, 0.6771426, 1, 1, 1, 1, 1,
1.039454, -0.6408186, 2.72213, 1, 1, 1, 1, 1,
1.043641, -0.210084, 1.672944, 1, 1, 1, 1, 1,
1.048211, 1.589332, 1.20587, 1, 1, 1, 1, 1,
1.048995, -0.338781, 3.279238, 1, 1, 1, 1, 1,
1.053503, -0.8747285, 1.899358, 1, 1, 1, 1, 1,
1.055221, -0.7501123, 2.797092, 1, 1, 1, 1, 1,
1.060404, 0.7046586, 0.1690529, 1, 1, 1, 1, 1,
1.068304, -0.1398558, 0.753383, 1, 1, 1, 1, 1,
1.075639, -0.9694421, 1.479724, 1, 1, 1, 1, 1,
1.075997, -1.568693, 1.782539, 0, 0, 1, 1, 1,
1.07884, 0.3476966, 1.517528, 1, 0, 0, 1, 1,
1.082547, -0.3887986, 1.225479, 1, 0, 0, 1, 1,
1.086278, -0.08297653, 2.996868, 1, 0, 0, 1, 1,
1.098166, 0.843749, 0.9583994, 1, 0, 0, 1, 1,
1.104853, 0.9359906, 0.9949206, 1, 0, 0, 1, 1,
1.106393, -0.2797897, 2.555561, 0, 0, 0, 1, 1,
1.109365, 1.298833, -1.070269, 0, 0, 0, 1, 1,
1.115752, -0.9759625, 1.866808, 0, 0, 0, 1, 1,
1.129026, 0.04802171, 1.624163, 0, 0, 0, 1, 1,
1.131271, 0.8893248, 1.630439, 0, 0, 0, 1, 1,
1.134066, 0.7035603, 0.6130744, 0, 0, 0, 1, 1,
1.134078, 0.7278659, 1.885016, 0, 0, 0, 1, 1,
1.137455, 0.6156991, 1.046218, 1, 1, 1, 1, 1,
1.138905, 0.5586572, 0.1266293, 1, 1, 1, 1, 1,
1.141854, -0.2213015, 0.8110417, 1, 1, 1, 1, 1,
1.147547, 1.143831, 0.5347216, 1, 1, 1, 1, 1,
1.150133, 0.515709, -0.2373151, 1, 1, 1, 1, 1,
1.153247, 0.5548369, 2.205553, 1, 1, 1, 1, 1,
1.15435, -0.4233, 3.906945, 1, 1, 1, 1, 1,
1.157529, -1.060107, 2.952991, 1, 1, 1, 1, 1,
1.15906, 0.2719037, 1.323674, 1, 1, 1, 1, 1,
1.166911, -0.001463822, 1.679633, 1, 1, 1, 1, 1,
1.168643, 0.07228384, 2.648782, 1, 1, 1, 1, 1,
1.173457, 0.9300588, 0.9237823, 1, 1, 1, 1, 1,
1.180117, -0.09606246, 1.752329, 1, 1, 1, 1, 1,
1.184577, -0.1084893, 2.04956, 1, 1, 1, 1, 1,
1.186249, -0.1740044, 0.3615749, 1, 1, 1, 1, 1,
1.187002, -1.230455, 3.656939, 0, 0, 1, 1, 1,
1.189061, 0.5665218, 1.379975, 1, 0, 0, 1, 1,
1.189248, -0.6638187, 1.501233, 1, 0, 0, 1, 1,
1.189401, -0.2991792, 0.6300865, 1, 0, 0, 1, 1,
1.201871, 0.936619, -0.8320389, 1, 0, 0, 1, 1,
1.214199, 0.2000055, 1.387389, 1, 0, 0, 1, 1,
1.221592, 0.8901886, 1.381837, 0, 0, 0, 1, 1,
1.228791, 1.950091, 0.3695617, 0, 0, 0, 1, 1,
1.23407, 1.544958, 2.985157, 0, 0, 0, 1, 1,
1.240358, -0.7943056, 2.816338, 0, 0, 0, 1, 1,
1.245794, -0.9058735, 3.086654, 0, 0, 0, 1, 1,
1.248375, -0.06070286, 1.650655, 0, 0, 0, 1, 1,
1.249106, 1.372387, 0.08775058, 0, 0, 0, 1, 1,
1.259455, -0.3529604, 1.353574, 1, 1, 1, 1, 1,
1.267105, 0.1034993, 2.103814, 1, 1, 1, 1, 1,
1.268156, 0.309603, 2.195067, 1, 1, 1, 1, 1,
1.283796, -0.2607908, 2.341303, 1, 1, 1, 1, 1,
1.286717, 0.7263275, 0.5860988, 1, 1, 1, 1, 1,
1.287649, -0.1819059, 2.967904, 1, 1, 1, 1, 1,
1.295309, 0.7044671, 2.351729, 1, 1, 1, 1, 1,
1.300745, 0.7448621, 1.034032, 1, 1, 1, 1, 1,
1.309912, -0.8907905, 1.713707, 1, 1, 1, 1, 1,
1.326231, -2.055199, 3.806175, 1, 1, 1, 1, 1,
1.330783, -0.6025021, 3.170987, 1, 1, 1, 1, 1,
1.331663, -1.664175, 2.319405, 1, 1, 1, 1, 1,
1.334829, 0.1024412, -0.7993799, 1, 1, 1, 1, 1,
1.342969, -0.9462624, 2.69662, 1, 1, 1, 1, 1,
1.346298, 0.3920753, 1.531282, 1, 1, 1, 1, 1,
1.347535, -0.2349726, 3.752653, 0, 0, 1, 1, 1,
1.353603, -0.295837, 2.443343, 1, 0, 0, 1, 1,
1.355033, 0.7804672, -0.4606507, 1, 0, 0, 1, 1,
1.367837, 1.370555, 1.576105, 1, 0, 0, 1, 1,
1.375383, 1.52102, 1.469728, 1, 0, 0, 1, 1,
1.387877, 0.6442857, 2.070191, 1, 0, 0, 1, 1,
1.388379, 2.304661, 1.923447, 0, 0, 0, 1, 1,
1.400626, 0.02298803, 1.368396, 0, 0, 0, 1, 1,
1.400989, 0.09220976, -0.3673197, 0, 0, 0, 1, 1,
1.408754, 0.5926722, 1.007527, 0, 0, 0, 1, 1,
1.410521, 0.00382487, 1.311665, 0, 0, 0, 1, 1,
1.412226, 0.2948142, -0.4014384, 0, 0, 0, 1, 1,
1.419651, -1.582889, 1.769246, 0, 0, 0, 1, 1,
1.420842, -1.951847, 3.267982, 1, 1, 1, 1, 1,
1.42188, 1.029446, 0.8125384, 1, 1, 1, 1, 1,
1.424659, 0.08862232, 0.6594073, 1, 1, 1, 1, 1,
1.432647, -2.448082, 1.64441, 1, 1, 1, 1, 1,
1.434072, 0.7758547, 1.460244, 1, 1, 1, 1, 1,
1.435673, 0.2294382, 2.29796, 1, 1, 1, 1, 1,
1.436053, -0.7556262, 3.244845, 1, 1, 1, 1, 1,
1.485899, -0.467926, 1.924881, 1, 1, 1, 1, 1,
1.502855, 0.5214285, 0.4437717, 1, 1, 1, 1, 1,
1.50999, -0.3102224, 1.643323, 1, 1, 1, 1, 1,
1.521739, 1.723729, 0.7001225, 1, 1, 1, 1, 1,
1.530334, 0.5029669, 2.366502, 1, 1, 1, 1, 1,
1.531495, -1.288609, 1.76463, 1, 1, 1, 1, 1,
1.537444, 1.1888, -0.2804772, 1, 1, 1, 1, 1,
1.544487, -1.177179, 2.35191, 1, 1, 1, 1, 1,
1.547215, -1.637589, 2.208695, 0, 0, 1, 1, 1,
1.563699, -0.6838992, 0.02584426, 1, 0, 0, 1, 1,
1.566273, -0.9770036, 2.55629, 1, 0, 0, 1, 1,
1.571257, 0.2138761, 2.032081, 1, 0, 0, 1, 1,
1.575992, 0.1246153, 3.11413, 1, 0, 0, 1, 1,
1.576344, -1.292055, 2.713546, 1, 0, 0, 1, 1,
1.578737, -2.777564, 1.968796, 0, 0, 0, 1, 1,
1.585426, -2.095981, 3.19785, 0, 0, 0, 1, 1,
1.58677, -1.051639, 2.305161, 0, 0, 0, 1, 1,
1.593279, -1.525882, 2.41163, 0, 0, 0, 1, 1,
1.598826, -1.800175, 2.754752, 0, 0, 0, 1, 1,
1.602388, 1.01146, 2.040126, 0, 0, 0, 1, 1,
1.615652, 0.136699, 3.735373, 0, 0, 0, 1, 1,
1.616363, 0.6594688, 0.03134411, 1, 1, 1, 1, 1,
1.646533, -1.50702, 4.397991, 1, 1, 1, 1, 1,
1.651636, 0.08649878, 1.165505, 1, 1, 1, 1, 1,
1.662072, -1.100306, 4.060759, 1, 1, 1, 1, 1,
1.694199, 1.594136, 1.000033, 1, 1, 1, 1, 1,
1.699676, -1.802904, 2.991579, 1, 1, 1, 1, 1,
1.711571, -0.3735305, 1.983869, 1, 1, 1, 1, 1,
1.716578, 0.6033888, 1.425838, 1, 1, 1, 1, 1,
1.720574, 1.98706, 2.842328, 1, 1, 1, 1, 1,
1.74245, -2.461293, 1.117628, 1, 1, 1, 1, 1,
1.748351, 0.7490022, 0.4251243, 1, 1, 1, 1, 1,
1.756287, 0.9139639, 2.234736, 1, 1, 1, 1, 1,
1.760084, 2.138289, 0.6627006, 1, 1, 1, 1, 1,
1.763259, 1.238828, 1.975093, 1, 1, 1, 1, 1,
1.76378, 0.399064, 1.290057, 1, 1, 1, 1, 1,
1.785138, 0.9831371, 1.510018, 0, 0, 1, 1, 1,
1.789599, 0.6425917, 0.9273892, 1, 0, 0, 1, 1,
1.79001, 0.9791498, -0.07050085, 1, 0, 0, 1, 1,
1.797164, -0.2599, 1.250584, 1, 0, 0, 1, 1,
1.797469, 2.902212, -0.8146338, 1, 0, 0, 1, 1,
1.832911, -1.738469, 1.769773, 1, 0, 0, 1, 1,
1.838761, -0.9236485, 2.080737, 0, 0, 0, 1, 1,
1.841186, 0.6233327, 1.954476, 0, 0, 0, 1, 1,
1.848241, 0.132227, 0.3727785, 0, 0, 0, 1, 1,
1.857477, -0.4118353, 1.699649, 0, 0, 0, 1, 1,
1.868976, 0.6270072, 1.006406, 0, 0, 0, 1, 1,
1.871616, -1.779069, 1.706048, 0, 0, 0, 1, 1,
1.91355, 0.3403487, 2.373602, 0, 0, 0, 1, 1,
1.923151, -0.08461929, 2.324313, 1, 1, 1, 1, 1,
1.93959, -0.1320284, -0.2392474, 1, 1, 1, 1, 1,
1.952672, -1.328353, 2.173001, 1, 1, 1, 1, 1,
1.96346, -0.053749, 0.7619532, 1, 1, 1, 1, 1,
1.970554, 0.2730812, 1.146982, 1, 1, 1, 1, 1,
2.019252, 2.071218, -0.7950074, 1, 1, 1, 1, 1,
2.07415, -0.0742132, 0.01758102, 1, 1, 1, 1, 1,
2.075357, 0.2134754, 0.4678183, 1, 1, 1, 1, 1,
2.07612, 0.04544897, 1.169129, 1, 1, 1, 1, 1,
2.082151, -0.4938996, 2.764588, 1, 1, 1, 1, 1,
2.092264, -1.187896, 3.909312, 1, 1, 1, 1, 1,
2.108453, 1.030143, 0.8253378, 1, 1, 1, 1, 1,
2.114496, -0.5033028, 1.7054, 1, 1, 1, 1, 1,
2.120816, -0.3655921, 1.677619, 1, 1, 1, 1, 1,
2.163401, -0.03657539, 0.6357247, 1, 1, 1, 1, 1,
2.222506, 0.2064127, 0.9655244, 0, 0, 1, 1, 1,
2.243781, 0.2352537, 0.9799734, 1, 0, 0, 1, 1,
2.286744, -1.256639, 1.992077, 1, 0, 0, 1, 1,
2.298997, 1.28203, -0.2264144, 1, 0, 0, 1, 1,
2.335433, -1.165648, 1.806385, 1, 0, 0, 1, 1,
2.337489, -1.421993, -0.004984796, 1, 0, 0, 1, 1,
2.397354, 0.7267847, -0.21527, 0, 0, 0, 1, 1,
2.425606, -0.7581817, 1.60022, 0, 0, 0, 1, 1,
2.449933, -1.556405, 2.584598, 0, 0, 0, 1, 1,
2.473849, -0.472499, 1.226762, 0, 0, 0, 1, 1,
2.531902, -1.116095, 0.508847, 0, 0, 0, 1, 1,
2.643877, -1.553718, 2.367222, 0, 0, 0, 1, 1,
2.745331, 0.5022193, 0.4239556, 0, 0, 0, 1, 1,
2.776697, 1.630993, 0.1050382, 1, 1, 1, 1, 1,
2.796942, 1.164118, 1.37543, 1, 1, 1, 1, 1,
2.830644, 0.3665582, 1.750349, 1, 1, 1, 1, 1,
2.910313, -0.2657333, 2.329524, 1, 1, 1, 1, 1,
3.176313, 0.1438696, 1.997319, 1, 1, 1, 1, 1,
3.42276, -0.4540232, 1.998974, 1, 1, 1, 1, 1,
3.645416, 1.491341, 0.04268076, 1, 1, 1, 1, 1
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
var radius = 9.576327;
var distance = 33.63644;
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
mvMatrix.translate( -0.2042842, -0.3577864, 0.03371692 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.63644);
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