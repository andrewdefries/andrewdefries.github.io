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
-3.564121, 0.01762405, -2.516613, 1, 0, 0, 1,
-3.438878, 0.3532355, -0.7168717, 1, 0.007843138, 0, 1,
-3.1904, 1.338295, -1.004487, 1, 0.01176471, 0, 1,
-2.922552, -1.181653, -1.302735, 1, 0.01960784, 0, 1,
-2.856058, -1.017196, -1.996882, 1, 0.02352941, 0, 1,
-2.82225, 0.6155157, -1.75985, 1, 0.03137255, 0, 1,
-2.792189, -0.7191485, -2.764324, 1, 0.03529412, 0, 1,
-2.788891, -0.8666068, -1.462031, 1, 0.04313726, 0, 1,
-2.618286, -2.498151, -2.688078, 1, 0.04705882, 0, 1,
-2.58312, -0.499868, -1.407101, 1, 0.05490196, 0, 1,
-2.541749, 1.130104, -0.6090868, 1, 0.05882353, 0, 1,
-2.412773, -0.252525, -1.481318, 1, 0.06666667, 0, 1,
-2.253321, 0.7727793, 0.431178, 1, 0.07058824, 0, 1,
-2.212403, 0.6140296, -1.207961, 1, 0.07843138, 0, 1,
-2.184183, -1.529733, -1.064341, 1, 0.08235294, 0, 1,
-2.169214, 0.4945624, -1.128419, 1, 0.09019608, 0, 1,
-2.144974, 0.8536003, -1.512145, 1, 0.09411765, 0, 1,
-2.126961, 0.3879262, -0.8519951, 1, 0.1019608, 0, 1,
-2.105917, -0.6366194, -2.691737, 1, 0.1098039, 0, 1,
-2.084764, -1.179403, -3.019386, 1, 0.1137255, 0, 1,
-2.078659, -0.6116898, -0.8721361, 1, 0.1215686, 0, 1,
-2.070709, 1.421931, -0.5515772, 1, 0.1254902, 0, 1,
-2.032908, -0.9007307, -2.870238, 1, 0.1333333, 0, 1,
-2.021856, -1.60185, -2.825555, 1, 0.1372549, 0, 1,
-2.013311, 1.201719, -1.802763, 1, 0.145098, 0, 1,
-2.012815, -0.2747869, -2.97377, 1, 0.1490196, 0, 1,
-2.010616, -0.272121, -1.983924, 1, 0.1568628, 0, 1,
-1.989697, 1.995487, 0.3045059, 1, 0.1607843, 0, 1,
-1.980987, 2.231141, -1.806932, 1, 0.1686275, 0, 1,
-1.960274, -0.1954293, -2.490103, 1, 0.172549, 0, 1,
-1.935793, 0.2346973, 0.05838939, 1, 0.1803922, 0, 1,
-1.933997, -0.003213296, -1.094413, 1, 0.1843137, 0, 1,
-1.909049, 0.7939426, -1.674396, 1, 0.1921569, 0, 1,
-1.900257, -1.124969, -1.356225, 1, 0.1960784, 0, 1,
-1.883127, 0.3707456, 1.244469, 1, 0.2039216, 0, 1,
-1.881091, -2.109664, -2.379842, 1, 0.2117647, 0, 1,
-1.86918, -1.441186, -4.090345, 1, 0.2156863, 0, 1,
-1.842303, 0.2622786, -1.395837, 1, 0.2235294, 0, 1,
-1.842264, 0.07770015, -1.305063, 1, 0.227451, 0, 1,
-1.841958, 1.186063, -0.6705432, 1, 0.2352941, 0, 1,
-1.838258, 0.5089964, -3.70818, 1, 0.2392157, 0, 1,
-1.828436, 0.7878546, -1.092312, 1, 0.2470588, 0, 1,
-1.817561, -1.351634, -3.326061, 1, 0.2509804, 0, 1,
-1.81447, 1.538738, -1.787677, 1, 0.2588235, 0, 1,
-1.814351, -1.08766, -1.044193, 1, 0.2627451, 0, 1,
-1.811346, 0.3489268, -0.9619298, 1, 0.2705882, 0, 1,
-1.792885, 0.8667038, 0.8879219, 1, 0.2745098, 0, 1,
-1.788154, -0.8176591, -1.357614, 1, 0.282353, 0, 1,
-1.774311, -0.9637768, -2.773312, 1, 0.2862745, 0, 1,
-1.754299, -0.5645027, -1.631955, 1, 0.2941177, 0, 1,
-1.752804, 0.2230546, 0.04051676, 1, 0.3019608, 0, 1,
-1.751223, 0.5100045, 0.9894327, 1, 0.3058824, 0, 1,
-1.713736, -1.155198, -0.958978, 1, 0.3137255, 0, 1,
-1.699273, 0.3424688, -1.762122, 1, 0.3176471, 0, 1,
-1.685546, -2.680645, -2.298501, 1, 0.3254902, 0, 1,
-1.682222, 1.641664, -0.3024163, 1, 0.3294118, 0, 1,
-1.677569, -0.03604829, -2.2608, 1, 0.3372549, 0, 1,
-1.666361, -0.4064128, -1.702726, 1, 0.3411765, 0, 1,
-1.658525, -0.8551657, -1.509917, 1, 0.3490196, 0, 1,
-1.657616, 0.5850399, -2.035281, 1, 0.3529412, 0, 1,
-1.639476, 0.05348888, -1.913635, 1, 0.3607843, 0, 1,
-1.631254, -0.4994543, -1.549646, 1, 0.3647059, 0, 1,
-1.611109, -0.2847647, -2.103481, 1, 0.372549, 0, 1,
-1.603106, 0.3327154, -2.024709, 1, 0.3764706, 0, 1,
-1.597746, -0.5920177, -1.584757, 1, 0.3843137, 0, 1,
-1.595416, 1.222932, 0.8871644, 1, 0.3882353, 0, 1,
-1.581444, -0.4890214, -2.601251, 1, 0.3960784, 0, 1,
-1.574701, -0.651145, -0.9352529, 1, 0.4039216, 0, 1,
-1.573097, 2.173379, -1.450923, 1, 0.4078431, 0, 1,
-1.562412, 0.6066152, -2.020372, 1, 0.4156863, 0, 1,
-1.555507, 0.4427786, -0.3451062, 1, 0.4196078, 0, 1,
-1.544154, 2.159821, -0.8911524, 1, 0.427451, 0, 1,
-1.525823, -0.05546556, -2.895763, 1, 0.4313726, 0, 1,
-1.51454, 1.34732, -1.128787, 1, 0.4392157, 0, 1,
-1.512569, 0.1114854, -0.5186909, 1, 0.4431373, 0, 1,
-1.511377, -0.8703433, -1.899007, 1, 0.4509804, 0, 1,
-1.499832, -0.8836132, -4.107675, 1, 0.454902, 0, 1,
-1.499514, 0.1319425, -1.889381, 1, 0.4627451, 0, 1,
-1.477612, -0.4792159, -2.280538, 1, 0.4666667, 0, 1,
-1.472184, 0.259103, 1.128999, 1, 0.4745098, 0, 1,
-1.469997, 1.042436, -1.86231, 1, 0.4784314, 0, 1,
-1.46909, 0.9669282, 0.3375068, 1, 0.4862745, 0, 1,
-1.463394, -0.7038365, -1.663487, 1, 0.4901961, 0, 1,
-1.461884, -0.6646712, -3.044338, 1, 0.4980392, 0, 1,
-1.44155, 0.6298779, -0.4965495, 1, 0.5058824, 0, 1,
-1.440556, 2.276216, -0.3747087, 1, 0.509804, 0, 1,
-1.434493, 1.171945, -1.239714, 1, 0.5176471, 0, 1,
-1.428238, -0.1717509, -0.7286452, 1, 0.5215687, 0, 1,
-1.425973, 0.621173, -1.738384, 1, 0.5294118, 0, 1,
-1.413793, 0.4605122, -2.387774, 1, 0.5333334, 0, 1,
-1.413294, 0.6332903, -0.2734777, 1, 0.5411765, 0, 1,
-1.408082, -0.6585562, -1.705529, 1, 0.5450981, 0, 1,
-1.377264, -0.03919389, -1.80925, 1, 0.5529412, 0, 1,
-1.369048, -0.3513662, -1.564833, 1, 0.5568628, 0, 1,
-1.341141, -0.4160001, -1.979677, 1, 0.5647059, 0, 1,
-1.336702, -0.1067622, -2.870442, 1, 0.5686275, 0, 1,
-1.331075, 0.6766452, -1.390489, 1, 0.5764706, 0, 1,
-1.326655, -0.08902507, -1.113284, 1, 0.5803922, 0, 1,
-1.308655, -0.5816559, -1.668931, 1, 0.5882353, 0, 1,
-1.306322, -1.387581, -4.58675, 1, 0.5921569, 0, 1,
-1.287652, -0.3478364, -1.995646, 1, 0.6, 0, 1,
-1.282691, -1.301181, -4.511711, 1, 0.6078432, 0, 1,
-1.271821, 0.3459401, -2.03512, 1, 0.6117647, 0, 1,
-1.266527, -1.52954, -4.004295, 1, 0.6196079, 0, 1,
-1.257727, 1.392645, 1.008247, 1, 0.6235294, 0, 1,
-1.250133, 0.2267823, -1.396322, 1, 0.6313726, 0, 1,
-1.249737, -0.4387744, -2.907942, 1, 0.6352941, 0, 1,
-1.241066, -0.4996642, -2.831313, 1, 0.6431373, 0, 1,
-1.240882, 0.6537419, -2.869994, 1, 0.6470588, 0, 1,
-1.230729, -1.065902, -0.8745856, 1, 0.654902, 0, 1,
-1.222607, 0.1543409, 0.5240972, 1, 0.6588235, 0, 1,
-1.216166, 0.9273034, 0.04409978, 1, 0.6666667, 0, 1,
-1.215694, -1.40635, -2.484056, 1, 0.6705883, 0, 1,
-1.20873, -0.532845, -2.301534, 1, 0.6784314, 0, 1,
-1.205732, 1.476582, -1.085437, 1, 0.682353, 0, 1,
-1.203419, -0.9221817, -4.49908, 1, 0.6901961, 0, 1,
-1.192349, -0.3707736, -1.757041, 1, 0.6941177, 0, 1,
-1.188776, 0.9832002, -1.547849, 1, 0.7019608, 0, 1,
-1.182145, 1.08861, -0.6142765, 1, 0.7098039, 0, 1,
-1.180072, -0.6015204, -1.568473, 1, 0.7137255, 0, 1,
-1.178475, -0.8659403, -2.16622, 1, 0.7215686, 0, 1,
-1.176267, -0.2689796, -1.589732, 1, 0.7254902, 0, 1,
-1.170429, -0.3995566, -2.53732, 1, 0.7333333, 0, 1,
-1.169037, -0.6336834, -1.662787, 1, 0.7372549, 0, 1,
-1.161462, -0.52543, -1.875281, 1, 0.7450981, 0, 1,
-1.152453, 0.97685, -0.3734499, 1, 0.7490196, 0, 1,
-1.151667, 0.01703648, -1.950146, 1, 0.7568628, 0, 1,
-1.14989, 0.2298245, -2.876879, 1, 0.7607843, 0, 1,
-1.146449, -1.539945, -3.474675, 1, 0.7686275, 0, 1,
-1.146325, 1.227985, -0.6695881, 1, 0.772549, 0, 1,
-1.145395, 0.3562008, -0.1381344, 1, 0.7803922, 0, 1,
-1.14424, -1.195231, -3.505345, 1, 0.7843137, 0, 1,
-1.140171, -0.2694593, -2.814664, 1, 0.7921569, 0, 1,
-1.126956, 0.3913244, -1.123186, 1, 0.7960784, 0, 1,
-1.122836, -0.2137756, -0.8445197, 1, 0.8039216, 0, 1,
-1.110608, -2.162366, -3.547374, 1, 0.8117647, 0, 1,
-1.104053, -1.276252, -4.509927, 1, 0.8156863, 0, 1,
-1.101204, 0.5986524, -1.36996, 1, 0.8235294, 0, 1,
-1.08878, -0.9179744, -1.52912, 1, 0.827451, 0, 1,
-1.079313, 0.4220321, -2.863223, 1, 0.8352941, 0, 1,
-1.076762, -0.4260365, -2.114473, 1, 0.8392157, 0, 1,
-1.0749, 0.6321028, 0.1708824, 1, 0.8470588, 0, 1,
-1.074898, 0.9312181, -0.3423554, 1, 0.8509804, 0, 1,
-1.065162, 0.2653157, 0.6591427, 1, 0.8588235, 0, 1,
-1.0644, -0.9012839, -3.599543, 1, 0.8627451, 0, 1,
-1.064311, -0.2296824, -2.888992, 1, 0.8705882, 0, 1,
-1.062201, -1.309083, -4.030953, 1, 0.8745098, 0, 1,
-1.055682, 0.6732832, -0.8429222, 1, 0.8823529, 0, 1,
-1.052745, 0.06494159, 0.7649383, 1, 0.8862745, 0, 1,
-1.049808, 0.9940152, -1.632255, 1, 0.8941177, 0, 1,
-1.04759, -1.443419, 0.3146081, 1, 0.8980392, 0, 1,
-1.047142, -1.305918, -1.215973, 1, 0.9058824, 0, 1,
-1.039987, 1.27264, -0.1490843, 1, 0.9137255, 0, 1,
-1.039408, -0.4737468, -1.118027, 1, 0.9176471, 0, 1,
-1.034703, 0.5659223, -0.7462097, 1, 0.9254902, 0, 1,
-1.033033, -0.4017129, -3.589987, 1, 0.9294118, 0, 1,
-1.033013, 0.5589819, 0.1737737, 1, 0.9372549, 0, 1,
-1.032322, -1.072812, -2.190616, 1, 0.9411765, 0, 1,
-1.030591, -0.5826144, -2.491954, 1, 0.9490196, 0, 1,
-1.029899, 0.5163093, -2.40514, 1, 0.9529412, 0, 1,
-1.028592, 0.2830378, -0.6896209, 1, 0.9607843, 0, 1,
-1.026402, 0.1575606, -1.546991, 1, 0.9647059, 0, 1,
-1.025524, -0.1874352, -3.393891, 1, 0.972549, 0, 1,
-1.024819, 1.494706, -0.6857567, 1, 0.9764706, 0, 1,
-1.022938, 0.098557, -0.8793262, 1, 0.9843137, 0, 1,
-1.020559, -1.302511, -0.9726678, 1, 0.9882353, 0, 1,
-1.018971, 0.2982987, -0.9325718, 1, 0.9960784, 0, 1,
-1.015247, 1.643357, -1.129738, 0.9960784, 1, 0, 1,
-1.014651, -0.407216, -1.94077, 0.9921569, 1, 0, 1,
-1.012276, -0.5234503, -1.464221, 0.9843137, 1, 0, 1,
-1.012205, -1.406331, -1.66792, 0.9803922, 1, 0, 1,
-1.009885, -0.1863655, -2.13019, 0.972549, 1, 0, 1,
-1.006526, 1.171118, -2.108932, 0.9686275, 1, 0, 1,
-1.005946, 0.01611001, -1.789736, 0.9607843, 1, 0, 1,
-1.004435, 0.261471, -1.892522, 0.9568627, 1, 0, 1,
-1.003089, -1.699748, -2.834608, 0.9490196, 1, 0, 1,
-0.9949054, -0.1432455, -1.966634, 0.945098, 1, 0, 1,
-0.9921726, -0.7811008, -0.3010517, 0.9372549, 1, 0, 1,
-0.9869546, 0.4232147, -1.120886, 0.9333333, 1, 0, 1,
-0.9778581, -2.489348, -2.983897, 0.9254902, 1, 0, 1,
-0.9750156, 1.625483, -2.232841, 0.9215686, 1, 0, 1,
-0.9708367, -0.01340899, -0.5362117, 0.9137255, 1, 0, 1,
-0.9699349, 0.1520757, -0.9984666, 0.9098039, 1, 0, 1,
-0.9662312, -0.06489258, -2.004839, 0.9019608, 1, 0, 1,
-0.9651759, -0.6398592, -3.017817, 0.8941177, 1, 0, 1,
-0.9602589, 0.235956, -0.7175905, 0.8901961, 1, 0, 1,
-0.9557369, 0.1755152, -1.77951, 0.8823529, 1, 0, 1,
-0.9548473, 0.8479789, 0.6995611, 0.8784314, 1, 0, 1,
-0.9526412, 0.7393194, -0.8775885, 0.8705882, 1, 0, 1,
-0.9328716, -1.802269, -3.369334, 0.8666667, 1, 0, 1,
-0.9291417, -2.45727, -3.445579, 0.8588235, 1, 0, 1,
-0.9266501, -0.2546423, -3.124608, 0.854902, 1, 0, 1,
-0.9215993, 0.2704044, -1.558916, 0.8470588, 1, 0, 1,
-0.9191936, -0.1200779, -0.765141, 0.8431373, 1, 0, 1,
-0.9178236, 0.4616229, -1.832364, 0.8352941, 1, 0, 1,
-0.9075238, -0.4039693, -1.776845, 0.8313726, 1, 0, 1,
-0.9032665, -0.06433086, -1.644698, 0.8235294, 1, 0, 1,
-0.9010437, 1.11436, -0.1103906, 0.8196079, 1, 0, 1,
-0.8919939, 0.9666583, -2.709421, 0.8117647, 1, 0, 1,
-0.8863631, -1.017655, -2.063818, 0.8078431, 1, 0, 1,
-0.8848431, 0.03084613, -4.70713, 0.8, 1, 0, 1,
-0.8820912, -0.5416307, -2.273645, 0.7921569, 1, 0, 1,
-0.8812024, -0.4171815, -2.221201, 0.7882353, 1, 0, 1,
-0.8710535, 0.02631984, -1.401477, 0.7803922, 1, 0, 1,
-0.8688712, -0.841459, -3.196405, 0.7764706, 1, 0, 1,
-0.8659173, 2.036561, -1.327158, 0.7686275, 1, 0, 1,
-0.8638788, 0.04970023, -0.2824523, 0.7647059, 1, 0, 1,
-0.8611588, 1.788737, 0.3895481, 0.7568628, 1, 0, 1,
-0.8544994, 2.07479, -1.567869, 0.7529412, 1, 0, 1,
-0.8523912, -0.9867582, -4.072915, 0.7450981, 1, 0, 1,
-0.8477286, 0.1681855, -0.5368683, 0.7411765, 1, 0, 1,
-0.8452113, -0.553836, -0.6222528, 0.7333333, 1, 0, 1,
-0.8381407, -1.086068, -3.683536, 0.7294118, 1, 0, 1,
-0.8360867, -1.89314, -2.315603, 0.7215686, 1, 0, 1,
-0.8267076, 1.431955, 0.8467343, 0.7176471, 1, 0, 1,
-0.8262275, -0.4602866, -2.97185, 0.7098039, 1, 0, 1,
-0.8228951, -0.2365172, -1.442584, 0.7058824, 1, 0, 1,
-0.808138, 0.1511664, -3.508804, 0.6980392, 1, 0, 1,
-0.8060138, -0.3565231, -2.447969, 0.6901961, 1, 0, 1,
-0.8045655, -0.4066359, -1.370103, 0.6862745, 1, 0, 1,
-0.8012353, -2.160295, -3.581482, 0.6784314, 1, 0, 1,
-0.7996436, 0.2589295, -0.6131745, 0.6745098, 1, 0, 1,
-0.7929193, 1.067998, 0.4379871, 0.6666667, 1, 0, 1,
-0.7880922, 2.925795, 0.4686915, 0.6627451, 1, 0, 1,
-0.7880679, 0.06496919, -1.15489, 0.654902, 1, 0, 1,
-0.7749625, 0.2771478, -2.001668, 0.6509804, 1, 0, 1,
-0.7583135, -1.48659, -3.150245, 0.6431373, 1, 0, 1,
-0.7517675, 1.719808, 0.6031205, 0.6392157, 1, 0, 1,
-0.7495273, 1.024316, -1.686327, 0.6313726, 1, 0, 1,
-0.7309893, -0.6057755, -2.339438, 0.627451, 1, 0, 1,
-0.7307476, -0.5577282, -2.870595, 0.6196079, 1, 0, 1,
-0.7302889, 0.4231014, -0.5244066, 0.6156863, 1, 0, 1,
-0.7058361, 0.6515099, -0.3933966, 0.6078432, 1, 0, 1,
-0.7025599, -2.230626, -2.704421, 0.6039216, 1, 0, 1,
-0.7019987, 0.4936706, -1.377536, 0.5960785, 1, 0, 1,
-0.7019563, -0.765076, -3.867147, 0.5882353, 1, 0, 1,
-0.6990167, -1.214338, -1.415436, 0.5843138, 1, 0, 1,
-0.6984519, 0.5524818, -1.751885, 0.5764706, 1, 0, 1,
-0.6959591, 0.3257749, -1.091959, 0.572549, 1, 0, 1,
-0.6892819, -0.5126048, -1.987634, 0.5647059, 1, 0, 1,
-0.688157, 2.477631, -0.9703575, 0.5607843, 1, 0, 1,
-0.6871871, 0.5638859, -2.318221, 0.5529412, 1, 0, 1,
-0.6870738, -0.09139507, -0.9376409, 0.5490196, 1, 0, 1,
-0.6859106, -1.453704, -3.348768, 0.5411765, 1, 0, 1,
-0.6847202, -0.485806, -2.253117, 0.5372549, 1, 0, 1,
-0.6783035, 0.6435149, -0.130145, 0.5294118, 1, 0, 1,
-0.6753542, -0.4784592, -3.838754, 0.5254902, 1, 0, 1,
-0.6721167, -0.4468456, -2.215509, 0.5176471, 1, 0, 1,
-0.6699928, -0.2986129, -2.132527, 0.5137255, 1, 0, 1,
-0.6699011, -0.2988676, -3.148116, 0.5058824, 1, 0, 1,
-0.6675003, 1.144644, -1.421635, 0.5019608, 1, 0, 1,
-0.659466, 1.846292, -1.826295, 0.4941176, 1, 0, 1,
-0.6430635, 1.424539, -0.6478215, 0.4862745, 1, 0, 1,
-0.6427935, -2.014224, -2.638034, 0.4823529, 1, 0, 1,
-0.6365947, 0.6546543, -0.1304515, 0.4745098, 1, 0, 1,
-0.6306523, 0.8906786, -0.4056095, 0.4705882, 1, 0, 1,
-0.6258758, -0.5607803, -2.304547, 0.4627451, 1, 0, 1,
-0.6218796, 0.1573087, -1.228201, 0.4588235, 1, 0, 1,
-0.6171139, 1.035899, -2.117326, 0.4509804, 1, 0, 1,
-0.6052172, 0.4540598, -2.819146, 0.4470588, 1, 0, 1,
-0.6012499, 0.8246604, -1.579991, 0.4392157, 1, 0, 1,
-0.595851, -0.9794719, -1.202162, 0.4352941, 1, 0, 1,
-0.5945998, -0.4881698, -2.119198, 0.427451, 1, 0, 1,
-0.5934963, 0.595805, -0.1474626, 0.4235294, 1, 0, 1,
-0.5930583, 0.1172632, -0.8072714, 0.4156863, 1, 0, 1,
-0.5926784, 0.06137574, -1.102127, 0.4117647, 1, 0, 1,
-0.5871977, 0.3280813, -1.317889, 0.4039216, 1, 0, 1,
-0.5797156, -0.3360122, -2.005397, 0.3960784, 1, 0, 1,
-0.5756397, 0.3224417, -1.349699, 0.3921569, 1, 0, 1,
-0.5755174, -0.3436278, -3.679679, 0.3843137, 1, 0, 1,
-0.5727096, -0.2473861, -1.201518, 0.3803922, 1, 0, 1,
-0.5722811, -0.2546956, -3.391486, 0.372549, 1, 0, 1,
-0.5719554, 1.726342, -0.7779538, 0.3686275, 1, 0, 1,
-0.5688545, 0.3093686, -1.659527, 0.3607843, 1, 0, 1,
-0.5642915, -0.3093844, -2.087068, 0.3568628, 1, 0, 1,
-0.5625597, 1.020587, 0.6425179, 0.3490196, 1, 0, 1,
-0.5620955, 0.4804505, -1.629298, 0.345098, 1, 0, 1,
-0.5619031, 1.082643, 0.01565545, 0.3372549, 1, 0, 1,
-0.5616446, 0.5361342, -0.02548406, 0.3333333, 1, 0, 1,
-0.5615708, -2.726313, -2.471117, 0.3254902, 1, 0, 1,
-0.5603099, -0.2316064, -2.86034, 0.3215686, 1, 0, 1,
-0.5554645, -0.5900564, -2.407414, 0.3137255, 1, 0, 1,
-0.5510135, 0.6199957, 0.4250579, 0.3098039, 1, 0, 1,
-0.5489966, 0.14978, -0.7171807, 0.3019608, 1, 0, 1,
-0.5467881, -0.6658913, -2.200202, 0.2941177, 1, 0, 1,
-0.5467303, -0.3323567, -2.469054, 0.2901961, 1, 0, 1,
-0.5442825, -0.5704001, -2.65309, 0.282353, 1, 0, 1,
-0.5361453, -1.48602, -2.745159, 0.2784314, 1, 0, 1,
-0.534905, -0.6533526, -2.192087, 0.2705882, 1, 0, 1,
-0.5343086, -0.02136949, -1.642677, 0.2666667, 1, 0, 1,
-0.5301085, 0.2108635, -0.2256537, 0.2588235, 1, 0, 1,
-0.527349, -1.618195, -4.143023, 0.254902, 1, 0, 1,
-0.5251759, 1.061223, -1.502831, 0.2470588, 1, 0, 1,
-0.5245222, 0.7120694, -3.516677, 0.2431373, 1, 0, 1,
-0.5223504, -0.3605174, -1.693798, 0.2352941, 1, 0, 1,
-0.5179194, 0.4321744, 0.2048318, 0.2313726, 1, 0, 1,
-0.5118335, -0.4520046, -2.496268, 0.2235294, 1, 0, 1,
-0.5107651, -0.537685, -1.144432, 0.2196078, 1, 0, 1,
-0.5040628, 0.4546081, -1.09819, 0.2117647, 1, 0, 1,
-0.5039634, 0.5571744, 0.8884791, 0.2078431, 1, 0, 1,
-0.5007181, -1.217052, -2.803931, 0.2, 1, 0, 1,
-0.4984005, -0.1249363, -1.497812, 0.1921569, 1, 0, 1,
-0.4962788, -1.619848, -3.660724, 0.1882353, 1, 0, 1,
-0.4944894, 1.447921, -0.1354117, 0.1803922, 1, 0, 1,
-0.4934211, -0.2820223, -1.550969, 0.1764706, 1, 0, 1,
-0.4918416, 0.3516579, -0.6216255, 0.1686275, 1, 0, 1,
-0.4840388, 0.6253682, -2.04429, 0.1647059, 1, 0, 1,
-0.4838151, 0.178772, 0.6867055, 0.1568628, 1, 0, 1,
-0.483388, -0.2058345, -1.56748, 0.1529412, 1, 0, 1,
-0.4797383, 0.1171407, -0.562054, 0.145098, 1, 0, 1,
-0.4772685, 0.191135, -1.427639, 0.1411765, 1, 0, 1,
-0.4712848, -0.007923565, -1.550261, 0.1333333, 1, 0, 1,
-0.470549, -1.469427, -3.422448, 0.1294118, 1, 0, 1,
-0.4662521, 0.4818445, -0.8608122, 0.1215686, 1, 0, 1,
-0.464977, 0.478273, -0.5503312, 0.1176471, 1, 0, 1,
-0.4643826, 0.5821914, -0.7377638, 0.1098039, 1, 0, 1,
-0.461263, 1.207456, -1.300182, 0.1058824, 1, 0, 1,
-0.460824, -0.8716571, -1.922928, 0.09803922, 1, 0, 1,
-0.450166, -0.2756149, -2.754669, 0.09019608, 1, 0, 1,
-0.448089, 0.1397672, -1.999897, 0.08627451, 1, 0, 1,
-0.4459046, 0.4688285, -0.4540953, 0.07843138, 1, 0, 1,
-0.4428914, -0.05934253, -1.38132, 0.07450981, 1, 0, 1,
-0.4403558, -0.2347409, -1.509496, 0.06666667, 1, 0, 1,
-0.4380765, -1.356916, -4.055308, 0.0627451, 1, 0, 1,
-0.4336876, -0.454769, -2.779685, 0.05490196, 1, 0, 1,
-0.4326639, 2.352781, -1.409878, 0.05098039, 1, 0, 1,
-0.4305936, 0.7529323, 0.2039306, 0.04313726, 1, 0, 1,
-0.4297022, -2.346411, -0.03659273, 0.03921569, 1, 0, 1,
-0.4224184, 2.026956, -0.780756, 0.03137255, 1, 0, 1,
-0.4177706, 0.6383797, -1.580231, 0.02745098, 1, 0, 1,
-0.4167759, -0.5384728, -4.132548, 0.01960784, 1, 0, 1,
-0.416325, 1.082206, -0.8685501, 0.01568628, 1, 0, 1,
-0.4157068, 0.2315038, -0.08767069, 0.007843138, 1, 0, 1,
-0.4153731, -0.3054486, -0.7770074, 0.003921569, 1, 0, 1,
-0.4146205, -0.4070079, -4.354407, 0, 1, 0.003921569, 1,
-0.409586, 0.5366319, -0.152447, 0, 1, 0.01176471, 1,
-0.4069931, -0.02043045, -1.258048, 0, 1, 0.01568628, 1,
-0.4039463, -1.844001, -2.672182, 0, 1, 0.02352941, 1,
-0.4000224, -1.197333, -3.902554, 0, 1, 0.02745098, 1,
-0.3980823, -0.1250674, -1.239128, 0, 1, 0.03529412, 1,
-0.3925886, -0.8112646, -3.696702, 0, 1, 0.03921569, 1,
-0.3889332, 0.5602824, 2.052326, 0, 1, 0.04705882, 1,
-0.3846719, 0.5092508, -0.9426442, 0, 1, 0.05098039, 1,
-0.3809362, 0.3643999, 0.7300339, 0, 1, 0.05882353, 1,
-0.3802345, -0.4005433, -2.538803, 0, 1, 0.0627451, 1,
-0.3789218, 0.05050331, -2.860261, 0, 1, 0.07058824, 1,
-0.374985, -0.5935521, -2.390128, 0, 1, 0.07450981, 1,
-0.3696657, -0.4440035, -3.121074, 0, 1, 0.08235294, 1,
-0.3696553, -0.1490138, -1.360744, 0, 1, 0.08627451, 1,
-0.3693406, 0.4287485, -0.5262929, 0, 1, 0.09411765, 1,
-0.3678495, 0.6939951, 0.1144998, 0, 1, 0.1019608, 1,
-0.3625616, -0.3751172, -1.639049, 0, 1, 0.1058824, 1,
-0.3588377, 1.237242, 0.1737975, 0, 1, 0.1137255, 1,
-0.3569296, 0.9626958, -1.656571, 0, 1, 0.1176471, 1,
-0.3558201, -1.221062, -5.029473, 0, 1, 0.1254902, 1,
-0.3505684, -0.4409592, -1.473149, 0, 1, 0.1294118, 1,
-0.348821, -0.5199616, -0.699047, 0, 1, 0.1372549, 1,
-0.347153, -0.244523, -4.12045, 0, 1, 0.1411765, 1,
-0.3462064, 1.576459, 0.6976926, 0, 1, 0.1490196, 1,
-0.3394507, 0.5945548, -0.3500898, 0, 1, 0.1529412, 1,
-0.3357254, -2.140298, -3.090487, 0, 1, 0.1607843, 1,
-0.333247, 0.1285006, -3.246926, 0, 1, 0.1647059, 1,
-0.328217, 0.3602527, -0.5473765, 0, 1, 0.172549, 1,
-0.3263241, -0.8144639, -4.345191, 0, 1, 0.1764706, 1,
-0.3244743, -0.3122893, -3.368414, 0, 1, 0.1843137, 1,
-0.3215315, 1.55088, -0.5267283, 0, 1, 0.1882353, 1,
-0.3158129, 0.2208405, -0.7881644, 0, 1, 0.1960784, 1,
-0.3142143, -1.290764, -4.048522, 0, 1, 0.2039216, 1,
-0.3125041, -1.943742, -2.481787, 0, 1, 0.2078431, 1,
-0.3114051, 1.431602, 1.32615, 0, 1, 0.2156863, 1,
-0.3113072, -0.1081455, -2.55588, 0, 1, 0.2196078, 1,
-0.3108695, 1.344504, -1.352341, 0, 1, 0.227451, 1,
-0.3106952, -1.695241, -3.094469, 0, 1, 0.2313726, 1,
-0.309188, 0.8760403, -1.975294, 0, 1, 0.2392157, 1,
-0.3059146, 0.4827172, -1.59653, 0, 1, 0.2431373, 1,
-0.3018956, 0.5856257, 0.1437527, 0, 1, 0.2509804, 1,
-0.2991099, -1.783762, -2.874465, 0, 1, 0.254902, 1,
-0.2986283, -1.260369, -2.777743, 0, 1, 0.2627451, 1,
-0.2954277, -0.3399208, -1.750221, 0, 1, 0.2666667, 1,
-0.2953915, 1.15856, -1.401644, 0, 1, 0.2745098, 1,
-0.2943307, -1.004604, -2.65839, 0, 1, 0.2784314, 1,
-0.2853923, -0.7769601, -4.553023, 0, 1, 0.2862745, 1,
-0.2837596, 0.01942701, 0.04102422, 0, 1, 0.2901961, 1,
-0.2835786, 2.503567, 0.1650469, 0, 1, 0.2980392, 1,
-0.2816595, 1.098008, -0.6648062, 0, 1, 0.3058824, 1,
-0.2794168, 1.542152, -0.1053542, 0, 1, 0.3098039, 1,
-0.2782382, 1.219513, -0.3471737, 0, 1, 0.3176471, 1,
-0.2756197, -0.5097698, -3.051291, 0, 1, 0.3215686, 1,
-0.2744124, 0.636054, -0.6929849, 0, 1, 0.3294118, 1,
-0.269639, -0.437331, -2.638547, 0, 1, 0.3333333, 1,
-0.2690685, 1.383444, 0.8474796, 0, 1, 0.3411765, 1,
-0.2629038, -0.6058692, -3.162374, 0, 1, 0.345098, 1,
-0.2624239, -1.393529, -3.062586, 0, 1, 0.3529412, 1,
-0.2615474, -0.8440543, -2.577723, 0, 1, 0.3568628, 1,
-0.2610483, -1.416721, -3.283973, 0, 1, 0.3647059, 1,
-0.2572827, -0.1564685, -1.581013, 0, 1, 0.3686275, 1,
-0.2536236, 0.3789406, -1.411484, 0, 1, 0.3764706, 1,
-0.2514716, -0.2456135, -2.184997, 0, 1, 0.3803922, 1,
-0.2504352, 1.15638, -0.6642971, 0, 1, 0.3882353, 1,
-0.2499395, -0.01145738, -1.615136, 0, 1, 0.3921569, 1,
-0.2492167, 0.2277153, -2.936656, 0, 1, 0.4, 1,
-0.248412, 0.4159972, 0.8795815, 0, 1, 0.4078431, 1,
-0.2460916, 0.2938041, -0.4779496, 0, 1, 0.4117647, 1,
-0.2425374, 1.439001, 0.5959905, 0, 1, 0.4196078, 1,
-0.2419041, 0.9128821, 0.5223266, 0, 1, 0.4235294, 1,
-0.24068, -0.8606692, -2.457691, 0, 1, 0.4313726, 1,
-0.2394616, 0.3678456, -0.5040954, 0, 1, 0.4352941, 1,
-0.2385531, 1.244408, -0.5423111, 0, 1, 0.4431373, 1,
-0.2353168, 0.1463789, -0.8823385, 0, 1, 0.4470588, 1,
-0.2334406, -2.3025, -3.349075, 0, 1, 0.454902, 1,
-0.2247062, 0.7018875, -0.5086985, 0, 1, 0.4588235, 1,
-0.2242493, -0.3556114, -1.819109, 0, 1, 0.4666667, 1,
-0.2220222, 0.1527402, 0.5352262, 0, 1, 0.4705882, 1,
-0.2215893, 0.3997991, 0.3585213, 0, 1, 0.4784314, 1,
-0.2215572, 0.4104448, -0.3957796, 0, 1, 0.4823529, 1,
-0.2140942, -0.3736634, -1.620559, 0, 1, 0.4901961, 1,
-0.2093818, -0.9013871, -2.894626, 0, 1, 0.4941176, 1,
-0.2078585, -2.04767, -3.099919, 0, 1, 0.5019608, 1,
-0.2069723, -0.951161, -2.291248, 0, 1, 0.509804, 1,
-0.2040996, -1.047967, -4.130183, 0, 1, 0.5137255, 1,
-0.2039556, 0.4291289, 0.945157, 0, 1, 0.5215687, 1,
-0.2020266, 0.1611607, -0.1853879, 0, 1, 0.5254902, 1,
-0.1986656, 0.0719052, -1.833019, 0, 1, 0.5333334, 1,
-0.1954427, 0.04214385, -0.8010458, 0, 1, 0.5372549, 1,
-0.1867228, -0.3053232, -2.313418, 0, 1, 0.5450981, 1,
-0.1837177, -0.2085441, -4.017514, 0, 1, 0.5490196, 1,
-0.1815889, -0.358442, -1.353159, 0, 1, 0.5568628, 1,
-0.1790219, 1.763363, 0.8576919, 0, 1, 0.5607843, 1,
-0.1777776, -0.8631799, -6.166344, 0, 1, 0.5686275, 1,
-0.1758246, 0.3001949, -0.431676, 0, 1, 0.572549, 1,
-0.1746153, -0.3556536, -3.319872, 0, 1, 0.5803922, 1,
-0.1715555, -0.5234934, -1.883019, 0, 1, 0.5843138, 1,
-0.1713078, -0.03980779, -1.634169, 0, 1, 0.5921569, 1,
-0.1652439, -1.190494, -2.870303, 0, 1, 0.5960785, 1,
-0.1571829, 1.269867, 0.8793836, 0, 1, 0.6039216, 1,
-0.1570907, 1.701885, 0.09851301, 0, 1, 0.6117647, 1,
-0.156485, -1.310848, -3.005201, 0, 1, 0.6156863, 1,
-0.1524791, 0.1104294, -1.933425, 0, 1, 0.6235294, 1,
-0.1510963, -1.316083, -1.72172, 0, 1, 0.627451, 1,
-0.1501588, -0.8427029, -2.96766, 0, 1, 0.6352941, 1,
-0.1495327, -0.02854294, -0.4125284, 0, 1, 0.6392157, 1,
-0.147955, 0.5008233, -0.009870088, 0, 1, 0.6470588, 1,
-0.1387435, -1.430728, -3.064738, 0, 1, 0.6509804, 1,
-0.1372246, -0.2533991, -2.349264, 0, 1, 0.6588235, 1,
-0.1368043, -0.3914673, -3.020498, 0, 1, 0.6627451, 1,
-0.1346023, 1.203021, 0.08726534, 0, 1, 0.6705883, 1,
-0.1310641, -0.1564637, -2.284037, 0, 1, 0.6745098, 1,
-0.1281179, 1.520035, 0.5450703, 0, 1, 0.682353, 1,
-0.1265055, -1.084123, -2.108303, 0, 1, 0.6862745, 1,
-0.1262157, -1.617543, -2.206981, 0, 1, 0.6941177, 1,
-0.1252635, 0.5646187, -0.4700192, 0, 1, 0.7019608, 1,
-0.1218408, 0.6607728, -0.02918376, 0, 1, 0.7058824, 1,
-0.1205579, 0.9289494, -0.6634269, 0, 1, 0.7137255, 1,
-0.1185865, 0.7343248, 0.326985, 0, 1, 0.7176471, 1,
-0.1160312, -2.277418, -3.455402, 0, 1, 0.7254902, 1,
-0.1141016, -0.07507037, -2.755068, 0, 1, 0.7294118, 1,
-0.11182, 0.3273203, 1.176924, 0, 1, 0.7372549, 1,
-0.1079578, -0.7852625, -3.132406, 0, 1, 0.7411765, 1,
-0.09434935, -1.731668, -2.707838, 0, 1, 0.7490196, 1,
-0.09159322, -2.084317, -2.529216, 0, 1, 0.7529412, 1,
-0.0903366, 0.601201, -0.456915, 0, 1, 0.7607843, 1,
-0.08821303, -1.748174, -2.514504, 0, 1, 0.7647059, 1,
-0.08452693, 1.003521, -0.211236, 0, 1, 0.772549, 1,
-0.08390089, 0.5158862, 0.08122041, 0, 1, 0.7764706, 1,
-0.08157656, 0.3721882, -1.0119, 0, 1, 0.7843137, 1,
-0.0710165, 0.239246, 0.4529898, 0, 1, 0.7882353, 1,
-0.06801722, 0.2364125, 0.1946526, 0, 1, 0.7960784, 1,
-0.05779975, -0.7331836, -2.808303, 0, 1, 0.8039216, 1,
-0.05117713, 0.05730848, -1.103452, 0, 1, 0.8078431, 1,
-0.04867675, 2.338092, 0.73198, 0, 1, 0.8156863, 1,
-0.04720369, 0.3293822, -1.401205, 0, 1, 0.8196079, 1,
-0.04596712, -1.797076, -2.54442, 0, 1, 0.827451, 1,
-0.04552449, 0.04758166, 0.7797213, 0, 1, 0.8313726, 1,
-0.04511729, 0.7422207, -1.185236, 0, 1, 0.8392157, 1,
-0.04081285, 0.7258936, -0.3598666, 0, 1, 0.8431373, 1,
-0.03845038, 0.6190892, 0.7349765, 0, 1, 0.8509804, 1,
-0.03663948, -1.365461, -2.276828, 0, 1, 0.854902, 1,
-0.03023974, -1.940081, -3.733487, 0, 1, 0.8627451, 1,
-0.02906671, -0.04101397, -1.043955, 0, 1, 0.8666667, 1,
-0.02709384, 0.08052363, -1.713698, 0, 1, 0.8745098, 1,
-0.02113377, -1.958102, -2.553543, 0, 1, 0.8784314, 1,
-0.01818668, 1.189002, -0.8800889, 0, 1, 0.8862745, 1,
-0.01728654, -0.8827403, -2.519813, 0, 1, 0.8901961, 1,
-0.01709626, 1.117144, 0.4555698, 0, 1, 0.8980392, 1,
-0.01376645, -0.2204691, -4.537092, 0, 1, 0.9058824, 1,
-0.01123439, -1.180266, -3.034181, 0, 1, 0.9098039, 1,
-0.01112852, -0.8520657, -5.38775, 0, 1, 0.9176471, 1,
-0.01032705, 0.3474791, 1.368261, 0, 1, 0.9215686, 1,
-0.009779968, -1.88284, -4.82236, 0, 1, 0.9294118, 1,
-0.0044493, -0.2961179, -3.690942, 0, 1, 0.9333333, 1,
-0.00430292, -0.5160992, -3.940985, 0, 1, 0.9411765, 1,
-0.003774123, -0.5038418, -1.950855, 0, 1, 0.945098, 1,
-0.0005351743, -0.928625, -3.09018, 0, 1, 0.9529412, 1,
0.001972988, -0.4993345, 4.380781, 0, 1, 0.9568627, 1,
0.004539954, -1.624228, 3.796243, 0, 1, 0.9647059, 1,
0.006582202, -1.82489, 2.109209, 0, 1, 0.9686275, 1,
0.007607643, -0.06902053, 2.295351, 0, 1, 0.9764706, 1,
0.01123216, 0.3739716, -2.275936, 0, 1, 0.9803922, 1,
0.0155956, -2.000708, 2.836854, 0, 1, 0.9882353, 1,
0.01790061, 0.4138908, 2.157158, 0, 1, 0.9921569, 1,
0.02227756, -0.6251491, 2.209652, 0, 1, 1, 1,
0.02416373, 0.3537106, 0.9681913, 0, 0.9921569, 1, 1,
0.02476652, 0.5352759, -0.6321859, 0, 0.9882353, 1, 1,
0.02764777, -0.9315262, 2.301236, 0, 0.9803922, 1, 1,
0.02826682, 0.9939994, 1.161333, 0, 0.9764706, 1, 1,
0.03040052, -0.3857251, 4.415509, 0, 0.9686275, 1, 1,
0.03434034, 1.059356, -0.3363373, 0, 0.9647059, 1, 1,
0.03875475, -0.727559, 4.250646, 0, 0.9568627, 1, 1,
0.04166725, -1.532745, 2.031437, 0, 0.9529412, 1, 1,
0.04176454, -0.8433622, 4.911428, 0, 0.945098, 1, 1,
0.04823112, 2.0093, -0.3378162, 0, 0.9411765, 1, 1,
0.05099665, -0.8530265, 0.9746791, 0, 0.9333333, 1, 1,
0.05412648, 0.1677541, -0.9331543, 0, 0.9294118, 1, 1,
0.05561155, 0.6473477, 0.8405325, 0, 0.9215686, 1, 1,
0.05970031, -0.4692833, 4.521814, 0, 0.9176471, 1, 1,
0.06803989, -0.9046974, 2.85269, 0, 0.9098039, 1, 1,
0.07285696, -1.394086, 3.742683, 0, 0.9058824, 1, 1,
0.08282124, 0.9957901, 0.7164305, 0, 0.8980392, 1, 1,
0.08506399, 1.424834, 0.6015533, 0, 0.8901961, 1, 1,
0.08618799, 2.073182, -0.2338121, 0, 0.8862745, 1, 1,
0.08807208, 2.062377, 1.622494, 0, 0.8784314, 1, 1,
0.08984342, -0.8998185, 2.477994, 0, 0.8745098, 1, 1,
0.09058922, 0.1585427, 2.088691, 0, 0.8666667, 1, 1,
0.09528348, 2.001, 0.2340513, 0, 0.8627451, 1, 1,
0.09529046, 1.464741, 0.3413879, 0, 0.854902, 1, 1,
0.0969357, 0.5506935, 1.018275, 0, 0.8509804, 1, 1,
0.09698119, -0.04789282, 1.482127, 0, 0.8431373, 1, 1,
0.100493, 0.3416861, 1.518286, 0, 0.8392157, 1, 1,
0.1091741, -1.56054, 2.309306, 0, 0.8313726, 1, 1,
0.1134972, 1.327725, 1.069422, 0, 0.827451, 1, 1,
0.1144729, -2.13501, 2.318461, 0, 0.8196079, 1, 1,
0.115354, -0.05651061, 0.959363, 0, 0.8156863, 1, 1,
0.1161363, 0.7087254, -1.358005, 0, 0.8078431, 1, 1,
0.121599, -1.311345, 3.556753, 0, 0.8039216, 1, 1,
0.1233383, 0.1185565, 1.640459, 0, 0.7960784, 1, 1,
0.1290252, -0.3063419, 2.469356, 0, 0.7882353, 1, 1,
0.1375897, -0.6488565, 2.448189, 0, 0.7843137, 1, 1,
0.1396848, 0.04291533, 1.358713, 0, 0.7764706, 1, 1,
0.1402108, -0.5085576, 2.715724, 0, 0.772549, 1, 1,
0.1449862, 0.2655793, -1.236614, 0, 0.7647059, 1, 1,
0.1559559, -0.2093456, 2.67635, 0, 0.7607843, 1, 1,
0.1574561, -1.091954, 1.204015, 0, 0.7529412, 1, 1,
0.1613342, -0.4934131, 4.150511, 0, 0.7490196, 1, 1,
0.1672077, 0.498415, 0.2069685, 0, 0.7411765, 1, 1,
0.1673047, 1.744871, 0.1816484, 0, 0.7372549, 1, 1,
0.168733, -1.566284, 2.567576, 0, 0.7294118, 1, 1,
0.1713638, -1.169777, 3.557056, 0, 0.7254902, 1, 1,
0.1750578, -0.2729345, 2.535596, 0, 0.7176471, 1, 1,
0.1754647, 1.415566, 1.118633, 0, 0.7137255, 1, 1,
0.1777043, -1.429809, 2.903107, 0, 0.7058824, 1, 1,
0.1795076, -0.4946387, 2.491063, 0, 0.6980392, 1, 1,
0.1810434, -1.314391, 3.401881, 0, 0.6941177, 1, 1,
0.1841941, 1.160846, 0.8243935, 0, 0.6862745, 1, 1,
0.1877909, 0.4536555, 2.076058, 0, 0.682353, 1, 1,
0.1878424, -1.6091, 1.387787, 0, 0.6745098, 1, 1,
0.1886103, 0.6642366, 1.119268, 0, 0.6705883, 1, 1,
0.1889719, -0.5581203, 3.56048, 0, 0.6627451, 1, 1,
0.1902779, -1.878246, 4.536978, 0, 0.6588235, 1, 1,
0.1928047, 0.4254574, -0.6685546, 0, 0.6509804, 1, 1,
0.1996286, 0.9811991, -0.5011701, 0, 0.6470588, 1, 1,
0.204832, 2.174251, -1.050075, 0, 0.6392157, 1, 1,
0.2052083, 2.767998, 1.848999, 0, 0.6352941, 1, 1,
0.2075671, 0.1830834, 0.9987005, 0, 0.627451, 1, 1,
0.208885, -1.372029, 4.057084, 0, 0.6235294, 1, 1,
0.2095231, 0.334753, -0.4781514, 0, 0.6156863, 1, 1,
0.2105309, 1.173357, -0.4944479, 0, 0.6117647, 1, 1,
0.2131963, 0.770098, 2.329693, 0, 0.6039216, 1, 1,
0.2284398, 0.4519286, 0.7989005, 0, 0.5960785, 1, 1,
0.2315192, 0.2896886, 0.730024, 0, 0.5921569, 1, 1,
0.2315407, -0.5886316, 5.029137, 0, 0.5843138, 1, 1,
0.2355549, -0.2068554, 3.920707, 0, 0.5803922, 1, 1,
0.2369253, -1.332552, 3.716381, 0, 0.572549, 1, 1,
0.2373009, -0.1348752, 2.472458, 0, 0.5686275, 1, 1,
0.2374913, 1.50411, 0.01520755, 0, 0.5607843, 1, 1,
0.238297, 1.958457, -0.9473116, 0, 0.5568628, 1, 1,
0.2433837, 0.703555, 1.38457, 0, 0.5490196, 1, 1,
0.2434411, -0.07787629, 2.044078, 0, 0.5450981, 1, 1,
0.2447007, 1.638679, -1.016814, 0, 0.5372549, 1, 1,
0.2452118, -0.5857263, 2.100529, 0, 0.5333334, 1, 1,
0.2471671, 0.3847243, 0.4320411, 0, 0.5254902, 1, 1,
0.2509073, 0.7865079, 1.236526, 0, 0.5215687, 1, 1,
0.2544832, 0.1250815, -0.6118909, 0, 0.5137255, 1, 1,
0.2557012, -0.8253162, 3.18204, 0, 0.509804, 1, 1,
0.2613761, -0.7884361, 2.42636, 0, 0.5019608, 1, 1,
0.2624263, 1.172834, 0.6628508, 0, 0.4941176, 1, 1,
0.2635017, -1.664925, 1.826836, 0, 0.4901961, 1, 1,
0.2637199, 1.337458, -0.8319932, 0, 0.4823529, 1, 1,
0.2652093, -0.1322131, 2.573446, 0, 0.4784314, 1, 1,
0.2680911, -0.3212992, 1.900565, 0, 0.4705882, 1, 1,
0.2696869, 0.5345318, 0.4766889, 0, 0.4666667, 1, 1,
0.2714428, 1.431785, 0.3605668, 0, 0.4588235, 1, 1,
0.2715209, -2.830571, 2.004723, 0, 0.454902, 1, 1,
0.2742431, -0.6183092, 3.698489, 0, 0.4470588, 1, 1,
0.2746683, 0.6046036, 0.7890142, 0, 0.4431373, 1, 1,
0.2750312, -0.6388373, 1.887376, 0, 0.4352941, 1, 1,
0.2770093, -0.8267437, 1.063224, 0, 0.4313726, 1, 1,
0.2820065, -1.416952, 3.197132, 0, 0.4235294, 1, 1,
0.2835516, 1.954869, -0.2493796, 0, 0.4196078, 1, 1,
0.2839966, -0.3737499, 2.3292, 0, 0.4117647, 1, 1,
0.2941401, -0.3165395, 2.242993, 0, 0.4078431, 1, 1,
0.2969121, 1.157747, 0.9376426, 0, 0.4, 1, 1,
0.2981074, -0.4346281, 0.5768198, 0, 0.3921569, 1, 1,
0.2984473, 0.1191732, 2.01279, 0, 0.3882353, 1, 1,
0.3055696, -0.7629379, 1.792294, 0, 0.3803922, 1, 1,
0.3078313, 0.771227, -0.03277994, 0, 0.3764706, 1, 1,
0.3086684, 0.6890157, -0.6706244, 0, 0.3686275, 1, 1,
0.3104823, 0.7051201, -0.1490492, 0, 0.3647059, 1, 1,
0.3144844, -0.3091021, 1.356038, 0, 0.3568628, 1, 1,
0.3158084, -0.4475786, 2.819268, 0, 0.3529412, 1, 1,
0.3168319, -1.801701, 2.885659, 0, 0.345098, 1, 1,
0.3173865, 0.9228484, 1.625198, 0, 0.3411765, 1, 1,
0.3208199, -0.8091202, 5.223982, 0, 0.3333333, 1, 1,
0.3214512, 1.306287, -1.83524, 0, 0.3294118, 1, 1,
0.3220927, -0.592949, 1.981252, 0, 0.3215686, 1, 1,
0.3221793, 0.4886063, 1.376245, 0, 0.3176471, 1, 1,
0.3222428, -0.8604253, 3.588763, 0, 0.3098039, 1, 1,
0.3245969, -1.393878, 4.588864, 0, 0.3058824, 1, 1,
0.3255066, 1.329079, 0.7571144, 0, 0.2980392, 1, 1,
0.3270802, -0.6490076, 2.799957, 0, 0.2901961, 1, 1,
0.3309196, 0.4596605, 1.654163, 0, 0.2862745, 1, 1,
0.3339289, 0.9485984, -0.4723369, 0, 0.2784314, 1, 1,
0.3355418, 2.210891, 1.222558, 0, 0.2745098, 1, 1,
0.3392846, -0.5322072, 2.181489, 0, 0.2666667, 1, 1,
0.3478967, -0.5635722, 2.51675, 0, 0.2627451, 1, 1,
0.3479925, 1.600388, 1.005543, 0, 0.254902, 1, 1,
0.3486877, -0.4958784, 2.960513, 0, 0.2509804, 1, 1,
0.3526592, -0.9839793, 0.1267895, 0, 0.2431373, 1, 1,
0.3531287, 2.131754, -0.5438531, 0, 0.2392157, 1, 1,
0.3547369, -1.210367, 1.095726, 0, 0.2313726, 1, 1,
0.3548948, 0.781418, 1.646233, 0, 0.227451, 1, 1,
0.3603098, 0.003026365, 1.512863, 0, 0.2196078, 1, 1,
0.3738607, 1.101181, 1.535033, 0, 0.2156863, 1, 1,
0.3809461, -0.1350883, 0.817939, 0, 0.2078431, 1, 1,
0.3814508, 2.33885, -0.2064008, 0, 0.2039216, 1, 1,
0.3822949, 1.064208, -0.340981, 0, 0.1960784, 1, 1,
0.3863367, 1.161251, 0.5600172, 0, 0.1882353, 1, 1,
0.3873683, -0.1271225, 3.119901, 0, 0.1843137, 1, 1,
0.3908991, -0.8940194, 1.766441, 0, 0.1764706, 1, 1,
0.3950329, 1.029637, 0.232372, 0, 0.172549, 1, 1,
0.3957135, 0.5913164, 0.396845, 0, 0.1647059, 1, 1,
0.3985185, 0.3665343, 2.044913, 0, 0.1607843, 1, 1,
0.4031622, -0.002389864, 3.08049, 0, 0.1529412, 1, 1,
0.403676, -0.6632425, 2.196761, 0, 0.1490196, 1, 1,
0.40511, -0.2554416, 1.294355, 0, 0.1411765, 1, 1,
0.4092551, -0.3500498, 2.164335, 0, 0.1372549, 1, 1,
0.4119297, -1.050344, 3.861143, 0, 0.1294118, 1, 1,
0.4236007, 0.204123, 0.7329311, 0, 0.1254902, 1, 1,
0.424291, -0.5582472, 1.792194, 0, 0.1176471, 1, 1,
0.4246637, 0.4978133, -0.4466378, 0, 0.1137255, 1, 1,
0.426179, -0.9801254, 2.968709, 0, 0.1058824, 1, 1,
0.4261984, -0.5759359, 1.445904, 0, 0.09803922, 1, 1,
0.4315632, 0.1449727, 1.5114, 0, 0.09411765, 1, 1,
0.4399859, -1.260954, 3.224759, 0, 0.08627451, 1, 1,
0.4425966, -0.5285057, 3.732986, 0, 0.08235294, 1, 1,
0.4442115, 0.5884491, -0.1756919, 0, 0.07450981, 1, 1,
0.4458736, 1.525181, 0.2838573, 0, 0.07058824, 1, 1,
0.4503788, -0.686668, 0.7784892, 0, 0.0627451, 1, 1,
0.453761, -0.3399433, 2.420555, 0, 0.05882353, 1, 1,
0.4563146, 1.492477, 0.6035228, 0, 0.05098039, 1, 1,
0.4579955, 0.01172864, 1.262632, 0, 0.04705882, 1, 1,
0.4590999, -0.9976702, 1.965968, 0, 0.03921569, 1, 1,
0.4594089, -0.5104461, 2.467968, 0, 0.03529412, 1, 1,
0.4612347, 0.9119584, 0.3531721, 0, 0.02745098, 1, 1,
0.4625613, 1.217742, -0.3686519, 0, 0.02352941, 1, 1,
0.4630173, -1.548211, 2.203469, 0, 0.01568628, 1, 1,
0.4644725, 0.2025538, 1.043272, 0, 0.01176471, 1, 1,
0.4664286, 0.8145757, 0.02383304, 0, 0.003921569, 1, 1,
0.4704455, -1.408779, 2.264109, 0.003921569, 0, 1, 1,
0.4705869, -1.903264, 2.786166, 0.007843138, 0, 1, 1,
0.4714448, 0.4311639, 1.015521, 0.01568628, 0, 1, 1,
0.4728586, -0.2943053, 2.323987, 0.01960784, 0, 1, 1,
0.4755065, 2.549881, -2.041604, 0.02745098, 0, 1, 1,
0.4760892, 0.73885, 0.5719281, 0.03137255, 0, 1, 1,
0.4764255, 0.4726992, -0.4557438, 0.03921569, 0, 1, 1,
0.4777659, -0.4476537, 3.406888, 0.04313726, 0, 1, 1,
0.4777868, -0.5701506, 2.888318, 0.05098039, 0, 1, 1,
0.4787801, -0.286231, 0.6049007, 0.05490196, 0, 1, 1,
0.4809159, 1.183882, -0.02730815, 0.0627451, 0, 1, 1,
0.4862134, 0.8418455, -0.4457135, 0.06666667, 0, 1, 1,
0.488842, 2.135779, 1.311914, 0.07450981, 0, 1, 1,
0.4905284, 0.6794412, 2.228368, 0.07843138, 0, 1, 1,
0.4919499, -0.6955605, 2.310944, 0.08627451, 0, 1, 1,
0.49324, 0.4336167, -0.2965165, 0.09019608, 0, 1, 1,
0.4942356, -0.4482591, 1.73096, 0.09803922, 0, 1, 1,
0.4968539, -1.127532, 1.845601, 0.1058824, 0, 1, 1,
0.4985105, -1.934182, 3.30152, 0.1098039, 0, 1, 1,
0.4996009, 1.073562, 0.7734833, 0.1176471, 0, 1, 1,
0.5007833, -0.22963, 3.990727, 0.1215686, 0, 1, 1,
0.5079193, -0.3436072, 0.9201576, 0.1294118, 0, 1, 1,
0.5101707, -0.5066797, 1.336067, 0.1333333, 0, 1, 1,
0.5171971, 0.9032161, 1.564012, 0.1411765, 0, 1, 1,
0.5185775, -0.9652243, 1.217241, 0.145098, 0, 1, 1,
0.5203324, -0.5981915, 4.124306, 0.1529412, 0, 1, 1,
0.5213649, 0.8996422, 0.5389431, 0.1568628, 0, 1, 1,
0.5220193, -0.180633, 0.4547223, 0.1647059, 0, 1, 1,
0.528384, 1.030536, 1.362301, 0.1686275, 0, 1, 1,
0.5304479, -0.6273487, 2.389176, 0.1764706, 0, 1, 1,
0.531621, -0.7184351, 2.060187, 0.1803922, 0, 1, 1,
0.5347933, 1.441429, 1.805256, 0.1882353, 0, 1, 1,
0.5405335, -0.3484836, 4.027087, 0.1921569, 0, 1, 1,
0.5412707, 1.770025, -0.3293138, 0.2, 0, 1, 1,
0.5500616, 2.587433, 0.9174309, 0.2078431, 0, 1, 1,
0.5501094, -0.3884684, 2.008309, 0.2117647, 0, 1, 1,
0.5536672, 0.7653717, 0.5073238, 0.2196078, 0, 1, 1,
0.5576199, -2.31929, 3.228341, 0.2235294, 0, 1, 1,
0.55792, 0.2039675, 0.1362249, 0.2313726, 0, 1, 1,
0.5585509, 0.07395785, 2.059281, 0.2352941, 0, 1, 1,
0.561142, -0.9274813, 2.254244, 0.2431373, 0, 1, 1,
0.5696044, -0.0432571, 0.6293665, 0.2470588, 0, 1, 1,
0.5785865, 1.577301, 3.162995, 0.254902, 0, 1, 1,
0.5865824, 1.166775, 1.053378, 0.2588235, 0, 1, 1,
0.5917214, 1.407778, -0.03330813, 0.2666667, 0, 1, 1,
0.5947631, 0.9460238, 0.1683502, 0.2705882, 0, 1, 1,
0.5979674, 0.6854069, 1.289376, 0.2784314, 0, 1, 1,
0.6021731, 0.3957348, -0.354677, 0.282353, 0, 1, 1,
0.6073024, -0.9975774, 1.71138, 0.2901961, 0, 1, 1,
0.6115453, -0.3993946, 2.622284, 0.2941177, 0, 1, 1,
0.6199025, 0.5645139, 1.683787, 0.3019608, 0, 1, 1,
0.6220267, 0.5848189, 0.193924, 0.3098039, 0, 1, 1,
0.6244757, 1.177867, 1.329688, 0.3137255, 0, 1, 1,
0.6245095, -0.8908621, 2.499596, 0.3215686, 0, 1, 1,
0.6312251, 0.5072067, 1.597494, 0.3254902, 0, 1, 1,
0.6341965, 0.6637095, -0.8079186, 0.3333333, 0, 1, 1,
0.6363676, 0.1650475, 1.505358, 0.3372549, 0, 1, 1,
0.6428142, -1.861964, 3.273394, 0.345098, 0, 1, 1,
0.6449066, -1.712824, 2.701185, 0.3490196, 0, 1, 1,
0.6467965, 0.2796034, -0.03706818, 0.3568628, 0, 1, 1,
0.6500032, -0.6092597, 3.016813, 0.3607843, 0, 1, 1,
0.6522641, -0.7378015, 2.226093, 0.3686275, 0, 1, 1,
0.6536078, 0.8633998, 1.692252, 0.372549, 0, 1, 1,
0.6577871, 1.492206, 1.852864, 0.3803922, 0, 1, 1,
0.6606739, 0.9202492, -0.08801819, 0.3843137, 0, 1, 1,
0.662322, -0.08158776, 2.417645, 0.3921569, 0, 1, 1,
0.665078, -1.072981, 2.574465, 0.3960784, 0, 1, 1,
0.6681093, -1.155075, 2.597662, 0.4039216, 0, 1, 1,
0.6796368, -1.729292, 4.090217, 0.4117647, 0, 1, 1,
0.6807006, -0.4836132, 3.225754, 0.4156863, 0, 1, 1,
0.6807715, 0.2211401, 2.58807, 0.4235294, 0, 1, 1,
0.6906695, -1.453066, 3.079914, 0.427451, 0, 1, 1,
0.6949649, 0.05808379, 2.52679, 0.4352941, 0, 1, 1,
0.6981277, 0.008433091, 2.450559, 0.4392157, 0, 1, 1,
0.701095, -0.6120983, 3.120383, 0.4470588, 0, 1, 1,
0.7134818, -0.03274504, 1.60462, 0.4509804, 0, 1, 1,
0.7154523, 1.418676, 0.6486682, 0.4588235, 0, 1, 1,
0.7181339, -1.65316, 2.018269, 0.4627451, 0, 1, 1,
0.7230329, 0.09583097, 0.6020371, 0.4705882, 0, 1, 1,
0.724807, 0.003967073, 2.172174, 0.4745098, 0, 1, 1,
0.7254366, -0.73641, 2.487387, 0.4823529, 0, 1, 1,
0.7287964, 1.300351, -0.2854884, 0.4862745, 0, 1, 1,
0.7300704, 0.3491952, 1.085962, 0.4941176, 0, 1, 1,
0.7318128, -0.6807575, 2.050611, 0.5019608, 0, 1, 1,
0.7442484, -2.739959, 1.81197, 0.5058824, 0, 1, 1,
0.7467667, 0.5006568, 1.007216, 0.5137255, 0, 1, 1,
0.7494596, 0.3849978, 0.3385771, 0.5176471, 0, 1, 1,
0.751422, 1.946685, -0.01732042, 0.5254902, 0, 1, 1,
0.7584577, 1.072141, -0.7818406, 0.5294118, 0, 1, 1,
0.7593884, -0.372533, 1.241306, 0.5372549, 0, 1, 1,
0.7677295, 1.06365, 1.116369, 0.5411765, 0, 1, 1,
0.7709435, -0.6587348, 3.261867, 0.5490196, 0, 1, 1,
0.77133, -1.961068, 3.311741, 0.5529412, 0, 1, 1,
0.7717736, -0.1300365, 0.9656358, 0.5607843, 0, 1, 1,
0.7724028, -0.6365577, 2.580488, 0.5647059, 0, 1, 1,
0.7737322, -0.8320833, 0.882295, 0.572549, 0, 1, 1,
0.7746323, 1.386423, 1.058237, 0.5764706, 0, 1, 1,
0.777106, 0.6492696, 0.7350848, 0.5843138, 0, 1, 1,
0.7804864, 1.172991, 1.041853, 0.5882353, 0, 1, 1,
0.7816119, 0.8292314, 0.2992264, 0.5960785, 0, 1, 1,
0.7976213, 1.080887, 0.4529789, 0.6039216, 0, 1, 1,
0.8003232, 0.4145811, 0.2772838, 0.6078432, 0, 1, 1,
0.8007798, 0.7997208, 0.522132, 0.6156863, 0, 1, 1,
0.8108945, 0.6299279, 0.3489514, 0.6196079, 0, 1, 1,
0.8175668, -0.8110651, 1.430039, 0.627451, 0, 1, 1,
0.8203493, -1.188273, 1.617627, 0.6313726, 0, 1, 1,
0.8250806, 0.5306429, 1.428853, 0.6392157, 0, 1, 1,
0.8272952, -1.915967, 3.296835, 0.6431373, 0, 1, 1,
0.8296175, 0.07264244, 0.3228797, 0.6509804, 0, 1, 1,
0.8430247, -0.7569618, 3.785222, 0.654902, 0, 1, 1,
0.8441097, 0.7022243, 1.268769, 0.6627451, 0, 1, 1,
0.8443799, -0.08583175, 1.575314, 0.6666667, 0, 1, 1,
0.8464261, 1.24517, 2.349528, 0.6745098, 0, 1, 1,
0.8515263, -0.505449, 1.287226, 0.6784314, 0, 1, 1,
0.8521558, 0.7286779, 2.297494, 0.6862745, 0, 1, 1,
0.8553345, -0.02701162, 2.948932, 0.6901961, 0, 1, 1,
0.857272, -1.2514, 3.134176, 0.6980392, 0, 1, 1,
0.8581014, -0.5897754, 1.540943, 0.7058824, 0, 1, 1,
0.8608781, -0.9747679, 1.37824, 0.7098039, 0, 1, 1,
0.869468, 0.387901, 0.7143607, 0.7176471, 0, 1, 1,
0.8695931, 0.8559044, 0.8671637, 0.7215686, 0, 1, 1,
0.8710479, -0.737134, 2.341364, 0.7294118, 0, 1, 1,
0.871137, 1.314123, -0.1497581, 0.7333333, 0, 1, 1,
0.8760266, -2.285568, 2.056944, 0.7411765, 0, 1, 1,
0.8789673, -1.072179, 1.973948, 0.7450981, 0, 1, 1,
0.8794962, -1.392834, 2.600783, 0.7529412, 0, 1, 1,
0.8801174, 1.620791, -0.05909013, 0.7568628, 0, 1, 1,
0.8826779, 0.2396864, 2.002514, 0.7647059, 0, 1, 1,
0.8868144, -0.8282821, 3.480776, 0.7686275, 0, 1, 1,
0.8875245, -0.1099515, 1.12512, 0.7764706, 0, 1, 1,
0.891326, 1.659644, 0.6576155, 0.7803922, 0, 1, 1,
0.8943429, -1.029935, 1.713737, 0.7882353, 0, 1, 1,
0.9003402, 0.6553465, -0.6915133, 0.7921569, 0, 1, 1,
0.9119706, -0.01649206, 1.684164, 0.8, 0, 1, 1,
0.9120335, 1.173416, 1.186282, 0.8078431, 0, 1, 1,
0.9120677, 0.4670917, 2.461685, 0.8117647, 0, 1, 1,
0.9136178, 1.465195, 0.3548996, 0.8196079, 0, 1, 1,
0.914367, 1.248278, -0.04203278, 0.8235294, 0, 1, 1,
0.9182659, -0.4826403, 1.030922, 0.8313726, 0, 1, 1,
0.9196107, -1.411117, 0.166402, 0.8352941, 0, 1, 1,
0.925906, -0.1523636, 1.066139, 0.8431373, 0, 1, 1,
0.9331757, 0.1676624, 2.391028, 0.8470588, 0, 1, 1,
0.9402447, 1.287544, -0.5684924, 0.854902, 0, 1, 1,
0.9405018, 0.09970816, 1.034201, 0.8588235, 0, 1, 1,
0.9405982, 1.750498, 1.693938, 0.8666667, 0, 1, 1,
0.9411242, 0.4108652, -0.02199973, 0.8705882, 0, 1, 1,
0.9460037, -0.3315731, 1.904831, 0.8784314, 0, 1, 1,
0.947394, 0.2093022, 0.3560802, 0.8823529, 0, 1, 1,
0.9488629, 0.3214426, -1.404159, 0.8901961, 0, 1, 1,
0.9631003, -0.1637116, 1.342648, 0.8941177, 0, 1, 1,
0.9659607, -0.5422034, 2.214325, 0.9019608, 0, 1, 1,
0.9759371, -0.147561, 0.9410265, 0.9098039, 0, 1, 1,
0.9939334, -0.3847051, 2.382736, 0.9137255, 0, 1, 1,
0.9945657, 0.1428805, 3.034862, 0.9215686, 0, 1, 1,
0.9961898, 1.430879, 1.616637, 0.9254902, 0, 1, 1,
0.9993351, 0.2157067, 1.282007, 0.9333333, 0, 1, 1,
1.001094, -0.9061267, 4.119256, 0.9372549, 0, 1, 1,
1.001181, 0.1425383, 0.09857217, 0.945098, 0, 1, 1,
1.007107, 2.101031, -0.516236, 0.9490196, 0, 1, 1,
1.013629, 1.242137, 1.104846, 0.9568627, 0, 1, 1,
1.015411, 0.7832109, 1.298884, 0.9607843, 0, 1, 1,
1.016802, -0.8601155, 2.863589, 0.9686275, 0, 1, 1,
1.017655, -1.456285, 5.483817, 0.972549, 0, 1, 1,
1.019408, -0.66212, 0.8395162, 0.9803922, 0, 1, 1,
1.01961, -0.8531044, 1.81459, 0.9843137, 0, 1, 1,
1.027064, 1.219081, 0.9784155, 0.9921569, 0, 1, 1,
1.033387, 2.241484, 0.1532227, 0.9960784, 0, 1, 1,
1.036437, -0.6241568, 3.456482, 1, 0, 0.9960784, 1,
1.046401, 0.486101, 2.82107, 1, 0, 0.9882353, 1,
1.048692, 0.02690026, 0.9379146, 1, 0, 0.9843137, 1,
1.049867, -1.425689, 2.821016, 1, 0, 0.9764706, 1,
1.06826, 1.184349, 2.172218, 1, 0, 0.972549, 1,
1.075599, 1.228349, 1.097866, 1, 0, 0.9647059, 1,
1.0769, 0.8890696, 0.1160727, 1, 0, 0.9607843, 1,
1.082819, 0.616766, 2.671057, 1, 0, 0.9529412, 1,
1.083952, -0.636936, 1.627415, 1, 0, 0.9490196, 1,
1.084969, -1.451653, 3.278261, 1, 0, 0.9411765, 1,
1.087476, 0.9625197, -0.1350405, 1, 0, 0.9372549, 1,
1.092036, 1.264427, -0.07638438, 1, 0, 0.9294118, 1,
1.098446, 0.5299153, 0.9601447, 1, 0, 0.9254902, 1,
1.110965, -1.100235, 1.611229, 1, 0, 0.9176471, 1,
1.115578, 1.864477, 0.1103041, 1, 0, 0.9137255, 1,
1.116228, 0.3317515, 0.8700329, 1, 0, 0.9058824, 1,
1.12629, 0.75948, 0.2116685, 1, 0, 0.9019608, 1,
1.140443, -0.7739645, 2.279811, 1, 0, 0.8941177, 1,
1.143658, -0.4342322, 1.927263, 1, 0, 0.8862745, 1,
1.145369, -0.08415093, -0.1221954, 1, 0, 0.8823529, 1,
1.147309, -0.440603, 0.9978113, 1, 0, 0.8745098, 1,
1.155594, -1.073311, 3.609742, 1, 0, 0.8705882, 1,
1.156922, 2.038154, 0.02186742, 1, 0, 0.8627451, 1,
1.157008, 0.34697, -0.8713711, 1, 0, 0.8588235, 1,
1.157502, 0.8052614, 0.9236916, 1, 0, 0.8509804, 1,
1.165997, -0.07582861, 2.763851, 1, 0, 0.8470588, 1,
1.169455, 0.6467993, 2.023849, 1, 0, 0.8392157, 1,
1.176757, -0.8107315, 0.6525835, 1, 0, 0.8352941, 1,
1.176948, 0.7019477, 2.507766, 1, 0, 0.827451, 1,
1.180603, 1.395355, -0.2581768, 1, 0, 0.8235294, 1,
1.181509, -0.07528876, 1.603315, 1, 0, 0.8156863, 1,
1.183168, 0.07780007, 0.8560573, 1, 0, 0.8117647, 1,
1.185102, 0.03909927, 0.6947927, 1, 0, 0.8039216, 1,
1.185788, -1.375631, 1.621851, 1, 0, 0.7960784, 1,
1.186146, 0.2088682, 0.3734999, 1, 0, 0.7921569, 1,
1.188714, 1.629465, 1.476989, 1, 0, 0.7843137, 1,
1.193295, 0.4537883, 1.478805, 1, 0, 0.7803922, 1,
1.199442, -0.3196966, 2.836791, 1, 0, 0.772549, 1,
1.208373, 0.3181947, 2.541903, 1, 0, 0.7686275, 1,
1.213505, 1.907374, 1.273936, 1, 0, 0.7607843, 1,
1.220079, 0.07879801, 0.4807968, 1, 0, 0.7568628, 1,
1.22196, 0.7277822, 0.6526455, 1, 0, 0.7490196, 1,
1.227718, 0.1736667, 1.032372, 1, 0, 0.7450981, 1,
1.237221, -0.0201014, 2.113454, 1, 0, 0.7372549, 1,
1.24612, -1.722097, 1.110834, 1, 0, 0.7333333, 1,
1.252329, -0.6202316, 3.496672, 1, 0, 0.7254902, 1,
1.256467, 1.005581, -0.7642707, 1, 0, 0.7215686, 1,
1.26934, -1.972527, 2.482667, 1, 0, 0.7137255, 1,
1.270968, -0.7038374, 1.174115, 1, 0, 0.7098039, 1,
1.289705, 1.056899, -0.5228379, 1, 0, 0.7019608, 1,
1.290994, -2.027865, 2.291094, 1, 0, 0.6941177, 1,
1.293808, 0.5038967, -1.584781, 1, 0, 0.6901961, 1,
1.294038, -0.07956823, 1.828731, 1, 0, 0.682353, 1,
1.308183, -1.767035, 4.460016, 1, 0, 0.6784314, 1,
1.320649, -2.304352, 1.649189, 1, 0, 0.6705883, 1,
1.324695, 0.1623777, 1.162074, 1, 0, 0.6666667, 1,
1.32753, -0.7357738, 2.259395, 1, 0, 0.6588235, 1,
1.328021, -0.2976557, -0.03930687, 1, 0, 0.654902, 1,
1.342105, -0.6214175, 1.863346, 1, 0, 0.6470588, 1,
1.348361, -0.02142591, 1.300337, 1, 0, 0.6431373, 1,
1.354402, 0.1272861, 1.09583, 1, 0, 0.6352941, 1,
1.368603, -0.4016324, 2.368022, 1, 0, 0.6313726, 1,
1.375063, 0.1848725, 2.040082, 1, 0, 0.6235294, 1,
1.377893, -0.4732516, 2.834147, 1, 0, 0.6196079, 1,
1.377898, 0.6748206, -0.3510675, 1, 0, 0.6117647, 1,
1.390086, -0.3685113, 1.68082, 1, 0, 0.6078432, 1,
1.393584, 0.6399651, 0.2304959, 1, 0, 0.6, 1,
1.394329, -0.3687528, 2.669509, 1, 0, 0.5921569, 1,
1.395773, 1.231247, 0.5228013, 1, 0, 0.5882353, 1,
1.401657, -0.831246, 1.638426, 1, 0, 0.5803922, 1,
1.402426, -1.41184, 3.287539, 1, 0, 0.5764706, 1,
1.405483, 1.30835, 0.7224464, 1, 0, 0.5686275, 1,
1.41008, 0.8564688, 1.85464, 1, 0, 0.5647059, 1,
1.414596, -0.7928669, 2.358795, 1, 0, 0.5568628, 1,
1.417506, 1.35746, 1.720387, 1, 0, 0.5529412, 1,
1.422196, -0.8992777, 1.152102, 1, 0, 0.5450981, 1,
1.429127, -1.366574, 1.839487, 1, 0, 0.5411765, 1,
1.429641, 0.1821269, 1.239126, 1, 0, 0.5333334, 1,
1.449403, -1.531715, 2.03409, 1, 0, 0.5294118, 1,
1.449877, -0.3149734, 0.5763091, 1, 0, 0.5215687, 1,
1.452803, -0.5093181, 0.2534327, 1, 0, 0.5176471, 1,
1.458649, -0.2810821, 1.934979, 1, 0, 0.509804, 1,
1.459573, 1.021051, -0.1561571, 1, 0, 0.5058824, 1,
1.468729, -1.199095, 2.705318, 1, 0, 0.4980392, 1,
1.487192, 0.1196966, -0.09996089, 1, 0, 0.4901961, 1,
1.489427, 0.3161043, 0.8260332, 1, 0, 0.4862745, 1,
1.489814, -0.6187986, 1.960991, 1, 0, 0.4784314, 1,
1.505158, 0.2396985, -0.1345638, 1, 0, 0.4745098, 1,
1.510616, -0.5361184, 2.435556, 1, 0, 0.4666667, 1,
1.511056, -0.4689602, 3.133132, 1, 0, 0.4627451, 1,
1.511742, -1.120411, 3.091029, 1, 0, 0.454902, 1,
1.519178, -1.046947, 2.56076, 1, 0, 0.4509804, 1,
1.525702, 0.1618721, 3.303717, 1, 0, 0.4431373, 1,
1.531684, -1.815661, 2.906583, 1, 0, 0.4392157, 1,
1.545732, 0.6828395, 2.04437, 1, 0, 0.4313726, 1,
1.546003, -0.7310848, 1.873795, 1, 0, 0.427451, 1,
1.551324, 0.352611, 2.240934, 1, 0, 0.4196078, 1,
1.552852, -0.8373607, 1.156499, 1, 0, 0.4156863, 1,
1.555919, 0.06252862, 0.5050502, 1, 0, 0.4078431, 1,
1.579647, -0.9453559, 2.546193, 1, 0, 0.4039216, 1,
1.591417, 0.2250364, 2.697911, 1, 0, 0.3960784, 1,
1.61003, -1.095174, 3.20813, 1, 0, 0.3882353, 1,
1.616538, -0.3895098, 0.984915, 1, 0, 0.3843137, 1,
1.631024, -0.9451591, 1.358213, 1, 0, 0.3764706, 1,
1.646613, -0.9868266, 1.868208, 1, 0, 0.372549, 1,
1.651274, -1.075322, 2.281823, 1, 0, 0.3647059, 1,
1.659722, -0.4983796, 2.062348, 1, 0, 0.3607843, 1,
1.664423, 0.9401529, 1.94127, 1, 0, 0.3529412, 1,
1.671972, -0.7142912, 1.381737, 1, 0, 0.3490196, 1,
1.69253, 0.1888918, 1.955183, 1, 0, 0.3411765, 1,
1.698731, -1.020165, 1.143351, 1, 0, 0.3372549, 1,
1.705929, 0.599654, 0.6117995, 1, 0, 0.3294118, 1,
1.711386, 1.457721, 0.3046384, 1, 0, 0.3254902, 1,
1.716572, 1.298477, 1.892863, 1, 0, 0.3176471, 1,
1.73866, 0.4348137, 1.274537, 1, 0, 0.3137255, 1,
1.740619, 0.6838524, 0.8128819, 1, 0, 0.3058824, 1,
1.758178, -0.5662732, 2.795561, 1, 0, 0.2980392, 1,
1.767566, 0.6887237, 0.9088002, 1, 0, 0.2941177, 1,
1.77224, 0.7053515, 1.348146, 1, 0, 0.2862745, 1,
1.787678, -0.5046143, -0.1856098, 1, 0, 0.282353, 1,
1.788898, 1.066281, 2.286186, 1, 0, 0.2745098, 1,
1.798141, 1.791596, 1.154791, 1, 0, 0.2705882, 1,
1.806552, 0.7693157, 1.277723, 1, 0, 0.2627451, 1,
1.819856, -0.8465461, 1.559896, 1, 0, 0.2588235, 1,
1.823198, -1.413344, 2.721358, 1, 0, 0.2509804, 1,
1.833201, 0.9998289, 2.256071, 1, 0, 0.2470588, 1,
1.838934, -0.07261236, 2.252711, 1, 0, 0.2392157, 1,
1.850405, 0.3496945, 1.464366, 1, 0, 0.2352941, 1,
1.862048, 0.3263668, 1.139696, 1, 0, 0.227451, 1,
1.863331, -0.7406995, 0.6329896, 1, 0, 0.2235294, 1,
1.866907, 0.08008111, 2.966673, 1, 0, 0.2156863, 1,
1.894595, 0.04782281, 1.118277, 1, 0, 0.2117647, 1,
1.945573, 1.138602, 1.672786, 1, 0, 0.2039216, 1,
1.950608, 1.283297, 0.4412296, 1, 0, 0.1960784, 1,
1.954736, 0.6793192, 2.080279, 1, 0, 0.1921569, 1,
1.961407, 1.327166, 0.2892103, 1, 0, 0.1843137, 1,
1.967382, -0.9121997, 2.970709, 1, 0, 0.1803922, 1,
1.983337, -0.8290626, 2.787581, 1, 0, 0.172549, 1,
2.018994, 2.123998, 0.2280132, 1, 0, 0.1686275, 1,
2.020047, -0.7656642, 2.281223, 1, 0, 0.1607843, 1,
2.034195, -0.2201078, 1.221329, 1, 0, 0.1568628, 1,
2.047709, -0.166392, 1.856405, 1, 0, 0.1490196, 1,
2.064682, 0.3196645, -0.05738429, 1, 0, 0.145098, 1,
2.085172, 0.07491162, 2.282591, 1, 0, 0.1372549, 1,
2.087964, 1.889683, 2.352221, 1, 0, 0.1333333, 1,
2.089424, 0.3479688, 1.731891, 1, 0, 0.1254902, 1,
2.10462, -0.6852872, 0.5771803, 1, 0, 0.1215686, 1,
2.107591, 1.055734, 1.515269, 1, 0, 0.1137255, 1,
2.112532, -0.5604116, 2.473619, 1, 0, 0.1098039, 1,
2.129293, -0.6793297, 2.736923, 1, 0, 0.1019608, 1,
2.138582, -0.3276881, 0.1697035, 1, 0, 0.09411765, 1,
2.149048, 2.24279, 0.8655076, 1, 0, 0.09019608, 1,
2.278235, 0.2829749, 2.568511, 1, 0, 0.08235294, 1,
2.281361, 1.071105, -0.4769503, 1, 0, 0.07843138, 1,
2.32911, -0.3460046, 2.625832, 1, 0, 0.07058824, 1,
2.398636, -0.2159718, 1.926306, 1, 0, 0.06666667, 1,
2.422998, -1.269233, 0.8884159, 1, 0, 0.05882353, 1,
2.509113, 0.9068896, 0.3931352, 1, 0, 0.05490196, 1,
2.543051, -0.4978289, 1.231438, 1, 0, 0.04705882, 1,
2.79415, 0.09292467, 2.603353, 1, 0, 0.04313726, 1,
2.83194, -1.127618, -0.005771509, 1, 0, 0.03529412, 1,
2.914406, 1.57389, 2.609885, 1, 0, 0.03137255, 1,
3.191882, -0.009077204, 2.762548, 1, 0, 0.02352941, 1,
3.432142, -0.6427613, 2.575998, 1, 0, 0.01960784, 1,
3.487227, 0.7034158, 0.3707236, 1, 0, 0.01176471, 1,
3.966512, 0.3088287, 2.026408, 1, 0, 0.007843138, 1
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
0.2011952, -3.806275, -8.141047, 0, -0.5, 0.5, 0.5,
0.2011952, -3.806275, -8.141047, 1, -0.5, 0.5, 0.5,
0.2011952, -3.806275, -8.141047, 1, 1.5, 0.5, 0.5,
0.2011952, -3.806275, -8.141047, 0, 1.5, 0.5, 0.5
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
-4.840564, 0.04761207, -8.141047, 0, -0.5, 0.5, 0.5,
-4.840564, 0.04761207, -8.141047, 1, -0.5, 0.5, 0.5,
-4.840564, 0.04761207, -8.141047, 1, 1.5, 0.5, 0.5,
-4.840564, 0.04761207, -8.141047, 0, 1.5, 0.5, 0.5
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
-4.840564, -3.806275, -0.3412638, 0, -0.5, 0.5, 0.5,
-4.840564, -3.806275, -0.3412638, 1, -0.5, 0.5, 0.5,
-4.840564, -3.806275, -0.3412638, 1, 1.5, 0.5, 0.5,
-4.840564, -3.806275, -0.3412638, 0, 1.5, 0.5, 0.5
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
-2, -2.916917, -6.341096,
2, -2.916917, -6.341096,
-2, -2.916917, -6.341096,
-2, -3.065143, -6.641088,
0, -2.916917, -6.341096,
0, -3.065143, -6.641088,
2, -2.916917, -6.341096,
2, -3.065143, -6.641088
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
-2, -3.361596, -7.241072, 0, -0.5, 0.5, 0.5,
-2, -3.361596, -7.241072, 1, -0.5, 0.5, 0.5,
-2, -3.361596, -7.241072, 1, 1.5, 0.5, 0.5,
-2, -3.361596, -7.241072, 0, 1.5, 0.5, 0.5,
0, -3.361596, -7.241072, 0, -0.5, 0.5, 0.5,
0, -3.361596, -7.241072, 1, -0.5, 0.5, 0.5,
0, -3.361596, -7.241072, 1, 1.5, 0.5, 0.5,
0, -3.361596, -7.241072, 0, 1.5, 0.5, 0.5,
2, -3.361596, -7.241072, 0, -0.5, 0.5, 0.5,
2, -3.361596, -7.241072, 1, -0.5, 0.5, 0.5,
2, -3.361596, -7.241072, 1, 1.5, 0.5, 0.5,
2, -3.361596, -7.241072, 0, 1.5, 0.5, 0.5
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
-3.677081, -2, -6.341096,
-3.677081, 2, -6.341096,
-3.677081, -2, -6.341096,
-3.870995, -2, -6.641088,
-3.677081, -1, -6.341096,
-3.870995, -1, -6.641088,
-3.677081, 0, -6.341096,
-3.870995, 0, -6.641088,
-3.677081, 1, -6.341096,
-3.870995, 1, -6.641088,
-3.677081, 2, -6.341096,
-3.870995, 2, -6.641088
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
-4.258822, -2, -7.241072, 0, -0.5, 0.5, 0.5,
-4.258822, -2, -7.241072, 1, -0.5, 0.5, 0.5,
-4.258822, -2, -7.241072, 1, 1.5, 0.5, 0.5,
-4.258822, -2, -7.241072, 0, 1.5, 0.5, 0.5,
-4.258822, -1, -7.241072, 0, -0.5, 0.5, 0.5,
-4.258822, -1, -7.241072, 1, -0.5, 0.5, 0.5,
-4.258822, -1, -7.241072, 1, 1.5, 0.5, 0.5,
-4.258822, -1, -7.241072, 0, 1.5, 0.5, 0.5,
-4.258822, 0, -7.241072, 0, -0.5, 0.5, 0.5,
-4.258822, 0, -7.241072, 1, -0.5, 0.5, 0.5,
-4.258822, 0, -7.241072, 1, 1.5, 0.5, 0.5,
-4.258822, 0, -7.241072, 0, 1.5, 0.5, 0.5,
-4.258822, 1, -7.241072, 0, -0.5, 0.5, 0.5,
-4.258822, 1, -7.241072, 1, -0.5, 0.5, 0.5,
-4.258822, 1, -7.241072, 1, 1.5, 0.5, 0.5,
-4.258822, 1, -7.241072, 0, 1.5, 0.5, 0.5,
-4.258822, 2, -7.241072, 0, -0.5, 0.5, 0.5,
-4.258822, 2, -7.241072, 1, -0.5, 0.5, 0.5,
-4.258822, 2, -7.241072, 1, 1.5, 0.5, 0.5,
-4.258822, 2, -7.241072, 0, 1.5, 0.5, 0.5
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
-3.677081, -2.916917, -6,
-3.677081, -2.916917, 4,
-3.677081, -2.916917, -6,
-3.870995, -3.065143, -6,
-3.677081, -2.916917, -4,
-3.870995, -3.065143, -4,
-3.677081, -2.916917, -2,
-3.870995, -3.065143, -2,
-3.677081, -2.916917, 0,
-3.870995, -3.065143, 0,
-3.677081, -2.916917, 2,
-3.870995, -3.065143, 2,
-3.677081, -2.916917, 4,
-3.870995, -3.065143, 4
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
-4.258822, -3.361596, -6, 0, -0.5, 0.5, 0.5,
-4.258822, -3.361596, -6, 1, -0.5, 0.5, 0.5,
-4.258822, -3.361596, -6, 1, 1.5, 0.5, 0.5,
-4.258822, -3.361596, -6, 0, 1.5, 0.5, 0.5,
-4.258822, -3.361596, -4, 0, -0.5, 0.5, 0.5,
-4.258822, -3.361596, -4, 1, -0.5, 0.5, 0.5,
-4.258822, -3.361596, -4, 1, 1.5, 0.5, 0.5,
-4.258822, -3.361596, -4, 0, 1.5, 0.5, 0.5,
-4.258822, -3.361596, -2, 0, -0.5, 0.5, 0.5,
-4.258822, -3.361596, -2, 1, -0.5, 0.5, 0.5,
-4.258822, -3.361596, -2, 1, 1.5, 0.5, 0.5,
-4.258822, -3.361596, -2, 0, 1.5, 0.5, 0.5,
-4.258822, -3.361596, 0, 0, -0.5, 0.5, 0.5,
-4.258822, -3.361596, 0, 1, -0.5, 0.5, 0.5,
-4.258822, -3.361596, 0, 1, 1.5, 0.5, 0.5,
-4.258822, -3.361596, 0, 0, 1.5, 0.5, 0.5,
-4.258822, -3.361596, 2, 0, -0.5, 0.5, 0.5,
-4.258822, -3.361596, 2, 1, -0.5, 0.5, 0.5,
-4.258822, -3.361596, 2, 1, 1.5, 0.5, 0.5,
-4.258822, -3.361596, 2, 0, 1.5, 0.5, 0.5,
-4.258822, -3.361596, 4, 0, -0.5, 0.5, 0.5,
-4.258822, -3.361596, 4, 1, -0.5, 0.5, 0.5,
-4.258822, -3.361596, 4, 1, 1.5, 0.5, 0.5,
-4.258822, -3.361596, 4, 0, 1.5, 0.5, 0.5
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
-3.677081, -2.916917, -6.341096,
-3.677081, 3.012141, -6.341096,
-3.677081, -2.916917, 5.658569,
-3.677081, 3.012141, 5.658569,
-3.677081, -2.916917, -6.341096,
-3.677081, -2.916917, 5.658569,
-3.677081, 3.012141, -6.341096,
-3.677081, 3.012141, 5.658569,
-3.677081, -2.916917, -6.341096,
4.079472, -2.916917, -6.341096,
-3.677081, -2.916917, 5.658569,
4.079472, -2.916917, 5.658569,
-3.677081, 3.012141, -6.341096,
4.079472, 3.012141, -6.341096,
-3.677081, 3.012141, 5.658569,
4.079472, 3.012141, 5.658569,
4.079472, -2.916917, -6.341096,
4.079472, 3.012141, -6.341096,
4.079472, -2.916917, 5.658569,
4.079472, 3.012141, 5.658569,
4.079472, -2.916917, -6.341096,
4.079472, -2.916917, 5.658569,
4.079472, 3.012141, -6.341096,
4.079472, 3.012141, 5.658569
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
var radius = 8.260488;
var distance = 36.75185;
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
mvMatrix.translate( -0.2011952, -0.04761207, 0.3412638 );
mvMatrix.scale( 1.151465, 1.506378, 0.7443042 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.75185);
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
Butane<-read.table("Butane.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Butane$V2
```

```
## Error in eval(expr, envir, enclos): object 'Butane' not found
```

```r
y<-Butane$V3
```

```
## Error in eval(expr, envir, enclos): object 'Butane' not found
```

```r
z<-Butane$V4
```

```
## Error in eval(expr, envir, enclos): object 'Butane' not found
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
-3.564121, 0.01762405, -2.516613, 0, 0, 1, 1, 1,
-3.438878, 0.3532355, -0.7168717, 1, 0, 0, 1, 1,
-3.1904, 1.338295, -1.004487, 1, 0, 0, 1, 1,
-2.922552, -1.181653, -1.302735, 1, 0, 0, 1, 1,
-2.856058, -1.017196, -1.996882, 1, 0, 0, 1, 1,
-2.82225, 0.6155157, -1.75985, 1, 0, 0, 1, 1,
-2.792189, -0.7191485, -2.764324, 0, 0, 0, 1, 1,
-2.788891, -0.8666068, -1.462031, 0, 0, 0, 1, 1,
-2.618286, -2.498151, -2.688078, 0, 0, 0, 1, 1,
-2.58312, -0.499868, -1.407101, 0, 0, 0, 1, 1,
-2.541749, 1.130104, -0.6090868, 0, 0, 0, 1, 1,
-2.412773, -0.252525, -1.481318, 0, 0, 0, 1, 1,
-2.253321, 0.7727793, 0.431178, 0, 0, 0, 1, 1,
-2.212403, 0.6140296, -1.207961, 1, 1, 1, 1, 1,
-2.184183, -1.529733, -1.064341, 1, 1, 1, 1, 1,
-2.169214, 0.4945624, -1.128419, 1, 1, 1, 1, 1,
-2.144974, 0.8536003, -1.512145, 1, 1, 1, 1, 1,
-2.126961, 0.3879262, -0.8519951, 1, 1, 1, 1, 1,
-2.105917, -0.6366194, -2.691737, 1, 1, 1, 1, 1,
-2.084764, -1.179403, -3.019386, 1, 1, 1, 1, 1,
-2.078659, -0.6116898, -0.8721361, 1, 1, 1, 1, 1,
-2.070709, 1.421931, -0.5515772, 1, 1, 1, 1, 1,
-2.032908, -0.9007307, -2.870238, 1, 1, 1, 1, 1,
-2.021856, -1.60185, -2.825555, 1, 1, 1, 1, 1,
-2.013311, 1.201719, -1.802763, 1, 1, 1, 1, 1,
-2.012815, -0.2747869, -2.97377, 1, 1, 1, 1, 1,
-2.010616, -0.272121, -1.983924, 1, 1, 1, 1, 1,
-1.989697, 1.995487, 0.3045059, 1, 1, 1, 1, 1,
-1.980987, 2.231141, -1.806932, 0, 0, 1, 1, 1,
-1.960274, -0.1954293, -2.490103, 1, 0, 0, 1, 1,
-1.935793, 0.2346973, 0.05838939, 1, 0, 0, 1, 1,
-1.933997, -0.003213296, -1.094413, 1, 0, 0, 1, 1,
-1.909049, 0.7939426, -1.674396, 1, 0, 0, 1, 1,
-1.900257, -1.124969, -1.356225, 1, 0, 0, 1, 1,
-1.883127, 0.3707456, 1.244469, 0, 0, 0, 1, 1,
-1.881091, -2.109664, -2.379842, 0, 0, 0, 1, 1,
-1.86918, -1.441186, -4.090345, 0, 0, 0, 1, 1,
-1.842303, 0.2622786, -1.395837, 0, 0, 0, 1, 1,
-1.842264, 0.07770015, -1.305063, 0, 0, 0, 1, 1,
-1.841958, 1.186063, -0.6705432, 0, 0, 0, 1, 1,
-1.838258, 0.5089964, -3.70818, 0, 0, 0, 1, 1,
-1.828436, 0.7878546, -1.092312, 1, 1, 1, 1, 1,
-1.817561, -1.351634, -3.326061, 1, 1, 1, 1, 1,
-1.81447, 1.538738, -1.787677, 1, 1, 1, 1, 1,
-1.814351, -1.08766, -1.044193, 1, 1, 1, 1, 1,
-1.811346, 0.3489268, -0.9619298, 1, 1, 1, 1, 1,
-1.792885, 0.8667038, 0.8879219, 1, 1, 1, 1, 1,
-1.788154, -0.8176591, -1.357614, 1, 1, 1, 1, 1,
-1.774311, -0.9637768, -2.773312, 1, 1, 1, 1, 1,
-1.754299, -0.5645027, -1.631955, 1, 1, 1, 1, 1,
-1.752804, 0.2230546, 0.04051676, 1, 1, 1, 1, 1,
-1.751223, 0.5100045, 0.9894327, 1, 1, 1, 1, 1,
-1.713736, -1.155198, -0.958978, 1, 1, 1, 1, 1,
-1.699273, 0.3424688, -1.762122, 1, 1, 1, 1, 1,
-1.685546, -2.680645, -2.298501, 1, 1, 1, 1, 1,
-1.682222, 1.641664, -0.3024163, 1, 1, 1, 1, 1,
-1.677569, -0.03604829, -2.2608, 0, 0, 1, 1, 1,
-1.666361, -0.4064128, -1.702726, 1, 0, 0, 1, 1,
-1.658525, -0.8551657, -1.509917, 1, 0, 0, 1, 1,
-1.657616, 0.5850399, -2.035281, 1, 0, 0, 1, 1,
-1.639476, 0.05348888, -1.913635, 1, 0, 0, 1, 1,
-1.631254, -0.4994543, -1.549646, 1, 0, 0, 1, 1,
-1.611109, -0.2847647, -2.103481, 0, 0, 0, 1, 1,
-1.603106, 0.3327154, -2.024709, 0, 0, 0, 1, 1,
-1.597746, -0.5920177, -1.584757, 0, 0, 0, 1, 1,
-1.595416, 1.222932, 0.8871644, 0, 0, 0, 1, 1,
-1.581444, -0.4890214, -2.601251, 0, 0, 0, 1, 1,
-1.574701, -0.651145, -0.9352529, 0, 0, 0, 1, 1,
-1.573097, 2.173379, -1.450923, 0, 0, 0, 1, 1,
-1.562412, 0.6066152, -2.020372, 1, 1, 1, 1, 1,
-1.555507, 0.4427786, -0.3451062, 1, 1, 1, 1, 1,
-1.544154, 2.159821, -0.8911524, 1, 1, 1, 1, 1,
-1.525823, -0.05546556, -2.895763, 1, 1, 1, 1, 1,
-1.51454, 1.34732, -1.128787, 1, 1, 1, 1, 1,
-1.512569, 0.1114854, -0.5186909, 1, 1, 1, 1, 1,
-1.511377, -0.8703433, -1.899007, 1, 1, 1, 1, 1,
-1.499832, -0.8836132, -4.107675, 1, 1, 1, 1, 1,
-1.499514, 0.1319425, -1.889381, 1, 1, 1, 1, 1,
-1.477612, -0.4792159, -2.280538, 1, 1, 1, 1, 1,
-1.472184, 0.259103, 1.128999, 1, 1, 1, 1, 1,
-1.469997, 1.042436, -1.86231, 1, 1, 1, 1, 1,
-1.46909, 0.9669282, 0.3375068, 1, 1, 1, 1, 1,
-1.463394, -0.7038365, -1.663487, 1, 1, 1, 1, 1,
-1.461884, -0.6646712, -3.044338, 1, 1, 1, 1, 1,
-1.44155, 0.6298779, -0.4965495, 0, 0, 1, 1, 1,
-1.440556, 2.276216, -0.3747087, 1, 0, 0, 1, 1,
-1.434493, 1.171945, -1.239714, 1, 0, 0, 1, 1,
-1.428238, -0.1717509, -0.7286452, 1, 0, 0, 1, 1,
-1.425973, 0.621173, -1.738384, 1, 0, 0, 1, 1,
-1.413793, 0.4605122, -2.387774, 1, 0, 0, 1, 1,
-1.413294, 0.6332903, -0.2734777, 0, 0, 0, 1, 1,
-1.408082, -0.6585562, -1.705529, 0, 0, 0, 1, 1,
-1.377264, -0.03919389, -1.80925, 0, 0, 0, 1, 1,
-1.369048, -0.3513662, -1.564833, 0, 0, 0, 1, 1,
-1.341141, -0.4160001, -1.979677, 0, 0, 0, 1, 1,
-1.336702, -0.1067622, -2.870442, 0, 0, 0, 1, 1,
-1.331075, 0.6766452, -1.390489, 0, 0, 0, 1, 1,
-1.326655, -0.08902507, -1.113284, 1, 1, 1, 1, 1,
-1.308655, -0.5816559, -1.668931, 1, 1, 1, 1, 1,
-1.306322, -1.387581, -4.58675, 1, 1, 1, 1, 1,
-1.287652, -0.3478364, -1.995646, 1, 1, 1, 1, 1,
-1.282691, -1.301181, -4.511711, 1, 1, 1, 1, 1,
-1.271821, 0.3459401, -2.03512, 1, 1, 1, 1, 1,
-1.266527, -1.52954, -4.004295, 1, 1, 1, 1, 1,
-1.257727, 1.392645, 1.008247, 1, 1, 1, 1, 1,
-1.250133, 0.2267823, -1.396322, 1, 1, 1, 1, 1,
-1.249737, -0.4387744, -2.907942, 1, 1, 1, 1, 1,
-1.241066, -0.4996642, -2.831313, 1, 1, 1, 1, 1,
-1.240882, 0.6537419, -2.869994, 1, 1, 1, 1, 1,
-1.230729, -1.065902, -0.8745856, 1, 1, 1, 1, 1,
-1.222607, 0.1543409, 0.5240972, 1, 1, 1, 1, 1,
-1.216166, 0.9273034, 0.04409978, 1, 1, 1, 1, 1,
-1.215694, -1.40635, -2.484056, 0, 0, 1, 1, 1,
-1.20873, -0.532845, -2.301534, 1, 0, 0, 1, 1,
-1.205732, 1.476582, -1.085437, 1, 0, 0, 1, 1,
-1.203419, -0.9221817, -4.49908, 1, 0, 0, 1, 1,
-1.192349, -0.3707736, -1.757041, 1, 0, 0, 1, 1,
-1.188776, 0.9832002, -1.547849, 1, 0, 0, 1, 1,
-1.182145, 1.08861, -0.6142765, 0, 0, 0, 1, 1,
-1.180072, -0.6015204, -1.568473, 0, 0, 0, 1, 1,
-1.178475, -0.8659403, -2.16622, 0, 0, 0, 1, 1,
-1.176267, -0.2689796, -1.589732, 0, 0, 0, 1, 1,
-1.170429, -0.3995566, -2.53732, 0, 0, 0, 1, 1,
-1.169037, -0.6336834, -1.662787, 0, 0, 0, 1, 1,
-1.161462, -0.52543, -1.875281, 0, 0, 0, 1, 1,
-1.152453, 0.97685, -0.3734499, 1, 1, 1, 1, 1,
-1.151667, 0.01703648, -1.950146, 1, 1, 1, 1, 1,
-1.14989, 0.2298245, -2.876879, 1, 1, 1, 1, 1,
-1.146449, -1.539945, -3.474675, 1, 1, 1, 1, 1,
-1.146325, 1.227985, -0.6695881, 1, 1, 1, 1, 1,
-1.145395, 0.3562008, -0.1381344, 1, 1, 1, 1, 1,
-1.14424, -1.195231, -3.505345, 1, 1, 1, 1, 1,
-1.140171, -0.2694593, -2.814664, 1, 1, 1, 1, 1,
-1.126956, 0.3913244, -1.123186, 1, 1, 1, 1, 1,
-1.122836, -0.2137756, -0.8445197, 1, 1, 1, 1, 1,
-1.110608, -2.162366, -3.547374, 1, 1, 1, 1, 1,
-1.104053, -1.276252, -4.509927, 1, 1, 1, 1, 1,
-1.101204, 0.5986524, -1.36996, 1, 1, 1, 1, 1,
-1.08878, -0.9179744, -1.52912, 1, 1, 1, 1, 1,
-1.079313, 0.4220321, -2.863223, 1, 1, 1, 1, 1,
-1.076762, -0.4260365, -2.114473, 0, 0, 1, 1, 1,
-1.0749, 0.6321028, 0.1708824, 1, 0, 0, 1, 1,
-1.074898, 0.9312181, -0.3423554, 1, 0, 0, 1, 1,
-1.065162, 0.2653157, 0.6591427, 1, 0, 0, 1, 1,
-1.0644, -0.9012839, -3.599543, 1, 0, 0, 1, 1,
-1.064311, -0.2296824, -2.888992, 1, 0, 0, 1, 1,
-1.062201, -1.309083, -4.030953, 0, 0, 0, 1, 1,
-1.055682, 0.6732832, -0.8429222, 0, 0, 0, 1, 1,
-1.052745, 0.06494159, 0.7649383, 0, 0, 0, 1, 1,
-1.049808, 0.9940152, -1.632255, 0, 0, 0, 1, 1,
-1.04759, -1.443419, 0.3146081, 0, 0, 0, 1, 1,
-1.047142, -1.305918, -1.215973, 0, 0, 0, 1, 1,
-1.039987, 1.27264, -0.1490843, 0, 0, 0, 1, 1,
-1.039408, -0.4737468, -1.118027, 1, 1, 1, 1, 1,
-1.034703, 0.5659223, -0.7462097, 1, 1, 1, 1, 1,
-1.033033, -0.4017129, -3.589987, 1, 1, 1, 1, 1,
-1.033013, 0.5589819, 0.1737737, 1, 1, 1, 1, 1,
-1.032322, -1.072812, -2.190616, 1, 1, 1, 1, 1,
-1.030591, -0.5826144, -2.491954, 1, 1, 1, 1, 1,
-1.029899, 0.5163093, -2.40514, 1, 1, 1, 1, 1,
-1.028592, 0.2830378, -0.6896209, 1, 1, 1, 1, 1,
-1.026402, 0.1575606, -1.546991, 1, 1, 1, 1, 1,
-1.025524, -0.1874352, -3.393891, 1, 1, 1, 1, 1,
-1.024819, 1.494706, -0.6857567, 1, 1, 1, 1, 1,
-1.022938, 0.098557, -0.8793262, 1, 1, 1, 1, 1,
-1.020559, -1.302511, -0.9726678, 1, 1, 1, 1, 1,
-1.018971, 0.2982987, -0.9325718, 1, 1, 1, 1, 1,
-1.015247, 1.643357, -1.129738, 1, 1, 1, 1, 1,
-1.014651, -0.407216, -1.94077, 0, 0, 1, 1, 1,
-1.012276, -0.5234503, -1.464221, 1, 0, 0, 1, 1,
-1.012205, -1.406331, -1.66792, 1, 0, 0, 1, 1,
-1.009885, -0.1863655, -2.13019, 1, 0, 0, 1, 1,
-1.006526, 1.171118, -2.108932, 1, 0, 0, 1, 1,
-1.005946, 0.01611001, -1.789736, 1, 0, 0, 1, 1,
-1.004435, 0.261471, -1.892522, 0, 0, 0, 1, 1,
-1.003089, -1.699748, -2.834608, 0, 0, 0, 1, 1,
-0.9949054, -0.1432455, -1.966634, 0, 0, 0, 1, 1,
-0.9921726, -0.7811008, -0.3010517, 0, 0, 0, 1, 1,
-0.9869546, 0.4232147, -1.120886, 0, 0, 0, 1, 1,
-0.9778581, -2.489348, -2.983897, 0, 0, 0, 1, 1,
-0.9750156, 1.625483, -2.232841, 0, 0, 0, 1, 1,
-0.9708367, -0.01340899, -0.5362117, 1, 1, 1, 1, 1,
-0.9699349, 0.1520757, -0.9984666, 1, 1, 1, 1, 1,
-0.9662312, -0.06489258, -2.004839, 1, 1, 1, 1, 1,
-0.9651759, -0.6398592, -3.017817, 1, 1, 1, 1, 1,
-0.9602589, 0.235956, -0.7175905, 1, 1, 1, 1, 1,
-0.9557369, 0.1755152, -1.77951, 1, 1, 1, 1, 1,
-0.9548473, 0.8479789, 0.6995611, 1, 1, 1, 1, 1,
-0.9526412, 0.7393194, -0.8775885, 1, 1, 1, 1, 1,
-0.9328716, -1.802269, -3.369334, 1, 1, 1, 1, 1,
-0.9291417, -2.45727, -3.445579, 1, 1, 1, 1, 1,
-0.9266501, -0.2546423, -3.124608, 1, 1, 1, 1, 1,
-0.9215993, 0.2704044, -1.558916, 1, 1, 1, 1, 1,
-0.9191936, -0.1200779, -0.765141, 1, 1, 1, 1, 1,
-0.9178236, 0.4616229, -1.832364, 1, 1, 1, 1, 1,
-0.9075238, -0.4039693, -1.776845, 1, 1, 1, 1, 1,
-0.9032665, -0.06433086, -1.644698, 0, 0, 1, 1, 1,
-0.9010437, 1.11436, -0.1103906, 1, 0, 0, 1, 1,
-0.8919939, 0.9666583, -2.709421, 1, 0, 0, 1, 1,
-0.8863631, -1.017655, -2.063818, 1, 0, 0, 1, 1,
-0.8848431, 0.03084613, -4.70713, 1, 0, 0, 1, 1,
-0.8820912, -0.5416307, -2.273645, 1, 0, 0, 1, 1,
-0.8812024, -0.4171815, -2.221201, 0, 0, 0, 1, 1,
-0.8710535, 0.02631984, -1.401477, 0, 0, 0, 1, 1,
-0.8688712, -0.841459, -3.196405, 0, 0, 0, 1, 1,
-0.8659173, 2.036561, -1.327158, 0, 0, 0, 1, 1,
-0.8638788, 0.04970023, -0.2824523, 0, 0, 0, 1, 1,
-0.8611588, 1.788737, 0.3895481, 0, 0, 0, 1, 1,
-0.8544994, 2.07479, -1.567869, 0, 0, 0, 1, 1,
-0.8523912, -0.9867582, -4.072915, 1, 1, 1, 1, 1,
-0.8477286, 0.1681855, -0.5368683, 1, 1, 1, 1, 1,
-0.8452113, -0.553836, -0.6222528, 1, 1, 1, 1, 1,
-0.8381407, -1.086068, -3.683536, 1, 1, 1, 1, 1,
-0.8360867, -1.89314, -2.315603, 1, 1, 1, 1, 1,
-0.8267076, 1.431955, 0.8467343, 1, 1, 1, 1, 1,
-0.8262275, -0.4602866, -2.97185, 1, 1, 1, 1, 1,
-0.8228951, -0.2365172, -1.442584, 1, 1, 1, 1, 1,
-0.808138, 0.1511664, -3.508804, 1, 1, 1, 1, 1,
-0.8060138, -0.3565231, -2.447969, 1, 1, 1, 1, 1,
-0.8045655, -0.4066359, -1.370103, 1, 1, 1, 1, 1,
-0.8012353, -2.160295, -3.581482, 1, 1, 1, 1, 1,
-0.7996436, 0.2589295, -0.6131745, 1, 1, 1, 1, 1,
-0.7929193, 1.067998, 0.4379871, 1, 1, 1, 1, 1,
-0.7880922, 2.925795, 0.4686915, 1, 1, 1, 1, 1,
-0.7880679, 0.06496919, -1.15489, 0, 0, 1, 1, 1,
-0.7749625, 0.2771478, -2.001668, 1, 0, 0, 1, 1,
-0.7583135, -1.48659, -3.150245, 1, 0, 0, 1, 1,
-0.7517675, 1.719808, 0.6031205, 1, 0, 0, 1, 1,
-0.7495273, 1.024316, -1.686327, 1, 0, 0, 1, 1,
-0.7309893, -0.6057755, -2.339438, 1, 0, 0, 1, 1,
-0.7307476, -0.5577282, -2.870595, 0, 0, 0, 1, 1,
-0.7302889, 0.4231014, -0.5244066, 0, 0, 0, 1, 1,
-0.7058361, 0.6515099, -0.3933966, 0, 0, 0, 1, 1,
-0.7025599, -2.230626, -2.704421, 0, 0, 0, 1, 1,
-0.7019987, 0.4936706, -1.377536, 0, 0, 0, 1, 1,
-0.7019563, -0.765076, -3.867147, 0, 0, 0, 1, 1,
-0.6990167, -1.214338, -1.415436, 0, 0, 0, 1, 1,
-0.6984519, 0.5524818, -1.751885, 1, 1, 1, 1, 1,
-0.6959591, 0.3257749, -1.091959, 1, 1, 1, 1, 1,
-0.6892819, -0.5126048, -1.987634, 1, 1, 1, 1, 1,
-0.688157, 2.477631, -0.9703575, 1, 1, 1, 1, 1,
-0.6871871, 0.5638859, -2.318221, 1, 1, 1, 1, 1,
-0.6870738, -0.09139507, -0.9376409, 1, 1, 1, 1, 1,
-0.6859106, -1.453704, -3.348768, 1, 1, 1, 1, 1,
-0.6847202, -0.485806, -2.253117, 1, 1, 1, 1, 1,
-0.6783035, 0.6435149, -0.130145, 1, 1, 1, 1, 1,
-0.6753542, -0.4784592, -3.838754, 1, 1, 1, 1, 1,
-0.6721167, -0.4468456, -2.215509, 1, 1, 1, 1, 1,
-0.6699928, -0.2986129, -2.132527, 1, 1, 1, 1, 1,
-0.6699011, -0.2988676, -3.148116, 1, 1, 1, 1, 1,
-0.6675003, 1.144644, -1.421635, 1, 1, 1, 1, 1,
-0.659466, 1.846292, -1.826295, 1, 1, 1, 1, 1,
-0.6430635, 1.424539, -0.6478215, 0, 0, 1, 1, 1,
-0.6427935, -2.014224, -2.638034, 1, 0, 0, 1, 1,
-0.6365947, 0.6546543, -0.1304515, 1, 0, 0, 1, 1,
-0.6306523, 0.8906786, -0.4056095, 1, 0, 0, 1, 1,
-0.6258758, -0.5607803, -2.304547, 1, 0, 0, 1, 1,
-0.6218796, 0.1573087, -1.228201, 1, 0, 0, 1, 1,
-0.6171139, 1.035899, -2.117326, 0, 0, 0, 1, 1,
-0.6052172, 0.4540598, -2.819146, 0, 0, 0, 1, 1,
-0.6012499, 0.8246604, -1.579991, 0, 0, 0, 1, 1,
-0.595851, -0.9794719, -1.202162, 0, 0, 0, 1, 1,
-0.5945998, -0.4881698, -2.119198, 0, 0, 0, 1, 1,
-0.5934963, 0.595805, -0.1474626, 0, 0, 0, 1, 1,
-0.5930583, 0.1172632, -0.8072714, 0, 0, 0, 1, 1,
-0.5926784, 0.06137574, -1.102127, 1, 1, 1, 1, 1,
-0.5871977, 0.3280813, -1.317889, 1, 1, 1, 1, 1,
-0.5797156, -0.3360122, -2.005397, 1, 1, 1, 1, 1,
-0.5756397, 0.3224417, -1.349699, 1, 1, 1, 1, 1,
-0.5755174, -0.3436278, -3.679679, 1, 1, 1, 1, 1,
-0.5727096, -0.2473861, -1.201518, 1, 1, 1, 1, 1,
-0.5722811, -0.2546956, -3.391486, 1, 1, 1, 1, 1,
-0.5719554, 1.726342, -0.7779538, 1, 1, 1, 1, 1,
-0.5688545, 0.3093686, -1.659527, 1, 1, 1, 1, 1,
-0.5642915, -0.3093844, -2.087068, 1, 1, 1, 1, 1,
-0.5625597, 1.020587, 0.6425179, 1, 1, 1, 1, 1,
-0.5620955, 0.4804505, -1.629298, 1, 1, 1, 1, 1,
-0.5619031, 1.082643, 0.01565545, 1, 1, 1, 1, 1,
-0.5616446, 0.5361342, -0.02548406, 1, 1, 1, 1, 1,
-0.5615708, -2.726313, -2.471117, 1, 1, 1, 1, 1,
-0.5603099, -0.2316064, -2.86034, 0, 0, 1, 1, 1,
-0.5554645, -0.5900564, -2.407414, 1, 0, 0, 1, 1,
-0.5510135, 0.6199957, 0.4250579, 1, 0, 0, 1, 1,
-0.5489966, 0.14978, -0.7171807, 1, 0, 0, 1, 1,
-0.5467881, -0.6658913, -2.200202, 1, 0, 0, 1, 1,
-0.5467303, -0.3323567, -2.469054, 1, 0, 0, 1, 1,
-0.5442825, -0.5704001, -2.65309, 0, 0, 0, 1, 1,
-0.5361453, -1.48602, -2.745159, 0, 0, 0, 1, 1,
-0.534905, -0.6533526, -2.192087, 0, 0, 0, 1, 1,
-0.5343086, -0.02136949, -1.642677, 0, 0, 0, 1, 1,
-0.5301085, 0.2108635, -0.2256537, 0, 0, 0, 1, 1,
-0.527349, -1.618195, -4.143023, 0, 0, 0, 1, 1,
-0.5251759, 1.061223, -1.502831, 0, 0, 0, 1, 1,
-0.5245222, 0.7120694, -3.516677, 1, 1, 1, 1, 1,
-0.5223504, -0.3605174, -1.693798, 1, 1, 1, 1, 1,
-0.5179194, 0.4321744, 0.2048318, 1, 1, 1, 1, 1,
-0.5118335, -0.4520046, -2.496268, 1, 1, 1, 1, 1,
-0.5107651, -0.537685, -1.144432, 1, 1, 1, 1, 1,
-0.5040628, 0.4546081, -1.09819, 1, 1, 1, 1, 1,
-0.5039634, 0.5571744, 0.8884791, 1, 1, 1, 1, 1,
-0.5007181, -1.217052, -2.803931, 1, 1, 1, 1, 1,
-0.4984005, -0.1249363, -1.497812, 1, 1, 1, 1, 1,
-0.4962788, -1.619848, -3.660724, 1, 1, 1, 1, 1,
-0.4944894, 1.447921, -0.1354117, 1, 1, 1, 1, 1,
-0.4934211, -0.2820223, -1.550969, 1, 1, 1, 1, 1,
-0.4918416, 0.3516579, -0.6216255, 1, 1, 1, 1, 1,
-0.4840388, 0.6253682, -2.04429, 1, 1, 1, 1, 1,
-0.4838151, 0.178772, 0.6867055, 1, 1, 1, 1, 1,
-0.483388, -0.2058345, -1.56748, 0, 0, 1, 1, 1,
-0.4797383, 0.1171407, -0.562054, 1, 0, 0, 1, 1,
-0.4772685, 0.191135, -1.427639, 1, 0, 0, 1, 1,
-0.4712848, -0.007923565, -1.550261, 1, 0, 0, 1, 1,
-0.470549, -1.469427, -3.422448, 1, 0, 0, 1, 1,
-0.4662521, 0.4818445, -0.8608122, 1, 0, 0, 1, 1,
-0.464977, 0.478273, -0.5503312, 0, 0, 0, 1, 1,
-0.4643826, 0.5821914, -0.7377638, 0, 0, 0, 1, 1,
-0.461263, 1.207456, -1.300182, 0, 0, 0, 1, 1,
-0.460824, -0.8716571, -1.922928, 0, 0, 0, 1, 1,
-0.450166, -0.2756149, -2.754669, 0, 0, 0, 1, 1,
-0.448089, 0.1397672, -1.999897, 0, 0, 0, 1, 1,
-0.4459046, 0.4688285, -0.4540953, 0, 0, 0, 1, 1,
-0.4428914, -0.05934253, -1.38132, 1, 1, 1, 1, 1,
-0.4403558, -0.2347409, -1.509496, 1, 1, 1, 1, 1,
-0.4380765, -1.356916, -4.055308, 1, 1, 1, 1, 1,
-0.4336876, -0.454769, -2.779685, 1, 1, 1, 1, 1,
-0.4326639, 2.352781, -1.409878, 1, 1, 1, 1, 1,
-0.4305936, 0.7529323, 0.2039306, 1, 1, 1, 1, 1,
-0.4297022, -2.346411, -0.03659273, 1, 1, 1, 1, 1,
-0.4224184, 2.026956, -0.780756, 1, 1, 1, 1, 1,
-0.4177706, 0.6383797, -1.580231, 1, 1, 1, 1, 1,
-0.4167759, -0.5384728, -4.132548, 1, 1, 1, 1, 1,
-0.416325, 1.082206, -0.8685501, 1, 1, 1, 1, 1,
-0.4157068, 0.2315038, -0.08767069, 1, 1, 1, 1, 1,
-0.4153731, -0.3054486, -0.7770074, 1, 1, 1, 1, 1,
-0.4146205, -0.4070079, -4.354407, 1, 1, 1, 1, 1,
-0.409586, 0.5366319, -0.152447, 1, 1, 1, 1, 1,
-0.4069931, -0.02043045, -1.258048, 0, 0, 1, 1, 1,
-0.4039463, -1.844001, -2.672182, 1, 0, 0, 1, 1,
-0.4000224, -1.197333, -3.902554, 1, 0, 0, 1, 1,
-0.3980823, -0.1250674, -1.239128, 1, 0, 0, 1, 1,
-0.3925886, -0.8112646, -3.696702, 1, 0, 0, 1, 1,
-0.3889332, 0.5602824, 2.052326, 1, 0, 0, 1, 1,
-0.3846719, 0.5092508, -0.9426442, 0, 0, 0, 1, 1,
-0.3809362, 0.3643999, 0.7300339, 0, 0, 0, 1, 1,
-0.3802345, -0.4005433, -2.538803, 0, 0, 0, 1, 1,
-0.3789218, 0.05050331, -2.860261, 0, 0, 0, 1, 1,
-0.374985, -0.5935521, -2.390128, 0, 0, 0, 1, 1,
-0.3696657, -0.4440035, -3.121074, 0, 0, 0, 1, 1,
-0.3696553, -0.1490138, -1.360744, 0, 0, 0, 1, 1,
-0.3693406, 0.4287485, -0.5262929, 1, 1, 1, 1, 1,
-0.3678495, 0.6939951, 0.1144998, 1, 1, 1, 1, 1,
-0.3625616, -0.3751172, -1.639049, 1, 1, 1, 1, 1,
-0.3588377, 1.237242, 0.1737975, 1, 1, 1, 1, 1,
-0.3569296, 0.9626958, -1.656571, 1, 1, 1, 1, 1,
-0.3558201, -1.221062, -5.029473, 1, 1, 1, 1, 1,
-0.3505684, -0.4409592, -1.473149, 1, 1, 1, 1, 1,
-0.348821, -0.5199616, -0.699047, 1, 1, 1, 1, 1,
-0.347153, -0.244523, -4.12045, 1, 1, 1, 1, 1,
-0.3462064, 1.576459, 0.6976926, 1, 1, 1, 1, 1,
-0.3394507, 0.5945548, -0.3500898, 1, 1, 1, 1, 1,
-0.3357254, -2.140298, -3.090487, 1, 1, 1, 1, 1,
-0.333247, 0.1285006, -3.246926, 1, 1, 1, 1, 1,
-0.328217, 0.3602527, -0.5473765, 1, 1, 1, 1, 1,
-0.3263241, -0.8144639, -4.345191, 1, 1, 1, 1, 1,
-0.3244743, -0.3122893, -3.368414, 0, 0, 1, 1, 1,
-0.3215315, 1.55088, -0.5267283, 1, 0, 0, 1, 1,
-0.3158129, 0.2208405, -0.7881644, 1, 0, 0, 1, 1,
-0.3142143, -1.290764, -4.048522, 1, 0, 0, 1, 1,
-0.3125041, -1.943742, -2.481787, 1, 0, 0, 1, 1,
-0.3114051, 1.431602, 1.32615, 1, 0, 0, 1, 1,
-0.3113072, -0.1081455, -2.55588, 0, 0, 0, 1, 1,
-0.3108695, 1.344504, -1.352341, 0, 0, 0, 1, 1,
-0.3106952, -1.695241, -3.094469, 0, 0, 0, 1, 1,
-0.309188, 0.8760403, -1.975294, 0, 0, 0, 1, 1,
-0.3059146, 0.4827172, -1.59653, 0, 0, 0, 1, 1,
-0.3018956, 0.5856257, 0.1437527, 0, 0, 0, 1, 1,
-0.2991099, -1.783762, -2.874465, 0, 0, 0, 1, 1,
-0.2986283, -1.260369, -2.777743, 1, 1, 1, 1, 1,
-0.2954277, -0.3399208, -1.750221, 1, 1, 1, 1, 1,
-0.2953915, 1.15856, -1.401644, 1, 1, 1, 1, 1,
-0.2943307, -1.004604, -2.65839, 1, 1, 1, 1, 1,
-0.2853923, -0.7769601, -4.553023, 1, 1, 1, 1, 1,
-0.2837596, 0.01942701, 0.04102422, 1, 1, 1, 1, 1,
-0.2835786, 2.503567, 0.1650469, 1, 1, 1, 1, 1,
-0.2816595, 1.098008, -0.6648062, 1, 1, 1, 1, 1,
-0.2794168, 1.542152, -0.1053542, 1, 1, 1, 1, 1,
-0.2782382, 1.219513, -0.3471737, 1, 1, 1, 1, 1,
-0.2756197, -0.5097698, -3.051291, 1, 1, 1, 1, 1,
-0.2744124, 0.636054, -0.6929849, 1, 1, 1, 1, 1,
-0.269639, -0.437331, -2.638547, 1, 1, 1, 1, 1,
-0.2690685, 1.383444, 0.8474796, 1, 1, 1, 1, 1,
-0.2629038, -0.6058692, -3.162374, 1, 1, 1, 1, 1,
-0.2624239, -1.393529, -3.062586, 0, 0, 1, 1, 1,
-0.2615474, -0.8440543, -2.577723, 1, 0, 0, 1, 1,
-0.2610483, -1.416721, -3.283973, 1, 0, 0, 1, 1,
-0.2572827, -0.1564685, -1.581013, 1, 0, 0, 1, 1,
-0.2536236, 0.3789406, -1.411484, 1, 0, 0, 1, 1,
-0.2514716, -0.2456135, -2.184997, 1, 0, 0, 1, 1,
-0.2504352, 1.15638, -0.6642971, 0, 0, 0, 1, 1,
-0.2499395, -0.01145738, -1.615136, 0, 0, 0, 1, 1,
-0.2492167, 0.2277153, -2.936656, 0, 0, 0, 1, 1,
-0.248412, 0.4159972, 0.8795815, 0, 0, 0, 1, 1,
-0.2460916, 0.2938041, -0.4779496, 0, 0, 0, 1, 1,
-0.2425374, 1.439001, 0.5959905, 0, 0, 0, 1, 1,
-0.2419041, 0.9128821, 0.5223266, 0, 0, 0, 1, 1,
-0.24068, -0.8606692, -2.457691, 1, 1, 1, 1, 1,
-0.2394616, 0.3678456, -0.5040954, 1, 1, 1, 1, 1,
-0.2385531, 1.244408, -0.5423111, 1, 1, 1, 1, 1,
-0.2353168, 0.1463789, -0.8823385, 1, 1, 1, 1, 1,
-0.2334406, -2.3025, -3.349075, 1, 1, 1, 1, 1,
-0.2247062, 0.7018875, -0.5086985, 1, 1, 1, 1, 1,
-0.2242493, -0.3556114, -1.819109, 1, 1, 1, 1, 1,
-0.2220222, 0.1527402, 0.5352262, 1, 1, 1, 1, 1,
-0.2215893, 0.3997991, 0.3585213, 1, 1, 1, 1, 1,
-0.2215572, 0.4104448, -0.3957796, 1, 1, 1, 1, 1,
-0.2140942, -0.3736634, -1.620559, 1, 1, 1, 1, 1,
-0.2093818, -0.9013871, -2.894626, 1, 1, 1, 1, 1,
-0.2078585, -2.04767, -3.099919, 1, 1, 1, 1, 1,
-0.2069723, -0.951161, -2.291248, 1, 1, 1, 1, 1,
-0.2040996, -1.047967, -4.130183, 1, 1, 1, 1, 1,
-0.2039556, 0.4291289, 0.945157, 0, 0, 1, 1, 1,
-0.2020266, 0.1611607, -0.1853879, 1, 0, 0, 1, 1,
-0.1986656, 0.0719052, -1.833019, 1, 0, 0, 1, 1,
-0.1954427, 0.04214385, -0.8010458, 1, 0, 0, 1, 1,
-0.1867228, -0.3053232, -2.313418, 1, 0, 0, 1, 1,
-0.1837177, -0.2085441, -4.017514, 1, 0, 0, 1, 1,
-0.1815889, -0.358442, -1.353159, 0, 0, 0, 1, 1,
-0.1790219, 1.763363, 0.8576919, 0, 0, 0, 1, 1,
-0.1777776, -0.8631799, -6.166344, 0, 0, 0, 1, 1,
-0.1758246, 0.3001949, -0.431676, 0, 0, 0, 1, 1,
-0.1746153, -0.3556536, -3.319872, 0, 0, 0, 1, 1,
-0.1715555, -0.5234934, -1.883019, 0, 0, 0, 1, 1,
-0.1713078, -0.03980779, -1.634169, 0, 0, 0, 1, 1,
-0.1652439, -1.190494, -2.870303, 1, 1, 1, 1, 1,
-0.1571829, 1.269867, 0.8793836, 1, 1, 1, 1, 1,
-0.1570907, 1.701885, 0.09851301, 1, 1, 1, 1, 1,
-0.156485, -1.310848, -3.005201, 1, 1, 1, 1, 1,
-0.1524791, 0.1104294, -1.933425, 1, 1, 1, 1, 1,
-0.1510963, -1.316083, -1.72172, 1, 1, 1, 1, 1,
-0.1501588, -0.8427029, -2.96766, 1, 1, 1, 1, 1,
-0.1495327, -0.02854294, -0.4125284, 1, 1, 1, 1, 1,
-0.147955, 0.5008233, -0.009870088, 1, 1, 1, 1, 1,
-0.1387435, -1.430728, -3.064738, 1, 1, 1, 1, 1,
-0.1372246, -0.2533991, -2.349264, 1, 1, 1, 1, 1,
-0.1368043, -0.3914673, -3.020498, 1, 1, 1, 1, 1,
-0.1346023, 1.203021, 0.08726534, 1, 1, 1, 1, 1,
-0.1310641, -0.1564637, -2.284037, 1, 1, 1, 1, 1,
-0.1281179, 1.520035, 0.5450703, 1, 1, 1, 1, 1,
-0.1265055, -1.084123, -2.108303, 0, 0, 1, 1, 1,
-0.1262157, -1.617543, -2.206981, 1, 0, 0, 1, 1,
-0.1252635, 0.5646187, -0.4700192, 1, 0, 0, 1, 1,
-0.1218408, 0.6607728, -0.02918376, 1, 0, 0, 1, 1,
-0.1205579, 0.9289494, -0.6634269, 1, 0, 0, 1, 1,
-0.1185865, 0.7343248, 0.326985, 1, 0, 0, 1, 1,
-0.1160312, -2.277418, -3.455402, 0, 0, 0, 1, 1,
-0.1141016, -0.07507037, -2.755068, 0, 0, 0, 1, 1,
-0.11182, 0.3273203, 1.176924, 0, 0, 0, 1, 1,
-0.1079578, -0.7852625, -3.132406, 0, 0, 0, 1, 1,
-0.09434935, -1.731668, -2.707838, 0, 0, 0, 1, 1,
-0.09159322, -2.084317, -2.529216, 0, 0, 0, 1, 1,
-0.0903366, 0.601201, -0.456915, 0, 0, 0, 1, 1,
-0.08821303, -1.748174, -2.514504, 1, 1, 1, 1, 1,
-0.08452693, 1.003521, -0.211236, 1, 1, 1, 1, 1,
-0.08390089, 0.5158862, 0.08122041, 1, 1, 1, 1, 1,
-0.08157656, 0.3721882, -1.0119, 1, 1, 1, 1, 1,
-0.0710165, 0.239246, 0.4529898, 1, 1, 1, 1, 1,
-0.06801722, 0.2364125, 0.1946526, 1, 1, 1, 1, 1,
-0.05779975, -0.7331836, -2.808303, 1, 1, 1, 1, 1,
-0.05117713, 0.05730848, -1.103452, 1, 1, 1, 1, 1,
-0.04867675, 2.338092, 0.73198, 1, 1, 1, 1, 1,
-0.04720369, 0.3293822, -1.401205, 1, 1, 1, 1, 1,
-0.04596712, -1.797076, -2.54442, 1, 1, 1, 1, 1,
-0.04552449, 0.04758166, 0.7797213, 1, 1, 1, 1, 1,
-0.04511729, 0.7422207, -1.185236, 1, 1, 1, 1, 1,
-0.04081285, 0.7258936, -0.3598666, 1, 1, 1, 1, 1,
-0.03845038, 0.6190892, 0.7349765, 1, 1, 1, 1, 1,
-0.03663948, -1.365461, -2.276828, 0, 0, 1, 1, 1,
-0.03023974, -1.940081, -3.733487, 1, 0, 0, 1, 1,
-0.02906671, -0.04101397, -1.043955, 1, 0, 0, 1, 1,
-0.02709384, 0.08052363, -1.713698, 1, 0, 0, 1, 1,
-0.02113377, -1.958102, -2.553543, 1, 0, 0, 1, 1,
-0.01818668, 1.189002, -0.8800889, 1, 0, 0, 1, 1,
-0.01728654, -0.8827403, -2.519813, 0, 0, 0, 1, 1,
-0.01709626, 1.117144, 0.4555698, 0, 0, 0, 1, 1,
-0.01376645, -0.2204691, -4.537092, 0, 0, 0, 1, 1,
-0.01123439, -1.180266, -3.034181, 0, 0, 0, 1, 1,
-0.01112852, -0.8520657, -5.38775, 0, 0, 0, 1, 1,
-0.01032705, 0.3474791, 1.368261, 0, 0, 0, 1, 1,
-0.009779968, -1.88284, -4.82236, 0, 0, 0, 1, 1,
-0.0044493, -0.2961179, -3.690942, 1, 1, 1, 1, 1,
-0.00430292, -0.5160992, -3.940985, 1, 1, 1, 1, 1,
-0.003774123, -0.5038418, -1.950855, 1, 1, 1, 1, 1,
-0.0005351743, -0.928625, -3.09018, 1, 1, 1, 1, 1,
0.001972988, -0.4993345, 4.380781, 1, 1, 1, 1, 1,
0.004539954, -1.624228, 3.796243, 1, 1, 1, 1, 1,
0.006582202, -1.82489, 2.109209, 1, 1, 1, 1, 1,
0.007607643, -0.06902053, 2.295351, 1, 1, 1, 1, 1,
0.01123216, 0.3739716, -2.275936, 1, 1, 1, 1, 1,
0.0155956, -2.000708, 2.836854, 1, 1, 1, 1, 1,
0.01790061, 0.4138908, 2.157158, 1, 1, 1, 1, 1,
0.02227756, -0.6251491, 2.209652, 1, 1, 1, 1, 1,
0.02416373, 0.3537106, 0.9681913, 1, 1, 1, 1, 1,
0.02476652, 0.5352759, -0.6321859, 1, 1, 1, 1, 1,
0.02764777, -0.9315262, 2.301236, 1, 1, 1, 1, 1,
0.02826682, 0.9939994, 1.161333, 0, 0, 1, 1, 1,
0.03040052, -0.3857251, 4.415509, 1, 0, 0, 1, 1,
0.03434034, 1.059356, -0.3363373, 1, 0, 0, 1, 1,
0.03875475, -0.727559, 4.250646, 1, 0, 0, 1, 1,
0.04166725, -1.532745, 2.031437, 1, 0, 0, 1, 1,
0.04176454, -0.8433622, 4.911428, 1, 0, 0, 1, 1,
0.04823112, 2.0093, -0.3378162, 0, 0, 0, 1, 1,
0.05099665, -0.8530265, 0.9746791, 0, 0, 0, 1, 1,
0.05412648, 0.1677541, -0.9331543, 0, 0, 0, 1, 1,
0.05561155, 0.6473477, 0.8405325, 0, 0, 0, 1, 1,
0.05970031, -0.4692833, 4.521814, 0, 0, 0, 1, 1,
0.06803989, -0.9046974, 2.85269, 0, 0, 0, 1, 1,
0.07285696, -1.394086, 3.742683, 0, 0, 0, 1, 1,
0.08282124, 0.9957901, 0.7164305, 1, 1, 1, 1, 1,
0.08506399, 1.424834, 0.6015533, 1, 1, 1, 1, 1,
0.08618799, 2.073182, -0.2338121, 1, 1, 1, 1, 1,
0.08807208, 2.062377, 1.622494, 1, 1, 1, 1, 1,
0.08984342, -0.8998185, 2.477994, 1, 1, 1, 1, 1,
0.09058922, 0.1585427, 2.088691, 1, 1, 1, 1, 1,
0.09528348, 2.001, 0.2340513, 1, 1, 1, 1, 1,
0.09529046, 1.464741, 0.3413879, 1, 1, 1, 1, 1,
0.0969357, 0.5506935, 1.018275, 1, 1, 1, 1, 1,
0.09698119, -0.04789282, 1.482127, 1, 1, 1, 1, 1,
0.100493, 0.3416861, 1.518286, 1, 1, 1, 1, 1,
0.1091741, -1.56054, 2.309306, 1, 1, 1, 1, 1,
0.1134972, 1.327725, 1.069422, 1, 1, 1, 1, 1,
0.1144729, -2.13501, 2.318461, 1, 1, 1, 1, 1,
0.115354, -0.05651061, 0.959363, 1, 1, 1, 1, 1,
0.1161363, 0.7087254, -1.358005, 0, 0, 1, 1, 1,
0.121599, -1.311345, 3.556753, 1, 0, 0, 1, 1,
0.1233383, 0.1185565, 1.640459, 1, 0, 0, 1, 1,
0.1290252, -0.3063419, 2.469356, 1, 0, 0, 1, 1,
0.1375897, -0.6488565, 2.448189, 1, 0, 0, 1, 1,
0.1396848, 0.04291533, 1.358713, 1, 0, 0, 1, 1,
0.1402108, -0.5085576, 2.715724, 0, 0, 0, 1, 1,
0.1449862, 0.2655793, -1.236614, 0, 0, 0, 1, 1,
0.1559559, -0.2093456, 2.67635, 0, 0, 0, 1, 1,
0.1574561, -1.091954, 1.204015, 0, 0, 0, 1, 1,
0.1613342, -0.4934131, 4.150511, 0, 0, 0, 1, 1,
0.1672077, 0.498415, 0.2069685, 0, 0, 0, 1, 1,
0.1673047, 1.744871, 0.1816484, 0, 0, 0, 1, 1,
0.168733, -1.566284, 2.567576, 1, 1, 1, 1, 1,
0.1713638, -1.169777, 3.557056, 1, 1, 1, 1, 1,
0.1750578, -0.2729345, 2.535596, 1, 1, 1, 1, 1,
0.1754647, 1.415566, 1.118633, 1, 1, 1, 1, 1,
0.1777043, -1.429809, 2.903107, 1, 1, 1, 1, 1,
0.1795076, -0.4946387, 2.491063, 1, 1, 1, 1, 1,
0.1810434, -1.314391, 3.401881, 1, 1, 1, 1, 1,
0.1841941, 1.160846, 0.8243935, 1, 1, 1, 1, 1,
0.1877909, 0.4536555, 2.076058, 1, 1, 1, 1, 1,
0.1878424, -1.6091, 1.387787, 1, 1, 1, 1, 1,
0.1886103, 0.6642366, 1.119268, 1, 1, 1, 1, 1,
0.1889719, -0.5581203, 3.56048, 1, 1, 1, 1, 1,
0.1902779, -1.878246, 4.536978, 1, 1, 1, 1, 1,
0.1928047, 0.4254574, -0.6685546, 1, 1, 1, 1, 1,
0.1996286, 0.9811991, -0.5011701, 1, 1, 1, 1, 1,
0.204832, 2.174251, -1.050075, 0, 0, 1, 1, 1,
0.2052083, 2.767998, 1.848999, 1, 0, 0, 1, 1,
0.2075671, 0.1830834, 0.9987005, 1, 0, 0, 1, 1,
0.208885, -1.372029, 4.057084, 1, 0, 0, 1, 1,
0.2095231, 0.334753, -0.4781514, 1, 0, 0, 1, 1,
0.2105309, 1.173357, -0.4944479, 1, 0, 0, 1, 1,
0.2131963, 0.770098, 2.329693, 0, 0, 0, 1, 1,
0.2284398, 0.4519286, 0.7989005, 0, 0, 0, 1, 1,
0.2315192, 0.2896886, 0.730024, 0, 0, 0, 1, 1,
0.2315407, -0.5886316, 5.029137, 0, 0, 0, 1, 1,
0.2355549, -0.2068554, 3.920707, 0, 0, 0, 1, 1,
0.2369253, -1.332552, 3.716381, 0, 0, 0, 1, 1,
0.2373009, -0.1348752, 2.472458, 0, 0, 0, 1, 1,
0.2374913, 1.50411, 0.01520755, 1, 1, 1, 1, 1,
0.238297, 1.958457, -0.9473116, 1, 1, 1, 1, 1,
0.2433837, 0.703555, 1.38457, 1, 1, 1, 1, 1,
0.2434411, -0.07787629, 2.044078, 1, 1, 1, 1, 1,
0.2447007, 1.638679, -1.016814, 1, 1, 1, 1, 1,
0.2452118, -0.5857263, 2.100529, 1, 1, 1, 1, 1,
0.2471671, 0.3847243, 0.4320411, 1, 1, 1, 1, 1,
0.2509073, 0.7865079, 1.236526, 1, 1, 1, 1, 1,
0.2544832, 0.1250815, -0.6118909, 1, 1, 1, 1, 1,
0.2557012, -0.8253162, 3.18204, 1, 1, 1, 1, 1,
0.2613761, -0.7884361, 2.42636, 1, 1, 1, 1, 1,
0.2624263, 1.172834, 0.6628508, 1, 1, 1, 1, 1,
0.2635017, -1.664925, 1.826836, 1, 1, 1, 1, 1,
0.2637199, 1.337458, -0.8319932, 1, 1, 1, 1, 1,
0.2652093, -0.1322131, 2.573446, 1, 1, 1, 1, 1,
0.2680911, -0.3212992, 1.900565, 0, 0, 1, 1, 1,
0.2696869, 0.5345318, 0.4766889, 1, 0, 0, 1, 1,
0.2714428, 1.431785, 0.3605668, 1, 0, 0, 1, 1,
0.2715209, -2.830571, 2.004723, 1, 0, 0, 1, 1,
0.2742431, -0.6183092, 3.698489, 1, 0, 0, 1, 1,
0.2746683, 0.6046036, 0.7890142, 1, 0, 0, 1, 1,
0.2750312, -0.6388373, 1.887376, 0, 0, 0, 1, 1,
0.2770093, -0.8267437, 1.063224, 0, 0, 0, 1, 1,
0.2820065, -1.416952, 3.197132, 0, 0, 0, 1, 1,
0.2835516, 1.954869, -0.2493796, 0, 0, 0, 1, 1,
0.2839966, -0.3737499, 2.3292, 0, 0, 0, 1, 1,
0.2941401, -0.3165395, 2.242993, 0, 0, 0, 1, 1,
0.2969121, 1.157747, 0.9376426, 0, 0, 0, 1, 1,
0.2981074, -0.4346281, 0.5768198, 1, 1, 1, 1, 1,
0.2984473, 0.1191732, 2.01279, 1, 1, 1, 1, 1,
0.3055696, -0.7629379, 1.792294, 1, 1, 1, 1, 1,
0.3078313, 0.771227, -0.03277994, 1, 1, 1, 1, 1,
0.3086684, 0.6890157, -0.6706244, 1, 1, 1, 1, 1,
0.3104823, 0.7051201, -0.1490492, 1, 1, 1, 1, 1,
0.3144844, -0.3091021, 1.356038, 1, 1, 1, 1, 1,
0.3158084, -0.4475786, 2.819268, 1, 1, 1, 1, 1,
0.3168319, -1.801701, 2.885659, 1, 1, 1, 1, 1,
0.3173865, 0.9228484, 1.625198, 1, 1, 1, 1, 1,
0.3208199, -0.8091202, 5.223982, 1, 1, 1, 1, 1,
0.3214512, 1.306287, -1.83524, 1, 1, 1, 1, 1,
0.3220927, -0.592949, 1.981252, 1, 1, 1, 1, 1,
0.3221793, 0.4886063, 1.376245, 1, 1, 1, 1, 1,
0.3222428, -0.8604253, 3.588763, 1, 1, 1, 1, 1,
0.3245969, -1.393878, 4.588864, 0, 0, 1, 1, 1,
0.3255066, 1.329079, 0.7571144, 1, 0, 0, 1, 1,
0.3270802, -0.6490076, 2.799957, 1, 0, 0, 1, 1,
0.3309196, 0.4596605, 1.654163, 1, 0, 0, 1, 1,
0.3339289, 0.9485984, -0.4723369, 1, 0, 0, 1, 1,
0.3355418, 2.210891, 1.222558, 1, 0, 0, 1, 1,
0.3392846, -0.5322072, 2.181489, 0, 0, 0, 1, 1,
0.3478967, -0.5635722, 2.51675, 0, 0, 0, 1, 1,
0.3479925, 1.600388, 1.005543, 0, 0, 0, 1, 1,
0.3486877, -0.4958784, 2.960513, 0, 0, 0, 1, 1,
0.3526592, -0.9839793, 0.1267895, 0, 0, 0, 1, 1,
0.3531287, 2.131754, -0.5438531, 0, 0, 0, 1, 1,
0.3547369, -1.210367, 1.095726, 0, 0, 0, 1, 1,
0.3548948, 0.781418, 1.646233, 1, 1, 1, 1, 1,
0.3603098, 0.003026365, 1.512863, 1, 1, 1, 1, 1,
0.3738607, 1.101181, 1.535033, 1, 1, 1, 1, 1,
0.3809461, -0.1350883, 0.817939, 1, 1, 1, 1, 1,
0.3814508, 2.33885, -0.2064008, 1, 1, 1, 1, 1,
0.3822949, 1.064208, -0.340981, 1, 1, 1, 1, 1,
0.3863367, 1.161251, 0.5600172, 1, 1, 1, 1, 1,
0.3873683, -0.1271225, 3.119901, 1, 1, 1, 1, 1,
0.3908991, -0.8940194, 1.766441, 1, 1, 1, 1, 1,
0.3950329, 1.029637, 0.232372, 1, 1, 1, 1, 1,
0.3957135, 0.5913164, 0.396845, 1, 1, 1, 1, 1,
0.3985185, 0.3665343, 2.044913, 1, 1, 1, 1, 1,
0.4031622, -0.002389864, 3.08049, 1, 1, 1, 1, 1,
0.403676, -0.6632425, 2.196761, 1, 1, 1, 1, 1,
0.40511, -0.2554416, 1.294355, 1, 1, 1, 1, 1,
0.4092551, -0.3500498, 2.164335, 0, 0, 1, 1, 1,
0.4119297, -1.050344, 3.861143, 1, 0, 0, 1, 1,
0.4236007, 0.204123, 0.7329311, 1, 0, 0, 1, 1,
0.424291, -0.5582472, 1.792194, 1, 0, 0, 1, 1,
0.4246637, 0.4978133, -0.4466378, 1, 0, 0, 1, 1,
0.426179, -0.9801254, 2.968709, 1, 0, 0, 1, 1,
0.4261984, -0.5759359, 1.445904, 0, 0, 0, 1, 1,
0.4315632, 0.1449727, 1.5114, 0, 0, 0, 1, 1,
0.4399859, -1.260954, 3.224759, 0, 0, 0, 1, 1,
0.4425966, -0.5285057, 3.732986, 0, 0, 0, 1, 1,
0.4442115, 0.5884491, -0.1756919, 0, 0, 0, 1, 1,
0.4458736, 1.525181, 0.2838573, 0, 0, 0, 1, 1,
0.4503788, -0.686668, 0.7784892, 0, 0, 0, 1, 1,
0.453761, -0.3399433, 2.420555, 1, 1, 1, 1, 1,
0.4563146, 1.492477, 0.6035228, 1, 1, 1, 1, 1,
0.4579955, 0.01172864, 1.262632, 1, 1, 1, 1, 1,
0.4590999, -0.9976702, 1.965968, 1, 1, 1, 1, 1,
0.4594089, -0.5104461, 2.467968, 1, 1, 1, 1, 1,
0.4612347, 0.9119584, 0.3531721, 1, 1, 1, 1, 1,
0.4625613, 1.217742, -0.3686519, 1, 1, 1, 1, 1,
0.4630173, -1.548211, 2.203469, 1, 1, 1, 1, 1,
0.4644725, 0.2025538, 1.043272, 1, 1, 1, 1, 1,
0.4664286, 0.8145757, 0.02383304, 1, 1, 1, 1, 1,
0.4704455, -1.408779, 2.264109, 1, 1, 1, 1, 1,
0.4705869, -1.903264, 2.786166, 1, 1, 1, 1, 1,
0.4714448, 0.4311639, 1.015521, 1, 1, 1, 1, 1,
0.4728586, -0.2943053, 2.323987, 1, 1, 1, 1, 1,
0.4755065, 2.549881, -2.041604, 1, 1, 1, 1, 1,
0.4760892, 0.73885, 0.5719281, 0, 0, 1, 1, 1,
0.4764255, 0.4726992, -0.4557438, 1, 0, 0, 1, 1,
0.4777659, -0.4476537, 3.406888, 1, 0, 0, 1, 1,
0.4777868, -0.5701506, 2.888318, 1, 0, 0, 1, 1,
0.4787801, -0.286231, 0.6049007, 1, 0, 0, 1, 1,
0.4809159, 1.183882, -0.02730815, 1, 0, 0, 1, 1,
0.4862134, 0.8418455, -0.4457135, 0, 0, 0, 1, 1,
0.488842, 2.135779, 1.311914, 0, 0, 0, 1, 1,
0.4905284, 0.6794412, 2.228368, 0, 0, 0, 1, 1,
0.4919499, -0.6955605, 2.310944, 0, 0, 0, 1, 1,
0.49324, 0.4336167, -0.2965165, 0, 0, 0, 1, 1,
0.4942356, -0.4482591, 1.73096, 0, 0, 0, 1, 1,
0.4968539, -1.127532, 1.845601, 0, 0, 0, 1, 1,
0.4985105, -1.934182, 3.30152, 1, 1, 1, 1, 1,
0.4996009, 1.073562, 0.7734833, 1, 1, 1, 1, 1,
0.5007833, -0.22963, 3.990727, 1, 1, 1, 1, 1,
0.5079193, -0.3436072, 0.9201576, 1, 1, 1, 1, 1,
0.5101707, -0.5066797, 1.336067, 1, 1, 1, 1, 1,
0.5171971, 0.9032161, 1.564012, 1, 1, 1, 1, 1,
0.5185775, -0.9652243, 1.217241, 1, 1, 1, 1, 1,
0.5203324, -0.5981915, 4.124306, 1, 1, 1, 1, 1,
0.5213649, 0.8996422, 0.5389431, 1, 1, 1, 1, 1,
0.5220193, -0.180633, 0.4547223, 1, 1, 1, 1, 1,
0.528384, 1.030536, 1.362301, 1, 1, 1, 1, 1,
0.5304479, -0.6273487, 2.389176, 1, 1, 1, 1, 1,
0.531621, -0.7184351, 2.060187, 1, 1, 1, 1, 1,
0.5347933, 1.441429, 1.805256, 1, 1, 1, 1, 1,
0.5405335, -0.3484836, 4.027087, 1, 1, 1, 1, 1,
0.5412707, 1.770025, -0.3293138, 0, 0, 1, 1, 1,
0.5500616, 2.587433, 0.9174309, 1, 0, 0, 1, 1,
0.5501094, -0.3884684, 2.008309, 1, 0, 0, 1, 1,
0.5536672, 0.7653717, 0.5073238, 1, 0, 0, 1, 1,
0.5576199, -2.31929, 3.228341, 1, 0, 0, 1, 1,
0.55792, 0.2039675, 0.1362249, 1, 0, 0, 1, 1,
0.5585509, 0.07395785, 2.059281, 0, 0, 0, 1, 1,
0.561142, -0.9274813, 2.254244, 0, 0, 0, 1, 1,
0.5696044, -0.0432571, 0.6293665, 0, 0, 0, 1, 1,
0.5785865, 1.577301, 3.162995, 0, 0, 0, 1, 1,
0.5865824, 1.166775, 1.053378, 0, 0, 0, 1, 1,
0.5917214, 1.407778, -0.03330813, 0, 0, 0, 1, 1,
0.5947631, 0.9460238, 0.1683502, 0, 0, 0, 1, 1,
0.5979674, 0.6854069, 1.289376, 1, 1, 1, 1, 1,
0.6021731, 0.3957348, -0.354677, 1, 1, 1, 1, 1,
0.6073024, -0.9975774, 1.71138, 1, 1, 1, 1, 1,
0.6115453, -0.3993946, 2.622284, 1, 1, 1, 1, 1,
0.6199025, 0.5645139, 1.683787, 1, 1, 1, 1, 1,
0.6220267, 0.5848189, 0.193924, 1, 1, 1, 1, 1,
0.6244757, 1.177867, 1.329688, 1, 1, 1, 1, 1,
0.6245095, -0.8908621, 2.499596, 1, 1, 1, 1, 1,
0.6312251, 0.5072067, 1.597494, 1, 1, 1, 1, 1,
0.6341965, 0.6637095, -0.8079186, 1, 1, 1, 1, 1,
0.6363676, 0.1650475, 1.505358, 1, 1, 1, 1, 1,
0.6428142, -1.861964, 3.273394, 1, 1, 1, 1, 1,
0.6449066, -1.712824, 2.701185, 1, 1, 1, 1, 1,
0.6467965, 0.2796034, -0.03706818, 1, 1, 1, 1, 1,
0.6500032, -0.6092597, 3.016813, 1, 1, 1, 1, 1,
0.6522641, -0.7378015, 2.226093, 0, 0, 1, 1, 1,
0.6536078, 0.8633998, 1.692252, 1, 0, 0, 1, 1,
0.6577871, 1.492206, 1.852864, 1, 0, 0, 1, 1,
0.6606739, 0.9202492, -0.08801819, 1, 0, 0, 1, 1,
0.662322, -0.08158776, 2.417645, 1, 0, 0, 1, 1,
0.665078, -1.072981, 2.574465, 1, 0, 0, 1, 1,
0.6681093, -1.155075, 2.597662, 0, 0, 0, 1, 1,
0.6796368, -1.729292, 4.090217, 0, 0, 0, 1, 1,
0.6807006, -0.4836132, 3.225754, 0, 0, 0, 1, 1,
0.6807715, 0.2211401, 2.58807, 0, 0, 0, 1, 1,
0.6906695, -1.453066, 3.079914, 0, 0, 0, 1, 1,
0.6949649, 0.05808379, 2.52679, 0, 0, 0, 1, 1,
0.6981277, 0.008433091, 2.450559, 0, 0, 0, 1, 1,
0.701095, -0.6120983, 3.120383, 1, 1, 1, 1, 1,
0.7134818, -0.03274504, 1.60462, 1, 1, 1, 1, 1,
0.7154523, 1.418676, 0.6486682, 1, 1, 1, 1, 1,
0.7181339, -1.65316, 2.018269, 1, 1, 1, 1, 1,
0.7230329, 0.09583097, 0.6020371, 1, 1, 1, 1, 1,
0.724807, 0.003967073, 2.172174, 1, 1, 1, 1, 1,
0.7254366, -0.73641, 2.487387, 1, 1, 1, 1, 1,
0.7287964, 1.300351, -0.2854884, 1, 1, 1, 1, 1,
0.7300704, 0.3491952, 1.085962, 1, 1, 1, 1, 1,
0.7318128, -0.6807575, 2.050611, 1, 1, 1, 1, 1,
0.7442484, -2.739959, 1.81197, 1, 1, 1, 1, 1,
0.7467667, 0.5006568, 1.007216, 1, 1, 1, 1, 1,
0.7494596, 0.3849978, 0.3385771, 1, 1, 1, 1, 1,
0.751422, 1.946685, -0.01732042, 1, 1, 1, 1, 1,
0.7584577, 1.072141, -0.7818406, 1, 1, 1, 1, 1,
0.7593884, -0.372533, 1.241306, 0, 0, 1, 1, 1,
0.7677295, 1.06365, 1.116369, 1, 0, 0, 1, 1,
0.7709435, -0.6587348, 3.261867, 1, 0, 0, 1, 1,
0.77133, -1.961068, 3.311741, 1, 0, 0, 1, 1,
0.7717736, -0.1300365, 0.9656358, 1, 0, 0, 1, 1,
0.7724028, -0.6365577, 2.580488, 1, 0, 0, 1, 1,
0.7737322, -0.8320833, 0.882295, 0, 0, 0, 1, 1,
0.7746323, 1.386423, 1.058237, 0, 0, 0, 1, 1,
0.777106, 0.6492696, 0.7350848, 0, 0, 0, 1, 1,
0.7804864, 1.172991, 1.041853, 0, 0, 0, 1, 1,
0.7816119, 0.8292314, 0.2992264, 0, 0, 0, 1, 1,
0.7976213, 1.080887, 0.4529789, 0, 0, 0, 1, 1,
0.8003232, 0.4145811, 0.2772838, 0, 0, 0, 1, 1,
0.8007798, 0.7997208, 0.522132, 1, 1, 1, 1, 1,
0.8108945, 0.6299279, 0.3489514, 1, 1, 1, 1, 1,
0.8175668, -0.8110651, 1.430039, 1, 1, 1, 1, 1,
0.8203493, -1.188273, 1.617627, 1, 1, 1, 1, 1,
0.8250806, 0.5306429, 1.428853, 1, 1, 1, 1, 1,
0.8272952, -1.915967, 3.296835, 1, 1, 1, 1, 1,
0.8296175, 0.07264244, 0.3228797, 1, 1, 1, 1, 1,
0.8430247, -0.7569618, 3.785222, 1, 1, 1, 1, 1,
0.8441097, 0.7022243, 1.268769, 1, 1, 1, 1, 1,
0.8443799, -0.08583175, 1.575314, 1, 1, 1, 1, 1,
0.8464261, 1.24517, 2.349528, 1, 1, 1, 1, 1,
0.8515263, -0.505449, 1.287226, 1, 1, 1, 1, 1,
0.8521558, 0.7286779, 2.297494, 1, 1, 1, 1, 1,
0.8553345, -0.02701162, 2.948932, 1, 1, 1, 1, 1,
0.857272, -1.2514, 3.134176, 1, 1, 1, 1, 1,
0.8581014, -0.5897754, 1.540943, 0, 0, 1, 1, 1,
0.8608781, -0.9747679, 1.37824, 1, 0, 0, 1, 1,
0.869468, 0.387901, 0.7143607, 1, 0, 0, 1, 1,
0.8695931, 0.8559044, 0.8671637, 1, 0, 0, 1, 1,
0.8710479, -0.737134, 2.341364, 1, 0, 0, 1, 1,
0.871137, 1.314123, -0.1497581, 1, 0, 0, 1, 1,
0.8760266, -2.285568, 2.056944, 0, 0, 0, 1, 1,
0.8789673, -1.072179, 1.973948, 0, 0, 0, 1, 1,
0.8794962, -1.392834, 2.600783, 0, 0, 0, 1, 1,
0.8801174, 1.620791, -0.05909013, 0, 0, 0, 1, 1,
0.8826779, 0.2396864, 2.002514, 0, 0, 0, 1, 1,
0.8868144, -0.8282821, 3.480776, 0, 0, 0, 1, 1,
0.8875245, -0.1099515, 1.12512, 0, 0, 0, 1, 1,
0.891326, 1.659644, 0.6576155, 1, 1, 1, 1, 1,
0.8943429, -1.029935, 1.713737, 1, 1, 1, 1, 1,
0.9003402, 0.6553465, -0.6915133, 1, 1, 1, 1, 1,
0.9119706, -0.01649206, 1.684164, 1, 1, 1, 1, 1,
0.9120335, 1.173416, 1.186282, 1, 1, 1, 1, 1,
0.9120677, 0.4670917, 2.461685, 1, 1, 1, 1, 1,
0.9136178, 1.465195, 0.3548996, 1, 1, 1, 1, 1,
0.914367, 1.248278, -0.04203278, 1, 1, 1, 1, 1,
0.9182659, -0.4826403, 1.030922, 1, 1, 1, 1, 1,
0.9196107, -1.411117, 0.166402, 1, 1, 1, 1, 1,
0.925906, -0.1523636, 1.066139, 1, 1, 1, 1, 1,
0.9331757, 0.1676624, 2.391028, 1, 1, 1, 1, 1,
0.9402447, 1.287544, -0.5684924, 1, 1, 1, 1, 1,
0.9405018, 0.09970816, 1.034201, 1, 1, 1, 1, 1,
0.9405982, 1.750498, 1.693938, 1, 1, 1, 1, 1,
0.9411242, 0.4108652, -0.02199973, 0, 0, 1, 1, 1,
0.9460037, -0.3315731, 1.904831, 1, 0, 0, 1, 1,
0.947394, 0.2093022, 0.3560802, 1, 0, 0, 1, 1,
0.9488629, 0.3214426, -1.404159, 1, 0, 0, 1, 1,
0.9631003, -0.1637116, 1.342648, 1, 0, 0, 1, 1,
0.9659607, -0.5422034, 2.214325, 1, 0, 0, 1, 1,
0.9759371, -0.147561, 0.9410265, 0, 0, 0, 1, 1,
0.9939334, -0.3847051, 2.382736, 0, 0, 0, 1, 1,
0.9945657, 0.1428805, 3.034862, 0, 0, 0, 1, 1,
0.9961898, 1.430879, 1.616637, 0, 0, 0, 1, 1,
0.9993351, 0.2157067, 1.282007, 0, 0, 0, 1, 1,
1.001094, -0.9061267, 4.119256, 0, 0, 0, 1, 1,
1.001181, 0.1425383, 0.09857217, 0, 0, 0, 1, 1,
1.007107, 2.101031, -0.516236, 1, 1, 1, 1, 1,
1.013629, 1.242137, 1.104846, 1, 1, 1, 1, 1,
1.015411, 0.7832109, 1.298884, 1, 1, 1, 1, 1,
1.016802, -0.8601155, 2.863589, 1, 1, 1, 1, 1,
1.017655, -1.456285, 5.483817, 1, 1, 1, 1, 1,
1.019408, -0.66212, 0.8395162, 1, 1, 1, 1, 1,
1.01961, -0.8531044, 1.81459, 1, 1, 1, 1, 1,
1.027064, 1.219081, 0.9784155, 1, 1, 1, 1, 1,
1.033387, 2.241484, 0.1532227, 1, 1, 1, 1, 1,
1.036437, -0.6241568, 3.456482, 1, 1, 1, 1, 1,
1.046401, 0.486101, 2.82107, 1, 1, 1, 1, 1,
1.048692, 0.02690026, 0.9379146, 1, 1, 1, 1, 1,
1.049867, -1.425689, 2.821016, 1, 1, 1, 1, 1,
1.06826, 1.184349, 2.172218, 1, 1, 1, 1, 1,
1.075599, 1.228349, 1.097866, 1, 1, 1, 1, 1,
1.0769, 0.8890696, 0.1160727, 0, 0, 1, 1, 1,
1.082819, 0.616766, 2.671057, 1, 0, 0, 1, 1,
1.083952, -0.636936, 1.627415, 1, 0, 0, 1, 1,
1.084969, -1.451653, 3.278261, 1, 0, 0, 1, 1,
1.087476, 0.9625197, -0.1350405, 1, 0, 0, 1, 1,
1.092036, 1.264427, -0.07638438, 1, 0, 0, 1, 1,
1.098446, 0.5299153, 0.9601447, 0, 0, 0, 1, 1,
1.110965, -1.100235, 1.611229, 0, 0, 0, 1, 1,
1.115578, 1.864477, 0.1103041, 0, 0, 0, 1, 1,
1.116228, 0.3317515, 0.8700329, 0, 0, 0, 1, 1,
1.12629, 0.75948, 0.2116685, 0, 0, 0, 1, 1,
1.140443, -0.7739645, 2.279811, 0, 0, 0, 1, 1,
1.143658, -0.4342322, 1.927263, 0, 0, 0, 1, 1,
1.145369, -0.08415093, -0.1221954, 1, 1, 1, 1, 1,
1.147309, -0.440603, 0.9978113, 1, 1, 1, 1, 1,
1.155594, -1.073311, 3.609742, 1, 1, 1, 1, 1,
1.156922, 2.038154, 0.02186742, 1, 1, 1, 1, 1,
1.157008, 0.34697, -0.8713711, 1, 1, 1, 1, 1,
1.157502, 0.8052614, 0.9236916, 1, 1, 1, 1, 1,
1.165997, -0.07582861, 2.763851, 1, 1, 1, 1, 1,
1.169455, 0.6467993, 2.023849, 1, 1, 1, 1, 1,
1.176757, -0.8107315, 0.6525835, 1, 1, 1, 1, 1,
1.176948, 0.7019477, 2.507766, 1, 1, 1, 1, 1,
1.180603, 1.395355, -0.2581768, 1, 1, 1, 1, 1,
1.181509, -0.07528876, 1.603315, 1, 1, 1, 1, 1,
1.183168, 0.07780007, 0.8560573, 1, 1, 1, 1, 1,
1.185102, 0.03909927, 0.6947927, 1, 1, 1, 1, 1,
1.185788, -1.375631, 1.621851, 1, 1, 1, 1, 1,
1.186146, 0.2088682, 0.3734999, 0, 0, 1, 1, 1,
1.188714, 1.629465, 1.476989, 1, 0, 0, 1, 1,
1.193295, 0.4537883, 1.478805, 1, 0, 0, 1, 1,
1.199442, -0.3196966, 2.836791, 1, 0, 0, 1, 1,
1.208373, 0.3181947, 2.541903, 1, 0, 0, 1, 1,
1.213505, 1.907374, 1.273936, 1, 0, 0, 1, 1,
1.220079, 0.07879801, 0.4807968, 0, 0, 0, 1, 1,
1.22196, 0.7277822, 0.6526455, 0, 0, 0, 1, 1,
1.227718, 0.1736667, 1.032372, 0, 0, 0, 1, 1,
1.237221, -0.0201014, 2.113454, 0, 0, 0, 1, 1,
1.24612, -1.722097, 1.110834, 0, 0, 0, 1, 1,
1.252329, -0.6202316, 3.496672, 0, 0, 0, 1, 1,
1.256467, 1.005581, -0.7642707, 0, 0, 0, 1, 1,
1.26934, -1.972527, 2.482667, 1, 1, 1, 1, 1,
1.270968, -0.7038374, 1.174115, 1, 1, 1, 1, 1,
1.289705, 1.056899, -0.5228379, 1, 1, 1, 1, 1,
1.290994, -2.027865, 2.291094, 1, 1, 1, 1, 1,
1.293808, 0.5038967, -1.584781, 1, 1, 1, 1, 1,
1.294038, -0.07956823, 1.828731, 1, 1, 1, 1, 1,
1.308183, -1.767035, 4.460016, 1, 1, 1, 1, 1,
1.320649, -2.304352, 1.649189, 1, 1, 1, 1, 1,
1.324695, 0.1623777, 1.162074, 1, 1, 1, 1, 1,
1.32753, -0.7357738, 2.259395, 1, 1, 1, 1, 1,
1.328021, -0.2976557, -0.03930687, 1, 1, 1, 1, 1,
1.342105, -0.6214175, 1.863346, 1, 1, 1, 1, 1,
1.348361, -0.02142591, 1.300337, 1, 1, 1, 1, 1,
1.354402, 0.1272861, 1.09583, 1, 1, 1, 1, 1,
1.368603, -0.4016324, 2.368022, 1, 1, 1, 1, 1,
1.375063, 0.1848725, 2.040082, 0, 0, 1, 1, 1,
1.377893, -0.4732516, 2.834147, 1, 0, 0, 1, 1,
1.377898, 0.6748206, -0.3510675, 1, 0, 0, 1, 1,
1.390086, -0.3685113, 1.68082, 1, 0, 0, 1, 1,
1.393584, 0.6399651, 0.2304959, 1, 0, 0, 1, 1,
1.394329, -0.3687528, 2.669509, 1, 0, 0, 1, 1,
1.395773, 1.231247, 0.5228013, 0, 0, 0, 1, 1,
1.401657, -0.831246, 1.638426, 0, 0, 0, 1, 1,
1.402426, -1.41184, 3.287539, 0, 0, 0, 1, 1,
1.405483, 1.30835, 0.7224464, 0, 0, 0, 1, 1,
1.41008, 0.8564688, 1.85464, 0, 0, 0, 1, 1,
1.414596, -0.7928669, 2.358795, 0, 0, 0, 1, 1,
1.417506, 1.35746, 1.720387, 0, 0, 0, 1, 1,
1.422196, -0.8992777, 1.152102, 1, 1, 1, 1, 1,
1.429127, -1.366574, 1.839487, 1, 1, 1, 1, 1,
1.429641, 0.1821269, 1.239126, 1, 1, 1, 1, 1,
1.449403, -1.531715, 2.03409, 1, 1, 1, 1, 1,
1.449877, -0.3149734, 0.5763091, 1, 1, 1, 1, 1,
1.452803, -0.5093181, 0.2534327, 1, 1, 1, 1, 1,
1.458649, -0.2810821, 1.934979, 1, 1, 1, 1, 1,
1.459573, 1.021051, -0.1561571, 1, 1, 1, 1, 1,
1.468729, -1.199095, 2.705318, 1, 1, 1, 1, 1,
1.487192, 0.1196966, -0.09996089, 1, 1, 1, 1, 1,
1.489427, 0.3161043, 0.8260332, 1, 1, 1, 1, 1,
1.489814, -0.6187986, 1.960991, 1, 1, 1, 1, 1,
1.505158, 0.2396985, -0.1345638, 1, 1, 1, 1, 1,
1.510616, -0.5361184, 2.435556, 1, 1, 1, 1, 1,
1.511056, -0.4689602, 3.133132, 1, 1, 1, 1, 1,
1.511742, -1.120411, 3.091029, 0, 0, 1, 1, 1,
1.519178, -1.046947, 2.56076, 1, 0, 0, 1, 1,
1.525702, 0.1618721, 3.303717, 1, 0, 0, 1, 1,
1.531684, -1.815661, 2.906583, 1, 0, 0, 1, 1,
1.545732, 0.6828395, 2.04437, 1, 0, 0, 1, 1,
1.546003, -0.7310848, 1.873795, 1, 0, 0, 1, 1,
1.551324, 0.352611, 2.240934, 0, 0, 0, 1, 1,
1.552852, -0.8373607, 1.156499, 0, 0, 0, 1, 1,
1.555919, 0.06252862, 0.5050502, 0, 0, 0, 1, 1,
1.579647, -0.9453559, 2.546193, 0, 0, 0, 1, 1,
1.591417, 0.2250364, 2.697911, 0, 0, 0, 1, 1,
1.61003, -1.095174, 3.20813, 0, 0, 0, 1, 1,
1.616538, -0.3895098, 0.984915, 0, 0, 0, 1, 1,
1.631024, -0.9451591, 1.358213, 1, 1, 1, 1, 1,
1.646613, -0.9868266, 1.868208, 1, 1, 1, 1, 1,
1.651274, -1.075322, 2.281823, 1, 1, 1, 1, 1,
1.659722, -0.4983796, 2.062348, 1, 1, 1, 1, 1,
1.664423, 0.9401529, 1.94127, 1, 1, 1, 1, 1,
1.671972, -0.7142912, 1.381737, 1, 1, 1, 1, 1,
1.69253, 0.1888918, 1.955183, 1, 1, 1, 1, 1,
1.698731, -1.020165, 1.143351, 1, 1, 1, 1, 1,
1.705929, 0.599654, 0.6117995, 1, 1, 1, 1, 1,
1.711386, 1.457721, 0.3046384, 1, 1, 1, 1, 1,
1.716572, 1.298477, 1.892863, 1, 1, 1, 1, 1,
1.73866, 0.4348137, 1.274537, 1, 1, 1, 1, 1,
1.740619, 0.6838524, 0.8128819, 1, 1, 1, 1, 1,
1.758178, -0.5662732, 2.795561, 1, 1, 1, 1, 1,
1.767566, 0.6887237, 0.9088002, 1, 1, 1, 1, 1,
1.77224, 0.7053515, 1.348146, 0, 0, 1, 1, 1,
1.787678, -0.5046143, -0.1856098, 1, 0, 0, 1, 1,
1.788898, 1.066281, 2.286186, 1, 0, 0, 1, 1,
1.798141, 1.791596, 1.154791, 1, 0, 0, 1, 1,
1.806552, 0.7693157, 1.277723, 1, 0, 0, 1, 1,
1.819856, -0.8465461, 1.559896, 1, 0, 0, 1, 1,
1.823198, -1.413344, 2.721358, 0, 0, 0, 1, 1,
1.833201, 0.9998289, 2.256071, 0, 0, 0, 1, 1,
1.838934, -0.07261236, 2.252711, 0, 0, 0, 1, 1,
1.850405, 0.3496945, 1.464366, 0, 0, 0, 1, 1,
1.862048, 0.3263668, 1.139696, 0, 0, 0, 1, 1,
1.863331, -0.7406995, 0.6329896, 0, 0, 0, 1, 1,
1.866907, 0.08008111, 2.966673, 0, 0, 0, 1, 1,
1.894595, 0.04782281, 1.118277, 1, 1, 1, 1, 1,
1.945573, 1.138602, 1.672786, 1, 1, 1, 1, 1,
1.950608, 1.283297, 0.4412296, 1, 1, 1, 1, 1,
1.954736, 0.6793192, 2.080279, 1, 1, 1, 1, 1,
1.961407, 1.327166, 0.2892103, 1, 1, 1, 1, 1,
1.967382, -0.9121997, 2.970709, 1, 1, 1, 1, 1,
1.983337, -0.8290626, 2.787581, 1, 1, 1, 1, 1,
2.018994, 2.123998, 0.2280132, 1, 1, 1, 1, 1,
2.020047, -0.7656642, 2.281223, 1, 1, 1, 1, 1,
2.034195, -0.2201078, 1.221329, 1, 1, 1, 1, 1,
2.047709, -0.166392, 1.856405, 1, 1, 1, 1, 1,
2.064682, 0.3196645, -0.05738429, 1, 1, 1, 1, 1,
2.085172, 0.07491162, 2.282591, 1, 1, 1, 1, 1,
2.087964, 1.889683, 2.352221, 1, 1, 1, 1, 1,
2.089424, 0.3479688, 1.731891, 1, 1, 1, 1, 1,
2.10462, -0.6852872, 0.5771803, 0, 0, 1, 1, 1,
2.107591, 1.055734, 1.515269, 1, 0, 0, 1, 1,
2.112532, -0.5604116, 2.473619, 1, 0, 0, 1, 1,
2.129293, -0.6793297, 2.736923, 1, 0, 0, 1, 1,
2.138582, -0.3276881, 0.1697035, 1, 0, 0, 1, 1,
2.149048, 2.24279, 0.8655076, 1, 0, 0, 1, 1,
2.278235, 0.2829749, 2.568511, 0, 0, 0, 1, 1,
2.281361, 1.071105, -0.4769503, 0, 0, 0, 1, 1,
2.32911, -0.3460046, 2.625832, 0, 0, 0, 1, 1,
2.398636, -0.2159718, 1.926306, 0, 0, 0, 1, 1,
2.422998, -1.269233, 0.8884159, 0, 0, 0, 1, 1,
2.509113, 0.9068896, 0.3931352, 0, 0, 0, 1, 1,
2.543051, -0.4978289, 1.231438, 0, 0, 0, 1, 1,
2.79415, 0.09292467, 2.603353, 1, 1, 1, 1, 1,
2.83194, -1.127618, -0.005771509, 1, 1, 1, 1, 1,
2.914406, 1.57389, 2.609885, 1, 1, 1, 1, 1,
3.191882, -0.009077204, 2.762548, 1, 1, 1, 1, 1,
3.432142, -0.6427613, 2.575998, 1, 1, 1, 1, 1,
3.487227, 0.7034158, 0.3707236, 1, 1, 1, 1, 1,
3.966512, 0.3088287, 2.026408, 1, 1, 1, 1, 1
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
var radius = 10.10147;
var distance = 35.48097;
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
mvMatrix.translate( -0.2011952, -0.04761207, 0.3412638 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.48097);
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
