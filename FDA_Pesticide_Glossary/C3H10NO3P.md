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
-3.435347, 0.9152123, -3.280151, 1, 0, 0, 1,
-2.615128, -1.17856, -2.428926, 1, 0.007843138, 0, 1,
-2.563513, 0.8369429, -0.6162226, 1, 0.01176471, 0, 1,
-2.379492, -0.6724564, -0.166953, 1, 0.01960784, 0, 1,
-2.297568, 0.2960234, -1.470069, 1, 0.02352941, 0, 1,
-2.24569, -0.6814386, -1.405428, 1, 0.03137255, 0, 1,
-2.230153, 1.826057, 0.5916455, 1, 0.03529412, 0, 1,
-2.207804, -1.533079, -2.958977, 1, 0.04313726, 0, 1,
-2.171089, 0.5558844, -3.048941, 1, 0.04705882, 0, 1,
-2.162924, -1.336933, -1.58752, 1, 0.05490196, 0, 1,
-2.134992, 0.3079522, -0.6236228, 1, 0.05882353, 0, 1,
-2.127578, -0.2290888, -2.715308, 1, 0.06666667, 0, 1,
-2.059959, -0.6953946, -1.991048, 1, 0.07058824, 0, 1,
-2.039785, -1.475266, -1.052225, 1, 0.07843138, 0, 1,
-1.992242, -0.001177362, -2.339872, 1, 0.08235294, 0, 1,
-1.969056, -0.6624579, -0.2780186, 1, 0.09019608, 0, 1,
-1.930305, 1.550158, -0.703345, 1, 0.09411765, 0, 1,
-1.919458, -2.18014, -3.755144, 1, 0.1019608, 0, 1,
-1.906935, 0.9737539, -0.6505545, 1, 0.1098039, 0, 1,
-1.874977, 0.8450643, -0.3625337, 1, 0.1137255, 0, 1,
-1.869678, -1.050441, -1.68067, 1, 0.1215686, 0, 1,
-1.864497, 1.000888, -0.6787111, 1, 0.1254902, 0, 1,
-1.844128, -1.758776, -1.147886, 1, 0.1333333, 0, 1,
-1.837428, 0.004651783, -1.153813, 1, 0.1372549, 0, 1,
-1.778968, -1.665396, -6.094131, 1, 0.145098, 0, 1,
-1.77288, 0.8783257, -1.745323, 1, 0.1490196, 0, 1,
-1.771324, 1.734938, -2.300814, 1, 0.1568628, 0, 1,
-1.763204, 0.009374717, -2.179998, 1, 0.1607843, 0, 1,
-1.76219, 0.9039958, 0.1551527, 1, 0.1686275, 0, 1,
-1.733108, 0.05224647, 0.3600985, 1, 0.172549, 0, 1,
-1.725756, 0.3777755, -0.7853529, 1, 0.1803922, 0, 1,
-1.718294, 1.4473, -1.127292, 1, 0.1843137, 0, 1,
-1.714176, 1.756093, -2.169899, 1, 0.1921569, 0, 1,
-1.711624, -1.268613, -1.080487, 1, 0.1960784, 0, 1,
-1.68773, -0.5711675, -0.5136139, 1, 0.2039216, 0, 1,
-1.667472, 0.922604, -0.4152292, 1, 0.2117647, 0, 1,
-1.665232, -0.442562, -1.730828, 1, 0.2156863, 0, 1,
-1.652844, 0.3936755, 0.08587363, 1, 0.2235294, 0, 1,
-1.651397, 0.2873738, 0.2474573, 1, 0.227451, 0, 1,
-1.643449, 0.6264697, 0.09293707, 1, 0.2352941, 0, 1,
-1.62181, 0.366367, -1.21137, 1, 0.2392157, 0, 1,
-1.619772, -1.133389, -3.690069, 1, 0.2470588, 0, 1,
-1.611288, 0.1131738, -1.203382, 1, 0.2509804, 0, 1,
-1.601306, -1.801555, -3.238791, 1, 0.2588235, 0, 1,
-1.600031, -0.5200806, -2.838288, 1, 0.2627451, 0, 1,
-1.593528, 0.3345453, -1.095692, 1, 0.2705882, 0, 1,
-1.584465, 0.1943229, -1.32796, 1, 0.2745098, 0, 1,
-1.577654, -0.5650843, -2.775232, 1, 0.282353, 0, 1,
-1.575552, 0.9195938, -1.796647, 1, 0.2862745, 0, 1,
-1.571645, 0.3418348, 0.7657714, 1, 0.2941177, 0, 1,
-1.563692, 0.09972741, -2.980577, 1, 0.3019608, 0, 1,
-1.561639, -0.3691137, -2.729911, 1, 0.3058824, 0, 1,
-1.550656, -0.1717156, -1.027149, 1, 0.3137255, 0, 1,
-1.539479, 1.970227, -0.2201792, 1, 0.3176471, 0, 1,
-1.532658, 1.746635, -1.731502, 1, 0.3254902, 0, 1,
-1.498132, 0.8890223, -0.3780763, 1, 0.3294118, 0, 1,
-1.491283, -1.482565, -2.132727, 1, 0.3372549, 0, 1,
-1.482991, -0.8875298, -1.875183, 1, 0.3411765, 0, 1,
-1.482388, -2.214554, -2.533219, 1, 0.3490196, 0, 1,
-1.478219, -1.42442, -1.56355, 1, 0.3529412, 0, 1,
-1.473322, -0.2333101, 0.1231019, 1, 0.3607843, 0, 1,
-1.46863, -0.05183561, -3.126725, 1, 0.3647059, 0, 1,
-1.459845, -0.9996441, -2.752391, 1, 0.372549, 0, 1,
-1.455716, 1.604384, -0.2043475, 1, 0.3764706, 0, 1,
-1.450837, 1.068581, -0.5462036, 1, 0.3843137, 0, 1,
-1.448691, 1.573502, -0.09376262, 1, 0.3882353, 0, 1,
-1.447564, 0.1376878, 1.646239, 1, 0.3960784, 0, 1,
-1.443414, 0.2868529, -0.8917896, 1, 0.4039216, 0, 1,
-1.437053, -0.780126, -2.001158, 1, 0.4078431, 0, 1,
-1.436814, 0.2492019, -1.962229, 1, 0.4156863, 0, 1,
-1.432129, -0.3537782, 0.2430021, 1, 0.4196078, 0, 1,
-1.427412, -0.6470438, -0.003141278, 1, 0.427451, 0, 1,
-1.421603, -2.158598, -1.238107, 1, 0.4313726, 0, 1,
-1.389929, -0.3015542, -1.783932, 1, 0.4392157, 0, 1,
-1.386093, 0.1591743, -1.345458, 1, 0.4431373, 0, 1,
-1.382581, 0.5186675, -1.387624, 1, 0.4509804, 0, 1,
-1.379529, 0.4007408, -0.4862261, 1, 0.454902, 0, 1,
-1.354685, 0.2467368, 0.6081612, 1, 0.4627451, 0, 1,
-1.34859, 1.313756, 0.08301399, 1, 0.4666667, 0, 1,
-1.341628, 1.464548, -3.249888, 1, 0.4745098, 0, 1,
-1.339161, -1.309365, -1.290373, 1, 0.4784314, 0, 1,
-1.33715, 0.3904992, -1.922878, 1, 0.4862745, 0, 1,
-1.335955, 0.2405102, -0.9913377, 1, 0.4901961, 0, 1,
-1.326764, -1.04248, -2.402321, 1, 0.4980392, 0, 1,
-1.325131, 0.6936554, -2.393408, 1, 0.5058824, 0, 1,
-1.315807, -0.5355453, -2.659896, 1, 0.509804, 0, 1,
-1.315615, -2.139019, -2.292056, 1, 0.5176471, 0, 1,
-1.30687, 0.7194614, 0.2266662, 1, 0.5215687, 0, 1,
-1.304588, 1.456045, -2.595145, 1, 0.5294118, 0, 1,
-1.295625, -1.465263, -3.07213, 1, 0.5333334, 0, 1,
-1.295263, -0.440715, -0.8284085, 1, 0.5411765, 0, 1,
-1.280923, -0.9231307, -0.6928683, 1, 0.5450981, 0, 1,
-1.277256, -0.0905472, -0.5460938, 1, 0.5529412, 0, 1,
-1.275436, 0.8766729, -1.087256, 1, 0.5568628, 0, 1,
-1.266405, 0.458769, -1.517684, 1, 0.5647059, 0, 1,
-1.259224, 1.007799, -1.494825, 1, 0.5686275, 0, 1,
-1.254032, -0.09969508, -3.117865, 1, 0.5764706, 0, 1,
-1.25056, -0.1302548, -3.207917, 1, 0.5803922, 0, 1,
-1.248589, -0.4556461, -0.8548316, 1, 0.5882353, 0, 1,
-1.23825, 0.1882092, -0.7356352, 1, 0.5921569, 0, 1,
-1.236957, -1.077078, -2.856183, 1, 0.6, 0, 1,
-1.228048, 1.867241, -0.08855285, 1, 0.6078432, 0, 1,
-1.227072, 0.6236212, 0.2551225, 1, 0.6117647, 0, 1,
-1.225173, -1.022657, -3.460222, 1, 0.6196079, 0, 1,
-1.22477, -0.1568027, -1.140189, 1, 0.6235294, 0, 1,
-1.219977, -0.1626364, -0.3501588, 1, 0.6313726, 0, 1,
-1.218749, -0.0380099, -1.117721, 1, 0.6352941, 0, 1,
-1.211256, 0.4303181, 0.4056644, 1, 0.6431373, 0, 1,
-1.209964, 0.2245515, -1.172134, 1, 0.6470588, 0, 1,
-1.206407, 0.3507721, -0.2092923, 1, 0.654902, 0, 1,
-1.198527, -0.6653935, -1.37769, 1, 0.6588235, 0, 1,
-1.192925, 0.1920143, -1.841678, 1, 0.6666667, 0, 1,
-1.190071, -1.062406, -1.615888, 1, 0.6705883, 0, 1,
-1.18598, -0.9370615, -2.739684, 1, 0.6784314, 0, 1,
-1.180411, -0.5311493, -2.813349, 1, 0.682353, 0, 1,
-1.171279, -0.5979199, -1.26489, 1, 0.6901961, 0, 1,
-1.171197, 0.7046975, -2.484527, 1, 0.6941177, 0, 1,
-1.165355, -0.4433665, -1.852416, 1, 0.7019608, 0, 1,
-1.164226, 1.119267, -1.497441, 1, 0.7098039, 0, 1,
-1.162148, 0.2141381, -1.637183, 1, 0.7137255, 0, 1,
-1.155854, 0.6600155, -1.906872, 1, 0.7215686, 0, 1,
-1.151781, -1.972481, -2.768045, 1, 0.7254902, 0, 1,
-1.146385, -1.622228, -1.995262, 1, 0.7333333, 0, 1,
-1.142445, 0.3988236, -0.8832107, 1, 0.7372549, 0, 1,
-1.141877, -1.046301, -0.6112458, 1, 0.7450981, 0, 1,
-1.138896, -0.3181326, 0.0657857, 1, 0.7490196, 0, 1,
-1.138335, -1.471709, -2.378919, 1, 0.7568628, 0, 1,
-1.13087, 0.9818286, -1.87293, 1, 0.7607843, 0, 1,
-1.125778, -0.2016571, -1.762068, 1, 0.7686275, 0, 1,
-1.124775, -0.7597409, -4.143353, 1, 0.772549, 0, 1,
-1.124012, -0.04392806, -1.636853, 1, 0.7803922, 0, 1,
-1.114597, 1.245474, -0.4647351, 1, 0.7843137, 0, 1,
-1.112153, 1.435384, -0.481464, 1, 0.7921569, 0, 1,
-1.109824, -1.376487, -0.7977846, 1, 0.7960784, 0, 1,
-1.104024, 0.188682, 0.08154947, 1, 0.8039216, 0, 1,
-1.088344, 0.5008498, -3.038646, 1, 0.8117647, 0, 1,
-1.087804, 0.1721036, -1.716374, 1, 0.8156863, 0, 1,
-1.086103, 0.07852642, -1.037458, 1, 0.8235294, 0, 1,
-1.081548, -0.1291163, -1.976048, 1, 0.827451, 0, 1,
-1.075972, -1.535484, -2.197372, 1, 0.8352941, 0, 1,
-1.074334, -0.371415, -0.9133225, 1, 0.8392157, 0, 1,
-1.071097, 0.8283123, -0.02259763, 1, 0.8470588, 0, 1,
-1.070073, 0.4235018, -1.638495, 1, 0.8509804, 0, 1,
-1.067153, -1.388767, -1.906118, 1, 0.8588235, 0, 1,
-1.062145, -0.2286799, -1.072074, 1, 0.8627451, 0, 1,
-1.060939, 1.768896, 0.8324636, 1, 0.8705882, 0, 1,
-1.059719, -0.6635128, -1.678091, 1, 0.8745098, 0, 1,
-1.050411, 1.668729, 0.7030269, 1, 0.8823529, 0, 1,
-1.050406, 1.242536, 2.139509, 1, 0.8862745, 0, 1,
-1.050302, -0.3459256, -1.234289, 1, 0.8941177, 0, 1,
-1.050007, -1.156875, -3.501187, 1, 0.8980392, 0, 1,
-1.047562, -0.4150648, -3.498623, 1, 0.9058824, 0, 1,
-1.046638, 0.1743706, -1.560052, 1, 0.9137255, 0, 1,
-1.042056, -1.260598, -2.152421, 1, 0.9176471, 0, 1,
-1.039223, 0.4372214, -2.292182, 1, 0.9254902, 0, 1,
-1.037231, -1.491543, -3.120848, 1, 0.9294118, 0, 1,
-1.036957, -2.29601, -1.359287, 1, 0.9372549, 0, 1,
-1.031492, -0.9542666, -1.155588, 1, 0.9411765, 0, 1,
-1.030483, -1.160335, -3.831722, 1, 0.9490196, 0, 1,
-1.028591, 0.623337, -1.404272, 1, 0.9529412, 0, 1,
-1.021759, -0.6229277, -1.955974, 1, 0.9607843, 0, 1,
-1.007221, 0.109567, -0.4135686, 1, 0.9647059, 0, 1,
-1.003732, -2.172312, -2.613127, 1, 0.972549, 0, 1,
-0.9859143, -0.5545049, -2.202859, 1, 0.9764706, 0, 1,
-0.9858473, 0.2961859, 0.02639041, 1, 0.9843137, 0, 1,
-0.9764873, 0.3127671, -3.978575, 1, 0.9882353, 0, 1,
-0.9747033, -0.3408771, -2.22845, 1, 0.9960784, 0, 1,
-0.9680361, 0.4917862, -0.8171704, 0.9960784, 1, 0, 1,
-0.9468891, -0.1743729, -2.459585, 0.9921569, 1, 0, 1,
-0.9466166, 1.480865, -0.5236334, 0.9843137, 1, 0, 1,
-0.9398109, 1.592117, -1.188407, 0.9803922, 1, 0, 1,
-0.9321921, -1.28969, -4.183194, 0.972549, 1, 0, 1,
-0.9289502, 0.4104297, -0.4574046, 0.9686275, 1, 0, 1,
-0.9279419, -0.3288125, -1.54732, 0.9607843, 1, 0, 1,
-0.9274412, -0.7844263, -1.322419, 0.9568627, 1, 0, 1,
-0.9248486, -0.0469861, -1.399244, 0.9490196, 1, 0, 1,
-0.9228704, 0.9427891, 0.01863314, 0.945098, 1, 0, 1,
-0.9151168, 0.09957949, -0.7952974, 0.9372549, 1, 0, 1,
-0.90507, 0.6661273, -1.143205, 0.9333333, 1, 0, 1,
-0.90311, 0.4035062, -0.5011574, 0.9254902, 1, 0, 1,
-0.8982741, -0.01358576, -1.846856, 0.9215686, 1, 0, 1,
-0.8965135, -0.1650353, 0.005357139, 0.9137255, 1, 0, 1,
-0.8965081, -0.8926651, -2.589571, 0.9098039, 1, 0, 1,
-0.8946565, 0.4677404, -0.9851805, 0.9019608, 1, 0, 1,
-0.8943654, 0.6644003, -0.8257128, 0.8941177, 1, 0, 1,
-0.8939678, 0.6411588, -1.551903, 0.8901961, 1, 0, 1,
-0.8927378, 1.718332, -1.048697, 0.8823529, 1, 0, 1,
-0.8923521, -1.323096, -0.970065, 0.8784314, 1, 0, 1,
-0.882073, 1.401613, -1.359024, 0.8705882, 1, 0, 1,
-0.88143, 1.102982, -1.043504, 0.8666667, 1, 0, 1,
-0.8806084, 0.6171771, -1.308852, 0.8588235, 1, 0, 1,
-0.8771473, -0.674706, -3.815559, 0.854902, 1, 0, 1,
-0.8681529, -0.2510315, -1.449978, 0.8470588, 1, 0, 1,
-0.8605629, -1.162571, -2.773209, 0.8431373, 1, 0, 1,
-0.8591401, 0.3982936, -1.4079, 0.8352941, 1, 0, 1,
-0.8561705, -0.2204898, -3.901438, 0.8313726, 1, 0, 1,
-0.855122, -1.848322, -2.799449, 0.8235294, 1, 0, 1,
-0.8539938, 1.517678, -0.3735102, 0.8196079, 1, 0, 1,
-0.8532198, 1.315518, -3.081322, 0.8117647, 1, 0, 1,
-0.8450523, 0.4957973, -0.2682306, 0.8078431, 1, 0, 1,
-0.8449279, 0.7026728, -1.623736, 0.8, 1, 0, 1,
-0.8438807, 0.0811164, -2.434942, 0.7921569, 1, 0, 1,
-0.8419496, 0.5983856, -1.901603, 0.7882353, 1, 0, 1,
-0.8364659, -0.5586013, -1.94142, 0.7803922, 1, 0, 1,
-0.8281968, -0.5690863, -1.636777, 0.7764706, 1, 0, 1,
-0.827759, 0.4134271, -1.584826, 0.7686275, 1, 0, 1,
-0.822538, -0.5423737, -2.003644, 0.7647059, 1, 0, 1,
-0.8223123, 0.09304899, -1.989279, 0.7568628, 1, 0, 1,
-0.8152527, -0.6741653, -2.314558, 0.7529412, 1, 0, 1,
-0.8145757, -1.326094, 0.2387936, 0.7450981, 1, 0, 1,
-0.8128526, -0.2369464, -1.460843, 0.7411765, 1, 0, 1,
-0.8106916, 1.050174, -0.8875165, 0.7333333, 1, 0, 1,
-0.8067295, 0.7626262, -1.826258, 0.7294118, 1, 0, 1,
-0.797927, 0.7097921, -1.306126, 0.7215686, 1, 0, 1,
-0.79773, -0.2642006, -1.425417, 0.7176471, 1, 0, 1,
-0.7915723, 0.5322809, -1.382437, 0.7098039, 1, 0, 1,
-0.7861977, 0.574601, -0.5824534, 0.7058824, 1, 0, 1,
-0.7855179, 1.299678, -1.711471, 0.6980392, 1, 0, 1,
-0.7845871, 0.8489439, 0.9091653, 0.6901961, 1, 0, 1,
-0.7809018, 0.1942286, -1.236174, 0.6862745, 1, 0, 1,
-0.7808243, -0.4475872, -2.511013, 0.6784314, 1, 0, 1,
-0.7797369, 1.311036, -0.6251999, 0.6745098, 1, 0, 1,
-0.7794536, 0.6187209, -0.5888164, 0.6666667, 1, 0, 1,
-0.7773162, 0.9651106, 0.2683217, 0.6627451, 1, 0, 1,
-0.7756637, -0.5670208, -0.9879608, 0.654902, 1, 0, 1,
-0.7723594, -0.233231, -0.9844795, 0.6509804, 1, 0, 1,
-0.7702498, -0.5435385, -2.520769, 0.6431373, 1, 0, 1,
-0.768846, 1.160505, -0.4936306, 0.6392157, 1, 0, 1,
-0.7617316, -0.6354837, -3.374683, 0.6313726, 1, 0, 1,
-0.7603795, -1.850068, -3.561802, 0.627451, 1, 0, 1,
-0.7531173, -0.8742825, -2.802931, 0.6196079, 1, 0, 1,
-0.7504417, 0.3035873, -0.942089, 0.6156863, 1, 0, 1,
-0.7478154, 0.9637876, 0.3605952, 0.6078432, 1, 0, 1,
-0.7445327, -0.5915242, -0.6748324, 0.6039216, 1, 0, 1,
-0.7406141, -1.000651, -2.995447, 0.5960785, 1, 0, 1,
-0.7381576, 0.3315115, -1.661588, 0.5882353, 1, 0, 1,
-0.7368422, -1.380357, -4.263063, 0.5843138, 1, 0, 1,
-0.7323256, -0.02454541, -0.8391998, 0.5764706, 1, 0, 1,
-0.7307609, 1.054432, -0.05682717, 0.572549, 1, 0, 1,
-0.7299488, 0.2691489, -0.2078698, 0.5647059, 1, 0, 1,
-0.728052, 0.09940599, -2.770958, 0.5607843, 1, 0, 1,
-0.7249668, 1.174453, -0.6335836, 0.5529412, 1, 0, 1,
-0.72492, -0.5119679, -1.930462, 0.5490196, 1, 0, 1,
-0.7238261, -1.604701, -3.259548, 0.5411765, 1, 0, 1,
-0.7234901, 1.551083, -1.605006, 0.5372549, 1, 0, 1,
-0.7224982, -0.1546359, -2.245712, 0.5294118, 1, 0, 1,
-0.7080979, 0.6822623, -2.59736, 0.5254902, 1, 0, 1,
-0.6956901, 0.6334517, -1.197562, 0.5176471, 1, 0, 1,
-0.692074, 0.8314175, 1.118067, 0.5137255, 1, 0, 1,
-0.6839481, -1.009444, -3.977204, 0.5058824, 1, 0, 1,
-0.6831846, -0.483098, -1.624108, 0.5019608, 1, 0, 1,
-0.6770142, -1.603659, -2.670263, 0.4941176, 1, 0, 1,
-0.6758781, -1.246195, -2.860925, 0.4862745, 1, 0, 1,
-0.6666539, 0.1570336, -1.883211, 0.4823529, 1, 0, 1,
-0.6645838, 0.9514517, -0.9138913, 0.4745098, 1, 0, 1,
-0.6588545, -2.529918, -2.364213, 0.4705882, 1, 0, 1,
-0.657889, -0.2421212, -1.885458, 0.4627451, 1, 0, 1,
-0.6531479, -0.7963863, -3.120399, 0.4588235, 1, 0, 1,
-0.6513212, 1.399783, -1.458475, 0.4509804, 1, 0, 1,
-0.649811, 1.124531, -1.711009, 0.4470588, 1, 0, 1,
-0.6456783, -2.014776, -3.774271, 0.4392157, 1, 0, 1,
-0.6400225, -0.497696, -2.437575, 0.4352941, 1, 0, 1,
-0.6382253, 0.7087832, -0.2121354, 0.427451, 1, 0, 1,
-0.6291244, 0.3339128, -0.9962794, 0.4235294, 1, 0, 1,
-0.628262, 0.3320796, -1.740532, 0.4156863, 1, 0, 1,
-0.6244148, -0.6969513, -2.971656, 0.4117647, 1, 0, 1,
-0.6232083, 0.447284, -0.1038855, 0.4039216, 1, 0, 1,
-0.6227672, 0.3394582, 0.3498463, 0.3960784, 1, 0, 1,
-0.6179193, 1.303573, -0.9169632, 0.3921569, 1, 0, 1,
-0.6175534, -1.233026, -3.648544, 0.3843137, 1, 0, 1,
-0.6159719, 0.7292627, -2.085056, 0.3803922, 1, 0, 1,
-0.6143805, -0.4598153, -2.668027, 0.372549, 1, 0, 1,
-0.6127731, -0.5370525, -0.04787829, 0.3686275, 1, 0, 1,
-0.6099861, -0.1632377, -2.494622, 0.3607843, 1, 0, 1,
-0.607828, -0.9949046, -1.908661, 0.3568628, 1, 0, 1,
-0.6074376, 1.035162, -0.619198, 0.3490196, 1, 0, 1,
-0.5974425, 0.370888, -0.5438149, 0.345098, 1, 0, 1,
-0.5962736, 1.197336, 0.2283635, 0.3372549, 1, 0, 1,
-0.5926988, 1.089763, -0.04958781, 0.3333333, 1, 0, 1,
-0.5894619, 0.2414114, -0.6509153, 0.3254902, 1, 0, 1,
-0.5870736, 0.2699927, -0.8457537, 0.3215686, 1, 0, 1,
-0.5816535, 1.332465, 0.190325, 0.3137255, 1, 0, 1,
-0.5788582, -0.05913188, -2.142598, 0.3098039, 1, 0, 1,
-0.5762343, 0.5483797, -1.313762, 0.3019608, 1, 0, 1,
-0.56727, -0.1970773, -1.663898, 0.2941177, 1, 0, 1,
-0.5627343, -0.6763445, -3.371426, 0.2901961, 1, 0, 1,
-0.5591749, -0.3434581, 0.09297881, 0.282353, 1, 0, 1,
-0.5589212, -0.5794443, -3.062526, 0.2784314, 1, 0, 1,
-0.5569165, -1.414543, -2.258439, 0.2705882, 1, 0, 1,
-0.5498426, 0.769457, 0.3590887, 0.2666667, 1, 0, 1,
-0.547559, -1.386234, -2.128982, 0.2588235, 1, 0, 1,
-0.5469611, 3.246499, -0.224439, 0.254902, 1, 0, 1,
-0.5376023, -0.6729906, -4.145061, 0.2470588, 1, 0, 1,
-0.5375578, -0.3410711, -2.813322, 0.2431373, 1, 0, 1,
-0.5356645, 0.9028828, -0.5617183, 0.2352941, 1, 0, 1,
-0.5277391, -0.07811064, -1.174551, 0.2313726, 1, 0, 1,
-0.5267811, 0.9317636, -1.449235, 0.2235294, 1, 0, 1,
-0.5253201, -0.1721623, -2.232152, 0.2196078, 1, 0, 1,
-0.5250716, -1.512953, -4.112675, 0.2117647, 1, 0, 1,
-0.5245623, -0.267733, -2.936061, 0.2078431, 1, 0, 1,
-0.5220301, -0.3223353, -3.185295, 0.2, 1, 0, 1,
-0.5203605, 0.6397415, -1.675221, 0.1921569, 1, 0, 1,
-0.5181222, 1.972731, 0.5823863, 0.1882353, 1, 0, 1,
-0.5164842, -0.6792427, -2.441346, 0.1803922, 1, 0, 1,
-0.5154473, -1.64495, -2.793078, 0.1764706, 1, 0, 1,
-0.5132319, 1.277294, 0.311246, 0.1686275, 1, 0, 1,
-0.5100868, 0.6853591, -0.3441162, 0.1647059, 1, 0, 1,
-0.49876, 0.345295, -1.167081, 0.1568628, 1, 0, 1,
-0.4851677, -0.3734958, -1.669292, 0.1529412, 1, 0, 1,
-0.4834601, -0.3174316, -4.086051, 0.145098, 1, 0, 1,
-0.4807671, -1.324002, -1.10367, 0.1411765, 1, 0, 1,
-0.4797584, -0.4751262, -2.46982, 0.1333333, 1, 0, 1,
-0.4757192, 0.6463887, -0.1945987, 0.1294118, 1, 0, 1,
-0.4741304, -0.01377434, -1.989323, 0.1215686, 1, 0, 1,
-0.4720083, 0.8448281, -0.4063079, 0.1176471, 1, 0, 1,
-0.4702691, -0.8705775, -3.329722, 0.1098039, 1, 0, 1,
-0.4672193, -2.781289, -4.327287, 0.1058824, 1, 0, 1,
-0.4654459, 0.02719453, -1.571304, 0.09803922, 1, 0, 1,
-0.4640602, 1.036457, -1.660565, 0.09019608, 1, 0, 1,
-0.4607007, 0.787091, -1.007254, 0.08627451, 1, 0, 1,
-0.4605369, -1.231916, -1.140537, 0.07843138, 1, 0, 1,
-0.4604349, -0.2064946, -3.295692, 0.07450981, 1, 0, 1,
-0.457123, -1.398663, -2.441224, 0.06666667, 1, 0, 1,
-0.456436, -0.4879203, -3.067704, 0.0627451, 1, 0, 1,
-0.456185, 0.1818828, -0.7631517, 0.05490196, 1, 0, 1,
-0.4556403, -1.37049, -4.253203, 0.05098039, 1, 0, 1,
-0.453986, -0.2352263, -2.367256, 0.04313726, 1, 0, 1,
-0.4534439, 1.699377, 1.855923, 0.03921569, 1, 0, 1,
-0.4437659, 0.4470158, -0.5661111, 0.03137255, 1, 0, 1,
-0.4414177, 0.8603911, 1.548077, 0.02745098, 1, 0, 1,
-0.4373661, -0.5664571, -3.390861, 0.01960784, 1, 0, 1,
-0.4312294, 1.783452, -0.7676325, 0.01568628, 1, 0, 1,
-0.4297284, -1.256336, -3.292384, 0.007843138, 1, 0, 1,
-0.429457, -0.4557547, -2.379702, 0.003921569, 1, 0, 1,
-0.4254509, -0.8714995, -1.280395, 0, 1, 0.003921569, 1,
-0.4235686, 0.6356154, -0.7767851, 0, 1, 0.01176471, 1,
-0.4212139, 1.297609, -0.5248371, 0, 1, 0.01568628, 1,
-0.420633, 2.190551, 0.299083, 0, 1, 0.02352941, 1,
-0.4072417, 0.899658, -0.7758752, 0, 1, 0.02745098, 1,
-0.4033674, -1.564278, -2.512161, 0, 1, 0.03529412, 1,
-0.4019949, -0.3633113, -2.644673, 0, 1, 0.03921569, 1,
-0.3967067, 0.08121669, -2.591773, 0, 1, 0.04705882, 1,
-0.3880722, 0.2448915, -1.316991, 0, 1, 0.05098039, 1,
-0.3836142, 0.6939868, -0.5718728, 0, 1, 0.05882353, 1,
-0.3825015, -0.03735219, -0.9980461, 0, 1, 0.0627451, 1,
-0.381291, -0.3213, -2.163322, 0, 1, 0.07058824, 1,
-0.3799204, -0.2648882, -2.232091, 0, 1, 0.07450981, 1,
-0.3798716, 1.981085, 0.4892315, 0, 1, 0.08235294, 1,
-0.3791894, -0.4250639, -0.4225308, 0, 1, 0.08627451, 1,
-0.3770962, -0.4872577, -1.326189, 0, 1, 0.09411765, 1,
-0.3745273, 0.0300164, -0.8270308, 0, 1, 0.1019608, 1,
-0.3725914, -0.6635103, -1.843734, 0, 1, 0.1058824, 1,
-0.3638549, 0.5281371, 1.086486, 0, 1, 0.1137255, 1,
-0.3614363, 1.348924, 0.2453351, 0, 1, 0.1176471, 1,
-0.3602984, 0.259588, -2.2733, 0, 1, 0.1254902, 1,
-0.3555791, 0.4802079, -0.9902061, 0, 1, 0.1294118, 1,
-0.3550234, 1.013556, -1.322223, 0, 1, 0.1372549, 1,
-0.3546542, -0.4284055, -3.467595, 0, 1, 0.1411765, 1,
-0.3530471, 0.63969, -1.476628, 0, 1, 0.1490196, 1,
-0.3483932, -0.552602, -2.251161, 0, 1, 0.1529412, 1,
-0.3469257, -1.651644, -2.067784, 0, 1, 0.1607843, 1,
-0.3437811, -1.674895, -1.664151, 0, 1, 0.1647059, 1,
-0.3360011, 0.8835367, -0.3377599, 0, 1, 0.172549, 1,
-0.3330598, -0.8687734, -0.5250707, 0, 1, 0.1764706, 1,
-0.3149647, -1.739823, -4.263643, 0, 1, 0.1843137, 1,
-0.3129551, -0.275729, -1.416069, 0, 1, 0.1882353, 1,
-0.3122867, 0.5966172, -0.6824599, 0, 1, 0.1960784, 1,
-0.3117338, -0.03317365, -3.724532, 0, 1, 0.2039216, 1,
-0.3116449, -0.7928636, -0.4450524, 0, 1, 0.2078431, 1,
-0.3104936, 0.03595478, -2.515435, 0, 1, 0.2156863, 1,
-0.3101876, -0.4858718, -2.798363, 0, 1, 0.2196078, 1,
-0.3064033, 2.073079, 0.7893168, 0, 1, 0.227451, 1,
-0.3060082, 0.05800173, -0.3871419, 0, 1, 0.2313726, 1,
-0.3037769, -1.701893, -2.53533, 0, 1, 0.2392157, 1,
-0.3031055, 0.2701359, -1.65598, 0, 1, 0.2431373, 1,
-0.3022974, 1.416833, 0.5001538, 0, 1, 0.2509804, 1,
-0.2965598, -0.3281856, -3.52156, 0, 1, 0.254902, 1,
-0.2931962, 0.710912, -0.5896555, 0, 1, 0.2627451, 1,
-0.2914593, 0.3386365, 0.7593566, 0, 1, 0.2666667, 1,
-0.2895911, 0.5130437, -0.8403103, 0, 1, 0.2745098, 1,
-0.2877307, 1.029837, 0.5560016, 0, 1, 0.2784314, 1,
-0.2858763, 0.3105907, -0.5118446, 0, 1, 0.2862745, 1,
-0.2810353, -1.394289, -3.645531, 0, 1, 0.2901961, 1,
-0.2797508, -0.6549347, -3.514984, 0, 1, 0.2980392, 1,
-0.2789448, -1.510905, -1.881077, 0, 1, 0.3058824, 1,
-0.2668501, -0.8417886, -3.725182, 0, 1, 0.3098039, 1,
-0.2640429, 0.679001, 0.105019, 0, 1, 0.3176471, 1,
-0.2632463, -1.230543, -2.954412, 0, 1, 0.3215686, 1,
-0.2630948, -0.6873035, -4.303717, 0, 1, 0.3294118, 1,
-0.2622491, 0.5340907, -0.7109841, 0, 1, 0.3333333, 1,
-0.2553117, 0.2663342, -2.429546, 0, 1, 0.3411765, 1,
-0.2553034, 0.3582703, -0.6818502, 0, 1, 0.345098, 1,
-0.2516029, 0.2072245, 0.921872, 0, 1, 0.3529412, 1,
-0.2513433, -0.5224279, -1.419895, 0, 1, 0.3568628, 1,
-0.248677, -2.367973, -2.547032, 0, 1, 0.3647059, 1,
-0.2483136, -0.6016326, -2.568857, 0, 1, 0.3686275, 1,
-0.2357826, 0.9641584, -1.243507, 0, 1, 0.3764706, 1,
-0.2261582, -1.040614, -2.696717, 0, 1, 0.3803922, 1,
-0.2219792, 1.47202, -0.0711318, 0, 1, 0.3882353, 1,
-0.2207414, -0.3496763, -2.422565, 0, 1, 0.3921569, 1,
-0.218343, -1.624941, -3.883724, 0, 1, 0.4, 1,
-0.2165798, 0.03689342, -0.3804854, 0, 1, 0.4078431, 1,
-0.2157545, 0.6802467, -0.5459343, 0, 1, 0.4117647, 1,
-0.215478, -0.4511648, -2.87052, 0, 1, 0.4196078, 1,
-0.2073634, 0.6985394, -1.692967, 0, 1, 0.4235294, 1,
-0.2068165, -0.03464797, -1.069213, 0, 1, 0.4313726, 1,
-0.205024, 1.698028, 0.8285296, 0, 1, 0.4352941, 1,
-0.202414, 1.314334, -0.3505139, 0, 1, 0.4431373, 1,
-0.2022437, -1.006831, -2.172643, 0, 1, 0.4470588, 1,
-0.200892, 0.01984037, -1.666355, 0, 1, 0.454902, 1,
-0.1953846, -1.227332, -3.025236, 0, 1, 0.4588235, 1,
-0.1907976, 0.8454815, 0.4985782, 0, 1, 0.4666667, 1,
-0.1902272, 2.055526, 0.3405849, 0, 1, 0.4705882, 1,
-0.1891433, -0.779922, -1.881172, 0, 1, 0.4784314, 1,
-0.1782464, 1.54806, 0.9494321, 0, 1, 0.4823529, 1,
-0.1768215, 0.6219037, 0.1092434, 0, 1, 0.4901961, 1,
-0.1749419, 1.33378, 0.7917395, 0, 1, 0.4941176, 1,
-0.172925, 1.119434, 0.6526248, 0, 1, 0.5019608, 1,
-0.1708016, -0.7100915, -3.103491, 0, 1, 0.509804, 1,
-0.1701579, -0.6010881, -3.000144, 0, 1, 0.5137255, 1,
-0.1697574, -0.9270818, -2.166864, 0, 1, 0.5215687, 1,
-0.1640332, -0.5040703, -2.284507, 0, 1, 0.5254902, 1,
-0.1624884, -2.231791, -2.22497, 0, 1, 0.5333334, 1,
-0.1616001, -1.32102, -2.637727, 0, 1, 0.5372549, 1,
-0.1603177, 1.327718, 0.9215915, 0, 1, 0.5450981, 1,
-0.1590818, -0.3674032, -0.8553272, 0, 1, 0.5490196, 1,
-0.1558074, -0.7160678, -2.108654, 0, 1, 0.5568628, 1,
-0.1539688, 1.065351, -0.9835246, 0, 1, 0.5607843, 1,
-0.1525182, -0.02957221, -1.555827, 0, 1, 0.5686275, 1,
-0.1523334, 3.476039, 1.277704, 0, 1, 0.572549, 1,
-0.1516174, -0.5239955, -2.148607, 0, 1, 0.5803922, 1,
-0.1483714, -0.6957555, -3.569829, 0, 1, 0.5843138, 1,
-0.1434107, -0.9192879, -1.488685, 0, 1, 0.5921569, 1,
-0.1419767, 0.6388055, 0.3839256, 0, 1, 0.5960785, 1,
-0.1406546, -0.3072077, -2.503221, 0, 1, 0.6039216, 1,
-0.1404887, -0.6943516, -3.488543, 0, 1, 0.6117647, 1,
-0.134257, -0.7547024, -2.658796, 0, 1, 0.6156863, 1,
-0.127488, -1.916062, -2.553447, 0, 1, 0.6235294, 1,
-0.1239165, 1.013641, -1.212656, 0, 1, 0.627451, 1,
-0.1225635, 2.287431, -0.5229776, 0, 1, 0.6352941, 1,
-0.1196937, 0.02435634, -1.723225, 0, 1, 0.6392157, 1,
-0.1190751, -0.02489353, -1.678486, 0, 1, 0.6470588, 1,
-0.1181909, -0.3701783, -3.146218, 0, 1, 0.6509804, 1,
-0.1160653, -1.824494, -2.136475, 0, 1, 0.6588235, 1,
-0.1112183, 2.306738, -0.7098018, 0, 1, 0.6627451, 1,
-0.1097804, 0.4194496, 0.2895213, 0, 1, 0.6705883, 1,
-0.1041517, 0.1625711, 0.4982047, 0, 1, 0.6745098, 1,
-0.1010574, 0.5382553, 0.3616713, 0, 1, 0.682353, 1,
-0.09966353, 0.7530208, -0.4307109, 0, 1, 0.6862745, 1,
-0.0974185, 0.4620287, -0.9120162, 0, 1, 0.6941177, 1,
-0.09316072, -0.6933534, -3.378058, 0, 1, 0.7019608, 1,
-0.09292142, 0.3811621, 0.01323672, 0, 1, 0.7058824, 1,
-0.08972454, 1.30415, 1.330004, 0, 1, 0.7137255, 1,
-0.08077656, -0.5959048, -4.826116, 0, 1, 0.7176471, 1,
-0.08054096, 2.725799, 0.6602678, 0, 1, 0.7254902, 1,
-0.08051936, -1.900877, -2.159285, 0, 1, 0.7294118, 1,
-0.0767752, -0.5001187, -4.165459, 0, 1, 0.7372549, 1,
-0.07553882, 1.688354, 0.9846604, 0, 1, 0.7411765, 1,
-0.07545759, 0.683984, 0.6701674, 0, 1, 0.7490196, 1,
-0.06925143, 0.3894705, -1.307573, 0, 1, 0.7529412, 1,
-0.06463333, 1.527798, -0.8839567, 0, 1, 0.7607843, 1,
-0.06267077, -1.778642, -4.807093, 0, 1, 0.7647059, 1,
-0.05874956, -0.9263356, -2.969388, 0, 1, 0.772549, 1,
-0.0564165, -0.03003539, -3.350305, 0, 1, 0.7764706, 1,
-0.05300268, 0.6999514, -1.906847, 0, 1, 0.7843137, 1,
-0.05229976, -0.2163425, -2.164675, 0, 1, 0.7882353, 1,
-0.0504997, -0.7616565, -2.905885, 0, 1, 0.7960784, 1,
-0.04373629, -1.165149, -3.430014, 0, 1, 0.8039216, 1,
-0.03358833, -1.281079, -3.037795, 0, 1, 0.8078431, 1,
-0.02771408, -0.8778249, -3.885199, 0, 1, 0.8156863, 1,
-0.02271539, 0.02724287, -0.1623397, 0, 1, 0.8196079, 1,
-0.01466436, 2.004076, -0.8816451, 0, 1, 0.827451, 1,
-0.01223777, 0.3471582, 2.665532, 0, 1, 0.8313726, 1,
-0.01002238, -0.5175648, -4.917543, 0, 1, 0.8392157, 1,
-0.004622751, 0.6097136, 0.8919334, 0, 1, 0.8431373, 1,
-0.001624585, -0.5157669, -2.318508, 0, 1, 0.8509804, 1,
0.006023635, -2.030186, 3.436866, 0, 1, 0.854902, 1,
0.006333594, 0.04310253, -1.042163, 0, 1, 0.8627451, 1,
0.007366122, -0.2031807, 2.843187, 0, 1, 0.8666667, 1,
0.007765328, -1.612151, 2.946299, 0, 1, 0.8745098, 1,
0.008537179, 0.2852688, -1.821628, 0, 1, 0.8784314, 1,
0.009007471, 1.561815, 0.3806815, 0, 1, 0.8862745, 1,
0.01017384, 1.838205, -0.4118474, 0, 1, 0.8901961, 1,
0.0182361, -0.4518189, 3.862678, 0, 1, 0.8980392, 1,
0.01852034, -0.5589257, 2.983283, 0, 1, 0.9058824, 1,
0.02122949, 0.5689344, 0.3064195, 0, 1, 0.9098039, 1,
0.02360784, 0.1781876, 0.06097733, 0, 1, 0.9176471, 1,
0.02702714, -1.055334, 4.461821, 0, 1, 0.9215686, 1,
0.03121091, -0.1037222, 3.264818, 0, 1, 0.9294118, 1,
0.0321123, -1.485281, 1.872357, 0, 1, 0.9333333, 1,
0.03330851, -0.7431564, 2.500276, 0, 1, 0.9411765, 1,
0.03522494, 0.5333399, -0.3167015, 0, 1, 0.945098, 1,
0.03575266, 0.01525183, 0.6596557, 0, 1, 0.9529412, 1,
0.0389316, -1.033382, 2.189566, 0, 1, 0.9568627, 1,
0.04466002, 0.3410833, 0.2170187, 0, 1, 0.9647059, 1,
0.0468448, -0.3207197, 2.790706, 0, 1, 0.9686275, 1,
0.04723785, -0.6875659, 3.725967, 0, 1, 0.9764706, 1,
0.05103227, 0.5294343, 1.293833, 0, 1, 0.9803922, 1,
0.05463362, -1.16739, 1.932138, 0, 1, 0.9882353, 1,
0.05530529, 0.3368429, -0.1489614, 0, 1, 0.9921569, 1,
0.05664937, -0.03290446, 1.286869, 0, 1, 1, 1,
0.05705268, 0.1597061, 1.650508, 0, 0.9921569, 1, 1,
0.05717241, 0.260684, 0.6018495, 0, 0.9882353, 1, 1,
0.05804754, -0.04087311, 3.022283, 0, 0.9803922, 1, 1,
0.0609955, -1.899159, 2.548293, 0, 0.9764706, 1, 1,
0.06246998, 0.0439744, 1.897242, 0, 0.9686275, 1, 1,
0.06424369, 0.3105545, 2.434014, 0, 0.9647059, 1, 1,
0.06431472, -1.822508, 3.161633, 0, 0.9568627, 1, 1,
0.06553915, -0.1249961, 3.13525, 0, 0.9529412, 1, 1,
0.06666438, 1.968692, 0.1813381, 0, 0.945098, 1, 1,
0.06693101, -1.779373, 2.198656, 0, 0.9411765, 1, 1,
0.06995876, -0.4434983, 2.355199, 0, 0.9333333, 1, 1,
0.07102021, 0.5569165, -1.427709, 0, 0.9294118, 1, 1,
0.07532808, -0.5004159, 1.498818, 0, 0.9215686, 1, 1,
0.07730225, 1.56682, -0.7653058, 0, 0.9176471, 1, 1,
0.07738791, 0.46908, 1.5201, 0, 0.9098039, 1, 1,
0.08011838, 1.277936, 2.640041, 0, 0.9058824, 1, 1,
0.08082006, -0.244757, 2.834476, 0, 0.8980392, 1, 1,
0.08298627, -0.1931878, 3.640459, 0, 0.8901961, 1, 1,
0.08507207, 0.09579497, 3.006889, 0, 0.8862745, 1, 1,
0.08566728, -2.02054, 2.910358, 0, 0.8784314, 1, 1,
0.08607686, -0.6818896, 2.121964, 0, 0.8745098, 1, 1,
0.08714586, 0.6062471, 0.4518776, 0, 0.8666667, 1, 1,
0.09046928, -0.7012767, 3.661756, 0, 0.8627451, 1, 1,
0.09141981, -1.086084, 2.91552, 0, 0.854902, 1, 1,
0.09253927, -0.2072079, 3.591985, 0, 0.8509804, 1, 1,
0.09908912, -0.4682191, 3.068593, 0, 0.8431373, 1, 1,
0.106957, -0.8362192, 1.955708, 0, 0.8392157, 1, 1,
0.1093539, -0.1604836, 4.175238, 0, 0.8313726, 1, 1,
0.1111054, -0.5159368, 2.822387, 0, 0.827451, 1, 1,
0.1114996, 0.5285439, -0.5167701, 0, 0.8196079, 1, 1,
0.1182612, -1.127346, 2.856549, 0, 0.8156863, 1, 1,
0.1215458, -0.1289946, 2.074084, 0, 0.8078431, 1, 1,
0.1243054, -0.328729, 4.436924, 0, 0.8039216, 1, 1,
0.1251612, -0.5023119, 3.321609, 0, 0.7960784, 1, 1,
0.1286374, 2.049286, -0.2397394, 0, 0.7882353, 1, 1,
0.1300529, -0.3054114, 2.250818, 0, 0.7843137, 1, 1,
0.1325341, -2.903556, 4.252812, 0, 0.7764706, 1, 1,
0.136188, 0.9646025, -1.047303, 0, 0.772549, 1, 1,
0.1369852, -0.8584831, 3.099588, 0, 0.7647059, 1, 1,
0.1394161, -0.2356672, 2.306653, 0, 0.7607843, 1, 1,
0.1412842, -0.7739561, 2.508284, 0, 0.7529412, 1, 1,
0.1423268, 0.7086564, -0.8139939, 0, 0.7490196, 1, 1,
0.1475738, 1.205982, -0.5468852, 0, 0.7411765, 1, 1,
0.1530998, -0.2062724, 1.594548, 0, 0.7372549, 1, 1,
0.1546135, -1.276656, 3.167104, 0, 0.7294118, 1, 1,
0.1555882, 0.1109967, 1.681931, 0, 0.7254902, 1, 1,
0.1603766, -1.875426, 1.80825, 0, 0.7176471, 1, 1,
0.1642958, 1.208799, -1.778225, 0, 0.7137255, 1, 1,
0.1644584, -1.518598, 3.726624, 0, 0.7058824, 1, 1,
0.1717748, 0.2192808, 1.12975, 0, 0.6980392, 1, 1,
0.1756193, 0.6373314, 0.8337603, 0, 0.6941177, 1, 1,
0.1791679, -0.5622057, 2.27933, 0, 0.6862745, 1, 1,
0.1800909, -0.3179885, 1.994776, 0, 0.682353, 1, 1,
0.1802915, 0.4509038, 0.2520843, 0, 0.6745098, 1, 1,
0.1812337, 0.3518519, -0.8985538, 0, 0.6705883, 1, 1,
0.1815506, 1.489347, -0.0779869, 0, 0.6627451, 1, 1,
0.1858718, -0.9768279, 4.547342, 0, 0.6588235, 1, 1,
0.1891261, 1.897924, 1.475725, 0, 0.6509804, 1, 1,
0.1892213, 0.3216798, 0.4010847, 0, 0.6470588, 1, 1,
0.1903168, 0.3349827, 1.747144, 0, 0.6392157, 1, 1,
0.1904608, 0.1918058, 1.477141, 0, 0.6352941, 1, 1,
0.1927395, 0.2228949, 0.578173, 0, 0.627451, 1, 1,
0.1992179, 0.5865053, -0.7243416, 0, 0.6235294, 1, 1,
0.1994994, -0.6454654, 4.706868, 0, 0.6156863, 1, 1,
0.2016581, 1.352875, 1.163451, 0, 0.6117647, 1, 1,
0.2162809, 1.398124, 0.654299, 0, 0.6039216, 1, 1,
0.2171178, 0.77803, -0.9762968, 0, 0.5960785, 1, 1,
0.2217202, -0.508029, 1.851364, 0, 0.5921569, 1, 1,
0.2262027, -1.047747, 2.27935, 0, 0.5843138, 1, 1,
0.2359446, 0.2604023, 1.315863, 0, 0.5803922, 1, 1,
0.245345, -0.1630133, 2.453773, 0, 0.572549, 1, 1,
0.2469899, 1.270352, 1.030671, 0, 0.5686275, 1, 1,
0.2528528, -0.5598957, 2.000466, 0, 0.5607843, 1, 1,
0.2558464, 0.07603683, 0.1859484, 0, 0.5568628, 1, 1,
0.2583254, 0.6114658, -0.589807, 0, 0.5490196, 1, 1,
0.2660583, 1.373037, -0.5201206, 0, 0.5450981, 1, 1,
0.2693106, 0.595404, 1.700691, 0, 0.5372549, 1, 1,
0.2738555, -1.33011, 2.032853, 0, 0.5333334, 1, 1,
0.2806704, -1.224302, 4.296041, 0, 0.5254902, 1, 1,
0.2817911, 0.1187322, 0.8076956, 0, 0.5215687, 1, 1,
0.2832214, 0.3365388, 2.738702, 0, 0.5137255, 1, 1,
0.2850001, -1.987827, 3.207771, 0, 0.509804, 1, 1,
0.2869898, -0.6639138, 0.9907166, 0, 0.5019608, 1, 1,
0.2887664, -1.38578, 1.807057, 0, 0.4941176, 1, 1,
0.2960627, 1.251219, 0.03951561, 0, 0.4901961, 1, 1,
0.2980629, -0.7660938, 4.675293, 0, 0.4823529, 1, 1,
0.3014977, 0.5545698, 0.86263, 0, 0.4784314, 1, 1,
0.302295, 2.039178, 0.4607045, 0, 0.4705882, 1, 1,
0.3093823, 0.5028194, 1.615551, 0, 0.4666667, 1, 1,
0.3114291, 0.06929722, 2.776618, 0, 0.4588235, 1, 1,
0.3117705, -0.2477151, 2.634401, 0, 0.454902, 1, 1,
0.3138242, -1.526621, 0.5996411, 0, 0.4470588, 1, 1,
0.3147474, 0.05849969, 2.353978, 0, 0.4431373, 1, 1,
0.3171568, 2.66449, -0.07931334, 0, 0.4352941, 1, 1,
0.3203534, 1.688691, 0.8942218, 0, 0.4313726, 1, 1,
0.3248228, -1.436321, 2.100029, 0, 0.4235294, 1, 1,
0.329391, -0.8438165, 3.368547, 0, 0.4196078, 1, 1,
0.3302983, -1.502421, 2.788944, 0, 0.4117647, 1, 1,
0.3311559, -0.1846842, 2.157783, 0, 0.4078431, 1, 1,
0.3313376, 0.2055338, 3.007362, 0, 0.4, 1, 1,
0.3315174, -1.030336, 2.21223, 0, 0.3921569, 1, 1,
0.3345737, -0.3373445, 2.927253, 0, 0.3882353, 1, 1,
0.3350505, -1.188177, 4.259367, 0, 0.3803922, 1, 1,
0.3360234, 1.071919, -0.6336718, 0, 0.3764706, 1, 1,
0.3382442, 0.4920588, 0.3379107, 0, 0.3686275, 1, 1,
0.3401531, -0.06338234, 2.6985, 0, 0.3647059, 1, 1,
0.3453593, -0.8945566, 0.5606635, 0, 0.3568628, 1, 1,
0.3459026, 0.1139104, 1.787073, 0, 0.3529412, 1, 1,
0.3459996, -1.070235, 3.495879, 0, 0.345098, 1, 1,
0.3461469, -0.5669396, 3.234161, 0, 0.3411765, 1, 1,
0.3538806, -0.02367358, 2.418294, 0, 0.3333333, 1, 1,
0.3542558, 0.07529322, 0.8979536, 0, 0.3294118, 1, 1,
0.3562229, -0.4917805, 2.693448, 0, 0.3215686, 1, 1,
0.3566167, -0.6962776, 3.05505, 0, 0.3176471, 1, 1,
0.3641086, 1.154148, 0.3900886, 0, 0.3098039, 1, 1,
0.3664, 0.9338968, -0.02894667, 0, 0.3058824, 1, 1,
0.3675036, -0.2638298, 3.504977, 0, 0.2980392, 1, 1,
0.3746668, 0.008539513, 1.348531, 0, 0.2901961, 1, 1,
0.3782366, -1.778792, 2.157959, 0, 0.2862745, 1, 1,
0.3799623, 0.2503436, 2.612142, 0, 0.2784314, 1, 1,
0.3828893, 0.3441715, 0.01891378, 0, 0.2745098, 1, 1,
0.3839271, -1.104349, 3.21953, 0, 0.2666667, 1, 1,
0.3847001, -0.8426918, 4.367625, 0, 0.2627451, 1, 1,
0.3852755, 1.718896, 1.076054, 0, 0.254902, 1, 1,
0.3858113, 0.4102091, -0.6394618, 0, 0.2509804, 1, 1,
0.39612, 0.9914238, 2.055101, 0, 0.2431373, 1, 1,
0.3973273, -0.1078336, 1.602438, 0, 0.2392157, 1, 1,
0.3993672, -0.1417573, 1.123593, 0, 0.2313726, 1, 1,
0.4048034, 0.2112308, 2.787049, 0, 0.227451, 1, 1,
0.4072978, 0.7049924, -0.6159789, 0, 0.2196078, 1, 1,
0.4130644, -1.023988, 1.498232, 0, 0.2156863, 1, 1,
0.4170032, -0.6741254, 0.3948539, 0, 0.2078431, 1, 1,
0.4170102, 0.4395291, 2.086714, 0, 0.2039216, 1, 1,
0.4175991, -2.189144, 3.823007, 0, 0.1960784, 1, 1,
0.4193307, 0.05355877, 1.787346, 0, 0.1882353, 1, 1,
0.4210967, 0.2407796, 0.05598435, 0, 0.1843137, 1, 1,
0.4222143, -1.120734, 2.480978, 0, 0.1764706, 1, 1,
0.422967, -0.4069504, 0.4579208, 0, 0.172549, 1, 1,
0.4277998, -0.1135837, 3.183528, 0, 0.1647059, 1, 1,
0.4311214, 0.6736193, 0.3914367, 0, 0.1607843, 1, 1,
0.4351048, -0.4271817, 3.039584, 0, 0.1529412, 1, 1,
0.4351166, -0.2853813, 3.569606, 0, 0.1490196, 1, 1,
0.4352507, -1.106228, 3.158613, 0, 0.1411765, 1, 1,
0.4380765, 1.750586, -0.9410529, 0, 0.1372549, 1, 1,
0.4410276, -0.6357011, 1.650332, 0, 0.1294118, 1, 1,
0.4413751, 0.8884444, 0.8441426, 0, 0.1254902, 1, 1,
0.4416141, -0.8121915, 3.822705, 0, 0.1176471, 1, 1,
0.4432293, 1.353038, -0.4730131, 0, 0.1137255, 1, 1,
0.4452718, 0.3767245, 0.8618906, 0, 0.1058824, 1, 1,
0.4461192, 1.028553, -0.0913673, 0, 0.09803922, 1, 1,
0.4475749, 0.396777, 2.56503, 0, 0.09411765, 1, 1,
0.4597878, -1.093037, 0.986303, 0, 0.08627451, 1, 1,
0.4626588, -0.6125329, 1.687126, 0, 0.08235294, 1, 1,
0.463848, 0.3488606, -0.1470362, 0, 0.07450981, 1, 1,
0.4641649, -1.066671, 1.525529, 0, 0.07058824, 1, 1,
0.4673861, 0.2452931, 1.879049, 0, 0.0627451, 1, 1,
0.4708366, 0.2350645, 1.714476, 0, 0.05882353, 1, 1,
0.4711601, 0.02668352, 0.9595048, 0, 0.05098039, 1, 1,
0.4767717, 1.260129, -0.2343261, 0, 0.04705882, 1, 1,
0.4815347, -0.4623212, 2.854387, 0, 0.03921569, 1, 1,
0.4833315, -0.9557497, 2.657097, 0, 0.03529412, 1, 1,
0.4924056, -0.6796834, 3.36968, 0, 0.02745098, 1, 1,
0.4925302, -0.2517855, 2.360134, 0, 0.02352941, 1, 1,
0.4931965, 0.6463897, 0.7030523, 0, 0.01568628, 1, 1,
0.4933284, -0.1247728, 0.1721488, 0, 0.01176471, 1, 1,
0.4936502, 0.184175, 0.01508236, 0, 0.003921569, 1, 1,
0.505286, -0.4226421, 3.109862, 0.003921569, 0, 1, 1,
0.5077763, 0.1958143, 0.2982185, 0.007843138, 0, 1, 1,
0.509919, -0.2515857, 2.009612, 0.01568628, 0, 1, 1,
0.5115444, 1.103476, -0.8167366, 0.01960784, 0, 1, 1,
0.5133792, 0.08226307, 2.5308, 0.02745098, 0, 1, 1,
0.5148689, 0.8974267, -0.3059988, 0.03137255, 0, 1, 1,
0.5164763, -1.762627, 1.870611, 0.03921569, 0, 1, 1,
0.52009, 0.4625278, 0.6463382, 0.04313726, 0, 1, 1,
0.5230408, -0.7105523, 1.668983, 0.05098039, 0, 1, 1,
0.5234476, 0.6033487, 0.9827429, 0.05490196, 0, 1, 1,
0.523482, -1.336507, 1.655592, 0.0627451, 0, 1, 1,
0.5243648, 1.020083, 1.489945, 0.06666667, 0, 1, 1,
0.526666, -0.484367, 2.891631, 0.07450981, 0, 1, 1,
0.5271775, 0.7802548, -0.1949346, 0.07843138, 0, 1, 1,
0.5277137, -1.367177, 3.060162, 0.08627451, 0, 1, 1,
0.5287924, -2.564719, 4.382643, 0.09019608, 0, 1, 1,
0.5298617, 2.056211, 1.180106, 0.09803922, 0, 1, 1,
0.5312309, 0.9559844, 0.9445592, 0.1058824, 0, 1, 1,
0.5317223, 0.6985286, 0.4967276, 0.1098039, 0, 1, 1,
0.5336897, -2.227273, 2.890268, 0.1176471, 0, 1, 1,
0.5414284, -1.90665, 2.204574, 0.1215686, 0, 1, 1,
0.5417239, 0.7508689, -0.2334728, 0.1294118, 0, 1, 1,
0.5421422, -0.7572023, 2.381082, 0.1333333, 0, 1, 1,
0.544324, 1.841719, -1.283211, 0.1411765, 0, 1, 1,
0.5474484, 0.827719, -2.390159, 0.145098, 0, 1, 1,
0.5476336, -1.517584, 2.697855, 0.1529412, 0, 1, 1,
0.549145, 0.4273101, 1.546999, 0.1568628, 0, 1, 1,
0.5495957, -2.282142, 2.755445, 0.1647059, 0, 1, 1,
0.5523586, 2.298489, 0.8685034, 0.1686275, 0, 1, 1,
0.5550005, -0.9997427, 4.076265, 0.1764706, 0, 1, 1,
0.5570385, 1.021391, -0.03144475, 0.1803922, 0, 1, 1,
0.5603038, -0.3211738, 2.928845, 0.1882353, 0, 1, 1,
0.5605862, 1.294691, 0.1209814, 0.1921569, 0, 1, 1,
0.5679272, -0.05753759, 0.3650531, 0.2, 0, 1, 1,
0.5680741, 0.3874624, 1.626947, 0.2078431, 0, 1, 1,
0.5687916, -0.724111, 3.200937, 0.2117647, 0, 1, 1,
0.5712582, 0.2812086, 1.636376, 0.2196078, 0, 1, 1,
0.5755374, -1.010754, 3.219486, 0.2235294, 0, 1, 1,
0.5837189, -0.8693624, 3.243168, 0.2313726, 0, 1, 1,
0.5839577, -1.681125, 0.7565951, 0.2352941, 0, 1, 1,
0.5845915, -1.493771, 3.851833, 0.2431373, 0, 1, 1,
0.5848624, 0.5518071, 0.08234446, 0.2470588, 0, 1, 1,
0.5863422, 0.7108891, 0.4830947, 0.254902, 0, 1, 1,
0.5888042, -0.6559112, 1.581517, 0.2588235, 0, 1, 1,
0.5917447, -0.7720342, 2.290849, 0.2666667, 0, 1, 1,
0.5954853, 0.7851927, 0.5369888, 0.2705882, 0, 1, 1,
0.5991915, 0.3429013, 1.349172, 0.2784314, 0, 1, 1,
0.5996491, 0.194536, 2.275213, 0.282353, 0, 1, 1,
0.6032693, -1.183087, 0.665489, 0.2901961, 0, 1, 1,
0.6140077, -0.5731337, 3.793948, 0.2941177, 0, 1, 1,
0.6146746, 1.611741, 1.102729, 0.3019608, 0, 1, 1,
0.6175728, -0.5879766, 2.738817, 0.3098039, 0, 1, 1,
0.6186635, 0.145349, 0.564139, 0.3137255, 0, 1, 1,
0.6201092, 0.5378975, 2.901637, 0.3215686, 0, 1, 1,
0.6257123, 0.4351665, 0.9115326, 0.3254902, 0, 1, 1,
0.6290136, 1.78919, -0.04964735, 0.3333333, 0, 1, 1,
0.6301021, -0.4004392, 1.313609, 0.3372549, 0, 1, 1,
0.6336697, -0.04354158, 1.775684, 0.345098, 0, 1, 1,
0.6367326, 0.7208077, 1.238264, 0.3490196, 0, 1, 1,
0.6460763, 2.400352, -0.004127856, 0.3568628, 0, 1, 1,
0.6470102, 0.134762, -0.07176191, 0.3607843, 0, 1, 1,
0.6480756, -0.8229182, 3.749797, 0.3686275, 0, 1, 1,
0.6487489, 0.9595945, 1.178848, 0.372549, 0, 1, 1,
0.6543983, -0.02787287, 1.432423, 0.3803922, 0, 1, 1,
0.6545814, 0.1341204, 1.806122, 0.3843137, 0, 1, 1,
0.6561589, -0.6591491, 2.592322, 0.3921569, 0, 1, 1,
0.6563872, -1.042932, 2.393446, 0.3960784, 0, 1, 1,
0.6570318, -1.369528, 2.742397, 0.4039216, 0, 1, 1,
0.6601685, -0.08139335, 0.5250138, 0.4117647, 0, 1, 1,
0.6646072, 0.1166588, 1.666392, 0.4156863, 0, 1, 1,
0.6682575, 0.5916196, 1.111083, 0.4235294, 0, 1, 1,
0.6716908, 0.3420104, 2.074452, 0.427451, 0, 1, 1,
0.6719589, -0.4952762, 3.097053, 0.4352941, 0, 1, 1,
0.6804001, 0.4325309, -1.396367, 0.4392157, 0, 1, 1,
0.690415, -0.557658, -0.1101014, 0.4470588, 0, 1, 1,
0.6940611, -0.7172139, 1.120023, 0.4509804, 0, 1, 1,
0.6941919, 0.3396219, -0.3269124, 0.4588235, 0, 1, 1,
0.6971145, 1.315717, 2.27982, 0.4627451, 0, 1, 1,
0.7007312, -0.3977984, 3.184031, 0.4705882, 0, 1, 1,
0.7049023, 0.1851759, 2.277388, 0.4745098, 0, 1, 1,
0.7062321, -0.5134067, 2.058951, 0.4823529, 0, 1, 1,
0.7066306, -0.4180222, 1.271198, 0.4862745, 0, 1, 1,
0.7141554, -0.03332366, 1.203398, 0.4941176, 0, 1, 1,
0.7149818, 2.579398, -1.910641, 0.5019608, 0, 1, 1,
0.7174504, -1.392499, 2.526724, 0.5058824, 0, 1, 1,
0.7176396, 0.505258, 2.378163, 0.5137255, 0, 1, 1,
0.7204691, -0.7282865, 3.120092, 0.5176471, 0, 1, 1,
0.7211921, 0.9982505, 0.3693897, 0.5254902, 0, 1, 1,
0.7294595, 0.5379961, 1.195514, 0.5294118, 0, 1, 1,
0.7368414, 1.003384, 1.593907, 0.5372549, 0, 1, 1,
0.737172, 1.402077, 2.101042, 0.5411765, 0, 1, 1,
0.7503347, 0.4216844, 1.799046, 0.5490196, 0, 1, 1,
0.7567077, 0.4977658, 2.462977, 0.5529412, 0, 1, 1,
0.7588763, 0.6974033, -0.5237133, 0.5607843, 0, 1, 1,
0.7647561, -1.44342, 4.615084, 0.5647059, 0, 1, 1,
0.7682772, -0.833341, 2.165386, 0.572549, 0, 1, 1,
0.7696547, 0.5577673, 1.629293, 0.5764706, 0, 1, 1,
0.76976, -1.409369, 1.731016, 0.5843138, 0, 1, 1,
0.7721526, -0.07320868, 1.991888, 0.5882353, 0, 1, 1,
0.7742004, 0.3499489, 2.105708, 0.5960785, 0, 1, 1,
0.7790403, -1.126513, 2.197881, 0.6039216, 0, 1, 1,
0.7802154, 1.592447, 1.752722, 0.6078432, 0, 1, 1,
0.7824411, 1.705734, 1.23655, 0.6156863, 0, 1, 1,
0.7862414, -0.5029064, 1.51997, 0.6196079, 0, 1, 1,
0.7863618, -1.148079, 2.491518, 0.627451, 0, 1, 1,
0.7894076, -0.8060865, 3.449444, 0.6313726, 0, 1, 1,
0.7897109, 0.05058941, 3.040906, 0.6392157, 0, 1, 1,
0.7909982, -0.5422601, 3.716993, 0.6431373, 0, 1, 1,
0.8003553, 1.289277, 0.7310741, 0.6509804, 0, 1, 1,
0.8060104, 1.361103, 0.9061616, 0.654902, 0, 1, 1,
0.8102357, -1.011035, 0.1950697, 0.6627451, 0, 1, 1,
0.8138883, 2.059337, 0.7932374, 0.6666667, 0, 1, 1,
0.8215689, 1.156014, 2.267259, 0.6745098, 0, 1, 1,
0.8241624, 0.730037, 1.759959, 0.6784314, 0, 1, 1,
0.8243384, 0.3626024, 0.987665, 0.6862745, 0, 1, 1,
0.8266556, -1.362365, 2.69754, 0.6901961, 0, 1, 1,
0.8273423, -0.1828474, 1.035109, 0.6980392, 0, 1, 1,
0.8295936, 1.019902, 1.854899, 0.7058824, 0, 1, 1,
0.8311102, -0.2850108, 2.204928, 0.7098039, 0, 1, 1,
0.8323718, 0.247051, 0.7906366, 0.7176471, 0, 1, 1,
0.8342844, -0.2218513, 2.119929, 0.7215686, 0, 1, 1,
0.8360738, -2.422566, 1.594383, 0.7294118, 0, 1, 1,
0.8365481, 0.7018837, 0.7477296, 0.7333333, 0, 1, 1,
0.8374216, 1.309699, 2.625748, 0.7411765, 0, 1, 1,
0.8388721, -0.03869746, 0.582619, 0.7450981, 0, 1, 1,
0.839447, -0.1868257, 1.735443, 0.7529412, 0, 1, 1,
0.8440335, -0.8614339, 3.182145, 0.7568628, 0, 1, 1,
0.8471497, 0.363124, -0.04447871, 0.7647059, 0, 1, 1,
0.8484358, -0.2699352, 2.716719, 0.7686275, 0, 1, 1,
0.8489304, 0.6895248, 0.705366, 0.7764706, 0, 1, 1,
0.8540667, -2.191398, 2.654325, 0.7803922, 0, 1, 1,
0.8583996, 0.05186911, 0.958259, 0.7882353, 0, 1, 1,
0.8618013, 1.257205, -0.5121541, 0.7921569, 0, 1, 1,
0.8654592, 1.060641, -0.2296347, 0.8, 0, 1, 1,
0.8686007, -1.649744, 2.380975, 0.8078431, 0, 1, 1,
0.8697619, 0.9209938, -1.088089, 0.8117647, 0, 1, 1,
0.8703461, -0.7328086, 3.150387, 0.8196079, 0, 1, 1,
0.8719515, 0.968852, 2.109436, 0.8235294, 0, 1, 1,
0.8738275, -1.396984, 3.599146, 0.8313726, 0, 1, 1,
0.8750582, -1.343889, 4.805682, 0.8352941, 0, 1, 1,
0.8796358, 0.7989489, 1.211988, 0.8431373, 0, 1, 1,
0.8798726, 0.9944023, 0.817515, 0.8470588, 0, 1, 1,
0.8809262, 0.3052711, 2.139684, 0.854902, 0, 1, 1,
0.8834316, 0.1378486, 0.7678601, 0.8588235, 0, 1, 1,
0.884559, 0.4074613, 0.3455187, 0.8666667, 0, 1, 1,
0.8926916, -0.4179193, 3.275757, 0.8705882, 0, 1, 1,
0.8934909, 0.5739958, 0.2478088, 0.8784314, 0, 1, 1,
0.8935724, 1.642554, 1.204084, 0.8823529, 0, 1, 1,
0.895821, -0.8662296, 1.773093, 0.8901961, 0, 1, 1,
0.8975535, -0.8668019, -0.1339618, 0.8941177, 0, 1, 1,
0.8980817, -0.06658791, 2.166037, 0.9019608, 0, 1, 1,
0.9072318, 0.5622451, 0.1296039, 0.9098039, 0, 1, 1,
0.9111381, -1.603932, 1.410462, 0.9137255, 0, 1, 1,
0.9175251, 0.518625, 1.395772, 0.9215686, 0, 1, 1,
0.9210178, -0.6241873, 1.54152, 0.9254902, 0, 1, 1,
0.9260072, -0.5074733, 2.170419, 0.9333333, 0, 1, 1,
0.9275652, 1.884801, 0.9688027, 0.9372549, 0, 1, 1,
0.92865, -1.693453, 2.265946, 0.945098, 0, 1, 1,
0.9415163, 1.536354, 2.080384, 0.9490196, 0, 1, 1,
0.9482654, 1.393189, 0.3347538, 0.9568627, 0, 1, 1,
0.9601823, 0.1804338, 1.663884, 0.9607843, 0, 1, 1,
0.964312, 0.1966247, 0.9840011, 0.9686275, 0, 1, 1,
0.9682321, 1.262596, 1.857429, 0.972549, 0, 1, 1,
0.9699144, -1.765935, 1.562945, 0.9803922, 0, 1, 1,
0.9736658, 2.404224, 0.03810698, 0.9843137, 0, 1, 1,
0.9760957, 1.006572, -0.3429945, 0.9921569, 0, 1, 1,
0.9771587, 0.9169624, 1.77872, 0.9960784, 0, 1, 1,
0.999147, -0.003863996, 2.395849, 1, 0, 0.9960784, 1,
0.9995656, -0.1436936, 0.7071131, 1, 0, 0.9882353, 1,
1.001054, 0.6933789, -0.0746506, 1, 0, 0.9843137, 1,
1.00484, -0.2359869, -0.4501397, 1, 0, 0.9764706, 1,
1.007166, 0.9957707, -0.8512897, 1, 0, 0.972549, 1,
1.009842, -1.159215, 2.080479, 1, 0, 0.9647059, 1,
1.010636, 0.1672028, 0.8755549, 1, 0, 0.9607843, 1,
1.011534, 0.796133, 0.0446534, 1, 0, 0.9529412, 1,
1.024959, -0.065965, 2.412697, 1, 0, 0.9490196, 1,
1.026513, -1.350278, 2.282596, 1, 0, 0.9411765, 1,
1.026771, 0.2112909, 1.596418, 1, 0, 0.9372549, 1,
1.033458, -0.5311646, 4.497013, 1, 0, 0.9294118, 1,
1.034612, 2.210627, 0.4584296, 1, 0, 0.9254902, 1,
1.04112, -0.8519722, 3.016189, 1, 0, 0.9176471, 1,
1.04325, -0.7294191, 1.908813, 1, 0, 0.9137255, 1,
1.04736, 0.8552961, 0.4940673, 1, 0, 0.9058824, 1,
1.050854, -0.9392337, 2.14532, 1, 0, 0.9019608, 1,
1.053695, 1.447668, 2.146159, 1, 0, 0.8941177, 1,
1.062623, 0.2542547, -0.5038134, 1, 0, 0.8862745, 1,
1.071323, 0.664835, 0.6855718, 1, 0, 0.8823529, 1,
1.078678, 1.634924, 0.6940062, 1, 0, 0.8745098, 1,
1.084033, -1.047551, 3.104899, 1, 0, 0.8705882, 1,
1.08582, -0.1187554, 0.4561443, 1, 0, 0.8627451, 1,
1.087066, 0.7230072, -0.3974974, 1, 0, 0.8588235, 1,
1.096681, -0.4506623, 3.490574, 1, 0, 0.8509804, 1,
1.098563, 0.5111628, 1.272219, 1, 0, 0.8470588, 1,
1.103887, 2.254924, 0.9981634, 1, 0, 0.8392157, 1,
1.107044, -1.182933, 0.6138269, 1, 0, 0.8352941, 1,
1.108119, 0.7322593, 0.9756976, 1, 0, 0.827451, 1,
1.109584, -0.7569526, 2.821649, 1, 0, 0.8235294, 1,
1.116091, 0.7362181, 1.242931, 1, 0, 0.8156863, 1,
1.117915, -1.017629, 1.837818, 1, 0, 0.8117647, 1,
1.121068, 2.151205, 1.259609, 1, 0, 0.8039216, 1,
1.123422, 1.013099, 0.4183066, 1, 0, 0.7960784, 1,
1.124959, -1.168767, 0.1214502, 1, 0, 0.7921569, 1,
1.128518, 2.593912, 0.2236393, 1, 0, 0.7843137, 1,
1.128525, 0.5968383, 1.550535, 1, 0, 0.7803922, 1,
1.13054, -0.1245825, -0.2008087, 1, 0, 0.772549, 1,
1.130704, -1.13369, 3.950267, 1, 0, 0.7686275, 1,
1.137913, -0.7661997, 1.641617, 1, 0, 0.7607843, 1,
1.13804, 0.09130073, 1.587808, 1, 0, 0.7568628, 1,
1.139069, 1.325968, 1.691252, 1, 0, 0.7490196, 1,
1.142847, 1.358324, 0.1744185, 1, 0, 0.7450981, 1,
1.144446, 0.2399211, 2.104835, 1, 0, 0.7372549, 1,
1.149368, -0.5612686, 1.959301, 1, 0, 0.7333333, 1,
1.151227, -1.610893, 3.230307, 1, 0, 0.7254902, 1,
1.159228, -1.909561, 2.290843, 1, 0, 0.7215686, 1,
1.161925, 0.3637255, 0.9802312, 1, 0, 0.7137255, 1,
1.194132, 0.7084625, 1.068378, 1, 0, 0.7098039, 1,
1.197988, 0.7744563, 1.952221, 1, 0, 0.7019608, 1,
1.201024, -1.185014, 3.054911, 1, 0, 0.6941177, 1,
1.211157, -0.6987578, 2.625384, 1, 0, 0.6901961, 1,
1.215433, 0.9035025, -1.101613, 1, 0, 0.682353, 1,
1.218937, 0.03135309, 2.595826, 1, 0, 0.6784314, 1,
1.226614, 0.3801001, 1.734003, 1, 0, 0.6705883, 1,
1.226841, -0.2091273, 1.110316, 1, 0, 0.6666667, 1,
1.23341, 0.4564066, 0.5902843, 1, 0, 0.6588235, 1,
1.236242, 0.6396314, 1.765286, 1, 0, 0.654902, 1,
1.251838, 1.444205, 1.937232, 1, 0, 0.6470588, 1,
1.256624, -0.8156966, 1.802051, 1, 0, 0.6431373, 1,
1.261873, 1.405394, 1.444101, 1, 0, 0.6352941, 1,
1.262963, 0.7145824, 1.200559, 1, 0, 0.6313726, 1,
1.265035, 0.8794615, 1.483383, 1, 0, 0.6235294, 1,
1.268792, -0.1657578, 0.1267573, 1, 0, 0.6196079, 1,
1.268983, -0.7952156, 1.847985, 1, 0, 0.6117647, 1,
1.270162, -0.6853347, 0.1742603, 1, 0, 0.6078432, 1,
1.273739, -0.6768779, 1.024863, 1, 0, 0.6, 1,
1.283192, 0.3094344, 2.427768, 1, 0, 0.5921569, 1,
1.297708, -0.01349004, 3.438148, 1, 0, 0.5882353, 1,
1.297825, -0.2272848, 1.772257, 1, 0, 0.5803922, 1,
1.303873, 0.4206972, 1.089098, 1, 0, 0.5764706, 1,
1.305631, 2.445896, 1.163222, 1, 0, 0.5686275, 1,
1.306388, -0.3296989, 1.706129, 1, 0, 0.5647059, 1,
1.310721, -0.06428163, 2.47049, 1, 0, 0.5568628, 1,
1.314926, 0.05519088, 2.922735, 1, 0, 0.5529412, 1,
1.339367, 0.2577735, 2.782671, 1, 0, 0.5450981, 1,
1.340598, -0.2540652, 0.1115887, 1, 0, 0.5411765, 1,
1.345491, -0.5089095, 1.570815, 1, 0, 0.5333334, 1,
1.34589, -0.8154283, 3.140536, 1, 0, 0.5294118, 1,
1.354917, 0.8260069, 1.973856, 1, 0, 0.5215687, 1,
1.371047, 1.149672, 1.382401, 1, 0, 0.5176471, 1,
1.373032, -0.6378561, 3.168436, 1, 0, 0.509804, 1,
1.393758, 1.454251, 3.023435, 1, 0, 0.5058824, 1,
1.395834, 1.630583, -0.4673931, 1, 0, 0.4980392, 1,
1.400479, 1.2104, -0.4132555, 1, 0, 0.4901961, 1,
1.404679, -0.6081859, 1.004656, 1, 0, 0.4862745, 1,
1.407868, -0.6629046, 4.405683, 1, 0, 0.4784314, 1,
1.427556, -0.726422, 1.424712, 1, 0, 0.4745098, 1,
1.434416, -0.9126143, 1.460642, 1, 0, 0.4666667, 1,
1.438003, 0.3375023, 1.707793, 1, 0, 0.4627451, 1,
1.451281, -0.3110541, 1.777402, 1, 0, 0.454902, 1,
1.454203, 0.3276902, 1.451293, 1, 0, 0.4509804, 1,
1.460782, 0.8211253, 0.8936096, 1, 0, 0.4431373, 1,
1.465796, 1.113992, -0.8097548, 1, 0, 0.4392157, 1,
1.47482, -1.069911, 3.09831, 1, 0, 0.4313726, 1,
1.475372, 1.884582, 0.3038459, 1, 0, 0.427451, 1,
1.481339, -0.3793804, 1.485661, 1, 0, 0.4196078, 1,
1.493408, -1.265927, 1.386406, 1, 0, 0.4156863, 1,
1.513036, -1.13814, 3.152128, 1, 0, 0.4078431, 1,
1.526054, 0.5581811, 1.177513, 1, 0, 0.4039216, 1,
1.533664, 1.169585, 0.6779593, 1, 0, 0.3960784, 1,
1.543906, -1.472675, 2.950566, 1, 0, 0.3882353, 1,
1.546002, 0.4036121, 2.165658, 1, 0, 0.3843137, 1,
1.546615, 1.0132, 0.1946073, 1, 0, 0.3764706, 1,
1.548345, -0.3483866, 2.96252, 1, 0, 0.372549, 1,
1.561544, 0.1895048, 2.216205, 1, 0, 0.3647059, 1,
1.566027, 1.863576, 0.5718351, 1, 0, 0.3607843, 1,
1.566108, 1.566035, -1.191261, 1, 0, 0.3529412, 1,
1.569316, 1.181631, -0.1347178, 1, 0, 0.3490196, 1,
1.581736, -0.4240266, 2.295746, 1, 0, 0.3411765, 1,
1.594461, -0.2692502, 3.080137, 1, 0, 0.3372549, 1,
1.604617, 0.5102887, 3.607076, 1, 0, 0.3294118, 1,
1.60573, 0.8978227, 1.004562, 1, 0, 0.3254902, 1,
1.626125, -0.5214168, 3.390987, 1, 0, 0.3176471, 1,
1.631518, -0.7012801, 2.688922, 1, 0, 0.3137255, 1,
1.63382, -0.6435538, 2.163901, 1, 0, 0.3058824, 1,
1.640771, -0.7828695, 2.249093, 1, 0, 0.2980392, 1,
1.652919, -1.985927, 0.8298081, 1, 0, 0.2941177, 1,
1.655298, 1.12069, 0.8183799, 1, 0, 0.2862745, 1,
1.678671, -0.5260527, 2.595255, 1, 0, 0.282353, 1,
1.679575, -0.2802847, 1.60376, 1, 0, 0.2745098, 1,
1.681514, -1.661319, 2.063355, 1, 0, 0.2705882, 1,
1.691713, -1.151845, 1.582791, 1, 0, 0.2627451, 1,
1.699318, -0.6149828, 0.4471584, 1, 0, 0.2588235, 1,
1.712587, 0.5013013, 0.4847495, 1, 0, 0.2509804, 1,
1.74024, -1.418743, 1.870338, 1, 0, 0.2470588, 1,
1.749026, -1.467348, 3.530432, 1, 0, 0.2392157, 1,
1.75485, -0.4547822, 0.5694397, 1, 0, 0.2352941, 1,
1.758308, 0.6281611, 2.095951, 1, 0, 0.227451, 1,
1.784462, -1.655302, 3.733127, 1, 0, 0.2235294, 1,
1.787386, 0.9515273, 1.169761, 1, 0, 0.2156863, 1,
1.804859, 0.862972, 1.933793, 1, 0, 0.2117647, 1,
1.810688, -0.7579056, 1.064279, 1, 0, 0.2039216, 1,
1.844205, -0.03176189, -0.589314, 1, 0, 0.1960784, 1,
1.853577, 0.09150781, 1.16952, 1, 0, 0.1921569, 1,
1.870065, -2.823762, 2.922641, 1, 0, 0.1843137, 1,
1.871841, 2.034743, -0.3079542, 1, 0, 0.1803922, 1,
1.897793, -0.427272, 1.380528, 1, 0, 0.172549, 1,
1.917556, 0.1083872, 0.05103679, 1, 0, 0.1686275, 1,
1.927218, 0.4258392, 1.756353, 1, 0, 0.1607843, 1,
1.951282, 1.022708, 1.074832, 1, 0, 0.1568628, 1,
1.954107, -1.595875, 3.149945, 1, 0, 0.1490196, 1,
1.966908, -0.2266374, 3.027531, 1, 0, 0.145098, 1,
1.970141, 0.4805148, 1.185347, 1, 0, 0.1372549, 1,
1.999146, 0.2735443, 2.455525, 1, 0, 0.1333333, 1,
2.008067, -0.9048415, 0.8295266, 1, 0, 0.1254902, 1,
2.01883, -0.2915164, 2.90306, 1, 0, 0.1215686, 1,
2.08491, 1.078404, 0.5905573, 1, 0, 0.1137255, 1,
2.118678, 0.1408992, 1.015639, 1, 0, 0.1098039, 1,
2.198642, -1.599007, 4.087303, 1, 0, 0.1019608, 1,
2.201932, -0.04879566, 1.660365, 1, 0, 0.09411765, 1,
2.20307, 0.9432167, 1.61332, 1, 0, 0.09019608, 1,
2.221731, -0.07508971, 1.342725, 1, 0, 0.08235294, 1,
2.23456, 2.159602, 0.8608035, 1, 0, 0.07843138, 1,
2.311039, -0.1804263, 0.6478614, 1, 0, 0.07058824, 1,
2.347929, 0.522867, -0.4329578, 1, 0, 0.06666667, 1,
2.352696, -1.827222, 2.990076, 1, 0, 0.05882353, 1,
2.490684, 0.7858446, 2.312413, 1, 0, 0.05490196, 1,
2.505585, -0.2919192, 0.4177048, 1, 0, 0.04705882, 1,
2.506105, -0.0173561, 0.6069174, 1, 0, 0.04313726, 1,
2.537686, 1.120875, 1.090128, 1, 0, 0.03529412, 1,
2.765371, -0.9988164, 1.165649, 1, 0, 0.03137255, 1,
2.808272, 1.885912, -0.3096912, 1, 0, 0.02352941, 1,
2.847243, -0.3893582, 0.648096, 1, 0, 0.01960784, 1,
3.065342, 0.4720947, 0.9390674, 1, 0, 0.01176471, 1,
3.252353, 0.09262621, 1.787014, 1, 0, 0.007843138, 1
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
-0.09149718, -3.984897, -7.941649, 0, -0.5, 0.5, 0.5,
-0.09149718, -3.984897, -7.941649, 1, -0.5, 0.5, 0.5,
-0.09149718, -3.984897, -7.941649, 1, 1.5, 0.5, 0.5,
-0.09149718, -3.984897, -7.941649, 0, 1.5, 0.5, 0.5
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
-4.568913, 0.2862415, -7.941649, 0, -0.5, 0.5, 0.5,
-4.568913, 0.2862415, -7.941649, 1, -0.5, 0.5, 0.5,
-4.568913, 0.2862415, -7.941649, 1, 1.5, 0.5, 0.5,
-4.568913, 0.2862415, -7.941649, 0, 1.5, 0.5, 0.5
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
-4.568913, -3.984897, -0.6442244, 0, -0.5, 0.5, 0.5,
-4.568913, -3.984897, -0.6442244, 1, -0.5, 0.5, 0.5,
-4.568913, -3.984897, -0.6442244, 1, 1.5, 0.5, 0.5,
-4.568913, -3.984897, -0.6442244, 0, 1.5, 0.5, 0.5
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
-3, -2.99925, -6.257628,
3, -2.99925, -6.257628,
-3, -2.99925, -6.257628,
-3, -3.163524, -6.538299,
-2, -2.99925, -6.257628,
-2, -3.163524, -6.538299,
-1, -2.99925, -6.257628,
-1, -3.163524, -6.538299,
0, -2.99925, -6.257628,
0, -3.163524, -6.538299,
1, -2.99925, -6.257628,
1, -3.163524, -6.538299,
2, -2.99925, -6.257628,
2, -3.163524, -6.538299,
3, -2.99925, -6.257628,
3, -3.163524, -6.538299
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
-3, -3.492074, -7.099639, 0, -0.5, 0.5, 0.5,
-3, -3.492074, -7.099639, 1, -0.5, 0.5, 0.5,
-3, -3.492074, -7.099639, 1, 1.5, 0.5, 0.5,
-3, -3.492074, -7.099639, 0, 1.5, 0.5, 0.5,
-2, -3.492074, -7.099639, 0, -0.5, 0.5, 0.5,
-2, -3.492074, -7.099639, 1, -0.5, 0.5, 0.5,
-2, -3.492074, -7.099639, 1, 1.5, 0.5, 0.5,
-2, -3.492074, -7.099639, 0, 1.5, 0.5, 0.5,
-1, -3.492074, -7.099639, 0, -0.5, 0.5, 0.5,
-1, -3.492074, -7.099639, 1, -0.5, 0.5, 0.5,
-1, -3.492074, -7.099639, 1, 1.5, 0.5, 0.5,
-1, -3.492074, -7.099639, 0, 1.5, 0.5, 0.5,
0, -3.492074, -7.099639, 0, -0.5, 0.5, 0.5,
0, -3.492074, -7.099639, 1, -0.5, 0.5, 0.5,
0, -3.492074, -7.099639, 1, 1.5, 0.5, 0.5,
0, -3.492074, -7.099639, 0, 1.5, 0.5, 0.5,
1, -3.492074, -7.099639, 0, -0.5, 0.5, 0.5,
1, -3.492074, -7.099639, 1, -0.5, 0.5, 0.5,
1, -3.492074, -7.099639, 1, 1.5, 0.5, 0.5,
1, -3.492074, -7.099639, 0, 1.5, 0.5, 0.5,
2, -3.492074, -7.099639, 0, -0.5, 0.5, 0.5,
2, -3.492074, -7.099639, 1, -0.5, 0.5, 0.5,
2, -3.492074, -7.099639, 1, 1.5, 0.5, 0.5,
2, -3.492074, -7.099639, 0, 1.5, 0.5, 0.5,
3, -3.492074, -7.099639, 0, -0.5, 0.5, 0.5,
3, -3.492074, -7.099639, 1, -0.5, 0.5, 0.5,
3, -3.492074, -7.099639, 1, 1.5, 0.5, 0.5,
3, -3.492074, -7.099639, 0, 1.5, 0.5, 0.5
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
-3.535663, -2, -6.257628,
-3.535663, 3, -6.257628,
-3.535663, -2, -6.257628,
-3.707871, -2, -6.538299,
-3.535663, -1, -6.257628,
-3.707871, -1, -6.538299,
-3.535663, 0, -6.257628,
-3.707871, 0, -6.538299,
-3.535663, 1, -6.257628,
-3.707871, 1, -6.538299,
-3.535663, 2, -6.257628,
-3.707871, 2, -6.538299,
-3.535663, 3, -6.257628,
-3.707871, 3, -6.538299
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
-4.052288, -2, -7.099639, 0, -0.5, 0.5, 0.5,
-4.052288, -2, -7.099639, 1, -0.5, 0.5, 0.5,
-4.052288, -2, -7.099639, 1, 1.5, 0.5, 0.5,
-4.052288, -2, -7.099639, 0, 1.5, 0.5, 0.5,
-4.052288, -1, -7.099639, 0, -0.5, 0.5, 0.5,
-4.052288, -1, -7.099639, 1, -0.5, 0.5, 0.5,
-4.052288, -1, -7.099639, 1, 1.5, 0.5, 0.5,
-4.052288, -1, -7.099639, 0, 1.5, 0.5, 0.5,
-4.052288, 0, -7.099639, 0, -0.5, 0.5, 0.5,
-4.052288, 0, -7.099639, 1, -0.5, 0.5, 0.5,
-4.052288, 0, -7.099639, 1, 1.5, 0.5, 0.5,
-4.052288, 0, -7.099639, 0, 1.5, 0.5, 0.5,
-4.052288, 1, -7.099639, 0, -0.5, 0.5, 0.5,
-4.052288, 1, -7.099639, 1, -0.5, 0.5, 0.5,
-4.052288, 1, -7.099639, 1, 1.5, 0.5, 0.5,
-4.052288, 1, -7.099639, 0, 1.5, 0.5, 0.5,
-4.052288, 2, -7.099639, 0, -0.5, 0.5, 0.5,
-4.052288, 2, -7.099639, 1, -0.5, 0.5, 0.5,
-4.052288, 2, -7.099639, 1, 1.5, 0.5, 0.5,
-4.052288, 2, -7.099639, 0, 1.5, 0.5, 0.5,
-4.052288, 3, -7.099639, 0, -0.5, 0.5, 0.5,
-4.052288, 3, -7.099639, 1, -0.5, 0.5, 0.5,
-4.052288, 3, -7.099639, 1, 1.5, 0.5, 0.5,
-4.052288, 3, -7.099639, 0, 1.5, 0.5, 0.5
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
-3.535663, -2.99925, -6,
-3.535663, -2.99925, 4,
-3.535663, -2.99925, -6,
-3.707871, -3.163524, -6,
-3.535663, -2.99925, -4,
-3.707871, -3.163524, -4,
-3.535663, -2.99925, -2,
-3.707871, -3.163524, -2,
-3.535663, -2.99925, 0,
-3.707871, -3.163524, 0,
-3.535663, -2.99925, 2,
-3.707871, -3.163524, 2,
-3.535663, -2.99925, 4,
-3.707871, -3.163524, 4
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
-4.052288, -3.492074, -6, 0, -0.5, 0.5, 0.5,
-4.052288, -3.492074, -6, 1, -0.5, 0.5, 0.5,
-4.052288, -3.492074, -6, 1, 1.5, 0.5, 0.5,
-4.052288, -3.492074, -6, 0, 1.5, 0.5, 0.5,
-4.052288, -3.492074, -4, 0, -0.5, 0.5, 0.5,
-4.052288, -3.492074, -4, 1, -0.5, 0.5, 0.5,
-4.052288, -3.492074, -4, 1, 1.5, 0.5, 0.5,
-4.052288, -3.492074, -4, 0, 1.5, 0.5, 0.5,
-4.052288, -3.492074, -2, 0, -0.5, 0.5, 0.5,
-4.052288, -3.492074, -2, 1, -0.5, 0.5, 0.5,
-4.052288, -3.492074, -2, 1, 1.5, 0.5, 0.5,
-4.052288, -3.492074, -2, 0, 1.5, 0.5, 0.5,
-4.052288, -3.492074, 0, 0, -0.5, 0.5, 0.5,
-4.052288, -3.492074, 0, 1, -0.5, 0.5, 0.5,
-4.052288, -3.492074, 0, 1, 1.5, 0.5, 0.5,
-4.052288, -3.492074, 0, 0, 1.5, 0.5, 0.5,
-4.052288, -3.492074, 2, 0, -0.5, 0.5, 0.5,
-4.052288, -3.492074, 2, 1, -0.5, 0.5, 0.5,
-4.052288, -3.492074, 2, 1, 1.5, 0.5, 0.5,
-4.052288, -3.492074, 2, 0, 1.5, 0.5, 0.5,
-4.052288, -3.492074, 4, 0, -0.5, 0.5, 0.5,
-4.052288, -3.492074, 4, 1, -0.5, 0.5, 0.5,
-4.052288, -3.492074, 4, 1, 1.5, 0.5, 0.5,
-4.052288, -3.492074, 4, 0, 1.5, 0.5, 0.5
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
-3.535663, -2.99925, -6.257628,
-3.535663, 3.571733, -6.257628,
-3.535663, -2.99925, 4.969179,
-3.535663, 3.571733, 4.969179,
-3.535663, -2.99925, -6.257628,
-3.535663, -2.99925, 4.969179,
-3.535663, 3.571733, -6.257628,
-3.535663, 3.571733, 4.969179,
-3.535663, -2.99925, -6.257628,
3.352669, -2.99925, -6.257628,
-3.535663, -2.99925, 4.969179,
3.352669, -2.99925, 4.969179,
-3.535663, 3.571733, -6.257628,
3.352669, 3.571733, -6.257628,
-3.535663, 3.571733, 4.969179,
3.352669, 3.571733, 4.969179,
3.352669, -2.99925, -6.257628,
3.352669, 3.571733, -6.257628,
3.352669, -2.99925, 4.969179,
3.352669, 3.571733, 4.969179,
3.352669, -2.99925, -6.257628,
3.352669, -2.99925, 4.969179,
3.352669, 3.571733, -6.257628,
3.352669, 3.571733, 4.969179
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
var radius = 7.860008;
var distance = 34.97007;
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
mvMatrix.translate( 0.09149718, -0.2862415, 0.6442244 );
mvMatrix.scale( 1.233738, 1.293322, 0.7569734 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.97007);
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
C3H10NO3P<-read.table("C3H10NO3P.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-C3H10NO3P$V2
```

```
## Error in eval(expr, envir, enclos): object 'C3H10NO3P' not found
```

```r
y<-C3H10NO3P$V3
```

```
## Error in eval(expr, envir, enclos): object 'C3H10NO3P' not found
```

```r
z<-C3H10NO3P$V4
```

```
## Error in eval(expr, envir, enclos): object 'C3H10NO3P' not found
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
-3.435347, 0.9152123, -3.280151, 0, 0, 1, 1, 1,
-2.615128, -1.17856, -2.428926, 1, 0, 0, 1, 1,
-2.563513, 0.8369429, -0.6162226, 1, 0, 0, 1, 1,
-2.379492, -0.6724564, -0.166953, 1, 0, 0, 1, 1,
-2.297568, 0.2960234, -1.470069, 1, 0, 0, 1, 1,
-2.24569, -0.6814386, -1.405428, 1, 0, 0, 1, 1,
-2.230153, 1.826057, 0.5916455, 0, 0, 0, 1, 1,
-2.207804, -1.533079, -2.958977, 0, 0, 0, 1, 1,
-2.171089, 0.5558844, -3.048941, 0, 0, 0, 1, 1,
-2.162924, -1.336933, -1.58752, 0, 0, 0, 1, 1,
-2.134992, 0.3079522, -0.6236228, 0, 0, 0, 1, 1,
-2.127578, -0.2290888, -2.715308, 0, 0, 0, 1, 1,
-2.059959, -0.6953946, -1.991048, 0, 0, 0, 1, 1,
-2.039785, -1.475266, -1.052225, 1, 1, 1, 1, 1,
-1.992242, -0.001177362, -2.339872, 1, 1, 1, 1, 1,
-1.969056, -0.6624579, -0.2780186, 1, 1, 1, 1, 1,
-1.930305, 1.550158, -0.703345, 1, 1, 1, 1, 1,
-1.919458, -2.18014, -3.755144, 1, 1, 1, 1, 1,
-1.906935, 0.9737539, -0.6505545, 1, 1, 1, 1, 1,
-1.874977, 0.8450643, -0.3625337, 1, 1, 1, 1, 1,
-1.869678, -1.050441, -1.68067, 1, 1, 1, 1, 1,
-1.864497, 1.000888, -0.6787111, 1, 1, 1, 1, 1,
-1.844128, -1.758776, -1.147886, 1, 1, 1, 1, 1,
-1.837428, 0.004651783, -1.153813, 1, 1, 1, 1, 1,
-1.778968, -1.665396, -6.094131, 1, 1, 1, 1, 1,
-1.77288, 0.8783257, -1.745323, 1, 1, 1, 1, 1,
-1.771324, 1.734938, -2.300814, 1, 1, 1, 1, 1,
-1.763204, 0.009374717, -2.179998, 1, 1, 1, 1, 1,
-1.76219, 0.9039958, 0.1551527, 0, 0, 1, 1, 1,
-1.733108, 0.05224647, 0.3600985, 1, 0, 0, 1, 1,
-1.725756, 0.3777755, -0.7853529, 1, 0, 0, 1, 1,
-1.718294, 1.4473, -1.127292, 1, 0, 0, 1, 1,
-1.714176, 1.756093, -2.169899, 1, 0, 0, 1, 1,
-1.711624, -1.268613, -1.080487, 1, 0, 0, 1, 1,
-1.68773, -0.5711675, -0.5136139, 0, 0, 0, 1, 1,
-1.667472, 0.922604, -0.4152292, 0, 0, 0, 1, 1,
-1.665232, -0.442562, -1.730828, 0, 0, 0, 1, 1,
-1.652844, 0.3936755, 0.08587363, 0, 0, 0, 1, 1,
-1.651397, 0.2873738, 0.2474573, 0, 0, 0, 1, 1,
-1.643449, 0.6264697, 0.09293707, 0, 0, 0, 1, 1,
-1.62181, 0.366367, -1.21137, 0, 0, 0, 1, 1,
-1.619772, -1.133389, -3.690069, 1, 1, 1, 1, 1,
-1.611288, 0.1131738, -1.203382, 1, 1, 1, 1, 1,
-1.601306, -1.801555, -3.238791, 1, 1, 1, 1, 1,
-1.600031, -0.5200806, -2.838288, 1, 1, 1, 1, 1,
-1.593528, 0.3345453, -1.095692, 1, 1, 1, 1, 1,
-1.584465, 0.1943229, -1.32796, 1, 1, 1, 1, 1,
-1.577654, -0.5650843, -2.775232, 1, 1, 1, 1, 1,
-1.575552, 0.9195938, -1.796647, 1, 1, 1, 1, 1,
-1.571645, 0.3418348, 0.7657714, 1, 1, 1, 1, 1,
-1.563692, 0.09972741, -2.980577, 1, 1, 1, 1, 1,
-1.561639, -0.3691137, -2.729911, 1, 1, 1, 1, 1,
-1.550656, -0.1717156, -1.027149, 1, 1, 1, 1, 1,
-1.539479, 1.970227, -0.2201792, 1, 1, 1, 1, 1,
-1.532658, 1.746635, -1.731502, 1, 1, 1, 1, 1,
-1.498132, 0.8890223, -0.3780763, 1, 1, 1, 1, 1,
-1.491283, -1.482565, -2.132727, 0, 0, 1, 1, 1,
-1.482991, -0.8875298, -1.875183, 1, 0, 0, 1, 1,
-1.482388, -2.214554, -2.533219, 1, 0, 0, 1, 1,
-1.478219, -1.42442, -1.56355, 1, 0, 0, 1, 1,
-1.473322, -0.2333101, 0.1231019, 1, 0, 0, 1, 1,
-1.46863, -0.05183561, -3.126725, 1, 0, 0, 1, 1,
-1.459845, -0.9996441, -2.752391, 0, 0, 0, 1, 1,
-1.455716, 1.604384, -0.2043475, 0, 0, 0, 1, 1,
-1.450837, 1.068581, -0.5462036, 0, 0, 0, 1, 1,
-1.448691, 1.573502, -0.09376262, 0, 0, 0, 1, 1,
-1.447564, 0.1376878, 1.646239, 0, 0, 0, 1, 1,
-1.443414, 0.2868529, -0.8917896, 0, 0, 0, 1, 1,
-1.437053, -0.780126, -2.001158, 0, 0, 0, 1, 1,
-1.436814, 0.2492019, -1.962229, 1, 1, 1, 1, 1,
-1.432129, -0.3537782, 0.2430021, 1, 1, 1, 1, 1,
-1.427412, -0.6470438, -0.003141278, 1, 1, 1, 1, 1,
-1.421603, -2.158598, -1.238107, 1, 1, 1, 1, 1,
-1.389929, -0.3015542, -1.783932, 1, 1, 1, 1, 1,
-1.386093, 0.1591743, -1.345458, 1, 1, 1, 1, 1,
-1.382581, 0.5186675, -1.387624, 1, 1, 1, 1, 1,
-1.379529, 0.4007408, -0.4862261, 1, 1, 1, 1, 1,
-1.354685, 0.2467368, 0.6081612, 1, 1, 1, 1, 1,
-1.34859, 1.313756, 0.08301399, 1, 1, 1, 1, 1,
-1.341628, 1.464548, -3.249888, 1, 1, 1, 1, 1,
-1.339161, -1.309365, -1.290373, 1, 1, 1, 1, 1,
-1.33715, 0.3904992, -1.922878, 1, 1, 1, 1, 1,
-1.335955, 0.2405102, -0.9913377, 1, 1, 1, 1, 1,
-1.326764, -1.04248, -2.402321, 1, 1, 1, 1, 1,
-1.325131, 0.6936554, -2.393408, 0, 0, 1, 1, 1,
-1.315807, -0.5355453, -2.659896, 1, 0, 0, 1, 1,
-1.315615, -2.139019, -2.292056, 1, 0, 0, 1, 1,
-1.30687, 0.7194614, 0.2266662, 1, 0, 0, 1, 1,
-1.304588, 1.456045, -2.595145, 1, 0, 0, 1, 1,
-1.295625, -1.465263, -3.07213, 1, 0, 0, 1, 1,
-1.295263, -0.440715, -0.8284085, 0, 0, 0, 1, 1,
-1.280923, -0.9231307, -0.6928683, 0, 0, 0, 1, 1,
-1.277256, -0.0905472, -0.5460938, 0, 0, 0, 1, 1,
-1.275436, 0.8766729, -1.087256, 0, 0, 0, 1, 1,
-1.266405, 0.458769, -1.517684, 0, 0, 0, 1, 1,
-1.259224, 1.007799, -1.494825, 0, 0, 0, 1, 1,
-1.254032, -0.09969508, -3.117865, 0, 0, 0, 1, 1,
-1.25056, -0.1302548, -3.207917, 1, 1, 1, 1, 1,
-1.248589, -0.4556461, -0.8548316, 1, 1, 1, 1, 1,
-1.23825, 0.1882092, -0.7356352, 1, 1, 1, 1, 1,
-1.236957, -1.077078, -2.856183, 1, 1, 1, 1, 1,
-1.228048, 1.867241, -0.08855285, 1, 1, 1, 1, 1,
-1.227072, 0.6236212, 0.2551225, 1, 1, 1, 1, 1,
-1.225173, -1.022657, -3.460222, 1, 1, 1, 1, 1,
-1.22477, -0.1568027, -1.140189, 1, 1, 1, 1, 1,
-1.219977, -0.1626364, -0.3501588, 1, 1, 1, 1, 1,
-1.218749, -0.0380099, -1.117721, 1, 1, 1, 1, 1,
-1.211256, 0.4303181, 0.4056644, 1, 1, 1, 1, 1,
-1.209964, 0.2245515, -1.172134, 1, 1, 1, 1, 1,
-1.206407, 0.3507721, -0.2092923, 1, 1, 1, 1, 1,
-1.198527, -0.6653935, -1.37769, 1, 1, 1, 1, 1,
-1.192925, 0.1920143, -1.841678, 1, 1, 1, 1, 1,
-1.190071, -1.062406, -1.615888, 0, 0, 1, 1, 1,
-1.18598, -0.9370615, -2.739684, 1, 0, 0, 1, 1,
-1.180411, -0.5311493, -2.813349, 1, 0, 0, 1, 1,
-1.171279, -0.5979199, -1.26489, 1, 0, 0, 1, 1,
-1.171197, 0.7046975, -2.484527, 1, 0, 0, 1, 1,
-1.165355, -0.4433665, -1.852416, 1, 0, 0, 1, 1,
-1.164226, 1.119267, -1.497441, 0, 0, 0, 1, 1,
-1.162148, 0.2141381, -1.637183, 0, 0, 0, 1, 1,
-1.155854, 0.6600155, -1.906872, 0, 0, 0, 1, 1,
-1.151781, -1.972481, -2.768045, 0, 0, 0, 1, 1,
-1.146385, -1.622228, -1.995262, 0, 0, 0, 1, 1,
-1.142445, 0.3988236, -0.8832107, 0, 0, 0, 1, 1,
-1.141877, -1.046301, -0.6112458, 0, 0, 0, 1, 1,
-1.138896, -0.3181326, 0.0657857, 1, 1, 1, 1, 1,
-1.138335, -1.471709, -2.378919, 1, 1, 1, 1, 1,
-1.13087, 0.9818286, -1.87293, 1, 1, 1, 1, 1,
-1.125778, -0.2016571, -1.762068, 1, 1, 1, 1, 1,
-1.124775, -0.7597409, -4.143353, 1, 1, 1, 1, 1,
-1.124012, -0.04392806, -1.636853, 1, 1, 1, 1, 1,
-1.114597, 1.245474, -0.4647351, 1, 1, 1, 1, 1,
-1.112153, 1.435384, -0.481464, 1, 1, 1, 1, 1,
-1.109824, -1.376487, -0.7977846, 1, 1, 1, 1, 1,
-1.104024, 0.188682, 0.08154947, 1, 1, 1, 1, 1,
-1.088344, 0.5008498, -3.038646, 1, 1, 1, 1, 1,
-1.087804, 0.1721036, -1.716374, 1, 1, 1, 1, 1,
-1.086103, 0.07852642, -1.037458, 1, 1, 1, 1, 1,
-1.081548, -0.1291163, -1.976048, 1, 1, 1, 1, 1,
-1.075972, -1.535484, -2.197372, 1, 1, 1, 1, 1,
-1.074334, -0.371415, -0.9133225, 0, 0, 1, 1, 1,
-1.071097, 0.8283123, -0.02259763, 1, 0, 0, 1, 1,
-1.070073, 0.4235018, -1.638495, 1, 0, 0, 1, 1,
-1.067153, -1.388767, -1.906118, 1, 0, 0, 1, 1,
-1.062145, -0.2286799, -1.072074, 1, 0, 0, 1, 1,
-1.060939, 1.768896, 0.8324636, 1, 0, 0, 1, 1,
-1.059719, -0.6635128, -1.678091, 0, 0, 0, 1, 1,
-1.050411, 1.668729, 0.7030269, 0, 0, 0, 1, 1,
-1.050406, 1.242536, 2.139509, 0, 0, 0, 1, 1,
-1.050302, -0.3459256, -1.234289, 0, 0, 0, 1, 1,
-1.050007, -1.156875, -3.501187, 0, 0, 0, 1, 1,
-1.047562, -0.4150648, -3.498623, 0, 0, 0, 1, 1,
-1.046638, 0.1743706, -1.560052, 0, 0, 0, 1, 1,
-1.042056, -1.260598, -2.152421, 1, 1, 1, 1, 1,
-1.039223, 0.4372214, -2.292182, 1, 1, 1, 1, 1,
-1.037231, -1.491543, -3.120848, 1, 1, 1, 1, 1,
-1.036957, -2.29601, -1.359287, 1, 1, 1, 1, 1,
-1.031492, -0.9542666, -1.155588, 1, 1, 1, 1, 1,
-1.030483, -1.160335, -3.831722, 1, 1, 1, 1, 1,
-1.028591, 0.623337, -1.404272, 1, 1, 1, 1, 1,
-1.021759, -0.6229277, -1.955974, 1, 1, 1, 1, 1,
-1.007221, 0.109567, -0.4135686, 1, 1, 1, 1, 1,
-1.003732, -2.172312, -2.613127, 1, 1, 1, 1, 1,
-0.9859143, -0.5545049, -2.202859, 1, 1, 1, 1, 1,
-0.9858473, 0.2961859, 0.02639041, 1, 1, 1, 1, 1,
-0.9764873, 0.3127671, -3.978575, 1, 1, 1, 1, 1,
-0.9747033, -0.3408771, -2.22845, 1, 1, 1, 1, 1,
-0.9680361, 0.4917862, -0.8171704, 1, 1, 1, 1, 1,
-0.9468891, -0.1743729, -2.459585, 0, 0, 1, 1, 1,
-0.9466166, 1.480865, -0.5236334, 1, 0, 0, 1, 1,
-0.9398109, 1.592117, -1.188407, 1, 0, 0, 1, 1,
-0.9321921, -1.28969, -4.183194, 1, 0, 0, 1, 1,
-0.9289502, 0.4104297, -0.4574046, 1, 0, 0, 1, 1,
-0.9279419, -0.3288125, -1.54732, 1, 0, 0, 1, 1,
-0.9274412, -0.7844263, -1.322419, 0, 0, 0, 1, 1,
-0.9248486, -0.0469861, -1.399244, 0, 0, 0, 1, 1,
-0.9228704, 0.9427891, 0.01863314, 0, 0, 0, 1, 1,
-0.9151168, 0.09957949, -0.7952974, 0, 0, 0, 1, 1,
-0.90507, 0.6661273, -1.143205, 0, 0, 0, 1, 1,
-0.90311, 0.4035062, -0.5011574, 0, 0, 0, 1, 1,
-0.8982741, -0.01358576, -1.846856, 0, 0, 0, 1, 1,
-0.8965135, -0.1650353, 0.005357139, 1, 1, 1, 1, 1,
-0.8965081, -0.8926651, -2.589571, 1, 1, 1, 1, 1,
-0.8946565, 0.4677404, -0.9851805, 1, 1, 1, 1, 1,
-0.8943654, 0.6644003, -0.8257128, 1, 1, 1, 1, 1,
-0.8939678, 0.6411588, -1.551903, 1, 1, 1, 1, 1,
-0.8927378, 1.718332, -1.048697, 1, 1, 1, 1, 1,
-0.8923521, -1.323096, -0.970065, 1, 1, 1, 1, 1,
-0.882073, 1.401613, -1.359024, 1, 1, 1, 1, 1,
-0.88143, 1.102982, -1.043504, 1, 1, 1, 1, 1,
-0.8806084, 0.6171771, -1.308852, 1, 1, 1, 1, 1,
-0.8771473, -0.674706, -3.815559, 1, 1, 1, 1, 1,
-0.8681529, -0.2510315, -1.449978, 1, 1, 1, 1, 1,
-0.8605629, -1.162571, -2.773209, 1, 1, 1, 1, 1,
-0.8591401, 0.3982936, -1.4079, 1, 1, 1, 1, 1,
-0.8561705, -0.2204898, -3.901438, 1, 1, 1, 1, 1,
-0.855122, -1.848322, -2.799449, 0, 0, 1, 1, 1,
-0.8539938, 1.517678, -0.3735102, 1, 0, 0, 1, 1,
-0.8532198, 1.315518, -3.081322, 1, 0, 0, 1, 1,
-0.8450523, 0.4957973, -0.2682306, 1, 0, 0, 1, 1,
-0.8449279, 0.7026728, -1.623736, 1, 0, 0, 1, 1,
-0.8438807, 0.0811164, -2.434942, 1, 0, 0, 1, 1,
-0.8419496, 0.5983856, -1.901603, 0, 0, 0, 1, 1,
-0.8364659, -0.5586013, -1.94142, 0, 0, 0, 1, 1,
-0.8281968, -0.5690863, -1.636777, 0, 0, 0, 1, 1,
-0.827759, 0.4134271, -1.584826, 0, 0, 0, 1, 1,
-0.822538, -0.5423737, -2.003644, 0, 0, 0, 1, 1,
-0.8223123, 0.09304899, -1.989279, 0, 0, 0, 1, 1,
-0.8152527, -0.6741653, -2.314558, 0, 0, 0, 1, 1,
-0.8145757, -1.326094, 0.2387936, 1, 1, 1, 1, 1,
-0.8128526, -0.2369464, -1.460843, 1, 1, 1, 1, 1,
-0.8106916, 1.050174, -0.8875165, 1, 1, 1, 1, 1,
-0.8067295, 0.7626262, -1.826258, 1, 1, 1, 1, 1,
-0.797927, 0.7097921, -1.306126, 1, 1, 1, 1, 1,
-0.79773, -0.2642006, -1.425417, 1, 1, 1, 1, 1,
-0.7915723, 0.5322809, -1.382437, 1, 1, 1, 1, 1,
-0.7861977, 0.574601, -0.5824534, 1, 1, 1, 1, 1,
-0.7855179, 1.299678, -1.711471, 1, 1, 1, 1, 1,
-0.7845871, 0.8489439, 0.9091653, 1, 1, 1, 1, 1,
-0.7809018, 0.1942286, -1.236174, 1, 1, 1, 1, 1,
-0.7808243, -0.4475872, -2.511013, 1, 1, 1, 1, 1,
-0.7797369, 1.311036, -0.6251999, 1, 1, 1, 1, 1,
-0.7794536, 0.6187209, -0.5888164, 1, 1, 1, 1, 1,
-0.7773162, 0.9651106, 0.2683217, 1, 1, 1, 1, 1,
-0.7756637, -0.5670208, -0.9879608, 0, 0, 1, 1, 1,
-0.7723594, -0.233231, -0.9844795, 1, 0, 0, 1, 1,
-0.7702498, -0.5435385, -2.520769, 1, 0, 0, 1, 1,
-0.768846, 1.160505, -0.4936306, 1, 0, 0, 1, 1,
-0.7617316, -0.6354837, -3.374683, 1, 0, 0, 1, 1,
-0.7603795, -1.850068, -3.561802, 1, 0, 0, 1, 1,
-0.7531173, -0.8742825, -2.802931, 0, 0, 0, 1, 1,
-0.7504417, 0.3035873, -0.942089, 0, 0, 0, 1, 1,
-0.7478154, 0.9637876, 0.3605952, 0, 0, 0, 1, 1,
-0.7445327, -0.5915242, -0.6748324, 0, 0, 0, 1, 1,
-0.7406141, -1.000651, -2.995447, 0, 0, 0, 1, 1,
-0.7381576, 0.3315115, -1.661588, 0, 0, 0, 1, 1,
-0.7368422, -1.380357, -4.263063, 0, 0, 0, 1, 1,
-0.7323256, -0.02454541, -0.8391998, 1, 1, 1, 1, 1,
-0.7307609, 1.054432, -0.05682717, 1, 1, 1, 1, 1,
-0.7299488, 0.2691489, -0.2078698, 1, 1, 1, 1, 1,
-0.728052, 0.09940599, -2.770958, 1, 1, 1, 1, 1,
-0.7249668, 1.174453, -0.6335836, 1, 1, 1, 1, 1,
-0.72492, -0.5119679, -1.930462, 1, 1, 1, 1, 1,
-0.7238261, -1.604701, -3.259548, 1, 1, 1, 1, 1,
-0.7234901, 1.551083, -1.605006, 1, 1, 1, 1, 1,
-0.7224982, -0.1546359, -2.245712, 1, 1, 1, 1, 1,
-0.7080979, 0.6822623, -2.59736, 1, 1, 1, 1, 1,
-0.6956901, 0.6334517, -1.197562, 1, 1, 1, 1, 1,
-0.692074, 0.8314175, 1.118067, 1, 1, 1, 1, 1,
-0.6839481, -1.009444, -3.977204, 1, 1, 1, 1, 1,
-0.6831846, -0.483098, -1.624108, 1, 1, 1, 1, 1,
-0.6770142, -1.603659, -2.670263, 1, 1, 1, 1, 1,
-0.6758781, -1.246195, -2.860925, 0, 0, 1, 1, 1,
-0.6666539, 0.1570336, -1.883211, 1, 0, 0, 1, 1,
-0.6645838, 0.9514517, -0.9138913, 1, 0, 0, 1, 1,
-0.6588545, -2.529918, -2.364213, 1, 0, 0, 1, 1,
-0.657889, -0.2421212, -1.885458, 1, 0, 0, 1, 1,
-0.6531479, -0.7963863, -3.120399, 1, 0, 0, 1, 1,
-0.6513212, 1.399783, -1.458475, 0, 0, 0, 1, 1,
-0.649811, 1.124531, -1.711009, 0, 0, 0, 1, 1,
-0.6456783, -2.014776, -3.774271, 0, 0, 0, 1, 1,
-0.6400225, -0.497696, -2.437575, 0, 0, 0, 1, 1,
-0.6382253, 0.7087832, -0.2121354, 0, 0, 0, 1, 1,
-0.6291244, 0.3339128, -0.9962794, 0, 0, 0, 1, 1,
-0.628262, 0.3320796, -1.740532, 0, 0, 0, 1, 1,
-0.6244148, -0.6969513, -2.971656, 1, 1, 1, 1, 1,
-0.6232083, 0.447284, -0.1038855, 1, 1, 1, 1, 1,
-0.6227672, 0.3394582, 0.3498463, 1, 1, 1, 1, 1,
-0.6179193, 1.303573, -0.9169632, 1, 1, 1, 1, 1,
-0.6175534, -1.233026, -3.648544, 1, 1, 1, 1, 1,
-0.6159719, 0.7292627, -2.085056, 1, 1, 1, 1, 1,
-0.6143805, -0.4598153, -2.668027, 1, 1, 1, 1, 1,
-0.6127731, -0.5370525, -0.04787829, 1, 1, 1, 1, 1,
-0.6099861, -0.1632377, -2.494622, 1, 1, 1, 1, 1,
-0.607828, -0.9949046, -1.908661, 1, 1, 1, 1, 1,
-0.6074376, 1.035162, -0.619198, 1, 1, 1, 1, 1,
-0.5974425, 0.370888, -0.5438149, 1, 1, 1, 1, 1,
-0.5962736, 1.197336, 0.2283635, 1, 1, 1, 1, 1,
-0.5926988, 1.089763, -0.04958781, 1, 1, 1, 1, 1,
-0.5894619, 0.2414114, -0.6509153, 1, 1, 1, 1, 1,
-0.5870736, 0.2699927, -0.8457537, 0, 0, 1, 1, 1,
-0.5816535, 1.332465, 0.190325, 1, 0, 0, 1, 1,
-0.5788582, -0.05913188, -2.142598, 1, 0, 0, 1, 1,
-0.5762343, 0.5483797, -1.313762, 1, 0, 0, 1, 1,
-0.56727, -0.1970773, -1.663898, 1, 0, 0, 1, 1,
-0.5627343, -0.6763445, -3.371426, 1, 0, 0, 1, 1,
-0.5591749, -0.3434581, 0.09297881, 0, 0, 0, 1, 1,
-0.5589212, -0.5794443, -3.062526, 0, 0, 0, 1, 1,
-0.5569165, -1.414543, -2.258439, 0, 0, 0, 1, 1,
-0.5498426, 0.769457, 0.3590887, 0, 0, 0, 1, 1,
-0.547559, -1.386234, -2.128982, 0, 0, 0, 1, 1,
-0.5469611, 3.246499, -0.224439, 0, 0, 0, 1, 1,
-0.5376023, -0.6729906, -4.145061, 0, 0, 0, 1, 1,
-0.5375578, -0.3410711, -2.813322, 1, 1, 1, 1, 1,
-0.5356645, 0.9028828, -0.5617183, 1, 1, 1, 1, 1,
-0.5277391, -0.07811064, -1.174551, 1, 1, 1, 1, 1,
-0.5267811, 0.9317636, -1.449235, 1, 1, 1, 1, 1,
-0.5253201, -0.1721623, -2.232152, 1, 1, 1, 1, 1,
-0.5250716, -1.512953, -4.112675, 1, 1, 1, 1, 1,
-0.5245623, -0.267733, -2.936061, 1, 1, 1, 1, 1,
-0.5220301, -0.3223353, -3.185295, 1, 1, 1, 1, 1,
-0.5203605, 0.6397415, -1.675221, 1, 1, 1, 1, 1,
-0.5181222, 1.972731, 0.5823863, 1, 1, 1, 1, 1,
-0.5164842, -0.6792427, -2.441346, 1, 1, 1, 1, 1,
-0.5154473, -1.64495, -2.793078, 1, 1, 1, 1, 1,
-0.5132319, 1.277294, 0.311246, 1, 1, 1, 1, 1,
-0.5100868, 0.6853591, -0.3441162, 1, 1, 1, 1, 1,
-0.49876, 0.345295, -1.167081, 1, 1, 1, 1, 1,
-0.4851677, -0.3734958, -1.669292, 0, 0, 1, 1, 1,
-0.4834601, -0.3174316, -4.086051, 1, 0, 0, 1, 1,
-0.4807671, -1.324002, -1.10367, 1, 0, 0, 1, 1,
-0.4797584, -0.4751262, -2.46982, 1, 0, 0, 1, 1,
-0.4757192, 0.6463887, -0.1945987, 1, 0, 0, 1, 1,
-0.4741304, -0.01377434, -1.989323, 1, 0, 0, 1, 1,
-0.4720083, 0.8448281, -0.4063079, 0, 0, 0, 1, 1,
-0.4702691, -0.8705775, -3.329722, 0, 0, 0, 1, 1,
-0.4672193, -2.781289, -4.327287, 0, 0, 0, 1, 1,
-0.4654459, 0.02719453, -1.571304, 0, 0, 0, 1, 1,
-0.4640602, 1.036457, -1.660565, 0, 0, 0, 1, 1,
-0.4607007, 0.787091, -1.007254, 0, 0, 0, 1, 1,
-0.4605369, -1.231916, -1.140537, 0, 0, 0, 1, 1,
-0.4604349, -0.2064946, -3.295692, 1, 1, 1, 1, 1,
-0.457123, -1.398663, -2.441224, 1, 1, 1, 1, 1,
-0.456436, -0.4879203, -3.067704, 1, 1, 1, 1, 1,
-0.456185, 0.1818828, -0.7631517, 1, 1, 1, 1, 1,
-0.4556403, -1.37049, -4.253203, 1, 1, 1, 1, 1,
-0.453986, -0.2352263, -2.367256, 1, 1, 1, 1, 1,
-0.4534439, 1.699377, 1.855923, 1, 1, 1, 1, 1,
-0.4437659, 0.4470158, -0.5661111, 1, 1, 1, 1, 1,
-0.4414177, 0.8603911, 1.548077, 1, 1, 1, 1, 1,
-0.4373661, -0.5664571, -3.390861, 1, 1, 1, 1, 1,
-0.4312294, 1.783452, -0.7676325, 1, 1, 1, 1, 1,
-0.4297284, -1.256336, -3.292384, 1, 1, 1, 1, 1,
-0.429457, -0.4557547, -2.379702, 1, 1, 1, 1, 1,
-0.4254509, -0.8714995, -1.280395, 1, 1, 1, 1, 1,
-0.4235686, 0.6356154, -0.7767851, 1, 1, 1, 1, 1,
-0.4212139, 1.297609, -0.5248371, 0, 0, 1, 1, 1,
-0.420633, 2.190551, 0.299083, 1, 0, 0, 1, 1,
-0.4072417, 0.899658, -0.7758752, 1, 0, 0, 1, 1,
-0.4033674, -1.564278, -2.512161, 1, 0, 0, 1, 1,
-0.4019949, -0.3633113, -2.644673, 1, 0, 0, 1, 1,
-0.3967067, 0.08121669, -2.591773, 1, 0, 0, 1, 1,
-0.3880722, 0.2448915, -1.316991, 0, 0, 0, 1, 1,
-0.3836142, 0.6939868, -0.5718728, 0, 0, 0, 1, 1,
-0.3825015, -0.03735219, -0.9980461, 0, 0, 0, 1, 1,
-0.381291, -0.3213, -2.163322, 0, 0, 0, 1, 1,
-0.3799204, -0.2648882, -2.232091, 0, 0, 0, 1, 1,
-0.3798716, 1.981085, 0.4892315, 0, 0, 0, 1, 1,
-0.3791894, -0.4250639, -0.4225308, 0, 0, 0, 1, 1,
-0.3770962, -0.4872577, -1.326189, 1, 1, 1, 1, 1,
-0.3745273, 0.0300164, -0.8270308, 1, 1, 1, 1, 1,
-0.3725914, -0.6635103, -1.843734, 1, 1, 1, 1, 1,
-0.3638549, 0.5281371, 1.086486, 1, 1, 1, 1, 1,
-0.3614363, 1.348924, 0.2453351, 1, 1, 1, 1, 1,
-0.3602984, 0.259588, -2.2733, 1, 1, 1, 1, 1,
-0.3555791, 0.4802079, -0.9902061, 1, 1, 1, 1, 1,
-0.3550234, 1.013556, -1.322223, 1, 1, 1, 1, 1,
-0.3546542, -0.4284055, -3.467595, 1, 1, 1, 1, 1,
-0.3530471, 0.63969, -1.476628, 1, 1, 1, 1, 1,
-0.3483932, -0.552602, -2.251161, 1, 1, 1, 1, 1,
-0.3469257, -1.651644, -2.067784, 1, 1, 1, 1, 1,
-0.3437811, -1.674895, -1.664151, 1, 1, 1, 1, 1,
-0.3360011, 0.8835367, -0.3377599, 1, 1, 1, 1, 1,
-0.3330598, -0.8687734, -0.5250707, 1, 1, 1, 1, 1,
-0.3149647, -1.739823, -4.263643, 0, 0, 1, 1, 1,
-0.3129551, -0.275729, -1.416069, 1, 0, 0, 1, 1,
-0.3122867, 0.5966172, -0.6824599, 1, 0, 0, 1, 1,
-0.3117338, -0.03317365, -3.724532, 1, 0, 0, 1, 1,
-0.3116449, -0.7928636, -0.4450524, 1, 0, 0, 1, 1,
-0.3104936, 0.03595478, -2.515435, 1, 0, 0, 1, 1,
-0.3101876, -0.4858718, -2.798363, 0, 0, 0, 1, 1,
-0.3064033, 2.073079, 0.7893168, 0, 0, 0, 1, 1,
-0.3060082, 0.05800173, -0.3871419, 0, 0, 0, 1, 1,
-0.3037769, -1.701893, -2.53533, 0, 0, 0, 1, 1,
-0.3031055, 0.2701359, -1.65598, 0, 0, 0, 1, 1,
-0.3022974, 1.416833, 0.5001538, 0, 0, 0, 1, 1,
-0.2965598, -0.3281856, -3.52156, 0, 0, 0, 1, 1,
-0.2931962, 0.710912, -0.5896555, 1, 1, 1, 1, 1,
-0.2914593, 0.3386365, 0.7593566, 1, 1, 1, 1, 1,
-0.2895911, 0.5130437, -0.8403103, 1, 1, 1, 1, 1,
-0.2877307, 1.029837, 0.5560016, 1, 1, 1, 1, 1,
-0.2858763, 0.3105907, -0.5118446, 1, 1, 1, 1, 1,
-0.2810353, -1.394289, -3.645531, 1, 1, 1, 1, 1,
-0.2797508, -0.6549347, -3.514984, 1, 1, 1, 1, 1,
-0.2789448, -1.510905, -1.881077, 1, 1, 1, 1, 1,
-0.2668501, -0.8417886, -3.725182, 1, 1, 1, 1, 1,
-0.2640429, 0.679001, 0.105019, 1, 1, 1, 1, 1,
-0.2632463, -1.230543, -2.954412, 1, 1, 1, 1, 1,
-0.2630948, -0.6873035, -4.303717, 1, 1, 1, 1, 1,
-0.2622491, 0.5340907, -0.7109841, 1, 1, 1, 1, 1,
-0.2553117, 0.2663342, -2.429546, 1, 1, 1, 1, 1,
-0.2553034, 0.3582703, -0.6818502, 1, 1, 1, 1, 1,
-0.2516029, 0.2072245, 0.921872, 0, 0, 1, 1, 1,
-0.2513433, -0.5224279, -1.419895, 1, 0, 0, 1, 1,
-0.248677, -2.367973, -2.547032, 1, 0, 0, 1, 1,
-0.2483136, -0.6016326, -2.568857, 1, 0, 0, 1, 1,
-0.2357826, 0.9641584, -1.243507, 1, 0, 0, 1, 1,
-0.2261582, -1.040614, -2.696717, 1, 0, 0, 1, 1,
-0.2219792, 1.47202, -0.0711318, 0, 0, 0, 1, 1,
-0.2207414, -0.3496763, -2.422565, 0, 0, 0, 1, 1,
-0.218343, -1.624941, -3.883724, 0, 0, 0, 1, 1,
-0.2165798, 0.03689342, -0.3804854, 0, 0, 0, 1, 1,
-0.2157545, 0.6802467, -0.5459343, 0, 0, 0, 1, 1,
-0.215478, -0.4511648, -2.87052, 0, 0, 0, 1, 1,
-0.2073634, 0.6985394, -1.692967, 0, 0, 0, 1, 1,
-0.2068165, -0.03464797, -1.069213, 1, 1, 1, 1, 1,
-0.205024, 1.698028, 0.8285296, 1, 1, 1, 1, 1,
-0.202414, 1.314334, -0.3505139, 1, 1, 1, 1, 1,
-0.2022437, -1.006831, -2.172643, 1, 1, 1, 1, 1,
-0.200892, 0.01984037, -1.666355, 1, 1, 1, 1, 1,
-0.1953846, -1.227332, -3.025236, 1, 1, 1, 1, 1,
-0.1907976, 0.8454815, 0.4985782, 1, 1, 1, 1, 1,
-0.1902272, 2.055526, 0.3405849, 1, 1, 1, 1, 1,
-0.1891433, -0.779922, -1.881172, 1, 1, 1, 1, 1,
-0.1782464, 1.54806, 0.9494321, 1, 1, 1, 1, 1,
-0.1768215, 0.6219037, 0.1092434, 1, 1, 1, 1, 1,
-0.1749419, 1.33378, 0.7917395, 1, 1, 1, 1, 1,
-0.172925, 1.119434, 0.6526248, 1, 1, 1, 1, 1,
-0.1708016, -0.7100915, -3.103491, 1, 1, 1, 1, 1,
-0.1701579, -0.6010881, -3.000144, 1, 1, 1, 1, 1,
-0.1697574, -0.9270818, -2.166864, 0, 0, 1, 1, 1,
-0.1640332, -0.5040703, -2.284507, 1, 0, 0, 1, 1,
-0.1624884, -2.231791, -2.22497, 1, 0, 0, 1, 1,
-0.1616001, -1.32102, -2.637727, 1, 0, 0, 1, 1,
-0.1603177, 1.327718, 0.9215915, 1, 0, 0, 1, 1,
-0.1590818, -0.3674032, -0.8553272, 1, 0, 0, 1, 1,
-0.1558074, -0.7160678, -2.108654, 0, 0, 0, 1, 1,
-0.1539688, 1.065351, -0.9835246, 0, 0, 0, 1, 1,
-0.1525182, -0.02957221, -1.555827, 0, 0, 0, 1, 1,
-0.1523334, 3.476039, 1.277704, 0, 0, 0, 1, 1,
-0.1516174, -0.5239955, -2.148607, 0, 0, 0, 1, 1,
-0.1483714, -0.6957555, -3.569829, 0, 0, 0, 1, 1,
-0.1434107, -0.9192879, -1.488685, 0, 0, 0, 1, 1,
-0.1419767, 0.6388055, 0.3839256, 1, 1, 1, 1, 1,
-0.1406546, -0.3072077, -2.503221, 1, 1, 1, 1, 1,
-0.1404887, -0.6943516, -3.488543, 1, 1, 1, 1, 1,
-0.134257, -0.7547024, -2.658796, 1, 1, 1, 1, 1,
-0.127488, -1.916062, -2.553447, 1, 1, 1, 1, 1,
-0.1239165, 1.013641, -1.212656, 1, 1, 1, 1, 1,
-0.1225635, 2.287431, -0.5229776, 1, 1, 1, 1, 1,
-0.1196937, 0.02435634, -1.723225, 1, 1, 1, 1, 1,
-0.1190751, -0.02489353, -1.678486, 1, 1, 1, 1, 1,
-0.1181909, -0.3701783, -3.146218, 1, 1, 1, 1, 1,
-0.1160653, -1.824494, -2.136475, 1, 1, 1, 1, 1,
-0.1112183, 2.306738, -0.7098018, 1, 1, 1, 1, 1,
-0.1097804, 0.4194496, 0.2895213, 1, 1, 1, 1, 1,
-0.1041517, 0.1625711, 0.4982047, 1, 1, 1, 1, 1,
-0.1010574, 0.5382553, 0.3616713, 1, 1, 1, 1, 1,
-0.09966353, 0.7530208, -0.4307109, 0, 0, 1, 1, 1,
-0.0974185, 0.4620287, -0.9120162, 1, 0, 0, 1, 1,
-0.09316072, -0.6933534, -3.378058, 1, 0, 0, 1, 1,
-0.09292142, 0.3811621, 0.01323672, 1, 0, 0, 1, 1,
-0.08972454, 1.30415, 1.330004, 1, 0, 0, 1, 1,
-0.08077656, -0.5959048, -4.826116, 1, 0, 0, 1, 1,
-0.08054096, 2.725799, 0.6602678, 0, 0, 0, 1, 1,
-0.08051936, -1.900877, -2.159285, 0, 0, 0, 1, 1,
-0.0767752, -0.5001187, -4.165459, 0, 0, 0, 1, 1,
-0.07553882, 1.688354, 0.9846604, 0, 0, 0, 1, 1,
-0.07545759, 0.683984, 0.6701674, 0, 0, 0, 1, 1,
-0.06925143, 0.3894705, -1.307573, 0, 0, 0, 1, 1,
-0.06463333, 1.527798, -0.8839567, 0, 0, 0, 1, 1,
-0.06267077, -1.778642, -4.807093, 1, 1, 1, 1, 1,
-0.05874956, -0.9263356, -2.969388, 1, 1, 1, 1, 1,
-0.0564165, -0.03003539, -3.350305, 1, 1, 1, 1, 1,
-0.05300268, 0.6999514, -1.906847, 1, 1, 1, 1, 1,
-0.05229976, -0.2163425, -2.164675, 1, 1, 1, 1, 1,
-0.0504997, -0.7616565, -2.905885, 1, 1, 1, 1, 1,
-0.04373629, -1.165149, -3.430014, 1, 1, 1, 1, 1,
-0.03358833, -1.281079, -3.037795, 1, 1, 1, 1, 1,
-0.02771408, -0.8778249, -3.885199, 1, 1, 1, 1, 1,
-0.02271539, 0.02724287, -0.1623397, 1, 1, 1, 1, 1,
-0.01466436, 2.004076, -0.8816451, 1, 1, 1, 1, 1,
-0.01223777, 0.3471582, 2.665532, 1, 1, 1, 1, 1,
-0.01002238, -0.5175648, -4.917543, 1, 1, 1, 1, 1,
-0.004622751, 0.6097136, 0.8919334, 1, 1, 1, 1, 1,
-0.001624585, -0.5157669, -2.318508, 1, 1, 1, 1, 1,
0.006023635, -2.030186, 3.436866, 0, 0, 1, 1, 1,
0.006333594, 0.04310253, -1.042163, 1, 0, 0, 1, 1,
0.007366122, -0.2031807, 2.843187, 1, 0, 0, 1, 1,
0.007765328, -1.612151, 2.946299, 1, 0, 0, 1, 1,
0.008537179, 0.2852688, -1.821628, 1, 0, 0, 1, 1,
0.009007471, 1.561815, 0.3806815, 1, 0, 0, 1, 1,
0.01017384, 1.838205, -0.4118474, 0, 0, 0, 1, 1,
0.0182361, -0.4518189, 3.862678, 0, 0, 0, 1, 1,
0.01852034, -0.5589257, 2.983283, 0, 0, 0, 1, 1,
0.02122949, 0.5689344, 0.3064195, 0, 0, 0, 1, 1,
0.02360784, 0.1781876, 0.06097733, 0, 0, 0, 1, 1,
0.02702714, -1.055334, 4.461821, 0, 0, 0, 1, 1,
0.03121091, -0.1037222, 3.264818, 0, 0, 0, 1, 1,
0.0321123, -1.485281, 1.872357, 1, 1, 1, 1, 1,
0.03330851, -0.7431564, 2.500276, 1, 1, 1, 1, 1,
0.03522494, 0.5333399, -0.3167015, 1, 1, 1, 1, 1,
0.03575266, 0.01525183, 0.6596557, 1, 1, 1, 1, 1,
0.0389316, -1.033382, 2.189566, 1, 1, 1, 1, 1,
0.04466002, 0.3410833, 0.2170187, 1, 1, 1, 1, 1,
0.0468448, -0.3207197, 2.790706, 1, 1, 1, 1, 1,
0.04723785, -0.6875659, 3.725967, 1, 1, 1, 1, 1,
0.05103227, 0.5294343, 1.293833, 1, 1, 1, 1, 1,
0.05463362, -1.16739, 1.932138, 1, 1, 1, 1, 1,
0.05530529, 0.3368429, -0.1489614, 1, 1, 1, 1, 1,
0.05664937, -0.03290446, 1.286869, 1, 1, 1, 1, 1,
0.05705268, 0.1597061, 1.650508, 1, 1, 1, 1, 1,
0.05717241, 0.260684, 0.6018495, 1, 1, 1, 1, 1,
0.05804754, -0.04087311, 3.022283, 1, 1, 1, 1, 1,
0.0609955, -1.899159, 2.548293, 0, 0, 1, 1, 1,
0.06246998, 0.0439744, 1.897242, 1, 0, 0, 1, 1,
0.06424369, 0.3105545, 2.434014, 1, 0, 0, 1, 1,
0.06431472, -1.822508, 3.161633, 1, 0, 0, 1, 1,
0.06553915, -0.1249961, 3.13525, 1, 0, 0, 1, 1,
0.06666438, 1.968692, 0.1813381, 1, 0, 0, 1, 1,
0.06693101, -1.779373, 2.198656, 0, 0, 0, 1, 1,
0.06995876, -0.4434983, 2.355199, 0, 0, 0, 1, 1,
0.07102021, 0.5569165, -1.427709, 0, 0, 0, 1, 1,
0.07532808, -0.5004159, 1.498818, 0, 0, 0, 1, 1,
0.07730225, 1.56682, -0.7653058, 0, 0, 0, 1, 1,
0.07738791, 0.46908, 1.5201, 0, 0, 0, 1, 1,
0.08011838, 1.277936, 2.640041, 0, 0, 0, 1, 1,
0.08082006, -0.244757, 2.834476, 1, 1, 1, 1, 1,
0.08298627, -0.1931878, 3.640459, 1, 1, 1, 1, 1,
0.08507207, 0.09579497, 3.006889, 1, 1, 1, 1, 1,
0.08566728, -2.02054, 2.910358, 1, 1, 1, 1, 1,
0.08607686, -0.6818896, 2.121964, 1, 1, 1, 1, 1,
0.08714586, 0.6062471, 0.4518776, 1, 1, 1, 1, 1,
0.09046928, -0.7012767, 3.661756, 1, 1, 1, 1, 1,
0.09141981, -1.086084, 2.91552, 1, 1, 1, 1, 1,
0.09253927, -0.2072079, 3.591985, 1, 1, 1, 1, 1,
0.09908912, -0.4682191, 3.068593, 1, 1, 1, 1, 1,
0.106957, -0.8362192, 1.955708, 1, 1, 1, 1, 1,
0.1093539, -0.1604836, 4.175238, 1, 1, 1, 1, 1,
0.1111054, -0.5159368, 2.822387, 1, 1, 1, 1, 1,
0.1114996, 0.5285439, -0.5167701, 1, 1, 1, 1, 1,
0.1182612, -1.127346, 2.856549, 1, 1, 1, 1, 1,
0.1215458, -0.1289946, 2.074084, 0, 0, 1, 1, 1,
0.1243054, -0.328729, 4.436924, 1, 0, 0, 1, 1,
0.1251612, -0.5023119, 3.321609, 1, 0, 0, 1, 1,
0.1286374, 2.049286, -0.2397394, 1, 0, 0, 1, 1,
0.1300529, -0.3054114, 2.250818, 1, 0, 0, 1, 1,
0.1325341, -2.903556, 4.252812, 1, 0, 0, 1, 1,
0.136188, 0.9646025, -1.047303, 0, 0, 0, 1, 1,
0.1369852, -0.8584831, 3.099588, 0, 0, 0, 1, 1,
0.1394161, -0.2356672, 2.306653, 0, 0, 0, 1, 1,
0.1412842, -0.7739561, 2.508284, 0, 0, 0, 1, 1,
0.1423268, 0.7086564, -0.8139939, 0, 0, 0, 1, 1,
0.1475738, 1.205982, -0.5468852, 0, 0, 0, 1, 1,
0.1530998, -0.2062724, 1.594548, 0, 0, 0, 1, 1,
0.1546135, -1.276656, 3.167104, 1, 1, 1, 1, 1,
0.1555882, 0.1109967, 1.681931, 1, 1, 1, 1, 1,
0.1603766, -1.875426, 1.80825, 1, 1, 1, 1, 1,
0.1642958, 1.208799, -1.778225, 1, 1, 1, 1, 1,
0.1644584, -1.518598, 3.726624, 1, 1, 1, 1, 1,
0.1717748, 0.2192808, 1.12975, 1, 1, 1, 1, 1,
0.1756193, 0.6373314, 0.8337603, 1, 1, 1, 1, 1,
0.1791679, -0.5622057, 2.27933, 1, 1, 1, 1, 1,
0.1800909, -0.3179885, 1.994776, 1, 1, 1, 1, 1,
0.1802915, 0.4509038, 0.2520843, 1, 1, 1, 1, 1,
0.1812337, 0.3518519, -0.8985538, 1, 1, 1, 1, 1,
0.1815506, 1.489347, -0.0779869, 1, 1, 1, 1, 1,
0.1858718, -0.9768279, 4.547342, 1, 1, 1, 1, 1,
0.1891261, 1.897924, 1.475725, 1, 1, 1, 1, 1,
0.1892213, 0.3216798, 0.4010847, 1, 1, 1, 1, 1,
0.1903168, 0.3349827, 1.747144, 0, 0, 1, 1, 1,
0.1904608, 0.1918058, 1.477141, 1, 0, 0, 1, 1,
0.1927395, 0.2228949, 0.578173, 1, 0, 0, 1, 1,
0.1992179, 0.5865053, -0.7243416, 1, 0, 0, 1, 1,
0.1994994, -0.6454654, 4.706868, 1, 0, 0, 1, 1,
0.2016581, 1.352875, 1.163451, 1, 0, 0, 1, 1,
0.2162809, 1.398124, 0.654299, 0, 0, 0, 1, 1,
0.2171178, 0.77803, -0.9762968, 0, 0, 0, 1, 1,
0.2217202, -0.508029, 1.851364, 0, 0, 0, 1, 1,
0.2262027, -1.047747, 2.27935, 0, 0, 0, 1, 1,
0.2359446, 0.2604023, 1.315863, 0, 0, 0, 1, 1,
0.245345, -0.1630133, 2.453773, 0, 0, 0, 1, 1,
0.2469899, 1.270352, 1.030671, 0, 0, 0, 1, 1,
0.2528528, -0.5598957, 2.000466, 1, 1, 1, 1, 1,
0.2558464, 0.07603683, 0.1859484, 1, 1, 1, 1, 1,
0.2583254, 0.6114658, -0.589807, 1, 1, 1, 1, 1,
0.2660583, 1.373037, -0.5201206, 1, 1, 1, 1, 1,
0.2693106, 0.595404, 1.700691, 1, 1, 1, 1, 1,
0.2738555, -1.33011, 2.032853, 1, 1, 1, 1, 1,
0.2806704, -1.224302, 4.296041, 1, 1, 1, 1, 1,
0.2817911, 0.1187322, 0.8076956, 1, 1, 1, 1, 1,
0.2832214, 0.3365388, 2.738702, 1, 1, 1, 1, 1,
0.2850001, -1.987827, 3.207771, 1, 1, 1, 1, 1,
0.2869898, -0.6639138, 0.9907166, 1, 1, 1, 1, 1,
0.2887664, -1.38578, 1.807057, 1, 1, 1, 1, 1,
0.2960627, 1.251219, 0.03951561, 1, 1, 1, 1, 1,
0.2980629, -0.7660938, 4.675293, 1, 1, 1, 1, 1,
0.3014977, 0.5545698, 0.86263, 1, 1, 1, 1, 1,
0.302295, 2.039178, 0.4607045, 0, 0, 1, 1, 1,
0.3093823, 0.5028194, 1.615551, 1, 0, 0, 1, 1,
0.3114291, 0.06929722, 2.776618, 1, 0, 0, 1, 1,
0.3117705, -0.2477151, 2.634401, 1, 0, 0, 1, 1,
0.3138242, -1.526621, 0.5996411, 1, 0, 0, 1, 1,
0.3147474, 0.05849969, 2.353978, 1, 0, 0, 1, 1,
0.3171568, 2.66449, -0.07931334, 0, 0, 0, 1, 1,
0.3203534, 1.688691, 0.8942218, 0, 0, 0, 1, 1,
0.3248228, -1.436321, 2.100029, 0, 0, 0, 1, 1,
0.329391, -0.8438165, 3.368547, 0, 0, 0, 1, 1,
0.3302983, -1.502421, 2.788944, 0, 0, 0, 1, 1,
0.3311559, -0.1846842, 2.157783, 0, 0, 0, 1, 1,
0.3313376, 0.2055338, 3.007362, 0, 0, 0, 1, 1,
0.3315174, -1.030336, 2.21223, 1, 1, 1, 1, 1,
0.3345737, -0.3373445, 2.927253, 1, 1, 1, 1, 1,
0.3350505, -1.188177, 4.259367, 1, 1, 1, 1, 1,
0.3360234, 1.071919, -0.6336718, 1, 1, 1, 1, 1,
0.3382442, 0.4920588, 0.3379107, 1, 1, 1, 1, 1,
0.3401531, -0.06338234, 2.6985, 1, 1, 1, 1, 1,
0.3453593, -0.8945566, 0.5606635, 1, 1, 1, 1, 1,
0.3459026, 0.1139104, 1.787073, 1, 1, 1, 1, 1,
0.3459996, -1.070235, 3.495879, 1, 1, 1, 1, 1,
0.3461469, -0.5669396, 3.234161, 1, 1, 1, 1, 1,
0.3538806, -0.02367358, 2.418294, 1, 1, 1, 1, 1,
0.3542558, 0.07529322, 0.8979536, 1, 1, 1, 1, 1,
0.3562229, -0.4917805, 2.693448, 1, 1, 1, 1, 1,
0.3566167, -0.6962776, 3.05505, 1, 1, 1, 1, 1,
0.3641086, 1.154148, 0.3900886, 1, 1, 1, 1, 1,
0.3664, 0.9338968, -0.02894667, 0, 0, 1, 1, 1,
0.3675036, -0.2638298, 3.504977, 1, 0, 0, 1, 1,
0.3746668, 0.008539513, 1.348531, 1, 0, 0, 1, 1,
0.3782366, -1.778792, 2.157959, 1, 0, 0, 1, 1,
0.3799623, 0.2503436, 2.612142, 1, 0, 0, 1, 1,
0.3828893, 0.3441715, 0.01891378, 1, 0, 0, 1, 1,
0.3839271, -1.104349, 3.21953, 0, 0, 0, 1, 1,
0.3847001, -0.8426918, 4.367625, 0, 0, 0, 1, 1,
0.3852755, 1.718896, 1.076054, 0, 0, 0, 1, 1,
0.3858113, 0.4102091, -0.6394618, 0, 0, 0, 1, 1,
0.39612, 0.9914238, 2.055101, 0, 0, 0, 1, 1,
0.3973273, -0.1078336, 1.602438, 0, 0, 0, 1, 1,
0.3993672, -0.1417573, 1.123593, 0, 0, 0, 1, 1,
0.4048034, 0.2112308, 2.787049, 1, 1, 1, 1, 1,
0.4072978, 0.7049924, -0.6159789, 1, 1, 1, 1, 1,
0.4130644, -1.023988, 1.498232, 1, 1, 1, 1, 1,
0.4170032, -0.6741254, 0.3948539, 1, 1, 1, 1, 1,
0.4170102, 0.4395291, 2.086714, 1, 1, 1, 1, 1,
0.4175991, -2.189144, 3.823007, 1, 1, 1, 1, 1,
0.4193307, 0.05355877, 1.787346, 1, 1, 1, 1, 1,
0.4210967, 0.2407796, 0.05598435, 1, 1, 1, 1, 1,
0.4222143, -1.120734, 2.480978, 1, 1, 1, 1, 1,
0.422967, -0.4069504, 0.4579208, 1, 1, 1, 1, 1,
0.4277998, -0.1135837, 3.183528, 1, 1, 1, 1, 1,
0.4311214, 0.6736193, 0.3914367, 1, 1, 1, 1, 1,
0.4351048, -0.4271817, 3.039584, 1, 1, 1, 1, 1,
0.4351166, -0.2853813, 3.569606, 1, 1, 1, 1, 1,
0.4352507, -1.106228, 3.158613, 1, 1, 1, 1, 1,
0.4380765, 1.750586, -0.9410529, 0, 0, 1, 1, 1,
0.4410276, -0.6357011, 1.650332, 1, 0, 0, 1, 1,
0.4413751, 0.8884444, 0.8441426, 1, 0, 0, 1, 1,
0.4416141, -0.8121915, 3.822705, 1, 0, 0, 1, 1,
0.4432293, 1.353038, -0.4730131, 1, 0, 0, 1, 1,
0.4452718, 0.3767245, 0.8618906, 1, 0, 0, 1, 1,
0.4461192, 1.028553, -0.0913673, 0, 0, 0, 1, 1,
0.4475749, 0.396777, 2.56503, 0, 0, 0, 1, 1,
0.4597878, -1.093037, 0.986303, 0, 0, 0, 1, 1,
0.4626588, -0.6125329, 1.687126, 0, 0, 0, 1, 1,
0.463848, 0.3488606, -0.1470362, 0, 0, 0, 1, 1,
0.4641649, -1.066671, 1.525529, 0, 0, 0, 1, 1,
0.4673861, 0.2452931, 1.879049, 0, 0, 0, 1, 1,
0.4708366, 0.2350645, 1.714476, 1, 1, 1, 1, 1,
0.4711601, 0.02668352, 0.9595048, 1, 1, 1, 1, 1,
0.4767717, 1.260129, -0.2343261, 1, 1, 1, 1, 1,
0.4815347, -0.4623212, 2.854387, 1, 1, 1, 1, 1,
0.4833315, -0.9557497, 2.657097, 1, 1, 1, 1, 1,
0.4924056, -0.6796834, 3.36968, 1, 1, 1, 1, 1,
0.4925302, -0.2517855, 2.360134, 1, 1, 1, 1, 1,
0.4931965, 0.6463897, 0.7030523, 1, 1, 1, 1, 1,
0.4933284, -0.1247728, 0.1721488, 1, 1, 1, 1, 1,
0.4936502, 0.184175, 0.01508236, 1, 1, 1, 1, 1,
0.505286, -0.4226421, 3.109862, 1, 1, 1, 1, 1,
0.5077763, 0.1958143, 0.2982185, 1, 1, 1, 1, 1,
0.509919, -0.2515857, 2.009612, 1, 1, 1, 1, 1,
0.5115444, 1.103476, -0.8167366, 1, 1, 1, 1, 1,
0.5133792, 0.08226307, 2.5308, 1, 1, 1, 1, 1,
0.5148689, 0.8974267, -0.3059988, 0, 0, 1, 1, 1,
0.5164763, -1.762627, 1.870611, 1, 0, 0, 1, 1,
0.52009, 0.4625278, 0.6463382, 1, 0, 0, 1, 1,
0.5230408, -0.7105523, 1.668983, 1, 0, 0, 1, 1,
0.5234476, 0.6033487, 0.9827429, 1, 0, 0, 1, 1,
0.523482, -1.336507, 1.655592, 1, 0, 0, 1, 1,
0.5243648, 1.020083, 1.489945, 0, 0, 0, 1, 1,
0.526666, -0.484367, 2.891631, 0, 0, 0, 1, 1,
0.5271775, 0.7802548, -0.1949346, 0, 0, 0, 1, 1,
0.5277137, -1.367177, 3.060162, 0, 0, 0, 1, 1,
0.5287924, -2.564719, 4.382643, 0, 0, 0, 1, 1,
0.5298617, 2.056211, 1.180106, 0, 0, 0, 1, 1,
0.5312309, 0.9559844, 0.9445592, 0, 0, 0, 1, 1,
0.5317223, 0.6985286, 0.4967276, 1, 1, 1, 1, 1,
0.5336897, -2.227273, 2.890268, 1, 1, 1, 1, 1,
0.5414284, -1.90665, 2.204574, 1, 1, 1, 1, 1,
0.5417239, 0.7508689, -0.2334728, 1, 1, 1, 1, 1,
0.5421422, -0.7572023, 2.381082, 1, 1, 1, 1, 1,
0.544324, 1.841719, -1.283211, 1, 1, 1, 1, 1,
0.5474484, 0.827719, -2.390159, 1, 1, 1, 1, 1,
0.5476336, -1.517584, 2.697855, 1, 1, 1, 1, 1,
0.549145, 0.4273101, 1.546999, 1, 1, 1, 1, 1,
0.5495957, -2.282142, 2.755445, 1, 1, 1, 1, 1,
0.5523586, 2.298489, 0.8685034, 1, 1, 1, 1, 1,
0.5550005, -0.9997427, 4.076265, 1, 1, 1, 1, 1,
0.5570385, 1.021391, -0.03144475, 1, 1, 1, 1, 1,
0.5603038, -0.3211738, 2.928845, 1, 1, 1, 1, 1,
0.5605862, 1.294691, 0.1209814, 1, 1, 1, 1, 1,
0.5679272, -0.05753759, 0.3650531, 0, 0, 1, 1, 1,
0.5680741, 0.3874624, 1.626947, 1, 0, 0, 1, 1,
0.5687916, -0.724111, 3.200937, 1, 0, 0, 1, 1,
0.5712582, 0.2812086, 1.636376, 1, 0, 0, 1, 1,
0.5755374, -1.010754, 3.219486, 1, 0, 0, 1, 1,
0.5837189, -0.8693624, 3.243168, 1, 0, 0, 1, 1,
0.5839577, -1.681125, 0.7565951, 0, 0, 0, 1, 1,
0.5845915, -1.493771, 3.851833, 0, 0, 0, 1, 1,
0.5848624, 0.5518071, 0.08234446, 0, 0, 0, 1, 1,
0.5863422, 0.7108891, 0.4830947, 0, 0, 0, 1, 1,
0.5888042, -0.6559112, 1.581517, 0, 0, 0, 1, 1,
0.5917447, -0.7720342, 2.290849, 0, 0, 0, 1, 1,
0.5954853, 0.7851927, 0.5369888, 0, 0, 0, 1, 1,
0.5991915, 0.3429013, 1.349172, 1, 1, 1, 1, 1,
0.5996491, 0.194536, 2.275213, 1, 1, 1, 1, 1,
0.6032693, -1.183087, 0.665489, 1, 1, 1, 1, 1,
0.6140077, -0.5731337, 3.793948, 1, 1, 1, 1, 1,
0.6146746, 1.611741, 1.102729, 1, 1, 1, 1, 1,
0.6175728, -0.5879766, 2.738817, 1, 1, 1, 1, 1,
0.6186635, 0.145349, 0.564139, 1, 1, 1, 1, 1,
0.6201092, 0.5378975, 2.901637, 1, 1, 1, 1, 1,
0.6257123, 0.4351665, 0.9115326, 1, 1, 1, 1, 1,
0.6290136, 1.78919, -0.04964735, 1, 1, 1, 1, 1,
0.6301021, -0.4004392, 1.313609, 1, 1, 1, 1, 1,
0.6336697, -0.04354158, 1.775684, 1, 1, 1, 1, 1,
0.6367326, 0.7208077, 1.238264, 1, 1, 1, 1, 1,
0.6460763, 2.400352, -0.004127856, 1, 1, 1, 1, 1,
0.6470102, 0.134762, -0.07176191, 1, 1, 1, 1, 1,
0.6480756, -0.8229182, 3.749797, 0, 0, 1, 1, 1,
0.6487489, 0.9595945, 1.178848, 1, 0, 0, 1, 1,
0.6543983, -0.02787287, 1.432423, 1, 0, 0, 1, 1,
0.6545814, 0.1341204, 1.806122, 1, 0, 0, 1, 1,
0.6561589, -0.6591491, 2.592322, 1, 0, 0, 1, 1,
0.6563872, -1.042932, 2.393446, 1, 0, 0, 1, 1,
0.6570318, -1.369528, 2.742397, 0, 0, 0, 1, 1,
0.6601685, -0.08139335, 0.5250138, 0, 0, 0, 1, 1,
0.6646072, 0.1166588, 1.666392, 0, 0, 0, 1, 1,
0.6682575, 0.5916196, 1.111083, 0, 0, 0, 1, 1,
0.6716908, 0.3420104, 2.074452, 0, 0, 0, 1, 1,
0.6719589, -0.4952762, 3.097053, 0, 0, 0, 1, 1,
0.6804001, 0.4325309, -1.396367, 0, 0, 0, 1, 1,
0.690415, -0.557658, -0.1101014, 1, 1, 1, 1, 1,
0.6940611, -0.7172139, 1.120023, 1, 1, 1, 1, 1,
0.6941919, 0.3396219, -0.3269124, 1, 1, 1, 1, 1,
0.6971145, 1.315717, 2.27982, 1, 1, 1, 1, 1,
0.7007312, -0.3977984, 3.184031, 1, 1, 1, 1, 1,
0.7049023, 0.1851759, 2.277388, 1, 1, 1, 1, 1,
0.7062321, -0.5134067, 2.058951, 1, 1, 1, 1, 1,
0.7066306, -0.4180222, 1.271198, 1, 1, 1, 1, 1,
0.7141554, -0.03332366, 1.203398, 1, 1, 1, 1, 1,
0.7149818, 2.579398, -1.910641, 1, 1, 1, 1, 1,
0.7174504, -1.392499, 2.526724, 1, 1, 1, 1, 1,
0.7176396, 0.505258, 2.378163, 1, 1, 1, 1, 1,
0.7204691, -0.7282865, 3.120092, 1, 1, 1, 1, 1,
0.7211921, 0.9982505, 0.3693897, 1, 1, 1, 1, 1,
0.7294595, 0.5379961, 1.195514, 1, 1, 1, 1, 1,
0.7368414, 1.003384, 1.593907, 0, 0, 1, 1, 1,
0.737172, 1.402077, 2.101042, 1, 0, 0, 1, 1,
0.7503347, 0.4216844, 1.799046, 1, 0, 0, 1, 1,
0.7567077, 0.4977658, 2.462977, 1, 0, 0, 1, 1,
0.7588763, 0.6974033, -0.5237133, 1, 0, 0, 1, 1,
0.7647561, -1.44342, 4.615084, 1, 0, 0, 1, 1,
0.7682772, -0.833341, 2.165386, 0, 0, 0, 1, 1,
0.7696547, 0.5577673, 1.629293, 0, 0, 0, 1, 1,
0.76976, -1.409369, 1.731016, 0, 0, 0, 1, 1,
0.7721526, -0.07320868, 1.991888, 0, 0, 0, 1, 1,
0.7742004, 0.3499489, 2.105708, 0, 0, 0, 1, 1,
0.7790403, -1.126513, 2.197881, 0, 0, 0, 1, 1,
0.7802154, 1.592447, 1.752722, 0, 0, 0, 1, 1,
0.7824411, 1.705734, 1.23655, 1, 1, 1, 1, 1,
0.7862414, -0.5029064, 1.51997, 1, 1, 1, 1, 1,
0.7863618, -1.148079, 2.491518, 1, 1, 1, 1, 1,
0.7894076, -0.8060865, 3.449444, 1, 1, 1, 1, 1,
0.7897109, 0.05058941, 3.040906, 1, 1, 1, 1, 1,
0.7909982, -0.5422601, 3.716993, 1, 1, 1, 1, 1,
0.8003553, 1.289277, 0.7310741, 1, 1, 1, 1, 1,
0.8060104, 1.361103, 0.9061616, 1, 1, 1, 1, 1,
0.8102357, -1.011035, 0.1950697, 1, 1, 1, 1, 1,
0.8138883, 2.059337, 0.7932374, 1, 1, 1, 1, 1,
0.8215689, 1.156014, 2.267259, 1, 1, 1, 1, 1,
0.8241624, 0.730037, 1.759959, 1, 1, 1, 1, 1,
0.8243384, 0.3626024, 0.987665, 1, 1, 1, 1, 1,
0.8266556, -1.362365, 2.69754, 1, 1, 1, 1, 1,
0.8273423, -0.1828474, 1.035109, 1, 1, 1, 1, 1,
0.8295936, 1.019902, 1.854899, 0, 0, 1, 1, 1,
0.8311102, -0.2850108, 2.204928, 1, 0, 0, 1, 1,
0.8323718, 0.247051, 0.7906366, 1, 0, 0, 1, 1,
0.8342844, -0.2218513, 2.119929, 1, 0, 0, 1, 1,
0.8360738, -2.422566, 1.594383, 1, 0, 0, 1, 1,
0.8365481, 0.7018837, 0.7477296, 1, 0, 0, 1, 1,
0.8374216, 1.309699, 2.625748, 0, 0, 0, 1, 1,
0.8388721, -0.03869746, 0.582619, 0, 0, 0, 1, 1,
0.839447, -0.1868257, 1.735443, 0, 0, 0, 1, 1,
0.8440335, -0.8614339, 3.182145, 0, 0, 0, 1, 1,
0.8471497, 0.363124, -0.04447871, 0, 0, 0, 1, 1,
0.8484358, -0.2699352, 2.716719, 0, 0, 0, 1, 1,
0.8489304, 0.6895248, 0.705366, 0, 0, 0, 1, 1,
0.8540667, -2.191398, 2.654325, 1, 1, 1, 1, 1,
0.8583996, 0.05186911, 0.958259, 1, 1, 1, 1, 1,
0.8618013, 1.257205, -0.5121541, 1, 1, 1, 1, 1,
0.8654592, 1.060641, -0.2296347, 1, 1, 1, 1, 1,
0.8686007, -1.649744, 2.380975, 1, 1, 1, 1, 1,
0.8697619, 0.9209938, -1.088089, 1, 1, 1, 1, 1,
0.8703461, -0.7328086, 3.150387, 1, 1, 1, 1, 1,
0.8719515, 0.968852, 2.109436, 1, 1, 1, 1, 1,
0.8738275, -1.396984, 3.599146, 1, 1, 1, 1, 1,
0.8750582, -1.343889, 4.805682, 1, 1, 1, 1, 1,
0.8796358, 0.7989489, 1.211988, 1, 1, 1, 1, 1,
0.8798726, 0.9944023, 0.817515, 1, 1, 1, 1, 1,
0.8809262, 0.3052711, 2.139684, 1, 1, 1, 1, 1,
0.8834316, 0.1378486, 0.7678601, 1, 1, 1, 1, 1,
0.884559, 0.4074613, 0.3455187, 1, 1, 1, 1, 1,
0.8926916, -0.4179193, 3.275757, 0, 0, 1, 1, 1,
0.8934909, 0.5739958, 0.2478088, 1, 0, 0, 1, 1,
0.8935724, 1.642554, 1.204084, 1, 0, 0, 1, 1,
0.895821, -0.8662296, 1.773093, 1, 0, 0, 1, 1,
0.8975535, -0.8668019, -0.1339618, 1, 0, 0, 1, 1,
0.8980817, -0.06658791, 2.166037, 1, 0, 0, 1, 1,
0.9072318, 0.5622451, 0.1296039, 0, 0, 0, 1, 1,
0.9111381, -1.603932, 1.410462, 0, 0, 0, 1, 1,
0.9175251, 0.518625, 1.395772, 0, 0, 0, 1, 1,
0.9210178, -0.6241873, 1.54152, 0, 0, 0, 1, 1,
0.9260072, -0.5074733, 2.170419, 0, 0, 0, 1, 1,
0.9275652, 1.884801, 0.9688027, 0, 0, 0, 1, 1,
0.92865, -1.693453, 2.265946, 0, 0, 0, 1, 1,
0.9415163, 1.536354, 2.080384, 1, 1, 1, 1, 1,
0.9482654, 1.393189, 0.3347538, 1, 1, 1, 1, 1,
0.9601823, 0.1804338, 1.663884, 1, 1, 1, 1, 1,
0.964312, 0.1966247, 0.9840011, 1, 1, 1, 1, 1,
0.9682321, 1.262596, 1.857429, 1, 1, 1, 1, 1,
0.9699144, -1.765935, 1.562945, 1, 1, 1, 1, 1,
0.9736658, 2.404224, 0.03810698, 1, 1, 1, 1, 1,
0.9760957, 1.006572, -0.3429945, 1, 1, 1, 1, 1,
0.9771587, 0.9169624, 1.77872, 1, 1, 1, 1, 1,
0.999147, -0.003863996, 2.395849, 1, 1, 1, 1, 1,
0.9995656, -0.1436936, 0.7071131, 1, 1, 1, 1, 1,
1.001054, 0.6933789, -0.0746506, 1, 1, 1, 1, 1,
1.00484, -0.2359869, -0.4501397, 1, 1, 1, 1, 1,
1.007166, 0.9957707, -0.8512897, 1, 1, 1, 1, 1,
1.009842, -1.159215, 2.080479, 1, 1, 1, 1, 1,
1.010636, 0.1672028, 0.8755549, 0, 0, 1, 1, 1,
1.011534, 0.796133, 0.0446534, 1, 0, 0, 1, 1,
1.024959, -0.065965, 2.412697, 1, 0, 0, 1, 1,
1.026513, -1.350278, 2.282596, 1, 0, 0, 1, 1,
1.026771, 0.2112909, 1.596418, 1, 0, 0, 1, 1,
1.033458, -0.5311646, 4.497013, 1, 0, 0, 1, 1,
1.034612, 2.210627, 0.4584296, 0, 0, 0, 1, 1,
1.04112, -0.8519722, 3.016189, 0, 0, 0, 1, 1,
1.04325, -0.7294191, 1.908813, 0, 0, 0, 1, 1,
1.04736, 0.8552961, 0.4940673, 0, 0, 0, 1, 1,
1.050854, -0.9392337, 2.14532, 0, 0, 0, 1, 1,
1.053695, 1.447668, 2.146159, 0, 0, 0, 1, 1,
1.062623, 0.2542547, -0.5038134, 0, 0, 0, 1, 1,
1.071323, 0.664835, 0.6855718, 1, 1, 1, 1, 1,
1.078678, 1.634924, 0.6940062, 1, 1, 1, 1, 1,
1.084033, -1.047551, 3.104899, 1, 1, 1, 1, 1,
1.08582, -0.1187554, 0.4561443, 1, 1, 1, 1, 1,
1.087066, 0.7230072, -0.3974974, 1, 1, 1, 1, 1,
1.096681, -0.4506623, 3.490574, 1, 1, 1, 1, 1,
1.098563, 0.5111628, 1.272219, 1, 1, 1, 1, 1,
1.103887, 2.254924, 0.9981634, 1, 1, 1, 1, 1,
1.107044, -1.182933, 0.6138269, 1, 1, 1, 1, 1,
1.108119, 0.7322593, 0.9756976, 1, 1, 1, 1, 1,
1.109584, -0.7569526, 2.821649, 1, 1, 1, 1, 1,
1.116091, 0.7362181, 1.242931, 1, 1, 1, 1, 1,
1.117915, -1.017629, 1.837818, 1, 1, 1, 1, 1,
1.121068, 2.151205, 1.259609, 1, 1, 1, 1, 1,
1.123422, 1.013099, 0.4183066, 1, 1, 1, 1, 1,
1.124959, -1.168767, 0.1214502, 0, 0, 1, 1, 1,
1.128518, 2.593912, 0.2236393, 1, 0, 0, 1, 1,
1.128525, 0.5968383, 1.550535, 1, 0, 0, 1, 1,
1.13054, -0.1245825, -0.2008087, 1, 0, 0, 1, 1,
1.130704, -1.13369, 3.950267, 1, 0, 0, 1, 1,
1.137913, -0.7661997, 1.641617, 1, 0, 0, 1, 1,
1.13804, 0.09130073, 1.587808, 0, 0, 0, 1, 1,
1.139069, 1.325968, 1.691252, 0, 0, 0, 1, 1,
1.142847, 1.358324, 0.1744185, 0, 0, 0, 1, 1,
1.144446, 0.2399211, 2.104835, 0, 0, 0, 1, 1,
1.149368, -0.5612686, 1.959301, 0, 0, 0, 1, 1,
1.151227, -1.610893, 3.230307, 0, 0, 0, 1, 1,
1.159228, -1.909561, 2.290843, 0, 0, 0, 1, 1,
1.161925, 0.3637255, 0.9802312, 1, 1, 1, 1, 1,
1.194132, 0.7084625, 1.068378, 1, 1, 1, 1, 1,
1.197988, 0.7744563, 1.952221, 1, 1, 1, 1, 1,
1.201024, -1.185014, 3.054911, 1, 1, 1, 1, 1,
1.211157, -0.6987578, 2.625384, 1, 1, 1, 1, 1,
1.215433, 0.9035025, -1.101613, 1, 1, 1, 1, 1,
1.218937, 0.03135309, 2.595826, 1, 1, 1, 1, 1,
1.226614, 0.3801001, 1.734003, 1, 1, 1, 1, 1,
1.226841, -0.2091273, 1.110316, 1, 1, 1, 1, 1,
1.23341, 0.4564066, 0.5902843, 1, 1, 1, 1, 1,
1.236242, 0.6396314, 1.765286, 1, 1, 1, 1, 1,
1.251838, 1.444205, 1.937232, 1, 1, 1, 1, 1,
1.256624, -0.8156966, 1.802051, 1, 1, 1, 1, 1,
1.261873, 1.405394, 1.444101, 1, 1, 1, 1, 1,
1.262963, 0.7145824, 1.200559, 1, 1, 1, 1, 1,
1.265035, 0.8794615, 1.483383, 0, 0, 1, 1, 1,
1.268792, -0.1657578, 0.1267573, 1, 0, 0, 1, 1,
1.268983, -0.7952156, 1.847985, 1, 0, 0, 1, 1,
1.270162, -0.6853347, 0.1742603, 1, 0, 0, 1, 1,
1.273739, -0.6768779, 1.024863, 1, 0, 0, 1, 1,
1.283192, 0.3094344, 2.427768, 1, 0, 0, 1, 1,
1.297708, -0.01349004, 3.438148, 0, 0, 0, 1, 1,
1.297825, -0.2272848, 1.772257, 0, 0, 0, 1, 1,
1.303873, 0.4206972, 1.089098, 0, 0, 0, 1, 1,
1.305631, 2.445896, 1.163222, 0, 0, 0, 1, 1,
1.306388, -0.3296989, 1.706129, 0, 0, 0, 1, 1,
1.310721, -0.06428163, 2.47049, 0, 0, 0, 1, 1,
1.314926, 0.05519088, 2.922735, 0, 0, 0, 1, 1,
1.339367, 0.2577735, 2.782671, 1, 1, 1, 1, 1,
1.340598, -0.2540652, 0.1115887, 1, 1, 1, 1, 1,
1.345491, -0.5089095, 1.570815, 1, 1, 1, 1, 1,
1.34589, -0.8154283, 3.140536, 1, 1, 1, 1, 1,
1.354917, 0.8260069, 1.973856, 1, 1, 1, 1, 1,
1.371047, 1.149672, 1.382401, 1, 1, 1, 1, 1,
1.373032, -0.6378561, 3.168436, 1, 1, 1, 1, 1,
1.393758, 1.454251, 3.023435, 1, 1, 1, 1, 1,
1.395834, 1.630583, -0.4673931, 1, 1, 1, 1, 1,
1.400479, 1.2104, -0.4132555, 1, 1, 1, 1, 1,
1.404679, -0.6081859, 1.004656, 1, 1, 1, 1, 1,
1.407868, -0.6629046, 4.405683, 1, 1, 1, 1, 1,
1.427556, -0.726422, 1.424712, 1, 1, 1, 1, 1,
1.434416, -0.9126143, 1.460642, 1, 1, 1, 1, 1,
1.438003, 0.3375023, 1.707793, 1, 1, 1, 1, 1,
1.451281, -0.3110541, 1.777402, 0, 0, 1, 1, 1,
1.454203, 0.3276902, 1.451293, 1, 0, 0, 1, 1,
1.460782, 0.8211253, 0.8936096, 1, 0, 0, 1, 1,
1.465796, 1.113992, -0.8097548, 1, 0, 0, 1, 1,
1.47482, -1.069911, 3.09831, 1, 0, 0, 1, 1,
1.475372, 1.884582, 0.3038459, 1, 0, 0, 1, 1,
1.481339, -0.3793804, 1.485661, 0, 0, 0, 1, 1,
1.493408, -1.265927, 1.386406, 0, 0, 0, 1, 1,
1.513036, -1.13814, 3.152128, 0, 0, 0, 1, 1,
1.526054, 0.5581811, 1.177513, 0, 0, 0, 1, 1,
1.533664, 1.169585, 0.6779593, 0, 0, 0, 1, 1,
1.543906, -1.472675, 2.950566, 0, 0, 0, 1, 1,
1.546002, 0.4036121, 2.165658, 0, 0, 0, 1, 1,
1.546615, 1.0132, 0.1946073, 1, 1, 1, 1, 1,
1.548345, -0.3483866, 2.96252, 1, 1, 1, 1, 1,
1.561544, 0.1895048, 2.216205, 1, 1, 1, 1, 1,
1.566027, 1.863576, 0.5718351, 1, 1, 1, 1, 1,
1.566108, 1.566035, -1.191261, 1, 1, 1, 1, 1,
1.569316, 1.181631, -0.1347178, 1, 1, 1, 1, 1,
1.581736, -0.4240266, 2.295746, 1, 1, 1, 1, 1,
1.594461, -0.2692502, 3.080137, 1, 1, 1, 1, 1,
1.604617, 0.5102887, 3.607076, 1, 1, 1, 1, 1,
1.60573, 0.8978227, 1.004562, 1, 1, 1, 1, 1,
1.626125, -0.5214168, 3.390987, 1, 1, 1, 1, 1,
1.631518, -0.7012801, 2.688922, 1, 1, 1, 1, 1,
1.63382, -0.6435538, 2.163901, 1, 1, 1, 1, 1,
1.640771, -0.7828695, 2.249093, 1, 1, 1, 1, 1,
1.652919, -1.985927, 0.8298081, 1, 1, 1, 1, 1,
1.655298, 1.12069, 0.8183799, 0, 0, 1, 1, 1,
1.678671, -0.5260527, 2.595255, 1, 0, 0, 1, 1,
1.679575, -0.2802847, 1.60376, 1, 0, 0, 1, 1,
1.681514, -1.661319, 2.063355, 1, 0, 0, 1, 1,
1.691713, -1.151845, 1.582791, 1, 0, 0, 1, 1,
1.699318, -0.6149828, 0.4471584, 1, 0, 0, 1, 1,
1.712587, 0.5013013, 0.4847495, 0, 0, 0, 1, 1,
1.74024, -1.418743, 1.870338, 0, 0, 0, 1, 1,
1.749026, -1.467348, 3.530432, 0, 0, 0, 1, 1,
1.75485, -0.4547822, 0.5694397, 0, 0, 0, 1, 1,
1.758308, 0.6281611, 2.095951, 0, 0, 0, 1, 1,
1.784462, -1.655302, 3.733127, 0, 0, 0, 1, 1,
1.787386, 0.9515273, 1.169761, 0, 0, 0, 1, 1,
1.804859, 0.862972, 1.933793, 1, 1, 1, 1, 1,
1.810688, -0.7579056, 1.064279, 1, 1, 1, 1, 1,
1.844205, -0.03176189, -0.589314, 1, 1, 1, 1, 1,
1.853577, 0.09150781, 1.16952, 1, 1, 1, 1, 1,
1.870065, -2.823762, 2.922641, 1, 1, 1, 1, 1,
1.871841, 2.034743, -0.3079542, 1, 1, 1, 1, 1,
1.897793, -0.427272, 1.380528, 1, 1, 1, 1, 1,
1.917556, 0.1083872, 0.05103679, 1, 1, 1, 1, 1,
1.927218, 0.4258392, 1.756353, 1, 1, 1, 1, 1,
1.951282, 1.022708, 1.074832, 1, 1, 1, 1, 1,
1.954107, -1.595875, 3.149945, 1, 1, 1, 1, 1,
1.966908, -0.2266374, 3.027531, 1, 1, 1, 1, 1,
1.970141, 0.4805148, 1.185347, 1, 1, 1, 1, 1,
1.999146, 0.2735443, 2.455525, 1, 1, 1, 1, 1,
2.008067, -0.9048415, 0.8295266, 1, 1, 1, 1, 1,
2.01883, -0.2915164, 2.90306, 0, 0, 1, 1, 1,
2.08491, 1.078404, 0.5905573, 1, 0, 0, 1, 1,
2.118678, 0.1408992, 1.015639, 1, 0, 0, 1, 1,
2.198642, -1.599007, 4.087303, 1, 0, 0, 1, 1,
2.201932, -0.04879566, 1.660365, 1, 0, 0, 1, 1,
2.20307, 0.9432167, 1.61332, 1, 0, 0, 1, 1,
2.221731, -0.07508971, 1.342725, 0, 0, 0, 1, 1,
2.23456, 2.159602, 0.8608035, 0, 0, 0, 1, 1,
2.311039, -0.1804263, 0.6478614, 0, 0, 0, 1, 1,
2.347929, 0.522867, -0.4329578, 0, 0, 0, 1, 1,
2.352696, -1.827222, 2.990076, 0, 0, 0, 1, 1,
2.490684, 0.7858446, 2.312413, 0, 0, 0, 1, 1,
2.505585, -0.2919192, 0.4177048, 0, 0, 0, 1, 1,
2.506105, -0.0173561, 0.6069174, 1, 1, 1, 1, 1,
2.537686, 1.120875, 1.090128, 1, 1, 1, 1, 1,
2.765371, -0.9988164, 1.165649, 1, 1, 1, 1, 1,
2.808272, 1.885912, -0.3096912, 1, 1, 1, 1, 1,
2.847243, -0.3893582, 0.648096, 1, 1, 1, 1, 1,
3.065342, 0.4720947, 0.9390674, 1, 1, 1, 1, 1,
3.252353, 0.09262621, 1.787014, 1, 1, 1, 1, 1
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
var radius = 9.716477;
var distance = 34.12871;
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
mvMatrix.translate( 0.09149742, -0.2862415, 0.6442244 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.12871);
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