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
-2.778824, -0.8320258, -1.901657, 1, 0, 0, 1,
-2.777371, 0.6942614, -2.478818, 1, 0.007843138, 0, 1,
-2.733567, -2.275267, -1.978169, 1, 0.01176471, 0, 1,
-2.579021, -1.136353, -1.718534, 1, 0.01960784, 0, 1,
-2.544883, -0.8986325, -2.273348, 1, 0.02352941, 0, 1,
-2.472868, -1.89844, -1.27609, 1, 0.03137255, 0, 1,
-2.468974, 0.3482406, -2.120286, 1, 0.03529412, 0, 1,
-2.456338, 0.2469877, -0.9627338, 1, 0.04313726, 0, 1,
-2.45331, 1.196417, -1.70148, 1, 0.04705882, 0, 1,
-2.355452, 0.4730395, -0.2919767, 1, 0.05490196, 0, 1,
-2.299202, -1.978106, -2.033281, 1, 0.05882353, 0, 1,
-2.18165, 1.32948, -1.624517, 1, 0.06666667, 0, 1,
-2.159021, 0.9294215, -1.686353, 1, 0.07058824, 0, 1,
-2.158642, 0.500447, -1.448701, 1, 0.07843138, 0, 1,
-2.144776, 1.34384, -0.2850454, 1, 0.08235294, 0, 1,
-2.102264, 1.704615, -2.159229, 1, 0.09019608, 0, 1,
-2.067174, -0.08128887, -1.712749, 1, 0.09411765, 0, 1,
-2.06609, 0.8561284, -2.332572, 1, 0.1019608, 0, 1,
-2.061503, -1.224493, -0.6631635, 1, 0.1098039, 0, 1,
-2.054745, -0.4894994, -2.637895, 1, 0.1137255, 0, 1,
-2.037809, 0.01110097, -3.005796, 1, 0.1215686, 0, 1,
-2.027197, 0.4631501, -2.069963, 1, 0.1254902, 0, 1,
-2.026823, 1.762905, -0.7068744, 1, 0.1333333, 0, 1,
-2.026699, 1.099398, -2.015814, 1, 0.1372549, 0, 1,
-2.016658, 1.380076, -1.708377, 1, 0.145098, 0, 1,
-1.993426, -1.231976, -3.32961, 1, 0.1490196, 0, 1,
-1.992501, -0.93394, -0.8145508, 1, 0.1568628, 0, 1,
-1.965521, 2.804235, -0.1479484, 1, 0.1607843, 0, 1,
-1.953732, 0.4556233, -2.136699, 1, 0.1686275, 0, 1,
-1.943903, 1.222589, -0.3694805, 1, 0.172549, 0, 1,
-1.934023, -0.8299931, -0.09772899, 1, 0.1803922, 0, 1,
-1.913376, -0.5976664, -3.421672, 1, 0.1843137, 0, 1,
-1.899133, 0.4366841, -0.7576109, 1, 0.1921569, 0, 1,
-1.895174, -1.363793, -3.357688, 1, 0.1960784, 0, 1,
-1.894867, 3.451456, -0.4652306, 1, 0.2039216, 0, 1,
-1.877013, -0.8310755, -0.6437876, 1, 0.2117647, 0, 1,
-1.871919, 0.8815683, -0.6082381, 1, 0.2156863, 0, 1,
-1.871171, 1.219245, -1.204048, 1, 0.2235294, 0, 1,
-1.856432, 0.1560604, -1.955743, 1, 0.227451, 0, 1,
-1.845517, 0.2986759, -1.841166, 1, 0.2352941, 0, 1,
-1.828337, 0.2637247, -0.7511926, 1, 0.2392157, 0, 1,
-1.804293, -0.3158015, -1.37159, 1, 0.2470588, 0, 1,
-1.795146, -0.6766089, -3.170173, 1, 0.2509804, 0, 1,
-1.789813, 2.26747, -0.3379052, 1, 0.2588235, 0, 1,
-1.78346, -0.5254461, -0.7431387, 1, 0.2627451, 0, 1,
-1.761231, 2.076292, 0.2370987, 1, 0.2705882, 0, 1,
-1.745297, -2.39501, -3.907923, 1, 0.2745098, 0, 1,
-1.742805, 0.07902989, 0.643882, 1, 0.282353, 0, 1,
-1.740353, 0.8112751, -0.306843, 1, 0.2862745, 0, 1,
-1.700792, 0.1879664, -3.221396, 1, 0.2941177, 0, 1,
-1.696118, -0.06780082, -1.602867, 1, 0.3019608, 0, 1,
-1.690822, -1.06009, -1.988906, 1, 0.3058824, 0, 1,
-1.681696, -0.1430507, -1.235366, 1, 0.3137255, 0, 1,
-1.663299, -0.3292499, -0.317621, 1, 0.3176471, 0, 1,
-1.641718, 0.09621909, -2.91314, 1, 0.3254902, 0, 1,
-1.641651, -0.05491933, -2.309797, 1, 0.3294118, 0, 1,
-1.580714, 0.7348158, -0.9709053, 1, 0.3372549, 0, 1,
-1.575761, -0.2726978, -1.569956, 1, 0.3411765, 0, 1,
-1.571281, -0.8079565, -1.133256, 1, 0.3490196, 0, 1,
-1.569228, -0.7905604, -2.012959, 1, 0.3529412, 0, 1,
-1.569094, -0.351843, -2.19464, 1, 0.3607843, 0, 1,
-1.561977, -0.2261918, -2.025729, 1, 0.3647059, 0, 1,
-1.559547, 0.9297726, -1.192679, 1, 0.372549, 0, 1,
-1.559527, -0.2748204, -2.236328, 1, 0.3764706, 0, 1,
-1.559062, -0.7726434, -0.6043364, 1, 0.3843137, 0, 1,
-1.553191, 0.3147804, -1.032019, 1, 0.3882353, 0, 1,
-1.545565, -0.9167641, -1.949858, 1, 0.3960784, 0, 1,
-1.537249, -2.070443, -2.211198, 1, 0.4039216, 0, 1,
-1.536326, 0.005388304, -0.5979667, 1, 0.4078431, 0, 1,
-1.536095, -0.2104001, -2.431762, 1, 0.4156863, 0, 1,
-1.526975, -0.005886556, -2.10079, 1, 0.4196078, 0, 1,
-1.522346, 0.504383, -1.751699, 1, 0.427451, 0, 1,
-1.521725, 0.5485677, -1.793988, 1, 0.4313726, 0, 1,
-1.499088, -0.1193999, -1.422031, 1, 0.4392157, 0, 1,
-1.490561, 2.654074, -0.2940903, 1, 0.4431373, 0, 1,
-1.461281, 0.1370074, -1.355883, 1, 0.4509804, 0, 1,
-1.460713, 0.5954731, -1.511592, 1, 0.454902, 0, 1,
-1.447902, 0.04092509, -2.691367, 1, 0.4627451, 0, 1,
-1.444172, 0.8744365, -1.567928, 1, 0.4666667, 0, 1,
-1.444087, -1.047391, -0.1104689, 1, 0.4745098, 0, 1,
-1.405893, 0.119964, -0.9426026, 1, 0.4784314, 0, 1,
-1.404729, -0.4004335, -0.5262986, 1, 0.4862745, 0, 1,
-1.402601, -1.866906, -1.928553, 1, 0.4901961, 0, 1,
-1.401527, -0.7509415, -2.598781, 1, 0.4980392, 0, 1,
-1.397483, 0.3338493, -2.008965, 1, 0.5058824, 0, 1,
-1.390192, -0.6717213, -1.096222, 1, 0.509804, 0, 1,
-1.38456, 2.049684, 0.3507953, 1, 0.5176471, 0, 1,
-1.382558, 0.4351792, -2.304584, 1, 0.5215687, 0, 1,
-1.371343, 0.5755722, -1.045343, 1, 0.5294118, 0, 1,
-1.366737, 0.100321, -1.303713, 1, 0.5333334, 0, 1,
-1.361264, 0.6436015, 0.5950051, 1, 0.5411765, 0, 1,
-1.357525, -0.8628254, -4.088442, 1, 0.5450981, 0, 1,
-1.344055, -0.4016063, -3.127362, 1, 0.5529412, 0, 1,
-1.339399, 0.352983, -1.160218, 1, 0.5568628, 0, 1,
-1.336767, -0.3696482, -2.567237, 1, 0.5647059, 0, 1,
-1.32978, 2.039591, -1.862073, 1, 0.5686275, 0, 1,
-1.327639, 0.8280747, -1.225646, 1, 0.5764706, 0, 1,
-1.316983, -0.9369793, -1.555472, 1, 0.5803922, 0, 1,
-1.30909, 0.7619494, -0.3517685, 1, 0.5882353, 0, 1,
-1.307568, 2.589619, -0.08139151, 1, 0.5921569, 0, 1,
-1.306253, -0.1768961, -0.224139, 1, 0.6, 0, 1,
-1.3034, 0.1085541, -0.7914588, 1, 0.6078432, 0, 1,
-1.296384, 0.6936271, 0.09193839, 1, 0.6117647, 0, 1,
-1.286712, -1.808609, -2.656878, 1, 0.6196079, 0, 1,
-1.284968, -1.816051, -1.929424, 1, 0.6235294, 0, 1,
-1.273746, 0.3489358, -1.282007, 1, 0.6313726, 0, 1,
-1.268996, 0.09968996, -3.191634, 1, 0.6352941, 0, 1,
-1.259506, 0.2517107, -2.394067, 1, 0.6431373, 0, 1,
-1.251533, -0.3099706, -2.514277, 1, 0.6470588, 0, 1,
-1.250572, -0.03586222, -2.578439, 1, 0.654902, 0, 1,
-1.244522, 1.420147, -0.3739476, 1, 0.6588235, 0, 1,
-1.240745, 0.3018819, -2.352608, 1, 0.6666667, 0, 1,
-1.24026, 0.933791, -2.88143, 1, 0.6705883, 0, 1,
-1.237322, -0.6787423, -4.17272, 1, 0.6784314, 0, 1,
-1.232845, 0.2516062, -2.947934, 1, 0.682353, 0, 1,
-1.220375, 1.390164, -1.529064, 1, 0.6901961, 0, 1,
-1.218439, 0.4849695, -1.400395, 1, 0.6941177, 0, 1,
-1.215491, -0.5591289, -1.706917, 1, 0.7019608, 0, 1,
-1.211702, -1.979597, -3.349329, 1, 0.7098039, 0, 1,
-1.20603, -0.07947049, -0.1225981, 1, 0.7137255, 0, 1,
-1.20426, 0.4543665, -0.3020374, 1, 0.7215686, 0, 1,
-1.194038, -1.028878, -2.237451, 1, 0.7254902, 0, 1,
-1.181804, 0.02751746, -1.227186, 1, 0.7333333, 0, 1,
-1.179665, 0.7193387, 0.539848, 1, 0.7372549, 0, 1,
-1.179484, 0.5832546, -0.9656835, 1, 0.7450981, 0, 1,
-1.178993, 1.981373, -0.01201301, 1, 0.7490196, 0, 1,
-1.178575, -2.155507, -5.191007, 1, 0.7568628, 0, 1,
-1.175281, -0.1261196, -1.192654, 1, 0.7607843, 0, 1,
-1.172602, 1.093582, -0.5099211, 1, 0.7686275, 0, 1,
-1.163407, 1.627856, 0.3095046, 1, 0.772549, 0, 1,
-1.162809, 1.050403, 0.1048613, 1, 0.7803922, 0, 1,
-1.160755, -0.2264031, -1.050667, 1, 0.7843137, 0, 1,
-1.151433, 0.8821719, -1.404207, 1, 0.7921569, 0, 1,
-1.148242, 1.589883, -1.044292, 1, 0.7960784, 0, 1,
-1.145043, 0.04760579, -0.7867749, 1, 0.8039216, 0, 1,
-1.14336, -0.2144735, -2.78128, 1, 0.8117647, 0, 1,
-1.14195, 1.280056, 0.6000932, 1, 0.8156863, 0, 1,
-1.139861, 0.4812227, 0.2927891, 1, 0.8235294, 0, 1,
-1.139216, -0.2511772, -1.775444, 1, 0.827451, 0, 1,
-1.138947, -0.5047575, -0.9046153, 1, 0.8352941, 0, 1,
-1.138689, -1.286088, -1.736195, 1, 0.8392157, 0, 1,
-1.13789, 0.1877463, -0.8285818, 1, 0.8470588, 0, 1,
-1.137516, 0.9750295, -0.6512708, 1, 0.8509804, 0, 1,
-1.136418, -0.3931706, -1.172338, 1, 0.8588235, 0, 1,
-1.135125, -1.097988, -1.002553, 1, 0.8627451, 0, 1,
-1.125612, -0.8546779, -1.389552, 1, 0.8705882, 0, 1,
-1.122203, -0.2969154, -2.31974, 1, 0.8745098, 0, 1,
-1.121998, 0.2065122, -1.724723, 1, 0.8823529, 0, 1,
-1.117205, -0.8600269, -2.706822, 1, 0.8862745, 0, 1,
-1.115935, 2.120661, 0.8743384, 1, 0.8941177, 0, 1,
-1.108769, -0.9659098, -4.143749, 1, 0.8980392, 0, 1,
-1.105806, -0.6532369, -0.2867606, 1, 0.9058824, 0, 1,
-1.102453, 0.6422014, 1.468168, 1, 0.9137255, 0, 1,
-1.099924, 0.5561607, -2.493344, 1, 0.9176471, 0, 1,
-1.095531, 0.9883295, -2.252596, 1, 0.9254902, 0, 1,
-1.09341, -0.4992912, -1.526804, 1, 0.9294118, 0, 1,
-1.087549, -0.5617613, -3.026315, 1, 0.9372549, 0, 1,
-1.076058, 0.08001243, -0.822552, 1, 0.9411765, 0, 1,
-1.073946, -0.09292619, 0.4834926, 1, 0.9490196, 0, 1,
-1.069356, 0.007405043, -1.440831, 1, 0.9529412, 0, 1,
-1.067241, 0.5946869, -0.7809634, 1, 0.9607843, 0, 1,
-1.064203, 0.8804518, -1.711038, 1, 0.9647059, 0, 1,
-1.063727, -0.4684324, -2.530316, 1, 0.972549, 0, 1,
-1.062422, -0.2282766, -1.800734, 1, 0.9764706, 0, 1,
-1.061222, -0.6071428, -1.317695, 1, 0.9843137, 0, 1,
-1.056207, 0.4563037, -0.7404779, 1, 0.9882353, 0, 1,
-1.052394, -0.06461212, 0.1437495, 1, 0.9960784, 0, 1,
-1.048491, 1.380666, -0.9422446, 0.9960784, 1, 0, 1,
-1.042359, -0.03455039, -1.601542, 0.9921569, 1, 0, 1,
-1.04195, 0.2155112, -0.4884572, 0.9843137, 1, 0, 1,
-1.041768, 0.572139, -1.231842, 0.9803922, 1, 0, 1,
-1.041285, -0.3947519, -2.082285, 0.972549, 1, 0, 1,
-1.03073, 2.292956, 0.6962692, 0.9686275, 1, 0, 1,
-1.029219, 1.774039, 0.1559601, 0.9607843, 1, 0, 1,
-1.025144, 1.063599, -1.055421, 0.9568627, 1, 0, 1,
-1.024702, 0.5190514, -1.220301, 0.9490196, 1, 0, 1,
-1.02254, 1.743942, 1.309865, 0.945098, 1, 0, 1,
-1.018111, 1.051596, -1.010536, 0.9372549, 1, 0, 1,
-1.015906, -1.269999, -2.741567, 0.9333333, 1, 0, 1,
-0.9981645, -0.4160372, -1.704453, 0.9254902, 1, 0, 1,
-0.9918428, -0.2120095, -0.792679, 0.9215686, 1, 0, 1,
-0.9894108, -0.2543165, -2.538571, 0.9137255, 1, 0, 1,
-0.9836022, 2.229073, -0.898184, 0.9098039, 1, 0, 1,
-0.9824808, 2.948264, 0.7510777, 0.9019608, 1, 0, 1,
-0.9785581, -1.01361, -3.963516, 0.8941177, 1, 0, 1,
-0.9785351, 1.571347, -1.814124, 0.8901961, 1, 0, 1,
-0.9778414, -0.08059043, -1.677972, 0.8823529, 1, 0, 1,
-0.9754985, -0.01214425, -1.788465, 0.8784314, 1, 0, 1,
-0.9743663, 0.6838903, 0.2825953, 0.8705882, 1, 0, 1,
-0.9733908, -0.1981231, -1.37035, 0.8666667, 1, 0, 1,
-0.9704049, -1.924397, -1.375855, 0.8588235, 1, 0, 1,
-0.9671361, -0.7801951, -3.109177, 0.854902, 1, 0, 1,
-0.959486, -1.303023, -3.500964, 0.8470588, 1, 0, 1,
-0.9467821, -0.3221952, -1.760466, 0.8431373, 1, 0, 1,
-0.9462646, -1.171257, -3.542064, 0.8352941, 1, 0, 1,
-0.9453506, -0.6445652, -1.707251, 0.8313726, 1, 0, 1,
-0.9452665, -0.8558161, -0.9097718, 0.8235294, 1, 0, 1,
-0.9371043, -1.248904, -2.036475, 0.8196079, 1, 0, 1,
-0.9329882, 0.633772, -0.6334981, 0.8117647, 1, 0, 1,
-0.9292042, -1.306491, -4.383718, 0.8078431, 1, 0, 1,
-0.9247392, 0.336409, -2.829683, 0.8, 1, 0, 1,
-0.9228958, 0.4450503, -0.445093, 0.7921569, 1, 0, 1,
-0.9145849, 0.7501867, 0.02629456, 0.7882353, 1, 0, 1,
-0.9140894, 0.6838505, -0.09804914, 0.7803922, 1, 0, 1,
-0.9046896, 0.6092401, -1.799428, 0.7764706, 1, 0, 1,
-0.9022015, -0.04069996, -1.38766, 0.7686275, 1, 0, 1,
-0.9013184, 1.590699, -0.381728, 0.7647059, 1, 0, 1,
-0.9003274, -0.6620402, -2.668705, 0.7568628, 1, 0, 1,
-0.899334, 0.1692291, -1.744371, 0.7529412, 1, 0, 1,
-0.8937348, 0.2702616, -1.993094, 0.7450981, 1, 0, 1,
-0.8926865, -0.6334597, -2.428534, 0.7411765, 1, 0, 1,
-0.8921331, -1.079124, -2.047697, 0.7333333, 1, 0, 1,
-0.8917794, -2.762717, -4.179213, 0.7294118, 1, 0, 1,
-0.8901811, -1.153787, -3.03173, 0.7215686, 1, 0, 1,
-0.8825368, 0.8165429, -1.836108, 0.7176471, 1, 0, 1,
-0.8801969, -0.5155675, -1.714878, 0.7098039, 1, 0, 1,
-0.8792304, 0.3678275, -0.2619811, 0.7058824, 1, 0, 1,
-0.8776461, 0.3016662, -1.076338, 0.6980392, 1, 0, 1,
-0.8775775, 0.1042698, -1.87799, 0.6901961, 1, 0, 1,
-0.8766279, 1.175403, -0.540068, 0.6862745, 1, 0, 1,
-0.8661368, -0.570153, 0.7428055, 0.6784314, 1, 0, 1,
-0.8617651, -0.7458064, -1.710882, 0.6745098, 1, 0, 1,
-0.8526384, -0.4792741, -4.034685, 0.6666667, 1, 0, 1,
-0.8463162, 0.7594559, -1.731761, 0.6627451, 1, 0, 1,
-0.8448418, -1.239495, -2.025394, 0.654902, 1, 0, 1,
-0.8357353, 0.1468021, -0.3369126, 0.6509804, 1, 0, 1,
-0.8294846, 0.5729508, 0.3353421, 0.6431373, 1, 0, 1,
-0.8243493, 0.4020782, -1.887826, 0.6392157, 1, 0, 1,
-0.82371, -1.105295, -1.981043, 0.6313726, 1, 0, 1,
-0.8135656, 2.055118, -0.3785622, 0.627451, 1, 0, 1,
-0.8121564, -1.017153, -1.682215, 0.6196079, 1, 0, 1,
-0.8113775, 0.2633465, -0.6143367, 0.6156863, 1, 0, 1,
-0.8101342, 1.193468, -1.918418, 0.6078432, 1, 0, 1,
-0.8098322, -0.253179, -1.456813, 0.6039216, 1, 0, 1,
-0.809691, -1.021608, -2.324111, 0.5960785, 1, 0, 1,
-0.8092062, 0.7002133, -1.297467, 0.5882353, 1, 0, 1,
-0.8072723, -1.258454, -3.596917, 0.5843138, 1, 0, 1,
-0.8068185, -0.5731326, -2.284778, 0.5764706, 1, 0, 1,
-0.7993172, -1.245672, -5.058215, 0.572549, 1, 0, 1,
-0.7892963, 1.888217, 0.7880512, 0.5647059, 1, 0, 1,
-0.7887142, -0.3264946, -2.611914, 0.5607843, 1, 0, 1,
-0.786379, 0.2876698, -0.7910503, 0.5529412, 1, 0, 1,
-0.7863444, -0.6344946, -1.222883, 0.5490196, 1, 0, 1,
-0.7832878, -1.269064, -3.132568, 0.5411765, 1, 0, 1,
-0.7685141, 0.1799305, -0.8500675, 0.5372549, 1, 0, 1,
-0.7685059, -0.8777089, -2.490386, 0.5294118, 1, 0, 1,
-0.7666718, 0.2818605, -2.001227, 0.5254902, 1, 0, 1,
-0.7646406, -1.706136, -3.041855, 0.5176471, 1, 0, 1,
-0.7487451, -0.7926261, -1.943401, 0.5137255, 1, 0, 1,
-0.7454191, -2.111269, -3.69388, 0.5058824, 1, 0, 1,
-0.7452611, -0.9877343, -3.889323, 0.5019608, 1, 0, 1,
-0.738934, 0.8083109, -0.003134884, 0.4941176, 1, 0, 1,
-0.7388396, 0.364739, -1.204654, 0.4862745, 1, 0, 1,
-0.7361233, -0.5645297, -2.260981, 0.4823529, 1, 0, 1,
-0.7315706, 0.7291454, -0.8724459, 0.4745098, 1, 0, 1,
-0.7295987, 0.5889204, 0.4817305, 0.4705882, 1, 0, 1,
-0.7242558, -0.1230781, -0.9905645, 0.4627451, 1, 0, 1,
-0.7232446, 0.7295883, -0.9641374, 0.4588235, 1, 0, 1,
-0.7192367, 1.792656, 0.264293, 0.4509804, 1, 0, 1,
-0.7106357, 0.619966, -0.1753836, 0.4470588, 1, 0, 1,
-0.7066653, 0.1313214, -1.268108, 0.4392157, 1, 0, 1,
-0.7062095, -1.079727, -3.159496, 0.4352941, 1, 0, 1,
-0.6982945, -2.01935, -3.163707, 0.427451, 1, 0, 1,
-0.6960025, -0.5771207, -4.285451, 0.4235294, 1, 0, 1,
-0.6894184, 0.2711453, 0.005208341, 0.4156863, 1, 0, 1,
-0.6857358, -0.5500032, -3.244206, 0.4117647, 1, 0, 1,
-0.6834095, -0.2893032, -3.098993, 0.4039216, 1, 0, 1,
-0.6765199, 0.2103954, -1.705375, 0.3960784, 1, 0, 1,
-0.6763245, -0.7727041, -2.122898, 0.3921569, 1, 0, 1,
-0.6758671, -1.411231, -3.454673, 0.3843137, 1, 0, 1,
-0.6743144, 0.3456654, 0.1008408, 0.3803922, 1, 0, 1,
-0.6733349, 0.7326229, -0.5481397, 0.372549, 1, 0, 1,
-0.6733088, 0.0496599, -3.19282, 0.3686275, 1, 0, 1,
-0.6728817, -0.4166931, -2.377598, 0.3607843, 1, 0, 1,
-0.6718125, 0.1915914, -2.166512, 0.3568628, 1, 0, 1,
-0.6713519, -0.2213806, -0.7345924, 0.3490196, 1, 0, 1,
-0.671059, -1.564284, -3.445942, 0.345098, 1, 0, 1,
-0.669545, -0.8981489, -4.864676, 0.3372549, 1, 0, 1,
-0.6684656, 0.7527453, -0.2041287, 0.3333333, 1, 0, 1,
-0.6678665, 0.2466496, -2.871605, 0.3254902, 1, 0, 1,
-0.6646576, 1.194659, -2.32622, 0.3215686, 1, 0, 1,
-0.6596063, -1.687319, -2.775346, 0.3137255, 1, 0, 1,
-0.6565725, -0.06068975, -1.486117, 0.3098039, 1, 0, 1,
-0.6546239, 1.228626, 0.6323037, 0.3019608, 1, 0, 1,
-0.6480635, -0.6325758, -2.57489, 0.2941177, 1, 0, 1,
-0.6326309, 0.7620063, -1.900613, 0.2901961, 1, 0, 1,
-0.6312808, 1.332098, -0.1171342, 0.282353, 1, 0, 1,
-0.6285934, 1.418217, -2.476022, 0.2784314, 1, 0, 1,
-0.62608, -1.338489, -3.614284, 0.2705882, 1, 0, 1,
-0.6250704, 0.5516648, -1.684705, 0.2666667, 1, 0, 1,
-0.6227099, 0.2846795, -0.5893307, 0.2588235, 1, 0, 1,
-0.6186491, 1.733798, 0.5244734, 0.254902, 1, 0, 1,
-0.6186468, 0.006971226, -3.401328, 0.2470588, 1, 0, 1,
-0.6173804, -0.1292065, -2.417887, 0.2431373, 1, 0, 1,
-0.6118913, -0.2356898, -1.958779, 0.2352941, 1, 0, 1,
-0.6020923, -0.3216237, -1.642622, 0.2313726, 1, 0, 1,
-0.597285, 0.4680451, 0.9349466, 0.2235294, 1, 0, 1,
-0.5912393, -0.2049785, -0.7886724, 0.2196078, 1, 0, 1,
-0.5876552, 0.7387431, 0.1936504, 0.2117647, 1, 0, 1,
-0.5856432, -0.4789552, -2.020621, 0.2078431, 1, 0, 1,
-0.5768912, 1.054347, 0.3357967, 0.2, 1, 0, 1,
-0.5754083, 1.445161, 1.033698, 0.1921569, 1, 0, 1,
-0.5711998, -0.6932953, -1.431639, 0.1882353, 1, 0, 1,
-0.5648194, 0.2913844, 0.4181878, 0.1803922, 1, 0, 1,
-0.5638456, -0.03685643, -0.6056334, 0.1764706, 1, 0, 1,
-0.5613252, 1.337528, -0.6807521, 0.1686275, 1, 0, 1,
-0.5579, -0.08516316, -2.070009, 0.1647059, 1, 0, 1,
-0.5537362, 2.046264, -0.3273608, 0.1568628, 1, 0, 1,
-0.5529532, 1.383151, -0.3553455, 0.1529412, 1, 0, 1,
-0.5522863, 0.07468233, -0.7050548, 0.145098, 1, 0, 1,
-0.5518132, -0.1892478, -2.570974, 0.1411765, 1, 0, 1,
-0.5476717, 1.406683, -1.032577, 0.1333333, 1, 0, 1,
-0.5451138, 0.8837192, 0.481396, 0.1294118, 1, 0, 1,
-0.5441954, 0.5295069, -1.313508, 0.1215686, 1, 0, 1,
-0.5347422, 0.2608982, 1.071864, 0.1176471, 1, 0, 1,
-0.5320302, -0.5979099, -2.853996, 0.1098039, 1, 0, 1,
-0.5297817, -0.4045953, -2.593765, 0.1058824, 1, 0, 1,
-0.5276237, 0.6209874, -1.481455, 0.09803922, 1, 0, 1,
-0.52564, -1.070284, -3.612826, 0.09019608, 1, 0, 1,
-0.5251369, 0.6243953, 0.1879859, 0.08627451, 1, 0, 1,
-0.5238913, -0.5531348, -3.46205, 0.07843138, 1, 0, 1,
-0.522126, 1.599287, -2.349662, 0.07450981, 1, 0, 1,
-0.5175825, -1.10387, -3.725398, 0.06666667, 1, 0, 1,
-0.5166737, -0.7520257, -2.2816, 0.0627451, 1, 0, 1,
-0.507289, -2.166107, -3.852386, 0.05490196, 1, 0, 1,
-0.5047426, -0.8067898, -4.057003, 0.05098039, 1, 0, 1,
-0.5043198, 2.283082, -0.5787653, 0.04313726, 1, 0, 1,
-0.5034775, -0.13503, -0.5660223, 0.03921569, 1, 0, 1,
-0.5011185, 0.397667, -1.767819, 0.03137255, 1, 0, 1,
-0.4943686, 0.2082735, -1.424372, 0.02745098, 1, 0, 1,
-0.4931899, 1.381319, -0.5085802, 0.01960784, 1, 0, 1,
-0.4925929, -0.8877454, -1.681839, 0.01568628, 1, 0, 1,
-0.490117, -0.9957111, -1.972824, 0.007843138, 1, 0, 1,
-0.4892324, 0.6890951, -0.07873862, 0.003921569, 1, 0, 1,
-0.4871086, -0.4552151, -2.492836, 0, 1, 0.003921569, 1,
-0.4759475, -1.088864, -1.472653, 0, 1, 0.01176471, 1,
-0.4715636, -1.871282, -2.911825, 0, 1, 0.01568628, 1,
-0.4701638, 1.368398, -0.6791194, 0, 1, 0.02352941, 1,
-0.4692891, -0.1641957, -1.360906, 0, 1, 0.02745098, 1,
-0.4684503, -0.3731408, -0.5827338, 0, 1, 0.03529412, 1,
-0.4566549, -0.4481418, -2.262788, 0, 1, 0.03921569, 1,
-0.4546859, 1.242315, 1.188421, 0, 1, 0.04705882, 1,
-0.4534562, -0.7378054, -0.9227198, 0, 1, 0.05098039, 1,
-0.4512337, 0.5853475, -1.424673, 0, 1, 0.05882353, 1,
-0.4502296, 1.085681, -1.163817, 0, 1, 0.0627451, 1,
-0.4446567, -0.2468259, -2.739174, 0, 1, 0.07058824, 1,
-0.4446522, 1.750024, -1.502041, 0, 1, 0.07450981, 1,
-0.4421181, 0.2481747, -2.283871, 0, 1, 0.08235294, 1,
-0.4413888, 1.221582, 0.6791591, 0, 1, 0.08627451, 1,
-0.4393832, 1.454288, 0.3308732, 0, 1, 0.09411765, 1,
-0.4390091, -1.147711, -2.996185, 0, 1, 0.1019608, 1,
-0.4332166, -1.3509, -3.55455, 0, 1, 0.1058824, 1,
-0.432362, -0.2748162, -2.590606, 0, 1, 0.1137255, 1,
-0.4320171, -0.3941692, -2.557201, 0, 1, 0.1176471, 1,
-0.4319099, 0.2526671, -1.705449, 0, 1, 0.1254902, 1,
-0.4313355, -0.4180329, -2.062524, 0, 1, 0.1294118, 1,
-0.4312755, 1.096292, 0.3152813, 0, 1, 0.1372549, 1,
-0.4278122, 1.46161, -0.1928143, 0, 1, 0.1411765, 1,
-0.4224322, -1.248772, -3.882489, 0, 1, 0.1490196, 1,
-0.4212626, 0.3282062, -0.1606944, 0, 1, 0.1529412, 1,
-0.4202374, -1.380707, -2.691796, 0, 1, 0.1607843, 1,
-0.4142609, 0.1895327, 0.5117318, 0, 1, 0.1647059, 1,
-0.4107503, 0.1808192, -1.386588, 0, 1, 0.172549, 1,
-0.40738, 0.1227199, -0.5814665, 0, 1, 0.1764706, 1,
-0.4049612, 0.6417961, 1.264851, 0, 1, 0.1843137, 1,
-0.403394, -1.2514, -1.010201, 0, 1, 0.1882353, 1,
-0.3994105, 0.5847694, -2.052578, 0, 1, 0.1960784, 1,
-0.3946199, 0.8293501, 0.4713435, 0, 1, 0.2039216, 1,
-0.393696, -0.5377136, -1.864399, 0, 1, 0.2078431, 1,
-0.3934619, -0.2764056, -1.821351, 0, 1, 0.2156863, 1,
-0.392159, -1.562934, -2.981579, 0, 1, 0.2196078, 1,
-0.3898903, -0.268925, -1.050723, 0, 1, 0.227451, 1,
-0.3857937, -1.113704, -2.718377, 0, 1, 0.2313726, 1,
-0.3827347, 0.01339286, 0.04017239, 0, 1, 0.2392157, 1,
-0.3774541, -0.5052882, -2.634671, 0, 1, 0.2431373, 1,
-0.3772559, 0.8747354, -0.3764688, 0, 1, 0.2509804, 1,
-0.3763814, 0.8580472, -0.08595697, 0, 1, 0.254902, 1,
-0.3763472, -1.04479, -1.752636, 0, 1, 0.2627451, 1,
-0.3752705, -0.6986266, -2.897743, 0, 1, 0.2666667, 1,
-0.3706391, 0.580066, -0.3902143, 0, 1, 0.2745098, 1,
-0.3699817, 0.30902, -0.6355779, 0, 1, 0.2784314, 1,
-0.3637424, 1.592294, 0.07470237, 0, 1, 0.2862745, 1,
-0.3637175, -0.10896, -2.046774, 0, 1, 0.2901961, 1,
-0.3634423, 0.6083375, -1.169922, 0, 1, 0.2980392, 1,
-0.3584712, -0.6157742, -4.471747, 0, 1, 0.3058824, 1,
-0.3557202, 0.2407169, -1.616737, 0, 1, 0.3098039, 1,
-0.354951, 0.5261341, -1.113495, 0, 1, 0.3176471, 1,
-0.3523378, -0.8248463, -1.495759, 0, 1, 0.3215686, 1,
-0.3516431, -1.059651, -4.500565, 0, 1, 0.3294118, 1,
-0.3462553, -1.165596, -2.655834, 0, 1, 0.3333333, 1,
-0.3424627, 1.029274, -0.1029396, 0, 1, 0.3411765, 1,
-0.3416275, 1.715957, 0.5413958, 0, 1, 0.345098, 1,
-0.3414289, 0.4389021, 0.7478256, 0, 1, 0.3529412, 1,
-0.3394763, -0.06081193, -3.653278, 0, 1, 0.3568628, 1,
-0.3361809, 1.269737, 0.4833931, 0, 1, 0.3647059, 1,
-0.3272018, 0.2736862, -0.101659, 0, 1, 0.3686275, 1,
-0.3258317, -0.5070274, -3.181626, 0, 1, 0.3764706, 1,
-0.3226328, -0.5252792, -2.667017, 0, 1, 0.3803922, 1,
-0.3223749, -1.339253, -2.560273, 0, 1, 0.3882353, 1,
-0.3201948, -0.6987558, -2.875218, 0, 1, 0.3921569, 1,
-0.3196862, -0.3250391, -2.964361, 0, 1, 0.4, 1,
-0.3156668, 0.981557, -0.434037, 0, 1, 0.4078431, 1,
-0.3136258, -0.8142793, -1.920637, 0, 1, 0.4117647, 1,
-0.3114103, 0.5758236, -0.6268425, 0, 1, 0.4196078, 1,
-0.310654, -0.5336608, -2.862141, 0, 1, 0.4235294, 1,
-0.3089895, -0.525579, -2.972086, 0, 1, 0.4313726, 1,
-0.306364, 1.42063, 0.7597497, 0, 1, 0.4352941, 1,
-0.3025736, 1.006539, 1.021202, 0, 1, 0.4431373, 1,
-0.3024862, -0.3207142, -1.210719, 0, 1, 0.4470588, 1,
-0.2986275, -0.845581, -0.6749983, 0, 1, 0.454902, 1,
-0.2969314, -0.06029766, 0.0812678, 0, 1, 0.4588235, 1,
-0.2964449, 0.8525869, -0.1360556, 0, 1, 0.4666667, 1,
-0.2964103, -0.7517459, -1.70003, 0, 1, 0.4705882, 1,
-0.2946551, -0.1828769, -3.155787, 0, 1, 0.4784314, 1,
-0.2939844, -1.734253, -2.92032, 0, 1, 0.4823529, 1,
-0.2902234, -0.01892199, -0.6073846, 0, 1, 0.4901961, 1,
-0.2897603, -0.8786178, -2.654601, 0, 1, 0.4941176, 1,
-0.2801741, 0.1929426, -0.6393498, 0, 1, 0.5019608, 1,
-0.2760707, -0.722306, -2.29753, 0, 1, 0.509804, 1,
-0.2712665, 2.044818, -1.544675, 0, 1, 0.5137255, 1,
-0.2626869, -0.03776503, -2.466062, 0, 1, 0.5215687, 1,
-0.2563688, -0.03905733, -2.889671, 0, 1, 0.5254902, 1,
-0.253114, 0.06154145, -2.736713, 0, 1, 0.5333334, 1,
-0.2530586, -1.410594, -4.516262, 0, 1, 0.5372549, 1,
-0.2516323, -0.9001303, -2.831431, 0, 1, 0.5450981, 1,
-0.2511791, 1.529741, -1.713723, 0, 1, 0.5490196, 1,
-0.2491091, -0.3577323, 0.1238035, 0, 1, 0.5568628, 1,
-0.2465955, 2.882294, 2.127298, 0, 1, 0.5607843, 1,
-0.2450454, 0.01100103, 0.4147019, 0, 1, 0.5686275, 1,
-0.2404625, 0.2604666, 0.2026955, 0, 1, 0.572549, 1,
-0.232126, -0.3317328, -2.773549, 0, 1, 0.5803922, 1,
-0.2303653, 0.8331671, -1.49139, 0, 1, 0.5843138, 1,
-0.2261312, -0.1931223, -3.686237, 0, 1, 0.5921569, 1,
-0.221921, 2.091008, 0.4376122, 0, 1, 0.5960785, 1,
-0.2217672, -0.2265635, -2.036804, 0, 1, 0.6039216, 1,
-0.213294, -1.2597, -1.293295, 0, 1, 0.6117647, 1,
-0.2111687, -1.720555, -3.574508, 0, 1, 0.6156863, 1,
-0.2087844, -0.6913844, -1.882807, 0, 1, 0.6235294, 1,
-0.201783, -0.5841246, -2.252598, 0, 1, 0.627451, 1,
-0.1956145, 2.044165, -1.837306, 0, 1, 0.6352941, 1,
-0.1921425, 0.8932622, -0.6450152, 0, 1, 0.6392157, 1,
-0.1888704, 0.09669342, -2.029648, 0, 1, 0.6470588, 1,
-0.1865396, 1.763695, -1.119431, 0, 1, 0.6509804, 1,
-0.1832983, -0.2635994, -2.12277, 0, 1, 0.6588235, 1,
-0.1795865, 0.6756052, -0.02785865, 0, 1, 0.6627451, 1,
-0.1786479, 0.7781664, 0.2808553, 0, 1, 0.6705883, 1,
-0.177148, -1.797752, -2.90199, 0, 1, 0.6745098, 1,
-0.1760921, -0.459226, -2.918185, 0, 1, 0.682353, 1,
-0.1744145, -2.047808, -0.9069793, 0, 1, 0.6862745, 1,
-0.1648996, 0.8904211, -0.7651494, 0, 1, 0.6941177, 1,
-0.1635753, 0.1536321, -1.344503, 0, 1, 0.7019608, 1,
-0.1609335, -0.7828426, -1.73083, 0, 1, 0.7058824, 1,
-0.1606389, -0.6161804, -3.057517, 0, 1, 0.7137255, 1,
-0.1590605, 0.2827758, -1.018007, 0, 1, 0.7176471, 1,
-0.1578368, -0.2258595, -4.521235, 0, 1, 0.7254902, 1,
-0.1565403, -0.3837655, -5.576386, 0, 1, 0.7294118, 1,
-0.1492887, 1.906838, -1.414033, 0, 1, 0.7372549, 1,
-0.1489138, -0.4191845, -1.160529, 0, 1, 0.7411765, 1,
-0.1485869, -0.7765779, -2.701203, 0, 1, 0.7490196, 1,
-0.1444383, -0.1813973, -2.28738, 0, 1, 0.7529412, 1,
-0.1439724, -0.1041314, -2.906955, 0, 1, 0.7607843, 1,
-0.1433862, 0.7309368, -2.383683, 0, 1, 0.7647059, 1,
-0.1418227, -0.8222904, -5.843472, 0, 1, 0.772549, 1,
-0.1405842, -0.1993132, -1.443788, 0, 1, 0.7764706, 1,
-0.1391614, -0.5620133, -2.645733, 0, 1, 0.7843137, 1,
-0.1389972, -0.4970252, -3.31047, 0, 1, 0.7882353, 1,
-0.1381304, 0.152235, -1.324924, 0, 1, 0.7960784, 1,
-0.1375781, -0.1458512, -1.481929, 0, 1, 0.8039216, 1,
-0.1364437, 2.551023, 0.1503224, 0, 1, 0.8078431, 1,
-0.1316008, 0.1055047, -1.478722, 0, 1, 0.8156863, 1,
-0.1298514, -1.021159, -3.068563, 0, 1, 0.8196079, 1,
-0.1226812, 2.082709, -1.523713, 0, 1, 0.827451, 1,
-0.1196094, 0.326292, 1.418604, 0, 1, 0.8313726, 1,
-0.1164146, -0.31876, -3.666594, 0, 1, 0.8392157, 1,
-0.1083069, -1.434809, -3.697507, 0, 1, 0.8431373, 1,
-0.1046988, -0.7403883, -1.020727, 0, 1, 0.8509804, 1,
-0.1028083, 1.397894, 0.7614446, 0, 1, 0.854902, 1,
-0.1023158, -0.9708653, -3.258417, 0, 1, 0.8627451, 1,
-0.1005354, -0.4298885, -2.118931, 0, 1, 0.8666667, 1,
-0.1000764, -0.7347194, -5.055476, 0, 1, 0.8745098, 1,
-0.09745301, -0.247188, -3.565265, 0, 1, 0.8784314, 1,
-0.09098326, -0.8499532, -4.42308, 0, 1, 0.8862745, 1,
-0.08706228, -1.821238, -3.044502, 0, 1, 0.8901961, 1,
-0.08346126, -0.7270108, -3.511911, 0, 1, 0.8980392, 1,
-0.08332529, -0.395647, -3.09442, 0, 1, 0.9058824, 1,
-0.08254936, 0.6894921, -0.3831613, 0, 1, 0.9098039, 1,
-0.0824713, -0.490264, -1.812752, 0, 1, 0.9176471, 1,
-0.0773431, -0.6162938, -3.741168, 0, 1, 0.9215686, 1,
-0.07296548, 0.4405233, -2.825567, 0, 1, 0.9294118, 1,
-0.07245456, -1.251011, -3.861874, 0, 1, 0.9333333, 1,
-0.07226966, 0.1334862, -3.385086, 0, 1, 0.9411765, 1,
-0.0696122, -0.5686474, -1.898215, 0, 1, 0.945098, 1,
-0.06785037, 0.07377843, -0.1676753, 0, 1, 0.9529412, 1,
-0.06654688, -1.034005, -0.9875235, 0, 1, 0.9568627, 1,
-0.06539521, 0.4440962, 0.06753272, 0, 1, 0.9647059, 1,
-0.05495309, -0.3039236, -1.926985, 0, 1, 0.9686275, 1,
-0.05437027, 1.063087, -1.122406, 0, 1, 0.9764706, 1,
-0.05288079, 1.163284, 0.405196, 0, 1, 0.9803922, 1,
-0.05140203, -0.3934078, -3.190399, 0, 1, 0.9882353, 1,
-0.04140412, -0.7808374, -2.745418, 0, 1, 0.9921569, 1,
-0.04094037, -2.345773, -5.024008, 0, 1, 1, 1,
-0.03155476, 0.07262474, 0.9116297, 0, 0.9921569, 1, 1,
-0.03140299, 0.5776566, 1.251638, 0, 0.9882353, 1, 1,
-0.02907382, 0.3451541, -0.364852, 0, 0.9803922, 1, 1,
-0.02777557, 1.95077, 0.08536207, 0, 0.9764706, 1, 1,
-0.02733538, -0.323722, -2.534214, 0, 0.9686275, 1, 1,
-0.02598335, 1.042912, -1.153064, 0, 0.9647059, 1, 1,
-0.02072206, 0.542464, -0.3901185, 0, 0.9568627, 1, 1,
-0.02033384, 0.7256956, 2.332882, 0, 0.9529412, 1, 1,
-0.01746076, -1.327389, -3.140564, 0, 0.945098, 1, 1,
-0.01628788, 0.6067476, -3.097335, 0, 0.9411765, 1, 1,
-0.01183732, -1.094877, -3.551122, 0, 0.9333333, 1, 1,
-0.009350747, 0.361017, 0.3885339, 0, 0.9294118, 1, 1,
-0.006095385, -0.3299469, -5.766266, 0, 0.9215686, 1, 1,
-0.003893145, -0.2463787, -3.131201, 0, 0.9176471, 1, 1,
-0.003487997, -0.7970088, -1.690342, 0, 0.9098039, 1, 1,
0.0005119359, 0.01553403, 0.698343, 0, 0.9058824, 1, 1,
0.003868801, 1.15896, 0.9983376, 0, 0.8980392, 1, 1,
0.006830877, 0.5682648, -1.140858, 0, 0.8901961, 1, 1,
0.01000722, 0.7125101, 0.2418467, 0, 0.8862745, 1, 1,
0.01168814, -0.7054976, 3.835245, 0, 0.8784314, 1, 1,
0.01295372, 0.3732946, -0.2286342, 0, 0.8745098, 1, 1,
0.01419084, 0.6260283, -0.01765722, 0, 0.8666667, 1, 1,
0.02046508, -0.9556548, 2.386946, 0, 0.8627451, 1, 1,
0.03130239, 0.9422191, 0.7652683, 0, 0.854902, 1, 1,
0.03425239, -0.09463595, 3.070623, 0, 0.8509804, 1, 1,
0.03476667, -1.159621, 3.803509, 0, 0.8431373, 1, 1,
0.03549479, 0.6957015, -0.1120358, 0, 0.8392157, 1, 1,
0.03570273, -1.028801, 2.031033, 0, 0.8313726, 1, 1,
0.03758746, -1.133047, 3.488344, 0, 0.827451, 1, 1,
0.03935105, -0.3307138, 3.885915, 0, 0.8196079, 1, 1,
0.0404754, 0.1184196, -0.1975278, 0, 0.8156863, 1, 1,
0.04235975, 0.322557, 1.078195, 0, 0.8078431, 1, 1,
0.04237913, 0.3958649, -1.172839, 0, 0.8039216, 1, 1,
0.04956755, 1.585294, -1.551263, 0, 0.7960784, 1, 1,
0.05202685, 0.3770176, 0.6842816, 0, 0.7882353, 1, 1,
0.05533051, -0.2675321, 3.015458, 0, 0.7843137, 1, 1,
0.06054795, -1.510523, 3.258767, 0, 0.7764706, 1, 1,
0.0654572, 1.062938, 0.6706865, 0, 0.772549, 1, 1,
0.06716698, 0.7487697, -0.7998377, 0, 0.7647059, 1, 1,
0.06727068, -2.995971, 3.452219, 0, 0.7607843, 1, 1,
0.06963809, -1.085861, 4.452247, 0, 0.7529412, 1, 1,
0.07002126, -1.699201, 2.766147, 0, 0.7490196, 1, 1,
0.0700594, 2.973094, -1.067924, 0, 0.7411765, 1, 1,
0.07376938, -2.023018, 2.643621, 0, 0.7372549, 1, 1,
0.07385686, 0.06724364, 0.6455811, 0, 0.7294118, 1, 1,
0.08137081, 1.125694, 0.2776385, 0, 0.7254902, 1, 1,
0.08229008, 0.7501507, 2.481131, 0, 0.7176471, 1, 1,
0.08548828, 0.9891797, 1.501262, 0, 0.7137255, 1, 1,
0.08608615, -0.5689564, 1.839645, 0, 0.7058824, 1, 1,
0.09152855, 1.060515, 1.006221, 0, 0.6980392, 1, 1,
0.09389425, 0.9046571, 1.105044, 0, 0.6941177, 1, 1,
0.09398516, 0.3657468, -0.38602, 0, 0.6862745, 1, 1,
0.09758613, -0.714267, 5.121946, 0, 0.682353, 1, 1,
0.09970288, -1.954463, 4.018871, 0, 0.6745098, 1, 1,
0.1006349, 0.4634228, -0.4058995, 0, 0.6705883, 1, 1,
0.1050122, -0.6855357, 4.920103, 0, 0.6627451, 1, 1,
0.1098566, -0.7359008, 3.002218, 0, 0.6588235, 1, 1,
0.1110522, 0.210511, -0.4582199, 0, 0.6509804, 1, 1,
0.1135847, -1.788262, 3.313762, 0, 0.6470588, 1, 1,
0.1146993, -0.02697219, 0.9236801, 0, 0.6392157, 1, 1,
0.1158429, 0.4729038, 1.673302, 0, 0.6352941, 1, 1,
0.1216439, 0.2661399, 1.500695, 0, 0.627451, 1, 1,
0.1239576, -0.5445896, 4.663799, 0, 0.6235294, 1, 1,
0.1257546, 0.3859066, 0.5570338, 0, 0.6156863, 1, 1,
0.1269268, 0.420848, -1.091444, 0, 0.6117647, 1, 1,
0.1269773, 0.5995703, 0.9577071, 0, 0.6039216, 1, 1,
0.1274237, -0.5076759, 2.292056, 0, 0.5960785, 1, 1,
0.1347379, 0.6388676, 0.5590841, 0, 0.5921569, 1, 1,
0.1358999, -1.624698, 1.656688, 0, 0.5843138, 1, 1,
0.1380074, -0.8408195, 2.806774, 0, 0.5803922, 1, 1,
0.1388633, 0.9495252, 1.217205, 0, 0.572549, 1, 1,
0.1421529, -0.01497504, 3.496332, 0, 0.5686275, 1, 1,
0.1449258, -1.122545, 1.707396, 0, 0.5607843, 1, 1,
0.1530673, 0.3806508, 0.01526286, 0, 0.5568628, 1, 1,
0.1536828, -0.5847915, 2.474758, 0, 0.5490196, 1, 1,
0.1545359, -1.91029, 2.151947, 0, 0.5450981, 1, 1,
0.1566071, -1.302598, 3.284733, 0, 0.5372549, 1, 1,
0.1596622, -1.29033, 2.206516, 0, 0.5333334, 1, 1,
0.1603881, 1.287107, -0.4477158, 0, 0.5254902, 1, 1,
0.1630884, -0.4265361, 3.606952, 0, 0.5215687, 1, 1,
0.1699019, 1.068461, -1.150708, 0, 0.5137255, 1, 1,
0.1728168, 0.08645993, 0.01092544, 0, 0.509804, 1, 1,
0.1806295, -0.3856879, 3.120077, 0, 0.5019608, 1, 1,
0.1816443, -1.683155, 1.935289, 0, 0.4941176, 1, 1,
0.1822159, 1.655895, 0.5161573, 0, 0.4901961, 1, 1,
0.184193, -1.019524, 3.597592, 0, 0.4823529, 1, 1,
0.1851948, -1.066371, 2.762197, 0, 0.4784314, 1, 1,
0.1853105, -0.3390195, 3.882056, 0, 0.4705882, 1, 1,
0.1861431, 0.5539986, 0.4135005, 0, 0.4666667, 1, 1,
0.1903599, -0.5322418, 2.156949, 0, 0.4588235, 1, 1,
0.1916447, 0.9090635, 0.7991589, 0, 0.454902, 1, 1,
0.192419, -0.411118, 2.848967, 0, 0.4470588, 1, 1,
0.1946902, -0.8965304, 3.804912, 0, 0.4431373, 1, 1,
0.1958317, -0.5317956, 3.723259, 0, 0.4352941, 1, 1,
0.2042326, -1.062871, 3.242875, 0, 0.4313726, 1, 1,
0.2071083, -1.107596, 4.805212, 0, 0.4235294, 1, 1,
0.2105665, 0.5400087, -2.426288, 0, 0.4196078, 1, 1,
0.2107136, -1.48746, 4.328989, 0, 0.4117647, 1, 1,
0.2151596, -1.18387, 1.090514, 0, 0.4078431, 1, 1,
0.2167881, 0.3388767, 0.8529002, 0, 0.4, 1, 1,
0.2175829, -0.1688582, 1.966529, 0, 0.3921569, 1, 1,
0.2183212, -1.148488, 3.504515, 0, 0.3882353, 1, 1,
0.2252088, 0.788704, 2.203055, 0, 0.3803922, 1, 1,
0.2288963, 0.2996297, -0.03550823, 0, 0.3764706, 1, 1,
0.2346069, -0.2445027, 3.618872, 0, 0.3686275, 1, 1,
0.2373331, -0.8153937, 2.883496, 0, 0.3647059, 1, 1,
0.2375193, -1.551741, 1.81035, 0, 0.3568628, 1, 1,
0.2379176, 1.248598, -0.7282111, 0, 0.3529412, 1, 1,
0.2399977, 0.4712088, -0.04257107, 0, 0.345098, 1, 1,
0.243422, -0.5251719, 3.516987, 0, 0.3411765, 1, 1,
0.2444959, 1.290762, 1.200384, 0, 0.3333333, 1, 1,
0.2447063, -1.089459, 2.542284, 0, 0.3294118, 1, 1,
0.2516713, 0.4805804, 1.844979, 0, 0.3215686, 1, 1,
0.2575162, 0.05577667, 1.007684, 0, 0.3176471, 1, 1,
0.2582492, 0.401671, 0.8489879, 0, 0.3098039, 1, 1,
0.259311, -1.438186, 1.634027, 0, 0.3058824, 1, 1,
0.259874, 0.1163421, 1.189087, 0, 0.2980392, 1, 1,
0.2668675, -1.251872, 3.849834, 0, 0.2901961, 1, 1,
0.267695, 0.6865235, 0.5779155, 0, 0.2862745, 1, 1,
0.2725009, -0.5163651, 4.319025, 0, 0.2784314, 1, 1,
0.273713, -0.09679629, 0.08834438, 0, 0.2745098, 1, 1,
0.2792827, -0.4147901, 1.59776, 0, 0.2666667, 1, 1,
0.281997, 0.2106173, 1.922535, 0, 0.2627451, 1, 1,
0.2835286, -0.4010498, 3.892302, 0, 0.254902, 1, 1,
0.2836083, -0.5483665, 2.964645, 0, 0.2509804, 1, 1,
0.2846156, 0.4283481, -1.584339, 0, 0.2431373, 1, 1,
0.285145, 0.3877926, 1.613627, 0, 0.2392157, 1, 1,
0.286659, -1.290834, 4.756082, 0, 0.2313726, 1, 1,
0.2886867, 0.5192515, -0.852042, 0, 0.227451, 1, 1,
0.2908616, 0.8137928, -0.9847932, 0, 0.2196078, 1, 1,
0.292617, -0.8306836, 2.502236, 0, 0.2156863, 1, 1,
0.3017513, -2.305784, 3.321851, 0, 0.2078431, 1, 1,
0.3046116, -0.6375573, 2.609046, 0, 0.2039216, 1, 1,
0.3066898, 0.9144658, -0.9661638, 0, 0.1960784, 1, 1,
0.3105508, 1.748286, 0.8829259, 0, 0.1882353, 1, 1,
0.3128417, -2.985163, 3.617799, 0, 0.1843137, 1, 1,
0.3167328, 0.03158545, 2.542356, 0, 0.1764706, 1, 1,
0.3172603, -0.8377911, 1.311149, 0, 0.172549, 1, 1,
0.3193552, -1.985061, 2.385428, 0, 0.1647059, 1, 1,
0.3217687, -0.4697061, 1.948729, 0, 0.1607843, 1, 1,
0.3221086, 0.3141913, -0.2341755, 0, 0.1529412, 1, 1,
0.3261537, 0.1357857, 1.355024, 0, 0.1490196, 1, 1,
0.3361812, 0.07458572, -0.438153, 0, 0.1411765, 1, 1,
0.3378111, -1.085745, 1.337631, 0, 0.1372549, 1, 1,
0.3384967, -0.3121164, 4.86237, 0, 0.1294118, 1, 1,
0.3402082, -0.2846889, 1.04463, 0, 0.1254902, 1, 1,
0.3404032, -0.0212736, 2.583685, 0, 0.1176471, 1, 1,
0.3454804, -0.1816381, 2.841024, 0, 0.1137255, 1, 1,
0.347271, -1.753923, 3.878721, 0, 0.1058824, 1, 1,
0.3472843, -0.2779498, 1.178783, 0, 0.09803922, 1, 1,
0.3486809, -0.3915434, 1.379488, 0, 0.09411765, 1, 1,
0.3496084, 0.2474557, 0.4859834, 0, 0.08627451, 1, 1,
0.3512995, -2.132703, 2.940471, 0, 0.08235294, 1, 1,
0.3571851, -0.9686638, 3.46867, 0, 0.07450981, 1, 1,
0.3574483, -0.7523591, 2.748366, 0, 0.07058824, 1, 1,
0.360276, 1.432271, 1.549961, 0, 0.0627451, 1, 1,
0.3611008, -0.02896202, 2.483325, 0, 0.05882353, 1, 1,
0.3690532, 1.115587, 1.411849, 0, 0.05098039, 1, 1,
0.3714629, 1.471288, -1.19369, 0, 0.04705882, 1, 1,
0.3729988, -0.1562934, 1.433068, 0, 0.03921569, 1, 1,
0.3736086, 0.5985602, 0.8287077, 0, 0.03529412, 1, 1,
0.3748877, 0.4418277, 2.257493, 0, 0.02745098, 1, 1,
0.3830256, 0.04992797, 0.1862049, 0, 0.02352941, 1, 1,
0.3860479, 0.06397057, 2.250786, 0, 0.01568628, 1, 1,
0.3877944, 0.736352, 0.2303689, 0, 0.01176471, 1, 1,
0.3895686, -0.2711377, 0.9842154, 0, 0.003921569, 1, 1,
0.3903004, -0.3683142, 2.342982, 0.003921569, 0, 1, 1,
0.3954926, -0.4533286, 0.2233059, 0.007843138, 0, 1, 1,
0.3960994, -1.601527, 1.461923, 0.01568628, 0, 1, 1,
0.3986978, -1.046513, 2.261205, 0.01960784, 0, 1, 1,
0.4036759, -0.6201676, 1.69843, 0.02745098, 0, 1, 1,
0.405748, 0.7868569, 0.9883465, 0.03137255, 0, 1, 1,
0.4069034, 0.4941386, 0.4513797, 0.03921569, 0, 1, 1,
0.4111214, -0.6349081, 2.460078, 0.04313726, 0, 1, 1,
0.4150673, 0.7962345, -0.4752875, 0.05098039, 0, 1, 1,
0.417163, 1.886236, 0.9079243, 0.05490196, 0, 1, 1,
0.425201, 0.2782478, 0.6054369, 0.0627451, 0, 1, 1,
0.4271296, 0.3699639, 0.3540891, 0.06666667, 0, 1, 1,
0.4275099, 2.500391, 1.308675, 0.07450981, 0, 1, 1,
0.4280542, 1.012988, -0.7309479, 0.07843138, 0, 1, 1,
0.4342045, 0.6332412, -0.3415428, 0.08627451, 0, 1, 1,
0.4384233, 0.2474424, -0.3162496, 0.09019608, 0, 1, 1,
0.4421088, -1.144012, 3.163981, 0.09803922, 0, 1, 1,
0.4457758, 1.129322, -1.027836, 0.1058824, 0, 1, 1,
0.4467164, -0.1306792, 2.02653, 0.1098039, 0, 1, 1,
0.4475067, 1.163746, 0.5986887, 0.1176471, 0, 1, 1,
0.447875, 1.53664, 0.1935189, 0.1215686, 0, 1, 1,
0.4518366, -0.8830029, 1.263527, 0.1294118, 0, 1, 1,
0.4536174, 0.09636924, 1.779216, 0.1333333, 0, 1, 1,
0.4562879, -0.5489249, 1.929984, 0.1411765, 0, 1, 1,
0.4585893, 0.3134876, 0.4628885, 0.145098, 0, 1, 1,
0.4624815, -0.8790908, 1.877945, 0.1529412, 0, 1, 1,
0.4648465, 0.7930772, -0.3523189, 0.1568628, 0, 1, 1,
0.4683254, -0.9637548, 3.201272, 0.1647059, 0, 1, 1,
0.4717948, -0.04202836, 1.726388, 0.1686275, 0, 1, 1,
0.4739335, -0.1715169, 2.558136, 0.1764706, 0, 1, 1,
0.4765354, -0.7375067, 1.555438, 0.1803922, 0, 1, 1,
0.4798373, 1.326685, -0.2006786, 0.1882353, 0, 1, 1,
0.4811513, -1.490048, 2.534222, 0.1921569, 0, 1, 1,
0.4819285, 1.469265, 1.518699, 0.2, 0, 1, 1,
0.4822245, -2.046917, 3.078146, 0.2078431, 0, 1, 1,
0.4824686, -0.7311466, 2.550544, 0.2117647, 0, 1, 1,
0.4869494, -0.4029427, 2.409621, 0.2196078, 0, 1, 1,
0.4871679, -0.5086948, 3.099301, 0.2235294, 0, 1, 1,
0.488375, -1.005971, 2.296984, 0.2313726, 0, 1, 1,
0.4964101, 0.5090637, 1.772923, 0.2352941, 0, 1, 1,
0.4964621, -0.1667605, 2.184776, 0.2431373, 0, 1, 1,
0.4997245, -0.4195748, 1.752128, 0.2470588, 0, 1, 1,
0.5022586, 2.205954, 0.4335528, 0.254902, 0, 1, 1,
0.5047758, -0.575341, 3.885054, 0.2588235, 0, 1, 1,
0.5062703, 0.7483803, 1.092409, 0.2666667, 0, 1, 1,
0.5122879, 0.5793113, -0.4945695, 0.2705882, 0, 1, 1,
0.5123132, -1.894677, 2.161779, 0.2784314, 0, 1, 1,
0.5135766, -0.6348842, 2.396639, 0.282353, 0, 1, 1,
0.5157937, -0.9226999, 4.306233, 0.2901961, 0, 1, 1,
0.5204001, -0.504726, 3.050657, 0.2941177, 0, 1, 1,
0.5228382, 0.4152734, 0.4545809, 0.3019608, 0, 1, 1,
0.5230153, 1.711996, 1.840414, 0.3098039, 0, 1, 1,
0.524502, -1.066207, 4.179341, 0.3137255, 0, 1, 1,
0.5254759, -0.8361399, 2.612346, 0.3215686, 0, 1, 1,
0.5261273, -0.1756228, 0.9555597, 0.3254902, 0, 1, 1,
0.5382555, 1.069308, 1.801813, 0.3333333, 0, 1, 1,
0.5406943, 1.235251, -0.7252066, 0.3372549, 0, 1, 1,
0.5420499, 0.3381906, 1.218466, 0.345098, 0, 1, 1,
0.5424586, -2.090759, 3.262006, 0.3490196, 0, 1, 1,
0.5443552, -0.5890865, 2.025986, 0.3568628, 0, 1, 1,
0.5488624, 1.013432, 0.8293441, 0.3607843, 0, 1, 1,
0.5495045, 0.7273695, 0.8099291, 0.3686275, 0, 1, 1,
0.5498926, -0.5775079, 1.902586, 0.372549, 0, 1, 1,
0.5554085, -3.124158, 3.95979, 0.3803922, 0, 1, 1,
0.5579625, -0.4019443, 2.422787, 0.3843137, 0, 1, 1,
0.559867, -1.079212, 3.28109, 0.3921569, 0, 1, 1,
0.5624807, -1.357343, 2.214569, 0.3960784, 0, 1, 1,
0.5625824, 1.083522, 0.1532033, 0.4039216, 0, 1, 1,
0.562795, -0.5345368, 1.725914, 0.4117647, 0, 1, 1,
0.5674507, 0.5197894, 3.806731, 0.4156863, 0, 1, 1,
0.5684596, -0.1185464, 3.24165, 0.4235294, 0, 1, 1,
0.5687496, 0.2843243, 0.8141999, 0.427451, 0, 1, 1,
0.5698254, 0.1531821, 1.763779, 0.4352941, 0, 1, 1,
0.5795996, -1.863714, 2.857262, 0.4392157, 0, 1, 1,
0.5815466, 0.2241412, 1.419467, 0.4470588, 0, 1, 1,
0.5822231, -0.8999603, 2.121943, 0.4509804, 0, 1, 1,
0.5864225, 1.502393, 2.380284, 0.4588235, 0, 1, 1,
0.593142, -1.4976, 1.996589, 0.4627451, 0, 1, 1,
0.5941035, -0.8779969, 2.648766, 0.4705882, 0, 1, 1,
0.5979196, -1.620801, 1.258033, 0.4745098, 0, 1, 1,
0.5990515, -0.7519469, 0.8810316, 0.4823529, 0, 1, 1,
0.6035958, -0.1007206, 0.1712055, 0.4862745, 0, 1, 1,
0.6038013, -2.039102, 2.291112, 0.4941176, 0, 1, 1,
0.6046717, -1.15584, 2.942707, 0.5019608, 0, 1, 1,
0.6100876, -0.4821139, 4.110759, 0.5058824, 0, 1, 1,
0.6177879, -0.504653, 2.258598, 0.5137255, 0, 1, 1,
0.6217874, -0.07328276, 3.720847, 0.5176471, 0, 1, 1,
0.6227754, 0.3736156, 1.486405, 0.5254902, 0, 1, 1,
0.6245072, 1.196514, 0.7401255, 0.5294118, 0, 1, 1,
0.6247867, -0.7547363, 2.804136, 0.5372549, 0, 1, 1,
0.6273131, 0.09679106, 0.7654355, 0.5411765, 0, 1, 1,
0.637222, -0.2588176, 0.4937481, 0.5490196, 0, 1, 1,
0.6382471, -0.8312427, 0.4315278, 0.5529412, 0, 1, 1,
0.6407635, 1.046112, -0.1986327, 0.5607843, 0, 1, 1,
0.6414171, -0.4199188, 0.967405, 0.5647059, 0, 1, 1,
0.6461108, -1.236772, 2.357919, 0.572549, 0, 1, 1,
0.6463704, -0.7998075, 3.857069, 0.5764706, 0, 1, 1,
0.6464523, -0.006166337, 2.421519, 0.5843138, 0, 1, 1,
0.6490698, 0.5164457, 0.1799514, 0.5882353, 0, 1, 1,
0.6517459, 0.7266495, 0.9694263, 0.5960785, 0, 1, 1,
0.6520512, -0.5421446, 0.08267299, 0.6039216, 0, 1, 1,
0.6537024, -1.11191, 1.99639, 0.6078432, 0, 1, 1,
0.6545681, 1.123621, 0.6923815, 0.6156863, 0, 1, 1,
0.6546856, -1.254258, 4.415968, 0.6196079, 0, 1, 1,
0.6556038, -2.902598, 2.936098, 0.627451, 0, 1, 1,
0.6570882, 0.9987598, -0.680745, 0.6313726, 0, 1, 1,
0.6579897, 0.3279952, 0.9790885, 0.6392157, 0, 1, 1,
0.6611428, -0.7494601, 2.129359, 0.6431373, 0, 1, 1,
0.6634094, -1.023902, 2.883457, 0.6509804, 0, 1, 1,
0.6642786, -1.488112, 2.370933, 0.654902, 0, 1, 1,
0.6773949, 0.1081827, 1.462289, 0.6627451, 0, 1, 1,
0.6785151, -0.4956234, 1.449334, 0.6666667, 0, 1, 1,
0.6792681, 0.2988536, 1.859651, 0.6745098, 0, 1, 1,
0.6802942, 1.670744, 0.5218846, 0.6784314, 0, 1, 1,
0.6807609, -0.3670908, 0.8151492, 0.6862745, 0, 1, 1,
0.6811496, -1.332531, 2.765511, 0.6901961, 0, 1, 1,
0.6826454, -0.8855313, 2.998201, 0.6980392, 0, 1, 1,
0.6897407, -1.555938, 1.49292, 0.7058824, 0, 1, 1,
0.6962098, 0.6086267, 1.651969, 0.7098039, 0, 1, 1,
0.6979595, 0.04519337, -0.1235251, 0.7176471, 0, 1, 1,
0.7060362, 0.1074804, 2.188133, 0.7215686, 0, 1, 1,
0.7143891, -0.4181004, 2.37814, 0.7294118, 0, 1, 1,
0.7192866, 0.1084275, -0.06198207, 0.7333333, 0, 1, 1,
0.7205011, -0.2699376, 2.271121, 0.7411765, 0, 1, 1,
0.725721, 1.112864, 0.1465618, 0.7450981, 0, 1, 1,
0.7265624, 1.977135, 0.2868648, 0.7529412, 0, 1, 1,
0.7301347, -1.137977, 2.57809, 0.7568628, 0, 1, 1,
0.7312365, 1.796891, 0.462034, 0.7647059, 0, 1, 1,
0.7444659, -2.250792, 1.87144, 0.7686275, 0, 1, 1,
0.744927, 0.4135464, 0.5195092, 0.7764706, 0, 1, 1,
0.7518211, 0.7029737, 1.394346, 0.7803922, 0, 1, 1,
0.7645217, -0.1561046, 1.652328, 0.7882353, 0, 1, 1,
0.7647998, 1.516172, 1.5987, 0.7921569, 0, 1, 1,
0.7676303, -1.453013, 2.661941, 0.8, 0, 1, 1,
0.7716672, 0.733604, 0.2932753, 0.8078431, 0, 1, 1,
0.7753175, 0.6484372, 1.370005, 0.8117647, 0, 1, 1,
0.785768, -1.102831, 2.011812, 0.8196079, 0, 1, 1,
0.7859899, -1.53239, 1.158686, 0.8235294, 0, 1, 1,
0.7869922, 1.244522, 1.541065, 0.8313726, 0, 1, 1,
0.7938724, 1.100338, 0.2570287, 0.8352941, 0, 1, 1,
0.7951109, -0.9278054, 1.423881, 0.8431373, 0, 1, 1,
0.7956794, 0.3237783, 3.406246, 0.8470588, 0, 1, 1,
0.8030719, 0.1549086, 0.4893535, 0.854902, 0, 1, 1,
0.8043511, 0.9754179, 0.4165052, 0.8588235, 0, 1, 1,
0.8059659, 0.4918947, 2.915745, 0.8666667, 0, 1, 1,
0.8102377, -1.172556, 3.01997, 0.8705882, 0, 1, 1,
0.8160883, 0.3265146, 1.254526, 0.8784314, 0, 1, 1,
0.8256735, 0.6177085, 1.221917, 0.8823529, 0, 1, 1,
0.8267121, -2.14607, 3.110089, 0.8901961, 0, 1, 1,
0.8345619, -0.97355, 2.664424, 0.8941177, 0, 1, 1,
0.8386282, 0.8897348, 1.039753, 0.9019608, 0, 1, 1,
0.848002, 0.2043509, 3.247302, 0.9098039, 0, 1, 1,
0.8480591, 1.250588, -0.06763236, 0.9137255, 0, 1, 1,
0.849341, -0.6856202, 2.294286, 0.9215686, 0, 1, 1,
0.8527539, -0.4972127, 4.432317, 0.9254902, 0, 1, 1,
0.8555024, 0.2765022, 0.6460041, 0.9333333, 0, 1, 1,
0.8556052, -1.503391, 1.89888, 0.9372549, 0, 1, 1,
0.8594363, -1.170696, 1.967694, 0.945098, 0, 1, 1,
0.8619809, 1.172012, -0.8927584, 0.9490196, 0, 1, 1,
0.8717632, 0.5256788, 0.6906654, 0.9568627, 0, 1, 1,
0.8747097, 1.011195, 0.6584879, 0.9607843, 0, 1, 1,
0.8808281, 0.8072935, 1.048451, 0.9686275, 0, 1, 1,
0.8939223, 1.857875, 0.1809722, 0.972549, 0, 1, 1,
0.8955552, -0.4039082, 3.342546, 0.9803922, 0, 1, 1,
0.9029959, 0.7972178, 2.94589, 0.9843137, 0, 1, 1,
0.9103287, -0.5280737, 2.997112, 0.9921569, 0, 1, 1,
0.9130093, 0.3389279, 2.055475, 0.9960784, 0, 1, 1,
0.9134679, 2.420968, -0.4261738, 1, 0, 0.9960784, 1,
0.9157214, -1.629472, 2.095242, 1, 0, 0.9882353, 1,
0.932494, -2.086444, 1.833148, 1, 0, 0.9843137, 1,
0.9353908, 0.08278343, 1.054467, 1, 0, 0.9764706, 1,
0.9356479, -0.4640909, 3.179275, 1, 0, 0.972549, 1,
0.9358683, 0.3943697, 1.415747, 1, 0, 0.9647059, 1,
0.9359634, 0.759567, 0.6550556, 1, 0, 0.9607843, 1,
0.9428088, 0.260058, 0.8366647, 1, 0, 0.9529412, 1,
0.9440556, -0.7086924, 1.9155, 1, 0, 0.9490196, 1,
0.9559456, 0.001092979, 2.658626, 1, 0, 0.9411765, 1,
0.9580172, -1.948419, 2.892701, 1, 0, 0.9372549, 1,
0.9582026, 0.377805, 2.699528, 1, 0, 0.9294118, 1,
0.9628382, -0.461859, 2.870086, 1, 0, 0.9254902, 1,
0.9632424, -0.7097119, 0.3703926, 1, 0, 0.9176471, 1,
0.9635959, -0.365781, 0.8180775, 1, 0, 0.9137255, 1,
0.9639719, 0.9453465, 0.9993535, 1, 0, 0.9058824, 1,
0.9649113, 1.264895, 1.725996, 1, 0, 0.9019608, 1,
0.9692616, -0.09565026, 1.32726, 1, 0, 0.8941177, 1,
0.9700955, 0.2274525, 2.818578, 1, 0, 0.8862745, 1,
0.9757065, -0.8204284, 1.768828, 1, 0, 0.8823529, 1,
0.976748, -0.06988598, 2.457243, 1, 0, 0.8745098, 1,
0.9796489, 0.9747571, 0.9432047, 1, 0, 0.8705882, 1,
0.9824495, -0.9945897, 1.355009, 1, 0, 0.8627451, 1,
0.9864179, -2.646113, 4.574555, 1, 0, 0.8588235, 1,
0.9866365, -1.85427, 3.798846, 1, 0, 0.8509804, 1,
0.998758, -1.001104, 1.014884, 1, 0, 0.8470588, 1,
1.00007, 0.3759146, 1.503024, 1, 0, 0.8392157, 1,
1.000781, -0.2668824, 2.051618, 1, 0, 0.8352941, 1,
1.002788, 0.8287182, 0.3083246, 1, 0, 0.827451, 1,
1.006582, 0.3994377, 1.152907, 1, 0, 0.8235294, 1,
1.007879, 1.408951, 0.9039997, 1, 0, 0.8156863, 1,
1.020271, -0.43187, 3.868688, 1, 0, 0.8117647, 1,
1.023881, 0.4180265, 1.03768, 1, 0, 0.8039216, 1,
1.026426, 0.6522128, 0.4265691, 1, 0, 0.7960784, 1,
1.031062, -1.105137, 3.083699, 1, 0, 0.7921569, 1,
1.032937, 0.7374056, 0.2123209, 1, 0, 0.7843137, 1,
1.046416, 0.9139645, 1.805312, 1, 0, 0.7803922, 1,
1.04873, -1.143477, 1.874973, 1, 0, 0.772549, 1,
1.053735, -1.34628, 1.324855, 1, 0, 0.7686275, 1,
1.054072, 0.2238819, 2.866518, 1, 0, 0.7607843, 1,
1.057763, 1.025875, 0.928892, 1, 0, 0.7568628, 1,
1.058192, -1.505327, 1.835903, 1, 0, 0.7490196, 1,
1.059822, -0.5999646, 3.533629, 1, 0, 0.7450981, 1,
1.060741, 0.5554627, 3.030278, 1, 0, 0.7372549, 1,
1.063043, 0.007589346, 0.316244, 1, 0, 0.7333333, 1,
1.079574, -1.177541, 1.906802, 1, 0, 0.7254902, 1,
1.08456, -0.4723338, 1.307591, 1, 0, 0.7215686, 1,
1.099098, -1.515829, 2.334391, 1, 0, 0.7137255, 1,
1.102834, 0.1821041, 1.240627, 1, 0, 0.7098039, 1,
1.106983, -0.128142, 2.387832, 1, 0, 0.7019608, 1,
1.110709, 0.5241451, 0.9408792, 1, 0, 0.6941177, 1,
1.118639, -0.8804151, 3.095829, 1, 0, 0.6901961, 1,
1.128609, -1.641976, -0.03156484, 1, 0, 0.682353, 1,
1.130518, -3.025403, 1.604021, 1, 0, 0.6784314, 1,
1.1346, -0.3037692, 2.187859, 1, 0, 0.6705883, 1,
1.143202, -1.035614, 3.377322, 1, 0, 0.6666667, 1,
1.154435, 0.8838535, 0.442855, 1, 0, 0.6588235, 1,
1.168695, 1.131985, 0.7422965, 1, 0, 0.654902, 1,
1.17589, -1.024253, 1.715919, 1, 0, 0.6470588, 1,
1.176309, -0.2551993, 2.515079, 1, 0, 0.6431373, 1,
1.176956, 0.3185733, 1.944631, 1, 0, 0.6352941, 1,
1.177998, 0.2132213, 1.236268, 1, 0, 0.6313726, 1,
1.188904, -0.429807, 1.565755, 1, 0, 0.6235294, 1,
1.191321, 1.647938, 1.36351, 1, 0, 0.6196079, 1,
1.194302, -0.7872732, 2.47491, 1, 0, 0.6117647, 1,
1.208387, 0.0883555, 0.511395, 1, 0, 0.6078432, 1,
1.214885, -0.6828615, 1.77938, 1, 0, 0.6, 1,
1.217604, 0.2272, 0.1044703, 1, 0, 0.5921569, 1,
1.224906, -1.074429, 1.841046, 1, 0, 0.5882353, 1,
1.228768, 0.3657648, 1.085478, 1, 0, 0.5803922, 1,
1.230126, -1.725667, 2.599976, 1, 0, 0.5764706, 1,
1.240373, -1.977887, 3.280758, 1, 0, 0.5686275, 1,
1.244708, -0.9060183, 2.129327, 1, 0, 0.5647059, 1,
1.252747, -0.1767009, 3.116924, 1, 0, 0.5568628, 1,
1.262026, 0.2275696, 0.5472694, 1, 0, 0.5529412, 1,
1.263432, -0.809546, 2.564166, 1, 0, 0.5450981, 1,
1.267987, 0.7044562, 1.018454, 1, 0, 0.5411765, 1,
1.26908, -1.370729, 2.1928, 1, 0, 0.5333334, 1,
1.274639, -1.077245, 2.610154, 1, 0, 0.5294118, 1,
1.28234, -0.2082322, 1.993966, 1, 0, 0.5215687, 1,
1.287989, 0.7829233, 0.9345259, 1, 0, 0.5176471, 1,
1.299961, 1.673031, -0.05721026, 1, 0, 0.509804, 1,
1.300298, 0.9969033, -1.777948, 1, 0, 0.5058824, 1,
1.300793, 0.7652095, 0.9479758, 1, 0, 0.4980392, 1,
1.30233, -1.312529, 2.853781, 1, 0, 0.4901961, 1,
1.309518, -0.5078455, 2.220018, 1, 0, 0.4862745, 1,
1.323019, -0.1789674, -0.7235856, 1, 0, 0.4784314, 1,
1.327994, -0.3379953, 1.301175, 1, 0, 0.4745098, 1,
1.333457, -1.17523, 1.962379, 1, 0, 0.4666667, 1,
1.338404, -0.8707833, 3.251818, 1, 0, 0.4627451, 1,
1.342175, -0.4147018, 1.052179, 1, 0, 0.454902, 1,
1.356771, 0.9126326, 1.675282, 1, 0, 0.4509804, 1,
1.359856, -0.1900416, 2.941393, 1, 0, 0.4431373, 1,
1.36875, -0.3942352, 1.658532, 1, 0, 0.4392157, 1,
1.374856, -1.606085, 1.80615, 1, 0, 0.4313726, 1,
1.377121, 0.6577428, -0.1006419, 1, 0, 0.427451, 1,
1.378418, 2.256601, -0.3891766, 1, 0, 0.4196078, 1,
1.3854, 0.5794162, 4.375516, 1, 0, 0.4156863, 1,
1.395501, 0.5820032, 0.6156644, 1, 0, 0.4078431, 1,
1.399252, -0.9024339, -0.1674191, 1, 0, 0.4039216, 1,
1.40507, 0.4421418, 0.6895636, 1, 0, 0.3960784, 1,
1.40676, 0.2808063, 1.439029, 1, 0, 0.3882353, 1,
1.420133, -1.63093, 2.532829, 1, 0, 0.3843137, 1,
1.440307, 0.5056662, 2.727196, 1, 0, 0.3764706, 1,
1.442606, -1.120745, 1.557264, 1, 0, 0.372549, 1,
1.447377, -0.1253014, 1.48006, 1, 0, 0.3647059, 1,
1.456968, 2.021106, -0.2710064, 1, 0, 0.3607843, 1,
1.464409, 0.5703018, 1.624139, 1, 0, 0.3529412, 1,
1.477163, -1.183128, 1.543771, 1, 0, 0.3490196, 1,
1.480518, 1.914564, 0.8816544, 1, 0, 0.3411765, 1,
1.482303, -0.5217589, 1.304375, 1, 0, 0.3372549, 1,
1.486569, 0.7724302, 0.9293432, 1, 0, 0.3294118, 1,
1.493134, -0.1203453, 3.180769, 1, 0, 0.3254902, 1,
1.497605, -1.405266, 3.885031, 1, 0, 0.3176471, 1,
1.500669, 1.051036, 0.8385761, 1, 0, 0.3137255, 1,
1.501986, -0.2809108, 2.357572, 1, 0, 0.3058824, 1,
1.50739, 0.2871094, 0.7025481, 1, 0, 0.2980392, 1,
1.514402, -0.7897971, 2.03922, 1, 0, 0.2941177, 1,
1.520266, 0.7600212, 1.762727, 1, 0, 0.2862745, 1,
1.520488, -0.8209826, 2.666931, 1, 0, 0.282353, 1,
1.536062, 1.22431, 0.0008712587, 1, 0, 0.2745098, 1,
1.541751, -0.01269429, 1.456319, 1, 0, 0.2705882, 1,
1.550109, -0.527496, 2.446729, 1, 0, 0.2627451, 1,
1.552832, -0.2956419, 1.074304, 1, 0, 0.2588235, 1,
1.555499, -0.4554679, 1.789868, 1, 0, 0.2509804, 1,
1.562323, 0.1024235, 1.765744, 1, 0, 0.2470588, 1,
1.56689, -0.6560798, 0.5521107, 1, 0, 0.2392157, 1,
1.594661, 0.6312188, 2.465945, 1, 0, 0.2352941, 1,
1.606164, 0.1883091, 0.9752387, 1, 0, 0.227451, 1,
1.621454, 0.3188502, 1.472703, 1, 0, 0.2235294, 1,
1.623656, 0.6867173, 0.6755634, 1, 0, 0.2156863, 1,
1.625526, -1.501624, 2.190595, 1, 0, 0.2117647, 1,
1.682815, 1.58236, 0.9390265, 1, 0, 0.2039216, 1,
1.682869, -0.1844199, 2.468605, 1, 0, 0.1960784, 1,
1.690298, 0.2560344, 1.673111, 1, 0, 0.1921569, 1,
1.709378, 0.7222565, 2.442956, 1, 0, 0.1843137, 1,
1.722797, 0.7705479, -0.4625757, 1, 0, 0.1803922, 1,
1.723953, 2.185334, -0.512976, 1, 0, 0.172549, 1,
1.761847, -1.511589, 3.263739, 1, 0, 0.1686275, 1,
1.780989, -0.2475954, 1.5135, 1, 0, 0.1607843, 1,
1.794153, 0.4540335, 1.296677, 1, 0, 0.1568628, 1,
1.835788, -0.08330432, 3.017921, 1, 0, 0.1490196, 1,
1.838235, 0.7439249, 3.238992, 1, 0, 0.145098, 1,
1.847784, -0.5478195, 4.031025, 1, 0, 0.1372549, 1,
1.878305, -0.2680748, 1.103757, 1, 0, 0.1333333, 1,
1.971437, -0.4285648, 1.418909, 1, 0, 0.1254902, 1,
1.981833, 0.05313415, 0.8805073, 1, 0, 0.1215686, 1,
2.007093, 0.1922375, 1.588865, 1, 0, 0.1137255, 1,
2.022105, 0.2496545, 1.758018, 1, 0, 0.1098039, 1,
2.026201, 0.2628872, 1.36911, 1, 0, 0.1019608, 1,
2.060263, -0.6526147, 3.198133, 1, 0, 0.09411765, 1,
2.098069, 1.749506, 0.8996049, 1, 0, 0.09019608, 1,
2.100993, 0.6387409, 0.8046631, 1, 0, 0.08235294, 1,
2.237224, -0.5804292, -0.02060455, 1, 0, 0.07843138, 1,
2.311142, -0.5258213, 1.956973, 1, 0, 0.07058824, 1,
2.326847, -0.146119, 2.180536, 1, 0, 0.06666667, 1,
2.387525, 0.2102869, 1.529153, 1, 0, 0.05882353, 1,
2.422374, -0.2570401, 2.002102, 1, 0, 0.05490196, 1,
2.429347, 2.245406, 1.179293, 1, 0, 0.04705882, 1,
2.494539, -1.115422, 2.078772, 1, 0, 0.04313726, 1,
2.523076, -0.03538743, 1.105251, 1, 0, 0.03529412, 1,
2.727574, -0.02627127, 3.075384, 1, 0, 0.03137255, 1,
2.742948, -0.1261066, 1.884828, 1, 0, 0.02352941, 1,
2.75771, 0.9799467, 2.242858, 1, 0, 0.01960784, 1,
2.863595, -0.031437, 0.8403686, 1, 0, 0.01176471, 1,
3.252573, -0.7107422, 1.796797, 1, 0, 0.007843138, 1
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
0.2368749, -4.238724, -7.70211, 0, -0.5, 0.5, 0.5,
0.2368749, -4.238724, -7.70211, 1, -0.5, 0.5, 0.5,
0.2368749, -4.238724, -7.70211, 1, 1.5, 0.5, 0.5,
0.2368749, -4.238724, -7.70211, 0, 1.5, 0.5, 0.5
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
-3.801145, 0.163649, -7.70211, 0, -0.5, 0.5, 0.5,
-3.801145, 0.163649, -7.70211, 1, -0.5, 0.5, 0.5,
-3.801145, 0.163649, -7.70211, 1, 1.5, 0.5, 0.5,
-3.801145, 0.163649, -7.70211, 0, 1.5, 0.5, 0.5
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
-3.801145, -4.238724, -0.3607626, 0, -0.5, 0.5, 0.5,
-3.801145, -4.238724, -0.3607626, 1, -0.5, 0.5, 0.5,
-3.801145, -4.238724, -0.3607626, 1, 1.5, 0.5, 0.5,
-3.801145, -4.238724, -0.3607626, 0, 1.5, 0.5, 0.5
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
-2, -3.222792, -6.007953,
3, -3.222792, -6.007953,
-2, -3.222792, -6.007953,
-2, -3.392114, -6.290312,
-1, -3.222792, -6.007953,
-1, -3.392114, -6.290312,
0, -3.222792, -6.007953,
0, -3.392114, -6.290312,
1, -3.222792, -6.007953,
1, -3.392114, -6.290312,
2, -3.222792, -6.007953,
2, -3.392114, -6.290312,
3, -3.222792, -6.007953,
3, -3.392114, -6.290312
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
-2, -3.730758, -6.855031, 0, -0.5, 0.5, 0.5,
-2, -3.730758, -6.855031, 1, -0.5, 0.5, 0.5,
-2, -3.730758, -6.855031, 1, 1.5, 0.5, 0.5,
-2, -3.730758, -6.855031, 0, 1.5, 0.5, 0.5,
-1, -3.730758, -6.855031, 0, -0.5, 0.5, 0.5,
-1, -3.730758, -6.855031, 1, -0.5, 0.5, 0.5,
-1, -3.730758, -6.855031, 1, 1.5, 0.5, 0.5,
-1, -3.730758, -6.855031, 0, 1.5, 0.5, 0.5,
0, -3.730758, -6.855031, 0, -0.5, 0.5, 0.5,
0, -3.730758, -6.855031, 1, -0.5, 0.5, 0.5,
0, -3.730758, -6.855031, 1, 1.5, 0.5, 0.5,
0, -3.730758, -6.855031, 0, 1.5, 0.5, 0.5,
1, -3.730758, -6.855031, 0, -0.5, 0.5, 0.5,
1, -3.730758, -6.855031, 1, -0.5, 0.5, 0.5,
1, -3.730758, -6.855031, 1, 1.5, 0.5, 0.5,
1, -3.730758, -6.855031, 0, 1.5, 0.5, 0.5,
2, -3.730758, -6.855031, 0, -0.5, 0.5, 0.5,
2, -3.730758, -6.855031, 1, -0.5, 0.5, 0.5,
2, -3.730758, -6.855031, 1, 1.5, 0.5, 0.5,
2, -3.730758, -6.855031, 0, 1.5, 0.5, 0.5,
3, -3.730758, -6.855031, 0, -0.5, 0.5, 0.5,
3, -3.730758, -6.855031, 1, -0.5, 0.5, 0.5,
3, -3.730758, -6.855031, 1, 1.5, 0.5, 0.5,
3, -3.730758, -6.855031, 0, 1.5, 0.5, 0.5
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
-2.869295, -3, -6.007953,
-2.869295, 3, -6.007953,
-2.869295, -3, -6.007953,
-3.024603, -3, -6.290312,
-2.869295, -2, -6.007953,
-3.024603, -2, -6.290312,
-2.869295, -1, -6.007953,
-3.024603, -1, -6.290312,
-2.869295, 0, -6.007953,
-3.024603, 0, -6.290312,
-2.869295, 1, -6.007953,
-3.024603, 1, -6.290312,
-2.869295, 2, -6.007953,
-3.024603, 2, -6.290312,
-2.869295, 3, -6.007953,
-3.024603, 3, -6.290312
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
-3.33522, -3, -6.855031, 0, -0.5, 0.5, 0.5,
-3.33522, -3, -6.855031, 1, -0.5, 0.5, 0.5,
-3.33522, -3, -6.855031, 1, 1.5, 0.5, 0.5,
-3.33522, -3, -6.855031, 0, 1.5, 0.5, 0.5,
-3.33522, -2, -6.855031, 0, -0.5, 0.5, 0.5,
-3.33522, -2, -6.855031, 1, -0.5, 0.5, 0.5,
-3.33522, -2, -6.855031, 1, 1.5, 0.5, 0.5,
-3.33522, -2, -6.855031, 0, 1.5, 0.5, 0.5,
-3.33522, -1, -6.855031, 0, -0.5, 0.5, 0.5,
-3.33522, -1, -6.855031, 1, -0.5, 0.5, 0.5,
-3.33522, -1, -6.855031, 1, 1.5, 0.5, 0.5,
-3.33522, -1, -6.855031, 0, 1.5, 0.5, 0.5,
-3.33522, 0, -6.855031, 0, -0.5, 0.5, 0.5,
-3.33522, 0, -6.855031, 1, -0.5, 0.5, 0.5,
-3.33522, 0, -6.855031, 1, 1.5, 0.5, 0.5,
-3.33522, 0, -6.855031, 0, 1.5, 0.5, 0.5,
-3.33522, 1, -6.855031, 0, -0.5, 0.5, 0.5,
-3.33522, 1, -6.855031, 1, -0.5, 0.5, 0.5,
-3.33522, 1, -6.855031, 1, 1.5, 0.5, 0.5,
-3.33522, 1, -6.855031, 0, 1.5, 0.5, 0.5,
-3.33522, 2, -6.855031, 0, -0.5, 0.5, 0.5,
-3.33522, 2, -6.855031, 1, -0.5, 0.5, 0.5,
-3.33522, 2, -6.855031, 1, 1.5, 0.5, 0.5,
-3.33522, 2, -6.855031, 0, 1.5, 0.5, 0.5,
-3.33522, 3, -6.855031, 0, -0.5, 0.5, 0.5,
-3.33522, 3, -6.855031, 1, -0.5, 0.5, 0.5,
-3.33522, 3, -6.855031, 1, 1.5, 0.5, 0.5,
-3.33522, 3, -6.855031, 0, 1.5, 0.5, 0.5
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
-2.869295, -3.222792, -4,
-2.869295, -3.222792, 4,
-2.869295, -3.222792, -4,
-3.024603, -3.392114, -4,
-2.869295, -3.222792, -2,
-3.024603, -3.392114, -2,
-2.869295, -3.222792, 0,
-3.024603, -3.392114, 0,
-2.869295, -3.222792, 2,
-3.024603, -3.392114, 2,
-2.869295, -3.222792, 4,
-3.024603, -3.392114, 4
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
-3.33522, -3.730758, -4, 0, -0.5, 0.5, 0.5,
-3.33522, -3.730758, -4, 1, -0.5, 0.5, 0.5,
-3.33522, -3.730758, -4, 1, 1.5, 0.5, 0.5,
-3.33522, -3.730758, -4, 0, 1.5, 0.5, 0.5,
-3.33522, -3.730758, -2, 0, -0.5, 0.5, 0.5,
-3.33522, -3.730758, -2, 1, -0.5, 0.5, 0.5,
-3.33522, -3.730758, -2, 1, 1.5, 0.5, 0.5,
-3.33522, -3.730758, -2, 0, 1.5, 0.5, 0.5,
-3.33522, -3.730758, 0, 0, -0.5, 0.5, 0.5,
-3.33522, -3.730758, 0, 1, -0.5, 0.5, 0.5,
-3.33522, -3.730758, 0, 1, 1.5, 0.5, 0.5,
-3.33522, -3.730758, 0, 0, 1.5, 0.5, 0.5,
-3.33522, -3.730758, 2, 0, -0.5, 0.5, 0.5,
-3.33522, -3.730758, 2, 1, -0.5, 0.5, 0.5,
-3.33522, -3.730758, 2, 1, 1.5, 0.5, 0.5,
-3.33522, -3.730758, 2, 0, 1.5, 0.5, 0.5,
-3.33522, -3.730758, 4, 0, -0.5, 0.5, 0.5,
-3.33522, -3.730758, 4, 1, -0.5, 0.5, 0.5,
-3.33522, -3.730758, 4, 1, 1.5, 0.5, 0.5,
-3.33522, -3.730758, 4, 0, 1.5, 0.5, 0.5
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
-2.869295, -3.222792, -6.007953,
-2.869295, 3.55009, -6.007953,
-2.869295, -3.222792, 5.286427,
-2.869295, 3.55009, 5.286427,
-2.869295, -3.222792, -6.007953,
-2.869295, -3.222792, 5.286427,
-2.869295, 3.55009, -6.007953,
-2.869295, 3.55009, 5.286427,
-2.869295, -3.222792, -6.007953,
3.343045, -3.222792, -6.007953,
-2.869295, -3.222792, 5.286427,
3.343045, -3.222792, 5.286427,
-2.869295, 3.55009, -6.007953,
3.343045, 3.55009, -6.007953,
-2.869295, 3.55009, 5.286427,
3.343045, 3.55009, 5.286427,
3.343045, -3.222792, -6.007953,
3.343045, 3.55009, -6.007953,
3.343045, -3.222792, 5.286427,
3.343045, 3.55009, 5.286427,
3.343045, -3.222792, -6.007953,
3.343045, -3.222792, 5.286427,
3.343045, 3.55009, -6.007953,
3.343045, 3.55009, 5.286427
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
var radius = 7.77539;
var distance = 34.59359;
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
mvMatrix.translate( -0.2368749, -0.163649, 0.3607626 );
mvMatrix.scale( 1.353259, 1.24126, 0.744344 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.59359);
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
Butyric_Acid<-read.table("Butyric_Acid.xyz", skip=1)
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
-2.778824, -0.8320258, -1.901657, 0, 0, 1, 1, 1,
-2.777371, 0.6942614, -2.478818, 1, 0, 0, 1, 1,
-2.733567, -2.275267, -1.978169, 1, 0, 0, 1, 1,
-2.579021, -1.136353, -1.718534, 1, 0, 0, 1, 1,
-2.544883, -0.8986325, -2.273348, 1, 0, 0, 1, 1,
-2.472868, -1.89844, -1.27609, 1, 0, 0, 1, 1,
-2.468974, 0.3482406, -2.120286, 0, 0, 0, 1, 1,
-2.456338, 0.2469877, -0.9627338, 0, 0, 0, 1, 1,
-2.45331, 1.196417, -1.70148, 0, 0, 0, 1, 1,
-2.355452, 0.4730395, -0.2919767, 0, 0, 0, 1, 1,
-2.299202, -1.978106, -2.033281, 0, 0, 0, 1, 1,
-2.18165, 1.32948, -1.624517, 0, 0, 0, 1, 1,
-2.159021, 0.9294215, -1.686353, 0, 0, 0, 1, 1,
-2.158642, 0.500447, -1.448701, 1, 1, 1, 1, 1,
-2.144776, 1.34384, -0.2850454, 1, 1, 1, 1, 1,
-2.102264, 1.704615, -2.159229, 1, 1, 1, 1, 1,
-2.067174, -0.08128887, -1.712749, 1, 1, 1, 1, 1,
-2.06609, 0.8561284, -2.332572, 1, 1, 1, 1, 1,
-2.061503, -1.224493, -0.6631635, 1, 1, 1, 1, 1,
-2.054745, -0.4894994, -2.637895, 1, 1, 1, 1, 1,
-2.037809, 0.01110097, -3.005796, 1, 1, 1, 1, 1,
-2.027197, 0.4631501, -2.069963, 1, 1, 1, 1, 1,
-2.026823, 1.762905, -0.7068744, 1, 1, 1, 1, 1,
-2.026699, 1.099398, -2.015814, 1, 1, 1, 1, 1,
-2.016658, 1.380076, -1.708377, 1, 1, 1, 1, 1,
-1.993426, -1.231976, -3.32961, 1, 1, 1, 1, 1,
-1.992501, -0.93394, -0.8145508, 1, 1, 1, 1, 1,
-1.965521, 2.804235, -0.1479484, 1, 1, 1, 1, 1,
-1.953732, 0.4556233, -2.136699, 0, 0, 1, 1, 1,
-1.943903, 1.222589, -0.3694805, 1, 0, 0, 1, 1,
-1.934023, -0.8299931, -0.09772899, 1, 0, 0, 1, 1,
-1.913376, -0.5976664, -3.421672, 1, 0, 0, 1, 1,
-1.899133, 0.4366841, -0.7576109, 1, 0, 0, 1, 1,
-1.895174, -1.363793, -3.357688, 1, 0, 0, 1, 1,
-1.894867, 3.451456, -0.4652306, 0, 0, 0, 1, 1,
-1.877013, -0.8310755, -0.6437876, 0, 0, 0, 1, 1,
-1.871919, 0.8815683, -0.6082381, 0, 0, 0, 1, 1,
-1.871171, 1.219245, -1.204048, 0, 0, 0, 1, 1,
-1.856432, 0.1560604, -1.955743, 0, 0, 0, 1, 1,
-1.845517, 0.2986759, -1.841166, 0, 0, 0, 1, 1,
-1.828337, 0.2637247, -0.7511926, 0, 0, 0, 1, 1,
-1.804293, -0.3158015, -1.37159, 1, 1, 1, 1, 1,
-1.795146, -0.6766089, -3.170173, 1, 1, 1, 1, 1,
-1.789813, 2.26747, -0.3379052, 1, 1, 1, 1, 1,
-1.78346, -0.5254461, -0.7431387, 1, 1, 1, 1, 1,
-1.761231, 2.076292, 0.2370987, 1, 1, 1, 1, 1,
-1.745297, -2.39501, -3.907923, 1, 1, 1, 1, 1,
-1.742805, 0.07902989, 0.643882, 1, 1, 1, 1, 1,
-1.740353, 0.8112751, -0.306843, 1, 1, 1, 1, 1,
-1.700792, 0.1879664, -3.221396, 1, 1, 1, 1, 1,
-1.696118, -0.06780082, -1.602867, 1, 1, 1, 1, 1,
-1.690822, -1.06009, -1.988906, 1, 1, 1, 1, 1,
-1.681696, -0.1430507, -1.235366, 1, 1, 1, 1, 1,
-1.663299, -0.3292499, -0.317621, 1, 1, 1, 1, 1,
-1.641718, 0.09621909, -2.91314, 1, 1, 1, 1, 1,
-1.641651, -0.05491933, -2.309797, 1, 1, 1, 1, 1,
-1.580714, 0.7348158, -0.9709053, 0, 0, 1, 1, 1,
-1.575761, -0.2726978, -1.569956, 1, 0, 0, 1, 1,
-1.571281, -0.8079565, -1.133256, 1, 0, 0, 1, 1,
-1.569228, -0.7905604, -2.012959, 1, 0, 0, 1, 1,
-1.569094, -0.351843, -2.19464, 1, 0, 0, 1, 1,
-1.561977, -0.2261918, -2.025729, 1, 0, 0, 1, 1,
-1.559547, 0.9297726, -1.192679, 0, 0, 0, 1, 1,
-1.559527, -0.2748204, -2.236328, 0, 0, 0, 1, 1,
-1.559062, -0.7726434, -0.6043364, 0, 0, 0, 1, 1,
-1.553191, 0.3147804, -1.032019, 0, 0, 0, 1, 1,
-1.545565, -0.9167641, -1.949858, 0, 0, 0, 1, 1,
-1.537249, -2.070443, -2.211198, 0, 0, 0, 1, 1,
-1.536326, 0.005388304, -0.5979667, 0, 0, 0, 1, 1,
-1.536095, -0.2104001, -2.431762, 1, 1, 1, 1, 1,
-1.526975, -0.005886556, -2.10079, 1, 1, 1, 1, 1,
-1.522346, 0.504383, -1.751699, 1, 1, 1, 1, 1,
-1.521725, 0.5485677, -1.793988, 1, 1, 1, 1, 1,
-1.499088, -0.1193999, -1.422031, 1, 1, 1, 1, 1,
-1.490561, 2.654074, -0.2940903, 1, 1, 1, 1, 1,
-1.461281, 0.1370074, -1.355883, 1, 1, 1, 1, 1,
-1.460713, 0.5954731, -1.511592, 1, 1, 1, 1, 1,
-1.447902, 0.04092509, -2.691367, 1, 1, 1, 1, 1,
-1.444172, 0.8744365, -1.567928, 1, 1, 1, 1, 1,
-1.444087, -1.047391, -0.1104689, 1, 1, 1, 1, 1,
-1.405893, 0.119964, -0.9426026, 1, 1, 1, 1, 1,
-1.404729, -0.4004335, -0.5262986, 1, 1, 1, 1, 1,
-1.402601, -1.866906, -1.928553, 1, 1, 1, 1, 1,
-1.401527, -0.7509415, -2.598781, 1, 1, 1, 1, 1,
-1.397483, 0.3338493, -2.008965, 0, 0, 1, 1, 1,
-1.390192, -0.6717213, -1.096222, 1, 0, 0, 1, 1,
-1.38456, 2.049684, 0.3507953, 1, 0, 0, 1, 1,
-1.382558, 0.4351792, -2.304584, 1, 0, 0, 1, 1,
-1.371343, 0.5755722, -1.045343, 1, 0, 0, 1, 1,
-1.366737, 0.100321, -1.303713, 1, 0, 0, 1, 1,
-1.361264, 0.6436015, 0.5950051, 0, 0, 0, 1, 1,
-1.357525, -0.8628254, -4.088442, 0, 0, 0, 1, 1,
-1.344055, -0.4016063, -3.127362, 0, 0, 0, 1, 1,
-1.339399, 0.352983, -1.160218, 0, 0, 0, 1, 1,
-1.336767, -0.3696482, -2.567237, 0, 0, 0, 1, 1,
-1.32978, 2.039591, -1.862073, 0, 0, 0, 1, 1,
-1.327639, 0.8280747, -1.225646, 0, 0, 0, 1, 1,
-1.316983, -0.9369793, -1.555472, 1, 1, 1, 1, 1,
-1.30909, 0.7619494, -0.3517685, 1, 1, 1, 1, 1,
-1.307568, 2.589619, -0.08139151, 1, 1, 1, 1, 1,
-1.306253, -0.1768961, -0.224139, 1, 1, 1, 1, 1,
-1.3034, 0.1085541, -0.7914588, 1, 1, 1, 1, 1,
-1.296384, 0.6936271, 0.09193839, 1, 1, 1, 1, 1,
-1.286712, -1.808609, -2.656878, 1, 1, 1, 1, 1,
-1.284968, -1.816051, -1.929424, 1, 1, 1, 1, 1,
-1.273746, 0.3489358, -1.282007, 1, 1, 1, 1, 1,
-1.268996, 0.09968996, -3.191634, 1, 1, 1, 1, 1,
-1.259506, 0.2517107, -2.394067, 1, 1, 1, 1, 1,
-1.251533, -0.3099706, -2.514277, 1, 1, 1, 1, 1,
-1.250572, -0.03586222, -2.578439, 1, 1, 1, 1, 1,
-1.244522, 1.420147, -0.3739476, 1, 1, 1, 1, 1,
-1.240745, 0.3018819, -2.352608, 1, 1, 1, 1, 1,
-1.24026, 0.933791, -2.88143, 0, 0, 1, 1, 1,
-1.237322, -0.6787423, -4.17272, 1, 0, 0, 1, 1,
-1.232845, 0.2516062, -2.947934, 1, 0, 0, 1, 1,
-1.220375, 1.390164, -1.529064, 1, 0, 0, 1, 1,
-1.218439, 0.4849695, -1.400395, 1, 0, 0, 1, 1,
-1.215491, -0.5591289, -1.706917, 1, 0, 0, 1, 1,
-1.211702, -1.979597, -3.349329, 0, 0, 0, 1, 1,
-1.20603, -0.07947049, -0.1225981, 0, 0, 0, 1, 1,
-1.20426, 0.4543665, -0.3020374, 0, 0, 0, 1, 1,
-1.194038, -1.028878, -2.237451, 0, 0, 0, 1, 1,
-1.181804, 0.02751746, -1.227186, 0, 0, 0, 1, 1,
-1.179665, 0.7193387, 0.539848, 0, 0, 0, 1, 1,
-1.179484, 0.5832546, -0.9656835, 0, 0, 0, 1, 1,
-1.178993, 1.981373, -0.01201301, 1, 1, 1, 1, 1,
-1.178575, -2.155507, -5.191007, 1, 1, 1, 1, 1,
-1.175281, -0.1261196, -1.192654, 1, 1, 1, 1, 1,
-1.172602, 1.093582, -0.5099211, 1, 1, 1, 1, 1,
-1.163407, 1.627856, 0.3095046, 1, 1, 1, 1, 1,
-1.162809, 1.050403, 0.1048613, 1, 1, 1, 1, 1,
-1.160755, -0.2264031, -1.050667, 1, 1, 1, 1, 1,
-1.151433, 0.8821719, -1.404207, 1, 1, 1, 1, 1,
-1.148242, 1.589883, -1.044292, 1, 1, 1, 1, 1,
-1.145043, 0.04760579, -0.7867749, 1, 1, 1, 1, 1,
-1.14336, -0.2144735, -2.78128, 1, 1, 1, 1, 1,
-1.14195, 1.280056, 0.6000932, 1, 1, 1, 1, 1,
-1.139861, 0.4812227, 0.2927891, 1, 1, 1, 1, 1,
-1.139216, -0.2511772, -1.775444, 1, 1, 1, 1, 1,
-1.138947, -0.5047575, -0.9046153, 1, 1, 1, 1, 1,
-1.138689, -1.286088, -1.736195, 0, 0, 1, 1, 1,
-1.13789, 0.1877463, -0.8285818, 1, 0, 0, 1, 1,
-1.137516, 0.9750295, -0.6512708, 1, 0, 0, 1, 1,
-1.136418, -0.3931706, -1.172338, 1, 0, 0, 1, 1,
-1.135125, -1.097988, -1.002553, 1, 0, 0, 1, 1,
-1.125612, -0.8546779, -1.389552, 1, 0, 0, 1, 1,
-1.122203, -0.2969154, -2.31974, 0, 0, 0, 1, 1,
-1.121998, 0.2065122, -1.724723, 0, 0, 0, 1, 1,
-1.117205, -0.8600269, -2.706822, 0, 0, 0, 1, 1,
-1.115935, 2.120661, 0.8743384, 0, 0, 0, 1, 1,
-1.108769, -0.9659098, -4.143749, 0, 0, 0, 1, 1,
-1.105806, -0.6532369, -0.2867606, 0, 0, 0, 1, 1,
-1.102453, 0.6422014, 1.468168, 0, 0, 0, 1, 1,
-1.099924, 0.5561607, -2.493344, 1, 1, 1, 1, 1,
-1.095531, 0.9883295, -2.252596, 1, 1, 1, 1, 1,
-1.09341, -0.4992912, -1.526804, 1, 1, 1, 1, 1,
-1.087549, -0.5617613, -3.026315, 1, 1, 1, 1, 1,
-1.076058, 0.08001243, -0.822552, 1, 1, 1, 1, 1,
-1.073946, -0.09292619, 0.4834926, 1, 1, 1, 1, 1,
-1.069356, 0.007405043, -1.440831, 1, 1, 1, 1, 1,
-1.067241, 0.5946869, -0.7809634, 1, 1, 1, 1, 1,
-1.064203, 0.8804518, -1.711038, 1, 1, 1, 1, 1,
-1.063727, -0.4684324, -2.530316, 1, 1, 1, 1, 1,
-1.062422, -0.2282766, -1.800734, 1, 1, 1, 1, 1,
-1.061222, -0.6071428, -1.317695, 1, 1, 1, 1, 1,
-1.056207, 0.4563037, -0.7404779, 1, 1, 1, 1, 1,
-1.052394, -0.06461212, 0.1437495, 1, 1, 1, 1, 1,
-1.048491, 1.380666, -0.9422446, 1, 1, 1, 1, 1,
-1.042359, -0.03455039, -1.601542, 0, 0, 1, 1, 1,
-1.04195, 0.2155112, -0.4884572, 1, 0, 0, 1, 1,
-1.041768, 0.572139, -1.231842, 1, 0, 0, 1, 1,
-1.041285, -0.3947519, -2.082285, 1, 0, 0, 1, 1,
-1.03073, 2.292956, 0.6962692, 1, 0, 0, 1, 1,
-1.029219, 1.774039, 0.1559601, 1, 0, 0, 1, 1,
-1.025144, 1.063599, -1.055421, 0, 0, 0, 1, 1,
-1.024702, 0.5190514, -1.220301, 0, 0, 0, 1, 1,
-1.02254, 1.743942, 1.309865, 0, 0, 0, 1, 1,
-1.018111, 1.051596, -1.010536, 0, 0, 0, 1, 1,
-1.015906, -1.269999, -2.741567, 0, 0, 0, 1, 1,
-0.9981645, -0.4160372, -1.704453, 0, 0, 0, 1, 1,
-0.9918428, -0.2120095, -0.792679, 0, 0, 0, 1, 1,
-0.9894108, -0.2543165, -2.538571, 1, 1, 1, 1, 1,
-0.9836022, 2.229073, -0.898184, 1, 1, 1, 1, 1,
-0.9824808, 2.948264, 0.7510777, 1, 1, 1, 1, 1,
-0.9785581, -1.01361, -3.963516, 1, 1, 1, 1, 1,
-0.9785351, 1.571347, -1.814124, 1, 1, 1, 1, 1,
-0.9778414, -0.08059043, -1.677972, 1, 1, 1, 1, 1,
-0.9754985, -0.01214425, -1.788465, 1, 1, 1, 1, 1,
-0.9743663, 0.6838903, 0.2825953, 1, 1, 1, 1, 1,
-0.9733908, -0.1981231, -1.37035, 1, 1, 1, 1, 1,
-0.9704049, -1.924397, -1.375855, 1, 1, 1, 1, 1,
-0.9671361, -0.7801951, -3.109177, 1, 1, 1, 1, 1,
-0.959486, -1.303023, -3.500964, 1, 1, 1, 1, 1,
-0.9467821, -0.3221952, -1.760466, 1, 1, 1, 1, 1,
-0.9462646, -1.171257, -3.542064, 1, 1, 1, 1, 1,
-0.9453506, -0.6445652, -1.707251, 1, 1, 1, 1, 1,
-0.9452665, -0.8558161, -0.9097718, 0, 0, 1, 1, 1,
-0.9371043, -1.248904, -2.036475, 1, 0, 0, 1, 1,
-0.9329882, 0.633772, -0.6334981, 1, 0, 0, 1, 1,
-0.9292042, -1.306491, -4.383718, 1, 0, 0, 1, 1,
-0.9247392, 0.336409, -2.829683, 1, 0, 0, 1, 1,
-0.9228958, 0.4450503, -0.445093, 1, 0, 0, 1, 1,
-0.9145849, 0.7501867, 0.02629456, 0, 0, 0, 1, 1,
-0.9140894, 0.6838505, -0.09804914, 0, 0, 0, 1, 1,
-0.9046896, 0.6092401, -1.799428, 0, 0, 0, 1, 1,
-0.9022015, -0.04069996, -1.38766, 0, 0, 0, 1, 1,
-0.9013184, 1.590699, -0.381728, 0, 0, 0, 1, 1,
-0.9003274, -0.6620402, -2.668705, 0, 0, 0, 1, 1,
-0.899334, 0.1692291, -1.744371, 0, 0, 0, 1, 1,
-0.8937348, 0.2702616, -1.993094, 1, 1, 1, 1, 1,
-0.8926865, -0.6334597, -2.428534, 1, 1, 1, 1, 1,
-0.8921331, -1.079124, -2.047697, 1, 1, 1, 1, 1,
-0.8917794, -2.762717, -4.179213, 1, 1, 1, 1, 1,
-0.8901811, -1.153787, -3.03173, 1, 1, 1, 1, 1,
-0.8825368, 0.8165429, -1.836108, 1, 1, 1, 1, 1,
-0.8801969, -0.5155675, -1.714878, 1, 1, 1, 1, 1,
-0.8792304, 0.3678275, -0.2619811, 1, 1, 1, 1, 1,
-0.8776461, 0.3016662, -1.076338, 1, 1, 1, 1, 1,
-0.8775775, 0.1042698, -1.87799, 1, 1, 1, 1, 1,
-0.8766279, 1.175403, -0.540068, 1, 1, 1, 1, 1,
-0.8661368, -0.570153, 0.7428055, 1, 1, 1, 1, 1,
-0.8617651, -0.7458064, -1.710882, 1, 1, 1, 1, 1,
-0.8526384, -0.4792741, -4.034685, 1, 1, 1, 1, 1,
-0.8463162, 0.7594559, -1.731761, 1, 1, 1, 1, 1,
-0.8448418, -1.239495, -2.025394, 0, 0, 1, 1, 1,
-0.8357353, 0.1468021, -0.3369126, 1, 0, 0, 1, 1,
-0.8294846, 0.5729508, 0.3353421, 1, 0, 0, 1, 1,
-0.8243493, 0.4020782, -1.887826, 1, 0, 0, 1, 1,
-0.82371, -1.105295, -1.981043, 1, 0, 0, 1, 1,
-0.8135656, 2.055118, -0.3785622, 1, 0, 0, 1, 1,
-0.8121564, -1.017153, -1.682215, 0, 0, 0, 1, 1,
-0.8113775, 0.2633465, -0.6143367, 0, 0, 0, 1, 1,
-0.8101342, 1.193468, -1.918418, 0, 0, 0, 1, 1,
-0.8098322, -0.253179, -1.456813, 0, 0, 0, 1, 1,
-0.809691, -1.021608, -2.324111, 0, 0, 0, 1, 1,
-0.8092062, 0.7002133, -1.297467, 0, 0, 0, 1, 1,
-0.8072723, -1.258454, -3.596917, 0, 0, 0, 1, 1,
-0.8068185, -0.5731326, -2.284778, 1, 1, 1, 1, 1,
-0.7993172, -1.245672, -5.058215, 1, 1, 1, 1, 1,
-0.7892963, 1.888217, 0.7880512, 1, 1, 1, 1, 1,
-0.7887142, -0.3264946, -2.611914, 1, 1, 1, 1, 1,
-0.786379, 0.2876698, -0.7910503, 1, 1, 1, 1, 1,
-0.7863444, -0.6344946, -1.222883, 1, 1, 1, 1, 1,
-0.7832878, -1.269064, -3.132568, 1, 1, 1, 1, 1,
-0.7685141, 0.1799305, -0.8500675, 1, 1, 1, 1, 1,
-0.7685059, -0.8777089, -2.490386, 1, 1, 1, 1, 1,
-0.7666718, 0.2818605, -2.001227, 1, 1, 1, 1, 1,
-0.7646406, -1.706136, -3.041855, 1, 1, 1, 1, 1,
-0.7487451, -0.7926261, -1.943401, 1, 1, 1, 1, 1,
-0.7454191, -2.111269, -3.69388, 1, 1, 1, 1, 1,
-0.7452611, -0.9877343, -3.889323, 1, 1, 1, 1, 1,
-0.738934, 0.8083109, -0.003134884, 1, 1, 1, 1, 1,
-0.7388396, 0.364739, -1.204654, 0, 0, 1, 1, 1,
-0.7361233, -0.5645297, -2.260981, 1, 0, 0, 1, 1,
-0.7315706, 0.7291454, -0.8724459, 1, 0, 0, 1, 1,
-0.7295987, 0.5889204, 0.4817305, 1, 0, 0, 1, 1,
-0.7242558, -0.1230781, -0.9905645, 1, 0, 0, 1, 1,
-0.7232446, 0.7295883, -0.9641374, 1, 0, 0, 1, 1,
-0.7192367, 1.792656, 0.264293, 0, 0, 0, 1, 1,
-0.7106357, 0.619966, -0.1753836, 0, 0, 0, 1, 1,
-0.7066653, 0.1313214, -1.268108, 0, 0, 0, 1, 1,
-0.7062095, -1.079727, -3.159496, 0, 0, 0, 1, 1,
-0.6982945, -2.01935, -3.163707, 0, 0, 0, 1, 1,
-0.6960025, -0.5771207, -4.285451, 0, 0, 0, 1, 1,
-0.6894184, 0.2711453, 0.005208341, 0, 0, 0, 1, 1,
-0.6857358, -0.5500032, -3.244206, 1, 1, 1, 1, 1,
-0.6834095, -0.2893032, -3.098993, 1, 1, 1, 1, 1,
-0.6765199, 0.2103954, -1.705375, 1, 1, 1, 1, 1,
-0.6763245, -0.7727041, -2.122898, 1, 1, 1, 1, 1,
-0.6758671, -1.411231, -3.454673, 1, 1, 1, 1, 1,
-0.6743144, 0.3456654, 0.1008408, 1, 1, 1, 1, 1,
-0.6733349, 0.7326229, -0.5481397, 1, 1, 1, 1, 1,
-0.6733088, 0.0496599, -3.19282, 1, 1, 1, 1, 1,
-0.6728817, -0.4166931, -2.377598, 1, 1, 1, 1, 1,
-0.6718125, 0.1915914, -2.166512, 1, 1, 1, 1, 1,
-0.6713519, -0.2213806, -0.7345924, 1, 1, 1, 1, 1,
-0.671059, -1.564284, -3.445942, 1, 1, 1, 1, 1,
-0.669545, -0.8981489, -4.864676, 1, 1, 1, 1, 1,
-0.6684656, 0.7527453, -0.2041287, 1, 1, 1, 1, 1,
-0.6678665, 0.2466496, -2.871605, 1, 1, 1, 1, 1,
-0.6646576, 1.194659, -2.32622, 0, 0, 1, 1, 1,
-0.6596063, -1.687319, -2.775346, 1, 0, 0, 1, 1,
-0.6565725, -0.06068975, -1.486117, 1, 0, 0, 1, 1,
-0.6546239, 1.228626, 0.6323037, 1, 0, 0, 1, 1,
-0.6480635, -0.6325758, -2.57489, 1, 0, 0, 1, 1,
-0.6326309, 0.7620063, -1.900613, 1, 0, 0, 1, 1,
-0.6312808, 1.332098, -0.1171342, 0, 0, 0, 1, 1,
-0.6285934, 1.418217, -2.476022, 0, 0, 0, 1, 1,
-0.62608, -1.338489, -3.614284, 0, 0, 0, 1, 1,
-0.6250704, 0.5516648, -1.684705, 0, 0, 0, 1, 1,
-0.6227099, 0.2846795, -0.5893307, 0, 0, 0, 1, 1,
-0.6186491, 1.733798, 0.5244734, 0, 0, 0, 1, 1,
-0.6186468, 0.006971226, -3.401328, 0, 0, 0, 1, 1,
-0.6173804, -0.1292065, -2.417887, 1, 1, 1, 1, 1,
-0.6118913, -0.2356898, -1.958779, 1, 1, 1, 1, 1,
-0.6020923, -0.3216237, -1.642622, 1, 1, 1, 1, 1,
-0.597285, 0.4680451, 0.9349466, 1, 1, 1, 1, 1,
-0.5912393, -0.2049785, -0.7886724, 1, 1, 1, 1, 1,
-0.5876552, 0.7387431, 0.1936504, 1, 1, 1, 1, 1,
-0.5856432, -0.4789552, -2.020621, 1, 1, 1, 1, 1,
-0.5768912, 1.054347, 0.3357967, 1, 1, 1, 1, 1,
-0.5754083, 1.445161, 1.033698, 1, 1, 1, 1, 1,
-0.5711998, -0.6932953, -1.431639, 1, 1, 1, 1, 1,
-0.5648194, 0.2913844, 0.4181878, 1, 1, 1, 1, 1,
-0.5638456, -0.03685643, -0.6056334, 1, 1, 1, 1, 1,
-0.5613252, 1.337528, -0.6807521, 1, 1, 1, 1, 1,
-0.5579, -0.08516316, -2.070009, 1, 1, 1, 1, 1,
-0.5537362, 2.046264, -0.3273608, 1, 1, 1, 1, 1,
-0.5529532, 1.383151, -0.3553455, 0, 0, 1, 1, 1,
-0.5522863, 0.07468233, -0.7050548, 1, 0, 0, 1, 1,
-0.5518132, -0.1892478, -2.570974, 1, 0, 0, 1, 1,
-0.5476717, 1.406683, -1.032577, 1, 0, 0, 1, 1,
-0.5451138, 0.8837192, 0.481396, 1, 0, 0, 1, 1,
-0.5441954, 0.5295069, -1.313508, 1, 0, 0, 1, 1,
-0.5347422, 0.2608982, 1.071864, 0, 0, 0, 1, 1,
-0.5320302, -0.5979099, -2.853996, 0, 0, 0, 1, 1,
-0.5297817, -0.4045953, -2.593765, 0, 0, 0, 1, 1,
-0.5276237, 0.6209874, -1.481455, 0, 0, 0, 1, 1,
-0.52564, -1.070284, -3.612826, 0, 0, 0, 1, 1,
-0.5251369, 0.6243953, 0.1879859, 0, 0, 0, 1, 1,
-0.5238913, -0.5531348, -3.46205, 0, 0, 0, 1, 1,
-0.522126, 1.599287, -2.349662, 1, 1, 1, 1, 1,
-0.5175825, -1.10387, -3.725398, 1, 1, 1, 1, 1,
-0.5166737, -0.7520257, -2.2816, 1, 1, 1, 1, 1,
-0.507289, -2.166107, -3.852386, 1, 1, 1, 1, 1,
-0.5047426, -0.8067898, -4.057003, 1, 1, 1, 1, 1,
-0.5043198, 2.283082, -0.5787653, 1, 1, 1, 1, 1,
-0.5034775, -0.13503, -0.5660223, 1, 1, 1, 1, 1,
-0.5011185, 0.397667, -1.767819, 1, 1, 1, 1, 1,
-0.4943686, 0.2082735, -1.424372, 1, 1, 1, 1, 1,
-0.4931899, 1.381319, -0.5085802, 1, 1, 1, 1, 1,
-0.4925929, -0.8877454, -1.681839, 1, 1, 1, 1, 1,
-0.490117, -0.9957111, -1.972824, 1, 1, 1, 1, 1,
-0.4892324, 0.6890951, -0.07873862, 1, 1, 1, 1, 1,
-0.4871086, -0.4552151, -2.492836, 1, 1, 1, 1, 1,
-0.4759475, -1.088864, -1.472653, 1, 1, 1, 1, 1,
-0.4715636, -1.871282, -2.911825, 0, 0, 1, 1, 1,
-0.4701638, 1.368398, -0.6791194, 1, 0, 0, 1, 1,
-0.4692891, -0.1641957, -1.360906, 1, 0, 0, 1, 1,
-0.4684503, -0.3731408, -0.5827338, 1, 0, 0, 1, 1,
-0.4566549, -0.4481418, -2.262788, 1, 0, 0, 1, 1,
-0.4546859, 1.242315, 1.188421, 1, 0, 0, 1, 1,
-0.4534562, -0.7378054, -0.9227198, 0, 0, 0, 1, 1,
-0.4512337, 0.5853475, -1.424673, 0, 0, 0, 1, 1,
-0.4502296, 1.085681, -1.163817, 0, 0, 0, 1, 1,
-0.4446567, -0.2468259, -2.739174, 0, 0, 0, 1, 1,
-0.4446522, 1.750024, -1.502041, 0, 0, 0, 1, 1,
-0.4421181, 0.2481747, -2.283871, 0, 0, 0, 1, 1,
-0.4413888, 1.221582, 0.6791591, 0, 0, 0, 1, 1,
-0.4393832, 1.454288, 0.3308732, 1, 1, 1, 1, 1,
-0.4390091, -1.147711, -2.996185, 1, 1, 1, 1, 1,
-0.4332166, -1.3509, -3.55455, 1, 1, 1, 1, 1,
-0.432362, -0.2748162, -2.590606, 1, 1, 1, 1, 1,
-0.4320171, -0.3941692, -2.557201, 1, 1, 1, 1, 1,
-0.4319099, 0.2526671, -1.705449, 1, 1, 1, 1, 1,
-0.4313355, -0.4180329, -2.062524, 1, 1, 1, 1, 1,
-0.4312755, 1.096292, 0.3152813, 1, 1, 1, 1, 1,
-0.4278122, 1.46161, -0.1928143, 1, 1, 1, 1, 1,
-0.4224322, -1.248772, -3.882489, 1, 1, 1, 1, 1,
-0.4212626, 0.3282062, -0.1606944, 1, 1, 1, 1, 1,
-0.4202374, -1.380707, -2.691796, 1, 1, 1, 1, 1,
-0.4142609, 0.1895327, 0.5117318, 1, 1, 1, 1, 1,
-0.4107503, 0.1808192, -1.386588, 1, 1, 1, 1, 1,
-0.40738, 0.1227199, -0.5814665, 1, 1, 1, 1, 1,
-0.4049612, 0.6417961, 1.264851, 0, 0, 1, 1, 1,
-0.403394, -1.2514, -1.010201, 1, 0, 0, 1, 1,
-0.3994105, 0.5847694, -2.052578, 1, 0, 0, 1, 1,
-0.3946199, 0.8293501, 0.4713435, 1, 0, 0, 1, 1,
-0.393696, -0.5377136, -1.864399, 1, 0, 0, 1, 1,
-0.3934619, -0.2764056, -1.821351, 1, 0, 0, 1, 1,
-0.392159, -1.562934, -2.981579, 0, 0, 0, 1, 1,
-0.3898903, -0.268925, -1.050723, 0, 0, 0, 1, 1,
-0.3857937, -1.113704, -2.718377, 0, 0, 0, 1, 1,
-0.3827347, 0.01339286, 0.04017239, 0, 0, 0, 1, 1,
-0.3774541, -0.5052882, -2.634671, 0, 0, 0, 1, 1,
-0.3772559, 0.8747354, -0.3764688, 0, 0, 0, 1, 1,
-0.3763814, 0.8580472, -0.08595697, 0, 0, 0, 1, 1,
-0.3763472, -1.04479, -1.752636, 1, 1, 1, 1, 1,
-0.3752705, -0.6986266, -2.897743, 1, 1, 1, 1, 1,
-0.3706391, 0.580066, -0.3902143, 1, 1, 1, 1, 1,
-0.3699817, 0.30902, -0.6355779, 1, 1, 1, 1, 1,
-0.3637424, 1.592294, 0.07470237, 1, 1, 1, 1, 1,
-0.3637175, -0.10896, -2.046774, 1, 1, 1, 1, 1,
-0.3634423, 0.6083375, -1.169922, 1, 1, 1, 1, 1,
-0.3584712, -0.6157742, -4.471747, 1, 1, 1, 1, 1,
-0.3557202, 0.2407169, -1.616737, 1, 1, 1, 1, 1,
-0.354951, 0.5261341, -1.113495, 1, 1, 1, 1, 1,
-0.3523378, -0.8248463, -1.495759, 1, 1, 1, 1, 1,
-0.3516431, -1.059651, -4.500565, 1, 1, 1, 1, 1,
-0.3462553, -1.165596, -2.655834, 1, 1, 1, 1, 1,
-0.3424627, 1.029274, -0.1029396, 1, 1, 1, 1, 1,
-0.3416275, 1.715957, 0.5413958, 1, 1, 1, 1, 1,
-0.3414289, 0.4389021, 0.7478256, 0, 0, 1, 1, 1,
-0.3394763, -0.06081193, -3.653278, 1, 0, 0, 1, 1,
-0.3361809, 1.269737, 0.4833931, 1, 0, 0, 1, 1,
-0.3272018, 0.2736862, -0.101659, 1, 0, 0, 1, 1,
-0.3258317, -0.5070274, -3.181626, 1, 0, 0, 1, 1,
-0.3226328, -0.5252792, -2.667017, 1, 0, 0, 1, 1,
-0.3223749, -1.339253, -2.560273, 0, 0, 0, 1, 1,
-0.3201948, -0.6987558, -2.875218, 0, 0, 0, 1, 1,
-0.3196862, -0.3250391, -2.964361, 0, 0, 0, 1, 1,
-0.3156668, 0.981557, -0.434037, 0, 0, 0, 1, 1,
-0.3136258, -0.8142793, -1.920637, 0, 0, 0, 1, 1,
-0.3114103, 0.5758236, -0.6268425, 0, 0, 0, 1, 1,
-0.310654, -0.5336608, -2.862141, 0, 0, 0, 1, 1,
-0.3089895, -0.525579, -2.972086, 1, 1, 1, 1, 1,
-0.306364, 1.42063, 0.7597497, 1, 1, 1, 1, 1,
-0.3025736, 1.006539, 1.021202, 1, 1, 1, 1, 1,
-0.3024862, -0.3207142, -1.210719, 1, 1, 1, 1, 1,
-0.2986275, -0.845581, -0.6749983, 1, 1, 1, 1, 1,
-0.2969314, -0.06029766, 0.0812678, 1, 1, 1, 1, 1,
-0.2964449, 0.8525869, -0.1360556, 1, 1, 1, 1, 1,
-0.2964103, -0.7517459, -1.70003, 1, 1, 1, 1, 1,
-0.2946551, -0.1828769, -3.155787, 1, 1, 1, 1, 1,
-0.2939844, -1.734253, -2.92032, 1, 1, 1, 1, 1,
-0.2902234, -0.01892199, -0.6073846, 1, 1, 1, 1, 1,
-0.2897603, -0.8786178, -2.654601, 1, 1, 1, 1, 1,
-0.2801741, 0.1929426, -0.6393498, 1, 1, 1, 1, 1,
-0.2760707, -0.722306, -2.29753, 1, 1, 1, 1, 1,
-0.2712665, 2.044818, -1.544675, 1, 1, 1, 1, 1,
-0.2626869, -0.03776503, -2.466062, 0, 0, 1, 1, 1,
-0.2563688, -0.03905733, -2.889671, 1, 0, 0, 1, 1,
-0.253114, 0.06154145, -2.736713, 1, 0, 0, 1, 1,
-0.2530586, -1.410594, -4.516262, 1, 0, 0, 1, 1,
-0.2516323, -0.9001303, -2.831431, 1, 0, 0, 1, 1,
-0.2511791, 1.529741, -1.713723, 1, 0, 0, 1, 1,
-0.2491091, -0.3577323, 0.1238035, 0, 0, 0, 1, 1,
-0.2465955, 2.882294, 2.127298, 0, 0, 0, 1, 1,
-0.2450454, 0.01100103, 0.4147019, 0, 0, 0, 1, 1,
-0.2404625, 0.2604666, 0.2026955, 0, 0, 0, 1, 1,
-0.232126, -0.3317328, -2.773549, 0, 0, 0, 1, 1,
-0.2303653, 0.8331671, -1.49139, 0, 0, 0, 1, 1,
-0.2261312, -0.1931223, -3.686237, 0, 0, 0, 1, 1,
-0.221921, 2.091008, 0.4376122, 1, 1, 1, 1, 1,
-0.2217672, -0.2265635, -2.036804, 1, 1, 1, 1, 1,
-0.213294, -1.2597, -1.293295, 1, 1, 1, 1, 1,
-0.2111687, -1.720555, -3.574508, 1, 1, 1, 1, 1,
-0.2087844, -0.6913844, -1.882807, 1, 1, 1, 1, 1,
-0.201783, -0.5841246, -2.252598, 1, 1, 1, 1, 1,
-0.1956145, 2.044165, -1.837306, 1, 1, 1, 1, 1,
-0.1921425, 0.8932622, -0.6450152, 1, 1, 1, 1, 1,
-0.1888704, 0.09669342, -2.029648, 1, 1, 1, 1, 1,
-0.1865396, 1.763695, -1.119431, 1, 1, 1, 1, 1,
-0.1832983, -0.2635994, -2.12277, 1, 1, 1, 1, 1,
-0.1795865, 0.6756052, -0.02785865, 1, 1, 1, 1, 1,
-0.1786479, 0.7781664, 0.2808553, 1, 1, 1, 1, 1,
-0.177148, -1.797752, -2.90199, 1, 1, 1, 1, 1,
-0.1760921, -0.459226, -2.918185, 1, 1, 1, 1, 1,
-0.1744145, -2.047808, -0.9069793, 0, 0, 1, 1, 1,
-0.1648996, 0.8904211, -0.7651494, 1, 0, 0, 1, 1,
-0.1635753, 0.1536321, -1.344503, 1, 0, 0, 1, 1,
-0.1609335, -0.7828426, -1.73083, 1, 0, 0, 1, 1,
-0.1606389, -0.6161804, -3.057517, 1, 0, 0, 1, 1,
-0.1590605, 0.2827758, -1.018007, 1, 0, 0, 1, 1,
-0.1578368, -0.2258595, -4.521235, 0, 0, 0, 1, 1,
-0.1565403, -0.3837655, -5.576386, 0, 0, 0, 1, 1,
-0.1492887, 1.906838, -1.414033, 0, 0, 0, 1, 1,
-0.1489138, -0.4191845, -1.160529, 0, 0, 0, 1, 1,
-0.1485869, -0.7765779, -2.701203, 0, 0, 0, 1, 1,
-0.1444383, -0.1813973, -2.28738, 0, 0, 0, 1, 1,
-0.1439724, -0.1041314, -2.906955, 0, 0, 0, 1, 1,
-0.1433862, 0.7309368, -2.383683, 1, 1, 1, 1, 1,
-0.1418227, -0.8222904, -5.843472, 1, 1, 1, 1, 1,
-0.1405842, -0.1993132, -1.443788, 1, 1, 1, 1, 1,
-0.1391614, -0.5620133, -2.645733, 1, 1, 1, 1, 1,
-0.1389972, -0.4970252, -3.31047, 1, 1, 1, 1, 1,
-0.1381304, 0.152235, -1.324924, 1, 1, 1, 1, 1,
-0.1375781, -0.1458512, -1.481929, 1, 1, 1, 1, 1,
-0.1364437, 2.551023, 0.1503224, 1, 1, 1, 1, 1,
-0.1316008, 0.1055047, -1.478722, 1, 1, 1, 1, 1,
-0.1298514, -1.021159, -3.068563, 1, 1, 1, 1, 1,
-0.1226812, 2.082709, -1.523713, 1, 1, 1, 1, 1,
-0.1196094, 0.326292, 1.418604, 1, 1, 1, 1, 1,
-0.1164146, -0.31876, -3.666594, 1, 1, 1, 1, 1,
-0.1083069, -1.434809, -3.697507, 1, 1, 1, 1, 1,
-0.1046988, -0.7403883, -1.020727, 1, 1, 1, 1, 1,
-0.1028083, 1.397894, 0.7614446, 0, 0, 1, 1, 1,
-0.1023158, -0.9708653, -3.258417, 1, 0, 0, 1, 1,
-0.1005354, -0.4298885, -2.118931, 1, 0, 0, 1, 1,
-0.1000764, -0.7347194, -5.055476, 1, 0, 0, 1, 1,
-0.09745301, -0.247188, -3.565265, 1, 0, 0, 1, 1,
-0.09098326, -0.8499532, -4.42308, 1, 0, 0, 1, 1,
-0.08706228, -1.821238, -3.044502, 0, 0, 0, 1, 1,
-0.08346126, -0.7270108, -3.511911, 0, 0, 0, 1, 1,
-0.08332529, -0.395647, -3.09442, 0, 0, 0, 1, 1,
-0.08254936, 0.6894921, -0.3831613, 0, 0, 0, 1, 1,
-0.0824713, -0.490264, -1.812752, 0, 0, 0, 1, 1,
-0.0773431, -0.6162938, -3.741168, 0, 0, 0, 1, 1,
-0.07296548, 0.4405233, -2.825567, 0, 0, 0, 1, 1,
-0.07245456, -1.251011, -3.861874, 1, 1, 1, 1, 1,
-0.07226966, 0.1334862, -3.385086, 1, 1, 1, 1, 1,
-0.0696122, -0.5686474, -1.898215, 1, 1, 1, 1, 1,
-0.06785037, 0.07377843, -0.1676753, 1, 1, 1, 1, 1,
-0.06654688, -1.034005, -0.9875235, 1, 1, 1, 1, 1,
-0.06539521, 0.4440962, 0.06753272, 1, 1, 1, 1, 1,
-0.05495309, -0.3039236, -1.926985, 1, 1, 1, 1, 1,
-0.05437027, 1.063087, -1.122406, 1, 1, 1, 1, 1,
-0.05288079, 1.163284, 0.405196, 1, 1, 1, 1, 1,
-0.05140203, -0.3934078, -3.190399, 1, 1, 1, 1, 1,
-0.04140412, -0.7808374, -2.745418, 1, 1, 1, 1, 1,
-0.04094037, -2.345773, -5.024008, 1, 1, 1, 1, 1,
-0.03155476, 0.07262474, 0.9116297, 1, 1, 1, 1, 1,
-0.03140299, 0.5776566, 1.251638, 1, 1, 1, 1, 1,
-0.02907382, 0.3451541, -0.364852, 1, 1, 1, 1, 1,
-0.02777557, 1.95077, 0.08536207, 0, 0, 1, 1, 1,
-0.02733538, -0.323722, -2.534214, 1, 0, 0, 1, 1,
-0.02598335, 1.042912, -1.153064, 1, 0, 0, 1, 1,
-0.02072206, 0.542464, -0.3901185, 1, 0, 0, 1, 1,
-0.02033384, 0.7256956, 2.332882, 1, 0, 0, 1, 1,
-0.01746076, -1.327389, -3.140564, 1, 0, 0, 1, 1,
-0.01628788, 0.6067476, -3.097335, 0, 0, 0, 1, 1,
-0.01183732, -1.094877, -3.551122, 0, 0, 0, 1, 1,
-0.009350747, 0.361017, 0.3885339, 0, 0, 0, 1, 1,
-0.006095385, -0.3299469, -5.766266, 0, 0, 0, 1, 1,
-0.003893145, -0.2463787, -3.131201, 0, 0, 0, 1, 1,
-0.003487997, -0.7970088, -1.690342, 0, 0, 0, 1, 1,
0.0005119359, 0.01553403, 0.698343, 0, 0, 0, 1, 1,
0.003868801, 1.15896, 0.9983376, 1, 1, 1, 1, 1,
0.006830877, 0.5682648, -1.140858, 1, 1, 1, 1, 1,
0.01000722, 0.7125101, 0.2418467, 1, 1, 1, 1, 1,
0.01168814, -0.7054976, 3.835245, 1, 1, 1, 1, 1,
0.01295372, 0.3732946, -0.2286342, 1, 1, 1, 1, 1,
0.01419084, 0.6260283, -0.01765722, 1, 1, 1, 1, 1,
0.02046508, -0.9556548, 2.386946, 1, 1, 1, 1, 1,
0.03130239, 0.9422191, 0.7652683, 1, 1, 1, 1, 1,
0.03425239, -0.09463595, 3.070623, 1, 1, 1, 1, 1,
0.03476667, -1.159621, 3.803509, 1, 1, 1, 1, 1,
0.03549479, 0.6957015, -0.1120358, 1, 1, 1, 1, 1,
0.03570273, -1.028801, 2.031033, 1, 1, 1, 1, 1,
0.03758746, -1.133047, 3.488344, 1, 1, 1, 1, 1,
0.03935105, -0.3307138, 3.885915, 1, 1, 1, 1, 1,
0.0404754, 0.1184196, -0.1975278, 1, 1, 1, 1, 1,
0.04235975, 0.322557, 1.078195, 0, 0, 1, 1, 1,
0.04237913, 0.3958649, -1.172839, 1, 0, 0, 1, 1,
0.04956755, 1.585294, -1.551263, 1, 0, 0, 1, 1,
0.05202685, 0.3770176, 0.6842816, 1, 0, 0, 1, 1,
0.05533051, -0.2675321, 3.015458, 1, 0, 0, 1, 1,
0.06054795, -1.510523, 3.258767, 1, 0, 0, 1, 1,
0.0654572, 1.062938, 0.6706865, 0, 0, 0, 1, 1,
0.06716698, 0.7487697, -0.7998377, 0, 0, 0, 1, 1,
0.06727068, -2.995971, 3.452219, 0, 0, 0, 1, 1,
0.06963809, -1.085861, 4.452247, 0, 0, 0, 1, 1,
0.07002126, -1.699201, 2.766147, 0, 0, 0, 1, 1,
0.0700594, 2.973094, -1.067924, 0, 0, 0, 1, 1,
0.07376938, -2.023018, 2.643621, 0, 0, 0, 1, 1,
0.07385686, 0.06724364, 0.6455811, 1, 1, 1, 1, 1,
0.08137081, 1.125694, 0.2776385, 1, 1, 1, 1, 1,
0.08229008, 0.7501507, 2.481131, 1, 1, 1, 1, 1,
0.08548828, 0.9891797, 1.501262, 1, 1, 1, 1, 1,
0.08608615, -0.5689564, 1.839645, 1, 1, 1, 1, 1,
0.09152855, 1.060515, 1.006221, 1, 1, 1, 1, 1,
0.09389425, 0.9046571, 1.105044, 1, 1, 1, 1, 1,
0.09398516, 0.3657468, -0.38602, 1, 1, 1, 1, 1,
0.09758613, -0.714267, 5.121946, 1, 1, 1, 1, 1,
0.09970288, -1.954463, 4.018871, 1, 1, 1, 1, 1,
0.1006349, 0.4634228, -0.4058995, 1, 1, 1, 1, 1,
0.1050122, -0.6855357, 4.920103, 1, 1, 1, 1, 1,
0.1098566, -0.7359008, 3.002218, 1, 1, 1, 1, 1,
0.1110522, 0.210511, -0.4582199, 1, 1, 1, 1, 1,
0.1135847, -1.788262, 3.313762, 1, 1, 1, 1, 1,
0.1146993, -0.02697219, 0.9236801, 0, 0, 1, 1, 1,
0.1158429, 0.4729038, 1.673302, 1, 0, 0, 1, 1,
0.1216439, 0.2661399, 1.500695, 1, 0, 0, 1, 1,
0.1239576, -0.5445896, 4.663799, 1, 0, 0, 1, 1,
0.1257546, 0.3859066, 0.5570338, 1, 0, 0, 1, 1,
0.1269268, 0.420848, -1.091444, 1, 0, 0, 1, 1,
0.1269773, 0.5995703, 0.9577071, 0, 0, 0, 1, 1,
0.1274237, -0.5076759, 2.292056, 0, 0, 0, 1, 1,
0.1347379, 0.6388676, 0.5590841, 0, 0, 0, 1, 1,
0.1358999, -1.624698, 1.656688, 0, 0, 0, 1, 1,
0.1380074, -0.8408195, 2.806774, 0, 0, 0, 1, 1,
0.1388633, 0.9495252, 1.217205, 0, 0, 0, 1, 1,
0.1421529, -0.01497504, 3.496332, 0, 0, 0, 1, 1,
0.1449258, -1.122545, 1.707396, 1, 1, 1, 1, 1,
0.1530673, 0.3806508, 0.01526286, 1, 1, 1, 1, 1,
0.1536828, -0.5847915, 2.474758, 1, 1, 1, 1, 1,
0.1545359, -1.91029, 2.151947, 1, 1, 1, 1, 1,
0.1566071, -1.302598, 3.284733, 1, 1, 1, 1, 1,
0.1596622, -1.29033, 2.206516, 1, 1, 1, 1, 1,
0.1603881, 1.287107, -0.4477158, 1, 1, 1, 1, 1,
0.1630884, -0.4265361, 3.606952, 1, 1, 1, 1, 1,
0.1699019, 1.068461, -1.150708, 1, 1, 1, 1, 1,
0.1728168, 0.08645993, 0.01092544, 1, 1, 1, 1, 1,
0.1806295, -0.3856879, 3.120077, 1, 1, 1, 1, 1,
0.1816443, -1.683155, 1.935289, 1, 1, 1, 1, 1,
0.1822159, 1.655895, 0.5161573, 1, 1, 1, 1, 1,
0.184193, -1.019524, 3.597592, 1, 1, 1, 1, 1,
0.1851948, -1.066371, 2.762197, 1, 1, 1, 1, 1,
0.1853105, -0.3390195, 3.882056, 0, 0, 1, 1, 1,
0.1861431, 0.5539986, 0.4135005, 1, 0, 0, 1, 1,
0.1903599, -0.5322418, 2.156949, 1, 0, 0, 1, 1,
0.1916447, 0.9090635, 0.7991589, 1, 0, 0, 1, 1,
0.192419, -0.411118, 2.848967, 1, 0, 0, 1, 1,
0.1946902, -0.8965304, 3.804912, 1, 0, 0, 1, 1,
0.1958317, -0.5317956, 3.723259, 0, 0, 0, 1, 1,
0.2042326, -1.062871, 3.242875, 0, 0, 0, 1, 1,
0.2071083, -1.107596, 4.805212, 0, 0, 0, 1, 1,
0.2105665, 0.5400087, -2.426288, 0, 0, 0, 1, 1,
0.2107136, -1.48746, 4.328989, 0, 0, 0, 1, 1,
0.2151596, -1.18387, 1.090514, 0, 0, 0, 1, 1,
0.2167881, 0.3388767, 0.8529002, 0, 0, 0, 1, 1,
0.2175829, -0.1688582, 1.966529, 1, 1, 1, 1, 1,
0.2183212, -1.148488, 3.504515, 1, 1, 1, 1, 1,
0.2252088, 0.788704, 2.203055, 1, 1, 1, 1, 1,
0.2288963, 0.2996297, -0.03550823, 1, 1, 1, 1, 1,
0.2346069, -0.2445027, 3.618872, 1, 1, 1, 1, 1,
0.2373331, -0.8153937, 2.883496, 1, 1, 1, 1, 1,
0.2375193, -1.551741, 1.81035, 1, 1, 1, 1, 1,
0.2379176, 1.248598, -0.7282111, 1, 1, 1, 1, 1,
0.2399977, 0.4712088, -0.04257107, 1, 1, 1, 1, 1,
0.243422, -0.5251719, 3.516987, 1, 1, 1, 1, 1,
0.2444959, 1.290762, 1.200384, 1, 1, 1, 1, 1,
0.2447063, -1.089459, 2.542284, 1, 1, 1, 1, 1,
0.2516713, 0.4805804, 1.844979, 1, 1, 1, 1, 1,
0.2575162, 0.05577667, 1.007684, 1, 1, 1, 1, 1,
0.2582492, 0.401671, 0.8489879, 1, 1, 1, 1, 1,
0.259311, -1.438186, 1.634027, 0, 0, 1, 1, 1,
0.259874, 0.1163421, 1.189087, 1, 0, 0, 1, 1,
0.2668675, -1.251872, 3.849834, 1, 0, 0, 1, 1,
0.267695, 0.6865235, 0.5779155, 1, 0, 0, 1, 1,
0.2725009, -0.5163651, 4.319025, 1, 0, 0, 1, 1,
0.273713, -0.09679629, 0.08834438, 1, 0, 0, 1, 1,
0.2792827, -0.4147901, 1.59776, 0, 0, 0, 1, 1,
0.281997, 0.2106173, 1.922535, 0, 0, 0, 1, 1,
0.2835286, -0.4010498, 3.892302, 0, 0, 0, 1, 1,
0.2836083, -0.5483665, 2.964645, 0, 0, 0, 1, 1,
0.2846156, 0.4283481, -1.584339, 0, 0, 0, 1, 1,
0.285145, 0.3877926, 1.613627, 0, 0, 0, 1, 1,
0.286659, -1.290834, 4.756082, 0, 0, 0, 1, 1,
0.2886867, 0.5192515, -0.852042, 1, 1, 1, 1, 1,
0.2908616, 0.8137928, -0.9847932, 1, 1, 1, 1, 1,
0.292617, -0.8306836, 2.502236, 1, 1, 1, 1, 1,
0.3017513, -2.305784, 3.321851, 1, 1, 1, 1, 1,
0.3046116, -0.6375573, 2.609046, 1, 1, 1, 1, 1,
0.3066898, 0.9144658, -0.9661638, 1, 1, 1, 1, 1,
0.3105508, 1.748286, 0.8829259, 1, 1, 1, 1, 1,
0.3128417, -2.985163, 3.617799, 1, 1, 1, 1, 1,
0.3167328, 0.03158545, 2.542356, 1, 1, 1, 1, 1,
0.3172603, -0.8377911, 1.311149, 1, 1, 1, 1, 1,
0.3193552, -1.985061, 2.385428, 1, 1, 1, 1, 1,
0.3217687, -0.4697061, 1.948729, 1, 1, 1, 1, 1,
0.3221086, 0.3141913, -0.2341755, 1, 1, 1, 1, 1,
0.3261537, 0.1357857, 1.355024, 1, 1, 1, 1, 1,
0.3361812, 0.07458572, -0.438153, 1, 1, 1, 1, 1,
0.3378111, -1.085745, 1.337631, 0, 0, 1, 1, 1,
0.3384967, -0.3121164, 4.86237, 1, 0, 0, 1, 1,
0.3402082, -0.2846889, 1.04463, 1, 0, 0, 1, 1,
0.3404032, -0.0212736, 2.583685, 1, 0, 0, 1, 1,
0.3454804, -0.1816381, 2.841024, 1, 0, 0, 1, 1,
0.347271, -1.753923, 3.878721, 1, 0, 0, 1, 1,
0.3472843, -0.2779498, 1.178783, 0, 0, 0, 1, 1,
0.3486809, -0.3915434, 1.379488, 0, 0, 0, 1, 1,
0.3496084, 0.2474557, 0.4859834, 0, 0, 0, 1, 1,
0.3512995, -2.132703, 2.940471, 0, 0, 0, 1, 1,
0.3571851, -0.9686638, 3.46867, 0, 0, 0, 1, 1,
0.3574483, -0.7523591, 2.748366, 0, 0, 0, 1, 1,
0.360276, 1.432271, 1.549961, 0, 0, 0, 1, 1,
0.3611008, -0.02896202, 2.483325, 1, 1, 1, 1, 1,
0.3690532, 1.115587, 1.411849, 1, 1, 1, 1, 1,
0.3714629, 1.471288, -1.19369, 1, 1, 1, 1, 1,
0.3729988, -0.1562934, 1.433068, 1, 1, 1, 1, 1,
0.3736086, 0.5985602, 0.8287077, 1, 1, 1, 1, 1,
0.3748877, 0.4418277, 2.257493, 1, 1, 1, 1, 1,
0.3830256, 0.04992797, 0.1862049, 1, 1, 1, 1, 1,
0.3860479, 0.06397057, 2.250786, 1, 1, 1, 1, 1,
0.3877944, 0.736352, 0.2303689, 1, 1, 1, 1, 1,
0.3895686, -0.2711377, 0.9842154, 1, 1, 1, 1, 1,
0.3903004, -0.3683142, 2.342982, 1, 1, 1, 1, 1,
0.3954926, -0.4533286, 0.2233059, 1, 1, 1, 1, 1,
0.3960994, -1.601527, 1.461923, 1, 1, 1, 1, 1,
0.3986978, -1.046513, 2.261205, 1, 1, 1, 1, 1,
0.4036759, -0.6201676, 1.69843, 1, 1, 1, 1, 1,
0.405748, 0.7868569, 0.9883465, 0, 0, 1, 1, 1,
0.4069034, 0.4941386, 0.4513797, 1, 0, 0, 1, 1,
0.4111214, -0.6349081, 2.460078, 1, 0, 0, 1, 1,
0.4150673, 0.7962345, -0.4752875, 1, 0, 0, 1, 1,
0.417163, 1.886236, 0.9079243, 1, 0, 0, 1, 1,
0.425201, 0.2782478, 0.6054369, 1, 0, 0, 1, 1,
0.4271296, 0.3699639, 0.3540891, 0, 0, 0, 1, 1,
0.4275099, 2.500391, 1.308675, 0, 0, 0, 1, 1,
0.4280542, 1.012988, -0.7309479, 0, 0, 0, 1, 1,
0.4342045, 0.6332412, -0.3415428, 0, 0, 0, 1, 1,
0.4384233, 0.2474424, -0.3162496, 0, 0, 0, 1, 1,
0.4421088, -1.144012, 3.163981, 0, 0, 0, 1, 1,
0.4457758, 1.129322, -1.027836, 0, 0, 0, 1, 1,
0.4467164, -0.1306792, 2.02653, 1, 1, 1, 1, 1,
0.4475067, 1.163746, 0.5986887, 1, 1, 1, 1, 1,
0.447875, 1.53664, 0.1935189, 1, 1, 1, 1, 1,
0.4518366, -0.8830029, 1.263527, 1, 1, 1, 1, 1,
0.4536174, 0.09636924, 1.779216, 1, 1, 1, 1, 1,
0.4562879, -0.5489249, 1.929984, 1, 1, 1, 1, 1,
0.4585893, 0.3134876, 0.4628885, 1, 1, 1, 1, 1,
0.4624815, -0.8790908, 1.877945, 1, 1, 1, 1, 1,
0.4648465, 0.7930772, -0.3523189, 1, 1, 1, 1, 1,
0.4683254, -0.9637548, 3.201272, 1, 1, 1, 1, 1,
0.4717948, -0.04202836, 1.726388, 1, 1, 1, 1, 1,
0.4739335, -0.1715169, 2.558136, 1, 1, 1, 1, 1,
0.4765354, -0.7375067, 1.555438, 1, 1, 1, 1, 1,
0.4798373, 1.326685, -0.2006786, 1, 1, 1, 1, 1,
0.4811513, -1.490048, 2.534222, 1, 1, 1, 1, 1,
0.4819285, 1.469265, 1.518699, 0, 0, 1, 1, 1,
0.4822245, -2.046917, 3.078146, 1, 0, 0, 1, 1,
0.4824686, -0.7311466, 2.550544, 1, 0, 0, 1, 1,
0.4869494, -0.4029427, 2.409621, 1, 0, 0, 1, 1,
0.4871679, -0.5086948, 3.099301, 1, 0, 0, 1, 1,
0.488375, -1.005971, 2.296984, 1, 0, 0, 1, 1,
0.4964101, 0.5090637, 1.772923, 0, 0, 0, 1, 1,
0.4964621, -0.1667605, 2.184776, 0, 0, 0, 1, 1,
0.4997245, -0.4195748, 1.752128, 0, 0, 0, 1, 1,
0.5022586, 2.205954, 0.4335528, 0, 0, 0, 1, 1,
0.5047758, -0.575341, 3.885054, 0, 0, 0, 1, 1,
0.5062703, 0.7483803, 1.092409, 0, 0, 0, 1, 1,
0.5122879, 0.5793113, -0.4945695, 0, 0, 0, 1, 1,
0.5123132, -1.894677, 2.161779, 1, 1, 1, 1, 1,
0.5135766, -0.6348842, 2.396639, 1, 1, 1, 1, 1,
0.5157937, -0.9226999, 4.306233, 1, 1, 1, 1, 1,
0.5204001, -0.504726, 3.050657, 1, 1, 1, 1, 1,
0.5228382, 0.4152734, 0.4545809, 1, 1, 1, 1, 1,
0.5230153, 1.711996, 1.840414, 1, 1, 1, 1, 1,
0.524502, -1.066207, 4.179341, 1, 1, 1, 1, 1,
0.5254759, -0.8361399, 2.612346, 1, 1, 1, 1, 1,
0.5261273, -0.1756228, 0.9555597, 1, 1, 1, 1, 1,
0.5382555, 1.069308, 1.801813, 1, 1, 1, 1, 1,
0.5406943, 1.235251, -0.7252066, 1, 1, 1, 1, 1,
0.5420499, 0.3381906, 1.218466, 1, 1, 1, 1, 1,
0.5424586, -2.090759, 3.262006, 1, 1, 1, 1, 1,
0.5443552, -0.5890865, 2.025986, 1, 1, 1, 1, 1,
0.5488624, 1.013432, 0.8293441, 1, 1, 1, 1, 1,
0.5495045, 0.7273695, 0.8099291, 0, 0, 1, 1, 1,
0.5498926, -0.5775079, 1.902586, 1, 0, 0, 1, 1,
0.5554085, -3.124158, 3.95979, 1, 0, 0, 1, 1,
0.5579625, -0.4019443, 2.422787, 1, 0, 0, 1, 1,
0.559867, -1.079212, 3.28109, 1, 0, 0, 1, 1,
0.5624807, -1.357343, 2.214569, 1, 0, 0, 1, 1,
0.5625824, 1.083522, 0.1532033, 0, 0, 0, 1, 1,
0.562795, -0.5345368, 1.725914, 0, 0, 0, 1, 1,
0.5674507, 0.5197894, 3.806731, 0, 0, 0, 1, 1,
0.5684596, -0.1185464, 3.24165, 0, 0, 0, 1, 1,
0.5687496, 0.2843243, 0.8141999, 0, 0, 0, 1, 1,
0.5698254, 0.1531821, 1.763779, 0, 0, 0, 1, 1,
0.5795996, -1.863714, 2.857262, 0, 0, 0, 1, 1,
0.5815466, 0.2241412, 1.419467, 1, 1, 1, 1, 1,
0.5822231, -0.8999603, 2.121943, 1, 1, 1, 1, 1,
0.5864225, 1.502393, 2.380284, 1, 1, 1, 1, 1,
0.593142, -1.4976, 1.996589, 1, 1, 1, 1, 1,
0.5941035, -0.8779969, 2.648766, 1, 1, 1, 1, 1,
0.5979196, -1.620801, 1.258033, 1, 1, 1, 1, 1,
0.5990515, -0.7519469, 0.8810316, 1, 1, 1, 1, 1,
0.6035958, -0.1007206, 0.1712055, 1, 1, 1, 1, 1,
0.6038013, -2.039102, 2.291112, 1, 1, 1, 1, 1,
0.6046717, -1.15584, 2.942707, 1, 1, 1, 1, 1,
0.6100876, -0.4821139, 4.110759, 1, 1, 1, 1, 1,
0.6177879, -0.504653, 2.258598, 1, 1, 1, 1, 1,
0.6217874, -0.07328276, 3.720847, 1, 1, 1, 1, 1,
0.6227754, 0.3736156, 1.486405, 1, 1, 1, 1, 1,
0.6245072, 1.196514, 0.7401255, 1, 1, 1, 1, 1,
0.6247867, -0.7547363, 2.804136, 0, 0, 1, 1, 1,
0.6273131, 0.09679106, 0.7654355, 1, 0, 0, 1, 1,
0.637222, -0.2588176, 0.4937481, 1, 0, 0, 1, 1,
0.6382471, -0.8312427, 0.4315278, 1, 0, 0, 1, 1,
0.6407635, 1.046112, -0.1986327, 1, 0, 0, 1, 1,
0.6414171, -0.4199188, 0.967405, 1, 0, 0, 1, 1,
0.6461108, -1.236772, 2.357919, 0, 0, 0, 1, 1,
0.6463704, -0.7998075, 3.857069, 0, 0, 0, 1, 1,
0.6464523, -0.006166337, 2.421519, 0, 0, 0, 1, 1,
0.6490698, 0.5164457, 0.1799514, 0, 0, 0, 1, 1,
0.6517459, 0.7266495, 0.9694263, 0, 0, 0, 1, 1,
0.6520512, -0.5421446, 0.08267299, 0, 0, 0, 1, 1,
0.6537024, -1.11191, 1.99639, 0, 0, 0, 1, 1,
0.6545681, 1.123621, 0.6923815, 1, 1, 1, 1, 1,
0.6546856, -1.254258, 4.415968, 1, 1, 1, 1, 1,
0.6556038, -2.902598, 2.936098, 1, 1, 1, 1, 1,
0.6570882, 0.9987598, -0.680745, 1, 1, 1, 1, 1,
0.6579897, 0.3279952, 0.9790885, 1, 1, 1, 1, 1,
0.6611428, -0.7494601, 2.129359, 1, 1, 1, 1, 1,
0.6634094, -1.023902, 2.883457, 1, 1, 1, 1, 1,
0.6642786, -1.488112, 2.370933, 1, 1, 1, 1, 1,
0.6773949, 0.1081827, 1.462289, 1, 1, 1, 1, 1,
0.6785151, -0.4956234, 1.449334, 1, 1, 1, 1, 1,
0.6792681, 0.2988536, 1.859651, 1, 1, 1, 1, 1,
0.6802942, 1.670744, 0.5218846, 1, 1, 1, 1, 1,
0.6807609, -0.3670908, 0.8151492, 1, 1, 1, 1, 1,
0.6811496, -1.332531, 2.765511, 1, 1, 1, 1, 1,
0.6826454, -0.8855313, 2.998201, 1, 1, 1, 1, 1,
0.6897407, -1.555938, 1.49292, 0, 0, 1, 1, 1,
0.6962098, 0.6086267, 1.651969, 1, 0, 0, 1, 1,
0.6979595, 0.04519337, -0.1235251, 1, 0, 0, 1, 1,
0.7060362, 0.1074804, 2.188133, 1, 0, 0, 1, 1,
0.7143891, -0.4181004, 2.37814, 1, 0, 0, 1, 1,
0.7192866, 0.1084275, -0.06198207, 1, 0, 0, 1, 1,
0.7205011, -0.2699376, 2.271121, 0, 0, 0, 1, 1,
0.725721, 1.112864, 0.1465618, 0, 0, 0, 1, 1,
0.7265624, 1.977135, 0.2868648, 0, 0, 0, 1, 1,
0.7301347, -1.137977, 2.57809, 0, 0, 0, 1, 1,
0.7312365, 1.796891, 0.462034, 0, 0, 0, 1, 1,
0.7444659, -2.250792, 1.87144, 0, 0, 0, 1, 1,
0.744927, 0.4135464, 0.5195092, 0, 0, 0, 1, 1,
0.7518211, 0.7029737, 1.394346, 1, 1, 1, 1, 1,
0.7645217, -0.1561046, 1.652328, 1, 1, 1, 1, 1,
0.7647998, 1.516172, 1.5987, 1, 1, 1, 1, 1,
0.7676303, -1.453013, 2.661941, 1, 1, 1, 1, 1,
0.7716672, 0.733604, 0.2932753, 1, 1, 1, 1, 1,
0.7753175, 0.6484372, 1.370005, 1, 1, 1, 1, 1,
0.785768, -1.102831, 2.011812, 1, 1, 1, 1, 1,
0.7859899, -1.53239, 1.158686, 1, 1, 1, 1, 1,
0.7869922, 1.244522, 1.541065, 1, 1, 1, 1, 1,
0.7938724, 1.100338, 0.2570287, 1, 1, 1, 1, 1,
0.7951109, -0.9278054, 1.423881, 1, 1, 1, 1, 1,
0.7956794, 0.3237783, 3.406246, 1, 1, 1, 1, 1,
0.8030719, 0.1549086, 0.4893535, 1, 1, 1, 1, 1,
0.8043511, 0.9754179, 0.4165052, 1, 1, 1, 1, 1,
0.8059659, 0.4918947, 2.915745, 1, 1, 1, 1, 1,
0.8102377, -1.172556, 3.01997, 0, 0, 1, 1, 1,
0.8160883, 0.3265146, 1.254526, 1, 0, 0, 1, 1,
0.8256735, 0.6177085, 1.221917, 1, 0, 0, 1, 1,
0.8267121, -2.14607, 3.110089, 1, 0, 0, 1, 1,
0.8345619, -0.97355, 2.664424, 1, 0, 0, 1, 1,
0.8386282, 0.8897348, 1.039753, 1, 0, 0, 1, 1,
0.848002, 0.2043509, 3.247302, 0, 0, 0, 1, 1,
0.8480591, 1.250588, -0.06763236, 0, 0, 0, 1, 1,
0.849341, -0.6856202, 2.294286, 0, 0, 0, 1, 1,
0.8527539, -0.4972127, 4.432317, 0, 0, 0, 1, 1,
0.8555024, 0.2765022, 0.6460041, 0, 0, 0, 1, 1,
0.8556052, -1.503391, 1.89888, 0, 0, 0, 1, 1,
0.8594363, -1.170696, 1.967694, 0, 0, 0, 1, 1,
0.8619809, 1.172012, -0.8927584, 1, 1, 1, 1, 1,
0.8717632, 0.5256788, 0.6906654, 1, 1, 1, 1, 1,
0.8747097, 1.011195, 0.6584879, 1, 1, 1, 1, 1,
0.8808281, 0.8072935, 1.048451, 1, 1, 1, 1, 1,
0.8939223, 1.857875, 0.1809722, 1, 1, 1, 1, 1,
0.8955552, -0.4039082, 3.342546, 1, 1, 1, 1, 1,
0.9029959, 0.7972178, 2.94589, 1, 1, 1, 1, 1,
0.9103287, -0.5280737, 2.997112, 1, 1, 1, 1, 1,
0.9130093, 0.3389279, 2.055475, 1, 1, 1, 1, 1,
0.9134679, 2.420968, -0.4261738, 1, 1, 1, 1, 1,
0.9157214, -1.629472, 2.095242, 1, 1, 1, 1, 1,
0.932494, -2.086444, 1.833148, 1, 1, 1, 1, 1,
0.9353908, 0.08278343, 1.054467, 1, 1, 1, 1, 1,
0.9356479, -0.4640909, 3.179275, 1, 1, 1, 1, 1,
0.9358683, 0.3943697, 1.415747, 1, 1, 1, 1, 1,
0.9359634, 0.759567, 0.6550556, 0, 0, 1, 1, 1,
0.9428088, 0.260058, 0.8366647, 1, 0, 0, 1, 1,
0.9440556, -0.7086924, 1.9155, 1, 0, 0, 1, 1,
0.9559456, 0.001092979, 2.658626, 1, 0, 0, 1, 1,
0.9580172, -1.948419, 2.892701, 1, 0, 0, 1, 1,
0.9582026, 0.377805, 2.699528, 1, 0, 0, 1, 1,
0.9628382, -0.461859, 2.870086, 0, 0, 0, 1, 1,
0.9632424, -0.7097119, 0.3703926, 0, 0, 0, 1, 1,
0.9635959, -0.365781, 0.8180775, 0, 0, 0, 1, 1,
0.9639719, 0.9453465, 0.9993535, 0, 0, 0, 1, 1,
0.9649113, 1.264895, 1.725996, 0, 0, 0, 1, 1,
0.9692616, -0.09565026, 1.32726, 0, 0, 0, 1, 1,
0.9700955, 0.2274525, 2.818578, 0, 0, 0, 1, 1,
0.9757065, -0.8204284, 1.768828, 1, 1, 1, 1, 1,
0.976748, -0.06988598, 2.457243, 1, 1, 1, 1, 1,
0.9796489, 0.9747571, 0.9432047, 1, 1, 1, 1, 1,
0.9824495, -0.9945897, 1.355009, 1, 1, 1, 1, 1,
0.9864179, -2.646113, 4.574555, 1, 1, 1, 1, 1,
0.9866365, -1.85427, 3.798846, 1, 1, 1, 1, 1,
0.998758, -1.001104, 1.014884, 1, 1, 1, 1, 1,
1.00007, 0.3759146, 1.503024, 1, 1, 1, 1, 1,
1.000781, -0.2668824, 2.051618, 1, 1, 1, 1, 1,
1.002788, 0.8287182, 0.3083246, 1, 1, 1, 1, 1,
1.006582, 0.3994377, 1.152907, 1, 1, 1, 1, 1,
1.007879, 1.408951, 0.9039997, 1, 1, 1, 1, 1,
1.020271, -0.43187, 3.868688, 1, 1, 1, 1, 1,
1.023881, 0.4180265, 1.03768, 1, 1, 1, 1, 1,
1.026426, 0.6522128, 0.4265691, 1, 1, 1, 1, 1,
1.031062, -1.105137, 3.083699, 0, 0, 1, 1, 1,
1.032937, 0.7374056, 0.2123209, 1, 0, 0, 1, 1,
1.046416, 0.9139645, 1.805312, 1, 0, 0, 1, 1,
1.04873, -1.143477, 1.874973, 1, 0, 0, 1, 1,
1.053735, -1.34628, 1.324855, 1, 0, 0, 1, 1,
1.054072, 0.2238819, 2.866518, 1, 0, 0, 1, 1,
1.057763, 1.025875, 0.928892, 0, 0, 0, 1, 1,
1.058192, -1.505327, 1.835903, 0, 0, 0, 1, 1,
1.059822, -0.5999646, 3.533629, 0, 0, 0, 1, 1,
1.060741, 0.5554627, 3.030278, 0, 0, 0, 1, 1,
1.063043, 0.007589346, 0.316244, 0, 0, 0, 1, 1,
1.079574, -1.177541, 1.906802, 0, 0, 0, 1, 1,
1.08456, -0.4723338, 1.307591, 0, 0, 0, 1, 1,
1.099098, -1.515829, 2.334391, 1, 1, 1, 1, 1,
1.102834, 0.1821041, 1.240627, 1, 1, 1, 1, 1,
1.106983, -0.128142, 2.387832, 1, 1, 1, 1, 1,
1.110709, 0.5241451, 0.9408792, 1, 1, 1, 1, 1,
1.118639, -0.8804151, 3.095829, 1, 1, 1, 1, 1,
1.128609, -1.641976, -0.03156484, 1, 1, 1, 1, 1,
1.130518, -3.025403, 1.604021, 1, 1, 1, 1, 1,
1.1346, -0.3037692, 2.187859, 1, 1, 1, 1, 1,
1.143202, -1.035614, 3.377322, 1, 1, 1, 1, 1,
1.154435, 0.8838535, 0.442855, 1, 1, 1, 1, 1,
1.168695, 1.131985, 0.7422965, 1, 1, 1, 1, 1,
1.17589, -1.024253, 1.715919, 1, 1, 1, 1, 1,
1.176309, -0.2551993, 2.515079, 1, 1, 1, 1, 1,
1.176956, 0.3185733, 1.944631, 1, 1, 1, 1, 1,
1.177998, 0.2132213, 1.236268, 1, 1, 1, 1, 1,
1.188904, -0.429807, 1.565755, 0, 0, 1, 1, 1,
1.191321, 1.647938, 1.36351, 1, 0, 0, 1, 1,
1.194302, -0.7872732, 2.47491, 1, 0, 0, 1, 1,
1.208387, 0.0883555, 0.511395, 1, 0, 0, 1, 1,
1.214885, -0.6828615, 1.77938, 1, 0, 0, 1, 1,
1.217604, 0.2272, 0.1044703, 1, 0, 0, 1, 1,
1.224906, -1.074429, 1.841046, 0, 0, 0, 1, 1,
1.228768, 0.3657648, 1.085478, 0, 0, 0, 1, 1,
1.230126, -1.725667, 2.599976, 0, 0, 0, 1, 1,
1.240373, -1.977887, 3.280758, 0, 0, 0, 1, 1,
1.244708, -0.9060183, 2.129327, 0, 0, 0, 1, 1,
1.252747, -0.1767009, 3.116924, 0, 0, 0, 1, 1,
1.262026, 0.2275696, 0.5472694, 0, 0, 0, 1, 1,
1.263432, -0.809546, 2.564166, 1, 1, 1, 1, 1,
1.267987, 0.7044562, 1.018454, 1, 1, 1, 1, 1,
1.26908, -1.370729, 2.1928, 1, 1, 1, 1, 1,
1.274639, -1.077245, 2.610154, 1, 1, 1, 1, 1,
1.28234, -0.2082322, 1.993966, 1, 1, 1, 1, 1,
1.287989, 0.7829233, 0.9345259, 1, 1, 1, 1, 1,
1.299961, 1.673031, -0.05721026, 1, 1, 1, 1, 1,
1.300298, 0.9969033, -1.777948, 1, 1, 1, 1, 1,
1.300793, 0.7652095, 0.9479758, 1, 1, 1, 1, 1,
1.30233, -1.312529, 2.853781, 1, 1, 1, 1, 1,
1.309518, -0.5078455, 2.220018, 1, 1, 1, 1, 1,
1.323019, -0.1789674, -0.7235856, 1, 1, 1, 1, 1,
1.327994, -0.3379953, 1.301175, 1, 1, 1, 1, 1,
1.333457, -1.17523, 1.962379, 1, 1, 1, 1, 1,
1.338404, -0.8707833, 3.251818, 1, 1, 1, 1, 1,
1.342175, -0.4147018, 1.052179, 0, 0, 1, 1, 1,
1.356771, 0.9126326, 1.675282, 1, 0, 0, 1, 1,
1.359856, -0.1900416, 2.941393, 1, 0, 0, 1, 1,
1.36875, -0.3942352, 1.658532, 1, 0, 0, 1, 1,
1.374856, -1.606085, 1.80615, 1, 0, 0, 1, 1,
1.377121, 0.6577428, -0.1006419, 1, 0, 0, 1, 1,
1.378418, 2.256601, -0.3891766, 0, 0, 0, 1, 1,
1.3854, 0.5794162, 4.375516, 0, 0, 0, 1, 1,
1.395501, 0.5820032, 0.6156644, 0, 0, 0, 1, 1,
1.399252, -0.9024339, -0.1674191, 0, 0, 0, 1, 1,
1.40507, 0.4421418, 0.6895636, 0, 0, 0, 1, 1,
1.40676, 0.2808063, 1.439029, 0, 0, 0, 1, 1,
1.420133, -1.63093, 2.532829, 0, 0, 0, 1, 1,
1.440307, 0.5056662, 2.727196, 1, 1, 1, 1, 1,
1.442606, -1.120745, 1.557264, 1, 1, 1, 1, 1,
1.447377, -0.1253014, 1.48006, 1, 1, 1, 1, 1,
1.456968, 2.021106, -0.2710064, 1, 1, 1, 1, 1,
1.464409, 0.5703018, 1.624139, 1, 1, 1, 1, 1,
1.477163, -1.183128, 1.543771, 1, 1, 1, 1, 1,
1.480518, 1.914564, 0.8816544, 1, 1, 1, 1, 1,
1.482303, -0.5217589, 1.304375, 1, 1, 1, 1, 1,
1.486569, 0.7724302, 0.9293432, 1, 1, 1, 1, 1,
1.493134, -0.1203453, 3.180769, 1, 1, 1, 1, 1,
1.497605, -1.405266, 3.885031, 1, 1, 1, 1, 1,
1.500669, 1.051036, 0.8385761, 1, 1, 1, 1, 1,
1.501986, -0.2809108, 2.357572, 1, 1, 1, 1, 1,
1.50739, 0.2871094, 0.7025481, 1, 1, 1, 1, 1,
1.514402, -0.7897971, 2.03922, 1, 1, 1, 1, 1,
1.520266, 0.7600212, 1.762727, 0, 0, 1, 1, 1,
1.520488, -0.8209826, 2.666931, 1, 0, 0, 1, 1,
1.536062, 1.22431, 0.0008712587, 1, 0, 0, 1, 1,
1.541751, -0.01269429, 1.456319, 1, 0, 0, 1, 1,
1.550109, -0.527496, 2.446729, 1, 0, 0, 1, 1,
1.552832, -0.2956419, 1.074304, 1, 0, 0, 1, 1,
1.555499, -0.4554679, 1.789868, 0, 0, 0, 1, 1,
1.562323, 0.1024235, 1.765744, 0, 0, 0, 1, 1,
1.56689, -0.6560798, 0.5521107, 0, 0, 0, 1, 1,
1.594661, 0.6312188, 2.465945, 0, 0, 0, 1, 1,
1.606164, 0.1883091, 0.9752387, 0, 0, 0, 1, 1,
1.621454, 0.3188502, 1.472703, 0, 0, 0, 1, 1,
1.623656, 0.6867173, 0.6755634, 0, 0, 0, 1, 1,
1.625526, -1.501624, 2.190595, 1, 1, 1, 1, 1,
1.682815, 1.58236, 0.9390265, 1, 1, 1, 1, 1,
1.682869, -0.1844199, 2.468605, 1, 1, 1, 1, 1,
1.690298, 0.2560344, 1.673111, 1, 1, 1, 1, 1,
1.709378, 0.7222565, 2.442956, 1, 1, 1, 1, 1,
1.722797, 0.7705479, -0.4625757, 1, 1, 1, 1, 1,
1.723953, 2.185334, -0.512976, 1, 1, 1, 1, 1,
1.761847, -1.511589, 3.263739, 1, 1, 1, 1, 1,
1.780989, -0.2475954, 1.5135, 1, 1, 1, 1, 1,
1.794153, 0.4540335, 1.296677, 1, 1, 1, 1, 1,
1.835788, -0.08330432, 3.017921, 1, 1, 1, 1, 1,
1.838235, 0.7439249, 3.238992, 1, 1, 1, 1, 1,
1.847784, -0.5478195, 4.031025, 1, 1, 1, 1, 1,
1.878305, -0.2680748, 1.103757, 1, 1, 1, 1, 1,
1.971437, -0.4285648, 1.418909, 1, 1, 1, 1, 1,
1.981833, 0.05313415, 0.8805073, 0, 0, 1, 1, 1,
2.007093, 0.1922375, 1.588865, 1, 0, 0, 1, 1,
2.022105, 0.2496545, 1.758018, 1, 0, 0, 1, 1,
2.026201, 0.2628872, 1.36911, 1, 0, 0, 1, 1,
2.060263, -0.6526147, 3.198133, 1, 0, 0, 1, 1,
2.098069, 1.749506, 0.8996049, 1, 0, 0, 1, 1,
2.100993, 0.6387409, 0.8046631, 0, 0, 0, 1, 1,
2.237224, -0.5804292, -0.02060455, 0, 0, 0, 1, 1,
2.311142, -0.5258213, 1.956973, 0, 0, 0, 1, 1,
2.326847, -0.146119, 2.180536, 0, 0, 0, 1, 1,
2.387525, 0.2102869, 1.529153, 0, 0, 0, 1, 1,
2.422374, -0.2570401, 2.002102, 0, 0, 0, 1, 1,
2.429347, 2.245406, 1.179293, 0, 0, 0, 1, 1,
2.494539, -1.115422, 2.078772, 1, 1, 1, 1, 1,
2.523076, -0.03538743, 1.105251, 1, 1, 1, 1, 1,
2.727574, -0.02627127, 3.075384, 1, 1, 1, 1, 1,
2.742948, -0.1261066, 1.884828, 1, 1, 1, 1, 1,
2.75771, 0.9799467, 2.242858, 1, 1, 1, 1, 1,
2.863595, -0.031437, 0.8403686, 1, 1, 1, 1, 1,
3.252573, -0.7107422, 1.796797, 1, 1, 1, 1, 1
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
var radius = 9.623374;
var distance = 33.80169;
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
mvMatrix.translate( -0.2368749, -0.1636488, 0.3607626 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.80169);
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
