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
-3.279946, 0.7442046, -1.336317, 1, 0, 0, 1,
-3.195893, -0.6317296, -2.917859, 1, 0.007843138, 0, 1,
-3.10622, 0.2883911, -1.204898, 1, 0.01176471, 0, 1,
-2.925906, 0.6448875, -0.02976331, 1, 0.01960784, 0, 1,
-2.91488, -0.4160723, -1.292523, 1, 0.02352941, 0, 1,
-2.773404, 0.8930861, -2.102866, 1, 0.03137255, 0, 1,
-2.614655, -0.6393753, -1.922886, 1, 0.03529412, 0, 1,
-2.562743, 0.9573912, -0.8797566, 1, 0.04313726, 0, 1,
-2.490069, 0.2566946, -1.782901, 1, 0.04705882, 0, 1,
-2.468666, -0.5515928, -0.8500043, 1, 0.05490196, 0, 1,
-2.441855, 0.09231651, -1.078913, 1, 0.05882353, 0, 1,
-2.367355, -0.01231359, -1.210345, 1, 0.06666667, 0, 1,
-2.317755, 1.513666, -2.067866, 1, 0.07058824, 0, 1,
-2.302364, -0.32529, -2.040233, 1, 0.07843138, 0, 1,
-2.247233, 1.525298, -1.315132, 1, 0.08235294, 0, 1,
-2.246495, 0.6242279, -0.5424148, 1, 0.09019608, 0, 1,
-2.205459, 0.5551458, -1.882327, 1, 0.09411765, 0, 1,
-2.179243, 1.500826, 0.392684, 1, 0.1019608, 0, 1,
-2.17678, 0.5524755, -1.580505, 1, 0.1098039, 0, 1,
-2.152889, -1.07712, -2.752529, 1, 0.1137255, 0, 1,
-2.109859, 0.6726828, -0.6394932, 1, 0.1215686, 0, 1,
-2.098428, 0.6021404, -1.76627, 1, 0.1254902, 0, 1,
-2.078084, 1.475281, -0.9158038, 1, 0.1333333, 0, 1,
-2.071819, 1.363805, -1.167602, 1, 0.1372549, 0, 1,
-2.067936, 0.2609837, -1.561509, 1, 0.145098, 0, 1,
-2.058463, -1.595261, -3.551294, 1, 0.1490196, 0, 1,
-2.057941, -0.2436441, -2.321583, 1, 0.1568628, 0, 1,
-2.049338, -0.2311726, -0.6404841, 1, 0.1607843, 0, 1,
-2.020236, 0.8328958, -0.9444693, 1, 0.1686275, 0, 1,
-2.010915, 0.1676046, -2.446125, 1, 0.172549, 0, 1,
-2.010671, -1.120258, -1.114626, 1, 0.1803922, 0, 1,
-1.942242, -0.9267538, -2.016971, 1, 0.1843137, 0, 1,
-1.904426, -0.09893981, -0.6663836, 1, 0.1921569, 0, 1,
-1.87553, -1.637352, -2.836627, 1, 0.1960784, 0, 1,
-1.867324, -0.9585616, -1.604775, 1, 0.2039216, 0, 1,
-1.826034, -1.36468, -4.435702, 1, 0.2117647, 0, 1,
-1.821161, 0.4816557, -1.676593, 1, 0.2156863, 0, 1,
-1.81363, -0.5232994, -2.887317, 1, 0.2235294, 0, 1,
-1.766683, -0.2382065, -0.588187, 1, 0.227451, 0, 1,
-1.705875, 0.6118012, -2.226865, 1, 0.2352941, 0, 1,
-1.683207, -0.1612544, -0.6109895, 1, 0.2392157, 0, 1,
-1.67867, -1.043652, -0.9536854, 1, 0.2470588, 0, 1,
-1.670538, -0.07766274, -3.102779, 1, 0.2509804, 0, 1,
-1.668962, 0.7854049, -1.694727, 1, 0.2588235, 0, 1,
-1.663973, -1.801974, -1.415145, 1, 0.2627451, 0, 1,
-1.649113, 1.453468, -0.2545019, 1, 0.2705882, 0, 1,
-1.635645, 0.5966122, -0.9048644, 1, 0.2745098, 0, 1,
-1.594985, -0.5017176, -1.616031, 1, 0.282353, 0, 1,
-1.591023, 0.9139819, -0.8792557, 1, 0.2862745, 0, 1,
-1.585154, 1.897845, 1.217466, 1, 0.2941177, 0, 1,
-1.58433, -0.3827169, -1.40081, 1, 0.3019608, 0, 1,
-1.54536, 0.3371144, -1.392905, 1, 0.3058824, 0, 1,
-1.538588, -1.814707, -2.621418, 1, 0.3137255, 0, 1,
-1.531663, 0.7861028, -0.1732175, 1, 0.3176471, 0, 1,
-1.529976, 1.195475, -2.999521, 1, 0.3254902, 0, 1,
-1.524905, -0.4784007, -1.550498, 1, 0.3294118, 0, 1,
-1.52214, 0.1586702, -1.763746, 1, 0.3372549, 0, 1,
-1.506874, -1.586013, -3.847595, 1, 0.3411765, 0, 1,
-1.504924, 0.06572329, -3.430146, 1, 0.3490196, 0, 1,
-1.501788, 0.5830703, -2.210932, 1, 0.3529412, 0, 1,
-1.480159, -0.5263994, 0.0246208, 1, 0.3607843, 0, 1,
-1.470016, -0.2936086, 0.00905181, 1, 0.3647059, 0, 1,
-1.469677, 0.4613579, -1.194942, 1, 0.372549, 0, 1,
-1.468759, 1.94555, 0.07759486, 1, 0.3764706, 0, 1,
-1.468242, 0.3105478, -3.886853, 1, 0.3843137, 0, 1,
-1.462564, -0.6347895, -1.645877, 1, 0.3882353, 0, 1,
-1.460725, 0.2406106, -0.850314, 1, 0.3960784, 0, 1,
-1.456366, -0.9805432, -0.3280774, 1, 0.4039216, 0, 1,
-1.454578, 1.530462, -2.203038, 1, 0.4078431, 0, 1,
-1.453654, -0.5670667, -3.080561, 1, 0.4156863, 0, 1,
-1.437024, -2.67651, -2.409032, 1, 0.4196078, 0, 1,
-1.430262, -0.3719257, -1.473808, 1, 0.427451, 0, 1,
-1.426487, -0.05195586, -0.206056, 1, 0.4313726, 0, 1,
-1.419218, -0.8074013, -1.955958, 1, 0.4392157, 0, 1,
-1.418178, -1.887777, -3.645645, 1, 0.4431373, 0, 1,
-1.411123, 1.285461, -1.576225, 1, 0.4509804, 0, 1,
-1.403848, 0.5065595, -1.349436, 1, 0.454902, 0, 1,
-1.402863, -0.7622418, -2.48104, 1, 0.4627451, 0, 1,
-1.378425, 0.7346236, -1.0754, 1, 0.4666667, 0, 1,
-1.374913, 0.1500217, -2.002608, 1, 0.4745098, 0, 1,
-1.371052, 0.4758126, -2.229681, 1, 0.4784314, 0, 1,
-1.37104, 1.430564, 0.8544011, 1, 0.4862745, 0, 1,
-1.3693, 1.996237, -0.1298445, 1, 0.4901961, 0, 1,
-1.368891, 1.362145, 0.2801426, 1, 0.4980392, 0, 1,
-1.352658, -1.078265, -2.310134, 1, 0.5058824, 0, 1,
-1.346671, 0.3219888, -2.999331, 1, 0.509804, 0, 1,
-1.34167, 1.082653, -0.3791696, 1, 0.5176471, 0, 1,
-1.340072, -0.5760975, -1.245633, 1, 0.5215687, 0, 1,
-1.339303, -0.9730849, -3.24619, 1, 0.5294118, 0, 1,
-1.337913, 0.1980662, -1.047837, 1, 0.5333334, 0, 1,
-1.335285, 0.6932639, 0.8352399, 1, 0.5411765, 0, 1,
-1.324669, 0.1787132, 1.203648, 1, 0.5450981, 0, 1,
-1.318166, -1.087976, -3.437329, 1, 0.5529412, 0, 1,
-1.315035, -0.6707965, -2.005256, 1, 0.5568628, 0, 1,
-1.313718, -1.705868, -0.916084, 1, 0.5647059, 0, 1,
-1.302003, 1.49165, -1.229617, 1, 0.5686275, 0, 1,
-1.282001, 0.4816566, -0.4427487, 1, 0.5764706, 0, 1,
-1.276703, 0.005556591, -2.305659, 1, 0.5803922, 0, 1,
-1.274688, -1.474217, -2.800333, 1, 0.5882353, 0, 1,
-1.272584, 0.2944286, -0.9411978, 1, 0.5921569, 0, 1,
-1.267627, -0.08591656, -2.391931, 1, 0.6, 0, 1,
-1.258393, -0.2477582, -1.791148, 1, 0.6078432, 0, 1,
-1.25628, -0.2935766, -1.803533, 1, 0.6117647, 0, 1,
-1.25056, -1.627199, -2.743409, 1, 0.6196079, 0, 1,
-1.249945, -0.2471078, -1.600907, 1, 0.6235294, 0, 1,
-1.249934, 0.5051233, 0.4983777, 1, 0.6313726, 0, 1,
-1.249716, 1.339846, -1.741487, 1, 0.6352941, 0, 1,
-1.245726, -2.692897, -2.120079, 1, 0.6431373, 0, 1,
-1.243864, -2.173193, -0.3616824, 1, 0.6470588, 0, 1,
-1.22466, 0.5283309, -0.6146425, 1, 0.654902, 0, 1,
-1.222131, 1.054249, -0.7265742, 1, 0.6588235, 0, 1,
-1.222006, -0.01982227, -1.078426, 1, 0.6666667, 0, 1,
-1.219984, -0.8153288, -2.636692, 1, 0.6705883, 0, 1,
-1.217403, -0.851337, -0.9890197, 1, 0.6784314, 0, 1,
-1.214917, -1.157902, -2.972567, 1, 0.682353, 0, 1,
-1.213876, -1.744425, -3.699641, 1, 0.6901961, 0, 1,
-1.20896, 0.3087606, -0.6913387, 1, 0.6941177, 0, 1,
-1.193118, -0.04087862, -0.939078, 1, 0.7019608, 0, 1,
-1.186484, -0.1156601, -1.644731, 1, 0.7098039, 0, 1,
-1.18627, -1.510486, -1.810624, 1, 0.7137255, 0, 1,
-1.180869, 0.4488063, 0.2837569, 1, 0.7215686, 0, 1,
-1.179369, -0.03662311, -1.294626, 1, 0.7254902, 0, 1,
-1.162153, -0.7281839, -2.767474, 1, 0.7333333, 0, 1,
-1.160508, -0.06168085, -1.614737, 1, 0.7372549, 0, 1,
-1.157942, 0.1538413, -0.9909035, 1, 0.7450981, 0, 1,
-1.154465, 0.1100286, -0.603492, 1, 0.7490196, 0, 1,
-1.153442, -0.6974648, -0.9582491, 1, 0.7568628, 0, 1,
-1.151117, 0.3355155, -1.391298, 1, 0.7607843, 0, 1,
-1.145288, -0.9961877, -3.13997, 1, 0.7686275, 0, 1,
-1.133694, 0.5539782, -1.973638, 1, 0.772549, 0, 1,
-1.121818, 1.326391, 0.5840307, 1, 0.7803922, 0, 1,
-1.12124, 1.462044, -0.8211749, 1, 0.7843137, 0, 1,
-1.120888, -0.8313956, -1.700505, 1, 0.7921569, 0, 1,
-1.111413, -1.0178, 0.6007444, 1, 0.7960784, 0, 1,
-1.107968, 1.177882, -0.8344777, 1, 0.8039216, 0, 1,
-1.097561, -0.6028196, -2.242249, 1, 0.8117647, 0, 1,
-1.089285, 0.5169345, 0.8576873, 1, 0.8156863, 0, 1,
-1.088008, -0.6857493, -2.157108, 1, 0.8235294, 0, 1,
-1.083873, 0.3716059, -1.407069, 1, 0.827451, 0, 1,
-1.078184, -2.154696, -1.657689, 1, 0.8352941, 0, 1,
-1.077916, -0.1123022, -1.136274, 1, 0.8392157, 0, 1,
-1.070138, 0.919721, -1.908452, 1, 0.8470588, 0, 1,
-1.069792, 0.58024, -0.5937358, 1, 0.8509804, 0, 1,
-1.066809, 0.4370247, -1.27951, 1, 0.8588235, 0, 1,
-1.059196, 2.104086, 0.9077912, 1, 0.8627451, 0, 1,
-1.05845, -0.6383011, 0.3135023, 1, 0.8705882, 0, 1,
-1.058023, 0.3334413, 1.295054, 1, 0.8745098, 0, 1,
-1.05646, -0.7454088, -2.928619, 1, 0.8823529, 0, 1,
-1.055481, 0.6899277, -0.2590788, 1, 0.8862745, 0, 1,
-1.055197, 0.01796524, -0.5748945, 1, 0.8941177, 0, 1,
-1.050952, -2.412642, -2.063699, 1, 0.8980392, 0, 1,
-1.047293, 0.9173771, -2.003919, 1, 0.9058824, 0, 1,
-1.042268, -0.1099428, -0.1790237, 1, 0.9137255, 0, 1,
-1.039831, -0.008947969, -1.31638, 1, 0.9176471, 0, 1,
-1.033888, 0.9574764, -1.341835, 1, 0.9254902, 0, 1,
-1.033005, -0.01684321, -1.962903, 1, 0.9294118, 0, 1,
-1.032754, -0.9717049, -2.896743, 1, 0.9372549, 0, 1,
-1.030863, 0.4442235, -4.260942, 1, 0.9411765, 0, 1,
-1.030775, -0.3821255, -1.410805, 1, 0.9490196, 0, 1,
-1.024601, 1.862597, 1.278082, 1, 0.9529412, 0, 1,
-1.013601, 1.820444, 0.5413736, 1, 0.9607843, 0, 1,
-1.008798, -0.1808573, -2.293919, 1, 0.9647059, 0, 1,
-1.004322, -1.778114, -2.329137, 1, 0.972549, 0, 1,
-0.9965852, -0.5623154, -2.116626, 1, 0.9764706, 0, 1,
-0.9956013, 0.6732669, -1.317622, 1, 0.9843137, 0, 1,
-0.9942693, -0.8616857, -3.006773, 1, 0.9882353, 0, 1,
-0.9941765, -1.796997, -5.380382, 1, 0.9960784, 0, 1,
-0.9865248, 0.8287703, -1.655236, 0.9960784, 1, 0, 1,
-0.9732857, -0.535909, -1.420562, 0.9921569, 1, 0, 1,
-0.9732146, 0.243036, -0.004034191, 0.9843137, 1, 0, 1,
-0.9703587, -1.287313, -2.93677, 0.9803922, 1, 0, 1,
-0.9699873, 0.2267221, -1.575184, 0.972549, 1, 0, 1,
-0.9656215, 0.1010111, -2.633384, 0.9686275, 1, 0, 1,
-0.9530089, 0.5408037, 0.3209864, 0.9607843, 1, 0, 1,
-0.9529419, 1.049493, -2.408652, 0.9568627, 1, 0, 1,
-0.9513198, -1.440926, -2.574317, 0.9490196, 1, 0, 1,
-0.9480695, 0.1086443, -3.649489, 0.945098, 1, 0, 1,
-0.9435058, -0.2614806, -0.8814791, 0.9372549, 1, 0, 1,
-0.9345241, 0.6028413, -1.379857, 0.9333333, 1, 0, 1,
-0.9326504, 1.822398, 0.4076131, 0.9254902, 1, 0, 1,
-0.9310362, -0.3291589, -2.202842, 0.9215686, 1, 0, 1,
-0.9295409, 1.092143, 0.6691885, 0.9137255, 1, 0, 1,
-0.9248959, -1.630453, -1.305624, 0.9098039, 1, 0, 1,
-0.9179429, 1.310832, -1.25932, 0.9019608, 1, 0, 1,
-0.9175214, -2.229036, -2.608105, 0.8941177, 1, 0, 1,
-0.9149163, -0.1422426, -2.567737, 0.8901961, 1, 0, 1,
-0.9111478, -0.03332938, -1.759913, 0.8823529, 1, 0, 1,
-0.9084811, -0.553421, -1.680316, 0.8784314, 1, 0, 1,
-0.9069675, -0.7723479, -1.252728, 0.8705882, 1, 0, 1,
-0.9038562, 1.069576, -0.2115614, 0.8666667, 1, 0, 1,
-0.9011257, 0.2054519, 0.9234524, 0.8588235, 1, 0, 1,
-0.8997855, 0.3815616, -0.3743342, 0.854902, 1, 0, 1,
-0.8995577, 0.2903117, -1.662375, 0.8470588, 1, 0, 1,
-0.8925847, 0.2126623, -1.406304, 0.8431373, 1, 0, 1,
-0.8905833, -0.6070404, -0.5711932, 0.8352941, 1, 0, 1,
-0.889932, -0.5923864, -2.183126, 0.8313726, 1, 0, 1,
-0.8856081, 2.459919, -0.7222728, 0.8235294, 1, 0, 1,
-0.8842249, 0.243144, -1.973805, 0.8196079, 1, 0, 1,
-0.8839775, -1.790184, -3.323338, 0.8117647, 1, 0, 1,
-0.8794523, -0.8404774, -1.257157, 0.8078431, 1, 0, 1,
-0.8781544, 0.04428968, -0.4240878, 0.8, 1, 0, 1,
-0.8749414, -0.323062, -1.94985, 0.7921569, 1, 0, 1,
-0.8738486, 0.5186648, 1.25063, 0.7882353, 1, 0, 1,
-0.8703734, -1.466724, -0.7401708, 0.7803922, 1, 0, 1,
-0.8685448, 0.1090053, -2.86167, 0.7764706, 1, 0, 1,
-0.8668244, 0.7226875, -1.49401, 0.7686275, 1, 0, 1,
-0.8567745, 1.220925, -0.2935568, 0.7647059, 1, 0, 1,
-0.8545119, -0.6893757, -1.326379, 0.7568628, 1, 0, 1,
-0.8470715, 0.5628433, 0.2619941, 0.7529412, 1, 0, 1,
-0.8448257, 0.1367385, -2.004837, 0.7450981, 1, 0, 1,
-0.8390779, 0.4892927, 0.05515721, 0.7411765, 1, 0, 1,
-0.8375251, 1.267228, -0.3364919, 0.7333333, 1, 0, 1,
-0.8325429, 1.877612, -0.7880175, 0.7294118, 1, 0, 1,
-0.8294789, 0.2585307, 0.694702, 0.7215686, 1, 0, 1,
-0.8229166, -0.5711797, -1.238168, 0.7176471, 1, 0, 1,
-0.8202482, 0.3298973, -1.711408, 0.7098039, 1, 0, 1,
-0.8146833, -1.085749, -1.821035, 0.7058824, 1, 0, 1,
-0.8127035, -1.234303, -1.140078, 0.6980392, 1, 0, 1,
-0.8081779, -1.851636, -3.607094, 0.6901961, 1, 0, 1,
-0.8049454, 1.09014, 0.7622147, 0.6862745, 1, 0, 1,
-0.8020737, -0.3981892, -2.718531, 0.6784314, 1, 0, 1,
-0.8018029, -0.1820018, -1.500816, 0.6745098, 1, 0, 1,
-0.8011253, -0.1342743, -3.206542, 0.6666667, 1, 0, 1,
-0.8006356, 1.490262, -0.6441778, 0.6627451, 1, 0, 1,
-0.7967804, -0.5984095, -0.4383821, 0.654902, 1, 0, 1,
-0.794738, 0.2467585, -3.886814, 0.6509804, 1, 0, 1,
-0.7925244, 1.14706, -1.28333, 0.6431373, 1, 0, 1,
-0.7923486, -1.128366, -1.679931, 0.6392157, 1, 0, 1,
-0.786124, -1.322338, -2.169925, 0.6313726, 1, 0, 1,
-0.7853745, 0.5211485, 0.1638546, 0.627451, 1, 0, 1,
-0.7843437, 0.08406386, -0.9218703, 0.6196079, 1, 0, 1,
-0.7831287, -0.1722584, -1.386796, 0.6156863, 1, 0, 1,
-0.7794052, -0.6447018, -2.029562, 0.6078432, 1, 0, 1,
-0.7757614, -0.5454499, -1.305941, 0.6039216, 1, 0, 1,
-0.7740109, -0.7486333, -2.505782, 0.5960785, 1, 0, 1,
-0.77336, -0.2966499, -2.935586, 0.5882353, 1, 0, 1,
-0.7707489, 0.1350181, -1.601741, 0.5843138, 1, 0, 1,
-0.7565367, 0.2773645, -2.060447, 0.5764706, 1, 0, 1,
-0.7500503, 0.3299105, -0.9190785, 0.572549, 1, 0, 1,
-0.7500394, -0.9363979, -3.257646, 0.5647059, 1, 0, 1,
-0.74949, -1.8492, -4.443012, 0.5607843, 1, 0, 1,
-0.7481622, -1.032958, -2.590968, 0.5529412, 1, 0, 1,
-0.7433346, -0.8583997, -2.282324, 0.5490196, 1, 0, 1,
-0.7394648, -0.4043107, -3.830089, 0.5411765, 1, 0, 1,
-0.7386144, 2.15632, -1.038802, 0.5372549, 1, 0, 1,
-0.7374051, -0.001798862, -2.699605, 0.5294118, 1, 0, 1,
-0.7326896, 1.308868, -1.188794, 0.5254902, 1, 0, 1,
-0.7302188, 0.5290549, 1.287178, 0.5176471, 1, 0, 1,
-0.7280709, -0.4571947, -2.387449, 0.5137255, 1, 0, 1,
-0.7268967, 1.547359, -1.266095, 0.5058824, 1, 0, 1,
-0.726544, 0.4670169, -1.191345, 0.5019608, 1, 0, 1,
-0.7233717, 0.7883247, 0.5208933, 0.4941176, 1, 0, 1,
-0.7230572, -0.6885188, -1.768051, 0.4862745, 1, 0, 1,
-0.7227291, -1.122191, -2.684085, 0.4823529, 1, 0, 1,
-0.7131606, -0.3425633, -1.276823, 0.4745098, 1, 0, 1,
-0.7100625, -1.194047, -2.57427, 0.4705882, 1, 0, 1,
-0.7065696, 0.4610551, -1.736299, 0.4627451, 1, 0, 1,
-0.7024822, -2.200019, -2.56042, 0.4588235, 1, 0, 1,
-0.6972268, 0.1499793, -0.7819332, 0.4509804, 1, 0, 1,
-0.6937757, -0.7020072, -3.330472, 0.4470588, 1, 0, 1,
-0.690751, 0.794098, -1.91677, 0.4392157, 1, 0, 1,
-0.6885262, 0.8891959, -0.6592614, 0.4352941, 1, 0, 1,
-0.6819362, -1.228225, -3.730776, 0.427451, 1, 0, 1,
-0.6796178, -0.6061986, -1.504961, 0.4235294, 1, 0, 1,
-0.6783509, 1.273936, -1.530281, 0.4156863, 1, 0, 1,
-0.6778641, -0.3987598, -1.637912, 0.4117647, 1, 0, 1,
-0.668152, -0.2226831, -2.25025, 0.4039216, 1, 0, 1,
-0.6662239, 0.04187155, -1.319597, 0.3960784, 1, 0, 1,
-0.6608232, 0.006322613, -0.3295924, 0.3921569, 1, 0, 1,
-0.6596925, 0.05701775, -1.666686, 0.3843137, 1, 0, 1,
-0.6531464, -0.1745044, -1.609664, 0.3803922, 1, 0, 1,
-0.6526252, -0.6906372, -1.894783, 0.372549, 1, 0, 1,
-0.6496702, -0.5489141, -1.835025, 0.3686275, 1, 0, 1,
-0.6470097, -0.9100684, -4.010881, 0.3607843, 1, 0, 1,
-0.6428991, -0.8594474, -2.085629, 0.3568628, 1, 0, 1,
-0.624574, -0.7404918, -3.199028, 0.3490196, 1, 0, 1,
-0.6239034, 0.8438997, -1.789602, 0.345098, 1, 0, 1,
-0.6196638, 1.273584, -2.984257, 0.3372549, 1, 0, 1,
-0.6191437, 0.1881657, -1.604751, 0.3333333, 1, 0, 1,
-0.6156368, -0.3425368, -1.207127, 0.3254902, 1, 0, 1,
-0.6127202, -1.431539, -1.694578, 0.3215686, 1, 0, 1,
-0.6065972, -0.05770708, -2.052034, 0.3137255, 1, 0, 1,
-0.6043919, 0.8507244, -0.7056513, 0.3098039, 1, 0, 1,
-0.6004851, 0.6899733, -1.327684, 0.3019608, 1, 0, 1,
-0.5936812, -1.160181, -3.252589, 0.2941177, 1, 0, 1,
-0.5879438, 0.274232, -1.627115, 0.2901961, 1, 0, 1,
-0.5856236, 0.4249344, -2.516395, 0.282353, 1, 0, 1,
-0.5828723, -1.01438, -4.198864, 0.2784314, 1, 0, 1,
-0.5809378, 0.8833109, -1.375721, 0.2705882, 1, 0, 1,
-0.5793445, 1.265275, 0.1294971, 0.2666667, 1, 0, 1,
-0.5677296, 1.415222, -0.04896955, 0.2588235, 1, 0, 1,
-0.5663887, -0.02703544, 0.5073118, 0.254902, 1, 0, 1,
-0.5650887, -0.02586485, -2.985442, 0.2470588, 1, 0, 1,
-0.5630806, 1.184503, -1.515742, 0.2431373, 1, 0, 1,
-0.5613083, 0.7189429, -0.8616818, 0.2352941, 1, 0, 1,
-0.5605456, -0.4995222, -3.291874, 0.2313726, 1, 0, 1,
-0.5595971, -0.7276622, -1.691102, 0.2235294, 1, 0, 1,
-0.5581003, 0.2981339, -0.147319, 0.2196078, 1, 0, 1,
-0.557682, 0.7464433, -0.8203406, 0.2117647, 1, 0, 1,
-0.5538508, -1.015544, -3.430764, 0.2078431, 1, 0, 1,
-0.5531666, 0.6089427, -0.6813474, 0.2, 1, 0, 1,
-0.5518236, -0.5252151, -3.683056, 0.1921569, 1, 0, 1,
-0.5486666, 1.330097, -0.5522888, 0.1882353, 1, 0, 1,
-0.5460898, -1.212078, -3.26216, 0.1803922, 1, 0, 1,
-0.5353031, -0.8031562, -1.123491, 0.1764706, 1, 0, 1,
-0.5343515, 1.482874, 1.124769, 0.1686275, 1, 0, 1,
-0.5342888, 1.352376, 0.8920701, 0.1647059, 1, 0, 1,
-0.5302905, 0.6033676, -0.3640476, 0.1568628, 1, 0, 1,
-0.5301805, -1.909855, -1.251449, 0.1529412, 1, 0, 1,
-0.5301214, 1.351032, -1.400022, 0.145098, 1, 0, 1,
-0.5293303, -0.3135953, -2.157863, 0.1411765, 1, 0, 1,
-0.5201262, -0.2933694, -1.845276, 0.1333333, 1, 0, 1,
-0.5088458, -1.23994, -4.905106, 0.1294118, 1, 0, 1,
-0.507199, -1.233813, -1.675738, 0.1215686, 1, 0, 1,
-0.506428, 0.4092315, -0.6441286, 0.1176471, 1, 0, 1,
-0.5053059, -0.0729024, -0.8415082, 0.1098039, 1, 0, 1,
-0.50495, -0.1333541, -1.586284, 0.1058824, 1, 0, 1,
-0.5028483, -0.6822416, -2.871273, 0.09803922, 1, 0, 1,
-0.5027519, -0.2942356, -2.964068, 0.09019608, 1, 0, 1,
-0.4903829, -1.543877, -3.41898, 0.08627451, 1, 0, 1,
-0.487374, 0.1860652, -0.8966504, 0.07843138, 1, 0, 1,
-0.4868768, 1.060932, 0.170991, 0.07450981, 1, 0, 1,
-0.485029, -1.328031, -1.992577, 0.06666667, 1, 0, 1,
-0.4669816, -0.4416823, -0.5465877, 0.0627451, 1, 0, 1,
-0.4655322, 1.035907, -0.2264604, 0.05490196, 1, 0, 1,
-0.4637898, 0.4556177, -1.153807, 0.05098039, 1, 0, 1,
-0.4634058, -0.2095664, -2.468324, 0.04313726, 1, 0, 1,
-0.4604737, -1.668591, -3.752443, 0.03921569, 1, 0, 1,
-0.4538503, 0.5702134, -0.9661555, 0.03137255, 1, 0, 1,
-0.4532911, -0.09410119, -2.749899, 0.02745098, 1, 0, 1,
-0.450116, -0.7886907, -3.01795, 0.01960784, 1, 0, 1,
-0.4493971, 0.4330635, -0.80734, 0.01568628, 1, 0, 1,
-0.4479544, -0.248854, -2.867607, 0.007843138, 1, 0, 1,
-0.4422277, 0.2219427, -1.334482, 0.003921569, 1, 0, 1,
-0.4407157, 1.011944, -0.6982579, 0, 1, 0.003921569, 1,
-0.4394574, 2.898617, 1.525526, 0, 1, 0.01176471, 1,
-0.4384277, 0.1330407, -1.617545, 0, 1, 0.01568628, 1,
-0.4362705, -0.5857095, -3.860121, 0, 1, 0.02352941, 1,
-0.4344509, 0.2400903, -2.468493, 0, 1, 0.02745098, 1,
-0.4331396, -0.1363849, 0.1113812, 0, 1, 0.03529412, 1,
-0.429618, -0.4711783, -2.54279, 0, 1, 0.03921569, 1,
-0.4295638, -0.8194954, -2.535776, 0, 1, 0.04705882, 1,
-0.4252704, 1.536355, -0.3882372, 0, 1, 0.05098039, 1,
-0.4170001, 0.8092823, -0.3932891, 0, 1, 0.05882353, 1,
-0.4157837, 2.417305, -0.5855716, 0, 1, 0.0627451, 1,
-0.4104924, 0.1132361, -0.3911058, 0, 1, 0.07058824, 1,
-0.4086095, 2.309908, 0.7052861, 0, 1, 0.07450981, 1,
-0.4012783, -1.022359, -3.159416, 0, 1, 0.08235294, 1,
-0.3993441, 2.842458, 0.4803538, 0, 1, 0.08627451, 1,
-0.3989912, -0.6076753, -2.876232, 0, 1, 0.09411765, 1,
-0.3931752, 0.3601563, -0.8650781, 0, 1, 0.1019608, 1,
-0.3931653, -0.7368436, -0.9566402, 0, 1, 0.1058824, 1,
-0.3897314, -1.336591, -5.40534, 0, 1, 0.1137255, 1,
-0.3890218, 0.1403442, -0.6311432, 0, 1, 0.1176471, 1,
-0.3883116, -0.9494322, -1.764833, 0, 1, 0.1254902, 1,
-0.3863631, 0.3338771, -0.05614915, 0, 1, 0.1294118, 1,
-0.3863561, 1.420923, -0.7153294, 0, 1, 0.1372549, 1,
-0.380124, -0.4381342, -1.685025, 0, 1, 0.1411765, 1,
-0.3794208, -0.7149799, -2.338643, 0, 1, 0.1490196, 1,
-0.3781028, -0.4628128, -2.055406, 0, 1, 0.1529412, 1,
-0.3777366, 0.3428737, 0.2399004, 0, 1, 0.1607843, 1,
-0.3776466, 1.911051, -0.8991432, 0, 1, 0.1647059, 1,
-0.3706973, -2.048576, -2.642397, 0, 1, 0.172549, 1,
-0.368835, 0.152016, -1.26351, 0, 1, 0.1764706, 1,
-0.3676541, -0.3193505, -2.708385, 0, 1, 0.1843137, 1,
-0.3663996, -0.2835493, -1.843195, 0, 1, 0.1882353, 1,
-0.3659103, 0.3672843, -0.4388289, 0, 1, 0.1960784, 1,
-0.3615592, -0.01434192, -1.378942, 0, 1, 0.2039216, 1,
-0.3567335, 0.9893315, -0.6390682, 0, 1, 0.2078431, 1,
-0.3537333, 0.9979603, 0.2672708, 0, 1, 0.2156863, 1,
-0.3526023, 1.831703, 0.2468765, 0, 1, 0.2196078, 1,
-0.3485901, -1.038411, -2.31955, 0, 1, 0.227451, 1,
-0.3450389, -0.1295246, -2.361558, 0, 1, 0.2313726, 1,
-0.3443944, 0.1496056, -1.888094, 0, 1, 0.2392157, 1,
-0.3406924, -1.904393, -2.57495, 0, 1, 0.2431373, 1,
-0.335929, -0.5175203, -1.49445, 0, 1, 0.2509804, 1,
-0.3350381, -0.9740087, -3.992527, 0, 1, 0.254902, 1,
-0.3303027, -1.711001, -3.611577, 0, 1, 0.2627451, 1,
-0.3267212, -0.5529822, -3.173147, 0, 1, 0.2666667, 1,
-0.3259944, 0.4254603, -2.678613, 0, 1, 0.2745098, 1,
-0.319027, -0.847824, -3.881318, 0, 1, 0.2784314, 1,
-0.3172386, -0.07723898, -1.357398, 0, 1, 0.2862745, 1,
-0.3120878, -0.8848042, -2.765435, 0, 1, 0.2901961, 1,
-0.3090943, 0.4192316, -0.6143034, 0, 1, 0.2980392, 1,
-0.3080178, 1.254895, 0.8691547, 0, 1, 0.3058824, 1,
-0.3058034, 0.05624702, -1.545689, 0, 1, 0.3098039, 1,
-0.3038361, -1.137536, -3.428396, 0, 1, 0.3176471, 1,
-0.3030741, -0.7934863, -1.463653, 0, 1, 0.3215686, 1,
-0.3029437, 0.07409172, -2.876876, 0, 1, 0.3294118, 1,
-0.3028129, 0.1564678, -0.379033, 0, 1, 0.3333333, 1,
-0.3002361, 1.297987, 0.7266793, 0, 1, 0.3411765, 1,
-0.3000561, 0.6977882, -0.2877056, 0, 1, 0.345098, 1,
-0.2944727, 1.505705, 0.3558839, 0, 1, 0.3529412, 1,
-0.2941499, 1.865215, 0.3116341, 0, 1, 0.3568628, 1,
-0.2908198, -2.69785, -3.690257, 0, 1, 0.3647059, 1,
-0.2871717, 1.60519, -0.3971134, 0, 1, 0.3686275, 1,
-0.2868573, -0.088849, -0.3393689, 0, 1, 0.3764706, 1,
-0.2868228, -1.103952, -3.638496, 0, 1, 0.3803922, 1,
-0.2849372, -0.01103661, -1.76709, 0, 1, 0.3882353, 1,
-0.2841927, 0.8485632, -0.8056386, 0, 1, 0.3921569, 1,
-0.2772672, 0.9399341, -0.5685574, 0, 1, 0.4, 1,
-0.2760142, -0.01713349, -0.517516, 0, 1, 0.4078431, 1,
-0.2756834, -0.7534308, -3.672051, 0, 1, 0.4117647, 1,
-0.2737404, 0.720629, 0.6241141, 0, 1, 0.4196078, 1,
-0.2662529, -0.9561337, -3.589948, 0, 1, 0.4235294, 1,
-0.2654414, 1.833992, -0.6661173, 0, 1, 0.4313726, 1,
-0.2576398, 1.299574, 0.1932942, 0, 1, 0.4352941, 1,
-0.2550444, 0.5902458, 0.1330394, 0, 1, 0.4431373, 1,
-0.2548754, -0.1548929, -1.107695, 0, 1, 0.4470588, 1,
-0.2548542, -0.9438659, -2.842625, 0, 1, 0.454902, 1,
-0.2531634, -1.013746, -3.950849, 0, 1, 0.4588235, 1,
-0.2491098, 2.807215, 0.1388677, 0, 1, 0.4666667, 1,
-0.2483485, -0.4832998, -2.858327, 0, 1, 0.4705882, 1,
-0.2383686, 0.2266418, -2.66956, 0, 1, 0.4784314, 1,
-0.2371864, 0.4530556, -0.5124163, 0, 1, 0.4823529, 1,
-0.2362708, 0.2532333, 0.1328236, 0, 1, 0.4901961, 1,
-0.2225291, 0.1550143, -1.703634, 0, 1, 0.4941176, 1,
-0.2194126, -0.6979141, -3.455715, 0, 1, 0.5019608, 1,
-0.214393, -1.12578, -4.384725, 0, 1, 0.509804, 1,
-0.2133815, 2.543295, -0.4023405, 0, 1, 0.5137255, 1,
-0.2078873, -0.7594387, -2.328422, 0, 1, 0.5215687, 1,
-0.2077648, 0.8756459, 0.07820553, 0, 1, 0.5254902, 1,
-0.2043065, -0.7414778, -2.172123, 0, 1, 0.5333334, 1,
-0.1986035, -1.008292, -2.825409, 0, 1, 0.5372549, 1,
-0.1960932, 0.4772731, 0.2194058, 0, 1, 0.5450981, 1,
-0.1915677, 0.4488913, -1.246675, 0, 1, 0.5490196, 1,
-0.1910599, -0.09215803, -2.599641, 0, 1, 0.5568628, 1,
-0.1896773, -0.2551524, -1.968083, 0, 1, 0.5607843, 1,
-0.1793988, -0.4953442, -2.830729, 0, 1, 0.5686275, 1,
-0.1740571, 0.2570488, -0.05196625, 0, 1, 0.572549, 1,
-0.1715954, 0.9838707, 0.5305625, 0, 1, 0.5803922, 1,
-0.1693909, 0.5559884, -0.5012988, 0, 1, 0.5843138, 1,
-0.1688092, -1.31083, -3.390237, 0, 1, 0.5921569, 1,
-0.1656637, 0.4540515, -0.09721556, 0, 1, 0.5960785, 1,
-0.163486, -0.9443793, -1.690115, 0, 1, 0.6039216, 1,
-0.1627369, -0.6984702, -1.109108, 0, 1, 0.6117647, 1,
-0.1625026, 0.1091201, 0.652207, 0, 1, 0.6156863, 1,
-0.1617528, 0.7350633, -0.1144808, 0, 1, 0.6235294, 1,
-0.1598799, 2.282542, 0.842586, 0, 1, 0.627451, 1,
-0.1596065, 0.2826466, -1.849706, 0, 1, 0.6352941, 1,
-0.1590247, -0.4682046, -3.189618, 0, 1, 0.6392157, 1,
-0.1573366, 0.4421125, -0.7151368, 0, 1, 0.6470588, 1,
-0.1566633, 0.01298814, -1.779569, 0, 1, 0.6509804, 1,
-0.1528067, -0.7907819, -2.8587, 0, 1, 0.6588235, 1,
-0.1398849, 1.254187, -0.3008568, 0, 1, 0.6627451, 1,
-0.1367847, 0.4844391, -0.4994763, 0, 1, 0.6705883, 1,
-0.1348705, -1.019846, -1.648995, 0, 1, 0.6745098, 1,
-0.1179709, 0.2207449, 1.202335, 0, 1, 0.682353, 1,
-0.1135552, 2.236684, 1.308074, 0, 1, 0.6862745, 1,
-0.1102406, 0.4699002, -0.3789968, 0, 1, 0.6941177, 1,
-0.1099015, 0.608519, 0.06381534, 0, 1, 0.7019608, 1,
-0.1093667, 0.5591477, 0.6475351, 0, 1, 0.7058824, 1,
-0.1071817, 0.855544, -0.21627, 0, 1, 0.7137255, 1,
-0.104079, 0.5281894, -0.2017036, 0, 1, 0.7176471, 1,
-0.09658292, 0.2971449, -1.403724, 0, 1, 0.7254902, 1,
-0.0938345, -0.767466, -2.387793, 0, 1, 0.7294118, 1,
-0.08836605, 1.157082, 0.2140751, 0, 1, 0.7372549, 1,
-0.08394529, -0.1052397, -2.857081, 0, 1, 0.7411765, 1,
-0.08391123, -0.4131513, -1.751701, 0, 1, 0.7490196, 1,
-0.08279925, -0.3500102, -3.878942, 0, 1, 0.7529412, 1,
-0.07927941, -0.07585172, -0.5946782, 0, 1, 0.7607843, 1,
-0.07744396, 0.1575241, -0.6386338, 0, 1, 0.7647059, 1,
-0.07613135, 0.02585609, -1.323573, 0, 1, 0.772549, 1,
-0.07032013, 0.564271, -1.01494, 0, 1, 0.7764706, 1,
-0.06991368, 0.6306323, -0.9822185, 0, 1, 0.7843137, 1,
-0.06806266, 0.2294871, 0.4021278, 0, 1, 0.7882353, 1,
-0.06664141, 0.6377287, 0.2644613, 0, 1, 0.7960784, 1,
-0.06573723, 0.2101956, -0.8176008, 0, 1, 0.8039216, 1,
-0.06472567, -0.4545017, -1.821885, 0, 1, 0.8078431, 1,
-0.06384059, -0.7887058, -2.966424, 0, 1, 0.8156863, 1,
-0.05909335, 1.010599, -0.1349759, 0, 1, 0.8196079, 1,
-0.05903136, 0.8976049, 0.2490451, 0, 1, 0.827451, 1,
-0.0582572, 2.58473, 1.548, 0, 1, 0.8313726, 1,
-0.05636242, 0.67703, -0.7752306, 0, 1, 0.8392157, 1,
-0.0537024, 0.3798617, -0.6663643, 0, 1, 0.8431373, 1,
-0.0479456, 0.7597397, 0.7341694, 0, 1, 0.8509804, 1,
-0.04201252, -1.283977, -4.270728, 0, 1, 0.854902, 1,
-0.04145517, -0.09929641, -1.858815, 0, 1, 0.8627451, 1,
-0.04026848, -0.2594719, -3.407155, 0, 1, 0.8666667, 1,
-0.03825817, 0.7438391, 1.129855, 0, 1, 0.8745098, 1,
-0.03505122, 0.6654416, -0.5620789, 0, 1, 0.8784314, 1,
-0.03223606, -0.8713252, -5.603323, 0, 1, 0.8862745, 1,
-0.03019868, -0.9072343, -1.985058, 0, 1, 0.8901961, 1,
-0.02334837, -0.4400201, -3.921006, 0, 1, 0.8980392, 1,
-0.02047915, -0.9065982, -2.879878, 0, 1, 0.9058824, 1,
-0.0171326, -0.4515483, -4.018377, 0, 1, 0.9098039, 1,
-0.01514788, 0.7033424, 0.6618727, 0, 1, 0.9176471, 1,
-0.01130512, -0.4674552, -2.302754, 0, 1, 0.9215686, 1,
-0.008193438, -0.0666139, -1.382053, 0, 1, 0.9294118, 1,
-0.002765933, 0.1672494, 0.918015, 0, 1, 0.9333333, 1,
-0.002309399, 0.3090109, -0.2904514, 0, 1, 0.9411765, 1,
0.002711586, 0.5057873, 0.7509967, 0, 1, 0.945098, 1,
0.003041246, -0.2873839, 5.005795, 0, 1, 0.9529412, 1,
0.003585989, 2.180243, -0.1271335, 0, 1, 0.9568627, 1,
0.004000951, -0.3378245, 2.650074, 0, 1, 0.9647059, 1,
0.01083764, -0.7443119, 3.261898, 0, 1, 0.9686275, 1,
0.01612589, -0.4074226, 3.756624, 0, 1, 0.9764706, 1,
0.01800955, -0.0526645, 0.625255, 0, 1, 0.9803922, 1,
0.01878992, -1.028566, 4.517433, 0, 1, 0.9882353, 1,
0.02541075, -0.4830284, 3.150886, 0, 1, 0.9921569, 1,
0.02582005, -0.08923049, 2.078084, 0, 1, 1, 1,
0.02836851, -0.6301962, 4.922565, 0, 0.9921569, 1, 1,
0.03214684, 0.4013306, 1.742024, 0, 0.9882353, 1, 1,
0.03381212, -0.5856112, 4.625538, 0, 0.9803922, 1, 1,
0.034771, 0.5915204, 1.155691, 0, 0.9764706, 1, 1,
0.03539037, 2.286228, -1.621716, 0, 0.9686275, 1, 1,
0.03549907, -0.5785241, 2.890997, 0, 0.9647059, 1, 1,
0.03563824, 0.7562987, 0.4799243, 0, 0.9568627, 1, 1,
0.03591119, 0.6946549, 0.3448221, 0, 0.9529412, 1, 1,
0.03825072, -1.681448, 4.007377, 0, 0.945098, 1, 1,
0.03862974, -0.6512823, 2.53611, 0, 0.9411765, 1, 1,
0.03916804, -0.9649576, 3.47841, 0, 0.9333333, 1, 1,
0.04230528, 1.085848, -0.2151849, 0, 0.9294118, 1, 1,
0.04586054, 0.6301748, -0.3317844, 0, 0.9215686, 1, 1,
0.04664653, -0.1176754, 2.518433, 0, 0.9176471, 1, 1,
0.04722616, 1.333654, -0.4138002, 0, 0.9098039, 1, 1,
0.05033986, -0.09784198, 1.564551, 0, 0.9058824, 1, 1,
0.0562189, -0.4192083, 3.540146, 0, 0.8980392, 1, 1,
0.05814283, 1.205553, -0.6275467, 0, 0.8901961, 1, 1,
0.06037313, 1.179388, 0.6120831, 0, 0.8862745, 1, 1,
0.06179743, 0.5156331, 0.5578122, 0, 0.8784314, 1, 1,
0.0648162, -0.437186, 3.044282, 0, 0.8745098, 1, 1,
0.06507029, -0.1947961, 0.7239578, 0, 0.8666667, 1, 1,
0.06667739, 0.6402375, -0.2613739, 0, 0.8627451, 1, 1,
0.06774032, 1.897061, -0.9757059, 0, 0.854902, 1, 1,
0.07548714, -0.4770741, 2.928337, 0, 0.8509804, 1, 1,
0.07793225, 0.6771873, 0.5976238, 0, 0.8431373, 1, 1,
0.08040901, -0.4287839, 0.4095267, 0, 0.8392157, 1, 1,
0.08315631, -1.59862, 4.062694, 0, 0.8313726, 1, 1,
0.08429362, -0.3696911, 3.69871, 0, 0.827451, 1, 1,
0.08632832, -0.7979274, 2.642113, 0, 0.8196079, 1, 1,
0.0864878, 0.4337467, 0.04219047, 0, 0.8156863, 1, 1,
0.08952224, 0.01011014, 2.593922, 0, 0.8078431, 1, 1,
0.08992673, -0.526526, 3.854475, 0, 0.8039216, 1, 1,
0.09006616, 0.03480101, 0.3875801, 0, 0.7960784, 1, 1,
0.09088247, -0.6230667, 3.840849, 0, 0.7882353, 1, 1,
0.0922571, -0.3395521, 3.560482, 0, 0.7843137, 1, 1,
0.09419177, -1.900529, 3.990874, 0, 0.7764706, 1, 1,
0.0979633, 1.123081, -1.176792, 0, 0.772549, 1, 1,
0.09850999, -1.106282, 3.268179, 0, 0.7647059, 1, 1,
0.09944598, -0.8702188, 3.009076, 0, 0.7607843, 1, 1,
0.1035376, 0.6533257, 1.292847, 0, 0.7529412, 1, 1,
0.1035742, 0.5215741, 0.7799262, 0, 0.7490196, 1, 1,
0.107203, 1.540291, -0.2368844, 0, 0.7411765, 1, 1,
0.1083662, -0.08860573, 1.950661, 0, 0.7372549, 1, 1,
0.1088152, -0.02560039, 1.667828, 0, 0.7294118, 1, 1,
0.1092828, -1.616338, 2.858197, 0, 0.7254902, 1, 1,
0.1093292, 2.302891, 1.448427, 0, 0.7176471, 1, 1,
0.1135144, -0.5312301, 2.413384, 0, 0.7137255, 1, 1,
0.1168059, 1.031539, 1.732881, 0, 0.7058824, 1, 1,
0.1182688, -0.4328622, 1.342588, 0, 0.6980392, 1, 1,
0.1257641, -0.9705315, 2.371011, 0, 0.6941177, 1, 1,
0.1296961, 0.008676649, 2.088702, 0, 0.6862745, 1, 1,
0.1297485, 2.181715, 0.5012482, 0, 0.682353, 1, 1,
0.1315431, -0.5426125, 6.238466, 0, 0.6745098, 1, 1,
0.1322618, 1.300581, -1.478894, 0, 0.6705883, 1, 1,
0.1323648, -0.5872992, 3.528187, 0, 0.6627451, 1, 1,
0.1331551, 0.1512619, 1.601947, 0, 0.6588235, 1, 1,
0.1342359, 1.097777, 1.45611, 0, 0.6509804, 1, 1,
0.1381586, -2.22595, 2.936731, 0, 0.6470588, 1, 1,
0.1431611, -0.8254932, 4.699284, 0, 0.6392157, 1, 1,
0.1448324, 0.2695545, 0.02797427, 0, 0.6352941, 1, 1,
0.146639, 0.921427, 0.3016953, 0, 0.627451, 1, 1,
0.1483104, 0.6029724, -0.6369743, 0, 0.6235294, 1, 1,
0.1522012, -1.675637, 3.601972, 0, 0.6156863, 1, 1,
0.155311, 0.1972684, 1.221973, 0, 0.6117647, 1, 1,
0.1571063, -0.2424705, 0.8506417, 0, 0.6039216, 1, 1,
0.1573901, -1.322308, 2.413248, 0, 0.5960785, 1, 1,
0.1645148, 0.6768557, -1.060176, 0, 0.5921569, 1, 1,
0.1670657, 0.2858903, 0.9053997, 0, 0.5843138, 1, 1,
0.1673988, 1.710472, 1.273735, 0, 0.5803922, 1, 1,
0.1696886, 0.9919893, 0.7405772, 0, 0.572549, 1, 1,
0.1739094, -0.302758, 4.572875, 0, 0.5686275, 1, 1,
0.1779716, -1.142502, 1.341367, 0, 0.5607843, 1, 1,
0.1780237, -0.4310303, 3.67412, 0, 0.5568628, 1, 1,
0.1791136, -1.950288, 3.159876, 0, 0.5490196, 1, 1,
0.1804067, -0.1193834, 2.046887, 0, 0.5450981, 1, 1,
0.1835992, 0.9037096, -0.112293, 0, 0.5372549, 1, 1,
0.1873847, 0.7621102, 1.249494, 0, 0.5333334, 1, 1,
0.1893424, 0.2863697, 2.199019, 0, 0.5254902, 1, 1,
0.1893551, 0.22617, 0.59133, 0, 0.5215687, 1, 1,
0.1895487, -0.4666765, 3.485208, 0, 0.5137255, 1, 1,
0.1899766, 0.6752952, -0.3968657, 0, 0.509804, 1, 1,
0.1909785, 1.267662, 0.8633181, 0, 0.5019608, 1, 1,
0.201105, 0.5865113, 1.247099, 0, 0.4941176, 1, 1,
0.2044505, 0.7444353, 1.889722, 0, 0.4901961, 1, 1,
0.2065701, -0.1968965, 1.187893, 0, 0.4823529, 1, 1,
0.2085463, 1.814938, 0.8645071, 0, 0.4784314, 1, 1,
0.2111784, 0.5696238, -0.5597084, 0, 0.4705882, 1, 1,
0.2112993, -0.5600644, 1.586481, 0, 0.4666667, 1, 1,
0.2113714, 0.9820803, 0.7148184, 0, 0.4588235, 1, 1,
0.2116579, -0.9209386, 2.963836, 0, 0.454902, 1, 1,
0.2197818, -0.7210824, 2.849007, 0, 0.4470588, 1, 1,
0.2207147, -0.4105716, 3.687456, 0, 0.4431373, 1, 1,
0.2210958, -0.8555562, 2.138103, 0, 0.4352941, 1, 1,
0.2292236, -0.5992309, 2.619897, 0, 0.4313726, 1, 1,
0.2313462, -0.2207575, 2.407457, 0, 0.4235294, 1, 1,
0.2344038, -0.6136759, 3.843936, 0, 0.4196078, 1, 1,
0.235465, 0.425804, 0.3689314, 0, 0.4117647, 1, 1,
0.2377861, 0.1658063, 2.354879, 0, 0.4078431, 1, 1,
0.2424169, -0.7448221, 3.710907, 0, 0.4, 1, 1,
0.2449977, 0.3827832, 0.1425627, 0, 0.3921569, 1, 1,
0.2468661, -0.279691, 3.458731, 0, 0.3882353, 1, 1,
0.2508512, -0.9641796, 2.484778, 0, 0.3803922, 1, 1,
0.2512229, 0.09789667, 2.358757, 0, 0.3764706, 1, 1,
0.2522413, -0.1733045, 3.177888, 0, 0.3686275, 1, 1,
0.2534369, -1.130996, 2.819706, 0, 0.3647059, 1, 1,
0.2543517, -0.2370442, 1.580344, 0, 0.3568628, 1, 1,
0.2565757, 0.2073518, 0.8143214, 0, 0.3529412, 1, 1,
0.2593281, 0.2141532, 1.544239, 0, 0.345098, 1, 1,
0.2641737, 0.1458797, 1.097531, 0, 0.3411765, 1, 1,
0.2681697, -0.1708722, 2.791409, 0, 0.3333333, 1, 1,
0.2701989, -0.2807745, 3.400175, 0, 0.3294118, 1, 1,
0.2703906, 0.9074013, 0.1759772, 0, 0.3215686, 1, 1,
0.2723968, 1.625616, 1.434511, 0, 0.3176471, 1, 1,
0.2779085, -0.701867, 2.913464, 0, 0.3098039, 1, 1,
0.2787987, 0.6187804, 1.843699, 0, 0.3058824, 1, 1,
0.2796234, 0.1912083, 1.461221, 0, 0.2980392, 1, 1,
0.2833315, 0.1396822, 2.206239, 0, 0.2901961, 1, 1,
0.2890169, 0.08030941, 2.067941, 0, 0.2862745, 1, 1,
0.2898841, 1.611128, 0.3622417, 0, 0.2784314, 1, 1,
0.2911212, -1.013385, 3.37139, 0, 0.2745098, 1, 1,
0.2928605, 0.8763293, 1.6801, 0, 0.2666667, 1, 1,
0.2944838, 0.9637852, 1.166285, 0, 0.2627451, 1, 1,
0.2961574, -0.5139776, 3.534989, 0, 0.254902, 1, 1,
0.2987423, 0.8079566, -0.5322208, 0, 0.2509804, 1, 1,
0.3022366, -0.2914215, 1.612881, 0, 0.2431373, 1, 1,
0.3023477, 1.355597, 0.7644697, 0, 0.2392157, 1, 1,
0.303158, 1.478013, 0.4851282, 0, 0.2313726, 1, 1,
0.3048674, 1.271753, 1.182025, 0, 0.227451, 1, 1,
0.3063276, 0.5039768, -0.1886883, 0, 0.2196078, 1, 1,
0.3135653, 1.565703, 0.1291826, 0, 0.2156863, 1, 1,
0.3178133, 0.9713291, 0.6180132, 0, 0.2078431, 1, 1,
0.3245067, -0.3010253, 1.955464, 0, 0.2039216, 1, 1,
0.3268711, 0.03648366, 1.556647, 0, 0.1960784, 1, 1,
0.3276496, -2.059761, 3.377152, 0, 0.1882353, 1, 1,
0.3276999, -0.1852014, 3.033343, 0, 0.1843137, 1, 1,
0.3324816, 1.428225, 0.2465503, 0, 0.1764706, 1, 1,
0.3457841, -0.2400211, 1.535757, 0, 0.172549, 1, 1,
0.3461246, 0.1987092, -0.05863028, 0, 0.1647059, 1, 1,
0.3500543, -0.3230996, 0.8801634, 0, 0.1607843, 1, 1,
0.351028, 0.3730005, 0.1397558, 0, 0.1529412, 1, 1,
0.3574641, 1.399311, 0.3948261, 0, 0.1490196, 1, 1,
0.3584335, -0.4242525, 3.501231, 0, 0.1411765, 1, 1,
0.3627397, -1.306404, 3.916677, 0, 0.1372549, 1, 1,
0.3665407, -0.4944604, 1.831532, 0, 0.1294118, 1, 1,
0.3675869, 0.7797552, -0.347891, 0, 0.1254902, 1, 1,
0.3683114, 0.9516868, 0.8863702, 0, 0.1176471, 1, 1,
0.3737387, 0.3614451, 0.5036953, 0, 0.1137255, 1, 1,
0.3743892, 0.6873695, 0.5741704, 0, 0.1058824, 1, 1,
0.3771592, 0.4565945, -0.3794354, 0, 0.09803922, 1, 1,
0.3789812, 0.7471933, 2.261307, 0, 0.09411765, 1, 1,
0.3800328, -0.9432777, 2.285454, 0, 0.08627451, 1, 1,
0.3808599, -0.6298395, 1.097282, 0, 0.08235294, 1, 1,
0.3810898, -0.1234906, 2.927093, 0, 0.07450981, 1, 1,
0.3887719, 0.8027993, -0.5658523, 0, 0.07058824, 1, 1,
0.3994908, 0.2327261, -0.7395138, 0, 0.0627451, 1, 1,
0.4008455, 0.6597431, 2.82378, 0, 0.05882353, 1, 1,
0.4121584, -1.164513, 2.906107, 0, 0.05098039, 1, 1,
0.4196252, 0.02360974, -0.2679923, 0, 0.04705882, 1, 1,
0.4200324, -0.05781241, 2.277277, 0, 0.03921569, 1, 1,
0.4220877, 1.200021, -0.3108619, 0, 0.03529412, 1, 1,
0.4275571, -0.8992782, 3.005519, 0, 0.02745098, 1, 1,
0.427727, 0.9896123, 0.7871626, 0, 0.02352941, 1, 1,
0.4279838, -0.5903394, 2.279589, 0, 0.01568628, 1, 1,
0.4336657, 0.4287859, 0.5068821, 0, 0.01176471, 1, 1,
0.4348542, -1.969568, 4.539543, 0, 0.003921569, 1, 1,
0.4353485, -1.446366, 2.210854, 0.003921569, 0, 1, 1,
0.4395696, -0.7787573, 1.656532, 0.007843138, 0, 1, 1,
0.4397936, -1.447235, 3.866361, 0.01568628, 0, 1, 1,
0.4419243, 0.9667321, 0.8784759, 0.01960784, 0, 1, 1,
0.4438905, -0.68251, 3.164259, 0.02745098, 0, 1, 1,
0.4447778, -1.249897, 3.794264, 0.03137255, 0, 1, 1,
0.4455498, -0.8965462, 2.520092, 0.03921569, 0, 1, 1,
0.4489112, 0.04064745, 0.930421, 0.04313726, 0, 1, 1,
0.4495201, 0.1894642, 1.326838, 0.05098039, 0, 1, 1,
0.4561672, -0.2820326, 2.217483, 0.05490196, 0, 1, 1,
0.458687, 1.189694, 1.093554, 0.0627451, 0, 1, 1,
0.4598768, 0.7671215, 1.437756, 0.06666667, 0, 1, 1,
0.462761, 0.2295986, 0.7093918, 0.07450981, 0, 1, 1,
0.4665287, -1.768242, 1.687798, 0.07843138, 0, 1, 1,
0.467976, -1.166154, 1.525688, 0.08627451, 0, 1, 1,
0.4695617, 0.8702409, -0.2560116, 0.09019608, 0, 1, 1,
0.4702404, 1.014922, 2.230767, 0.09803922, 0, 1, 1,
0.4707832, 0.1932849, 0.5013814, 0.1058824, 0, 1, 1,
0.473976, 0.6097089, 1.456482, 0.1098039, 0, 1, 1,
0.4745775, -0.1670251, 0.5873235, 0.1176471, 0, 1, 1,
0.4747521, 0.385871, 0.7397355, 0.1215686, 0, 1, 1,
0.4761744, 0.6313601, 0.0926521, 0.1294118, 0, 1, 1,
0.4765446, 1.105358, 0.6669167, 0.1333333, 0, 1, 1,
0.4831381, 0.5831426, -1.474954, 0.1411765, 0, 1, 1,
0.4841555, -0.5914845, 2.874057, 0.145098, 0, 1, 1,
0.4926457, -1.156454, 2.839526, 0.1529412, 0, 1, 1,
0.4943581, 0.4868461, -0.3444502, 0.1568628, 0, 1, 1,
0.4962684, 1.518162, -0.07744457, 0.1647059, 0, 1, 1,
0.498264, -0.6599507, 2.645761, 0.1686275, 0, 1, 1,
0.5013137, -1.74123, 1.63422, 0.1764706, 0, 1, 1,
0.5019417, 0.3032451, 2.181987, 0.1803922, 0, 1, 1,
0.5019868, 0.140851, 0.8706485, 0.1882353, 0, 1, 1,
0.5039978, -0.4165072, 1.451937, 0.1921569, 0, 1, 1,
0.5049955, -2.298128, 5.334508, 0.2, 0, 1, 1,
0.5081853, -1.377771, 2.114792, 0.2078431, 0, 1, 1,
0.5101386, -0.4080392, 2.865685, 0.2117647, 0, 1, 1,
0.5103902, 0.2806976, 0.3823782, 0.2196078, 0, 1, 1,
0.5160733, -0.5346575, 3.314811, 0.2235294, 0, 1, 1,
0.516809, 0.09490916, 3.238181, 0.2313726, 0, 1, 1,
0.5211093, 1.247483, 0.8184438, 0.2352941, 0, 1, 1,
0.52434, -0.0102694, 1.460808, 0.2431373, 0, 1, 1,
0.527513, 2.218031, -0.3267285, 0.2470588, 0, 1, 1,
0.5299777, -1.173896, 3.929483, 0.254902, 0, 1, 1,
0.5324964, 0.4698295, 0.7793952, 0.2588235, 0, 1, 1,
0.5366373, 2.137319, -0.3337503, 0.2666667, 0, 1, 1,
0.5396484, 0.8999858, 1.30494, 0.2705882, 0, 1, 1,
0.5455387, -0.6029193, 3.035948, 0.2784314, 0, 1, 1,
0.5478668, -0.4291735, -0.2622023, 0.282353, 0, 1, 1,
0.5525923, -0.9755181, 2.811459, 0.2901961, 0, 1, 1,
0.5547991, -0.05521962, 1.748293, 0.2941177, 0, 1, 1,
0.5606475, 0.624316, 1.238822, 0.3019608, 0, 1, 1,
0.5615757, -0.08098608, 1.438945, 0.3098039, 0, 1, 1,
0.5677357, 0.8887599, 1.198559, 0.3137255, 0, 1, 1,
0.569548, 1.02308, 1.124044, 0.3215686, 0, 1, 1,
0.5729363, 0.5741572, 1.429993, 0.3254902, 0, 1, 1,
0.5745289, 0.07157795, 0.5917157, 0.3333333, 0, 1, 1,
0.5757332, 2.07701, 0.9816318, 0.3372549, 0, 1, 1,
0.5759207, 1.012516, -1.519219, 0.345098, 0, 1, 1,
0.5833955, 1.4136, -0.6688346, 0.3490196, 0, 1, 1,
0.5835794, 1.287721, 1.762957, 0.3568628, 0, 1, 1,
0.5888044, -0.4965532, 2.000856, 0.3607843, 0, 1, 1,
0.5914901, 0.9348355, 0.1929536, 0.3686275, 0, 1, 1,
0.593792, -1.908694, 2.180248, 0.372549, 0, 1, 1,
0.5944572, -0.02545278, 1.787648, 0.3803922, 0, 1, 1,
0.5984425, -0.5377139, 2.324265, 0.3843137, 0, 1, 1,
0.5987467, -0.6466271, 2.462049, 0.3921569, 0, 1, 1,
0.603749, 0.4741865, 0.3068604, 0.3960784, 0, 1, 1,
0.6076865, 0.2223565, 1.579804, 0.4039216, 0, 1, 1,
0.6091381, 0.1141461, 1.633112, 0.4117647, 0, 1, 1,
0.6126556, 0.2292631, 2.334425, 0.4156863, 0, 1, 1,
0.6239664, -0.3594696, 2.401222, 0.4235294, 0, 1, 1,
0.6241778, 2.178078, 0.9015439, 0.427451, 0, 1, 1,
0.626847, 0.4709155, 0.8462223, 0.4352941, 0, 1, 1,
0.6303041, -0.7629767, 3.452762, 0.4392157, 0, 1, 1,
0.6320835, -0.3249399, 2.696751, 0.4470588, 0, 1, 1,
0.6370159, -0.2170246, 2.303817, 0.4509804, 0, 1, 1,
0.6404951, 0.8889126, 1.080987, 0.4588235, 0, 1, 1,
0.6409872, 0.176787, 0.831453, 0.4627451, 0, 1, 1,
0.6424018, 0.9807645, -0.1603239, 0.4705882, 0, 1, 1,
0.6424681, -0.598609, 2.568862, 0.4745098, 0, 1, 1,
0.643099, 0.4354118, 0.7061754, 0.4823529, 0, 1, 1,
0.6472513, 0.4929046, 0.4811851, 0.4862745, 0, 1, 1,
0.6515319, -1.980283, 3.81954, 0.4941176, 0, 1, 1,
0.659016, -0.3475787, 0.5658783, 0.5019608, 0, 1, 1,
0.6590192, -1.020929, 4.071813, 0.5058824, 0, 1, 1,
0.6628233, -0.9665825, 3.684972, 0.5137255, 0, 1, 1,
0.6693866, 1.063719, 0.2618825, 0.5176471, 0, 1, 1,
0.669421, -0.3100508, 0.5927637, 0.5254902, 0, 1, 1,
0.6701604, -0.786806, 2.834893, 0.5294118, 0, 1, 1,
0.6750146, -2.303695, 3.17756, 0.5372549, 0, 1, 1,
0.6896238, 1.477538, -1.434772, 0.5411765, 0, 1, 1,
0.6904975, -0.02450597, 1.373455, 0.5490196, 0, 1, 1,
0.6931968, -0.1253272, 0.5710446, 0.5529412, 0, 1, 1,
0.6944242, -1.650067, 4.319091, 0.5607843, 0, 1, 1,
0.7032794, -1.40838, 1.459294, 0.5647059, 0, 1, 1,
0.7038556, -0.25337, 1.885426, 0.572549, 0, 1, 1,
0.7069618, -1.151624, 3.037541, 0.5764706, 0, 1, 1,
0.7077609, -0.4465238, 3.192677, 0.5843138, 0, 1, 1,
0.7088878, -0.4257449, 1.669676, 0.5882353, 0, 1, 1,
0.7116058, 0.6772609, 0.63015, 0.5960785, 0, 1, 1,
0.7174384, -0.8123558, 2.988516, 0.6039216, 0, 1, 1,
0.7197718, -0.7063671, 1.109954, 0.6078432, 0, 1, 1,
0.728424, -0.6449409, 3.183328, 0.6156863, 0, 1, 1,
0.7315841, 1.126755, 0.01531783, 0.6196079, 0, 1, 1,
0.7340026, 0.4616056, 0.8307678, 0.627451, 0, 1, 1,
0.7396867, -0.241301, 1.986836, 0.6313726, 0, 1, 1,
0.7431335, 1.12355, 1.239139, 0.6392157, 0, 1, 1,
0.7436495, 0.05591066, 2.129287, 0.6431373, 0, 1, 1,
0.7450306, 0.1072656, -0.1395447, 0.6509804, 0, 1, 1,
0.7455464, 0.8232315, -0.8933448, 0.654902, 0, 1, 1,
0.7458003, -0.6544763, 2.599033, 0.6627451, 0, 1, 1,
0.7484514, -0.6658005, 2.990493, 0.6666667, 0, 1, 1,
0.7495524, -1.425959, 4.208194, 0.6745098, 0, 1, 1,
0.7517257, -0.2147163, 2.925887, 0.6784314, 0, 1, 1,
0.7601271, -0.05478874, 2.102561, 0.6862745, 0, 1, 1,
0.7628441, -0.1186754, 1.401675, 0.6901961, 0, 1, 1,
0.7704009, 0.8751432, 0.9342625, 0.6980392, 0, 1, 1,
0.7793211, 0.3620056, 0.2644212, 0.7058824, 0, 1, 1,
0.7823148, -0.9855118, 1.466551, 0.7098039, 0, 1, 1,
0.7823846, 1.324031, -2.648058, 0.7176471, 0, 1, 1,
0.7942782, -0.1884708, -0.6353115, 0.7215686, 0, 1, 1,
0.7969414, 1.7099, 0.3851939, 0.7294118, 0, 1, 1,
0.8010178, 1.738451, 0.6461878, 0.7333333, 0, 1, 1,
0.8024162, 1.711162, 1.510999, 0.7411765, 0, 1, 1,
0.8066498, -1.626831, 0.7498847, 0.7450981, 0, 1, 1,
0.8080394, 0.5539327, 1.726015, 0.7529412, 0, 1, 1,
0.8143595, 1.294198, 1.387404, 0.7568628, 0, 1, 1,
0.8194685, 0.1145676, 0.7574353, 0.7647059, 0, 1, 1,
0.8315539, 0.01814617, 3.091529, 0.7686275, 0, 1, 1,
0.8397247, -0.2236055, 1.84717, 0.7764706, 0, 1, 1,
0.8402124, -0.5134941, 2.921186, 0.7803922, 0, 1, 1,
0.8406307, -0.3080578, 1.689025, 0.7882353, 0, 1, 1,
0.8429614, -0.9400511, -0.04901484, 0.7921569, 0, 1, 1,
0.8449206, -1.450121, 2.66485, 0.8, 0, 1, 1,
0.8531767, -1.522567, 2.075804, 0.8078431, 0, 1, 1,
0.8544588, 1.508156, 0.2051045, 0.8117647, 0, 1, 1,
0.8577794, -0.4591696, 1.690036, 0.8196079, 0, 1, 1,
0.8577811, 1.238671, 0.02114623, 0.8235294, 0, 1, 1,
0.8582509, -0.6185904, 1.63967, 0.8313726, 0, 1, 1,
0.8597021, -0.4236596, 0.8110498, 0.8352941, 0, 1, 1,
0.8693003, 0.2074761, -0.3326034, 0.8431373, 0, 1, 1,
0.8694986, 0.2935265, 0.08870189, 0.8470588, 0, 1, 1,
0.86989, -0.2517703, 1.277778, 0.854902, 0, 1, 1,
0.870317, 1.251208, 0.874076, 0.8588235, 0, 1, 1,
0.8781504, -2.606115, 3.49438, 0.8666667, 0, 1, 1,
0.882358, 2.124528, -0.5406296, 0.8705882, 0, 1, 1,
0.8837803, -0.2183045, 1.478329, 0.8784314, 0, 1, 1,
0.8847704, 0.1950831, 0.7582247, 0.8823529, 0, 1, 1,
0.8880186, -0.4488207, 2.779292, 0.8901961, 0, 1, 1,
0.8887441, 0.7786555, 0.7382942, 0.8941177, 0, 1, 1,
0.8959238, 0.9078692, 1.369929, 0.9019608, 0, 1, 1,
0.8962542, -0.4872923, -0.20183, 0.9098039, 0, 1, 1,
0.9066469, 0.652908, 1.812964, 0.9137255, 0, 1, 1,
0.9098408, 0.3088332, 2.439685, 0.9215686, 0, 1, 1,
0.9102331, -0.9613605, 3.425817, 0.9254902, 0, 1, 1,
0.9137177, -0.5050887, 3.00127, 0.9333333, 0, 1, 1,
0.9214646, 0.2440467, 2.343143, 0.9372549, 0, 1, 1,
0.9261878, 0.01363521, 1.393243, 0.945098, 0, 1, 1,
0.9295366, 1.600449, 1.028768, 0.9490196, 0, 1, 1,
0.9299077, 0.2806244, 1.521899, 0.9568627, 0, 1, 1,
0.9324589, 1.099708, -0.216267, 0.9607843, 0, 1, 1,
0.9326424, 1.648292, 0.0196722, 0.9686275, 0, 1, 1,
0.9331723, 0.1679572, 0.3787713, 0.972549, 0, 1, 1,
0.9335858, 0.7162352, 1.479637, 0.9803922, 0, 1, 1,
0.9392427, 1.373182, -0.1686587, 0.9843137, 0, 1, 1,
0.9392575, -1.009561, 2.484464, 0.9921569, 0, 1, 1,
0.9470773, -0.7240087, 3.446452, 0.9960784, 0, 1, 1,
0.952724, 2.094031, -0.3876933, 1, 0, 0.9960784, 1,
0.9550611, 0.5286788, 0.4627269, 1, 0, 0.9882353, 1,
0.9585312, 0.5643777, 1.020854, 1, 0, 0.9843137, 1,
0.9586987, -0.6485829, 3.552203, 1, 0, 0.9764706, 1,
0.9593275, -0.1616407, 1.696613, 1, 0, 0.972549, 1,
0.9609782, -0.7553725, 1.466138, 1, 0, 0.9647059, 1,
0.9673623, -1.046375, 4.393517, 1, 0, 0.9607843, 1,
0.9691996, 0.7252587, 0.7179347, 1, 0, 0.9529412, 1,
0.9728285, -0.2257449, 2.399398, 1, 0, 0.9490196, 1,
0.9803039, 0.1954866, 1.040284, 1, 0, 0.9411765, 1,
0.9855829, -0.8608996, 0.6770861, 1, 0, 0.9372549, 1,
0.9888666, 1.321239, 0.432945, 1, 0, 0.9294118, 1,
0.9951041, 1.245336, -0.1465565, 1, 0, 0.9254902, 1,
1.001202, 1.639597, 1.277591, 1, 0, 0.9176471, 1,
1.003586, 0.1984971, 2.825555, 1, 0, 0.9137255, 1,
1.010983, -0.1006255, 4.353768, 1, 0, 0.9058824, 1,
1.011578, 0.5032943, 1.143293, 1, 0, 0.9019608, 1,
1.021911, 0.3669519, 0.2478651, 1, 0, 0.8941177, 1,
1.025822, 0.6552819, 2.046918, 1, 0, 0.8862745, 1,
1.029097, -0.7119783, 1.690784, 1, 0, 0.8823529, 1,
1.040484, -0.8482668, 1.798711, 1, 0, 0.8745098, 1,
1.042163, 0.5714376, 1.531165, 1, 0, 0.8705882, 1,
1.042175, -0.2386705, 0.6343074, 1, 0, 0.8627451, 1,
1.043689, -0.6437669, 1.244786, 1, 0, 0.8588235, 1,
1.044428, -1.517993, 1.112076, 1, 0, 0.8509804, 1,
1.048048, -0.04148904, 0.6999217, 1, 0, 0.8470588, 1,
1.05274, -1.341777, 2.134767, 1, 0, 0.8392157, 1,
1.070915, -0.445977, 2.563551, 1, 0, 0.8352941, 1,
1.074933, 1.354471, -0.1329429, 1, 0, 0.827451, 1,
1.075111, 1.380697, 2.252534, 1, 0, 0.8235294, 1,
1.075891, -1.004618, 3.824565, 1, 0, 0.8156863, 1,
1.079511, -0.04288047, 0.03340654, 1, 0, 0.8117647, 1,
1.079763, -1.678322, 3.384522, 1, 0, 0.8039216, 1,
1.094868, 2.222133, -0.08281198, 1, 0, 0.7960784, 1,
1.110825, -0.4272085, 2.95881, 1, 0, 0.7921569, 1,
1.113786, 1.493743, 2.097989, 1, 0, 0.7843137, 1,
1.11388, -0.470058, 3.045439, 1, 0, 0.7803922, 1,
1.113979, 1.73796, 1.986991, 1, 0, 0.772549, 1,
1.115243, -0.9142947, 1.993072, 1, 0, 0.7686275, 1,
1.129363, 1.374074, 1.595984, 1, 0, 0.7607843, 1,
1.130964, 0.8860122, 1.543399, 1, 0, 0.7568628, 1,
1.132302, -0.7469748, 1.050139, 1, 0, 0.7490196, 1,
1.13486, 0.9713064, -0.5248047, 1, 0, 0.7450981, 1,
1.142103, 0.3941826, 0.6958008, 1, 0, 0.7372549, 1,
1.14467, 0.6483603, 0.08487117, 1, 0, 0.7333333, 1,
1.147387, 0.3731509, 2.15983, 1, 0, 0.7254902, 1,
1.152123, -0.7046801, 1.574107, 1, 0, 0.7215686, 1,
1.155028, 1.438106, 1.921162, 1, 0, 0.7137255, 1,
1.155953, 0.3465583, -0.327892, 1, 0, 0.7098039, 1,
1.162056, 0.8947697, -0.3431017, 1, 0, 0.7019608, 1,
1.163415, -0.4452052, 1.424594, 1, 0, 0.6941177, 1,
1.164384, 0.3876443, 2.064338, 1, 0, 0.6901961, 1,
1.181146, 0.3746235, 2.326207, 1, 0, 0.682353, 1,
1.185166, -0.9366658, 2.444179, 1, 0, 0.6784314, 1,
1.187793, 0.6260891, 1.129035, 1, 0, 0.6705883, 1,
1.19025, 0.1332443, 3.709561, 1, 0, 0.6666667, 1,
1.190282, -0.9776568, 0.9583554, 1, 0, 0.6588235, 1,
1.190768, -0.8810773, 2.214997, 1, 0, 0.654902, 1,
1.194671, -0.0544462, 0.4337593, 1, 0, 0.6470588, 1,
1.197844, -0.03403522, 3.46588, 1, 0, 0.6431373, 1,
1.202933, -2.262875, 2.163645, 1, 0, 0.6352941, 1,
1.208986, 0.5769781, 2.231313, 1, 0, 0.6313726, 1,
1.211713, -1.339531, 3.062211, 1, 0, 0.6235294, 1,
1.215665, -1.351778, 2.209428, 1, 0, 0.6196079, 1,
1.217866, 0.5827292, 1.316131, 1, 0, 0.6117647, 1,
1.226742, -1.005785, 1.764246, 1, 0, 0.6078432, 1,
1.241343, 0.1955618, 0.2351472, 1, 0, 0.6, 1,
1.241445, 1.825471, 1.584852, 1, 0, 0.5921569, 1,
1.24903, 0.6629033, 2.990646, 1, 0, 0.5882353, 1,
1.249134, -0.7514856, 1.799544, 1, 0, 0.5803922, 1,
1.25288, 1.176197, 0.9636894, 1, 0, 0.5764706, 1,
1.254239, -0.4432037, 1.96207, 1, 0, 0.5686275, 1,
1.263315, -0.3702652, 0.2186539, 1, 0, 0.5647059, 1,
1.269939, 0.09189268, 0.3416544, 1, 0, 0.5568628, 1,
1.320653, -0.3558265, 2.675034, 1, 0, 0.5529412, 1,
1.32624, -1.039805, 0.9945621, 1, 0, 0.5450981, 1,
1.331774, -0.1284117, 3.427443, 1, 0, 0.5411765, 1,
1.334203, -0.7451441, 0.8113704, 1, 0, 0.5333334, 1,
1.341167, 1.111009, 1.3911, 1, 0, 0.5294118, 1,
1.342348, 0.1996413, 0.2137536, 1, 0, 0.5215687, 1,
1.351583, 1.589986, 1.005505, 1, 0, 0.5176471, 1,
1.357022, -1.82891, 1.022815, 1, 0, 0.509804, 1,
1.361485, -0.6988896, 0.3543275, 1, 0, 0.5058824, 1,
1.365752, -0.7617393, 1.305714, 1, 0, 0.4980392, 1,
1.371328, -0.5950603, 3.293511, 1, 0, 0.4901961, 1,
1.372038, -0.04688744, 0.4776118, 1, 0, 0.4862745, 1,
1.376416, 0.2496071, 2.055949, 1, 0, 0.4784314, 1,
1.386126, -0.8131304, 1.0827, 1, 0, 0.4745098, 1,
1.39433, -0.007448354, 1.371665, 1, 0, 0.4666667, 1,
1.394349, 1.573335, -0.8534905, 1, 0, 0.4627451, 1,
1.405125, 0.1047458, 0.3128942, 1, 0, 0.454902, 1,
1.413899, 0.1983379, 2.718136, 1, 0, 0.4509804, 1,
1.418863, 0.5944955, 0.8276454, 1, 0, 0.4431373, 1,
1.422404, 0.2372876, 1.948324, 1, 0, 0.4392157, 1,
1.422996, 0.5518063, 1.42706, 1, 0, 0.4313726, 1,
1.432573, 0.5593534, 0.3300768, 1, 0, 0.427451, 1,
1.444407, -0.2797882, 2.176891, 1, 0, 0.4196078, 1,
1.448742, 0.1403377, 2.861706, 1, 0, 0.4156863, 1,
1.451881, -0.5368495, 2.664473, 1, 0, 0.4078431, 1,
1.453667, -0.5846127, 1.359972, 1, 0, 0.4039216, 1,
1.458157, 0.2270829, 0.1367963, 1, 0, 0.3960784, 1,
1.459064, 1.262863, 1.723803, 1, 0, 0.3882353, 1,
1.461666, -1.4389, 1.612138, 1, 0, 0.3843137, 1,
1.479224, -0.5662179, 1.623999, 1, 0, 0.3764706, 1,
1.488085, -0.6336837, 3.385356, 1, 0, 0.372549, 1,
1.497569, -0.1465957, 3.289665, 1, 0, 0.3647059, 1,
1.501653, 1.004739, 0.6193466, 1, 0, 0.3607843, 1,
1.511946, 0.1013997, 0.7805815, 1, 0, 0.3529412, 1,
1.512801, -0.1967911, 1.736457, 1, 0, 0.3490196, 1,
1.519448, 2.216417, -0.4776398, 1, 0, 0.3411765, 1,
1.522207, 0.06377199, 1.136558, 1, 0, 0.3372549, 1,
1.545159, 0.6473159, 1.356368, 1, 0, 0.3294118, 1,
1.547513, -1.748134, 2.280129, 1, 0, 0.3254902, 1,
1.562492, 0.1019178, 3.812633, 1, 0, 0.3176471, 1,
1.574378, -1.898594, 2.18527, 1, 0, 0.3137255, 1,
1.589731, 1.53729, -1.921526, 1, 0, 0.3058824, 1,
1.596231, -1.998609, 2.71085, 1, 0, 0.2980392, 1,
1.598942, 0.1876716, 1.108991, 1, 0, 0.2941177, 1,
1.60408, 0.01344225, 1.474762, 1, 0, 0.2862745, 1,
1.608822, 1.218264, 1.956536, 1, 0, 0.282353, 1,
1.609025, -0.2421631, 0.9177012, 1, 0, 0.2745098, 1,
1.610394, 0.4404394, 2.162898, 1, 0, 0.2705882, 1,
1.612108, 0.1929384, -0.552433, 1, 0, 0.2627451, 1,
1.613898, 1.218936, 1.559672, 1, 0, 0.2588235, 1,
1.61559, -1.218507, 1.365631, 1, 0, 0.2509804, 1,
1.627239, 0.6078979, -0.3592253, 1, 0, 0.2470588, 1,
1.627282, 0.1207322, 2.293898, 1, 0, 0.2392157, 1,
1.6375, 1.942214, 0.4327265, 1, 0, 0.2352941, 1,
1.637652, 1.040343, 0.1502495, 1, 0, 0.227451, 1,
1.644545, 0.4671289, 0.5655375, 1, 0, 0.2235294, 1,
1.659193, -2.256585, 1.770175, 1, 0, 0.2156863, 1,
1.664716, 0.1716118, 0.8085062, 1, 0, 0.2117647, 1,
1.667191, -2.11466, 0.8721334, 1, 0, 0.2039216, 1,
1.680535, -0.9685448, 1.060943, 1, 0, 0.1960784, 1,
1.680749, 0.619087, -0.01518554, 1, 0, 0.1921569, 1,
1.713086, -1.867248, 1.313111, 1, 0, 0.1843137, 1,
1.737773, 0.3906815, 0.1946621, 1, 0, 0.1803922, 1,
1.774482, -0.4621584, 1.342562, 1, 0, 0.172549, 1,
1.799799, 0.137348, 1.497603, 1, 0, 0.1686275, 1,
1.804567, 1.458273, 0.6616856, 1, 0, 0.1607843, 1,
1.86458, 0.8482122, 2.667257, 1, 0, 0.1568628, 1,
1.875278, -0.8555632, -0.3393712, 1, 0, 0.1490196, 1,
1.90511, -1.224275, 2.108602, 1, 0, 0.145098, 1,
1.915708, -1.377126, 0.7134917, 1, 0, 0.1372549, 1,
1.999195, -0.8385787, 1.412276, 1, 0, 0.1333333, 1,
2.092577, -0.2387165, 1.968176, 1, 0, 0.1254902, 1,
2.110199, 1.506266, 1.555225, 1, 0, 0.1215686, 1,
2.149929, -0.1912261, 2.075541, 1, 0, 0.1137255, 1,
2.190324, -0.9737931, 1.328156, 1, 0, 0.1098039, 1,
2.195115, -0.7029105, 1.603942, 1, 0, 0.1019608, 1,
2.219171, 0.06641344, 2.34044, 1, 0, 0.09411765, 1,
2.219738, -0.3205686, 0.8839964, 1, 0, 0.09019608, 1,
2.240608, 0.1254065, 0.5383348, 1, 0, 0.08235294, 1,
2.24158, -0.05244371, 1.998956, 1, 0, 0.07843138, 1,
2.260291, -1.129195, 1.740275, 1, 0, 0.07058824, 1,
2.296236, 1.297081, 2.14318, 1, 0, 0.06666667, 1,
2.334341, -3.059798, 0.2777308, 1, 0, 0.05882353, 1,
2.371881, -0.4438429, 2.241592, 1, 0, 0.05490196, 1,
2.404891, -0.339692, -0.154914, 1, 0, 0.04705882, 1,
2.466145, -0.08518854, 0.3545996, 1, 0, 0.04313726, 1,
2.466192, -0.292511, 2.324936, 1, 0, 0.03529412, 1,
2.472816, -0.6775973, 0.8486228, 1, 0, 0.03137255, 1,
2.474314, -2.165473, 3.735937, 1, 0, 0.02352941, 1,
3.155807, 0.6425517, 0.7375774, 1, 0, 0.01960784, 1,
3.327714, 0.5853066, 1.87411, 1, 0, 0.01176471, 1,
3.605442, 0.4327345, 1.680906, 1, 0, 0.007843138, 1
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
0.1627479, -4.069749, -7.610506, 0, -0.5, 0.5, 0.5,
0.1627479, -4.069749, -7.610506, 1, -0.5, 0.5, 0.5,
0.1627479, -4.069749, -7.610506, 1, 1.5, 0.5, 0.5,
0.1627479, -4.069749, -7.610506, 0, 1.5, 0.5, 0.5
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
-4.447019, -0.08059049, -7.610506, 0, -0.5, 0.5, 0.5,
-4.447019, -0.08059049, -7.610506, 1, -0.5, 0.5, 0.5,
-4.447019, -0.08059049, -7.610506, 1, 1.5, 0.5, 0.5,
-4.447019, -0.08059049, -7.610506, 0, 1.5, 0.5, 0.5
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
-4.447019, -4.069749, 0.3175716, 0, -0.5, 0.5, 0.5,
-4.447019, -4.069749, 0.3175716, 1, -0.5, 0.5, 0.5,
-4.447019, -4.069749, 0.3175716, 1, 1.5, 0.5, 0.5,
-4.447019, -4.069749, 0.3175716, 0, 1.5, 0.5, 0.5
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
-3, -3.149174, -5.78095,
3, -3.149174, -5.78095,
-3, -3.149174, -5.78095,
-3, -3.302603, -6.085876,
-2, -3.149174, -5.78095,
-2, -3.302603, -6.085876,
-1, -3.149174, -5.78095,
-1, -3.302603, -6.085876,
0, -3.149174, -5.78095,
0, -3.302603, -6.085876,
1, -3.149174, -5.78095,
1, -3.302603, -6.085876,
2, -3.149174, -5.78095,
2, -3.302603, -6.085876,
3, -3.149174, -5.78095,
3, -3.302603, -6.085876
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
-3, -3.609462, -6.695728, 0, -0.5, 0.5, 0.5,
-3, -3.609462, -6.695728, 1, -0.5, 0.5, 0.5,
-3, -3.609462, -6.695728, 1, 1.5, 0.5, 0.5,
-3, -3.609462, -6.695728, 0, 1.5, 0.5, 0.5,
-2, -3.609462, -6.695728, 0, -0.5, 0.5, 0.5,
-2, -3.609462, -6.695728, 1, -0.5, 0.5, 0.5,
-2, -3.609462, -6.695728, 1, 1.5, 0.5, 0.5,
-2, -3.609462, -6.695728, 0, 1.5, 0.5, 0.5,
-1, -3.609462, -6.695728, 0, -0.5, 0.5, 0.5,
-1, -3.609462, -6.695728, 1, -0.5, 0.5, 0.5,
-1, -3.609462, -6.695728, 1, 1.5, 0.5, 0.5,
-1, -3.609462, -6.695728, 0, 1.5, 0.5, 0.5,
0, -3.609462, -6.695728, 0, -0.5, 0.5, 0.5,
0, -3.609462, -6.695728, 1, -0.5, 0.5, 0.5,
0, -3.609462, -6.695728, 1, 1.5, 0.5, 0.5,
0, -3.609462, -6.695728, 0, 1.5, 0.5, 0.5,
1, -3.609462, -6.695728, 0, -0.5, 0.5, 0.5,
1, -3.609462, -6.695728, 1, -0.5, 0.5, 0.5,
1, -3.609462, -6.695728, 1, 1.5, 0.5, 0.5,
1, -3.609462, -6.695728, 0, 1.5, 0.5, 0.5,
2, -3.609462, -6.695728, 0, -0.5, 0.5, 0.5,
2, -3.609462, -6.695728, 1, -0.5, 0.5, 0.5,
2, -3.609462, -6.695728, 1, 1.5, 0.5, 0.5,
2, -3.609462, -6.695728, 0, 1.5, 0.5, 0.5,
3, -3.609462, -6.695728, 0, -0.5, 0.5, 0.5,
3, -3.609462, -6.695728, 1, -0.5, 0.5, 0.5,
3, -3.609462, -6.695728, 1, 1.5, 0.5, 0.5,
3, -3.609462, -6.695728, 0, 1.5, 0.5, 0.5
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
-3.383227, -3, -5.78095,
-3.383227, 2, -5.78095,
-3.383227, -3, -5.78095,
-3.560525, -3, -6.085876,
-3.383227, -2, -5.78095,
-3.560525, -2, -6.085876,
-3.383227, -1, -5.78095,
-3.560525, -1, -6.085876,
-3.383227, 0, -5.78095,
-3.560525, 0, -6.085876,
-3.383227, 1, -5.78095,
-3.560525, 1, -6.085876,
-3.383227, 2, -5.78095,
-3.560525, 2, -6.085876
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
-3.915123, -3, -6.695728, 0, -0.5, 0.5, 0.5,
-3.915123, -3, -6.695728, 1, -0.5, 0.5, 0.5,
-3.915123, -3, -6.695728, 1, 1.5, 0.5, 0.5,
-3.915123, -3, -6.695728, 0, 1.5, 0.5, 0.5,
-3.915123, -2, -6.695728, 0, -0.5, 0.5, 0.5,
-3.915123, -2, -6.695728, 1, -0.5, 0.5, 0.5,
-3.915123, -2, -6.695728, 1, 1.5, 0.5, 0.5,
-3.915123, -2, -6.695728, 0, 1.5, 0.5, 0.5,
-3.915123, -1, -6.695728, 0, -0.5, 0.5, 0.5,
-3.915123, -1, -6.695728, 1, -0.5, 0.5, 0.5,
-3.915123, -1, -6.695728, 1, 1.5, 0.5, 0.5,
-3.915123, -1, -6.695728, 0, 1.5, 0.5, 0.5,
-3.915123, 0, -6.695728, 0, -0.5, 0.5, 0.5,
-3.915123, 0, -6.695728, 1, -0.5, 0.5, 0.5,
-3.915123, 0, -6.695728, 1, 1.5, 0.5, 0.5,
-3.915123, 0, -6.695728, 0, 1.5, 0.5, 0.5,
-3.915123, 1, -6.695728, 0, -0.5, 0.5, 0.5,
-3.915123, 1, -6.695728, 1, -0.5, 0.5, 0.5,
-3.915123, 1, -6.695728, 1, 1.5, 0.5, 0.5,
-3.915123, 1, -6.695728, 0, 1.5, 0.5, 0.5,
-3.915123, 2, -6.695728, 0, -0.5, 0.5, 0.5,
-3.915123, 2, -6.695728, 1, -0.5, 0.5, 0.5,
-3.915123, 2, -6.695728, 1, 1.5, 0.5, 0.5,
-3.915123, 2, -6.695728, 0, 1.5, 0.5, 0.5
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
-3.383227, -3.149174, -4,
-3.383227, -3.149174, 6,
-3.383227, -3.149174, -4,
-3.560525, -3.302603, -4,
-3.383227, -3.149174, -2,
-3.560525, -3.302603, -2,
-3.383227, -3.149174, 0,
-3.560525, -3.302603, 0,
-3.383227, -3.149174, 2,
-3.560525, -3.302603, 2,
-3.383227, -3.149174, 4,
-3.560525, -3.302603, 4,
-3.383227, -3.149174, 6,
-3.560525, -3.302603, 6
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
-3.915123, -3.609462, -4, 0, -0.5, 0.5, 0.5,
-3.915123, -3.609462, -4, 1, -0.5, 0.5, 0.5,
-3.915123, -3.609462, -4, 1, 1.5, 0.5, 0.5,
-3.915123, -3.609462, -4, 0, 1.5, 0.5, 0.5,
-3.915123, -3.609462, -2, 0, -0.5, 0.5, 0.5,
-3.915123, -3.609462, -2, 1, -0.5, 0.5, 0.5,
-3.915123, -3.609462, -2, 1, 1.5, 0.5, 0.5,
-3.915123, -3.609462, -2, 0, 1.5, 0.5, 0.5,
-3.915123, -3.609462, 0, 0, -0.5, 0.5, 0.5,
-3.915123, -3.609462, 0, 1, -0.5, 0.5, 0.5,
-3.915123, -3.609462, 0, 1, 1.5, 0.5, 0.5,
-3.915123, -3.609462, 0, 0, 1.5, 0.5, 0.5,
-3.915123, -3.609462, 2, 0, -0.5, 0.5, 0.5,
-3.915123, -3.609462, 2, 1, -0.5, 0.5, 0.5,
-3.915123, -3.609462, 2, 1, 1.5, 0.5, 0.5,
-3.915123, -3.609462, 2, 0, 1.5, 0.5, 0.5,
-3.915123, -3.609462, 4, 0, -0.5, 0.5, 0.5,
-3.915123, -3.609462, 4, 1, -0.5, 0.5, 0.5,
-3.915123, -3.609462, 4, 1, 1.5, 0.5, 0.5,
-3.915123, -3.609462, 4, 0, 1.5, 0.5, 0.5,
-3.915123, -3.609462, 6, 0, -0.5, 0.5, 0.5,
-3.915123, -3.609462, 6, 1, -0.5, 0.5, 0.5,
-3.915123, -3.609462, 6, 1, 1.5, 0.5, 0.5,
-3.915123, -3.609462, 6, 0, 1.5, 0.5, 0.5
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
-3.383227, -3.149174, -5.78095,
-3.383227, 2.987993, -5.78095,
-3.383227, -3.149174, 6.416093,
-3.383227, 2.987993, 6.416093,
-3.383227, -3.149174, -5.78095,
-3.383227, -3.149174, 6.416093,
-3.383227, 2.987993, -5.78095,
-3.383227, 2.987993, 6.416093,
-3.383227, -3.149174, -5.78095,
3.708722, -3.149174, -5.78095,
-3.383227, -3.149174, 6.416093,
3.708722, -3.149174, 6.416093,
-3.383227, 2.987993, -5.78095,
3.708722, 2.987993, -5.78095,
-3.383227, 2.987993, 6.416093,
3.708722, 2.987993, 6.416093,
3.708722, -3.149174, -5.78095,
3.708722, 2.987993, -5.78095,
3.708722, -3.149174, 6.416093,
3.708722, 2.987993, 6.416093,
3.708722, -3.149174, -5.78095,
3.708722, -3.149174, 6.416093,
3.708722, 2.987993, -5.78095,
3.708722, 2.987993, 6.416093
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
var radius = 8.215815;
var distance = 36.55309;
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
mvMatrix.translate( -0.1627479, 0.08059049, -0.3175716 );
mvMatrix.scale( 1.252561, 1.447427, 0.7282995 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.55309);
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
Butanoate<-read.table("Butanoate.xyz", skip=1)
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
-3.279946, 0.7442046, -1.336317, 0, 0, 1, 1, 1,
-3.195893, -0.6317296, -2.917859, 1, 0, 0, 1, 1,
-3.10622, 0.2883911, -1.204898, 1, 0, 0, 1, 1,
-2.925906, 0.6448875, -0.02976331, 1, 0, 0, 1, 1,
-2.91488, -0.4160723, -1.292523, 1, 0, 0, 1, 1,
-2.773404, 0.8930861, -2.102866, 1, 0, 0, 1, 1,
-2.614655, -0.6393753, -1.922886, 0, 0, 0, 1, 1,
-2.562743, 0.9573912, -0.8797566, 0, 0, 0, 1, 1,
-2.490069, 0.2566946, -1.782901, 0, 0, 0, 1, 1,
-2.468666, -0.5515928, -0.8500043, 0, 0, 0, 1, 1,
-2.441855, 0.09231651, -1.078913, 0, 0, 0, 1, 1,
-2.367355, -0.01231359, -1.210345, 0, 0, 0, 1, 1,
-2.317755, 1.513666, -2.067866, 0, 0, 0, 1, 1,
-2.302364, -0.32529, -2.040233, 1, 1, 1, 1, 1,
-2.247233, 1.525298, -1.315132, 1, 1, 1, 1, 1,
-2.246495, 0.6242279, -0.5424148, 1, 1, 1, 1, 1,
-2.205459, 0.5551458, -1.882327, 1, 1, 1, 1, 1,
-2.179243, 1.500826, 0.392684, 1, 1, 1, 1, 1,
-2.17678, 0.5524755, -1.580505, 1, 1, 1, 1, 1,
-2.152889, -1.07712, -2.752529, 1, 1, 1, 1, 1,
-2.109859, 0.6726828, -0.6394932, 1, 1, 1, 1, 1,
-2.098428, 0.6021404, -1.76627, 1, 1, 1, 1, 1,
-2.078084, 1.475281, -0.9158038, 1, 1, 1, 1, 1,
-2.071819, 1.363805, -1.167602, 1, 1, 1, 1, 1,
-2.067936, 0.2609837, -1.561509, 1, 1, 1, 1, 1,
-2.058463, -1.595261, -3.551294, 1, 1, 1, 1, 1,
-2.057941, -0.2436441, -2.321583, 1, 1, 1, 1, 1,
-2.049338, -0.2311726, -0.6404841, 1, 1, 1, 1, 1,
-2.020236, 0.8328958, -0.9444693, 0, 0, 1, 1, 1,
-2.010915, 0.1676046, -2.446125, 1, 0, 0, 1, 1,
-2.010671, -1.120258, -1.114626, 1, 0, 0, 1, 1,
-1.942242, -0.9267538, -2.016971, 1, 0, 0, 1, 1,
-1.904426, -0.09893981, -0.6663836, 1, 0, 0, 1, 1,
-1.87553, -1.637352, -2.836627, 1, 0, 0, 1, 1,
-1.867324, -0.9585616, -1.604775, 0, 0, 0, 1, 1,
-1.826034, -1.36468, -4.435702, 0, 0, 0, 1, 1,
-1.821161, 0.4816557, -1.676593, 0, 0, 0, 1, 1,
-1.81363, -0.5232994, -2.887317, 0, 0, 0, 1, 1,
-1.766683, -0.2382065, -0.588187, 0, 0, 0, 1, 1,
-1.705875, 0.6118012, -2.226865, 0, 0, 0, 1, 1,
-1.683207, -0.1612544, -0.6109895, 0, 0, 0, 1, 1,
-1.67867, -1.043652, -0.9536854, 1, 1, 1, 1, 1,
-1.670538, -0.07766274, -3.102779, 1, 1, 1, 1, 1,
-1.668962, 0.7854049, -1.694727, 1, 1, 1, 1, 1,
-1.663973, -1.801974, -1.415145, 1, 1, 1, 1, 1,
-1.649113, 1.453468, -0.2545019, 1, 1, 1, 1, 1,
-1.635645, 0.5966122, -0.9048644, 1, 1, 1, 1, 1,
-1.594985, -0.5017176, -1.616031, 1, 1, 1, 1, 1,
-1.591023, 0.9139819, -0.8792557, 1, 1, 1, 1, 1,
-1.585154, 1.897845, 1.217466, 1, 1, 1, 1, 1,
-1.58433, -0.3827169, -1.40081, 1, 1, 1, 1, 1,
-1.54536, 0.3371144, -1.392905, 1, 1, 1, 1, 1,
-1.538588, -1.814707, -2.621418, 1, 1, 1, 1, 1,
-1.531663, 0.7861028, -0.1732175, 1, 1, 1, 1, 1,
-1.529976, 1.195475, -2.999521, 1, 1, 1, 1, 1,
-1.524905, -0.4784007, -1.550498, 1, 1, 1, 1, 1,
-1.52214, 0.1586702, -1.763746, 0, 0, 1, 1, 1,
-1.506874, -1.586013, -3.847595, 1, 0, 0, 1, 1,
-1.504924, 0.06572329, -3.430146, 1, 0, 0, 1, 1,
-1.501788, 0.5830703, -2.210932, 1, 0, 0, 1, 1,
-1.480159, -0.5263994, 0.0246208, 1, 0, 0, 1, 1,
-1.470016, -0.2936086, 0.00905181, 1, 0, 0, 1, 1,
-1.469677, 0.4613579, -1.194942, 0, 0, 0, 1, 1,
-1.468759, 1.94555, 0.07759486, 0, 0, 0, 1, 1,
-1.468242, 0.3105478, -3.886853, 0, 0, 0, 1, 1,
-1.462564, -0.6347895, -1.645877, 0, 0, 0, 1, 1,
-1.460725, 0.2406106, -0.850314, 0, 0, 0, 1, 1,
-1.456366, -0.9805432, -0.3280774, 0, 0, 0, 1, 1,
-1.454578, 1.530462, -2.203038, 0, 0, 0, 1, 1,
-1.453654, -0.5670667, -3.080561, 1, 1, 1, 1, 1,
-1.437024, -2.67651, -2.409032, 1, 1, 1, 1, 1,
-1.430262, -0.3719257, -1.473808, 1, 1, 1, 1, 1,
-1.426487, -0.05195586, -0.206056, 1, 1, 1, 1, 1,
-1.419218, -0.8074013, -1.955958, 1, 1, 1, 1, 1,
-1.418178, -1.887777, -3.645645, 1, 1, 1, 1, 1,
-1.411123, 1.285461, -1.576225, 1, 1, 1, 1, 1,
-1.403848, 0.5065595, -1.349436, 1, 1, 1, 1, 1,
-1.402863, -0.7622418, -2.48104, 1, 1, 1, 1, 1,
-1.378425, 0.7346236, -1.0754, 1, 1, 1, 1, 1,
-1.374913, 0.1500217, -2.002608, 1, 1, 1, 1, 1,
-1.371052, 0.4758126, -2.229681, 1, 1, 1, 1, 1,
-1.37104, 1.430564, 0.8544011, 1, 1, 1, 1, 1,
-1.3693, 1.996237, -0.1298445, 1, 1, 1, 1, 1,
-1.368891, 1.362145, 0.2801426, 1, 1, 1, 1, 1,
-1.352658, -1.078265, -2.310134, 0, 0, 1, 1, 1,
-1.346671, 0.3219888, -2.999331, 1, 0, 0, 1, 1,
-1.34167, 1.082653, -0.3791696, 1, 0, 0, 1, 1,
-1.340072, -0.5760975, -1.245633, 1, 0, 0, 1, 1,
-1.339303, -0.9730849, -3.24619, 1, 0, 0, 1, 1,
-1.337913, 0.1980662, -1.047837, 1, 0, 0, 1, 1,
-1.335285, 0.6932639, 0.8352399, 0, 0, 0, 1, 1,
-1.324669, 0.1787132, 1.203648, 0, 0, 0, 1, 1,
-1.318166, -1.087976, -3.437329, 0, 0, 0, 1, 1,
-1.315035, -0.6707965, -2.005256, 0, 0, 0, 1, 1,
-1.313718, -1.705868, -0.916084, 0, 0, 0, 1, 1,
-1.302003, 1.49165, -1.229617, 0, 0, 0, 1, 1,
-1.282001, 0.4816566, -0.4427487, 0, 0, 0, 1, 1,
-1.276703, 0.005556591, -2.305659, 1, 1, 1, 1, 1,
-1.274688, -1.474217, -2.800333, 1, 1, 1, 1, 1,
-1.272584, 0.2944286, -0.9411978, 1, 1, 1, 1, 1,
-1.267627, -0.08591656, -2.391931, 1, 1, 1, 1, 1,
-1.258393, -0.2477582, -1.791148, 1, 1, 1, 1, 1,
-1.25628, -0.2935766, -1.803533, 1, 1, 1, 1, 1,
-1.25056, -1.627199, -2.743409, 1, 1, 1, 1, 1,
-1.249945, -0.2471078, -1.600907, 1, 1, 1, 1, 1,
-1.249934, 0.5051233, 0.4983777, 1, 1, 1, 1, 1,
-1.249716, 1.339846, -1.741487, 1, 1, 1, 1, 1,
-1.245726, -2.692897, -2.120079, 1, 1, 1, 1, 1,
-1.243864, -2.173193, -0.3616824, 1, 1, 1, 1, 1,
-1.22466, 0.5283309, -0.6146425, 1, 1, 1, 1, 1,
-1.222131, 1.054249, -0.7265742, 1, 1, 1, 1, 1,
-1.222006, -0.01982227, -1.078426, 1, 1, 1, 1, 1,
-1.219984, -0.8153288, -2.636692, 0, 0, 1, 1, 1,
-1.217403, -0.851337, -0.9890197, 1, 0, 0, 1, 1,
-1.214917, -1.157902, -2.972567, 1, 0, 0, 1, 1,
-1.213876, -1.744425, -3.699641, 1, 0, 0, 1, 1,
-1.20896, 0.3087606, -0.6913387, 1, 0, 0, 1, 1,
-1.193118, -0.04087862, -0.939078, 1, 0, 0, 1, 1,
-1.186484, -0.1156601, -1.644731, 0, 0, 0, 1, 1,
-1.18627, -1.510486, -1.810624, 0, 0, 0, 1, 1,
-1.180869, 0.4488063, 0.2837569, 0, 0, 0, 1, 1,
-1.179369, -0.03662311, -1.294626, 0, 0, 0, 1, 1,
-1.162153, -0.7281839, -2.767474, 0, 0, 0, 1, 1,
-1.160508, -0.06168085, -1.614737, 0, 0, 0, 1, 1,
-1.157942, 0.1538413, -0.9909035, 0, 0, 0, 1, 1,
-1.154465, 0.1100286, -0.603492, 1, 1, 1, 1, 1,
-1.153442, -0.6974648, -0.9582491, 1, 1, 1, 1, 1,
-1.151117, 0.3355155, -1.391298, 1, 1, 1, 1, 1,
-1.145288, -0.9961877, -3.13997, 1, 1, 1, 1, 1,
-1.133694, 0.5539782, -1.973638, 1, 1, 1, 1, 1,
-1.121818, 1.326391, 0.5840307, 1, 1, 1, 1, 1,
-1.12124, 1.462044, -0.8211749, 1, 1, 1, 1, 1,
-1.120888, -0.8313956, -1.700505, 1, 1, 1, 1, 1,
-1.111413, -1.0178, 0.6007444, 1, 1, 1, 1, 1,
-1.107968, 1.177882, -0.8344777, 1, 1, 1, 1, 1,
-1.097561, -0.6028196, -2.242249, 1, 1, 1, 1, 1,
-1.089285, 0.5169345, 0.8576873, 1, 1, 1, 1, 1,
-1.088008, -0.6857493, -2.157108, 1, 1, 1, 1, 1,
-1.083873, 0.3716059, -1.407069, 1, 1, 1, 1, 1,
-1.078184, -2.154696, -1.657689, 1, 1, 1, 1, 1,
-1.077916, -0.1123022, -1.136274, 0, 0, 1, 1, 1,
-1.070138, 0.919721, -1.908452, 1, 0, 0, 1, 1,
-1.069792, 0.58024, -0.5937358, 1, 0, 0, 1, 1,
-1.066809, 0.4370247, -1.27951, 1, 0, 0, 1, 1,
-1.059196, 2.104086, 0.9077912, 1, 0, 0, 1, 1,
-1.05845, -0.6383011, 0.3135023, 1, 0, 0, 1, 1,
-1.058023, 0.3334413, 1.295054, 0, 0, 0, 1, 1,
-1.05646, -0.7454088, -2.928619, 0, 0, 0, 1, 1,
-1.055481, 0.6899277, -0.2590788, 0, 0, 0, 1, 1,
-1.055197, 0.01796524, -0.5748945, 0, 0, 0, 1, 1,
-1.050952, -2.412642, -2.063699, 0, 0, 0, 1, 1,
-1.047293, 0.9173771, -2.003919, 0, 0, 0, 1, 1,
-1.042268, -0.1099428, -0.1790237, 0, 0, 0, 1, 1,
-1.039831, -0.008947969, -1.31638, 1, 1, 1, 1, 1,
-1.033888, 0.9574764, -1.341835, 1, 1, 1, 1, 1,
-1.033005, -0.01684321, -1.962903, 1, 1, 1, 1, 1,
-1.032754, -0.9717049, -2.896743, 1, 1, 1, 1, 1,
-1.030863, 0.4442235, -4.260942, 1, 1, 1, 1, 1,
-1.030775, -0.3821255, -1.410805, 1, 1, 1, 1, 1,
-1.024601, 1.862597, 1.278082, 1, 1, 1, 1, 1,
-1.013601, 1.820444, 0.5413736, 1, 1, 1, 1, 1,
-1.008798, -0.1808573, -2.293919, 1, 1, 1, 1, 1,
-1.004322, -1.778114, -2.329137, 1, 1, 1, 1, 1,
-0.9965852, -0.5623154, -2.116626, 1, 1, 1, 1, 1,
-0.9956013, 0.6732669, -1.317622, 1, 1, 1, 1, 1,
-0.9942693, -0.8616857, -3.006773, 1, 1, 1, 1, 1,
-0.9941765, -1.796997, -5.380382, 1, 1, 1, 1, 1,
-0.9865248, 0.8287703, -1.655236, 1, 1, 1, 1, 1,
-0.9732857, -0.535909, -1.420562, 0, 0, 1, 1, 1,
-0.9732146, 0.243036, -0.004034191, 1, 0, 0, 1, 1,
-0.9703587, -1.287313, -2.93677, 1, 0, 0, 1, 1,
-0.9699873, 0.2267221, -1.575184, 1, 0, 0, 1, 1,
-0.9656215, 0.1010111, -2.633384, 1, 0, 0, 1, 1,
-0.9530089, 0.5408037, 0.3209864, 1, 0, 0, 1, 1,
-0.9529419, 1.049493, -2.408652, 0, 0, 0, 1, 1,
-0.9513198, -1.440926, -2.574317, 0, 0, 0, 1, 1,
-0.9480695, 0.1086443, -3.649489, 0, 0, 0, 1, 1,
-0.9435058, -0.2614806, -0.8814791, 0, 0, 0, 1, 1,
-0.9345241, 0.6028413, -1.379857, 0, 0, 0, 1, 1,
-0.9326504, 1.822398, 0.4076131, 0, 0, 0, 1, 1,
-0.9310362, -0.3291589, -2.202842, 0, 0, 0, 1, 1,
-0.9295409, 1.092143, 0.6691885, 1, 1, 1, 1, 1,
-0.9248959, -1.630453, -1.305624, 1, 1, 1, 1, 1,
-0.9179429, 1.310832, -1.25932, 1, 1, 1, 1, 1,
-0.9175214, -2.229036, -2.608105, 1, 1, 1, 1, 1,
-0.9149163, -0.1422426, -2.567737, 1, 1, 1, 1, 1,
-0.9111478, -0.03332938, -1.759913, 1, 1, 1, 1, 1,
-0.9084811, -0.553421, -1.680316, 1, 1, 1, 1, 1,
-0.9069675, -0.7723479, -1.252728, 1, 1, 1, 1, 1,
-0.9038562, 1.069576, -0.2115614, 1, 1, 1, 1, 1,
-0.9011257, 0.2054519, 0.9234524, 1, 1, 1, 1, 1,
-0.8997855, 0.3815616, -0.3743342, 1, 1, 1, 1, 1,
-0.8995577, 0.2903117, -1.662375, 1, 1, 1, 1, 1,
-0.8925847, 0.2126623, -1.406304, 1, 1, 1, 1, 1,
-0.8905833, -0.6070404, -0.5711932, 1, 1, 1, 1, 1,
-0.889932, -0.5923864, -2.183126, 1, 1, 1, 1, 1,
-0.8856081, 2.459919, -0.7222728, 0, 0, 1, 1, 1,
-0.8842249, 0.243144, -1.973805, 1, 0, 0, 1, 1,
-0.8839775, -1.790184, -3.323338, 1, 0, 0, 1, 1,
-0.8794523, -0.8404774, -1.257157, 1, 0, 0, 1, 1,
-0.8781544, 0.04428968, -0.4240878, 1, 0, 0, 1, 1,
-0.8749414, -0.323062, -1.94985, 1, 0, 0, 1, 1,
-0.8738486, 0.5186648, 1.25063, 0, 0, 0, 1, 1,
-0.8703734, -1.466724, -0.7401708, 0, 0, 0, 1, 1,
-0.8685448, 0.1090053, -2.86167, 0, 0, 0, 1, 1,
-0.8668244, 0.7226875, -1.49401, 0, 0, 0, 1, 1,
-0.8567745, 1.220925, -0.2935568, 0, 0, 0, 1, 1,
-0.8545119, -0.6893757, -1.326379, 0, 0, 0, 1, 1,
-0.8470715, 0.5628433, 0.2619941, 0, 0, 0, 1, 1,
-0.8448257, 0.1367385, -2.004837, 1, 1, 1, 1, 1,
-0.8390779, 0.4892927, 0.05515721, 1, 1, 1, 1, 1,
-0.8375251, 1.267228, -0.3364919, 1, 1, 1, 1, 1,
-0.8325429, 1.877612, -0.7880175, 1, 1, 1, 1, 1,
-0.8294789, 0.2585307, 0.694702, 1, 1, 1, 1, 1,
-0.8229166, -0.5711797, -1.238168, 1, 1, 1, 1, 1,
-0.8202482, 0.3298973, -1.711408, 1, 1, 1, 1, 1,
-0.8146833, -1.085749, -1.821035, 1, 1, 1, 1, 1,
-0.8127035, -1.234303, -1.140078, 1, 1, 1, 1, 1,
-0.8081779, -1.851636, -3.607094, 1, 1, 1, 1, 1,
-0.8049454, 1.09014, 0.7622147, 1, 1, 1, 1, 1,
-0.8020737, -0.3981892, -2.718531, 1, 1, 1, 1, 1,
-0.8018029, -0.1820018, -1.500816, 1, 1, 1, 1, 1,
-0.8011253, -0.1342743, -3.206542, 1, 1, 1, 1, 1,
-0.8006356, 1.490262, -0.6441778, 1, 1, 1, 1, 1,
-0.7967804, -0.5984095, -0.4383821, 0, 0, 1, 1, 1,
-0.794738, 0.2467585, -3.886814, 1, 0, 0, 1, 1,
-0.7925244, 1.14706, -1.28333, 1, 0, 0, 1, 1,
-0.7923486, -1.128366, -1.679931, 1, 0, 0, 1, 1,
-0.786124, -1.322338, -2.169925, 1, 0, 0, 1, 1,
-0.7853745, 0.5211485, 0.1638546, 1, 0, 0, 1, 1,
-0.7843437, 0.08406386, -0.9218703, 0, 0, 0, 1, 1,
-0.7831287, -0.1722584, -1.386796, 0, 0, 0, 1, 1,
-0.7794052, -0.6447018, -2.029562, 0, 0, 0, 1, 1,
-0.7757614, -0.5454499, -1.305941, 0, 0, 0, 1, 1,
-0.7740109, -0.7486333, -2.505782, 0, 0, 0, 1, 1,
-0.77336, -0.2966499, -2.935586, 0, 0, 0, 1, 1,
-0.7707489, 0.1350181, -1.601741, 0, 0, 0, 1, 1,
-0.7565367, 0.2773645, -2.060447, 1, 1, 1, 1, 1,
-0.7500503, 0.3299105, -0.9190785, 1, 1, 1, 1, 1,
-0.7500394, -0.9363979, -3.257646, 1, 1, 1, 1, 1,
-0.74949, -1.8492, -4.443012, 1, 1, 1, 1, 1,
-0.7481622, -1.032958, -2.590968, 1, 1, 1, 1, 1,
-0.7433346, -0.8583997, -2.282324, 1, 1, 1, 1, 1,
-0.7394648, -0.4043107, -3.830089, 1, 1, 1, 1, 1,
-0.7386144, 2.15632, -1.038802, 1, 1, 1, 1, 1,
-0.7374051, -0.001798862, -2.699605, 1, 1, 1, 1, 1,
-0.7326896, 1.308868, -1.188794, 1, 1, 1, 1, 1,
-0.7302188, 0.5290549, 1.287178, 1, 1, 1, 1, 1,
-0.7280709, -0.4571947, -2.387449, 1, 1, 1, 1, 1,
-0.7268967, 1.547359, -1.266095, 1, 1, 1, 1, 1,
-0.726544, 0.4670169, -1.191345, 1, 1, 1, 1, 1,
-0.7233717, 0.7883247, 0.5208933, 1, 1, 1, 1, 1,
-0.7230572, -0.6885188, -1.768051, 0, 0, 1, 1, 1,
-0.7227291, -1.122191, -2.684085, 1, 0, 0, 1, 1,
-0.7131606, -0.3425633, -1.276823, 1, 0, 0, 1, 1,
-0.7100625, -1.194047, -2.57427, 1, 0, 0, 1, 1,
-0.7065696, 0.4610551, -1.736299, 1, 0, 0, 1, 1,
-0.7024822, -2.200019, -2.56042, 1, 0, 0, 1, 1,
-0.6972268, 0.1499793, -0.7819332, 0, 0, 0, 1, 1,
-0.6937757, -0.7020072, -3.330472, 0, 0, 0, 1, 1,
-0.690751, 0.794098, -1.91677, 0, 0, 0, 1, 1,
-0.6885262, 0.8891959, -0.6592614, 0, 0, 0, 1, 1,
-0.6819362, -1.228225, -3.730776, 0, 0, 0, 1, 1,
-0.6796178, -0.6061986, -1.504961, 0, 0, 0, 1, 1,
-0.6783509, 1.273936, -1.530281, 0, 0, 0, 1, 1,
-0.6778641, -0.3987598, -1.637912, 1, 1, 1, 1, 1,
-0.668152, -0.2226831, -2.25025, 1, 1, 1, 1, 1,
-0.6662239, 0.04187155, -1.319597, 1, 1, 1, 1, 1,
-0.6608232, 0.006322613, -0.3295924, 1, 1, 1, 1, 1,
-0.6596925, 0.05701775, -1.666686, 1, 1, 1, 1, 1,
-0.6531464, -0.1745044, -1.609664, 1, 1, 1, 1, 1,
-0.6526252, -0.6906372, -1.894783, 1, 1, 1, 1, 1,
-0.6496702, -0.5489141, -1.835025, 1, 1, 1, 1, 1,
-0.6470097, -0.9100684, -4.010881, 1, 1, 1, 1, 1,
-0.6428991, -0.8594474, -2.085629, 1, 1, 1, 1, 1,
-0.624574, -0.7404918, -3.199028, 1, 1, 1, 1, 1,
-0.6239034, 0.8438997, -1.789602, 1, 1, 1, 1, 1,
-0.6196638, 1.273584, -2.984257, 1, 1, 1, 1, 1,
-0.6191437, 0.1881657, -1.604751, 1, 1, 1, 1, 1,
-0.6156368, -0.3425368, -1.207127, 1, 1, 1, 1, 1,
-0.6127202, -1.431539, -1.694578, 0, 0, 1, 1, 1,
-0.6065972, -0.05770708, -2.052034, 1, 0, 0, 1, 1,
-0.6043919, 0.8507244, -0.7056513, 1, 0, 0, 1, 1,
-0.6004851, 0.6899733, -1.327684, 1, 0, 0, 1, 1,
-0.5936812, -1.160181, -3.252589, 1, 0, 0, 1, 1,
-0.5879438, 0.274232, -1.627115, 1, 0, 0, 1, 1,
-0.5856236, 0.4249344, -2.516395, 0, 0, 0, 1, 1,
-0.5828723, -1.01438, -4.198864, 0, 0, 0, 1, 1,
-0.5809378, 0.8833109, -1.375721, 0, 0, 0, 1, 1,
-0.5793445, 1.265275, 0.1294971, 0, 0, 0, 1, 1,
-0.5677296, 1.415222, -0.04896955, 0, 0, 0, 1, 1,
-0.5663887, -0.02703544, 0.5073118, 0, 0, 0, 1, 1,
-0.5650887, -0.02586485, -2.985442, 0, 0, 0, 1, 1,
-0.5630806, 1.184503, -1.515742, 1, 1, 1, 1, 1,
-0.5613083, 0.7189429, -0.8616818, 1, 1, 1, 1, 1,
-0.5605456, -0.4995222, -3.291874, 1, 1, 1, 1, 1,
-0.5595971, -0.7276622, -1.691102, 1, 1, 1, 1, 1,
-0.5581003, 0.2981339, -0.147319, 1, 1, 1, 1, 1,
-0.557682, 0.7464433, -0.8203406, 1, 1, 1, 1, 1,
-0.5538508, -1.015544, -3.430764, 1, 1, 1, 1, 1,
-0.5531666, 0.6089427, -0.6813474, 1, 1, 1, 1, 1,
-0.5518236, -0.5252151, -3.683056, 1, 1, 1, 1, 1,
-0.5486666, 1.330097, -0.5522888, 1, 1, 1, 1, 1,
-0.5460898, -1.212078, -3.26216, 1, 1, 1, 1, 1,
-0.5353031, -0.8031562, -1.123491, 1, 1, 1, 1, 1,
-0.5343515, 1.482874, 1.124769, 1, 1, 1, 1, 1,
-0.5342888, 1.352376, 0.8920701, 1, 1, 1, 1, 1,
-0.5302905, 0.6033676, -0.3640476, 1, 1, 1, 1, 1,
-0.5301805, -1.909855, -1.251449, 0, 0, 1, 1, 1,
-0.5301214, 1.351032, -1.400022, 1, 0, 0, 1, 1,
-0.5293303, -0.3135953, -2.157863, 1, 0, 0, 1, 1,
-0.5201262, -0.2933694, -1.845276, 1, 0, 0, 1, 1,
-0.5088458, -1.23994, -4.905106, 1, 0, 0, 1, 1,
-0.507199, -1.233813, -1.675738, 1, 0, 0, 1, 1,
-0.506428, 0.4092315, -0.6441286, 0, 0, 0, 1, 1,
-0.5053059, -0.0729024, -0.8415082, 0, 0, 0, 1, 1,
-0.50495, -0.1333541, -1.586284, 0, 0, 0, 1, 1,
-0.5028483, -0.6822416, -2.871273, 0, 0, 0, 1, 1,
-0.5027519, -0.2942356, -2.964068, 0, 0, 0, 1, 1,
-0.4903829, -1.543877, -3.41898, 0, 0, 0, 1, 1,
-0.487374, 0.1860652, -0.8966504, 0, 0, 0, 1, 1,
-0.4868768, 1.060932, 0.170991, 1, 1, 1, 1, 1,
-0.485029, -1.328031, -1.992577, 1, 1, 1, 1, 1,
-0.4669816, -0.4416823, -0.5465877, 1, 1, 1, 1, 1,
-0.4655322, 1.035907, -0.2264604, 1, 1, 1, 1, 1,
-0.4637898, 0.4556177, -1.153807, 1, 1, 1, 1, 1,
-0.4634058, -0.2095664, -2.468324, 1, 1, 1, 1, 1,
-0.4604737, -1.668591, -3.752443, 1, 1, 1, 1, 1,
-0.4538503, 0.5702134, -0.9661555, 1, 1, 1, 1, 1,
-0.4532911, -0.09410119, -2.749899, 1, 1, 1, 1, 1,
-0.450116, -0.7886907, -3.01795, 1, 1, 1, 1, 1,
-0.4493971, 0.4330635, -0.80734, 1, 1, 1, 1, 1,
-0.4479544, -0.248854, -2.867607, 1, 1, 1, 1, 1,
-0.4422277, 0.2219427, -1.334482, 1, 1, 1, 1, 1,
-0.4407157, 1.011944, -0.6982579, 1, 1, 1, 1, 1,
-0.4394574, 2.898617, 1.525526, 1, 1, 1, 1, 1,
-0.4384277, 0.1330407, -1.617545, 0, 0, 1, 1, 1,
-0.4362705, -0.5857095, -3.860121, 1, 0, 0, 1, 1,
-0.4344509, 0.2400903, -2.468493, 1, 0, 0, 1, 1,
-0.4331396, -0.1363849, 0.1113812, 1, 0, 0, 1, 1,
-0.429618, -0.4711783, -2.54279, 1, 0, 0, 1, 1,
-0.4295638, -0.8194954, -2.535776, 1, 0, 0, 1, 1,
-0.4252704, 1.536355, -0.3882372, 0, 0, 0, 1, 1,
-0.4170001, 0.8092823, -0.3932891, 0, 0, 0, 1, 1,
-0.4157837, 2.417305, -0.5855716, 0, 0, 0, 1, 1,
-0.4104924, 0.1132361, -0.3911058, 0, 0, 0, 1, 1,
-0.4086095, 2.309908, 0.7052861, 0, 0, 0, 1, 1,
-0.4012783, -1.022359, -3.159416, 0, 0, 0, 1, 1,
-0.3993441, 2.842458, 0.4803538, 0, 0, 0, 1, 1,
-0.3989912, -0.6076753, -2.876232, 1, 1, 1, 1, 1,
-0.3931752, 0.3601563, -0.8650781, 1, 1, 1, 1, 1,
-0.3931653, -0.7368436, -0.9566402, 1, 1, 1, 1, 1,
-0.3897314, -1.336591, -5.40534, 1, 1, 1, 1, 1,
-0.3890218, 0.1403442, -0.6311432, 1, 1, 1, 1, 1,
-0.3883116, -0.9494322, -1.764833, 1, 1, 1, 1, 1,
-0.3863631, 0.3338771, -0.05614915, 1, 1, 1, 1, 1,
-0.3863561, 1.420923, -0.7153294, 1, 1, 1, 1, 1,
-0.380124, -0.4381342, -1.685025, 1, 1, 1, 1, 1,
-0.3794208, -0.7149799, -2.338643, 1, 1, 1, 1, 1,
-0.3781028, -0.4628128, -2.055406, 1, 1, 1, 1, 1,
-0.3777366, 0.3428737, 0.2399004, 1, 1, 1, 1, 1,
-0.3776466, 1.911051, -0.8991432, 1, 1, 1, 1, 1,
-0.3706973, -2.048576, -2.642397, 1, 1, 1, 1, 1,
-0.368835, 0.152016, -1.26351, 1, 1, 1, 1, 1,
-0.3676541, -0.3193505, -2.708385, 0, 0, 1, 1, 1,
-0.3663996, -0.2835493, -1.843195, 1, 0, 0, 1, 1,
-0.3659103, 0.3672843, -0.4388289, 1, 0, 0, 1, 1,
-0.3615592, -0.01434192, -1.378942, 1, 0, 0, 1, 1,
-0.3567335, 0.9893315, -0.6390682, 1, 0, 0, 1, 1,
-0.3537333, 0.9979603, 0.2672708, 1, 0, 0, 1, 1,
-0.3526023, 1.831703, 0.2468765, 0, 0, 0, 1, 1,
-0.3485901, -1.038411, -2.31955, 0, 0, 0, 1, 1,
-0.3450389, -0.1295246, -2.361558, 0, 0, 0, 1, 1,
-0.3443944, 0.1496056, -1.888094, 0, 0, 0, 1, 1,
-0.3406924, -1.904393, -2.57495, 0, 0, 0, 1, 1,
-0.335929, -0.5175203, -1.49445, 0, 0, 0, 1, 1,
-0.3350381, -0.9740087, -3.992527, 0, 0, 0, 1, 1,
-0.3303027, -1.711001, -3.611577, 1, 1, 1, 1, 1,
-0.3267212, -0.5529822, -3.173147, 1, 1, 1, 1, 1,
-0.3259944, 0.4254603, -2.678613, 1, 1, 1, 1, 1,
-0.319027, -0.847824, -3.881318, 1, 1, 1, 1, 1,
-0.3172386, -0.07723898, -1.357398, 1, 1, 1, 1, 1,
-0.3120878, -0.8848042, -2.765435, 1, 1, 1, 1, 1,
-0.3090943, 0.4192316, -0.6143034, 1, 1, 1, 1, 1,
-0.3080178, 1.254895, 0.8691547, 1, 1, 1, 1, 1,
-0.3058034, 0.05624702, -1.545689, 1, 1, 1, 1, 1,
-0.3038361, -1.137536, -3.428396, 1, 1, 1, 1, 1,
-0.3030741, -0.7934863, -1.463653, 1, 1, 1, 1, 1,
-0.3029437, 0.07409172, -2.876876, 1, 1, 1, 1, 1,
-0.3028129, 0.1564678, -0.379033, 1, 1, 1, 1, 1,
-0.3002361, 1.297987, 0.7266793, 1, 1, 1, 1, 1,
-0.3000561, 0.6977882, -0.2877056, 1, 1, 1, 1, 1,
-0.2944727, 1.505705, 0.3558839, 0, 0, 1, 1, 1,
-0.2941499, 1.865215, 0.3116341, 1, 0, 0, 1, 1,
-0.2908198, -2.69785, -3.690257, 1, 0, 0, 1, 1,
-0.2871717, 1.60519, -0.3971134, 1, 0, 0, 1, 1,
-0.2868573, -0.088849, -0.3393689, 1, 0, 0, 1, 1,
-0.2868228, -1.103952, -3.638496, 1, 0, 0, 1, 1,
-0.2849372, -0.01103661, -1.76709, 0, 0, 0, 1, 1,
-0.2841927, 0.8485632, -0.8056386, 0, 0, 0, 1, 1,
-0.2772672, 0.9399341, -0.5685574, 0, 0, 0, 1, 1,
-0.2760142, -0.01713349, -0.517516, 0, 0, 0, 1, 1,
-0.2756834, -0.7534308, -3.672051, 0, 0, 0, 1, 1,
-0.2737404, 0.720629, 0.6241141, 0, 0, 0, 1, 1,
-0.2662529, -0.9561337, -3.589948, 0, 0, 0, 1, 1,
-0.2654414, 1.833992, -0.6661173, 1, 1, 1, 1, 1,
-0.2576398, 1.299574, 0.1932942, 1, 1, 1, 1, 1,
-0.2550444, 0.5902458, 0.1330394, 1, 1, 1, 1, 1,
-0.2548754, -0.1548929, -1.107695, 1, 1, 1, 1, 1,
-0.2548542, -0.9438659, -2.842625, 1, 1, 1, 1, 1,
-0.2531634, -1.013746, -3.950849, 1, 1, 1, 1, 1,
-0.2491098, 2.807215, 0.1388677, 1, 1, 1, 1, 1,
-0.2483485, -0.4832998, -2.858327, 1, 1, 1, 1, 1,
-0.2383686, 0.2266418, -2.66956, 1, 1, 1, 1, 1,
-0.2371864, 0.4530556, -0.5124163, 1, 1, 1, 1, 1,
-0.2362708, 0.2532333, 0.1328236, 1, 1, 1, 1, 1,
-0.2225291, 0.1550143, -1.703634, 1, 1, 1, 1, 1,
-0.2194126, -0.6979141, -3.455715, 1, 1, 1, 1, 1,
-0.214393, -1.12578, -4.384725, 1, 1, 1, 1, 1,
-0.2133815, 2.543295, -0.4023405, 1, 1, 1, 1, 1,
-0.2078873, -0.7594387, -2.328422, 0, 0, 1, 1, 1,
-0.2077648, 0.8756459, 0.07820553, 1, 0, 0, 1, 1,
-0.2043065, -0.7414778, -2.172123, 1, 0, 0, 1, 1,
-0.1986035, -1.008292, -2.825409, 1, 0, 0, 1, 1,
-0.1960932, 0.4772731, 0.2194058, 1, 0, 0, 1, 1,
-0.1915677, 0.4488913, -1.246675, 1, 0, 0, 1, 1,
-0.1910599, -0.09215803, -2.599641, 0, 0, 0, 1, 1,
-0.1896773, -0.2551524, -1.968083, 0, 0, 0, 1, 1,
-0.1793988, -0.4953442, -2.830729, 0, 0, 0, 1, 1,
-0.1740571, 0.2570488, -0.05196625, 0, 0, 0, 1, 1,
-0.1715954, 0.9838707, 0.5305625, 0, 0, 0, 1, 1,
-0.1693909, 0.5559884, -0.5012988, 0, 0, 0, 1, 1,
-0.1688092, -1.31083, -3.390237, 0, 0, 0, 1, 1,
-0.1656637, 0.4540515, -0.09721556, 1, 1, 1, 1, 1,
-0.163486, -0.9443793, -1.690115, 1, 1, 1, 1, 1,
-0.1627369, -0.6984702, -1.109108, 1, 1, 1, 1, 1,
-0.1625026, 0.1091201, 0.652207, 1, 1, 1, 1, 1,
-0.1617528, 0.7350633, -0.1144808, 1, 1, 1, 1, 1,
-0.1598799, 2.282542, 0.842586, 1, 1, 1, 1, 1,
-0.1596065, 0.2826466, -1.849706, 1, 1, 1, 1, 1,
-0.1590247, -0.4682046, -3.189618, 1, 1, 1, 1, 1,
-0.1573366, 0.4421125, -0.7151368, 1, 1, 1, 1, 1,
-0.1566633, 0.01298814, -1.779569, 1, 1, 1, 1, 1,
-0.1528067, -0.7907819, -2.8587, 1, 1, 1, 1, 1,
-0.1398849, 1.254187, -0.3008568, 1, 1, 1, 1, 1,
-0.1367847, 0.4844391, -0.4994763, 1, 1, 1, 1, 1,
-0.1348705, -1.019846, -1.648995, 1, 1, 1, 1, 1,
-0.1179709, 0.2207449, 1.202335, 1, 1, 1, 1, 1,
-0.1135552, 2.236684, 1.308074, 0, 0, 1, 1, 1,
-0.1102406, 0.4699002, -0.3789968, 1, 0, 0, 1, 1,
-0.1099015, 0.608519, 0.06381534, 1, 0, 0, 1, 1,
-0.1093667, 0.5591477, 0.6475351, 1, 0, 0, 1, 1,
-0.1071817, 0.855544, -0.21627, 1, 0, 0, 1, 1,
-0.104079, 0.5281894, -0.2017036, 1, 0, 0, 1, 1,
-0.09658292, 0.2971449, -1.403724, 0, 0, 0, 1, 1,
-0.0938345, -0.767466, -2.387793, 0, 0, 0, 1, 1,
-0.08836605, 1.157082, 0.2140751, 0, 0, 0, 1, 1,
-0.08394529, -0.1052397, -2.857081, 0, 0, 0, 1, 1,
-0.08391123, -0.4131513, -1.751701, 0, 0, 0, 1, 1,
-0.08279925, -0.3500102, -3.878942, 0, 0, 0, 1, 1,
-0.07927941, -0.07585172, -0.5946782, 0, 0, 0, 1, 1,
-0.07744396, 0.1575241, -0.6386338, 1, 1, 1, 1, 1,
-0.07613135, 0.02585609, -1.323573, 1, 1, 1, 1, 1,
-0.07032013, 0.564271, -1.01494, 1, 1, 1, 1, 1,
-0.06991368, 0.6306323, -0.9822185, 1, 1, 1, 1, 1,
-0.06806266, 0.2294871, 0.4021278, 1, 1, 1, 1, 1,
-0.06664141, 0.6377287, 0.2644613, 1, 1, 1, 1, 1,
-0.06573723, 0.2101956, -0.8176008, 1, 1, 1, 1, 1,
-0.06472567, -0.4545017, -1.821885, 1, 1, 1, 1, 1,
-0.06384059, -0.7887058, -2.966424, 1, 1, 1, 1, 1,
-0.05909335, 1.010599, -0.1349759, 1, 1, 1, 1, 1,
-0.05903136, 0.8976049, 0.2490451, 1, 1, 1, 1, 1,
-0.0582572, 2.58473, 1.548, 1, 1, 1, 1, 1,
-0.05636242, 0.67703, -0.7752306, 1, 1, 1, 1, 1,
-0.0537024, 0.3798617, -0.6663643, 1, 1, 1, 1, 1,
-0.0479456, 0.7597397, 0.7341694, 1, 1, 1, 1, 1,
-0.04201252, -1.283977, -4.270728, 0, 0, 1, 1, 1,
-0.04145517, -0.09929641, -1.858815, 1, 0, 0, 1, 1,
-0.04026848, -0.2594719, -3.407155, 1, 0, 0, 1, 1,
-0.03825817, 0.7438391, 1.129855, 1, 0, 0, 1, 1,
-0.03505122, 0.6654416, -0.5620789, 1, 0, 0, 1, 1,
-0.03223606, -0.8713252, -5.603323, 1, 0, 0, 1, 1,
-0.03019868, -0.9072343, -1.985058, 0, 0, 0, 1, 1,
-0.02334837, -0.4400201, -3.921006, 0, 0, 0, 1, 1,
-0.02047915, -0.9065982, -2.879878, 0, 0, 0, 1, 1,
-0.0171326, -0.4515483, -4.018377, 0, 0, 0, 1, 1,
-0.01514788, 0.7033424, 0.6618727, 0, 0, 0, 1, 1,
-0.01130512, -0.4674552, -2.302754, 0, 0, 0, 1, 1,
-0.008193438, -0.0666139, -1.382053, 0, 0, 0, 1, 1,
-0.002765933, 0.1672494, 0.918015, 1, 1, 1, 1, 1,
-0.002309399, 0.3090109, -0.2904514, 1, 1, 1, 1, 1,
0.002711586, 0.5057873, 0.7509967, 1, 1, 1, 1, 1,
0.003041246, -0.2873839, 5.005795, 1, 1, 1, 1, 1,
0.003585989, 2.180243, -0.1271335, 1, 1, 1, 1, 1,
0.004000951, -0.3378245, 2.650074, 1, 1, 1, 1, 1,
0.01083764, -0.7443119, 3.261898, 1, 1, 1, 1, 1,
0.01612589, -0.4074226, 3.756624, 1, 1, 1, 1, 1,
0.01800955, -0.0526645, 0.625255, 1, 1, 1, 1, 1,
0.01878992, -1.028566, 4.517433, 1, 1, 1, 1, 1,
0.02541075, -0.4830284, 3.150886, 1, 1, 1, 1, 1,
0.02582005, -0.08923049, 2.078084, 1, 1, 1, 1, 1,
0.02836851, -0.6301962, 4.922565, 1, 1, 1, 1, 1,
0.03214684, 0.4013306, 1.742024, 1, 1, 1, 1, 1,
0.03381212, -0.5856112, 4.625538, 1, 1, 1, 1, 1,
0.034771, 0.5915204, 1.155691, 0, 0, 1, 1, 1,
0.03539037, 2.286228, -1.621716, 1, 0, 0, 1, 1,
0.03549907, -0.5785241, 2.890997, 1, 0, 0, 1, 1,
0.03563824, 0.7562987, 0.4799243, 1, 0, 0, 1, 1,
0.03591119, 0.6946549, 0.3448221, 1, 0, 0, 1, 1,
0.03825072, -1.681448, 4.007377, 1, 0, 0, 1, 1,
0.03862974, -0.6512823, 2.53611, 0, 0, 0, 1, 1,
0.03916804, -0.9649576, 3.47841, 0, 0, 0, 1, 1,
0.04230528, 1.085848, -0.2151849, 0, 0, 0, 1, 1,
0.04586054, 0.6301748, -0.3317844, 0, 0, 0, 1, 1,
0.04664653, -0.1176754, 2.518433, 0, 0, 0, 1, 1,
0.04722616, 1.333654, -0.4138002, 0, 0, 0, 1, 1,
0.05033986, -0.09784198, 1.564551, 0, 0, 0, 1, 1,
0.0562189, -0.4192083, 3.540146, 1, 1, 1, 1, 1,
0.05814283, 1.205553, -0.6275467, 1, 1, 1, 1, 1,
0.06037313, 1.179388, 0.6120831, 1, 1, 1, 1, 1,
0.06179743, 0.5156331, 0.5578122, 1, 1, 1, 1, 1,
0.0648162, -0.437186, 3.044282, 1, 1, 1, 1, 1,
0.06507029, -0.1947961, 0.7239578, 1, 1, 1, 1, 1,
0.06667739, 0.6402375, -0.2613739, 1, 1, 1, 1, 1,
0.06774032, 1.897061, -0.9757059, 1, 1, 1, 1, 1,
0.07548714, -0.4770741, 2.928337, 1, 1, 1, 1, 1,
0.07793225, 0.6771873, 0.5976238, 1, 1, 1, 1, 1,
0.08040901, -0.4287839, 0.4095267, 1, 1, 1, 1, 1,
0.08315631, -1.59862, 4.062694, 1, 1, 1, 1, 1,
0.08429362, -0.3696911, 3.69871, 1, 1, 1, 1, 1,
0.08632832, -0.7979274, 2.642113, 1, 1, 1, 1, 1,
0.0864878, 0.4337467, 0.04219047, 1, 1, 1, 1, 1,
0.08952224, 0.01011014, 2.593922, 0, 0, 1, 1, 1,
0.08992673, -0.526526, 3.854475, 1, 0, 0, 1, 1,
0.09006616, 0.03480101, 0.3875801, 1, 0, 0, 1, 1,
0.09088247, -0.6230667, 3.840849, 1, 0, 0, 1, 1,
0.0922571, -0.3395521, 3.560482, 1, 0, 0, 1, 1,
0.09419177, -1.900529, 3.990874, 1, 0, 0, 1, 1,
0.0979633, 1.123081, -1.176792, 0, 0, 0, 1, 1,
0.09850999, -1.106282, 3.268179, 0, 0, 0, 1, 1,
0.09944598, -0.8702188, 3.009076, 0, 0, 0, 1, 1,
0.1035376, 0.6533257, 1.292847, 0, 0, 0, 1, 1,
0.1035742, 0.5215741, 0.7799262, 0, 0, 0, 1, 1,
0.107203, 1.540291, -0.2368844, 0, 0, 0, 1, 1,
0.1083662, -0.08860573, 1.950661, 0, 0, 0, 1, 1,
0.1088152, -0.02560039, 1.667828, 1, 1, 1, 1, 1,
0.1092828, -1.616338, 2.858197, 1, 1, 1, 1, 1,
0.1093292, 2.302891, 1.448427, 1, 1, 1, 1, 1,
0.1135144, -0.5312301, 2.413384, 1, 1, 1, 1, 1,
0.1168059, 1.031539, 1.732881, 1, 1, 1, 1, 1,
0.1182688, -0.4328622, 1.342588, 1, 1, 1, 1, 1,
0.1257641, -0.9705315, 2.371011, 1, 1, 1, 1, 1,
0.1296961, 0.008676649, 2.088702, 1, 1, 1, 1, 1,
0.1297485, 2.181715, 0.5012482, 1, 1, 1, 1, 1,
0.1315431, -0.5426125, 6.238466, 1, 1, 1, 1, 1,
0.1322618, 1.300581, -1.478894, 1, 1, 1, 1, 1,
0.1323648, -0.5872992, 3.528187, 1, 1, 1, 1, 1,
0.1331551, 0.1512619, 1.601947, 1, 1, 1, 1, 1,
0.1342359, 1.097777, 1.45611, 1, 1, 1, 1, 1,
0.1381586, -2.22595, 2.936731, 1, 1, 1, 1, 1,
0.1431611, -0.8254932, 4.699284, 0, 0, 1, 1, 1,
0.1448324, 0.2695545, 0.02797427, 1, 0, 0, 1, 1,
0.146639, 0.921427, 0.3016953, 1, 0, 0, 1, 1,
0.1483104, 0.6029724, -0.6369743, 1, 0, 0, 1, 1,
0.1522012, -1.675637, 3.601972, 1, 0, 0, 1, 1,
0.155311, 0.1972684, 1.221973, 1, 0, 0, 1, 1,
0.1571063, -0.2424705, 0.8506417, 0, 0, 0, 1, 1,
0.1573901, -1.322308, 2.413248, 0, 0, 0, 1, 1,
0.1645148, 0.6768557, -1.060176, 0, 0, 0, 1, 1,
0.1670657, 0.2858903, 0.9053997, 0, 0, 0, 1, 1,
0.1673988, 1.710472, 1.273735, 0, 0, 0, 1, 1,
0.1696886, 0.9919893, 0.7405772, 0, 0, 0, 1, 1,
0.1739094, -0.302758, 4.572875, 0, 0, 0, 1, 1,
0.1779716, -1.142502, 1.341367, 1, 1, 1, 1, 1,
0.1780237, -0.4310303, 3.67412, 1, 1, 1, 1, 1,
0.1791136, -1.950288, 3.159876, 1, 1, 1, 1, 1,
0.1804067, -0.1193834, 2.046887, 1, 1, 1, 1, 1,
0.1835992, 0.9037096, -0.112293, 1, 1, 1, 1, 1,
0.1873847, 0.7621102, 1.249494, 1, 1, 1, 1, 1,
0.1893424, 0.2863697, 2.199019, 1, 1, 1, 1, 1,
0.1893551, 0.22617, 0.59133, 1, 1, 1, 1, 1,
0.1895487, -0.4666765, 3.485208, 1, 1, 1, 1, 1,
0.1899766, 0.6752952, -0.3968657, 1, 1, 1, 1, 1,
0.1909785, 1.267662, 0.8633181, 1, 1, 1, 1, 1,
0.201105, 0.5865113, 1.247099, 1, 1, 1, 1, 1,
0.2044505, 0.7444353, 1.889722, 1, 1, 1, 1, 1,
0.2065701, -0.1968965, 1.187893, 1, 1, 1, 1, 1,
0.2085463, 1.814938, 0.8645071, 1, 1, 1, 1, 1,
0.2111784, 0.5696238, -0.5597084, 0, 0, 1, 1, 1,
0.2112993, -0.5600644, 1.586481, 1, 0, 0, 1, 1,
0.2113714, 0.9820803, 0.7148184, 1, 0, 0, 1, 1,
0.2116579, -0.9209386, 2.963836, 1, 0, 0, 1, 1,
0.2197818, -0.7210824, 2.849007, 1, 0, 0, 1, 1,
0.2207147, -0.4105716, 3.687456, 1, 0, 0, 1, 1,
0.2210958, -0.8555562, 2.138103, 0, 0, 0, 1, 1,
0.2292236, -0.5992309, 2.619897, 0, 0, 0, 1, 1,
0.2313462, -0.2207575, 2.407457, 0, 0, 0, 1, 1,
0.2344038, -0.6136759, 3.843936, 0, 0, 0, 1, 1,
0.235465, 0.425804, 0.3689314, 0, 0, 0, 1, 1,
0.2377861, 0.1658063, 2.354879, 0, 0, 0, 1, 1,
0.2424169, -0.7448221, 3.710907, 0, 0, 0, 1, 1,
0.2449977, 0.3827832, 0.1425627, 1, 1, 1, 1, 1,
0.2468661, -0.279691, 3.458731, 1, 1, 1, 1, 1,
0.2508512, -0.9641796, 2.484778, 1, 1, 1, 1, 1,
0.2512229, 0.09789667, 2.358757, 1, 1, 1, 1, 1,
0.2522413, -0.1733045, 3.177888, 1, 1, 1, 1, 1,
0.2534369, -1.130996, 2.819706, 1, 1, 1, 1, 1,
0.2543517, -0.2370442, 1.580344, 1, 1, 1, 1, 1,
0.2565757, 0.2073518, 0.8143214, 1, 1, 1, 1, 1,
0.2593281, 0.2141532, 1.544239, 1, 1, 1, 1, 1,
0.2641737, 0.1458797, 1.097531, 1, 1, 1, 1, 1,
0.2681697, -0.1708722, 2.791409, 1, 1, 1, 1, 1,
0.2701989, -0.2807745, 3.400175, 1, 1, 1, 1, 1,
0.2703906, 0.9074013, 0.1759772, 1, 1, 1, 1, 1,
0.2723968, 1.625616, 1.434511, 1, 1, 1, 1, 1,
0.2779085, -0.701867, 2.913464, 1, 1, 1, 1, 1,
0.2787987, 0.6187804, 1.843699, 0, 0, 1, 1, 1,
0.2796234, 0.1912083, 1.461221, 1, 0, 0, 1, 1,
0.2833315, 0.1396822, 2.206239, 1, 0, 0, 1, 1,
0.2890169, 0.08030941, 2.067941, 1, 0, 0, 1, 1,
0.2898841, 1.611128, 0.3622417, 1, 0, 0, 1, 1,
0.2911212, -1.013385, 3.37139, 1, 0, 0, 1, 1,
0.2928605, 0.8763293, 1.6801, 0, 0, 0, 1, 1,
0.2944838, 0.9637852, 1.166285, 0, 0, 0, 1, 1,
0.2961574, -0.5139776, 3.534989, 0, 0, 0, 1, 1,
0.2987423, 0.8079566, -0.5322208, 0, 0, 0, 1, 1,
0.3022366, -0.2914215, 1.612881, 0, 0, 0, 1, 1,
0.3023477, 1.355597, 0.7644697, 0, 0, 0, 1, 1,
0.303158, 1.478013, 0.4851282, 0, 0, 0, 1, 1,
0.3048674, 1.271753, 1.182025, 1, 1, 1, 1, 1,
0.3063276, 0.5039768, -0.1886883, 1, 1, 1, 1, 1,
0.3135653, 1.565703, 0.1291826, 1, 1, 1, 1, 1,
0.3178133, 0.9713291, 0.6180132, 1, 1, 1, 1, 1,
0.3245067, -0.3010253, 1.955464, 1, 1, 1, 1, 1,
0.3268711, 0.03648366, 1.556647, 1, 1, 1, 1, 1,
0.3276496, -2.059761, 3.377152, 1, 1, 1, 1, 1,
0.3276999, -0.1852014, 3.033343, 1, 1, 1, 1, 1,
0.3324816, 1.428225, 0.2465503, 1, 1, 1, 1, 1,
0.3457841, -0.2400211, 1.535757, 1, 1, 1, 1, 1,
0.3461246, 0.1987092, -0.05863028, 1, 1, 1, 1, 1,
0.3500543, -0.3230996, 0.8801634, 1, 1, 1, 1, 1,
0.351028, 0.3730005, 0.1397558, 1, 1, 1, 1, 1,
0.3574641, 1.399311, 0.3948261, 1, 1, 1, 1, 1,
0.3584335, -0.4242525, 3.501231, 1, 1, 1, 1, 1,
0.3627397, -1.306404, 3.916677, 0, 0, 1, 1, 1,
0.3665407, -0.4944604, 1.831532, 1, 0, 0, 1, 1,
0.3675869, 0.7797552, -0.347891, 1, 0, 0, 1, 1,
0.3683114, 0.9516868, 0.8863702, 1, 0, 0, 1, 1,
0.3737387, 0.3614451, 0.5036953, 1, 0, 0, 1, 1,
0.3743892, 0.6873695, 0.5741704, 1, 0, 0, 1, 1,
0.3771592, 0.4565945, -0.3794354, 0, 0, 0, 1, 1,
0.3789812, 0.7471933, 2.261307, 0, 0, 0, 1, 1,
0.3800328, -0.9432777, 2.285454, 0, 0, 0, 1, 1,
0.3808599, -0.6298395, 1.097282, 0, 0, 0, 1, 1,
0.3810898, -0.1234906, 2.927093, 0, 0, 0, 1, 1,
0.3887719, 0.8027993, -0.5658523, 0, 0, 0, 1, 1,
0.3994908, 0.2327261, -0.7395138, 0, 0, 0, 1, 1,
0.4008455, 0.6597431, 2.82378, 1, 1, 1, 1, 1,
0.4121584, -1.164513, 2.906107, 1, 1, 1, 1, 1,
0.4196252, 0.02360974, -0.2679923, 1, 1, 1, 1, 1,
0.4200324, -0.05781241, 2.277277, 1, 1, 1, 1, 1,
0.4220877, 1.200021, -0.3108619, 1, 1, 1, 1, 1,
0.4275571, -0.8992782, 3.005519, 1, 1, 1, 1, 1,
0.427727, 0.9896123, 0.7871626, 1, 1, 1, 1, 1,
0.4279838, -0.5903394, 2.279589, 1, 1, 1, 1, 1,
0.4336657, 0.4287859, 0.5068821, 1, 1, 1, 1, 1,
0.4348542, -1.969568, 4.539543, 1, 1, 1, 1, 1,
0.4353485, -1.446366, 2.210854, 1, 1, 1, 1, 1,
0.4395696, -0.7787573, 1.656532, 1, 1, 1, 1, 1,
0.4397936, -1.447235, 3.866361, 1, 1, 1, 1, 1,
0.4419243, 0.9667321, 0.8784759, 1, 1, 1, 1, 1,
0.4438905, -0.68251, 3.164259, 1, 1, 1, 1, 1,
0.4447778, -1.249897, 3.794264, 0, 0, 1, 1, 1,
0.4455498, -0.8965462, 2.520092, 1, 0, 0, 1, 1,
0.4489112, 0.04064745, 0.930421, 1, 0, 0, 1, 1,
0.4495201, 0.1894642, 1.326838, 1, 0, 0, 1, 1,
0.4561672, -0.2820326, 2.217483, 1, 0, 0, 1, 1,
0.458687, 1.189694, 1.093554, 1, 0, 0, 1, 1,
0.4598768, 0.7671215, 1.437756, 0, 0, 0, 1, 1,
0.462761, 0.2295986, 0.7093918, 0, 0, 0, 1, 1,
0.4665287, -1.768242, 1.687798, 0, 0, 0, 1, 1,
0.467976, -1.166154, 1.525688, 0, 0, 0, 1, 1,
0.4695617, 0.8702409, -0.2560116, 0, 0, 0, 1, 1,
0.4702404, 1.014922, 2.230767, 0, 0, 0, 1, 1,
0.4707832, 0.1932849, 0.5013814, 0, 0, 0, 1, 1,
0.473976, 0.6097089, 1.456482, 1, 1, 1, 1, 1,
0.4745775, -0.1670251, 0.5873235, 1, 1, 1, 1, 1,
0.4747521, 0.385871, 0.7397355, 1, 1, 1, 1, 1,
0.4761744, 0.6313601, 0.0926521, 1, 1, 1, 1, 1,
0.4765446, 1.105358, 0.6669167, 1, 1, 1, 1, 1,
0.4831381, 0.5831426, -1.474954, 1, 1, 1, 1, 1,
0.4841555, -0.5914845, 2.874057, 1, 1, 1, 1, 1,
0.4926457, -1.156454, 2.839526, 1, 1, 1, 1, 1,
0.4943581, 0.4868461, -0.3444502, 1, 1, 1, 1, 1,
0.4962684, 1.518162, -0.07744457, 1, 1, 1, 1, 1,
0.498264, -0.6599507, 2.645761, 1, 1, 1, 1, 1,
0.5013137, -1.74123, 1.63422, 1, 1, 1, 1, 1,
0.5019417, 0.3032451, 2.181987, 1, 1, 1, 1, 1,
0.5019868, 0.140851, 0.8706485, 1, 1, 1, 1, 1,
0.5039978, -0.4165072, 1.451937, 1, 1, 1, 1, 1,
0.5049955, -2.298128, 5.334508, 0, 0, 1, 1, 1,
0.5081853, -1.377771, 2.114792, 1, 0, 0, 1, 1,
0.5101386, -0.4080392, 2.865685, 1, 0, 0, 1, 1,
0.5103902, 0.2806976, 0.3823782, 1, 0, 0, 1, 1,
0.5160733, -0.5346575, 3.314811, 1, 0, 0, 1, 1,
0.516809, 0.09490916, 3.238181, 1, 0, 0, 1, 1,
0.5211093, 1.247483, 0.8184438, 0, 0, 0, 1, 1,
0.52434, -0.0102694, 1.460808, 0, 0, 0, 1, 1,
0.527513, 2.218031, -0.3267285, 0, 0, 0, 1, 1,
0.5299777, -1.173896, 3.929483, 0, 0, 0, 1, 1,
0.5324964, 0.4698295, 0.7793952, 0, 0, 0, 1, 1,
0.5366373, 2.137319, -0.3337503, 0, 0, 0, 1, 1,
0.5396484, 0.8999858, 1.30494, 0, 0, 0, 1, 1,
0.5455387, -0.6029193, 3.035948, 1, 1, 1, 1, 1,
0.5478668, -0.4291735, -0.2622023, 1, 1, 1, 1, 1,
0.5525923, -0.9755181, 2.811459, 1, 1, 1, 1, 1,
0.5547991, -0.05521962, 1.748293, 1, 1, 1, 1, 1,
0.5606475, 0.624316, 1.238822, 1, 1, 1, 1, 1,
0.5615757, -0.08098608, 1.438945, 1, 1, 1, 1, 1,
0.5677357, 0.8887599, 1.198559, 1, 1, 1, 1, 1,
0.569548, 1.02308, 1.124044, 1, 1, 1, 1, 1,
0.5729363, 0.5741572, 1.429993, 1, 1, 1, 1, 1,
0.5745289, 0.07157795, 0.5917157, 1, 1, 1, 1, 1,
0.5757332, 2.07701, 0.9816318, 1, 1, 1, 1, 1,
0.5759207, 1.012516, -1.519219, 1, 1, 1, 1, 1,
0.5833955, 1.4136, -0.6688346, 1, 1, 1, 1, 1,
0.5835794, 1.287721, 1.762957, 1, 1, 1, 1, 1,
0.5888044, -0.4965532, 2.000856, 1, 1, 1, 1, 1,
0.5914901, 0.9348355, 0.1929536, 0, 0, 1, 1, 1,
0.593792, -1.908694, 2.180248, 1, 0, 0, 1, 1,
0.5944572, -0.02545278, 1.787648, 1, 0, 0, 1, 1,
0.5984425, -0.5377139, 2.324265, 1, 0, 0, 1, 1,
0.5987467, -0.6466271, 2.462049, 1, 0, 0, 1, 1,
0.603749, 0.4741865, 0.3068604, 1, 0, 0, 1, 1,
0.6076865, 0.2223565, 1.579804, 0, 0, 0, 1, 1,
0.6091381, 0.1141461, 1.633112, 0, 0, 0, 1, 1,
0.6126556, 0.2292631, 2.334425, 0, 0, 0, 1, 1,
0.6239664, -0.3594696, 2.401222, 0, 0, 0, 1, 1,
0.6241778, 2.178078, 0.9015439, 0, 0, 0, 1, 1,
0.626847, 0.4709155, 0.8462223, 0, 0, 0, 1, 1,
0.6303041, -0.7629767, 3.452762, 0, 0, 0, 1, 1,
0.6320835, -0.3249399, 2.696751, 1, 1, 1, 1, 1,
0.6370159, -0.2170246, 2.303817, 1, 1, 1, 1, 1,
0.6404951, 0.8889126, 1.080987, 1, 1, 1, 1, 1,
0.6409872, 0.176787, 0.831453, 1, 1, 1, 1, 1,
0.6424018, 0.9807645, -0.1603239, 1, 1, 1, 1, 1,
0.6424681, -0.598609, 2.568862, 1, 1, 1, 1, 1,
0.643099, 0.4354118, 0.7061754, 1, 1, 1, 1, 1,
0.6472513, 0.4929046, 0.4811851, 1, 1, 1, 1, 1,
0.6515319, -1.980283, 3.81954, 1, 1, 1, 1, 1,
0.659016, -0.3475787, 0.5658783, 1, 1, 1, 1, 1,
0.6590192, -1.020929, 4.071813, 1, 1, 1, 1, 1,
0.6628233, -0.9665825, 3.684972, 1, 1, 1, 1, 1,
0.6693866, 1.063719, 0.2618825, 1, 1, 1, 1, 1,
0.669421, -0.3100508, 0.5927637, 1, 1, 1, 1, 1,
0.6701604, -0.786806, 2.834893, 1, 1, 1, 1, 1,
0.6750146, -2.303695, 3.17756, 0, 0, 1, 1, 1,
0.6896238, 1.477538, -1.434772, 1, 0, 0, 1, 1,
0.6904975, -0.02450597, 1.373455, 1, 0, 0, 1, 1,
0.6931968, -0.1253272, 0.5710446, 1, 0, 0, 1, 1,
0.6944242, -1.650067, 4.319091, 1, 0, 0, 1, 1,
0.7032794, -1.40838, 1.459294, 1, 0, 0, 1, 1,
0.7038556, -0.25337, 1.885426, 0, 0, 0, 1, 1,
0.7069618, -1.151624, 3.037541, 0, 0, 0, 1, 1,
0.7077609, -0.4465238, 3.192677, 0, 0, 0, 1, 1,
0.7088878, -0.4257449, 1.669676, 0, 0, 0, 1, 1,
0.7116058, 0.6772609, 0.63015, 0, 0, 0, 1, 1,
0.7174384, -0.8123558, 2.988516, 0, 0, 0, 1, 1,
0.7197718, -0.7063671, 1.109954, 0, 0, 0, 1, 1,
0.728424, -0.6449409, 3.183328, 1, 1, 1, 1, 1,
0.7315841, 1.126755, 0.01531783, 1, 1, 1, 1, 1,
0.7340026, 0.4616056, 0.8307678, 1, 1, 1, 1, 1,
0.7396867, -0.241301, 1.986836, 1, 1, 1, 1, 1,
0.7431335, 1.12355, 1.239139, 1, 1, 1, 1, 1,
0.7436495, 0.05591066, 2.129287, 1, 1, 1, 1, 1,
0.7450306, 0.1072656, -0.1395447, 1, 1, 1, 1, 1,
0.7455464, 0.8232315, -0.8933448, 1, 1, 1, 1, 1,
0.7458003, -0.6544763, 2.599033, 1, 1, 1, 1, 1,
0.7484514, -0.6658005, 2.990493, 1, 1, 1, 1, 1,
0.7495524, -1.425959, 4.208194, 1, 1, 1, 1, 1,
0.7517257, -0.2147163, 2.925887, 1, 1, 1, 1, 1,
0.7601271, -0.05478874, 2.102561, 1, 1, 1, 1, 1,
0.7628441, -0.1186754, 1.401675, 1, 1, 1, 1, 1,
0.7704009, 0.8751432, 0.9342625, 1, 1, 1, 1, 1,
0.7793211, 0.3620056, 0.2644212, 0, 0, 1, 1, 1,
0.7823148, -0.9855118, 1.466551, 1, 0, 0, 1, 1,
0.7823846, 1.324031, -2.648058, 1, 0, 0, 1, 1,
0.7942782, -0.1884708, -0.6353115, 1, 0, 0, 1, 1,
0.7969414, 1.7099, 0.3851939, 1, 0, 0, 1, 1,
0.8010178, 1.738451, 0.6461878, 1, 0, 0, 1, 1,
0.8024162, 1.711162, 1.510999, 0, 0, 0, 1, 1,
0.8066498, -1.626831, 0.7498847, 0, 0, 0, 1, 1,
0.8080394, 0.5539327, 1.726015, 0, 0, 0, 1, 1,
0.8143595, 1.294198, 1.387404, 0, 0, 0, 1, 1,
0.8194685, 0.1145676, 0.7574353, 0, 0, 0, 1, 1,
0.8315539, 0.01814617, 3.091529, 0, 0, 0, 1, 1,
0.8397247, -0.2236055, 1.84717, 0, 0, 0, 1, 1,
0.8402124, -0.5134941, 2.921186, 1, 1, 1, 1, 1,
0.8406307, -0.3080578, 1.689025, 1, 1, 1, 1, 1,
0.8429614, -0.9400511, -0.04901484, 1, 1, 1, 1, 1,
0.8449206, -1.450121, 2.66485, 1, 1, 1, 1, 1,
0.8531767, -1.522567, 2.075804, 1, 1, 1, 1, 1,
0.8544588, 1.508156, 0.2051045, 1, 1, 1, 1, 1,
0.8577794, -0.4591696, 1.690036, 1, 1, 1, 1, 1,
0.8577811, 1.238671, 0.02114623, 1, 1, 1, 1, 1,
0.8582509, -0.6185904, 1.63967, 1, 1, 1, 1, 1,
0.8597021, -0.4236596, 0.8110498, 1, 1, 1, 1, 1,
0.8693003, 0.2074761, -0.3326034, 1, 1, 1, 1, 1,
0.8694986, 0.2935265, 0.08870189, 1, 1, 1, 1, 1,
0.86989, -0.2517703, 1.277778, 1, 1, 1, 1, 1,
0.870317, 1.251208, 0.874076, 1, 1, 1, 1, 1,
0.8781504, -2.606115, 3.49438, 1, 1, 1, 1, 1,
0.882358, 2.124528, -0.5406296, 0, 0, 1, 1, 1,
0.8837803, -0.2183045, 1.478329, 1, 0, 0, 1, 1,
0.8847704, 0.1950831, 0.7582247, 1, 0, 0, 1, 1,
0.8880186, -0.4488207, 2.779292, 1, 0, 0, 1, 1,
0.8887441, 0.7786555, 0.7382942, 1, 0, 0, 1, 1,
0.8959238, 0.9078692, 1.369929, 1, 0, 0, 1, 1,
0.8962542, -0.4872923, -0.20183, 0, 0, 0, 1, 1,
0.9066469, 0.652908, 1.812964, 0, 0, 0, 1, 1,
0.9098408, 0.3088332, 2.439685, 0, 0, 0, 1, 1,
0.9102331, -0.9613605, 3.425817, 0, 0, 0, 1, 1,
0.9137177, -0.5050887, 3.00127, 0, 0, 0, 1, 1,
0.9214646, 0.2440467, 2.343143, 0, 0, 0, 1, 1,
0.9261878, 0.01363521, 1.393243, 0, 0, 0, 1, 1,
0.9295366, 1.600449, 1.028768, 1, 1, 1, 1, 1,
0.9299077, 0.2806244, 1.521899, 1, 1, 1, 1, 1,
0.9324589, 1.099708, -0.216267, 1, 1, 1, 1, 1,
0.9326424, 1.648292, 0.0196722, 1, 1, 1, 1, 1,
0.9331723, 0.1679572, 0.3787713, 1, 1, 1, 1, 1,
0.9335858, 0.7162352, 1.479637, 1, 1, 1, 1, 1,
0.9392427, 1.373182, -0.1686587, 1, 1, 1, 1, 1,
0.9392575, -1.009561, 2.484464, 1, 1, 1, 1, 1,
0.9470773, -0.7240087, 3.446452, 1, 1, 1, 1, 1,
0.952724, 2.094031, -0.3876933, 1, 1, 1, 1, 1,
0.9550611, 0.5286788, 0.4627269, 1, 1, 1, 1, 1,
0.9585312, 0.5643777, 1.020854, 1, 1, 1, 1, 1,
0.9586987, -0.6485829, 3.552203, 1, 1, 1, 1, 1,
0.9593275, -0.1616407, 1.696613, 1, 1, 1, 1, 1,
0.9609782, -0.7553725, 1.466138, 1, 1, 1, 1, 1,
0.9673623, -1.046375, 4.393517, 0, 0, 1, 1, 1,
0.9691996, 0.7252587, 0.7179347, 1, 0, 0, 1, 1,
0.9728285, -0.2257449, 2.399398, 1, 0, 0, 1, 1,
0.9803039, 0.1954866, 1.040284, 1, 0, 0, 1, 1,
0.9855829, -0.8608996, 0.6770861, 1, 0, 0, 1, 1,
0.9888666, 1.321239, 0.432945, 1, 0, 0, 1, 1,
0.9951041, 1.245336, -0.1465565, 0, 0, 0, 1, 1,
1.001202, 1.639597, 1.277591, 0, 0, 0, 1, 1,
1.003586, 0.1984971, 2.825555, 0, 0, 0, 1, 1,
1.010983, -0.1006255, 4.353768, 0, 0, 0, 1, 1,
1.011578, 0.5032943, 1.143293, 0, 0, 0, 1, 1,
1.021911, 0.3669519, 0.2478651, 0, 0, 0, 1, 1,
1.025822, 0.6552819, 2.046918, 0, 0, 0, 1, 1,
1.029097, -0.7119783, 1.690784, 1, 1, 1, 1, 1,
1.040484, -0.8482668, 1.798711, 1, 1, 1, 1, 1,
1.042163, 0.5714376, 1.531165, 1, 1, 1, 1, 1,
1.042175, -0.2386705, 0.6343074, 1, 1, 1, 1, 1,
1.043689, -0.6437669, 1.244786, 1, 1, 1, 1, 1,
1.044428, -1.517993, 1.112076, 1, 1, 1, 1, 1,
1.048048, -0.04148904, 0.6999217, 1, 1, 1, 1, 1,
1.05274, -1.341777, 2.134767, 1, 1, 1, 1, 1,
1.070915, -0.445977, 2.563551, 1, 1, 1, 1, 1,
1.074933, 1.354471, -0.1329429, 1, 1, 1, 1, 1,
1.075111, 1.380697, 2.252534, 1, 1, 1, 1, 1,
1.075891, -1.004618, 3.824565, 1, 1, 1, 1, 1,
1.079511, -0.04288047, 0.03340654, 1, 1, 1, 1, 1,
1.079763, -1.678322, 3.384522, 1, 1, 1, 1, 1,
1.094868, 2.222133, -0.08281198, 1, 1, 1, 1, 1,
1.110825, -0.4272085, 2.95881, 0, 0, 1, 1, 1,
1.113786, 1.493743, 2.097989, 1, 0, 0, 1, 1,
1.11388, -0.470058, 3.045439, 1, 0, 0, 1, 1,
1.113979, 1.73796, 1.986991, 1, 0, 0, 1, 1,
1.115243, -0.9142947, 1.993072, 1, 0, 0, 1, 1,
1.129363, 1.374074, 1.595984, 1, 0, 0, 1, 1,
1.130964, 0.8860122, 1.543399, 0, 0, 0, 1, 1,
1.132302, -0.7469748, 1.050139, 0, 0, 0, 1, 1,
1.13486, 0.9713064, -0.5248047, 0, 0, 0, 1, 1,
1.142103, 0.3941826, 0.6958008, 0, 0, 0, 1, 1,
1.14467, 0.6483603, 0.08487117, 0, 0, 0, 1, 1,
1.147387, 0.3731509, 2.15983, 0, 0, 0, 1, 1,
1.152123, -0.7046801, 1.574107, 0, 0, 0, 1, 1,
1.155028, 1.438106, 1.921162, 1, 1, 1, 1, 1,
1.155953, 0.3465583, -0.327892, 1, 1, 1, 1, 1,
1.162056, 0.8947697, -0.3431017, 1, 1, 1, 1, 1,
1.163415, -0.4452052, 1.424594, 1, 1, 1, 1, 1,
1.164384, 0.3876443, 2.064338, 1, 1, 1, 1, 1,
1.181146, 0.3746235, 2.326207, 1, 1, 1, 1, 1,
1.185166, -0.9366658, 2.444179, 1, 1, 1, 1, 1,
1.187793, 0.6260891, 1.129035, 1, 1, 1, 1, 1,
1.19025, 0.1332443, 3.709561, 1, 1, 1, 1, 1,
1.190282, -0.9776568, 0.9583554, 1, 1, 1, 1, 1,
1.190768, -0.8810773, 2.214997, 1, 1, 1, 1, 1,
1.194671, -0.0544462, 0.4337593, 1, 1, 1, 1, 1,
1.197844, -0.03403522, 3.46588, 1, 1, 1, 1, 1,
1.202933, -2.262875, 2.163645, 1, 1, 1, 1, 1,
1.208986, 0.5769781, 2.231313, 1, 1, 1, 1, 1,
1.211713, -1.339531, 3.062211, 0, 0, 1, 1, 1,
1.215665, -1.351778, 2.209428, 1, 0, 0, 1, 1,
1.217866, 0.5827292, 1.316131, 1, 0, 0, 1, 1,
1.226742, -1.005785, 1.764246, 1, 0, 0, 1, 1,
1.241343, 0.1955618, 0.2351472, 1, 0, 0, 1, 1,
1.241445, 1.825471, 1.584852, 1, 0, 0, 1, 1,
1.24903, 0.6629033, 2.990646, 0, 0, 0, 1, 1,
1.249134, -0.7514856, 1.799544, 0, 0, 0, 1, 1,
1.25288, 1.176197, 0.9636894, 0, 0, 0, 1, 1,
1.254239, -0.4432037, 1.96207, 0, 0, 0, 1, 1,
1.263315, -0.3702652, 0.2186539, 0, 0, 0, 1, 1,
1.269939, 0.09189268, 0.3416544, 0, 0, 0, 1, 1,
1.320653, -0.3558265, 2.675034, 0, 0, 0, 1, 1,
1.32624, -1.039805, 0.9945621, 1, 1, 1, 1, 1,
1.331774, -0.1284117, 3.427443, 1, 1, 1, 1, 1,
1.334203, -0.7451441, 0.8113704, 1, 1, 1, 1, 1,
1.341167, 1.111009, 1.3911, 1, 1, 1, 1, 1,
1.342348, 0.1996413, 0.2137536, 1, 1, 1, 1, 1,
1.351583, 1.589986, 1.005505, 1, 1, 1, 1, 1,
1.357022, -1.82891, 1.022815, 1, 1, 1, 1, 1,
1.361485, -0.6988896, 0.3543275, 1, 1, 1, 1, 1,
1.365752, -0.7617393, 1.305714, 1, 1, 1, 1, 1,
1.371328, -0.5950603, 3.293511, 1, 1, 1, 1, 1,
1.372038, -0.04688744, 0.4776118, 1, 1, 1, 1, 1,
1.376416, 0.2496071, 2.055949, 1, 1, 1, 1, 1,
1.386126, -0.8131304, 1.0827, 1, 1, 1, 1, 1,
1.39433, -0.007448354, 1.371665, 1, 1, 1, 1, 1,
1.394349, 1.573335, -0.8534905, 1, 1, 1, 1, 1,
1.405125, 0.1047458, 0.3128942, 0, 0, 1, 1, 1,
1.413899, 0.1983379, 2.718136, 1, 0, 0, 1, 1,
1.418863, 0.5944955, 0.8276454, 1, 0, 0, 1, 1,
1.422404, 0.2372876, 1.948324, 1, 0, 0, 1, 1,
1.422996, 0.5518063, 1.42706, 1, 0, 0, 1, 1,
1.432573, 0.5593534, 0.3300768, 1, 0, 0, 1, 1,
1.444407, -0.2797882, 2.176891, 0, 0, 0, 1, 1,
1.448742, 0.1403377, 2.861706, 0, 0, 0, 1, 1,
1.451881, -0.5368495, 2.664473, 0, 0, 0, 1, 1,
1.453667, -0.5846127, 1.359972, 0, 0, 0, 1, 1,
1.458157, 0.2270829, 0.1367963, 0, 0, 0, 1, 1,
1.459064, 1.262863, 1.723803, 0, 0, 0, 1, 1,
1.461666, -1.4389, 1.612138, 0, 0, 0, 1, 1,
1.479224, -0.5662179, 1.623999, 1, 1, 1, 1, 1,
1.488085, -0.6336837, 3.385356, 1, 1, 1, 1, 1,
1.497569, -0.1465957, 3.289665, 1, 1, 1, 1, 1,
1.501653, 1.004739, 0.6193466, 1, 1, 1, 1, 1,
1.511946, 0.1013997, 0.7805815, 1, 1, 1, 1, 1,
1.512801, -0.1967911, 1.736457, 1, 1, 1, 1, 1,
1.519448, 2.216417, -0.4776398, 1, 1, 1, 1, 1,
1.522207, 0.06377199, 1.136558, 1, 1, 1, 1, 1,
1.545159, 0.6473159, 1.356368, 1, 1, 1, 1, 1,
1.547513, -1.748134, 2.280129, 1, 1, 1, 1, 1,
1.562492, 0.1019178, 3.812633, 1, 1, 1, 1, 1,
1.574378, -1.898594, 2.18527, 1, 1, 1, 1, 1,
1.589731, 1.53729, -1.921526, 1, 1, 1, 1, 1,
1.596231, -1.998609, 2.71085, 1, 1, 1, 1, 1,
1.598942, 0.1876716, 1.108991, 1, 1, 1, 1, 1,
1.60408, 0.01344225, 1.474762, 0, 0, 1, 1, 1,
1.608822, 1.218264, 1.956536, 1, 0, 0, 1, 1,
1.609025, -0.2421631, 0.9177012, 1, 0, 0, 1, 1,
1.610394, 0.4404394, 2.162898, 1, 0, 0, 1, 1,
1.612108, 0.1929384, -0.552433, 1, 0, 0, 1, 1,
1.613898, 1.218936, 1.559672, 1, 0, 0, 1, 1,
1.61559, -1.218507, 1.365631, 0, 0, 0, 1, 1,
1.627239, 0.6078979, -0.3592253, 0, 0, 0, 1, 1,
1.627282, 0.1207322, 2.293898, 0, 0, 0, 1, 1,
1.6375, 1.942214, 0.4327265, 0, 0, 0, 1, 1,
1.637652, 1.040343, 0.1502495, 0, 0, 0, 1, 1,
1.644545, 0.4671289, 0.5655375, 0, 0, 0, 1, 1,
1.659193, -2.256585, 1.770175, 0, 0, 0, 1, 1,
1.664716, 0.1716118, 0.8085062, 1, 1, 1, 1, 1,
1.667191, -2.11466, 0.8721334, 1, 1, 1, 1, 1,
1.680535, -0.9685448, 1.060943, 1, 1, 1, 1, 1,
1.680749, 0.619087, -0.01518554, 1, 1, 1, 1, 1,
1.713086, -1.867248, 1.313111, 1, 1, 1, 1, 1,
1.737773, 0.3906815, 0.1946621, 1, 1, 1, 1, 1,
1.774482, -0.4621584, 1.342562, 1, 1, 1, 1, 1,
1.799799, 0.137348, 1.497603, 1, 1, 1, 1, 1,
1.804567, 1.458273, 0.6616856, 1, 1, 1, 1, 1,
1.86458, 0.8482122, 2.667257, 1, 1, 1, 1, 1,
1.875278, -0.8555632, -0.3393712, 1, 1, 1, 1, 1,
1.90511, -1.224275, 2.108602, 1, 1, 1, 1, 1,
1.915708, -1.377126, 0.7134917, 1, 1, 1, 1, 1,
1.999195, -0.8385787, 1.412276, 1, 1, 1, 1, 1,
2.092577, -0.2387165, 1.968176, 1, 1, 1, 1, 1,
2.110199, 1.506266, 1.555225, 0, 0, 1, 1, 1,
2.149929, -0.1912261, 2.075541, 1, 0, 0, 1, 1,
2.190324, -0.9737931, 1.328156, 1, 0, 0, 1, 1,
2.195115, -0.7029105, 1.603942, 1, 0, 0, 1, 1,
2.219171, 0.06641344, 2.34044, 1, 0, 0, 1, 1,
2.219738, -0.3205686, 0.8839964, 1, 0, 0, 1, 1,
2.240608, 0.1254065, 0.5383348, 0, 0, 0, 1, 1,
2.24158, -0.05244371, 1.998956, 0, 0, 0, 1, 1,
2.260291, -1.129195, 1.740275, 0, 0, 0, 1, 1,
2.296236, 1.297081, 2.14318, 0, 0, 0, 1, 1,
2.334341, -3.059798, 0.2777308, 0, 0, 0, 1, 1,
2.371881, -0.4438429, 2.241592, 0, 0, 0, 1, 1,
2.404891, -0.339692, -0.154914, 0, 0, 0, 1, 1,
2.466145, -0.08518854, 0.3545996, 1, 1, 1, 1, 1,
2.466192, -0.292511, 2.324936, 1, 1, 1, 1, 1,
2.472816, -0.6775973, 0.8486228, 1, 1, 1, 1, 1,
2.474314, -2.165473, 3.735937, 1, 1, 1, 1, 1,
3.155807, 0.6425517, 0.7375774, 1, 1, 1, 1, 1,
3.327714, 0.5853066, 1.87411, 1, 1, 1, 1, 1,
3.605442, 0.4327345, 1.680906, 1, 1, 1, 1, 1
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
var radius = 10.04984;
var distance = 35.29962;
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
mvMatrix.translate( -0.1627479, 0.08059049, -0.3175716 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.29962);
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