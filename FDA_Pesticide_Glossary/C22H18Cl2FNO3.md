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
-3.178625, 0.1644071, -1.608339, 1, 0, 0, 1,
-3.160712, 1.307714, 0.3585568, 1, 0.007843138, 0, 1,
-2.704443, -1.630022, -0.7469606, 1, 0.01176471, 0, 1,
-2.65476, 1.713269, -1.145805, 1, 0.01960784, 0, 1,
-2.582708, -0.686416, -3.178324, 1, 0.02352941, 0, 1,
-2.513585, 0.7258483, -0.621085, 1, 0.03137255, 0, 1,
-2.448878, -0.3903437, -2.051999, 1, 0.03529412, 0, 1,
-2.422414, -0.5086816, -2.464442, 1, 0.04313726, 0, 1,
-2.41184, 0.109907, -1.900218, 1, 0.04705882, 0, 1,
-2.268334, -0.4230974, -1.28999, 1, 0.05490196, 0, 1,
-2.234692, -1.233535, -2.098711, 1, 0.05882353, 0, 1,
-2.187381, 0.3295511, -0.7608207, 1, 0.06666667, 0, 1,
-2.161098, 1.463688, -1.122005, 1, 0.07058824, 0, 1,
-2.159646, 0.2367071, -0.1984144, 1, 0.07843138, 0, 1,
-2.150755, 0.6773793, -1.461054, 1, 0.08235294, 0, 1,
-2.143421, 0.7167997, -3.089021, 1, 0.09019608, 0, 1,
-2.142547, 0.5276463, -0.7598791, 1, 0.09411765, 0, 1,
-2.11534, 0.9095506, -0.1459388, 1, 0.1019608, 0, 1,
-2.108444, -0.08149567, -0.4923348, 1, 0.1098039, 0, 1,
-2.097399, -0.6534325, -2.85547, 1, 0.1137255, 0, 1,
-2.076417, 0.07934147, -1.387757, 1, 0.1215686, 0, 1,
-2.075045, 0.4869923, 0.7579411, 1, 0.1254902, 0, 1,
-2.023488, 0.417728, -1.75853, 1, 0.1333333, 0, 1,
-2.003584, 0.2753914, -2.359843, 1, 0.1372549, 0, 1,
-1.984412, 0.9014916, -1.089281, 1, 0.145098, 0, 1,
-1.979981, 0.7139365, -2.133388, 1, 0.1490196, 0, 1,
-1.966287, -0.1446825, -2.189099, 1, 0.1568628, 0, 1,
-1.956861, 0.2001262, 1.07412, 1, 0.1607843, 0, 1,
-1.922966, -1.177749, -2.153042, 1, 0.1686275, 0, 1,
-1.916286, 0.5656331, -2.375095, 1, 0.172549, 0, 1,
-1.909094, -0.9023656, -2.444974, 1, 0.1803922, 0, 1,
-1.874095, 0.04876921, -0.9145587, 1, 0.1843137, 0, 1,
-1.85779, 1.261114, -1.291871, 1, 0.1921569, 0, 1,
-1.854559, 1.499671, -0.5418819, 1, 0.1960784, 0, 1,
-1.839668, -0.08582111, -1.369147, 1, 0.2039216, 0, 1,
-1.827711, 0.6219512, -2.438845, 1, 0.2117647, 0, 1,
-1.821136, -0.9267271, -2.032032, 1, 0.2156863, 0, 1,
-1.820028, -1.851412, -1.976328, 1, 0.2235294, 0, 1,
-1.805729, -0.6084659, -2.079852, 1, 0.227451, 0, 1,
-1.796491, -0.1829853, -2.060295, 1, 0.2352941, 0, 1,
-1.794627, 1.190396, -0.232352, 1, 0.2392157, 0, 1,
-1.785912, -0.8814456, -3.440578, 1, 0.2470588, 0, 1,
-1.747289, -0.987095, -2.696048, 1, 0.2509804, 0, 1,
-1.744858, 0.7054481, -0.809718, 1, 0.2588235, 0, 1,
-1.739919, -0.1009573, 0.6618692, 1, 0.2627451, 0, 1,
-1.735617, -0.453109, -0.7760835, 1, 0.2705882, 0, 1,
-1.727445, 0.4871282, -1.391601, 1, 0.2745098, 0, 1,
-1.718542, -0.6316263, -4.378769, 1, 0.282353, 0, 1,
-1.696057, 2.128224, -0.5172099, 1, 0.2862745, 0, 1,
-1.687895, 0.755765, -1.138195, 1, 0.2941177, 0, 1,
-1.682892, -1.029831, -0.1046335, 1, 0.3019608, 0, 1,
-1.671699, 0.3448402, 0.9100471, 1, 0.3058824, 0, 1,
-1.651225, -0.7999842, -2.181198, 1, 0.3137255, 0, 1,
-1.640157, -2.121258, -2.796422, 1, 0.3176471, 0, 1,
-1.635843, -1.830987, -1.782778, 1, 0.3254902, 0, 1,
-1.616587, -0.6955007, -1.528713, 1, 0.3294118, 0, 1,
-1.602125, -0.4169615, -1.963315, 1, 0.3372549, 0, 1,
-1.599781, 0.730678, -0.6545995, 1, 0.3411765, 0, 1,
-1.547675, 1.700644, -2.413176, 1, 0.3490196, 0, 1,
-1.545372, 0.1749419, -0.6031785, 1, 0.3529412, 0, 1,
-1.543769, 0.08585802, -1.602447, 1, 0.3607843, 0, 1,
-1.541078, 1.206142, -0.7097255, 1, 0.3647059, 0, 1,
-1.501467, -0.5671654, -4.115246, 1, 0.372549, 0, 1,
-1.497516, 0.02331902, -1.473752, 1, 0.3764706, 0, 1,
-1.495677, -0.09303388, -0.877523, 1, 0.3843137, 0, 1,
-1.492064, 1.549336, -0.5132286, 1, 0.3882353, 0, 1,
-1.486389, -0.8735931, -1.738288, 1, 0.3960784, 0, 1,
-1.479106, -0.3472499, -0.3557958, 1, 0.4039216, 0, 1,
-1.476743, 0.3680267, -1.108402, 1, 0.4078431, 0, 1,
-1.469974, 0.3514063, -1.530214, 1, 0.4156863, 0, 1,
-1.465324, -1.253078, -3.554879, 1, 0.4196078, 0, 1,
-1.449619, -1.615951, -1.520346, 1, 0.427451, 0, 1,
-1.43751, 1.899808, -0.947612, 1, 0.4313726, 0, 1,
-1.431663, 1.111762, -0.03873889, 1, 0.4392157, 0, 1,
-1.421297, -0.1025955, -1.0548, 1, 0.4431373, 0, 1,
-1.383908, 0.06824351, -2.348186, 1, 0.4509804, 0, 1,
-1.369301, 1.239005, -0.4562489, 1, 0.454902, 0, 1,
-1.368327, 0.464291, -2.199262, 1, 0.4627451, 0, 1,
-1.356299, 0.6294944, -1.639335, 1, 0.4666667, 0, 1,
-1.355264, 1.313065, -0.4788715, 1, 0.4745098, 0, 1,
-1.355055, -0.2360939, -4.012582, 1, 0.4784314, 0, 1,
-1.353298, -0.788996, -1.496711, 1, 0.4862745, 0, 1,
-1.33094, -0.188707, -0.9452372, 1, 0.4901961, 0, 1,
-1.320897, 0.4165618, 0.1106493, 1, 0.4980392, 0, 1,
-1.315577, 2.481827, -1.371816, 1, 0.5058824, 0, 1,
-1.314263, 0.300207, -2.400139, 1, 0.509804, 0, 1,
-1.298656, 0.1930886, -0.9135814, 1, 0.5176471, 0, 1,
-1.29726, -0.165153, -4.190856, 1, 0.5215687, 0, 1,
-1.295789, -0.4588853, -1.92967, 1, 0.5294118, 0, 1,
-1.288643, -0.590941, -2.761539, 1, 0.5333334, 0, 1,
-1.286919, 0.5942795, -0.6632445, 1, 0.5411765, 0, 1,
-1.286446, -1.894845, -1.644554, 1, 0.5450981, 0, 1,
-1.279094, -1.169423, -1.976553, 1, 0.5529412, 0, 1,
-1.278596, 0.04342398, -2.433503, 1, 0.5568628, 0, 1,
-1.272696, 0.04701242, 0.2158867, 1, 0.5647059, 0, 1,
-1.268909, 0.2293398, -0.0349676, 1, 0.5686275, 0, 1,
-1.268433, 0.7208776, -0.5960389, 1, 0.5764706, 0, 1,
-1.267064, -0.2686897, -1.444064, 1, 0.5803922, 0, 1,
-1.252532, -0.5893751, -3.286815, 1, 0.5882353, 0, 1,
-1.245222, -1.04008, -3.804698, 1, 0.5921569, 0, 1,
-1.235453, -0.680814, -0.6745378, 1, 0.6, 0, 1,
-1.228274, -1.850153, -1.802751, 1, 0.6078432, 0, 1,
-1.224855, 0.2625586, -2.538295, 1, 0.6117647, 0, 1,
-1.223996, -0.906648, -2.480457, 1, 0.6196079, 0, 1,
-1.222262, 1.272213, -1.239855, 1, 0.6235294, 0, 1,
-1.219103, -2.398017, -3.397236, 1, 0.6313726, 0, 1,
-1.21435, -1.183256, -2.974253, 1, 0.6352941, 0, 1,
-1.206347, 1.140469, 0.1709219, 1, 0.6431373, 0, 1,
-1.203311, 1.526822, -1.447116, 1, 0.6470588, 0, 1,
-1.201744, -1.389954, -3.328159, 1, 0.654902, 0, 1,
-1.200851, 0.5339277, -1.133152, 1, 0.6588235, 0, 1,
-1.192475, -0.1358334, -0.3816334, 1, 0.6666667, 0, 1,
-1.184913, 0.4017159, -1.472232, 1, 0.6705883, 0, 1,
-1.179378, 1.160416, -0.2885731, 1, 0.6784314, 0, 1,
-1.174587, 0.3915095, -2.955654, 1, 0.682353, 0, 1,
-1.165148, 2.323954, -0.6480246, 1, 0.6901961, 0, 1,
-1.145423, -0.4005254, -1.446557, 1, 0.6941177, 0, 1,
-1.143812, 0.7678347, -0.9281204, 1, 0.7019608, 0, 1,
-1.13986, 0.3066958, -1.515699, 1, 0.7098039, 0, 1,
-1.139821, -0.2632986, -3.912303, 1, 0.7137255, 0, 1,
-1.135432, -0.6176034, -1.594039, 1, 0.7215686, 0, 1,
-1.131872, 0.6392944, -1.087191, 1, 0.7254902, 0, 1,
-1.124326, 0.7775219, -2.742233, 1, 0.7333333, 0, 1,
-1.118601, 1.582114, 0.6296448, 1, 0.7372549, 0, 1,
-1.117575, 1.485743, 1.578323, 1, 0.7450981, 0, 1,
-1.11627, -1.725243, -2.592969, 1, 0.7490196, 0, 1,
-1.116088, 1.076832, -0.2761167, 1, 0.7568628, 0, 1,
-1.113986, -0.03916974, -0.7768186, 1, 0.7607843, 0, 1,
-1.109327, 0.8599078, -0.7727836, 1, 0.7686275, 0, 1,
-1.108655, -0.5945541, -1.163179, 1, 0.772549, 0, 1,
-1.107329, -0.1790842, -0.8675092, 1, 0.7803922, 0, 1,
-1.104806, -0.6209463, -1.692438, 1, 0.7843137, 0, 1,
-1.102473, -0.07780626, -1.702099, 1, 0.7921569, 0, 1,
-1.100556, 1.840105, -0.08301958, 1, 0.7960784, 0, 1,
-1.083455, 0.1106068, -1.051342, 1, 0.8039216, 0, 1,
-1.073115, -0.698554, -1.657009, 1, 0.8117647, 0, 1,
-1.068397, -0.679728, -2.558778, 1, 0.8156863, 0, 1,
-1.067293, -0.4236713, -1.804973, 1, 0.8235294, 0, 1,
-1.065218, 1.572192, 0.05945067, 1, 0.827451, 0, 1,
-1.061988, -1.048824, -1.884771, 1, 0.8352941, 0, 1,
-1.060163, 0.5451695, -2.370003, 1, 0.8392157, 0, 1,
-1.054503, 0.6120656, 0.4409679, 1, 0.8470588, 0, 1,
-1.048409, 0.5572236, -2.425309, 1, 0.8509804, 0, 1,
-1.043419, 0.05291997, -1.929129, 1, 0.8588235, 0, 1,
-1.038297, -0.5863582, -1.711901, 1, 0.8627451, 0, 1,
-1.034642, -1.784461, -4.170547, 1, 0.8705882, 0, 1,
-1.031763, -0.7111015, -1.31334, 1, 0.8745098, 0, 1,
-1.019597, -0.4492714, -1.864194, 1, 0.8823529, 0, 1,
-1.007274, 1.841613, 0.2243158, 1, 0.8862745, 0, 1,
-1.00599, 0.350433, -2.542064, 1, 0.8941177, 0, 1,
-0.9992088, 0.06927747, -1.892514, 1, 0.8980392, 0, 1,
-0.9953902, 0.09108045, -1.344681, 1, 0.9058824, 0, 1,
-0.9880931, 1.268569, -2.307815, 1, 0.9137255, 0, 1,
-0.9750515, 0.3761953, -0.9737585, 1, 0.9176471, 0, 1,
-0.9729529, -0.07076752, -2.026392, 1, 0.9254902, 0, 1,
-0.9627637, -2.702929, -2.612329, 1, 0.9294118, 0, 1,
-0.9621907, 1.097371, -1.779132, 1, 0.9372549, 0, 1,
-0.961762, -0.8635635, -1.990745, 1, 0.9411765, 0, 1,
-0.9592496, -1.034392, -3.381544, 1, 0.9490196, 0, 1,
-0.9502937, 0.1790593, -1.486275, 1, 0.9529412, 0, 1,
-0.948268, 0.9394145, 0.2659884, 1, 0.9607843, 0, 1,
-0.9388653, 0.3103165, -1.61417, 1, 0.9647059, 0, 1,
-0.9358082, -0.4108008, -2.96761, 1, 0.972549, 0, 1,
-0.9352651, 1.056709, -0.9529447, 1, 0.9764706, 0, 1,
-0.9236335, -2.719324, -2.469294, 1, 0.9843137, 0, 1,
-0.9210067, -0.3365933, -2.901799, 1, 0.9882353, 0, 1,
-0.9189086, -0.08073592, -0.4622236, 1, 0.9960784, 0, 1,
-0.915826, -1.763261, -1.995352, 0.9960784, 1, 0, 1,
-0.9087517, -0.4698854, -0.8434005, 0.9921569, 1, 0, 1,
-0.9074365, 1.16854, -0.5131539, 0.9843137, 1, 0, 1,
-0.9051962, -1.025395, -1.682635, 0.9803922, 1, 0, 1,
-0.9036865, 0.612736, -2.113057, 0.972549, 1, 0, 1,
-0.8973144, 1.825956, -1.570567, 0.9686275, 1, 0, 1,
-0.8972881, -1.394141, -1.781994, 0.9607843, 1, 0, 1,
-0.8927965, 0.9623119, -0.3849126, 0.9568627, 1, 0, 1,
-0.8899121, -0.9125516, -2.012704, 0.9490196, 1, 0, 1,
-0.8860603, -0.19258, -0.7429361, 0.945098, 1, 0, 1,
-0.8839064, -0.9459932, -2.136307, 0.9372549, 1, 0, 1,
-0.8810518, 0.2189619, -2.317889, 0.9333333, 1, 0, 1,
-0.8743005, -0.1162723, -1.653856, 0.9254902, 1, 0, 1,
-0.8724958, -0.7729399, -2.020404, 0.9215686, 1, 0, 1,
-0.8698853, 1.134881, 1.279835, 0.9137255, 1, 0, 1,
-0.8654836, -0.000419159, -2.084336, 0.9098039, 1, 0, 1,
-0.8528679, -0.6729432, -1.454031, 0.9019608, 1, 0, 1,
-0.8516161, -0.7158859, -1.475852, 0.8941177, 1, 0, 1,
-0.8508652, 0.5240935, -0.6496733, 0.8901961, 1, 0, 1,
-0.8475028, 2.012427, -0.3141569, 0.8823529, 1, 0, 1,
-0.8448594, 0.1580768, -2.16, 0.8784314, 1, 0, 1,
-0.8377968, 0.8958591, -1.567543, 0.8705882, 1, 0, 1,
-0.8337528, -0.315597, -2.015091, 0.8666667, 1, 0, 1,
-0.8320975, 0.7693703, -3.365929, 0.8588235, 1, 0, 1,
-0.8320029, 1.83904, 0.7884859, 0.854902, 1, 0, 1,
-0.8223757, -0.09797254, -2.175687, 0.8470588, 1, 0, 1,
-0.8171483, -0.4192181, -1.404864, 0.8431373, 1, 0, 1,
-0.8166507, 0.2550712, -2.044117, 0.8352941, 1, 0, 1,
-0.8058667, -0.8761283, -3.650915, 0.8313726, 1, 0, 1,
-0.8041736, -0.520319, -2.869365, 0.8235294, 1, 0, 1,
-0.8024396, -1.537953, -2.451803, 0.8196079, 1, 0, 1,
-0.8009868, -0.1301112, -2.660549, 0.8117647, 1, 0, 1,
-0.800588, -2.109952, -2.553739, 0.8078431, 1, 0, 1,
-0.7984703, 0.05565437, -1.515956, 0.8, 1, 0, 1,
-0.7983496, -1.689996, -1.913454, 0.7921569, 1, 0, 1,
-0.7886531, -0.1560958, -1.830738, 0.7882353, 1, 0, 1,
-0.7862819, 0.5747012, -0.3097332, 0.7803922, 1, 0, 1,
-0.7822129, 1.479802, -0.779432, 0.7764706, 1, 0, 1,
-0.7818002, -0.1215666, -1.149168, 0.7686275, 1, 0, 1,
-0.781518, 0.5252961, -1.436909, 0.7647059, 1, 0, 1,
-0.7699921, 1.754997, -1.125516, 0.7568628, 1, 0, 1,
-0.7681654, 0.6375217, 1.744192, 0.7529412, 1, 0, 1,
-0.7657577, -0.1179473, -1.112512, 0.7450981, 1, 0, 1,
-0.7629887, -0.7742663, -2.907241, 0.7411765, 1, 0, 1,
-0.7628875, 1.860722, -0.1154626, 0.7333333, 1, 0, 1,
-0.7594422, -0.7662087, -2.299066, 0.7294118, 1, 0, 1,
-0.7579859, 0.2494618, -1.083363, 0.7215686, 1, 0, 1,
-0.7567654, 0.03112944, -0.3362051, 0.7176471, 1, 0, 1,
-0.7553141, 0.6649228, -1.475052, 0.7098039, 1, 0, 1,
-0.7410411, -1.296784, -1.813977, 0.7058824, 1, 0, 1,
-0.7326702, 1.10801, -1.486335, 0.6980392, 1, 0, 1,
-0.7263535, -1.10992, -3.096489, 0.6901961, 1, 0, 1,
-0.724623, -0.299789, -2.863518, 0.6862745, 1, 0, 1,
-0.7236044, 0.4021645, -0.9226909, 0.6784314, 1, 0, 1,
-0.7110554, -0.06430067, -0.4335235, 0.6745098, 1, 0, 1,
-0.7000896, -0.1712397, -3.133584, 0.6666667, 1, 0, 1,
-0.6996281, -0.4433655, -1.211329, 0.6627451, 1, 0, 1,
-0.6988715, -0.02925502, -2.092696, 0.654902, 1, 0, 1,
-0.697535, 1.269389, -1.231739, 0.6509804, 1, 0, 1,
-0.6937603, 0.9651474, -0.03256368, 0.6431373, 1, 0, 1,
-0.6931417, 0.5724405, -0.4643038, 0.6392157, 1, 0, 1,
-0.6922018, 0.04839216, -1.663676, 0.6313726, 1, 0, 1,
-0.6840909, -0.282786, -3.268199, 0.627451, 1, 0, 1,
-0.6795695, 0.9036281, 0.4137752, 0.6196079, 1, 0, 1,
-0.6757651, -0.4880882, -2.649018, 0.6156863, 1, 0, 1,
-0.6741122, 1.436457, 1.119212, 0.6078432, 1, 0, 1,
-0.673835, 0.425937, -0.06373014, 0.6039216, 1, 0, 1,
-0.6652629, 2.395052, -0.3404071, 0.5960785, 1, 0, 1,
-0.6616413, 0.7479221, 1.165804, 0.5882353, 1, 0, 1,
-0.6616093, 0.5986601, -0.2118323, 0.5843138, 1, 0, 1,
-0.6609372, -0.7071387, -3.084859, 0.5764706, 1, 0, 1,
-0.6607512, -0.3679, -3.735793, 0.572549, 1, 0, 1,
-0.6599186, -0.5612633, -4.319078, 0.5647059, 1, 0, 1,
-0.6567227, 2.306119, -0.198126, 0.5607843, 1, 0, 1,
-0.6361388, -0.1913741, -1.469197, 0.5529412, 1, 0, 1,
-0.6312801, -0.5479435, -2.139769, 0.5490196, 1, 0, 1,
-0.6305825, 0.9364951, -0.2148465, 0.5411765, 1, 0, 1,
-0.6266155, -0.3656152, -0.7869533, 0.5372549, 1, 0, 1,
-0.6242254, -1.345713, -4.068535, 0.5294118, 1, 0, 1,
-0.6232727, -1.545891, -3.395681, 0.5254902, 1, 0, 1,
-0.6230375, -0.2854847, -2.317365, 0.5176471, 1, 0, 1,
-0.617954, -1.286071, -0.5318894, 0.5137255, 1, 0, 1,
-0.6148347, 0.8499684, 0.2963582, 0.5058824, 1, 0, 1,
-0.610245, 1.765142, -0.6633618, 0.5019608, 1, 0, 1,
-0.6075094, 0.2225343, -1.107577, 0.4941176, 1, 0, 1,
-0.607068, -0.9108981, -2.701217, 0.4862745, 1, 0, 1,
-0.6056864, -2.868076, -2.701314, 0.4823529, 1, 0, 1,
-0.6046428, 0.02866871, -1.553461, 0.4745098, 1, 0, 1,
-0.6031805, 0.3381351, -1.655032, 0.4705882, 1, 0, 1,
-0.5912901, 0.4173995, -2.000607, 0.4627451, 1, 0, 1,
-0.5897838, 0.04655559, -2.742882, 0.4588235, 1, 0, 1,
-0.5873587, -0.6742851, -2.016548, 0.4509804, 1, 0, 1,
-0.5860713, -1.722368, -2.801646, 0.4470588, 1, 0, 1,
-0.5816299, 0.05820903, -1.318889, 0.4392157, 1, 0, 1,
-0.5793887, -1.722878, -3.369309, 0.4352941, 1, 0, 1,
-0.5726448, -0.1609751, -2.151861, 0.427451, 1, 0, 1,
-0.5715901, 0.4882649, -2.491055, 0.4235294, 1, 0, 1,
-0.5710418, -0.003335626, -1.54676, 0.4156863, 1, 0, 1,
-0.5707535, -0.2056823, -1.944281, 0.4117647, 1, 0, 1,
-0.5658463, -0.7751495, -2.255953, 0.4039216, 1, 0, 1,
-0.5656946, 0.7020699, -0.5989322, 0.3960784, 1, 0, 1,
-0.5599194, 1.742488, -1.095177, 0.3921569, 1, 0, 1,
-0.5577492, 0.5431424, -1.518393, 0.3843137, 1, 0, 1,
-0.5571093, 0.2407343, -1.381573, 0.3803922, 1, 0, 1,
-0.5540859, -1.025905, -2.700472, 0.372549, 1, 0, 1,
-0.551177, 0.2915221, -3.088008, 0.3686275, 1, 0, 1,
-0.5501745, -0.1952951, -1.942003, 0.3607843, 1, 0, 1,
-0.5488286, -1.043303, -2.914299, 0.3568628, 1, 0, 1,
-0.5476879, 0.732448, -0.5645021, 0.3490196, 1, 0, 1,
-0.5456603, -1.317125, -2.932226, 0.345098, 1, 0, 1,
-0.5421861, 0.2261649, -0.07900713, 0.3372549, 1, 0, 1,
-0.5413691, -0.5026942, -2.990876, 0.3333333, 1, 0, 1,
-0.5381619, 0.640989, -1.543347, 0.3254902, 1, 0, 1,
-0.5367927, 1.953762, -0.2090025, 0.3215686, 1, 0, 1,
-0.5357434, 0.5933971, -0.4583069, 0.3137255, 1, 0, 1,
-0.5292891, -1.120692, -2.19433, 0.3098039, 1, 0, 1,
-0.5285236, -0.9899103, -2.211142, 0.3019608, 1, 0, 1,
-0.5251362, 0.09344898, -0.1620719, 0.2941177, 1, 0, 1,
-0.5243381, -0.1874378, -3.629531, 0.2901961, 1, 0, 1,
-0.5229651, -0.4736249, -2.500834, 0.282353, 1, 0, 1,
-0.5225682, 0.6082136, -1.22765, 0.2784314, 1, 0, 1,
-0.5186381, 0.04097186, -1.441573, 0.2705882, 1, 0, 1,
-0.5183718, -0.430585, -3.636794, 0.2666667, 1, 0, 1,
-0.5159071, -0.2658746, -0.7502079, 0.2588235, 1, 0, 1,
-0.5154513, 0.9067526, 0.09771957, 0.254902, 1, 0, 1,
-0.5105814, 0.9638444, -0.7964025, 0.2470588, 1, 0, 1,
-0.5074346, 0.7604843, 0.728214, 0.2431373, 1, 0, 1,
-0.5074315, 0.415899, -2.72752, 0.2352941, 1, 0, 1,
-0.5039348, 0.2697034, -0.0854122, 0.2313726, 1, 0, 1,
-0.5011355, -0.8208078, -1.255414, 0.2235294, 1, 0, 1,
-0.5003751, -0.7656592, -0.7573684, 0.2196078, 1, 0, 1,
-0.4963005, -0.1289956, -1.467901, 0.2117647, 1, 0, 1,
-0.494264, -0.6124171, -2.89676, 0.2078431, 1, 0, 1,
-0.4920534, -0.5158064, -1.619166, 0.2, 1, 0, 1,
-0.4900616, 1.326515, -0.5137089, 0.1921569, 1, 0, 1,
-0.4899539, 0.3995809, 0.5767803, 0.1882353, 1, 0, 1,
-0.4854635, 1.254564, -0.849856, 0.1803922, 1, 0, 1,
-0.4853339, 0.04026701, -0.8457435, 0.1764706, 1, 0, 1,
-0.4847104, -0.7659246, -3.311733, 0.1686275, 1, 0, 1,
-0.4819163, 0.9612941, -1.576207, 0.1647059, 1, 0, 1,
-0.480697, -0.3908446, -2.833168, 0.1568628, 1, 0, 1,
-0.4754378, 0.9233633, 0.1584931, 0.1529412, 1, 0, 1,
-0.4692982, -0.3631692, -1.905578, 0.145098, 1, 0, 1,
-0.4664192, -0.4818076, -2.577883, 0.1411765, 1, 0, 1,
-0.4653911, -1.386261, -3.907358, 0.1333333, 1, 0, 1,
-0.4629617, 0.07870689, -1.707993, 0.1294118, 1, 0, 1,
-0.4624176, 0.8370295, -3.861997, 0.1215686, 1, 0, 1,
-0.4619154, 0.4927542, -0.003795815, 0.1176471, 1, 0, 1,
-0.4604782, 0.01647608, 0.9223169, 0.1098039, 1, 0, 1,
-0.4601272, 1.509031, -1.874606, 0.1058824, 1, 0, 1,
-0.4585865, -1.250722, -4.860103, 0.09803922, 1, 0, 1,
-0.4576222, -0.02205325, -0.6695639, 0.09019608, 1, 0, 1,
-0.456086, -0.2176533, -1.130883, 0.08627451, 1, 0, 1,
-0.4560246, -0.6558055, -3.364599, 0.07843138, 1, 0, 1,
-0.4522603, 0.03657199, -1.029253, 0.07450981, 1, 0, 1,
-0.4513599, -1.705436, 0.07349403, 0.06666667, 1, 0, 1,
-0.4468818, 2.200524, -1.646016, 0.0627451, 1, 0, 1,
-0.4397709, 0.7100425, -0.7705324, 0.05490196, 1, 0, 1,
-0.4302027, 0.6585374, -0.5878018, 0.05098039, 1, 0, 1,
-0.4301719, 2.364652, 0.4319188, 0.04313726, 1, 0, 1,
-0.4198215, -0.5207959, -2.176896, 0.03921569, 1, 0, 1,
-0.4113643, -0.4752924, -2.87508, 0.03137255, 1, 0, 1,
-0.4064887, -0.6066319, -2.758789, 0.02745098, 1, 0, 1,
-0.4060638, 0.9671407, 0.9518893, 0.01960784, 1, 0, 1,
-0.4059834, -0.154605, -1.454471, 0.01568628, 1, 0, 1,
-0.4056392, -1.652557, -3.738338, 0.007843138, 1, 0, 1,
-0.3935469, -0.9613455, -1.700351, 0.003921569, 1, 0, 1,
-0.3910061, 2.009331, -0.4317134, 0, 1, 0.003921569, 1,
-0.3907104, 1.036821, -1.384159, 0, 1, 0.01176471, 1,
-0.390665, 0.1406941, -0.693244, 0, 1, 0.01568628, 1,
-0.3900702, 0.8511975, -0.2127155, 0, 1, 0.02352941, 1,
-0.3894926, -0.1723484, -3.938887, 0, 1, 0.02745098, 1,
-0.3787947, 0.8757449, -1.142185, 0, 1, 0.03529412, 1,
-0.3761392, -0.2390953, -3.24066, 0, 1, 0.03921569, 1,
-0.3751856, 2.26546, 0.9852161, 0, 1, 0.04705882, 1,
-0.3745997, 0.1685286, -2.430113, 0, 1, 0.05098039, 1,
-0.3720346, -0.5156212, -1.652935, 0, 1, 0.05882353, 1,
-0.3700611, 0.214687, -0.8498561, 0, 1, 0.0627451, 1,
-0.3695256, 0.4067438, -0.9152307, 0, 1, 0.07058824, 1,
-0.3676024, -0.3573657, -2.89494, 0, 1, 0.07450981, 1,
-0.3642034, -0.2155257, -2.360046, 0, 1, 0.08235294, 1,
-0.3603929, 1.091671, 0.01488198, 0, 1, 0.08627451, 1,
-0.3591452, 0.1655205, -1.891658, 0, 1, 0.09411765, 1,
-0.3570075, 1.019321, 2.269446, 0, 1, 0.1019608, 1,
-0.3567387, -1.549143, -2.061898, 0, 1, 0.1058824, 1,
-0.3565266, 0.2801422, -1.990359, 0, 1, 0.1137255, 1,
-0.3538495, 0.3221466, 1.239907, 0, 1, 0.1176471, 1,
-0.3534593, -3.329246, -4.870557, 0, 1, 0.1254902, 1,
-0.3429368, -0.4432684, -3.09773, 0, 1, 0.1294118, 1,
-0.3391913, -1.278703, -2.861958, 0, 1, 0.1372549, 1,
-0.3376969, 0.209254, -0.701866, 0, 1, 0.1411765, 1,
-0.3348972, 0.4895894, -0.2602982, 0, 1, 0.1490196, 1,
-0.3348043, -0.7178972, -1.955857, 0, 1, 0.1529412, 1,
-0.332352, -0.03770155, -2.818234, 0, 1, 0.1607843, 1,
-0.33034, -2.809265, -3.623047, 0, 1, 0.1647059, 1,
-0.3302026, 0.04636126, -0.2706517, 0, 1, 0.172549, 1,
-0.324379, 1.055904, -1.538508, 0, 1, 0.1764706, 1,
-0.3242717, -0.4719829, -3.033283, 0, 1, 0.1843137, 1,
-0.3203655, 0.4155396, 0.5224485, 0, 1, 0.1882353, 1,
-0.31671, -0.1293435, -3.045009, 0, 1, 0.1960784, 1,
-0.3150245, -0.4389624, -3.704837, 0, 1, 0.2039216, 1,
-0.3126819, -0.1132057, -1.231407, 0, 1, 0.2078431, 1,
-0.3126636, 0.6485105, -0.147394, 0, 1, 0.2156863, 1,
-0.3121836, 0.1357469, -1.144736, 0, 1, 0.2196078, 1,
-0.3114283, 0.2080702, -1.215487, 0, 1, 0.227451, 1,
-0.3101784, 0.5401984, -0.7817422, 0, 1, 0.2313726, 1,
-0.3096811, -0.5475285, -2.998728, 0, 1, 0.2392157, 1,
-0.3084813, 0.6718814, -1.197739, 0, 1, 0.2431373, 1,
-0.3079357, -0.1104474, -3.183771, 0, 1, 0.2509804, 1,
-0.305203, 1.24148, -0.4998662, 0, 1, 0.254902, 1,
-0.3044966, 0.504944, 0.4401725, 0, 1, 0.2627451, 1,
-0.2951327, -1.296383, -2.079514, 0, 1, 0.2666667, 1,
-0.2943369, -0.4501083, -1.934453, 0, 1, 0.2745098, 1,
-0.2833149, 0.6731637, -0.4267159, 0, 1, 0.2784314, 1,
-0.279756, 0.1450263, -0.9788609, 0, 1, 0.2862745, 1,
-0.2749034, 0.1431233, -1.733994, 0, 1, 0.2901961, 1,
-0.2748908, 1.703334, -0.3398529, 0, 1, 0.2980392, 1,
-0.2704385, 0.05643107, 0.2164117, 0, 1, 0.3058824, 1,
-0.2651974, -1.394916, -3.225034, 0, 1, 0.3098039, 1,
-0.2594877, -1.283191, -2.477067, 0, 1, 0.3176471, 1,
-0.2589005, -0.002374068, -3.054721, 0, 1, 0.3215686, 1,
-0.2534128, 0.227462, -1.644921, 0, 1, 0.3294118, 1,
-0.2516944, 0.5446732, -1.429031, 0, 1, 0.3333333, 1,
-0.2484928, -0.03558803, -1.59104, 0, 1, 0.3411765, 1,
-0.2477927, 1.530887, -0.7280635, 0, 1, 0.345098, 1,
-0.2477547, 0.4171606, -1.885568, 0, 1, 0.3529412, 1,
-0.2472652, 0.844352, -0.4123606, 0, 1, 0.3568628, 1,
-0.2453311, 0.9338615, 0.9842072, 0, 1, 0.3647059, 1,
-0.2444283, -0.6377639, -1.461116, 0, 1, 0.3686275, 1,
-0.2405326, -0.6320987, -2.218997, 0, 1, 0.3764706, 1,
-0.2386746, -0.296123, -2.665735, 0, 1, 0.3803922, 1,
-0.2364258, 0.2621252, -0.4913496, 0, 1, 0.3882353, 1,
-0.2329106, 2.190214, -1.382744, 0, 1, 0.3921569, 1,
-0.2322339, 0.8301133, -0.4197218, 0, 1, 0.4, 1,
-0.2317721, 2.404726, -1.263428, 0, 1, 0.4078431, 1,
-0.2289725, 0.2121614, -0.09752502, 0, 1, 0.4117647, 1,
-0.2267687, -0.4334482, -2.77743, 0, 1, 0.4196078, 1,
-0.2266689, 0.8276219, -1.433756, 0, 1, 0.4235294, 1,
-0.2231697, -0.6762199, -2.419845, 0, 1, 0.4313726, 1,
-0.2220573, -0.5521976, -3.181657, 0, 1, 0.4352941, 1,
-0.2184557, -0.05831916, -1.70558, 0, 1, 0.4431373, 1,
-0.2169399, -1.194019, -3.381948, 0, 1, 0.4470588, 1,
-0.2115195, 0.7268977, -0.4927213, 0, 1, 0.454902, 1,
-0.2111322, 0.01574732, -0.7847683, 0, 1, 0.4588235, 1,
-0.2103533, 0.01690708, -1.142177, 0, 1, 0.4666667, 1,
-0.2079264, -0.6583278, -2.575821, 0, 1, 0.4705882, 1,
-0.2060847, -0.03144037, -1.275491, 0, 1, 0.4784314, 1,
-0.2027128, 1.854548, -1.329964, 0, 1, 0.4823529, 1,
-0.1995751, 1.370142, 0.3171659, 0, 1, 0.4901961, 1,
-0.1982053, -1.382097, -3.47438, 0, 1, 0.4941176, 1,
-0.1977423, 0.09814967, -0.7984223, 0, 1, 0.5019608, 1,
-0.1976911, -1.559706, -1.868, 0, 1, 0.509804, 1,
-0.197144, 3.560751, 0.1627161, 0, 1, 0.5137255, 1,
-0.1839975, -2.464998, -2.289622, 0, 1, 0.5215687, 1,
-0.1839711, -1.395175, -1.973564, 0, 1, 0.5254902, 1,
-0.1813571, 1.23424, -0.6134719, 0, 1, 0.5333334, 1,
-0.1709123, -0.1208538, -2.379905, 0, 1, 0.5372549, 1,
-0.1708408, 1.189295, -1.492869, 0, 1, 0.5450981, 1,
-0.170702, 0.9045967, -0.5867797, 0, 1, 0.5490196, 1,
-0.1671312, 0.9591538, 0.7562402, 0, 1, 0.5568628, 1,
-0.1656583, -1.033909, -3.455611, 0, 1, 0.5607843, 1,
-0.1646922, -0.2453728, -2.213693, 0, 1, 0.5686275, 1,
-0.15163, -1.198906, -3.388859, 0, 1, 0.572549, 1,
-0.1504013, 1.041256, -0.214761, 0, 1, 0.5803922, 1,
-0.1484615, 0.9977068, 0.9899602, 0, 1, 0.5843138, 1,
-0.1476254, -0.02226933, -2.346203, 0, 1, 0.5921569, 1,
-0.1465399, -0.6332873, -3.75944, 0, 1, 0.5960785, 1,
-0.1393689, -0.7863873, -3.627349, 0, 1, 0.6039216, 1,
-0.1370554, -0.5843666, -2.16491, 0, 1, 0.6117647, 1,
-0.1360306, 0.7521042, -0.0858478, 0, 1, 0.6156863, 1,
-0.1351001, 0.7431076, 0.8751963, 0, 1, 0.6235294, 1,
-0.1337921, 0.6368895, 0.3207979, 0, 1, 0.627451, 1,
-0.1298638, -0.6709587, -2.670252, 0, 1, 0.6352941, 1,
-0.1259011, -0.09638425, -1.494997, 0, 1, 0.6392157, 1,
-0.1219605, -0.2127256, -4.363697, 0, 1, 0.6470588, 1,
-0.1208473, -0.07178463, -0.541835, 0, 1, 0.6509804, 1,
-0.1201463, 0.197022, 0.3872969, 0, 1, 0.6588235, 1,
-0.1197018, -1.561776, -3.041455, 0, 1, 0.6627451, 1,
-0.1128305, 0.2396184, 0.08021747, 0, 1, 0.6705883, 1,
-0.1123646, 1.086377, 1.283332, 0, 1, 0.6745098, 1,
-0.1121186, 0.006822153, -2.978843, 0, 1, 0.682353, 1,
-0.1096662, -0.7956994, -3.628042, 0, 1, 0.6862745, 1,
-0.1076872, 2.231296, -0.2873685, 0, 1, 0.6941177, 1,
-0.1071547, 0.4689336, -0.6735504, 0, 1, 0.7019608, 1,
-0.1048925, 1.816691, -0.3738035, 0, 1, 0.7058824, 1,
-0.1022766, 2.112954, 1.422402, 0, 1, 0.7137255, 1,
-0.09782188, 1.553941, -1.091835, 0, 1, 0.7176471, 1,
-0.09707654, 0.6245421, -1.604835, 0, 1, 0.7254902, 1,
-0.09583928, 0.7377417, -1.749303, 0, 1, 0.7294118, 1,
-0.09065006, -1.668177, -3.716894, 0, 1, 0.7372549, 1,
-0.07469339, -1.862745, -4.115889, 0, 1, 0.7411765, 1,
-0.07298404, -0.2825867, -0.6852636, 0, 1, 0.7490196, 1,
-0.07158453, 1.580172, -1.363268, 0, 1, 0.7529412, 1,
-0.070737, 1.08682, 0.009480998, 0, 1, 0.7607843, 1,
-0.06603925, 2.209622, 1.016992, 0, 1, 0.7647059, 1,
-0.06282862, 0.9643902, 1.145693, 0, 1, 0.772549, 1,
-0.06066932, -0.2563426, -0.9515149, 0, 1, 0.7764706, 1,
-0.05831514, 0.3007624, 1.286857, 0, 1, 0.7843137, 1,
-0.05419211, -0.6026259, -2.266057, 0, 1, 0.7882353, 1,
-0.05410135, -0.4607232, -4.367051, 0, 1, 0.7960784, 1,
-0.05234674, 0.4755894, -0.1907456, 0, 1, 0.8039216, 1,
-0.05128694, -1.36585, -2.613974, 0, 1, 0.8078431, 1,
-0.05059448, -1.181991, -2.672341, 0, 1, 0.8156863, 1,
-0.04565912, -1.900892, -3.043049, 0, 1, 0.8196079, 1,
-0.04192292, 1.144534, -0.2668881, 0, 1, 0.827451, 1,
-0.04172046, 1.925065, -0.1314207, 0, 1, 0.8313726, 1,
-0.0387822, 0.9512282, -1.31059, 0, 1, 0.8392157, 1,
-0.03287914, -2.113158, -3.943492, 0, 1, 0.8431373, 1,
-0.02538369, 0.7817906, -0.3566954, 0, 1, 0.8509804, 1,
-0.01748214, -1.733958, -2.150858, 0, 1, 0.854902, 1,
-0.01547971, 0.4842248, -1.692045, 0, 1, 0.8627451, 1,
-0.01235919, 0.5179977, 0.3510662, 0, 1, 0.8666667, 1,
-0.01087116, -0.9403681, -4.065639, 0, 1, 0.8745098, 1,
0.002708178, -0.3541062, 3.073934, 0, 1, 0.8784314, 1,
0.005879535, -1.251759, 2.272723, 0, 1, 0.8862745, 1,
0.01203523, -1.217544, 3.549989, 0, 1, 0.8901961, 1,
0.01310876, 0.7830275, -0.6011301, 0, 1, 0.8980392, 1,
0.01711848, 0.4271893, -0.9723883, 0, 1, 0.9058824, 1,
0.01751303, -0.6707124, 3.090687, 0, 1, 0.9098039, 1,
0.02144091, -1.092088, 2.998173, 0, 1, 0.9176471, 1,
0.02252747, -0.8597279, 1.953202, 0, 1, 0.9215686, 1,
0.03251144, -0.1801353, 2.937773, 0, 1, 0.9294118, 1,
0.0339406, 0.03645312, -0.8056779, 0, 1, 0.9333333, 1,
0.03577506, 1.433206, -0.04827981, 0, 1, 0.9411765, 1,
0.03616368, -1.192432, 3.03028, 0, 1, 0.945098, 1,
0.0361718, 0.2548943, -0.8841068, 0, 1, 0.9529412, 1,
0.04194303, 0.3419084, -0.5984455, 0, 1, 0.9568627, 1,
0.04564688, 0.3972669, -0.2946839, 0, 1, 0.9647059, 1,
0.04658612, -0.3730611, 4.119069, 0, 1, 0.9686275, 1,
0.04744162, -1.027676, 2.533266, 0, 1, 0.9764706, 1,
0.05008521, -2.817477, 3.44218, 0, 1, 0.9803922, 1,
0.05355171, -0.05104646, 2.689257, 0, 1, 0.9882353, 1,
0.05359581, 1.066532, 0.1712126, 0, 1, 0.9921569, 1,
0.05904832, 0.1561037, 0.2628357, 0, 1, 1, 1,
0.06097195, 1.443167, -0.4493103, 0, 0.9921569, 1, 1,
0.06105798, -0.2657726, 2.426606, 0, 0.9882353, 1, 1,
0.06212774, 0.4361194, 0.7011006, 0, 0.9803922, 1, 1,
0.0633482, -0.2149161, 2.92298, 0, 0.9764706, 1, 1,
0.06550988, -0.3517963, 2.646911, 0, 0.9686275, 1, 1,
0.06637417, -0.2396227, 2.108218, 0, 0.9647059, 1, 1,
0.06917498, -0.7564436, 3.266466, 0, 0.9568627, 1, 1,
0.0697807, -0.973325, 1.527448, 0, 0.9529412, 1, 1,
0.07180094, -0.1104059, 2.74575, 0, 0.945098, 1, 1,
0.07362705, 0.2101659, 0.191445, 0, 0.9411765, 1, 1,
0.07480635, 1.51438, -0.05562307, 0, 0.9333333, 1, 1,
0.07568065, -0.5800393, 2.378205, 0, 0.9294118, 1, 1,
0.07666145, -0.1750991, 1.243397, 0, 0.9215686, 1, 1,
0.08003091, -0.366049, 2.042385, 0, 0.9176471, 1, 1,
0.08340678, 1.902689, -0.5133075, 0, 0.9098039, 1, 1,
0.08741321, -0.3259889, 2.856627, 0, 0.9058824, 1, 1,
0.08878685, 0.2766367, 0.4565669, 0, 0.8980392, 1, 1,
0.0906556, 0.466041, -0.296096, 0, 0.8901961, 1, 1,
0.09401879, -0.06014379, 1.033325, 0, 0.8862745, 1, 1,
0.09632078, 1.033423, 1.218021, 0, 0.8784314, 1, 1,
0.09816564, 0.3414561, 2.20044, 0, 0.8745098, 1, 1,
0.09900884, -1.574668, 2.678777, 0, 0.8666667, 1, 1,
0.1066311, 0.717175, 0.4387366, 0, 0.8627451, 1, 1,
0.1071742, 0.0248852, 0.928157, 0, 0.854902, 1, 1,
0.1087068, -1.53225, 2.957437, 0, 0.8509804, 1, 1,
0.1106093, 1.153592, 0.7548789, 0, 0.8431373, 1, 1,
0.1109884, 1.083438, 0.9390017, 0, 0.8392157, 1, 1,
0.1151941, 2.105642, -1.11342, 0, 0.8313726, 1, 1,
0.1203741, 0.910741, -0.7378023, 0, 0.827451, 1, 1,
0.1206105, -0.08530138, 1.634114, 0, 0.8196079, 1, 1,
0.1240682, 0.5809863, 1.081801, 0, 0.8156863, 1, 1,
0.1247945, 1.507077, 0.00363708, 0, 0.8078431, 1, 1,
0.1274981, -0.5932093, 2.552892, 0, 0.8039216, 1, 1,
0.1304654, -0.2148917, 2.865824, 0, 0.7960784, 1, 1,
0.1310115, -1.306896, 2.755807, 0, 0.7882353, 1, 1,
0.1341857, 0.5890791, 0.6731321, 0, 0.7843137, 1, 1,
0.1370624, 0.3369763, -0.6352711, 0, 0.7764706, 1, 1,
0.1374395, -0.4378083, 2.238297, 0, 0.772549, 1, 1,
0.1390254, -0.2169922, 3.41358, 0, 0.7647059, 1, 1,
0.1393544, 0.7907732, 0.2182171, 0, 0.7607843, 1, 1,
0.1394732, 0.005397959, 0.9156132, 0, 0.7529412, 1, 1,
0.145282, 0.9121128, 0.006719321, 0, 0.7490196, 1, 1,
0.1465634, 0.2596889, 1.018075, 0, 0.7411765, 1, 1,
0.1466871, 0.9325108, -0.7759598, 0, 0.7372549, 1, 1,
0.1470728, 1.571337, 0.9080982, 0, 0.7294118, 1, 1,
0.1505612, 0.5866625, 1.222981, 0, 0.7254902, 1, 1,
0.1557581, 0.3288972, 1.054893, 0, 0.7176471, 1, 1,
0.1565755, -2.611571, 3.504065, 0, 0.7137255, 1, 1,
0.1582217, 3.186013, -1.465621, 0, 0.7058824, 1, 1,
0.1615244, -0.5866901, 3.090886, 0, 0.6980392, 1, 1,
0.1657501, -0.9175034, 2.238869, 0, 0.6941177, 1, 1,
0.1698704, -0.6521515, 2.318946, 0, 0.6862745, 1, 1,
0.1749818, 0.2619955, 1.73801, 0, 0.682353, 1, 1,
0.1757198, -0.4565465, 1.11776, 0, 0.6745098, 1, 1,
0.1783341, -0.2036452, 1.772723, 0, 0.6705883, 1, 1,
0.1784603, 0.4200423, -1.159033, 0, 0.6627451, 1, 1,
0.1796016, 1.068498, 2.180276, 0, 0.6588235, 1, 1,
0.1813806, -0.1101258, 0.1984478, 0, 0.6509804, 1, 1,
0.1817947, 0.5518467, -1.071315, 0, 0.6470588, 1, 1,
0.1899618, -1.440472, 5.569884, 0, 0.6392157, 1, 1,
0.1900456, -0.6003864, 1.957126, 0, 0.6352941, 1, 1,
0.1911516, 0.7985497, 1.308404, 0, 0.627451, 1, 1,
0.1918331, 1.40853, 3.566866, 0, 0.6235294, 1, 1,
0.1948861, -0.3589509, 3.824359, 0, 0.6156863, 1, 1,
0.1956766, -1.695971, 4.186158, 0, 0.6117647, 1, 1,
0.198173, -0.09786645, 2.522, 0, 0.6039216, 1, 1,
0.1990242, -0.2417388, 2.087371, 0, 0.5960785, 1, 1,
0.200261, 1.408511, -2.695108, 0, 0.5921569, 1, 1,
0.200356, 0.245368, 2.25019, 0, 0.5843138, 1, 1,
0.203262, 0.398462, 0.09912823, 0, 0.5803922, 1, 1,
0.2047045, -0.824724, 2.714287, 0, 0.572549, 1, 1,
0.2057286, 0.6565424, -1.866627, 0, 0.5686275, 1, 1,
0.2073575, 0.8515717, -0.5966769, 0, 0.5607843, 1, 1,
0.2116141, 0.8967243, 0.9209843, 0, 0.5568628, 1, 1,
0.2127877, -1.182952, 3.613326, 0, 0.5490196, 1, 1,
0.2174398, -1.099043, 2.922128, 0, 0.5450981, 1, 1,
0.2190621, -0.3041771, 2.184121, 0, 0.5372549, 1, 1,
0.2220836, -0.2110128, 2.394447, 0, 0.5333334, 1, 1,
0.222729, -0.5763755, 3.077752, 0, 0.5254902, 1, 1,
0.2253096, -2.13288, 3.99508, 0, 0.5215687, 1, 1,
0.2304696, -1.364748, 4.207084, 0, 0.5137255, 1, 1,
0.2309967, -0.9973121, 2.59141, 0, 0.509804, 1, 1,
0.2350896, 0.613606, 1.251324, 0, 0.5019608, 1, 1,
0.2379591, 1.928171, 0.975427, 0, 0.4941176, 1, 1,
0.2383551, 0.06448365, 2.008615, 0, 0.4901961, 1, 1,
0.2389605, 0.07987073, 0.3536848, 0, 0.4823529, 1, 1,
0.2399209, -0.1824536, 2.540591, 0, 0.4784314, 1, 1,
0.2403279, -2.31113, 3.88674, 0, 0.4705882, 1, 1,
0.2425208, -0.4922314, 2.831871, 0, 0.4666667, 1, 1,
0.250998, -0.9046837, 3.737032, 0, 0.4588235, 1, 1,
0.2525418, 0.568969, 0.3293907, 0, 0.454902, 1, 1,
0.256054, 0.08182835, 2.19147, 0, 0.4470588, 1, 1,
0.2580394, 0.3494354, 2.694522, 0, 0.4431373, 1, 1,
0.26191, -0.1942398, 2.162782, 0, 0.4352941, 1, 1,
0.2659625, -0.2733259, 3.276899, 0, 0.4313726, 1, 1,
0.272487, -0.4286935, 3.050745, 0, 0.4235294, 1, 1,
0.2756364, 0.3569466, 0.8122643, 0, 0.4196078, 1, 1,
0.2772403, 0.2954757, 1.817309, 0, 0.4117647, 1, 1,
0.2780212, -0.6753159, 2.262629, 0, 0.4078431, 1, 1,
0.2782743, -0.6406086, 2.393685, 0, 0.4, 1, 1,
0.2792038, -0.8017462, 3.537721, 0, 0.3921569, 1, 1,
0.2811995, -0.4071103, 1.791446, 0, 0.3882353, 1, 1,
0.2819358, 0.7286204, 0.2999813, 0, 0.3803922, 1, 1,
0.2856204, -0.8287364, 4.376504, 0, 0.3764706, 1, 1,
0.286199, -0.2910317, 2.812655, 0, 0.3686275, 1, 1,
0.2877983, 0.1421294, -0.2138288, 0, 0.3647059, 1, 1,
0.2949947, 1.834216, 0.7231047, 0, 0.3568628, 1, 1,
0.3001866, -0.4883999, 1.574496, 0, 0.3529412, 1, 1,
0.3005086, 1.14722, -2.27698, 0, 0.345098, 1, 1,
0.3041228, 0.01208866, 1.644511, 0, 0.3411765, 1, 1,
0.3083272, -0.3424965, 2.919224, 0, 0.3333333, 1, 1,
0.310791, -1.5371, 1.394563, 0, 0.3294118, 1, 1,
0.3110734, 0.6415179, 1.232833, 0, 0.3215686, 1, 1,
0.3121039, -2.35292, 3.371118, 0, 0.3176471, 1, 1,
0.3123179, -0.5449634, 0.9978839, 0, 0.3098039, 1, 1,
0.312666, -1.208883, 2.888125, 0, 0.3058824, 1, 1,
0.328144, 2.028194, 1.166323, 0, 0.2980392, 1, 1,
0.3290197, 0.05955182, 0.8967182, 0, 0.2901961, 1, 1,
0.3346332, 1.284179, 0.2114754, 0, 0.2862745, 1, 1,
0.3369987, -0.5369762, 2.100574, 0, 0.2784314, 1, 1,
0.3457381, -1.487412, 2.689248, 0, 0.2745098, 1, 1,
0.35169, 0.5272484, -0.805895, 0, 0.2666667, 1, 1,
0.3519499, -1.878343, 4.772508, 0, 0.2627451, 1, 1,
0.3522077, -1.671624, 2.429955, 0, 0.254902, 1, 1,
0.3527031, 0.6317649, 1.418611, 0, 0.2509804, 1, 1,
0.3530255, -0.7837234, 2.997366, 0, 0.2431373, 1, 1,
0.3557096, -1.098199, 2.220644, 0, 0.2392157, 1, 1,
0.3582502, 0.08830611, 2.007683, 0, 0.2313726, 1, 1,
0.3602585, 0.7552962, 0.5532146, 0, 0.227451, 1, 1,
0.3652825, 0.4508446, 1.979193, 0, 0.2196078, 1, 1,
0.3683555, -0.6758386, 1.752229, 0, 0.2156863, 1, 1,
0.3706407, -0.3529195, 1.086898, 0, 0.2078431, 1, 1,
0.3785695, 1.873866, -0.7990831, 0, 0.2039216, 1, 1,
0.3790292, 0.4610588, 1.81071, 0, 0.1960784, 1, 1,
0.3800817, -0.4734093, 2.516732, 0, 0.1882353, 1, 1,
0.3856438, 0.2444826, 1.42893, 0, 0.1843137, 1, 1,
0.3860613, -0.561799, 2.884626, 0, 0.1764706, 1, 1,
0.3876309, -0.6027485, 3.412276, 0, 0.172549, 1, 1,
0.3926929, 0.3581521, -0.4295786, 0, 0.1647059, 1, 1,
0.3987736, -0.6520028, 2.758114, 0, 0.1607843, 1, 1,
0.4003522, -0.2508896, 1.354621, 0, 0.1529412, 1, 1,
0.4106589, 0.1230031, 2.104706, 0, 0.1490196, 1, 1,
0.4108338, -0.6944798, 0.4244437, 0, 0.1411765, 1, 1,
0.417255, 0.5719659, 1.682593, 0, 0.1372549, 1, 1,
0.4194234, -0.8205291, 1.088961, 0, 0.1294118, 1, 1,
0.42026, 0.3917583, 0.701862, 0, 0.1254902, 1, 1,
0.4292224, -1.00804, 1.516223, 0, 0.1176471, 1, 1,
0.4322854, -0.9238194, 2.793068, 0, 0.1137255, 1, 1,
0.4334598, -0.685449, 0.168641, 0, 0.1058824, 1, 1,
0.4361224, -0.4417834, 1.960461, 0, 0.09803922, 1, 1,
0.4399923, -0.3501956, 3.829642, 0, 0.09411765, 1, 1,
0.4403071, -1.323332, 1.727814, 0, 0.08627451, 1, 1,
0.4403906, 0.1817029, 0.6714203, 0, 0.08235294, 1, 1,
0.4421616, 0.6036771, 1.59293, 0, 0.07450981, 1, 1,
0.4421946, -0.1115962, 2.793002, 0, 0.07058824, 1, 1,
0.4479685, 0.7542744, 0.3034116, 0, 0.0627451, 1, 1,
0.4486331, -0.5293887, 2.817225, 0, 0.05882353, 1, 1,
0.449704, -0.8419049, 3.287421, 0, 0.05098039, 1, 1,
0.4511729, -0.1695163, 2.072059, 0, 0.04705882, 1, 1,
0.4515437, 0.01111267, 1.109342, 0, 0.03921569, 1, 1,
0.4517082, 0.5324042, 1.144002, 0, 0.03529412, 1, 1,
0.4522701, -0.328942, 2.225158, 0, 0.02745098, 1, 1,
0.4543088, -0.1693685, 2.42222, 0, 0.02352941, 1, 1,
0.4651865, -0.6584762, 1.916867, 0, 0.01568628, 1, 1,
0.4712958, -0.7521779, 2.79679, 0, 0.01176471, 1, 1,
0.4770977, 0.7573341, 0.5792443, 0, 0.003921569, 1, 1,
0.4802523, -1.41269, 2.329581, 0.003921569, 0, 1, 1,
0.4821736, -0.8190719, 1.047087, 0.007843138, 0, 1, 1,
0.4826262, -1.259939, 2.664583, 0.01568628, 0, 1, 1,
0.4835292, 0.3151044, 0.2529944, 0.01960784, 0, 1, 1,
0.4858226, 1.693524, -1.26773, 0.02745098, 0, 1, 1,
0.4867534, 0.5622368, 1.258029, 0.03137255, 0, 1, 1,
0.4893521, -0.8470759, -0.06726397, 0.03921569, 0, 1, 1,
0.4920532, 0.07398505, 1.218269, 0.04313726, 0, 1, 1,
0.4929158, 1.137224, 0.6301616, 0.05098039, 0, 1, 1,
0.4939906, 0.3697146, 0.4485632, 0.05490196, 0, 1, 1,
0.4945371, -0.2251817, 0.4577402, 0.0627451, 0, 1, 1,
0.496867, 0.589643, 1.875779, 0.06666667, 0, 1, 1,
0.4978974, -0.7492071, 2.584781, 0.07450981, 0, 1, 1,
0.5006761, 0.5216677, 0.5885699, 0.07843138, 0, 1, 1,
0.5013111, -1.14351, 2.984369, 0.08627451, 0, 1, 1,
0.5071176, -0.5830839, 1.88801, 0.09019608, 0, 1, 1,
0.5079422, 0.0429276, 1.742458, 0.09803922, 0, 1, 1,
0.5081378, -1.440144, 5.716551, 0.1058824, 0, 1, 1,
0.5088494, -0.07733104, -0.06049861, 0.1098039, 0, 1, 1,
0.5113405, -0.8210508, 2.64916, 0.1176471, 0, 1, 1,
0.5137412, 0.8472851, -0.6560985, 0.1215686, 0, 1, 1,
0.5145453, -0.9568686, 2.554379, 0.1294118, 0, 1, 1,
0.5193316, -0.8678922, 0.05167319, 0.1333333, 0, 1, 1,
0.5196503, 2.56328, 1.183026, 0.1411765, 0, 1, 1,
0.5196988, 0.4946101, 0.5715163, 0.145098, 0, 1, 1,
0.5257437, -1.385069, 2.430999, 0.1529412, 0, 1, 1,
0.5276712, 0.3498117, 1.86416, 0.1568628, 0, 1, 1,
0.5306224, 0.1815601, 0.5012758, 0.1647059, 0, 1, 1,
0.5312571, -0.4923033, 1.944674, 0.1686275, 0, 1, 1,
0.5330567, -0.2378482, 2.122223, 0.1764706, 0, 1, 1,
0.5331232, -0.7774097, 1.908807, 0.1803922, 0, 1, 1,
0.5335523, -1.106025, 2.083594, 0.1882353, 0, 1, 1,
0.539997, 0.4884929, 1.106548, 0.1921569, 0, 1, 1,
0.5407395, 0.2328074, -0.5131402, 0.2, 0, 1, 1,
0.5412728, -0.4026963, 1.099445, 0.2078431, 0, 1, 1,
0.5418472, 0.8933678, 0.9113446, 0.2117647, 0, 1, 1,
0.5425899, -0.5655426, 1.644288, 0.2196078, 0, 1, 1,
0.5577216, -0.5093276, 2.698878, 0.2235294, 0, 1, 1,
0.5589235, 0.2574353, 1.999162, 0.2313726, 0, 1, 1,
0.5595023, 0.5976918, -0.498509, 0.2352941, 0, 1, 1,
0.562284, 1.012144, 0.6103141, 0.2431373, 0, 1, 1,
0.5735295, 0.9667308, 0.4005412, 0.2470588, 0, 1, 1,
0.5784479, -1.823366, 3.013395, 0.254902, 0, 1, 1,
0.5789592, -0.4411324, 2.186842, 0.2588235, 0, 1, 1,
0.5801755, -2.234165, 3.215199, 0.2666667, 0, 1, 1,
0.5910935, -1.189904, 2.338644, 0.2705882, 0, 1, 1,
0.5921255, 0.799922, 0.933246, 0.2784314, 0, 1, 1,
0.5934969, 0.2235293, 1.047258, 0.282353, 0, 1, 1,
0.5966617, -1.078771, 2.639043, 0.2901961, 0, 1, 1,
0.5999979, 0.8515082, 1.396002, 0.2941177, 0, 1, 1,
0.6027263, -0.07476399, 2.719628, 0.3019608, 0, 1, 1,
0.6049331, 1.197446, 0.6225019, 0.3098039, 0, 1, 1,
0.6064134, -0.7998077, 2.364353, 0.3137255, 0, 1, 1,
0.6133194, 1.297829, -0.7004492, 0.3215686, 0, 1, 1,
0.6150233, -0.8743055, 0.9833587, 0.3254902, 0, 1, 1,
0.6159662, 1.297872, 0.4579568, 0.3333333, 0, 1, 1,
0.6205856, 0.3739015, 0.1539676, 0.3372549, 0, 1, 1,
0.6218873, -0.2368201, 2.169719, 0.345098, 0, 1, 1,
0.6229312, -1.330486, 2.457323, 0.3490196, 0, 1, 1,
0.6231344, 0.1539096, 1.466268, 0.3568628, 0, 1, 1,
0.6231747, -0.7857779, 1.150557, 0.3607843, 0, 1, 1,
0.6232103, -0.47402, 2.98623, 0.3686275, 0, 1, 1,
0.6250194, -0.1650094, -0.9611508, 0.372549, 0, 1, 1,
0.6254815, 1.274302, -1.401277, 0.3803922, 0, 1, 1,
0.6259407, 0.08140289, 0.3466429, 0.3843137, 0, 1, 1,
0.6282885, -0.01822854, 0.7177372, 0.3921569, 0, 1, 1,
0.6291893, -2.110143, 3.6249, 0.3960784, 0, 1, 1,
0.6465504, 0.6760463, 0.3527207, 0.4039216, 0, 1, 1,
0.6582056, -0.3697124, 3.06817, 0.4117647, 0, 1, 1,
0.6593769, 1.211864, 2.090963, 0.4156863, 0, 1, 1,
0.6623387, 0.9891889, -0.5357651, 0.4235294, 0, 1, 1,
0.6673, 1.660847, -1.200304, 0.427451, 0, 1, 1,
0.6717578, -2.260504, 4.015254, 0.4352941, 0, 1, 1,
0.6724418, -0.01262106, 1.528733, 0.4392157, 0, 1, 1,
0.6848452, -1.651457, 3.123282, 0.4470588, 0, 1, 1,
0.686331, -0.6461744, 3.175992, 0.4509804, 0, 1, 1,
0.6885981, -0.2056542, 3.485143, 0.4588235, 0, 1, 1,
0.6959336, -0.3242531, 1.348833, 0.4627451, 0, 1, 1,
0.6964369, 0.8699479, 0.5051087, 0.4705882, 0, 1, 1,
0.6980818, 0.6247008, 1.744714, 0.4745098, 0, 1, 1,
0.6981031, 0.1676529, 0.9445682, 0.4823529, 0, 1, 1,
0.6995509, -0.133033, 1.997379, 0.4862745, 0, 1, 1,
0.7023503, -0.0459297, 2.878513, 0.4941176, 0, 1, 1,
0.7023677, -0.4209668, 2.08864, 0.5019608, 0, 1, 1,
0.7070767, 2.094468, -0.6210882, 0.5058824, 0, 1, 1,
0.7075885, -0.8488678, 1.319202, 0.5137255, 0, 1, 1,
0.709917, 1.537453, 0.06727543, 0.5176471, 0, 1, 1,
0.712244, 0.09414607, 2.177616, 0.5254902, 0, 1, 1,
0.7273045, -0.2488674, 2.989118, 0.5294118, 0, 1, 1,
0.7286687, 0.1184059, 1.375366, 0.5372549, 0, 1, 1,
0.7324721, -1.775681, 2.607732, 0.5411765, 0, 1, 1,
0.7373052, -0.4991083, 2.471282, 0.5490196, 0, 1, 1,
0.7387555, -0.5084049, 1.701185, 0.5529412, 0, 1, 1,
0.7596221, -0.6003454, 2.646014, 0.5607843, 0, 1, 1,
0.7656254, 0.5896178, -0.0436604, 0.5647059, 0, 1, 1,
0.7658449, 1.636845, -0.2182539, 0.572549, 0, 1, 1,
0.7667533, 0.6803065, 1.264708, 0.5764706, 0, 1, 1,
0.7685625, 0.1022185, 1.070838, 0.5843138, 0, 1, 1,
0.7703356, -1.342262, 3.161205, 0.5882353, 0, 1, 1,
0.7716125, -0.01445398, 1.82239, 0.5960785, 0, 1, 1,
0.7762021, 2.957855, 0.113373, 0.6039216, 0, 1, 1,
0.7815114, -1.232937, 3.56912, 0.6078432, 0, 1, 1,
0.7826059, -2.576412, 1.730847, 0.6156863, 0, 1, 1,
0.786422, 0.5751686, 1.427829, 0.6196079, 0, 1, 1,
0.7883473, 0.6652704, 1.39076, 0.627451, 0, 1, 1,
0.7885067, 1.65456, -1.170254, 0.6313726, 0, 1, 1,
0.792708, -1.964709, 2.800339, 0.6392157, 0, 1, 1,
0.798425, -1.415519, 1.920203, 0.6431373, 0, 1, 1,
0.8002264, 1.549351, 0.2710679, 0.6509804, 0, 1, 1,
0.8006282, -0.1642669, 1.665142, 0.654902, 0, 1, 1,
0.8030953, 0.3081514, 0.3561401, 0.6627451, 0, 1, 1,
0.8087752, 0.1009682, 1.490183, 0.6666667, 0, 1, 1,
0.815412, -1.999079, 2.817484, 0.6745098, 0, 1, 1,
0.8217705, -1.522536, 1.595544, 0.6784314, 0, 1, 1,
0.822005, -1.236124, 1.801561, 0.6862745, 0, 1, 1,
0.8231651, -0.5138487, 2.810402, 0.6901961, 0, 1, 1,
0.8241758, -0.189325, 1.054555, 0.6980392, 0, 1, 1,
0.8242713, 0.5494444, 1.069773, 0.7058824, 0, 1, 1,
0.8270875, 1.165655, -0.1558631, 0.7098039, 0, 1, 1,
0.8346614, 1.9432, -0.3274169, 0.7176471, 0, 1, 1,
0.8361391, -1.152912, 2.552613, 0.7215686, 0, 1, 1,
0.8367512, -1.991963, 2.974752, 0.7294118, 0, 1, 1,
0.8382289, -0.09268533, 1.354065, 0.7333333, 0, 1, 1,
0.8386661, -0.899223, 3.093606, 0.7411765, 0, 1, 1,
0.8388506, 0.9223828, -0.735846, 0.7450981, 0, 1, 1,
0.8395435, 0.2183747, 2.858193, 0.7529412, 0, 1, 1,
0.848285, 0.3048754, 0.6568379, 0.7568628, 0, 1, 1,
0.8488603, -2.254523, 4.404216, 0.7647059, 0, 1, 1,
0.8496625, -0.8303252, 3.888321, 0.7686275, 0, 1, 1,
0.8503283, 0.9598115, 0.4198904, 0.7764706, 0, 1, 1,
0.8520673, -0.7459713, 2.948821, 0.7803922, 0, 1, 1,
0.8536015, 0.0192288, 0.2253512, 0.7882353, 0, 1, 1,
0.8545971, 1.672419, 0.4735715, 0.7921569, 0, 1, 1,
0.855087, -0.09383975, -0.1020504, 0.8, 0, 1, 1,
0.8586915, 0.8356366, 1.408234, 0.8078431, 0, 1, 1,
0.8783476, -0.2277788, 1.66294, 0.8117647, 0, 1, 1,
0.8853516, -0.1084935, 0.4158142, 0.8196079, 0, 1, 1,
0.8902078, 0.4300824, 2.674843, 0.8235294, 0, 1, 1,
0.8908783, -0.00709019, 0.1689133, 0.8313726, 0, 1, 1,
0.8928473, -1.620676, 1.001354, 0.8352941, 0, 1, 1,
0.8984339, -0.4284379, 1.938207, 0.8431373, 0, 1, 1,
0.9029312, -0.1893748, 2.02414, 0.8470588, 0, 1, 1,
0.907734, -0.8797148, 2.36521, 0.854902, 0, 1, 1,
0.9084085, 0.003675518, 1.996425, 0.8588235, 0, 1, 1,
0.9202367, 0.4435972, 0.9811596, 0.8666667, 0, 1, 1,
0.9228102, -0.4448293, -0.0645754, 0.8705882, 0, 1, 1,
0.9287685, 0.227841, 2.483141, 0.8784314, 0, 1, 1,
0.9343141, -1.154172, 3.348139, 0.8823529, 0, 1, 1,
0.9378348, -1.373574, 3.565466, 0.8901961, 0, 1, 1,
0.9508815, -1.492565, 1.798227, 0.8941177, 0, 1, 1,
0.9526077, 0.820316, 1.456256, 0.9019608, 0, 1, 1,
0.9529138, 0.8684626, 0.777187, 0.9098039, 0, 1, 1,
0.9534109, -0.9430839, 2.654461, 0.9137255, 0, 1, 1,
0.9549847, -2.44202, 2.766145, 0.9215686, 0, 1, 1,
0.955458, 0.6780406, 0.9156602, 0.9254902, 0, 1, 1,
0.9603175, -0.630105, 3.51569, 0.9333333, 0, 1, 1,
0.9603846, 1.522189, 1.936957, 0.9372549, 0, 1, 1,
0.9628491, 0.1865516, -0.4080328, 0.945098, 0, 1, 1,
0.9633841, 2.420665, -0.05711561, 0.9490196, 0, 1, 1,
0.9646646, 0.1424388, 1.395214, 0.9568627, 0, 1, 1,
0.9663358, -0.3979249, 2.669922, 0.9607843, 0, 1, 1,
0.9696252, 1.634078, 0.9663249, 0.9686275, 0, 1, 1,
0.9745131, 0.1153404, 2.483278, 0.972549, 0, 1, 1,
0.9866, -0.1946054, 1.527639, 0.9803922, 0, 1, 1,
0.9875777, -0.678897, 2.610643, 0.9843137, 0, 1, 1,
0.9893929, 0.05265943, 0.9655165, 0.9921569, 0, 1, 1,
0.9935297, 0.3060353, 1.788549, 0.9960784, 0, 1, 1,
0.9949626, 0.1761631, 0.2130139, 1, 0, 0.9960784, 1,
1.005339, -0.5276211, 2.555791, 1, 0, 0.9882353, 1,
1.008182, 0.7140456, 1.500286, 1, 0, 0.9843137, 1,
1.011462, -1.018382, 2.870936, 1, 0, 0.9764706, 1,
1.011541, -0.04359813, -0.1072689, 1, 0, 0.972549, 1,
1.013616, -0.9875044, -0.3063041, 1, 0, 0.9647059, 1,
1.013791, -0.04763311, 2.104033, 1, 0, 0.9607843, 1,
1.014723, 0.5913514, 1.85346, 1, 0, 0.9529412, 1,
1.015467, -1.846626, 2.960385, 1, 0, 0.9490196, 1,
1.019859, -1.235795, 3.658837, 1, 0, 0.9411765, 1,
1.020231, 0.3970242, 1.850795, 1, 0, 0.9372549, 1,
1.020938, -1.620561, 1.685177, 1, 0, 0.9294118, 1,
1.023867, 1.431063, 1.306635, 1, 0, 0.9254902, 1,
1.028309, -1.086223, 1.967534, 1, 0, 0.9176471, 1,
1.028344, 1.164419, 0.7423941, 1, 0, 0.9137255, 1,
1.029834, -1.396117, 3.535334, 1, 0, 0.9058824, 1,
1.03064, 1.155321, 0.3130792, 1, 0, 0.9019608, 1,
1.034352, -0.7103442, 1.240905, 1, 0, 0.8941177, 1,
1.042019, 0.981727, 0.4496905, 1, 0, 0.8862745, 1,
1.044104, -0.4767092, 1.665239, 1, 0, 0.8823529, 1,
1.050353, 1.516217, 0.5906427, 1, 0, 0.8745098, 1,
1.053326, 0.3256411, 0.4682318, 1, 0, 0.8705882, 1,
1.05717, -0.7817068, 2.682661, 1, 0, 0.8627451, 1,
1.064128, 0.6408815, 0.9748986, 1, 0, 0.8588235, 1,
1.068089, -1.636665, 2.43622, 1, 0, 0.8509804, 1,
1.068252, -1.219098, 1.517993, 1, 0, 0.8470588, 1,
1.071555, 2.321268, 0.2774771, 1, 0, 0.8392157, 1,
1.072959, 0.2359883, 3.563826, 1, 0, 0.8352941, 1,
1.07691, -0.4011707, 2.596919, 1, 0, 0.827451, 1,
1.078417, -0.1193586, 1.816045, 1, 0, 0.8235294, 1,
1.078597, -1.021429, 2.930002, 1, 0, 0.8156863, 1,
1.091993, 2.421435, -1.702934, 1, 0, 0.8117647, 1,
1.098297, 0.1001483, 2.391403, 1, 0, 0.8039216, 1,
1.109685, -1.594651, 3.800909, 1, 0, 0.7960784, 1,
1.112057, 0.5477283, 2.238828, 1, 0, 0.7921569, 1,
1.114748, -1.76618, 1.019863, 1, 0, 0.7843137, 1,
1.123251, 0.4363884, 0.1169537, 1, 0, 0.7803922, 1,
1.124953, -0.9038587, 1.866324, 1, 0, 0.772549, 1,
1.126808, 0.07168675, -1.101403, 1, 0, 0.7686275, 1,
1.138804, 2.897502, 0.451858, 1, 0, 0.7607843, 1,
1.139838, 0.2975515, 1.36848, 1, 0, 0.7568628, 1,
1.146032, -0.1284369, 0.7284685, 1, 0, 0.7490196, 1,
1.148913, -2.106454, 3.73495, 1, 0, 0.7450981, 1,
1.149069, 1.756994, 3.014856, 1, 0, 0.7372549, 1,
1.155779, 1.594739, -0.2668102, 1, 0, 0.7333333, 1,
1.17016, 0.03774629, -1.591014, 1, 0, 0.7254902, 1,
1.180955, -1.924754, 4.3923, 1, 0, 0.7215686, 1,
1.182297, 2.454361, -0.1510309, 1, 0, 0.7137255, 1,
1.182614, 0.6287369, 2.255434, 1, 0, 0.7098039, 1,
1.182755, -1.217365, 3.619412, 1, 0, 0.7019608, 1,
1.183214, -0.4195281, 2.421194, 1, 0, 0.6941177, 1,
1.184595, 0.2587292, 3.020265, 1, 0, 0.6901961, 1,
1.185172, -0.7427326, 1.869911, 1, 0, 0.682353, 1,
1.191816, 0.7176535, 0.7101845, 1, 0, 0.6784314, 1,
1.194973, -1.996391, 1.678517, 1, 0, 0.6705883, 1,
1.20156, -1.746249, 3.307008, 1, 0, 0.6666667, 1,
1.218002, 0.9593656, 0.7161342, 1, 0, 0.6588235, 1,
1.223479, -0.5755435, 2.134572, 1, 0, 0.654902, 1,
1.224274, 1.546008, 1.416456, 1, 0, 0.6470588, 1,
1.233339, 0.2840445, -0.4554328, 1, 0, 0.6431373, 1,
1.235713, 1.322824, 0.4838309, 1, 0, 0.6352941, 1,
1.259859, -0.9238704, 2.882062, 1, 0, 0.6313726, 1,
1.262843, 0.4768956, 0.43876, 1, 0, 0.6235294, 1,
1.263222, -0.3367971, 2.282685, 1, 0, 0.6196079, 1,
1.269635, 0.1838535, 1.762553, 1, 0, 0.6117647, 1,
1.270923, 0.3092492, 0.6748763, 1, 0, 0.6078432, 1,
1.30365, 0.04420879, 1.435162, 1, 0, 0.6, 1,
1.304237, -0.1542939, 1.061751, 1, 0, 0.5921569, 1,
1.317966, 0.05673974, 1.125866, 1, 0, 0.5882353, 1,
1.318581, 0.4821725, 1.549112, 1, 0, 0.5803922, 1,
1.323104, 0.1129903, 0.2894172, 1, 0, 0.5764706, 1,
1.324662, -2.369045, 4.496724, 1, 0, 0.5686275, 1,
1.326055, 0.1303743, 1.141896, 1, 0, 0.5647059, 1,
1.32709, 0.4294529, 1.34489, 1, 0, 0.5568628, 1,
1.328271, -1.019585, 1.124519, 1, 0, 0.5529412, 1,
1.332285, -0.01723657, 1.559697, 1, 0, 0.5450981, 1,
1.338147, 0.07462835, 1.016303, 1, 0, 0.5411765, 1,
1.344607, 0.5477327, 2.646987, 1, 0, 0.5333334, 1,
1.347136, 0.3116148, 1.268597, 1, 0, 0.5294118, 1,
1.356592, 0.3663899, 0.9826422, 1, 0, 0.5215687, 1,
1.372084, -0.964633, 3.479583, 1, 0, 0.5176471, 1,
1.374059, 0.8183433, 2.455563, 1, 0, 0.509804, 1,
1.379905, 0.5928503, 1.540828, 1, 0, 0.5058824, 1,
1.384575, -0.5059812, 2.137698, 1, 0, 0.4980392, 1,
1.385034, 0.7688733, 1.70065, 1, 0, 0.4901961, 1,
1.39099, 1.30915, 2.163095, 1, 0, 0.4862745, 1,
1.394768, -0.9363475, 3.828517, 1, 0, 0.4784314, 1,
1.410827, -0.6093906, 1.757436, 1, 0, 0.4745098, 1,
1.425487, -1.226025, 1.433507, 1, 0, 0.4666667, 1,
1.427675, -0.1543353, 2.281355, 1, 0, 0.4627451, 1,
1.45321, 0.4522411, 0.6810164, 1, 0, 0.454902, 1,
1.462996, -0.1418299, 1.153566, 1, 0, 0.4509804, 1,
1.474727, -0.8975695, 3.643336, 1, 0, 0.4431373, 1,
1.503622, -0.6415837, 3.115963, 1, 0, 0.4392157, 1,
1.516044, -0.6748921, 1.735133, 1, 0, 0.4313726, 1,
1.536526, 0.07368549, 1.306806, 1, 0, 0.427451, 1,
1.536937, 1.683642, 0.7080432, 1, 0, 0.4196078, 1,
1.540859, 0.3006845, 0.4973825, 1, 0, 0.4156863, 1,
1.545289, 0.4588928, -0.7550602, 1, 0, 0.4078431, 1,
1.548446, -0.8967658, 1.291335, 1, 0, 0.4039216, 1,
1.555556, 0.04120386, 2.634525, 1, 0, 0.3960784, 1,
1.56843, 0.9684827, -0.7477655, 1, 0, 0.3882353, 1,
1.569654, -2.311029, 1.043092, 1, 0, 0.3843137, 1,
1.573141, 0.2493982, 3.696462, 1, 0, 0.3764706, 1,
1.579227, -2.001508, 2.590298, 1, 0, 0.372549, 1,
1.584193, 0.4955609, 0.4266304, 1, 0, 0.3647059, 1,
1.587712, 0.7695926, 0.2816629, 1, 0, 0.3607843, 1,
1.588037, -0.9541669, 2.088941, 1, 0, 0.3529412, 1,
1.616839, -0.2936205, 2.146133, 1, 0, 0.3490196, 1,
1.619019, 0.2985847, 0.3663144, 1, 0, 0.3411765, 1,
1.62127, -2.456756, 3.358489, 1, 0, 0.3372549, 1,
1.626473, 1.406665, 0.4621957, 1, 0, 0.3294118, 1,
1.628743, 0.3605969, 1.80036, 1, 0, 0.3254902, 1,
1.641571, -1.045713, 2.944505, 1, 0, 0.3176471, 1,
1.648038, 1.022738, 2.551004, 1, 0, 0.3137255, 1,
1.652708, -1.021045, 0.09682533, 1, 0, 0.3058824, 1,
1.674433, 0.5882936, 1.609479, 1, 0, 0.2980392, 1,
1.691051, 0.05015149, 2.851817, 1, 0, 0.2941177, 1,
1.697825, 1.742081, 1.817453, 1, 0, 0.2862745, 1,
1.698017, -1.840145, 0.9524957, 1, 0, 0.282353, 1,
1.700912, -2.46851, 1.563032, 1, 0, 0.2745098, 1,
1.719153, 1.549145, 2.028763, 1, 0, 0.2705882, 1,
1.72254, 1.917354, 0.4036795, 1, 0, 0.2627451, 1,
1.746992, 0.0342894, 0.5454322, 1, 0, 0.2588235, 1,
1.761208, 1.448651, 2.393329, 1, 0, 0.2509804, 1,
1.764558, -0.1693012, 1.396611, 1, 0, 0.2470588, 1,
1.769851, -1.585898, 3.089854, 1, 0, 0.2392157, 1,
1.773566, 0.7643612, 1.020155, 1, 0, 0.2352941, 1,
1.788939, 0.5694951, 2.152146, 1, 0, 0.227451, 1,
1.793721, 0.02909339, 1.656369, 1, 0, 0.2235294, 1,
1.799421, -0.3408418, 2.172609, 1, 0, 0.2156863, 1,
1.809745, 0.009198081, 2.585973, 1, 0, 0.2117647, 1,
1.832579, 0.2762856, 1.529918, 1, 0, 0.2039216, 1,
1.839858, 0.4608468, 2.431839, 1, 0, 0.1960784, 1,
1.857372, -2.386416, 3.044294, 1, 0, 0.1921569, 1,
1.883987, 2.630407, 0.6592538, 1, 0, 0.1843137, 1,
1.8872, 1.911143, 1.162727, 1, 0, 0.1803922, 1,
1.888488, 1.008735, -1.033516, 1, 0, 0.172549, 1,
1.890292, 1.034886, -0.03965639, 1, 0, 0.1686275, 1,
1.898911, 0.4575299, 2.126035, 1, 0, 0.1607843, 1,
1.902584, 0.5677711, 1.280339, 1, 0, 0.1568628, 1,
1.916431, 0.1430199, 1.415687, 1, 0, 0.1490196, 1,
1.925058, 0.6287259, 0.5266665, 1, 0, 0.145098, 1,
1.981802, -0.2282601, 2.728126, 1, 0, 0.1372549, 1,
1.981825, -0.615258, 2.057321, 1, 0, 0.1333333, 1,
1.990482, 0.5249856, 0.8714722, 1, 0, 0.1254902, 1,
1.996708, -0.5939686, 1.959303, 1, 0, 0.1215686, 1,
1.996977, 0.2118229, 0.4095688, 1, 0, 0.1137255, 1,
2.001375, 0.03685398, 1.824207, 1, 0, 0.1098039, 1,
2.02958, -0.08628535, 0.9837784, 1, 0, 0.1019608, 1,
2.063447, -0.346097, 0.9466101, 1, 0, 0.09411765, 1,
2.114497, -0.5139813, 2.784888, 1, 0, 0.09019608, 1,
2.128552, 0.7518606, 0.4122711, 1, 0, 0.08235294, 1,
2.129372, -0.05305833, 3.122613, 1, 0, 0.07843138, 1,
2.183078, -0.4594369, -0.2252462, 1, 0, 0.07058824, 1,
2.230776, 1.042684, 1.961077, 1, 0, 0.06666667, 1,
2.263789, 0.006794153, 1.918741, 1, 0, 0.05882353, 1,
2.283509, 0.6843151, 1.698322, 1, 0, 0.05490196, 1,
2.320019, -0.6599686, 0.9453841, 1, 0, 0.04705882, 1,
2.321543, -0.4028709, 1.214043, 1, 0, 0.04313726, 1,
2.368644, 0.1445629, 0.6417627, 1, 0, 0.03529412, 1,
2.435751, -0.08132359, 1.858275, 1, 0, 0.03137255, 1,
2.436765, -0.4889838, 1.060789, 1, 0, 0.02352941, 1,
2.771762, -0.1461754, 1.469482, 1, 0, 0.01960784, 1,
2.907432, -0.59663, 1.210681, 1, 0, 0.01176471, 1,
3.353213, -1.051082, 4.983808, 1, 0, 0.007843138, 1
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
0.08729422, -4.4971, -6.665072, 0, -0.5, 0.5, 0.5,
0.08729422, -4.4971, -6.665072, 1, -0.5, 0.5, 0.5,
0.08729422, -4.4971, -6.665072, 1, 1.5, 0.5, 0.5,
0.08729422, -4.4971, -6.665072, 0, 1.5, 0.5, 0.5
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
-4.285771, 0.1157525, -6.665072, 0, -0.5, 0.5, 0.5,
-4.285771, 0.1157525, -6.665072, 1, -0.5, 0.5, 0.5,
-4.285771, 0.1157525, -6.665072, 1, 1.5, 0.5, 0.5,
-4.285771, 0.1157525, -6.665072, 0, 1.5, 0.5, 0.5
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
-4.285771, -4.4971, 0.4229968, 0, -0.5, 0.5, 0.5,
-4.285771, -4.4971, 0.4229968, 1, -0.5, 0.5, 0.5,
-4.285771, -4.4971, 0.4229968, 1, 1.5, 0.5, 0.5,
-4.285771, -4.4971, 0.4229968, 0, 1.5, 0.5, 0.5
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
-3, -3.432596, -5.029364,
3, -3.432596, -5.029364,
-3, -3.432596, -5.029364,
-3, -3.610013, -5.301982,
-2, -3.432596, -5.029364,
-2, -3.610013, -5.301982,
-1, -3.432596, -5.029364,
-1, -3.610013, -5.301982,
0, -3.432596, -5.029364,
0, -3.610013, -5.301982,
1, -3.432596, -5.029364,
1, -3.610013, -5.301982,
2, -3.432596, -5.029364,
2, -3.610013, -5.301982,
3, -3.432596, -5.029364,
3, -3.610013, -5.301982
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
-3, -3.964848, -5.847218, 0, -0.5, 0.5, 0.5,
-3, -3.964848, -5.847218, 1, -0.5, 0.5, 0.5,
-3, -3.964848, -5.847218, 1, 1.5, 0.5, 0.5,
-3, -3.964848, -5.847218, 0, 1.5, 0.5, 0.5,
-2, -3.964848, -5.847218, 0, -0.5, 0.5, 0.5,
-2, -3.964848, -5.847218, 1, -0.5, 0.5, 0.5,
-2, -3.964848, -5.847218, 1, 1.5, 0.5, 0.5,
-2, -3.964848, -5.847218, 0, 1.5, 0.5, 0.5,
-1, -3.964848, -5.847218, 0, -0.5, 0.5, 0.5,
-1, -3.964848, -5.847218, 1, -0.5, 0.5, 0.5,
-1, -3.964848, -5.847218, 1, 1.5, 0.5, 0.5,
-1, -3.964848, -5.847218, 0, 1.5, 0.5, 0.5,
0, -3.964848, -5.847218, 0, -0.5, 0.5, 0.5,
0, -3.964848, -5.847218, 1, -0.5, 0.5, 0.5,
0, -3.964848, -5.847218, 1, 1.5, 0.5, 0.5,
0, -3.964848, -5.847218, 0, 1.5, 0.5, 0.5,
1, -3.964848, -5.847218, 0, -0.5, 0.5, 0.5,
1, -3.964848, -5.847218, 1, -0.5, 0.5, 0.5,
1, -3.964848, -5.847218, 1, 1.5, 0.5, 0.5,
1, -3.964848, -5.847218, 0, 1.5, 0.5, 0.5,
2, -3.964848, -5.847218, 0, -0.5, 0.5, 0.5,
2, -3.964848, -5.847218, 1, -0.5, 0.5, 0.5,
2, -3.964848, -5.847218, 1, 1.5, 0.5, 0.5,
2, -3.964848, -5.847218, 0, 1.5, 0.5, 0.5,
3, -3.964848, -5.847218, 0, -0.5, 0.5, 0.5,
3, -3.964848, -5.847218, 1, -0.5, 0.5, 0.5,
3, -3.964848, -5.847218, 1, 1.5, 0.5, 0.5,
3, -3.964848, -5.847218, 0, 1.5, 0.5, 0.5
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
-3.276603, -3, -5.029364,
-3.276603, 3, -5.029364,
-3.276603, -3, -5.029364,
-3.444797, -3, -5.301982,
-3.276603, -2, -5.029364,
-3.444797, -2, -5.301982,
-3.276603, -1, -5.029364,
-3.444797, -1, -5.301982,
-3.276603, 0, -5.029364,
-3.444797, 0, -5.301982,
-3.276603, 1, -5.029364,
-3.444797, 1, -5.301982,
-3.276603, 2, -5.029364,
-3.444797, 2, -5.301982,
-3.276603, 3, -5.029364,
-3.444797, 3, -5.301982
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
-3.781187, -3, -5.847218, 0, -0.5, 0.5, 0.5,
-3.781187, -3, -5.847218, 1, -0.5, 0.5, 0.5,
-3.781187, -3, -5.847218, 1, 1.5, 0.5, 0.5,
-3.781187, -3, -5.847218, 0, 1.5, 0.5, 0.5,
-3.781187, -2, -5.847218, 0, -0.5, 0.5, 0.5,
-3.781187, -2, -5.847218, 1, -0.5, 0.5, 0.5,
-3.781187, -2, -5.847218, 1, 1.5, 0.5, 0.5,
-3.781187, -2, -5.847218, 0, 1.5, 0.5, 0.5,
-3.781187, -1, -5.847218, 0, -0.5, 0.5, 0.5,
-3.781187, -1, -5.847218, 1, -0.5, 0.5, 0.5,
-3.781187, -1, -5.847218, 1, 1.5, 0.5, 0.5,
-3.781187, -1, -5.847218, 0, 1.5, 0.5, 0.5,
-3.781187, 0, -5.847218, 0, -0.5, 0.5, 0.5,
-3.781187, 0, -5.847218, 1, -0.5, 0.5, 0.5,
-3.781187, 0, -5.847218, 1, 1.5, 0.5, 0.5,
-3.781187, 0, -5.847218, 0, 1.5, 0.5, 0.5,
-3.781187, 1, -5.847218, 0, -0.5, 0.5, 0.5,
-3.781187, 1, -5.847218, 1, -0.5, 0.5, 0.5,
-3.781187, 1, -5.847218, 1, 1.5, 0.5, 0.5,
-3.781187, 1, -5.847218, 0, 1.5, 0.5, 0.5,
-3.781187, 2, -5.847218, 0, -0.5, 0.5, 0.5,
-3.781187, 2, -5.847218, 1, -0.5, 0.5, 0.5,
-3.781187, 2, -5.847218, 1, 1.5, 0.5, 0.5,
-3.781187, 2, -5.847218, 0, 1.5, 0.5, 0.5,
-3.781187, 3, -5.847218, 0, -0.5, 0.5, 0.5,
-3.781187, 3, -5.847218, 1, -0.5, 0.5, 0.5,
-3.781187, 3, -5.847218, 1, 1.5, 0.5, 0.5,
-3.781187, 3, -5.847218, 0, 1.5, 0.5, 0.5
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
-3.276603, -3.432596, -4,
-3.276603, -3.432596, 4,
-3.276603, -3.432596, -4,
-3.444797, -3.610013, -4,
-3.276603, -3.432596, -2,
-3.444797, -3.610013, -2,
-3.276603, -3.432596, 0,
-3.444797, -3.610013, 0,
-3.276603, -3.432596, 2,
-3.444797, -3.610013, 2,
-3.276603, -3.432596, 4,
-3.444797, -3.610013, 4
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
-3.781187, -3.964848, -4, 0, -0.5, 0.5, 0.5,
-3.781187, -3.964848, -4, 1, -0.5, 0.5, 0.5,
-3.781187, -3.964848, -4, 1, 1.5, 0.5, 0.5,
-3.781187, -3.964848, -4, 0, 1.5, 0.5, 0.5,
-3.781187, -3.964848, -2, 0, -0.5, 0.5, 0.5,
-3.781187, -3.964848, -2, 1, -0.5, 0.5, 0.5,
-3.781187, -3.964848, -2, 1, 1.5, 0.5, 0.5,
-3.781187, -3.964848, -2, 0, 1.5, 0.5, 0.5,
-3.781187, -3.964848, 0, 0, -0.5, 0.5, 0.5,
-3.781187, -3.964848, 0, 1, -0.5, 0.5, 0.5,
-3.781187, -3.964848, 0, 1, 1.5, 0.5, 0.5,
-3.781187, -3.964848, 0, 0, 1.5, 0.5, 0.5,
-3.781187, -3.964848, 2, 0, -0.5, 0.5, 0.5,
-3.781187, -3.964848, 2, 1, -0.5, 0.5, 0.5,
-3.781187, -3.964848, 2, 1, 1.5, 0.5, 0.5,
-3.781187, -3.964848, 2, 0, 1.5, 0.5, 0.5,
-3.781187, -3.964848, 4, 0, -0.5, 0.5, 0.5,
-3.781187, -3.964848, 4, 1, -0.5, 0.5, 0.5,
-3.781187, -3.964848, 4, 1, 1.5, 0.5, 0.5,
-3.781187, -3.964848, 4, 0, 1.5, 0.5, 0.5
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
-3.276603, -3.432596, -5.029364,
-3.276603, 3.664101, -5.029364,
-3.276603, -3.432596, 5.875358,
-3.276603, 3.664101, 5.875358,
-3.276603, -3.432596, -5.029364,
-3.276603, -3.432596, 5.875358,
-3.276603, 3.664101, -5.029364,
-3.276603, 3.664101, 5.875358,
-3.276603, -3.432596, -5.029364,
3.451191, -3.432596, -5.029364,
-3.276603, -3.432596, 5.875358,
3.451191, -3.432596, 5.875358,
-3.276603, 3.664101, -5.029364,
3.451191, 3.664101, -5.029364,
-3.276603, 3.664101, 5.875358,
3.451191, 3.664101, 5.875358,
3.451191, -3.432596, -5.029364,
3.451191, 3.664101, -5.029364,
3.451191, -3.432596, 5.875358,
3.451191, 3.664101, 5.875358,
3.451191, -3.432596, -5.029364,
3.451191, -3.432596, 5.875358,
3.451191, 3.664101, -5.029364,
3.451191, 3.664101, 5.875358
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
var radius = 7.821298;
var distance = 34.79784;
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
mvMatrix.translate( -0.08729422, -0.1157525, -0.4229968 );
mvMatrix.scale( 1.256956, 1.191617, 0.7754936 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79784);
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
C22H18Cl2FNO3<-read.table("C22H18Cl2FNO3.xyz", skip=1)
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
-3.178625, 0.1644071, -1.608339, 0, 0, 1, 1, 1,
-3.160712, 1.307714, 0.3585568, 1, 0, 0, 1, 1,
-2.704443, -1.630022, -0.7469606, 1, 0, 0, 1, 1,
-2.65476, 1.713269, -1.145805, 1, 0, 0, 1, 1,
-2.582708, -0.686416, -3.178324, 1, 0, 0, 1, 1,
-2.513585, 0.7258483, -0.621085, 1, 0, 0, 1, 1,
-2.448878, -0.3903437, -2.051999, 0, 0, 0, 1, 1,
-2.422414, -0.5086816, -2.464442, 0, 0, 0, 1, 1,
-2.41184, 0.109907, -1.900218, 0, 0, 0, 1, 1,
-2.268334, -0.4230974, -1.28999, 0, 0, 0, 1, 1,
-2.234692, -1.233535, -2.098711, 0, 0, 0, 1, 1,
-2.187381, 0.3295511, -0.7608207, 0, 0, 0, 1, 1,
-2.161098, 1.463688, -1.122005, 0, 0, 0, 1, 1,
-2.159646, 0.2367071, -0.1984144, 1, 1, 1, 1, 1,
-2.150755, 0.6773793, -1.461054, 1, 1, 1, 1, 1,
-2.143421, 0.7167997, -3.089021, 1, 1, 1, 1, 1,
-2.142547, 0.5276463, -0.7598791, 1, 1, 1, 1, 1,
-2.11534, 0.9095506, -0.1459388, 1, 1, 1, 1, 1,
-2.108444, -0.08149567, -0.4923348, 1, 1, 1, 1, 1,
-2.097399, -0.6534325, -2.85547, 1, 1, 1, 1, 1,
-2.076417, 0.07934147, -1.387757, 1, 1, 1, 1, 1,
-2.075045, 0.4869923, 0.7579411, 1, 1, 1, 1, 1,
-2.023488, 0.417728, -1.75853, 1, 1, 1, 1, 1,
-2.003584, 0.2753914, -2.359843, 1, 1, 1, 1, 1,
-1.984412, 0.9014916, -1.089281, 1, 1, 1, 1, 1,
-1.979981, 0.7139365, -2.133388, 1, 1, 1, 1, 1,
-1.966287, -0.1446825, -2.189099, 1, 1, 1, 1, 1,
-1.956861, 0.2001262, 1.07412, 1, 1, 1, 1, 1,
-1.922966, -1.177749, -2.153042, 0, 0, 1, 1, 1,
-1.916286, 0.5656331, -2.375095, 1, 0, 0, 1, 1,
-1.909094, -0.9023656, -2.444974, 1, 0, 0, 1, 1,
-1.874095, 0.04876921, -0.9145587, 1, 0, 0, 1, 1,
-1.85779, 1.261114, -1.291871, 1, 0, 0, 1, 1,
-1.854559, 1.499671, -0.5418819, 1, 0, 0, 1, 1,
-1.839668, -0.08582111, -1.369147, 0, 0, 0, 1, 1,
-1.827711, 0.6219512, -2.438845, 0, 0, 0, 1, 1,
-1.821136, -0.9267271, -2.032032, 0, 0, 0, 1, 1,
-1.820028, -1.851412, -1.976328, 0, 0, 0, 1, 1,
-1.805729, -0.6084659, -2.079852, 0, 0, 0, 1, 1,
-1.796491, -0.1829853, -2.060295, 0, 0, 0, 1, 1,
-1.794627, 1.190396, -0.232352, 0, 0, 0, 1, 1,
-1.785912, -0.8814456, -3.440578, 1, 1, 1, 1, 1,
-1.747289, -0.987095, -2.696048, 1, 1, 1, 1, 1,
-1.744858, 0.7054481, -0.809718, 1, 1, 1, 1, 1,
-1.739919, -0.1009573, 0.6618692, 1, 1, 1, 1, 1,
-1.735617, -0.453109, -0.7760835, 1, 1, 1, 1, 1,
-1.727445, 0.4871282, -1.391601, 1, 1, 1, 1, 1,
-1.718542, -0.6316263, -4.378769, 1, 1, 1, 1, 1,
-1.696057, 2.128224, -0.5172099, 1, 1, 1, 1, 1,
-1.687895, 0.755765, -1.138195, 1, 1, 1, 1, 1,
-1.682892, -1.029831, -0.1046335, 1, 1, 1, 1, 1,
-1.671699, 0.3448402, 0.9100471, 1, 1, 1, 1, 1,
-1.651225, -0.7999842, -2.181198, 1, 1, 1, 1, 1,
-1.640157, -2.121258, -2.796422, 1, 1, 1, 1, 1,
-1.635843, -1.830987, -1.782778, 1, 1, 1, 1, 1,
-1.616587, -0.6955007, -1.528713, 1, 1, 1, 1, 1,
-1.602125, -0.4169615, -1.963315, 0, 0, 1, 1, 1,
-1.599781, 0.730678, -0.6545995, 1, 0, 0, 1, 1,
-1.547675, 1.700644, -2.413176, 1, 0, 0, 1, 1,
-1.545372, 0.1749419, -0.6031785, 1, 0, 0, 1, 1,
-1.543769, 0.08585802, -1.602447, 1, 0, 0, 1, 1,
-1.541078, 1.206142, -0.7097255, 1, 0, 0, 1, 1,
-1.501467, -0.5671654, -4.115246, 0, 0, 0, 1, 1,
-1.497516, 0.02331902, -1.473752, 0, 0, 0, 1, 1,
-1.495677, -0.09303388, -0.877523, 0, 0, 0, 1, 1,
-1.492064, 1.549336, -0.5132286, 0, 0, 0, 1, 1,
-1.486389, -0.8735931, -1.738288, 0, 0, 0, 1, 1,
-1.479106, -0.3472499, -0.3557958, 0, 0, 0, 1, 1,
-1.476743, 0.3680267, -1.108402, 0, 0, 0, 1, 1,
-1.469974, 0.3514063, -1.530214, 1, 1, 1, 1, 1,
-1.465324, -1.253078, -3.554879, 1, 1, 1, 1, 1,
-1.449619, -1.615951, -1.520346, 1, 1, 1, 1, 1,
-1.43751, 1.899808, -0.947612, 1, 1, 1, 1, 1,
-1.431663, 1.111762, -0.03873889, 1, 1, 1, 1, 1,
-1.421297, -0.1025955, -1.0548, 1, 1, 1, 1, 1,
-1.383908, 0.06824351, -2.348186, 1, 1, 1, 1, 1,
-1.369301, 1.239005, -0.4562489, 1, 1, 1, 1, 1,
-1.368327, 0.464291, -2.199262, 1, 1, 1, 1, 1,
-1.356299, 0.6294944, -1.639335, 1, 1, 1, 1, 1,
-1.355264, 1.313065, -0.4788715, 1, 1, 1, 1, 1,
-1.355055, -0.2360939, -4.012582, 1, 1, 1, 1, 1,
-1.353298, -0.788996, -1.496711, 1, 1, 1, 1, 1,
-1.33094, -0.188707, -0.9452372, 1, 1, 1, 1, 1,
-1.320897, 0.4165618, 0.1106493, 1, 1, 1, 1, 1,
-1.315577, 2.481827, -1.371816, 0, 0, 1, 1, 1,
-1.314263, 0.300207, -2.400139, 1, 0, 0, 1, 1,
-1.298656, 0.1930886, -0.9135814, 1, 0, 0, 1, 1,
-1.29726, -0.165153, -4.190856, 1, 0, 0, 1, 1,
-1.295789, -0.4588853, -1.92967, 1, 0, 0, 1, 1,
-1.288643, -0.590941, -2.761539, 1, 0, 0, 1, 1,
-1.286919, 0.5942795, -0.6632445, 0, 0, 0, 1, 1,
-1.286446, -1.894845, -1.644554, 0, 0, 0, 1, 1,
-1.279094, -1.169423, -1.976553, 0, 0, 0, 1, 1,
-1.278596, 0.04342398, -2.433503, 0, 0, 0, 1, 1,
-1.272696, 0.04701242, 0.2158867, 0, 0, 0, 1, 1,
-1.268909, 0.2293398, -0.0349676, 0, 0, 0, 1, 1,
-1.268433, 0.7208776, -0.5960389, 0, 0, 0, 1, 1,
-1.267064, -0.2686897, -1.444064, 1, 1, 1, 1, 1,
-1.252532, -0.5893751, -3.286815, 1, 1, 1, 1, 1,
-1.245222, -1.04008, -3.804698, 1, 1, 1, 1, 1,
-1.235453, -0.680814, -0.6745378, 1, 1, 1, 1, 1,
-1.228274, -1.850153, -1.802751, 1, 1, 1, 1, 1,
-1.224855, 0.2625586, -2.538295, 1, 1, 1, 1, 1,
-1.223996, -0.906648, -2.480457, 1, 1, 1, 1, 1,
-1.222262, 1.272213, -1.239855, 1, 1, 1, 1, 1,
-1.219103, -2.398017, -3.397236, 1, 1, 1, 1, 1,
-1.21435, -1.183256, -2.974253, 1, 1, 1, 1, 1,
-1.206347, 1.140469, 0.1709219, 1, 1, 1, 1, 1,
-1.203311, 1.526822, -1.447116, 1, 1, 1, 1, 1,
-1.201744, -1.389954, -3.328159, 1, 1, 1, 1, 1,
-1.200851, 0.5339277, -1.133152, 1, 1, 1, 1, 1,
-1.192475, -0.1358334, -0.3816334, 1, 1, 1, 1, 1,
-1.184913, 0.4017159, -1.472232, 0, 0, 1, 1, 1,
-1.179378, 1.160416, -0.2885731, 1, 0, 0, 1, 1,
-1.174587, 0.3915095, -2.955654, 1, 0, 0, 1, 1,
-1.165148, 2.323954, -0.6480246, 1, 0, 0, 1, 1,
-1.145423, -0.4005254, -1.446557, 1, 0, 0, 1, 1,
-1.143812, 0.7678347, -0.9281204, 1, 0, 0, 1, 1,
-1.13986, 0.3066958, -1.515699, 0, 0, 0, 1, 1,
-1.139821, -0.2632986, -3.912303, 0, 0, 0, 1, 1,
-1.135432, -0.6176034, -1.594039, 0, 0, 0, 1, 1,
-1.131872, 0.6392944, -1.087191, 0, 0, 0, 1, 1,
-1.124326, 0.7775219, -2.742233, 0, 0, 0, 1, 1,
-1.118601, 1.582114, 0.6296448, 0, 0, 0, 1, 1,
-1.117575, 1.485743, 1.578323, 0, 0, 0, 1, 1,
-1.11627, -1.725243, -2.592969, 1, 1, 1, 1, 1,
-1.116088, 1.076832, -0.2761167, 1, 1, 1, 1, 1,
-1.113986, -0.03916974, -0.7768186, 1, 1, 1, 1, 1,
-1.109327, 0.8599078, -0.7727836, 1, 1, 1, 1, 1,
-1.108655, -0.5945541, -1.163179, 1, 1, 1, 1, 1,
-1.107329, -0.1790842, -0.8675092, 1, 1, 1, 1, 1,
-1.104806, -0.6209463, -1.692438, 1, 1, 1, 1, 1,
-1.102473, -0.07780626, -1.702099, 1, 1, 1, 1, 1,
-1.100556, 1.840105, -0.08301958, 1, 1, 1, 1, 1,
-1.083455, 0.1106068, -1.051342, 1, 1, 1, 1, 1,
-1.073115, -0.698554, -1.657009, 1, 1, 1, 1, 1,
-1.068397, -0.679728, -2.558778, 1, 1, 1, 1, 1,
-1.067293, -0.4236713, -1.804973, 1, 1, 1, 1, 1,
-1.065218, 1.572192, 0.05945067, 1, 1, 1, 1, 1,
-1.061988, -1.048824, -1.884771, 1, 1, 1, 1, 1,
-1.060163, 0.5451695, -2.370003, 0, 0, 1, 1, 1,
-1.054503, 0.6120656, 0.4409679, 1, 0, 0, 1, 1,
-1.048409, 0.5572236, -2.425309, 1, 0, 0, 1, 1,
-1.043419, 0.05291997, -1.929129, 1, 0, 0, 1, 1,
-1.038297, -0.5863582, -1.711901, 1, 0, 0, 1, 1,
-1.034642, -1.784461, -4.170547, 1, 0, 0, 1, 1,
-1.031763, -0.7111015, -1.31334, 0, 0, 0, 1, 1,
-1.019597, -0.4492714, -1.864194, 0, 0, 0, 1, 1,
-1.007274, 1.841613, 0.2243158, 0, 0, 0, 1, 1,
-1.00599, 0.350433, -2.542064, 0, 0, 0, 1, 1,
-0.9992088, 0.06927747, -1.892514, 0, 0, 0, 1, 1,
-0.9953902, 0.09108045, -1.344681, 0, 0, 0, 1, 1,
-0.9880931, 1.268569, -2.307815, 0, 0, 0, 1, 1,
-0.9750515, 0.3761953, -0.9737585, 1, 1, 1, 1, 1,
-0.9729529, -0.07076752, -2.026392, 1, 1, 1, 1, 1,
-0.9627637, -2.702929, -2.612329, 1, 1, 1, 1, 1,
-0.9621907, 1.097371, -1.779132, 1, 1, 1, 1, 1,
-0.961762, -0.8635635, -1.990745, 1, 1, 1, 1, 1,
-0.9592496, -1.034392, -3.381544, 1, 1, 1, 1, 1,
-0.9502937, 0.1790593, -1.486275, 1, 1, 1, 1, 1,
-0.948268, 0.9394145, 0.2659884, 1, 1, 1, 1, 1,
-0.9388653, 0.3103165, -1.61417, 1, 1, 1, 1, 1,
-0.9358082, -0.4108008, -2.96761, 1, 1, 1, 1, 1,
-0.9352651, 1.056709, -0.9529447, 1, 1, 1, 1, 1,
-0.9236335, -2.719324, -2.469294, 1, 1, 1, 1, 1,
-0.9210067, -0.3365933, -2.901799, 1, 1, 1, 1, 1,
-0.9189086, -0.08073592, -0.4622236, 1, 1, 1, 1, 1,
-0.915826, -1.763261, -1.995352, 1, 1, 1, 1, 1,
-0.9087517, -0.4698854, -0.8434005, 0, 0, 1, 1, 1,
-0.9074365, 1.16854, -0.5131539, 1, 0, 0, 1, 1,
-0.9051962, -1.025395, -1.682635, 1, 0, 0, 1, 1,
-0.9036865, 0.612736, -2.113057, 1, 0, 0, 1, 1,
-0.8973144, 1.825956, -1.570567, 1, 0, 0, 1, 1,
-0.8972881, -1.394141, -1.781994, 1, 0, 0, 1, 1,
-0.8927965, 0.9623119, -0.3849126, 0, 0, 0, 1, 1,
-0.8899121, -0.9125516, -2.012704, 0, 0, 0, 1, 1,
-0.8860603, -0.19258, -0.7429361, 0, 0, 0, 1, 1,
-0.8839064, -0.9459932, -2.136307, 0, 0, 0, 1, 1,
-0.8810518, 0.2189619, -2.317889, 0, 0, 0, 1, 1,
-0.8743005, -0.1162723, -1.653856, 0, 0, 0, 1, 1,
-0.8724958, -0.7729399, -2.020404, 0, 0, 0, 1, 1,
-0.8698853, 1.134881, 1.279835, 1, 1, 1, 1, 1,
-0.8654836, -0.000419159, -2.084336, 1, 1, 1, 1, 1,
-0.8528679, -0.6729432, -1.454031, 1, 1, 1, 1, 1,
-0.8516161, -0.7158859, -1.475852, 1, 1, 1, 1, 1,
-0.8508652, 0.5240935, -0.6496733, 1, 1, 1, 1, 1,
-0.8475028, 2.012427, -0.3141569, 1, 1, 1, 1, 1,
-0.8448594, 0.1580768, -2.16, 1, 1, 1, 1, 1,
-0.8377968, 0.8958591, -1.567543, 1, 1, 1, 1, 1,
-0.8337528, -0.315597, -2.015091, 1, 1, 1, 1, 1,
-0.8320975, 0.7693703, -3.365929, 1, 1, 1, 1, 1,
-0.8320029, 1.83904, 0.7884859, 1, 1, 1, 1, 1,
-0.8223757, -0.09797254, -2.175687, 1, 1, 1, 1, 1,
-0.8171483, -0.4192181, -1.404864, 1, 1, 1, 1, 1,
-0.8166507, 0.2550712, -2.044117, 1, 1, 1, 1, 1,
-0.8058667, -0.8761283, -3.650915, 1, 1, 1, 1, 1,
-0.8041736, -0.520319, -2.869365, 0, 0, 1, 1, 1,
-0.8024396, -1.537953, -2.451803, 1, 0, 0, 1, 1,
-0.8009868, -0.1301112, -2.660549, 1, 0, 0, 1, 1,
-0.800588, -2.109952, -2.553739, 1, 0, 0, 1, 1,
-0.7984703, 0.05565437, -1.515956, 1, 0, 0, 1, 1,
-0.7983496, -1.689996, -1.913454, 1, 0, 0, 1, 1,
-0.7886531, -0.1560958, -1.830738, 0, 0, 0, 1, 1,
-0.7862819, 0.5747012, -0.3097332, 0, 0, 0, 1, 1,
-0.7822129, 1.479802, -0.779432, 0, 0, 0, 1, 1,
-0.7818002, -0.1215666, -1.149168, 0, 0, 0, 1, 1,
-0.781518, 0.5252961, -1.436909, 0, 0, 0, 1, 1,
-0.7699921, 1.754997, -1.125516, 0, 0, 0, 1, 1,
-0.7681654, 0.6375217, 1.744192, 0, 0, 0, 1, 1,
-0.7657577, -0.1179473, -1.112512, 1, 1, 1, 1, 1,
-0.7629887, -0.7742663, -2.907241, 1, 1, 1, 1, 1,
-0.7628875, 1.860722, -0.1154626, 1, 1, 1, 1, 1,
-0.7594422, -0.7662087, -2.299066, 1, 1, 1, 1, 1,
-0.7579859, 0.2494618, -1.083363, 1, 1, 1, 1, 1,
-0.7567654, 0.03112944, -0.3362051, 1, 1, 1, 1, 1,
-0.7553141, 0.6649228, -1.475052, 1, 1, 1, 1, 1,
-0.7410411, -1.296784, -1.813977, 1, 1, 1, 1, 1,
-0.7326702, 1.10801, -1.486335, 1, 1, 1, 1, 1,
-0.7263535, -1.10992, -3.096489, 1, 1, 1, 1, 1,
-0.724623, -0.299789, -2.863518, 1, 1, 1, 1, 1,
-0.7236044, 0.4021645, -0.9226909, 1, 1, 1, 1, 1,
-0.7110554, -0.06430067, -0.4335235, 1, 1, 1, 1, 1,
-0.7000896, -0.1712397, -3.133584, 1, 1, 1, 1, 1,
-0.6996281, -0.4433655, -1.211329, 1, 1, 1, 1, 1,
-0.6988715, -0.02925502, -2.092696, 0, 0, 1, 1, 1,
-0.697535, 1.269389, -1.231739, 1, 0, 0, 1, 1,
-0.6937603, 0.9651474, -0.03256368, 1, 0, 0, 1, 1,
-0.6931417, 0.5724405, -0.4643038, 1, 0, 0, 1, 1,
-0.6922018, 0.04839216, -1.663676, 1, 0, 0, 1, 1,
-0.6840909, -0.282786, -3.268199, 1, 0, 0, 1, 1,
-0.6795695, 0.9036281, 0.4137752, 0, 0, 0, 1, 1,
-0.6757651, -0.4880882, -2.649018, 0, 0, 0, 1, 1,
-0.6741122, 1.436457, 1.119212, 0, 0, 0, 1, 1,
-0.673835, 0.425937, -0.06373014, 0, 0, 0, 1, 1,
-0.6652629, 2.395052, -0.3404071, 0, 0, 0, 1, 1,
-0.6616413, 0.7479221, 1.165804, 0, 0, 0, 1, 1,
-0.6616093, 0.5986601, -0.2118323, 0, 0, 0, 1, 1,
-0.6609372, -0.7071387, -3.084859, 1, 1, 1, 1, 1,
-0.6607512, -0.3679, -3.735793, 1, 1, 1, 1, 1,
-0.6599186, -0.5612633, -4.319078, 1, 1, 1, 1, 1,
-0.6567227, 2.306119, -0.198126, 1, 1, 1, 1, 1,
-0.6361388, -0.1913741, -1.469197, 1, 1, 1, 1, 1,
-0.6312801, -0.5479435, -2.139769, 1, 1, 1, 1, 1,
-0.6305825, 0.9364951, -0.2148465, 1, 1, 1, 1, 1,
-0.6266155, -0.3656152, -0.7869533, 1, 1, 1, 1, 1,
-0.6242254, -1.345713, -4.068535, 1, 1, 1, 1, 1,
-0.6232727, -1.545891, -3.395681, 1, 1, 1, 1, 1,
-0.6230375, -0.2854847, -2.317365, 1, 1, 1, 1, 1,
-0.617954, -1.286071, -0.5318894, 1, 1, 1, 1, 1,
-0.6148347, 0.8499684, 0.2963582, 1, 1, 1, 1, 1,
-0.610245, 1.765142, -0.6633618, 1, 1, 1, 1, 1,
-0.6075094, 0.2225343, -1.107577, 1, 1, 1, 1, 1,
-0.607068, -0.9108981, -2.701217, 0, 0, 1, 1, 1,
-0.6056864, -2.868076, -2.701314, 1, 0, 0, 1, 1,
-0.6046428, 0.02866871, -1.553461, 1, 0, 0, 1, 1,
-0.6031805, 0.3381351, -1.655032, 1, 0, 0, 1, 1,
-0.5912901, 0.4173995, -2.000607, 1, 0, 0, 1, 1,
-0.5897838, 0.04655559, -2.742882, 1, 0, 0, 1, 1,
-0.5873587, -0.6742851, -2.016548, 0, 0, 0, 1, 1,
-0.5860713, -1.722368, -2.801646, 0, 0, 0, 1, 1,
-0.5816299, 0.05820903, -1.318889, 0, 0, 0, 1, 1,
-0.5793887, -1.722878, -3.369309, 0, 0, 0, 1, 1,
-0.5726448, -0.1609751, -2.151861, 0, 0, 0, 1, 1,
-0.5715901, 0.4882649, -2.491055, 0, 0, 0, 1, 1,
-0.5710418, -0.003335626, -1.54676, 0, 0, 0, 1, 1,
-0.5707535, -0.2056823, -1.944281, 1, 1, 1, 1, 1,
-0.5658463, -0.7751495, -2.255953, 1, 1, 1, 1, 1,
-0.5656946, 0.7020699, -0.5989322, 1, 1, 1, 1, 1,
-0.5599194, 1.742488, -1.095177, 1, 1, 1, 1, 1,
-0.5577492, 0.5431424, -1.518393, 1, 1, 1, 1, 1,
-0.5571093, 0.2407343, -1.381573, 1, 1, 1, 1, 1,
-0.5540859, -1.025905, -2.700472, 1, 1, 1, 1, 1,
-0.551177, 0.2915221, -3.088008, 1, 1, 1, 1, 1,
-0.5501745, -0.1952951, -1.942003, 1, 1, 1, 1, 1,
-0.5488286, -1.043303, -2.914299, 1, 1, 1, 1, 1,
-0.5476879, 0.732448, -0.5645021, 1, 1, 1, 1, 1,
-0.5456603, -1.317125, -2.932226, 1, 1, 1, 1, 1,
-0.5421861, 0.2261649, -0.07900713, 1, 1, 1, 1, 1,
-0.5413691, -0.5026942, -2.990876, 1, 1, 1, 1, 1,
-0.5381619, 0.640989, -1.543347, 1, 1, 1, 1, 1,
-0.5367927, 1.953762, -0.2090025, 0, 0, 1, 1, 1,
-0.5357434, 0.5933971, -0.4583069, 1, 0, 0, 1, 1,
-0.5292891, -1.120692, -2.19433, 1, 0, 0, 1, 1,
-0.5285236, -0.9899103, -2.211142, 1, 0, 0, 1, 1,
-0.5251362, 0.09344898, -0.1620719, 1, 0, 0, 1, 1,
-0.5243381, -0.1874378, -3.629531, 1, 0, 0, 1, 1,
-0.5229651, -0.4736249, -2.500834, 0, 0, 0, 1, 1,
-0.5225682, 0.6082136, -1.22765, 0, 0, 0, 1, 1,
-0.5186381, 0.04097186, -1.441573, 0, 0, 0, 1, 1,
-0.5183718, -0.430585, -3.636794, 0, 0, 0, 1, 1,
-0.5159071, -0.2658746, -0.7502079, 0, 0, 0, 1, 1,
-0.5154513, 0.9067526, 0.09771957, 0, 0, 0, 1, 1,
-0.5105814, 0.9638444, -0.7964025, 0, 0, 0, 1, 1,
-0.5074346, 0.7604843, 0.728214, 1, 1, 1, 1, 1,
-0.5074315, 0.415899, -2.72752, 1, 1, 1, 1, 1,
-0.5039348, 0.2697034, -0.0854122, 1, 1, 1, 1, 1,
-0.5011355, -0.8208078, -1.255414, 1, 1, 1, 1, 1,
-0.5003751, -0.7656592, -0.7573684, 1, 1, 1, 1, 1,
-0.4963005, -0.1289956, -1.467901, 1, 1, 1, 1, 1,
-0.494264, -0.6124171, -2.89676, 1, 1, 1, 1, 1,
-0.4920534, -0.5158064, -1.619166, 1, 1, 1, 1, 1,
-0.4900616, 1.326515, -0.5137089, 1, 1, 1, 1, 1,
-0.4899539, 0.3995809, 0.5767803, 1, 1, 1, 1, 1,
-0.4854635, 1.254564, -0.849856, 1, 1, 1, 1, 1,
-0.4853339, 0.04026701, -0.8457435, 1, 1, 1, 1, 1,
-0.4847104, -0.7659246, -3.311733, 1, 1, 1, 1, 1,
-0.4819163, 0.9612941, -1.576207, 1, 1, 1, 1, 1,
-0.480697, -0.3908446, -2.833168, 1, 1, 1, 1, 1,
-0.4754378, 0.9233633, 0.1584931, 0, 0, 1, 1, 1,
-0.4692982, -0.3631692, -1.905578, 1, 0, 0, 1, 1,
-0.4664192, -0.4818076, -2.577883, 1, 0, 0, 1, 1,
-0.4653911, -1.386261, -3.907358, 1, 0, 0, 1, 1,
-0.4629617, 0.07870689, -1.707993, 1, 0, 0, 1, 1,
-0.4624176, 0.8370295, -3.861997, 1, 0, 0, 1, 1,
-0.4619154, 0.4927542, -0.003795815, 0, 0, 0, 1, 1,
-0.4604782, 0.01647608, 0.9223169, 0, 0, 0, 1, 1,
-0.4601272, 1.509031, -1.874606, 0, 0, 0, 1, 1,
-0.4585865, -1.250722, -4.860103, 0, 0, 0, 1, 1,
-0.4576222, -0.02205325, -0.6695639, 0, 0, 0, 1, 1,
-0.456086, -0.2176533, -1.130883, 0, 0, 0, 1, 1,
-0.4560246, -0.6558055, -3.364599, 0, 0, 0, 1, 1,
-0.4522603, 0.03657199, -1.029253, 1, 1, 1, 1, 1,
-0.4513599, -1.705436, 0.07349403, 1, 1, 1, 1, 1,
-0.4468818, 2.200524, -1.646016, 1, 1, 1, 1, 1,
-0.4397709, 0.7100425, -0.7705324, 1, 1, 1, 1, 1,
-0.4302027, 0.6585374, -0.5878018, 1, 1, 1, 1, 1,
-0.4301719, 2.364652, 0.4319188, 1, 1, 1, 1, 1,
-0.4198215, -0.5207959, -2.176896, 1, 1, 1, 1, 1,
-0.4113643, -0.4752924, -2.87508, 1, 1, 1, 1, 1,
-0.4064887, -0.6066319, -2.758789, 1, 1, 1, 1, 1,
-0.4060638, 0.9671407, 0.9518893, 1, 1, 1, 1, 1,
-0.4059834, -0.154605, -1.454471, 1, 1, 1, 1, 1,
-0.4056392, -1.652557, -3.738338, 1, 1, 1, 1, 1,
-0.3935469, -0.9613455, -1.700351, 1, 1, 1, 1, 1,
-0.3910061, 2.009331, -0.4317134, 1, 1, 1, 1, 1,
-0.3907104, 1.036821, -1.384159, 1, 1, 1, 1, 1,
-0.390665, 0.1406941, -0.693244, 0, 0, 1, 1, 1,
-0.3900702, 0.8511975, -0.2127155, 1, 0, 0, 1, 1,
-0.3894926, -0.1723484, -3.938887, 1, 0, 0, 1, 1,
-0.3787947, 0.8757449, -1.142185, 1, 0, 0, 1, 1,
-0.3761392, -0.2390953, -3.24066, 1, 0, 0, 1, 1,
-0.3751856, 2.26546, 0.9852161, 1, 0, 0, 1, 1,
-0.3745997, 0.1685286, -2.430113, 0, 0, 0, 1, 1,
-0.3720346, -0.5156212, -1.652935, 0, 0, 0, 1, 1,
-0.3700611, 0.214687, -0.8498561, 0, 0, 0, 1, 1,
-0.3695256, 0.4067438, -0.9152307, 0, 0, 0, 1, 1,
-0.3676024, -0.3573657, -2.89494, 0, 0, 0, 1, 1,
-0.3642034, -0.2155257, -2.360046, 0, 0, 0, 1, 1,
-0.3603929, 1.091671, 0.01488198, 0, 0, 0, 1, 1,
-0.3591452, 0.1655205, -1.891658, 1, 1, 1, 1, 1,
-0.3570075, 1.019321, 2.269446, 1, 1, 1, 1, 1,
-0.3567387, -1.549143, -2.061898, 1, 1, 1, 1, 1,
-0.3565266, 0.2801422, -1.990359, 1, 1, 1, 1, 1,
-0.3538495, 0.3221466, 1.239907, 1, 1, 1, 1, 1,
-0.3534593, -3.329246, -4.870557, 1, 1, 1, 1, 1,
-0.3429368, -0.4432684, -3.09773, 1, 1, 1, 1, 1,
-0.3391913, -1.278703, -2.861958, 1, 1, 1, 1, 1,
-0.3376969, 0.209254, -0.701866, 1, 1, 1, 1, 1,
-0.3348972, 0.4895894, -0.2602982, 1, 1, 1, 1, 1,
-0.3348043, -0.7178972, -1.955857, 1, 1, 1, 1, 1,
-0.332352, -0.03770155, -2.818234, 1, 1, 1, 1, 1,
-0.33034, -2.809265, -3.623047, 1, 1, 1, 1, 1,
-0.3302026, 0.04636126, -0.2706517, 1, 1, 1, 1, 1,
-0.324379, 1.055904, -1.538508, 1, 1, 1, 1, 1,
-0.3242717, -0.4719829, -3.033283, 0, 0, 1, 1, 1,
-0.3203655, 0.4155396, 0.5224485, 1, 0, 0, 1, 1,
-0.31671, -0.1293435, -3.045009, 1, 0, 0, 1, 1,
-0.3150245, -0.4389624, -3.704837, 1, 0, 0, 1, 1,
-0.3126819, -0.1132057, -1.231407, 1, 0, 0, 1, 1,
-0.3126636, 0.6485105, -0.147394, 1, 0, 0, 1, 1,
-0.3121836, 0.1357469, -1.144736, 0, 0, 0, 1, 1,
-0.3114283, 0.2080702, -1.215487, 0, 0, 0, 1, 1,
-0.3101784, 0.5401984, -0.7817422, 0, 0, 0, 1, 1,
-0.3096811, -0.5475285, -2.998728, 0, 0, 0, 1, 1,
-0.3084813, 0.6718814, -1.197739, 0, 0, 0, 1, 1,
-0.3079357, -0.1104474, -3.183771, 0, 0, 0, 1, 1,
-0.305203, 1.24148, -0.4998662, 0, 0, 0, 1, 1,
-0.3044966, 0.504944, 0.4401725, 1, 1, 1, 1, 1,
-0.2951327, -1.296383, -2.079514, 1, 1, 1, 1, 1,
-0.2943369, -0.4501083, -1.934453, 1, 1, 1, 1, 1,
-0.2833149, 0.6731637, -0.4267159, 1, 1, 1, 1, 1,
-0.279756, 0.1450263, -0.9788609, 1, 1, 1, 1, 1,
-0.2749034, 0.1431233, -1.733994, 1, 1, 1, 1, 1,
-0.2748908, 1.703334, -0.3398529, 1, 1, 1, 1, 1,
-0.2704385, 0.05643107, 0.2164117, 1, 1, 1, 1, 1,
-0.2651974, -1.394916, -3.225034, 1, 1, 1, 1, 1,
-0.2594877, -1.283191, -2.477067, 1, 1, 1, 1, 1,
-0.2589005, -0.002374068, -3.054721, 1, 1, 1, 1, 1,
-0.2534128, 0.227462, -1.644921, 1, 1, 1, 1, 1,
-0.2516944, 0.5446732, -1.429031, 1, 1, 1, 1, 1,
-0.2484928, -0.03558803, -1.59104, 1, 1, 1, 1, 1,
-0.2477927, 1.530887, -0.7280635, 1, 1, 1, 1, 1,
-0.2477547, 0.4171606, -1.885568, 0, 0, 1, 1, 1,
-0.2472652, 0.844352, -0.4123606, 1, 0, 0, 1, 1,
-0.2453311, 0.9338615, 0.9842072, 1, 0, 0, 1, 1,
-0.2444283, -0.6377639, -1.461116, 1, 0, 0, 1, 1,
-0.2405326, -0.6320987, -2.218997, 1, 0, 0, 1, 1,
-0.2386746, -0.296123, -2.665735, 1, 0, 0, 1, 1,
-0.2364258, 0.2621252, -0.4913496, 0, 0, 0, 1, 1,
-0.2329106, 2.190214, -1.382744, 0, 0, 0, 1, 1,
-0.2322339, 0.8301133, -0.4197218, 0, 0, 0, 1, 1,
-0.2317721, 2.404726, -1.263428, 0, 0, 0, 1, 1,
-0.2289725, 0.2121614, -0.09752502, 0, 0, 0, 1, 1,
-0.2267687, -0.4334482, -2.77743, 0, 0, 0, 1, 1,
-0.2266689, 0.8276219, -1.433756, 0, 0, 0, 1, 1,
-0.2231697, -0.6762199, -2.419845, 1, 1, 1, 1, 1,
-0.2220573, -0.5521976, -3.181657, 1, 1, 1, 1, 1,
-0.2184557, -0.05831916, -1.70558, 1, 1, 1, 1, 1,
-0.2169399, -1.194019, -3.381948, 1, 1, 1, 1, 1,
-0.2115195, 0.7268977, -0.4927213, 1, 1, 1, 1, 1,
-0.2111322, 0.01574732, -0.7847683, 1, 1, 1, 1, 1,
-0.2103533, 0.01690708, -1.142177, 1, 1, 1, 1, 1,
-0.2079264, -0.6583278, -2.575821, 1, 1, 1, 1, 1,
-0.2060847, -0.03144037, -1.275491, 1, 1, 1, 1, 1,
-0.2027128, 1.854548, -1.329964, 1, 1, 1, 1, 1,
-0.1995751, 1.370142, 0.3171659, 1, 1, 1, 1, 1,
-0.1982053, -1.382097, -3.47438, 1, 1, 1, 1, 1,
-0.1977423, 0.09814967, -0.7984223, 1, 1, 1, 1, 1,
-0.1976911, -1.559706, -1.868, 1, 1, 1, 1, 1,
-0.197144, 3.560751, 0.1627161, 1, 1, 1, 1, 1,
-0.1839975, -2.464998, -2.289622, 0, 0, 1, 1, 1,
-0.1839711, -1.395175, -1.973564, 1, 0, 0, 1, 1,
-0.1813571, 1.23424, -0.6134719, 1, 0, 0, 1, 1,
-0.1709123, -0.1208538, -2.379905, 1, 0, 0, 1, 1,
-0.1708408, 1.189295, -1.492869, 1, 0, 0, 1, 1,
-0.170702, 0.9045967, -0.5867797, 1, 0, 0, 1, 1,
-0.1671312, 0.9591538, 0.7562402, 0, 0, 0, 1, 1,
-0.1656583, -1.033909, -3.455611, 0, 0, 0, 1, 1,
-0.1646922, -0.2453728, -2.213693, 0, 0, 0, 1, 1,
-0.15163, -1.198906, -3.388859, 0, 0, 0, 1, 1,
-0.1504013, 1.041256, -0.214761, 0, 0, 0, 1, 1,
-0.1484615, 0.9977068, 0.9899602, 0, 0, 0, 1, 1,
-0.1476254, -0.02226933, -2.346203, 0, 0, 0, 1, 1,
-0.1465399, -0.6332873, -3.75944, 1, 1, 1, 1, 1,
-0.1393689, -0.7863873, -3.627349, 1, 1, 1, 1, 1,
-0.1370554, -0.5843666, -2.16491, 1, 1, 1, 1, 1,
-0.1360306, 0.7521042, -0.0858478, 1, 1, 1, 1, 1,
-0.1351001, 0.7431076, 0.8751963, 1, 1, 1, 1, 1,
-0.1337921, 0.6368895, 0.3207979, 1, 1, 1, 1, 1,
-0.1298638, -0.6709587, -2.670252, 1, 1, 1, 1, 1,
-0.1259011, -0.09638425, -1.494997, 1, 1, 1, 1, 1,
-0.1219605, -0.2127256, -4.363697, 1, 1, 1, 1, 1,
-0.1208473, -0.07178463, -0.541835, 1, 1, 1, 1, 1,
-0.1201463, 0.197022, 0.3872969, 1, 1, 1, 1, 1,
-0.1197018, -1.561776, -3.041455, 1, 1, 1, 1, 1,
-0.1128305, 0.2396184, 0.08021747, 1, 1, 1, 1, 1,
-0.1123646, 1.086377, 1.283332, 1, 1, 1, 1, 1,
-0.1121186, 0.006822153, -2.978843, 1, 1, 1, 1, 1,
-0.1096662, -0.7956994, -3.628042, 0, 0, 1, 1, 1,
-0.1076872, 2.231296, -0.2873685, 1, 0, 0, 1, 1,
-0.1071547, 0.4689336, -0.6735504, 1, 0, 0, 1, 1,
-0.1048925, 1.816691, -0.3738035, 1, 0, 0, 1, 1,
-0.1022766, 2.112954, 1.422402, 1, 0, 0, 1, 1,
-0.09782188, 1.553941, -1.091835, 1, 0, 0, 1, 1,
-0.09707654, 0.6245421, -1.604835, 0, 0, 0, 1, 1,
-0.09583928, 0.7377417, -1.749303, 0, 0, 0, 1, 1,
-0.09065006, -1.668177, -3.716894, 0, 0, 0, 1, 1,
-0.07469339, -1.862745, -4.115889, 0, 0, 0, 1, 1,
-0.07298404, -0.2825867, -0.6852636, 0, 0, 0, 1, 1,
-0.07158453, 1.580172, -1.363268, 0, 0, 0, 1, 1,
-0.070737, 1.08682, 0.009480998, 0, 0, 0, 1, 1,
-0.06603925, 2.209622, 1.016992, 1, 1, 1, 1, 1,
-0.06282862, 0.9643902, 1.145693, 1, 1, 1, 1, 1,
-0.06066932, -0.2563426, -0.9515149, 1, 1, 1, 1, 1,
-0.05831514, 0.3007624, 1.286857, 1, 1, 1, 1, 1,
-0.05419211, -0.6026259, -2.266057, 1, 1, 1, 1, 1,
-0.05410135, -0.4607232, -4.367051, 1, 1, 1, 1, 1,
-0.05234674, 0.4755894, -0.1907456, 1, 1, 1, 1, 1,
-0.05128694, -1.36585, -2.613974, 1, 1, 1, 1, 1,
-0.05059448, -1.181991, -2.672341, 1, 1, 1, 1, 1,
-0.04565912, -1.900892, -3.043049, 1, 1, 1, 1, 1,
-0.04192292, 1.144534, -0.2668881, 1, 1, 1, 1, 1,
-0.04172046, 1.925065, -0.1314207, 1, 1, 1, 1, 1,
-0.0387822, 0.9512282, -1.31059, 1, 1, 1, 1, 1,
-0.03287914, -2.113158, -3.943492, 1, 1, 1, 1, 1,
-0.02538369, 0.7817906, -0.3566954, 1, 1, 1, 1, 1,
-0.01748214, -1.733958, -2.150858, 0, 0, 1, 1, 1,
-0.01547971, 0.4842248, -1.692045, 1, 0, 0, 1, 1,
-0.01235919, 0.5179977, 0.3510662, 1, 0, 0, 1, 1,
-0.01087116, -0.9403681, -4.065639, 1, 0, 0, 1, 1,
0.002708178, -0.3541062, 3.073934, 1, 0, 0, 1, 1,
0.005879535, -1.251759, 2.272723, 1, 0, 0, 1, 1,
0.01203523, -1.217544, 3.549989, 0, 0, 0, 1, 1,
0.01310876, 0.7830275, -0.6011301, 0, 0, 0, 1, 1,
0.01711848, 0.4271893, -0.9723883, 0, 0, 0, 1, 1,
0.01751303, -0.6707124, 3.090687, 0, 0, 0, 1, 1,
0.02144091, -1.092088, 2.998173, 0, 0, 0, 1, 1,
0.02252747, -0.8597279, 1.953202, 0, 0, 0, 1, 1,
0.03251144, -0.1801353, 2.937773, 0, 0, 0, 1, 1,
0.0339406, 0.03645312, -0.8056779, 1, 1, 1, 1, 1,
0.03577506, 1.433206, -0.04827981, 1, 1, 1, 1, 1,
0.03616368, -1.192432, 3.03028, 1, 1, 1, 1, 1,
0.0361718, 0.2548943, -0.8841068, 1, 1, 1, 1, 1,
0.04194303, 0.3419084, -0.5984455, 1, 1, 1, 1, 1,
0.04564688, 0.3972669, -0.2946839, 1, 1, 1, 1, 1,
0.04658612, -0.3730611, 4.119069, 1, 1, 1, 1, 1,
0.04744162, -1.027676, 2.533266, 1, 1, 1, 1, 1,
0.05008521, -2.817477, 3.44218, 1, 1, 1, 1, 1,
0.05355171, -0.05104646, 2.689257, 1, 1, 1, 1, 1,
0.05359581, 1.066532, 0.1712126, 1, 1, 1, 1, 1,
0.05904832, 0.1561037, 0.2628357, 1, 1, 1, 1, 1,
0.06097195, 1.443167, -0.4493103, 1, 1, 1, 1, 1,
0.06105798, -0.2657726, 2.426606, 1, 1, 1, 1, 1,
0.06212774, 0.4361194, 0.7011006, 1, 1, 1, 1, 1,
0.0633482, -0.2149161, 2.92298, 0, 0, 1, 1, 1,
0.06550988, -0.3517963, 2.646911, 1, 0, 0, 1, 1,
0.06637417, -0.2396227, 2.108218, 1, 0, 0, 1, 1,
0.06917498, -0.7564436, 3.266466, 1, 0, 0, 1, 1,
0.0697807, -0.973325, 1.527448, 1, 0, 0, 1, 1,
0.07180094, -0.1104059, 2.74575, 1, 0, 0, 1, 1,
0.07362705, 0.2101659, 0.191445, 0, 0, 0, 1, 1,
0.07480635, 1.51438, -0.05562307, 0, 0, 0, 1, 1,
0.07568065, -0.5800393, 2.378205, 0, 0, 0, 1, 1,
0.07666145, -0.1750991, 1.243397, 0, 0, 0, 1, 1,
0.08003091, -0.366049, 2.042385, 0, 0, 0, 1, 1,
0.08340678, 1.902689, -0.5133075, 0, 0, 0, 1, 1,
0.08741321, -0.3259889, 2.856627, 0, 0, 0, 1, 1,
0.08878685, 0.2766367, 0.4565669, 1, 1, 1, 1, 1,
0.0906556, 0.466041, -0.296096, 1, 1, 1, 1, 1,
0.09401879, -0.06014379, 1.033325, 1, 1, 1, 1, 1,
0.09632078, 1.033423, 1.218021, 1, 1, 1, 1, 1,
0.09816564, 0.3414561, 2.20044, 1, 1, 1, 1, 1,
0.09900884, -1.574668, 2.678777, 1, 1, 1, 1, 1,
0.1066311, 0.717175, 0.4387366, 1, 1, 1, 1, 1,
0.1071742, 0.0248852, 0.928157, 1, 1, 1, 1, 1,
0.1087068, -1.53225, 2.957437, 1, 1, 1, 1, 1,
0.1106093, 1.153592, 0.7548789, 1, 1, 1, 1, 1,
0.1109884, 1.083438, 0.9390017, 1, 1, 1, 1, 1,
0.1151941, 2.105642, -1.11342, 1, 1, 1, 1, 1,
0.1203741, 0.910741, -0.7378023, 1, 1, 1, 1, 1,
0.1206105, -0.08530138, 1.634114, 1, 1, 1, 1, 1,
0.1240682, 0.5809863, 1.081801, 1, 1, 1, 1, 1,
0.1247945, 1.507077, 0.00363708, 0, 0, 1, 1, 1,
0.1274981, -0.5932093, 2.552892, 1, 0, 0, 1, 1,
0.1304654, -0.2148917, 2.865824, 1, 0, 0, 1, 1,
0.1310115, -1.306896, 2.755807, 1, 0, 0, 1, 1,
0.1341857, 0.5890791, 0.6731321, 1, 0, 0, 1, 1,
0.1370624, 0.3369763, -0.6352711, 1, 0, 0, 1, 1,
0.1374395, -0.4378083, 2.238297, 0, 0, 0, 1, 1,
0.1390254, -0.2169922, 3.41358, 0, 0, 0, 1, 1,
0.1393544, 0.7907732, 0.2182171, 0, 0, 0, 1, 1,
0.1394732, 0.005397959, 0.9156132, 0, 0, 0, 1, 1,
0.145282, 0.9121128, 0.006719321, 0, 0, 0, 1, 1,
0.1465634, 0.2596889, 1.018075, 0, 0, 0, 1, 1,
0.1466871, 0.9325108, -0.7759598, 0, 0, 0, 1, 1,
0.1470728, 1.571337, 0.9080982, 1, 1, 1, 1, 1,
0.1505612, 0.5866625, 1.222981, 1, 1, 1, 1, 1,
0.1557581, 0.3288972, 1.054893, 1, 1, 1, 1, 1,
0.1565755, -2.611571, 3.504065, 1, 1, 1, 1, 1,
0.1582217, 3.186013, -1.465621, 1, 1, 1, 1, 1,
0.1615244, -0.5866901, 3.090886, 1, 1, 1, 1, 1,
0.1657501, -0.9175034, 2.238869, 1, 1, 1, 1, 1,
0.1698704, -0.6521515, 2.318946, 1, 1, 1, 1, 1,
0.1749818, 0.2619955, 1.73801, 1, 1, 1, 1, 1,
0.1757198, -0.4565465, 1.11776, 1, 1, 1, 1, 1,
0.1783341, -0.2036452, 1.772723, 1, 1, 1, 1, 1,
0.1784603, 0.4200423, -1.159033, 1, 1, 1, 1, 1,
0.1796016, 1.068498, 2.180276, 1, 1, 1, 1, 1,
0.1813806, -0.1101258, 0.1984478, 1, 1, 1, 1, 1,
0.1817947, 0.5518467, -1.071315, 1, 1, 1, 1, 1,
0.1899618, -1.440472, 5.569884, 0, 0, 1, 1, 1,
0.1900456, -0.6003864, 1.957126, 1, 0, 0, 1, 1,
0.1911516, 0.7985497, 1.308404, 1, 0, 0, 1, 1,
0.1918331, 1.40853, 3.566866, 1, 0, 0, 1, 1,
0.1948861, -0.3589509, 3.824359, 1, 0, 0, 1, 1,
0.1956766, -1.695971, 4.186158, 1, 0, 0, 1, 1,
0.198173, -0.09786645, 2.522, 0, 0, 0, 1, 1,
0.1990242, -0.2417388, 2.087371, 0, 0, 0, 1, 1,
0.200261, 1.408511, -2.695108, 0, 0, 0, 1, 1,
0.200356, 0.245368, 2.25019, 0, 0, 0, 1, 1,
0.203262, 0.398462, 0.09912823, 0, 0, 0, 1, 1,
0.2047045, -0.824724, 2.714287, 0, 0, 0, 1, 1,
0.2057286, 0.6565424, -1.866627, 0, 0, 0, 1, 1,
0.2073575, 0.8515717, -0.5966769, 1, 1, 1, 1, 1,
0.2116141, 0.8967243, 0.9209843, 1, 1, 1, 1, 1,
0.2127877, -1.182952, 3.613326, 1, 1, 1, 1, 1,
0.2174398, -1.099043, 2.922128, 1, 1, 1, 1, 1,
0.2190621, -0.3041771, 2.184121, 1, 1, 1, 1, 1,
0.2220836, -0.2110128, 2.394447, 1, 1, 1, 1, 1,
0.222729, -0.5763755, 3.077752, 1, 1, 1, 1, 1,
0.2253096, -2.13288, 3.99508, 1, 1, 1, 1, 1,
0.2304696, -1.364748, 4.207084, 1, 1, 1, 1, 1,
0.2309967, -0.9973121, 2.59141, 1, 1, 1, 1, 1,
0.2350896, 0.613606, 1.251324, 1, 1, 1, 1, 1,
0.2379591, 1.928171, 0.975427, 1, 1, 1, 1, 1,
0.2383551, 0.06448365, 2.008615, 1, 1, 1, 1, 1,
0.2389605, 0.07987073, 0.3536848, 1, 1, 1, 1, 1,
0.2399209, -0.1824536, 2.540591, 1, 1, 1, 1, 1,
0.2403279, -2.31113, 3.88674, 0, 0, 1, 1, 1,
0.2425208, -0.4922314, 2.831871, 1, 0, 0, 1, 1,
0.250998, -0.9046837, 3.737032, 1, 0, 0, 1, 1,
0.2525418, 0.568969, 0.3293907, 1, 0, 0, 1, 1,
0.256054, 0.08182835, 2.19147, 1, 0, 0, 1, 1,
0.2580394, 0.3494354, 2.694522, 1, 0, 0, 1, 1,
0.26191, -0.1942398, 2.162782, 0, 0, 0, 1, 1,
0.2659625, -0.2733259, 3.276899, 0, 0, 0, 1, 1,
0.272487, -0.4286935, 3.050745, 0, 0, 0, 1, 1,
0.2756364, 0.3569466, 0.8122643, 0, 0, 0, 1, 1,
0.2772403, 0.2954757, 1.817309, 0, 0, 0, 1, 1,
0.2780212, -0.6753159, 2.262629, 0, 0, 0, 1, 1,
0.2782743, -0.6406086, 2.393685, 0, 0, 0, 1, 1,
0.2792038, -0.8017462, 3.537721, 1, 1, 1, 1, 1,
0.2811995, -0.4071103, 1.791446, 1, 1, 1, 1, 1,
0.2819358, 0.7286204, 0.2999813, 1, 1, 1, 1, 1,
0.2856204, -0.8287364, 4.376504, 1, 1, 1, 1, 1,
0.286199, -0.2910317, 2.812655, 1, 1, 1, 1, 1,
0.2877983, 0.1421294, -0.2138288, 1, 1, 1, 1, 1,
0.2949947, 1.834216, 0.7231047, 1, 1, 1, 1, 1,
0.3001866, -0.4883999, 1.574496, 1, 1, 1, 1, 1,
0.3005086, 1.14722, -2.27698, 1, 1, 1, 1, 1,
0.3041228, 0.01208866, 1.644511, 1, 1, 1, 1, 1,
0.3083272, -0.3424965, 2.919224, 1, 1, 1, 1, 1,
0.310791, -1.5371, 1.394563, 1, 1, 1, 1, 1,
0.3110734, 0.6415179, 1.232833, 1, 1, 1, 1, 1,
0.3121039, -2.35292, 3.371118, 1, 1, 1, 1, 1,
0.3123179, -0.5449634, 0.9978839, 1, 1, 1, 1, 1,
0.312666, -1.208883, 2.888125, 0, 0, 1, 1, 1,
0.328144, 2.028194, 1.166323, 1, 0, 0, 1, 1,
0.3290197, 0.05955182, 0.8967182, 1, 0, 0, 1, 1,
0.3346332, 1.284179, 0.2114754, 1, 0, 0, 1, 1,
0.3369987, -0.5369762, 2.100574, 1, 0, 0, 1, 1,
0.3457381, -1.487412, 2.689248, 1, 0, 0, 1, 1,
0.35169, 0.5272484, -0.805895, 0, 0, 0, 1, 1,
0.3519499, -1.878343, 4.772508, 0, 0, 0, 1, 1,
0.3522077, -1.671624, 2.429955, 0, 0, 0, 1, 1,
0.3527031, 0.6317649, 1.418611, 0, 0, 0, 1, 1,
0.3530255, -0.7837234, 2.997366, 0, 0, 0, 1, 1,
0.3557096, -1.098199, 2.220644, 0, 0, 0, 1, 1,
0.3582502, 0.08830611, 2.007683, 0, 0, 0, 1, 1,
0.3602585, 0.7552962, 0.5532146, 1, 1, 1, 1, 1,
0.3652825, 0.4508446, 1.979193, 1, 1, 1, 1, 1,
0.3683555, -0.6758386, 1.752229, 1, 1, 1, 1, 1,
0.3706407, -0.3529195, 1.086898, 1, 1, 1, 1, 1,
0.3785695, 1.873866, -0.7990831, 1, 1, 1, 1, 1,
0.3790292, 0.4610588, 1.81071, 1, 1, 1, 1, 1,
0.3800817, -0.4734093, 2.516732, 1, 1, 1, 1, 1,
0.3856438, 0.2444826, 1.42893, 1, 1, 1, 1, 1,
0.3860613, -0.561799, 2.884626, 1, 1, 1, 1, 1,
0.3876309, -0.6027485, 3.412276, 1, 1, 1, 1, 1,
0.3926929, 0.3581521, -0.4295786, 1, 1, 1, 1, 1,
0.3987736, -0.6520028, 2.758114, 1, 1, 1, 1, 1,
0.4003522, -0.2508896, 1.354621, 1, 1, 1, 1, 1,
0.4106589, 0.1230031, 2.104706, 1, 1, 1, 1, 1,
0.4108338, -0.6944798, 0.4244437, 1, 1, 1, 1, 1,
0.417255, 0.5719659, 1.682593, 0, 0, 1, 1, 1,
0.4194234, -0.8205291, 1.088961, 1, 0, 0, 1, 1,
0.42026, 0.3917583, 0.701862, 1, 0, 0, 1, 1,
0.4292224, -1.00804, 1.516223, 1, 0, 0, 1, 1,
0.4322854, -0.9238194, 2.793068, 1, 0, 0, 1, 1,
0.4334598, -0.685449, 0.168641, 1, 0, 0, 1, 1,
0.4361224, -0.4417834, 1.960461, 0, 0, 0, 1, 1,
0.4399923, -0.3501956, 3.829642, 0, 0, 0, 1, 1,
0.4403071, -1.323332, 1.727814, 0, 0, 0, 1, 1,
0.4403906, 0.1817029, 0.6714203, 0, 0, 0, 1, 1,
0.4421616, 0.6036771, 1.59293, 0, 0, 0, 1, 1,
0.4421946, -0.1115962, 2.793002, 0, 0, 0, 1, 1,
0.4479685, 0.7542744, 0.3034116, 0, 0, 0, 1, 1,
0.4486331, -0.5293887, 2.817225, 1, 1, 1, 1, 1,
0.449704, -0.8419049, 3.287421, 1, 1, 1, 1, 1,
0.4511729, -0.1695163, 2.072059, 1, 1, 1, 1, 1,
0.4515437, 0.01111267, 1.109342, 1, 1, 1, 1, 1,
0.4517082, 0.5324042, 1.144002, 1, 1, 1, 1, 1,
0.4522701, -0.328942, 2.225158, 1, 1, 1, 1, 1,
0.4543088, -0.1693685, 2.42222, 1, 1, 1, 1, 1,
0.4651865, -0.6584762, 1.916867, 1, 1, 1, 1, 1,
0.4712958, -0.7521779, 2.79679, 1, 1, 1, 1, 1,
0.4770977, 0.7573341, 0.5792443, 1, 1, 1, 1, 1,
0.4802523, -1.41269, 2.329581, 1, 1, 1, 1, 1,
0.4821736, -0.8190719, 1.047087, 1, 1, 1, 1, 1,
0.4826262, -1.259939, 2.664583, 1, 1, 1, 1, 1,
0.4835292, 0.3151044, 0.2529944, 1, 1, 1, 1, 1,
0.4858226, 1.693524, -1.26773, 1, 1, 1, 1, 1,
0.4867534, 0.5622368, 1.258029, 0, 0, 1, 1, 1,
0.4893521, -0.8470759, -0.06726397, 1, 0, 0, 1, 1,
0.4920532, 0.07398505, 1.218269, 1, 0, 0, 1, 1,
0.4929158, 1.137224, 0.6301616, 1, 0, 0, 1, 1,
0.4939906, 0.3697146, 0.4485632, 1, 0, 0, 1, 1,
0.4945371, -0.2251817, 0.4577402, 1, 0, 0, 1, 1,
0.496867, 0.589643, 1.875779, 0, 0, 0, 1, 1,
0.4978974, -0.7492071, 2.584781, 0, 0, 0, 1, 1,
0.5006761, 0.5216677, 0.5885699, 0, 0, 0, 1, 1,
0.5013111, -1.14351, 2.984369, 0, 0, 0, 1, 1,
0.5071176, -0.5830839, 1.88801, 0, 0, 0, 1, 1,
0.5079422, 0.0429276, 1.742458, 0, 0, 0, 1, 1,
0.5081378, -1.440144, 5.716551, 0, 0, 0, 1, 1,
0.5088494, -0.07733104, -0.06049861, 1, 1, 1, 1, 1,
0.5113405, -0.8210508, 2.64916, 1, 1, 1, 1, 1,
0.5137412, 0.8472851, -0.6560985, 1, 1, 1, 1, 1,
0.5145453, -0.9568686, 2.554379, 1, 1, 1, 1, 1,
0.5193316, -0.8678922, 0.05167319, 1, 1, 1, 1, 1,
0.5196503, 2.56328, 1.183026, 1, 1, 1, 1, 1,
0.5196988, 0.4946101, 0.5715163, 1, 1, 1, 1, 1,
0.5257437, -1.385069, 2.430999, 1, 1, 1, 1, 1,
0.5276712, 0.3498117, 1.86416, 1, 1, 1, 1, 1,
0.5306224, 0.1815601, 0.5012758, 1, 1, 1, 1, 1,
0.5312571, -0.4923033, 1.944674, 1, 1, 1, 1, 1,
0.5330567, -0.2378482, 2.122223, 1, 1, 1, 1, 1,
0.5331232, -0.7774097, 1.908807, 1, 1, 1, 1, 1,
0.5335523, -1.106025, 2.083594, 1, 1, 1, 1, 1,
0.539997, 0.4884929, 1.106548, 1, 1, 1, 1, 1,
0.5407395, 0.2328074, -0.5131402, 0, 0, 1, 1, 1,
0.5412728, -0.4026963, 1.099445, 1, 0, 0, 1, 1,
0.5418472, 0.8933678, 0.9113446, 1, 0, 0, 1, 1,
0.5425899, -0.5655426, 1.644288, 1, 0, 0, 1, 1,
0.5577216, -0.5093276, 2.698878, 1, 0, 0, 1, 1,
0.5589235, 0.2574353, 1.999162, 1, 0, 0, 1, 1,
0.5595023, 0.5976918, -0.498509, 0, 0, 0, 1, 1,
0.562284, 1.012144, 0.6103141, 0, 0, 0, 1, 1,
0.5735295, 0.9667308, 0.4005412, 0, 0, 0, 1, 1,
0.5784479, -1.823366, 3.013395, 0, 0, 0, 1, 1,
0.5789592, -0.4411324, 2.186842, 0, 0, 0, 1, 1,
0.5801755, -2.234165, 3.215199, 0, 0, 0, 1, 1,
0.5910935, -1.189904, 2.338644, 0, 0, 0, 1, 1,
0.5921255, 0.799922, 0.933246, 1, 1, 1, 1, 1,
0.5934969, 0.2235293, 1.047258, 1, 1, 1, 1, 1,
0.5966617, -1.078771, 2.639043, 1, 1, 1, 1, 1,
0.5999979, 0.8515082, 1.396002, 1, 1, 1, 1, 1,
0.6027263, -0.07476399, 2.719628, 1, 1, 1, 1, 1,
0.6049331, 1.197446, 0.6225019, 1, 1, 1, 1, 1,
0.6064134, -0.7998077, 2.364353, 1, 1, 1, 1, 1,
0.6133194, 1.297829, -0.7004492, 1, 1, 1, 1, 1,
0.6150233, -0.8743055, 0.9833587, 1, 1, 1, 1, 1,
0.6159662, 1.297872, 0.4579568, 1, 1, 1, 1, 1,
0.6205856, 0.3739015, 0.1539676, 1, 1, 1, 1, 1,
0.6218873, -0.2368201, 2.169719, 1, 1, 1, 1, 1,
0.6229312, -1.330486, 2.457323, 1, 1, 1, 1, 1,
0.6231344, 0.1539096, 1.466268, 1, 1, 1, 1, 1,
0.6231747, -0.7857779, 1.150557, 1, 1, 1, 1, 1,
0.6232103, -0.47402, 2.98623, 0, 0, 1, 1, 1,
0.6250194, -0.1650094, -0.9611508, 1, 0, 0, 1, 1,
0.6254815, 1.274302, -1.401277, 1, 0, 0, 1, 1,
0.6259407, 0.08140289, 0.3466429, 1, 0, 0, 1, 1,
0.6282885, -0.01822854, 0.7177372, 1, 0, 0, 1, 1,
0.6291893, -2.110143, 3.6249, 1, 0, 0, 1, 1,
0.6465504, 0.6760463, 0.3527207, 0, 0, 0, 1, 1,
0.6582056, -0.3697124, 3.06817, 0, 0, 0, 1, 1,
0.6593769, 1.211864, 2.090963, 0, 0, 0, 1, 1,
0.6623387, 0.9891889, -0.5357651, 0, 0, 0, 1, 1,
0.6673, 1.660847, -1.200304, 0, 0, 0, 1, 1,
0.6717578, -2.260504, 4.015254, 0, 0, 0, 1, 1,
0.6724418, -0.01262106, 1.528733, 0, 0, 0, 1, 1,
0.6848452, -1.651457, 3.123282, 1, 1, 1, 1, 1,
0.686331, -0.6461744, 3.175992, 1, 1, 1, 1, 1,
0.6885981, -0.2056542, 3.485143, 1, 1, 1, 1, 1,
0.6959336, -0.3242531, 1.348833, 1, 1, 1, 1, 1,
0.6964369, 0.8699479, 0.5051087, 1, 1, 1, 1, 1,
0.6980818, 0.6247008, 1.744714, 1, 1, 1, 1, 1,
0.6981031, 0.1676529, 0.9445682, 1, 1, 1, 1, 1,
0.6995509, -0.133033, 1.997379, 1, 1, 1, 1, 1,
0.7023503, -0.0459297, 2.878513, 1, 1, 1, 1, 1,
0.7023677, -0.4209668, 2.08864, 1, 1, 1, 1, 1,
0.7070767, 2.094468, -0.6210882, 1, 1, 1, 1, 1,
0.7075885, -0.8488678, 1.319202, 1, 1, 1, 1, 1,
0.709917, 1.537453, 0.06727543, 1, 1, 1, 1, 1,
0.712244, 0.09414607, 2.177616, 1, 1, 1, 1, 1,
0.7273045, -0.2488674, 2.989118, 1, 1, 1, 1, 1,
0.7286687, 0.1184059, 1.375366, 0, 0, 1, 1, 1,
0.7324721, -1.775681, 2.607732, 1, 0, 0, 1, 1,
0.7373052, -0.4991083, 2.471282, 1, 0, 0, 1, 1,
0.7387555, -0.5084049, 1.701185, 1, 0, 0, 1, 1,
0.7596221, -0.6003454, 2.646014, 1, 0, 0, 1, 1,
0.7656254, 0.5896178, -0.0436604, 1, 0, 0, 1, 1,
0.7658449, 1.636845, -0.2182539, 0, 0, 0, 1, 1,
0.7667533, 0.6803065, 1.264708, 0, 0, 0, 1, 1,
0.7685625, 0.1022185, 1.070838, 0, 0, 0, 1, 1,
0.7703356, -1.342262, 3.161205, 0, 0, 0, 1, 1,
0.7716125, -0.01445398, 1.82239, 0, 0, 0, 1, 1,
0.7762021, 2.957855, 0.113373, 0, 0, 0, 1, 1,
0.7815114, -1.232937, 3.56912, 0, 0, 0, 1, 1,
0.7826059, -2.576412, 1.730847, 1, 1, 1, 1, 1,
0.786422, 0.5751686, 1.427829, 1, 1, 1, 1, 1,
0.7883473, 0.6652704, 1.39076, 1, 1, 1, 1, 1,
0.7885067, 1.65456, -1.170254, 1, 1, 1, 1, 1,
0.792708, -1.964709, 2.800339, 1, 1, 1, 1, 1,
0.798425, -1.415519, 1.920203, 1, 1, 1, 1, 1,
0.8002264, 1.549351, 0.2710679, 1, 1, 1, 1, 1,
0.8006282, -0.1642669, 1.665142, 1, 1, 1, 1, 1,
0.8030953, 0.3081514, 0.3561401, 1, 1, 1, 1, 1,
0.8087752, 0.1009682, 1.490183, 1, 1, 1, 1, 1,
0.815412, -1.999079, 2.817484, 1, 1, 1, 1, 1,
0.8217705, -1.522536, 1.595544, 1, 1, 1, 1, 1,
0.822005, -1.236124, 1.801561, 1, 1, 1, 1, 1,
0.8231651, -0.5138487, 2.810402, 1, 1, 1, 1, 1,
0.8241758, -0.189325, 1.054555, 1, 1, 1, 1, 1,
0.8242713, 0.5494444, 1.069773, 0, 0, 1, 1, 1,
0.8270875, 1.165655, -0.1558631, 1, 0, 0, 1, 1,
0.8346614, 1.9432, -0.3274169, 1, 0, 0, 1, 1,
0.8361391, -1.152912, 2.552613, 1, 0, 0, 1, 1,
0.8367512, -1.991963, 2.974752, 1, 0, 0, 1, 1,
0.8382289, -0.09268533, 1.354065, 1, 0, 0, 1, 1,
0.8386661, -0.899223, 3.093606, 0, 0, 0, 1, 1,
0.8388506, 0.9223828, -0.735846, 0, 0, 0, 1, 1,
0.8395435, 0.2183747, 2.858193, 0, 0, 0, 1, 1,
0.848285, 0.3048754, 0.6568379, 0, 0, 0, 1, 1,
0.8488603, -2.254523, 4.404216, 0, 0, 0, 1, 1,
0.8496625, -0.8303252, 3.888321, 0, 0, 0, 1, 1,
0.8503283, 0.9598115, 0.4198904, 0, 0, 0, 1, 1,
0.8520673, -0.7459713, 2.948821, 1, 1, 1, 1, 1,
0.8536015, 0.0192288, 0.2253512, 1, 1, 1, 1, 1,
0.8545971, 1.672419, 0.4735715, 1, 1, 1, 1, 1,
0.855087, -0.09383975, -0.1020504, 1, 1, 1, 1, 1,
0.8586915, 0.8356366, 1.408234, 1, 1, 1, 1, 1,
0.8783476, -0.2277788, 1.66294, 1, 1, 1, 1, 1,
0.8853516, -0.1084935, 0.4158142, 1, 1, 1, 1, 1,
0.8902078, 0.4300824, 2.674843, 1, 1, 1, 1, 1,
0.8908783, -0.00709019, 0.1689133, 1, 1, 1, 1, 1,
0.8928473, -1.620676, 1.001354, 1, 1, 1, 1, 1,
0.8984339, -0.4284379, 1.938207, 1, 1, 1, 1, 1,
0.9029312, -0.1893748, 2.02414, 1, 1, 1, 1, 1,
0.907734, -0.8797148, 2.36521, 1, 1, 1, 1, 1,
0.9084085, 0.003675518, 1.996425, 1, 1, 1, 1, 1,
0.9202367, 0.4435972, 0.9811596, 1, 1, 1, 1, 1,
0.9228102, -0.4448293, -0.0645754, 0, 0, 1, 1, 1,
0.9287685, 0.227841, 2.483141, 1, 0, 0, 1, 1,
0.9343141, -1.154172, 3.348139, 1, 0, 0, 1, 1,
0.9378348, -1.373574, 3.565466, 1, 0, 0, 1, 1,
0.9508815, -1.492565, 1.798227, 1, 0, 0, 1, 1,
0.9526077, 0.820316, 1.456256, 1, 0, 0, 1, 1,
0.9529138, 0.8684626, 0.777187, 0, 0, 0, 1, 1,
0.9534109, -0.9430839, 2.654461, 0, 0, 0, 1, 1,
0.9549847, -2.44202, 2.766145, 0, 0, 0, 1, 1,
0.955458, 0.6780406, 0.9156602, 0, 0, 0, 1, 1,
0.9603175, -0.630105, 3.51569, 0, 0, 0, 1, 1,
0.9603846, 1.522189, 1.936957, 0, 0, 0, 1, 1,
0.9628491, 0.1865516, -0.4080328, 0, 0, 0, 1, 1,
0.9633841, 2.420665, -0.05711561, 1, 1, 1, 1, 1,
0.9646646, 0.1424388, 1.395214, 1, 1, 1, 1, 1,
0.9663358, -0.3979249, 2.669922, 1, 1, 1, 1, 1,
0.9696252, 1.634078, 0.9663249, 1, 1, 1, 1, 1,
0.9745131, 0.1153404, 2.483278, 1, 1, 1, 1, 1,
0.9866, -0.1946054, 1.527639, 1, 1, 1, 1, 1,
0.9875777, -0.678897, 2.610643, 1, 1, 1, 1, 1,
0.9893929, 0.05265943, 0.9655165, 1, 1, 1, 1, 1,
0.9935297, 0.3060353, 1.788549, 1, 1, 1, 1, 1,
0.9949626, 0.1761631, 0.2130139, 1, 1, 1, 1, 1,
1.005339, -0.5276211, 2.555791, 1, 1, 1, 1, 1,
1.008182, 0.7140456, 1.500286, 1, 1, 1, 1, 1,
1.011462, -1.018382, 2.870936, 1, 1, 1, 1, 1,
1.011541, -0.04359813, -0.1072689, 1, 1, 1, 1, 1,
1.013616, -0.9875044, -0.3063041, 1, 1, 1, 1, 1,
1.013791, -0.04763311, 2.104033, 0, 0, 1, 1, 1,
1.014723, 0.5913514, 1.85346, 1, 0, 0, 1, 1,
1.015467, -1.846626, 2.960385, 1, 0, 0, 1, 1,
1.019859, -1.235795, 3.658837, 1, 0, 0, 1, 1,
1.020231, 0.3970242, 1.850795, 1, 0, 0, 1, 1,
1.020938, -1.620561, 1.685177, 1, 0, 0, 1, 1,
1.023867, 1.431063, 1.306635, 0, 0, 0, 1, 1,
1.028309, -1.086223, 1.967534, 0, 0, 0, 1, 1,
1.028344, 1.164419, 0.7423941, 0, 0, 0, 1, 1,
1.029834, -1.396117, 3.535334, 0, 0, 0, 1, 1,
1.03064, 1.155321, 0.3130792, 0, 0, 0, 1, 1,
1.034352, -0.7103442, 1.240905, 0, 0, 0, 1, 1,
1.042019, 0.981727, 0.4496905, 0, 0, 0, 1, 1,
1.044104, -0.4767092, 1.665239, 1, 1, 1, 1, 1,
1.050353, 1.516217, 0.5906427, 1, 1, 1, 1, 1,
1.053326, 0.3256411, 0.4682318, 1, 1, 1, 1, 1,
1.05717, -0.7817068, 2.682661, 1, 1, 1, 1, 1,
1.064128, 0.6408815, 0.9748986, 1, 1, 1, 1, 1,
1.068089, -1.636665, 2.43622, 1, 1, 1, 1, 1,
1.068252, -1.219098, 1.517993, 1, 1, 1, 1, 1,
1.071555, 2.321268, 0.2774771, 1, 1, 1, 1, 1,
1.072959, 0.2359883, 3.563826, 1, 1, 1, 1, 1,
1.07691, -0.4011707, 2.596919, 1, 1, 1, 1, 1,
1.078417, -0.1193586, 1.816045, 1, 1, 1, 1, 1,
1.078597, -1.021429, 2.930002, 1, 1, 1, 1, 1,
1.091993, 2.421435, -1.702934, 1, 1, 1, 1, 1,
1.098297, 0.1001483, 2.391403, 1, 1, 1, 1, 1,
1.109685, -1.594651, 3.800909, 1, 1, 1, 1, 1,
1.112057, 0.5477283, 2.238828, 0, 0, 1, 1, 1,
1.114748, -1.76618, 1.019863, 1, 0, 0, 1, 1,
1.123251, 0.4363884, 0.1169537, 1, 0, 0, 1, 1,
1.124953, -0.9038587, 1.866324, 1, 0, 0, 1, 1,
1.126808, 0.07168675, -1.101403, 1, 0, 0, 1, 1,
1.138804, 2.897502, 0.451858, 1, 0, 0, 1, 1,
1.139838, 0.2975515, 1.36848, 0, 0, 0, 1, 1,
1.146032, -0.1284369, 0.7284685, 0, 0, 0, 1, 1,
1.148913, -2.106454, 3.73495, 0, 0, 0, 1, 1,
1.149069, 1.756994, 3.014856, 0, 0, 0, 1, 1,
1.155779, 1.594739, -0.2668102, 0, 0, 0, 1, 1,
1.17016, 0.03774629, -1.591014, 0, 0, 0, 1, 1,
1.180955, -1.924754, 4.3923, 0, 0, 0, 1, 1,
1.182297, 2.454361, -0.1510309, 1, 1, 1, 1, 1,
1.182614, 0.6287369, 2.255434, 1, 1, 1, 1, 1,
1.182755, -1.217365, 3.619412, 1, 1, 1, 1, 1,
1.183214, -0.4195281, 2.421194, 1, 1, 1, 1, 1,
1.184595, 0.2587292, 3.020265, 1, 1, 1, 1, 1,
1.185172, -0.7427326, 1.869911, 1, 1, 1, 1, 1,
1.191816, 0.7176535, 0.7101845, 1, 1, 1, 1, 1,
1.194973, -1.996391, 1.678517, 1, 1, 1, 1, 1,
1.20156, -1.746249, 3.307008, 1, 1, 1, 1, 1,
1.218002, 0.9593656, 0.7161342, 1, 1, 1, 1, 1,
1.223479, -0.5755435, 2.134572, 1, 1, 1, 1, 1,
1.224274, 1.546008, 1.416456, 1, 1, 1, 1, 1,
1.233339, 0.2840445, -0.4554328, 1, 1, 1, 1, 1,
1.235713, 1.322824, 0.4838309, 1, 1, 1, 1, 1,
1.259859, -0.9238704, 2.882062, 1, 1, 1, 1, 1,
1.262843, 0.4768956, 0.43876, 0, 0, 1, 1, 1,
1.263222, -0.3367971, 2.282685, 1, 0, 0, 1, 1,
1.269635, 0.1838535, 1.762553, 1, 0, 0, 1, 1,
1.270923, 0.3092492, 0.6748763, 1, 0, 0, 1, 1,
1.30365, 0.04420879, 1.435162, 1, 0, 0, 1, 1,
1.304237, -0.1542939, 1.061751, 1, 0, 0, 1, 1,
1.317966, 0.05673974, 1.125866, 0, 0, 0, 1, 1,
1.318581, 0.4821725, 1.549112, 0, 0, 0, 1, 1,
1.323104, 0.1129903, 0.2894172, 0, 0, 0, 1, 1,
1.324662, -2.369045, 4.496724, 0, 0, 0, 1, 1,
1.326055, 0.1303743, 1.141896, 0, 0, 0, 1, 1,
1.32709, 0.4294529, 1.34489, 0, 0, 0, 1, 1,
1.328271, -1.019585, 1.124519, 0, 0, 0, 1, 1,
1.332285, -0.01723657, 1.559697, 1, 1, 1, 1, 1,
1.338147, 0.07462835, 1.016303, 1, 1, 1, 1, 1,
1.344607, 0.5477327, 2.646987, 1, 1, 1, 1, 1,
1.347136, 0.3116148, 1.268597, 1, 1, 1, 1, 1,
1.356592, 0.3663899, 0.9826422, 1, 1, 1, 1, 1,
1.372084, -0.964633, 3.479583, 1, 1, 1, 1, 1,
1.374059, 0.8183433, 2.455563, 1, 1, 1, 1, 1,
1.379905, 0.5928503, 1.540828, 1, 1, 1, 1, 1,
1.384575, -0.5059812, 2.137698, 1, 1, 1, 1, 1,
1.385034, 0.7688733, 1.70065, 1, 1, 1, 1, 1,
1.39099, 1.30915, 2.163095, 1, 1, 1, 1, 1,
1.394768, -0.9363475, 3.828517, 1, 1, 1, 1, 1,
1.410827, -0.6093906, 1.757436, 1, 1, 1, 1, 1,
1.425487, -1.226025, 1.433507, 1, 1, 1, 1, 1,
1.427675, -0.1543353, 2.281355, 1, 1, 1, 1, 1,
1.45321, 0.4522411, 0.6810164, 0, 0, 1, 1, 1,
1.462996, -0.1418299, 1.153566, 1, 0, 0, 1, 1,
1.474727, -0.8975695, 3.643336, 1, 0, 0, 1, 1,
1.503622, -0.6415837, 3.115963, 1, 0, 0, 1, 1,
1.516044, -0.6748921, 1.735133, 1, 0, 0, 1, 1,
1.536526, 0.07368549, 1.306806, 1, 0, 0, 1, 1,
1.536937, 1.683642, 0.7080432, 0, 0, 0, 1, 1,
1.540859, 0.3006845, 0.4973825, 0, 0, 0, 1, 1,
1.545289, 0.4588928, -0.7550602, 0, 0, 0, 1, 1,
1.548446, -0.8967658, 1.291335, 0, 0, 0, 1, 1,
1.555556, 0.04120386, 2.634525, 0, 0, 0, 1, 1,
1.56843, 0.9684827, -0.7477655, 0, 0, 0, 1, 1,
1.569654, -2.311029, 1.043092, 0, 0, 0, 1, 1,
1.573141, 0.2493982, 3.696462, 1, 1, 1, 1, 1,
1.579227, -2.001508, 2.590298, 1, 1, 1, 1, 1,
1.584193, 0.4955609, 0.4266304, 1, 1, 1, 1, 1,
1.587712, 0.7695926, 0.2816629, 1, 1, 1, 1, 1,
1.588037, -0.9541669, 2.088941, 1, 1, 1, 1, 1,
1.616839, -0.2936205, 2.146133, 1, 1, 1, 1, 1,
1.619019, 0.2985847, 0.3663144, 1, 1, 1, 1, 1,
1.62127, -2.456756, 3.358489, 1, 1, 1, 1, 1,
1.626473, 1.406665, 0.4621957, 1, 1, 1, 1, 1,
1.628743, 0.3605969, 1.80036, 1, 1, 1, 1, 1,
1.641571, -1.045713, 2.944505, 1, 1, 1, 1, 1,
1.648038, 1.022738, 2.551004, 1, 1, 1, 1, 1,
1.652708, -1.021045, 0.09682533, 1, 1, 1, 1, 1,
1.674433, 0.5882936, 1.609479, 1, 1, 1, 1, 1,
1.691051, 0.05015149, 2.851817, 1, 1, 1, 1, 1,
1.697825, 1.742081, 1.817453, 0, 0, 1, 1, 1,
1.698017, -1.840145, 0.9524957, 1, 0, 0, 1, 1,
1.700912, -2.46851, 1.563032, 1, 0, 0, 1, 1,
1.719153, 1.549145, 2.028763, 1, 0, 0, 1, 1,
1.72254, 1.917354, 0.4036795, 1, 0, 0, 1, 1,
1.746992, 0.0342894, 0.5454322, 1, 0, 0, 1, 1,
1.761208, 1.448651, 2.393329, 0, 0, 0, 1, 1,
1.764558, -0.1693012, 1.396611, 0, 0, 0, 1, 1,
1.769851, -1.585898, 3.089854, 0, 0, 0, 1, 1,
1.773566, 0.7643612, 1.020155, 0, 0, 0, 1, 1,
1.788939, 0.5694951, 2.152146, 0, 0, 0, 1, 1,
1.793721, 0.02909339, 1.656369, 0, 0, 0, 1, 1,
1.799421, -0.3408418, 2.172609, 0, 0, 0, 1, 1,
1.809745, 0.009198081, 2.585973, 1, 1, 1, 1, 1,
1.832579, 0.2762856, 1.529918, 1, 1, 1, 1, 1,
1.839858, 0.4608468, 2.431839, 1, 1, 1, 1, 1,
1.857372, -2.386416, 3.044294, 1, 1, 1, 1, 1,
1.883987, 2.630407, 0.6592538, 1, 1, 1, 1, 1,
1.8872, 1.911143, 1.162727, 1, 1, 1, 1, 1,
1.888488, 1.008735, -1.033516, 1, 1, 1, 1, 1,
1.890292, 1.034886, -0.03965639, 1, 1, 1, 1, 1,
1.898911, 0.4575299, 2.126035, 1, 1, 1, 1, 1,
1.902584, 0.5677711, 1.280339, 1, 1, 1, 1, 1,
1.916431, 0.1430199, 1.415687, 1, 1, 1, 1, 1,
1.925058, 0.6287259, 0.5266665, 1, 1, 1, 1, 1,
1.981802, -0.2282601, 2.728126, 1, 1, 1, 1, 1,
1.981825, -0.615258, 2.057321, 1, 1, 1, 1, 1,
1.990482, 0.5249856, 0.8714722, 1, 1, 1, 1, 1,
1.996708, -0.5939686, 1.959303, 0, 0, 1, 1, 1,
1.996977, 0.2118229, 0.4095688, 1, 0, 0, 1, 1,
2.001375, 0.03685398, 1.824207, 1, 0, 0, 1, 1,
2.02958, -0.08628535, 0.9837784, 1, 0, 0, 1, 1,
2.063447, -0.346097, 0.9466101, 1, 0, 0, 1, 1,
2.114497, -0.5139813, 2.784888, 1, 0, 0, 1, 1,
2.128552, 0.7518606, 0.4122711, 0, 0, 0, 1, 1,
2.129372, -0.05305833, 3.122613, 0, 0, 0, 1, 1,
2.183078, -0.4594369, -0.2252462, 0, 0, 0, 1, 1,
2.230776, 1.042684, 1.961077, 0, 0, 0, 1, 1,
2.263789, 0.006794153, 1.918741, 0, 0, 0, 1, 1,
2.283509, 0.6843151, 1.698322, 0, 0, 0, 1, 1,
2.320019, -0.6599686, 0.9453841, 0, 0, 0, 1, 1,
2.321543, -0.4028709, 1.214043, 1, 1, 1, 1, 1,
2.368644, 0.1445629, 0.6417627, 1, 1, 1, 1, 1,
2.435751, -0.08132359, 1.858275, 1, 1, 1, 1, 1,
2.436765, -0.4889838, 1.060789, 1, 1, 1, 1, 1,
2.771762, -0.1461754, 1.469482, 1, 1, 1, 1, 1,
2.907432, -0.59663, 1.210681, 1, 1, 1, 1, 1,
3.353213, -1.051082, 4.983808, 1, 1, 1, 1, 1
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
var radius = 9.687803;
var distance = 34.028;
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
mvMatrix.translate( -0.0872941, -0.1157525, -0.4229968 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.028);
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