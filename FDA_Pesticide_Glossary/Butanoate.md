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
-3.382456, -1.586048, -2.617949, 1, 0, 0, 1,
-2.871903, -0.8905699, -1.244, 1, 0.007843138, 0, 1,
-2.837349, -0.6253497, -3.192662, 1, 0.01176471, 0, 1,
-2.685908, -0.3136505, -2.275559, 1, 0.01960784, 0, 1,
-2.562106, 0.659247, -0.110224, 1, 0.02352941, 0, 1,
-2.531316, 1.346878, -0.9992614, 1, 0.03137255, 0, 1,
-2.46779, 0.7653574, 0.8778229, 1, 0.03529412, 0, 1,
-2.421354, 0.01673909, -2.469369, 1, 0.04313726, 0, 1,
-2.420556, 0.1678372, -0.03868785, 1, 0.04705882, 0, 1,
-2.418039, -1.855335, -3.773072, 1, 0.05490196, 0, 1,
-2.377566, 0.05055981, -2.814178, 1, 0.05882353, 0, 1,
-2.312756, 0.4691375, -0.9734949, 1, 0.06666667, 0, 1,
-2.300393, 0.6769711, -1.590529, 1, 0.07058824, 0, 1,
-2.285578, 0.5768862, -0.3517118, 1, 0.07843138, 0, 1,
-2.28199, 1.753638, -0.3028683, 1, 0.08235294, 0, 1,
-2.276507, -0.719698, -2.465449, 1, 0.09019608, 0, 1,
-2.246899, 0.417261, -1.73514, 1, 0.09411765, 0, 1,
-2.212931, 1.667779, -0.5092493, 1, 0.1019608, 0, 1,
-2.201437, -0.4353143, -1.092263, 1, 0.1098039, 0, 1,
-2.198012, 0.4973921, -2.636879, 1, 0.1137255, 0, 1,
-2.195436, 0.6497945, -2.320966, 1, 0.1215686, 0, 1,
-2.162059, -0.8090823, -0.2554069, 1, 0.1254902, 0, 1,
-2.153124, -0.6900409, 0.8425993, 1, 0.1333333, 0, 1,
-2.145069, -2.295831, -1.954927, 1, 0.1372549, 0, 1,
-2.144397, -0.06473145, -1.462139, 1, 0.145098, 0, 1,
-2.111621, -1.464886, -1.15037, 1, 0.1490196, 0, 1,
-2.095092, -0.5042896, -2.091649, 1, 0.1568628, 0, 1,
-2.088507, 0.2068539, 0.3684384, 1, 0.1607843, 0, 1,
-2.02969, -0.3828783, -1.459405, 1, 0.1686275, 0, 1,
-2.02445, -2.123001, -3.927425, 1, 0.172549, 0, 1,
-2.00871, 0.9625046, -2.508921, 1, 0.1803922, 0, 1,
-1.998195, -1.426137, -4.712805, 1, 0.1843137, 0, 1,
-1.994666, 0.455477, -0.9949751, 1, 0.1921569, 0, 1,
-1.994098, 0.7777021, -1.663879, 1, 0.1960784, 0, 1,
-1.977033, 1.613906, -0.2090467, 1, 0.2039216, 0, 1,
-1.976026, 0.238539, -1.566236, 1, 0.2117647, 0, 1,
-1.971263, 0.121809, -1.033689, 1, 0.2156863, 0, 1,
-1.932384, -0.2611458, -0.5878341, 1, 0.2235294, 0, 1,
-1.930521, -0.4872056, -3.135299, 1, 0.227451, 0, 1,
-1.922008, 0.1867317, -1.927446, 1, 0.2352941, 0, 1,
-1.91151, -0.1393653, -2.201174, 1, 0.2392157, 0, 1,
-1.904103, 1.131097, 0.1764252, 1, 0.2470588, 0, 1,
-1.864519, -0.3998663, -3.202019, 1, 0.2509804, 0, 1,
-1.862803, -0.7810665, -1.675434, 1, 0.2588235, 0, 1,
-1.853882, -0.6630586, -1.155659, 1, 0.2627451, 0, 1,
-1.828289, 0.1086803, -0.8969849, 1, 0.2705882, 0, 1,
-1.819689, 0.5447662, 0.5012826, 1, 0.2745098, 0, 1,
-1.800128, 1.400781, -2.124532, 1, 0.282353, 0, 1,
-1.791799, 2.485124, -1.445323, 1, 0.2862745, 0, 1,
-1.785157, -0.2007339, -1.832595, 1, 0.2941177, 0, 1,
-1.78049, -0.5822542, -1.607285, 1, 0.3019608, 0, 1,
-1.777042, -0.2514569, -1.37841, 1, 0.3058824, 0, 1,
-1.757016, 1.235207, -1.129126, 1, 0.3137255, 0, 1,
-1.735712, 1.357285, 0.9494339, 1, 0.3176471, 0, 1,
-1.70844, 0.09271733, -2.442555, 1, 0.3254902, 0, 1,
-1.706578, 0.8210949, -1.321942, 1, 0.3294118, 0, 1,
-1.703979, -0.1872052, 0.007174842, 1, 0.3372549, 0, 1,
-1.684927, 2.066139, -2.528656, 1, 0.3411765, 0, 1,
-1.666584, 0.4124887, -1.014961, 1, 0.3490196, 0, 1,
-1.663694, -0.04498817, -3.167015, 1, 0.3529412, 0, 1,
-1.660867, 0.4495597, -1.486184, 1, 0.3607843, 0, 1,
-1.65945, -0.3163213, -2.329417, 1, 0.3647059, 0, 1,
-1.659, 0.4032814, -2.2079, 1, 0.372549, 0, 1,
-1.649285, -0.6566609, -2.694307, 1, 0.3764706, 0, 1,
-1.64641, -2.338912, -2.401599, 1, 0.3843137, 0, 1,
-1.642422, -1.729303, -0.476352, 1, 0.3882353, 0, 1,
-1.641629, -0.2090469, -1.793313, 1, 0.3960784, 0, 1,
-1.627488, 0.6758044, 0.1228903, 1, 0.4039216, 0, 1,
-1.612736, 0.3416616, -1.078111, 1, 0.4078431, 0, 1,
-1.593221, -1.004697, -2.905544, 1, 0.4156863, 0, 1,
-1.591599, 0.0051626, -1.401089, 1, 0.4196078, 0, 1,
-1.555201, 1.737193, 0.9893916, 1, 0.427451, 0, 1,
-1.55265, 1.300395, 0.6825865, 1, 0.4313726, 0, 1,
-1.544767, -1.340485, -2.211754, 1, 0.4392157, 0, 1,
-1.541541, 0.7761481, -0.4614395, 1, 0.4431373, 0, 1,
-1.540076, 0.49472, -2.264051, 1, 0.4509804, 0, 1,
-1.52346, 3.531615, 0.6344696, 1, 0.454902, 0, 1,
-1.500925, -1.608601, -1.313987, 1, 0.4627451, 0, 1,
-1.495612, -0.2123942, -1.108734, 1, 0.4666667, 0, 1,
-1.477757, 0.7780088, -2.486034, 1, 0.4745098, 0, 1,
-1.446192, 1.324674, -1.230599, 1, 0.4784314, 0, 1,
-1.440347, 0.2935292, -1.30043, 1, 0.4862745, 0, 1,
-1.421119, -0.23811, -1.559243, 1, 0.4901961, 0, 1,
-1.410782, -0.2304696, -0.5530691, 1, 0.4980392, 0, 1,
-1.393461, -0.06403884, -0.05033419, 1, 0.5058824, 0, 1,
-1.381343, -0.07442395, -0.2742327, 1, 0.509804, 0, 1,
-1.380115, 0.3851721, -2.046182, 1, 0.5176471, 0, 1,
-1.370611, -0.26137, -1.66272, 1, 0.5215687, 0, 1,
-1.366943, 0.4324113, -1.500538, 1, 0.5294118, 0, 1,
-1.366197, 0.5193191, -1.200953, 1, 0.5333334, 0, 1,
-1.366105, -0.5165474, -1.221841, 1, 0.5411765, 0, 1,
-1.346374, 0.9683939, -1.518175, 1, 0.5450981, 0, 1,
-1.336891, 0.6891527, -3.117855, 1, 0.5529412, 0, 1,
-1.325956, -0.8376831, -0.7852812, 1, 0.5568628, 0, 1,
-1.320595, 1.042074, -1.385005, 1, 0.5647059, 0, 1,
-1.311326, 0.4309794, -1.42466, 1, 0.5686275, 0, 1,
-1.310933, -1.402089, -2.83307, 1, 0.5764706, 0, 1,
-1.292534, -0.4764544, -2.712558, 1, 0.5803922, 0, 1,
-1.283125, -1.035009, -1.97468, 1, 0.5882353, 0, 1,
-1.280198, 0.8494155, -1.79045, 1, 0.5921569, 0, 1,
-1.272914, -0.8790322, -1.309266, 1, 0.6, 0, 1,
-1.271445, 1.799661, -1.827342, 1, 0.6078432, 0, 1,
-1.2608, 0.02576155, -0.6841289, 1, 0.6117647, 0, 1,
-1.250531, -0.9051051, -3.276668, 1, 0.6196079, 0, 1,
-1.245906, -0.1628292, -2.476787, 1, 0.6235294, 0, 1,
-1.245108, -0.09061293, -2.815151, 1, 0.6313726, 0, 1,
-1.231694, -0.5048535, -1.007905, 1, 0.6352941, 0, 1,
-1.230886, 0.2769555, -0.6208246, 1, 0.6431373, 0, 1,
-1.229093, -0.3079177, -2.133619, 1, 0.6470588, 0, 1,
-1.224283, 0.7571493, 0.09100799, 1, 0.654902, 0, 1,
-1.221497, -0.670464, -1.919526, 1, 0.6588235, 0, 1,
-1.214993, -0.8697472, -2.486818, 1, 0.6666667, 0, 1,
-1.209656, 0.617151, -0.6105843, 1, 0.6705883, 0, 1,
-1.207958, 1.629425, -1.516666, 1, 0.6784314, 0, 1,
-1.202512, -1.375366, -2.716093, 1, 0.682353, 0, 1,
-1.198128, -1.267044, -1.507553, 1, 0.6901961, 0, 1,
-1.193647, 0.1020202, -1.864266, 1, 0.6941177, 0, 1,
-1.191419, -0.6552776, -3.132371, 1, 0.7019608, 0, 1,
-1.189312, 0.6256874, -0.7595851, 1, 0.7098039, 0, 1,
-1.176746, 0.287413, -0.934139, 1, 0.7137255, 0, 1,
-1.161328, 0.9501908, 0.9917985, 1, 0.7215686, 0, 1,
-1.158448, 0.007155373, -1.617395, 1, 0.7254902, 0, 1,
-1.148036, -0.3398116, -2.023879, 1, 0.7333333, 0, 1,
-1.147229, 1.031665, -0.3040874, 1, 0.7372549, 0, 1,
-1.128866, -0.5821816, 0.09263542, 1, 0.7450981, 0, 1,
-1.128773, -0.1596226, -2.170089, 1, 0.7490196, 0, 1,
-1.118959, 1.413167, -0.8947412, 1, 0.7568628, 0, 1,
-1.115194, 1.086403, -1.57973, 1, 0.7607843, 0, 1,
-1.101846, 0.1517733, 0.6833135, 1, 0.7686275, 0, 1,
-1.098254, 0.1454606, -0.9749423, 1, 0.772549, 0, 1,
-1.091832, -0.8920574, -2.144449, 1, 0.7803922, 0, 1,
-1.08904, 0.8609279, -1.576727, 1, 0.7843137, 0, 1,
-1.082488, 0.4070174, -1.940064, 1, 0.7921569, 0, 1,
-1.076007, -0.02409843, -2.401617, 1, 0.7960784, 0, 1,
-1.071865, -1.067036, -1.255675, 1, 0.8039216, 0, 1,
-1.056756, 0.4123636, -1.267803, 1, 0.8117647, 0, 1,
-1.053555, 0.9983559, 1.245518, 1, 0.8156863, 0, 1,
-1.048012, 0.3879849, -1.091687, 1, 0.8235294, 0, 1,
-1.027112, -0.6503574, -3.161119, 1, 0.827451, 0, 1,
-1.025782, 1.709789, -0.4195393, 1, 0.8352941, 0, 1,
-1.021368, -0.4232971, -2.946594, 1, 0.8392157, 0, 1,
-1.018472, 1.309297, 0.3252744, 1, 0.8470588, 0, 1,
-1.001949, 0.6150297, -2.128559, 1, 0.8509804, 0, 1,
-1.001384, -0.1527009, -1.886646, 1, 0.8588235, 0, 1,
-0.9973743, -0.6419708, -1.727117, 1, 0.8627451, 0, 1,
-0.9963108, 0.1913534, -1.331762, 1, 0.8705882, 0, 1,
-0.9954955, -0.2613267, -1.280849, 1, 0.8745098, 0, 1,
-0.9909024, 1.71652, 0.6808253, 1, 0.8823529, 0, 1,
-0.9879994, -1.755697, -3.725821, 1, 0.8862745, 0, 1,
-0.987277, -1.45295, -1.865643, 1, 0.8941177, 0, 1,
-0.9871238, -0.2139358, -3.283663, 1, 0.8980392, 0, 1,
-0.9750695, 1.205609, -0.9512065, 1, 0.9058824, 0, 1,
-0.9719856, 1.750992, -0.3187049, 1, 0.9137255, 0, 1,
-0.9471215, 0.4644257, -1.293554, 1, 0.9176471, 0, 1,
-0.9387891, 3.088584, 0.9895058, 1, 0.9254902, 0, 1,
-0.9383096, 0.3973901, -1.375008, 1, 0.9294118, 0, 1,
-0.9361197, 0.06519657, -1.325625, 1, 0.9372549, 0, 1,
-0.9345944, -0.6180829, -1.097453, 1, 0.9411765, 0, 1,
-0.9239419, 1.597418, -0.1038869, 1, 0.9490196, 0, 1,
-0.9214249, 0.6244536, 1.879473, 1, 0.9529412, 0, 1,
-0.9185322, 0.4935741, -1.28293, 1, 0.9607843, 0, 1,
-0.9165645, 0.4788636, -0.4999315, 1, 0.9647059, 0, 1,
-0.9143691, 1.165913, -0.5874748, 1, 0.972549, 0, 1,
-0.9118369, 1.531326, -2.206428, 1, 0.9764706, 0, 1,
-0.9018022, 0.2356635, -1.26591, 1, 0.9843137, 0, 1,
-0.9005743, -0.5733724, -3.576881, 1, 0.9882353, 0, 1,
-0.899815, 0.007653798, -1.799374, 1, 0.9960784, 0, 1,
-0.8938422, -0.4796923, -3.116556, 0.9960784, 1, 0, 1,
-0.8936682, 0.3825234, -3.08418, 0.9921569, 1, 0, 1,
-0.8932572, 3.003114, 0.5306225, 0.9843137, 1, 0, 1,
-0.8928409, -0.6805686, -2.47494, 0.9803922, 1, 0, 1,
-0.8866659, -1.244041, -1.7381, 0.972549, 1, 0, 1,
-0.8767179, 0.3727439, -0.726674, 0.9686275, 1, 0, 1,
-0.8713265, -0.9843409, -5.359351, 0.9607843, 1, 0, 1,
-0.87107, -0.9942999, -2.488935, 0.9568627, 1, 0, 1,
-0.8701901, -0.1153894, -1.58325, 0.9490196, 1, 0, 1,
-0.8678051, -0.00418253, -1.366833, 0.945098, 1, 0, 1,
-0.8657121, 0.8215818, 0.1279823, 0.9372549, 1, 0, 1,
-0.858806, 0.8877299, -0.9409487, 0.9333333, 1, 0, 1,
-0.8582122, -2.202165, -2.272954, 0.9254902, 1, 0, 1,
-0.8496415, 1.341194, -1.178031, 0.9215686, 1, 0, 1,
-0.8487964, 0.8555384, -0.2982476, 0.9137255, 1, 0, 1,
-0.8481868, 0.6440304, -0.1695045, 0.9098039, 1, 0, 1,
-0.8432489, -0.3104048, -0.1210854, 0.9019608, 1, 0, 1,
-0.8392858, -1.570684, -2.538971, 0.8941177, 1, 0, 1,
-0.8319624, -0.4905275, -2.48411, 0.8901961, 1, 0, 1,
-0.829273, 2.013901, -0.8817922, 0.8823529, 1, 0, 1,
-0.8288319, 0.01496807, -0.3437171, 0.8784314, 1, 0, 1,
-0.8282898, -1.254203, -4.787887, 0.8705882, 1, 0, 1,
-0.8280038, -1.30205, -5.350905, 0.8666667, 1, 0, 1,
-0.8228297, -0.06504808, -2.297224, 0.8588235, 1, 0, 1,
-0.8187873, 0.04571898, -0.4748007, 0.854902, 1, 0, 1,
-0.8171554, 0.02848343, -0.7318056, 0.8470588, 1, 0, 1,
-0.811802, -0.232858, -2.053501, 0.8431373, 1, 0, 1,
-0.8044953, 1.084374, -1.867979, 0.8352941, 1, 0, 1,
-0.8025332, 0.2259742, -1.833062, 0.8313726, 1, 0, 1,
-0.7926708, 0.5354375, -2.140258, 0.8235294, 1, 0, 1,
-0.7772593, 0.9503588, -0.1348268, 0.8196079, 1, 0, 1,
-0.7757742, -0.8153171, -2.148696, 0.8117647, 1, 0, 1,
-0.7750109, 1.360267, -0.7049684, 0.8078431, 1, 0, 1,
-0.7700773, -0.8489203, -3.130359, 0.8, 1, 0, 1,
-0.7695684, 0.4275388, -1.880584, 0.7921569, 1, 0, 1,
-0.7666432, 0.8635704, -1.037204, 0.7882353, 1, 0, 1,
-0.761722, 0.3321517, -1.52255, 0.7803922, 1, 0, 1,
-0.75964, 1.131253, -2.158468, 0.7764706, 1, 0, 1,
-0.7595402, 0.4392062, -2.095052, 0.7686275, 1, 0, 1,
-0.7589812, -0.4275926, -1.75424, 0.7647059, 1, 0, 1,
-0.7544206, 0.7029628, -1.184323, 0.7568628, 1, 0, 1,
-0.7543268, 0.2399201, -1.098333, 0.7529412, 1, 0, 1,
-0.750615, 1.020837, -0.6769601, 0.7450981, 1, 0, 1,
-0.7477649, -0.2410843, -2.241938, 0.7411765, 1, 0, 1,
-0.7471678, -1.165255, -2.089669, 0.7333333, 1, 0, 1,
-0.7450146, -0.6558659, -2.726149, 0.7294118, 1, 0, 1,
-0.7424938, -0.536088, -2.25462, 0.7215686, 1, 0, 1,
-0.7399112, 1.129882, -0.7772255, 0.7176471, 1, 0, 1,
-0.7383572, 2.042321, -0.8796044, 0.7098039, 1, 0, 1,
-0.7289709, 1.733988, 0.5418372, 0.7058824, 1, 0, 1,
-0.7236229, -0.376642, -2.462986, 0.6980392, 1, 0, 1,
-0.7184756, 0.04188451, -1.782243, 0.6901961, 1, 0, 1,
-0.7174246, 0.6737016, 0.178911, 0.6862745, 1, 0, 1,
-0.7171146, -1.924506, -4.066528, 0.6784314, 1, 0, 1,
-0.715896, 2.283613, -0.1323947, 0.6745098, 1, 0, 1,
-0.7151155, -0.05639071, -2.716637, 0.6666667, 1, 0, 1,
-0.7136331, 0.677709, 1.974636, 0.6627451, 1, 0, 1,
-0.7099141, -0.8183313, -2.574205, 0.654902, 1, 0, 1,
-0.7087246, 1.187554, -0.3630463, 0.6509804, 1, 0, 1,
-0.705663, -0.1333915, -1.105884, 0.6431373, 1, 0, 1,
-0.7028722, 0.252998, -2.244356, 0.6392157, 1, 0, 1,
-0.7026302, 0.5446112, -2.5837, 0.6313726, 1, 0, 1,
-0.6997978, 0.8901001, 0.024692, 0.627451, 1, 0, 1,
-0.6994241, -1.200983, -1.212071, 0.6196079, 1, 0, 1,
-0.6974124, 0.4713933, -0.881629, 0.6156863, 1, 0, 1,
-0.6948774, 1.401916, -2.481171, 0.6078432, 1, 0, 1,
-0.6928985, 0.1713306, -1.134879, 0.6039216, 1, 0, 1,
-0.6927637, -0.5580173, -2.203982, 0.5960785, 1, 0, 1,
-0.6915243, 0.2241557, -1.530316, 0.5882353, 1, 0, 1,
-0.6902176, 0.3659582, -1.127705, 0.5843138, 1, 0, 1,
-0.6875206, -0.4889846, -1.110905, 0.5764706, 1, 0, 1,
-0.6833895, 0.5861071, -0.9294684, 0.572549, 1, 0, 1,
-0.6753522, 0.1148111, -1.902294, 0.5647059, 1, 0, 1,
-0.6749804, -0.01414506, -1.404781, 0.5607843, 1, 0, 1,
-0.6727338, 0.07614029, -1.119736, 0.5529412, 1, 0, 1,
-0.6715316, 1.320242, -0.5594046, 0.5490196, 1, 0, 1,
-0.6698949, 0.4319839, -0.2060263, 0.5411765, 1, 0, 1,
-0.6683791, 1.000396, -0.7428151, 0.5372549, 1, 0, 1,
-0.6666743, 0.9087192, -0.1275038, 0.5294118, 1, 0, 1,
-0.6659228, 0.6813192, -0.8329468, 0.5254902, 1, 0, 1,
-0.6635717, 1.041308, 0.8338543, 0.5176471, 1, 0, 1,
-0.6592604, 0.2099482, -2.314825, 0.5137255, 1, 0, 1,
-0.6592027, 0.2776392, -2.447729, 0.5058824, 1, 0, 1,
-0.6585613, -1.022425, -1.5783, 0.5019608, 1, 0, 1,
-0.6560725, -0.6298761, -2.574318, 0.4941176, 1, 0, 1,
-0.6557828, -1.791914, -2.298563, 0.4862745, 1, 0, 1,
-0.6539735, 1.043744, -0.001479872, 0.4823529, 1, 0, 1,
-0.6440434, 0.3346459, -2.098296, 0.4745098, 1, 0, 1,
-0.6400289, -0.4371011, -2.56747, 0.4705882, 1, 0, 1,
-0.6311598, -0.2080951, -4.087589, 0.4627451, 1, 0, 1,
-0.628015, 0.1794714, -1.145944, 0.4588235, 1, 0, 1,
-0.624513, -0.3824674, -2.862517, 0.4509804, 1, 0, 1,
-0.6235862, 0.04586827, -2.033671, 0.4470588, 1, 0, 1,
-0.6078424, -2.884045, -2.444555, 0.4392157, 1, 0, 1,
-0.6077604, -0.3610814, -0.5969003, 0.4352941, 1, 0, 1,
-0.6074089, -0.4377742, -1.418225, 0.427451, 1, 0, 1,
-0.6073657, -1.227353, -3.507672, 0.4235294, 1, 0, 1,
-0.6067612, -1.048472, -2.868458, 0.4156863, 1, 0, 1,
-0.6055574, 0.1867554, -3.406534, 0.4117647, 1, 0, 1,
-0.603342, -0.5906832, -1.839092, 0.4039216, 1, 0, 1,
-0.6030395, 0.2969447, 0.5937031, 0.3960784, 1, 0, 1,
-0.5983446, 1.662139, 0.9888141, 0.3921569, 1, 0, 1,
-0.5980859, -0.724398, -5.411579, 0.3843137, 1, 0, 1,
-0.5957595, -0.9906875, -3.159154, 0.3803922, 1, 0, 1,
-0.5956191, -0.8877023, -2.73355, 0.372549, 1, 0, 1,
-0.5934864, 1.855055, 1.65369, 0.3686275, 1, 0, 1,
-0.5851972, 0.9927881, -2.653598, 0.3607843, 1, 0, 1,
-0.5789214, 0.7777851, -1.069923, 0.3568628, 1, 0, 1,
-0.5783297, -1.344546, -3.44653, 0.3490196, 1, 0, 1,
-0.5717037, -1.724819, -0.5196611, 0.345098, 1, 0, 1,
-0.5609004, -1.16127, -1.735416, 0.3372549, 1, 0, 1,
-0.5585411, 1.208607, -1.90636, 0.3333333, 1, 0, 1,
-0.5479735, 0.05139019, -1.036904, 0.3254902, 1, 0, 1,
-0.5478016, 0.9248179, -0.6465811, 0.3215686, 1, 0, 1,
-0.545763, 0.4561559, -1.917835, 0.3137255, 1, 0, 1,
-0.5452153, -1.092647, -4.625834, 0.3098039, 1, 0, 1,
-0.5441135, 1.058535, 1.295179, 0.3019608, 1, 0, 1,
-0.5432541, -1.069552, -2.280906, 0.2941177, 1, 0, 1,
-0.5415331, 0.5584353, -1.047146, 0.2901961, 1, 0, 1,
-0.5403427, 0.1791296, -0.9376232, 0.282353, 1, 0, 1,
-0.5401239, 0.6162718, 1.281711, 0.2784314, 1, 0, 1,
-0.5377523, 0.3822822, -1.415497, 0.2705882, 1, 0, 1,
-0.5367949, 1.58205, -1.068082, 0.2666667, 1, 0, 1,
-0.5333748, -0.1133809, -0.4222992, 0.2588235, 1, 0, 1,
-0.5326214, 0.2123761, -1.947538, 0.254902, 1, 0, 1,
-0.5317639, 0.6557083, -3.15359, 0.2470588, 1, 0, 1,
-0.5309275, 0.3177916, -0.5356174, 0.2431373, 1, 0, 1,
-0.5284833, 0.1094709, -1.729377, 0.2352941, 1, 0, 1,
-0.527891, -0.1101561, -1.522936, 0.2313726, 1, 0, 1,
-0.5220026, -0.9626939, -2.712771, 0.2235294, 1, 0, 1,
-0.5188233, -0.3042082, -0.3389127, 0.2196078, 1, 0, 1,
-0.5178496, -1.84917, -2.73293, 0.2117647, 1, 0, 1,
-0.5173321, 0.5705822, 1.044486, 0.2078431, 1, 0, 1,
-0.5144844, -1.428547, -3.15173, 0.2, 1, 0, 1,
-0.506227, -0.6446559, -3.677019, 0.1921569, 1, 0, 1,
-0.5052594, 0.3510162, -2.047476, 0.1882353, 1, 0, 1,
-0.5036467, 2.161144, -0.8683721, 0.1803922, 1, 0, 1,
-0.5036385, 0.9546919, -0.138562, 0.1764706, 1, 0, 1,
-0.5008993, 1.258899, -0.1045699, 0.1686275, 1, 0, 1,
-0.4924638, 0.7315307, 0.3103139, 0.1647059, 1, 0, 1,
-0.4908114, 0.04506475, -1.433944, 0.1568628, 1, 0, 1,
-0.4900865, -1.105994, -3.686887, 0.1529412, 1, 0, 1,
-0.4900524, -0.8448626, -3.365793, 0.145098, 1, 0, 1,
-0.4864696, 1.175097, 0.6025716, 0.1411765, 1, 0, 1,
-0.4794188, 1.488323, 0.06822793, 0.1333333, 1, 0, 1,
-0.4794091, 1.274579, 1.417181, 0.1294118, 1, 0, 1,
-0.4789699, -0.834424, -2.910776, 0.1215686, 1, 0, 1,
-0.4780617, -0.02445638, -2.658648, 0.1176471, 1, 0, 1,
-0.4733392, 1.24769, -1.032389, 0.1098039, 1, 0, 1,
-0.4711965, -0.7881168, -2.009931, 0.1058824, 1, 0, 1,
-0.4704675, -1.123287, -3.379534, 0.09803922, 1, 0, 1,
-0.4696572, 2.078393, -0.6342848, 0.09019608, 1, 0, 1,
-0.466582, 1.045226, -0.8463699, 0.08627451, 1, 0, 1,
-0.4569835, 1.712289, -0.6381891, 0.07843138, 1, 0, 1,
-0.4519911, -0.9634597, -2.067895, 0.07450981, 1, 0, 1,
-0.4480662, -0.6911368, -1.918674, 0.06666667, 1, 0, 1,
-0.4452524, -1.010098, -3.676783, 0.0627451, 1, 0, 1,
-0.444145, -1.073058, -2.55512, 0.05490196, 1, 0, 1,
-0.441694, -0.8344209, -4.652775, 0.05098039, 1, 0, 1,
-0.4397426, -1.11027, -1.787114, 0.04313726, 1, 0, 1,
-0.4341958, -0.3443056, -3.06008, 0.03921569, 1, 0, 1,
-0.4289622, -1.380237, -1.472574, 0.03137255, 1, 0, 1,
-0.4248551, -0.7303858, -4.083282, 0.02745098, 1, 0, 1,
-0.4243285, -1.31627, -1.984308, 0.01960784, 1, 0, 1,
-0.4238123, 0.1835063, -1.226524, 0.01568628, 1, 0, 1,
-0.4222597, 0.8827976, 0.4935014, 0.007843138, 1, 0, 1,
-0.420261, 0.2228617, -1.569516, 0.003921569, 1, 0, 1,
-0.4188903, 0.1476987, -0.4130888, 0, 1, 0.003921569, 1,
-0.4180442, -0.05956404, -1.101968, 0, 1, 0.01176471, 1,
-0.4174127, -0.1485469, -2.112357, 0, 1, 0.01568628, 1,
-0.4163599, 0.4638413, -0.2076617, 0, 1, 0.02352941, 1,
-0.4141129, 0.9398394, -3.229763, 0, 1, 0.02745098, 1,
-0.4093497, -0.6810641, -2.227982, 0, 1, 0.03529412, 1,
-0.405879, -1.360696, -1.047327, 0, 1, 0.03921569, 1,
-0.402531, -1.081489, -4.091747, 0, 1, 0.04705882, 1,
-0.4004649, 1.27023, 0.7678335, 0, 1, 0.05098039, 1,
-0.398482, -0.078277, -1.984784, 0, 1, 0.05882353, 1,
-0.395018, 1.273009, 0.7264354, 0, 1, 0.0627451, 1,
-0.3916182, 1.619573, -0.7531426, 0, 1, 0.07058824, 1,
-0.3890687, -0.4734539, -1.246847, 0, 1, 0.07450981, 1,
-0.3889958, 0.1082501, 0.6997973, 0, 1, 0.08235294, 1,
-0.3741952, 1.329666, 0.4324068, 0, 1, 0.08627451, 1,
-0.3740762, -0.8327166, -1.891683, 0, 1, 0.09411765, 1,
-0.3732913, -0.6548175, -2.886558, 0, 1, 0.1019608, 1,
-0.367797, 0.1548342, -0.3466038, 0, 1, 0.1058824, 1,
-0.3667416, -1.055532, -3.786998, 0, 1, 0.1137255, 1,
-0.366459, -0.6907777, -2.450878, 0, 1, 0.1176471, 1,
-0.3595374, 1.219971, -1.076936, 0, 1, 0.1254902, 1,
-0.3562796, -0.008036678, -1.820049, 0, 1, 0.1294118, 1,
-0.3561392, 0.3429666, -0.7659808, 0, 1, 0.1372549, 1,
-0.3533067, -0.7380051, -1.33647, 0, 1, 0.1411765, 1,
-0.3520588, 0.7629257, -0.3800367, 0, 1, 0.1490196, 1,
-0.350624, 1.481514, -1.288742, 0, 1, 0.1529412, 1,
-0.3498034, 0.0790621, -0.3450055, 0, 1, 0.1607843, 1,
-0.3424927, -0.6473857, -1.589697, 0, 1, 0.1647059, 1,
-0.341875, 0.1321078, -0.3537233, 0, 1, 0.172549, 1,
-0.3417225, -0.3048974, -2.736387, 0, 1, 0.1764706, 1,
-0.3393359, 0.9259324, 0.1161362, 0, 1, 0.1843137, 1,
-0.3380645, -0.2928701, -1.661043, 0, 1, 0.1882353, 1,
-0.3328024, 0.02605234, -0.16288, 0, 1, 0.1960784, 1,
-0.3309323, -1.620489, -2.291753, 0, 1, 0.2039216, 1,
-0.3304576, -0.07313902, -2.961214, 0, 1, 0.2078431, 1,
-0.3220262, -1.26087, -3.295346, 0, 1, 0.2156863, 1,
-0.3185384, -1.506685, -3.994422, 0, 1, 0.2196078, 1,
-0.3163433, 0.8162667, -0.07579798, 0, 1, 0.227451, 1,
-0.3057024, 0.1633431, -1.372899, 0, 1, 0.2313726, 1,
-0.3044537, -1.097972, -3.046847, 0, 1, 0.2392157, 1,
-0.3043881, -1.135741, -3.065303, 0, 1, 0.2431373, 1,
-0.2999312, 0.1061862, -0.3632434, 0, 1, 0.2509804, 1,
-0.2992885, -1.524603, -4.652082, 0, 1, 0.254902, 1,
-0.2948578, -0.1417274, -1.329136, 0, 1, 0.2627451, 1,
-0.2898536, 0.8379782, -1.867419, 0, 1, 0.2666667, 1,
-0.2877891, 0.4132477, -0.01005987, 0, 1, 0.2745098, 1,
-0.2840765, 0.5601011, -0.2190464, 0, 1, 0.2784314, 1,
-0.2834289, -0.496015, -1.67182, 0, 1, 0.2862745, 1,
-0.2806395, 0.2192417, -0.8943709, 0, 1, 0.2901961, 1,
-0.2801891, 0.6962898, -1.618095, 0, 1, 0.2980392, 1,
-0.2776331, 0.3229393, -0.5841577, 0, 1, 0.3058824, 1,
-0.2692834, 0.7415886, -0.6414375, 0, 1, 0.3098039, 1,
-0.2687691, -0.7113277, -3.129926, 0, 1, 0.3176471, 1,
-0.2682793, 0.2391151, -1.806562, 0, 1, 0.3215686, 1,
-0.267573, -0.2296917, -4.118078, 0, 1, 0.3294118, 1,
-0.266713, 1.22969, 1.479359, 0, 1, 0.3333333, 1,
-0.2651335, -1.525308, -1.739192, 0, 1, 0.3411765, 1,
-0.2578296, 0.1995511, -1.189473, 0, 1, 0.345098, 1,
-0.2573984, -0.6058712, -2.00475, 0, 1, 0.3529412, 1,
-0.2555717, -0.975439, -3.420045, 0, 1, 0.3568628, 1,
-0.2545736, 0.1018345, -0.09107793, 0, 1, 0.3647059, 1,
-0.2529472, -0.1946496, -2.492567, 0, 1, 0.3686275, 1,
-0.2522644, -0.349793, -2.49561, 0, 1, 0.3764706, 1,
-0.2487082, 1.350972, 1.432821, 0, 1, 0.3803922, 1,
-0.2459668, -0.01074413, -1.634737, 0, 1, 0.3882353, 1,
-0.2411073, -0.2274336, -1.782102, 0, 1, 0.3921569, 1,
-0.2397009, 0.3487491, -0.3832902, 0, 1, 0.4, 1,
-0.2382627, 2.675991, 0.4455888, 0, 1, 0.4078431, 1,
-0.2374658, 1.580875, 0.3727295, 0, 1, 0.4117647, 1,
-0.2368805, 1.090873, -2.11598, 0, 1, 0.4196078, 1,
-0.2302786, -0.7718085, -1.857897, 0, 1, 0.4235294, 1,
-0.2300839, -0.6779445, -2.389762, 0, 1, 0.4313726, 1,
-0.2297013, -0.1450289, -2.223621, 0, 1, 0.4352941, 1,
-0.2285363, -1.557885, -3.80966, 0, 1, 0.4431373, 1,
-0.2270617, -0.7153662, -1.769325, 0, 1, 0.4470588, 1,
-0.2228552, -2.177226, -3.409325, 0, 1, 0.454902, 1,
-0.2223246, 0.08910073, -0.3969204, 0, 1, 0.4588235, 1,
-0.2172737, 0.141161, -1.000348, 0, 1, 0.4666667, 1,
-0.2095665, -1.269496, -2.499538, 0, 1, 0.4705882, 1,
-0.2091594, -0.3250247, -3.23539, 0, 1, 0.4784314, 1,
-0.2064648, -0.6042461, -3.933073, 0, 1, 0.4823529, 1,
-0.2054227, 0.3601886, -0.3821073, 0, 1, 0.4901961, 1,
-0.1998247, -0.4041831, -1.359142, 0, 1, 0.4941176, 1,
-0.1973259, 0.6930557, 0.5148382, 0, 1, 0.5019608, 1,
-0.1908907, -0.1440829, -1.702646, 0, 1, 0.509804, 1,
-0.1856794, -0.6498411, -1.77844, 0, 1, 0.5137255, 1,
-0.18422, -1.163906, -0.6246026, 0, 1, 0.5215687, 1,
-0.1832458, 1.084016, -1.059585, 0, 1, 0.5254902, 1,
-0.1823386, -0.2464697, -4.244314, 0, 1, 0.5333334, 1,
-0.1815655, 2.04201, 0.5455089, 0, 1, 0.5372549, 1,
-0.1790823, 1.391788, 1.191376, 0, 1, 0.5450981, 1,
-0.1742789, 1.874402, -1.413635, 0, 1, 0.5490196, 1,
-0.1668127, -0.1208305, -1.696354, 0, 1, 0.5568628, 1,
-0.1661063, -1.629457, -1.114785, 0, 1, 0.5607843, 1,
-0.1653683, 0.7745572, 0.531388, 0, 1, 0.5686275, 1,
-0.1653471, -0.3908729, -2.925104, 0, 1, 0.572549, 1,
-0.1633146, 1.332143, 0.1694867, 0, 1, 0.5803922, 1,
-0.1627109, -0.199382, -0.7654468, 0, 1, 0.5843138, 1,
-0.158795, 0.3097864, -0.9204401, 0, 1, 0.5921569, 1,
-0.1570694, -0.4614435, -2.035837, 0, 1, 0.5960785, 1,
-0.1567771, 0.5122572, -0.6653807, 0, 1, 0.6039216, 1,
-0.1545601, 1.033412, -0.05481298, 0, 1, 0.6117647, 1,
-0.1536265, 1.70997, -0.4992778, 0, 1, 0.6156863, 1,
-0.1503336, 0.5773702, -0.9913241, 0, 1, 0.6235294, 1,
-0.1495995, 0.3204772, -1.613411, 0, 1, 0.627451, 1,
-0.1479907, 0.3817005, -2.242109, 0, 1, 0.6352941, 1,
-0.1438963, 1.751206, 1.653895, 0, 1, 0.6392157, 1,
-0.139621, -1.780555, -3.10823, 0, 1, 0.6470588, 1,
-0.1371963, 0.01472997, -0.9862764, 0, 1, 0.6509804, 1,
-0.1370614, -0.3912482, -1.78267, 0, 1, 0.6588235, 1,
-0.1357882, -0.6840436, -0.4163873, 0, 1, 0.6627451, 1,
-0.1330972, 0.7326816, -0.1033271, 0, 1, 0.6705883, 1,
-0.1299806, 1.10199, 0.1585018, 0, 1, 0.6745098, 1,
-0.12913, -0.6616113, -1.390364, 0, 1, 0.682353, 1,
-0.1256657, 1.264307, 0.9510999, 0, 1, 0.6862745, 1,
-0.1254951, -0.01291241, -0.8808048, 0, 1, 0.6941177, 1,
-0.1241308, -0.7645743, -2.452891, 0, 1, 0.7019608, 1,
-0.1218948, 0.08287053, -1.422962, 0, 1, 0.7058824, 1,
-0.1205374, 0.2268384, 0.5480272, 0, 1, 0.7137255, 1,
-0.1166035, -1.341024, -2.286453, 0, 1, 0.7176471, 1,
-0.1155304, 0.874401, -0.5179721, 0, 1, 0.7254902, 1,
-0.1121448, -1.466604, -3.215449, 0, 1, 0.7294118, 1,
-0.1107871, 0.642914, -2.229142, 0, 1, 0.7372549, 1,
-0.1103852, 0.3897726, -0.5314102, 0, 1, 0.7411765, 1,
-0.1060281, -0.008338654, -1.883833, 0, 1, 0.7490196, 1,
-0.1022994, 0.6471663, 0.6908376, 0, 1, 0.7529412, 1,
-0.1014269, -0.3471534, -5.637269, 0, 1, 0.7607843, 1,
-0.1010003, 1.102306, -1.243007, 0, 1, 0.7647059, 1,
-0.1002874, -0.6173041, -2.286179, 0, 1, 0.772549, 1,
-0.1000492, -0.2654066, -3.399467, 0, 1, 0.7764706, 1,
-0.0994788, -0.2341621, -3.771825, 0, 1, 0.7843137, 1,
-0.09325713, -0.8347839, -3.9406, 0, 1, 0.7882353, 1,
-0.09227509, 1.029949, -0.7973537, 0, 1, 0.7960784, 1,
-0.09125649, 0.2402463, -1.369508, 0, 1, 0.8039216, 1,
-0.0794976, 3.081699, 2.100775, 0, 1, 0.8078431, 1,
-0.07660715, 0.3116124, -0.6435113, 0, 1, 0.8156863, 1,
-0.07372167, 0.8704754, 1.169454, 0, 1, 0.8196079, 1,
-0.07365781, -0.3036144, -3.733672, 0, 1, 0.827451, 1,
-0.07041142, -0.8102728, -4.299135, 0, 1, 0.8313726, 1,
-0.0652007, 0.5722098, -0.05989485, 0, 1, 0.8392157, 1,
-0.06249329, -0.8166663, -2.587054, 0, 1, 0.8431373, 1,
-0.06023803, 0.4374372, -0.1720208, 0, 1, 0.8509804, 1,
-0.05874033, 1.353683, 0.2517681, 0, 1, 0.854902, 1,
-0.05816481, 0.006721434, -2.317457, 0, 1, 0.8627451, 1,
-0.05099348, -1.40602, -0.1258139, 0, 1, 0.8666667, 1,
-0.05064072, -0.04060384, -2.301925, 0, 1, 0.8745098, 1,
-0.0462239, -0.8380955, -3.411869, 0, 1, 0.8784314, 1,
-0.04393282, 0.02453303, -1.292856, 0, 1, 0.8862745, 1,
-0.03505397, -1.345893, -3.180074, 0, 1, 0.8901961, 1,
-0.03087831, 0.3048473, 1.106676, 0, 1, 0.8980392, 1,
-0.03071883, 0.08606002, 1.657346, 0, 1, 0.9058824, 1,
-0.02931854, 0.9182193, -0.4664712, 0, 1, 0.9098039, 1,
-0.02856153, 0.7618325, -0.6351292, 0, 1, 0.9176471, 1,
-0.02617623, -1.23936, -2.247445, 0, 1, 0.9215686, 1,
-0.02509923, 0.786078, -1.418843, 0, 1, 0.9294118, 1,
-0.02497281, -0.761619, -4.145958, 0, 1, 0.9333333, 1,
-0.02036733, -0.5982147, -2.928157, 0, 1, 0.9411765, 1,
-0.01950951, -0.007514542, -0.9639336, 0, 1, 0.945098, 1,
-0.01769136, -0.5220679, -3.772997, 0, 1, 0.9529412, 1,
-0.01698255, 0.6084604, 0.5700116, 0, 1, 0.9568627, 1,
-0.01364807, -0.2028417, -3.058288, 0, 1, 0.9647059, 1,
-0.01322317, -0.5221136, -1.260904, 0, 1, 0.9686275, 1,
-0.01206231, 1.446105, 1.028046, 0, 1, 0.9764706, 1,
-0.01196643, 1.995616, 0.6770915, 0, 1, 0.9803922, 1,
-0.008748267, 0.3375578, -1.910924, 0, 1, 0.9882353, 1,
-0.007950527, -0.9953594, -4.012398, 0, 1, 0.9921569, 1,
-0.007637372, 0.03851027, -0.2319814, 0, 1, 1, 1,
-0.006799562, -2.098046, -3.566509, 0, 0.9921569, 1, 1,
-0.004272844, -0.5892814, -2.38364, 0, 0.9882353, 1, 1,
0.003484142, -0.9224236, 3.116574, 0, 0.9803922, 1, 1,
0.003753064, -0.8568954, 2.127037, 0, 0.9764706, 1, 1,
0.005312813, 0.2568429, 0.6674567, 0, 0.9686275, 1, 1,
0.005540313, -0.7678972, 2.779171, 0, 0.9647059, 1, 1,
0.006569504, 0.7701946, -0.7182026, 0, 0.9568627, 1, 1,
0.009773122, -0.6192891, 2.361626, 0, 0.9529412, 1, 1,
0.01418112, 1.036508, -0.598826, 0, 0.945098, 1, 1,
0.01530717, -0.9743129, 3.67926, 0, 0.9411765, 1, 1,
0.02107511, -0.7865111, 2.490388, 0, 0.9333333, 1, 1,
0.02406093, -2.147859, 4.289537, 0, 0.9294118, 1, 1,
0.0241867, 1.242602, 0.4000566, 0, 0.9215686, 1, 1,
0.02937246, -1.555503, 1.381778, 0, 0.9176471, 1, 1,
0.03094915, -0.2937568, 2.025218, 0, 0.9098039, 1, 1,
0.03715716, 1.112015, -0.4127423, 0, 0.9058824, 1, 1,
0.03735172, -0.3124126, 2.053448, 0, 0.8980392, 1, 1,
0.03881869, 0.9766197, -0.8236637, 0, 0.8901961, 1, 1,
0.03960099, 0.7345197, 0.1835027, 0, 0.8862745, 1, 1,
0.04193906, -0.2516216, 2.222035, 0, 0.8784314, 1, 1,
0.04304526, -0.6464997, 2.027817, 0, 0.8745098, 1, 1,
0.04717387, 0.5429171, 0.49696, 0, 0.8666667, 1, 1,
0.0476166, 0.3335916, 0.2728188, 0, 0.8627451, 1, 1,
0.04916383, 3.560196, 0.5051901, 0, 0.854902, 1, 1,
0.05229723, 0.9300185, -0.3559807, 0, 0.8509804, 1, 1,
0.05288871, -1.822886, 1.971407, 0, 0.8431373, 1, 1,
0.05300541, -1.146144, 3.894152, 0, 0.8392157, 1, 1,
0.05655779, 0.01688844, 0.9734843, 0, 0.8313726, 1, 1,
0.06201076, 0.6763681, 0.8739998, 0, 0.827451, 1, 1,
0.06521418, 0.5447577, 0.1973724, 0, 0.8196079, 1, 1,
0.06770927, 0.262095, 1.543657, 0, 0.8156863, 1, 1,
0.06975258, 0.6938941, 0.9007467, 0, 0.8078431, 1, 1,
0.0701995, -0.6355151, 3.492464, 0, 0.8039216, 1, 1,
0.07160144, 0.3193032, 0.2281195, 0, 0.7960784, 1, 1,
0.07848357, 0.4826998, -0.01069023, 0, 0.7882353, 1, 1,
0.07918992, -0.7510237, 2.961011, 0, 0.7843137, 1, 1,
0.07928034, 0.3001224, -0.3594418, 0, 0.7764706, 1, 1,
0.08217534, -1.41273, 2.29047, 0, 0.772549, 1, 1,
0.08405353, 0.3153132, 0.1948057, 0, 0.7647059, 1, 1,
0.08613531, -0.5328592, 2.479836, 0, 0.7607843, 1, 1,
0.08745574, -0.7642363, 3.549517, 0, 0.7529412, 1, 1,
0.09234903, 0.8747292, -0.1032676, 0, 0.7490196, 1, 1,
0.09665298, 0.953995, -0.1941148, 0, 0.7411765, 1, 1,
0.0980405, -1.039859, 2.149334, 0, 0.7372549, 1, 1,
0.1000735, -1.231686, 4.239524, 0, 0.7294118, 1, 1,
0.1037467, 0.8325635, -0.2881528, 0, 0.7254902, 1, 1,
0.1063108, 0.6039283, -0.0003000575, 0, 0.7176471, 1, 1,
0.108316, 0.1438083, -1.125511, 0, 0.7137255, 1, 1,
0.108709, 0.9143929, -1.917885, 0, 0.7058824, 1, 1,
0.1109323, 0.8163037, 0.2196657, 0, 0.6980392, 1, 1,
0.1150464, -0.2324066, 1.794312, 0, 0.6941177, 1, 1,
0.1168821, 0.7391358, -0.6451781, 0, 0.6862745, 1, 1,
0.1172857, 0.8238493, 0.2847416, 0, 0.682353, 1, 1,
0.119226, -0.6126133, 3.750543, 0, 0.6745098, 1, 1,
0.122097, -1.254714, 3.69297, 0, 0.6705883, 1, 1,
0.1221402, -0.0402, 0.7754622, 0, 0.6627451, 1, 1,
0.1228768, -0.9320571, 1.547004, 0, 0.6588235, 1, 1,
0.1342254, 0.6705741, -0.05906601, 0, 0.6509804, 1, 1,
0.1362413, -1.430972, 4.086895, 0, 0.6470588, 1, 1,
0.1376259, -0.6981365, 2.784948, 0, 0.6392157, 1, 1,
0.1515235, -0.1325909, 2.533193, 0, 0.6352941, 1, 1,
0.1522612, 0.131286, 0.027062, 0, 0.627451, 1, 1,
0.1532628, 0.9615459, -0.03384897, 0, 0.6235294, 1, 1,
0.1536514, -0.2619565, 3.005872, 0, 0.6156863, 1, 1,
0.1567294, 0.5762995, 0.2465963, 0, 0.6117647, 1, 1,
0.1589121, -0.63791, 2.510701, 0, 0.6039216, 1, 1,
0.1625229, -1.869048, 2.302203, 0, 0.5960785, 1, 1,
0.1669567, -0.2257083, 3.199052, 0, 0.5921569, 1, 1,
0.1671933, 0.9093761, -0.4001777, 0, 0.5843138, 1, 1,
0.1683795, -0.7903548, 3.973779, 0, 0.5803922, 1, 1,
0.1700347, -0.002387572, 1.05171, 0, 0.572549, 1, 1,
0.1724854, -1.477009, 1.590075, 0, 0.5686275, 1, 1,
0.1772431, 0.4086153, 0.3951488, 0, 0.5607843, 1, 1,
0.1785899, -0.9483182, 3.171432, 0, 0.5568628, 1, 1,
0.1786022, -0.3770187, 1.367002, 0, 0.5490196, 1, 1,
0.1811338, 0.02665702, 1.019329, 0, 0.5450981, 1, 1,
0.1815845, 1.292271, 1.582572, 0, 0.5372549, 1, 1,
0.1825938, -0.4573671, 1.272248, 0, 0.5333334, 1, 1,
0.1834366, -0.9159886, 3.562249, 0, 0.5254902, 1, 1,
0.1841375, -0.1120988, 1.551286, 0, 0.5215687, 1, 1,
0.1845577, -1.974259, 4.585609, 0, 0.5137255, 1, 1,
0.1848974, 1.344263, 0.7566239, 0, 0.509804, 1, 1,
0.1860665, -2.023647, 3.101553, 0, 0.5019608, 1, 1,
0.1875702, -0.2338891, 2.674471, 0, 0.4941176, 1, 1,
0.1885352, -0.3766744, 0.8156911, 0, 0.4901961, 1, 1,
0.1899982, -0.02653253, 2.670047, 0, 0.4823529, 1, 1,
0.1914617, 1.677922, 1.337905, 0, 0.4784314, 1, 1,
0.1916243, -0.9338306, 2.673302, 0, 0.4705882, 1, 1,
0.1918069, -0.6099935, 2.871039, 0, 0.4666667, 1, 1,
0.1923752, 2.126582, 1.147999, 0, 0.4588235, 1, 1,
0.1931232, 0.153518, -0.5841995, 0, 0.454902, 1, 1,
0.1969883, -0.5045381, 1.692448, 0, 0.4470588, 1, 1,
0.1975043, -0.1741595, 2.426419, 0, 0.4431373, 1, 1,
0.1999302, -1.772386, 1.004248, 0, 0.4352941, 1, 1,
0.200398, -0.6374745, 3.288026, 0, 0.4313726, 1, 1,
0.2016602, -0.6902174, 1.255015, 0, 0.4235294, 1, 1,
0.2026651, -1.181052, 0.9538667, 0, 0.4196078, 1, 1,
0.2028012, -0.6993731, 1.324771, 0, 0.4117647, 1, 1,
0.2046579, -0.6573895, 5.050477, 0, 0.4078431, 1, 1,
0.2054932, 1.704903, 0.7472793, 0, 0.4, 1, 1,
0.206367, -0.2227074, 2.075269, 0, 0.3921569, 1, 1,
0.2126033, 1.977546, 1.384461, 0, 0.3882353, 1, 1,
0.2163834, -1.436309, 3.359026, 0, 0.3803922, 1, 1,
0.2190095, -1.495233, 4.806721, 0, 0.3764706, 1, 1,
0.2202241, 0.2012061, -0.6217255, 0, 0.3686275, 1, 1,
0.2212875, 0.7505149, -0.2008347, 0, 0.3647059, 1, 1,
0.222837, -0.5935422, 2.906141, 0, 0.3568628, 1, 1,
0.2238739, -3.373195, 4.993913, 0, 0.3529412, 1, 1,
0.2239304, -0.2509539, 2.112096, 0, 0.345098, 1, 1,
0.2250067, 0.1306866, -0.4619032, 0, 0.3411765, 1, 1,
0.2267609, 0.4331655, 0.4264451, 0, 0.3333333, 1, 1,
0.2267623, 0.2125604, 0.6004769, 0, 0.3294118, 1, 1,
0.227301, -0.3475193, 4.074034, 0, 0.3215686, 1, 1,
0.228903, 0.5307468, -0.01235534, 0, 0.3176471, 1, 1,
0.2321634, 0.08107842, 0.4211635, 0, 0.3098039, 1, 1,
0.232862, 1.580699, -2.160871, 0, 0.3058824, 1, 1,
0.2360021, 0.840477, 0.7292792, 0, 0.2980392, 1, 1,
0.237265, -0.3458611, 2.377317, 0, 0.2901961, 1, 1,
0.24219, 1.405697, 0.1419311, 0, 0.2862745, 1, 1,
0.2527105, -1.758307, 3.755834, 0, 0.2784314, 1, 1,
0.2567966, 0.04126474, 2.082858, 0, 0.2745098, 1, 1,
0.2574044, -0.3659177, 1.911539, 0, 0.2666667, 1, 1,
0.2646093, -0.1952025, 2.465781, 0, 0.2627451, 1, 1,
0.2655132, -1.153445, 0.5606946, 0, 0.254902, 1, 1,
0.265539, 0.7786836, 0.2934535, 0, 0.2509804, 1, 1,
0.2681968, -0.03409366, 0.03061989, 0, 0.2431373, 1, 1,
0.2688127, 1.565609, 1.34815, 0, 0.2392157, 1, 1,
0.2690453, 0.9022121, 0.1936343, 0, 0.2313726, 1, 1,
0.2701936, -0.09156354, 1.08437, 0, 0.227451, 1, 1,
0.2719575, 0.626552, 0.4268899, 0, 0.2196078, 1, 1,
0.2727949, 0.3190196, 1.281083, 0, 0.2156863, 1, 1,
0.2759061, 0.09790894, 2.29569, 0, 0.2078431, 1, 1,
0.2771336, -0.06327934, -0.3390173, 0, 0.2039216, 1, 1,
0.2827799, -0.0134857, 2.39377, 0, 0.1960784, 1, 1,
0.2848221, 1.189928, 0.8678077, 0, 0.1882353, 1, 1,
0.2904957, 0.1733191, 0.3878452, 0, 0.1843137, 1, 1,
0.2918076, 0.7452662, 0.6969715, 0, 0.1764706, 1, 1,
0.2958227, -0.07712387, 1.146971, 0, 0.172549, 1, 1,
0.2981008, 0.1040067, 0.06397561, 0, 0.1647059, 1, 1,
0.2986859, 0.770143, 0.9195216, 0, 0.1607843, 1, 1,
0.30074, 1.152663, -1.81529, 0, 0.1529412, 1, 1,
0.3068754, 0.7451143, 0.7537678, 0, 0.1490196, 1, 1,
0.3070089, -1.230439, 4.017971, 0, 0.1411765, 1, 1,
0.3080527, -0.4880298, 3.364431, 0, 0.1372549, 1, 1,
0.3085711, -0.8670962, 2.83051, 0, 0.1294118, 1, 1,
0.3102014, 0.9905821, -0.6871752, 0, 0.1254902, 1, 1,
0.3134087, -0.6872245, 4.23293, 0, 0.1176471, 1, 1,
0.3134618, 0.6420364, 1.266113, 0, 0.1137255, 1, 1,
0.3157796, -1.651485, 1.896252, 0, 0.1058824, 1, 1,
0.3173104, 2.229698, 0.1517051, 0, 0.09803922, 1, 1,
0.319871, -0.6340204, 4.314562, 0, 0.09411765, 1, 1,
0.31996, 0.1751187, 1.661982, 0, 0.08627451, 1, 1,
0.328239, -0.9443493, 2.594573, 0, 0.08235294, 1, 1,
0.3286788, -2.004933, 1.606628, 0, 0.07450981, 1, 1,
0.3300681, -2.4409, 4.350454, 0, 0.07058824, 1, 1,
0.3320489, 1.03425, 0.6096332, 0, 0.0627451, 1, 1,
0.3338185, 0.495444, 2.576411, 0, 0.05882353, 1, 1,
0.3356968, 0.6445688, -0.2169202, 0, 0.05098039, 1, 1,
0.3360492, -0.6701564, 1.557582, 0, 0.04705882, 1, 1,
0.3373608, 0.301381, 0.914497, 0, 0.03921569, 1, 1,
0.3391835, 0.7818386, -3.188922, 0, 0.03529412, 1, 1,
0.3467656, -1.157281, 2.755801, 0, 0.02745098, 1, 1,
0.3477134, -0.2596718, 1.845239, 0, 0.02352941, 1, 1,
0.3521398, -0.3417878, 2.433109, 0, 0.01568628, 1, 1,
0.3576807, 0.3975272, 1.969972, 0, 0.01176471, 1, 1,
0.3594373, 0.05588993, 1.859206, 0, 0.003921569, 1, 1,
0.3614384, -1.625439, 2.847474, 0.003921569, 0, 1, 1,
0.3621825, -0.3719137, 1.83011, 0.007843138, 0, 1, 1,
0.3627132, -0.3011984, 3.096488, 0.01568628, 0, 1, 1,
0.3645183, -1.062162, 1.698029, 0.01960784, 0, 1, 1,
0.366986, -0.7191237, 3.330319, 0.02745098, 0, 1, 1,
0.3717577, -0.5191752, 3.545443, 0.03137255, 0, 1, 1,
0.374059, -0.2605328, -0.008584438, 0.03921569, 0, 1, 1,
0.3759235, -0.3505517, 0.9442781, 0.04313726, 0, 1, 1,
0.3764107, 1.217958, 0.6600151, 0.05098039, 0, 1, 1,
0.3776819, -1.273018, 3.86056, 0.05490196, 0, 1, 1,
0.3797945, 2.086046, -0.7695529, 0.0627451, 0, 1, 1,
0.3807546, 0.1825571, 1.51689, 0.06666667, 0, 1, 1,
0.3822447, 0.9662173, 0.1646892, 0.07450981, 0, 1, 1,
0.3846321, -0.1109193, 1.906028, 0.07843138, 0, 1, 1,
0.3850898, -0.02544327, 1.865347, 0.08627451, 0, 1, 1,
0.3895273, -0.3498269, 2.545023, 0.09019608, 0, 1, 1,
0.3912525, -0.9864058, 2.899199, 0.09803922, 0, 1, 1,
0.4065707, 0.3334045, 0.9727913, 0.1058824, 0, 1, 1,
0.412773, 0.4681022, 0.5176575, 0.1098039, 0, 1, 1,
0.4139175, -0.1691595, 1.875202, 0.1176471, 0, 1, 1,
0.4170129, -0.744236, 3.689681, 0.1215686, 0, 1, 1,
0.4171355, 0.4641341, -1.920514, 0.1294118, 0, 1, 1,
0.4287112, 1.290005, 2.400794, 0.1333333, 0, 1, 1,
0.4318218, 0.1017783, 2.268762, 0.1411765, 0, 1, 1,
0.432797, 0.8403392, 0.4045105, 0.145098, 0, 1, 1,
0.4415429, 1.124381, 0.7475333, 0.1529412, 0, 1, 1,
0.443328, -0.01628496, 1.538938, 0.1568628, 0, 1, 1,
0.4435112, -2.059054, 3.014469, 0.1647059, 0, 1, 1,
0.4448331, -0.7695618, 5.065908, 0.1686275, 0, 1, 1,
0.4461101, 0.3308436, -0.1905853, 0.1764706, 0, 1, 1,
0.4494471, -0.682698, 2.181456, 0.1803922, 0, 1, 1,
0.4497578, 1.172993, 0.1707796, 0.1882353, 0, 1, 1,
0.4526916, -0.7686517, 1.449027, 0.1921569, 0, 1, 1,
0.4567608, -1.019735, 4.100454, 0.2, 0, 1, 1,
0.4592929, 0.2269813, 1.115621, 0.2078431, 0, 1, 1,
0.4607117, -0.2726628, 2.100477, 0.2117647, 0, 1, 1,
0.4628287, -1.946931, 3.265761, 0.2196078, 0, 1, 1,
0.4690325, -0.5860833, 1.306493, 0.2235294, 0, 1, 1,
0.4732464, -0.1530422, 1.114035, 0.2313726, 0, 1, 1,
0.4780322, -0.8961257, 4.23455, 0.2352941, 0, 1, 1,
0.4812959, -1.401064, 2.035993, 0.2431373, 0, 1, 1,
0.4831007, -0.3819875, 1.712475, 0.2470588, 0, 1, 1,
0.4880681, -0.05172991, 0.9813972, 0.254902, 0, 1, 1,
0.4926409, -0.5425276, 1.741207, 0.2588235, 0, 1, 1,
0.4945542, 1.098859, 0.5940876, 0.2666667, 0, 1, 1,
0.496785, -0.006581461, 1.138855, 0.2705882, 0, 1, 1,
0.5016434, 0.8988805, 0.3101626, 0.2784314, 0, 1, 1,
0.5034037, -1.315007, 1.646405, 0.282353, 0, 1, 1,
0.5052726, -1.475723, 2.718856, 0.2901961, 0, 1, 1,
0.509657, -1.35503, 3.552073, 0.2941177, 0, 1, 1,
0.5141317, -0.01909274, 0.1900199, 0.3019608, 0, 1, 1,
0.5156309, 1.050326, -0.6597185, 0.3098039, 0, 1, 1,
0.5192026, 0.1442575, 0.8111624, 0.3137255, 0, 1, 1,
0.5233569, 0.7627634, 1.710794, 0.3215686, 0, 1, 1,
0.523781, 0.03934813, 2.241926, 0.3254902, 0, 1, 1,
0.5256732, 1.24527, 0.8026751, 0.3333333, 0, 1, 1,
0.5279166, -0.3216707, 3.725393, 0.3372549, 0, 1, 1,
0.5287348, 0.9049532, 0.6108698, 0.345098, 0, 1, 1,
0.5324253, 1.369809, 0.1898314, 0.3490196, 0, 1, 1,
0.536155, 0.6500084, 1.660624, 0.3568628, 0, 1, 1,
0.5366566, -2.066174, 1.499522, 0.3607843, 0, 1, 1,
0.5380545, 0.32137, 0.4444878, 0.3686275, 0, 1, 1,
0.5444391, -0.6682908, 1.306945, 0.372549, 0, 1, 1,
0.5473397, 1.197308, 1.5186, 0.3803922, 0, 1, 1,
0.5485311, 0.4722746, 2.335574, 0.3843137, 0, 1, 1,
0.5489292, -0.2263232, 0.8337359, 0.3921569, 0, 1, 1,
0.5521157, -0.8465168, 2.155291, 0.3960784, 0, 1, 1,
0.5532894, -1.341815, 2.056372, 0.4039216, 0, 1, 1,
0.5562369, 0.3498046, 2.951583, 0.4117647, 0, 1, 1,
0.5563613, 0.9105509, 1.396573, 0.4156863, 0, 1, 1,
0.5595406, 1.072458, 0.5160524, 0.4235294, 0, 1, 1,
0.5623223, 0.1043446, 1.955172, 0.427451, 0, 1, 1,
0.5681055, 0.3605905, 0.6831063, 0.4352941, 0, 1, 1,
0.5709307, 0.8274934, -0.006838333, 0.4392157, 0, 1, 1,
0.5720393, 0.2629471, 0.2596527, 0.4470588, 0, 1, 1,
0.5736796, 0.5212714, 2.770448, 0.4509804, 0, 1, 1,
0.5747871, 0.1969057, 3.029281, 0.4588235, 0, 1, 1,
0.5756648, 0.4876709, 0.565371, 0.4627451, 0, 1, 1,
0.5792225, -1.384736, 2.66418, 0.4705882, 0, 1, 1,
0.5801561, 0.4890492, 1.67709, 0.4745098, 0, 1, 1,
0.5827387, 0.9367579, 1.005388, 0.4823529, 0, 1, 1,
0.5846506, -0.7950717, 2.699913, 0.4862745, 0, 1, 1,
0.585238, -3.771772, 3.695188, 0.4941176, 0, 1, 1,
0.5958993, 1.788743, 0.6694894, 0.5019608, 0, 1, 1,
0.6044313, -0.2125943, 2.677901, 0.5058824, 0, 1, 1,
0.6057882, -0.589077, 1.083025, 0.5137255, 0, 1, 1,
0.6090828, 0.6566595, 0.03942344, 0.5176471, 0, 1, 1,
0.6162965, -1.646472, 3.037863, 0.5254902, 0, 1, 1,
0.6193732, -1.43391, 3.494097, 0.5294118, 0, 1, 1,
0.6251763, 0.117128, -0.7859552, 0.5372549, 0, 1, 1,
0.6263523, -0.6894395, 2.567088, 0.5411765, 0, 1, 1,
0.6307035, -1.495922, 2.495349, 0.5490196, 0, 1, 1,
0.6353591, -0.08635356, 1.748806, 0.5529412, 0, 1, 1,
0.6375343, -0.2723689, -0.4633816, 0.5607843, 0, 1, 1,
0.6416745, -0.4387085, 0.6814486, 0.5647059, 0, 1, 1,
0.6417701, -0.7648436, 0.5716285, 0.572549, 0, 1, 1,
0.6447692, -0.2159138, 0.6602903, 0.5764706, 0, 1, 1,
0.6514821, -0.02165943, 0.6543462, 0.5843138, 0, 1, 1,
0.6522605, -0.9590715, 1.607541, 0.5882353, 0, 1, 1,
0.6527192, 0.1686401, -0.3584906, 0.5960785, 0, 1, 1,
0.6534032, -0.1618489, 0.1240302, 0.6039216, 0, 1, 1,
0.6607301, -0.4332188, 4.036564, 0.6078432, 0, 1, 1,
0.6607969, 0.1533196, 0.1462275, 0.6156863, 0, 1, 1,
0.6617723, 0.1299944, 2.619829, 0.6196079, 0, 1, 1,
0.6664137, -1.309153, 2.736305, 0.627451, 0, 1, 1,
0.6691051, 1.145639, 1.315057, 0.6313726, 0, 1, 1,
0.6732662, -0.4229345, 3.06855, 0.6392157, 0, 1, 1,
0.6737109, 1.579975, 0.8355631, 0.6431373, 0, 1, 1,
0.674198, 0.3838577, 2.034294, 0.6509804, 0, 1, 1,
0.677947, 0.05549633, 1.23697, 0.654902, 0, 1, 1,
0.6792155, -0.4400247, 1.296562, 0.6627451, 0, 1, 1,
0.6842381, -1.27698, 1.727964, 0.6666667, 0, 1, 1,
0.691942, 0.6750374, -0.2959115, 0.6745098, 0, 1, 1,
0.6938955, 1.76715, 0.7787515, 0.6784314, 0, 1, 1,
0.6942642, -0.3024343, 0.8789129, 0.6862745, 0, 1, 1,
0.6962423, 0.6042212, 0.6073288, 0.6901961, 0, 1, 1,
0.7015051, 0.2239504, 1.675375, 0.6980392, 0, 1, 1,
0.7037058, -1.209191, 1.454061, 0.7058824, 0, 1, 1,
0.7066569, -0.7426356, 1.691221, 0.7098039, 0, 1, 1,
0.7072479, 1.021049, 1.168026, 0.7176471, 0, 1, 1,
0.7159172, -1.098967, 3.366108, 0.7215686, 0, 1, 1,
0.7160866, -1.556379, 2.517606, 0.7294118, 0, 1, 1,
0.7174563, 0.6766702, 0.6694018, 0.7333333, 0, 1, 1,
0.720392, -0.4188655, 2.16397, 0.7411765, 0, 1, 1,
0.7219982, -0.4211823, 1.603083, 0.7450981, 0, 1, 1,
0.7222528, -0.410311, 3.271729, 0.7529412, 0, 1, 1,
0.7241217, -0.9401896, 3.416554, 0.7568628, 0, 1, 1,
0.7320167, 0.7536605, -0.4074943, 0.7647059, 0, 1, 1,
0.736337, 0.6542068, 1.65233, 0.7686275, 0, 1, 1,
0.7417061, 0.4927185, -0.07089964, 0.7764706, 0, 1, 1,
0.7424949, -0.6947146, 3.051005, 0.7803922, 0, 1, 1,
0.7442933, 0.1522029, 0.8626257, 0.7882353, 0, 1, 1,
0.7443966, 0.8470169, 0.660228, 0.7921569, 0, 1, 1,
0.7491574, 0.04707563, 1.518747, 0.8, 0, 1, 1,
0.7516254, 1.369389, 1.924312, 0.8078431, 0, 1, 1,
0.7521998, -2.076189, 1.537997, 0.8117647, 0, 1, 1,
0.7526012, 1.362384, 1.230539, 0.8196079, 0, 1, 1,
0.7529103, 1.002641, -0.165327, 0.8235294, 0, 1, 1,
0.7541991, -1.371254, 3.938299, 0.8313726, 0, 1, 1,
0.7597599, 1.543068, 0.5235283, 0.8352941, 0, 1, 1,
0.7747567, -1.524226, 3.714022, 0.8431373, 0, 1, 1,
0.7752182, -0.5560814, 1.481766, 0.8470588, 0, 1, 1,
0.7771802, -0.7469206, 1.641654, 0.854902, 0, 1, 1,
0.7773838, 1.427584, 0.6569585, 0.8588235, 0, 1, 1,
0.7791616, -0.2325605, 1.062995, 0.8666667, 0, 1, 1,
0.7796926, 0.2390338, -0.06272875, 0.8705882, 0, 1, 1,
0.7830296, 0.8723428, -0.4431812, 0.8784314, 0, 1, 1,
0.8006035, -0.09137135, 0.6848524, 0.8823529, 0, 1, 1,
0.8013304, 1.483087, 0.9144059, 0.8901961, 0, 1, 1,
0.8104741, -0.428694, 1.502024, 0.8941177, 0, 1, 1,
0.8135703, 0.4261366, 2.635763, 0.9019608, 0, 1, 1,
0.8268092, 0.3787736, -0.02132336, 0.9098039, 0, 1, 1,
0.8308479, 1.100543, 2.077159, 0.9137255, 0, 1, 1,
0.8339066, 1.004916, 0.07578909, 0.9215686, 0, 1, 1,
0.8353226, 1.177709, -0.03496266, 0.9254902, 0, 1, 1,
0.836028, 1.080092, 0.5809347, 0.9333333, 0, 1, 1,
0.8450747, -0.8824908, 3.292022, 0.9372549, 0, 1, 1,
0.8505379, -0.5214334, 1.780971, 0.945098, 0, 1, 1,
0.8561857, 0.627203, -0.09655341, 0.9490196, 0, 1, 1,
0.8564603, -0.03781968, 1.112783, 0.9568627, 0, 1, 1,
0.857655, -0.6943966, 0.8074003, 0.9607843, 0, 1, 1,
0.8577079, -1.146348, 2.240548, 0.9686275, 0, 1, 1,
0.8627397, 0.01650705, 0.4187948, 0.972549, 0, 1, 1,
0.8638775, 0.4214355, 1.011847, 0.9803922, 0, 1, 1,
0.867442, 1.209506, 1.827422, 0.9843137, 0, 1, 1,
0.868436, -0.2458374, 2.436971, 0.9921569, 0, 1, 1,
0.8684806, -0.2008238, 2.759468, 0.9960784, 0, 1, 1,
0.8689944, -1.895772, 3.597804, 1, 0, 0.9960784, 1,
0.8693691, -1.206578, 3.323346, 1, 0, 0.9882353, 1,
0.8708544, 0.2621012, 2.316389, 1, 0, 0.9843137, 1,
0.8766752, -0.9739369, 1.49254, 1, 0, 0.9764706, 1,
0.8830897, 0.998121, 1.971971, 1, 0, 0.972549, 1,
0.8859943, 0.2728296, 1.7416, 1, 0, 0.9647059, 1,
0.8874732, -1.745647, 1.472191, 1, 0, 0.9607843, 1,
0.8998375, 0.4882899, 1.323522, 1, 0, 0.9529412, 1,
0.9006416, 1.286868, 0.8605873, 1, 0, 0.9490196, 1,
0.9045997, -0.774817, 2.569829, 1, 0, 0.9411765, 1,
0.907617, -0.8628057, 3.000107, 1, 0, 0.9372549, 1,
0.9148116, 0.04607473, 2.531546, 1, 0, 0.9294118, 1,
0.9158773, -0.1130271, 1.940009, 1, 0, 0.9254902, 1,
0.9159082, 0.5597544, 1.29396, 1, 0, 0.9176471, 1,
0.9159452, -0.2121207, -0.2211882, 1, 0, 0.9137255, 1,
0.919119, -0.3206328, 0.5953497, 1, 0, 0.9058824, 1,
0.9209552, -0.1939566, 2.177751, 1, 0, 0.9019608, 1,
0.9242387, 2.557208, 1.028423, 1, 0, 0.8941177, 1,
0.9331774, 1.045649, 1.098728, 1, 0, 0.8862745, 1,
0.9353551, -0.3507439, 3.437238, 1, 0, 0.8823529, 1,
0.9354916, 2.220225, 0.6346848, 1, 0, 0.8745098, 1,
0.936637, -1.412192, 2.045596, 1, 0, 0.8705882, 1,
0.9387179, -0.4972062, 3.559922, 1, 0, 0.8627451, 1,
0.9396079, 0.7901475, 0.1337031, 1, 0, 0.8588235, 1,
0.9545099, 0.6795529, -0.5113332, 1, 0, 0.8509804, 1,
0.9606658, 1.438446, 0.1676147, 1, 0, 0.8470588, 1,
0.9616967, -0.77241, 1.879681, 1, 0, 0.8392157, 1,
0.9640155, 0.8554141, -0.2008754, 1, 0, 0.8352941, 1,
0.9704033, 1.158492, 0.4425491, 1, 0, 0.827451, 1,
0.9719486, -0.5847546, 3.285076, 1, 0, 0.8235294, 1,
0.9750146, 1.449197, -0.4299758, 1, 0, 0.8156863, 1,
0.9768388, -0.5362659, 2.19751, 1, 0, 0.8117647, 1,
0.9801365, 0.07556393, 2.350778, 1, 0, 0.8039216, 1,
0.982179, -3.835381, 2.969126, 1, 0, 0.7960784, 1,
0.9832079, -0.2540147, 1.429765, 1, 0, 0.7921569, 1,
0.9886363, 0.5488104, 2.025683, 1, 0, 0.7843137, 1,
0.9921576, -0.1040948, 1.397775, 1, 0, 0.7803922, 1,
1.001318, 0.0354014, -0.5110206, 1, 0, 0.772549, 1,
1.003626, 0.4163192, 1.198757, 1, 0, 0.7686275, 1,
1.014845, -0.3729952, 2.585074, 1, 0, 0.7607843, 1,
1.01636, 0.2647136, 0.0255264, 1, 0, 0.7568628, 1,
1.019273, 1.109894, 1.296632, 1, 0, 0.7490196, 1,
1.022776, 0.2428667, 2.064184, 1, 0, 0.7450981, 1,
1.027802, -0.4495497, 0.3510981, 1, 0, 0.7372549, 1,
1.032806, -0.1656023, 2.001725, 1, 0, 0.7333333, 1,
1.048096, 0.3583014, 2.780087, 1, 0, 0.7254902, 1,
1.051119, -1.094002, -0.01524576, 1, 0, 0.7215686, 1,
1.051451, 0.8850418, 0.9859036, 1, 0, 0.7137255, 1,
1.059019, -0.3267202, 1.92151, 1, 0, 0.7098039, 1,
1.071116, 0.3105262, 1.957358, 1, 0, 0.7019608, 1,
1.071455, -0.2961467, 1.362109, 1, 0, 0.6941177, 1,
1.073884, -0.4551116, 1.693485, 1, 0, 0.6901961, 1,
1.082171, 0.5402097, 1.51448, 1, 0, 0.682353, 1,
1.092586, 1.045525, 0.839081, 1, 0, 0.6784314, 1,
1.095091, 0.07427236, -0.5383614, 1, 0, 0.6705883, 1,
1.096839, -0.06821916, 2.868529, 1, 0, 0.6666667, 1,
1.097739, 1.920712, 2.164809, 1, 0, 0.6588235, 1,
1.107812, 0.07013078, 0.7401426, 1, 0, 0.654902, 1,
1.108322, -1.807049, 2.786904, 1, 0, 0.6470588, 1,
1.124715, 0.8795543, 1.515983, 1, 0, 0.6431373, 1,
1.128463, -0.4738366, 0.4640031, 1, 0, 0.6352941, 1,
1.150752, 0.5883999, 0.3689627, 1, 0, 0.6313726, 1,
1.159132, 1.190979, -0.468062, 1, 0, 0.6235294, 1,
1.170923, 1.926332, 0.8856049, 1, 0, 0.6196079, 1,
1.174018, -0.5743036, 2.547773, 1, 0, 0.6117647, 1,
1.180456, 1.382265, -0.2601438, 1, 0, 0.6078432, 1,
1.188995, 1.360531, 0.2555467, 1, 0, 0.6, 1,
1.190759, -0.03242181, 1.772255, 1, 0, 0.5921569, 1,
1.191112, -1.397992, 2.858191, 1, 0, 0.5882353, 1,
1.206702, 1.642927, -0.1153026, 1, 0, 0.5803922, 1,
1.207964, -1.377348, 1.130162, 1, 0, 0.5764706, 1,
1.209331, -1.366571, 2.343323, 1, 0, 0.5686275, 1,
1.210197, -0.4220205, 1.803507, 1, 0, 0.5647059, 1,
1.212348, 2.214999, -0.01014712, 1, 0, 0.5568628, 1,
1.214264, 0.7585041, 2.795727, 1, 0, 0.5529412, 1,
1.22705, 0.8027527, 0.859735, 1, 0, 0.5450981, 1,
1.230763, -0.9637787, 1.234668, 1, 0, 0.5411765, 1,
1.235046, -0.1958405, 2.867482, 1, 0, 0.5333334, 1,
1.238056, 0.4864243, 2.545446, 1, 0, 0.5294118, 1,
1.244966, 0.07505092, 0.4461126, 1, 0, 0.5215687, 1,
1.248741, 0.7077329, 1.742527, 1, 0, 0.5176471, 1,
1.25006, -1.349694, 1.473841, 1, 0, 0.509804, 1,
1.250712, 0.1172013, 3.816558, 1, 0, 0.5058824, 1,
1.254375, -2.240634, 3.279016, 1, 0, 0.4980392, 1,
1.254486, 0.514913, 1.710756, 1, 0, 0.4901961, 1,
1.263256, -3.172505, 1.459834, 1, 0, 0.4862745, 1,
1.264015, 0.6058846, 0.3699993, 1, 0, 0.4784314, 1,
1.268322, 0.1714638, 1.288862, 1, 0, 0.4745098, 1,
1.272112, 0.2236524, 0.5681636, 1, 0, 0.4666667, 1,
1.305115, 0.8874215, 0.1429359, 1, 0, 0.4627451, 1,
1.306082, 0.4043381, 1.833168, 1, 0, 0.454902, 1,
1.322525, -1.086917, 1.735886, 1, 0, 0.4509804, 1,
1.328501, -0.645594, 1.449155, 1, 0, 0.4431373, 1,
1.339384, 0.8147288, 0.8970945, 1, 0, 0.4392157, 1,
1.34854, 0.4312624, 0.8420884, 1, 0, 0.4313726, 1,
1.350475, -0.3196291, 2.485066, 1, 0, 0.427451, 1,
1.359879, -0.2948406, 2.020605, 1, 0, 0.4196078, 1,
1.380664, -1.139318, 2.306678, 1, 0, 0.4156863, 1,
1.383415, 1.4964, -0.02871324, 1, 0, 0.4078431, 1,
1.383675, 0.432662, 1.031982, 1, 0, 0.4039216, 1,
1.388457, 1.826432, -0.1411633, 1, 0, 0.3960784, 1,
1.421888, -1.361719, 3.159624, 1, 0, 0.3882353, 1,
1.438623, 0.1449992, 1.343404, 1, 0, 0.3843137, 1,
1.460524, -2.499865, 2.321782, 1, 0, 0.3764706, 1,
1.483361, 0.923988, 1.79803, 1, 0, 0.372549, 1,
1.488561, 0.4938864, 2.661499, 1, 0, 0.3647059, 1,
1.492448, 1.29478, 0.2076302, 1, 0, 0.3607843, 1,
1.498488, -2.438039, 2.138264, 1, 0, 0.3529412, 1,
1.506499, 0.5449861, 0.7421098, 1, 0, 0.3490196, 1,
1.511559, 0.1087672, 0.3139284, 1, 0, 0.3411765, 1,
1.513466, -0.8935024, 0.4697285, 1, 0, 0.3372549, 1,
1.516456, -1.057653, 5.270179, 1, 0, 0.3294118, 1,
1.518327, -0.002727944, 0.9254177, 1, 0, 0.3254902, 1,
1.523616, -0.2661791, -0.6991543, 1, 0, 0.3176471, 1,
1.54439, 0.1203842, 0.8794159, 1, 0, 0.3137255, 1,
1.576805, -1.276668, 2.451246, 1, 0, 0.3058824, 1,
1.581167, 0.5720989, 0.8211198, 1, 0, 0.2980392, 1,
1.585339, 0.6381403, 0.7646524, 1, 0, 0.2941177, 1,
1.589393, 0.6554618, -0.8858848, 1, 0, 0.2862745, 1,
1.590094, -2.371175, 2.99265, 1, 0, 0.282353, 1,
1.621262, 1.118764, 1.450232, 1, 0, 0.2745098, 1,
1.622494, -0.4625373, 2.72571, 1, 0, 0.2705882, 1,
1.62453, -0.1825963, 1.016483, 1, 0, 0.2627451, 1,
1.630037, 0.5859314, 1.515591, 1, 0, 0.2588235, 1,
1.632666, -1.452463, 1.855308, 1, 0, 0.2509804, 1,
1.639328, 1.305853, 1.096416, 1, 0, 0.2470588, 1,
1.646027, 0.9061606, 1.303076, 1, 0, 0.2392157, 1,
1.662511, -1.924246, 2.227173, 1, 0, 0.2352941, 1,
1.665063, 0.8855898, 1.632169, 1, 0, 0.227451, 1,
1.673499, -0.7000868, 0.9160226, 1, 0, 0.2235294, 1,
1.717661, 0.9200814, 1.536395, 1, 0, 0.2156863, 1,
1.732876, 1.643587, 0.5445179, 1, 0, 0.2117647, 1,
1.737396, 0.08346586, 1.201564, 1, 0, 0.2039216, 1,
1.765779, 0.4733882, 0.09406254, 1, 0, 0.1960784, 1,
1.770319, 0.5349045, -0.1616261, 1, 0, 0.1921569, 1,
1.781654, 3.531645, -0.5775422, 1, 0, 0.1843137, 1,
1.820094, -0.526352, 0.1841293, 1, 0, 0.1803922, 1,
1.824793, 0.4517564, -0.8004808, 1, 0, 0.172549, 1,
1.837623, -1.023167, 1.23889, 1, 0, 0.1686275, 1,
1.877895, 2.138578, 1.410795, 1, 0, 0.1607843, 1,
1.878436, 0.02533349, 0.8226498, 1, 0, 0.1568628, 1,
1.898491, -1.495057, 2.468233, 1, 0, 0.1490196, 1,
1.916908, 0.4306283, -0.2132748, 1, 0, 0.145098, 1,
1.947106, -0.2913553, 3.607427, 1, 0, 0.1372549, 1,
1.957509, -0.7321848, 0.1748285, 1, 0, 0.1333333, 1,
1.9706, -0.2292597, 1.001243, 1, 0, 0.1254902, 1,
1.973438, -0.9324423, 1.652994, 1, 0, 0.1215686, 1,
1.982159, 1.302549, 0.5003098, 1, 0, 0.1137255, 1,
2.018218, 0.5372735, 2.094155, 1, 0, 0.1098039, 1,
2.037647, 0.09084612, 0.3574499, 1, 0, 0.1019608, 1,
2.064323, -0.1008474, 2.286451, 1, 0, 0.09411765, 1,
2.086251, -0.4811571, 3.369645, 1, 0, 0.09019608, 1,
2.101864, -0.4679749, 2.433286, 1, 0, 0.08235294, 1,
2.10724, -1.237761, 3.16698, 1, 0, 0.07843138, 1,
2.128026, -0.08569356, -0.4841967, 1, 0, 0.07058824, 1,
2.147862, -0.7430413, 1.880235, 1, 0, 0.06666667, 1,
2.148425, -1.213035, 3.977716, 1, 0, 0.05882353, 1,
2.166266, 1.323221, -0.2221534, 1, 0, 0.05490196, 1,
2.255595, -0.2083622, 1.246889, 1, 0, 0.04705882, 1,
2.306859, 2.482258, -0.680396, 1, 0, 0.04313726, 1,
2.383769, 0.6909361, 1.493014, 1, 0, 0.03529412, 1,
2.515452, -0.135215, 2.389772, 1, 0, 0.03137255, 1,
2.536633, 0.3400863, 1.396858, 1, 0, 0.02352941, 1,
2.62216, 1.351833, 1.493122, 1, 0, 0.01960784, 1,
2.833436, 0.8152865, -0.003530707, 1, 0, 0.01176471, 1,
2.977831, 1.064775, 1.328079, 1, 0, 0.007843138, 1
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
-0.2023124, -5.088931, -7.486081, 0, -0.5, 0.5, 0.5,
-0.2023124, -5.088931, -7.486081, 1, -0.5, 0.5, 0.5,
-0.2023124, -5.088931, -7.486081, 1, 1.5, 0.5, 0.5,
-0.2023124, -5.088931, -7.486081, 0, 1.5, 0.5, 0.5
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
-4.460525, -0.1375923, -7.486081, 0, -0.5, 0.5, 0.5,
-4.460525, -0.1375923, -7.486081, 1, -0.5, 0.5, 0.5,
-4.460525, -0.1375923, -7.486081, 1, 1.5, 0.5, 0.5,
-4.460525, -0.1375923, -7.486081, 0, 1.5, 0.5, 0.5
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
-4.460525, -5.088931, -0.1835449, 0, -0.5, 0.5, 0.5,
-4.460525, -5.088931, -0.1835449, 1, -0.5, 0.5, 0.5,
-4.460525, -5.088931, -0.1835449, 1, 1.5, 0.5, 0.5,
-4.460525, -5.088931, -0.1835449, 0, 1.5, 0.5, 0.5
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
-3, -3.946314, -5.80088,
2, -3.946314, -5.80088,
-3, -3.946314, -5.80088,
-3, -4.136751, -6.081747,
-2, -3.946314, -5.80088,
-2, -4.136751, -6.081747,
-1, -3.946314, -5.80088,
-1, -4.136751, -6.081747,
0, -3.946314, -5.80088,
0, -4.136751, -6.081747,
1, -3.946314, -5.80088,
1, -4.136751, -6.081747,
2, -3.946314, -5.80088,
2, -4.136751, -6.081747
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
-3, -4.517623, -6.643481, 0, -0.5, 0.5, 0.5,
-3, -4.517623, -6.643481, 1, -0.5, 0.5, 0.5,
-3, -4.517623, -6.643481, 1, 1.5, 0.5, 0.5,
-3, -4.517623, -6.643481, 0, 1.5, 0.5, 0.5,
-2, -4.517623, -6.643481, 0, -0.5, 0.5, 0.5,
-2, -4.517623, -6.643481, 1, -0.5, 0.5, 0.5,
-2, -4.517623, -6.643481, 1, 1.5, 0.5, 0.5,
-2, -4.517623, -6.643481, 0, 1.5, 0.5, 0.5,
-1, -4.517623, -6.643481, 0, -0.5, 0.5, 0.5,
-1, -4.517623, -6.643481, 1, -0.5, 0.5, 0.5,
-1, -4.517623, -6.643481, 1, 1.5, 0.5, 0.5,
-1, -4.517623, -6.643481, 0, 1.5, 0.5, 0.5,
0, -4.517623, -6.643481, 0, -0.5, 0.5, 0.5,
0, -4.517623, -6.643481, 1, -0.5, 0.5, 0.5,
0, -4.517623, -6.643481, 1, 1.5, 0.5, 0.5,
0, -4.517623, -6.643481, 0, 1.5, 0.5, 0.5,
1, -4.517623, -6.643481, 0, -0.5, 0.5, 0.5,
1, -4.517623, -6.643481, 1, -0.5, 0.5, 0.5,
1, -4.517623, -6.643481, 1, 1.5, 0.5, 0.5,
1, -4.517623, -6.643481, 0, 1.5, 0.5, 0.5,
2, -4.517623, -6.643481, 0, -0.5, 0.5, 0.5,
2, -4.517623, -6.643481, 1, -0.5, 0.5, 0.5,
2, -4.517623, -6.643481, 1, 1.5, 0.5, 0.5,
2, -4.517623, -6.643481, 0, 1.5, 0.5, 0.5
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
-3.47786, -2, -5.80088,
-3.47786, 2, -5.80088,
-3.47786, -2, -5.80088,
-3.641638, -2, -6.081747,
-3.47786, 0, -5.80088,
-3.641638, 0, -6.081747,
-3.47786, 2, -5.80088,
-3.641638, 2, -6.081747
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
"0",
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
-3.969192, -2, -6.643481, 0, -0.5, 0.5, 0.5,
-3.969192, -2, -6.643481, 1, -0.5, 0.5, 0.5,
-3.969192, -2, -6.643481, 1, 1.5, 0.5, 0.5,
-3.969192, -2, -6.643481, 0, 1.5, 0.5, 0.5,
-3.969192, 0, -6.643481, 0, -0.5, 0.5, 0.5,
-3.969192, 0, -6.643481, 1, -0.5, 0.5, 0.5,
-3.969192, 0, -6.643481, 1, 1.5, 0.5, 0.5,
-3.969192, 0, -6.643481, 0, 1.5, 0.5, 0.5,
-3.969192, 2, -6.643481, 0, -0.5, 0.5, 0.5,
-3.969192, 2, -6.643481, 1, -0.5, 0.5, 0.5,
-3.969192, 2, -6.643481, 1, 1.5, 0.5, 0.5,
-3.969192, 2, -6.643481, 0, 1.5, 0.5, 0.5
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
-3.47786, -3.946314, -4,
-3.47786, -3.946314, 4,
-3.47786, -3.946314, -4,
-3.641638, -4.136751, -4,
-3.47786, -3.946314, -2,
-3.641638, -4.136751, -2,
-3.47786, -3.946314, 0,
-3.641638, -4.136751, 0,
-3.47786, -3.946314, 2,
-3.641638, -4.136751, 2,
-3.47786, -3.946314, 4,
-3.641638, -4.136751, 4
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
-3.969192, -4.517623, -4, 0, -0.5, 0.5, 0.5,
-3.969192, -4.517623, -4, 1, -0.5, 0.5, 0.5,
-3.969192, -4.517623, -4, 1, 1.5, 0.5, 0.5,
-3.969192, -4.517623, -4, 0, 1.5, 0.5, 0.5,
-3.969192, -4.517623, -2, 0, -0.5, 0.5, 0.5,
-3.969192, -4.517623, -2, 1, -0.5, 0.5, 0.5,
-3.969192, -4.517623, -2, 1, 1.5, 0.5, 0.5,
-3.969192, -4.517623, -2, 0, 1.5, 0.5, 0.5,
-3.969192, -4.517623, 0, 0, -0.5, 0.5, 0.5,
-3.969192, -4.517623, 0, 1, -0.5, 0.5, 0.5,
-3.969192, -4.517623, 0, 1, 1.5, 0.5, 0.5,
-3.969192, -4.517623, 0, 0, 1.5, 0.5, 0.5,
-3.969192, -4.517623, 2, 0, -0.5, 0.5, 0.5,
-3.969192, -4.517623, 2, 1, -0.5, 0.5, 0.5,
-3.969192, -4.517623, 2, 1, 1.5, 0.5, 0.5,
-3.969192, -4.517623, 2, 0, 1.5, 0.5, 0.5,
-3.969192, -4.517623, 4, 0, -0.5, 0.5, 0.5,
-3.969192, -4.517623, 4, 1, -0.5, 0.5, 0.5,
-3.969192, -4.517623, 4, 1, 1.5, 0.5, 0.5,
-3.969192, -4.517623, 4, 0, 1.5, 0.5, 0.5
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
-3.47786, -3.946314, -5.80088,
-3.47786, 3.67113, -5.80088,
-3.47786, -3.946314, 5.433791,
-3.47786, 3.67113, 5.433791,
-3.47786, -3.946314, -5.80088,
-3.47786, -3.946314, 5.433791,
-3.47786, 3.67113, -5.80088,
-3.47786, 3.67113, 5.433791,
-3.47786, -3.946314, -5.80088,
3.073236, -3.946314, -5.80088,
-3.47786, -3.946314, 5.433791,
3.073236, -3.946314, 5.433791,
-3.47786, 3.67113, -5.80088,
3.073236, 3.67113, -5.80088,
-3.47786, 3.67113, 5.433791,
3.073236, 3.67113, 5.433791,
3.073236, -3.946314, -5.80088,
3.073236, 3.67113, -5.80088,
3.073236, -3.946314, 5.433791,
3.073236, 3.67113, 5.433791,
3.073236, -3.946314, -5.80088,
3.073236, -3.946314, 5.433791,
3.073236, 3.67113, -5.80088,
3.073236, 3.67113, 5.433791
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
var radius = 8.048066;
var distance = 35.80676;
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
mvMatrix.translate( 0.2023124, 0.1375923, 0.1835449 );
mvMatrix.scale( 1.328286, 1.142342, 0.7745422 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.80676);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Butanoate<-read.table("Butanoate.xyz")
```

```
## Error in read.table("Butanoate.xyz"): no lines available in input
```

```r
x<-Butanoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Butanoate' not found
```

```r
y<-Butanoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Butanoate' not found
```

```r
z<-Butanoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Butanoate' not found
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
-3.382456, -1.586048, -2.617949, 0, 0, 1, 1, 1,
-2.871903, -0.8905699, -1.244, 1, 0, 0, 1, 1,
-2.837349, -0.6253497, -3.192662, 1, 0, 0, 1, 1,
-2.685908, -0.3136505, -2.275559, 1, 0, 0, 1, 1,
-2.562106, 0.659247, -0.110224, 1, 0, 0, 1, 1,
-2.531316, 1.346878, -0.9992614, 1, 0, 0, 1, 1,
-2.46779, 0.7653574, 0.8778229, 0, 0, 0, 1, 1,
-2.421354, 0.01673909, -2.469369, 0, 0, 0, 1, 1,
-2.420556, 0.1678372, -0.03868785, 0, 0, 0, 1, 1,
-2.418039, -1.855335, -3.773072, 0, 0, 0, 1, 1,
-2.377566, 0.05055981, -2.814178, 0, 0, 0, 1, 1,
-2.312756, 0.4691375, -0.9734949, 0, 0, 0, 1, 1,
-2.300393, 0.6769711, -1.590529, 0, 0, 0, 1, 1,
-2.285578, 0.5768862, -0.3517118, 1, 1, 1, 1, 1,
-2.28199, 1.753638, -0.3028683, 1, 1, 1, 1, 1,
-2.276507, -0.719698, -2.465449, 1, 1, 1, 1, 1,
-2.246899, 0.417261, -1.73514, 1, 1, 1, 1, 1,
-2.212931, 1.667779, -0.5092493, 1, 1, 1, 1, 1,
-2.201437, -0.4353143, -1.092263, 1, 1, 1, 1, 1,
-2.198012, 0.4973921, -2.636879, 1, 1, 1, 1, 1,
-2.195436, 0.6497945, -2.320966, 1, 1, 1, 1, 1,
-2.162059, -0.8090823, -0.2554069, 1, 1, 1, 1, 1,
-2.153124, -0.6900409, 0.8425993, 1, 1, 1, 1, 1,
-2.145069, -2.295831, -1.954927, 1, 1, 1, 1, 1,
-2.144397, -0.06473145, -1.462139, 1, 1, 1, 1, 1,
-2.111621, -1.464886, -1.15037, 1, 1, 1, 1, 1,
-2.095092, -0.5042896, -2.091649, 1, 1, 1, 1, 1,
-2.088507, 0.2068539, 0.3684384, 1, 1, 1, 1, 1,
-2.02969, -0.3828783, -1.459405, 0, 0, 1, 1, 1,
-2.02445, -2.123001, -3.927425, 1, 0, 0, 1, 1,
-2.00871, 0.9625046, -2.508921, 1, 0, 0, 1, 1,
-1.998195, -1.426137, -4.712805, 1, 0, 0, 1, 1,
-1.994666, 0.455477, -0.9949751, 1, 0, 0, 1, 1,
-1.994098, 0.7777021, -1.663879, 1, 0, 0, 1, 1,
-1.977033, 1.613906, -0.2090467, 0, 0, 0, 1, 1,
-1.976026, 0.238539, -1.566236, 0, 0, 0, 1, 1,
-1.971263, 0.121809, -1.033689, 0, 0, 0, 1, 1,
-1.932384, -0.2611458, -0.5878341, 0, 0, 0, 1, 1,
-1.930521, -0.4872056, -3.135299, 0, 0, 0, 1, 1,
-1.922008, 0.1867317, -1.927446, 0, 0, 0, 1, 1,
-1.91151, -0.1393653, -2.201174, 0, 0, 0, 1, 1,
-1.904103, 1.131097, 0.1764252, 1, 1, 1, 1, 1,
-1.864519, -0.3998663, -3.202019, 1, 1, 1, 1, 1,
-1.862803, -0.7810665, -1.675434, 1, 1, 1, 1, 1,
-1.853882, -0.6630586, -1.155659, 1, 1, 1, 1, 1,
-1.828289, 0.1086803, -0.8969849, 1, 1, 1, 1, 1,
-1.819689, 0.5447662, 0.5012826, 1, 1, 1, 1, 1,
-1.800128, 1.400781, -2.124532, 1, 1, 1, 1, 1,
-1.791799, 2.485124, -1.445323, 1, 1, 1, 1, 1,
-1.785157, -0.2007339, -1.832595, 1, 1, 1, 1, 1,
-1.78049, -0.5822542, -1.607285, 1, 1, 1, 1, 1,
-1.777042, -0.2514569, -1.37841, 1, 1, 1, 1, 1,
-1.757016, 1.235207, -1.129126, 1, 1, 1, 1, 1,
-1.735712, 1.357285, 0.9494339, 1, 1, 1, 1, 1,
-1.70844, 0.09271733, -2.442555, 1, 1, 1, 1, 1,
-1.706578, 0.8210949, -1.321942, 1, 1, 1, 1, 1,
-1.703979, -0.1872052, 0.007174842, 0, 0, 1, 1, 1,
-1.684927, 2.066139, -2.528656, 1, 0, 0, 1, 1,
-1.666584, 0.4124887, -1.014961, 1, 0, 0, 1, 1,
-1.663694, -0.04498817, -3.167015, 1, 0, 0, 1, 1,
-1.660867, 0.4495597, -1.486184, 1, 0, 0, 1, 1,
-1.65945, -0.3163213, -2.329417, 1, 0, 0, 1, 1,
-1.659, 0.4032814, -2.2079, 0, 0, 0, 1, 1,
-1.649285, -0.6566609, -2.694307, 0, 0, 0, 1, 1,
-1.64641, -2.338912, -2.401599, 0, 0, 0, 1, 1,
-1.642422, -1.729303, -0.476352, 0, 0, 0, 1, 1,
-1.641629, -0.2090469, -1.793313, 0, 0, 0, 1, 1,
-1.627488, 0.6758044, 0.1228903, 0, 0, 0, 1, 1,
-1.612736, 0.3416616, -1.078111, 0, 0, 0, 1, 1,
-1.593221, -1.004697, -2.905544, 1, 1, 1, 1, 1,
-1.591599, 0.0051626, -1.401089, 1, 1, 1, 1, 1,
-1.555201, 1.737193, 0.9893916, 1, 1, 1, 1, 1,
-1.55265, 1.300395, 0.6825865, 1, 1, 1, 1, 1,
-1.544767, -1.340485, -2.211754, 1, 1, 1, 1, 1,
-1.541541, 0.7761481, -0.4614395, 1, 1, 1, 1, 1,
-1.540076, 0.49472, -2.264051, 1, 1, 1, 1, 1,
-1.52346, 3.531615, 0.6344696, 1, 1, 1, 1, 1,
-1.500925, -1.608601, -1.313987, 1, 1, 1, 1, 1,
-1.495612, -0.2123942, -1.108734, 1, 1, 1, 1, 1,
-1.477757, 0.7780088, -2.486034, 1, 1, 1, 1, 1,
-1.446192, 1.324674, -1.230599, 1, 1, 1, 1, 1,
-1.440347, 0.2935292, -1.30043, 1, 1, 1, 1, 1,
-1.421119, -0.23811, -1.559243, 1, 1, 1, 1, 1,
-1.410782, -0.2304696, -0.5530691, 1, 1, 1, 1, 1,
-1.393461, -0.06403884, -0.05033419, 0, 0, 1, 1, 1,
-1.381343, -0.07442395, -0.2742327, 1, 0, 0, 1, 1,
-1.380115, 0.3851721, -2.046182, 1, 0, 0, 1, 1,
-1.370611, -0.26137, -1.66272, 1, 0, 0, 1, 1,
-1.366943, 0.4324113, -1.500538, 1, 0, 0, 1, 1,
-1.366197, 0.5193191, -1.200953, 1, 0, 0, 1, 1,
-1.366105, -0.5165474, -1.221841, 0, 0, 0, 1, 1,
-1.346374, 0.9683939, -1.518175, 0, 0, 0, 1, 1,
-1.336891, 0.6891527, -3.117855, 0, 0, 0, 1, 1,
-1.325956, -0.8376831, -0.7852812, 0, 0, 0, 1, 1,
-1.320595, 1.042074, -1.385005, 0, 0, 0, 1, 1,
-1.311326, 0.4309794, -1.42466, 0, 0, 0, 1, 1,
-1.310933, -1.402089, -2.83307, 0, 0, 0, 1, 1,
-1.292534, -0.4764544, -2.712558, 1, 1, 1, 1, 1,
-1.283125, -1.035009, -1.97468, 1, 1, 1, 1, 1,
-1.280198, 0.8494155, -1.79045, 1, 1, 1, 1, 1,
-1.272914, -0.8790322, -1.309266, 1, 1, 1, 1, 1,
-1.271445, 1.799661, -1.827342, 1, 1, 1, 1, 1,
-1.2608, 0.02576155, -0.6841289, 1, 1, 1, 1, 1,
-1.250531, -0.9051051, -3.276668, 1, 1, 1, 1, 1,
-1.245906, -0.1628292, -2.476787, 1, 1, 1, 1, 1,
-1.245108, -0.09061293, -2.815151, 1, 1, 1, 1, 1,
-1.231694, -0.5048535, -1.007905, 1, 1, 1, 1, 1,
-1.230886, 0.2769555, -0.6208246, 1, 1, 1, 1, 1,
-1.229093, -0.3079177, -2.133619, 1, 1, 1, 1, 1,
-1.224283, 0.7571493, 0.09100799, 1, 1, 1, 1, 1,
-1.221497, -0.670464, -1.919526, 1, 1, 1, 1, 1,
-1.214993, -0.8697472, -2.486818, 1, 1, 1, 1, 1,
-1.209656, 0.617151, -0.6105843, 0, 0, 1, 1, 1,
-1.207958, 1.629425, -1.516666, 1, 0, 0, 1, 1,
-1.202512, -1.375366, -2.716093, 1, 0, 0, 1, 1,
-1.198128, -1.267044, -1.507553, 1, 0, 0, 1, 1,
-1.193647, 0.1020202, -1.864266, 1, 0, 0, 1, 1,
-1.191419, -0.6552776, -3.132371, 1, 0, 0, 1, 1,
-1.189312, 0.6256874, -0.7595851, 0, 0, 0, 1, 1,
-1.176746, 0.287413, -0.934139, 0, 0, 0, 1, 1,
-1.161328, 0.9501908, 0.9917985, 0, 0, 0, 1, 1,
-1.158448, 0.007155373, -1.617395, 0, 0, 0, 1, 1,
-1.148036, -0.3398116, -2.023879, 0, 0, 0, 1, 1,
-1.147229, 1.031665, -0.3040874, 0, 0, 0, 1, 1,
-1.128866, -0.5821816, 0.09263542, 0, 0, 0, 1, 1,
-1.128773, -0.1596226, -2.170089, 1, 1, 1, 1, 1,
-1.118959, 1.413167, -0.8947412, 1, 1, 1, 1, 1,
-1.115194, 1.086403, -1.57973, 1, 1, 1, 1, 1,
-1.101846, 0.1517733, 0.6833135, 1, 1, 1, 1, 1,
-1.098254, 0.1454606, -0.9749423, 1, 1, 1, 1, 1,
-1.091832, -0.8920574, -2.144449, 1, 1, 1, 1, 1,
-1.08904, 0.8609279, -1.576727, 1, 1, 1, 1, 1,
-1.082488, 0.4070174, -1.940064, 1, 1, 1, 1, 1,
-1.076007, -0.02409843, -2.401617, 1, 1, 1, 1, 1,
-1.071865, -1.067036, -1.255675, 1, 1, 1, 1, 1,
-1.056756, 0.4123636, -1.267803, 1, 1, 1, 1, 1,
-1.053555, 0.9983559, 1.245518, 1, 1, 1, 1, 1,
-1.048012, 0.3879849, -1.091687, 1, 1, 1, 1, 1,
-1.027112, -0.6503574, -3.161119, 1, 1, 1, 1, 1,
-1.025782, 1.709789, -0.4195393, 1, 1, 1, 1, 1,
-1.021368, -0.4232971, -2.946594, 0, 0, 1, 1, 1,
-1.018472, 1.309297, 0.3252744, 1, 0, 0, 1, 1,
-1.001949, 0.6150297, -2.128559, 1, 0, 0, 1, 1,
-1.001384, -0.1527009, -1.886646, 1, 0, 0, 1, 1,
-0.9973743, -0.6419708, -1.727117, 1, 0, 0, 1, 1,
-0.9963108, 0.1913534, -1.331762, 1, 0, 0, 1, 1,
-0.9954955, -0.2613267, -1.280849, 0, 0, 0, 1, 1,
-0.9909024, 1.71652, 0.6808253, 0, 0, 0, 1, 1,
-0.9879994, -1.755697, -3.725821, 0, 0, 0, 1, 1,
-0.987277, -1.45295, -1.865643, 0, 0, 0, 1, 1,
-0.9871238, -0.2139358, -3.283663, 0, 0, 0, 1, 1,
-0.9750695, 1.205609, -0.9512065, 0, 0, 0, 1, 1,
-0.9719856, 1.750992, -0.3187049, 0, 0, 0, 1, 1,
-0.9471215, 0.4644257, -1.293554, 1, 1, 1, 1, 1,
-0.9387891, 3.088584, 0.9895058, 1, 1, 1, 1, 1,
-0.9383096, 0.3973901, -1.375008, 1, 1, 1, 1, 1,
-0.9361197, 0.06519657, -1.325625, 1, 1, 1, 1, 1,
-0.9345944, -0.6180829, -1.097453, 1, 1, 1, 1, 1,
-0.9239419, 1.597418, -0.1038869, 1, 1, 1, 1, 1,
-0.9214249, 0.6244536, 1.879473, 1, 1, 1, 1, 1,
-0.9185322, 0.4935741, -1.28293, 1, 1, 1, 1, 1,
-0.9165645, 0.4788636, -0.4999315, 1, 1, 1, 1, 1,
-0.9143691, 1.165913, -0.5874748, 1, 1, 1, 1, 1,
-0.9118369, 1.531326, -2.206428, 1, 1, 1, 1, 1,
-0.9018022, 0.2356635, -1.26591, 1, 1, 1, 1, 1,
-0.9005743, -0.5733724, -3.576881, 1, 1, 1, 1, 1,
-0.899815, 0.007653798, -1.799374, 1, 1, 1, 1, 1,
-0.8938422, -0.4796923, -3.116556, 1, 1, 1, 1, 1,
-0.8936682, 0.3825234, -3.08418, 0, 0, 1, 1, 1,
-0.8932572, 3.003114, 0.5306225, 1, 0, 0, 1, 1,
-0.8928409, -0.6805686, -2.47494, 1, 0, 0, 1, 1,
-0.8866659, -1.244041, -1.7381, 1, 0, 0, 1, 1,
-0.8767179, 0.3727439, -0.726674, 1, 0, 0, 1, 1,
-0.8713265, -0.9843409, -5.359351, 1, 0, 0, 1, 1,
-0.87107, -0.9942999, -2.488935, 0, 0, 0, 1, 1,
-0.8701901, -0.1153894, -1.58325, 0, 0, 0, 1, 1,
-0.8678051, -0.00418253, -1.366833, 0, 0, 0, 1, 1,
-0.8657121, 0.8215818, 0.1279823, 0, 0, 0, 1, 1,
-0.858806, 0.8877299, -0.9409487, 0, 0, 0, 1, 1,
-0.8582122, -2.202165, -2.272954, 0, 0, 0, 1, 1,
-0.8496415, 1.341194, -1.178031, 0, 0, 0, 1, 1,
-0.8487964, 0.8555384, -0.2982476, 1, 1, 1, 1, 1,
-0.8481868, 0.6440304, -0.1695045, 1, 1, 1, 1, 1,
-0.8432489, -0.3104048, -0.1210854, 1, 1, 1, 1, 1,
-0.8392858, -1.570684, -2.538971, 1, 1, 1, 1, 1,
-0.8319624, -0.4905275, -2.48411, 1, 1, 1, 1, 1,
-0.829273, 2.013901, -0.8817922, 1, 1, 1, 1, 1,
-0.8288319, 0.01496807, -0.3437171, 1, 1, 1, 1, 1,
-0.8282898, -1.254203, -4.787887, 1, 1, 1, 1, 1,
-0.8280038, -1.30205, -5.350905, 1, 1, 1, 1, 1,
-0.8228297, -0.06504808, -2.297224, 1, 1, 1, 1, 1,
-0.8187873, 0.04571898, -0.4748007, 1, 1, 1, 1, 1,
-0.8171554, 0.02848343, -0.7318056, 1, 1, 1, 1, 1,
-0.811802, -0.232858, -2.053501, 1, 1, 1, 1, 1,
-0.8044953, 1.084374, -1.867979, 1, 1, 1, 1, 1,
-0.8025332, 0.2259742, -1.833062, 1, 1, 1, 1, 1,
-0.7926708, 0.5354375, -2.140258, 0, 0, 1, 1, 1,
-0.7772593, 0.9503588, -0.1348268, 1, 0, 0, 1, 1,
-0.7757742, -0.8153171, -2.148696, 1, 0, 0, 1, 1,
-0.7750109, 1.360267, -0.7049684, 1, 0, 0, 1, 1,
-0.7700773, -0.8489203, -3.130359, 1, 0, 0, 1, 1,
-0.7695684, 0.4275388, -1.880584, 1, 0, 0, 1, 1,
-0.7666432, 0.8635704, -1.037204, 0, 0, 0, 1, 1,
-0.761722, 0.3321517, -1.52255, 0, 0, 0, 1, 1,
-0.75964, 1.131253, -2.158468, 0, 0, 0, 1, 1,
-0.7595402, 0.4392062, -2.095052, 0, 0, 0, 1, 1,
-0.7589812, -0.4275926, -1.75424, 0, 0, 0, 1, 1,
-0.7544206, 0.7029628, -1.184323, 0, 0, 0, 1, 1,
-0.7543268, 0.2399201, -1.098333, 0, 0, 0, 1, 1,
-0.750615, 1.020837, -0.6769601, 1, 1, 1, 1, 1,
-0.7477649, -0.2410843, -2.241938, 1, 1, 1, 1, 1,
-0.7471678, -1.165255, -2.089669, 1, 1, 1, 1, 1,
-0.7450146, -0.6558659, -2.726149, 1, 1, 1, 1, 1,
-0.7424938, -0.536088, -2.25462, 1, 1, 1, 1, 1,
-0.7399112, 1.129882, -0.7772255, 1, 1, 1, 1, 1,
-0.7383572, 2.042321, -0.8796044, 1, 1, 1, 1, 1,
-0.7289709, 1.733988, 0.5418372, 1, 1, 1, 1, 1,
-0.7236229, -0.376642, -2.462986, 1, 1, 1, 1, 1,
-0.7184756, 0.04188451, -1.782243, 1, 1, 1, 1, 1,
-0.7174246, 0.6737016, 0.178911, 1, 1, 1, 1, 1,
-0.7171146, -1.924506, -4.066528, 1, 1, 1, 1, 1,
-0.715896, 2.283613, -0.1323947, 1, 1, 1, 1, 1,
-0.7151155, -0.05639071, -2.716637, 1, 1, 1, 1, 1,
-0.7136331, 0.677709, 1.974636, 1, 1, 1, 1, 1,
-0.7099141, -0.8183313, -2.574205, 0, 0, 1, 1, 1,
-0.7087246, 1.187554, -0.3630463, 1, 0, 0, 1, 1,
-0.705663, -0.1333915, -1.105884, 1, 0, 0, 1, 1,
-0.7028722, 0.252998, -2.244356, 1, 0, 0, 1, 1,
-0.7026302, 0.5446112, -2.5837, 1, 0, 0, 1, 1,
-0.6997978, 0.8901001, 0.024692, 1, 0, 0, 1, 1,
-0.6994241, -1.200983, -1.212071, 0, 0, 0, 1, 1,
-0.6974124, 0.4713933, -0.881629, 0, 0, 0, 1, 1,
-0.6948774, 1.401916, -2.481171, 0, 0, 0, 1, 1,
-0.6928985, 0.1713306, -1.134879, 0, 0, 0, 1, 1,
-0.6927637, -0.5580173, -2.203982, 0, 0, 0, 1, 1,
-0.6915243, 0.2241557, -1.530316, 0, 0, 0, 1, 1,
-0.6902176, 0.3659582, -1.127705, 0, 0, 0, 1, 1,
-0.6875206, -0.4889846, -1.110905, 1, 1, 1, 1, 1,
-0.6833895, 0.5861071, -0.9294684, 1, 1, 1, 1, 1,
-0.6753522, 0.1148111, -1.902294, 1, 1, 1, 1, 1,
-0.6749804, -0.01414506, -1.404781, 1, 1, 1, 1, 1,
-0.6727338, 0.07614029, -1.119736, 1, 1, 1, 1, 1,
-0.6715316, 1.320242, -0.5594046, 1, 1, 1, 1, 1,
-0.6698949, 0.4319839, -0.2060263, 1, 1, 1, 1, 1,
-0.6683791, 1.000396, -0.7428151, 1, 1, 1, 1, 1,
-0.6666743, 0.9087192, -0.1275038, 1, 1, 1, 1, 1,
-0.6659228, 0.6813192, -0.8329468, 1, 1, 1, 1, 1,
-0.6635717, 1.041308, 0.8338543, 1, 1, 1, 1, 1,
-0.6592604, 0.2099482, -2.314825, 1, 1, 1, 1, 1,
-0.6592027, 0.2776392, -2.447729, 1, 1, 1, 1, 1,
-0.6585613, -1.022425, -1.5783, 1, 1, 1, 1, 1,
-0.6560725, -0.6298761, -2.574318, 1, 1, 1, 1, 1,
-0.6557828, -1.791914, -2.298563, 0, 0, 1, 1, 1,
-0.6539735, 1.043744, -0.001479872, 1, 0, 0, 1, 1,
-0.6440434, 0.3346459, -2.098296, 1, 0, 0, 1, 1,
-0.6400289, -0.4371011, -2.56747, 1, 0, 0, 1, 1,
-0.6311598, -0.2080951, -4.087589, 1, 0, 0, 1, 1,
-0.628015, 0.1794714, -1.145944, 1, 0, 0, 1, 1,
-0.624513, -0.3824674, -2.862517, 0, 0, 0, 1, 1,
-0.6235862, 0.04586827, -2.033671, 0, 0, 0, 1, 1,
-0.6078424, -2.884045, -2.444555, 0, 0, 0, 1, 1,
-0.6077604, -0.3610814, -0.5969003, 0, 0, 0, 1, 1,
-0.6074089, -0.4377742, -1.418225, 0, 0, 0, 1, 1,
-0.6073657, -1.227353, -3.507672, 0, 0, 0, 1, 1,
-0.6067612, -1.048472, -2.868458, 0, 0, 0, 1, 1,
-0.6055574, 0.1867554, -3.406534, 1, 1, 1, 1, 1,
-0.603342, -0.5906832, -1.839092, 1, 1, 1, 1, 1,
-0.6030395, 0.2969447, 0.5937031, 1, 1, 1, 1, 1,
-0.5983446, 1.662139, 0.9888141, 1, 1, 1, 1, 1,
-0.5980859, -0.724398, -5.411579, 1, 1, 1, 1, 1,
-0.5957595, -0.9906875, -3.159154, 1, 1, 1, 1, 1,
-0.5956191, -0.8877023, -2.73355, 1, 1, 1, 1, 1,
-0.5934864, 1.855055, 1.65369, 1, 1, 1, 1, 1,
-0.5851972, 0.9927881, -2.653598, 1, 1, 1, 1, 1,
-0.5789214, 0.7777851, -1.069923, 1, 1, 1, 1, 1,
-0.5783297, -1.344546, -3.44653, 1, 1, 1, 1, 1,
-0.5717037, -1.724819, -0.5196611, 1, 1, 1, 1, 1,
-0.5609004, -1.16127, -1.735416, 1, 1, 1, 1, 1,
-0.5585411, 1.208607, -1.90636, 1, 1, 1, 1, 1,
-0.5479735, 0.05139019, -1.036904, 1, 1, 1, 1, 1,
-0.5478016, 0.9248179, -0.6465811, 0, 0, 1, 1, 1,
-0.545763, 0.4561559, -1.917835, 1, 0, 0, 1, 1,
-0.5452153, -1.092647, -4.625834, 1, 0, 0, 1, 1,
-0.5441135, 1.058535, 1.295179, 1, 0, 0, 1, 1,
-0.5432541, -1.069552, -2.280906, 1, 0, 0, 1, 1,
-0.5415331, 0.5584353, -1.047146, 1, 0, 0, 1, 1,
-0.5403427, 0.1791296, -0.9376232, 0, 0, 0, 1, 1,
-0.5401239, 0.6162718, 1.281711, 0, 0, 0, 1, 1,
-0.5377523, 0.3822822, -1.415497, 0, 0, 0, 1, 1,
-0.5367949, 1.58205, -1.068082, 0, 0, 0, 1, 1,
-0.5333748, -0.1133809, -0.4222992, 0, 0, 0, 1, 1,
-0.5326214, 0.2123761, -1.947538, 0, 0, 0, 1, 1,
-0.5317639, 0.6557083, -3.15359, 0, 0, 0, 1, 1,
-0.5309275, 0.3177916, -0.5356174, 1, 1, 1, 1, 1,
-0.5284833, 0.1094709, -1.729377, 1, 1, 1, 1, 1,
-0.527891, -0.1101561, -1.522936, 1, 1, 1, 1, 1,
-0.5220026, -0.9626939, -2.712771, 1, 1, 1, 1, 1,
-0.5188233, -0.3042082, -0.3389127, 1, 1, 1, 1, 1,
-0.5178496, -1.84917, -2.73293, 1, 1, 1, 1, 1,
-0.5173321, 0.5705822, 1.044486, 1, 1, 1, 1, 1,
-0.5144844, -1.428547, -3.15173, 1, 1, 1, 1, 1,
-0.506227, -0.6446559, -3.677019, 1, 1, 1, 1, 1,
-0.5052594, 0.3510162, -2.047476, 1, 1, 1, 1, 1,
-0.5036467, 2.161144, -0.8683721, 1, 1, 1, 1, 1,
-0.5036385, 0.9546919, -0.138562, 1, 1, 1, 1, 1,
-0.5008993, 1.258899, -0.1045699, 1, 1, 1, 1, 1,
-0.4924638, 0.7315307, 0.3103139, 1, 1, 1, 1, 1,
-0.4908114, 0.04506475, -1.433944, 1, 1, 1, 1, 1,
-0.4900865, -1.105994, -3.686887, 0, 0, 1, 1, 1,
-0.4900524, -0.8448626, -3.365793, 1, 0, 0, 1, 1,
-0.4864696, 1.175097, 0.6025716, 1, 0, 0, 1, 1,
-0.4794188, 1.488323, 0.06822793, 1, 0, 0, 1, 1,
-0.4794091, 1.274579, 1.417181, 1, 0, 0, 1, 1,
-0.4789699, -0.834424, -2.910776, 1, 0, 0, 1, 1,
-0.4780617, -0.02445638, -2.658648, 0, 0, 0, 1, 1,
-0.4733392, 1.24769, -1.032389, 0, 0, 0, 1, 1,
-0.4711965, -0.7881168, -2.009931, 0, 0, 0, 1, 1,
-0.4704675, -1.123287, -3.379534, 0, 0, 0, 1, 1,
-0.4696572, 2.078393, -0.6342848, 0, 0, 0, 1, 1,
-0.466582, 1.045226, -0.8463699, 0, 0, 0, 1, 1,
-0.4569835, 1.712289, -0.6381891, 0, 0, 0, 1, 1,
-0.4519911, -0.9634597, -2.067895, 1, 1, 1, 1, 1,
-0.4480662, -0.6911368, -1.918674, 1, 1, 1, 1, 1,
-0.4452524, -1.010098, -3.676783, 1, 1, 1, 1, 1,
-0.444145, -1.073058, -2.55512, 1, 1, 1, 1, 1,
-0.441694, -0.8344209, -4.652775, 1, 1, 1, 1, 1,
-0.4397426, -1.11027, -1.787114, 1, 1, 1, 1, 1,
-0.4341958, -0.3443056, -3.06008, 1, 1, 1, 1, 1,
-0.4289622, -1.380237, -1.472574, 1, 1, 1, 1, 1,
-0.4248551, -0.7303858, -4.083282, 1, 1, 1, 1, 1,
-0.4243285, -1.31627, -1.984308, 1, 1, 1, 1, 1,
-0.4238123, 0.1835063, -1.226524, 1, 1, 1, 1, 1,
-0.4222597, 0.8827976, 0.4935014, 1, 1, 1, 1, 1,
-0.420261, 0.2228617, -1.569516, 1, 1, 1, 1, 1,
-0.4188903, 0.1476987, -0.4130888, 1, 1, 1, 1, 1,
-0.4180442, -0.05956404, -1.101968, 1, 1, 1, 1, 1,
-0.4174127, -0.1485469, -2.112357, 0, 0, 1, 1, 1,
-0.4163599, 0.4638413, -0.2076617, 1, 0, 0, 1, 1,
-0.4141129, 0.9398394, -3.229763, 1, 0, 0, 1, 1,
-0.4093497, -0.6810641, -2.227982, 1, 0, 0, 1, 1,
-0.405879, -1.360696, -1.047327, 1, 0, 0, 1, 1,
-0.402531, -1.081489, -4.091747, 1, 0, 0, 1, 1,
-0.4004649, 1.27023, 0.7678335, 0, 0, 0, 1, 1,
-0.398482, -0.078277, -1.984784, 0, 0, 0, 1, 1,
-0.395018, 1.273009, 0.7264354, 0, 0, 0, 1, 1,
-0.3916182, 1.619573, -0.7531426, 0, 0, 0, 1, 1,
-0.3890687, -0.4734539, -1.246847, 0, 0, 0, 1, 1,
-0.3889958, 0.1082501, 0.6997973, 0, 0, 0, 1, 1,
-0.3741952, 1.329666, 0.4324068, 0, 0, 0, 1, 1,
-0.3740762, -0.8327166, -1.891683, 1, 1, 1, 1, 1,
-0.3732913, -0.6548175, -2.886558, 1, 1, 1, 1, 1,
-0.367797, 0.1548342, -0.3466038, 1, 1, 1, 1, 1,
-0.3667416, -1.055532, -3.786998, 1, 1, 1, 1, 1,
-0.366459, -0.6907777, -2.450878, 1, 1, 1, 1, 1,
-0.3595374, 1.219971, -1.076936, 1, 1, 1, 1, 1,
-0.3562796, -0.008036678, -1.820049, 1, 1, 1, 1, 1,
-0.3561392, 0.3429666, -0.7659808, 1, 1, 1, 1, 1,
-0.3533067, -0.7380051, -1.33647, 1, 1, 1, 1, 1,
-0.3520588, 0.7629257, -0.3800367, 1, 1, 1, 1, 1,
-0.350624, 1.481514, -1.288742, 1, 1, 1, 1, 1,
-0.3498034, 0.0790621, -0.3450055, 1, 1, 1, 1, 1,
-0.3424927, -0.6473857, -1.589697, 1, 1, 1, 1, 1,
-0.341875, 0.1321078, -0.3537233, 1, 1, 1, 1, 1,
-0.3417225, -0.3048974, -2.736387, 1, 1, 1, 1, 1,
-0.3393359, 0.9259324, 0.1161362, 0, 0, 1, 1, 1,
-0.3380645, -0.2928701, -1.661043, 1, 0, 0, 1, 1,
-0.3328024, 0.02605234, -0.16288, 1, 0, 0, 1, 1,
-0.3309323, -1.620489, -2.291753, 1, 0, 0, 1, 1,
-0.3304576, -0.07313902, -2.961214, 1, 0, 0, 1, 1,
-0.3220262, -1.26087, -3.295346, 1, 0, 0, 1, 1,
-0.3185384, -1.506685, -3.994422, 0, 0, 0, 1, 1,
-0.3163433, 0.8162667, -0.07579798, 0, 0, 0, 1, 1,
-0.3057024, 0.1633431, -1.372899, 0, 0, 0, 1, 1,
-0.3044537, -1.097972, -3.046847, 0, 0, 0, 1, 1,
-0.3043881, -1.135741, -3.065303, 0, 0, 0, 1, 1,
-0.2999312, 0.1061862, -0.3632434, 0, 0, 0, 1, 1,
-0.2992885, -1.524603, -4.652082, 0, 0, 0, 1, 1,
-0.2948578, -0.1417274, -1.329136, 1, 1, 1, 1, 1,
-0.2898536, 0.8379782, -1.867419, 1, 1, 1, 1, 1,
-0.2877891, 0.4132477, -0.01005987, 1, 1, 1, 1, 1,
-0.2840765, 0.5601011, -0.2190464, 1, 1, 1, 1, 1,
-0.2834289, -0.496015, -1.67182, 1, 1, 1, 1, 1,
-0.2806395, 0.2192417, -0.8943709, 1, 1, 1, 1, 1,
-0.2801891, 0.6962898, -1.618095, 1, 1, 1, 1, 1,
-0.2776331, 0.3229393, -0.5841577, 1, 1, 1, 1, 1,
-0.2692834, 0.7415886, -0.6414375, 1, 1, 1, 1, 1,
-0.2687691, -0.7113277, -3.129926, 1, 1, 1, 1, 1,
-0.2682793, 0.2391151, -1.806562, 1, 1, 1, 1, 1,
-0.267573, -0.2296917, -4.118078, 1, 1, 1, 1, 1,
-0.266713, 1.22969, 1.479359, 1, 1, 1, 1, 1,
-0.2651335, -1.525308, -1.739192, 1, 1, 1, 1, 1,
-0.2578296, 0.1995511, -1.189473, 1, 1, 1, 1, 1,
-0.2573984, -0.6058712, -2.00475, 0, 0, 1, 1, 1,
-0.2555717, -0.975439, -3.420045, 1, 0, 0, 1, 1,
-0.2545736, 0.1018345, -0.09107793, 1, 0, 0, 1, 1,
-0.2529472, -0.1946496, -2.492567, 1, 0, 0, 1, 1,
-0.2522644, -0.349793, -2.49561, 1, 0, 0, 1, 1,
-0.2487082, 1.350972, 1.432821, 1, 0, 0, 1, 1,
-0.2459668, -0.01074413, -1.634737, 0, 0, 0, 1, 1,
-0.2411073, -0.2274336, -1.782102, 0, 0, 0, 1, 1,
-0.2397009, 0.3487491, -0.3832902, 0, 0, 0, 1, 1,
-0.2382627, 2.675991, 0.4455888, 0, 0, 0, 1, 1,
-0.2374658, 1.580875, 0.3727295, 0, 0, 0, 1, 1,
-0.2368805, 1.090873, -2.11598, 0, 0, 0, 1, 1,
-0.2302786, -0.7718085, -1.857897, 0, 0, 0, 1, 1,
-0.2300839, -0.6779445, -2.389762, 1, 1, 1, 1, 1,
-0.2297013, -0.1450289, -2.223621, 1, 1, 1, 1, 1,
-0.2285363, -1.557885, -3.80966, 1, 1, 1, 1, 1,
-0.2270617, -0.7153662, -1.769325, 1, 1, 1, 1, 1,
-0.2228552, -2.177226, -3.409325, 1, 1, 1, 1, 1,
-0.2223246, 0.08910073, -0.3969204, 1, 1, 1, 1, 1,
-0.2172737, 0.141161, -1.000348, 1, 1, 1, 1, 1,
-0.2095665, -1.269496, -2.499538, 1, 1, 1, 1, 1,
-0.2091594, -0.3250247, -3.23539, 1, 1, 1, 1, 1,
-0.2064648, -0.6042461, -3.933073, 1, 1, 1, 1, 1,
-0.2054227, 0.3601886, -0.3821073, 1, 1, 1, 1, 1,
-0.1998247, -0.4041831, -1.359142, 1, 1, 1, 1, 1,
-0.1973259, 0.6930557, 0.5148382, 1, 1, 1, 1, 1,
-0.1908907, -0.1440829, -1.702646, 1, 1, 1, 1, 1,
-0.1856794, -0.6498411, -1.77844, 1, 1, 1, 1, 1,
-0.18422, -1.163906, -0.6246026, 0, 0, 1, 1, 1,
-0.1832458, 1.084016, -1.059585, 1, 0, 0, 1, 1,
-0.1823386, -0.2464697, -4.244314, 1, 0, 0, 1, 1,
-0.1815655, 2.04201, 0.5455089, 1, 0, 0, 1, 1,
-0.1790823, 1.391788, 1.191376, 1, 0, 0, 1, 1,
-0.1742789, 1.874402, -1.413635, 1, 0, 0, 1, 1,
-0.1668127, -0.1208305, -1.696354, 0, 0, 0, 1, 1,
-0.1661063, -1.629457, -1.114785, 0, 0, 0, 1, 1,
-0.1653683, 0.7745572, 0.531388, 0, 0, 0, 1, 1,
-0.1653471, -0.3908729, -2.925104, 0, 0, 0, 1, 1,
-0.1633146, 1.332143, 0.1694867, 0, 0, 0, 1, 1,
-0.1627109, -0.199382, -0.7654468, 0, 0, 0, 1, 1,
-0.158795, 0.3097864, -0.9204401, 0, 0, 0, 1, 1,
-0.1570694, -0.4614435, -2.035837, 1, 1, 1, 1, 1,
-0.1567771, 0.5122572, -0.6653807, 1, 1, 1, 1, 1,
-0.1545601, 1.033412, -0.05481298, 1, 1, 1, 1, 1,
-0.1536265, 1.70997, -0.4992778, 1, 1, 1, 1, 1,
-0.1503336, 0.5773702, -0.9913241, 1, 1, 1, 1, 1,
-0.1495995, 0.3204772, -1.613411, 1, 1, 1, 1, 1,
-0.1479907, 0.3817005, -2.242109, 1, 1, 1, 1, 1,
-0.1438963, 1.751206, 1.653895, 1, 1, 1, 1, 1,
-0.139621, -1.780555, -3.10823, 1, 1, 1, 1, 1,
-0.1371963, 0.01472997, -0.9862764, 1, 1, 1, 1, 1,
-0.1370614, -0.3912482, -1.78267, 1, 1, 1, 1, 1,
-0.1357882, -0.6840436, -0.4163873, 1, 1, 1, 1, 1,
-0.1330972, 0.7326816, -0.1033271, 1, 1, 1, 1, 1,
-0.1299806, 1.10199, 0.1585018, 1, 1, 1, 1, 1,
-0.12913, -0.6616113, -1.390364, 1, 1, 1, 1, 1,
-0.1256657, 1.264307, 0.9510999, 0, 0, 1, 1, 1,
-0.1254951, -0.01291241, -0.8808048, 1, 0, 0, 1, 1,
-0.1241308, -0.7645743, -2.452891, 1, 0, 0, 1, 1,
-0.1218948, 0.08287053, -1.422962, 1, 0, 0, 1, 1,
-0.1205374, 0.2268384, 0.5480272, 1, 0, 0, 1, 1,
-0.1166035, -1.341024, -2.286453, 1, 0, 0, 1, 1,
-0.1155304, 0.874401, -0.5179721, 0, 0, 0, 1, 1,
-0.1121448, -1.466604, -3.215449, 0, 0, 0, 1, 1,
-0.1107871, 0.642914, -2.229142, 0, 0, 0, 1, 1,
-0.1103852, 0.3897726, -0.5314102, 0, 0, 0, 1, 1,
-0.1060281, -0.008338654, -1.883833, 0, 0, 0, 1, 1,
-0.1022994, 0.6471663, 0.6908376, 0, 0, 0, 1, 1,
-0.1014269, -0.3471534, -5.637269, 0, 0, 0, 1, 1,
-0.1010003, 1.102306, -1.243007, 1, 1, 1, 1, 1,
-0.1002874, -0.6173041, -2.286179, 1, 1, 1, 1, 1,
-0.1000492, -0.2654066, -3.399467, 1, 1, 1, 1, 1,
-0.0994788, -0.2341621, -3.771825, 1, 1, 1, 1, 1,
-0.09325713, -0.8347839, -3.9406, 1, 1, 1, 1, 1,
-0.09227509, 1.029949, -0.7973537, 1, 1, 1, 1, 1,
-0.09125649, 0.2402463, -1.369508, 1, 1, 1, 1, 1,
-0.0794976, 3.081699, 2.100775, 1, 1, 1, 1, 1,
-0.07660715, 0.3116124, -0.6435113, 1, 1, 1, 1, 1,
-0.07372167, 0.8704754, 1.169454, 1, 1, 1, 1, 1,
-0.07365781, -0.3036144, -3.733672, 1, 1, 1, 1, 1,
-0.07041142, -0.8102728, -4.299135, 1, 1, 1, 1, 1,
-0.0652007, 0.5722098, -0.05989485, 1, 1, 1, 1, 1,
-0.06249329, -0.8166663, -2.587054, 1, 1, 1, 1, 1,
-0.06023803, 0.4374372, -0.1720208, 1, 1, 1, 1, 1,
-0.05874033, 1.353683, 0.2517681, 0, 0, 1, 1, 1,
-0.05816481, 0.006721434, -2.317457, 1, 0, 0, 1, 1,
-0.05099348, -1.40602, -0.1258139, 1, 0, 0, 1, 1,
-0.05064072, -0.04060384, -2.301925, 1, 0, 0, 1, 1,
-0.0462239, -0.8380955, -3.411869, 1, 0, 0, 1, 1,
-0.04393282, 0.02453303, -1.292856, 1, 0, 0, 1, 1,
-0.03505397, -1.345893, -3.180074, 0, 0, 0, 1, 1,
-0.03087831, 0.3048473, 1.106676, 0, 0, 0, 1, 1,
-0.03071883, 0.08606002, 1.657346, 0, 0, 0, 1, 1,
-0.02931854, 0.9182193, -0.4664712, 0, 0, 0, 1, 1,
-0.02856153, 0.7618325, -0.6351292, 0, 0, 0, 1, 1,
-0.02617623, -1.23936, -2.247445, 0, 0, 0, 1, 1,
-0.02509923, 0.786078, -1.418843, 0, 0, 0, 1, 1,
-0.02497281, -0.761619, -4.145958, 1, 1, 1, 1, 1,
-0.02036733, -0.5982147, -2.928157, 1, 1, 1, 1, 1,
-0.01950951, -0.007514542, -0.9639336, 1, 1, 1, 1, 1,
-0.01769136, -0.5220679, -3.772997, 1, 1, 1, 1, 1,
-0.01698255, 0.6084604, 0.5700116, 1, 1, 1, 1, 1,
-0.01364807, -0.2028417, -3.058288, 1, 1, 1, 1, 1,
-0.01322317, -0.5221136, -1.260904, 1, 1, 1, 1, 1,
-0.01206231, 1.446105, 1.028046, 1, 1, 1, 1, 1,
-0.01196643, 1.995616, 0.6770915, 1, 1, 1, 1, 1,
-0.008748267, 0.3375578, -1.910924, 1, 1, 1, 1, 1,
-0.007950527, -0.9953594, -4.012398, 1, 1, 1, 1, 1,
-0.007637372, 0.03851027, -0.2319814, 1, 1, 1, 1, 1,
-0.006799562, -2.098046, -3.566509, 1, 1, 1, 1, 1,
-0.004272844, -0.5892814, -2.38364, 1, 1, 1, 1, 1,
0.003484142, -0.9224236, 3.116574, 1, 1, 1, 1, 1,
0.003753064, -0.8568954, 2.127037, 0, 0, 1, 1, 1,
0.005312813, 0.2568429, 0.6674567, 1, 0, 0, 1, 1,
0.005540313, -0.7678972, 2.779171, 1, 0, 0, 1, 1,
0.006569504, 0.7701946, -0.7182026, 1, 0, 0, 1, 1,
0.009773122, -0.6192891, 2.361626, 1, 0, 0, 1, 1,
0.01418112, 1.036508, -0.598826, 1, 0, 0, 1, 1,
0.01530717, -0.9743129, 3.67926, 0, 0, 0, 1, 1,
0.02107511, -0.7865111, 2.490388, 0, 0, 0, 1, 1,
0.02406093, -2.147859, 4.289537, 0, 0, 0, 1, 1,
0.0241867, 1.242602, 0.4000566, 0, 0, 0, 1, 1,
0.02937246, -1.555503, 1.381778, 0, 0, 0, 1, 1,
0.03094915, -0.2937568, 2.025218, 0, 0, 0, 1, 1,
0.03715716, 1.112015, -0.4127423, 0, 0, 0, 1, 1,
0.03735172, -0.3124126, 2.053448, 1, 1, 1, 1, 1,
0.03881869, 0.9766197, -0.8236637, 1, 1, 1, 1, 1,
0.03960099, 0.7345197, 0.1835027, 1, 1, 1, 1, 1,
0.04193906, -0.2516216, 2.222035, 1, 1, 1, 1, 1,
0.04304526, -0.6464997, 2.027817, 1, 1, 1, 1, 1,
0.04717387, 0.5429171, 0.49696, 1, 1, 1, 1, 1,
0.0476166, 0.3335916, 0.2728188, 1, 1, 1, 1, 1,
0.04916383, 3.560196, 0.5051901, 1, 1, 1, 1, 1,
0.05229723, 0.9300185, -0.3559807, 1, 1, 1, 1, 1,
0.05288871, -1.822886, 1.971407, 1, 1, 1, 1, 1,
0.05300541, -1.146144, 3.894152, 1, 1, 1, 1, 1,
0.05655779, 0.01688844, 0.9734843, 1, 1, 1, 1, 1,
0.06201076, 0.6763681, 0.8739998, 1, 1, 1, 1, 1,
0.06521418, 0.5447577, 0.1973724, 1, 1, 1, 1, 1,
0.06770927, 0.262095, 1.543657, 1, 1, 1, 1, 1,
0.06975258, 0.6938941, 0.9007467, 0, 0, 1, 1, 1,
0.0701995, -0.6355151, 3.492464, 1, 0, 0, 1, 1,
0.07160144, 0.3193032, 0.2281195, 1, 0, 0, 1, 1,
0.07848357, 0.4826998, -0.01069023, 1, 0, 0, 1, 1,
0.07918992, -0.7510237, 2.961011, 1, 0, 0, 1, 1,
0.07928034, 0.3001224, -0.3594418, 1, 0, 0, 1, 1,
0.08217534, -1.41273, 2.29047, 0, 0, 0, 1, 1,
0.08405353, 0.3153132, 0.1948057, 0, 0, 0, 1, 1,
0.08613531, -0.5328592, 2.479836, 0, 0, 0, 1, 1,
0.08745574, -0.7642363, 3.549517, 0, 0, 0, 1, 1,
0.09234903, 0.8747292, -0.1032676, 0, 0, 0, 1, 1,
0.09665298, 0.953995, -0.1941148, 0, 0, 0, 1, 1,
0.0980405, -1.039859, 2.149334, 0, 0, 0, 1, 1,
0.1000735, -1.231686, 4.239524, 1, 1, 1, 1, 1,
0.1037467, 0.8325635, -0.2881528, 1, 1, 1, 1, 1,
0.1063108, 0.6039283, -0.0003000575, 1, 1, 1, 1, 1,
0.108316, 0.1438083, -1.125511, 1, 1, 1, 1, 1,
0.108709, 0.9143929, -1.917885, 1, 1, 1, 1, 1,
0.1109323, 0.8163037, 0.2196657, 1, 1, 1, 1, 1,
0.1150464, -0.2324066, 1.794312, 1, 1, 1, 1, 1,
0.1168821, 0.7391358, -0.6451781, 1, 1, 1, 1, 1,
0.1172857, 0.8238493, 0.2847416, 1, 1, 1, 1, 1,
0.119226, -0.6126133, 3.750543, 1, 1, 1, 1, 1,
0.122097, -1.254714, 3.69297, 1, 1, 1, 1, 1,
0.1221402, -0.0402, 0.7754622, 1, 1, 1, 1, 1,
0.1228768, -0.9320571, 1.547004, 1, 1, 1, 1, 1,
0.1342254, 0.6705741, -0.05906601, 1, 1, 1, 1, 1,
0.1362413, -1.430972, 4.086895, 1, 1, 1, 1, 1,
0.1376259, -0.6981365, 2.784948, 0, 0, 1, 1, 1,
0.1515235, -0.1325909, 2.533193, 1, 0, 0, 1, 1,
0.1522612, 0.131286, 0.027062, 1, 0, 0, 1, 1,
0.1532628, 0.9615459, -0.03384897, 1, 0, 0, 1, 1,
0.1536514, -0.2619565, 3.005872, 1, 0, 0, 1, 1,
0.1567294, 0.5762995, 0.2465963, 1, 0, 0, 1, 1,
0.1589121, -0.63791, 2.510701, 0, 0, 0, 1, 1,
0.1625229, -1.869048, 2.302203, 0, 0, 0, 1, 1,
0.1669567, -0.2257083, 3.199052, 0, 0, 0, 1, 1,
0.1671933, 0.9093761, -0.4001777, 0, 0, 0, 1, 1,
0.1683795, -0.7903548, 3.973779, 0, 0, 0, 1, 1,
0.1700347, -0.002387572, 1.05171, 0, 0, 0, 1, 1,
0.1724854, -1.477009, 1.590075, 0, 0, 0, 1, 1,
0.1772431, 0.4086153, 0.3951488, 1, 1, 1, 1, 1,
0.1785899, -0.9483182, 3.171432, 1, 1, 1, 1, 1,
0.1786022, -0.3770187, 1.367002, 1, 1, 1, 1, 1,
0.1811338, 0.02665702, 1.019329, 1, 1, 1, 1, 1,
0.1815845, 1.292271, 1.582572, 1, 1, 1, 1, 1,
0.1825938, -0.4573671, 1.272248, 1, 1, 1, 1, 1,
0.1834366, -0.9159886, 3.562249, 1, 1, 1, 1, 1,
0.1841375, -0.1120988, 1.551286, 1, 1, 1, 1, 1,
0.1845577, -1.974259, 4.585609, 1, 1, 1, 1, 1,
0.1848974, 1.344263, 0.7566239, 1, 1, 1, 1, 1,
0.1860665, -2.023647, 3.101553, 1, 1, 1, 1, 1,
0.1875702, -0.2338891, 2.674471, 1, 1, 1, 1, 1,
0.1885352, -0.3766744, 0.8156911, 1, 1, 1, 1, 1,
0.1899982, -0.02653253, 2.670047, 1, 1, 1, 1, 1,
0.1914617, 1.677922, 1.337905, 1, 1, 1, 1, 1,
0.1916243, -0.9338306, 2.673302, 0, 0, 1, 1, 1,
0.1918069, -0.6099935, 2.871039, 1, 0, 0, 1, 1,
0.1923752, 2.126582, 1.147999, 1, 0, 0, 1, 1,
0.1931232, 0.153518, -0.5841995, 1, 0, 0, 1, 1,
0.1969883, -0.5045381, 1.692448, 1, 0, 0, 1, 1,
0.1975043, -0.1741595, 2.426419, 1, 0, 0, 1, 1,
0.1999302, -1.772386, 1.004248, 0, 0, 0, 1, 1,
0.200398, -0.6374745, 3.288026, 0, 0, 0, 1, 1,
0.2016602, -0.6902174, 1.255015, 0, 0, 0, 1, 1,
0.2026651, -1.181052, 0.9538667, 0, 0, 0, 1, 1,
0.2028012, -0.6993731, 1.324771, 0, 0, 0, 1, 1,
0.2046579, -0.6573895, 5.050477, 0, 0, 0, 1, 1,
0.2054932, 1.704903, 0.7472793, 0, 0, 0, 1, 1,
0.206367, -0.2227074, 2.075269, 1, 1, 1, 1, 1,
0.2126033, 1.977546, 1.384461, 1, 1, 1, 1, 1,
0.2163834, -1.436309, 3.359026, 1, 1, 1, 1, 1,
0.2190095, -1.495233, 4.806721, 1, 1, 1, 1, 1,
0.2202241, 0.2012061, -0.6217255, 1, 1, 1, 1, 1,
0.2212875, 0.7505149, -0.2008347, 1, 1, 1, 1, 1,
0.222837, -0.5935422, 2.906141, 1, 1, 1, 1, 1,
0.2238739, -3.373195, 4.993913, 1, 1, 1, 1, 1,
0.2239304, -0.2509539, 2.112096, 1, 1, 1, 1, 1,
0.2250067, 0.1306866, -0.4619032, 1, 1, 1, 1, 1,
0.2267609, 0.4331655, 0.4264451, 1, 1, 1, 1, 1,
0.2267623, 0.2125604, 0.6004769, 1, 1, 1, 1, 1,
0.227301, -0.3475193, 4.074034, 1, 1, 1, 1, 1,
0.228903, 0.5307468, -0.01235534, 1, 1, 1, 1, 1,
0.2321634, 0.08107842, 0.4211635, 1, 1, 1, 1, 1,
0.232862, 1.580699, -2.160871, 0, 0, 1, 1, 1,
0.2360021, 0.840477, 0.7292792, 1, 0, 0, 1, 1,
0.237265, -0.3458611, 2.377317, 1, 0, 0, 1, 1,
0.24219, 1.405697, 0.1419311, 1, 0, 0, 1, 1,
0.2527105, -1.758307, 3.755834, 1, 0, 0, 1, 1,
0.2567966, 0.04126474, 2.082858, 1, 0, 0, 1, 1,
0.2574044, -0.3659177, 1.911539, 0, 0, 0, 1, 1,
0.2646093, -0.1952025, 2.465781, 0, 0, 0, 1, 1,
0.2655132, -1.153445, 0.5606946, 0, 0, 0, 1, 1,
0.265539, 0.7786836, 0.2934535, 0, 0, 0, 1, 1,
0.2681968, -0.03409366, 0.03061989, 0, 0, 0, 1, 1,
0.2688127, 1.565609, 1.34815, 0, 0, 0, 1, 1,
0.2690453, 0.9022121, 0.1936343, 0, 0, 0, 1, 1,
0.2701936, -0.09156354, 1.08437, 1, 1, 1, 1, 1,
0.2719575, 0.626552, 0.4268899, 1, 1, 1, 1, 1,
0.2727949, 0.3190196, 1.281083, 1, 1, 1, 1, 1,
0.2759061, 0.09790894, 2.29569, 1, 1, 1, 1, 1,
0.2771336, -0.06327934, -0.3390173, 1, 1, 1, 1, 1,
0.2827799, -0.0134857, 2.39377, 1, 1, 1, 1, 1,
0.2848221, 1.189928, 0.8678077, 1, 1, 1, 1, 1,
0.2904957, 0.1733191, 0.3878452, 1, 1, 1, 1, 1,
0.2918076, 0.7452662, 0.6969715, 1, 1, 1, 1, 1,
0.2958227, -0.07712387, 1.146971, 1, 1, 1, 1, 1,
0.2981008, 0.1040067, 0.06397561, 1, 1, 1, 1, 1,
0.2986859, 0.770143, 0.9195216, 1, 1, 1, 1, 1,
0.30074, 1.152663, -1.81529, 1, 1, 1, 1, 1,
0.3068754, 0.7451143, 0.7537678, 1, 1, 1, 1, 1,
0.3070089, -1.230439, 4.017971, 1, 1, 1, 1, 1,
0.3080527, -0.4880298, 3.364431, 0, 0, 1, 1, 1,
0.3085711, -0.8670962, 2.83051, 1, 0, 0, 1, 1,
0.3102014, 0.9905821, -0.6871752, 1, 0, 0, 1, 1,
0.3134087, -0.6872245, 4.23293, 1, 0, 0, 1, 1,
0.3134618, 0.6420364, 1.266113, 1, 0, 0, 1, 1,
0.3157796, -1.651485, 1.896252, 1, 0, 0, 1, 1,
0.3173104, 2.229698, 0.1517051, 0, 0, 0, 1, 1,
0.319871, -0.6340204, 4.314562, 0, 0, 0, 1, 1,
0.31996, 0.1751187, 1.661982, 0, 0, 0, 1, 1,
0.328239, -0.9443493, 2.594573, 0, 0, 0, 1, 1,
0.3286788, -2.004933, 1.606628, 0, 0, 0, 1, 1,
0.3300681, -2.4409, 4.350454, 0, 0, 0, 1, 1,
0.3320489, 1.03425, 0.6096332, 0, 0, 0, 1, 1,
0.3338185, 0.495444, 2.576411, 1, 1, 1, 1, 1,
0.3356968, 0.6445688, -0.2169202, 1, 1, 1, 1, 1,
0.3360492, -0.6701564, 1.557582, 1, 1, 1, 1, 1,
0.3373608, 0.301381, 0.914497, 1, 1, 1, 1, 1,
0.3391835, 0.7818386, -3.188922, 1, 1, 1, 1, 1,
0.3467656, -1.157281, 2.755801, 1, 1, 1, 1, 1,
0.3477134, -0.2596718, 1.845239, 1, 1, 1, 1, 1,
0.3521398, -0.3417878, 2.433109, 1, 1, 1, 1, 1,
0.3576807, 0.3975272, 1.969972, 1, 1, 1, 1, 1,
0.3594373, 0.05588993, 1.859206, 1, 1, 1, 1, 1,
0.3614384, -1.625439, 2.847474, 1, 1, 1, 1, 1,
0.3621825, -0.3719137, 1.83011, 1, 1, 1, 1, 1,
0.3627132, -0.3011984, 3.096488, 1, 1, 1, 1, 1,
0.3645183, -1.062162, 1.698029, 1, 1, 1, 1, 1,
0.366986, -0.7191237, 3.330319, 1, 1, 1, 1, 1,
0.3717577, -0.5191752, 3.545443, 0, 0, 1, 1, 1,
0.374059, -0.2605328, -0.008584438, 1, 0, 0, 1, 1,
0.3759235, -0.3505517, 0.9442781, 1, 0, 0, 1, 1,
0.3764107, 1.217958, 0.6600151, 1, 0, 0, 1, 1,
0.3776819, -1.273018, 3.86056, 1, 0, 0, 1, 1,
0.3797945, 2.086046, -0.7695529, 1, 0, 0, 1, 1,
0.3807546, 0.1825571, 1.51689, 0, 0, 0, 1, 1,
0.3822447, 0.9662173, 0.1646892, 0, 0, 0, 1, 1,
0.3846321, -0.1109193, 1.906028, 0, 0, 0, 1, 1,
0.3850898, -0.02544327, 1.865347, 0, 0, 0, 1, 1,
0.3895273, -0.3498269, 2.545023, 0, 0, 0, 1, 1,
0.3912525, -0.9864058, 2.899199, 0, 0, 0, 1, 1,
0.4065707, 0.3334045, 0.9727913, 0, 0, 0, 1, 1,
0.412773, 0.4681022, 0.5176575, 1, 1, 1, 1, 1,
0.4139175, -0.1691595, 1.875202, 1, 1, 1, 1, 1,
0.4170129, -0.744236, 3.689681, 1, 1, 1, 1, 1,
0.4171355, 0.4641341, -1.920514, 1, 1, 1, 1, 1,
0.4287112, 1.290005, 2.400794, 1, 1, 1, 1, 1,
0.4318218, 0.1017783, 2.268762, 1, 1, 1, 1, 1,
0.432797, 0.8403392, 0.4045105, 1, 1, 1, 1, 1,
0.4415429, 1.124381, 0.7475333, 1, 1, 1, 1, 1,
0.443328, -0.01628496, 1.538938, 1, 1, 1, 1, 1,
0.4435112, -2.059054, 3.014469, 1, 1, 1, 1, 1,
0.4448331, -0.7695618, 5.065908, 1, 1, 1, 1, 1,
0.4461101, 0.3308436, -0.1905853, 1, 1, 1, 1, 1,
0.4494471, -0.682698, 2.181456, 1, 1, 1, 1, 1,
0.4497578, 1.172993, 0.1707796, 1, 1, 1, 1, 1,
0.4526916, -0.7686517, 1.449027, 1, 1, 1, 1, 1,
0.4567608, -1.019735, 4.100454, 0, 0, 1, 1, 1,
0.4592929, 0.2269813, 1.115621, 1, 0, 0, 1, 1,
0.4607117, -0.2726628, 2.100477, 1, 0, 0, 1, 1,
0.4628287, -1.946931, 3.265761, 1, 0, 0, 1, 1,
0.4690325, -0.5860833, 1.306493, 1, 0, 0, 1, 1,
0.4732464, -0.1530422, 1.114035, 1, 0, 0, 1, 1,
0.4780322, -0.8961257, 4.23455, 0, 0, 0, 1, 1,
0.4812959, -1.401064, 2.035993, 0, 0, 0, 1, 1,
0.4831007, -0.3819875, 1.712475, 0, 0, 0, 1, 1,
0.4880681, -0.05172991, 0.9813972, 0, 0, 0, 1, 1,
0.4926409, -0.5425276, 1.741207, 0, 0, 0, 1, 1,
0.4945542, 1.098859, 0.5940876, 0, 0, 0, 1, 1,
0.496785, -0.006581461, 1.138855, 0, 0, 0, 1, 1,
0.5016434, 0.8988805, 0.3101626, 1, 1, 1, 1, 1,
0.5034037, -1.315007, 1.646405, 1, 1, 1, 1, 1,
0.5052726, -1.475723, 2.718856, 1, 1, 1, 1, 1,
0.509657, -1.35503, 3.552073, 1, 1, 1, 1, 1,
0.5141317, -0.01909274, 0.1900199, 1, 1, 1, 1, 1,
0.5156309, 1.050326, -0.6597185, 1, 1, 1, 1, 1,
0.5192026, 0.1442575, 0.8111624, 1, 1, 1, 1, 1,
0.5233569, 0.7627634, 1.710794, 1, 1, 1, 1, 1,
0.523781, 0.03934813, 2.241926, 1, 1, 1, 1, 1,
0.5256732, 1.24527, 0.8026751, 1, 1, 1, 1, 1,
0.5279166, -0.3216707, 3.725393, 1, 1, 1, 1, 1,
0.5287348, 0.9049532, 0.6108698, 1, 1, 1, 1, 1,
0.5324253, 1.369809, 0.1898314, 1, 1, 1, 1, 1,
0.536155, 0.6500084, 1.660624, 1, 1, 1, 1, 1,
0.5366566, -2.066174, 1.499522, 1, 1, 1, 1, 1,
0.5380545, 0.32137, 0.4444878, 0, 0, 1, 1, 1,
0.5444391, -0.6682908, 1.306945, 1, 0, 0, 1, 1,
0.5473397, 1.197308, 1.5186, 1, 0, 0, 1, 1,
0.5485311, 0.4722746, 2.335574, 1, 0, 0, 1, 1,
0.5489292, -0.2263232, 0.8337359, 1, 0, 0, 1, 1,
0.5521157, -0.8465168, 2.155291, 1, 0, 0, 1, 1,
0.5532894, -1.341815, 2.056372, 0, 0, 0, 1, 1,
0.5562369, 0.3498046, 2.951583, 0, 0, 0, 1, 1,
0.5563613, 0.9105509, 1.396573, 0, 0, 0, 1, 1,
0.5595406, 1.072458, 0.5160524, 0, 0, 0, 1, 1,
0.5623223, 0.1043446, 1.955172, 0, 0, 0, 1, 1,
0.5681055, 0.3605905, 0.6831063, 0, 0, 0, 1, 1,
0.5709307, 0.8274934, -0.006838333, 0, 0, 0, 1, 1,
0.5720393, 0.2629471, 0.2596527, 1, 1, 1, 1, 1,
0.5736796, 0.5212714, 2.770448, 1, 1, 1, 1, 1,
0.5747871, 0.1969057, 3.029281, 1, 1, 1, 1, 1,
0.5756648, 0.4876709, 0.565371, 1, 1, 1, 1, 1,
0.5792225, -1.384736, 2.66418, 1, 1, 1, 1, 1,
0.5801561, 0.4890492, 1.67709, 1, 1, 1, 1, 1,
0.5827387, 0.9367579, 1.005388, 1, 1, 1, 1, 1,
0.5846506, -0.7950717, 2.699913, 1, 1, 1, 1, 1,
0.585238, -3.771772, 3.695188, 1, 1, 1, 1, 1,
0.5958993, 1.788743, 0.6694894, 1, 1, 1, 1, 1,
0.6044313, -0.2125943, 2.677901, 1, 1, 1, 1, 1,
0.6057882, -0.589077, 1.083025, 1, 1, 1, 1, 1,
0.6090828, 0.6566595, 0.03942344, 1, 1, 1, 1, 1,
0.6162965, -1.646472, 3.037863, 1, 1, 1, 1, 1,
0.6193732, -1.43391, 3.494097, 1, 1, 1, 1, 1,
0.6251763, 0.117128, -0.7859552, 0, 0, 1, 1, 1,
0.6263523, -0.6894395, 2.567088, 1, 0, 0, 1, 1,
0.6307035, -1.495922, 2.495349, 1, 0, 0, 1, 1,
0.6353591, -0.08635356, 1.748806, 1, 0, 0, 1, 1,
0.6375343, -0.2723689, -0.4633816, 1, 0, 0, 1, 1,
0.6416745, -0.4387085, 0.6814486, 1, 0, 0, 1, 1,
0.6417701, -0.7648436, 0.5716285, 0, 0, 0, 1, 1,
0.6447692, -0.2159138, 0.6602903, 0, 0, 0, 1, 1,
0.6514821, -0.02165943, 0.6543462, 0, 0, 0, 1, 1,
0.6522605, -0.9590715, 1.607541, 0, 0, 0, 1, 1,
0.6527192, 0.1686401, -0.3584906, 0, 0, 0, 1, 1,
0.6534032, -0.1618489, 0.1240302, 0, 0, 0, 1, 1,
0.6607301, -0.4332188, 4.036564, 0, 0, 0, 1, 1,
0.6607969, 0.1533196, 0.1462275, 1, 1, 1, 1, 1,
0.6617723, 0.1299944, 2.619829, 1, 1, 1, 1, 1,
0.6664137, -1.309153, 2.736305, 1, 1, 1, 1, 1,
0.6691051, 1.145639, 1.315057, 1, 1, 1, 1, 1,
0.6732662, -0.4229345, 3.06855, 1, 1, 1, 1, 1,
0.6737109, 1.579975, 0.8355631, 1, 1, 1, 1, 1,
0.674198, 0.3838577, 2.034294, 1, 1, 1, 1, 1,
0.677947, 0.05549633, 1.23697, 1, 1, 1, 1, 1,
0.6792155, -0.4400247, 1.296562, 1, 1, 1, 1, 1,
0.6842381, -1.27698, 1.727964, 1, 1, 1, 1, 1,
0.691942, 0.6750374, -0.2959115, 1, 1, 1, 1, 1,
0.6938955, 1.76715, 0.7787515, 1, 1, 1, 1, 1,
0.6942642, -0.3024343, 0.8789129, 1, 1, 1, 1, 1,
0.6962423, 0.6042212, 0.6073288, 1, 1, 1, 1, 1,
0.7015051, 0.2239504, 1.675375, 1, 1, 1, 1, 1,
0.7037058, -1.209191, 1.454061, 0, 0, 1, 1, 1,
0.7066569, -0.7426356, 1.691221, 1, 0, 0, 1, 1,
0.7072479, 1.021049, 1.168026, 1, 0, 0, 1, 1,
0.7159172, -1.098967, 3.366108, 1, 0, 0, 1, 1,
0.7160866, -1.556379, 2.517606, 1, 0, 0, 1, 1,
0.7174563, 0.6766702, 0.6694018, 1, 0, 0, 1, 1,
0.720392, -0.4188655, 2.16397, 0, 0, 0, 1, 1,
0.7219982, -0.4211823, 1.603083, 0, 0, 0, 1, 1,
0.7222528, -0.410311, 3.271729, 0, 0, 0, 1, 1,
0.7241217, -0.9401896, 3.416554, 0, 0, 0, 1, 1,
0.7320167, 0.7536605, -0.4074943, 0, 0, 0, 1, 1,
0.736337, 0.6542068, 1.65233, 0, 0, 0, 1, 1,
0.7417061, 0.4927185, -0.07089964, 0, 0, 0, 1, 1,
0.7424949, -0.6947146, 3.051005, 1, 1, 1, 1, 1,
0.7442933, 0.1522029, 0.8626257, 1, 1, 1, 1, 1,
0.7443966, 0.8470169, 0.660228, 1, 1, 1, 1, 1,
0.7491574, 0.04707563, 1.518747, 1, 1, 1, 1, 1,
0.7516254, 1.369389, 1.924312, 1, 1, 1, 1, 1,
0.7521998, -2.076189, 1.537997, 1, 1, 1, 1, 1,
0.7526012, 1.362384, 1.230539, 1, 1, 1, 1, 1,
0.7529103, 1.002641, -0.165327, 1, 1, 1, 1, 1,
0.7541991, -1.371254, 3.938299, 1, 1, 1, 1, 1,
0.7597599, 1.543068, 0.5235283, 1, 1, 1, 1, 1,
0.7747567, -1.524226, 3.714022, 1, 1, 1, 1, 1,
0.7752182, -0.5560814, 1.481766, 1, 1, 1, 1, 1,
0.7771802, -0.7469206, 1.641654, 1, 1, 1, 1, 1,
0.7773838, 1.427584, 0.6569585, 1, 1, 1, 1, 1,
0.7791616, -0.2325605, 1.062995, 1, 1, 1, 1, 1,
0.7796926, 0.2390338, -0.06272875, 0, 0, 1, 1, 1,
0.7830296, 0.8723428, -0.4431812, 1, 0, 0, 1, 1,
0.8006035, -0.09137135, 0.6848524, 1, 0, 0, 1, 1,
0.8013304, 1.483087, 0.9144059, 1, 0, 0, 1, 1,
0.8104741, -0.428694, 1.502024, 1, 0, 0, 1, 1,
0.8135703, 0.4261366, 2.635763, 1, 0, 0, 1, 1,
0.8268092, 0.3787736, -0.02132336, 0, 0, 0, 1, 1,
0.8308479, 1.100543, 2.077159, 0, 0, 0, 1, 1,
0.8339066, 1.004916, 0.07578909, 0, 0, 0, 1, 1,
0.8353226, 1.177709, -0.03496266, 0, 0, 0, 1, 1,
0.836028, 1.080092, 0.5809347, 0, 0, 0, 1, 1,
0.8450747, -0.8824908, 3.292022, 0, 0, 0, 1, 1,
0.8505379, -0.5214334, 1.780971, 0, 0, 0, 1, 1,
0.8561857, 0.627203, -0.09655341, 1, 1, 1, 1, 1,
0.8564603, -0.03781968, 1.112783, 1, 1, 1, 1, 1,
0.857655, -0.6943966, 0.8074003, 1, 1, 1, 1, 1,
0.8577079, -1.146348, 2.240548, 1, 1, 1, 1, 1,
0.8627397, 0.01650705, 0.4187948, 1, 1, 1, 1, 1,
0.8638775, 0.4214355, 1.011847, 1, 1, 1, 1, 1,
0.867442, 1.209506, 1.827422, 1, 1, 1, 1, 1,
0.868436, -0.2458374, 2.436971, 1, 1, 1, 1, 1,
0.8684806, -0.2008238, 2.759468, 1, 1, 1, 1, 1,
0.8689944, -1.895772, 3.597804, 1, 1, 1, 1, 1,
0.8693691, -1.206578, 3.323346, 1, 1, 1, 1, 1,
0.8708544, 0.2621012, 2.316389, 1, 1, 1, 1, 1,
0.8766752, -0.9739369, 1.49254, 1, 1, 1, 1, 1,
0.8830897, 0.998121, 1.971971, 1, 1, 1, 1, 1,
0.8859943, 0.2728296, 1.7416, 1, 1, 1, 1, 1,
0.8874732, -1.745647, 1.472191, 0, 0, 1, 1, 1,
0.8998375, 0.4882899, 1.323522, 1, 0, 0, 1, 1,
0.9006416, 1.286868, 0.8605873, 1, 0, 0, 1, 1,
0.9045997, -0.774817, 2.569829, 1, 0, 0, 1, 1,
0.907617, -0.8628057, 3.000107, 1, 0, 0, 1, 1,
0.9148116, 0.04607473, 2.531546, 1, 0, 0, 1, 1,
0.9158773, -0.1130271, 1.940009, 0, 0, 0, 1, 1,
0.9159082, 0.5597544, 1.29396, 0, 0, 0, 1, 1,
0.9159452, -0.2121207, -0.2211882, 0, 0, 0, 1, 1,
0.919119, -0.3206328, 0.5953497, 0, 0, 0, 1, 1,
0.9209552, -0.1939566, 2.177751, 0, 0, 0, 1, 1,
0.9242387, 2.557208, 1.028423, 0, 0, 0, 1, 1,
0.9331774, 1.045649, 1.098728, 0, 0, 0, 1, 1,
0.9353551, -0.3507439, 3.437238, 1, 1, 1, 1, 1,
0.9354916, 2.220225, 0.6346848, 1, 1, 1, 1, 1,
0.936637, -1.412192, 2.045596, 1, 1, 1, 1, 1,
0.9387179, -0.4972062, 3.559922, 1, 1, 1, 1, 1,
0.9396079, 0.7901475, 0.1337031, 1, 1, 1, 1, 1,
0.9545099, 0.6795529, -0.5113332, 1, 1, 1, 1, 1,
0.9606658, 1.438446, 0.1676147, 1, 1, 1, 1, 1,
0.9616967, -0.77241, 1.879681, 1, 1, 1, 1, 1,
0.9640155, 0.8554141, -0.2008754, 1, 1, 1, 1, 1,
0.9704033, 1.158492, 0.4425491, 1, 1, 1, 1, 1,
0.9719486, -0.5847546, 3.285076, 1, 1, 1, 1, 1,
0.9750146, 1.449197, -0.4299758, 1, 1, 1, 1, 1,
0.9768388, -0.5362659, 2.19751, 1, 1, 1, 1, 1,
0.9801365, 0.07556393, 2.350778, 1, 1, 1, 1, 1,
0.982179, -3.835381, 2.969126, 1, 1, 1, 1, 1,
0.9832079, -0.2540147, 1.429765, 0, 0, 1, 1, 1,
0.9886363, 0.5488104, 2.025683, 1, 0, 0, 1, 1,
0.9921576, -0.1040948, 1.397775, 1, 0, 0, 1, 1,
1.001318, 0.0354014, -0.5110206, 1, 0, 0, 1, 1,
1.003626, 0.4163192, 1.198757, 1, 0, 0, 1, 1,
1.014845, -0.3729952, 2.585074, 1, 0, 0, 1, 1,
1.01636, 0.2647136, 0.0255264, 0, 0, 0, 1, 1,
1.019273, 1.109894, 1.296632, 0, 0, 0, 1, 1,
1.022776, 0.2428667, 2.064184, 0, 0, 0, 1, 1,
1.027802, -0.4495497, 0.3510981, 0, 0, 0, 1, 1,
1.032806, -0.1656023, 2.001725, 0, 0, 0, 1, 1,
1.048096, 0.3583014, 2.780087, 0, 0, 0, 1, 1,
1.051119, -1.094002, -0.01524576, 0, 0, 0, 1, 1,
1.051451, 0.8850418, 0.9859036, 1, 1, 1, 1, 1,
1.059019, -0.3267202, 1.92151, 1, 1, 1, 1, 1,
1.071116, 0.3105262, 1.957358, 1, 1, 1, 1, 1,
1.071455, -0.2961467, 1.362109, 1, 1, 1, 1, 1,
1.073884, -0.4551116, 1.693485, 1, 1, 1, 1, 1,
1.082171, 0.5402097, 1.51448, 1, 1, 1, 1, 1,
1.092586, 1.045525, 0.839081, 1, 1, 1, 1, 1,
1.095091, 0.07427236, -0.5383614, 1, 1, 1, 1, 1,
1.096839, -0.06821916, 2.868529, 1, 1, 1, 1, 1,
1.097739, 1.920712, 2.164809, 1, 1, 1, 1, 1,
1.107812, 0.07013078, 0.7401426, 1, 1, 1, 1, 1,
1.108322, -1.807049, 2.786904, 1, 1, 1, 1, 1,
1.124715, 0.8795543, 1.515983, 1, 1, 1, 1, 1,
1.128463, -0.4738366, 0.4640031, 1, 1, 1, 1, 1,
1.150752, 0.5883999, 0.3689627, 1, 1, 1, 1, 1,
1.159132, 1.190979, -0.468062, 0, 0, 1, 1, 1,
1.170923, 1.926332, 0.8856049, 1, 0, 0, 1, 1,
1.174018, -0.5743036, 2.547773, 1, 0, 0, 1, 1,
1.180456, 1.382265, -0.2601438, 1, 0, 0, 1, 1,
1.188995, 1.360531, 0.2555467, 1, 0, 0, 1, 1,
1.190759, -0.03242181, 1.772255, 1, 0, 0, 1, 1,
1.191112, -1.397992, 2.858191, 0, 0, 0, 1, 1,
1.206702, 1.642927, -0.1153026, 0, 0, 0, 1, 1,
1.207964, -1.377348, 1.130162, 0, 0, 0, 1, 1,
1.209331, -1.366571, 2.343323, 0, 0, 0, 1, 1,
1.210197, -0.4220205, 1.803507, 0, 0, 0, 1, 1,
1.212348, 2.214999, -0.01014712, 0, 0, 0, 1, 1,
1.214264, 0.7585041, 2.795727, 0, 0, 0, 1, 1,
1.22705, 0.8027527, 0.859735, 1, 1, 1, 1, 1,
1.230763, -0.9637787, 1.234668, 1, 1, 1, 1, 1,
1.235046, -0.1958405, 2.867482, 1, 1, 1, 1, 1,
1.238056, 0.4864243, 2.545446, 1, 1, 1, 1, 1,
1.244966, 0.07505092, 0.4461126, 1, 1, 1, 1, 1,
1.248741, 0.7077329, 1.742527, 1, 1, 1, 1, 1,
1.25006, -1.349694, 1.473841, 1, 1, 1, 1, 1,
1.250712, 0.1172013, 3.816558, 1, 1, 1, 1, 1,
1.254375, -2.240634, 3.279016, 1, 1, 1, 1, 1,
1.254486, 0.514913, 1.710756, 1, 1, 1, 1, 1,
1.263256, -3.172505, 1.459834, 1, 1, 1, 1, 1,
1.264015, 0.6058846, 0.3699993, 1, 1, 1, 1, 1,
1.268322, 0.1714638, 1.288862, 1, 1, 1, 1, 1,
1.272112, 0.2236524, 0.5681636, 1, 1, 1, 1, 1,
1.305115, 0.8874215, 0.1429359, 1, 1, 1, 1, 1,
1.306082, 0.4043381, 1.833168, 0, 0, 1, 1, 1,
1.322525, -1.086917, 1.735886, 1, 0, 0, 1, 1,
1.328501, -0.645594, 1.449155, 1, 0, 0, 1, 1,
1.339384, 0.8147288, 0.8970945, 1, 0, 0, 1, 1,
1.34854, 0.4312624, 0.8420884, 1, 0, 0, 1, 1,
1.350475, -0.3196291, 2.485066, 1, 0, 0, 1, 1,
1.359879, -0.2948406, 2.020605, 0, 0, 0, 1, 1,
1.380664, -1.139318, 2.306678, 0, 0, 0, 1, 1,
1.383415, 1.4964, -0.02871324, 0, 0, 0, 1, 1,
1.383675, 0.432662, 1.031982, 0, 0, 0, 1, 1,
1.388457, 1.826432, -0.1411633, 0, 0, 0, 1, 1,
1.421888, -1.361719, 3.159624, 0, 0, 0, 1, 1,
1.438623, 0.1449992, 1.343404, 0, 0, 0, 1, 1,
1.460524, -2.499865, 2.321782, 1, 1, 1, 1, 1,
1.483361, 0.923988, 1.79803, 1, 1, 1, 1, 1,
1.488561, 0.4938864, 2.661499, 1, 1, 1, 1, 1,
1.492448, 1.29478, 0.2076302, 1, 1, 1, 1, 1,
1.498488, -2.438039, 2.138264, 1, 1, 1, 1, 1,
1.506499, 0.5449861, 0.7421098, 1, 1, 1, 1, 1,
1.511559, 0.1087672, 0.3139284, 1, 1, 1, 1, 1,
1.513466, -0.8935024, 0.4697285, 1, 1, 1, 1, 1,
1.516456, -1.057653, 5.270179, 1, 1, 1, 1, 1,
1.518327, -0.002727944, 0.9254177, 1, 1, 1, 1, 1,
1.523616, -0.2661791, -0.6991543, 1, 1, 1, 1, 1,
1.54439, 0.1203842, 0.8794159, 1, 1, 1, 1, 1,
1.576805, -1.276668, 2.451246, 1, 1, 1, 1, 1,
1.581167, 0.5720989, 0.8211198, 1, 1, 1, 1, 1,
1.585339, 0.6381403, 0.7646524, 1, 1, 1, 1, 1,
1.589393, 0.6554618, -0.8858848, 0, 0, 1, 1, 1,
1.590094, -2.371175, 2.99265, 1, 0, 0, 1, 1,
1.621262, 1.118764, 1.450232, 1, 0, 0, 1, 1,
1.622494, -0.4625373, 2.72571, 1, 0, 0, 1, 1,
1.62453, -0.1825963, 1.016483, 1, 0, 0, 1, 1,
1.630037, 0.5859314, 1.515591, 1, 0, 0, 1, 1,
1.632666, -1.452463, 1.855308, 0, 0, 0, 1, 1,
1.639328, 1.305853, 1.096416, 0, 0, 0, 1, 1,
1.646027, 0.9061606, 1.303076, 0, 0, 0, 1, 1,
1.662511, -1.924246, 2.227173, 0, 0, 0, 1, 1,
1.665063, 0.8855898, 1.632169, 0, 0, 0, 1, 1,
1.673499, -0.7000868, 0.9160226, 0, 0, 0, 1, 1,
1.717661, 0.9200814, 1.536395, 0, 0, 0, 1, 1,
1.732876, 1.643587, 0.5445179, 1, 1, 1, 1, 1,
1.737396, 0.08346586, 1.201564, 1, 1, 1, 1, 1,
1.765779, 0.4733882, 0.09406254, 1, 1, 1, 1, 1,
1.770319, 0.5349045, -0.1616261, 1, 1, 1, 1, 1,
1.781654, 3.531645, -0.5775422, 1, 1, 1, 1, 1,
1.820094, -0.526352, 0.1841293, 1, 1, 1, 1, 1,
1.824793, 0.4517564, -0.8004808, 1, 1, 1, 1, 1,
1.837623, -1.023167, 1.23889, 1, 1, 1, 1, 1,
1.877895, 2.138578, 1.410795, 1, 1, 1, 1, 1,
1.878436, 0.02533349, 0.8226498, 1, 1, 1, 1, 1,
1.898491, -1.495057, 2.468233, 1, 1, 1, 1, 1,
1.916908, 0.4306283, -0.2132748, 1, 1, 1, 1, 1,
1.947106, -0.2913553, 3.607427, 1, 1, 1, 1, 1,
1.957509, -0.7321848, 0.1748285, 1, 1, 1, 1, 1,
1.9706, -0.2292597, 1.001243, 1, 1, 1, 1, 1,
1.973438, -0.9324423, 1.652994, 0, 0, 1, 1, 1,
1.982159, 1.302549, 0.5003098, 1, 0, 0, 1, 1,
2.018218, 0.5372735, 2.094155, 1, 0, 0, 1, 1,
2.037647, 0.09084612, 0.3574499, 1, 0, 0, 1, 1,
2.064323, -0.1008474, 2.286451, 1, 0, 0, 1, 1,
2.086251, -0.4811571, 3.369645, 1, 0, 0, 1, 1,
2.101864, -0.4679749, 2.433286, 0, 0, 0, 1, 1,
2.10724, -1.237761, 3.16698, 0, 0, 0, 1, 1,
2.128026, -0.08569356, -0.4841967, 0, 0, 0, 1, 1,
2.147862, -0.7430413, 1.880235, 0, 0, 0, 1, 1,
2.148425, -1.213035, 3.977716, 0, 0, 0, 1, 1,
2.166266, 1.323221, -0.2221534, 0, 0, 0, 1, 1,
2.255595, -0.2083622, 1.246889, 0, 0, 0, 1, 1,
2.306859, 2.482258, -0.680396, 1, 1, 1, 1, 1,
2.383769, 0.6909361, 1.493014, 1, 1, 1, 1, 1,
2.515452, -0.135215, 2.389772, 1, 1, 1, 1, 1,
2.536633, 0.3400863, 1.396858, 1, 1, 1, 1, 1,
2.62216, 1.351833, 1.493122, 1, 1, 1, 1, 1,
2.833436, 0.8152865, -0.003530707, 1, 1, 1, 1, 1,
2.977831, 1.064775, 1.328079, 1, 1, 1, 1, 1
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
var radius = 9.91181;
var distance = 34.81481;
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
mvMatrix.translate( 0.2023124, 0.1375923, 0.1835449 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.81481);
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
