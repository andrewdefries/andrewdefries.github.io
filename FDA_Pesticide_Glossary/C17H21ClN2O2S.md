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
-2.670003, -1.753309, -1.787215, 1, 0, 0, 1,
-2.541553, 0.6312633, -2.227237, 1, 0.007843138, 0, 1,
-2.511078, 0.5396729, -1.752691, 1, 0.01176471, 0, 1,
-2.499081, 0.4519902, -1.820797, 1, 0.01960784, 0, 1,
-2.484345, -0.09407629, -2.976993, 1, 0.02352941, 0, 1,
-2.480514, 0.9473269, -1.648297, 1, 0.03137255, 0, 1,
-2.479095, -1.406069, -1.5963, 1, 0.03529412, 0, 1,
-2.440764, 0.2365009, -3.356264, 1, 0.04313726, 0, 1,
-2.33759, -0.4555527, -1.653664, 1, 0.04705882, 0, 1,
-2.190628, 0.2593498, -2.901057, 1, 0.05490196, 0, 1,
-2.142138, -0.7138819, -2.034157, 1, 0.05882353, 0, 1,
-2.117291, -0.641276, -1.675653, 1, 0.06666667, 0, 1,
-2.0969, -0.3936321, -3.388455, 1, 0.07058824, 0, 1,
-2.075919, 0.09483406, -1.93012, 1, 0.07843138, 0, 1,
-2.070147, -0.7622359, -0.5336654, 1, 0.08235294, 0, 1,
-2.06705, -0.4831193, -3.295579, 1, 0.09019608, 0, 1,
-2.052561, -0.100327, -0.417326, 1, 0.09411765, 0, 1,
-2.034802, -0.200895, -0.976485, 1, 0.1019608, 0, 1,
-2.032166, 0.1653389, -1.758414, 1, 0.1098039, 0, 1,
-2.024924, -0.6542719, -1.368525, 1, 0.1137255, 0, 1,
-1.955048, 1.501612, -1.263499, 1, 0.1215686, 0, 1,
-1.935, -1.39527, -3.630388, 1, 0.1254902, 0, 1,
-1.926162, 0.9254853, -1.091524, 1, 0.1333333, 0, 1,
-1.913346, -1.834873, -1.76269, 1, 0.1372549, 0, 1,
-1.911431, 1.396355, -1.194322, 1, 0.145098, 0, 1,
-1.88716, 0.3955465, -0.277943, 1, 0.1490196, 0, 1,
-1.883097, -0.3641964, -2.284436, 1, 0.1568628, 0, 1,
-1.872921, 0.6342277, -1.597581, 1, 0.1607843, 0, 1,
-1.872498, 0.5092739, -2.293238, 1, 0.1686275, 0, 1,
-1.865556, 0.05019373, -1.400608, 1, 0.172549, 0, 1,
-1.843693, -1.61233, -2.512155, 1, 0.1803922, 0, 1,
-1.831714, -0.03822809, -3.955913, 1, 0.1843137, 0, 1,
-1.818888, -0.1998774, -0.6210076, 1, 0.1921569, 0, 1,
-1.806472, -0.5115892, -3.111718, 1, 0.1960784, 0, 1,
-1.795332, 0.7514845, -2.636363, 1, 0.2039216, 0, 1,
-1.779767, -1.379433, -2.952673, 1, 0.2117647, 0, 1,
-1.757398, 0.1494798, -0.2126105, 1, 0.2156863, 0, 1,
-1.744583, -0.01763451, -2.964899, 1, 0.2235294, 0, 1,
-1.729571, -0.07704979, -1.989492, 1, 0.227451, 0, 1,
-1.697215, 1.085413, 0.6016096, 1, 0.2352941, 0, 1,
-1.685302, 0.8565997, -1.338704, 1, 0.2392157, 0, 1,
-1.682798, 0.06104514, -1.41102, 1, 0.2470588, 0, 1,
-1.659163, -1.092936, -2.765294, 1, 0.2509804, 0, 1,
-1.639258, -1.472058, -4.907642, 1, 0.2588235, 0, 1,
-1.626789, -1.179268, -1.598647, 1, 0.2627451, 0, 1,
-1.614599, 1.114224, -2.203455, 1, 0.2705882, 0, 1,
-1.612786, -0.04172242, -0.9633543, 1, 0.2745098, 0, 1,
-1.61063, -1.450013, -3.024688, 1, 0.282353, 0, 1,
-1.601579, -0.6480932, -1.446594, 1, 0.2862745, 0, 1,
-1.599316, -1.354138, -3.009628, 1, 0.2941177, 0, 1,
-1.597271, 0.06786574, -3.705445, 1, 0.3019608, 0, 1,
-1.586897, 0.2350486, -2.178604, 1, 0.3058824, 0, 1,
-1.580461, 0.8485216, -1.356114, 1, 0.3137255, 0, 1,
-1.580103, -0.2646481, -1.044899, 1, 0.3176471, 0, 1,
-1.562242, 1.136215, 0.1703891, 1, 0.3254902, 0, 1,
-1.543607, -0.08485112, 1.020228, 1, 0.3294118, 0, 1,
-1.54047, -1.506374, -2.23385, 1, 0.3372549, 0, 1,
-1.526877, 0.8161072, 0.3161547, 1, 0.3411765, 0, 1,
-1.515396, 0.9851726, -3.141022, 1, 0.3490196, 0, 1,
-1.513549, -0.1396314, -3.335761, 1, 0.3529412, 0, 1,
-1.51339, 0.03588125, -1.29159, 1, 0.3607843, 0, 1,
-1.512107, 0.4057821, -4.014225, 1, 0.3647059, 0, 1,
-1.51079, 1.650974, -0.6167696, 1, 0.372549, 0, 1,
-1.509116, 1.251887, 0.1363973, 1, 0.3764706, 0, 1,
-1.507926, -0.3043846, -0.00108492, 1, 0.3843137, 0, 1,
-1.486587, 0.06855848, -2.557128, 1, 0.3882353, 0, 1,
-1.478719, 0.3331531, -1.637353, 1, 0.3960784, 0, 1,
-1.473051, 1.204313, -0.7675855, 1, 0.4039216, 0, 1,
-1.465963, -0.8832471, -2.150443, 1, 0.4078431, 0, 1,
-1.465392, -2.021306, -3.251592, 1, 0.4156863, 0, 1,
-1.459379, 0.06733312, -1.306422, 1, 0.4196078, 0, 1,
-1.457847, 0.3965333, -1.912005, 1, 0.427451, 0, 1,
-1.457675, 0.1885571, -2.060439, 1, 0.4313726, 0, 1,
-1.449628, -2.037364, -1.887884, 1, 0.4392157, 0, 1,
-1.442325, -0.1003064, -2.384095, 1, 0.4431373, 0, 1,
-1.427171, -0.6296667, -4.382152, 1, 0.4509804, 0, 1,
-1.416278, -0.391227, -1.679725, 1, 0.454902, 0, 1,
-1.405003, -1.079672, -3.663679, 1, 0.4627451, 0, 1,
-1.400836, -1.114953, -0.8037812, 1, 0.4666667, 0, 1,
-1.400445, 0.6366549, -2.290397, 1, 0.4745098, 0, 1,
-1.391827, -0.3738612, -1.829237, 1, 0.4784314, 0, 1,
-1.391631, -2.047843, -2.128968, 1, 0.4862745, 0, 1,
-1.370517, -0.8425377, -1.452729, 1, 0.4901961, 0, 1,
-1.360002, 0.2966128, -1.143743, 1, 0.4980392, 0, 1,
-1.355744, 0.9760003, -1.168172, 1, 0.5058824, 0, 1,
-1.346371, -0.7492289, -1.790171, 1, 0.509804, 0, 1,
-1.341242, -0.2977256, -1.306304, 1, 0.5176471, 0, 1,
-1.336652, 1.416284, -0.7589967, 1, 0.5215687, 0, 1,
-1.32767, 0.4279054, -1.563118, 1, 0.5294118, 0, 1,
-1.322054, 1.155045, -1.695717, 1, 0.5333334, 0, 1,
-1.318968, 0.03951488, -1.215593, 1, 0.5411765, 0, 1,
-1.311339, 0.9537684, -0.4791977, 1, 0.5450981, 0, 1,
-1.300919, 0.9621069, 0.7113525, 1, 0.5529412, 0, 1,
-1.294278, 1.452517, -2.240534, 1, 0.5568628, 0, 1,
-1.290363, 0.9396943, -0.7104552, 1, 0.5647059, 0, 1,
-1.278891, 0.4006156, -1.760825, 1, 0.5686275, 0, 1,
-1.277663, 0.07840052, -1.751011, 1, 0.5764706, 0, 1,
-1.271218, 1.753344, -0.7946028, 1, 0.5803922, 0, 1,
-1.271149, -0.5557137, -0.6721856, 1, 0.5882353, 0, 1,
-1.269197, 0.5342028, -1.514252, 1, 0.5921569, 0, 1,
-1.264128, 1.316429, -0.4425536, 1, 0.6, 0, 1,
-1.263135, 1.431424, -1.409865, 1, 0.6078432, 0, 1,
-1.257049, -1.62839, -2.349029, 1, 0.6117647, 0, 1,
-1.25485, 0.6635919, -0.1822903, 1, 0.6196079, 0, 1,
-1.246069, 0.8538005, -1.143353, 1, 0.6235294, 0, 1,
-1.233533, -1.146481, -1.590763, 1, 0.6313726, 0, 1,
-1.232077, -0.5907247, 0.1170392, 1, 0.6352941, 0, 1,
-1.223447, 0.5532698, -0.741157, 1, 0.6431373, 0, 1,
-1.214251, -1.348652, 0.2842975, 1, 0.6470588, 0, 1,
-1.209746, 0.608454, -1.031518, 1, 0.654902, 0, 1,
-1.209253, 0.9094042, -1.354509, 1, 0.6588235, 0, 1,
-1.207666, 0.1911951, 0.2712436, 1, 0.6666667, 0, 1,
-1.202561, -1.639862, -3.304172, 1, 0.6705883, 0, 1,
-1.202078, 0.4186936, -1.675544, 1, 0.6784314, 0, 1,
-1.199966, -0.6971582, -1.605945, 1, 0.682353, 0, 1,
-1.194943, 0.5636842, 0.1414787, 1, 0.6901961, 0, 1,
-1.193828, -1.828134, -1.941477, 1, 0.6941177, 0, 1,
-1.180457, -0.9944768, -3.684655, 1, 0.7019608, 0, 1,
-1.172548, -1.031407, -2.720001, 1, 0.7098039, 0, 1,
-1.167849, 0.9900095, -0.5674558, 1, 0.7137255, 0, 1,
-1.167528, 0.8617508, -1.412421, 1, 0.7215686, 0, 1,
-1.160571, -0.3864282, -1.101623, 1, 0.7254902, 0, 1,
-1.152223, -0.1095478, -2.045702, 1, 0.7333333, 0, 1,
-1.146095, -1.934669, -3.153623, 1, 0.7372549, 0, 1,
-1.141819, 0.6599079, -1.836701, 1, 0.7450981, 0, 1,
-1.14035, 0.2423581, -1.643566, 1, 0.7490196, 0, 1,
-1.133417, 0.7648001, -0.06949171, 1, 0.7568628, 0, 1,
-1.131835, 0.05602327, -1.038991, 1, 0.7607843, 0, 1,
-1.124448, -1.175127, -2.602822, 1, 0.7686275, 0, 1,
-1.119731, 0.6012015, -1.290922, 1, 0.772549, 0, 1,
-1.11388, -0.08910482, -1.886308, 1, 0.7803922, 0, 1,
-1.112305, 0.4116897, 0.4036184, 1, 0.7843137, 0, 1,
-1.10665, 0.708253, -0.6864628, 1, 0.7921569, 0, 1,
-1.106508, -0.7412068, 0.09001332, 1, 0.7960784, 0, 1,
-1.10604, 0.4626653, -1.90445, 1, 0.8039216, 0, 1,
-1.101714, -0.2943109, -1.541075, 1, 0.8117647, 0, 1,
-1.097425, -2.328879, -2.188594, 1, 0.8156863, 0, 1,
-1.086263, 0.5645266, -0.945227, 1, 0.8235294, 0, 1,
-1.076825, 1.524688, -0.3659652, 1, 0.827451, 0, 1,
-1.062624, -0.2229517, -1.406439, 1, 0.8352941, 0, 1,
-1.057833, 1.888765, -0.3302728, 1, 0.8392157, 0, 1,
-1.054819, -0.1600822, 0.1594984, 1, 0.8470588, 0, 1,
-1.051272, -0.07511179, -1.595377, 1, 0.8509804, 0, 1,
-1.050387, -0.4334271, -1.245826, 1, 0.8588235, 0, 1,
-1.049752, -0.6063382, -4.298388, 1, 0.8627451, 0, 1,
-1.048607, -0.9972484, -2.56707, 1, 0.8705882, 0, 1,
-1.048326, -1.485047, -2.966697, 1, 0.8745098, 0, 1,
-1.04695, 1.768401, -0.08648609, 1, 0.8823529, 0, 1,
-1.033603, -0.1605207, -1.562322, 1, 0.8862745, 0, 1,
-1.029948, -0.3057702, -0.06889488, 1, 0.8941177, 0, 1,
-1.017123, 0.03477489, -1.008151, 1, 0.8980392, 0, 1,
-1.006566, -0.9749008, -2.819204, 1, 0.9058824, 0, 1,
-1.006287, -0.006127419, -1.448791, 1, 0.9137255, 0, 1,
-1.002278, 0.6132841, -1.493402, 1, 0.9176471, 0, 1,
-0.999999, 1.624564, -0.5974764, 1, 0.9254902, 0, 1,
-0.996314, 0.1474688, -0.5209437, 1, 0.9294118, 0, 1,
-0.9959563, -0.02086995, -0.09908731, 1, 0.9372549, 0, 1,
-0.9930224, 0.142564, -0.5440119, 1, 0.9411765, 0, 1,
-0.9848641, -0.9446444, -1.566496, 1, 0.9490196, 0, 1,
-0.9824006, -0.334483, -2.334034, 1, 0.9529412, 0, 1,
-0.9662244, -0.5564077, -1.852474, 1, 0.9607843, 0, 1,
-0.9659089, 2.569853, -0.5881771, 1, 0.9647059, 0, 1,
-0.9613443, -1.054537, -2.53108, 1, 0.972549, 0, 1,
-0.9574405, -0.3465606, -2.195777, 1, 0.9764706, 0, 1,
-0.9544148, 0.3323394, -1.533687, 1, 0.9843137, 0, 1,
-0.9514545, -0.1532495, -2.093896, 1, 0.9882353, 0, 1,
-0.9440501, 0.6538982, -0.6467413, 1, 0.9960784, 0, 1,
-0.9435586, 0.6792264, -1.126786, 0.9960784, 1, 0, 1,
-0.9414604, 1.132901, 0.1689331, 0.9921569, 1, 0, 1,
-0.9310365, 2.072339, -0.5581139, 0.9843137, 1, 0, 1,
-0.926703, 0.6473807, 0.4969474, 0.9803922, 1, 0, 1,
-0.9235968, 0.1088219, -0.5760056, 0.972549, 1, 0, 1,
-0.9203541, 0.03407443, -0.2725229, 0.9686275, 1, 0, 1,
-0.9170457, 0.2590922, -2.57511, 0.9607843, 1, 0, 1,
-0.9130161, 0.2414752, -1.745683, 0.9568627, 1, 0, 1,
-0.9017712, 0.818128, -0.4786515, 0.9490196, 1, 0, 1,
-0.8974505, -0.5389561, -1.143575, 0.945098, 1, 0, 1,
-0.8972504, -0.9712271, -2.739135, 0.9372549, 1, 0, 1,
-0.8954119, 1.137344, -1.283165, 0.9333333, 1, 0, 1,
-0.8943909, 0.8243434, -2.032541, 0.9254902, 1, 0, 1,
-0.8902323, 0.5034328, -1.877977, 0.9215686, 1, 0, 1,
-0.8869981, 0.3174101, -2.130331, 0.9137255, 1, 0, 1,
-0.8848134, -1.349397, -1.812729, 0.9098039, 1, 0, 1,
-0.8828831, 0.3031552, -2.21841, 0.9019608, 1, 0, 1,
-0.8768379, -0.3620118, -3.349843, 0.8941177, 1, 0, 1,
-0.8735681, -0.9733995, -3.713611, 0.8901961, 1, 0, 1,
-0.8723146, 0.2094724, -0.7831735, 0.8823529, 1, 0, 1,
-0.8716246, 0.3292853, -1.80573, 0.8784314, 1, 0, 1,
-0.8714093, -1.392615, -2.27006, 0.8705882, 1, 0, 1,
-0.8654441, 0.6774254, -0.01818143, 0.8666667, 1, 0, 1,
-0.8621901, -0.3227233, -0.6373642, 0.8588235, 1, 0, 1,
-0.8590814, -0.1716977, -3.004973, 0.854902, 1, 0, 1,
-0.8465945, -0.5009695, -2.130104, 0.8470588, 1, 0, 1,
-0.842078, -1.090272, -2.146395, 0.8431373, 1, 0, 1,
-0.8349387, 1.07209, -0.575702, 0.8352941, 1, 0, 1,
-0.8344947, 0.6065009, -1.211183, 0.8313726, 1, 0, 1,
-0.8302484, -0.317901, -2.407464, 0.8235294, 1, 0, 1,
-0.8288343, 2.481186, 1.301836, 0.8196079, 1, 0, 1,
-0.8286761, 0.2965907, -1.779541, 0.8117647, 1, 0, 1,
-0.8281361, -0.1715316, -2.487, 0.8078431, 1, 0, 1,
-0.8269804, 0.2275532, -1.880269, 0.8, 1, 0, 1,
-0.8265696, -1.45384, -4.181437, 0.7921569, 1, 0, 1,
-0.8260933, -0.9556597, -0.5869458, 0.7882353, 1, 0, 1,
-0.8219944, 1.386601, 1.598349, 0.7803922, 1, 0, 1,
-0.8215571, -1.610367, -2.126168, 0.7764706, 1, 0, 1,
-0.8206613, -0.05308256, -2.562077, 0.7686275, 1, 0, 1,
-0.8197069, 0.3056923, -0.8041373, 0.7647059, 1, 0, 1,
-0.8151995, -0.4446037, -1.943528, 0.7568628, 1, 0, 1,
-0.8094587, -0.1196411, -1.972572, 0.7529412, 1, 0, 1,
-0.8060081, 0.6158519, -1.882898, 0.7450981, 1, 0, 1,
-0.8022621, 1.642559, -1.062145, 0.7411765, 1, 0, 1,
-0.8004312, -0.3164879, -3.317034, 0.7333333, 1, 0, 1,
-0.7923087, -1.435991, -2.131813, 0.7294118, 1, 0, 1,
-0.7906883, -0.9263604, -4.048845, 0.7215686, 1, 0, 1,
-0.7787942, -0.703329, -2.707084, 0.7176471, 1, 0, 1,
-0.7782204, -0.1794523, -2.681099, 0.7098039, 1, 0, 1,
-0.776068, -1.171562, -3.352046, 0.7058824, 1, 0, 1,
-0.7751489, 0.5035362, -1.881815, 0.6980392, 1, 0, 1,
-0.7677038, -0.393648, -1.519854, 0.6901961, 1, 0, 1,
-0.7629248, 0.5031267, -0.7776319, 0.6862745, 1, 0, 1,
-0.7609617, 2.003513, -0.7137831, 0.6784314, 1, 0, 1,
-0.7585312, 0.2307351, -0.5803574, 0.6745098, 1, 0, 1,
-0.7545823, 0.3592296, -1.20627, 0.6666667, 1, 0, 1,
-0.7538048, 0.03443186, -2.024312, 0.6627451, 1, 0, 1,
-0.742425, -1.330342, -2.358247, 0.654902, 1, 0, 1,
-0.7293072, 0.5770293, 0.3355096, 0.6509804, 1, 0, 1,
-0.7265888, 0.5264528, -2.213769, 0.6431373, 1, 0, 1,
-0.7261671, -1.476885, -2.428567, 0.6392157, 1, 0, 1,
-0.7180151, -1.569584, -3.281059, 0.6313726, 1, 0, 1,
-0.7164778, 0.6995466, -1.138776, 0.627451, 1, 0, 1,
-0.7064322, 0.8271692, 0.2119357, 0.6196079, 1, 0, 1,
-0.6996729, -1.935294, -2.537042, 0.6156863, 1, 0, 1,
-0.6991407, -0.5661004, -1.47483, 0.6078432, 1, 0, 1,
-0.697374, -0.2505918, -0.5590678, 0.6039216, 1, 0, 1,
-0.6950618, -0.1764269, -1.695731, 0.5960785, 1, 0, 1,
-0.6944087, 0.4939018, -0.5973008, 0.5882353, 1, 0, 1,
-0.6941202, -0.7984409, -2.932945, 0.5843138, 1, 0, 1,
-0.690179, 2.23839, -1.338622, 0.5764706, 1, 0, 1,
-0.6899846, -0.8850083, -2.424001, 0.572549, 1, 0, 1,
-0.6877473, -0.06775127, -0.6864206, 0.5647059, 1, 0, 1,
-0.6870349, 0.2396767, -1.293529, 0.5607843, 1, 0, 1,
-0.6847261, -0.4601209, -2.779455, 0.5529412, 1, 0, 1,
-0.6844813, -0.4473213, -1.921978, 0.5490196, 1, 0, 1,
-0.6764015, -0.296606, -1.738931, 0.5411765, 1, 0, 1,
-0.6706635, 1.022669, -0.1421818, 0.5372549, 1, 0, 1,
-0.6585925, -0.2337177, -1.695519, 0.5294118, 1, 0, 1,
-0.6585833, 0.04183896, -2.332473, 0.5254902, 1, 0, 1,
-0.6532138, 1.290436, 0.3100772, 0.5176471, 1, 0, 1,
-0.6494689, 0.1903261, -1.880825, 0.5137255, 1, 0, 1,
-0.6488428, -0.4703427, -2.347834, 0.5058824, 1, 0, 1,
-0.6474686, 1.001139, -1.075712, 0.5019608, 1, 0, 1,
-0.6437277, -0.9326658, -3.451235, 0.4941176, 1, 0, 1,
-0.6431213, 0.9015324, -1.63903, 0.4862745, 1, 0, 1,
-0.6429129, -1.140648, -1.586693, 0.4823529, 1, 0, 1,
-0.6423712, -0.0326988, -3.203406, 0.4745098, 1, 0, 1,
-0.6372638, 0.854963, -0.6022435, 0.4705882, 1, 0, 1,
-0.6344783, 0.1395935, -1.583508, 0.4627451, 1, 0, 1,
-0.6254239, -0.4238099, -1.697999, 0.4588235, 1, 0, 1,
-0.6235298, 1.010009, -1.084925, 0.4509804, 1, 0, 1,
-0.6222618, 2.022215, -1.439806, 0.4470588, 1, 0, 1,
-0.616075, 0.670039, -0.001147591, 0.4392157, 1, 0, 1,
-0.6152891, 0.4732336, -0.5613033, 0.4352941, 1, 0, 1,
-0.6113789, -0.3269335, -1.755905, 0.427451, 1, 0, 1,
-0.61049, -0.4779021, -2.080162, 0.4235294, 1, 0, 1,
-0.6099421, -0.8007321, -3.442352, 0.4156863, 1, 0, 1,
-0.6084777, 0.6807354, -1.293232, 0.4117647, 1, 0, 1,
-0.6054055, -0.8296188, -3.50388, 0.4039216, 1, 0, 1,
-0.603725, -1.288398, -2.219624, 0.3960784, 1, 0, 1,
-0.6018124, 0.0106509, -0.9873384, 0.3921569, 1, 0, 1,
-0.6000016, 0.3857638, -0.1813435, 0.3843137, 1, 0, 1,
-0.5996748, 0.6862699, -1.11473, 0.3803922, 1, 0, 1,
-0.5963538, -0.6165629, -2.23908, 0.372549, 1, 0, 1,
-0.5937876, 0.9970154, 0.4302767, 0.3686275, 1, 0, 1,
-0.582929, 1.004191, -1.042109, 0.3607843, 1, 0, 1,
-0.5805861, -1.27971, -4.338297, 0.3568628, 1, 0, 1,
-0.5802969, 0.6800044, 0.3922428, 0.3490196, 1, 0, 1,
-0.5739357, -1.25268, -3.172212, 0.345098, 1, 0, 1,
-0.5718092, -0.6368573, -1.375021, 0.3372549, 1, 0, 1,
-0.5678228, 0.724542, -1.649267, 0.3333333, 1, 0, 1,
-0.5662076, 0.07637368, 0.04428906, 0.3254902, 1, 0, 1,
-0.5566781, -0.2324146, -2.491492, 0.3215686, 1, 0, 1,
-0.5565125, 0.5787662, 0.599757, 0.3137255, 1, 0, 1,
-0.5537892, 1.08129, -0.2812759, 0.3098039, 1, 0, 1,
-0.5481891, 1.534837, 0.3041755, 0.3019608, 1, 0, 1,
-0.5481097, -1.218442, -2.633974, 0.2941177, 1, 0, 1,
-0.5433855, -2.185184, -3.876995, 0.2901961, 1, 0, 1,
-0.5407232, -0.7025599, -1.168783, 0.282353, 1, 0, 1,
-0.5392989, -0.9384958, -1.426983, 0.2784314, 1, 0, 1,
-0.539228, 1.137108, -0.7098009, 0.2705882, 1, 0, 1,
-0.5386947, 0.9378528, -1.666731, 0.2666667, 1, 0, 1,
-0.5372269, 1.89594, -0.02141559, 0.2588235, 1, 0, 1,
-0.5364831, -0.3430964, -1.920952, 0.254902, 1, 0, 1,
-0.5357251, 0.4277441, -1.288081, 0.2470588, 1, 0, 1,
-0.5296527, 2.272953, 1.221288, 0.2431373, 1, 0, 1,
-0.5265446, 0.6605328, 1.606589, 0.2352941, 1, 0, 1,
-0.5170135, 0.2011952, -2.314038, 0.2313726, 1, 0, 1,
-0.5134957, 0.2277899, -2.765834, 0.2235294, 1, 0, 1,
-0.5128714, -0.7138599, -1.78835, 0.2196078, 1, 0, 1,
-0.5093353, 0.1818659, -1.363466, 0.2117647, 1, 0, 1,
-0.5024995, 0.5691973, -1.513664, 0.2078431, 1, 0, 1,
-0.5022057, -0.8621083, -3.457762, 0.2, 1, 0, 1,
-0.501633, -0.3306568, -1.215419, 0.1921569, 1, 0, 1,
-0.5007991, 0.5239365, -0.04014451, 0.1882353, 1, 0, 1,
-0.5004537, -0.03808463, -1.308138, 0.1803922, 1, 0, 1,
-0.499963, -0.6549176, -2.567542, 0.1764706, 1, 0, 1,
-0.4967154, 2.36597, -0.6343494, 0.1686275, 1, 0, 1,
-0.4948597, -0.4859308, -2.329932, 0.1647059, 1, 0, 1,
-0.4943304, -1.166454, -2.799516, 0.1568628, 1, 0, 1,
-0.4939493, 0.2244691, -0.5021055, 0.1529412, 1, 0, 1,
-0.4842474, 0.843202, 0.9554188, 0.145098, 1, 0, 1,
-0.4834443, 0.1089657, -2.812025, 0.1411765, 1, 0, 1,
-0.4818178, -0.09740546, -2.130585, 0.1333333, 1, 0, 1,
-0.4741375, 1.048142, -1.008726, 0.1294118, 1, 0, 1,
-0.4728214, -1.67752, -5.171267, 0.1215686, 1, 0, 1,
-0.4651226, -0.7826274, 0.2124153, 0.1176471, 1, 0, 1,
-0.4631749, -0.6855351, -2.761138, 0.1098039, 1, 0, 1,
-0.4601741, -0.02306116, -1.408493, 0.1058824, 1, 0, 1,
-0.4598228, -1.335588, -2.414003, 0.09803922, 1, 0, 1,
-0.4556943, -2.178766, -2.746563, 0.09019608, 1, 0, 1,
-0.4545949, 2.280085, 2.281776, 0.08627451, 1, 0, 1,
-0.4538811, -1.67959, -3.856308, 0.07843138, 1, 0, 1,
-0.4452193, -0.4655948, 0.3091698, 0.07450981, 1, 0, 1,
-0.4427857, -0.1232674, -1.341419, 0.06666667, 1, 0, 1,
-0.4404369, 1.366729, 0.03791596, 0.0627451, 1, 0, 1,
-0.4346795, 0.8019264, -0.5455738, 0.05490196, 1, 0, 1,
-0.4332876, -0.2866977, -2.070443, 0.05098039, 1, 0, 1,
-0.4330113, -0.06964861, -1.629007, 0.04313726, 1, 0, 1,
-0.4307867, -1.612069, -2.348386, 0.03921569, 1, 0, 1,
-0.4303569, 0.3081557, -0.7979248, 0.03137255, 1, 0, 1,
-0.4289287, 0.2096833, -0.5118867, 0.02745098, 1, 0, 1,
-0.4272559, 0.1552613, -0.9152951, 0.01960784, 1, 0, 1,
-0.4172347, 0.03687992, -1.956284, 0.01568628, 1, 0, 1,
-0.4150648, 0.8277808, -1.603327, 0.007843138, 1, 0, 1,
-0.41389, -0.245787, -1.358931, 0.003921569, 1, 0, 1,
-0.411929, 0.01829099, -0.2661082, 0, 1, 0.003921569, 1,
-0.4078587, -0.3081879, -2.263069, 0, 1, 0.01176471, 1,
-0.4012859, 0.06070583, -2.211507, 0, 1, 0.01568628, 1,
-0.3969899, -1.483636, -3.454205, 0, 1, 0.02352941, 1,
-0.3945512, 1.775977, -1.306372, 0, 1, 0.02745098, 1,
-0.3933018, 1.413912, -0.2412311, 0, 1, 0.03529412, 1,
-0.3910987, -0.0682066, -2.796564, 0, 1, 0.03921569, 1,
-0.3895893, 2.120144, -0.06271101, 0, 1, 0.04705882, 1,
-0.3847686, 0.4279557, -1.385656, 0, 1, 0.05098039, 1,
-0.3843069, -0.8732893, -2.568811, 0, 1, 0.05882353, 1,
-0.3834321, -1.870149, -4.039297, 0, 1, 0.0627451, 1,
-0.3799623, -2.312401, -2.071096, 0, 1, 0.07058824, 1,
-0.3765482, 1.489809, -0.5628041, 0, 1, 0.07450981, 1,
-0.3733315, 1.506178, -0.285309, 0, 1, 0.08235294, 1,
-0.3720466, -0.1547639, -1.487026, 0, 1, 0.08627451, 1,
-0.3716751, -0.6241861, -2.042202, 0, 1, 0.09411765, 1,
-0.3716261, -0.9506601, -3.273511, 0, 1, 0.1019608, 1,
-0.3704239, -0.04591333, -2.013316, 0, 1, 0.1058824, 1,
-0.3702095, 0.3509486, -1.204554, 0, 1, 0.1137255, 1,
-0.3689241, 1.266001, -1.114907, 0, 1, 0.1176471, 1,
-0.367984, -2.288164, -3.890162, 0, 1, 0.1254902, 1,
-0.3676199, 0.3373043, -2.378297, 0, 1, 0.1294118, 1,
-0.3676067, -0.5299271, -4.172024, 0, 1, 0.1372549, 1,
-0.3634783, -0.1920285, -3.668868, 0, 1, 0.1411765, 1,
-0.3615082, 0.2181429, -2.402886, 0, 1, 0.1490196, 1,
-0.3590513, -0.01376573, -2.983052, 0, 1, 0.1529412, 1,
-0.353332, -1.116256, -1.307746, 0, 1, 0.1607843, 1,
-0.3518983, -1.108796, -3.392277, 0, 1, 0.1647059, 1,
-0.3515439, -0.1339851, -3.271634, 0, 1, 0.172549, 1,
-0.3503444, -0.1741612, -2.512475, 0, 1, 0.1764706, 1,
-0.3502099, 0.8243898, 0.7168895, 0, 1, 0.1843137, 1,
-0.3461882, -0.5953287, -1.901707, 0, 1, 0.1882353, 1,
-0.3442921, 0.2588461, 0.4958333, 0, 1, 0.1960784, 1,
-0.3438685, -0.1382884, -1.048504, 0, 1, 0.2039216, 1,
-0.3419852, 1.916343, 0.5350385, 0, 1, 0.2078431, 1,
-0.3385003, 1.037919, -1.730969, 0, 1, 0.2156863, 1,
-0.3373922, -0.2716666, -2.005045, 0, 1, 0.2196078, 1,
-0.3373391, -1.520701, -1.830114, 0, 1, 0.227451, 1,
-0.3316046, 0.4222494, -1.342699, 0, 1, 0.2313726, 1,
-0.3314058, -1.808804, -2.137655, 0, 1, 0.2392157, 1,
-0.3230876, -0.9395365, -1.329735, 0, 1, 0.2431373, 1,
-0.3209719, 0.2168377, -1.28453, 0, 1, 0.2509804, 1,
-0.3184156, 0.5533229, -0.9479133, 0, 1, 0.254902, 1,
-0.3176336, -0.4012677, -2.922906, 0, 1, 0.2627451, 1,
-0.3170733, -0.6993879, -3.729069, 0, 1, 0.2666667, 1,
-0.3140943, 0.7824958, 0.3852556, 0, 1, 0.2745098, 1,
-0.3139481, 0.6354306, -0.930666, 0, 1, 0.2784314, 1,
-0.3132092, -0.2873633, -2.166038, 0, 1, 0.2862745, 1,
-0.3109265, 0.01121448, -0.3562616, 0, 1, 0.2901961, 1,
-0.3096355, 0.2226371, -2.076078, 0, 1, 0.2980392, 1,
-0.3090774, -1.773947, -3.403249, 0, 1, 0.3058824, 1,
-0.3078253, 1.404908, -2.042615, 0, 1, 0.3098039, 1,
-0.306777, 0.8038565, 1.927937, 0, 1, 0.3176471, 1,
-0.3016869, -0.007682861, -2.523924, 0, 1, 0.3215686, 1,
-0.2996601, 0.41182, -2.631483, 0, 1, 0.3294118, 1,
-0.297079, 0.3838006, -0.2529402, 0, 1, 0.3333333, 1,
-0.2966612, 0.1092231, -1.291788, 0, 1, 0.3411765, 1,
-0.2866553, 1.194754, -0.6884654, 0, 1, 0.345098, 1,
-0.2863303, -1.782588, -2.091452, 0, 1, 0.3529412, 1,
-0.2837001, -0.4763301, -1.433224, 0, 1, 0.3568628, 1,
-0.2829488, 1.299614, -0.8140698, 0, 1, 0.3647059, 1,
-0.2803308, 0.02785371, -1.034819, 0, 1, 0.3686275, 1,
-0.2798006, 0.6571355, -1.403606, 0, 1, 0.3764706, 1,
-0.2795325, -0.8962507, -2.990278, 0, 1, 0.3803922, 1,
-0.2791839, -1.184917, -3.05773, 0, 1, 0.3882353, 1,
-0.2786859, 1.399562, 0.0880754, 0, 1, 0.3921569, 1,
-0.2786708, -0.212984, -3.981098, 0, 1, 0.4, 1,
-0.2786202, -0.5875436, -4.273203, 0, 1, 0.4078431, 1,
-0.2712528, 0.1092114, -0.8023785, 0, 1, 0.4117647, 1,
-0.2687857, 0.2613245, -1.329666, 0, 1, 0.4196078, 1,
-0.2656063, 1.189458, -0.4436336, 0, 1, 0.4235294, 1,
-0.2655647, 1.166267, -1.014245, 0, 1, 0.4313726, 1,
-0.2602074, 0.6761662, -0.08967328, 0, 1, 0.4352941, 1,
-0.2599404, -0.4767035, -3.780555, 0, 1, 0.4431373, 1,
-0.2592281, 0.1018726, -1.431037, 0, 1, 0.4470588, 1,
-0.2578747, 0.5314507, -0.4630071, 0, 1, 0.454902, 1,
-0.2546679, -0.3025106, -0.4303989, 0, 1, 0.4588235, 1,
-0.2476652, 0.2520895, -1.757683, 0, 1, 0.4666667, 1,
-0.2460261, 1.011352, 0.3278437, 0, 1, 0.4705882, 1,
-0.2352929, -1.367021, -2.399167, 0, 1, 0.4784314, 1,
-0.2340755, 1.014577, 2.163287, 0, 1, 0.4823529, 1,
-0.2323098, -0.2570526, -0.6449775, 0, 1, 0.4901961, 1,
-0.2289143, 0.1284639, -0.6802484, 0, 1, 0.4941176, 1,
-0.2261129, -0.6696179, -1.796744, 0, 1, 0.5019608, 1,
-0.2248854, -0.004421678, -2.01251, 0, 1, 0.509804, 1,
-0.22376, 1.176569, -1.221769, 0, 1, 0.5137255, 1,
-0.2209077, -0.02006262, -2.277892, 0, 1, 0.5215687, 1,
-0.2190099, 0.3017664, -2.986188, 0, 1, 0.5254902, 1,
-0.2188481, 0.6174192, -0.4235608, 0, 1, 0.5333334, 1,
-0.2179523, 1.905166, 1.473677, 0, 1, 0.5372549, 1,
-0.213536, 0.4520535, -0.4093471, 0, 1, 0.5450981, 1,
-0.2133575, -0.6453873, -3.0936, 0, 1, 0.5490196, 1,
-0.2100623, -1.109365, -2.003628, 0, 1, 0.5568628, 1,
-0.2084573, 0.8043366, -1.194999, 0, 1, 0.5607843, 1,
-0.2083368, 1.043126, -1.671134, 0, 1, 0.5686275, 1,
-0.2049714, 0.1748244, -0.4341029, 0, 1, 0.572549, 1,
-0.2034492, 0.1335267, -0.7141449, 0, 1, 0.5803922, 1,
-0.1944871, -0.699323, -1.950621, 0, 1, 0.5843138, 1,
-0.1910798, 1.362996, 0.2488614, 0, 1, 0.5921569, 1,
-0.1827373, -0.3524064, -3.956139, 0, 1, 0.5960785, 1,
-0.1812477, -0.863743, -0.3694141, 0, 1, 0.6039216, 1,
-0.1797892, -0.4684489, -3.080371, 0, 1, 0.6117647, 1,
-0.1791237, 0.03042244, -0.999638, 0, 1, 0.6156863, 1,
-0.1786892, 0.4634856, 0.7906036, 0, 1, 0.6235294, 1,
-0.1768162, 1.682777, 1.001194, 0, 1, 0.627451, 1,
-0.1697762, 0.08019166, -0.8777307, 0, 1, 0.6352941, 1,
-0.1681035, -0.2450173, -2.41, 0, 1, 0.6392157, 1,
-0.1676462, -0.6098297, -3.074712, 0, 1, 0.6470588, 1,
-0.166851, 0.8018864, -0.6240094, 0, 1, 0.6509804, 1,
-0.164229, 1.3502, -0.9413072, 0, 1, 0.6588235, 1,
-0.160106, 0.6902776, 0.4474392, 0, 1, 0.6627451, 1,
-0.1579766, -1.413319, -4.3353, 0, 1, 0.6705883, 1,
-0.1559074, 0.06336388, -1.783019, 0, 1, 0.6745098, 1,
-0.1479817, -1.016351, -3.548302, 0, 1, 0.682353, 1,
-0.1465417, 0.3490598, 0.664507, 0, 1, 0.6862745, 1,
-0.1460943, 0.5457649, -1.785857, 0, 1, 0.6941177, 1,
-0.1452653, -2.306757, -3.336954, 0, 1, 0.7019608, 1,
-0.1451255, 1.193219, -0.9304576, 0, 1, 0.7058824, 1,
-0.134127, 2.237025, -1.006982, 0, 1, 0.7137255, 1,
-0.1338006, 0.6860428, -0.3627023, 0, 1, 0.7176471, 1,
-0.1306374, -0.3617831, -5.215449, 0, 1, 0.7254902, 1,
-0.1305836, -0.008808918, -0.7719836, 0, 1, 0.7294118, 1,
-0.1273304, 0.246987, -1.082241, 0, 1, 0.7372549, 1,
-0.1244727, 0.947961, 0.5589836, 0, 1, 0.7411765, 1,
-0.1231004, -0.7366846, -3.577282, 0, 1, 0.7490196, 1,
-0.1198245, 1.070106, -1.146173, 0, 1, 0.7529412, 1,
-0.1192089, -1.608571, -2.561213, 0, 1, 0.7607843, 1,
-0.1170477, 0.757724, -0.5047858, 0, 1, 0.7647059, 1,
-0.1157024, -0.6444371, -4.043828, 0, 1, 0.772549, 1,
-0.1144921, -1.228807, -3.311954, 0, 1, 0.7764706, 1,
-0.113794, 0.8846135, 0.8041009, 0, 1, 0.7843137, 1,
-0.1099904, -0.6680818, -3.776661, 0, 1, 0.7882353, 1,
-0.1081071, 0.5639784, -0.3749546, 0, 1, 0.7960784, 1,
-0.106976, -0.1577803, -1.333368, 0, 1, 0.8039216, 1,
-0.1068752, -0.8993279, -1.615549, 0, 1, 0.8078431, 1,
-0.1038741, 1.356616, 1.562001, 0, 1, 0.8156863, 1,
-0.09982805, 0.3084026, 0.350733, 0, 1, 0.8196079, 1,
-0.09775204, 0.3333622, -0.2637146, 0, 1, 0.827451, 1,
-0.09593773, -0.5653573, -3.026902, 0, 1, 0.8313726, 1,
-0.09148359, 1.286404, -0.2964057, 0, 1, 0.8392157, 1,
-0.08950838, -0.5786884, -3.528862, 0, 1, 0.8431373, 1,
-0.0845507, -1.619644, -2.507728, 0, 1, 0.8509804, 1,
-0.0822576, 0.2909687, -2.176943, 0, 1, 0.854902, 1,
-0.08114683, 0.4890059, 0.4717105, 0, 1, 0.8627451, 1,
-0.08114132, -0.6334101, -3.054683, 0, 1, 0.8666667, 1,
-0.07805065, 0.2526395, 1.414598, 0, 1, 0.8745098, 1,
-0.07759772, -1.198999, -2.843275, 0, 1, 0.8784314, 1,
-0.07462485, -0.6869938, -4.076526, 0, 1, 0.8862745, 1,
-0.07457639, -0.004956166, -2.287742, 0, 1, 0.8901961, 1,
-0.07345045, 1.332935, -0.7856178, 0, 1, 0.8980392, 1,
-0.07089563, 0.2527528, -1.445266, 0, 1, 0.9058824, 1,
-0.0697389, -0.6900634, -2.45859, 0, 1, 0.9098039, 1,
-0.0683594, 0.4747503, -0.4067681, 0, 1, 0.9176471, 1,
-0.06549104, -0.07430333, -3.480042, 0, 1, 0.9215686, 1,
-0.06421226, -0.3267329, -3.233958, 0, 1, 0.9294118, 1,
-0.06349294, -0.08689556, -3.424645, 0, 1, 0.9333333, 1,
-0.06242572, -0.1911994, -3.947031, 0, 1, 0.9411765, 1,
-0.06066894, 0.5323351, -1.424006, 0, 1, 0.945098, 1,
-0.0600742, -0.5839544, -4.553712, 0, 1, 0.9529412, 1,
-0.05792536, -0.6025827, -3.747356, 0, 1, 0.9568627, 1,
-0.05623977, -0.2060072, -1.895423, 0, 1, 0.9647059, 1,
-0.05203283, 0.4839329, 0.8911648, 0, 1, 0.9686275, 1,
-0.04886352, -0.6013021, -2.386854, 0, 1, 0.9764706, 1,
-0.04753583, -0.1623395, -3.108593, 0, 1, 0.9803922, 1,
-0.04261115, -0.2056302, -3.606216, 0, 1, 0.9882353, 1,
-0.03674903, -1.120022, -3.581841, 0, 1, 0.9921569, 1,
-0.03567095, 0.2717458, -1.432515, 0, 1, 1, 1,
-0.03325139, 1.570221, -0.3271489, 0, 0.9921569, 1, 1,
-0.02839397, 0.8795738, -0.4773642, 0, 0.9882353, 1, 1,
-0.02608673, -1.944593, -1.82169, 0, 0.9803922, 1, 1,
-0.02142525, 0.1109712, -2.581474, 0, 0.9764706, 1, 1,
-0.01612115, -1.590305, -4.078691, 0, 0.9686275, 1, 1,
0.0009086163, 1.002661, -1.785939, 0, 0.9647059, 1, 1,
0.001213502, -0.390051, 4.574285, 0, 0.9568627, 1, 1,
0.003168467, 0.9686369, -1.25712, 0, 0.9529412, 1, 1,
0.004422456, 0.398105, 0.02257957, 0, 0.945098, 1, 1,
0.004685452, 1.906207, 0.7893965, 0, 0.9411765, 1, 1,
0.004954098, 1.035381, -1.560549, 0, 0.9333333, 1, 1,
0.00538996, 1.524748, 1.641731, 0, 0.9294118, 1, 1,
0.007142331, -2.062908, 3.909513, 0, 0.9215686, 1, 1,
0.007869506, -1.358434, 3.660115, 0, 0.9176471, 1, 1,
0.01021974, -1.073608, 2.805035, 0, 0.9098039, 1, 1,
0.01311901, 0.9092749, 0.2768397, 0, 0.9058824, 1, 1,
0.01607301, 0.9197139, -0.1876577, 0, 0.8980392, 1, 1,
0.01712592, 0.9984755, -2.181504, 0, 0.8901961, 1, 1,
0.01762599, -1.21978, 2.633494, 0, 0.8862745, 1, 1,
0.020187, 0.2454136, 0.4200225, 0, 0.8784314, 1, 1,
0.0207999, -0.9110432, 4.83472, 0, 0.8745098, 1, 1,
0.02082408, 1.309149, -0.8774776, 0, 0.8666667, 1, 1,
0.02969629, 2.401612, -0.9638879, 0, 0.8627451, 1, 1,
0.03493057, 1.099063, 1.453371, 0, 0.854902, 1, 1,
0.03703674, 0.4971023, -0.2809445, 0, 0.8509804, 1, 1,
0.03738491, -0.1693263, 4.758202, 0, 0.8431373, 1, 1,
0.03739914, 1.329877, 0.663979, 0, 0.8392157, 1, 1,
0.03801289, -0.5265884, 2.044783, 0, 0.8313726, 1, 1,
0.04021472, 0.7630106, 1.178147, 0, 0.827451, 1, 1,
0.04264231, -0.9804965, 0.5053264, 0, 0.8196079, 1, 1,
0.04641902, -2.306006, 2.743334, 0, 0.8156863, 1, 1,
0.0489539, -1.656145, 1.732947, 0, 0.8078431, 1, 1,
0.05498907, -0.5991062, 1.747768, 0, 0.8039216, 1, 1,
0.06453236, 0.09089499, -1.087798, 0, 0.7960784, 1, 1,
0.0675135, -2.401977, 2.763604, 0, 0.7882353, 1, 1,
0.06768883, 1.200123, -0.3255815, 0, 0.7843137, 1, 1,
0.06865489, 1.290151, -1.063421, 0, 0.7764706, 1, 1,
0.06972703, -1.676568, 4.587604, 0, 0.772549, 1, 1,
0.07030886, 1.621772, -1.182873, 0, 0.7647059, 1, 1,
0.0730207, -0.7174203, 2.399115, 0, 0.7607843, 1, 1,
0.07613871, 0.4178097, 0.8472762, 0, 0.7529412, 1, 1,
0.07704822, -1.300324, 2.417814, 0, 0.7490196, 1, 1,
0.07993967, 0.9971017, 1.533585, 0, 0.7411765, 1, 1,
0.08147881, -0.6263862, 3.804089, 0, 0.7372549, 1, 1,
0.08479044, -1.336376, 4.694423, 0, 0.7294118, 1, 1,
0.08524062, 1.353813, 0.05443954, 0, 0.7254902, 1, 1,
0.08761956, -0.9179111, 3.62876, 0, 0.7176471, 1, 1,
0.09281936, -0.4066176, 2.500638, 0, 0.7137255, 1, 1,
0.09314105, 1.273125, -0.9531341, 0, 0.7058824, 1, 1,
0.09366723, -0.1026606, 3.610727, 0, 0.6980392, 1, 1,
0.09552131, 0.6346315, -0.5007106, 0, 0.6941177, 1, 1,
0.09699683, 2.564089, -0.8944235, 0, 0.6862745, 1, 1,
0.09868115, -0.4231521, 2.445843, 0, 0.682353, 1, 1,
0.1012386, 1.062406, 0.655494, 0, 0.6745098, 1, 1,
0.104283, -0.4459167, 2.834125, 0, 0.6705883, 1, 1,
0.1060863, 0.7830568, -1.466368, 0, 0.6627451, 1, 1,
0.1137709, 1.645209, 0.255818, 0, 0.6588235, 1, 1,
0.1157505, 0.6848168, 1.677148, 0, 0.6509804, 1, 1,
0.1169454, -0.1450965, 3.412858, 0, 0.6470588, 1, 1,
0.12088, 1.436434, 0.1422008, 0, 0.6392157, 1, 1,
0.1223532, -0.3122607, 0.8145046, 0, 0.6352941, 1, 1,
0.1280637, -1.003773, 3.432482, 0, 0.627451, 1, 1,
0.1341012, 0.06674457, 0.6167774, 0, 0.6235294, 1, 1,
0.1359186, 1.11183, 0.6898932, 0, 0.6156863, 1, 1,
0.1361516, -0.3148785, 2.28687, 0, 0.6117647, 1, 1,
0.1374937, 0.1275575, 0.3354584, 0, 0.6039216, 1, 1,
0.1426452, -1.244709, 2.983469, 0, 0.5960785, 1, 1,
0.1429134, -1.503088, 3.406655, 0, 0.5921569, 1, 1,
0.1457608, 0.5148721, -0.2427992, 0, 0.5843138, 1, 1,
0.1462765, 0.2712793, 1.623086, 0, 0.5803922, 1, 1,
0.149868, 0.06650046, 1.25395, 0, 0.572549, 1, 1,
0.1512962, 1.880381, 0.125805, 0, 0.5686275, 1, 1,
0.1521825, 0.3210301, 0.3681225, 0, 0.5607843, 1, 1,
0.1523913, -1.11825, 4.087415, 0, 0.5568628, 1, 1,
0.156343, 0.9882508, 1.180351, 0, 0.5490196, 1, 1,
0.1572196, -0.2456779, 2.32177, 0, 0.5450981, 1, 1,
0.1588161, -0.8431324, 1.646925, 0, 0.5372549, 1, 1,
0.1601759, 0.4401777, -2.575566, 0, 0.5333334, 1, 1,
0.1630242, 0.01192527, 2.313922, 0, 0.5254902, 1, 1,
0.1638298, -0.2633449, 1.330018, 0, 0.5215687, 1, 1,
0.1696878, 0.6242387, -0.4248155, 0, 0.5137255, 1, 1,
0.1705457, 1.37546, -0.6824856, 0, 0.509804, 1, 1,
0.17065, -0.9915841, 3.593013, 0, 0.5019608, 1, 1,
0.1710767, -0.3710976, 3.627179, 0, 0.4941176, 1, 1,
0.1720801, -0.1830431, 2.628864, 0, 0.4901961, 1, 1,
0.1721958, 1.446859, -0.5154723, 0, 0.4823529, 1, 1,
0.1744935, -0.8523089, 3.629196, 0, 0.4784314, 1, 1,
0.1784377, -0.7537676, 2.616814, 0, 0.4705882, 1, 1,
0.1817627, -0.9226964, 4.189949, 0, 0.4666667, 1, 1,
0.1886369, 1.576982, -0.1397496, 0, 0.4588235, 1, 1,
0.1889289, -0.548708, 3.382048, 0, 0.454902, 1, 1,
0.1909167, 0.4194086, -0.1929843, 0, 0.4470588, 1, 1,
0.1996069, 0.6247661, 0.3198078, 0, 0.4431373, 1, 1,
0.2071988, -1.484259, 4.772048, 0, 0.4352941, 1, 1,
0.2123587, 1.787352, 0.06820922, 0, 0.4313726, 1, 1,
0.2140033, -0.8441601, 2.824183, 0, 0.4235294, 1, 1,
0.2170457, 2.425429, -0.0147409, 0, 0.4196078, 1, 1,
0.2281801, 1.353766, -1.46265, 0, 0.4117647, 1, 1,
0.2291187, 1.402448, -0.05678103, 0, 0.4078431, 1, 1,
0.2322223, 0.6834847, -0.7344896, 0, 0.4, 1, 1,
0.2326065, 0.08674444, 0.6493199, 0, 0.3921569, 1, 1,
0.2369864, 0.6737801, -0.4103381, 0, 0.3882353, 1, 1,
0.2371919, -0.03084049, 1.266361, 0, 0.3803922, 1, 1,
0.2392722, -1.628324, 4.404684, 0, 0.3764706, 1, 1,
0.2403589, 0.2440985, 1.082496, 0, 0.3686275, 1, 1,
0.2439655, -0.1444968, 2.895545, 0, 0.3647059, 1, 1,
0.2480129, -0.5117707, 1.462165, 0, 0.3568628, 1, 1,
0.2503514, 0.6324688, 0.1877226, 0, 0.3529412, 1, 1,
0.2520061, -0.2783011, 2.613817, 0, 0.345098, 1, 1,
0.2584407, 0.9309211, 1.653679, 0, 0.3411765, 1, 1,
0.2644686, 0.8340737, 0.8267052, 0, 0.3333333, 1, 1,
0.2652671, -0.1382935, 3.437964, 0, 0.3294118, 1, 1,
0.2659485, -0.3190607, 1.861797, 0, 0.3215686, 1, 1,
0.2726268, -0.440088, 2.631463, 0, 0.3176471, 1, 1,
0.2734717, -1.055342, 3.773316, 0, 0.3098039, 1, 1,
0.2740768, 1.742237, 0.7884387, 0, 0.3058824, 1, 1,
0.2745805, -0.628194, 4.520066, 0, 0.2980392, 1, 1,
0.276642, 0.09391049, 2.525697, 0, 0.2901961, 1, 1,
0.2791197, 0.0779741, 1.68523, 0, 0.2862745, 1, 1,
0.2806565, -1.122652, 4.660947, 0, 0.2784314, 1, 1,
0.286386, 0.4430455, 0.4084657, 0, 0.2745098, 1, 1,
0.2900409, -0.7823689, 2.726699, 0, 0.2666667, 1, 1,
0.2937292, -0.1899582, 1.510449, 0, 0.2627451, 1, 1,
0.3044865, 0.3411457, 1.037479, 0, 0.254902, 1, 1,
0.3051883, -0.07349017, 1.028634, 0, 0.2509804, 1, 1,
0.3056261, -1.01376, 2.247131, 0, 0.2431373, 1, 1,
0.3058648, 0.1458716, 0.1712433, 0, 0.2392157, 1, 1,
0.3080562, -1.224727, 1.740596, 0, 0.2313726, 1, 1,
0.3094866, 0.1841356, 1.694988, 0, 0.227451, 1, 1,
0.3101599, -0.7949973, 2.734503, 0, 0.2196078, 1, 1,
0.3104781, 0.1088061, -0.2798631, 0, 0.2156863, 1, 1,
0.3174576, 0.8783423, 0.7771135, 0, 0.2078431, 1, 1,
0.319936, 2.066215, 0.251963, 0, 0.2039216, 1, 1,
0.3202384, 0.9715233, 1.384456, 0, 0.1960784, 1, 1,
0.3232862, 0.2765215, 1.850778, 0, 0.1882353, 1, 1,
0.3251076, 0.5601435, 0.1863764, 0, 0.1843137, 1, 1,
0.3252501, -0.515312, 4.106554, 0, 0.1764706, 1, 1,
0.3270312, -0.4423548, 1.682942, 0, 0.172549, 1, 1,
0.3270578, 0.1966519, -0.5436541, 0, 0.1647059, 1, 1,
0.3348647, 0.06631729, 0.8133821, 0, 0.1607843, 1, 1,
0.3386024, -0.8210238, 3.169307, 0, 0.1529412, 1, 1,
0.3402236, 1.158247, 1.842827, 0, 0.1490196, 1, 1,
0.3410357, 0.5219865, -2.049957, 0, 0.1411765, 1, 1,
0.3420361, -0.1784752, 2.563766, 0, 0.1372549, 1, 1,
0.3475688, -0.9010777, 4.295218, 0, 0.1294118, 1, 1,
0.3506583, 1.294427, 0.5474283, 0, 0.1254902, 1, 1,
0.3559733, 0.5798061, -0.3659159, 0, 0.1176471, 1, 1,
0.3606035, -0.3863071, 2.214773, 0, 0.1137255, 1, 1,
0.3618058, 0.1503975, 0.7977218, 0, 0.1058824, 1, 1,
0.3634868, -0.01654261, -0.483175, 0, 0.09803922, 1, 1,
0.3664758, -0.4716897, 3.44904, 0, 0.09411765, 1, 1,
0.3678038, 0.09421655, 1.630531, 0, 0.08627451, 1, 1,
0.3696856, 1.315021, -2.224238, 0, 0.08235294, 1, 1,
0.3722248, -0.0861141, 0.2811319, 0, 0.07450981, 1, 1,
0.3820212, 2.382905, -1.770965, 0, 0.07058824, 1, 1,
0.3826425, 0.1600387, 0.1579031, 0, 0.0627451, 1, 1,
0.3851895, -2.124164, 2.869551, 0, 0.05882353, 1, 1,
0.3923593, 0.7620056, 1.69076, 0, 0.05098039, 1, 1,
0.3951011, 0.6065279, 0.809034, 0, 0.04705882, 1, 1,
0.3984263, -0.8694344, 1.562156, 0, 0.03921569, 1, 1,
0.3996875, 0.9996943, -2.001818, 0, 0.03529412, 1, 1,
0.4064348, -2.251641, 3.388518, 0, 0.02745098, 1, 1,
0.4065734, -0.1031138, 0.5845516, 0, 0.02352941, 1, 1,
0.40693, -0.8369226, 1.922318, 0, 0.01568628, 1, 1,
0.4080123, -0.1501867, 2.068051, 0, 0.01176471, 1, 1,
0.4102561, 1.176577, 1.52564, 0, 0.003921569, 1, 1,
0.4153746, 1.42816, -0.3030725, 0.003921569, 0, 1, 1,
0.4196621, 0.9948722, 1.550009, 0.007843138, 0, 1, 1,
0.4244756, -0.3115723, 2.328987, 0.01568628, 0, 1, 1,
0.4266196, 0.1774839, 1.11107, 0.01960784, 0, 1, 1,
0.4303455, -0.7493032, 3.064744, 0.02745098, 0, 1, 1,
0.4379029, 1.671802, -0.814216, 0.03137255, 0, 1, 1,
0.4397368, 0.7384402, 0.4421812, 0.03921569, 0, 1, 1,
0.4430681, 0.7675118, 0.1758039, 0.04313726, 0, 1, 1,
0.4433057, -0.8747644, 2.008276, 0.05098039, 0, 1, 1,
0.4438002, 1.663324, -0.7415602, 0.05490196, 0, 1, 1,
0.4450403, 0.4222633, 1.586689, 0.0627451, 0, 1, 1,
0.4480167, 0.2209363, 2.432029, 0.06666667, 0, 1, 1,
0.4522553, 0.1194261, 0.8944732, 0.07450981, 0, 1, 1,
0.4522943, 0.6050591, 0.3373847, 0.07843138, 0, 1, 1,
0.4539508, 0.5749192, 1.222551, 0.08627451, 0, 1, 1,
0.4671878, -0.167941, 2.121174, 0.09019608, 0, 1, 1,
0.4756829, 1.286973, -1.782371, 0.09803922, 0, 1, 1,
0.4759363, -0.08079659, 0.7616606, 0.1058824, 0, 1, 1,
0.4760528, -1.023709, 2.34137, 0.1098039, 0, 1, 1,
0.4773591, 0.7598161, 1.518264, 0.1176471, 0, 1, 1,
0.4779312, 0.5210631, 1.180533, 0.1215686, 0, 1, 1,
0.4785985, -2.52394, 2.43781, 0.1294118, 0, 1, 1,
0.4829765, 0.2062023, 0.9871572, 0.1333333, 0, 1, 1,
0.4854226, -0.171031, 2.034215, 0.1411765, 0, 1, 1,
0.4859097, -0.9575927, 1.968593, 0.145098, 0, 1, 1,
0.4882413, 1.011795, 0.2965776, 0.1529412, 0, 1, 1,
0.489662, 1.338152, -0.2785462, 0.1568628, 0, 1, 1,
0.4899294, 0.6923652, 1.888901, 0.1647059, 0, 1, 1,
0.4933746, 0.6653492, 2.448019, 0.1686275, 0, 1, 1,
0.4936743, 1.108631, 1.622728, 0.1764706, 0, 1, 1,
0.4960797, -0.4703468, 0.6226821, 0.1803922, 0, 1, 1,
0.4982177, 1.874983, 0.2050705, 0.1882353, 0, 1, 1,
0.5003918, -0.8443549, 1.842321, 0.1921569, 0, 1, 1,
0.5013615, 0.7894939, 0.5515012, 0.2, 0, 1, 1,
0.5025961, -1.150118, 2.67259, 0.2078431, 0, 1, 1,
0.5050892, -0.9671556, 2.072418, 0.2117647, 0, 1, 1,
0.5092518, -0.9102437, 2.529158, 0.2196078, 0, 1, 1,
0.5121358, -0.345811, 2.321342, 0.2235294, 0, 1, 1,
0.5123521, -1.080056, 3.547016, 0.2313726, 0, 1, 1,
0.5135728, 0.8003569, 1.096979, 0.2352941, 0, 1, 1,
0.5155434, 0.6833637, 1.66713, 0.2431373, 0, 1, 1,
0.5163078, -0.1717571, 2.381318, 0.2470588, 0, 1, 1,
0.5220162, -0.9105498, 2.164376, 0.254902, 0, 1, 1,
0.5250692, 1.407035, -0.8730353, 0.2588235, 0, 1, 1,
0.5250977, -0.799156, 2.97528, 0.2666667, 0, 1, 1,
0.5279704, 0.4226813, 2.683595, 0.2705882, 0, 1, 1,
0.5291953, -0.9168775, 2.094104, 0.2784314, 0, 1, 1,
0.5292339, -1.754919, 3.689494, 0.282353, 0, 1, 1,
0.5294617, 0.3644117, 1.48841, 0.2901961, 0, 1, 1,
0.5301479, -1.376447, 3.781354, 0.2941177, 0, 1, 1,
0.5307791, 1.768657, -0.5582438, 0.3019608, 0, 1, 1,
0.5362172, -0.6310806, 3.353888, 0.3098039, 0, 1, 1,
0.5406504, 1.012177, 2.11619, 0.3137255, 0, 1, 1,
0.545206, -0.9247099, 2.362277, 0.3215686, 0, 1, 1,
0.5459957, 1.611567, 1.455246, 0.3254902, 0, 1, 1,
0.5466977, -0.887402, 2.540146, 0.3333333, 0, 1, 1,
0.5468873, -0.3170906, 0.2141066, 0.3372549, 0, 1, 1,
0.5532322, 2.497168, 1.06798, 0.345098, 0, 1, 1,
0.5533984, 0.3911802, 1.924641, 0.3490196, 0, 1, 1,
0.5572855, -0.472546, 1.064581, 0.3568628, 0, 1, 1,
0.5617109, 1.051954, -0.2196605, 0.3607843, 0, 1, 1,
0.5639352, 1.396582, 1.345541, 0.3686275, 0, 1, 1,
0.5708066, -0.8354899, 2.222467, 0.372549, 0, 1, 1,
0.5708399, -0.09343882, 2.609443, 0.3803922, 0, 1, 1,
0.571117, -0.8610209, 1.657926, 0.3843137, 0, 1, 1,
0.5804396, -2.139702, 3.067722, 0.3921569, 0, 1, 1,
0.582369, 0.7959811, 1.785261, 0.3960784, 0, 1, 1,
0.5864494, -0.1653816, 2.526791, 0.4039216, 0, 1, 1,
0.5890688, 0.9205852, 0.6201798, 0.4117647, 0, 1, 1,
0.5910184, -0.624039, 1.8066, 0.4156863, 0, 1, 1,
0.5922816, -0.4544062, 1.037644, 0.4235294, 0, 1, 1,
0.5926876, -2.072829, 3.847274, 0.427451, 0, 1, 1,
0.5949976, 0.1722715, 0.3525415, 0.4352941, 0, 1, 1,
0.5952225, 0.01215649, 0.9741365, 0.4392157, 0, 1, 1,
0.5963759, 0.05532395, 0.5524501, 0.4470588, 0, 1, 1,
0.599937, 1.025117, 0.4037721, 0.4509804, 0, 1, 1,
0.6018707, -1.135601, 4.251329, 0.4588235, 0, 1, 1,
0.6041784, 0.4965541, 0.6017036, 0.4627451, 0, 1, 1,
0.6045944, 1.263766, 1.670821, 0.4705882, 0, 1, 1,
0.6067356, 1.393268, 0.7876135, 0.4745098, 0, 1, 1,
0.6113028, -0.3651514, 2.934043, 0.4823529, 0, 1, 1,
0.6134763, 1.692033, 0.4948571, 0.4862745, 0, 1, 1,
0.6177406, 0.4792792, 1.106107, 0.4941176, 0, 1, 1,
0.6241723, 0.9464592, 0.6303402, 0.5019608, 0, 1, 1,
0.6252056, 0.3958115, 1.268583, 0.5058824, 0, 1, 1,
0.6259449, -0.6580835, 1.0844, 0.5137255, 0, 1, 1,
0.629158, 1.212996, 0.5862274, 0.5176471, 0, 1, 1,
0.6305418, 0.5508537, 0.3993738, 0.5254902, 0, 1, 1,
0.6398901, -0.6556664, 2.488892, 0.5294118, 0, 1, 1,
0.6406809, 1.413451, -0.28973, 0.5372549, 0, 1, 1,
0.6420288, -2.226218, 3.011746, 0.5411765, 0, 1, 1,
0.6431285, 0.1958883, 0.5903234, 0.5490196, 0, 1, 1,
0.6446087, -1.213177, 2.316169, 0.5529412, 0, 1, 1,
0.6499244, 0.4698731, 3.511232, 0.5607843, 0, 1, 1,
0.6522626, -0.8773646, 3.471813, 0.5647059, 0, 1, 1,
0.6527005, 0.6450363, -0.5422652, 0.572549, 0, 1, 1,
0.6552473, -1.382012, 3.226568, 0.5764706, 0, 1, 1,
0.6555547, -0.8586657, 2.386575, 0.5843138, 0, 1, 1,
0.6560611, 0.1779083, 1.396229, 0.5882353, 0, 1, 1,
0.6568797, 0.2664481, 2.194757, 0.5960785, 0, 1, 1,
0.6714396, -0.6446565, 3.320476, 0.6039216, 0, 1, 1,
0.677058, 0.1378845, 2.857242, 0.6078432, 0, 1, 1,
0.6801887, 1.981492, -0.9705209, 0.6156863, 0, 1, 1,
0.6888266, 1.837802, -1.289966, 0.6196079, 0, 1, 1,
0.6916522, -0.06494937, 1.615687, 0.627451, 0, 1, 1,
0.6932918, -0.08555147, 1.205534, 0.6313726, 0, 1, 1,
0.6937287, 1.725229, 1.465912, 0.6392157, 0, 1, 1,
0.6959477, -0.3856204, 2.14777, 0.6431373, 0, 1, 1,
0.7016225, 1.204715, -0.1991145, 0.6509804, 0, 1, 1,
0.7052057, 0.7080113, 0.6265367, 0.654902, 0, 1, 1,
0.7118076, -0.1194827, 1.016891, 0.6627451, 0, 1, 1,
0.7144392, -0.6345557, 2.819607, 0.6666667, 0, 1, 1,
0.717718, -0.5813302, 4.012362, 0.6745098, 0, 1, 1,
0.720834, -0.3632811, 3.307941, 0.6784314, 0, 1, 1,
0.7258251, 1.077276, 0.639759, 0.6862745, 0, 1, 1,
0.7270033, 0.8793497, 0.3292627, 0.6901961, 0, 1, 1,
0.7290354, 1.547961, 0.100471, 0.6980392, 0, 1, 1,
0.7386749, 0.01349167, 1.096836, 0.7058824, 0, 1, 1,
0.7403479, -2.219446, 5.501245, 0.7098039, 0, 1, 1,
0.7403942, 2.025826, -1.016577, 0.7176471, 0, 1, 1,
0.7448058, 0.2228268, 0.1076012, 0.7215686, 0, 1, 1,
0.7472318, -0.3120958, 2.181984, 0.7294118, 0, 1, 1,
0.7599991, 1.509982, 0.04977268, 0.7333333, 0, 1, 1,
0.7730367, 0.9779731, 0.9033415, 0.7411765, 0, 1, 1,
0.7737071, 1.062539, 0.875064, 0.7450981, 0, 1, 1,
0.7761189, -1.140578, 3.022851, 0.7529412, 0, 1, 1,
0.7773194, -1.216739, 0.6550091, 0.7568628, 0, 1, 1,
0.7851987, 0.1242297, 0.6769746, 0.7647059, 0, 1, 1,
0.8032178, -0.199713, 2.220589, 0.7686275, 0, 1, 1,
0.8092075, 1.141918, 0.1214004, 0.7764706, 0, 1, 1,
0.8157735, -0.996399, 1.763308, 0.7803922, 0, 1, 1,
0.8225972, -1.619024, 3.613043, 0.7882353, 0, 1, 1,
0.8233568, -0.208395, 1.640903, 0.7921569, 0, 1, 1,
0.8265294, 0.2337089, 1.672169, 0.8, 0, 1, 1,
0.8270797, -1.64194, 3.223147, 0.8078431, 0, 1, 1,
0.839295, -1.984988, 2.938999, 0.8117647, 0, 1, 1,
0.8405457, -1.650288, 2.159674, 0.8196079, 0, 1, 1,
0.8438332, -1.500654, 3.680598, 0.8235294, 0, 1, 1,
0.8449184, -0.6426353, 1.87049, 0.8313726, 0, 1, 1,
0.8450405, 1.02503, 0.6105939, 0.8352941, 0, 1, 1,
0.8463152, 0.650062, 0.3574808, 0.8431373, 0, 1, 1,
0.8499653, 1.302524, 1.830482, 0.8470588, 0, 1, 1,
0.8505943, 1.126673, 1.596995, 0.854902, 0, 1, 1,
0.8538285, 0.2811812, 0.1255267, 0.8588235, 0, 1, 1,
0.8555984, -1.845119, 3.395375, 0.8666667, 0, 1, 1,
0.8558226, 1.309161, 1.895376, 0.8705882, 0, 1, 1,
0.8560307, 0.2482138, 2.869125, 0.8784314, 0, 1, 1,
0.8573411, -0.505099, 1.637276, 0.8823529, 0, 1, 1,
0.8636446, 0.3659803, 2.012075, 0.8901961, 0, 1, 1,
0.8642102, -0.3688376, 0.5771418, 0.8941177, 0, 1, 1,
0.8666701, -0.5352502, 1.45984, 0.9019608, 0, 1, 1,
0.8737108, 1.509534, 1.196705, 0.9098039, 0, 1, 1,
0.880498, -1.855415, 2.86799, 0.9137255, 0, 1, 1,
0.8816023, 0.0250523, 1.981845, 0.9215686, 0, 1, 1,
0.8855007, 0.4501403, 1.757666, 0.9254902, 0, 1, 1,
0.8920887, 0.7146081, 0.04965903, 0.9333333, 0, 1, 1,
0.9039857, -1.14057, 0.6462644, 0.9372549, 0, 1, 1,
0.9117467, 0.8643773, 0.7665604, 0.945098, 0, 1, 1,
0.9162508, 0.03859414, 2.371449, 0.9490196, 0, 1, 1,
0.9169347, 1.381703, 0.7409788, 0.9568627, 0, 1, 1,
0.9186515, -0.01340563, 2.993901, 0.9607843, 0, 1, 1,
0.9304197, 1.255768, -0.6587098, 0.9686275, 0, 1, 1,
0.9323967, 0.4648884, 1.633457, 0.972549, 0, 1, 1,
0.9330903, -0.6301652, 2.149841, 0.9803922, 0, 1, 1,
0.9332649, 0.3470686, 3.264437, 0.9843137, 0, 1, 1,
0.9344637, -2.371767, 1.145366, 0.9921569, 0, 1, 1,
0.9345676, 1.22914, 0.5555231, 0.9960784, 0, 1, 1,
0.9352213, 1.576844, -0.03083157, 1, 0, 0.9960784, 1,
0.9382731, -0.3770795, 2.54019, 1, 0, 0.9882353, 1,
0.9441402, -0.8909569, 3.032447, 1, 0, 0.9843137, 1,
0.9451523, 0.4881898, 1.024317, 1, 0, 0.9764706, 1,
0.9505388, -1.248353, 0.7635311, 1, 0, 0.972549, 1,
0.9573119, -0.9223586, 2.789145, 1, 0, 0.9647059, 1,
0.9591665, -0.621726, 1.964795, 1, 0, 0.9607843, 1,
0.9602543, 0.6659533, 0.9763532, 1, 0, 0.9529412, 1,
0.963786, -0.3128345, 2.151967, 1, 0, 0.9490196, 1,
0.9736516, -0.2049634, 1.362151, 1, 0, 0.9411765, 1,
0.9777583, 0.4291039, 1.160574, 1, 0, 0.9372549, 1,
0.9806805, -0.635636, 0.7595657, 1, 0, 0.9294118, 1,
0.9815192, 0.7648183, -0.8538657, 1, 0, 0.9254902, 1,
0.9816845, 0.9428195, 0.729559, 1, 0, 0.9176471, 1,
0.9844047, 1.532898, 0.7858178, 1, 0, 0.9137255, 1,
0.9876142, -0.2425412, 1.064879, 1, 0, 0.9058824, 1,
0.9879144, -0.9568437, 2.790293, 1, 0, 0.9019608, 1,
0.989453, 1.62951, 2.038118, 1, 0, 0.8941177, 1,
0.9895331, -1.947546, 1.667906, 1, 0, 0.8862745, 1,
0.9897442, 1.881335, 0.4723088, 1, 0, 0.8823529, 1,
0.9919448, 0.1237051, 2.360007, 1, 0, 0.8745098, 1,
0.9936688, -1.47976, 1.567325, 1, 0, 0.8705882, 1,
0.9945279, 0.689013, -0.292556, 1, 0, 0.8627451, 1,
0.9984668, 0.3590167, 2.346211, 1, 0, 0.8588235, 1,
1.005913, 0.6027067, 1.992257, 1, 0, 0.8509804, 1,
1.006668, -0.261999, 2.204682, 1, 0, 0.8470588, 1,
1.009785, -1.409628, 3.358348, 1, 0, 0.8392157, 1,
1.011717, 1.08601, 1.576741, 1, 0, 0.8352941, 1,
1.018788, -0.4450934, 2.755666, 1, 0, 0.827451, 1,
1.023613, -0.4821616, 1.656432, 1, 0, 0.8235294, 1,
1.026573, -0.02372967, 4.368752, 1, 0, 0.8156863, 1,
1.037243, -0.4419676, 0.9108379, 1, 0, 0.8117647, 1,
1.038944, -1.736174, 1.344417, 1, 0, 0.8039216, 1,
1.041455, -1.011265, 2.610723, 1, 0, 0.7960784, 1,
1.047012, -0.8999444, 1.945677, 1, 0, 0.7921569, 1,
1.04712, 0.4123249, 0.08353377, 1, 0, 0.7843137, 1,
1.062876, 0.877332, 1.720211, 1, 0, 0.7803922, 1,
1.063172, 0.1251602, 2.250298, 1, 0, 0.772549, 1,
1.0652, 1.162028, 1.215842, 1, 0, 0.7686275, 1,
1.071443, -0.02633004, 2.760015, 1, 0, 0.7607843, 1,
1.080692, 1.350512, 0.008598078, 1, 0, 0.7568628, 1,
1.082502, -0.1011321, 1.157108, 1, 0, 0.7490196, 1,
1.085634, -0.2125116, 2.679618, 1, 0, 0.7450981, 1,
1.114784, -0.8079339, 3.1195, 1, 0, 0.7372549, 1,
1.11521, 0.1636816, 2.12081, 1, 0, 0.7333333, 1,
1.121427, -0.4881743, 0.9737203, 1, 0, 0.7254902, 1,
1.124044, -0.2654934, 3.400852, 1, 0, 0.7215686, 1,
1.127671, 2.054364, 0.5157608, 1, 0, 0.7137255, 1,
1.133981, -1.153692, 2.757829, 1, 0, 0.7098039, 1,
1.134992, -0.8676254, 1.494354, 1, 0, 0.7019608, 1,
1.135185, -0.2156341, 2.143415, 1, 0, 0.6941177, 1,
1.143564, -1.397434, 3.460583, 1, 0, 0.6901961, 1,
1.147199, 1.359089, -0.2054699, 1, 0, 0.682353, 1,
1.159155, -0.4666871, 1.337377, 1, 0, 0.6784314, 1,
1.164455, -0.6055919, 2.78251, 1, 0, 0.6705883, 1,
1.172985, 0.6708041, 1.925694, 1, 0, 0.6666667, 1,
1.180312, 0.9231198, 3.260033, 1, 0, 0.6588235, 1,
1.182938, -1.918548, 3.316692, 1, 0, 0.654902, 1,
1.185447, -0.3118117, 3.715734, 1, 0, 0.6470588, 1,
1.188533, 0.8974983, -0.5299975, 1, 0, 0.6431373, 1,
1.192875, 0.2715252, 1.649811, 1, 0, 0.6352941, 1,
1.193832, 1.767283, 0.7689023, 1, 0, 0.6313726, 1,
1.195462, 1.138447, 1.430724, 1, 0, 0.6235294, 1,
1.198969, 0.8545058, 1.749113, 1, 0, 0.6196079, 1,
1.203213, 1.83812, 1.656625, 1, 0, 0.6117647, 1,
1.206664, -0.4101603, -0.1121854, 1, 0, 0.6078432, 1,
1.215651, -1.005467, 1.939903, 1, 0, 0.6, 1,
1.219464, -1.711147, 1.656788, 1, 0, 0.5921569, 1,
1.220209, -0.1129015, 3.040514, 1, 0, 0.5882353, 1,
1.223076, -1.656028, 2.165984, 1, 0, 0.5803922, 1,
1.223611, 0.7796946, 2.664064, 1, 0, 0.5764706, 1,
1.231519, -0.03347908, 0.1761754, 1, 0, 0.5686275, 1,
1.233734, 0.3001136, 0.3855278, 1, 0, 0.5647059, 1,
1.24262, -0.8384789, 1.211875, 1, 0, 0.5568628, 1,
1.242921, 0.8797725, 0.8398347, 1, 0, 0.5529412, 1,
1.25209, 1.378315, 0.185399, 1, 0, 0.5450981, 1,
1.256972, -0.9014635, 2.621073, 1, 0, 0.5411765, 1,
1.266894, -1.958869, 1.97881, 1, 0, 0.5333334, 1,
1.271784, 0.1973388, 0.4011864, 1, 0, 0.5294118, 1,
1.272086, 1.722846, 1.165825, 1, 0, 0.5215687, 1,
1.286862, 0.8599599, 0.1150901, 1, 0, 0.5176471, 1,
1.295695, 0.1407313, 2.826619, 1, 0, 0.509804, 1,
1.295969, -1.358189, 1.991946, 1, 0, 0.5058824, 1,
1.298729, 0.3716164, 2.097546, 1, 0, 0.4980392, 1,
1.300352, 0.07869384, 3.245969, 1, 0, 0.4901961, 1,
1.305467, -1.417538, 2.289798, 1, 0, 0.4862745, 1,
1.342361, 1.213966, 0.7002922, 1, 0, 0.4784314, 1,
1.356074, 0.6355712, -0.5994962, 1, 0, 0.4745098, 1,
1.358196, 0.02492086, 1.759383, 1, 0, 0.4666667, 1,
1.368474, 1.095585, 0.1254648, 1, 0, 0.4627451, 1,
1.370618, 0.3268852, 2.596301, 1, 0, 0.454902, 1,
1.37276, 0.1454518, 1.61526, 1, 0, 0.4509804, 1,
1.378046, -0.1927564, 0.1800986, 1, 0, 0.4431373, 1,
1.380189, -0.4309541, 2.107422, 1, 0, 0.4392157, 1,
1.38123, -0.3049397, 2.698454, 1, 0, 0.4313726, 1,
1.390161, 0.3492951, 2.62152, 1, 0, 0.427451, 1,
1.400843, -0.3379695, 1.338006, 1, 0, 0.4196078, 1,
1.402952, -0.6682162, 3.375137, 1, 0, 0.4156863, 1,
1.409204, 1.263252, 1.869829, 1, 0, 0.4078431, 1,
1.421335, -1.091048, 3.249715, 1, 0, 0.4039216, 1,
1.421566, 0.5766824, 1.850783, 1, 0, 0.3960784, 1,
1.424121, 0.2789644, 2.29979, 1, 0, 0.3882353, 1,
1.43847, 0.8120341, 1.352077, 1, 0, 0.3843137, 1,
1.45523, 1.998487, -0.6739171, 1, 0, 0.3764706, 1,
1.459624, -0.6881006, 2.21934, 1, 0, 0.372549, 1,
1.463069, 0.5691434, 2.095007, 1, 0, 0.3647059, 1,
1.464884, -0.3294338, 1.030761, 1, 0, 0.3607843, 1,
1.482064, -1.854824, 2.611094, 1, 0, 0.3529412, 1,
1.487869, -0.2541959, 2.664469, 1, 0, 0.3490196, 1,
1.492115, -1.879273, 1.419877, 1, 0, 0.3411765, 1,
1.495051, 1.757852, 0.04443567, 1, 0, 0.3372549, 1,
1.507283, -2.348421, 0.9309838, 1, 0, 0.3294118, 1,
1.517109, -2.061636, 2.14848, 1, 0, 0.3254902, 1,
1.557763, 0.3229218, 2.130054, 1, 0, 0.3176471, 1,
1.560427, -1.731224, 2.693131, 1, 0, 0.3137255, 1,
1.563027, -0.5383956, 3.187562, 1, 0, 0.3058824, 1,
1.566393, -0.3799383, 0.5527437, 1, 0, 0.2980392, 1,
1.580399, 0.6690311, -0.9251757, 1, 0, 0.2941177, 1,
1.589534, -0.9877516, 1.92679, 1, 0, 0.2862745, 1,
1.606866, 0.1564088, 0.7484788, 1, 0, 0.282353, 1,
1.608142, -0.06357458, 1.0528, 1, 0, 0.2745098, 1,
1.617817, 2.152486, 0.7326645, 1, 0, 0.2705882, 1,
1.63063, 2.130342, 0.7091638, 1, 0, 0.2627451, 1,
1.630638, 0.7099064, 0.1978049, 1, 0, 0.2588235, 1,
1.637106, 0.8490608, 3.599994, 1, 0, 0.2509804, 1,
1.642046, -0.9706299, 3.661517, 1, 0, 0.2470588, 1,
1.654627, -0.3463327, 1.743763, 1, 0, 0.2392157, 1,
1.667619, 2.160279, 1.102679, 1, 0, 0.2352941, 1,
1.685851, -0.3194126, 1.567688, 1, 0, 0.227451, 1,
1.692957, -1.51203, 1.217234, 1, 0, 0.2235294, 1,
1.705034, -0.3820075, 2.393083, 1, 0, 0.2156863, 1,
1.70781, 1.732271, 1.040262, 1, 0, 0.2117647, 1,
1.730476, -0.5398117, 2.061259, 1, 0, 0.2039216, 1,
1.757042, 2.400915, 1.493335, 1, 0, 0.1960784, 1,
1.763035, -0.2810602, 1.791193, 1, 0, 0.1921569, 1,
1.76624, 0.7198167, 1.67683, 1, 0, 0.1843137, 1,
1.771212, -1.738803, 2.338813, 1, 0, 0.1803922, 1,
1.775684, 1.347405, -0.4270405, 1, 0, 0.172549, 1,
1.795867, 0.185394, 1.455386, 1, 0, 0.1686275, 1,
1.81003, -0.2245714, -0.3507412, 1, 0, 0.1607843, 1,
1.813101, -0.6921902, 1.12596, 1, 0, 0.1568628, 1,
1.827055, 0.3950867, 1.574133, 1, 0, 0.1490196, 1,
1.83455, 0.5348592, 1.555185, 1, 0, 0.145098, 1,
1.84705, 1.523885, 0.05951779, 1, 0, 0.1372549, 1,
1.865212, -0.1584565, 1.078783, 1, 0, 0.1333333, 1,
1.870424, 0.4657228, -2.070266, 1, 0, 0.1254902, 1,
1.882568, 0.01451164, 1.15977, 1, 0, 0.1215686, 1,
1.900129, -1.34717, 1.100837, 1, 0, 0.1137255, 1,
1.906931, 0.3911205, 1.711163, 1, 0, 0.1098039, 1,
1.925334, -1.009333, 1.261979, 1, 0, 0.1019608, 1,
1.931568, -0.6038838, 1.567295, 1, 0, 0.09411765, 1,
1.956533, -0.05694989, 1.426663, 1, 0, 0.09019608, 1,
1.978502, -0.6373872, 1.333136, 1, 0, 0.08235294, 1,
1.979634, 1.216461, 1.077146, 1, 0, 0.07843138, 1,
1.996499, 0.7047074, 0.6767954, 1, 0, 0.07058824, 1,
2.066601, -2.309422, 0.6868097, 1, 0, 0.06666667, 1,
2.093908, -1.090366, 2.508337, 1, 0, 0.05882353, 1,
2.109139, 0.4247107, 0.9865781, 1, 0, 0.05490196, 1,
2.16047, 0.2082764, 1.565225, 1, 0, 0.04705882, 1,
2.182861, 1.615276, 0.7066288, 1, 0, 0.04313726, 1,
2.225918, 1.164675, 3.159387, 1, 0, 0.03529412, 1,
2.327198, -0.641863, 1.934301, 1, 0, 0.03137255, 1,
2.368533, -1.186121, 0.04984692, 1, 0, 0.02352941, 1,
2.458129, -0.2354756, 1.910183, 1, 0, 0.01960784, 1,
2.48008, -0.4247745, 0.8558339, 1, 0, 0.01176471, 1,
2.97524, 1.784764, 0.2625427, 1, 0, 0.007843138, 1
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
0.1526182, -3.387338, -7.031929, 0, -0.5, 0.5, 0.5,
0.1526182, -3.387338, -7.031929, 1, -0.5, 0.5, 0.5,
0.1526182, -3.387338, -7.031929, 1, 1.5, 0.5, 0.5,
0.1526182, -3.387338, -7.031929, 0, 1.5, 0.5, 0.5
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
-3.626872, 0.02295649, -7.031929, 0, -0.5, 0.5, 0.5,
-3.626872, 0.02295649, -7.031929, 1, -0.5, 0.5, 0.5,
-3.626872, 0.02295649, -7.031929, 1, 1.5, 0.5, 0.5,
-3.626872, 0.02295649, -7.031929, 0, 1.5, 0.5, 0.5
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
-3.626872, -3.387338, 0.1428976, 0, -0.5, 0.5, 0.5,
-3.626872, -3.387338, 0.1428976, 1, -0.5, 0.5, 0.5,
-3.626872, -3.387338, 0.1428976, 1, 1.5, 0.5, 0.5,
-3.626872, -3.387338, 0.1428976, 0, 1.5, 0.5, 0.5
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
-2, -2.600347, -5.3762,
2, -2.600347, -5.3762,
-2, -2.600347, -5.3762,
-2, -2.731512, -5.652154,
-1, -2.600347, -5.3762,
-1, -2.731512, -5.652154,
0, -2.600347, -5.3762,
0, -2.731512, -5.652154,
1, -2.600347, -5.3762,
1, -2.731512, -5.652154,
2, -2.600347, -5.3762,
2, -2.731512, -5.652154
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
-2, -2.993843, -6.204064, 0, -0.5, 0.5, 0.5,
-2, -2.993843, -6.204064, 1, -0.5, 0.5, 0.5,
-2, -2.993843, -6.204064, 1, 1.5, 0.5, 0.5,
-2, -2.993843, -6.204064, 0, 1.5, 0.5, 0.5,
-1, -2.993843, -6.204064, 0, -0.5, 0.5, 0.5,
-1, -2.993843, -6.204064, 1, -0.5, 0.5, 0.5,
-1, -2.993843, -6.204064, 1, 1.5, 0.5, 0.5,
-1, -2.993843, -6.204064, 0, 1.5, 0.5, 0.5,
0, -2.993843, -6.204064, 0, -0.5, 0.5, 0.5,
0, -2.993843, -6.204064, 1, -0.5, 0.5, 0.5,
0, -2.993843, -6.204064, 1, 1.5, 0.5, 0.5,
0, -2.993843, -6.204064, 0, 1.5, 0.5, 0.5,
1, -2.993843, -6.204064, 0, -0.5, 0.5, 0.5,
1, -2.993843, -6.204064, 1, -0.5, 0.5, 0.5,
1, -2.993843, -6.204064, 1, 1.5, 0.5, 0.5,
1, -2.993843, -6.204064, 0, 1.5, 0.5, 0.5,
2, -2.993843, -6.204064, 0, -0.5, 0.5, 0.5,
2, -2.993843, -6.204064, 1, -0.5, 0.5, 0.5,
2, -2.993843, -6.204064, 1, 1.5, 0.5, 0.5,
2, -2.993843, -6.204064, 0, 1.5, 0.5, 0.5
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
-2.754682, -2, -5.3762,
-2.754682, 2, -5.3762,
-2.754682, -2, -5.3762,
-2.900047, -2, -5.652154,
-2.754682, -1, -5.3762,
-2.900047, -1, -5.652154,
-2.754682, 0, -5.3762,
-2.900047, 0, -5.652154,
-2.754682, 1, -5.3762,
-2.900047, 1, -5.652154,
-2.754682, 2, -5.3762,
-2.900047, 2, -5.652154
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
-3.190777, -2, -6.204064, 0, -0.5, 0.5, 0.5,
-3.190777, -2, -6.204064, 1, -0.5, 0.5, 0.5,
-3.190777, -2, -6.204064, 1, 1.5, 0.5, 0.5,
-3.190777, -2, -6.204064, 0, 1.5, 0.5, 0.5,
-3.190777, -1, -6.204064, 0, -0.5, 0.5, 0.5,
-3.190777, -1, -6.204064, 1, -0.5, 0.5, 0.5,
-3.190777, -1, -6.204064, 1, 1.5, 0.5, 0.5,
-3.190777, -1, -6.204064, 0, 1.5, 0.5, 0.5,
-3.190777, 0, -6.204064, 0, -0.5, 0.5, 0.5,
-3.190777, 0, -6.204064, 1, -0.5, 0.5, 0.5,
-3.190777, 0, -6.204064, 1, 1.5, 0.5, 0.5,
-3.190777, 0, -6.204064, 0, 1.5, 0.5, 0.5,
-3.190777, 1, -6.204064, 0, -0.5, 0.5, 0.5,
-3.190777, 1, -6.204064, 1, -0.5, 0.5, 0.5,
-3.190777, 1, -6.204064, 1, 1.5, 0.5, 0.5,
-3.190777, 1, -6.204064, 0, 1.5, 0.5, 0.5,
-3.190777, 2, -6.204064, 0, -0.5, 0.5, 0.5,
-3.190777, 2, -6.204064, 1, -0.5, 0.5, 0.5,
-3.190777, 2, -6.204064, 1, 1.5, 0.5, 0.5,
-3.190777, 2, -6.204064, 0, 1.5, 0.5, 0.5
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
-2.754682, -2.600347, -4,
-2.754682, -2.600347, 4,
-2.754682, -2.600347, -4,
-2.900047, -2.731512, -4,
-2.754682, -2.600347, -2,
-2.900047, -2.731512, -2,
-2.754682, -2.600347, 0,
-2.900047, -2.731512, 0,
-2.754682, -2.600347, 2,
-2.900047, -2.731512, 2,
-2.754682, -2.600347, 4,
-2.900047, -2.731512, 4
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
-3.190777, -2.993843, -4, 0, -0.5, 0.5, 0.5,
-3.190777, -2.993843, -4, 1, -0.5, 0.5, 0.5,
-3.190777, -2.993843, -4, 1, 1.5, 0.5, 0.5,
-3.190777, -2.993843, -4, 0, 1.5, 0.5, 0.5,
-3.190777, -2.993843, -2, 0, -0.5, 0.5, 0.5,
-3.190777, -2.993843, -2, 1, -0.5, 0.5, 0.5,
-3.190777, -2.993843, -2, 1, 1.5, 0.5, 0.5,
-3.190777, -2.993843, -2, 0, 1.5, 0.5, 0.5,
-3.190777, -2.993843, 0, 0, -0.5, 0.5, 0.5,
-3.190777, -2.993843, 0, 1, -0.5, 0.5, 0.5,
-3.190777, -2.993843, 0, 1, 1.5, 0.5, 0.5,
-3.190777, -2.993843, 0, 0, 1.5, 0.5, 0.5,
-3.190777, -2.993843, 2, 0, -0.5, 0.5, 0.5,
-3.190777, -2.993843, 2, 1, -0.5, 0.5, 0.5,
-3.190777, -2.993843, 2, 1, 1.5, 0.5, 0.5,
-3.190777, -2.993843, 2, 0, 1.5, 0.5, 0.5,
-3.190777, -2.993843, 4, 0, -0.5, 0.5, 0.5,
-3.190777, -2.993843, 4, 1, -0.5, 0.5, 0.5,
-3.190777, -2.993843, 4, 1, 1.5, 0.5, 0.5,
-3.190777, -2.993843, 4, 0, 1.5, 0.5, 0.5
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
-2.754682, -2.600347, -5.3762,
-2.754682, 2.64626, -5.3762,
-2.754682, -2.600347, 5.661995,
-2.754682, 2.64626, 5.661995,
-2.754682, -2.600347, -5.3762,
-2.754682, -2.600347, 5.661995,
-2.754682, 2.64626, -5.3762,
-2.754682, 2.64626, 5.661995,
-2.754682, -2.600347, -5.3762,
3.059918, -2.600347, -5.3762,
-2.754682, -2.600347, 5.661995,
3.059918, -2.600347, 5.661995,
-2.754682, 2.64626, -5.3762,
3.059918, 2.64626, -5.3762,
-2.754682, 2.64626, 5.661995,
3.059918, 2.64626, 5.661995,
3.059918, -2.600347, -5.3762,
3.059918, 2.64626, -5.3762,
3.059918, -2.600347, 5.661995,
3.059918, 2.64626, 5.661995,
3.059918, -2.600347, -5.3762,
3.059918, -2.600347, 5.661995,
3.059918, 2.64626, -5.3762,
3.059918, 2.64626, 5.661995
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
var radius = 7.227072;
var distance = 32.15406;
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
mvMatrix.translate( -0.1526182, -0.02295649, -0.1428976 );
mvMatrix.scale( 1.343867, 1.489353, 0.7079103 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.15406);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
C17H21ClN2O2S<-read.table("C17H21ClN2O2S.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-C17H21ClN2O2S$V2
```

```
## Error in eval(expr, envir, enclos): object 'C17H21ClN2O2S' not found
```

```r
y<-C17H21ClN2O2S$V3
```

```
## Error in eval(expr, envir, enclos): object 'C17H21ClN2O2S' not found
```

```r
z<-C17H21ClN2O2S$V4
```

```
## Error in eval(expr, envir, enclos): object 'C17H21ClN2O2S' not found
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
-2.670003, -1.753309, -1.787215, 0, 0, 1, 1, 1,
-2.541553, 0.6312633, -2.227237, 1, 0, 0, 1, 1,
-2.511078, 0.5396729, -1.752691, 1, 0, 0, 1, 1,
-2.499081, 0.4519902, -1.820797, 1, 0, 0, 1, 1,
-2.484345, -0.09407629, -2.976993, 1, 0, 0, 1, 1,
-2.480514, 0.9473269, -1.648297, 1, 0, 0, 1, 1,
-2.479095, -1.406069, -1.5963, 0, 0, 0, 1, 1,
-2.440764, 0.2365009, -3.356264, 0, 0, 0, 1, 1,
-2.33759, -0.4555527, -1.653664, 0, 0, 0, 1, 1,
-2.190628, 0.2593498, -2.901057, 0, 0, 0, 1, 1,
-2.142138, -0.7138819, -2.034157, 0, 0, 0, 1, 1,
-2.117291, -0.641276, -1.675653, 0, 0, 0, 1, 1,
-2.0969, -0.3936321, -3.388455, 0, 0, 0, 1, 1,
-2.075919, 0.09483406, -1.93012, 1, 1, 1, 1, 1,
-2.070147, -0.7622359, -0.5336654, 1, 1, 1, 1, 1,
-2.06705, -0.4831193, -3.295579, 1, 1, 1, 1, 1,
-2.052561, -0.100327, -0.417326, 1, 1, 1, 1, 1,
-2.034802, -0.200895, -0.976485, 1, 1, 1, 1, 1,
-2.032166, 0.1653389, -1.758414, 1, 1, 1, 1, 1,
-2.024924, -0.6542719, -1.368525, 1, 1, 1, 1, 1,
-1.955048, 1.501612, -1.263499, 1, 1, 1, 1, 1,
-1.935, -1.39527, -3.630388, 1, 1, 1, 1, 1,
-1.926162, 0.9254853, -1.091524, 1, 1, 1, 1, 1,
-1.913346, -1.834873, -1.76269, 1, 1, 1, 1, 1,
-1.911431, 1.396355, -1.194322, 1, 1, 1, 1, 1,
-1.88716, 0.3955465, -0.277943, 1, 1, 1, 1, 1,
-1.883097, -0.3641964, -2.284436, 1, 1, 1, 1, 1,
-1.872921, 0.6342277, -1.597581, 1, 1, 1, 1, 1,
-1.872498, 0.5092739, -2.293238, 0, 0, 1, 1, 1,
-1.865556, 0.05019373, -1.400608, 1, 0, 0, 1, 1,
-1.843693, -1.61233, -2.512155, 1, 0, 0, 1, 1,
-1.831714, -0.03822809, -3.955913, 1, 0, 0, 1, 1,
-1.818888, -0.1998774, -0.6210076, 1, 0, 0, 1, 1,
-1.806472, -0.5115892, -3.111718, 1, 0, 0, 1, 1,
-1.795332, 0.7514845, -2.636363, 0, 0, 0, 1, 1,
-1.779767, -1.379433, -2.952673, 0, 0, 0, 1, 1,
-1.757398, 0.1494798, -0.2126105, 0, 0, 0, 1, 1,
-1.744583, -0.01763451, -2.964899, 0, 0, 0, 1, 1,
-1.729571, -0.07704979, -1.989492, 0, 0, 0, 1, 1,
-1.697215, 1.085413, 0.6016096, 0, 0, 0, 1, 1,
-1.685302, 0.8565997, -1.338704, 0, 0, 0, 1, 1,
-1.682798, 0.06104514, -1.41102, 1, 1, 1, 1, 1,
-1.659163, -1.092936, -2.765294, 1, 1, 1, 1, 1,
-1.639258, -1.472058, -4.907642, 1, 1, 1, 1, 1,
-1.626789, -1.179268, -1.598647, 1, 1, 1, 1, 1,
-1.614599, 1.114224, -2.203455, 1, 1, 1, 1, 1,
-1.612786, -0.04172242, -0.9633543, 1, 1, 1, 1, 1,
-1.61063, -1.450013, -3.024688, 1, 1, 1, 1, 1,
-1.601579, -0.6480932, -1.446594, 1, 1, 1, 1, 1,
-1.599316, -1.354138, -3.009628, 1, 1, 1, 1, 1,
-1.597271, 0.06786574, -3.705445, 1, 1, 1, 1, 1,
-1.586897, 0.2350486, -2.178604, 1, 1, 1, 1, 1,
-1.580461, 0.8485216, -1.356114, 1, 1, 1, 1, 1,
-1.580103, -0.2646481, -1.044899, 1, 1, 1, 1, 1,
-1.562242, 1.136215, 0.1703891, 1, 1, 1, 1, 1,
-1.543607, -0.08485112, 1.020228, 1, 1, 1, 1, 1,
-1.54047, -1.506374, -2.23385, 0, 0, 1, 1, 1,
-1.526877, 0.8161072, 0.3161547, 1, 0, 0, 1, 1,
-1.515396, 0.9851726, -3.141022, 1, 0, 0, 1, 1,
-1.513549, -0.1396314, -3.335761, 1, 0, 0, 1, 1,
-1.51339, 0.03588125, -1.29159, 1, 0, 0, 1, 1,
-1.512107, 0.4057821, -4.014225, 1, 0, 0, 1, 1,
-1.51079, 1.650974, -0.6167696, 0, 0, 0, 1, 1,
-1.509116, 1.251887, 0.1363973, 0, 0, 0, 1, 1,
-1.507926, -0.3043846, -0.00108492, 0, 0, 0, 1, 1,
-1.486587, 0.06855848, -2.557128, 0, 0, 0, 1, 1,
-1.478719, 0.3331531, -1.637353, 0, 0, 0, 1, 1,
-1.473051, 1.204313, -0.7675855, 0, 0, 0, 1, 1,
-1.465963, -0.8832471, -2.150443, 0, 0, 0, 1, 1,
-1.465392, -2.021306, -3.251592, 1, 1, 1, 1, 1,
-1.459379, 0.06733312, -1.306422, 1, 1, 1, 1, 1,
-1.457847, 0.3965333, -1.912005, 1, 1, 1, 1, 1,
-1.457675, 0.1885571, -2.060439, 1, 1, 1, 1, 1,
-1.449628, -2.037364, -1.887884, 1, 1, 1, 1, 1,
-1.442325, -0.1003064, -2.384095, 1, 1, 1, 1, 1,
-1.427171, -0.6296667, -4.382152, 1, 1, 1, 1, 1,
-1.416278, -0.391227, -1.679725, 1, 1, 1, 1, 1,
-1.405003, -1.079672, -3.663679, 1, 1, 1, 1, 1,
-1.400836, -1.114953, -0.8037812, 1, 1, 1, 1, 1,
-1.400445, 0.6366549, -2.290397, 1, 1, 1, 1, 1,
-1.391827, -0.3738612, -1.829237, 1, 1, 1, 1, 1,
-1.391631, -2.047843, -2.128968, 1, 1, 1, 1, 1,
-1.370517, -0.8425377, -1.452729, 1, 1, 1, 1, 1,
-1.360002, 0.2966128, -1.143743, 1, 1, 1, 1, 1,
-1.355744, 0.9760003, -1.168172, 0, 0, 1, 1, 1,
-1.346371, -0.7492289, -1.790171, 1, 0, 0, 1, 1,
-1.341242, -0.2977256, -1.306304, 1, 0, 0, 1, 1,
-1.336652, 1.416284, -0.7589967, 1, 0, 0, 1, 1,
-1.32767, 0.4279054, -1.563118, 1, 0, 0, 1, 1,
-1.322054, 1.155045, -1.695717, 1, 0, 0, 1, 1,
-1.318968, 0.03951488, -1.215593, 0, 0, 0, 1, 1,
-1.311339, 0.9537684, -0.4791977, 0, 0, 0, 1, 1,
-1.300919, 0.9621069, 0.7113525, 0, 0, 0, 1, 1,
-1.294278, 1.452517, -2.240534, 0, 0, 0, 1, 1,
-1.290363, 0.9396943, -0.7104552, 0, 0, 0, 1, 1,
-1.278891, 0.4006156, -1.760825, 0, 0, 0, 1, 1,
-1.277663, 0.07840052, -1.751011, 0, 0, 0, 1, 1,
-1.271218, 1.753344, -0.7946028, 1, 1, 1, 1, 1,
-1.271149, -0.5557137, -0.6721856, 1, 1, 1, 1, 1,
-1.269197, 0.5342028, -1.514252, 1, 1, 1, 1, 1,
-1.264128, 1.316429, -0.4425536, 1, 1, 1, 1, 1,
-1.263135, 1.431424, -1.409865, 1, 1, 1, 1, 1,
-1.257049, -1.62839, -2.349029, 1, 1, 1, 1, 1,
-1.25485, 0.6635919, -0.1822903, 1, 1, 1, 1, 1,
-1.246069, 0.8538005, -1.143353, 1, 1, 1, 1, 1,
-1.233533, -1.146481, -1.590763, 1, 1, 1, 1, 1,
-1.232077, -0.5907247, 0.1170392, 1, 1, 1, 1, 1,
-1.223447, 0.5532698, -0.741157, 1, 1, 1, 1, 1,
-1.214251, -1.348652, 0.2842975, 1, 1, 1, 1, 1,
-1.209746, 0.608454, -1.031518, 1, 1, 1, 1, 1,
-1.209253, 0.9094042, -1.354509, 1, 1, 1, 1, 1,
-1.207666, 0.1911951, 0.2712436, 1, 1, 1, 1, 1,
-1.202561, -1.639862, -3.304172, 0, 0, 1, 1, 1,
-1.202078, 0.4186936, -1.675544, 1, 0, 0, 1, 1,
-1.199966, -0.6971582, -1.605945, 1, 0, 0, 1, 1,
-1.194943, 0.5636842, 0.1414787, 1, 0, 0, 1, 1,
-1.193828, -1.828134, -1.941477, 1, 0, 0, 1, 1,
-1.180457, -0.9944768, -3.684655, 1, 0, 0, 1, 1,
-1.172548, -1.031407, -2.720001, 0, 0, 0, 1, 1,
-1.167849, 0.9900095, -0.5674558, 0, 0, 0, 1, 1,
-1.167528, 0.8617508, -1.412421, 0, 0, 0, 1, 1,
-1.160571, -0.3864282, -1.101623, 0, 0, 0, 1, 1,
-1.152223, -0.1095478, -2.045702, 0, 0, 0, 1, 1,
-1.146095, -1.934669, -3.153623, 0, 0, 0, 1, 1,
-1.141819, 0.6599079, -1.836701, 0, 0, 0, 1, 1,
-1.14035, 0.2423581, -1.643566, 1, 1, 1, 1, 1,
-1.133417, 0.7648001, -0.06949171, 1, 1, 1, 1, 1,
-1.131835, 0.05602327, -1.038991, 1, 1, 1, 1, 1,
-1.124448, -1.175127, -2.602822, 1, 1, 1, 1, 1,
-1.119731, 0.6012015, -1.290922, 1, 1, 1, 1, 1,
-1.11388, -0.08910482, -1.886308, 1, 1, 1, 1, 1,
-1.112305, 0.4116897, 0.4036184, 1, 1, 1, 1, 1,
-1.10665, 0.708253, -0.6864628, 1, 1, 1, 1, 1,
-1.106508, -0.7412068, 0.09001332, 1, 1, 1, 1, 1,
-1.10604, 0.4626653, -1.90445, 1, 1, 1, 1, 1,
-1.101714, -0.2943109, -1.541075, 1, 1, 1, 1, 1,
-1.097425, -2.328879, -2.188594, 1, 1, 1, 1, 1,
-1.086263, 0.5645266, -0.945227, 1, 1, 1, 1, 1,
-1.076825, 1.524688, -0.3659652, 1, 1, 1, 1, 1,
-1.062624, -0.2229517, -1.406439, 1, 1, 1, 1, 1,
-1.057833, 1.888765, -0.3302728, 0, 0, 1, 1, 1,
-1.054819, -0.1600822, 0.1594984, 1, 0, 0, 1, 1,
-1.051272, -0.07511179, -1.595377, 1, 0, 0, 1, 1,
-1.050387, -0.4334271, -1.245826, 1, 0, 0, 1, 1,
-1.049752, -0.6063382, -4.298388, 1, 0, 0, 1, 1,
-1.048607, -0.9972484, -2.56707, 1, 0, 0, 1, 1,
-1.048326, -1.485047, -2.966697, 0, 0, 0, 1, 1,
-1.04695, 1.768401, -0.08648609, 0, 0, 0, 1, 1,
-1.033603, -0.1605207, -1.562322, 0, 0, 0, 1, 1,
-1.029948, -0.3057702, -0.06889488, 0, 0, 0, 1, 1,
-1.017123, 0.03477489, -1.008151, 0, 0, 0, 1, 1,
-1.006566, -0.9749008, -2.819204, 0, 0, 0, 1, 1,
-1.006287, -0.006127419, -1.448791, 0, 0, 0, 1, 1,
-1.002278, 0.6132841, -1.493402, 1, 1, 1, 1, 1,
-0.999999, 1.624564, -0.5974764, 1, 1, 1, 1, 1,
-0.996314, 0.1474688, -0.5209437, 1, 1, 1, 1, 1,
-0.9959563, -0.02086995, -0.09908731, 1, 1, 1, 1, 1,
-0.9930224, 0.142564, -0.5440119, 1, 1, 1, 1, 1,
-0.9848641, -0.9446444, -1.566496, 1, 1, 1, 1, 1,
-0.9824006, -0.334483, -2.334034, 1, 1, 1, 1, 1,
-0.9662244, -0.5564077, -1.852474, 1, 1, 1, 1, 1,
-0.9659089, 2.569853, -0.5881771, 1, 1, 1, 1, 1,
-0.9613443, -1.054537, -2.53108, 1, 1, 1, 1, 1,
-0.9574405, -0.3465606, -2.195777, 1, 1, 1, 1, 1,
-0.9544148, 0.3323394, -1.533687, 1, 1, 1, 1, 1,
-0.9514545, -0.1532495, -2.093896, 1, 1, 1, 1, 1,
-0.9440501, 0.6538982, -0.6467413, 1, 1, 1, 1, 1,
-0.9435586, 0.6792264, -1.126786, 1, 1, 1, 1, 1,
-0.9414604, 1.132901, 0.1689331, 0, 0, 1, 1, 1,
-0.9310365, 2.072339, -0.5581139, 1, 0, 0, 1, 1,
-0.926703, 0.6473807, 0.4969474, 1, 0, 0, 1, 1,
-0.9235968, 0.1088219, -0.5760056, 1, 0, 0, 1, 1,
-0.9203541, 0.03407443, -0.2725229, 1, 0, 0, 1, 1,
-0.9170457, 0.2590922, -2.57511, 1, 0, 0, 1, 1,
-0.9130161, 0.2414752, -1.745683, 0, 0, 0, 1, 1,
-0.9017712, 0.818128, -0.4786515, 0, 0, 0, 1, 1,
-0.8974505, -0.5389561, -1.143575, 0, 0, 0, 1, 1,
-0.8972504, -0.9712271, -2.739135, 0, 0, 0, 1, 1,
-0.8954119, 1.137344, -1.283165, 0, 0, 0, 1, 1,
-0.8943909, 0.8243434, -2.032541, 0, 0, 0, 1, 1,
-0.8902323, 0.5034328, -1.877977, 0, 0, 0, 1, 1,
-0.8869981, 0.3174101, -2.130331, 1, 1, 1, 1, 1,
-0.8848134, -1.349397, -1.812729, 1, 1, 1, 1, 1,
-0.8828831, 0.3031552, -2.21841, 1, 1, 1, 1, 1,
-0.8768379, -0.3620118, -3.349843, 1, 1, 1, 1, 1,
-0.8735681, -0.9733995, -3.713611, 1, 1, 1, 1, 1,
-0.8723146, 0.2094724, -0.7831735, 1, 1, 1, 1, 1,
-0.8716246, 0.3292853, -1.80573, 1, 1, 1, 1, 1,
-0.8714093, -1.392615, -2.27006, 1, 1, 1, 1, 1,
-0.8654441, 0.6774254, -0.01818143, 1, 1, 1, 1, 1,
-0.8621901, -0.3227233, -0.6373642, 1, 1, 1, 1, 1,
-0.8590814, -0.1716977, -3.004973, 1, 1, 1, 1, 1,
-0.8465945, -0.5009695, -2.130104, 1, 1, 1, 1, 1,
-0.842078, -1.090272, -2.146395, 1, 1, 1, 1, 1,
-0.8349387, 1.07209, -0.575702, 1, 1, 1, 1, 1,
-0.8344947, 0.6065009, -1.211183, 1, 1, 1, 1, 1,
-0.8302484, -0.317901, -2.407464, 0, 0, 1, 1, 1,
-0.8288343, 2.481186, 1.301836, 1, 0, 0, 1, 1,
-0.8286761, 0.2965907, -1.779541, 1, 0, 0, 1, 1,
-0.8281361, -0.1715316, -2.487, 1, 0, 0, 1, 1,
-0.8269804, 0.2275532, -1.880269, 1, 0, 0, 1, 1,
-0.8265696, -1.45384, -4.181437, 1, 0, 0, 1, 1,
-0.8260933, -0.9556597, -0.5869458, 0, 0, 0, 1, 1,
-0.8219944, 1.386601, 1.598349, 0, 0, 0, 1, 1,
-0.8215571, -1.610367, -2.126168, 0, 0, 0, 1, 1,
-0.8206613, -0.05308256, -2.562077, 0, 0, 0, 1, 1,
-0.8197069, 0.3056923, -0.8041373, 0, 0, 0, 1, 1,
-0.8151995, -0.4446037, -1.943528, 0, 0, 0, 1, 1,
-0.8094587, -0.1196411, -1.972572, 0, 0, 0, 1, 1,
-0.8060081, 0.6158519, -1.882898, 1, 1, 1, 1, 1,
-0.8022621, 1.642559, -1.062145, 1, 1, 1, 1, 1,
-0.8004312, -0.3164879, -3.317034, 1, 1, 1, 1, 1,
-0.7923087, -1.435991, -2.131813, 1, 1, 1, 1, 1,
-0.7906883, -0.9263604, -4.048845, 1, 1, 1, 1, 1,
-0.7787942, -0.703329, -2.707084, 1, 1, 1, 1, 1,
-0.7782204, -0.1794523, -2.681099, 1, 1, 1, 1, 1,
-0.776068, -1.171562, -3.352046, 1, 1, 1, 1, 1,
-0.7751489, 0.5035362, -1.881815, 1, 1, 1, 1, 1,
-0.7677038, -0.393648, -1.519854, 1, 1, 1, 1, 1,
-0.7629248, 0.5031267, -0.7776319, 1, 1, 1, 1, 1,
-0.7609617, 2.003513, -0.7137831, 1, 1, 1, 1, 1,
-0.7585312, 0.2307351, -0.5803574, 1, 1, 1, 1, 1,
-0.7545823, 0.3592296, -1.20627, 1, 1, 1, 1, 1,
-0.7538048, 0.03443186, -2.024312, 1, 1, 1, 1, 1,
-0.742425, -1.330342, -2.358247, 0, 0, 1, 1, 1,
-0.7293072, 0.5770293, 0.3355096, 1, 0, 0, 1, 1,
-0.7265888, 0.5264528, -2.213769, 1, 0, 0, 1, 1,
-0.7261671, -1.476885, -2.428567, 1, 0, 0, 1, 1,
-0.7180151, -1.569584, -3.281059, 1, 0, 0, 1, 1,
-0.7164778, 0.6995466, -1.138776, 1, 0, 0, 1, 1,
-0.7064322, 0.8271692, 0.2119357, 0, 0, 0, 1, 1,
-0.6996729, -1.935294, -2.537042, 0, 0, 0, 1, 1,
-0.6991407, -0.5661004, -1.47483, 0, 0, 0, 1, 1,
-0.697374, -0.2505918, -0.5590678, 0, 0, 0, 1, 1,
-0.6950618, -0.1764269, -1.695731, 0, 0, 0, 1, 1,
-0.6944087, 0.4939018, -0.5973008, 0, 0, 0, 1, 1,
-0.6941202, -0.7984409, -2.932945, 0, 0, 0, 1, 1,
-0.690179, 2.23839, -1.338622, 1, 1, 1, 1, 1,
-0.6899846, -0.8850083, -2.424001, 1, 1, 1, 1, 1,
-0.6877473, -0.06775127, -0.6864206, 1, 1, 1, 1, 1,
-0.6870349, 0.2396767, -1.293529, 1, 1, 1, 1, 1,
-0.6847261, -0.4601209, -2.779455, 1, 1, 1, 1, 1,
-0.6844813, -0.4473213, -1.921978, 1, 1, 1, 1, 1,
-0.6764015, -0.296606, -1.738931, 1, 1, 1, 1, 1,
-0.6706635, 1.022669, -0.1421818, 1, 1, 1, 1, 1,
-0.6585925, -0.2337177, -1.695519, 1, 1, 1, 1, 1,
-0.6585833, 0.04183896, -2.332473, 1, 1, 1, 1, 1,
-0.6532138, 1.290436, 0.3100772, 1, 1, 1, 1, 1,
-0.6494689, 0.1903261, -1.880825, 1, 1, 1, 1, 1,
-0.6488428, -0.4703427, -2.347834, 1, 1, 1, 1, 1,
-0.6474686, 1.001139, -1.075712, 1, 1, 1, 1, 1,
-0.6437277, -0.9326658, -3.451235, 1, 1, 1, 1, 1,
-0.6431213, 0.9015324, -1.63903, 0, 0, 1, 1, 1,
-0.6429129, -1.140648, -1.586693, 1, 0, 0, 1, 1,
-0.6423712, -0.0326988, -3.203406, 1, 0, 0, 1, 1,
-0.6372638, 0.854963, -0.6022435, 1, 0, 0, 1, 1,
-0.6344783, 0.1395935, -1.583508, 1, 0, 0, 1, 1,
-0.6254239, -0.4238099, -1.697999, 1, 0, 0, 1, 1,
-0.6235298, 1.010009, -1.084925, 0, 0, 0, 1, 1,
-0.6222618, 2.022215, -1.439806, 0, 0, 0, 1, 1,
-0.616075, 0.670039, -0.001147591, 0, 0, 0, 1, 1,
-0.6152891, 0.4732336, -0.5613033, 0, 0, 0, 1, 1,
-0.6113789, -0.3269335, -1.755905, 0, 0, 0, 1, 1,
-0.61049, -0.4779021, -2.080162, 0, 0, 0, 1, 1,
-0.6099421, -0.8007321, -3.442352, 0, 0, 0, 1, 1,
-0.6084777, 0.6807354, -1.293232, 1, 1, 1, 1, 1,
-0.6054055, -0.8296188, -3.50388, 1, 1, 1, 1, 1,
-0.603725, -1.288398, -2.219624, 1, 1, 1, 1, 1,
-0.6018124, 0.0106509, -0.9873384, 1, 1, 1, 1, 1,
-0.6000016, 0.3857638, -0.1813435, 1, 1, 1, 1, 1,
-0.5996748, 0.6862699, -1.11473, 1, 1, 1, 1, 1,
-0.5963538, -0.6165629, -2.23908, 1, 1, 1, 1, 1,
-0.5937876, 0.9970154, 0.4302767, 1, 1, 1, 1, 1,
-0.582929, 1.004191, -1.042109, 1, 1, 1, 1, 1,
-0.5805861, -1.27971, -4.338297, 1, 1, 1, 1, 1,
-0.5802969, 0.6800044, 0.3922428, 1, 1, 1, 1, 1,
-0.5739357, -1.25268, -3.172212, 1, 1, 1, 1, 1,
-0.5718092, -0.6368573, -1.375021, 1, 1, 1, 1, 1,
-0.5678228, 0.724542, -1.649267, 1, 1, 1, 1, 1,
-0.5662076, 0.07637368, 0.04428906, 1, 1, 1, 1, 1,
-0.5566781, -0.2324146, -2.491492, 0, 0, 1, 1, 1,
-0.5565125, 0.5787662, 0.599757, 1, 0, 0, 1, 1,
-0.5537892, 1.08129, -0.2812759, 1, 0, 0, 1, 1,
-0.5481891, 1.534837, 0.3041755, 1, 0, 0, 1, 1,
-0.5481097, -1.218442, -2.633974, 1, 0, 0, 1, 1,
-0.5433855, -2.185184, -3.876995, 1, 0, 0, 1, 1,
-0.5407232, -0.7025599, -1.168783, 0, 0, 0, 1, 1,
-0.5392989, -0.9384958, -1.426983, 0, 0, 0, 1, 1,
-0.539228, 1.137108, -0.7098009, 0, 0, 0, 1, 1,
-0.5386947, 0.9378528, -1.666731, 0, 0, 0, 1, 1,
-0.5372269, 1.89594, -0.02141559, 0, 0, 0, 1, 1,
-0.5364831, -0.3430964, -1.920952, 0, 0, 0, 1, 1,
-0.5357251, 0.4277441, -1.288081, 0, 0, 0, 1, 1,
-0.5296527, 2.272953, 1.221288, 1, 1, 1, 1, 1,
-0.5265446, 0.6605328, 1.606589, 1, 1, 1, 1, 1,
-0.5170135, 0.2011952, -2.314038, 1, 1, 1, 1, 1,
-0.5134957, 0.2277899, -2.765834, 1, 1, 1, 1, 1,
-0.5128714, -0.7138599, -1.78835, 1, 1, 1, 1, 1,
-0.5093353, 0.1818659, -1.363466, 1, 1, 1, 1, 1,
-0.5024995, 0.5691973, -1.513664, 1, 1, 1, 1, 1,
-0.5022057, -0.8621083, -3.457762, 1, 1, 1, 1, 1,
-0.501633, -0.3306568, -1.215419, 1, 1, 1, 1, 1,
-0.5007991, 0.5239365, -0.04014451, 1, 1, 1, 1, 1,
-0.5004537, -0.03808463, -1.308138, 1, 1, 1, 1, 1,
-0.499963, -0.6549176, -2.567542, 1, 1, 1, 1, 1,
-0.4967154, 2.36597, -0.6343494, 1, 1, 1, 1, 1,
-0.4948597, -0.4859308, -2.329932, 1, 1, 1, 1, 1,
-0.4943304, -1.166454, -2.799516, 1, 1, 1, 1, 1,
-0.4939493, 0.2244691, -0.5021055, 0, 0, 1, 1, 1,
-0.4842474, 0.843202, 0.9554188, 1, 0, 0, 1, 1,
-0.4834443, 0.1089657, -2.812025, 1, 0, 0, 1, 1,
-0.4818178, -0.09740546, -2.130585, 1, 0, 0, 1, 1,
-0.4741375, 1.048142, -1.008726, 1, 0, 0, 1, 1,
-0.4728214, -1.67752, -5.171267, 1, 0, 0, 1, 1,
-0.4651226, -0.7826274, 0.2124153, 0, 0, 0, 1, 1,
-0.4631749, -0.6855351, -2.761138, 0, 0, 0, 1, 1,
-0.4601741, -0.02306116, -1.408493, 0, 0, 0, 1, 1,
-0.4598228, -1.335588, -2.414003, 0, 0, 0, 1, 1,
-0.4556943, -2.178766, -2.746563, 0, 0, 0, 1, 1,
-0.4545949, 2.280085, 2.281776, 0, 0, 0, 1, 1,
-0.4538811, -1.67959, -3.856308, 0, 0, 0, 1, 1,
-0.4452193, -0.4655948, 0.3091698, 1, 1, 1, 1, 1,
-0.4427857, -0.1232674, -1.341419, 1, 1, 1, 1, 1,
-0.4404369, 1.366729, 0.03791596, 1, 1, 1, 1, 1,
-0.4346795, 0.8019264, -0.5455738, 1, 1, 1, 1, 1,
-0.4332876, -0.2866977, -2.070443, 1, 1, 1, 1, 1,
-0.4330113, -0.06964861, -1.629007, 1, 1, 1, 1, 1,
-0.4307867, -1.612069, -2.348386, 1, 1, 1, 1, 1,
-0.4303569, 0.3081557, -0.7979248, 1, 1, 1, 1, 1,
-0.4289287, 0.2096833, -0.5118867, 1, 1, 1, 1, 1,
-0.4272559, 0.1552613, -0.9152951, 1, 1, 1, 1, 1,
-0.4172347, 0.03687992, -1.956284, 1, 1, 1, 1, 1,
-0.4150648, 0.8277808, -1.603327, 1, 1, 1, 1, 1,
-0.41389, -0.245787, -1.358931, 1, 1, 1, 1, 1,
-0.411929, 0.01829099, -0.2661082, 1, 1, 1, 1, 1,
-0.4078587, -0.3081879, -2.263069, 1, 1, 1, 1, 1,
-0.4012859, 0.06070583, -2.211507, 0, 0, 1, 1, 1,
-0.3969899, -1.483636, -3.454205, 1, 0, 0, 1, 1,
-0.3945512, 1.775977, -1.306372, 1, 0, 0, 1, 1,
-0.3933018, 1.413912, -0.2412311, 1, 0, 0, 1, 1,
-0.3910987, -0.0682066, -2.796564, 1, 0, 0, 1, 1,
-0.3895893, 2.120144, -0.06271101, 1, 0, 0, 1, 1,
-0.3847686, 0.4279557, -1.385656, 0, 0, 0, 1, 1,
-0.3843069, -0.8732893, -2.568811, 0, 0, 0, 1, 1,
-0.3834321, -1.870149, -4.039297, 0, 0, 0, 1, 1,
-0.3799623, -2.312401, -2.071096, 0, 0, 0, 1, 1,
-0.3765482, 1.489809, -0.5628041, 0, 0, 0, 1, 1,
-0.3733315, 1.506178, -0.285309, 0, 0, 0, 1, 1,
-0.3720466, -0.1547639, -1.487026, 0, 0, 0, 1, 1,
-0.3716751, -0.6241861, -2.042202, 1, 1, 1, 1, 1,
-0.3716261, -0.9506601, -3.273511, 1, 1, 1, 1, 1,
-0.3704239, -0.04591333, -2.013316, 1, 1, 1, 1, 1,
-0.3702095, 0.3509486, -1.204554, 1, 1, 1, 1, 1,
-0.3689241, 1.266001, -1.114907, 1, 1, 1, 1, 1,
-0.367984, -2.288164, -3.890162, 1, 1, 1, 1, 1,
-0.3676199, 0.3373043, -2.378297, 1, 1, 1, 1, 1,
-0.3676067, -0.5299271, -4.172024, 1, 1, 1, 1, 1,
-0.3634783, -0.1920285, -3.668868, 1, 1, 1, 1, 1,
-0.3615082, 0.2181429, -2.402886, 1, 1, 1, 1, 1,
-0.3590513, -0.01376573, -2.983052, 1, 1, 1, 1, 1,
-0.353332, -1.116256, -1.307746, 1, 1, 1, 1, 1,
-0.3518983, -1.108796, -3.392277, 1, 1, 1, 1, 1,
-0.3515439, -0.1339851, -3.271634, 1, 1, 1, 1, 1,
-0.3503444, -0.1741612, -2.512475, 1, 1, 1, 1, 1,
-0.3502099, 0.8243898, 0.7168895, 0, 0, 1, 1, 1,
-0.3461882, -0.5953287, -1.901707, 1, 0, 0, 1, 1,
-0.3442921, 0.2588461, 0.4958333, 1, 0, 0, 1, 1,
-0.3438685, -0.1382884, -1.048504, 1, 0, 0, 1, 1,
-0.3419852, 1.916343, 0.5350385, 1, 0, 0, 1, 1,
-0.3385003, 1.037919, -1.730969, 1, 0, 0, 1, 1,
-0.3373922, -0.2716666, -2.005045, 0, 0, 0, 1, 1,
-0.3373391, -1.520701, -1.830114, 0, 0, 0, 1, 1,
-0.3316046, 0.4222494, -1.342699, 0, 0, 0, 1, 1,
-0.3314058, -1.808804, -2.137655, 0, 0, 0, 1, 1,
-0.3230876, -0.9395365, -1.329735, 0, 0, 0, 1, 1,
-0.3209719, 0.2168377, -1.28453, 0, 0, 0, 1, 1,
-0.3184156, 0.5533229, -0.9479133, 0, 0, 0, 1, 1,
-0.3176336, -0.4012677, -2.922906, 1, 1, 1, 1, 1,
-0.3170733, -0.6993879, -3.729069, 1, 1, 1, 1, 1,
-0.3140943, 0.7824958, 0.3852556, 1, 1, 1, 1, 1,
-0.3139481, 0.6354306, -0.930666, 1, 1, 1, 1, 1,
-0.3132092, -0.2873633, -2.166038, 1, 1, 1, 1, 1,
-0.3109265, 0.01121448, -0.3562616, 1, 1, 1, 1, 1,
-0.3096355, 0.2226371, -2.076078, 1, 1, 1, 1, 1,
-0.3090774, -1.773947, -3.403249, 1, 1, 1, 1, 1,
-0.3078253, 1.404908, -2.042615, 1, 1, 1, 1, 1,
-0.306777, 0.8038565, 1.927937, 1, 1, 1, 1, 1,
-0.3016869, -0.007682861, -2.523924, 1, 1, 1, 1, 1,
-0.2996601, 0.41182, -2.631483, 1, 1, 1, 1, 1,
-0.297079, 0.3838006, -0.2529402, 1, 1, 1, 1, 1,
-0.2966612, 0.1092231, -1.291788, 1, 1, 1, 1, 1,
-0.2866553, 1.194754, -0.6884654, 1, 1, 1, 1, 1,
-0.2863303, -1.782588, -2.091452, 0, 0, 1, 1, 1,
-0.2837001, -0.4763301, -1.433224, 1, 0, 0, 1, 1,
-0.2829488, 1.299614, -0.8140698, 1, 0, 0, 1, 1,
-0.2803308, 0.02785371, -1.034819, 1, 0, 0, 1, 1,
-0.2798006, 0.6571355, -1.403606, 1, 0, 0, 1, 1,
-0.2795325, -0.8962507, -2.990278, 1, 0, 0, 1, 1,
-0.2791839, -1.184917, -3.05773, 0, 0, 0, 1, 1,
-0.2786859, 1.399562, 0.0880754, 0, 0, 0, 1, 1,
-0.2786708, -0.212984, -3.981098, 0, 0, 0, 1, 1,
-0.2786202, -0.5875436, -4.273203, 0, 0, 0, 1, 1,
-0.2712528, 0.1092114, -0.8023785, 0, 0, 0, 1, 1,
-0.2687857, 0.2613245, -1.329666, 0, 0, 0, 1, 1,
-0.2656063, 1.189458, -0.4436336, 0, 0, 0, 1, 1,
-0.2655647, 1.166267, -1.014245, 1, 1, 1, 1, 1,
-0.2602074, 0.6761662, -0.08967328, 1, 1, 1, 1, 1,
-0.2599404, -0.4767035, -3.780555, 1, 1, 1, 1, 1,
-0.2592281, 0.1018726, -1.431037, 1, 1, 1, 1, 1,
-0.2578747, 0.5314507, -0.4630071, 1, 1, 1, 1, 1,
-0.2546679, -0.3025106, -0.4303989, 1, 1, 1, 1, 1,
-0.2476652, 0.2520895, -1.757683, 1, 1, 1, 1, 1,
-0.2460261, 1.011352, 0.3278437, 1, 1, 1, 1, 1,
-0.2352929, -1.367021, -2.399167, 1, 1, 1, 1, 1,
-0.2340755, 1.014577, 2.163287, 1, 1, 1, 1, 1,
-0.2323098, -0.2570526, -0.6449775, 1, 1, 1, 1, 1,
-0.2289143, 0.1284639, -0.6802484, 1, 1, 1, 1, 1,
-0.2261129, -0.6696179, -1.796744, 1, 1, 1, 1, 1,
-0.2248854, -0.004421678, -2.01251, 1, 1, 1, 1, 1,
-0.22376, 1.176569, -1.221769, 1, 1, 1, 1, 1,
-0.2209077, -0.02006262, -2.277892, 0, 0, 1, 1, 1,
-0.2190099, 0.3017664, -2.986188, 1, 0, 0, 1, 1,
-0.2188481, 0.6174192, -0.4235608, 1, 0, 0, 1, 1,
-0.2179523, 1.905166, 1.473677, 1, 0, 0, 1, 1,
-0.213536, 0.4520535, -0.4093471, 1, 0, 0, 1, 1,
-0.2133575, -0.6453873, -3.0936, 1, 0, 0, 1, 1,
-0.2100623, -1.109365, -2.003628, 0, 0, 0, 1, 1,
-0.2084573, 0.8043366, -1.194999, 0, 0, 0, 1, 1,
-0.2083368, 1.043126, -1.671134, 0, 0, 0, 1, 1,
-0.2049714, 0.1748244, -0.4341029, 0, 0, 0, 1, 1,
-0.2034492, 0.1335267, -0.7141449, 0, 0, 0, 1, 1,
-0.1944871, -0.699323, -1.950621, 0, 0, 0, 1, 1,
-0.1910798, 1.362996, 0.2488614, 0, 0, 0, 1, 1,
-0.1827373, -0.3524064, -3.956139, 1, 1, 1, 1, 1,
-0.1812477, -0.863743, -0.3694141, 1, 1, 1, 1, 1,
-0.1797892, -0.4684489, -3.080371, 1, 1, 1, 1, 1,
-0.1791237, 0.03042244, -0.999638, 1, 1, 1, 1, 1,
-0.1786892, 0.4634856, 0.7906036, 1, 1, 1, 1, 1,
-0.1768162, 1.682777, 1.001194, 1, 1, 1, 1, 1,
-0.1697762, 0.08019166, -0.8777307, 1, 1, 1, 1, 1,
-0.1681035, -0.2450173, -2.41, 1, 1, 1, 1, 1,
-0.1676462, -0.6098297, -3.074712, 1, 1, 1, 1, 1,
-0.166851, 0.8018864, -0.6240094, 1, 1, 1, 1, 1,
-0.164229, 1.3502, -0.9413072, 1, 1, 1, 1, 1,
-0.160106, 0.6902776, 0.4474392, 1, 1, 1, 1, 1,
-0.1579766, -1.413319, -4.3353, 1, 1, 1, 1, 1,
-0.1559074, 0.06336388, -1.783019, 1, 1, 1, 1, 1,
-0.1479817, -1.016351, -3.548302, 1, 1, 1, 1, 1,
-0.1465417, 0.3490598, 0.664507, 0, 0, 1, 1, 1,
-0.1460943, 0.5457649, -1.785857, 1, 0, 0, 1, 1,
-0.1452653, -2.306757, -3.336954, 1, 0, 0, 1, 1,
-0.1451255, 1.193219, -0.9304576, 1, 0, 0, 1, 1,
-0.134127, 2.237025, -1.006982, 1, 0, 0, 1, 1,
-0.1338006, 0.6860428, -0.3627023, 1, 0, 0, 1, 1,
-0.1306374, -0.3617831, -5.215449, 0, 0, 0, 1, 1,
-0.1305836, -0.008808918, -0.7719836, 0, 0, 0, 1, 1,
-0.1273304, 0.246987, -1.082241, 0, 0, 0, 1, 1,
-0.1244727, 0.947961, 0.5589836, 0, 0, 0, 1, 1,
-0.1231004, -0.7366846, -3.577282, 0, 0, 0, 1, 1,
-0.1198245, 1.070106, -1.146173, 0, 0, 0, 1, 1,
-0.1192089, -1.608571, -2.561213, 0, 0, 0, 1, 1,
-0.1170477, 0.757724, -0.5047858, 1, 1, 1, 1, 1,
-0.1157024, -0.6444371, -4.043828, 1, 1, 1, 1, 1,
-0.1144921, -1.228807, -3.311954, 1, 1, 1, 1, 1,
-0.113794, 0.8846135, 0.8041009, 1, 1, 1, 1, 1,
-0.1099904, -0.6680818, -3.776661, 1, 1, 1, 1, 1,
-0.1081071, 0.5639784, -0.3749546, 1, 1, 1, 1, 1,
-0.106976, -0.1577803, -1.333368, 1, 1, 1, 1, 1,
-0.1068752, -0.8993279, -1.615549, 1, 1, 1, 1, 1,
-0.1038741, 1.356616, 1.562001, 1, 1, 1, 1, 1,
-0.09982805, 0.3084026, 0.350733, 1, 1, 1, 1, 1,
-0.09775204, 0.3333622, -0.2637146, 1, 1, 1, 1, 1,
-0.09593773, -0.5653573, -3.026902, 1, 1, 1, 1, 1,
-0.09148359, 1.286404, -0.2964057, 1, 1, 1, 1, 1,
-0.08950838, -0.5786884, -3.528862, 1, 1, 1, 1, 1,
-0.0845507, -1.619644, -2.507728, 1, 1, 1, 1, 1,
-0.0822576, 0.2909687, -2.176943, 0, 0, 1, 1, 1,
-0.08114683, 0.4890059, 0.4717105, 1, 0, 0, 1, 1,
-0.08114132, -0.6334101, -3.054683, 1, 0, 0, 1, 1,
-0.07805065, 0.2526395, 1.414598, 1, 0, 0, 1, 1,
-0.07759772, -1.198999, -2.843275, 1, 0, 0, 1, 1,
-0.07462485, -0.6869938, -4.076526, 1, 0, 0, 1, 1,
-0.07457639, -0.004956166, -2.287742, 0, 0, 0, 1, 1,
-0.07345045, 1.332935, -0.7856178, 0, 0, 0, 1, 1,
-0.07089563, 0.2527528, -1.445266, 0, 0, 0, 1, 1,
-0.0697389, -0.6900634, -2.45859, 0, 0, 0, 1, 1,
-0.0683594, 0.4747503, -0.4067681, 0, 0, 0, 1, 1,
-0.06549104, -0.07430333, -3.480042, 0, 0, 0, 1, 1,
-0.06421226, -0.3267329, -3.233958, 0, 0, 0, 1, 1,
-0.06349294, -0.08689556, -3.424645, 1, 1, 1, 1, 1,
-0.06242572, -0.1911994, -3.947031, 1, 1, 1, 1, 1,
-0.06066894, 0.5323351, -1.424006, 1, 1, 1, 1, 1,
-0.0600742, -0.5839544, -4.553712, 1, 1, 1, 1, 1,
-0.05792536, -0.6025827, -3.747356, 1, 1, 1, 1, 1,
-0.05623977, -0.2060072, -1.895423, 1, 1, 1, 1, 1,
-0.05203283, 0.4839329, 0.8911648, 1, 1, 1, 1, 1,
-0.04886352, -0.6013021, -2.386854, 1, 1, 1, 1, 1,
-0.04753583, -0.1623395, -3.108593, 1, 1, 1, 1, 1,
-0.04261115, -0.2056302, -3.606216, 1, 1, 1, 1, 1,
-0.03674903, -1.120022, -3.581841, 1, 1, 1, 1, 1,
-0.03567095, 0.2717458, -1.432515, 1, 1, 1, 1, 1,
-0.03325139, 1.570221, -0.3271489, 1, 1, 1, 1, 1,
-0.02839397, 0.8795738, -0.4773642, 1, 1, 1, 1, 1,
-0.02608673, -1.944593, -1.82169, 1, 1, 1, 1, 1,
-0.02142525, 0.1109712, -2.581474, 0, 0, 1, 1, 1,
-0.01612115, -1.590305, -4.078691, 1, 0, 0, 1, 1,
0.0009086163, 1.002661, -1.785939, 1, 0, 0, 1, 1,
0.001213502, -0.390051, 4.574285, 1, 0, 0, 1, 1,
0.003168467, 0.9686369, -1.25712, 1, 0, 0, 1, 1,
0.004422456, 0.398105, 0.02257957, 1, 0, 0, 1, 1,
0.004685452, 1.906207, 0.7893965, 0, 0, 0, 1, 1,
0.004954098, 1.035381, -1.560549, 0, 0, 0, 1, 1,
0.00538996, 1.524748, 1.641731, 0, 0, 0, 1, 1,
0.007142331, -2.062908, 3.909513, 0, 0, 0, 1, 1,
0.007869506, -1.358434, 3.660115, 0, 0, 0, 1, 1,
0.01021974, -1.073608, 2.805035, 0, 0, 0, 1, 1,
0.01311901, 0.9092749, 0.2768397, 0, 0, 0, 1, 1,
0.01607301, 0.9197139, -0.1876577, 1, 1, 1, 1, 1,
0.01712592, 0.9984755, -2.181504, 1, 1, 1, 1, 1,
0.01762599, -1.21978, 2.633494, 1, 1, 1, 1, 1,
0.020187, 0.2454136, 0.4200225, 1, 1, 1, 1, 1,
0.0207999, -0.9110432, 4.83472, 1, 1, 1, 1, 1,
0.02082408, 1.309149, -0.8774776, 1, 1, 1, 1, 1,
0.02969629, 2.401612, -0.9638879, 1, 1, 1, 1, 1,
0.03493057, 1.099063, 1.453371, 1, 1, 1, 1, 1,
0.03703674, 0.4971023, -0.2809445, 1, 1, 1, 1, 1,
0.03738491, -0.1693263, 4.758202, 1, 1, 1, 1, 1,
0.03739914, 1.329877, 0.663979, 1, 1, 1, 1, 1,
0.03801289, -0.5265884, 2.044783, 1, 1, 1, 1, 1,
0.04021472, 0.7630106, 1.178147, 1, 1, 1, 1, 1,
0.04264231, -0.9804965, 0.5053264, 1, 1, 1, 1, 1,
0.04641902, -2.306006, 2.743334, 1, 1, 1, 1, 1,
0.0489539, -1.656145, 1.732947, 0, 0, 1, 1, 1,
0.05498907, -0.5991062, 1.747768, 1, 0, 0, 1, 1,
0.06453236, 0.09089499, -1.087798, 1, 0, 0, 1, 1,
0.0675135, -2.401977, 2.763604, 1, 0, 0, 1, 1,
0.06768883, 1.200123, -0.3255815, 1, 0, 0, 1, 1,
0.06865489, 1.290151, -1.063421, 1, 0, 0, 1, 1,
0.06972703, -1.676568, 4.587604, 0, 0, 0, 1, 1,
0.07030886, 1.621772, -1.182873, 0, 0, 0, 1, 1,
0.0730207, -0.7174203, 2.399115, 0, 0, 0, 1, 1,
0.07613871, 0.4178097, 0.8472762, 0, 0, 0, 1, 1,
0.07704822, -1.300324, 2.417814, 0, 0, 0, 1, 1,
0.07993967, 0.9971017, 1.533585, 0, 0, 0, 1, 1,
0.08147881, -0.6263862, 3.804089, 0, 0, 0, 1, 1,
0.08479044, -1.336376, 4.694423, 1, 1, 1, 1, 1,
0.08524062, 1.353813, 0.05443954, 1, 1, 1, 1, 1,
0.08761956, -0.9179111, 3.62876, 1, 1, 1, 1, 1,
0.09281936, -0.4066176, 2.500638, 1, 1, 1, 1, 1,
0.09314105, 1.273125, -0.9531341, 1, 1, 1, 1, 1,
0.09366723, -0.1026606, 3.610727, 1, 1, 1, 1, 1,
0.09552131, 0.6346315, -0.5007106, 1, 1, 1, 1, 1,
0.09699683, 2.564089, -0.8944235, 1, 1, 1, 1, 1,
0.09868115, -0.4231521, 2.445843, 1, 1, 1, 1, 1,
0.1012386, 1.062406, 0.655494, 1, 1, 1, 1, 1,
0.104283, -0.4459167, 2.834125, 1, 1, 1, 1, 1,
0.1060863, 0.7830568, -1.466368, 1, 1, 1, 1, 1,
0.1137709, 1.645209, 0.255818, 1, 1, 1, 1, 1,
0.1157505, 0.6848168, 1.677148, 1, 1, 1, 1, 1,
0.1169454, -0.1450965, 3.412858, 1, 1, 1, 1, 1,
0.12088, 1.436434, 0.1422008, 0, 0, 1, 1, 1,
0.1223532, -0.3122607, 0.8145046, 1, 0, 0, 1, 1,
0.1280637, -1.003773, 3.432482, 1, 0, 0, 1, 1,
0.1341012, 0.06674457, 0.6167774, 1, 0, 0, 1, 1,
0.1359186, 1.11183, 0.6898932, 1, 0, 0, 1, 1,
0.1361516, -0.3148785, 2.28687, 1, 0, 0, 1, 1,
0.1374937, 0.1275575, 0.3354584, 0, 0, 0, 1, 1,
0.1426452, -1.244709, 2.983469, 0, 0, 0, 1, 1,
0.1429134, -1.503088, 3.406655, 0, 0, 0, 1, 1,
0.1457608, 0.5148721, -0.2427992, 0, 0, 0, 1, 1,
0.1462765, 0.2712793, 1.623086, 0, 0, 0, 1, 1,
0.149868, 0.06650046, 1.25395, 0, 0, 0, 1, 1,
0.1512962, 1.880381, 0.125805, 0, 0, 0, 1, 1,
0.1521825, 0.3210301, 0.3681225, 1, 1, 1, 1, 1,
0.1523913, -1.11825, 4.087415, 1, 1, 1, 1, 1,
0.156343, 0.9882508, 1.180351, 1, 1, 1, 1, 1,
0.1572196, -0.2456779, 2.32177, 1, 1, 1, 1, 1,
0.1588161, -0.8431324, 1.646925, 1, 1, 1, 1, 1,
0.1601759, 0.4401777, -2.575566, 1, 1, 1, 1, 1,
0.1630242, 0.01192527, 2.313922, 1, 1, 1, 1, 1,
0.1638298, -0.2633449, 1.330018, 1, 1, 1, 1, 1,
0.1696878, 0.6242387, -0.4248155, 1, 1, 1, 1, 1,
0.1705457, 1.37546, -0.6824856, 1, 1, 1, 1, 1,
0.17065, -0.9915841, 3.593013, 1, 1, 1, 1, 1,
0.1710767, -0.3710976, 3.627179, 1, 1, 1, 1, 1,
0.1720801, -0.1830431, 2.628864, 1, 1, 1, 1, 1,
0.1721958, 1.446859, -0.5154723, 1, 1, 1, 1, 1,
0.1744935, -0.8523089, 3.629196, 1, 1, 1, 1, 1,
0.1784377, -0.7537676, 2.616814, 0, 0, 1, 1, 1,
0.1817627, -0.9226964, 4.189949, 1, 0, 0, 1, 1,
0.1886369, 1.576982, -0.1397496, 1, 0, 0, 1, 1,
0.1889289, -0.548708, 3.382048, 1, 0, 0, 1, 1,
0.1909167, 0.4194086, -0.1929843, 1, 0, 0, 1, 1,
0.1996069, 0.6247661, 0.3198078, 1, 0, 0, 1, 1,
0.2071988, -1.484259, 4.772048, 0, 0, 0, 1, 1,
0.2123587, 1.787352, 0.06820922, 0, 0, 0, 1, 1,
0.2140033, -0.8441601, 2.824183, 0, 0, 0, 1, 1,
0.2170457, 2.425429, -0.0147409, 0, 0, 0, 1, 1,
0.2281801, 1.353766, -1.46265, 0, 0, 0, 1, 1,
0.2291187, 1.402448, -0.05678103, 0, 0, 0, 1, 1,
0.2322223, 0.6834847, -0.7344896, 0, 0, 0, 1, 1,
0.2326065, 0.08674444, 0.6493199, 1, 1, 1, 1, 1,
0.2369864, 0.6737801, -0.4103381, 1, 1, 1, 1, 1,
0.2371919, -0.03084049, 1.266361, 1, 1, 1, 1, 1,
0.2392722, -1.628324, 4.404684, 1, 1, 1, 1, 1,
0.2403589, 0.2440985, 1.082496, 1, 1, 1, 1, 1,
0.2439655, -0.1444968, 2.895545, 1, 1, 1, 1, 1,
0.2480129, -0.5117707, 1.462165, 1, 1, 1, 1, 1,
0.2503514, 0.6324688, 0.1877226, 1, 1, 1, 1, 1,
0.2520061, -0.2783011, 2.613817, 1, 1, 1, 1, 1,
0.2584407, 0.9309211, 1.653679, 1, 1, 1, 1, 1,
0.2644686, 0.8340737, 0.8267052, 1, 1, 1, 1, 1,
0.2652671, -0.1382935, 3.437964, 1, 1, 1, 1, 1,
0.2659485, -0.3190607, 1.861797, 1, 1, 1, 1, 1,
0.2726268, -0.440088, 2.631463, 1, 1, 1, 1, 1,
0.2734717, -1.055342, 3.773316, 1, 1, 1, 1, 1,
0.2740768, 1.742237, 0.7884387, 0, 0, 1, 1, 1,
0.2745805, -0.628194, 4.520066, 1, 0, 0, 1, 1,
0.276642, 0.09391049, 2.525697, 1, 0, 0, 1, 1,
0.2791197, 0.0779741, 1.68523, 1, 0, 0, 1, 1,
0.2806565, -1.122652, 4.660947, 1, 0, 0, 1, 1,
0.286386, 0.4430455, 0.4084657, 1, 0, 0, 1, 1,
0.2900409, -0.7823689, 2.726699, 0, 0, 0, 1, 1,
0.2937292, -0.1899582, 1.510449, 0, 0, 0, 1, 1,
0.3044865, 0.3411457, 1.037479, 0, 0, 0, 1, 1,
0.3051883, -0.07349017, 1.028634, 0, 0, 0, 1, 1,
0.3056261, -1.01376, 2.247131, 0, 0, 0, 1, 1,
0.3058648, 0.1458716, 0.1712433, 0, 0, 0, 1, 1,
0.3080562, -1.224727, 1.740596, 0, 0, 0, 1, 1,
0.3094866, 0.1841356, 1.694988, 1, 1, 1, 1, 1,
0.3101599, -0.7949973, 2.734503, 1, 1, 1, 1, 1,
0.3104781, 0.1088061, -0.2798631, 1, 1, 1, 1, 1,
0.3174576, 0.8783423, 0.7771135, 1, 1, 1, 1, 1,
0.319936, 2.066215, 0.251963, 1, 1, 1, 1, 1,
0.3202384, 0.9715233, 1.384456, 1, 1, 1, 1, 1,
0.3232862, 0.2765215, 1.850778, 1, 1, 1, 1, 1,
0.3251076, 0.5601435, 0.1863764, 1, 1, 1, 1, 1,
0.3252501, -0.515312, 4.106554, 1, 1, 1, 1, 1,
0.3270312, -0.4423548, 1.682942, 1, 1, 1, 1, 1,
0.3270578, 0.1966519, -0.5436541, 1, 1, 1, 1, 1,
0.3348647, 0.06631729, 0.8133821, 1, 1, 1, 1, 1,
0.3386024, -0.8210238, 3.169307, 1, 1, 1, 1, 1,
0.3402236, 1.158247, 1.842827, 1, 1, 1, 1, 1,
0.3410357, 0.5219865, -2.049957, 1, 1, 1, 1, 1,
0.3420361, -0.1784752, 2.563766, 0, 0, 1, 1, 1,
0.3475688, -0.9010777, 4.295218, 1, 0, 0, 1, 1,
0.3506583, 1.294427, 0.5474283, 1, 0, 0, 1, 1,
0.3559733, 0.5798061, -0.3659159, 1, 0, 0, 1, 1,
0.3606035, -0.3863071, 2.214773, 1, 0, 0, 1, 1,
0.3618058, 0.1503975, 0.7977218, 1, 0, 0, 1, 1,
0.3634868, -0.01654261, -0.483175, 0, 0, 0, 1, 1,
0.3664758, -0.4716897, 3.44904, 0, 0, 0, 1, 1,
0.3678038, 0.09421655, 1.630531, 0, 0, 0, 1, 1,
0.3696856, 1.315021, -2.224238, 0, 0, 0, 1, 1,
0.3722248, -0.0861141, 0.2811319, 0, 0, 0, 1, 1,
0.3820212, 2.382905, -1.770965, 0, 0, 0, 1, 1,
0.3826425, 0.1600387, 0.1579031, 0, 0, 0, 1, 1,
0.3851895, -2.124164, 2.869551, 1, 1, 1, 1, 1,
0.3923593, 0.7620056, 1.69076, 1, 1, 1, 1, 1,
0.3951011, 0.6065279, 0.809034, 1, 1, 1, 1, 1,
0.3984263, -0.8694344, 1.562156, 1, 1, 1, 1, 1,
0.3996875, 0.9996943, -2.001818, 1, 1, 1, 1, 1,
0.4064348, -2.251641, 3.388518, 1, 1, 1, 1, 1,
0.4065734, -0.1031138, 0.5845516, 1, 1, 1, 1, 1,
0.40693, -0.8369226, 1.922318, 1, 1, 1, 1, 1,
0.4080123, -0.1501867, 2.068051, 1, 1, 1, 1, 1,
0.4102561, 1.176577, 1.52564, 1, 1, 1, 1, 1,
0.4153746, 1.42816, -0.3030725, 1, 1, 1, 1, 1,
0.4196621, 0.9948722, 1.550009, 1, 1, 1, 1, 1,
0.4244756, -0.3115723, 2.328987, 1, 1, 1, 1, 1,
0.4266196, 0.1774839, 1.11107, 1, 1, 1, 1, 1,
0.4303455, -0.7493032, 3.064744, 1, 1, 1, 1, 1,
0.4379029, 1.671802, -0.814216, 0, 0, 1, 1, 1,
0.4397368, 0.7384402, 0.4421812, 1, 0, 0, 1, 1,
0.4430681, 0.7675118, 0.1758039, 1, 0, 0, 1, 1,
0.4433057, -0.8747644, 2.008276, 1, 0, 0, 1, 1,
0.4438002, 1.663324, -0.7415602, 1, 0, 0, 1, 1,
0.4450403, 0.4222633, 1.586689, 1, 0, 0, 1, 1,
0.4480167, 0.2209363, 2.432029, 0, 0, 0, 1, 1,
0.4522553, 0.1194261, 0.8944732, 0, 0, 0, 1, 1,
0.4522943, 0.6050591, 0.3373847, 0, 0, 0, 1, 1,
0.4539508, 0.5749192, 1.222551, 0, 0, 0, 1, 1,
0.4671878, -0.167941, 2.121174, 0, 0, 0, 1, 1,
0.4756829, 1.286973, -1.782371, 0, 0, 0, 1, 1,
0.4759363, -0.08079659, 0.7616606, 0, 0, 0, 1, 1,
0.4760528, -1.023709, 2.34137, 1, 1, 1, 1, 1,
0.4773591, 0.7598161, 1.518264, 1, 1, 1, 1, 1,
0.4779312, 0.5210631, 1.180533, 1, 1, 1, 1, 1,
0.4785985, -2.52394, 2.43781, 1, 1, 1, 1, 1,
0.4829765, 0.2062023, 0.9871572, 1, 1, 1, 1, 1,
0.4854226, -0.171031, 2.034215, 1, 1, 1, 1, 1,
0.4859097, -0.9575927, 1.968593, 1, 1, 1, 1, 1,
0.4882413, 1.011795, 0.2965776, 1, 1, 1, 1, 1,
0.489662, 1.338152, -0.2785462, 1, 1, 1, 1, 1,
0.4899294, 0.6923652, 1.888901, 1, 1, 1, 1, 1,
0.4933746, 0.6653492, 2.448019, 1, 1, 1, 1, 1,
0.4936743, 1.108631, 1.622728, 1, 1, 1, 1, 1,
0.4960797, -0.4703468, 0.6226821, 1, 1, 1, 1, 1,
0.4982177, 1.874983, 0.2050705, 1, 1, 1, 1, 1,
0.5003918, -0.8443549, 1.842321, 1, 1, 1, 1, 1,
0.5013615, 0.7894939, 0.5515012, 0, 0, 1, 1, 1,
0.5025961, -1.150118, 2.67259, 1, 0, 0, 1, 1,
0.5050892, -0.9671556, 2.072418, 1, 0, 0, 1, 1,
0.5092518, -0.9102437, 2.529158, 1, 0, 0, 1, 1,
0.5121358, -0.345811, 2.321342, 1, 0, 0, 1, 1,
0.5123521, -1.080056, 3.547016, 1, 0, 0, 1, 1,
0.5135728, 0.8003569, 1.096979, 0, 0, 0, 1, 1,
0.5155434, 0.6833637, 1.66713, 0, 0, 0, 1, 1,
0.5163078, -0.1717571, 2.381318, 0, 0, 0, 1, 1,
0.5220162, -0.9105498, 2.164376, 0, 0, 0, 1, 1,
0.5250692, 1.407035, -0.8730353, 0, 0, 0, 1, 1,
0.5250977, -0.799156, 2.97528, 0, 0, 0, 1, 1,
0.5279704, 0.4226813, 2.683595, 0, 0, 0, 1, 1,
0.5291953, -0.9168775, 2.094104, 1, 1, 1, 1, 1,
0.5292339, -1.754919, 3.689494, 1, 1, 1, 1, 1,
0.5294617, 0.3644117, 1.48841, 1, 1, 1, 1, 1,
0.5301479, -1.376447, 3.781354, 1, 1, 1, 1, 1,
0.5307791, 1.768657, -0.5582438, 1, 1, 1, 1, 1,
0.5362172, -0.6310806, 3.353888, 1, 1, 1, 1, 1,
0.5406504, 1.012177, 2.11619, 1, 1, 1, 1, 1,
0.545206, -0.9247099, 2.362277, 1, 1, 1, 1, 1,
0.5459957, 1.611567, 1.455246, 1, 1, 1, 1, 1,
0.5466977, -0.887402, 2.540146, 1, 1, 1, 1, 1,
0.5468873, -0.3170906, 0.2141066, 1, 1, 1, 1, 1,
0.5532322, 2.497168, 1.06798, 1, 1, 1, 1, 1,
0.5533984, 0.3911802, 1.924641, 1, 1, 1, 1, 1,
0.5572855, -0.472546, 1.064581, 1, 1, 1, 1, 1,
0.5617109, 1.051954, -0.2196605, 1, 1, 1, 1, 1,
0.5639352, 1.396582, 1.345541, 0, 0, 1, 1, 1,
0.5708066, -0.8354899, 2.222467, 1, 0, 0, 1, 1,
0.5708399, -0.09343882, 2.609443, 1, 0, 0, 1, 1,
0.571117, -0.8610209, 1.657926, 1, 0, 0, 1, 1,
0.5804396, -2.139702, 3.067722, 1, 0, 0, 1, 1,
0.582369, 0.7959811, 1.785261, 1, 0, 0, 1, 1,
0.5864494, -0.1653816, 2.526791, 0, 0, 0, 1, 1,
0.5890688, 0.9205852, 0.6201798, 0, 0, 0, 1, 1,
0.5910184, -0.624039, 1.8066, 0, 0, 0, 1, 1,
0.5922816, -0.4544062, 1.037644, 0, 0, 0, 1, 1,
0.5926876, -2.072829, 3.847274, 0, 0, 0, 1, 1,
0.5949976, 0.1722715, 0.3525415, 0, 0, 0, 1, 1,
0.5952225, 0.01215649, 0.9741365, 0, 0, 0, 1, 1,
0.5963759, 0.05532395, 0.5524501, 1, 1, 1, 1, 1,
0.599937, 1.025117, 0.4037721, 1, 1, 1, 1, 1,
0.6018707, -1.135601, 4.251329, 1, 1, 1, 1, 1,
0.6041784, 0.4965541, 0.6017036, 1, 1, 1, 1, 1,
0.6045944, 1.263766, 1.670821, 1, 1, 1, 1, 1,
0.6067356, 1.393268, 0.7876135, 1, 1, 1, 1, 1,
0.6113028, -0.3651514, 2.934043, 1, 1, 1, 1, 1,
0.6134763, 1.692033, 0.4948571, 1, 1, 1, 1, 1,
0.6177406, 0.4792792, 1.106107, 1, 1, 1, 1, 1,
0.6241723, 0.9464592, 0.6303402, 1, 1, 1, 1, 1,
0.6252056, 0.3958115, 1.268583, 1, 1, 1, 1, 1,
0.6259449, -0.6580835, 1.0844, 1, 1, 1, 1, 1,
0.629158, 1.212996, 0.5862274, 1, 1, 1, 1, 1,
0.6305418, 0.5508537, 0.3993738, 1, 1, 1, 1, 1,
0.6398901, -0.6556664, 2.488892, 1, 1, 1, 1, 1,
0.6406809, 1.413451, -0.28973, 0, 0, 1, 1, 1,
0.6420288, -2.226218, 3.011746, 1, 0, 0, 1, 1,
0.6431285, 0.1958883, 0.5903234, 1, 0, 0, 1, 1,
0.6446087, -1.213177, 2.316169, 1, 0, 0, 1, 1,
0.6499244, 0.4698731, 3.511232, 1, 0, 0, 1, 1,
0.6522626, -0.8773646, 3.471813, 1, 0, 0, 1, 1,
0.6527005, 0.6450363, -0.5422652, 0, 0, 0, 1, 1,
0.6552473, -1.382012, 3.226568, 0, 0, 0, 1, 1,
0.6555547, -0.8586657, 2.386575, 0, 0, 0, 1, 1,
0.6560611, 0.1779083, 1.396229, 0, 0, 0, 1, 1,
0.6568797, 0.2664481, 2.194757, 0, 0, 0, 1, 1,
0.6714396, -0.6446565, 3.320476, 0, 0, 0, 1, 1,
0.677058, 0.1378845, 2.857242, 0, 0, 0, 1, 1,
0.6801887, 1.981492, -0.9705209, 1, 1, 1, 1, 1,
0.6888266, 1.837802, -1.289966, 1, 1, 1, 1, 1,
0.6916522, -0.06494937, 1.615687, 1, 1, 1, 1, 1,
0.6932918, -0.08555147, 1.205534, 1, 1, 1, 1, 1,
0.6937287, 1.725229, 1.465912, 1, 1, 1, 1, 1,
0.6959477, -0.3856204, 2.14777, 1, 1, 1, 1, 1,
0.7016225, 1.204715, -0.1991145, 1, 1, 1, 1, 1,
0.7052057, 0.7080113, 0.6265367, 1, 1, 1, 1, 1,
0.7118076, -0.1194827, 1.016891, 1, 1, 1, 1, 1,
0.7144392, -0.6345557, 2.819607, 1, 1, 1, 1, 1,
0.717718, -0.5813302, 4.012362, 1, 1, 1, 1, 1,
0.720834, -0.3632811, 3.307941, 1, 1, 1, 1, 1,
0.7258251, 1.077276, 0.639759, 1, 1, 1, 1, 1,
0.7270033, 0.8793497, 0.3292627, 1, 1, 1, 1, 1,
0.7290354, 1.547961, 0.100471, 1, 1, 1, 1, 1,
0.7386749, 0.01349167, 1.096836, 0, 0, 1, 1, 1,
0.7403479, -2.219446, 5.501245, 1, 0, 0, 1, 1,
0.7403942, 2.025826, -1.016577, 1, 0, 0, 1, 1,
0.7448058, 0.2228268, 0.1076012, 1, 0, 0, 1, 1,
0.7472318, -0.3120958, 2.181984, 1, 0, 0, 1, 1,
0.7599991, 1.509982, 0.04977268, 1, 0, 0, 1, 1,
0.7730367, 0.9779731, 0.9033415, 0, 0, 0, 1, 1,
0.7737071, 1.062539, 0.875064, 0, 0, 0, 1, 1,
0.7761189, -1.140578, 3.022851, 0, 0, 0, 1, 1,
0.7773194, -1.216739, 0.6550091, 0, 0, 0, 1, 1,
0.7851987, 0.1242297, 0.6769746, 0, 0, 0, 1, 1,
0.8032178, -0.199713, 2.220589, 0, 0, 0, 1, 1,
0.8092075, 1.141918, 0.1214004, 0, 0, 0, 1, 1,
0.8157735, -0.996399, 1.763308, 1, 1, 1, 1, 1,
0.8225972, -1.619024, 3.613043, 1, 1, 1, 1, 1,
0.8233568, -0.208395, 1.640903, 1, 1, 1, 1, 1,
0.8265294, 0.2337089, 1.672169, 1, 1, 1, 1, 1,
0.8270797, -1.64194, 3.223147, 1, 1, 1, 1, 1,
0.839295, -1.984988, 2.938999, 1, 1, 1, 1, 1,
0.8405457, -1.650288, 2.159674, 1, 1, 1, 1, 1,
0.8438332, -1.500654, 3.680598, 1, 1, 1, 1, 1,
0.8449184, -0.6426353, 1.87049, 1, 1, 1, 1, 1,
0.8450405, 1.02503, 0.6105939, 1, 1, 1, 1, 1,
0.8463152, 0.650062, 0.3574808, 1, 1, 1, 1, 1,
0.8499653, 1.302524, 1.830482, 1, 1, 1, 1, 1,
0.8505943, 1.126673, 1.596995, 1, 1, 1, 1, 1,
0.8538285, 0.2811812, 0.1255267, 1, 1, 1, 1, 1,
0.8555984, -1.845119, 3.395375, 1, 1, 1, 1, 1,
0.8558226, 1.309161, 1.895376, 0, 0, 1, 1, 1,
0.8560307, 0.2482138, 2.869125, 1, 0, 0, 1, 1,
0.8573411, -0.505099, 1.637276, 1, 0, 0, 1, 1,
0.8636446, 0.3659803, 2.012075, 1, 0, 0, 1, 1,
0.8642102, -0.3688376, 0.5771418, 1, 0, 0, 1, 1,
0.8666701, -0.5352502, 1.45984, 1, 0, 0, 1, 1,
0.8737108, 1.509534, 1.196705, 0, 0, 0, 1, 1,
0.880498, -1.855415, 2.86799, 0, 0, 0, 1, 1,
0.8816023, 0.0250523, 1.981845, 0, 0, 0, 1, 1,
0.8855007, 0.4501403, 1.757666, 0, 0, 0, 1, 1,
0.8920887, 0.7146081, 0.04965903, 0, 0, 0, 1, 1,
0.9039857, -1.14057, 0.6462644, 0, 0, 0, 1, 1,
0.9117467, 0.8643773, 0.7665604, 0, 0, 0, 1, 1,
0.9162508, 0.03859414, 2.371449, 1, 1, 1, 1, 1,
0.9169347, 1.381703, 0.7409788, 1, 1, 1, 1, 1,
0.9186515, -0.01340563, 2.993901, 1, 1, 1, 1, 1,
0.9304197, 1.255768, -0.6587098, 1, 1, 1, 1, 1,
0.9323967, 0.4648884, 1.633457, 1, 1, 1, 1, 1,
0.9330903, -0.6301652, 2.149841, 1, 1, 1, 1, 1,
0.9332649, 0.3470686, 3.264437, 1, 1, 1, 1, 1,
0.9344637, -2.371767, 1.145366, 1, 1, 1, 1, 1,
0.9345676, 1.22914, 0.5555231, 1, 1, 1, 1, 1,
0.9352213, 1.576844, -0.03083157, 1, 1, 1, 1, 1,
0.9382731, -0.3770795, 2.54019, 1, 1, 1, 1, 1,
0.9441402, -0.8909569, 3.032447, 1, 1, 1, 1, 1,
0.9451523, 0.4881898, 1.024317, 1, 1, 1, 1, 1,
0.9505388, -1.248353, 0.7635311, 1, 1, 1, 1, 1,
0.9573119, -0.9223586, 2.789145, 1, 1, 1, 1, 1,
0.9591665, -0.621726, 1.964795, 0, 0, 1, 1, 1,
0.9602543, 0.6659533, 0.9763532, 1, 0, 0, 1, 1,
0.963786, -0.3128345, 2.151967, 1, 0, 0, 1, 1,
0.9736516, -0.2049634, 1.362151, 1, 0, 0, 1, 1,
0.9777583, 0.4291039, 1.160574, 1, 0, 0, 1, 1,
0.9806805, -0.635636, 0.7595657, 1, 0, 0, 1, 1,
0.9815192, 0.7648183, -0.8538657, 0, 0, 0, 1, 1,
0.9816845, 0.9428195, 0.729559, 0, 0, 0, 1, 1,
0.9844047, 1.532898, 0.7858178, 0, 0, 0, 1, 1,
0.9876142, -0.2425412, 1.064879, 0, 0, 0, 1, 1,
0.9879144, -0.9568437, 2.790293, 0, 0, 0, 1, 1,
0.989453, 1.62951, 2.038118, 0, 0, 0, 1, 1,
0.9895331, -1.947546, 1.667906, 0, 0, 0, 1, 1,
0.9897442, 1.881335, 0.4723088, 1, 1, 1, 1, 1,
0.9919448, 0.1237051, 2.360007, 1, 1, 1, 1, 1,
0.9936688, -1.47976, 1.567325, 1, 1, 1, 1, 1,
0.9945279, 0.689013, -0.292556, 1, 1, 1, 1, 1,
0.9984668, 0.3590167, 2.346211, 1, 1, 1, 1, 1,
1.005913, 0.6027067, 1.992257, 1, 1, 1, 1, 1,
1.006668, -0.261999, 2.204682, 1, 1, 1, 1, 1,
1.009785, -1.409628, 3.358348, 1, 1, 1, 1, 1,
1.011717, 1.08601, 1.576741, 1, 1, 1, 1, 1,
1.018788, -0.4450934, 2.755666, 1, 1, 1, 1, 1,
1.023613, -0.4821616, 1.656432, 1, 1, 1, 1, 1,
1.026573, -0.02372967, 4.368752, 1, 1, 1, 1, 1,
1.037243, -0.4419676, 0.9108379, 1, 1, 1, 1, 1,
1.038944, -1.736174, 1.344417, 1, 1, 1, 1, 1,
1.041455, -1.011265, 2.610723, 1, 1, 1, 1, 1,
1.047012, -0.8999444, 1.945677, 0, 0, 1, 1, 1,
1.04712, 0.4123249, 0.08353377, 1, 0, 0, 1, 1,
1.062876, 0.877332, 1.720211, 1, 0, 0, 1, 1,
1.063172, 0.1251602, 2.250298, 1, 0, 0, 1, 1,
1.0652, 1.162028, 1.215842, 1, 0, 0, 1, 1,
1.071443, -0.02633004, 2.760015, 1, 0, 0, 1, 1,
1.080692, 1.350512, 0.008598078, 0, 0, 0, 1, 1,
1.082502, -0.1011321, 1.157108, 0, 0, 0, 1, 1,
1.085634, -0.2125116, 2.679618, 0, 0, 0, 1, 1,
1.114784, -0.8079339, 3.1195, 0, 0, 0, 1, 1,
1.11521, 0.1636816, 2.12081, 0, 0, 0, 1, 1,
1.121427, -0.4881743, 0.9737203, 0, 0, 0, 1, 1,
1.124044, -0.2654934, 3.400852, 0, 0, 0, 1, 1,
1.127671, 2.054364, 0.5157608, 1, 1, 1, 1, 1,
1.133981, -1.153692, 2.757829, 1, 1, 1, 1, 1,
1.134992, -0.8676254, 1.494354, 1, 1, 1, 1, 1,
1.135185, -0.2156341, 2.143415, 1, 1, 1, 1, 1,
1.143564, -1.397434, 3.460583, 1, 1, 1, 1, 1,
1.147199, 1.359089, -0.2054699, 1, 1, 1, 1, 1,
1.159155, -0.4666871, 1.337377, 1, 1, 1, 1, 1,
1.164455, -0.6055919, 2.78251, 1, 1, 1, 1, 1,
1.172985, 0.6708041, 1.925694, 1, 1, 1, 1, 1,
1.180312, 0.9231198, 3.260033, 1, 1, 1, 1, 1,
1.182938, -1.918548, 3.316692, 1, 1, 1, 1, 1,
1.185447, -0.3118117, 3.715734, 1, 1, 1, 1, 1,
1.188533, 0.8974983, -0.5299975, 1, 1, 1, 1, 1,
1.192875, 0.2715252, 1.649811, 1, 1, 1, 1, 1,
1.193832, 1.767283, 0.7689023, 1, 1, 1, 1, 1,
1.195462, 1.138447, 1.430724, 0, 0, 1, 1, 1,
1.198969, 0.8545058, 1.749113, 1, 0, 0, 1, 1,
1.203213, 1.83812, 1.656625, 1, 0, 0, 1, 1,
1.206664, -0.4101603, -0.1121854, 1, 0, 0, 1, 1,
1.215651, -1.005467, 1.939903, 1, 0, 0, 1, 1,
1.219464, -1.711147, 1.656788, 1, 0, 0, 1, 1,
1.220209, -0.1129015, 3.040514, 0, 0, 0, 1, 1,
1.223076, -1.656028, 2.165984, 0, 0, 0, 1, 1,
1.223611, 0.7796946, 2.664064, 0, 0, 0, 1, 1,
1.231519, -0.03347908, 0.1761754, 0, 0, 0, 1, 1,
1.233734, 0.3001136, 0.3855278, 0, 0, 0, 1, 1,
1.24262, -0.8384789, 1.211875, 0, 0, 0, 1, 1,
1.242921, 0.8797725, 0.8398347, 0, 0, 0, 1, 1,
1.25209, 1.378315, 0.185399, 1, 1, 1, 1, 1,
1.256972, -0.9014635, 2.621073, 1, 1, 1, 1, 1,
1.266894, -1.958869, 1.97881, 1, 1, 1, 1, 1,
1.271784, 0.1973388, 0.4011864, 1, 1, 1, 1, 1,
1.272086, 1.722846, 1.165825, 1, 1, 1, 1, 1,
1.286862, 0.8599599, 0.1150901, 1, 1, 1, 1, 1,
1.295695, 0.1407313, 2.826619, 1, 1, 1, 1, 1,
1.295969, -1.358189, 1.991946, 1, 1, 1, 1, 1,
1.298729, 0.3716164, 2.097546, 1, 1, 1, 1, 1,
1.300352, 0.07869384, 3.245969, 1, 1, 1, 1, 1,
1.305467, -1.417538, 2.289798, 1, 1, 1, 1, 1,
1.342361, 1.213966, 0.7002922, 1, 1, 1, 1, 1,
1.356074, 0.6355712, -0.5994962, 1, 1, 1, 1, 1,
1.358196, 0.02492086, 1.759383, 1, 1, 1, 1, 1,
1.368474, 1.095585, 0.1254648, 1, 1, 1, 1, 1,
1.370618, 0.3268852, 2.596301, 0, 0, 1, 1, 1,
1.37276, 0.1454518, 1.61526, 1, 0, 0, 1, 1,
1.378046, -0.1927564, 0.1800986, 1, 0, 0, 1, 1,
1.380189, -0.4309541, 2.107422, 1, 0, 0, 1, 1,
1.38123, -0.3049397, 2.698454, 1, 0, 0, 1, 1,
1.390161, 0.3492951, 2.62152, 1, 0, 0, 1, 1,
1.400843, -0.3379695, 1.338006, 0, 0, 0, 1, 1,
1.402952, -0.6682162, 3.375137, 0, 0, 0, 1, 1,
1.409204, 1.263252, 1.869829, 0, 0, 0, 1, 1,
1.421335, -1.091048, 3.249715, 0, 0, 0, 1, 1,
1.421566, 0.5766824, 1.850783, 0, 0, 0, 1, 1,
1.424121, 0.2789644, 2.29979, 0, 0, 0, 1, 1,
1.43847, 0.8120341, 1.352077, 0, 0, 0, 1, 1,
1.45523, 1.998487, -0.6739171, 1, 1, 1, 1, 1,
1.459624, -0.6881006, 2.21934, 1, 1, 1, 1, 1,
1.463069, 0.5691434, 2.095007, 1, 1, 1, 1, 1,
1.464884, -0.3294338, 1.030761, 1, 1, 1, 1, 1,
1.482064, -1.854824, 2.611094, 1, 1, 1, 1, 1,
1.487869, -0.2541959, 2.664469, 1, 1, 1, 1, 1,
1.492115, -1.879273, 1.419877, 1, 1, 1, 1, 1,
1.495051, 1.757852, 0.04443567, 1, 1, 1, 1, 1,
1.507283, -2.348421, 0.9309838, 1, 1, 1, 1, 1,
1.517109, -2.061636, 2.14848, 1, 1, 1, 1, 1,
1.557763, 0.3229218, 2.130054, 1, 1, 1, 1, 1,
1.560427, -1.731224, 2.693131, 1, 1, 1, 1, 1,
1.563027, -0.5383956, 3.187562, 1, 1, 1, 1, 1,
1.566393, -0.3799383, 0.5527437, 1, 1, 1, 1, 1,
1.580399, 0.6690311, -0.9251757, 1, 1, 1, 1, 1,
1.589534, -0.9877516, 1.92679, 0, 0, 1, 1, 1,
1.606866, 0.1564088, 0.7484788, 1, 0, 0, 1, 1,
1.608142, -0.06357458, 1.0528, 1, 0, 0, 1, 1,
1.617817, 2.152486, 0.7326645, 1, 0, 0, 1, 1,
1.63063, 2.130342, 0.7091638, 1, 0, 0, 1, 1,
1.630638, 0.7099064, 0.1978049, 1, 0, 0, 1, 1,
1.637106, 0.8490608, 3.599994, 0, 0, 0, 1, 1,
1.642046, -0.9706299, 3.661517, 0, 0, 0, 1, 1,
1.654627, -0.3463327, 1.743763, 0, 0, 0, 1, 1,
1.667619, 2.160279, 1.102679, 0, 0, 0, 1, 1,
1.685851, -0.3194126, 1.567688, 0, 0, 0, 1, 1,
1.692957, -1.51203, 1.217234, 0, 0, 0, 1, 1,
1.705034, -0.3820075, 2.393083, 0, 0, 0, 1, 1,
1.70781, 1.732271, 1.040262, 1, 1, 1, 1, 1,
1.730476, -0.5398117, 2.061259, 1, 1, 1, 1, 1,
1.757042, 2.400915, 1.493335, 1, 1, 1, 1, 1,
1.763035, -0.2810602, 1.791193, 1, 1, 1, 1, 1,
1.76624, 0.7198167, 1.67683, 1, 1, 1, 1, 1,
1.771212, -1.738803, 2.338813, 1, 1, 1, 1, 1,
1.775684, 1.347405, -0.4270405, 1, 1, 1, 1, 1,
1.795867, 0.185394, 1.455386, 1, 1, 1, 1, 1,
1.81003, -0.2245714, -0.3507412, 1, 1, 1, 1, 1,
1.813101, -0.6921902, 1.12596, 1, 1, 1, 1, 1,
1.827055, 0.3950867, 1.574133, 1, 1, 1, 1, 1,
1.83455, 0.5348592, 1.555185, 1, 1, 1, 1, 1,
1.84705, 1.523885, 0.05951779, 1, 1, 1, 1, 1,
1.865212, -0.1584565, 1.078783, 1, 1, 1, 1, 1,
1.870424, 0.4657228, -2.070266, 1, 1, 1, 1, 1,
1.882568, 0.01451164, 1.15977, 0, 0, 1, 1, 1,
1.900129, -1.34717, 1.100837, 1, 0, 0, 1, 1,
1.906931, 0.3911205, 1.711163, 1, 0, 0, 1, 1,
1.925334, -1.009333, 1.261979, 1, 0, 0, 1, 1,
1.931568, -0.6038838, 1.567295, 1, 0, 0, 1, 1,
1.956533, -0.05694989, 1.426663, 1, 0, 0, 1, 1,
1.978502, -0.6373872, 1.333136, 0, 0, 0, 1, 1,
1.979634, 1.216461, 1.077146, 0, 0, 0, 1, 1,
1.996499, 0.7047074, 0.6767954, 0, 0, 0, 1, 1,
2.066601, -2.309422, 0.6868097, 0, 0, 0, 1, 1,
2.093908, -1.090366, 2.508337, 0, 0, 0, 1, 1,
2.109139, 0.4247107, 0.9865781, 0, 0, 0, 1, 1,
2.16047, 0.2082764, 1.565225, 0, 0, 0, 1, 1,
2.182861, 1.615276, 0.7066288, 1, 1, 1, 1, 1,
2.225918, 1.164675, 3.159387, 1, 1, 1, 1, 1,
2.327198, -0.641863, 1.934301, 1, 1, 1, 1, 1,
2.368533, -1.186121, 0.04984692, 1, 1, 1, 1, 1,
2.458129, -0.2354756, 1.910183, 1, 1, 1, 1, 1,
2.48008, -0.4247745, 0.8558339, 1, 1, 1, 1, 1,
2.97524, 1.784764, 0.2625427, 1, 1, 1, 1, 1
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
var radius = 9.045551;
var distance = 31.77212;
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
mvMatrix.translate( -0.1526182, -0.02295649, -0.1428976 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.77212);
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
