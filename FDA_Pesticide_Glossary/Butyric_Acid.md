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
-3.881441, -0.6090531, -2.599174, 1, 0, 0, 1,
-3.657795, 0.3846725, -1.838143, 1, 0.007843138, 0, 1,
-3.159195, 1.848565, -0.4006989, 1, 0.01176471, 0, 1,
-3.121265, -1.193157, -0.4763852, 1, 0.01960784, 0, 1,
-3.058742, 0.5067725, -1.701529, 1, 0.02352941, 0, 1,
-2.956605, -0.7470835, -0.4711666, 1, 0.03137255, 0, 1,
-2.905478, -1.820985, -1.440898, 1, 0.03529412, 0, 1,
-2.687402, 0.2471354, -2.81181, 1, 0.04313726, 0, 1,
-2.671359, 1.98849, -0.4822566, 1, 0.04705882, 0, 1,
-2.670882, 0.3843376, -0.7282248, 1, 0.05490196, 0, 1,
-2.645666, -0.0009543455, -2.434803, 1, 0.05882353, 0, 1,
-2.560033, -0.5721999, -3.175532, 1, 0.06666667, 0, 1,
-2.499483, -0.638221, -2.396972, 1, 0.07058824, 0, 1,
-2.492207, 0.732053, -1.314553, 1, 0.07843138, 0, 1,
-2.374315, -1.293203, -1.213498, 1, 0.08235294, 0, 1,
-2.329319, 0.8128143, 0.1325604, 1, 0.09019608, 0, 1,
-2.31353, 1.670096, -0.5163943, 1, 0.09411765, 0, 1,
-2.246341, -0.3092949, -1.189133, 1, 0.1019608, 0, 1,
-2.224864, -0.03604862, -3.263349, 1, 0.1098039, 0, 1,
-2.13685, 0.7438962, -0.6966234, 1, 0.1137255, 0, 1,
-2.093646, 0.9049324, -1.988927, 1, 0.1215686, 0, 1,
-2.02528, 0.4023834, -0.9611037, 1, 0.1254902, 0, 1,
-2.0236, 1.51211, -1.569521, 1, 0.1333333, 0, 1,
-2.007095, -0.604902, -2.38859, 1, 0.1372549, 0, 1,
-1.9923, 0.1803699, 0.8153543, 1, 0.145098, 0, 1,
-1.968983, -0.2972881, -1.989017, 1, 0.1490196, 0, 1,
-1.96551, -2.182984, -2.569757, 1, 0.1568628, 0, 1,
-1.938663, -1.250704, -0.9698385, 1, 0.1607843, 0, 1,
-1.89133, 1.028915, 1.202389, 1, 0.1686275, 0, 1,
-1.8426, -0.1045107, -2.845996, 1, 0.172549, 0, 1,
-1.836654, 0.9297585, -0.9899573, 1, 0.1803922, 0, 1,
-1.834067, 0.7118014, -1.185522, 1, 0.1843137, 0, 1,
-1.827555, -1.570982, -3.254318, 1, 0.1921569, 0, 1,
-1.79585, 0.4204328, -1.434654, 1, 0.1960784, 0, 1,
-1.785759, 0.2815572, -0.1878332, 1, 0.2039216, 0, 1,
-1.784377, -0.8889431, -1.646502, 1, 0.2117647, 0, 1,
-1.781274, 0.2771306, -0.1286766, 1, 0.2156863, 0, 1,
-1.780283, -0.7063853, -2.330031, 1, 0.2235294, 0, 1,
-1.773408, -0.2959229, -0.1140821, 1, 0.227451, 0, 1,
-1.768602, -0.7311366, -0.4913877, 1, 0.2352941, 0, 1,
-1.760698, 0.1830212, -0.4252858, 1, 0.2392157, 0, 1,
-1.758282, 1.454826, -0.6918889, 1, 0.2470588, 0, 1,
-1.747134, 1.700999, -2.727088, 1, 0.2509804, 0, 1,
-1.74574, -0.6171983, -3.860374, 1, 0.2588235, 0, 1,
-1.74338, -1.01772, -2.089627, 1, 0.2627451, 0, 1,
-1.737688, 1.147954, -0.8923877, 1, 0.2705882, 0, 1,
-1.725284, -0.1901347, -3.527458, 1, 0.2745098, 0, 1,
-1.714994, -1.235184, -0.9602283, 1, 0.282353, 0, 1,
-1.713519, 0.1577887, -0.3530211, 1, 0.2862745, 0, 1,
-1.709351, -0.4158659, -1.820826, 1, 0.2941177, 0, 1,
-1.704572, 1.014024, -0.5634641, 1, 0.3019608, 0, 1,
-1.696707, 0.6739714, -1.343682, 1, 0.3058824, 0, 1,
-1.690513, 1.993041, -0.1955002, 1, 0.3137255, 0, 1,
-1.68932, -0.5392903, -1.98135, 1, 0.3176471, 0, 1,
-1.677038, -1.12093, -1.373748, 1, 0.3254902, 0, 1,
-1.672651, 0.0106694, -1.388091, 1, 0.3294118, 0, 1,
-1.662353, -0.3112935, -2.825525, 1, 0.3372549, 0, 1,
-1.662328, 0.2929634, 0.8718047, 1, 0.3411765, 0, 1,
-1.639614, 0.4644863, -2.338342, 1, 0.3490196, 0, 1,
-1.63188, 1.611181, -0.7501411, 1, 0.3529412, 0, 1,
-1.619395, 0.1259346, -1.986225, 1, 0.3607843, 0, 1,
-1.613306, 0.8464717, 0.1767818, 1, 0.3647059, 0, 1,
-1.602276, -0.1380247, -3.591842, 1, 0.372549, 0, 1,
-1.569975, 1.711832, -0.679342, 1, 0.3764706, 0, 1,
-1.569682, 1.549548, 0.4257982, 1, 0.3843137, 0, 1,
-1.54623, -0.5454407, -1.436245, 1, 0.3882353, 0, 1,
-1.533923, -2.683198, -2.591143, 1, 0.3960784, 0, 1,
-1.51266, 1.08254, -0.08514438, 1, 0.4039216, 0, 1,
-1.509153, 0.7235319, -1.350322, 1, 0.4078431, 0, 1,
-1.506576, -1.407367, -3.145176, 1, 0.4156863, 0, 1,
-1.500468, 0.6443405, -0.4641848, 1, 0.4196078, 0, 1,
-1.49391, 1.211524, -1.684908, 1, 0.427451, 0, 1,
-1.48196, 0.849448, -0.2702422, 1, 0.4313726, 0, 1,
-1.481363, 0.5071327, -2.276038, 1, 0.4392157, 0, 1,
-1.467895, -1.069596, -3.915617, 1, 0.4431373, 0, 1,
-1.464749, -1.20814, -2.669269, 1, 0.4509804, 0, 1,
-1.458351, 0.2703768, -2.711377, 1, 0.454902, 0, 1,
-1.450365, 2.405921, 0.6790007, 1, 0.4627451, 0, 1,
-1.444751, -1.791708, -3.129735, 1, 0.4666667, 0, 1,
-1.439809, 0.1871986, -2.042273, 1, 0.4745098, 0, 1,
-1.428829, 0.09824511, -1.381672, 1, 0.4784314, 0, 1,
-1.424934, 0.3871552, 0.7143942, 1, 0.4862745, 0, 1,
-1.420612, -0.6655524, -0.5905344, 1, 0.4901961, 0, 1,
-1.41733, 0.01176341, -0.6864062, 1, 0.4980392, 0, 1,
-1.417162, -0.6462458, -0.7756838, 1, 0.5058824, 0, 1,
-1.412969, -0.5337643, -2.126631, 1, 0.509804, 0, 1,
-1.401983, -0.649774, 0.6364102, 1, 0.5176471, 0, 1,
-1.401798, -1.44847, -1.947394, 1, 0.5215687, 0, 1,
-1.400369, -0.02497306, -1.996634, 1, 0.5294118, 0, 1,
-1.395757, -1.379081, -1.181196, 1, 0.5333334, 0, 1,
-1.378138, 0.2480891, -2.350472, 1, 0.5411765, 0, 1,
-1.345564, -0.9065763, -1.848153, 1, 0.5450981, 0, 1,
-1.342904, -0.5945228, -1.995934, 1, 0.5529412, 0, 1,
-1.337668, -0.4171698, -2.982695, 1, 0.5568628, 0, 1,
-1.334622, -1.144886, -0.7102886, 1, 0.5647059, 0, 1,
-1.332574, -1.095154, -2.205319, 1, 0.5686275, 0, 1,
-1.32815, 1.637003, -3.011616, 1, 0.5764706, 0, 1,
-1.319599, 1.341416, -3.179045, 1, 0.5803922, 0, 1,
-1.313125, -0.8210741, -1.582451, 1, 0.5882353, 0, 1,
-1.292416, 0.7784643, -3.443255, 1, 0.5921569, 0, 1,
-1.284891, -1.044733, -0.2934091, 1, 0.6, 0, 1,
-1.271371, 1.17462, 0.6878488, 1, 0.6078432, 0, 1,
-1.258143, -0.4627216, 0.4830486, 1, 0.6117647, 0, 1,
-1.255304, 0.4869353, -1.495614, 1, 0.6196079, 0, 1,
-1.251487, -0.5140328, -2.88028, 1, 0.6235294, 0, 1,
-1.238756, 1.008134, -1.208992, 1, 0.6313726, 0, 1,
-1.236365, -0.5393256, -2.308028, 1, 0.6352941, 0, 1,
-1.23021, 0.1593354, -2.281107, 1, 0.6431373, 0, 1,
-1.226232, -0.06670054, -2.273952, 1, 0.6470588, 0, 1,
-1.224241, -1.782753, -3.961519, 1, 0.654902, 0, 1,
-1.22107, 0.5005363, -0.1801213, 1, 0.6588235, 0, 1,
-1.21752, -0.6279331, -1.76757, 1, 0.6666667, 0, 1,
-1.208999, 1.931919, -1.728593, 1, 0.6705883, 0, 1,
-1.197972, -0.4164312, -2.412749, 1, 0.6784314, 0, 1,
-1.192608, 2.677726, 0.4717824, 1, 0.682353, 0, 1,
-1.18664, -2.123254, -1.504899, 1, 0.6901961, 0, 1,
-1.186371, 0.6989841, 0.3100575, 1, 0.6941177, 0, 1,
-1.182871, 0.6890571, -1.454862, 1, 0.7019608, 0, 1,
-1.180766, 2.395025, -0.4491977, 1, 0.7098039, 0, 1,
-1.180451, 0.5075814, -1.650626, 1, 0.7137255, 0, 1,
-1.177377, 0.01389994, -1.500918, 1, 0.7215686, 0, 1,
-1.172775, -2.287795, -3.47348, 1, 0.7254902, 0, 1,
-1.164624, -2.879932, -2.619349, 1, 0.7333333, 0, 1,
-1.160355, 1.584622, -1.239358, 1, 0.7372549, 0, 1,
-1.158944, -1.15492, -2.301978, 1, 0.7450981, 0, 1,
-1.133872, -0.4529527, -3.034706, 1, 0.7490196, 0, 1,
-1.131663, 2.492848, -0.7415978, 1, 0.7568628, 0, 1,
-1.122615, -0.326896, -0.5403284, 1, 0.7607843, 0, 1,
-1.12007, 1.090946, -0.8628608, 1, 0.7686275, 0, 1,
-1.112193, -0.2528269, -2.296972, 1, 0.772549, 0, 1,
-1.109499, 1.155566, -1.064383, 1, 0.7803922, 0, 1,
-1.108122, -1.103117, -3.963179, 1, 0.7843137, 0, 1,
-1.106277, 0.1855823, -0.3252904, 1, 0.7921569, 0, 1,
-1.098307, -0.857634, -2.023983, 1, 0.7960784, 0, 1,
-1.096818, -0.8759098, -3.019923, 1, 0.8039216, 0, 1,
-1.084251, -0.4581531, -4.37216, 1, 0.8117647, 0, 1,
-1.082957, 1.210363, 0.09837022, 1, 0.8156863, 0, 1,
-1.070918, -0.8060156, -2.770623, 1, 0.8235294, 0, 1,
-1.067853, -0.4795439, -2.79323, 1, 0.827451, 0, 1,
-1.06715, 1.109179, -0.03769068, 1, 0.8352941, 0, 1,
-1.063962, -0.5548643, -0.2342427, 1, 0.8392157, 0, 1,
-1.063051, -0.2189799, -3.162165, 1, 0.8470588, 0, 1,
-1.060597, -0.08055939, -2.620567, 1, 0.8509804, 0, 1,
-1.060211, -0.6157152, -2.416116, 1, 0.8588235, 0, 1,
-1.057051, -0.4058267, -2.461534, 1, 0.8627451, 0, 1,
-1.053009, 0.4205273, -0.2549731, 1, 0.8705882, 0, 1,
-1.049541, 0.2884857, -2.625588, 1, 0.8745098, 0, 1,
-1.047351, 0.0827207, -1.235607, 1, 0.8823529, 0, 1,
-1.04532, 0.3342285, -0.9815405, 1, 0.8862745, 0, 1,
-1.044243, 0.2361283, -1.234754, 1, 0.8941177, 0, 1,
-1.039223, 0.08880159, -0.9967573, 1, 0.8980392, 0, 1,
-1.02783, 0.2097234, -2.253411, 1, 0.9058824, 0, 1,
-1.025248, -0.4860491, -2.398562, 1, 0.9137255, 0, 1,
-1.022659, -0.1285167, -2.784347, 1, 0.9176471, 0, 1,
-1.020841, -1.161871, -1.508755, 1, 0.9254902, 0, 1,
-1.019329, 1.041546, 0.04192527, 1, 0.9294118, 0, 1,
-1.018307, 0.9515894, -0.2299692, 1, 0.9372549, 0, 1,
-1.013304, 0.9907666, -1.034595, 1, 0.9411765, 0, 1,
-1.013072, -1.273086, -1.917976, 1, 0.9490196, 0, 1,
-1.012537, -0.855284, -2.512172, 1, 0.9529412, 0, 1,
-1.001565, -1.438971, -2.859957, 1, 0.9607843, 0, 1,
-1.000576, -2.592747, -4.485738, 1, 0.9647059, 0, 1,
-0.9961672, 0.2778717, -1.524157, 1, 0.972549, 0, 1,
-0.9949853, -1.124374, -2.639372, 1, 0.9764706, 0, 1,
-0.991071, -0.5103882, -2.003034, 1, 0.9843137, 0, 1,
-0.9877235, 0.8622454, 0.01189867, 1, 0.9882353, 0, 1,
-0.9764724, -0.9433768, -3.329587, 1, 0.9960784, 0, 1,
-0.9749765, 0.7698532, -1.360007, 0.9960784, 1, 0, 1,
-0.9729471, -0.2088358, -2.302742, 0.9921569, 1, 0, 1,
-0.9599084, -0.401284, -0.4809352, 0.9843137, 1, 0, 1,
-0.9590611, 0.868551, 0.03858137, 0.9803922, 1, 0, 1,
-0.9498966, -1.436833, -1.990617, 0.972549, 1, 0, 1,
-0.9491739, -0.9659825, -0.7698938, 0.9686275, 1, 0, 1,
-0.9486755, 1.049371, -1.054878, 0.9607843, 1, 0, 1,
-0.9460187, 0.05753969, -0.7927368, 0.9568627, 1, 0, 1,
-0.9436138, 0.5805947, 0.1979206, 0.9490196, 1, 0, 1,
-0.9428457, -1.418663, -3.196946, 0.945098, 1, 0, 1,
-0.939141, 0.1442942, -3.203514, 0.9372549, 1, 0, 1,
-0.9382491, 1.17114, -0.5359809, 0.9333333, 1, 0, 1,
-0.93758, -0.4922921, -1.837626, 0.9254902, 1, 0, 1,
-0.9365755, -1.074706, -3.074937, 0.9215686, 1, 0, 1,
-0.9315029, -0.6651707, -2.054212, 0.9137255, 1, 0, 1,
-0.9185542, 0.1131243, -0.93577, 0.9098039, 1, 0, 1,
-0.9138754, -0.1807697, 0.3908487, 0.9019608, 1, 0, 1,
-0.8994088, -1.43128, -2.050168, 0.8941177, 1, 0, 1,
-0.8983292, 0.2525764, -4.232687, 0.8901961, 1, 0, 1,
-0.8971391, -0.7916891, -3.916398, 0.8823529, 1, 0, 1,
-0.890132, 2.386393, 0.1369625, 0.8784314, 1, 0, 1,
-0.8880143, -0.07562251, -1.545457, 0.8705882, 1, 0, 1,
-0.8860111, 0.96226, -1.209587, 0.8666667, 1, 0, 1,
-0.8820909, -0.0847303, -1.394568, 0.8588235, 1, 0, 1,
-0.8764378, 0.0890404, 0.4934546, 0.854902, 1, 0, 1,
-0.8691354, 1.834883, 0.209833, 0.8470588, 1, 0, 1,
-0.8680567, 0.7451486, -1.94893, 0.8431373, 1, 0, 1,
-0.8663952, 1.81294, -1.565845, 0.8352941, 1, 0, 1,
-0.865145, 0.3986028, -0.6635395, 0.8313726, 1, 0, 1,
-0.8639638, -0.3787935, -2.281318, 0.8235294, 1, 0, 1,
-0.8601723, -0.1609271, -1.003913, 0.8196079, 1, 0, 1,
-0.8536536, 0.01565589, -1.318172, 0.8117647, 1, 0, 1,
-0.8527611, 0.1897352, -1.273299, 0.8078431, 1, 0, 1,
-0.8483732, 0.205572, -0.8500476, 0.8, 1, 0, 1,
-0.8459802, 0.1652619, -2.304406, 0.7921569, 1, 0, 1,
-0.8448995, 0.9335419, -0.1607376, 0.7882353, 1, 0, 1,
-0.83699, 0.00186628, -3.725832, 0.7803922, 1, 0, 1,
-0.8367584, -1.622149, -3.319437, 0.7764706, 1, 0, 1,
-0.8309674, -1.656383, -2.397104, 0.7686275, 1, 0, 1,
-0.829215, -0.08874741, -0.97761, 0.7647059, 1, 0, 1,
-0.8269334, -0.3805853, -2.187024, 0.7568628, 1, 0, 1,
-0.8189969, -0.7138439, -1.777435, 0.7529412, 1, 0, 1,
-0.8184952, -0.04569999, -0.9006454, 0.7450981, 1, 0, 1,
-0.8155335, 1.185938, -1.941393, 0.7411765, 1, 0, 1,
-0.8131326, -0.7837495, -0.3035383, 0.7333333, 1, 0, 1,
-0.8092617, -0.2892672, -1.102274, 0.7294118, 1, 0, 1,
-0.8053523, -0.4133245, -1.292731, 0.7215686, 1, 0, 1,
-0.7999266, 0.0451071, -1.434076, 0.7176471, 1, 0, 1,
-0.7895637, -0.6509513, -0.4891219, 0.7098039, 1, 0, 1,
-0.7888868, 1.391103, -0.7668481, 0.7058824, 1, 0, 1,
-0.7874327, 1.900957, 0.196845, 0.6980392, 1, 0, 1,
-0.7829674, -1.230236, -3.801402, 0.6901961, 1, 0, 1,
-0.7823579, -0.2824944, -2.283434, 0.6862745, 1, 0, 1,
-0.780871, -0.2556334, -2.667771, 0.6784314, 1, 0, 1,
-0.7806954, 0.1427782, -0.6809294, 0.6745098, 1, 0, 1,
-0.7801049, 0.07519746, -1.596024, 0.6666667, 1, 0, 1,
-0.7772225, 1.186511, 0.7281089, 0.6627451, 1, 0, 1,
-0.7765079, 0.1950316, -1.138448, 0.654902, 1, 0, 1,
-0.7710799, -0.7898006, -2.928874, 0.6509804, 1, 0, 1,
-0.7690458, -0.9678514, -3.208586, 0.6431373, 1, 0, 1,
-0.7679368, 0.08007202, -2.154661, 0.6392157, 1, 0, 1,
-0.761824, 0.3404533, -1.515919, 0.6313726, 1, 0, 1,
-0.7602174, -0.7091313, -2.133248, 0.627451, 1, 0, 1,
-0.7593831, -0.8765705, -2.680522, 0.6196079, 1, 0, 1,
-0.7465495, -1.172969, -2.615791, 0.6156863, 1, 0, 1,
-0.7448912, -0.1726992, -0.8514782, 0.6078432, 1, 0, 1,
-0.7443724, 0.1713623, -1.025547, 0.6039216, 1, 0, 1,
-0.7399701, 0.1973503, -0.6797736, 0.5960785, 1, 0, 1,
-0.7355396, -0.3228357, -2.401183, 0.5882353, 1, 0, 1,
-0.7348301, 0.3172113, -0.4555011, 0.5843138, 1, 0, 1,
-0.734573, 0.6168582, -1.111499, 0.5764706, 1, 0, 1,
-0.7298669, -0.07077003, -0.2709323, 0.572549, 1, 0, 1,
-0.7276025, 0.4952305, -0.3049067, 0.5647059, 1, 0, 1,
-0.7254519, 0.4843688, 0.4490272, 0.5607843, 1, 0, 1,
-0.7248396, -1.704151, -2.692235, 0.5529412, 1, 0, 1,
-0.7233191, 0.6773265, -0.615085, 0.5490196, 1, 0, 1,
-0.7232004, 0.4403917, 0.5539066, 0.5411765, 1, 0, 1,
-0.7207721, 0.6598358, 0.6702034, 0.5372549, 1, 0, 1,
-0.7194299, -1.824714, -3.790399, 0.5294118, 1, 0, 1,
-0.7174677, 0.7257304, -0.01321465, 0.5254902, 1, 0, 1,
-0.7122815, -1.375835, -1.218054, 0.5176471, 1, 0, 1,
-0.7111905, 0.1106273, -1.501606, 0.5137255, 1, 0, 1,
-0.7061046, -1.544542, -1.299804, 0.5058824, 1, 0, 1,
-0.7040857, 0.5764406, -0.8498383, 0.5019608, 1, 0, 1,
-0.7020779, -0.8578087, -3.650278, 0.4941176, 1, 0, 1,
-0.701619, 1.189521, -1.948575, 0.4862745, 1, 0, 1,
-0.6997486, 0.05764702, -0.5513155, 0.4823529, 1, 0, 1,
-0.692964, 1.158359, -0.9270347, 0.4745098, 1, 0, 1,
-0.6870555, -0.5654712, -2.734166, 0.4705882, 1, 0, 1,
-0.6848769, 1.823247, 0.05678413, 0.4627451, 1, 0, 1,
-0.6816725, -2.370063, -3.052927, 0.4588235, 1, 0, 1,
-0.6803554, 0.4837776, 2.211098, 0.4509804, 1, 0, 1,
-0.6794027, 0.7430852, -0.5132225, 0.4470588, 1, 0, 1,
-0.6789762, -0.9186113, -3.444275, 0.4392157, 1, 0, 1,
-0.6784617, -0.8465733, -2.315271, 0.4352941, 1, 0, 1,
-0.678008, 0.6955769, -0.5550652, 0.427451, 1, 0, 1,
-0.6766631, -0.8309689, -2.307474, 0.4235294, 1, 0, 1,
-0.6739163, -0.2323448, -2.897979, 0.4156863, 1, 0, 1,
-0.6739122, -1.194572, -3.131776, 0.4117647, 1, 0, 1,
-0.6727967, -0.01945681, -2.088193, 0.4039216, 1, 0, 1,
-0.6696996, -0.1114987, -2.077047, 0.3960784, 1, 0, 1,
-0.6588545, 0.59217, -1.404293, 0.3921569, 1, 0, 1,
-0.6569047, -2.179398, -2.759066, 0.3843137, 1, 0, 1,
-0.6371515, -0.1482576, 0.8074387, 0.3803922, 1, 0, 1,
-0.6369723, -2.386544, -2.838596, 0.372549, 1, 0, 1,
-0.627762, -1.223709, -3.804132, 0.3686275, 1, 0, 1,
-0.626246, 0.7889023, -1.026161, 0.3607843, 1, 0, 1,
-0.6250819, 0.2307511, -0.2919798, 0.3568628, 1, 0, 1,
-0.6198531, -0.693478, -2.036056, 0.3490196, 1, 0, 1,
-0.617578, -0.8990672, -1.907485, 0.345098, 1, 0, 1,
-0.6152705, 1.229917, -0.7364215, 0.3372549, 1, 0, 1,
-0.6098597, 0.5548357, -1.174434, 0.3333333, 1, 0, 1,
-0.6041207, -0.7762597, -4.55006, 0.3254902, 1, 0, 1,
-0.6019681, 1.651122, -1.153375, 0.3215686, 1, 0, 1,
-0.599332, 0.5022681, -1.287239, 0.3137255, 1, 0, 1,
-0.598265, -0.9670516, -1.538499, 0.3098039, 1, 0, 1,
-0.5955632, 0.02209196, -3.672347, 0.3019608, 1, 0, 1,
-0.5934643, 0.7743398, -0.2067536, 0.2941177, 1, 0, 1,
-0.5924325, 0.8999308, 0.01035075, 0.2901961, 1, 0, 1,
-0.5902058, 0.997666, -2.044531, 0.282353, 1, 0, 1,
-0.5806471, -0.1125059, -2.449438, 0.2784314, 1, 0, 1,
-0.5803403, -0.3574081, -2.453067, 0.2705882, 1, 0, 1,
-0.5798773, 0.07054625, -1.991015, 0.2666667, 1, 0, 1,
-0.577843, -0.1588429, -3.758822, 0.2588235, 1, 0, 1,
-0.5769555, -0.3244188, -5.090788, 0.254902, 1, 0, 1,
-0.5747858, 0.6092208, -0.6809735, 0.2470588, 1, 0, 1,
-0.5659685, -0.1899857, -3.10724, 0.2431373, 1, 0, 1,
-0.5640818, -0.9957445, -3.187097, 0.2352941, 1, 0, 1,
-0.5630714, 0.7231275, -1.137949, 0.2313726, 1, 0, 1,
-0.5569392, -0.290903, -2.161431, 0.2235294, 1, 0, 1,
-0.5564828, -1.956869, -3.423136, 0.2196078, 1, 0, 1,
-0.5544695, 0.9498737, 0.8506398, 0.2117647, 1, 0, 1,
-0.5390779, -0.9516597, -1.651173, 0.2078431, 1, 0, 1,
-0.5383462, -0.5005631, -2.790339, 0.2, 1, 0, 1,
-0.5355228, 0.1236344, 0.4326079, 0.1921569, 1, 0, 1,
-0.5267894, 0.08554004, -1.628393, 0.1882353, 1, 0, 1,
-0.5260453, -0.2043647, -4.004936, 0.1803922, 1, 0, 1,
-0.5137556, 0.4068139, -0.6908455, 0.1764706, 1, 0, 1,
-0.5131553, 0.7147023, 0.4043595, 0.1686275, 1, 0, 1,
-0.5072641, -1.826843, -1.790156, 0.1647059, 1, 0, 1,
-0.5052575, -1.269388, -3.361699, 0.1568628, 1, 0, 1,
-0.4976615, 0.7573934, 0.1254242, 0.1529412, 1, 0, 1,
-0.4958973, 0.7044299, 0.7211608, 0.145098, 1, 0, 1,
-0.4913629, 2.040743, -0.03005072, 0.1411765, 1, 0, 1,
-0.4872655, 0.1270991, -1.929802, 0.1333333, 1, 0, 1,
-0.4849208, 0.09155272, 0.5110916, 0.1294118, 1, 0, 1,
-0.4829032, 0.1163205, -0.9313747, 0.1215686, 1, 0, 1,
-0.4827548, 1.336691, 0.8039352, 0.1176471, 1, 0, 1,
-0.4808482, -0.5065024, -2.762249, 0.1098039, 1, 0, 1,
-0.4807129, -1.013146, -1.414178, 0.1058824, 1, 0, 1,
-0.4777964, 1.049054, 0.1552838, 0.09803922, 1, 0, 1,
-0.4680886, -1.284416, -3.022011, 0.09019608, 1, 0, 1,
-0.4611507, 0.048464, -2.126256, 0.08627451, 1, 0, 1,
-0.4580767, 0.07227712, -1.731816, 0.07843138, 1, 0, 1,
-0.45407, 2.344778, -1.716837, 0.07450981, 1, 0, 1,
-0.4509801, -1.357661, -1.614735, 0.06666667, 1, 0, 1,
-0.4508352, 0.3263532, -0.287292, 0.0627451, 1, 0, 1,
-0.4446814, -0.08219679, -2.533648, 0.05490196, 1, 0, 1,
-0.4436751, -0.7666754, -2.709035, 0.05098039, 1, 0, 1,
-0.442186, 0.01142126, -1.171944, 0.04313726, 1, 0, 1,
-0.4333073, 0.8783354, -0.4799348, 0.03921569, 1, 0, 1,
-0.4315312, -0.4511838, -1.996727, 0.03137255, 1, 0, 1,
-0.4295431, 1.352061, -0.1941528, 0.02745098, 1, 0, 1,
-0.4219725, -0.07497816, -2.040531, 0.01960784, 1, 0, 1,
-0.4203614, -1.274955, -2.407722, 0.01568628, 1, 0, 1,
-0.4182969, -1.848632, -3.290251, 0.007843138, 1, 0, 1,
-0.4179225, 0.983901, 1.01117, 0.003921569, 1, 0, 1,
-0.4146004, 1.026395, -0.3908218, 0, 1, 0.003921569, 1,
-0.4132323, -0.2868978, -2.575728, 0, 1, 0.01176471, 1,
-0.4132201, 1.161374, -0.7876847, 0, 1, 0.01568628, 1,
-0.4113618, 0.01487917, -0.6379754, 0, 1, 0.02352941, 1,
-0.4066908, -1.572319, -4.317369, 0, 1, 0.02745098, 1,
-0.4053241, 0.3386061, -0.4673592, 0, 1, 0.03529412, 1,
-0.4048079, -0.1375694, 0.5106232, 0, 1, 0.03921569, 1,
-0.4014715, 0.01733887, 0.3114303, 0, 1, 0.04705882, 1,
-0.4010503, -0.7272687, -4.156618, 0, 1, 0.05098039, 1,
-0.3994764, -0.6546888, -3.952608, 0, 1, 0.05882353, 1,
-0.3984801, -0.3349397, -2.344381, 0, 1, 0.0627451, 1,
-0.3972805, 1.301307, -0.663403, 0, 1, 0.07058824, 1,
-0.3939309, 1.740356, 0.7189473, 0, 1, 0.07450981, 1,
-0.3895183, -0.4777592, -1.670673, 0, 1, 0.08235294, 1,
-0.3881427, 0.916223, -0.1338757, 0, 1, 0.08627451, 1,
-0.3854204, -0.8432133, -2.1221, 0, 1, 0.09411765, 1,
-0.3844869, 1.498912, -2.403724, 0, 1, 0.1019608, 1,
-0.3795905, 0.3896282, 0.2426228, 0, 1, 0.1058824, 1,
-0.3778662, -0.9681286, -4.122464, 0, 1, 0.1137255, 1,
-0.3749974, -1.309439, -3.049266, 0, 1, 0.1176471, 1,
-0.3702926, 0.4924845, -0.8647472, 0, 1, 0.1254902, 1,
-0.3682764, -1.014677, -5.178776, 0, 1, 0.1294118, 1,
-0.3656032, -1.302092, -3.252344, 0, 1, 0.1372549, 1,
-0.3622241, -1.72811, -3.873581, 0, 1, 0.1411765, 1,
-0.3610407, 1.712904, -1.763112, 0, 1, 0.1490196, 1,
-0.3603267, 0.6795082, -0.4521963, 0, 1, 0.1529412, 1,
-0.3586207, -0.4705503, -4.098444, 0, 1, 0.1607843, 1,
-0.3547441, -0.3548552, -3.587493, 0, 1, 0.1647059, 1,
-0.3540385, -0.9530446, -4.548153, 0, 1, 0.172549, 1,
-0.3527269, -0.5984514, -2.967254, 0, 1, 0.1764706, 1,
-0.3525801, 1.032377, -0.6794519, 0, 1, 0.1843137, 1,
-0.3512281, 1.153728, 1.265692, 0, 1, 0.1882353, 1,
-0.3481364, 1.294796, 0.1430603, 0, 1, 0.1960784, 1,
-0.3471385, 0.005506594, -0.9899965, 0, 1, 0.2039216, 1,
-0.3366731, -0.727824, -4.81829, 0, 1, 0.2078431, 1,
-0.3313203, -0.735333, -1.230876, 0, 1, 0.2156863, 1,
-0.3301216, 0.1935236, -1.831694, 0, 1, 0.2196078, 1,
-0.326552, 1.715814, -0.8591962, 0, 1, 0.227451, 1,
-0.3250899, -0.7746939, -2.109798, 0, 1, 0.2313726, 1,
-0.3248005, -0.1489858, -2.965758, 0, 1, 0.2392157, 1,
-0.3247583, -2.135886, -1.765877, 0, 1, 0.2431373, 1,
-0.3245972, -0.2145153, -1.603148, 0, 1, 0.2509804, 1,
-0.3245927, 1.112068, -0.585761, 0, 1, 0.254902, 1,
-0.3231158, -0.6238071, -3.310849, 0, 1, 0.2627451, 1,
-0.3219314, -0.8596209, -3.096144, 0, 1, 0.2666667, 1,
-0.321715, 0.9028707, -0.5311105, 0, 1, 0.2745098, 1,
-0.3208394, 0.06239023, -1.172217, 0, 1, 0.2784314, 1,
-0.3206473, -0.6090305, -1.458856, 0, 1, 0.2862745, 1,
-0.3198226, -0.6126444, -3.047683, 0, 1, 0.2901961, 1,
-0.3157019, -0.8697012, -2.664204, 0, 1, 0.2980392, 1,
-0.3149043, 0.1072416, -0.4298947, 0, 1, 0.3058824, 1,
-0.3131948, -1.429238, -3.398045, 0, 1, 0.3098039, 1,
-0.3112081, 0.05987044, -1.527939, 0, 1, 0.3176471, 1,
-0.3107993, -1.308621, -2.876785, 0, 1, 0.3215686, 1,
-0.3081989, -0.7721359, -2.720948, 0, 1, 0.3294118, 1,
-0.307607, 0.9469579, -0.8321817, 0, 1, 0.3333333, 1,
-0.3002812, 1.317906, 0.6721127, 0, 1, 0.3411765, 1,
-0.2991113, -0.9880446, -2.70631, 0, 1, 0.345098, 1,
-0.298633, -0.9867643, -2.749993, 0, 1, 0.3529412, 1,
-0.2973749, 0.5510768, 0.1802462, 0, 1, 0.3568628, 1,
-0.2934178, 0.3285384, -1.675136, 0, 1, 0.3647059, 1,
-0.2918066, -0.1820201, -1.846135, 0, 1, 0.3686275, 1,
-0.2912853, -0.01912366, -2.469949, 0, 1, 0.3764706, 1,
-0.2895517, -1.013553, -1.430564, 0, 1, 0.3803922, 1,
-0.2888971, 0.06325696, -0.6055912, 0, 1, 0.3882353, 1,
-0.2884838, 1.022562, -1.092535, 0, 1, 0.3921569, 1,
-0.2877521, -0.5505892, -2.70733, 0, 1, 0.4, 1,
-0.2837737, 1.29291, -0.4094043, 0, 1, 0.4078431, 1,
-0.2823012, 0.04344781, -1.678116, 0, 1, 0.4117647, 1,
-0.2805781, 0.9222424, -0.6929404, 0, 1, 0.4196078, 1,
-0.2800714, -0.2815761, -1.859936, 0, 1, 0.4235294, 1,
-0.2773849, -0.2980202, -2.771853, 0, 1, 0.4313726, 1,
-0.2771836, 0.1679152, -1.860383, 0, 1, 0.4352941, 1,
-0.2743142, 0.5048817, -0.7838032, 0, 1, 0.4431373, 1,
-0.2733322, 0.6647947, -1.506693, 0, 1, 0.4470588, 1,
-0.271438, 0.01160655, -1.101553, 0, 1, 0.454902, 1,
-0.2663136, 2.844689, -1.069113, 0, 1, 0.4588235, 1,
-0.263541, -1.792044, -2.464508, 0, 1, 0.4666667, 1,
-0.2583885, 0.04458243, -0.3204917, 0, 1, 0.4705882, 1,
-0.2509685, 1.119525, -1.255434, 0, 1, 0.4784314, 1,
-0.2507966, -0.8502017, -4.616572, 0, 1, 0.4823529, 1,
-0.249438, 0.7995187, -0.1647839, 0, 1, 0.4901961, 1,
-0.2493403, 0.534544, -1.505034, 0, 1, 0.4941176, 1,
-0.2366694, 1.04101, 1.214219, 0, 1, 0.5019608, 1,
-0.2319077, -0.5106969, -2.941833, 0, 1, 0.509804, 1,
-0.2303064, 1.809659, 0.1875521, 0, 1, 0.5137255, 1,
-0.2298808, -0.1438269, -2.300905, 0, 1, 0.5215687, 1,
-0.2275255, -0.1197084, -1.995562, 0, 1, 0.5254902, 1,
-0.2240172, 1.105789, -0.4650657, 0, 1, 0.5333334, 1,
-0.2215839, 0.6048564, -0.1367845, 0, 1, 0.5372549, 1,
-0.2214529, -1.400769, -3.825848, 0, 1, 0.5450981, 1,
-0.220216, -1.662029, -3.897861, 0, 1, 0.5490196, 1,
-0.219972, -0.4943731, -1.538528, 0, 1, 0.5568628, 1,
-0.219928, -1.424075, -2.375121, 0, 1, 0.5607843, 1,
-0.2192287, -0.6753536, -1.537297, 0, 1, 0.5686275, 1,
-0.2155807, 0.9153833, -0.4066012, 0, 1, 0.572549, 1,
-0.2080575, 0.4112911, 0.7290277, 0, 1, 0.5803922, 1,
-0.2056744, -1.181219, -4.195979, 0, 1, 0.5843138, 1,
-0.2028469, -0.6775781, -4.000828, 0, 1, 0.5921569, 1,
-0.2025452, 1.772019, -0.6047686, 0, 1, 0.5960785, 1,
-0.2015416, 1.70486, -0.819998, 0, 1, 0.6039216, 1,
-0.1984152, -1.727554, -3.651547, 0, 1, 0.6117647, 1,
-0.1983789, 0.8930165, -1.643737, 0, 1, 0.6156863, 1,
-0.1950123, 0.2018612, 0.5512747, 0, 1, 0.6235294, 1,
-0.1886628, 1.097136, 0.5383122, 0, 1, 0.627451, 1,
-0.186865, -0.2507428, -2.96343, 0, 1, 0.6352941, 1,
-0.1779239, -0.816932, -1.336705, 0, 1, 0.6392157, 1,
-0.1755043, 0.7383164, 0.1139005, 0, 1, 0.6470588, 1,
-0.1739962, -2.109462, -2.039051, 0, 1, 0.6509804, 1,
-0.1726547, -0.2302637, -2.675001, 0, 1, 0.6588235, 1,
-0.1708486, -0.84324, -2.311841, 0, 1, 0.6627451, 1,
-0.1687458, 0.02857789, -1.955417, 0, 1, 0.6705883, 1,
-0.1657826, -0.4174292, -5.103924, 0, 1, 0.6745098, 1,
-0.1657554, 1.397709, 0.9302243, 0, 1, 0.682353, 1,
-0.1641607, -0.8502769, -4.884415, 0, 1, 0.6862745, 1,
-0.1635319, -0.5320278, -2.323048, 0, 1, 0.6941177, 1,
-0.1615221, -0.796026, -2.669154, 0, 1, 0.7019608, 1,
-0.1521267, -0.7304528, -3.2252, 0, 1, 0.7058824, 1,
-0.1449014, 1.406319, 1.402952, 0, 1, 0.7137255, 1,
-0.1427721, -0.4751835, -2.585146, 0, 1, 0.7176471, 1,
-0.1369192, 0.7659878, 0.06433393, 0, 1, 0.7254902, 1,
-0.132851, 0.7111445, 0.52061, 0, 1, 0.7294118, 1,
-0.1324899, 0.3436331, -1.175016, 0, 1, 0.7372549, 1,
-0.1318379, 0.5660744, 0.3006572, 0, 1, 0.7411765, 1,
-0.1308214, 1.424204, -1.043414, 0, 1, 0.7490196, 1,
-0.1291676, 1.175419, 2.806099, 0, 1, 0.7529412, 1,
-0.1286187, 0.9543228, -0.7031179, 0, 1, 0.7607843, 1,
-0.1167796, 0.7295143, 0.82126, 0, 1, 0.7647059, 1,
-0.1138073, -0.6454036, -2.373381, 0, 1, 0.772549, 1,
-0.1125743, -0.8229234, -1.690272, 0, 1, 0.7764706, 1,
-0.1105221, 0.1521684, -0.18096, 0, 1, 0.7843137, 1,
-0.1042775, 0.543832, -0.238637, 0, 1, 0.7882353, 1,
-0.1017577, 0.7635785, -1.399706, 0, 1, 0.7960784, 1,
-0.1001196, 0.9953943, -0.4575479, 0, 1, 0.8039216, 1,
-0.09817479, 0.5132573, 1.715218, 0, 1, 0.8078431, 1,
-0.09579196, 0.4139653, -1.217166, 0, 1, 0.8156863, 1,
-0.09485864, 3.189366, -1.219878, 0, 1, 0.8196079, 1,
-0.09410848, -0.9389611, -2.547443, 0, 1, 0.827451, 1,
-0.0937177, -0.2651797, -2.918071, 0, 1, 0.8313726, 1,
-0.09348743, 1.007321, -1.41425, 0, 1, 0.8392157, 1,
-0.09080115, 0.1010977, -0.9964765, 0, 1, 0.8431373, 1,
-0.08341964, 0.975042, 0.8379591, 0, 1, 0.8509804, 1,
-0.08236887, 0.1258399, -1.219604, 0, 1, 0.854902, 1,
-0.07613762, 0.304272, -0.8879642, 0, 1, 0.8627451, 1,
-0.07561807, -0.5957456, -4.887123, 0, 1, 0.8666667, 1,
-0.07135217, 1.369271, -0.01743961, 0, 1, 0.8745098, 1,
-0.05833188, 1.291665, -0.1214727, 0, 1, 0.8784314, 1,
-0.05764345, 0.228218, 0.02832548, 0, 1, 0.8862745, 1,
-0.05447485, 0.2738634, -2.123832, 0, 1, 0.8901961, 1,
-0.05157055, -0.6857899, -5.065691, 0, 1, 0.8980392, 1,
-0.05141268, -1.209828, -2.593379, 0, 1, 0.9058824, 1,
-0.05133037, -1.667053, -1.955261, 0, 1, 0.9098039, 1,
-0.05045386, -0.4362831, -1.586254, 0, 1, 0.9176471, 1,
-0.04388819, -0.9818971, -2.808048, 0, 1, 0.9215686, 1,
-0.04199535, 0.03105353, -1.303453, 0, 1, 0.9294118, 1,
-0.04038637, 1.960256, -0.2594406, 0, 1, 0.9333333, 1,
-0.03975553, -0.9277493, -2.574973, 0, 1, 0.9411765, 1,
-0.0382899, 0.3761623, -0.8603797, 0, 1, 0.945098, 1,
-0.03675879, 0.6129256, 0.4724393, 0, 1, 0.9529412, 1,
-0.02978823, -1.605248, -2.875158, 0, 1, 0.9568627, 1,
-0.02926968, 0.501843, -0.8638797, 0, 1, 0.9647059, 1,
-0.02485123, 1.272686, -0.5257302, 0, 1, 0.9686275, 1,
-0.02320644, 1.245591, -0.03663121, 0, 1, 0.9764706, 1,
-0.02088462, 0.6228994, -1.42039, 0, 1, 0.9803922, 1,
-0.02055168, -1.091198, -2.722388, 0, 1, 0.9882353, 1,
-0.0204191, 1.070925, -0.2416446, 0, 1, 0.9921569, 1,
-0.01951898, 1.995541, 1.174892, 0, 1, 1, 1,
-0.01690656, 0.6505395, 0.5706283, 0, 0.9921569, 1, 1,
-0.0147796, 0.297277, 0.2701006, 0, 0.9882353, 1, 1,
-0.01127782, 0.4605293, 0.3002459, 0, 0.9803922, 1, 1,
-0.003614923, 0.6127439, 0.2143649, 0, 0.9764706, 1, 1,
-0.0009948442, 0.1611754, -0.5585861, 0, 0.9686275, 1, 1,
0.00320383, -0.9596025, 1.193319, 0, 0.9647059, 1, 1,
0.009940531, -0.02461058, 3.778692, 0, 0.9568627, 1, 1,
0.01181233, 0.3810569, 0.9401515, 0, 0.9529412, 1, 1,
0.0129076, 0.136491, -0.06855292, 0, 0.945098, 1, 1,
0.01679772, 2.516189, -0.5991391, 0, 0.9411765, 1, 1,
0.02011284, 1.922846, 0.3647673, 0, 0.9333333, 1, 1,
0.02526798, -0.8272226, 5.142689, 0, 0.9294118, 1, 1,
0.02847598, 0.2071301, 0.8656579, 0, 0.9215686, 1, 1,
0.03345245, 0.1368786, -0.2990304, 0, 0.9176471, 1, 1,
0.03974545, -0.6073262, 3.330025, 0, 0.9098039, 1, 1,
0.04388593, 1.383698, 0.3471001, 0, 0.9058824, 1, 1,
0.0453459, 0.6856782, -0.6860808, 0, 0.8980392, 1, 1,
0.04848144, -1.480711, 1.653461, 0, 0.8901961, 1, 1,
0.05045023, -0.006332109, 0.5331489, 0, 0.8862745, 1, 1,
0.05376903, -1.108162, 3.760547, 0, 0.8784314, 1, 1,
0.05620296, -0.9684365, 2.982809, 0, 0.8745098, 1, 1,
0.05803274, 0.1702422, -1.523974, 0, 0.8666667, 1, 1,
0.05866547, 1.358548, -1.485914, 0, 0.8627451, 1, 1,
0.06371684, -1.681357, 4.562889, 0, 0.854902, 1, 1,
0.06978282, -0.375385, 0.2238541, 0, 0.8509804, 1, 1,
0.07495901, 0.05238556, 1.312071, 0, 0.8431373, 1, 1,
0.07537279, 0.4536093, 0.09095773, 0, 0.8392157, 1, 1,
0.07879218, 0.1593696, 1.149397, 0, 0.8313726, 1, 1,
0.0809042, -0.846814, 3.904812, 0, 0.827451, 1, 1,
0.08377452, 1.632649, -0.08855941, 0, 0.8196079, 1, 1,
0.08466435, -0.5678043, 1.996694, 0, 0.8156863, 1, 1,
0.08534293, -0.7790222, 2.569071, 0, 0.8078431, 1, 1,
0.08796037, -0.3058183, 2.718087, 0, 0.8039216, 1, 1,
0.09122762, -1.472498, 0.9697973, 0, 0.7960784, 1, 1,
0.09287393, 0.8289991, -0.6460648, 0, 0.7882353, 1, 1,
0.09567367, 0.002784373, 3.96328, 0, 0.7843137, 1, 1,
0.1021298, 0.4714985, -0.622714, 0, 0.7764706, 1, 1,
0.1028196, -0.9201008, 4.26791, 0, 0.772549, 1, 1,
0.1045582, -1.69101, 2.611946, 0, 0.7647059, 1, 1,
0.1058798, -0.5195104, 4.077343, 0, 0.7607843, 1, 1,
0.106342, -0.7732869, 3.260401, 0, 0.7529412, 1, 1,
0.1103904, -1.102747, 1.588508, 0, 0.7490196, 1, 1,
0.1163785, 2.509986, 1.612039, 0, 0.7411765, 1, 1,
0.1167533, 0.2511995, 2.641121, 0, 0.7372549, 1, 1,
0.1179063, 0.1667506, -0.7144886, 0, 0.7294118, 1, 1,
0.1194252, 0.5850584, -0.1633183, 0, 0.7254902, 1, 1,
0.1199371, 1.308777, -1.701365, 0, 0.7176471, 1, 1,
0.1199505, -0.2669211, 3.041183, 0, 0.7137255, 1, 1,
0.1202598, -0.4461473, 3.344448, 0, 0.7058824, 1, 1,
0.1245695, -0.3903526, 2.448196, 0, 0.6980392, 1, 1,
0.1262406, 0.3263823, 0.7798916, 0, 0.6941177, 1, 1,
0.1290178, -1.231015, 1.780894, 0, 0.6862745, 1, 1,
0.1331707, 1.880663, 1.585914, 0, 0.682353, 1, 1,
0.1343403, -1.130695, 3.544559, 0, 0.6745098, 1, 1,
0.1344595, 1.864338, -0.6216491, 0, 0.6705883, 1, 1,
0.1362089, -0.2058446, 2.942394, 0, 0.6627451, 1, 1,
0.1364373, 1.213288, 0.4216263, 0, 0.6588235, 1, 1,
0.1369303, 0.6234978, 0.3269754, 0, 0.6509804, 1, 1,
0.1375437, 1.661321, 0.6367557, 0, 0.6470588, 1, 1,
0.1430794, -1.511876, 2.91398, 0, 0.6392157, 1, 1,
0.1468323, -1.378445, 4.271447, 0, 0.6352941, 1, 1,
0.1472056, 0.9654215, 0.1358115, 0, 0.627451, 1, 1,
0.1521062, -0.3872238, 3.267652, 0, 0.6235294, 1, 1,
0.1527449, -0.2888642, 2.197859, 0, 0.6156863, 1, 1,
0.1528011, 0.7210519, -0.01006295, 0, 0.6117647, 1, 1,
0.1529821, 1.849793, -0.6418658, 0, 0.6039216, 1, 1,
0.1546349, -0.6375416, 1.868712, 0, 0.5960785, 1, 1,
0.1558301, -1.446614, 2.919409, 0, 0.5921569, 1, 1,
0.1582614, -0.9766345, 3.460212, 0, 0.5843138, 1, 1,
0.1611628, 0.5331612, 2.208273, 0, 0.5803922, 1, 1,
0.1664709, 0.9008543, -0.8449428, 0, 0.572549, 1, 1,
0.16728, -0.3527088, 3.404756, 0, 0.5686275, 1, 1,
0.1716592, -0.4042724, 2.513843, 0, 0.5607843, 1, 1,
0.1718889, -0.8542774, 1.731119, 0, 0.5568628, 1, 1,
0.1718943, 0.5744434, -0.9206778, 0, 0.5490196, 1, 1,
0.1759399, -0.3990954, 0.8253036, 0, 0.5450981, 1, 1,
0.179215, -0.3301519, 0.6566297, 0, 0.5372549, 1, 1,
0.1837864, -0.849847, 3.888725, 0, 0.5333334, 1, 1,
0.1841375, 1.724647, 0.01684915, 0, 0.5254902, 1, 1,
0.1860655, -0.4132287, 3.571764, 0, 0.5215687, 1, 1,
0.1879088, -0.1542591, 0.9710747, 0, 0.5137255, 1, 1,
0.1883131, 0.1680774, -0.05897671, 0, 0.509804, 1, 1,
0.1920552, 0.1398775, 0.5903687, 0, 0.5019608, 1, 1,
0.194398, 0.2008925, 0.2824249, 0, 0.4941176, 1, 1,
0.1998313, -0.1272988, 1.591224, 0, 0.4901961, 1, 1,
0.2052349, 0.03333659, 0.3292592, 0, 0.4823529, 1, 1,
0.2108056, -0.09782829, 1.127862, 0, 0.4784314, 1, 1,
0.2125902, -0.08286177, 3.621749, 0, 0.4705882, 1, 1,
0.2170718, 0.009595526, 0.6806635, 0, 0.4666667, 1, 1,
0.2179196, 1.336016, 1.020708, 0, 0.4588235, 1, 1,
0.2215526, 0.09041143, 3.130281, 0, 0.454902, 1, 1,
0.2236991, 0.7570443, 0.8539483, 0, 0.4470588, 1, 1,
0.2243842, 0.744383, 0.6771306, 0, 0.4431373, 1, 1,
0.2271437, 0.4773405, 1.96812, 0, 0.4352941, 1, 1,
0.2287894, 1.055254, -0.743565, 0, 0.4313726, 1, 1,
0.2353044, -0.4872043, 1.898374, 0, 0.4235294, 1, 1,
0.2353516, -0.6835234, 4.248811, 0, 0.4196078, 1, 1,
0.2366783, -0.9652153, 3.545969, 0, 0.4117647, 1, 1,
0.2386378, -0.5330951, 2.027893, 0, 0.4078431, 1, 1,
0.2445292, 0.393122, -1.243817, 0, 0.4, 1, 1,
0.2461858, -2.497031, 2.923363, 0, 0.3921569, 1, 1,
0.246729, -0.1808371, 2.271778, 0, 0.3882353, 1, 1,
0.2488399, -0.3633029, 3.143449, 0, 0.3803922, 1, 1,
0.255942, -0.3693001, 1.237808, 0, 0.3764706, 1, 1,
0.2572429, -1.586565, 1.639565, 0, 0.3686275, 1, 1,
0.2584121, -0.1243416, 1.229472, 0, 0.3647059, 1, 1,
0.2612433, 0.08402625, 2.330942, 0, 0.3568628, 1, 1,
0.2620444, -0.5127645, 1.737514, 0, 0.3529412, 1, 1,
0.2628954, -0.5554169, 2.514767, 0, 0.345098, 1, 1,
0.2637293, 0.6585946, -0.6461623, 0, 0.3411765, 1, 1,
0.2684308, 1.016846, 0.9528863, 0, 0.3333333, 1, 1,
0.2696885, 0.1420608, 1.08539, 0, 0.3294118, 1, 1,
0.2723125, 0.9294111, 0.4769252, 0, 0.3215686, 1, 1,
0.274485, -1.609322, 3.222797, 0, 0.3176471, 1, 1,
0.2768047, 0.1203335, -0.2870215, 0, 0.3098039, 1, 1,
0.2780778, 2.117568, -0.1494873, 0, 0.3058824, 1, 1,
0.2788717, 0.01160124, 2.351454, 0, 0.2980392, 1, 1,
0.2827105, -0.2253966, 3.433719, 0, 0.2901961, 1, 1,
0.2973919, -1.215692, 2.554371, 0, 0.2862745, 1, 1,
0.2978297, -1.513375, 3.277459, 0, 0.2784314, 1, 1,
0.3016445, 1.174968, -0.5087147, 0, 0.2745098, 1, 1,
0.3035441, 1.486837, -1.080642, 0, 0.2666667, 1, 1,
0.308035, -0.1784035, 0.9847353, 0, 0.2627451, 1, 1,
0.3084547, -1.924131, 4.138937, 0, 0.254902, 1, 1,
0.3086007, 0.4986034, 0.901434, 0, 0.2509804, 1, 1,
0.3131942, -0.4538944, 3.059043, 0, 0.2431373, 1, 1,
0.3154627, 0.3245277, 3.161327, 0, 0.2392157, 1, 1,
0.3156716, 0.0582065, -0.08721343, 0, 0.2313726, 1, 1,
0.3164678, -0.8213848, 2.255179, 0, 0.227451, 1, 1,
0.3179853, -0.3685268, 1.703049, 0, 0.2196078, 1, 1,
0.3247349, 0.6007886, -0.5339642, 0, 0.2156863, 1, 1,
0.3286242, -2.473888, 4.686081, 0, 0.2078431, 1, 1,
0.3311737, -0.4383081, 2.565719, 0, 0.2039216, 1, 1,
0.3400458, -0.9713383, 2.878714, 0, 0.1960784, 1, 1,
0.3421138, -0.8846521, 2.153788, 0, 0.1882353, 1, 1,
0.343773, -1.109993, 3.750572, 0, 0.1843137, 1, 1,
0.3442444, -1.504957, 2.955506, 0, 0.1764706, 1, 1,
0.3511822, 1.292698, 0.2141885, 0, 0.172549, 1, 1,
0.3532332, -2.826265, 2.614493, 0, 0.1647059, 1, 1,
0.3558764, 0.1232263, 0.3186868, 0, 0.1607843, 1, 1,
0.358414, 1.165833, -1.170494, 0, 0.1529412, 1, 1,
0.3600712, 0.2173277, 0.9502614, 0, 0.1490196, 1, 1,
0.3626629, 1.234841, 1.555274, 0, 0.1411765, 1, 1,
0.3635349, 0.002040558, 1.971561, 0, 0.1372549, 1, 1,
0.3676181, 1.309774, 2.177463, 0, 0.1294118, 1, 1,
0.372393, -0.1755171, 2.257202, 0, 0.1254902, 1, 1,
0.3757926, 0.04754009, 1.06795, 0, 0.1176471, 1, 1,
0.3788033, -0.02443729, 2.269584, 0, 0.1137255, 1, 1,
0.3793483, 0.2826974, 1.406447, 0, 0.1058824, 1, 1,
0.3809819, -0.08076917, 1.797208, 0, 0.09803922, 1, 1,
0.3835551, 1.068036, -0.8207908, 0, 0.09411765, 1, 1,
0.3876558, 0.04882474, 1.367865, 0, 0.08627451, 1, 1,
0.3898232, 1.576241, 0.9247862, 0, 0.08235294, 1, 1,
0.3956835, -0.5424082, 3.527713, 0, 0.07450981, 1, 1,
0.3966751, -0.08388915, 0.03690748, 0, 0.07058824, 1, 1,
0.3983022, 0.3196425, -0.4616858, 0, 0.0627451, 1, 1,
0.401219, 1.35262, 0.749948, 0, 0.05882353, 1, 1,
0.4085608, -0.3735023, 0.6770787, 0, 0.05098039, 1, 1,
0.4092636, 0.6889127, 0.8761303, 0, 0.04705882, 1, 1,
0.4094398, -0.02970279, 3.332932, 0, 0.03921569, 1, 1,
0.4224945, -0.7298708, 2.727926, 0, 0.03529412, 1, 1,
0.4233781, -1.535802, 3.45117, 0, 0.02745098, 1, 1,
0.4272884, 0.2631207, 0.5867017, 0, 0.02352941, 1, 1,
0.4284573, 0.8251668, -0.196394, 0, 0.01568628, 1, 1,
0.4288563, 2.016034, 1.642591, 0, 0.01176471, 1, 1,
0.4294054, 2.546901, 0.9341331, 0, 0.003921569, 1, 1,
0.4313637, -0.6683137, 1.934218, 0.003921569, 0, 1, 1,
0.4315683, -0.9344483, 2.658238, 0.007843138, 0, 1, 1,
0.4320956, 0.2023783, 1.251812, 0.01568628, 0, 1, 1,
0.4386896, 0.2039401, 1.032665, 0.01960784, 0, 1, 1,
0.444778, -0.9350781, 2.377472, 0.02745098, 0, 1, 1,
0.4456744, -0.9397786, 1.623274, 0.03137255, 0, 1, 1,
0.4506498, 0.4335815, 2.524325, 0.03921569, 0, 1, 1,
0.45218, 0.3218948, 2.764902, 0.04313726, 0, 1, 1,
0.4537603, 1.017848, 0.5386444, 0.05098039, 0, 1, 1,
0.4543805, -1.273001, 2.781009, 0.05490196, 0, 1, 1,
0.4653635, -0.7690431, 1.718269, 0.0627451, 0, 1, 1,
0.4654191, -0.4537832, 2.397818, 0.06666667, 0, 1, 1,
0.4659975, -1.348356, 3.77617, 0.07450981, 0, 1, 1,
0.4701551, 0.2079443, 2.263829, 0.07843138, 0, 1, 1,
0.4716127, -0.01004029, 2.012612, 0.08627451, 0, 1, 1,
0.4718907, -0.1508593, 3.90434, 0.09019608, 0, 1, 1,
0.4730985, 0.5751211, 1.186439, 0.09803922, 0, 1, 1,
0.4753428, 1.335793, 0.7200656, 0.1058824, 0, 1, 1,
0.4763167, 1.25268, -0.09181429, 0.1098039, 0, 1, 1,
0.4776575, -0.05472057, 1.327417, 0.1176471, 0, 1, 1,
0.4806034, -0.4930944, 1.740982, 0.1215686, 0, 1, 1,
0.4819722, -0.4540594, -0.2723762, 0.1294118, 0, 1, 1,
0.4820484, -1.252035, 1.610288, 0.1333333, 0, 1, 1,
0.4832816, -1.576038, 3.419117, 0.1411765, 0, 1, 1,
0.4851096, 0.4799362, 0.8538826, 0.145098, 0, 1, 1,
0.4882138, -0.920437, 3.320989, 0.1529412, 0, 1, 1,
0.4927592, 1.425299, 1.976776, 0.1568628, 0, 1, 1,
0.4953444, 0.2323754, 1.09873, 0.1647059, 0, 1, 1,
0.5049005, 0.7772467, 0.6937759, 0.1686275, 0, 1, 1,
0.5071406, 0.3302258, 2.01791, 0.1764706, 0, 1, 1,
0.5081404, -0.5078449, 0.958626, 0.1803922, 0, 1, 1,
0.5167852, -1.096207, 1.733868, 0.1882353, 0, 1, 1,
0.5185781, -2.418507, 3.696916, 0.1921569, 0, 1, 1,
0.5272404, 0.1446514, -0.638779, 0.2, 0, 1, 1,
0.5357674, -1.386381, 4.349705, 0.2078431, 0, 1, 1,
0.5451219, 1.028625, 1.034536, 0.2117647, 0, 1, 1,
0.5560497, 1.859115, 3.285137, 0.2196078, 0, 1, 1,
0.5562848, 0.4441277, 3.226263, 0.2235294, 0, 1, 1,
0.558179, -1.727971, 3.872017, 0.2313726, 0, 1, 1,
0.5590963, -0.06147636, 1.812607, 0.2352941, 0, 1, 1,
0.5596512, -0.08998943, 1.600859, 0.2431373, 0, 1, 1,
0.5610385, 1.271567, -0.0580295, 0.2470588, 0, 1, 1,
0.5613522, -0.6095417, 3.445043, 0.254902, 0, 1, 1,
0.5736896, 0.6425554, 0.05945058, 0.2588235, 0, 1, 1,
0.5815637, -0.235517, 1.943267, 0.2666667, 0, 1, 1,
0.5904028, 0.161451, 0.6237512, 0.2705882, 0, 1, 1,
0.5932189, 0.5347858, 0.9378215, 0.2784314, 0, 1, 1,
0.5977216, -0.9382042, 3.061497, 0.282353, 0, 1, 1,
0.6005265, -0.4461738, 1.767142, 0.2901961, 0, 1, 1,
0.6029074, -0.7077783, 1.033023, 0.2941177, 0, 1, 1,
0.6092806, 0.9670733, 0.5780339, 0.3019608, 0, 1, 1,
0.6148298, -0.06858366, 2.046347, 0.3098039, 0, 1, 1,
0.6222154, -1.251706, 4.265851, 0.3137255, 0, 1, 1,
0.6239549, 0.6588255, 0.4430114, 0.3215686, 0, 1, 1,
0.6274505, 0.5714769, 1.810228, 0.3254902, 0, 1, 1,
0.6298258, 1.100214, -0.01595674, 0.3333333, 0, 1, 1,
0.632072, 0.8896947, 1.946404, 0.3372549, 0, 1, 1,
0.6321091, -1.018535, 4.380534, 0.345098, 0, 1, 1,
0.6378893, -0.6365898, 2.779561, 0.3490196, 0, 1, 1,
0.6383398, 0.897751, -1.245208, 0.3568628, 0, 1, 1,
0.6397398, -1.074752, 3.739156, 0.3607843, 0, 1, 1,
0.6399577, -2.026117, 2.414269, 0.3686275, 0, 1, 1,
0.6449354, -2.363989, 3.334073, 0.372549, 0, 1, 1,
0.6454164, -0.7002357, 1.927571, 0.3803922, 0, 1, 1,
0.6506057, -0.8241757, 2.381191, 0.3843137, 0, 1, 1,
0.6507109, 0.2199695, 1.818241, 0.3921569, 0, 1, 1,
0.6563435, -1.132854, 3.341657, 0.3960784, 0, 1, 1,
0.6566095, -0.2890228, -0.7280614, 0.4039216, 0, 1, 1,
0.6576461, 1.890734, 0.3937644, 0.4117647, 0, 1, 1,
0.6597719, -0.238641, 2.135066, 0.4156863, 0, 1, 1,
0.6651589, 0.6298152, -0.9128464, 0.4235294, 0, 1, 1,
0.6734172, 0.3049227, 0.1498651, 0.427451, 0, 1, 1,
0.6754407, 0.4576175, 0.7446415, 0.4352941, 0, 1, 1,
0.6774099, -0.1332977, 2.89038, 0.4392157, 0, 1, 1,
0.6810296, 0.6035093, 0.1408128, 0.4470588, 0, 1, 1,
0.68709, 0.09670614, 1.701212, 0.4509804, 0, 1, 1,
0.6877372, -0.5752338, 3.213896, 0.4588235, 0, 1, 1,
0.6895677, 0.224829, 1.232847, 0.4627451, 0, 1, 1,
0.6918576, -0.7827346, 2.190226, 0.4705882, 0, 1, 1,
0.7023392, 0.9577347, -0.1803924, 0.4745098, 0, 1, 1,
0.7068174, 0.2559628, 1.138211, 0.4823529, 0, 1, 1,
0.7073284, -0.3330176, 1.368426, 0.4862745, 0, 1, 1,
0.7085761, -2.551866, 4.875063, 0.4941176, 0, 1, 1,
0.7089995, 0.04093765, 3.122494, 0.5019608, 0, 1, 1,
0.7090493, 0.5521913, 0.4872322, 0.5058824, 0, 1, 1,
0.7090796, 0.6243993, -0.5487891, 0.5137255, 0, 1, 1,
0.7091431, 0.7394726, -0.3089632, 0.5176471, 0, 1, 1,
0.7102609, -1.138372, -0.118116, 0.5254902, 0, 1, 1,
0.7195379, 1.46321, -1.042222, 0.5294118, 0, 1, 1,
0.7215102, -0.5798903, 1.177868, 0.5372549, 0, 1, 1,
0.7246589, 0.2000789, 0.06671823, 0.5411765, 0, 1, 1,
0.7273483, 0.6779531, 2.421123, 0.5490196, 0, 1, 1,
0.7294841, 1.680337, 1.701557, 0.5529412, 0, 1, 1,
0.7353849, -0.1700156, 1.379772, 0.5607843, 0, 1, 1,
0.7424864, -1.473303, 1.404055, 0.5647059, 0, 1, 1,
0.7428942, 0.445462, 1.153497, 0.572549, 0, 1, 1,
0.7446371, -0.9148754, 2.341134, 0.5764706, 0, 1, 1,
0.7470487, -0.9098374, 2.334938, 0.5843138, 0, 1, 1,
0.7498841, -3.252587, 4.255662, 0.5882353, 0, 1, 1,
0.7517639, 1.481953, -1.366974, 0.5960785, 0, 1, 1,
0.7524195, -0.8653235, 2.693522, 0.6039216, 0, 1, 1,
0.7577132, -0.2189984, 1.441742, 0.6078432, 0, 1, 1,
0.7592438, 0.146525, 3.031204, 0.6156863, 0, 1, 1,
0.7608563, -1.440659, 3.734025, 0.6196079, 0, 1, 1,
0.7645757, -0.6345375, 1.821442, 0.627451, 0, 1, 1,
0.7664053, 1.484732, -0.2704213, 0.6313726, 0, 1, 1,
0.7719543, 1.25017, 1.206601, 0.6392157, 0, 1, 1,
0.7764335, -0.5792606, 3.545374, 0.6431373, 0, 1, 1,
0.776867, -0.8285225, 2.533444, 0.6509804, 0, 1, 1,
0.7769744, 0.06680814, 2.023657, 0.654902, 0, 1, 1,
0.7831063, 0.8513941, -0.8060045, 0.6627451, 0, 1, 1,
0.7989165, 0.4704472, 2.414292, 0.6666667, 0, 1, 1,
0.8004875, 0.5256314, 1.144555, 0.6745098, 0, 1, 1,
0.8046014, 0.1722207, 0.5771486, 0.6784314, 0, 1, 1,
0.8054262, 0.6198664, 0.3048018, 0.6862745, 0, 1, 1,
0.8055999, 1.053383, -0.2094948, 0.6901961, 0, 1, 1,
0.8069364, 1.116811, -1.160806, 0.6980392, 0, 1, 1,
0.8105909, 0.483523, -0.01740616, 0.7058824, 0, 1, 1,
0.8122626, 0.2180947, 1.065363, 0.7098039, 0, 1, 1,
0.8129778, 1.21332, 0.8764421, 0.7176471, 0, 1, 1,
0.8186427, 0.141683, 1.195694, 0.7215686, 0, 1, 1,
0.8203113, -0.8012563, 0.1678932, 0.7294118, 0, 1, 1,
0.8217435, -1.452, 3.640316, 0.7333333, 0, 1, 1,
0.8292658, -0.4089628, 1.326114, 0.7411765, 0, 1, 1,
0.8302189, 0.4682208, 2.305511, 0.7450981, 0, 1, 1,
0.8379856, 0.4533924, 3.139474, 0.7529412, 0, 1, 1,
0.8386561, -0.4637171, 2.000126, 0.7568628, 0, 1, 1,
0.8399583, -0.4084519, 0.9463251, 0.7647059, 0, 1, 1,
0.8414055, -0.2518304, 2.40912, 0.7686275, 0, 1, 1,
0.8430647, -0.2734761, 3.749686, 0.7764706, 0, 1, 1,
0.8432598, 0.3047042, 1.877233, 0.7803922, 0, 1, 1,
0.8484699, -0.3146698, 2.090467, 0.7882353, 0, 1, 1,
0.851802, -0.3789272, 3.541366, 0.7921569, 0, 1, 1,
0.8523936, -2.518086, 1.424918, 0.8, 0, 1, 1,
0.8594116, 0.795316, 0.6467351, 0.8078431, 0, 1, 1,
0.8605674, 1.286234, -1.499961, 0.8117647, 0, 1, 1,
0.8620421, -0.9455376, 3.795458, 0.8196079, 0, 1, 1,
0.8631814, 1.616977, 1.929375, 0.8235294, 0, 1, 1,
0.8700833, -0.5825009, 2.012116, 0.8313726, 0, 1, 1,
0.8747936, -0.1705301, 0.9353639, 0.8352941, 0, 1, 1,
0.8780709, 0.3508368, 1.609743, 0.8431373, 0, 1, 1,
0.88232, 0.3266574, 0.9538785, 0.8470588, 0, 1, 1,
0.8841621, 1.647798, 1.907297, 0.854902, 0, 1, 1,
0.8904808, 0.6401265, 1.251873, 0.8588235, 0, 1, 1,
0.8972219, 0.4363193, 1.774408, 0.8666667, 0, 1, 1,
0.9003882, -1.623584, 1.487528, 0.8705882, 0, 1, 1,
0.9009005, 0.785199, 1.450866, 0.8784314, 0, 1, 1,
0.9012885, 0.1347339, 0.7975676, 0.8823529, 0, 1, 1,
0.9024829, 0.3123676, 1.071334, 0.8901961, 0, 1, 1,
0.90402, -0.8207083, 2.2218, 0.8941177, 0, 1, 1,
0.9040784, 0.349779, 0.8321933, 0.9019608, 0, 1, 1,
0.9224777, 0.2043267, 1.047386, 0.9098039, 0, 1, 1,
0.9245166, -2.510731, 2.558304, 0.9137255, 0, 1, 1,
0.9284451, 2.043547, -0.7728019, 0.9215686, 0, 1, 1,
0.9373035, -0.2023345, 1.186504, 0.9254902, 0, 1, 1,
0.9375961, 1.227775, 1.448426, 0.9333333, 0, 1, 1,
0.9382725, 0.00275676, 0.634118, 0.9372549, 0, 1, 1,
0.9383711, -0.9066519, 2.094453, 0.945098, 0, 1, 1,
0.939314, -1.973407, 2.793539, 0.9490196, 0, 1, 1,
0.9393473, -0.8151228, 3.017903, 0.9568627, 0, 1, 1,
0.9438506, 1.457737, 0.408239, 0.9607843, 0, 1, 1,
0.9441708, -0.3980417, 1.470984, 0.9686275, 0, 1, 1,
0.9491292, 1.048536, -0.5782348, 0.972549, 0, 1, 1,
0.9518281, 0.4273898, 1.300175, 0.9803922, 0, 1, 1,
0.9518604, -0.6204842, 1.748395, 0.9843137, 0, 1, 1,
0.9577984, 1.176922, 0.6767425, 0.9921569, 0, 1, 1,
0.9632867, 0.193386, 1.981151, 0.9960784, 0, 1, 1,
0.9642872, 0.5358909, 1.493619, 1, 0, 0.9960784, 1,
0.9647329, -0.8574235, 0.8355672, 1, 0, 0.9882353, 1,
0.9700807, -0.3135707, 2.632718, 1, 0, 0.9843137, 1,
0.9712726, 0.112419, 0.7565659, 1, 0, 0.9764706, 1,
0.9717548, 1.08471, 0.8693858, 1, 0, 0.972549, 1,
0.9729506, -0.7831241, 3.933662, 1, 0, 0.9647059, 1,
0.9749206, 0.2021733, 1.557773, 1, 0, 0.9607843, 1,
0.977205, 0.6865753, 0.7638454, 1, 0, 0.9529412, 1,
0.9839005, -1.199613, 1.785436, 1, 0, 0.9490196, 1,
0.9853063, 0.7497002, -0.8628849, 1, 0, 0.9411765, 1,
0.9937663, -0.8458018, 2.635912, 1, 0, 0.9372549, 1,
0.9949007, -0.2029505, 1.041197, 1, 0, 0.9294118, 1,
0.9965222, -1.160088, 1.205091, 1, 0, 0.9254902, 1,
0.9991108, -0.6764567, 0.9160304, 1, 0, 0.9176471, 1,
1.001405, 0.09240911, -0.005127877, 1, 0, 0.9137255, 1,
1.009607, 1.939231, -0.0151271, 1, 0, 0.9058824, 1,
1.018474, -2.075063, 2.268529, 1, 0, 0.9019608, 1,
1.020193, -1.121325, 4.258015, 1, 0, 0.8941177, 1,
1.021404, 0.2410844, 1.343104, 1, 0, 0.8862745, 1,
1.025335, -0.3131272, 3.730448, 1, 0, 0.8823529, 1,
1.03192, -1.199138, 2.67845, 1, 0, 0.8745098, 1,
1.035388, 0.4654563, 1.377975, 1, 0, 0.8705882, 1,
1.036111, -0.7246516, 1.415556, 1, 0, 0.8627451, 1,
1.045729, 1.114449, 0.6502438, 1, 0, 0.8588235, 1,
1.045879, -1.124132, 1.564954, 1, 0, 0.8509804, 1,
1.04865, 0.7561324, 1.280481, 1, 0, 0.8470588, 1,
1.058109, -1.218364, 2.10663, 1, 0, 0.8392157, 1,
1.066737, -2.199677, 2.408095, 1, 0, 0.8352941, 1,
1.071246, -0.2552524, 1.552496, 1, 0, 0.827451, 1,
1.071667, -0.6085293, 2.437976, 1, 0, 0.8235294, 1,
1.078138, 0.7915002, 1.067935, 1, 0, 0.8156863, 1,
1.085152, 0.737514, 2.605079, 1, 0, 0.8117647, 1,
1.089718, -0.1052996, 0.4525137, 1, 0, 0.8039216, 1,
1.097733, 0.8436986, 0.5242285, 1, 0, 0.7960784, 1,
1.114036, -1.106218, 2.881536, 1, 0, 0.7921569, 1,
1.114189, 0.6062914, 1.982273, 1, 0, 0.7843137, 1,
1.115886, 1.422473, 0.3877799, 1, 0, 0.7803922, 1,
1.124413, 0.9751763, 0.9851383, 1, 0, 0.772549, 1,
1.129832, 0.2383743, 0.9349611, 1, 0, 0.7686275, 1,
1.150985, 0.02624682, 1.440416, 1, 0, 0.7607843, 1,
1.152015, 1.042393, -1.147007, 1, 0, 0.7568628, 1,
1.153837, -0.2110856, 2.019251, 1, 0, 0.7490196, 1,
1.156692, -0.1284083, 3.262515, 1, 0, 0.7450981, 1,
1.160951, 1.076206, 0.1063717, 1, 0, 0.7372549, 1,
1.167995, -0.6253685, 3.382967, 1, 0, 0.7333333, 1,
1.170351, -1.07435, -0.04453846, 1, 0, 0.7254902, 1,
1.17329, 0.02477857, 0.5311323, 1, 0, 0.7215686, 1,
1.175125, -0.8340212, 2.706352, 1, 0, 0.7137255, 1,
1.181131, 1.67518, 0.1121986, 1, 0, 0.7098039, 1,
1.188652, 0.7331119, 1.268254, 1, 0, 0.7019608, 1,
1.20202, -2.427235, 3.499188, 1, 0, 0.6941177, 1,
1.213281, 0.07520287, 2.23418, 1, 0, 0.6901961, 1,
1.2213, -0.3688985, 1.230384, 1, 0, 0.682353, 1,
1.222165, 1.73847, 0.4975765, 1, 0, 0.6784314, 1,
1.232972, 0.3447039, 0.9405105, 1, 0, 0.6705883, 1,
1.233156, 0.3818091, 1.086186, 1, 0, 0.6666667, 1,
1.234078, 2.443042, 0.4595421, 1, 0, 0.6588235, 1,
1.236257, -0.1219213, 0.8572423, 1, 0, 0.654902, 1,
1.246526, -0.7903877, 1.56402, 1, 0, 0.6470588, 1,
1.247918, -2.251583, 4.501293, 1, 0, 0.6431373, 1,
1.269205, -1.634887, 2.932309, 1, 0, 0.6352941, 1,
1.269657, 0.5220335, 0.2734367, 1, 0, 0.6313726, 1,
1.280148, 0.6647639, 2.918066, 1, 0, 0.6235294, 1,
1.28563, -1.145038, 2.518038, 1, 0, 0.6196079, 1,
1.287534, 0.6079267, -0.4231666, 1, 0, 0.6117647, 1,
1.292588, -0.1731054, -0.04276211, 1, 0, 0.6078432, 1,
1.296038, -0.9081203, 1.167452, 1, 0, 0.6, 1,
1.29896, -1.397482, 2.932229, 1, 0, 0.5921569, 1,
1.301924, 0.6550058, 1.337571, 1, 0, 0.5882353, 1,
1.311621, 0.3454878, 3.212757, 1, 0, 0.5803922, 1,
1.315394, 1.040435, 0.2265939, 1, 0, 0.5764706, 1,
1.319605, 1.506388, 2.464733, 1, 0, 0.5686275, 1,
1.320071, 0.9715812, 2.036569, 1, 0, 0.5647059, 1,
1.321141, 0.3467859, 1.184485, 1, 0, 0.5568628, 1,
1.330173, -0.2172523, 3.382157, 1, 0, 0.5529412, 1,
1.350955, 0.3116286, 3.115645, 1, 0, 0.5450981, 1,
1.351387, 1.899249, 0.59619, 1, 0, 0.5411765, 1,
1.353189, -0.1536672, 1.135537, 1, 0, 0.5333334, 1,
1.356295, 1.082096, 2.196953, 1, 0, 0.5294118, 1,
1.359387, -0.01245763, 2.033361, 1, 0, 0.5215687, 1,
1.368307, -0.00738079, 2.344145, 1, 0, 0.5176471, 1,
1.37097, 0.4282588, 2.471756, 1, 0, 0.509804, 1,
1.376485, -0.5926653, 2.865428, 1, 0, 0.5058824, 1,
1.377323, -1.107459, 1.858704, 1, 0, 0.4980392, 1,
1.400551, -0.7589834, 1.871902, 1, 0, 0.4901961, 1,
1.406305, 1.339777, -0.5906404, 1, 0, 0.4862745, 1,
1.40888, 0.6703027, 1.361738, 1, 0, 0.4784314, 1,
1.409162, -0.3030978, 1.894563, 1, 0, 0.4745098, 1,
1.417091, -0.0259548, 1.3357, 1, 0, 0.4666667, 1,
1.418173, -2.305856, 2.417569, 1, 0, 0.4627451, 1,
1.432935, 1.269784, 1.263109, 1, 0, 0.454902, 1,
1.443844, -0.2866989, 1.926676, 1, 0, 0.4509804, 1,
1.446889, 0.3411319, 2.451986, 1, 0, 0.4431373, 1,
1.45036, 1.736804, 1.667771, 1, 0, 0.4392157, 1,
1.453017, -1.569783, 0.6653811, 1, 0, 0.4313726, 1,
1.453165, 0.2919708, -0.2455063, 1, 0, 0.427451, 1,
1.455604, -1.859165, 2.461968, 1, 0, 0.4196078, 1,
1.457662, -1.093724, 2.145727, 1, 0, 0.4156863, 1,
1.475608, 0.7419282, 0.3063493, 1, 0, 0.4078431, 1,
1.489881, -1.305475, 2.616935, 1, 0, 0.4039216, 1,
1.491888, -0.1055602, 1.832952, 1, 0, 0.3960784, 1,
1.49622, 0.5744046, 2.812488, 1, 0, 0.3882353, 1,
1.500618, 1.27084, 0.1013058, 1, 0, 0.3843137, 1,
1.502048, -1.536612, 2.702904, 1, 0, 0.3764706, 1,
1.503174, -0.07307205, 2.587957, 1, 0, 0.372549, 1,
1.522353, -1.38289, 3.802289, 1, 0, 0.3647059, 1,
1.531939, 0.07873439, 2.182544, 1, 0, 0.3607843, 1,
1.561103, 1.748483, -1.775464, 1, 0, 0.3529412, 1,
1.563356, 0.3436349, 1.141465, 1, 0, 0.3490196, 1,
1.56547, -0.2335033, 3.015475, 1, 0, 0.3411765, 1,
1.591153, 0.4226197, 0.7395722, 1, 0, 0.3372549, 1,
1.600235, -0.9177775, 1.450347, 1, 0, 0.3294118, 1,
1.601612, -1.415848, 1.162559, 1, 0, 0.3254902, 1,
1.601764, -0.9834687, 2.102897, 1, 0, 0.3176471, 1,
1.610502, 1.276481, 2.849413, 1, 0, 0.3137255, 1,
1.624551, 0.2242682, 1.346932, 1, 0, 0.3058824, 1,
1.626477, 0.2251332, 2.567653, 1, 0, 0.2980392, 1,
1.626525, 1.765754, -0.009508369, 1, 0, 0.2941177, 1,
1.629973, -0.6512688, 2.955183, 1, 0, 0.2862745, 1,
1.648424, 0.1573243, 0.6334516, 1, 0, 0.282353, 1,
1.653201, 0.3772885, 1.126687, 1, 0, 0.2745098, 1,
1.66064, -0.5811409, -0.4731913, 1, 0, 0.2705882, 1,
1.67687, 0.4210057, 1.301479, 1, 0, 0.2627451, 1,
1.68724, 0.7544486, 2.57508, 1, 0, 0.2588235, 1,
1.692003, -0.3879209, 3.480708, 1, 0, 0.2509804, 1,
1.692714, 0.5645461, 1.151389, 1, 0, 0.2470588, 1,
1.698668, -0.4013208, 2.180424, 1, 0, 0.2392157, 1,
1.750028, -0.5199977, 2.625566, 1, 0, 0.2352941, 1,
1.765393, -1.66588, 2.618173, 1, 0, 0.227451, 1,
1.772002, 1.011488, 0.9613908, 1, 0, 0.2235294, 1,
1.773659, -0.7758068, 1.935353, 1, 0, 0.2156863, 1,
1.811652, 0.3464125, 0.3865215, 1, 0, 0.2117647, 1,
1.813585, 0.7881857, 0.8652554, 1, 0, 0.2039216, 1,
1.846463, -1.656427, 0.4055669, 1, 0, 0.1960784, 1,
1.857238, 1.404825, 1.277542, 1, 0, 0.1921569, 1,
1.868134, -0.03620331, 1.413116, 1, 0, 0.1843137, 1,
1.883471, -0.5341124, 2.370169, 1, 0, 0.1803922, 1,
1.893766, -0.2823082, 2.527569, 1, 0, 0.172549, 1,
1.895905, 1.380054, 0.199961, 1, 0, 0.1686275, 1,
1.903739, 1.723396, 3.097719, 1, 0, 0.1607843, 1,
1.917988, -0.07188145, 0.3788165, 1, 0, 0.1568628, 1,
1.928675, -1.342253, 0.6803289, 1, 0, 0.1490196, 1,
1.930811, 0.6355414, 1.495391, 1, 0, 0.145098, 1,
1.965449, -0.6583315, 1.307719, 1, 0, 0.1372549, 1,
1.982277, -1.163511, 0.6581584, 1, 0, 0.1333333, 1,
2.012457, 1.011806, 0.1994644, 1, 0, 0.1254902, 1,
2.044637, 0.1029233, 2.659002, 1, 0, 0.1215686, 1,
2.061245, -0.3534183, 0.4449807, 1, 0, 0.1137255, 1,
2.086974, 0.1770231, 1.068004, 1, 0, 0.1098039, 1,
2.094425, -0.1860433, 0.5261047, 1, 0, 0.1019608, 1,
2.154538, -0.481802, 1.479842, 1, 0, 0.09411765, 1,
2.15695, 0.4752204, 1.550944, 1, 0, 0.09019608, 1,
2.182897, -0.8881109, 1.896069, 1, 0, 0.08235294, 1,
2.230332, 0.2208857, 2.566995, 1, 0, 0.07843138, 1,
2.251324, 0.05875634, 1.373748, 1, 0, 0.07058824, 1,
2.298414, -3.0901, 4.020106, 1, 0, 0.06666667, 1,
2.308298, 0.5045576, 1.181494, 1, 0, 0.05882353, 1,
2.321625, -0.5094526, 0.8462421, 1, 0, 0.05490196, 1,
2.347448, -2.586726, 3.256097, 1, 0, 0.04705882, 1,
2.35681, 0.0303522, 1.49823, 1, 0, 0.04313726, 1,
2.37615, -0.3543391, 1.767423, 1, 0, 0.03529412, 1,
2.440651, -0.8063349, 1.579158, 1, 0, 0.03137255, 1,
2.444632, -1.702742, 3.63066, 1, 0, 0.02352941, 1,
2.602011, -0.2096466, 1.383716, 1, 0, 0.01960784, 1,
2.778722, -0.8272849, 2.102412, 1, 0, 0.01176471, 1,
3.54238, 0.2511898, 1.156492, 1, 0, 0.007843138, 1
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
-0.1695305, -4.344498, -6.928264, 0, -0.5, 0.5, 0.5,
-0.1695305, -4.344498, -6.928264, 1, -0.5, 0.5, 0.5,
-0.1695305, -4.344498, -6.928264, 1, 1.5, 0.5, 0.5,
-0.1695305, -4.344498, -6.928264, 0, 1.5, 0.5, 0.5
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
-5.139778, -0.03161049, -6.928264, 0, -0.5, 0.5, 0.5,
-5.139778, -0.03161049, -6.928264, 1, -0.5, 0.5, 0.5,
-5.139778, -0.03161049, -6.928264, 1, 1.5, 0.5, 0.5,
-5.139778, -0.03161049, -6.928264, 0, 1.5, 0.5, 0.5
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
-5.139778, -4.344498, -0.01804328, 0, -0.5, 0.5, 0.5,
-5.139778, -4.344498, -0.01804328, 1, -0.5, 0.5, 0.5,
-5.139778, -4.344498, -0.01804328, 1, 1.5, 0.5, 0.5,
-5.139778, -4.344498, -0.01804328, 0, 1.5, 0.5, 0.5
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
-2, -3.349216, -5.333598,
2, -3.349216, -5.333598,
-2, -3.349216, -5.333598,
-2, -3.515097, -5.599376,
0, -3.349216, -5.333598,
0, -3.515097, -5.599376,
2, -3.349216, -5.333598,
2, -3.515097, -5.599376
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
-2, -3.846857, -6.130931, 0, -0.5, 0.5, 0.5,
-2, -3.846857, -6.130931, 1, -0.5, 0.5, 0.5,
-2, -3.846857, -6.130931, 1, 1.5, 0.5, 0.5,
-2, -3.846857, -6.130931, 0, 1.5, 0.5, 0.5,
0, -3.846857, -6.130931, 0, -0.5, 0.5, 0.5,
0, -3.846857, -6.130931, 1, -0.5, 0.5, 0.5,
0, -3.846857, -6.130931, 1, 1.5, 0.5, 0.5,
0, -3.846857, -6.130931, 0, 1.5, 0.5, 0.5,
2, -3.846857, -6.130931, 0, -0.5, 0.5, 0.5,
2, -3.846857, -6.130931, 1, -0.5, 0.5, 0.5,
2, -3.846857, -6.130931, 1, 1.5, 0.5, 0.5,
2, -3.846857, -6.130931, 0, 1.5, 0.5, 0.5
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
-3.992798, -3, -5.333598,
-3.992798, 3, -5.333598,
-3.992798, -3, -5.333598,
-4.183961, -3, -5.599376,
-3.992798, -2, -5.333598,
-4.183961, -2, -5.599376,
-3.992798, -1, -5.333598,
-4.183961, -1, -5.599376,
-3.992798, 0, -5.333598,
-4.183961, 0, -5.599376,
-3.992798, 1, -5.333598,
-4.183961, 1, -5.599376,
-3.992798, 2, -5.333598,
-4.183961, 2, -5.599376,
-3.992798, 3, -5.333598,
-4.183961, 3, -5.599376
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
-4.566288, -3, -6.130931, 0, -0.5, 0.5, 0.5,
-4.566288, -3, -6.130931, 1, -0.5, 0.5, 0.5,
-4.566288, -3, -6.130931, 1, 1.5, 0.5, 0.5,
-4.566288, -3, -6.130931, 0, 1.5, 0.5, 0.5,
-4.566288, -2, -6.130931, 0, -0.5, 0.5, 0.5,
-4.566288, -2, -6.130931, 1, -0.5, 0.5, 0.5,
-4.566288, -2, -6.130931, 1, 1.5, 0.5, 0.5,
-4.566288, -2, -6.130931, 0, 1.5, 0.5, 0.5,
-4.566288, -1, -6.130931, 0, -0.5, 0.5, 0.5,
-4.566288, -1, -6.130931, 1, -0.5, 0.5, 0.5,
-4.566288, -1, -6.130931, 1, 1.5, 0.5, 0.5,
-4.566288, -1, -6.130931, 0, 1.5, 0.5, 0.5,
-4.566288, 0, -6.130931, 0, -0.5, 0.5, 0.5,
-4.566288, 0, -6.130931, 1, -0.5, 0.5, 0.5,
-4.566288, 0, -6.130931, 1, 1.5, 0.5, 0.5,
-4.566288, 0, -6.130931, 0, 1.5, 0.5, 0.5,
-4.566288, 1, -6.130931, 0, -0.5, 0.5, 0.5,
-4.566288, 1, -6.130931, 1, -0.5, 0.5, 0.5,
-4.566288, 1, -6.130931, 1, 1.5, 0.5, 0.5,
-4.566288, 1, -6.130931, 0, 1.5, 0.5, 0.5,
-4.566288, 2, -6.130931, 0, -0.5, 0.5, 0.5,
-4.566288, 2, -6.130931, 1, -0.5, 0.5, 0.5,
-4.566288, 2, -6.130931, 1, 1.5, 0.5, 0.5,
-4.566288, 2, -6.130931, 0, 1.5, 0.5, 0.5,
-4.566288, 3, -6.130931, 0, -0.5, 0.5, 0.5,
-4.566288, 3, -6.130931, 1, -0.5, 0.5, 0.5,
-4.566288, 3, -6.130931, 1, 1.5, 0.5, 0.5,
-4.566288, 3, -6.130931, 0, 1.5, 0.5, 0.5
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
-3.992798, -3.349216, -4,
-3.992798, -3.349216, 4,
-3.992798, -3.349216, -4,
-4.183961, -3.515097, -4,
-3.992798, -3.349216, -2,
-4.183961, -3.515097, -2,
-3.992798, -3.349216, 0,
-4.183961, -3.515097, 0,
-3.992798, -3.349216, 2,
-4.183961, -3.515097, 2,
-3.992798, -3.349216, 4,
-4.183961, -3.515097, 4
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
-4.566288, -3.846857, -4, 0, -0.5, 0.5, 0.5,
-4.566288, -3.846857, -4, 1, -0.5, 0.5, 0.5,
-4.566288, -3.846857, -4, 1, 1.5, 0.5, 0.5,
-4.566288, -3.846857, -4, 0, 1.5, 0.5, 0.5,
-4.566288, -3.846857, -2, 0, -0.5, 0.5, 0.5,
-4.566288, -3.846857, -2, 1, -0.5, 0.5, 0.5,
-4.566288, -3.846857, -2, 1, 1.5, 0.5, 0.5,
-4.566288, -3.846857, -2, 0, 1.5, 0.5, 0.5,
-4.566288, -3.846857, 0, 0, -0.5, 0.5, 0.5,
-4.566288, -3.846857, 0, 1, -0.5, 0.5, 0.5,
-4.566288, -3.846857, 0, 1, 1.5, 0.5, 0.5,
-4.566288, -3.846857, 0, 0, 1.5, 0.5, 0.5,
-4.566288, -3.846857, 2, 0, -0.5, 0.5, 0.5,
-4.566288, -3.846857, 2, 1, -0.5, 0.5, 0.5,
-4.566288, -3.846857, 2, 1, 1.5, 0.5, 0.5,
-4.566288, -3.846857, 2, 0, 1.5, 0.5, 0.5,
-4.566288, -3.846857, 4, 0, -0.5, 0.5, 0.5,
-4.566288, -3.846857, 4, 1, -0.5, 0.5, 0.5,
-4.566288, -3.846857, 4, 1, 1.5, 0.5, 0.5,
-4.566288, -3.846857, 4, 0, 1.5, 0.5, 0.5
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
-3.992798, -3.349216, -5.333598,
-3.992798, 3.285995, -5.333598,
-3.992798, -3.349216, 5.297511,
-3.992798, 3.285995, 5.297511,
-3.992798, -3.349216, -5.333598,
-3.992798, -3.349216, 5.297511,
-3.992798, 3.285995, -5.333598,
-3.992798, 3.285995, 5.297511,
-3.992798, -3.349216, -5.333598,
3.653737, -3.349216, -5.333598,
-3.992798, -3.349216, 5.297511,
3.653737, -3.349216, 5.297511,
-3.992798, 3.285995, -5.333598,
3.653737, 3.285995, -5.333598,
-3.992798, 3.285995, 5.297511,
3.653737, 3.285995, 5.297511,
3.653737, -3.349216, -5.333598,
3.653737, 3.285995, -5.333598,
3.653737, -3.349216, 5.297511,
3.653737, 3.285995, 5.297511,
3.653737, -3.349216, -5.333598,
3.653737, -3.349216, 5.297511,
3.653737, 3.285995, -5.333598,
3.653737, 3.285995, 5.297511
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
var radius = 7.839082;
var distance = 34.87696;
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
mvMatrix.translate( 0.1695305, 0.03161049, 0.01804328 );
mvMatrix.scale( 1.108446, 1.277393, 0.7972611 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.87696);
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
Butyric_Acid<-read.table("Butyric_Acid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Butyric_Acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'Butyric_Acid' not found
```

```r
y<-Butyric_Acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'Butyric_Acid' not found
```

```r
z<-Butyric_Acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'Butyric_Acid' not found
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
-3.881441, -0.6090531, -2.599174, 0, 0, 1, 1, 1,
-3.657795, 0.3846725, -1.838143, 1, 0, 0, 1, 1,
-3.159195, 1.848565, -0.4006989, 1, 0, 0, 1, 1,
-3.121265, -1.193157, -0.4763852, 1, 0, 0, 1, 1,
-3.058742, 0.5067725, -1.701529, 1, 0, 0, 1, 1,
-2.956605, -0.7470835, -0.4711666, 1, 0, 0, 1, 1,
-2.905478, -1.820985, -1.440898, 0, 0, 0, 1, 1,
-2.687402, 0.2471354, -2.81181, 0, 0, 0, 1, 1,
-2.671359, 1.98849, -0.4822566, 0, 0, 0, 1, 1,
-2.670882, 0.3843376, -0.7282248, 0, 0, 0, 1, 1,
-2.645666, -0.0009543455, -2.434803, 0, 0, 0, 1, 1,
-2.560033, -0.5721999, -3.175532, 0, 0, 0, 1, 1,
-2.499483, -0.638221, -2.396972, 0, 0, 0, 1, 1,
-2.492207, 0.732053, -1.314553, 1, 1, 1, 1, 1,
-2.374315, -1.293203, -1.213498, 1, 1, 1, 1, 1,
-2.329319, 0.8128143, 0.1325604, 1, 1, 1, 1, 1,
-2.31353, 1.670096, -0.5163943, 1, 1, 1, 1, 1,
-2.246341, -0.3092949, -1.189133, 1, 1, 1, 1, 1,
-2.224864, -0.03604862, -3.263349, 1, 1, 1, 1, 1,
-2.13685, 0.7438962, -0.6966234, 1, 1, 1, 1, 1,
-2.093646, 0.9049324, -1.988927, 1, 1, 1, 1, 1,
-2.02528, 0.4023834, -0.9611037, 1, 1, 1, 1, 1,
-2.0236, 1.51211, -1.569521, 1, 1, 1, 1, 1,
-2.007095, -0.604902, -2.38859, 1, 1, 1, 1, 1,
-1.9923, 0.1803699, 0.8153543, 1, 1, 1, 1, 1,
-1.968983, -0.2972881, -1.989017, 1, 1, 1, 1, 1,
-1.96551, -2.182984, -2.569757, 1, 1, 1, 1, 1,
-1.938663, -1.250704, -0.9698385, 1, 1, 1, 1, 1,
-1.89133, 1.028915, 1.202389, 0, 0, 1, 1, 1,
-1.8426, -0.1045107, -2.845996, 1, 0, 0, 1, 1,
-1.836654, 0.9297585, -0.9899573, 1, 0, 0, 1, 1,
-1.834067, 0.7118014, -1.185522, 1, 0, 0, 1, 1,
-1.827555, -1.570982, -3.254318, 1, 0, 0, 1, 1,
-1.79585, 0.4204328, -1.434654, 1, 0, 0, 1, 1,
-1.785759, 0.2815572, -0.1878332, 0, 0, 0, 1, 1,
-1.784377, -0.8889431, -1.646502, 0, 0, 0, 1, 1,
-1.781274, 0.2771306, -0.1286766, 0, 0, 0, 1, 1,
-1.780283, -0.7063853, -2.330031, 0, 0, 0, 1, 1,
-1.773408, -0.2959229, -0.1140821, 0, 0, 0, 1, 1,
-1.768602, -0.7311366, -0.4913877, 0, 0, 0, 1, 1,
-1.760698, 0.1830212, -0.4252858, 0, 0, 0, 1, 1,
-1.758282, 1.454826, -0.6918889, 1, 1, 1, 1, 1,
-1.747134, 1.700999, -2.727088, 1, 1, 1, 1, 1,
-1.74574, -0.6171983, -3.860374, 1, 1, 1, 1, 1,
-1.74338, -1.01772, -2.089627, 1, 1, 1, 1, 1,
-1.737688, 1.147954, -0.8923877, 1, 1, 1, 1, 1,
-1.725284, -0.1901347, -3.527458, 1, 1, 1, 1, 1,
-1.714994, -1.235184, -0.9602283, 1, 1, 1, 1, 1,
-1.713519, 0.1577887, -0.3530211, 1, 1, 1, 1, 1,
-1.709351, -0.4158659, -1.820826, 1, 1, 1, 1, 1,
-1.704572, 1.014024, -0.5634641, 1, 1, 1, 1, 1,
-1.696707, 0.6739714, -1.343682, 1, 1, 1, 1, 1,
-1.690513, 1.993041, -0.1955002, 1, 1, 1, 1, 1,
-1.68932, -0.5392903, -1.98135, 1, 1, 1, 1, 1,
-1.677038, -1.12093, -1.373748, 1, 1, 1, 1, 1,
-1.672651, 0.0106694, -1.388091, 1, 1, 1, 1, 1,
-1.662353, -0.3112935, -2.825525, 0, 0, 1, 1, 1,
-1.662328, 0.2929634, 0.8718047, 1, 0, 0, 1, 1,
-1.639614, 0.4644863, -2.338342, 1, 0, 0, 1, 1,
-1.63188, 1.611181, -0.7501411, 1, 0, 0, 1, 1,
-1.619395, 0.1259346, -1.986225, 1, 0, 0, 1, 1,
-1.613306, 0.8464717, 0.1767818, 1, 0, 0, 1, 1,
-1.602276, -0.1380247, -3.591842, 0, 0, 0, 1, 1,
-1.569975, 1.711832, -0.679342, 0, 0, 0, 1, 1,
-1.569682, 1.549548, 0.4257982, 0, 0, 0, 1, 1,
-1.54623, -0.5454407, -1.436245, 0, 0, 0, 1, 1,
-1.533923, -2.683198, -2.591143, 0, 0, 0, 1, 1,
-1.51266, 1.08254, -0.08514438, 0, 0, 0, 1, 1,
-1.509153, 0.7235319, -1.350322, 0, 0, 0, 1, 1,
-1.506576, -1.407367, -3.145176, 1, 1, 1, 1, 1,
-1.500468, 0.6443405, -0.4641848, 1, 1, 1, 1, 1,
-1.49391, 1.211524, -1.684908, 1, 1, 1, 1, 1,
-1.48196, 0.849448, -0.2702422, 1, 1, 1, 1, 1,
-1.481363, 0.5071327, -2.276038, 1, 1, 1, 1, 1,
-1.467895, -1.069596, -3.915617, 1, 1, 1, 1, 1,
-1.464749, -1.20814, -2.669269, 1, 1, 1, 1, 1,
-1.458351, 0.2703768, -2.711377, 1, 1, 1, 1, 1,
-1.450365, 2.405921, 0.6790007, 1, 1, 1, 1, 1,
-1.444751, -1.791708, -3.129735, 1, 1, 1, 1, 1,
-1.439809, 0.1871986, -2.042273, 1, 1, 1, 1, 1,
-1.428829, 0.09824511, -1.381672, 1, 1, 1, 1, 1,
-1.424934, 0.3871552, 0.7143942, 1, 1, 1, 1, 1,
-1.420612, -0.6655524, -0.5905344, 1, 1, 1, 1, 1,
-1.41733, 0.01176341, -0.6864062, 1, 1, 1, 1, 1,
-1.417162, -0.6462458, -0.7756838, 0, 0, 1, 1, 1,
-1.412969, -0.5337643, -2.126631, 1, 0, 0, 1, 1,
-1.401983, -0.649774, 0.6364102, 1, 0, 0, 1, 1,
-1.401798, -1.44847, -1.947394, 1, 0, 0, 1, 1,
-1.400369, -0.02497306, -1.996634, 1, 0, 0, 1, 1,
-1.395757, -1.379081, -1.181196, 1, 0, 0, 1, 1,
-1.378138, 0.2480891, -2.350472, 0, 0, 0, 1, 1,
-1.345564, -0.9065763, -1.848153, 0, 0, 0, 1, 1,
-1.342904, -0.5945228, -1.995934, 0, 0, 0, 1, 1,
-1.337668, -0.4171698, -2.982695, 0, 0, 0, 1, 1,
-1.334622, -1.144886, -0.7102886, 0, 0, 0, 1, 1,
-1.332574, -1.095154, -2.205319, 0, 0, 0, 1, 1,
-1.32815, 1.637003, -3.011616, 0, 0, 0, 1, 1,
-1.319599, 1.341416, -3.179045, 1, 1, 1, 1, 1,
-1.313125, -0.8210741, -1.582451, 1, 1, 1, 1, 1,
-1.292416, 0.7784643, -3.443255, 1, 1, 1, 1, 1,
-1.284891, -1.044733, -0.2934091, 1, 1, 1, 1, 1,
-1.271371, 1.17462, 0.6878488, 1, 1, 1, 1, 1,
-1.258143, -0.4627216, 0.4830486, 1, 1, 1, 1, 1,
-1.255304, 0.4869353, -1.495614, 1, 1, 1, 1, 1,
-1.251487, -0.5140328, -2.88028, 1, 1, 1, 1, 1,
-1.238756, 1.008134, -1.208992, 1, 1, 1, 1, 1,
-1.236365, -0.5393256, -2.308028, 1, 1, 1, 1, 1,
-1.23021, 0.1593354, -2.281107, 1, 1, 1, 1, 1,
-1.226232, -0.06670054, -2.273952, 1, 1, 1, 1, 1,
-1.224241, -1.782753, -3.961519, 1, 1, 1, 1, 1,
-1.22107, 0.5005363, -0.1801213, 1, 1, 1, 1, 1,
-1.21752, -0.6279331, -1.76757, 1, 1, 1, 1, 1,
-1.208999, 1.931919, -1.728593, 0, 0, 1, 1, 1,
-1.197972, -0.4164312, -2.412749, 1, 0, 0, 1, 1,
-1.192608, 2.677726, 0.4717824, 1, 0, 0, 1, 1,
-1.18664, -2.123254, -1.504899, 1, 0, 0, 1, 1,
-1.186371, 0.6989841, 0.3100575, 1, 0, 0, 1, 1,
-1.182871, 0.6890571, -1.454862, 1, 0, 0, 1, 1,
-1.180766, 2.395025, -0.4491977, 0, 0, 0, 1, 1,
-1.180451, 0.5075814, -1.650626, 0, 0, 0, 1, 1,
-1.177377, 0.01389994, -1.500918, 0, 0, 0, 1, 1,
-1.172775, -2.287795, -3.47348, 0, 0, 0, 1, 1,
-1.164624, -2.879932, -2.619349, 0, 0, 0, 1, 1,
-1.160355, 1.584622, -1.239358, 0, 0, 0, 1, 1,
-1.158944, -1.15492, -2.301978, 0, 0, 0, 1, 1,
-1.133872, -0.4529527, -3.034706, 1, 1, 1, 1, 1,
-1.131663, 2.492848, -0.7415978, 1, 1, 1, 1, 1,
-1.122615, -0.326896, -0.5403284, 1, 1, 1, 1, 1,
-1.12007, 1.090946, -0.8628608, 1, 1, 1, 1, 1,
-1.112193, -0.2528269, -2.296972, 1, 1, 1, 1, 1,
-1.109499, 1.155566, -1.064383, 1, 1, 1, 1, 1,
-1.108122, -1.103117, -3.963179, 1, 1, 1, 1, 1,
-1.106277, 0.1855823, -0.3252904, 1, 1, 1, 1, 1,
-1.098307, -0.857634, -2.023983, 1, 1, 1, 1, 1,
-1.096818, -0.8759098, -3.019923, 1, 1, 1, 1, 1,
-1.084251, -0.4581531, -4.37216, 1, 1, 1, 1, 1,
-1.082957, 1.210363, 0.09837022, 1, 1, 1, 1, 1,
-1.070918, -0.8060156, -2.770623, 1, 1, 1, 1, 1,
-1.067853, -0.4795439, -2.79323, 1, 1, 1, 1, 1,
-1.06715, 1.109179, -0.03769068, 1, 1, 1, 1, 1,
-1.063962, -0.5548643, -0.2342427, 0, 0, 1, 1, 1,
-1.063051, -0.2189799, -3.162165, 1, 0, 0, 1, 1,
-1.060597, -0.08055939, -2.620567, 1, 0, 0, 1, 1,
-1.060211, -0.6157152, -2.416116, 1, 0, 0, 1, 1,
-1.057051, -0.4058267, -2.461534, 1, 0, 0, 1, 1,
-1.053009, 0.4205273, -0.2549731, 1, 0, 0, 1, 1,
-1.049541, 0.2884857, -2.625588, 0, 0, 0, 1, 1,
-1.047351, 0.0827207, -1.235607, 0, 0, 0, 1, 1,
-1.04532, 0.3342285, -0.9815405, 0, 0, 0, 1, 1,
-1.044243, 0.2361283, -1.234754, 0, 0, 0, 1, 1,
-1.039223, 0.08880159, -0.9967573, 0, 0, 0, 1, 1,
-1.02783, 0.2097234, -2.253411, 0, 0, 0, 1, 1,
-1.025248, -0.4860491, -2.398562, 0, 0, 0, 1, 1,
-1.022659, -0.1285167, -2.784347, 1, 1, 1, 1, 1,
-1.020841, -1.161871, -1.508755, 1, 1, 1, 1, 1,
-1.019329, 1.041546, 0.04192527, 1, 1, 1, 1, 1,
-1.018307, 0.9515894, -0.2299692, 1, 1, 1, 1, 1,
-1.013304, 0.9907666, -1.034595, 1, 1, 1, 1, 1,
-1.013072, -1.273086, -1.917976, 1, 1, 1, 1, 1,
-1.012537, -0.855284, -2.512172, 1, 1, 1, 1, 1,
-1.001565, -1.438971, -2.859957, 1, 1, 1, 1, 1,
-1.000576, -2.592747, -4.485738, 1, 1, 1, 1, 1,
-0.9961672, 0.2778717, -1.524157, 1, 1, 1, 1, 1,
-0.9949853, -1.124374, -2.639372, 1, 1, 1, 1, 1,
-0.991071, -0.5103882, -2.003034, 1, 1, 1, 1, 1,
-0.9877235, 0.8622454, 0.01189867, 1, 1, 1, 1, 1,
-0.9764724, -0.9433768, -3.329587, 1, 1, 1, 1, 1,
-0.9749765, 0.7698532, -1.360007, 1, 1, 1, 1, 1,
-0.9729471, -0.2088358, -2.302742, 0, 0, 1, 1, 1,
-0.9599084, -0.401284, -0.4809352, 1, 0, 0, 1, 1,
-0.9590611, 0.868551, 0.03858137, 1, 0, 0, 1, 1,
-0.9498966, -1.436833, -1.990617, 1, 0, 0, 1, 1,
-0.9491739, -0.9659825, -0.7698938, 1, 0, 0, 1, 1,
-0.9486755, 1.049371, -1.054878, 1, 0, 0, 1, 1,
-0.9460187, 0.05753969, -0.7927368, 0, 0, 0, 1, 1,
-0.9436138, 0.5805947, 0.1979206, 0, 0, 0, 1, 1,
-0.9428457, -1.418663, -3.196946, 0, 0, 0, 1, 1,
-0.939141, 0.1442942, -3.203514, 0, 0, 0, 1, 1,
-0.9382491, 1.17114, -0.5359809, 0, 0, 0, 1, 1,
-0.93758, -0.4922921, -1.837626, 0, 0, 0, 1, 1,
-0.9365755, -1.074706, -3.074937, 0, 0, 0, 1, 1,
-0.9315029, -0.6651707, -2.054212, 1, 1, 1, 1, 1,
-0.9185542, 0.1131243, -0.93577, 1, 1, 1, 1, 1,
-0.9138754, -0.1807697, 0.3908487, 1, 1, 1, 1, 1,
-0.8994088, -1.43128, -2.050168, 1, 1, 1, 1, 1,
-0.8983292, 0.2525764, -4.232687, 1, 1, 1, 1, 1,
-0.8971391, -0.7916891, -3.916398, 1, 1, 1, 1, 1,
-0.890132, 2.386393, 0.1369625, 1, 1, 1, 1, 1,
-0.8880143, -0.07562251, -1.545457, 1, 1, 1, 1, 1,
-0.8860111, 0.96226, -1.209587, 1, 1, 1, 1, 1,
-0.8820909, -0.0847303, -1.394568, 1, 1, 1, 1, 1,
-0.8764378, 0.0890404, 0.4934546, 1, 1, 1, 1, 1,
-0.8691354, 1.834883, 0.209833, 1, 1, 1, 1, 1,
-0.8680567, 0.7451486, -1.94893, 1, 1, 1, 1, 1,
-0.8663952, 1.81294, -1.565845, 1, 1, 1, 1, 1,
-0.865145, 0.3986028, -0.6635395, 1, 1, 1, 1, 1,
-0.8639638, -0.3787935, -2.281318, 0, 0, 1, 1, 1,
-0.8601723, -0.1609271, -1.003913, 1, 0, 0, 1, 1,
-0.8536536, 0.01565589, -1.318172, 1, 0, 0, 1, 1,
-0.8527611, 0.1897352, -1.273299, 1, 0, 0, 1, 1,
-0.8483732, 0.205572, -0.8500476, 1, 0, 0, 1, 1,
-0.8459802, 0.1652619, -2.304406, 1, 0, 0, 1, 1,
-0.8448995, 0.9335419, -0.1607376, 0, 0, 0, 1, 1,
-0.83699, 0.00186628, -3.725832, 0, 0, 0, 1, 1,
-0.8367584, -1.622149, -3.319437, 0, 0, 0, 1, 1,
-0.8309674, -1.656383, -2.397104, 0, 0, 0, 1, 1,
-0.829215, -0.08874741, -0.97761, 0, 0, 0, 1, 1,
-0.8269334, -0.3805853, -2.187024, 0, 0, 0, 1, 1,
-0.8189969, -0.7138439, -1.777435, 0, 0, 0, 1, 1,
-0.8184952, -0.04569999, -0.9006454, 1, 1, 1, 1, 1,
-0.8155335, 1.185938, -1.941393, 1, 1, 1, 1, 1,
-0.8131326, -0.7837495, -0.3035383, 1, 1, 1, 1, 1,
-0.8092617, -0.2892672, -1.102274, 1, 1, 1, 1, 1,
-0.8053523, -0.4133245, -1.292731, 1, 1, 1, 1, 1,
-0.7999266, 0.0451071, -1.434076, 1, 1, 1, 1, 1,
-0.7895637, -0.6509513, -0.4891219, 1, 1, 1, 1, 1,
-0.7888868, 1.391103, -0.7668481, 1, 1, 1, 1, 1,
-0.7874327, 1.900957, 0.196845, 1, 1, 1, 1, 1,
-0.7829674, -1.230236, -3.801402, 1, 1, 1, 1, 1,
-0.7823579, -0.2824944, -2.283434, 1, 1, 1, 1, 1,
-0.780871, -0.2556334, -2.667771, 1, 1, 1, 1, 1,
-0.7806954, 0.1427782, -0.6809294, 1, 1, 1, 1, 1,
-0.7801049, 0.07519746, -1.596024, 1, 1, 1, 1, 1,
-0.7772225, 1.186511, 0.7281089, 1, 1, 1, 1, 1,
-0.7765079, 0.1950316, -1.138448, 0, 0, 1, 1, 1,
-0.7710799, -0.7898006, -2.928874, 1, 0, 0, 1, 1,
-0.7690458, -0.9678514, -3.208586, 1, 0, 0, 1, 1,
-0.7679368, 0.08007202, -2.154661, 1, 0, 0, 1, 1,
-0.761824, 0.3404533, -1.515919, 1, 0, 0, 1, 1,
-0.7602174, -0.7091313, -2.133248, 1, 0, 0, 1, 1,
-0.7593831, -0.8765705, -2.680522, 0, 0, 0, 1, 1,
-0.7465495, -1.172969, -2.615791, 0, 0, 0, 1, 1,
-0.7448912, -0.1726992, -0.8514782, 0, 0, 0, 1, 1,
-0.7443724, 0.1713623, -1.025547, 0, 0, 0, 1, 1,
-0.7399701, 0.1973503, -0.6797736, 0, 0, 0, 1, 1,
-0.7355396, -0.3228357, -2.401183, 0, 0, 0, 1, 1,
-0.7348301, 0.3172113, -0.4555011, 0, 0, 0, 1, 1,
-0.734573, 0.6168582, -1.111499, 1, 1, 1, 1, 1,
-0.7298669, -0.07077003, -0.2709323, 1, 1, 1, 1, 1,
-0.7276025, 0.4952305, -0.3049067, 1, 1, 1, 1, 1,
-0.7254519, 0.4843688, 0.4490272, 1, 1, 1, 1, 1,
-0.7248396, -1.704151, -2.692235, 1, 1, 1, 1, 1,
-0.7233191, 0.6773265, -0.615085, 1, 1, 1, 1, 1,
-0.7232004, 0.4403917, 0.5539066, 1, 1, 1, 1, 1,
-0.7207721, 0.6598358, 0.6702034, 1, 1, 1, 1, 1,
-0.7194299, -1.824714, -3.790399, 1, 1, 1, 1, 1,
-0.7174677, 0.7257304, -0.01321465, 1, 1, 1, 1, 1,
-0.7122815, -1.375835, -1.218054, 1, 1, 1, 1, 1,
-0.7111905, 0.1106273, -1.501606, 1, 1, 1, 1, 1,
-0.7061046, -1.544542, -1.299804, 1, 1, 1, 1, 1,
-0.7040857, 0.5764406, -0.8498383, 1, 1, 1, 1, 1,
-0.7020779, -0.8578087, -3.650278, 1, 1, 1, 1, 1,
-0.701619, 1.189521, -1.948575, 0, 0, 1, 1, 1,
-0.6997486, 0.05764702, -0.5513155, 1, 0, 0, 1, 1,
-0.692964, 1.158359, -0.9270347, 1, 0, 0, 1, 1,
-0.6870555, -0.5654712, -2.734166, 1, 0, 0, 1, 1,
-0.6848769, 1.823247, 0.05678413, 1, 0, 0, 1, 1,
-0.6816725, -2.370063, -3.052927, 1, 0, 0, 1, 1,
-0.6803554, 0.4837776, 2.211098, 0, 0, 0, 1, 1,
-0.6794027, 0.7430852, -0.5132225, 0, 0, 0, 1, 1,
-0.6789762, -0.9186113, -3.444275, 0, 0, 0, 1, 1,
-0.6784617, -0.8465733, -2.315271, 0, 0, 0, 1, 1,
-0.678008, 0.6955769, -0.5550652, 0, 0, 0, 1, 1,
-0.6766631, -0.8309689, -2.307474, 0, 0, 0, 1, 1,
-0.6739163, -0.2323448, -2.897979, 0, 0, 0, 1, 1,
-0.6739122, -1.194572, -3.131776, 1, 1, 1, 1, 1,
-0.6727967, -0.01945681, -2.088193, 1, 1, 1, 1, 1,
-0.6696996, -0.1114987, -2.077047, 1, 1, 1, 1, 1,
-0.6588545, 0.59217, -1.404293, 1, 1, 1, 1, 1,
-0.6569047, -2.179398, -2.759066, 1, 1, 1, 1, 1,
-0.6371515, -0.1482576, 0.8074387, 1, 1, 1, 1, 1,
-0.6369723, -2.386544, -2.838596, 1, 1, 1, 1, 1,
-0.627762, -1.223709, -3.804132, 1, 1, 1, 1, 1,
-0.626246, 0.7889023, -1.026161, 1, 1, 1, 1, 1,
-0.6250819, 0.2307511, -0.2919798, 1, 1, 1, 1, 1,
-0.6198531, -0.693478, -2.036056, 1, 1, 1, 1, 1,
-0.617578, -0.8990672, -1.907485, 1, 1, 1, 1, 1,
-0.6152705, 1.229917, -0.7364215, 1, 1, 1, 1, 1,
-0.6098597, 0.5548357, -1.174434, 1, 1, 1, 1, 1,
-0.6041207, -0.7762597, -4.55006, 1, 1, 1, 1, 1,
-0.6019681, 1.651122, -1.153375, 0, 0, 1, 1, 1,
-0.599332, 0.5022681, -1.287239, 1, 0, 0, 1, 1,
-0.598265, -0.9670516, -1.538499, 1, 0, 0, 1, 1,
-0.5955632, 0.02209196, -3.672347, 1, 0, 0, 1, 1,
-0.5934643, 0.7743398, -0.2067536, 1, 0, 0, 1, 1,
-0.5924325, 0.8999308, 0.01035075, 1, 0, 0, 1, 1,
-0.5902058, 0.997666, -2.044531, 0, 0, 0, 1, 1,
-0.5806471, -0.1125059, -2.449438, 0, 0, 0, 1, 1,
-0.5803403, -0.3574081, -2.453067, 0, 0, 0, 1, 1,
-0.5798773, 0.07054625, -1.991015, 0, 0, 0, 1, 1,
-0.577843, -0.1588429, -3.758822, 0, 0, 0, 1, 1,
-0.5769555, -0.3244188, -5.090788, 0, 0, 0, 1, 1,
-0.5747858, 0.6092208, -0.6809735, 0, 0, 0, 1, 1,
-0.5659685, -0.1899857, -3.10724, 1, 1, 1, 1, 1,
-0.5640818, -0.9957445, -3.187097, 1, 1, 1, 1, 1,
-0.5630714, 0.7231275, -1.137949, 1, 1, 1, 1, 1,
-0.5569392, -0.290903, -2.161431, 1, 1, 1, 1, 1,
-0.5564828, -1.956869, -3.423136, 1, 1, 1, 1, 1,
-0.5544695, 0.9498737, 0.8506398, 1, 1, 1, 1, 1,
-0.5390779, -0.9516597, -1.651173, 1, 1, 1, 1, 1,
-0.5383462, -0.5005631, -2.790339, 1, 1, 1, 1, 1,
-0.5355228, 0.1236344, 0.4326079, 1, 1, 1, 1, 1,
-0.5267894, 0.08554004, -1.628393, 1, 1, 1, 1, 1,
-0.5260453, -0.2043647, -4.004936, 1, 1, 1, 1, 1,
-0.5137556, 0.4068139, -0.6908455, 1, 1, 1, 1, 1,
-0.5131553, 0.7147023, 0.4043595, 1, 1, 1, 1, 1,
-0.5072641, -1.826843, -1.790156, 1, 1, 1, 1, 1,
-0.5052575, -1.269388, -3.361699, 1, 1, 1, 1, 1,
-0.4976615, 0.7573934, 0.1254242, 0, 0, 1, 1, 1,
-0.4958973, 0.7044299, 0.7211608, 1, 0, 0, 1, 1,
-0.4913629, 2.040743, -0.03005072, 1, 0, 0, 1, 1,
-0.4872655, 0.1270991, -1.929802, 1, 0, 0, 1, 1,
-0.4849208, 0.09155272, 0.5110916, 1, 0, 0, 1, 1,
-0.4829032, 0.1163205, -0.9313747, 1, 0, 0, 1, 1,
-0.4827548, 1.336691, 0.8039352, 0, 0, 0, 1, 1,
-0.4808482, -0.5065024, -2.762249, 0, 0, 0, 1, 1,
-0.4807129, -1.013146, -1.414178, 0, 0, 0, 1, 1,
-0.4777964, 1.049054, 0.1552838, 0, 0, 0, 1, 1,
-0.4680886, -1.284416, -3.022011, 0, 0, 0, 1, 1,
-0.4611507, 0.048464, -2.126256, 0, 0, 0, 1, 1,
-0.4580767, 0.07227712, -1.731816, 0, 0, 0, 1, 1,
-0.45407, 2.344778, -1.716837, 1, 1, 1, 1, 1,
-0.4509801, -1.357661, -1.614735, 1, 1, 1, 1, 1,
-0.4508352, 0.3263532, -0.287292, 1, 1, 1, 1, 1,
-0.4446814, -0.08219679, -2.533648, 1, 1, 1, 1, 1,
-0.4436751, -0.7666754, -2.709035, 1, 1, 1, 1, 1,
-0.442186, 0.01142126, -1.171944, 1, 1, 1, 1, 1,
-0.4333073, 0.8783354, -0.4799348, 1, 1, 1, 1, 1,
-0.4315312, -0.4511838, -1.996727, 1, 1, 1, 1, 1,
-0.4295431, 1.352061, -0.1941528, 1, 1, 1, 1, 1,
-0.4219725, -0.07497816, -2.040531, 1, 1, 1, 1, 1,
-0.4203614, -1.274955, -2.407722, 1, 1, 1, 1, 1,
-0.4182969, -1.848632, -3.290251, 1, 1, 1, 1, 1,
-0.4179225, 0.983901, 1.01117, 1, 1, 1, 1, 1,
-0.4146004, 1.026395, -0.3908218, 1, 1, 1, 1, 1,
-0.4132323, -0.2868978, -2.575728, 1, 1, 1, 1, 1,
-0.4132201, 1.161374, -0.7876847, 0, 0, 1, 1, 1,
-0.4113618, 0.01487917, -0.6379754, 1, 0, 0, 1, 1,
-0.4066908, -1.572319, -4.317369, 1, 0, 0, 1, 1,
-0.4053241, 0.3386061, -0.4673592, 1, 0, 0, 1, 1,
-0.4048079, -0.1375694, 0.5106232, 1, 0, 0, 1, 1,
-0.4014715, 0.01733887, 0.3114303, 1, 0, 0, 1, 1,
-0.4010503, -0.7272687, -4.156618, 0, 0, 0, 1, 1,
-0.3994764, -0.6546888, -3.952608, 0, 0, 0, 1, 1,
-0.3984801, -0.3349397, -2.344381, 0, 0, 0, 1, 1,
-0.3972805, 1.301307, -0.663403, 0, 0, 0, 1, 1,
-0.3939309, 1.740356, 0.7189473, 0, 0, 0, 1, 1,
-0.3895183, -0.4777592, -1.670673, 0, 0, 0, 1, 1,
-0.3881427, 0.916223, -0.1338757, 0, 0, 0, 1, 1,
-0.3854204, -0.8432133, -2.1221, 1, 1, 1, 1, 1,
-0.3844869, 1.498912, -2.403724, 1, 1, 1, 1, 1,
-0.3795905, 0.3896282, 0.2426228, 1, 1, 1, 1, 1,
-0.3778662, -0.9681286, -4.122464, 1, 1, 1, 1, 1,
-0.3749974, -1.309439, -3.049266, 1, 1, 1, 1, 1,
-0.3702926, 0.4924845, -0.8647472, 1, 1, 1, 1, 1,
-0.3682764, -1.014677, -5.178776, 1, 1, 1, 1, 1,
-0.3656032, -1.302092, -3.252344, 1, 1, 1, 1, 1,
-0.3622241, -1.72811, -3.873581, 1, 1, 1, 1, 1,
-0.3610407, 1.712904, -1.763112, 1, 1, 1, 1, 1,
-0.3603267, 0.6795082, -0.4521963, 1, 1, 1, 1, 1,
-0.3586207, -0.4705503, -4.098444, 1, 1, 1, 1, 1,
-0.3547441, -0.3548552, -3.587493, 1, 1, 1, 1, 1,
-0.3540385, -0.9530446, -4.548153, 1, 1, 1, 1, 1,
-0.3527269, -0.5984514, -2.967254, 1, 1, 1, 1, 1,
-0.3525801, 1.032377, -0.6794519, 0, 0, 1, 1, 1,
-0.3512281, 1.153728, 1.265692, 1, 0, 0, 1, 1,
-0.3481364, 1.294796, 0.1430603, 1, 0, 0, 1, 1,
-0.3471385, 0.005506594, -0.9899965, 1, 0, 0, 1, 1,
-0.3366731, -0.727824, -4.81829, 1, 0, 0, 1, 1,
-0.3313203, -0.735333, -1.230876, 1, 0, 0, 1, 1,
-0.3301216, 0.1935236, -1.831694, 0, 0, 0, 1, 1,
-0.326552, 1.715814, -0.8591962, 0, 0, 0, 1, 1,
-0.3250899, -0.7746939, -2.109798, 0, 0, 0, 1, 1,
-0.3248005, -0.1489858, -2.965758, 0, 0, 0, 1, 1,
-0.3247583, -2.135886, -1.765877, 0, 0, 0, 1, 1,
-0.3245972, -0.2145153, -1.603148, 0, 0, 0, 1, 1,
-0.3245927, 1.112068, -0.585761, 0, 0, 0, 1, 1,
-0.3231158, -0.6238071, -3.310849, 1, 1, 1, 1, 1,
-0.3219314, -0.8596209, -3.096144, 1, 1, 1, 1, 1,
-0.321715, 0.9028707, -0.5311105, 1, 1, 1, 1, 1,
-0.3208394, 0.06239023, -1.172217, 1, 1, 1, 1, 1,
-0.3206473, -0.6090305, -1.458856, 1, 1, 1, 1, 1,
-0.3198226, -0.6126444, -3.047683, 1, 1, 1, 1, 1,
-0.3157019, -0.8697012, -2.664204, 1, 1, 1, 1, 1,
-0.3149043, 0.1072416, -0.4298947, 1, 1, 1, 1, 1,
-0.3131948, -1.429238, -3.398045, 1, 1, 1, 1, 1,
-0.3112081, 0.05987044, -1.527939, 1, 1, 1, 1, 1,
-0.3107993, -1.308621, -2.876785, 1, 1, 1, 1, 1,
-0.3081989, -0.7721359, -2.720948, 1, 1, 1, 1, 1,
-0.307607, 0.9469579, -0.8321817, 1, 1, 1, 1, 1,
-0.3002812, 1.317906, 0.6721127, 1, 1, 1, 1, 1,
-0.2991113, -0.9880446, -2.70631, 1, 1, 1, 1, 1,
-0.298633, -0.9867643, -2.749993, 0, 0, 1, 1, 1,
-0.2973749, 0.5510768, 0.1802462, 1, 0, 0, 1, 1,
-0.2934178, 0.3285384, -1.675136, 1, 0, 0, 1, 1,
-0.2918066, -0.1820201, -1.846135, 1, 0, 0, 1, 1,
-0.2912853, -0.01912366, -2.469949, 1, 0, 0, 1, 1,
-0.2895517, -1.013553, -1.430564, 1, 0, 0, 1, 1,
-0.2888971, 0.06325696, -0.6055912, 0, 0, 0, 1, 1,
-0.2884838, 1.022562, -1.092535, 0, 0, 0, 1, 1,
-0.2877521, -0.5505892, -2.70733, 0, 0, 0, 1, 1,
-0.2837737, 1.29291, -0.4094043, 0, 0, 0, 1, 1,
-0.2823012, 0.04344781, -1.678116, 0, 0, 0, 1, 1,
-0.2805781, 0.9222424, -0.6929404, 0, 0, 0, 1, 1,
-0.2800714, -0.2815761, -1.859936, 0, 0, 0, 1, 1,
-0.2773849, -0.2980202, -2.771853, 1, 1, 1, 1, 1,
-0.2771836, 0.1679152, -1.860383, 1, 1, 1, 1, 1,
-0.2743142, 0.5048817, -0.7838032, 1, 1, 1, 1, 1,
-0.2733322, 0.6647947, -1.506693, 1, 1, 1, 1, 1,
-0.271438, 0.01160655, -1.101553, 1, 1, 1, 1, 1,
-0.2663136, 2.844689, -1.069113, 1, 1, 1, 1, 1,
-0.263541, -1.792044, -2.464508, 1, 1, 1, 1, 1,
-0.2583885, 0.04458243, -0.3204917, 1, 1, 1, 1, 1,
-0.2509685, 1.119525, -1.255434, 1, 1, 1, 1, 1,
-0.2507966, -0.8502017, -4.616572, 1, 1, 1, 1, 1,
-0.249438, 0.7995187, -0.1647839, 1, 1, 1, 1, 1,
-0.2493403, 0.534544, -1.505034, 1, 1, 1, 1, 1,
-0.2366694, 1.04101, 1.214219, 1, 1, 1, 1, 1,
-0.2319077, -0.5106969, -2.941833, 1, 1, 1, 1, 1,
-0.2303064, 1.809659, 0.1875521, 1, 1, 1, 1, 1,
-0.2298808, -0.1438269, -2.300905, 0, 0, 1, 1, 1,
-0.2275255, -0.1197084, -1.995562, 1, 0, 0, 1, 1,
-0.2240172, 1.105789, -0.4650657, 1, 0, 0, 1, 1,
-0.2215839, 0.6048564, -0.1367845, 1, 0, 0, 1, 1,
-0.2214529, -1.400769, -3.825848, 1, 0, 0, 1, 1,
-0.220216, -1.662029, -3.897861, 1, 0, 0, 1, 1,
-0.219972, -0.4943731, -1.538528, 0, 0, 0, 1, 1,
-0.219928, -1.424075, -2.375121, 0, 0, 0, 1, 1,
-0.2192287, -0.6753536, -1.537297, 0, 0, 0, 1, 1,
-0.2155807, 0.9153833, -0.4066012, 0, 0, 0, 1, 1,
-0.2080575, 0.4112911, 0.7290277, 0, 0, 0, 1, 1,
-0.2056744, -1.181219, -4.195979, 0, 0, 0, 1, 1,
-0.2028469, -0.6775781, -4.000828, 0, 0, 0, 1, 1,
-0.2025452, 1.772019, -0.6047686, 1, 1, 1, 1, 1,
-0.2015416, 1.70486, -0.819998, 1, 1, 1, 1, 1,
-0.1984152, -1.727554, -3.651547, 1, 1, 1, 1, 1,
-0.1983789, 0.8930165, -1.643737, 1, 1, 1, 1, 1,
-0.1950123, 0.2018612, 0.5512747, 1, 1, 1, 1, 1,
-0.1886628, 1.097136, 0.5383122, 1, 1, 1, 1, 1,
-0.186865, -0.2507428, -2.96343, 1, 1, 1, 1, 1,
-0.1779239, -0.816932, -1.336705, 1, 1, 1, 1, 1,
-0.1755043, 0.7383164, 0.1139005, 1, 1, 1, 1, 1,
-0.1739962, -2.109462, -2.039051, 1, 1, 1, 1, 1,
-0.1726547, -0.2302637, -2.675001, 1, 1, 1, 1, 1,
-0.1708486, -0.84324, -2.311841, 1, 1, 1, 1, 1,
-0.1687458, 0.02857789, -1.955417, 1, 1, 1, 1, 1,
-0.1657826, -0.4174292, -5.103924, 1, 1, 1, 1, 1,
-0.1657554, 1.397709, 0.9302243, 1, 1, 1, 1, 1,
-0.1641607, -0.8502769, -4.884415, 0, 0, 1, 1, 1,
-0.1635319, -0.5320278, -2.323048, 1, 0, 0, 1, 1,
-0.1615221, -0.796026, -2.669154, 1, 0, 0, 1, 1,
-0.1521267, -0.7304528, -3.2252, 1, 0, 0, 1, 1,
-0.1449014, 1.406319, 1.402952, 1, 0, 0, 1, 1,
-0.1427721, -0.4751835, -2.585146, 1, 0, 0, 1, 1,
-0.1369192, 0.7659878, 0.06433393, 0, 0, 0, 1, 1,
-0.132851, 0.7111445, 0.52061, 0, 0, 0, 1, 1,
-0.1324899, 0.3436331, -1.175016, 0, 0, 0, 1, 1,
-0.1318379, 0.5660744, 0.3006572, 0, 0, 0, 1, 1,
-0.1308214, 1.424204, -1.043414, 0, 0, 0, 1, 1,
-0.1291676, 1.175419, 2.806099, 0, 0, 0, 1, 1,
-0.1286187, 0.9543228, -0.7031179, 0, 0, 0, 1, 1,
-0.1167796, 0.7295143, 0.82126, 1, 1, 1, 1, 1,
-0.1138073, -0.6454036, -2.373381, 1, 1, 1, 1, 1,
-0.1125743, -0.8229234, -1.690272, 1, 1, 1, 1, 1,
-0.1105221, 0.1521684, -0.18096, 1, 1, 1, 1, 1,
-0.1042775, 0.543832, -0.238637, 1, 1, 1, 1, 1,
-0.1017577, 0.7635785, -1.399706, 1, 1, 1, 1, 1,
-0.1001196, 0.9953943, -0.4575479, 1, 1, 1, 1, 1,
-0.09817479, 0.5132573, 1.715218, 1, 1, 1, 1, 1,
-0.09579196, 0.4139653, -1.217166, 1, 1, 1, 1, 1,
-0.09485864, 3.189366, -1.219878, 1, 1, 1, 1, 1,
-0.09410848, -0.9389611, -2.547443, 1, 1, 1, 1, 1,
-0.0937177, -0.2651797, -2.918071, 1, 1, 1, 1, 1,
-0.09348743, 1.007321, -1.41425, 1, 1, 1, 1, 1,
-0.09080115, 0.1010977, -0.9964765, 1, 1, 1, 1, 1,
-0.08341964, 0.975042, 0.8379591, 1, 1, 1, 1, 1,
-0.08236887, 0.1258399, -1.219604, 0, 0, 1, 1, 1,
-0.07613762, 0.304272, -0.8879642, 1, 0, 0, 1, 1,
-0.07561807, -0.5957456, -4.887123, 1, 0, 0, 1, 1,
-0.07135217, 1.369271, -0.01743961, 1, 0, 0, 1, 1,
-0.05833188, 1.291665, -0.1214727, 1, 0, 0, 1, 1,
-0.05764345, 0.228218, 0.02832548, 1, 0, 0, 1, 1,
-0.05447485, 0.2738634, -2.123832, 0, 0, 0, 1, 1,
-0.05157055, -0.6857899, -5.065691, 0, 0, 0, 1, 1,
-0.05141268, -1.209828, -2.593379, 0, 0, 0, 1, 1,
-0.05133037, -1.667053, -1.955261, 0, 0, 0, 1, 1,
-0.05045386, -0.4362831, -1.586254, 0, 0, 0, 1, 1,
-0.04388819, -0.9818971, -2.808048, 0, 0, 0, 1, 1,
-0.04199535, 0.03105353, -1.303453, 0, 0, 0, 1, 1,
-0.04038637, 1.960256, -0.2594406, 1, 1, 1, 1, 1,
-0.03975553, -0.9277493, -2.574973, 1, 1, 1, 1, 1,
-0.0382899, 0.3761623, -0.8603797, 1, 1, 1, 1, 1,
-0.03675879, 0.6129256, 0.4724393, 1, 1, 1, 1, 1,
-0.02978823, -1.605248, -2.875158, 1, 1, 1, 1, 1,
-0.02926968, 0.501843, -0.8638797, 1, 1, 1, 1, 1,
-0.02485123, 1.272686, -0.5257302, 1, 1, 1, 1, 1,
-0.02320644, 1.245591, -0.03663121, 1, 1, 1, 1, 1,
-0.02088462, 0.6228994, -1.42039, 1, 1, 1, 1, 1,
-0.02055168, -1.091198, -2.722388, 1, 1, 1, 1, 1,
-0.0204191, 1.070925, -0.2416446, 1, 1, 1, 1, 1,
-0.01951898, 1.995541, 1.174892, 1, 1, 1, 1, 1,
-0.01690656, 0.6505395, 0.5706283, 1, 1, 1, 1, 1,
-0.0147796, 0.297277, 0.2701006, 1, 1, 1, 1, 1,
-0.01127782, 0.4605293, 0.3002459, 1, 1, 1, 1, 1,
-0.003614923, 0.6127439, 0.2143649, 0, 0, 1, 1, 1,
-0.0009948442, 0.1611754, -0.5585861, 1, 0, 0, 1, 1,
0.00320383, -0.9596025, 1.193319, 1, 0, 0, 1, 1,
0.009940531, -0.02461058, 3.778692, 1, 0, 0, 1, 1,
0.01181233, 0.3810569, 0.9401515, 1, 0, 0, 1, 1,
0.0129076, 0.136491, -0.06855292, 1, 0, 0, 1, 1,
0.01679772, 2.516189, -0.5991391, 0, 0, 0, 1, 1,
0.02011284, 1.922846, 0.3647673, 0, 0, 0, 1, 1,
0.02526798, -0.8272226, 5.142689, 0, 0, 0, 1, 1,
0.02847598, 0.2071301, 0.8656579, 0, 0, 0, 1, 1,
0.03345245, 0.1368786, -0.2990304, 0, 0, 0, 1, 1,
0.03974545, -0.6073262, 3.330025, 0, 0, 0, 1, 1,
0.04388593, 1.383698, 0.3471001, 0, 0, 0, 1, 1,
0.0453459, 0.6856782, -0.6860808, 1, 1, 1, 1, 1,
0.04848144, -1.480711, 1.653461, 1, 1, 1, 1, 1,
0.05045023, -0.006332109, 0.5331489, 1, 1, 1, 1, 1,
0.05376903, -1.108162, 3.760547, 1, 1, 1, 1, 1,
0.05620296, -0.9684365, 2.982809, 1, 1, 1, 1, 1,
0.05803274, 0.1702422, -1.523974, 1, 1, 1, 1, 1,
0.05866547, 1.358548, -1.485914, 1, 1, 1, 1, 1,
0.06371684, -1.681357, 4.562889, 1, 1, 1, 1, 1,
0.06978282, -0.375385, 0.2238541, 1, 1, 1, 1, 1,
0.07495901, 0.05238556, 1.312071, 1, 1, 1, 1, 1,
0.07537279, 0.4536093, 0.09095773, 1, 1, 1, 1, 1,
0.07879218, 0.1593696, 1.149397, 1, 1, 1, 1, 1,
0.0809042, -0.846814, 3.904812, 1, 1, 1, 1, 1,
0.08377452, 1.632649, -0.08855941, 1, 1, 1, 1, 1,
0.08466435, -0.5678043, 1.996694, 1, 1, 1, 1, 1,
0.08534293, -0.7790222, 2.569071, 0, 0, 1, 1, 1,
0.08796037, -0.3058183, 2.718087, 1, 0, 0, 1, 1,
0.09122762, -1.472498, 0.9697973, 1, 0, 0, 1, 1,
0.09287393, 0.8289991, -0.6460648, 1, 0, 0, 1, 1,
0.09567367, 0.002784373, 3.96328, 1, 0, 0, 1, 1,
0.1021298, 0.4714985, -0.622714, 1, 0, 0, 1, 1,
0.1028196, -0.9201008, 4.26791, 0, 0, 0, 1, 1,
0.1045582, -1.69101, 2.611946, 0, 0, 0, 1, 1,
0.1058798, -0.5195104, 4.077343, 0, 0, 0, 1, 1,
0.106342, -0.7732869, 3.260401, 0, 0, 0, 1, 1,
0.1103904, -1.102747, 1.588508, 0, 0, 0, 1, 1,
0.1163785, 2.509986, 1.612039, 0, 0, 0, 1, 1,
0.1167533, 0.2511995, 2.641121, 0, 0, 0, 1, 1,
0.1179063, 0.1667506, -0.7144886, 1, 1, 1, 1, 1,
0.1194252, 0.5850584, -0.1633183, 1, 1, 1, 1, 1,
0.1199371, 1.308777, -1.701365, 1, 1, 1, 1, 1,
0.1199505, -0.2669211, 3.041183, 1, 1, 1, 1, 1,
0.1202598, -0.4461473, 3.344448, 1, 1, 1, 1, 1,
0.1245695, -0.3903526, 2.448196, 1, 1, 1, 1, 1,
0.1262406, 0.3263823, 0.7798916, 1, 1, 1, 1, 1,
0.1290178, -1.231015, 1.780894, 1, 1, 1, 1, 1,
0.1331707, 1.880663, 1.585914, 1, 1, 1, 1, 1,
0.1343403, -1.130695, 3.544559, 1, 1, 1, 1, 1,
0.1344595, 1.864338, -0.6216491, 1, 1, 1, 1, 1,
0.1362089, -0.2058446, 2.942394, 1, 1, 1, 1, 1,
0.1364373, 1.213288, 0.4216263, 1, 1, 1, 1, 1,
0.1369303, 0.6234978, 0.3269754, 1, 1, 1, 1, 1,
0.1375437, 1.661321, 0.6367557, 1, 1, 1, 1, 1,
0.1430794, -1.511876, 2.91398, 0, 0, 1, 1, 1,
0.1468323, -1.378445, 4.271447, 1, 0, 0, 1, 1,
0.1472056, 0.9654215, 0.1358115, 1, 0, 0, 1, 1,
0.1521062, -0.3872238, 3.267652, 1, 0, 0, 1, 1,
0.1527449, -0.2888642, 2.197859, 1, 0, 0, 1, 1,
0.1528011, 0.7210519, -0.01006295, 1, 0, 0, 1, 1,
0.1529821, 1.849793, -0.6418658, 0, 0, 0, 1, 1,
0.1546349, -0.6375416, 1.868712, 0, 0, 0, 1, 1,
0.1558301, -1.446614, 2.919409, 0, 0, 0, 1, 1,
0.1582614, -0.9766345, 3.460212, 0, 0, 0, 1, 1,
0.1611628, 0.5331612, 2.208273, 0, 0, 0, 1, 1,
0.1664709, 0.9008543, -0.8449428, 0, 0, 0, 1, 1,
0.16728, -0.3527088, 3.404756, 0, 0, 0, 1, 1,
0.1716592, -0.4042724, 2.513843, 1, 1, 1, 1, 1,
0.1718889, -0.8542774, 1.731119, 1, 1, 1, 1, 1,
0.1718943, 0.5744434, -0.9206778, 1, 1, 1, 1, 1,
0.1759399, -0.3990954, 0.8253036, 1, 1, 1, 1, 1,
0.179215, -0.3301519, 0.6566297, 1, 1, 1, 1, 1,
0.1837864, -0.849847, 3.888725, 1, 1, 1, 1, 1,
0.1841375, 1.724647, 0.01684915, 1, 1, 1, 1, 1,
0.1860655, -0.4132287, 3.571764, 1, 1, 1, 1, 1,
0.1879088, -0.1542591, 0.9710747, 1, 1, 1, 1, 1,
0.1883131, 0.1680774, -0.05897671, 1, 1, 1, 1, 1,
0.1920552, 0.1398775, 0.5903687, 1, 1, 1, 1, 1,
0.194398, 0.2008925, 0.2824249, 1, 1, 1, 1, 1,
0.1998313, -0.1272988, 1.591224, 1, 1, 1, 1, 1,
0.2052349, 0.03333659, 0.3292592, 1, 1, 1, 1, 1,
0.2108056, -0.09782829, 1.127862, 1, 1, 1, 1, 1,
0.2125902, -0.08286177, 3.621749, 0, 0, 1, 1, 1,
0.2170718, 0.009595526, 0.6806635, 1, 0, 0, 1, 1,
0.2179196, 1.336016, 1.020708, 1, 0, 0, 1, 1,
0.2215526, 0.09041143, 3.130281, 1, 0, 0, 1, 1,
0.2236991, 0.7570443, 0.8539483, 1, 0, 0, 1, 1,
0.2243842, 0.744383, 0.6771306, 1, 0, 0, 1, 1,
0.2271437, 0.4773405, 1.96812, 0, 0, 0, 1, 1,
0.2287894, 1.055254, -0.743565, 0, 0, 0, 1, 1,
0.2353044, -0.4872043, 1.898374, 0, 0, 0, 1, 1,
0.2353516, -0.6835234, 4.248811, 0, 0, 0, 1, 1,
0.2366783, -0.9652153, 3.545969, 0, 0, 0, 1, 1,
0.2386378, -0.5330951, 2.027893, 0, 0, 0, 1, 1,
0.2445292, 0.393122, -1.243817, 0, 0, 0, 1, 1,
0.2461858, -2.497031, 2.923363, 1, 1, 1, 1, 1,
0.246729, -0.1808371, 2.271778, 1, 1, 1, 1, 1,
0.2488399, -0.3633029, 3.143449, 1, 1, 1, 1, 1,
0.255942, -0.3693001, 1.237808, 1, 1, 1, 1, 1,
0.2572429, -1.586565, 1.639565, 1, 1, 1, 1, 1,
0.2584121, -0.1243416, 1.229472, 1, 1, 1, 1, 1,
0.2612433, 0.08402625, 2.330942, 1, 1, 1, 1, 1,
0.2620444, -0.5127645, 1.737514, 1, 1, 1, 1, 1,
0.2628954, -0.5554169, 2.514767, 1, 1, 1, 1, 1,
0.2637293, 0.6585946, -0.6461623, 1, 1, 1, 1, 1,
0.2684308, 1.016846, 0.9528863, 1, 1, 1, 1, 1,
0.2696885, 0.1420608, 1.08539, 1, 1, 1, 1, 1,
0.2723125, 0.9294111, 0.4769252, 1, 1, 1, 1, 1,
0.274485, -1.609322, 3.222797, 1, 1, 1, 1, 1,
0.2768047, 0.1203335, -0.2870215, 1, 1, 1, 1, 1,
0.2780778, 2.117568, -0.1494873, 0, 0, 1, 1, 1,
0.2788717, 0.01160124, 2.351454, 1, 0, 0, 1, 1,
0.2827105, -0.2253966, 3.433719, 1, 0, 0, 1, 1,
0.2973919, -1.215692, 2.554371, 1, 0, 0, 1, 1,
0.2978297, -1.513375, 3.277459, 1, 0, 0, 1, 1,
0.3016445, 1.174968, -0.5087147, 1, 0, 0, 1, 1,
0.3035441, 1.486837, -1.080642, 0, 0, 0, 1, 1,
0.308035, -0.1784035, 0.9847353, 0, 0, 0, 1, 1,
0.3084547, -1.924131, 4.138937, 0, 0, 0, 1, 1,
0.3086007, 0.4986034, 0.901434, 0, 0, 0, 1, 1,
0.3131942, -0.4538944, 3.059043, 0, 0, 0, 1, 1,
0.3154627, 0.3245277, 3.161327, 0, 0, 0, 1, 1,
0.3156716, 0.0582065, -0.08721343, 0, 0, 0, 1, 1,
0.3164678, -0.8213848, 2.255179, 1, 1, 1, 1, 1,
0.3179853, -0.3685268, 1.703049, 1, 1, 1, 1, 1,
0.3247349, 0.6007886, -0.5339642, 1, 1, 1, 1, 1,
0.3286242, -2.473888, 4.686081, 1, 1, 1, 1, 1,
0.3311737, -0.4383081, 2.565719, 1, 1, 1, 1, 1,
0.3400458, -0.9713383, 2.878714, 1, 1, 1, 1, 1,
0.3421138, -0.8846521, 2.153788, 1, 1, 1, 1, 1,
0.343773, -1.109993, 3.750572, 1, 1, 1, 1, 1,
0.3442444, -1.504957, 2.955506, 1, 1, 1, 1, 1,
0.3511822, 1.292698, 0.2141885, 1, 1, 1, 1, 1,
0.3532332, -2.826265, 2.614493, 1, 1, 1, 1, 1,
0.3558764, 0.1232263, 0.3186868, 1, 1, 1, 1, 1,
0.358414, 1.165833, -1.170494, 1, 1, 1, 1, 1,
0.3600712, 0.2173277, 0.9502614, 1, 1, 1, 1, 1,
0.3626629, 1.234841, 1.555274, 1, 1, 1, 1, 1,
0.3635349, 0.002040558, 1.971561, 0, 0, 1, 1, 1,
0.3676181, 1.309774, 2.177463, 1, 0, 0, 1, 1,
0.372393, -0.1755171, 2.257202, 1, 0, 0, 1, 1,
0.3757926, 0.04754009, 1.06795, 1, 0, 0, 1, 1,
0.3788033, -0.02443729, 2.269584, 1, 0, 0, 1, 1,
0.3793483, 0.2826974, 1.406447, 1, 0, 0, 1, 1,
0.3809819, -0.08076917, 1.797208, 0, 0, 0, 1, 1,
0.3835551, 1.068036, -0.8207908, 0, 0, 0, 1, 1,
0.3876558, 0.04882474, 1.367865, 0, 0, 0, 1, 1,
0.3898232, 1.576241, 0.9247862, 0, 0, 0, 1, 1,
0.3956835, -0.5424082, 3.527713, 0, 0, 0, 1, 1,
0.3966751, -0.08388915, 0.03690748, 0, 0, 0, 1, 1,
0.3983022, 0.3196425, -0.4616858, 0, 0, 0, 1, 1,
0.401219, 1.35262, 0.749948, 1, 1, 1, 1, 1,
0.4085608, -0.3735023, 0.6770787, 1, 1, 1, 1, 1,
0.4092636, 0.6889127, 0.8761303, 1, 1, 1, 1, 1,
0.4094398, -0.02970279, 3.332932, 1, 1, 1, 1, 1,
0.4224945, -0.7298708, 2.727926, 1, 1, 1, 1, 1,
0.4233781, -1.535802, 3.45117, 1, 1, 1, 1, 1,
0.4272884, 0.2631207, 0.5867017, 1, 1, 1, 1, 1,
0.4284573, 0.8251668, -0.196394, 1, 1, 1, 1, 1,
0.4288563, 2.016034, 1.642591, 1, 1, 1, 1, 1,
0.4294054, 2.546901, 0.9341331, 1, 1, 1, 1, 1,
0.4313637, -0.6683137, 1.934218, 1, 1, 1, 1, 1,
0.4315683, -0.9344483, 2.658238, 1, 1, 1, 1, 1,
0.4320956, 0.2023783, 1.251812, 1, 1, 1, 1, 1,
0.4386896, 0.2039401, 1.032665, 1, 1, 1, 1, 1,
0.444778, -0.9350781, 2.377472, 1, 1, 1, 1, 1,
0.4456744, -0.9397786, 1.623274, 0, 0, 1, 1, 1,
0.4506498, 0.4335815, 2.524325, 1, 0, 0, 1, 1,
0.45218, 0.3218948, 2.764902, 1, 0, 0, 1, 1,
0.4537603, 1.017848, 0.5386444, 1, 0, 0, 1, 1,
0.4543805, -1.273001, 2.781009, 1, 0, 0, 1, 1,
0.4653635, -0.7690431, 1.718269, 1, 0, 0, 1, 1,
0.4654191, -0.4537832, 2.397818, 0, 0, 0, 1, 1,
0.4659975, -1.348356, 3.77617, 0, 0, 0, 1, 1,
0.4701551, 0.2079443, 2.263829, 0, 0, 0, 1, 1,
0.4716127, -0.01004029, 2.012612, 0, 0, 0, 1, 1,
0.4718907, -0.1508593, 3.90434, 0, 0, 0, 1, 1,
0.4730985, 0.5751211, 1.186439, 0, 0, 0, 1, 1,
0.4753428, 1.335793, 0.7200656, 0, 0, 0, 1, 1,
0.4763167, 1.25268, -0.09181429, 1, 1, 1, 1, 1,
0.4776575, -0.05472057, 1.327417, 1, 1, 1, 1, 1,
0.4806034, -0.4930944, 1.740982, 1, 1, 1, 1, 1,
0.4819722, -0.4540594, -0.2723762, 1, 1, 1, 1, 1,
0.4820484, -1.252035, 1.610288, 1, 1, 1, 1, 1,
0.4832816, -1.576038, 3.419117, 1, 1, 1, 1, 1,
0.4851096, 0.4799362, 0.8538826, 1, 1, 1, 1, 1,
0.4882138, -0.920437, 3.320989, 1, 1, 1, 1, 1,
0.4927592, 1.425299, 1.976776, 1, 1, 1, 1, 1,
0.4953444, 0.2323754, 1.09873, 1, 1, 1, 1, 1,
0.5049005, 0.7772467, 0.6937759, 1, 1, 1, 1, 1,
0.5071406, 0.3302258, 2.01791, 1, 1, 1, 1, 1,
0.5081404, -0.5078449, 0.958626, 1, 1, 1, 1, 1,
0.5167852, -1.096207, 1.733868, 1, 1, 1, 1, 1,
0.5185781, -2.418507, 3.696916, 1, 1, 1, 1, 1,
0.5272404, 0.1446514, -0.638779, 0, 0, 1, 1, 1,
0.5357674, -1.386381, 4.349705, 1, 0, 0, 1, 1,
0.5451219, 1.028625, 1.034536, 1, 0, 0, 1, 1,
0.5560497, 1.859115, 3.285137, 1, 0, 0, 1, 1,
0.5562848, 0.4441277, 3.226263, 1, 0, 0, 1, 1,
0.558179, -1.727971, 3.872017, 1, 0, 0, 1, 1,
0.5590963, -0.06147636, 1.812607, 0, 0, 0, 1, 1,
0.5596512, -0.08998943, 1.600859, 0, 0, 0, 1, 1,
0.5610385, 1.271567, -0.0580295, 0, 0, 0, 1, 1,
0.5613522, -0.6095417, 3.445043, 0, 0, 0, 1, 1,
0.5736896, 0.6425554, 0.05945058, 0, 0, 0, 1, 1,
0.5815637, -0.235517, 1.943267, 0, 0, 0, 1, 1,
0.5904028, 0.161451, 0.6237512, 0, 0, 0, 1, 1,
0.5932189, 0.5347858, 0.9378215, 1, 1, 1, 1, 1,
0.5977216, -0.9382042, 3.061497, 1, 1, 1, 1, 1,
0.6005265, -0.4461738, 1.767142, 1, 1, 1, 1, 1,
0.6029074, -0.7077783, 1.033023, 1, 1, 1, 1, 1,
0.6092806, 0.9670733, 0.5780339, 1, 1, 1, 1, 1,
0.6148298, -0.06858366, 2.046347, 1, 1, 1, 1, 1,
0.6222154, -1.251706, 4.265851, 1, 1, 1, 1, 1,
0.6239549, 0.6588255, 0.4430114, 1, 1, 1, 1, 1,
0.6274505, 0.5714769, 1.810228, 1, 1, 1, 1, 1,
0.6298258, 1.100214, -0.01595674, 1, 1, 1, 1, 1,
0.632072, 0.8896947, 1.946404, 1, 1, 1, 1, 1,
0.6321091, -1.018535, 4.380534, 1, 1, 1, 1, 1,
0.6378893, -0.6365898, 2.779561, 1, 1, 1, 1, 1,
0.6383398, 0.897751, -1.245208, 1, 1, 1, 1, 1,
0.6397398, -1.074752, 3.739156, 1, 1, 1, 1, 1,
0.6399577, -2.026117, 2.414269, 0, 0, 1, 1, 1,
0.6449354, -2.363989, 3.334073, 1, 0, 0, 1, 1,
0.6454164, -0.7002357, 1.927571, 1, 0, 0, 1, 1,
0.6506057, -0.8241757, 2.381191, 1, 0, 0, 1, 1,
0.6507109, 0.2199695, 1.818241, 1, 0, 0, 1, 1,
0.6563435, -1.132854, 3.341657, 1, 0, 0, 1, 1,
0.6566095, -0.2890228, -0.7280614, 0, 0, 0, 1, 1,
0.6576461, 1.890734, 0.3937644, 0, 0, 0, 1, 1,
0.6597719, -0.238641, 2.135066, 0, 0, 0, 1, 1,
0.6651589, 0.6298152, -0.9128464, 0, 0, 0, 1, 1,
0.6734172, 0.3049227, 0.1498651, 0, 0, 0, 1, 1,
0.6754407, 0.4576175, 0.7446415, 0, 0, 0, 1, 1,
0.6774099, -0.1332977, 2.89038, 0, 0, 0, 1, 1,
0.6810296, 0.6035093, 0.1408128, 1, 1, 1, 1, 1,
0.68709, 0.09670614, 1.701212, 1, 1, 1, 1, 1,
0.6877372, -0.5752338, 3.213896, 1, 1, 1, 1, 1,
0.6895677, 0.224829, 1.232847, 1, 1, 1, 1, 1,
0.6918576, -0.7827346, 2.190226, 1, 1, 1, 1, 1,
0.7023392, 0.9577347, -0.1803924, 1, 1, 1, 1, 1,
0.7068174, 0.2559628, 1.138211, 1, 1, 1, 1, 1,
0.7073284, -0.3330176, 1.368426, 1, 1, 1, 1, 1,
0.7085761, -2.551866, 4.875063, 1, 1, 1, 1, 1,
0.7089995, 0.04093765, 3.122494, 1, 1, 1, 1, 1,
0.7090493, 0.5521913, 0.4872322, 1, 1, 1, 1, 1,
0.7090796, 0.6243993, -0.5487891, 1, 1, 1, 1, 1,
0.7091431, 0.7394726, -0.3089632, 1, 1, 1, 1, 1,
0.7102609, -1.138372, -0.118116, 1, 1, 1, 1, 1,
0.7195379, 1.46321, -1.042222, 1, 1, 1, 1, 1,
0.7215102, -0.5798903, 1.177868, 0, 0, 1, 1, 1,
0.7246589, 0.2000789, 0.06671823, 1, 0, 0, 1, 1,
0.7273483, 0.6779531, 2.421123, 1, 0, 0, 1, 1,
0.7294841, 1.680337, 1.701557, 1, 0, 0, 1, 1,
0.7353849, -0.1700156, 1.379772, 1, 0, 0, 1, 1,
0.7424864, -1.473303, 1.404055, 1, 0, 0, 1, 1,
0.7428942, 0.445462, 1.153497, 0, 0, 0, 1, 1,
0.7446371, -0.9148754, 2.341134, 0, 0, 0, 1, 1,
0.7470487, -0.9098374, 2.334938, 0, 0, 0, 1, 1,
0.7498841, -3.252587, 4.255662, 0, 0, 0, 1, 1,
0.7517639, 1.481953, -1.366974, 0, 0, 0, 1, 1,
0.7524195, -0.8653235, 2.693522, 0, 0, 0, 1, 1,
0.7577132, -0.2189984, 1.441742, 0, 0, 0, 1, 1,
0.7592438, 0.146525, 3.031204, 1, 1, 1, 1, 1,
0.7608563, -1.440659, 3.734025, 1, 1, 1, 1, 1,
0.7645757, -0.6345375, 1.821442, 1, 1, 1, 1, 1,
0.7664053, 1.484732, -0.2704213, 1, 1, 1, 1, 1,
0.7719543, 1.25017, 1.206601, 1, 1, 1, 1, 1,
0.7764335, -0.5792606, 3.545374, 1, 1, 1, 1, 1,
0.776867, -0.8285225, 2.533444, 1, 1, 1, 1, 1,
0.7769744, 0.06680814, 2.023657, 1, 1, 1, 1, 1,
0.7831063, 0.8513941, -0.8060045, 1, 1, 1, 1, 1,
0.7989165, 0.4704472, 2.414292, 1, 1, 1, 1, 1,
0.8004875, 0.5256314, 1.144555, 1, 1, 1, 1, 1,
0.8046014, 0.1722207, 0.5771486, 1, 1, 1, 1, 1,
0.8054262, 0.6198664, 0.3048018, 1, 1, 1, 1, 1,
0.8055999, 1.053383, -0.2094948, 1, 1, 1, 1, 1,
0.8069364, 1.116811, -1.160806, 1, 1, 1, 1, 1,
0.8105909, 0.483523, -0.01740616, 0, 0, 1, 1, 1,
0.8122626, 0.2180947, 1.065363, 1, 0, 0, 1, 1,
0.8129778, 1.21332, 0.8764421, 1, 0, 0, 1, 1,
0.8186427, 0.141683, 1.195694, 1, 0, 0, 1, 1,
0.8203113, -0.8012563, 0.1678932, 1, 0, 0, 1, 1,
0.8217435, -1.452, 3.640316, 1, 0, 0, 1, 1,
0.8292658, -0.4089628, 1.326114, 0, 0, 0, 1, 1,
0.8302189, 0.4682208, 2.305511, 0, 0, 0, 1, 1,
0.8379856, 0.4533924, 3.139474, 0, 0, 0, 1, 1,
0.8386561, -0.4637171, 2.000126, 0, 0, 0, 1, 1,
0.8399583, -0.4084519, 0.9463251, 0, 0, 0, 1, 1,
0.8414055, -0.2518304, 2.40912, 0, 0, 0, 1, 1,
0.8430647, -0.2734761, 3.749686, 0, 0, 0, 1, 1,
0.8432598, 0.3047042, 1.877233, 1, 1, 1, 1, 1,
0.8484699, -0.3146698, 2.090467, 1, 1, 1, 1, 1,
0.851802, -0.3789272, 3.541366, 1, 1, 1, 1, 1,
0.8523936, -2.518086, 1.424918, 1, 1, 1, 1, 1,
0.8594116, 0.795316, 0.6467351, 1, 1, 1, 1, 1,
0.8605674, 1.286234, -1.499961, 1, 1, 1, 1, 1,
0.8620421, -0.9455376, 3.795458, 1, 1, 1, 1, 1,
0.8631814, 1.616977, 1.929375, 1, 1, 1, 1, 1,
0.8700833, -0.5825009, 2.012116, 1, 1, 1, 1, 1,
0.8747936, -0.1705301, 0.9353639, 1, 1, 1, 1, 1,
0.8780709, 0.3508368, 1.609743, 1, 1, 1, 1, 1,
0.88232, 0.3266574, 0.9538785, 1, 1, 1, 1, 1,
0.8841621, 1.647798, 1.907297, 1, 1, 1, 1, 1,
0.8904808, 0.6401265, 1.251873, 1, 1, 1, 1, 1,
0.8972219, 0.4363193, 1.774408, 1, 1, 1, 1, 1,
0.9003882, -1.623584, 1.487528, 0, 0, 1, 1, 1,
0.9009005, 0.785199, 1.450866, 1, 0, 0, 1, 1,
0.9012885, 0.1347339, 0.7975676, 1, 0, 0, 1, 1,
0.9024829, 0.3123676, 1.071334, 1, 0, 0, 1, 1,
0.90402, -0.8207083, 2.2218, 1, 0, 0, 1, 1,
0.9040784, 0.349779, 0.8321933, 1, 0, 0, 1, 1,
0.9224777, 0.2043267, 1.047386, 0, 0, 0, 1, 1,
0.9245166, -2.510731, 2.558304, 0, 0, 0, 1, 1,
0.9284451, 2.043547, -0.7728019, 0, 0, 0, 1, 1,
0.9373035, -0.2023345, 1.186504, 0, 0, 0, 1, 1,
0.9375961, 1.227775, 1.448426, 0, 0, 0, 1, 1,
0.9382725, 0.00275676, 0.634118, 0, 0, 0, 1, 1,
0.9383711, -0.9066519, 2.094453, 0, 0, 0, 1, 1,
0.939314, -1.973407, 2.793539, 1, 1, 1, 1, 1,
0.9393473, -0.8151228, 3.017903, 1, 1, 1, 1, 1,
0.9438506, 1.457737, 0.408239, 1, 1, 1, 1, 1,
0.9441708, -0.3980417, 1.470984, 1, 1, 1, 1, 1,
0.9491292, 1.048536, -0.5782348, 1, 1, 1, 1, 1,
0.9518281, 0.4273898, 1.300175, 1, 1, 1, 1, 1,
0.9518604, -0.6204842, 1.748395, 1, 1, 1, 1, 1,
0.9577984, 1.176922, 0.6767425, 1, 1, 1, 1, 1,
0.9632867, 0.193386, 1.981151, 1, 1, 1, 1, 1,
0.9642872, 0.5358909, 1.493619, 1, 1, 1, 1, 1,
0.9647329, -0.8574235, 0.8355672, 1, 1, 1, 1, 1,
0.9700807, -0.3135707, 2.632718, 1, 1, 1, 1, 1,
0.9712726, 0.112419, 0.7565659, 1, 1, 1, 1, 1,
0.9717548, 1.08471, 0.8693858, 1, 1, 1, 1, 1,
0.9729506, -0.7831241, 3.933662, 1, 1, 1, 1, 1,
0.9749206, 0.2021733, 1.557773, 0, 0, 1, 1, 1,
0.977205, 0.6865753, 0.7638454, 1, 0, 0, 1, 1,
0.9839005, -1.199613, 1.785436, 1, 0, 0, 1, 1,
0.9853063, 0.7497002, -0.8628849, 1, 0, 0, 1, 1,
0.9937663, -0.8458018, 2.635912, 1, 0, 0, 1, 1,
0.9949007, -0.2029505, 1.041197, 1, 0, 0, 1, 1,
0.9965222, -1.160088, 1.205091, 0, 0, 0, 1, 1,
0.9991108, -0.6764567, 0.9160304, 0, 0, 0, 1, 1,
1.001405, 0.09240911, -0.005127877, 0, 0, 0, 1, 1,
1.009607, 1.939231, -0.0151271, 0, 0, 0, 1, 1,
1.018474, -2.075063, 2.268529, 0, 0, 0, 1, 1,
1.020193, -1.121325, 4.258015, 0, 0, 0, 1, 1,
1.021404, 0.2410844, 1.343104, 0, 0, 0, 1, 1,
1.025335, -0.3131272, 3.730448, 1, 1, 1, 1, 1,
1.03192, -1.199138, 2.67845, 1, 1, 1, 1, 1,
1.035388, 0.4654563, 1.377975, 1, 1, 1, 1, 1,
1.036111, -0.7246516, 1.415556, 1, 1, 1, 1, 1,
1.045729, 1.114449, 0.6502438, 1, 1, 1, 1, 1,
1.045879, -1.124132, 1.564954, 1, 1, 1, 1, 1,
1.04865, 0.7561324, 1.280481, 1, 1, 1, 1, 1,
1.058109, -1.218364, 2.10663, 1, 1, 1, 1, 1,
1.066737, -2.199677, 2.408095, 1, 1, 1, 1, 1,
1.071246, -0.2552524, 1.552496, 1, 1, 1, 1, 1,
1.071667, -0.6085293, 2.437976, 1, 1, 1, 1, 1,
1.078138, 0.7915002, 1.067935, 1, 1, 1, 1, 1,
1.085152, 0.737514, 2.605079, 1, 1, 1, 1, 1,
1.089718, -0.1052996, 0.4525137, 1, 1, 1, 1, 1,
1.097733, 0.8436986, 0.5242285, 1, 1, 1, 1, 1,
1.114036, -1.106218, 2.881536, 0, 0, 1, 1, 1,
1.114189, 0.6062914, 1.982273, 1, 0, 0, 1, 1,
1.115886, 1.422473, 0.3877799, 1, 0, 0, 1, 1,
1.124413, 0.9751763, 0.9851383, 1, 0, 0, 1, 1,
1.129832, 0.2383743, 0.9349611, 1, 0, 0, 1, 1,
1.150985, 0.02624682, 1.440416, 1, 0, 0, 1, 1,
1.152015, 1.042393, -1.147007, 0, 0, 0, 1, 1,
1.153837, -0.2110856, 2.019251, 0, 0, 0, 1, 1,
1.156692, -0.1284083, 3.262515, 0, 0, 0, 1, 1,
1.160951, 1.076206, 0.1063717, 0, 0, 0, 1, 1,
1.167995, -0.6253685, 3.382967, 0, 0, 0, 1, 1,
1.170351, -1.07435, -0.04453846, 0, 0, 0, 1, 1,
1.17329, 0.02477857, 0.5311323, 0, 0, 0, 1, 1,
1.175125, -0.8340212, 2.706352, 1, 1, 1, 1, 1,
1.181131, 1.67518, 0.1121986, 1, 1, 1, 1, 1,
1.188652, 0.7331119, 1.268254, 1, 1, 1, 1, 1,
1.20202, -2.427235, 3.499188, 1, 1, 1, 1, 1,
1.213281, 0.07520287, 2.23418, 1, 1, 1, 1, 1,
1.2213, -0.3688985, 1.230384, 1, 1, 1, 1, 1,
1.222165, 1.73847, 0.4975765, 1, 1, 1, 1, 1,
1.232972, 0.3447039, 0.9405105, 1, 1, 1, 1, 1,
1.233156, 0.3818091, 1.086186, 1, 1, 1, 1, 1,
1.234078, 2.443042, 0.4595421, 1, 1, 1, 1, 1,
1.236257, -0.1219213, 0.8572423, 1, 1, 1, 1, 1,
1.246526, -0.7903877, 1.56402, 1, 1, 1, 1, 1,
1.247918, -2.251583, 4.501293, 1, 1, 1, 1, 1,
1.269205, -1.634887, 2.932309, 1, 1, 1, 1, 1,
1.269657, 0.5220335, 0.2734367, 1, 1, 1, 1, 1,
1.280148, 0.6647639, 2.918066, 0, 0, 1, 1, 1,
1.28563, -1.145038, 2.518038, 1, 0, 0, 1, 1,
1.287534, 0.6079267, -0.4231666, 1, 0, 0, 1, 1,
1.292588, -0.1731054, -0.04276211, 1, 0, 0, 1, 1,
1.296038, -0.9081203, 1.167452, 1, 0, 0, 1, 1,
1.29896, -1.397482, 2.932229, 1, 0, 0, 1, 1,
1.301924, 0.6550058, 1.337571, 0, 0, 0, 1, 1,
1.311621, 0.3454878, 3.212757, 0, 0, 0, 1, 1,
1.315394, 1.040435, 0.2265939, 0, 0, 0, 1, 1,
1.319605, 1.506388, 2.464733, 0, 0, 0, 1, 1,
1.320071, 0.9715812, 2.036569, 0, 0, 0, 1, 1,
1.321141, 0.3467859, 1.184485, 0, 0, 0, 1, 1,
1.330173, -0.2172523, 3.382157, 0, 0, 0, 1, 1,
1.350955, 0.3116286, 3.115645, 1, 1, 1, 1, 1,
1.351387, 1.899249, 0.59619, 1, 1, 1, 1, 1,
1.353189, -0.1536672, 1.135537, 1, 1, 1, 1, 1,
1.356295, 1.082096, 2.196953, 1, 1, 1, 1, 1,
1.359387, -0.01245763, 2.033361, 1, 1, 1, 1, 1,
1.368307, -0.00738079, 2.344145, 1, 1, 1, 1, 1,
1.37097, 0.4282588, 2.471756, 1, 1, 1, 1, 1,
1.376485, -0.5926653, 2.865428, 1, 1, 1, 1, 1,
1.377323, -1.107459, 1.858704, 1, 1, 1, 1, 1,
1.400551, -0.7589834, 1.871902, 1, 1, 1, 1, 1,
1.406305, 1.339777, -0.5906404, 1, 1, 1, 1, 1,
1.40888, 0.6703027, 1.361738, 1, 1, 1, 1, 1,
1.409162, -0.3030978, 1.894563, 1, 1, 1, 1, 1,
1.417091, -0.0259548, 1.3357, 1, 1, 1, 1, 1,
1.418173, -2.305856, 2.417569, 1, 1, 1, 1, 1,
1.432935, 1.269784, 1.263109, 0, 0, 1, 1, 1,
1.443844, -0.2866989, 1.926676, 1, 0, 0, 1, 1,
1.446889, 0.3411319, 2.451986, 1, 0, 0, 1, 1,
1.45036, 1.736804, 1.667771, 1, 0, 0, 1, 1,
1.453017, -1.569783, 0.6653811, 1, 0, 0, 1, 1,
1.453165, 0.2919708, -0.2455063, 1, 0, 0, 1, 1,
1.455604, -1.859165, 2.461968, 0, 0, 0, 1, 1,
1.457662, -1.093724, 2.145727, 0, 0, 0, 1, 1,
1.475608, 0.7419282, 0.3063493, 0, 0, 0, 1, 1,
1.489881, -1.305475, 2.616935, 0, 0, 0, 1, 1,
1.491888, -0.1055602, 1.832952, 0, 0, 0, 1, 1,
1.49622, 0.5744046, 2.812488, 0, 0, 0, 1, 1,
1.500618, 1.27084, 0.1013058, 0, 0, 0, 1, 1,
1.502048, -1.536612, 2.702904, 1, 1, 1, 1, 1,
1.503174, -0.07307205, 2.587957, 1, 1, 1, 1, 1,
1.522353, -1.38289, 3.802289, 1, 1, 1, 1, 1,
1.531939, 0.07873439, 2.182544, 1, 1, 1, 1, 1,
1.561103, 1.748483, -1.775464, 1, 1, 1, 1, 1,
1.563356, 0.3436349, 1.141465, 1, 1, 1, 1, 1,
1.56547, -0.2335033, 3.015475, 1, 1, 1, 1, 1,
1.591153, 0.4226197, 0.7395722, 1, 1, 1, 1, 1,
1.600235, -0.9177775, 1.450347, 1, 1, 1, 1, 1,
1.601612, -1.415848, 1.162559, 1, 1, 1, 1, 1,
1.601764, -0.9834687, 2.102897, 1, 1, 1, 1, 1,
1.610502, 1.276481, 2.849413, 1, 1, 1, 1, 1,
1.624551, 0.2242682, 1.346932, 1, 1, 1, 1, 1,
1.626477, 0.2251332, 2.567653, 1, 1, 1, 1, 1,
1.626525, 1.765754, -0.009508369, 1, 1, 1, 1, 1,
1.629973, -0.6512688, 2.955183, 0, 0, 1, 1, 1,
1.648424, 0.1573243, 0.6334516, 1, 0, 0, 1, 1,
1.653201, 0.3772885, 1.126687, 1, 0, 0, 1, 1,
1.66064, -0.5811409, -0.4731913, 1, 0, 0, 1, 1,
1.67687, 0.4210057, 1.301479, 1, 0, 0, 1, 1,
1.68724, 0.7544486, 2.57508, 1, 0, 0, 1, 1,
1.692003, -0.3879209, 3.480708, 0, 0, 0, 1, 1,
1.692714, 0.5645461, 1.151389, 0, 0, 0, 1, 1,
1.698668, -0.4013208, 2.180424, 0, 0, 0, 1, 1,
1.750028, -0.5199977, 2.625566, 0, 0, 0, 1, 1,
1.765393, -1.66588, 2.618173, 0, 0, 0, 1, 1,
1.772002, 1.011488, 0.9613908, 0, 0, 0, 1, 1,
1.773659, -0.7758068, 1.935353, 0, 0, 0, 1, 1,
1.811652, 0.3464125, 0.3865215, 1, 1, 1, 1, 1,
1.813585, 0.7881857, 0.8652554, 1, 1, 1, 1, 1,
1.846463, -1.656427, 0.4055669, 1, 1, 1, 1, 1,
1.857238, 1.404825, 1.277542, 1, 1, 1, 1, 1,
1.868134, -0.03620331, 1.413116, 1, 1, 1, 1, 1,
1.883471, -0.5341124, 2.370169, 1, 1, 1, 1, 1,
1.893766, -0.2823082, 2.527569, 1, 1, 1, 1, 1,
1.895905, 1.380054, 0.199961, 1, 1, 1, 1, 1,
1.903739, 1.723396, 3.097719, 1, 1, 1, 1, 1,
1.917988, -0.07188145, 0.3788165, 1, 1, 1, 1, 1,
1.928675, -1.342253, 0.6803289, 1, 1, 1, 1, 1,
1.930811, 0.6355414, 1.495391, 1, 1, 1, 1, 1,
1.965449, -0.6583315, 1.307719, 1, 1, 1, 1, 1,
1.982277, -1.163511, 0.6581584, 1, 1, 1, 1, 1,
2.012457, 1.011806, 0.1994644, 1, 1, 1, 1, 1,
2.044637, 0.1029233, 2.659002, 0, 0, 1, 1, 1,
2.061245, -0.3534183, 0.4449807, 1, 0, 0, 1, 1,
2.086974, 0.1770231, 1.068004, 1, 0, 0, 1, 1,
2.094425, -0.1860433, 0.5261047, 1, 0, 0, 1, 1,
2.154538, -0.481802, 1.479842, 1, 0, 0, 1, 1,
2.15695, 0.4752204, 1.550944, 1, 0, 0, 1, 1,
2.182897, -0.8881109, 1.896069, 0, 0, 0, 1, 1,
2.230332, 0.2208857, 2.566995, 0, 0, 0, 1, 1,
2.251324, 0.05875634, 1.373748, 0, 0, 0, 1, 1,
2.298414, -3.0901, 4.020106, 0, 0, 0, 1, 1,
2.308298, 0.5045576, 1.181494, 0, 0, 0, 1, 1,
2.321625, -0.5094526, 0.8462421, 0, 0, 0, 1, 1,
2.347448, -2.586726, 3.256097, 0, 0, 0, 1, 1,
2.35681, 0.0303522, 1.49823, 1, 1, 1, 1, 1,
2.37615, -0.3543391, 1.767423, 1, 1, 1, 1, 1,
2.440651, -0.8063349, 1.579158, 1, 1, 1, 1, 1,
2.444632, -1.702742, 3.63066, 1, 1, 1, 1, 1,
2.602011, -0.2096466, 1.383716, 1, 1, 1, 1, 1,
2.778722, -0.8272849, 2.102412, 1, 1, 1, 1, 1,
3.54238, 0.2511898, 1.156492, 1, 1, 1, 1, 1
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
var radius = 9.713278;
var distance = 34.11748;
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
mvMatrix.translate( 0.1695306, 0.03161049, 0.01804328 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.11748);
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
