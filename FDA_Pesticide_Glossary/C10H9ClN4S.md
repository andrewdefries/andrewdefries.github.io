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
-3.465991, -0.1938345, -1.837519, 1, 0, 0, 1,
-3.046757, 0.5522447, -0.936738, 1, 0.007843138, 0, 1,
-2.765378, 0.2912059, -3.18687, 1, 0.01176471, 0, 1,
-2.685122, 1.328994, -0.5719056, 1, 0.01960784, 0, 1,
-2.620178, 0.5567944, -1.989043, 1, 0.02352941, 0, 1,
-2.595405, -1.251814, -4.118142, 1, 0.03137255, 0, 1,
-2.5262, 0.1770907, -0.493807, 1, 0.03529412, 0, 1,
-2.302069, -0.4774143, -0.7112541, 1, 0.04313726, 0, 1,
-2.267989, 0.9826418, 1.003093, 1, 0.04705882, 0, 1,
-2.24914, 1.443315, -0.4948294, 1, 0.05490196, 0, 1,
-2.219341, -1.975202, -1.642416, 1, 0.05882353, 0, 1,
-2.167331, 1.757844, -1.522135, 1, 0.06666667, 0, 1,
-2.162907, 0.745527, -0.357323, 1, 0.07058824, 0, 1,
-2.142769, -1.798663, -3.02906, 1, 0.07843138, 0, 1,
-2.08316, -0.03283567, -0.2726118, 1, 0.08235294, 0, 1,
-2.075216, 0.5176713, 0.2406752, 1, 0.09019608, 0, 1,
-2.057769, -0.4100437, -2.004389, 1, 0.09411765, 0, 1,
-1.97961, 0.743592, -1.114668, 1, 0.1019608, 0, 1,
-1.971065, 1.491843, -1.625899, 1, 0.1098039, 0, 1,
-1.938813, 0.7518385, -0.8424671, 1, 0.1137255, 0, 1,
-1.934074, -0.6145812, -2.002265, 1, 0.1215686, 0, 1,
-1.928993, -0.605553, -1.958564, 1, 0.1254902, 0, 1,
-1.926785, 1.593332, -0.1934593, 1, 0.1333333, 0, 1,
-1.919455, 0.4839048, 1.830662, 1, 0.1372549, 0, 1,
-1.904071, -0.02302528, -0.1230264, 1, 0.145098, 0, 1,
-1.903987, 0.4657333, -0.1972573, 1, 0.1490196, 0, 1,
-1.897272, -0.08724464, -1.574754, 1, 0.1568628, 0, 1,
-1.894744, 0.8093534, -1.743651, 1, 0.1607843, 0, 1,
-1.889514, -0.3389082, -1.581928, 1, 0.1686275, 0, 1,
-1.887779, 0.5877573, -1.872082, 1, 0.172549, 0, 1,
-1.884256, -0.325847, -1.876374, 1, 0.1803922, 0, 1,
-1.870522, -1.145627, -3.12154, 1, 0.1843137, 0, 1,
-1.849164, 0.714572, -0.979431, 1, 0.1921569, 0, 1,
-1.845704, 0.3546762, -1.978389, 1, 0.1960784, 0, 1,
-1.823569, -1.371005, -2.476368, 1, 0.2039216, 0, 1,
-1.804501, 0.7340229, -2.114455, 1, 0.2117647, 0, 1,
-1.76918, -0.8496249, -2.507601, 1, 0.2156863, 0, 1,
-1.766852, 0.6449744, -1.306176, 1, 0.2235294, 0, 1,
-1.760785, 2.007941, -1.332487, 1, 0.227451, 0, 1,
-1.738728, 1.123563, 0.2302772, 1, 0.2352941, 0, 1,
-1.736413, -0.4621939, -0.4789247, 1, 0.2392157, 0, 1,
-1.731297, 1.119889, -0.0160948, 1, 0.2470588, 0, 1,
-1.721587, 0.03004009, -0.180624, 1, 0.2509804, 0, 1,
-1.705752, -0.3334048, -2.630728, 1, 0.2588235, 0, 1,
-1.702209, 0.1282083, -2.073998, 1, 0.2627451, 0, 1,
-1.693698, -1.379295, -2.399668, 1, 0.2705882, 0, 1,
-1.68029, 0.2946348, 0.04483075, 1, 0.2745098, 0, 1,
-1.65587, -0.283448, -0.1355834, 1, 0.282353, 0, 1,
-1.645815, 0.7029925, -0.6535811, 1, 0.2862745, 0, 1,
-1.614815, 0.4428128, 0.180447, 1, 0.2941177, 0, 1,
-1.612649, -1.983992, -3.430921, 1, 0.3019608, 0, 1,
-1.610148, 0.8410927, -0.4609287, 1, 0.3058824, 0, 1,
-1.600562, 1.99247, -1.147374, 1, 0.3137255, 0, 1,
-1.598155, 0.5104185, -1.497827, 1, 0.3176471, 0, 1,
-1.588335, -0.4257689, -1.482711, 1, 0.3254902, 0, 1,
-1.584272, -1.523941, -2.899412, 1, 0.3294118, 0, 1,
-1.576792, -0.9541761, -1.027344, 1, 0.3372549, 0, 1,
-1.576058, -1.000721, -3.752246, 1, 0.3411765, 0, 1,
-1.568825, 0.8689263, -0.6216935, 1, 0.3490196, 0, 1,
-1.555746, 0.8727174, -1.408736, 1, 0.3529412, 0, 1,
-1.542884, -0.1620249, -3.124683, 1, 0.3607843, 0, 1,
-1.523936, -0.4054825, -2.668011, 1, 0.3647059, 0, 1,
-1.515641, 2.517695, -0.7679337, 1, 0.372549, 0, 1,
-1.504975, -0.5788565, -3.277271, 1, 0.3764706, 0, 1,
-1.503329, -0.5940228, -2.523617, 1, 0.3843137, 0, 1,
-1.502295, -0.5929205, -2.872758, 1, 0.3882353, 0, 1,
-1.499513, -0.3008688, 0.06981266, 1, 0.3960784, 0, 1,
-1.498544, -0.4977577, -1.98913, 1, 0.4039216, 0, 1,
-1.493189, 0.295411, -2.445056, 1, 0.4078431, 0, 1,
-1.487397, -1.403665, -1.278764, 1, 0.4156863, 0, 1,
-1.478219, -0.2667788, 0.3342496, 1, 0.4196078, 0, 1,
-1.473847, -1.158467, -2.708757, 1, 0.427451, 0, 1,
-1.471368, -0.2578275, -2.189689, 1, 0.4313726, 0, 1,
-1.462923, 0.273674, -2.253617, 1, 0.4392157, 0, 1,
-1.457111, -0.5494817, -2.241882, 1, 0.4431373, 0, 1,
-1.438949, 0.4482977, -1.060128, 1, 0.4509804, 0, 1,
-1.435144, 0.09142049, -0.4981805, 1, 0.454902, 0, 1,
-1.417843, -2.121447, -3.273212, 1, 0.4627451, 0, 1,
-1.412235, 0.9021195, -2.055822, 1, 0.4666667, 0, 1,
-1.40849, 0.0679359, -3.139783, 1, 0.4745098, 0, 1,
-1.407406, 1.133157, -1.005606, 1, 0.4784314, 0, 1,
-1.403092, 0.4809469, -3.732813, 1, 0.4862745, 0, 1,
-1.394416, -2.098358, -2.537916, 1, 0.4901961, 0, 1,
-1.381529, 0.07979301, -2.878237, 1, 0.4980392, 0, 1,
-1.370652, 0.1899907, -1.169075, 1, 0.5058824, 0, 1,
-1.357318, 0.2687967, -0.9541212, 1, 0.509804, 0, 1,
-1.356381, -0.8128619, -1.13764, 1, 0.5176471, 0, 1,
-1.347168, -0.8425633, -2.038919, 1, 0.5215687, 0, 1,
-1.34548, -1.293702, -1.685767, 1, 0.5294118, 0, 1,
-1.342096, -0.6593338, -3.103578, 1, 0.5333334, 0, 1,
-1.329737, 1.751888, -0.9298302, 1, 0.5411765, 0, 1,
-1.317101, -0.3587587, -0.3157395, 1, 0.5450981, 0, 1,
-1.315078, -0.7744791, -2.753428, 1, 0.5529412, 0, 1,
-1.31476, 0.1900063, -0.6741266, 1, 0.5568628, 0, 1,
-1.311705, 0.3573367, -0.894927, 1, 0.5647059, 0, 1,
-1.310378, 0.3458045, -1.047405, 1, 0.5686275, 0, 1,
-1.30871, -2.365919, -3.384831, 1, 0.5764706, 0, 1,
-1.300657, -1.547679, -2.407344, 1, 0.5803922, 0, 1,
-1.287776, 0.581484, 0.6244084, 1, 0.5882353, 0, 1,
-1.284817, -0.3835422, -0.0627488, 1, 0.5921569, 0, 1,
-1.284296, 1.292472, -0.4487826, 1, 0.6, 0, 1,
-1.280495, -0.9751213, -3.991574, 1, 0.6078432, 0, 1,
-1.279655, -0.7444618, -2.183537, 1, 0.6117647, 0, 1,
-1.275373, -0.652193, -0.7300715, 1, 0.6196079, 0, 1,
-1.272948, 1.640206, -0.6870842, 1, 0.6235294, 0, 1,
-1.266587, -1.686232, -2.51241, 1, 0.6313726, 0, 1,
-1.266163, -0.4435305, -2.264364, 1, 0.6352941, 0, 1,
-1.266049, -0.9760539, -1.069428, 1, 0.6431373, 0, 1,
-1.252274, 0.04374623, -1.47922, 1, 0.6470588, 0, 1,
-1.244978, 1.074543, -2.504285, 1, 0.654902, 0, 1,
-1.239733, 0.8440085, -0.5487093, 1, 0.6588235, 0, 1,
-1.234042, -0.565871, -2.426063, 1, 0.6666667, 0, 1,
-1.218779, 0.4546219, -2.335762, 1, 0.6705883, 0, 1,
-1.209213, 1.156217, -2.570632, 1, 0.6784314, 0, 1,
-1.208551, -0.8273357, -1.782582, 1, 0.682353, 0, 1,
-1.207178, 2.009962, 0.09624866, 1, 0.6901961, 0, 1,
-1.20264, 1.471978, -1.024574, 1, 0.6941177, 0, 1,
-1.200132, -1.926167, -4.639813, 1, 0.7019608, 0, 1,
-1.192688, 0.5705507, -1.347379, 1, 0.7098039, 0, 1,
-1.190345, -1.510098, -4.434183, 1, 0.7137255, 0, 1,
-1.185415, 0.2378077, -1.317731, 1, 0.7215686, 0, 1,
-1.180706, 0.8814945, -1.392553, 1, 0.7254902, 0, 1,
-1.174997, -1.667992, -0.6500031, 1, 0.7333333, 0, 1,
-1.173, 0.490609, -0.5739529, 1, 0.7372549, 0, 1,
-1.171294, 0.3550373, -1.035636, 1, 0.7450981, 0, 1,
-1.167793, -1.103173, -1.239418, 1, 0.7490196, 0, 1,
-1.167317, -0.884114, -2.239029, 1, 0.7568628, 0, 1,
-1.159322, -1.128657, -2.378165, 1, 0.7607843, 0, 1,
-1.157834, 0.7965107, -0.5352183, 1, 0.7686275, 0, 1,
-1.152631, -0.5373434, -3.068421, 1, 0.772549, 0, 1,
-1.150825, 0.1748648, -0.3932208, 1, 0.7803922, 0, 1,
-1.149453, -1.561563, -3.684283, 1, 0.7843137, 0, 1,
-1.14891, 1.392764, -2.20862, 1, 0.7921569, 0, 1,
-1.13424, -1.309187, -3.357037, 1, 0.7960784, 0, 1,
-1.133807, 0.07016736, -0.9375301, 1, 0.8039216, 0, 1,
-1.125713, -1.052103, -1.191951, 1, 0.8117647, 0, 1,
-1.124738, 0.05504845, -1.859823, 1, 0.8156863, 0, 1,
-1.119012, -0.9559169, -2.690763, 1, 0.8235294, 0, 1,
-1.113153, 0.3019225, -1.555229, 1, 0.827451, 0, 1,
-1.111331, -1.309902, -2.387459, 1, 0.8352941, 0, 1,
-1.108792, 1.303636, -2.505169, 1, 0.8392157, 0, 1,
-1.10236, -0.5042287, -2.558162, 1, 0.8470588, 0, 1,
-1.075734, 0.9307466, -1.216479, 1, 0.8509804, 0, 1,
-1.073236, 0.6783508, -2.331624, 1, 0.8588235, 0, 1,
-1.069693, -0.005439172, -1.658956, 1, 0.8627451, 0, 1,
-1.065477, -0.8508384, -2.569295, 1, 0.8705882, 0, 1,
-1.063981, 0.0690584, -1.739867, 1, 0.8745098, 0, 1,
-1.061879, 1.177428, -2.544028, 1, 0.8823529, 0, 1,
-1.060468, -0.01570782, -2.77513, 1, 0.8862745, 0, 1,
-1.059334, 1.839129, -0.5338636, 1, 0.8941177, 0, 1,
-1.051054, 0.2989945, -0.3451914, 1, 0.8980392, 0, 1,
-1.041245, 0.2590095, -0.9836196, 1, 0.9058824, 0, 1,
-1.032361, 0.9848524, -0.422818, 1, 0.9137255, 0, 1,
-1.027972, -1.05739, -2.165514, 1, 0.9176471, 0, 1,
-1.02536, -1.200026, -5.420075, 1, 0.9254902, 0, 1,
-1.02157, 1.253098, -0.9109359, 1, 0.9294118, 0, 1,
-1.017493, 0.5789236, -0.5933416, 1, 0.9372549, 0, 1,
-1.012006, 1.035805, -0.2398276, 1, 0.9411765, 0, 1,
-1.009838, -1.230686, -3.624129, 1, 0.9490196, 0, 1,
-1.007636, 0.1997232, -0.9695036, 1, 0.9529412, 0, 1,
-1.00455, 1.364107, 0.9322563, 1, 0.9607843, 0, 1,
-0.9968432, 0.05206161, -1.755422, 1, 0.9647059, 0, 1,
-0.9965299, -0.2427274, -1.218356, 1, 0.972549, 0, 1,
-0.9941102, 1.003098, -0.7945222, 1, 0.9764706, 0, 1,
-0.990798, 1.94147, -1.666135, 1, 0.9843137, 0, 1,
-0.9826571, -1.471433, -1.557841, 1, 0.9882353, 0, 1,
-0.9776369, 0.2476593, -0.4227403, 1, 0.9960784, 0, 1,
-0.974587, 0.144555, -1.423612, 0.9960784, 1, 0, 1,
-0.9687138, -0.08735294, -1.178508, 0.9921569, 1, 0, 1,
-0.9638261, 1.034395, -0.7145688, 0.9843137, 1, 0, 1,
-0.9543815, 1.256666, 0.1958141, 0.9803922, 1, 0, 1,
-0.954344, -1.540075, -1.700454, 0.972549, 1, 0, 1,
-0.9475035, -0.1634462, -1.21646, 0.9686275, 1, 0, 1,
-0.9468968, -0.3151537, -0.2833375, 0.9607843, 1, 0, 1,
-0.9264739, 0.01547188, 0.250731, 0.9568627, 1, 0, 1,
-0.9224219, 0.9863216, 1.864056, 0.9490196, 1, 0, 1,
-0.9186521, -0.05401663, -1.297742, 0.945098, 1, 0, 1,
-0.9171093, -1.571938, -2.407715, 0.9372549, 1, 0, 1,
-0.9150683, 2.114337, -1.229154, 0.9333333, 1, 0, 1,
-0.9087464, 0.8912132, -0.7366499, 0.9254902, 1, 0, 1,
-0.9055113, -0.05120156, -1.855577, 0.9215686, 1, 0, 1,
-0.9049492, 0.6657876, -1.406942, 0.9137255, 1, 0, 1,
-0.9025316, 1.093691, 0.2748078, 0.9098039, 1, 0, 1,
-0.897059, -0.1098229, 0.09168778, 0.9019608, 1, 0, 1,
-0.896291, 2.867198, -0.1195677, 0.8941177, 1, 0, 1,
-0.8939872, -0.3119741, -2.100934, 0.8901961, 1, 0, 1,
-0.8871364, 0.66546, -0.4563237, 0.8823529, 1, 0, 1,
-0.8870664, -1.794455, -1.740562, 0.8784314, 1, 0, 1,
-0.8853372, 2.048318, 0.2837915, 0.8705882, 1, 0, 1,
-0.8799585, -1.873313, -2.881983, 0.8666667, 1, 0, 1,
-0.8732494, -1.293759, -4.181996, 0.8588235, 1, 0, 1,
-0.8694842, -0.6651787, -1.308843, 0.854902, 1, 0, 1,
-0.8686889, -1.19436, -0.8918972, 0.8470588, 1, 0, 1,
-0.8653242, -1.548696, -2.151297, 0.8431373, 1, 0, 1,
-0.8580909, -0.7535477, -2.709073, 0.8352941, 1, 0, 1,
-0.8571534, -2.605446, -1.911361, 0.8313726, 1, 0, 1,
-0.8568321, -1.142489, -2.962677, 0.8235294, 1, 0, 1,
-0.841532, 0.4225912, -1.248412, 0.8196079, 1, 0, 1,
-0.8394216, -0.3208536, -0.478255, 0.8117647, 1, 0, 1,
-0.8356324, 0.004613351, 0.0962704, 0.8078431, 1, 0, 1,
-0.8097232, 0.07766315, 0.3150187, 0.8, 1, 0, 1,
-0.8092742, -1.321949, -1.796703, 0.7921569, 1, 0, 1,
-0.8087506, -0.1634434, -2.932268, 0.7882353, 1, 0, 1,
-0.8085517, -1.460348, -0.6572023, 0.7803922, 1, 0, 1,
-0.8066435, -0.6583176, -1.727024, 0.7764706, 1, 0, 1,
-0.8044697, -1.152177, -2.94632, 0.7686275, 1, 0, 1,
-0.8028255, 0.4241982, -1.288133, 0.7647059, 1, 0, 1,
-0.8015833, -1.12144, -1.379805, 0.7568628, 1, 0, 1,
-0.79983, 0.4003499, -0.5278014, 0.7529412, 1, 0, 1,
-0.7988656, 1.774099, -0.8597994, 0.7450981, 1, 0, 1,
-0.7883603, 1.230875, -1.826976, 0.7411765, 1, 0, 1,
-0.7837122, 0.9829512, -0.6480927, 0.7333333, 1, 0, 1,
-0.7781893, -0.1019933, 0.1549743, 0.7294118, 1, 0, 1,
-0.7780918, 0.16432, -2.012132, 0.7215686, 1, 0, 1,
-0.7755125, -0.4889968, -2.713726, 0.7176471, 1, 0, 1,
-0.773092, 0.4904636, -2.308494, 0.7098039, 1, 0, 1,
-0.7683159, 1.892055, 1.462559, 0.7058824, 1, 0, 1,
-0.7577747, -0.2077652, -2.965687, 0.6980392, 1, 0, 1,
-0.7547495, 0.336639, -1.865442, 0.6901961, 1, 0, 1,
-0.7457453, 1.977052, -1.262288, 0.6862745, 1, 0, 1,
-0.7365185, 0.2782576, -2.176451, 0.6784314, 1, 0, 1,
-0.7356713, -0.7252421, -2.386984, 0.6745098, 1, 0, 1,
-0.7353972, -0.7555265, -2.717022, 0.6666667, 1, 0, 1,
-0.7294688, 0.2624828, -2.143746, 0.6627451, 1, 0, 1,
-0.7254156, 2.572057, -0.3819046, 0.654902, 1, 0, 1,
-0.7253261, 2.175529, 1.004375, 0.6509804, 1, 0, 1,
-0.7225134, -0.6206998, -1.027172, 0.6431373, 1, 0, 1,
-0.7155793, 1.872658, -0.1006797, 0.6392157, 1, 0, 1,
-0.7151414, -1.192467, -2.500201, 0.6313726, 1, 0, 1,
-0.7127843, 1.194021, -0.9502231, 0.627451, 1, 0, 1,
-0.7120427, -1.25865, -2.106165, 0.6196079, 1, 0, 1,
-0.7119612, 0.6575053, -1.897772, 0.6156863, 1, 0, 1,
-0.7097493, -0.7359377, -3.941873, 0.6078432, 1, 0, 1,
-0.7031201, 1.704465, -1.963115, 0.6039216, 1, 0, 1,
-0.7013757, -0.03435298, 0.0136149, 0.5960785, 1, 0, 1,
-0.6975925, 0.1619725, -1.683304, 0.5882353, 1, 0, 1,
-0.6943389, 0.01458926, -2.300846, 0.5843138, 1, 0, 1,
-0.6922212, 1.479239, 0.8772387, 0.5764706, 1, 0, 1,
-0.6879463, 1.28582, -0.7676831, 0.572549, 1, 0, 1,
-0.6875189, 0.864225, 1.722222, 0.5647059, 1, 0, 1,
-0.6843113, 1.226482, -1.179575, 0.5607843, 1, 0, 1,
-0.6791302, -0.1345763, -2.613996, 0.5529412, 1, 0, 1,
-0.6755524, 0.1104056, 0.3262669, 0.5490196, 1, 0, 1,
-0.6711892, 1.512141, 0.04525125, 0.5411765, 1, 0, 1,
-0.6669562, -1.064453, -4.405279, 0.5372549, 1, 0, 1,
-0.6625123, 0.04438926, -1.985528, 0.5294118, 1, 0, 1,
-0.6549032, -0.9988797, -4.00951, 0.5254902, 1, 0, 1,
-0.6534466, 3.05778, -2.405153, 0.5176471, 1, 0, 1,
-0.6490905, 0.6974544, -0.3292314, 0.5137255, 1, 0, 1,
-0.6490318, 0.7500227, -1.919237, 0.5058824, 1, 0, 1,
-0.6462909, 0.9710602, -0.5542279, 0.5019608, 1, 0, 1,
-0.6450197, 1.028708, 1.153198, 0.4941176, 1, 0, 1,
-0.6445863, 0.4546594, -1.724668, 0.4862745, 1, 0, 1,
-0.6402243, -0.1191201, -3.611699, 0.4823529, 1, 0, 1,
-0.6371728, -2.067752, -4.051156, 0.4745098, 1, 0, 1,
-0.6350601, -0.1969841, -1.594065, 0.4705882, 1, 0, 1,
-0.6337585, 2.59518, -1.201074, 0.4627451, 1, 0, 1,
-0.6325082, -0.7596418, -2.84336, 0.4588235, 1, 0, 1,
-0.6322167, 0.05199767, -1.577113, 0.4509804, 1, 0, 1,
-0.6317058, -1.024528, -3.391944, 0.4470588, 1, 0, 1,
-0.6300012, -0.423234, -3.281619, 0.4392157, 1, 0, 1,
-0.6299524, -2.421721, -1.244863, 0.4352941, 1, 0, 1,
-0.6272368, 1.605439, 0.3980049, 0.427451, 1, 0, 1,
-0.6251161, 0.5480333, 0.7497298, 0.4235294, 1, 0, 1,
-0.6234024, 1.170416, 0.5943195, 0.4156863, 1, 0, 1,
-0.6168703, 1.709042, 1.203149, 0.4117647, 1, 0, 1,
-0.6147438, 0.6145759, -0.01615722, 0.4039216, 1, 0, 1,
-0.6142178, 3.059728, -2.33659, 0.3960784, 1, 0, 1,
-0.6129298, -0.1089268, -2.043886, 0.3921569, 1, 0, 1,
-0.6114054, 1.47187, 1.647762, 0.3843137, 1, 0, 1,
-0.6063251, -0.1478931, -0.5813677, 0.3803922, 1, 0, 1,
-0.6042477, 0.7543741, 0.07451269, 0.372549, 1, 0, 1,
-0.6028484, -0.1821631, -1.17226, 0.3686275, 1, 0, 1,
-0.5884125, 2.052985, -1.081599, 0.3607843, 1, 0, 1,
-0.5868302, 0.5561178, 0.3083001, 0.3568628, 1, 0, 1,
-0.5823054, -0.4875743, -1.39407, 0.3490196, 1, 0, 1,
-0.5789963, 1.034971, -2.633881, 0.345098, 1, 0, 1,
-0.5782671, 1.609508, -0.1050753, 0.3372549, 1, 0, 1,
-0.5774161, -0.9220558, -2.433521, 0.3333333, 1, 0, 1,
-0.5773584, -0.4923315, -3.601072, 0.3254902, 1, 0, 1,
-0.5729022, -0.5136006, -3.125816, 0.3215686, 1, 0, 1,
-0.5718775, -1.794374, -1.728639, 0.3137255, 1, 0, 1,
-0.5681613, 1.25756, -1.210185, 0.3098039, 1, 0, 1,
-0.5658163, 2.252257, 0.9336284, 0.3019608, 1, 0, 1,
-0.5618299, -0.1951074, -1.199511, 0.2941177, 1, 0, 1,
-0.5511091, -0.1257433, -0.7163557, 0.2901961, 1, 0, 1,
-0.5456186, 0.1802609, -0.8953992, 0.282353, 1, 0, 1,
-0.5359002, 0.5750847, -0.523228, 0.2784314, 1, 0, 1,
-0.5289426, 0.5433635, 0.6391734, 0.2705882, 1, 0, 1,
-0.5276599, 1.954487, -0.3640559, 0.2666667, 1, 0, 1,
-0.5255038, -0.1770686, -2.859598, 0.2588235, 1, 0, 1,
-0.5248921, -0.5871747, -1.907563, 0.254902, 1, 0, 1,
-0.5230246, -2.824346, -2.253577, 0.2470588, 1, 0, 1,
-0.5213026, -1.170429, -2.584397, 0.2431373, 1, 0, 1,
-0.5210086, -0.02288968, -3.481234, 0.2352941, 1, 0, 1,
-0.5177599, -1.216402, -2.53392, 0.2313726, 1, 0, 1,
-0.5138196, 0.0434479, -4.340802, 0.2235294, 1, 0, 1,
-0.51165, -0.6748251, -1.789684, 0.2196078, 1, 0, 1,
-0.5116378, -0.9988679, -3.867412, 0.2117647, 1, 0, 1,
-0.5110907, -0.6982837, -0.9794934, 0.2078431, 1, 0, 1,
-0.5105433, -0.3473215, -1.543452, 0.2, 1, 0, 1,
-0.5102731, -0.935721, -3.641049, 0.1921569, 1, 0, 1,
-0.5090061, -0.2574381, -1.642784, 0.1882353, 1, 0, 1,
-0.5085523, -0.39057, -3.404741, 0.1803922, 1, 0, 1,
-0.5050947, -0.7542223, -2.494498, 0.1764706, 1, 0, 1,
-0.5040299, 0.7482699, -3.051306, 0.1686275, 1, 0, 1,
-0.5023677, -0.9142704, -1.430328, 0.1647059, 1, 0, 1,
-0.502227, -0.7635543, -1.59884, 0.1568628, 1, 0, 1,
-0.4947008, 1.074349, 0.8374438, 0.1529412, 1, 0, 1,
-0.4936262, 1.526258, -0.1906875, 0.145098, 1, 0, 1,
-0.4902636, 0.9706775, -1.558473, 0.1411765, 1, 0, 1,
-0.4885159, -1.275431, -2.544039, 0.1333333, 1, 0, 1,
-0.4870617, -0.7509206, -3.323182, 0.1294118, 1, 0, 1,
-0.4694073, 0.3887047, -0.151872, 0.1215686, 1, 0, 1,
-0.4593703, -0.8148534, -1.278827, 0.1176471, 1, 0, 1,
-0.4584737, -2.071306, -3.595629, 0.1098039, 1, 0, 1,
-0.4569311, 0.5372586, -2.152578, 0.1058824, 1, 0, 1,
-0.4556788, 1.608003, 0.1054563, 0.09803922, 1, 0, 1,
-0.4521947, 0.1366296, -2.064927, 0.09019608, 1, 0, 1,
-0.4512804, -0.09851232, -1.407867, 0.08627451, 1, 0, 1,
-0.4501401, 0.2462139, -1.561599, 0.07843138, 1, 0, 1,
-0.4402648, 0.5508208, -1.503195, 0.07450981, 1, 0, 1,
-0.4386632, -1.721401, -3.051556, 0.06666667, 1, 0, 1,
-0.4386151, -0.4348052, -0.8536734, 0.0627451, 1, 0, 1,
-0.4370723, -1.180622, -2.053113, 0.05490196, 1, 0, 1,
-0.4370371, 0.0301869, -2.711678, 0.05098039, 1, 0, 1,
-0.4307546, -0.7086796, -2.363041, 0.04313726, 1, 0, 1,
-0.4304001, -0.8842731, -2.405441, 0.03921569, 1, 0, 1,
-0.4303605, 0.0261096, 0.5992312, 0.03137255, 1, 0, 1,
-0.4294694, -1.196768, -2.661523, 0.02745098, 1, 0, 1,
-0.4288805, -1.33091, -3.297755, 0.01960784, 1, 0, 1,
-0.4283191, 0.6041593, -0.3264596, 0.01568628, 1, 0, 1,
-0.42676, -1.006312, -3.177232, 0.007843138, 1, 0, 1,
-0.4254289, -1.670638, -3.437596, 0.003921569, 1, 0, 1,
-0.4222256, -0.8542156, -2.031301, 0, 1, 0.003921569, 1,
-0.4152921, -2.195748, -2.629993, 0, 1, 0.01176471, 1,
-0.4074153, -0.5892305, -0.4202033, 0, 1, 0.01568628, 1,
-0.4070563, -0.7491287, -0.7488755, 0, 1, 0.02352941, 1,
-0.4014628, 0.1915599, -1.052872, 0, 1, 0.02745098, 1,
-0.4002257, 1.745613, -0.8597485, 0, 1, 0.03529412, 1,
-0.395389, 0.3136735, -1.89916, 0, 1, 0.03921569, 1,
-0.3935556, 1.464244, -0.4596827, 0, 1, 0.04705882, 1,
-0.3916748, -0.1609983, -0.3253051, 0, 1, 0.05098039, 1,
-0.3880299, -0.08658934, -2.576912, 0, 1, 0.05882353, 1,
-0.3822504, 0.4756803, -1.769085, 0, 1, 0.0627451, 1,
-0.381573, 1.716981, -1.607729, 0, 1, 0.07058824, 1,
-0.3754999, 1.67991, -0.5309687, 0, 1, 0.07450981, 1,
-0.3743806, -1.680886, -3.335218, 0, 1, 0.08235294, 1,
-0.3731497, 1.080199, 0.1695182, 0, 1, 0.08627451, 1,
-0.3712828, 0.5489998, 0.2394487, 0, 1, 0.09411765, 1,
-0.370243, -0.1989942, -2.12919, 0, 1, 0.1019608, 1,
-0.3677642, 1.490031, -0.1111702, 0, 1, 0.1058824, 1,
-0.3638711, -0.2711252, -1.696356, 0, 1, 0.1137255, 1,
-0.3623884, -0.613746, -1.763899, 0, 1, 0.1176471, 1,
-0.3604779, -0.8586954, -2.86999, 0, 1, 0.1254902, 1,
-0.3594324, 1.149, -0.4462451, 0, 1, 0.1294118, 1,
-0.356558, -0.9751874, -3.48684, 0, 1, 0.1372549, 1,
-0.3533075, -1.881196, -2.574779, 0, 1, 0.1411765, 1,
-0.3522375, 0.7079768, 1.17148, 0, 1, 0.1490196, 1,
-0.3515711, -0.4825466, -1.774517, 0, 1, 0.1529412, 1,
-0.3511304, -1.422277, -5.041688, 0, 1, 0.1607843, 1,
-0.350266, 2.109289, 0.3260044, 0, 1, 0.1647059, 1,
-0.3487234, -0.7153336, -3.052787, 0, 1, 0.172549, 1,
-0.3466752, 1.50563, 0.2944629, 0, 1, 0.1764706, 1,
-0.3449289, -1.116717, -5.831181, 0, 1, 0.1843137, 1,
-0.3405037, -1.713591, -3.777543, 0, 1, 0.1882353, 1,
-0.3372489, -0.8506756, -3.542888, 0, 1, 0.1960784, 1,
-0.3336393, -0.3456075, -2.28068, 0, 1, 0.2039216, 1,
-0.3250693, 1.825294, -0.6052343, 0, 1, 0.2078431, 1,
-0.3246813, 0.2245712, -2.687418, 0, 1, 0.2156863, 1,
-0.3234224, 1.078572, -1.078274, 0, 1, 0.2196078, 1,
-0.3183478, 1.316042, -0.5909672, 0, 1, 0.227451, 1,
-0.3158277, 0.08719872, -0.8869962, 0, 1, 0.2313726, 1,
-0.313859, 0.3221725, -0.1741559, 0, 1, 0.2392157, 1,
-0.3127926, -1.355804, -2.840292, 0, 1, 0.2431373, 1,
-0.3123482, 2.86408, 1.625459, 0, 1, 0.2509804, 1,
-0.3092768, -1.134087, -3.530594, 0, 1, 0.254902, 1,
-0.3092378, -0.9028539, -2.848248, 0, 1, 0.2627451, 1,
-0.3070651, 0.4357518, -1.737653, 0, 1, 0.2666667, 1,
-0.3030295, 0.001697161, -0.4751065, 0, 1, 0.2745098, 1,
-0.3024254, 2.367022, 0.2378035, 0, 1, 0.2784314, 1,
-0.3005723, 0.2705562, 0.9227425, 0, 1, 0.2862745, 1,
-0.2995503, -0.7678455, -3.888928, 0, 1, 0.2901961, 1,
-0.2970643, 1.315546, 0.0177329, 0, 1, 0.2980392, 1,
-0.2951925, -0.5078275, -4.398429, 0, 1, 0.3058824, 1,
-0.29497, -0.4818944, -1.867813, 0, 1, 0.3098039, 1,
-0.2916779, 0.1095868, -2.481354, 0, 1, 0.3176471, 1,
-0.286079, 0.08074472, -0.6598864, 0, 1, 0.3215686, 1,
-0.276169, -0.2447696, -2.33554, 0, 1, 0.3294118, 1,
-0.2723119, -1.894031, -1.72684, 0, 1, 0.3333333, 1,
-0.2703623, 0.3677995, -0.5502254, 0, 1, 0.3411765, 1,
-0.2685479, 0.4260046, -0.6591134, 0, 1, 0.345098, 1,
-0.2683185, 0.671835, -0.5363193, 0, 1, 0.3529412, 1,
-0.2662609, 0.07575725, -0.6121477, 0, 1, 0.3568628, 1,
-0.2662417, -2.462861, -3.333174, 0, 1, 0.3647059, 1,
-0.2654874, -2.078592, -2.742612, 0, 1, 0.3686275, 1,
-0.2651579, -1.172947, -0.8658151, 0, 1, 0.3764706, 1,
-0.2609802, -1.427141, -3.452573, 0, 1, 0.3803922, 1,
-0.2546393, 0.8675645, -0.9294407, 0, 1, 0.3882353, 1,
-0.2536711, 0.9424766, -0.3185152, 0, 1, 0.3921569, 1,
-0.2505101, 1.018416, 0.1234758, 0, 1, 0.4, 1,
-0.2481322, -1.217858, -2.672611, 0, 1, 0.4078431, 1,
-0.2463007, -0.04634742, -1.880476, 0, 1, 0.4117647, 1,
-0.2442631, 0.3891082, -1.359881, 0, 1, 0.4196078, 1,
-0.2440105, -1.524279, -2.295179, 0, 1, 0.4235294, 1,
-0.2386056, -0.4494559, -1.964754, 0, 1, 0.4313726, 1,
-0.2380562, -1.446395, -4.14391, 0, 1, 0.4352941, 1,
-0.2376561, 1.168633, 0.8787207, 0, 1, 0.4431373, 1,
-0.234099, 0.8533555, -0.7968829, 0, 1, 0.4470588, 1,
-0.2325751, -1.942283, -1.960796, 0, 1, 0.454902, 1,
-0.2288156, -0.5423147, -2.549406, 0, 1, 0.4588235, 1,
-0.2254457, -0.8314547, -3.313952, 0, 1, 0.4666667, 1,
-0.2192877, -1.604694, -3.415907, 0, 1, 0.4705882, 1,
-0.2159914, -1.647838, -3.62308, 0, 1, 0.4784314, 1,
-0.2148284, 0.3574745, -0.06376339, 0, 1, 0.4823529, 1,
-0.2108313, -0.9728474, -2.756521, 0, 1, 0.4901961, 1,
-0.2087995, -0.4305557, -1.908965, 0, 1, 0.4941176, 1,
-0.2041358, -2.20633, -2.033278, 0, 1, 0.5019608, 1,
-0.2041334, -0.6554414, -1.08976, 0, 1, 0.509804, 1,
-0.2019968, 0.5363391, -3.899423, 0, 1, 0.5137255, 1,
-0.1999967, -1.375479, -4.090541, 0, 1, 0.5215687, 1,
-0.1997357, 1.179715, -0.2720249, 0, 1, 0.5254902, 1,
-0.19859, -1.583905, -3.666756, 0, 1, 0.5333334, 1,
-0.1968316, 0.06588605, -1.048016, 0, 1, 0.5372549, 1,
-0.1944226, 1.315586, 0.2491872, 0, 1, 0.5450981, 1,
-0.1917044, 0.3658309, -0.2247441, 0, 1, 0.5490196, 1,
-0.1868355, 1.269903, -0.4436227, 0, 1, 0.5568628, 1,
-0.1863534, -0.5248366, -2.769141, 0, 1, 0.5607843, 1,
-0.1850507, 0.09685588, -1.292258, 0, 1, 0.5686275, 1,
-0.1831498, -1.060089, -2.372586, 0, 1, 0.572549, 1,
-0.1794987, 0.6164492, -0.9553146, 0, 1, 0.5803922, 1,
-0.1783858, -0.5477741, -3.893662, 0, 1, 0.5843138, 1,
-0.1736385, 1.442827, -1.143221, 0, 1, 0.5921569, 1,
-0.1726413, 1.247361, -0.1866055, 0, 1, 0.5960785, 1,
-0.164964, 0.2626493, 0.7486346, 0, 1, 0.6039216, 1,
-0.1641236, -0.7042269, -2.940777, 0, 1, 0.6117647, 1,
-0.1530917, 0.08587181, 0.2743228, 0, 1, 0.6156863, 1,
-0.1497285, 0.6661931, -1.182545, 0, 1, 0.6235294, 1,
-0.1482156, -0.2559269, -3.0283, 0, 1, 0.627451, 1,
-0.1432905, 0.2042708, 0.07197083, 0, 1, 0.6352941, 1,
-0.1430136, -0.8647022, -3.976866, 0, 1, 0.6392157, 1,
-0.1427162, -2.272525, -3.015761, 0, 1, 0.6470588, 1,
-0.1410114, 0.01064409, -2.645802, 0, 1, 0.6509804, 1,
-0.1389539, -0.525598, -2.466709, 0, 1, 0.6588235, 1,
-0.138203, 0.4266835, 0.7794938, 0, 1, 0.6627451, 1,
-0.1369316, 0.08613601, -1.048685, 0, 1, 0.6705883, 1,
-0.1367557, -1.590953, -3.5456, 0, 1, 0.6745098, 1,
-0.1280453, 0.6848369, -0.1409687, 0, 1, 0.682353, 1,
-0.1272356, -0.3628949, -3.261789, 0, 1, 0.6862745, 1,
-0.126366, -0.9196902, -4.092196, 0, 1, 0.6941177, 1,
-0.1258976, -1.771916, -2.16432, 0, 1, 0.7019608, 1,
-0.1255828, -1.737973, -2.630824, 0, 1, 0.7058824, 1,
-0.1253269, 1.149013, -1.667857, 0, 1, 0.7137255, 1,
-0.1208816, 1.277746, 1.063201, 0, 1, 0.7176471, 1,
-0.1193484, -1.080664, -2.829615, 0, 1, 0.7254902, 1,
-0.118883, -0.9434337, -3.460529, 0, 1, 0.7294118, 1,
-0.118767, 1.445221, -0.4381672, 0, 1, 0.7372549, 1,
-0.1175045, -1.348976, -3.363282, 0, 1, 0.7411765, 1,
-0.1150274, -0.3355264, -1.591652, 0, 1, 0.7490196, 1,
-0.1144209, 1.989563, -1.439602, 0, 1, 0.7529412, 1,
-0.1127257, 0.1239578, -1.750654, 0, 1, 0.7607843, 1,
-0.112211, -1.188071, -5.006651, 0, 1, 0.7647059, 1,
-0.1054156, -1.019185, -4.707294, 0, 1, 0.772549, 1,
-0.104329, -0.8371456, -2.226349, 0, 1, 0.7764706, 1,
-0.1026828, -0.8035315, -1.782147, 0, 1, 0.7843137, 1,
-0.09221447, 0.6848571, -1.474165, 0, 1, 0.7882353, 1,
-0.08666734, -1.699271, -2.776808, 0, 1, 0.7960784, 1,
-0.08289601, -0.3817463, -2.574731, 0, 1, 0.8039216, 1,
-0.08040825, -0.5690704, -3.347817, 0, 1, 0.8078431, 1,
-0.08025132, 0.7694748, -1.097217, 0, 1, 0.8156863, 1,
-0.07896473, 1.311685, -0.9252999, 0, 1, 0.8196079, 1,
-0.07572591, 0.5122032, -1.051045, 0, 1, 0.827451, 1,
-0.07198795, -0.06686772, -2.613771, 0, 1, 0.8313726, 1,
-0.06851527, -0.3582996, -2.146511, 0, 1, 0.8392157, 1,
-0.06815901, 1.394856, -1.398335, 0, 1, 0.8431373, 1,
-0.06284211, 1.452227, 0.8502967, 0, 1, 0.8509804, 1,
-0.05757466, -1.070217, -5.116545, 0, 1, 0.854902, 1,
-0.05427815, -0.7244036, -2.5302, 0, 1, 0.8627451, 1,
-0.05206859, 1.838174, 0.5288512, 0, 1, 0.8666667, 1,
-0.05019621, 0.4840773, 0.4520972, 0, 1, 0.8745098, 1,
-0.04764866, 0.9164954, -0.9255236, 0, 1, 0.8784314, 1,
-0.04749873, 2.005779, 1.119162, 0, 1, 0.8862745, 1,
-0.04633442, 2.082905, 0.6080329, 0, 1, 0.8901961, 1,
-0.04493407, -0.6087036, -3.182113, 0, 1, 0.8980392, 1,
-0.03866803, 0.3134813, 0.2145098, 0, 1, 0.9058824, 1,
-0.03581074, 0.6991667, 1.519605, 0, 1, 0.9098039, 1,
-0.0348684, 0.641635, 1.136467, 0, 1, 0.9176471, 1,
-0.03352529, 0.5772326, -0.9208026, 0, 1, 0.9215686, 1,
-0.02315992, 0.06949206, -0.6758603, 0, 1, 0.9294118, 1,
-0.02106249, 1.172045, 1.853122, 0, 1, 0.9333333, 1,
-0.01876074, 0.3594882, -0.4815223, 0, 1, 0.9411765, 1,
-0.01754781, 0.05186963, -0.3726741, 0, 1, 0.945098, 1,
-0.01730994, 0.1047009, -0.01746468, 0, 1, 0.9529412, 1,
-0.0115539, 0.4425242, 1.168888, 0, 1, 0.9568627, 1,
-0.01036637, -0.1204732, -4.720751, 0, 1, 0.9647059, 1,
-0.007434673, -1.871703, -3.356779, 0, 1, 0.9686275, 1,
-0.005709452, 0.6497646, -0.8640404, 0, 1, 0.9764706, 1,
-0.003724031, 0.5529591, -1.821344, 0, 1, 0.9803922, 1,
-0.00128519, 0.3555961, 0.2506717, 0, 1, 0.9882353, 1,
0.0001214024, 1.301314, -1.033377, 0, 1, 0.9921569, 1,
0.0006182357, 0.7696275, 1.935901, 0, 1, 1, 1,
0.0007280893, -0.3237555, 2.335798, 0, 0.9921569, 1, 1,
0.001293446, -1.003225, 2.466978, 0, 0.9882353, 1, 1,
0.001294753, -0.3531795, 3.973276, 0, 0.9803922, 1, 1,
0.003905155, -1.055409, 3.379195, 0, 0.9764706, 1, 1,
0.004080694, -0.9419594, 4.100275, 0, 0.9686275, 1, 1,
0.004242305, 1.644087, -0.8109301, 0, 0.9647059, 1, 1,
0.005150228, 0.4522323, -0.05830524, 0, 0.9568627, 1, 1,
0.008748456, -1.007092, 4.829659, 0, 0.9529412, 1, 1,
0.01079884, -1.014798, 3.127387, 0, 0.945098, 1, 1,
0.01144561, -0.6166183, 2.806296, 0, 0.9411765, 1, 1,
0.01252438, 1.046059, 0.6818296, 0, 0.9333333, 1, 1,
0.01441815, -0.5410179, 3.266941, 0, 0.9294118, 1, 1,
0.01596829, -0.04981408, 3.092074, 0, 0.9215686, 1, 1,
0.01639406, 0.9747484, 0.3343133, 0, 0.9176471, 1, 1,
0.01893084, -0.4226741, 2.284513, 0, 0.9098039, 1, 1,
0.02029974, 0.2959818, -0.1478662, 0, 0.9058824, 1, 1,
0.02206057, -2.049967, 3.935544, 0, 0.8980392, 1, 1,
0.02267426, 0.1519007, 0.4416604, 0, 0.8901961, 1, 1,
0.02347224, -0.04377313, 1.871361, 0, 0.8862745, 1, 1,
0.02628209, -0.1801369, 2.368875, 0, 0.8784314, 1, 1,
0.02788082, 1.672342, 1.223738, 0, 0.8745098, 1, 1,
0.02866694, 1.100085, -0.9653252, 0, 0.8666667, 1, 1,
0.0332143, -0.210051, 3.375514, 0, 0.8627451, 1, 1,
0.04090636, -0.1395578, 3.188668, 0, 0.854902, 1, 1,
0.04208523, 0.5154837, 0.6846357, 0, 0.8509804, 1, 1,
0.04248872, -1.426417, 2.694339, 0, 0.8431373, 1, 1,
0.04283106, -1.158262, 3.192191, 0, 0.8392157, 1, 1,
0.04356155, 0.05530055, -0.1650542, 0, 0.8313726, 1, 1,
0.04556273, 0.192192, 0.8735006, 0, 0.827451, 1, 1,
0.04638815, -1.08246, 3.545338, 0, 0.8196079, 1, 1,
0.0470912, 0.4845301, -0.7763718, 0, 0.8156863, 1, 1,
0.05042997, 0.9153541, 1.145117, 0, 0.8078431, 1, 1,
0.05238, -0.09093612, 1.616338, 0, 0.8039216, 1, 1,
0.05289427, 0.6431875, 0.8591615, 0, 0.7960784, 1, 1,
0.05502115, 1.042555, 1.305231, 0, 0.7882353, 1, 1,
0.05975785, -0.08047378, 3.50084, 0, 0.7843137, 1, 1,
0.06179456, 0.794854, 0.6085508, 0, 0.7764706, 1, 1,
0.06356931, -0.3570746, 3.215898, 0, 0.772549, 1, 1,
0.06429159, 1.282212, -1.141709, 0, 0.7647059, 1, 1,
0.06583662, -1.5023, 4.315151, 0, 0.7607843, 1, 1,
0.06612531, 2.425912, 0.5560029, 0, 0.7529412, 1, 1,
0.06927138, -0.1596628, 1.99189, 0, 0.7490196, 1, 1,
0.07454535, 0.9062618, 0.5950058, 0, 0.7411765, 1, 1,
0.07966199, 1.488541, 1.689916, 0, 0.7372549, 1, 1,
0.0816447, 0.2624629, -0.9916506, 0, 0.7294118, 1, 1,
0.08168215, -0.7871513, 3.284943, 0, 0.7254902, 1, 1,
0.0830869, -1.163414, 2.66051, 0, 0.7176471, 1, 1,
0.09222584, -0.6896295, 2.623612, 0, 0.7137255, 1, 1,
0.09261905, -0.8999933, 1.208282, 0, 0.7058824, 1, 1,
0.09390924, -1.283283, 2.11956, 0, 0.6980392, 1, 1,
0.09535447, 2.918509, -0.3356887, 0, 0.6941177, 1, 1,
0.0964409, -1.557799, 2.330137, 0, 0.6862745, 1, 1,
0.09759013, -1.592708, 4.839227, 0, 0.682353, 1, 1,
0.09798992, 1.2328, -0.1552305, 0, 0.6745098, 1, 1,
0.1006952, -1.057129, 1.51216, 0, 0.6705883, 1, 1,
0.1053821, 1.219403, -0.502764, 0, 0.6627451, 1, 1,
0.1057681, 0.3588507, -0.8907678, 0, 0.6588235, 1, 1,
0.1072427, -0.8445559, 3.81015, 0, 0.6509804, 1, 1,
0.1203217, 1.061951, 1.320936, 0, 0.6470588, 1, 1,
0.1207475, -1.711833, 4.695537, 0, 0.6392157, 1, 1,
0.122135, 1.366907, 0.3554879, 0, 0.6352941, 1, 1,
0.1234272, 1.18418, 0.07922247, 0, 0.627451, 1, 1,
0.1254086, -0.3525034, 4.470776, 0, 0.6235294, 1, 1,
0.1271847, 0.4237988, -0.3958601, 0, 0.6156863, 1, 1,
0.1282723, 0.6087725, 0.4324731, 0, 0.6117647, 1, 1,
0.1289099, -2.4211, 4.992462, 0, 0.6039216, 1, 1,
0.1321639, -0.6638762, 3.676585, 0, 0.5960785, 1, 1,
0.1337975, 0.8301016, 1.260164, 0, 0.5921569, 1, 1,
0.1385641, -1.123506, 3.948149, 0, 0.5843138, 1, 1,
0.1398679, 1.218667, 0.0285325, 0, 0.5803922, 1, 1,
0.1401565, -1.471284, 2.586119, 0, 0.572549, 1, 1,
0.1446109, 1.331634, -1.966434, 0, 0.5686275, 1, 1,
0.1501503, 0.4719135, -0.3886324, 0, 0.5607843, 1, 1,
0.1526894, -1.388376, 1.150975, 0, 0.5568628, 1, 1,
0.1534269, -0.4213386, 0.4626409, 0, 0.5490196, 1, 1,
0.1555787, -0.08354127, 0.6514347, 0, 0.5450981, 1, 1,
0.1605161, -1.426843, 4.486454, 0, 0.5372549, 1, 1,
0.1616616, 0.4842888, 1.228366, 0, 0.5333334, 1, 1,
0.1645146, 0.5376166, 0.5971987, 0, 0.5254902, 1, 1,
0.1652822, -0.2533451, 2.302574, 0, 0.5215687, 1, 1,
0.1657273, 0.9798374, -1.220292, 0, 0.5137255, 1, 1,
0.1670316, 0.4095461, 1.694426, 0, 0.509804, 1, 1,
0.1716834, 2.587308, 1.408653, 0, 0.5019608, 1, 1,
0.1738299, 1.281787, 0.7958711, 0, 0.4941176, 1, 1,
0.1744921, 2.800424, -0.3685671, 0, 0.4901961, 1, 1,
0.181024, -0.2372814, 2.349876, 0, 0.4823529, 1, 1,
0.1828646, 0.1825903, 0.9717446, 0, 0.4784314, 1, 1,
0.1828884, 0.9062211, 0.2342275, 0, 0.4705882, 1, 1,
0.1836132, -0.4314308, -1.39193, 0, 0.4666667, 1, 1,
0.1850994, -0.9742403, 3.328639, 0, 0.4588235, 1, 1,
0.187319, 0.4941771, -0.2055831, 0, 0.454902, 1, 1,
0.1874122, 0.1728005, 1.101798, 0, 0.4470588, 1, 1,
0.1877308, 0.2374422, 1.384053, 0, 0.4431373, 1, 1,
0.1878433, 0.6918158, -0.161015, 0, 0.4352941, 1, 1,
0.1903276, 0.3087135, -0.7303179, 0, 0.4313726, 1, 1,
0.1904732, 0.9143291, -1.94899, 0, 0.4235294, 1, 1,
0.1949795, 0.3121715, -0.7248752, 0, 0.4196078, 1, 1,
0.1985536, -0.1164249, 0.3279598, 0, 0.4117647, 1, 1,
0.200923, 1.117941, 1.124323, 0, 0.4078431, 1, 1,
0.2033597, 0.5100272, 0.9200796, 0, 0.4, 1, 1,
0.2100361, 0.293888, 0.9140056, 0, 0.3921569, 1, 1,
0.2115293, -0.1589274, 1.44438, 0, 0.3882353, 1, 1,
0.2168891, -1.294979, 3.265433, 0, 0.3803922, 1, 1,
0.216967, -0.7440199, 2.382309, 0, 0.3764706, 1, 1,
0.2173482, 0.5214491, -0.3716621, 0, 0.3686275, 1, 1,
0.2201523, 1.102284, 0.6986211, 0, 0.3647059, 1, 1,
0.2254444, 1.573439, -1.082504, 0, 0.3568628, 1, 1,
0.2296472, -0.2182172, 4.378877, 0, 0.3529412, 1, 1,
0.2304363, 0.3799917, 0.5795723, 0, 0.345098, 1, 1,
0.2324056, -0.8506418, 2.646233, 0, 0.3411765, 1, 1,
0.2327672, 0.03288007, -1.431136, 0, 0.3333333, 1, 1,
0.2328739, 0.2368981, 0.4031582, 0, 0.3294118, 1, 1,
0.2344499, -0.2898094, 0.9621123, 0, 0.3215686, 1, 1,
0.238726, -0.07957581, 3.205788, 0, 0.3176471, 1, 1,
0.2438236, -0.2550682, 2.976177, 0, 0.3098039, 1, 1,
0.2442351, -1.240468, 1.514281, 0, 0.3058824, 1, 1,
0.2459547, -0.3361506, 1.985685, 0, 0.2980392, 1, 1,
0.246112, 1.266243, 1.000922, 0, 0.2901961, 1, 1,
0.2467985, -1.30909, 2.407681, 0, 0.2862745, 1, 1,
0.2477237, 0.0858914, -0.4627286, 0, 0.2784314, 1, 1,
0.2533525, 0.7513872, -0.454965, 0, 0.2745098, 1, 1,
0.2538235, 0.2036683, 0.3945391, 0, 0.2666667, 1, 1,
0.2551304, 1.210892, -0.8712218, 0, 0.2627451, 1, 1,
0.2589416, 0.4533001, -0.6892537, 0, 0.254902, 1, 1,
0.2590051, 0.3832982, -0.3857194, 0, 0.2509804, 1, 1,
0.2594914, -1.638694, 3.261567, 0, 0.2431373, 1, 1,
0.2619124, 0.07138763, 2.318618, 0, 0.2392157, 1, 1,
0.2621236, 0.4972418, -1.682613, 0, 0.2313726, 1, 1,
0.2630965, 0.2524398, 1.610691, 0, 0.227451, 1, 1,
0.2657854, 0.8453224, 0.105772, 0, 0.2196078, 1, 1,
0.2692232, 0.5975224, -0.5814032, 0, 0.2156863, 1, 1,
0.281675, 0.7704013, -1.304032, 0, 0.2078431, 1, 1,
0.2840356, -3.121816, 1.6841, 0, 0.2039216, 1, 1,
0.2898144, -1.09229, 1.371803, 0, 0.1960784, 1, 1,
0.2952322, -0.3612861, 3.836729, 0, 0.1882353, 1, 1,
0.296884, 0.848986, 1.247082, 0, 0.1843137, 1, 1,
0.2970004, -0.5924404, 2.845691, 0, 0.1764706, 1, 1,
0.2972233, 0.1771607, 1.931996, 0, 0.172549, 1, 1,
0.2983917, 0.9505872, -0.1306436, 0, 0.1647059, 1, 1,
0.2992282, 0.6319327, 0.7574962, 0, 0.1607843, 1, 1,
0.3009141, -0.6722565, 3.743176, 0, 0.1529412, 1, 1,
0.3021905, 1.952201, 1.457467, 0, 0.1490196, 1, 1,
0.3048635, -0.02427348, 2.149741, 0, 0.1411765, 1, 1,
0.3075166, 1.88057, -0.7373213, 0, 0.1372549, 1, 1,
0.3094163, 1.802013, 0.6666216, 0, 0.1294118, 1, 1,
0.3228236, -0.2551232, 0.6390927, 0, 0.1254902, 1, 1,
0.325954, 0.4725825, 0.8510235, 0, 0.1176471, 1, 1,
0.331192, -0.1706524, 1.154509, 0, 0.1137255, 1, 1,
0.3346587, 1.327577, 0.6499299, 0, 0.1058824, 1, 1,
0.3350292, 0.5776815, 0.3592226, 0, 0.09803922, 1, 1,
0.335403, 0.2289966, 1.960445, 0, 0.09411765, 1, 1,
0.3365713, 2.444025, -0.7995942, 0, 0.08627451, 1, 1,
0.3381274, 0.8899094, 0.1243601, 0, 0.08235294, 1, 1,
0.3383378, 0.8528879, -0.1393025, 0, 0.07450981, 1, 1,
0.3383569, -1.794665, 3.062794, 0, 0.07058824, 1, 1,
0.3405548, 0.4237005, 1.819337, 0, 0.0627451, 1, 1,
0.3445981, 0.423715, 2.334376, 0, 0.05882353, 1, 1,
0.3446641, -0.7534966, 3.157125, 0, 0.05098039, 1, 1,
0.3548613, -0.6813355, 1.332734, 0, 0.04705882, 1, 1,
0.3561641, -0.4829946, 2.263592, 0, 0.03921569, 1, 1,
0.3572267, -0.8909478, 1.627159, 0, 0.03529412, 1, 1,
0.3574471, 0.008570852, -0.1292984, 0, 0.02745098, 1, 1,
0.3578339, -1.098351, 1.545346, 0, 0.02352941, 1, 1,
0.3595704, 1.144815, -0.2488701, 0, 0.01568628, 1, 1,
0.3616952, -1.601835, 2.482768, 0, 0.01176471, 1, 1,
0.3647752, -1.389139, 3.068691, 0, 0.003921569, 1, 1,
0.3681031, 0.2862612, -0.5049757, 0.003921569, 0, 1, 1,
0.3686378, 0.9759248, -0.599664, 0.007843138, 0, 1, 1,
0.3687479, 0.5798129, 1.274727, 0.01568628, 0, 1, 1,
0.3728503, -1.915608, 1.750598, 0.01960784, 0, 1, 1,
0.3751735, 0.09370613, 0.1451919, 0.02745098, 0, 1, 1,
0.3837765, -1.859087, 4.221397, 0.03137255, 0, 1, 1,
0.3856524, 0.05695458, 0.4849848, 0.03921569, 0, 1, 1,
0.3892763, 0.07053053, 0.3405559, 0.04313726, 0, 1, 1,
0.3896585, -1.527018, 3.948509, 0.05098039, 0, 1, 1,
0.3915625, -2.041437, 3.874891, 0.05490196, 0, 1, 1,
0.3916709, 0.8841329, -0.2152918, 0.0627451, 0, 1, 1,
0.3926581, -0.4384155, 2.420584, 0.06666667, 0, 1, 1,
0.3938558, 0.1703103, 1.2446, 0.07450981, 0, 1, 1,
0.3948494, 0.1849495, 1.558575, 0.07843138, 0, 1, 1,
0.4022311, -2.818537, 1.850556, 0.08627451, 0, 1, 1,
0.4073333, 0.006274404, 1.257241, 0.09019608, 0, 1, 1,
0.4123377, 0.998151, 0.2009722, 0.09803922, 0, 1, 1,
0.4150932, 0.7629212, 0.5721675, 0.1058824, 0, 1, 1,
0.4165434, 0.795572, 1.554362, 0.1098039, 0, 1, 1,
0.4178338, 0.8556385, -0.1471847, 0.1176471, 0, 1, 1,
0.4179481, -0.8119212, 3.599444, 0.1215686, 0, 1, 1,
0.4195476, -1.860728, 2.841934, 0.1294118, 0, 1, 1,
0.4210995, 0.3527971, 0.7501044, 0.1333333, 0, 1, 1,
0.423115, 0.8584192, 2.128156, 0.1411765, 0, 1, 1,
0.4252841, -0.07099, 4.225506, 0.145098, 0, 1, 1,
0.427976, -0.4661361, 1.779404, 0.1529412, 0, 1, 1,
0.4301215, 0.5043491, 1.672287, 0.1568628, 0, 1, 1,
0.4314473, -0.9514794, 2.228062, 0.1647059, 0, 1, 1,
0.4336641, 0.2842911, 2.338566, 0.1686275, 0, 1, 1,
0.4344748, -0.4199584, 2.308406, 0.1764706, 0, 1, 1,
0.4427574, -0.4469138, 2.590436, 0.1803922, 0, 1, 1,
0.4458525, 1.433761, 2.069572, 0.1882353, 0, 1, 1,
0.4473319, -0.5675519, 1.364758, 0.1921569, 0, 1, 1,
0.4522012, -0.985322, 0.5644668, 0.2, 0, 1, 1,
0.4591106, 0.3022877, 1.34811, 0.2078431, 0, 1, 1,
0.4600372, 0.5230273, 1.687485, 0.2117647, 0, 1, 1,
0.4601068, 1.103841, -1.834212, 0.2196078, 0, 1, 1,
0.46343, 2.282068, -0.4132483, 0.2235294, 0, 1, 1,
0.4666363, 1.337744, 0.7136635, 0.2313726, 0, 1, 1,
0.4697063, -0.6729273, 3.261228, 0.2352941, 0, 1, 1,
0.4813262, -0.5061918, 2.282993, 0.2431373, 0, 1, 1,
0.4817996, 0.8587064, -1.532802, 0.2470588, 0, 1, 1,
0.4857852, -1.865748, 3.50533, 0.254902, 0, 1, 1,
0.4896947, -1.5394, 2.165185, 0.2588235, 0, 1, 1,
0.496207, -1.951914, 3.06084, 0.2666667, 0, 1, 1,
0.4999622, -0.797052, 3.262395, 0.2705882, 0, 1, 1,
0.4999917, 0.624429, 2.472868, 0.2784314, 0, 1, 1,
0.5077563, -1.376964, 1.743463, 0.282353, 0, 1, 1,
0.5093569, -1.027912, 3.127487, 0.2901961, 0, 1, 1,
0.5154482, 1.057618, 0.2726119, 0.2941177, 0, 1, 1,
0.5241141, 0.6348797, -0.6366748, 0.3019608, 0, 1, 1,
0.5252967, -1.134583, 0.367706, 0.3098039, 0, 1, 1,
0.5253435, -0.426443, 1.650475, 0.3137255, 0, 1, 1,
0.5253592, -1.072041, 2.462022, 0.3215686, 0, 1, 1,
0.5318151, 1.668218, 1.06889, 0.3254902, 0, 1, 1,
0.535951, 0.07675998, 1.756237, 0.3333333, 0, 1, 1,
0.5361483, 1.649588, 0.2190173, 0.3372549, 0, 1, 1,
0.5381078, -0.2484801, 2.549293, 0.345098, 0, 1, 1,
0.5398179, -0.3189467, 2.184524, 0.3490196, 0, 1, 1,
0.5437315, 0.7392591, -0.6643105, 0.3568628, 0, 1, 1,
0.5440407, 0.7055776, -0.579641, 0.3607843, 0, 1, 1,
0.5441951, 0.98357, -0.8411671, 0.3686275, 0, 1, 1,
0.5489195, 1.44901, 1.35123, 0.372549, 0, 1, 1,
0.5504165, -0.6051816, 2.925261, 0.3803922, 0, 1, 1,
0.5552188, 1.243118, -0.1710867, 0.3843137, 0, 1, 1,
0.5562676, 0.8388439, 0.4951524, 0.3921569, 0, 1, 1,
0.5589208, -0.0443135, 1.73416, 0.3960784, 0, 1, 1,
0.5590811, -0.3087552, 0.80839, 0.4039216, 0, 1, 1,
0.5641799, -0.3347773, 1.956415, 0.4117647, 0, 1, 1,
0.5647368, -0.3080637, 3.081177, 0.4156863, 0, 1, 1,
0.5727498, 1.117756, -0.4709259, 0.4235294, 0, 1, 1,
0.5733455, -1.094333, 2.464447, 0.427451, 0, 1, 1,
0.5768855, 2.015222, 0.5560611, 0.4352941, 0, 1, 1,
0.5822014, -1.104326, 2.572377, 0.4392157, 0, 1, 1,
0.58267, 0.1501448, 1.663116, 0.4470588, 0, 1, 1,
0.5856758, -2.770746, 3.140076, 0.4509804, 0, 1, 1,
0.5862783, 1.471592, 0.9381355, 0.4588235, 0, 1, 1,
0.5890747, -0.4202611, 4.272339, 0.4627451, 0, 1, 1,
0.6078012, -0.3328857, 1.095532, 0.4705882, 0, 1, 1,
0.6093068, -1.078743, 4.120888, 0.4745098, 0, 1, 1,
0.6105691, 0.01660173, 1.506982, 0.4823529, 0, 1, 1,
0.6151354, -1.753916, 2.096554, 0.4862745, 0, 1, 1,
0.6176974, 0.1406844, -0.002468221, 0.4941176, 0, 1, 1,
0.6182818, 0.6478375, 2.641536, 0.5019608, 0, 1, 1,
0.6192197, 2.010153, -0.6734573, 0.5058824, 0, 1, 1,
0.6194887, -0.3357545, 3.088812, 0.5137255, 0, 1, 1,
0.6197401, 1.413033, -0.4106355, 0.5176471, 0, 1, 1,
0.6208939, 0.08207741, 0.5787412, 0.5254902, 0, 1, 1,
0.6232445, 0.8002065, 1.217299, 0.5294118, 0, 1, 1,
0.6356258, -0.8543889, 2.382964, 0.5372549, 0, 1, 1,
0.6361321, -0.1957019, 1.706777, 0.5411765, 0, 1, 1,
0.6385798, 0.2032972, 0.4103374, 0.5490196, 0, 1, 1,
0.6388856, 1.629046, 0.4974662, 0.5529412, 0, 1, 1,
0.6404352, -1.272967, 2.587712, 0.5607843, 0, 1, 1,
0.6408284, 2.30168, 0.2712405, 0.5647059, 0, 1, 1,
0.6420748, 1.521079, 0.8504245, 0.572549, 0, 1, 1,
0.6434078, -0.6862807, 2.301928, 0.5764706, 0, 1, 1,
0.6438549, -2.300035, 1.038342, 0.5843138, 0, 1, 1,
0.6531208, -0.8345561, 1.810949, 0.5882353, 0, 1, 1,
0.6598116, 0.051542, -0.8235406, 0.5960785, 0, 1, 1,
0.6614879, -0.7681518, 0.9704041, 0.6039216, 0, 1, 1,
0.6619607, 0.7262227, 0.4582762, 0.6078432, 0, 1, 1,
0.6677761, -0.5135692, 2.913819, 0.6156863, 0, 1, 1,
0.6823538, 0.5823334, 0.5803718, 0.6196079, 0, 1, 1,
0.683827, -2.373124, 3.637296, 0.627451, 0, 1, 1,
0.6917881, 0.9060889, 0.3513103, 0.6313726, 0, 1, 1,
0.6967536, 0.6384763, 0.4231024, 0.6392157, 0, 1, 1,
0.6975303, -0.5193565, 2.209648, 0.6431373, 0, 1, 1,
0.700401, 0.27433, 1.534348, 0.6509804, 0, 1, 1,
0.7012722, -0.6090186, 2.483187, 0.654902, 0, 1, 1,
0.707552, -0.08830121, -0.8730969, 0.6627451, 0, 1, 1,
0.7100485, -0.2963065, 1.413268, 0.6666667, 0, 1, 1,
0.712487, 0.7639791, 0.8350692, 0.6745098, 0, 1, 1,
0.7134532, 0.09782869, 0.7161667, 0.6784314, 0, 1, 1,
0.7152406, 0.8743744, 1.335884, 0.6862745, 0, 1, 1,
0.7254534, -0.9376844, 3.23652, 0.6901961, 0, 1, 1,
0.7279699, -0.2684318, 2.414101, 0.6980392, 0, 1, 1,
0.7285833, 0.4580816, 1.787687, 0.7058824, 0, 1, 1,
0.7287614, -0.1687445, 0.02276163, 0.7098039, 0, 1, 1,
0.7294138, 0.196224, 2.092137, 0.7176471, 0, 1, 1,
0.732824, 1.066261, 1.615714, 0.7215686, 0, 1, 1,
0.735429, -0.1365207, 2.061523, 0.7294118, 0, 1, 1,
0.7360213, 1.317899, 0.321641, 0.7333333, 0, 1, 1,
0.7363865, -0.8541545, 3.091377, 0.7411765, 0, 1, 1,
0.7381061, 0.02571663, 1.599478, 0.7450981, 0, 1, 1,
0.7383508, 0.407668, 2.773161, 0.7529412, 0, 1, 1,
0.7400554, 0.3672943, 1.315287, 0.7568628, 0, 1, 1,
0.7427891, 0.3008621, 1.63327, 0.7647059, 0, 1, 1,
0.7446545, 0.6041738, -0.2367878, 0.7686275, 0, 1, 1,
0.748319, 0.1301201, 2.258233, 0.7764706, 0, 1, 1,
0.7576436, 0.3135917, 1.067957, 0.7803922, 0, 1, 1,
0.7579329, 0.6178644, 1.189619, 0.7882353, 0, 1, 1,
0.7652189, -0.7707646, 3.97037, 0.7921569, 0, 1, 1,
0.7681334, -0.1722996, 0.9478535, 0.8, 0, 1, 1,
0.7779651, -0.2699431, 2.561337, 0.8078431, 0, 1, 1,
0.7783952, -0.7785851, 2.380846, 0.8117647, 0, 1, 1,
0.7857324, -1.615276, 1.54413, 0.8196079, 0, 1, 1,
0.7872087, 0.7164455, 0.7202756, 0.8235294, 0, 1, 1,
0.7920511, 0.5733747, 1.595131, 0.8313726, 0, 1, 1,
0.792631, 0.5438156, 2.027907, 0.8352941, 0, 1, 1,
0.7953348, -1.201551, 3.063873, 0.8431373, 0, 1, 1,
0.79596, -0.8127565, 1.365362, 0.8470588, 0, 1, 1,
0.7963468, -0.7773595, 3.356402, 0.854902, 0, 1, 1,
0.7996312, -0.6176406, -0.2191624, 0.8588235, 0, 1, 1,
0.8000633, -0.1244411, 2.834064, 0.8666667, 0, 1, 1,
0.8028281, 0.7773249, -0.9225472, 0.8705882, 0, 1, 1,
0.8062648, 1.221054, 0.3478606, 0.8784314, 0, 1, 1,
0.807224, 1.306908, -0.7404802, 0.8823529, 0, 1, 1,
0.808569, 0.6289766, 0.7700267, 0.8901961, 0, 1, 1,
0.8172961, -0.2618938, 2.852473, 0.8941177, 0, 1, 1,
0.8298371, -0.9403365, 2.961971, 0.9019608, 0, 1, 1,
0.8339631, 0.5107295, 0.2656788, 0.9098039, 0, 1, 1,
0.837585, -0.6881673, 3.855999, 0.9137255, 0, 1, 1,
0.8440476, 0.50416, 1.482109, 0.9215686, 0, 1, 1,
0.844287, -0.2492087, 2.605878, 0.9254902, 0, 1, 1,
0.8470166, 0.2422612, 2.308049, 0.9333333, 0, 1, 1,
0.8505077, 0.9776654, -0.1249052, 0.9372549, 0, 1, 1,
0.8544202, -1.142778, 1.922077, 0.945098, 0, 1, 1,
0.8584805, -0.6703605, 3.059411, 0.9490196, 0, 1, 1,
0.858495, -0.05700055, 2.127877, 0.9568627, 0, 1, 1,
0.8615026, 0.4636197, 0.931566, 0.9607843, 0, 1, 1,
0.8647954, 0.7789379, -1.077541, 0.9686275, 0, 1, 1,
0.8673092, 0.7513817, 1.545554, 0.972549, 0, 1, 1,
0.8729444, 0.6409163, 0.8353273, 0.9803922, 0, 1, 1,
0.8735493, 0.8681666, -0.4169373, 0.9843137, 0, 1, 1,
0.8744634, -0.1566689, 1.304415, 0.9921569, 0, 1, 1,
0.8766398, -0.6437423, 3.034186, 0.9960784, 0, 1, 1,
0.8826286, -0.5315282, 1.825382, 1, 0, 0.9960784, 1,
0.8831181, -1.918325, 2.382158, 1, 0, 0.9882353, 1,
0.8910065, 0.6585074, -0.2033893, 1, 0, 0.9843137, 1,
0.8997774, -1.121961, 3.778064, 1, 0, 0.9764706, 1,
0.8999071, 1.135499, -0.08222239, 1, 0, 0.972549, 1,
0.9030573, 0.4705693, 1.616663, 1, 0, 0.9647059, 1,
0.9044996, -0.2128005, 2.602279, 1, 0, 0.9607843, 1,
0.9078041, -1.245082, 1.781161, 1, 0, 0.9529412, 1,
0.9099914, -0.6239725, 2.783497, 1, 0, 0.9490196, 1,
0.9130856, -0.6899849, 2.035495, 1, 0, 0.9411765, 1,
0.9176471, -1.227946, 0.9841362, 1, 0, 0.9372549, 1,
0.9226748, 0.5405267, 2.048687, 1, 0, 0.9294118, 1,
0.9329661, 0.5387834, 1.160965, 1, 0, 0.9254902, 1,
0.9349179, -0.1910101, 1.626219, 1, 0, 0.9176471, 1,
0.9445123, 0.2418878, 1.586127, 1, 0, 0.9137255, 1,
0.9468843, -0.06029959, 1.427605, 1, 0, 0.9058824, 1,
0.9478076, -1.413665, 3.521464, 1, 0, 0.9019608, 1,
0.9493805, -0.8429292, 3.458328, 1, 0, 0.8941177, 1,
0.9546739, 1.1722, 0.2914248, 1, 0, 0.8862745, 1,
0.9587609, -1.797866, 3.499427, 1, 0, 0.8823529, 1,
0.9610302, -0.8413908, 3.306438, 1, 0, 0.8745098, 1,
0.9619377, -0.1020374, 2.119071, 1, 0, 0.8705882, 1,
0.9636104, -0.154575, 3.221039, 1, 0, 0.8627451, 1,
0.9643202, -0.1731021, 0.8680551, 1, 0, 0.8588235, 1,
0.9651421, 0.6037902, 3.2931, 1, 0, 0.8509804, 1,
0.9686164, 0.08301885, 1.66419, 1, 0, 0.8470588, 1,
0.9786267, 0.9571866, -0.02312419, 1, 0, 0.8392157, 1,
0.9840173, 0.7608358, 0.4197874, 1, 0, 0.8352941, 1,
0.9879453, -0.4250925, 1.703405, 1, 0, 0.827451, 1,
0.9956684, -0.9916002, 2.319208, 1, 0, 0.8235294, 1,
0.9997667, 0.487033, 0.4369706, 1, 0, 0.8156863, 1,
1.010929, -0.5883012, 0.8178648, 1, 0, 0.8117647, 1,
1.015817, 1.241043, -1.607741, 1, 0, 0.8039216, 1,
1.017878, -1.544468, 4.365804, 1, 0, 0.7960784, 1,
1.021645, -0.2585797, 2.568866, 1, 0, 0.7921569, 1,
1.027497, -0.6218585, 2.022125, 1, 0, 0.7843137, 1,
1.029789, -0.8966628, 0.2187396, 1, 0, 0.7803922, 1,
1.03103, -0.2720025, 2.307795, 1, 0, 0.772549, 1,
1.032174, 1.04831, -0.2958001, 1, 0, 0.7686275, 1,
1.042551, 1.357303, -0.04729782, 1, 0, 0.7607843, 1,
1.050542, 0.6846377, 1.158849, 1, 0, 0.7568628, 1,
1.061027, -0.9986565, 2.396178, 1, 0, 0.7490196, 1,
1.077554, -0.162672, 2.429757, 1, 0, 0.7450981, 1,
1.082163, 0.9617847, 1.684813, 1, 0, 0.7372549, 1,
1.092654, 1.075813, 1.61822, 1, 0, 0.7333333, 1,
1.093393, 1.856914, 0.7020301, 1, 0, 0.7254902, 1,
1.104776, 0.2735226, 0.1658465, 1, 0, 0.7215686, 1,
1.108492, 0.8334012, 3.34587, 1, 0, 0.7137255, 1,
1.113165, -0.5722401, -0.113134, 1, 0, 0.7098039, 1,
1.128548, 0.6851875, 1.342767, 1, 0, 0.7019608, 1,
1.129492, 0.8295305, 0.1219945, 1, 0, 0.6941177, 1,
1.130226, -0.1019049, 1.142669, 1, 0, 0.6901961, 1,
1.131083, -0.3127284, 0.922408, 1, 0, 0.682353, 1,
1.138742, 0.05083712, 1.079295, 1, 0, 0.6784314, 1,
1.146814, -0.7368311, 2.627007, 1, 0, 0.6705883, 1,
1.147174, 1.052233, 0.9960762, 1, 0, 0.6666667, 1,
1.150155, 0.1332053, 3.70088, 1, 0, 0.6588235, 1,
1.172915, -0.5472721, 2.759283, 1, 0, 0.654902, 1,
1.173387, 1.321697, 0.5565723, 1, 0, 0.6470588, 1,
1.175568, -0.6021848, 2.135045, 1, 0, 0.6431373, 1,
1.182881, 2.352767, 0.7250785, 1, 0, 0.6352941, 1,
1.202482, 0.4649504, -0.03120417, 1, 0, 0.6313726, 1,
1.202685, -1.062157, 2.388098, 1, 0, 0.6235294, 1,
1.204483, -0.2710119, 2.661935, 1, 0, 0.6196079, 1,
1.205149, -1.569992, 3.234984, 1, 0, 0.6117647, 1,
1.208279, -1.487826, 2.742294, 1, 0, 0.6078432, 1,
1.211241, -0.3330908, 0.4888119, 1, 0, 0.6, 1,
1.21766, 0.3903567, 1.669, 1, 0, 0.5921569, 1,
1.217963, -0.1304731, 0.9312761, 1, 0, 0.5882353, 1,
1.22897, -0.3641633, 2.38941, 1, 0, 0.5803922, 1,
1.230803, -0.5063713, 2.691474, 1, 0, 0.5764706, 1,
1.247209, 1.567147, -1.089699, 1, 0, 0.5686275, 1,
1.260788, -1.446777, 2.449067, 1, 0, 0.5647059, 1,
1.266596, 0.2652031, 1.884166, 1, 0, 0.5568628, 1,
1.26907, 0.2864822, 1.463606, 1, 0, 0.5529412, 1,
1.272193, -0.3708835, 1.215174, 1, 0, 0.5450981, 1,
1.298378, 0.5048458, 0.6087059, 1, 0, 0.5411765, 1,
1.299137, 0.3733571, 0.3669626, 1, 0, 0.5333334, 1,
1.300296, 0.9400097, -1.038664, 1, 0, 0.5294118, 1,
1.300772, -1.653104, 3.632877, 1, 0, 0.5215687, 1,
1.311124, 1.891452, 1.022567, 1, 0, 0.5176471, 1,
1.322609, 0.4628055, 1.061151, 1, 0, 0.509804, 1,
1.338501, -1.596897, 3.727985, 1, 0, 0.5058824, 1,
1.350491, -0.2681306, 1.156446, 1, 0, 0.4980392, 1,
1.351221, 0.5147959, 1.898995, 1, 0, 0.4901961, 1,
1.370992, -0.5050434, 3.487309, 1, 0, 0.4862745, 1,
1.374934, -2.166963, 3.323367, 1, 0, 0.4784314, 1,
1.375384, -0.2844309, 0.4533984, 1, 0, 0.4745098, 1,
1.377285, 0.2836536, 2.592514, 1, 0, 0.4666667, 1,
1.393631, 1.395833, 0.8756751, 1, 0, 0.4627451, 1,
1.399556, -0.6792489, 2.335987, 1, 0, 0.454902, 1,
1.400749, 0.3089062, 3.01851, 1, 0, 0.4509804, 1,
1.40234, 1.932928, 0.1968503, 1, 0, 0.4431373, 1,
1.403171, -1.857222, 3.262447, 1, 0, 0.4392157, 1,
1.424497, -0.1871023, 1.52691, 1, 0, 0.4313726, 1,
1.434187, -0.2285062, 1.41191, 1, 0, 0.427451, 1,
1.440464, 0.3406038, 2.574285, 1, 0, 0.4196078, 1,
1.446389, 0.8720406, 2.241348, 1, 0, 0.4156863, 1,
1.455243, -0.108432, 1.318103, 1, 0, 0.4078431, 1,
1.457478, 1.176906, 0.408785, 1, 0, 0.4039216, 1,
1.459897, -1.3277, 2.015728, 1, 0, 0.3960784, 1,
1.461858, 0.5764207, 1.647, 1, 0, 0.3882353, 1,
1.473622, -0.9315926, 2.83443, 1, 0, 0.3843137, 1,
1.476561, -1.481857, 2.881894, 1, 0, 0.3764706, 1,
1.488701, -0.2392626, 2.385195, 1, 0, 0.372549, 1,
1.506509, -1.07433, 1.559718, 1, 0, 0.3647059, 1,
1.512621, 0.9957003, 1.676299, 1, 0, 0.3607843, 1,
1.54508, -0.3451931, 1.797651, 1, 0, 0.3529412, 1,
1.546751, -2.07573, 1.609023, 1, 0, 0.3490196, 1,
1.552909, 0.7635586, 0.6237381, 1, 0, 0.3411765, 1,
1.555139, -0.06483497, -0.009044535, 1, 0, 0.3372549, 1,
1.559015, 0.569934, 2.122945, 1, 0, 0.3294118, 1,
1.571485, -0.3274004, 1.300836, 1, 0, 0.3254902, 1,
1.588099, 0.435682, 2.241118, 1, 0, 0.3176471, 1,
1.59573, -0.8041296, 2.23993, 1, 0, 0.3137255, 1,
1.607613, 0.8287778, 4.025952, 1, 0, 0.3058824, 1,
1.608338, -0.9357143, 1.36956, 1, 0, 0.2980392, 1,
1.622115, 1.057896, 1.005274, 1, 0, 0.2941177, 1,
1.622799, 1.491623, -0.02994511, 1, 0, 0.2862745, 1,
1.637037, 0.6952136, 1.911422, 1, 0, 0.282353, 1,
1.64295, 2.317123, 0.3424818, 1, 0, 0.2745098, 1,
1.651104, -2.215422, 1.766353, 1, 0, 0.2705882, 1,
1.673227, -0.9635244, 4.014921, 1, 0, 0.2627451, 1,
1.680078, 0.9138843, -0.395886, 1, 0, 0.2588235, 1,
1.691386, 0.1395558, 3.464031, 1, 0, 0.2509804, 1,
1.71113, -0.8778642, 4.2694, 1, 0, 0.2470588, 1,
1.728695, -1.408658, 2.045147, 1, 0, 0.2392157, 1,
1.73104, 1.286164, 1.467366, 1, 0, 0.2352941, 1,
1.737206, 1.821636, 0.4928805, 1, 0, 0.227451, 1,
1.738384, 0.5842474, -0.2960441, 1, 0, 0.2235294, 1,
1.811651, -1.265325, 3.121919, 1, 0, 0.2156863, 1,
1.815381, -0.1879785, 1.083241, 1, 0, 0.2117647, 1,
1.826344, 2.264821, 0.7457373, 1, 0, 0.2039216, 1,
1.833925, 0.1025928, 2.291311, 1, 0, 0.1960784, 1,
1.83691, 0.4409592, 1.642218, 1, 0, 0.1921569, 1,
1.84846, 0.7061496, 0.3034678, 1, 0, 0.1843137, 1,
1.861715, -0.9084169, 1.21726, 1, 0, 0.1803922, 1,
1.871631, 0.2492033, 2.258953, 1, 0, 0.172549, 1,
1.87811, -0.5868007, 3.65388, 1, 0, 0.1686275, 1,
1.969695, 0.7767029, 1.790186, 1, 0, 0.1607843, 1,
1.980872, -1.751529, 2.705156, 1, 0, 0.1568628, 1,
1.982298, -0.0913462, 0.1922375, 1, 0, 0.1490196, 1,
1.994819, 1.149454, 0.5508816, 1, 0, 0.145098, 1,
1.995779, 1.472893, 1.121415, 1, 0, 0.1372549, 1,
2.051009, 0.2709255, 2.397449, 1, 0, 0.1333333, 1,
2.074076, 0.5189815, 2.568261, 1, 0, 0.1254902, 1,
2.077756, -0.4419563, -1.953924, 1, 0, 0.1215686, 1,
2.084145, -1.562988, 1.895007, 1, 0, 0.1137255, 1,
2.107054, -2.044433, 1.394439, 1, 0, 0.1098039, 1,
2.11307, 0.01233704, 2.8173, 1, 0, 0.1019608, 1,
2.186877, -0.8384891, 2.376724, 1, 0, 0.09411765, 1,
2.194829, 0.06058539, 1.381235, 1, 0, 0.09019608, 1,
2.226795, -1.924184, 3.177311, 1, 0, 0.08235294, 1,
2.270039, -0.2043373, 1.10009, 1, 0, 0.07843138, 1,
2.288109, 0.500899, 1.410068, 1, 0, 0.07058824, 1,
2.309222, 2.224466, 2.730253, 1, 0, 0.06666667, 1,
2.322106, 0.405088, 1.144694, 1, 0, 0.05882353, 1,
2.371465, 0.7828624, 1.546943, 1, 0, 0.05490196, 1,
2.385014, 0.2177676, 1.961606, 1, 0, 0.04705882, 1,
2.399312, -3.049877, 2.288408, 1, 0, 0.04313726, 1,
2.422711, 0.5281699, 0.8754139, 1, 0, 0.03529412, 1,
2.51436, 1.952333, 0.7321176, 1, 0, 0.03137255, 1,
2.528037, 1.002678, 1.183823, 1, 0, 0.02352941, 1,
2.569928, 0.1990216, 1.455206, 1, 0, 0.01960784, 1,
2.606561, -0.9872673, 1.946654, 1, 0, 0.01176471, 1,
2.623129, 1.456008, 0.5113952, 1, 0, 0.007843138, 1
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
-0.4214311, -4.169588, -7.665789, 0, -0.5, 0.5, 0.5,
-0.4214311, -4.169588, -7.665789, 1, -0.5, 0.5, 0.5,
-0.4214311, -4.169588, -7.665789, 1, 1.5, 0.5, 0.5,
-0.4214311, -4.169588, -7.665789, 0, 1.5, 0.5, 0.5
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
-4.498097, -0.03104401, -7.665789, 0, -0.5, 0.5, 0.5,
-4.498097, -0.03104401, -7.665789, 1, -0.5, 0.5, 0.5,
-4.498097, -0.03104401, -7.665789, 1, 1.5, 0.5, 0.5,
-4.498097, -0.03104401, -7.665789, 0, 1.5, 0.5, 0.5
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
-4.498097, -4.169588, -0.4193594, 0, -0.5, 0.5, 0.5,
-4.498097, -4.169588, -0.4193594, 1, -0.5, 0.5, 0.5,
-4.498097, -4.169588, -0.4193594, 1, 1.5, 0.5, 0.5,
-4.498097, -4.169588, -0.4193594, 0, 1.5, 0.5, 0.5
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
-3, -3.21454, -5.993536,
2, -3.21454, -5.993536,
-3, -3.21454, -5.993536,
-3, -3.373714, -6.272244,
-2, -3.21454, -5.993536,
-2, -3.373714, -6.272244,
-1, -3.21454, -5.993536,
-1, -3.373714, -6.272244,
0, -3.21454, -5.993536,
0, -3.373714, -6.272244,
1, -3.21454, -5.993536,
1, -3.373714, -6.272244,
2, -3.21454, -5.993536,
2, -3.373714, -6.272244
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
-3, -3.692064, -6.829662, 0, -0.5, 0.5, 0.5,
-3, -3.692064, -6.829662, 1, -0.5, 0.5, 0.5,
-3, -3.692064, -6.829662, 1, 1.5, 0.5, 0.5,
-3, -3.692064, -6.829662, 0, 1.5, 0.5, 0.5,
-2, -3.692064, -6.829662, 0, -0.5, 0.5, 0.5,
-2, -3.692064, -6.829662, 1, -0.5, 0.5, 0.5,
-2, -3.692064, -6.829662, 1, 1.5, 0.5, 0.5,
-2, -3.692064, -6.829662, 0, 1.5, 0.5, 0.5,
-1, -3.692064, -6.829662, 0, -0.5, 0.5, 0.5,
-1, -3.692064, -6.829662, 1, -0.5, 0.5, 0.5,
-1, -3.692064, -6.829662, 1, 1.5, 0.5, 0.5,
-1, -3.692064, -6.829662, 0, 1.5, 0.5, 0.5,
0, -3.692064, -6.829662, 0, -0.5, 0.5, 0.5,
0, -3.692064, -6.829662, 1, -0.5, 0.5, 0.5,
0, -3.692064, -6.829662, 1, 1.5, 0.5, 0.5,
0, -3.692064, -6.829662, 0, 1.5, 0.5, 0.5,
1, -3.692064, -6.829662, 0, -0.5, 0.5, 0.5,
1, -3.692064, -6.829662, 1, -0.5, 0.5, 0.5,
1, -3.692064, -6.829662, 1, 1.5, 0.5, 0.5,
1, -3.692064, -6.829662, 0, 1.5, 0.5, 0.5,
2, -3.692064, -6.829662, 0, -0.5, 0.5, 0.5,
2, -3.692064, -6.829662, 1, -0.5, 0.5, 0.5,
2, -3.692064, -6.829662, 1, 1.5, 0.5, 0.5,
2, -3.692064, -6.829662, 0, 1.5, 0.5, 0.5
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
-3.557328, -3, -5.993536,
-3.557328, 3, -5.993536,
-3.557328, -3, -5.993536,
-3.714123, -3, -6.272244,
-3.557328, -2, -5.993536,
-3.714123, -2, -6.272244,
-3.557328, -1, -5.993536,
-3.714123, -1, -6.272244,
-3.557328, 0, -5.993536,
-3.714123, 0, -6.272244,
-3.557328, 1, -5.993536,
-3.714123, 1, -6.272244,
-3.557328, 2, -5.993536,
-3.714123, 2, -6.272244,
-3.557328, 3, -5.993536,
-3.714123, 3, -6.272244
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
-4.027713, -3, -6.829662, 0, -0.5, 0.5, 0.5,
-4.027713, -3, -6.829662, 1, -0.5, 0.5, 0.5,
-4.027713, -3, -6.829662, 1, 1.5, 0.5, 0.5,
-4.027713, -3, -6.829662, 0, 1.5, 0.5, 0.5,
-4.027713, -2, -6.829662, 0, -0.5, 0.5, 0.5,
-4.027713, -2, -6.829662, 1, -0.5, 0.5, 0.5,
-4.027713, -2, -6.829662, 1, 1.5, 0.5, 0.5,
-4.027713, -2, -6.829662, 0, 1.5, 0.5, 0.5,
-4.027713, -1, -6.829662, 0, -0.5, 0.5, 0.5,
-4.027713, -1, -6.829662, 1, -0.5, 0.5, 0.5,
-4.027713, -1, -6.829662, 1, 1.5, 0.5, 0.5,
-4.027713, -1, -6.829662, 0, 1.5, 0.5, 0.5,
-4.027713, 0, -6.829662, 0, -0.5, 0.5, 0.5,
-4.027713, 0, -6.829662, 1, -0.5, 0.5, 0.5,
-4.027713, 0, -6.829662, 1, 1.5, 0.5, 0.5,
-4.027713, 0, -6.829662, 0, 1.5, 0.5, 0.5,
-4.027713, 1, -6.829662, 0, -0.5, 0.5, 0.5,
-4.027713, 1, -6.829662, 1, -0.5, 0.5, 0.5,
-4.027713, 1, -6.829662, 1, 1.5, 0.5, 0.5,
-4.027713, 1, -6.829662, 0, 1.5, 0.5, 0.5,
-4.027713, 2, -6.829662, 0, -0.5, 0.5, 0.5,
-4.027713, 2, -6.829662, 1, -0.5, 0.5, 0.5,
-4.027713, 2, -6.829662, 1, 1.5, 0.5, 0.5,
-4.027713, 2, -6.829662, 0, 1.5, 0.5, 0.5,
-4.027713, 3, -6.829662, 0, -0.5, 0.5, 0.5,
-4.027713, 3, -6.829662, 1, -0.5, 0.5, 0.5,
-4.027713, 3, -6.829662, 1, 1.5, 0.5, 0.5,
-4.027713, 3, -6.829662, 0, 1.5, 0.5, 0.5
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
-3.557328, -3.21454, -4,
-3.557328, -3.21454, 4,
-3.557328, -3.21454, -4,
-3.714123, -3.373714, -4,
-3.557328, -3.21454, -2,
-3.714123, -3.373714, -2,
-3.557328, -3.21454, 0,
-3.714123, -3.373714, 0,
-3.557328, -3.21454, 2,
-3.714123, -3.373714, 2,
-3.557328, -3.21454, 4,
-3.714123, -3.373714, 4
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
-4.027713, -3.692064, -4, 0, -0.5, 0.5, 0.5,
-4.027713, -3.692064, -4, 1, -0.5, 0.5, 0.5,
-4.027713, -3.692064, -4, 1, 1.5, 0.5, 0.5,
-4.027713, -3.692064, -4, 0, 1.5, 0.5, 0.5,
-4.027713, -3.692064, -2, 0, -0.5, 0.5, 0.5,
-4.027713, -3.692064, -2, 1, -0.5, 0.5, 0.5,
-4.027713, -3.692064, -2, 1, 1.5, 0.5, 0.5,
-4.027713, -3.692064, -2, 0, 1.5, 0.5, 0.5,
-4.027713, -3.692064, 0, 0, -0.5, 0.5, 0.5,
-4.027713, -3.692064, 0, 1, -0.5, 0.5, 0.5,
-4.027713, -3.692064, 0, 1, 1.5, 0.5, 0.5,
-4.027713, -3.692064, 0, 0, 1.5, 0.5, 0.5,
-4.027713, -3.692064, 2, 0, -0.5, 0.5, 0.5,
-4.027713, -3.692064, 2, 1, -0.5, 0.5, 0.5,
-4.027713, -3.692064, 2, 1, 1.5, 0.5, 0.5,
-4.027713, -3.692064, 2, 0, 1.5, 0.5, 0.5,
-4.027713, -3.692064, 4, 0, -0.5, 0.5, 0.5,
-4.027713, -3.692064, 4, 1, -0.5, 0.5, 0.5,
-4.027713, -3.692064, 4, 1, 1.5, 0.5, 0.5,
-4.027713, -3.692064, 4, 0, 1.5, 0.5, 0.5
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
-3.557328, -3.21454, -5.993536,
-3.557328, 3.152452, -5.993536,
-3.557328, -3.21454, 5.154817,
-3.557328, 3.152452, 5.154817,
-3.557328, -3.21454, -5.993536,
-3.557328, -3.21454, 5.154817,
-3.557328, 3.152452, -5.993536,
-3.557328, 3.152452, 5.154817,
-3.557328, -3.21454, -5.993536,
2.714466, -3.21454, -5.993536,
-3.557328, -3.21454, 5.154817,
2.714466, -3.21454, 5.154817,
-3.557328, 3.152452, -5.993536,
2.714466, 3.152452, -5.993536,
-3.557328, 3.152452, 5.154817,
2.714466, 3.152452, 5.154817,
2.714466, -3.21454, -5.993536,
2.714466, 3.152452, -5.993536,
2.714466, -3.21454, 5.154817,
2.714466, 3.152452, 5.154817,
2.714466, -3.21454, -5.993536,
2.714466, -3.21454, 5.154817,
2.714466, 3.152452, -5.993536,
2.714466, 3.152452, 5.154817
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
var radius = 7.629754;
var distance = 33.94564;
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
mvMatrix.translate( 0.4214311, 0.03104401, 0.4193594 );
mvMatrix.scale( 1.315324, 1.295657, 0.7399694 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94564);
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
C10H9ClN4S<-read.table("C10H9ClN4S.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-C10H9ClN4S$V2
```

```
## Error in eval(expr, envir, enclos): object 'C10H9ClN4S' not found
```

```r
y<-C10H9ClN4S$V3
```

```
## Error in eval(expr, envir, enclos): object 'C10H9ClN4S' not found
```

```r
z<-C10H9ClN4S$V4
```

```
## Error in eval(expr, envir, enclos): object 'C10H9ClN4S' not found
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
-3.465991, -0.1938345, -1.837519, 0, 0, 1, 1, 1,
-3.046757, 0.5522447, -0.936738, 1, 0, 0, 1, 1,
-2.765378, 0.2912059, -3.18687, 1, 0, 0, 1, 1,
-2.685122, 1.328994, -0.5719056, 1, 0, 0, 1, 1,
-2.620178, 0.5567944, -1.989043, 1, 0, 0, 1, 1,
-2.595405, -1.251814, -4.118142, 1, 0, 0, 1, 1,
-2.5262, 0.1770907, -0.493807, 0, 0, 0, 1, 1,
-2.302069, -0.4774143, -0.7112541, 0, 0, 0, 1, 1,
-2.267989, 0.9826418, 1.003093, 0, 0, 0, 1, 1,
-2.24914, 1.443315, -0.4948294, 0, 0, 0, 1, 1,
-2.219341, -1.975202, -1.642416, 0, 0, 0, 1, 1,
-2.167331, 1.757844, -1.522135, 0, 0, 0, 1, 1,
-2.162907, 0.745527, -0.357323, 0, 0, 0, 1, 1,
-2.142769, -1.798663, -3.02906, 1, 1, 1, 1, 1,
-2.08316, -0.03283567, -0.2726118, 1, 1, 1, 1, 1,
-2.075216, 0.5176713, 0.2406752, 1, 1, 1, 1, 1,
-2.057769, -0.4100437, -2.004389, 1, 1, 1, 1, 1,
-1.97961, 0.743592, -1.114668, 1, 1, 1, 1, 1,
-1.971065, 1.491843, -1.625899, 1, 1, 1, 1, 1,
-1.938813, 0.7518385, -0.8424671, 1, 1, 1, 1, 1,
-1.934074, -0.6145812, -2.002265, 1, 1, 1, 1, 1,
-1.928993, -0.605553, -1.958564, 1, 1, 1, 1, 1,
-1.926785, 1.593332, -0.1934593, 1, 1, 1, 1, 1,
-1.919455, 0.4839048, 1.830662, 1, 1, 1, 1, 1,
-1.904071, -0.02302528, -0.1230264, 1, 1, 1, 1, 1,
-1.903987, 0.4657333, -0.1972573, 1, 1, 1, 1, 1,
-1.897272, -0.08724464, -1.574754, 1, 1, 1, 1, 1,
-1.894744, 0.8093534, -1.743651, 1, 1, 1, 1, 1,
-1.889514, -0.3389082, -1.581928, 0, 0, 1, 1, 1,
-1.887779, 0.5877573, -1.872082, 1, 0, 0, 1, 1,
-1.884256, -0.325847, -1.876374, 1, 0, 0, 1, 1,
-1.870522, -1.145627, -3.12154, 1, 0, 0, 1, 1,
-1.849164, 0.714572, -0.979431, 1, 0, 0, 1, 1,
-1.845704, 0.3546762, -1.978389, 1, 0, 0, 1, 1,
-1.823569, -1.371005, -2.476368, 0, 0, 0, 1, 1,
-1.804501, 0.7340229, -2.114455, 0, 0, 0, 1, 1,
-1.76918, -0.8496249, -2.507601, 0, 0, 0, 1, 1,
-1.766852, 0.6449744, -1.306176, 0, 0, 0, 1, 1,
-1.760785, 2.007941, -1.332487, 0, 0, 0, 1, 1,
-1.738728, 1.123563, 0.2302772, 0, 0, 0, 1, 1,
-1.736413, -0.4621939, -0.4789247, 0, 0, 0, 1, 1,
-1.731297, 1.119889, -0.0160948, 1, 1, 1, 1, 1,
-1.721587, 0.03004009, -0.180624, 1, 1, 1, 1, 1,
-1.705752, -0.3334048, -2.630728, 1, 1, 1, 1, 1,
-1.702209, 0.1282083, -2.073998, 1, 1, 1, 1, 1,
-1.693698, -1.379295, -2.399668, 1, 1, 1, 1, 1,
-1.68029, 0.2946348, 0.04483075, 1, 1, 1, 1, 1,
-1.65587, -0.283448, -0.1355834, 1, 1, 1, 1, 1,
-1.645815, 0.7029925, -0.6535811, 1, 1, 1, 1, 1,
-1.614815, 0.4428128, 0.180447, 1, 1, 1, 1, 1,
-1.612649, -1.983992, -3.430921, 1, 1, 1, 1, 1,
-1.610148, 0.8410927, -0.4609287, 1, 1, 1, 1, 1,
-1.600562, 1.99247, -1.147374, 1, 1, 1, 1, 1,
-1.598155, 0.5104185, -1.497827, 1, 1, 1, 1, 1,
-1.588335, -0.4257689, -1.482711, 1, 1, 1, 1, 1,
-1.584272, -1.523941, -2.899412, 1, 1, 1, 1, 1,
-1.576792, -0.9541761, -1.027344, 0, 0, 1, 1, 1,
-1.576058, -1.000721, -3.752246, 1, 0, 0, 1, 1,
-1.568825, 0.8689263, -0.6216935, 1, 0, 0, 1, 1,
-1.555746, 0.8727174, -1.408736, 1, 0, 0, 1, 1,
-1.542884, -0.1620249, -3.124683, 1, 0, 0, 1, 1,
-1.523936, -0.4054825, -2.668011, 1, 0, 0, 1, 1,
-1.515641, 2.517695, -0.7679337, 0, 0, 0, 1, 1,
-1.504975, -0.5788565, -3.277271, 0, 0, 0, 1, 1,
-1.503329, -0.5940228, -2.523617, 0, 0, 0, 1, 1,
-1.502295, -0.5929205, -2.872758, 0, 0, 0, 1, 1,
-1.499513, -0.3008688, 0.06981266, 0, 0, 0, 1, 1,
-1.498544, -0.4977577, -1.98913, 0, 0, 0, 1, 1,
-1.493189, 0.295411, -2.445056, 0, 0, 0, 1, 1,
-1.487397, -1.403665, -1.278764, 1, 1, 1, 1, 1,
-1.478219, -0.2667788, 0.3342496, 1, 1, 1, 1, 1,
-1.473847, -1.158467, -2.708757, 1, 1, 1, 1, 1,
-1.471368, -0.2578275, -2.189689, 1, 1, 1, 1, 1,
-1.462923, 0.273674, -2.253617, 1, 1, 1, 1, 1,
-1.457111, -0.5494817, -2.241882, 1, 1, 1, 1, 1,
-1.438949, 0.4482977, -1.060128, 1, 1, 1, 1, 1,
-1.435144, 0.09142049, -0.4981805, 1, 1, 1, 1, 1,
-1.417843, -2.121447, -3.273212, 1, 1, 1, 1, 1,
-1.412235, 0.9021195, -2.055822, 1, 1, 1, 1, 1,
-1.40849, 0.0679359, -3.139783, 1, 1, 1, 1, 1,
-1.407406, 1.133157, -1.005606, 1, 1, 1, 1, 1,
-1.403092, 0.4809469, -3.732813, 1, 1, 1, 1, 1,
-1.394416, -2.098358, -2.537916, 1, 1, 1, 1, 1,
-1.381529, 0.07979301, -2.878237, 1, 1, 1, 1, 1,
-1.370652, 0.1899907, -1.169075, 0, 0, 1, 1, 1,
-1.357318, 0.2687967, -0.9541212, 1, 0, 0, 1, 1,
-1.356381, -0.8128619, -1.13764, 1, 0, 0, 1, 1,
-1.347168, -0.8425633, -2.038919, 1, 0, 0, 1, 1,
-1.34548, -1.293702, -1.685767, 1, 0, 0, 1, 1,
-1.342096, -0.6593338, -3.103578, 1, 0, 0, 1, 1,
-1.329737, 1.751888, -0.9298302, 0, 0, 0, 1, 1,
-1.317101, -0.3587587, -0.3157395, 0, 0, 0, 1, 1,
-1.315078, -0.7744791, -2.753428, 0, 0, 0, 1, 1,
-1.31476, 0.1900063, -0.6741266, 0, 0, 0, 1, 1,
-1.311705, 0.3573367, -0.894927, 0, 0, 0, 1, 1,
-1.310378, 0.3458045, -1.047405, 0, 0, 0, 1, 1,
-1.30871, -2.365919, -3.384831, 0, 0, 0, 1, 1,
-1.300657, -1.547679, -2.407344, 1, 1, 1, 1, 1,
-1.287776, 0.581484, 0.6244084, 1, 1, 1, 1, 1,
-1.284817, -0.3835422, -0.0627488, 1, 1, 1, 1, 1,
-1.284296, 1.292472, -0.4487826, 1, 1, 1, 1, 1,
-1.280495, -0.9751213, -3.991574, 1, 1, 1, 1, 1,
-1.279655, -0.7444618, -2.183537, 1, 1, 1, 1, 1,
-1.275373, -0.652193, -0.7300715, 1, 1, 1, 1, 1,
-1.272948, 1.640206, -0.6870842, 1, 1, 1, 1, 1,
-1.266587, -1.686232, -2.51241, 1, 1, 1, 1, 1,
-1.266163, -0.4435305, -2.264364, 1, 1, 1, 1, 1,
-1.266049, -0.9760539, -1.069428, 1, 1, 1, 1, 1,
-1.252274, 0.04374623, -1.47922, 1, 1, 1, 1, 1,
-1.244978, 1.074543, -2.504285, 1, 1, 1, 1, 1,
-1.239733, 0.8440085, -0.5487093, 1, 1, 1, 1, 1,
-1.234042, -0.565871, -2.426063, 1, 1, 1, 1, 1,
-1.218779, 0.4546219, -2.335762, 0, 0, 1, 1, 1,
-1.209213, 1.156217, -2.570632, 1, 0, 0, 1, 1,
-1.208551, -0.8273357, -1.782582, 1, 0, 0, 1, 1,
-1.207178, 2.009962, 0.09624866, 1, 0, 0, 1, 1,
-1.20264, 1.471978, -1.024574, 1, 0, 0, 1, 1,
-1.200132, -1.926167, -4.639813, 1, 0, 0, 1, 1,
-1.192688, 0.5705507, -1.347379, 0, 0, 0, 1, 1,
-1.190345, -1.510098, -4.434183, 0, 0, 0, 1, 1,
-1.185415, 0.2378077, -1.317731, 0, 0, 0, 1, 1,
-1.180706, 0.8814945, -1.392553, 0, 0, 0, 1, 1,
-1.174997, -1.667992, -0.6500031, 0, 0, 0, 1, 1,
-1.173, 0.490609, -0.5739529, 0, 0, 0, 1, 1,
-1.171294, 0.3550373, -1.035636, 0, 0, 0, 1, 1,
-1.167793, -1.103173, -1.239418, 1, 1, 1, 1, 1,
-1.167317, -0.884114, -2.239029, 1, 1, 1, 1, 1,
-1.159322, -1.128657, -2.378165, 1, 1, 1, 1, 1,
-1.157834, 0.7965107, -0.5352183, 1, 1, 1, 1, 1,
-1.152631, -0.5373434, -3.068421, 1, 1, 1, 1, 1,
-1.150825, 0.1748648, -0.3932208, 1, 1, 1, 1, 1,
-1.149453, -1.561563, -3.684283, 1, 1, 1, 1, 1,
-1.14891, 1.392764, -2.20862, 1, 1, 1, 1, 1,
-1.13424, -1.309187, -3.357037, 1, 1, 1, 1, 1,
-1.133807, 0.07016736, -0.9375301, 1, 1, 1, 1, 1,
-1.125713, -1.052103, -1.191951, 1, 1, 1, 1, 1,
-1.124738, 0.05504845, -1.859823, 1, 1, 1, 1, 1,
-1.119012, -0.9559169, -2.690763, 1, 1, 1, 1, 1,
-1.113153, 0.3019225, -1.555229, 1, 1, 1, 1, 1,
-1.111331, -1.309902, -2.387459, 1, 1, 1, 1, 1,
-1.108792, 1.303636, -2.505169, 0, 0, 1, 1, 1,
-1.10236, -0.5042287, -2.558162, 1, 0, 0, 1, 1,
-1.075734, 0.9307466, -1.216479, 1, 0, 0, 1, 1,
-1.073236, 0.6783508, -2.331624, 1, 0, 0, 1, 1,
-1.069693, -0.005439172, -1.658956, 1, 0, 0, 1, 1,
-1.065477, -0.8508384, -2.569295, 1, 0, 0, 1, 1,
-1.063981, 0.0690584, -1.739867, 0, 0, 0, 1, 1,
-1.061879, 1.177428, -2.544028, 0, 0, 0, 1, 1,
-1.060468, -0.01570782, -2.77513, 0, 0, 0, 1, 1,
-1.059334, 1.839129, -0.5338636, 0, 0, 0, 1, 1,
-1.051054, 0.2989945, -0.3451914, 0, 0, 0, 1, 1,
-1.041245, 0.2590095, -0.9836196, 0, 0, 0, 1, 1,
-1.032361, 0.9848524, -0.422818, 0, 0, 0, 1, 1,
-1.027972, -1.05739, -2.165514, 1, 1, 1, 1, 1,
-1.02536, -1.200026, -5.420075, 1, 1, 1, 1, 1,
-1.02157, 1.253098, -0.9109359, 1, 1, 1, 1, 1,
-1.017493, 0.5789236, -0.5933416, 1, 1, 1, 1, 1,
-1.012006, 1.035805, -0.2398276, 1, 1, 1, 1, 1,
-1.009838, -1.230686, -3.624129, 1, 1, 1, 1, 1,
-1.007636, 0.1997232, -0.9695036, 1, 1, 1, 1, 1,
-1.00455, 1.364107, 0.9322563, 1, 1, 1, 1, 1,
-0.9968432, 0.05206161, -1.755422, 1, 1, 1, 1, 1,
-0.9965299, -0.2427274, -1.218356, 1, 1, 1, 1, 1,
-0.9941102, 1.003098, -0.7945222, 1, 1, 1, 1, 1,
-0.990798, 1.94147, -1.666135, 1, 1, 1, 1, 1,
-0.9826571, -1.471433, -1.557841, 1, 1, 1, 1, 1,
-0.9776369, 0.2476593, -0.4227403, 1, 1, 1, 1, 1,
-0.974587, 0.144555, -1.423612, 1, 1, 1, 1, 1,
-0.9687138, -0.08735294, -1.178508, 0, 0, 1, 1, 1,
-0.9638261, 1.034395, -0.7145688, 1, 0, 0, 1, 1,
-0.9543815, 1.256666, 0.1958141, 1, 0, 0, 1, 1,
-0.954344, -1.540075, -1.700454, 1, 0, 0, 1, 1,
-0.9475035, -0.1634462, -1.21646, 1, 0, 0, 1, 1,
-0.9468968, -0.3151537, -0.2833375, 1, 0, 0, 1, 1,
-0.9264739, 0.01547188, 0.250731, 0, 0, 0, 1, 1,
-0.9224219, 0.9863216, 1.864056, 0, 0, 0, 1, 1,
-0.9186521, -0.05401663, -1.297742, 0, 0, 0, 1, 1,
-0.9171093, -1.571938, -2.407715, 0, 0, 0, 1, 1,
-0.9150683, 2.114337, -1.229154, 0, 0, 0, 1, 1,
-0.9087464, 0.8912132, -0.7366499, 0, 0, 0, 1, 1,
-0.9055113, -0.05120156, -1.855577, 0, 0, 0, 1, 1,
-0.9049492, 0.6657876, -1.406942, 1, 1, 1, 1, 1,
-0.9025316, 1.093691, 0.2748078, 1, 1, 1, 1, 1,
-0.897059, -0.1098229, 0.09168778, 1, 1, 1, 1, 1,
-0.896291, 2.867198, -0.1195677, 1, 1, 1, 1, 1,
-0.8939872, -0.3119741, -2.100934, 1, 1, 1, 1, 1,
-0.8871364, 0.66546, -0.4563237, 1, 1, 1, 1, 1,
-0.8870664, -1.794455, -1.740562, 1, 1, 1, 1, 1,
-0.8853372, 2.048318, 0.2837915, 1, 1, 1, 1, 1,
-0.8799585, -1.873313, -2.881983, 1, 1, 1, 1, 1,
-0.8732494, -1.293759, -4.181996, 1, 1, 1, 1, 1,
-0.8694842, -0.6651787, -1.308843, 1, 1, 1, 1, 1,
-0.8686889, -1.19436, -0.8918972, 1, 1, 1, 1, 1,
-0.8653242, -1.548696, -2.151297, 1, 1, 1, 1, 1,
-0.8580909, -0.7535477, -2.709073, 1, 1, 1, 1, 1,
-0.8571534, -2.605446, -1.911361, 1, 1, 1, 1, 1,
-0.8568321, -1.142489, -2.962677, 0, 0, 1, 1, 1,
-0.841532, 0.4225912, -1.248412, 1, 0, 0, 1, 1,
-0.8394216, -0.3208536, -0.478255, 1, 0, 0, 1, 1,
-0.8356324, 0.004613351, 0.0962704, 1, 0, 0, 1, 1,
-0.8097232, 0.07766315, 0.3150187, 1, 0, 0, 1, 1,
-0.8092742, -1.321949, -1.796703, 1, 0, 0, 1, 1,
-0.8087506, -0.1634434, -2.932268, 0, 0, 0, 1, 1,
-0.8085517, -1.460348, -0.6572023, 0, 0, 0, 1, 1,
-0.8066435, -0.6583176, -1.727024, 0, 0, 0, 1, 1,
-0.8044697, -1.152177, -2.94632, 0, 0, 0, 1, 1,
-0.8028255, 0.4241982, -1.288133, 0, 0, 0, 1, 1,
-0.8015833, -1.12144, -1.379805, 0, 0, 0, 1, 1,
-0.79983, 0.4003499, -0.5278014, 0, 0, 0, 1, 1,
-0.7988656, 1.774099, -0.8597994, 1, 1, 1, 1, 1,
-0.7883603, 1.230875, -1.826976, 1, 1, 1, 1, 1,
-0.7837122, 0.9829512, -0.6480927, 1, 1, 1, 1, 1,
-0.7781893, -0.1019933, 0.1549743, 1, 1, 1, 1, 1,
-0.7780918, 0.16432, -2.012132, 1, 1, 1, 1, 1,
-0.7755125, -0.4889968, -2.713726, 1, 1, 1, 1, 1,
-0.773092, 0.4904636, -2.308494, 1, 1, 1, 1, 1,
-0.7683159, 1.892055, 1.462559, 1, 1, 1, 1, 1,
-0.7577747, -0.2077652, -2.965687, 1, 1, 1, 1, 1,
-0.7547495, 0.336639, -1.865442, 1, 1, 1, 1, 1,
-0.7457453, 1.977052, -1.262288, 1, 1, 1, 1, 1,
-0.7365185, 0.2782576, -2.176451, 1, 1, 1, 1, 1,
-0.7356713, -0.7252421, -2.386984, 1, 1, 1, 1, 1,
-0.7353972, -0.7555265, -2.717022, 1, 1, 1, 1, 1,
-0.7294688, 0.2624828, -2.143746, 1, 1, 1, 1, 1,
-0.7254156, 2.572057, -0.3819046, 0, 0, 1, 1, 1,
-0.7253261, 2.175529, 1.004375, 1, 0, 0, 1, 1,
-0.7225134, -0.6206998, -1.027172, 1, 0, 0, 1, 1,
-0.7155793, 1.872658, -0.1006797, 1, 0, 0, 1, 1,
-0.7151414, -1.192467, -2.500201, 1, 0, 0, 1, 1,
-0.7127843, 1.194021, -0.9502231, 1, 0, 0, 1, 1,
-0.7120427, -1.25865, -2.106165, 0, 0, 0, 1, 1,
-0.7119612, 0.6575053, -1.897772, 0, 0, 0, 1, 1,
-0.7097493, -0.7359377, -3.941873, 0, 0, 0, 1, 1,
-0.7031201, 1.704465, -1.963115, 0, 0, 0, 1, 1,
-0.7013757, -0.03435298, 0.0136149, 0, 0, 0, 1, 1,
-0.6975925, 0.1619725, -1.683304, 0, 0, 0, 1, 1,
-0.6943389, 0.01458926, -2.300846, 0, 0, 0, 1, 1,
-0.6922212, 1.479239, 0.8772387, 1, 1, 1, 1, 1,
-0.6879463, 1.28582, -0.7676831, 1, 1, 1, 1, 1,
-0.6875189, 0.864225, 1.722222, 1, 1, 1, 1, 1,
-0.6843113, 1.226482, -1.179575, 1, 1, 1, 1, 1,
-0.6791302, -0.1345763, -2.613996, 1, 1, 1, 1, 1,
-0.6755524, 0.1104056, 0.3262669, 1, 1, 1, 1, 1,
-0.6711892, 1.512141, 0.04525125, 1, 1, 1, 1, 1,
-0.6669562, -1.064453, -4.405279, 1, 1, 1, 1, 1,
-0.6625123, 0.04438926, -1.985528, 1, 1, 1, 1, 1,
-0.6549032, -0.9988797, -4.00951, 1, 1, 1, 1, 1,
-0.6534466, 3.05778, -2.405153, 1, 1, 1, 1, 1,
-0.6490905, 0.6974544, -0.3292314, 1, 1, 1, 1, 1,
-0.6490318, 0.7500227, -1.919237, 1, 1, 1, 1, 1,
-0.6462909, 0.9710602, -0.5542279, 1, 1, 1, 1, 1,
-0.6450197, 1.028708, 1.153198, 1, 1, 1, 1, 1,
-0.6445863, 0.4546594, -1.724668, 0, 0, 1, 1, 1,
-0.6402243, -0.1191201, -3.611699, 1, 0, 0, 1, 1,
-0.6371728, -2.067752, -4.051156, 1, 0, 0, 1, 1,
-0.6350601, -0.1969841, -1.594065, 1, 0, 0, 1, 1,
-0.6337585, 2.59518, -1.201074, 1, 0, 0, 1, 1,
-0.6325082, -0.7596418, -2.84336, 1, 0, 0, 1, 1,
-0.6322167, 0.05199767, -1.577113, 0, 0, 0, 1, 1,
-0.6317058, -1.024528, -3.391944, 0, 0, 0, 1, 1,
-0.6300012, -0.423234, -3.281619, 0, 0, 0, 1, 1,
-0.6299524, -2.421721, -1.244863, 0, 0, 0, 1, 1,
-0.6272368, 1.605439, 0.3980049, 0, 0, 0, 1, 1,
-0.6251161, 0.5480333, 0.7497298, 0, 0, 0, 1, 1,
-0.6234024, 1.170416, 0.5943195, 0, 0, 0, 1, 1,
-0.6168703, 1.709042, 1.203149, 1, 1, 1, 1, 1,
-0.6147438, 0.6145759, -0.01615722, 1, 1, 1, 1, 1,
-0.6142178, 3.059728, -2.33659, 1, 1, 1, 1, 1,
-0.6129298, -0.1089268, -2.043886, 1, 1, 1, 1, 1,
-0.6114054, 1.47187, 1.647762, 1, 1, 1, 1, 1,
-0.6063251, -0.1478931, -0.5813677, 1, 1, 1, 1, 1,
-0.6042477, 0.7543741, 0.07451269, 1, 1, 1, 1, 1,
-0.6028484, -0.1821631, -1.17226, 1, 1, 1, 1, 1,
-0.5884125, 2.052985, -1.081599, 1, 1, 1, 1, 1,
-0.5868302, 0.5561178, 0.3083001, 1, 1, 1, 1, 1,
-0.5823054, -0.4875743, -1.39407, 1, 1, 1, 1, 1,
-0.5789963, 1.034971, -2.633881, 1, 1, 1, 1, 1,
-0.5782671, 1.609508, -0.1050753, 1, 1, 1, 1, 1,
-0.5774161, -0.9220558, -2.433521, 1, 1, 1, 1, 1,
-0.5773584, -0.4923315, -3.601072, 1, 1, 1, 1, 1,
-0.5729022, -0.5136006, -3.125816, 0, 0, 1, 1, 1,
-0.5718775, -1.794374, -1.728639, 1, 0, 0, 1, 1,
-0.5681613, 1.25756, -1.210185, 1, 0, 0, 1, 1,
-0.5658163, 2.252257, 0.9336284, 1, 0, 0, 1, 1,
-0.5618299, -0.1951074, -1.199511, 1, 0, 0, 1, 1,
-0.5511091, -0.1257433, -0.7163557, 1, 0, 0, 1, 1,
-0.5456186, 0.1802609, -0.8953992, 0, 0, 0, 1, 1,
-0.5359002, 0.5750847, -0.523228, 0, 0, 0, 1, 1,
-0.5289426, 0.5433635, 0.6391734, 0, 0, 0, 1, 1,
-0.5276599, 1.954487, -0.3640559, 0, 0, 0, 1, 1,
-0.5255038, -0.1770686, -2.859598, 0, 0, 0, 1, 1,
-0.5248921, -0.5871747, -1.907563, 0, 0, 0, 1, 1,
-0.5230246, -2.824346, -2.253577, 0, 0, 0, 1, 1,
-0.5213026, -1.170429, -2.584397, 1, 1, 1, 1, 1,
-0.5210086, -0.02288968, -3.481234, 1, 1, 1, 1, 1,
-0.5177599, -1.216402, -2.53392, 1, 1, 1, 1, 1,
-0.5138196, 0.0434479, -4.340802, 1, 1, 1, 1, 1,
-0.51165, -0.6748251, -1.789684, 1, 1, 1, 1, 1,
-0.5116378, -0.9988679, -3.867412, 1, 1, 1, 1, 1,
-0.5110907, -0.6982837, -0.9794934, 1, 1, 1, 1, 1,
-0.5105433, -0.3473215, -1.543452, 1, 1, 1, 1, 1,
-0.5102731, -0.935721, -3.641049, 1, 1, 1, 1, 1,
-0.5090061, -0.2574381, -1.642784, 1, 1, 1, 1, 1,
-0.5085523, -0.39057, -3.404741, 1, 1, 1, 1, 1,
-0.5050947, -0.7542223, -2.494498, 1, 1, 1, 1, 1,
-0.5040299, 0.7482699, -3.051306, 1, 1, 1, 1, 1,
-0.5023677, -0.9142704, -1.430328, 1, 1, 1, 1, 1,
-0.502227, -0.7635543, -1.59884, 1, 1, 1, 1, 1,
-0.4947008, 1.074349, 0.8374438, 0, 0, 1, 1, 1,
-0.4936262, 1.526258, -0.1906875, 1, 0, 0, 1, 1,
-0.4902636, 0.9706775, -1.558473, 1, 0, 0, 1, 1,
-0.4885159, -1.275431, -2.544039, 1, 0, 0, 1, 1,
-0.4870617, -0.7509206, -3.323182, 1, 0, 0, 1, 1,
-0.4694073, 0.3887047, -0.151872, 1, 0, 0, 1, 1,
-0.4593703, -0.8148534, -1.278827, 0, 0, 0, 1, 1,
-0.4584737, -2.071306, -3.595629, 0, 0, 0, 1, 1,
-0.4569311, 0.5372586, -2.152578, 0, 0, 0, 1, 1,
-0.4556788, 1.608003, 0.1054563, 0, 0, 0, 1, 1,
-0.4521947, 0.1366296, -2.064927, 0, 0, 0, 1, 1,
-0.4512804, -0.09851232, -1.407867, 0, 0, 0, 1, 1,
-0.4501401, 0.2462139, -1.561599, 0, 0, 0, 1, 1,
-0.4402648, 0.5508208, -1.503195, 1, 1, 1, 1, 1,
-0.4386632, -1.721401, -3.051556, 1, 1, 1, 1, 1,
-0.4386151, -0.4348052, -0.8536734, 1, 1, 1, 1, 1,
-0.4370723, -1.180622, -2.053113, 1, 1, 1, 1, 1,
-0.4370371, 0.0301869, -2.711678, 1, 1, 1, 1, 1,
-0.4307546, -0.7086796, -2.363041, 1, 1, 1, 1, 1,
-0.4304001, -0.8842731, -2.405441, 1, 1, 1, 1, 1,
-0.4303605, 0.0261096, 0.5992312, 1, 1, 1, 1, 1,
-0.4294694, -1.196768, -2.661523, 1, 1, 1, 1, 1,
-0.4288805, -1.33091, -3.297755, 1, 1, 1, 1, 1,
-0.4283191, 0.6041593, -0.3264596, 1, 1, 1, 1, 1,
-0.42676, -1.006312, -3.177232, 1, 1, 1, 1, 1,
-0.4254289, -1.670638, -3.437596, 1, 1, 1, 1, 1,
-0.4222256, -0.8542156, -2.031301, 1, 1, 1, 1, 1,
-0.4152921, -2.195748, -2.629993, 1, 1, 1, 1, 1,
-0.4074153, -0.5892305, -0.4202033, 0, 0, 1, 1, 1,
-0.4070563, -0.7491287, -0.7488755, 1, 0, 0, 1, 1,
-0.4014628, 0.1915599, -1.052872, 1, 0, 0, 1, 1,
-0.4002257, 1.745613, -0.8597485, 1, 0, 0, 1, 1,
-0.395389, 0.3136735, -1.89916, 1, 0, 0, 1, 1,
-0.3935556, 1.464244, -0.4596827, 1, 0, 0, 1, 1,
-0.3916748, -0.1609983, -0.3253051, 0, 0, 0, 1, 1,
-0.3880299, -0.08658934, -2.576912, 0, 0, 0, 1, 1,
-0.3822504, 0.4756803, -1.769085, 0, 0, 0, 1, 1,
-0.381573, 1.716981, -1.607729, 0, 0, 0, 1, 1,
-0.3754999, 1.67991, -0.5309687, 0, 0, 0, 1, 1,
-0.3743806, -1.680886, -3.335218, 0, 0, 0, 1, 1,
-0.3731497, 1.080199, 0.1695182, 0, 0, 0, 1, 1,
-0.3712828, 0.5489998, 0.2394487, 1, 1, 1, 1, 1,
-0.370243, -0.1989942, -2.12919, 1, 1, 1, 1, 1,
-0.3677642, 1.490031, -0.1111702, 1, 1, 1, 1, 1,
-0.3638711, -0.2711252, -1.696356, 1, 1, 1, 1, 1,
-0.3623884, -0.613746, -1.763899, 1, 1, 1, 1, 1,
-0.3604779, -0.8586954, -2.86999, 1, 1, 1, 1, 1,
-0.3594324, 1.149, -0.4462451, 1, 1, 1, 1, 1,
-0.356558, -0.9751874, -3.48684, 1, 1, 1, 1, 1,
-0.3533075, -1.881196, -2.574779, 1, 1, 1, 1, 1,
-0.3522375, 0.7079768, 1.17148, 1, 1, 1, 1, 1,
-0.3515711, -0.4825466, -1.774517, 1, 1, 1, 1, 1,
-0.3511304, -1.422277, -5.041688, 1, 1, 1, 1, 1,
-0.350266, 2.109289, 0.3260044, 1, 1, 1, 1, 1,
-0.3487234, -0.7153336, -3.052787, 1, 1, 1, 1, 1,
-0.3466752, 1.50563, 0.2944629, 1, 1, 1, 1, 1,
-0.3449289, -1.116717, -5.831181, 0, 0, 1, 1, 1,
-0.3405037, -1.713591, -3.777543, 1, 0, 0, 1, 1,
-0.3372489, -0.8506756, -3.542888, 1, 0, 0, 1, 1,
-0.3336393, -0.3456075, -2.28068, 1, 0, 0, 1, 1,
-0.3250693, 1.825294, -0.6052343, 1, 0, 0, 1, 1,
-0.3246813, 0.2245712, -2.687418, 1, 0, 0, 1, 1,
-0.3234224, 1.078572, -1.078274, 0, 0, 0, 1, 1,
-0.3183478, 1.316042, -0.5909672, 0, 0, 0, 1, 1,
-0.3158277, 0.08719872, -0.8869962, 0, 0, 0, 1, 1,
-0.313859, 0.3221725, -0.1741559, 0, 0, 0, 1, 1,
-0.3127926, -1.355804, -2.840292, 0, 0, 0, 1, 1,
-0.3123482, 2.86408, 1.625459, 0, 0, 0, 1, 1,
-0.3092768, -1.134087, -3.530594, 0, 0, 0, 1, 1,
-0.3092378, -0.9028539, -2.848248, 1, 1, 1, 1, 1,
-0.3070651, 0.4357518, -1.737653, 1, 1, 1, 1, 1,
-0.3030295, 0.001697161, -0.4751065, 1, 1, 1, 1, 1,
-0.3024254, 2.367022, 0.2378035, 1, 1, 1, 1, 1,
-0.3005723, 0.2705562, 0.9227425, 1, 1, 1, 1, 1,
-0.2995503, -0.7678455, -3.888928, 1, 1, 1, 1, 1,
-0.2970643, 1.315546, 0.0177329, 1, 1, 1, 1, 1,
-0.2951925, -0.5078275, -4.398429, 1, 1, 1, 1, 1,
-0.29497, -0.4818944, -1.867813, 1, 1, 1, 1, 1,
-0.2916779, 0.1095868, -2.481354, 1, 1, 1, 1, 1,
-0.286079, 0.08074472, -0.6598864, 1, 1, 1, 1, 1,
-0.276169, -0.2447696, -2.33554, 1, 1, 1, 1, 1,
-0.2723119, -1.894031, -1.72684, 1, 1, 1, 1, 1,
-0.2703623, 0.3677995, -0.5502254, 1, 1, 1, 1, 1,
-0.2685479, 0.4260046, -0.6591134, 1, 1, 1, 1, 1,
-0.2683185, 0.671835, -0.5363193, 0, 0, 1, 1, 1,
-0.2662609, 0.07575725, -0.6121477, 1, 0, 0, 1, 1,
-0.2662417, -2.462861, -3.333174, 1, 0, 0, 1, 1,
-0.2654874, -2.078592, -2.742612, 1, 0, 0, 1, 1,
-0.2651579, -1.172947, -0.8658151, 1, 0, 0, 1, 1,
-0.2609802, -1.427141, -3.452573, 1, 0, 0, 1, 1,
-0.2546393, 0.8675645, -0.9294407, 0, 0, 0, 1, 1,
-0.2536711, 0.9424766, -0.3185152, 0, 0, 0, 1, 1,
-0.2505101, 1.018416, 0.1234758, 0, 0, 0, 1, 1,
-0.2481322, -1.217858, -2.672611, 0, 0, 0, 1, 1,
-0.2463007, -0.04634742, -1.880476, 0, 0, 0, 1, 1,
-0.2442631, 0.3891082, -1.359881, 0, 0, 0, 1, 1,
-0.2440105, -1.524279, -2.295179, 0, 0, 0, 1, 1,
-0.2386056, -0.4494559, -1.964754, 1, 1, 1, 1, 1,
-0.2380562, -1.446395, -4.14391, 1, 1, 1, 1, 1,
-0.2376561, 1.168633, 0.8787207, 1, 1, 1, 1, 1,
-0.234099, 0.8533555, -0.7968829, 1, 1, 1, 1, 1,
-0.2325751, -1.942283, -1.960796, 1, 1, 1, 1, 1,
-0.2288156, -0.5423147, -2.549406, 1, 1, 1, 1, 1,
-0.2254457, -0.8314547, -3.313952, 1, 1, 1, 1, 1,
-0.2192877, -1.604694, -3.415907, 1, 1, 1, 1, 1,
-0.2159914, -1.647838, -3.62308, 1, 1, 1, 1, 1,
-0.2148284, 0.3574745, -0.06376339, 1, 1, 1, 1, 1,
-0.2108313, -0.9728474, -2.756521, 1, 1, 1, 1, 1,
-0.2087995, -0.4305557, -1.908965, 1, 1, 1, 1, 1,
-0.2041358, -2.20633, -2.033278, 1, 1, 1, 1, 1,
-0.2041334, -0.6554414, -1.08976, 1, 1, 1, 1, 1,
-0.2019968, 0.5363391, -3.899423, 1, 1, 1, 1, 1,
-0.1999967, -1.375479, -4.090541, 0, 0, 1, 1, 1,
-0.1997357, 1.179715, -0.2720249, 1, 0, 0, 1, 1,
-0.19859, -1.583905, -3.666756, 1, 0, 0, 1, 1,
-0.1968316, 0.06588605, -1.048016, 1, 0, 0, 1, 1,
-0.1944226, 1.315586, 0.2491872, 1, 0, 0, 1, 1,
-0.1917044, 0.3658309, -0.2247441, 1, 0, 0, 1, 1,
-0.1868355, 1.269903, -0.4436227, 0, 0, 0, 1, 1,
-0.1863534, -0.5248366, -2.769141, 0, 0, 0, 1, 1,
-0.1850507, 0.09685588, -1.292258, 0, 0, 0, 1, 1,
-0.1831498, -1.060089, -2.372586, 0, 0, 0, 1, 1,
-0.1794987, 0.6164492, -0.9553146, 0, 0, 0, 1, 1,
-0.1783858, -0.5477741, -3.893662, 0, 0, 0, 1, 1,
-0.1736385, 1.442827, -1.143221, 0, 0, 0, 1, 1,
-0.1726413, 1.247361, -0.1866055, 1, 1, 1, 1, 1,
-0.164964, 0.2626493, 0.7486346, 1, 1, 1, 1, 1,
-0.1641236, -0.7042269, -2.940777, 1, 1, 1, 1, 1,
-0.1530917, 0.08587181, 0.2743228, 1, 1, 1, 1, 1,
-0.1497285, 0.6661931, -1.182545, 1, 1, 1, 1, 1,
-0.1482156, -0.2559269, -3.0283, 1, 1, 1, 1, 1,
-0.1432905, 0.2042708, 0.07197083, 1, 1, 1, 1, 1,
-0.1430136, -0.8647022, -3.976866, 1, 1, 1, 1, 1,
-0.1427162, -2.272525, -3.015761, 1, 1, 1, 1, 1,
-0.1410114, 0.01064409, -2.645802, 1, 1, 1, 1, 1,
-0.1389539, -0.525598, -2.466709, 1, 1, 1, 1, 1,
-0.138203, 0.4266835, 0.7794938, 1, 1, 1, 1, 1,
-0.1369316, 0.08613601, -1.048685, 1, 1, 1, 1, 1,
-0.1367557, -1.590953, -3.5456, 1, 1, 1, 1, 1,
-0.1280453, 0.6848369, -0.1409687, 1, 1, 1, 1, 1,
-0.1272356, -0.3628949, -3.261789, 0, 0, 1, 1, 1,
-0.126366, -0.9196902, -4.092196, 1, 0, 0, 1, 1,
-0.1258976, -1.771916, -2.16432, 1, 0, 0, 1, 1,
-0.1255828, -1.737973, -2.630824, 1, 0, 0, 1, 1,
-0.1253269, 1.149013, -1.667857, 1, 0, 0, 1, 1,
-0.1208816, 1.277746, 1.063201, 1, 0, 0, 1, 1,
-0.1193484, -1.080664, -2.829615, 0, 0, 0, 1, 1,
-0.118883, -0.9434337, -3.460529, 0, 0, 0, 1, 1,
-0.118767, 1.445221, -0.4381672, 0, 0, 0, 1, 1,
-0.1175045, -1.348976, -3.363282, 0, 0, 0, 1, 1,
-0.1150274, -0.3355264, -1.591652, 0, 0, 0, 1, 1,
-0.1144209, 1.989563, -1.439602, 0, 0, 0, 1, 1,
-0.1127257, 0.1239578, -1.750654, 0, 0, 0, 1, 1,
-0.112211, -1.188071, -5.006651, 1, 1, 1, 1, 1,
-0.1054156, -1.019185, -4.707294, 1, 1, 1, 1, 1,
-0.104329, -0.8371456, -2.226349, 1, 1, 1, 1, 1,
-0.1026828, -0.8035315, -1.782147, 1, 1, 1, 1, 1,
-0.09221447, 0.6848571, -1.474165, 1, 1, 1, 1, 1,
-0.08666734, -1.699271, -2.776808, 1, 1, 1, 1, 1,
-0.08289601, -0.3817463, -2.574731, 1, 1, 1, 1, 1,
-0.08040825, -0.5690704, -3.347817, 1, 1, 1, 1, 1,
-0.08025132, 0.7694748, -1.097217, 1, 1, 1, 1, 1,
-0.07896473, 1.311685, -0.9252999, 1, 1, 1, 1, 1,
-0.07572591, 0.5122032, -1.051045, 1, 1, 1, 1, 1,
-0.07198795, -0.06686772, -2.613771, 1, 1, 1, 1, 1,
-0.06851527, -0.3582996, -2.146511, 1, 1, 1, 1, 1,
-0.06815901, 1.394856, -1.398335, 1, 1, 1, 1, 1,
-0.06284211, 1.452227, 0.8502967, 1, 1, 1, 1, 1,
-0.05757466, -1.070217, -5.116545, 0, 0, 1, 1, 1,
-0.05427815, -0.7244036, -2.5302, 1, 0, 0, 1, 1,
-0.05206859, 1.838174, 0.5288512, 1, 0, 0, 1, 1,
-0.05019621, 0.4840773, 0.4520972, 1, 0, 0, 1, 1,
-0.04764866, 0.9164954, -0.9255236, 1, 0, 0, 1, 1,
-0.04749873, 2.005779, 1.119162, 1, 0, 0, 1, 1,
-0.04633442, 2.082905, 0.6080329, 0, 0, 0, 1, 1,
-0.04493407, -0.6087036, -3.182113, 0, 0, 0, 1, 1,
-0.03866803, 0.3134813, 0.2145098, 0, 0, 0, 1, 1,
-0.03581074, 0.6991667, 1.519605, 0, 0, 0, 1, 1,
-0.0348684, 0.641635, 1.136467, 0, 0, 0, 1, 1,
-0.03352529, 0.5772326, -0.9208026, 0, 0, 0, 1, 1,
-0.02315992, 0.06949206, -0.6758603, 0, 0, 0, 1, 1,
-0.02106249, 1.172045, 1.853122, 1, 1, 1, 1, 1,
-0.01876074, 0.3594882, -0.4815223, 1, 1, 1, 1, 1,
-0.01754781, 0.05186963, -0.3726741, 1, 1, 1, 1, 1,
-0.01730994, 0.1047009, -0.01746468, 1, 1, 1, 1, 1,
-0.0115539, 0.4425242, 1.168888, 1, 1, 1, 1, 1,
-0.01036637, -0.1204732, -4.720751, 1, 1, 1, 1, 1,
-0.007434673, -1.871703, -3.356779, 1, 1, 1, 1, 1,
-0.005709452, 0.6497646, -0.8640404, 1, 1, 1, 1, 1,
-0.003724031, 0.5529591, -1.821344, 1, 1, 1, 1, 1,
-0.00128519, 0.3555961, 0.2506717, 1, 1, 1, 1, 1,
0.0001214024, 1.301314, -1.033377, 1, 1, 1, 1, 1,
0.0006182357, 0.7696275, 1.935901, 1, 1, 1, 1, 1,
0.0007280893, -0.3237555, 2.335798, 1, 1, 1, 1, 1,
0.001293446, -1.003225, 2.466978, 1, 1, 1, 1, 1,
0.001294753, -0.3531795, 3.973276, 1, 1, 1, 1, 1,
0.003905155, -1.055409, 3.379195, 0, 0, 1, 1, 1,
0.004080694, -0.9419594, 4.100275, 1, 0, 0, 1, 1,
0.004242305, 1.644087, -0.8109301, 1, 0, 0, 1, 1,
0.005150228, 0.4522323, -0.05830524, 1, 0, 0, 1, 1,
0.008748456, -1.007092, 4.829659, 1, 0, 0, 1, 1,
0.01079884, -1.014798, 3.127387, 1, 0, 0, 1, 1,
0.01144561, -0.6166183, 2.806296, 0, 0, 0, 1, 1,
0.01252438, 1.046059, 0.6818296, 0, 0, 0, 1, 1,
0.01441815, -0.5410179, 3.266941, 0, 0, 0, 1, 1,
0.01596829, -0.04981408, 3.092074, 0, 0, 0, 1, 1,
0.01639406, 0.9747484, 0.3343133, 0, 0, 0, 1, 1,
0.01893084, -0.4226741, 2.284513, 0, 0, 0, 1, 1,
0.02029974, 0.2959818, -0.1478662, 0, 0, 0, 1, 1,
0.02206057, -2.049967, 3.935544, 1, 1, 1, 1, 1,
0.02267426, 0.1519007, 0.4416604, 1, 1, 1, 1, 1,
0.02347224, -0.04377313, 1.871361, 1, 1, 1, 1, 1,
0.02628209, -0.1801369, 2.368875, 1, 1, 1, 1, 1,
0.02788082, 1.672342, 1.223738, 1, 1, 1, 1, 1,
0.02866694, 1.100085, -0.9653252, 1, 1, 1, 1, 1,
0.0332143, -0.210051, 3.375514, 1, 1, 1, 1, 1,
0.04090636, -0.1395578, 3.188668, 1, 1, 1, 1, 1,
0.04208523, 0.5154837, 0.6846357, 1, 1, 1, 1, 1,
0.04248872, -1.426417, 2.694339, 1, 1, 1, 1, 1,
0.04283106, -1.158262, 3.192191, 1, 1, 1, 1, 1,
0.04356155, 0.05530055, -0.1650542, 1, 1, 1, 1, 1,
0.04556273, 0.192192, 0.8735006, 1, 1, 1, 1, 1,
0.04638815, -1.08246, 3.545338, 1, 1, 1, 1, 1,
0.0470912, 0.4845301, -0.7763718, 1, 1, 1, 1, 1,
0.05042997, 0.9153541, 1.145117, 0, 0, 1, 1, 1,
0.05238, -0.09093612, 1.616338, 1, 0, 0, 1, 1,
0.05289427, 0.6431875, 0.8591615, 1, 0, 0, 1, 1,
0.05502115, 1.042555, 1.305231, 1, 0, 0, 1, 1,
0.05975785, -0.08047378, 3.50084, 1, 0, 0, 1, 1,
0.06179456, 0.794854, 0.6085508, 1, 0, 0, 1, 1,
0.06356931, -0.3570746, 3.215898, 0, 0, 0, 1, 1,
0.06429159, 1.282212, -1.141709, 0, 0, 0, 1, 1,
0.06583662, -1.5023, 4.315151, 0, 0, 0, 1, 1,
0.06612531, 2.425912, 0.5560029, 0, 0, 0, 1, 1,
0.06927138, -0.1596628, 1.99189, 0, 0, 0, 1, 1,
0.07454535, 0.9062618, 0.5950058, 0, 0, 0, 1, 1,
0.07966199, 1.488541, 1.689916, 0, 0, 0, 1, 1,
0.0816447, 0.2624629, -0.9916506, 1, 1, 1, 1, 1,
0.08168215, -0.7871513, 3.284943, 1, 1, 1, 1, 1,
0.0830869, -1.163414, 2.66051, 1, 1, 1, 1, 1,
0.09222584, -0.6896295, 2.623612, 1, 1, 1, 1, 1,
0.09261905, -0.8999933, 1.208282, 1, 1, 1, 1, 1,
0.09390924, -1.283283, 2.11956, 1, 1, 1, 1, 1,
0.09535447, 2.918509, -0.3356887, 1, 1, 1, 1, 1,
0.0964409, -1.557799, 2.330137, 1, 1, 1, 1, 1,
0.09759013, -1.592708, 4.839227, 1, 1, 1, 1, 1,
0.09798992, 1.2328, -0.1552305, 1, 1, 1, 1, 1,
0.1006952, -1.057129, 1.51216, 1, 1, 1, 1, 1,
0.1053821, 1.219403, -0.502764, 1, 1, 1, 1, 1,
0.1057681, 0.3588507, -0.8907678, 1, 1, 1, 1, 1,
0.1072427, -0.8445559, 3.81015, 1, 1, 1, 1, 1,
0.1203217, 1.061951, 1.320936, 1, 1, 1, 1, 1,
0.1207475, -1.711833, 4.695537, 0, 0, 1, 1, 1,
0.122135, 1.366907, 0.3554879, 1, 0, 0, 1, 1,
0.1234272, 1.18418, 0.07922247, 1, 0, 0, 1, 1,
0.1254086, -0.3525034, 4.470776, 1, 0, 0, 1, 1,
0.1271847, 0.4237988, -0.3958601, 1, 0, 0, 1, 1,
0.1282723, 0.6087725, 0.4324731, 1, 0, 0, 1, 1,
0.1289099, -2.4211, 4.992462, 0, 0, 0, 1, 1,
0.1321639, -0.6638762, 3.676585, 0, 0, 0, 1, 1,
0.1337975, 0.8301016, 1.260164, 0, 0, 0, 1, 1,
0.1385641, -1.123506, 3.948149, 0, 0, 0, 1, 1,
0.1398679, 1.218667, 0.0285325, 0, 0, 0, 1, 1,
0.1401565, -1.471284, 2.586119, 0, 0, 0, 1, 1,
0.1446109, 1.331634, -1.966434, 0, 0, 0, 1, 1,
0.1501503, 0.4719135, -0.3886324, 1, 1, 1, 1, 1,
0.1526894, -1.388376, 1.150975, 1, 1, 1, 1, 1,
0.1534269, -0.4213386, 0.4626409, 1, 1, 1, 1, 1,
0.1555787, -0.08354127, 0.6514347, 1, 1, 1, 1, 1,
0.1605161, -1.426843, 4.486454, 1, 1, 1, 1, 1,
0.1616616, 0.4842888, 1.228366, 1, 1, 1, 1, 1,
0.1645146, 0.5376166, 0.5971987, 1, 1, 1, 1, 1,
0.1652822, -0.2533451, 2.302574, 1, 1, 1, 1, 1,
0.1657273, 0.9798374, -1.220292, 1, 1, 1, 1, 1,
0.1670316, 0.4095461, 1.694426, 1, 1, 1, 1, 1,
0.1716834, 2.587308, 1.408653, 1, 1, 1, 1, 1,
0.1738299, 1.281787, 0.7958711, 1, 1, 1, 1, 1,
0.1744921, 2.800424, -0.3685671, 1, 1, 1, 1, 1,
0.181024, -0.2372814, 2.349876, 1, 1, 1, 1, 1,
0.1828646, 0.1825903, 0.9717446, 1, 1, 1, 1, 1,
0.1828884, 0.9062211, 0.2342275, 0, 0, 1, 1, 1,
0.1836132, -0.4314308, -1.39193, 1, 0, 0, 1, 1,
0.1850994, -0.9742403, 3.328639, 1, 0, 0, 1, 1,
0.187319, 0.4941771, -0.2055831, 1, 0, 0, 1, 1,
0.1874122, 0.1728005, 1.101798, 1, 0, 0, 1, 1,
0.1877308, 0.2374422, 1.384053, 1, 0, 0, 1, 1,
0.1878433, 0.6918158, -0.161015, 0, 0, 0, 1, 1,
0.1903276, 0.3087135, -0.7303179, 0, 0, 0, 1, 1,
0.1904732, 0.9143291, -1.94899, 0, 0, 0, 1, 1,
0.1949795, 0.3121715, -0.7248752, 0, 0, 0, 1, 1,
0.1985536, -0.1164249, 0.3279598, 0, 0, 0, 1, 1,
0.200923, 1.117941, 1.124323, 0, 0, 0, 1, 1,
0.2033597, 0.5100272, 0.9200796, 0, 0, 0, 1, 1,
0.2100361, 0.293888, 0.9140056, 1, 1, 1, 1, 1,
0.2115293, -0.1589274, 1.44438, 1, 1, 1, 1, 1,
0.2168891, -1.294979, 3.265433, 1, 1, 1, 1, 1,
0.216967, -0.7440199, 2.382309, 1, 1, 1, 1, 1,
0.2173482, 0.5214491, -0.3716621, 1, 1, 1, 1, 1,
0.2201523, 1.102284, 0.6986211, 1, 1, 1, 1, 1,
0.2254444, 1.573439, -1.082504, 1, 1, 1, 1, 1,
0.2296472, -0.2182172, 4.378877, 1, 1, 1, 1, 1,
0.2304363, 0.3799917, 0.5795723, 1, 1, 1, 1, 1,
0.2324056, -0.8506418, 2.646233, 1, 1, 1, 1, 1,
0.2327672, 0.03288007, -1.431136, 1, 1, 1, 1, 1,
0.2328739, 0.2368981, 0.4031582, 1, 1, 1, 1, 1,
0.2344499, -0.2898094, 0.9621123, 1, 1, 1, 1, 1,
0.238726, -0.07957581, 3.205788, 1, 1, 1, 1, 1,
0.2438236, -0.2550682, 2.976177, 1, 1, 1, 1, 1,
0.2442351, -1.240468, 1.514281, 0, 0, 1, 1, 1,
0.2459547, -0.3361506, 1.985685, 1, 0, 0, 1, 1,
0.246112, 1.266243, 1.000922, 1, 0, 0, 1, 1,
0.2467985, -1.30909, 2.407681, 1, 0, 0, 1, 1,
0.2477237, 0.0858914, -0.4627286, 1, 0, 0, 1, 1,
0.2533525, 0.7513872, -0.454965, 1, 0, 0, 1, 1,
0.2538235, 0.2036683, 0.3945391, 0, 0, 0, 1, 1,
0.2551304, 1.210892, -0.8712218, 0, 0, 0, 1, 1,
0.2589416, 0.4533001, -0.6892537, 0, 0, 0, 1, 1,
0.2590051, 0.3832982, -0.3857194, 0, 0, 0, 1, 1,
0.2594914, -1.638694, 3.261567, 0, 0, 0, 1, 1,
0.2619124, 0.07138763, 2.318618, 0, 0, 0, 1, 1,
0.2621236, 0.4972418, -1.682613, 0, 0, 0, 1, 1,
0.2630965, 0.2524398, 1.610691, 1, 1, 1, 1, 1,
0.2657854, 0.8453224, 0.105772, 1, 1, 1, 1, 1,
0.2692232, 0.5975224, -0.5814032, 1, 1, 1, 1, 1,
0.281675, 0.7704013, -1.304032, 1, 1, 1, 1, 1,
0.2840356, -3.121816, 1.6841, 1, 1, 1, 1, 1,
0.2898144, -1.09229, 1.371803, 1, 1, 1, 1, 1,
0.2952322, -0.3612861, 3.836729, 1, 1, 1, 1, 1,
0.296884, 0.848986, 1.247082, 1, 1, 1, 1, 1,
0.2970004, -0.5924404, 2.845691, 1, 1, 1, 1, 1,
0.2972233, 0.1771607, 1.931996, 1, 1, 1, 1, 1,
0.2983917, 0.9505872, -0.1306436, 1, 1, 1, 1, 1,
0.2992282, 0.6319327, 0.7574962, 1, 1, 1, 1, 1,
0.3009141, -0.6722565, 3.743176, 1, 1, 1, 1, 1,
0.3021905, 1.952201, 1.457467, 1, 1, 1, 1, 1,
0.3048635, -0.02427348, 2.149741, 1, 1, 1, 1, 1,
0.3075166, 1.88057, -0.7373213, 0, 0, 1, 1, 1,
0.3094163, 1.802013, 0.6666216, 1, 0, 0, 1, 1,
0.3228236, -0.2551232, 0.6390927, 1, 0, 0, 1, 1,
0.325954, 0.4725825, 0.8510235, 1, 0, 0, 1, 1,
0.331192, -0.1706524, 1.154509, 1, 0, 0, 1, 1,
0.3346587, 1.327577, 0.6499299, 1, 0, 0, 1, 1,
0.3350292, 0.5776815, 0.3592226, 0, 0, 0, 1, 1,
0.335403, 0.2289966, 1.960445, 0, 0, 0, 1, 1,
0.3365713, 2.444025, -0.7995942, 0, 0, 0, 1, 1,
0.3381274, 0.8899094, 0.1243601, 0, 0, 0, 1, 1,
0.3383378, 0.8528879, -0.1393025, 0, 0, 0, 1, 1,
0.3383569, -1.794665, 3.062794, 0, 0, 0, 1, 1,
0.3405548, 0.4237005, 1.819337, 0, 0, 0, 1, 1,
0.3445981, 0.423715, 2.334376, 1, 1, 1, 1, 1,
0.3446641, -0.7534966, 3.157125, 1, 1, 1, 1, 1,
0.3548613, -0.6813355, 1.332734, 1, 1, 1, 1, 1,
0.3561641, -0.4829946, 2.263592, 1, 1, 1, 1, 1,
0.3572267, -0.8909478, 1.627159, 1, 1, 1, 1, 1,
0.3574471, 0.008570852, -0.1292984, 1, 1, 1, 1, 1,
0.3578339, -1.098351, 1.545346, 1, 1, 1, 1, 1,
0.3595704, 1.144815, -0.2488701, 1, 1, 1, 1, 1,
0.3616952, -1.601835, 2.482768, 1, 1, 1, 1, 1,
0.3647752, -1.389139, 3.068691, 1, 1, 1, 1, 1,
0.3681031, 0.2862612, -0.5049757, 1, 1, 1, 1, 1,
0.3686378, 0.9759248, -0.599664, 1, 1, 1, 1, 1,
0.3687479, 0.5798129, 1.274727, 1, 1, 1, 1, 1,
0.3728503, -1.915608, 1.750598, 1, 1, 1, 1, 1,
0.3751735, 0.09370613, 0.1451919, 1, 1, 1, 1, 1,
0.3837765, -1.859087, 4.221397, 0, 0, 1, 1, 1,
0.3856524, 0.05695458, 0.4849848, 1, 0, 0, 1, 1,
0.3892763, 0.07053053, 0.3405559, 1, 0, 0, 1, 1,
0.3896585, -1.527018, 3.948509, 1, 0, 0, 1, 1,
0.3915625, -2.041437, 3.874891, 1, 0, 0, 1, 1,
0.3916709, 0.8841329, -0.2152918, 1, 0, 0, 1, 1,
0.3926581, -0.4384155, 2.420584, 0, 0, 0, 1, 1,
0.3938558, 0.1703103, 1.2446, 0, 0, 0, 1, 1,
0.3948494, 0.1849495, 1.558575, 0, 0, 0, 1, 1,
0.4022311, -2.818537, 1.850556, 0, 0, 0, 1, 1,
0.4073333, 0.006274404, 1.257241, 0, 0, 0, 1, 1,
0.4123377, 0.998151, 0.2009722, 0, 0, 0, 1, 1,
0.4150932, 0.7629212, 0.5721675, 0, 0, 0, 1, 1,
0.4165434, 0.795572, 1.554362, 1, 1, 1, 1, 1,
0.4178338, 0.8556385, -0.1471847, 1, 1, 1, 1, 1,
0.4179481, -0.8119212, 3.599444, 1, 1, 1, 1, 1,
0.4195476, -1.860728, 2.841934, 1, 1, 1, 1, 1,
0.4210995, 0.3527971, 0.7501044, 1, 1, 1, 1, 1,
0.423115, 0.8584192, 2.128156, 1, 1, 1, 1, 1,
0.4252841, -0.07099, 4.225506, 1, 1, 1, 1, 1,
0.427976, -0.4661361, 1.779404, 1, 1, 1, 1, 1,
0.4301215, 0.5043491, 1.672287, 1, 1, 1, 1, 1,
0.4314473, -0.9514794, 2.228062, 1, 1, 1, 1, 1,
0.4336641, 0.2842911, 2.338566, 1, 1, 1, 1, 1,
0.4344748, -0.4199584, 2.308406, 1, 1, 1, 1, 1,
0.4427574, -0.4469138, 2.590436, 1, 1, 1, 1, 1,
0.4458525, 1.433761, 2.069572, 1, 1, 1, 1, 1,
0.4473319, -0.5675519, 1.364758, 1, 1, 1, 1, 1,
0.4522012, -0.985322, 0.5644668, 0, 0, 1, 1, 1,
0.4591106, 0.3022877, 1.34811, 1, 0, 0, 1, 1,
0.4600372, 0.5230273, 1.687485, 1, 0, 0, 1, 1,
0.4601068, 1.103841, -1.834212, 1, 0, 0, 1, 1,
0.46343, 2.282068, -0.4132483, 1, 0, 0, 1, 1,
0.4666363, 1.337744, 0.7136635, 1, 0, 0, 1, 1,
0.4697063, -0.6729273, 3.261228, 0, 0, 0, 1, 1,
0.4813262, -0.5061918, 2.282993, 0, 0, 0, 1, 1,
0.4817996, 0.8587064, -1.532802, 0, 0, 0, 1, 1,
0.4857852, -1.865748, 3.50533, 0, 0, 0, 1, 1,
0.4896947, -1.5394, 2.165185, 0, 0, 0, 1, 1,
0.496207, -1.951914, 3.06084, 0, 0, 0, 1, 1,
0.4999622, -0.797052, 3.262395, 0, 0, 0, 1, 1,
0.4999917, 0.624429, 2.472868, 1, 1, 1, 1, 1,
0.5077563, -1.376964, 1.743463, 1, 1, 1, 1, 1,
0.5093569, -1.027912, 3.127487, 1, 1, 1, 1, 1,
0.5154482, 1.057618, 0.2726119, 1, 1, 1, 1, 1,
0.5241141, 0.6348797, -0.6366748, 1, 1, 1, 1, 1,
0.5252967, -1.134583, 0.367706, 1, 1, 1, 1, 1,
0.5253435, -0.426443, 1.650475, 1, 1, 1, 1, 1,
0.5253592, -1.072041, 2.462022, 1, 1, 1, 1, 1,
0.5318151, 1.668218, 1.06889, 1, 1, 1, 1, 1,
0.535951, 0.07675998, 1.756237, 1, 1, 1, 1, 1,
0.5361483, 1.649588, 0.2190173, 1, 1, 1, 1, 1,
0.5381078, -0.2484801, 2.549293, 1, 1, 1, 1, 1,
0.5398179, -0.3189467, 2.184524, 1, 1, 1, 1, 1,
0.5437315, 0.7392591, -0.6643105, 1, 1, 1, 1, 1,
0.5440407, 0.7055776, -0.579641, 1, 1, 1, 1, 1,
0.5441951, 0.98357, -0.8411671, 0, 0, 1, 1, 1,
0.5489195, 1.44901, 1.35123, 1, 0, 0, 1, 1,
0.5504165, -0.6051816, 2.925261, 1, 0, 0, 1, 1,
0.5552188, 1.243118, -0.1710867, 1, 0, 0, 1, 1,
0.5562676, 0.8388439, 0.4951524, 1, 0, 0, 1, 1,
0.5589208, -0.0443135, 1.73416, 1, 0, 0, 1, 1,
0.5590811, -0.3087552, 0.80839, 0, 0, 0, 1, 1,
0.5641799, -0.3347773, 1.956415, 0, 0, 0, 1, 1,
0.5647368, -0.3080637, 3.081177, 0, 0, 0, 1, 1,
0.5727498, 1.117756, -0.4709259, 0, 0, 0, 1, 1,
0.5733455, -1.094333, 2.464447, 0, 0, 0, 1, 1,
0.5768855, 2.015222, 0.5560611, 0, 0, 0, 1, 1,
0.5822014, -1.104326, 2.572377, 0, 0, 0, 1, 1,
0.58267, 0.1501448, 1.663116, 1, 1, 1, 1, 1,
0.5856758, -2.770746, 3.140076, 1, 1, 1, 1, 1,
0.5862783, 1.471592, 0.9381355, 1, 1, 1, 1, 1,
0.5890747, -0.4202611, 4.272339, 1, 1, 1, 1, 1,
0.6078012, -0.3328857, 1.095532, 1, 1, 1, 1, 1,
0.6093068, -1.078743, 4.120888, 1, 1, 1, 1, 1,
0.6105691, 0.01660173, 1.506982, 1, 1, 1, 1, 1,
0.6151354, -1.753916, 2.096554, 1, 1, 1, 1, 1,
0.6176974, 0.1406844, -0.002468221, 1, 1, 1, 1, 1,
0.6182818, 0.6478375, 2.641536, 1, 1, 1, 1, 1,
0.6192197, 2.010153, -0.6734573, 1, 1, 1, 1, 1,
0.6194887, -0.3357545, 3.088812, 1, 1, 1, 1, 1,
0.6197401, 1.413033, -0.4106355, 1, 1, 1, 1, 1,
0.6208939, 0.08207741, 0.5787412, 1, 1, 1, 1, 1,
0.6232445, 0.8002065, 1.217299, 1, 1, 1, 1, 1,
0.6356258, -0.8543889, 2.382964, 0, 0, 1, 1, 1,
0.6361321, -0.1957019, 1.706777, 1, 0, 0, 1, 1,
0.6385798, 0.2032972, 0.4103374, 1, 0, 0, 1, 1,
0.6388856, 1.629046, 0.4974662, 1, 0, 0, 1, 1,
0.6404352, -1.272967, 2.587712, 1, 0, 0, 1, 1,
0.6408284, 2.30168, 0.2712405, 1, 0, 0, 1, 1,
0.6420748, 1.521079, 0.8504245, 0, 0, 0, 1, 1,
0.6434078, -0.6862807, 2.301928, 0, 0, 0, 1, 1,
0.6438549, -2.300035, 1.038342, 0, 0, 0, 1, 1,
0.6531208, -0.8345561, 1.810949, 0, 0, 0, 1, 1,
0.6598116, 0.051542, -0.8235406, 0, 0, 0, 1, 1,
0.6614879, -0.7681518, 0.9704041, 0, 0, 0, 1, 1,
0.6619607, 0.7262227, 0.4582762, 0, 0, 0, 1, 1,
0.6677761, -0.5135692, 2.913819, 1, 1, 1, 1, 1,
0.6823538, 0.5823334, 0.5803718, 1, 1, 1, 1, 1,
0.683827, -2.373124, 3.637296, 1, 1, 1, 1, 1,
0.6917881, 0.9060889, 0.3513103, 1, 1, 1, 1, 1,
0.6967536, 0.6384763, 0.4231024, 1, 1, 1, 1, 1,
0.6975303, -0.5193565, 2.209648, 1, 1, 1, 1, 1,
0.700401, 0.27433, 1.534348, 1, 1, 1, 1, 1,
0.7012722, -0.6090186, 2.483187, 1, 1, 1, 1, 1,
0.707552, -0.08830121, -0.8730969, 1, 1, 1, 1, 1,
0.7100485, -0.2963065, 1.413268, 1, 1, 1, 1, 1,
0.712487, 0.7639791, 0.8350692, 1, 1, 1, 1, 1,
0.7134532, 0.09782869, 0.7161667, 1, 1, 1, 1, 1,
0.7152406, 0.8743744, 1.335884, 1, 1, 1, 1, 1,
0.7254534, -0.9376844, 3.23652, 1, 1, 1, 1, 1,
0.7279699, -0.2684318, 2.414101, 1, 1, 1, 1, 1,
0.7285833, 0.4580816, 1.787687, 0, 0, 1, 1, 1,
0.7287614, -0.1687445, 0.02276163, 1, 0, 0, 1, 1,
0.7294138, 0.196224, 2.092137, 1, 0, 0, 1, 1,
0.732824, 1.066261, 1.615714, 1, 0, 0, 1, 1,
0.735429, -0.1365207, 2.061523, 1, 0, 0, 1, 1,
0.7360213, 1.317899, 0.321641, 1, 0, 0, 1, 1,
0.7363865, -0.8541545, 3.091377, 0, 0, 0, 1, 1,
0.7381061, 0.02571663, 1.599478, 0, 0, 0, 1, 1,
0.7383508, 0.407668, 2.773161, 0, 0, 0, 1, 1,
0.7400554, 0.3672943, 1.315287, 0, 0, 0, 1, 1,
0.7427891, 0.3008621, 1.63327, 0, 0, 0, 1, 1,
0.7446545, 0.6041738, -0.2367878, 0, 0, 0, 1, 1,
0.748319, 0.1301201, 2.258233, 0, 0, 0, 1, 1,
0.7576436, 0.3135917, 1.067957, 1, 1, 1, 1, 1,
0.7579329, 0.6178644, 1.189619, 1, 1, 1, 1, 1,
0.7652189, -0.7707646, 3.97037, 1, 1, 1, 1, 1,
0.7681334, -0.1722996, 0.9478535, 1, 1, 1, 1, 1,
0.7779651, -0.2699431, 2.561337, 1, 1, 1, 1, 1,
0.7783952, -0.7785851, 2.380846, 1, 1, 1, 1, 1,
0.7857324, -1.615276, 1.54413, 1, 1, 1, 1, 1,
0.7872087, 0.7164455, 0.7202756, 1, 1, 1, 1, 1,
0.7920511, 0.5733747, 1.595131, 1, 1, 1, 1, 1,
0.792631, 0.5438156, 2.027907, 1, 1, 1, 1, 1,
0.7953348, -1.201551, 3.063873, 1, 1, 1, 1, 1,
0.79596, -0.8127565, 1.365362, 1, 1, 1, 1, 1,
0.7963468, -0.7773595, 3.356402, 1, 1, 1, 1, 1,
0.7996312, -0.6176406, -0.2191624, 1, 1, 1, 1, 1,
0.8000633, -0.1244411, 2.834064, 1, 1, 1, 1, 1,
0.8028281, 0.7773249, -0.9225472, 0, 0, 1, 1, 1,
0.8062648, 1.221054, 0.3478606, 1, 0, 0, 1, 1,
0.807224, 1.306908, -0.7404802, 1, 0, 0, 1, 1,
0.808569, 0.6289766, 0.7700267, 1, 0, 0, 1, 1,
0.8172961, -0.2618938, 2.852473, 1, 0, 0, 1, 1,
0.8298371, -0.9403365, 2.961971, 1, 0, 0, 1, 1,
0.8339631, 0.5107295, 0.2656788, 0, 0, 0, 1, 1,
0.837585, -0.6881673, 3.855999, 0, 0, 0, 1, 1,
0.8440476, 0.50416, 1.482109, 0, 0, 0, 1, 1,
0.844287, -0.2492087, 2.605878, 0, 0, 0, 1, 1,
0.8470166, 0.2422612, 2.308049, 0, 0, 0, 1, 1,
0.8505077, 0.9776654, -0.1249052, 0, 0, 0, 1, 1,
0.8544202, -1.142778, 1.922077, 0, 0, 0, 1, 1,
0.8584805, -0.6703605, 3.059411, 1, 1, 1, 1, 1,
0.858495, -0.05700055, 2.127877, 1, 1, 1, 1, 1,
0.8615026, 0.4636197, 0.931566, 1, 1, 1, 1, 1,
0.8647954, 0.7789379, -1.077541, 1, 1, 1, 1, 1,
0.8673092, 0.7513817, 1.545554, 1, 1, 1, 1, 1,
0.8729444, 0.6409163, 0.8353273, 1, 1, 1, 1, 1,
0.8735493, 0.8681666, -0.4169373, 1, 1, 1, 1, 1,
0.8744634, -0.1566689, 1.304415, 1, 1, 1, 1, 1,
0.8766398, -0.6437423, 3.034186, 1, 1, 1, 1, 1,
0.8826286, -0.5315282, 1.825382, 1, 1, 1, 1, 1,
0.8831181, -1.918325, 2.382158, 1, 1, 1, 1, 1,
0.8910065, 0.6585074, -0.2033893, 1, 1, 1, 1, 1,
0.8997774, -1.121961, 3.778064, 1, 1, 1, 1, 1,
0.8999071, 1.135499, -0.08222239, 1, 1, 1, 1, 1,
0.9030573, 0.4705693, 1.616663, 1, 1, 1, 1, 1,
0.9044996, -0.2128005, 2.602279, 0, 0, 1, 1, 1,
0.9078041, -1.245082, 1.781161, 1, 0, 0, 1, 1,
0.9099914, -0.6239725, 2.783497, 1, 0, 0, 1, 1,
0.9130856, -0.6899849, 2.035495, 1, 0, 0, 1, 1,
0.9176471, -1.227946, 0.9841362, 1, 0, 0, 1, 1,
0.9226748, 0.5405267, 2.048687, 1, 0, 0, 1, 1,
0.9329661, 0.5387834, 1.160965, 0, 0, 0, 1, 1,
0.9349179, -0.1910101, 1.626219, 0, 0, 0, 1, 1,
0.9445123, 0.2418878, 1.586127, 0, 0, 0, 1, 1,
0.9468843, -0.06029959, 1.427605, 0, 0, 0, 1, 1,
0.9478076, -1.413665, 3.521464, 0, 0, 0, 1, 1,
0.9493805, -0.8429292, 3.458328, 0, 0, 0, 1, 1,
0.9546739, 1.1722, 0.2914248, 0, 0, 0, 1, 1,
0.9587609, -1.797866, 3.499427, 1, 1, 1, 1, 1,
0.9610302, -0.8413908, 3.306438, 1, 1, 1, 1, 1,
0.9619377, -0.1020374, 2.119071, 1, 1, 1, 1, 1,
0.9636104, -0.154575, 3.221039, 1, 1, 1, 1, 1,
0.9643202, -0.1731021, 0.8680551, 1, 1, 1, 1, 1,
0.9651421, 0.6037902, 3.2931, 1, 1, 1, 1, 1,
0.9686164, 0.08301885, 1.66419, 1, 1, 1, 1, 1,
0.9786267, 0.9571866, -0.02312419, 1, 1, 1, 1, 1,
0.9840173, 0.7608358, 0.4197874, 1, 1, 1, 1, 1,
0.9879453, -0.4250925, 1.703405, 1, 1, 1, 1, 1,
0.9956684, -0.9916002, 2.319208, 1, 1, 1, 1, 1,
0.9997667, 0.487033, 0.4369706, 1, 1, 1, 1, 1,
1.010929, -0.5883012, 0.8178648, 1, 1, 1, 1, 1,
1.015817, 1.241043, -1.607741, 1, 1, 1, 1, 1,
1.017878, -1.544468, 4.365804, 1, 1, 1, 1, 1,
1.021645, -0.2585797, 2.568866, 0, 0, 1, 1, 1,
1.027497, -0.6218585, 2.022125, 1, 0, 0, 1, 1,
1.029789, -0.8966628, 0.2187396, 1, 0, 0, 1, 1,
1.03103, -0.2720025, 2.307795, 1, 0, 0, 1, 1,
1.032174, 1.04831, -0.2958001, 1, 0, 0, 1, 1,
1.042551, 1.357303, -0.04729782, 1, 0, 0, 1, 1,
1.050542, 0.6846377, 1.158849, 0, 0, 0, 1, 1,
1.061027, -0.9986565, 2.396178, 0, 0, 0, 1, 1,
1.077554, -0.162672, 2.429757, 0, 0, 0, 1, 1,
1.082163, 0.9617847, 1.684813, 0, 0, 0, 1, 1,
1.092654, 1.075813, 1.61822, 0, 0, 0, 1, 1,
1.093393, 1.856914, 0.7020301, 0, 0, 0, 1, 1,
1.104776, 0.2735226, 0.1658465, 0, 0, 0, 1, 1,
1.108492, 0.8334012, 3.34587, 1, 1, 1, 1, 1,
1.113165, -0.5722401, -0.113134, 1, 1, 1, 1, 1,
1.128548, 0.6851875, 1.342767, 1, 1, 1, 1, 1,
1.129492, 0.8295305, 0.1219945, 1, 1, 1, 1, 1,
1.130226, -0.1019049, 1.142669, 1, 1, 1, 1, 1,
1.131083, -0.3127284, 0.922408, 1, 1, 1, 1, 1,
1.138742, 0.05083712, 1.079295, 1, 1, 1, 1, 1,
1.146814, -0.7368311, 2.627007, 1, 1, 1, 1, 1,
1.147174, 1.052233, 0.9960762, 1, 1, 1, 1, 1,
1.150155, 0.1332053, 3.70088, 1, 1, 1, 1, 1,
1.172915, -0.5472721, 2.759283, 1, 1, 1, 1, 1,
1.173387, 1.321697, 0.5565723, 1, 1, 1, 1, 1,
1.175568, -0.6021848, 2.135045, 1, 1, 1, 1, 1,
1.182881, 2.352767, 0.7250785, 1, 1, 1, 1, 1,
1.202482, 0.4649504, -0.03120417, 1, 1, 1, 1, 1,
1.202685, -1.062157, 2.388098, 0, 0, 1, 1, 1,
1.204483, -0.2710119, 2.661935, 1, 0, 0, 1, 1,
1.205149, -1.569992, 3.234984, 1, 0, 0, 1, 1,
1.208279, -1.487826, 2.742294, 1, 0, 0, 1, 1,
1.211241, -0.3330908, 0.4888119, 1, 0, 0, 1, 1,
1.21766, 0.3903567, 1.669, 1, 0, 0, 1, 1,
1.217963, -0.1304731, 0.9312761, 0, 0, 0, 1, 1,
1.22897, -0.3641633, 2.38941, 0, 0, 0, 1, 1,
1.230803, -0.5063713, 2.691474, 0, 0, 0, 1, 1,
1.247209, 1.567147, -1.089699, 0, 0, 0, 1, 1,
1.260788, -1.446777, 2.449067, 0, 0, 0, 1, 1,
1.266596, 0.2652031, 1.884166, 0, 0, 0, 1, 1,
1.26907, 0.2864822, 1.463606, 0, 0, 0, 1, 1,
1.272193, -0.3708835, 1.215174, 1, 1, 1, 1, 1,
1.298378, 0.5048458, 0.6087059, 1, 1, 1, 1, 1,
1.299137, 0.3733571, 0.3669626, 1, 1, 1, 1, 1,
1.300296, 0.9400097, -1.038664, 1, 1, 1, 1, 1,
1.300772, -1.653104, 3.632877, 1, 1, 1, 1, 1,
1.311124, 1.891452, 1.022567, 1, 1, 1, 1, 1,
1.322609, 0.4628055, 1.061151, 1, 1, 1, 1, 1,
1.338501, -1.596897, 3.727985, 1, 1, 1, 1, 1,
1.350491, -0.2681306, 1.156446, 1, 1, 1, 1, 1,
1.351221, 0.5147959, 1.898995, 1, 1, 1, 1, 1,
1.370992, -0.5050434, 3.487309, 1, 1, 1, 1, 1,
1.374934, -2.166963, 3.323367, 1, 1, 1, 1, 1,
1.375384, -0.2844309, 0.4533984, 1, 1, 1, 1, 1,
1.377285, 0.2836536, 2.592514, 1, 1, 1, 1, 1,
1.393631, 1.395833, 0.8756751, 1, 1, 1, 1, 1,
1.399556, -0.6792489, 2.335987, 0, 0, 1, 1, 1,
1.400749, 0.3089062, 3.01851, 1, 0, 0, 1, 1,
1.40234, 1.932928, 0.1968503, 1, 0, 0, 1, 1,
1.403171, -1.857222, 3.262447, 1, 0, 0, 1, 1,
1.424497, -0.1871023, 1.52691, 1, 0, 0, 1, 1,
1.434187, -0.2285062, 1.41191, 1, 0, 0, 1, 1,
1.440464, 0.3406038, 2.574285, 0, 0, 0, 1, 1,
1.446389, 0.8720406, 2.241348, 0, 0, 0, 1, 1,
1.455243, -0.108432, 1.318103, 0, 0, 0, 1, 1,
1.457478, 1.176906, 0.408785, 0, 0, 0, 1, 1,
1.459897, -1.3277, 2.015728, 0, 0, 0, 1, 1,
1.461858, 0.5764207, 1.647, 0, 0, 0, 1, 1,
1.473622, -0.9315926, 2.83443, 0, 0, 0, 1, 1,
1.476561, -1.481857, 2.881894, 1, 1, 1, 1, 1,
1.488701, -0.2392626, 2.385195, 1, 1, 1, 1, 1,
1.506509, -1.07433, 1.559718, 1, 1, 1, 1, 1,
1.512621, 0.9957003, 1.676299, 1, 1, 1, 1, 1,
1.54508, -0.3451931, 1.797651, 1, 1, 1, 1, 1,
1.546751, -2.07573, 1.609023, 1, 1, 1, 1, 1,
1.552909, 0.7635586, 0.6237381, 1, 1, 1, 1, 1,
1.555139, -0.06483497, -0.009044535, 1, 1, 1, 1, 1,
1.559015, 0.569934, 2.122945, 1, 1, 1, 1, 1,
1.571485, -0.3274004, 1.300836, 1, 1, 1, 1, 1,
1.588099, 0.435682, 2.241118, 1, 1, 1, 1, 1,
1.59573, -0.8041296, 2.23993, 1, 1, 1, 1, 1,
1.607613, 0.8287778, 4.025952, 1, 1, 1, 1, 1,
1.608338, -0.9357143, 1.36956, 1, 1, 1, 1, 1,
1.622115, 1.057896, 1.005274, 1, 1, 1, 1, 1,
1.622799, 1.491623, -0.02994511, 0, 0, 1, 1, 1,
1.637037, 0.6952136, 1.911422, 1, 0, 0, 1, 1,
1.64295, 2.317123, 0.3424818, 1, 0, 0, 1, 1,
1.651104, -2.215422, 1.766353, 1, 0, 0, 1, 1,
1.673227, -0.9635244, 4.014921, 1, 0, 0, 1, 1,
1.680078, 0.9138843, -0.395886, 1, 0, 0, 1, 1,
1.691386, 0.1395558, 3.464031, 0, 0, 0, 1, 1,
1.71113, -0.8778642, 4.2694, 0, 0, 0, 1, 1,
1.728695, -1.408658, 2.045147, 0, 0, 0, 1, 1,
1.73104, 1.286164, 1.467366, 0, 0, 0, 1, 1,
1.737206, 1.821636, 0.4928805, 0, 0, 0, 1, 1,
1.738384, 0.5842474, -0.2960441, 0, 0, 0, 1, 1,
1.811651, -1.265325, 3.121919, 0, 0, 0, 1, 1,
1.815381, -0.1879785, 1.083241, 1, 1, 1, 1, 1,
1.826344, 2.264821, 0.7457373, 1, 1, 1, 1, 1,
1.833925, 0.1025928, 2.291311, 1, 1, 1, 1, 1,
1.83691, 0.4409592, 1.642218, 1, 1, 1, 1, 1,
1.84846, 0.7061496, 0.3034678, 1, 1, 1, 1, 1,
1.861715, -0.9084169, 1.21726, 1, 1, 1, 1, 1,
1.871631, 0.2492033, 2.258953, 1, 1, 1, 1, 1,
1.87811, -0.5868007, 3.65388, 1, 1, 1, 1, 1,
1.969695, 0.7767029, 1.790186, 1, 1, 1, 1, 1,
1.980872, -1.751529, 2.705156, 1, 1, 1, 1, 1,
1.982298, -0.0913462, 0.1922375, 1, 1, 1, 1, 1,
1.994819, 1.149454, 0.5508816, 1, 1, 1, 1, 1,
1.995779, 1.472893, 1.121415, 1, 1, 1, 1, 1,
2.051009, 0.2709255, 2.397449, 1, 1, 1, 1, 1,
2.074076, 0.5189815, 2.568261, 1, 1, 1, 1, 1,
2.077756, -0.4419563, -1.953924, 0, 0, 1, 1, 1,
2.084145, -1.562988, 1.895007, 1, 0, 0, 1, 1,
2.107054, -2.044433, 1.394439, 1, 0, 0, 1, 1,
2.11307, 0.01233704, 2.8173, 1, 0, 0, 1, 1,
2.186877, -0.8384891, 2.376724, 1, 0, 0, 1, 1,
2.194829, 0.06058539, 1.381235, 1, 0, 0, 1, 1,
2.226795, -1.924184, 3.177311, 0, 0, 0, 1, 1,
2.270039, -0.2043373, 1.10009, 0, 0, 0, 1, 1,
2.288109, 0.500899, 1.410068, 0, 0, 0, 1, 1,
2.309222, 2.224466, 2.730253, 0, 0, 0, 1, 1,
2.322106, 0.405088, 1.144694, 0, 0, 0, 1, 1,
2.371465, 0.7828624, 1.546943, 0, 0, 0, 1, 1,
2.385014, 0.2177676, 1.961606, 0, 0, 0, 1, 1,
2.399312, -3.049877, 2.288408, 1, 1, 1, 1, 1,
2.422711, 0.5281699, 0.8754139, 1, 1, 1, 1, 1,
2.51436, 1.952333, 0.7321176, 1, 1, 1, 1, 1,
2.528037, 1.002678, 1.183823, 1, 1, 1, 1, 1,
2.569928, 0.1990216, 1.455206, 1, 1, 1, 1, 1,
2.606561, -0.9872673, 1.946654, 1, 1, 1, 1, 1,
2.623129, 1.456008, 0.5113952, 1, 1, 1, 1, 1
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
var radius = 9.475614;
var distance = 33.28269;
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
mvMatrix.translate( 0.4214309, 0.03104401, 0.4193594 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.28269);
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