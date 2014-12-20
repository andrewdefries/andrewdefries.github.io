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
-2.952009, 1.120568, -1.149111, 1, 0, 0, 1,
-2.866503, -0.08442454, -0.2814145, 1, 0.007843138, 0, 1,
-2.80999, -0.994803, -2.553904, 1, 0.01176471, 0, 1,
-2.690436, -0.3195547, -3.247769, 1, 0.01960784, 0, 1,
-2.627626, -0.6535862, -2.080762, 1, 0.02352941, 0, 1,
-2.612123, 0.5731445, -2.804342, 1, 0.03137255, 0, 1,
-2.599051, 1.308704, -1.23047, 1, 0.03529412, 0, 1,
-2.565269, 0.861785, -0.7755623, 1, 0.04313726, 0, 1,
-2.539676, -1.112418, -0.9283463, 1, 0.04705882, 0, 1,
-2.472239, 1.514206, -0.01558795, 1, 0.05490196, 0, 1,
-2.445593, -1.003905, -0.7658298, 1, 0.05882353, 0, 1,
-2.32411, 0.603639, -1.536133, 1, 0.06666667, 0, 1,
-2.281389, 0.1549927, 0.6761575, 1, 0.07058824, 0, 1,
-2.261772, -0.5117448, -1.396296, 1, 0.07843138, 0, 1,
-2.224595, 0.8231792, -2.170143, 1, 0.08235294, 0, 1,
-2.177511, 0.7566576, -3.02625, 1, 0.09019608, 0, 1,
-2.134077, 0.509295, -1.383625, 1, 0.09411765, 0, 1,
-2.133005, 0.5669113, -1.385542, 1, 0.1019608, 0, 1,
-2.05956, 1.848919, -1.245348, 1, 0.1098039, 0, 1,
-2.049634, -1.318183, -1.188787, 1, 0.1137255, 0, 1,
-2.031051, -0.15819, -1.273085, 1, 0.1215686, 0, 1,
-1.998764, -0.5414767, -2.072935, 1, 0.1254902, 0, 1,
-1.984721, -1.83706, -1.605902, 1, 0.1333333, 0, 1,
-1.982192, -0.03917418, -0.7721613, 1, 0.1372549, 0, 1,
-1.969184, 0.5109412, -3.558943, 1, 0.145098, 0, 1,
-1.901752, 2.228324, -2.389744, 1, 0.1490196, 0, 1,
-1.897553, -0.9266171, -3.282312, 1, 0.1568628, 0, 1,
-1.881022, 0.1087608, -0.5869879, 1, 0.1607843, 0, 1,
-1.858617, -1.683918, 0.4034766, 1, 0.1686275, 0, 1,
-1.841702, 0.2647745, -1.613599, 1, 0.172549, 0, 1,
-1.815736, -1.308122, -1.500124, 1, 0.1803922, 0, 1,
-1.81022, -1.252708, -2.467374, 1, 0.1843137, 0, 1,
-1.789836, 1.032315, -0.6465809, 1, 0.1921569, 0, 1,
-1.772671, 0.2816195, -0.8022632, 1, 0.1960784, 0, 1,
-1.769359, 0.4947501, -0.492023, 1, 0.2039216, 0, 1,
-1.746793, 0.8229591, -1.453511, 1, 0.2117647, 0, 1,
-1.723479, 1.552937, -0.9042481, 1, 0.2156863, 0, 1,
-1.720876, -0.03534522, -1.464206, 1, 0.2235294, 0, 1,
-1.718915, -0.6210394, -1.80883, 1, 0.227451, 0, 1,
-1.693807, 0.931815, -2.476146, 1, 0.2352941, 0, 1,
-1.688104, -0.610621, 0.1739596, 1, 0.2392157, 0, 1,
-1.639268, 0.0002178069, -0.8363819, 1, 0.2470588, 0, 1,
-1.630242, 0.1512066, -1.952082, 1, 0.2509804, 0, 1,
-1.628419, 0.3407119, -1.36837, 1, 0.2588235, 0, 1,
-1.599766, -0.164758, -2.774063, 1, 0.2627451, 0, 1,
-1.593297, 2.08553, -0.1502543, 1, 0.2705882, 0, 1,
-1.586695, 1.645159, -1.285268, 1, 0.2745098, 0, 1,
-1.581676, 0.7553365, -1.451421, 1, 0.282353, 0, 1,
-1.58162, 0.62191, -2.746491, 1, 0.2862745, 0, 1,
-1.573364, 0.4621979, -1.111412, 1, 0.2941177, 0, 1,
-1.564301, -1.827948, -3.016883, 1, 0.3019608, 0, 1,
-1.554806, 0.6228361, -1.713172, 1, 0.3058824, 0, 1,
-1.550798, -3.001306, -2.260581, 1, 0.3137255, 0, 1,
-1.520163, 0.1313347, -1.785787, 1, 0.3176471, 0, 1,
-1.50404, 0.1003333, -3.37256, 1, 0.3254902, 0, 1,
-1.495098, -0.9979529, -1.113835, 1, 0.3294118, 0, 1,
-1.494546, 0.3692794, -0.4276524, 1, 0.3372549, 0, 1,
-1.474024, -0.8348687, -1.957264, 1, 0.3411765, 0, 1,
-1.452714, -0.5727568, -2.865104, 1, 0.3490196, 0, 1,
-1.445811, 0.01472867, -3.471265, 1, 0.3529412, 0, 1,
-1.43869, -0.8832177, -2.617521, 1, 0.3607843, 0, 1,
-1.435924, 0.06043478, -0.8155745, 1, 0.3647059, 0, 1,
-1.431859, -0.4603463, -2.329673, 1, 0.372549, 0, 1,
-1.430056, 1.162191, -0.06409471, 1, 0.3764706, 0, 1,
-1.413811, -0.7558013, -2.404722, 1, 0.3843137, 0, 1,
-1.405802, -0.8779964, -2.747642, 1, 0.3882353, 0, 1,
-1.402985, 0.644452, -0.31186, 1, 0.3960784, 0, 1,
-1.401798, -1.46958, -3.546714, 1, 0.4039216, 0, 1,
-1.400939, -1.426242, -2.670344, 1, 0.4078431, 0, 1,
-1.400104, -0.04583986, 0.03157797, 1, 0.4156863, 0, 1,
-1.396751, 1.037778, 0.6051369, 1, 0.4196078, 0, 1,
-1.390403, -0.7756057, -1.810139, 1, 0.427451, 0, 1,
-1.389694, -0.01761379, -1.854899, 1, 0.4313726, 0, 1,
-1.359911, -0.8296822, -4.26654, 1, 0.4392157, 0, 1,
-1.357957, 0.9574777, -1.322347, 1, 0.4431373, 0, 1,
-1.339212, -1.113612, -1.945759, 1, 0.4509804, 0, 1,
-1.336109, -0.5411619, -2.3075, 1, 0.454902, 0, 1,
-1.335891, -1.156796, -1.544801, 1, 0.4627451, 0, 1,
-1.333686, 0.1769577, -1.003919, 1, 0.4666667, 0, 1,
-1.33176, 0.9679179, -0.4372782, 1, 0.4745098, 0, 1,
-1.318714, 0.9397358, -1.412825, 1, 0.4784314, 0, 1,
-1.317888, -0.3195715, -0.3410978, 1, 0.4862745, 0, 1,
-1.315123, 0.06833261, -1.951135, 1, 0.4901961, 0, 1,
-1.312288, 0.6242363, -2.651921, 1, 0.4980392, 0, 1,
-1.305351, -0.2284951, -0.2431314, 1, 0.5058824, 0, 1,
-1.294147, -0.4248918, -2.681583, 1, 0.509804, 0, 1,
-1.292585, -1.500304, -0.970412, 1, 0.5176471, 0, 1,
-1.28181, -0.7409987, -1.414307, 1, 0.5215687, 0, 1,
-1.280587, -0.3099594, -3.969484, 1, 0.5294118, 0, 1,
-1.268681, -0.4812692, -2.280367, 1, 0.5333334, 0, 1,
-1.265503, 0.5978224, -2.630245, 1, 0.5411765, 0, 1,
-1.265038, 1.064573, -0.9059249, 1, 0.5450981, 0, 1,
-1.264656, -0.4324363, -1.955105, 1, 0.5529412, 0, 1,
-1.258339, 0.5361987, -1.837876, 1, 0.5568628, 0, 1,
-1.252357, -1.399933, -1.942892, 1, 0.5647059, 0, 1,
-1.245048, -1.191289, -3.180679, 1, 0.5686275, 0, 1,
-1.229453, 0.1002916, 0.7910355, 1, 0.5764706, 0, 1,
-1.22809, 0.3004537, -0.9828607, 1, 0.5803922, 0, 1,
-1.227895, -0.8287541, -1.551453, 1, 0.5882353, 0, 1,
-1.22668, -0.9575853, -2.758461, 1, 0.5921569, 0, 1,
-1.225825, 0.6211186, -0.4307353, 1, 0.6, 0, 1,
-1.225589, -0.1866381, -2.062607, 1, 0.6078432, 0, 1,
-1.220799, -0.7016581, -0.9994052, 1, 0.6117647, 0, 1,
-1.214807, -1.465217, -4.001641, 1, 0.6196079, 0, 1,
-1.187738, 0.804766, -1.35299, 1, 0.6235294, 0, 1,
-1.184623, 0.8855059, -0.1415801, 1, 0.6313726, 0, 1,
-1.181774, 0.2198972, -2.289632, 1, 0.6352941, 0, 1,
-1.177943, -0.7953457, -0.6037965, 1, 0.6431373, 0, 1,
-1.17731, -0.2466486, -0.2637414, 1, 0.6470588, 0, 1,
-1.174742, 0.5097929, -1.46957, 1, 0.654902, 0, 1,
-1.167752, 0.6683801, -1.082252, 1, 0.6588235, 0, 1,
-1.166381, -1.449479, -1.611856, 1, 0.6666667, 0, 1,
-1.162524, -0.1633933, -0.8135056, 1, 0.6705883, 0, 1,
-1.161917, -1.079998, -1.363345, 1, 0.6784314, 0, 1,
-1.160333, 0.9603645, 0.5445745, 1, 0.682353, 0, 1,
-1.152841, -2.027564, -0.972712, 1, 0.6901961, 0, 1,
-1.149717, -0.7889664, -2.880845, 1, 0.6941177, 0, 1,
-1.141023, -1.454607, -4.085294, 1, 0.7019608, 0, 1,
-1.135908, 0.1977973, -1.260126, 1, 0.7098039, 0, 1,
-1.132147, -0.005045844, -0.442693, 1, 0.7137255, 0, 1,
-1.130165, 0.2627132, -0.8889691, 1, 0.7215686, 0, 1,
-1.129354, -1.002234, -0.9404773, 1, 0.7254902, 0, 1,
-1.127, -3.436865, -3.912361, 1, 0.7333333, 0, 1,
-1.124021, 0.8732918, -1.234467, 1, 0.7372549, 0, 1,
-1.122922, 0.3078753, -1.870273, 1, 0.7450981, 0, 1,
-1.116804, 1.406168, -1.905838, 1, 0.7490196, 0, 1,
-1.102442, -0.388073, -2.061961, 1, 0.7568628, 0, 1,
-1.101281, -1.65407, -2.578669, 1, 0.7607843, 0, 1,
-1.101078, 0.6547101, -0.4649117, 1, 0.7686275, 0, 1,
-1.090552, 0.4010277, -2.045221, 1, 0.772549, 0, 1,
-1.089742, -0.6025668, -1.337427, 1, 0.7803922, 0, 1,
-1.088821, 1.945208, -0.2505289, 1, 0.7843137, 0, 1,
-1.084863, 0.1467069, -1.516957, 1, 0.7921569, 0, 1,
-1.082854, 3.645208, -0.05237032, 1, 0.7960784, 0, 1,
-1.061107, 0.6892533, 0.7981003, 1, 0.8039216, 0, 1,
-1.050391, 0.8527672, 0.8383493, 1, 0.8117647, 0, 1,
-1.044471, -0.4466062, -2.246428, 1, 0.8156863, 0, 1,
-1.023364, -1.298815, -0.904161, 1, 0.8235294, 0, 1,
-1.019514, 1.161288, -1.613751, 1, 0.827451, 0, 1,
-1.017739, -0.5303203, -3.667464, 1, 0.8352941, 0, 1,
-1.01476, 0.7343906, -0.842828, 1, 0.8392157, 0, 1,
-1.010968, -0.5494739, -2.88924, 1, 0.8470588, 0, 1,
-1.009625, 0.3387117, -2.034735, 1, 0.8509804, 0, 1,
-1.004017, -0.4546717, -2.981739, 1, 0.8588235, 0, 1,
-0.9974536, -0.5444158, -2.289816, 1, 0.8627451, 0, 1,
-0.9864302, 0.501756, -0.4666984, 1, 0.8705882, 0, 1,
-0.9847772, -0.9995223, -2.084507, 1, 0.8745098, 0, 1,
-0.9826825, -0.5146394, -4.589647, 1, 0.8823529, 0, 1,
-0.982448, -1.013056, -0.5164411, 1, 0.8862745, 0, 1,
-0.9817497, 0.6455413, -2.273967, 1, 0.8941177, 0, 1,
-0.980666, -0.4041604, -2.914926, 1, 0.8980392, 0, 1,
-0.9804117, -0.06007399, -2.680913, 1, 0.9058824, 0, 1,
-0.9798371, -0.1122384, -1.630687, 1, 0.9137255, 0, 1,
-0.9797712, 1.606065, -0.7645279, 1, 0.9176471, 0, 1,
-0.9777743, 0.2148987, -0.6486715, 1, 0.9254902, 0, 1,
-0.9687172, 1.18875, -1.082732, 1, 0.9294118, 0, 1,
-0.9672356, -1.014812, -1.82856, 1, 0.9372549, 0, 1,
-0.9652826, 1.281002, -0.9414461, 1, 0.9411765, 0, 1,
-0.9594855, -0.2778865, -1.774388, 1, 0.9490196, 0, 1,
-0.9571307, -0.8133956, -1.642498, 1, 0.9529412, 0, 1,
-0.9450358, 0.9436929, 0.2038603, 1, 0.9607843, 0, 1,
-0.9371113, 0.8350249, -0.2662131, 1, 0.9647059, 0, 1,
-0.936831, -0.3859328, -0.6349007, 1, 0.972549, 0, 1,
-0.9341674, -1.09061, -3.404119, 1, 0.9764706, 0, 1,
-0.9246383, -0.04468488, -0.3846401, 1, 0.9843137, 0, 1,
-0.9159028, 1.290189, -2.308912, 1, 0.9882353, 0, 1,
-0.9158593, -0.6596056, -1.680399, 1, 0.9960784, 0, 1,
-0.9089631, -2.098194, -2.826634, 0.9960784, 1, 0, 1,
-0.9086397, -0.7825913, -3.814356, 0.9921569, 1, 0, 1,
-0.8934995, -0.03711891, -2.261967, 0.9843137, 1, 0, 1,
-0.8924041, 0.3423658, -2.227865, 0.9803922, 1, 0, 1,
-0.8906313, 1.590644, -1.357881, 0.972549, 1, 0, 1,
-0.8832245, -1.102334, -1.429655, 0.9686275, 1, 0, 1,
-0.8800686, -0.8654958, -4.168757, 0.9607843, 1, 0, 1,
-0.8708478, 0.8808152, -1.870642, 0.9568627, 1, 0, 1,
-0.8699992, -0.2072034, -1.678482, 0.9490196, 1, 0, 1,
-0.8630767, -0.2015686, 0.1320579, 0.945098, 1, 0, 1,
-0.854708, -1.992036, -3.783211, 0.9372549, 1, 0, 1,
-0.8503045, 0.1482597, -1.082085, 0.9333333, 1, 0, 1,
-0.8499432, 0.2908158, -0.277988, 0.9254902, 1, 0, 1,
-0.8480048, -0.347066, -1.731071, 0.9215686, 1, 0, 1,
-0.8477199, 2.004095, -0.4918964, 0.9137255, 1, 0, 1,
-0.8425821, 0.4170882, -1.187256, 0.9098039, 1, 0, 1,
-0.8418967, -0.5415512, -2.004701, 0.9019608, 1, 0, 1,
-0.8410075, -0.1900954, -0.9732983, 0.8941177, 1, 0, 1,
-0.8362179, -2.540492, -2.985845, 0.8901961, 1, 0, 1,
-0.8323409, 0.4716825, -0.7013963, 0.8823529, 1, 0, 1,
-0.8282606, 0.7839321, -0.6814366, 0.8784314, 1, 0, 1,
-0.8281913, 1.201247, 0.1151085, 0.8705882, 1, 0, 1,
-0.8228364, 1.06537, -0.5632002, 0.8666667, 1, 0, 1,
-0.8219369, 0.1527629, -2.127773, 0.8588235, 1, 0, 1,
-0.8203695, -0.3131476, -2.998991, 0.854902, 1, 0, 1,
-0.8159656, 0.5052056, -0.3240473, 0.8470588, 1, 0, 1,
-0.811561, 0.1000022, 0.5902706, 0.8431373, 1, 0, 1,
-0.8031504, 0.4900491, -0.9972331, 0.8352941, 1, 0, 1,
-0.8008119, -0.0264318, 0.0493027, 0.8313726, 1, 0, 1,
-0.7911921, 1.922688, -1.670365, 0.8235294, 1, 0, 1,
-0.7897434, 0.4416035, -2.639953, 0.8196079, 1, 0, 1,
-0.7850168, 0.8124413, -0.643767, 0.8117647, 1, 0, 1,
-0.7838271, -0.1454171, -2.292939, 0.8078431, 1, 0, 1,
-0.7838002, 0.3363384, -1.153001, 0.8, 1, 0, 1,
-0.7829788, -1.970076, -3.520247, 0.7921569, 1, 0, 1,
-0.7784848, 0.6436923, -0.6265551, 0.7882353, 1, 0, 1,
-0.7774881, -0.1581307, -0.4335831, 0.7803922, 1, 0, 1,
-0.7769641, 0.04180682, -1.555253, 0.7764706, 1, 0, 1,
-0.7767643, 1.409697, -1.785991, 0.7686275, 1, 0, 1,
-0.775241, 0.6791626, 2.226121, 0.7647059, 1, 0, 1,
-0.7725538, 2.002715, -0.4474574, 0.7568628, 1, 0, 1,
-0.7683397, -0.05532203, -2.428422, 0.7529412, 1, 0, 1,
-0.7667257, 0.01422888, -0.7374907, 0.7450981, 1, 0, 1,
-0.7630507, -0.14854, -0.4796012, 0.7411765, 1, 0, 1,
-0.7604048, -0.276162, -1.306548, 0.7333333, 1, 0, 1,
-0.7579917, 0.9238608, -1.191877, 0.7294118, 1, 0, 1,
-0.7503318, 0.4888608, 0.5904266, 0.7215686, 1, 0, 1,
-0.7480172, 1.048245, -2.786879, 0.7176471, 1, 0, 1,
-0.7477502, -0.1626941, -1.005177, 0.7098039, 1, 0, 1,
-0.7450223, 0.522495, -1.366396, 0.7058824, 1, 0, 1,
-0.7427529, -1.64834, -2.685022, 0.6980392, 1, 0, 1,
-0.7374144, 0.9117334, -0.8555803, 0.6901961, 1, 0, 1,
-0.7335266, 0.4656313, -1.414825, 0.6862745, 1, 0, 1,
-0.7312607, 2.626606, -0.8473218, 0.6784314, 1, 0, 1,
-0.7284648, -0.1841639, -1.746939, 0.6745098, 1, 0, 1,
-0.7271812, -0.3664674, -2.087101, 0.6666667, 1, 0, 1,
-0.7207523, -0.2081341, -1.048367, 0.6627451, 1, 0, 1,
-0.7198185, -0.9483498, -2.204687, 0.654902, 1, 0, 1,
-0.7152851, 0.5318307, -0.4131761, 0.6509804, 1, 0, 1,
-0.7148796, 1.649876, -1.211183, 0.6431373, 1, 0, 1,
-0.710748, -1.072778, -3.995547, 0.6392157, 1, 0, 1,
-0.7046881, 2.071829, -0.1979221, 0.6313726, 1, 0, 1,
-0.7039651, -0.5500693, -2.135383, 0.627451, 1, 0, 1,
-0.7026995, 0.493124, -0.03158353, 0.6196079, 1, 0, 1,
-0.7016051, 0.5404198, -1.348383, 0.6156863, 1, 0, 1,
-0.700105, 0.3167102, -2.131192, 0.6078432, 1, 0, 1,
-0.699266, -0.2988828, -2.349427, 0.6039216, 1, 0, 1,
-0.6970387, -0.726992, -1.626749, 0.5960785, 1, 0, 1,
-0.6872968, 0.375419, -0.00404387, 0.5882353, 1, 0, 1,
-0.6867154, -0.4086587, -1.133489, 0.5843138, 1, 0, 1,
-0.6763874, 0.7622598, 0.2547152, 0.5764706, 1, 0, 1,
-0.6763597, -0.3894561, -4.117512, 0.572549, 1, 0, 1,
-0.6708549, 1.964167, -1.493817, 0.5647059, 1, 0, 1,
-0.6613258, -0.4414195, -1.818684, 0.5607843, 1, 0, 1,
-0.6606941, 0.2201087, -1.14923, 0.5529412, 1, 0, 1,
-0.660233, -0.2973537, -2.456313, 0.5490196, 1, 0, 1,
-0.6577978, 1.185423, -0.9676334, 0.5411765, 1, 0, 1,
-0.6484226, -0.3294096, -1.100133, 0.5372549, 1, 0, 1,
-0.6459262, 0.9547973, -0.187401, 0.5294118, 1, 0, 1,
-0.6415354, -0.6749409, -1.764288, 0.5254902, 1, 0, 1,
-0.6401277, -0.1782819, -1.352443, 0.5176471, 1, 0, 1,
-0.6395983, -0.5215489, -2.418213, 0.5137255, 1, 0, 1,
-0.6381672, -0.9791736, -0.8990899, 0.5058824, 1, 0, 1,
-0.6334046, -0.7135124, -3.41125, 0.5019608, 1, 0, 1,
-0.6327415, -0.0199627, -1.795831, 0.4941176, 1, 0, 1,
-0.6256441, -0.1678534, -0.6630158, 0.4862745, 1, 0, 1,
-0.6209316, -0.3446121, -2.85123, 0.4823529, 1, 0, 1,
-0.618485, 0.1838158, -2.506256, 0.4745098, 1, 0, 1,
-0.6154435, 1.69028, -0.01666333, 0.4705882, 1, 0, 1,
-0.6139142, 0.8891052, -0.672788, 0.4627451, 1, 0, 1,
-0.6127666, 0.6547811, -2.052197, 0.4588235, 1, 0, 1,
-0.6111799, 0.08111792, -1.156749, 0.4509804, 1, 0, 1,
-0.6108066, -0.03055528, -2.548195, 0.4470588, 1, 0, 1,
-0.6091278, 0.3448424, -0.2818694, 0.4392157, 1, 0, 1,
-0.6013224, 0.9640189, 1.450145, 0.4352941, 1, 0, 1,
-0.6009554, 1.648845, 0.7452049, 0.427451, 1, 0, 1,
-0.600575, -0.7104521, -3.309832, 0.4235294, 1, 0, 1,
-0.5976959, 1.423801, -0.8492759, 0.4156863, 1, 0, 1,
-0.5929173, -2.367985, -3.254093, 0.4117647, 1, 0, 1,
-0.5894241, -1.570181, -3.663643, 0.4039216, 1, 0, 1,
-0.5877085, -0.3056113, -1.198405, 0.3960784, 1, 0, 1,
-0.5866869, -1.260613, -1.593976, 0.3921569, 1, 0, 1,
-0.5852507, 1.208357, -0.8209043, 0.3843137, 1, 0, 1,
-0.5820732, 0.06078587, -2.726732, 0.3803922, 1, 0, 1,
-0.5804889, 0.6193403, -0.1618813, 0.372549, 1, 0, 1,
-0.5764481, -1.240603, -2.153373, 0.3686275, 1, 0, 1,
-0.5642454, 0.7056004, 0.4561585, 0.3607843, 1, 0, 1,
-0.558212, -1.388559, -2.383035, 0.3568628, 1, 0, 1,
-0.5574241, -0.4626643, -3.313655, 0.3490196, 1, 0, 1,
-0.5558568, -1.138645, -1.46485, 0.345098, 1, 0, 1,
-0.5557358, -0.8500518, -3.497836, 0.3372549, 1, 0, 1,
-0.5538912, 1.38225, 0.04871436, 0.3333333, 1, 0, 1,
-0.5506321, -0.2996163, -2.979649, 0.3254902, 1, 0, 1,
-0.5481412, -0.008945143, -2.036392, 0.3215686, 1, 0, 1,
-0.5475328, -0.7651213, -1.39931, 0.3137255, 1, 0, 1,
-0.545876, 0.8505951, -3.090413, 0.3098039, 1, 0, 1,
-0.5457851, -2.665036, -2.481664, 0.3019608, 1, 0, 1,
-0.5454203, -0.1490474, -2.29328, 0.2941177, 1, 0, 1,
-0.5408444, 0.1764319, -1.097996, 0.2901961, 1, 0, 1,
-0.5350635, -0.9096074, -5.921882, 0.282353, 1, 0, 1,
-0.5343506, 0.2820943, -1.155082, 0.2784314, 1, 0, 1,
-0.5332893, 0.05272304, -2.85835, 0.2705882, 1, 0, 1,
-0.527065, -0.6100071, -3.607637, 0.2666667, 1, 0, 1,
-0.5248422, 1.439648, -0.1996217, 0.2588235, 1, 0, 1,
-0.5209209, -0.4684367, -2.596432, 0.254902, 1, 0, 1,
-0.5203124, 0.3863167, 0.07569978, 0.2470588, 1, 0, 1,
-0.5155613, 0.5503691, -0.1265883, 0.2431373, 1, 0, 1,
-0.5132962, 0.7280275, 0.1015706, 0.2352941, 1, 0, 1,
-0.5131058, 1.622836, 1.418905, 0.2313726, 1, 0, 1,
-0.5127508, 0.6955468, -0.9824257, 0.2235294, 1, 0, 1,
-0.5114574, -0.6433132, -1.366988, 0.2196078, 1, 0, 1,
-0.5092099, -0.3375932, -2.890773, 0.2117647, 1, 0, 1,
-0.508055, -0.1276771, -2.330366, 0.2078431, 1, 0, 1,
-0.507824, 0.1904836, -1.014452, 0.2, 1, 0, 1,
-0.4973031, -0.915482, -2.547617, 0.1921569, 1, 0, 1,
-0.4963694, -1.149214, -2.713607, 0.1882353, 1, 0, 1,
-0.4955589, -0.3520092, -1.428162, 0.1803922, 1, 0, 1,
-0.4840625, 1.483909, -0.4421771, 0.1764706, 1, 0, 1,
-0.4769575, -0.6356249, -3.635086, 0.1686275, 1, 0, 1,
-0.4764845, 1.346173, 0.2008976, 0.1647059, 1, 0, 1,
-0.4753873, 0.7599527, -0.3252113, 0.1568628, 1, 0, 1,
-0.4724954, 0.5779709, -0.9423872, 0.1529412, 1, 0, 1,
-0.4625116, -0.5358057, -2.314627, 0.145098, 1, 0, 1,
-0.4621083, 0.9116735, 1.138914, 0.1411765, 1, 0, 1,
-0.461261, -0.8925592, -2.712786, 0.1333333, 1, 0, 1,
-0.4563377, 0.5417702, 0.00999059, 0.1294118, 1, 0, 1,
-0.4507677, -0.1220034, -1.840677, 0.1215686, 1, 0, 1,
-0.4455739, 1.120015, -0.5249679, 0.1176471, 1, 0, 1,
-0.4377208, 0.9990205, -1.92957, 0.1098039, 1, 0, 1,
-0.4350294, 0.01107931, -1.567757, 0.1058824, 1, 0, 1,
-0.4333546, 0.4297758, -2.131244, 0.09803922, 1, 0, 1,
-0.4294477, 1.019823, -1.170191, 0.09019608, 1, 0, 1,
-0.4292844, -1.924422, -2.897397, 0.08627451, 1, 0, 1,
-0.4285823, -0.5281677, -1.751939, 0.07843138, 1, 0, 1,
-0.4277068, -0.3442314, -3.019492, 0.07450981, 1, 0, 1,
-0.4219178, 0.6759608, -0.6116408, 0.06666667, 1, 0, 1,
-0.4210655, -0.04956171, -1.964823, 0.0627451, 1, 0, 1,
-0.4208806, 1.494375, -0.3314121, 0.05490196, 1, 0, 1,
-0.4194108, 0.08824878, -1.622924, 0.05098039, 1, 0, 1,
-0.4163806, 0.4168133, -2.331508, 0.04313726, 1, 0, 1,
-0.4137447, 0.2366296, -1.919216, 0.03921569, 1, 0, 1,
-0.4135663, -0.2067618, -2.766305, 0.03137255, 1, 0, 1,
-0.4107463, 0.7877524, 0.105047, 0.02745098, 1, 0, 1,
-0.409794, 1.212315, -0.6928889, 0.01960784, 1, 0, 1,
-0.4067346, -0.5781857, -0.9866384, 0.01568628, 1, 0, 1,
-0.403899, 2.727584, -0.5376807, 0.007843138, 1, 0, 1,
-0.3987312, 2.510021, -0.1772981, 0.003921569, 1, 0, 1,
-0.3974561, -0.2038774, -2.675722, 0, 1, 0.003921569, 1,
-0.3956551, 0.1058703, 0.1280899, 0, 1, 0.01176471, 1,
-0.3922175, 0.0783002, -1.260219, 0, 1, 0.01568628, 1,
-0.3889782, 1.215645, -1.084371, 0, 1, 0.02352941, 1,
-0.3840938, 0.9693916, -0.9235182, 0, 1, 0.02745098, 1,
-0.3823254, -0.6480041, -3.836523, 0, 1, 0.03529412, 1,
-0.3773226, 1.003542, -0.1460409, 0, 1, 0.03921569, 1,
-0.3771965, -0.1031346, -0.942752, 0, 1, 0.04705882, 1,
-0.3758605, 1.761117, -0.3384686, 0, 1, 0.05098039, 1,
-0.3755748, -0.5673348, -2.080347, 0, 1, 0.05882353, 1,
-0.3740736, -0.4166552, -1.727213, 0, 1, 0.0627451, 1,
-0.3727255, 0.1714534, -2.726219, 0, 1, 0.07058824, 1,
-0.3720216, -1.060908, -2.959589, 0, 1, 0.07450981, 1,
-0.367078, 1.483651, 1.104652, 0, 1, 0.08235294, 1,
-0.3638265, 1.586899, -0.04048886, 0, 1, 0.08627451, 1,
-0.3637599, 0.3980935, -2.593402, 0, 1, 0.09411765, 1,
-0.3598054, 0.1378095, -1.832214, 0, 1, 0.1019608, 1,
-0.3582157, -0.1202296, -1.939319, 0, 1, 0.1058824, 1,
-0.3563311, -0.4666419, -3.93785, 0, 1, 0.1137255, 1,
-0.3544962, -0.6558946, -1.837343, 0, 1, 0.1176471, 1,
-0.3528619, -0.9706649, -1.960784, 0, 1, 0.1254902, 1,
-0.3514093, -1.185121, -2.344434, 0, 1, 0.1294118, 1,
-0.3505224, 1.700644, -1.902914, 0, 1, 0.1372549, 1,
-0.3423548, -0.05682889, -4.44915, 0, 1, 0.1411765, 1,
-0.3413942, -1.311434, -3.050521, 0, 1, 0.1490196, 1,
-0.3406801, -0.0566377, -1.471628, 0, 1, 0.1529412, 1,
-0.3335262, -1.25366, -3.303007, 0, 1, 0.1607843, 1,
-0.3316248, 0.4429675, 0.4788009, 0, 1, 0.1647059, 1,
-0.3297985, 1.667907, 1.256652, 0, 1, 0.172549, 1,
-0.3280348, -0.6151932, -1.664496, 0, 1, 0.1764706, 1,
-0.3195873, 1.031592, -0.3569134, 0, 1, 0.1843137, 1,
-0.3163125, -0.7650014, -2.852662, 0, 1, 0.1882353, 1,
-0.3091957, 1.04404, -0.2010213, 0, 1, 0.1960784, 1,
-0.3076263, -0.2228191, -1.012516, 0, 1, 0.2039216, 1,
-0.3054269, -0.1373424, -3.431263, 0, 1, 0.2078431, 1,
-0.3034127, 1.117835, -0.9869282, 0, 1, 0.2156863, 1,
-0.3023479, 0.4419724, 0.2188086, 0, 1, 0.2196078, 1,
-0.3004782, 0.9238873, -1.632258, 0, 1, 0.227451, 1,
-0.2965407, 1.100165, -1.303399, 0, 1, 0.2313726, 1,
-0.2936929, -0.3560239, -0.3284788, 0, 1, 0.2392157, 1,
-0.2933549, -0.2699415, -2.907289, 0, 1, 0.2431373, 1,
-0.2910238, -0.4054874, -2.643507, 0, 1, 0.2509804, 1,
-0.2854344, -0.7600996, -1.802692, 0, 1, 0.254902, 1,
-0.2819288, -1.541329, -4.520679, 0, 1, 0.2627451, 1,
-0.2811615, -0.5543174, -1.890972, 0, 1, 0.2666667, 1,
-0.2796873, 0.1966285, 0.2970384, 0, 1, 0.2745098, 1,
-0.277196, -0.349294, -3.070575, 0, 1, 0.2784314, 1,
-0.2768323, 1.425949, -0.305882, 0, 1, 0.2862745, 1,
-0.276558, 0.3987421, -0.09136362, 0, 1, 0.2901961, 1,
-0.2716082, 1.207869, -0.5406931, 0, 1, 0.2980392, 1,
-0.2712988, -0.8671798, -2.916757, 0, 1, 0.3058824, 1,
-0.2645684, 0.7258415, 0.8377476, 0, 1, 0.3098039, 1,
-0.2629701, -0.6278774, -4.752909, 0, 1, 0.3176471, 1,
-0.2587207, 1.737717, 0.6177759, 0, 1, 0.3215686, 1,
-0.2569113, -0.2651369, -1.939374, 0, 1, 0.3294118, 1,
-0.2549587, 0.1878035, -1.434937, 0, 1, 0.3333333, 1,
-0.2535321, 1.037925, -2.576476, 0, 1, 0.3411765, 1,
-0.25254, -0.1014368, -1.170519, 0, 1, 0.345098, 1,
-0.2516975, -0.4594462, -3.476231, 0, 1, 0.3529412, 1,
-0.2436357, -0.5938073, -1.572331, 0, 1, 0.3568628, 1,
-0.2386322, 2.207654, 0.4373455, 0, 1, 0.3647059, 1,
-0.2384828, 0.2257999, 0.321918, 0, 1, 0.3686275, 1,
-0.237834, -0.7168407, -1.512953, 0, 1, 0.3764706, 1,
-0.2309812, 0.6245322, -0.5178209, 0, 1, 0.3803922, 1,
-0.2289477, -1.807483, -4.099659, 0, 1, 0.3882353, 1,
-0.2287754, 0.8873229, -1.672957, 0, 1, 0.3921569, 1,
-0.2233339, 0.7822758, -0.5419689, 0, 1, 0.4, 1,
-0.2168452, -1.824987, -4.055471, 0, 1, 0.4078431, 1,
-0.2142584, -1.057745, -4.464221, 0, 1, 0.4117647, 1,
-0.2134383, 0.6869, -0.4536647, 0, 1, 0.4196078, 1,
-0.2131342, 1.007359, 0.2772872, 0, 1, 0.4235294, 1,
-0.1992562, 0.3782028, -0.6914293, 0, 1, 0.4313726, 1,
-0.1973531, -1.902066, -2.438971, 0, 1, 0.4352941, 1,
-0.195784, 2.582878, -0.3455621, 0, 1, 0.4431373, 1,
-0.1943429, 2.905577, 0.6649499, 0, 1, 0.4470588, 1,
-0.1940127, 1.168038, 0.08838122, 0, 1, 0.454902, 1,
-0.1938914, 0.7926908, 0.8569379, 0, 1, 0.4588235, 1,
-0.193538, 0.3908983, -1.373645, 0, 1, 0.4666667, 1,
-0.1893907, 2.209289, 0.004198983, 0, 1, 0.4705882, 1,
-0.1812833, -0.1104636, -1.314918, 0, 1, 0.4784314, 1,
-0.173561, 0.5531348, 0.8216119, 0, 1, 0.4823529, 1,
-0.1708591, -1.059084, -3.890682, 0, 1, 0.4901961, 1,
-0.1680638, -0.8999625, -2.683789, 0, 1, 0.4941176, 1,
-0.1677236, -0.4941781, -2.399795, 0, 1, 0.5019608, 1,
-0.1657107, -2.589544, -4.348036, 0, 1, 0.509804, 1,
-0.1625501, -0.4018353, -3.906712, 0, 1, 0.5137255, 1,
-0.1595064, -1.585678, -0.3716776, 0, 1, 0.5215687, 1,
-0.1581869, -0.2664013, -2.273173, 0, 1, 0.5254902, 1,
-0.1581734, 0.4641982, 0.591127, 0, 1, 0.5333334, 1,
-0.1576696, -0.8951852, -4.575195, 0, 1, 0.5372549, 1,
-0.1543342, 0.9416588, 0.5172246, 0, 1, 0.5450981, 1,
-0.1539998, 1.164335, -0.4569999, 0, 1, 0.5490196, 1,
-0.1515749, -0.6278097, -2.414621, 0, 1, 0.5568628, 1,
-0.1495042, 0.3062595, -0.7320898, 0, 1, 0.5607843, 1,
-0.145746, 1.590317, 1.43398, 0, 1, 0.5686275, 1,
-0.1446589, 0.2824889, -0.3252282, 0, 1, 0.572549, 1,
-0.1425358, 0.737349, -1.240435, 0, 1, 0.5803922, 1,
-0.139255, -0.6851442, -3.357704, 0, 1, 0.5843138, 1,
-0.1391154, 0.6954227, -1.543966, 0, 1, 0.5921569, 1,
-0.1343141, -0.8301511, -2.992399, 0, 1, 0.5960785, 1,
-0.1341408, -0.1712475, -1.481339, 0, 1, 0.6039216, 1,
-0.1281462, 0.491833, 0.06345591, 0, 1, 0.6117647, 1,
-0.1272624, -0.9740694, -2.022512, 0, 1, 0.6156863, 1,
-0.1210514, 2.416418, -0.5027904, 0, 1, 0.6235294, 1,
-0.1179247, 1.906888, -0.09211623, 0, 1, 0.627451, 1,
-0.1138243, 0.3788227, 0.2184074, 0, 1, 0.6352941, 1,
-0.1116323, 0.3649921, -0.9802352, 0, 1, 0.6392157, 1,
-0.1089899, 0.4527251, 0.1972569, 0, 1, 0.6470588, 1,
-0.1045334, -1.623829, -3.728565, 0, 1, 0.6509804, 1,
-0.09960239, 0.954947, 0.1844724, 0, 1, 0.6588235, 1,
-0.09737816, 0.1397007, -0.7547312, 0, 1, 0.6627451, 1,
-0.09468059, -2.18996, -3.071954, 0, 1, 0.6705883, 1,
-0.09439728, 0.4555485, 0.2843863, 0, 1, 0.6745098, 1,
-0.08827487, -0.9567544, -3.623024, 0, 1, 0.682353, 1,
-0.08619162, -1.327454, -3.698791, 0, 1, 0.6862745, 1,
-0.08481805, 2.643248, 0.436911, 0, 1, 0.6941177, 1,
-0.08350889, 0.5698377, -0.3071679, 0, 1, 0.7019608, 1,
-0.08051862, -0.9208781, -4.042924, 0, 1, 0.7058824, 1,
-0.07925727, -1.613838, -2.552049, 0, 1, 0.7137255, 1,
-0.07781792, 1.104011, 0.3492028, 0, 1, 0.7176471, 1,
-0.07574546, 0.3407401, -0.02771897, 0, 1, 0.7254902, 1,
-0.07222982, 2.9189, -0.7263782, 0, 1, 0.7294118, 1,
-0.06612893, 1.389023, -1.021456, 0, 1, 0.7372549, 1,
-0.05834281, -0.005829687, -0.9032896, 0, 1, 0.7411765, 1,
-0.05646087, 1.106185, -0.1108255, 0, 1, 0.7490196, 1,
-0.05128298, 0.8211647, -0.2954749, 0, 1, 0.7529412, 1,
-0.049226, 0.2415552, 0.7931134, 0, 1, 0.7607843, 1,
-0.04655414, -1.204389, -1.737125, 0, 1, 0.7647059, 1,
-0.04453125, -0.5274013, -2.356612, 0, 1, 0.772549, 1,
-0.04295907, -1.12997, -4.398313, 0, 1, 0.7764706, 1,
-0.04275826, 1.59464, -0.2047295, 0, 1, 0.7843137, 1,
-0.04231732, -0.1063935, -3.783276, 0, 1, 0.7882353, 1,
-0.04229721, -1.127833, -2.62839, 0, 1, 0.7960784, 1,
-0.03835227, 0.5116993, 1.035856, 0, 1, 0.8039216, 1,
-0.03795736, -0.413512, -1.760797, 0, 1, 0.8078431, 1,
-0.03723339, -1.501913, -2.450939, 0, 1, 0.8156863, 1,
-0.03522647, -0.4070487, -2.868515, 0, 1, 0.8196079, 1,
-0.03426251, 0.7424251, -0.6005767, 0, 1, 0.827451, 1,
-0.03350373, -0.2091138, -3.78545, 0, 1, 0.8313726, 1,
-0.0321013, -1.275958, -1.808542, 0, 1, 0.8392157, 1,
-0.03105601, -0.914102, -3.45651, 0, 1, 0.8431373, 1,
-0.02925282, 0.7346407, -0.7658501, 0, 1, 0.8509804, 1,
-0.02549551, -0.979984, -1.717631, 0, 1, 0.854902, 1,
-0.02434589, -0.9774379, -2.889095, 0, 1, 0.8627451, 1,
-0.01961053, 0.04632926, 0.2092596, 0, 1, 0.8666667, 1,
-0.01777549, 0.06509069, 0.70279, 0, 1, 0.8745098, 1,
-0.01683438, 1.287795, 1.145794, 0, 1, 0.8784314, 1,
-0.01552758, 0.8697052, 1.166041, 0, 1, 0.8862745, 1,
-0.008899442, -0.7851747, -2.004617, 0, 1, 0.8901961, 1,
-0.00746851, -1.591081, -4.352438, 0, 1, 0.8980392, 1,
-0.006636968, -0.845003, -5.126149, 0, 1, 0.9058824, 1,
-0.005041088, 0.3667116, -0.219748, 0, 1, 0.9098039, 1,
-0.003889645, -0.4436754, -4.35182, 0, 1, 0.9176471, 1,
-0.0005827873, -1.873327, -3.311277, 0, 1, 0.9215686, 1,
0.001174522, 0.1516518, -1.288665, 0, 1, 0.9294118, 1,
0.001510282, 1.145096, 0.2352581, 0, 1, 0.9333333, 1,
0.002939636, -1.318949, 2.955176, 0, 1, 0.9411765, 1,
0.004406829, 0.2179603, 0.1150271, 0, 1, 0.945098, 1,
0.007995382, -0.3821374, 3.376498, 0, 1, 0.9529412, 1,
0.008009364, 1.152475, 1.246718, 0, 1, 0.9568627, 1,
0.008483016, 0.153776, 1.261545, 0, 1, 0.9647059, 1,
0.01466929, -0.414185, 3.759884, 0, 1, 0.9686275, 1,
0.01498422, -0.6890941, 1.007049, 0, 1, 0.9764706, 1,
0.02081376, -1.377126, 2.009347, 0, 1, 0.9803922, 1,
0.03938313, -0.01934797, 0.9559486, 0, 1, 0.9882353, 1,
0.04065951, 0.5556122, 1.248177, 0, 1, 0.9921569, 1,
0.04116332, -0.982331, 3.492498, 0, 1, 1, 1,
0.04645491, 0.3951534, 0.7957647, 0, 0.9921569, 1, 1,
0.04693578, -1.467478, 1.984286, 0, 0.9882353, 1, 1,
0.05050103, 0.4434938, 1.044394, 0, 0.9803922, 1, 1,
0.05334883, 0.9228547, -0.08687638, 0, 0.9764706, 1, 1,
0.06028905, 0.05165582, 1.045967, 0, 0.9686275, 1, 1,
0.06189856, -0.5320007, 2.985039, 0, 0.9647059, 1, 1,
0.06341587, -0.4889124, 2.196612, 0, 0.9568627, 1, 1,
0.06365349, 0.260565, -0.4824426, 0, 0.9529412, 1, 1,
0.06391606, 2.197709, -1.122471, 0, 0.945098, 1, 1,
0.06732082, -1.897671, 5.182526, 0, 0.9411765, 1, 1,
0.06901183, -1.156153, 3.576925, 0, 0.9333333, 1, 1,
0.06910023, -0.9710394, 2.203672, 0, 0.9294118, 1, 1,
0.07050989, 1.58408, -0.6163355, 0, 0.9215686, 1, 1,
0.07269146, -0.9562596, 3.704192, 0, 0.9176471, 1, 1,
0.07558209, -0.9156905, 2.41686, 0, 0.9098039, 1, 1,
0.08231653, -0.4895233, 3.541642, 0, 0.9058824, 1, 1,
0.08322358, 0.1133005, 0.1754229, 0, 0.8980392, 1, 1,
0.08654939, 2.149648, -0.0476667, 0, 0.8901961, 1, 1,
0.08950585, 0.8053747, 0.4167351, 0, 0.8862745, 1, 1,
0.09021995, -0.3389248, 2.93082, 0, 0.8784314, 1, 1,
0.0919933, -0.5104463, 4.908495, 0, 0.8745098, 1, 1,
0.09271501, -0.4370192, 3.468584, 0, 0.8666667, 1, 1,
0.09374752, 0.7636459, 1.469562, 0, 0.8627451, 1, 1,
0.09382606, -0.1738134, 2.715937, 0, 0.854902, 1, 1,
0.09404877, -0.1234418, 0.9309716, 0, 0.8509804, 1, 1,
0.09575567, -1.005435, 2.733944, 0, 0.8431373, 1, 1,
0.09708574, 0.3655888, 1.206687, 0, 0.8392157, 1, 1,
0.09999167, 1.389635, 0.497199, 0, 0.8313726, 1, 1,
0.1108856, 0.1000753, 1.098047, 0, 0.827451, 1, 1,
0.1113872, -0.5428215, 3.150841, 0, 0.8196079, 1, 1,
0.1226308, -0.08537394, 3.032501, 0, 0.8156863, 1, 1,
0.1228067, 1.116995, -0.006539715, 0, 0.8078431, 1, 1,
0.1236263, -1.161699, 3.462601, 0, 0.8039216, 1, 1,
0.1300786, -1.00019, 4.082413, 0, 0.7960784, 1, 1,
0.1315513, -0.7095172, 2.221947, 0, 0.7882353, 1, 1,
0.1321793, -1.239835, 2.764558, 0, 0.7843137, 1, 1,
0.1390892, 0.3876607, 1.242161, 0, 0.7764706, 1, 1,
0.1397324, 0.2077025, 0.6616586, 0, 0.772549, 1, 1,
0.1414415, -0.5628935, 1.811335, 0, 0.7647059, 1, 1,
0.1424446, -1.217869, 2.216579, 0, 0.7607843, 1, 1,
0.1427722, -0.8552685, 2.428567, 0, 0.7529412, 1, 1,
0.1500783, -2.837839, 4.579998, 0, 0.7490196, 1, 1,
0.1512478, 1.514429, -1.182736, 0, 0.7411765, 1, 1,
0.1521222, -1.579317, 3.882475, 0, 0.7372549, 1, 1,
0.1601925, -0.5930667, 0.6557199, 0, 0.7294118, 1, 1,
0.1606317, -0.8948679, 2.664768, 0, 0.7254902, 1, 1,
0.1625754, 0.3776325, 0.6045859, 0, 0.7176471, 1, 1,
0.1653564, 0.4180576, 0.1346337, 0, 0.7137255, 1, 1,
0.1656617, -0.1203779, 2.955477, 0, 0.7058824, 1, 1,
0.1689293, 1.186452, -1.808008, 0, 0.6980392, 1, 1,
0.1716222, -0.9275303, 3.881167, 0, 0.6941177, 1, 1,
0.172929, 0.1973841, 0.6888288, 0, 0.6862745, 1, 1,
0.1784378, 1.609285, 0.8733983, 0, 0.682353, 1, 1,
0.1809175, -0.9348035, 2.665043, 0, 0.6745098, 1, 1,
0.1816196, 0.8149051, 0.3970219, 0, 0.6705883, 1, 1,
0.1841519, -1.520082, 4.721069, 0, 0.6627451, 1, 1,
0.1851562, -0.8816961, 3.294207, 0, 0.6588235, 1, 1,
0.186121, 0.2938373, 1.438441, 0, 0.6509804, 1, 1,
0.1869669, 0.2194449, 0.9409716, 0, 0.6470588, 1, 1,
0.1897147, -0.1452254, 1.687555, 0, 0.6392157, 1, 1,
0.1925343, -0.3538817, 2.949029, 0, 0.6352941, 1, 1,
0.1931593, -1.666944, 2.954064, 0, 0.627451, 1, 1,
0.1956944, 1.580325, 0.6175873, 0, 0.6235294, 1, 1,
0.1998561, -0.1693426, 2.622823, 0, 0.6156863, 1, 1,
0.2085995, -1.300446, 5.250928, 0, 0.6117647, 1, 1,
0.2098644, 0.6800641, 0.657508, 0, 0.6039216, 1, 1,
0.2107737, 0.8216041, 0.6637015, 0, 0.5960785, 1, 1,
0.2129981, -0.05779208, 2.440939, 0, 0.5921569, 1, 1,
0.2148524, -0.4200681, 3.610924, 0, 0.5843138, 1, 1,
0.2169523, 0.222028, -0.01160335, 0, 0.5803922, 1, 1,
0.2175021, 1.02961, -0.2861089, 0, 0.572549, 1, 1,
0.2202535, -0.294416, 3.791984, 0, 0.5686275, 1, 1,
0.2207666, 0.1554564, 1.144547, 0, 0.5607843, 1, 1,
0.2272644, 2.409158, 0.4373547, 0, 0.5568628, 1, 1,
0.2312164, -0.6683781, 1.297444, 0, 0.5490196, 1, 1,
0.2312553, 0.1145011, 1.412906, 0, 0.5450981, 1, 1,
0.2379751, 0.5816575, -1.538288, 0, 0.5372549, 1, 1,
0.2388626, 0.3005346, 1.8547, 0, 0.5333334, 1, 1,
0.2430564, 0.1212876, 0.745686, 0, 0.5254902, 1, 1,
0.2447283, 0.5932669, -0.8021299, 0, 0.5215687, 1, 1,
0.2465354, -0.6914578, 2.548506, 0, 0.5137255, 1, 1,
0.2473277, -0.07703039, 2.202874, 0, 0.509804, 1, 1,
0.2482658, -0.400447, 1.92552, 0, 0.5019608, 1, 1,
0.2524521, 0.2036134, 0.7452503, 0, 0.4941176, 1, 1,
0.2554726, 0.4552606, -0.6233174, 0, 0.4901961, 1, 1,
0.2583542, -0.4312092, 0.9297804, 0, 0.4823529, 1, 1,
0.2584078, -0.3365968, 1.944257, 0, 0.4784314, 1, 1,
0.2608992, -1.461305, 3.716835, 0, 0.4705882, 1, 1,
0.2624961, -1.647444, 5.043869, 0, 0.4666667, 1, 1,
0.27163, -0.5257155, 1.795496, 0, 0.4588235, 1, 1,
0.2728614, -1.330986, 2.987285, 0, 0.454902, 1, 1,
0.2829791, -1.128565, 2.194402, 0, 0.4470588, 1, 1,
0.2858278, 0.488929, -0.626601, 0, 0.4431373, 1, 1,
0.2911643, 0.8901945, -0.04188338, 0, 0.4352941, 1, 1,
0.2980509, 2.358532, -1.168125, 0, 0.4313726, 1, 1,
0.2993702, 1.470212, -0.219726, 0, 0.4235294, 1, 1,
0.2999226, 1.856977, -1.22377, 0, 0.4196078, 1, 1,
0.3006785, 0.02973885, 1.061005, 0, 0.4117647, 1, 1,
0.3021353, 1.055726, 0.11985, 0, 0.4078431, 1, 1,
0.3052007, 0.6685299, 0.9675172, 0, 0.4, 1, 1,
0.3067897, 1.238467, 0.5117996, 0, 0.3921569, 1, 1,
0.315173, -1.290033, 3.205493, 0, 0.3882353, 1, 1,
0.3156295, 1.635581, -0.4060994, 0, 0.3803922, 1, 1,
0.3163769, -0.066421, 1.334376, 0, 0.3764706, 1, 1,
0.3180753, -0.06461318, 1.394172, 0, 0.3686275, 1, 1,
0.3202147, 1.93581, 0.3923078, 0, 0.3647059, 1, 1,
0.3227946, 1.38295, -1.348266, 0, 0.3568628, 1, 1,
0.3237399, 0.2392912, 0.5409746, 0, 0.3529412, 1, 1,
0.3255167, -0.6159464, 3.642091, 0, 0.345098, 1, 1,
0.3261867, -0.5027855, 1.285537, 0, 0.3411765, 1, 1,
0.3266504, -0.3019661, 2.730019, 0, 0.3333333, 1, 1,
0.3304575, -0.8138769, 1.068115, 0, 0.3294118, 1, 1,
0.3333862, -0.9162146, 2.823026, 0, 0.3215686, 1, 1,
0.3389242, -1.912766, 3.811309, 0, 0.3176471, 1, 1,
0.3413911, -1.429248, 3.555317, 0, 0.3098039, 1, 1,
0.3456608, -0.246645, 1.737825, 0, 0.3058824, 1, 1,
0.3460102, -0.6550482, 3.132684, 0, 0.2980392, 1, 1,
0.3497578, 1.682483, 1.263831, 0, 0.2901961, 1, 1,
0.3500023, -0.696391, 1.697416, 0, 0.2862745, 1, 1,
0.3502744, -2.091383, 4.828977, 0, 0.2784314, 1, 1,
0.3531273, -1.418149, 2.345257, 0, 0.2745098, 1, 1,
0.3551718, 0.2697207, 0.8004079, 0, 0.2666667, 1, 1,
0.3603793, -0.5803891, -0.3105086, 0, 0.2627451, 1, 1,
0.3613684, -0.5809889, 2.243638, 0, 0.254902, 1, 1,
0.3614191, -0.5962796, 2.927207, 0, 0.2509804, 1, 1,
0.3614415, 1.147466, 0.3431926, 0, 0.2431373, 1, 1,
0.3706538, 1.477088, -0.5534423, 0, 0.2392157, 1, 1,
0.3708498, -0.7967834, 2.970365, 0, 0.2313726, 1, 1,
0.3721964, 0.08620137, 0.3586016, 0, 0.227451, 1, 1,
0.3726112, 1.097357, 0.5919888, 0, 0.2196078, 1, 1,
0.3784504, -0.7013749, 1.303476, 0, 0.2156863, 1, 1,
0.3823402, 0.7136905, 1.262618, 0, 0.2078431, 1, 1,
0.3828161, 0.780659, 1.741884, 0, 0.2039216, 1, 1,
0.3852978, -0.1516802, 3.008245, 0, 0.1960784, 1, 1,
0.386463, -0.746869, 2.963274, 0, 0.1882353, 1, 1,
0.3872435, 0.5763168, 0.2765367, 0, 0.1843137, 1, 1,
0.3882371, 0.8634218, -0.8177679, 0, 0.1764706, 1, 1,
0.3902931, -0.8386701, 3.243166, 0, 0.172549, 1, 1,
0.397086, -0.387902, 1.635142, 0, 0.1647059, 1, 1,
0.3974321, -0.342142, 1.505577, 0, 0.1607843, 1, 1,
0.3990597, 0.9043382, 1.141151, 0, 0.1529412, 1, 1,
0.3997688, -0.363621, 3.999379, 0, 0.1490196, 1, 1,
0.4037493, -0.6769049, 2.057058, 0, 0.1411765, 1, 1,
0.4051192, -0.2293605, 1.591595, 0, 0.1372549, 1, 1,
0.4098757, 0.414256, 1.219113, 0, 0.1294118, 1, 1,
0.4109138, -0.2672596, 2.190818, 0, 0.1254902, 1, 1,
0.4150411, -1.35446, 3.185673, 0, 0.1176471, 1, 1,
0.4189453, 0.2567889, -1.570836, 0, 0.1137255, 1, 1,
0.4191448, -1.179983, 3.676629, 0, 0.1058824, 1, 1,
0.419784, 0.2518218, -0.3211121, 0, 0.09803922, 1, 1,
0.4251312, -0.7573643, 3.200335, 0, 0.09411765, 1, 1,
0.4320786, 0.3614083, 1.16234, 0, 0.08627451, 1, 1,
0.4338925, -1.391636, 3.474563, 0, 0.08235294, 1, 1,
0.440521, 1.991174, 1.000408, 0, 0.07450981, 1, 1,
0.4429371, -1.037546, 2.623839, 0, 0.07058824, 1, 1,
0.444336, 0.873795, 0.3923675, 0, 0.0627451, 1, 1,
0.4478187, 0.08237424, 0.6434323, 0, 0.05882353, 1, 1,
0.4481277, -1.04632, 2.02941, 0, 0.05098039, 1, 1,
0.4498553, 0.6440097, 2.098186, 0, 0.04705882, 1, 1,
0.4500543, -1.236598, 2.998671, 0, 0.03921569, 1, 1,
0.4511756, 0.6329242, 1.955372, 0, 0.03529412, 1, 1,
0.4600897, -1.897445, 2.310534, 0, 0.02745098, 1, 1,
0.4601538, -0.2484604, 0.9552748, 0, 0.02352941, 1, 1,
0.4658039, 0.8115048, 0.1394234, 0, 0.01568628, 1, 1,
0.4665632, 0.2318819, 0.4758191, 0, 0.01176471, 1, 1,
0.4745004, 0.8190114, -0.09437723, 0, 0.003921569, 1, 1,
0.4755961, -1.563843, 2.626723, 0.003921569, 0, 1, 1,
0.4804802, -0.524839, 3.762363, 0.007843138, 0, 1, 1,
0.4824283, 0.5951337, 0.8937327, 0.01568628, 0, 1, 1,
0.4850218, -0.1635255, 3.345274, 0.01960784, 0, 1, 1,
0.4955171, -0.2717528, 2.453688, 0.02745098, 0, 1, 1,
0.4968788, -0.3405657, 2.983966, 0.03137255, 0, 1, 1,
0.4975098, 0.4840567, 2.118992, 0.03921569, 0, 1, 1,
0.4986005, -1.442758, 3.690386, 0.04313726, 0, 1, 1,
0.504305, -1.478293, 3.890234, 0.05098039, 0, 1, 1,
0.5055058, -0.6008947, 3.371547, 0.05490196, 0, 1, 1,
0.5060536, 0.179379, 1.578333, 0.0627451, 0, 1, 1,
0.5072296, 0.1453121, 0.1119126, 0.06666667, 0, 1, 1,
0.5073482, 1.175509, 1.255832, 0.07450981, 0, 1, 1,
0.5100358, 0.5540238, 1.262861, 0.07843138, 0, 1, 1,
0.5129559, 0.4858362, 1.181303, 0.08627451, 0, 1, 1,
0.5133218, 0.9444482, -0.04655446, 0.09019608, 0, 1, 1,
0.515851, -0.02735832, 0.9551479, 0.09803922, 0, 1, 1,
0.5163019, 0.7527242, 1.907808, 0.1058824, 0, 1, 1,
0.5188569, 1.298626, 0.7032881, 0.1098039, 0, 1, 1,
0.5213317, -0.7903058, 2.370599, 0.1176471, 0, 1, 1,
0.5222864, 2.031814, -0.03458519, 0.1215686, 0, 1, 1,
0.5284075, -0.9106579, 2.739445, 0.1294118, 0, 1, 1,
0.533052, 1.106258, -0.2479565, 0.1333333, 0, 1, 1,
0.5361395, -3.106047, 3.801349, 0.1411765, 0, 1, 1,
0.5385939, 0.2453326, -0.5347741, 0.145098, 0, 1, 1,
0.5430997, -0.4711307, 3.024416, 0.1529412, 0, 1, 1,
0.5461236, -1.111902, 1.445105, 0.1568628, 0, 1, 1,
0.5464408, 1.606149, 0.8971269, 0.1647059, 0, 1, 1,
0.5520149, -0.5832112, 3.503544, 0.1686275, 0, 1, 1,
0.5535046, 0.4333082, 0.977053, 0.1764706, 0, 1, 1,
0.5544943, 0.8252264, 0.2954687, 0.1803922, 0, 1, 1,
0.5617757, 0.5371842, 0.7979776, 0.1882353, 0, 1, 1,
0.5618965, 1.127296, -0.8670141, 0.1921569, 0, 1, 1,
0.5627091, 0.3316689, 0.5166321, 0.2, 0, 1, 1,
0.5640054, -0.7306914, 2.564429, 0.2078431, 0, 1, 1,
0.5641834, 2.071599, -0.2287881, 0.2117647, 0, 1, 1,
0.5651324, 0.6199314, 0.4189253, 0.2196078, 0, 1, 1,
0.5668216, 0.6732379, 1.807065, 0.2235294, 0, 1, 1,
0.569313, -0.2439982, 3.041774, 0.2313726, 0, 1, 1,
0.5720671, 1.607994, -0.6299549, 0.2352941, 0, 1, 1,
0.5751749, -0.9183816, 1.437614, 0.2431373, 0, 1, 1,
0.584398, -0.1894236, 1.243905, 0.2470588, 0, 1, 1,
0.5846224, 0.7770557, 0.3995269, 0.254902, 0, 1, 1,
0.5878513, -1.103336, 3.35655, 0.2588235, 0, 1, 1,
0.5898909, 0.2089505, 1.61324, 0.2666667, 0, 1, 1,
0.5949641, -1.480329, 2.829514, 0.2705882, 0, 1, 1,
0.5972915, -0.3529861, 1.485563, 0.2784314, 0, 1, 1,
0.5973422, -0.518036, 3.532856, 0.282353, 0, 1, 1,
0.599033, 0.3915895, 0.8576708, 0.2901961, 0, 1, 1,
0.6080947, 0.06066836, 2.794414, 0.2941177, 0, 1, 1,
0.6140917, -0.9710877, 2.645259, 0.3019608, 0, 1, 1,
0.617544, -1.466839, 1.903973, 0.3098039, 0, 1, 1,
0.6216853, -0.0464759, 0.3627794, 0.3137255, 0, 1, 1,
0.6242288, 0.09208886, 2.484423, 0.3215686, 0, 1, 1,
0.6274825, 0.505658, -1.260777, 0.3254902, 0, 1, 1,
0.6277999, 1.585834, -0.3285914, 0.3333333, 0, 1, 1,
0.6283315, 0.00922173, 1.112088, 0.3372549, 0, 1, 1,
0.62845, -0.2758624, 3.715012, 0.345098, 0, 1, 1,
0.6286094, -0.5185104, 1.092182, 0.3490196, 0, 1, 1,
0.6290415, 1.608971, 0.8446013, 0.3568628, 0, 1, 1,
0.6346328, 0.2264538, 1.669573, 0.3607843, 0, 1, 1,
0.6404275, -1.80817, 2.353284, 0.3686275, 0, 1, 1,
0.6413271, 0.4116911, 1.424506, 0.372549, 0, 1, 1,
0.6419647, 0.8051387, 0.9469786, 0.3803922, 0, 1, 1,
0.6423534, 0.3312117, 0.7192001, 0.3843137, 0, 1, 1,
0.6434868, 0.4723079, -0.7481372, 0.3921569, 0, 1, 1,
0.6532452, 1.42208, -0.03401119, 0.3960784, 0, 1, 1,
0.6571773, -2.072968, 3.725996, 0.4039216, 0, 1, 1,
0.663965, -0.4835785, 0.7236449, 0.4117647, 0, 1, 1,
0.671082, -0.01968953, 1.469626, 0.4156863, 0, 1, 1,
0.6775557, -0.7263501, 2.529274, 0.4235294, 0, 1, 1,
0.6781721, 0.8163556, 1.290287, 0.427451, 0, 1, 1,
0.6822767, -0.8023432, 1.217913, 0.4352941, 0, 1, 1,
0.6839947, 0.9551575, -1.443516, 0.4392157, 0, 1, 1,
0.6891102, 2.282977, 0.2120269, 0.4470588, 0, 1, 1,
0.6992912, -0.7457679, 3.912736, 0.4509804, 0, 1, 1,
0.6995823, -1.180715, 1.937624, 0.4588235, 0, 1, 1,
0.7038437, 0.7681972, 1.353601, 0.4627451, 0, 1, 1,
0.705253, 1.414339, -0.234988, 0.4705882, 0, 1, 1,
0.707839, -0.4250568, 2.543472, 0.4745098, 0, 1, 1,
0.7086614, 0.9239456, -0.1059538, 0.4823529, 0, 1, 1,
0.71155, -1.482807, 1.299114, 0.4862745, 0, 1, 1,
0.7130978, -2.591477, 1.507596, 0.4941176, 0, 1, 1,
0.7165393, 0.7411763, 0.9777045, 0.5019608, 0, 1, 1,
0.7236742, -0.03641301, 1.99441, 0.5058824, 0, 1, 1,
0.7287613, 0.06207928, 2.124491, 0.5137255, 0, 1, 1,
0.731708, 2.063722, 2.106826, 0.5176471, 0, 1, 1,
0.7322534, -0.5417348, 1.642832, 0.5254902, 0, 1, 1,
0.734493, 0.8730893, 0.2559408, 0.5294118, 0, 1, 1,
0.7355149, -0.3096405, 1.464078, 0.5372549, 0, 1, 1,
0.7388371, -0.343936, 1.996446, 0.5411765, 0, 1, 1,
0.7470879, 1.33455, -0.9068269, 0.5490196, 0, 1, 1,
0.756848, -0.3268895, 1.306479, 0.5529412, 0, 1, 1,
0.7674024, -1.621294, 1.260684, 0.5607843, 0, 1, 1,
0.7677705, -1.221189, 2.044138, 0.5647059, 0, 1, 1,
0.7771978, 1.26084, 3.039946, 0.572549, 0, 1, 1,
0.7839047, 0.05821135, 0.006624405, 0.5764706, 0, 1, 1,
0.7848814, -1.884172, 2.614458, 0.5843138, 0, 1, 1,
0.7931527, -0.4318482, 1.674589, 0.5882353, 0, 1, 1,
0.7931729, 1.106639, 0.288124, 0.5960785, 0, 1, 1,
0.797128, 2.514421, -0.782863, 0.6039216, 0, 1, 1,
0.7982482, 0.9800919, -0.4284081, 0.6078432, 0, 1, 1,
0.800933, 1.734861, 1.192579, 0.6156863, 0, 1, 1,
0.8066437, 1.543282, -1.156703, 0.6196079, 0, 1, 1,
0.8141034, 1.07247, 0.1550135, 0.627451, 0, 1, 1,
0.816326, -0.6939237, 3.040116, 0.6313726, 0, 1, 1,
0.8165199, 0.4530611, 1.767683, 0.6392157, 0, 1, 1,
0.8172899, -2.552973, 3.486342, 0.6431373, 0, 1, 1,
0.8217273, -1.326846, 4.405523, 0.6509804, 0, 1, 1,
0.8220422, 0.9584684, 0.1988599, 0.654902, 0, 1, 1,
0.8273156, -1.415533, 1.102956, 0.6627451, 0, 1, 1,
0.8292349, 0.5624837, 0.6963567, 0.6666667, 0, 1, 1,
0.8428026, -0.02655132, 2.434842, 0.6745098, 0, 1, 1,
0.8436022, -1.605913, 2.297478, 0.6784314, 0, 1, 1,
0.8659762, -0.6667367, 1.251973, 0.6862745, 0, 1, 1,
0.871487, 0.09203028, 0.9040894, 0.6901961, 0, 1, 1,
0.8750748, -0.5529133, 2.893992, 0.6980392, 0, 1, 1,
0.8796017, -1.124123, 2.254228, 0.7058824, 0, 1, 1,
0.8834257, -1.028232, 3.067333, 0.7098039, 0, 1, 1,
0.8891985, -1.934872, 1.009318, 0.7176471, 0, 1, 1,
0.8956761, -0.2494569, 1.479023, 0.7215686, 0, 1, 1,
0.9004911, -0.1770583, 2.763244, 0.7294118, 0, 1, 1,
0.9030655, -0.5519626, 0.02510826, 0.7333333, 0, 1, 1,
0.9053608, 1.110693, -1.30673, 0.7411765, 0, 1, 1,
0.9090669, 0.07761912, 0.6386878, 0.7450981, 0, 1, 1,
0.9119375, 0.5753326, 1.938855, 0.7529412, 0, 1, 1,
0.9155517, -0.5591872, 1.917899, 0.7568628, 0, 1, 1,
0.9193344, -0.9774748, 1.039061, 0.7647059, 0, 1, 1,
0.9231821, -1.452145, 0.6853023, 0.7686275, 0, 1, 1,
0.9254631, 2.114322, -0.2486233, 0.7764706, 0, 1, 1,
0.9333647, -0.004668708, 2.470473, 0.7803922, 0, 1, 1,
0.9388309, 1.906346, 1.020766, 0.7882353, 0, 1, 1,
0.9396479, 0.475816, -0.1541225, 0.7921569, 0, 1, 1,
0.9424891, -1.767754, 0.7512539, 0.8, 0, 1, 1,
0.9504848, -0.06156519, 2.600328, 0.8078431, 0, 1, 1,
0.9575073, -1.04976, 2.466882, 0.8117647, 0, 1, 1,
0.9688812, -1.171595, 1.875483, 0.8196079, 0, 1, 1,
0.9779042, 1.380048, 0.7163793, 0.8235294, 0, 1, 1,
0.9790618, 0.7237911, 0.7845472, 0.8313726, 0, 1, 1,
0.9866908, -1.881257, 2.212839, 0.8352941, 0, 1, 1,
0.9886267, -1.198272, 2.549123, 0.8431373, 0, 1, 1,
0.9905997, -1.649759, 2.214542, 0.8470588, 0, 1, 1,
0.9951676, -1.2675, 3.302674, 0.854902, 0, 1, 1,
1.002642, 0.2203732, 0.6520579, 0.8588235, 0, 1, 1,
1.010783, -0.2489338, 0.9805241, 0.8666667, 0, 1, 1,
1.01999, -2.084524, 3.604274, 0.8705882, 0, 1, 1,
1.023972, 1.867097, 1.896905, 0.8784314, 0, 1, 1,
1.026815, 1.289589, 1.233708, 0.8823529, 0, 1, 1,
1.031511, 1.537523, -1.536153, 0.8901961, 0, 1, 1,
1.037084, 0.857649, 1.559808, 0.8941177, 0, 1, 1,
1.039982, 0.6667933, -0.4459047, 0.9019608, 0, 1, 1,
1.040017, 1.088484, -0.6014274, 0.9098039, 0, 1, 1,
1.042517, 1.807694, 0.9677801, 0.9137255, 0, 1, 1,
1.042623, -0.9143936, 1.976299, 0.9215686, 0, 1, 1,
1.055961, 0.1584748, 1.722069, 0.9254902, 0, 1, 1,
1.062678, 0.03821211, 0.752883, 0.9333333, 0, 1, 1,
1.071876, 0.1249292, 1.451749, 0.9372549, 0, 1, 1,
1.077872, 1.516501, 1.841566, 0.945098, 0, 1, 1,
1.083095, 0.5883715, 1.073442, 0.9490196, 0, 1, 1,
1.088994, 0.316217, 4.647158, 0.9568627, 0, 1, 1,
1.092297, 0.02812691, 2.044574, 0.9607843, 0, 1, 1,
1.099856, 0.1768502, 1.745293, 0.9686275, 0, 1, 1,
1.102858, 0.5859588, 0.7560399, 0.972549, 0, 1, 1,
1.104921, -0.5664997, 2.457308, 0.9803922, 0, 1, 1,
1.105333, -0.1914966, 1.000433, 0.9843137, 0, 1, 1,
1.111042, 2.531334, 0.4351231, 0.9921569, 0, 1, 1,
1.117507, 1.991691, 1.458886, 0.9960784, 0, 1, 1,
1.120939, -0.1713348, 1.783918, 1, 0, 0.9960784, 1,
1.124282, 2.165928, 0.395575, 1, 0, 0.9882353, 1,
1.125282, -0.5269238, 2.409098, 1, 0, 0.9843137, 1,
1.127084, 0.2708743, 2.131846, 1, 0, 0.9764706, 1,
1.133724, 0.9800152, 0.3137622, 1, 0, 0.972549, 1,
1.13563, -1.260052, 2.50847, 1, 0, 0.9647059, 1,
1.139203, -0.9140161, 2.169048, 1, 0, 0.9607843, 1,
1.165309, 1.271281, 0.8110772, 1, 0, 0.9529412, 1,
1.165935, 0.1469286, 4.683377, 1, 0, 0.9490196, 1,
1.168886, 0.6514057, 1.951513, 1, 0, 0.9411765, 1,
1.170848, -1.994549, 2.390519, 1, 0, 0.9372549, 1,
1.177169, -0.2496181, 0.2968556, 1, 0, 0.9294118, 1,
1.181514, -0.1691597, 3.153021, 1, 0, 0.9254902, 1,
1.181748, -0.07087692, 1.37159, 1, 0, 0.9176471, 1,
1.184676, 1.094646, 1.489042, 1, 0, 0.9137255, 1,
1.189603, -0.4186873, 2.344112, 1, 0, 0.9058824, 1,
1.189827, 1.10436, -0.02219225, 1, 0, 0.9019608, 1,
1.206894, 1.984657, 0.8360454, 1, 0, 0.8941177, 1,
1.208755, -1.224845, 3.503614, 1, 0, 0.8862745, 1,
1.234309, -0.2958333, 3.108053, 1, 0, 0.8823529, 1,
1.234685, 1.346107, 2.232347, 1, 0, 0.8745098, 1,
1.235427, 0.07581153, 2.100865, 1, 0, 0.8705882, 1,
1.236871, 1.237901, 3.156109, 1, 0, 0.8627451, 1,
1.243396, 0.4278112, 0.5940087, 1, 0, 0.8588235, 1,
1.244675, -1.317954, 3.788534, 1, 0, 0.8509804, 1,
1.247057, -0.3281944, 1.400139, 1, 0, 0.8470588, 1,
1.247657, 0.447684, 1.835323, 1, 0, 0.8392157, 1,
1.24965, 1.163929, 2.100755, 1, 0, 0.8352941, 1,
1.249677, -0.2964246, 2.583055, 1, 0, 0.827451, 1,
1.252707, -0.6083128, 3.056722, 1, 0, 0.8235294, 1,
1.256741, 1.025456, 0.753629, 1, 0, 0.8156863, 1,
1.263288, 0.4362642, 1.251599, 1, 0, 0.8117647, 1,
1.265079, 0.2344659, 3.086141, 1, 0, 0.8039216, 1,
1.265521, 0.06866672, 1.213194, 1, 0, 0.7960784, 1,
1.278932, -0.0469071, 1.679896, 1, 0, 0.7921569, 1,
1.285106, 0.2088811, 0.3645497, 1, 0, 0.7843137, 1,
1.291353, 2.233799, 1.075466, 1, 0, 0.7803922, 1,
1.293529, -1.308049, 3.165608, 1, 0, 0.772549, 1,
1.300504, 0.1962637, 0.1270885, 1, 0, 0.7686275, 1,
1.310498, 0.2589158, 1.115705, 1, 0, 0.7607843, 1,
1.31068, -1.249238, 2.413729, 1, 0, 0.7568628, 1,
1.31221, 0.7237487, 0.7894056, 1, 0, 0.7490196, 1,
1.314813, 1.509459, -0.02294169, 1, 0, 0.7450981, 1,
1.324805, -0.7977354, 2.894357, 1, 0, 0.7372549, 1,
1.32798, -0.8427238, 3.755259, 1, 0, 0.7333333, 1,
1.334218, -1.820452, 1.959736, 1, 0, 0.7254902, 1,
1.350006, 0.5226184, -0.8741606, 1, 0, 0.7215686, 1,
1.352594, 1.670044, 0.07589827, 1, 0, 0.7137255, 1,
1.364279, 0.2992331, 0.7630089, 1, 0, 0.7098039, 1,
1.371912, -0.9914583, 1.129907, 1, 0, 0.7019608, 1,
1.373524, 0.6614795, 1.457081, 1, 0, 0.6941177, 1,
1.374907, -0.7316931, 2.206729, 1, 0, 0.6901961, 1,
1.379491, 0.4388386, 0.1248476, 1, 0, 0.682353, 1,
1.383711, 0.3080339, 1.363077, 1, 0, 0.6784314, 1,
1.393356, 0.8651547, 0.02736296, 1, 0, 0.6705883, 1,
1.393397, -0.6403919, 2.374774, 1, 0, 0.6666667, 1,
1.395774, 0.2295805, 1.652441, 1, 0, 0.6588235, 1,
1.397417, 0.4805133, 0.411651, 1, 0, 0.654902, 1,
1.401947, -0.07763951, 0.4016401, 1, 0, 0.6470588, 1,
1.407381, 0.4290035, 1.575269, 1, 0, 0.6431373, 1,
1.417186, -0.2729808, 2.558261, 1, 0, 0.6352941, 1,
1.426209, -0.2971701, 2.785419, 1, 0, 0.6313726, 1,
1.429398, -0.6686333, 2.0452, 1, 0, 0.6235294, 1,
1.430552, 1.307088, 0.5594656, 1, 0, 0.6196079, 1,
1.438721, 0.6415239, 1.73937, 1, 0, 0.6117647, 1,
1.442099, -0.7013531, 1.688684, 1, 0, 0.6078432, 1,
1.444239, 0.3109769, 1.823312, 1, 0, 0.6, 1,
1.451865, -2.334351, 1.466884, 1, 0, 0.5921569, 1,
1.45886, 0.8793175, -0.1279877, 1, 0, 0.5882353, 1,
1.469325, 0.01309461, 1.016192, 1, 0, 0.5803922, 1,
1.47067, 0.9168884, 0.03546586, 1, 0, 0.5764706, 1,
1.482661, -0.8856667, 2.646035, 1, 0, 0.5686275, 1,
1.492372, -0.3406412, 1.628782, 1, 0, 0.5647059, 1,
1.493297, 2.870167, 0.07058551, 1, 0, 0.5568628, 1,
1.506568, -1.691389, 3.379102, 1, 0, 0.5529412, 1,
1.508866, 0.436596, 1.210117, 1, 0, 0.5450981, 1,
1.512158, 0.07361, 2.722053, 1, 0, 0.5411765, 1,
1.514414, 1.059046, 0.1445163, 1, 0, 0.5333334, 1,
1.531055, -1.696841, 1.45699, 1, 0, 0.5294118, 1,
1.533586, -0.5083613, 2.253534, 1, 0, 0.5215687, 1,
1.552281, 0.03561956, 2.424179, 1, 0, 0.5176471, 1,
1.554439, -1.081404, 3.220952, 1, 0, 0.509804, 1,
1.572226, 0.5332851, -1.148343, 1, 0, 0.5058824, 1,
1.579307, 0.1716049, 2.990455, 1, 0, 0.4980392, 1,
1.579891, -0.7123487, 0.7256991, 1, 0, 0.4901961, 1,
1.590713, -1.782738, 1.616631, 1, 0, 0.4862745, 1,
1.602761, 0.9485974, 0.8058606, 1, 0, 0.4784314, 1,
1.608984, -2.689085, 3.10352, 1, 0, 0.4745098, 1,
1.613813, -0.7838445, 2.205459, 1, 0, 0.4666667, 1,
1.615909, 0.2919475, 2.192553, 1, 0, 0.4627451, 1,
1.624267, -0.3482344, 1.15258, 1, 0, 0.454902, 1,
1.627701, -0.9340034, 1.644166, 1, 0, 0.4509804, 1,
1.628436, -2.024913, -0.6291568, 1, 0, 0.4431373, 1,
1.62854, -0.02044604, 0.3267254, 1, 0, 0.4392157, 1,
1.646585, -1.152579, 0.255991, 1, 0, 0.4313726, 1,
1.649574, -0.3440431, 2.366146, 1, 0, 0.427451, 1,
1.673811, -0.8143905, 0.4947512, 1, 0, 0.4196078, 1,
1.681222, -1.579794, 3.190542, 1, 0, 0.4156863, 1,
1.685262, 0.5822557, 0.1929168, 1, 0, 0.4078431, 1,
1.685284, -0.03658498, 2.405406, 1, 0, 0.4039216, 1,
1.693442, -0.3014587, 1.668857, 1, 0, 0.3960784, 1,
1.704778, -0.1013147, 1.517343, 1, 0, 0.3882353, 1,
1.706463, -0.7329191, 2.233093, 1, 0, 0.3843137, 1,
1.719118, -1.57212, 0.3727948, 1, 0, 0.3764706, 1,
1.738016, 2.365285, 0.3678806, 1, 0, 0.372549, 1,
1.749867, -1.013259, 2.156407, 1, 0, 0.3647059, 1,
1.752861, 0.8458958, 0.6442564, 1, 0, 0.3607843, 1,
1.757305, 0.1381744, 1.995316, 1, 0, 0.3529412, 1,
1.760357, 2.285542, 1.606343, 1, 0, 0.3490196, 1,
1.767706, -0.7881017, 3.165277, 1, 0, 0.3411765, 1,
1.771274, -0.3832019, 0.7969604, 1, 0, 0.3372549, 1,
1.77758, -0.3466774, 2.179116, 1, 0, 0.3294118, 1,
1.779494, 0.02137394, 2.719404, 1, 0, 0.3254902, 1,
1.780918, 0.2361282, 2.087634, 1, 0, 0.3176471, 1,
1.783653, -0.1384802, 1.151225, 1, 0, 0.3137255, 1,
1.810215, -0.2950862, 2.432906, 1, 0, 0.3058824, 1,
1.811027, 0.3439187, 0.4621565, 1, 0, 0.2980392, 1,
1.813028, 0.1131538, 1.951145, 1, 0, 0.2941177, 1,
1.819, 1.728757, 0.103607, 1, 0, 0.2862745, 1,
1.819775, -0.8384564, 2.485627, 1, 0, 0.282353, 1,
1.823378, 0.9266458, 1.17681, 1, 0, 0.2745098, 1,
1.846203, -0.4074609, 1.205559, 1, 0, 0.2705882, 1,
1.854717, -0.8877364, 2.872675, 1, 0, 0.2627451, 1,
1.857238, -2.08393, 3.353143, 1, 0, 0.2588235, 1,
1.866284, -0.5788597, 0.5815913, 1, 0, 0.2509804, 1,
1.876019, -2.170281, 2.173897, 1, 0, 0.2470588, 1,
1.887396, -2.658886, 1.156361, 1, 0, 0.2392157, 1,
1.903241, 1.589872, 1.37511, 1, 0, 0.2352941, 1,
1.91679, -0.08342914, 1.602771, 1, 0, 0.227451, 1,
1.936451, -0.2497827, 1.009322, 1, 0, 0.2235294, 1,
1.938969, -0.9311327, 1.338927, 1, 0, 0.2156863, 1,
1.947183, 0.05337979, 0.1431846, 1, 0, 0.2117647, 1,
1.955513, -1.340542, 3.384056, 1, 0, 0.2039216, 1,
1.958604, 0.0429161, 2.287106, 1, 0, 0.1960784, 1,
1.984266, -0.3699965, 1.323064, 1, 0, 0.1921569, 1,
1.985937, -0.6773985, 0.5205755, 1, 0, 0.1843137, 1,
2.00031, 1.079045, 0.6989241, 1, 0, 0.1803922, 1,
2.096981, 0.8055467, 2.361042, 1, 0, 0.172549, 1,
2.107364, 0.6323811, -0.156178, 1, 0, 0.1686275, 1,
2.119738, -0.4874433, 0.640258, 1, 0, 0.1607843, 1,
2.180147, 1.458257, -1.437683, 1, 0, 0.1568628, 1,
2.229107, 0.5453712, 2.467592, 1, 0, 0.1490196, 1,
2.252969, -0.6642326, 2.306237, 1, 0, 0.145098, 1,
2.274357, 0.5500752, 0.7747633, 1, 0, 0.1372549, 1,
2.305664, 1.03573, 2.516143, 1, 0, 0.1333333, 1,
2.310491, -1.331815, 2.059975, 1, 0, 0.1254902, 1,
2.329262, -1.281221, 2.058128, 1, 0, 0.1215686, 1,
2.35126, -0.4982013, 3.233147, 1, 0, 0.1137255, 1,
2.364995, 1.525407, 0.6723992, 1, 0, 0.1098039, 1,
2.404387, -1.23744, 2.403306, 1, 0, 0.1019608, 1,
2.427067, -1.712886, 1.617611, 1, 0, 0.09411765, 1,
2.434683, -0.06965389, 2.6977, 1, 0, 0.09019608, 1,
2.458474, 1.199888, 1.007076, 1, 0, 0.08235294, 1,
2.612858, -1.164647, 2.072996, 1, 0, 0.07843138, 1,
2.667996, 0.1663375, 0.7259141, 1, 0, 0.07058824, 1,
2.692955, -1.6903, 2.000139, 1, 0, 0.06666667, 1,
2.781886, 0.9727601, 1.190813, 1, 0, 0.05882353, 1,
2.812008, -0.1052091, 3.002879, 1, 0, 0.05490196, 1,
2.899137, -2.076664, 2.185505, 1, 0, 0.04705882, 1,
2.935767, -1.526204, 3.358632, 1, 0, 0.04313726, 1,
2.977315, 0.2836939, 1.81438, 1, 0, 0.03529412, 1,
3.18036, 0.1665652, 2.441438, 1, 0, 0.03137255, 1,
3.214865, -0.006285948, -0.1768014, 1, 0, 0.02352941, 1,
3.319535, 0.3729968, 1.991484, 1, 0, 0.01960784, 1,
3.61636, 0.2684341, 3.09868, 1, 0, 0.01176471, 1,
4.206536, -0.05775558, 1.265085, 1, 0, 0.007843138, 1
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
0.6272638, -4.637277, -7.815673, 0, -0.5, 0.5, 0.5,
0.6272638, -4.637277, -7.815673, 1, -0.5, 0.5, 0.5,
0.6272638, -4.637277, -7.815673, 1, 1.5, 0.5, 0.5,
0.6272638, -4.637277, -7.815673, 0, 1.5, 0.5, 0.5
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
-4.165382, 0.1041714, -7.815673, 0, -0.5, 0.5, 0.5,
-4.165382, 0.1041714, -7.815673, 1, -0.5, 0.5, 0.5,
-4.165382, 0.1041714, -7.815673, 1, 1.5, 0.5, 0.5,
-4.165382, 0.1041714, -7.815673, 0, 1.5, 0.5, 0.5
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
-4.165382, -4.637277, -0.3354766, 0, -0.5, 0.5, 0.5,
-4.165382, -4.637277, -0.3354766, 1, -0.5, 0.5, 0.5,
-4.165382, -4.637277, -0.3354766, 1, 1.5, 0.5, 0.5,
-4.165382, -4.637277, -0.3354766, 0, 1.5, 0.5, 0.5
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
-2, -3.543097, -6.089474,
4, -3.543097, -6.089474,
-2, -3.543097, -6.089474,
-2, -3.72546, -6.377174,
0, -3.543097, -6.089474,
0, -3.72546, -6.377174,
2, -3.543097, -6.089474,
2, -3.72546, -6.377174,
4, -3.543097, -6.089474,
4, -3.72546, -6.377174
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
"2",
"4"
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
-2, -4.090187, -6.952573, 0, -0.5, 0.5, 0.5,
-2, -4.090187, -6.952573, 1, -0.5, 0.5, 0.5,
-2, -4.090187, -6.952573, 1, 1.5, 0.5, 0.5,
-2, -4.090187, -6.952573, 0, 1.5, 0.5, 0.5,
0, -4.090187, -6.952573, 0, -0.5, 0.5, 0.5,
0, -4.090187, -6.952573, 1, -0.5, 0.5, 0.5,
0, -4.090187, -6.952573, 1, 1.5, 0.5, 0.5,
0, -4.090187, -6.952573, 0, 1.5, 0.5, 0.5,
2, -4.090187, -6.952573, 0, -0.5, 0.5, 0.5,
2, -4.090187, -6.952573, 1, -0.5, 0.5, 0.5,
2, -4.090187, -6.952573, 1, 1.5, 0.5, 0.5,
2, -4.090187, -6.952573, 0, 1.5, 0.5, 0.5,
4, -4.090187, -6.952573, 0, -0.5, 0.5, 0.5,
4, -4.090187, -6.952573, 1, -0.5, 0.5, 0.5,
4, -4.090187, -6.952573, 1, 1.5, 0.5, 0.5,
4, -4.090187, -6.952573, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.059387, -2, -6.089474,
-3.059387, 2, -6.089474,
-3.059387, -2, -6.089474,
-3.243719, -2, -6.377174,
-3.059387, 0, -6.089474,
-3.243719, 0, -6.377174,
-3.059387, 2, -6.089474,
-3.243719, 2, -6.377174
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
"0",
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
-3.612385, -2, -6.952573, 0, -0.5, 0.5, 0.5,
-3.612385, -2, -6.952573, 1, -0.5, 0.5, 0.5,
-3.612385, -2, -6.952573, 1, 1.5, 0.5, 0.5,
-3.612385, -2, -6.952573, 0, 1.5, 0.5, 0.5,
-3.612385, 0, -6.952573, 0, -0.5, 0.5, 0.5,
-3.612385, 0, -6.952573, 1, -0.5, 0.5, 0.5,
-3.612385, 0, -6.952573, 1, 1.5, 0.5, 0.5,
-3.612385, 0, -6.952573, 0, 1.5, 0.5, 0.5,
-3.612385, 2, -6.952573, 0, -0.5, 0.5, 0.5,
-3.612385, 2, -6.952573, 1, -0.5, 0.5, 0.5,
-3.612385, 2, -6.952573, 1, 1.5, 0.5, 0.5,
-3.612385, 2, -6.952573, 0, 1.5, 0.5, 0.5
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
-3.059387, -3.543097, -4,
-3.059387, -3.543097, 4,
-3.059387, -3.543097, -4,
-3.243719, -3.72546, -4,
-3.059387, -3.543097, -2,
-3.243719, -3.72546, -2,
-3.059387, -3.543097, 0,
-3.243719, -3.72546, 0,
-3.059387, -3.543097, 2,
-3.243719, -3.72546, 2,
-3.059387, -3.543097, 4,
-3.243719, -3.72546, 4
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
-3.612385, -4.090187, -4, 0, -0.5, 0.5, 0.5,
-3.612385, -4.090187, -4, 1, -0.5, 0.5, 0.5,
-3.612385, -4.090187, -4, 1, 1.5, 0.5, 0.5,
-3.612385, -4.090187, -4, 0, 1.5, 0.5, 0.5,
-3.612385, -4.090187, -2, 0, -0.5, 0.5, 0.5,
-3.612385, -4.090187, -2, 1, -0.5, 0.5, 0.5,
-3.612385, -4.090187, -2, 1, 1.5, 0.5, 0.5,
-3.612385, -4.090187, -2, 0, 1.5, 0.5, 0.5,
-3.612385, -4.090187, 0, 0, -0.5, 0.5, 0.5,
-3.612385, -4.090187, 0, 1, -0.5, 0.5, 0.5,
-3.612385, -4.090187, 0, 1, 1.5, 0.5, 0.5,
-3.612385, -4.090187, 0, 0, 1.5, 0.5, 0.5,
-3.612385, -4.090187, 2, 0, -0.5, 0.5, 0.5,
-3.612385, -4.090187, 2, 1, -0.5, 0.5, 0.5,
-3.612385, -4.090187, 2, 1, 1.5, 0.5, 0.5,
-3.612385, -4.090187, 2, 0, 1.5, 0.5, 0.5,
-3.612385, -4.090187, 4, 0, -0.5, 0.5, 0.5,
-3.612385, -4.090187, 4, 1, -0.5, 0.5, 0.5,
-3.612385, -4.090187, 4, 1, 1.5, 0.5, 0.5,
-3.612385, -4.090187, 4, 0, 1.5, 0.5, 0.5
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
-3.059387, -3.543097, -6.089474,
-3.059387, 3.751439, -6.089474,
-3.059387, -3.543097, 5.41852,
-3.059387, 3.751439, 5.41852,
-3.059387, -3.543097, -6.089474,
-3.059387, -3.543097, 5.41852,
-3.059387, 3.751439, -6.089474,
-3.059387, 3.751439, 5.41852,
-3.059387, -3.543097, -6.089474,
4.313914, -3.543097, -6.089474,
-3.059387, -3.543097, 5.41852,
4.313914, -3.543097, 5.41852,
-3.059387, 3.751439, -6.089474,
4.313914, 3.751439, -6.089474,
-3.059387, 3.751439, 5.41852,
4.313914, 3.751439, 5.41852,
4.313914, -3.543097, -6.089474,
4.313914, 3.751439, -6.089474,
4.313914, -3.543097, 5.41852,
4.313914, 3.751439, 5.41852,
4.313914, -3.543097, -6.089474,
4.313914, -3.543097, 5.41852,
4.313914, 3.751439, -6.089474,
4.313914, 3.751439, 5.41852
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
var radius = 8.27256;
var distance = 36.80555;
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
mvMatrix.translate( -0.6272638, -0.1041714, 0.3354766 );
mvMatrix.scale( 1.213087, 1.226185, 0.7772382 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.80555);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
C23H19ClF3NO3<-read.table("C23H19ClF3NO3.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-C23H19ClF3NO3$V2
```

```
## Error in eval(expr, envir, enclos): object 'C23H19ClF3NO3' not found
```

```r
y<-C23H19ClF3NO3$V3
```

```
## Error in eval(expr, envir, enclos): object 'C23H19ClF3NO3' not found
```

```r
z<-C23H19ClF3NO3$V4
```

```
## Error in eval(expr, envir, enclos): object 'C23H19ClF3NO3' not found
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
-2.952009, 1.120568, -1.149111, 0, 0, 1, 1, 1,
-2.866503, -0.08442454, -0.2814145, 1, 0, 0, 1, 1,
-2.80999, -0.994803, -2.553904, 1, 0, 0, 1, 1,
-2.690436, -0.3195547, -3.247769, 1, 0, 0, 1, 1,
-2.627626, -0.6535862, -2.080762, 1, 0, 0, 1, 1,
-2.612123, 0.5731445, -2.804342, 1, 0, 0, 1, 1,
-2.599051, 1.308704, -1.23047, 0, 0, 0, 1, 1,
-2.565269, 0.861785, -0.7755623, 0, 0, 0, 1, 1,
-2.539676, -1.112418, -0.9283463, 0, 0, 0, 1, 1,
-2.472239, 1.514206, -0.01558795, 0, 0, 0, 1, 1,
-2.445593, -1.003905, -0.7658298, 0, 0, 0, 1, 1,
-2.32411, 0.603639, -1.536133, 0, 0, 0, 1, 1,
-2.281389, 0.1549927, 0.6761575, 0, 0, 0, 1, 1,
-2.261772, -0.5117448, -1.396296, 1, 1, 1, 1, 1,
-2.224595, 0.8231792, -2.170143, 1, 1, 1, 1, 1,
-2.177511, 0.7566576, -3.02625, 1, 1, 1, 1, 1,
-2.134077, 0.509295, -1.383625, 1, 1, 1, 1, 1,
-2.133005, 0.5669113, -1.385542, 1, 1, 1, 1, 1,
-2.05956, 1.848919, -1.245348, 1, 1, 1, 1, 1,
-2.049634, -1.318183, -1.188787, 1, 1, 1, 1, 1,
-2.031051, -0.15819, -1.273085, 1, 1, 1, 1, 1,
-1.998764, -0.5414767, -2.072935, 1, 1, 1, 1, 1,
-1.984721, -1.83706, -1.605902, 1, 1, 1, 1, 1,
-1.982192, -0.03917418, -0.7721613, 1, 1, 1, 1, 1,
-1.969184, 0.5109412, -3.558943, 1, 1, 1, 1, 1,
-1.901752, 2.228324, -2.389744, 1, 1, 1, 1, 1,
-1.897553, -0.9266171, -3.282312, 1, 1, 1, 1, 1,
-1.881022, 0.1087608, -0.5869879, 1, 1, 1, 1, 1,
-1.858617, -1.683918, 0.4034766, 0, 0, 1, 1, 1,
-1.841702, 0.2647745, -1.613599, 1, 0, 0, 1, 1,
-1.815736, -1.308122, -1.500124, 1, 0, 0, 1, 1,
-1.81022, -1.252708, -2.467374, 1, 0, 0, 1, 1,
-1.789836, 1.032315, -0.6465809, 1, 0, 0, 1, 1,
-1.772671, 0.2816195, -0.8022632, 1, 0, 0, 1, 1,
-1.769359, 0.4947501, -0.492023, 0, 0, 0, 1, 1,
-1.746793, 0.8229591, -1.453511, 0, 0, 0, 1, 1,
-1.723479, 1.552937, -0.9042481, 0, 0, 0, 1, 1,
-1.720876, -0.03534522, -1.464206, 0, 0, 0, 1, 1,
-1.718915, -0.6210394, -1.80883, 0, 0, 0, 1, 1,
-1.693807, 0.931815, -2.476146, 0, 0, 0, 1, 1,
-1.688104, -0.610621, 0.1739596, 0, 0, 0, 1, 1,
-1.639268, 0.0002178069, -0.8363819, 1, 1, 1, 1, 1,
-1.630242, 0.1512066, -1.952082, 1, 1, 1, 1, 1,
-1.628419, 0.3407119, -1.36837, 1, 1, 1, 1, 1,
-1.599766, -0.164758, -2.774063, 1, 1, 1, 1, 1,
-1.593297, 2.08553, -0.1502543, 1, 1, 1, 1, 1,
-1.586695, 1.645159, -1.285268, 1, 1, 1, 1, 1,
-1.581676, 0.7553365, -1.451421, 1, 1, 1, 1, 1,
-1.58162, 0.62191, -2.746491, 1, 1, 1, 1, 1,
-1.573364, 0.4621979, -1.111412, 1, 1, 1, 1, 1,
-1.564301, -1.827948, -3.016883, 1, 1, 1, 1, 1,
-1.554806, 0.6228361, -1.713172, 1, 1, 1, 1, 1,
-1.550798, -3.001306, -2.260581, 1, 1, 1, 1, 1,
-1.520163, 0.1313347, -1.785787, 1, 1, 1, 1, 1,
-1.50404, 0.1003333, -3.37256, 1, 1, 1, 1, 1,
-1.495098, -0.9979529, -1.113835, 1, 1, 1, 1, 1,
-1.494546, 0.3692794, -0.4276524, 0, 0, 1, 1, 1,
-1.474024, -0.8348687, -1.957264, 1, 0, 0, 1, 1,
-1.452714, -0.5727568, -2.865104, 1, 0, 0, 1, 1,
-1.445811, 0.01472867, -3.471265, 1, 0, 0, 1, 1,
-1.43869, -0.8832177, -2.617521, 1, 0, 0, 1, 1,
-1.435924, 0.06043478, -0.8155745, 1, 0, 0, 1, 1,
-1.431859, -0.4603463, -2.329673, 0, 0, 0, 1, 1,
-1.430056, 1.162191, -0.06409471, 0, 0, 0, 1, 1,
-1.413811, -0.7558013, -2.404722, 0, 0, 0, 1, 1,
-1.405802, -0.8779964, -2.747642, 0, 0, 0, 1, 1,
-1.402985, 0.644452, -0.31186, 0, 0, 0, 1, 1,
-1.401798, -1.46958, -3.546714, 0, 0, 0, 1, 1,
-1.400939, -1.426242, -2.670344, 0, 0, 0, 1, 1,
-1.400104, -0.04583986, 0.03157797, 1, 1, 1, 1, 1,
-1.396751, 1.037778, 0.6051369, 1, 1, 1, 1, 1,
-1.390403, -0.7756057, -1.810139, 1, 1, 1, 1, 1,
-1.389694, -0.01761379, -1.854899, 1, 1, 1, 1, 1,
-1.359911, -0.8296822, -4.26654, 1, 1, 1, 1, 1,
-1.357957, 0.9574777, -1.322347, 1, 1, 1, 1, 1,
-1.339212, -1.113612, -1.945759, 1, 1, 1, 1, 1,
-1.336109, -0.5411619, -2.3075, 1, 1, 1, 1, 1,
-1.335891, -1.156796, -1.544801, 1, 1, 1, 1, 1,
-1.333686, 0.1769577, -1.003919, 1, 1, 1, 1, 1,
-1.33176, 0.9679179, -0.4372782, 1, 1, 1, 1, 1,
-1.318714, 0.9397358, -1.412825, 1, 1, 1, 1, 1,
-1.317888, -0.3195715, -0.3410978, 1, 1, 1, 1, 1,
-1.315123, 0.06833261, -1.951135, 1, 1, 1, 1, 1,
-1.312288, 0.6242363, -2.651921, 1, 1, 1, 1, 1,
-1.305351, -0.2284951, -0.2431314, 0, 0, 1, 1, 1,
-1.294147, -0.4248918, -2.681583, 1, 0, 0, 1, 1,
-1.292585, -1.500304, -0.970412, 1, 0, 0, 1, 1,
-1.28181, -0.7409987, -1.414307, 1, 0, 0, 1, 1,
-1.280587, -0.3099594, -3.969484, 1, 0, 0, 1, 1,
-1.268681, -0.4812692, -2.280367, 1, 0, 0, 1, 1,
-1.265503, 0.5978224, -2.630245, 0, 0, 0, 1, 1,
-1.265038, 1.064573, -0.9059249, 0, 0, 0, 1, 1,
-1.264656, -0.4324363, -1.955105, 0, 0, 0, 1, 1,
-1.258339, 0.5361987, -1.837876, 0, 0, 0, 1, 1,
-1.252357, -1.399933, -1.942892, 0, 0, 0, 1, 1,
-1.245048, -1.191289, -3.180679, 0, 0, 0, 1, 1,
-1.229453, 0.1002916, 0.7910355, 0, 0, 0, 1, 1,
-1.22809, 0.3004537, -0.9828607, 1, 1, 1, 1, 1,
-1.227895, -0.8287541, -1.551453, 1, 1, 1, 1, 1,
-1.22668, -0.9575853, -2.758461, 1, 1, 1, 1, 1,
-1.225825, 0.6211186, -0.4307353, 1, 1, 1, 1, 1,
-1.225589, -0.1866381, -2.062607, 1, 1, 1, 1, 1,
-1.220799, -0.7016581, -0.9994052, 1, 1, 1, 1, 1,
-1.214807, -1.465217, -4.001641, 1, 1, 1, 1, 1,
-1.187738, 0.804766, -1.35299, 1, 1, 1, 1, 1,
-1.184623, 0.8855059, -0.1415801, 1, 1, 1, 1, 1,
-1.181774, 0.2198972, -2.289632, 1, 1, 1, 1, 1,
-1.177943, -0.7953457, -0.6037965, 1, 1, 1, 1, 1,
-1.17731, -0.2466486, -0.2637414, 1, 1, 1, 1, 1,
-1.174742, 0.5097929, -1.46957, 1, 1, 1, 1, 1,
-1.167752, 0.6683801, -1.082252, 1, 1, 1, 1, 1,
-1.166381, -1.449479, -1.611856, 1, 1, 1, 1, 1,
-1.162524, -0.1633933, -0.8135056, 0, 0, 1, 1, 1,
-1.161917, -1.079998, -1.363345, 1, 0, 0, 1, 1,
-1.160333, 0.9603645, 0.5445745, 1, 0, 0, 1, 1,
-1.152841, -2.027564, -0.972712, 1, 0, 0, 1, 1,
-1.149717, -0.7889664, -2.880845, 1, 0, 0, 1, 1,
-1.141023, -1.454607, -4.085294, 1, 0, 0, 1, 1,
-1.135908, 0.1977973, -1.260126, 0, 0, 0, 1, 1,
-1.132147, -0.005045844, -0.442693, 0, 0, 0, 1, 1,
-1.130165, 0.2627132, -0.8889691, 0, 0, 0, 1, 1,
-1.129354, -1.002234, -0.9404773, 0, 0, 0, 1, 1,
-1.127, -3.436865, -3.912361, 0, 0, 0, 1, 1,
-1.124021, 0.8732918, -1.234467, 0, 0, 0, 1, 1,
-1.122922, 0.3078753, -1.870273, 0, 0, 0, 1, 1,
-1.116804, 1.406168, -1.905838, 1, 1, 1, 1, 1,
-1.102442, -0.388073, -2.061961, 1, 1, 1, 1, 1,
-1.101281, -1.65407, -2.578669, 1, 1, 1, 1, 1,
-1.101078, 0.6547101, -0.4649117, 1, 1, 1, 1, 1,
-1.090552, 0.4010277, -2.045221, 1, 1, 1, 1, 1,
-1.089742, -0.6025668, -1.337427, 1, 1, 1, 1, 1,
-1.088821, 1.945208, -0.2505289, 1, 1, 1, 1, 1,
-1.084863, 0.1467069, -1.516957, 1, 1, 1, 1, 1,
-1.082854, 3.645208, -0.05237032, 1, 1, 1, 1, 1,
-1.061107, 0.6892533, 0.7981003, 1, 1, 1, 1, 1,
-1.050391, 0.8527672, 0.8383493, 1, 1, 1, 1, 1,
-1.044471, -0.4466062, -2.246428, 1, 1, 1, 1, 1,
-1.023364, -1.298815, -0.904161, 1, 1, 1, 1, 1,
-1.019514, 1.161288, -1.613751, 1, 1, 1, 1, 1,
-1.017739, -0.5303203, -3.667464, 1, 1, 1, 1, 1,
-1.01476, 0.7343906, -0.842828, 0, 0, 1, 1, 1,
-1.010968, -0.5494739, -2.88924, 1, 0, 0, 1, 1,
-1.009625, 0.3387117, -2.034735, 1, 0, 0, 1, 1,
-1.004017, -0.4546717, -2.981739, 1, 0, 0, 1, 1,
-0.9974536, -0.5444158, -2.289816, 1, 0, 0, 1, 1,
-0.9864302, 0.501756, -0.4666984, 1, 0, 0, 1, 1,
-0.9847772, -0.9995223, -2.084507, 0, 0, 0, 1, 1,
-0.9826825, -0.5146394, -4.589647, 0, 0, 0, 1, 1,
-0.982448, -1.013056, -0.5164411, 0, 0, 0, 1, 1,
-0.9817497, 0.6455413, -2.273967, 0, 0, 0, 1, 1,
-0.980666, -0.4041604, -2.914926, 0, 0, 0, 1, 1,
-0.9804117, -0.06007399, -2.680913, 0, 0, 0, 1, 1,
-0.9798371, -0.1122384, -1.630687, 0, 0, 0, 1, 1,
-0.9797712, 1.606065, -0.7645279, 1, 1, 1, 1, 1,
-0.9777743, 0.2148987, -0.6486715, 1, 1, 1, 1, 1,
-0.9687172, 1.18875, -1.082732, 1, 1, 1, 1, 1,
-0.9672356, -1.014812, -1.82856, 1, 1, 1, 1, 1,
-0.9652826, 1.281002, -0.9414461, 1, 1, 1, 1, 1,
-0.9594855, -0.2778865, -1.774388, 1, 1, 1, 1, 1,
-0.9571307, -0.8133956, -1.642498, 1, 1, 1, 1, 1,
-0.9450358, 0.9436929, 0.2038603, 1, 1, 1, 1, 1,
-0.9371113, 0.8350249, -0.2662131, 1, 1, 1, 1, 1,
-0.936831, -0.3859328, -0.6349007, 1, 1, 1, 1, 1,
-0.9341674, -1.09061, -3.404119, 1, 1, 1, 1, 1,
-0.9246383, -0.04468488, -0.3846401, 1, 1, 1, 1, 1,
-0.9159028, 1.290189, -2.308912, 1, 1, 1, 1, 1,
-0.9158593, -0.6596056, -1.680399, 1, 1, 1, 1, 1,
-0.9089631, -2.098194, -2.826634, 1, 1, 1, 1, 1,
-0.9086397, -0.7825913, -3.814356, 0, 0, 1, 1, 1,
-0.8934995, -0.03711891, -2.261967, 1, 0, 0, 1, 1,
-0.8924041, 0.3423658, -2.227865, 1, 0, 0, 1, 1,
-0.8906313, 1.590644, -1.357881, 1, 0, 0, 1, 1,
-0.8832245, -1.102334, -1.429655, 1, 0, 0, 1, 1,
-0.8800686, -0.8654958, -4.168757, 1, 0, 0, 1, 1,
-0.8708478, 0.8808152, -1.870642, 0, 0, 0, 1, 1,
-0.8699992, -0.2072034, -1.678482, 0, 0, 0, 1, 1,
-0.8630767, -0.2015686, 0.1320579, 0, 0, 0, 1, 1,
-0.854708, -1.992036, -3.783211, 0, 0, 0, 1, 1,
-0.8503045, 0.1482597, -1.082085, 0, 0, 0, 1, 1,
-0.8499432, 0.2908158, -0.277988, 0, 0, 0, 1, 1,
-0.8480048, -0.347066, -1.731071, 0, 0, 0, 1, 1,
-0.8477199, 2.004095, -0.4918964, 1, 1, 1, 1, 1,
-0.8425821, 0.4170882, -1.187256, 1, 1, 1, 1, 1,
-0.8418967, -0.5415512, -2.004701, 1, 1, 1, 1, 1,
-0.8410075, -0.1900954, -0.9732983, 1, 1, 1, 1, 1,
-0.8362179, -2.540492, -2.985845, 1, 1, 1, 1, 1,
-0.8323409, 0.4716825, -0.7013963, 1, 1, 1, 1, 1,
-0.8282606, 0.7839321, -0.6814366, 1, 1, 1, 1, 1,
-0.8281913, 1.201247, 0.1151085, 1, 1, 1, 1, 1,
-0.8228364, 1.06537, -0.5632002, 1, 1, 1, 1, 1,
-0.8219369, 0.1527629, -2.127773, 1, 1, 1, 1, 1,
-0.8203695, -0.3131476, -2.998991, 1, 1, 1, 1, 1,
-0.8159656, 0.5052056, -0.3240473, 1, 1, 1, 1, 1,
-0.811561, 0.1000022, 0.5902706, 1, 1, 1, 1, 1,
-0.8031504, 0.4900491, -0.9972331, 1, 1, 1, 1, 1,
-0.8008119, -0.0264318, 0.0493027, 1, 1, 1, 1, 1,
-0.7911921, 1.922688, -1.670365, 0, 0, 1, 1, 1,
-0.7897434, 0.4416035, -2.639953, 1, 0, 0, 1, 1,
-0.7850168, 0.8124413, -0.643767, 1, 0, 0, 1, 1,
-0.7838271, -0.1454171, -2.292939, 1, 0, 0, 1, 1,
-0.7838002, 0.3363384, -1.153001, 1, 0, 0, 1, 1,
-0.7829788, -1.970076, -3.520247, 1, 0, 0, 1, 1,
-0.7784848, 0.6436923, -0.6265551, 0, 0, 0, 1, 1,
-0.7774881, -0.1581307, -0.4335831, 0, 0, 0, 1, 1,
-0.7769641, 0.04180682, -1.555253, 0, 0, 0, 1, 1,
-0.7767643, 1.409697, -1.785991, 0, 0, 0, 1, 1,
-0.775241, 0.6791626, 2.226121, 0, 0, 0, 1, 1,
-0.7725538, 2.002715, -0.4474574, 0, 0, 0, 1, 1,
-0.7683397, -0.05532203, -2.428422, 0, 0, 0, 1, 1,
-0.7667257, 0.01422888, -0.7374907, 1, 1, 1, 1, 1,
-0.7630507, -0.14854, -0.4796012, 1, 1, 1, 1, 1,
-0.7604048, -0.276162, -1.306548, 1, 1, 1, 1, 1,
-0.7579917, 0.9238608, -1.191877, 1, 1, 1, 1, 1,
-0.7503318, 0.4888608, 0.5904266, 1, 1, 1, 1, 1,
-0.7480172, 1.048245, -2.786879, 1, 1, 1, 1, 1,
-0.7477502, -0.1626941, -1.005177, 1, 1, 1, 1, 1,
-0.7450223, 0.522495, -1.366396, 1, 1, 1, 1, 1,
-0.7427529, -1.64834, -2.685022, 1, 1, 1, 1, 1,
-0.7374144, 0.9117334, -0.8555803, 1, 1, 1, 1, 1,
-0.7335266, 0.4656313, -1.414825, 1, 1, 1, 1, 1,
-0.7312607, 2.626606, -0.8473218, 1, 1, 1, 1, 1,
-0.7284648, -0.1841639, -1.746939, 1, 1, 1, 1, 1,
-0.7271812, -0.3664674, -2.087101, 1, 1, 1, 1, 1,
-0.7207523, -0.2081341, -1.048367, 1, 1, 1, 1, 1,
-0.7198185, -0.9483498, -2.204687, 0, 0, 1, 1, 1,
-0.7152851, 0.5318307, -0.4131761, 1, 0, 0, 1, 1,
-0.7148796, 1.649876, -1.211183, 1, 0, 0, 1, 1,
-0.710748, -1.072778, -3.995547, 1, 0, 0, 1, 1,
-0.7046881, 2.071829, -0.1979221, 1, 0, 0, 1, 1,
-0.7039651, -0.5500693, -2.135383, 1, 0, 0, 1, 1,
-0.7026995, 0.493124, -0.03158353, 0, 0, 0, 1, 1,
-0.7016051, 0.5404198, -1.348383, 0, 0, 0, 1, 1,
-0.700105, 0.3167102, -2.131192, 0, 0, 0, 1, 1,
-0.699266, -0.2988828, -2.349427, 0, 0, 0, 1, 1,
-0.6970387, -0.726992, -1.626749, 0, 0, 0, 1, 1,
-0.6872968, 0.375419, -0.00404387, 0, 0, 0, 1, 1,
-0.6867154, -0.4086587, -1.133489, 0, 0, 0, 1, 1,
-0.6763874, 0.7622598, 0.2547152, 1, 1, 1, 1, 1,
-0.6763597, -0.3894561, -4.117512, 1, 1, 1, 1, 1,
-0.6708549, 1.964167, -1.493817, 1, 1, 1, 1, 1,
-0.6613258, -0.4414195, -1.818684, 1, 1, 1, 1, 1,
-0.6606941, 0.2201087, -1.14923, 1, 1, 1, 1, 1,
-0.660233, -0.2973537, -2.456313, 1, 1, 1, 1, 1,
-0.6577978, 1.185423, -0.9676334, 1, 1, 1, 1, 1,
-0.6484226, -0.3294096, -1.100133, 1, 1, 1, 1, 1,
-0.6459262, 0.9547973, -0.187401, 1, 1, 1, 1, 1,
-0.6415354, -0.6749409, -1.764288, 1, 1, 1, 1, 1,
-0.6401277, -0.1782819, -1.352443, 1, 1, 1, 1, 1,
-0.6395983, -0.5215489, -2.418213, 1, 1, 1, 1, 1,
-0.6381672, -0.9791736, -0.8990899, 1, 1, 1, 1, 1,
-0.6334046, -0.7135124, -3.41125, 1, 1, 1, 1, 1,
-0.6327415, -0.0199627, -1.795831, 1, 1, 1, 1, 1,
-0.6256441, -0.1678534, -0.6630158, 0, 0, 1, 1, 1,
-0.6209316, -0.3446121, -2.85123, 1, 0, 0, 1, 1,
-0.618485, 0.1838158, -2.506256, 1, 0, 0, 1, 1,
-0.6154435, 1.69028, -0.01666333, 1, 0, 0, 1, 1,
-0.6139142, 0.8891052, -0.672788, 1, 0, 0, 1, 1,
-0.6127666, 0.6547811, -2.052197, 1, 0, 0, 1, 1,
-0.6111799, 0.08111792, -1.156749, 0, 0, 0, 1, 1,
-0.6108066, -0.03055528, -2.548195, 0, 0, 0, 1, 1,
-0.6091278, 0.3448424, -0.2818694, 0, 0, 0, 1, 1,
-0.6013224, 0.9640189, 1.450145, 0, 0, 0, 1, 1,
-0.6009554, 1.648845, 0.7452049, 0, 0, 0, 1, 1,
-0.600575, -0.7104521, -3.309832, 0, 0, 0, 1, 1,
-0.5976959, 1.423801, -0.8492759, 0, 0, 0, 1, 1,
-0.5929173, -2.367985, -3.254093, 1, 1, 1, 1, 1,
-0.5894241, -1.570181, -3.663643, 1, 1, 1, 1, 1,
-0.5877085, -0.3056113, -1.198405, 1, 1, 1, 1, 1,
-0.5866869, -1.260613, -1.593976, 1, 1, 1, 1, 1,
-0.5852507, 1.208357, -0.8209043, 1, 1, 1, 1, 1,
-0.5820732, 0.06078587, -2.726732, 1, 1, 1, 1, 1,
-0.5804889, 0.6193403, -0.1618813, 1, 1, 1, 1, 1,
-0.5764481, -1.240603, -2.153373, 1, 1, 1, 1, 1,
-0.5642454, 0.7056004, 0.4561585, 1, 1, 1, 1, 1,
-0.558212, -1.388559, -2.383035, 1, 1, 1, 1, 1,
-0.5574241, -0.4626643, -3.313655, 1, 1, 1, 1, 1,
-0.5558568, -1.138645, -1.46485, 1, 1, 1, 1, 1,
-0.5557358, -0.8500518, -3.497836, 1, 1, 1, 1, 1,
-0.5538912, 1.38225, 0.04871436, 1, 1, 1, 1, 1,
-0.5506321, -0.2996163, -2.979649, 1, 1, 1, 1, 1,
-0.5481412, -0.008945143, -2.036392, 0, 0, 1, 1, 1,
-0.5475328, -0.7651213, -1.39931, 1, 0, 0, 1, 1,
-0.545876, 0.8505951, -3.090413, 1, 0, 0, 1, 1,
-0.5457851, -2.665036, -2.481664, 1, 0, 0, 1, 1,
-0.5454203, -0.1490474, -2.29328, 1, 0, 0, 1, 1,
-0.5408444, 0.1764319, -1.097996, 1, 0, 0, 1, 1,
-0.5350635, -0.9096074, -5.921882, 0, 0, 0, 1, 1,
-0.5343506, 0.2820943, -1.155082, 0, 0, 0, 1, 1,
-0.5332893, 0.05272304, -2.85835, 0, 0, 0, 1, 1,
-0.527065, -0.6100071, -3.607637, 0, 0, 0, 1, 1,
-0.5248422, 1.439648, -0.1996217, 0, 0, 0, 1, 1,
-0.5209209, -0.4684367, -2.596432, 0, 0, 0, 1, 1,
-0.5203124, 0.3863167, 0.07569978, 0, 0, 0, 1, 1,
-0.5155613, 0.5503691, -0.1265883, 1, 1, 1, 1, 1,
-0.5132962, 0.7280275, 0.1015706, 1, 1, 1, 1, 1,
-0.5131058, 1.622836, 1.418905, 1, 1, 1, 1, 1,
-0.5127508, 0.6955468, -0.9824257, 1, 1, 1, 1, 1,
-0.5114574, -0.6433132, -1.366988, 1, 1, 1, 1, 1,
-0.5092099, -0.3375932, -2.890773, 1, 1, 1, 1, 1,
-0.508055, -0.1276771, -2.330366, 1, 1, 1, 1, 1,
-0.507824, 0.1904836, -1.014452, 1, 1, 1, 1, 1,
-0.4973031, -0.915482, -2.547617, 1, 1, 1, 1, 1,
-0.4963694, -1.149214, -2.713607, 1, 1, 1, 1, 1,
-0.4955589, -0.3520092, -1.428162, 1, 1, 1, 1, 1,
-0.4840625, 1.483909, -0.4421771, 1, 1, 1, 1, 1,
-0.4769575, -0.6356249, -3.635086, 1, 1, 1, 1, 1,
-0.4764845, 1.346173, 0.2008976, 1, 1, 1, 1, 1,
-0.4753873, 0.7599527, -0.3252113, 1, 1, 1, 1, 1,
-0.4724954, 0.5779709, -0.9423872, 0, 0, 1, 1, 1,
-0.4625116, -0.5358057, -2.314627, 1, 0, 0, 1, 1,
-0.4621083, 0.9116735, 1.138914, 1, 0, 0, 1, 1,
-0.461261, -0.8925592, -2.712786, 1, 0, 0, 1, 1,
-0.4563377, 0.5417702, 0.00999059, 1, 0, 0, 1, 1,
-0.4507677, -0.1220034, -1.840677, 1, 0, 0, 1, 1,
-0.4455739, 1.120015, -0.5249679, 0, 0, 0, 1, 1,
-0.4377208, 0.9990205, -1.92957, 0, 0, 0, 1, 1,
-0.4350294, 0.01107931, -1.567757, 0, 0, 0, 1, 1,
-0.4333546, 0.4297758, -2.131244, 0, 0, 0, 1, 1,
-0.4294477, 1.019823, -1.170191, 0, 0, 0, 1, 1,
-0.4292844, -1.924422, -2.897397, 0, 0, 0, 1, 1,
-0.4285823, -0.5281677, -1.751939, 0, 0, 0, 1, 1,
-0.4277068, -0.3442314, -3.019492, 1, 1, 1, 1, 1,
-0.4219178, 0.6759608, -0.6116408, 1, 1, 1, 1, 1,
-0.4210655, -0.04956171, -1.964823, 1, 1, 1, 1, 1,
-0.4208806, 1.494375, -0.3314121, 1, 1, 1, 1, 1,
-0.4194108, 0.08824878, -1.622924, 1, 1, 1, 1, 1,
-0.4163806, 0.4168133, -2.331508, 1, 1, 1, 1, 1,
-0.4137447, 0.2366296, -1.919216, 1, 1, 1, 1, 1,
-0.4135663, -0.2067618, -2.766305, 1, 1, 1, 1, 1,
-0.4107463, 0.7877524, 0.105047, 1, 1, 1, 1, 1,
-0.409794, 1.212315, -0.6928889, 1, 1, 1, 1, 1,
-0.4067346, -0.5781857, -0.9866384, 1, 1, 1, 1, 1,
-0.403899, 2.727584, -0.5376807, 1, 1, 1, 1, 1,
-0.3987312, 2.510021, -0.1772981, 1, 1, 1, 1, 1,
-0.3974561, -0.2038774, -2.675722, 1, 1, 1, 1, 1,
-0.3956551, 0.1058703, 0.1280899, 1, 1, 1, 1, 1,
-0.3922175, 0.0783002, -1.260219, 0, 0, 1, 1, 1,
-0.3889782, 1.215645, -1.084371, 1, 0, 0, 1, 1,
-0.3840938, 0.9693916, -0.9235182, 1, 0, 0, 1, 1,
-0.3823254, -0.6480041, -3.836523, 1, 0, 0, 1, 1,
-0.3773226, 1.003542, -0.1460409, 1, 0, 0, 1, 1,
-0.3771965, -0.1031346, -0.942752, 1, 0, 0, 1, 1,
-0.3758605, 1.761117, -0.3384686, 0, 0, 0, 1, 1,
-0.3755748, -0.5673348, -2.080347, 0, 0, 0, 1, 1,
-0.3740736, -0.4166552, -1.727213, 0, 0, 0, 1, 1,
-0.3727255, 0.1714534, -2.726219, 0, 0, 0, 1, 1,
-0.3720216, -1.060908, -2.959589, 0, 0, 0, 1, 1,
-0.367078, 1.483651, 1.104652, 0, 0, 0, 1, 1,
-0.3638265, 1.586899, -0.04048886, 0, 0, 0, 1, 1,
-0.3637599, 0.3980935, -2.593402, 1, 1, 1, 1, 1,
-0.3598054, 0.1378095, -1.832214, 1, 1, 1, 1, 1,
-0.3582157, -0.1202296, -1.939319, 1, 1, 1, 1, 1,
-0.3563311, -0.4666419, -3.93785, 1, 1, 1, 1, 1,
-0.3544962, -0.6558946, -1.837343, 1, 1, 1, 1, 1,
-0.3528619, -0.9706649, -1.960784, 1, 1, 1, 1, 1,
-0.3514093, -1.185121, -2.344434, 1, 1, 1, 1, 1,
-0.3505224, 1.700644, -1.902914, 1, 1, 1, 1, 1,
-0.3423548, -0.05682889, -4.44915, 1, 1, 1, 1, 1,
-0.3413942, -1.311434, -3.050521, 1, 1, 1, 1, 1,
-0.3406801, -0.0566377, -1.471628, 1, 1, 1, 1, 1,
-0.3335262, -1.25366, -3.303007, 1, 1, 1, 1, 1,
-0.3316248, 0.4429675, 0.4788009, 1, 1, 1, 1, 1,
-0.3297985, 1.667907, 1.256652, 1, 1, 1, 1, 1,
-0.3280348, -0.6151932, -1.664496, 1, 1, 1, 1, 1,
-0.3195873, 1.031592, -0.3569134, 0, 0, 1, 1, 1,
-0.3163125, -0.7650014, -2.852662, 1, 0, 0, 1, 1,
-0.3091957, 1.04404, -0.2010213, 1, 0, 0, 1, 1,
-0.3076263, -0.2228191, -1.012516, 1, 0, 0, 1, 1,
-0.3054269, -0.1373424, -3.431263, 1, 0, 0, 1, 1,
-0.3034127, 1.117835, -0.9869282, 1, 0, 0, 1, 1,
-0.3023479, 0.4419724, 0.2188086, 0, 0, 0, 1, 1,
-0.3004782, 0.9238873, -1.632258, 0, 0, 0, 1, 1,
-0.2965407, 1.100165, -1.303399, 0, 0, 0, 1, 1,
-0.2936929, -0.3560239, -0.3284788, 0, 0, 0, 1, 1,
-0.2933549, -0.2699415, -2.907289, 0, 0, 0, 1, 1,
-0.2910238, -0.4054874, -2.643507, 0, 0, 0, 1, 1,
-0.2854344, -0.7600996, -1.802692, 0, 0, 0, 1, 1,
-0.2819288, -1.541329, -4.520679, 1, 1, 1, 1, 1,
-0.2811615, -0.5543174, -1.890972, 1, 1, 1, 1, 1,
-0.2796873, 0.1966285, 0.2970384, 1, 1, 1, 1, 1,
-0.277196, -0.349294, -3.070575, 1, 1, 1, 1, 1,
-0.2768323, 1.425949, -0.305882, 1, 1, 1, 1, 1,
-0.276558, 0.3987421, -0.09136362, 1, 1, 1, 1, 1,
-0.2716082, 1.207869, -0.5406931, 1, 1, 1, 1, 1,
-0.2712988, -0.8671798, -2.916757, 1, 1, 1, 1, 1,
-0.2645684, 0.7258415, 0.8377476, 1, 1, 1, 1, 1,
-0.2629701, -0.6278774, -4.752909, 1, 1, 1, 1, 1,
-0.2587207, 1.737717, 0.6177759, 1, 1, 1, 1, 1,
-0.2569113, -0.2651369, -1.939374, 1, 1, 1, 1, 1,
-0.2549587, 0.1878035, -1.434937, 1, 1, 1, 1, 1,
-0.2535321, 1.037925, -2.576476, 1, 1, 1, 1, 1,
-0.25254, -0.1014368, -1.170519, 1, 1, 1, 1, 1,
-0.2516975, -0.4594462, -3.476231, 0, 0, 1, 1, 1,
-0.2436357, -0.5938073, -1.572331, 1, 0, 0, 1, 1,
-0.2386322, 2.207654, 0.4373455, 1, 0, 0, 1, 1,
-0.2384828, 0.2257999, 0.321918, 1, 0, 0, 1, 1,
-0.237834, -0.7168407, -1.512953, 1, 0, 0, 1, 1,
-0.2309812, 0.6245322, -0.5178209, 1, 0, 0, 1, 1,
-0.2289477, -1.807483, -4.099659, 0, 0, 0, 1, 1,
-0.2287754, 0.8873229, -1.672957, 0, 0, 0, 1, 1,
-0.2233339, 0.7822758, -0.5419689, 0, 0, 0, 1, 1,
-0.2168452, -1.824987, -4.055471, 0, 0, 0, 1, 1,
-0.2142584, -1.057745, -4.464221, 0, 0, 0, 1, 1,
-0.2134383, 0.6869, -0.4536647, 0, 0, 0, 1, 1,
-0.2131342, 1.007359, 0.2772872, 0, 0, 0, 1, 1,
-0.1992562, 0.3782028, -0.6914293, 1, 1, 1, 1, 1,
-0.1973531, -1.902066, -2.438971, 1, 1, 1, 1, 1,
-0.195784, 2.582878, -0.3455621, 1, 1, 1, 1, 1,
-0.1943429, 2.905577, 0.6649499, 1, 1, 1, 1, 1,
-0.1940127, 1.168038, 0.08838122, 1, 1, 1, 1, 1,
-0.1938914, 0.7926908, 0.8569379, 1, 1, 1, 1, 1,
-0.193538, 0.3908983, -1.373645, 1, 1, 1, 1, 1,
-0.1893907, 2.209289, 0.004198983, 1, 1, 1, 1, 1,
-0.1812833, -0.1104636, -1.314918, 1, 1, 1, 1, 1,
-0.173561, 0.5531348, 0.8216119, 1, 1, 1, 1, 1,
-0.1708591, -1.059084, -3.890682, 1, 1, 1, 1, 1,
-0.1680638, -0.8999625, -2.683789, 1, 1, 1, 1, 1,
-0.1677236, -0.4941781, -2.399795, 1, 1, 1, 1, 1,
-0.1657107, -2.589544, -4.348036, 1, 1, 1, 1, 1,
-0.1625501, -0.4018353, -3.906712, 1, 1, 1, 1, 1,
-0.1595064, -1.585678, -0.3716776, 0, 0, 1, 1, 1,
-0.1581869, -0.2664013, -2.273173, 1, 0, 0, 1, 1,
-0.1581734, 0.4641982, 0.591127, 1, 0, 0, 1, 1,
-0.1576696, -0.8951852, -4.575195, 1, 0, 0, 1, 1,
-0.1543342, 0.9416588, 0.5172246, 1, 0, 0, 1, 1,
-0.1539998, 1.164335, -0.4569999, 1, 0, 0, 1, 1,
-0.1515749, -0.6278097, -2.414621, 0, 0, 0, 1, 1,
-0.1495042, 0.3062595, -0.7320898, 0, 0, 0, 1, 1,
-0.145746, 1.590317, 1.43398, 0, 0, 0, 1, 1,
-0.1446589, 0.2824889, -0.3252282, 0, 0, 0, 1, 1,
-0.1425358, 0.737349, -1.240435, 0, 0, 0, 1, 1,
-0.139255, -0.6851442, -3.357704, 0, 0, 0, 1, 1,
-0.1391154, 0.6954227, -1.543966, 0, 0, 0, 1, 1,
-0.1343141, -0.8301511, -2.992399, 1, 1, 1, 1, 1,
-0.1341408, -0.1712475, -1.481339, 1, 1, 1, 1, 1,
-0.1281462, 0.491833, 0.06345591, 1, 1, 1, 1, 1,
-0.1272624, -0.9740694, -2.022512, 1, 1, 1, 1, 1,
-0.1210514, 2.416418, -0.5027904, 1, 1, 1, 1, 1,
-0.1179247, 1.906888, -0.09211623, 1, 1, 1, 1, 1,
-0.1138243, 0.3788227, 0.2184074, 1, 1, 1, 1, 1,
-0.1116323, 0.3649921, -0.9802352, 1, 1, 1, 1, 1,
-0.1089899, 0.4527251, 0.1972569, 1, 1, 1, 1, 1,
-0.1045334, -1.623829, -3.728565, 1, 1, 1, 1, 1,
-0.09960239, 0.954947, 0.1844724, 1, 1, 1, 1, 1,
-0.09737816, 0.1397007, -0.7547312, 1, 1, 1, 1, 1,
-0.09468059, -2.18996, -3.071954, 1, 1, 1, 1, 1,
-0.09439728, 0.4555485, 0.2843863, 1, 1, 1, 1, 1,
-0.08827487, -0.9567544, -3.623024, 1, 1, 1, 1, 1,
-0.08619162, -1.327454, -3.698791, 0, 0, 1, 1, 1,
-0.08481805, 2.643248, 0.436911, 1, 0, 0, 1, 1,
-0.08350889, 0.5698377, -0.3071679, 1, 0, 0, 1, 1,
-0.08051862, -0.9208781, -4.042924, 1, 0, 0, 1, 1,
-0.07925727, -1.613838, -2.552049, 1, 0, 0, 1, 1,
-0.07781792, 1.104011, 0.3492028, 1, 0, 0, 1, 1,
-0.07574546, 0.3407401, -0.02771897, 0, 0, 0, 1, 1,
-0.07222982, 2.9189, -0.7263782, 0, 0, 0, 1, 1,
-0.06612893, 1.389023, -1.021456, 0, 0, 0, 1, 1,
-0.05834281, -0.005829687, -0.9032896, 0, 0, 0, 1, 1,
-0.05646087, 1.106185, -0.1108255, 0, 0, 0, 1, 1,
-0.05128298, 0.8211647, -0.2954749, 0, 0, 0, 1, 1,
-0.049226, 0.2415552, 0.7931134, 0, 0, 0, 1, 1,
-0.04655414, -1.204389, -1.737125, 1, 1, 1, 1, 1,
-0.04453125, -0.5274013, -2.356612, 1, 1, 1, 1, 1,
-0.04295907, -1.12997, -4.398313, 1, 1, 1, 1, 1,
-0.04275826, 1.59464, -0.2047295, 1, 1, 1, 1, 1,
-0.04231732, -0.1063935, -3.783276, 1, 1, 1, 1, 1,
-0.04229721, -1.127833, -2.62839, 1, 1, 1, 1, 1,
-0.03835227, 0.5116993, 1.035856, 1, 1, 1, 1, 1,
-0.03795736, -0.413512, -1.760797, 1, 1, 1, 1, 1,
-0.03723339, -1.501913, -2.450939, 1, 1, 1, 1, 1,
-0.03522647, -0.4070487, -2.868515, 1, 1, 1, 1, 1,
-0.03426251, 0.7424251, -0.6005767, 1, 1, 1, 1, 1,
-0.03350373, -0.2091138, -3.78545, 1, 1, 1, 1, 1,
-0.0321013, -1.275958, -1.808542, 1, 1, 1, 1, 1,
-0.03105601, -0.914102, -3.45651, 1, 1, 1, 1, 1,
-0.02925282, 0.7346407, -0.7658501, 1, 1, 1, 1, 1,
-0.02549551, -0.979984, -1.717631, 0, 0, 1, 1, 1,
-0.02434589, -0.9774379, -2.889095, 1, 0, 0, 1, 1,
-0.01961053, 0.04632926, 0.2092596, 1, 0, 0, 1, 1,
-0.01777549, 0.06509069, 0.70279, 1, 0, 0, 1, 1,
-0.01683438, 1.287795, 1.145794, 1, 0, 0, 1, 1,
-0.01552758, 0.8697052, 1.166041, 1, 0, 0, 1, 1,
-0.008899442, -0.7851747, -2.004617, 0, 0, 0, 1, 1,
-0.00746851, -1.591081, -4.352438, 0, 0, 0, 1, 1,
-0.006636968, -0.845003, -5.126149, 0, 0, 0, 1, 1,
-0.005041088, 0.3667116, -0.219748, 0, 0, 0, 1, 1,
-0.003889645, -0.4436754, -4.35182, 0, 0, 0, 1, 1,
-0.0005827873, -1.873327, -3.311277, 0, 0, 0, 1, 1,
0.001174522, 0.1516518, -1.288665, 0, 0, 0, 1, 1,
0.001510282, 1.145096, 0.2352581, 1, 1, 1, 1, 1,
0.002939636, -1.318949, 2.955176, 1, 1, 1, 1, 1,
0.004406829, 0.2179603, 0.1150271, 1, 1, 1, 1, 1,
0.007995382, -0.3821374, 3.376498, 1, 1, 1, 1, 1,
0.008009364, 1.152475, 1.246718, 1, 1, 1, 1, 1,
0.008483016, 0.153776, 1.261545, 1, 1, 1, 1, 1,
0.01466929, -0.414185, 3.759884, 1, 1, 1, 1, 1,
0.01498422, -0.6890941, 1.007049, 1, 1, 1, 1, 1,
0.02081376, -1.377126, 2.009347, 1, 1, 1, 1, 1,
0.03938313, -0.01934797, 0.9559486, 1, 1, 1, 1, 1,
0.04065951, 0.5556122, 1.248177, 1, 1, 1, 1, 1,
0.04116332, -0.982331, 3.492498, 1, 1, 1, 1, 1,
0.04645491, 0.3951534, 0.7957647, 1, 1, 1, 1, 1,
0.04693578, -1.467478, 1.984286, 1, 1, 1, 1, 1,
0.05050103, 0.4434938, 1.044394, 1, 1, 1, 1, 1,
0.05334883, 0.9228547, -0.08687638, 0, 0, 1, 1, 1,
0.06028905, 0.05165582, 1.045967, 1, 0, 0, 1, 1,
0.06189856, -0.5320007, 2.985039, 1, 0, 0, 1, 1,
0.06341587, -0.4889124, 2.196612, 1, 0, 0, 1, 1,
0.06365349, 0.260565, -0.4824426, 1, 0, 0, 1, 1,
0.06391606, 2.197709, -1.122471, 1, 0, 0, 1, 1,
0.06732082, -1.897671, 5.182526, 0, 0, 0, 1, 1,
0.06901183, -1.156153, 3.576925, 0, 0, 0, 1, 1,
0.06910023, -0.9710394, 2.203672, 0, 0, 0, 1, 1,
0.07050989, 1.58408, -0.6163355, 0, 0, 0, 1, 1,
0.07269146, -0.9562596, 3.704192, 0, 0, 0, 1, 1,
0.07558209, -0.9156905, 2.41686, 0, 0, 0, 1, 1,
0.08231653, -0.4895233, 3.541642, 0, 0, 0, 1, 1,
0.08322358, 0.1133005, 0.1754229, 1, 1, 1, 1, 1,
0.08654939, 2.149648, -0.0476667, 1, 1, 1, 1, 1,
0.08950585, 0.8053747, 0.4167351, 1, 1, 1, 1, 1,
0.09021995, -0.3389248, 2.93082, 1, 1, 1, 1, 1,
0.0919933, -0.5104463, 4.908495, 1, 1, 1, 1, 1,
0.09271501, -0.4370192, 3.468584, 1, 1, 1, 1, 1,
0.09374752, 0.7636459, 1.469562, 1, 1, 1, 1, 1,
0.09382606, -0.1738134, 2.715937, 1, 1, 1, 1, 1,
0.09404877, -0.1234418, 0.9309716, 1, 1, 1, 1, 1,
0.09575567, -1.005435, 2.733944, 1, 1, 1, 1, 1,
0.09708574, 0.3655888, 1.206687, 1, 1, 1, 1, 1,
0.09999167, 1.389635, 0.497199, 1, 1, 1, 1, 1,
0.1108856, 0.1000753, 1.098047, 1, 1, 1, 1, 1,
0.1113872, -0.5428215, 3.150841, 1, 1, 1, 1, 1,
0.1226308, -0.08537394, 3.032501, 1, 1, 1, 1, 1,
0.1228067, 1.116995, -0.006539715, 0, 0, 1, 1, 1,
0.1236263, -1.161699, 3.462601, 1, 0, 0, 1, 1,
0.1300786, -1.00019, 4.082413, 1, 0, 0, 1, 1,
0.1315513, -0.7095172, 2.221947, 1, 0, 0, 1, 1,
0.1321793, -1.239835, 2.764558, 1, 0, 0, 1, 1,
0.1390892, 0.3876607, 1.242161, 1, 0, 0, 1, 1,
0.1397324, 0.2077025, 0.6616586, 0, 0, 0, 1, 1,
0.1414415, -0.5628935, 1.811335, 0, 0, 0, 1, 1,
0.1424446, -1.217869, 2.216579, 0, 0, 0, 1, 1,
0.1427722, -0.8552685, 2.428567, 0, 0, 0, 1, 1,
0.1500783, -2.837839, 4.579998, 0, 0, 0, 1, 1,
0.1512478, 1.514429, -1.182736, 0, 0, 0, 1, 1,
0.1521222, -1.579317, 3.882475, 0, 0, 0, 1, 1,
0.1601925, -0.5930667, 0.6557199, 1, 1, 1, 1, 1,
0.1606317, -0.8948679, 2.664768, 1, 1, 1, 1, 1,
0.1625754, 0.3776325, 0.6045859, 1, 1, 1, 1, 1,
0.1653564, 0.4180576, 0.1346337, 1, 1, 1, 1, 1,
0.1656617, -0.1203779, 2.955477, 1, 1, 1, 1, 1,
0.1689293, 1.186452, -1.808008, 1, 1, 1, 1, 1,
0.1716222, -0.9275303, 3.881167, 1, 1, 1, 1, 1,
0.172929, 0.1973841, 0.6888288, 1, 1, 1, 1, 1,
0.1784378, 1.609285, 0.8733983, 1, 1, 1, 1, 1,
0.1809175, -0.9348035, 2.665043, 1, 1, 1, 1, 1,
0.1816196, 0.8149051, 0.3970219, 1, 1, 1, 1, 1,
0.1841519, -1.520082, 4.721069, 1, 1, 1, 1, 1,
0.1851562, -0.8816961, 3.294207, 1, 1, 1, 1, 1,
0.186121, 0.2938373, 1.438441, 1, 1, 1, 1, 1,
0.1869669, 0.2194449, 0.9409716, 1, 1, 1, 1, 1,
0.1897147, -0.1452254, 1.687555, 0, 0, 1, 1, 1,
0.1925343, -0.3538817, 2.949029, 1, 0, 0, 1, 1,
0.1931593, -1.666944, 2.954064, 1, 0, 0, 1, 1,
0.1956944, 1.580325, 0.6175873, 1, 0, 0, 1, 1,
0.1998561, -0.1693426, 2.622823, 1, 0, 0, 1, 1,
0.2085995, -1.300446, 5.250928, 1, 0, 0, 1, 1,
0.2098644, 0.6800641, 0.657508, 0, 0, 0, 1, 1,
0.2107737, 0.8216041, 0.6637015, 0, 0, 0, 1, 1,
0.2129981, -0.05779208, 2.440939, 0, 0, 0, 1, 1,
0.2148524, -0.4200681, 3.610924, 0, 0, 0, 1, 1,
0.2169523, 0.222028, -0.01160335, 0, 0, 0, 1, 1,
0.2175021, 1.02961, -0.2861089, 0, 0, 0, 1, 1,
0.2202535, -0.294416, 3.791984, 0, 0, 0, 1, 1,
0.2207666, 0.1554564, 1.144547, 1, 1, 1, 1, 1,
0.2272644, 2.409158, 0.4373547, 1, 1, 1, 1, 1,
0.2312164, -0.6683781, 1.297444, 1, 1, 1, 1, 1,
0.2312553, 0.1145011, 1.412906, 1, 1, 1, 1, 1,
0.2379751, 0.5816575, -1.538288, 1, 1, 1, 1, 1,
0.2388626, 0.3005346, 1.8547, 1, 1, 1, 1, 1,
0.2430564, 0.1212876, 0.745686, 1, 1, 1, 1, 1,
0.2447283, 0.5932669, -0.8021299, 1, 1, 1, 1, 1,
0.2465354, -0.6914578, 2.548506, 1, 1, 1, 1, 1,
0.2473277, -0.07703039, 2.202874, 1, 1, 1, 1, 1,
0.2482658, -0.400447, 1.92552, 1, 1, 1, 1, 1,
0.2524521, 0.2036134, 0.7452503, 1, 1, 1, 1, 1,
0.2554726, 0.4552606, -0.6233174, 1, 1, 1, 1, 1,
0.2583542, -0.4312092, 0.9297804, 1, 1, 1, 1, 1,
0.2584078, -0.3365968, 1.944257, 1, 1, 1, 1, 1,
0.2608992, -1.461305, 3.716835, 0, 0, 1, 1, 1,
0.2624961, -1.647444, 5.043869, 1, 0, 0, 1, 1,
0.27163, -0.5257155, 1.795496, 1, 0, 0, 1, 1,
0.2728614, -1.330986, 2.987285, 1, 0, 0, 1, 1,
0.2829791, -1.128565, 2.194402, 1, 0, 0, 1, 1,
0.2858278, 0.488929, -0.626601, 1, 0, 0, 1, 1,
0.2911643, 0.8901945, -0.04188338, 0, 0, 0, 1, 1,
0.2980509, 2.358532, -1.168125, 0, 0, 0, 1, 1,
0.2993702, 1.470212, -0.219726, 0, 0, 0, 1, 1,
0.2999226, 1.856977, -1.22377, 0, 0, 0, 1, 1,
0.3006785, 0.02973885, 1.061005, 0, 0, 0, 1, 1,
0.3021353, 1.055726, 0.11985, 0, 0, 0, 1, 1,
0.3052007, 0.6685299, 0.9675172, 0, 0, 0, 1, 1,
0.3067897, 1.238467, 0.5117996, 1, 1, 1, 1, 1,
0.315173, -1.290033, 3.205493, 1, 1, 1, 1, 1,
0.3156295, 1.635581, -0.4060994, 1, 1, 1, 1, 1,
0.3163769, -0.066421, 1.334376, 1, 1, 1, 1, 1,
0.3180753, -0.06461318, 1.394172, 1, 1, 1, 1, 1,
0.3202147, 1.93581, 0.3923078, 1, 1, 1, 1, 1,
0.3227946, 1.38295, -1.348266, 1, 1, 1, 1, 1,
0.3237399, 0.2392912, 0.5409746, 1, 1, 1, 1, 1,
0.3255167, -0.6159464, 3.642091, 1, 1, 1, 1, 1,
0.3261867, -0.5027855, 1.285537, 1, 1, 1, 1, 1,
0.3266504, -0.3019661, 2.730019, 1, 1, 1, 1, 1,
0.3304575, -0.8138769, 1.068115, 1, 1, 1, 1, 1,
0.3333862, -0.9162146, 2.823026, 1, 1, 1, 1, 1,
0.3389242, -1.912766, 3.811309, 1, 1, 1, 1, 1,
0.3413911, -1.429248, 3.555317, 1, 1, 1, 1, 1,
0.3456608, -0.246645, 1.737825, 0, 0, 1, 1, 1,
0.3460102, -0.6550482, 3.132684, 1, 0, 0, 1, 1,
0.3497578, 1.682483, 1.263831, 1, 0, 0, 1, 1,
0.3500023, -0.696391, 1.697416, 1, 0, 0, 1, 1,
0.3502744, -2.091383, 4.828977, 1, 0, 0, 1, 1,
0.3531273, -1.418149, 2.345257, 1, 0, 0, 1, 1,
0.3551718, 0.2697207, 0.8004079, 0, 0, 0, 1, 1,
0.3603793, -0.5803891, -0.3105086, 0, 0, 0, 1, 1,
0.3613684, -0.5809889, 2.243638, 0, 0, 0, 1, 1,
0.3614191, -0.5962796, 2.927207, 0, 0, 0, 1, 1,
0.3614415, 1.147466, 0.3431926, 0, 0, 0, 1, 1,
0.3706538, 1.477088, -0.5534423, 0, 0, 0, 1, 1,
0.3708498, -0.7967834, 2.970365, 0, 0, 0, 1, 1,
0.3721964, 0.08620137, 0.3586016, 1, 1, 1, 1, 1,
0.3726112, 1.097357, 0.5919888, 1, 1, 1, 1, 1,
0.3784504, -0.7013749, 1.303476, 1, 1, 1, 1, 1,
0.3823402, 0.7136905, 1.262618, 1, 1, 1, 1, 1,
0.3828161, 0.780659, 1.741884, 1, 1, 1, 1, 1,
0.3852978, -0.1516802, 3.008245, 1, 1, 1, 1, 1,
0.386463, -0.746869, 2.963274, 1, 1, 1, 1, 1,
0.3872435, 0.5763168, 0.2765367, 1, 1, 1, 1, 1,
0.3882371, 0.8634218, -0.8177679, 1, 1, 1, 1, 1,
0.3902931, -0.8386701, 3.243166, 1, 1, 1, 1, 1,
0.397086, -0.387902, 1.635142, 1, 1, 1, 1, 1,
0.3974321, -0.342142, 1.505577, 1, 1, 1, 1, 1,
0.3990597, 0.9043382, 1.141151, 1, 1, 1, 1, 1,
0.3997688, -0.363621, 3.999379, 1, 1, 1, 1, 1,
0.4037493, -0.6769049, 2.057058, 1, 1, 1, 1, 1,
0.4051192, -0.2293605, 1.591595, 0, 0, 1, 1, 1,
0.4098757, 0.414256, 1.219113, 1, 0, 0, 1, 1,
0.4109138, -0.2672596, 2.190818, 1, 0, 0, 1, 1,
0.4150411, -1.35446, 3.185673, 1, 0, 0, 1, 1,
0.4189453, 0.2567889, -1.570836, 1, 0, 0, 1, 1,
0.4191448, -1.179983, 3.676629, 1, 0, 0, 1, 1,
0.419784, 0.2518218, -0.3211121, 0, 0, 0, 1, 1,
0.4251312, -0.7573643, 3.200335, 0, 0, 0, 1, 1,
0.4320786, 0.3614083, 1.16234, 0, 0, 0, 1, 1,
0.4338925, -1.391636, 3.474563, 0, 0, 0, 1, 1,
0.440521, 1.991174, 1.000408, 0, 0, 0, 1, 1,
0.4429371, -1.037546, 2.623839, 0, 0, 0, 1, 1,
0.444336, 0.873795, 0.3923675, 0, 0, 0, 1, 1,
0.4478187, 0.08237424, 0.6434323, 1, 1, 1, 1, 1,
0.4481277, -1.04632, 2.02941, 1, 1, 1, 1, 1,
0.4498553, 0.6440097, 2.098186, 1, 1, 1, 1, 1,
0.4500543, -1.236598, 2.998671, 1, 1, 1, 1, 1,
0.4511756, 0.6329242, 1.955372, 1, 1, 1, 1, 1,
0.4600897, -1.897445, 2.310534, 1, 1, 1, 1, 1,
0.4601538, -0.2484604, 0.9552748, 1, 1, 1, 1, 1,
0.4658039, 0.8115048, 0.1394234, 1, 1, 1, 1, 1,
0.4665632, 0.2318819, 0.4758191, 1, 1, 1, 1, 1,
0.4745004, 0.8190114, -0.09437723, 1, 1, 1, 1, 1,
0.4755961, -1.563843, 2.626723, 1, 1, 1, 1, 1,
0.4804802, -0.524839, 3.762363, 1, 1, 1, 1, 1,
0.4824283, 0.5951337, 0.8937327, 1, 1, 1, 1, 1,
0.4850218, -0.1635255, 3.345274, 1, 1, 1, 1, 1,
0.4955171, -0.2717528, 2.453688, 1, 1, 1, 1, 1,
0.4968788, -0.3405657, 2.983966, 0, 0, 1, 1, 1,
0.4975098, 0.4840567, 2.118992, 1, 0, 0, 1, 1,
0.4986005, -1.442758, 3.690386, 1, 0, 0, 1, 1,
0.504305, -1.478293, 3.890234, 1, 0, 0, 1, 1,
0.5055058, -0.6008947, 3.371547, 1, 0, 0, 1, 1,
0.5060536, 0.179379, 1.578333, 1, 0, 0, 1, 1,
0.5072296, 0.1453121, 0.1119126, 0, 0, 0, 1, 1,
0.5073482, 1.175509, 1.255832, 0, 0, 0, 1, 1,
0.5100358, 0.5540238, 1.262861, 0, 0, 0, 1, 1,
0.5129559, 0.4858362, 1.181303, 0, 0, 0, 1, 1,
0.5133218, 0.9444482, -0.04655446, 0, 0, 0, 1, 1,
0.515851, -0.02735832, 0.9551479, 0, 0, 0, 1, 1,
0.5163019, 0.7527242, 1.907808, 0, 0, 0, 1, 1,
0.5188569, 1.298626, 0.7032881, 1, 1, 1, 1, 1,
0.5213317, -0.7903058, 2.370599, 1, 1, 1, 1, 1,
0.5222864, 2.031814, -0.03458519, 1, 1, 1, 1, 1,
0.5284075, -0.9106579, 2.739445, 1, 1, 1, 1, 1,
0.533052, 1.106258, -0.2479565, 1, 1, 1, 1, 1,
0.5361395, -3.106047, 3.801349, 1, 1, 1, 1, 1,
0.5385939, 0.2453326, -0.5347741, 1, 1, 1, 1, 1,
0.5430997, -0.4711307, 3.024416, 1, 1, 1, 1, 1,
0.5461236, -1.111902, 1.445105, 1, 1, 1, 1, 1,
0.5464408, 1.606149, 0.8971269, 1, 1, 1, 1, 1,
0.5520149, -0.5832112, 3.503544, 1, 1, 1, 1, 1,
0.5535046, 0.4333082, 0.977053, 1, 1, 1, 1, 1,
0.5544943, 0.8252264, 0.2954687, 1, 1, 1, 1, 1,
0.5617757, 0.5371842, 0.7979776, 1, 1, 1, 1, 1,
0.5618965, 1.127296, -0.8670141, 1, 1, 1, 1, 1,
0.5627091, 0.3316689, 0.5166321, 0, 0, 1, 1, 1,
0.5640054, -0.7306914, 2.564429, 1, 0, 0, 1, 1,
0.5641834, 2.071599, -0.2287881, 1, 0, 0, 1, 1,
0.5651324, 0.6199314, 0.4189253, 1, 0, 0, 1, 1,
0.5668216, 0.6732379, 1.807065, 1, 0, 0, 1, 1,
0.569313, -0.2439982, 3.041774, 1, 0, 0, 1, 1,
0.5720671, 1.607994, -0.6299549, 0, 0, 0, 1, 1,
0.5751749, -0.9183816, 1.437614, 0, 0, 0, 1, 1,
0.584398, -0.1894236, 1.243905, 0, 0, 0, 1, 1,
0.5846224, 0.7770557, 0.3995269, 0, 0, 0, 1, 1,
0.5878513, -1.103336, 3.35655, 0, 0, 0, 1, 1,
0.5898909, 0.2089505, 1.61324, 0, 0, 0, 1, 1,
0.5949641, -1.480329, 2.829514, 0, 0, 0, 1, 1,
0.5972915, -0.3529861, 1.485563, 1, 1, 1, 1, 1,
0.5973422, -0.518036, 3.532856, 1, 1, 1, 1, 1,
0.599033, 0.3915895, 0.8576708, 1, 1, 1, 1, 1,
0.6080947, 0.06066836, 2.794414, 1, 1, 1, 1, 1,
0.6140917, -0.9710877, 2.645259, 1, 1, 1, 1, 1,
0.617544, -1.466839, 1.903973, 1, 1, 1, 1, 1,
0.6216853, -0.0464759, 0.3627794, 1, 1, 1, 1, 1,
0.6242288, 0.09208886, 2.484423, 1, 1, 1, 1, 1,
0.6274825, 0.505658, -1.260777, 1, 1, 1, 1, 1,
0.6277999, 1.585834, -0.3285914, 1, 1, 1, 1, 1,
0.6283315, 0.00922173, 1.112088, 1, 1, 1, 1, 1,
0.62845, -0.2758624, 3.715012, 1, 1, 1, 1, 1,
0.6286094, -0.5185104, 1.092182, 1, 1, 1, 1, 1,
0.6290415, 1.608971, 0.8446013, 1, 1, 1, 1, 1,
0.6346328, 0.2264538, 1.669573, 1, 1, 1, 1, 1,
0.6404275, -1.80817, 2.353284, 0, 0, 1, 1, 1,
0.6413271, 0.4116911, 1.424506, 1, 0, 0, 1, 1,
0.6419647, 0.8051387, 0.9469786, 1, 0, 0, 1, 1,
0.6423534, 0.3312117, 0.7192001, 1, 0, 0, 1, 1,
0.6434868, 0.4723079, -0.7481372, 1, 0, 0, 1, 1,
0.6532452, 1.42208, -0.03401119, 1, 0, 0, 1, 1,
0.6571773, -2.072968, 3.725996, 0, 0, 0, 1, 1,
0.663965, -0.4835785, 0.7236449, 0, 0, 0, 1, 1,
0.671082, -0.01968953, 1.469626, 0, 0, 0, 1, 1,
0.6775557, -0.7263501, 2.529274, 0, 0, 0, 1, 1,
0.6781721, 0.8163556, 1.290287, 0, 0, 0, 1, 1,
0.6822767, -0.8023432, 1.217913, 0, 0, 0, 1, 1,
0.6839947, 0.9551575, -1.443516, 0, 0, 0, 1, 1,
0.6891102, 2.282977, 0.2120269, 1, 1, 1, 1, 1,
0.6992912, -0.7457679, 3.912736, 1, 1, 1, 1, 1,
0.6995823, -1.180715, 1.937624, 1, 1, 1, 1, 1,
0.7038437, 0.7681972, 1.353601, 1, 1, 1, 1, 1,
0.705253, 1.414339, -0.234988, 1, 1, 1, 1, 1,
0.707839, -0.4250568, 2.543472, 1, 1, 1, 1, 1,
0.7086614, 0.9239456, -0.1059538, 1, 1, 1, 1, 1,
0.71155, -1.482807, 1.299114, 1, 1, 1, 1, 1,
0.7130978, -2.591477, 1.507596, 1, 1, 1, 1, 1,
0.7165393, 0.7411763, 0.9777045, 1, 1, 1, 1, 1,
0.7236742, -0.03641301, 1.99441, 1, 1, 1, 1, 1,
0.7287613, 0.06207928, 2.124491, 1, 1, 1, 1, 1,
0.731708, 2.063722, 2.106826, 1, 1, 1, 1, 1,
0.7322534, -0.5417348, 1.642832, 1, 1, 1, 1, 1,
0.734493, 0.8730893, 0.2559408, 1, 1, 1, 1, 1,
0.7355149, -0.3096405, 1.464078, 0, 0, 1, 1, 1,
0.7388371, -0.343936, 1.996446, 1, 0, 0, 1, 1,
0.7470879, 1.33455, -0.9068269, 1, 0, 0, 1, 1,
0.756848, -0.3268895, 1.306479, 1, 0, 0, 1, 1,
0.7674024, -1.621294, 1.260684, 1, 0, 0, 1, 1,
0.7677705, -1.221189, 2.044138, 1, 0, 0, 1, 1,
0.7771978, 1.26084, 3.039946, 0, 0, 0, 1, 1,
0.7839047, 0.05821135, 0.006624405, 0, 0, 0, 1, 1,
0.7848814, -1.884172, 2.614458, 0, 0, 0, 1, 1,
0.7931527, -0.4318482, 1.674589, 0, 0, 0, 1, 1,
0.7931729, 1.106639, 0.288124, 0, 0, 0, 1, 1,
0.797128, 2.514421, -0.782863, 0, 0, 0, 1, 1,
0.7982482, 0.9800919, -0.4284081, 0, 0, 0, 1, 1,
0.800933, 1.734861, 1.192579, 1, 1, 1, 1, 1,
0.8066437, 1.543282, -1.156703, 1, 1, 1, 1, 1,
0.8141034, 1.07247, 0.1550135, 1, 1, 1, 1, 1,
0.816326, -0.6939237, 3.040116, 1, 1, 1, 1, 1,
0.8165199, 0.4530611, 1.767683, 1, 1, 1, 1, 1,
0.8172899, -2.552973, 3.486342, 1, 1, 1, 1, 1,
0.8217273, -1.326846, 4.405523, 1, 1, 1, 1, 1,
0.8220422, 0.9584684, 0.1988599, 1, 1, 1, 1, 1,
0.8273156, -1.415533, 1.102956, 1, 1, 1, 1, 1,
0.8292349, 0.5624837, 0.6963567, 1, 1, 1, 1, 1,
0.8428026, -0.02655132, 2.434842, 1, 1, 1, 1, 1,
0.8436022, -1.605913, 2.297478, 1, 1, 1, 1, 1,
0.8659762, -0.6667367, 1.251973, 1, 1, 1, 1, 1,
0.871487, 0.09203028, 0.9040894, 1, 1, 1, 1, 1,
0.8750748, -0.5529133, 2.893992, 1, 1, 1, 1, 1,
0.8796017, -1.124123, 2.254228, 0, 0, 1, 1, 1,
0.8834257, -1.028232, 3.067333, 1, 0, 0, 1, 1,
0.8891985, -1.934872, 1.009318, 1, 0, 0, 1, 1,
0.8956761, -0.2494569, 1.479023, 1, 0, 0, 1, 1,
0.9004911, -0.1770583, 2.763244, 1, 0, 0, 1, 1,
0.9030655, -0.5519626, 0.02510826, 1, 0, 0, 1, 1,
0.9053608, 1.110693, -1.30673, 0, 0, 0, 1, 1,
0.9090669, 0.07761912, 0.6386878, 0, 0, 0, 1, 1,
0.9119375, 0.5753326, 1.938855, 0, 0, 0, 1, 1,
0.9155517, -0.5591872, 1.917899, 0, 0, 0, 1, 1,
0.9193344, -0.9774748, 1.039061, 0, 0, 0, 1, 1,
0.9231821, -1.452145, 0.6853023, 0, 0, 0, 1, 1,
0.9254631, 2.114322, -0.2486233, 0, 0, 0, 1, 1,
0.9333647, -0.004668708, 2.470473, 1, 1, 1, 1, 1,
0.9388309, 1.906346, 1.020766, 1, 1, 1, 1, 1,
0.9396479, 0.475816, -0.1541225, 1, 1, 1, 1, 1,
0.9424891, -1.767754, 0.7512539, 1, 1, 1, 1, 1,
0.9504848, -0.06156519, 2.600328, 1, 1, 1, 1, 1,
0.9575073, -1.04976, 2.466882, 1, 1, 1, 1, 1,
0.9688812, -1.171595, 1.875483, 1, 1, 1, 1, 1,
0.9779042, 1.380048, 0.7163793, 1, 1, 1, 1, 1,
0.9790618, 0.7237911, 0.7845472, 1, 1, 1, 1, 1,
0.9866908, -1.881257, 2.212839, 1, 1, 1, 1, 1,
0.9886267, -1.198272, 2.549123, 1, 1, 1, 1, 1,
0.9905997, -1.649759, 2.214542, 1, 1, 1, 1, 1,
0.9951676, -1.2675, 3.302674, 1, 1, 1, 1, 1,
1.002642, 0.2203732, 0.6520579, 1, 1, 1, 1, 1,
1.010783, -0.2489338, 0.9805241, 1, 1, 1, 1, 1,
1.01999, -2.084524, 3.604274, 0, 0, 1, 1, 1,
1.023972, 1.867097, 1.896905, 1, 0, 0, 1, 1,
1.026815, 1.289589, 1.233708, 1, 0, 0, 1, 1,
1.031511, 1.537523, -1.536153, 1, 0, 0, 1, 1,
1.037084, 0.857649, 1.559808, 1, 0, 0, 1, 1,
1.039982, 0.6667933, -0.4459047, 1, 0, 0, 1, 1,
1.040017, 1.088484, -0.6014274, 0, 0, 0, 1, 1,
1.042517, 1.807694, 0.9677801, 0, 0, 0, 1, 1,
1.042623, -0.9143936, 1.976299, 0, 0, 0, 1, 1,
1.055961, 0.1584748, 1.722069, 0, 0, 0, 1, 1,
1.062678, 0.03821211, 0.752883, 0, 0, 0, 1, 1,
1.071876, 0.1249292, 1.451749, 0, 0, 0, 1, 1,
1.077872, 1.516501, 1.841566, 0, 0, 0, 1, 1,
1.083095, 0.5883715, 1.073442, 1, 1, 1, 1, 1,
1.088994, 0.316217, 4.647158, 1, 1, 1, 1, 1,
1.092297, 0.02812691, 2.044574, 1, 1, 1, 1, 1,
1.099856, 0.1768502, 1.745293, 1, 1, 1, 1, 1,
1.102858, 0.5859588, 0.7560399, 1, 1, 1, 1, 1,
1.104921, -0.5664997, 2.457308, 1, 1, 1, 1, 1,
1.105333, -0.1914966, 1.000433, 1, 1, 1, 1, 1,
1.111042, 2.531334, 0.4351231, 1, 1, 1, 1, 1,
1.117507, 1.991691, 1.458886, 1, 1, 1, 1, 1,
1.120939, -0.1713348, 1.783918, 1, 1, 1, 1, 1,
1.124282, 2.165928, 0.395575, 1, 1, 1, 1, 1,
1.125282, -0.5269238, 2.409098, 1, 1, 1, 1, 1,
1.127084, 0.2708743, 2.131846, 1, 1, 1, 1, 1,
1.133724, 0.9800152, 0.3137622, 1, 1, 1, 1, 1,
1.13563, -1.260052, 2.50847, 1, 1, 1, 1, 1,
1.139203, -0.9140161, 2.169048, 0, 0, 1, 1, 1,
1.165309, 1.271281, 0.8110772, 1, 0, 0, 1, 1,
1.165935, 0.1469286, 4.683377, 1, 0, 0, 1, 1,
1.168886, 0.6514057, 1.951513, 1, 0, 0, 1, 1,
1.170848, -1.994549, 2.390519, 1, 0, 0, 1, 1,
1.177169, -0.2496181, 0.2968556, 1, 0, 0, 1, 1,
1.181514, -0.1691597, 3.153021, 0, 0, 0, 1, 1,
1.181748, -0.07087692, 1.37159, 0, 0, 0, 1, 1,
1.184676, 1.094646, 1.489042, 0, 0, 0, 1, 1,
1.189603, -0.4186873, 2.344112, 0, 0, 0, 1, 1,
1.189827, 1.10436, -0.02219225, 0, 0, 0, 1, 1,
1.206894, 1.984657, 0.8360454, 0, 0, 0, 1, 1,
1.208755, -1.224845, 3.503614, 0, 0, 0, 1, 1,
1.234309, -0.2958333, 3.108053, 1, 1, 1, 1, 1,
1.234685, 1.346107, 2.232347, 1, 1, 1, 1, 1,
1.235427, 0.07581153, 2.100865, 1, 1, 1, 1, 1,
1.236871, 1.237901, 3.156109, 1, 1, 1, 1, 1,
1.243396, 0.4278112, 0.5940087, 1, 1, 1, 1, 1,
1.244675, -1.317954, 3.788534, 1, 1, 1, 1, 1,
1.247057, -0.3281944, 1.400139, 1, 1, 1, 1, 1,
1.247657, 0.447684, 1.835323, 1, 1, 1, 1, 1,
1.24965, 1.163929, 2.100755, 1, 1, 1, 1, 1,
1.249677, -0.2964246, 2.583055, 1, 1, 1, 1, 1,
1.252707, -0.6083128, 3.056722, 1, 1, 1, 1, 1,
1.256741, 1.025456, 0.753629, 1, 1, 1, 1, 1,
1.263288, 0.4362642, 1.251599, 1, 1, 1, 1, 1,
1.265079, 0.2344659, 3.086141, 1, 1, 1, 1, 1,
1.265521, 0.06866672, 1.213194, 1, 1, 1, 1, 1,
1.278932, -0.0469071, 1.679896, 0, 0, 1, 1, 1,
1.285106, 0.2088811, 0.3645497, 1, 0, 0, 1, 1,
1.291353, 2.233799, 1.075466, 1, 0, 0, 1, 1,
1.293529, -1.308049, 3.165608, 1, 0, 0, 1, 1,
1.300504, 0.1962637, 0.1270885, 1, 0, 0, 1, 1,
1.310498, 0.2589158, 1.115705, 1, 0, 0, 1, 1,
1.31068, -1.249238, 2.413729, 0, 0, 0, 1, 1,
1.31221, 0.7237487, 0.7894056, 0, 0, 0, 1, 1,
1.314813, 1.509459, -0.02294169, 0, 0, 0, 1, 1,
1.324805, -0.7977354, 2.894357, 0, 0, 0, 1, 1,
1.32798, -0.8427238, 3.755259, 0, 0, 0, 1, 1,
1.334218, -1.820452, 1.959736, 0, 0, 0, 1, 1,
1.350006, 0.5226184, -0.8741606, 0, 0, 0, 1, 1,
1.352594, 1.670044, 0.07589827, 1, 1, 1, 1, 1,
1.364279, 0.2992331, 0.7630089, 1, 1, 1, 1, 1,
1.371912, -0.9914583, 1.129907, 1, 1, 1, 1, 1,
1.373524, 0.6614795, 1.457081, 1, 1, 1, 1, 1,
1.374907, -0.7316931, 2.206729, 1, 1, 1, 1, 1,
1.379491, 0.4388386, 0.1248476, 1, 1, 1, 1, 1,
1.383711, 0.3080339, 1.363077, 1, 1, 1, 1, 1,
1.393356, 0.8651547, 0.02736296, 1, 1, 1, 1, 1,
1.393397, -0.6403919, 2.374774, 1, 1, 1, 1, 1,
1.395774, 0.2295805, 1.652441, 1, 1, 1, 1, 1,
1.397417, 0.4805133, 0.411651, 1, 1, 1, 1, 1,
1.401947, -0.07763951, 0.4016401, 1, 1, 1, 1, 1,
1.407381, 0.4290035, 1.575269, 1, 1, 1, 1, 1,
1.417186, -0.2729808, 2.558261, 1, 1, 1, 1, 1,
1.426209, -0.2971701, 2.785419, 1, 1, 1, 1, 1,
1.429398, -0.6686333, 2.0452, 0, 0, 1, 1, 1,
1.430552, 1.307088, 0.5594656, 1, 0, 0, 1, 1,
1.438721, 0.6415239, 1.73937, 1, 0, 0, 1, 1,
1.442099, -0.7013531, 1.688684, 1, 0, 0, 1, 1,
1.444239, 0.3109769, 1.823312, 1, 0, 0, 1, 1,
1.451865, -2.334351, 1.466884, 1, 0, 0, 1, 1,
1.45886, 0.8793175, -0.1279877, 0, 0, 0, 1, 1,
1.469325, 0.01309461, 1.016192, 0, 0, 0, 1, 1,
1.47067, 0.9168884, 0.03546586, 0, 0, 0, 1, 1,
1.482661, -0.8856667, 2.646035, 0, 0, 0, 1, 1,
1.492372, -0.3406412, 1.628782, 0, 0, 0, 1, 1,
1.493297, 2.870167, 0.07058551, 0, 0, 0, 1, 1,
1.506568, -1.691389, 3.379102, 0, 0, 0, 1, 1,
1.508866, 0.436596, 1.210117, 1, 1, 1, 1, 1,
1.512158, 0.07361, 2.722053, 1, 1, 1, 1, 1,
1.514414, 1.059046, 0.1445163, 1, 1, 1, 1, 1,
1.531055, -1.696841, 1.45699, 1, 1, 1, 1, 1,
1.533586, -0.5083613, 2.253534, 1, 1, 1, 1, 1,
1.552281, 0.03561956, 2.424179, 1, 1, 1, 1, 1,
1.554439, -1.081404, 3.220952, 1, 1, 1, 1, 1,
1.572226, 0.5332851, -1.148343, 1, 1, 1, 1, 1,
1.579307, 0.1716049, 2.990455, 1, 1, 1, 1, 1,
1.579891, -0.7123487, 0.7256991, 1, 1, 1, 1, 1,
1.590713, -1.782738, 1.616631, 1, 1, 1, 1, 1,
1.602761, 0.9485974, 0.8058606, 1, 1, 1, 1, 1,
1.608984, -2.689085, 3.10352, 1, 1, 1, 1, 1,
1.613813, -0.7838445, 2.205459, 1, 1, 1, 1, 1,
1.615909, 0.2919475, 2.192553, 1, 1, 1, 1, 1,
1.624267, -0.3482344, 1.15258, 0, 0, 1, 1, 1,
1.627701, -0.9340034, 1.644166, 1, 0, 0, 1, 1,
1.628436, -2.024913, -0.6291568, 1, 0, 0, 1, 1,
1.62854, -0.02044604, 0.3267254, 1, 0, 0, 1, 1,
1.646585, -1.152579, 0.255991, 1, 0, 0, 1, 1,
1.649574, -0.3440431, 2.366146, 1, 0, 0, 1, 1,
1.673811, -0.8143905, 0.4947512, 0, 0, 0, 1, 1,
1.681222, -1.579794, 3.190542, 0, 0, 0, 1, 1,
1.685262, 0.5822557, 0.1929168, 0, 0, 0, 1, 1,
1.685284, -0.03658498, 2.405406, 0, 0, 0, 1, 1,
1.693442, -0.3014587, 1.668857, 0, 0, 0, 1, 1,
1.704778, -0.1013147, 1.517343, 0, 0, 0, 1, 1,
1.706463, -0.7329191, 2.233093, 0, 0, 0, 1, 1,
1.719118, -1.57212, 0.3727948, 1, 1, 1, 1, 1,
1.738016, 2.365285, 0.3678806, 1, 1, 1, 1, 1,
1.749867, -1.013259, 2.156407, 1, 1, 1, 1, 1,
1.752861, 0.8458958, 0.6442564, 1, 1, 1, 1, 1,
1.757305, 0.1381744, 1.995316, 1, 1, 1, 1, 1,
1.760357, 2.285542, 1.606343, 1, 1, 1, 1, 1,
1.767706, -0.7881017, 3.165277, 1, 1, 1, 1, 1,
1.771274, -0.3832019, 0.7969604, 1, 1, 1, 1, 1,
1.77758, -0.3466774, 2.179116, 1, 1, 1, 1, 1,
1.779494, 0.02137394, 2.719404, 1, 1, 1, 1, 1,
1.780918, 0.2361282, 2.087634, 1, 1, 1, 1, 1,
1.783653, -0.1384802, 1.151225, 1, 1, 1, 1, 1,
1.810215, -0.2950862, 2.432906, 1, 1, 1, 1, 1,
1.811027, 0.3439187, 0.4621565, 1, 1, 1, 1, 1,
1.813028, 0.1131538, 1.951145, 1, 1, 1, 1, 1,
1.819, 1.728757, 0.103607, 0, 0, 1, 1, 1,
1.819775, -0.8384564, 2.485627, 1, 0, 0, 1, 1,
1.823378, 0.9266458, 1.17681, 1, 0, 0, 1, 1,
1.846203, -0.4074609, 1.205559, 1, 0, 0, 1, 1,
1.854717, -0.8877364, 2.872675, 1, 0, 0, 1, 1,
1.857238, -2.08393, 3.353143, 1, 0, 0, 1, 1,
1.866284, -0.5788597, 0.5815913, 0, 0, 0, 1, 1,
1.876019, -2.170281, 2.173897, 0, 0, 0, 1, 1,
1.887396, -2.658886, 1.156361, 0, 0, 0, 1, 1,
1.903241, 1.589872, 1.37511, 0, 0, 0, 1, 1,
1.91679, -0.08342914, 1.602771, 0, 0, 0, 1, 1,
1.936451, -0.2497827, 1.009322, 0, 0, 0, 1, 1,
1.938969, -0.9311327, 1.338927, 0, 0, 0, 1, 1,
1.947183, 0.05337979, 0.1431846, 1, 1, 1, 1, 1,
1.955513, -1.340542, 3.384056, 1, 1, 1, 1, 1,
1.958604, 0.0429161, 2.287106, 1, 1, 1, 1, 1,
1.984266, -0.3699965, 1.323064, 1, 1, 1, 1, 1,
1.985937, -0.6773985, 0.5205755, 1, 1, 1, 1, 1,
2.00031, 1.079045, 0.6989241, 1, 1, 1, 1, 1,
2.096981, 0.8055467, 2.361042, 1, 1, 1, 1, 1,
2.107364, 0.6323811, -0.156178, 1, 1, 1, 1, 1,
2.119738, -0.4874433, 0.640258, 1, 1, 1, 1, 1,
2.180147, 1.458257, -1.437683, 1, 1, 1, 1, 1,
2.229107, 0.5453712, 2.467592, 1, 1, 1, 1, 1,
2.252969, -0.6642326, 2.306237, 1, 1, 1, 1, 1,
2.274357, 0.5500752, 0.7747633, 1, 1, 1, 1, 1,
2.305664, 1.03573, 2.516143, 1, 1, 1, 1, 1,
2.310491, -1.331815, 2.059975, 1, 1, 1, 1, 1,
2.329262, -1.281221, 2.058128, 0, 0, 1, 1, 1,
2.35126, -0.4982013, 3.233147, 1, 0, 0, 1, 1,
2.364995, 1.525407, 0.6723992, 1, 0, 0, 1, 1,
2.404387, -1.23744, 2.403306, 1, 0, 0, 1, 1,
2.427067, -1.712886, 1.617611, 1, 0, 0, 1, 1,
2.434683, -0.06965389, 2.6977, 1, 0, 0, 1, 1,
2.458474, 1.199888, 1.007076, 0, 0, 0, 1, 1,
2.612858, -1.164647, 2.072996, 0, 0, 0, 1, 1,
2.667996, 0.1663375, 0.7259141, 0, 0, 0, 1, 1,
2.692955, -1.6903, 2.000139, 0, 0, 0, 1, 1,
2.781886, 0.9727601, 1.190813, 0, 0, 0, 1, 1,
2.812008, -0.1052091, 3.002879, 0, 0, 0, 1, 1,
2.899137, -2.076664, 2.185505, 0, 0, 0, 1, 1,
2.935767, -1.526204, 3.358632, 1, 1, 1, 1, 1,
2.977315, 0.2836939, 1.81438, 1, 1, 1, 1, 1,
3.18036, 0.1665652, 2.441438, 1, 1, 1, 1, 1,
3.214865, -0.006285948, -0.1768014, 1, 1, 1, 1, 1,
3.319535, 0.3729968, 1.991484, 1, 1, 1, 1, 1,
3.61636, 0.2684341, 3.09868, 1, 1, 1, 1, 1,
4.206536, -0.05775558, 1.265085, 1, 1, 1, 1, 1
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
var radius = 10.1398;
var distance = 35.61561;
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
mvMatrix.translate( -0.6272638, -0.1041715, 0.3354766 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.61561);
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
