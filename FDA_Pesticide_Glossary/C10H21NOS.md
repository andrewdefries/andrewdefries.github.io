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
-3.48226, -0.7091572, -1.342361, 1, 0, 0, 1,
-2.756589, -0.4115806, -0.4905231, 1, 0.007843138, 0, 1,
-2.297561, 0.7248006, -0.6117733, 1, 0.01176471, 0, 1,
-2.294898, -0.6004041, -2.214014, 1, 0.01960784, 0, 1,
-2.271343, 0.4896999, -2.003031, 1, 0.02352941, 0, 1,
-2.211929, -1.854133, -1.192199, 1, 0.03137255, 0, 1,
-2.201439, -1.509272, -3.677778, 1, 0.03529412, 0, 1,
-2.181438, -0.4507543, -1.937044, 1, 0.04313726, 0, 1,
-2.178299, 1.81383, 0.4301682, 1, 0.04705882, 0, 1,
-2.155018, 0.1707129, -1.652066, 1, 0.05490196, 0, 1,
-2.117117, -1.927069, -2.277732, 1, 0.05882353, 0, 1,
-2.080408, -0.6673525, -2.666986, 1, 0.06666667, 0, 1,
-2.078497, 0.5842695, 0.401545, 1, 0.07058824, 0, 1,
-2.056142, -0.9028509, -1.046598, 1, 0.07843138, 0, 1,
-2.036978, -0.5154449, -0.5549518, 1, 0.08235294, 0, 1,
-2.035788, -0.7960359, -2.87072, 1, 0.09019608, 0, 1,
-1.961436, 0.2883448, 0.7353158, 1, 0.09411765, 0, 1,
-1.948759, -1.653994, -1.864177, 1, 0.1019608, 0, 1,
-1.944513, 1.252818, 1.088261, 1, 0.1098039, 0, 1,
-1.927959, 1.949263, -0.6591336, 1, 0.1137255, 0, 1,
-1.924056, -0.9654149, -2.353014, 1, 0.1215686, 0, 1,
-1.886382, 1.065205, -1.075464, 1, 0.1254902, 0, 1,
-1.885878, -1.006297, -0.4110197, 1, 0.1333333, 0, 1,
-1.876715, -1.55235, -1.924862, 1, 0.1372549, 0, 1,
-1.84136, 1.342207, -0.8471771, 1, 0.145098, 0, 1,
-1.837664, 0.1509975, -0.4732374, 1, 0.1490196, 0, 1,
-1.836252, -0.7654136, -3.167436, 1, 0.1568628, 0, 1,
-1.831458, 0.4415224, -2.755367, 1, 0.1607843, 0, 1,
-1.827769, -0.1507109, -1.77663, 1, 0.1686275, 0, 1,
-1.827664, -0.3951169, -0.6812076, 1, 0.172549, 0, 1,
-1.827129, -0.763942, -2.392658, 1, 0.1803922, 0, 1,
-1.826962, 0.6080548, -1.737472, 1, 0.1843137, 0, 1,
-1.81947, -1.165418, -1.537038, 1, 0.1921569, 0, 1,
-1.81367, -0.5394813, -2.479269, 1, 0.1960784, 0, 1,
-1.793246, 1.473689, -2.342957, 1, 0.2039216, 0, 1,
-1.787561, -1.195992, -2.261084, 1, 0.2117647, 0, 1,
-1.746649, -0.8978236, -2.208649, 1, 0.2156863, 0, 1,
-1.745731, 1.795748, -1.670002, 1, 0.2235294, 0, 1,
-1.718679, 0.7409732, -1.986353, 1, 0.227451, 0, 1,
-1.70772, -0.3341559, -0.1116028, 1, 0.2352941, 0, 1,
-1.699194, -0.2948483, -0.8518544, 1, 0.2392157, 0, 1,
-1.675196, -1.371062, -2.201883, 1, 0.2470588, 0, 1,
-1.655064, -0.2487101, -1.979551, 1, 0.2509804, 0, 1,
-1.652082, 0.7886075, -4.029429, 1, 0.2588235, 0, 1,
-1.651656, 0.3591906, -1.225849, 1, 0.2627451, 0, 1,
-1.649263, -0.7938051, -1.406189, 1, 0.2705882, 0, 1,
-1.623479, -1.039314, -3.466778, 1, 0.2745098, 0, 1,
-1.617748, -0.2215983, -0.1075667, 1, 0.282353, 0, 1,
-1.616853, 1.015895, -1.668794, 1, 0.2862745, 0, 1,
-1.600439, -1.481196, -4.33727, 1, 0.2941177, 0, 1,
-1.599413, -1.688958, -2.911294, 1, 0.3019608, 0, 1,
-1.594152, -0.6352146, -2.653392, 1, 0.3058824, 0, 1,
-1.585014, 0.2345585, -1.463988, 1, 0.3137255, 0, 1,
-1.583481, -0.4323945, -4.328139, 1, 0.3176471, 0, 1,
-1.582848, -0.9587773, -2.058311, 1, 0.3254902, 0, 1,
-1.558628, 1.427667, -1.982116, 1, 0.3294118, 0, 1,
-1.556588, 0.2942617, 0.6565719, 1, 0.3372549, 0, 1,
-1.554359, -1.17499, -2.797491, 1, 0.3411765, 0, 1,
-1.530557, -0.4077642, -2.279834, 1, 0.3490196, 0, 1,
-1.528126, -0.5604888, -0.7394988, 1, 0.3529412, 0, 1,
-1.519092, -1.048598, -1.346104, 1, 0.3607843, 0, 1,
-1.488365, -0.2361272, -2.833443, 1, 0.3647059, 0, 1,
-1.480934, -0.5482186, -0.9424098, 1, 0.372549, 0, 1,
-1.473356, 1.681204, 1.162294, 1, 0.3764706, 0, 1,
-1.455197, -0.3772001, -2.446046, 1, 0.3843137, 0, 1,
-1.434989, 0.880537, -0.4709568, 1, 0.3882353, 0, 1,
-1.430384, -1.291502, -1.739919, 1, 0.3960784, 0, 1,
-1.429516, -0.229658, -0.6297803, 1, 0.4039216, 0, 1,
-1.416876, 0.02322018, -2.29819, 1, 0.4078431, 0, 1,
-1.403882, -0.1110365, -1.385384, 1, 0.4156863, 0, 1,
-1.399771, -0.08580126, 0.3486051, 1, 0.4196078, 0, 1,
-1.393514, 1.208715, 0.1586464, 1, 0.427451, 0, 1,
-1.389201, -0.1551103, -0.6516436, 1, 0.4313726, 0, 1,
-1.388981, 0.6500379, -1.719638, 1, 0.4392157, 0, 1,
-1.387827, 0.6487367, -1.175227, 1, 0.4431373, 0, 1,
-1.385355, -0.5333475, -1.923727, 1, 0.4509804, 0, 1,
-1.378427, -0.27024, -0.2237521, 1, 0.454902, 0, 1,
-1.357405, 0.1879907, -1.291632, 1, 0.4627451, 0, 1,
-1.352399, -0.746229, -1.886417, 1, 0.4666667, 0, 1,
-1.349284, 0.7244469, -1.126887, 1, 0.4745098, 0, 1,
-1.349107, 0.363461, -0.5009383, 1, 0.4784314, 0, 1,
-1.343572, -0.1489428, 0.236789, 1, 0.4862745, 0, 1,
-1.343117, 0.07451214, 0.5239073, 1, 0.4901961, 0, 1,
-1.339361, 0.7348118, -2.88225, 1, 0.4980392, 0, 1,
-1.335422, 1.299115, 0.9328274, 1, 0.5058824, 0, 1,
-1.320145, 0.9278954, -1.219485, 1, 0.509804, 0, 1,
-1.318432, -1.484082, -2.807941, 1, 0.5176471, 0, 1,
-1.310599, -0.08144829, -0.9733627, 1, 0.5215687, 0, 1,
-1.306272, 0.7373689, -0.4328, 1, 0.5294118, 0, 1,
-1.299799, -2.046509, -2.559715, 1, 0.5333334, 0, 1,
-1.293079, 0.4751235, -0.2135324, 1, 0.5411765, 0, 1,
-1.292551, -0.439759, -0.7698747, 1, 0.5450981, 0, 1,
-1.2901, 0.06237851, -1.934411, 1, 0.5529412, 0, 1,
-1.282321, -0.5657558, -2.684585, 1, 0.5568628, 0, 1,
-1.279497, -1.010831, -2.607924, 1, 0.5647059, 0, 1,
-1.2729, -0.02515643, -2.534204, 1, 0.5686275, 0, 1,
-1.263931, 0.3141108, -3.353811, 1, 0.5764706, 0, 1,
-1.263784, 0.4346117, -0.8690019, 1, 0.5803922, 0, 1,
-1.253163, 1.332927, -1.529145, 1, 0.5882353, 0, 1,
-1.243728, -0.2610881, -1.113777, 1, 0.5921569, 0, 1,
-1.235397, 2.122095, 0.3793138, 1, 0.6, 0, 1,
-1.23076, -0.05700044, -2.272156, 1, 0.6078432, 0, 1,
-1.226905, 1.230993, -1.862737, 1, 0.6117647, 0, 1,
-1.221333, -0.03183074, -3.697691, 1, 0.6196079, 0, 1,
-1.212107, -0.05509757, -3.364304, 1, 0.6235294, 0, 1,
-1.206793, 1.062865, 0.1671261, 1, 0.6313726, 0, 1,
-1.203675, -1.209497, -2.607573, 1, 0.6352941, 0, 1,
-1.200561, 2.188138, -0.4004435, 1, 0.6431373, 0, 1,
-1.188057, -0.5326335, -1.789508, 1, 0.6470588, 0, 1,
-1.182949, -0.0237509, -3.414034, 1, 0.654902, 0, 1,
-1.181936, 0.2775626, -0.1960943, 1, 0.6588235, 0, 1,
-1.181702, -0.4810067, -2.555851, 1, 0.6666667, 0, 1,
-1.175775, -0.436115, -1.186495, 1, 0.6705883, 0, 1,
-1.169738, 0.48266, -1.239885, 1, 0.6784314, 0, 1,
-1.163828, 0.06348098, -1.306055, 1, 0.682353, 0, 1,
-1.161976, 1.096149, -2.844916, 1, 0.6901961, 0, 1,
-1.157385, -0.3756643, -2.378713, 1, 0.6941177, 0, 1,
-1.152271, -0.7002015, -1.769777, 1, 0.7019608, 0, 1,
-1.146045, 0.782941, -2.737235, 1, 0.7098039, 0, 1,
-1.139314, 0.03581207, 1.680357, 1, 0.7137255, 0, 1,
-1.135031, -1.80954, -3.31795, 1, 0.7215686, 0, 1,
-1.13433, 0.6686108, -2.458997, 1, 0.7254902, 0, 1,
-1.133131, 0.6414234, -0.3232248, 1, 0.7333333, 0, 1,
-1.117588, 2.725696, -0.2028161, 1, 0.7372549, 0, 1,
-1.116106, 0.4656226, -0.2762394, 1, 0.7450981, 0, 1,
-1.114791, 0.2501887, -2.057197, 1, 0.7490196, 0, 1,
-1.109801, -1.393474, -0.3906265, 1, 0.7568628, 0, 1,
-1.108422, 1.779651, -1.148597, 1, 0.7607843, 0, 1,
-1.105834, 0.09433666, -0.5948262, 1, 0.7686275, 0, 1,
-1.102383, -0.2613788, -2.313195, 1, 0.772549, 0, 1,
-1.100155, 0.8868181, -0.01419142, 1, 0.7803922, 0, 1,
-1.092705, 1.678012, 0.5298035, 1, 0.7843137, 0, 1,
-1.091069, -2.244231, -5.375642, 1, 0.7921569, 0, 1,
-1.089811, -0.009636644, -0.3610273, 1, 0.7960784, 0, 1,
-1.08292, -1.235838, -1.230987, 1, 0.8039216, 0, 1,
-1.079851, 1.724621, -0.1414798, 1, 0.8117647, 0, 1,
-1.073647, -0.352601, -0.6302227, 1, 0.8156863, 0, 1,
-1.068787, -1.073401, -2.351738, 1, 0.8235294, 0, 1,
-1.064148, 0.9018109, -0.9663022, 1, 0.827451, 0, 1,
-1.06076, 1.639627, 1.217377, 1, 0.8352941, 0, 1,
-1.041064, 2.056795, 0.9152418, 1, 0.8392157, 0, 1,
-1.04065, 0.5024101, -0.6474124, 1, 0.8470588, 0, 1,
-1.038554, 1.472, 0.7024791, 1, 0.8509804, 0, 1,
-1.033445, 1.818105, -0.33017, 1, 0.8588235, 0, 1,
-1.032198, 0.2894908, 0.004388902, 1, 0.8627451, 0, 1,
-1.030532, -0.8936833, -2.928053, 1, 0.8705882, 0, 1,
-1.025845, -0.271948, -3.377905, 1, 0.8745098, 0, 1,
-1.025805, 0.2511118, -1.389748, 1, 0.8823529, 0, 1,
-1.020703, 0.9452904, -1.93191, 1, 0.8862745, 0, 1,
-1.018745, -0.202549, -0.8536947, 1, 0.8941177, 0, 1,
-1.01098, -1.232095, -1.407387, 1, 0.8980392, 0, 1,
-0.9990149, -0.5674369, -3.365735, 1, 0.9058824, 0, 1,
-0.9928772, 1.99551, -0.44853, 1, 0.9137255, 0, 1,
-0.9919304, -0.4838281, -3.413517, 1, 0.9176471, 0, 1,
-0.9798908, -0.5488791, -1.997959, 1, 0.9254902, 0, 1,
-0.9753836, 1.246174, -0.606397, 1, 0.9294118, 0, 1,
-0.9642478, 0.2995957, 0.6420106, 1, 0.9372549, 0, 1,
-0.9595604, 0.8853928, -0.9165723, 1, 0.9411765, 0, 1,
-0.9557949, -1.254728, -3.01635, 1, 0.9490196, 0, 1,
-0.9523595, 1.083652, -0.08472318, 1, 0.9529412, 0, 1,
-0.94886, 0.5162985, -2.253779, 1, 0.9607843, 0, 1,
-0.9475846, 1.20955, -1.48237, 1, 0.9647059, 0, 1,
-0.9383318, 1.167725, -1.884361, 1, 0.972549, 0, 1,
-0.93472, -0.2266946, -2.690586, 1, 0.9764706, 0, 1,
-0.9318389, -1.431236, -2.406423, 1, 0.9843137, 0, 1,
-0.9313802, 0.7396516, 0.6883029, 1, 0.9882353, 0, 1,
-0.9281708, 0.209691, -0.8346737, 1, 0.9960784, 0, 1,
-0.9176028, 0.3883273, -0.5218599, 0.9960784, 1, 0, 1,
-0.9114437, -0.7819336, -2.842724, 0.9921569, 1, 0, 1,
-0.9075249, 0.1710774, -2.364921, 0.9843137, 1, 0, 1,
-0.9063445, 0.2884381, -0.8797867, 0.9803922, 1, 0, 1,
-0.9051428, 0.00885084, -0.5606554, 0.972549, 1, 0, 1,
-0.9006456, -1.901046, -2.835749, 0.9686275, 1, 0, 1,
-0.8957016, -0.7927284, -4.262997, 0.9607843, 1, 0, 1,
-0.8882917, -0.8367708, -1.491969, 0.9568627, 1, 0, 1,
-0.8868014, -0.1037121, -2.229565, 0.9490196, 1, 0, 1,
-0.883092, -0.6632354, -4.061194, 0.945098, 1, 0, 1,
-0.8754884, -0.7799503, -2.389577, 0.9372549, 1, 0, 1,
-0.870927, -0.4389445, -3.224088, 0.9333333, 1, 0, 1,
-0.8703337, 0.003593219, -1.892866, 0.9254902, 1, 0, 1,
-0.8678112, -1.295617, -1.718538, 0.9215686, 1, 0, 1,
-0.8629873, 0.734992, -1.852446, 0.9137255, 1, 0, 1,
-0.8627968, 0.1371849, -2.803738, 0.9098039, 1, 0, 1,
-0.8614885, 1.521682, -2.080478, 0.9019608, 1, 0, 1,
-0.8600976, -1.080574, -0.6794242, 0.8941177, 1, 0, 1,
-0.8391997, -0.281262, -2.940862, 0.8901961, 1, 0, 1,
-0.8388885, -1.114593, -3.252955, 0.8823529, 1, 0, 1,
-0.8341761, -0.02750663, -0.7348991, 0.8784314, 1, 0, 1,
-0.8312443, -0.09967222, 0.09541863, 0.8705882, 1, 0, 1,
-0.8291764, -0.5579733, -1.7213, 0.8666667, 1, 0, 1,
-0.8272387, 0.4839138, -1.436736, 0.8588235, 1, 0, 1,
-0.8204486, 0.4633868, -0.3245929, 0.854902, 1, 0, 1,
-0.8162411, -0.3943023, -3.508395, 0.8470588, 1, 0, 1,
-0.8154578, -0.962168, -2.389563, 0.8431373, 1, 0, 1,
-0.8105083, -0.6780955, -4.377395, 0.8352941, 1, 0, 1,
-0.810147, -1.326457, -2.43648, 0.8313726, 1, 0, 1,
-0.8040642, 1.42984, 0.262452, 0.8235294, 1, 0, 1,
-0.7955675, 0.8153153, -0.08109564, 0.8196079, 1, 0, 1,
-0.7952812, -0.8921402, -3.841804, 0.8117647, 1, 0, 1,
-0.7907841, 0.300927, -1.852322, 0.8078431, 1, 0, 1,
-0.7906717, 0.7945628, -1.308654, 0.8, 1, 0, 1,
-0.7873001, -0.8195987, -1.865438, 0.7921569, 1, 0, 1,
-0.7867051, -1.29156, -3.712265, 0.7882353, 1, 0, 1,
-0.7777779, 0.5883374, -1.252559, 0.7803922, 1, 0, 1,
-0.7763672, -0.6447677, -2.03126, 0.7764706, 1, 0, 1,
-0.7697704, -0.4369462, -2.70646, 0.7686275, 1, 0, 1,
-0.7690232, 0.7390205, -0.04855235, 0.7647059, 1, 0, 1,
-0.7677202, -0.9109622, -1.207595, 0.7568628, 1, 0, 1,
-0.7672197, 1.898582, -2.571454, 0.7529412, 1, 0, 1,
-0.7656641, -0.851236, -3.410378, 0.7450981, 1, 0, 1,
-0.7631052, 0.02844329, -2.986489, 0.7411765, 1, 0, 1,
-0.7554037, -0.5903323, -1.740342, 0.7333333, 1, 0, 1,
-0.7552142, 0.6530512, 0.4384711, 0.7294118, 1, 0, 1,
-0.7538488, 0.636665, -0.8005182, 0.7215686, 1, 0, 1,
-0.7518564, 0.7240745, 0.5027698, 0.7176471, 1, 0, 1,
-0.7517218, 0.8017731, -0.4671873, 0.7098039, 1, 0, 1,
-0.7487912, 0.874982, -0.3503993, 0.7058824, 1, 0, 1,
-0.7462803, 0.0116592, -2.048368, 0.6980392, 1, 0, 1,
-0.745948, 0.8902497, 0.1506692, 0.6901961, 1, 0, 1,
-0.7356738, -0.1227863, -2.493803, 0.6862745, 1, 0, 1,
-0.7352902, -0.2218147, -4.384381, 0.6784314, 1, 0, 1,
-0.7352265, -0.6335059, -2.857528, 0.6745098, 1, 0, 1,
-0.733752, -0.007856354, -3.261335, 0.6666667, 1, 0, 1,
-0.7325999, -0.07913458, -0.9675177, 0.6627451, 1, 0, 1,
-0.7322581, 2.760195, -1.269145, 0.654902, 1, 0, 1,
-0.7307072, -0.05826612, -2.488755, 0.6509804, 1, 0, 1,
-0.7284251, 1.148479, 0.6831121, 0.6431373, 1, 0, 1,
-0.7270554, -0.8208992, -2.451664, 0.6392157, 1, 0, 1,
-0.7249556, 0.277784, -0.4590646, 0.6313726, 1, 0, 1,
-0.723274, -0.4899967, -2.340395, 0.627451, 1, 0, 1,
-0.7169605, -0.4231358, -1.105245, 0.6196079, 1, 0, 1,
-0.7151594, 0.6893821, 0.878806, 0.6156863, 1, 0, 1,
-0.7117581, 0.1168972, -3.490355, 0.6078432, 1, 0, 1,
-0.6990663, -0.652593, -3.350213, 0.6039216, 1, 0, 1,
-0.6920526, 0.6247265, -0.07555409, 0.5960785, 1, 0, 1,
-0.6855179, -1.222582, -4.04674, 0.5882353, 1, 0, 1,
-0.6813576, 0.6282804, -2.643263, 0.5843138, 1, 0, 1,
-0.6812541, 1.058902, -0.0406477, 0.5764706, 1, 0, 1,
-0.6801769, 1.128619, -0.7987191, 0.572549, 1, 0, 1,
-0.6744439, -1.713704, -2.409796, 0.5647059, 1, 0, 1,
-0.6737919, 1.484654, -0.04856168, 0.5607843, 1, 0, 1,
-0.6725732, -0.02421085, -0.2664095, 0.5529412, 1, 0, 1,
-0.6595913, 0.8327816, -0.06497851, 0.5490196, 1, 0, 1,
-0.6586626, 0.8164848, -1.967414, 0.5411765, 1, 0, 1,
-0.6584663, -0.4169092, -3.052727, 0.5372549, 1, 0, 1,
-0.6576133, 0.4776449, -2.018789, 0.5294118, 1, 0, 1,
-0.656231, 0.8092016, -0.6525648, 0.5254902, 1, 0, 1,
-0.652619, 1.004488, 1.473142, 0.5176471, 1, 0, 1,
-0.6499217, 0.9434236, -0.8107007, 0.5137255, 1, 0, 1,
-0.645053, -1.44728, -4.110975, 0.5058824, 1, 0, 1,
-0.638223, -0.5934559, -1.719401, 0.5019608, 1, 0, 1,
-0.6373453, -0.5544145, -2.545011, 0.4941176, 1, 0, 1,
-0.6356331, -0.5813184, -3.803687, 0.4862745, 1, 0, 1,
-0.6345221, -0.6654685, -0.6958349, 0.4823529, 1, 0, 1,
-0.6309363, 0.4258368, 0.684554, 0.4745098, 1, 0, 1,
-0.6282595, -0.3258653, -1.490977, 0.4705882, 1, 0, 1,
-0.6260911, -0.0583679, 0.6156013, 0.4627451, 1, 0, 1,
-0.6194168, 0.08982211, -2.780315, 0.4588235, 1, 0, 1,
-0.6185779, -0.7560184, -2.193056, 0.4509804, 1, 0, 1,
-0.6184796, 1.974062, 0.9655107, 0.4470588, 1, 0, 1,
-0.6165928, -0.03389515, -0.4299999, 0.4392157, 1, 0, 1,
-0.6150041, 0.2253806, -1.400434, 0.4352941, 1, 0, 1,
-0.6148949, 0.3187987, -0.7403273, 0.427451, 1, 0, 1,
-0.6121139, -0.9354417, -1.757626, 0.4235294, 1, 0, 1,
-0.6066193, 1.124142, -0.7203901, 0.4156863, 1, 0, 1,
-0.6037889, 1.820359, -0.5320818, 0.4117647, 1, 0, 1,
-0.5943037, -0.379254, -0.9193019, 0.4039216, 1, 0, 1,
-0.5941676, -1.205374, -2.580115, 0.3960784, 1, 0, 1,
-0.5918916, 0.04724329, -3.185144, 0.3921569, 1, 0, 1,
-0.5871223, 0.5533059, -1.069029, 0.3843137, 1, 0, 1,
-0.585506, 0.7027566, -0.1430963, 0.3803922, 1, 0, 1,
-0.5767822, 0.5653032, -1.402413, 0.372549, 1, 0, 1,
-0.5749286, 0.06621333, -3.060524, 0.3686275, 1, 0, 1,
-0.5706096, 0.9141098, -0.386119, 0.3607843, 1, 0, 1,
-0.5688404, 1.336362, -0.8170252, 0.3568628, 1, 0, 1,
-0.5688147, 0.9556638, -1.457969, 0.3490196, 1, 0, 1,
-0.5679991, -0.7223303, -1.240357, 0.345098, 1, 0, 1,
-0.5659175, 1.052929, 1.308702, 0.3372549, 1, 0, 1,
-0.5651256, -0.06980405, -2.485493, 0.3333333, 1, 0, 1,
-0.5639545, -0.9597824, -2.667534, 0.3254902, 1, 0, 1,
-0.5621962, 0.5113549, -0.2847735, 0.3215686, 1, 0, 1,
-0.5564355, -1.191122, -3.563153, 0.3137255, 1, 0, 1,
-0.5539319, 0.3539762, -2.018072, 0.3098039, 1, 0, 1,
-0.5528356, -0.3567433, -0.8907549, 0.3019608, 1, 0, 1,
-0.5523796, 0.8563656, 0.5825003, 0.2941177, 1, 0, 1,
-0.5501695, -0.7533659, 0.3599284, 0.2901961, 1, 0, 1,
-0.5500157, 1.262669, 0.6634136, 0.282353, 1, 0, 1,
-0.5473471, 1.64721, -0.00320028, 0.2784314, 1, 0, 1,
-0.5458017, -1.010116, -1.270974, 0.2705882, 1, 0, 1,
-0.5412425, 0.2940753, -1.358577, 0.2666667, 1, 0, 1,
-0.5381381, -0.007511689, 0.2537141, 0.2588235, 1, 0, 1,
-0.5344524, 0.2135416, -1.190897, 0.254902, 1, 0, 1,
-0.533872, 0.5137788, -0.6596422, 0.2470588, 1, 0, 1,
-0.5321556, 0.2897302, -0.9574103, 0.2431373, 1, 0, 1,
-0.5238811, 0.3504106, -1.732626, 0.2352941, 1, 0, 1,
-0.5191794, 0.368889, -0.602478, 0.2313726, 1, 0, 1,
-0.5177979, 1.574959, 0.331124, 0.2235294, 1, 0, 1,
-0.5167855, -0.5741364, -1.757888, 0.2196078, 1, 0, 1,
-0.5127987, 0.2020232, -0.1963842, 0.2117647, 1, 0, 1,
-0.5119606, 1.475896, 0.5725592, 0.2078431, 1, 0, 1,
-0.5099346, -0.858132, -2.771984, 0.2, 1, 0, 1,
-0.5046526, -0.1670572, -1.137925, 0.1921569, 1, 0, 1,
-0.5038388, -0.2078217, -1.800167, 0.1882353, 1, 0, 1,
-0.5026042, -0.3497586, -2.847687, 0.1803922, 1, 0, 1,
-0.5007631, -0.352208, -5.543044, 0.1764706, 1, 0, 1,
-0.4933618, -0.05708606, -0.6384899, 0.1686275, 1, 0, 1,
-0.4856902, 0.5249306, -3.123068, 0.1647059, 1, 0, 1,
-0.4833448, 1.427448, 0.9426581, 0.1568628, 1, 0, 1,
-0.4711405, 2.185814, -0.6934863, 0.1529412, 1, 0, 1,
-0.4666767, -0.590457, -2.34535, 0.145098, 1, 0, 1,
-0.4643579, -1.742127, -2.148366, 0.1411765, 1, 0, 1,
-0.4635623, -1.297855, -1.868287, 0.1333333, 1, 0, 1,
-0.4609182, 1.288139, 0.999562, 0.1294118, 1, 0, 1,
-0.4599237, -1.561105, -3.309201, 0.1215686, 1, 0, 1,
-0.4586267, 1.084398, -0.1002899, 0.1176471, 1, 0, 1,
-0.4582061, 0.489726, -1.066681, 0.1098039, 1, 0, 1,
-0.4563467, -0.5534005, -1.675632, 0.1058824, 1, 0, 1,
-0.4563047, -0.05002671, -1.253448, 0.09803922, 1, 0, 1,
-0.4448753, -0.4856141, -2.558246, 0.09019608, 1, 0, 1,
-0.4425496, 0.9031001, -0.4228551, 0.08627451, 1, 0, 1,
-0.4410644, 0.7108464, -0.8238266, 0.07843138, 1, 0, 1,
-0.435566, -1.936305, -3.000724, 0.07450981, 1, 0, 1,
-0.4285472, 0.3800484, -0.9998383, 0.06666667, 1, 0, 1,
-0.4249049, -1.141161, -0.8476518, 0.0627451, 1, 0, 1,
-0.4240979, -0.4549966, -2.248086, 0.05490196, 1, 0, 1,
-0.4229403, -0.6989416, -2.463068, 0.05098039, 1, 0, 1,
-0.4198549, -1.978893, -3.427738, 0.04313726, 1, 0, 1,
-0.4166508, -0.1513789, -0.7168423, 0.03921569, 1, 0, 1,
-0.4155393, 0.8240052, -1.447505, 0.03137255, 1, 0, 1,
-0.4133004, -0.04673031, -1.699687, 0.02745098, 1, 0, 1,
-0.4116001, -0.1765454, -3.109475, 0.01960784, 1, 0, 1,
-0.4106999, 0.5124376, -0.3730444, 0.01568628, 1, 0, 1,
-0.4103931, -0.01268443, -2.579994, 0.007843138, 1, 0, 1,
-0.4091956, -1.001454, -1.977357, 0.003921569, 1, 0, 1,
-0.40604, -0.7671734, -2.339877, 0, 1, 0.003921569, 1,
-0.4041716, -1.479841, -3.480653, 0, 1, 0.01176471, 1,
-0.4011822, 0.6118169, 0.5913293, 0, 1, 0.01568628, 1,
-0.3912728, -1.385328, -2.204159, 0, 1, 0.02352941, 1,
-0.3830155, -1.645251, -3.688045, 0, 1, 0.02745098, 1,
-0.3761994, 0.7048182, -0.2467943, 0, 1, 0.03529412, 1,
-0.3734559, -1.530978, -3.184002, 0, 1, 0.03921569, 1,
-0.3706058, 0.2385898, 0.4408207, 0, 1, 0.04705882, 1,
-0.367395, -0.8417704, -1.943154, 0, 1, 0.05098039, 1,
-0.3669614, -0.2604036, -2.186191, 0, 1, 0.05882353, 1,
-0.3659619, 1.793367, -0.6983221, 0, 1, 0.0627451, 1,
-0.364966, -1.905976, -3.897725, 0, 1, 0.07058824, 1,
-0.3638846, -0.9096237, -3.51428, 0, 1, 0.07450981, 1,
-0.3621247, -0.4647562, -2.220773, 0, 1, 0.08235294, 1,
-0.359621, 0.9915826, 0.1918941, 0, 1, 0.08627451, 1,
-0.3573841, -1.954014, -3.079672, 0, 1, 0.09411765, 1,
-0.3550605, 0.9954802, -0.8252793, 0, 1, 0.1019608, 1,
-0.3540313, -0.8600863, -2.930693, 0, 1, 0.1058824, 1,
-0.3494883, 0.6239139, 0.4977698, 0, 1, 0.1137255, 1,
-0.3490595, 0.5893761, -0.1766662, 0, 1, 0.1176471, 1,
-0.3470903, -1.246947, -2.468588, 0, 1, 0.1254902, 1,
-0.3420139, 0.6092905, 0.8386667, 0, 1, 0.1294118, 1,
-0.3365819, 0.3047494, -1.129175, 0, 1, 0.1372549, 1,
-0.3298647, 1.128066, -0.3715202, 0, 1, 0.1411765, 1,
-0.3261379, -0.5616955, -0.7283316, 0, 1, 0.1490196, 1,
-0.3231218, -0.5234816, -3.107201, 0, 1, 0.1529412, 1,
-0.3229381, -1.123932, -3.866392, 0, 1, 0.1607843, 1,
-0.3223794, 1.225079, -0.4211607, 0, 1, 0.1647059, 1,
-0.3216517, -0.4764927, -3.399687, 0, 1, 0.172549, 1,
-0.3132935, 1.795486, -0.2404259, 0, 1, 0.1764706, 1,
-0.3132417, 0.4734431, 0.4000591, 0, 1, 0.1843137, 1,
-0.3098087, -1.348908, -2.186146, 0, 1, 0.1882353, 1,
-0.3097346, -2.024563, -2.435274, 0, 1, 0.1960784, 1,
-0.3049781, -1.262982, -2.763297, 0, 1, 0.2039216, 1,
-0.2931043, 0.8683036, 0.520165, 0, 1, 0.2078431, 1,
-0.2922803, 0.09875713, -1.834126, 0, 1, 0.2156863, 1,
-0.2900512, 0.6625238, -0.2348169, 0, 1, 0.2196078, 1,
-0.2881558, -0.8300831, -2.294586, 0, 1, 0.227451, 1,
-0.2842785, -0.930957, -0.4744231, 0, 1, 0.2313726, 1,
-0.2808915, 0.7139425, 1.407747, 0, 1, 0.2392157, 1,
-0.2791073, 0.8214425, 0.897069, 0, 1, 0.2431373, 1,
-0.2762117, -0.1351272, -1.918583, 0, 1, 0.2509804, 1,
-0.2754446, 2.237892, 1.154986, 0, 1, 0.254902, 1,
-0.2747894, -1.274178, -4.942039, 0, 1, 0.2627451, 1,
-0.2715614, -0.1560446, -0.571812, 0, 1, 0.2666667, 1,
-0.2663618, -0.6929528, -3.489254, 0, 1, 0.2745098, 1,
-0.2649682, -1.316449, -3.372712, 0, 1, 0.2784314, 1,
-0.2620245, -1.090139, -4.259518, 0, 1, 0.2862745, 1,
-0.2618864, 0.986594, 0.5733321, 0, 1, 0.2901961, 1,
-0.2618353, 1.369674, 0.6052427, 0, 1, 0.2980392, 1,
-0.2618018, 0.5942655, -0.8943614, 0, 1, 0.3058824, 1,
-0.2554218, 1.125112, -0.1606648, 0, 1, 0.3098039, 1,
-0.2538636, 0.1529575, -0.2554506, 0, 1, 0.3176471, 1,
-0.2535351, 0.4716999, -1.094512, 0, 1, 0.3215686, 1,
-0.2534833, 0.2077744, -1.130713, 0, 1, 0.3294118, 1,
-0.2470618, -1.451202, -1.745806, 0, 1, 0.3333333, 1,
-0.246895, 0.1865032, -0.9338562, 0, 1, 0.3411765, 1,
-0.2419694, 0.6887828, -0.9907081, 0, 1, 0.345098, 1,
-0.236507, 0.8321608, -0.867456, 0, 1, 0.3529412, 1,
-0.2306655, 1.282499, -1.386713, 0, 1, 0.3568628, 1,
-0.2302497, 2.178217, 0.2069575, 0, 1, 0.3647059, 1,
-0.2278335, -0.9401572, -3.459962, 0, 1, 0.3686275, 1,
-0.2253789, 1.465237, -1.872267, 0, 1, 0.3764706, 1,
-0.2241397, -0.05820923, -1.130062, 0, 1, 0.3803922, 1,
-0.2180555, 1.389187, -0.6178952, 0, 1, 0.3882353, 1,
-0.2103435, 1.892433, -0.07011528, 0, 1, 0.3921569, 1,
-0.2050921, 1.735821, -1.872468, 0, 1, 0.4, 1,
-0.2021953, 0.7037578, -1.177836, 0, 1, 0.4078431, 1,
-0.201669, -0.3333479, -2.994973, 0, 1, 0.4117647, 1,
-0.1995954, -0.5765537, -4.209303, 0, 1, 0.4196078, 1,
-0.1987755, -0.4091731, -2.937353, 0, 1, 0.4235294, 1,
-0.1963712, 0.529077, 1.706406, 0, 1, 0.4313726, 1,
-0.1946548, -0.263209, -2.956646, 0, 1, 0.4352941, 1,
-0.1924202, -0.5950091, -1.950422, 0, 1, 0.4431373, 1,
-0.1906196, -0.4886049, -1.8701, 0, 1, 0.4470588, 1,
-0.1897218, -1.793652, -4.355911, 0, 1, 0.454902, 1,
-0.1800725, 0.8810957, -0.4305362, 0, 1, 0.4588235, 1,
-0.1773896, 1.760304, -0.2226553, 0, 1, 0.4666667, 1,
-0.1724065, -0.04709366, -2.780774, 0, 1, 0.4705882, 1,
-0.1615796, 1.476758, -0.8327068, 0, 1, 0.4784314, 1,
-0.154717, 1.027562, 1.936589, 0, 1, 0.4823529, 1,
-0.1528708, -0.9080143, -3.404051, 0, 1, 0.4901961, 1,
-0.1480916, 1.269524, 0.4914949, 0, 1, 0.4941176, 1,
-0.1479639, -0.8886471, -4.321959, 0, 1, 0.5019608, 1,
-0.1462708, 2.043937, -2.074267, 0, 1, 0.509804, 1,
-0.1458252, -2.508301, -5.060116, 0, 1, 0.5137255, 1,
-0.145121, -0.5730766, -2.149802, 0, 1, 0.5215687, 1,
-0.1450304, -0.8946769, -2.99655, 0, 1, 0.5254902, 1,
-0.1430215, -0.2328619, -3.402648, 0, 1, 0.5333334, 1,
-0.1371393, 0.4168112, 0.7880443, 0, 1, 0.5372549, 1,
-0.1334385, 0.7098696, 0.3992683, 0, 1, 0.5450981, 1,
-0.132269, -0.5277495, -1.779378, 0, 1, 0.5490196, 1,
-0.1312767, 0.545739, 0.4766372, 0, 1, 0.5568628, 1,
-0.1304847, 0.795287, -0.1769557, 0, 1, 0.5607843, 1,
-0.1284135, -0.2844846, -2.311932, 0, 1, 0.5686275, 1,
-0.1274184, 1.675745, -0.4815027, 0, 1, 0.572549, 1,
-0.1266764, -1.396574, -2.843697, 0, 1, 0.5803922, 1,
-0.1252306, -1.870564, -2.974505, 0, 1, 0.5843138, 1,
-0.1242631, 0.6285699, 1.564299, 0, 1, 0.5921569, 1,
-0.1223715, -1.227818, -3.363017, 0, 1, 0.5960785, 1,
-0.1217773, -0.1971352, -2.374448, 0, 1, 0.6039216, 1,
-0.1119609, 1.619178, -1.360694, 0, 1, 0.6117647, 1,
-0.1111095, -0.3966315, -2.257528, 0, 1, 0.6156863, 1,
-0.1054009, 0.9599189, -1.421717, 0, 1, 0.6235294, 1,
-0.1019509, 1.040763, -1.224916, 0, 1, 0.627451, 1,
-0.09911921, -0.4047509, -3.552648, 0, 1, 0.6352941, 1,
-0.0982941, 0.4667996, 0.2598494, 0, 1, 0.6392157, 1,
-0.09579335, -0.4240862, -2.822209, 0, 1, 0.6470588, 1,
-0.09507711, -0.8275127, -3.283445, 0, 1, 0.6509804, 1,
-0.09241687, 0.7796582, -0.2175267, 0, 1, 0.6588235, 1,
-0.09109485, -0.02510709, -3.3834, 0, 1, 0.6627451, 1,
-0.09072647, 0.7080117, 0.6583987, 0, 1, 0.6705883, 1,
-0.08879895, 0.2879795, -0.4375401, 0, 1, 0.6745098, 1,
-0.0875825, -0.1285195, -3.4504, 0, 1, 0.682353, 1,
-0.08582641, -0.4210315, -3.181071, 0, 1, 0.6862745, 1,
-0.08391805, 1.930056, -0.1348684, 0, 1, 0.6941177, 1,
-0.07947061, -0.4857496, -4.323885, 0, 1, 0.7019608, 1,
-0.07906105, 0.936044, -0.2188832, 0, 1, 0.7058824, 1,
-0.07692253, -0.4634484, -2.427806, 0, 1, 0.7137255, 1,
-0.07663541, -0.3615365, -1.232176, 0, 1, 0.7176471, 1,
-0.07374316, 1.818844, -0.2108299, 0, 1, 0.7254902, 1,
-0.06994908, 0.4451553, -0.2182921, 0, 1, 0.7294118, 1,
-0.064462, -0.6731929, -4.112065, 0, 1, 0.7372549, 1,
-0.06444449, 0.9175412, -1.168044, 0, 1, 0.7411765, 1,
-0.06282297, 1.197341, -0.5459732, 0, 1, 0.7490196, 1,
-0.0618584, -0.2647647, -2.85886, 0, 1, 0.7529412, 1,
-0.06120576, 1.201298, -0.2928338, 0, 1, 0.7607843, 1,
-0.06072967, -0.4757294, -1.662346, 0, 1, 0.7647059, 1,
-0.05986005, -1.004849, -2.52167, 0, 1, 0.772549, 1,
-0.05807869, -1.146114, -2.538961, 0, 1, 0.7764706, 1,
-0.05311525, 1.467271, 0.01495477, 0, 1, 0.7843137, 1,
-0.04958874, 0.06234737, -1.258404, 0, 1, 0.7882353, 1,
-0.04815461, -0.2182242, -3.050841, 0, 1, 0.7960784, 1,
-0.04612347, 1.256113, 0.0610019, 0, 1, 0.8039216, 1,
-0.04411765, -0.8283174, -2.040971, 0, 1, 0.8078431, 1,
-0.04271371, -0.8856848, -3.278508, 0, 1, 0.8156863, 1,
-0.03721653, 0.7594589, 0.8292192, 0, 1, 0.8196079, 1,
-0.03536619, -0.4776229, -2.149613, 0, 1, 0.827451, 1,
-0.03286179, -1.485794, -4.21358, 0, 1, 0.8313726, 1,
-0.03225604, 0.2449484, 0.3349116, 0, 1, 0.8392157, 1,
-0.02836478, 0.5716363, 0.9392692, 0, 1, 0.8431373, 1,
-0.02173785, -0.3463849, -1.367066, 0, 1, 0.8509804, 1,
-0.02142399, 0.4427404, -1.013173, 0, 1, 0.854902, 1,
-0.01793468, 1.566533, -0.02989908, 0, 1, 0.8627451, 1,
-0.01735749, -0.8476278, -1.161849, 0, 1, 0.8666667, 1,
-0.01577135, 0.1933637, -0.4448845, 0, 1, 0.8745098, 1,
-0.01217273, -0.8741821, -2.968635, 0, 1, 0.8784314, 1,
-0.009598583, -1.13411, -2.184322, 0, 1, 0.8862745, 1,
-0.005899923, -0.4340334, -6.320914, 0, 1, 0.8901961, 1,
-0.002719475, 0.3710909, 0.8195163, 0, 1, 0.8980392, 1,
-0.0007989743, 0.790025, 0.7583219, 0, 1, 0.9058824, 1,
0.001097803, 0.05262642, 1.139342, 0, 1, 0.9098039, 1,
0.001924946, -1.341883, 3.526412, 0, 1, 0.9176471, 1,
0.001986587, 1.871892, -1.057266, 0, 1, 0.9215686, 1,
0.004503357, -1.962755, 3.238798, 0, 1, 0.9294118, 1,
0.007182992, -0.4205575, 4.461481, 0, 1, 0.9333333, 1,
0.007312614, -1.835226, 4.708702, 0, 1, 0.9411765, 1,
0.01003697, -0.5712984, 4.665367, 0, 1, 0.945098, 1,
0.01031304, -1.057018, 2.655328, 0, 1, 0.9529412, 1,
0.01373625, 1.162729, 0.1778334, 0, 1, 0.9568627, 1,
0.01722002, -0.05899359, 3.214308, 0, 1, 0.9647059, 1,
0.0179759, 1.144387, -0.06505864, 0, 1, 0.9686275, 1,
0.02150784, 0.9760479, -1.139979, 0, 1, 0.9764706, 1,
0.02244471, -0.9914214, 3.54817, 0, 1, 0.9803922, 1,
0.02366544, 0.8170487, 1.360512, 0, 1, 0.9882353, 1,
0.0275641, -0.2980798, 5.129244, 0, 1, 0.9921569, 1,
0.02761257, 0.02802108, 1.000012, 0, 1, 1, 1,
0.02819988, -0.1087512, 3.69023, 0, 0.9921569, 1, 1,
0.03047055, -0.7900601, 2.716727, 0, 0.9882353, 1, 1,
0.03381341, 1.838984, 1.332731, 0, 0.9803922, 1, 1,
0.03422124, 0.6377852, -0.2999659, 0, 0.9764706, 1, 1,
0.03435749, -0.8164836, 2.909383, 0, 0.9686275, 1, 1,
0.03747227, 0.02667234, 1.47621, 0, 0.9647059, 1, 1,
0.04385728, -0.7346218, 2.172786, 0, 0.9568627, 1, 1,
0.04406744, 0.9132791, 1.987005, 0, 0.9529412, 1, 1,
0.05134233, -2.038398, 2.797223, 0, 0.945098, 1, 1,
0.05152394, 0.5550906, -0.6839787, 0, 0.9411765, 1, 1,
0.05385043, -0.04319792, 2.779735, 0, 0.9333333, 1, 1,
0.05508621, -0.3185421, 2.202416, 0, 0.9294118, 1, 1,
0.05983284, 1.450778, 0.5980465, 0, 0.9215686, 1, 1,
0.06025502, 0.4585394, 0.3539995, 0, 0.9176471, 1, 1,
0.06100318, 0.07108309, 1.064357, 0, 0.9098039, 1, 1,
0.06442522, 0.1996239, 1.201627, 0, 0.9058824, 1, 1,
0.06703422, -0.6734739, 3.176921, 0, 0.8980392, 1, 1,
0.07007864, 0.3205034, 1.650539, 0, 0.8901961, 1, 1,
0.07177905, -1.552929, 3.310971, 0, 0.8862745, 1, 1,
0.0766619, 2.001489, -1.027293, 0, 0.8784314, 1, 1,
0.07668141, -0.7680433, 3.92857, 0, 0.8745098, 1, 1,
0.08017513, -0.750464, 3.061405, 0, 0.8666667, 1, 1,
0.08503824, -0.1790896, 2.221149, 0, 0.8627451, 1, 1,
0.08601868, -3.094234, 2.583545, 0, 0.854902, 1, 1,
0.09038986, -1.151108, 0.9893144, 0, 0.8509804, 1, 1,
0.09605268, -0.6606452, 1.989635, 0, 0.8431373, 1, 1,
0.1005425, 0.3262522, 0.4526354, 0, 0.8392157, 1, 1,
0.1061431, 0.6515274, 0.9026862, 0, 0.8313726, 1, 1,
0.1122736, 0.006935799, 0.8387348, 0, 0.827451, 1, 1,
0.112766, 1.935953, -0.9091009, 0, 0.8196079, 1, 1,
0.11371, 0.02730375, 2.957954, 0, 0.8156863, 1, 1,
0.1165081, 1.170126, -0.09648636, 0, 0.8078431, 1, 1,
0.1262371, 1.250163, -0.4345592, 0, 0.8039216, 1, 1,
0.1276869, -1.893526, 2.307813, 0, 0.7960784, 1, 1,
0.1287904, -2.520733, 2.66769, 0, 0.7882353, 1, 1,
0.1299091, 0.6891939, 0.9267451, 0, 0.7843137, 1, 1,
0.1357943, -0.1421833, 1.146695, 0, 0.7764706, 1, 1,
0.1394138, 0.4388421, 0.5642197, 0, 0.772549, 1, 1,
0.1402538, -1.404818, 2.799557, 0, 0.7647059, 1, 1,
0.1419678, -0.2191131, 2.059343, 0, 0.7607843, 1, 1,
0.1425513, -0.5461735, 3.95136, 0, 0.7529412, 1, 1,
0.1425767, -1.51166, 3.320133, 0, 0.7490196, 1, 1,
0.1439315, -0.01817983, 2.491641, 0, 0.7411765, 1, 1,
0.1445838, 0.01524914, 0.9710352, 0, 0.7372549, 1, 1,
0.1485042, -2.200409, 1.844255, 0, 0.7294118, 1, 1,
0.1499524, 0.3757441, -0.5022093, 0, 0.7254902, 1, 1,
0.1500902, -1.716899, 4.619311, 0, 0.7176471, 1, 1,
0.1533573, 0.8823315, -0.5413585, 0, 0.7137255, 1, 1,
0.1542765, 0.2167722, 1.275321, 0, 0.7058824, 1, 1,
0.1558561, -0.7486172, 3.432424, 0, 0.6980392, 1, 1,
0.1615268, 0.7265093, 0.8382097, 0, 0.6941177, 1, 1,
0.1667037, -1.627802, 3.202461, 0, 0.6862745, 1, 1,
0.1681427, 2.269745, -0.2636839, 0, 0.682353, 1, 1,
0.1742966, 0.5801005, 0.3206695, 0, 0.6745098, 1, 1,
0.1753526, 1.293331, 0.5424356, 0, 0.6705883, 1, 1,
0.1773113, 0.1719803, 0.1524628, 0, 0.6627451, 1, 1,
0.1820734, 0.5883268, -0.4334531, 0, 0.6588235, 1, 1,
0.1823624, -1.313927, 1.581112, 0, 0.6509804, 1, 1,
0.1825122, 0.6373012, 1.412147, 0, 0.6470588, 1, 1,
0.1832971, 1.438924, -0.2760636, 0, 0.6392157, 1, 1,
0.1846224, -0.5314673, 2.899937, 0, 0.6352941, 1, 1,
0.1878697, 1.071511, 2.002074, 0, 0.627451, 1, 1,
0.1913416, 2.066981, 1.217669, 0, 0.6235294, 1, 1,
0.1924641, -0.8681947, 2.708207, 0, 0.6156863, 1, 1,
0.1980912, -0.4735334, 2.182993, 0, 0.6117647, 1, 1,
0.2003434, 0.8903989, 0.5547743, 0, 0.6039216, 1, 1,
0.2045621, -0.8557572, 5.598783, 0, 0.5960785, 1, 1,
0.2122117, 0.4813322, -0.004043816, 0, 0.5921569, 1, 1,
0.2139529, -0.1270663, 2.29267, 0, 0.5843138, 1, 1,
0.2158643, 0.04929789, 1.664091, 0, 0.5803922, 1, 1,
0.2185166, 1.203217, 0.485462, 0, 0.572549, 1, 1,
0.2212599, 0.2685975, -0.007263953, 0, 0.5686275, 1, 1,
0.2331871, -1.418108, 2.766033, 0, 0.5607843, 1, 1,
0.2358294, 1.095191, -0.6332803, 0, 0.5568628, 1, 1,
0.2370179, 1.580395, 1.478278, 0, 0.5490196, 1, 1,
0.2377144, 0.4002247, 1.578215, 0, 0.5450981, 1, 1,
0.2416063, 1.467014, 0.4013993, 0, 0.5372549, 1, 1,
0.2462971, 1.225472, 1.609499, 0, 0.5333334, 1, 1,
0.2480437, 0.5099065, 0.08400338, 0, 0.5254902, 1, 1,
0.2549124, -0.1477032, 2.664926, 0, 0.5215687, 1, 1,
0.2568592, -0.4860805, 1.918874, 0, 0.5137255, 1, 1,
0.2573544, 0.1368524, 1.249373, 0, 0.509804, 1, 1,
0.2584386, -1.035584, 1.180672, 0, 0.5019608, 1, 1,
0.25999, -0.5005531, 0.9028862, 0, 0.4941176, 1, 1,
0.2620794, -2.39669, 1.857365, 0, 0.4901961, 1, 1,
0.2631517, -0.0450783, 1.734899, 0, 0.4823529, 1, 1,
0.2671144, 1.018607, 0.7683967, 0, 0.4784314, 1, 1,
0.2672922, -1.620641, 3.086297, 0, 0.4705882, 1, 1,
0.2678409, -0.2581802, 2.36824, 0, 0.4666667, 1, 1,
0.2685921, 0.3308091, 1.908782, 0, 0.4588235, 1, 1,
0.2715679, -0.7842959, 2.416532, 0, 0.454902, 1, 1,
0.2727987, 0.3961429, -0.1889979, 0, 0.4470588, 1, 1,
0.2747591, -0.1467135, 0.677698, 0, 0.4431373, 1, 1,
0.2757575, 1.148697, 1.808037, 0, 0.4352941, 1, 1,
0.2762498, 0.2180987, -0.448071, 0, 0.4313726, 1, 1,
0.2775456, 1.730086, -1.273282, 0, 0.4235294, 1, 1,
0.2790573, 0.8241024, 1.350754, 0, 0.4196078, 1, 1,
0.2793167, 0.1689312, 0.596619, 0, 0.4117647, 1, 1,
0.2793874, -0.01568036, 0.5959503, 0, 0.4078431, 1, 1,
0.2814614, 1.069467, -0.7829368, 0, 0.4, 1, 1,
0.2818223, -0.6104015, 1.299296, 0, 0.3921569, 1, 1,
0.2820455, -1.099233, -0.2027341, 0, 0.3882353, 1, 1,
0.287745, 0.0897166, 1.03469, 0, 0.3803922, 1, 1,
0.2893552, 0.2323305, 2.293838, 0, 0.3764706, 1, 1,
0.2923359, 0.9441466, -0.1364942, 0, 0.3686275, 1, 1,
0.2967404, 0.9679673, 0.0560527, 0, 0.3647059, 1, 1,
0.2998763, -0.1114524, 1.473806, 0, 0.3568628, 1, 1,
0.3013835, 0.4310108, 0.2751214, 0, 0.3529412, 1, 1,
0.3029212, 1.712043, -0.08011144, 0, 0.345098, 1, 1,
0.3054476, -1.429772, 2.44105, 0, 0.3411765, 1, 1,
0.3103149, -0.9776461, 1.744412, 0, 0.3333333, 1, 1,
0.3104738, -1.667025, 2.053082, 0, 0.3294118, 1, 1,
0.3147761, -0.4801596, 2.510092, 0, 0.3215686, 1, 1,
0.3154827, 0.3242914, 1.238394, 0, 0.3176471, 1, 1,
0.3160985, -0.08164375, 1.802669, 0, 0.3098039, 1, 1,
0.3191436, 0.2815131, -0.1764647, 0, 0.3058824, 1, 1,
0.3242511, -1.887223, 3.488786, 0, 0.2980392, 1, 1,
0.3260795, 1.355735, 1.590147, 0, 0.2901961, 1, 1,
0.3289817, 1.904783, 0.9507133, 0, 0.2862745, 1, 1,
0.3314639, -0.2830208, 2.811179, 0, 0.2784314, 1, 1,
0.3343495, -0.435306, 1.614283, 0, 0.2745098, 1, 1,
0.3350688, 0.04020178, 1.878909, 0, 0.2666667, 1, 1,
0.3385806, 0.04866139, -0.08321096, 0, 0.2627451, 1, 1,
0.3480634, 0.0486173, 1.522032, 0, 0.254902, 1, 1,
0.3565509, -0.5791465, 4.362634, 0, 0.2509804, 1, 1,
0.3569174, -1.466873, 4.60527, 0, 0.2431373, 1, 1,
0.3569903, -1.221388, 4.091568, 0, 0.2392157, 1, 1,
0.3604208, -1.039384, 3.101276, 0, 0.2313726, 1, 1,
0.3607157, 1.396611, 0.275146, 0, 0.227451, 1, 1,
0.3654552, -1.147091, 2.678297, 0, 0.2196078, 1, 1,
0.3659075, 0.819734, 0.7982569, 0, 0.2156863, 1, 1,
0.366589, -0.1916261, 3.643814, 0, 0.2078431, 1, 1,
0.3693008, -0.08025547, 2.666, 0, 0.2039216, 1, 1,
0.3728569, -1.912823, 2.504345, 0, 0.1960784, 1, 1,
0.3735946, -1.247365, 2.692844, 0, 0.1882353, 1, 1,
0.373783, -1.001055, 2.971639, 0, 0.1843137, 1, 1,
0.3738857, 0.7535471, 0.1466032, 0, 0.1764706, 1, 1,
0.3796138, 0.4487041, 1.780214, 0, 0.172549, 1, 1,
0.3837975, 0.7807813, 1.469329, 0, 0.1647059, 1, 1,
0.3862662, 0.5949541, 1.397433, 0, 0.1607843, 1, 1,
0.3873654, 0.587878, 0.1660976, 0, 0.1529412, 1, 1,
0.3921293, -1.15947, 3.834324, 0, 0.1490196, 1, 1,
0.3926703, -0.861543, 2.453539, 0, 0.1411765, 1, 1,
0.3981206, 0.9371183, 1.423333, 0, 0.1372549, 1, 1,
0.4010319, 0.146972, 2.033524, 0, 0.1294118, 1, 1,
0.4011641, 2.080929, -0.8306509, 0, 0.1254902, 1, 1,
0.4034044, 0.8402929, -1.538632, 0, 0.1176471, 1, 1,
0.4053426, 0.5407561, -0.03212956, 0, 0.1137255, 1, 1,
0.4085405, 0.2224123, 2.035787, 0, 0.1058824, 1, 1,
0.4099696, 0.4441905, 1.330258, 0, 0.09803922, 1, 1,
0.4123195, -0.4502478, 3.466765, 0, 0.09411765, 1, 1,
0.4154596, 0.8448222, 0.7345256, 0, 0.08627451, 1, 1,
0.4160948, -0.2888412, 2.392849, 0, 0.08235294, 1, 1,
0.4162338, 2.371624, 0.6243327, 0, 0.07450981, 1, 1,
0.416887, -0.6205142, 2.585195, 0, 0.07058824, 1, 1,
0.4180681, 0.9857123, 0.1162755, 0, 0.0627451, 1, 1,
0.4188747, 0.295821, 0.393763, 0, 0.05882353, 1, 1,
0.4249493, 0.2742185, 0.6429826, 0, 0.05098039, 1, 1,
0.426017, 0.1593032, 0.7974585, 0, 0.04705882, 1, 1,
0.4278102, -1.020508, 3.062691, 0, 0.03921569, 1, 1,
0.4301226, 0.3562732, 0.7963273, 0, 0.03529412, 1, 1,
0.4327405, -1.849172, 2.31414, 0, 0.02745098, 1, 1,
0.4396167, -0.002947782, 2.176548, 0, 0.02352941, 1, 1,
0.44163, -1.893868, 2.468799, 0, 0.01568628, 1, 1,
0.4422368, 0.8225293, 0.6871756, 0, 0.01176471, 1, 1,
0.4422447, 0.08453301, 1.615669, 0, 0.003921569, 1, 1,
0.4476389, -0.4898004, 1.747252, 0.003921569, 0, 1, 1,
0.4478624, 1.077443, 0.1613777, 0.007843138, 0, 1, 1,
0.448976, 0.3238805, 2.550271, 0.01568628, 0, 1, 1,
0.4586163, -2.630117, 3.389447, 0.01960784, 0, 1, 1,
0.4586695, -0.4925318, 2.075025, 0.02745098, 0, 1, 1,
0.4594601, -0.8485175, 2.603291, 0.03137255, 0, 1, 1,
0.4625422, -0.4267004, -0.4195275, 0.03921569, 0, 1, 1,
0.4647042, -1.662594, 3.802793, 0.04313726, 0, 1, 1,
0.4664768, 0.9754024, 3.151067, 0.05098039, 0, 1, 1,
0.4698149, 0.6624321, -0.08451413, 0.05490196, 0, 1, 1,
0.4723208, -0.2157003, 1.810372, 0.0627451, 0, 1, 1,
0.4734716, 0.7680073, 0.8870392, 0.06666667, 0, 1, 1,
0.4746429, -1.28101, 2.932935, 0.07450981, 0, 1, 1,
0.4748842, 0.04950299, 0.8670522, 0.07843138, 0, 1, 1,
0.4769061, 1.072483, 1.409088, 0.08627451, 0, 1, 1,
0.4806928, 0.3283615, 1.489482, 0.09019608, 0, 1, 1,
0.4831867, 0.04409896, 1.542293, 0.09803922, 0, 1, 1,
0.4849983, -0.5128506, 2.594057, 0.1058824, 0, 1, 1,
0.4872793, 0.4624677, 1.378276, 0.1098039, 0, 1, 1,
0.4954113, 0.1842437, 1.561669, 0.1176471, 0, 1, 1,
0.496422, -0.1232913, 3.447915, 0.1215686, 0, 1, 1,
0.4978856, 1.235276, -0.1660968, 0.1294118, 0, 1, 1,
0.4997241, -1.799119, 1.496668, 0.1333333, 0, 1, 1,
0.4998002, -0.1674558, 1.720525, 0.1411765, 0, 1, 1,
0.5019775, 0.8396319, 0.6148041, 0.145098, 0, 1, 1,
0.5030951, -1.775133, 2.370364, 0.1529412, 0, 1, 1,
0.5072805, -1.004581, 2.94602, 0.1568628, 0, 1, 1,
0.5147058, -0.4735121, 2.997162, 0.1647059, 0, 1, 1,
0.5181475, 1.583601, 0.1957244, 0.1686275, 0, 1, 1,
0.5189419, 0.1747447, 2.767609, 0.1764706, 0, 1, 1,
0.5197904, -0.3946649, 2.338935, 0.1803922, 0, 1, 1,
0.5223909, -0.6328772, 1.702083, 0.1882353, 0, 1, 1,
0.526347, 1.015427, 0.2966514, 0.1921569, 0, 1, 1,
0.5264354, -1.65436, 4.513315, 0.2, 0, 1, 1,
0.5290542, -1.06643, 1.678066, 0.2078431, 0, 1, 1,
0.5311045, 0.8279472, 0.9687865, 0.2117647, 0, 1, 1,
0.531633, -1.180473, 4.338946, 0.2196078, 0, 1, 1,
0.5342518, -0.314731, 2.253215, 0.2235294, 0, 1, 1,
0.5379172, -0.9380746, 1.314957, 0.2313726, 0, 1, 1,
0.5462332, 0.2284449, 0.2677909, 0.2352941, 0, 1, 1,
0.5530348, 0.5499306, 0.8539597, 0.2431373, 0, 1, 1,
0.5536976, 1.271512, -0.8397718, 0.2470588, 0, 1, 1,
0.5543758, 0.01010473, 0.5823289, 0.254902, 0, 1, 1,
0.555795, -1.330873, 1.842502, 0.2588235, 0, 1, 1,
0.5590589, 1.247123, -0.3240187, 0.2666667, 0, 1, 1,
0.5596381, -1.796418, 2.771323, 0.2705882, 0, 1, 1,
0.5624865, 1.809954, 0.06666066, 0.2784314, 0, 1, 1,
0.5646629, 1.253256, -1.212039, 0.282353, 0, 1, 1,
0.572734, 1.21067, 0.3869915, 0.2901961, 0, 1, 1,
0.5747881, -1.152846, 3.261932, 0.2941177, 0, 1, 1,
0.5783379, -0.900561, 3.462, 0.3019608, 0, 1, 1,
0.5784189, 0.8872577, 1.610143, 0.3098039, 0, 1, 1,
0.5858663, 0.5578922, 0.3161091, 0.3137255, 0, 1, 1,
0.5865642, 1.414725, 1.079693, 0.3215686, 0, 1, 1,
0.5927063, 0.09208794, 0.8282164, 0.3254902, 0, 1, 1,
0.5927236, -0.7325794, 1.943488, 0.3333333, 0, 1, 1,
0.5931433, -0.2958398, 2.648398, 0.3372549, 0, 1, 1,
0.5992693, -0.5871275, 1.211085, 0.345098, 0, 1, 1,
0.6061439, -0.9074342, 2.838228, 0.3490196, 0, 1, 1,
0.6081107, 0.4793105, 0.6720581, 0.3568628, 0, 1, 1,
0.6091948, -0.4870903, 0.1454978, 0.3607843, 0, 1, 1,
0.6108382, 0.08183994, 1.272531, 0.3686275, 0, 1, 1,
0.6110474, -0.4017718, 2.434953, 0.372549, 0, 1, 1,
0.617531, -0.7091928, -0.581875, 0.3803922, 0, 1, 1,
0.6215422, 1.031776, 0.4713873, 0.3843137, 0, 1, 1,
0.6216967, -0.6219167, 2.971782, 0.3921569, 0, 1, 1,
0.6224406, -1.577942, 2.8602, 0.3960784, 0, 1, 1,
0.6245674, 0.2024227, 0.7906013, 0.4039216, 0, 1, 1,
0.6252545, 1.05558, 1.014305, 0.4117647, 0, 1, 1,
0.6252815, -1.985628, 2.710829, 0.4156863, 0, 1, 1,
0.625981, 0.4921055, 2.444985, 0.4235294, 0, 1, 1,
0.6281499, -0.7316762, 4.002831, 0.427451, 0, 1, 1,
0.6352228, -0.8830059, 2.902397, 0.4352941, 0, 1, 1,
0.6381091, 1.183854, -0.2461048, 0.4392157, 0, 1, 1,
0.6382293, 0.2878679, 0.1946192, 0.4470588, 0, 1, 1,
0.6410599, 0.6678857, -0.1121797, 0.4509804, 0, 1, 1,
0.644321, 0.5562043, 0.1549184, 0.4588235, 0, 1, 1,
0.6461072, -0.7776012, 2.133618, 0.4627451, 0, 1, 1,
0.6469932, -1.300364, 3.682792, 0.4705882, 0, 1, 1,
0.6507002, 0.6724534, 1.431579, 0.4745098, 0, 1, 1,
0.6509852, -1.462809, 3.630273, 0.4823529, 0, 1, 1,
0.6513364, 0.730112, -0.4357694, 0.4862745, 0, 1, 1,
0.6514559, -0.9018753, 4.46978, 0.4941176, 0, 1, 1,
0.6522754, -0.7029337, 1.203296, 0.5019608, 0, 1, 1,
0.6523516, 1.409812, -0.1961755, 0.5058824, 0, 1, 1,
0.6533879, -0.938975, 3.467845, 0.5137255, 0, 1, 1,
0.6534484, 1.919784, 1.102262, 0.5176471, 0, 1, 1,
0.6543739, -0.3879795, 1.076441, 0.5254902, 0, 1, 1,
0.6558013, -2.569269, 3.143987, 0.5294118, 0, 1, 1,
0.6666842, -0.6697453, 3.124159, 0.5372549, 0, 1, 1,
0.6691653, 2.013312, -1.761262, 0.5411765, 0, 1, 1,
0.6697748, 0.5571852, -0.13881, 0.5490196, 0, 1, 1,
0.6708019, -0.2914275, 2.069852, 0.5529412, 0, 1, 1,
0.6727447, -0.4151219, 2.308367, 0.5607843, 0, 1, 1,
0.6763229, 0.2306837, 0.6841249, 0.5647059, 0, 1, 1,
0.6793102, -0.7312009, 3.63338, 0.572549, 0, 1, 1,
0.6797087, -0.09623937, 1.228454, 0.5764706, 0, 1, 1,
0.680196, 0.7036436, 1.573751, 0.5843138, 0, 1, 1,
0.6822925, -0.0003416272, 0.485291, 0.5882353, 0, 1, 1,
0.683656, 1.67784, -0.3338189, 0.5960785, 0, 1, 1,
0.6845537, -0.04385451, 2.841237, 0.6039216, 0, 1, 1,
0.6848816, -0.09976244, 1.153738, 0.6078432, 0, 1, 1,
0.6942553, -1.805431, 2.946712, 0.6156863, 0, 1, 1,
0.7011331, 0.5485492, 1.023197, 0.6196079, 0, 1, 1,
0.7060618, -1.739181, 2.851752, 0.627451, 0, 1, 1,
0.7068433, -1.166438, 2.909927, 0.6313726, 0, 1, 1,
0.7101713, 0.7582467, 1.970931, 0.6392157, 0, 1, 1,
0.714173, -1.224014, 3.646214, 0.6431373, 0, 1, 1,
0.7175143, -1.621054, 3.34631, 0.6509804, 0, 1, 1,
0.7188568, 2.055026, 0.5471947, 0.654902, 0, 1, 1,
0.7191965, -0.2586011, 1.343745, 0.6627451, 0, 1, 1,
0.7251375, 0.860339, -0.4308378, 0.6666667, 0, 1, 1,
0.7257305, -0.4063113, 3.687076, 0.6745098, 0, 1, 1,
0.7260043, 1.412186, 0.1948116, 0.6784314, 0, 1, 1,
0.7404526, 0.4203206, 0.3635733, 0.6862745, 0, 1, 1,
0.7408939, 1.494321, 0.193267, 0.6901961, 0, 1, 1,
0.7430981, 1.983464, 1.466422, 0.6980392, 0, 1, 1,
0.7431263, -0.343661, 1.082734, 0.7058824, 0, 1, 1,
0.7493274, -0.6423638, 0.63806, 0.7098039, 0, 1, 1,
0.7526056, -0.4232897, 2.940646, 0.7176471, 0, 1, 1,
0.7552602, -0.8322828, 3.553414, 0.7215686, 0, 1, 1,
0.7596163, -0.2158359, 2.039612, 0.7294118, 0, 1, 1,
0.7610458, -0.5789563, 1.698319, 0.7333333, 0, 1, 1,
0.7626659, -0.5210134, 2.744151, 0.7411765, 0, 1, 1,
0.7669551, -0.8542903, 1.823375, 0.7450981, 0, 1, 1,
0.7679094, -1.097087, 2.202392, 0.7529412, 0, 1, 1,
0.7844679, 0.7919325, 0.5229636, 0.7568628, 0, 1, 1,
0.7876314, -0.3607951, 3.316372, 0.7647059, 0, 1, 1,
0.7906025, -0.08811826, 1.496401, 0.7686275, 0, 1, 1,
0.7929956, 0.1403846, 1.171696, 0.7764706, 0, 1, 1,
0.795326, -0.9053861, 3.231013, 0.7803922, 0, 1, 1,
0.7986678, 0.1973304, 2.612198, 0.7882353, 0, 1, 1,
0.8082323, 0.6743691, -0.6847469, 0.7921569, 0, 1, 1,
0.810097, -0.1938272, 0.1370361, 0.8, 0, 1, 1,
0.8132804, -0.01957829, 1.043773, 0.8078431, 0, 1, 1,
0.8135562, 1.365942, -0.3082313, 0.8117647, 0, 1, 1,
0.81557, -0.2198082, 2.65731, 0.8196079, 0, 1, 1,
0.8192297, 0.03896842, 2.184305, 0.8235294, 0, 1, 1,
0.8283904, 1.453961, 0.09655992, 0.8313726, 0, 1, 1,
0.8316237, 2.505946, -0.450812, 0.8352941, 0, 1, 1,
0.8334551, -2.103456, 2.966819, 0.8431373, 0, 1, 1,
0.8443608, -1.910853, 1.928107, 0.8470588, 0, 1, 1,
0.8498877, -2.179261, 1.16552, 0.854902, 0, 1, 1,
0.8525947, -0.2001398, 3.132593, 0.8588235, 0, 1, 1,
0.854933, -1.401217, 2.492598, 0.8666667, 0, 1, 1,
0.8592278, -1.129749, 4.351175, 0.8705882, 0, 1, 1,
0.8604258, 0.6419711, -0.2514934, 0.8784314, 0, 1, 1,
0.8619849, 0.4513128, 1.25554, 0.8823529, 0, 1, 1,
0.8659803, -0.4581724, 1.378954, 0.8901961, 0, 1, 1,
0.866176, -1.772384, 1.216538, 0.8941177, 0, 1, 1,
0.8667843, -0.8393397, 2.581476, 0.9019608, 0, 1, 1,
0.870929, -0.7924713, 0.6887207, 0.9098039, 0, 1, 1,
0.8724609, 0.4995846, 1.793723, 0.9137255, 0, 1, 1,
0.8796347, 0.8923599, 1.110087, 0.9215686, 0, 1, 1,
0.8796751, -1.222932, 3.258599, 0.9254902, 0, 1, 1,
0.8819104, -0.1404766, 3.284255, 0.9333333, 0, 1, 1,
0.883258, -1.070171, 3.88791, 0.9372549, 0, 1, 1,
0.8836306, -1.436779, 1.906811, 0.945098, 0, 1, 1,
0.8937699, -0.3290116, 1.971999, 0.9490196, 0, 1, 1,
0.893993, -0.1025323, 2.438354, 0.9568627, 0, 1, 1,
0.908804, -1.586329, 3.411036, 0.9607843, 0, 1, 1,
0.9122346, -0.6772364, 3.030464, 0.9686275, 0, 1, 1,
0.9140087, 0.9381397, 1.609691, 0.972549, 0, 1, 1,
0.9155069, 0.3890258, 2.195838, 0.9803922, 0, 1, 1,
0.9199617, -0.7433856, 0.5064802, 0.9843137, 0, 1, 1,
0.9250483, 1.584626, 1.485811, 0.9921569, 0, 1, 1,
0.9250506, -1.071314, 1.823775, 0.9960784, 0, 1, 1,
0.9383933, 1.941136, 0.3774094, 1, 0, 0.9960784, 1,
0.9432324, 0.1267948, 1.069124, 1, 0, 0.9882353, 1,
0.9446981, -0.5374162, 0.03359859, 1, 0, 0.9843137, 1,
0.9452491, -0.6545072, 2.920816, 1, 0, 0.9764706, 1,
0.9473156, -0.5864373, 1.111935, 1, 0, 0.972549, 1,
0.9475347, -0.3200896, 3.07293, 1, 0, 0.9647059, 1,
0.9520513, 0.1623008, 0.9389502, 1, 0, 0.9607843, 1,
0.9694365, 0.3607725, 3.275846, 1, 0, 0.9529412, 1,
0.9713234, -1.592224, 0.8398104, 1, 0, 0.9490196, 1,
0.9811122, 0.3710466, 1.228233, 1, 0, 0.9411765, 1,
0.9831666, 1.037368, 1.579194, 1, 0, 0.9372549, 1,
0.9920828, 1.590685, 0.2925226, 1, 0, 0.9294118, 1,
1.00465, -0.5413894, 1.007991, 1, 0, 0.9254902, 1,
1.010867, 1.051505, 2.027189, 1, 0, 0.9176471, 1,
1.011894, -1.765919, 1.906824, 1, 0, 0.9137255, 1,
1.019743, 0.5214931, 1.994237, 1, 0, 0.9058824, 1,
1.021822, -0.5198973, 1.669135, 1, 0, 0.9019608, 1,
1.030752, 0.4142441, 1.553383, 1, 0, 0.8941177, 1,
1.046069, 1.171181, 0.04979657, 1, 0, 0.8862745, 1,
1.049773, 0.4982206, 1.09794, 1, 0, 0.8823529, 1,
1.049777, 0.8518092, 1.221164, 1, 0, 0.8745098, 1,
1.055992, 0.7484435, -0.6075692, 1, 0, 0.8705882, 1,
1.056529, 0.1923042, 0.5835226, 1, 0, 0.8627451, 1,
1.063224, -0.02401159, 2.762483, 1, 0, 0.8588235, 1,
1.064071, -1.18425, 1.680359, 1, 0, 0.8509804, 1,
1.06738, 0.654013, 0.3423766, 1, 0, 0.8470588, 1,
1.068131, -1.781084, 1.699901, 1, 0, 0.8392157, 1,
1.075905, 0.4310066, 0.3188072, 1, 0, 0.8352941, 1,
1.077012, -0.531728, 1.455083, 1, 0, 0.827451, 1,
1.085256, -1.874064, 2.622579, 1, 0, 0.8235294, 1,
1.087049, -0.4589808, 2.107453, 1, 0, 0.8156863, 1,
1.087504, -0.7439757, 4.390105, 1, 0, 0.8117647, 1,
1.091459, -0.3579814, 1.470591, 1, 0, 0.8039216, 1,
1.093385, -2.247242, 2.295118, 1, 0, 0.7960784, 1,
1.101166, -1.259323, -0.130689, 1, 0, 0.7921569, 1,
1.101474, 0.1992449, 3.047033, 1, 0, 0.7843137, 1,
1.103117, -1.021795, 1.479227, 1, 0, 0.7803922, 1,
1.107138, -0.007072723, 2.59382, 1, 0, 0.772549, 1,
1.108642, 1.262423, -0.5566792, 1, 0, 0.7686275, 1,
1.111313, -0.4692912, 2.823082, 1, 0, 0.7607843, 1,
1.111918, -1.271317, 1.949179, 1, 0, 0.7568628, 1,
1.121425, -0.9804879, 3.369071, 1, 0, 0.7490196, 1,
1.122084, -0.8848197, 1.515283, 1, 0, 0.7450981, 1,
1.124851, -0.3485355, 2.104526, 1, 0, 0.7372549, 1,
1.127636, 1.562845, -0.1325252, 1, 0, 0.7333333, 1,
1.135435, 0.6588402, 1.31129, 1, 0, 0.7254902, 1,
1.13624, 1.00219, -1.105545, 1, 0, 0.7215686, 1,
1.139707, 0.1905326, 2.754349, 1, 0, 0.7137255, 1,
1.148714, 0.4034082, 1.355367, 1, 0, 0.7098039, 1,
1.169008, 0.6393949, 0.778302, 1, 0, 0.7019608, 1,
1.172368, 0.1450812, 0.1702517, 1, 0, 0.6941177, 1,
1.182101, -2.491046, 2.53113, 1, 0, 0.6901961, 1,
1.182792, 0.7281988, 1.154789, 1, 0, 0.682353, 1,
1.185923, -2.078447, 1.7126, 1, 0, 0.6784314, 1,
1.186876, -0.9032118, 0.8016613, 1, 0, 0.6705883, 1,
1.200236, 1.602724, 1.828948, 1, 0, 0.6666667, 1,
1.205667, 2.106057, -1.47595, 1, 0, 0.6588235, 1,
1.206434, 0.2439342, 1.462749, 1, 0, 0.654902, 1,
1.207072, 0.7906292, 1.801577, 1, 0, 0.6470588, 1,
1.209174, 0.5508385, 2.064803, 1, 0, 0.6431373, 1,
1.210483, -0.4556085, 0.1583053, 1, 0, 0.6352941, 1,
1.215854, -0.9985927, 2.149697, 1, 0, 0.6313726, 1,
1.221612, -0.3987833, 2.491828, 1, 0, 0.6235294, 1,
1.224046, 0.1649724, 0.3831531, 1, 0, 0.6196079, 1,
1.224313, 0.3224811, 1.203669, 1, 0, 0.6117647, 1,
1.225631, 1.564412, -0.1893979, 1, 0, 0.6078432, 1,
1.22597, -0.003330359, 2.037939, 1, 0, 0.6, 1,
1.229512, -0.3533338, 1.917887, 1, 0, 0.5921569, 1,
1.232602, -0.7027365, 3.249692, 1, 0, 0.5882353, 1,
1.233615, -0.3264219, 2.299231, 1, 0, 0.5803922, 1,
1.233778, -0.08991589, 0.1066553, 1, 0, 0.5764706, 1,
1.233838, 0.1797116, -0.06693127, 1, 0, 0.5686275, 1,
1.235029, -1.413236, 3.416158, 1, 0, 0.5647059, 1,
1.237513, 0.8024629, 0.04076958, 1, 0, 0.5568628, 1,
1.241528, -0.6383893, 1.584113, 1, 0, 0.5529412, 1,
1.254564, 0.1346608, 2.104752, 1, 0, 0.5450981, 1,
1.259645, 0.6027494, 1.933751, 1, 0, 0.5411765, 1,
1.269946, -0.34312, 4.39302, 1, 0, 0.5333334, 1,
1.271209, 0.1485606, 3.086562, 1, 0, 0.5294118, 1,
1.27133, 1.18748, 2.354563, 1, 0, 0.5215687, 1,
1.273584, 0.8517115, 1.342698, 1, 0, 0.5176471, 1,
1.287941, 0.5489677, 1.139494, 1, 0, 0.509804, 1,
1.306022, -0.5781685, 1.240673, 1, 0, 0.5058824, 1,
1.311176, -0.5356523, 1.364804, 1, 0, 0.4980392, 1,
1.317368, 0.08643763, 1.303252, 1, 0, 0.4901961, 1,
1.320624, -0.6251927, 2.894485, 1, 0, 0.4862745, 1,
1.326123, -1.447654, 2.341607, 1, 0, 0.4784314, 1,
1.341722, 1.468482, 1.324914, 1, 0, 0.4745098, 1,
1.344546, 0.4245664, 0.7265553, 1, 0, 0.4666667, 1,
1.346979, -1.523792, 2.482413, 1, 0, 0.4627451, 1,
1.34961, 0.5618243, 2.62487, 1, 0, 0.454902, 1,
1.351114, -1.731321, 4.318942, 1, 0, 0.4509804, 1,
1.359106, 0.5523238, 1.603072, 1, 0, 0.4431373, 1,
1.359154, 0.6016887, 1.386011, 1, 0, 0.4392157, 1,
1.370547, 0.9292981, 1.737407, 1, 0, 0.4313726, 1,
1.373589, 0.2650504, 1.933543, 1, 0, 0.427451, 1,
1.388262, 1.04811, -0.3049613, 1, 0, 0.4196078, 1,
1.399847, -0.8782005, -0.2088951, 1, 0, 0.4156863, 1,
1.401012, 0.4930641, 1.451662, 1, 0, 0.4078431, 1,
1.408607, 0.09890483, 1.931476, 1, 0, 0.4039216, 1,
1.425199, 0.5317742, -0.02931882, 1, 0, 0.3960784, 1,
1.428482, -0.9115387, -0.194662, 1, 0, 0.3882353, 1,
1.444921, -1.2906, 2.34083, 1, 0, 0.3843137, 1,
1.450132, 0.0007544439, 2.432816, 1, 0, 0.3764706, 1,
1.455184, 1.235923, 0.7755359, 1, 0, 0.372549, 1,
1.459538, -1.360285, 1.814554, 1, 0, 0.3647059, 1,
1.465569, 0.8253886, 2.233135, 1, 0, 0.3607843, 1,
1.47106, 1.839713, 0.4622085, 1, 0, 0.3529412, 1,
1.481084, -0.407761, 2.962736, 1, 0, 0.3490196, 1,
1.50278, 0.701229, 2.074667, 1, 0, 0.3411765, 1,
1.505618, 1.175308, 0.7924804, 1, 0, 0.3372549, 1,
1.507746, 0.3626693, 1.94922, 1, 0, 0.3294118, 1,
1.518504, -0.8290789, 2.396006, 1, 0, 0.3254902, 1,
1.532382, -0.1868271, 1.561912, 1, 0, 0.3176471, 1,
1.537449, -0.3698219, 1.551871, 1, 0, 0.3137255, 1,
1.543026, -0.5087423, 2.952309, 1, 0, 0.3058824, 1,
1.554924, -0.9551492, 2.369987, 1, 0, 0.2980392, 1,
1.555214, 0.5297131, 1.442627, 1, 0, 0.2941177, 1,
1.565098, 0.3637989, 1.696452, 1, 0, 0.2862745, 1,
1.595189, 1.021671, -0.8648672, 1, 0, 0.282353, 1,
1.601, 0.7760296, 0.1883857, 1, 0, 0.2745098, 1,
1.61556, 0.2688495, -0.9143876, 1, 0, 0.2705882, 1,
1.616875, 0.5830158, 0.0846924, 1, 0, 0.2627451, 1,
1.636672, -0.8853951, 2.377674, 1, 0, 0.2588235, 1,
1.660047, 1.2386, -0.8528175, 1, 0, 0.2509804, 1,
1.666561, 0.150512, 0.4002746, 1, 0, 0.2470588, 1,
1.669988, -0.8173574, 3.35953, 1, 0, 0.2392157, 1,
1.676789, -1.741707, 2.447057, 1, 0, 0.2352941, 1,
1.689662, 0.362848, 0.6634809, 1, 0, 0.227451, 1,
1.7004, -0.8388129, 2.771328, 1, 0, 0.2235294, 1,
1.714568, 1.182863, 0.009576991, 1, 0, 0.2156863, 1,
1.718503, 0.491284, 0.4918106, 1, 0, 0.2117647, 1,
1.758555, 0.8976063, 2.172248, 1, 0, 0.2039216, 1,
1.774262, 0.655948, 0.1874994, 1, 0, 0.1960784, 1,
1.793166, 0.1784327, 1.249395, 1, 0, 0.1921569, 1,
1.797728, 1.341761, 1.922327, 1, 0, 0.1843137, 1,
1.804991, 1.194603, 2.590465, 1, 0, 0.1803922, 1,
1.829169, 0.4247623, -0.8425272, 1, 0, 0.172549, 1,
1.830934, 1.020733, 1.233783, 1, 0, 0.1686275, 1,
1.831025, -0.05306106, 1.428173, 1, 0, 0.1607843, 1,
1.883671, 1.497815, 2.727341, 1, 0, 0.1568628, 1,
1.902945, -0.3604887, 1.618802, 1, 0, 0.1490196, 1,
1.904905, -0.1158315, 2.798841, 1, 0, 0.145098, 1,
1.909392, 0.5916156, 2.468681, 1, 0, 0.1372549, 1,
1.919005, 0.5106717, 0.4706027, 1, 0, 0.1333333, 1,
1.966805, 1.828601, 1.0258, 1, 0, 0.1254902, 1,
1.975525, 0.6439821, 1.68989, 1, 0, 0.1215686, 1,
2.018073, 1.763141, -0.4491546, 1, 0, 0.1137255, 1,
2.026329, 0.1101656, 2.309039, 1, 0, 0.1098039, 1,
2.055698, -1.165982, 2.362361, 1, 0, 0.1019608, 1,
2.059976, 0.171716, 2.171032, 1, 0, 0.09411765, 1,
2.097832, 1.183003, 1.121858, 1, 0, 0.09019608, 1,
2.169064, -0.6607639, 1.744416, 1, 0, 0.08235294, 1,
2.170968, -0.8916996, 1.858834, 1, 0, 0.07843138, 1,
2.186189, 1.388574, 2.779274, 1, 0, 0.07058824, 1,
2.255111, -0.3450579, 0.6785784, 1, 0, 0.06666667, 1,
2.258786, -1.279083, 2.717645, 1, 0, 0.05882353, 1,
2.329956, -0.9796293, 1.870387, 1, 0, 0.05490196, 1,
2.330958, -0.207632, 3.169713, 1, 0, 0.04705882, 1,
2.490948, 0.1241376, 1.153144, 1, 0, 0.04313726, 1,
2.656892, -0.1275606, 2.051733, 1, 0, 0.03529412, 1,
2.66934, 1.70334, 1.564866, 1, 0, 0.03137255, 1,
2.735084, -1.484178, 1.002509, 1, 0, 0.02352941, 1,
2.751352, -0.230448, -0.1162084, 1, 0, 0.01960784, 1,
2.836893, -0.1666328, 3.226009, 1, 0, 0.01176471, 1,
3.256234, -0.2873932, 1.874568, 1, 0, 0.007843138, 1
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
-0.1130127, -4.086559, -8.341302, 0, -0.5, 0.5, 0.5,
-0.1130127, -4.086559, -8.341302, 1, -0.5, 0.5, 0.5,
-0.1130127, -4.086559, -8.341302, 1, 1.5, 0.5, 0.5,
-0.1130127, -4.086559, -8.341302, 0, 1.5, 0.5, 0.5
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
-4.624434, -0.1670194, -8.341302, 0, -0.5, 0.5, 0.5,
-4.624434, -0.1670194, -8.341302, 1, -0.5, 0.5, 0.5,
-4.624434, -0.1670194, -8.341302, 1, 1.5, 0.5, 0.5,
-4.624434, -0.1670194, -8.341302, 0, 1.5, 0.5, 0.5
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
-4.624434, -4.086559, -0.3610656, 0, -0.5, 0.5, 0.5,
-4.624434, -4.086559, -0.3610656, 1, -0.5, 0.5, 0.5,
-4.624434, -4.086559, -0.3610656, 1, 1.5, 0.5, 0.5,
-4.624434, -4.086559, -0.3610656, 0, 1.5, 0.5, 0.5
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
-3, -3.18205, -6.499709,
3, -3.18205, -6.499709,
-3, -3.18205, -6.499709,
-3, -3.332802, -6.806642,
-2, -3.18205, -6.499709,
-2, -3.332802, -6.806642,
-1, -3.18205, -6.499709,
-1, -3.332802, -6.806642,
0, -3.18205, -6.499709,
0, -3.332802, -6.806642,
1, -3.18205, -6.499709,
1, -3.332802, -6.806642,
2, -3.18205, -6.499709,
2, -3.332802, -6.806642,
3, -3.18205, -6.499709,
3, -3.332802, -6.806642
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
-3, -3.634305, -7.420506, 0, -0.5, 0.5, 0.5,
-3, -3.634305, -7.420506, 1, -0.5, 0.5, 0.5,
-3, -3.634305, -7.420506, 1, 1.5, 0.5, 0.5,
-3, -3.634305, -7.420506, 0, 1.5, 0.5, 0.5,
-2, -3.634305, -7.420506, 0, -0.5, 0.5, 0.5,
-2, -3.634305, -7.420506, 1, -0.5, 0.5, 0.5,
-2, -3.634305, -7.420506, 1, 1.5, 0.5, 0.5,
-2, -3.634305, -7.420506, 0, 1.5, 0.5, 0.5,
-1, -3.634305, -7.420506, 0, -0.5, 0.5, 0.5,
-1, -3.634305, -7.420506, 1, -0.5, 0.5, 0.5,
-1, -3.634305, -7.420506, 1, 1.5, 0.5, 0.5,
-1, -3.634305, -7.420506, 0, 1.5, 0.5, 0.5,
0, -3.634305, -7.420506, 0, -0.5, 0.5, 0.5,
0, -3.634305, -7.420506, 1, -0.5, 0.5, 0.5,
0, -3.634305, -7.420506, 1, 1.5, 0.5, 0.5,
0, -3.634305, -7.420506, 0, 1.5, 0.5, 0.5,
1, -3.634305, -7.420506, 0, -0.5, 0.5, 0.5,
1, -3.634305, -7.420506, 1, -0.5, 0.5, 0.5,
1, -3.634305, -7.420506, 1, 1.5, 0.5, 0.5,
1, -3.634305, -7.420506, 0, 1.5, 0.5, 0.5,
2, -3.634305, -7.420506, 0, -0.5, 0.5, 0.5,
2, -3.634305, -7.420506, 1, -0.5, 0.5, 0.5,
2, -3.634305, -7.420506, 1, 1.5, 0.5, 0.5,
2, -3.634305, -7.420506, 0, 1.5, 0.5, 0.5,
3, -3.634305, -7.420506, 0, -0.5, 0.5, 0.5,
3, -3.634305, -7.420506, 1, -0.5, 0.5, 0.5,
3, -3.634305, -7.420506, 1, 1.5, 0.5, 0.5,
3, -3.634305, -7.420506, 0, 1.5, 0.5, 0.5
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
-3.583337, -3, -6.499709,
-3.583337, 2, -6.499709,
-3.583337, -3, -6.499709,
-3.756853, -3, -6.806642,
-3.583337, -2, -6.499709,
-3.756853, -2, -6.806642,
-3.583337, -1, -6.499709,
-3.756853, -1, -6.806642,
-3.583337, 0, -6.499709,
-3.756853, 0, -6.806642,
-3.583337, 1, -6.499709,
-3.756853, 1, -6.806642,
-3.583337, 2, -6.499709,
-3.756853, 2, -6.806642
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
-4.103886, -3, -7.420506, 0, -0.5, 0.5, 0.5,
-4.103886, -3, -7.420506, 1, -0.5, 0.5, 0.5,
-4.103886, -3, -7.420506, 1, 1.5, 0.5, 0.5,
-4.103886, -3, -7.420506, 0, 1.5, 0.5, 0.5,
-4.103886, -2, -7.420506, 0, -0.5, 0.5, 0.5,
-4.103886, -2, -7.420506, 1, -0.5, 0.5, 0.5,
-4.103886, -2, -7.420506, 1, 1.5, 0.5, 0.5,
-4.103886, -2, -7.420506, 0, 1.5, 0.5, 0.5,
-4.103886, -1, -7.420506, 0, -0.5, 0.5, 0.5,
-4.103886, -1, -7.420506, 1, -0.5, 0.5, 0.5,
-4.103886, -1, -7.420506, 1, 1.5, 0.5, 0.5,
-4.103886, -1, -7.420506, 0, 1.5, 0.5, 0.5,
-4.103886, 0, -7.420506, 0, -0.5, 0.5, 0.5,
-4.103886, 0, -7.420506, 1, -0.5, 0.5, 0.5,
-4.103886, 0, -7.420506, 1, 1.5, 0.5, 0.5,
-4.103886, 0, -7.420506, 0, 1.5, 0.5, 0.5,
-4.103886, 1, -7.420506, 0, -0.5, 0.5, 0.5,
-4.103886, 1, -7.420506, 1, -0.5, 0.5, 0.5,
-4.103886, 1, -7.420506, 1, 1.5, 0.5, 0.5,
-4.103886, 1, -7.420506, 0, 1.5, 0.5, 0.5,
-4.103886, 2, -7.420506, 0, -0.5, 0.5, 0.5,
-4.103886, 2, -7.420506, 1, -0.5, 0.5, 0.5,
-4.103886, 2, -7.420506, 1, 1.5, 0.5, 0.5,
-4.103886, 2, -7.420506, 0, 1.5, 0.5, 0.5
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
-3.583337, -3.18205, -6,
-3.583337, -3.18205, 4,
-3.583337, -3.18205, -6,
-3.756853, -3.332802, -6,
-3.583337, -3.18205, -4,
-3.756853, -3.332802, -4,
-3.583337, -3.18205, -2,
-3.756853, -3.332802, -2,
-3.583337, -3.18205, 0,
-3.756853, -3.332802, 0,
-3.583337, -3.18205, 2,
-3.756853, -3.332802, 2,
-3.583337, -3.18205, 4,
-3.756853, -3.332802, 4
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
-4.103886, -3.634305, -6, 0, -0.5, 0.5, 0.5,
-4.103886, -3.634305, -6, 1, -0.5, 0.5, 0.5,
-4.103886, -3.634305, -6, 1, 1.5, 0.5, 0.5,
-4.103886, -3.634305, -6, 0, 1.5, 0.5, 0.5,
-4.103886, -3.634305, -4, 0, -0.5, 0.5, 0.5,
-4.103886, -3.634305, -4, 1, -0.5, 0.5, 0.5,
-4.103886, -3.634305, -4, 1, 1.5, 0.5, 0.5,
-4.103886, -3.634305, -4, 0, 1.5, 0.5, 0.5,
-4.103886, -3.634305, -2, 0, -0.5, 0.5, 0.5,
-4.103886, -3.634305, -2, 1, -0.5, 0.5, 0.5,
-4.103886, -3.634305, -2, 1, 1.5, 0.5, 0.5,
-4.103886, -3.634305, -2, 0, 1.5, 0.5, 0.5,
-4.103886, -3.634305, 0, 0, -0.5, 0.5, 0.5,
-4.103886, -3.634305, 0, 1, -0.5, 0.5, 0.5,
-4.103886, -3.634305, 0, 1, 1.5, 0.5, 0.5,
-4.103886, -3.634305, 0, 0, 1.5, 0.5, 0.5,
-4.103886, -3.634305, 2, 0, -0.5, 0.5, 0.5,
-4.103886, -3.634305, 2, 1, -0.5, 0.5, 0.5,
-4.103886, -3.634305, 2, 1, 1.5, 0.5, 0.5,
-4.103886, -3.634305, 2, 0, 1.5, 0.5, 0.5,
-4.103886, -3.634305, 4, 0, -0.5, 0.5, 0.5,
-4.103886, -3.634305, 4, 1, -0.5, 0.5, 0.5,
-4.103886, -3.634305, 4, 1, 1.5, 0.5, 0.5,
-4.103886, -3.634305, 4, 0, 1.5, 0.5, 0.5
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
-3.583337, -3.18205, -6.499709,
-3.583337, 2.848011, -6.499709,
-3.583337, -3.18205, 5.777578,
-3.583337, 2.848011, 5.777578,
-3.583337, -3.18205, -6.499709,
-3.583337, -3.18205, 5.777578,
-3.583337, 2.848011, -6.499709,
-3.583337, 2.848011, 5.777578,
-3.583337, -3.18205, -6.499709,
3.357312, -3.18205, -6.499709,
-3.583337, -3.18205, 5.777578,
3.357312, -3.18205, 5.777578,
-3.583337, 2.848011, -6.499709,
3.357312, 2.848011, -6.499709,
-3.583337, 2.848011, 5.777578,
3.357312, 2.848011, 5.777578,
3.357312, -3.18205, -6.499709,
3.357312, 2.848011, -6.499709,
3.357312, -3.18205, 5.777578,
3.357312, 2.848011, 5.777578,
3.357312, -3.18205, -6.499709,
3.357312, -3.18205, 5.777578,
3.357312, 2.848011, -6.499709,
3.357312, 2.848011, 5.777578
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
var radius = 8.190399;
var distance = 36.44001;
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
mvMatrix.translate( 0.1130127, 0.1670194, 0.3610656 );
mvMatrix.scale( 1.275907, 1.468579, 0.7213011 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.44001);
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
C10H21NOS<-read.table("C10H21NOS.xyz")
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
-3.48226, -0.7091572, -1.342361, 0, 0, 1, 1, 1,
-2.756589, -0.4115806, -0.4905231, 1, 0, 0, 1, 1,
-2.297561, 0.7248006, -0.6117733, 1, 0, 0, 1, 1,
-2.294898, -0.6004041, -2.214014, 1, 0, 0, 1, 1,
-2.271343, 0.4896999, -2.003031, 1, 0, 0, 1, 1,
-2.211929, -1.854133, -1.192199, 1, 0, 0, 1, 1,
-2.201439, -1.509272, -3.677778, 0, 0, 0, 1, 1,
-2.181438, -0.4507543, -1.937044, 0, 0, 0, 1, 1,
-2.178299, 1.81383, 0.4301682, 0, 0, 0, 1, 1,
-2.155018, 0.1707129, -1.652066, 0, 0, 0, 1, 1,
-2.117117, -1.927069, -2.277732, 0, 0, 0, 1, 1,
-2.080408, -0.6673525, -2.666986, 0, 0, 0, 1, 1,
-2.078497, 0.5842695, 0.401545, 0, 0, 0, 1, 1,
-2.056142, -0.9028509, -1.046598, 1, 1, 1, 1, 1,
-2.036978, -0.5154449, -0.5549518, 1, 1, 1, 1, 1,
-2.035788, -0.7960359, -2.87072, 1, 1, 1, 1, 1,
-1.961436, 0.2883448, 0.7353158, 1, 1, 1, 1, 1,
-1.948759, -1.653994, -1.864177, 1, 1, 1, 1, 1,
-1.944513, 1.252818, 1.088261, 1, 1, 1, 1, 1,
-1.927959, 1.949263, -0.6591336, 1, 1, 1, 1, 1,
-1.924056, -0.9654149, -2.353014, 1, 1, 1, 1, 1,
-1.886382, 1.065205, -1.075464, 1, 1, 1, 1, 1,
-1.885878, -1.006297, -0.4110197, 1, 1, 1, 1, 1,
-1.876715, -1.55235, -1.924862, 1, 1, 1, 1, 1,
-1.84136, 1.342207, -0.8471771, 1, 1, 1, 1, 1,
-1.837664, 0.1509975, -0.4732374, 1, 1, 1, 1, 1,
-1.836252, -0.7654136, -3.167436, 1, 1, 1, 1, 1,
-1.831458, 0.4415224, -2.755367, 1, 1, 1, 1, 1,
-1.827769, -0.1507109, -1.77663, 0, 0, 1, 1, 1,
-1.827664, -0.3951169, -0.6812076, 1, 0, 0, 1, 1,
-1.827129, -0.763942, -2.392658, 1, 0, 0, 1, 1,
-1.826962, 0.6080548, -1.737472, 1, 0, 0, 1, 1,
-1.81947, -1.165418, -1.537038, 1, 0, 0, 1, 1,
-1.81367, -0.5394813, -2.479269, 1, 0, 0, 1, 1,
-1.793246, 1.473689, -2.342957, 0, 0, 0, 1, 1,
-1.787561, -1.195992, -2.261084, 0, 0, 0, 1, 1,
-1.746649, -0.8978236, -2.208649, 0, 0, 0, 1, 1,
-1.745731, 1.795748, -1.670002, 0, 0, 0, 1, 1,
-1.718679, 0.7409732, -1.986353, 0, 0, 0, 1, 1,
-1.70772, -0.3341559, -0.1116028, 0, 0, 0, 1, 1,
-1.699194, -0.2948483, -0.8518544, 0, 0, 0, 1, 1,
-1.675196, -1.371062, -2.201883, 1, 1, 1, 1, 1,
-1.655064, -0.2487101, -1.979551, 1, 1, 1, 1, 1,
-1.652082, 0.7886075, -4.029429, 1, 1, 1, 1, 1,
-1.651656, 0.3591906, -1.225849, 1, 1, 1, 1, 1,
-1.649263, -0.7938051, -1.406189, 1, 1, 1, 1, 1,
-1.623479, -1.039314, -3.466778, 1, 1, 1, 1, 1,
-1.617748, -0.2215983, -0.1075667, 1, 1, 1, 1, 1,
-1.616853, 1.015895, -1.668794, 1, 1, 1, 1, 1,
-1.600439, -1.481196, -4.33727, 1, 1, 1, 1, 1,
-1.599413, -1.688958, -2.911294, 1, 1, 1, 1, 1,
-1.594152, -0.6352146, -2.653392, 1, 1, 1, 1, 1,
-1.585014, 0.2345585, -1.463988, 1, 1, 1, 1, 1,
-1.583481, -0.4323945, -4.328139, 1, 1, 1, 1, 1,
-1.582848, -0.9587773, -2.058311, 1, 1, 1, 1, 1,
-1.558628, 1.427667, -1.982116, 1, 1, 1, 1, 1,
-1.556588, 0.2942617, 0.6565719, 0, 0, 1, 1, 1,
-1.554359, -1.17499, -2.797491, 1, 0, 0, 1, 1,
-1.530557, -0.4077642, -2.279834, 1, 0, 0, 1, 1,
-1.528126, -0.5604888, -0.7394988, 1, 0, 0, 1, 1,
-1.519092, -1.048598, -1.346104, 1, 0, 0, 1, 1,
-1.488365, -0.2361272, -2.833443, 1, 0, 0, 1, 1,
-1.480934, -0.5482186, -0.9424098, 0, 0, 0, 1, 1,
-1.473356, 1.681204, 1.162294, 0, 0, 0, 1, 1,
-1.455197, -0.3772001, -2.446046, 0, 0, 0, 1, 1,
-1.434989, 0.880537, -0.4709568, 0, 0, 0, 1, 1,
-1.430384, -1.291502, -1.739919, 0, 0, 0, 1, 1,
-1.429516, -0.229658, -0.6297803, 0, 0, 0, 1, 1,
-1.416876, 0.02322018, -2.29819, 0, 0, 0, 1, 1,
-1.403882, -0.1110365, -1.385384, 1, 1, 1, 1, 1,
-1.399771, -0.08580126, 0.3486051, 1, 1, 1, 1, 1,
-1.393514, 1.208715, 0.1586464, 1, 1, 1, 1, 1,
-1.389201, -0.1551103, -0.6516436, 1, 1, 1, 1, 1,
-1.388981, 0.6500379, -1.719638, 1, 1, 1, 1, 1,
-1.387827, 0.6487367, -1.175227, 1, 1, 1, 1, 1,
-1.385355, -0.5333475, -1.923727, 1, 1, 1, 1, 1,
-1.378427, -0.27024, -0.2237521, 1, 1, 1, 1, 1,
-1.357405, 0.1879907, -1.291632, 1, 1, 1, 1, 1,
-1.352399, -0.746229, -1.886417, 1, 1, 1, 1, 1,
-1.349284, 0.7244469, -1.126887, 1, 1, 1, 1, 1,
-1.349107, 0.363461, -0.5009383, 1, 1, 1, 1, 1,
-1.343572, -0.1489428, 0.236789, 1, 1, 1, 1, 1,
-1.343117, 0.07451214, 0.5239073, 1, 1, 1, 1, 1,
-1.339361, 0.7348118, -2.88225, 1, 1, 1, 1, 1,
-1.335422, 1.299115, 0.9328274, 0, 0, 1, 1, 1,
-1.320145, 0.9278954, -1.219485, 1, 0, 0, 1, 1,
-1.318432, -1.484082, -2.807941, 1, 0, 0, 1, 1,
-1.310599, -0.08144829, -0.9733627, 1, 0, 0, 1, 1,
-1.306272, 0.7373689, -0.4328, 1, 0, 0, 1, 1,
-1.299799, -2.046509, -2.559715, 1, 0, 0, 1, 1,
-1.293079, 0.4751235, -0.2135324, 0, 0, 0, 1, 1,
-1.292551, -0.439759, -0.7698747, 0, 0, 0, 1, 1,
-1.2901, 0.06237851, -1.934411, 0, 0, 0, 1, 1,
-1.282321, -0.5657558, -2.684585, 0, 0, 0, 1, 1,
-1.279497, -1.010831, -2.607924, 0, 0, 0, 1, 1,
-1.2729, -0.02515643, -2.534204, 0, 0, 0, 1, 1,
-1.263931, 0.3141108, -3.353811, 0, 0, 0, 1, 1,
-1.263784, 0.4346117, -0.8690019, 1, 1, 1, 1, 1,
-1.253163, 1.332927, -1.529145, 1, 1, 1, 1, 1,
-1.243728, -0.2610881, -1.113777, 1, 1, 1, 1, 1,
-1.235397, 2.122095, 0.3793138, 1, 1, 1, 1, 1,
-1.23076, -0.05700044, -2.272156, 1, 1, 1, 1, 1,
-1.226905, 1.230993, -1.862737, 1, 1, 1, 1, 1,
-1.221333, -0.03183074, -3.697691, 1, 1, 1, 1, 1,
-1.212107, -0.05509757, -3.364304, 1, 1, 1, 1, 1,
-1.206793, 1.062865, 0.1671261, 1, 1, 1, 1, 1,
-1.203675, -1.209497, -2.607573, 1, 1, 1, 1, 1,
-1.200561, 2.188138, -0.4004435, 1, 1, 1, 1, 1,
-1.188057, -0.5326335, -1.789508, 1, 1, 1, 1, 1,
-1.182949, -0.0237509, -3.414034, 1, 1, 1, 1, 1,
-1.181936, 0.2775626, -0.1960943, 1, 1, 1, 1, 1,
-1.181702, -0.4810067, -2.555851, 1, 1, 1, 1, 1,
-1.175775, -0.436115, -1.186495, 0, 0, 1, 1, 1,
-1.169738, 0.48266, -1.239885, 1, 0, 0, 1, 1,
-1.163828, 0.06348098, -1.306055, 1, 0, 0, 1, 1,
-1.161976, 1.096149, -2.844916, 1, 0, 0, 1, 1,
-1.157385, -0.3756643, -2.378713, 1, 0, 0, 1, 1,
-1.152271, -0.7002015, -1.769777, 1, 0, 0, 1, 1,
-1.146045, 0.782941, -2.737235, 0, 0, 0, 1, 1,
-1.139314, 0.03581207, 1.680357, 0, 0, 0, 1, 1,
-1.135031, -1.80954, -3.31795, 0, 0, 0, 1, 1,
-1.13433, 0.6686108, -2.458997, 0, 0, 0, 1, 1,
-1.133131, 0.6414234, -0.3232248, 0, 0, 0, 1, 1,
-1.117588, 2.725696, -0.2028161, 0, 0, 0, 1, 1,
-1.116106, 0.4656226, -0.2762394, 0, 0, 0, 1, 1,
-1.114791, 0.2501887, -2.057197, 1, 1, 1, 1, 1,
-1.109801, -1.393474, -0.3906265, 1, 1, 1, 1, 1,
-1.108422, 1.779651, -1.148597, 1, 1, 1, 1, 1,
-1.105834, 0.09433666, -0.5948262, 1, 1, 1, 1, 1,
-1.102383, -0.2613788, -2.313195, 1, 1, 1, 1, 1,
-1.100155, 0.8868181, -0.01419142, 1, 1, 1, 1, 1,
-1.092705, 1.678012, 0.5298035, 1, 1, 1, 1, 1,
-1.091069, -2.244231, -5.375642, 1, 1, 1, 1, 1,
-1.089811, -0.009636644, -0.3610273, 1, 1, 1, 1, 1,
-1.08292, -1.235838, -1.230987, 1, 1, 1, 1, 1,
-1.079851, 1.724621, -0.1414798, 1, 1, 1, 1, 1,
-1.073647, -0.352601, -0.6302227, 1, 1, 1, 1, 1,
-1.068787, -1.073401, -2.351738, 1, 1, 1, 1, 1,
-1.064148, 0.9018109, -0.9663022, 1, 1, 1, 1, 1,
-1.06076, 1.639627, 1.217377, 1, 1, 1, 1, 1,
-1.041064, 2.056795, 0.9152418, 0, 0, 1, 1, 1,
-1.04065, 0.5024101, -0.6474124, 1, 0, 0, 1, 1,
-1.038554, 1.472, 0.7024791, 1, 0, 0, 1, 1,
-1.033445, 1.818105, -0.33017, 1, 0, 0, 1, 1,
-1.032198, 0.2894908, 0.004388902, 1, 0, 0, 1, 1,
-1.030532, -0.8936833, -2.928053, 1, 0, 0, 1, 1,
-1.025845, -0.271948, -3.377905, 0, 0, 0, 1, 1,
-1.025805, 0.2511118, -1.389748, 0, 0, 0, 1, 1,
-1.020703, 0.9452904, -1.93191, 0, 0, 0, 1, 1,
-1.018745, -0.202549, -0.8536947, 0, 0, 0, 1, 1,
-1.01098, -1.232095, -1.407387, 0, 0, 0, 1, 1,
-0.9990149, -0.5674369, -3.365735, 0, 0, 0, 1, 1,
-0.9928772, 1.99551, -0.44853, 0, 0, 0, 1, 1,
-0.9919304, -0.4838281, -3.413517, 1, 1, 1, 1, 1,
-0.9798908, -0.5488791, -1.997959, 1, 1, 1, 1, 1,
-0.9753836, 1.246174, -0.606397, 1, 1, 1, 1, 1,
-0.9642478, 0.2995957, 0.6420106, 1, 1, 1, 1, 1,
-0.9595604, 0.8853928, -0.9165723, 1, 1, 1, 1, 1,
-0.9557949, -1.254728, -3.01635, 1, 1, 1, 1, 1,
-0.9523595, 1.083652, -0.08472318, 1, 1, 1, 1, 1,
-0.94886, 0.5162985, -2.253779, 1, 1, 1, 1, 1,
-0.9475846, 1.20955, -1.48237, 1, 1, 1, 1, 1,
-0.9383318, 1.167725, -1.884361, 1, 1, 1, 1, 1,
-0.93472, -0.2266946, -2.690586, 1, 1, 1, 1, 1,
-0.9318389, -1.431236, -2.406423, 1, 1, 1, 1, 1,
-0.9313802, 0.7396516, 0.6883029, 1, 1, 1, 1, 1,
-0.9281708, 0.209691, -0.8346737, 1, 1, 1, 1, 1,
-0.9176028, 0.3883273, -0.5218599, 1, 1, 1, 1, 1,
-0.9114437, -0.7819336, -2.842724, 0, 0, 1, 1, 1,
-0.9075249, 0.1710774, -2.364921, 1, 0, 0, 1, 1,
-0.9063445, 0.2884381, -0.8797867, 1, 0, 0, 1, 1,
-0.9051428, 0.00885084, -0.5606554, 1, 0, 0, 1, 1,
-0.9006456, -1.901046, -2.835749, 1, 0, 0, 1, 1,
-0.8957016, -0.7927284, -4.262997, 1, 0, 0, 1, 1,
-0.8882917, -0.8367708, -1.491969, 0, 0, 0, 1, 1,
-0.8868014, -0.1037121, -2.229565, 0, 0, 0, 1, 1,
-0.883092, -0.6632354, -4.061194, 0, 0, 0, 1, 1,
-0.8754884, -0.7799503, -2.389577, 0, 0, 0, 1, 1,
-0.870927, -0.4389445, -3.224088, 0, 0, 0, 1, 1,
-0.8703337, 0.003593219, -1.892866, 0, 0, 0, 1, 1,
-0.8678112, -1.295617, -1.718538, 0, 0, 0, 1, 1,
-0.8629873, 0.734992, -1.852446, 1, 1, 1, 1, 1,
-0.8627968, 0.1371849, -2.803738, 1, 1, 1, 1, 1,
-0.8614885, 1.521682, -2.080478, 1, 1, 1, 1, 1,
-0.8600976, -1.080574, -0.6794242, 1, 1, 1, 1, 1,
-0.8391997, -0.281262, -2.940862, 1, 1, 1, 1, 1,
-0.8388885, -1.114593, -3.252955, 1, 1, 1, 1, 1,
-0.8341761, -0.02750663, -0.7348991, 1, 1, 1, 1, 1,
-0.8312443, -0.09967222, 0.09541863, 1, 1, 1, 1, 1,
-0.8291764, -0.5579733, -1.7213, 1, 1, 1, 1, 1,
-0.8272387, 0.4839138, -1.436736, 1, 1, 1, 1, 1,
-0.8204486, 0.4633868, -0.3245929, 1, 1, 1, 1, 1,
-0.8162411, -0.3943023, -3.508395, 1, 1, 1, 1, 1,
-0.8154578, -0.962168, -2.389563, 1, 1, 1, 1, 1,
-0.8105083, -0.6780955, -4.377395, 1, 1, 1, 1, 1,
-0.810147, -1.326457, -2.43648, 1, 1, 1, 1, 1,
-0.8040642, 1.42984, 0.262452, 0, 0, 1, 1, 1,
-0.7955675, 0.8153153, -0.08109564, 1, 0, 0, 1, 1,
-0.7952812, -0.8921402, -3.841804, 1, 0, 0, 1, 1,
-0.7907841, 0.300927, -1.852322, 1, 0, 0, 1, 1,
-0.7906717, 0.7945628, -1.308654, 1, 0, 0, 1, 1,
-0.7873001, -0.8195987, -1.865438, 1, 0, 0, 1, 1,
-0.7867051, -1.29156, -3.712265, 0, 0, 0, 1, 1,
-0.7777779, 0.5883374, -1.252559, 0, 0, 0, 1, 1,
-0.7763672, -0.6447677, -2.03126, 0, 0, 0, 1, 1,
-0.7697704, -0.4369462, -2.70646, 0, 0, 0, 1, 1,
-0.7690232, 0.7390205, -0.04855235, 0, 0, 0, 1, 1,
-0.7677202, -0.9109622, -1.207595, 0, 0, 0, 1, 1,
-0.7672197, 1.898582, -2.571454, 0, 0, 0, 1, 1,
-0.7656641, -0.851236, -3.410378, 1, 1, 1, 1, 1,
-0.7631052, 0.02844329, -2.986489, 1, 1, 1, 1, 1,
-0.7554037, -0.5903323, -1.740342, 1, 1, 1, 1, 1,
-0.7552142, 0.6530512, 0.4384711, 1, 1, 1, 1, 1,
-0.7538488, 0.636665, -0.8005182, 1, 1, 1, 1, 1,
-0.7518564, 0.7240745, 0.5027698, 1, 1, 1, 1, 1,
-0.7517218, 0.8017731, -0.4671873, 1, 1, 1, 1, 1,
-0.7487912, 0.874982, -0.3503993, 1, 1, 1, 1, 1,
-0.7462803, 0.0116592, -2.048368, 1, 1, 1, 1, 1,
-0.745948, 0.8902497, 0.1506692, 1, 1, 1, 1, 1,
-0.7356738, -0.1227863, -2.493803, 1, 1, 1, 1, 1,
-0.7352902, -0.2218147, -4.384381, 1, 1, 1, 1, 1,
-0.7352265, -0.6335059, -2.857528, 1, 1, 1, 1, 1,
-0.733752, -0.007856354, -3.261335, 1, 1, 1, 1, 1,
-0.7325999, -0.07913458, -0.9675177, 1, 1, 1, 1, 1,
-0.7322581, 2.760195, -1.269145, 0, 0, 1, 1, 1,
-0.7307072, -0.05826612, -2.488755, 1, 0, 0, 1, 1,
-0.7284251, 1.148479, 0.6831121, 1, 0, 0, 1, 1,
-0.7270554, -0.8208992, -2.451664, 1, 0, 0, 1, 1,
-0.7249556, 0.277784, -0.4590646, 1, 0, 0, 1, 1,
-0.723274, -0.4899967, -2.340395, 1, 0, 0, 1, 1,
-0.7169605, -0.4231358, -1.105245, 0, 0, 0, 1, 1,
-0.7151594, 0.6893821, 0.878806, 0, 0, 0, 1, 1,
-0.7117581, 0.1168972, -3.490355, 0, 0, 0, 1, 1,
-0.6990663, -0.652593, -3.350213, 0, 0, 0, 1, 1,
-0.6920526, 0.6247265, -0.07555409, 0, 0, 0, 1, 1,
-0.6855179, -1.222582, -4.04674, 0, 0, 0, 1, 1,
-0.6813576, 0.6282804, -2.643263, 0, 0, 0, 1, 1,
-0.6812541, 1.058902, -0.0406477, 1, 1, 1, 1, 1,
-0.6801769, 1.128619, -0.7987191, 1, 1, 1, 1, 1,
-0.6744439, -1.713704, -2.409796, 1, 1, 1, 1, 1,
-0.6737919, 1.484654, -0.04856168, 1, 1, 1, 1, 1,
-0.6725732, -0.02421085, -0.2664095, 1, 1, 1, 1, 1,
-0.6595913, 0.8327816, -0.06497851, 1, 1, 1, 1, 1,
-0.6586626, 0.8164848, -1.967414, 1, 1, 1, 1, 1,
-0.6584663, -0.4169092, -3.052727, 1, 1, 1, 1, 1,
-0.6576133, 0.4776449, -2.018789, 1, 1, 1, 1, 1,
-0.656231, 0.8092016, -0.6525648, 1, 1, 1, 1, 1,
-0.652619, 1.004488, 1.473142, 1, 1, 1, 1, 1,
-0.6499217, 0.9434236, -0.8107007, 1, 1, 1, 1, 1,
-0.645053, -1.44728, -4.110975, 1, 1, 1, 1, 1,
-0.638223, -0.5934559, -1.719401, 1, 1, 1, 1, 1,
-0.6373453, -0.5544145, -2.545011, 1, 1, 1, 1, 1,
-0.6356331, -0.5813184, -3.803687, 0, 0, 1, 1, 1,
-0.6345221, -0.6654685, -0.6958349, 1, 0, 0, 1, 1,
-0.6309363, 0.4258368, 0.684554, 1, 0, 0, 1, 1,
-0.6282595, -0.3258653, -1.490977, 1, 0, 0, 1, 1,
-0.6260911, -0.0583679, 0.6156013, 1, 0, 0, 1, 1,
-0.6194168, 0.08982211, -2.780315, 1, 0, 0, 1, 1,
-0.6185779, -0.7560184, -2.193056, 0, 0, 0, 1, 1,
-0.6184796, 1.974062, 0.9655107, 0, 0, 0, 1, 1,
-0.6165928, -0.03389515, -0.4299999, 0, 0, 0, 1, 1,
-0.6150041, 0.2253806, -1.400434, 0, 0, 0, 1, 1,
-0.6148949, 0.3187987, -0.7403273, 0, 0, 0, 1, 1,
-0.6121139, -0.9354417, -1.757626, 0, 0, 0, 1, 1,
-0.6066193, 1.124142, -0.7203901, 0, 0, 0, 1, 1,
-0.6037889, 1.820359, -0.5320818, 1, 1, 1, 1, 1,
-0.5943037, -0.379254, -0.9193019, 1, 1, 1, 1, 1,
-0.5941676, -1.205374, -2.580115, 1, 1, 1, 1, 1,
-0.5918916, 0.04724329, -3.185144, 1, 1, 1, 1, 1,
-0.5871223, 0.5533059, -1.069029, 1, 1, 1, 1, 1,
-0.585506, 0.7027566, -0.1430963, 1, 1, 1, 1, 1,
-0.5767822, 0.5653032, -1.402413, 1, 1, 1, 1, 1,
-0.5749286, 0.06621333, -3.060524, 1, 1, 1, 1, 1,
-0.5706096, 0.9141098, -0.386119, 1, 1, 1, 1, 1,
-0.5688404, 1.336362, -0.8170252, 1, 1, 1, 1, 1,
-0.5688147, 0.9556638, -1.457969, 1, 1, 1, 1, 1,
-0.5679991, -0.7223303, -1.240357, 1, 1, 1, 1, 1,
-0.5659175, 1.052929, 1.308702, 1, 1, 1, 1, 1,
-0.5651256, -0.06980405, -2.485493, 1, 1, 1, 1, 1,
-0.5639545, -0.9597824, -2.667534, 1, 1, 1, 1, 1,
-0.5621962, 0.5113549, -0.2847735, 0, 0, 1, 1, 1,
-0.5564355, -1.191122, -3.563153, 1, 0, 0, 1, 1,
-0.5539319, 0.3539762, -2.018072, 1, 0, 0, 1, 1,
-0.5528356, -0.3567433, -0.8907549, 1, 0, 0, 1, 1,
-0.5523796, 0.8563656, 0.5825003, 1, 0, 0, 1, 1,
-0.5501695, -0.7533659, 0.3599284, 1, 0, 0, 1, 1,
-0.5500157, 1.262669, 0.6634136, 0, 0, 0, 1, 1,
-0.5473471, 1.64721, -0.00320028, 0, 0, 0, 1, 1,
-0.5458017, -1.010116, -1.270974, 0, 0, 0, 1, 1,
-0.5412425, 0.2940753, -1.358577, 0, 0, 0, 1, 1,
-0.5381381, -0.007511689, 0.2537141, 0, 0, 0, 1, 1,
-0.5344524, 0.2135416, -1.190897, 0, 0, 0, 1, 1,
-0.533872, 0.5137788, -0.6596422, 0, 0, 0, 1, 1,
-0.5321556, 0.2897302, -0.9574103, 1, 1, 1, 1, 1,
-0.5238811, 0.3504106, -1.732626, 1, 1, 1, 1, 1,
-0.5191794, 0.368889, -0.602478, 1, 1, 1, 1, 1,
-0.5177979, 1.574959, 0.331124, 1, 1, 1, 1, 1,
-0.5167855, -0.5741364, -1.757888, 1, 1, 1, 1, 1,
-0.5127987, 0.2020232, -0.1963842, 1, 1, 1, 1, 1,
-0.5119606, 1.475896, 0.5725592, 1, 1, 1, 1, 1,
-0.5099346, -0.858132, -2.771984, 1, 1, 1, 1, 1,
-0.5046526, -0.1670572, -1.137925, 1, 1, 1, 1, 1,
-0.5038388, -0.2078217, -1.800167, 1, 1, 1, 1, 1,
-0.5026042, -0.3497586, -2.847687, 1, 1, 1, 1, 1,
-0.5007631, -0.352208, -5.543044, 1, 1, 1, 1, 1,
-0.4933618, -0.05708606, -0.6384899, 1, 1, 1, 1, 1,
-0.4856902, 0.5249306, -3.123068, 1, 1, 1, 1, 1,
-0.4833448, 1.427448, 0.9426581, 1, 1, 1, 1, 1,
-0.4711405, 2.185814, -0.6934863, 0, 0, 1, 1, 1,
-0.4666767, -0.590457, -2.34535, 1, 0, 0, 1, 1,
-0.4643579, -1.742127, -2.148366, 1, 0, 0, 1, 1,
-0.4635623, -1.297855, -1.868287, 1, 0, 0, 1, 1,
-0.4609182, 1.288139, 0.999562, 1, 0, 0, 1, 1,
-0.4599237, -1.561105, -3.309201, 1, 0, 0, 1, 1,
-0.4586267, 1.084398, -0.1002899, 0, 0, 0, 1, 1,
-0.4582061, 0.489726, -1.066681, 0, 0, 0, 1, 1,
-0.4563467, -0.5534005, -1.675632, 0, 0, 0, 1, 1,
-0.4563047, -0.05002671, -1.253448, 0, 0, 0, 1, 1,
-0.4448753, -0.4856141, -2.558246, 0, 0, 0, 1, 1,
-0.4425496, 0.9031001, -0.4228551, 0, 0, 0, 1, 1,
-0.4410644, 0.7108464, -0.8238266, 0, 0, 0, 1, 1,
-0.435566, -1.936305, -3.000724, 1, 1, 1, 1, 1,
-0.4285472, 0.3800484, -0.9998383, 1, 1, 1, 1, 1,
-0.4249049, -1.141161, -0.8476518, 1, 1, 1, 1, 1,
-0.4240979, -0.4549966, -2.248086, 1, 1, 1, 1, 1,
-0.4229403, -0.6989416, -2.463068, 1, 1, 1, 1, 1,
-0.4198549, -1.978893, -3.427738, 1, 1, 1, 1, 1,
-0.4166508, -0.1513789, -0.7168423, 1, 1, 1, 1, 1,
-0.4155393, 0.8240052, -1.447505, 1, 1, 1, 1, 1,
-0.4133004, -0.04673031, -1.699687, 1, 1, 1, 1, 1,
-0.4116001, -0.1765454, -3.109475, 1, 1, 1, 1, 1,
-0.4106999, 0.5124376, -0.3730444, 1, 1, 1, 1, 1,
-0.4103931, -0.01268443, -2.579994, 1, 1, 1, 1, 1,
-0.4091956, -1.001454, -1.977357, 1, 1, 1, 1, 1,
-0.40604, -0.7671734, -2.339877, 1, 1, 1, 1, 1,
-0.4041716, -1.479841, -3.480653, 1, 1, 1, 1, 1,
-0.4011822, 0.6118169, 0.5913293, 0, 0, 1, 1, 1,
-0.3912728, -1.385328, -2.204159, 1, 0, 0, 1, 1,
-0.3830155, -1.645251, -3.688045, 1, 0, 0, 1, 1,
-0.3761994, 0.7048182, -0.2467943, 1, 0, 0, 1, 1,
-0.3734559, -1.530978, -3.184002, 1, 0, 0, 1, 1,
-0.3706058, 0.2385898, 0.4408207, 1, 0, 0, 1, 1,
-0.367395, -0.8417704, -1.943154, 0, 0, 0, 1, 1,
-0.3669614, -0.2604036, -2.186191, 0, 0, 0, 1, 1,
-0.3659619, 1.793367, -0.6983221, 0, 0, 0, 1, 1,
-0.364966, -1.905976, -3.897725, 0, 0, 0, 1, 1,
-0.3638846, -0.9096237, -3.51428, 0, 0, 0, 1, 1,
-0.3621247, -0.4647562, -2.220773, 0, 0, 0, 1, 1,
-0.359621, 0.9915826, 0.1918941, 0, 0, 0, 1, 1,
-0.3573841, -1.954014, -3.079672, 1, 1, 1, 1, 1,
-0.3550605, 0.9954802, -0.8252793, 1, 1, 1, 1, 1,
-0.3540313, -0.8600863, -2.930693, 1, 1, 1, 1, 1,
-0.3494883, 0.6239139, 0.4977698, 1, 1, 1, 1, 1,
-0.3490595, 0.5893761, -0.1766662, 1, 1, 1, 1, 1,
-0.3470903, -1.246947, -2.468588, 1, 1, 1, 1, 1,
-0.3420139, 0.6092905, 0.8386667, 1, 1, 1, 1, 1,
-0.3365819, 0.3047494, -1.129175, 1, 1, 1, 1, 1,
-0.3298647, 1.128066, -0.3715202, 1, 1, 1, 1, 1,
-0.3261379, -0.5616955, -0.7283316, 1, 1, 1, 1, 1,
-0.3231218, -0.5234816, -3.107201, 1, 1, 1, 1, 1,
-0.3229381, -1.123932, -3.866392, 1, 1, 1, 1, 1,
-0.3223794, 1.225079, -0.4211607, 1, 1, 1, 1, 1,
-0.3216517, -0.4764927, -3.399687, 1, 1, 1, 1, 1,
-0.3132935, 1.795486, -0.2404259, 1, 1, 1, 1, 1,
-0.3132417, 0.4734431, 0.4000591, 0, 0, 1, 1, 1,
-0.3098087, -1.348908, -2.186146, 1, 0, 0, 1, 1,
-0.3097346, -2.024563, -2.435274, 1, 0, 0, 1, 1,
-0.3049781, -1.262982, -2.763297, 1, 0, 0, 1, 1,
-0.2931043, 0.8683036, 0.520165, 1, 0, 0, 1, 1,
-0.2922803, 0.09875713, -1.834126, 1, 0, 0, 1, 1,
-0.2900512, 0.6625238, -0.2348169, 0, 0, 0, 1, 1,
-0.2881558, -0.8300831, -2.294586, 0, 0, 0, 1, 1,
-0.2842785, -0.930957, -0.4744231, 0, 0, 0, 1, 1,
-0.2808915, 0.7139425, 1.407747, 0, 0, 0, 1, 1,
-0.2791073, 0.8214425, 0.897069, 0, 0, 0, 1, 1,
-0.2762117, -0.1351272, -1.918583, 0, 0, 0, 1, 1,
-0.2754446, 2.237892, 1.154986, 0, 0, 0, 1, 1,
-0.2747894, -1.274178, -4.942039, 1, 1, 1, 1, 1,
-0.2715614, -0.1560446, -0.571812, 1, 1, 1, 1, 1,
-0.2663618, -0.6929528, -3.489254, 1, 1, 1, 1, 1,
-0.2649682, -1.316449, -3.372712, 1, 1, 1, 1, 1,
-0.2620245, -1.090139, -4.259518, 1, 1, 1, 1, 1,
-0.2618864, 0.986594, 0.5733321, 1, 1, 1, 1, 1,
-0.2618353, 1.369674, 0.6052427, 1, 1, 1, 1, 1,
-0.2618018, 0.5942655, -0.8943614, 1, 1, 1, 1, 1,
-0.2554218, 1.125112, -0.1606648, 1, 1, 1, 1, 1,
-0.2538636, 0.1529575, -0.2554506, 1, 1, 1, 1, 1,
-0.2535351, 0.4716999, -1.094512, 1, 1, 1, 1, 1,
-0.2534833, 0.2077744, -1.130713, 1, 1, 1, 1, 1,
-0.2470618, -1.451202, -1.745806, 1, 1, 1, 1, 1,
-0.246895, 0.1865032, -0.9338562, 1, 1, 1, 1, 1,
-0.2419694, 0.6887828, -0.9907081, 1, 1, 1, 1, 1,
-0.236507, 0.8321608, -0.867456, 0, 0, 1, 1, 1,
-0.2306655, 1.282499, -1.386713, 1, 0, 0, 1, 1,
-0.2302497, 2.178217, 0.2069575, 1, 0, 0, 1, 1,
-0.2278335, -0.9401572, -3.459962, 1, 0, 0, 1, 1,
-0.2253789, 1.465237, -1.872267, 1, 0, 0, 1, 1,
-0.2241397, -0.05820923, -1.130062, 1, 0, 0, 1, 1,
-0.2180555, 1.389187, -0.6178952, 0, 0, 0, 1, 1,
-0.2103435, 1.892433, -0.07011528, 0, 0, 0, 1, 1,
-0.2050921, 1.735821, -1.872468, 0, 0, 0, 1, 1,
-0.2021953, 0.7037578, -1.177836, 0, 0, 0, 1, 1,
-0.201669, -0.3333479, -2.994973, 0, 0, 0, 1, 1,
-0.1995954, -0.5765537, -4.209303, 0, 0, 0, 1, 1,
-0.1987755, -0.4091731, -2.937353, 0, 0, 0, 1, 1,
-0.1963712, 0.529077, 1.706406, 1, 1, 1, 1, 1,
-0.1946548, -0.263209, -2.956646, 1, 1, 1, 1, 1,
-0.1924202, -0.5950091, -1.950422, 1, 1, 1, 1, 1,
-0.1906196, -0.4886049, -1.8701, 1, 1, 1, 1, 1,
-0.1897218, -1.793652, -4.355911, 1, 1, 1, 1, 1,
-0.1800725, 0.8810957, -0.4305362, 1, 1, 1, 1, 1,
-0.1773896, 1.760304, -0.2226553, 1, 1, 1, 1, 1,
-0.1724065, -0.04709366, -2.780774, 1, 1, 1, 1, 1,
-0.1615796, 1.476758, -0.8327068, 1, 1, 1, 1, 1,
-0.154717, 1.027562, 1.936589, 1, 1, 1, 1, 1,
-0.1528708, -0.9080143, -3.404051, 1, 1, 1, 1, 1,
-0.1480916, 1.269524, 0.4914949, 1, 1, 1, 1, 1,
-0.1479639, -0.8886471, -4.321959, 1, 1, 1, 1, 1,
-0.1462708, 2.043937, -2.074267, 1, 1, 1, 1, 1,
-0.1458252, -2.508301, -5.060116, 1, 1, 1, 1, 1,
-0.145121, -0.5730766, -2.149802, 0, 0, 1, 1, 1,
-0.1450304, -0.8946769, -2.99655, 1, 0, 0, 1, 1,
-0.1430215, -0.2328619, -3.402648, 1, 0, 0, 1, 1,
-0.1371393, 0.4168112, 0.7880443, 1, 0, 0, 1, 1,
-0.1334385, 0.7098696, 0.3992683, 1, 0, 0, 1, 1,
-0.132269, -0.5277495, -1.779378, 1, 0, 0, 1, 1,
-0.1312767, 0.545739, 0.4766372, 0, 0, 0, 1, 1,
-0.1304847, 0.795287, -0.1769557, 0, 0, 0, 1, 1,
-0.1284135, -0.2844846, -2.311932, 0, 0, 0, 1, 1,
-0.1274184, 1.675745, -0.4815027, 0, 0, 0, 1, 1,
-0.1266764, -1.396574, -2.843697, 0, 0, 0, 1, 1,
-0.1252306, -1.870564, -2.974505, 0, 0, 0, 1, 1,
-0.1242631, 0.6285699, 1.564299, 0, 0, 0, 1, 1,
-0.1223715, -1.227818, -3.363017, 1, 1, 1, 1, 1,
-0.1217773, -0.1971352, -2.374448, 1, 1, 1, 1, 1,
-0.1119609, 1.619178, -1.360694, 1, 1, 1, 1, 1,
-0.1111095, -0.3966315, -2.257528, 1, 1, 1, 1, 1,
-0.1054009, 0.9599189, -1.421717, 1, 1, 1, 1, 1,
-0.1019509, 1.040763, -1.224916, 1, 1, 1, 1, 1,
-0.09911921, -0.4047509, -3.552648, 1, 1, 1, 1, 1,
-0.0982941, 0.4667996, 0.2598494, 1, 1, 1, 1, 1,
-0.09579335, -0.4240862, -2.822209, 1, 1, 1, 1, 1,
-0.09507711, -0.8275127, -3.283445, 1, 1, 1, 1, 1,
-0.09241687, 0.7796582, -0.2175267, 1, 1, 1, 1, 1,
-0.09109485, -0.02510709, -3.3834, 1, 1, 1, 1, 1,
-0.09072647, 0.7080117, 0.6583987, 1, 1, 1, 1, 1,
-0.08879895, 0.2879795, -0.4375401, 1, 1, 1, 1, 1,
-0.0875825, -0.1285195, -3.4504, 1, 1, 1, 1, 1,
-0.08582641, -0.4210315, -3.181071, 0, 0, 1, 1, 1,
-0.08391805, 1.930056, -0.1348684, 1, 0, 0, 1, 1,
-0.07947061, -0.4857496, -4.323885, 1, 0, 0, 1, 1,
-0.07906105, 0.936044, -0.2188832, 1, 0, 0, 1, 1,
-0.07692253, -0.4634484, -2.427806, 1, 0, 0, 1, 1,
-0.07663541, -0.3615365, -1.232176, 1, 0, 0, 1, 1,
-0.07374316, 1.818844, -0.2108299, 0, 0, 0, 1, 1,
-0.06994908, 0.4451553, -0.2182921, 0, 0, 0, 1, 1,
-0.064462, -0.6731929, -4.112065, 0, 0, 0, 1, 1,
-0.06444449, 0.9175412, -1.168044, 0, 0, 0, 1, 1,
-0.06282297, 1.197341, -0.5459732, 0, 0, 0, 1, 1,
-0.0618584, -0.2647647, -2.85886, 0, 0, 0, 1, 1,
-0.06120576, 1.201298, -0.2928338, 0, 0, 0, 1, 1,
-0.06072967, -0.4757294, -1.662346, 1, 1, 1, 1, 1,
-0.05986005, -1.004849, -2.52167, 1, 1, 1, 1, 1,
-0.05807869, -1.146114, -2.538961, 1, 1, 1, 1, 1,
-0.05311525, 1.467271, 0.01495477, 1, 1, 1, 1, 1,
-0.04958874, 0.06234737, -1.258404, 1, 1, 1, 1, 1,
-0.04815461, -0.2182242, -3.050841, 1, 1, 1, 1, 1,
-0.04612347, 1.256113, 0.0610019, 1, 1, 1, 1, 1,
-0.04411765, -0.8283174, -2.040971, 1, 1, 1, 1, 1,
-0.04271371, -0.8856848, -3.278508, 1, 1, 1, 1, 1,
-0.03721653, 0.7594589, 0.8292192, 1, 1, 1, 1, 1,
-0.03536619, -0.4776229, -2.149613, 1, 1, 1, 1, 1,
-0.03286179, -1.485794, -4.21358, 1, 1, 1, 1, 1,
-0.03225604, 0.2449484, 0.3349116, 1, 1, 1, 1, 1,
-0.02836478, 0.5716363, 0.9392692, 1, 1, 1, 1, 1,
-0.02173785, -0.3463849, -1.367066, 1, 1, 1, 1, 1,
-0.02142399, 0.4427404, -1.013173, 0, 0, 1, 1, 1,
-0.01793468, 1.566533, -0.02989908, 1, 0, 0, 1, 1,
-0.01735749, -0.8476278, -1.161849, 1, 0, 0, 1, 1,
-0.01577135, 0.1933637, -0.4448845, 1, 0, 0, 1, 1,
-0.01217273, -0.8741821, -2.968635, 1, 0, 0, 1, 1,
-0.009598583, -1.13411, -2.184322, 1, 0, 0, 1, 1,
-0.005899923, -0.4340334, -6.320914, 0, 0, 0, 1, 1,
-0.002719475, 0.3710909, 0.8195163, 0, 0, 0, 1, 1,
-0.0007989743, 0.790025, 0.7583219, 0, 0, 0, 1, 1,
0.001097803, 0.05262642, 1.139342, 0, 0, 0, 1, 1,
0.001924946, -1.341883, 3.526412, 0, 0, 0, 1, 1,
0.001986587, 1.871892, -1.057266, 0, 0, 0, 1, 1,
0.004503357, -1.962755, 3.238798, 0, 0, 0, 1, 1,
0.007182992, -0.4205575, 4.461481, 1, 1, 1, 1, 1,
0.007312614, -1.835226, 4.708702, 1, 1, 1, 1, 1,
0.01003697, -0.5712984, 4.665367, 1, 1, 1, 1, 1,
0.01031304, -1.057018, 2.655328, 1, 1, 1, 1, 1,
0.01373625, 1.162729, 0.1778334, 1, 1, 1, 1, 1,
0.01722002, -0.05899359, 3.214308, 1, 1, 1, 1, 1,
0.0179759, 1.144387, -0.06505864, 1, 1, 1, 1, 1,
0.02150784, 0.9760479, -1.139979, 1, 1, 1, 1, 1,
0.02244471, -0.9914214, 3.54817, 1, 1, 1, 1, 1,
0.02366544, 0.8170487, 1.360512, 1, 1, 1, 1, 1,
0.0275641, -0.2980798, 5.129244, 1, 1, 1, 1, 1,
0.02761257, 0.02802108, 1.000012, 1, 1, 1, 1, 1,
0.02819988, -0.1087512, 3.69023, 1, 1, 1, 1, 1,
0.03047055, -0.7900601, 2.716727, 1, 1, 1, 1, 1,
0.03381341, 1.838984, 1.332731, 1, 1, 1, 1, 1,
0.03422124, 0.6377852, -0.2999659, 0, 0, 1, 1, 1,
0.03435749, -0.8164836, 2.909383, 1, 0, 0, 1, 1,
0.03747227, 0.02667234, 1.47621, 1, 0, 0, 1, 1,
0.04385728, -0.7346218, 2.172786, 1, 0, 0, 1, 1,
0.04406744, 0.9132791, 1.987005, 1, 0, 0, 1, 1,
0.05134233, -2.038398, 2.797223, 1, 0, 0, 1, 1,
0.05152394, 0.5550906, -0.6839787, 0, 0, 0, 1, 1,
0.05385043, -0.04319792, 2.779735, 0, 0, 0, 1, 1,
0.05508621, -0.3185421, 2.202416, 0, 0, 0, 1, 1,
0.05983284, 1.450778, 0.5980465, 0, 0, 0, 1, 1,
0.06025502, 0.4585394, 0.3539995, 0, 0, 0, 1, 1,
0.06100318, 0.07108309, 1.064357, 0, 0, 0, 1, 1,
0.06442522, 0.1996239, 1.201627, 0, 0, 0, 1, 1,
0.06703422, -0.6734739, 3.176921, 1, 1, 1, 1, 1,
0.07007864, 0.3205034, 1.650539, 1, 1, 1, 1, 1,
0.07177905, -1.552929, 3.310971, 1, 1, 1, 1, 1,
0.0766619, 2.001489, -1.027293, 1, 1, 1, 1, 1,
0.07668141, -0.7680433, 3.92857, 1, 1, 1, 1, 1,
0.08017513, -0.750464, 3.061405, 1, 1, 1, 1, 1,
0.08503824, -0.1790896, 2.221149, 1, 1, 1, 1, 1,
0.08601868, -3.094234, 2.583545, 1, 1, 1, 1, 1,
0.09038986, -1.151108, 0.9893144, 1, 1, 1, 1, 1,
0.09605268, -0.6606452, 1.989635, 1, 1, 1, 1, 1,
0.1005425, 0.3262522, 0.4526354, 1, 1, 1, 1, 1,
0.1061431, 0.6515274, 0.9026862, 1, 1, 1, 1, 1,
0.1122736, 0.006935799, 0.8387348, 1, 1, 1, 1, 1,
0.112766, 1.935953, -0.9091009, 1, 1, 1, 1, 1,
0.11371, 0.02730375, 2.957954, 1, 1, 1, 1, 1,
0.1165081, 1.170126, -0.09648636, 0, 0, 1, 1, 1,
0.1262371, 1.250163, -0.4345592, 1, 0, 0, 1, 1,
0.1276869, -1.893526, 2.307813, 1, 0, 0, 1, 1,
0.1287904, -2.520733, 2.66769, 1, 0, 0, 1, 1,
0.1299091, 0.6891939, 0.9267451, 1, 0, 0, 1, 1,
0.1357943, -0.1421833, 1.146695, 1, 0, 0, 1, 1,
0.1394138, 0.4388421, 0.5642197, 0, 0, 0, 1, 1,
0.1402538, -1.404818, 2.799557, 0, 0, 0, 1, 1,
0.1419678, -0.2191131, 2.059343, 0, 0, 0, 1, 1,
0.1425513, -0.5461735, 3.95136, 0, 0, 0, 1, 1,
0.1425767, -1.51166, 3.320133, 0, 0, 0, 1, 1,
0.1439315, -0.01817983, 2.491641, 0, 0, 0, 1, 1,
0.1445838, 0.01524914, 0.9710352, 0, 0, 0, 1, 1,
0.1485042, -2.200409, 1.844255, 1, 1, 1, 1, 1,
0.1499524, 0.3757441, -0.5022093, 1, 1, 1, 1, 1,
0.1500902, -1.716899, 4.619311, 1, 1, 1, 1, 1,
0.1533573, 0.8823315, -0.5413585, 1, 1, 1, 1, 1,
0.1542765, 0.2167722, 1.275321, 1, 1, 1, 1, 1,
0.1558561, -0.7486172, 3.432424, 1, 1, 1, 1, 1,
0.1615268, 0.7265093, 0.8382097, 1, 1, 1, 1, 1,
0.1667037, -1.627802, 3.202461, 1, 1, 1, 1, 1,
0.1681427, 2.269745, -0.2636839, 1, 1, 1, 1, 1,
0.1742966, 0.5801005, 0.3206695, 1, 1, 1, 1, 1,
0.1753526, 1.293331, 0.5424356, 1, 1, 1, 1, 1,
0.1773113, 0.1719803, 0.1524628, 1, 1, 1, 1, 1,
0.1820734, 0.5883268, -0.4334531, 1, 1, 1, 1, 1,
0.1823624, -1.313927, 1.581112, 1, 1, 1, 1, 1,
0.1825122, 0.6373012, 1.412147, 1, 1, 1, 1, 1,
0.1832971, 1.438924, -0.2760636, 0, 0, 1, 1, 1,
0.1846224, -0.5314673, 2.899937, 1, 0, 0, 1, 1,
0.1878697, 1.071511, 2.002074, 1, 0, 0, 1, 1,
0.1913416, 2.066981, 1.217669, 1, 0, 0, 1, 1,
0.1924641, -0.8681947, 2.708207, 1, 0, 0, 1, 1,
0.1980912, -0.4735334, 2.182993, 1, 0, 0, 1, 1,
0.2003434, 0.8903989, 0.5547743, 0, 0, 0, 1, 1,
0.2045621, -0.8557572, 5.598783, 0, 0, 0, 1, 1,
0.2122117, 0.4813322, -0.004043816, 0, 0, 0, 1, 1,
0.2139529, -0.1270663, 2.29267, 0, 0, 0, 1, 1,
0.2158643, 0.04929789, 1.664091, 0, 0, 0, 1, 1,
0.2185166, 1.203217, 0.485462, 0, 0, 0, 1, 1,
0.2212599, 0.2685975, -0.007263953, 0, 0, 0, 1, 1,
0.2331871, -1.418108, 2.766033, 1, 1, 1, 1, 1,
0.2358294, 1.095191, -0.6332803, 1, 1, 1, 1, 1,
0.2370179, 1.580395, 1.478278, 1, 1, 1, 1, 1,
0.2377144, 0.4002247, 1.578215, 1, 1, 1, 1, 1,
0.2416063, 1.467014, 0.4013993, 1, 1, 1, 1, 1,
0.2462971, 1.225472, 1.609499, 1, 1, 1, 1, 1,
0.2480437, 0.5099065, 0.08400338, 1, 1, 1, 1, 1,
0.2549124, -0.1477032, 2.664926, 1, 1, 1, 1, 1,
0.2568592, -0.4860805, 1.918874, 1, 1, 1, 1, 1,
0.2573544, 0.1368524, 1.249373, 1, 1, 1, 1, 1,
0.2584386, -1.035584, 1.180672, 1, 1, 1, 1, 1,
0.25999, -0.5005531, 0.9028862, 1, 1, 1, 1, 1,
0.2620794, -2.39669, 1.857365, 1, 1, 1, 1, 1,
0.2631517, -0.0450783, 1.734899, 1, 1, 1, 1, 1,
0.2671144, 1.018607, 0.7683967, 1, 1, 1, 1, 1,
0.2672922, -1.620641, 3.086297, 0, 0, 1, 1, 1,
0.2678409, -0.2581802, 2.36824, 1, 0, 0, 1, 1,
0.2685921, 0.3308091, 1.908782, 1, 0, 0, 1, 1,
0.2715679, -0.7842959, 2.416532, 1, 0, 0, 1, 1,
0.2727987, 0.3961429, -0.1889979, 1, 0, 0, 1, 1,
0.2747591, -0.1467135, 0.677698, 1, 0, 0, 1, 1,
0.2757575, 1.148697, 1.808037, 0, 0, 0, 1, 1,
0.2762498, 0.2180987, -0.448071, 0, 0, 0, 1, 1,
0.2775456, 1.730086, -1.273282, 0, 0, 0, 1, 1,
0.2790573, 0.8241024, 1.350754, 0, 0, 0, 1, 1,
0.2793167, 0.1689312, 0.596619, 0, 0, 0, 1, 1,
0.2793874, -0.01568036, 0.5959503, 0, 0, 0, 1, 1,
0.2814614, 1.069467, -0.7829368, 0, 0, 0, 1, 1,
0.2818223, -0.6104015, 1.299296, 1, 1, 1, 1, 1,
0.2820455, -1.099233, -0.2027341, 1, 1, 1, 1, 1,
0.287745, 0.0897166, 1.03469, 1, 1, 1, 1, 1,
0.2893552, 0.2323305, 2.293838, 1, 1, 1, 1, 1,
0.2923359, 0.9441466, -0.1364942, 1, 1, 1, 1, 1,
0.2967404, 0.9679673, 0.0560527, 1, 1, 1, 1, 1,
0.2998763, -0.1114524, 1.473806, 1, 1, 1, 1, 1,
0.3013835, 0.4310108, 0.2751214, 1, 1, 1, 1, 1,
0.3029212, 1.712043, -0.08011144, 1, 1, 1, 1, 1,
0.3054476, -1.429772, 2.44105, 1, 1, 1, 1, 1,
0.3103149, -0.9776461, 1.744412, 1, 1, 1, 1, 1,
0.3104738, -1.667025, 2.053082, 1, 1, 1, 1, 1,
0.3147761, -0.4801596, 2.510092, 1, 1, 1, 1, 1,
0.3154827, 0.3242914, 1.238394, 1, 1, 1, 1, 1,
0.3160985, -0.08164375, 1.802669, 1, 1, 1, 1, 1,
0.3191436, 0.2815131, -0.1764647, 0, 0, 1, 1, 1,
0.3242511, -1.887223, 3.488786, 1, 0, 0, 1, 1,
0.3260795, 1.355735, 1.590147, 1, 0, 0, 1, 1,
0.3289817, 1.904783, 0.9507133, 1, 0, 0, 1, 1,
0.3314639, -0.2830208, 2.811179, 1, 0, 0, 1, 1,
0.3343495, -0.435306, 1.614283, 1, 0, 0, 1, 1,
0.3350688, 0.04020178, 1.878909, 0, 0, 0, 1, 1,
0.3385806, 0.04866139, -0.08321096, 0, 0, 0, 1, 1,
0.3480634, 0.0486173, 1.522032, 0, 0, 0, 1, 1,
0.3565509, -0.5791465, 4.362634, 0, 0, 0, 1, 1,
0.3569174, -1.466873, 4.60527, 0, 0, 0, 1, 1,
0.3569903, -1.221388, 4.091568, 0, 0, 0, 1, 1,
0.3604208, -1.039384, 3.101276, 0, 0, 0, 1, 1,
0.3607157, 1.396611, 0.275146, 1, 1, 1, 1, 1,
0.3654552, -1.147091, 2.678297, 1, 1, 1, 1, 1,
0.3659075, 0.819734, 0.7982569, 1, 1, 1, 1, 1,
0.366589, -0.1916261, 3.643814, 1, 1, 1, 1, 1,
0.3693008, -0.08025547, 2.666, 1, 1, 1, 1, 1,
0.3728569, -1.912823, 2.504345, 1, 1, 1, 1, 1,
0.3735946, -1.247365, 2.692844, 1, 1, 1, 1, 1,
0.373783, -1.001055, 2.971639, 1, 1, 1, 1, 1,
0.3738857, 0.7535471, 0.1466032, 1, 1, 1, 1, 1,
0.3796138, 0.4487041, 1.780214, 1, 1, 1, 1, 1,
0.3837975, 0.7807813, 1.469329, 1, 1, 1, 1, 1,
0.3862662, 0.5949541, 1.397433, 1, 1, 1, 1, 1,
0.3873654, 0.587878, 0.1660976, 1, 1, 1, 1, 1,
0.3921293, -1.15947, 3.834324, 1, 1, 1, 1, 1,
0.3926703, -0.861543, 2.453539, 1, 1, 1, 1, 1,
0.3981206, 0.9371183, 1.423333, 0, 0, 1, 1, 1,
0.4010319, 0.146972, 2.033524, 1, 0, 0, 1, 1,
0.4011641, 2.080929, -0.8306509, 1, 0, 0, 1, 1,
0.4034044, 0.8402929, -1.538632, 1, 0, 0, 1, 1,
0.4053426, 0.5407561, -0.03212956, 1, 0, 0, 1, 1,
0.4085405, 0.2224123, 2.035787, 1, 0, 0, 1, 1,
0.4099696, 0.4441905, 1.330258, 0, 0, 0, 1, 1,
0.4123195, -0.4502478, 3.466765, 0, 0, 0, 1, 1,
0.4154596, 0.8448222, 0.7345256, 0, 0, 0, 1, 1,
0.4160948, -0.2888412, 2.392849, 0, 0, 0, 1, 1,
0.4162338, 2.371624, 0.6243327, 0, 0, 0, 1, 1,
0.416887, -0.6205142, 2.585195, 0, 0, 0, 1, 1,
0.4180681, 0.9857123, 0.1162755, 0, 0, 0, 1, 1,
0.4188747, 0.295821, 0.393763, 1, 1, 1, 1, 1,
0.4249493, 0.2742185, 0.6429826, 1, 1, 1, 1, 1,
0.426017, 0.1593032, 0.7974585, 1, 1, 1, 1, 1,
0.4278102, -1.020508, 3.062691, 1, 1, 1, 1, 1,
0.4301226, 0.3562732, 0.7963273, 1, 1, 1, 1, 1,
0.4327405, -1.849172, 2.31414, 1, 1, 1, 1, 1,
0.4396167, -0.002947782, 2.176548, 1, 1, 1, 1, 1,
0.44163, -1.893868, 2.468799, 1, 1, 1, 1, 1,
0.4422368, 0.8225293, 0.6871756, 1, 1, 1, 1, 1,
0.4422447, 0.08453301, 1.615669, 1, 1, 1, 1, 1,
0.4476389, -0.4898004, 1.747252, 1, 1, 1, 1, 1,
0.4478624, 1.077443, 0.1613777, 1, 1, 1, 1, 1,
0.448976, 0.3238805, 2.550271, 1, 1, 1, 1, 1,
0.4586163, -2.630117, 3.389447, 1, 1, 1, 1, 1,
0.4586695, -0.4925318, 2.075025, 1, 1, 1, 1, 1,
0.4594601, -0.8485175, 2.603291, 0, 0, 1, 1, 1,
0.4625422, -0.4267004, -0.4195275, 1, 0, 0, 1, 1,
0.4647042, -1.662594, 3.802793, 1, 0, 0, 1, 1,
0.4664768, 0.9754024, 3.151067, 1, 0, 0, 1, 1,
0.4698149, 0.6624321, -0.08451413, 1, 0, 0, 1, 1,
0.4723208, -0.2157003, 1.810372, 1, 0, 0, 1, 1,
0.4734716, 0.7680073, 0.8870392, 0, 0, 0, 1, 1,
0.4746429, -1.28101, 2.932935, 0, 0, 0, 1, 1,
0.4748842, 0.04950299, 0.8670522, 0, 0, 0, 1, 1,
0.4769061, 1.072483, 1.409088, 0, 0, 0, 1, 1,
0.4806928, 0.3283615, 1.489482, 0, 0, 0, 1, 1,
0.4831867, 0.04409896, 1.542293, 0, 0, 0, 1, 1,
0.4849983, -0.5128506, 2.594057, 0, 0, 0, 1, 1,
0.4872793, 0.4624677, 1.378276, 1, 1, 1, 1, 1,
0.4954113, 0.1842437, 1.561669, 1, 1, 1, 1, 1,
0.496422, -0.1232913, 3.447915, 1, 1, 1, 1, 1,
0.4978856, 1.235276, -0.1660968, 1, 1, 1, 1, 1,
0.4997241, -1.799119, 1.496668, 1, 1, 1, 1, 1,
0.4998002, -0.1674558, 1.720525, 1, 1, 1, 1, 1,
0.5019775, 0.8396319, 0.6148041, 1, 1, 1, 1, 1,
0.5030951, -1.775133, 2.370364, 1, 1, 1, 1, 1,
0.5072805, -1.004581, 2.94602, 1, 1, 1, 1, 1,
0.5147058, -0.4735121, 2.997162, 1, 1, 1, 1, 1,
0.5181475, 1.583601, 0.1957244, 1, 1, 1, 1, 1,
0.5189419, 0.1747447, 2.767609, 1, 1, 1, 1, 1,
0.5197904, -0.3946649, 2.338935, 1, 1, 1, 1, 1,
0.5223909, -0.6328772, 1.702083, 1, 1, 1, 1, 1,
0.526347, 1.015427, 0.2966514, 1, 1, 1, 1, 1,
0.5264354, -1.65436, 4.513315, 0, 0, 1, 1, 1,
0.5290542, -1.06643, 1.678066, 1, 0, 0, 1, 1,
0.5311045, 0.8279472, 0.9687865, 1, 0, 0, 1, 1,
0.531633, -1.180473, 4.338946, 1, 0, 0, 1, 1,
0.5342518, -0.314731, 2.253215, 1, 0, 0, 1, 1,
0.5379172, -0.9380746, 1.314957, 1, 0, 0, 1, 1,
0.5462332, 0.2284449, 0.2677909, 0, 0, 0, 1, 1,
0.5530348, 0.5499306, 0.8539597, 0, 0, 0, 1, 1,
0.5536976, 1.271512, -0.8397718, 0, 0, 0, 1, 1,
0.5543758, 0.01010473, 0.5823289, 0, 0, 0, 1, 1,
0.555795, -1.330873, 1.842502, 0, 0, 0, 1, 1,
0.5590589, 1.247123, -0.3240187, 0, 0, 0, 1, 1,
0.5596381, -1.796418, 2.771323, 0, 0, 0, 1, 1,
0.5624865, 1.809954, 0.06666066, 1, 1, 1, 1, 1,
0.5646629, 1.253256, -1.212039, 1, 1, 1, 1, 1,
0.572734, 1.21067, 0.3869915, 1, 1, 1, 1, 1,
0.5747881, -1.152846, 3.261932, 1, 1, 1, 1, 1,
0.5783379, -0.900561, 3.462, 1, 1, 1, 1, 1,
0.5784189, 0.8872577, 1.610143, 1, 1, 1, 1, 1,
0.5858663, 0.5578922, 0.3161091, 1, 1, 1, 1, 1,
0.5865642, 1.414725, 1.079693, 1, 1, 1, 1, 1,
0.5927063, 0.09208794, 0.8282164, 1, 1, 1, 1, 1,
0.5927236, -0.7325794, 1.943488, 1, 1, 1, 1, 1,
0.5931433, -0.2958398, 2.648398, 1, 1, 1, 1, 1,
0.5992693, -0.5871275, 1.211085, 1, 1, 1, 1, 1,
0.6061439, -0.9074342, 2.838228, 1, 1, 1, 1, 1,
0.6081107, 0.4793105, 0.6720581, 1, 1, 1, 1, 1,
0.6091948, -0.4870903, 0.1454978, 1, 1, 1, 1, 1,
0.6108382, 0.08183994, 1.272531, 0, 0, 1, 1, 1,
0.6110474, -0.4017718, 2.434953, 1, 0, 0, 1, 1,
0.617531, -0.7091928, -0.581875, 1, 0, 0, 1, 1,
0.6215422, 1.031776, 0.4713873, 1, 0, 0, 1, 1,
0.6216967, -0.6219167, 2.971782, 1, 0, 0, 1, 1,
0.6224406, -1.577942, 2.8602, 1, 0, 0, 1, 1,
0.6245674, 0.2024227, 0.7906013, 0, 0, 0, 1, 1,
0.6252545, 1.05558, 1.014305, 0, 0, 0, 1, 1,
0.6252815, -1.985628, 2.710829, 0, 0, 0, 1, 1,
0.625981, 0.4921055, 2.444985, 0, 0, 0, 1, 1,
0.6281499, -0.7316762, 4.002831, 0, 0, 0, 1, 1,
0.6352228, -0.8830059, 2.902397, 0, 0, 0, 1, 1,
0.6381091, 1.183854, -0.2461048, 0, 0, 0, 1, 1,
0.6382293, 0.2878679, 0.1946192, 1, 1, 1, 1, 1,
0.6410599, 0.6678857, -0.1121797, 1, 1, 1, 1, 1,
0.644321, 0.5562043, 0.1549184, 1, 1, 1, 1, 1,
0.6461072, -0.7776012, 2.133618, 1, 1, 1, 1, 1,
0.6469932, -1.300364, 3.682792, 1, 1, 1, 1, 1,
0.6507002, 0.6724534, 1.431579, 1, 1, 1, 1, 1,
0.6509852, -1.462809, 3.630273, 1, 1, 1, 1, 1,
0.6513364, 0.730112, -0.4357694, 1, 1, 1, 1, 1,
0.6514559, -0.9018753, 4.46978, 1, 1, 1, 1, 1,
0.6522754, -0.7029337, 1.203296, 1, 1, 1, 1, 1,
0.6523516, 1.409812, -0.1961755, 1, 1, 1, 1, 1,
0.6533879, -0.938975, 3.467845, 1, 1, 1, 1, 1,
0.6534484, 1.919784, 1.102262, 1, 1, 1, 1, 1,
0.6543739, -0.3879795, 1.076441, 1, 1, 1, 1, 1,
0.6558013, -2.569269, 3.143987, 1, 1, 1, 1, 1,
0.6666842, -0.6697453, 3.124159, 0, 0, 1, 1, 1,
0.6691653, 2.013312, -1.761262, 1, 0, 0, 1, 1,
0.6697748, 0.5571852, -0.13881, 1, 0, 0, 1, 1,
0.6708019, -0.2914275, 2.069852, 1, 0, 0, 1, 1,
0.6727447, -0.4151219, 2.308367, 1, 0, 0, 1, 1,
0.6763229, 0.2306837, 0.6841249, 1, 0, 0, 1, 1,
0.6793102, -0.7312009, 3.63338, 0, 0, 0, 1, 1,
0.6797087, -0.09623937, 1.228454, 0, 0, 0, 1, 1,
0.680196, 0.7036436, 1.573751, 0, 0, 0, 1, 1,
0.6822925, -0.0003416272, 0.485291, 0, 0, 0, 1, 1,
0.683656, 1.67784, -0.3338189, 0, 0, 0, 1, 1,
0.6845537, -0.04385451, 2.841237, 0, 0, 0, 1, 1,
0.6848816, -0.09976244, 1.153738, 0, 0, 0, 1, 1,
0.6942553, -1.805431, 2.946712, 1, 1, 1, 1, 1,
0.7011331, 0.5485492, 1.023197, 1, 1, 1, 1, 1,
0.7060618, -1.739181, 2.851752, 1, 1, 1, 1, 1,
0.7068433, -1.166438, 2.909927, 1, 1, 1, 1, 1,
0.7101713, 0.7582467, 1.970931, 1, 1, 1, 1, 1,
0.714173, -1.224014, 3.646214, 1, 1, 1, 1, 1,
0.7175143, -1.621054, 3.34631, 1, 1, 1, 1, 1,
0.7188568, 2.055026, 0.5471947, 1, 1, 1, 1, 1,
0.7191965, -0.2586011, 1.343745, 1, 1, 1, 1, 1,
0.7251375, 0.860339, -0.4308378, 1, 1, 1, 1, 1,
0.7257305, -0.4063113, 3.687076, 1, 1, 1, 1, 1,
0.7260043, 1.412186, 0.1948116, 1, 1, 1, 1, 1,
0.7404526, 0.4203206, 0.3635733, 1, 1, 1, 1, 1,
0.7408939, 1.494321, 0.193267, 1, 1, 1, 1, 1,
0.7430981, 1.983464, 1.466422, 1, 1, 1, 1, 1,
0.7431263, -0.343661, 1.082734, 0, 0, 1, 1, 1,
0.7493274, -0.6423638, 0.63806, 1, 0, 0, 1, 1,
0.7526056, -0.4232897, 2.940646, 1, 0, 0, 1, 1,
0.7552602, -0.8322828, 3.553414, 1, 0, 0, 1, 1,
0.7596163, -0.2158359, 2.039612, 1, 0, 0, 1, 1,
0.7610458, -0.5789563, 1.698319, 1, 0, 0, 1, 1,
0.7626659, -0.5210134, 2.744151, 0, 0, 0, 1, 1,
0.7669551, -0.8542903, 1.823375, 0, 0, 0, 1, 1,
0.7679094, -1.097087, 2.202392, 0, 0, 0, 1, 1,
0.7844679, 0.7919325, 0.5229636, 0, 0, 0, 1, 1,
0.7876314, -0.3607951, 3.316372, 0, 0, 0, 1, 1,
0.7906025, -0.08811826, 1.496401, 0, 0, 0, 1, 1,
0.7929956, 0.1403846, 1.171696, 0, 0, 0, 1, 1,
0.795326, -0.9053861, 3.231013, 1, 1, 1, 1, 1,
0.7986678, 0.1973304, 2.612198, 1, 1, 1, 1, 1,
0.8082323, 0.6743691, -0.6847469, 1, 1, 1, 1, 1,
0.810097, -0.1938272, 0.1370361, 1, 1, 1, 1, 1,
0.8132804, -0.01957829, 1.043773, 1, 1, 1, 1, 1,
0.8135562, 1.365942, -0.3082313, 1, 1, 1, 1, 1,
0.81557, -0.2198082, 2.65731, 1, 1, 1, 1, 1,
0.8192297, 0.03896842, 2.184305, 1, 1, 1, 1, 1,
0.8283904, 1.453961, 0.09655992, 1, 1, 1, 1, 1,
0.8316237, 2.505946, -0.450812, 1, 1, 1, 1, 1,
0.8334551, -2.103456, 2.966819, 1, 1, 1, 1, 1,
0.8443608, -1.910853, 1.928107, 1, 1, 1, 1, 1,
0.8498877, -2.179261, 1.16552, 1, 1, 1, 1, 1,
0.8525947, -0.2001398, 3.132593, 1, 1, 1, 1, 1,
0.854933, -1.401217, 2.492598, 1, 1, 1, 1, 1,
0.8592278, -1.129749, 4.351175, 0, 0, 1, 1, 1,
0.8604258, 0.6419711, -0.2514934, 1, 0, 0, 1, 1,
0.8619849, 0.4513128, 1.25554, 1, 0, 0, 1, 1,
0.8659803, -0.4581724, 1.378954, 1, 0, 0, 1, 1,
0.866176, -1.772384, 1.216538, 1, 0, 0, 1, 1,
0.8667843, -0.8393397, 2.581476, 1, 0, 0, 1, 1,
0.870929, -0.7924713, 0.6887207, 0, 0, 0, 1, 1,
0.8724609, 0.4995846, 1.793723, 0, 0, 0, 1, 1,
0.8796347, 0.8923599, 1.110087, 0, 0, 0, 1, 1,
0.8796751, -1.222932, 3.258599, 0, 0, 0, 1, 1,
0.8819104, -0.1404766, 3.284255, 0, 0, 0, 1, 1,
0.883258, -1.070171, 3.88791, 0, 0, 0, 1, 1,
0.8836306, -1.436779, 1.906811, 0, 0, 0, 1, 1,
0.8937699, -0.3290116, 1.971999, 1, 1, 1, 1, 1,
0.893993, -0.1025323, 2.438354, 1, 1, 1, 1, 1,
0.908804, -1.586329, 3.411036, 1, 1, 1, 1, 1,
0.9122346, -0.6772364, 3.030464, 1, 1, 1, 1, 1,
0.9140087, 0.9381397, 1.609691, 1, 1, 1, 1, 1,
0.9155069, 0.3890258, 2.195838, 1, 1, 1, 1, 1,
0.9199617, -0.7433856, 0.5064802, 1, 1, 1, 1, 1,
0.9250483, 1.584626, 1.485811, 1, 1, 1, 1, 1,
0.9250506, -1.071314, 1.823775, 1, 1, 1, 1, 1,
0.9383933, 1.941136, 0.3774094, 1, 1, 1, 1, 1,
0.9432324, 0.1267948, 1.069124, 1, 1, 1, 1, 1,
0.9446981, -0.5374162, 0.03359859, 1, 1, 1, 1, 1,
0.9452491, -0.6545072, 2.920816, 1, 1, 1, 1, 1,
0.9473156, -0.5864373, 1.111935, 1, 1, 1, 1, 1,
0.9475347, -0.3200896, 3.07293, 1, 1, 1, 1, 1,
0.9520513, 0.1623008, 0.9389502, 0, 0, 1, 1, 1,
0.9694365, 0.3607725, 3.275846, 1, 0, 0, 1, 1,
0.9713234, -1.592224, 0.8398104, 1, 0, 0, 1, 1,
0.9811122, 0.3710466, 1.228233, 1, 0, 0, 1, 1,
0.9831666, 1.037368, 1.579194, 1, 0, 0, 1, 1,
0.9920828, 1.590685, 0.2925226, 1, 0, 0, 1, 1,
1.00465, -0.5413894, 1.007991, 0, 0, 0, 1, 1,
1.010867, 1.051505, 2.027189, 0, 0, 0, 1, 1,
1.011894, -1.765919, 1.906824, 0, 0, 0, 1, 1,
1.019743, 0.5214931, 1.994237, 0, 0, 0, 1, 1,
1.021822, -0.5198973, 1.669135, 0, 0, 0, 1, 1,
1.030752, 0.4142441, 1.553383, 0, 0, 0, 1, 1,
1.046069, 1.171181, 0.04979657, 0, 0, 0, 1, 1,
1.049773, 0.4982206, 1.09794, 1, 1, 1, 1, 1,
1.049777, 0.8518092, 1.221164, 1, 1, 1, 1, 1,
1.055992, 0.7484435, -0.6075692, 1, 1, 1, 1, 1,
1.056529, 0.1923042, 0.5835226, 1, 1, 1, 1, 1,
1.063224, -0.02401159, 2.762483, 1, 1, 1, 1, 1,
1.064071, -1.18425, 1.680359, 1, 1, 1, 1, 1,
1.06738, 0.654013, 0.3423766, 1, 1, 1, 1, 1,
1.068131, -1.781084, 1.699901, 1, 1, 1, 1, 1,
1.075905, 0.4310066, 0.3188072, 1, 1, 1, 1, 1,
1.077012, -0.531728, 1.455083, 1, 1, 1, 1, 1,
1.085256, -1.874064, 2.622579, 1, 1, 1, 1, 1,
1.087049, -0.4589808, 2.107453, 1, 1, 1, 1, 1,
1.087504, -0.7439757, 4.390105, 1, 1, 1, 1, 1,
1.091459, -0.3579814, 1.470591, 1, 1, 1, 1, 1,
1.093385, -2.247242, 2.295118, 1, 1, 1, 1, 1,
1.101166, -1.259323, -0.130689, 0, 0, 1, 1, 1,
1.101474, 0.1992449, 3.047033, 1, 0, 0, 1, 1,
1.103117, -1.021795, 1.479227, 1, 0, 0, 1, 1,
1.107138, -0.007072723, 2.59382, 1, 0, 0, 1, 1,
1.108642, 1.262423, -0.5566792, 1, 0, 0, 1, 1,
1.111313, -0.4692912, 2.823082, 1, 0, 0, 1, 1,
1.111918, -1.271317, 1.949179, 0, 0, 0, 1, 1,
1.121425, -0.9804879, 3.369071, 0, 0, 0, 1, 1,
1.122084, -0.8848197, 1.515283, 0, 0, 0, 1, 1,
1.124851, -0.3485355, 2.104526, 0, 0, 0, 1, 1,
1.127636, 1.562845, -0.1325252, 0, 0, 0, 1, 1,
1.135435, 0.6588402, 1.31129, 0, 0, 0, 1, 1,
1.13624, 1.00219, -1.105545, 0, 0, 0, 1, 1,
1.139707, 0.1905326, 2.754349, 1, 1, 1, 1, 1,
1.148714, 0.4034082, 1.355367, 1, 1, 1, 1, 1,
1.169008, 0.6393949, 0.778302, 1, 1, 1, 1, 1,
1.172368, 0.1450812, 0.1702517, 1, 1, 1, 1, 1,
1.182101, -2.491046, 2.53113, 1, 1, 1, 1, 1,
1.182792, 0.7281988, 1.154789, 1, 1, 1, 1, 1,
1.185923, -2.078447, 1.7126, 1, 1, 1, 1, 1,
1.186876, -0.9032118, 0.8016613, 1, 1, 1, 1, 1,
1.200236, 1.602724, 1.828948, 1, 1, 1, 1, 1,
1.205667, 2.106057, -1.47595, 1, 1, 1, 1, 1,
1.206434, 0.2439342, 1.462749, 1, 1, 1, 1, 1,
1.207072, 0.7906292, 1.801577, 1, 1, 1, 1, 1,
1.209174, 0.5508385, 2.064803, 1, 1, 1, 1, 1,
1.210483, -0.4556085, 0.1583053, 1, 1, 1, 1, 1,
1.215854, -0.9985927, 2.149697, 1, 1, 1, 1, 1,
1.221612, -0.3987833, 2.491828, 0, 0, 1, 1, 1,
1.224046, 0.1649724, 0.3831531, 1, 0, 0, 1, 1,
1.224313, 0.3224811, 1.203669, 1, 0, 0, 1, 1,
1.225631, 1.564412, -0.1893979, 1, 0, 0, 1, 1,
1.22597, -0.003330359, 2.037939, 1, 0, 0, 1, 1,
1.229512, -0.3533338, 1.917887, 1, 0, 0, 1, 1,
1.232602, -0.7027365, 3.249692, 0, 0, 0, 1, 1,
1.233615, -0.3264219, 2.299231, 0, 0, 0, 1, 1,
1.233778, -0.08991589, 0.1066553, 0, 0, 0, 1, 1,
1.233838, 0.1797116, -0.06693127, 0, 0, 0, 1, 1,
1.235029, -1.413236, 3.416158, 0, 0, 0, 1, 1,
1.237513, 0.8024629, 0.04076958, 0, 0, 0, 1, 1,
1.241528, -0.6383893, 1.584113, 0, 0, 0, 1, 1,
1.254564, 0.1346608, 2.104752, 1, 1, 1, 1, 1,
1.259645, 0.6027494, 1.933751, 1, 1, 1, 1, 1,
1.269946, -0.34312, 4.39302, 1, 1, 1, 1, 1,
1.271209, 0.1485606, 3.086562, 1, 1, 1, 1, 1,
1.27133, 1.18748, 2.354563, 1, 1, 1, 1, 1,
1.273584, 0.8517115, 1.342698, 1, 1, 1, 1, 1,
1.287941, 0.5489677, 1.139494, 1, 1, 1, 1, 1,
1.306022, -0.5781685, 1.240673, 1, 1, 1, 1, 1,
1.311176, -0.5356523, 1.364804, 1, 1, 1, 1, 1,
1.317368, 0.08643763, 1.303252, 1, 1, 1, 1, 1,
1.320624, -0.6251927, 2.894485, 1, 1, 1, 1, 1,
1.326123, -1.447654, 2.341607, 1, 1, 1, 1, 1,
1.341722, 1.468482, 1.324914, 1, 1, 1, 1, 1,
1.344546, 0.4245664, 0.7265553, 1, 1, 1, 1, 1,
1.346979, -1.523792, 2.482413, 1, 1, 1, 1, 1,
1.34961, 0.5618243, 2.62487, 0, 0, 1, 1, 1,
1.351114, -1.731321, 4.318942, 1, 0, 0, 1, 1,
1.359106, 0.5523238, 1.603072, 1, 0, 0, 1, 1,
1.359154, 0.6016887, 1.386011, 1, 0, 0, 1, 1,
1.370547, 0.9292981, 1.737407, 1, 0, 0, 1, 1,
1.373589, 0.2650504, 1.933543, 1, 0, 0, 1, 1,
1.388262, 1.04811, -0.3049613, 0, 0, 0, 1, 1,
1.399847, -0.8782005, -0.2088951, 0, 0, 0, 1, 1,
1.401012, 0.4930641, 1.451662, 0, 0, 0, 1, 1,
1.408607, 0.09890483, 1.931476, 0, 0, 0, 1, 1,
1.425199, 0.5317742, -0.02931882, 0, 0, 0, 1, 1,
1.428482, -0.9115387, -0.194662, 0, 0, 0, 1, 1,
1.444921, -1.2906, 2.34083, 0, 0, 0, 1, 1,
1.450132, 0.0007544439, 2.432816, 1, 1, 1, 1, 1,
1.455184, 1.235923, 0.7755359, 1, 1, 1, 1, 1,
1.459538, -1.360285, 1.814554, 1, 1, 1, 1, 1,
1.465569, 0.8253886, 2.233135, 1, 1, 1, 1, 1,
1.47106, 1.839713, 0.4622085, 1, 1, 1, 1, 1,
1.481084, -0.407761, 2.962736, 1, 1, 1, 1, 1,
1.50278, 0.701229, 2.074667, 1, 1, 1, 1, 1,
1.505618, 1.175308, 0.7924804, 1, 1, 1, 1, 1,
1.507746, 0.3626693, 1.94922, 1, 1, 1, 1, 1,
1.518504, -0.8290789, 2.396006, 1, 1, 1, 1, 1,
1.532382, -0.1868271, 1.561912, 1, 1, 1, 1, 1,
1.537449, -0.3698219, 1.551871, 1, 1, 1, 1, 1,
1.543026, -0.5087423, 2.952309, 1, 1, 1, 1, 1,
1.554924, -0.9551492, 2.369987, 1, 1, 1, 1, 1,
1.555214, 0.5297131, 1.442627, 1, 1, 1, 1, 1,
1.565098, 0.3637989, 1.696452, 0, 0, 1, 1, 1,
1.595189, 1.021671, -0.8648672, 1, 0, 0, 1, 1,
1.601, 0.7760296, 0.1883857, 1, 0, 0, 1, 1,
1.61556, 0.2688495, -0.9143876, 1, 0, 0, 1, 1,
1.616875, 0.5830158, 0.0846924, 1, 0, 0, 1, 1,
1.636672, -0.8853951, 2.377674, 1, 0, 0, 1, 1,
1.660047, 1.2386, -0.8528175, 0, 0, 0, 1, 1,
1.666561, 0.150512, 0.4002746, 0, 0, 0, 1, 1,
1.669988, -0.8173574, 3.35953, 0, 0, 0, 1, 1,
1.676789, -1.741707, 2.447057, 0, 0, 0, 1, 1,
1.689662, 0.362848, 0.6634809, 0, 0, 0, 1, 1,
1.7004, -0.8388129, 2.771328, 0, 0, 0, 1, 1,
1.714568, 1.182863, 0.009576991, 0, 0, 0, 1, 1,
1.718503, 0.491284, 0.4918106, 1, 1, 1, 1, 1,
1.758555, 0.8976063, 2.172248, 1, 1, 1, 1, 1,
1.774262, 0.655948, 0.1874994, 1, 1, 1, 1, 1,
1.793166, 0.1784327, 1.249395, 1, 1, 1, 1, 1,
1.797728, 1.341761, 1.922327, 1, 1, 1, 1, 1,
1.804991, 1.194603, 2.590465, 1, 1, 1, 1, 1,
1.829169, 0.4247623, -0.8425272, 1, 1, 1, 1, 1,
1.830934, 1.020733, 1.233783, 1, 1, 1, 1, 1,
1.831025, -0.05306106, 1.428173, 1, 1, 1, 1, 1,
1.883671, 1.497815, 2.727341, 1, 1, 1, 1, 1,
1.902945, -0.3604887, 1.618802, 1, 1, 1, 1, 1,
1.904905, -0.1158315, 2.798841, 1, 1, 1, 1, 1,
1.909392, 0.5916156, 2.468681, 1, 1, 1, 1, 1,
1.919005, 0.5106717, 0.4706027, 1, 1, 1, 1, 1,
1.966805, 1.828601, 1.0258, 1, 1, 1, 1, 1,
1.975525, 0.6439821, 1.68989, 0, 0, 1, 1, 1,
2.018073, 1.763141, -0.4491546, 1, 0, 0, 1, 1,
2.026329, 0.1101656, 2.309039, 1, 0, 0, 1, 1,
2.055698, -1.165982, 2.362361, 1, 0, 0, 1, 1,
2.059976, 0.171716, 2.171032, 1, 0, 0, 1, 1,
2.097832, 1.183003, 1.121858, 1, 0, 0, 1, 1,
2.169064, -0.6607639, 1.744416, 0, 0, 0, 1, 1,
2.170968, -0.8916996, 1.858834, 0, 0, 0, 1, 1,
2.186189, 1.388574, 2.779274, 0, 0, 0, 1, 1,
2.255111, -0.3450579, 0.6785784, 0, 0, 0, 1, 1,
2.258786, -1.279083, 2.717645, 0, 0, 0, 1, 1,
2.329956, -0.9796293, 1.870387, 0, 0, 0, 1, 1,
2.330958, -0.207632, 3.169713, 0, 0, 0, 1, 1,
2.490948, 0.1241376, 1.153144, 1, 1, 1, 1, 1,
2.656892, -0.1275606, 2.051733, 1, 1, 1, 1, 1,
2.66934, 1.70334, 1.564866, 1, 1, 1, 1, 1,
2.735084, -1.484178, 1.002509, 1, 1, 1, 1, 1,
2.751352, -0.230448, -0.1162084, 1, 1, 1, 1, 1,
2.836893, -0.1666328, 3.226009, 1, 1, 1, 1, 1,
3.256234, -0.2873932, 1.874568, 1, 1, 1, 1, 1
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
var radius = 10.01863;
var distance = 35.19001;
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
mvMatrix.translate( 0.1130128, 0.1670192, 0.3610656 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.19001);
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
