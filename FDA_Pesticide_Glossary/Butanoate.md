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
-2.857155, 0.05472133, -2.844685, 1, 0, 0, 1,
-2.751891, 0.5026544, -1.416469, 1, 0.007843138, 0, 1,
-2.724033, -0.3021081, -2.455107, 1, 0.01176471, 0, 1,
-2.615341, 0.3948175, -1.380504, 1, 0.01960784, 0, 1,
-2.54054, 1.107507, -0.5638162, 1, 0.02352941, 0, 1,
-2.40526, 0.1750936, -1.302106, 1, 0.03137255, 0, 1,
-2.32249, 0.04577238, -2.05027, 1, 0.03529412, 0, 1,
-2.307441, -0.8072572, -1.583509, 1, 0.04313726, 0, 1,
-2.285253, 0.3623113, 0.9780305, 1, 0.04705882, 0, 1,
-2.236869, 0.3937533, -0.891149, 1, 0.05490196, 0, 1,
-2.224543, -0.8668, -1.176719, 1, 0.05882353, 0, 1,
-2.180589, 2.401129, 0.8818604, 1, 0.06666667, 0, 1,
-2.171136, -0.197038, 1.143634, 1, 0.07058824, 0, 1,
-2.098259, 3.281321, -0.1753682, 1, 0.07843138, 0, 1,
-2.090693, 1.496853, -0.6232873, 1, 0.08235294, 0, 1,
-2.08465, -0.8659182, -1.181508, 1, 0.09019608, 0, 1,
-2.04234, -1.6174, -2.469941, 1, 0.09411765, 0, 1,
-1.981105, 1.099923, -1.416401, 1, 0.1019608, 0, 1,
-1.971854, -1.238928, -2.627391, 1, 0.1098039, 0, 1,
-1.941452, 0.6528942, -0.05270053, 1, 0.1137255, 0, 1,
-1.940156, -1.590815, -1.250777, 1, 0.1215686, 0, 1,
-1.932193, 0.08342065, -0.9089867, 1, 0.1254902, 0, 1,
-1.917059, -1.335864, -3.406374, 1, 0.1333333, 0, 1,
-1.889565, -1.390349, -2.537842, 1, 0.1372549, 0, 1,
-1.882121, 1.759415, -1.176277, 1, 0.145098, 0, 1,
-1.85456, -1.762659, -3.228938, 1, 0.1490196, 0, 1,
-1.82089, -1.704146, -2.370394, 1, 0.1568628, 0, 1,
-1.817191, 1.965916, -0.5692424, 1, 0.1607843, 0, 1,
-1.77933, 0.7810224, -1.565451, 1, 0.1686275, 0, 1,
-1.779322, -0.8348588, -0.559241, 1, 0.172549, 0, 1,
-1.758, -2.045192, -1.111528, 1, 0.1803922, 0, 1,
-1.74124, 1.397368, 1.343059, 1, 0.1843137, 0, 1,
-1.74071, -0.4593455, -2.65465, 1, 0.1921569, 0, 1,
-1.730788, 1.20107, -1.305247, 1, 0.1960784, 0, 1,
-1.727823, -0.470681, -0.8160957, 1, 0.2039216, 0, 1,
-1.7208, 0.6131977, -1.346571, 1, 0.2117647, 0, 1,
-1.707834, 0.4855683, -1.488361, 1, 0.2156863, 0, 1,
-1.707503, 0.6534326, -0.3807438, 1, 0.2235294, 0, 1,
-1.70302, 0.1293943, -1.840715, 1, 0.227451, 0, 1,
-1.700672, -1.532728, -2.939208, 1, 0.2352941, 0, 1,
-1.698237, -0.08583451, -0.472919, 1, 0.2392157, 0, 1,
-1.696228, 0.2216693, -0.1746715, 1, 0.2470588, 0, 1,
-1.67225, 1.013731, -1.742488, 1, 0.2509804, 0, 1,
-1.662913, -0.3772105, -2.128529, 1, 0.2588235, 0, 1,
-1.65575, 0.1551793, -0.3106298, 1, 0.2627451, 0, 1,
-1.650029, 1.312607, -2.011063, 1, 0.2705882, 0, 1,
-1.649201, -0.5831302, 0.3178507, 1, 0.2745098, 0, 1,
-1.645932, 0.6459777, -0.9613152, 1, 0.282353, 0, 1,
-1.644689, 0.9205509, -1.192038, 1, 0.2862745, 0, 1,
-1.642431, 1.634531, -1.762392, 1, 0.2941177, 0, 1,
-1.635049, 0.380805, -1.529891, 1, 0.3019608, 0, 1,
-1.624247, 0.5243812, -1.040093, 1, 0.3058824, 0, 1,
-1.62399, -0.7424185, -2.946817, 1, 0.3137255, 0, 1,
-1.619882, -0.3020564, -2.659866, 1, 0.3176471, 0, 1,
-1.61574, -0.8405551, -3.996451, 1, 0.3254902, 0, 1,
-1.615514, -0.4868595, -1.901412, 1, 0.3294118, 0, 1,
-1.593807, -1.021776, -1.951838, 1, 0.3372549, 0, 1,
-1.590023, -1.685191, -2.300977, 1, 0.3411765, 0, 1,
-1.580487, -2.056793, -1.751641, 1, 0.3490196, 0, 1,
-1.570142, -0.1149969, 0.3762935, 1, 0.3529412, 0, 1,
-1.56338, -0.3625785, -1.741238, 1, 0.3607843, 0, 1,
-1.555729, 0.3445858, -1.353426, 1, 0.3647059, 0, 1,
-1.55147, -0.2923862, -1.230584, 1, 0.372549, 0, 1,
-1.538734, 1.015785, -0.2527716, 1, 0.3764706, 0, 1,
-1.518503, 0.04616574, -0.51817, 1, 0.3843137, 0, 1,
-1.506356, 0.006828575, -0.4270792, 1, 0.3882353, 0, 1,
-1.5061, 1.217336, 1.11628, 1, 0.3960784, 0, 1,
-1.499046, 1.266395, -0.9359597, 1, 0.4039216, 0, 1,
-1.491316, -0.5154791, -0.2522401, 1, 0.4078431, 0, 1,
-1.487238, 0.871102, -0.2717861, 1, 0.4156863, 0, 1,
-1.469122, 0.7682794, -0.7723621, 1, 0.4196078, 0, 1,
-1.459925, -0.7920935, -2.46857, 1, 0.427451, 0, 1,
-1.457663, -0.398265, -1.70033, 1, 0.4313726, 0, 1,
-1.444535, 0.1743976, -2.072908, 1, 0.4392157, 0, 1,
-1.441728, -0.3568327, -2.259007, 1, 0.4431373, 0, 1,
-1.43528, 0.09749612, -1.424906, 1, 0.4509804, 0, 1,
-1.433695, 1.013285, -0.05725046, 1, 0.454902, 0, 1,
-1.431045, 0.03539094, -1.509798, 1, 0.4627451, 0, 1,
-1.424717, 0.9710361, -1.097426, 1, 0.4666667, 0, 1,
-1.423338, -0.4431654, -2.686916, 1, 0.4745098, 0, 1,
-1.407972, 0.7610293, 0.0249806, 1, 0.4784314, 0, 1,
-1.404276, -0.05886498, -2.874799, 1, 0.4862745, 0, 1,
-1.404276, 0.8197036, 0.2653412, 1, 0.4901961, 0, 1,
-1.401424, 0.942586, -0.2918504, 1, 0.4980392, 0, 1,
-1.390667, -0.7661945, -0.8617774, 1, 0.5058824, 0, 1,
-1.38667, -1.427101, -2.672153, 1, 0.509804, 0, 1,
-1.385855, -0.2271198, -0.7696944, 1, 0.5176471, 0, 1,
-1.360533, -0.6229133, -2.249848, 1, 0.5215687, 0, 1,
-1.358845, -0.3300034, -1.870874, 1, 0.5294118, 0, 1,
-1.357972, 0.4803639, -1.148318, 1, 0.5333334, 0, 1,
-1.351463, -1.079409, -1.745969, 1, 0.5411765, 0, 1,
-1.34993, -0.2155817, -1.459538, 1, 0.5450981, 0, 1,
-1.339512, -2.000836, -0.9574226, 1, 0.5529412, 0, 1,
-1.338731, -0.1455151, -1.974714, 1, 0.5568628, 0, 1,
-1.336706, -0.6757999, -1.852826, 1, 0.5647059, 0, 1,
-1.321324, -0.2490847, -1.950131, 1, 0.5686275, 0, 1,
-1.316453, -1.509678, -1.14496, 1, 0.5764706, 0, 1,
-1.303358, -1.014702, -2.310874, 1, 0.5803922, 0, 1,
-1.293205, -1.454133, -3.55135, 1, 0.5882353, 0, 1,
-1.28094, 1.209139, -2.395195, 1, 0.5921569, 0, 1,
-1.275013, -1.180724, -2.171798, 1, 0.6, 0, 1,
-1.265735, 0.7842035, -0.1141159, 1, 0.6078432, 0, 1,
-1.25232, -0.6462451, -1.723109, 1, 0.6117647, 0, 1,
-1.246833, -1.076175, -3.918352, 1, 0.6196079, 0, 1,
-1.242291, -1.276299, -2.491912, 1, 0.6235294, 0, 1,
-1.238927, -2.002361, -1.376935, 1, 0.6313726, 0, 1,
-1.235808, -0.675059, -2.563203, 1, 0.6352941, 0, 1,
-1.231301, 1.232995, -2.570029, 1, 0.6431373, 0, 1,
-1.230727, -0.2283314, -1.879695, 1, 0.6470588, 0, 1,
-1.218587, 0.9392654, -1.979823, 1, 0.654902, 0, 1,
-1.196451, -0.9847413, -2.245177, 1, 0.6588235, 0, 1,
-1.194604, -0.9337809, -2.956131, 1, 0.6666667, 0, 1,
-1.188237, 0.3187078, -2.66044, 1, 0.6705883, 0, 1,
-1.184223, -0.13319, -1.064619, 1, 0.6784314, 0, 1,
-1.18326, -0.7580022, -2.308761, 1, 0.682353, 0, 1,
-1.177559, -0.6099507, -3.521666, 1, 0.6901961, 0, 1,
-1.176325, -0.5902422, -2.753571, 1, 0.6941177, 0, 1,
-1.175538, -1.651935, -2.198736, 1, 0.7019608, 0, 1,
-1.174475, -0.7883908, -3.164451, 1, 0.7098039, 0, 1,
-1.173365, 0.30378, -2.466908, 1, 0.7137255, 0, 1,
-1.160958, -0.4538765, -2.676935, 1, 0.7215686, 0, 1,
-1.160814, 0.2778459, -0.1136543, 1, 0.7254902, 0, 1,
-1.157487, 0.002123735, -0.5738444, 1, 0.7333333, 0, 1,
-1.153808, 0.5291178, -3.029238, 1, 0.7372549, 0, 1,
-1.153289, 0.06964878, -2.047602, 1, 0.7450981, 0, 1,
-1.150651, -0.4922052, -2.505445, 1, 0.7490196, 0, 1,
-1.150384, 0.1809371, 0.6433086, 1, 0.7568628, 0, 1,
-1.145206, 1.157274, -2.899129, 1, 0.7607843, 0, 1,
-1.139855, 1.393493, -0.8422431, 1, 0.7686275, 0, 1,
-1.138576, 1.541533, 0.5894769, 1, 0.772549, 0, 1,
-1.135908, -0.1540016, -1.733878, 1, 0.7803922, 0, 1,
-1.13571, 0.4447798, -0.6552967, 1, 0.7843137, 0, 1,
-1.132201, -0.5111128, -3.315584, 1, 0.7921569, 0, 1,
-1.127089, -1.246124, -3.537498, 1, 0.7960784, 0, 1,
-1.123306, 1.823173, -1.393763, 1, 0.8039216, 0, 1,
-1.123069, -0.2532723, -1.781632, 1, 0.8117647, 0, 1,
-1.117576, -0.6869628, -1.817473, 1, 0.8156863, 0, 1,
-1.111076, 1.341177, -1.900916, 1, 0.8235294, 0, 1,
-1.11063, -0.670857, -1.854565, 1, 0.827451, 0, 1,
-1.110134, -1.323556, -2.448513, 1, 0.8352941, 0, 1,
-1.103333, 1.742535, -1.088314, 1, 0.8392157, 0, 1,
-1.10253, 0.4928057, -0.3266698, 1, 0.8470588, 0, 1,
-1.102477, 0.1408628, -0.2467313, 1, 0.8509804, 0, 1,
-1.099827, -1.634915, -3.043802, 1, 0.8588235, 0, 1,
-1.095545, -0.5200298, -2.0825, 1, 0.8627451, 0, 1,
-1.093506, -1.376802, -2.505702, 1, 0.8705882, 0, 1,
-1.073665, -1.049597, -2.993394, 1, 0.8745098, 0, 1,
-1.069492, -0.722692, -1.926351, 1, 0.8823529, 0, 1,
-1.068873, 0.1586221, -2.203141, 1, 0.8862745, 0, 1,
-1.068725, -0.4095757, -0.7660657, 1, 0.8941177, 0, 1,
-1.067894, 0.1319896, -3.281081, 1, 0.8980392, 0, 1,
-1.059005, -0.8779927, -2.842866, 1, 0.9058824, 0, 1,
-1.047176, -2.299448, -3.23331, 1, 0.9137255, 0, 1,
-1.041212, -0.3636147, -0.1220092, 1, 0.9176471, 0, 1,
-1.03904, 0.4325586, -0.8892631, 1, 0.9254902, 0, 1,
-1.027387, 1.934682, -0.1829163, 1, 0.9294118, 0, 1,
-1.024159, 0.9166347, 0.2689529, 1, 0.9372549, 0, 1,
-1.019818, -0.6033036, -3.075349, 1, 0.9411765, 0, 1,
-1.018856, 0.2544739, -2.043604, 1, 0.9490196, 0, 1,
-1.011282, -0.7527099, -2.653166, 1, 0.9529412, 0, 1,
-1.007029, -0.04380979, -0.234458, 1, 0.9607843, 0, 1,
-1.001766, 1.519075, -1.148577, 1, 0.9647059, 0, 1,
-1.001494, 0.1663199, -1.427345, 1, 0.972549, 0, 1,
-1.000459, -0.8506502, -0.8851464, 1, 0.9764706, 0, 1,
-0.9991783, 0.5969954, -0.763895, 1, 0.9843137, 0, 1,
-0.9973308, 0.4739937, -1.564734, 1, 0.9882353, 0, 1,
-0.9914478, -0.6563354, -3.623545, 1, 0.9960784, 0, 1,
-0.9892613, -0.01066547, -1.33274, 0.9960784, 1, 0, 1,
-0.9743841, 0.04936219, -1.597547, 0.9921569, 1, 0, 1,
-0.9730182, 0.825206, -0.02910193, 0.9843137, 1, 0, 1,
-0.9672803, -0.1635603, -2.469055, 0.9803922, 1, 0, 1,
-0.9645447, 1.890341, 0.2150497, 0.972549, 1, 0, 1,
-0.9566123, 2.461053, -1.236158, 0.9686275, 1, 0, 1,
-0.9542152, 0.3660091, -1.220204, 0.9607843, 1, 0, 1,
-0.9484161, 0.0967494, -0.6006296, 0.9568627, 1, 0, 1,
-0.9468017, -0.5187382, -1.087755, 0.9490196, 1, 0, 1,
-0.9444489, -0.3852048, -1.557439, 0.945098, 1, 0, 1,
-0.9438655, 0.02077433, -1.066446, 0.9372549, 1, 0, 1,
-0.9411775, 2.368872, -1.87591, 0.9333333, 1, 0, 1,
-0.9410734, -0.3987638, -1.162945, 0.9254902, 1, 0, 1,
-0.9390337, 0.9579817, -2.616602, 0.9215686, 1, 0, 1,
-0.9034402, 1.270725, 0.2982403, 0.9137255, 1, 0, 1,
-0.9002954, 1.450036, -0.03590234, 0.9098039, 1, 0, 1,
-0.8988571, 0.4274102, -0.7692508, 0.9019608, 1, 0, 1,
-0.8965448, -0.7916541, -2.890006, 0.8941177, 1, 0, 1,
-0.8918408, -0.2721698, -2.08307, 0.8901961, 1, 0, 1,
-0.889074, 0.1962463, 0.8613276, 0.8823529, 1, 0, 1,
-0.8872891, -0.4160409, -2.066249, 0.8784314, 1, 0, 1,
-0.8856164, 0.4799252, -1.830173, 0.8705882, 1, 0, 1,
-0.8851085, -0.3079626, -1.139442, 0.8666667, 1, 0, 1,
-0.882834, 0.8718725, -0.9034455, 0.8588235, 1, 0, 1,
-0.8824614, 1.762812, -1.068323, 0.854902, 1, 0, 1,
-0.8799908, -0.6750298, -3.178147, 0.8470588, 1, 0, 1,
-0.8768216, -2.132963, -3.246522, 0.8431373, 1, 0, 1,
-0.8658595, 0.08710721, -2.480945, 0.8352941, 1, 0, 1,
-0.8616927, 0.8076953, -1.324432, 0.8313726, 1, 0, 1,
-0.8616672, 0.7378415, 0.1015754, 0.8235294, 1, 0, 1,
-0.8572156, -0.1901668, -2.357442, 0.8196079, 1, 0, 1,
-0.8519285, -0.2165592, -2.979255, 0.8117647, 1, 0, 1,
-0.8474312, 1.390258, -0.2689601, 0.8078431, 1, 0, 1,
-0.8435546, -0.8028738, -3.09918, 0.8, 1, 0, 1,
-0.8433759, -2.195455, -0.7910595, 0.7921569, 1, 0, 1,
-0.8415881, 0.15809, -3.700685, 0.7882353, 1, 0, 1,
-0.8380401, 0.7331521, -0.5005629, 0.7803922, 1, 0, 1,
-0.832178, 0.2106835, -2.150955, 0.7764706, 1, 0, 1,
-0.8273527, -0.2826449, -1.056842, 0.7686275, 1, 0, 1,
-0.8272586, 0.96772, 0.2586688, 0.7647059, 1, 0, 1,
-0.8252515, -0.5278445, -2.677047, 0.7568628, 1, 0, 1,
-0.8228939, -0.5227302, -2.777292, 0.7529412, 1, 0, 1,
-0.8214002, -1.197818, -3.457654, 0.7450981, 1, 0, 1,
-0.8083503, -0.1827535, -2.37073, 0.7411765, 1, 0, 1,
-0.8072921, -1.062978, -1.121582, 0.7333333, 1, 0, 1,
-0.8060946, 0.217017, -2.791364, 0.7294118, 1, 0, 1,
-0.8012686, -0.1163352, -0.3771524, 0.7215686, 1, 0, 1,
-0.8001366, 0.4001698, -0.536483, 0.7176471, 1, 0, 1,
-0.7997319, 0.3715675, -2.904446, 0.7098039, 1, 0, 1,
-0.7965416, -0.2515174, -0.978774, 0.7058824, 1, 0, 1,
-0.7962496, -0.8796099, -3.982741, 0.6980392, 1, 0, 1,
-0.7945763, -0.1242987, -2.695192, 0.6901961, 1, 0, 1,
-0.7901561, -1.790055, -3.25369, 0.6862745, 1, 0, 1,
-0.7889469, 1.279357, -1.212777, 0.6784314, 1, 0, 1,
-0.78878, -0.6625492, -2.689474, 0.6745098, 1, 0, 1,
-0.7854887, 1.217994, -0.8656767, 0.6666667, 1, 0, 1,
-0.7808861, 0.9364883, 0.07419153, 0.6627451, 1, 0, 1,
-0.7804693, -1.709612, -1.431479, 0.654902, 1, 0, 1,
-0.7788776, 0.2052536, 0.6051337, 0.6509804, 1, 0, 1,
-0.7754549, 1.156006, -3.001573, 0.6431373, 1, 0, 1,
-0.7734563, 1.096236, -0.3989662, 0.6392157, 1, 0, 1,
-0.7716306, 0.2395071, -0.3497609, 0.6313726, 1, 0, 1,
-0.7685985, 0.2198583, -0.6242424, 0.627451, 1, 0, 1,
-0.7685368, -1.58503, -3.879796, 0.6196079, 1, 0, 1,
-0.7596855, 0.2569381, -1.339239, 0.6156863, 1, 0, 1,
-0.7576165, -0.1041771, -2.43766, 0.6078432, 1, 0, 1,
-0.756404, -1.884109, -2.58461, 0.6039216, 1, 0, 1,
-0.7486817, 0.5409051, -1.072464, 0.5960785, 1, 0, 1,
-0.7473109, 0.3074307, -0.08655057, 0.5882353, 1, 0, 1,
-0.7472411, 0.04879308, -2.841772, 0.5843138, 1, 0, 1,
-0.7470427, 0.7707708, -0.7976304, 0.5764706, 1, 0, 1,
-0.746559, 0.989725, -0.9646994, 0.572549, 1, 0, 1,
-0.7355251, 0.7477801, -2.694327, 0.5647059, 1, 0, 1,
-0.7324863, 0.1255478, -2.848859, 0.5607843, 1, 0, 1,
-0.7315876, 0.5672699, -0.7810209, 0.5529412, 1, 0, 1,
-0.7293049, -0.1075391, -0.6138791, 0.5490196, 1, 0, 1,
-0.7262603, 0.7077932, 0.6300088, 0.5411765, 1, 0, 1,
-0.7248168, 0.2050919, -2.146646, 0.5372549, 1, 0, 1,
-0.7175342, -0.7081202, -1.274037, 0.5294118, 1, 0, 1,
-0.7174511, -0.9101008, -1.670606, 0.5254902, 1, 0, 1,
-0.7165971, -2.266752, -2.238225, 0.5176471, 1, 0, 1,
-0.7152133, 0.03779974, -2.752831, 0.5137255, 1, 0, 1,
-0.7111719, -0.577576, -3.074455, 0.5058824, 1, 0, 1,
-0.7091052, -0.4986584, -3.66871, 0.5019608, 1, 0, 1,
-0.7089893, -0.6805596, -1.962158, 0.4941176, 1, 0, 1,
-0.7043624, -0.04517662, -2.650335, 0.4862745, 1, 0, 1,
-0.7043521, -0.2081153, -1.341156, 0.4823529, 1, 0, 1,
-0.7043475, -0.1895731, -2.846631, 0.4745098, 1, 0, 1,
-0.6944758, 1.310425, -0.5421065, 0.4705882, 1, 0, 1,
-0.693972, 1.998226, -0.1810829, 0.4627451, 1, 0, 1,
-0.6932849, 0.3635216, -2.093441, 0.4588235, 1, 0, 1,
-0.6932829, -0.5304058, -2.251208, 0.4509804, 1, 0, 1,
-0.6929665, 1.088655, 0.6024503, 0.4470588, 1, 0, 1,
-0.6926352, -1.68868, -4.366542, 0.4392157, 1, 0, 1,
-0.6910489, -0.7323011, -1.799987, 0.4352941, 1, 0, 1,
-0.6905947, 0.1251909, -2.054459, 0.427451, 1, 0, 1,
-0.6904216, -0.4775696, -1.290778, 0.4235294, 1, 0, 1,
-0.6904172, 1.258955, -0.722976, 0.4156863, 1, 0, 1,
-0.6893834, 1.2987, 0.2567808, 0.4117647, 1, 0, 1,
-0.6832149, -0.5794621, -3.297187, 0.4039216, 1, 0, 1,
-0.6759987, -0.8800755, -2.120823, 0.3960784, 1, 0, 1,
-0.6732965, -0.6510298, -2.387985, 0.3921569, 1, 0, 1,
-0.6675789, 0.8538309, 0.1119609, 0.3843137, 1, 0, 1,
-0.6669464, 0.7369059, -0.1311521, 0.3803922, 1, 0, 1,
-0.6663316, -0.9643131, -2.142019, 0.372549, 1, 0, 1,
-0.6636105, 0.2620027, 0.4174086, 0.3686275, 1, 0, 1,
-0.6593282, 0.197188, 0.2901519, 0.3607843, 1, 0, 1,
-0.6519767, 0.1043936, -1.477806, 0.3568628, 1, 0, 1,
-0.6510124, 0.3945814, 0.146523, 0.3490196, 1, 0, 1,
-0.6462611, -0.6023173, -2.87919, 0.345098, 1, 0, 1,
-0.6453995, -0.6822765, -2.796412, 0.3372549, 1, 0, 1,
-0.6437969, 1.213958, 0.09577756, 0.3333333, 1, 0, 1,
-0.6434452, -0.6485904, -2.389642, 0.3254902, 1, 0, 1,
-0.6407248, -2.27068, -4.649016, 0.3215686, 1, 0, 1,
-0.6348311, 1.971453, 1.381842, 0.3137255, 1, 0, 1,
-0.6343699, -1.189118, -2.23169, 0.3098039, 1, 0, 1,
-0.6331431, 0.7227638, -1.795768, 0.3019608, 1, 0, 1,
-0.6320722, -0.5106856, -2.29591, 0.2941177, 1, 0, 1,
-0.627331, 1.483693, 1.653703, 0.2901961, 1, 0, 1,
-0.6246334, 0.107482, -0.8338749, 0.282353, 1, 0, 1,
-0.6235004, 1.176013, -0.5043089, 0.2784314, 1, 0, 1,
-0.6220867, -2.024028, -3.126466, 0.2705882, 1, 0, 1,
-0.6198615, 0.4551377, -0.4669139, 0.2666667, 1, 0, 1,
-0.6150348, 2.31543, -0.9955308, 0.2588235, 1, 0, 1,
-0.6118829, 2.300598, -0.03351131, 0.254902, 1, 0, 1,
-0.6106123, -0.6929595, -1.215861, 0.2470588, 1, 0, 1,
-0.6068811, -1.303128, -2.732635, 0.2431373, 1, 0, 1,
-0.6060472, -0.1597493, -2.222146, 0.2352941, 1, 0, 1,
-0.5985568, -0.5569121, -3.678634, 0.2313726, 1, 0, 1,
-0.5977808, -0.2525219, -4.119199, 0.2235294, 1, 0, 1,
-0.5960557, 0.6389081, 1.309092, 0.2196078, 1, 0, 1,
-0.5919018, 0.2428833, -0.02733126, 0.2117647, 1, 0, 1,
-0.5907658, -0.6249679, -3.1564, 0.2078431, 1, 0, 1,
-0.590454, 1.29661, -0.5630057, 0.2, 1, 0, 1,
-0.5835213, -1.110313, -2.519269, 0.1921569, 1, 0, 1,
-0.5820074, -1.40224, -3.057167, 0.1882353, 1, 0, 1,
-0.5817049, -0.4950472, -2.265374, 0.1803922, 1, 0, 1,
-0.5783758, -0.9677604, -1.760164, 0.1764706, 1, 0, 1,
-0.5779541, 2.077507, -1.691178, 0.1686275, 1, 0, 1,
-0.5754333, -2.436062, -2.934636, 0.1647059, 1, 0, 1,
-0.5730627, -2.218108, -4.133151, 0.1568628, 1, 0, 1,
-0.5729518, -0.324024, -2.383901, 0.1529412, 1, 0, 1,
-0.5678174, 1.060523, -0.7102303, 0.145098, 1, 0, 1,
-0.5676691, -0.6839811, -3.635478, 0.1411765, 1, 0, 1,
-0.5669156, 1.171894, 0.7263374, 0.1333333, 1, 0, 1,
-0.5665163, -0.07397138, 1.007349, 0.1294118, 1, 0, 1,
-0.5620775, 1.558966, -0.2459511, 0.1215686, 1, 0, 1,
-0.5613341, 0.6254837, -0.5499179, 0.1176471, 1, 0, 1,
-0.5606764, 0.4705316, -1.435922, 0.1098039, 1, 0, 1,
-0.5583874, 0.1929517, -3.136419, 0.1058824, 1, 0, 1,
-0.5576458, -0.3784322, -2.121024, 0.09803922, 1, 0, 1,
-0.5508428, 0.5926028, -1.11192, 0.09019608, 1, 0, 1,
-0.5503919, 1.043784, 1.111702, 0.08627451, 1, 0, 1,
-0.5484166, 1.5, -1.870697, 0.07843138, 1, 0, 1,
-0.5473594, -2.260915, -1.920393, 0.07450981, 1, 0, 1,
-0.5422524, 0.1707956, -1.523334, 0.06666667, 1, 0, 1,
-0.5419309, -0.3128627, -1.613049, 0.0627451, 1, 0, 1,
-0.5340918, 0.2018905, 0.327018, 0.05490196, 1, 0, 1,
-0.5323895, -0.8876072, -2.9656, 0.05098039, 1, 0, 1,
-0.5305393, 1.266196, -1.921616, 0.04313726, 1, 0, 1,
-0.5293882, 0.4898402, -1.284724, 0.03921569, 1, 0, 1,
-0.5261274, -0.4268569, -0.3155617, 0.03137255, 1, 0, 1,
-0.5153956, 0.6820419, -0.5364782, 0.02745098, 1, 0, 1,
-0.5153689, 1.691745, -1.077362, 0.01960784, 1, 0, 1,
-0.5153301, -1.66751, -2.099736, 0.01568628, 1, 0, 1,
-0.5132765, 0.1832407, -0.7731719, 0.007843138, 1, 0, 1,
-0.5132084, -0.4878258, -1.690684, 0.003921569, 1, 0, 1,
-0.5131776, 0.8006974, -0.1742803, 0, 1, 0.003921569, 1,
-0.5127544, -0.2482765, -1.075257, 0, 1, 0.01176471, 1,
-0.5115113, -0.07096972, -0.2186707, 0, 1, 0.01568628, 1,
-0.5106695, -0.2165635, -2.664841, 0, 1, 0.02352941, 1,
-0.5102747, -0.510769, -2.986286, 0, 1, 0.02745098, 1,
-0.5089846, 0.3500478, -0.1603261, 0, 1, 0.03529412, 1,
-0.506696, -0.7432386, -1.355377, 0, 1, 0.03921569, 1,
-0.5058739, 0.8084166, -1.643803, 0, 1, 0.04705882, 1,
-0.5011399, -0.3764166, -1.447133, 0, 1, 0.05098039, 1,
-0.4980121, -1.487099, -1.645434, 0, 1, 0.05882353, 1,
-0.4852887, 0.5407819, -3.407722, 0, 1, 0.0627451, 1,
-0.4841886, 0.5321964, -1.923824, 0, 1, 0.07058824, 1,
-0.477712, 1.405733, 0.2527721, 0, 1, 0.07450981, 1,
-0.4749244, 2.081503, 0.7035403, 0, 1, 0.08235294, 1,
-0.4729108, 0.7836642, -0.03637079, 0, 1, 0.08627451, 1,
-0.4691824, 0.3514118, -1.344563, 0, 1, 0.09411765, 1,
-0.4683475, -1.037404, -2.869353, 0, 1, 0.1019608, 1,
-0.4661627, 1.779958, -0.2598227, 0, 1, 0.1058824, 1,
-0.4661611, -1.43131, -4.286066, 0, 1, 0.1137255, 1,
-0.4630402, -0.3432994, -4.143853, 0, 1, 0.1176471, 1,
-0.4585331, -0.9813254, -3.197376, 0, 1, 0.1254902, 1,
-0.457393, 1.33588, -1.777802, 0, 1, 0.1294118, 1,
-0.4521775, 0.8649741, -1.811952, 0, 1, 0.1372549, 1,
-0.4504235, -0.5355417, -1.82227, 0, 1, 0.1411765, 1,
-0.4477589, -0.01756136, -1.580611, 0, 1, 0.1490196, 1,
-0.4443145, 0.4066333, -0.5370884, 0, 1, 0.1529412, 1,
-0.4420087, 0.9070195, 1.073116, 0, 1, 0.1607843, 1,
-0.4401496, 1.878091, -1.354581, 0, 1, 0.1647059, 1,
-0.4281738, -0.9287427, -2.913287, 0, 1, 0.172549, 1,
-0.4273998, 1.042457, 0.1800522, 0, 1, 0.1764706, 1,
-0.4265623, 0.6330054, 0.656341, 0, 1, 0.1843137, 1,
-0.4252342, -0.6431664, -3.168585, 0, 1, 0.1882353, 1,
-0.4227756, 0.6568235, -0.5693108, 0, 1, 0.1960784, 1,
-0.4153654, 0.443607, -1.802628, 0, 1, 0.2039216, 1,
-0.415068, -0.5562732, -1.626567, 0, 1, 0.2078431, 1,
-0.412312, -0.3348416, -1.199549, 0, 1, 0.2156863, 1,
-0.4093709, 1.01185, -0.129598, 0, 1, 0.2196078, 1,
-0.4070036, -0.7376817, -3.02521, 0, 1, 0.227451, 1,
-0.4041816, -0.3337491, -2.80326, 0, 1, 0.2313726, 1,
-0.4031204, -0.6166413, -3.565202, 0, 1, 0.2392157, 1,
-0.402217, -0.03584353, -0.9620675, 0, 1, 0.2431373, 1,
-0.4000194, -0.7226753, -0.5858712, 0, 1, 0.2509804, 1,
-0.399891, -0.859289, -2.217005, 0, 1, 0.254902, 1,
-0.399672, 1.729218, -0.2756477, 0, 1, 0.2627451, 1,
-0.3981172, -0.7459769, -2.01388, 0, 1, 0.2666667, 1,
-0.3902663, 1.377607, 0.282463, 0, 1, 0.2745098, 1,
-0.3895214, -1.355065, -3.953982, 0, 1, 0.2784314, 1,
-0.3868085, -0.3900567, -2.181461, 0, 1, 0.2862745, 1,
-0.3851962, 0.5763146, -2.004574, 0, 1, 0.2901961, 1,
-0.381847, 0.06133729, -0.2431777, 0, 1, 0.2980392, 1,
-0.3789672, 0.26203, -1.302589, 0, 1, 0.3058824, 1,
-0.3779804, -1.070928, -2.780871, 0, 1, 0.3098039, 1,
-0.3773911, 1.534193, 0.04355896, 0, 1, 0.3176471, 1,
-0.3730697, 1.575116, -1.05583, 0, 1, 0.3215686, 1,
-0.370869, 0.9265183, -0.5470568, 0, 1, 0.3294118, 1,
-0.3708668, -0.5305794, -1.699807, 0, 1, 0.3333333, 1,
-0.3645484, -1.646959, -4.160074, 0, 1, 0.3411765, 1,
-0.3626174, -1.484898, -2.741645, 0, 1, 0.345098, 1,
-0.3548558, -1.327738, -3.586751, 0, 1, 0.3529412, 1,
-0.3499965, -0.3386812, -3.622717, 0, 1, 0.3568628, 1,
-0.3480723, 1.185892, -1.088186, 0, 1, 0.3647059, 1,
-0.3461677, 1.002291, 0.4241965, 0, 1, 0.3686275, 1,
-0.3371301, 1.802619, -0.2845708, 0, 1, 0.3764706, 1,
-0.3356401, 1.00329, -1.226344, 0, 1, 0.3803922, 1,
-0.334769, -0.2460596, -2.464072, 0, 1, 0.3882353, 1,
-0.330059, 1.815704, 0.01567924, 0, 1, 0.3921569, 1,
-0.3289036, 0.199127, -0.2189362, 0, 1, 0.4, 1,
-0.3266418, 2.243418, -0.3883254, 0, 1, 0.4078431, 1,
-0.3266255, -0.816714, -2.478339, 0, 1, 0.4117647, 1,
-0.3183219, -0.9963027, -2.01161, 0, 1, 0.4196078, 1,
-0.3110657, -0.8903193, -1.951622, 0, 1, 0.4235294, 1,
-0.3081221, -0.1552624, -1.051659, 0, 1, 0.4313726, 1,
-0.3021649, -0.266071, -3.873737, 0, 1, 0.4352941, 1,
-0.301605, 1.071462, -0.3280431, 0, 1, 0.4431373, 1,
-0.3002469, 0.6097715, -0.7586206, 0, 1, 0.4470588, 1,
-0.2989818, 0.1417915, 1.680809, 0, 1, 0.454902, 1,
-0.2978097, -1.091513, -3.100427, 0, 1, 0.4588235, 1,
-0.2938874, -0.942527, -2.722826, 0, 1, 0.4666667, 1,
-0.292536, -0.5087533, -1.779606, 0, 1, 0.4705882, 1,
-0.2879472, 0.410572, -0.2926001, 0, 1, 0.4784314, 1,
-0.283929, 1.582606, -0.208567, 0, 1, 0.4823529, 1,
-0.2818068, -1.52624, -2.291852, 0, 1, 0.4901961, 1,
-0.2772601, 0.8201966, 0.158341, 0, 1, 0.4941176, 1,
-0.2729759, 0.1849714, 1.866878, 0, 1, 0.5019608, 1,
-0.2704595, 0.3592315, -0.7593222, 0, 1, 0.509804, 1,
-0.2690395, 0.6998467, -0.3428619, 0, 1, 0.5137255, 1,
-0.2686113, -0.07939617, -1.555969, 0, 1, 0.5215687, 1,
-0.2670561, 0.5739236, 0.3866648, 0, 1, 0.5254902, 1,
-0.2661878, -0.9621361, -2.993062, 0, 1, 0.5333334, 1,
-0.2641059, -0.6629757, -2.667226, 0, 1, 0.5372549, 1,
-0.2618026, 0.02562998, -0.3363875, 0, 1, 0.5450981, 1,
-0.2603698, -0.6454367, -2.561106, 0, 1, 0.5490196, 1,
-0.2581659, -0.2998248, -2.555392, 0, 1, 0.5568628, 1,
-0.2577946, 0.2318038, 0.4572353, 0, 1, 0.5607843, 1,
-0.2562176, -2.114909, -2.107895, 0, 1, 0.5686275, 1,
-0.2560198, -0.5980914, -1.412071, 0, 1, 0.572549, 1,
-0.2533514, -1.180206, -2.180105, 0, 1, 0.5803922, 1,
-0.2482642, -0.8986843, -3.572417, 0, 1, 0.5843138, 1,
-0.2454186, 1.236773, 0.5751827, 0, 1, 0.5921569, 1,
-0.2446198, 0.08831264, -0.4717496, 0, 1, 0.5960785, 1,
-0.2444727, -1.024775, -3.682577, 0, 1, 0.6039216, 1,
-0.2431619, -0.5595791, -2.306588, 0, 1, 0.6117647, 1,
-0.2362354, -1.720386, -3.48753, 0, 1, 0.6156863, 1,
-0.2335345, -1.067131, -3.050925, 0, 1, 0.6235294, 1,
-0.2291377, -0.2598407, -2.071682, 0, 1, 0.627451, 1,
-0.2258794, 1.212318, -1.702622, 0, 1, 0.6352941, 1,
-0.2257193, -0.6223195, -3.502836, 0, 1, 0.6392157, 1,
-0.2253832, -1.137814, -3.659451, 0, 1, 0.6470588, 1,
-0.2251968, -1.563233, -3.186786, 0, 1, 0.6509804, 1,
-0.2232733, 1.368704, 0.4690757, 0, 1, 0.6588235, 1,
-0.2225792, 0.1923741, -2.762359, 0, 1, 0.6627451, 1,
-0.2201394, -0.4070207, -2.921699, 0, 1, 0.6705883, 1,
-0.2170966, -0.02131626, -1.532502, 0, 1, 0.6745098, 1,
-0.216553, -1.802559, -2.644973, 0, 1, 0.682353, 1,
-0.2139446, -0.3628144, -1.531382, 0, 1, 0.6862745, 1,
-0.2133427, -2.047643, -2.579648, 0, 1, 0.6941177, 1,
-0.2126057, 1.226802, -1.693248, 0, 1, 0.7019608, 1,
-0.2117164, -1.406684, -3.345695, 0, 1, 0.7058824, 1,
-0.2086291, -0.2378373, -2.281434, 0, 1, 0.7137255, 1,
-0.2082535, -0.9789166, -4.348416, 0, 1, 0.7176471, 1,
-0.2063875, -0.4597392, -2.226957, 0, 1, 0.7254902, 1,
-0.2033507, 1.097094, -0.1517756, 0, 1, 0.7294118, 1,
-0.2006307, 0.89872, -1.537962, 0, 1, 0.7372549, 1,
-0.2004754, -0.1385263, -2.545062, 0, 1, 0.7411765, 1,
-0.1950854, -0.8476618, -2.140866, 0, 1, 0.7490196, 1,
-0.1862818, 0.4092797, -1.383674, 0, 1, 0.7529412, 1,
-0.1741642, -1.150731, -1.285183, 0, 1, 0.7607843, 1,
-0.1736992, 0.04513235, 0.3173108, 0, 1, 0.7647059, 1,
-0.1734117, -0.4821511, -2.264039, 0, 1, 0.772549, 1,
-0.1713227, 1.631129, 0.4643596, 0, 1, 0.7764706, 1,
-0.1709382, -0.1931257, -1.438534, 0, 1, 0.7843137, 1,
-0.1709207, 1.078936, -1.698199, 0, 1, 0.7882353, 1,
-0.1693155, 1.008507, -0.8345831, 0, 1, 0.7960784, 1,
-0.1680441, 1.114945, 0.8161184, 0, 1, 0.8039216, 1,
-0.1678302, 1.791675, -0.5639307, 0, 1, 0.8078431, 1,
-0.1643768, -0.07246254, 0.6040667, 0, 1, 0.8156863, 1,
-0.1615141, 1.154877, 0.3379293, 0, 1, 0.8196079, 1,
-0.1570003, 1.620321, 0.670531, 0, 1, 0.827451, 1,
-0.155994, 1.673826, -1.283514, 0, 1, 0.8313726, 1,
-0.1553477, 1.4506, -1.063911, 0, 1, 0.8392157, 1,
-0.1499454, -1.610879, -2.104655, 0, 1, 0.8431373, 1,
-0.148247, -0.02288314, -0.5034338, 0, 1, 0.8509804, 1,
-0.1451496, 0.7947549, 0.3730297, 0, 1, 0.854902, 1,
-0.1410883, 0.9675969, 0.1637039, 0, 1, 0.8627451, 1,
-0.1409109, 0.05120187, -0.1584499, 0, 1, 0.8666667, 1,
-0.1382668, -0.7796025, -3.026479, 0, 1, 0.8745098, 1,
-0.1342992, -0.1062072, -1.174391, 0, 1, 0.8784314, 1,
-0.1309345, 0.3926272, 0.1590023, 0, 1, 0.8862745, 1,
-0.1309124, 0.3218126, -1.168949, 0, 1, 0.8901961, 1,
-0.127105, -0.8112695, -1.946941, 0, 1, 0.8980392, 1,
-0.1270345, 0.1018898, -2.338213, 0, 1, 0.9058824, 1,
-0.1179789, 1.708634, -0.4055153, 0, 1, 0.9098039, 1,
-0.1129011, -1.66293, -2.956093, 0, 1, 0.9176471, 1,
-0.1109178, -0.1766501, -1.10558, 0, 1, 0.9215686, 1,
-0.1089347, -0.6924675, -3.943066, 0, 1, 0.9294118, 1,
-0.105375, 0.2945296, 0.07404384, 0, 1, 0.9333333, 1,
-0.1048657, -0.3270454, -2.331916, 0, 1, 0.9411765, 1,
-0.1036069, 0.8596694, -1.193284, 0, 1, 0.945098, 1,
-0.1033589, -0.6001909, -3.232432, 0, 1, 0.9529412, 1,
-0.102336, 1.313315, -0.4640467, 0, 1, 0.9568627, 1,
-0.1012636, 0.4361432, -0.9595091, 0, 1, 0.9647059, 1,
-0.101069, 1.512121, -1.810406, 0, 1, 0.9686275, 1,
-0.09640644, -0.3783633, -3.03566, 0, 1, 0.9764706, 1,
-0.09435996, 1.621892, 0.6321715, 0, 1, 0.9803922, 1,
-0.08921279, -1.467673, -2.392134, 0, 1, 0.9882353, 1,
-0.08831621, -0.5469375, -2.223231, 0, 1, 0.9921569, 1,
-0.08751359, 0.2202348, -1.860407, 0, 1, 1, 1,
-0.08102518, -0.54063, -2.959251, 0, 0.9921569, 1, 1,
-0.07840058, 0.150251, -1.368652, 0, 0.9882353, 1, 1,
-0.07822265, 0.1647114, -0.6993402, 0, 0.9803922, 1, 1,
-0.07636304, 1.368321, 0.09421422, 0, 0.9764706, 1, 1,
-0.07482573, -1.418061, -2.257316, 0, 0.9686275, 1, 1,
-0.07188246, -0.8451436, -2.007445, 0, 0.9647059, 1, 1,
-0.07118409, -1.953987, -4.018314, 0, 0.9568627, 1, 1,
-0.06981865, -0.2278795, -0.6280121, 0, 0.9529412, 1, 1,
-0.0684431, 0.8001876, -0.1507124, 0, 0.945098, 1, 1,
-0.06837407, 1.874482, -1.501899, 0, 0.9411765, 1, 1,
-0.0646286, 0.8611051, 1.129178, 0, 0.9333333, 1, 1,
-0.06201656, 0.9651809, -0.08280895, 0, 0.9294118, 1, 1,
-0.06094836, -0.7729293, -4.075352, 0, 0.9215686, 1, 1,
-0.06062473, 0.8494478, -1.784761, 0, 0.9176471, 1, 1,
-0.05378185, -1.014072, -2.052866, 0, 0.9098039, 1, 1,
-0.0508939, -0.2728949, -3.50346, 0, 0.9058824, 1, 1,
-0.03486294, -0.3639699, -3.059789, 0, 0.8980392, 1, 1,
-0.03309904, 1.010861, -0.3753811, 0, 0.8901961, 1, 1,
-0.0289873, -0.4929573, -2.625376, 0, 0.8862745, 1, 1,
-0.02776092, -0.4083099, -1.974381, 0, 0.8784314, 1, 1,
-0.02576119, -1.633452, -4.313349, 0, 0.8745098, 1, 1,
-0.02560393, -2.013658, -2.027306, 0, 0.8666667, 1, 1,
-0.0196959, 0.3643987, 0.8969568, 0, 0.8627451, 1, 1,
-0.01873021, -1.377311, -1.661773, 0, 0.854902, 1, 1,
-0.01822188, 3.556104, 0.6895646, 0, 0.8509804, 1, 1,
-0.0155567, -0.3272637, -0.7964323, 0, 0.8431373, 1, 1,
-0.01511118, 0.8677951, 1.932732, 0, 0.8392157, 1, 1,
-0.01094205, 1.315299, -2.560313, 0, 0.8313726, 1, 1,
-0.00975187, -0.9948739, -2.484877, 0, 0.827451, 1, 1,
-0.007108628, 0.8254501, 1.424581, 0, 0.8196079, 1, 1,
-0.005052643, -0.4475033, -2.313969, 0, 0.8156863, 1, 1,
-0.0001371699, 1.157016, -0.6291555, 0, 0.8078431, 1, 1,
0.002962124, 0.916967, -0.1879561, 0, 0.8039216, 1, 1,
0.004943239, -0.6918455, 1.90965, 0, 0.7960784, 1, 1,
0.01148899, -0.1578647, 3.182059, 0, 0.7882353, 1, 1,
0.01234199, 0.9399338, 0.2126762, 0, 0.7843137, 1, 1,
0.01461256, 0.2156728, 0.7777151, 0, 0.7764706, 1, 1,
0.01827629, 0.5698476, -1.019184, 0, 0.772549, 1, 1,
0.01845888, -0.3982283, 5.028785, 0, 0.7647059, 1, 1,
0.02393001, -0.3255618, 1.929343, 0, 0.7607843, 1, 1,
0.02735205, -0.7969041, 3.523709, 0, 0.7529412, 1, 1,
0.02784866, 1.91855, 1.95533, 0, 0.7490196, 1, 1,
0.03204931, 1.087684, -0.5460818, 0, 0.7411765, 1, 1,
0.03370012, 0.7561694, 0.9641021, 0, 0.7372549, 1, 1,
0.03513866, 1.25879, 0.3151283, 0, 0.7294118, 1, 1,
0.03664012, 0.00715964, -0.03704323, 0, 0.7254902, 1, 1,
0.04065306, -0.3888377, 1.855567, 0, 0.7176471, 1, 1,
0.04693441, 0.02441985, -0.8096696, 0, 0.7137255, 1, 1,
0.04951097, -0.7553913, 2.64935, 0, 0.7058824, 1, 1,
0.05331362, -0.236726, 2.638048, 0, 0.6980392, 1, 1,
0.05723519, 0.3907922, 0.1280626, 0, 0.6941177, 1, 1,
0.05811882, 1.064813, -1.576145, 0, 0.6862745, 1, 1,
0.06316628, -0.3840928, 1.735848, 0, 0.682353, 1, 1,
0.06558307, 0.5958583, 0.9575273, 0, 0.6745098, 1, 1,
0.07171676, -0.8577746, 2.757499, 0, 0.6705883, 1, 1,
0.07250151, -1.911059, 4.059135, 0, 0.6627451, 1, 1,
0.07473242, 0.7498864, -0.1245875, 0, 0.6588235, 1, 1,
0.07522173, 0.3334439, 0.006619343, 0, 0.6509804, 1, 1,
0.07640453, -1.909126, 1.875726, 0, 0.6470588, 1, 1,
0.07846557, -2.605911, 2.687075, 0, 0.6392157, 1, 1,
0.08606858, -0.6075608, 4.641931, 0, 0.6352941, 1, 1,
0.08810392, 0.967633, 1.007429, 0, 0.627451, 1, 1,
0.09139905, -0.3839369, 3.624928, 0, 0.6235294, 1, 1,
0.09573948, -1.228799, 2.768143, 0, 0.6156863, 1, 1,
0.09611366, -0.7829829, 4.396539, 0, 0.6117647, 1, 1,
0.09983459, -1.228947, 3.287281, 0, 0.6039216, 1, 1,
0.1036143, -0.5905131, 2.841353, 0, 0.5960785, 1, 1,
0.1037136, -0.5426567, 3.274408, 0, 0.5921569, 1, 1,
0.1043122, -0.2545156, 3.125758, 0, 0.5843138, 1, 1,
0.1044692, 1.773654, 0.1382125, 0, 0.5803922, 1, 1,
0.1070216, 2.076707, 0.613178, 0, 0.572549, 1, 1,
0.1092573, -1.01184, 3.691629, 0, 0.5686275, 1, 1,
0.1132316, 0.3381317, 0.8077185, 0, 0.5607843, 1, 1,
0.1144702, 1.233367, 0.8383697, 0, 0.5568628, 1, 1,
0.1145583, -1.209849, 4.207526, 0, 0.5490196, 1, 1,
0.1182204, 0.6951349, 0.1970625, 0, 0.5450981, 1, 1,
0.1197064, 0.3779693, 0.7847503, 0, 0.5372549, 1, 1,
0.1224464, 2.659112, 0.4779174, 0, 0.5333334, 1, 1,
0.1269643, -0.5575733, 1.856566, 0, 0.5254902, 1, 1,
0.1269972, 1.095705, -0.6186551, 0, 0.5215687, 1, 1,
0.1282605, -0.3631753, 3.341589, 0, 0.5137255, 1, 1,
0.1309277, 1.366197, 1.75169, 0, 0.509804, 1, 1,
0.1333014, -1.742554, 3.077744, 0, 0.5019608, 1, 1,
0.1342057, -1.021984, 3.319557, 0, 0.4941176, 1, 1,
0.1362343, -0.1490632, 3.101003, 0, 0.4901961, 1, 1,
0.1368315, -0.2464605, 3.052166, 0, 0.4823529, 1, 1,
0.1385407, 0.2561937, 2.346333, 0, 0.4784314, 1, 1,
0.1390179, 0.02043423, 1.350671, 0, 0.4705882, 1, 1,
0.143243, -1.316848, 2.940387, 0, 0.4666667, 1, 1,
0.1434556, -0.55911, 3.323416, 0, 0.4588235, 1, 1,
0.1471917, 0.6848044, 0.9361171, 0, 0.454902, 1, 1,
0.1551037, -0.5846609, 0.3505791, 0, 0.4470588, 1, 1,
0.1555524, -0.4282744, 4.061399, 0, 0.4431373, 1, 1,
0.1568793, -0.4350979, 2.552694, 0, 0.4352941, 1, 1,
0.1603224, 0.4747993, 1.177336, 0, 0.4313726, 1, 1,
0.160773, -0.07252678, 1.806322, 0, 0.4235294, 1, 1,
0.1616443, -0.108896, -0.001352411, 0, 0.4196078, 1, 1,
0.1656527, -0.5677859, 3.019874, 0, 0.4117647, 1, 1,
0.1708831, 0.5331933, 0.8794736, 0, 0.4078431, 1, 1,
0.1713362, -1.252092, 3.888434, 0, 0.4, 1, 1,
0.171992, -2.141948, 2.361197, 0, 0.3921569, 1, 1,
0.172823, 0.9991552, 0.3889908, 0, 0.3882353, 1, 1,
0.1762045, 0.08357903, 1.875068, 0, 0.3803922, 1, 1,
0.1826213, -0.9187734, 3.988189, 0, 0.3764706, 1, 1,
0.1871442, 0.2784601, -0.8255752, 0, 0.3686275, 1, 1,
0.191208, -0.4589287, 3.202962, 0, 0.3647059, 1, 1,
0.1920144, -0.5525404, 2.75795, 0, 0.3568628, 1, 1,
0.1925684, -0.09704834, 2.102852, 0, 0.3529412, 1, 1,
0.19293, 0.5971071, -0.5890775, 0, 0.345098, 1, 1,
0.1942361, -0.2598058, 2.801959, 0, 0.3411765, 1, 1,
0.1943756, -0.3499408, 1.995533, 0, 0.3333333, 1, 1,
0.1949186, -1.074029, 3.051544, 0, 0.3294118, 1, 1,
0.1970041, 0.5389034, -0.134895, 0, 0.3215686, 1, 1,
0.1971683, -0.03361184, 2.473265, 0, 0.3176471, 1, 1,
0.1997083, 0.7375357, 1.009316, 0, 0.3098039, 1, 1,
0.2009388, -0.9304874, 2.143139, 0, 0.3058824, 1, 1,
0.2012871, 0.1351511, 2.372832, 0, 0.2980392, 1, 1,
0.2067828, -0.5215681, 4.483932, 0, 0.2901961, 1, 1,
0.2130453, -0.5814292, 2.911887, 0, 0.2862745, 1, 1,
0.2154438, 1.114181, -0.1349106, 0, 0.2784314, 1, 1,
0.2230061, -0.6931177, 4.536092, 0, 0.2745098, 1, 1,
0.2242797, 0.2789382, -0.7646148, 0, 0.2666667, 1, 1,
0.2251266, -1.330714, 4.053854, 0, 0.2627451, 1, 1,
0.2267819, 0.4500349, 1.935708, 0, 0.254902, 1, 1,
0.227058, 0.3293017, -0.6498601, 0, 0.2509804, 1, 1,
0.2297661, 1.762136, 0.3668055, 0, 0.2431373, 1, 1,
0.2324233, -1.523636, 3.181037, 0, 0.2392157, 1, 1,
0.2324834, 1.610089, -0.9439237, 0, 0.2313726, 1, 1,
0.2377866, -1.4111, 2.411595, 0, 0.227451, 1, 1,
0.2434101, -0.04242493, 4.229914, 0, 0.2196078, 1, 1,
0.2486465, -0.5396551, 3.166793, 0, 0.2156863, 1, 1,
0.2548258, 2.489429, -0.2969465, 0, 0.2078431, 1, 1,
0.2549369, -0.1632285, 2.048815, 0, 0.2039216, 1, 1,
0.2585043, 1.570964, 2.409768, 0, 0.1960784, 1, 1,
0.2592193, -0.1981794, 4.198317, 0, 0.1882353, 1, 1,
0.2655534, -0.6574029, 4.62337, 0, 0.1843137, 1, 1,
0.2683298, 0.3633335, 0.8492808, 0, 0.1764706, 1, 1,
0.2785261, -0.4600089, 2.412454, 0, 0.172549, 1, 1,
0.2799168, -0.4598458, 2.952254, 0, 0.1647059, 1, 1,
0.2801052, -1.07371, 1.100947, 0, 0.1607843, 1, 1,
0.2803295, 0.2536053, 1.634662, 0, 0.1529412, 1, 1,
0.2804765, 0.9186809, 0.08991771, 0, 0.1490196, 1, 1,
0.2889943, -1.108834, 2.728813, 0, 0.1411765, 1, 1,
0.2893129, -0.7487973, 0.262242, 0, 0.1372549, 1, 1,
0.2989, -1.80042, 3.716644, 0, 0.1294118, 1, 1,
0.2997826, -1.719308, 2.619774, 0, 0.1254902, 1, 1,
0.3075175, -0.8749378, 4.311512, 0, 0.1176471, 1, 1,
0.3079503, -0.1846373, 2.45675, 0, 0.1137255, 1, 1,
0.3094289, 0.6351989, -0.004462388, 0, 0.1058824, 1, 1,
0.3099733, 1.585477, 0.7241179, 0, 0.09803922, 1, 1,
0.3104783, -2.713247, 2.717581, 0, 0.09411765, 1, 1,
0.3183951, -0.8678336, 0.726946, 0, 0.08627451, 1, 1,
0.3322119, 0.2603225, 1.930696, 0, 0.08235294, 1, 1,
0.3338118, 0.3815891, 0.9802267, 0, 0.07450981, 1, 1,
0.3347859, 0.2684469, -0.4350188, 0, 0.07058824, 1, 1,
0.3358748, 1.092422, 0.01534027, 0, 0.0627451, 1, 1,
0.3453012, 0.2605807, 0.02278073, 0, 0.05882353, 1, 1,
0.346007, -0.07320551, 2.26464, 0, 0.05098039, 1, 1,
0.3492217, -2.278992, 2.935509, 0, 0.04705882, 1, 1,
0.3498121, 0.2823799, 1.209856, 0, 0.03921569, 1, 1,
0.3510249, -2.209559, 3.261227, 0, 0.03529412, 1, 1,
0.3513674, 1.934743, 2.279186, 0, 0.02745098, 1, 1,
0.3515789, -0.5989673, 3.650008, 0, 0.02352941, 1, 1,
0.3573134, -1.782989, 2.826714, 0, 0.01568628, 1, 1,
0.3597719, 1.29233, -1.964342, 0, 0.01176471, 1, 1,
0.367536, 0.8390489, 1.571464, 0, 0.003921569, 1, 1,
0.3679204, -0.5956197, 2.79353, 0.003921569, 0, 1, 1,
0.3686491, 0.9082128, -0.9559296, 0.007843138, 0, 1, 1,
0.3702975, 0.7199016, 0.683893, 0.01568628, 0, 1, 1,
0.3747777, 1.041353, 1.45486, 0.01960784, 0, 1, 1,
0.3796234, -1.37726, 3.182505, 0.02745098, 0, 1, 1,
0.3799408, -0.2599776, 3.425904, 0.03137255, 0, 1, 1,
0.3801469, 0.5229861, -0.7579337, 0.03921569, 0, 1, 1,
0.3917749, -0.137157, 3.147216, 0.04313726, 0, 1, 1,
0.3931677, -1.204165, 2.691967, 0.05098039, 0, 1, 1,
0.3956943, -1.950016, 3.966381, 0.05490196, 0, 1, 1,
0.3965993, 1.447556, -0.9299287, 0.0627451, 0, 1, 1,
0.400279, -0.7858701, 1.301822, 0.06666667, 0, 1, 1,
0.401444, -1.484537, 2.292189, 0.07450981, 0, 1, 1,
0.4033287, -0.1103927, 1.4448, 0.07843138, 0, 1, 1,
0.4061302, -0.5682469, 3.08801, 0.08627451, 0, 1, 1,
0.4068194, 0.2414911, 2.425894, 0.09019608, 0, 1, 1,
0.4074965, -1.312865, 1.42574, 0.09803922, 0, 1, 1,
0.4161024, 0.6835078, 0.2038882, 0.1058824, 0, 1, 1,
0.4213882, -0.9638112, 2.274899, 0.1098039, 0, 1, 1,
0.4247071, 0.06582042, 1.976425, 0.1176471, 0, 1, 1,
0.4264527, 0.514109, -0.1335138, 0.1215686, 0, 1, 1,
0.4388526, -1.86314, 1.631616, 0.1294118, 0, 1, 1,
0.4393261, -1.140897, 3.940888, 0.1333333, 0, 1, 1,
0.4421552, 1.332293, 1.754462, 0.1411765, 0, 1, 1,
0.4426726, 1.104699, -1.10411, 0.145098, 0, 1, 1,
0.4469847, -0.3984435, 0.8132845, 0.1529412, 0, 1, 1,
0.4490599, 0.6573921, 1.073717, 0.1568628, 0, 1, 1,
0.4494125, -0.1915314, 1.41911, 0.1647059, 0, 1, 1,
0.4495403, 0.2927214, -0.2823521, 0.1686275, 0, 1, 1,
0.4499989, -0.6314145, 2.799002, 0.1764706, 0, 1, 1,
0.4548543, -0.4615044, 0.1513232, 0.1803922, 0, 1, 1,
0.4568272, 1.315108, 0.3317774, 0.1882353, 0, 1, 1,
0.4664409, 0.7127093, 0.2722457, 0.1921569, 0, 1, 1,
0.4769172, 0.2811678, 1.549082, 0.2, 0, 1, 1,
0.4810227, 0.6931314, 0.8996539, 0.2078431, 0, 1, 1,
0.4834637, -0.2499917, 3.748042, 0.2117647, 0, 1, 1,
0.4849362, -1.654325, 5.394156, 0.2196078, 0, 1, 1,
0.4891208, 2.390619, 0.2688024, 0.2235294, 0, 1, 1,
0.4908155, 0.06727899, 1.725069, 0.2313726, 0, 1, 1,
0.4933986, -0.8075665, 2.919752, 0.2352941, 0, 1, 1,
0.4965177, -1.748019, 4.138051, 0.2431373, 0, 1, 1,
0.5057566, -0.7531925, 2.311812, 0.2470588, 0, 1, 1,
0.5062319, -1.778143, 2.033838, 0.254902, 0, 1, 1,
0.5092024, -1.995666, 5.505543, 0.2588235, 0, 1, 1,
0.5099382, -0.3674468, 2.299906, 0.2666667, 0, 1, 1,
0.5112219, -0.5402411, 2.382721, 0.2705882, 0, 1, 1,
0.5116245, 0.7070591, -0.3687085, 0.2784314, 0, 1, 1,
0.5130759, -3.094934, 2.045431, 0.282353, 0, 1, 1,
0.5220193, 1.641788, -0.4410513, 0.2901961, 0, 1, 1,
0.5236035, -1.01321, 3.349873, 0.2941177, 0, 1, 1,
0.5280698, 0.01767687, -0.08080465, 0.3019608, 0, 1, 1,
0.5285873, -0.6613285, 3.382518, 0.3098039, 0, 1, 1,
0.5301241, -0.7286239, 1.239814, 0.3137255, 0, 1, 1,
0.534835, 1.862737, 1.146165, 0.3215686, 0, 1, 1,
0.5372962, 1.389056, 0.3424261, 0.3254902, 0, 1, 1,
0.5436863, -0.006192893, 4.085889, 0.3333333, 0, 1, 1,
0.5497659, 0.05496451, 0.6972244, 0.3372549, 0, 1, 1,
0.5523813, 1.389889, 1.31237, 0.345098, 0, 1, 1,
0.5524815, 1.229301, 2.182977, 0.3490196, 0, 1, 1,
0.5532904, -0.1369573, 2.377765, 0.3568628, 0, 1, 1,
0.5561113, -1.417774, 0.9876778, 0.3607843, 0, 1, 1,
0.5609679, -0.9375724, 2.284685, 0.3686275, 0, 1, 1,
0.5629844, -1.633182, 2.940639, 0.372549, 0, 1, 1,
0.5636993, 0.4043618, -0.5536942, 0.3803922, 0, 1, 1,
0.5696781, 1.089243, 1.152806, 0.3843137, 0, 1, 1,
0.570648, -0.2402653, 1.043898, 0.3921569, 0, 1, 1,
0.5732715, 0.438025, -0.6163011, 0.3960784, 0, 1, 1,
0.5792168, 1.036151, -0.8789856, 0.4039216, 0, 1, 1,
0.5834399, -1.33127, 3.091689, 0.4117647, 0, 1, 1,
0.5842381, -1.287027, 2.418567, 0.4156863, 0, 1, 1,
0.5866528, 1.894879, 0.702155, 0.4235294, 0, 1, 1,
0.5912086, -0.8804179, 0.8954881, 0.427451, 0, 1, 1,
0.612865, -0.8840796, 5.372783, 0.4352941, 0, 1, 1,
0.614754, 0.2855542, 0.08732387, 0.4392157, 0, 1, 1,
0.6148482, 1.305453, -0.7481405, 0.4470588, 0, 1, 1,
0.6148765, 0.8146194, 1.158181, 0.4509804, 0, 1, 1,
0.6149518, 2.476677, 0.4664875, 0.4588235, 0, 1, 1,
0.6164936, 0.4080926, 0.03039487, 0.4627451, 0, 1, 1,
0.6211728, -0.170649, 3.97399, 0.4705882, 0, 1, 1,
0.6220455, 0.78492, -0.2137381, 0.4745098, 0, 1, 1,
0.6220732, 0.2559925, 2.438091, 0.4823529, 0, 1, 1,
0.6296864, 0.5991677, 3.181007, 0.4862745, 0, 1, 1,
0.6307275, -0.7907081, 1.837681, 0.4941176, 0, 1, 1,
0.6366565, 0.6954238, 0.5127986, 0.5019608, 0, 1, 1,
0.6452599, 0.766111, 1.633292, 0.5058824, 0, 1, 1,
0.6461272, 0.7580807, 1.630921, 0.5137255, 0, 1, 1,
0.6476068, 0.211171, 1.253379, 0.5176471, 0, 1, 1,
0.6484138, 0.1971757, 2.542331, 0.5254902, 0, 1, 1,
0.6528568, 1.381835, -0.6090004, 0.5294118, 0, 1, 1,
0.6539551, -1.680759, 2.627538, 0.5372549, 0, 1, 1,
0.6540462, 0.3932953, 0.9507146, 0.5411765, 0, 1, 1,
0.6568127, -0.212839, 1.932086, 0.5490196, 0, 1, 1,
0.6602074, -0.0346235, 1.16926, 0.5529412, 0, 1, 1,
0.6606863, 0.02787095, 1.390483, 0.5607843, 0, 1, 1,
0.6632916, -1.396809, 1.413999, 0.5647059, 0, 1, 1,
0.6646019, -0.4061247, 0.9089031, 0.572549, 0, 1, 1,
0.6665372, 1.28246, 0.5642326, 0.5764706, 0, 1, 1,
0.6667439, 0.4569659, 0.2835237, 0.5843138, 0, 1, 1,
0.6677556, 0.4737482, -0.06490514, 0.5882353, 0, 1, 1,
0.6682301, -2.097363, 0.7041774, 0.5960785, 0, 1, 1,
0.6698326, 0.7879249, 1.299058, 0.6039216, 0, 1, 1,
0.6725305, 1.208633, 1.217629, 0.6078432, 0, 1, 1,
0.6749392, -1.045525, 2.571816, 0.6156863, 0, 1, 1,
0.680867, -0.4376574, 4.49702, 0.6196079, 0, 1, 1,
0.6819686, 1.239594, 0.7380216, 0.627451, 0, 1, 1,
0.6833116, -1.685592, 2.425612, 0.6313726, 0, 1, 1,
0.6944466, 0.9407516, 0.2867591, 0.6392157, 0, 1, 1,
0.6961582, -0.6633893, 1.145294, 0.6431373, 0, 1, 1,
0.7040217, 0.7740375, 0.5819762, 0.6509804, 0, 1, 1,
0.7071931, 0.3216108, 1.556385, 0.654902, 0, 1, 1,
0.7073603, 1.78676, -0.2626599, 0.6627451, 0, 1, 1,
0.71039, -0.8154318, 1.168418, 0.6666667, 0, 1, 1,
0.7118326, 0.4200053, 0.376484, 0.6745098, 0, 1, 1,
0.7253735, 0.1483062, 2.010055, 0.6784314, 0, 1, 1,
0.7305443, -1.482062, 1.56049, 0.6862745, 0, 1, 1,
0.7310462, -2.024915, 2.931905, 0.6901961, 0, 1, 1,
0.7330446, 0.355927, 0.2609155, 0.6980392, 0, 1, 1,
0.735092, -2.58001, 2.041189, 0.7058824, 0, 1, 1,
0.7353354, 0.7877986, -0.3872739, 0.7098039, 0, 1, 1,
0.7403546, 0.1698483, -0.01881178, 0.7176471, 0, 1, 1,
0.7413257, -0.4146729, 2.593785, 0.7215686, 0, 1, 1,
0.7444093, 0.2661066, 0.2088262, 0.7294118, 0, 1, 1,
0.7467829, 0.2282272, 1.210201, 0.7333333, 0, 1, 1,
0.7486314, 0.2663215, 0.3211964, 0.7411765, 0, 1, 1,
0.7491134, -0.9083601, 1.453674, 0.7450981, 0, 1, 1,
0.7492296, 1.147565, -0.349091, 0.7529412, 0, 1, 1,
0.7515127, -1.017599, 2.495689, 0.7568628, 0, 1, 1,
0.7531418, 0.2676979, -0.2031402, 0.7647059, 0, 1, 1,
0.7549416, -0.06744419, 1.806468, 0.7686275, 0, 1, 1,
0.7562984, 1.442045, -0.09050885, 0.7764706, 0, 1, 1,
0.7567704, 3.258995, 0.5481106, 0.7803922, 0, 1, 1,
0.7574783, -1.370268, 1.487847, 0.7882353, 0, 1, 1,
0.7662013, -1.025938, 3.777314, 0.7921569, 0, 1, 1,
0.7690715, 0.1839098, 1.792659, 0.8, 0, 1, 1,
0.7715714, -0.4362553, 1.487889, 0.8078431, 0, 1, 1,
0.772884, 0.1713401, 1.825868, 0.8117647, 0, 1, 1,
0.774552, 0.01388341, 1.152621, 0.8196079, 0, 1, 1,
0.7748533, 0.5449647, 1.019842, 0.8235294, 0, 1, 1,
0.7755517, 0.8713502, 0.4345616, 0.8313726, 0, 1, 1,
0.776686, -0.6975911, 2.77437, 0.8352941, 0, 1, 1,
0.7779866, -0.9988329, 1.466959, 0.8431373, 0, 1, 1,
0.7784694, 0.5178393, 1.619024, 0.8470588, 0, 1, 1,
0.7821487, -1.995671, 3.239703, 0.854902, 0, 1, 1,
0.783911, -0.09479994, 1.865788, 0.8588235, 0, 1, 1,
0.78424, 1.354738, 1.177482, 0.8666667, 0, 1, 1,
0.7852089, -0.7640224, 3.341096, 0.8705882, 0, 1, 1,
0.7979732, -1.120377, 2.532863, 0.8784314, 0, 1, 1,
0.8029943, 0.5352378, 3.099688, 0.8823529, 0, 1, 1,
0.8090122, 1.521681, 0.9256502, 0.8901961, 0, 1, 1,
0.8130807, -0.400752, 0.2042651, 0.8941177, 0, 1, 1,
0.8234534, -0.6328359, 3.659384, 0.9019608, 0, 1, 1,
0.8250681, 0.5122772, 0.1189755, 0.9098039, 0, 1, 1,
0.841074, -1.14547, 5.424849, 0.9137255, 0, 1, 1,
0.8413266, 0.1231191, 3.73796, 0.9215686, 0, 1, 1,
0.8418319, -1.965256, 2.405489, 0.9254902, 0, 1, 1,
0.8476506, 1.796203, -0.787658, 0.9333333, 0, 1, 1,
0.8492969, 0.1609083, 1.283275, 0.9372549, 0, 1, 1,
0.8501561, -0.0318957, 2.526067, 0.945098, 0, 1, 1,
0.8512338, -0.2276385, 2.927395, 0.9490196, 0, 1, 1,
0.8519745, 0.7190333, 1.017303, 0.9568627, 0, 1, 1,
0.8521599, 2.538595, 0.3069729, 0.9607843, 0, 1, 1,
0.8535665, -0.03484028, 2.76393, 0.9686275, 0, 1, 1,
0.8548445, -0.02635518, 2.19379, 0.972549, 0, 1, 1,
0.8618472, 0.112185, 1.800517, 0.9803922, 0, 1, 1,
0.866475, 0.1864798, -0.3124584, 0.9843137, 0, 1, 1,
0.8688362, 0.123659, 0.9702371, 0.9921569, 0, 1, 1,
0.875653, 1.363081, 2.426507, 0.9960784, 0, 1, 1,
0.8768854, -0.4454032, 3.280209, 1, 0, 0.9960784, 1,
0.8772554, 0.1414226, 0.4069198, 1, 0, 0.9882353, 1,
0.8787146, 0.6179439, 0.1719337, 1, 0, 0.9843137, 1,
0.8796988, 0.5743719, 0.8046966, 1, 0, 0.9764706, 1,
0.8861418, -1.590229, 3.759955, 1, 0, 0.972549, 1,
0.8876582, -0.1660889, 1.731656, 1, 0, 0.9647059, 1,
0.8922216, 1.108656, -0.02970144, 1, 0, 0.9607843, 1,
0.8960566, 0.6720531, 0.5380927, 1, 0, 0.9529412, 1,
0.8974987, 1.217867, 0.2208081, 1, 0, 0.9490196, 1,
0.9028662, 0.6581969, -0.1076443, 1, 0, 0.9411765, 1,
0.9160603, -0.7160935, 3.001209, 1, 0, 0.9372549, 1,
0.9169985, -0.2939206, 1.439496, 1, 0, 0.9294118, 1,
0.9179185, 1.207387, 1.242465, 1, 0, 0.9254902, 1,
0.9298561, 0.2973258, 1.768596, 1, 0, 0.9176471, 1,
0.9386516, 0.6285686, 0.2840048, 1, 0, 0.9137255, 1,
0.9478788, 0.3127358, 0.8611018, 1, 0, 0.9058824, 1,
0.9588991, -0.2930335, 0.8553021, 1, 0, 0.9019608, 1,
0.9649857, -2.882494, 2.775252, 1, 0, 0.8941177, 1,
0.968509, -0.02960081, 1.09121, 1, 0, 0.8862745, 1,
0.9726442, 0.2775049, 3.359249, 1, 0, 0.8823529, 1,
0.9730405, 0.009285183, 3.195524, 1, 0, 0.8745098, 1,
0.9751645, 0.246237, 1.82798, 1, 0, 0.8705882, 1,
0.9823033, -1.374052, 2.752887, 1, 0, 0.8627451, 1,
0.9891915, 1.205032, 1.48095, 1, 0, 0.8588235, 1,
0.9939052, 0.7123232, -0.3277767, 1, 0, 0.8509804, 1,
0.9973252, -0.3067495, 3.682423, 1, 0, 0.8470588, 1,
1.004229, -0.2448206, 2.663641, 1, 0, 0.8392157, 1,
1.004719, 1.192492, 0.839427, 1, 0, 0.8352941, 1,
1.007938, -0.1882471, 0.8902618, 1, 0, 0.827451, 1,
1.010455, -0.6922058, 2.106848, 1, 0, 0.8235294, 1,
1.011158, 0.4090616, 0.09250295, 1, 0, 0.8156863, 1,
1.012276, -1.285886, 0.7061344, 1, 0, 0.8117647, 1,
1.020279, -0.1640399, 1.325917, 1, 0, 0.8039216, 1,
1.026256, 0.5827112, 2.219078, 1, 0, 0.7960784, 1,
1.03377, 0.6121702, -0.7960596, 1, 0, 0.7921569, 1,
1.036511, -1.663783, 2.402186, 1, 0, 0.7843137, 1,
1.043117, 0.7302891, 1.88155, 1, 0, 0.7803922, 1,
1.050849, 1.117083, 1.225719, 1, 0, 0.772549, 1,
1.052751, -0.5001718, 1.552467, 1, 0, 0.7686275, 1,
1.060434, 0.2631949, 0.02135506, 1, 0, 0.7607843, 1,
1.063211, 1.172729, -0.187932, 1, 0, 0.7568628, 1,
1.065214, 1.104343, 0.8717009, 1, 0, 0.7490196, 1,
1.068918, 0.1935505, 1.482306, 1, 0, 0.7450981, 1,
1.086661, 0.19064, 1.628983, 1, 0, 0.7372549, 1,
1.090933, -0.8195693, 2.348291, 1, 0, 0.7333333, 1,
1.091636, 0.9322753, 0.2779246, 1, 0, 0.7254902, 1,
1.094452, -0.3989273, 1.557504, 1, 0, 0.7215686, 1,
1.101258, -0.8249511, 0.8840709, 1, 0, 0.7137255, 1,
1.103357, -0.5900394, -0.4171313, 1, 0, 0.7098039, 1,
1.106834, -1.371036, 1.89496, 1, 0, 0.7019608, 1,
1.121304, -1.12325, 3.577063, 1, 0, 0.6941177, 1,
1.127374, 0.7641743, 2.124421, 1, 0, 0.6901961, 1,
1.127993, -0.7204588, 2.725525, 1, 0, 0.682353, 1,
1.129156, -0.8518448, 2.6582, 1, 0, 0.6784314, 1,
1.142525, 1.739333, -0.4150219, 1, 0, 0.6705883, 1,
1.142665, -0.9073809, 2.116856, 1, 0, 0.6666667, 1,
1.161533, -0.1391339, 2.161847, 1, 0, 0.6588235, 1,
1.163136, -1.091616, 1.04558, 1, 0, 0.654902, 1,
1.165624, -1.359277, 1.807911, 1, 0, 0.6470588, 1,
1.174227, 0.1972595, 1.367988, 1, 0, 0.6431373, 1,
1.174663, -0.4719165, 3.188074, 1, 0, 0.6352941, 1,
1.188235, 1.474395, 0.8262272, 1, 0, 0.6313726, 1,
1.200482, 0.8195475, -0.01772671, 1, 0, 0.6235294, 1,
1.201234, -1.100131, 3.247929, 1, 0, 0.6196079, 1,
1.202973, 0.8570055, 1.963286, 1, 0, 0.6117647, 1,
1.204105, 0.05463465, 2.095891, 1, 0, 0.6078432, 1,
1.206795, 0.7044569, 0.1816238, 1, 0, 0.6, 1,
1.210156, 0.7865685, 1.50833, 1, 0, 0.5921569, 1,
1.212106, 0.3913117, 0.991205, 1, 0, 0.5882353, 1,
1.217813, -0.5707413, 1.537634, 1, 0, 0.5803922, 1,
1.218187, 0.7289601, 0.9283537, 1, 0, 0.5764706, 1,
1.219522, 0.5963004, 0.6570209, 1, 0, 0.5686275, 1,
1.219851, 1.1954, 1.149387, 1, 0, 0.5647059, 1,
1.221209, -1.0148, 1.43108, 1, 0, 0.5568628, 1,
1.234609, 0.3340244, 2.840088, 1, 0, 0.5529412, 1,
1.245576, 0.7850485, -0.7749971, 1, 0, 0.5450981, 1,
1.246484, 0.938408, 1.569301, 1, 0, 0.5411765, 1,
1.247471, -0.3074927, 5.064775, 1, 0, 0.5333334, 1,
1.255339, -1.403911, 0.517513, 1, 0, 0.5294118, 1,
1.260963, 0.6602466, 0.6808157, 1, 0, 0.5215687, 1,
1.264146, -0.625241, -0.2699513, 1, 0, 0.5176471, 1,
1.266974, -1.387926, 0.870634, 1, 0, 0.509804, 1,
1.267585, -0.8218712, 2.590923, 1, 0, 0.5058824, 1,
1.268366, 0.5008466, 1.17705, 1, 0, 0.4980392, 1,
1.26872, 0.7117881, 2.764498, 1, 0, 0.4901961, 1,
1.272371, 1.578565, 0.6950217, 1, 0, 0.4862745, 1,
1.275686, 0.6253421, 2.714512, 1, 0, 0.4784314, 1,
1.277103, -0.4466761, 2.711618, 1, 0, 0.4745098, 1,
1.28291, -0.2125085, 0.7579318, 1, 0, 0.4666667, 1,
1.283786, 1.699847, -0.4704991, 1, 0, 0.4627451, 1,
1.29047, -0.2611609, 1.077908, 1, 0, 0.454902, 1,
1.293564, -0.5622959, 0.7111286, 1, 0, 0.4509804, 1,
1.297678, 0.8556121, 1.471648, 1, 0, 0.4431373, 1,
1.297909, -0.7675436, 2.171516, 1, 0, 0.4392157, 1,
1.310762, 1.770987, 0.01418706, 1, 0, 0.4313726, 1,
1.316673, 0.617846, 1.343007, 1, 0, 0.427451, 1,
1.327923, -0.7710976, 1.187117, 1, 0, 0.4196078, 1,
1.328404, 0.4056979, -0.1568359, 1, 0, 0.4156863, 1,
1.330508, 0.568451, 1.440791, 1, 0, 0.4078431, 1,
1.332242, -1.408787, 1.628866, 1, 0, 0.4039216, 1,
1.352162, -0.9867377, 2.150214, 1, 0, 0.3960784, 1,
1.361919, 0.03582208, 0.7580395, 1, 0, 0.3882353, 1,
1.36587, 1.605701, -1.354372, 1, 0, 0.3843137, 1,
1.378635, -0.8274136, 1.424195, 1, 0, 0.3764706, 1,
1.382215, -0.8286839, 0.5207459, 1, 0, 0.372549, 1,
1.382336, -0.7532755, 3.610826, 1, 0, 0.3647059, 1,
1.386956, 0.9808657, 0.3463716, 1, 0, 0.3607843, 1,
1.407365, 1.012606, 0.1359517, 1, 0, 0.3529412, 1,
1.415434, 0.7387187, 1.440509, 1, 0, 0.3490196, 1,
1.417496, 1.226063, 1.314003, 1, 0, 0.3411765, 1,
1.428331, -1.004733, 1.575366, 1, 0, 0.3372549, 1,
1.433608, -0.2948857, 1.213856, 1, 0, 0.3294118, 1,
1.434528, -1.157635, 1.269971, 1, 0, 0.3254902, 1,
1.43573, -1.524107, 3.504139, 1, 0, 0.3176471, 1,
1.451274, -1.35848, 3.386106, 1, 0, 0.3137255, 1,
1.502816, 1.194117, 0.1364284, 1, 0, 0.3058824, 1,
1.507499, 0.9879562, 0.7994803, 1, 0, 0.2980392, 1,
1.520723, -0.345299, 3.147987, 1, 0, 0.2941177, 1,
1.523549, -0.02444477, 1.523414, 1, 0, 0.2862745, 1,
1.527045, 0.6819297, 2.93873, 1, 0, 0.282353, 1,
1.529366, -0.7731962, 3.238721, 1, 0, 0.2745098, 1,
1.543734, 2.687822, -1.081206, 1, 0, 0.2705882, 1,
1.562535, -1.572465, 2.039825, 1, 0, 0.2627451, 1,
1.583071, -0.7973716, 0.8961401, 1, 0, 0.2588235, 1,
1.58552, -0.1862741, 3.182242, 1, 0, 0.2509804, 1,
1.598216, 0.3212912, 2.552811, 1, 0, 0.2470588, 1,
1.604749, 2.553412, -0.1122229, 1, 0, 0.2392157, 1,
1.607813, 0.6022264, 1.748251, 1, 0, 0.2352941, 1,
1.612915, 1.039132, 1.891465, 1, 0, 0.227451, 1,
1.627031, 0.6537344, 1.439323, 1, 0, 0.2235294, 1,
1.642105, -1.099959, 4.136981, 1, 0, 0.2156863, 1,
1.649098, 1.705464, 0.2605248, 1, 0, 0.2117647, 1,
1.655016, -0.4457051, 0.2481212, 1, 0, 0.2039216, 1,
1.673822, -0.256067, 2.937014, 1, 0, 0.1960784, 1,
1.677841, 2.392908, -0.9657471, 1, 0, 0.1921569, 1,
1.697515, 1.242069, 0.1621307, 1, 0, 0.1843137, 1,
1.704678, 1.088, 2.620637, 1, 0, 0.1803922, 1,
1.705122, -1.531867, 2.740736, 1, 0, 0.172549, 1,
1.707552, 0.3552491, 1.759534, 1, 0, 0.1686275, 1,
1.751798, -1.07499, 2.282232, 1, 0, 0.1607843, 1,
1.759251, -2.242511, 1.288252, 1, 0, 0.1568628, 1,
1.760658, 0.3706045, 1.934066, 1, 0, 0.1490196, 1,
1.776918, -2.295739, 3.892279, 1, 0, 0.145098, 1,
1.788532, 0.155788, 2.696136, 1, 0, 0.1372549, 1,
1.831135, -1.752359, 3.826126, 1, 0, 0.1333333, 1,
1.832018, 1.091124, 0.1780585, 1, 0, 0.1254902, 1,
1.867921, 0.691849, 2.151898, 1, 0, 0.1215686, 1,
1.886779, 0.4737044, 2.561995, 1, 0, 0.1137255, 1,
1.891106, -0.4168987, 1.477804, 1, 0, 0.1098039, 1,
1.972968, -0.351981, 2.57752, 1, 0, 0.1019608, 1,
1.977401, -2.170131, 1.453295, 1, 0, 0.09411765, 1,
2.025476, -0.4087636, 1.205334, 1, 0, 0.09019608, 1,
2.038253, 0.3080283, 0.4586982, 1, 0, 0.08235294, 1,
2.045112, -0.3293768, 2.603451, 1, 0, 0.07843138, 1,
2.147407, 1.146921, 2.751488, 1, 0, 0.07058824, 1,
2.231997, 0.06435596, 3.329725, 1, 0, 0.06666667, 1,
2.26013, -0.3709224, 2.525995, 1, 0, 0.05882353, 1,
2.26089, -0.1784876, -0.2600609, 1, 0, 0.05490196, 1,
2.292121, 0.4922513, 1.03811, 1, 0, 0.04705882, 1,
2.450111, -0.5836168, 1.924746, 1, 0, 0.04313726, 1,
2.537571, -0.4629975, 1.549032, 1, 0, 0.03529412, 1,
2.620956, -0.08116658, 1.516684, 1, 0, 0.03137255, 1,
2.65879, -0.7787194, 3.427032, 1, 0, 0.02352941, 1,
2.671782, 0.9980257, 0.981212, 1, 0, 0.01960784, 1,
3.187985, -1.150276, 1.002569, 1, 0, 0.01176471, 1,
3.625216, -0.02752021, 1.513968, 1, 0, 0.007843138, 1
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
0.3840305, -4.222284, -6.370214, 0, -0.5, 0.5, 0.5,
0.3840305, -4.222284, -6.370214, 1, -0.5, 0.5, 0.5,
0.3840305, -4.222284, -6.370214, 1, 1.5, 0.5, 0.5,
0.3840305, -4.222284, -6.370214, 0, 1.5, 0.5, 0.5
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
-3.955917, 0.2305851, -6.370214, 0, -0.5, 0.5, 0.5,
-3.955917, 0.2305851, -6.370214, 1, -0.5, 0.5, 0.5,
-3.955917, 0.2305851, -6.370214, 1, 1.5, 0.5, 0.5,
-3.955917, 0.2305851, -6.370214, 0, 1.5, 0.5, 0.5
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
-3.955917, -4.222284, 0.4282634, 0, -0.5, 0.5, 0.5,
-3.955917, -4.222284, 0.4282634, 1, -0.5, 0.5, 0.5,
-3.955917, -4.222284, 0.4282634, 1, 1.5, 0.5, 0.5,
-3.955917, -4.222284, 0.4282634, 0, 1.5, 0.5, 0.5
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
-2, -3.194699, -4.801334,
3, -3.194699, -4.801334,
-2, -3.194699, -4.801334,
-2, -3.365963, -5.062814,
-1, -3.194699, -4.801334,
-1, -3.365963, -5.062814,
0, -3.194699, -4.801334,
0, -3.365963, -5.062814,
1, -3.194699, -4.801334,
1, -3.365963, -5.062814,
2, -3.194699, -4.801334,
2, -3.365963, -5.062814,
3, -3.194699, -4.801334,
3, -3.365963, -5.062814
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
-2, -3.708492, -5.585774, 0, -0.5, 0.5, 0.5,
-2, -3.708492, -5.585774, 1, -0.5, 0.5, 0.5,
-2, -3.708492, -5.585774, 1, 1.5, 0.5, 0.5,
-2, -3.708492, -5.585774, 0, 1.5, 0.5, 0.5,
-1, -3.708492, -5.585774, 0, -0.5, 0.5, 0.5,
-1, -3.708492, -5.585774, 1, -0.5, 0.5, 0.5,
-1, -3.708492, -5.585774, 1, 1.5, 0.5, 0.5,
-1, -3.708492, -5.585774, 0, 1.5, 0.5, 0.5,
0, -3.708492, -5.585774, 0, -0.5, 0.5, 0.5,
0, -3.708492, -5.585774, 1, -0.5, 0.5, 0.5,
0, -3.708492, -5.585774, 1, 1.5, 0.5, 0.5,
0, -3.708492, -5.585774, 0, 1.5, 0.5, 0.5,
1, -3.708492, -5.585774, 0, -0.5, 0.5, 0.5,
1, -3.708492, -5.585774, 1, -0.5, 0.5, 0.5,
1, -3.708492, -5.585774, 1, 1.5, 0.5, 0.5,
1, -3.708492, -5.585774, 0, 1.5, 0.5, 0.5,
2, -3.708492, -5.585774, 0, -0.5, 0.5, 0.5,
2, -3.708492, -5.585774, 1, -0.5, 0.5, 0.5,
2, -3.708492, -5.585774, 1, 1.5, 0.5, 0.5,
2, -3.708492, -5.585774, 0, 1.5, 0.5, 0.5,
3, -3.708492, -5.585774, 0, -0.5, 0.5, 0.5,
3, -3.708492, -5.585774, 1, -0.5, 0.5, 0.5,
3, -3.708492, -5.585774, 1, 1.5, 0.5, 0.5,
3, -3.708492, -5.585774, 0, 1.5, 0.5, 0.5
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
-2.954391, -3, -4.801334,
-2.954391, 3, -4.801334,
-2.954391, -3, -4.801334,
-3.121312, -3, -5.062814,
-2.954391, -2, -4.801334,
-3.121312, -2, -5.062814,
-2.954391, -1, -4.801334,
-3.121312, -1, -5.062814,
-2.954391, 0, -4.801334,
-3.121312, 0, -5.062814,
-2.954391, 1, -4.801334,
-3.121312, 1, -5.062814,
-2.954391, 2, -4.801334,
-3.121312, 2, -5.062814,
-2.954391, 3, -4.801334,
-3.121312, 3, -5.062814
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
-3.455154, -3, -5.585774, 0, -0.5, 0.5, 0.5,
-3.455154, -3, -5.585774, 1, -0.5, 0.5, 0.5,
-3.455154, -3, -5.585774, 1, 1.5, 0.5, 0.5,
-3.455154, -3, -5.585774, 0, 1.5, 0.5, 0.5,
-3.455154, -2, -5.585774, 0, -0.5, 0.5, 0.5,
-3.455154, -2, -5.585774, 1, -0.5, 0.5, 0.5,
-3.455154, -2, -5.585774, 1, 1.5, 0.5, 0.5,
-3.455154, -2, -5.585774, 0, 1.5, 0.5, 0.5,
-3.455154, -1, -5.585774, 0, -0.5, 0.5, 0.5,
-3.455154, -1, -5.585774, 1, -0.5, 0.5, 0.5,
-3.455154, -1, -5.585774, 1, 1.5, 0.5, 0.5,
-3.455154, -1, -5.585774, 0, 1.5, 0.5, 0.5,
-3.455154, 0, -5.585774, 0, -0.5, 0.5, 0.5,
-3.455154, 0, -5.585774, 1, -0.5, 0.5, 0.5,
-3.455154, 0, -5.585774, 1, 1.5, 0.5, 0.5,
-3.455154, 0, -5.585774, 0, 1.5, 0.5, 0.5,
-3.455154, 1, -5.585774, 0, -0.5, 0.5, 0.5,
-3.455154, 1, -5.585774, 1, -0.5, 0.5, 0.5,
-3.455154, 1, -5.585774, 1, 1.5, 0.5, 0.5,
-3.455154, 1, -5.585774, 0, 1.5, 0.5, 0.5,
-3.455154, 2, -5.585774, 0, -0.5, 0.5, 0.5,
-3.455154, 2, -5.585774, 1, -0.5, 0.5, 0.5,
-3.455154, 2, -5.585774, 1, 1.5, 0.5, 0.5,
-3.455154, 2, -5.585774, 0, 1.5, 0.5, 0.5,
-3.455154, 3, -5.585774, 0, -0.5, 0.5, 0.5,
-3.455154, 3, -5.585774, 1, -0.5, 0.5, 0.5,
-3.455154, 3, -5.585774, 1, 1.5, 0.5, 0.5,
-3.455154, 3, -5.585774, 0, 1.5, 0.5, 0.5
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
-2.954391, -3.194699, -4,
-2.954391, -3.194699, 4,
-2.954391, -3.194699, -4,
-3.121312, -3.365963, -4,
-2.954391, -3.194699, -2,
-3.121312, -3.365963, -2,
-2.954391, -3.194699, 0,
-3.121312, -3.365963, 0,
-2.954391, -3.194699, 2,
-3.121312, -3.365963, 2,
-2.954391, -3.194699, 4,
-3.121312, -3.365963, 4
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
-3.455154, -3.708492, -4, 0, -0.5, 0.5, 0.5,
-3.455154, -3.708492, -4, 1, -0.5, 0.5, 0.5,
-3.455154, -3.708492, -4, 1, 1.5, 0.5, 0.5,
-3.455154, -3.708492, -4, 0, 1.5, 0.5, 0.5,
-3.455154, -3.708492, -2, 0, -0.5, 0.5, 0.5,
-3.455154, -3.708492, -2, 1, -0.5, 0.5, 0.5,
-3.455154, -3.708492, -2, 1, 1.5, 0.5, 0.5,
-3.455154, -3.708492, -2, 0, 1.5, 0.5, 0.5,
-3.455154, -3.708492, 0, 0, -0.5, 0.5, 0.5,
-3.455154, -3.708492, 0, 1, -0.5, 0.5, 0.5,
-3.455154, -3.708492, 0, 1, 1.5, 0.5, 0.5,
-3.455154, -3.708492, 0, 0, 1.5, 0.5, 0.5,
-3.455154, -3.708492, 2, 0, -0.5, 0.5, 0.5,
-3.455154, -3.708492, 2, 1, -0.5, 0.5, 0.5,
-3.455154, -3.708492, 2, 1, 1.5, 0.5, 0.5,
-3.455154, -3.708492, 2, 0, 1.5, 0.5, 0.5,
-3.455154, -3.708492, 4, 0, -0.5, 0.5, 0.5,
-3.455154, -3.708492, 4, 1, -0.5, 0.5, 0.5,
-3.455154, -3.708492, 4, 1, 1.5, 0.5, 0.5,
-3.455154, -3.708492, 4, 0, 1.5, 0.5, 0.5
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
-2.954391, -3.194699, -4.801334,
-2.954391, 3.655869, -4.801334,
-2.954391, -3.194699, 5.657861,
-2.954391, 3.655869, 5.657861,
-2.954391, -3.194699, -4.801334,
-2.954391, -3.194699, 5.657861,
-2.954391, 3.655869, -4.801334,
-2.954391, 3.655869, 5.657861,
-2.954391, -3.194699, -4.801334,
3.722452, -3.194699, -4.801334,
-2.954391, -3.194699, 5.657861,
3.722452, -3.194699, 5.657861,
-2.954391, 3.655869, -4.801334,
3.722452, 3.655869, -4.801334,
-2.954391, 3.655869, 5.657861,
3.722452, 3.655869, 5.657861,
3.722452, -3.194699, -4.801334,
3.722452, 3.655869, -4.801334,
3.722452, -3.194699, 5.657861,
3.722452, 3.655869, 5.657861,
3.722452, -3.194699, -4.801334,
3.722452, -3.194699, 5.657861,
3.722452, 3.655869, -4.801334,
3.722452, 3.655869, 5.657861
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
var radius = 7.568698;
var distance = 33.67399;
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
mvMatrix.translate( -0.3840305, -0.2305851, -0.4282634 );
mvMatrix.scale( 1.225643, 1.194561, 0.7824143 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.67399);
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
Butanoate<-read.table("Butanoate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.857155, 0.05472133, -2.844685, 0, 0, 1, 1, 1,
-2.751891, 0.5026544, -1.416469, 1, 0, 0, 1, 1,
-2.724033, -0.3021081, -2.455107, 1, 0, 0, 1, 1,
-2.615341, 0.3948175, -1.380504, 1, 0, 0, 1, 1,
-2.54054, 1.107507, -0.5638162, 1, 0, 0, 1, 1,
-2.40526, 0.1750936, -1.302106, 1, 0, 0, 1, 1,
-2.32249, 0.04577238, -2.05027, 0, 0, 0, 1, 1,
-2.307441, -0.8072572, -1.583509, 0, 0, 0, 1, 1,
-2.285253, 0.3623113, 0.9780305, 0, 0, 0, 1, 1,
-2.236869, 0.3937533, -0.891149, 0, 0, 0, 1, 1,
-2.224543, -0.8668, -1.176719, 0, 0, 0, 1, 1,
-2.180589, 2.401129, 0.8818604, 0, 0, 0, 1, 1,
-2.171136, -0.197038, 1.143634, 0, 0, 0, 1, 1,
-2.098259, 3.281321, -0.1753682, 1, 1, 1, 1, 1,
-2.090693, 1.496853, -0.6232873, 1, 1, 1, 1, 1,
-2.08465, -0.8659182, -1.181508, 1, 1, 1, 1, 1,
-2.04234, -1.6174, -2.469941, 1, 1, 1, 1, 1,
-1.981105, 1.099923, -1.416401, 1, 1, 1, 1, 1,
-1.971854, -1.238928, -2.627391, 1, 1, 1, 1, 1,
-1.941452, 0.6528942, -0.05270053, 1, 1, 1, 1, 1,
-1.940156, -1.590815, -1.250777, 1, 1, 1, 1, 1,
-1.932193, 0.08342065, -0.9089867, 1, 1, 1, 1, 1,
-1.917059, -1.335864, -3.406374, 1, 1, 1, 1, 1,
-1.889565, -1.390349, -2.537842, 1, 1, 1, 1, 1,
-1.882121, 1.759415, -1.176277, 1, 1, 1, 1, 1,
-1.85456, -1.762659, -3.228938, 1, 1, 1, 1, 1,
-1.82089, -1.704146, -2.370394, 1, 1, 1, 1, 1,
-1.817191, 1.965916, -0.5692424, 1, 1, 1, 1, 1,
-1.77933, 0.7810224, -1.565451, 0, 0, 1, 1, 1,
-1.779322, -0.8348588, -0.559241, 1, 0, 0, 1, 1,
-1.758, -2.045192, -1.111528, 1, 0, 0, 1, 1,
-1.74124, 1.397368, 1.343059, 1, 0, 0, 1, 1,
-1.74071, -0.4593455, -2.65465, 1, 0, 0, 1, 1,
-1.730788, 1.20107, -1.305247, 1, 0, 0, 1, 1,
-1.727823, -0.470681, -0.8160957, 0, 0, 0, 1, 1,
-1.7208, 0.6131977, -1.346571, 0, 0, 0, 1, 1,
-1.707834, 0.4855683, -1.488361, 0, 0, 0, 1, 1,
-1.707503, 0.6534326, -0.3807438, 0, 0, 0, 1, 1,
-1.70302, 0.1293943, -1.840715, 0, 0, 0, 1, 1,
-1.700672, -1.532728, -2.939208, 0, 0, 0, 1, 1,
-1.698237, -0.08583451, -0.472919, 0, 0, 0, 1, 1,
-1.696228, 0.2216693, -0.1746715, 1, 1, 1, 1, 1,
-1.67225, 1.013731, -1.742488, 1, 1, 1, 1, 1,
-1.662913, -0.3772105, -2.128529, 1, 1, 1, 1, 1,
-1.65575, 0.1551793, -0.3106298, 1, 1, 1, 1, 1,
-1.650029, 1.312607, -2.011063, 1, 1, 1, 1, 1,
-1.649201, -0.5831302, 0.3178507, 1, 1, 1, 1, 1,
-1.645932, 0.6459777, -0.9613152, 1, 1, 1, 1, 1,
-1.644689, 0.9205509, -1.192038, 1, 1, 1, 1, 1,
-1.642431, 1.634531, -1.762392, 1, 1, 1, 1, 1,
-1.635049, 0.380805, -1.529891, 1, 1, 1, 1, 1,
-1.624247, 0.5243812, -1.040093, 1, 1, 1, 1, 1,
-1.62399, -0.7424185, -2.946817, 1, 1, 1, 1, 1,
-1.619882, -0.3020564, -2.659866, 1, 1, 1, 1, 1,
-1.61574, -0.8405551, -3.996451, 1, 1, 1, 1, 1,
-1.615514, -0.4868595, -1.901412, 1, 1, 1, 1, 1,
-1.593807, -1.021776, -1.951838, 0, 0, 1, 1, 1,
-1.590023, -1.685191, -2.300977, 1, 0, 0, 1, 1,
-1.580487, -2.056793, -1.751641, 1, 0, 0, 1, 1,
-1.570142, -0.1149969, 0.3762935, 1, 0, 0, 1, 1,
-1.56338, -0.3625785, -1.741238, 1, 0, 0, 1, 1,
-1.555729, 0.3445858, -1.353426, 1, 0, 0, 1, 1,
-1.55147, -0.2923862, -1.230584, 0, 0, 0, 1, 1,
-1.538734, 1.015785, -0.2527716, 0, 0, 0, 1, 1,
-1.518503, 0.04616574, -0.51817, 0, 0, 0, 1, 1,
-1.506356, 0.006828575, -0.4270792, 0, 0, 0, 1, 1,
-1.5061, 1.217336, 1.11628, 0, 0, 0, 1, 1,
-1.499046, 1.266395, -0.9359597, 0, 0, 0, 1, 1,
-1.491316, -0.5154791, -0.2522401, 0, 0, 0, 1, 1,
-1.487238, 0.871102, -0.2717861, 1, 1, 1, 1, 1,
-1.469122, 0.7682794, -0.7723621, 1, 1, 1, 1, 1,
-1.459925, -0.7920935, -2.46857, 1, 1, 1, 1, 1,
-1.457663, -0.398265, -1.70033, 1, 1, 1, 1, 1,
-1.444535, 0.1743976, -2.072908, 1, 1, 1, 1, 1,
-1.441728, -0.3568327, -2.259007, 1, 1, 1, 1, 1,
-1.43528, 0.09749612, -1.424906, 1, 1, 1, 1, 1,
-1.433695, 1.013285, -0.05725046, 1, 1, 1, 1, 1,
-1.431045, 0.03539094, -1.509798, 1, 1, 1, 1, 1,
-1.424717, 0.9710361, -1.097426, 1, 1, 1, 1, 1,
-1.423338, -0.4431654, -2.686916, 1, 1, 1, 1, 1,
-1.407972, 0.7610293, 0.0249806, 1, 1, 1, 1, 1,
-1.404276, -0.05886498, -2.874799, 1, 1, 1, 1, 1,
-1.404276, 0.8197036, 0.2653412, 1, 1, 1, 1, 1,
-1.401424, 0.942586, -0.2918504, 1, 1, 1, 1, 1,
-1.390667, -0.7661945, -0.8617774, 0, 0, 1, 1, 1,
-1.38667, -1.427101, -2.672153, 1, 0, 0, 1, 1,
-1.385855, -0.2271198, -0.7696944, 1, 0, 0, 1, 1,
-1.360533, -0.6229133, -2.249848, 1, 0, 0, 1, 1,
-1.358845, -0.3300034, -1.870874, 1, 0, 0, 1, 1,
-1.357972, 0.4803639, -1.148318, 1, 0, 0, 1, 1,
-1.351463, -1.079409, -1.745969, 0, 0, 0, 1, 1,
-1.34993, -0.2155817, -1.459538, 0, 0, 0, 1, 1,
-1.339512, -2.000836, -0.9574226, 0, 0, 0, 1, 1,
-1.338731, -0.1455151, -1.974714, 0, 0, 0, 1, 1,
-1.336706, -0.6757999, -1.852826, 0, 0, 0, 1, 1,
-1.321324, -0.2490847, -1.950131, 0, 0, 0, 1, 1,
-1.316453, -1.509678, -1.14496, 0, 0, 0, 1, 1,
-1.303358, -1.014702, -2.310874, 1, 1, 1, 1, 1,
-1.293205, -1.454133, -3.55135, 1, 1, 1, 1, 1,
-1.28094, 1.209139, -2.395195, 1, 1, 1, 1, 1,
-1.275013, -1.180724, -2.171798, 1, 1, 1, 1, 1,
-1.265735, 0.7842035, -0.1141159, 1, 1, 1, 1, 1,
-1.25232, -0.6462451, -1.723109, 1, 1, 1, 1, 1,
-1.246833, -1.076175, -3.918352, 1, 1, 1, 1, 1,
-1.242291, -1.276299, -2.491912, 1, 1, 1, 1, 1,
-1.238927, -2.002361, -1.376935, 1, 1, 1, 1, 1,
-1.235808, -0.675059, -2.563203, 1, 1, 1, 1, 1,
-1.231301, 1.232995, -2.570029, 1, 1, 1, 1, 1,
-1.230727, -0.2283314, -1.879695, 1, 1, 1, 1, 1,
-1.218587, 0.9392654, -1.979823, 1, 1, 1, 1, 1,
-1.196451, -0.9847413, -2.245177, 1, 1, 1, 1, 1,
-1.194604, -0.9337809, -2.956131, 1, 1, 1, 1, 1,
-1.188237, 0.3187078, -2.66044, 0, 0, 1, 1, 1,
-1.184223, -0.13319, -1.064619, 1, 0, 0, 1, 1,
-1.18326, -0.7580022, -2.308761, 1, 0, 0, 1, 1,
-1.177559, -0.6099507, -3.521666, 1, 0, 0, 1, 1,
-1.176325, -0.5902422, -2.753571, 1, 0, 0, 1, 1,
-1.175538, -1.651935, -2.198736, 1, 0, 0, 1, 1,
-1.174475, -0.7883908, -3.164451, 0, 0, 0, 1, 1,
-1.173365, 0.30378, -2.466908, 0, 0, 0, 1, 1,
-1.160958, -0.4538765, -2.676935, 0, 0, 0, 1, 1,
-1.160814, 0.2778459, -0.1136543, 0, 0, 0, 1, 1,
-1.157487, 0.002123735, -0.5738444, 0, 0, 0, 1, 1,
-1.153808, 0.5291178, -3.029238, 0, 0, 0, 1, 1,
-1.153289, 0.06964878, -2.047602, 0, 0, 0, 1, 1,
-1.150651, -0.4922052, -2.505445, 1, 1, 1, 1, 1,
-1.150384, 0.1809371, 0.6433086, 1, 1, 1, 1, 1,
-1.145206, 1.157274, -2.899129, 1, 1, 1, 1, 1,
-1.139855, 1.393493, -0.8422431, 1, 1, 1, 1, 1,
-1.138576, 1.541533, 0.5894769, 1, 1, 1, 1, 1,
-1.135908, -0.1540016, -1.733878, 1, 1, 1, 1, 1,
-1.13571, 0.4447798, -0.6552967, 1, 1, 1, 1, 1,
-1.132201, -0.5111128, -3.315584, 1, 1, 1, 1, 1,
-1.127089, -1.246124, -3.537498, 1, 1, 1, 1, 1,
-1.123306, 1.823173, -1.393763, 1, 1, 1, 1, 1,
-1.123069, -0.2532723, -1.781632, 1, 1, 1, 1, 1,
-1.117576, -0.6869628, -1.817473, 1, 1, 1, 1, 1,
-1.111076, 1.341177, -1.900916, 1, 1, 1, 1, 1,
-1.11063, -0.670857, -1.854565, 1, 1, 1, 1, 1,
-1.110134, -1.323556, -2.448513, 1, 1, 1, 1, 1,
-1.103333, 1.742535, -1.088314, 0, 0, 1, 1, 1,
-1.10253, 0.4928057, -0.3266698, 1, 0, 0, 1, 1,
-1.102477, 0.1408628, -0.2467313, 1, 0, 0, 1, 1,
-1.099827, -1.634915, -3.043802, 1, 0, 0, 1, 1,
-1.095545, -0.5200298, -2.0825, 1, 0, 0, 1, 1,
-1.093506, -1.376802, -2.505702, 1, 0, 0, 1, 1,
-1.073665, -1.049597, -2.993394, 0, 0, 0, 1, 1,
-1.069492, -0.722692, -1.926351, 0, 0, 0, 1, 1,
-1.068873, 0.1586221, -2.203141, 0, 0, 0, 1, 1,
-1.068725, -0.4095757, -0.7660657, 0, 0, 0, 1, 1,
-1.067894, 0.1319896, -3.281081, 0, 0, 0, 1, 1,
-1.059005, -0.8779927, -2.842866, 0, 0, 0, 1, 1,
-1.047176, -2.299448, -3.23331, 0, 0, 0, 1, 1,
-1.041212, -0.3636147, -0.1220092, 1, 1, 1, 1, 1,
-1.03904, 0.4325586, -0.8892631, 1, 1, 1, 1, 1,
-1.027387, 1.934682, -0.1829163, 1, 1, 1, 1, 1,
-1.024159, 0.9166347, 0.2689529, 1, 1, 1, 1, 1,
-1.019818, -0.6033036, -3.075349, 1, 1, 1, 1, 1,
-1.018856, 0.2544739, -2.043604, 1, 1, 1, 1, 1,
-1.011282, -0.7527099, -2.653166, 1, 1, 1, 1, 1,
-1.007029, -0.04380979, -0.234458, 1, 1, 1, 1, 1,
-1.001766, 1.519075, -1.148577, 1, 1, 1, 1, 1,
-1.001494, 0.1663199, -1.427345, 1, 1, 1, 1, 1,
-1.000459, -0.8506502, -0.8851464, 1, 1, 1, 1, 1,
-0.9991783, 0.5969954, -0.763895, 1, 1, 1, 1, 1,
-0.9973308, 0.4739937, -1.564734, 1, 1, 1, 1, 1,
-0.9914478, -0.6563354, -3.623545, 1, 1, 1, 1, 1,
-0.9892613, -0.01066547, -1.33274, 1, 1, 1, 1, 1,
-0.9743841, 0.04936219, -1.597547, 0, 0, 1, 1, 1,
-0.9730182, 0.825206, -0.02910193, 1, 0, 0, 1, 1,
-0.9672803, -0.1635603, -2.469055, 1, 0, 0, 1, 1,
-0.9645447, 1.890341, 0.2150497, 1, 0, 0, 1, 1,
-0.9566123, 2.461053, -1.236158, 1, 0, 0, 1, 1,
-0.9542152, 0.3660091, -1.220204, 1, 0, 0, 1, 1,
-0.9484161, 0.0967494, -0.6006296, 0, 0, 0, 1, 1,
-0.9468017, -0.5187382, -1.087755, 0, 0, 0, 1, 1,
-0.9444489, -0.3852048, -1.557439, 0, 0, 0, 1, 1,
-0.9438655, 0.02077433, -1.066446, 0, 0, 0, 1, 1,
-0.9411775, 2.368872, -1.87591, 0, 0, 0, 1, 1,
-0.9410734, -0.3987638, -1.162945, 0, 0, 0, 1, 1,
-0.9390337, 0.9579817, -2.616602, 0, 0, 0, 1, 1,
-0.9034402, 1.270725, 0.2982403, 1, 1, 1, 1, 1,
-0.9002954, 1.450036, -0.03590234, 1, 1, 1, 1, 1,
-0.8988571, 0.4274102, -0.7692508, 1, 1, 1, 1, 1,
-0.8965448, -0.7916541, -2.890006, 1, 1, 1, 1, 1,
-0.8918408, -0.2721698, -2.08307, 1, 1, 1, 1, 1,
-0.889074, 0.1962463, 0.8613276, 1, 1, 1, 1, 1,
-0.8872891, -0.4160409, -2.066249, 1, 1, 1, 1, 1,
-0.8856164, 0.4799252, -1.830173, 1, 1, 1, 1, 1,
-0.8851085, -0.3079626, -1.139442, 1, 1, 1, 1, 1,
-0.882834, 0.8718725, -0.9034455, 1, 1, 1, 1, 1,
-0.8824614, 1.762812, -1.068323, 1, 1, 1, 1, 1,
-0.8799908, -0.6750298, -3.178147, 1, 1, 1, 1, 1,
-0.8768216, -2.132963, -3.246522, 1, 1, 1, 1, 1,
-0.8658595, 0.08710721, -2.480945, 1, 1, 1, 1, 1,
-0.8616927, 0.8076953, -1.324432, 1, 1, 1, 1, 1,
-0.8616672, 0.7378415, 0.1015754, 0, 0, 1, 1, 1,
-0.8572156, -0.1901668, -2.357442, 1, 0, 0, 1, 1,
-0.8519285, -0.2165592, -2.979255, 1, 0, 0, 1, 1,
-0.8474312, 1.390258, -0.2689601, 1, 0, 0, 1, 1,
-0.8435546, -0.8028738, -3.09918, 1, 0, 0, 1, 1,
-0.8433759, -2.195455, -0.7910595, 1, 0, 0, 1, 1,
-0.8415881, 0.15809, -3.700685, 0, 0, 0, 1, 1,
-0.8380401, 0.7331521, -0.5005629, 0, 0, 0, 1, 1,
-0.832178, 0.2106835, -2.150955, 0, 0, 0, 1, 1,
-0.8273527, -0.2826449, -1.056842, 0, 0, 0, 1, 1,
-0.8272586, 0.96772, 0.2586688, 0, 0, 0, 1, 1,
-0.8252515, -0.5278445, -2.677047, 0, 0, 0, 1, 1,
-0.8228939, -0.5227302, -2.777292, 0, 0, 0, 1, 1,
-0.8214002, -1.197818, -3.457654, 1, 1, 1, 1, 1,
-0.8083503, -0.1827535, -2.37073, 1, 1, 1, 1, 1,
-0.8072921, -1.062978, -1.121582, 1, 1, 1, 1, 1,
-0.8060946, 0.217017, -2.791364, 1, 1, 1, 1, 1,
-0.8012686, -0.1163352, -0.3771524, 1, 1, 1, 1, 1,
-0.8001366, 0.4001698, -0.536483, 1, 1, 1, 1, 1,
-0.7997319, 0.3715675, -2.904446, 1, 1, 1, 1, 1,
-0.7965416, -0.2515174, -0.978774, 1, 1, 1, 1, 1,
-0.7962496, -0.8796099, -3.982741, 1, 1, 1, 1, 1,
-0.7945763, -0.1242987, -2.695192, 1, 1, 1, 1, 1,
-0.7901561, -1.790055, -3.25369, 1, 1, 1, 1, 1,
-0.7889469, 1.279357, -1.212777, 1, 1, 1, 1, 1,
-0.78878, -0.6625492, -2.689474, 1, 1, 1, 1, 1,
-0.7854887, 1.217994, -0.8656767, 1, 1, 1, 1, 1,
-0.7808861, 0.9364883, 0.07419153, 1, 1, 1, 1, 1,
-0.7804693, -1.709612, -1.431479, 0, 0, 1, 1, 1,
-0.7788776, 0.2052536, 0.6051337, 1, 0, 0, 1, 1,
-0.7754549, 1.156006, -3.001573, 1, 0, 0, 1, 1,
-0.7734563, 1.096236, -0.3989662, 1, 0, 0, 1, 1,
-0.7716306, 0.2395071, -0.3497609, 1, 0, 0, 1, 1,
-0.7685985, 0.2198583, -0.6242424, 1, 0, 0, 1, 1,
-0.7685368, -1.58503, -3.879796, 0, 0, 0, 1, 1,
-0.7596855, 0.2569381, -1.339239, 0, 0, 0, 1, 1,
-0.7576165, -0.1041771, -2.43766, 0, 0, 0, 1, 1,
-0.756404, -1.884109, -2.58461, 0, 0, 0, 1, 1,
-0.7486817, 0.5409051, -1.072464, 0, 0, 0, 1, 1,
-0.7473109, 0.3074307, -0.08655057, 0, 0, 0, 1, 1,
-0.7472411, 0.04879308, -2.841772, 0, 0, 0, 1, 1,
-0.7470427, 0.7707708, -0.7976304, 1, 1, 1, 1, 1,
-0.746559, 0.989725, -0.9646994, 1, 1, 1, 1, 1,
-0.7355251, 0.7477801, -2.694327, 1, 1, 1, 1, 1,
-0.7324863, 0.1255478, -2.848859, 1, 1, 1, 1, 1,
-0.7315876, 0.5672699, -0.7810209, 1, 1, 1, 1, 1,
-0.7293049, -0.1075391, -0.6138791, 1, 1, 1, 1, 1,
-0.7262603, 0.7077932, 0.6300088, 1, 1, 1, 1, 1,
-0.7248168, 0.2050919, -2.146646, 1, 1, 1, 1, 1,
-0.7175342, -0.7081202, -1.274037, 1, 1, 1, 1, 1,
-0.7174511, -0.9101008, -1.670606, 1, 1, 1, 1, 1,
-0.7165971, -2.266752, -2.238225, 1, 1, 1, 1, 1,
-0.7152133, 0.03779974, -2.752831, 1, 1, 1, 1, 1,
-0.7111719, -0.577576, -3.074455, 1, 1, 1, 1, 1,
-0.7091052, -0.4986584, -3.66871, 1, 1, 1, 1, 1,
-0.7089893, -0.6805596, -1.962158, 1, 1, 1, 1, 1,
-0.7043624, -0.04517662, -2.650335, 0, 0, 1, 1, 1,
-0.7043521, -0.2081153, -1.341156, 1, 0, 0, 1, 1,
-0.7043475, -0.1895731, -2.846631, 1, 0, 0, 1, 1,
-0.6944758, 1.310425, -0.5421065, 1, 0, 0, 1, 1,
-0.693972, 1.998226, -0.1810829, 1, 0, 0, 1, 1,
-0.6932849, 0.3635216, -2.093441, 1, 0, 0, 1, 1,
-0.6932829, -0.5304058, -2.251208, 0, 0, 0, 1, 1,
-0.6929665, 1.088655, 0.6024503, 0, 0, 0, 1, 1,
-0.6926352, -1.68868, -4.366542, 0, 0, 0, 1, 1,
-0.6910489, -0.7323011, -1.799987, 0, 0, 0, 1, 1,
-0.6905947, 0.1251909, -2.054459, 0, 0, 0, 1, 1,
-0.6904216, -0.4775696, -1.290778, 0, 0, 0, 1, 1,
-0.6904172, 1.258955, -0.722976, 0, 0, 0, 1, 1,
-0.6893834, 1.2987, 0.2567808, 1, 1, 1, 1, 1,
-0.6832149, -0.5794621, -3.297187, 1, 1, 1, 1, 1,
-0.6759987, -0.8800755, -2.120823, 1, 1, 1, 1, 1,
-0.6732965, -0.6510298, -2.387985, 1, 1, 1, 1, 1,
-0.6675789, 0.8538309, 0.1119609, 1, 1, 1, 1, 1,
-0.6669464, 0.7369059, -0.1311521, 1, 1, 1, 1, 1,
-0.6663316, -0.9643131, -2.142019, 1, 1, 1, 1, 1,
-0.6636105, 0.2620027, 0.4174086, 1, 1, 1, 1, 1,
-0.6593282, 0.197188, 0.2901519, 1, 1, 1, 1, 1,
-0.6519767, 0.1043936, -1.477806, 1, 1, 1, 1, 1,
-0.6510124, 0.3945814, 0.146523, 1, 1, 1, 1, 1,
-0.6462611, -0.6023173, -2.87919, 1, 1, 1, 1, 1,
-0.6453995, -0.6822765, -2.796412, 1, 1, 1, 1, 1,
-0.6437969, 1.213958, 0.09577756, 1, 1, 1, 1, 1,
-0.6434452, -0.6485904, -2.389642, 1, 1, 1, 1, 1,
-0.6407248, -2.27068, -4.649016, 0, 0, 1, 1, 1,
-0.6348311, 1.971453, 1.381842, 1, 0, 0, 1, 1,
-0.6343699, -1.189118, -2.23169, 1, 0, 0, 1, 1,
-0.6331431, 0.7227638, -1.795768, 1, 0, 0, 1, 1,
-0.6320722, -0.5106856, -2.29591, 1, 0, 0, 1, 1,
-0.627331, 1.483693, 1.653703, 1, 0, 0, 1, 1,
-0.6246334, 0.107482, -0.8338749, 0, 0, 0, 1, 1,
-0.6235004, 1.176013, -0.5043089, 0, 0, 0, 1, 1,
-0.6220867, -2.024028, -3.126466, 0, 0, 0, 1, 1,
-0.6198615, 0.4551377, -0.4669139, 0, 0, 0, 1, 1,
-0.6150348, 2.31543, -0.9955308, 0, 0, 0, 1, 1,
-0.6118829, 2.300598, -0.03351131, 0, 0, 0, 1, 1,
-0.6106123, -0.6929595, -1.215861, 0, 0, 0, 1, 1,
-0.6068811, -1.303128, -2.732635, 1, 1, 1, 1, 1,
-0.6060472, -0.1597493, -2.222146, 1, 1, 1, 1, 1,
-0.5985568, -0.5569121, -3.678634, 1, 1, 1, 1, 1,
-0.5977808, -0.2525219, -4.119199, 1, 1, 1, 1, 1,
-0.5960557, 0.6389081, 1.309092, 1, 1, 1, 1, 1,
-0.5919018, 0.2428833, -0.02733126, 1, 1, 1, 1, 1,
-0.5907658, -0.6249679, -3.1564, 1, 1, 1, 1, 1,
-0.590454, 1.29661, -0.5630057, 1, 1, 1, 1, 1,
-0.5835213, -1.110313, -2.519269, 1, 1, 1, 1, 1,
-0.5820074, -1.40224, -3.057167, 1, 1, 1, 1, 1,
-0.5817049, -0.4950472, -2.265374, 1, 1, 1, 1, 1,
-0.5783758, -0.9677604, -1.760164, 1, 1, 1, 1, 1,
-0.5779541, 2.077507, -1.691178, 1, 1, 1, 1, 1,
-0.5754333, -2.436062, -2.934636, 1, 1, 1, 1, 1,
-0.5730627, -2.218108, -4.133151, 1, 1, 1, 1, 1,
-0.5729518, -0.324024, -2.383901, 0, 0, 1, 1, 1,
-0.5678174, 1.060523, -0.7102303, 1, 0, 0, 1, 1,
-0.5676691, -0.6839811, -3.635478, 1, 0, 0, 1, 1,
-0.5669156, 1.171894, 0.7263374, 1, 0, 0, 1, 1,
-0.5665163, -0.07397138, 1.007349, 1, 0, 0, 1, 1,
-0.5620775, 1.558966, -0.2459511, 1, 0, 0, 1, 1,
-0.5613341, 0.6254837, -0.5499179, 0, 0, 0, 1, 1,
-0.5606764, 0.4705316, -1.435922, 0, 0, 0, 1, 1,
-0.5583874, 0.1929517, -3.136419, 0, 0, 0, 1, 1,
-0.5576458, -0.3784322, -2.121024, 0, 0, 0, 1, 1,
-0.5508428, 0.5926028, -1.11192, 0, 0, 0, 1, 1,
-0.5503919, 1.043784, 1.111702, 0, 0, 0, 1, 1,
-0.5484166, 1.5, -1.870697, 0, 0, 0, 1, 1,
-0.5473594, -2.260915, -1.920393, 1, 1, 1, 1, 1,
-0.5422524, 0.1707956, -1.523334, 1, 1, 1, 1, 1,
-0.5419309, -0.3128627, -1.613049, 1, 1, 1, 1, 1,
-0.5340918, 0.2018905, 0.327018, 1, 1, 1, 1, 1,
-0.5323895, -0.8876072, -2.9656, 1, 1, 1, 1, 1,
-0.5305393, 1.266196, -1.921616, 1, 1, 1, 1, 1,
-0.5293882, 0.4898402, -1.284724, 1, 1, 1, 1, 1,
-0.5261274, -0.4268569, -0.3155617, 1, 1, 1, 1, 1,
-0.5153956, 0.6820419, -0.5364782, 1, 1, 1, 1, 1,
-0.5153689, 1.691745, -1.077362, 1, 1, 1, 1, 1,
-0.5153301, -1.66751, -2.099736, 1, 1, 1, 1, 1,
-0.5132765, 0.1832407, -0.7731719, 1, 1, 1, 1, 1,
-0.5132084, -0.4878258, -1.690684, 1, 1, 1, 1, 1,
-0.5131776, 0.8006974, -0.1742803, 1, 1, 1, 1, 1,
-0.5127544, -0.2482765, -1.075257, 1, 1, 1, 1, 1,
-0.5115113, -0.07096972, -0.2186707, 0, 0, 1, 1, 1,
-0.5106695, -0.2165635, -2.664841, 1, 0, 0, 1, 1,
-0.5102747, -0.510769, -2.986286, 1, 0, 0, 1, 1,
-0.5089846, 0.3500478, -0.1603261, 1, 0, 0, 1, 1,
-0.506696, -0.7432386, -1.355377, 1, 0, 0, 1, 1,
-0.5058739, 0.8084166, -1.643803, 1, 0, 0, 1, 1,
-0.5011399, -0.3764166, -1.447133, 0, 0, 0, 1, 1,
-0.4980121, -1.487099, -1.645434, 0, 0, 0, 1, 1,
-0.4852887, 0.5407819, -3.407722, 0, 0, 0, 1, 1,
-0.4841886, 0.5321964, -1.923824, 0, 0, 0, 1, 1,
-0.477712, 1.405733, 0.2527721, 0, 0, 0, 1, 1,
-0.4749244, 2.081503, 0.7035403, 0, 0, 0, 1, 1,
-0.4729108, 0.7836642, -0.03637079, 0, 0, 0, 1, 1,
-0.4691824, 0.3514118, -1.344563, 1, 1, 1, 1, 1,
-0.4683475, -1.037404, -2.869353, 1, 1, 1, 1, 1,
-0.4661627, 1.779958, -0.2598227, 1, 1, 1, 1, 1,
-0.4661611, -1.43131, -4.286066, 1, 1, 1, 1, 1,
-0.4630402, -0.3432994, -4.143853, 1, 1, 1, 1, 1,
-0.4585331, -0.9813254, -3.197376, 1, 1, 1, 1, 1,
-0.457393, 1.33588, -1.777802, 1, 1, 1, 1, 1,
-0.4521775, 0.8649741, -1.811952, 1, 1, 1, 1, 1,
-0.4504235, -0.5355417, -1.82227, 1, 1, 1, 1, 1,
-0.4477589, -0.01756136, -1.580611, 1, 1, 1, 1, 1,
-0.4443145, 0.4066333, -0.5370884, 1, 1, 1, 1, 1,
-0.4420087, 0.9070195, 1.073116, 1, 1, 1, 1, 1,
-0.4401496, 1.878091, -1.354581, 1, 1, 1, 1, 1,
-0.4281738, -0.9287427, -2.913287, 1, 1, 1, 1, 1,
-0.4273998, 1.042457, 0.1800522, 1, 1, 1, 1, 1,
-0.4265623, 0.6330054, 0.656341, 0, 0, 1, 1, 1,
-0.4252342, -0.6431664, -3.168585, 1, 0, 0, 1, 1,
-0.4227756, 0.6568235, -0.5693108, 1, 0, 0, 1, 1,
-0.4153654, 0.443607, -1.802628, 1, 0, 0, 1, 1,
-0.415068, -0.5562732, -1.626567, 1, 0, 0, 1, 1,
-0.412312, -0.3348416, -1.199549, 1, 0, 0, 1, 1,
-0.4093709, 1.01185, -0.129598, 0, 0, 0, 1, 1,
-0.4070036, -0.7376817, -3.02521, 0, 0, 0, 1, 1,
-0.4041816, -0.3337491, -2.80326, 0, 0, 0, 1, 1,
-0.4031204, -0.6166413, -3.565202, 0, 0, 0, 1, 1,
-0.402217, -0.03584353, -0.9620675, 0, 0, 0, 1, 1,
-0.4000194, -0.7226753, -0.5858712, 0, 0, 0, 1, 1,
-0.399891, -0.859289, -2.217005, 0, 0, 0, 1, 1,
-0.399672, 1.729218, -0.2756477, 1, 1, 1, 1, 1,
-0.3981172, -0.7459769, -2.01388, 1, 1, 1, 1, 1,
-0.3902663, 1.377607, 0.282463, 1, 1, 1, 1, 1,
-0.3895214, -1.355065, -3.953982, 1, 1, 1, 1, 1,
-0.3868085, -0.3900567, -2.181461, 1, 1, 1, 1, 1,
-0.3851962, 0.5763146, -2.004574, 1, 1, 1, 1, 1,
-0.381847, 0.06133729, -0.2431777, 1, 1, 1, 1, 1,
-0.3789672, 0.26203, -1.302589, 1, 1, 1, 1, 1,
-0.3779804, -1.070928, -2.780871, 1, 1, 1, 1, 1,
-0.3773911, 1.534193, 0.04355896, 1, 1, 1, 1, 1,
-0.3730697, 1.575116, -1.05583, 1, 1, 1, 1, 1,
-0.370869, 0.9265183, -0.5470568, 1, 1, 1, 1, 1,
-0.3708668, -0.5305794, -1.699807, 1, 1, 1, 1, 1,
-0.3645484, -1.646959, -4.160074, 1, 1, 1, 1, 1,
-0.3626174, -1.484898, -2.741645, 1, 1, 1, 1, 1,
-0.3548558, -1.327738, -3.586751, 0, 0, 1, 1, 1,
-0.3499965, -0.3386812, -3.622717, 1, 0, 0, 1, 1,
-0.3480723, 1.185892, -1.088186, 1, 0, 0, 1, 1,
-0.3461677, 1.002291, 0.4241965, 1, 0, 0, 1, 1,
-0.3371301, 1.802619, -0.2845708, 1, 0, 0, 1, 1,
-0.3356401, 1.00329, -1.226344, 1, 0, 0, 1, 1,
-0.334769, -0.2460596, -2.464072, 0, 0, 0, 1, 1,
-0.330059, 1.815704, 0.01567924, 0, 0, 0, 1, 1,
-0.3289036, 0.199127, -0.2189362, 0, 0, 0, 1, 1,
-0.3266418, 2.243418, -0.3883254, 0, 0, 0, 1, 1,
-0.3266255, -0.816714, -2.478339, 0, 0, 0, 1, 1,
-0.3183219, -0.9963027, -2.01161, 0, 0, 0, 1, 1,
-0.3110657, -0.8903193, -1.951622, 0, 0, 0, 1, 1,
-0.3081221, -0.1552624, -1.051659, 1, 1, 1, 1, 1,
-0.3021649, -0.266071, -3.873737, 1, 1, 1, 1, 1,
-0.301605, 1.071462, -0.3280431, 1, 1, 1, 1, 1,
-0.3002469, 0.6097715, -0.7586206, 1, 1, 1, 1, 1,
-0.2989818, 0.1417915, 1.680809, 1, 1, 1, 1, 1,
-0.2978097, -1.091513, -3.100427, 1, 1, 1, 1, 1,
-0.2938874, -0.942527, -2.722826, 1, 1, 1, 1, 1,
-0.292536, -0.5087533, -1.779606, 1, 1, 1, 1, 1,
-0.2879472, 0.410572, -0.2926001, 1, 1, 1, 1, 1,
-0.283929, 1.582606, -0.208567, 1, 1, 1, 1, 1,
-0.2818068, -1.52624, -2.291852, 1, 1, 1, 1, 1,
-0.2772601, 0.8201966, 0.158341, 1, 1, 1, 1, 1,
-0.2729759, 0.1849714, 1.866878, 1, 1, 1, 1, 1,
-0.2704595, 0.3592315, -0.7593222, 1, 1, 1, 1, 1,
-0.2690395, 0.6998467, -0.3428619, 1, 1, 1, 1, 1,
-0.2686113, -0.07939617, -1.555969, 0, 0, 1, 1, 1,
-0.2670561, 0.5739236, 0.3866648, 1, 0, 0, 1, 1,
-0.2661878, -0.9621361, -2.993062, 1, 0, 0, 1, 1,
-0.2641059, -0.6629757, -2.667226, 1, 0, 0, 1, 1,
-0.2618026, 0.02562998, -0.3363875, 1, 0, 0, 1, 1,
-0.2603698, -0.6454367, -2.561106, 1, 0, 0, 1, 1,
-0.2581659, -0.2998248, -2.555392, 0, 0, 0, 1, 1,
-0.2577946, 0.2318038, 0.4572353, 0, 0, 0, 1, 1,
-0.2562176, -2.114909, -2.107895, 0, 0, 0, 1, 1,
-0.2560198, -0.5980914, -1.412071, 0, 0, 0, 1, 1,
-0.2533514, -1.180206, -2.180105, 0, 0, 0, 1, 1,
-0.2482642, -0.8986843, -3.572417, 0, 0, 0, 1, 1,
-0.2454186, 1.236773, 0.5751827, 0, 0, 0, 1, 1,
-0.2446198, 0.08831264, -0.4717496, 1, 1, 1, 1, 1,
-0.2444727, -1.024775, -3.682577, 1, 1, 1, 1, 1,
-0.2431619, -0.5595791, -2.306588, 1, 1, 1, 1, 1,
-0.2362354, -1.720386, -3.48753, 1, 1, 1, 1, 1,
-0.2335345, -1.067131, -3.050925, 1, 1, 1, 1, 1,
-0.2291377, -0.2598407, -2.071682, 1, 1, 1, 1, 1,
-0.2258794, 1.212318, -1.702622, 1, 1, 1, 1, 1,
-0.2257193, -0.6223195, -3.502836, 1, 1, 1, 1, 1,
-0.2253832, -1.137814, -3.659451, 1, 1, 1, 1, 1,
-0.2251968, -1.563233, -3.186786, 1, 1, 1, 1, 1,
-0.2232733, 1.368704, 0.4690757, 1, 1, 1, 1, 1,
-0.2225792, 0.1923741, -2.762359, 1, 1, 1, 1, 1,
-0.2201394, -0.4070207, -2.921699, 1, 1, 1, 1, 1,
-0.2170966, -0.02131626, -1.532502, 1, 1, 1, 1, 1,
-0.216553, -1.802559, -2.644973, 1, 1, 1, 1, 1,
-0.2139446, -0.3628144, -1.531382, 0, 0, 1, 1, 1,
-0.2133427, -2.047643, -2.579648, 1, 0, 0, 1, 1,
-0.2126057, 1.226802, -1.693248, 1, 0, 0, 1, 1,
-0.2117164, -1.406684, -3.345695, 1, 0, 0, 1, 1,
-0.2086291, -0.2378373, -2.281434, 1, 0, 0, 1, 1,
-0.2082535, -0.9789166, -4.348416, 1, 0, 0, 1, 1,
-0.2063875, -0.4597392, -2.226957, 0, 0, 0, 1, 1,
-0.2033507, 1.097094, -0.1517756, 0, 0, 0, 1, 1,
-0.2006307, 0.89872, -1.537962, 0, 0, 0, 1, 1,
-0.2004754, -0.1385263, -2.545062, 0, 0, 0, 1, 1,
-0.1950854, -0.8476618, -2.140866, 0, 0, 0, 1, 1,
-0.1862818, 0.4092797, -1.383674, 0, 0, 0, 1, 1,
-0.1741642, -1.150731, -1.285183, 0, 0, 0, 1, 1,
-0.1736992, 0.04513235, 0.3173108, 1, 1, 1, 1, 1,
-0.1734117, -0.4821511, -2.264039, 1, 1, 1, 1, 1,
-0.1713227, 1.631129, 0.4643596, 1, 1, 1, 1, 1,
-0.1709382, -0.1931257, -1.438534, 1, 1, 1, 1, 1,
-0.1709207, 1.078936, -1.698199, 1, 1, 1, 1, 1,
-0.1693155, 1.008507, -0.8345831, 1, 1, 1, 1, 1,
-0.1680441, 1.114945, 0.8161184, 1, 1, 1, 1, 1,
-0.1678302, 1.791675, -0.5639307, 1, 1, 1, 1, 1,
-0.1643768, -0.07246254, 0.6040667, 1, 1, 1, 1, 1,
-0.1615141, 1.154877, 0.3379293, 1, 1, 1, 1, 1,
-0.1570003, 1.620321, 0.670531, 1, 1, 1, 1, 1,
-0.155994, 1.673826, -1.283514, 1, 1, 1, 1, 1,
-0.1553477, 1.4506, -1.063911, 1, 1, 1, 1, 1,
-0.1499454, -1.610879, -2.104655, 1, 1, 1, 1, 1,
-0.148247, -0.02288314, -0.5034338, 1, 1, 1, 1, 1,
-0.1451496, 0.7947549, 0.3730297, 0, 0, 1, 1, 1,
-0.1410883, 0.9675969, 0.1637039, 1, 0, 0, 1, 1,
-0.1409109, 0.05120187, -0.1584499, 1, 0, 0, 1, 1,
-0.1382668, -0.7796025, -3.026479, 1, 0, 0, 1, 1,
-0.1342992, -0.1062072, -1.174391, 1, 0, 0, 1, 1,
-0.1309345, 0.3926272, 0.1590023, 1, 0, 0, 1, 1,
-0.1309124, 0.3218126, -1.168949, 0, 0, 0, 1, 1,
-0.127105, -0.8112695, -1.946941, 0, 0, 0, 1, 1,
-0.1270345, 0.1018898, -2.338213, 0, 0, 0, 1, 1,
-0.1179789, 1.708634, -0.4055153, 0, 0, 0, 1, 1,
-0.1129011, -1.66293, -2.956093, 0, 0, 0, 1, 1,
-0.1109178, -0.1766501, -1.10558, 0, 0, 0, 1, 1,
-0.1089347, -0.6924675, -3.943066, 0, 0, 0, 1, 1,
-0.105375, 0.2945296, 0.07404384, 1, 1, 1, 1, 1,
-0.1048657, -0.3270454, -2.331916, 1, 1, 1, 1, 1,
-0.1036069, 0.8596694, -1.193284, 1, 1, 1, 1, 1,
-0.1033589, -0.6001909, -3.232432, 1, 1, 1, 1, 1,
-0.102336, 1.313315, -0.4640467, 1, 1, 1, 1, 1,
-0.1012636, 0.4361432, -0.9595091, 1, 1, 1, 1, 1,
-0.101069, 1.512121, -1.810406, 1, 1, 1, 1, 1,
-0.09640644, -0.3783633, -3.03566, 1, 1, 1, 1, 1,
-0.09435996, 1.621892, 0.6321715, 1, 1, 1, 1, 1,
-0.08921279, -1.467673, -2.392134, 1, 1, 1, 1, 1,
-0.08831621, -0.5469375, -2.223231, 1, 1, 1, 1, 1,
-0.08751359, 0.2202348, -1.860407, 1, 1, 1, 1, 1,
-0.08102518, -0.54063, -2.959251, 1, 1, 1, 1, 1,
-0.07840058, 0.150251, -1.368652, 1, 1, 1, 1, 1,
-0.07822265, 0.1647114, -0.6993402, 1, 1, 1, 1, 1,
-0.07636304, 1.368321, 0.09421422, 0, 0, 1, 1, 1,
-0.07482573, -1.418061, -2.257316, 1, 0, 0, 1, 1,
-0.07188246, -0.8451436, -2.007445, 1, 0, 0, 1, 1,
-0.07118409, -1.953987, -4.018314, 1, 0, 0, 1, 1,
-0.06981865, -0.2278795, -0.6280121, 1, 0, 0, 1, 1,
-0.0684431, 0.8001876, -0.1507124, 1, 0, 0, 1, 1,
-0.06837407, 1.874482, -1.501899, 0, 0, 0, 1, 1,
-0.0646286, 0.8611051, 1.129178, 0, 0, 0, 1, 1,
-0.06201656, 0.9651809, -0.08280895, 0, 0, 0, 1, 1,
-0.06094836, -0.7729293, -4.075352, 0, 0, 0, 1, 1,
-0.06062473, 0.8494478, -1.784761, 0, 0, 0, 1, 1,
-0.05378185, -1.014072, -2.052866, 0, 0, 0, 1, 1,
-0.0508939, -0.2728949, -3.50346, 0, 0, 0, 1, 1,
-0.03486294, -0.3639699, -3.059789, 1, 1, 1, 1, 1,
-0.03309904, 1.010861, -0.3753811, 1, 1, 1, 1, 1,
-0.0289873, -0.4929573, -2.625376, 1, 1, 1, 1, 1,
-0.02776092, -0.4083099, -1.974381, 1, 1, 1, 1, 1,
-0.02576119, -1.633452, -4.313349, 1, 1, 1, 1, 1,
-0.02560393, -2.013658, -2.027306, 1, 1, 1, 1, 1,
-0.0196959, 0.3643987, 0.8969568, 1, 1, 1, 1, 1,
-0.01873021, -1.377311, -1.661773, 1, 1, 1, 1, 1,
-0.01822188, 3.556104, 0.6895646, 1, 1, 1, 1, 1,
-0.0155567, -0.3272637, -0.7964323, 1, 1, 1, 1, 1,
-0.01511118, 0.8677951, 1.932732, 1, 1, 1, 1, 1,
-0.01094205, 1.315299, -2.560313, 1, 1, 1, 1, 1,
-0.00975187, -0.9948739, -2.484877, 1, 1, 1, 1, 1,
-0.007108628, 0.8254501, 1.424581, 1, 1, 1, 1, 1,
-0.005052643, -0.4475033, -2.313969, 1, 1, 1, 1, 1,
-0.0001371699, 1.157016, -0.6291555, 0, 0, 1, 1, 1,
0.002962124, 0.916967, -0.1879561, 1, 0, 0, 1, 1,
0.004943239, -0.6918455, 1.90965, 1, 0, 0, 1, 1,
0.01148899, -0.1578647, 3.182059, 1, 0, 0, 1, 1,
0.01234199, 0.9399338, 0.2126762, 1, 0, 0, 1, 1,
0.01461256, 0.2156728, 0.7777151, 1, 0, 0, 1, 1,
0.01827629, 0.5698476, -1.019184, 0, 0, 0, 1, 1,
0.01845888, -0.3982283, 5.028785, 0, 0, 0, 1, 1,
0.02393001, -0.3255618, 1.929343, 0, 0, 0, 1, 1,
0.02735205, -0.7969041, 3.523709, 0, 0, 0, 1, 1,
0.02784866, 1.91855, 1.95533, 0, 0, 0, 1, 1,
0.03204931, 1.087684, -0.5460818, 0, 0, 0, 1, 1,
0.03370012, 0.7561694, 0.9641021, 0, 0, 0, 1, 1,
0.03513866, 1.25879, 0.3151283, 1, 1, 1, 1, 1,
0.03664012, 0.00715964, -0.03704323, 1, 1, 1, 1, 1,
0.04065306, -0.3888377, 1.855567, 1, 1, 1, 1, 1,
0.04693441, 0.02441985, -0.8096696, 1, 1, 1, 1, 1,
0.04951097, -0.7553913, 2.64935, 1, 1, 1, 1, 1,
0.05331362, -0.236726, 2.638048, 1, 1, 1, 1, 1,
0.05723519, 0.3907922, 0.1280626, 1, 1, 1, 1, 1,
0.05811882, 1.064813, -1.576145, 1, 1, 1, 1, 1,
0.06316628, -0.3840928, 1.735848, 1, 1, 1, 1, 1,
0.06558307, 0.5958583, 0.9575273, 1, 1, 1, 1, 1,
0.07171676, -0.8577746, 2.757499, 1, 1, 1, 1, 1,
0.07250151, -1.911059, 4.059135, 1, 1, 1, 1, 1,
0.07473242, 0.7498864, -0.1245875, 1, 1, 1, 1, 1,
0.07522173, 0.3334439, 0.006619343, 1, 1, 1, 1, 1,
0.07640453, -1.909126, 1.875726, 1, 1, 1, 1, 1,
0.07846557, -2.605911, 2.687075, 0, 0, 1, 1, 1,
0.08606858, -0.6075608, 4.641931, 1, 0, 0, 1, 1,
0.08810392, 0.967633, 1.007429, 1, 0, 0, 1, 1,
0.09139905, -0.3839369, 3.624928, 1, 0, 0, 1, 1,
0.09573948, -1.228799, 2.768143, 1, 0, 0, 1, 1,
0.09611366, -0.7829829, 4.396539, 1, 0, 0, 1, 1,
0.09983459, -1.228947, 3.287281, 0, 0, 0, 1, 1,
0.1036143, -0.5905131, 2.841353, 0, 0, 0, 1, 1,
0.1037136, -0.5426567, 3.274408, 0, 0, 0, 1, 1,
0.1043122, -0.2545156, 3.125758, 0, 0, 0, 1, 1,
0.1044692, 1.773654, 0.1382125, 0, 0, 0, 1, 1,
0.1070216, 2.076707, 0.613178, 0, 0, 0, 1, 1,
0.1092573, -1.01184, 3.691629, 0, 0, 0, 1, 1,
0.1132316, 0.3381317, 0.8077185, 1, 1, 1, 1, 1,
0.1144702, 1.233367, 0.8383697, 1, 1, 1, 1, 1,
0.1145583, -1.209849, 4.207526, 1, 1, 1, 1, 1,
0.1182204, 0.6951349, 0.1970625, 1, 1, 1, 1, 1,
0.1197064, 0.3779693, 0.7847503, 1, 1, 1, 1, 1,
0.1224464, 2.659112, 0.4779174, 1, 1, 1, 1, 1,
0.1269643, -0.5575733, 1.856566, 1, 1, 1, 1, 1,
0.1269972, 1.095705, -0.6186551, 1, 1, 1, 1, 1,
0.1282605, -0.3631753, 3.341589, 1, 1, 1, 1, 1,
0.1309277, 1.366197, 1.75169, 1, 1, 1, 1, 1,
0.1333014, -1.742554, 3.077744, 1, 1, 1, 1, 1,
0.1342057, -1.021984, 3.319557, 1, 1, 1, 1, 1,
0.1362343, -0.1490632, 3.101003, 1, 1, 1, 1, 1,
0.1368315, -0.2464605, 3.052166, 1, 1, 1, 1, 1,
0.1385407, 0.2561937, 2.346333, 1, 1, 1, 1, 1,
0.1390179, 0.02043423, 1.350671, 0, 0, 1, 1, 1,
0.143243, -1.316848, 2.940387, 1, 0, 0, 1, 1,
0.1434556, -0.55911, 3.323416, 1, 0, 0, 1, 1,
0.1471917, 0.6848044, 0.9361171, 1, 0, 0, 1, 1,
0.1551037, -0.5846609, 0.3505791, 1, 0, 0, 1, 1,
0.1555524, -0.4282744, 4.061399, 1, 0, 0, 1, 1,
0.1568793, -0.4350979, 2.552694, 0, 0, 0, 1, 1,
0.1603224, 0.4747993, 1.177336, 0, 0, 0, 1, 1,
0.160773, -0.07252678, 1.806322, 0, 0, 0, 1, 1,
0.1616443, -0.108896, -0.001352411, 0, 0, 0, 1, 1,
0.1656527, -0.5677859, 3.019874, 0, 0, 0, 1, 1,
0.1708831, 0.5331933, 0.8794736, 0, 0, 0, 1, 1,
0.1713362, -1.252092, 3.888434, 0, 0, 0, 1, 1,
0.171992, -2.141948, 2.361197, 1, 1, 1, 1, 1,
0.172823, 0.9991552, 0.3889908, 1, 1, 1, 1, 1,
0.1762045, 0.08357903, 1.875068, 1, 1, 1, 1, 1,
0.1826213, -0.9187734, 3.988189, 1, 1, 1, 1, 1,
0.1871442, 0.2784601, -0.8255752, 1, 1, 1, 1, 1,
0.191208, -0.4589287, 3.202962, 1, 1, 1, 1, 1,
0.1920144, -0.5525404, 2.75795, 1, 1, 1, 1, 1,
0.1925684, -0.09704834, 2.102852, 1, 1, 1, 1, 1,
0.19293, 0.5971071, -0.5890775, 1, 1, 1, 1, 1,
0.1942361, -0.2598058, 2.801959, 1, 1, 1, 1, 1,
0.1943756, -0.3499408, 1.995533, 1, 1, 1, 1, 1,
0.1949186, -1.074029, 3.051544, 1, 1, 1, 1, 1,
0.1970041, 0.5389034, -0.134895, 1, 1, 1, 1, 1,
0.1971683, -0.03361184, 2.473265, 1, 1, 1, 1, 1,
0.1997083, 0.7375357, 1.009316, 1, 1, 1, 1, 1,
0.2009388, -0.9304874, 2.143139, 0, 0, 1, 1, 1,
0.2012871, 0.1351511, 2.372832, 1, 0, 0, 1, 1,
0.2067828, -0.5215681, 4.483932, 1, 0, 0, 1, 1,
0.2130453, -0.5814292, 2.911887, 1, 0, 0, 1, 1,
0.2154438, 1.114181, -0.1349106, 1, 0, 0, 1, 1,
0.2230061, -0.6931177, 4.536092, 1, 0, 0, 1, 1,
0.2242797, 0.2789382, -0.7646148, 0, 0, 0, 1, 1,
0.2251266, -1.330714, 4.053854, 0, 0, 0, 1, 1,
0.2267819, 0.4500349, 1.935708, 0, 0, 0, 1, 1,
0.227058, 0.3293017, -0.6498601, 0, 0, 0, 1, 1,
0.2297661, 1.762136, 0.3668055, 0, 0, 0, 1, 1,
0.2324233, -1.523636, 3.181037, 0, 0, 0, 1, 1,
0.2324834, 1.610089, -0.9439237, 0, 0, 0, 1, 1,
0.2377866, -1.4111, 2.411595, 1, 1, 1, 1, 1,
0.2434101, -0.04242493, 4.229914, 1, 1, 1, 1, 1,
0.2486465, -0.5396551, 3.166793, 1, 1, 1, 1, 1,
0.2548258, 2.489429, -0.2969465, 1, 1, 1, 1, 1,
0.2549369, -0.1632285, 2.048815, 1, 1, 1, 1, 1,
0.2585043, 1.570964, 2.409768, 1, 1, 1, 1, 1,
0.2592193, -0.1981794, 4.198317, 1, 1, 1, 1, 1,
0.2655534, -0.6574029, 4.62337, 1, 1, 1, 1, 1,
0.2683298, 0.3633335, 0.8492808, 1, 1, 1, 1, 1,
0.2785261, -0.4600089, 2.412454, 1, 1, 1, 1, 1,
0.2799168, -0.4598458, 2.952254, 1, 1, 1, 1, 1,
0.2801052, -1.07371, 1.100947, 1, 1, 1, 1, 1,
0.2803295, 0.2536053, 1.634662, 1, 1, 1, 1, 1,
0.2804765, 0.9186809, 0.08991771, 1, 1, 1, 1, 1,
0.2889943, -1.108834, 2.728813, 1, 1, 1, 1, 1,
0.2893129, -0.7487973, 0.262242, 0, 0, 1, 1, 1,
0.2989, -1.80042, 3.716644, 1, 0, 0, 1, 1,
0.2997826, -1.719308, 2.619774, 1, 0, 0, 1, 1,
0.3075175, -0.8749378, 4.311512, 1, 0, 0, 1, 1,
0.3079503, -0.1846373, 2.45675, 1, 0, 0, 1, 1,
0.3094289, 0.6351989, -0.004462388, 1, 0, 0, 1, 1,
0.3099733, 1.585477, 0.7241179, 0, 0, 0, 1, 1,
0.3104783, -2.713247, 2.717581, 0, 0, 0, 1, 1,
0.3183951, -0.8678336, 0.726946, 0, 0, 0, 1, 1,
0.3322119, 0.2603225, 1.930696, 0, 0, 0, 1, 1,
0.3338118, 0.3815891, 0.9802267, 0, 0, 0, 1, 1,
0.3347859, 0.2684469, -0.4350188, 0, 0, 0, 1, 1,
0.3358748, 1.092422, 0.01534027, 0, 0, 0, 1, 1,
0.3453012, 0.2605807, 0.02278073, 1, 1, 1, 1, 1,
0.346007, -0.07320551, 2.26464, 1, 1, 1, 1, 1,
0.3492217, -2.278992, 2.935509, 1, 1, 1, 1, 1,
0.3498121, 0.2823799, 1.209856, 1, 1, 1, 1, 1,
0.3510249, -2.209559, 3.261227, 1, 1, 1, 1, 1,
0.3513674, 1.934743, 2.279186, 1, 1, 1, 1, 1,
0.3515789, -0.5989673, 3.650008, 1, 1, 1, 1, 1,
0.3573134, -1.782989, 2.826714, 1, 1, 1, 1, 1,
0.3597719, 1.29233, -1.964342, 1, 1, 1, 1, 1,
0.367536, 0.8390489, 1.571464, 1, 1, 1, 1, 1,
0.3679204, -0.5956197, 2.79353, 1, 1, 1, 1, 1,
0.3686491, 0.9082128, -0.9559296, 1, 1, 1, 1, 1,
0.3702975, 0.7199016, 0.683893, 1, 1, 1, 1, 1,
0.3747777, 1.041353, 1.45486, 1, 1, 1, 1, 1,
0.3796234, -1.37726, 3.182505, 1, 1, 1, 1, 1,
0.3799408, -0.2599776, 3.425904, 0, 0, 1, 1, 1,
0.3801469, 0.5229861, -0.7579337, 1, 0, 0, 1, 1,
0.3917749, -0.137157, 3.147216, 1, 0, 0, 1, 1,
0.3931677, -1.204165, 2.691967, 1, 0, 0, 1, 1,
0.3956943, -1.950016, 3.966381, 1, 0, 0, 1, 1,
0.3965993, 1.447556, -0.9299287, 1, 0, 0, 1, 1,
0.400279, -0.7858701, 1.301822, 0, 0, 0, 1, 1,
0.401444, -1.484537, 2.292189, 0, 0, 0, 1, 1,
0.4033287, -0.1103927, 1.4448, 0, 0, 0, 1, 1,
0.4061302, -0.5682469, 3.08801, 0, 0, 0, 1, 1,
0.4068194, 0.2414911, 2.425894, 0, 0, 0, 1, 1,
0.4074965, -1.312865, 1.42574, 0, 0, 0, 1, 1,
0.4161024, 0.6835078, 0.2038882, 0, 0, 0, 1, 1,
0.4213882, -0.9638112, 2.274899, 1, 1, 1, 1, 1,
0.4247071, 0.06582042, 1.976425, 1, 1, 1, 1, 1,
0.4264527, 0.514109, -0.1335138, 1, 1, 1, 1, 1,
0.4388526, -1.86314, 1.631616, 1, 1, 1, 1, 1,
0.4393261, -1.140897, 3.940888, 1, 1, 1, 1, 1,
0.4421552, 1.332293, 1.754462, 1, 1, 1, 1, 1,
0.4426726, 1.104699, -1.10411, 1, 1, 1, 1, 1,
0.4469847, -0.3984435, 0.8132845, 1, 1, 1, 1, 1,
0.4490599, 0.6573921, 1.073717, 1, 1, 1, 1, 1,
0.4494125, -0.1915314, 1.41911, 1, 1, 1, 1, 1,
0.4495403, 0.2927214, -0.2823521, 1, 1, 1, 1, 1,
0.4499989, -0.6314145, 2.799002, 1, 1, 1, 1, 1,
0.4548543, -0.4615044, 0.1513232, 1, 1, 1, 1, 1,
0.4568272, 1.315108, 0.3317774, 1, 1, 1, 1, 1,
0.4664409, 0.7127093, 0.2722457, 1, 1, 1, 1, 1,
0.4769172, 0.2811678, 1.549082, 0, 0, 1, 1, 1,
0.4810227, 0.6931314, 0.8996539, 1, 0, 0, 1, 1,
0.4834637, -0.2499917, 3.748042, 1, 0, 0, 1, 1,
0.4849362, -1.654325, 5.394156, 1, 0, 0, 1, 1,
0.4891208, 2.390619, 0.2688024, 1, 0, 0, 1, 1,
0.4908155, 0.06727899, 1.725069, 1, 0, 0, 1, 1,
0.4933986, -0.8075665, 2.919752, 0, 0, 0, 1, 1,
0.4965177, -1.748019, 4.138051, 0, 0, 0, 1, 1,
0.5057566, -0.7531925, 2.311812, 0, 0, 0, 1, 1,
0.5062319, -1.778143, 2.033838, 0, 0, 0, 1, 1,
0.5092024, -1.995666, 5.505543, 0, 0, 0, 1, 1,
0.5099382, -0.3674468, 2.299906, 0, 0, 0, 1, 1,
0.5112219, -0.5402411, 2.382721, 0, 0, 0, 1, 1,
0.5116245, 0.7070591, -0.3687085, 1, 1, 1, 1, 1,
0.5130759, -3.094934, 2.045431, 1, 1, 1, 1, 1,
0.5220193, 1.641788, -0.4410513, 1, 1, 1, 1, 1,
0.5236035, -1.01321, 3.349873, 1, 1, 1, 1, 1,
0.5280698, 0.01767687, -0.08080465, 1, 1, 1, 1, 1,
0.5285873, -0.6613285, 3.382518, 1, 1, 1, 1, 1,
0.5301241, -0.7286239, 1.239814, 1, 1, 1, 1, 1,
0.534835, 1.862737, 1.146165, 1, 1, 1, 1, 1,
0.5372962, 1.389056, 0.3424261, 1, 1, 1, 1, 1,
0.5436863, -0.006192893, 4.085889, 1, 1, 1, 1, 1,
0.5497659, 0.05496451, 0.6972244, 1, 1, 1, 1, 1,
0.5523813, 1.389889, 1.31237, 1, 1, 1, 1, 1,
0.5524815, 1.229301, 2.182977, 1, 1, 1, 1, 1,
0.5532904, -0.1369573, 2.377765, 1, 1, 1, 1, 1,
0.5561113, -1.417774, 0.9876778, 1, 1, 1, 1, 1,
0.5609679, -0.9375724, 2.284685, 0, 0, 1, 1, 1,
0.5629844, -1.633182, 2.940639, 1, 0, 0, 1, 1,
0.5636993, 0.4043618, -0.5536942, 1, 0, 0, 1, 1,
0.5696781, 1.089243, 1.152806, 1, 0, 0, 1, 1,
0.570648, -0.2402653, 1.043898, 1, 0, 0, 1, 1,
0.5732715, 0.438025, -0.6163011, 1, 0, 0, 1, 1,
0.5792168, 1.036151, -0.8789856, 0, 0, 0, 1, 1,
0.5834399, -1.33127, 3.091689, 0, 0, 0, 1, 1,
0.5842381, -1.287027, 2.418567, 0, 0, 0, 1, 1,
0.5866528, 1.894879, 0.702155, 0, 0, 0, 1, 1,
0.5912086, -0.8804179, 0.8954881, 0, 0, 0, 1, 1,
0.612865, -0.8840796, 5.372783, 0, 0, 0, 1, 1,
0.614754, 0.2855542, 0.08732387, 0, 0, 0, 1, 1,
0.6148482, 1.305453, -0.7481405, 1, 1, 1, 1, 1,
0.6148765, 0.8146194, 1.158181, 1, 1, 1, 1, 1,
0.6149518, 2.476677, 0.4664875, 1, 1, 1, 1, 1,
0.6164936, 0.4080926, 0.03039487, 1, 1, 1, 1, 1,
0.6211728, -0.170649, 3.97399, 1, 1, 1, 1, 1,
0.6220455, 0.78492, -0.2137381, 1, 1, 1, 1, 1,
0.6220732, 0.2559925, 2.438091, 1, 1, 1, 1, 1,
0.6296864, 0.5991677, 3.181007, 1, 1, 1, 1, 1,
0.6307275, -0.7907081, 1.837681, 1, 1, 1, 1, 1,
0.6366565, 0.6954238, 0.5127986, 1, 1, 1, 1, 1,
0.6452599, 0.766111, 1.633292, 1, 1, 1, 1, 1,
0.6461272, 0.7580807, 1.630921, 1, 1, 1, 1, 1,
0.6476068, 0.211171, 1.253379, 1, 1, 1, 1, 1,
0.6484138, 0.1971757, 2.542331, 1, 1, 1, 1, 1,
0.6528568, 1.381835, -0.6090004, 1, 1, 1, 1, 1,
0.6539551, -1.680759, 2.627538, 0, 0, 1, 1, 1,
0.6540462, 0.3932953, 0.9507146, 1, 0, 0, 1, 1,
0.6568127, -0.212839, 1.932086, 1, 0, 0, 1, 1,
0.6602074, -0.0346235, 1.16926, 1, 0, 0, 1, 1,
0.6606863, 0.02787095, 1.390483, 1, 0, 0, 1, 1,
0.6632916, -1.396809, 1.413999, 1, 0, 0, 1, 1,
0.6646019, -0.4061247, 0.9089031, 0, 0, 0, 1, 1,
0.6665372, 1.28246, 0.5642326, 0, 0, 0, 1, 1,
0.6667439, 0.4569659, 0.2835237, 0, 0, 0, 1, 1,
0.6677556, 0.4737482, -0.06490514, 0, 0, 0, 1, 1,
0.6682301, -2.097363, 0.7041774, 0, 0, 0, 1, 1,
0.6698326, 0.7879249, 1.299058, 0, 0, 0, 1, 1,
0.6725305, 1.208633, 1.217629, 0, 0, 0, 1, 1,
0.6749392, -1.045525, 2.571816, 1, 1, 1, 1, 1,
0.680867, -0.4376574, 4.49702, 1, 1, 1, 1, 1,
0.6819686, 1.239594, 0.7380216, 1, 1, 1, 1, 1,
0.6833116, -1.685592, 2.425612, 1, 1, 1, 1, 1,
0.6944466, 0.9407516, 0.2867591, 1, 1, 1, 1, 1,
0.6961582, -0.6633893, 1.145294, 1, 1, 1, 1, 1,
0.7040217, 0.7740375, 0.5819762, 1, 1, 1, 1, 1,
0.7071931, 0.3216108, 1.556385, 1, 1, 1, 1, 1,
0.7073603, 1.78676, -0.2626599, 1, 1, 1, 1, 1,
0.71039, -0.8154318, 1.168418, 1, 1, 1, 1, 1,
0.7118326, 0.4200053, 0.376484, 1, 1, 1, 1, 1,
0.7253735, 0.1483062, 2.010055, 1, 1, 1, 1, 1,
0.7305443, -1.482062, 1.56049, 1, 1, 1, 1, 1,
0.7310462, -2.024915, 2.931905, 1, 1, 1, 1, 1,
0.7330446, 0.355927, 0.2609155, 1, 1, 1, 1, 1,
0.735092, -2.58001, 2.041189, 0, 0, 1, 1, 1,
0.7353354, 0.7877986, -0.3872739, 1, 0, 0, 1, 1,
0.7403546, 0.1698483, -0.01881178, 1, 0, 0, 1, 1,
0.7413257, -0.4146729, 2.593785, 1, 0, 0, 1, 1,
0.7444093, 0.2661066, 0.2088262, 1, 0, 0, 1, 1,
0.7467829, 0.2282272, 1.210201, 1, 0, 0, 1, 1,
0.7486314, 0.2663215, 0.3211964, 0, 0, 0, 1, 1,
0.7491134, -0.9083601, 1.453674, 0, 0, 0, 1, 1,
0.7492296, 1.147565, -0.349091, 0, 0, 0, 1, 1,
0.7515127, -1.017599, 2.495689, 0, 0, 0, 1, 1,
0.7531418, 0.2676979, -0.2031402, 0, 0, 0, 1, 1,
0.7549416, -0.06744419, 1.806468, 0, 0, 0, 1, 1,
0.7562984, 1.442045, -0.09050885, 0, 0, 0, 1, 1,
0.7567704, 3.258995, 0.5481106, 1, 1, 1, 1, 1,
0.7574783, -1.370268, 1.487847, 1, 1, 1, 1, 1,
0.7662013, -1.025938, 3.777314, 1, 1, 1, 1, 1,
0.7690715, 0.1839098, 1.792659, 1, 1, 1, 1, 1,
0.7715714, -0.4362553, 1.487889, 1, 1, 1, 1, 1,
0.772884, 0.1713401, 1.825868, 1, 1, 1, 1, 1,
0.774552, 0.01388341, 1.152621, 1, 1, 1, 1, 1,
0.7748533, 0.5449647, 1.019842, 1, 1, 1, 1, 1,
0.7755517, 0.8713502, 0.4345616, 1, 1, 1, 1, 1,
0.776686, -0.6975911, 2.77437, 1, 1, 1, 1, 1,
0.7779866, -0.9988329, 1.466959, 1, 1, 1, 1, 1,
0.7784694, 0.5178393, 1.619024, 1, 1, 1, 1, 1,
0.7821487, -1.995671, 3.239703, 1, 1, 1, 1, 1,
0.783911, -0.09479994, 1.865788, 1, 1, 1, 1, 1,
0.78424, 1.354738, 1.177482, 1, 1, 1, 1, 1,
0.7852089, -0.7640224, 3.341096, 0, 0, 1, 1, 1,
0.7979732, -1.120377, 2.532863, 1, 0, 0, 1, 1,
0.8029943, 0.5352378, 3.099688, 1, 0, 0, 1, 1,
0.8090122, 1.521681, 0.9256502, 1, 0, 0, 1, 1,
0.8130807, -0.400752, 0.2042651, 1, 0, 0, 1, 1,
0.8234534, -0.6328359, 3.659384, 1, 0, 0, 1, 1,
0.8250681, 0.5122772, 0.1189755, 0, 0, 0, 1, 1,
0.841074, -1.14547, 5.424849, 0, 0, 0, 1, 1,
0.8413266, 0.1231191, 3.73796, 0, 0, 0, 1, 1,
0.8418319, -1.965256, 2.405489, 0, 0, 0, 1, 1,
0.8476506, 1.796203, -0.787658, 0, 0, 0, 1, 1,
0.8492969, 0.1609083, 1.283275, 0, 0, 0, 1, 1,
0.8501561, -0.0318957, 2.526067, 0, 0, 0, 1, 1,
0.8512338, -0.2276385, 2.927395, 1, 1, 1, 1, 1,
0.8519745, 0.7190333, 1.017303, 1, 1, 1, 1, 1,
0.8521599, 2.538595, 0.3069729, 1, 1, 1, 1, 1,
0.8535665, -0.03484028, 2.76393, 1, 1, 1, 1, 1,
0.8548445, -0.02635518, 2.19379, 1, 1, 1, 1, 1,
0.8618472, 0.112185, 1.800517, 1, 1, 1, 1, 1,
0.866475, 0.1864798, -0.3124584, 1, 1, 1, 1, 1,
0.8688362, 0.123659, 0.9702371, 1, 1, 1, 1, 1,
0.875653, 1.363081, 2.426507, 1, 1, 1, 1, 1,
0.8768854, -0.4454032, 3.280209, 1, 1, 1, 1, 1,
0.8772554, 0.1414226, 0.4069198, 1, 1, 1, 1, 1,
0.8787146, 0.6179439, 0.1719337, 1, 1, 1, 1, 1,
0.8796988, 0.5743719, 0.8046966, 1, 1, 1, 1, 1,
0.8861418, -1.590229, 3.759955, 1, 1, 1, 1, 1,
0.8876582, -0.1660889, 1.731656, 1, 1, 1, 1, 1,
0.8922216, 1.108656, -0.02970144, 0, 0, 1, 1, 1,
0.8960566, 0.6720531, 0.5380927, 1, 0, 0, 1, 1,
0.8974987, 1.217867, 0.2208081, 1, 0, 0, 1, 1,
0.9028662, 0.6581969, -0.1076443, 1, 0, 0, 1, 1,
0.9160603, -0.7160935, 3.001209, 1, 0, 0, 1, 1,
0.9169985, -0.2939206, 1.439496, 1, 0, 0, 1, 1,
0.9179185, 1.207387, 1.242465, 0, 0, 0, 1, 1,
0.9298561, 0.2973258, 1.768596, 0, 0, 0, 1, 1,
0.9386516, 0.6285686, 0.2840048, 0, 0, 0, 1, 1,
0.9478788, 0.3127358, 0.8611018, 0, 0, 0, 1, 1,
0.9588991, -0.2930335, 0.8553021, 0, 0, 0, 1, 1,
0.9649857, -2.882494, 2.775252, 0, 0, 0, 1, 1,
0.968509, -0.02960081, 1.09121, 0, 0, 0, 1, 1,
0.9726442, 0.2775049, 3.359249, 1, 1, 1, 1, 1,
0.9730405, 0.009285183, 3.195524, 1, 1, 1, 1, 1,
0.9751645, 0.246237, 1.82798, 1, 1, 1, 1, 1,
0.9823033, -1.374052, 2.752887, 1, 1, 1, 1, 1,
0.9891915, 1.205032, 1.48095, 1, 1, 1, 1, 1,
0.9939052, 0.7123232, -0.3277767, 1, 1, 1, 1, 1,
0.9973252, -0.3067495, 3.682423, 1, 1, 1, 1, 1,
1.004229, -0.2448206, 2.663641, 1, 1, 1, 1, 1,
1.004719, 1.192492, 0.839427, 1, 1, 1, 1, 1,
1.007938, -0.1882471, 0.8902618, 1, 1, 1, 1, 1,
1.010455, -0.6922058, 2.106848, 1, 1, 1, 1, 1,
1.011158, 0.4090616, 0.09250295, 1, 1, 1, 1, 1,
1.012276, -1.285886, 0.7061344, 1, 1, 1, 1, 1,
1.020279, -0.1640399, 1.325917, 1, 1, 1, 1, 1,
1.026256, 0.5827112, 2.219078, 1, 1, 1, 1, 1,
1.03377, 0.6121702, -0.7960596, 0, 0, 1, 1, 1,
1.036511, -1.663783, 2.402186, 1, 0, 0, 1, 1,
1.043117, 0.7302891, 1.88155, 1, 0, 0, 1, 1,
1.050849, 1.117083, 1.225719, 1, 0, 0, 1, 1,
1.052751, -0.5001718, 1.552467, 1, 0, 0, 1, 1,
1.060434, 0.2631949, 0.02135506, 1, 0, 0, 1, 1,
1.063211, 1.172729, -0.187932, 0, 0, 0, 1, 1,
1.065214, 1.104343, 0.8717009, 0, 0, 0, 1, 1,
1.068918, 0.1935505, 1.482306, 0, 0, 0, 1, 1,
1.086661, 0.19064, 1.628983, 0, 0, 0, 1, 1,
1.090933, -0.8195693, 2.348291, 0, 0, 0, 1, 1,
1.091636, 0.9322753, 0.2779246, 0, 0, 0, 1, 1,
1.094452, -0.3989273, 1.557504, 0, 0, 0, 1, 1,
1.101258, -0.8249511, 0.8840709, 1, 1, 1, 1, 1,
1.103357, -0.5900394, -0.4171313, 1, 1, 1, 1, 1,
1.106834, -1.371036, 1.89496, 1, 1, 1, 1, 1,
1.121304, -1.12325, 3.577063, 1, 1, 1, 1, 1,
1.127374, 0.7641743, 2.124421, 1, 1, 1, 1, 1,
1.127993, -0.7204588, 2.725525, 1, 1, 1, 1, 1,
1.129156, -0.8518448, 2.6582, 1, 1, 1, 1, 1,
1.142525, 1.739333, -0.4150219, 1, 1, 1, 1, 1,
1.142665, -0.9073809, 2.116856, 1, 1, 1, 1, 1,
1.161533, -0.1391339, 2.161847, 1, 1, 1, 1, 1,
1.163136, -1.091616, 1.04558, 1, 1, 1, 1, 1,
1.165624, -1.359277, 1.807911, 1, 1, 1, 1, 1,
1.174227, 0.1972595, 1.367988, 1, 1, 1, 1, 1,
1.174663, -0.4719165, 3.188074, 1, 1, 1, 1, 1,
1.188235, 1.474395, 0.8262272, 1, 1, 1, 1, 1,
1.200482, 0.8195475, -0.01772671, 0, 0, 1, 1, 1,
1.201234, -1.100131, 3.247929, 1, 0, 0, 1, 1,
1.202973, 0.8570055, 1.963286, 1, 0, 0, 1, 1,
1.204105, 0.05463465, 2.095891, 1, 0, 0, 1, 1,
1.206795, 0.7044569, 0.1816238, 1, 0, 0, 1, 1,
1.210156, 0.7865685, 1.50833, 1, 0, 0, 1, 1,
1.212106, 0.3913117, 0.991205, 0, 0, 0, 1, 1,
1.217813, -0.5707413, 1.537634, 0, 0, 0, 1, 1,
1.218187, 0.7289601, 0.9283537, 0, 0, 0, 1, 1,
1.219522, 0.5963004, 0.6570209, 0, 0, 0, 1, 1,
1.219851, 1.1954, 1.149387, 0, 0, 0, 1, 1,
1.221209, -1.0148, 1.43108, 0, 0, 0, 1, 1,
1.234609, 0.3340244, 2.840088, 0, 0, 0, 1, 1,
1.245576, 0.7850485, -0.7749971, 1, 1, 1, 1, 1,
1.246484, 0.938408, 1.569301, 1, 1, 1, 1, 1,
1.247471, -0.3074927, 5.064775, 1, 1, 1, 1, 1,
1.255339, -1.403911, 0.517513, 1, 1, 1, 1, 1,
1.260963, 0.6602466, 0.6808157, 1, 1, 1, 1, 1,
1.264146, -0.625241, -0.2699513, 1, 1, 1, 1, 1,
1.266974, -1.387926, 0.870634, 1, 1, 1, 1, 1,
1.267585, -0.8218712, 2.590923, 1, 1, 1, 1, 1,
1.268366, 0.5008466, 1.17705, 1, 1, 1, 1, 1,
1.26872, 0.7117881, 2.764498, 1, 1, 1, 1, 1,
1.272371, 1.578565, 0.6950217, 1, 1, 1, 1, 1,
1.275686, 0.6253421, 2.714512, 1, 1, 1, 1, 1,
1.277103, -0.4466761, 2.711618, 1, 1, 1, 1, 1,
1.28291, -0.2125085, 0.7579318, 1, 1, 1, 1, 1,
1.283786, 1.699847, -0.4704991, 1, 1, 1, 1, 1,
1.29047, -0.2611609, 1.077908, 0, 0, 1, 1, 1,
1.293564, -0.5622959, 0.7111286, 1, 0, 0, 1, 1,
1.297678, 0.8556121, 1.471648, 1, 0, 0, 1, 1,
1.297909, -0.7675436, 2.171516, 1, 0, 0, 1, 1,
1.310762, 1.770987, 0.01418706, 1, 0, 0, 1, 1,
1.316673, 0.617846, 1.343007, 1, 0, 0, 1, 1,
1.327923, -0.7710976, 1.187117, 0, 0, 0, 1, 1,
1.328404, 0.4056979, -0.1568359, 0, 0, 0, 1, 1,
1.330508, 0.568451, 1.440791, 0, 0, 0, 1, 1,
1.332242, -1.408787, 1.628866, 0, 0, 0, 1, 1,
1.352162, -0.9867377, 2.150214, 0, 0, 0, 1, 1,
1.361919, 0.03582208, 0.7580395, 0, 0, 0, 1, 1,
1.36587, 1.605701, -1.354372, 0, 0, 0, 1, 1,
1.378635, -0.8274136, 1.424195, 1, 1, 1, 1, 1,
1.382215, -0.8286839, 0.5207459, 1, 1, 1, 1, 1,
1.382336, -0.7532755, 3.610826, 1, 1, 1, 1, 1,
1.386956, 0.9808657, 0.3463716, 1, 1, 1, 1, 1,
1.407365, 1.012606, 0.1359517, 1, 1, 1, 1, 1,
1.415434, 0.7387187, 1.440509, 1, 1, 1, 1, 1,
1.417496, 1.226063, 1.314003, 1, 1, 1, 1, 1,
1.428331, -1.004733, 1.575366, 1, 1, 1, 1, 1,
1.433608, -0.2948857, 1.213856, 1, 1, 1, 1, 1,
1.434528, -1.157635, 1.269971, 1, 1, 1, 1, 1,
1.43573, -1.524107, 3.504139, 1, 1, 1, 1, 1,
1.451274, -1.35848, 3.386106, 1, 1, 1, 1, 1,
1.502816, 1.194117, 0.1364284, 1, 1, 1, 1, 1,
1.507499, 0.9879562, 0.7994803, 1, 1, 1, 1, 1,
1.520723, -0.345299, 3.147987, 1, 1, 1, 1, 1,
1.523549, -0.02444477, 1.523414, 0, 0, 1, 1, 1,
1.527045, 0.6819297, 2.93873, 1, 0, 0, 1, 1,
1.529366, -0.7731962, 3.238721, 1, 0, 0, 1, 1,
1.543734, 2.687822, -1.081206, 1, 0, 0, 1, 1,
1.562535, -1.572465, 2.039825, 1, 0, 0, 1, 1,
1.583071, -0.7973716, 0.8961401, 1, 0, 0, 1, 1,
1.58552, -0.1862741, 3.182242, 0, 0, 0, 1, 1,
1.598216, 0.3212912, 2.552811, 0, 0, 0, 1, 1,
1.604749, 2.553412, -0.1122229, 0, 0, 0, 1, 1,
1.607813, 0.6022264, 1.748251, 0, 0, 0, 1, 1,
1.612915, 1.039132, 1.891465, 0, 0, 0, 1, 1,
1.627031, 0.6537344, 1.439323, 0, 0, 0, 1, 1,
1.642105, -1.099959, 4.136981, 0, 0, 0, 1, 1,
1.649098, 1.705464, 0.2605248, 1, 1, 1, 1, 1,
1.655016, -0.4457051, 0.2481212, 1, 1, 1, 1, 1,
1.673822, -0.256067, 2.937014, 1, 1, 1, 1, 1,
1.677841, 2.392908, -0.9657471, 1, 1, 1, 1, 1,
1.697515, 1.242069, 0.1621307, 1, 1, 1, 1, 1,
1.704678, 1.088, 2.620637, 1, 1, 1, 1, 1,
1.705122, -1.531867, 2.740736, 1, 1, 1, 1, 1,
1.707552, 0.3552491, 1.759534, 1, 1, 1, 1, 1,
1.751798, -1.07499, 2.282232, 1, 1, 1, 1, 1,
1.759251, -2.242511, 1.288252, 1, 1, 1, 1, 1,
1.760658, 0.3706045, 1.934066, 1, 1, 1, 1, 1,
1.776918, -2.295739, 3.892279, 1, 1, 1, 1, 1,
1.788532, 0.155788, 2.696136, 1, 1, 1, 1, 1,
1.831135, -1.752359, 3.826126, 1, 1, 1, 1, 1,
1.832018, 1.091124, 0.1780585, 1, 1, 1, 1, 1,
1.867921, 0.691849, 2.151898, 0, 0, 1, 1, 1,
1.886779, 0.4737044, 2.561995, 1, 0, 0, 1, 1,
1.891106, -0.4168987, 1.477804, 1, 0, 0, 1, 1,
1.972968, -0.351981, 2.57752, 1, 0, 0, 1, 1,
1.977401, -2.170131, 1.453295, 1, 0, 0, 1, 1,
2.025476, -0.4087636, 1.205334, 1, 0, 0, 1, 1,
2.038253, 0.3080283, 0.4586982, 0, 0, 0, 1, 1,
2.045112, -0.3293768, 2.603451, 0, 0, 0, 1, 1,
2.147407, 1.146921, 2.751488, 0, 0, 0, 1, 1,
2.231997, 0.06435596, 3.329725, 0, 0, 0, 1, 1,
2.26013, -0.3709224, 2.525995, 0, 0, 0, 1, 1,
2.26089, -0.1784876, -0.2600609, 0, 0, 0, 1, 1,
2.292121, 0.4922513, 1.03811, 0, 0, 0, 1, 1,
2.450111, -0.5836168, 1.924746, 1, 1, 1, 1, 1,
2.537571, -0.4629975, 1.549032, 1, 1, 1, 1, 1,
2.620956, -0.08116658, 1.516684, 1, 1, 1, 1, 1,
2.65879, -0.7787194, 3.427032, 1, 1, 1, 1, 1,
2.671782, 0.9980257, 0.981212, 1, 1, 1, 1, 1,
3.187985, -1.150276, 1.002569, 1, 1, 1, 1, 1,
3.625216, -0.02752021, 1.513968, 1, 1, 1, 1, 1
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
var radius = 9.438942;
var distance = 33.15388;
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
mvMatrix.translate( -0.3840306, -0.2305851, -0.4282634 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.15388);
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
