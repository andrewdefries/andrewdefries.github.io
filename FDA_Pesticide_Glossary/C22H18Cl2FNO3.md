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
-2.844069, 0.03865215, -2.324816, 1, 0, 0, 1,
-2.732203, -0.3542507, -1.60546, 1, 0.007843138, 0, 1,
-2.704161, -0.2827763, -0.7373351, 1, 0.01176471, 0, 1,
-2.657256, 1.484383, -1.185529, 1, 0.01960784, 0, 1,
-2.542433, 0.7253252, -2.535944, 1, 0.02352941, 0, 1,
-2.520426, 0.5291281, -1.727274, 1, 0.03137255, 0, 1,
-2.519806, -1.363921, -1.731811, 1, 0.03529412, 0, 1,
-2.406216, -0.7009494, -1.261801, 1, 0.04313726, 0, 1,
-2.349777, -1.642576, -1.298013, 1, 0.04705882, 0, 1,
-2.302924, 0.0393401, -2.935449, 1, 0.05490196, 0, 1,
-2.29114, 1.154698, -0.4007583, 1, 0.05882353, 0, 1,
-2.290207, 0.6415038, -0.1528283, 1, 0.06666667, 0, 1,
-2.286769, -1.587574, -2.51794, 1, 0.07058824, 0, 1,
-2.285709, -1.020146, -0.383324, 1, 0.07843138, 0, 1,
-2.23999, 1.712823, 0.4305869, 1, 0.08235294, 0, 1,
-2.200788, 0.5675451, -1.169345, 1, 0.09019608, 0, 1,
-2.1793, 0.5887398, -0.5635438, 1, 0.09411765, 0, 1,
-2.162243, 1.455429, -0.7851954, 1, 0.1019608, 0, 1,
-2.158135, -0.18721, -2.300589, 1, 0.1098039, 0, 1,
-2.121983, 0.2057104, -1.274883, 1, 0.1137255, 0, 1,
-2.120633, -0.1714098, -1.924208, 1, 0.1215686, 0, 1,
-2.099731, 1.055725, -0.3608358, 1, 0.1254902, 0, 1,
-2.098168, -1.166455, -2.567813, 1, 0.1333333, 0, 1,
-2.083066, 1.479567, -0.07179983, 1, 0.1372549, 0, 1,
-2.055034, -0.001970353, -1.190246, 1, 0.145098, 0, 1,
-2.025318, -0.2918595, -2.125539, 1, 0.1490196, 0, 1,
-2.022513, 0.8849947, -0.8400318, 1, 0.1568628, 0, 1,
-1.986406, 1.056444, -1.475289, 1, 0.1607843, 0, 1,
-1.982731, 0.8726262, 0.6845888, 1, 0.1686275, 0, 1,
-1.979067, -0.09504679, 0.621524, 1, 0.172549, 0, 1,
-1.970421, 2.971188, -0.5510308, 1, 0.1803922, 0, 1,
-1.958408, -0.4019341, -0.2216412, 1, 0.1843137, 0, 1,
-1.947955, 0.8796111, -0.4132632, 1, 0.1921569, 0, 1,
-1.925461, 0.2758283, -0.5127081, 1, 0.1960784, 0, 1,
-1.918268, 0.3638646, -1.316052, 1, 0.2039216, 0, 1,
-1.913126, 0.01016143, -0.07830258, 1, 0.2117647, 0, 1,
-1.910843, 1.361069, -0.9033303, 1, 0.2156863, 0, 1,
-1.889494, 0.2742311, -2.012801, 1, 0.2235294, 0, 1,
-1.884483, -0.09216041, -2.030346, 1, 0.227451, 0, 1,
-1.8825, 1.69383, -0.2767002, 1, 0.2352941, 0, 1,
-1.848397, 2.397799, -0.06732163, 1, 0.2392157, 0, 1,
-1.832185, -0.2991441, -1.806149, 1, 0.2470588, 0, 1,
-1.82379, -1.101985, -2.485903, 1, 0.2509804, 0, 1,
-1.792083, -1.575722, -3.407557, 1, 0.2588235, 0, 1,
-1.773575, 0.7102638, -1.196207, 1, 0.2627451, 0, 1,
-1.741629, 0.232361, -1.619329, 1, 0.2705882, 0, 1,
-1.728016, 0.0540061, -3.327483, 1, 0.2745098, 0, 1,
-1.72577, -0.940032, -0.5332042, 1, 0.282353, 0, 1,
-1.723041, 0.7815119, -0.1239218, 1, 0.2862745, 0, 1,
-1.721259, -0.930796, -1.307296, 1, 0.2941177, 0, 1,
-1.712542, -2.170469, -2.103947, 1, 0.3019608, 0, 1,
-1.703029, 0.4383081, -2.113931, 1, 0.3058824, 0, 1,
-1.692356, -0.1709492, -0.4624913, 1, 0.3137255, 0, 1,
-1.68936, 0.1703985, -1.1843, 1, 0.3176471, 0, 1,
-1.683796, -0.6968144, -1.696551, 1, 0.3254902, 0, 1,
-1.678496, -0.795171, -1.965005, 1, 0.3294118, 0, 1,
-1.676881, -1.167505, -4.578281, 1, 0.3372549, 0, 1,
-1.665182, 1.352959, -1.528435, 1, 0.3411765, 0, 1,
-1.662136, 0.2190803, -2.201061, 1, 0.3490196, 0, 1,
-1.657251, 0.5123333, -1.645212, 1, 0.3529412, 0, 1,
-1.649089, 1.600534, -0.1628969, 1, 0.3607843, 0, 1,
-1.639515, -0.5154196, -1.745561, 1, 0.3647059, 0, 1,
-1.627539, -1.757694, -1.166674, 1, 0.372549, 0, 1,
-1.618174, -0.4603248, -1.098088, 1, 0.3764706, 0, 1,
-1.616095, -0.5256764, -2.485567, 1, 0.3843137, 0, 1,
-1.582223, 1.72412, -0.06056716, 1, 0.3882353, 0, 1,
-1.541822, 0.7514878, -1.531094, 1, 0.3960784, 0, 1,
-1.532321, -0.03500471, -1.946063, 1, 0.4039216, 0, 1,
-1.530153, -0.243748, -1.803056, 1, 0.4078431, 0, 1,
-1.512935, -1.463509, -2.476031, 1, 0.4156863, 0, 1,
-1.50127, -0.3582306, -0.9486595, 1, 0.4196078, 0, 1,
-1.497208, -0.8939962, -4.946095, 1, 0.427451, 0, 1,
-1.489506, 0.7268087, -2.351997, 1, 0.4313726, 0, 1,
-1.489227, 0.9355906, -0.4157156, 1, 0.4392157, 0, 1,
-1.485712, 0.8731526, -1.243069, 1, 0.4431373, 0, 1,
-1.4765, -1.41511, -2.533756, 1, 0.4509804, 0, 1,
-1.472494, -1.239112, -2.660997, 1, 0.454902, 0, 1,
-1.47041, -0.09253786, -2.416564, 1, 0.4627451, 0, 1,
-1.464607, 0.4993302, -1.816951, 1, 0.4666667, 0, 1,
-1.452716, 0.2749434, -2.099136, 1, 0.4745098, 0, 1,
-1.451121, -1.293307, -2.588262, 1, 0.4784314, 0, 1,
-1.449537, -0.5594552, -3.087594, 1, 0.4862745, 0, 1,
-1.448189, -0.227185, -3.06845, 1, 0.4901961, 0, 1,
-1.442278, -0.3529463, -0.1877162, 1, 0.4980392, 0, 1,
-1.441037, -0.946306, -4.00878, 1, 0.5058824, 0, 1,
-1.440471, -0.7716044, -2.797204, 1, 0.509804, 0, 1,
-1.439757, -0.3864073, -1.624384, 1, 0.5176471, 0, 1,
-1.436208, 1.269045, -1.877185, 1, 0.5215687, 0, 1,
-1.422062, 0.7732067, -1.394268, 1, 0.5294118, 0, 1,
-1.420886, -0.9141809, -2.294569, 1, 0.5333334, 0, 1,
-1.40351, 0.5434424, -3.515424, 1, 0.5411765, 0, 1,
-1.400984, 1.679451, -1.580464, 1, 0.5450981, 0, 1,
-1.400221, 1.564705, 0.9437262, 1, 0.5529412, 0, 1,
-1.392635, -1.266809, -2.446738, 1, 0.5568628, 0, 1,
-1.370282, -0.03765227, -1.442863, 1, 0.5647059, 0, 1,
-1.366232, 0.5167176, -1.170456, 1, 0.5686275, 0, 1,
-1.362221, -0.4098387, -1.414686, 1, 0.5764706, 0, 1,
-1.35937, -0.2548173, -3.237054, 1, 0.5803922, 0, 1,
-1.348518, 0.05702969, -2.278702, 1, 0.5882353, 0, 1,
-1.343813, 0.6012751, -2.897692, 1, 0.5921569, 0, 1,
-1.315982, 0.2604527, 0.9499534, 1, 0.6, 0, 1,
-1.313305, 0.6158155, -3.646189, 1, 0.6078432, 0, 1,
-1.295615, -0.4197443, -1.718677, 1, 0.6117647, 0, 1,
-1.28632, 1.117312, -1.893307, 1, 0.6196079, 0, 1,
-1.284842, 0.7043352, -1.176117, 1, 0.6235294, 0, 1,
-1.284718, -0.1480079, -2.208301, 1, 0.6313726, 0, 1,
-1.283008, -0.4837931, -2.035631, 1, 0.6352941, 0, 1,
-1.273575, 1.72189, -0.6209605, 1, 0.6431373, 0, 1,
-1.258987, -0.09003926, -1.339955, 1, 0.6470588, 0, 1,
-1.25101, 0.3004462, -1.446769, 1, 0.654902, 0, 1,
-1.238229, 0.5770118, 0.1017303, 1, 0.6588235, 0, 1,
-1.233675, -0.06264553, -1.078146, 1, 0.6666667, 0, 1,
-1.227154, -1.08669, -2.392839, 1, 0.6705883, 0, 1,
-1.219814, 0.005215762, -1.089369, 1, 0.6784314, 0, 1,
-1.214835, 0.6217558, -0.43176, 1, 0.682353, 0, 1,
-1.213403, -1.412288, -2.437848, 1, 0.6901961, 0, 1,
-1.199912, -0.05020802, -2.11124, 1, 0.6941177, 0, 1,
-1.180526, -0.6547033, -0.01364805, 1, 0.7019608, 0, 1,
-1.172867, -1.247733, -1.761154, 1, 0.7098039, 0, 1,
-1.167665, -0.4374281, -3.180263, 1, 0.7137255, 0, 1,
-1.16664, -0.0169525, -2.516894, 1, 0.7215686, 0, 1,
-1.164464, 0.7005067, -2.894731, 1, 0.7254902, 0, 1,
-1.162267, -0.3246393, -2.679118, 1, 0.7333333, 0, 1,
-1.158367, 1.192034, -0.320885, 1, 0.7372549, 0, 1,
-1.157023, -0.9692148, -2.124863, 1, 0.7450981, 0, 1,
-1.156497, -0.0861737, -0.4657106, 1, 0.7490196, 0, 1,
-1.148836, 1.303774, -0.0793426, 1, 0.7568628, 0, 1,
-1.133249, -0.8492687, -3.343756, 1, 0.7607843, 0, 1,
-1.133196, 0.4427935, -2.824434, 1, 0.7686275, 0, 1,
-1.129352, -0.4421217, -1.655458, 1, 0.772549, 0, 1,
-1.129062, -0.4246809, -2.182118, 1, 0.7803922, 0, 1,
-1.123942, -1.277062, -2.699609, 1, 0.7843137, 0, 1,
-1.122388, 0.5524613, -2.356947, 1, 0.7921569, 0, 1,
-1.11544, -1.288529, -1.818825, 1, 0.7960784, 0, 1,
-1.114226, -0.4115298, 0.247797, 1, 0.8039216, 0, 1,
-1.112766, -1.183791, -2.423228, 1, 0.8117647, 0, 1,
-1.107437, -2.603046, -3.340908, 1, 0.8156863, 0, 1,
-1.084341, -0.8832272, -2.358211, 1, 0.8235294, 0, 1,
-1.080988, 0.007652503, -2.549278, 1, 0.827451, 0, 1,
-1.077389, 1.023304, 0.6402478, 1, 0.8352941, 0, 1,
-1.076919, -0.1495405, -1.62573, 1, 0.8392157, 0, 1,
-1.073475, -0.3144315, -3.348287, 1, 0.8470588, 0, 1,
-1.07154, 3.121697, 0.1287725, 1, 0.8509804, 0, 1,
-1.069126, -0.2764342, -2.688431, 1, 0.8588235, 0, 1,
-1.060532, -0.5484987, -1.916074, 1, 0.8627451, 0, 1,
-1.055207, 1.032405, -1.302706, 1, 0.8705882, 0, 1,
-1.05346, 1.069218, -1.502019, 1, 0.8745098, 0, 1,
-1.052246, -0.3849005, -1.285893, 1, 0.8823529, 0, 1,
-1.050948, -1.086616, -3.191882, 1, 0.8862745, 0, 1,
-1.039243, -0.6902832, -2.337179, 1, 0.8941177, 0, 1,
-1.038501, -0.7701575, -0.7635862, 1, 0.8980392, 0, 1,
-1.033665, 1.546793, -1.268, 1, 0.9058824, 0, 1,
-1.028619, -0.5169094, -2.958606, 1, 0.9137255, 0, 1,
-1.023113, -0.06673322, -1.500989, 1, 0.9176471, 0, 1,
-1.021731, -1.173238, -4.858911, 1, 0.9254902, 0, 1,
-1.01898, 1.34854, -1.221264, 1, 0.9294118, 0, 1,
-1.014254, 1.848263, -1.515375, 1, 0.9372549, 0, 1,
-1.01196, -1.001338, -0.9753617, 1, 0.9411765, 0, 1,
-1.008005, 0.846776, 0.1104719, 1, 0.9490196, 0, 1,
-1.002099, -1.233992, -1.439529, 1, 0.9529412, 0, 1,
-0.9979706, -0.5516511, -0.9050811, 1, 0.9607843, 0, 1,
-0.997589, 0.651036, -1.661167, 1, 0.9647059, 0, 1,
-0.997284, -0.05347658, -3.108079, 1, 0.972549, 0, 1,
-0.9940914, -1.109653, -1.890949, 1, 0.9764706, 0, 1,
-0.9923064, -0.3438818, -3.245727, 1, 0.9843137, 0, 1,
-0.9891859, 1.008209, -2.375936, 1, 0.9882353, 0, 1,
-0.9827172, 2.033148, -3.060934, 1, 0.9960784, 0, 1,
-0.9769383, -0.695307, -2.167298, 0.9960784, 1, 0, 1,
-0.9754038, -0.4026358, -3.27196, 0.9921569, 1, 0, 1,
-0.9675944, -1.324597, -1.000132, 0.9843137, 1, 0, 1,
-0.9557018, -0.6550492, -2.690759, 0.9803922, 1, 0, 1,
-0.9541129, -1.271201, -3.861034, 0.972549, 1, 0, 1,
-0.9540576, -0.0246286, -2.219253, 0.9686275, 1, 0, 1,
-0.95013, -1.959858, -1.962693, 0.9607843, 1, 0, 1,
-0.9472882, -0.2131963, -1.70581, 0.9568627, 1, 0, 1,
-0.9344611, 0.04932654, -3.027754, 0.9490196, 1, 0, 1,
-0.9326659, -0.2468834, -1.501306, 0.945098, 1, 0, 1,
-0.9280331, 0.603949, -1.342796, 0.9372549, 1, 0, 1,
-0.9256541, 0.5145534, -0.6298633, 0.9333333, 1, 0, 1,
-0.9143009, -0.8149706, -2.254145, 0.9254902, 1, 0, 1,
-0.9140902, 0.4358498, -2.227067, 0.9215686, 1, 0, 1,
-0.9074955, -0.05318234, -1.238955, 0.9137255, 1, 0, 1,
-0.903395, 0.6047057, -1.554235, 0.9098039, 1, 0, 1,
-0.901012, -0.2928434, -0.9301831, 0.9019608, 1, 0, 1,
-0.9007543, -1.083035, -3.803729, 0.8941177, 1, 0, 1,
-0.8958744, -0.5746858, -1.798173, 0.8901961, 1, 0, 1,
-0.8906672, 0.2538594, -1.998515, 0.8823529, 1, 0, 1,
-0.8861485, 1.111358, 0.131696, 0.8784314, 1, 0, 1,
-0.8806479, 1.591216, -2.002973, 0.8705882, 1, 0, 1,
-0.8677058, 0.7625343, -0.1930659, 0.8666667, 1, 0, 1,
-0.8599483, -0.7558577, -3.499815, 0.8588235, 1, 0, 1,
-0.8593155, -0.2244337, -0.4673729, 0.854902, 1, 0, 1,
-0.8560275, -0.4065779, -0.1960103, 0.8470588, 1, 0, 1,
-0.8540586, 2.3231, 0.3598894, 0.8431373, 1, 0, 1,
-0.8518154, 0.03528553, -1.237464, 0.8352941, 1, 0, 1,
-0.8486695, -0.50924, -0.7905378, 0.8313726, 1, 0, 1,
-0.8461802, -0.9541102, -0.9351303, 0.8235294, 1, 0, 1,
-0.8455088, -0.1329241, -1.590958, 0.8196079, 1, 0, 1,
-0.8401121, 0.6362498, -0.5262456, 0.8117647, 1, 0, 1,
-0.8390068, -0.3204398, -2.477453, 0.8078431, 1, 0, 1,
-0.8373504, -0.1047766, -1.549469, 0.8, 1, 0, 1,
-0.8347586, -0.7738622, -2.643421, 0.7921569, 1, 0, 1,
-0.8268025, -1.131481, -1.974123, 0.7882353, 1, 0, 1,
-0.8236006, 0.004647264, -3.865288, 0.7803922, 1, 0, 1,
-0.8233494, -1.479457, -2.475672, 0.7764706, 1, 0, 1,
-0.8221037, 0.3515772, 0.1198568, 0.7686275, 1, 0, 1,
-0.8166739, 0.08766388, -1.735197, 0.7647059, 1, 0, 1,
-0.8153796, -0.4511053, -2.259401, 0.7568628, 1, 0, 1,
-0.8146296, 1.9355, -1.126768, 0.7529412, 1, 0, 1,
-0.8105689, -0.05556897, -1.694398, 0.7450981, 1, 0, 1,
-0.8081843, -0.4359316, -1.598026, 0.7411765, 1, 0, 1,
-0.8079779, 0.1681908, -0.8465363, 0.7333333, 1, 0, 1,
-0.8062326, 0.3947468, -0.645708, 0.7294118, 1, 0, 1,
-0.8045747, -1.159181, -1.050159, 0.7215686, 1, 0, 1,
-0.7995198, -1.752767, -2.108899, 0.7176471, 1, 0, 1,
-0.7937931, 1.072576, -0.07238507, 0.7098039, 1, 0, 1,
-0.7887065, -1.127008, -2.274138, 0.7058824, 1, 0, 1,
-0.7884475, 0.6513768, -0.6526778, 0.6980392, 1, 0, 1,
-0.7870398, -0.23586, -2.000132, 0.6901961, 1, 0, 1,
-0.7865631, -1.352453, -2.947524, 0.6862745, 1, 0, 1,
-0.786386, -0.687283, -0.8430007, 0.6784314, 1, 0, 1,
-0.7788022, 0.6886297, -0.2367207, 0.6745098, 1, 0, 1,
-0.7774917, 1.335038, 0.2563846, 0.6666667, 1, 0, 1,
-0.776137, 0.08786035, 0.4975864, 0.6627451, 1, 0, 1,
-0.7734446, 1.42958, -1.142398, 0.654902, 1, 0, 1,
-0.7714784, 0.4723849, -0.04469744, 0.6509804, 1, 0, 1,
-0.7708061, 0.7433376, -0.9417558, 0.6431373, 1, 0, 1,
-0.7672177, 0.2500624, -1.970719, 0.6392157, 1, 0, 1,
-0.7619431, 0.9573039, -0.03064235, 0.6313726, 1, 0, 1,
-0.7579717, 1.270199, -0.3182765, 0.627451, 1, 0, 1,
-0.7546954, -1.093697, -1.101146, 0.6196079, 1, 0, 1,
-0.750501, -1.151082, -2.109185, 0.6156863, 1, 0, 1,
-0.7501188, -0.1117133, -0.3490274, 0.6078432, 1, 0, 1,
-0.7485594, 0.8520484, -1.704493, 0.6039216, 1, 0, 1,
-0.7481858, -0.5232566, -5.624086, 0.5960785, 1, 0, 1,
-0.7467439, 0.1824623, -1.3917, 0.5882353, 1, 0, 1,
-0.7440594, 0.4611942, -1.742577, 0.5843138, 1, 0, 1,
-0.7431355, 1.374029, -1.612006, 0.5764706, 1, 0, 1,
-0.7416131, -0.07612003, -1.506531, 0.572549, 1, 0, 1,
-0.7371332, -1.289515, -3.099047, 0.5647059, 1, 0, 1,
-0.7360557, 0.1225255, -2.334221, 0.5607843, 1, 0, 1,
-0.7333763, 0.8826336, -0.2810502, 0.5529412, 1, 0, 1,
-0.7293158, -0.09270456, -2.392891, 0.5490196, 1, 0, 1,
-0.721361, 1.186338, -1.110224, 0.5411765, 1, 0, 1,
-0.7213478, 0.4894888, -2.180332, 0.5372549, 1, 0, 1,
-0.7210031, 0.2875812, -2.048749, 0.5294118, 1, 0, 1,
-0.7209938, -1.242256, -3.012769, 0.5254902, 1, 0, 1,
-0.7204894, 0.09728073, -1.931507, 0.5176471, 1, 0, 1,
-0.6997945, -0.2622475, -3.877679, 0.5137255, 1, 0, 1,
-0.6872531, 0.7462687, -0.1746772, 0.5058824, 1, 0, 1,
-0.6794478, -1.476106, -3.306761, 0.5019608, 1, 0, 1,
-0.6758055, 0.190429, -2.961174, 0.4941176, 1, 0, 1,
-0.6745613, -0.4659896, -2.659144, 0.4862745, 1, 0, 1,
-0.6718127, 0.1997636, -2.267092, 0.4823529, 1, 0, 1,
-0.6717143, -1.42113, -2.45553, 0.4745098, 1, 0, 1,
-0.6697111, -0.1457944, -1.311177, 0.4705882, 1, 0, 1,
-0.6650483, 1.468428, -1.324965, 0.4627451, 1, 0, 1,
-0.6594881, -1.119579, -0.1098354, 0.4588235, 1, 0, 1,
-0.6594187, -0.7198009, -1.86097, 0.4509804, 1, 0, 1,
-0.6546991, 2.652593, 0.4034038, 0.4470588, 1, 0, 1,
-0.6526257, -2.145705, -2.478558, 0.4392157, 1, 0, 1,
-0.6477888, 2.101528, 0.4848247, 0.4352941, 1, 0, 1,
-0.6468698, -0.8795853, -3.36614, 0.427451, 1, 0, 1,
-0.6276368, 0.03675484, -1.722814, 0.4235294, 1, 0, 1,
-0.627252, 0.5077777, 0.04055053, 0.4156863, 1, 0, 1,
-0.6248846, -1.318158, -3.66056, 0.4117647, 1, 0, 1,
-0.6222538, -0.5183166, -1.485529, 0.4039216, 1, 0, 1,
-0.6202121, 1.300446, 0.5792085, 0.3960784, 1, 0, 1,
-0.6193803, 2.483166, 3.31343, 0.3921569, 1, 0, 1,
-0.6143902, 0.4884431, 1.221501, 0.3843137, 1, 0, 1,
-0.6136988, -1.846305, -1.67804, 0.3803922, 1, 0, 1,
-0.609382, 0.82485, -0.251991, 0.372549, 1, 0, 1,
-0.6086413, -0.1745794, -2.301021, 0.3686275, 1, 0, 1,
-0.6081845, 1.562614, -0.2764057, 0.3607843, 1, 0, 1,
-0.6017165, -0.5618209, -2.096527, 0.3568628, 1, 0, 1,
-0.6016756, -0.1572755, -0.5860158, 0.3490196, 1, 0, 1,
-0.5969453, 0.4007824, -1.705214, 0.345098, 1, 0, 1,
-0.5963043, -0.288867, -1.325707, 0.3372549, 1, 0, 1,
-0.59399, -0.7866333, -1.698871, 0.3333333, 1, 0, 1,
-0.5905177, -0.5367458, -2.915353, 0.3254902, 1, 0, 1,
-0.5861479, -2.636255, -3.613591, 0.3215686, 1, 0, 1,
-0.5853884, 0.3373708, 0.119948, 0.3137255, 1, 0, 1,
-0.5818844, -0.2516265, 0.046971, 0.3098039, 1, 0, 1,
-0.5684022, 1.43936, 0.633855, 0.3019608, 1, 0, 1,
-0.5627932, -0.3013317, -3.142232, 0.2941177, 1, 0, 1,
-0.557919, -0.4824675, -1.452739, 0.2901961, 1, 0, 1,
-0.5577246, -0.03019939, -0.8748927, 0.282353, 1, 0, 1,
-0.5505573, -0.3987202, -2.787778, 0.2784314, 1, 0, 1,
-0.5446645, 0.000809265, -1.775775, 0.2705882, 1, 0, 1,
-0.5445819, -0.4696666, -4.311475, 0.2666667, 1, 0, 1,
-0.5435159, -0.03380376, 0.6261636, 0.2588235, 1, 0, 1,
-0.5407023, 1.207278, 0.08812167, 0.254902, 1, 0, 1,
-0.5294785, -0.9161353, -3.544483, 0.2470588, 1, 0, 1,
-0.5270754, -0.529003, -3.23127, 0.2431373, 1, 0, 1,
-0.5263195, 0.8236918, 0.5684976, 0.2352941, 1, 0, 1,
-0.5258349, -0.2079873, -0.3682647, 0.2313726, 1, 0, 1,
-0.5222613, -0.2252606, -2.334723, 0.2235294, 1, 0, 1,
-0.5222253, 0.3268802, 0.9649239, 0.2196078, 1, 0, 1,
-0.5199255, -0.925322, -3.578033, 0.2117647, 1, 0, 1,
-0.5196576, -0.5261119, -3.067756, 0.2078431, 1, 0, 1,
-0.5158531, -0.433547, -3.943156, 0.2, 1, 0, 1,
-0.5157012, 0.758778, -0.7503191, 0.1921569, 1, 0, 1,
-0.5129402, -0.4501652, -2.09085, 0.1882353, 1, 0, 1,
-0.5125331, -0.110089, -3.07459, 0.1803922, 1, 0, 1,
-0.4882547, 0.6770496, -0.4581673, 0.1764706, 1, 0, 1,
-0.4880419, 0.4018856, -1.04149, 0.1686275, 1, 0, 1,
-0.4877965, -0.1267191, -1.029314, 0.1647059, 1, 0, 1,
-0.484268, -0.1509495, -3.179358, 0.1568628, 1, 0, 1,
-0.4842074, 0.7332065, -0.9162512, 0.1529412, 1, 0, 1,
-0.4841515, -0.6966066, -3.060131, 0.145098, 1, 0, 1,
-0.4832807, 0.01587289, -0.5874802, 0.1411765, 1, 0, 1,
-0.4826019, 0.2772688, -0.1273359, 0.1333333, 1, 0, 1,
-0.4782744, 0.7998122, -0.3492713, 0.1294118, 1, 0, 1,
-0.4767035, -1.363309, -1.939551, 0.1215686, 1, 0, 1,
-0.4725668, 0.08197363, -2.086926, 0.1176471, 1, 0, 1,
-0.4592284, 0.3251853, -0.792083, 0.1098039, 1, 0, 1,
-0.456209, 0.03000785, -2.643744, 0.1058824, 1, 0, 1,
-0.4546042, 0.1062257, -1.521929, 0.09803922, 1, 0, 1,
-0.4508375, 0.245647, -0.3398064, 0.09019608, 1, 0, 1,
-0.4507561, 1.313863, -2.11345, 0.08627451, 1, 0, 1,
-0.4504386, 2.108149, 1.279722, 0.07843138, 1, 0, 1,
-0.4503415, 0.6038202, -1.074216, 0.07450981, 1, 0, 1,
-0.4461508, -1.284918, -3.053353, 0.06666667, 1, 0, 1,
-0.4427965, -0.5106914, -2.403065, 0.0627451, 1, 0, 1,
-0.4406488, 0.2970974, 0.2252178, 0.05490196, 1, 0, 1,
-0.4372326, -0.9056438, -0.2002189, 0.05098039, 1, 0, 1,
-0.4366091, -0.9411131, -4.116246, 0.04313726, 1, 0, 1,
-0.4340531, 1.277553, -2.597267, 0.03921569, 1, 0, 1,
-0.4294078, 0.4083516, -0.5825142, 0.03137255, 1, 0, 1,
-0.4275699, 0.7424278, 1.253804, 0.02745098, 1, 0, 1,
-0.423663, -0.6842481, -2.871128, 0.01960784, 1, 0, 1,
-0.4222068, 0.594338, -0.02009162, 0.01568628, 1, 0, 1,
-0.4210946, 0.7984146, -1.463438, 0.007843138, 1, 0, 1,
-0.4202293, 0.886602, 1.317831, 0.003921569, 1, 0, 1,
-0.4139158, -1.060747, -3.44515, 0, 1, 0.003921569, 1,
-0.4114755, 0.2637048, 0.1465126, 0, 1, 0.01176471, 1,
-0.4082843, 0.1667164, -2.218553, 0, 1, 0.01568628, 1,
-0.4044695, 0.7480175, -1.635572, 0, 1, 0.02352941, 1,
-0.3858307, 0.1725132, -1.414996, 0, 1, 0.02745098, 1,
-0.3823018, -1.21209, -2.815465, 0, 1, 0.03529412, 1,
-0.3815326, -0.302706, -2.680798, 0, 1, 0.03921569, 1,
-0.3790683, 0.8384621, -1.722731, 0, 1, 0.04705882, 1,
-0.3769465, 0.7062317, -2.417198, 0, 1, 0.05098039, 1,
-0.3736894, 0.395881, -1.169317, 0, 1, 0.05882353, 1,
-0.3736624, -0.2592726, -2.33339, 0, 1, 0.0627451, 1,
-0.3720471, -1.693946, -2.782938, 0, 1, 0.07058824, 1,
-0.3719195, -1.782829, -4.039398, 0, 1, 0.07450981, 1,
-0.3716512, 0.6752811, -0.023236, 0, 1, 0.08235294, 1,
-0.3711724, 1.060611, -0.327141, 0, 1, 0.08627451, 1,
-0.3666087, 0.3558981, -0.2180465, 0, 1, 0.09411765, 1,
-0.3564577, 1.357801, 0.5507097, 0, 1, 0.1019608, 1,
-0.3542387, 0.8126492, -1.493051, 0, 1, 0.1058824, 1,
-0.3538315, 0.5104361, 0.09928098, 0, 1, 0.1137255, 1,
-0.3532414, 1.472384, -1.560908, 0, 1, 0.1176471, 1,
-0.3528727, 0.01676491, -1.938201, 0, 1, 0.1254902, 1,
-0.3498812, 0.2016679, -1.419785, 0, 1, 0.1294118, 1,
-0.347887, -0.09594059, -1.419595, 0, 1, 0.1372549, 1,
-0.3440415, 1.557418, 0.5575347, 0, 1, 0.1411765, 1,
-0.3373896, 1.046437, 0.4396603, 0, 1, 0.1490196, 1,
-0.336979, 0.8503049, 0.63798, 0, 1, 0.1529412, 1,
-0.3320623, -0.6447843, -2.637834, 0, 1, 0.1607843, 1,
-0.3310342, 0.9532912, -0.7921141, 0, 1, 0.1647059, 1,
-0.3282171, -0.7240362, -4.871681, 0, 1, 0.172549, 1,
-0.3247163, -0.1318276, -1.853567, 0, 1, 0.1764706, 1,
-0.3224795, -0.7589565, -3.008934, 0, 1, 0.1843137, 1,
-0.3206169, 0.660694, 0.2613344, 0, 1, 0.1882353, 1,
-0.3192822, 0.7383898, -0.3265094, 0, 1, 0.1960784, 1,
-0.3168027, 1.534691, 0.9290648, 0, 1, 0.2039216, 1,
-0.3150156, -1.826809, -2.507261, 0, 1, 0.2078431, 1,
-0.3143542, -0.3186619, -1.313154, 0, 1, 0.2156863, 1,
-0.3084697, -0.07252848, -0.722818, 0, 1, 0.2196078, 1,
-0.3082783, -0.9285246, -2.63978, 0, 1, 0.227451, 1,
-0.3058029, -0.4597409, -1.762228, 0, 1, 0.2313726, 1,
-0.3026661, 0.6745251, 0.1019628, 0, 1, 0.2392157, 1,
-0.3023234, -0.2398643, -3.461781, 0, 1, 0.2431373, 1,
-0.3014554, -1.755093, -2.639606, 0, 1, 0.2509804, 1,
-0.2989431, 0.08418425, -0.6626055, 0, 1, 0.254902, 1,
-0.2985632, 0.502968, -0.4747208, 0, 1, 0.2627451, 1,
-0.2945293, -1.042611, -3.19182, 0, 1, 0.2666667, 1,
-0.2940804, 0.3930496, 0.1791492, 0, 1, 0.2745098, 1,
-0.2896874, -1.003075, -2.550843, 0, 1, 0.2784314, 1,
-0.288982, -0.08014195, 0.9409282, 0, 1, 0.2862745, 1,
-0.2884263, 1.677039, -0.8549345, 0, 1, 0.2901961, 1,
-0.2876892, 0.9017881, 0.942589, 0, 1, 0.2980392, 1,
-0.2863869, -0.5734999, -3.129699, 0, 1, 0.3058824, 1,
-0.2862157, 1.510138, 0.9092762, 0, 1, 0.3098039, 1,
-0.2852827, 0.9053118, 0.431544, 0, 1, 0.3176471, 1,
-0.2845357, -0.8116671, -4.242524, 0, 1, 0.3215686, 1,
-0.2835232, -0.389642, -2.740034, 0, 1, 0.3294118, 1,
-0.2808551, -0.9406294, -3.105787, 0, 1, 0.3333333, 1,
-0.2783285, -0.3789565, -2.312732, 0, 1, 0.3411765, 1,
-0.2776811, 0.1673478, -0.6800725, 0, 1, 0.345098, 1,
-0.2773738, 1.129799, -1.072051, 0, 1, 0.3529412, 1,
-0.2768478, -1.24534, -1.696354, 0, 1, 0.3568628, 1,
-0.2764954, 1.7658, -0.07632955, 0, 1, 0.3647059, 1,
-0.2752725, 0.3206204, -1.107616, 0, 1, 0.3686275, 1,
-0.2726433, 0.6981714, -1.408621, 0, 1, 0.3764706, 1,
-0.2693571, -0.5135289, -1.244992, 0, 1, 0.3803922, 1,
-0.266771, 1.332265, 0.3462575, 0, 1, 0.3882353, 1,
-0.2636178, -0.8688712, -2.336684, 0, 1, 0.3921569, 1,
-0.2626596, 0.2567842, -1.718513, 0, 1, 0.4, 1,
-0.2546194, -1.026346, -4.399807, 0, 1, 0.4078431, 1,
-0.2522648, 0.5163178, -1.272779, 0, 1, 0.4117647, 1,
-0.2479209, -1.662376, -2.957633, 0, 1, 0.4196078, 1,
-0.247687, 1.405442, 0.3671656, 0, 1, 0.4235294, 1,
-0.2466289, 1.380535, -1.418157, 0, 1, 0.4313726, 1,
-0.2363605, 0.3676508, 1.046367, 0, 1, 0.4352941, 1,
-0.2332576, -0.07194123, -1.588912, 0, 1, 0.4431373, 1,
-0.2317646, -0.4147958, -3.075931, 0, 1, 0.4470588, 1,
-0.2277782, 0.5808133, -0.9386349, 0, 1, 0.454902, 1,
-0.2271601, 0.3353252, -0.7532609, 0, 1, 0.4588235, 1,
-0.222316, -0.6714953, -2.261868, 0, 1, 0.4666667, 1,
-0.219908, 0.5985356, -0.4013222, 0, 1, 0.4705882, 1,
-0.2138533, 0.872567, -1.48175, 0, 1, 0.4784314, 1,
-0.2133563, 1.625149, 0.3105116, 0, 1, 0.4823529, 1,
-0.2085034, -0.6098791, -2.945273, 0, 1, 0.4901961, 1,
-0.2034107, -0.7990681, -4.632903, 0, 1, 0.4941176, 1,
-0.2003052, 1.963535, 0.2698845, 0, 1, 0.5019608, 1,
-0.1990623, 0.4831168, -2.04595, 0, 1, 0.509804, 1,
-0.1945614, -0.816825, -3.096544, 0, 1, 0.5137255, 1,
-0.1944994, -0.1033962, -1.863629, 0, 1, 0.5215687, 1,
-0.1929283, -0.3020015, -2.376219, 0, 1, 0.5254902, 1,
-0.1875535, -0.6355205, -3.301775, 0, 1, 0.5333334, 1,
-0.1852034, -0.3193538, -3.244655, 0, 1, 0.5372549, 1,
-0.1848801, 1.164178, -1.426371, 0, 1, 0.5450981, 1,
-0.1826091, 0.6039158, 2.139994, 0, 1, 0.5490196, 1,
-0.1810096, 1.208934, -0.999892, 0, 1, 0.5568628, 1,
-0.1799942, -1.659392, -1.189641, 0, 1, 0.5607843, 1,
-0.1793278, 0.06281029, -1.403031, 0, 1, 0.5686275, 1,
-0.1747466, -1.550365, -2.54595, 0, 1, 0.572549, 1,
-0.1743094, -0.4077148, -3.229664, 0, 1, 0.5803922, 1,
-0.1727801, -0.6105204, -1.516708, 0, 1, 0.5843138, 1,
-0.1688944, 1.497547, 0.1351384, 0, 1, 0.5921569, 1,
-0.166079, -0.03639362, -0.7167494, 0, 1, 0.5960785, 1,
-0.1655616, 0.8207569, -1.385271, 0, 1, 0.6039216, 1,
-0.1632018, 0.8523613, -2.942513, 0, 1, 0.6117647, 1,
-0.1593235, -0.3161719, -2.125796, 0, 1, 0.6156863, 1,
-0.1568844, -0.5315638, -1.142865, 0, 1, 0.6235294, 1,
-0.1565484, 0.4836911, -1.123914, 0, 1, 0.627451, 1,
-0.1561829, -0.5111593, -3.378137, 0, 1, 0.6352941, 1,
-0.15545, -1.602934, -2.183507, 0, 1, 0.6392157, 1,
-0.155263, 0.1623169, -0.902489, 0, 1, 0.6470588, 1,
-0.150575, -0.3881253, -1.357019, 0, 1, 0.6509804, 1,
-0.1463436, -0.8194694, -3.81653, 0, 1, 0.6588235, 1,
-0.1340091, -1.054678, -2.632675, 0, 1, 0.6627451, 1,
-0.1328104, -0.6580818, -4.348345, 0, 1, 0.6705883, 1,
-0.131182, 0.05389651, -1.24171, 0, 1, 0.6745098, 1,
-0.1251338, -1.980296, -3.579827, 0, 1, 0.682353, 1,
-0.1147164, 0.2209458, -2.678956, 0, 1, 0.6862745, 1,
-0.1085502, 0.1405023, 0.9535373, 0, 1, 0.6941177, 1,
-0.1048415, 0.5016727, -0.7198229, 0, 1, 0.7019608, 1,
-0.104479, 0.9244748, 0.4171048, 0, 1, 0.7058824, 1,
-0.1038828, -2.19243, -4.513011, 0, 1, 0.7137255, 1,
-0.1021695, -0.9360035, -2.516142, 0, 1, 0.7176471, 1,
-0.1016365, -1.249344, -3.771971, 0, 1, 0.7254902, 1,
-0.1007942, -1.876506, -5.417287, 0, 1, 0.7294118, 1,
-0.1006888, 0.119035, -0.3702419, 0, 1, 0.7372549, 1,
-0.1001845, 0.389421, 0.3322871, 0, 1, 0.7411765, 1,
-0.08341821, 0.5404229, -1.417169, 0, 1, 0.7490196, 1,
-0.08099742, -0.9049916, -1.578598, 0, 1, 0.7529412, 1,
-0.08008572, 0.08391363, 0.3598365, 0, 1, 0.7607843, 1,
-0.07891159, -0.01868282, -2.21928, 0, 1, 0.7647059, 1,
-0.07032192, -1.011196, -3.750564, 0, 1, 0.772549, 1,
-0.06902784, 0.4838219, -0.8314474, 0, 1, 0.7764706, 1,
-0.06582439, -0.05985597, -2.796185, 0, 1, 0.7843137, 1,
-0.06353109, 0.3955442, 1.501436, 0, 1, 0.7882353, 1,
-0.06288832, 1.510536, 0.3323254, 0, 1, 0.7960784, 1,
-0.06271157, 0.8110614, -0.6181899, 0, 1, 0.8039216, 1,
-0.06266075, -1.589071, -1.501499, 0, 1, 0.8078431, 1,
-0.06229865, 1.086153, 0.1001998, 0, 1, 0.8156863, 1,
-0.05879374, 0.2550173, -1.311777, 0, 1, 0.8196079, 1,
-0.05043942, 0.3195969, 0.47069, 0, 1, 0.827451, 1,
-0.05020061, -2.693877, -3.625758, 0, 1, 0.8313726, 1,
-0.04630329, -1.260622, -2.756365, 0, 1, 0.8392157, 1,
-0.04623181, -1.682002, -4.840354, 0, 1, 0.8431373, 1,
-0.04618103, 1.410017, 0.6969051, 0, 1, 0.8509804, 1,
-0.04512328, -0.7656875, -3.165175, 0, 1, 0.854902, 1,
-0.04347663, 0.6553844, -0.06433238, 0, 1, 0.8627451, 1,
-0.03738556, -1.376488, -1.583874, 0, 1, 0.8666667, 1,
-0.03571203, -0.1088276, -2.896966, 0, 1, 0.8745098, 1,
-0.03523571, 0.2803421, 1.064056, 0, 1, 0.8784314, 1,
-0.03031147, 0.3144293, 0.9195292, 0, 1, 0.8862745, 1,
-0.03015598, 1.05128, -1.858421, 0, 1, 0.8901961, 1,
-0.02984598, -1.11647, -3.737341, 0, 1, 0.8980392, 1,
-0.02950555, 0.0927753, -1.117929, 0, 1, 0.9058824, 1,
-0.02449227, 1.206428, -0.6956005, 0, 1, 0.9098039, 1,
-0.01691123, 0.2016887, 1.554304, 0, 1, 0.9176471, 1,
-0.01476288, -0.7665129, -3.492595, 0, 1, 0.9215686, 1,
-0.01311496, -0.2662777, -3.37815, 0, 1, 0.9294118, 1,
-0.01064125, -0.9294983, -3.615527, 0, 1, 0.9333333, 1,
-0.009396092, 0.561204, 1.671316, 0, 1, 0.9411765, 1,
-0.007386416, 0.3328896, -1.476249, 0, 1, 0.945098, 1,
-0.007307224, 1.355939, -1.569571, 0, 1, 0.9529412, 1,
0.00105164, 1.920865, -2.215763, 0, 1, 0.9568627, 1,
0.001840315, 0.3328595, -0.235355, 0, 1, 0.9647059, 1,
0.008485728, 0.4851872, -0.9733995, 0, 1, 0.9686275, 1,
0.01188486, 1.477709, -1.29093, 0, 1, 0.9764706, 1,
0.012713, 1.075069, 0.4956491, 0, 1, 0.9803922, 1,
0.01582516, -0.2091299, 2.981441, 0, 1, 0.9882353, 1,
0.01631698, 0.7059126, -0.1624854, 0, 1, 0.9921569, 1,
0.01674242, 0.5769971, 1.153709, 0, 1, 1, 1,
0.01676071, 1.595877, -0.1263592, 0, 0.9921569, 1, 1,
0.01678361, 0.1624663, -1.323419, 0, 0.9882353, 1, 1,
0.01688415, 0.019698, -0.2824253, 0, 0.9803922, 1, 1,
0.0177934, -0.3931257, 5.165222, 0, 0.9764706, 1, 1,
0.01861016, 0.3076179, -0.06314881, 0, 0.9686275, 1, 1,
0.01911206, 0.8738185, 0.2874762, 0, 0.9647059, 1, 1,
0.03234355, -1.656405, 3.810183, 0, 0.9568627, 1, 1,
0.03721712, -1.279416, 2.199982, 0, 0.9529412, 1, 1,
0.03784449, 0.9267489, 0.4312632, 0, 0.945098, 1, 1,
0.04029, 2.778634, -0.3940156, 0, 0.9411765, 1, 1,
0.04123923, 0.5805405, 0.0949564, 0, 0.9333333, 1, 1,
0.04382108, -0.2006648, 5.728151, 0, 0.9294118, 1, 1,
0.04621146, -0.9352209, 1.722068, 0, 0.9215686, 1, 1,
0.04853775, 0.7445579, 0.4921515, 0, 0.9176471, 1, 1,
0.05016318, 1.638963, -0.03433426, 0, 0.9098039, 1, 1,
0.05114061, -0.1047423, 3.943493, 0, 0.9058824, 1, 1,
0.05204059, 0.2286033, 0.5056903, 0, 0.8980392, 1, 1,
0.0541257, -0.007681389, 1.601774, 0, 0.8901961, 1, 1,
0.05463959, 1.144891, 1.726041, 0, 0.8862745, 1, 1,
0.05775303, 0.3531592, 0.26397, 0, 0.8784314, 1, 1,
0.05945038, 0.03480936, 0.7418618, 0, 0.8745098, 1, 1,
0.07180989, -0.483328, 3.064202, 0, 0.8666667, 1, 1,
0.07452178, -0.2678834, 1.278956, 0, 0.8627451, 1, 1,
0.07821704, 0.02065267, 2.157585, 0, 0.854902, 1, 1,
0.07825882, 0.5586038, -0.05288476, 0, 0.8509804, 1, 1,
0.07842143, 1.125549, 0.2347491, 0, 0.8431373, 1, 1,
0.07930825, 0.3274166, 0.3263781, 0, 0.8392157, 1, 1,
0.07982252, -0.4654972, 3.489446, 0, 0.8313726, 1, 1,
0.08109167, 0.03574371, 1.464853, 0, 0.827451, 1, 1,
0.08873549, -0.7879531, 2.739568, 0, 0.8196079, 1, 1,
0.08964685, -0.3581277, 1.191787, 0, 0.8156863, 1, 1,
0.09000792, 1.280522, -0.1908218, 0, 0.8078431, 1, 1,
0.0912099, 0.667052, 0.1064827, 0, 0.8039216, 1, 1,
0.09193192, -0.896993, 4.716643, 0, 0.7960784, 1, 1,
0.09209636, -0.9905906, 3.736322, 0, 0.7882353, 1, 1,
0.09700959, -1.064531, 2.096374, 0, 0.7843137, 1, 1,
0.1016693, -0.38924, 3.117096, 0, 0.7764706, 1, 1,
0.1051338, -0.06748334, 3.173707, 0, 0.772549, 1, 1,
0.1097095, 1.251852, 0.2263053, 0, 0.7647059, 1, 1,
0.1100128, 0.6052595, -0.5585316, 0, 0.7607843, 1, 1,
0.1108224, 0.9248285, -1.059633, 0, 0.7529412, 1, 1,
0.112175, -1.234284, 2.25881, 0, 0.7490196, 1, 1,
0.1128279, -1.153455, 3.783538, 0, 0.7411765, 1, 1,
0.1141868, -2.333079, 3.351773, 0, 0.7372549, 1, 1,
0.1169566, -1.724693, 4.158785, 0, 0.7294118, 1, 1,
0.1222058, -0.9478229, 1.010488, 0, 0.7254902, 1, 1,
0.1234614, -0.1419124, 2.766319, 0, 0.7176471, 1, 1,
0.1306598, -0.5642686, 2.452927, 0, 0.7137255, 1, 1,
0.1316106, -1.096233, 2.16384, 0, 0.7058824, 1, 1,
0.1331114, -0.1579484, 0.7419974, 0, 0.6980392, 1, 1,
0.1335967, 0.8151823, 0.4412591, 0, 0.6941177, 1, 1,
0.1345338, 1.629028, -0.5317789, 0, 0.6862745, 1, 1,
0.1357429, -0.9663364, 3.069435, 0, 0.682353, 1, 1,
0.1412586, -1.641473, 3.066261, 0, 0.6745098, 1, 1,
0.1445362, 1.404217, 0.4871807, 0, 0.6705883, 1, 1,
0.1475102, -1.043068, 3.760675, 0, 0.6627451, 1, 1,
0.1482145, -0.8587989, 2.636246, 0, 0.6588235, 1, 1,
0.1604644, 0.8662844, 0.9637236, 0, 0.6509804, 1, 1,
0.1614887, -0.9869002, 3.904071, 0, 0.6470588, 1, 1,
0.1615794, -1.894584, 3.904273, 0, 0.6392157, 1, 1,
0.1642035, 0.2700881, 2.092632, 0, 0.6352941, 1, 1,
0.164225, 1.110585, -0.148023, 0, 0.627451, 1, 1,
0.1642324, -0.4768352, 2.180143, 0, 0.6235294, 1, 1,
0.1674041, 1.412826, 0.806482, 0, 0.6156863, 1, 1,
0.1675086, -0.06447224, 2.011516, 0, 0.6117647, 1, 1,
0.1676648, 0.2376704, -0.2972448, 0, 0.6039216, 1, 1,
0.1721143, -0.02418629, 2.342308, 0, 0.5960785, 1, 1,
0.181058, -1.684542, 1.711131, 0, 0.5921569, 1, 1,
0.1814165, 1.06347, -1.72419, 0, 0.5843138, 1, 1,
0.1872528, 0.3659883, 0.9706082, 0, 0.5803922, 1, 1,
0.1875408, -0.1575909, 3.169554, 0, 0.572549, 1, 1,
0.1890667, 2.169166, -0.2065, 0, 0.5686275, 1, 1,
0.1928903, 1.985358, 0.7234365, 0, 0.5607843, 1, 1,
0.1983091, 0.792226, -0.2271295, 0, 0.5568628, 1, 1,
0.2017666, 0.4427999, 0.8592509, 0, 0.5490196, 1, 1,
0.2041261, -0.4856825, 3.482263, 0, 0.5450981, 1, 1,
0.2073119, -2.257987, 3.101672, 0, 0.5372549, 1, 1,
0.2165234, 0.5074869, 2.314091, 0, 0.5333334, 1, 1,
0.217341, 0.8588354, -1.654889, 0, 0.5254902, 1, 1,
0.2186986, -0.3551408, 4.778129, 0, 0.5215687, 1, 1,
0.2199233, 1.171814, 0.3241262, 0, 0.5137255, 1, 1,
0.2201644, -0.05817673, 2.092518, 0, 0.509804, 1, 1,
0.224689, -0.424949, 3.83037, 0, 0.5019608, 1, 1,
0.2249103, 0.3497339, -0.2643555, 0, 0.4941176, 1, 1,
0.2262532, -0.7809728, 2.606522, 0, 0.4901961, 1, 1,
0.2275446, -1.302452, 4.710492, 0, 0.4823529, 1, 1,
0.2311892, -1.11731, 2.150505, 0, 0.4784314, 1, 1,
0.2320079, -0.01970868, 0.7580222, 0, 0.4705882, 1, 1,
0.2320441, 0.03381416, 2.00789, 0, 0.4666667, 1, 1,
0.2332943, 0.4550197, -1.405469, 0, 0.4588235, 1, 1,
0.2355016, 1.688244, 0.8591642, 0, 0.454902, 1, 1,
0.2355278, -1.08948, 3.477341, 0, 0.4470588, 1, 1,
0.2384419, 0.3075214, 1.273184, 0, 0.4431373, 1, 1,
0.2387716, -0.9218918, 3.106406, 0, 0.4352941, 1, 1,
0.2396892, 1.882855, 1.299507, 0, 0.4313726, 1, 1,
0.2411294, -2.667403, 3.349116, 0, 0.4235294, 1, 1,
0.241883, 2.652354, 1.056588, 0, 0.4196078, 1, 1,
0.2421103, -0.3999942, 3.772304, 0, 0.4117647, 1, 1,
0.2426611, -0.94946, 1.716567, 0, 0.4078431, 1, 1,
0.2449154, -1.507489, 2.322217, 0, 0.4, 1, 1,
0.2457271, 0.6331632, -0.3316959, 0, 0.3921569, 1, 1,
0.2486987, 0.4128711, 2.803989, 0, 0.3882353, 1, 1,
0.2493787, 0.4255069, 1.333965, 0, 0.3803922, 1, 1,
0.2522033, 0.05772317, 3.046513, 0, 0.3764706, 1, 1,
0.2524282, 0.4384356, -1.032519, 0, 0.3686275, 1, 1,
0.2611097, -0.4904838, 2.779331, 0, 0.3647059, 1, 1,
0.2648282, 1.690662, 0.100688, 0, 0.3568628, 1, 1,
0.2661434, -0.2153371, 2.532537, 0, 0.3529412, 1, 1,
0.2701964, 1.138981, 1.286087, 0, 0.345098, 1, 1,
0.2708893, -0.412584, 1.266879, 0, 0.3411765, 1, 1,
0.2716326, -1.453218, 2.556956, 0, 0.3333333, 1, 1,
0.271638, -1.483072, 1.692867, 0, 0.3294118, 1, 1,
0.2729962, 0.8368766, -0.570549, 0, 0.3215686, 1, 1,
0.2731339, 0.1648261, 2.201604, 0, 0.3176471, 1, 1,
0.2766552, 0.6860732, 2.306226, 0, 0.3098039, 1, 1,
0.2775442, 0.1231625, 2.204972, 0, 0.3058824, 1, 1,
0.2821257, -0.5244318, 3.85067, 0, 0.2980392, 1, 1,
0.2826921, -0.1758977, 3.025214, 0, 0.2901961, 1, 1,
0.2838573, 0.7374009, 2.190272, 0, 0.2862745, 1, 1,
0.2849854, 3.383652, 0.6590685, 0, 0.2784314, 1, 1,
0.2850297, -0.5400993, 0.7018748, 0, 0.2745098, 1, 1,
0.2869392, -0.429273, 3.13816, 0, 0.2666667, 1, 1,
0.2949222, 1.682357, -1.622544, 0, 0.2627451, 1, 1,
0.3055398, 0.3979872, 1.099239, 0, 0.254902, 1, 1,
0.3057894, -0.9895769, 3.579896, 0, 0.2509804, 1, 1,
0.3076252, -0.195613, 0.2116196, 0, 0.2431373, 1, 1,
0.3127911, 0.136253, 0.4785471, 0, 0.2392157, 1, 1,
0.3144647, -0.003197909, 2.020184, 0, 0.2313726, 1, 1,
0.3161075, 0.01679518, 3.272219, 0, 0.227451, 1, 1,
0.3208773, 0.3992177, -0.330005, 0, 0.2196078, 1, 1,
0.3263653, -2.769257, 3.914285, 0, 0.2156863, 1, 1,
0.3309605, -1.601855, 3.156661, 0, 0.2078431, 1, 1,
0.3323756, 0.9453236, 2.16562, 0, 0.2039216, 1, 1,
0.3327382, 0.5737614, 1.107208, 0, 0.1960784, 1, 1,
0.3331267, 0.5938163, 1.591449, 0, 0.1882353, 1, 1,
0.3352888, 2.217478, -0.1048851, 0, 0.1843137, 1, 1,
0.3368112, 0.1636916, 0.9708806, 0, 0.1764706, 1, 1,
0.3419246, -1.356272, 3.314721, 0, 0.172549, 1, 1,
0.3422812, 0.5709598, 1.222361, 0, 0.1647059, 1, 1,
0.3425683, 0.9104349, -1.735136, 0, 0.1607843, 1, 1,
0.3435258, 1.808565, 0.02694668, 0, 0.1529412, 1, 1,
0.3464362, -1.398906, 2.683382, 0, 0.1490196, 1, 1,
0.3474994, -0.66239, 1.083556, 0, 0.1411765, 1, 1,
0.3487483, -0.01325251, 0.6813474, 0, 0.1372549, 1, 1,
0.3602992, -0.51153, 2.668133, 0, 0.1294118, 1, 1,
0.3706206, -1.261848, 4.33267, 0, 0.1254902, 1, 1,
0.3769941, 1.417404, -0.01124621, 0, 0.1176471, 1, 1,
0.3782391, 0.01241907, 0.4439265, 0, 0.1137255, 1, 1,
0.3798226, -0.2539515, 2.600854, 0, 0.1058824, 1, 1,
0.3802462, 1.49316, 0.419448, 0, 0.09803922, 1, 1,
0.3803181, -0.4237025, 2.121359, 0, 0.09411765, 1, 1,
0.3835876, -0.2294597, 3.273466, 0, 0.08627451, 1, 1,
0.3847004, 0.1200053, 1.184276, 0, 0.08235294, 1, 1,
0.3857059, -0.346722, 2.314931, 0, 0.07450981, 1, 1,
0.3858677, 1.358649, -0.5489522, 0, 0.07058824, 1, 1,
0.3864935, -0.9845695, 2.323674, 0, 0.0627451, 1, 1,
0.3898901, 0.3579632, 1.381376, 0, 0.05882353, 1, 1,
0.3958324, -0.2845728, 3.022534, 0, 0.05098039, 1, 1,
0.3989357, 1.852747, 0.4404233, 0, 0.04705882, 1, 1,
0.3996239, -0.3951678, 2.486928, 0, 0.03921569, 1, 1,
0.4048121, 0.02746876, 2.176066, 0, 0.03529412, 1, 1,
0.4117376, 0.8055462, -0.6941676, 0, 0.02745098, 1, 1,
0.4214801, -1.779423, 3.733244, 0, 0.02352941, 1, 1,
0.4332907, -0.3604436, 0.4336143, 0, 0.01568628, 1, 1,
0.4340074, 0.1424561, 1.062638, 0, 0.01176471, 1, 1,
0.4386795, -2.297214, 1.874028, 0, 0.003921569, 1, 1,
0.45037, -0.7118917, 1.159075, 0.003921569, 0, 1, 1,
0.4504491, -0.04169497, 1.993901, 0.007843138, 0, 1, 1,
0.4504685, 0.1571543, -1.190275, 0.01568628, 0, 1, 1,
0.4539922, -0.05131626, 1.853647, 0.01960784, 0, 1, 1,
0.4548518, 1.282915, -1.292386, 0.02745098, 0, 1, 1,
0.4550047, -1.897562, 1.241183, 0.03137255, 0, 1, 1,
0.4550885, -0.9665148, 1.543701, 0.03921569, 0, 1, 1,
0.4580271, 0.3052568, 0.590386, 0.04313726, 0, 1, 1,
0.4587305, 0.1622665, 0.8418213, 0.05098039, 0, 1, 1,
0.4592761, 1.442853, 0.05101105, 0.05490196, 0, 1, 1,
0.4603941, -0.001860813, -0.0413081, 0.0627451, 0, 1, 1,
0.4609122, -1.221716, 2.999362, 0.06666667, 0, 1, 1,
0.4611471, -0.04419984, 2.464624, 0.07450981, 0, 1, 1,
0.467114, -0.4362097, 2.888412, 0.07843138, 0, 1, 1,
0.4689879, -0.1996938, 4.10991, 0.08627451, 0, 1, 1,
0.4705882, 0.7397617, 0.8322883, 0.09019608, 0, 1, 1,
0.4829151, -1.210214, 2.748714, 0.09803922, 0, 1, 1,
0.4858638, 0.02619949, 1.030836, 0.1058824, 0, 1, 1,
0.4882023, -1.583212, 4.054811, 0.1098039, 0, 1, 1,
0.4943757, -2.405227, 2.848968, 0.1176471, 0, 1, 1,
0.4987117, 0.1169973, 0.9680012, 0.1215686, 0, 1, 1,
0.5004263, 0.6396026, 0.616771, 0.1294118, 0, 1, 1,
0.5034386, 0.09673391, 0.9819764, 0.1333333, 0, 1, 1,
0.5065713, 0.3869984, 0.4271112, 0.1411765, 0, 1, 1,
0.5105454, 0.6215872, 0.4564877, 0.145098, 0, 1, 1,
0.5127546, -0.4024741, 1.877325, 0.1529412, 0, 1, 1,
0.5144778, -0.7027316, 2.064478, 0.1568628, 0, 1, 1,
0.5160519, -0.993365, 3.861994, 0.1647059, 0, 1, 1,
0.5166546, -0.698405, -0.7947201, 0.1686275, 0, 1, 1,
0.5167138, -0.5890135, 3.101527, 0.1764706, 0, 1, 1,
0.5193741, -0.177835, 2.144978, 0.1803922, 0, 1, 1,
0.5198896, -1.169267, 3.768913, 0.1882353, 0, 1, 1,
0.5205937, 0.4328725, 0.2541246, 0.1921569, 0, 1, 1,
0.5237038, 0.1162676, 0.9148685, 0.2, 0, 1, 1,
0.5266914, 2.016946, -0.5315174, 0.2078431, 0, 1, 1,
0.5286586, 1.287081, 0.1865503, 0.2117647, 0, 1, 1,
0.5428033, 0.02013959, 0.7374386, 0.2196078, 0, 1, 1,
0.5451916, -0.477987, 2.899802, 0.2235294, 0, 1, 1,
0.5454179, 1.185384, 2.100624, 0.2313726, 0, 1, 1,
0.5474786, 1.144892, -0.2074811, 0.2352941, 0, 1, 1,
0.5524879, 1.267844, 1.15296, 0.2431373, 0, 1, 1,
0.5575389, -0.8763702, 1.316568, 0.2470588, 0, 1, 1,
0.5588467, 1.000494, -0.3486666, 0.254902, 0, 1, 1,
0.5603085, -2.856021, 1.519092, 0.2588235, 0, 1, 1,
0.5625064, -1.898495, 1.976641, 0.2666667, 0, 1, 1,
0.5660485, 1.349488, -0.7338017, 0.2705882, 0, 1, 1,
0.5682843, -1.543025, 2.794053, 0.2784314, 0, 1, 1,
0.5700374, -0.256099, 1.731084, 0.282353, 0, 1, 1,
0.5770774, 1.004139, -0.5863416, 0.2901961, 0, 1, 1,
0.5797747, -0.456499, 1.394784, 0.2941177, 0, 1, 1,
0.5818725, -0.4759715, 3.393969, 0.3019608, 0, 1, 1,
0.5839044, -0.6990877, 3.323024, 0.3098039, 0, 1, 1,
0.5850884, -1.015129, 1.60419, 0.3137255, 0, 1, 1,
0.5853343, -1.286419, 3.248279, 0.3215686, 0, 1, 1,
0.5866229, -0.5944467, 3.188693, 0.3254902, 0, 1, 1,
0.5912424, -0.6361105, 2.215786, 0.3333333, 0, 1, 1,
0.5952556, -0.6193487, 4.016206, 0.3372549, 0, 1, 1,
0.6092805, 0.2831475, 2.295093, 0.345098, 0, 1, 1,
0.6121021, -0.456482, 2.920026, 0.3490196, 0, 1, 1,
0.6122738, 0.255538, 0.03283037, 0.3568628, 0, 1, 1,
0.6158974, -0.6351914, 1.947016, 0.3607843, 0, 1, 1,
0.6192962, -0.8720052, 3.121243, 0.3686275, 0, 1, 1,
0.619302, -0.05677714, 1.190965, 0.372549, 0, 1, 1,
0.6195102, -0.8608279, 1.754945, 0.3803922, 0, 1, 1,
0.6198251, -1.245035, 3.130872, 0.3843137, 0, 1, 1,
0.6204244, -0.4627878, 2.921297, 0.3921569, 0, 1, 1,
0.6269092, -0.7575372, 3.678762, 0.3960784, 0, 1, 1,
0.6282211, 1.83245, -0.6698186, 0.4039216, 0, 1, 1,
0.6294203, -0.2833228, 1.466854, 0.4117647, 0, 1, 1,
0.6335234, 0.3172647, 1.198684, 0.4156863, 0, 1, 1,
0.6365119, -1.24935, 4.376938, 0.4235294, 0, 1, 1,
0.6417172, -0.6452096, 0.3722869, 0.427451, 0, 1, 1,
0.6439426, 0.8910972, 0.1339389, 0.4352941, 0, 1, 1,
0.6452824, 0.5880383, -0.4970994, 0.4392157, 0, 1, 1,
0.6483753, -0.9770024, 1.630258, 0.4470588, 0, 1, 1,
0.6514098, 1.027477, 0.8422615, 0.4509804, 0, 1, 1,
0.652829, -0.5255787, 2.524989, 0.4588235, 0, 1, 1,
0.6545574, -0.8245001, 3.452371, 0.4627451, 0, 1, 1,
0.6554404, -0.240656, 2.25518, 0.4705882, 0, 1, 1,
0.6555014, -0.8837572, 2.681434, 0.4745098, 0, 1, 1,
0.6638423, -0.9703214, 2.790281, 0.4823529, 0, 1, 1,
0.6648682, -1.382955, 2.733741, 0.4862745, 0, 1, 1,
0.6704229, -0.2889757, 1.759532, 0.4941176, 0, 1, 1,
0.670785, 0.4012849, 1.842481, 0.5019608, 0, 1, 1,
0.6735816, 0.3882201, 0.9518488, 0.5058824, 0, 1, 1,
0.6750503, -0.8750622, 3.348473, 0.5137255, 0, 1, 1,
0.6792586, 0.3454058, 2.860942, 0.5176471, 0, 1, 1,
0.6826299, -0.6456025, 2.803183, 0.5254902, 0, 1, 1,
0.6850457, 1.273703, 0.6630892, 0.5294118, 0, 1, 1,
0.6924994, 1.620345, -0.5735974, 0.5372549, 0, 1, 1,
0.6979487, 0.209874, 0.6236815, 0.5411765, 0, 1, 1,
0.6989489, -0.1960533, 2.478825, 0.5490196, 0, 1, 1,
0.7018028, 0.7950658, 1.374437, 0.5529412, 0, 1, 1,
0.7032967, -0.3838303, 2.428878, 0.5607843, 0, 1, 1,
0.7085236, -2.740764, 4.400294, 0.5647059, 0, 1, 1,
0.7145771, -0.367265, 4.884683, 0.572549, 0, 1, 1,
0.7179295, 0.4884463, 0.5793363, 0.5764706, 0, 1, 1,
0.7236049, 0.08861662, 1.240529, 0.5843138, 0, 1, 1,
0.7237928, 1.311121, 0.1798777, 0.5882353, 0, 1, 1,
0.7257966, 0.07203254, 1.439523, 0.5960785, 0, 1, 1,
0.7269672, -1.596811, 3.615872, 0.6039216, 0, 1, 1,
0.7284228, 0.4681538, 2.719526, 0.6078432, 0, 1, 1,
0.7303823, 0.9386636, 0.2436484, 0.6156863, 0, 1, 1,
0.7325786, 0.5547841, 0.6946981, 0.6196079, 0, 1, 1,
0.7379238, -0.237473, 2.836857, 0.627451, 0, 1, 1,
0.7400072, 0.4094167, 0.9667286, 0.6313726, 0, 1, 1,
0.7409495, -0.549648, 2.264916, 0.6392157, 0, 1, 1,
0.7450202, -1.052178, 2.601326, 0.6431373, 0, 1, 1,
0.762446, 1.953415, -0.2215544, 0.6509804, 0, 1, 1,
0.7641809, 1.484102, -0.7472821, 0.654902, 0, 1, 1,
0.7682749, 0.2066101, 0.9637526, 0.6627451, 0, 1, 1,
0.7699576, -0.2732554, 1.730567, 0.6666667, 0, 1, 1,
0.7715589, -1.726833, 1.937766, 0.6745098, 0, 1, 1,
0.7747046, -1.234421, 1.642041, 0.6784314, 0, 1, 1,
0.775169, -0.9141155, 2.092596, 0.6862745, 0, 1, 1,
0.784044, 0.5406895, 3.114152, 0.6901961, 0, 1, 1,
0.7857628, -0.6919985, 1.577712, 0.6980392, 0, 1, 1,
0.7861009, 0.8460302, 1.509423, 0.7058824, 0, 1, 1,
0.7865039, 0.3471376, 1.066038, 0.7098039, 0, 1, 1,
0.7871814, -0.6764827, 1.600757, 0.7176471, 0, 1, 1,
0.7892315, -0.4331711, 3.290294, 0.7215686, 0, 1, 1,
0.7902903, -1.11865, 1.890594, 0.7294118, 0, 1, 1,
0.7904928, -0.6850203, 2.613427, 0.7333333, 0, 1, 1,
0.7923621, -0.7684512, 1.629185, 0.7411765, 0, 1, 1,
0.7998081, 0.5892436, -0.4456083, 0.7450981, 0, 1, 1,
0.8002226, 0.3208305, 0.3350983, 0.7529412, 0, 1, 1,
0.800354, -0.05701165, 2.46677, 0.7568628, 0, 1, 1,
0.8029513, 1.459988, 1.317419, 0.7647059, 0, 1, 1,
0.8054149, 1.788162, -1.377239, 0.7686275, 0, 1, 1,
0.8068713, -0.3856261, 3.513878, 0.7764706, 0, 1, 1,
0.8078071, -0.8573523, 2.979584, 0.7803922, 0, 1, 1,
0.81231, -0.6360589, 2.530121, 0.7882353, 0, 1, 1,
0.815936, 0.7649242, 0.2188633, 0.7921569, 0, 1, 1,
0.8160751, -1.042041, 1.570463, 0.8, 0, 1, 1,
0.8214581, -0.0544837, 1.50335, 0.8078431, 0, 1, 1,
0.8239977, 0.6496654, 2.044446, 0.8117647, 0, 1, 1,
0.8271824, -0.07434686, 0.9685195, 0.8196079, 0, 1, 1,
0.8462498, -0.497287, 3.433299, 0.8235294, 0, 1, 1,
0.8634795, -1.702644, 2.346601, 0.8313726, 0, 1, 1,
0.866742, -0.713702, 2.792193, 0.8352941, 0, 1, 1,
0.8709074, 0.3833665, 2.169572, 0.8431373, 0, 1, 1,
0.871788, 0.2808443, 1.910996, 0.8470588, 0, 1, 1,
0.8728935, 0.7403339, 1.054265, 0.854902, 0, 1, 1,
0.8738104, 1.369641, 0.1622921, 0.8588235, 0, 1, 1,
0.8782514, 0.3038579, 1.842034, 0.8666667, 0, 1, 1,
0.8815105, 0.1846917, 0.46879, 0.8705882, 0, 1, 1,
0.8825426, 1.100939, 1.097176, 0.8784314, 0, 1, 1,
0.8872637, 0.1584251, 1.970726, 0.8823529, 0, 1, 1,
0.8887808, -0.08171985, 1.958907, 0.8901961, 0, 1, 1,
0.8895028, -0.4816353, 2.610772, 0.8941177, 0, 1, 1,
0.8927893, -0.8886893, 3.155644, 0.9019608, 0, 1, 1,
0.8973098, 1.554571, -0.5317912, 0.9098039, 0, 1, 1,
0.908459, -0.9742776, 3.282772, 0.9137255, 0, 1, 1,
0.9137943, -0.01845884, 2.103536, 0.9215686, 0, 1, 1,
0.9152067, -1.852302, 2.242194, 0.9254902, 0, 1, 1,
0.918916, 0.6602046, -0.9203678, 0.9333333, 0, 1, 1,
0.9263518, -0.3698056, 0.9586686, 0.9372549, 0, 1, 1,
0.9325362, 0.6040043, 1.31946, 0.945098, 0, 1, 1,
0.9373063, 1.402664, 1.460661, 0.9490196, 0, 1, 1,
0.9488682, -0.2899697, 0.724786, 0.9568627, 0, 1, 1,
0.9491098, 1.871307, -0.08494323, 0.9607843, 0, 1, 1,
0.9537168, -2.663573, 3.505564, 0.9686275, 0, 1, 1,
0.9605366, -0.8182273, 2.940151, 0.972549, 0, 1, 1,
0.9628145, -1.70471, 2.317862, 0.9803922, 0, 1, 1,
0.9658864, 0.07545532, 1.331482, 0.9843137, 0, 1, 1,
0.971516, 0.6463872, 1.765822, 0.9921569, 0, 1, 1,
0.9735756, -1.812562, 2.527682, 0.9960784, 0, 1, 1,
0.977425, 0.6119567, 2.853899, 1, 0, 0.9960784, 1,
0.9926052, -0.4599477, 1.862021, 1, 0, 0.9882353, 1,
0.9941658, -0.3771276, 0.4975183, 1, 0, 0.9843137, 1,
0.9985011, -0.9372623, 2.123148, 1, 0, 0.9764706, 1,
0.9987683, -1.159396, 3.077996, 1, 0, 0.972549, 1,
1.001445, -0.287122, 2.018667, 1, 0, 0.9647059, 1,
1.010473, -0.03262007, 1.415207, 1, 0, 0.9607843, 1,
1.014629, 0.02806593, 1.816616, 1, 0, 0.9529412, 1,
1.015106, -0.1967262, 1.046124, 1, 0, 0.9490196, 1,
1.015223, -2.371273, 3.644729, 1, 0, 0.9411765, 1,
1.016088, 0.9182273, 0.4014125, 1, 0, 0.9372549, 1,
1.019026, -0.8584541, 2.081735, 1, 0, 0.9294118, 1,
1.019345, -0.735948, 2.463738, 1, 0, 0.9254902, 1,
1.024679, -0.2122786, 1.418585, 1, 0, 0.9176471, 1,
1.024783, 0.389602, -0.1375739, 1, 0, 0.9137255, 1,
1.025952, 1.327913, -0.7781689, 1, 0, 0.9058824, 1,
1.026761, -1.256504, 0.9170398, 1, 0, 0.9019608, 1,
1.033642, 1.194021, 0.4879745, 1, 0, 0.8941177, 1,
1.043056, -0.1862442, 1.192136, 1, 0, 0.8862745, 1,
1.060102, -1.04869, 3.070101, 1, 0, 0.8823529, 1,
1.068736, -0.9283727, 1.85636, 1, 0, 0.8745098, 1,
1.069228, -0.5929742, 1.096029, 1, 0, 0.8705882, 1,
1.069467, -0.1757445, 1.781735, 1, 0, 0.8627451, 1,
1.069773, 0.8054559, 2.111043, 1, 0, 0.8588235, 1,
1.073931, -0.4491649, 2.027302, 1, 0, 0.8509804, 1,
1.075464, -0.842865, 0.9874666, 1, 0, 0.8470588, 1,
1.077918, -0.02168695, 0.562889, 1, 0, 0.8392157, 1,
1.087288, 0.1080472, 1.137423, 1, 0, 0.8352941, 1,
1.087815, -1.457243, 2.02477, 1, 0, 0.827451, 1,
1.091561, -1.849538, 3.967553, 1, 0, 0.8235294, 1,
1.09186, 0.1434094, 1.220565, 1, 0, 0.8156863, 1,
1.092637, 1.115902, 1.630729, 1, 0, 0.8117647, 1,
1.104635, 0.5732408, 1.537945, 1, 0, 0.8039216, 1,
1.107036, -1.099432, 2.834312, 1, 0, 0.7960784, 1,
1.110353, -0.02799092, 2.69494, 1, 0, 0.7921569, 1,
1.111293, 1.5904, -1.161346, 1, 0, 0.7843137, 1,
1.119438, 0.3338672, 2.526468, 1, 0, 0.7803922, 1,
1.132638, 0.2505789, 0.01376447, 1, 0, 0.772549, 1,
1.137708, -0.05290886, 1.316658, 1, 0, 0.7686275, 1,
1.14075, 2.04161, 0.1953486, 1, 0, 0.7607843, 1,
1.143118, -0.2545406, 0.9892221, 1, 0, 0.7568628, 1,
1.14822, 0.4772406, 1.473933, 1, 0, 0.7490196, 1,
1.153705, -1.841569, 2.846018, 1, 0, 0.7450981, 1,
1.161061, -1.300179, 3.195482, 1, 0, 0.7372549, 1,
1.163154, -1.182171, 1.33321, 1, 0, 0.7333333, 1,
1.169453, 1.017666, 1.034396, 1, 0, 0.7254902, 1,
1.17397, -0.6143975, 0.521116, 1, 0, 0.7215686, 1,
1.177622, 0.2087287, 0.09366958, 1, 0, 0.7137255, 1,
1.182077, 0.004674571, 1.0814, 1, 0, 0.7098039, 1,
1.193974, -1.098765, 1.701025, 1, 0, 0.7019608, 1,
1.197162, -2.223829, 2.157463, 1, 0, 0.6941177, 1,
1.19895, -0.7374964, 2.204498, 1, 0, 0.6901961, 1,
1.210058, -0.9615808, 2.086566, 1, 0, 0.682353, 1,
1.21495, 0.536578, 2.052284, 1, 0, 0.6784314, 1,
1.215593, -2.653323, 2.016954, 1, 0, 0.6705883, 1,
1.219162, 0.6174447, 1.993928, 1, 0, 0.6666667, 1,
1.220195, 0.1729009, 2.593672, 1, 0, 0.6588235, 1,
1.226298, -0.3994378, 1.639281, 1, 0, 0.654902, 1,
1.231958, 0.2427192, 1.787852, 1, 0, 0.6470588, 1,
1.243745, 0.5803347, 1.189508, 1, 0, 0.6431373, 1,
1.247341, 0.5888023, 1.949799, 1, 0, 0.6352941, 1,
1.250892, -0.04108778, 0.6598949, 1, 0, 0.6313726, 1,
1.259391, -0.2641902, 3.193138, 1, 0, 0.6235294, 1,
1.271902, 0.8663898, 2.038508, 1, 0, 0.6196079, 1,
1.272743, -1.087817, 1.554092, 1, 0, 0.6117647, 1,
1.273232, -0.8551261, 2.168488, 1, 0, 0.6078432, 1,
1.278517, 0.5810503, 1.629737, 1, 0, 0.6, 1,
1.295661, 1.19303, 2.178818, 1, 0, 0.5921569, 1,
1.295706, -2.419457, 2.724618, 1, 0, 0.5882353, 1,
1.302405, -0.9363979, 2.193336, 1, 0, 0.5803922, 1,
1.302618, -1.11698, 1.452313, 1, 0, 0.5764706, 1,
1.307373, 1.936398, 0.7570239, 1, 0, 0.5686275, 1,
1.31916, -0.1619283, 4.52674, 1, 0, 0.5647059, 1,
1.327401, 0.1274223, 2.344857, 1, 0, 0.5568628, 1,
1.351067, 0.6777421, 1.003169, 1, 0, 0.5529412, 1,
1.361889, -0.731173, 2.641843, 1, 0, 0.5450981, 1,
1.366481, 0.1511034, 3.24364, 1, 0, 0.5411765, 1,
1.373305, 1.811741, -1.03878, 1, 0, 0.5333334, 1,
1.380603, -0.9193929, 2.839496, 1, 0, 0.5294118, 1,
1.388378, -1.167245, -0.6769056, 1, 0, 0.5215687, 1,
1.395714, -0.1186617, 0.5514556, 1, 0, 0.5176471, 1,
1.398205, 0.6212536, -0.3647322, 1, 0, 0.509804, 1,
1.398221, 1.153337, -0.2912204, 1, 0, 0.5058824, 1,
1.406621, -1.837227, 4.00324, 1, 0, 0.4980392, 1,
1.412139, 1.05048, -0.4972609, 1, 0, 0.4901961, 1,
1.414483, 0.5561407, -0.8437626, 1, 0, 0.4862745, 1,
1.416115, 0.4025895, 0.4445444, 1, 0, 0.4784314, 1,
1.416234, 0.8250577, -0.8789591, 1, 0, 0.4745098, 1,
1.423502, -1.21488, 2.965959, 1, 0, 0.4666667, 1,
1.42854, -0.1140287, 3.395017, 1, 0, 0.4627451, 1,
1.435718, 0.1492456, 0.8850945, 1, 0, 0.454902, 1,
1.436912, 0.6320984, -0.8812862, 1, 0, 0.4509804, 1,
1.43925, 0.9089099, 1.361716, 1, 0, 0.4431373, 1,
1.45689, -1.246609, 1.610083, 1, 0, 0.4392157, 1,
1.458474, -0.4490263, 1.116976, 1, 0, 0.4313726, 1,
1.483077, -0.6323786, 1.43524, 1, 0, 0.427451, 1,
1.484985, -1.056216, 0.7954431, 1, 0, 0.4196078, 1,
1.491546, 0.2317416, -0.07467543, 1, 0, 0.4156863, 1,
1.493366, 0.003598041, 1.845372, 1, 0, 0.4078431, 1,
1.505195, 0.1246581, -1.136209, 1, 0, 0.4039216, 1,
1.515255, -2.35056, 2.142718, 1, 0, 0.3960784, 1,
1.526788, 0.1647063, 1.086664, 1, 0, 0.3882353, 1,
1.530025, 0.2394385, 1.441847, 1, 0, 0.3843137, 1,
1.53891, 1.849213, 1.111678, 1, 0, 0.3764706, 1,
1.544927, -0.9732768, 0.708282, 1, 0, 0.372549, 1,
1.552556, 0.5391928, 1.692621, 1, 0, 0.3647059, 1,
1.571086, 0.9457256, -1.447738, 1, 0, 0.3607843, 1,
1.571992, -0.5552453, 0.6953382, 1, 0, 0.3529412, 1,
1.576656, -0.7814988, 2.646123, 1, 0, 0.3490196, 1,
1.585624, 0.4515989, 1.380339, 1, 0, 0.3411765, 1,
1.58814, -1.452865, 2.493117, 1, 0, 0.3372549, 1,
1.611944, -1.293928, 2.241258, 1, 0, 0.3294118, 1,
1.623589, -0.1471875, -0.1940659, 1, 0, 0.3254902, 1,
1.631336, 0.9140295, 2.057799, 1, 0, 0.3176471, 1,
1.634937, -0.3246747, 2.533479, 1, 0, 0.3137255, 1,
1.640622, -0.2241222, 2.286142, 1, 0, 0.3058824, 1,
1.644508, -0.1874181, 0.976106, 1, 0, 0.2980392, 1,
1.653832, -0.9151617, 2.234568, 1, 0, 0.2941177, 1,
1.660386, -1.886124, 3.039514, 1, 0, 0.2862745, 1,
1.662527, 0.9732196, 3.065362, 1, 0, 0.282353, 1,
1.675428, -1.985403, 3.352802, 1, 0, 0.2745098, 1,
1.677718, -0.06641456, 2.157953, 1, 0, 0.2705882, 1,
1.683909, -0.1701986, 2.328722, 1, 0, 0.2627451, 1,
1.696576, 0.7060969, -0.09663242, 1, 0, 0.2588235, 1,
1.701308, -1.00492, 2.50901, 1, 0, 0.2509804, 1,
1.703167, -0.9719875, 2.15708, 1, 0, 0.2470588, 1,
1.714506, 0.2716203, 0.6992477, 1, 0, 0.2392157, 1,
1.724906, -0.2714573, 1.984683, 1, 0, 0.2352941, 1,
1.736376, -1.037149, 1.772176, 1, 0, 0.227451, 1,
1.762603, 0.4698223, 0.6944578, 1, 0, 0.2235294, 1,
1.762866, 1.430627, 0.7870443, 1, 0, 0.2156863, 1,
1.783407, 0.2581981, 3.646915, 1, 0, 0.2117647, 1,
1.785899, 1.381966, 0.7009824, 1, 0, 0.2039216, 1,
1.787414, -0.8317606, 3.154551, 1, 0, 0.1960784, 1,
1.793831, -1.754345, 2.842088, 1, 0, 0.1921569, 1,
1.823124, -1.175272, 2.81252, 1, 0, 0.1843137, 1,
1.842231, 0.05180518, 1.077048, 1, 0, 0.1803922, 1,
1.858287, 0.7443077, 2.252923, 1, 0, 0.172549, 1,
1.871015, 0.2794743, 0.432119, 1, 0, 0.1686275, 1,
1.876569, 1.177249, 0.969088, 1, 0, 0.1607843, 1,
1.901652, -0.8562397, 2.644798, 1, 0, 0.1568628, 1,
1.910565, -0.4599773, 3.886179, 1, 0, 0.1490196, 1,
1.912743, -0.423582, 2.616613, 1, 0, 0.145098, 1,
1.96056, -0.755661, 0.3130713, 1, 0, 0.1372549, 1,
1.986491, -0.6853328, 1.906482, 1, 0, 0.1333333, 1,
1.997433, -0.4297405, 1.285592, 1, 0, 0.1254902, 1,
2.026132, -2.05964, 1.410103, 1, 0, 0.1215686, 1,
2.049841, 0.7419158, 1.499704, 1, 0, 0.1137255, 1,
2.077405, 0.1737139, 1.204188, 1, 0, 0.1098039, 1,
2.080465, -0.0116103, 1.095567, 1, 0, 0.1019608, 1,
2.114723, -0.1569787, 3.37725, 1, 0, 0.09411765, 1,
2.117756, 1.250804, 0.1049481, 1, 0, 0.09019608, 1,
2.128508, 0.5523299, 2.658417, 1, 0, 0.08235294, 1,
2.181089, 2.756313, 0.938194, 1, 0, 0.07843138, 1,
2.204604, -0.5192727, -0.2357088, 1, 0, 0.07058824, 1,
2.236639, 0.1423582, 1.949824, 1, 0, 0.06666667, 1,
2.299543, -1.511047, 1.467359, 1, 0, 0.05882353, 1,
2.483713, -0.0190597, -0.05408921, 1, 0, 0.05490196, 1,
2.488561, -1.067562, 3.306837, 1, 0, 0.04705882, 1,
2.531826, -0.9340999, 1.106018, 1, 0, 0.04313726, 1,
2.714073, 0.4144125, 0.2258087, 1, 0, 0.03529412, 1,
2.731425, 0.1678029, 2.680237, 1, 0, 0.03137255, 1,
2.795712, -0.09705499, 1.31066, 1, 0, 0.02352941, 1,
2.871554, -0.9891376, 1.518066, 1, 0, 0.01960784, 1,
3.100571, -1.51217, 0.6819417, 1, 0, 0.01176471, 1,
3.325543, 0.3953562, 1.513301, 1, 0, 0.007843138, 1
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
0.2407371, -3.913646, -7.54829, 0, -0.5, 0.5, 0.5,
0.2407371, -3.913646, -7.54829, 1, -0.5, 0.5, 0.5,
0.2407371, -3.913646, -7.54829, 1, 1.5, 0.5, 0.5,
0.2407371, -3.913646, -7.54829, 0, 1.5, 0.5, 0.5
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
-3.889818, 0.2638156, -7.54829, 0, -0.5, 0.5, 0.5,
-3.889818, 0.2638156, -7.54829, 1, -0.5, 0.5, 0.5,
-3.889818, 0.2638156, -7.54829, 1, 1.5, 0.5, 0.5,
-3.889818, 0.2638156, -7.54829, 0, 1.5, 0.5, 0.5
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
-3.889818, -3.913646, 0.05203247, 0, -0.5, 0.5, 0.5,
-3.889818, -3.913646, 0.05203247, 1, -0.5, 0.5, 0.5,
-3.889818, -3.913646, 0.05203247, 1, 1.5, 0.5, 0.5,
-3.889818, -3.913646, 0.05203247, 0, 1.5, 0.5, 0.5
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
-2, -2.949616, -5.794369,
3, -2.949616, -5.794369,
-2, -2.949616, -5.794369,
-2, -3.110288, -6.086689,
-1, -2.949616, -5.794369,
-1, -3.110288, -6.086689,
0, -2.949616, -5.794369,
0, -3.110288, -6.086689,
1, -2.949616, -5.794369,
1, -3.110288, -6.086689,
2, -2.949616, -5.794369,
2, -3.110288, -6.086689,
3, -2.949616, -5.794369,
3, -3.110288, -6.086689
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
-2, -3.431631, -6.67133, 0, -0.5, 0.5, 0.5,
-2, -3.431631, -6.67133, 1, -0.5, 0.5, 0.5,
-2, -3.431631, -6.67133, 1, 1.5, 0.5, 0.5,
-2, -3.431631, -6.67133, 0, 1.5, 0.5, 0.5,
-1, -3.431631, -6.67133, 0, -0.5, 0.5, 0.5,
-1, -3.431631, -6.67133, 1, -0.5, 0.5, 0.5,
-1, -3.431631, -6.67133, 1, 1.5, 0.5, 0.5,
-1, -3.431631, -6.67133, 0, 1.5, 0.5, 0.5,
0, -3.431631, -6.67133, 0, -0.5, 0.5, 0.5,
0, -3.431631, -6.67133, 1, -0.5, 0.5, 0.5,
0, -3.431631, -6.67133, 1, 1.5, 0.5, 0.5,
0, -3.431631, -6.67133, 0, 1.5, 0.5, 0.5,
1, -3.431631, -6.67133, 0, -0.5, 0.5, 0.5,
1, -3.431631, -6.67133, 1, -0.5, 0.5, 0.5,
1, -3.431631, -6.67133, 1, 1.5, 0.5, 0.5,
1, -3.431631, -6.67133, 0, 1.5, 0.5, 0.5,
2, -3.431631, -6.67133, 0, -0.5, 0.5, 0.5,
2, -3.431631, -6.67133, 1, -0.5, 0.5, 0.5,
2, -3.431631, -6.67133, 1, 1.5, 0.5, 0.5,
2, -3.431631, -6.67133, 0, 1.5, 0.5, 0.5,
3, -3.431631, -6.67133, 0, -0.5, 0.5, 0.5,
3, -3.431631, -6.67133, 1, -0.5, 0.5, 0.5,
3, -3.431631, -6.67133, 1, 1.5, 0.5, 0.5,
3, -3.431631, -6.67133, 0, 1.5, 0.5, 0.5
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
-2.936613, -2, -5.794369,
-2.936613, 3, -5.794369,
-2.936613, -2, -5.794369,
-3.095481, -2, -6.086689,
-2.936613, -1, -5.794369,
-3.095481, -1, -6.086689,
-2.936613, 0, -5.794369,
-3.095481, 0, -6.086689,
-2.936613, 1, -5.794369,
-3.095481, 1, -6.086689,
-2.936613, 2, -5.794369,
-3.095481, 2, -6.086689,
-2.936613, 3, -5.794369,
-3.095481, 3, -6.086689
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
-3.413216, -2, -6.67133, 0, -0.5, 0.5, 0.5,
-3.413216, -2, -6.67133, 1, -0.5, 0.5, 0.5,
-3.413216, -2, -6.67133, 1, 1.5, 0.5, 0.5,
-3.413216, -2, -6.67133, 0, 1.5, 0.5, 0.5,
-3.413216, -1, -6.67133, 0, -0.5, 0.5, 0.5,
-3.413216, -1, -6.67133, 1, -0.5, 0.5, 0.5,
-3.413216, -1, -6.67133, 1, 1.5, 0.5, 0.5,
-3.413216, -1, -6.67133, 0, 1.5, 0.5, 0.5,
-3.413216, 0, -6.67133, 0, -0.5, 0.5, 0.5,
-3.413216, 0, -6.67133, 1, -0.5, 0.5, 0.5,
-3.413216, 0, -6.67133, 1, 1.5, 0.5, 0.5,
-3.413216, 0, -6.67133, 0, 1.5, 0.5, 0.5,
-3.413216, 1, -6.67133, 0, -0.5, 0.5, 0.5,
-3.413216, 1, -6.67133, 1, -0.5, 0.5, 0.5,
-3.413216, 1, -6.67133, 1, 1.5, 0.5, 0.5,
-3.413216, 1, -6.67133, 0, 1.5, 0.5, 0.5,
-3.413216, 2, -6.67133, 0, -0.5, 0.5, 0.5,
-3.413216, 2, -6.67133, 1, -0.5, 0.5, 0.5,
-3.413216, 2, -6.67133, 1, 1.5, 0.5, 0.5,
-3.413216, 2, -6.67133, 0, 1.5, 0.5, 0.5,
-3.413216, 3, -6.67133, 0, -0.5, 0.5, 0.5,
-3.413216, 3, -6.67133, 1, -0.5, 0.5, 0.5,
-3.413216, 3, -6.67133, 1, 1.5, 0.5, 0.5,
-3.413216, 3, -6.67133, 0, 1.5, 0.5, 0.5
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
-2.936613, -2.949616, -4,
-2.936613, -2.949616, 4,
-2.936613, -2.949616, -4,
-3.095481, -3.110288, -4,
-2.936613, -2.949616, -2,
-3.095481, -3.110288, -2,
-2.936613, -2.949616, 0,
-3.095481, -3.110288, 0,
-2.936613, -2.949616, 2,
-3.095481, -3.110288, 2,
-2.936613, -2.949616, 4,
-3.095481, -3.110288, 4
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
-3.413216, -3.431631, -4, 0, -0.5, 0.5, 0.5,
-3.413216, -3.431631, -4, 1, -0.5, 0.5, 0.5,
-3.413216, -3.431631, -4, 1, 1.5, 0.5, 0.5,
-3.413216, -3.431631, -4, 0, 1.5, 0.5, 0.5,
-3.413216, -3.431631, -2, 0, -0.5, 0.5, 0.5,
-3.413216, -3.431631, -2, 1, -0.5, 0.5, 0.5,
-3.413216, -3.431631, -2, 1, 1.5, 0.5, 0.5,
-3.413216, -3.431631, -2, 0, 1.5, 0.5, 0.5,
-3.413216, -3.431631, 0, 0, -0.5, 0.5, 0.5,
-3.413216, -3.431631, 0, 1, -0.5, 0.5, 0.5,
-3.413216, -3.431631, 0, 1, 1.5, 0.5, 0.5,
-3.413216, -3.431631, 0, 0, 1.5, 0.5, 0.5,
-3.413216, -3.431631, 2, 0, -0.5, 0.5, 0.5,
-3.413216, -3.431631, 2, 1, -0.5, 0.5, 0.5,
-3.413216, -3.431631, 2, 1, 1.5, 0.5, 0.5,
-3.413216, -3.431631, 2, 0, 1.5, 0.5, 0.5,
-3.413216, -3.431631, 4, 0, -0.5, 0.5, 0.5,
-3.413216, -3.431631, 4, 1, -0.5, 0.5, 0.5,
-3.413216, -3.431631, 4, 1, 1.5, 0.5, 0.5,
-3.413216, -3.431631, 4, 0, 1.5, 0.5, 0.5
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
-2.936613, -2.949616, -5.794369,
-2.936613, 3.477247, -5.794369,
-2.936613, -2.949616, 5.898434,
-2.936613, 3.477247, 5.898434,
-2.936613, -2.949616, -5.794369,
-2.936613, -2.949616, 5.898434,
-2.936613, 3.477247, -5.794369,
-2.936613, 3.477247, 5.898434,
-2.936613, -2.949616, -5.794369,
3.418087, -2.949616, -5.794369,
-2.936613, -2.949616, 5.898434,
3.418087, -2.949616, 5.898434,
-2.936613, 3.477247, -5.794369,
3.418087, 3.477247, -5.794369,
-2.936613, 3.477247, 5.898434,
3.418087, 3.477247, 5.898434,
3.418087, -2.949616, -5.794369,
3.418087, 3.477247, -5.794369,
3.418087, -2.949616, 5.898434,
3.418087, 3.477247, 5.898434,
3.418087, -2.949616, -5.794369,
3.418087, -2.949616, 5.898434,
3.418087, 3.477247, -5.794369,
3.418087, 3.477247, 5.898434
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
var radius = 7.891511;
var distance = 35.11023;
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
mvMatrix.translate( -0.2407371, -0.2638156, -0.05203247 );
mvMatrix.scale( 1.3427, 1.327624, 0.7297186 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.11023);
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
C22H18Cl2FNO3<-read.table("C22H18Cl2FNO3.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-C22H18Cl2FNO3$V2
```

```
## Error in eval(expr, envir, enclos): object 'C22H18Cl2FNO3' not found
```

```r
y<-C22H18Cl2FNO3$V3
```

```
## Error in eval(expr, envir, enclos): object 'C22H18Cl2FNO3' not found
```

```r
z<-C22H18Cl2FNO3$V4
```

```
## Error in eval(expr, envir, enclos): object 'C22H18Cl2FNO3' not found
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
-2.844069, 0.03865215, -2.324816, 0, 0, 1, 1, 1,
-2.732203, -0.3542507, -1.60546, 1, 0, 0, 1, 1,
-2.704161, -0.2827763, -0.7373351, 1, 0, 0, 1, 1,
-2.657256, 1.484383, -1.185529, 1, 0, 0, 1, 1,
-2.542433, 0.7253252, -2.535944, 1, 0, 0, 1, 1,
-2.520426, 0.5291281, -1.727274, 1, 0, 0, 1, 1,
-2.519806, -1.363921, -1.731811, 0, 0, 0, 1, 1,
-2.406216, -0.7009494, -1.261801, 0, 0, 0, 1, 1,
-2.349777, -1.642576, -1.298013, 0, 0, 0, 1, 1,
-2.302924, 0.0393401, -2.935449, 0, 0, 0, 1, 1,
-2.29114, 1.154698, -0.4007583, 0, 0, 0, 1, 1,
-2.290207, 0.6415038, -0.1528283, 0, 0, 0, 1, 1,
-2.286769, -1.587574, -2.51794, 0, 0, 0, 1, 1,
-2.285709, -1.020146, -0.383324, 1, 1, 1, 1, 1,
-2.23999, 1.712823, 0.4305869, 1, 1, 1, 1, 1,
-2.200788, 0.5675451, -1.169345, 1, 1, 1, 1, 1,
-2.1793, 0.5887398, -0.5635438, 1, 1, 1, 1, 1,
-2.162243, 1.455429, -0.7851954, 1, 1, 1, 1, 1,
-2.158135, -0.18721, -2.300589, 1, 1, 1, 1, 1,
-2.121983, 0.2057104, -1.274883, 1, 1, 1, 1, 1,
-2.120633, -0.1714098, -1.924208, 1, 1, 1, 1, 1,
-2.099731, 1.055725, -0.3608358, 1, 1, 1, 1, 1,
-2.098168, -1.166455, -2.567813, 1, 1, 1, 1, 1,
-2.083066, 1.479567, -0.07179983, 1, 1, 1, 1, 1,
-2.055034, -0.001970353, -1.190246, 1, 1, 1, 1, 1,
-2.025318, -0.2918595, -2.125539, 1, 1, 1, 1, 1,
-2.022513, 0.8849947, -0.8400318, 1, 1, 1, 1, 1,
-1.986406, 1.056444, -1.475289, 1, 1, 1, 1, 1,
-1.982731, 0.8726262, 0.6845888, 0, 0, 1, 1, 1,
-1.979067, -0.09504679, 0.621524, 1, 0, 0, 1, 1,
-1.970421, 2.971188, -0.5510308, 1, 0, 0, 1, 1,
-1.958408, -0.4019341, -0.2216412, 1, 0, 0, 1, 1,
-1.947955, 0.8796111, -0.4132632, 1, 0, 0, 1, 1,
-1.925461, 0.2758283, -0.5127081, 1, 0, 0, 1, 1,
-1.918268, 0.3638646, -1.316052, 0, 0, 0, 1, 1,
-1.913126, 0.01016143, -0.07830258, 0, 0, 0, 1, 1,
-1.910843, 1.361069, -0.9033303, 0, 0, 0, 1, 1,
-1.889494, 0.2742311, -2.012801, 0, 0, 0, 1, 1,
-1.884483, -0.09216041, -2.030346, 0, 0, 0, 1, 1,
-1.8825, 1.69383, -0.2767002, 0, 0, 0, 1, 1,
-1.848397, 2.397799, -0.06732163, 0, 0, 0, 1, 1,
-1.832185, -0.2991441, -1.806149, 1, 1, 1, 1, 1,
-1.82379, -1.101985, -2.485903, 1, 1, 1, 1, 1,
-1.792083, -1.575722, -3.407557, 1, 1, 1, 1, 1,
-1.773575, 0.7102638, -1.196207, 1, 1, 1, 1, 1,
-1.741629, 0.232361, -1.619329, 1, 1, 1, 1, 1,
-1.728016, 0.0540061, -3.327483, 1, 1, 1, 1, 1,
-1.72577, -0.940032, -0.5332042, 1, 1, 1, 1, 1,
-1.723041, 0.7815119, -0.1239218, 1, 1, 1, 1, 1,
-1.721259, -0.930796, -1.307296, 1, 1, 1, 1, 1,
-1.712542, -2.170469, -2.103947, 1, 1, 1, 1, 1,
-1.703029, 0.4383081, -2.113931, 1, 1, 1, 1, 1,
-1.692356, -0.1709492, -0.4624913, 1, 1, 1, 1, 1,
-1.68936, 0.1703985, -1.1843, 1, 1, 1, 1, 1,
-1.683796, -0.6968144, -1.696551, 1, 1, 1, 1, 1,
-1.678496, -0.795171, -1.965005, 1, 1, 1, 1, 1,
-1.676881, -1.167505, -4.578281, 0, 0, 1, 1, 1,
-1.665182, 1.352959, -1.528435, 1, 0, 0, 1, 1,
-1.662136, 0.2190803, -2.201061, 1, 0, 0, 1, 1,
-1.657251, 0.5123333, -1.645212, 1, 0, 0, 1, 1,
-1.649089, 1.600534, -0.1628969, 1, 0, 0, 1, 1,
-1.639515, -0.5154196, -1.745561, 1, 0, 0, 1, 1,
-1.627539, -1.757694, -1.166674, 0, 0, 0, 1, 1,
-1.618174, -0.4603248, -1.098088, 0, 0, 0, 1, 1,
-1.616095, -0.5256764, -2.485567, 0, 0, 0, 1, 1,
-1.582223, 1.72412, -0.06056716, 0, 0, 0, 1, 1,
-1.541822, 0.7514878, -1.531094, 0, 0, 0, 1, 1,
-1.532321, -0.03500471, -1.946063, 0, 0, 0, 1, 1,
-1.530153, -0.243748, -1.803056, 0, 0, 0, 1, 1,
-1.512935, -1.463509, -2.476031, 1, 1, 1, 1, 1,
-1.50127, -0.3582306, -0.9486595, 1, 1, 1, 1, 1,
-1.497208, -0.8939962, -4.946095, 1, 1, 1, 1, 1,
-1.489506, 0.7268087, -2.351997, 1, 1, 1, 1, 1,
-1.489227, 0.9355906, -0.4157156, 1, 1, 1, 1, 1,
-1.485712, 0.8731526, -1.243069, 1, 1, 1, 1, 1,
-1.4765, -1.41511, -2.533756, 1, 1, 1, 1, 1,
-1.472494, -1.239112, -2.660997, 1, 1, 1, 1, 1,
-1.47041, -0.09253786, -2.416564, 1, 1, 1, 1, 1,
-1.464607, 0.4993302, -1.816951, 1, 1, 1, 1, 1,
-1.452716, 0.2749434, -2.099136, 1, 1, 1, 1, 1,
-1.451121, -1.293307, -2.588262, 1, 1, 1, 1, 1,
-1.449537, -0.5594552, -3.087594, 1, 1, 1, 1, 1,
-1.448189, -0.227185, -3.06845, 1, 1, 1, 1, 1,
-1.442278, -0.3529463, -0.1877162, 1, 1, 1, 1, 1,
-1.441037, -0.946306, -4.00878, 0, 0, 1, 1, 1,
-1.440471, -0.7716044, -2.797204, 1, 0, 0, 1, 1,
-1.439757, -0.3864073, -1.624384, 1, 0, 0, 1, 1,
-1.436208, 1.269045, -1.877185, 1, 0, 0, 1, 1,
-1.422062, 0.7732067, -1.394268, 1, 0, 0, 1, 1,
-1.420886, -0.9141809, -2.294569, 1, 0, 0, 1, 1,
-1.40351, 0.5434424, -3.515424, 0, 0, 0, 1, 1,
-1.400984, 1.679451, -1.580464, 0, 0, 0, 1, 1,
-1.400221, 1.564705, 0.9437262, 0, 0, 0, 1, 1,
-1.392635, -1.266809, -2.446738, 0, 0, 0, 1, 1,
-1.370282, -0.03765227, -1.442863, 0, 0, 0, 1, 1,
-1.366232, 0.5167176, -1.170456, 0, 0, 0, 1, 1,
-1.362221, -0.4098387, -1.414686, 0, 0, 0, 1, 1,
-1.35937, -0.2548173, -3.237054, 1, 1, 1, 1, 1,
-1.348518, 0.05702969, -2.278702, 1, 1, 1, 1, 1,
-1.343813, 0.6012751, -2.897692, 1, 1, 1, 1, 1,
-1.315982, 0.2604527, 0.9499534, 1, 1, 1, 1, 1,
-1.313305, 0.6158155, -3.646189, 1, 1, 1, 1, 1,
-1.295615, -0.4197443, -1.718677, 1, 1, 1, 1, 1,
-1.28632, 1.117312, -1.893307, 1, 1, 1, 1, 1,
-1.284842, 0.7043352, -1.176117, 1, 1, 1, 1, 1,
-1.284718, -0.1480079, -2.208301, 1, 1, 1, 1, 1,
-1.283008, -0.4837931, -2.035631, 1, 1, 1, 1, 1,
-1.273575, 1.72189, -0.6209605, 1, 1, 1, 1, 1,
-1.258987, -0.09003926, -1.339955, 1, 1, 1, 1, 1,
-1.25101, 0.3004462, -1.446769, 1, 1, 1, 1, 1,
-1.238229, 0.5770118, 0.1017303, 1, 1, 1, 1, 1,
-1.233675, -0.06264553, -1.078146, 1, 1, 1, 1, 1,
-1.227154, -1.08669, -2.392839, 0, 0, 1, 1, 1,
-1.219814, 0.005215762, -1.089369, 1, 0, 0, 1, 1,
-1.214835, 0.6217558, -0.43176, 1, 0, 0, 1, 1,
-1.213403, -1.412288, -2.437848, 1, 0, 0, 1, 1,
-1.199912, -0.05020802, -2.11124, 1, 0, 0, 1, 1,
-1.180526, -0.6547033, -0.01364805, 1, 0, 0, 1, 1,
-1.172867, -1.247733, -1.761154, 0, 0, 0, 1, 1,
-1.167665, -0.4374281, -3.180263, 0, 0, 0, 1, 1,
-1.16664, -0.0169525, -2.516894, 0, 0, 0, 1, 1,
-1.164464, 0.7005067, -2.894731, 0, 0, 0, 1, 1,
-1.162267, -0.3246393, -2.679118, 0, 0, 0, 1, 1,
-1.158367, 1.192034, -0.320885, 0, 0, 0, 1, 1,
-1.157023, -0.9692148, -2.124863, 0, 0, 0, 1, 1,
-1.156497, -0.0861737, -0.4657106, 1, 1, 1, 1, 1,
-1.148836, 1.303774, -0.0793426, 1, 1, 1, 1, 1,
-1.133249, -0.8492687, -3.343756, 1, 1, 1, 1, 1,
-1.133196, 0.4427935, -2.824434, 1, 1, 1, 1, 1,
-1.129352, -0.4421217, -1.655458, 1, 1, 1, 1, 1,
-1.129062, -0.4246809, -2.182118, 1, 1, 1, 1, 1,
-1.123942, -1.277062, -2.699609, 1, 1, 1, 1, 1,
-1.122388, 0.5524613, -2.356947, 1, 1, 1, 1, 1,
-1.11544, -1.288529, -1.818825, 1, 1, 1, 1, 1,
-1.114226, -0.4115298, 0.247797, 1, 1, 1, 1, 1,
-1.112766, -1.183791, -2.423228, 1, 1, 1, 1, 1,
-1.107437, -2.603046, -3.340908, 1, 1, 1, 1, 1,
-1.084341, -0.8832272, -2.358211, 1, 1, 1, 1, 1,
-1.080988, 0.007652503, -2.549278, 1, 1, 1, 1, 1,
-1.077389, 1.023304, 0.6402478, 1, 1, 1, 1, 1,
-1.076919, -0.1495405, -1.62573, 0, 0, 1, 1, 1,
-1.073475, -0.3144315, -3.348287, 1, 0, 0, 1, 1,
-1.07154, 3.121697, 0.1287725, 1, 0, 0, 1, 1,
-1.069126, -0.2764342, -2.688431, 1, 0, 0, 1, 1,
-1.060532, -0.5484987, -1.916074, 1, 0, 0, 1, 1,
-1.055207, 1.032405, -1.302706, 1, 0, 0, 1, 1,
-1.05346, 1.069218, -1.502019, 0, 0, 0, 1, 1,
-1.052246, -0.3849005, -1.285893, 0, 0, 0, 1, 1,
-1.050948, -1.086616, -3.191882, 0, 0, 0, 1, 1,
-1.039243, -0.6902832, -2.337179, 0, 0, 0, 1, 1,
-1.038501, -0.7701575, -0.7635862, 0, 0, 0, 1, 1,
-1.033665, 1.546793, -1.268, 0, 0, 0, 1, 1,
-1.028619, -0.5169094, -2.958606, 0, 0, 0, 1, 1,
-1.023113, -0.06673322, -1.500989, 1, 1, 1, 1, 1,
-1.021731, -1.173238, -4.858911, 1, 1, 1, 1, 1,
-1.01898, 1.34854, -1.221264, 1, 1, 1, 1, 1,
-1.014254, 1.848263, -1.515375, 1, 1, 1, 1, 1,
-1.01196, -1.001338, -0.9753617, 1, 1, 1, 1, 1,
-1.008005, 0.846776, 0.1104719, 1, 1, 1, 1, 1,
-1.002099, -1.233992, -1.439529, 1, 1, 1, 1, 1,
-0.9979706, -0.5516511, -0.9050811, 1, 1, 1, 1, 1,
-0.997589, 0.651036, -1.661167, 1, 1, 1, 1, 1,
-0.997284, -0.05347658, -3.108079, 1, 1, 1, 1, 1,
-0.9940914, -1.109653, -1.890949, 1, 1, 1, 1, 1,
-0.9923064, -0.3438818, -3.245727, 1, 1, 1, 1, 1,
-0.9891859, 1.008209, -2.375936, 1, 1, 1, 1, 1,
-0.9827172, 2.033148, -3.060934, 1, 1, 1, 1, 1,
-0.9769383, -0.695307, -2.167298, 1, 1, 1, 1, 1,
-0.9754038, -0.4026358, -3.27196, 0, 0, 1, 1, 1,
-0.9675944, -1.324597, -1.000132, 1, 0, 0, 1, 1,
-0.9557018, -0.6550492, -2.690759, 1, 0, 0, 1, 1,
-0.9541129, -1.271201, -3.861034, 1, 0, 0, 1, 1,
-0.9540576, -0.0246286, -2.219253, 1, 0, 0, 1, 1,
-0.95013, -1.959858, -1.962693, 1, 0, 0, 1, 1,
-0.9472882, -0.2131963, -1.70581, 0, 0, 0, 1, 1,
-0.9344611, 0.04932654, -3.027754, 0, 0, 0, 1, 1,
-0.9326659, -0.2468834, -1.501306, 0, 0, 0, 1, 1,
-0.9280331, 0.603949, -1.342796, 0, 0, 0, 1, 1,
-0.9256541, 0.5145534, -0.6298633, 0, 0, 0, 1, 1,
-0.9143009, -0.8149706, -2.254145, 0, 0, 0, 1, 1,
-0.9140902, 0.4358498, -2.227067, 0, 0, 0, 1, 1,
-0.9074955, -0.05318234, -1.238955, 1, 1, 1, 1, 1,
-0.903395, 0.6047057, -1.554235, 1, 1, 1, 1, 1,
-0.901012, -0.2928434, -0.9301831, 1, 1, 1, 1, 1,
-0.9007543, -1.083035, -3.803729, 1, 1, 1, 1, 1,
-0.8958744, -0.5746858, -1.798173, 1, 1, 1, 1, 1,
-0.8906672, 0.2538594, -1.998515, 1, 1, 1, 1, 1,
-0.8861485, 1.111358, 0.131696, 1, 1, 1, 1, 1,
-0.8806479, 1.591216, -2.002973, 1, 1, 1, 1, 1,
-0.8677058, 0.7625343, -0.1930659, 1, 1, 1, 1, 1,
-0.8599483, -0.7558577, -3.499815, 1, 1, 1, 1, 1,
-0.8593155, -0.2244337, -0.4673729, 1, 1, 1, 1, 1,
-0.8560275, -0.4065779, -0.1960103, 1, 1, 1, 1, 1,
-0.8540586, 2.3231, 0.3598894, 1, 1, 1, 1, 1,
-0.8518154, 0.03528553, -1.237464, 1, 1, 1, 1, 1,
-0.8486695, -0.50924, -0.7905378, 1, 1, 1, 1, 1,
-0.8461802, -0.9541102, -0.9351303, 0, 0, 1, 1, 1,
-0.8455088, -0.1329241, -1.590958, 1, 0, 0, 1, 1,
-0.8401121, 0.6362498, -0.5262456, 1, 0, 0, 1, 1,
-0.8390068, -0.3204398, -2.477453, 1, 0, 0, 1, 1,
-0.8373504, -0.1047766, -1.549469, 1, 0, 0, 1, 1,
-0.8347586, -0.7738622, -2.643421, 1, 0, 0, 1, 1,
-0.8268025, -1.131481, -1.974123, 0, 0, 0, 1, 1,
-0.8236006, 0.004647264, -3.865288, 0, 0, 0, 1, 1,
-0.8233494, -1.479457, -2.475672, 0, 0, 0, 1, 1,
-0.8221037, 0.3515772, 0.1198568, 0, 0, 0, 1, 1,
-0.8166739, 0.08766388, -1.735197, 0, 0, 0, 1, 1,
-0.8153796, -0.4511053, -2.259401, 0, 0, 0, 1, 1,
-0.8146296, 1.9355, -1.126768, 0, 0, 0, 1, 1,
-0.8105689, -0.05556897, -1.694398, 1, 1, 1, 1, 1,
-0.8081843, -0.4359316, -1.598026, 1, 1, 1, 1, 1,
-0.8079779, 0.1681908, -0.8465363, 1, 1, 1, 1, 1,
-0.8062326, 0.3947468, -0.645708, 1, 1, 1, 1, 1,
-0.8045747, -1.159181, -1.050159, 1, 1, 1, 1, 1,
-0.7995198, -1.752767, -2.108899, 1, 1, 1, 1, 1,
-0.7937931, 1.072576, -0.07238507, 1, 1, 1, 1, 1,
-0.7887065, -1.127008, -2.274138, 1, 1, 1, 1, 1,
-0.7884475, 0.6513768, -0.6526778, 1, 1, 1, 1, 1,
-0.7870398, -0.23586, -2.000132, 1, 1, 1, 1, 1,
-0.7865631, -1.352453, -2.947524, 1, 1, 1, 1, 1,
-0.786386, -0.687283, -0.8430007, 1, 1, 1, 1, 1,
-0.7788022, 0.6886297, -0.2367207, 1, 1, 1, 1, 1,
-0.7774917, 1.335038, 0.2563846, 1, 1, 1, 1, 1,
-0.776137, 0.08786035, 0.4975864, 1, 1, 1, 1, 1,
-0.7734446, 1.42958, -1.142398, 0, 0, 1, 1, 1,
-0.7714784, 0.4723849, -0.04469744, 1, 0, 0, 1, 1,
-0.7708061, 0.7433376, -0.9417558, 1, 0, 0, 1, 1,
-0.7672177, 0.2500624, -1.970719, 1, 0, 0, 1, 1,
-0.7619431, 0.9573039, -0.03064235, 1, 0, 0, 1, 1,
-0.7579717, 1.270199, -0.3182765, 1, 0, 0, 1, 1,
-0.7546954, -1.093697, -1.101146, 0, 0, 0, 1, 1,
-0.750501, -1.151082, -2.109185, 0, 0, 0, 1, 1,
-0.7501188, -0.1117133, -0.3490274, 0, 0, 0, 1, 1,
-0.7485594, 0.8520484, -1.704493, 0, 0, 0, 1, 1,
-0.7481858, -0.5232566, -5.624086, 0, 0, 0, 1, 1,
-0.7467439, 0.1824623, -1.3917, 0, 0, 0, 1, 1,
-0.7440594, 0.4611942, -1.742577, 0, 0, 0, 1, 1,
-0.7431355, 1.374029, -1.612006, 1, 1, 1, 1, 1,
-0.7416131, -0.07612003, -1.506531, 1, 1, 1, 1, 1,
-0.7371332, -1.289515, -3.099047, 1, 1, 1, 1, 1,
-0.7360557, 0.1225255, -2.334221, 1, 1, 1, 1, 1,
-0.7333763, 0.8826336, -0.2810502, 1, 1, 1, 1, 1,
-0.7293158, -0.09270456, -2.392891, 1, 1, 1, 1, 1,
-0.721361, 1.186338, -1.110224, 1, 1, 1, 1, 1,
-0.7213478, 0.4894888, -2.180332, 1, 1, 1, 1, 1,
-0.7210031, 0.2875812, -2.048749, 1, 1, 1, 1, 1,
-0.7209938, -1.242256, -3.012769, 1, 1, 1, 1, 1,
-0.7204894, 0.09728073, -1.931507, 1, 1, 1, 1, 1,
-0.6997945, -0.2622475, -3.877679, 1, 1, 1, 1, 1,
-0.6872531, 0.7462687, -0.1746772, 1, 1, 1, 1, 1,
-0.6794478, -1.476106, -3.306761, 1, 1, 1, 1, 1,
-0.6758055, 0.190429, -2.961174, 1, 1, 1, 1, 1,
-0.6745613, -0.4659896, -2.659144, 0, 0, 1, 1, 1,
-0.6718127, 0.1997636, -2.267092, 1, 0, 0, 1, 1,
-0.6717143, -1.42113, -2.45553, 1, 0, 0, 1, 1,
-0.6697111, -0.1457944, -1.311177, 1, 0, 0, 1, 1,
-0.6650483, 1.468428, -1.324965, 1, 0, 0, 1, 1,
-0.6594881, -1.119579, -0.1098354, 1, 0, 0, 1, 1,
-0.6594187, -0.7198009, -1.86097, 0, 0, 0, 1, 1,
-0.6546991, 2.652593, 0.4034038, 0, 0, 0, 1, 1,
-0.6526257, -2.145705, -2.478558, 0, 0, 0, 1, 1,
-0.6477888, 2.101528, 0.4848247, 0, 0, 0, 1, 1,
-0.6468698, -0.8795853, -3.36614, 0, 0, 0, 1, 1,
-0.6276368, 0.03675484, -1.722814, 0, 0, 0, 1, 1,
-0.627252, 0.5077777, 0.04055053, 0, 0, 0, 1, 1,
-0.6248846, -1.318158, -3.66056, 1, 1, 1, 1, 1,
-0.6222538, -0.5183166, -1.485529, 1, 1, 1, 1, 1,
-0.6202121, 1.300446, 0.5792085, 1, 1, 1, 1, 1,
-0.6193803, 2.483166, 3.31343, 1, 1, 1, 1, 1,
-0.6143902, 0.4884431, 1.221501, 1, 1, 1, 1, 1,
-0.6136988, -1.846305, -1.67804, 1, 1, 1, 1, 1,
-0.609382, 0.82485, -0.251991, 1, 1, 1, 1, 1,
-0.6086413, -0.1745794, -2.301021, 1, 1, 1, 1, 1,
-0.6081845, 1.562614, -0.2764057, 1, 1, 1, 1, 1,
-0.6017165, -0.5618209, -2.096527, 1, 1, 1, 1, 1,
-0.6016756, -0.1572755, -0.5860158, 1, 1, 1, 1, 1,
-0.5969453, 0.4007824, -1.705214, 1, 1, 1, 1, 1,
-0.5963043, -0.288867, -1.325707, 1, 1, 1, 1, 1,
-0.59399, -0.7866333, -1.698871, 1, 1, 1, 1, 1,
-0.5905177, -0.5367458, -2.915353, 1, 1, 1, 1, 1,
-0.5861479, -2.636255, -3.613591, 0, 0, 1, 1, 1,
-0.5853884, 0.3373708, 0.119948, 1, 0, 0, 1, 1,
-0.5818844, -0.2516265, 0.046971, 1, 0, 0, 1, 1,
-0.5684022, 1.43936, 0.633855, 1, 0, 0, 1, 1,
-0.5627932, -0.3013317, -3.142232, 1, 0, 0, 1, 1,
-0.557919, -0.4824675, -1.452739, 1, 0, 0, 1, 1,
-0.5577246, -0.03019939, -0.8748927, 0, 0, 0, 1, 1,
-0.5505573, -0.3987202, -2.787778, 0, 0, 0, 1, 1,
-0.5446645, 0.000809265, -1.775775, 0, 0, 0, 1, 1,
-0.5445819, -0.4696666, -4.311475, 0, 0, 0, 1, 1,
-0.5435159, -0.03380376, 0.6261636, 0, 0, 0, 1, 1,
-0.5407023, 1.207278, 0.08812167, 0, 0, 0, 1, 1,
-0.5294785, -0.9161353, -3.544483, 0, 0, 0, 1, 1,
-0.5270754, -0.529003, -3.23127, 1, 1, 1, 1, 1,
-0.5263195, 0.8236918, 0.5684976, 1, 1, 1, 1, 1,
-0.5258349, -0.2079873, -0.3682647, 1, 1, 1, 1, 1,
-0.5222613, -0.2252606, -2.334723, 1, 1, 1, 1, 1,
-0.5222253, 0.3268802, 0.9649239, 1, 1, 1, 1, 1,
-0.5199255, -0.925322, -3.578033, 1, 1, 1, 1, 1,
-0.5196576, -0.5261119, -3.067756, 1, 1, 1, 1, 1,
-0.5158531, -0.433547, -3.943156, 1, 1, 1, 1, 1,
-0.5157012, 0.758778, -0.7503191, 1, 1, 1, 1, 1,
-0.5129402, -0.4501652, -2.09085, 1, 1, 1, 1, 1,
-0.5125331, -0.110089, -3.07459, 1, 1, 1, 1, 1,
-0.4882547, 0.6770496, -0.4581673, 1, 1, 1, 1, 1,
-0.4880419, 0.4018856, -1.04149, 1, 1, 1, 1, 1,
-0.4877965, -0.1267191, -1.029314, 1, 1, 1, 1, 1,
-0.484268, -0.1509495, -3.179358, 1, 1, 1, 1, 1,
-0.4842074, 0.7332065, -0.9162512, 0, 0, 1, 1, 1,
-0.4841515, -0.6966066, -3.060131, 1, 0, 0, 1, 1,
-0.4832807, 0.01587289, -0.5874802, 1, 0, 0, 1, 1,
-0.4826019, 0.2772688, -0.1273359, 1, 0, 0, 1, 1,
-0.4782744, 0.7998122, -0.3492713, 1, 0, 0, 1, 1,
-0.4767035, -1.363309, -1.939551, 1, 0, 0, 1, 1,
-0.4725668, 0.08197363, -2.086926, 0, 0, 0, 1, 1,
-0.4592284, 0.3251853, -0.792083, 0, 0, 0, 1, 1,
-0.456209, 0.03000785, -2.643744, 0, 0, 0, 1, 1,
-0.4546042, 0.1062257, -1.521929, 0, 0, 0, 1, 1,
-0.4508375, 0.245647, -0.3398064, 0, 0, 0, 1, 1,
-0.4507561, 1.313863, -2.11345, 0, 0, 0, 1, 1,
-0.4504386, 2.108149, 1.279722, 0, 0, 0, 1, 1,
-0.4503415, 0.6038202, -1.074216, 1, 1, 1, 1, 1,
-0.4461508, -1.284918, -3.053353, 1, 1, 1, 1, 1,
-0.4427965, -0.5106914, -2.403065, 1, 1, 1, 1, 1,
-0.4406488, 0.2970974, 0.2252178, 1, 1, 1, 1, 1,
-0.4372326, -0.9056438, -0.2002189, 1, 1, 1, 1, 1,
-0.4366091, -0.9411131, -4.116246, 1, 1, 1, 1, 1,
-0.4340531, 1.277553, -2.597267, 1, 1, 1, 1, 1,
-0.4294078, 0.4083516, -0.5825142, 1, 1, 1, 1, 1,
-0.4275699, 0.7424278, 1.253804, 1, 1, 1, 1, 1,
-0.423663, -0.6842481, -2.871128, 1, 1, 1, 1, 1,
-0.4222068, 0.594338, -0.02009162, 1, 1, 1, 1, 1,
-0.4210946, 0.7984146, -1.463438, 1, 1, 1, 1, 1,
-0.4202293, 0.886602, 1.317831, 1, 1, 1, 1, 1,
-0.4139158, -1.060747, -3.44515, 1, 1, 1, 1, 1,
-0.4114755, 0.2637048, 0.1465126, 1, 1, 1, 1, 1,
-0.4082843, 0.1667164, -2.218553, 0, 0, 1, 1, 1,
-0.4044695, 0.7480175, -1.635572, 1, 0, 0, 1, 1,
-0.3858307, 0.1725132, -1.414996, 1, 0, 0, 1, 1,
-0.3823018, -1.21209, -2.815465, 1, 0, 0, 1, 1,
-0.3815326, -0.302706, -2.680798, 1, 0, 0, 1, 1,
-0.3790683, 0.8384621, -1.722731, 1, 0, 0, 1, 1,
-0.3769465, 0.7062317, -2.417198, 0, 0, 0, 1, 1,
-0.3736894, 0.395881, -1.169317, 0, 0, 0, 1, 1,
-0.3736624, -0.2592726, -2.33339, 0, 0, 0, 1, 1,
-0.3720471, -1.693946, -2.782938, 0, 0, 0, 1, 1,
-0.3719195, -1.782829, -4.039398, 0, 0, 0, 1, 1,
-0.3716512, 0.6752811, -0.023236, 0, 0, 0, 1, 1,
-0.3711724, 1.060611, -0.327141, 0, 0, 0, 1, 1,
-0.3666087, 0.3558981, -0.2180465, 1, 1, 1, 1, 1,
-0.3564577, 1.357801, 0.5507097, 1, 1, 1, 1, 1,
-0.3542387, 0.8126492, -1.493051, 1, 1, 1, 1, 1,
-0.3538315, 0.5104361, 0.09928098, 1, 1, 1, 1, 1,
-0.3532414, 1.472384, -1.560908, 1, 1, 1, 1, 1,
-0.3528727, 0.01676491, -1.938201, 1, 1, 1, 1, 1,
-0.3498812, 0.2016679, -1.419785, 1, 1, 1, 1, 1,
-0.347887, -0.09594059, -1.419595, 1, 1, 1, 1, 1,
-0.3440415, 1.557418, 0.5575347, 1, 1, 1, 1, 1,
-0.3373896, 1.046437, 0.4396603, 1, 1, 1, 1, 1,
-0.336979, 0.8503049, 0.63798, 1, 1, 1, 1, 1,
-0.3320623, -0.6447843, -2.637834, 1, 1, 1, 1, 1,
-0.3310342, 0.9532912, -0.7921141, 1, 1, 1, 1, 1,
-0.3282171, -0.7240362, -4.871681, 1, 1, 1, 1, 1,
-0.3247163, -0.1318276, -1.853567, 1, 1, 1, 1, 1,
-0.3224795, -0.7589565, -3.008934, 0, 0, 1, 1, 1,
-0.3206169, 0.660694, 0.2613344, 1, 0, 0, 1, 1,
-0.3192822, 0.7383898, -0.3265094, 1, 0, 0, 1, 1,
-0.3168027, 1.534691, 0.9290648, 1, 0, 0, 1, 1,
-0.3150156, -1.826809, -2.507261, 1, 0, 0, 1, 1,
-0.3143542, -0.3186619, -1.313154, 1, 0, 0, 1, 1,
-0.3084697, -0.07252848, -0.722818, 0, 0, 0, 1, 1,
-0.3082783, -0.9285246, -2.63978, 0, 0, 0, 1, 1,
-0.3058029, -0.4597409, -1.762228, 0, 0, 0, 1, 1,
-0.3026661, 0.6745251, 0.1019628, 0, 0, 0, 1, 1,
-0.3023234, -0.2398643, -3.461781, 0, 0, 0, 1, 1,
-0.3014554, -1.755093, -2.639606, 0, 0, 0, 1, 1,
-0.2989431, 0.08418425, -0.6626055, 0, 0, 0, 1, 1,
-0.2985632, 0.502968, -0.4747208, 1, 1, 1, 1, 1,
-0.2945293, -1.042611, -3.19182, 1, 1, 1, 1, 1,
-0.2940804, 0.3930496, 0.1791492, 1, 1, 1, 1, 1,
-0.2896874, -1.003075, -2.550843, 1, 1, 1, 1, 1,
-0.288982, -0.08014195, 0.9409282, 1, 1, 1, 1, 1,
-0.2884263, 1.677039, -0.8549345, 1, 1, 1, 1, 1,
-0.2876892, 0.9017881, 0.942589, 1, 1, 1, 1, 1,
-0.2863869, -0.5734999, -3.129699, 1, 1, 1, 1, 1,
-0.2862157, 1.510138, 0.9092762, 1, 1, 1, 1, 1,
-0.2852827, 0.9053118, 0.431544, 1, 1, 1, 1, 1,
-0.2845357, -0.8116671, -4.242524, 1, 1, 1, 1, 1,
-0.2835232, -0.389642, -2.740034, 1, 1, 1, 1, 1,
-0.2808551, -0.9406294, -3.105787, 1, 1, 1, 1, 1,
-0.2783285, -0.3789565, -2.312732, 1, 1, 1, 1, 1,
-0.2776811, 0.1673478, -0.6800725, 1, 1, 1, 1, 1,
-0.2773738, 1.129799, -1.072051, 0, 0, 1, 1, 1,
-0.2768478, -1.24534, -1.696354, 1, 0, 0, 1, 1,
-0.2764954, 1.7658, -0.07632955, 1, 0, 0, 1, 1,
-0.2752725, 0.3206204, -1.107616, 1, 0, 0, 1, 1,
-0.2726433, 0.6981714, -1.408621, 1, 0, 0, 1, 1,
-0.2693571, -0.5135289, -1.244992, 1, 0, 0, 1, 1,
-0.266771, 1.332265, 0.3462575, 0, 0, 0, 1, 1,
-0.2636178, -0.8688712, -2.336684, 0, 0, 0, 1, 1,
-0.2626596, 0.2567842, -1.718513, 0, 0, 0, 1, 1,
-0.2546194, -1.026346, -4.399807, 0, 0, 0, 1, 1,
-0.2522648, 0.5163178, -1.272779, 0, 0, 0, 1, 1,
-0.2479209, -1.662376, -2.957633, 0, 0, 0, 1, 1,
-0.247687, 1.405442, 0.3671656, 0, 0, 0, 1, 1,
-0.2466289, 1.380535, -1.418157, 1, 1, 1, 1, 1,
-0.2363605, 0.3676508, 1.046367, 1, 1, 1, 1, 1,
-0.2332576, -0.07194123, -1.588912, 1, 1, 1, 1, 1,
-0.2317646, -0.4147958, -3.075931, 1, 1, 1, 1, 1,
-0.2277782, 0.5808133, -0.9386349, 1, 1, 1, 1, 1,
-0.2271601, 0.3353252, -0.7532609, 1, 1, 1, 1, 1,
-0.222316, -0.6714953, -2.261868, 1, 1, 1, 1, 1,
-0.219908, 0.5985356, -0.4013222, 1, 1, 1, 1, 1,
-0.2138533, 0.872567, -1.48175, 1, 1, 1, 1, 1,
-0.2133563, 1.625149, 0.3105116, 1, 1, 1, 1, 1,
-0.2085034, -0.6098791, -2.945273, 1, 1, 1, 1, 1,
-0.2034107, -0.7990681, -4.632903, 1, 1, 1, 1, 1,
-0.2003052, 1.963535, 0.2698845, 1, 1, 1, 1, 1,
-0.1990623, 0.4831168, -2.04595, 1, 1, 1, 1, 1,
-0.1945614, -0.816825, -3.096544, 1, 1, 1, 1, 1,
-0.1944994, -0.1033962, -1.863629, 0, 0, 1, 1, 1,
-0.1929283, -0.3020015, -2.376219, 1, 0, 0, 1, 1,
-0.1875535, -0.6355205, -3.301775, 1, 0, 0, 1, 1,
-0.1852034, -0.3193538, -3.244655, 1, 0, 0, 1, 1,
-0.1848801, 1.164178, -1.426371, 1, 0, 0, 1, 1,
-0.1826091, 0.6039158, 2.139994, 1, 0, 0, 1, 1,
-0.1810096, 1.208934, -0.999892, 0, 0, 0, 1, 1,
-0.1799942, -1.659392, -1.189641, 0, 0, 0, 1, 1,
-0.1793278, 0.06281029, -1.403031, 0, 0, 0, 1, 1,
-0.1747466, -1.550365, -2.54595, 0, 0, 0, 1, 1,
-0.1743094, -0.4077148, -3.229664, 0, 0, 0, 1, 1,
-0.1727801, -0.6105204, -1.516708, 0, 0, 0, 1, 1,
-0.1688944, 1.497547, 0.1351384, 0, 0, 0, 1, 1,
-0.166079, -0.03639362, -0.7167494, 1, 1, 1, 1, 1,
-0.1655616, 0.8207569, -1.385271, 1, 1, 1, 1, 1,
-0.1632018, 0.8523613, -2.942513, 1, 1, 1, 1, 1,
-0.1593235, -0.3161719, -2.125796, 1, 1, 1, 1, 1,
-0.1568844, -0.5315638, -1.142865, 1, 1, 1, 1, 1,
-0.1565484, 0.4836911, -1.123914, 1, 1, 1, 1, 1,
-0.1561829, -0.5111593, -3.378137, 1, 1, 1, 1, 1,
-0.15545, -1.602934, -2.183507, 1, 1, 1, 1, 1,
-0.155263, 0.1623169, -0.902489, 1, 1, 1, 1, 1,
-0.150575, -0.3881253, -1.357019, 1, 1, 1, 1, 1,
-0.1463436, -0.8194694, -3.81653, 1, 1, 1, 1, 1,
-0.1340091, -1.054678, -2.632675, 1, 1, 1, 1, 1,
-0.1328104, -0.6580818, -4.348345, 1, 1, 1, 1, 1,
-0.131182, 0.05389651, -1.24171, 1, 1, 1, 1, 1,
-0.1251338, -1.980296, -3.579827, 1, 1, 1, 1, 1,
-0.1147164, 0.2209458, -2.678956, 0, 0, 1, 1, 1,
-0.1085502, 0.1405023, 0.9535373, 1, 0, 0, 1, 1,
-0.1048415, 0.5016727, -0.7198229, 1, 0, 0, 1, 1,
-0.104479, 0.9244748, 0.4171048, 1, 0, 0, 1, 1,
-0.1038828, -2.19243, -4.513011, 1, 0, 0, 1, 1,
-0.1021695, -0.9360035, -2.516142, 1, 0, 0, 1, 1,
-0.1016365, -1.249344, -3.771971, 0, 0, 0, 1, 1,
-0.1007942, -1.876506, -5.417287, 0, 0, 0, 1, 1,
-0.1006888, 0.119035, -0.3702419, 0, 0, 0, 1, 1,
-0.1001845, 0.389421, 0.3322871, 0, 0, 0, 1, 1,
-0.08341821, 0.5404229, -1.417169, 0, 0, 0, 1, 1,
-0.08099742, -0.9049916, -1.578598, 0, 0, 0, 1, 1,
-0.08008572, 0.08391363, 0.3598365, 0, 0, 0, 1, 1,
-0.07891159, -0.01868282, -2.21928, 1, 1, 1, 1, 1,
-0.07032192, -1.011196, -3.750564, 1, 1, 1, 1, 1,
-0.06902784, 0.4838219, -0.8314474, 1, 1, 1, 1, 1,
-0.06582439, -0.05985597, -2.796185, 1, 1, 1, 1, 1,
-0.06353109, 0.3955442, 1.501436, 1, 1, 1, 1, 1,
-0.06288832, 1.510536, 0.3323254, 1, 1, 1, 1, 1,
-0.06271157, 0.8110614, -0.6181899, 1, 1, 1, 1, 1,
-0.06266075, -1.589071, -1.501499, 1, 1, 1, 1, 1,
-0.06229865, 1.086153, 0.1001998, 1, 1, 1, 1, 1,
-0.05879374, 0.2550173, -1.311777, 1, 1, 1, 1, 1,
-0.05043942, 0.3195969, 0.47069, 1, 1, 1, 1, 1,
-0.05020061, -2.693877, -3.625758, 1, 1, 1, 1, 1,
-0.04630329, -1.260622, -2.756365, 1, 1, 1, 1, 1,
-0.04623181, -1.682002, -4.840354, 1, 1, 1, 1, 1,
-0.04618103, 1.410017, 0.6969051, 1, 1, 1, 1, 1,
-0.04512328, -0.7656875, -3.165175, 0, 0, 1, 1, 1,
-0.04347663, 0.6553844, -0.06433238, 1, 0, 0, 1, 1,
-0.03738556, -1.376488, -1.583874, 1, 0, 0, 1, 1,
-0.03571203, -0.1088276, -2.896966, 1, 0, 0, 1, 1,
-0.03523571, 0.2803421, 1.064056, 1, 0, 0, 1, 1,
-0.03031147, 0.3144293, 0.9195292, 1, 0, 0, 1, 1,
-0.03015598, 1.05128, -1.858421, 0, 0, 0, 1, 1,
-0.02984598, -1.11647, -3.737341, 0, 0, 0, 1, 1,
-0.02950555, 0.0927753, -1.117929, 0, 0, 0, 1, 1,
-0.02449227, 1.206428, -0.6956005, 0, 0, 0, 1, 1,
-0.01691123, 0.2016887, 1.554304, 0, 0, 0, 1, 1,
-0.01476288, -0.7665129, -3.492595, 0, 0, 0, 1, 1,
-0.01311496, -0.2662777, -3.37815, 0, 0, 0, 1, 1,
-0.01064125, -0.9294983, -3.615527, 1, 1, 1, 1, 1,
-0.009396092, 0.561204, 1.671316, 1, 1, 1, 1, 1,
-0.007386416, 0.3328896, -1.476249, 1, 1, 1, 1, 1,
-0.007307224, 1.355939, -1.569571, 1, 1, 1, 1, 1,
0.00105164, 1.920865, -2.215763, 1, 1, 1, 1, 1,
0.001840315, 0.3328595, -0.235355, 1, 1, 1, 1, 1,
0.008485728, 0.4851872, -0.9733995, 1, 1, 1, 1, 1,
0.01188486, 1.477709, -1.29093, 1, 1, 1, 1, 1,
0.012713, 1.075069, 0.4956491, 1, 1, 1, 1, 1,
0.01582516, -0.2091299, 2.981441, 1, 1, 1, 1, 1,
0.01631698, 0.7059126, -0.1624854, 1, 1, 1, 1, 1,
0.01674242, 0.5769971, 1.153709, 1, 1, 1, 1, 1,
0.01676071, 1.595877, -0.1263592, 1, 1, 1, 1, 1,
0.01678361, 0.1624663, -1.323419, 1, 1, 1, 1, 1,
0.01688415, 0.019698, -0.2824253, 1, 1, 1, 1, 1,
0.0177934, -0.3931257, 5.165222, 0, 0, 1, 1, 1,
0.01861016, 0.3076179, -0.06314881, 1, 0, 0, 1, 1,
0.01911206, 0.8738185, 0.2874762, 1, 0, 0, 1, 1,
0.03234355, -1.656405, 3.810183, 1, 0, 0, 1, 1,
0.03721712, -1.279416, 2.199982, 1, 0, 0, 1, 1,
0.03784449, 0.9267489, 0.4312632, 1, 0, 0, 1, 1,
0.04029, 2.778634, -0.3940156, 0, 0, 0, 1, 1,
0.04123923, 0.5805405, 0.0949564, 0, 0, 0, 1, 1,
0.04382108, -0.2006648, 5.728151, 0, 0, 0, 1, 1,
0.04621146, -0.9352209, 1.722068, 0, 0, 0, 1, 1,
0.04853775, 0.7445579, 0.4921515, 0, 0, 0, 1, 1,
0.05016318, 1.638963, -0.03433426, 0, 0, 0, 1, 1,
0.05114061, -0.1047423, 3.943493, 0, 0, 0, 1, 1,
0.05204059, 0.2286033, 0.5056903, 1, 1, 1, 1, 1,
0.0541257, -0.007681389, 1.601774, 1, 1, 1, 1, 1,
0.05463959, 1.144891, 1.726041, 1, 1, 1, 1, 1,
0.05775303, 0.3531592, 0.26397, 1, 1, 1, 1, 1,
0.05945038, 0.03480936, 0.7418618, 1, 1, 1, 1, 1,
0.07180989, -0.483328, 3.064202, 1, 1, 1, 1, 1,
0.07452178, -0.2678834, 1.278956, 1, 1, 1, 1, 1,
0.07821704, 0.02065267, 2.157585, 1, 1, 1, 1, 1,
0.07825882, 0.5586038, -0.05288476, 1, 1, 1, 1, 1,
0.07842143, 1.125549, 0.2347491, 1, 1, 1, 1, 1,
0.07930825, 0.3274166, 0.3263781, 1, 1, 1, 1, 1,
0.07982252, -0.4654972, 3.489446, 1, 1, 1, 1, 1,
0.08109167, 0.03574371, 1.464853, 1, 1, 1, 1, 1,
0.08873549, -0.7879531, 2.739568, 1, 1, 1, 1, 1,
0.08964685, -0.3581277, 1.191787, 1, 1, 1, 1, 1,
0.09000792, 1.280522, -0.1908218, 0, 0, 1, 1, 1,
0.0912099, 0.667052, 0.1064827, 1, 0, 0, 1, 1,
0.09193192, -0.896993, 4.716643, 1, 0, 0, 1, 1,
0.09209636, -0.9905906, 3.736322, 1, 0, 0, 1, 1,
0.09700959, -1.064531, 2.096374, 1, 0, 0, 1, 1,
0.1016693, -0.38924, 3.117096, 1, 0, 0, 1, 1,
0.1051338, -0.06748334, 3.173707, 0, 0, 0, 1, 1,
0.1097095, 1.251852, 0.2263053, 0, 0, 0, 1, 1,
0.1100128, 0.6052595, -0.5585316, 0, 0, 0, 1, 1,
0.1108224, 0.9248285, -1.059633, 0, 0, 0, 1, 1,
0.112175, -1.234284, 2.25881, 0, 0, 0, 1, 1,
0.1128279, -1.153455, 3.783538, 0, 0, 0, 1, 1,
0.1141868, -2.333079, 3.351773, 0, 0, 0, 1, 1,
0.1169566, -1.724693, 4.158785, 1, 1, 1, 1, 1,
0.1222058, -0.9478229, 1.010488, 1, 1, 1, 1, 1,
0.1234614, -0.1419124, 2.766319, 1, 1, 1, 1, 1,
0.1306598, -0.5642686, 2.452927, 1, 1, 1, 1, 1,
0.1316106, -1.096233, 2.16384, 1, 1, 1, 1, 1,
0.1331114, -0.1579484, 0.7419974, 1, 1, 1, 1, 1,
0.1335967, 0.8151823, 0.4412591, 1, 1, 1, 1, 1,
0.1345338, 1.629028, -0.5317789, 1, 1, 1, 1, 1,
0.1357429, -0.9663364, 3.069435, 1, 1, 1, 1, 1,
0.1412586, -1.641473, 3.066261, 1, 1, 1, 1, 1,
0.1445362, 1.404217, 0.4871807, 1, 1, 1, 1, 1,
0.1475102, -1.043068, 3.760675, 1, 1, 1, 1, 1,
0.1482145, -0.8587989, 2.636246, 1, 1, 1, 1, 1,
0.1604644, 0.8662844, 0.9637236, 1, 1, 1, 1, 1,
0.1614887, -0.9869002, 3.904071, 1, 1, 1, 1, 1,
0.1615794, -1.894584, 3.904273, 0, 0, 1, 1, 1,
0.1642035, 0.2700881, 2.092632, 1, 0, 0, 1, 1,
0.164225, 1.110585, -0.148023, 1, 0, 0, 1, 1,
0.1642324, -0.4768352, 2.180143, 1, 0, 0, 1, 1,
0.1674041, 1.412826, 0.806482, 1, 0, 0, 1, 1,
0.1675086, -0.06447224, 2.011516, 1, 0, 0, 1, 1,
0.1676648, 0.2376704, -0.2972448, 0, 0, 0, 1, 1,
0.1721143, -0.02418629, 2.342308, 0, 0, 0, 1, 1,
0.181058, -1.684542, 1.711131, 0, 0, 0, 1, 1,
0.1814165, 1.06347, -1.72419, 0, 0, 0, 1, 1,
0.1872528, 0.3659883, 0.9706082, 0, 0, 0, 1, 1,
0.1875408, -0.1575909, 3.169554, 0, 0, 0, 1, 1,
0.1890667, 2.169166, -0.2065, 0, 0, 0, 1, 1,
0.1928903, 1.985358, 0.7234365, 1, 1, 1, 1, 1,
0.1983091, 0.792226, -0.2271295, 1, 1, 1, 1, 1,
0.2017666, 0.4427999, 0.8592509, 1, 1, 1, 1, 1,
0.2041261, -0.4856825, 3.482263, 1, 1, 1, 1, 1,
0.2073119, -2.257987, 3.101672, 1, 1, 1, 1, 1,
0.2165234, 0.5074869, 2.314091, 1, 1, 1, 1, 1,
0.217341, 0.8588354, -1.654889, 1, 1, 1, 1, 1,
0.2186986, -0.3551408, 4.778129, 1, 1, 1, 1, 1,
0.2199233, 1.171814, 0.3241262, 1, 1, 1, 1, 1,
0.2201644, -0.05817673, 2.092518, 1, 1, 1, 1, 1,
0.224689, -0.424949, 3.83037, 1, 1, 1, 1, 1,
0.2249103, 0.3497339, -0.2643555, 1, 1, 1, 1, 1,
0.2262532, -0.7809728, 2.606522, 1, 1, 1, 1, 1,
0.2275446, -1.302452, 4.710492, 1, 1, 1, 1, 1,
0.2311892, -1.11731, 2.150505, 1, 1, 1, 1, 1,
0.2320079, -0.01970868, 0.7580222, 0, 0, 1, 1, 1,
0.2320441, 0.03381416, 2.00789, 1, 0, 0, 1, 1,
0.2332943, 0.4550197, -1.405469, 1, 0, 0, 1, 1,
0.2355016, 1.688244, 0.8591642, 1, 0, 0, 1, 1,
0.2355278, -1.08948, 3.477341, 1, 0, 0, 1, 1,
0.2384419, 0.3075214, 1.273184, 1, 0, 0, 1, 1,
0.2387716, -0.9218918, 3.106406, 0, 0, 0, 1, 1,
0.2396892, 1.882855, 1.299507, 0, 0, 0, 1, 1,
0.2411294, -2.667403, 3.349116, 0, 0, 0, 1, 1,
0.241883, 2.652354, 1.056588, 0, 0, 0, 1, 1,
0.2421103, -0.3999942, 3.772304, 0, 0, 0, 1, 1,
0.2426611, -0.94946, 1.716567, 0, 0, 0, 1, 1,
0.2449154, -1.507489, 2.322217, 0, 0, 0, 1, 1,
0.2457271, 0.6331632, -0.3316959, 1, 1, 1, 1, 1,
0.2486987, 0.4128711, 2.803989, 1, 1, 1, 1, 1,
0.2493787, 0.4255069, 1.333965, 1, 1, 1, 1, 1,
0.2522033, 0.05772317, 3.046513, 1, 1, 1, 1, 1,
0.2524282, 0.4384356, -1.032519, 1, 1, 1, 1, 1,
0.2611097, -0.4904838, 2.779331, 1, 1, 1, 1, 1,
0.2648282, 1.690662, 0.100688, 1, 1, 1, 1, 1,
0.2661434, -0.2153371, 2.532537, 1, 1, 1, 1, 1,
0.2701964, 1.138981, 1.286087, 1, 1, 1, 1, 1,
0.2708893, -0.412584, 1.266879, 1, 1, 1, 1, 1,
0.2716326, -1.453218, 2.556956, 1, 1, 1, 1, 1,
0.271638, -1.483072, 1.692867, 1, 1, 1, 1, 1,
0.2729962, 0.8368766, -0.570549, 1, 1, 1, 1, 1,
0.2731339, 0.1648261, 2.201604, 1, 1, 1, 1, 1,
0.2766552, 0.6860732, 2.306226, 1, 1, 1, 1, 1,
0.2775442, 0.1231625, 2.204972, 0, 0, 1, 1, 1,
0.2821257, -0.5244318, 3.85067, 1, 0, 0, 1, 1,
0.2826921, -0.1758977, 3.025214, 1, 0, 0, 1, 1,
0.2838573, 0.7374009, 2.190272, 1, 0, 0, 1, 1,
0.2849854, 3.383652, 0.6590685, 1, 0, 0, 1, 1,
0.2850297, -0.5400993, 0.7018748, 1, 0, 0, 1, 1,
0.2869392, -0.429273, 3.13816, 0, 0, 0, 1, 1,
0.2949222, 1.682357, -1.622544, 0, 0, 0, 1, 1,
0.3055398, 0.3979872, 1.099239, 0, 0, 0, 1, 1,
0.3057894, -0.9895769, 3.579896, 0, 0, 0, 1, 1,
0.3076252, -0.195613, 0.2116196, 0, 0, 0, 1, 1,
0.3127911, 0.136253, 0.4785471, 0, 0, 0, 1, 1,
0.3144647, -0.003197909, 2.020184, 0, 0, 0, 1, 1,
0.3161075, 0.01679518, 3.272219, 1, 1, 1, 1, 1,
0.3208773, 0.3992177, -0.330005, 1, 1, 1, 1, 1,
0.3263653, -2.769257, 3.914285, 1, 1, 1, 1, 1,
0.3309605, -1.601855, 3.156661, 1, 1, 1, 1, 1,
0.3323756, 0.9453236, 2.16562, 1, 1, 1, 1, 1,
0.3327382, 0.5737614, 1.107208, 1, 1, 1, 1, 1,
0.3331267, 0.5938163, 1.591449, 1, 1, 1, 1, 1,
0.3352888, 2.217478, -0.1048851, 1, 1, 1, 1, 1,
0.3368112, 0.1636916, 0.9708806, 1, 1, 1, 1, 1,
0.3419246, -1.356272, 3.314721, 1, 1, 1, 1, 1,
0.3422812, 0.5709598, 1.222361, 1, 1, 1, 1, 1,
0.3425683, 0.9104349, -1.735136, 1, 1, 1, 1, 1,
0.3435258, 1.808565, 0.02694668, 1, 1, 1, 1, 1,
0.3464362, -1.398906, 2.683382, 1, 1, 1, 1, 1,
0.3474994, -0.66239, 1.083556, 1, 1, 1, 1, 1,
0.3487483, -0.01325251, 0.6813474, 0, 0, 1, 1, 1,
0.3602992, -0.51153, 2.668133, 1, 0, 0, 1, 1,
0.3706206, -1.261848, 4.33267, 1, 0, 0, 1, 1,
0.3769941, 1.417404, -0.01124621, 1, 0, 0, 1, 1,
0.3782391, 0.01241907, 0.4439265, 1, 0, 0, 1, 1,
0.3798226, -0.2539515, 2.600854, 1, 0, 0, 1, 1,
0.3802462, 1.49316, 0.419448, 0, 0, 0, 1, 1,
0.3803181, -0.4237025, 2.121359, 0, 0, 0, 1, 1,
0.3835876, -0.2294597, 3.273466, 0, 0, 0, 1, 1,
0.3847004, 0.1200053, 1.184276, 0, 0, 0, 1, 1,
0.3857059, -0.346722, 2.314931, 0, 0, 0, 1, 1,
0.3858677, 1.358649, -0.5489522, 0, 0, 0, 1, 1,
0.3864935, -0.9845695, 2.323674, 0, 0, 0, 1, 1,
0.3898901, 0.3579632, 1.381376, 1, 1, 1, 1, 1,
0.3958324, -0.2845728, 3.022534, 1, 1, 1, 1, 1,
0.3989357, 1.852747, 0.4404233, 1, 1, 1, 1, 1,
0.3996239, -0.3951678, 2.486928, 1, 1, 1, 1, 1,
0.4048121, 0.02746876, 2.176066, 1, 1, 1, 1, 1,
0.4117376, 0.8055462, -0.6941676, 1, 1, 1, 1, 1,
0.4214801, -1.779423, 3.733244, 1, 1, 1, 1, 1,
0.4332907, -0.3604436, 0.4336143, 1, 1, 1, 1, 1,
0.4340074, 0.1424561, 1.062638, 1, 1, 1, 1, 1,
0.4386795, -2.297214, 1.874028, 1, 1, 1, 1, 1,
0.45037, -0.7118917, 1.159075, 1, 1, 1, 1, 1,
0.4504491, -0.04169497, 1.993901, 1, 1, 1, 1, 1,
0.4504685, 0.1571543, -1.190275, 1, 1, 1, 1, 1,
0.4539922, -0.05131626, 1.853647, 1, 1, 1, 1, 1,
0.4548518, 1.282915, -1.292386, 1, 1, 1, 1, 1,
0.4550047, -1.897562, 1.241183, 0, 0, 1, 1, 1,
0.4550885, -0.9665148, 1.543701, 1, 0, 0, 1, 1,
0.4580271, 0.3052568, 0.590386, 1, 0, 0, 1, 1,
0.4587305, 0.1622665, 0.8418213, 1, 0, 0, 1, 1,
0.4592761, 1.442853, 0.05101105, 1, 0, 0, 1, 1,
0.4603941, -0.001860813, -0.0413081, 1, 0, 0, 1, 1,
0.4609122, -1.221716, 2.999362, 0, 0, 0, 1, 1,
0.4611471, -0.04419984, 2.464624, 0, 0, 0, 1, 1,
0.467114, -0.4362097, 2.888412, 0, 0, 0, 1, 1,
0.4689879, -0.1996938, 4.10991, 0, 0, 0, 1, 1,
0.4705882, 0.7397617, 0.8322883, 0, 0, 0, 1, 1,
0.4829151, -1.210214, 2.748714, 0, 0, 0, 1, 1,
0.4858638, 0.02619949, 1.030836, 0, 0, 0, 1, 1,
0.4882023, -1.583212, 4.054811, 1, 1, 1, 1, 1,
0.4943757, -2.405227, 2.848968, 1, 1, 1, 1, 1,
0.4987117, 0.1169973, 0.9680012, 1, 1, 1, 1, 1,
0.5004263, 0.6396026, 0.616771, 1, 1, 1, 1, 1,
0.5034386, 0.09673391, 0.9819764, 1, 1, 1, 1, 1,
0.5065713, 0.3869984, 0.4271112, 1, 1, 1, 1, 1,
0.5105454, 0.6215872, 0.4564877, 1, 1, 1, 1, 1,
0.5127546, -0.4024741, 1.877325, 1, 1, 1, 1, 1,
0.5144778, -0.7027316, 2.064478, 1, 1, 1, 1, 1,
0.5160519, -0.993365, 3.861994, 1, 1, 1, 1, 1,
0.5166546, -0.698405, -0.7947201, 1, 1, 1, 1, 1,
0.5167138, -0.5890135, 3.101527, 1, 1, 1, 1, 1,
0.5193741, -0.177835, 2.144978, 1, 1, 1, 1, 1,
0.5198896, -1.169267, 3.768913, 1, 1, 1, 1, 1,
0.5205937, 0.4328725, 0.2541246, 1, 1, 1, 1, 1,
0.5237038, 0.1162676, 0.9148685, 0, 0, 1, 1, 1,
0.5266914, 2.016946, -0.5315174, 1, 0, 0, 1, 1,
0.5286586, 1.287081, 0.1865503, 1, 0, 0, 1, 1,
0.5428033, 0.02013959, 0.7374386, 1, 0, 0, 1, 1,
0.5451916, -0.477987, 2.899802, 1, 0, 0, 1, 1,
0.5454179, 1.185384, 2.100624, 1, 0, 0, 1, 1,
0.5474786, 1.144892, -0.2074811, 0, 0, 0, 1, 1,
0.5524879, 1.267844, 1.15296, 0, 0, 0, 1, 1,
0.5575389, -0.8763702, 1.316568, 0, 0, 0, 1, 1,
0.5588467, 1.000494, -0.3486666, 0, 0, 0, 1, 1,
0.5603085, -2.856021, 1.519092, 0, 0, 0, 1, 1,
0.5625064, -1.898495, 1.976641, 0, 0, 0, 1, 1,
0.5660485, 1.349488, -0.7338017, 0, 0, 0, 1, 1,
0.5682843, -1.543025, 2.794053, 1, 1, 1, 1, 1,
0.5700374, -0.256099, 1.731084, 1, 1, 1, 1, 1,
0.5770774, 1.004139, -0.5863416, 1, 1, 1, 1, 1,
0.5797747, -0.456499, 1.394784, 1, 1, 1, 1, 1,
0.5818725, -0.4759715, 3.393969, 1, 1, 1, 1, 1,
0.5839044, -0.6990877, 3.323024, 1, 1, 1, 1, 1,
0.5850884, -1.015129, 1.60419, 1, 1, 1, 1, 1,
0.5853343, -1.286419, 3.248279, 1, 1, 1, 1, 1,
0.5866229, -0.5944467, 3.188693, 1, 1, 1, 1, 1,
0.5912424, -0.6361105, 2.215786, 1, 1, 1, 1, 1,
0.5952556, -0.6193487, 4.016206, 1, 1, 1, 1, 1,
0.6092805, 0.2831475, 2.295093, 1, 1, 1, 1, 1,
0.6121021, -0.456482, 2.920026, 1, 1, 1, 1, 1,
0.6122738, 0.255538, 0.03283037, 1, 1, 1, 1, 1,
0.6158974, -0.6351914, 1.947016, 1, 1, 1, 1, 1,
0.6192962, -0.8720052, 3.121243, 0, 0, 1, 1, 1,
0.619302, -0.05677714, 1.190965, 1, 0, 0, 1, 1,
0.6195102, -0.8608279, 1.754945, 1, 0, 0, 1, 1,
0.6198251, -1.245035, 3.130872, 1, 0, 0, 1, 1,
0.6204244, -0.4627878, 2.921297, 1, 0, 0, 1, 1,
0.6269092, -0.7575372, 3.678762, 1, 0, 0, 1, 1,
0.6282211, 1.83245, -0.6698186, 0, 0, 0, 1, 1,
0.6294203, -0.2833228, 1.466854, 0, 0, 0, 1, 1,
0.6335234, 0.3172647, 1.198684, 0, 0, 0, 1, 1,
0.6365119, -1.24935, 4.376938, 0, 0, 0, 1, 1,
0.6417172, -0.6452096, 0.3722869, 0, 0, 0, 1, 1,
0.6439426, 0.8910972, 0.1339389, 0, 0, 0, 1, 1,
0.6452824, 0.5880383, -0.4970994, 0, 0, 0, 1, 1,
0.6483753, -0.9770024, 1.630258, 1, 1, 1, 1, 1,
0.6514098, 1.027477, 0.8422615, 1, 1, 1, 1, 1,
0.652829, -0.5255787, 2.524989, 1, 1, 1, 1, 1,
0.6545574, -0.8245001, 3.452371, 1, 1, 1, 1, 1,
0.6554404, -0.240656, 2.25518, 1, 1, 1, 1, 1,
0.6555014, -0.8837572, 2.681434, 1, 1, 1, 1, 1,
0.6638423, -0.9703214, 2.790281, 1, 1, 1, 1, 1,
0.6648682, -1.382955, 2.733741, 1, 1, 1, 1, 1,
0.6704229, -0.2889757, 1.759532, 1, 1, 1, 1, 1,
0.670785, 0.4012849, 1.842481, 1, 1, 1, 1, 1,
0.6735816, 0.3882201, 0.9518488, 1, 1, 1, 1, 1,
0.6750503, -0.8750622, 3.348473, 1, 1, 1, 1, 1,
0.6792586, 0.3454058, 2.860942, 1, 1, 1, 1, 1,
0.6826299, -0.6456025, 2.803183, 1, 1, 1, 1, 1,
0.6850457, 1.273703, 0.6630892, 1, 1, 1, 1, 1,
0.6924994, 1.620345, -0.5735974, 0, 0, 1, 1, 1,
0.6979487, 0.209874, 0.6236815, 1, 0, 0, 1, 1,
0.6989489, -0.1960533, 2.478825, 1, 0, 0, 1, 1,
0.7018028, 0.7950658, 1.374437, 1, 0, 0, 1, 1,
0.7032967, -0.3838303, 2.428878, 1, 0, 0, 1, 1,
0.7085236, -2.740764, 4.400294, 1, 0, 0, 1, 1,
0.7145771, -0.367265, 4.884683, 0, 0, 0, 1, 1,
0.7179295, 0.4884463, 0.5793363, 0, 0, 0, 1, 1,
0.7236049, 0.08861662, 1.240529, 0, 0, 0, 1, 1,
0.7237928, 1.311121, 0.1798777, 0, 0, 0, 1, 1,
0.7257966, 0.07203254, 1.439523, 0, 0, 0, 1, 1,
0.7269672, -1.596811, 3.615872, 0, 0, 0, 1, 1,
0.7284228, 0.4681538, 2.719526, 0, 0, 0, 1, 1,
0.7303823, 0.9386636, 0.2436484, 1, 1, 1, 1, 1,
0.7325786, 0.5547841, 0.6946981, 1, 1, 1, 1, 1,
0.7379238, -0.237473, 2.836857, 1, 1, 1, 1, 1,
0.7400072, 0.4094167, 0.9667286, 1, 1, 1, 1, 1,
0.7409495, -0.549648, 2.264916, 1, 1, 1, 1, 1,
0.7450202, -1.052178, 2.601326, 1, 1, 1, 1, 1,
0.762446, 1.953415, -0.2215544, 1, 1, 1, 1, 1,
0.7641809, 1.484102, -0.7472821, 1, 1, 1, 1, 1,
0.7682749, 0.2066101, 0.9637526, 1, 1, 1, 1, 1,
0.7699576, -0.2732554, 1.730567, 1, 1, 1, 1, 1,
0.7715589, -1.726833, 1.937766, 1, 1, 1, 1, 1,
0.7747046, -1.234421, 1.642041, 1, 1, 1, 1, 1,
0.775169, -0.9141155, 2.092596, 1, 1, 1, 1, 1,
0.784044, 0.5406895, 3.114152, 1, 1, 1, 1, 1,
0.7857628, -0.6919985, 1.577712, 1, 1, 1, 1, 1,
0.7861009, 0.8460302, 1.509423, 0, 0, 1, 1, 1,
0.7865039, 0.3471376, 1.066038, 1, 0, 0, 1, 1,
0.7871814, -0.6764827, 1.600757, 1, 0, 0, 1, 1,
0.7892315, -0.4331711, 3.290294, 1, 0, 0, 1, 1,
0.7902903, -1.11865, 1.890594, 1, 0, 0, 1, 1,
0.7904928, -0.6850203, 2.613427, 1, 0, 0, 1, 1,
0.7923621, -0.7684512, 1.629185, 0, 0, 0, 1, 1,
0.7998081, 0.5892436, -0.4456083, 0, 0, 0, 1, 1,
0.8002226, 0.3208305, 0.3350983, 0, 0, 0, 1, 1,
0.800354, -0.05701165, 2.46677, 0, 0, 0, 1, 1,
0.8029513, 1.459988, 1.317419, 0, 0, 0, 1, 1,
0.8054149, 1.788162, -1.377239, 0, 0, 0, 1, 1,
0.8068713, -0.3856261, 3.513878, 0, 0, 0, 1, 1,
0.8078071, -0.8573523, 2.979584, 1, 1, 1, 1, 1,
0.81231, -0.6360589, 2.530121, 1, 1, 1, 1, 1,
0.815936, 0.7649242, 0.2188633, 1, 1, 1, 1, 1,
0.8160751, -1.042041, 1.570463, 1, 1, 1, 1, 1,
0.8214581, -0.0544837, 1.50335, 1, 1, 1, 1, 1,
0.8239977, 0.6496654, 2.044446, 1, 1, 1, 1, 1,
0.8271824, -0.07434686, 0.9685195, 1, 1, 1, 1, 1,
0.8462498, -0.497287, 3.433299, 1, 1, 1, 1, 1,
0.8634795, -1.702644, 2.346601, 1, 1, 1, 1, 1,
0.866742, -0.713702, 2.792193, 1, 1, 1, 1, 1,
0.8709074, 0.3833665, 2.169572, 1, 1, 1, 1, 1,
0.871788, 0.2808443, 1.910996, 1, 1, 1, 1, 1,
0.8728935, 0.7403339, 1.054265, 1, 1, 1, 1, 1,
0.8738104, 1.369641, 0.1622921, 1, 1, 1, 1, 1,
0.8782514, 0.3038579, 1.842034, 1, 1, 1, 1, 1,
0.8815105, 0.1846917, 0.46879, 0, 0, 1, 1, 1,
0.8825426, 1.100939, 1.097176, 1, 0, 0, 1, 1,
0.8872637, 0.1584251, 1.970726, 1, 0, 0, 1, 1,
0.8887808, -0.08171985, 1.958907, 1, 0, 0, 1, 1,
0.8895028, -0.4816353, 2.610772, 1, 0, 0, 1, 1,
0.8927893, -0.8886893, 3.155644, 1, 0, 0, 1, 1,
0.8973098, 1.554571, -0.5317912, 0, 0, 0, 1, 1,
0.908459, -0.9742776, 3.282772, 0, 0, 0, 1, 1,
0.9137943, -0.01845884, 2.103536, 0, 0, 0, 1, 1,
0.9152067, -1.852302, 2.242194, 0, 0, 0, 1, 1,
0.918916, 0.6602046, -0.9203678, 0, 0, 0, 1, 1,
0.9263518, -0.3698056, 0.9586686, 0, 0, 0, 1, 1,
0.9325362, 0.6040043, 1.31946, 0, 0, 0, 1, 1,
0.9373063, 1.402664, 1.460661, 1, 1, 1, 1, 1,
0.9488682, -0.2899697, 0.724786, 1, 1, 1, 1, 1,
0.9491098, 1.871307, -0.08494323, 1, 1, 1, 1, 1,
0.9537168, -2.663573, 3.505564, 1, 1, 1, 1, 1,
0.9605366, -0.8182273, 2.940151, 1, 1, 1, 1, 1,
0.9628145, -1.70471, 2.317862, 1, 1, 1, 1, 1,
0.9658864, 0.07545532, 1.331482, 1, 1, 1, 1, 1,
0.971516, 0.6463872, 1.765822, 1, 1, 1, 1, 1,
0.9735756, -1.812562, 2.527682, 1, 1, 1, 1, 1,
0.977425, 0.6119567, 2.853899, 1, 1, 1, 1, 1,
0.9926052, -0.4599477, 1.862021, 1, 1, 1, 1, 1,
0.9941658, -0.3771276, 0.4975183, 1, 1, 1, 1, 1,
0.9985011, -0.9372623, 2.123148, 1, 1, 1, 1, 1,
0.9987683, -1.159396, 3.077996, 1, 1, 1, 1, 1,
1.001445, -0.287122, 2.018667, 1, 1, 1, 1, 1,
1.010473, -0.03262007, 1.415207, 0, 0, 1, 1, 1,
1.014629, 0.02806593, 1.816616, 1, 0, 0, 1, 1,
1.015106, -0.1967262, 1.046124, 1, 0, 0, 1, 1,
1.015223, -2.371273, 3.644729, 1, 0, 0, 1, 1,
1.016088, 0.9182273, 0.4014125, 1, 0, 0, 1, 1,
1.019026, -0.8584541, 2.081735, 1, 0, 0, 1, 1,
1.019345, -0.735948, 2.463738, 0, 0, 0, 1, 1,
1.024679, -0.2122786, 1.418585, 0, 0, 0, 1, 1,
1.024783, 0.389602, -0.1375739, 0, 0, 0, 1, 1,
1.025952, 1.327913, -0.7781689, 0, 0, 0, 1, 1,
1.026761, -1.256504, 0.9170398, 0, 0, 0, 1, 1,
1.033642, 1.194021, 0.4879745, 0, 0, 0, 1, 1,
1.043056, -0.1862442, 1.192136, 0, 0, 0, 1, 1,
1.060102, -1.04869, 3.070101, 1, 1, 1, 1, 1,
1.068736, -0.9283727, 1.85636, 1, 1, 1, 1, 1,
1.069228, -0.5929742, 1.096029, 1, 1, 1, 1, 1,
1.069467, -0.1757445, 1.781735, 1, 1, 1, 1, 1,
1.069773, 0.8054559, 2.111043, 1, 1, 1, 1, 1,
1.073931, -0.4491649, 2.027302, 1, 1, 1, 1, 1,
1.075464, -0.842865, 0.9874666, 1, 1, 1, 1, 1,
1.077918, -0.02168695, 0.562889, 1, 1, 1, 1, 1,
1.087288, 0.1080472, 1.137423, 1, 1, 1, 1, 1,
1.087815, -1.457243, 2.02477, 1, 1, 1, 1, 1,
1.091561, -1.849538, 3.967553, 1, 1, 1, 1, 1,
1.09186, 0.1434094, 1.220565, 1, 1, 1, 1, 1,
1.092637, 1.115902, 1.630729, 1, 1, 1, 1, 1,
1.104635, 0.5732408, 1.537945, 1, 1, 1, 1, 1,
1.107036, -1.099432, 2.834312, 1, 1, 1, 1, 1,
1.110353, -0.02799092, 2.69494, 0, 0, 1, 1, 1,
1.111293, 1.5904, -1.161346, 1, 0, 0, 1, 1,
1.119438, 0.3338672, 2.526468, 1, 0, 0, 1, 1,
1.132638, 0.2505789, 0.01376447, 1, 0, 0, 1, 1,
1.137708, -0.05290886, 1.316658, 1, 0, 0, 1, 1,
1.14075, 2.04161, 0.1953486, 1, 0, 0, 1, 1,
1.143118, -0.2545406, 0.9892221, 0, 0, 0, 1, 1,
1.14822, 0.4772406, 1.473933, 0, 0, 0, 1, 1,
1.153705, -1.841569, 2.846018, 0, 0, 0, 1, 1,
1.161061, -1.300179, 3.195482, 0, 0, 0, 1, 1,
1.163154, -1.182171, 1.33321, 0, 0, 0, 1, 1,
1.169453, 1.017666, 1.034396, 0, 0, 0, 1, 1,
1.17397, -0.6143975, 0.521116, 0, 0, 0, 1, 1,
1.177622, 0.2087287, 0.09366958, 1, 1, 1, 1, 1,
1.182077, 0.004674571, 1.0814, 1, 1, 1, 1, 1,
1.193974, -1.098765, 1.701025, 1, 1, 1, 1, 1,
1.197162, -2.223829, 2.157463, 1, 1, 1, 1, 1,
1.19895, -0.7374964, 2.204498, 1, 1, 1, 1, 1,
1.210058, -0.9615808, 2.086566, 1, 1, 1, 1, 1,
1.21495, 0.536578, 2.052284, 1, 1, 1, 1, 1,
1.215593, -2.653323, 2.016954, 1, 1, 1, 1, 1,
1.219162, 0.6174447, 1.993928, 1, 1, 1, 1, 1,
1.220195, 0.1729009, 2.593672, 1, 1, 1, 1, 1,
1.226298, -0.3994378, 1.639281, 1, 1, 1, 1, 1,
1.231958, 0.2427192, 1.787852, 1, 1, 1, 1, 1,
1.243745, 0.5803347, 1.189508, 1, 1, 1, 1, 1,
1.247341, 0.5888023, 1.949799, 1, 1, 1, 1, 1,
1.250892, -0.04108778, 0.6598949, 1, 1, 1, 1, 1,
1.259391, -0.2641902, 3.193138, 0, 0, 1, 1, 1,
1.271902, 0.8663898, 2.038508, 1, 0, 0, 1, 1,
1.272743, -1.087817, 1.554092, 1, 0, 0, 1, 1,
1.273232, -0.8551261, 2.168488, 1, 0, 0, 1, 1,
1.278517, 0.5810503, 1.629737, 1, 0, 0, 1, 1,
1.295661, 1.19303, 2.178818, 1, 0, 0, 1, 1,
1.295706, -2.419457, 2.724618, 0, 0, 0, 1, 1,
1.302405, -0.9363979, 2.193336, 0, 0, 0, 1, 1,
1.302618, -1.11698, 1.452313, 0, 0, 0, 1, 1,
1.307373, 1.936398, 0.7570239, 0, 0, 0, 1, 1,
1.31916, -0.1619283, 4.52674, 0, 0, 0, 1, 1,
1.327401, 0.1274223, 2.344857, 0, 0, 0, 1, 1,
1.351067, 0.6777421, 1.003169, 0, 0, 0, 1, 1,
1.361889, -0.731173, 2.641843, 1, 1, 1, 1, 1,
1.366481, 0.1511034, 3.24364, 1, 1, 1, 1, 1,
1.373305, 1.811741, -1.03878, 1, 1, 1, 1, 1,
1.380603, -0.9193929, 2.839496, 1, 1, 1, 1, 1,
1.388378, -1.167245, -0.6769056, 1, 1, 1, 1, 1,
1.395714, -0.1186617, 0.5514556, 1, 1, 1, 1, 1,
1.398205, 0.6212536, -0.3647322, 1, 1, 1, 1, 1,
1.398221, 1.153337, -0.2912204, 1, 1, 1, 1, 1,
1.406621, -1.837227, 4.00324, 1, 1, 1, 1, 1,
1.412139, 1.05048, -0.4972609, 1, 1, 1, 1, 1,
1.414483, 0.5561407, -0.8437626, 1, 1, 1, 1, 1,
1.416115, 0.4025895, 0.4445444, 1, 1, 1, 1, 1,
1.416234, 0.8250577, -0.8789591, 1, 1, 1, 1, 1,
1.423502, -1.21488, 2.965959, 1, 1, 1, 1, 1,
1.42854, -0.1140287, 3.395017, 1, 1, 1, 1, 1,
1.435718, 0.1492456, 0.8850945, 0, 0, 1, 1, 1,
1.436912, 0.6320984, -0.8812862, 1, 0, 0, 1, 1,
1.43925, 0.9089099, 1.361716, 1, 0, 0, 1, 1,
1.45689, -1.246609, 1.610083, 1, 0, 0, 1, 1,
1.458474, -0.4490263, 1.116976, 1, 0, 0, 1, 1,
1.483077, -0.6323786, 1.43524, 1, 0, 0, 1, 1,
1.484985, -1.056216, 0.7954431, 0, 0, 0, 1, 1,
1.491546, 0.2317416, -0.07467543, 0, 0, 0, 1, 1,
1.493366, 0.003598041, 1.845372, 0, 0, 0, 1, 1,
1.505195, 0.1246581, -1.136209, 0, 0, 0, 1, 1,
1.515255, -2.35056, 2.142718, 0, 0, 0, 1, 1,
1.526788, 0.1647063, 1.086664, 0, 0, 0, 1, 1,
1.530025, 0.2394385, 1.441847, 0, 0, 0, 1, 1,
1.53891, 1.849213, 1.111678, 1, 1, 1, 1, 1,
1.544927, -0.9732768, 0.708282, 1, 1, 1, 1, 1,
1.552556, 0.5391928, 1.692621, 1, 1, 1, 1, 1,
1.571086, 0.9457256, -1.447738, 1, 1, 1, 1, 1,
1.571992, -0.5552453, 0.6953382, 1, 1, 1, 1, 1,
1.576656, -0.7814988, 2.646123, 1, 1, 1, 1, 1,
1.585624, 0.4515989, 1.380339, 1, 1, 1, 1, 1,
1.58814, -1.452865, 2.493117, 1, 1, 1, 1, 1,
1.611944, -1.293928, 2.241258, 1, 1, 1, 1, 1,
1.623589, -0.1471875, -0.1940659, 1, 1, 1, 1, 1,
1.631336, 0.9140295, 2.057799, 1, 1, 1, 1, 1,
1.634937, -0.3246747, 2.533479, 1, 1, 1, 1, 1,
1.640622, -0.2241222, 2.286142, 1, 1, 1, 1, 1,
1.644508, -0.1874181, 0.976106, 1, 1, 1, 1, 1,
1.653832, -0.9151617, 2.234568, 1, 1, 1, 1, 1,
1.660386, -1.886124, 3.039514, 0, 0, 1, 1, 1,
1.662527, 0.9732196, 3.065362, 1, 0, 0, 1, 1,
1.675428, -1.985403, 3.352802, 1, 0, 0, 1, 1,
1.677718, -0.06641456, 2.157953, 1, 0, 0, 1, 1,
1.683909, -0.1701986, 2.328722, 1, 0, 0, 1, 1,
1.696576, 0.7060969, -0.09663242, 1, 0, 0, 1, 1,
1.701308, -1.00492, 2.50901, 0, 0, 0, 1, 1,
1.703167, -0.9719875, 2.15708, 0, 0, 0, 1, 1,
1.714506, 0.2716203, 0.6992477, 0, 0, 0, 1, 1,
1.724906, -0.2714573, 1.984683, 0, 0, 0, 1, 1,
1.736376, -1.037149, 1.772176, 0, 0, 0, 1, 1,
1.762603, 0.4698223, 0.6944578, 0, 0, 0, 1, 1,
1.762866, 1.430627, 0.7870443, 0, 0, 0, 1, 1,
1.783407, 0.2581981, 3.646915, 1, 1, 1, 1, 1,
1.785899, 1.381966, 0.7009824, 1, 1, 1, 1, 1,
1.787414, -0.8317606, 3.154551, 1, 1, 1, 1, 1,
1.793831, -1.754345, 2.842088, 1, 1, 1, 1, 1,
1.823124, -1.175272, 2.81252, 1, 1, 1, 1, 1,
1.842231, 0.05180518, 1.077048, 1, 1, 1, 1, 1,
1.858287, 0.7443077, 2.252923, 1, 1, 1, 1, 1,
1.871015, 0.2794743, 0.432119, 1, 1, 1, 1, 1,
1.876569, 1.177249, 0.969088, 1, 1, 1, 1, 1,
1.901652, -0.8562397, 2.644798, 1, 1, 1, 1, 1,
1.910565, -0.4599773, 3.886179, 1, 1, 1, 1, 1,
1.912743, -0.423582, 2.616613, 1, 1, 1, 1, 1,
1.96056, -0.755661, 0.3130713, 1, 1, 1, 1, 1,
1.986491, -0.6853328, 1.906482, 1, 1, 1, 1, 1,
1.997433, -0.4297405, 1.285592, 1, 1, 1, 1, 1,
2.026132, -2.05964, 1.410103, 0, 0, 1, 1, 1,
2.049841, 0.7419158, 1.499704, 1, 0, 0, 1, 1,
2.077405, 0.1737139, 1.204188, 1, 0, 0, 1, 1,
2.080465, -0.0116103, 1.095567, 1, 0, 0, 1, 1,
2.114723, -0.1569787, 3.37725, 1, 0, 0, 1, 1,
2.117756, 1.250804, 0.1049481, 1, 0, 0, 1, 1,
2.128508, 0.5523299, 2.658417, 0, 0, 0, 1, 1,
2.181089, 2.756313, 0.938194, 0, 0, 0, 1, 1,
2.204604, -0.5192727, -0.2357088, 0, 0, 0, 1, 1,
2.236639, 0.1423582, 1.949824, 0, 0, 0, 1, 1,
2.299543, -1.511047, 1.467359, 0, 0, 0, 1, 1,
2.483713, -0.0190597, -0.05408921, 0, 0, 0, 1, 1,
2.488561, -1.067562, 3.306837, 0, 0, 0, 1, 1,
2.531826, -0.9340999, 1.106018, 1, 1, 1, 1, 1,
2.714073, 0.4144125, 0.2258087, 1, 1, 1, 1, 1,
2.731425, 0.1678029, 2.680237, 1, 1, 1, 1, 1,
2.795712, -0.09705499, 1.31066, 1, 1, 1, 1, 1,
2.871554, -0.9891376, 1.518066, 1, 1, 1, 1, 1,
3.100571, -1.51217, 0.6819417, 1, 1, 1, 1, 1,
3.325543, 0.3953562, 1.513301, 1, 1, 1, 1, 1
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
var radius = 9.729203;
var distance = 34.17341;
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
mvMatrix.translate( -0.2407372, -0.2638156, -0.05203247 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.17341);
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
