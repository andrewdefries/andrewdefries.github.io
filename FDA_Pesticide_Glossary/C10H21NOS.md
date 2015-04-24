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
-2.753586, -0.01617253, -1.582797, 1, 0, 0, 1,
-2.608221, -0.3740879, -1.714035, 1, 0.007843138, 0, 1,
-2.563565, -0.30197, -1.273631, 1, 0.01176471, 0, 1,
-2.534748, -0.607132, -2.907897, 1, 0.01960784, 0, 1,
-2.530389, -1.505098, -0.9813359, 1, 0.02352941, 0, 1,
-2.486217, -0.2973221, -0.553369, 1, 0.03137255, 0, 1,
-2.475284, 1.097429, -2.407876, 1, 0.03529412, 0, 1,
-2.457078, 0.9855366, -0.1350574, 1, 0.04313726, 0, 1,
-2.446056, 0.7584912, -1.894188, 1, 0.04705882, 0, 1,
-2.436325, 0.1700349, -0.371206, 1, 0.05490196, 0, 1,
-2.42667, 0.06510586, -2.430094, 1, 0.05882353, 0, 1,
-2.342106, -1.562509, -0.5880755, 1, 0.06666667, 0, 1,
-2.326498, 0.8279632, -0.8878488, 1, 0.07058824, 0, 1,
-2.318468, 0.2666212, -2.059288, 1, 0.07843138, 0, 1,
-2.247111, -0.4095923, -0.2345085, 1, 0.08235294, 0, 1,
-2.237655, 0.9061919, -1.225446, 1, 0.09019608, 0, 1,
-2.103672, 1.794733, 1.81375, 1, 0.09411765, 0, 1,
-2.086181, 0.5474373, -1.680718, 1, 0.1019608, 0, 1,
-2.081382, 0.5314754, 0.05362443, 1, 0.1098039, 0, 1,
-2.078655, 0.2246209, -0.3780337, 1, 0.1137255, 0, 1,
-2.078402, 1.30559, -1.551579, 1, 0.1215686, 0, 1,
-2.048556, 1.217474, -0.5140626, 1, 0.1254902, 0, 1,
-2.039792, -0.3757989, -2.114244, 1, 0.1333333, 0, 1,
-2.027791, -1.351674, -1.280794, 1, 0.1372549, 0, 1,
-2.019644, -0.5778687, -0.6092995, 1, 0.145098, 0, 1,
-1.951412, 0.6090853, -1.919759, 1, 0.1490196, 0, 1,
-1.915083, 0.09056698, -1.60638, 1, 0.1568628, 0, 1,
-1.900338, 1.075443, 1.824404, 1, 0.1607843, 0, 1,
-1.89418, -1.030843, -2.430127, 1, 0.1686275, 0, 1,
-1.875272, 2.015146, -0.07848653, 1, 0.172549, 0, 1,
-1.850976, 0.06613111, -1.831285, 1, 0.1803922, 0, 1,
-1.846902, -0.164991, -1.366194, 1, 0.1843137, 0, 1,
-1.842135, 0.2974084, -0.880678, 1, 0.1921569, 0, 1,
-1.824733, 2.098279, -0.06833022, 1, 0.1960784, 0, 1,
-1.824589, -0.9062589, -2.171557, 1, 0.2039216, 0, 1,
-1.824283, 0.11356, -2.11729, 1, 0.2117647, 0, 1,
-1.821764, -0.3297559, -2.000849, 1, 0.2156863, 0, 1,
-1.819274, -1.010052, -2.383379, 1, 0.2235294, 0, 1,
-1.8121, -0.08174911, -1.055791, 1, 0.227451, 0, 1,
-1.809524, -0.6891978, -1.253294, 1, 0.2352941, 0, 1,
-1.797156, -0.7505597, -1.173799, 1, 0.2392157, 0, 1,
-1.788111, -0.7123443, -2.297497, 1, 0.2470588, 0, 1,
-1.759477, -0.2096133, -0.8753361, 1, 0.2509804, 0, 1,
-1.756877, 1.137825, -0.6287801, 1, 0.2588235, 0, 1,
-1.740962, -0.6042778, 0.09567647, 1, 0.2627451, 0, 1,
-1.726977, 0.6367009, -0.6384307, 1, 0.2705882, 0, 1,
-1.72055, -1.064455, -2.381445, 1, 0.2745098, 0, 1,
-1.718265, 0.6707085, -1.908515, 1, 0.282353, 0, 1,
-1.701945, 1.481369, -2.093199, 1, 0.2862745, 0, 1,
-1.681536, -0.04573404, -0.7915575, 1, 0.2941177, 0, 1,
-1.669496, -0.3019749, -0.4713167, 1, 0.3019608, 0, 1,
-1.666714, 0.6752208, -2.570571, 1, 0.3058824, 0, 1,
-1.649013, -0.2994262, -2.944459, 1, 0.3137255, 0, 1,
-1.647322, -1.151022, -1.961055, 1, 0.3176471, 0, 1,
-1.639005, -0.2997756, -2.139714, 1, 0.3254902, 0, 1,
-1.633863, 0.04886007, -1.592842, 1, 0.3294118, 0, 1,
-1.630342, 0.5100599, -1.951116, 1, 0.3372549, 0, 1,
-1.617042, 0.1592015, -3.39576, 1, 0.3411765, 0, 1,
-1.61473, -1.552257, -2.494545, 1, 0.3490196, 0, 1,
-1.613185, 0.6950422, 0.07218727, 1, 0.3529412, 0, 1,
-1.60738, 0.3587075, -0.9270622, 1, 0.3607843, 0, 1,
-1.60379, -0.3538869, -1.808949, 1, 0.3647059, 0, 1,
-1.599489, 0.8575028, -1.948287, 1, 0.372549, 0, 1,
-1.593119, 0.8084793, -1.45097, 1, 0.3764706, 0, 1,
-1.579042, -0.320999, -1.782765, 1, 0.3843137, 0, 1,
-1.56516, 0.8169839, -1.320097, 1, 0.3882353, 0, 1,
-1.556462, 0.515731, -3.167807, 1, 0.3960784, 0, 1,
-1.543665, -0.6082475, -1.130412, 1, 0.4039216, 0, 1,
-1.531838, -1.087068, -1.73783, 1, 0.4078431, 0, 1,
-1.52222, -0.5633711, -4.367563, 1, 0.4156863, 0, 1,
-1.504454, 0.3085107, -0.7479981, 1, 0.4196078, 0, 1,
-1.499683, 1.192222, -0.289872, 1, 0.427451, 0, 1,
-1.490963, 1.174998, -1.110575, 1, 0.4313726, 0, 1,
-1.487342, 1.400487, -1.79302, 1, 0.4392157, 0, 1,
-1.481624, 2.160913, -0.6373781, 1, 0.4431373, 0, 1,
-1.473448, -0.3301035, -2.87667, 1, 0.4509804, 0, 1,
-1.462641, -1.064548, -2.085474, 1, 0.454902, 0, 1,
-1.460796, 0.6540735, -1.034159, 1, 0.4627451, 0, 1,
-1.459551, 0.08327205, -1.288184, 1, 0.4666667, 0, 1,
-1.452921, 0.7199796, -2.428439, 1, 0.4745098, 0, 1,
-1.447957, -1.073293, -2.11694, 1, 0.4784314, 0, 1,
-1.443332, -1.534187, -2.487171, 1, 0.4862745, 0, 1,
-1.439904, 0.8585988, -3.146518, 1, 0.4901961, 0, 1,
-1.438596, -1.165061, -2.105485, 1, 0.4980392, 0, 1,
-1.43372, 0.6957178, -1.544581, 1, 0.5058824, 0, 1,
-1.426824, 0.9986133, -1.391398, 1, 0.509804, 0, 1,
-1.425656, -0.9367034, -3.138934, 1, 0.5176471, 0, 1,
-1.412521, 0.7433702, -0.9568716, 1, 0.5215687, 0, 1,
-1.412383, 0.3782175, -2.267255, 1, 0.5294118, 0, 1,
-1.405692, -0.4444187, -1.817744, 1, 0.5333334, 0, 1,
-1.402838, -0.3743613, -3.303386, 1, 0.5411765, 0, 1,
-1.401052, -0.5925483, -0.6187735, 1, 0.5450981, 0, 1,
-1.378584, 0.2722891, 0.01986262, 1, 0.5529412, 0, 1,
-1.377106, -0.7862683, -3.247446, 1, 0.5568628, 0, 1,
-1.370572, 1.885828, -1.217467, 1, 0.5647059, 0, 1,
-1.36895, 0.1508091, -1.505102, 1, 0.5686275, 0, 1,
-1.363616, 1.210103, -1.299489, 1, 0.5764706, 0, 1,
-1.363464, 0.2028644, -0.9676924, 1, 0.5803922, 0, 1,
-1.35865, 1.05147, 0.1454504, 1, 0.5882353, 0, 1,
-1.356934, -0.8003681, -1.568279, 1, 0.5921569, 0, 1,
-1.350787, 2.995827, -1.155859, 1, 0.6, 0, 1,
-1.346838, 0.392012, -1.225394, 1, 0.6078432, 0, 1,
-1.328466, 0.1124394, -0.6963395, 1, 0.6117647, 0, 1,
-1.327218, -0.500967, -1.151118, 1, 0.6196079, 0, 1,
-1.319738, -1.660673, -3.68939, 1, 0.6235294, 0, 1,
-1.316177, 0.2041384, -1.195809, 1, 0.6313726, 0, 1,
-1.314338, -0.445711, -1.184687, 1, 0.6352941, 0, 1,
-1.295042, 1.858111, -0.2731278, 1, 0.6431373, 0, 1,
-1.281531, -0.848807, -1.751654, 1, 0.6470588, 0, 1,
-1.278971, 0.7544824, 0.2993954, 1, 0.654902, 0, 1,
-1.272533, 0.2437364, -0.2185816, 1, 0.6588235, 0, 1,
-1.271029, -1.962514, -1.913804, 1, 0.6666667, 0, 1,
-1.253103, -1.307383, -2.608366, 1, 0.6705883, 0, 1,
-1.250237, -1.034518, -1.71842, 1, 0.6784314, 0, 1,
-1.242001, -1.374783, -2.774347, 1, 0.682353, 0, 1,
-1.2253, 0.1629016, -1.374772, 1, 0.6901961, 0, 1,
-1.210798, 0.3166432, -0.9837397, 1, 0.6941177, 0, 1,
-1.210329, 0.9619315, -1.69459, 1, 0.7019608, 0, 1,
-1.206204, -0.1918202, -0.3629079, 1, 0.7098039, 0, 1,
-1.202534, 0.8483356, -0.2328536, 1, 0.7137255, 0, 1,
-1.197592, 1.904952, -2.556453, 1, 0.7215686, 0, 1,
-1.192315, -0.03833192, -1.689159, 1, 0.7254902, 0, 1,
-1.184409, -2.350543, -2.135036, 1, 0.7333333, 0, 1,
-1.178737, 0.4109201, -2.792271, 1, 0.7372549, 0, 1,
-1.166789, 0.7946376, -1.906934, 1, 0.7450981, 0, 1,
-1.162791, -0.6422095, -1.167917, 1, 0.7490196, 0, 1,
-1.162117, 0.5249606, -2.182928, 1, 0.7568628, 0, 1,
-1.158918, 1.493469, -2.197852, 1, 0.7607843, 0, 1,
-1.140648, -1.648867, -2.002882, 1, 0.7686275, 0, 1,
-1.129044, 1.40434, -0.8718519, 1, 0.772549, 0, 1,
-1.12714, -2.547015, -3.615806, 1, 0.7803922, 0, 1,
-1.126502, 0.8586849, -0.2018932, 1, 0.7843137, 0, 1,
-1.126183, 0.4938078, -1.879284, 1, 0.7921569, 0, 1,
-1.124764, -1.370178, -2.761603, 1, 0.7960784, 0, 1,
-1.112296, 0.1838916, -0.479779, 1, 0.8039216, 0, 1,
-1.104419, 0.2927105, -0.9407202, 1, 0.8117647, 0, 1,
-1.104403, -1.153925, -2.568181, 1, 0.8156863, 0, 1,
-1.098572, -1.50895, -3.202062, 1, 0.8235294, 0, 1,
-1.098451, 1.012313, -1.865765, 1, 0.827451, 0, 1,
-1.096344, 0.7308501, -0.9444777, 1, 0.8352941, 0, 1,
-1.096238, 0.250455, -3.962521, 1, 0.8392157, 0, 1,
-1.086595, 0.08447736, -3.065248, 1, 0.8470588, 0, 1,
-1.086484, -0.7762496, -1.271433, 1, 0.8509804, 0, 1,
-1.075393, 0.7526178, -0.0726047, 1, 0.8588235, 0, 1,
-1.070363, -0.6087262, -2.425497, 1, 0.8627451, 0, 1,
-1.068988, -0.3204082, -1.793644, 1, 0.8705882, 0, 1,
-1.066523, 0.1377723, -0.6876332, 1, 0.8745098, 0, 1,
-1.065971, 0.04635833, -1.491389, 1, 0.8823529, 0, 1,
-1.063472, -0.6558325, -1.867744, 1, 0.8862745, 0, 1,
-1.057819, 0.03378423, -1.804716, 1, 0.8941177, 0, 1,
-1.055241, -1.572898, -1.866574, 1, 0.8980392, 0, 1,
-1.052299, 0.6757887, -0.2899078, 1, 0.9058824, 0, 1,
-1.049633, 0.4768086, -2.418287, 1, 0.9137255, 0, 1,
-1.044239, -0.9048918, -3.450963, 1, 0.9176471, 0, 1,
-1.039876, -0.3221243, -0.1497147, 1, 0.9254902, 0, 1,
-1.039832, -0.2111316, 0.1386104, 1, 0.9294118, 0, 1,
-1.039002, 1.81208, 0.2507659, 1, 0.9372549, 0, 1,
-1.035251, -0.562931, -2.44553, 1, 0.9411765, 0, 1,
-1.034038, 0.2996231, -1.320508, 1, 0.9490196, 0, 1,
-1.030853, -2.197324, -4.183055, 1, 0.9529412, 0, 1,
-1.023242, -0.817753, -2.565433, 1, 0.9607843, 0, 1,
-1.002365, 0.4620073, -1.636592, 1, 0.9647059, 0, 1,
-0.997708, -1.537894, -2.876223, 1, 0.972549, 0, 1,
-0.9926189, 1.484469, -0.5429829, 1, 0.9764706, 0, 1,
-0.9907621, -0.02473961, -1.297152, 1, 0.9843137, 0, 1,
-0.9876691, 0.7937929, -0.6668938, 1, 0.9882353, 0, 1,
-0.9752568, 1.361331, -0.07746063, 1, 0.9960784, 0, 1,
-0.9749781, -0.1410041, -0.4675538, 0.9960784, 1, 0, 1,
-0.9599873, -1.155411, -1.533101, 0.9921569, 1, 0, 1,
-0.9584043, 1.366632, -0.4094593, 0.9843137, 1, 0, 1,
-0.951638, -0.722321, -3.180394, 0.9803922, 1, 0, 1,
-0.9508829, 0.2763063, -1.564384, 0.972549, 1, 0, 1,
-0.9408919, 0.4224109, -0.02825078, 0.9686275, 1, 0, 1,
-0.9397934, -0.09288833, -2.136309, 0.9607843, 1, 0, 1,
-0.9294459, 1.363214, -0.9721409, 0.9568627, 1, 0, 1,
-0.9261298, 1.250552, -2.222937, 0.9490196, 1, 0, 1,
-0.9260647, -0.3997643, -1.730098, 0.945098, 1, 0, 1,
-0.9120083, 0.3181485, -1.057874, 0.9372549, 1, 0, 1,
-0.9110463, -0.7500152, -3.488307, 0.9333333, 1, 0, 1,
-0.9097764, -0.6488863, -0.5993834, 0.9254902, 1, 0, 1,
-0.9049032, -0.2650567, 0.01126876, 0.9215686, 1, 0, 1,
-0.8963305, 0.4688951, -1.876483, 0.9137255, 1, 0, 1,
-0.8948131, -0.3864554, -2.054787, 0.9098039, 1, 0, 1,
-0.8890184, 0.654659, -1.246529, 0.9019608, 1, 0, 1,
-0.8849599, 0.5271474, 0.4063572, 0.8941177, 1, 0, 1,
-0.8828775, 0.13002, -1.092487, 0.8901961, 1, 0, 1,
-0.8823053, 0.259752, 0.3637027, 0.8823529, 1, 0, 1,
-0.8766494, 0.1156557, -0.5630228, 0.8784314, 1, 0, 1,
-0.8726536, 0.3473427, -0.8710063, 0.8705882, 1, 0, 1,
-0.8650932, -1.203064, -3.27545, 0.8666667, 1, 0, 1,
-0.8555554, 0.8610157, -0.4242813, 0.8588235, 1, 0, 1,
-0.8552855, 0.5557272, -2.457926, 0.854902, 1, 0, 1,
-0.8513564, 0.8414723, -1.605614, 0.8470588, 1, 0, 1,
-0.8477666, 0.3500107, -3.179785, 0.8431373, 1, 0, 1,
-0.8448759, 1.860252, -0.5868256, 0.8352941, 1, 0, 1,
-0.8324326, 0.1493066, -1.996493, 0.8313726, 1, 0, 1,
-0.8254801, 0.727421, 0.3438405, 0.8235294, 1, 0, 1,
-0.8201839, 0.2308202, -1.39905, 0.8196079, 1, 0, 1,
-0.81178, -0.9992087, -2.722697, 0.8117647, 1, 0, 1,
-0.8090505, -0.2201295, -0.06280571, 0.8078431, 1, 0, 1,
-0.799728, -1.28253, -3.338305, 0.8, 1, 0, 1,
-0.7981175, 0.4056758, -1.15363, 0.7921569, 1, 0, 1,
-0.7856139, -0.08107555, -2.171692, 0.7882353, 1, 0, 1,
-0.7812356, -1.323028, -2.596695, 0.7803922, 1, 0, 1,
-0.7680672, 0.06923252, -2.662299, 0.7764706, 1, 0, 1,
-0.7626196, 2.082829, -2.67398, 0.7686275, 1, 0, 1,
-0.7615843, -0.7374161, -1.433914, 0.7647059, 1, 0, 1,
-0.7602698, 0.7258998, -3.80953, 0.7568628, 1, 0, 1,
-0.7582411, 0.9089196, -0.1523709, 0.7529412, 1, 0, 1,
-0.7512779, 0.2754962, -1.335222, 0.7450981, 1, 0, 1,
-0.7505615, 2.250844, -0.6094704, 0.7411765, 1, 0, 1,
-0.7503392, -0.3710936, -0.8023629, 0.7333333, 1, 0, 1,
-0.7494894, -0.199415, -2.041871, 0.7294118, 1, 0, 1,
-0.7476777, -0.08558529, -1.447319, 0.7215686, 1, 0, 1,
-0.7435641, 1.050685, -0.7654346, 0.7176471, 1, 0, 1,
-0.7409208, -0.05544081, -1.950841, 0.7098039, 1, 0, 1,
-0.7362661, 0.9395374, -0.9917018, 0.7058824, 1, 0, 1,
-0.7343423, 0.6259496, -2.062309, 0.6980392, 1, 0, 1,
-0.733884, 0.3889392, -0.7643396, 0.6901961, 1, 0, 1,
-0.7232485, -0.2728089, -1.555024, 0.6862745, 1, 0, 1,
-0.7208368, 1.60474, -0.9047996, 0.6784314, 1, 0, 1,
-0.714619, -0.02417365, -3.12983, 0.6745098, 1, 0, 1,
-0.7051085, 0.190615, -1.645416, 0.6666667, 1, 0, 1,
-0.7032676, -0.04512926, -1.32047, 0.6627451, 1, 0, 1,
-0.6995241, -1.469815, -1.395743, 0.654902, 1, 0, 1,
-0.6991391, -1.346555, -3.074879, 0.6509804, 1, 0, 1,
-0.6986285, 0.0874211, 0.1908838, 0.6431373, 1, 0, 1,
-0.6973262, -0.9182047, -2.035816, 0.6392157, 1, 0, 1,
-0.6931298, -0.3643208, -0.5675253, 0.6313726, 1, 0, 1,
-0.68629, -0.5798618, -1.517932, 0.627451, 1, 0, 1,
-0.681013, 0.3500002, -1.565313, 0.6196079, 1, 0, 1,
-0.6770359, 0.04370464, -1.745789, 0.6156863, 1, 0, 1,
-0.6767475, 1.426362, -0.2854639, 0.6078432, 1, 0, 1,
-0.6683517, -0.7223873, -1.924354, 0.6039216, 1, 0, 1,
-0.6671891, -1.249369, -2.275273, 0.5960785, 1, 0, 1,
-0.6626204, -0.08375134, -2.217019, 0.5882353, 1, 0, 1,
-0.6589909, 0.5218008, -0.174533, 0.5843138, 1, 0, 1,
-0.6566967, -0.2231277, -1.594537, 0.5764706, 1, 0, 1,
-0.653574, -0.6932843, -2.049324, 0.572549, 1, 0, 1,
-0.645947, -0.2458752, -2.557849, 0.5647059, 1, 0, 1,
-0.6410456, 0.28346, -0.7157984, 0.5607843, 1, 0, 1,
-0.6373374, 1.508203, 0.6538646, 0.5529412, 1, 0, 1,
-0.6359013, 2.119247, -0.8109068, 0.5490196, 1, 0, 1,
-0.63385, 1.132339, -0.4324746, 0.5411765, 1, 0, 1,
-0.6249871, 0.5160443, -1.12632, 0.5372549, 1, 0, 1,
-0.6181648, -1.155651, -0.8592462, 0.5294118, 1, 0, 1,
-0.6177269, -0.3156918, -2.430764, 0.5254902, 1, 0, 1,
-0.6141648, 0.1080023, -1.84381, 0.5176471, 1, 0, 1,
-0.6086569, -0.06225492, -0.6505615, 0.5137255, 1, 0, 1,
-0.6033354, 0.8182327, -0.9175754, 0.5058824, 1, 0, 1,
-0.6027991, -0.5600597, -2.755083, 0.5019608, 1, 0, 1,
-0.6014355, -0.1723031, -0.9805083, 0.4941176, 1, 0, 1,
-0.5980915, -1.056902, -1.835728, 0.4862745, 1, 0, 1,
-0.5969217, 0.54691, -0.3570011, 0.4823529, 1, 0, 1,
-0.5886862, 0.7799308, -0.7680804, 0.4745098, 1, 0, 1,
-0.5880861, -0.05174479, -2.314683, 0.4705882, 1, 0, 1,
-0.5858037, -0.3248034, -1.639956, 0.4627451, 1, 0, 1,
-0.5838862, 0.02988961, -2.225572, 0.4588235, 1, 0, 1,
-0.582705, 0.7531816, 0.07119552, 0.4509804, 1, 0, 1,
-0.5826033, 0.7755748, -0.3477353, 0.4470588, 1, 0, 1,
-0.582422, -0.7785741, -2.931435, 0.4392157, 1, 0, 1,
-0.5765136, -0.2100697, -1.478675, 0.4352941, 1, 0, 1,
-0.5740336, 0.2544727, -1.08964, 0.427451, 1, 0, 1,
-0.5716717, -0.7030373, -0.7201077, 0.4235294, 1, 0, 1,
-0.5686461, 0.5608502, -1.136125, 0.4156863, 1, 0, 1,
-0.5578498, -0.8236644, -2.204819, 0.4117647, 1, 0, 1,
-0.5530254, 1.65976, -1.405031, 0.4039216, 1, 0, 1,
-0.5477885, 0.8890389, -1.229692, 0.3960784, 1, 0, 1,
-0.547344, 0.399875, -1.372873, 0.3921569, 1, 0, 1,
-0.5414733, -0.6270517, -2.951951, 0.3843137, 1, 0, 1,
-0.5379435, -0.3580286, -1.764946, 0.3803922, 1, 0, 1,
-0.5364323, 0.7385901, -0.1655935, 0.372549, 1, 0, 1,
-0.534335, -0.4644305, -1.648768, 0.3686275, 1, 0, 1,
-0.5334411, 0.005695661, -2.008323, 0.3607843, 1, 0, 1,
-0.5329652, -1.43374, -2.892369, 0.3568628, 1, 0, 1,
-0.5302019, 0.747555, 0.8299199, 0.3490196, 1, 0, 1,
-0.5242797, 1.157901, -0.4820493, 0.345098, 1, 0, 1,
-0.5196903, 0.5157502, -3.096396, 0.3372549, 1, 0, 1,
-0.5190054, -0.009430423, -1.9791, 0.3333333, 1, 0, 1,
-0.5171393, -1.245729, -3.83198, 0.3254902, 1, 0, 1,
-0.5131859, 1.128935, -1.509655, 0.3215686, 1, 0, 1,
-0.512133, -1.507166, -0.6903817, 0.3137255, 1, 0, 1,
-0.5113147, -0.9072595, -2.849502, 0.3098039, 1, 0, 1,
-0.5102914, 0.5531471, -1.072886, 0.3019608, 1, 0, 1,
-0.5087344, 0.2364814, 0.4878701, 0.2941177, 1, 0, 1,
-0.5066597, 0.3350301, -1.743927, 0.2901961, 1, 0, 1,
-0.5063524, 1.358383, -0.03323572, 0.282353, 1, 0, 1,
-0.4996201, -0.4855852, -3.016139, 0.2784314, 1, 0, 1,
-0.4986861, 0.1618069, -1.5165, 0.2705882, 1, 0, 1,
-0.4984559, 0.02801396, -1.537001, 0.2666667, 1, 0, 1,
-0.4971975, 1.312566, 0.3273248, 0.2588235, 1, 0, 1,
-0.4865391, 0.8739392, -2.456369, 0.254902, 1, 0, 1,
-0.4794466, -1.250106, -1.740292, 0.2470588, 1, 0, 1,
-0.4718617, -0.3538701, -1.997051, 0.2431373, 1, 0, 1,
-0.4711625, -2.141766, -3.272171, 0.2352941, 1, 0, 1,
-0.466368, 0.8466418, -0.2557105, 0.2313726, 1, 0, 1,
-0.465324, -0.7500706, -3.060249, 0.2235294, 1, 0, 1,
-0.4648619, -0.4712587, -1.230738, 0.2196078, 1, 0, 1,
-0.4637137, -0.6756273, -1.001621, 0.2117647, 1, 0, 1,
-0.4622346, 0.6370304, -1.582561, 0.2078431, 1, 0, 1,
-0.4589838, 0.08853143, -1.858701, 0.2, 1, 0, 1,
-0.4587664, 0.5838433, -0.9840388, 0.1921569, 1, 0, 1,
-0.4585949, -2.110228, -3.239419, 0.1882353, 1, 0, 1,
-0.4569726, -0.2046329, -2.661368, 0.1803922, 1, 0, 1,
-0.4536071, 0.4322985, -0.1669506, 0.1764706, 1, 0, 1,
-0.4531211, -0.2189169, -1.825841, 0.1686275, 1, 0, 1,
-0.4498166, 0.04119807, -1.458299, 0.1647059, 1, 0, 1,
-0.4485852, 0.329593, -0.650887, 0.1568628, 1, 0, 1,
-0.4485005, 0.9547839, -1.025379, 0.1529412, 1, 0, 1,
-0.4478369, -1.325428, -1.744621, 0.145098, 1, 0, 1,
-0.4421826, 1.570122, -1.176793, 0.1411765, 1, 0, 1,
-0.4344719, -0.5453281, -2.456482, 0.1333333, 1, 0, 1,
-0.4338191, -1.954567, -4.03276, 0.1294118, 1, 0, 1,
-0.4320816, 1.883993, -0.4383128, 0.1215686, 1, 0, 1,
-0.4307782, 0.6866884, -0.2880328, 0.1176471, 1, 0, 1,
-0.4257841, 0.3781815, -2.650555, 0.1098039, 1, 0, 1,
-0.4172951, -0.3998518, -1.360995, 0.1058824, 1, 0, 1,
-0.4148228, -1.2866, -2.335187, 0.09803922, 1, 0, 1,
-0.4118612, 0.09309854, -2.441572, 0.09019608, 1, 0, 1,
-0.4075862, -2.66003, -2.294716, 0.08627451, 1, 0, 1,
-0.4048609, -0.810048, -3.378446, 0.07843138, 1, 0, 1,
-0.3998817, 0.1363492, -1.052223, 0.07450981, 1, 0, 1,
-0.3973341, -0.241697, -0.9531535, 0.06666667, 1, 0, 1,
-0.3948773, 0.5244181, -0.01466383, 0.0627451, 1, 0, 1,
-0.3948145, 0.006273224, -1.192569, 0.05490196, 1, 0, 1,
-0.3931647, -1.10698, -2.443082, 0.05098039, 1, 0, 1,
-0.3910397, -1.07715, -4.003885, 0.04313726, 1, 0, 1,
-0.3906213, 0.1822467, -0.4267519, 0.03921569, 1, 0, 1,
-0.3887937, 0.6214753, 0.02817059, 0.03137255, 1, 0, 1,
-0.3887798, -0.6777141, -3.46717, 0.02745098, 1, 0, 1,
-0.3852284, -0.6323808, -1.982013, 0.01960784, 1, 0, 1,
-0.3848874, -2.477478, -2.841383, 0.01568628, 1, 0, 1,
-0.3845899, -0.8638955, -3.180583, 0.007843138, 1, 0, 1,
-0.3836246, -1.363818, -1.693949, 0.003921569, 1, 0, 1,
-0.382706, -1.021906, -3.481158, 0, 1, 0.003921569, 1,
-0.3806152, -0.2031904, -3.066868, 0, 1, 0.01176471, 1,
-0.3793702, -0.3930153, -3.849329, 0, 1, 0.01568628, 1,
-0.3762488, 0.661599, -0.2200927, 0, 1, 0.02352941, 1,
-0.3748366, 0.3802021, -0.4795312, 0, 1, 0.02745098, 1,
-0.3719417, 0.7048415, -0.8552636, 0, 1, 0.03529412, 1,
-0.3712593, -0.03993243, -3.812932, 0, 1, 0.03921569, 1,
-0.367552, -0.6500976, -2.537094, 0, 1, 0.04705882, 1,
-0.3651965, 1.220058, 0.9783723, 0, 1, 0.05098039, 1,
-0.3627654, -1.752353, -5.527699, 0, 1, 0.05882353, 1,
-0.360606, 1.170229, 0.30346, 0, 1, 0.0627451, 1,
-0.356126, -0.4345364, -2.46744, 0, 1, 0.07058824, 1,
-0.3537213, -0.6507704, -4.045516, 0, 1, 0.07450981, 1,
-0.3467165, 0.1391716, -1.132527, 0, 1, 0.08235294, 1,
-0.3402212, 1.481029, -1.374872, 0, 1, 0.08627451, 1,
-0.3341651, 0.8981087, -0.1760206, 0, 1, 0.09411765, 1,
-0.3296448, 0.3008603, 0.5523611, 0, 1, 0.1019608, 1,
-0.3290122, -0.3045077, -1.479195, 0, 1, 0.1058824, 1,
-0.324691, -0.7815066, -1.537879, 0, 1, 0.1137255, 1,
-0.3208664, 0.7816256, -1.490182, 0, 1, 0.1176471, 1,
-0.3152567, 1.407436, 0.7215276, 0, 1, 0.1254902, 1,
-0.3137577, 0.5293535, -1.491933, 0, 1, 0.1294118, 1,
-0.3131015, -1.078252, -2.784824, 0, 1, 0.1372549, 1,
-0.3127576, 1.20487, -1.199044, 0, 1, 0.1411765, 1,
-0.3104213, -1.702964, -2.303413, 0, 1, 0.1490196, 1,
-0.3084541, -1.729916, -3.525888, 0, 1, 0.1529412, 1,
-0.3065903, -0.7606836, -1.335931, 0, 1, 0.1607843, 1,
-0.3058302, -1.473919, -4.155763, 0, 1, 0.1647059, 1,
-0.3008156, -1.020854, -3.303459, 0, 1, 0.172549, 1,
-0.3004451, 0.5537335, -0.2897701, 0, 1, 0.1764706, 1,
-0.2979755, 1.44504, 1.034358, 0, 1, 0.1843137, 1,
-0.2958956, -2.516935, -1.505072, 0, 1, 0.1882353, 1,
-0.2954592, 1.757702, -1.853045, 0, 1, 0.1960784, 1,
-0.2952573, -0.6696934, -2.216055, 0, 1, 0.2039216, 1,
-0.2937165, -0.5766847, -1.052183, 0, 1, 0.2078431, 1,
-0.2894993, -1.189769, -1.843299, 0, 1, 0.2156863, 1,
-0.2867294, -0.311262, -2.68608, 0, 1, 0.2196078, 1,
-0.2855127, -0.7235734, -1.066006, 0, 1, 0.227451, 1,
-0.2833977, -0.3516963, -2.842917, 0, 1, 0.2313726, 1,
-0.2816807, 2.548388, -0.8809696, 0, 1, 0.2392157, 1,
-0.270908, -0.5877941, -1.705036, 0, 1, 0.2431373, 1,
-0.2699028, 0.05229345, -2.803, 0, 1, 0.2509804, 1,
-0.2671498, -0.08740656, -2.110006, 0, 1, 0.254902, 1,
-0.2658157, -1.420447, -3.746396, 0, 1, 0.2627451, 1,
-0.2638825, 0.976988, -0.2164004, 0, 1, 0.2666667, 1,
-0.2630837, 0.6897163, 0.04628745, 0, 1, 0.2745098, 1,
-0.2628571, 0.05158045, -1.924854, 0, 1, 0.2784314, 1,
-0.2611815, 1.073329, -1.92776, 0, 1, 0.2862745, 1,
-0.2606765, -0.2238308, -1.659068, 0, 1, 0.2901961, 1,
-0.249058, 0.2982872, 0.6496376, 0, 1, 0.2980392, 1,
-0.2466858, 1.046812, 0.8504617, 0, 1, 0.3058824, 1,
-0.2456964, -4.324708e-05, -1.294423, 0, 1, 0.3098039, 1,
-0.2449806, 0.2487159, -1.295084, 0, 1, 0.3176471, 1,
-0.2449455, -1.248585, -2.879381, 0, 1, 0.3215686, 1,
-0.2434285, 0.7228247, 0.5538821, 0, 1, 0.3294118, 1,
-0.2433639, -0.39299, -4.71409, 0, 1, 0.3333333, 1,
-0.2361369, -0.8470669, -2.466838, 0, 1, 0.3411765, 1,
-0.2340452, -0.4313134, -2.939869, 0, 1, 0.345098, 1,
-0.2238789, 0.4665864, 0.2746576, 0, 1, 0.3529412, 1,
-0.2220814, -0.4817958, -3.778362, 0, 1, 0.3568628, 1,
-0.2207508, 0.4571067, -1.000031, 0, 1, 0.3647059, 1,
-0.2200695, 0.1812073, -0.2837595, 0, 1, 0.3686275, 1,
-0.2184016, -1.488502, -2.838614, 0, 1, 0.3764706, 1,
-0.2169846, 1.904655, 0.3238998, 0, 1, 0.3803922, 1,
-0.2130097, -0.5265672, -3.09539, 0, 1, 0.3882353, 1,
-0.210052, 1.415021, -0.8544053, 0, 1, 0.3921569, 1,
-0.2099218, 1.443947, -0.2603294, 0, 1, 0.4, 1,
-0.2076328, -2.159499, -3.099344, 0, 1, 0.4078431, 1,
-0.2051439, 1.265276, 0.130376, 0, 1, 0.4117647, 1,
-0.2014239, 0.1107783, -2.864569, 0, 1, 0.4196078, 1,
-0.1991612, -0.6378353, -4.311561, 0, 1, 0.4235294, 1,
-0.1927301, -0.826515, -2.625167, 0, 1, 0.4313726, 1,
-0.1919531, -0.1010229, -3.002551, 0, 1, 0.4352941, 1,
-0.189301, -0.1193573, -2.028574, 0, 1, 0.4431373, 1,
-0.1891286, -0.9809763, -3.341992, 0, 1, 0.4470588, 1,
-0.1884733, 2.110335, -1.639017, 0, 1, 0.454902, 1,
-0.184993, -0.05291921, -0.5233007, 0, 1, 0.4588235, 1,
-0.1816008, -0.04800529, -1.444316, 0, 1, 0.4666667, 1,
-0.1779384, 1.009629, -1.226151, 0, 1, 0.4705882, 1,
-0.1761097, 0.8909839, -0.7987489, 0, 1, 0.4784314, 1,
-0.1700032, -0.768139, -1.762572, 0, 1, 0.4823529, 1,
-0.167379, 0.7757397, 0.168018, 0, 1, 0.4901961, 1,
-0.1638962, 0.8694669, -2.93443, 0, 1, 0.4941176, 1,
-0.1621836, -1.170034, -3.814257, 0, 1, 0.5019608, 1,
-0.1605347, 1.523961, -0.1763069, 0, 1, 0.509804, 1,
-0.1572674, 0.5160286, -0.804474, 0, 1, 0.5137255, 1,
-0.1559908, -1.04447, -4.573978, 0, 1, 0.5215687, 1,
-0.1528079, 0.1395748, -0.1842695, 0, 1, 0.5254902, 1,
-0.1515369, -0.08487566, -2.234159, 0, 1, 0.5333334, 1,
-0.1513597, -0.2053905, -2.66204, 0, 1, 0.5372549, 1,
-0.1480545, -0.03051546, -2.258584, 0, 1, 0.5450981, 1,
-0.1456054, 1.442906, 0.292909, 0, 1, 0.5490196, 1,
-0.1429858, -1.977361, -2.398261, 0, 1, 0.5568628, 1,
-0.1410287, -2.45777, -1.868753, 0, 1, 0.5607843, 1,
-0.1341688, -0.6874204, -4.451561, 0, 1, 0.5686275, 1,
-0.1335098, 0.02796742, -2.54537, 0, 1, 0.572549, 1,
-0.1284841, 0.2143951, -1.138662, 0, 1, 0.5803922, 1,
-0.1273413, -1.316805, -2.383133, 0, 1, 0.5843138, 1,
-0.1264021, -0.4460627, -1.095661, 0, 1, 0.5921569, 1,
-0.1263702, -0.9177797, -4.453834, 0, 1, 0.5960785, 1,
-0.1254015, -0.1458421, -1.645048, 0, 1, 0.6039216, 1,
-0.1243337, 1.4361, -2.381787, 0, 1, 0.6117647, 1,
-0.1219563, -0.8612716, -3.254122, 0, 1, 0.6156863, 1,
-0.1201592, 1.753525, 1.700706, 0, 1, 0.6235294, 1,
-0.1146068, 1.280187, 1.815124, 0, 1, 0.627451, 1,
-0.1118396, 1.546009, -0.1267871, 0, 1, 0.6352941, 1,
-0.1086224, 0.6335403, -0.3207395, 0, 1, 0.6392157, 1,
-0.1085195, 0.5450109, -0.5632909, 0, 1, 0.6470588, 1,
-0.1048404, 0.05218034, -1.322175, 0, 1, 0.6509804, 1,
-0.1031197, 0.1584354, 0.2885896, 0, 1, 0.6588235, 1,
-0.1004741, -0.0006182353, -0.9037524, 0, 1, 0.6627451, 1,
-0.09755015, -0.3624747, -2.363519, 0, 1, 0.6705883, 1,
-0.09580617, 1.496711, 1.044377, 0, 1, 0.6745098, 1,
-0.09240162, 1.025777, 0.6900941, 0, 1, 0.682353, 1,
-0.08971485, -0.7337552, -4.252265, 0, 1, 0.6862745, 1,
-0.08803906, 1.310263, -0.2554163, 0, 1, 0.6941177, 1,
-0.08567525, 0.5668879, -1.444946, 0, 1, 0.7019608, 1,
-0.08517515, 0.05162593, -0.5158696, 0, 1, 0.7058824, 1,
-0.08294475, -0.2901649, -2.735223, 0, 1, 0.7137255, 1,
-0.08126894, -0.3177836, -3.084668, 0, 1, 0.7176471, 1,
-0.07925855, -0.6280215, -2.667275, 0, 1, 0.7254902, 1,
-0.07896946, 0.6257069, -0.8461331, 0, 1, 0.7294118, 1,
-0.07707819, -0.4459893, -3.179111, 0, 1, 0.7372549, 1,
-0.0747852, 0.8024868, 0.0996984, 0, 1, 0.7411765, 1,
-0.07455753, 0.8067859, -0.3083768, 0, 1, 0.7490196, 1,
-0.06975875, -0.2736888, -3.156711, 0, 1, 0.7529412, 1,
-0.06369526, 1.839764, 0.2479634, 0, 1, 0.7607843, 1,
-0.05749013, 0.3103935, 0.6573411, 0, 1, 0.7647059, 1,
-0.0562777, 0.4102152, 0.9232197, 0, 1, 0.772549, 1,
-0.05580907, 1.091689, -1.439936, 0, 1, 0.7764706, 1,
-0.05415402, 1.492853, -0.2698693, 0, 1, 0.7843137, 1,
-0.05305519, -0.7608094, -3.617134, 0, 1, 0.7882353, 1,
-0.05009991, 0.1454438, 2.235506, 0, 1, 0.7960784, 1,
-0.04404404, 1.568338, -1.095272, 0, 1, 0.8039216, 1,
-0.04323724, 0.02465714, -1.433314, 0, 1, 0.8078431, 1,
-0.04284126, -0.6520437, -4.269559, 0, 1, 0.8156863, 1,
-0.03507326, -1.370805, -3.797075, 0, 1, 0.8196079, 1,
-0.03189564, 0.2858968, 0.5607244, 0, 1, 0.827451, 1,
-0.03109116, -0.1709129, -3.058131, 0, 1, 0.8313726, 1,
-0.01920892, 0.7122191, -1.608342, 0, 1, 0.8392157, 1,
-0.0190619, -0.324523, -2.686933, 0, 1, 0.8431373, 1,
-0.01195732, -0.3833693, -3.730398, 0, 1, 0.8509804, 1,
-0.01005899, -0.2543666, -1.8012, 0, 1, 0.854902, 1,
-0.007729859, 0.2026638, 1.078116, 0, 1, 0.8627451, 1,
-0.006314752, 0.7527064, -2.278936, 0, 1, 0.8666667, 1,
-0.004404107, 0.495695, 0.8192668, 0, 1, 0.8745098, 1,
-0.00114936, -1.299235, -3.848051, 0, 1, 0.8784314, 1,
0.002693044, -0.4126088, 3.06213, 0, 1, 0.8862745, 1,
0.003199795, 0.3644325, -0.06471697, 0, 1, 0.8901961, 1,
0.003709154, -0.9982628, 2.636844, 0, 1, 0.8980392, 1,
0.004879228, 0.9249544, -0.2370531, 0, 1, 0.9058824, 1,
0.006231161, 0.8688277, -0.4881741, 0, 1, 0.9098039, 1,
0.007012322, -1.214088, 1.256579, 0, 1, 0.9176471, 1,
0.007542957, -0.01620162, 2.088896, 0, 1, 0.9215686, 1,
0.0078596, 1.413702, -0.1581085, 0, 1, 0.9294118, 1,
0.01223397, 0.3298318, -0.03007752, 0, 1, 0.9333333, 1,
0.01798383, 1.667605, 0.3869897, 0, 1, 0.9411765, 1,
0.02302865, -2.102083, 2.754171, 0, 1, 0.945098, 1,
0.02303855, 1.086929, 1.637079, 0, 1, 0.9529412, 1,
0.02337644, 1.141185, -0.07906744, 0, 1, 0.9568627, 1,
0.02620864, 1.054488, 0.5764109, 0, 1, 0.9647059, 1,
0.02905928, 1.667098, -0.6608788, 0, 1, 0.9686275, 1,
0.0305628, -1.762505, 1.83862, 0, 1, 0.9764706, 1,
0.03333167, -0.02698635, 2.297646, 0, 1, 0.9803922, 1,
0.03481947, 2.323464, 0.002437029, 0, 1, 0.9882353, 1,
0.0372467, -2.913011, 4.034058, 0, 1, 0.9921569, 1,
0.04375165, -0.9192747, 1.793298, 0, 1, 1, 1,
0.04623647, 0.8645194, 0.03387515, 0, 0.9921569, 1, 1,
0.04652086, -0.4346964, 2.042499, 0, 0.9882353, 1, 1,
0.04938436, 0.3847105, 0.2401833, 0, 0.9803922, 1, 1,
0.04956072, -0.5842878, 1.826272, 0, 0.9764706, 1, 1,
0.05018433, 1.464924, 0.09758573, 0, 0.9686275, 1, 1,
0.05100755, -1.200057, 2.843138, 0, 0.9647059, 1, 1,
0.05321291, -0.3278259, 1.290533, 0, 0.9568627, 1, 1,
0.05359317, 0.6416714, -1.02519, 0, 0.9529412, 1, 1,
0.05644562, 0.351269, 0.1214694, 0, 0.945098, 1, 1,
0.06328705, -0.1880598, 3.634992, 0, 0.9411765, 1, 1,
0.06701632, 0.8921099, -0.1962423, 0, 0.9333333, 1, 1,
0.06900588, 0.04823143, 0.5244299, 0, 0.9294118, 1, 1,
0.07594547, -0.7541972, 1.238918, 0, 0.9215686, 1, 1,
0.07606605, -0.6229705, 2.96506, 0, 0.9176471, 1, 1,
0.07631475, -0.1988125, 2.168971, 0, 0.9098039, 1, 1,
0.0798509, 0.4550982, -0.6218386, 0, 0.9058824, 1, 1,
0.08040464, 0.4990315, 0.7100616, 0, 0.8980392, 1, 1,
0.0816856, -1.021717, 3.635675, 0, 0.8901961, 1, 1,
0.08183973, 0.3576846, 1.469119, 0, 0.8862745, 1, 1,
0.0821937, -0.700995, 2.757809, 0, 0.8784314, 1, 1,
0.08371323, -2.432774, 2.739218, 0, 0.8745098, 1, 1,
0.08420046, 0.4580334, -0.5477429, 0, 0.8666667, 1, 1,
0.08476333, -0.2115797, 4.324809, 0, 0.8627451, 1, 1,
0.08488288, -0.874136, 3.47414, 0, 0.854902, 1, 1,
0.09524117, 0.1360745, 0.8345054, 0, 0.8509804, 1, 1,
0.09587172, 1.123774, -1.216614, 0, 0.8431373, 1, 1,
0.09591028, 0.2320152, 0.352828, 0, 0.8392157, 1, 1,
0.0959435, 0.1769595, 1.211004, 0, 0.8313726, 1, 1,
0.09953614, -0.2577153, 3.854789, 0, 0.827451, 1, 1,
0.1026297, -2.014157, 4.933884, 0, 0.8196079, 1, 1,
0.1028597, -0.01843418, 0.3819399, 0, 0.8156863, 1, 1,
0.1145498, 0.5918776, 0.9558237, 0, 0.8078431, 1, 1,
0.1256466, 0.04106641, 1.444805, 0, 0.8039216, 1, 1,
0.1263636, -0.1539893, 2.312594, 0, 0.7960784, 1, 1,
0.1268646, -0.05622094, 1.476157, 0, 0.7882353, 1, 1,
0.1272595, 0.4662921, 1.833582, 0, 0.7843137, 1, 1,
0.1278788, -0.7076059, 2.335978, 0, 0.7764706, 1, 1,
0.1294532, -1.286203, 2.655934, 0, 0.772549, 1, 1,
0.1302939, 1.383797, -0.4282565, 0, 0.7647059, 1, 1,
0.1389941, 1.979332, -0.9276782, 0, 0.7607843, 1, 1,
0.1399185, -1.04874, 2.152052, 0, 0.7529412, 1, 1,
0.1472741, 1.472366, 0.8640785, 0, 0.7490196, 1, 1,
0.1494825, 0.6147856, 1.162818, 0, 0.7411765, 1, 1,
0.1495207, 0.3523672, -1.870331, 0, 0.7372549, 1, 1,
0.150739, -0.5467767, 1.275757, 0, 0.7294118, 1, 1,
0.1510021, 1.022068, 0.7214056, 0, 0.7254902, 1, 1,
0.1638209, -0.1843294, 2.076104, 0, 0.7176471, 1, 1,
0.1648805, -0.9819651, 2.395176, 0, 0.7137255, 1, 1,
0.1679569, 0.05807054, 2.082624, 0, 0.7058824, 1, 1,
0.1706373, -1.752364, 3.313787, 0, 0.6980392, 1, 1,
0.1735087, 1.159184, -0.5531147, 0, 0.6941177, 1, 1,
0.1738624, -0.4054927, 3.992197, 0, 0.6862745, 1, 1,
0.1739941, -0.6187056, 4.470535, 0, 0.682353, 1, 1,
0.1758088, -0.9751943, 4.066703, 0, 0.6745098, 1, 1,
0.1771439, 0.5245582, 0.6188766, 0, 0.6705883, 1, 1,
0.1776632, 0.3934113, 0.8615221, 0, 0.6627451, 1, 1,
0.1796598, -0.129206, 3.061221, 0, 0.6588235, 1, 1,
0.1838388, -1.153165, 2.4452, 0, 0.6509804, 1, 1,
0.1857712, 0.04469835, 3.680964, 0, 0.6470588, 1, 1,
0.1880881, 0.3756916, 1.240923, 0, 0.6392157, 1, 1,
0.1894118, -0.1609887, 2.614298, 0, 0.6352941, 1, 1,
0.189859, 0.8248029, 0.1074301, 0, 0.627451, 1, 1,
0.1910095, -0.6547468, 2.928098, 0, 0.6235294, 1, 1,
0.1928443, -0.3709116, 2.34565, 0, 0.6156863, 1, 1,
0.1935794, -0.5155225, 1.876457, 0, 0.6117647, 1, 1,
0.1998315, 0.6338196, -1.260494, 0, 0.6039216, 1, 1,
0.2051026, -0.4926038, 1.507901, 0, 0.5960785, 1, 1,
0.2074243, 0.7034079, -0.4613442, 0, 0.5921569, 1, 1,
0.2154371, 0.8133227, 0.3427275, 0, 0.5843138, 1, 1,
0.2154907, 3.066203, -0.8971843, 0, 0.5803922, 1, 1,
0.2203304, 0.9210372, 1.447783, 0, 0.572549, 1, 1,
0.2208873, 0.701229, 0.000634135, 0, 0.5686275, 1, 1,
0.2210451, 0.7438745, 0.2914049, 0, 0.5607843, 1, 1,
0.223962, -0.4021031, 2.35881, 0, 0.5568628, 1, 1,
0.2287455, 1.064726, 2.680753, 0, 0.5490196, 1, 1,
0.2328641, -1.453853, 2.672767, 0, 0.5450981, 1, 1,
0.2340081, 0.5980042, -0.5773584, 0, 0.5372549, 1, 1,
0.2366942, 1.399913, 0.6668962, 0, 0.5333334, 1, 1,
0.2374595, 0.7851166, -0.6029447, 0, 0.5254902, 1, 1,
0.240837, 0.6331398, -0.7823183, 0, 0.5215687, 1, 1,
0.2435849, 0.722602, 1.106739, 0, 0.5137255, 1, 1,
0.2448279, 0.9920585, 1.489776, 0, 0.509804, 1, 1,
0.2484226, 0.1845633, 1.29233, 0, 0.5019608, 1, 1,
0.2486962, -1.410209, 2.296096, 0, 0.4941176, 1, 1,
0.2550068, -0.3895871, 1.447952, 0, 0.4901961, 1, 1,
0.2600532, 0.4232452, 1.691478, 0, 0.4823529, 1, 1,
0.2634963, -1.427426, 2.862522, 0, 0.4784314, 1, 1,
0.2645247, -0.4352681, 1.228247, 0, 0.4705882, 1, 1,
0.266238, 0.3567287, 1.063547, 0, 0.4666667, 1, 1,
0.2663373, 0.781365, -0.8202762, 0, 0.4588235, 1, 1,
0.2669449, 1.030309, -0.8013031, 0, 0.454902, 1, 1,
0.267267, -0.1571615, 2.288674, 0, 0.4470588, 1, 1,
0.2703704, 0.105035, 2.938352, 0, 0.4431373, 1, 1,
0.2708151, -1.444631, 2.911298, 0, 0.4352941, 1, 1,
0.2732713, -0.5374968, 2.549226, 0, 0.4313726, 1, 1,
0.2733135, -1.606232, 1.931763, 0, 0.4235294, 1, 1,
0.2739319, -0.9570847, 1.660149, 0, 0.4196078, 1, 1,
0.2787338, 0.6822442, -1.117535, 0, 0.4117647, 1, 1,
0.2826202, -0.4672304, 3.455749, 0, 0.4078431, 1, 1,
0.2833454, 0.5890507, 0.001052128, 0, 0.4, 1, 1,
0.2863676, -0.1144306, 1.804375, 0, 0.3921569, 1, 1,
0.2872366, 1.274298, 1.006803, 0, 0.3882353, 1, 1,
0.2907529, -1.290352, 4.53161, 0, 0.3803922, 1, 1,
0.2909036, 0.6092523, 1.767591, 0, 0.3764706, 1, 1,
0.2922904, -1.031075, 2.976135, 0, 0.3686275, 1, 1,
0.2952887, 0.01449465, -1.066043, 0, 0.3647059, 1, 1,
0.2957423, 1.313975, -2.640591, 0, 0.3568628, 1, 1,
0.3026571, 0.9523631, 1.823311, 0, 0.3529412, 1, 1,
0.3056238, 1.201829, 1.558301, 0, 0.345098, 1, 1,
0.3076642, -0.4104862, 1.827781, 0, 0.3411765, 1, 1,
0.3118408, 0.85937, -1.641718, 0, 0.3333333, 1, 1,
0.3137822, -1.00106, 4.576229, 0, 0.3294118, 1, 1,
0.3158657, -0.08880108, 2.270348, 0, 0.3215686, 1, 1,
0.3160301, -0.4564302, 2.627173, 0, 0.3176471, 1, 1,
0.3265767, -1.103002, 3.08212, 0, 0.3098039, 1, 1,
0.3266024, -0.07252888, 1.054228, 0, 0.3058824, 1, 1,
0.3293412, -1.427474, 4.46918, 0, 0.2980392, 1, 1,
0.329825, -1.95601, 1.189775, 0, 0.2901961, 1, 1,
0.3326117, 0.9106766, 0.09172966, 0, 0.2862745, 1, 1,
0.3396241, -2.096939, 1.29847, 0, 0.2784314, 1, 1,
0.3416828, 1.26714, 0.3964368, 0, 0.2745098, 1, 1,
0.3431733, -0.2954603, 0.9149373, 0, 0.2666667, 1, 1,
0.3433823, -0.3645819, 2.537264, 0, 0.2627451, 1, 1,
0.3444004, 0.05314432, 2.786772, 0, 0.254902, 1, 1,
0.344444, -0.8294084, 4.130246, 0, 0.2509804, 1, 1,
0.3455175, -0.135137, 1.754915, 0, 0.2431373, 1, 1,
0.3463621, 1.06426, 0.9151698, 0, 0.2392157, 1, 1,
0.347458, -0.4487368, 0.04125422, 0, 0.2313726, 1, 1,
0.3485674, -1.292623, 4.458736, 0, 0.227451, 1, 1,
0.3509321, -0.3263402, 1.322287, 0, 0.2196078, 1, 1,
0.3522972, 0.5921353, 1.453281, 0, 0.2156863, 1, 1,
0.3523673, 0.3735444, -0.1313559, 0, 0.2078431, 1, 1,
0.353989, 1.978944, 0.08490792, 0, 0.2039216, 1, 1,
0.3540621, 1.078245, 1.497374, 0, 0.1960784, 1, 1,
0.3582492, 0.2330212, -0.550276, 0, 0.1882353, 1, 1,
0.3583592, -0.8661795, 2.405358, 0, 0.1843137, 1, 1,
0.3584132, 0.2698968, 1.031354, 0, 0.1764706, 1, 1,
0.3590718, 1.911399, 0.9904828, 0, 0.172549, 1, 1,
0.3639585, 1.653577, 0.2266748, 0, 0.1647059, 1, 1,
0.3665004, -0.07043979, 2.134013, 0, 0.1607843, 1, 1,
0.3694386, 0.7120035, 0.9998033, 0, 0.1529412, 1, 1,
0.3733647, -0.3285638, 1.50768, 0, 0.1490196, 1, 1,
0.3742546, -0.5320889, 2.506182, 0, 0.1411765, 1, 1,
0.3786669, 2.52993, 0.1819163, 0, 0.1372549, 1, 1,
0.3788041, 1.582232, 1.15535, 0, 0.1294118, 1, 1,
0.3836915, 1.695612, 0.6675668, 0, 0.1254902, 1, 1,
0.3903139, -0.5368335, 3.024894, 0, 0.1176471, 1, 1,
0.3928109, 2.336193, -0.2270271, 0, 0.1137255, 1, 1,
0.3947413, -0.01416453, 1.440378, 0, 0.1058824, 1, 1,
0.3979139, -2.272518, 0.6477677, 0, 0.09803922, 1, 1,
0.4060472, 1.686149, 1.633882, 0, 0.09411765, 1, 1,
0.4064593, 0.1761859, -1.111262, 0, 0.08627451, 1, 1,
0.4067214, 0.02363658, 1.98523, 0, 0.08235294, 1, 1,
0.406841, -0.8357235, 2.419096, 0, 0.07450981, 1, 1,
0.4080342, 2.547517, 0.9419389, 0, 0.07058824, 1, 1,
0.4082849, 0.5367002, 1.501458, 0, 0.0627451, 1, 1,
0.4211195, -0.2720532, 0.3190305, 0, 0.05882353, 1, 1,
0.42351, -0.07659005, 1.101136, 0, 0.05098039, 1, 1,
0.4248005, -0.4977121, 1.052917, 0, 0.04705882, 1, 1,
0.4300883, -1.143165, 2.626089, 0, 0.03921569, 1, 1,
0.4303066, -0.9389833, 3.769998, 0, 0.03529412, 1, 1,
0.4381501, -0.6824688, 3.788993, 0, 0.02745098, 1, 1,
0.4385567, -0.2183542, 0.4127654, 0, 0.02352941, 1, 1,
0.4392088, 0.4002291, 0.5621622, 0, 0.01568628, 1, 1,
0.439784, 0.2407059, 0.6834956, 0, 0.01176471, 1, 1,
0.4414918, -0.9793088, 3.549785, 0, 0.003921569, 1, 1,
0.4422728, -0.7963541, 1.929534, 0.003921569, 0, 1, 1,
0.4505717, -0.2068782, 2.19398, 0.007843138, 0, 1, 1,
0.4511704, -0.5533657, 2.343683, 0.01568628, 0, 1, 1,
0.4535438, -1.128391, 2.931034, 0.01960784, 0, 1, 1,
0.4548337, 1.19433, 0.07941461, 0.02745098, 0, 1, 1,
0.4604528, -0.09017921, 1.15609, 0.03137255, 0, 1, 1,
0.4612297, -0.6377709, 1.280428, 0.03921569, 0, 1, 1,
0.4633648, 0.744405, -0.04438392, 0.04313726, 0, 1, 1,
0.4671856, 0.1236072, 1.006303, 0.05098039, 0, 1, 1,
0.4675121, 0.1335658, 0.9838329, 0.05490196, 0, 1, 1,
0.4681945, -1.712131, 2.695451, 0.0627451, 0, 1, 1,
0.4686864, -0.8846463, 3.017836, 0.06666667, 0, 1, 1,
0.4703333, 0.06362128, 0.7097797, 0.07450981, 0, 1, 1,
0.4730241, 1.782918, -0.639375, 0.07843138, 0, 1, 1,
0.4749573, 1.213523, 0.4625367, 0.08627451, 0, 1, 1,
0.4758989, 2.406687, -0.1865404, 0.09019608, 0, 1, 1,
0.4765525, 0.3836742, 0.8551362, 0.09803922, 0, 1, 1,
0.4769899, -1.63802, 3.226056, 0.1058824, 0, 1, 1,
0.4823712, -0.6294529, 1.439819, 0.1098039, 0, 1, 1,
0.4833592, -0.8040578, 3.438758, 0.1176471, 0, 1, 1,
0.4835697, 0.07083898, 1.564459, 0.1215686, 0, 1, 1,
0.4836093, -1.081273, 2.026867, 0.1294118, 0, 1, 1,
0.48706, -0.8158056, 1.636577, 0.1333333, 0, 1, 1,
0.4986576, 0.05734272, 1.111023, 0.1411765, 0, 1, 1,
0.5020247, 1.791991, 2.523817, 0.145098, 0, 1, 1,
0.5036892, -0.2067879, 2.633086, 0.1529412, 0, 1, 1,
0.5062324, -1.129467, 1.911272, 0.1568628, 0, 1, 1,
0.5068083, 1.017107, 1.436368, 0.1647059, 0, 1, 1,
0.5171914, -0.6397069, 3.489445, 0.1686275, 0, 1, 1,
0.5237851, -1.019336, 1.904806, 0.1764706, 0, 1, 1,
0.5277484, -1.004596, 1.884978, 0.1803922, 0, 1, 1,
0.529405, -0.510936, 1.62001, 0.1882353, 0, 1, 1,
0.5358447, -1.222243, 4.287723, 0.1921569, 0, 1, 1,
0.5429882, -0.9345844, 4.439161, 0.2, 0, 1, 1,
0.5447512, 1.862877, -1.093635, 0.2078431, 0, 1, 1,
0.5457576, 0.6686147, 1.393673, 0.2117647, 0, 1, 1,
0.5467329, -0.4740889, 1.974262, 0.2196078, 0, 1, 1,
0.547488, -0.2432092, 2.02478, 0.2235294, 0, 1, 1,
0.5476404, 0.5880929, 0.4349209, 0.2313726, 0, 1, 1,
0.5482705, 0.04436879, 1.006867, 0.2352941, 0, 1, 1,
0.5497199, -1.750597, 4.019753, 0.2431373, 0, 1, 1,
0.5543565, -0.7103812, 3.505653, 0.2470588, 0, 1, 1,
0.5610927, -0.2453255, 1.858363, 0.254902, 0, 1, 1,
0.5638997, 0.859632, -0.172459, 0.2588235, 0, 1, 1,
0.564826, 0.6799049, 0.4284984, 0.2666667, 0, 1, 1,
0.5666286, 1.083044, 1.405562, 0.2705882, 0, 1, 1,
0.5714005, -1.193931, 0.8149055, 0.2784314, 0, 1, 1,
0.5828389, 0.3526576, 1.078962, 0.282353, 0, 1, 1,
0.585476, -0.3646409, 1.747262, 0.2901961, 0, 1, 1,
0.5873756, -1.757968, 4.844023, 0.2941177, 0, 1, 1,
0.5908843, 0.5076482, 3.561177, 0.3019608, 0, 1, 1,
0.5976405, 0.0455009, 1.767709, 0.3098039, 0, 1, 1,
0.6022397, 1.480117, 1.754769, 0.3137255, 0, 1, 1,
0.6042761, -0.5386141, 1.823049, 0.3215686, 0, 1, 1,
0.6058448, -0.7405094, 4.308493, 0.3254902, 0, 1, 1,
0.6072036, 0.8203667, 0.3207951, 0.3333333, 0, 1, 1,
0.6075938, 2.096642, 1.422177, 0.3372549, 0, 1, 1,
0.6100027, -1.627227, 1.747379, 0.345098, 0, 1, 1,
0.6109135, -0.5067636, 1.987272, 0.3490196, 0, 1, 1,
0.6141031, -0.001220426, 2.307737, 0.3568628, 0, 1, 1,
0.6159735, -0.4394715, 1.895439, 0.3607843, 0, 1, 1,
0.6244389, 0.307154, 1.851885, 0.3686275, 0, 1, 1,
0.6257018, 0.8288619, 1.147942, 0.372549, 0, 1, 1,
0.6340894, -0.8098941, 2.681547, 0.3803922, 0, 1, 1,
0.6361803, -0.6925907, 1.740457, 0.3843137, 0, 1, 1,
0.6414474, 0.1112931, 0.349932, 0.3921569, 0, 1, 1,
0.6441125, -0.69672, 2.235854, 0.3960784, 0, 1, 1,
0.6454347, 0.7184873, -0.6125618, 0.4039216, 0, 1, 1,
0.6461834, 0.2478573, 0.8158263, 0.4117647, 0, 1, 1,
0.6511693, 0.1058178, 0.9237542, 0.4156863, 0, 1, 1,
0.6521463, -2.662424, 2.755533, 0.4235294, 0, 1, 1,
0.6586348, -1.305331, 3.758062, 0.427451, 0, 1, 1,
0.6612118, -0.8849139, 3.080695, 0.4352941, 0, 1, 1,
0.6644639, -0.435589, 1.832681, 0.4392157, 0, 1, 1,
0.6656526, 0.9290386, -0.09506277, 0.4470588, 0, 1, 1,
0.6671059, 0.2776652, 3.040826, 0.4509804, 0, 1, 1,
0.6687675, 0.6822212, 2.576573, 0.4588235, 0, 1, 1,
0.6711368, -1.148873, 1.809769, 0.4627451, 0, 1, 1,
0.6728535, 1.761673, 0.4818573, 0.4705882, 0, 1, 1,
0.6762962, 0.6055905, 0.7243955, 0.4745098, 0, 1, 1,
0.6769329, 0.8227957, 2.324718, 0.4823529, 0, 1, 1,
0.6850475, -0.6494661, 4.211743, 0.4862745, 0, 1, 1,
0.686789, 0.04025163, 1.91288, 0.4941176, 0, 1, 1,
0.6897731, -0.4918522, 0.9906237, 0.5019608, 0, 1, 1,
0.699932, -1.54679, 0.3051326, 0.5058824, 0, 1, 1,
0.7054875, -0.4591439, 2.153688, 0.5137255, 0, 1, 1,
0.7121491, -0.7584869, 2.985944, 0.5176471, 0, 1, 1,
0.7127184, 0.5303438, 0.4061452, 0.5254902, 0, 1, 1,
0.7127394, 0.2275834, 1.959043, 0.5294118, 0, 1, 1,
0.7157145, 0.5560325, 0.8986164, 0.5372549, 0, 1, 1,
0.7177384, 1.447342, 1.611331, 0.5411765, 0, 1, 1,
0.7215039, -0.6680644, 1.295174, 0.5490196, 0, 1, 1,
0.722952, -0.792307, 2.528122, 0.5529412, 0, 1, 1,
0.7371144, 0.1412213, -0.2454627, 0.5607843, 0, 1, 1,
0.7397062, -0.2525037, 1.942756, 0.5647059, 0, 1, 1,
0.7427517, -0.5287915, 1.337864, 0.572549, 0, 1, 1,
0.7448266, 0.8490883, 1.003936, 0.5764706, 0, 1, 1,
0.7467107, 0.6272483, 2.073308, 0.5843138, 0, 1, 1,
0.7468202, 0.4203345, 1.331975, 0.5882353, 0, 1, 1,
0.7483842, -0.144359, 2.486962, 0.5960785, 0, 1, 1,
0.7504712, 0.281764, 0.1286516, 0.6039216, 0, 1, 1,
0.7529724, -0.8740399, 2.726537, 0.6078432, 0, 1, 1,
0.756482, 1.730018, 1.011863, 0.6156863, 0, 1, 1,
0.769848, 1.37889, 0.7226928, 0.6196079, 0, 1, 1,
0.7719738, 0.5451511, 2.757034, 0.627451, 0, 1, 1,
0.775528, -0.8896608, 2.299063, 0.6313726, 0, 1, 1,
0.7801023, -0.5031494, 1.578134, 0.6392157, 0, 1, 1,
0.7819058, 0.6100509, 2.140071, 0.6431373, 0, 1, 1,
0.7935864, 0.119541, 1.328161, 0.6509804, 0, 1, 1,
0.7973948, -1.704977, 1.981505, 0.654902, 0, 1, 1,
0.8015616, -0.1361654, 3.062667, 0.6627451, 0, 1, 1,
0.810966, -0.04685072, 1.673177, 0.6666667, 0, 1, 1,
0.8135373, 1.027851, 0.4183142, 0.6745098, 0, 1, 1,
0.8141976, -0.1403938, 0.6843923, 0.6784314, 0, 1, 1,
0.8164545, -0.663007, 2.053394, 0.6862745, 0, 1, 1,
0.8207048, 0.6204613, 0.5279925, 0.6901961, 0, 1, 1,
0.8376195, -0.01926211, -0.02455987, 0.6980392, 0, 1, 1,
0.8395895, 0.4529802, 3.389275, 0.7058824, 0, 1, 1,
0.8489795, 0.6980534, 3.068191, 0.7098039, 0, 1, 1,
0.8508884, 2.219763, -0.8749546, 0.7176471, 0, 1, 1,
0.8523425, 0.8109988, 1.815597, 0.7215686, 0, 1, 1,
0.8560156, -0.8138868, 2.771173, 0.7294118, 0, 1, 1,
0.8576797, 0.3744677, -0.3487548, 0.7333333, 0, 1, 1,
0.8637105, 0.6950105, 1.405301, 0.7411765, 0, 1, 1,
0.8656311, -1.558985, 0.4679264, 0.7450981, 0, 1, 1,
0.8671067, -1.32182, 2.843393, 0.7529412, 0, 1, 1,
0.8747282, 0.8949406, 1.67097, 0.7568628, 0, 1, 1,
0.8780154, -0.182143, 3.726848, 0.7647059, 0, 1, 1,
0.8819454, 0.5848773, 1.426607, 0.7686275, 0, 1, 1,
0.8839824, 0.2145847, 3.859184, 0.7764706, 0, 1, 1,
0.8852351, 1.354763, 0.8570262, 0.7803922, 0, 1, 1,
0.8923142, -0.2830089, 4.608017, 0.7882353, 0, 1, 1,
0.8984649, -2.161279, 4.317861, 0.7921569, 0, 1, 1,
0.8986983, 0.7077572, 1.389185, 0.8, 0, 1, 1,
0.904396, 0.7486383, 0.9275674, 0.8078431, 0, 1, 1,
0.9068788, -0.6399184, 2.450075, 0.8117647, 0, 1, 1,
0.9071513, -0.6086087, 1.11929, 0.8196079, 0, 1, 1,
0.9138435, 0.7126964, 1.196093, 0.8235294, 0, 1, 1,
0.9147305, 0.1774401, 2.968878, 0.8313726, 0, 1, 1,
0.9150417, -0.3747114, 4.143453, 0.8352941, 0, 1, 1,
0.9216853, -0.1681662, 3.432783, 0.8431373, 0, 1, 1,
0.9247267, 1.727212, 1.716653, 0.8470588, 0, 1, 1,
0.9330459, -1.011733, 3.854086, 0.854902, 0, 1, 1,
0.9356619, -0.27901, 2.624656, 0.8588235, 0, 1, 1,
0.9393235, -0.1670576, 1.467449, 0.8666667, 0, 1, 1,
0.940892, -1.080866, 3.219926, 0.8705882, 0, 1, 1,
0.9431579, -0.02984559, 1.347316, 0.8784314, 0, 1, 1,
0.9476533, -0.6731592, 1.047518, 0.8823529, 0, 1, 1,
0.9478871, -2.114827, 2.441285, 0.8901961, 0, 1, 1,
0.956929, 0.3754042, 1.407264, 0.8941177, 0, 1, 1,
0.9577064, -0.9973183, 2.558636, 0.9019608, 0, 1, 1,
0.9580493, 0.2150189, 1.547847, 0.9098039, 0, 1, 1,
0.960693, 1.757827, 1.165504, 0.9137255, 0, 1, 1,
0.9609041, -0.338248, 2.557725, 0.9215686, 0, 1, 1,
0.9620493, -0.2438828, 1.239211, 0.9254902, 0, 1, 1,
0.9636416, -1.219991, 1.428419, 0.9333333, 0, 1, 1,
0.964406, 0.9128543, 1.717099, 0.9372549, 0, 1, 1,
0.9696462, -0.04116753, 1.810051, 0.945098, 0, 1, 1,
0.9697305, -0.7338922, 1.28617, 0.9490196, 0, 1, 1,
0.9699412, 1.852705, 0.3620577, 0.9568627, 0, 1, 1,
0.9763617, -0.0604828, 0.763992, 0.9607843, 0, 1, 1,
0.9882121, -2.080784, 2.133777, 0.9686275, 0, 1, 1,
1.005013, 0.1976227, 2.653851, 0.972549, 0, 1, 1,
1.007299, -0.07653178, 2.197598, 0.9803922, 0, 1, 1,
1.010026, 1.170411, 0.8062189, 0.9843137, 0, 1, 1,
1.029364, 0.4549369, -0.5423988, 0.9921569, 0, 1, 1,
1.031956, -0.0674092, 1.98448, 0.9960784, 0, 1, 1,
1.043696, 0.2552675, 2.5969, 1, 0, 0.9960784, 1,
1.046499, -2.46519, 3.074384, 1, 0, 0.9882353, 1,
1.047616, -0.5540003, 3.601376, 1, 0, 0.9843137, 1,
1.049837, -0.4264512, 1.092848, 1, 0, 0.9764706, 1,
1.05051, 2.007927, 0.8049179, 1, 0, 0.972549, 1,
1.05411, 1.181236, 0.8502705, 1, 0, 0.9647059, 1,
1.059041, -1.061845, 3.412087, 1, 0, 0.9607843, 1,
1.060294, -0.06873715, 0.9813225, 1, 0, 0.9529412, 1,
1.061112, 1.752652, 0.1268224, 1, 0, 0.9490196, 1,
1.072006, 1.208047, 0.5627146, 1, 0, 0.9411765, 1,
1.079132, 0.1217434, 1.237, 1, 0, 0.9372549, 1,
1.079374, 1.267024, 0.9698848, 1, 0, 0.9294118, 1,
1.084496, -0.1444143, 3.313836, 1, 0, 0.9254902, 1,
1.094577, 0.6148406, 1.249831, 1, 0, 0.9176471, 1,
1.09631, 1.574062, 0.07132301, 1, 0, 0.9137255, 1,
1.109866, 0.630061, 1.550378, 1, 0, 0.9058824, 1,
1.109889, -0.802089, 1.491968, 1, 0, 0.9019608, 1,
1.111969, 0.6571164, 1.513701, 1, 0, 0.8941177, 1,
1.112025, 0.0118445, 1.527177, 1, 0, 0.8862745, 1,
1.112508, 0.6814162, 1.468739, 1, 0, 0.8823529, 1,
1.115374, 2.581286, 0.4478909, 1, 0, 0.8745098, 1,
1.123785, -1.947533, 2.224034, 1, 0, 0.8705882, 1,
1.13573, -0.5867679, 4.063217, 1, 0, 0.8627451, 1,
1.136075, 0.8140524, 2.466876, 1, 0, 0.8588235, 1,
1.136086, -1.470417, 1.844482, 1, 0, 0.8509804, 1,
1.143519, 0.5360402, 1.410824, 1, 0, 0.8470588, 1,
1.143769, 0.02381055, 1.801444, 1, 0, 0.8392157, 1,
1.143984, -0.8228912, 2.871325, 1, 0, 0.8352941, 1,
1.157515, 1.769307, 1.826415, 1, 0, 0.827451, 1,
1.16262, -0.08997124, 1.558672, 1, 0, 0.8235294, 1,
1.164853, -0.909033, 2.108173, 1, 0, 0.8156863, 1,
1.17277, 0.6577649, 1.265651, 1, 0, 0.8117647, 1,
1.173511, 0.6064253, 0.8136519, 1, 0, 0.8039216, 1,
1.180996, -0.1209929, 2.861456, 1, 0, 0.7960784, 1,
1.185309, 0.7568047, 2.291112, 1, 0, 0.7921569, 1,
1.189315, -1.101856, 2.625143, 1, 0, 0.7843137, 1,
1.195386, -0.6854196, 2.92883, 1, 0, 0.7803922, 1,
1.198901, -1.505672, 3.885561, 1, 0, 0.772549, 1,
1.203977, 0.5879842, 1.149233, 1, 0, 0.7686275, 1,
1.212266, 1.303256, 0.232022, 1, 0, 0.7607843, 1,
1.216389, 2.256987, -0.524708, 1, 0, 0.7568628, 1,
1.219163, 0.2347192, 2.651781, 1, 0, 0.7490196, 1,
1.227892, 1.429664, -1.65152, 1, 0, 0.7450981, 1,
1.230039, -0.2450659, 0.02640875, 1, 0, 0.7372549, 1,
1.235357, -0.9557904, 2.38492, 1, 0, 0.7333333, 1,
1.236881, -0.3320723, 2.40714, 1, 0, 0.7254902, 1,
1.242531, -0.5719529, 2.331723, 1, 0, 0.7215686, 1,
1.243963, 1.432212, 0.7052147, 1, 0, 0.7137255, 1,
1.24479, 0.1423827, 1.20668, 1, 0, 0.7098039, 1,
1.245163, -0.3571981, 1.946854, 1, 0, 0.7019608, 1,
1.251609, 0.6218806, 1.514653, 1, 0, 0.6941177, 1,
1.251727, -0.9344824, 4.584241, 1, 0, 0.6901961, 1,
1.253311, -0.2693161, 1.264367, 1, 0, 0.682353, 1,
1.25402, 0.9464739, 0.1622382, 1, 0, 0.6784314, 1,
1.2615, -1.167569, 2.477468, 1, 0, 0.6705883, 1,
1.261804, 0.2440263, 0.2906005, 1, 0, 0.6666667, 1,
1.262833, -0.3286252, 1.531019, 1, 0, 0.6588235, 1,
1.263044, 0.4330026, 0.6858149, 1, 0, 0.654902, 1,
1.26463, -0.7930683, 2.576788, 1, 0, 0.6470588, 1,
1.264833, 0.4008271, 2.621315, 1, 0, 0.6431373, 1,
1.266864, 1.121739, 1.520085, 1, 0, 0.6352941, 1,
1.272472, 1.260887, 1.341857, 1, 0, 0.6313726, 1,
1.272713, 1.728593, -0.6808897, 1, 0, 0.6235294, 1,
1.273823, -0.3459249, 1.738343, 1, 0, 0.6196079, 1,
1.281348, -0.5815824, 2.652522, 1, 0, 0.6117647, 1,
1.281474, -1.015055, 2.311607, 1, 0, 0.6078432, 1,
1.288705, -0.1525417, 0.1996755, 1, 0, 0.6, 1,
1.290609, -0.6531685, 1.3497, 1, 0, 0.5921569, 1,
1.291794, -1.682763, 2.925921, 1, 0, 0.5882353, 1,
1.296315, 0.8720283, -0.7076436, 1, 0, 0.5803922, 1,
1.297335, 1.0706, 0.3680505, 1, 0, 0.5764706, 1,
1.299086, 0.6892002, 2.396254, 1, 0, 0.5686275, 1,
1.309893, 0.2698201, 0.7798336, 1, 0, 0.5647059, 1,
1.310135, -1.32778, 3.859459, 1, 0, 0.5568628, 1,
1.315585, -1.712181, 5.024794, 1, 0, 0.5529412, 1,
1.322138, 0.6659222, -1.133728, 1, 0, 0.5450981, 1,
1.328532, -1.527263, 1.143077, 1, 0, 0.5411765, 1,
1.331965, 0.4246438, 1.182939, 1, 0, 0.5333334, 1,
1.337634, 0.6367095, 1.181985, 1, 0, 0.5294118, 1,
1.34735, 1.255606, 1.092607, 1, 0, 0.5215687, 1,
1.358442, -0.2897724, 3.445954, 1, 0, 0.5176471, 1,
1.362735, -1.390326, 2.919148, 1, 0, 0.509804, 1,
1.370438, -1.249801, 4.950755, 1, 0, 0.5058824, 1,
1.373034, -0.4319927, 2.165126, 1, 0, 0.4980392, 1,
1.378163, -0.2199928, 2.290438, 1, 0, 0.4901961, 1,
1.384629, -0.1297974, 3.463066, 1, 0, 0.4862745, 1,
1.400188, 1.511497, 1.676495, 1, 0, 0.4784314, 1,
1.401653, -0.8110414, 2.143887, 1, 0, 0.4745098, 1,
1.413939, -0.01120435, -0.4669313, 1, 0, 0.4666667, 1,
1.427547, 0.4746545, 0.4636182, 1, 0, 0.4627451, 1,
1.428878, -0.5173749, 0.9636515, 1, 0, 0.454902, 1,
1.435309, -1.318962, 4.06951, 1, 0, 0.4509804, 1,
1.446103, 0.2007856, -0.2762397, 1, 0, 0.4431373, 1,
1.460807, 0.1663598, 2.067816, 1, 0, 0.4392157, 1,
1.466449, -1.857953, 3.93465, 1, 0, 0.4313726, 1,
1.472498, 0.8754088, 2.12911, 1, 0, 0.427451, 1,
1.477741, -1.464607, 1.551071, 1, 0, 0.4196078, 1,
1.482413, 1.016048, -0.4842603, 1, 0, 0.4156863, 1,
1.485942, 1.154201, 0.3122553, 1, 0, 0.4078431, 1,
1.492319, -0.6653061, 0.8828637, 1, 0, 0.4039216, 1,
1.494242, -1.315817, 1.213994, 1, 0, 0.3960784, 1,
1.496511, -0.5026747, 2.343637, 1, 0, 0.3882353, 1,
1.508499, -0.2583656, -0.4393404, 1, 0, 0.3843137, 1,
1.523642, 0.01118865, 0.8405649, 1, 0, 0.3764706, 1,
1.529498, -1.064241, 0.6398547, 1, 0, 0.372549, 1,
1.542916, -0.1963492, 0.5113965, 1, 0, 0.3647059, 1,
1.550066, 0.7304661, -0.8226408, 1, 0, 0.3607843, 1,
1.560464, 0.1238236, 1.587157, 1, 0, 0.3529412, 1,
1.565822, -1.368635, 2.07479, 1, 0, 0.3490196, 1,
1.570171, 1.759669, 1.44377, 1, 0, 0.3411765, 1,
1.594587, -0.3924676, 1.829836, 1, 0, 0.3372549, 1,
1.596476, 0.9557899, 2.829182, 1, 0, 0.3294118, 1,
1.597178, -2.977784, 1.907661, 1, 0, 0.3254902, 1,
1.607742, 0.8747468, 1.874159, 1, 0, 0.3176471, 1,
1.629783, -0.3226537, 2.949209, 1, 0, 0.3137255, 1,
1.647585, 0.3800201, 1.424183, 1, 0, 0.3058824, 1,
1.672369, -0.9104258, 2.091441, 1, 0, 0.2980392, 1,
1.688498, 0.02480013, 1.7375, 1, 0, 0.2941177, 1,
1.699312, 0.001533879, 0.8770153, 1, 0, 0.2862745, 1,
1.704634, -0.8571156, 2.035388, 1, 0, 0.282353, 1,
1.731115, 0.8969998, 1.31263, 1, 0, 0.2745098, 1,
1.759922, -1.000641, 1.662462, 1, 0, 0.2705882, 1,
1.769391, -0.4712267, 2.714889, 1, 0, 0.2627451, 1,
1.784411, 0.04857067, 1.749953, 1, 0, 0.2588235, 1,
1.794797, -1.032316, 3.013319, 1, 0, 0.2509804, 1,
1.796936, 1.46601, 0.2828072, 1, 0, 0.2470588, 1,
1.808936, -0.2334041, 1.707442, 1, 0, 0.2392157, 1,
1.816756, 0.1707632, 1.045616, 1, 0, 0.2352941, 1,
1.87884, -2.339294, 1.025222, 1, 0, 0.227451, 1,
1.891822, -2.407175, 1.792854, 1, 0, 0.2235294, 1,
1.892029, 0.5374734, 2.990256, 1, 0, 0.2156863, 1,
1.895146, -2.538272, 3.25024, 1, 0, 0.2117647, 1,
1.915024, 0.07135699, -0.140317, 1, 0, 0.2039216, 1,
1.947538, -0.7741603, 2.699077, 1, 0, 0.1960784, 1,
1.952572, -2.3807, 2.728929, 1, 0, 0.1921569, 1,
1.958992, 1.472081, 2.990462, 1, 0, 0.1843137, 1,
1.987339, 0.6288095, 1.766563, 1, 0, 0.1803922, 1,
2.007006, -1.162651, 2.467182, 1, 0, 0.172549, 1,
2.036373, 0.1434637, 0.225089, 1, 0, 0.1686275, 1,
2.048449, 0.3196401, 0.3828134, 1, 0, 0.1607843, 1,
2.090652, -0.6074118, 1.258017, 1, 0, 0.1568628, 1,
2.094741, -0.2539376, 1.047283, 1, 0, 0.1490196, 1,
2.113908, 0.6118672, 2.348637, 1, 0, 0.145098, 1,
2.159049, 1.721843, 0.2121348, 1, 0, 0.1372549, 1,
2.186226, -0.08824573, 1.915943, 1, 0, 0.1333333, 1,
2.201078, -0.9544911, 2.086965, 1, 0, 0.1254902, 1,
2.222955, 0.3755289, 2.765283, 1, 0, 0.1215686, 1,
2.223141, -1.536945, 1.8829, 1, 0, 0.1137255, 1,
2.265309, 0.1409804, 0.4770137, 1, 0, 0.1098039, 1,
2.305722, 0.2012031, 1.002463, 1, 0, 0.1019608, 1,
2.324543, 0.07916237, 0.7875091, 1, 0, 0.09411765, 1,
2.356419, 0.2191032, 1.189852, 1, 0, 0.09019608, 1,
2.361016, 1.770919, 0.6189946, 1, 0, 0.08235294, 1,
2.445392, -0.4434773, 2.965374, 1, 0, 0.07843138, 1,
2.487875, -0.2208105, 1.78596, 1, 0, 0.07058824, 1,
2.553994, 0.01244469, 3.355998, 1, 0, 0.06666667, 1,
2.615939, -0.02458915, 1.741171, 1, 0, 0.05882353, 1,
2.667505, -1.344678, 2.605446, 1, 0, 0.05490196, 1,
2.718052, -0.3840432, 1.187511, 1, 0, 0.04705882, 1,
2.747775, -1.018329, 2.066318, 1, 0, 0.04313726, 1,
2.773028, 1.387505, 2.19753, 1, 0, 0.03529412, 1,
2.826543, -0.9804007, 1.415163, 1, 0, 0.03137255, 1,
2.844522, 0.9309424, 0.5781422, 1, 0, 0.02352941, 1,
2.868365, 0.9989989, 0.7529887, 1, 0, 0.01960784, 1,
3.092062, -2.580123, 1.747091, 1, 0, 0.01176471, 1,
3.559665, 1.14672, 1.07676, 1, 0, 0.007843138, 1
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
0.4030399, -4.00224, -7.316347, 0, -0.5, 0.5, 0.5,
0.4030399, -4.00224, -7.316347, 1, -0.5, 0.5, 0.5,
0.4030399, -4.00224, -7.316347, 1, 1.5, 0.5, 0.5,
0.4030399, -4.00224, -7.316347, 0, 1.5, 0.5, 0.5
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
-3.823682, 0.04420972, -7.316347, 0, -0.5, 0.5, 0.5,
-3.823682, 0.04420972, -7.316347, 1, -0.5, 0.5, 0.5,
-3.823682, 0.04420972, -7.316347, 1, 1.5, 0.5, 0.5,
-3.823682, 0.04420972, -7.316347, 0, 1.5, 0.5, 0.5
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
-3.823682, -4.00224, -0.2514524, 0, -0.5, 0.5, 0.5,
-3.823682, -4.00224, -0.2514524, 1, -0.5, 0.5, 0.5,
-3.823682, -4.00224, -0.2514524, 1, 1.5, 0.5, 0.5,
-3.823682, -4.00224, -0.2514524, 0, 1.5, 0.5, 0.5
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
-2, -3.068444, -5.685987,
3, -3.068444, -5.685987,
-2, -3.068444, -5.685987,
-2, -3.224077, -5.957713,
-1, -3.068444, -5.685987,
-1, -3.224077, -5.957713,
0, -3.068444, -5.685987,
0, -3.224077, -5.957713,
1, -3.068444, -5.685987,
1, -3.224077, -5.957713,
2, -3.068444, -5.685987,
2, -3.224077, -5.957713,
3, -3.068444, -5.685987,
3, -3.224077, -5.957713
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
-2, -3.535342, -6.501166, 0, -0.5, 0.5, 0.5,
-2, -3.535342, -6.501166, 1, -0.5, 0.5, 0.5,
-2, -3.535342, -6.501166, 1, 1.5, 0.5, 0.5,
-2, -3.535342, -6.501166, 0, 1.5, 0.5, 0.5,
-1, -3.535342, -6.501166, 0, -0.5, 0.5, 0.5,
-1, -3.535342, -6.501166, 1, -0.5, 0.5, 0.5,
-1, -3.535342, -6.501166, 1, 1.5, 0.5, 0.5,
-1, -3.535342, -6.501166, 0, 1.5, 0.5, 0.5,
0, -3.535342, -6.501166, 0, -0.5, 0.5, 0.5,
0, -3.535342, -6.501166, 1, -0.5, 0.5, 0.5,
0, -3.535342, -6.501166, 1, 1.5, 0.5, 0.5,
0, -3.535342, -6.501166, 0, 1.5, 0.5, 0.5,
1, -3.535342, -6.501166, 0, -0.5, 0.5, 0.5,
1, -3.535342, -6.501166, 1, -0.5, 0.5, 0.5,
1, -3.535342, -6.501166, 1, 1.5, 0.5, 0.5,
1, -3.535342, -6.501166, 0, 1.5, 0.5, 0.5,
2, -3.535342, -6.501166, 0, -0.5, 0.5, 0.5,
2, -3.535342, -6.501166, 1, -0.5, 0.5, 0.5,
2, -3.535342, -6.501166, 1, 1.5, 0.5, 0.5,
2, -3.535342, -6.501166, 0, 1.5, 0.5, 0.5,
3, -3.535342, -6.501166, 0, -0.5, 0.5, 0.5,
3, -3.535342, -6.501166, 1, -0.5, 0.5, 0.5,
3, -3.535342, -6.501166, 1, 1.5, 0.5, 0.5,
3, -3.535342, -6.501166, 0, 1.5, 0.5, 0.5
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
-2.848284, -2, -5.685987,
-2.848284, 3, -5.685987,
-2.848284, -2, -5.685987,
-3.010851, -2, -5.957713,
-2.848284, -1, -5.685987,
-3.010851, -1, -5.957713,
-2.848284, 0, -5.685987,
-3.010851, 0, -5.957713,
-2.848284, 1, -5.685987,
-3.010851, 1, -5.957713,
-2.848284, 2, -5.685987,
-3.010851, 2, -5.957713,
-2.848284, 3, -5.685987,
-3.010851, 3, -5.957713
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
-3.335983, -2, -6.501166, 0, -0.5, 0.5, 0.5,
-3.335983, -2, -6.501166, 1, -0.5, 0.5, 0.5,
-3.335983, -2, -6.501166, 1, 1.5, 0.5, 0.5,
-3.335983, -2, -6.501166, 0, 1.5, 0.5, 0.5,
-3.335983, -1, -6.501166, 0, -0.5, 0.5, 0.5,
-3.335983, -1, -6.501166, 1, -0.5, 0.5, 0.5,
-3.335983, -1, -6.501166, 1, 1.5, 0.5, 0.5,
-3.335983, -1, -6.501166, 0, 1.5, 0.5, 0.5,
-3.335983, 0, -6.501166, 0, -0.5, 0.5, 0.5,
-3.335983, 0, -6.501166, 1, -0.5, 0.5, 0.5,
-3.335983, 0, -6.501166, 1, 1.5, 0.5, 0.5,
-3.335983, 0, -6.501166, 0, 1.5, 0.5, 0.5,
-3.335983, 1, -6.501166, 0, -0.5, 0.5, 0.5,
-3.335983, 1, -6.501166, 1, -0.5, 0.5, 0.5,
-3.335983, 1, -6.501166, 1, 1.5, 0.5, 0.5,
-3.335983, 1, -6.501166, 0, 1.5, 0.5, 0.5,
-3.335983, 2, -6.501166, 0, -0.5, 0.5, 0.5,
-3.335983, 2, -6.501166, 1, -0.5, 0.5, 0.5,
-3.335983, 2, -6.501166, 1, 1.5, 0.5, 0.5,
-3.335983, 2, -6.501166, 0, 1.5, 0.5, 0.5,
-3.335983, 3, -6.501166, 0, -0.5, 0.5, 0.5,
-3.335983, 3, -6.501166, 1, -0.5, 0.5, 0.5,
-3.335983, 3, -6.501166, 1, 1.5, 0.5, 0.5,
-3.335983, 3, -6.501166, 0, 1.5, 0.5, 0.5
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
-2.848284, -3.068444, -4,
-2.848284, -3.068444, 4,
-2.848284, -3.068444, -4,
-3.010851, -3.224077, -4,
-2.848284, -3.068444, -2,
-3.010851, -3.224077, -2,
-2.848284, -3.068444, 0,
-3.010851, -3.224077, 0,
-2.848284, -3.068444, 2,
-3.010851, -3.224077, 2,
-2.848284, -3.068444, 4,
-3.010851, -3.224077, 4
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
-3.335983, -3.535342, -4, 0, -0.5, 0.5, 0.5,
-3.335983, -3.535342, -4, 1, -0.5, 0.5, 0.5,
-3.335983, -3.535342, -4, 1, 1.5, 0.5, 0.5,
-3.335983, -3.535342, -4, 0, 1.5, 0.5, 0.5,
-3.335983, -3.535342, -2, 0, -0.5, 0.5, 0.5,
-3.335983, -3.535342, -2, 1, -0.5, 0.5, 0.5,
-3.335983, -3.535342, -2, 1, 1.5, 0.5, 0.5,
-3.335983, -3.535342, -2, 0, 1.5, 0.5, 0.5,
-3.335983, -3.535342, 0, 0, -0.5, 0.5, 0.5,
-3.335983, -3.535342, 0, 1, -0.5, 0.5, 0.5,
-3.335983, -3.535342, 0, 1, 1.5, 0.5, 0.5,
-3.335983, -3.535342, 0, 0, 1.5, 0.5, 0.5,
-3.335983, -3.535342, 2, 0, -0.5, 0.5, 0.5,
-3.335983, -3.535342, 2, 1, -0.5, 0.5, 0.5,
-3.335983, -3.535342, 2, 1, 1.5, 0.5, 0.5,
-3.335983, -3.535342, 2, 0, 1.5, 0.5, 0.5,
-3.335983, -3.535342, 4, 0, -0.5, 0.5, 0.5,
-3.335983, -3.535342, 4, 1, -0.5, 0.5, 0.5,
-3.335983, -3.535342, 4, 1, 1.5, 0.5, 0.5,
-3.335983, -3.535342, 4, 0, 1.5, 0.5, 0.5
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
-2.848284, -3.068444, -5.685987,
-2.848284, 3.156863, -5.685987,
-2.848284, -3.068444, 5.183082,
-2.848284, 3.156863, 5.183082,
-2.848284, -3.068444, -5.685987,
-2.848284, -3.068444, 5.183082,
-2.848284, 3.156863, -5.685987,
-2.848284, 3.156863, 5.183082,
-2.848284, -3.068444, -5.685987,
3.654364, -3.068444, -5.685987,
-2.848284, -3.068444, 5.183082,
3.654364, -3.068444, 5.183082,
-2.848284, 3.156863, -5.685987,
3.654364, 3.156863, -5.685987,
-2.848284, 3.156863, 5.183082,
3.654364, 3.156863, 5.183082,
3.654364, -3.068444, -5.685987,
3.654364, 3.156863, -5.685987,
3.654364, -3.068444, 5.183082,
3.654364, 3.156863, 5.183082,
3.654364, -3.068444, -5.685987,
3.654364, -3.068444, 5.183082,
3.654364, 3.156863, -5.685987,
3.654364, 3.156863, 5.183082
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
var radius = 7.536044;
var distance = 33.52871;
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
mvMatrix.translate( -0.4030399, -0.04420972, 0.2514524 );
mvMatrix.scale( 1.253046, 1.30887, 0.7496612 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.52871);
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
C10H21NOS<-read.table("C10H21NOS.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-C10H21NOS$V2
```

```
## Error in eval(expr, envir, enclos): object 'C10H21NOS' not found
```

```r
y<-C10H21NOS$V3
```

```
## Error in eval(expr, envir, enclos): object 'C10H21NOS' not found
```

```r
z<-C10H21NOS$V4
```

```
## Error in eval(expr, envir, enclos): object 'C10H21NOS' not found
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
-2.753586, -0.01617253, -1.582797, 0, 0, 1, 1, 1,
-2.608221, -0.3740879, -1.714035, 1, 0, 0, 1, 1,
-2.563565, -0.30197, -1.273631, 1, 0, 0, 1, 1,
-2.534748, -0.607132, -2.907897, 1, 0, 0, 1, 1,
-2.530389, -1.505098, -0.9813359, 1, 0, 0, 1, 1,
-2.486217, -0.2973221, -0.553369, 1, 0, 0, 1, 1,
-2.475284, 1.097429, -2.407876, 0, 0, 0, 1, 1,
-2.457078, 0.9855366, -0.1350574, 0, 0, 0, 1, 1,
-2.446056, 0.7584912, -1.894188, 0, 0, 0, 1, 1,
-2.436325, 0.1700349, -0.371206, 0, 0, 0, 1, 1,
-2.42667, 0.06510586, -2.430094, 0, 0, 0, 1, 1,
-2.342106, -1.562509, -0.5880755, 0, 0, 0, 1, 1,
-2.326498, 0.8279632, -0.8878488, 0, 0, 0, 1, 1,
-2.318468, 0.2666212, -2.059288, 1, 1, 1, 1, 1,
-2.247111, -0.4095923, -0.2345085, 1, 1, 1, 1, 1,
-2.237655, 0.9061919, -1.225446, 1, 1, 1, 1, 1,
-2.103672, 1.794733, 1.81375, 1, 1, 1, 1, 1,
-2.086181, 0.5474373, -1.680718, 1, 1, 1, 1, 1,
-2.081382, 0.5314754, 0.05362443, 1, 1, 1, 1, 1,
-2.078655, 0.2246209, -0.3780337, 1, 1, 1, 1, 1,
-2.078402, 1.30559, -1.551579, 1, 1, 1, 1, 1,
-2.048556, 1.217474, -0.5140626, 1, 1, 1, 1, 1,
-2.039792, -0.3757989, -2.114244, 1, 1, 1, 1, 1,
-2.027791, -1.351674, -1.280794, 1, 1, 1, 1, 1,
-2.019644, -0.5778687, -0.6092995, 1, 1, 1, 1, 1,
-1.951412, 0.6090853, -1.919759, 1, 1, 1, 1, 1,
-1.915083, 0.09056698, -1.60638, 1, 1, 1, 1, 1,
-1.900338, 1.075443, 1.824404, 1, 1, 1, 1, 1,
-1.89418, -1.030843, -2.430127, 0, 0, 1, 1, 1,
-1.875272, 2.015146, -0.07848653, 1, 0, 0, 1, 1,
-1.850976, 0.06613111, -1.831285, 1, 0, 0, 1, 1,
-1.846902, -0.164991, -1.366194, 1, 0, 0, 1, 1,
-1.842135, 0.2974084, -0.880678, 1, 0, 0, 1, 1,
-1.824733, 2.098279, -0.06833022, 1, 0, 0, 1, 1,
-1.824589, -0.9062589, -2.171557, 0, 0, 0, 1, 1,
-1.824283, 0.11356, -2.11729, 0, 0, 0, 1, 1,
-1.821764, -0.3297559, -2.000849, 0, 0, 0, 1, 1,
-1.819274, -1.010052, -2.383379, 0, 0, 0, 1, 1,
-1.8121, -0.08174911, -1.055791, 0, 0, 0, 1, 1,
-1.809524, -0.6891978, -1.253294, 0, 0, 0, 1, 1,
-1.797156, -0.7505597, -1.173799, 0, 0, 0, 1, 1,
-1.788111, -0.7123443, -2.297497, 1, 1, 1, 1, 1,
-1.759477, -0.2096133, -0.8753361, 1, 1, 1, 1, 1,
-1.756877, 1.137825, -0.6287801, 1, 1, 1, 1, 1,
-1.740962, -0.6042778, 0.09567647, 1, 1, 1, 1, 1,
-1.726977, 0.6367009, -0.6384307, 1, 1, 1, 1, 1,
-1.72055, -1.064455, -2.381445, 1, 1, 1, 1, 1,
-1.718265, 0.6707085, -1.908515, 1, 1, 1, 1, 1,
-1.701945, 1.481369, -2.093199, 1, 1, 1, 1, 1,
-1.681536, -0.04573404, -0.7915575, 1, 1, 1, 1, 1,
-1.669496, -0.3019749, -0.4713167, 1, 1, 1, 1, 1,
-1.666714, 0.6752208, -2.570571, 1, 1, 1, 1, 1,
-1.649013, -0.2994262, -2.944459, 1, 1, 1, 1, 1,
-1.647322, -1.151022, -1.961055, 1, 1, 1, 1, 1,
-1.639005, -0.2997756, -2.139714, 1, 1, 1, 1, 1,
-1.633863, 0.04886007, -1.592842, 1, 1, 1, 1, 1,
-1.630342, 0.5100599, -1.951116, 0, 0, 1, 1, 1,
-1.617042, 0.1592015, -3.39576, 1, 0, 0, 1, 1,
-1.61473, -1.552257, -2.494545, 1, 0, 0, 1, 1,
-1.613185, 0.6950422, 0.07218727, 1, 0, 0, 1, 1,
-1.60738, 0.3587075, -0.9270622, 1, 0, 0, 1, 1,
-1.60379, -0.3538869, -1.808949, 1, 0, 0, 1, 1,
-1.599489, 0.8575028, -1.948287, 0, 0, 0, 1, 1,
-1.593119, 0.8084793, -1.45097, 0, 0, 0, 1, 1,
-1.579042, -0.320999, -1.782765, 0, 0, 0, 1, 1,
-1.56516, 0.8169839, -1.320097, 0, 0, 0, 1, 1,
-1.556462, 0.515731, -3.167807, 0, 0, 0, 1, 1,
-1.543665, -0.6082475, -1.130412, 0, 0, 0, 1, 1,
-1.531838, -1.087068, -1.73783, 0, 0, 0, 1, 1,
-1.52222, -0.5633711, -4.367563, 1, 1, 1, 1, 1,
-1.504454, 0.3085107, -0.7479981, 1, 1, 1, 1, 1,
-1.499683, 1.192222, -0.289872, 1, 1, 1, 1, 1,
-1.490963, 1.174998, -1.110575, 1, 1, 1, 1, 1,
-1.487342, 1.400487, -1.79302, 1, 1, 1, 1, 1,
-1.481624, 2.160913, -0.6373781, 1, 1, 1, 1, 1,
-1.473448, -0.3301035, -2.87667, 1, 1, 1, 1, 1,
-1.462641, -1.064548, -2.085474, 1, 1, 1, 1, 1,
-1.460796, 0.6540735, -1.034159, 1, 1, 1, 1, 1,
-1.459551, 0.08327205, -1.288184, 1, 1, 1, 1, 1,
-1.452921, 0.7199796, -2.428439, 1, 1, 1, 1, 1,
-1.447957, -1.073293, -2.11694, 1, 1, 1, 1, 1,
-1.443332, -1.534187, -2.487171, 1, 1, 1, 1, 1,
-1.439904, 0.8585988, -3.146518, 1, 1, 1, 1, 1,
-1.438596, -1.165061, -2.105485, 1, 1, 1, 1, 1,
-1.43372, 0.6957178, -1.544581, 0, 0, 1, 1, 1,
-1.426824, 0.9986133, -1.391398, 1, 0, 0, 1, 1,
-1.425656, -0.9367034, -3.138934, 1, 0, 0, 1, 1,
-1.412521, 0.7433702, -0.9568716, 1, 0, 0, 1, 1,
-1.412383, 0.3782175, -2.267255, 1, 0, 0, 1, 1,
-1.405692, -0.4444187, -1.817744, 1, 0, 0, 1, 1,
-1.402838, -0.3743613, -3.303386, 0, 0, 0, 1, 1,
-1.401052, -0.5925483, -0.6187735, 0, 0, 0, 1, 1,
-1.378584, 0.2722891, 0.01986262, 0, 0, 0, 1, 1,
-1.377106, -0.7862683, -3.247446, 0, 0, 0, 1, 1,
-1.370572, 1.885828, -1.217467, 0, 0, 0, 1, 1,
-1.36895, 0.1508091, -1.505102, 0, 0, 0, 1, 1,
-1.363616, 1.210103, -1.299489, 0, 0, 0, 1, 1,
-1.363464, 0.2028644, -0.9676924, 1, 1, 1, 1, 1,
-1.35865, 1.05147, 0.1454504, 1, 1, 1, 1, 1,
-1.356934, -0.8003681, -1.568279, 1, 1, 1, 1, 1,
-1.350787, 2.995827, -1.155859, 1, 1, 1, 1, 1,
-1.346838, 0.392012, -1.225394, 1, 1, 1, 1, 1,
-1.328466, 0.1124394, -0.6963395, 1, 1, 1, 1, 1,
-1.327218, -0.500967, -1.151118, 1, 1, 1, 1, 1,
-1.319738, -1.660673, -3.68939, 1, 1, 1, 1, 1,
-1.316177, 0.2041384, -1.195809, 1, 1, 1, 1, 1,
-1.314338, -0.445711, -1.184687, 1, 1, 1, 1, 1,
-1.295042, 1.858111, -0.2731278, 1, 1, 1, 1, 1,
-1.281531, -0.848807, -1.751654, 1, 1, 1, 1, 1,
-1.278971, 0.7544824, 0.2993954, 1, 1, 1, 1, 1,
-1.272533, 0.2437364, -0.2185816, 1, 1, 1, 1, 1,
-1.271029, -1.962514, -1.913804, 1, 1, 1, 1, 1,
-1.253103, -1.307383, -2.608366, 0, 0, 1, 1, 1,
-1.250237, -1.034518, -1.71842, 1, 0, 0, 1, 1,
-1.242001, -1.374783, -2.774347, 1, 0, 0, 1, 1,
-1.2253, 0.1629016, -1.374772, 1, 0, 0, 1, 1,
-1.210798, 0.3166432, -0.9837397, 1, 0, 0, 1, 1,
-1.210329, 0.9619315, -1.69459, 1, 0, 0, 1, 1,
-1.206204, -0.1918202, -0.3629079, 0, 0, 0, 1, 1,
-1.202534, 0.8483356, -0.2328536, 0, 0, 0, 1, 1,
-1.197592, 1.904952, -2.556453, 0, 0, 0, 1, 1,
-1.192315, -0.03833192, -1.689159, 0, 0, 0, 1, 1,
-1.184409, -2.350543, -2.135036, 0, 0, 0, 1, 1,
-1.178737, 0.4109201, -2.792271, 0, 0, 0, 1, 1,
-1.166789, 0.7946376, -1.906934, 0, 0, 0, 1, 1,
-1.162791, -0.6422095, -1.167917, 1, 1, 1, 1, 1,
-1.162117, 0.5249606, -2.182928, 1, 1, 1, 1, 1,
-1.158918, 1.493469, -2.197852, 1, 1, 1, 1, 1,
-1.140648, -1.648867, -2.002882, 1, 1, 1, 1, 1,
-1.129044, 1.40434, -0.8718519, 1, 1, 1, 1, 1,
-1.12714, -2.547015, -3.615806, 1, 1, 1, 1, 1,
-1.126502, 0.8586849, -0.2018932, 1, 1, 1, 1, 1,
-1.126183, 0.4938078, -1.879284, 1, 1, 1, 1, 1,
-1.124764, -1.370178, -2.761603, 1, 1, 1, 1, 1,
-1.112296, 0.1838916, -0.479779, 1, 1, 1, 1, 1,
-1.104419, 0.2927105, -0.9407202, 1, 1, 1, 1, 1,
-1.104403, -1.153925, -2.568181, 1, 1, 1, 1, 1,
-1.098572, -1.50895, -3.202062, 1, 1, 1, 1, 1,
-1.098451, 1.012313, -1.865765, 1, 1, 1, 1, 1,
-1.096344, 0.7308501, -0.9444777, 1, 1, 1, 1, 1,
-1.096238, 0.250455, -3.962521, 0, 0, 1, 1, 1,
-1.086595, 0.08447736, -3.065248, 1, 0, 0, 1, 1,
-1.086484, -0.7762496, -1.271433, 1, 0, 0, 1, 1,
-1.075393, 0.7526178, -0.0726047, 1, 0, 0, 1, 1,
-1.070363, -0.6087262, -2.425497, 1, 0, 0, 1, 1,
-1.068988, -0.3204082, -1.793644, 1, 0, 0, 1, 1,
-1.066523, 0.1377723, -0.6876332, 0, 0, 0, 1, 1,
-1.065971, 0.04635833, -1.491389, 0, 0, 0, 1, 1,
-1.063472, -0.6558325, -1.867744, 0, 0, 0, 1, 1,
-1.057819, 0.03378423, -1.804716, 0, 0, 0, 1, 1,
-1.055241, -1.572898, -1.866574, 0, 0, 0, 1, 1,
-1.052299, 0.6757887, -0.2899078, 0, 0, 0, 1, 1,
-1.049633, 0.4768086, -2.418287, 0, 0, 0, 1, 1,
-1.044239, -0.9048918, -3.450963, 1, 1, 1, 1, 1,
-1.039876, -0.3221243, -0.1497147, 1, 1, 1, 1, 1,
-1.039832, -0.2111316, 0.1386104, 1, 1, 1, 1, 1,
-1.039002, 1.81208, 0.2507659, 1, 1, 1, 1, 1,
-1.035251, -0.562931, -2.44553, 1, 1, 1, 1, 1,
-1.034038, 0.2996231, -1.320508, 1, 1, 1, 1, 1,
-1.030853, -2.197324, -4.183055, 1, 1, 1, 1, 1,
-1.023242, -0.817753, -2.565433, 1, 1, 1, 1, 1,
-1.002365, 0.4620073, -1.636592, 1, 1, 1, 1, 1,
-0.997708, -1.537894, -2.876223, 1, 1, 1, 1, 1,
-0.9926189, 1.484469, -0.5429829, 1, 1, 1, 1, 1,
-0.9907621, -0.02473961, -1.297152, 1, 1, 1, 1, 1,
-0.9876691, 0.7937929, -0.6668938, 1, 1, 1, 1, 1,
-0.9752568, 1.361331, -0.07746063, 1, 1, 1, 1, 1,
-0.9749781, -0.1410041, -0.4675538, 1, 1, 1, 1, 1,
-0.9599873, -1.155411, -1.533101, 0, 0, 1, 1, 1,
-0.9584043, 1.366632, -0.4094593, 1, 0, 0, 1, 1,
-0.951638, -0.722321, -3.180394, 1, 0, 0, 1, 1,
-0.9508829, 0.2763063, -1.564384, 1, 0, 0, 1, 1,
-0.9408919, 0.4224109, -0.02825078, 1, 0, 0, 1, 1,
-0.9397934, -0.09288833, -2.136309, 1, 0, 0, 1, 1,
-0.9294459, 1.363214, -0.9721409, 0, 0, 0, 1, 1,
-0.9261298, 1.250552, -2.222937, 0, 0, 0, 1, 1,
-0.9260647, -0.3997643, -1.730098, 0, 0, 0, 1, 1,
-0.9120083, 0.3181485, -1.057874, 0, 0, 0, 1, 1,
-0.9110463, -0.7500152, -3.488307, 0, 0, 0, 1, 1,
-0.9097764, -0.6488863, -0.5993834, 0, 0, 0, 1, 1,
-0.9049032, -0.2650567, 0.01126876, 0, 0, 0, 1, 1,
-0.8963305, 0.4688951, -1.876483, 1, 1, 1, 1, 1,
-0.8948131, -0.3864554, -2.054787, 1, 1, 1, 1, 1,
-0.8890184, 0.654659, -1.246529, 1, 1, 1, 1, 1,
-0.8849599, 0.5271474, 0.4063572, 1, 1, 1, 1, 1,
-0.8828775, 0.13002, -1.092487, 1, 1, 1, 1, 1,
-0.8823053, 0.259752, 0.3637027, 1, 1, 1, 1, 1,
-0.8766494, 0.1156557, -0.5630228, 1, 1, 1, 1, 1,
-0.8726536, 0.3473427, -0.8710063, 1, 1, 1, 1, 1,
-0.8650932, -1.203064, -3.27545, 1, 1, 1, 1, 1,
-0.8555554, 0.8610157, -0.4242813, 1, 1, 1, 1, 1,
-0.8552855, 0.5557272, -2.457926, 1, 1, 1, 1, 1,
-0.8513564, 0.8414723, -1.605614, 1, 1, 1, 1, 1,
-0.8477666, 0.3500107, -3.179785, 1, 1, 1, 1, 1,
-0.8448759, 1.860252, -0.5868256, 1, 1, 1, 1, 1,
-0.8324326, 0.1493066, -1.996493, 1, 1, 1, 1, 1,
-0.8254801, 0.727421, 0.3438405, 0, 0, 1, 1, 1,
-0.8201839, 0.2308202, -1.39905, 1, 0, 0, 1, 1,
-0.81178, -0.9992087, -2.722697, 1, 0, 0, 1, 1,
-0.8090505, -0.2201295, -0.06280571, 1, 0, 0, 1, 1,
-0.799728, -1.28253, -3.338305, 1, 0, 0, 1, 1,
-0.7981175, 0.4056758, -1.15363, 1, 0, 0, 1, 1,
-0.7856139, -0.08107555, -2.171692, 0, 0, 0, 1, 1,
-0.7812356, -1.323028, -2.596695, 0, 0, 0, 1, 1,
-0.7680672, 0.06923252, -2.662299, 0, 0, 0, 1, 1,
-0.7626196, 2.082829, -2.67398, 0, 0, 0, 1, 1,
-0.7615843, -0.7374161, -1.433914, 0, 0, 0, 1, 1,
-0.7602698, 0.7258998, -3.80953, 0, 0, 0, 1, 1,
-0.7582411, 0.9089196, -0.1523709, 0, 0, 0, 1, 1,
-0.7512779, 0.2754962, -1.335222, 1, 1, 1, 1, 1,
-0.7505615, 2.250844, -0.6094704, 1, 1, 1, 1, 1,
-0.7503392, -0.3710936, -0.8023629, 1, 1, 1, 1, 1,
-0.7494894, -0.199415, -2.041871, 1, 1, 1, 1, 1,
-0.7476777, -0.08558529, -1.447319, 1, 1, 1, 1, 1,
-0.7435641, 1.050685, -0.7654346, 1, 1, 1, 1, 1,
-0.7409208, -0.05544081, -1.950841, 1, 1, 1, 1, 1,
-0.7362661, 0.9395374, -0.9917018, 1, 1, 1, 1, 1,
-0.7343423, 0.6259496, -2.062309, 1, 1, 1, 1, 1,
-0.733884, 0.3889392, -0.7643396, 1, 1, 1, 1, 1,
-0.7232485, -0.2728089, -1.555024, 1, 1, 1, 1, 1,
-0.7208368, 1.60474, -0.9047996, 1, 1, 1, 1, 1,
-0.714619, -0.02417365, -3.12983, 1, 1, 1, 1, 1,
-0.7051085, 0.190615, -1.645416, 1, 1, 1, 1, 1,
-0.7032676, -0.04512926, -1.32047, 1, 1, 1, 1, 1,
-0.6995241, -1.469815, -1.395743, 0, 0, 1, 1, 1,
-0.6991391, -1.346555, -3.074879, 1, 0, 0, 1, 1,
-0.6986285, 0.0874211, 0.1908838, 1, 0, 0, 1, 1,
-0.6973262, -0.9182047, -2.035816, 1, 0, 0, 1, 1,
-0.6931298, -0.3643208, -0.5675253, 1, 0, 0, 1, 1,
-0.68629, -0.5798618, -1.517932, 1, 0, 0, 1, 1,
-0.681013, 0.3500002, -1.565313, 0, 0, 0, 1, 1,
-0.6770359, 0.04370464, -1.745789, 0, 0, 0, 1, 1,
-0.6767475, 1.426362, -0.2854639, 0, 0, 0, 1, 1,
-0.6683517, -0.7223873, -1.924354, 0, 0, 0, 1, 1,
-0.6671891, -1.249369, -2.275273, 0, 0, 0, 1, 1,
-0.6626204, -0.08375134, -2.217019, 0, 0, 0, 1, 1,
-0.6589909, 0.5218008, -0.174533, 0, 0, 0, 1, 1,
-0.6566967, -0.2231277, -1.594537, 1, 1, 1, 1, 1,
-0.653574, -0.6932843, -2.049324, 1, 1, 1, 1, 1,
-0.645947, -0.2458752, -2.557849, 1, 1, 1, 1, 1,
-0.6410456, 0.28346, -0.7157984, 1, 1, 1, 1, 1,
-0.6373374, 1.508203, 0.6538646, 1, 1, 1, 1, 1,
-0.6359013, 2.119247, -0.8109068, 1, 1, 1, 1, 1,
-0.63385, 1.132339, -0.4324746, 1, 1, 1, 1, 1,
-0.6249871, 0.5160443, -1.12632, 1, 1, 1, 1, 1,
-0.6181648, -1.155651, -0.8592462, 1, 1, 1, 1, 1,
-0.6177269, -0.3156918, -2.430764, 1, 1, 1, 1, 1,
-0.6141648, 0.1080023, -1.84381, 1, 1, 1, 1, 1,
-0.6086569, -0.06225492, -0.6505615, 1, 1, 1, 1, 1,
-0.6033354, 0.8182327, -0.9175754, 1, 1, 1, 1, 1,
-0.6027991, -0.5600597, -2.755083, 1, 1, 1, 1, 1,
-0.6014355, -0.1723031, -0.9805083, 1, 1, 1, 1, 1,
-0.5980915, -1.056902, -1.835728, 0, 0, 1, 1, 1,
-0.5969217, 0.54691, -0.3570011, 1, 0, 0, 1, 1,
-0.5886862, 0.7799308, -0.7680804, 1, 0, 0, 1, 1,
-0.5880861, -0.05174479, -2.314683, 1, 0, 0, 1, 1,
-0.5858037, -0.3248034, -1.639956, 1, 0, 0, 1, 1,
-0.5838862, 0.02988961, -2.225572, 1, 0, 0, 1, 1,
-0.582705, 0.7531816, 0.07119552, 0, 0, 0, 1, 1,
-0.5826033, 0.7755748, -0.3477353, 0, 0, 0, 1, 1,
-0.582422, -0.7785741, -2.931435, 0, 0, 0, 1, 1,
-0.5765136, -0.2100697, -1.478675, 0, 0, 0, 1, 1,
-0.5740336, 0.2544727, -1.08964, 0, 0, 0, 1, 1,
-0.5716717, -0.7030373, -0.7201077, 0, 0, 0, 1, 1,
-0.5686461, 0.5608502, -1.136125, 0, 0, 0, 1, 1,
-0.5578498, -0.8236644, -2.204819, 1, 1, 1, 1, 1,
-0.5530254, 1.65976, -1.405031, 1, 1, 1, 1, 1,
-0.5477885, 0.8890389, -1.229692, 1, 1, 1, 1, 1,
-0.547344, 0.399875, -1.372873, 1, 1, 1, 1, 1,
-0.5414733, -0.6270517, -2.951951, 1, 1, 1, 1, 1,
-0.5379435, -0.3580286, -1.764946, 1, 1, 1, 1, 1,
-0.5364323, 0.7385901, -0.1655935, 1, 1, 1, 1, 1,
-0.534335, -0.4644305, -1.648768, 1, 1, 1, 1, 1,
-0.5334411, 0.005695661, -2.008323, 1, 1, 1, 1, 1,
-0.5329652, -1.43374, -2.892369, 1, 1, 1, 1, 1,
-0.5302019, 0.747555, 0.8299199, 1, 1, 1, 1, 1,
-0.5242797, 1.157901, -0.4820493, 1, 1, 1, 1, 1,
-0.5196903, 0.5157502, -3.096396, 1, 1, 1, 1, 1,
-0.5190054, -0.009430423, -1.9791, 1, 1, 1, 1, 1,
-0.5171393, -1.245729, -3.83198, 1, 1, 1, 1, 1,
-0.5131859, 1.128935, -1.509655, 0, 0, 1, 1, 1,
-0.512133, -1.507166, -0.6903817, 1, 0, 0, 1, 1,
-0.5113147, -0.9072595, -2.849502, 1, 0, 0, 1, 1,
-0.5102914, 0.5531471, -1.072886, 1, 0, 0, 1, 1,
-0.5087344, 0.2364814, 0.4878701, 1, 0, 0, 1, 1,
-0.5066597, 0.3350301, -1.743927, 1, 0, 0, 1, 1,
-0.5063524, 1.358383, -0.03323572, 0, 0, 0, 1, 1,
-0.4996201, -0.4855852, -3.016139, 0, 0, 0, 1, 1,
-0.4986861, 0.1618069, -1.5165, 0, 0, 0, 1, 1,
-0.4984559, 0.02801396, -1.537001, 0, 0, 0, 1, 1,
-0.4971975, 1.312566, 0.3273248, 0, 0, 0, 1, 1,
-0.4865391, 0.8739392, -2.456369, 0, 0, 0, 1, 1,
-0.4794466, -1.250106, -1.740292, 0, 0, 0, 1, 1,
-0.4718617, -0.3538701, -1.997051, 1, 1, 1, 1, 1,
-0.4711625, -2.141766, -3.272171, 1, 1, 1, 1, 1,
-0.466368, 0.8466418, -0.2557105, 1, 1, 1, 1, 1,
-0.465324, -0.7500706, -3.060249, 1, 1, 1, 1, 1,
-0.4648619, -0.4712587, -1.230738, 1, 1, 1, 1, 1,
-0.4637137, -0.6756273, -1.001621, 1, 1, 1, 1, 1,
-0.4622346, 0.6370304, -1.582561, 1, 1, 1, 1, 1,
-0.4589838, 0.08853143, -1.858701, 1, 1, 1, 1, 1,
-0.4587664, 0.5838433, -0.9840388, 1, 1, 1, 1, 1,
-0.4585949, -2.110228, -3.239419, 1, 1, 1, 1, 1,
-0.4569726, -0.2046329, -2.661368, 1, 1, 1, 1, 1,
-0.4536071, 0.4322985, -0.1669506, 1, 1, 1, 1, 1,
-0.4531211, -0.2189169, -1.825841, 1, 1, 1, 1, 1,
-0.4498166, 0.04119807, -1.458299, 1, 1, 1, 1, 1,
-0.4485852, 0.329593, -0.650887, 1, 1, 1, 1, 1,
-0.4485005, 0.9547839, -1.025379, 0, 0, 1, 1, 1,
-0.4478369, -1.325428, -1.744621, 1, 0, 0, 1, 1,
-0.4421826, 1.570122, -1.176793, 1, 0, 0, 1, 1,
-0.4344719, -0.5453281, -2.456482, 1, 0, 0, 1, 1,
-0.4338191, -1.954567, -4.03276, 1, 0, 0, 1, 1,
-0.4320816, 1.883993, -0.4383128, 1, 0, 0, 1, 1,
-0.4307782, 0.6866884, -0.2880328, 0, 0, 0, 1, 1,
-0.4257841, 0.3781815, -2.650555, 0, 0, 0, 1, 1,
-0.4172951, -0.3998518, -1.360995, 0, 0, 0, 1, 1,
-0.4148228, -1.2866, -2.335187, 0, 0, 0, 1, 1,
-0.4118612, 0.09309854, -2.441572, 0, 0, 0, 1, 1,
-0.4075862, -2.66003, -2.294716, 0, 0, 0, 1, 1,
-0.4048609, -0.810048, -3.378446, 0, 0, 0, 1, 1,
-0.3998817, 0.1363492, -1.052223, 1, 1, 1, 1, 1,
-0.3973341, -0.241697, -0.9531535, 1, 1, 1, 1, 1,
-0.3948773, 0.5244181, -0.01466383, 1, 1, 1, 1, 1,
-0.3948145, 0.006273224, -1.192569, 1, 1, 1, 1, 1,
-0.3931647, -1.10698, -2.443082, 1, 1, 1, 1, 1,
-0.3910397, -1.07715, -4.003885, 1, 1, 1, 1, 1,
-0.3906213, 0.1822467, -0.4267519, 1, 1, 1, 1, 1,
-0.3887937, 0.6214753, 0.02817059, 1, 1, 1, 1, 1,
-0.3887798, -0.6777141, -3.46717, 1, 1, 1, 1, 1,
-0.3852284, -0.6323808, -1.982013, 1, 1, 1, 1, 1,
-0.3848874, -2.477478, -2.841383, 1, 1, 1, 1, 1,
-0.3845899, -0.8638955, -3.180583, 1, 1, 1, 1, 1,
-0.3836246, -1.363818, -1.693949, 1, 1, 1, 1, 1,
-0.382706, -1.021906, -3.481158, 1, 1, 1, 1, 1,
-0.3806152, -0.2031904, -3.066868, 1, 1, 1, 1, 1,
-0.3793702, -0.3930153, -3.849329, 0, 0, 1, 1, 1,
-0.3762488, 0.661599, -0.2200927, 1, 0, 0, 1, 1,
-0.3748366, 0.3802021, -0.4795312, 1, 0, 0, 1, 1,
-0.3719417, 0.7048415, -0.8552636, 1, 0, 0, 1, 1,
-0.3712593, -0.03993243, -3.812932, 1, 0, 0, 1, 1,
-0.367552, -0.6500976, -2.537094, 1, 0, 0, 1, 1,
-0.3651965, 1.220058, 0.9783723, 0, 0, 0, 1, 1,
-0.3627654, -1.752353, -5.527699, 0, 0, 0, 1, 1,
-0.360606, 1.170229, 0.30346, 0, 0, 0, 1, 1,
-0.356126, -0.4345364, -2.46744, 0, 0, 0, 1, 1,
-0.3537213, -0.6507704, -4.045516, 0, 0, 0, 1, 1,
-0.3467165, 0.1391716, -1.132527, 0, 0, 0, 1, 1,
-0.3402212, 1.481029, -1.374872, 0, 0, 0, 1, 1,
-0.3341651, 0.8981087, -0.1760206, 1, 1, 1, 1, 1,
-0.3296448, 0.3008603, 0.5523611, 1, 1, 1, 1, 1,
-0.3290122, -0.3045077, -1.479195, 1, 1, 1, 1, 1,
-0.324691, -0.7815066, -1.537879, 1, 1, 1, 1, 1,
-0.3208664, 0.7816256, -1.490182, 1, 1, 1, 1, 1,
-0.3152567, 1.407436, 0.7215276, 1, 1, 1, 1, 1,
-0.3137577, 0.5293535, -1.491933, 1, 1, 1, 1, 1,
-0.3131015, -1.078252, -2.784824, 1, 1, 1, 1, 1,
-0.3127576, 1.20487, -1.199044, 1, 1, 1, 1, 1,
-0.3104213, -1.702964, -2.303413, 1, 1, 1, 1, 1,
-0.3084541, -1.729916, -3.525888, 1, 1, 1, 1, 1,
-0.3065903, -0.7606836, -1.335931, 1, 1, 1, 1, 1,
-0.3058302, -1.473919, -4.155763, 1, 1, 1, 1, 1,
-0.3008156, -1.020854, -3.303459, 1, 1, 1, 1, 1,
-0.3004451, 0.5537335, -0.2897701, 1, 1, 1, 1, 1,
-0.2979755, 1.44504, 1.034358, 0, 0, 1, 1, 1,
-0.2958956, -2.516935, -1.505072, 1, 0, 0, 1, 1,
-0.2954592, 1.757702, -1.853045, 1, 0, 0, 1, 1,
-0.2952573, -0.6696934, -2.216055, 1, 0, 0, 1, 1,
-0.2937165, -0.5766847, -1.052183, 1, 0, 0, 1, 1,
-0.2894993, -1.189769, -1.843299, 1, 0, 0, 1, 1,
-0.2867294, -0.311262, -2.68608, 0, 0, 0, 1, 1,
-0.2855127, -0.7235734, -1.066006, 0, 0, 0, 1, 1,
-0.2833977, -0.3516963, -2.842917, 0, 0, 0, 1, 1,
-0.2816807, 2.548388, -0.8809696, 0, 0, 0, 1, 1,
-0.270908, -0.5877941, -1.705036, 0, 0, 0, 1, 1,
-0.2699028, 0.05229345, -2.803, 0, 0, 0, 1, 1,
-0.2671498, -0.08740656, -2.110006, 0, 0, 0, 1, 1,
-0.2658157, -1.420447, -3.746396, 1, 1, 1, 1, 1,
-0.2638825, 0.976988, -0.2164004, 1, 1, 1, 1, 1,
-0.2630837, 0.6897163, 0.04628745, 1, 1, 1, 1, 1,
-0.2628571, 0.05158045, -1.924854, 1, 1, 1, 1, 1,
-0.2611815, 1.073329, -1.92776, 1, 1, 1, 1, 1,
-0.2606765, -0.2238308, -1.659068, 1, 1, 1, 1, 1,
-0.249058, 0.2982872, 0.6496376, 1, 1, 1, 1, 1,
-0.2466858, 1.046812, 0.8504617, 1, 1, 1, 1, 1,
-0.2456964, -4.324708e-05, -1.294423, 1, 1, 1, 1, 1,
-0.2449806, 0.2487159, -1.295084, 1, 1, 1, 1, 1,
-0.2449455, -1.248585, -2.879381, 1, 1, 1, 1, 1,
-0.2434285, 0.7228247, 0.5538821, 1, 1, 1, 1, 1,
-0.2433639, -0.39299, -4.71409, 1, 1, 1, 1, 1,
-0.2361369, -0.8470669, -2.466838, 1, 1, 1, 1, 1,
-0.2340452, -0.4313134, -2.939869, 1, 1, 1, 1, 1,
-0.2238789, 0.4665864, 0.2746576, 0, 0, 1, 1, 1,
-0.2220814, -0.4817958, -3.778362, 1, 0, 0, 1, 1,
-0.2207508, 0.4571067, -1.000031, 1, 0, 0, 1, 1,
-0.2200695, 0.1812073, -0.2837595, 1, 0, 0, 1, 1,
-0.2184016, -1.488502, -2.838614, 1, 0, 0, 1, 1,
-0.2169846, 1.904655, 0.3238998, 1, 0, 0, 1, 1,
-0.2130097, -0.5265672, -3.09539, 0, 0, 0, 1, 1,
-0.210052, 1.415021, -0.8544053, 0, 0, 0, 1, 1,
-0.2099218, 1.443947, -0.2603294, 0, 0, 0, 1, 1,
-0.2076328, -2.159499, -3.099344, 0, 0, 0, 1, 1,
-0.2051439, 1.265276, 0.130376, 0, 0, 0, 1, 1,
-0.2014239, 0.1107783, -2.864569, 0, 0, 0, 1, 1,
-0.1991612, -0.6378353, -4.311561, 0, 0, 0, 1, 1,
-0.1927301, -0.826515, -2.625167, 1, 1, 1, 1, 1,
-0.1919531, -0.1010229, -3.002551, 1, 1, 1, 1, 1,
-0.189301, -0.1193573, -2.028574, 1, 1, 1, 1, 1,
-0.1891286, -0.9809763, -3.341992, 1, 1, 1, 1, 1,
-0.1884733, 2.110335, -1.639017, 1, 1, 1, 1, 1,
-0.184993, -0.05291921, -0.5233007, 1, 1, 1, 1, 1,
-0.1816008, -0.04800529, -1.444316, 1, 1, 1, 1, 1,
-0.1779384, 1.009629, -1.226151, 1, 1, 1, 1, 1,
-0.1761097, 0.8909839, -0.7987489, 1, 1, 1, 1, 1,
-0.1700032, -0.768139, -1.762572, 1, 1, 1, 1, 1,
-0.167379, 0.7757397, 0.168018, 1, 1, 1, 1, 1,
-0.1638962, 0.8694669, -2.93443, 1, 1, 1, 1, 1,
-0.1621836, -1.170034, -3.814257, 1, 1, 1, 1, 1,
-0.1605347, 1.523961, -0.1763069, 1, 1, 1, 1, 1,
-0.1572674, 0.5160286, -0.804474, 1, 1, 1, 1, 1,
-0.1559908, -1.04447, -4.573978, 0, 0, 1, 1, 1,
-0.1528079, 0.1395748, -0.1842695, 1, 0, 0, 1, 1,
-0.1515369, -0.08487566, -2.234159, 1, 0, 0, 1, 1,
-0.1513597, -0.2053905, -2.66204, 1, 0, 0, 1, 1,
-0.1480545, -0.03051546, -2.258584, 1, 0, 0, 1, 1,
-0.1456054, 1.442906, 0.292909, 1, 0, 0, 1, 1,
-0.1429858, -1.977361, -2.398261, 0, 0, 0, 1, 1,
-0.1410287, -2.45777, -1.868753, 0, 0, 0, 1, 1,
-0.1341688, -0.6874204, -4.451561, 0, 0, 0, 1, 1,
-0.1335098, 0.02796742, -2.54537, 0, 0, 0, 1, 1,
-0.1284841, 0.2143951, -1.138662, 0, 0, 0, 1, 1,
-0.1273413, -1.316805, -2.383133, 0, 0, 0, 1, 1,
-0.1264021, -0.4460627, -1.095661, 0, 0, 0, 1, 1,
-0.1263702, -0.9177797, -4.453834, 1, 1, 1, 1, 1,
-0.1254015, -0.1458421, -1.645048, 1, 1, 1, 1, 1,
-0.1243337, 1.4361, -2.381787, 1, 1, 1, 1, 1,
-0.1219563, -0.8612716, -3.254122, 1, 1, 1, 1, 1,
-0.1201592, 1.753525, 1.700706, 1, 1, 1, 1, 1,
-0.1146068, 1.280187, 1.815124, 1, 1, 1, 1, 1,
-0.1118396, 1.546009, -0.1267871, 1, 1, 1, 1, 1,
-0.1086224, 0.6335403, -0.3207395, 1, 1, 1, 1, 1,
-0.1085195, 0.5450109, -0.5632909, 1, 1, 1, 1, 1,
-0.1048404, 0.05218034, -1.322175, 1, 1, 1, 1, 1,
-0.1031197, 0.1584354, 0.2885896, 1, 1, 1, 1, 1,
-0.1004741, -0.0006182353, -0.9037524, 1, 1, 1, 1, 1,
-0.09755015, -0.3624747, -2.363519, 1, 1, 1, 1, 1,
-0.09580617, 1.496711, 1.044377, 1, 1, 1, 1, 1,
-0.09240162, 1.025777, 0.6900941, 1, 1, 1, 1, 1,
-0.08971485, -0.7337552, -4.252265, 0, 0, 1, 1, 1,
-0.08803906, 1.310263, -0.2554163, 1, 0, 0, 1, 1,
-0.08567525, 0.5668879, -1.444946, 1, 0, 0, 1, 1,
-0.08517515, 0.05162593, -0.5158696, 1, 0, 0, 1, 1,
-0.08294475, -0.2901649, -2.735223, 1, 0, 0, 1, 1,
-0.08126894, -0.3177836, -3.084668, 1, 0, 0, 1, 1,
-0.07925855, -0.6280215, -2.667275, 0, 0, 0, 1, 1,
-0.07896946, 0.6257069, -0.8461331, 0, 0, 0, 1, 1,
-0.07707819, -0.4459893, -3.179111, 0, 0, 0, 1, 1,
-0.0747852, 0.8024868, 0.0996984, 0, 0, 0, 1, 1,
-0.07455753, 0.8067859, -0.3083768, 0, 0, 0, 1, 1,
-0.06975875, -0.2736888, -3.156711, 0, 0, 0, 1, 1,
-0.06369526, 1.839764, 0.2479634, 0, 0, 0, 1, 1,
-0.05749013, 0.3103935, 0.6573411, 1, 1, 1, 1, 1,
-0.0562777, 0.4102152, 0.9232197, 1, 1, 1, 1, 1,
-0.05580907, 1.091689, -1.439936, 1, 1, 1, 1, 1,
-0.05415402, 1.492853, -0.2698693, 1, 1, 1, 1, 1,
-0.05305519, -0.7608094, -3.617134, 1, 1, 1, 1, 1,
-0.05009991, 0.1454438, 2.235506, 1, 1, 1, 1, 1,
-0.04404404, 1.568338, -1.095272, 1, 1, 1, 1, 1,
-0.04323724, 0.02465714, -1.433314, 1, 1, 1, 1, 1,
-0.04284126, -0.6520437, -4.269559, 1, 1, 1, 1, 1,
-0.03507326, -1.370805, -3.797075, 1, 1, 1, 1, 1,
-0.03189564, 0.2858968, 0.5607244, 1, 1, 1, 1, 1,
-0.03109116, -0.1709129, -3.058131, 1, 1, 1, 1, 1,
-0.01920892, 0.7122191, -1.608342, 1, 1, 1, 1, 1,
-0.0190619, -0.324523, -2.686933, 1, 1, 1, 1, 1,
-0.01195732, -0.3833693, -3.730398, 1, 1, 1, 1, 1,
-0.01005899, -0.2543666, -1.8012, 0, 0, 1, 1, 1,
-0.007729859, 0.2026638, 1.078116, 1, 0, 0, 1, 1,
-0.006314752, 0.7527064, -2.278936, 1, 0, 0, 1, 1,
-0.004404107, 0.495695, 0.8192668, 1, 0, 0, 1, 1,
-0.00114936, -1.299235, -3.848051, 1, 0, 0, 1, 1,
0.002693044, -0.4126088, 3.06213, 1, 0, 0, 1, 1,
0.003199795, 0.3644325, -0.06471697, 0, 0, 0, 1, 1,
0.003709154, -0.9982628, 2.636844, 0, 0, 0, 1, 1,
0.004879228, 0.9249544, -0.2370531, 0, 0, 0, 1, 1,
0.006231161, 0.8688277, -0.4881741, 0, 0, 0, 1, 1,
0.007012322, -1.214088, 1.256579, 0, 0, 0, 1, 1,
0.007542957, -0.01620162, 2.088896, 0, 0, 0, 1, 1,
0.0078596, 1.413702, -0.1581085, 0, 0, 0, 1, 1,
0.01223397, 0.3298318, -0.03007752, 1, 1, 1, 1, 1,
0.01798383, 1.667605, 0.3869897, 1, 1, 1, 1, 1,
0.02302865, -2.102083, 2.754171, 1, 1, 1, 1, 1,
0.02303855, 1.086929, 1.637079, 1, 1, 1, 1, 1,
0.02337644, 1.141185, -0.07906744, 1, 1, 1, 1, 1,
0.02620864, 1.054488, 0.5764109, 1, 1, 1, 1, 1,
0.02905928, 1.667098, -0.6608788, 1, 1, 1, 1, 1,
0.0305628, -1.762505, 1.83862, 1, 1, 1, 1, 1,
0.03333167, -0.02698635, 2.297646, 1, 1, 1, 1, 1,
0.03481947, 2.323464, 0.002437029, 1, 1, 1, 1, 1,
0.0372467, -2.913011, 4.034058, 1, 1, 1, 1, 1,
0.04375165, -0.9192747, 1.793298, 1, 1, 1, 1, 1,
0.04623647, 0.8645194, 0.03387515, 1, 1, 1, 1, 1,
0.04652086, -0.4346964, 2.042499, 1, 1, 1, 1, 1,
0.04938436, 0.3847105, 0.2401833, 1, 1, 1, 1, 1,
0.04956072, -0.5842878, 1.826272, 0, 0, 1, 1, 1,
0.05018433, 1.464924, 0.09758573, 1, 0, 0, 1, 1,
0.05100755, -1.200057, 2.843138, 1, 0, 0, 1, 1,
0.05321291, -0.3278259, 1.290533, 1, 0, 0, 1, 1,
0.05359317, 0.6416714, -1.02519, 1, 0, 0, 1, 1,
0.05644562, 0.351269, 0.1214694, 1, 0, 0, 1, 1,
0.06328705, -0.1880598, 3.634992, 0, 0, 0, 1, 1,
0.06701632, 0.8921099, -0.1962423, 0, 0, 0, 1, 1,
0.06900588, 0.04823143, 0.5244299, 0, 0, 0, 1, 1,
0.07594547, -0.7541972, 1.238918, 0, 0, 0, 1, 1,
0.07606605, -0.6229705, 2.96506, 0, 0, 0, 1, 1,
0.07631475, -0.1988125, 2.168971, 0, 0, 0, 1, 1,
0.0798509, 0.4550982, -0.6218386, 0, 0, 0, 1, 1,
0.08040464, 0.4990315, 0.7100616, 1, 1, 1, 1, 1,
0.0816856, -1.021717, 3.635675, 1, 1, 1, 1, 1,
0.08183973, 0.3576846, 1.469119, 1, 1, 1, 1, 1,
0.0821937, -0.700995, 2.757809, 1, 1, 1, 1, 1,
0.08371323, -2.432774, 2.739218, 1, 1, 1, 1, 1,
0.08420046, 0.4580334, -0.5477429, 1, 1, 1, 1, 1,
0.08476333, -0.2115797, 4.324809, 1, 1, 1, 1, 1,
0.08488288, -0.874136, 3.47414, 1, 1, 1, 1, 1,
0.09524117, 0.1360745, 0.8345054, 1, 1, 1, 1, 1,
0.09587172, 1.123774, -1.216614, 1, 1, 1, 1, 1,
0.09591028, 0.2320152, 0.352828, 1, 1, 1, 1, 1,
0.0959435, 0.1769595, 1.211004, 1, 1, 1, 1, 1,
0.09953614, -0.2577153, 3.854789, 1, 1, 1, 1, 1,
0.1026297, -2.014157, 4.933884, 1, 1, 1, 1, 1,
0.1028597, -0.01843418, 0.3819399, 1, 1, 1, 1, 1,
0.1145498, 0.5918776, 0.9558237, 0, 0, 1, 1, 1,
0.1256466, 0.04106641, 1.444805, 1, 0, 0, 1, 1,
0.1263636, -0.1539893, 2.312594, 1, 0, 0, 1, 1,
0.1268646, -0.05622094, 1.476157, 1, 0, 0, 1, 1,
0.1272595, 0.4662921, 1.833582, 1, 0, 0, 1, 1,
0.1278788, -0.7076059, 2.335978, 1, 0, 0, 1, 1,
0.1294532, -1.286203, 2.655934, 0, 0, 0, 1, 1,
0.1302939, 1.383797, -0.4282565, 0, 0, 0, 1, 1,
0.1389941, 1.979332, -0.9276782, 0, 0, 0, 1, 1,
0.1399185, -1.04874, 2.152052, 0, 0, 0, 1, 1,
0.1472741, 1.472366, 0.8640785, 0, 0, 0, 1, 1,
0.1494825, 0.6147856, 1.162818, 0, 0, 0, 1, 1,
0.1495207, 0.3523672, -1.870331, 0, 0, 0, 1, 1,
0.150739, -0.5467767, 1.275757, 1, 1, 1, 1, 1,
0.1510021, 1.022068, 0.7214056, 1, 1, 1, 1, 1,
0.1638209, -0.1843294, 2.076104, 1, 1, 1, 1, 1,
0.1648805, -0.9819651, 2.395176, 1, 1, 1, 1, 1,
0.1679569, 0.05807054, 2.082624, 1, 1, 1, 1, 1,
0.1706373, -1.752364, 3.313787, 1, 1, 1, 1, 1,
0.1735087, 1.159184, -0.5531147, 1, 1, 1, 1, 1,
0.1738624, -0.4054927, 3.992197, 1, 1, 1, 1, 1,
0.1739941, -0.6187056, 4.470535, 1, 1, 1, 1, 1,
0.1758088, -0.9751943, 4.066703, 1, 1, 1, 1, 1,
0.1771439, 0.5245582, 0.6188766, 1, 1, 1, 1, 1,
0.1776632, 0.3934113, 0.8615221, 1, 1, 1, 1, 1,
0.1796598, -0.129206, 3.061221, 1, 1, 1, 1, 1,
0.1838388, -1.153165, 2.4452, 1, 1, 1, 1, 1,
0.1857712, 0.04469835, 3.680964, 1, 1, 1, 1, 1,
0.1880881, 0.3756916, 1.240923, 0, 0, 1, 1, 1,
0.1894118, -0.1609887, 2.614298, 1, 0, 0, 1, 1,
0.189859, 0.8248029, 0.1074301, 1, 0, 0, 1, 1,
0.1910095, -0.6547468, 2.928098, 1, 0, 0, 1, 1,
0.1928443, -0.3709116, 2.34565, 1, 0, 0, 1, 1,
0.1935794, -0.5155225, 1.876457, 1, 0, 0, 1, 1,
0.1998315, 0.6338196, -1.260494, 0, 0, 0, 1, 1,
0.2051026, -0.4926038, 1.507901, 0, 0, 0, 1, 1,
0.2074243, 0.7034079, -0.4613442, 0, 0, 0, 1, 1,
0.2154371, 0.8133227, 0.3427275, 0, 0, 0, 1, 1,
0.2154907, 3.066203, -0.8971843, 0, 0, 0, 1, 1,
0.2203304, 0.9210372, 1.447783, 0, 0, 0, 1, 1,
0.2208873, 0.701229, 0.000634135, 0, 0, 0, 1, 1,
0.2210451, 0.7438745, 0.2914049, 1, 1, 1, 1, 1,
0.223962, -0.4021031, 2.35881, 1, 1, 1, 1, 1,
0.2287455, 1.064726, 2.680753, 1, 1, 1, 1, 1,
0.2328641, -1.453853, 2.672767, 1, 1, 1, 1, 1,
0.2340081, 0.5980042, -0.5773584, 1, 1, 1, 1, 1,
0.2366942, 1.399913, 0.6668962, 1, 1, 1, 1, 1,
0.2374595, 0.7851166, -0.6029447, 1, 1, 1, 1, 1,
0.240837, 0.6331398, -0.7823183, 1, 1, 1, 1, 1,
0.2435849, 0.722602, 1.106739, 1, 1, 1, 1, 1,
0.2448279, 0.9920585, 1.489776, 1, 1, 1, 1, 1,
0.2484226, 0.1845633, 1.29233, 1, 1, 1, 1, 1,
0.2486962, -1.410209, 2.296096, 1, 1, 1, 1, 1,
0.2550068, -0.3895871, 1.447952, 1, 1, 1, 1, 1,
0.2600532, 0.4232452, 1.691478, 1, 1, 1, 1, 1,
0.2634963, -1.427426, 2.862522, 1, 1, 1, 1, 1,
0.2645247, -0.4352681, 1.228247, 0, 0, 1, 1, 1,
0.266238, 0.3567287, 1.063547, 1, 0, 0, 1, 1,
0.2663373, 0.781365, -0.8202762, 1, 0, 0, 1, 1,
0.2669449, 1.030309, -0.8013031, 1, 0, 0, 1, 1,
0.267267, -0.1571615, 2.288674, 1, 0, 0, 1, 1,
0.2703704, 0.105035, 2.938352, 1, 0, 0, 1, 1,
0.2708151, -1.444631, 2.911298, 0, 0, 0, 1, 1,
0.2732713, -0.5374968, 2.549226, 0, 0, 0, 1, 1,
0.2733135, -1.606232, 1.931763, 0, 0, 0, 1, 1,
0.2739319, -0.9570847, 1.660149, 0, 0, 0, 1, 1,
0.2787338, 0.6822442, -1.117535, 0, 0, 0, 1, 1,
0.2826202, -0.4672304, 3.455749, 0, 0, 0, 1, 1,
0.2833454, 0.5890507, 0.001052128, 0, 0, 0, 1, 1,
0.2863676, -0.1144306, 1.804375, 1, 1, 1, 1, 1,
0.2872366, 1.274298, 1.006803, 1, 1, 1, 1, 1,
0.2907529, -1.290352, 4.53161, 1, 1, 1, 1, 1,
0.2909036, 0.6092523, 1.767591, 1, 1, 1, 1, 1,
0.2922904, -1.031075, 2.976135, 1, 1, 1, 1, 1,
0.2952887, 0.01449465, -1.066043, 1, 1, 1, 1, 1,
0.2957423, 1.313975, -2.640591, 1, 1, 1, 1, 1,
0.3026571, 0.9523631, 1.823311, 1, 1, 1, 1, 1,
0.3056238, 1.201829, 1.558301, 1, 1, 1, 1, 1,
0.3076642, -0.4104862, 1.827781, 1, 1, 1, 1, 1,
0.3118408, 0.85937, -1.641718, 1, 1, 1, 1, 1,
0.3137822, -1.00106, 4.576229, 1, 1, 1, 1, 1,
0.3158657, -0.08880108, 2.270348, 1, 1, 1, 1, 1,
0.3160301, -0.4564302, 2.627173, 1, 1, 1, 1, 1,
0.3265767, -1.103002, 3.08212, 1, 1, 1, 1, 1,
0.3266024, -0.07252888, 1.054228, 0, 0, 1, 1, 1,
0.3293412, -1.427474, 4.46918, 1, 0, 0, 1, 1,
0.329825, -1.95601, 1.189775, 1, 0, 0, 1, 1,
0.3326117, 0.9106766, 0.09172966, 1, 0, 0, 1, 1,
0.3396241, -2.096939, 1.29847, 1, 0, 0, 1, 1,
0.3416828, 1.26714, 0.3964368, 1, 0, 0, 1, 1,
0.3431733, -0.2954603, 0.9149373, 0, 0, 0, 1, 1,
0.3433823, -0.3645819, 2.537264, 0, 0, 0, 1, 1,
0.3444004, 0.05314432, 2.786772, 0, 0, 0, 1, 1,
0.344444, -0.8294084, 4.130246, 0, 0, 0, 1, 1,
0.3455175, -0.135137, 1.754915, 0, 0, 0, 1, 1,
0.3463621, 1.06426, 0.9151698, 0, 0, 0, 1, 1,
0.347458, -0.4487368, 0.04125422, 0, 0, 0, 1, 1,
0.3485674, -1.292623, 4.458736, 1, 1, 1, 1, 1,
0.3509321, -0.3263402, 1.322287, 1, 1, 1, 1, 1,
0.3522972, 0.5921353, 1.453281, 1, 1, 1, 1, 1,
0.3523673, 0.3735444, -0.1313559, 1, 1, 1, 1, 1,
0.353989, 1.978944, 0.08490792, 1, 1, 1, 1, 1,
0.3540621, 1.078245, 1.497374, 1, 1, 1, 1, 1,
0.3582492, 0.2330212, -0.550276, 1, 1, 1, 1, 1,
0.3583592, -0.8661795, 2.405358, 1, 1, 1, 1, 1,
0.3584132, 0.2698968, 1.031354, 1, 1, 1, 1, 1,
0.3590718, 1.911399, 0.9904828, 1, 1, 1, 1, 1,
0.3639585, 1.653577, 0.2266748, 1, 1, 1, 1, 1,
0.3665004, -0.07043979, 2.134013, 1, 1, 1, 1, 1,
0.3694386, 0.7120035, 0.9998033, 1, 1, 1, 1, 1,
0.3733647, -0.3285638, 1.50768, 1, 1, 1, 1, 1,
0.3742546, -0.5320889, 2.506182, 1, 1, 1, 1, 1,
0.3786669, 2.52993, 0.1819163, 0, 0, 1, 1, 1,
0.3788041, 1.582232, 1.15535, 1, 0, 0, 1, 1,
0.3836915, 1.695612, 0.6675668, 1, 0, 0, 1, 1,
0.3903139, -0.5368335, 3.024894, 1, 0, 0, 1, 1,
0.3928109, 2.336193, -0.2270271, 1, 0, 0, 1, 1,
0.3947413, -0.01416453, 1.440378, 1, 0, 0, 1, 1,
0.3979139, -2.272518, 0.6477677, 0, 0, 0, 1, 1,
0.4060472, 1.686149, 1.633882, 0, 0, 0, 1, 1,
0.4064593, 0.1761859, -1.111262, 0, 0, 0, 1, 1,
0.4067214, 0.02363658, 1.98523, 0, 0, 0, 1, 1,
0.406841, -0.8357235, 2.419096, 0, 0, 0, 1, 1,
0.4080342, 2.547517, 0.9419389, 0, 0, 0, 1, 1,
0.4082849, 0.5367002, 1.501458, 0, 0, 0, 1, 1,
0.4211195, -0.2720532, 0.3190305, 1, 1, 1, 1, 1,
0.42351, -0.07659005, 1.101136, 1, 1, 1, 1, 1,
0.4248005, -0.4977121, 1.052917, 1, 1, 1, 1, 1,
0.4300883, -1.143165, 2.626089, 1, 1, 1, 1, 1,
0.4303066, -0.9389833, 3.769998, 1, 1, 1, 1, 1,
0.4381501, -0.6824688, 3.788993, 1, 1, 1, 1, 1,
0.4385567, -0.2183542, 0.4127654, 1, 1, 1, 1, 1,
0.4392088, 0.4002291, 0.5621622, 1, 1, 1, 1, 1,
0.439784, 0.2407059, 0.6834956, 1, 1, 1, 1, 1,
0.4414918, -0.9793088, 3.549785, 1, 1, 1, 1, 1,
0.4422728, -0.7963541, 1.929534, 1, 1, 1, 1, 1,
0.4505717, -0.2068782, 2.19398, 1, 1, 1, 1, 1,
0.4511704, -0.5533657, 2.343683, 1, 1, 1, 1, 1,
0.4535438, -1.128391, 2.931034, 1, 1, 1, 1, 1,
0.4548337, 1.19433, 0.07941461, 1, 1, 1, 1, 1,
0.4604528, -0.09017921, 1.15609, 0, 0, 1, 1, 1,
0.4612297, -0.6377709, 1.280428, 1, 0, 0, 1, 1,
0.4633648, 0.744405, -0.04438392, 1, 0, 0, 1, 1,
0.4671856, 0.1236072, 1.006303, 1, 0, 0, 1, 1,
0.4675121, 0.1335658, 0.9838329, 1, 0, 0, 1, 1,
0.4681945, -1.712131, 2.695451, 1, 0, 0, 1, 1,
0.4686864, -0.8846463, 3.017836, 0, 0, 0, 1, 1,
0.4703333, 0.06362128, 0.7097797, 0, 0, 0, 1, 1,
0.4730241, 1.782918, -0.639375, 0, 0, 0, 1, 1,
0.4749573, 1.213523, 0.4625367, 0, 0, 0, 1, 1,
0.4758989, 2.406687, -0.1865404, 0, 0, 0, 1, 1,
0.4765525, 0.3836742, 0.8551362, 0, 0, 0, 1, 1,
0.4769899, -1.63802, 3.226056, 0, 0, 0, 1, 1,
0.4823712, -0.6294529, 1.439819, 1, 1, 1, 1, 1,
0.4833592, -0.8040578, 3.438758, 1, 1, 1, 1, 1,
0.4835697, 0.07083898, 1.564459, 1, 1, 1, 1, 1,
0.4836093, -1.081273, 2.026867, 1, 1, 1, 1, 1,
0.48706, -0.8158056, 1.636577, 1, 1, 1, 1, 1,
0.4986576, 0.05734272, 1.111023, 1, 1, 1, 1, 1,
0.5020247, 1.791991, 2.523817, 1, 1, 1, 1, 1,
0.5036892, -0.2067879, 2.633086, 1, 1, 1, 1, 1,
0.5062324, -1.129467, 1.911272, 1, 1, 1, 1, 1,
0.5068083, 1.017107, 1.436368, 1, 1, 1, 1, 1,
0.5171914, -0.6397069, 3.489445, 1, 1, 1, 1, 1,
0.5237851, -1.019336, 1.904806, 1, 1, 1, 1, 1,
0.5277484, -1.004596, 1.884978, 1, 1, 1, 1, 1,
0.529405, -0.510936, 1.62001, 1, 1, 1, 1, 1,
0.5358447, -1.222243, 4.287723, 1, 1, 1, 1, 1,
0.5429882, -0.9345844, 4.439161, 0, 0, 1, 1, 1,
0.5447512, 1.862877, -1.093635, 1, 0, 0, 1, 1,
0.5457576, 0.6686147, 1.393673, 1, 0, 0, 1, 1,
0.5467329, -0.4740889, 1.974262, 1, 0, 0, 1, 1,
0.547488, -0.2432092, 2.02478, 1, 0, 0, 1, 1,
0.5476404, 0.5880929, 0.4349209, 1, 0, 0, 1, 1,
0.5482705, 0.04436879, 1.006867, 0, 0, 0, 1, 1,
0.5497199, -1.750597, 4.019753, 0, 0, 0, 1, 1,
0.5543565, -0.7103812, 3.505653, 0, 0, 0, 1, 1,
0.5610927, -0.2453255, 1.858363, 0, 0, 0, 1, 1,
0.5638997, 0.859632, -0.172459, 0, 0, 0, 1, 1,
0.564826, 0.6799049, 0.4284984, 0, 0, 0, 1, 1,
0.5666286, 1.083044, 1.405562, 0, 0, 0, 1, 1,
0.5714005, -1.193931, 0.8149055, 1, 1, 1, 1, 1,
0.5828389, 0.3526576, 1.078962, 1, 1, 1, 1, 1,
0.585476, -0.3646409, 1.747262, 1, 1, 1, 1, 1,
0.5873756, -1.757968, 4.844023, 1, 1, 1, 1, 1,
0.5908843, 0.5076482, 3.561177, 1, 1, 1, 1, 1,
0.5976405, 0.0455009, 1.767709, 1, 1, 1, 1, 1,
0.6022397, 1.480117, 1.754769, 1, 1, 1, 1, 1,
0.6042761, -0.5386141, 1.823049, 1, 1, 1, 1, 1,
0.6058448, -0.7405094, 4.308493, 1, 1, 1, 1, 1,
0.6072036, 0.8203667, 0.3207951, 1, 1, 1, 1, 1,
0.6075938, 2.096642, 1.422177, 1, 1, 1, 1, 1,
0.6100027, -1.627227, 1.747379, 1, 1, 1, 1, 1,
0.6109135, -0.5067636, 1.987272, 1, 1, 1, 1, 1,
0.6141031, -0.001220426, 2.307737, 1, 1, 1, 1, 1,
0.6159735, -0.4394715, 1.895439, 1, 1, 1, 1, 1,
0.6244389, 0.307154, 1.851885, 0, 0, 1, 1, 1,
0.6257018, 0.8288619, 1.147942, 1, 0, 0, 1, 1,
0.6340894, -0.8098941, 2.681547, 1, 0, 0, 1, 1,
0.6361803, -0.6925907, 1.740457, 1, 0, 0, 1, 1,
0.6414474, 0.1112931, 0.349932, 1, 0, 0, 1, 1,
0.6441125, -0.69672, 2.235854, 1, 0, 0, 1, 1,
0.6454347, 0.7184873, -0.6125618, 0, 0, 0, 1, 1,
0.6461834, 0.2478573, 0.8158263, 0, 0, 0, 1, 1,
0.6511693, 0.1058178, 0.9237542, 0, 0, 0, 1, 1,
0.6521463, -2.662424, 2.755533, 0, 0, 0, 1, 1,
0.6586348, -1.305331, 3.758062, 0, 0, 0, 1, 1,
0.6612118, -0.8849139, 3.080695, 0, 0, 0, 1, 1,
0.6644639, -0.435589, 1.832681, 0, 0, 0, 1, 1,
0.6656526, 0.9290386, -0.09506277, 1, 1, 1, 1, 1,
0.6671059, 0.2776652, 3.040826, 1, 1, 1, 1, 1,
0.6687675, 0.6822212, 2.576573, 1, 1, 1, 1, 1,
0.6711368, -1.148873, 1.809769, 1, 1, 1, 1, 1,
0.6728535, 1.761673, 0.4818573, 1, 1, 1, 1, 1,
0.6762962, 0.6055905, 0.7243955, 1, 1, 1, 1, 1,
0.6769329, 0.8227957, 2.324718, 1, 1, 1, 1, 1,
0.6850475, -0.6494661, 4.211743, 1, 1, 1, 1, 1,
0.686789, 0.04025163, 1.91288, 1, 1, 1, 1, 1,
0.6897731, -0.4918522, 0.9906237, 1, 1, 1, 1, 1,
0.699932, -1.54679, 0.3051326, 1, 1, 1, 1, 1,
0.7054875, -0.4591439, 2.153688, 1, 1, 1, 1, 1,
0.7121491, -0.7584869, 2.985944, 1, 1, 1, 1, 1,
0.7127184, 0.5303438, 0.4061452, 1, 1, 1, 1, 1,
0.7127394, 0.2275834, 1.959043, 1, 1, 1, 1, 1,
0.7157145, 0.5560325, 0.8986164, 0, 0, 1, 1, 1,
0.7177384, 1.447342, 1.611331, 1, 0, 0, 1, 1,
0.7215039, -0.6680644, 1.295174, 1, 0, 0, 1, 1,
0.722952, -0.792307, 2.528122, 1, 0, 0, 1, 1,
0.7371144, 0.1412213, -0.2454627, 1, 0, 0, 1, 1,
0.7397062, -0.2525037, 1.942756, 1, 0, 0, 1, 1,
0.7427517, -0.5287915, 1.337864, 0, 0, 0, 1, 1,
0.7448266, 0.8490883, 1.003936, 0, 0, 0, 1, 1,
0.7467107, 0.6272483, 2.073308, 0, 0, 0, 1, 1,
0.7468202, 0.4203345, 1.331975, 0, 0, 0, 1, 1,
0.7483842, -0.144359, 2.486962, 0, 0, 0, 1, 1,
0.7504712, 0.281764, 0.1286516, 0, 0, 0, 1, 1,
0.7529724, -0.8740399, 2.726537, 0, 0, 0, 1, 1,
0.756482, 1.730018, 1.011863, 1, 1, 1, 1, 1,
0.769848, 1.37889, 0.7226928, 1, 1, 1, 1, 1,
0.7719738, 0.5451511, 2.757034, 1, 1, 1, 1, 1,
0.775528, -0.8896608, 2.299063, 1, 1, 1, 1, 1,
0.7801023, -0.5031494, 1.578134, 1, 1, 1, 1, 1,
0.7819058, 0.6100509, 2.140071, 1, 1, 1, 1, 1,
0.7935864, 0.119541, 1.328161, 1, 1, 1, 1, 1,
0.7973948, -1.704977, 1.981505, 1, 1, 1, 1, 1,
0.8015616, -0.1361654, 3.062667, 1, 1, 1, 1, 1,
0.810966, -0.04685072, 1.673177, 1, 1, 1, 1, 1,
0.8135373, 1.027851, 0.4183142, 1, 1, 1, 1, 1,
0.8141976, -0.1403938, 0.6843923, 1, 1, 1, 1, 1,
0.8164545, -0.663007, 2.053394, 1, 1, 1, 1, 1,
0.8207048, 0.6204613, 0.5279925, 1, 1, 1, 1, 1,
0.8376195, -0.01926211, -0.02455987, 1, 1, 1, 1, 1,
0.8395895, 0.4529802, 3.389275, 0, 0, 1, 1, 1,
0.8489795, 0.6980534, 3.068191, 1, 0, 0, 1, 1,
0.8508884, 2.219763, -0.8749546, 1, 0, 0, 1, 1,
0.8523425, 0.8109988, 1.815597, 1, 0, 0, 1, 1,
0.8560156, -0.8138868, 2.771173, 1, 0, 0, 1, 1,
0.8576797, 0.3744677, -0.3487548, 1, 0, 0, 1, 1,
0.8637105, 0.6950105, 1.405301, 0, 0, 0, 1, 1,
0.8656311, -1.558985, 0.4679264, 0, 0, 0, 1, 1,
0.8671067, -1.32182, 2.843393, 0, 0, 0, 1, 1,
0.8747282, 0.8949406, 1.67097, 0, 0, 0, 1, 1,
0.8780154, -0.182143, 3.726848, 0, 0, 0, 1, 1,
0.8819454, 0.5848773, 1.426607, 0, 0, 0, 1, 1,
0.8839824, 0.2145847, 3.859184, 0, 0, 0, 1, 1,
0.8852351, 1.354763, 0.8570262, 1, 1, 1, 1, 1,
0.8923142, -0.2830089, 4.608017, 1, 1, 1, 1, 1,
0.8984649, -2.161279, 4.317861, 1, 1, 1, 1, 1,
0.8986983, 0.7077572, 1.389185, 1, 1, 1, 1, 1,
0.904396, 0.7486383, 0.9275674, 1, 1, 1, 1, 1,
0.9068788, -0.6399184, 2.450075, 1, 1, 1, 1, 1,
0.9071513, -0.6086087, 1.11929, 1, 1, 1, 1, 1,
0.9138435, 0.7126964, 1.196093, 1, 1, 1, 1, 1,
0.9147305, 0.1774401, 2.968878, 1, 1, 1, 1, 1,
0.9150417, -0.3747114, 4.143453, 1, 1, 1, 1, 1,
0.9216853, -0.1681662, 3.432783, 1, 1, 1, 1, 1,
0.9247267, 1.727212, 1.716653, 1, 1, 1, 1, 1,
0.9330459, -1.011733, 3.854086, 1, 1, 1, 1, 1,
0.9356619, -0.27901, 2.624656, 1, 1, 1, 1, 1,
0.9393235, -0.1670576, 1.467449, 1, 1, 1, 1, 1,
0.940892, -1.080866, 3.219926, 0, 0, 1, 1, 1,
0.9431579, -0.02984559, 1.347316, 1, 0, 0, 1, 1,
0.9476533, -0.6731592, 1.047518, 1, 0, 0, 1, 1,
0.9478871, -2.114827, 2.441285, 1, 0, 0, 1, 1,
0.956929, 0.3754042, 1.407264, 1, 0, 0, 1, 1,
0.9577064, -0.9973183, 2.558636, 1, 0, 0, 1, 1,
0.9580493, 0.2150189, 1.547847, 0, 0, 0, 1, 1,
0.960693, 1.757827, 1.165504, 0, 0, 0, 1, 1,
0.9609041, -0.338248, 2.557725, 0, 0, 0, 1, 1,
0.9620493, -0.2438828, 1.239211, 0, 0, 0, 1, 1,
0.9636416, -1.219991, 1.428419, 0, 0, 0, 1, 1,
0.964406, 0.9128543, 1.717099, 0, 0, 0, 1, 1,
0.9696462, -0.04116753, 1.810051, 0, 0, 0, 1, 1,
0.9697305, -0.7338922, 1.28617, 1, 1, 1, 1, 1,
0.9699412, 1.852705, 0.3620577, 1, 1, 1, 1, 1,
0.9763617, -0.0604828, 0.763992, 1, 1, 1, 1, 1,
0.9882121, -2.080784, 2.133777, 1, 1, 1, 1, 1,
1.005013, 0.1976227, 2.653851, 1, 1, 1, 1, 1,
1.007299, -0.07653178, 2.197598, 1, 1, 1, 1, 1,
1.010026, 1.170411, 0.8062189, 1, 1, 1, 1, 1,
1.029364, 0.4549369, -0.5423988, 1, 1, 1, 1, 1,
1.031956, -0.0674092, 1.98448, 1, 1, 1, 1, 1,
1.043696, 0.2552675, 2.5969, 1, 1, 1, 1, 1,
1.046499, -2.46519, 3.074384, 1, 1, 1, 1, 1,
1.047616, -0.5540003, 3.601376, 1, 1, 1, 1, 1,
1.049837, -0.4264512, 1.092848, 1, 1, 1, 1, 1,
1.05051, 2.007927, 0.8049179, 1, 1, 1, 1, 1,
1.05411, 1.181236, 0.8502705, 1, 1, 1, 1, 1,
1.059041, -1.061845, 3.412087, 0, 0, 1, 1, 1,
1.060294, -0.06873715, 0.9813225, 1, 0, 0, 1, 1,
1.061112, 1.752652, 0.1268224, 1, 0, 0, 1, 1,
1.072006, 1.208047, 0.5627146, 1, 0, 0, 1, 1,
1.079132, 0.1217434, 1.237, 1, 0, 0, 1, 1,
1.079374, 1.267024, 0.9698848, 1, 0, 0, 1, 1,
1.084496, -0.1444143, 3.313836, 0, 0, 0, 1, 1,
1.094577, 0.6148406, 1.249831, 0, 0, 0, 1, 1,
1.09631, 1.574062, 0.07132301, 0, 0, 0, 1, 1,
1.109866, 0.630061, 1.550378, 0, 0, 0, 1, 1,
1.109889, -0.802089, 1.491968, 0, 0, 0, 1, 1,
1.111969, 0.6571164, 1.513701, 0, 0, 0, 1, 1,
1.112025, 0.0118445, 1.527177, 0, 0, 0, 1, 1,
1.112508, 0.6814162, 1.468739, 1, 1, 1, 1, 1,
1.115374, 2.581286, 0.4478909, 1, 1, 1, 1, 1,
1.123785, -1.947533, 2.224034, 1, 1, 1, 1, 1,
1.13573, -0.5867679, 4.063217, 1, 1, 1, 1, 1,
1.136075, 0.8140524, 2.466876, 1, 1, 1, 1, 1,
1.136086, -1.470417, 1.844482, 1, 1, 1, 1, 1,
1.143519, 0.5360402, 1.410824, 1, 1, 1, 1, 1,
1.143769, 0.02381055, 1.801444, 1, 1, 1, 1, 1,
1.143984, -0.8228912, 2.871325, 1, 1, 1, 1, 1,
1.157515, 1.769307, 1.826415, 1, 1, 1, 1, 1,
1.16262, -0.08997124, 1.558672, 1, 1, 1, 1, 1,
1.164853, -0.909033, 2.108173, 1, 1, 1, 1, 1,
1.17277, 0.6577649, 1.265651, 1, 1, 1, 1, 1,
1.173511, 0.6064253, 0.8136519, 1, 1, 1, 1, 1,
1.180996, -0.1209929, 2.861456, 1, 1, 1, 1, 1,
1.185309, 0.7568047, 2.291112, 0, 0, 1, 1, 1,
1.189315, -1.101856, 2.625143, 1, 0, 0, 1, 1,
1.195386, -0.6854196, 2.92883, 1, 0, 0, 1, 1,
1.198901, -1.505672, 3.885561, 1, 0, 0, 1, 1,
1.203977, 0.5879842, 1.149233, 1, 0, 0, 1, 1,
1.212266, 1.303256, 0.232022, 1, 0, 0, 1, 1,
1.216389, 2.256987, -0.524708, 0, 0, 0, 1, 1,
1.219163, 0.2347192, 2.651781, 0, 0, 0, 1, 1,
1.227892, 1.429664, -1.65152, 0, 0, 0, 1, 1,
1.230039, -0.2450659, 0.02640875, 0, 0, 0, 1, 1,
1.235357, -0.9557904, 2.38492, 0, 0, 0, 1, 1,
1.236881, -0.3320723, 2.40714, 0, 0, 0, 1, 1,
1.242531, -0.5719529, 2.331723, 0, 0, 0, 1, 1,
1.243963, 1.432212, 0.7052147, 1, 1, 1, 1, 1,
1.24479, 0.1423827, 1.20668, 1, 1, 1, 1, 1,
1.245163, -0.3571981, 1.946854, 1, 1, 1, 1, 1,
1.251609, 0.6218806, 1.514653, 1, 1, 1, 1, 1,
1.251727, -0.9344824, 4.584241, 1, 1, 1, 1, 1,
1.253311, -0.2693161, 1.264367, 1, 1, 1, 1, 1,
1.25402, 0.9464739, 0.1622382, 1, 1, 1, 1, 1,
1.2615, -1.167569, 2.477468, 1, 1, 1, 1, 1,
1.261804, 0.2440263, 0.2906005, 1, 1, 1, 1, 1,
1.262833, -0.3286252, 1.531019, 1, 1, 1, 1, 1,
1.263044, 0.4330026, 0.6858149, 1, 1, 1, 1, 1,
1.26463, -0.7930683, 2.576788, 1, 1, 1, 1, 1,
1.264833, 0.4008271, 2.621315, 1, 1, 1, 1, 1,
1.266864, 1.121739, 1.520085, 1, 1, 1, 1, 1,
1.272472, 1.260887, 1.341857, 1, 1, 1, 1, 1,
1.272713, 1.728593, -0.6808897, 0, 0, 1, 1, 1,
1.273823, -0.3459249, 1.738343, 1, 0, 0, 1, 1,
1.281348, -0.5815824, 2.652522, 1, 0, 0, 1, 1,
1.281474, -1.015055, 2.311607, 1, 0, 0, 1, 1,
1.288705, -0.1525417, 0.1996755, 1, 0, 0, 1, 1,
1.290609, -0.6531685, 1.3497, 1, 0, 0, 1, 1,
1.291794, -1.682763, 2.925921, 0, 0, 0, 1, 1,
1.296315, 0.8720283, -0.7076436, 0, 0, 0, 1, 1,
1.297335, 1.0706, 0.3680505, 0, 0, 0, 1, 1,
1.299086, 0.6892002, 2.396254, 0, 0, 0, 1, 1,
1.309893, 0.2698201, 0.7798336, 0, 0, 0, 1, 1,
1.310135, -1.32778, 3.859459, 0, 0, 0, 1, 1,
1.315585, -1.712181, 5.024794, 0, 0, 0, 1, 1,
1.322138, 0.6659222, -1.133728, 1, 1, 1, 1, 1,
1.328532, -1.527263, 1.143077, 1, 1, 1, 1, 1,
1.331965, 0.4246438, 1.182939, 1, 1, 1, 1, 1,
1.337634, 0.6367095, 1.181985, 1, 1, 1, 1, 1,
1.34735, 1.255606, 1.092607, 1, 1, 1, 1, 1,
1.358442, -0.2897724, 3.445954, 1, 1, 1, 1, 1,
1.362735, -1.390326, 2.919148, 1, 1, 1, 1, 1,
1.370438, -1.249801, 4.950755, 1, 1, 1, 1, 1,
1.373034, -0.4319927, 2.165126, 1, 1, 1, 1, 1,
1.378163, -0.2199928, 2.290438, 1, 1, 1, 1, 1,
1.384629, -0.1297974, 3.463066, 1, 1, 1, 1, 1,
1.400188, 1.511497, 1.676495, 1, 1, 1, 1, 1,
1.401653, -0.8110414, 2.143887, 1, 1, 1, 1, 1,
1.413939, -0.01120435, -0.4669313, 1, 1, 1, 1, 1,
1.427547, 0.4746545, 0.4636182, 1, 1, 1, 1, 1,
1.428878, -0.5173749, 0.9636515, 0, 0, 1, 1, 1,
1.435309, -1.318962, 4.06951, 1, 0, 0, 1, 1,
1.446103, 0.2007856, -0.2762397, 1, 0, 0, 1, 1,
1.460807, 0.1663598, 2.067816, 1, 0, 0, 1, 1,
1.466449, -1.857953, 3.93465, 1, 0, 0, 1, 1,
1.472498, 0.8754088, 2.12911, 1, 0, 0, 1, 1,
1.477741, -1.464607, 1.551071, 0, 0, 0, 1, 1,
1.482413, 1.016048, -0.4842603, 0, 0, 0, 1, 1,
1.485942, 1.154201, 0.3122553, 0, 0, 0, 1, 1,
1.492319, -0.6653061, 0.8828637, 0, 0, 0, 1, 1,
1.494242, -1.315817, 1.213994, 0, 0, 0, 1, 1,
1.496511, -0.5026747, 2.343637, 0, 0, 0, 1, 1,
1.508499, -0.2583656, -0.4393404, 0, 0, 0, 1, 1,
1.523642, 0.01118865, 0.8405649, 1, 1, 1, 1, 1,
1.529498, -1.064241, 0.6398547, 1, 1, 1, 1, 1,
1.542916, -0.1963492, 0.5113965, 1, 1, 1, 1, 1,
1.550066, 0.7304661, -0.8226408, 1, 1, 1, 1, 1,
1.560464, 0.1238236, 1.587157, 1, 1, 1, 1, 1,
1.565822, -1.368635, 2.07479, 1, 1, 1, 1, 1,
1.570171, 1.759669, 1.44377, 1, 1, 1, 1, 1,
1.594587, -0.3924676, 1.829836, 1, 1, 1, 1, 1,
1.596476, 0.9557899, 2.829182, 1, 1, 1, 1, 1,
1.597178, -2.977784, 1.907661, 1, 1, 1, 1, 1,
1.607742, 0.8747468, 1.874159, 1, 1, 1, 1, 1,
1.629783, -0.3226537, 2.949209, 1, 1, 1, 1, 1,
1.647585, 0.3800201, 1.424183, 1, 1, 1, 1, 1,
1.672369, -0.9104258, 2.091441, 1, 1, 1, 1, 1,
1.688498, 0.02480013, 1.7375, 1, 1, 1, 1, 1,
1.699312, 0.001533879, 0.8770153, 0, 0, 1, 1, 1,
1.704634, -0.8571156, 2.035388, 1, 0, 0, 1, 1,
1.731115, 0.8969998, 1.31263, 1, 0, 0, 1, 1,
1.759922, -1.000641, 1.662462, 1, 0, 0, 1, 1,
1.769391, -0.4712267, 2.714889, 1, 0, 0, 1, 1,
1.784411, 0.04857067, 1.749953, 1, 0, 0, 1, 1,
1.794797, -1.032316, 3.013319, 0, 0, 0, 1, 1,
1.796936, 1.46601, 0.2828072, 0, 0, 0, 1, 1,
1.808936, -0.2334041, 1.707442, 0, 0, 0, 1, 1,
1.816756, 0.1707632, 1.045616, 0, 0, 0, 1, 1,
1.87884, -2.339294, 1.025222, 0, 0, 0, 1, 1,
1.891822, -2.407175, 1.792854, 0, 0, 0, 1, 1,
1.892029, 0.5374734, 2.990256, 0, 0, 0, 1, 1,
1.895146, -2.538272, 3.25024, 1, 1, 1, 1, 1,
1.915024, 0.07135699, -0.140317, 1, 1, 1, 1, 1,
1.947538, -0.7741603, 2.699077, 1, 1, 1, 1, 1,
1.952572, -2.3807, 2.728929, 1, 1, 1, 1, 1,
1.958992, 1.472081, 2.990462, 1, 1, 1, 1, 1,
1.987339, 0.6288095, 1.766563, 1, 1, 1, 1, 1,
2.007006, -1.162651, 2.467182, 1, 1, 1, 1, 1,
2.036373, 0.1434637, 0.225089, 1, 1, 1, 1, 1,
2.048449, 0.3196401, 0.3828134, 1, 1, 1, 1, 1,
2.090652, -0.6074118, 1.258017, 1, 1, 1, 1, 1,
2.094741, -0.2539376, 1.047283, 1, 1, 1, 1, 1,
2.113908, 0.6118672, 2.348637, 1, 1, 1, 1, 1,
2.159049, 1.721843, 0.2121348, 1, 1, 1, 1, 1,
2.186226, -0.08824573, 1.915943, 1, 1, 1, 1, 1,
2.201078, -0.9544911, 2.086965, 1, 1, 1, 1, 1,
2.222955, 0.3755289, 2.765283, 0, 0, 1, 1, 1,
2.223141, -1.536945, 1.8829, 1, 0, 0, 1, 1,
2.265309, 0.1409804, 0.4770137, 1, 0, 0, 1, 1,
2.305722, 0.2012031, 1.002463, 1, 0, 0, 1, 1,
2.324543, 0.07916237, 0.7875091, 1, 0, 0, 1, 1,
2.356419, 0.2191032, 1.189852, 1, 0, 0, 1, 1,
2.361016, 1.770919, 0.6189946, 0, 0, 0, 1, 1,
2.445392, -0.4434773, 2.965374, 0, 0, 0, 1, 1,
2.487875, -0.2208105, 1.78596, 0, 0, 0, 1, 1,
2.553994, 0.01244469, 3.355998, 0, 0, 0, 1, 1,
2.615939, -0.02458915, 1.741171, 0, 0, 0, 1, 1,
2.667505, -1.344678, 2.605446, 0, 0, 0, 1, 1,
2.718052, -0.3840432, 1.187511, 0, 0, 0, 1, 1,
2.747775, -1.018329, 2.066318, 1, 1, 1, 1, 1,
2.773028, 1.387505, 2.19753, 1, 1, 1, 1, 1,
2.826543, -0.9804007, 1.415163, 1, 1, 1, 1, 1,
2.844522, 0.9309424, 0.5781422, 1, 1, 1, 1, 1,
2.868365, 0.9989989, 0.7529887, 1, 1, 1, 1, 1,
3.092062, -2.580123, 1.747091, 1, 1, 1, 1, 1,
3.559665, 1.14672, 1.07676, 1, 1, 1, 1, 1
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
var radius = 9.388436;
var distance = 32.97649;
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
mvMatrix.translate( -0.4030401, -0.0442096, 0.2514524 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.97649);
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