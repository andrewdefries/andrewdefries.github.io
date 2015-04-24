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
-3.895399, -0.1794414, -1.346248, 1, 0, 0, 1,
-3.152576, -0.8260586, -1.700785, 1, 0.007843138, 0, 1,
-3.014978, -2.96591, -3.156637, 1, 0.01176471, 0, 1,
-2.991945, 0.05155455, -2.781661, 1, 0.01960784, 0, 1,
-2.732361, 1.872931, -0.5729558, 1, 0.02352941, 0, 1,
-2.648216, -2.116324, 0.6409844, 1, 0.03137255, 0, 1,
-2.625582, -2.122129, -0.9059299, 1, 0.03529412, 0, 1,
-2.540643, -2.157722, -1.651188, 1, 0.04313726, 0, 1,
-2.535681, -0.3387523, -2.001321, 1, 0.04705882, 0, 1,
-2.4836, 0.4115887, -2.874295, 1, 0.05490196, 0, 1,
-2.435292, -3.461741, -3.287028, 1, 0.05882353, 0, 1,
-2.42563, 0.4977584, -1.232829, 1, 0.06666667, 0, 1,
-2.367954, -0.4029916, -1.270871, 1, 0.07058824, 0, 1,
-2.356727, -0.2701532, -4.443705, 1, 0.07843138, 0, 1,
-2.292102, -0.1571486, -0.7563602, 1, 0.08235294, 0, 1,
-2.277393, 0.1566507, -1.819644, 1, 0.09019608, 0, 1,
-2.273472, 0.8777425, -0.6442299, 1, 0.09411765, 0, 1,
-2.266893, -1.224424, -2.058474, 1, 0.1019608, 0, 1,
-2.265817, 0.4216923, -0.8707556, 1, 0.1098039, 0, 1,
-2.250523, -0.9860734, -1.567212, 1, 0.1137255, 0, 1,
-2.244994, 0.2498675, -1.36424, 1, 0.1215686, 0, 1,
-2.244213, -0.1507061, -1.759359, 1, 0.1254902, 0, 1,
-2.214926, 1.851173, -0.6509774, 1, 0.1333333, 0, 1,
-2.205163, -0.5066739, -3.308765, 1, 0.1372549, 0, 1,
-2.175793, -1.371403, -2.845041, 1, 0.145098, 0, 1,
-2.129182, 0.8861666, -0.3643034, 1, 0.1490196, 0, 1,
-2.120078, 0.2275691, -0.4695976, 1, 0.1568628, 0, 1,
-2.096486, 1.015582, -1.974792, 1, 0.1607843, 0, 1,
-2.089574, -0.04245085, -1.140086, 1, 0.1686275, 0, 1,
-2.075378, -1.58689, -0.5621879, 1, 0.172549, 0, 1,
-2.061073, 1.223014, -0.7129869, 1, 0.1803922, 0, 1,
-2.046937, -0.2933235, -2.266434, 1, 0.1843137, 0, 1,
-2.045168, 0.7631224, -2.207967, 1, 0.1921569, 0, 1,
-2.009887, 0.3957059, -0.7767858, 1, 0.1960784, 0, 1,
-2.005933, 0.0572576, -1.044689, 1, 0.2039216, 0, 1,
-2.005038, 2.594409, 0.06231498, 1, 0.2117647, 0, 1,
-1.990869, -0.1921471, -1.415858, 1, 0.2156863, 0, 1,
-1.959572, 0.01849871, -2.433553, 1, 0.2235294, 0, 1,
-1.92598, 0.9393784, -2.581021, 1, 0.227451, 0, 1,
-1.923957, 0.8210588, -3.439756, 1, 0.2352941, 0, 1,
-1.899872, 0.1124094, 0.1435297, 1, 0.2392157, 0, 1,
-1.895674, 1.08818, -1.260248, 1, 0.2470588, 0, 1,
-1.892512, -1.321918, -2.218285, 1, 0.2509804, 0, 1,
-1.864202, 0.4815944, -1.746918, 1, 0.2588235, 0, 1,
-1.860119, -0.9243155, -1.865319, 1, 0.2627451, 0, 1,
-1.856855, -1.221358, -3.249565, 1, 0.2705882, 0, 1,
-1.854097, -0.221675, -2.460658, 1, 0.2745098, 0, 1,
-1.848622, 0.39151, -2.144968, 1, 0.282353, 0, 1,
-1.844558, -1.185378, -1.568249, 1, 0.2862745, 0, 1,
-1.842181, 0.05937688, -1.917873, 1, 0.2941177, 0, 1,
-1.834507, 1.268138, 0.5921203, 1, 0.3019608, 0, 1,
-1.832298, 1.651732, -1.799837, 1, 0.3058824, 0, 1,
-1.830754, -1.28119, -1.769845, 1, 0.3137255, 0, 1,
-1.816393, 1.640411, -2.42841, 1, 0.3176471, 0, 1,
-1.809199, -0.7107753, -0.8034924, 1, 0.3254902, 0, 1,
-1.808733, 0.6680574, -2.424778, 1, 0.3294118, 0, 1,
-1.80854, -1.694083, -0.9366029, 1, 0.3372549, 0, 1,
-1.801829, -0.363597, -0.954628, 1, 0.3411765, 0, 1,
-1.799993, -0.8141326, -2.367333, 1, 0.3490196, 0, 1,
-1.792143, -0.2310556, -0.1612663, 1, 0.3529412, 0, 1,
-1.760527, -0.1843278, -1.276874, 1, 0.3607843, 0, 1,
-1.743406, -0.8255028, -2.31894, 1, 0.3647059, 0, 1,
-1.740811, -0.1500916, -3.013758, 1, 0.372549, 0, 1,
-1.738638, 0.7760496, -0.5410536, 1, 0.3764706, 0, 1,
-1.734941, -0.5055522, -1.436306, 1, 0.3843137, 0, 1,
-1.729347, -0.1570654, -1.502603, 1, 0.3882353, 0, 1,
-1.727772, 0.20786, -0.8446865, 1, 0.3960784, 0, 1,
-1.710751, 0.8919789, -0.8451722, 1, 0.4039216, 0, 1,
-1.709031, 1.083133, -0.6454521, 1, 0.4078431, 0, 1,
-1.700017, 0.9767332, -0.4612469, 1, 0.4156863, 0, 1,
-1.689737, 1.006119, -1.633529, 1, 0.4196078, 0, 1,
-1.676079, 0.9133881, -1.273274, 1, 0.427451, 0, 1,
-1.67051, -0.09051319, -1.428211, 1, 0.4313726, 0, 1,
-1.631756, -0.3962688, -2.678502, 1, 0.4392157, 0, 1,
-1.62857, 0.4925016, -1.784607, 1, 0.4431373, 0, 1,
-1.627297, 1.46401, -1.658539, 1, 0.4509804, 0, 1,
-1.625435, 0.985548, 0.5428808, 1, 0.454902, 0, 1,
-1.624274, 0.2365471, -2.067762, 1, 0.4627451, 0, 1,
-1.622319, 0.6468705, -0.6382363, 1, 0.4666667, 0, 1,
-1.599663, -0.06315312, 0.1620587, 1, 0.4745098, 0, 1,
-1.595412, -1.480128, -2.937488, 1, 0.4784314, 0, 1,
-1.589942, -1.450341, -2.660428, 1, 0.4862745, 0, 1,
-1.557638, 1.395521, -0.2936481, 1, 0.4901961, 0, 1,
-1.552528, 0.8728182, 0.828267, 1, 0.4980392, 0, 1,
-1.530411, -0.9754721, -1.023346, 1, 0.5058824, 0, 1,
-1.528611, -0.02456412, -1.559026, 1, 0.509804, 0, 1,
-1.524159, -0.7537057, -3.196387, 1, 0.5176471, 0, 1,
-1.518257, -2.771487, -2.502575, 1, 0.5215687, 0, 1,
-1.513432, 0.4411801, 0.01029845, 1, 0.5294118, 0, 1,
-1.500137, -0.4107637, -0.05956179, 1, 0.5333334, 0, 1,
-1.48946, 0.05499389, -1.011118, 1, 0.5411765, 0, 1,
-1.478806, 0.2813176, -0.5596936, 1, 0.5450981, 0, 1,
-1.47345, -0.7159965, -1.032498, 1, 0.5529412, 0, 1,
-1.46825, -0.7877616, -3.579405, 1, 0.5568628, 0, 1,
-1.465263, -0.3968905, -0.6639966, 1, 0.5647059, 0, 1,
-1.444963, 0.9423127, -0.03308825, 1, 0.5686275, 0, 1,
-1.442421, -0.4825714, -0.1818321, 1, 0.5764706, 0, 1,
-1.422315, -1.324028, -3.586833, 1, 0.5803922, 0, 1,
-1.418581, -1.068653, -2.14022, 1, 0.5882353, 0, 1,
-1.415045, 0.2967666, -1.869842, 1, 0.5921569, 0, 1,
-1.412441, 0.4057215, -1.954592, 1, 0.6, 0, 1,
-1.398472, -0.260456, -2.481357, 1, 0.6078432, 0, 1,
-1.397662, 1.003788, -0.7035888, 1, 0.6117647, 0, 1,
-1.389184, 1.139106, -1.32354, 1, 0.6196079, 0, 1,
-1.383297, -1.728428, -1.731985, 1, 0.6235294, 0, 1,
-1.379346, -0.07833181, -2.201975, 1, 0.6313726, 0, 1,
-1.374688, -0.1269001, -1.430362, 1, 0.6352941, 0, 1,
-1.363139, -2.282439, -3.216538, 1, 0.6431373, 0, 1,
-1.357868, 0.06683771, -0.8564779, 1, 0.6470588, 0, 1,
-1.352837, 1.278799, -0.9019336, 1, 0.654902, 0, 1,
-1.352795, 0.9432448, 0.9750459, 1, 0.6588235, 0, 1,
-1.345867, -0.5840712, -2.078159, 1, 0.6666667, 0, 1,
-1.342236, -1.288397, -3.341105, 1, 0.6705883, 0, 1,
-1.333558, 1.200923, -0.593764, 1, 0.6784314, 0, 1,
-1.322306, -2.130679, -2.275366, 1, 0.682353, 0, 1,
-1.321493, 0.3237896, -1.621071, 1, 0.6901961, 0, 1,
-1.307983, -0.1631014, -1.379721, 1, 0.6941177, 0, 1,
-1.296567, 0.775775, -1.317091, 1, 0.7019608, 0, 1,
-1.291718, 1.026637, -0.311639, 1, 0.7098039, 0, 1,
-1.28203, 0.7477698, -1.179391, 1, 0.7137255, 0, 1,
-1.281312, 0.5958629, -1.354063, 1, 0.7215686, 0, 1,
-1.280271, 0.7262032, -2.121206, 1, 0.7254902, 0, 1,
-1.27623, 0.009322434, -1.663985, 1, 0.7333333, 0, 1,
-1.274002, 0.03437705, -0.4840865, 1, 0.7372549, 0, 1,
-1.271349, 0.747425, -1.89598, 1, 0.7450981, 0, 1,
-1.264492, -1.598889, -3.11935, 1, 0.7490196, 0, 1,
-1.258857, 0.5992576, -1.712206, 1, 0.7568628, 0, 1,
-1.25581, -0.4558082, -1.56024, 1, 0.7607843, 0, 1,
-1.253755, -0.7383279, -3.010284, 1, 0.7686275, 0, 1,
-1.250048, 0.328806, -2.660609, 1, 0.772549, 0, 1,
-1.237278, -0.04292708, 0.2602731, 1, 0.7803922, 0, 1,
-1.231611, -1.593634, -1.749406, 1, 0.7843137, 0, 1,
-1.230988, -0.1861076, -1.032238, 1, 0.7921569, 0, 1,
-1.219522, -1.365045, -2.24311, 1, 0.7960784, 0, 1,
-1.214757, -0.8264901, -1.305318, 1, 0.8039216, 0, 1,
-1.213626, 0.561825, -0.5053075, 1, 0.8117647, 0, 1,
-1.211346, -0.08026726, -1.884416, 1, 0.8156863, 0, 1,
-1.208029, -1.733246, -3.4327, 1, 0.8235294, 0, 1,
-1.201601, 0.04986341, -1.987149, 1, 0.827451, 0, 1,
-1.194881, 0.6340527, -0.7629662, 1, 0.8352941, 0, 1,
-1.194146, 1.311783, 1.130663, 1, 0.8392157, 0, 1,
-1.188615, 0.1709795, -0.3484015, 1, 0.8470588, 0, 1,
-1.187917, -0.412718, -2.870996, 1, 0.8509804, 0, 1,
-1.187404, 0.1363096, -0.9043746, 1, 0.8588235, 0, 1,
-1.185182, -0.3371766, 0.002645384, 1, 0.8627451, 0, 1,
-1.182659, -0.6318872, -0.8462341, 1, 0.8705882, 0, 1,
-1.174462, -2.167552, -2.662239, 1, 0.8745098, 0, 1,
-1.171957, 1.082786, -1.668583, 1, 0.8823529, 0, 1,
-1.15508, 0.9807476, 0.3989736, 1, 0.8862745, 0, 1,
-1.152893, 0.4195528, -0.5184891, 1, 0.8941177, 0, 1,
-1.144069, -0.7233078, -3.348572, 1, 0.8980392, 0, 1,
-1.139451, 0.7321163, 0.72779, 1, 0.9058824, 0, 1,
-1.137835, -0.2205948, -1.663963, 1, 0.9137255, 0, 1,
-1.131686, 0.7389515, -1.996948, 1, 0.9176471, 0, 1,
-1.129381, -0.3666719, 0.1463257, 1, 0.9254902, 0, 1,
-1.128177, -0.7980451, -1.816966, 1, 0.9294118, 0, 1,
-1.123098, -1.013825, -3.112497, 1, 0.9372549, 0, 1,
-1.121776, -1.202885, -2.501872, 1, 0.9411765, 0, 1,
-1.121707, -0.5957032, -1.371628, 1, 0.9490196, 0, 1,
-1.115197, -2.354923, -2.881452, 1, 0.9529412, 0, 1,
-1.107852, -0.5125171, -1.557743, 1, 0.9607843, 0, 1,
-1.107515, -0.8873901, -2.531808, 1, 0.9647059, 0, 1,
-1.104933, 0.7495639, -2.707347, 1, 0.972549, 0, 1,
-1.104358, 0.09469852, -1.198882, 1, 0.9764706, 0, 1,
-1.100238, 0.5919719, -1.263348, 1, 0.9843137, 0, 1,
-1.085993, -1.278548, -2.124976, 1, 0.9882353, 0, 1,
-1.079448, 1.373473, 0.3638127, 1, 0.9960784, 0, 1,
-1.069088, -1.149327, -4.067515, 0.9960784, 1, 0, 1,
-1.068496, 1.25741, -0.98375, 0.9921569, 1, 0, 1,
-1.066307, 0.4113148, -3.034604, 0.9843137, 1, 0, 1,
-1.064237, -0.6957548, -1.881189, 0.9803922, 1, 0, 1,
-1.059202, -0.2823846, -0.6833287, 0.972549, 1, 0, 1,
-1.05816, 0.4627971, -1.286575, 0.9686275, 1, 0, 1,
-1.056748, -0.6333023, -3.206609, 0.9607843, 1, 0, 1,
-1.056153, 0.3550055, -1.390842, 0.9568627, 1, 0, 1,
-1.055641, 2.785112, 0.9697657, 0.9490196, 1, 0, 1,
-1.054518, -1.522969, -1.226747, 0.945098, 1, 0, 1,
-1.051456, -0.3791386, -1.971899, 0.9372549, 1, 0, 1,
-1.050173, 0.1304928, -2.659195, 0.9333333, 1, 0, 1,
-1.049201, -0.4131763, -2.043769, 0.9254902, 1, 0, 1,
-1.042138, 0.9104015, -0.8140473, 0.9215686, 1, 0, 1,
-1.037948, -0.5104112, -2.309171, 0.9137255, 1, 0, 1,
-1.037303, -0.3659625, -1.816846, 0.9098039, 1, 0, 1,
-1.033403, -1.694523, -1.793604, 0.9019608, 1, 0, 1,
-1.033058, 0.7389497, 0.7371836, 0.8941177, 1, 0, 1,
-1.032867, -0.5494067, -0.4860325, 0.8901961, 1, 0, 1,
-1.028683, -0.2810392, -1.331882, 0.8823529, 1, 0, 1,
-1.025822, 1.260084, -1.145094, 0.8784314, 1, 0, 1,
-1.024512, 0.1322618, -0.1373631, 0.8705882, 1, 0, 1,
-1.022406, 0.1981945, -1.010426, 0.8666667, 1, 0, 1,
-1.015047, 0.2792545, -3.552897, 0.8588235, 1, 0, 1,
-1.014944, -0.06400036, -2.456886, 0.854902, 1, 0, 1,
-1.014026, -0.6056253, -1.330961, 0.8470588, 1, 0, 1,
-1.007353, 0.4410945, -1.457957, 0.8431373, 1, 0, 1,
-1.001374, -0.1525992, -0.4137253, 0.8352941, 1, 0, 1,
-0.9962476, -1.178504, -2.293476, 0.8313726, 1, 0, 1,
-0.9934222, 0.7689422, -0.439281, 0.8235294, 1, 0, 1,
-0.9902879, 1.67784, -1.510581, 0.8196079, 1, 0, 1,
-0.9806507, -0.6755646, -0.6872789, 0.8117647, 1, 0, 1,
-0.9764492, -1.388209, -2.885835, 0.8078431, 1, 0, 1,
-0.9748334, 1.04547, -0.7057871, 0.8, 1, 0, 1,
-0.9664364, 0.049734, -1.185808, 0.7921569, 1, 0, 1,
-0.9643531, 1.106548, -0.6594641, 0.7882353, 1, 0, 1,
-0.9637947, 0.06859941, -2.402953, 0.7803922, 1, 0, 1,
-0.9593854, -0.4133096, -1.856919, 0.7764706, 1, 0, 1,
-0.9501749, -0.3631461, -3.597198, 0.7686275, 1, 0, 1,
-0.939555, -0.2076862, -0.9890248, 0.7647059, 1, 0, 1,
-0.9314384, 0.7778475, -2.166031, 0.7568628, 1, 0, 1,
-0.9307228, -0.5666839, -1.340502, 0.7529412, 1, 0, 1,
-0.9206008, 0.06867537, -1.633555, 0.7450981, 1, 0, 1,
-0.919955, 1.311014, -0.4135966, 0.7411765, 1, 0, 1,
-0.9114355, -0.4639467, -2.82575, 0.7333333, 1, 0, 1,
-0.9091313, 0.4342654, -0.3236471, 0.7294118, 1, 0, 1,
-0.9024679, -3.320216, -2.706085, 0.7215686, 1, 0, 1,
-0.9014037, -1.635774, -2.076673, 0.7176471, 1, 0, 1,
-0.8980252, -0.7793099, -2.509852, 0.7098039, 1, 0, 1,
-0.8902234, 1.807965, 1.657595, 0.7058824, 1, 0, 1,
-0.8878343, -0.6064039, -1.863947, 0.6980392, 1, 0, 1,
-0.8859503, 1.154766, -2.077939, 0.6901961, 1, 0, 1,
-0.8840978, 0.2588303, -2.380587, 0.6862745, 1, 0, 1,
-0.8835906, 0.5730836, -0.1693211, 0.6784314, 1, 0, 1,
-0.8805693, 0.9327754, 0.7680517, 0.6745098, 1, 0, 1,
-0.8787699, -1.620931, -1.884177, 0.6666667, 1, 0, 1,
-0.8717252, -0.04939679, -0.8428067, 0.6627451, 1, 0, 1,
-0.8705694, 0.1763783, -0.6449561, 0.654902, 1, 0, 1,
-0.8573929, -1.37792, -2.749689, 0.6509804, 1, 0, 1,
-0.8523483, -0.5829996, -2.45673, 0.6431373, 1, 0, 1,
-0.8516845, 2.037374, 0.9296653, 0.6392157, 1, 0, 1,
-0.8497338, 0.1249144, -3.233744, 0.6313726, 1, 0, 1,
-0.844243, -1.499665, -3.562976, 0.627451, 1, 0, 1,
-0.8414498, 0.8052632, -0.7708947, 0.6196079, 1, 0, 1,
-0.8399693, -0.7010085, -1.512415, 0.6156863, 1, 0, 1,
-0.8375648, 0.1890174, -0.417502, 0.6078432, 1, 0, 1,
-0.8352405, 0.2254524, -3.444693, 0.6039216, 1, 0, 1,
-0.8351, 0.4936646, -1.524718, 0.5960785, 1, 0, 1,
-0.8339238, -1.028453, -3.674622, 0.5882353, 1, 0, 1,
-0.8305773, -0.0166989, -1.671384, 0.5843138, 1, 0, 1,
-0.8305666, 1.543245, -1.395068, 0.5764706, 1, 0, 1,
-0.8294119, -0.3458914, -1.690773, 0.572549, 1, 0, 1,
-0.8201047, -0.5297825, -0.8037754, 0.5647059, 1, 0, 1,
-0.8148395, -0.5231846, -1.364051, 0.5607843, 1, 0, 1,
-0.8123059, 0.1316378, -1.014915, 0.5529412, 1, 0, 1,
-0.8093398, -2.346683, -2.649623, 0.5490196, 1, 0, 1,
-0.8052476, 1.114732, 0.04696197, 0.5411765, 1, 0, 1,
-0.8042581, 0.9563822, -0.9806352, 0.5372549, 1, 0, 1,
-0.8009011, -0.7213476, -1.559673, 0.5294118, 1, 0, 1,
-0.7970279, 0.3813246, -1.874309, 0.5254902, 1, 0, 1,
-0.796573, -1.411004, -2.570998, 0.5176471, 1, 0, 1,
-0.7908734, 1.294302, -0.3924895, 0.5137255, 1, 0, 1,
-0.7798325, 0.6237206, -2.060971, 0.5058824, 1, 0, 1,
-0.7789003, 0.383835, -0.1365151, 0.5019608, 1, 0, 1,
-0.7717498, -0.1550193, -3.053609, 0.4941176, 1, 0, 1,
-0.7706678, 0.7675672, 0.07450831, 0.4862745, 1, 0, 1,
-0.7705254, 0.215686, -2.672255, 0.4823529, 1, 0, 1,
-0.7679008, -1.427298, -2.779933, 0.4745098, 1, 0, 1,
-0.7641975, -0.5632315, -2.325101, 0.4705882, 1, 0, 1,
-0.7559192, 1.27074, -1.973998, 0.4627451, 1, 0, 1,
-0.7506922, -0.4526092, -1.932996, 0.4588235, 1, 0, 1,
-0.7482266, -1.270039, -1.242328, 0.4509804, 1, 0, 1,
-0.744118, -0.6445351, -2.01215, 0.4470588, 1, 0, 1,
-0.7380181, -1.124512, -3.879432, 0.4392157, 1, 0, 1,
-0.7359695, -0.7874051, -2.06419, 0.4352941, 1, 0, 1,
-0.7328179, -1.721738, -1.664953, 0.427451, 1, 0, 1,
-0.7321669, -0.1033123, -0.07549164, 0.4235294, 1, 0, 1,
-0.7311628, 0.6316858, -0.2232845, 0.4156863, 1, 0, 1,
-0.7280744, -1.018939, -1.609439, 0.4117647, 1, 0, 1,
-0.721789, 0.6998196, 0.5633466, 0.4039216, 1, 0, 1,
-0.7217848, -1.014042, -1.869091, 0.3960784, 1, 0, 1,
-0.7040449, -0.08041669, 0.04744469, 0.3921569, 1, 0, 1,
-0.7037666, 0.6791123, 1.276608, 0.3843137, 1, 0, 1,
-0.6985833, 0.4936303, -0.04670038, 0.3803922, 1, 0, 1,
-0.6930918, 0.0611096, -2.186246, 0.372549, 1, 0, 1,
-0.6855016, 0.6859949, -2.100296, 0.3686275, 1, 0, 1,
-0.6844162, 1.5211, -0.6283778, 0.3607843, 1, 0, 1,
-0.6837227, -0.601787, -2.480291, 0.3568628, 1, 0, 1,
-0.6834556, -0.6472315, -2.072291, 0.3490196, 1, 0, 1,
-0.6822574, -0.9896696, -2.809543, 0.345098, 1, 0, 1,
-0.6787913, 0.0515701, -3.952133, 0.3372549, 1, 0, 1,
-0.6732551, -1.116473, -2.919022, 0.3333333, 1, 0, 1,
-0.668604, -0.9224116, -2.894435, 0.3254902, 1, 0, 1,
-0.6631771, 1.71888, 1.242333, 0.3215686, 1, 0, 1,
-0.6551557, -0.1609344, -1.101706, 0.3137255, 1, 0, 1,
-0.6432094, -0.005323911, -0.5891371, 0.3098039, 1, 0, 1,
-0.6397359, -1.351916, -2.688294, 0.3019608, 1, 0, 1,
-0.6396645, 0.3251087, -1.987564, 0.2941177, 1, 0, 1,
-0.6291943, -0.1141617, -1.003105, 0.2901961, 1, 0, 1,
-0.6262262, -0.1681343, -3.430224, 0.282353, 1, 0, 1,
-0.6224295, 0.04608887, -2.638189, 0.2784314, 1, 0, 1,
-0.6130011, 0.9098576, -0.02542177, 0.2705882, 1, 0, 1,
-0.607677, -0.5401222, -2.682397, 0.2666667, 1, 0, 1,
-0.606094, -0.7446185, -2.911772, 0.2588235, 1, 0, 1,
-0.6028735, 0.8650225, 2.346787, 0.254902, 1, 0, 1,
-0.6021658, -0.0715035, 0.8508611, 0.2470588, 1, 0, 1,
-0.5991129, -0.1429975, -0.6179193, 0.2431373, 1, 0, 1,
-0.5985258, -2.231362, -2.272553, 0.2352941, 1, 0, 1,
-0.5976229, -0.756524, -1.978689, 0.2313726, 1, 0, 1,
-0.5959686, 0.6831524, -0.6137946, 0.2235294, 1, 0, 1,
-0.5954909, 0.4157847, -1.136623, 0.2196078, 1, 0, 1,
-0.5952823, -0.0505774, -1.806483, 0.2117647, 1, 0, 1,
-0.592779, 0.6032885, -1.58597, 0.2078431, 1, 0, 1,
-0.5920004, -1.024181, -0.634336, 0.2, 1, 0, 1,
-0.5816382, -0.9471396, -3.237214, 0.1921569, 1, 0, 1,
-0.5759841, -1.400959, -2.297854, 0.1882353, 1, 0, 1,
-0.5741864, -1.072271, -2.057684, 0.1803922, 1, 0, 1,
-0.5650777, 2.083873, 0.0277962, 0.1764706, 1, 0, 1,
-0.5635861, 1.211101, 0.960883, 0.1686275, 1, 0, 1,
-0.5632405, -0.3029483, -1.630206, 0.1647059, 1, 0, 1,
-0.5625239, 0.7812865, -2.174227, 0.1568628, 1, 0, 1,
-0.5622473, 0.7332623, -1.035134, 0.1529412, 1, 0, 1,
-0.5614983, -0.2448616, -2.469362, 0.145098, 1, 0, 1,
-0.5608238, 0.2534162, -2.237216, 0.1411765, 1, 0, 1,
-0.5567799, 0.5529231, 0.07138507, 0.1333333, 1, 0, 1,
-0.5517968, -0.7757363, -1.542048, 0.1294118, 1, 0, 1,
-0.5497089, 0.4093089, -1.304608, 0.1215686, 1, 0, 1,
-0.5490047, 0.0542096, -1.768633, 0.1176471, 1, 0, 1,
-0.5445185, 0.05067001, -0.7002606, 0.1098039, 1, 0, 1,
-0.544221, -2.372884, -2.353688, 0.1058824, 1, 0, 1,
-0.5436584, 0.6033427, -0.4633772, 0.09803922, 1, 0, 1,
-0.5429115, -1.199598, -2.369066, 0.09019608, 1, 0, 1,
-0.541452, -0.3829757, -1.166646, 0.08627451, 1, 0, 1,
-0.5414243, -0.6690848, -4.001438, 0.07843138, 1, 0, 1,
-0.5405265, -1.080644, -1.589792, 0.07450981, 1, 0, 1,
-0.5393352, 0.1934904, -1.440464, 0.06666667, 1, 0, 1,
-0.5352041, 0.05171376, -2.525438, 0.0627451, 1, 0, 1,
-0.5318152, 0.4289911, -0.882126, 0.05490196, 1, 0, 1,
-0.528462, 0.04204331, -0.7926782, 0.05098039, 1, 0, 1,
-0.5261566, -0.4802365, -1.929303, 0.04313726, 1, 0, 1,
-0.5256088, 1.070857, 0.484569, 0.03921569, 1, 0, 1,
-0.5215448, -0.3472812, -1.053148, 0.03137255, 1, 0, 1,
-0.5203511, 1.055438, 0.1864392, 0.02745098, 1, 0, 1,
-0.5184264, -0.2679483, -2.604808, 0.01960784, 1, 0, 1,
-0.5178087, 1.681699, -1.319292, 0.01568628, 1, 0, 1,
-0.5144033, -0.09852008, -1.939511, 0.007843138, 1, 0, 1,
-0.5094371, -0.02977538, -2.471191, 0.003921569, 1, 0, 1,
-0.5094137, 0.8157096, -2.514896, 0, 1, 0.003921569, 1,
-0.5061936, 1.039279, -0.3979844, 0, 1, 0.01176471, 1,
-0.5048085, 0.7717936, -0.1966894, 0, 1, 0.01568628, 1,
-0.5041021, -1.886909, -2.588347, 0, 1, 0.02352941, 1,
-0.5031089, 0.4076914, 0.1378898, 0, 1, 0.02745098, 1,
-0.5026674, -0.5944778, -1.306949, 0, 1, 0.03529412, 1,
-0.4962591, -0.2549644, -3.549455, 0, 1, 0.03921569, 1,
-0.4934691, -0.1381799, -0.5076363, 0, 1, 0.04705882, 1,
-0.4907256, -0.1838436, -2.866976, 0, 1, 0.05098039, 1,
-0.4762437, -1.600038, -1.695155, 0, 1, 0.05882353, 1,
-0.4708081, 0.5693072, -1.208744, 0, 1, 0.0627451, 1,
-0.4658169, 1.291116, -1.588975, 0, 1, 0.07058824, 1,
-0.4632368, 0.8434752, -1.435866, 0, 1, 0.07450981, 1,
-0.4596175, 2.634541, 0.1282014, 0, 1, 0.08235294, 1,
-0.4533903, -0.6086003, -1.783202, 0, 1, 0.08627451, 1,
-0.4531206, 0.3490311, 0.3189236, 0, 1, 0.09411765, 1,
-0.4530788, -0.06521241, -0.2188168, 0, 1, 0.1019608, 1,
-0.4489316, -1.259238, -3.73671, 0, 1, 0.1058824, 1,
-0.4479562, -0.2902798, -1.059631, 0, 1, 0.1137255, 1,
-0.4479319, 0.3595016, -0.8324913, 0, 1, 0.1176471, 1,
-0.4446581, 1.727068, 2.216519, 0, 1, 0.1254902, 1,
-0.4334937, -0.1473918, -2.337219, 0, 1, 0.1294118, 1,
-0.4310897, -0.009906488, -3.393709, 0, 1, 0.1372549, 1,
-0.4235705, 1.153046, -1.472865, 0, 1, 0.1411765, 1,
-0.4183664, 0.4784212, 0.003863246, 0, 1, 0.1490196, 1,
-0.4179424, 1.079951, -1.44989, 0, 1, 0.1529412, 1,
-0.4154723, -1.091174, -1.754342, 0, 1, 0.1607843, 1,
-0.4132258, -0.956068, -1.60667, 0, 1, 0.1647059, 1,
-0.4132188, 1.312311, 1.264803, 0, 1, 0.172549, 1,
-0.4081673, -1.493192, -3.540991, 0, 1, 0.1764706, 1,
-0.4068091, 0.06983493, 0.3778628, 0, 1, 0.1843137, 1,
-0.3882572, -0.1886247, -3.961359, 0, 1, 0.1882353, 1,
-0.3847847, -1.059978, -1.154327, 0, 1, 0.1960784, 1,
-0.3814233, -0.1726725, 0.1662248, 0, 1, 0.2039216, 1,
-0.3775589, -0.2988915, -3.138637, 0, 1, 0.2078431, 1,
-0.3755165, 0.5850518, 0.6818387, 0, 1, 0.2156863, 1,
-0.3750989, -0.3766522, -3.46331, 0, 1, 0.2196078, 1,
-0.3730517, -0.6348376, -2.10099, 0, 1, 0.227451, 1,
-0.3724741, -1.262657, -3.164272, 0, 1, 0.2313726, 1,
-0.3710937, 0.838192, -0.5853252, 0, 1, 0.2392157, 1,
-0.3704824, 1.074165, 0.1080288, 0, 1, 0.2431373, 1,
-0.3701681, 0.30357, -2.497903, 0, 1, 0.2509804, 1,
-0.3686258, -0.5871962, -2.644316, 0, 1, 0.254902, 1,
-0.3668056, -0.3222881, -0.872412, 0, 1, 0.2627451, 1,
-0.366034, 1.605725, -0.01487122, 0, 1, 0.2666667, 1,
-0.3659639, -0.4595541, -2.65524, 0, 1, 0.2745098, 1,
-0.3638117, 0.6100794, 0.2792631, 0, 1, 0.2784314, 1,
-0.3636252, -0.4923062, -3.961306, 0, 1, 0.2862745, 1,
-0.3635294, -0.6697542, -4.266679, 0, 1, 0.2901961, 1,
-0.358635, -0.2421679, -1.124599, 0, 1, 0.2980392, 1,
-0.3555394, -0.8600761, -4.04024, 0, 1, 0.3058824, 1,
-0.3484369, 0.2417753, -0.7477095, 0, 1, 0.3098039, 1,
-0.3466071, 0.7292353, -1.784309, 0, 1, 0.3176471, 1,
-0.3454003, -0.1642469, -2.778883, 0, 1, 0.3215686, 1,
-0.3436855, 0.08967911, -0.9826005, 0, 1, 0.3294118, 1,
-0.3431485, -0.08759762, -0.4001294, 0, 1, 0.3333333, 1,
-0.3419896, -1.450892, -1.31505, 0, 1, 0.3411765, 1,
-0.3377255, -1.116985, -1.891241, 0, 1, 0.345098, 1,
-0.3353426, 0.5203949, 0.6997213, 0, 1, 0.3529412, 1,
-0.3311129, 0.0516357, -1.578001, 0, 1, 0.3568628, 1,
-0.329218, 0.3841982, -0.5394901, 0, 1, 0.3647059, 1,
-0.3284993, 0.4448254, -1.988201, 0, 1, 0.3686275, 1,
-0.328224, -1.174385, -3.668529, 0, 1, 0.3764706, 1,
-0.3262052, 0.1000926, -1.649931, 0, 1, 0.3803922, 1,
-0.3233514, 0.8975356, -1.728496, 0, 1, 0.3882353, 1,
-0.3195096, -2.677592, -3.710415, 0, 1, 0.3921569, 1,
-0.318829, -0.3839549, -4.807645, 0, 1, 0.4, 1,
-0.3179833, -0.7132471, -3.277999, 0, 1, 0.4078431, 1,
-0.3073907, -0.21349, -3.212151, 0, 1, 0.4117647, 1,
-0.3061997, -1.25803, -1.642886, 0, 1, 0.4196078, 1,
-0.3059482, 1.579584, 0.2656947, 0, 1, 0.4235294, 1,
-0.3049308, -0.3007503, -1.174641, 0, 1, 0.4313726, 1,
-0.3027949, 0.6282361, -1.348915, 0, 1, 0.4352941, 1,
-0.3003214, -0.562454, -2.51395, 0, 1, 0.4431373, 1,
-0.2969093, -0.8338521, -3.254344, 0, 1, 0.4470588, 1,
-0.2933352, 0.02950769, -0.8570127, 0, 1, 0.454902, 1,
-0.2930668, 0.222583, -0.1309419, 0, 1, 0.4588235, 1,
-0.2836505, -0.7875717, -1.427679, 0, 1, 0.4666667, 1,
-0.2820673, 0.711769, -0.1925832, 0, 1, 0.4705882, 1,
-0.274229, -0.7346033, -2.943924, 0, 1, 0.4784314, 1,
-0.2696142, 0.5215658, -1.107253, 0, 1, 0.4823529, 1,
-0.264211, 1.002999, -0.5522606, 0, 1, 0.4901961, 1,
-0.264165, 0.3283185, -0.8114153, 0, 1, 0.4941176, 1,
-0.2603537, -0.09167334, -0.332466, 0, 1, 0.5019608, 1,
-0.2578339, -0.8965631, -1.987959, 0, 1, 0.509804, 1,
-0.2523738, 0.4076802, -2.51161, 0, 1, 0.5137255, 1,
-0.252238, -0.5620132, -0.7503641, 0, 1, 0.5215687, 1,
-0.2521223, -1.334119, -3.458425, 0, 1, 0.5254902, 1,
-0.2513596, 1.059491, 0.3100847, 0, 1, 0.5333334, 1,
-0.2481773, -2.003152, -2.298749, 0, 1, 0.5372549, 1,
-0.2478704, -0.3915064, -0.7240815, 0, 1, 0.5450981, 1,
-0.2478151, -0.819282, -1.404373, 0, 1, 0.5490196, 1,
-0.2436472, -1.14447, -1.632421, 0, 1, 0.5568628, 1,
-0.2397455, 0.9710588, -0.7436671, 0, 1, 0.5607843, 1,
-0.238798, -0.3123029, -2.902801, 0, 1, 0.5686275, 1,
-0.235342, -0.3995012, -2.629998, 0, 1, 0.572549, 1,
-0.2343381, -0.8069068, -3.313007, 0, 1, 0.5803922, 1,
-0.2323991, 1.610083, 0.4164425, 0, 1, 0.5843138, 1,
-0.2321201, 0.5687982, 1.075809, 0, 1, 0.5921569, 1,
-0.228567, 0.4961459, 0.6686983, 0, 1, 0.5960785, 1,
-0.2237002, -0.2759081, -2.618186, 0, 1, 0.6039216, 1,
-0.2235318, -1.162399, -1.558856, 0, 1, 0.6117647, 1,
-0.2200491, -0.4548756, -3.293978, 0, 1, 0.6156863, 1,
-0.2171298, -0.01643463, -1.219371, 0, 1, 0.6235294, 1,
-0.2098218, -0.3550656, -3.300705, 0, 1, 0.627451, 1,
-0.2089986, -1.576067, -3.115962, 0, 1, 0.6352941, 1,
-0.2088784, -1.889447, -5.216643, 0, 1, 0.6392157, 1,
-0.2047304, -0.4762779, -2.974519, 0, 1, 0.6470588, 1,
-0.2026725, 1.50262, -0.71063, 0, 1, 0.6509804, 1,
-0.1912443, 0.4983278, -0.180394, 0, 1, 0.6588235, 1,
-0.1851167, 1.507003, -0.7422855, 0, 1, 0.6627451, 1,
-0.1788334, -0.7335035, -2.881747, 0, 1, 0.6705883, 1,
-0.1724204, 0.4401585, -0.5753796, 0, 1, 0.6745098, 1,
-0.1704095, 0.7973891, -0.5130007, 0, 1, 0.682353, 1,
-0.1666436, 0.6015239, -0.4580671, 0, 1, 0.6862745, 1,
-0.1648708, -0.6180887, -3.182746, 0, 1, 0.6941177, 1,
-0.1648252, -0.4754881, -0.8837386, 0, 1, 0.7019608, 1,
-0.1614136, -1.23044, -3.016895, 0, 1, 0.7058824, 1,
-0.1587877, -0.03338803, -1.621279, 0, 1, 0.7137255, 1,
-0.1575261, 0.09709398, -0.9901024, 0, 1, 0.7176471, 1,
-0.1550889, 1.144553, -1.254729, 0, 1, 0.7254902, 1,
-0.1545341, 0.8758147, -0.5600162, 0, 1, 0.7294118, 1,
-0.1539696, 0.9357578, -0.418767, 0, 1, 0.7372549, 1,
-0.149528, -1.173149, -2.94043, 0, 1, 0.7411765, 1,
-0.1480895, 0.0943247, -0.392796, 0, 1, 0.7490196, 1,
-0.1470369, 0.4716047, -0.4368895, 0, 1, 0.7529412, 1,
-0.1467867, -0.2618664, -3.439599, 0, 1, 0.7607843, 1,
-0.1466527, -1.303145, -3.493536, 0, 1, 0.7647059, 1,
-0.1437793, -0.5615402, -2.202746, 0, 1, 0.772549, 1,
-0.1419652, -0.3429505, -1.899442, 0, 1, 0.7764706, 1,
-0.1372017, 0.5261543, -1.398652, 0, 1, 0.7843137, 1,
-0.1336261, 1.06815, -1.797684, 0, 1, 0.7882353, 1,
-0.132185, 0.4839254, 0.7958387, 0, 1, 0.7960784, 1,
-0.1288259, -0.9095341, -4.264942, 0, 1, 0.8039216, 1,
-0.1283351, 1.451775, 1.897861, 0, 1, 0.8078431, 1,
-0.1282846, 0.2842869, -2.675297, 0, 1, 0.8156863, 1,
-0.1272362, -1.920485, -2.969234, 0, 1, 0.8196079, 1,
-0.1269262, -0.8265578, -1.20154, 0, 1, 0.827451, 1,
-0.1267502, -1.379418, -3.48071, 0, 1, 0.8313726, 1,
-0.120593, -0.319446, -2.488607, 0, 1, 0.8392157, 1,
-0.1103557, -1.412216, -4.59297, 0, 1, 0.8431373, 1,
-0.1099131, 0.906132, -0.02671343, 0, 1, 0.8509804, 1,
-0.1053891, 0.06774545, -3.320965, 0, 1, 0.854902, 1,
-0.1032075, -0.4186222, -2.299598, 0, 1, 0.8627451, 1,
-0.1006045, -0.8886383, -2.400462, 0, 1, 0.8666667, 1,
-0.1004281, 1.480086, -1.854175, 0, 1, 0.8745098, 1,
-0.1004114, 1.148389, 0.008487454, 0, 1, 0.8784314, 1,
-0.09860674, -0.3703404, -2.867156, 0, 1, 0.8862745, 1,
-0.09852593, -0.1091901, -1.698526, 0, 1, 0.8901961, 1,
-0.09750345, 0.1449919, 0.7775173, 0, 1, 0.8980392, 1,
-0.09562802, -1.258974, -2.335625, 0, 1, 0.9058824, 1,
-0.09374078, 1.041119, 1.993721, 0, 1, 0.9098039, 1,
-0.09292999, -1.240106, -4.485217, 0, 1, 0.9176471, 1,
-0.08733831, 0.572017, -1.396107, 0, 1, 0.9215686, 1,
-0.08334557, 0.7828384, 0.1557842, 0, 1, 0.9294118, 1,
-0.08302452, 0.9171669, 0.6166763, 0, 1, 0.9333333, 1,
-0.0822966, 0.1581451, 1.022638, 0, 1, 0.9411765, 1,
-0.07938772, 0.5392803, -0.5236514, 0, 1, 0.945098, 1,
-0.07877962, -1.622486, -1.654148, 0, 1, 0.9529412, 1,
-0.07791848, -0.8154749, -2.495129, 0, 1, 0.9568627, 1,
-0.07701753, -0.1418793, -1.818178, 0, 1, 0.9647059, 1,
-0.07332421, -0.9213307, -4.922212, 0, 1, 0.9686275, 1,
-0.07272403, -0.08218952, -3.766778, 0, 1, 0.9764706, 1,
-0.07244228, -2.444582, -4.722668, 0, 1, 0.9803922, 1,
-0.07135967, -0.7725514, -2.954789, 0, 1, 0.9882353, 1,
-0.06705987, -0.5890956, -4.071761, 0, 1, 0.9921569, 1,
-0.06677721, -0.5058855, -4.463524, 0, 1, 1, 1,
-0.06572884, 1.065894, 0.05688845, 0, 0.9921569, 1, 1,
-0.06529917, 0.5511512, -1.490738, 0, 0.9882353, 1, 1,
-0.06256005, -0.4989879, -4.055106, 0, 0.9803922, 1, 1,
-0.06156433, 1.274459, -0.7306059, 0, 0.9764706, 1, 1,
-0.06067348, -1.135585, -4.325856, 0, 0.9686275, 1, 1,
-0.058408, 0.1734734, -0.4261987, 0, 0.9647059, 1, 1,
-0.05631855, -0.1275997, -3.323454, 0, 0.9568627, 1, 1,
-0.05330237, -0.03659183, -1.889712, 0, 0.9529412, 1, 1,
-0.05224801, -1.186929, -3.509889, 0, 0.945098, 1, 1,
-0.05178178, 0.3539791, 2.211852, 0, 0.9411765, 1, 1,
-0.05139014, 1.711146, 0.2284385, 0, 0.9333333, 1, 1,
-0.05063125, -1.663405, -3.154867, 0, 0.9294118, 1, 1,
-0.04490257, -1.019278, -3.480698, 0, 0.9215686, 1, 1,
-0.04418738, -0.3509023, -1.822716, 0, 0.9176471, 1, 1,
-0.04400668, -0.3949085, -0.8828792, 0, 0.9098039, 1, 1,
-0.04068768, 1.451521, 0.882046, 0, 0.9058824, 1, 1,
-0.04032356, -0.6340255, -3.867746, 0, 0.8980392, 1, 1,
-0.03822543, -0.3870279, -2.717236, 0, 0.8901961, 1, 1,
-0.03782777, -0.3196422, -3.424651, 0, 0.8862745, 1, 1,
-0.03502149, -0.5483492, -1.725097, 0, 0.8784314, 1, 1,
-0.03262891, -0.02895305, -3.590872, 0, 0.8745098, 1, 1,
-0.02778993, 0.9884152, -1.334772, 0, 0.8666667, 1, 1,
-0.02765977, 0.1709599, -0.4399084, 0, 0.8627451, 1, 1,
-0.02551848, -2.026446, -1.510002, 0, 0.854902, 1, 1,
-0.02242766, 1.445264, 1.039349, 0, 0.8509804, 1, 1,
-0.02061376, 0.659532, -0.8837175, 0, 0.8431373, 1, 1,
-0.0205308, 0.3852383, -0.3679516, 0, 0.8392157, 1, 1,
-0.01809163, 1.270686, -1.172438, 0, 0.8313726, 1, 1,
-0.01221377, -1.591052, -1.69042, 0, 0.827451, 1, 1,
-0.01127313, 0.06509553, -2.072307, 0, 0.8196079, 1, 1,
-0.01096978, 0.8050022, -0.7289221, 0, 0.8156863, 1, 1,
-0.01059563, -0.1480453, -0.6431579, 0, 0.8078431, 1, 1,
-0.004065391, 1.543625, 0.6284015, 0, 0.8039216, 1, 1,
-0.001955662, 2.363017, 0.3101069, 0, 0.7960784, 1, 1,
0.003234823, -0.2927094, 3.643512, 0, 0.7882353, 1, 1,
0.005156042, 0.8414561, -1.318901, 0, 0.7843137, 1, 1,
0.006678231, -1.444584, 3.688354, 0, 0.7764706, 1, 1,
0.009389071, 0.205347, 0.8859377, 0, 0.772549, 1, 1,
0.01038189, -0.4882638, 3.460741, 0, 0.7647059, 1, 1,
0.01283888, -1.063115, 2.040176, 0, 0.7607843, 1, 1,
0.01426864, -0.8925751, 2.027879, 0, 0.7529412, 1, 1,
0.01815319, -0.1158179, 2.407286, 0, 0.7490196, 1, 1,
0.02095128, 1.483078, -0.435057, 0, 0.7411765, 1, 1,
0.02169856, -0.2890928, 4.149069, 0, 0.7372549, 1, 1,
0.02646655, -0.1517035, 3.241037, 0, 0.7294118, 1, 1,
0.03525918, -0.8232528, 0.4068302, 0, 0.7254902, 1, 1,
0.03924618, 1.680761, 1.997419, 0, 0.7176471, 1, 1,
0.04013591, 1.628897, -0.6111289, 0, 0.7137255, 1, 1,
0.04195758, 1.436389, 1.215243, 0, 0.7058824, 1, 1,
0.04253525, -0.3636474, 3.776143, 0, 0.6980392, 1, 1,
0.04949342, 0.5208214, -0.3227948, 0, 0.6941177, 1, 1,
0.04976539, -0.8580308, 1.530548, 0, 0.6862745, 1, 1,
0.0534515, -0.4789903, 3.823423, 0, 0.682353, 1, 1,
0.05516648, 0.563552, -2.828883, 0, 0.6745098, 1, 1,
0.06181224, 0.8040026, 1.329956, 0, 0.6705883, 1, 1,
0.06457629, 2.078476, -0.6922137, 0, 0.6627451, 1, 1,
0.06896414, 0.2212459, 1.647403, 0, 0.6588235, 1, 1,
0.08126067, -0.09397282, 3.807606, 0, 0.6509804, 1, 1,
0.08229741, -1.523062, 3.256742, 0, 0.6470588, 1, 1,
0.08516122, -2.327184, 3.619383, 0, 0.6392157, 1, 1,
0.08621936, 0.7214804, -0.0335683, 0, 0.6352941, 1, 1,
0.09008239, -1.269186, 3.257354, 0, 0.627451, 1, 1,
0.09063467, -0.05756202, 1.302087, 0, 0.6235294, 1, 1,
0.09393858, -0.1070247, 3.116878, 0, 0.6156863, 1, 1,
0.09417302, -1.636662, 4.855625, 0, 0.6117647, 1, 1,
0.0959454, -1.560292, 2.475603, 0, 0.6039216, 1, 1,
0.09596963, 2.062642, 1.304588, 0, 0.5960785, 1, 1,
0.1013002, 0.6175115, -0.1035393, 0, 0.5921569, 1, 1,
0.1031607, -1.878175, 3.149146, 0, 0.5843138, 1, 1,
0.1031911, 0.1163898, 1.51533, 0, 0.5803922, 1, 1,
0.1178371, 1.065515, -1.994827, 0, 0.572549, 1, 1,
0.1216564, -0.1698258, 3.877056, 0, 0.5686275, 1, 1,
0.1223108, -0.6813834, 2.141943, 0, 0.5607843, 1, 1,
0.1247839, -0.894972, 3.359293, 0, 0.5568628, 1, 1,
0.1355703, -0.860374, 3.296239, 0, 0.5490196, 1, 1,
0.1412907, 0.191767, -0.1034504, 0, 0.5450981, 1, 1,
0.1428645, 0.8173249, -0.165486, 0, 0.5372549, 1, 1,
0.1441482, -2.116704, 1.930175, 0, 0.5333334, 1, 1,
0.1454128, 1.228859, 0.2965434, 0, 0.5254902, 1, 1,
0.1454738, -0.1593912, 1.235137, 0, 0.5215687, 1, 1,
0.1455201, -2.794991, 2.076959, 0, 0.5137255, 1, 1,
0.1486011, 0.666055, 0.4461699, 0, 0.509804, 1, 1,
0.1505536, -0.2624045, 1.495257, 0, 0.5019608, 1, 1,
0.1524014, -1.701145, 3.475591, 0, 0.4941176, 1, 1,
0.1593778, 0.779317, -1.127555, 0, 0.4901961, 1, 1,
0.1598815, -0.7721018, 1.23961, 0, 0.4823529, 1, 1,
0.1632214, 0.6026081, -0.251404, 0, 0.4784314, 1, 1,
0.1644847, 0.2484012, -0.5232319, 0, 0.4705882, 1, 1,
0.1655157, 0.7950747, -2.073172, 0, 0.4666667, 1, 1,
0.1718721, -0.1189898, 1.612128, 0, 0.4588235, 1, 1,
0.172077, 1.87606, 0.6669912, 0, 0.454902, 1, 1,
0.1781388, 2.02835, -0.2665281, 0, 0.4470588, 1, 1,
0.1782721, 0.7047818, 1.664225, 0, 0.4431373, 1, 1,
0.1821467, -1.252067, 3.541367, 0, 0.4352941, 1, 1,
0.1857509, -0.772186, 1.747386, 0, 0.4313726, 1, 1,
0.1919727, -1.621513, 3.028633, 0, 0.4235294, 1, 1,
0.196851, 1.625994, 0.07214196, 0, 0.4196078, 1, 1,
0.1989283, 0.6725649, 0.1877443, 0, 0.4117647, 1, 1,
0.1989603, -0.7008556, 3.249629, 0, 0.4078431, 1, 1,
0.2025484, 0.48003, 0.3754297, 0, 0.4, 1, 1,
0.2051467, -0.2265451, 3.388272, 0, 0.3921569, 1, 1,
0.2137044, 1.620714, -0.1505526, 0, 0.3882353, 1, 1,
0.2143387, -1.403885, 2.098811, 0, 0.3803922, 1, 1,
0.2152245, -0.05963958, 2.971255, 0, 0.3764706, 1, 1,
0.2173857, -0.2667881, 1.57401, 0, 0.3686275, 1, 1,
0.2210957, -0.1302176, 2.369903, 0, 0.3647059, 1, 1,
0.2223549, 1.459643, 0.1555466, 0, 0.3568628, 1, 1,
0.2321982, 0.3266201, -0.1745556, 0, 0.3529412, 1, 1,
0.2326156, -0.4617928, 3.21521, 0, 0.345098, 1, 1,
0.2331427, -0.4813997, 1.584465, 0, 0.3411765, 1, 1,
0.2347295, -1.542903, 3.100857, 0, 0.3333333, 1, 1,
0.2417276, 0.5783429, 0.2061633, 0, 0.3294118, 1, 1,
0.2428796, -0.8969918, 3.423792, 0, 0.3215686, 1, 1,
0.2557451, 2.204013, 0.1729725, 0, 0.3176471, 1, 1,
0.2575035, -0.06394425, 1.967498, 0, 0.3098039, 1, 1,
0.2585706, -0.8441478, 3.910279, 0, 0.3058824, 1, 1,
0.2637902, -0.2640169, 2.302305, 0, 0.2980392, 1, 1,
0.2662375, 2.305957, -0.7632682, 0, 0.2901961, 1, 1,
0.2691514, 0.5679023, 0.8184517, 0, 0.2862745, 1, 1,
0.2709048, 0.9170649, 0.5484519, 0, 0.2784314, 1, 1,
0.2764712, 0.2099744, 0.739434, 0, 0.2745098, 1, 1,
0.2806336, -0.9038102, 0.4203841, 0, 0.2666667, 1, 1,
0.2816178, -1.060022, 2.475918, 0, 0.2627451, 1, 1,
0.2911679, -0.7467455, 0.9732416, 0, 0.254902, 1, 1,
0.2926899, 1.594512, 0.4641411, 0, 0.2509804, 1, 1,
0.2965259, 0.09727906, 1.006811, 0, 0.2431373, 1, 1,
0.297436, -0.8089337, 1.003936, 0, 0.2392157, 1, 1,
0.2987411, 0.1943942, 0.7075517, 0, 0.2313726, 1, 1,
0.3001253, 0.3425457, 1.52442, 0, 0.227451, 1, 1,
0.3025473, -0.6012843, 1.668045, 0, 0.2196078, 1, 1,
0.3059031, 0.1492794, 1.108832, 0, 0.2156863, 1, 1,
0.3085811, 1.031876, 2.014936, 0, 0.2078431, 1, 1,
0.3175611, -1.564874, 2.531508, 0, 0.2039216, 1, 1,
0.3208339, -2.270952, 2.976152, 0, 0.1960784, 1, 1,
0.3262028, 0.4222114, -0.67162, 0, 0.1882353, 1, 1,
0.330618, -1.645592, 4.053165, 0, 0.1843137, 1, 1,
0.3307907, 0.08246534, 0.9418572, 0, 0.1764706, 1, 1,
0.3329165, -0.1237906, 2.686581, 0, 0.172549, 1, 1,
0.3369907, -0.8134867, 2.824414, 0, 0.1647059, 1, 1,
0.3374047, -0.3603776, 1.279543, 0, 0.1607843, 1, 1,
0.3395781, 1.048736, 0.7664337, 0, 0.1529412, 1, 1,
0.3442327, -0.2049746, 0.9030375, 0, 0.1490196, 1, 1,
0.3477074, 0.7981631, -1.654992, 0, 0.1411765, 1, 1,
0.3542761, 1.704548, -0.6412922, 0, 0.1372549, 1, 1,
0.3604992, -0.4551802, 4.0491, 0, 0.1294118, 1, 1,
0.3617807, -0.6959617, 2.881655, 0, 0.1254902, 1, 1,
0.3649276, -0.7956466, 2.675211, 0, 0.1176471, 1, 1,
0.3658718, 0.06076218, -0.1204828, 0, 0.1137255, 1, 1,
0.3664143, -2.687357, 3.922621, 0, 0.1058824, 1, 1,
0.369151, 0.03086506, -0.3168532, 0, 0.09803922, 1, 1,
0.3693098, 1.195229, 2.105202, 0, 0.09411765, 1, 1,
0.376876, -0.08509687, 2.646501, 0, 0.08627451, 1, 1,
0.3799389, -0.6187204, 2.793342, 0, 0.08235294, 1, 1,
0.3851177, 0.5994481, 0.1266036, 0, 0.07450981, 1, 1,
0.3895833, -0.3245904, 3.494988, 0, 0.07058824, 1, 1,
0.3940094, 0.1614869, 0.4117045, 0, 0.0627451, 1, 1,
0.3973751, 0.3518829, 0.5982007, 0, 0.05882353, 1, 1,
0.3977157, -0.4984018, 2.924212, 0, 0.05098039, 1, 1,
0.3983009, -1.262328, 3.14474, 0, 0.04705882, 1, 1,
0.3984417, 0.8456242, -0.05327974, 0, 0.03921569, 1, 1,
0.4072212, 1.214703, 1.374667, 0, 0.03529412, 1, 1,
0.4082716, -0.9261712, 4.109299, 0, 0.02745098, 1, 1,
0.4099849, 1.193558, 0.250274, 0, 0.02352941, 1, 1,
0.4121401, 0.9451895, -1.861211, 0, 0.01568628, 1, 1,
0.415992, -0.3879639, 3.568138, 0, 0.01176471, 1, 1,
0.4187958, 0.2132253, 1.495883, 0, 0.003921569, 1, 1,
0.4188568, 0.166784, 2.256701, 0.003921569, 0, 1, 1,
0.4203422, 0.2963671, 0.3927294, 0.007843138, 0, 1, 1,
0.4204305, 0.04119241, 2.047746, 0.01568628, 0, 1, 1,
0.4211242, 0.7605953, 1.827199, 0.01960784, 0, 1, 1,
0.4219047, -0.4669208, 3.400172, 0.02745098, 0, 1, 1,
0.4261517, -0.4455723, 2.866059, 0.03137255, 0, 1, 1,
0.4326094, 0.1725319, 1.437116, 0.03921569, 0, 1, 1,
0.4340331, -1.596609, 2.259318, 0.04313726, 0, 1, 1,
0.4402438, 0.1232766, 1.97856, 0.05098039, 0, 1, 1,
0.4497557, -0.07858378, 2.561662, 0.05490196, 0, 1, 1,
0.4516169, -0.9260006, 1.913417, 0.0627451, 0, 1, 1,
0.4518667, 0.7868365, -0.02141812, 0.06666667, 0, 1, 1,
0.4524786, -1.276585, 2.553663, 0.07450981, 0, 1, 1,
0.4530963, -0.2106518, 1.245534, 0.07843138, 0, 1, 1,
0.4531944, -0.9775913, 2.643937, 0.08627451, 0, 1, 1,
0.4540572, 1.544636, 0.06790467, 0.09019608, 0, 1, 1,
0.4558889, 1.421414, 0.09240157, 0.09803922, 0, 1, 1,
0.4601115, 0.3197253, 2.432028, 0.1058824, 0, 1, 1,
0.4672461, -1.058507, 2.392672, 0.1098039, 0, 1, 1,
0.468906, -1.171744, 3.02721, 0.1176471, 0, 1, 1,
0.4702905, -0.5378164, 1.136208, 0.1215686, 0, 1, 1,
0.4711263, 1.539554, 0.009389577, 0.1294118, 0, 1, 1,
0.4711976, 0.07428728, 1.140677, 0.1333333, 0, 1, 1,
0.4830107, -0.8842223, 3.599265, 0.1411765, 0, 1, 1,
0.4876278, -0.8189631, 2.970159, 0.145098, 0, 1, 1,
0.4901758, 1.281241, 0.4361187, 0.1529412, 0, 1, 1,
0.4904267, 1.504381, -0.2595824, 0.1568628, 0, 1, 1,
0.4915595, -0.6256058, 3.618615, 0.1647059, 0, 1, 1,
0.5008523, -1.327193, 1.725433, 0.1686275, 0, 1, 1,
0.5008664, -1.412729, 3.997958, 0.1764706, 0, 1, 1,
0.5013243, 0.7064047, 0.736977, 0.1803922, 0, 1, 1,
0.5079193, -1.075626, 2.175862, 0.1882353, 0, 1, 1,
0.5081801, -0.4452549, 1.919273, 0.1921569, 0, 1, 1,
0.5091317, 1.518988, 0.111801, 0.2, 0, 1, 1,
0.5094075, 0.5639536, 1.692141, 0.2078431, 0, 1, 1,
0.5115125, -0.1465221, 1.090501, 0.2117647, 0, 1, 1,
0.5127429, -1.352548, 2.160224, 0.2196078, 0, 1, 1,
0.5128836, -0.9652837, 2.729355, 0.2235294, 0, 1, 1,
0.5136974, 0.4342497, 0.5653565, 0.2313726, 0, 1, 1,
0.5139529, -0.1050987, 2.801777, 0.2352941, 0, 1, 1,
0.5140542, 0.6067671, 1.161615, 0.2431373, 0, 1, 1,
0.5201191, -0.04695756, 1.950028, 0.2470588, 0, 1, 1,
0.5204001, 0.9965171, 1.209016, 0.254902, 0, 1, 1,
0.525446, -0.5898959, 0.6373351, 0.2588235, 0, 1, 1,
0.5268875, 0.1947844, 1.292003, 0.2666667, 0, 1, 1,
0.5291156, 0.1129696, 1.924991, 0.2705882, 0, 1, 1,
0.5337408, 0.3452793, 1.601856, 0.2784314, 0, 1, 1,
0.5367441, 1.151117, -0.2468243, 0.282353, 0, 1, 1,
0.5418245, -1.414589, 3.536332, 0.2901961, 0, 1, 1,
0.5428317, 0.2920138, 0.8701641, 0.2941177, 0, 1, 1,
0.545393, 0.1022284, -0.4175907, 0.3019608, 0, 1, 1,
0.5467265, 0.6124161, 0.7017157, 0.3098039, 0, 1, 1,
0.552174, -0.2516107, 1.984726, 0.3137255, 0, 1, 1,
0.5525002, -0.5983166, 1.780183, 0.3215686, 0, 1, 1,
0.5633144, -1.90626, 2.716334, 0.3254902, 0, 1, 1,
0.563836, 0.5597435, 0.08108342, 0.3333333, 0, 1, 1,
0.5681884, 0.6495648, 0.2968245, 0.3372549, 0, 1, 1,
0.5733522, 0.4721903, 0.1429691, 0.345098, 0, 1, 1,
0.5736378, -0.1708818, -0.2990213, 0.3490196, 0, 1, 1,
0.5751909, -0.4419628, 3.672591, 0.3568628, 0, 1, 1,
0.5754464, 0.7295557, -0.8631569, 0.3607843, 0, 1, 1,
0.5844425, -1.216677, 1.882728, 0.3686275, 0, 1, 1,
0.5862883, 0.6951983, -0.147607, 0.372549, 0, 1, 1,
0.5866956, -0.1383661, 3.064314, 0.3803922, 0, 1, 1,
0.5874042, 0.1416935, 1.348187, 0.3843137, 0, 1, 1,
0.5874864, -2.988256, 2.338231, 0.3921569, 0, 1, 1,
0.5936635, 0.9999413, 1.202618, 0.3960784, 0, 1, 1,
0.5937326, 0.07026805, 2.500958, 0.4039216, 0, 1, 1,
0.5970806, -0.2451628, 0.9288726, 0.4117647, 0, 1, 1,
0.5996485, 1.562176, 0.8385245, 0.4156863, 0, 1, 1,
0.6023216, -0.8584623, 1.763471, 0.4235294, 0, 1, 1,
0.6045613, 0.6931062, 1.198106, 0.427451, 0, 1, 1,
0.6053085, 0.4066637, 0.8599305, 0.4352941, 0, 1, 1,
0.6161979, 0.3332434, -0.2624001, 0.4392157, 0, 1, 1,
0.6171361, 0.07589291, 1.344499, 0.4470588, 0, 1, 1,
0.6182197, 1.075094, -1.623193, 0.4509804, 0, 1, 1,
0.6196465, -1.166042, 0.3018132, 0.4588235, 0, 1, 1,
0.6244677, -0.3224243, 1.398211, 0.4627451, 0, 1, 1,
0.6319091, 1.015594, 0.06346965, 0.4705882, 0, 1, 1,
0.6319277, 0.2516401, 0.003617485, 0.4745098, 0, 1, 1,
0.6335344, 0.3299102, -0.9242156, 0.4823529, 0, 1, 1,
0.6364377, -0.8461679, 0.6180593, 0.4862745, 0, 1, 1,
0.6471341, 0.05498503, 0.9466227, 0.4941176, 0, 1, 1,
0.6575027, 0.8737178, -0.5825279, 0.5019608, 0, 1, 1,
0.6584575, 1.534961, -0.7635281, 0.5058824, 0, 1, 1,
0.658891, 0.4487566, 1.029711, 0.5137255, 0, 1, 1,
0.6616489, 0.8932282, -0.3811439, 0.5176471, 0, 1, 1,
0.6625323, 0.8934479, 0.5641437, 0.5254902, 0, 1, 1,
0.6630841, -0.6414587, 2.249028, 0.5294118, 0, 1, 1,
0.6641473, -0.0339746, 0.4192165, 0.5372549, 0, 1, 1,
0.6662046, -0.05114197, 1.14935, 0.5411765, 0, 1, 1,
0.6701708, 1.817628, 0.5414217, 0.5490196, 0, 1, 1,
0.6765558, 1.924358, 0.4407718, 0.5529412, 0, 1, 1,
0.6778613, -0.2362782, 3.948939, 0.5607843, 0, 1, 1,
0.6835241, 0.588457, 0.0424402, 0.5647059, 0, 1, 1,
0.684159, 0.1669689, 0.9180396, 0.572549, 0, 1, 1,
0.6880448, 0.4259544, 2.345599, 0.5764706, 0, 1, 1,
0.6902369, 0.3826131, 0.1592512, 0.5843138, 0, 1, 1,
0.6936918, -0.152669, 0.7112994, 0.5882353, 0, 1, 1,
0.6944026, 0.4288425, 1.657882, 0.5960785, 0, 1, 1,
0.6954163, 2.01805, -0.1792736, 0.6039216, 0, 1, 1,
0.6962695, -0.5106683, 2.724485, 0.6078432, 0, 1, 1,
0.7018323, 0.003186742, 2.771472, 0.6156863, 0, 1, 1,
0.7073913, -0.1546281, 2.036791, 0.6196079, 0, 1, 1,
0.7094766, -1.060011, 2.633621, 0.627451, 0, 1, 1,
0.7166145, -1.43414, 3.116436, 0.6313726, 0, 1, 1,
0.7262305, 0.9444917, 1.323747, 0.6392157, 0, 1, 1,
0.7359792, 0.4148169, 2.101804, 0.6431373, 0, 1, 1,
0.7402045, -0.5468776, 2.185648, 0.6509804, 0, 1, 1,
0.7444097, -1.001617, 3.704576, 0.654902, 0, 1, 1,
0.7455747, -0.5398191, 1.221625, 0.6627451, 0, 1, 1,
0.7480761, 0.7113924, -0.3203546, 0.6666667, 0, 1, 1,
0.7485449, -1.860767, 5.278071, 0.6745098, 0, 1, 1,
0.7525615, 0.5782546, 0.72518, 0.6784314, 0, 1, 1,
0.754015, 1.816924, 0.5496432, 0.6862745, 0, 1, 1,
0.7616662, -1.376707, 2.34456, 0.6901961, 0, 1, 1,
0.7632125, 1.319086, 0.3757353, 0.6980392, 0, 1, 1,
0.7714197, -0.208092, 2.081425, 0.7058824, 0, 1, 1,
0.7750074, 0.6561089, 1.389977, 0.7098039, 0, 1, 1,
0.7891377, 0.07695838, 3.227754, 0.7176471, 0, 1, 1,
0.7951831, -1.631099, 2.672473, 0.7215686, 0, 1, 1,
0.7977428, -2.292249, 2.670001, 0.7294118, 0, 1, 1,
0.8030727, 0.3345182, 0.7885898, 0.7333333, 0, 1, 1,
0.8042608, -0.8308813, 2.627826, 0.7411765, 0, 1, 1,
0.8087026, -0.7313497, 1.235039, 0.7450981, 0, 1, 1,
0.8103658, 0.03825717, 3.026728, 0.7529412, 0, 1, 1,
0.8122655, 0.04747159, 1.37348, 0.7568628, 0, 1, 1,
0.8155198, -0.21804, 0.2827059, 0.7647059, 0, 1, 1,
0.8162251, -0.713945, 1.118394, 0.7686275, 0, 1, 1,
0.8171663, -0.382321, 2.30389, 0.7764706, 0, 1, 1,
0.8193843, 2.195006, 0.3057726, 0.7803922, 0, 1, 1,
0.819792, 0.2301657, 1.446076, 0.7882353, 0, 1, 1,
0.8198071, 0.1736428, 0.8944079, 0.7921569, 0, 1, 1,
0.8210422, -2.178981, 2.925719, 0.8, 0, 1, 1,
0.8227483, 0.1672347, 0.7922001, 0.8078431, 0, 1, 1,
0.825887, 0.7510512, -0.1614504, 0.8117647, 0, 1, 1,
0.8262969, -2.661844, 1.980068, 0.8196079, 0, 1, 1,
0.8293127, -1.715239, 2.555833, 0.8235294, 0, 1, 1,
0.8299434, 0.377738, 1.398867, 0.8313726, 0, 1, 1,
0.8315493, 0.9757442, 2.235744, 0.8352941, 0, 1, 1,
0.8387184, 2.076341, 0.6574005, 0.8431373, 0, 1, 1,
0.8408908, -1.473023, 3.180431, 0.8470588, 0, 1, 1,
0.851433, -0.9134983, 2.211307, 0.854902, 0, 1, 1,
0.8606476, -0.9756781, 3.929952, 0.8588235, 0, 1, 1,
0.8620439, -0.9753762, 1.701923, 0.8666667, 0, 1, 1,
0.8625093, -0.3645604, 1.92803, 0.8705882, 0, 1, 1,
0.8657734, 1.708486, -0.5822382, 0.8784314, 0, 1, 1,
0.8675821, -0.09626728, 1.573727, 0.8823529, 0, 1, 1,
0.8713011, 0.6573953, 0.7519254, 0.8901961, 0, 1, 1,
0.8721457, -0.2747497, 2.237043, 0.8941177, 0, 1, 1,
0.8790037, -0.8106839, 1.726956, 0.9019608, 0, 1, 1,
0.8790297, -0.3529138, 3.779337, 0.9098039, 0, 1, 1,
0.8794602, 1.229023, 1.131943, 0.9137255, 0, 1, 1,
0.8821244, -1.70219, 4.228509, 0.9215686, 0, 1, 1,
0.8856629, -0.7096122, 1.967762, 0.9254902, 0, 1, 1,
0.8908196, 1.71439, -0.8707619, 0.9333333, 0, 1, 1,
0.9074176, 0.6309995, 2.043802, 0.9372549, 0, 1, 1,
0.9137307, 0.9853449, 1.060439, 0.945098, 0, 1, 1,
0.9138269, -0.856604, 1.56469, 0.9490196, 0, 1, 1,
0.9156908, -0.5977097, 1.887042, 0.9568627, 0, 1, 1,
0.916346, -0.05772986, 1.485114, 0.9607843, 0, 1, 1,
0.9168524, 1.03066, -0.4155071, 0.9686275, 0, 1, 1,
0.9198418, -0.1561838, 0.8697392, 0.972549, 0, 1, 1,
0.9208313, 1.133227, 1.869238, 0.9803922, 0, 1, 1,
0.9217681, 1.311297, -0.8655087, 0.9843137, 0, 1, 1,
0.9219367, -0.1392225, 2.953383, 0.9921569, 0, 1, 1,
0.9268933, 0.09026788, 0.1425777, 0.9960784, 0, 1, 1,
0.9314088, 1.009263, -0.1551554, 1, 0, 0.9960784, 1,
0.9356522, -0.4862124, 2.643112, 1, 0, 0.9882353, 1,
0.9414344, 0.6068836, 3.23525, 1, 0, 0.9843137, 1,
0.9414922, 1.153338, 0.2958687, 1, 0, 0.9764706, 1,
0.9426581, 1.169028, 1.730719, 1, 0, 0.972549, 1,
0.9493418, -0.4754077, 1.122815, 1, 0, 0.9647059, 1,
0.9558473, 1.992433, 1.573671, 1, 0, 0.9607843, 1,
0.9578396, 1.117922, 0.6441234, 1, 0, 0.9529412, 1,
0.9640082, 0.1147167, 4.042008, 1, 0, 0.9490196, 1,
0.9711439, -0.3111545, 2.054549, 1, 0, 0.9411765, 1,
0.9748105, 1.463464, 1.963225, 1, 0, 0.9372549, 1,
0.9749805, -0.8923891, 1.031704, 1, 0, 0.9294118, 1,
0.9777557, -0.8570176, 1.995529, 1, 0, 0.9254902, 1,
0.9807571, 0.007548507, 1.825658, 1, 0, 0.9176471, 1,
0.9841586, 0.6870595, 1.544766, 1, 0, 0.9137255, 1,
0.9868497, 0.6509729, 0.3153046, 1, 0, 0.9058824, 1,
0.9884809, -0.5957536, 1.162833, 1, 0, 0.9019608, 1,
0.9966225, -1.649647, 0.9381056, 1, 0, 0.8941177, 1,
0.9990234, -1.515987, 1.04302, 1, 0, 0.8862745, 1,
0.999209, -0.8889616, 1.201445, 1, 0, 0.8823529, 1,
1.007986, 0.809148, 1.839819, 1, 0, 0.8745098, 1,
1.008182, -1.205987, 2.54036, 1, 0, 0.8705882, 1,
1.021033, -0.4932809, 1.950226, 1, 0, 0.8627451, 1,
1.026745, 1.365776, 2.710541, 1, 0, 0.8588235, 1,
1.035441, 0.1119114, 0.7356181, 1, 0, 0.8509804, 1,
1.03872, -0.2398194, 2.798799, 1, 0, 0.8470588, 1,
1.040594, -0.947294, 2.106555, 1, 0, 0.8392157, 1,
1.048875, -0.3353357, 0.909289, 1, 0, 0.8352941, 1,
1.050154, 2.517587, 0.1605675, 1, 0, 0.827451, 1,
1.059064, -1.054798, 1.488601, 1, 0, 0.8235294, 1,
1.059617, -1.504781, 1.771273, 1, 0, 0.8156863, 1,
1.072003, -0.6915383, 2.582609, 1, 0, 0.8117647, 1,
1.074444, 1.052272, 1.459312, 1, 0, 0.8039216, 1,
1.075467, -0.2185238, 1.148685, 1, 0, 0.7960784, 1,
1.077989, 0.02895864, 2.227383, 1, 0, 0.7921569, 1,
1.078788, 1.296531, 0.2875323, 1, 0, 0.7843137, 1,
1.081127, -0.5822074, 1.623655, 1, 0, 0.7803922, 1,
1.084972, 2.04319, 0.2751388, 1, 0, 0.772549, 1,
1.085999, -0.4337583, 1.856357, 1, 0, 0.7686275, 1,
1.086248, -0.4246844, 2.633307, 1, 0, 0.7607843, 1,
1.09009, -0.6861947, 2.047587, 1, 0, 0.7568628, 1,
1.093836, -1.807732, 1.936638, 1, 0, 0.7490196, 1,
1.097703, 0.4338571, 2.326643, 1, 0, 0.7450981, 1,
1.100313, 0.1114126, 1.396853, 1, 0, 0.7372549, 1,
1.102672, 0.3641088, 1.365129, 1, 0, 0.7333333, 1,
1.112604, 0.2096291, -0.725457, 1, 0, 0.7254902, 1,
1.114707, -0.2575161, 2.21688, 1, 0, 0.7215686, 1,
1.119925, -0.6692656, 1.053549, 1, 0, 0.7137255, 1,
1.123787, -0.8540378, 3.136645, 1, 0, 0.7098039, 1,
1.149487, 0.9560408, -0.426838, 1, 0, 0.7019608, 1,
1.161964, -0.5919018, 2.832822, 1, 0, 0.6941177, 1,
1.163666, -0.06959166, 1.111365, 1, 0, 0.6901961, 1,
1.173251, 0.793489, 0.2995222, 1, 0, 0.682353, 1,
1.173543, -0.1770327, 1.367193, 1, 0, 0.6784314, 1,
1.17459, -2.630728, 4.008249, 1, 0, 0.6705883, 1,
1.17939, -0.9927274, 2.482663, 1, 0, 0.6666667, 1,
1.182372, -0.04051074, 2.933027, 1, 0, 0.6588235, 1,
1.195294, 0.1579511, -0.391965, 1, 0, 0.654902, 1,
1.214677, 2.246268, 3.505208, 1, 0, 0.6470588, 1,
1.227048, 0.1570116, 1.0583, 1, 0, 0.6431373, 1,
1.227401, 0.4211324, 1.806614, 1, 0, 0.6352941, 1,
1.23645, -1.03639, 1.868501, 1, 0, 0.6313726, 1,
1.238766, 0.4434983, 0.7171898, 1, 0, 0.6235294, 1,
1.253694, -1.182584, 2.352833, 1, 0, 0.6196079, 1,
1.254861, -2.077835, 3.182005, 1, 0, 0.6117647, 1,
1.275816, -0.3628087, 1.993902, 1, 0, 0.6078432, 1,
1.292021, 0.2072275, 1.755414, 1, 0, 0.6, 1,
1.299457, 0.4530759, 0.4208788, 1, 0, 0.5921569, 1,
1.299601, 0.797762, 1.229088, 1, 0, 0.5882353, 1,
1.300053, -1.472714, 2.881121, 1, 0, 0.5803922, 1,
1.303139, -1.467328, 3.350305, 1, 0, 0.5764706, 1,
1.304898, 0.8214678, 1.533287, 1, 0, 0.5686275, 1,
1.305076, -0.8705065, 2.410609, 1, 0, 0.5647059, 1,
1.314789, 0.0245821, -0.03488846, 1, 0, 0.5568628, 1,
1.315218, -0.3538721, 1.172704, 1, 0, 0.5529412, 1,
1.316066, -0.8738115, 3.718573, 1, 0, 0.5450981, 1,
1.323507, 0.3335614, 2.182101, 1, 0, 0.5411765, 1,
1.324834, -0.1512631, 1.515281, 1, 0, 0.5333334, 1,
1.349458, -0.1241399, 1.422155, 1, 0, 0.5294118, 1,
1.349697, -0.05936714, 1.59912, 1, 0, 0.5215687, 1,
1.355539, 0.1344987, 0.8804997, 1, 0, 0.5176471, 1,
1.355911, 1.409317, 0.1113595, 1, 0, 0.509804, 1,
1.357575, 0.6749091, 2.180471, 1, 0, 0.5058824, 1,
1.367414, 2.338887, 0.5167064, 1, 0, 0.4980392, 1,
1.381334, 1.953312, 1.031695, 1, 0, 0.4901961, 1,
1.387577, -0.2533597, 2.881319, 1, 0, 0.4862745, 1,
1.401885, -0.0764125, 1.136197, 1, 0, 0.4784314, 1,
1.405894, 0.3745101, 3.081283, 1, 0, 0.4745098, 1,
1.407427, -0.3790516, 1.469011, 1, 0, 0.4666667, 1,
1.416175, -1.160843, 2.095746, 1, 0, 0.4627451, 1,
1.424539, 0.04203482, 0.9717573, 1, 0, 0.454902, 1,
1.432152, 1.339309, 1.468781, 1, 0, 0.4509804, 1,
1.451255, -0.5496695, 2.243812, 1, 0, 0.4431373, 1,
1.459561, 0.2635439, 1.482989, 1, 0, 0.4392157, 1,
1.474125, 0.3418604, 2.013583, 1, 0, 0.4313726, 1,
1.493708, 0.8971172, 1.567762, 1, 0, 0.427451, 1,
1.501083, -1.197634, 1.125476, 1, 0, 0.4196078, 1,
1.501274, 0.2590646, 0.9480945, 1, 0, 0.4156863, 1,
1.524897, -1.685848, 3.223494, 1, 0, 0.4078431, 1,
1.557634, 0.5425947, 0.1946884, 1, 0, 0.4039216, 1,
1.571173, 0.2129596, -0.3124827, 1, 0, 0.3960784, 1,
1.573416, 0.04718871, 2.621101, 1, 0, 0.3882353, 1,
1.576084, -0.5894945, 2.138324, 1, 0, 0.3843137, 1,
1.576122, 0.2739564, 1.917202, 1, 0, 0.3764706, 1,
1.577306, 0.2480014, 1.670853, 1, 0, 0.372549, 1,
1.589278, -1.054669, 1.205591, 1, 0, 0.3647059, 1,
1.594599, -0.8763086, 1.478421, 1, 0, 0.3607843, 1,
1.597654, 0.2559421, 1.635402, 1, 0, 0.3529412, 1,
1.606176, -1.107422, 1.847575, 1, 0, 0.3490196, 1,
1.607308, 0.846473, 1.927377, 1, 0, 0.3411765, 1,
1.648926, -0.4436979, 4.359812, 1, 0, 0.3372549, 1,
1.664922, -0.9433712, 0.9074045, 1, 0, 0.3294118, 1,
1.665798, -0.8752019, 3.615436, 1, 0, 0.3254902, 1,
1.668915, 0.0004126538, 1.436614, 1, 0, 0.3176471, 1,
1.681466, -0.7527461, 2.483016, 1, 0, 0.3137255, 1,
1.685315, -0.3572686, 3.186462, 1, 0, 0.3058824, 1,
1.687092, 0.3697505, 1.613241, 1, 0, 0.2980392, 1,
1.690027, -0.1813201, 1.32842, 1, 0, 0.2941177, 1,
1.699356, 0.1158554, 1.403727, 1, 0, 0.2862745, 1,
1.706277, -0.09712748, 1.462118, 1, 0, 0.282353, 1,
1.716975, 0.9601163, 1.638985, 1, 0, 0.2745098, 1,
1.736131, -0.9624641, 3.13608, 1, 0, 0.2705882, 1,
1.784532, -1.324703, 3.032773, 1, 0, 0.2627451, 1,
1.793252, 1.096753, 1.214156, 1, 0, 0.2588235, 1,
1.79652, 0.2781357, 1.307776, 1, 0, 0.2509804, 1,
1.800806, -1.460235, 2.013505, 1, 0, 0.2470588, 1,
1.810485, 0.3436138, 2.134707, 1, 0, 0.2392157, 1,
1.841545, -1.093907, 1.26201, 1, 0, 0.2352941, 1,
1.863857, -0.1350869, 1.819713, 1, 0, 0.227451, 1,
1.873609, -0.1146998, 0.4320968, 1, 0, 0.2235294, 1,
1.879256, 0.406386, 2.100095, 1, 0, 0.2156863, 1,
1.886982, 0.4895873, 1.056202, 1, 0, 0.2117647, 1,
1.896198, 0.4936793, 0.1502679, 1, 0, 0.2039216, 1,
1.908449, 1.152156, -0.1098032, 1, 0, 0.1960784, 1,
1.909495, 0.04573832, 0.8440766, 1, 0, 0.1921569, 1,
1.914901, 0.4789701, 0.08792285, 1, 0, 0.1843137, 1,
1.920142, -0.358852, 2.629837, 1, 0, 0.1803922, 1,
1.92141, -0.9235365, 1.501466, 1, 0, 0.172549, 1,
1.930434, 0.2399766, 1.550548, 1, 0, 0.1686275, 1,
1.950937, 0.2962573, 1.571005, 1, 0, 0.1607843, 1,
1.955777, 0.5712232, 1.790908, 1, 0, 0.1568628, 1,
1.957757, -0.549347, 2.913414, 1, 0, 0.1490196, 1,
1.959986, 1.756186, 0.5439757, 1, 0, 0.145098, 1,
1.965038, -2.590467, 1.656775, 1, 0, 0.1372549, 1,
1.965475, 0.6627989, 1.03899, 1, 0, 0.1333333, 1,
1.967316, 0.2538933, 0.2679764, 1, 0, 0.1254902, 1,
1.991674, -0.02553009, 0.8214308, 1, 0, 0.1215686, 1,
2.011299, 0.2499595, 1.234918, 1, 0, 0.1137255, 1,
2.066386, -0.331017, 2.058034, 1, 0, 0.1098039, 1,
2.080252, 0.4959401, 2.379526, 1, 0, 0.1019608, 1,
2.16268, -0.5918276, 1.94468, 1, 0, 0.09411765, 1,
2.168026, -0.2427839, 1.952078, 1, 0, 0.09019608, 1,
2.188478, -1.18554, 2.574226, 1, 0, 0.08235294, 1,
2.24353, 1.072625, 2.040877, 1, 0, 0.07843138, 1,
2.306189, -0.3988941, 2.883778, 1, 0, 0.07058824, 1,
2.308218, 0.9965577, 2.639347, 1, 0, 0.06666667, 1,
2.36432, 0.7871667, -0.06479193, 1, 0, 0.05882353, 1,
2.425472, 0.1502175, 0.06881376, 1, 0, 0.05490196, 1,
2.435375, 1.070529, 1.264113, 1, 0, 0.04705882, 1,
2.480102, 1.074455, 1.85787, 1, 0, 0.04313726, 1,
2.698061, -1.102817, 1.141416, 1, 0, 0.03529412, 1,
2.714002, 1.392708, 1.489095, 1, 0, 0.03137255, 1,
2.930124, -0.2141589, 2.95, 1, 0, 0.02352941, 1,
3.294999, 0.08541846, 0.7648615, 1, 0, 0.01960784, 1,
3.377064, 0.634747, 3.197854, 1, 0, 0.01176471, 1,
3.400563, 0.9189491, 0.1358133, 1, 0, 0.007843138, 1
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
-0.2474179, -4.520582, -6.995497, 0, -0.5, 0.5, 0.5,
-0.2474179, -4.520582, -6.995497, 1, -0.5, 0.5, 0.5,
-0.2474179, -4.520582, -6.995497, 1, 1.5, 0.5, 0.5,
-0.2474179, -4.520582, -6.995497, 0, 1.5, 0.5, 0.5
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
-5.132064, -0.3383143, -6.995497, 0, -0.5, 0.5, 0.5,
-5.132064, -0.3383143, -6.995497, 1, -0.5, 0.5, 0.5,
-5.132064, -0.3383143, -6.995497, 1, 1.5, 0.5, 0.5,
-5.132064, -0.3383143, -6.995497, 0, 1.5, 0.5, 0.5
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
-5.132064, -4.520582, 0.0307138, 0, -0.5, 0.5, 0.5,
-5.132064, -4.520582, 0.0307138, 1, -0.5, 0.5, 0.5,
-5.132064, -4.520582, 0.0307138, 1, 1.5, 0.5, 0.5,
-5.132064, -4.520582, 0.0307138, 0, 1.5, 0.5, 0.5
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
-2, -3.555444, -5.374064,
2, -3.555444, -5.374064,
-2, -3.555444, -5.374064,
-2, -3.7163, -5.644303,
0, -3.555444, -5.374064,
0, -3.7163, -5.644303,
2, -3.555444, -5.374064,
2, -3.7163, -5.644303
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
-2, -4.038013, -6.184781, 0, -0.5, 0.5, 0.5,
-2, -4.038013, -6.184781, 1, -0.5, 0.5, 0.5,
-2, -4.038013, -6.184781, 1, 1.5, 0.5, 0.5,
-2, -4.038013, -6.184781, 0, 1.5, 0.5, 0.5,
0, -4.038013, -6.184781, 0, -0.5, 0.5, 0.5,
0, -4.038013, -6.184781, 1, -0.5, 0.5, 0.5,
0, -4.038013, -6.184781, 1, 1.5, 0.5, 0.5,
0, -4.038013, -6.184781, 0, 1.5, 0.5, 0.5,
2, -4.038013, -6.184781, 0, -0.5, 0.5, 0.5,
2, -4.038013, -6.184781, 1, -0.5, 0.5, 0.5,
2, -4.038013, -6.184781, 1, 1.5, 0.5, 0.5,
2, -4.038013, -6.184781, 0, 1.5, 0.5, 0.5
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
-4.004838, -3, -5.374064,
-4.004838, 2, -5.374064,
-4.004838, -3, -5.374064,
-4.192709, -3, -5.644303,
-4.004838, -2, -5.374064,
-4.192709, -2, -5.644303,
-4.004838, -1, -5.374064,
-4.192709, -1, -5.644303,
-4.004838, 0, -5.374064,
-4.192709, 0, -5.644303,
-4.004838, 1, -5.374064,
-4.192709, 1, -5.644303,
-4.004838, 2, -5.374064,
-4.192709, 2, -5.644303
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
-4.568451, -3, -6.184781, 0, -0.5, 0.5, 0.5,
-4.568451, -3, -6.184781, 1, -0.5, 0.5, 0.5,
-4.568451, -3, -6.184781, 1, 1.5, 0.5, 0.5,
-4.568451, -3, -6.184781, 0, 1.5, 0.5, 0.5,
-4.568451, -2, -6.184781, 0, -0.5, 0.5, 0.5,
-4.568451, -2, -6.184781, 1, -0.5, 0.5, 0.5,
-4.568451, -2, -6.184781, 1, 1.5, 0.5, 0.5,
-4.568451, -2, -6.184781, 0, 1.5, 0.5, 0.5,
-4.568451, -1, -6.184781, 0, -0.5, 0.5, 0.5,
-4.568451, -1, -6.184781, 1, -0.5, 0.5, 0.5,
-4.568451, -1, -6.184781, 1, 1.5, 0.5, 0.5,
-4.568451, -1, -6.184781, 0, 1.5, 0.5, 0.5,
-4.568451, 0, -6.184781, 0, -0.5, 0.5, 0.5,
-4.568451, 0, -6.184781, 1, -0.5, 0.5, 0.5,
-4.568451, 0, -6.184781, 1, 1.5, 0.5, 0.5,
-4.568451, 0, -6.184781, 0, 1.5, 0.5, 0.5,
-4.568451, 1, -6.184781, 0, -0.5, 0.5, 0.5,
-4.568451, 1, -6.184781, 1, -0.5, 0.5, 0.5,
-4.568451, 1, -6.184781, 1, 1.5, 0.5, 0.5,
-4.568451, 1, -6.184781, 0, 1.5, 0.5, 0.5,
-4.568451, 2, -6.184781, 0, -0.5, 0.5, 0.5,
-4.568451, 2, -6.184781, 1, -0.5, 0.5, 0.5,
-4.568451, 2, -6.184781, 1, 1.5, 0.5, 0.5,
-4.568451, 2, -6.184781, 0, 1.5, 0.5, 0.5
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
-4.004838, -3.555444, -4,
-4.004838, -3.555444, 4,
-4.004838, -3.555444, -4,
-4.192709, -3.7163, -4,
-4.004838, -3.555444, -2,
-4.192709, -3.7163, -2,
-4.004838, -3.555444, 0,
-4.192709, -3.7163, 0,
-4.004838, -3.555444, 2,
-4.192709, -3.7163, 2,
-4.004838, -3.555444, 4,
-4.192709, -3.7163, 4
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
-4.568451, -4.038013, -4, 0, -0.5, 0.5, 0.5,
-4.568451, -4.038013, -4, 1, -0.5, 0.5, 0.5,
-4.568451, -4.038013, -4, 1, 1.5, 0.5, 0.5,
-4.568451, -4.038013, -4, 0, 1.5, 0.5, 0.5,
-4.568451, -4.038013, -2, 0, -0.5, 0.5, 0.5,
-4.568451, -4.038013, -2, 1, -0.5, 0.5, 0.5,
-4.568451, -4.038013, -2, 1, 1.5, 0.5, 0.5,
-4.568451, -4.038013, -2, 0, 1.5, 0.5, 0.5,
-4.568451, -4.038013, 0, 0, -0.5, 0.5, 0.5,
-4.568451, -4.038013, 0, 1, -0.5, 0.5, 0.5,
-4.568451, -4.038013, 0, 1, 1.5, 0.5, 0.5,
-4.568451, -4.038013, 0, 0, 1.5, 0.5, 0.5,
-4.568451, -4.038013, 2, 0, -0.5, 0.5, 0.5,
-4.568451, -4.038013, 2, 1, -0.5, 0.5, 0.5,
-4.568451, -4.038013, 2, 1, 1.5, 0.5, 0.5,
-4.568451, -4.038013, 2, 0, 1.5, 0.5, 0.5,
-4.568451, -4.038013, 4, 0, -0.5, 0.5, 0.5,
-4.568451, -4.038013, 4, 1, -0.5, 0.5, 0.5,
-4.568451, -4.038013, 4, 1, 1.5, 0.5, 0.5,
-4.568451, -4.038013, 4, 0, 1.5, 0.5, 0.5
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
-4.004838, -3.555444, -5.374064,
-4.004838, 2.878815, -5.374064,
-4.004838, -3.555444, 5.435492,
-4.004838, 2.878815, 5.435492,
-4.004838, -3.555444, -5.374064,
-4.004838, -3.555444, 5.435492,
-4.004838, 2.878815, -5.374064,
-4.004838, 2.878815, 5.435492,
-4.004838, -3.555444, -5.374064,
3.510002, -3.555444, -5.374064,
-4.004838, -3.555444, 5.435492,
3.510002, -3.555444, 5.435492,
-4.004838, 2.878815, -5.374064,
3.510002, 2.878815, -5.374064,
-4.004838, 2.878815, 5.435492,
3.510002, 2.878815, 5.435492,
3.510002, -3.555444, -5.374064,
3.510002, 2.878815, -5.374064,
3.510002, -3.555444, 5.435492,
3.510002, 2.878815, 5.435492,
3.510002, -3.555444, -5.374064,
3.510002, -3.555444, 5.435492,
3.510002, 2.878815, -5.374064,
3.510002, 2.878815, 5.435492
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
var radius = 7.824574;
var distance = 34.81241;
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
mvMatrix.translate( 0.2474179, 0.3383143, -0.0307138 );
mvMatrix.scale( 1.125783, 1.31485, 0.7826485 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.81241);
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
Butane<-read.table("Butane.xyz", skip=1)
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
-3.895399, -0.1794414, -1.346248, 0, 0, 1, 1, 1,
-3.152576, -0.8260586, -1.700785, 1, 0, 0, 1, 1,
-3.014978, -2.96591, -3.156637, 1, 0, 0, 1, 1,
-2.991945, 0.05155455, -2.781661, 1, 0, 0, 1, 1,
-2.732361, 1.872931, -0.5729558, 1, 0, 0, 1, 1,
-2.648216, -2.116324, 0.6409844, 1, 0, 0, 1, 1,
-2.625582, -2.122129, -0.9059299, 0, 0, 0, 1, 1,
-2.540643, -2.157722, -1.651188, 0, 0, 0, 1, 1,
-2.535681, -0.3387523, -2.001321, 0, 0, 0, 1, 1,
-2.4836, 0.4115887, -2.874295, 0, 0, 0, 1, 1,
-2.435292, -3.461741, -3.287028, 0, 0, 0, 1, 1,
-2.42563, 0.4977584, -1.232829, 0, 0, 0, 1, 1,
-2.367954, -0.4029916, -1.270871, 0, 0, 0, 1, 1,
-2.356727, -0.2701532, -4.443705, 1, 1, 1, 1, 1,
-2.292102, -0.1571486, -0.7563602, 1, 1, 1, 1, 1,
-2.277393, 0.1566507, -1.819644, 1, 1, 1, 1, 1,
-2.273472, 0.8777425, -0.6442299, 1, 1, 1, 1, 1,
-2.266893, -1.224424, -2.058474, 1, 1, 1, 1, 1,
-2.265817, 0.4216923, -0.8707556, 1, 1, 1, 1, 1,
-2.250523, -0.9860734, -1.567212, 1, 1, 1, 1, 1,
-2.244994, 0.2498675, -1.36424, 1, 1, 1, 1, 1,
-2.244213, -0.1507061, -1.759359, 1, 1, 1, 1, 1,
-2.214926, 1.851173, -0.6509774, 1, 1, 1, 1, 1,
-2.205163, -0.5066739, -3.308765, 1, 1, 1, 1, 1,
-2.175793, -1.371403, -2.845041, 1, 1, 1, 1, 1,
-2.129182, 0.8861666, -0.3643034, 1, 1, 1, 1, 1,
-2.120078, 0.2275691, -0.4695976, 1, 1, 1, 1, 1,
-2.096486, 1.015582, -1.974792, 1, 1, 1, 1, 1,
-2.089574, -0.04245085, -1.140086, 0, 0, 1, 1, 1,
-2.075378, -1.58689, -0.5621879, 1, 0, 0, 1, 1,
-2.061073, 1.223014, -0.7129869, 1, 0, 0, 1, 1,
-2.046937, -0.2933235, -2.266434, 1, 0, 0, 1, 1,
-2.045168, 0.7631224, -2.207967, 1, 0, 0, 1, 1,
-2.009887, 0.3957059, -0.7767858, 1, 0, 0, 1, 1,
-2.005933, 0.0572576, -1.044689, 0, 0, 0, 1, 1,
-2.005038, 2.594409, 0.06231498, 0, 0, 0, 1, 1,
-1.990869, -0.1921471, -1.415858, 0, 0, 0, 1, 1,
-1.959572, 0.01849871, -2.433553, 0, 0, 0, 1, 1,
-1.92598, 0.9393784, -2.581021, 0, 0, 0, 1, 1,
-1.923957, 0.8210588, -3.439756, 0, 0, 0, 1, 1,
-1.899872, 0.1124094, 0.1435297, 0, 0, 0, 1, 1,
-1.895674, 1.08818, -1.260248, 1, 1, 1, 1, 1,
-1.892512, -1.321918, -2.218285, 1, 1, 1, 1, 1,
-1.864202, 0.4815944, -1.746918, 1, 1, 1, 1, 1,
-1.860119, -0.9243155, -1.865319, 1, 1, 1, 1, 1,
-1.856855, -1.221358, -3.249565, 1, 1, 1, 1, 1,
-1.854097, -0.221675, -2.460658, 1, 1, 1, 1, 1,
-1.848622, 0.39151, -2.144968, 1, 1, 1, 1, 1,
-1.844558, -1.185378, -1.568249, 1, 1, 1, 1, 1,
-1.842181, 0.05937688, -1.917873, 1, 1, 1, 1, 1,
-1.834507, 1.268138, 0.5921203, 1, 1, 1, 1, 1,
-1.832298, 1.651732, -1.799837, 1, 1, 1, 1, 1,
-1.830754, -1.28119, -1.769845, 1, 1, 1, 1, 1,
-1.816393, 1.640411, -2.42841, 1, 1, 1, 1, 1,
-1.809199, -0.7107753, -0.8034924, 1, 1, 1, 1, 1,
-1.808733, 0.6680574, -2.424778, 1, 1, 1, 1, 1,
-1.80854, -1.694083, -0.9366029, 0, 0, 1, 1, 1,
-1.801829, -0.363597, -0.954628, 1, 0, 0, 1, 1,
-1.799993, -0.8141326, -2.367333, 1, 0, 0, 1, 1,
-1.792143, -0.2310556, -0.1612663, 1, 0, 0, 1, 1,
-1.760527, -0.1843278, -1.276874, 1, 0, 0, 1, 1,
-1.743406, -0.8255028, -2.31894, 1, 0, 0, 1, 1,
-1.740811, -0.1500916, -3.013758, 0, 0, 0, 1, 1,
-1.738638, 0.7760496, -0.5410536, 0, 0, 0, 1, 1,
-1.734941, -0.5055522, -1.436306, 0, 0, 0, 1, 1,
-1.729347, -0.1570654, -1.502603, 0, 0, 0, 1, 1,
-1.727772, 0.20786, -0.8446865, 0, 0, 0, 1, 1,
-1.710751, 0.8919789, -0.8451722, 0, 0, 0, 1, 1,
-1.709031, 1.083133, -0.6454521, 0, 0, 0, 1, 1,
-1.700017, 0.9767332, -0.4612469, 1, 1, 1, 1, 1,
-1.689737, 1.006119, -1.633529, 1, 1, 1, 1, 1,
-1.676079, 0.9133881, -1.273274, 1, 1, 1, 1, 1,
-1.67051, -0.09051319, -1.428211, 1, 1, 1, 1, 1,
-1.631756, -0.3962688, -2.678502, 1, 1, 1, 1, 1,
-1.62857, 0.4925016, -1.784607, 1, 1, 1, 1, 1,
-1.627297, 1.46401, -1.658539, 1, 1, 1, 1, 1,
-1.625435, 0.985548, 0.5428808, 1, 1, 1, 1, 1,
-1.624274, 0.2365471, -2.067762, 1, 1, 1, 1, 1,
-1.622319, 0.6468705, -0.6382363, 1, 1, 1, 1, 1,
-1.599663, -0.06315312, 0.1620587, 1, 1, 1, 1, 1,
-1.595412, -1.480128, -2.937488, 1, 1, 1, 1, 1,
-1.589942, -1.450341, -2.660428, 1, 1, 1, 1, 1,
-1.557638, 1.395521, -0.2936481, 1, 1, 1, 1, 1,
-1.552528, 0.8728182, 0.828267, 1, 1, 1, 1, 1,
-1.530411, -0.9754721, -1.023346, 0, 0, 1, 1, 1,
-1.528611, -0.02456412, -1.559026, 1, 0, 0, 1, 1,
-1.524159, -0.7537057, -3.196387, 1, 0, 0, 1, 1,
-1.518257, -2.771487, -2.502575, 1, 0, 0, 1, 1,
-1.513432, 0.4411801, 0.01029845, 1, 0, 0, 1, 1,
-1.500137, -0.4107637, -0.05956179, 1, 0, 0, 1, 1,
-1.48946, 0.05499389, -1.011118, 0, 0, 0, 1, 1,
-1.478806, 0.2813176, -0.5596936, 0, 0, 0, 1, 1,
-1.47345, -0.7159965, -1.032498, 0, 0, 0, 1, 1,
-1.46825, -0.7877616, -3.579405, 0, 0, 0, 1, 1,
-1.465263, -0.3968905, -0.6639966, 0, 0, 0, 1, 1,
-1.444963, 0.9423127, -0.03308825, 0, 0, 0, 1, 1,
-1.442421, -0.4825714, -0.1818321, 0, 0, 0, 1, 1,
-1.422315, -1.324028, -3.586833, 1, 1, 1, 1, 1,
-1.418581, -1.068653, -2.14022, 1, 1, 1, 1, 1,
-1.415045, 0.2967666, -1.869842, 1, 1, 1, 1, 1,
-1.412441, 0.4057215, -1.954592, 1, 1, 1, 1, 1,
-1.398472, -0.260456, -2.481357, 1, 1, 1, 1, 1,
-1.397662, 1.003788, -0.7035888, 1, 1, 1, 1, 1,
-1.389184, 1.139106, -1.32354, 1, 1, 1, 1, 1,
-1.383297, -1.728428, -1.731985, 1, 1, 1, 1, 1,
-1.379346, -0.07833181, -2.201975, 1, 1, 1, 1, 1,
-1.374688, -0.1269001, -1.430362, 1, 1, 1, 1, 1,
-1.363139, -2.282439, -3.216538, 1, 1, 1, 1, 1,
-1.357868, 0.06683771, -0.8564779, 1, 1, 1, 1, 1,
-1.352837, 1.278799, -0.9019336, 1, 1, 1, 1, 1,
-1.352795, 0.9432448, 0.9750459, 1, 1, 1, 1, 1,
-1.345867, -0.5840712, -2.078159, 1, 1, 1, 1, 1,
-1.342236, -1.288397, -3.341105, 0, 0, 1, 1, 1,
-1.333558, 1.200923, -0.593764, 1, 0, 0, 1, 1,
-1.322306, -2.130679, -2.275366, 1, 0, 0, 1, 1,
-1.321493, 0.3237896, -1.621071, 1, 0, 0, 1, 1,
-1.307983, -0.1631014, -1.379721, 1, 0, 0, 1, 1,
-1.296567, 0.775775, -1.317091, 1, 0, 0, 1, 1,
-1.291718, 1.026637, -0.311639, 0, 0, 0, 1, 1,
-1.28203, 0.7477698, -1.179391, 0, 0, 0, 1, 1,
-1.281312, 0.5958629, -1.354063, 0, 0, 0, 1, 1,
-1.280271, 0.7262032, -2.121206, 0, 0, 0, 1, 1,
-1.27623, 0.009322434, -1.663985, 0, 0, 0, 1, 1,
-1.274002, 0.03437705, -0.4840865, 0, 0, 0, 1, 1,
-1.271349, 0.747425, -1.89598, 0, 0, 0, 1, 1,
-1.264492, -1.598889, -3.11935, 1, 1, 1, 1, 1,
-1.258857, 0.5992576, -1.712206, 1, 1, 1, 1, 1,
-1.25581, -0.4558082, -1.56024, 1, 1, 1, 1, 1,
-1.253755, -0.7383279, -3.010284, 1, 1, 1, 1, 1,
-1.250048, 0.328806, -2.660609, 1, 1, 1, 1, 1,
-1.237278, -0.04292708, 0.2602731, 1, 1, 1, 1, 1,
-1.231611, -1.593634, -1.749406, 1, 1, 1, 1, 1,
-1.230988, -0.1861076, -1.032238, 1, 1, 1, 1, 1,
-1.219522, -1.365045, -2.24311, 1, 1, 1, 1, 1,
-1.214757, -0.8264901, -1.305318, 1, 1, 1, 1, 1,
-1.213626, 0.561825, -0.5053075, 1, 1, 1, 1, 1,
-1.211346, -0.08026726, -1.884416, 1, 1, 1, 1, 1,
-1.208029, -1.733246, -3.4327, 1, 1, 1, 1, 1,
-1.201601, 0.04986341, -1.987149, 1, 1, 1, 1, 1,
-1.194881, 0.6340527, -0.7629662, 1, 1, 1, 1, 1,
-1.194146, 1.311783, 1.130663, 0, 0, 1, 1, 1,
-1.188615, 0.1709795, -0.3484015, 1, 0, 0, 1, 1,
-1.187917, -0.412718, -2.870996, 1, 0, 0, 1, 1,
-1.187404, 0.1363096, -0.9043746, 1, 0, 0, 1, 1,
-1.185182, -0.3371766, 0.002645384, 1, 0, 0, 1, 1,
-1.182659, -0.6318872, -0.8462341, 1, 0, 0, 1, 1,
-1.174462, -2.167552, -2.662239, 0, 0, 0, 1, 1,
-1.171957, 1.082786, -1.668583, 0, 0, 0, 1, 1,
-1.15508, 0.9807476, 0.3989736, 0, 0, 0, 1, 1,
-1.152893, 0.4195528, -0.5184891, 0, 0, 0, 1, 1,
-1.144069, -0.7233078, -3.348572, 0, 0, 0, 1, 1,
-1.139451, 0.7321163, 0.72779, 0, 0, 0, 1, 1,
-1.137835, -0.2205948, -1.663963, 0, 0, 0, 1, 1,
-1.131686, 0.7389515, -1.996948, 1, 1, 1, 1, 1,
-1.129381, -0.3666719, 0.1463257, 1, 1, 1, 1, 1,
-1.128177, -0.7980451, -1.816966, 1, 1, 1, 1, 1,
-1.123098, -1.013825, -3.112497, 1, 1, 1, 1, 1,
-1.121776, -1.202885, -2.501872, 1, 1, 1, 1, 1,
-1.121707, -0.5957032, -1.371628, 1, 1, 1, 1, 1,
-1.115197, -2.354923, -2.881452, 1, 1, 1, 1, 1,
-1.107852, -0.5125171, -1.557743, 1, 1, 1, 1, 1,
-1.107515, -0.8873901, -2.531808, 1, 1, 1, 1, 1,
-1.104933, 0.7495639, -2.707347, 1, 1, 1, 1, 1,
-1.104358, 0.09469852, -1.198882, 1, 1, 1, 1, 1,
-1.100238, 0.5919719, -1.263348, 1, 1, 1, 1, 1,
-1.085993, -1.278548, -2.124976, 1, 1, 1, 1, 1,
-1.079448, 1.373473, 0.3638127, 1, 1, 1, 1, 1,
-1.069088, -1.149327, -4.067515, 1, 1, 1, 1, 1,
-1.068496, 1.25741, -0.98375, 0, 0, 1, 1, 1,
-1.066307, 0.4113148, -3.034604, 1, 0, 0, 1, 1,
-1.064237, -0.6957548, -1.881189, 1, 0, 0, 1, 1,
-1.059202, -0.2823846, -0.6833287, 1, 0, 0, 1, 1,
-1.05816, 0.4627971, -1.286575, 1, 0, 0, 1, 1,
-1.056748, -0.6333023, -3.206609, 1, 0, 0, 1, 1,
-1.056153, 0.3550055, -1.390842, 0, 0, 0, 1, 1,
-1.055641, 2.785112, 0.9697657, 0, 0, 0, 1, 1,
-1.054518, -1.522969, -1.226747, 0, 0, 0, 1, 1,
-1.051456, -0.3791386, -1.971899, 0, 0, 0, 1, 1,
-1.050173, 0.1304928, -2.659195, 0, 0, 0, 1, 1,
-1.049201, -0.4131763, -2.043769, 0, 0, 0, 1, 1,
-1.042138, 0.9104015, -0.8140473, 0, 0, 0, 1, 1,
-1.037948, -0.5104112, -2.309171, 1, 1, 1, 1, 1,
-1.037303, -0.3659625, -1.816846, 1, 1, 1, 1, 1,
-1.033403, -1.694523, -1.793604, 1, 1, 1, 1, 1,
-1.033058, 0.7389497, 0.7371836, 1, 1, 1, 1, 1,
-1.032867, -0.5494067, -0.4860325, 1, 1, 1, 1, 1,
-1.028683, -0.2810392, -1.331882, 1, 1, 1, 1, 1,
-1.025822, 1.260084, -1.145094, 1, 1, 1, 1, 1,
-1.024512, 0.1322618, -0.1373631, 1, 1, 1, 1, 1,
-1.022406, 0.1981945, -1.010426, 1, 1, 1, 1, 1,
-1.015047, 0.2792545, -3.552897, 1, 1, 1, 1, 1,
-1.014944, -0.06400036, -2.456886, 1, 1, 1, 1, 1,
-1.014026, -0.6056253, -1.330961, 1, 1, 1, 1, 1,
-1.007353, 0.4410945, -1.457957, 1, 1, 1, 1, 1,
-1.001374, -0.1525992, -0.4137253, 1, 1, 1, 1, 1,
-0.9962476, -1.178504, -2.293476, 1, 1, 1, 1, 1,
-0.9934222, 0.7689422, -0.439281, 0, 0, 1, 1, 1,
-0.9902879, 1.67784, -1.510581, 1, 0, 0, 1, 1,
-0.9806507, -0.6755646, -0.6872789, 1, 0, 0, 1, 1,
-0.9764492, -1.388209, -2.885835, 1, 0, 0, 1, 1,
-0.9748334, 1.04547, -0.7057871, 1, 0, 0, 1, 1,
-0.9664364, 0.049734, -1.185808, 1, 0, 0, 1, 1,
-0.9643531, 1.106548, -0.6594641, 0, 0, 0, 1, 1,
-0.9637947, 0.06859941, -2.402953, 0, 0, 0, 1, 1,
-0.9593854, -0.4133096, -1.856919, 0, 0, 0, 1, 1,
-0.9501749, -0.3631461, -3.597198, 0, 0, 0, 1, 1,
-0.939555, -0.2076862, -0.9890248, 0, 0, 0, 1, 1,
-0.9314384, 0.7778475, -2.166031, 0, 0, 0, 1, 1,
-0.9307228, -0.5666839, -1.340502, 0, 0, 0, 1, 1,
-0.9206008, 0.06867537, -1.633555, 1, 1, 1, 1, 1,
-0.919955, 1.311014, -0.4135966, 1, 1, 1, 1, 1,
-0.9114355, -0.4639467, -2.82575, 1, 1, 1, 1, 1,
-0.9091313, 0.4342654, -0.3236471, 1, 1, 1, 1, 1,
-0.9024679, -3.320216, -2.706085, 1, 1, 1, 1, 1,
-0.9014037, -1.635774, -2.076673, 1, 1, 1, 1, 1,
-0.8980252, -0.7793099, -2.509852, 1, 1, 1, 1, 1,
-0.8902234, 1.807965, 1.657595, 1, 1, 1, 1, 1,
-0.8878343, -0.6064039, -1.863947, 1, 1, 1, 1, 1,
-0.8859503, 1.154766, -2.077939, 1, 1, 1, 1, 1,
-0.8840978, 0.2588303, -2.380587, 1, 1, 1, 1, 1,
-0.8835906, 0.5730836, -0.1693211, 1, 1, 1, 1, 1,
-0.8805693, 0.9327754, 0.7680517, 1, 1, 1, 1, 1,
-0.8787699, -1.620931, -1.884177, 1, 1, 1, 1, 1,
-0.8717252, -0.04939679, -0.8428067, 1, 1, 1, 1, 1,
-0.8705694, 0.1763783, -0.6449561, 0, 0, 1, 1, 1,
-0.8573929, -1.37792, -2.749689, 1, 0, 0, 1, 1,
-0.8523483, -0.5829996, -2.45673, 1, 0, 0, 1, 1,
-0.8516845, 2.037374, 0.9296653, 1, 0, 0, 1, 1,
-0.8497338, 0.1249144, -3.233744, 1, 0, 0, 1, 1,
-0.844243, -1.499665, -3.562976, 1, 0, 0, 1, 1,
-0.8414498, 0.8052632, -0.7708947, 0, 0, 0, 1, 1,
-0.8399693, -0.7010085, -1.512415, 0, 0, 0, 1, 1,
-0.8375648, 0.1890174, -0.417502, 0, 0, 0, 1, 1,
-0.8352405, 0.2254524, -3.444693, 0, 0, 0, 1, 1,
-0.8351, 0.4936646, -1.524718, 0, 0, 0, 1, 1,
-0.8339238, -1.028453, -3.674622, 0, 0, 0, 1, 1,
-0.8305773, -0.0166989, -1.671384, 0, 0, 0, 1, 1,
-0.8305666, 1.543245, -1.395068, 1, 1, 1, 1, 1,
-0.8294119, -0.3458914, -1.690773, 1, 1, 1, 1, 1,
-0.8201047, -0.5297825, -0.8037754, 1, 1, 1, 1, 1,
-0.8148395, -0.5231846, -1.364051, 1, 1, 1, 1, 1,
-0.8123059, 0.1316378, -1.014915, 1, 1, 1, 1, 1,
-0.8093398, -2.346683, -2.649623, 1, 1, 1, 1, 1,
-0.8052476, 1.114732, 0.04696197, 1, 1, 1, 1, 1,
-0.8042581, 0.9563822, -0.9806352, 1, 1, 1, 1, 1,
-0.8009011, -0.7213476, -1.559673, 1, 1, 1, 1, 1,
-0.7970279, 0.3813246, -1.874309, 1, 1, 1, 1, 1,
-0.796573, -1.411004, -2.570998, 1, 1, 1, 1, 1,
-0.7908734, 1.294302, -0.3924895, 1, 1, 1, 1, 1,
-0.7798325, 0.6237206, -2.060971, 1, 1, 1, 1, 1,
-0.7789003, 0.383835, -0.1365151, 1, 1, 1, 1, 1,
-0.7717498, -0.1550193, -3.053609, 1, 1, 1, 1, 1,
-0.7706678, 0.7675672, 0.07450831, 0, 0, 1, 1, 1,
-0.7705254, 0.215686, -2.672255, 1, 0, 0, 1, 1,
-0.7679008, -1.427298, -2.779933, 1, 0, 0, 1, 1,
-0.7641975, -0.5632315, -2.325101, 1, 0, 0, 1, 1,
-0.7559192, 1.27074, -1.973998, 1, 0, 0, 1, 1,
-0.7506922, -0.4526092, -1.932996, 1, 0, 0, 1, 1,
-0.7482266, -1.270039, -1.242328, 0, 0, 0, 1, 1,
-0.744118, -0.6445351, -2.01215, 0, 0, 0, 1, 1,
-0.7380181, -1.124512, -3.879432, 0, 0, 0, 1, 1,
-0.7359695, -0.7874051, -2.06419, 0, 0, 0, 1, 1,
-0.7328179, -1.721738, -1.664953, 0, 0, 0, 1, 1,
-0.7321669, -0.1033123, -0.07549164, 0, 0, 0, 1, 1,
-0.7311628, 0.6316858, -0.2232845, 0, 0, 0, 1, 1,
-0.7280744, -1.018939, -1.609439, 1, 1, 1, 1, 1,
-0.721789, 0.6998196, 0.5633466, 1, 1, 1, 1, 1,
-0.7217848, -1.014042, -1.869091, 1, 1, 1, 1, 1,
-0.7040449, -0.08041669, 0.04744469, 1, 1, 1, 1, 1,
-0.7037666, 0.6791123, 1.276608, 1, 1, 1, 1, 1,
-0.6985833, 0.4936303, -0.04670038, 1, 1, 1, 1, 1,
-0.6930918, 0.0611096, -2.186246, 1, 1, 1, 1, 1,
-0.6855016, 0.6859949, -2.100296, 1, 1, 1, 1, 1,
-0.6844162, 1.5211, -0.6283778, 1, 1, 1, 1, 1,
-0.6837227, -0.601787, -2.480291, 1, 1, 1, 1, 1,
-0.6834556, -0.6472315, -2.072291, 1, 1, 1, 1, 1,
-0.6822574, -0.9896696, -2.809543, 1, 1, 1, 1, 1,
-0.6787913, 0.0515701, -3.952133, 1, 1, 1, 1, 1,
-0.6732551, -1.116473, -2.919022, 1, 1, 1, 1, 1,
-0.668604, -0.9224116, -2.894435, 1, 1, 1, 1, 1,
-0.6631771, 1.71888, 1.242333, 0, 0, 1, 1, 1,
-0.6551557, -0.1609344, -1.101706, 1, 0, 0, 1, 1,
-0.6432094, -0.005323911, -0.5891371, 1, 0, 0, 1, 1,
-0.6397359, -1.351916, -2.688294, 1, 0, 0, 1, 1,
-0.6396645, 0.3251087, -1.987564, 1, 0, 0, 1, 1,
-0.6291943, -0.1141617, -1.003105, 1, 0, 0, 1, 1,
-0.6262262, -0.1681343, -3.430224, 0, 0, 0, 1, 1,
-0.6224295, 0.04608887, -2.638189, 0, 0, 0, 1, 1,
-0.6130011, 0.9098576, -0.02542177, 0, 0, 0, 1, 1,
-0.607677, -0.5401222, -2.682397, 0, 0, 0, 1, 1,
-0.606094, -0.7446185, -2.911772, 0, 0, 0, 1, 1,
-0.6028735, 0.8650225, 2.346787, 0, 0, 0, 1, 1,
-0.6021658, -0.0715035, 0.8508611, 0, 0, 0, 1, 1,
-0.5991129, -0.1429975, -0.6179193, 1, 1, 1, 1, 1,
-0.5985258, -2.231362, -2.272553, 1, 1, 1, 1, 1,
-0.5976229, -0.756524, -1.978689, 1, 1, 1, 1, 1,
-0.5959686, 0.6831524, -0.6137946, 1, 1, 1, 1, 1,
-0.5954909, 0.4157847, -1.136623, 1, 1, 1, 1, 1,
-0.5952823, -0.0505774, -1.806483, 1, 1, 1, 1, 1,
-0.592779, 0.6032885, -1.58597, 1, 1, 1, 1, 1,
-0.5920004, -1.024181, -0.634336, 1, 1, 1, 1, 1,
-0.5816382, -0.9471396, -3.237214, 1, 1, 1, 1, 1,
-0.5759841, -1.400959, -2.297854, 1, 1, 1, 1, 1,
-0.5741864, -1.072271, -2.057684, 1, 1, 1, 1, 1,
-0.5650777, 2.083873, 0.0277962, 1, 1, 1, 1, 1,
-0.5635861, 1.211101, 0.960883, 1, 1, 1, 1, 1,
-0.5632405, -0.3029483, -1.630206, 1, 1, 1, 1, 1,
-0.5625239, 0.7812865, -2.174227, 1, 1, 1, 1, 1,
-0.5622473, 0.7332623, -1.035134, 0, 0, 1, 1, 1,
-0.5614983, -0.2448616, -2.469362, 1, 0, 0, 1, 1,
-0.5608238, 0.2534162, -2.237216, 1, 0, 0, 1, 1,
-0.5567799, 0.5529231, 0.07138507, 1, 0, 0, 1, 1,
-0.5517968, -0.7757363, -1.542048, 1, 0, 0, 1, 1,
-0.5497089, 0.4093089, -1.304608, 1, 0, 0, 1, 1,
-0.5490047, 0.0542096, -1.768633, 0, 0, 0, 1, 1,
-0.5445185, 0.05067001, -0.7002606, 0, 0, 0, 1, 1,
-0.544221, -2.372884, -2.353688, 0, 0, 0, 1, 1,
-0.5436584, 0.6033427, -0.4633772, 0, 0, 0, 1, 1,
-0.5429115, -1.199598, -2.369066, 0, 0, 0, 1, 1,
-0.541452, -0.3829757, -1.166646, 0, 0, 0, 1, 1,
-0.5414243, -0.6690848, -4.001438, 0, 0, 0, 1, 1,
-0.5405265, -1.080644, -1.589792, 1, 1, 1, 1, 1,
-0.5393352, 0.1934904, -1.440464, 1, 1, 1, 1, 1,
-0.5352041, 0.05171376, -2.525438, 1, 1, 1, 1, 1,
-0.5318152, 0.4289911, -0.882126, 1, 1, 1, 1, 1,
-0.528462, 0.04204331, -0.7926782, 1, 1, 1, 1, 1,
-0.5261566, -0.4802365, -1.929303, 1, 1, 1, 1, 1,
-0.5256088, 1.070857, 0.484569, 1, 1, 1, 1, 1,
-0.5215448, -0.3472812, -1.053148, 1, 1, 1, 1, 1,
-0.5203511, 1.055438, 0.1864392, 1, 1, 1, 1, 1,
-0.5184264, -0.2679483, -2.604808, 1, 1, 1, 1, 1,
-0.5178087, 1.681699, -1.319292, 1, 1, 1, 1, 1,
-0.5144033, -0.09852008, -1.939511, 1, 1, 1, 1, 1,
-0.5094371, -0.02977538, -2.471191, 1, 1, 1, 1, 1,
-0.5094137, 0.8157096, -2.514896, 1, 1, 1, 1, 1,
-0.5061936, 1.039279, -0.3979844, 1, 1, 1, 1, 1,
-0.5048085, 0.7717936, -0.1966894, 0, 0, 1, 1, 1,
-0.5041021, -1.886909, -2.588347, 1, 0, 0, 1, 1,
-0.5031089, 0.4076914, 0.1378898, 1, 0, 0, 1, 1,
-0.5026674, -0.5944778, -1.306949, 1, 0, 0, 1, 1,
-0.4962591, -0.2549644, -3.549455, 1, 0, 0, 1, 1,
-0.4934691, -0.1381799, -0.5076363, 1, 0, 0, 1, 1,
-0.4907256, -0.1838436, -2.866976, 0, 0, 0, 1, 1,
-0.4762437, -1.600038, -1.695155, 0, 0, 0, 1, 1,
-0.4708081, 0.5693072, -1.208744, 0, 0, 0, 1, 1,
-0.4658169, 1.291116, -1.588975, 0, 0, 0, 1, 1,
-0.4632368, 0.8434752, -1.435866, 0, 0, 0, 1, 1,
-0.4596175, 2.634541, 0.1282014, 0, 0, 0, 1, 1,
-0.4533903, -0.6086003, -1.783202, 0, 0, 0, 1, 1,
-0.4531206, 0.3490311, 0.3189236, 1, 1, 1, 1, 1,
-0.4530788, -0.06521241, -0.2188168, 1, 1, 1, 1, 1,
-0.4489316, -1.259238, -3.73671, 1, 1, 1, 1, 1,
-0.4479562, -0.2902798, -1.059631, 1, 1, 1, 1, 1,
-0.4479319, 0.3595016, -0.8324913, 1, 1, 1, 1, 1,
-0.4446581, 1.727068, 2.216519, 1, 1, 1, 1, 1,
-0.4334937, -0.1473918, -2.337219, 1, 1, 1, 1, 1,
-0.4310897, -0.009906488, -3.393709, 1, 1, 1, 1, 1,
-0.4235705, 1.153046, -1.472865, 1, 1, 1, 1, 1,
-0.4183664, 0.4784212, 0.003863246, 1, 1, 1, 1, 1,
-0.4179424, 1.079951, -1.44989, 1, 1, 1, 1, 1,
-0.4154723, -1.091174, -1.754342, 1, 1, 1, 1, 1,
-0.4132258, -0.956068, -1.60667, 1, 1, 1, 1, 1,
-0.4132188, 1.312311, 1.264803, 1, 1, 1, 1, 1,
-0.4081673, -1.493192, -3.540991, 1, 1, 1, 1, 1,
-0.4068091, 0.06983493, 0.3778628, 0, 0, 1, 1, 1,
-0.3882572, -0.1886247, -3.961359, 1, 0, 0, 1, 1,
-0.3847847, -1.059978, -1.154327, 1, 0, 0, 1, 1,
-0.3814233, -0.1726725, 0.1662248, 1, 0, 0, 1, 1,
-0.3775589, -0.2988915, -3.138637, 1, 0, 0, 1, 1,
-0.3755165, 0.5850518, 0.6818387, 1, 0, 0, 1, 1,
-0.3750989, -0.3766522, -3.46331, 0, 0, 0, 1, 1,
-0.3730517, -0.6348376, -2.10099, 0, 0, 0, 1, 1,
-0.3724741, -1.262657, -3.164272, 0, 0, 0, 1, 1,
-0.3710937, 0.838192, -0.5853252, 0, 0, 0, 1, 1,
-0.3704824, 1.074165, 0.1080288, 0, 0, 0, 1, 1,
-0.3701681, 0.30357, -2.497903, 0, 0, 0, 1, 1,
-0.3686258, -0.5871962, -2.644316, 0, 0, 0, 1, 1,
-0.3668056, -0.3222881, -0.872412, 1, 1, 1, 1, 1,
-0.366034, 1.605725, -0.01487122, 1, 1, 1, 1, 1,
-0.3659639, -0.4595541, -2.65524, 1, 1, 1, 1, 1,
-0.3638117, 0.6100794, 0.2792631, 1, 1, 1, 1, 1,
-0.3636252, -0.4923062, -3.961306, 1, 1, 1, 1, 1,
-0.3635294, -0.6697542, -4.266679, 1, 1, 1, 1, 1,
-0.358635, -0.2421679, -1.124599, 1, 1, 1, 1, 1,
-0.3555394, -0.8600761, -4.04024, 1, 1, 1, 1, 1,
-0.3484369, 0.2417753, -0.7477095, 1, 1, 1, 1, 1,
-0.3466071, 0.7292353, -1.784309, 1, 1, 1, 1, 1,
-0.3454003, -0.1642469, -2.778883, 1, 1, 1, 1, 1,
-0.3436855, 0.08967911, -0.9826005, 1, 1, 1, 1, 1,
-0.3431485, -0.08759762, -0.4001294, 1, 1, 1, 1, 1,
-0.3419896, -1.450892, -1.31505, 1, 1, 1, 1, 1,
-0.3377255, -1.116985, -1.891241, 1, 1, 1, 1, 1,
-0.3353426, 0.5203949, 0.6997213, 0, 0, 1, 1, 1,
-0.3311129, 0.0516357, -1.578001, 1, 0, 0, 1, 1,
-0.329218, 0.3841982, -0.5394901, 1, 0, 0, 1, 1,
-0.3284993, 0.4448254, -1.988201, 1, 0, 0, 1, 1,
-0.328224, -1.174385, -3.668529, 1, 0, 0, 1, 1,
-0.3262052, 0.1000926, -1.649931, 1, 0, 0, 1, 1,
-0.3233514, 0.8975356, -1.728496, 0, 0, 0, 1, 1,
-0.3195096, -2.677592, -3.710415, 0, 0, 0, 1, 1,
-0.318829, -0.3839549, -4.807645, 0, 0, 0, 1, 1,
-0.3179833, -0.7132471, -3.277999, 0, 0, 0, 1, 1,
-0.3073907, -0.21349, -3.212151, 0, 0, 0, 1, 1,
-0.3061997, -1.25803, -1.642886, 0, 0, 0, 1, 1,
-0.3059482, 1.579584, 0.2656947, 0, 0, 0, 1, 1,
-0.3049308, -0.3007503, -1.174641, 1, 1, 1, 1, 1,
-0.3027949, 0.6282361, -1.348915, 1, 1, 1, 1, 1,
-0.3003214, -0.562454, -2.51395, 1, 1, 1, 1, 1,
-0.2969093, -0.8338521, -3.254344, 1, 1, 1, 1, 1,
-0.2933352, 0.02950769, -0.8570127, 1, 1, 1, 1, 1,
-0.2930668, 0.222583, -0.1309419, 1, 1, 1, 1, 1,
-0.2836505, -0.7875717, -1.427679, 1, 1, 1, 1, 1,
-0.2820673, 0.711769, -0.1925832, 1, 1, 1, 1, 1,
-0.274229, -0.7346033, -2.943924, 1, 1, 1, 1, 1,
-0.2696142, 0.5215658, -1.107253, 1, 1, 1, 1, 1,
-0.264211, 1.002999, -0.5522606, 1, 1, 1, 1, 1,
-0.264165, 0.3283185, -0.8114153, 1, 1, 1, 1, 1,
-0.2603537, -0.09167334, -0.332466, 1, 1, 1, 1, 1,
-0.2578339, -0.8965631, -1.987959, 1, 1, 1, 1, 1,
-0.2523738, 0.4076802, -2.51161, 1, 1, 1, 1, 1,
-0.252238, -0.5620132, -0.7503641, 0, 0, 1, 1, 1,
-0.2521223, -1.334119, -3.458425, 1, 0, 0, 1, 1,
-0.2513596, 1.059491, 0.3100847, 1, 0, 0, 1, 1,
-0.2481773, -2.003152, -2.298749, 1, 0, 0, 1, 1,
-0.2478704, -0.3915064, -0.7240815, 1, 0, 0, 1, 1,
-0.2478151, -0.819282, -1.404373, 1, 0, 0, 1, 1,
-0.2436472, -1.14447, -1.632421, 0, 0, 0, 1, 1,
-0.2397455, 0.9710588, -0.7436671, 0, 0, 0, 1, 1,
-0.238798, -0.3123029, -2.902801, 0, 0, 0, 1, 1,
-0.235342, -0.3995012, -2.629998, 0, 0, 0, 1, 1,
-0.2343381, -0.8069068, -3.313007, 0, 0, 0, 1, 1,
-0.2323991, 1.610083, 0.4164425, 0, 0, 0, 1, 1,
-0.2321201, 0.5687982, 1.075809, 0, 0, 0, 1, 1,
-0.228567, 0.4961459, 0.6686983, 1, 1, 1, 1, 1,
-0.2237002, -0.2759081, -2.618186, 1, 1, 1, 1, 1,
-0.2235318, -1.162399, -1.558856, 1, 1, 1, 1, 1,
-0.2200491, -0.4548756, -3.293978, 1, 1, 1, 1, 1,
-0.2171298, -0.01643463, -1.219371, 1, 1, 1, 1, 1,
-0.2098218, -0.3550656, -3.300705, 1, 1, 1, 1, 1,
-0.2089986, -1.576067, -3.115962, 1, 1, 1, 1, 1,
-0.2088784, -1.889447, -5.216643, 1, 1, 1, 1, 1,
-0.2047304, -0.4762779, -2.974519, 1, 1, 1, 1, 1,
-0.2026725, 1.50262, -0.71063, 1, 1, 1, 1, 1,
-0.1912443, 0.4983278, -0.180394, 1, 1, 1, 1, 1,
-0.1851167, 1.507003, -0.7422855, 1, 1, 1, 1, 1,
-0.1788334, -0.7335035, -2.881747, 1, 1, 1, 1, 1,
-0.1724204, 0.4401585, -0.5753796, 1, 1, 1, 1, 1,
-0.1704095, 0.7973891, -0.5130007, 1, 1, 1, 1, 1,
-0.1666436, 0.6015239, -0.4580671, 0, 0, 1, 1, 1,
-0.1648708, -0.6180887, -3.182746, 1, 0, 0, 1, 1,
-0.1648252, -0.4754881, -0.8837386, 1, 0, 0, 1, 1,
-0.1614136, -1.23044, -3.016895, 1, 0, 0, 1, 1,
-0.1587877, -0.03338803, -1.621279, 1, 0, 0, 1, 1,
-0.1575261, 0.09709398, -0.9901024, 1, 0, 0, 1, 1,
-0.1550889, 1.144553, -1.254729, 0, 0, 0, 1, 1,
-0.1545341, 0.8758147, -0.5600162, 0, 0, 0, 1, 1,
-0.1539696, 0.9357578, -0.418767, 0, 0, 0, 1, 1,
-0.149528, -1.173149, -2.94043, 0, 0, 0, 1, 1,
-0.1480895, 0.0943247, -0.392796, 0, 0, 0, 1, 1,
-0.1470369, 0.4716047, -0.4368895, 0, 0, 0, 1, 1,
-0.1467867, -0.2618664, -3.439599, 0, 0, 0, 1, 1,
-0.1466527, -1.303145, -3.493536, 1, 1, 1, 1, 1,
-0.1437793, -0.5615402, -2.202746, 1, 1, 1, 1, 1,
-0.1419652, -0.3429505, -1.899442, 1, 1, 1, 1, 1,
-0.1372017, 0.5261543, -1.398652, 1, 1, 1, 1, 1,
-0.1336261, 1.06815, -1.797684, 1, 1, 1, 1, 1,
-0.132185, 0.4839254, 0.7958387, 1, 1, 1, 1, 1,
-0.1288259, -0.9095341, -4.264942, 1, 1, 1, 1, 1,
-0.1283351, 1.451775, 1.897861, 1, 1, 1, 1, 1,
-0.1282846, 0.2842869, -2.675297, 1, 1, 1, 1, 1,
-0.1272362, -1.920485, -2.969234, 1, 1, 1, 1, 1,
-0.1269262, -0.8265578, -1.20154, 1, 1, 1, 1, 1,
-0.1267502, -1.379418, -3.48071, 1, 1, 1, 1, 1,
-0.120593, -0.319446, -2.488607, 1, 1, 1, 1, 1,
-0.1103557, -1.412216, -4.59297, 1, 1, 1, 1, 1,
-0.1099131, 0.906132, -0.02671343, 1, 1, 1, 1, 1,
-0.1053891, 0.06774545, -3.320965, 0, 0, 1, 1, 1,
-0.1032075, -0.4186222, -2.299598, 1, 0, 0, 1, 1,
-0.1006045, -0.8886383, -2.400462, 1, 0, 0, 1, 1,
-0.1004281, 1.480086, -1.854175, 1, 0, 0, 1, 1,
-0.1004114, 1.148389, 0.008487454, 1, 0, 0, 1, 1,
-0.09860674, -0.3703404, -2.867156, 1, 0, 0, 1, 1,
-0.09852593, -0.1091901, -1.698526, 0, 0, 0, 1, 1,
-0.09750345, 0.1449919, 0.7775173, 0, 0, 0, 1, 1,
-0.09562802, -1.258974, -2.335625, 0, 0, 0, 1, 1,
-0.09374078, 1.041119, 1.993721, 0, 0, 0, 1, 1,
-0.09292999, -1.240106, -4.485217, 0, 0, 0, 1, 1,
-0.08733831, 0.572017, -1.396107, 0, 0, 0, 1, 1,
-0.08334557, 0.7828384, 0.1557842, 0, 0, 0, 1, 1,
-0.08302452, 0.9171669, 0.6166763, 1, 1, 1, 1, 1,
-0.0822966, 0.1581451, 1.022638, 1, 1, 1, 1, 1,
-0.07938772, 0.5392803, -0.5236514, 1, 1, 1, 1, 1,
-0.07877962, -1.622486, -1.654148, 1, 1, 1, 1, 1,
-0.07791848, -0.8154749, -2.495129, 1, 1, 1, 1, 1,
-0.07701753, -0.1418793, -1.818178, 1, 1, 1, 1, 1,
-0.07332421, -0.9213307, -4.922212, 1, 1, 1, 1, 1,
-0.07272403, -0.08218952, -3.766778, 1, 1, 1, 1, 1,
-0.07244228, -2.444582, -4.722668, 1, 1, 1, 1, 1,
-0.07135967, -0.7725514, -2.954789, 1, 1, 1, 1, 1,
-0.06705987, -0.5890956, -4.071761, 1, 1, 1, 1, 1,
-0.06677721, -0.5058855, -4.463524, 1, 1, 1, 1, 1,
-0.06572884, 1.065894, 0.05688845, 1, 1, 1, 1, 1,
-0.06529917, 0.5511512, -1.490738, 1, 1, 1, 1, 1,
-0.06256005, -0.4989879, -4.055106, 1, 1, 1, 1, 1,
-0.06156433, 1.274459, -0.7306059, 0, 0, 1, 1, 1,
-0.06067348, -1.135585, -4.325856, 1, 0, 0, 1, 1,
-0.058408, 0.1734734, -0.4261987, 1, 0, 0, 1, 1,
-0.05631855, -0.1275997, -3.323454, 1, 0, 0, 1, 1,
-0.05330237, -0.03659183, -1.889712, 1, 0, 0, 1, 1,
-0.05224801, -1.186929, -3.509889, 1, 0, 0, 1, 1,
-0.05178178, 0.3539791, 2.211852, 0, 0, 0, 1, 1,
-0.05139014, 1.711146, 0.2284385, 0, 0, 0, 1, 1,
-0.05063125, -1.663405, -3.154867, 0, 0, 0, 1, 1,
-0.04490257, -1.019278, -3.480698, 0, 0, 0, 1, 1,
-0.04418738, -0.3509023, -1.822716, 0, 0, 0, 1, 1,
-0.04400668, -0.3949085, -0.8828792, 0, 0, 0, 1, 1,
-0.04068768, 1.451521, 0.882046, 0, 0, 0, 1, 1,
-0.04032356, -0.6340255, -3.867746, 1, 1, 1, 1, 1,
-0.03822543, -0.3870279, -2.717236, 1, 1, 1, 1, 1,
-0.03782777, -0.3196422, -3.424651, 1, 1, 1, 1, 1,
-0.03502149, -0.5483492, -1.725097, 1, 1, 1, 1, 1,
-0.03262891, -0.02895305, -3.590872, 1, 1, 1, 1, 1,
-0.02778993, 0.9884152, -1.334772, 1, 1, 1, 1, 1,
-0.02765977, 0.1709599, -0.4399084, 1, 1, 1, 1, 1,
-0.02551848, -2.026446, -1.510002, 1, 1, 1, 1, 1,
-0.02242766, 1.445264, 1.039349, 1, 1, 1, 1, 1,
-0.02061376, 0.659532, -0.8837175, 1, 1, 1, 1, 1,
-0.0205308, 0.3852383, -0.3679516, 1, 1, 1, 1, 1,
-0.01809163, 1.270686, -1.172438, 1, 1, 1, 1, 1,
-0.01221377, -1.591052, -1.69042, 1, 1, 1, 1, 1,
-0.01127313, 0.06509553, -2.072307, 1, 1, 1, 1, 1,
-0.01096978, 0.8050022, -0.7289221, 1, 1, 1, 1, 1,
-0.01059563, -0.1480453, -0.6431579, 0, 0, 1, 1, 1,
-0.004065391, 1.543625, 0.6284015, 1, 0, 0, 1, 1,
-0.001955662, 2.363017, 0.3101069, 1, 0, 0, 1, 1,
0.003234823, -0.2927094, 3.643512, 1, 0, 0, 1, 1,
0.005156042, 0.8414561, -1.318901, 1, 0, 0, 1, 1,
0.006678231, -1.444584, 3.688354, 1, 0, 0, 1, 1,
0.009389071, 0.205347, 0.8859377, 0, 0, 0, 1, 1,
0.01038189, -0.4882638, 3.460741, 0, 0, 0, 1, 1,
0.01283888, -1.063115, 2.040176, 0, 0, 0, 1, 1,
0.01426864, -0.8925751, 2.027879, 0, 0, 0, 1, 1,
0.01815319, -0.1158179, 2.407286, 0, 0, 0, 1, 1,
0.02095128, 1.483078, -0.435057, 0, 0, 0, 1, 1,
0.02169856, -0.2890928, 4.149069, 0, 0, 0, 1, 1,
0.02646655, -0.1517035, 3.241037, 1, 1, 1, 1, 1,
0.03525918, -0.8232528, 0.4068302, 1, 1, 1, 1, 1,
0.03924618, 1.680761, 1.997419, 1, 1, 1, 1, 1,
0.04013591, 1.628897, -0.6111289, 1, 1, 1, 1, 1,
0.04195758, 1.436389, 1.215243, 1, 1, 1, 1, 1,
0.04253525, -0.3636474, 3.776143, 1, 1, 1, 1, 1,
0.04949342, 0.5208214, -0.3227948, 1, 1, 1, 1, 1,
0.04976539, -0.8580308, 1.530548, 1, 1, 1, 1, 1,
0.0534515, -0.4789903, 3.823423, 1, 1, 1, 1, 1,
0.05516648, 0.563552, -2.828883, 1, 1, 1, 1, 1,
0.06181224, 0.8040026, 1.329956, 1, 1, 1, 1, 1,
0.06457629, 2.078476, -0.6922137, 1, 1, 1, 1, 1,
0.06896414, 0.2212459, 1.647403, 1, 1, 1, 1, 1,
0.08126067, -0.09397282, 3.807606, 1, 1, 1, 1, 1,
0.08229741, -1.523062, 3.256742, 1, 1, 1, 1, 1,
0.08516122, -2.327184, 3.619383, 0, 0, 1, 1, 1,
0.08621936, 0.7214804, -0.0335683, 1, 0, 0, 1, 1,
0.09008239, -1.269186, 3.257354, 1, 0, 0, 1, 1,
0.09063467, -0.05756202, 1.302087, 1, 0, 0, 1, 1,
0.09393858, -0.1070247, 3.116878, 1, 0, 0, 1, 1,
0.09417302, -1.636662, 4.855625, 1, 0, 0, 1, 1,
0.0959454, -1.560292, 2.475603, 0, 0, 0, 1, 1,
0.09596963, 2.062642, 1.304588, 0, 0, 0, 1, 1,
0.1013002, 0.6175115, -0.1035393, 0, 0, 0, 1, 1,
0.1031607, -1.878175, 3.149146, 0, 0, 0, 1, 1,
0.1031911, 0.1163898, 1.51533, 0, 0, 0, 1, 1,
0.1178371, 1.065515, -1.994827, 0, 0, 0, 1, 1,
0.1216564, -0.1698258, 3.877056, 0, 0, 0, 1, 1,
0.1223108, -0.6813834, 2.141943, 1, 1, 1, 1, 1,
0.1247839, -0.894972, 3.359293, 1, 1, 1, 1, 1,
0.1355703, -0.860374, 3.296239, 1, 1, 1, 1, 1,
0.1412907, 0.191767, -0.1034504, 1, 1, 1, 1, 1,
0.1428645, 0.8173249, -0.165486, 1, 1, 1, 1, 1,
0.1441482, -2.116704, 1.930175, 1, 1, 1, 1, 1,
0.1454128, 1.228859, 0.2965434, 1, 1, 1, 1, 1,
0.1454738, -0.1593912, 1.235137, 1, 1, 1, 1, 1,
0.1455201, -2.794991, 2.076959, 1, 1, 1, 1, 1,
0.1486011, 0.666055, 0.4461699, 1, 1, 1, 1, 1,
0.1505536, -0.2624045, 1.495257, 1, 1, 1, 1, 1,
0.1524014, -1.701145, 3.475591, 1, 1, 1, 1, 1,
0.1593778, 0.779317, -1.127555, 1, 1, 1, 1, 1,
0.1598815, -0.7721018, 1.23961, 1, 1, 1, 1, 1,
0.1632214, 0.6026081, -0.251404, 1, 1, 1, 1, 1,
0.1644847, 0.2484012, -0.5232319, 0, 0, 1, 1, 1,
0.1655157, 0.7950747, -2.073172, 1, 0, 0, 1, 1,
0.1718721, -0.1189898, 1.612128, 1, 0, 0, 1, 1,
0.172077, 1.87606, 0.6669912, 1, 0, 0, 1, 1,
0.1781388, 2.02835, -0.2665281, 1, 0, 0, 1, 1,
0.1782721, 0.7047818, 1.664225, 1, 0, 0, 1, 1,
0.1821467, -1.252067, 3.541367, 0, 0, 0, 1, 1,
0.1857509, -0.772186, 1.747386, 0, 0, 0, 1, 1,
0.1919727, -1.621513, 3.028633, 0, 0, 0, 1, 1,
0.196851, 1.625994, 0.07214196, 0, 0, 0, 1, 1,
0.1989283, 0.6725649, 0.1877443, 0, 0, 0, 1, 1,
0.1989603, -0.7008556, 3.249629, 0, 0, 0, 1, 1,
0.2025484, 0.48003, 0.3754297, 0, 0, 0, 1, 1,
0.2051467, -0.2265451, 3.388272, 1, 1, 1, 1, 1,
0.2137044, 1.620714, -0.1505526, 1, 1, 1, 1, 1,
0.2143387, -1.403885, 2.098811, 1, 1, 1, 1, 1,
0.2152245, -0.05963958, 2.971255, 1, 1, 1, 1, 1,
0.2173857, -0.2667881, 1.57401, 1, 1, 1, 1, 1,
0.2210957, -0.1302176, 2.369903, 1, 1, 1, 1, 1,
0.2223549, 1.459643, 0.1555466, 1, 1, 1, 1, 1,
0.2321982, 0.3266201, -0.1745556, 1, 1, 1, 1, 1,
0.2326156, -0.4617928, 3.21521, 1, 1, 1, 1, 1,
0.2331427, -0.4813997, 1.584465, 1, 1, 1, 1, 1,
0.2347295, -1.542903, 3.100857, 1, 1, 1, 1, 1,
0.2417276, 0.5783429, 0.2061633, 1, 1, 1, 1, 1,
0.2428796, -0.8969918, 3.423792, 1, 1, 1, 1, 1,
0.2557451, 2.204013, 0.1729725, 1, 1, 1, 1, 1,
0.2575035, -0.06394425, 1.967498, 1, 1, 1, 1, 1,
0.2585706, -0.8441478, 3.910279, 0, 0, 1, 1, 1,
0.2637902, -0.2640169, 2.302305, 1, 0, 0, 1, 1,
0.2662375, 2.305957, -0.7632682, 1, 0, 0, 1, 1,
0.2691514, 0.5679023, 0.8184517, 1, 0, 0, 1, 1,
0.2709048, 0.9170649, 0.5484519, 1, 0, 0, 1, 1,
0.2764712, 0.2099744, 0.739434, 1, 0, 0, 1, 1,
0.2806336, -0.9038102, 0.4203841, 0, 0, 0, 1, 1,
0.2816178, -1.060022, 2.475918, 0, 0, 0, 1, 1,
0.2911679, -0.7467455, 0.9732416, 0, 0, 0, 1, 1,
0.2926899, 1.594512, 0.4641411, 0, 0, 0, 1, 1,
0.2965259, 0.09727906, 1.006811, 0, 0, 0, 1, 1,
0.297436, -0.8089337, 1.003936, 0, 0, 0, 1, 1,
0.2987411, 0.1943942, 0.7075517, 0, 0, 0, 1, 1,
0.3001253, 0.3425457, 1.52442, 1, 1, 1, 1, 1,
0.3025473, -0.6012843, 1.668045, 1, 1, 1, 1, 1,
0.3059031, 0.1492794, 1.108832, 1, 1, 1, 1, 1,
0.3085811, 1.031876, 2.014936, 1, 1, 1, 1, 1,
0.3175611, -1.564874, 2.531508, 1, 1, 1, 1, 1,
0.3208339, -2.270952, 2.976152, 1, 1, 1, 1, 1,
0.3262028, 0.4222114, -0.67162, 1, 1, 1, 1, 1,
0.330618, -1.645592, 4.053165, 1, 1, 1, 1, 1,
0.3307907, 0.08246534, 0.9418572, 1, 1, 1, 1, 1,
0.3329165, -0.1237906, 2.686581, 1, 1, 1, 1, 1,
0.3369907, -0.8134867, 2.824414, 1, 1, 1, 1, 1,
0.3374047, -0.3603776, 1.279543, 1, 1, 1, 1, 1,
0.3395781, 1.048736, 0.7664337, 1, 1, 1, 1, 1,
0.3442327, -0.2049746, 0.9030375, 1, 1, 1, 1, 1,
0.3477074, 0.7981631, -1.654992, 1, 1, 1, 1, 1,
0.3542761, 1.704548, -0.6412922, 0, 0, 1, 1, 1,
0.3604992, -0.4551802, 4.0491, 1, 0, 0, 1, 1,
0.3617807, -0.6959617, 2.881655, 1, 0, 0, 1, 1,
0.3649276, -0.7956466, 2.675211, 1, 0, 0, 1, 1,
0.3658718, 0.06076218, -0.1204828, 1, 0, 0, 1, 1,
0.3664143, -2.687357, 3.922621, 1, 0, 0, 1, 1,
0.369151, 0.03086506, -0.3168532, 0, 0, 0, 1, 1,
0.3693098, 1.195229, 2.105202, 0, 0, 0, 1, 1,
0.376876, -0.08509687, 2.646501, 0, 0, 0, 1, 1,
0.3799389, -0.6187204, 2.793342, 0, 0, 0, 1, 1,
0.3851177, 0.5994481, 0.1266036, 0, 0, 0, 1, 1,
0.3895833, -0.3245904, 3.494988, 0, 0, 0, 1, 1,
0.3940094, 0.1614869, 0.4117045, 0, 0, 0, 1, 1,
0.3973751, 0.3518829, 0.5982007, 1, 1, 1, 1, 1,
0.3977157, -0.4984018, 2.924212, 1, 1, 1, 1, 1,
0.3983009, -1.262328, 3.14474, 1, 1, 1, 1, 1,
0.3984417, 0.8456242, -0.05327974, 1, 1, 1, 1, 1,
0.4072212, 1.214703, 1.374667, 1, 1, 1, 1, 1,
0.4082716, -0.9261712, 4.109299, 1, 1, 1, 1, 1,
0.4099849, 1.193558, 0.250274, 1, 1, 1, 1, 1,
0.4121401, 0.9451895, -1.861211, 1, 1, 1, 1, 1,
0.415992, -0.3879639, 3.568138, 1, 1, 1, 1, 1,
0.4187958, 0.2132253, 1.495883, 1, 1, 1, 1, 1,
0.4188568, 0.166784, 2.256701, 1, 1, 1, 1, 1,
0.4203422, 0.2963671, 0.3927294, 1, 1, 1, 1, 1,
0.4204305, 0.04119241, 2.047746, 1, 1, 1, 1, 1,
0.4211242, 0.7605953, 1.827199, 1, 1, 1, 1, 1,
0.4219047, -0.4669208, 3.400172, 1, 1, 1, 1, 1,
0.4261517, -0.4455723, 2.866059, 0, 0, 1, 1, 1,
0.4326094, 0.1725319, 1.437116, 1, 0, 0, 1, 1,
0.4340331, -1.596609, 2.259318, 1, 0, 0, 1, 1,
0.4402438, 0.1232766, 1.97856, 1, 0, 0, 1, 1,
0.4497557, -0.07858378, 2.561662, 1, 0, 0, 1, 1,
0.4516169, -0.9260006, 1.913417, 1, 0, 0, 1, 1,
0.4518667, 0.7868365, -0.02141812, 0, 0, 0, 1, 1,
0.4524786, -1.276585, 2.553663, 0, 0, 0, 1, 1,
0.4530963, -0.2106518, 1.245534, 0, 0, 0, 1, 1,
0.4531944, -0.9775913, 2.643937, 0, 0, 0, 1, 1,
0.4540572, 1.544636, 0.06790467, 0, 0, 0, 1, 1,
0.4558889, 1.421414, 0.09240157, 0, 0, 0, 1, 1,
0.4601115, 0.3197253, 2.432028, 0, 0, 0, 1, 1,
0.4672461, -1.058507, 2.392672, 1, 1, 1, 1, 1,
0.468906, -1.171744, 3.02721, 1, 1, 1, 1, 1,
0.4702905, -0.5378164, 1.136208, 1, 1, 1, 1, 1,
0.4711263, 1.539554, 0.009389577, 1, 1, 1, 1, 1,
0.4711976, 0.07428728, 1.140677, 1, 1, 1, 1, 1,
0.4830107, -0.8842223, 3.599265, 1, 1, 1, 1, 1,
0.4876278, -0.8189631, 2.970159, 1, 1, 1, 1, 1,
0.4901758, 1.281241, 0.4361187, 1, 1, 1, 1, 1,
0.4904267, 1.504381, -0.2595824, 1, 1, 1, 1, 1,
0.4915595, -0.6256058, 3.618615, 1, 1, 1, 1, 1,
0.5008523, -1.327193, 1.725433, 1, 1, 1, 1, 1,
0.5008664, -1.412729, 3.997958, 1, 1, 1, 1, 1,
0.5013243, 0.7064047, 0.736977, 1, 1, 1, 1, 1,
0.5079193, -1.075626, 2.175862, 1, 1, 1, 1, 1,
0.5081801, -0.4452549, 1.919273, 1, 1, 1, 1, 1,
0.5091317, 1.518988, 0.111801, 0, 0, 1, 1, 1,
0.5094075, 0.5639536, 1.692141, 1, 0, 0, 1, 1,
0.5115125, -0.1465221, 1.090501, 1, 0, 0, 1, 1,
0.5127429, -1.352548, 2.160224, 1, 0, 0, 1, 1,
0.5128836, -0.9652837, 2.729355, 1, 0, 0, 1, 1,
0.5136974, 0.4342497, 0.5653565, 1, 0, 0, 1, 1,
0.5139529, -0.1050987, 2.801777, 0, 0, 0, 1, 1,
0.5140542, 0.6067671, 1.161615, 0, 0, 0, 1, 1,
0.5201191, -0.04695756, 1.950028, 0, 0, 0, 1, 1,
0.5204001, 0.9965171, 1.209016, 0, 0, 0, 1, 1,
0.525446, -0.5898959, 0.6373351, 0, 0, 0, 1, 1,
0.5268875, 0.1947844, 1.292003, 0, 0, 0, 1, 1,
0.5291156, 0.1129696, 1.924991, 0, 0, 0, 1, 1,
0.5337408, 0.3452793, 1.601856, 1, 1, 1, 1, 1,
0.5367441, 1.151117, -0.2468243, 1, 1, 1, 1, 1,
0.5418245, -1.414589, 3.536332, 1, 1, 1, 1, 1,
0.5428317, 0.2920138, 0.8701641, 1, 1, 1, 1, 1,
0.545393, 0.1022284, -0.4175907, 1, 1, 1, 1, 1,
0.5467265, 0.6124161, 0.7017157, 1, 1, 1, 1, 1,
0.552174, -0.2516107, 1.984726, 1, 1, 1, 1, 1,
0.5525002, -0.5983166, 1.780183, 1, 1, 1, 1, 1,
0.5633144, -1.90626, 2.716334, 1, 1, 1, 1, 1,
0.563836, 0.5597435, 0.08108342, 1, 1, 1, 1, 1,
0.5681884, 0.6495648, 0.2968245, 1, 1, 1, 1, 1,
0.5733522, 0.4721903, 0.1429691, 1, 1, 1, 1, 1,
0.5736378, -0.1708818, -0.2990213, 1, 1, 1, 1, 1,
0.5751909, -0.4419628, 3.672591, 1, 1, 1, 1, 1,
0.5754464, 0.7295557, -0.8631569, 1, 1, 1, 1, 1,
0.5844425, -1.216677, 1.882728, 0, 0, 1, 1, 1,
0.5862883, 0.6951983, -0.147607, 1, 0, 0, 1, 1,
0.5866956, -0.1383661, 3.064314, 1, 0, 0, 1, 1,
0.5874042, 0.1416935, 1.348187, 1, 0, 0, 1, 1,
0.5874864, -2.988256, 2.338231, 1, 0, 0, 1, 1,
0.5936635, 0.9999413, 1.202618, 1, 0, 0, 1, 1,
0.5937326, 0.07026805, 2.500958, 0, 0, 0, 1, 1,
0.5970806, -0.2451628, 0.9288726, 0, 0, 0, 1, 1,
0.5996485, 1.562176, 0.8385245, 0, 0, 0, 1, 1,
0.6023216, -0.8584623, 1.763471, 0, 0, 0, 1, 1,
0.6045613, 0.6931062, 1.198106, 0, 0, 0, 1, 1,
0.6053085, 0.4066637, 0.8599305, 0, 0, 0, 1, 1,
0.6161979, 0.3332434, -0.2624001, 0, 0, 0, 1, 1,
0.6171361, 0.07589291, 1.344499, 1, 1, 1, 1, 1,
0.6182197, 1.075094, -1.623193, 1, 1, 1, 1, 1,
0.6196465, -1.166042, 0.3018132, 1, 1, 1, 1, 1,
0.6244677, -0.3224243, 1.398211, 1, 1, 1, 1, 1,
0.6319091, 1.015594, 0.06346965, 1, 1, 1, 1, 1,
0.6319277, 0.2516401, 0.003617485, 1, 1, 1, 1, 1,
0.6335344, 0.3299102, -0.9242156, 1, 1, 1, 1, 1,
0.6364377, -0.8461679, 0.6180593, 1, 1, 1, 1, 1,
0.6471341, 0.05498503, 0.9466227, 1, 1, 1, 1, 1,
0.6575027, 0.8737178, -0.5825279, 1, 1, 1, 1, 1,
0.6584575, 1.534961, -0.7635281, 1, 1, 1, 1, 1,
0.658891, 0.4487566, 1.029711, 1, 1, 1, 1, 1,
0.6616489, 0.8932282, -0.3811439, 1, 1, 1, 1, 1,
0.6625323, 0.8934479, 0.5641437, 1, 1, 1, 1, 1,
0.6630841, -0.6414587, 2.249028, 1, 1, 1, 1, 1,
0.6641473, -0.0339746, 0.4192165, 0, 0, 1, 1, 1,
0.6662046, -0.05114197, 1.14935, 1, 0, 0, 1, 1,
0.6701708, 1.817628, 0.5414217, 1, 0, 0, 1, 1,
0.6765558, 1.924358, 0.4407718, 1, 0, 0, 1, 1,
0.6778613, -0.2362782, 3.948939, 1, 0, 0, 1, 1,
0.6835241, 0.588457, 0.0424402, 1, 0, 0, 1, 1,
0.684159, 0.1669689, 0.9180396, 0, 0, 0, 1, 1,
0.6880448, 0.4259544, 2.345599, 0, 0, 0, 1, 1,
0.6902369, 0.3826131, 0.1592512, 0, 0, 0, 1, 1,
0.6936918, -0.152669, 0.7112994, 0, 0, 0, 1, 1,
0.6944026, 0.4288425, 1.657882, 0, 0, 0, 1, 1,
0.6954163, 2.01805, -0.1792736, 0, 0, 0, 1, 1,
0.6962695, -0.5106683, 2.724485, 0, 0, 0, 1, 1,
0.7018323, 0.003186742, 2.771472, 1, 1, 1, 1, 1,
0.7073913, -0.1546281, 2.036791, 1, 1, 1, 1, 1,
0.7094766, -1.060011, 2.633621, 1, 1, 1, 1, 1,
0.7166145, -1.43414, 3.116436, 1, 1, 1, 1, 1,
0.7262305, 0.9444917, 1.323747, 1, 1, 1, 1, 1,
0.7359792, 0.4148169, 2.101804, 1, 1, 1, 1, 1,
0.7402045, -0.5468776, 2.185648, 1, 1, 1, 1, 1,
0.7444097, -1.001617, 3.704576, 1, 1, 1, 1, 1,
0.7455747, -0.5398191, 1.221625, 1, 1, 1, 1, 1,
0.7480761, 0.7113924, -0.3203546, 1, 1, 1, 1, 1,
0.7485449, -1.860767, 5.278071, 1, 1, 1, 1, 1,
0.7525615, 0.5782546, 0.72518, 1, 1, 1, 1, 1,
0.754015, 1.816924, 0.5496432, 1, 1, 1, 1, 1,
0.7616662, -1.376707, 2.34456, 1, 1, 1, 1, 1,
0.7632125, 1.319086, 0.3757353, 1, 1, 1, 1, 1,
0.7714197, -0.208092, 2.081425, 0, 0, 1, 1, 1,
0.7750074, 0.6561089, 1.389977, 1, 0, 0, 1, 1,
0.7891377, 0.07695838, 3.227754, 1, 0, 0, 1, 1,
0.7951831, -1.631099, 2.672473, 1, 0, 0, 1, 1,
0.7977428, -2.292249, 2.670001, 1, 0, 0, 1, 1,
0.8030727, 0.3345182, 0.7885898, 1, 0, 0, 1, 1,
0.8042608, -0.8308813, 2.627826, 0, 0, 0, 1, 1,
0.8087026, -0.7313497, 1.235039, 0, 0, 0, 1, 1,
0.8103658, 0.03825717, 3.026728, 0, 0, 0, 1, 1,
0.8122655, 0.04747159, 1.37348, 0, 0, 0, 1, 1,
0.8155198, -0.21804, 0.2827059, 0, 0, 0, 1, 1,
0.8162251, -0.713945, 1.118394, 0, 0, 0, 1, 1,
0.8171663, -0.382321, 2.30389, 0, 0, 0, 1, 1,
0.8193843, 2.195006, 0.3057726, 1, 1, 1, 1, 1,
0.819792, 0.2301657, 1.446076, 1, 1, 1, 1, 1,
0.8198071, 0.1736428, 0.8944079, 1, 1, 1, 1, 1,
0.8210422, -2.178981, 2.925719, 1, 1, 1, 1, 1,
0.8227483, 0.1672347, 0.7922001, 1, 1, 1, 1, 1,
0.825887, 0.7510512, -0.1614504, 1, 1, 1, 1, 1,
0.8262969, -2.661844, 1.980068, 1, 1, 1, 1, 1,
0.8293127, -1.715239, 2.555833, 1, 1, 1, 1, 1,
0.8299434, 0.377738, 1.398867, 1, 1, 1, 1, 1,
0.8315493, 0.9757442, 2.235744, 1, 1, 1, 1, 1,
0.8387184, 2.076341, 0.6574005, 1, 1, 1, 1, 1,
0.8408908, -1.473023, 3.180431, 1, 1, 1, 1, 1,
0.851433, -0.9134983, 2.211307, 1, 1, 1, 1, 1,
0.8606476, -0.9756781, 3.929952, 1, 1, 1, 1, 1,
0.8620439, -0.9753762, 1.701923, 1, 1, 1, 1, 1,
0.8625093, -0.3645604, 1.92803, 0, 0, 1, 1, 1,
0.8657734, 1.708486, -0.5822382, 1, 0, 0, 1, 1,
0.8675821, -0.09626728, 1.573727, 1, 0, 0, 1, 1,
0.8713011, 0.6573953, 0.7519254, 1, 0, 0, 1, 1,
0.8721457, -0.2747497, 2.237043, 1, 0, 0, 1, 1,
0.8790037, -0.8106839, 1.726956, 1, 0, 0, 1, 1,
0.8790297, -0.3529138, 3.779337, 0, 0, 0, 1, 1,
0.8794602, 1.229023, 1.131943, 0, 0, 0, 1, 1,
0.8821244, -1.70219, 4.228509, 0, 0, 0, 1, 1,
0.8856629, -0.7096122, 1.967762, 0, 0, 0, 1, 1,
0.8908196, 1.71439, -0.8707619, 0, 0, 0, 1, 1,
0.9074176, 0.6309995, 2.043802, 0, 0, 0, 1, 1,
0.9137307, 0.9853449, 1.060439, 0, 0, 0, 1, 1,
0.9138269, -0.856604, 1.56469, 1, 1, 1, 1, 1,
0.9156908, -0.5977097, 1.887042, 1, 1, 1, 1, 1,
0.916346, -0.05772986, 1.485114, 1, 1, 1, 1, 1,
0.9168524, 1.03066, -0.4155071, 1, 1, 1, 1, 1,
0.9198418, -0.1561838, 0.8697392, 1, 1, 1, 1, 1,
0.9208313, 1.133227, 1.869238, 1, 1, 1, 1, 1,
0.9217681, 1.311297, -0.8655087, 1, 1, 1, 1, 1,
0.9219367, -0.1392225, 2.953383, 1, 1, 1, 1, 1,
0.9268933, 0.09026788, 0.1425777, 1, 1, 1, 1, 1,
0.9314088, 1.009263, -0.1551554, 1, 1, 1, 1, 1,
0.9356522, -0.4862124, 2.643112, 1, 1, 1, 1, 1,
0.9414344, 0.6068836, 3.23525, 1, 1, 1, 1, 1,
0.9414922, 1.153338, 0.2958687, 1, 1, 1, 1, 1,
0.9426581, 1.169028, 1.730719, 1, 1, 1, 1, 1,
0.9493418, -0.4754077, 1.122815, 1, 1, 1, 1, 1,
0.9558473, 1.992433, 1.573671, 0, 0, 1, 1, 1,
0.9578396, 1.117922, 0.6441234, 1, 0, 0, 1, 1,
0.9640082, 0.1147167, 4.042008, 1, 0, 0, 1, 1,
0.9711439, -0.3111545, 2.054549, 1, 0, 0, 1, 1,
0.9748105, 1.463464, 1.963225, 1, 0, 0, 1, 1,
0.9749805, -0.8923891, 1.031704, 1, 0, 0, 1, 1,
0.9777557, -0.8570176, 1.995529, 0, 0, 0, 1, 1,
0.9807571, 0.007548507, 1.825658, 0, 0, 0, 1, 1,
0.9841586, 0.6870595, 1.544766, 0, 0, 0, 1, 1,
0.9868497, 0.6509729, 0.3153046, 0, 0, 0, 1, 1,
0.9884809, -0.5957536, 1.162833, 0, 0, 0, 1, 1,
0.9966225, -1.649647, 0.9381056, 0, 0, 0, 1, 1,
0.9990234, -1.515987, 1.04302, 0, 0, 0, 1, 1,
0.999209, -0.8889616, 1.201445, 1, 1, 1, 1, 1,
1.007986, 0.809148, 1.839819, 1, 1, 1, 1, 1,
1.008182, -1.205987, 2.54036, 1, 1, 1, 1, 1,
1.021033, -0.4932809, 1.950226, 1, 1, 1, 1, 1,
1.026745, 1.365776, 2.710541, 1, 1, 1, 1, 1,
1.035441, 0.1119114, 0.7356181, 1, 1, 1, 1, 1,
1.03872, -0.2398194, 2.798799, 1, 1, 1, 1, 1,
1.040594, -0.947294, 2.106555, 1, 1, 1, 1, 1,
1.048875, -0.3353357, 0.909289, 1, 1, 1, 1, 1,
1.050154, 2.517587, 0.1605675, 1, 1, 1, 1, 1,
1.059064, -1.054798, 1.488601, 1, 1, 1, 1, 1,
1.059617, -1.504781, 1.771273, 1, 1, 1, 1, 1,
1.072003, -0.6915383, 2.582609, 1, 1, 1, 1, 1,
1.074444, 1.052272, 1.459312, 1, 1, 1, 1, 1,
1.075467, -0.2185238, 1.148685, 1, 1, 1, 1, 1,
1.077989, 0.02895864, 2.227383, 0, 0, 1, 1, 1,
1.078788, 1.296531, 0.2875323, 1, 0, 0, 1, 1,
1.081127, -0.5822074, 1.623655, 1, 0, 0, 1, 1,
1.084972, 2.04319, 0.2751388, 1, 0, 0, 1, 1,
1.085999, -0.4337583, 1.856357, 1, 0, 0, 1, 1,
1.086248, -0.4246844, 2.633307, 1, 0, 0, 1, 1,
1.09009, -0.6861947, 2.047587, 0, 0, 0, 1, 1,
1.093836, -1.807732, 1.936638, 0, 0, 0, 1, 1,
1.097703, 0.4338571, 2.326643, 0, 0, 0, 1, 1,
1.100313, 0.1114126, 1.396853, 0, 0, 0, 1, 1,
1.102672, 0.3641088, 1.365129, 0, 0, 0, 1, 1,
1.112604, 0.2096291, -0.725457, 0, 0, 0, 1, 1,
1.114707, -0.2575161, 2.21688, 0, 0, 0, 1, 1,
1.119925, -0.6692656, 1.053549, 1, 1, 1, 1, 1,
1.123787, -0.8540378, 3.136645, 1, 1, 1, 1, 1,
1.149487, 0.9560408, -0.426838, 1, 1, 1, 1, 1,
1.161964, -0.5919018, 2.832822, 1, 1, 1, 1, 1,
1.163666, -0.06959166, 1.111365, 1, 1, 1, 1, 1,
1.173251, 0.793489, 0.2995222, 1, 1, 1, 1, 1,
1.173543, -0.1770327, 1.367193, 1, 1, 1, 1, 1,
1.17459, -2.630728, 4.008249, 1, 1, 1, 1, 1,
1.17939, -0.9927274, 2.482663, 1, 1, 1, 1, 1,
1.182372, -0.04051074, 2.933027, 1, 1, 1, 1, 1,
1.195294, 0.1579511, -0.391965, 1, 1, 1, 1, 1,
1.214677, 2.246268, 3.505208, 1, 1, 1, 1, 1,
1.227048, 0.1570116, 1.0583, 1, 1, 1, 1, 1,
1.227401, 0.4211324, 1.806614, 1, 1, 1, 1, 1,
1.23645, -1.03639, 1.868501, 1, 1, 1, 1, 1,
1.238766, 0.4434983, 0.7171898, 0, 0, 1, 1, 1,
1.253694, -1.182584, 2.352833, 1, 0, 0, 1, 1,
1.254861, -2.077835, 3.182005, 1, 0, 0, 1, 1,
1.275816, -0.3628087, 1.993902, 1, 0, 0, 1, 1,
1.292021, 0.2072275, 1.755414, 1, 0, 0, 1, 1,
1.299457, 0.4530759, 0.4208788, 1, 0, 0, 1, 1,
1.299601, 0.797762, 1.229088, 0, 0, 0, 1, 1,
1.300053, -1.472714, 2.881121, 0, 0, 0, 1, 1,
1.303139, -1.467328, 3.350305, 0, 0, 0, 1, 1,
1.304898, 0.8214678, 1.533287, 0, 0, 0, 1, 1,
1.305076, -0.8705065, 2.410609, 0, 0, 0, 1, 1,
1.314789, 0.0245821, -0.03488846, 0, 0, 0, 1, 1,
1.315218, -0.3538721, 1.172704, 0, 0, 0, 1, 1,
1.316066, -0.8738115, 3.718573, 1, 1, 1, 1, 1,
1.323507, 0.3335614, 2.182101, 1, 1, 1, 1, 1,
1.324834, -0.1512631, 1.515281, 1, 1, 1, 1, 1,
1.349458, -0.1241399, 1.422155, 1, 1, 1, 1, 1,
1.349697, -0.05936714, 1.59912, 1, 1, 1, 1, 1,
1.355539, 0.1344987, 0.8804997, 1, 1, 1, 1, 1,
1.355911, 1.409317, 0.1113595, 1, 1, 1, 1, 1,
1.357575, 0.6749091, 2.180471, 1, 1, 1, 1, 1,
1.367414, 2.338887, 0.5167064, 1, 1, 1, 1, 1,
1.381334, 1.953312, 1.031695, 1, 1, 1, 1, 1,
1.387577, -0.2533597, 2.881319, 1, 1, 1, 1, 1,
1.401885, -0.0764125, 1.136197, 1, 1, 1, 1, 1,
1.405894, 0.3745101, 3.081283, 1, 1, 1, 1, 1,
1.407427, -0.3790516, 1.469011, 1, 1, 1, 1, 1,
1.416175, -1.160843, 2.095746, 1, 1, 1, 1, 1,
1.424539, 0.04203482, 0.9717573, 0, 0, 1, 1, 1,
1.432152, 1.339309, 1.468781, 1, 0, 0, 1, 1,
1.451255, -0.5496695, 2.243812, 1, 0, 0, 1, 1,
1.459561, 0.2635439, 1.482989, 1, 0, 0, 1, 1,
1.474125, 0.3418604, 2.013583, 1, 0, 0, 1, 1,
1.493708, 0.8971172, 1.567762, 1, 0, 0, 1, 1,
1.501083, -1.197634, 1.125476, 0, 0, 0, 1, 1,
1.501274, 0.2590646, 0.9480945, 0, 0, 0, 1, 1,
1.524897, -1.685848, 3.223494, 0, 0, 0, 1, 1,
1.557634, 0.5425947, 0.1946884, 0, 0, 0, 1, 1,
1.571173, 0.2129596, -0.3124827, 0, 0, 0, 1, 1,
1.573416, 0.04718871, 2.621101, 0, 0, 0, 1, 1,
1.576084, -0.5894945, 2.138324, 0, 0, 0, 1, 1,
1.576122, 0.2739564, 1.917202, 1, 1, 1, 1, 1,
1.577306, 0.2480014, 1.670853, 1, 1, 1, 1, 1,
1.589278, -1.054669, 1.205591, 1, 1, 1, 1, 1,
1.594599, -0.8763086, 1.478421, 1, 1, 1, 1, 1,
1.597654, 0.2559421, 1.635402, 1, 1, 1, 1, 1,
1.606176, -1.107422, 1.847575, 1, 1, 1, 1, 1,
1.607308, 0.846473, 1.927377, 1, 1, 1, 1, 1,
1.648926, -0.4436979, 4.359812, 1, 1, 1, 1, 1,
1.664922, -0.9433712, 0.9074045, 1, 1, 1, 1, 1,
1.665798, -0.8752019, 3.615436, 1, 1, 1, 1, 1,
1.668915, 0.0004126538, 1.436614, 1, 1, 1, 1, 1,
1.681466, -0.7527461, 2.483016, 1, 1, 1, 1, 1,
1.685315, -0.3572686, 3.186462, 1, 1, 1, 1, 1,
1.687092, 0.3697505, 1.613241, 1, 1, 1, 1, 1,
1.690027, -0.1813201, 1.32842, 1, 1, 1, 1, 1,
1.699356, 0.1158554, 1.403727, 0, 0, 1, 1, 1,
1.706277, -0.09712748, 1.462118, 1, 0, 0, 1, 1,
1.716975, 0.9601163, 1.638985, 1, 0, 0, 1, 1,
1.736131, -0.9624641, 3.13608, 1, 0, 0, 1, 1,
1.784532, -1.324703, 3.032773, 1, 0, 0, 1, 1,
1.793252, 1.096753, 1.214156, 1, 0, 0, 1, 1,
1.79652, 0.2781357, 1.307776, 0, 0, 0, 1, 1,
1.800806, -1.460235, 2.013505, 0, 0, 0, 1, 1,
1.810485, 0.3436138, 2.134707, 0, 0, 0, 1, 1,
1.841545, -1.093907, 1.26201, 0, 0, 0, 1, 1,
1.863857, -0.1350869, 1.819713, 0, 0, 0, 1, 1,
1.873609, -0.1146998, 0.4320968, 0, 0, 0, 1, 1,
1.879256, 0.406386, 2.100095, 0, 0, 0, 1, 1,
1.886982, 0.4895873, 1.056202, 1, 1, 1, 1, 1,
1.896198, 0.4936793, 0.1502679, 1, 1, 1, 1, 1,
1.908449, 1.152156, -0.1098032, 1, 1, 1, 1, 1,
1.909495, 0.04573832, 0.8440766, 1, 1, 1, 1, 1,
1.914901, 0.4789701, 0.08792285, 1, 1, 1, 1, 1,
1.920142, -0.358852, 2.629837, 1, 1, 1, 1, 1,
1.92141, -0.9235365, 1.501466, 1, 1, 1, 1, 1,
1.930434, 0.2399766, 1.550548, 1, 1, 1, 1, 1,
1.950937, 0.2962573, 1.571005, 1, 1, 1, 1, 1,
1.955777, 0.5712232, 1.790908, 1, 1, 1, 1, 1,
1.957757, -0.549347, 2.913414, 1, 1, 1, 1, 1,
1.959986, 1.756186, 0.5439757, 1, 1, 1, 1, 1,
1.965038, -2.590467, 1.656775, 1, 1, 1, 1, 1,
1.965475, 0.6627989, 1.03899, 1, 1, 1, 1, 1,
1.967316, 0.2538933, 0.2679764, 1, 1, 1, 1, 1,
1.991674, -0.02553009, 0.8214308, 0, 0, 1, 1, 1,
2.011299, 0.2499595, 1.234918, 1, 0, 0, 1, 1,
2.066386, -0.331017, 2.058034, 1, 0, 0, 1, 1,
2.080252, 0.4959401, 2.379526, 1, 0, 0, 1, 1,
2.16268, -0.5918276, 1.94468, 1, 0, 0, 1, 1,
2.168026, -0.2427839, 1.952078, 1, 0, 0, 1, 1,
2.188478, -1.18554, 2.574226, 0, 0, 0, 1, 1,
2.24353, 1.072625, 2.040877, 0, 0, 0, 1, 1,
2.306189, -0.3988941, 2.883778, 0, 0, 0, 1, 1,
2.308218, 0.9965577, 2.639347, 0, 0, 0, 1, 1,
2.36432, 0.7871667, -0.06479193, 0, 0, 0, 1, 1,
2.425472, 0.1502175, 0.06881376, 0, 0, 0, 1, 1,
2.435375, 1.070529, 1.264113, 0, 0, 0, 1, 1,
2.480102, 1.074455, 1.85787, 1, 1, 1, 1, 1,
2.698061, -1.102817, 1.141416, 1, 1, 1, 1, 1,
2.714002, 1.392708, 1.489095, 1, 1, 1, 1, 1,
2.930124, -0.2141589, 2.95, 1, 1, 1, 1, 1,
3.294999, 0.08541846, 0.7648615, 1, 1, 1, 1, 1,
3.377064, 0.634747, 3.197854, 1, 1, 1, 1, 1,
3.400563, 0.9189491, 0.1358133, 1, 1, 1, 1, 1
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
var radius = 9.692233;
var distance = 34.04356;
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
mvMatrix.translate( 0.2474179, 0.3383142, -0.0307138 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.04356);
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