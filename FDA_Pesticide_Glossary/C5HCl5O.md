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
-3.699287, -0.8859659, -1.605373, 1, 0, 0, 1,
-3.600445, 0.007810278, -1.132165, 1, 0.007843138, 0, 1,
-3.235555, -0.7155965, -0.8135961, 1, 0.01176471, 0, 1,
-3.158357, -1.118778, -2.20006, 1, 0.01960784, 0, 1,
-3.080542, 0.1372888, -0.3618664, 1, 0.02352941, 0, 1,
-2.967455, -1.07283, -1.563859, 1, 0.03137255, 0, 1,
-2.844752, -1.321267, -1.047982, 1, 0.03529412, 0, 1,
-2.666273, -1.663868, -2.81144, 1, 0.04313726, 0, 1,
-2.527152, 0.2042975, 0.1329518, 1, 0.04705882, 0, 1,
-2.388772, -0.1209434, -0.2381422, 1, 0.05490196, 0, 1,
-2.370313, -0.7733, -2.83025, 1, 0.05882353, 0, 1,
-2.355301, -1.439143, -1.146743, 1, 0.06666667, 0, 1,
-2.355084, -0.8645328, -2.37444, 1, 0.07058824, 0, 1,
-2.343639, 0.03060369, -1.648074, 1, 0.07843138, 0, 1,
-2.261911, 0.729945, -0.5988821, 1, 0.08235294, 0, 1,
-2.227912, -1.376152, -2.733847, 1, 0.09019608, 0, 1,
-2.221395, -1.579878, -1.232033, 1, 0.09411765, 0, 1,
-2.198656, 1.156465, -1.592536, 1, 0.1019608, 0, 1,
-2.127273, -0.7264475, -1.710279, 1, 0.1098039, 0, 1,
-2.112459, 0.7330261, -0.3324249, 1, 0.1137255, 0, 1,
-2.043079, 0.2229948, -2.742822, 1, 0.1215686, 0, 1,
-2.035485, 1.075109, -0.1985493, 1, 0.1254902, 0, 1,
-1.924488, 1.191026, 0.3115836, 1, 0.1333333, 0, 1,
-1.909481, 0.6577631, -2.038365, 1, 0.1372549, 0, 1,
-1.906684, -0.9987241, -1.805908, 1, 0.145098, 0, 1,
-1.901992, 1.379414, -1.47169, 1, 0.1490196, 0, 1,
-1.889703, -0.06154107, -0.8693299, 1, 0.1568628, 0, 1,
-1.883216, 0.7212958, -1.326824, 1, 0.1607843, 0, 1,
-1.875142, 1.725893, -1.437042, 1, 0.1686275, 0, 1,
-1.873316, -0.7399546, -1.319608, 1, 0.172549, 0, 1,
-1.869759, 0.2799149, -2.97403, 1, 0.1803922, 0, 1,
-1.868792, 1.41958, -0.9967732, 1, 0.1843137, 0, 1,
-1.857959, -0.8968384, -0.7834951, 1, 0.1921569, 0, 1,
-1.800172, -0.7715634, -1.584693, 1, 0.1960784, 0, 1,
-1.791818, 0.8506147, -0.2396587, 1, 0.2039216, 0, 1,
-1.767501, 0.8773632, 0.797729, 1, 0.2117647, 0, 1,
-1.753274, -1.302878, -3.174514, 1, 0.2156863, 0, 1,
-1.743204, 0.01849379, -0.9436288, 1, 0.2235294, 0, 1,
-1.741396, 1.525714, -0.8153194, 1, 0.227451, 0, 1,
-1.739967, -0.6422111, -2.279246, 1, 0.2352941, 0, 1,
-1.738022, 0.8769834, -0.02312632, 1, 0.2392157, 0, 1,
-1.733513, 1.227544, -0.8261309, 1, 0.2470588, 0, 1,
-1.72473, -0.8922765, -1.190753, 1, 0.2509804, 0, 1,
-1.72221, 0.01104893, 0.8501694, 1, 0.2588235, 0, 1,
-1.718792, 0.1765979, 0.7176378, 1, 0.2627451, 0, 1,
-1.708393, 1.354381, -1.324818, 1, 0.2705882, 0, 1,
-1.703566, 0.5449317, -1.25885, 1, 0.2745098, 0, 1,
-1.688488, 0.5402997, -2.630449, 1, 0.282353, 0, 1,
-1.68547, -0.2732474, -1.187344, 1, 0.2862745, 0, 1,
-1.680642, 0.06597847, -1.141424, 1, 0.2941177, 0, 1,
-1.677848, 0.3772979, -1.852909, 1, 0.3019608, 0, 1,
-1.656363, 0.01572437, -1.742375, 1, 0.3058824, 0, 1,
-1.655013, -1.228417, -1.559229, 1, 0.3137255, 0, 1,
-1.649891, 1.079846, -2.950652, 1, 0.3176471, 0, 1,
-1.609701, -0.1155167, -0.5433909, 1, 0.3254902, 0, 1,
-1.592571, -1.316399, -2.872667, 1, 0.3294118, 0, 1,
-1.591237, 0.3219214, -0.976724, 1, 0.3372549, 0, 1,
-1.583024, -1.826527, -0.4290223, 1, 0.3411765, 0, 1,
-1.560352, -0.5398488, -1.610088, 1, 0.3490196, 0, 1,
-1.555268, 0.4470958, -1.901752, 1, 0.3529412, 0, 1,
-1.531539, -2.007083, -1.98206, 1, 0.3607843, 0, 1,
-1.524313, -0.83642, -0.705376, 1, 0.3647059, 0, 1,
-1.508754, 0.0951908, -2.042371, 1, 0.372549, 0, 1,
-1.50322, 0.6285749, -0.8228657, 1, 0.3764706, 0, 1,
-1.478355, 0.2994738, -2.244783, 1, 0.3843137, 0, 1,
-1.47833, 0.9218641, -1.060819, 1, 0.3882353, 0, 1,
-1.475146, 0.4813593, -3.18031, 1, 0.3960784, 0, 1,
-1.454893, -1.40403, -2.909416, 1, 0.4039216, 0, 1,
-1.454859, -1.311662, -2.117042, 1, 0.4078431, 0, 1,
-1.45085, 0.2145724, -1.499429, 1, 0.4156863, 0, 1,
-1.441145, -0.177213, -0.3493116, 1, 0.4196078, 0, 1,
-1.438675, 0.9884548, -0.9330404, 1, 0.427451, 0, 1,
-1.436619, -0.4649026, -1.352726, 1, 0.4313726, 0, 1,
-1.430123, 0.03864127, -1.607534, 1, 0.4392157, 0, 1,
-1.405879, -0.04995962, -1.914056, 1, 0.4431373, 0, 1,
-1.399962, 0.4073326, -1.125877, 1, 0.4509804, 0, 1,
-1.399284, -1.515968, -3.629655, 1, 0.454902, 0, 1,
-1.39337, 1.282997, -0.6157223, 1, 0.4627451, 0, 1,
-1.387745, -0.5613627, -5.767173, 1, 0.4666667, 0, 1,
-1.386889, -0.6713759, -2.003571, 1, 0.4745098, 0, 1,
-1.384211, 0.6092746, 0.1369954, 1, 0.4784314, 0, 1,
-1.376366, -0.1500027, -3.167062, 1, 0.4862745, 0, 1,
-1.369186, -0.8131171, -1.605237, 1, 0.4901961, 0, 1,
-1.361959, 1.332518, -1.797779, 1, 0.4980392, 0, 1,
-1.35658, 0.8581129, -2.253058, 1, 0.5058824, 0, 1,
-1.354594, 0.1582456, -1.753997, 1, 0.509804, 0, 1,
-1.351405, 1.398877, -1.096054, 1, 0.5176471, 0, 1,
-1.346419, -0.1742485, -2.761629, 1, 0.5215687, 0, 1,
-1.337147, 0.04719306, -0.02487612, 1, 0.5294118, 0, 1,
-1.332202, -0.330691, -1.728379, 1, 0.5333334, 0, 1,
-1.32061, 0.1341953, -0.8047158, 1, 0.5411765, 0, 1,
-1.29745, -1.215942, -2.530809, 1, 0.5450981, 0, 1,
-1.296598, 0.2901701, -1.842662, 1, 0.5529412, 0, 1,
-1.283451, -1.535799, -2.462272, 1, 0.5568628, 0, 1,
-1.277897, 0.4325902, -1.608973, 1, 0.5647059, 0, 1,
-1.275912, -1.277589, -2.145303, 1, 0.5686275, 0, 1,
-1.273743, -1.198961, -2.204016, 1, 0.5764706, 0, 1,
-1.273691, -0.4117892, -1.255875, 1, 0.5803922, 0, 1,
-1.270768, 0.09929935, -0.2127649, 1, 0.5882353, 0, 1,
-1.259104, -1.001773, -1.63529, 1, 0.5921569, 0, 1,
-1.252585, -1.158368, -1.868753, 1, 0.6, 0, 1,
-1.252375, 1.17382, -3.105311, 1, 0.6078432, 0, 1,
-1.25195, -0.9760166, -2.220658, 1, 0.6117647, 0, 1,
-1.249179, 0.7763302, -0.6762974, 1, 0.6196079, 0, 1,
-1.248499, -0.309438, -0.9684312, 1, 0.6235294, 0, 1,
-1.234516, 1.073026, -1.537478, 1, 0.6313726, 0, 1,
-1.232495, -0.3904743, -1.672561, 1, 0.6352941, 0, 1,
-1.231703, 0.4714603, -0.5354925, 1, 0.6431373, 0, 1,
-1.226745, 1.119061, 0.2800634, 1, 0.6470588, 0, 1,
-1.226246, -1.872769, -3.19599, 1, 0.654902, 0, 1,
-1.219315, -0.5132895, -2.239978, 1, 0.6588235, 0, 1,
-1.214688, -0.5284559, -2.15342, 1, 0.6666667, 0, 1,
-1.211984, -0.608414, -1.688509, 1, 0.6705883, 0, 1,
-1.203308, 0.4516366, -0.2076373, 1, 0.6784314, 0, 1,
-1.203231, -0.6339031, -2.161484, 1, 0.682353, 0, 1,
-1.194673, 0.6155565, -1.841452, 1, 0.6901961, 0, 1,
-1.193451, 0.2390782, -0.7571182, 1, 0.6941177, 0, 1,
-1.190407, -0.4211797, -3.240762, 1, 0.7019608, 0, 1,
-1.190053, 1.098798, -2.442546, 1, 0.7098039, 0, 1,
-1.177188, -0.8157827, -0.8342148, 1, 0.7137255, 0, 1,
-1.176989, -0.8366107, -2.23759, 1, 0.7215686, 0, 1,
-1.164463, -0.6802404, -2.289583, 1, 0.7254902, 0, 1,
-1.16203, 0.3841611, -2.845951, 1, 0.7333333, 0, 1,
-1.160069, -1.112474, -1.077525, 1, 0.7372549, 0, 1,
-1.158175, -0.3345499, -2.66462, 1, 0.7450981, 0, 1,
-1.157172, 0.4200972, -2.431924, 1, 0.7490196, 0, 1,
-1.152734, 0.44991, -0.4693609, 1, 0.7568628, 0, 1,
-1.150956, -0.3468415, -2.864765, 1, 0.7607843, 0, 1,
-1.134044, -2.003312, -2.648612, 1, 0.7686275, 0, 1,
-1.131134, 0.4934887, -3.143178, 1, 0.772549, 0, 1,
-1.1294, 0.4703416, -0.1979058, 1, 0.7803922, 0, 1,
-1.128181, -0.01596712, -2.397062, 1, 0.7843137, 0, 1,
-1.124792, -0.635561, -3.355788, 1, 0.7921569, 0, 1,
-1.119824, 0.2405331, -2.019994, 1, 0.7960784, 0, 1,
-1.115429, -0.4905663, -1.06414, 1, 0.8039216, 0, 1,
-1.112771, 1.53887, -1.91194, 1, 0.8117647, 0, 1,
-1.104125, -1.784198, -3.698786, 1, 0.8156863, 0, 1,
-1.092452, 0.9240189, 0.1749462, 1, 0.8235294, 0, 1,
-1.085827, 1.055896, -0.6693925, 1, 0.827451, 0, 1,
-1.085365, -0.7766735, -1.723093, 1, 0.8352941, 0, 1,
-1.085086, -1.02239, -2.243179, 1, 0.8392157, 0, 1,
-1.083138, -1.55137, -2.132908, 1, 0.8470588, 0, 1,
-1.068838, 1.618822, -1.88208, 1, 0.8509804, 0, 1,
-1.066767, 0.9014695, -1.069864, 1, 0.8588235, 0, 1,
-1.056156, -1.006133, -2.81494, 1, 0.8627451, 0, 1,
-1.041981, -0.2172512, -1.752539, 1, 0.8705882, 0, 1,
-1.041958, -1.327457, -1.703747, 1, 0.8745098, 0, 1,
-1.036412, -0.2022385, -2.306887, 1, 0.8823529, 0, 1,
-1.02764, -0.1569276, -0.4894768, 1, 0.8862745, 0, 1,
-1.02448, 0.3351026, -1.788982, 1, 0.8941177, 0, 1,
-1.024106, 1.476153, -1.717474, 1, 0.8980392, 0, 1,
-1.023812, -0.3056229, -2.202655, 1, 0.9058824, 0, 1,
-1.020629, 1.361845, -1.350581, 1, 0.9137255, 0, 1,
-1.016719, 1.096989, -0.2889463, 1, 0.9176471, 0, 1,
-1.0156, -1.399827, -1.273753, 1, 0.9254902, 0, 1,
-1.008358, 0.4891157, 0.8016726, 1, 0.9294118, 0, 1,
-1.0077, -1.277695, -2.80914, 1, 0.9372549, 0, 1,
-1.00461, -0.9925624, -1.216397, 1, 0.9411765, 0, 1,
-1.00412, -0.2680475, -2.363969, 1, 0.9490196, 0, 1,
-1.003651, -0.6601959, -2.844763, 1, 0.9529412, 0, 1,
-1.001499, 1.947759, -0.665318, 1, 0.9607843, 0, 1,
-1.000049, 0.1972721, -1.811419, 1, 0.9647059, 0, 1,
-0.998085, -0.5044976, -1.469904, 1, 0.972549, 0, 1,
-0.996194, 1.318293, -0.9963142, 1, 0.9764706, 0, 1,
-0.9923296, 0.1720478, -0.3137991, 1, 0.9843137, 0, 1,
-0.9922726, -0.1941614, -0.9295868, 1, 0.9882353, 0, 1,
-0.9801091, -0.1313454, -0.6810847, 1, 0.9960784, 0, 1,
-0.9755669, 1.210218, -0.08986145, 0.9960784, 1, 0, 1,
-0.9739497, 0.1228383, -0.843326, 0.9921569, 1, 0, 1,
-0.9729733, 1.609232, -0.6952263, 0.9843137, 1, 0, 1,
-0.9723293, -0.07000909, -3.165895, 0.9803922, 1, 0, 1,
-0.9670851, 0.4109861, -1.145069, 0.972549, 1, 0, 1,
-0.9475954, 1.672264, -1.115712, 0.9686275, 1, 0, 1,
-0.9459673, -1.147902, -3.697165, 0.9607843, 1, 0, 1,
-0.9296569, 1.101603, -0.9210116, 0.9568627, 1, 0, 1,
-0.919607, 0.7567918, -0.7984564, 0.9490196, 1, 0, 1,
-0.913002, -0.6211773, -1.900336, 0.945098, 1, 0, 1,
-0.9099605, -0.8296233, -2.031097, 0.9372549, 1, 0, 1,
-0.9052306, 2.239095, -1.493141, 0.9333333, 1, 0, 1,
-0.9000972, -0.9635336, -5.072658, 0.9254902, 1, 0, 1,
-0.8991475, 0.3742092, -3.463676, 0.9215686, 1, 0, 1,
-0.8929036, 0.1884415, -0.4003389, 0.9137255, 1, 0, 1,
-0.8872364, 1.105865, -0.8038186, 0.9098039, 1, 0, 1,
-0.8832662, 2.138022, 0.2905199, 0.9019608, 1, 0, 1,
-0.8821436, 0.4093258, -0.6502818, 0.8941177, 1, 0, 1,
-0.8795139, 0.1534586, -1.43108, 0.8901961, 1, 0, 1,
-0.8689006, 0.1697051, 0.3103766, 0.8823529, 1, 0, 1,
-0.8681594, -0.4539878, -2.208687, 0.8784314, 1, 0, 1,
-0.8509875, -0.6966526, -1.088807, 0.8705882, 1, 0, 1,
-0.8398389, 0.7238362, -1.380472, 0.8666667, 1, 0, 1,
-0.836212, 0.08173475, -1.972388, 0.8588235, 1, 0, 1,
-0.8359553, -0.4730228, -2.405354, 0.854902, 1, 0, 1,
-0.8310675, -0.09382584, -1.586321, 0.8470588, 1, 0, 1,
-0.8284838, -0.5527756, -1.15279, 0.8431373, 1, 0, 1,
-0.8268306, -1.057065, -3.974786, 0.8352941, 1, 0, 1,
-0.8221039, 0.7491555, -0.5885177, 0.8313726, 1, 0, 1,
-0.8200793, -0.2810619, -0.5144566, 0.8235294, 1, 0, 1,
-0.8184325, -0.4385351, -2.279983, 0.8196079, 1, 0, 1,
-0.8181478, -1.265238, -4.422552, 0.8117647, 1, 0, 1,
-0.8161857, -1.662921, -1.780852, 0.8078431, 1, 0, 1,
-0.8146307, 1.139522, 0.4181256, 0.8, 1, 0, 1,
-0.802411, -0.5961452, -3.620974, 0.7921569, 1, 0, 1,
-0.8014301, 0.8518547, -0.005308176, 0.7882353, 1, 0, 1,
-0.7958765, -0.7250169, -1.720578, 0.7803922, 1, 0, 1,
-0.7942944, 0.7764833, 0.4546975, 0.7764706, 1, 0, 1,
-0.7909565, 0.2557337, -2.200987, 0.7686275, 1, 0, 1,
-0.7906708, -0.2028298, -1.952784, 0.7647059, 1, 0, 1,
-0.7886676, 0.3193508, -2.417315, 0.7568628, 1, 0, 1,
-0.7841894, 1.145241, -0.7821566, 0.7529412, 1, 0, 1,
-0.7824081, 0.698163, 0.4558676, 0.7450981, 1, 0, 1,
-0.7773913, -0.2400744, -0.4259354, 0.7411765, 1, 0, 1,
-0.7745198, -0.7565379, -0.8005368, 0.7333333, 1, 0, 1,
-0.7671791, 0.5796333, -1.128686, 0.7294118, 1, 0, 1,
-0.7661229, 0.8119733, 0.004174101, 0.7215686, 1, 0, 1,
-0.7635342, -0.8301428, -2.062557, 0.7176471, 1, 0, 1,
-0.762445, -0.08090539, -1.597455, 0.7098039, 1, 0, 1,
-0.7574731, -0.7157393, -2.428762, 0.7058824, 1, 0, 1,
-0.7555691, -0.4392261, -2.619644, 0.6980392, 1, 0, 1,
-0.7553061, -1.891299, -2.877909, 0.6901961, 1, 0, 1,
-0.7511812, 1.388269, -0.125036, 0.6862745, 1, 0, 1,
-0.7455375, 0.3066817, 0.2567335, 0.6784314, 1, 0, 1,
-0.7425236, 0.3462778, 0.407077, 0.6745098, 1, 0, 1,
-0.7424323, 0.007864139, -1.602571, 0.6666667, 1, 0, 1,
-0.7367488, 0.6185377, -1.620838, 0.6627451, 1, 0, 1,
-0.7355005, 0.7314061, -0.5563811, 0.654902, 1, 0, 1,
-0.7305893, -1.279503, -2.72112, 0.6509804, 1, 0, 1,
-0.7305477, -0.5095928, -2.5396, 0.6431373, 1, 0, 1,
-0.7292134, 0.2056761, -2.12663, 0.6392157, 1, 0, 1,
-0.7275267, -0.3010158, -1.536309, 0.6313726, 1, 0, 1,
-0.7244695, -1.195337, -2.541629, 0.627451, 1, 0, 1,
-0.7239121, -0.02745304, -2.550205, 0.6196079, 1, 0, 1,
-0.7174687, -0.9084816, -3.186722, 0.6156863, 1, 0, 1,
-0.7160252, -2.207832, -3.994946, 0.6078432, 1, 0, 1,
-0.7137895, -1.36517, -4.365505, 0.6039216, 1, 0, 1,
-0.7133457, -0.7017117, -2.212333, 0.5960785, 1, 0, 1,
-0.7120085, 0.7314964, -0.6943061, 0.5882353, 1, 0, 1,
-0.7090472, -0.4009216, -2.599917, 0.5843138, 1, 0, 1,
-0.7082559, 0.8479947, -2.326821, 0.5764706, 1, 0, 1,
-0.7067131, -0.2504724, -2.660127, 0.572549, 1, 0, 1,
-0.6994474, 0.6118347, 0.912378, 0.5647059, 1, 0, 1,
-0.6992628, 1.333379, -0.9638455, 0.5607843, 1, 0, 1,
-0.6989861, 0.5487431, -1.449886, 0.5529412, 1, 0, 1,
-0.6970491, 0.2988932, -1.145667, 0.5490196, 1, 0, 1,
-0.6963534, -1.376351, -2.155793, 0.5411765, 1, 0, 1,
-0.6927649, 0.2997573, -0.5733618, 0.5372549, 1, 0, 1,
-0.6914924, 1.29411, -1.815785, 0.5294118, 1, 0, 1,
-0.6905496, -1.387118, -1.192739, 0.5254902, 1, 0, 1,
-0.6887137, -0.4042361, -2.998236, 0.5176471, 1, 0, 1,
-0.6868289, -0.3250971, -2.319208, 0.5137255, 1, 0, 1,
-0.6786897, -0.2302782, -3.12346, 0.5058824, 1, 0, 1,
-0.6755762, -1.20211, -1.771567, 0.5019608, 1, 0, 1,
-0.6746429, -0.6320325, -2.643239, 0.4941176, 1, 0, 1,
-0.6677141, -0.5342405, -1.630035, 0.4862745, 1, 0, 1,
-0.6620389, 1.270923, -1.26876, 0.4823529, 1, 0, 1,
-0.6604984, 2.32216, 0.1586792, 0.4745098, 1, 0, 1,
-0.6588802, -0.3720727, -1.439433, 0.4705882, 1, 0, 1,
-0.6560397, -1.125716, -3.858951, 0.4627451, 1, 0, 1,
-0.6537762, 1.268339, -1.160942, 0.4588235, 1, 0, 1,
-0.6486685, -0.7421902, -2.996607, 0.4509804, 1, 0, 1,
-0.6415218, -0.5202814, -3.572427, 0.4470588, 1, 0, 1,
-0.6393806, -0.6945122, -1.780837, 0.4392157, 1, 0, 1,
-0.6318759, 1.15414, 2.289679, 0.4352941, 1, 0, 1,
-0.6302333, 1.812909, -0.7419649, 0.427451, 1, 0, 1,
-0.6270262, 1.450766, -2.09836, 0.4235294, 1, 0, 1,
-0.6257966, -0.5698117, -3.271252, 0.4156863, 1, 0, 1,
-0.6255035, 0.7423075, -0.1657714, 0.4117647, 1, 0, 1,
-0.6245542, 1.451909, -1.493478, 0.4039216, 1, 0, 1,
-0.6242694, 0.1232403, -0.7677061, 0.3960784, 1, 0, 1,
-0.6241592, -0.03555523, -1.524266, 0.3921569, 1, 0, 1,
-0.6207359, -1.932373, -2.848544, 0.3843137, 1, 0, 1,
-0.6193747, 0.1055816, 0.07946383, 0.3803922, 1, 0, 1,
-0.6164842, 0.6060088, -1.542512, 0.372549, 1, 0, 1,
-0.6157454, -0.0393971, -1.381277, 0.3686275, 1, 0, 1,
-0.6136916, 2.102488, -0.04548275, 0.3607843, 1, 0, 1,
-0.6122016, 0.4465546, -1.427681, 0.3568628, 1, 0, 1,
-0.6106498, -0.3105227, -1.249893, 0.3490196, 1, 0, 1,
-0.600459, -0.2635503, -3.666463, 0.345098, 1, 0, 1,
-0.5987924, -0.3104914, -1.284098, 0.3372549, 1, 0, 1,
-0.5978149, 0.686676, 1.298226, 0.3333333, 1, 0, 1,
-0.5898302, -1.531641, -4.035964, 0.3254902, 1, 0, 1,
-0.5872473, 0.04521385, -1.605267, 0.3215686, 1, 0, 1,
-0.5802408, 1.220503, 0.02684481, 0.3137255, 1, 0, 1,
-0.5782372, -1.229759, -1.412472, 0.3098039, 1, 0, 1,
-0.5777231, 0.8327806, -0.8634694, 0.3019608, 1, 0, 1,
-0.5775666, -0.3683099, -3.727626, 0.2941177, 1, 0, 1,
-0.5755827, -1.168114, -4.357774, 0.2901961, 1, 0, 1,
-0.5695019, -0.4461573, 0.946747, 0.282353, 1, 0, 1,
-0.5619819, -0.7758156, -2.13166, 0.2784314, 1, 0, 1,
-0.5539248, -1.02481, -2.630322, 0.2705882, 1, 0, 1,
-0.5522102, 0.2903211, -1.888949, 0.2666667, 1, 0, 1,
-0.5416453, 0.677023, -0.875945, 0.2588235, 1, 0, 1,
-0.5395329, -1.762041, -0.6772296, 0.254902, 1, 0, 1,
-0.5380384, -0.1277349, -2.938598, 0.2470588, 1, 0, 1,
-0.5328346, 0.3884813, -0.3515671, 0.2431373, 1, 0, 1,
-0.5310303, 1.228465, 0.1835104, 0.2352941, 1, 0, 1,
-0.5229232, -1.077108, -3.175266, 0.2313726, 1, 0, 1,
-0.5204238, -0.3828132, -1.130343, 0.2235294, 1, 0, 1,
-0.517917, -1.412094, -2.738394, 0.2196078, 1, 0, 1,
-0.5154701, -0.9201701, -4.244562, 0.2117647, 1, 0, 1,
-0.5143268, -1.805452, -1.527947, 0.2078431, 1, 0, 1,
-0.5104715, -0.3887222, -1.938776, 0.2, 1, 0, 1,
-0.5092512, -0.3241275, -1.046846, 0.1921569, 1, 0, 1,
-0.5080206, 0.9324952, 0.3564036, 0.1882353, 1, 0, 1,
-0.5068802, 1.150076, -0.964433, 0.1803922, 1, 0, 1,
-0.5060213, 1.484062, -0.4618829, 0.1764706, 1, 0, 1,
-0.4970531, -0.3170215, -2.319298, 0.1686275, 1, 0, 1,
-0.494281, 0.6251192, 0.4377892, 0.1647059, 1, 0, 1,
-0.4909598, -0.1734309, -2.736892, 0.1568628, 1, 0, 1,
-0.4902537, 0.1904996, -1.607505, 0.1529412, 1, 0, 1,
-0.4900917, 0.2950545, -0.8331884, 0.145098, 1, 0, 1,
-0.4859057, 0.8045924, -2.553394, 0.1411765, 1, 0, 1,
-0.4851198, 1.027889, 0.3919687, 0.1333333, 1, 0, 1,
-0.4846236, 0.01268068, -0.9796442, 0.1294118, 1, 0, 1,
-0.4844418, 0.6796061, -0.8530085, 0.1215686, 1, 0, 1,
-0.4739124, 0.454281, -1.454178, 0.1176471, 1, 0, 1,
-0.4730674, -0.4099166, -4.888107, 0.1098039, 1, 0, 1,
-0.4719472, -0.2255471, -0.8927016, 0.1058824, 1, 0, 1,
-0.4706063, -0.199645, -0.2518657, 0.09803922, 1, 0, 1,
-0.4684826, 0.6323816, 0.8066769, 0.09019608, 1, 0, 1,
-0.4674802, -0.5951365, -1.487378, 0.08627451, 1, 0, 1,
-0.466885, 1.019808, -0.9616742, 0.07843138, 1, 0, 1,
-0.4579693, 0.8239315, 0.2912138, 0.07450981, 1, 0, 1,
-0.4554667, -0.5506198, -0.1900486, 0.06666667, 1, 0, 1,
-0.4517835, -1.069345, -3.862426, 0.0627451, 1, 0, 1,
-0.4515502, 0.5807024, -2.36279, 0.05490196, 1, 0, 1,
-0.4511355, -0.5564083, -2.98689, 0.05098039, 1, 0, 1,
-0.4487299, -0.6166939, -2.153192, 0.04313726, 1, 0, 1,
-0.4476447, -0.6190804, -1.728922, 0.03921569, 1, 0, 1,
-0.4466206, 0.1856841, -0.8551418, 0.03137255, 1, 0, 1,
-0.4465763, -0.857632, -2.021669, 0.02745098, 1, 0, 1,
-0.4376366, 0.6373339, -0.8426157, 0.01960784, 1, 0, 1,
-0.4371453, 1.719807, -1.685179, 0.01568628, 1, 0, 1,
-0.4349848, -2.643406, -3.043708, 0.007843138, 1, 0, 1,
-0.4348019, 1.140238, -0.1057681, 0.003921569, 1, 0, 1,
-0.4342402, 0.9616104, -0.3549831, 0, 1, 0.003921569, 1,
-0.4277717, 0.08733027, -2.262012, 0, 1, 0.01176471, 1,
-0.4270912, -0.3356365, -1.164554, 0, 1, 0.01568628, 1,
-0.4245834, 0.4332193, -1.232264, 0, 1, 0.02352941, 1,
-0.423662, -0.8033309, -2.459691, 0, 1, 0.02745098, 1,
-0.4210022, -0.5264037, -3.221042, 0, 1, 0.03529412, 1,
-0.4177494, -0.8221295, -1.499424, 0, 1, 0.03921569, 1,
-0.4170562, -1.544558, -2.001868, 0, 1, 0.04705882, 1,
-0.4167002, 0.3166761, -2.655404, 0, 1, 0.05098039, 1,
-0.4160079, 0.1817339, -1.652571, 0, 1, 0.05882353, 1,
-0.4158295, 0.6256779, -0.3275529, 0, 1, 0.0627451, 1,
-0.4125619, 0.2931293, -1.303781, 0, 1, 0.07058824, 1,
-0.4038494, -0.3864579, -3.476214, 0, 1, 0.07450981, 1,
-0.4024172, 0.3891764, -1.072175, 0, 1, 0.08235294, 1,
-0.3974766, -0.4876598, -3.013752, 0, 1, 0.08627451, 1,
-0.3967128, 0.1608555, -2.529628, 0, 1, 0.09411765, 1,
-0.3914542, 1.299025, -1.675444, 0, 1, 0.1019608, 1,
-0.3909312, -0.3008474, -1.528693, 0, 1, 0.1058824, 1,
-0.3891364, 2.274195, 0.4229549, 0, 1, 0.1137255, 1,
-0.3882531, 0.05301369, -0.9209688, 0, 1, 0.1176471, 1,
-0.3868314, 2.107519, -0.1669414, 0, 1, 0.1254902, 1,
-0.3866812, 0.2963376, -1.524208, 0, 1, 0.1294118, 1,
-0.3804117, -0.3773937, -0.8582658, 0, 1, 0.1372549, 1,
-0.3784209, 0.05397681, -1.680634, 0, 1, 0.1411765, 1,
-0.3746321, -0.5168411, -2.162117, 0, 1, 0.1490196, 1,
-0.3738858, 1.137183, -0.8502731, 0, 1, 0.1529412, 1,
-0.3721018, 0.6264253, 0.3183649, 0, 1, 0.1607843, 1,
-0.3718544, -1.260901, -1.563326, 0, 1, 0.1647059, 1,
-0.3717999, -0.4488859, -2.63634, 0, 1, 0.172549, 1,
-0.3711371, 0.9600307, -0.2181062, 0, 1, 0.1764706, 1,
-0.36112, -1.158707, -3.862906, 0, 1, 0.1843137, 1,
-0.3541225, 1.010847, -0.0618085, 0, 1, 0.1882353, 1,
-0.3344911, 1.549603, 0.6657842, 0, 1, 0.1960784, 1,
-0.3332232, 0.8418376, 0.3124063, 0, 1, 0.2039216, 1,
-0.3296487, -1.890171, -2.722296, 0, 1, 0.2078431, 1,
-0.3229669, 0.7464124, -0.6161439, 0, 1, 0.2156863, 1,
-0.319994, 0.1485584, -0.7259941, 0, 1, 0.2196078, 1,
-0.3185138, 0.5832503, -2.556022, 0, 1, 0.227451, 1,
-0.3173347, -0.4495969, -3.492777, 0, 1, 0.2313726, 1,
-0.3172255, -1.338471, -2.836008, 0, 1, 0.2392157, 1,
-0.3119565, 1.989378, 0.7315762, 0, 1, 0.2431373, 1,
-0.311223, 1.421237, -0.4611858, 0, 1, 0.2509804, 1,
-0.2976393, -0.6336498, -2.845462, 0, 1, 0.254902, 1,
-0.296435, -1.13164, -1.108497, 0, 1, 0.2627451, 1,
-0.2955809, 0.3823103, -2.227476, 0, 1, 0.2666667, 1,
-0.2955562, 0.349682, -0.4376951, 0, 1, 0.2745098, 1,
-0.2952998, 0.5276287, -1.194246, 0, 1, 0.2784314, 1,
-0.2943646, -0.56542, -2.538387, 0, 1, 0.2862745, 1,
-0.2913058, 0.8643547, 0.5454774, 0, 1, 0.2901961, 1,
-0.2911453, 1.872646, 0.8431827, 0, 1, 0.2980392, 1,
-0.2841921, -1.288623, -2.620721, 0, 1, 0.3058824, 1,
-0.2814658, -0.4966292, -3.77213, 0, 1, 0.3098039, 1,
-0.2742012, -0.9336305, -1.653566, 0, 1, 0.3176471, 1,
-0.2740231, -2.561347, -3.358073, 0, 1, 0.3215686, 1,
-0.2734245, 0.8218114, 1.094887, 0, 1, 0.3294118, 1,
-0.272807, 1.517948, 0.766039, 0, 1, 0.3333333, 1,
-0.2696553, -1.273038, -4.611373, 0, 1, 0.3411765, 1,
-0.2566461, -0.5971043, -1.300601, 0, 1, 0.345098, 1,
-0.2552066, 0.07267857, -1.684028, 0, 1, 0.3529412, 1,
-0.251191, -0.03966027, -1.136284, 0, 1, 0.3568628, 1,
-0.2388086, -0.1516652, -3.991989, 0, 1, 0.3647059, 1,
-0.2354739, -0.2723669, -2.800329, 0, 1, 0.3686275, 1,
-0.232297, 0.03611578, -1.350473, 0, 1, 0.3764706, 1,
-0.2295675, 0.03799793, -1.425926, 0, 1, 0.3803922, 1,
-0.2269241, -0.8763799, -2.437382, 0, 1, 0.3882353, 1,
-0.2235732, -1.128937, -1.697095, 0, 1, 0.3921569, 1,
-0.2191237, -0.06483193, -1.302881, 0, 1, 0.4, 1,
-0.2189298, 2.369306, -1.311857, 0, 1, 0.4078431, 1,
-0.2131016, 0.2405143, -0.2379988, 0, 1, 0.4117647, 1,
-0.2109337, -1.336869, -2.437566, 0, 1, 0.4196078, 1,
-0.209384, -0.7202151, -1.443922, 0, 1, 0.4235294, 1,
-0.2079429, -0.5631738, -4.200433, 0, 1, 0.4313726, 1,
-0.2060967, 0.150894, -1.28293, 0, 1, 0.4352941, 1,
-0.1951988, -0.3268987, -2.040323, 0, 1, 0.4431373, 1,
-0.1937878, 0.3649218, -0.8879448, 0, 1, 0.4470588, 1,
-0.1926632, -1.107659, -2.254166, 0, 1, 0.454902, 1,
-0.1925332, 0.05766596, 1.105415, 0, 1, 0.4588235, 1,
-0.1906999, -1.402623, -4.237435, 0, 1, 0.4666667, 1,
-0.1883836, 0.4642767, -0.7528987, 0, 1, 0.4705882, 1,
-0.1871808, 1.964941, 0.4134028, 0, 1, 0.4784314, 1,
-0.1865124, -0.9630656, -3.113104, 0, 1, 0.4823529, 1,
-0.1857028, 0.7560337, -0.4212179, 0, 1, 0.4901961, 1,
-0.1851083, 1.610119, 0.3907934, 0, 1, 0.4941176, 1,
-0.1851035, -0.7293593, -3.669291, 0, 1, 0.5019608, 1,
-0.1850365, -1.375026, -2.440661, 0, 1, 0.509804, 1,
-0.1837767, 0.1232587, -3.714575, 0, 1, 0.5137255, 1,
-0.1832376, 0.1367589, -1.101666, 0, 1, 0.5215687, 1,
-0.1786535, 1.42987, 0.09711277, 0, 1, 0.5254902, 1,
-0.1770704, 0.008437704, -2.454125, 0, 1, 0.5333334, 1,
-0.1721213, 1.871975, -2.683124, 0, 1, 0.5372549, 1,
-0.1703923, 0.01921134, 0.2162073, 0, 1, 0.5450981, 1,
-0.1687462, 0.3522318, 1.107409, 0, 1, 0.5490196, 1,
-0.1679562, -0.7864155, -2.41191, 0, 1, 0.5568628, 1,
-0.1607958, 0.7015921, -0.3980249, 0, 1, 0.5607843, 1,
-0.1563486, 0.4908068, 0.7268485, 0, 1, 0.5686275, 1,
-0.156212, -0.799692, -3.912924, 0, 1, 0.572549, 1,
-0.149917, 1.013816, 2.192609, 0, 1, 0.5803922, 1,
-0.1455423, 0.4465145, 0.8937628, 0, 1, 0.5843138, 1,
-0.1437394, 0.5735889, -0.0187473, 0, 1, 0.5921569, 1,
-0.1437354, -1.015367, -1.105766, 0, 1, 0.5960785, 1,
-0.1415413, 0.4333225, 2.222661, 0, 1, 0.6039216, 1,
-0.1379744, -1.408083, -4.412403, 0, 1, 0.6117647, 1,
-0.1376822, 0.4091189, 0.3087752, 0, 1, 0.6156863, 1,
-0.1355986, 0.1539455, 1.120211, 0, 1, 0.6235294, 1,
-0.1349463, 0.898227, 0.3321143, 0, 1, 0.627451, 1,
-0.1284313, -0.5078281, -3.200789, 0, 1, 0.6352941, 1,
-0.1268632, 2.003846, 0.1508132, 0, 1, 0.6392157, 1,
-0.1233651, 1.344846, -0.4420632, 0, 1, 0.6470588, 1,
-0.1206599, 1.05843, 0.05765091, 0, 1, 0.6509804, 1,
-0.1196355, 2.096778, 0.3608314, 0, 1, 0.6588235, 1,
-0.1189551, 0.750147, -0.3755713, 0, 1, 0.6627451, 1,
-0.1187268, -1.238077, -4.000798, 0, 1, 0.6705883, 1,
-0.1172013, -1.939887, -3.516158, 0, 1, 0.6745098, 1,
-0.1168426, -0.2184992, -2.810262, 0, 1, 0.682353, 1,
-0.1149353, -0.672556, -2.426472, 0, 1, 0.6862745, 1,
-0.1128464, 0.15437, -0.06531705, 0, 1, 0.6941177, 1,
-0.1117824, -0.6484233, -2.312221, 0, 1, 0.7019608, 1,
-0.1116812, 0.8034661, 0.02642536, 0, 1, 0.7058824, 1,
-0.1089731, -1.427938, -2.431666, 0, 1, 0.7137255, 1,
-0.1055678, -1.772436, -2.369757, 0, 1, 0.7176471, 1,
-0.1043559, 0.05892283, -1.406548, 0, 1, 0.7254902, 1,
-0.1040534, 1.926952, -1.061034, 0, 1, 0.7294118, 1,
-0.1037135, 0.5296309, -0.1721795, 0, 1, 0.7372549, 1,
-0.1030127, 0.1814827, 0.4229329, 0, 1, 0.7411765, 1,
-0.09948238, 0.02092285, -1.654945, 0, 1, 0.7490196, 1,
-0.09553225, -0.005592551, -1.460227, 0, 1, 0.7529412, 1,
-0.09267493, 1.364249, -0.4890418, 0, 1, 0.7607843, 1,
-0.085548, 0.2242381, -0.3782649, 0, 1, 0.7647059, 1,
-0.07780803, -0.9151307, -1.148123, 0, 1, 0.772549, 1,
-0.07583728, 0.2761151, -1.142838, 0, 1, 0.7764706, 1,
-0.07020823, 0.5243707, -0.8700961, 0, 1, 0.7843137, 1,
-0.05446023, 1.633311, -2.834001, 0, 1, 0.7882353, 1,
-0.05341534, -1.122312, -2.946024, 0, 1, 0.7960784, 1,
-0.05274669, -0.3019792, -3.016018, 0, 1, 0.8039216, 1,
-0.05062413, -1.5252, -3.217326, 0, 1, 0.8078431, 1,
-0.04874174, -0.8555729, -3.715166, 0, 1, 0.8156863, 1,
-0.04291511, -1.166985, -1.48479, 0, 1, 0.8196079, 1,
-0.04089421, -0.4722291, -3.637785, 0, 1, 0.827451, 1,
-0.03671013, 0.4007594, 1.557053, 0, 1, 0.8313726, 1,
-0.03631097, -1.297766, -2.734559, 0, 1, 0.8392157, 1,
-0.03342514, 1.235021, 0.3883416, 0, 1, 0.8431373, 1,
-0.03325132, 2.077707, 0.01734687, 0, 1, 0.8509804, 1,
-0.03238252, 0.4925377, 0.8989142, 0, 1, 0.854902, 1,
-0.03234566, -1.058169, -2.841493, 0, 1, 0.8627451, 1,
-0.02801091, -0.6773236, -2.063823, 0, 1, 0.8666667, 1,
-0.02627216, 2.966728, -0.4949751, 0, 1, 0.8745098, 1,
-0.02441063, -0.1041906, -0.2340657, 0, 1, 0.8784314, 1,
-0.02362368, -1.162501, -1.261641, 0, 1, 0.8862745, 1,
-0.02313253, 1.121309, -0.03641919, 0, 1, 0.8901961, 1,
-0.01920057, -0.3033805, -4.355129, 0, 1, 0.8980392, 1,
-0.01781201, 1.065018, 1.463663, 0, 1, 0.9058824, 1,
-0.01725205, 1.56111, -1.164895, 0, 1, 0.9098039, 1,
-0.01657717, -1.339368, -4.750584, 0, 1, 0.9176471, 1,
-0.01258413, -1.497871, -3.313354, 0, 1, 0.9215686, 1,
-0.009620321, -0.03508393, -3.576856, 0, 1, 0.9294118, 1,
-0.008618323, 0.2094768, -0.2881609, 0, 1, 0.9333333, 1,
-0.008601477, -0.7351058, -4.300995, 0, 1, 0.9411765, 1,
-0.00669127, 1.227766, 0.9150057, 0, 1, 0.945098, 1,
-0.006674387, 2.199634, 1.692875, 0, 1, 0.9529412, 1,
-0.005530696, -0.6745781, -3.428893, 0, 1, 0.9568627, 1,
-0.005173919, -0.4445851, -3.296341, 0, 1, 0.9647059, 1,
-9.623568e-05, 0.7620666, -2.007369, 0, 1, 0.9686275, 1,
0.00293931, 0.3136111, 0.1975342, 0, 1, 0.9764706, 1,
0.008232296, -0.3336626, 1.743933, 0, 1, 0.9803922, 1,
0.01622089, 1.332496, -0.7603306, 0, 1, 0.9882353, 1,
0.01872211, -0.3729885, 3.099875, 0, 1, 0.9921569, 1,
0.0188722, 1.003538, 0.4374346, 0, 1, 1, 1,
0.02396792, 0.3592052, -0.4208626, 0, 0.9921569, 1, 1,
0.03321986, 0.3864441, -0.8220047, 0, 0.9882353, 1, 1,
0.03331448, -0.01088182, 1.847522, 0, 0.9803922, 1, 1,
0.03365292, -1.586962, 2.152261, 0, 0.9764706, 1, 1,
0.0373072, 0.131234, -0.6842909, 0, 0.9686275, 1, 1,
0.03886933, 0.7072567, -0.466968, 0, 0.9647059, 1, 1,
0.04618526, -2.195793, 2.393321, 0, 0.9568627, 1, 1,
0.04663038, 0.6197925, -0.3443702, 0, 0.9529412, 1, 1,
0.05165574, -0.7999817, 4.585822, 0, 0.945098, 1, 1,
0.05627526, 0.6724137, -1.793209, 0, 0.9411765, 1, 1,
0.05711411, 0.4043303, 0.5518645, 0, 0.9333333, 1, 1,
0.05730262, 0.4576229, -0.5465595, 0, 0.9294118, 1, 1,
0.06477645, 0.1010046, 0.9161274, 0, 0.9215686, 1, 1,
0.06517626, -1.198795, 3.203867, 0, 0.9176471, 1, 1,
0.06737857, 0.1679698, 0.7931439, 0, 0.9098039, 1, 1,
0.06877433, -1.122426, 4.155904, 0, 0.9058824, 1, 1,
0.07332995, -1.174744, 2.178687, 0, 0.8980392, 1, 1,
0.0735518, 0.09875502, 0.4338762, 0, 0.8901961, 1, 1,
0.07626318, -1.236302, 3.067002, 0, 0.8862745, 1, 1,
0.07739957, -0.9260719, 3.386066, 0, 0.8784314, 1, 1,
0.08133098, 1.464946, -0.1257378, 0, 0.8745098, 1, 1,
0.08690839, 1.082215, 2.123506, 0, 0.8666667, 1, 1,
0.08860727, -0.7351176, 1.313553, 0, 0.8627451, 1, 1,
0.08999428, -0.7910264, 3.597502, 0, 0.854902, 1, 1,
0.09498306, -0.3399419, 1.961523, 0, 0.8509804, 1, 1,
0.09773272, 1.369948, 0.8798431, 0, 0.8431373, 1, 1,
0.100047, -1.172467, 5.087701, 0, 0.8392157, 1, 1,
0.1066134, 0.5403818, -0.1929974, 0, 0.8313726, 1, 1,
0.1090951, 1.30742, -1.017127, 0, 0.827451, 1, 1,
0.1121182, -0.9834637, 2.157545, 0, 0.8196079, 1, 1,
0.1138782, -1.269744, 1.660903, 0, 0.8156863, 1, 1,
0.1203948, -1.346943, 2.471365, 0, 0.8078431, 1, 1,
0.1220041, 1.383526, 0.1471682, 0, 0.8039216, 1, 1,
0.1260308, -0.9949519, 2.623468, 0, 0.7960784, 1, 1,
0.1271387, -1.468536, 3.493312, 0, 0.7882353, 1, 1,
0.1281596, 0.1798058, -0.5054159, 0, 0.7843137, 1, 1,
0.1329933, 0.7908393, -0.8026947, 0, 0.7764706, 1, 1,
0.1330009, -0.3853516, 0.6190658, 0, 0.772549, 1, 1,
0.1343911, 0.4723423, -1.003161, 0, 0.7647059, 1, 1,
0.1368905, -2.248913, 3.043284, 0, 0.7607843, 1, 1,
0.1404008, -0.07040304, 1.007732, 0, 0.7529412, 1, 1,
0.1416737, 0.2846664, -0.4186511, 0, 0.7490196, 1, 1,
0.1441044, 1.725221, 2.116011, 0, 0.7411765, 1, 1,
0.1467632, 0.8837568, 2.356746, 0, 0.7372549, 1, 1,
0.148603, 1.851183, 0.4000082, 0, 0.7294118, 1, 1,
0.1512381, 0.7133266, 1.449898, 0, 0.7254902, 1, 1,
0.1552224, 0.8062073, 1.411399, 0, 0.7176471, 1, 1,
0.1612713, 1.786358, -1.559463, 0, 0.7137255, 1, 1,
0.1662231, 0.5966299, -2.238706, 0, 0.7058824, 1, 1,
0.166238, 0.4643801, -0.4579999, 0, 0.6980392, 1, 1,
0.1666103, 1.512574, 0.1988276, 0, 0.6941177, 1, 1,
0.1671769, -0.02846889, 1.519936, 0, 0.6862745, 1, 1,
0.1705378, -1.344973, 2.05741, 0, 0.682353, 1, 1,
0.1733424, 0.6680707, 0.4033085, 0, 0.6745098, 1, 1,
0.1744156, 1.400369, 0.2958257, 0, 0.6705883, 1, 1,
0.1778933, 1.042182, 1.032053, 0, 0.6627451, 1, 1,
0.1813064, -0.3172995, 3.118525, 0, 0.6588235, 1, 1,
0.1841932, 1.871127, 1.3838, 0, 0.6509804, 1, 1,
0.1893754, 0.3650259, -0.07694001, 0, 0.6470588, 1, 1,
0.1906087, -1.531232, 2.835747, 0, 0.6392157, 1, 1,
0.192, -1.12316, 2.131023, 0, 0.6352941, 1, 1,
0.195392, -1.838, 2.986688, 0, 0.627451, 1, 1,
0.1956396, 0.9490002, -1.017469, 0, 0.6235294, 1, 1,
0.2015154, 2.11708, -0.9511621, 0, 0.6156863, 1, 1,
0.2045097, -0.3966241, 1.82009, 0, 0.6117647, 1, 1,
0.2061746, -0.5393518, 2.252161, 0, 0.6039216, 1, 1,
0.2066603, -1.117388, 2.127187, 0, 0.5960785, 1, 1,
0.2117705, 0.3833147, 1.654585, 0, 0.5921569, 1, 1,
0.2195914, 0.159902, 2.181602, 0, 0.5843138, 1, 1,
0.2223493, 1.718338, 1.633926, 0, 0.5803922, 1, 1,
0.2251621, 2.946449, 0.2010605, 0, 0.572549, 1, 1,
0.2253865, 0.5503426, 0.7173418, 0, 0.5686275, 1, 1,
0.2269975, -0.1868435, 0.6455707, 0, 0.5607843, 1, 1,
0.2274418, -0.7487447, 4.563682, 0, 0.5568628, 1, 1,
0.2288539, -1.582037, 2.57172, 0, 0.5490196, 1, 1,
0.2305749, 1.914446, 0.879109, 0, 0.5450981, 1, 1,
0.2306762, -0.3370344, 3.598449, 0, 0.5372549, 1, 1,
0.2361721, 0.8182421, 2.052441, 0, 0.5333334, 1, 1,
0.2388463, -0.2977799, 2.244695, 0, 0.5254902, 1, 1,
0.2411509, -1.748549, 3.466231, 0, 0.5215687, 1, 1,
0.2430742, 0.1640588, 1.658457, 0, 0.5137255, 1, 1,
0.2436122, -0.003257754, 1.108995, 0, 0.509804, 1, 1,
0.2446918, -0.1441355, 2.124001, 0, 0.5019608, 1, 1,
0.2451694, 1.321661, -0.8390521, 0, 0.4941176, 1, 1,
0.2478008, -1.275652, 1.875668, 0, 0.4901961, 1, 1,
0.2486046, 1.264755, -0.2467637, 0, 0.4823529, 1, 1,
0.2496149, -0.01758065, 2.110976, 0, 0.4784314, 1, 1,
0.2529944, 1.224963, 0.2339932, 0, 0.4705882, 1, 1,
0.2531429, 0.05763644, 1.633481, 0, 0.4666667, 1, 1,
0.2588161, -2.270852, 1.065768, 0, 0.4588235, 1, 1,
0.2592646, 0.6661813, 1.800674, 0, 0.454902, 1, 1,
0.2609499, -0.8240806, 3.383808, 0, 0.4470588, 1, 1,
0.2627734, -0.04394329, 1.429963, 0, 0.4431373, 1, 1,
0.2645151, 1.2357, -0.08337136, 0, 0.4352941, 1, 1,
0.2728928, -1.50224, 3.320214, 0, 0.4313726, 1, 1,
0.2782074, -0.9454263, 3.220853, 0, 0.4235294, 1, 1,
0.2814398, -0.6849883, 2.967145, 0, 0.4196078, 1, 1,
0.2833663, -0.09117469, 3.141712, 0, 0.4117647, 1, 1,
0.2872351, 0.7037541, 1.287385, 0, 0.4078431, 1, 1,
0.2905012, -0.6608996, 2.98487, 0, 0.4, 1, 1,
0.2906502, 0.479536, 1.872238, 0, 0.3921569, 1, 1,
0.2936768, -0.5364608, 3.953316, 0, 0.3882353, 1, 1,
0.2943937, -0.5540345, 2.123304, 0, 0.3803922, 1, 1,
0.2948553, 0.6983045, 0.05710148, 0, 0.3764706, 1, 1,
0.2959169, -0.8607584, 2.889549, 0, 0.3686275, 1, 1,
0.2959632, 0.3474011, 0.7231663, 0, 0.3647059, 1, 1,
0.2959944, 0.2159806, 0.995462, 0, 0.3568628, 1, 1,
0.2961313, 1.986003, 0.6135683, 0, 0.3529412, 1, 1,
0.2969237, 0.6137233, 1.168809, 0, 0.345098, 1, 1,
0.2970655, -1.243302, 3.346209, 0, 0.3411765, 1, 1,
0.2971249, 0.6034642, 0.09492587, 0, 0.3333333, 1, 1,
0.2988375, 0.5514482, 1.191379, 0, 0.3294118, 1, 1,
0.3002435, -1.179938, 1.295052, 0, 0.3215686, 1, 1,
0.3067448, -1.228278, 1.751566, 0, 0.3176471, 1, 1,
0.310155, 0.8314225, 0.3661165, 0, 0.3098039, 1, 1,
0.3104244, -1.594561, 2.951555, 0, 0.3058824, 1, 1,
0.3144569, 0.3739382, -0.7748536, 0, 0.2980392, 1, 1,
0.3147784, -1.780473, 3.418203, 0, 0.2901961, 1, 1,
0.3211673, 0.02441823, 1.651634, 0, 0.2862745, 1, 1,
0.3317187, -0.1163933, 1.780382, 0, 0.2784314, 1, 1,
0.3323555, -1.231462, 4.123969, 0, 0.2745098, 1, 1,
0.3378609, -0.6662667, 4.183044, 0, 0.2666667, 1, 1,
0.338005, -1.276079, 3.118484, 0, 0.2627451, 1, 1,
0.3396064, 1.444085, 0.1644221, 0, 0.254902, 1, 1,
0.3422527, 0.4369753, 1.425388, 0, 0.2509804, 1, 1,
0.3445831, -0.7500753, 1.977241, 0, 0.2431373, 1, 1,
0.3491147, -1.196605, 3.740964, 0, 0.2392157, 1, 1,
0.351241, 0.9517562, 0.5155986, 0, 0.2313726, 1, 1,
0.3522753, -0.3961713, 2.020202, 0, 0.227451, 1, 1,
0.3593711, -1.432724, 1.81618, 0, 0.2196078, 1, 1,
0.364281, 0.8891289, 0.01371963, 0, 0.2156863, 1, 1,
0.3654318, 0.5976487, -1.434399, 0, 0.2078431, 1, 1,
0.3668735, -0.3102157, 3.150488, 0, 0.2039216, 1, 1,
0.3684638, 0.3908208, 0.3021563, 0, 0.1960784, 1, 1,
0.3728487, -1.525728, 1.300047, 0, 0.1882353, 1, 1,
0.3747979, -0.7169506, 3.559687, 0, 0.1843137, 1, 1,
0.3767266, 0.5916345, 2.678519, 0, 0.1764706, 1, 1,
0.3788781, 1.143793, -0.3577701, 0, 0.172549, 1, 1,
0.3799064, -1.116297, 1.267783, 0, 0.1647059, 1, 1,
0.3802356, 0.6408868, 2.103747, 0, 0.1607843, 1, 1,
0.3818271, -1.084759, 3.371214, 0, 0.1529412, 1, 1,
0.3858003, -0.307208, 3.31746, 0, 0.1490196, 1, 1,
0.3875546, -0.4219963, 0.07658407, 0, 0.1411765, 1, 1,
0.3881339, -0.7122838, 4.081453, 0, 0.1372549, 1, 1,
0.3946688, -0.1215455, 1.703161, 0, 0.1294118, 1, 1,
0.398165, -0.3215321, 2.461958, 0, 0.1254902, 1, 1,
0.3994338, -0.2633896, 3.088178, 0, 0.1176471, 1, 1,
0.4083234, -2.4958, 1.709344, 0, 0.1137255, 1, 1,
0.4104303, 0.002840566, 1.710619, 0, 0.1058824, 1, 1,
0.4110149, 1.023319, 2.151024, 0, 0.09803922, 1, 1,
0.416469, 0.4472022, 0.4018818, 0, 0.09411765, 1, 1,
0.4167359, -0.1482252, 0.6193792, 0, 0.08627451, 1, 1,
0.4181293, 0.6101318, -0.4510624, 0, 0.08235294, 1, 1,
0.4201067, -0.4737835, 0.7759173, 0, 0.07450981, 1, 1,
0.4216697, 0.2880791, 1.271837, 0, 0.07058824, 1, 1,
0.4231627, -1.317801, 2.835385, 0, 0.0627451, 1, 1,
0.4253598, -2.409952, 3.544488, 0, 0.05882353, 1, 1,
0.4271991, 0.9441591, 0.175105, 0, 0.05098039, 1, 1,
0.430693, -0.4722778, 2.867538, 0, 0.04705882, 1, 1,
0.4421012, -1.323243, 2.723426, 0, 0.03921569, 1, 1,
0.4447482, 0.6470737, 0.2324636, 0, 0.03529412, 1, 1,
0.4467305, -0.1032039, 1.593215, 0, 0.02745098, 1, 1,
0.4517058, -0.4965315, 1.706531, 0, 0.02352941, 1, 1,
0.4529433, 1.619607, 0.4287089, 0, 0.01568628, 1, 1,
0.4544393, -0.5319672, 3.404752, 0, 0.01176471, 1, 1,
0.4569791, -1.422342, 3.570836, 0, 0.003921569, 1, 1,
0.4605286, 0.4259562, 1.259403, 0.003921569, 0, 1, 1,
0.4625582, 1.350583, 0.3360664, 0.007843138, 0, 1, 1,
0.4680412, -0.5739939, 2.786809, 0.01568628, 0, 1, 1,
0.4698612, -0.1213932, 1.58027, 0.01960784, 0, 1, 1,
0.4734178, 0.707353, -0.7983944, 0.02745098, 0, 1, 1,
0.473926, 0.9664357, -0.8549932, 0.03137255, 0, 1, 1,
0.474427, 0.451733, 1.731379, 0.03921569, 0, 1, 1,
0.480518, 0.9720854, 1.7878, 0.04313726, 0, 1, 1,
0.4891766, 1.58567, 1.775696, 0.05098039, 0, 1, 1,
0.4971181, -0.7104409, 1.216656, 0.05490196, 0, 1, 1,
0.4972881, -0.9773762, 0.6395751, 0.0627451, 0, 1, 1,
0.4992757, 1.294531, -0.5050201, 0.06666667, 0, 1, 1,
0.4996674, -1.576914, 0.8473492, 0.07450981, 0, 1, 1,
0.5003738, -0.5697933, 2.563501, 0.07843138, 0, 1, 1,
0.5089988, -0.5764037, 2.229223, 0.08627451, 0, 1, 1,
0.5107732, 0.331366, 0.04364058, 0.09019608, 0, 1, 1,
0.5156239, 0.7477053, 1.045031, 0.09803922, 0, 1, 1,
0.5168186, 0.02427202, -0.7190378, 0.1058824, 0, 1, 1,
0.5181712, 0.3134906, -0.05446903, 0.1098039, 0, 1, 1,
0.5197226, 1.362854, 1.341676, 0.1176471, 0, 1, 1,
0.5208975, 1.351587, -0.3557376, 0.1215686, 0, 1, 1,
0.5223459, 2.170457, -1.540331, 0.1294118, 0, 1, 1,
0.5249887, 2.185805, 0.325757, 0.1333333, 0, 1, 1,
0.5254779, -0.657208, 2.832118, 0.1411765, 0, 1, 1,
0.5271059, 1.680154, -0.5499542, 0.145098, 0, 1, 1,
0.529864, -0.6437011, 2.060541, 0.1529412, 0, 1, 1,
0.5308412, -1.395125, 4.789981, 0.1568628, 0, 1, 1,
0.5325351, 1.520119, 1.130599, 0.1647059, 0, 1, 1,
0.5393732, 2.46341, -0.3487386, 0.1686275, 0, 1, 1,
0.5400066, 0.8293421, 0.7110841, 0.1764706, 0, 1, 1,
0.5408396, 1.581344, 0.6490766, 0.1803922, 0, 1, 1,
0.5521728, -0.8223711, 3.11033, 0.1882353, 0, 1, 1,
0.5554893, 1.496831, -0.2943664, 0.1921569, 0, 1, 1,
0.5582446, 0.7327138, 0.5012908, 0.2, 0, 1, 1,
0.5608659, -0.6986539, 2.804615, 0.2078431, 0, 1, 1,
0.5618405, -0.2341983, 1.415226, 0.2117647, 0, 1, 1,
0.5635086, 0.4799185, 0.3590215, 0.2196078, 0, 1, 1,
0.566349, 0.8988485, -1.005799, 0.2235294, 0, 1, 1,
0.5668516, 1.289644, 1.152655, 0.2313726, 0, 1, 1,
0.5718316, -0.04238831, 1.391476, 0.2352941, 0, 1, 1,
0.5745084, 0.2022454, 1.157902, 0.2431373, 0, 1, 1,
0.5746033, 1.293301, 1.730357, 0.2470588, 0, 1, 1,
0.5766008, -0.5672375, 2.088846, 0.254902, 0, 1, 1,
0.5811492, -0.6738033, 2.119861, 0.2588235, 0, 1, 1,
0.5867324, 0.7052751, 0.3790106, 0.2666667, 0, 1, 1,
0.5879303, -1.266969, 3.87281, 0.2705882, 0, 1, 1,
0.5890823, -0.1315268, 0.2482733, 0.2784314, 0, 1, 1,
0.5928078, 0.2173825, 0.3195378, 0.282353, 0, 1, 1,
0.5991694, 0.535917, 0.9362932, 0.2901961, 0, 1, 1,
0.60379, 1.018654, -0.720441, 0.2941177, 0, 1, 1,
0.6084796, 1.046591, -2.141135, 0.3019608, 0, 1, 1,
0.6107966, -0.03844269, 0.4110223, 0.3098039, 0, 1, 1,
0.6131817, -0.9258811, 4.252795, 0.3137255, 0, 1, 1,
0.6160067, 0.7140012, 1.460406, 0.3215686, 0, 1, 1,
0.6169939, -1.529527, 1.929376, 0.3254902, 0, 1, 1,
0.6187551, 0.9353464, -0.8490604, 0.3333333, 0, 1, 1,
0.6247905, -1.274241, 1.347044, 0.3372549, 0, 1, 1,
0.6297466, 0.4760351, 1.826723, 0.345098, 0, 1, 1,
0.6322585, 3.377939, 1.344408, 0.3490196, 0, 1, 1,
0.6399755, -0.006742514, 0.4429547, 0.3568628, 0, 1, 1,
0.6493467, -0.53803, 3.489577, 0.3607843, 0, 1, 1,
0.6547128, -1.299066, 4.837327, 0.3686275, 0, 1, 1,
0.6554083, 1.304884, 0.1511633, 0.372549, 0, 1, 1,
0.6568082, 1.032443, -0.3019689, 0.3803922, 0, 1, 1,
0.6603016, -0.4573227, 1.078005, 0.3843137, 0, 1, 1,
0.6822829, -0.2421032, 2.792065, 0.3921569, 0, 1, 1,
0.6828562, -1.177237, 3.166618, 0.3960784, 0, 1, 1,
0.6875209, 1.4999, 0.6895195, 0.4039216, 0, 1, 1,
0.6878591, 0.8437529, -0.2343042, 0.4117647, 0, 1, 1,
0.6920798, -1.762641, 3.603844, 0.4156863, 0, 1, 1,
0.6954986, 1.942177, -0.7122681, 0.4235294, 0, 1, 1,
0.7011555, -0.276868, 3.299128, 0.427451, 0, 1, 1,
0.7011859, -0.03381522, 3.942747, 0.4352941, 0, 1, 1,
0.7022755, 2.562077, -0.7875726, 0.4392157, 0, 1, 1,
0.7039378, 0.5390003, 0.8416622, 0.4470588, 0, 1, 1,
0.7057688, -0.1790076, 4.429687, 0.4509804, 0, 1, 1,
0.7077148, 1.137963, -0.3832945, 0.4588235, 0, 1, 1,
0.7124106, -0.8102773, 3.36266, 0.4627451, 0, 1, 1,
0.7137408, -0.4200141, 0.7428377, 0.4705882, 0, 1, 1,
0.7141038, 1.852815, 1.578158, 0.4745098, 0, 1, 1,
0.7205556, -0.02376489, -0.06679943, 0.4823529, 0, 1, 1,
0.7341562, 2.145854, -0.8601621, 0.4862745, 0, 1, 1,
0.7364624, 0.4500411, 2.771282, 0.4941176, 0, 1, 1,
0.7372801, 1.861742, -0.3568059, 0.5019608, 0, 1, 1,
0.7382358, 0.03720552, 2.209973, 0.5058824, 0, 1, 1,
0.7413926, 0.2868595, -0.3742671, 0.5137255, 0, 1, 1,
0.7441619, -0.3240863, 1.66369, 0.5176471, 0, 1, 1,
0.7454231, -0.6290875, 1.325847, 0.5254902, 0, 1, 1,
0.7455261, -1.419402, 3.395622, 0.5294118, 0, 1, 1,
0.7512023, 1.959196, -1.069433, 0.5372549, 0, 1, 1,
0.7528602, 0.7869683, 0.4472131, 0.5411765, 0, 1, 1,
0.7554706, -0.5172431, 1.381815, 0.5490196, 0, 1, 1,
0.75846, 0.1309212, -1.05418, 0.5529412, 0, 1, 1,
0.761904, 1.079309, -0.1762164, 0.5607843, 0, 1, 1,
0.7619185, -0.174616, 2.065963, 0.5647059, 0, 1, 1,
0.7633634, -1.113998, 1.900721, 0.572549, 0, 1, 1,
0.7739202, -1.282665, 0.4668969, 0.5764706, 0, 1, 1,
0.7760587, -0.8355395, 1.708797, 0.5843138, 0, 1, 1,
0.7763473, 0.3951327, 0.4428073, 0.5882353, 0, 1, 1,
0.7790658, -0.8202757, 2.975323, 0.5960785, 0, 1, 1,
0.7808697, 0.8569043, 1.264814, 0.6039216, 0, 1, 1,
0.7923541, -0.1831128, 2.563174, 0.6078432, 0, 1, 1,
0.7942687, -0.6974341, 1.832361, 0.6156863, 0, 1, 1,
0.7950875, -1.40276, 0.5442263, 0.6196079, 0, 1, 1,
0.7993151, 0.6349369, 2.029473, 0.627451, 0, 1, 1,
0.8015143, 1.694244, -1.435193, 0.6313726, 0, 1, 1,
0.8107454, 0.6809223, 1.171955, 0.6392157, 0, 1, 1,
0.8117824, 0.2600592, 1.369162, 0.6431373, 0, 1, 1,
0.8124769, -1.405964, 1.183675, 0.6509804, 0, 1, 1,
0.8127182, 0.3849896, -1.129327, 0.654902, 0, 1, 1,
0.8127933, -1.404572, 3.181878, 0.6627451, 0, 1, 1,
0.8136059, 0.6827273, 1.49199, 0.6666667, 0, 1, 1,
0.8169616, -0.7554139, 1.583298, 0.6745098, 0, 1, 1,
0.8188568, -1.275868, 4.525122, 0.6784314, 0, 1, 1,
0.829671, 0.4209101, -0.2303764, 0.6862745, 0, 1, 1,
0.8341282, 1.053457, 1.545222, 0.6901961, 0, 1, 1,
0.8399658, -0.9499101, 4.086762, 0.6980392, 0, 1, 1,
0.8483859, 0.2314315, 0.1567127, 0.7058824, 0, 1, 1,
0.8486403, 1.042025, 1.687723, 0.7098039, 0, 1, 1,
0.8495476, -0.9801747, 3.862828, 0.7176471, 0, 1, 1,
0.8528138, 0.0450874, 2.781841, 0.7215686, 0, 1, 1,
0.8558004, 1.99303, 1.370903, 0.7294118, 0, 1, 1,
0.861318, 0.04752785, 0.8823559, 0.7333333, 0, 1, 1,
0.8752565, -0.4614585, 1.576763, 0.7411765, 0, 1, 1,
0.876302, 0.7091179, 0.3508287, 0.7450981, 0, 1, 1,
0.8783316, 3.184002, -0.4740525, 0.7529412, 0, 1, 1,
0.879893, 0.4119113, 2.248664, 0.7568628, 0, 1, 1,
0.880161, 0.5386254, 0.2904732, 0.7647059, 0, 1, 1,
0.880224, -2.043048, 2.505845, 0.7686275, 0, 1, 1,
0.8803611, 1.425253, 1.890295, 0.7764706, 0, 1, 1,
0.8937001, -0.1226652, 2.26456, 0.7803922, 0, 1, 1,
0.8956134, 0.3411221, 0.8256641, 0.7882353, 0, 1, 1,
0.9002943, 0.4563856, 1.056651, 0.7921569, 0, 1, 1,
0.9036722, -1.875461, 2.041758, 0.8, 0, 1, 1,
0.9039367, -0.8824002, 3.459286, 0.8078431, 0, 1, 1,
0.9066747, 1.015369, 2.190443, 0.8117647, 0, 1, 1,
0.9071959, -0.08197571, 1.372626, 0.8196079, 0, 1, 1,
0.9097832, -0.6421468, 3.362508, 0.8235294, 0, 1, 1,
0.9104202, 0.1186823, 1.876668, 0.8313726, 0, 1, 1,
0.9108682, -0.09224635, 3.22685, 0.8352941, 0, 1, 1,
0.912995, -0.8565179, 2.122053, 0.8431373, 0, 1, 1,
0.9135128, -0.816736, 3.511408, 0.8470588, 0, 1, 1,
0.9170501, -1.537792, 2.910449, 0.854902, 0, 1, 1,
0.9292708, 0.8905968, 1.442152, 0.8588235, 0, 1, 1,
0.93115, -0.2529819, 1.159795, 0.8666667, 0, 1, 1,
0.9324747, 2.249352, 0.5870734, 0.8705882, 0, 1, 1,
0.9361223, -2.021045, 2.240111, 0.8784314, 0, 1, 1,
0.9366567, 0.7471269, -0.7862917, 0.8823529, 0, 1, 1,
0.9373217, -0.55994, 1.42253, 0.8901961, 0, 1, 1,
0.9514483, 0.07612166, 1.242513, 0.8941177, 0, 1, 1,
0.9548986, 0.630554, 2.007946, 0.9019608, 0, 1, 1,
0.957568, -1.259307, 1.173459, 0.9098039, 0, 1, 1,
0.9587146, 0.09994892, -1.137989, 0.9137255, 0, 1, 1,
0.9602093, -0.1619257, 2.93137, 0.9215686, 0, 1, 1,
0.966879, -0.1361496, 2.707085, 0.9254902, 0, 1, 1,
0.9688334, 0.1344324, 1.710899, 0.9333333, 0, 1, 1,
0.9696463, -0.8251024, 2.775875, 0.9372549, 0, 1, 1,
0.9737065, 0.3954045, 0.3526621, 0.945098, 0, 1, 1,
0.9739784, 0.7988128, 0.8032522, 0.9490196, 0, 1, 1,
0.9741481, -0.4544715, 2.788357, 0.9568627, 0, 1, 1,
0.9794514, 2.629428, 1.256888, 0.9607843, 0, 1, 1,
0.9916923, 1.067061, 1.159752, 0.9686275, 0, 1, 1,
0.9973532, -0.3898371, 1.905961, 0.972549, 0, 1, 1,
0.998431, 0.4526912, 0.03933768, 0.9803922, 0, 1, 1,
1.004036, 0.4887153, 1.066414, 0.9843137, 0, 1, 1,
1.005471, -1.169375, 2.503354, 0.9921569, 0, 1, 1,
1.009051, 0.6351865, 2.535876, 0.9960784, 0, 1, 1,
1.012514, -2.384674, 2.805009, 1, 0, 0.9960784, 1,
1.034385, 0.2107787, 0.03521554, 1, 0, 0.9882353, 1,
1.045244, -0.1713678, 0.7702407, 1, 0, 0.9843137, 1,
1.046568, -0.5879019, 1.843962, 1, 0, 0.9764706, 1,
1.047035, 0.3509745, 3.446585, 1, 0, 0.972549, 1,
1.047115, 0.4014326, 1.701267, 1, 0, 0.9647059, 1,
1.053903, 0.2050765, 2.484201, 1, 0, 0.9607843, 1,
1.056383, 0.2988179, 2.598054, 1, 0, 0.9529412, 1,
1.066981, 0.7269366, 1.129301, 1, 0, 0.9490196, 1,
1.077982, 0.4439976, 2.076918, 1, 0, 0.9411765, 1,
1.085374, -0.4126168, 1.911768, 1, 0, 0.9372549, 1,
1.086129, 0.4856483, 2.043914, 1, 0, 0.9294118, 1,
1.088223, -1.367836, 2.725044, 1, 0, 0.9254902, 1,
1.091238, -0.7347727, 0.07773611, 1, 0, 0.9176471, 1,
1.091682, 0.4133742, 1.211989, 1, 0, 0.9137255, 1,
1.104602, 1.256401, 1.189786, 1, 0, 0.9058824, 1,
1.108041, 0.1050406, 2.121268, 1, 0, 0.9019608, 1,
1.113756, -0.5973186, 1.640256, 1, 0, 0.8941177, 1,
1.123447, -0.187648, 0.5425994, 1, 0, 0.8862745, 1,
1.12552, 0.98044, 1.019328, 1, 0, 0.8823529, 1,
1.132027, 0.7106488, 0.7005453, 1, 0, 0.8745098, 1,
1.132124, -0.904624, 2.176488, 1, 0, 0.8705882, 1,
1.141877, 0.5690463, 1.627075, 1, 0, 0.8627451, 1,
1.143037, -1.205378, 1.646798, 1, 0, 0.8588235, 1,
1.148989, -0.4639029, 2.350383, 1, 0, 0.8509804, 1,
1.153079, -0.7503039, 2.443044, 1, 0, 0.8470588, 1,
1.160698, 2.31798, 0.8066067, 1, 0, 0.8392157, 1,
1.167631, 1.854256, 0.4729154, 1, 0, 0.8352941, 1,
1.168616, -1.113292, 1.421404, 1, 0, 0.827451, 1,
1.181396, 0.5615928, 1.373323, 1, 0, 0.8235294, 1,
1.185959, -0.6417753, 1.283683, 1, 0, 0.8156863, 1,
1.188324, -0.3390092, 1.729037, 1, 0, 0.8117647, 1,
1.196682, 0.7384856, 2.169328, 1, 0, 0.8039216, 1,
1.21064, 0.7721039, -0.7759607, 1, 0, 0.7960784, 1,
1.214105, 1.194723, 1.306062, 1, 0, 0.7921569, 1,
1.216467, 0.7613197, 0.5041119, 1, 0, 0.7843137, 1,
1.218348, 0.5154228, 0.9163024, 1, 0, 0.7803922, 1,
1.226416, 0.1751033, 1.233877, 1, 0, 0.772549, 1,
1.231965, 0.7047159, -0.907262, 1, 0, 0.7686275, 1,
1.233071, -0.6376937, 3.85126, 1, 0, 0.7607843, 1,
1.234131, 0.8352548, 0.8774907, 1, 0, 0.7568628, 1,
1.255687, 0.05871423, 2.544644, 1, 0, 0.7490196, 1,
1.257202, 3.380644, 0.21784, 1, 0, 0.7450981, 1,
1.267453, -0.5872713, 2.346462, 1, 0, 0.7372549, 1,
1.269741, -0.1003686, 1.847309, 1, 0, 0.7333333, 1,
1.273403, 0.8104283, 0.0486505, 1, 0, 0.7254902, 1,
1.276727, -0.7958084, 0.4357672, 1, 0, 0.7215686, 1,
1.279473, 0.8948588, -0.210848, 1, 0, 0.7137255, 1,
1.28478, -0.694167, 2.015811, 1, 0, 0.7098039, 1,
1.285411, 2.124511, 0.5425014, 1, 0, 0.7019608, 1,
1.286034, 2.252116, 0.6535727, 1, 0, 0.6941177, 1,
1.299563, -1.451564, 1.737549, 1, 0, 0.6901961, 1,
1.301312, 2.560443, 0.7690186, 1, 0, 0.682353, 1,
1.306088, -1.407248, 2.276987, 1, 0, 0.6784314, 1,
1.313567, -1.246823, -0.02679231, 1, 0, 0.6705883, 1,
1.31906, 0.6395331, 1.922639, 1, 0, 0.6666667, 1,
1.320718, 0.7483668, 0.4953113, 1, 0, 0.6588235, 1,
1.329769, -1.130255, 2.41249, 1, 0, 0.654902, 1,
1.342234, 1.020842, 0.296775, 1, 0, 0.6470588, 1,
1.342988, 0.0265392, 2.535702, 1, 0, 0.6431373, 1,
1.348705, 0.09815609, 1.618423, 1, 0, 0.6352941, 1,
1.352522, -0.03633337, 2.912745, 1, 0, 0.6313726, 1,
1.354873, -1.809351, 0.4394771, 1, 0, 0.6235294, 1,
1.361601, -3.457392, 2.610852, 1, 0, 0.6196079, 1,
1.367242, 0.7052737, 0.01799068, 1, 0, 0.6117647, 1,
1.375044, -0.7117896, 2.996592, 1, 0, 0.6078432, 1,
1.375979, -1.526482, 3.147917, 1, 0, 0.6, 1,
1.377301, 0.8473943, 0.857181, 1, 0, 0.5921569, 1,
1.381397, 1.763309, 1.134907, 1, 0, 0.5882353, 1,
1.406157, -1.648409, 2.074712, 1, 0, 0.5803922, 1,
1.410932, 0.5978896, 0.09203714, 1, 0, 0.5764706, 1,
1.414771, -0.8533752, 2.683243, 1, 0, 0.5686275, 1,
1.416258, -1.196846, 2.152009, 1, 0, 0.5647059, 1,
1.416293, 1.106841, -1.359764, 1, 0, 0.5568628, 1,
1.455422, -2.368216, 1.22185, 1, 0, 0.5529412, 1,
1.462642, 0.6879547, 2.738702, 1, 0, 0.5450981, 1,
1.464004, -1.098096, 1.970191, 1, 0, 0.5411765, 1,
1.464715, 0.2200297, 0.8229771, 1, 0, 0.5333334, 1,
1.467407, 0.07156328, 0.3698517, 1, 0, 0.5294118, 1,
1.488487, -0.5355188, 2.380185, 1, 0, 0.5215687, 1,
1.490155, 0.3689082, -0.4215513, 1, 0, 0.5176471, 1,
1.50469, 1.703408, 1.335615, 1, 0, 0.509804, 1,
1.506648, -0.09280895, 2.193125, 1, 0, 0.5058824, 1,
1.510831, 1.191531, -0.1336355, 1, 0, 0.4980392, 1,
1.511262, -0.963017, 2.107832, 1, 0, 0.4901961, 1,
1.512595, 1.35352, 1.997729, 1, 0, 0.4862745, 1,
1.515504, 0.05109137, 0.1438218, 1, 0, 0.4784314, 1,
1.518324, 1.358604, 1.88453, 1, 0, 0.4745098, 1,
1.538017, -0.03334666, 2.161886, 1, 0, 0.4666667, 1,
1.545122, -1.809068, 3.484636, 1, 0, 0.4627451, 1,
1.545714, 0.3329463, 0.5858948, 1, 0, 0.454902, 1,
1.552706, -1.283012, 2.278073, 1, 0, 0.4509804, 1,
1.557281, 0.703799, 1.12795, 1, 0, 0.4431373, 1,
1.561944, 0.8347588, -0.1383845, 1, 0, 0.4392157, 1,
1.567535, 0.9063309, 0.1748535, 1, 0, 0.4313726, 1,
1.575827, -0.2720193, 1.93408, 1, 0, 0.427451, 1,
1.576411, 0.6267623, 0.3433836, 1, 0, 0.4196078, 1,
1.582713, -0.0687433, 1.941891, 1, 0, 0.4156863, 1,
1.586195, 1.708198, 2.457944, 1, 0, 0.4078431, 1,
1.587268, -1.010061, 0.8662138, 1, 0, 0.4039216, 1,
1.587284, 0.7078421, 0.5909233, 1, 0, 0.3960784, 1,
1.5885, 0.11258, 0.5290034, 1, 0, 0.3882353, 1,
1.627423, -0.9108272, 2.191267, 1, 0, 0.3843137, 1,
1.634036, 0.4295103, 0.5788065, 1, 0, 0.3764706, 1,
1.638457, 2.495314, 1.599326, 1, 0, 0.372549, 1,
1.639658, 1.625337, 0.1919006, 1, 0, 0.3647059, 1,
1.649032, 0.3090186, 1.878315, 1, 0, 0.3607843, 1,
1.653948, -0.9159994, 3.616404, 1, 0, 0.3529412, 1,
1.655823, -0.9970911, 2.759701, 1, 0, 0.3490196, 1,
1.657378, 1.530434, 2.37788, 1, 0, 0.3411765, 1,
1.661982, -1.698607, 2.931424, 1, 0, 0.3372549, 1,
1.668259, 0.1361216, 0.7745961, 1, 0, 0.3294118, 1,
1.683243, 1.793304, -0.2072666, 1, 0, 0.3254902, 1,
1.699341, -0.1183187, 2.959704, 1, 0, 0.3176471, 1,
1.700782, 0.3804229, -0.4265064, 1, 0, 0.3137255, 1,
1.719839, -0.4373718, 1.762736, 1, 0, 0.3058824, 1,
1.732672, -1.496353, 1.917499, 1, 0, 0.2980392, 1,
1.738445, -1.089833, 1.274855, 1, 0, 0.2941177, 1,
1.741654, 0.6122975, 2.474054, 1, 0, 0.2862745, 1,
1.7506, 1.483479, 1.184126, 1, 0, 0.282353, 1,
1.788253, 1.754845, 2.145908, 1, 0, 0.2745098, 1,
1.792122, -0.3180743, 1.017669, 1, 0, 0.2705882, 1,
1.817964, -0.7753349, 1.883353, 1, 0, 0.2627451, 1,
1.829907, 1.902627, 3.631756, 1, 0, 0.2588235, 1,
1.83778, -0.09990316, 2.07464, 1, 0, 0.2509804, 1,
1.849077, -2.062926, 4.272159, 1, 0, 0.2470588, 1,
1.861889, 0.6786488, 0.3204683, 1, 0, 0.2392157, 1,
1.874853, 0.7928622, -0.5870779, 1, 0, 0.2352941, 1,
1.885414, -0.3721946, 1.436324, 1, 0, 0.227451, 1,
1.893768, -1.457203, 2.228397, 1, 0, 0.2235294, 1,
1.909306, 1.430606, -0.2486993, 1, 0, 0.2156863, 1,
1.910653, 0.02042936, 0.2479994, 1, 0, 0.2117647, 1,
1.937186, 0.2567396, 1.829279, 1, 0, 0.2039216, 1,
1.941789, 1.24335, 1.480198, 1, 0, 0.1960784, 1,
1.954459, 0.5329776, 0.3027349, 1, 0, 0.1921569, 1,
1.956488, 0.7957569, 1.618894, 1, 0, 0.1843137, 1,
1.971878, -1.015021, 1.892404, 1, 0, 0.1803922, 1,
1.972807, -0.08730811, 2.322114, 1, 0, 0.172549, 1,
1.97347, -0.471069, 3.017577, 1, 0, 0.1686275, 1,
1.995106, -0.7027443, 1.38577, 1, 0, 0.1607843, 1,
2.003513, 1.914926, 0.8197984, 1, 0, 0.1568628, 1,
2.017275, -0.7715324, 1.514549, 1, 0, 0.1490196, 1,
2.023211, 0.09643619, 2.117954, 1, 0, 0.145098, 1,
2.027346, 0.5890566, 2.861539, 1, 0, 0.1372549, 1,
2.04649, 0.3748879, 1.951407, 1, 0, 0.1333333, 1,
2.048041, -0.3914917, 1.201095, 1, 0, 0.1254902, 1,
2.06488, -0.7312235, 0.3053795, 1, 0, 0.1215686, 1,
2.10434, 0.5418014, -0.8225016, 1, 0, 0.1137255, 1,
2.110893, -0.2830739, 1.948631, 1, 0, 0.1098039, 1,
2.150729, -0.8539023, 2.72157, 1, 0, 0.1019608, 1,
2.154189, 0.3274499, 1.243243, 1, 0, 0.09411765, 1,
2.159088, 0.1910619, 1.427894, 1, 0, 0.09019608, 1,
2.198532, 0.05048173, 0.07847945, 1, 0, 0.08235294, 1,
2.313127, -0.8057659, 1.937292, 1, 0, 0.07843138, 1,
2.376793, -2.074684, 2.349895, 1, 0, 0.07058824, 1,
2.449552, -0.1460929, 2.758252, 1, 0, 0.06666667, 1,
2.52497, 0.3034698, 2.494449, 1, 0, 0.05882353, 1,
2.586237, 0.7823575, -0.2775178, 1, 0, 0.05490196, 1,
2.692028, 1.16922, 1.462162, 1, 0, 0.04705882, 1,
2.731766, -0.1784069, 1.13213, 1, 0, 0.04313726, 1,
2.748045, -1.313135, 2.101272, 1, 0, 0.03529412, 1,
2.798872, 1.164383, 0.3682732, 1, 0, 0.03137255, 1,
2.894241, -0.6292964, 1.46734, 1, 0, 0.02352941, 1,
3.076112, -1.451005, 3.477069, 1, 0, 0.01960784, 1,
3.146669, -0.755972, 3.48927, 1, 0, 0.01176471, 1,
3.757469, -0.5158831, 2.381687, 1, 0, 0.007843138, 1
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
0.029091, -4.616439, -7.607074, 0, -0.5, 0.5, 0.5,
0.029091, -4.616439, -7.607074, 1, -0.5, 0.5, 0.5,
0.029091, -4.616439, -7.607074, 1, 1.5, 0.5, 0.5,
0.029091, -4.616439, -7.607074, 0, 1.5, 0.5, 0.5
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
-4.963207, -0.03837419, -7.607074, 0, -0.5, 0.5, 0.5,
-4.963207, -0.03837419, -7.607074, 1, -0.5, 0.5, 0.5,
-4.963207, -0.03837419, -7.607074, 1, 1.5, 0.5, 0.5,
-4.963207, -0.03837419, -7.607074, 0, 1.5, 0.5, 0.5
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
-4.963207, -4.616439, -0.339736, 0, -0.5, 0.5, 0.5,
-4.963207, -4.616439, -0.339736, 1, -0.5, 0.5, 0.5,
-4.963207, -4.616439, -0.339736, 1, 1.5, 0.5, 0.5,
-4.963207, -4.616439, -0.339736, 0, 1.5, 0.5, 0.5
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
-2, -3.559963, -5.929996,
2, -3.559963, -5.929996,
-2, -3.559963, -5.929996,
-2, -3.736042, -6.209509,
0, -3.559963, -5.929996,
0, -3.736042, -6.209509,
2, -3.559963, -5.929996,
2, -3.736042, -6.209509
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
-2, -4.088201, -6.768535, 0, -0.5, 0.5, 0.5,
-2, -4.088201, -6.768535, 1, -0.5, 0.5, 0.5,
-2, -4.088201, -6.768535, 1, 1.5, 0.5, 0.5,
-2, -4.088201, -6.768535, 0, 1.5, 0.5, 0.5,
0, -4.088201, -6.768535, 0, -0.5, 0.5, 0.5,
0, -4.088201, -6.768535, 1, -0.5, 0.5, 0.5,
0, -4.088201, -6.768535, 1, 1.5, 0.5, 0.5,
0, -4.088201, -6.768535, 0, 1.5, 0.5, 0.5,
2, -4.088201, -6.768535, 0, -0.5, 0.5, 0.5,
2, -4.088201, -6.768535, 1, -0.5, 0.5, 0.5,
2, -4.088201, -6.768535, 1, 1.5, 0.5, 0.5,
2, -4.088201, -6.768535, 0, 1.5, 0.5, 0.5
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
-3.811139, -3, -5.929996,
-3.811139, 3, -5.929996,
-3.811139, -3, -5.929996,
-4.00315, -3, -6.209509,
-3.811139, -2, -5.929996,
-4.00315, -2, -6.209509,
-3.811139, -1, -5.929996,
-4.00315, -1, -6.209509,
-3.811139, 0, -5.929996,
-4.00315, 0, -6.209509,
-3.811139, 1, -5.929996,
-4.00315, 1, -6.209509,
-3.811139, 2, -5.929996,
-4.00315, 2, -6.209509,
-3.811139, 3, -5.929996,
-4.00315, 3, -6.209509
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
-4.387173, -3, -6.768535, 0, -0.5, 0.5, 0.5,
-4.387173, -3, -6.768535, 1, -0.5, 0.5, 0.5,
-4.387173, -3, -6.768535, 1, 1.5, 0.5, 0.5,
-4.387173, -3, -6.768535, 0, 1.5, 0.5, 0.5,
-4.387173, -2, -6.768535, 0, -0.5, 0.5, 0.5,
-4.387173, -2, -6.768535, 1, -0.5, 0.5, 0.5,
-4.387173, -2, -6.768535, 1, 1.5, 0.5, 0.5,
-4.387173, -2, -6.768535, 0, 1.5, 0.5, 0.5,
-4.387173, -1, -6.768535, 0, -0.5, 0.5, 0.5,
-4.387173, -1, -6.768535, 1, -0.5, 0.5, 0.5,
-4.387173, -1, -6.768535, 1, 1.5, 0.5, 0.5,
-4.387173, -1, -6.768535, 0, 1.5, 0.5, 0.5,
-4.387173, 0, -6.768535, 0, -0.5, 0.5, 0.5,
-4.387173, 0, -6.768535, 1, -0.5, 0.5, 0.5,
-4.387173, 0, -6.768535, 1, 1.5, 0.5, 0.5,
-4.387173, 0, -6.768535, 0, 1.5, 0.5, 0.5,
-4.387173, 1, -6.768535, 0, -0.5, 0.5, 0.5,
-4.387173, 1, -6.768535, 1, -0.5, 0.5, 0.5,
-4.387173, 1, -6.768535, 1, 1.5, 0.5, 0.5,
-4.387173, 1, -6.768535, 0, 1.5, 0.5, 0.5,
-4.387173, 2, -6.768535, 0, -0.5, 0.5, 0.5,
-4.387173, 2, -6.768535, 1, -0.5, 0.5, 0.5,
-4.387173, 2, -6.768535, 1, 1.5, 0.5, 0.5,
-4.387173, 2, -6.768535, 0, 1.5, 0.5, 0.5,
-4.387173, 3, -6.768535, 0, -0.5, 0.5, 0.5,
-4.387173, 3, -6.768535, 1, -0.5, 0.5, 0.5,
-4.387173, 3, -6.768535, 1, 1.5, 0.5, 0.5,
-4.387173, 3, -6.768535, 0, 1.5, 0.5, 0.5
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
-3.811139, -3.559963, -4,
-3.811139, -3.559963, 4,
-3.811139, -3.559963, -4,
-4.00315, -3.736042, -4,
-3.811139, -3.559963, -2,
-4.00315, -3.736042, -2,
-3.811139, -3.559963, 0,
-4.00315, -3.736042, 0,
-3.811139, -3.559963, 2,
-4.00315, -3.736042, 2,
-3.811139, -3.559963, 4,
-4.00315, -3.736042, 4
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
-4.387173, -4.088201, -4, 0, -0.5, 0.5, 0.5,
-4.387173, -4.088201, -4, 1, -0.5, 0.5, 0.5,
-4.387173, -4.088201, -4, 1, 1.5, 0.5, 0.5,
-4.387173, -4.088201, -4, 0, 1.5, 0.5, 0.5,
-4.387173, -4.088201, -2, 0, -0.5, 0.5, 0.5,
-4.387173, -4.088201, -2, 1, -0.5, 0.5, 0.5,
-4.387173, -4.088201, -2, 1, 1.5, 0.5, 0.5,
-4.387173, -4.088201, -2, 0, 1.5, 0.5, 0.5,
-4.387173, -4.088201, 0, 0, -0.5, 0.5, 0.5,
-4.387173, -4.088201, 0, 1, -0.5, 0.5, 0.5,
-4.387173, -4.088201, 0, 1, 1.5, 0.5, 0.5,
-4.387173, -4.088201, 0, 0, 1.5, 0.5, 0.5,
-4.387173, -4.088201, 2, 0, -0.5, 0.5, 0.5,
-4.387173, -4.088201, 2, 1, -0.5, 0.5, 0.5,
-4.387173, -4.088201, 2, 1, 1.5, 0.5, 0.5,
-4.387173, -4.088201, 2, 0, 1.5, 0.5, 0.5,
-4.387173, -4.088201, 4, 0, -0.5, 0.5, 0.5,
-4.387173, -4.088201, 4, 1, -0.5, 0.5, 0.5,
-4.387173, -4.088201, 4, 1, 1.5, 0.5, 0.5,
-4.387173, -4.088201, 4, 0, 1.5, 0.5, 0.5
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
-3.811139, -3.559963, -5.929996,
-3.811139, 3.483214, -5.929996,
-3.811139, -3.559963, 5.250524,
-3.811139, 3.483214, 5.250524,
-3.811139, -3.559963, -5.929996,
-3.811139, -3.559963, 5.250524,
-3.811139, 3.483214, -5.929996,
-3.811139, 3.483214, 5.250524,
-3.811139, -3.559963, -5.929996,
3.869321, -3.559963, -5.929996,
-3.811139, -3.559963, 5.250524,
3.869321, -3.559963, 5.250524,
-3.811139, 3.483214, -5.929996,
3.869321, 3.483214, -5.929996,
-3.811139, 3.483214, 5.250524,
3.869321, 3.483214, 5.250524,
3.869321, -3.559963, -5.929996,
3.869321, 3.483214, -5.929996,
3.869321, -3.559963, 5.250524,
3.869321, 3.483214, 5.250524,
3.869321, -3.559963, -5.929996,
3.869321, -3.559963, 5.250524,
3.869321, 3.483214, -5.929996,
3.869321, 3.483214, 5.250524
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
var radius = 8.161345;
var distance = 36.31075;
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
mvMatrix.translate( -0.029091, 0.03837419, 0.339736 );
mvMatrix.scale( 1.148916, 1.252873, 0.7892482 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.31075);
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
C5HCl5O<-read.table("C5HCl5O.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-C5HCl5O$V2
```

```
## Error in eval(expr, envir, enclos): object 'C5HCl5O' not found
```

```r
y<-C5HCl5O$V3
```

```
## Error in eval(expr, envir, enclos): object 'C5HCl5O' not found
```

```r
z<-C5HCl5O$V4
```

```
## Error in eval(expr, envir, enclos): object 'C5HCl5O' not found
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
-3.699287, -0.8859659, -1.605373, 0, 0, 1, 1, 1,
-3.600445, 0.007810278, -1.132165, 1, 0, 0, 1, 1,
-3.235555, -0.7155965, -0.8135961, 1, 0, 0, 1, 1,
-3.158357, -1.118778, -2.20006, 1, 0, 0, 1, 1,
-3.080542, 0.1372888, -0.3618664, 1, 0, 0, 1, 1,
-2.967455, -1.07283, -1.563859, 1, 0, 0, 1, 1,
-2.844752, -1.321267, -1.047982, 0, 0, 0, 1, 1,
-2.666273, -1.663868, -2.81144, 0, 0, 0, 1, 1,
-2.527152, 0.2042975, 0.1329518, 0, 0, 0, 1, 1,
-2.388772, -0.1209434, -0.2381422, 0, 0, 0, 1, 1,
-2.370313, -0.7733, -2.83025, 0, 0, 0, 1, 1,
-2.355301, -1.439143, -1.146743, 0, 0, 0, 1, 1,
-2.355084, -0.8645328, -2.37444, 0, 0, 0, 1, 1,
-2.343639, 0.03060369, -1.648074, 1, 1, 1, 1, 1,
-2.261911, 0.729945, -0.5988821, 1, 1, 1, 1, 1,
-2.227912, -1.376152, -2.733847, 1, 1, 1, 1, 1,
-2.221395, -1.579878, -1.232033, 1, 1, 1, 1, 1,
-2.198656, 1.156465, -1.592536, 1, 1, 1, 1, 1,
-2.127273, -0.7264475, -1.710279, 1, 1, 1, 1, 1,
-2.112459, 0.7330261, -0.3324249, 1, 1, 1, 1, 1,
-2.043079, 0.2229948, -2.742822, 1, 1, 1, 1, 1,
-2.035485, 1.075109, -0.1985493, 1, 1, 1, 1, 1,
-1.924488, 1.191026, 0.3115836, 1, 1, 1, 1, 1,
-1.909481, 0.6577631, -2.038365, 1, 1, 1, 1, 1,
-1.906684, -0.9987241, -1.805908, 1, 1, 1, 1, 1,
-1.901992, 1.379414, -1.47169, 1, 1, 1, 1, 1,
-1.889703, -0.06154107, -0.8693299, 1, 1, 1, 1, 1,
-1.883216, 0.7212958, -1.326824, 1, 1, 1, 1, 1,
-1.875142, 1.725893, -1.437042, 0, 0, 1, 1, 1,
-1.873316, -0.7399546, -1.319608, 1, 0, 0, 1, 1,
-1.869759, 0.2799149, -2.97403, 1, 0, 0, 1, 1,
-1.868792, 1.41958, -0.9967732, 1, 0, 0, 1, 1,
-1.857959, -0.8968384, -0.7834951, 1, 0, 0, 1, 1,
-1.800172, -0.7715634, -1.584693, 1, 0, 0, 1, 1,
-1.791818, 0.8506147, -0.2396587, 0, 0, 0, 1, 1,
-1.767501, 0.8773632, 0.797729, 0, 0, 0, 1, 1,
-1.753274, -1.302878, -3.174514, 0, 0, 0, 1, 1,
-1.743204, 0.01849379, -0.9436288, 0, 0, 0, 1, 1,
-1.741396, 1.525714, -0.8153194, 0, 0, 0, 1, 1,
-1.739967, -0.6422111, -2.279246, 0, 0, 0, 1, 1,
-1.738022, 0.8769834, -0.02312632, 0, 0, 0, 1, 1,
-1.733513, 1.227544, -0.8261309, 1, 1, 1, 1, 1,
-1.72473, -0.8922765, -1.190753, 1, 1, 1, 1, 1,
-1.72221, 0.01104893, 0.8501694, 1, 1, 1, 1, 1,
-1.718792, 0.1765979, 0.7176378, 1, 1, 1, 1, 1,
-1.708393, 1.354381, -1.324818, 1, 1, 1, 1, 1,
-1.703566, 0.5449317, -1.25885, 1, 1, 1, 1, 1,
-1.688488, 0.5402997, -2.630449, 1, 1, 1, 1, 1,
-1.68547, -0.2732474, -1.187344, 1, 1, 1, 1, 1,
-1.680642, 0.06597847, -1.141424, 1, 1, 1, 1, 1,
-1.677848, 0.3772979, -1.852909, 1, 1, 1, 1, 1,
-1.656363, 0.01572437, -1.742375, 1, 1, 1, 1, 1,
-1.655013, -1.228417, -1.559229, 1, 1, 1, 1, 1,
-1.649891, 1.079846, -2.950652, 1, 1, 1, 1, 1,
-1.609701, -0.1155167, -0.5433909, 1, 1, 1, 1, 1,
-1.592571, -1.316399, -2.872667, 1, 1, 1, 1, 1,
-1.591237, 0.3219214, -0.976724, 0, 0, 1, 1, 1,
-1.583024, -1.826527, -0.4290223, 1, 0, 0, 1, 1,
-1.560352, -0.5398488, -1.610088, 1, 0, 0, 1, 1,
-1.555268, 0.4470958, -1.901752, 1, 0, 0, 1, 1,
-1.531539, -2.007083, -1.98206, 1, 0, 0, 1, 1,
-1.524313, -0.83642, -0.705376, 1, 0, 0, 1, 1,
-1.508754, 0.0951908, -2.042371, 0, 0, 0, 1, 1,
-1.50322, 0.6285749, -0.8228657, 0, 0, 0, 1, 1,
-1.478355, 0.2994738, -2.244783, 0, 0, 0, 1, 1,
-1.47833, 0.9218641, -1.060819, 0, 0, 0, 1, 1,
-1.475146, 0.4813593, -3.18031, 0, 0, 0, 1, 1,
-1.454893, -1.40403, -2.909416, 0, 0, 0, 1, 1,
-1.454859, -1.311662, -2.117042, 0, 0, 0, 1, 1,
-1.45085, 0.2145724, -1.499429, 1, 1, 1, 1, 1,
-1.441145, -0.177213, -0.3493116, 1, 1, 1, 1, 1,
-1.438675, 0.9884548, -0.9330404, 1, 1, 1, 1, 1,
-1.436619, -0.4649026, -1.352726, 1, 1, 1, 1, 1,
-1.430123, 0.03864127, -1.607534, 1, 1, 1, 1, 1,
-1.405879, -0.04995962, -1.914056, 1, 1, 1, 1, 1,
-1.399962, 0.4073326, -1.125877, 1, 1, 1, 1, 1,
-1.399284, -1.515968, -3.629655, 1, 1, 1, 1, 1,
-1.39337, 1.282997, -0.6157223, 1, 1, 1, 1, 1,
-1.387745, -0.5613627, -5.767173, 1, 1, 1, 1, 1,
-1.386889, -0.6713759, -2.003571, 1, 1, 1, 1, 1,
-1.384211, 0.6092746, 0.1369954, 1, 1, 1, 1, 1,
-1.376366, -0.1500027, -3.167062, 1, 1, 1, 1, 1,
-1.369186, -0.8131171, -1.605237, 1, 1, 1, 1, 1,
-1.361959, 1.332518, -1.797779, 1, 1, 1, 1, 1,
-1.35658, 0.8581129, -2.253058, 0, 0, 1, 1, 1,
-1.354594, 0.1582456, -1.753997, 1, 0, 0, 1, 1,
-1.351405, 1.398877, -1.096054, 1, 0, 0, 1, 1,
-1.346419, -0.1742485, -2.761629, 1, 0, 0, 1, 1,
-1.337147, 0.04719306, -0.02487612, 1, 0, 0, 1, 1,
-1.332202, -0.330691, -1.728379, 1, 0, 0, 1, 1,
-1.32061, 0.1341953, -0.8047158, 0, 0, 0, 1, 1,
-1.29745, -1.215942, -2.530809, 0, 0, 0, 1, 1,
-1.296598, 0.2901701, -1.842662, 0, 0, 0, 1, 1,
-1.283451, -1.535799, -2.462272, 0, 0, 0, 1, 1,
-1.277897, 0.4325902, -1.608973, 0, 0, 0, 1, 1,
-1.275912, -1.277589, -2.145303, 0, 0, 0, 1, 1,
-1.273743, -1.198961, -2.204016, 0, 0, 0, 1, 1,
-1.273691, -0.4117892, -1.255875, 1, 1, 1, 1, 1,
-1.270768, 0.09929935, -0.2127649, 1, 1, 1, 1, 1,
-1.259104, -1.001773, -1.63529, 1, 1, 1, 1, 1,
-1.252585, -1.158368, -1.868753, 1, 1, 1, 1, 1,
-1.252375, 1.17382, -3.105311, 1, 1, 1, 1, 1,
-1.25195, -0.9760166, -2.220658, 1, 1, 1, 1, 1,
-1.249179, 0.7763302, -0.6762974, 1, 1, 1, 1, 1,
-1.248499, -0.309438, -0.9684312, 1, 1, 1, 1, 1,
-1.234516, 1.073026, -1.537478, 1, 1, 1, 1, 1,
-1.232495, -0.3904743, -1.672561, 1, 1, 1, 1, 1,
-1.231703, 0.4714603, -0.5354925, 1, 1, 1, 1, 1,
-1.226745, 1.119061, 0.2800634, 1, 1, 1, 1, 1,
-1.226246, -1.872769, -3.19599, 1, 1, 1, 1, 1,
-1.219315, -0.5132895, -2.239978, 1, 1, 1, 1, 1,
-1.214688, -0.5284559, -2.15342, 1, 1, 1, 1, 1,
-1.211984, -0.608414, -1.688509, 0, 0, 1, 1, 1,
-1.203308, 0.4516366, -0.2076373, 1, 0, 0, 1, 1,
-1.203231, -0.6339031, -2.161484, 1, 0, 0, 1, 1,
-1.194673, 0.6155565, -1.841452, 1, 0, 0, 1, 1,
-1.193451, 0.2390782, -0.7571182, 1, 0, 0, 1, 1,
-1.190407, -0.4211797, -3.240762, 1, 0, 0, 1, 1,
-1.190053, 1.098798, -2.442546, 0, 0, 0, 1, 1,
-1.177188, -0.8157827, -0.8342148, 0, 0, 0, 1, 1,
-1.176989, -0.8366107, -2.23759, 0, 0, 0, 1, 1,
-1.164463, -0.6802404, -2.289583, 0, 0, 0, 1, 1,
-1.16203, 0.3841611, -2.845951, 0, 0, 0, 1, 1,
-1.160069, -1.112474, -1.077525, 0, 0, 0, 1, 1,
-1.158175, -0.3345499, -2.66462, 0, 0, 0, 1, 1,
-1.157172, 0.4200972, -2.431924, 1, 1, 1, 1, 1,
-1.152734, 0.44991, -0.4693609, 1, 1, 1, 1, 1,
-1.150956, -0.3468415, -2.864765, 1, 1, 1, 1, 1,
-1.134044, -2.003312, -2.648612, 1, 1, 1, 1, 1,
-1.131134, 0.4934887, -3.143178, 1, 1, 1, 1, 1,
-1.1294, 0.4703416, -0.1979058, 1, 1, 1, 1, 1,
-1.128181, -0.01596712, -2.397062, 1, 1, 1, 1, 1,
-1.124792, -0.635561, -3.355788, 1, 1, 1, 1, 1,
-1.119824, 0.2405331, -2.019994, 1, 1, 1, 1, 1,
-1.115429, -0.4905663, -1.06414, 1, 1, 1, 1, 1,
-1.112771, 1.53887, -1.91194, 1, 1, 1, 1, 1,
-1.104125, -1.784198, -3.698786, 1, 1, 1, 1, 1,
-1.092452, 0.9240189, 0.1749462, 1, 1, 1, 1, 1,
-1.085827, 1.055896, -0.6693925, 1, 1, 1, 1, 1,
-1.085365, -0.7766735, -1.723093, 1, 1, 1, 1, 1,
-1.085086, -1.02239, -2.243179, 0, 0, 1, 1, 1,
-1.083138, -1.55137, -2.132908, 1, 0, 0, 1, 1,
-1.068838, 1.618822, -1.88208, 1, 0, 0, 1, 1,
-1.066767, 0.9014695, -1.069864, 1, 0, 0, 1, 1,
-1.056156, -1.006133, -2.81494, 1, 0, 0, 1, 1,
-1.041981, -0.2172512, -1.752539, 1, 0, 0, 1, 1,
-1.041958, -1.327457, -1.703747, 0, 0, 0, 1, 1,
-1.036412, -0.2022385, -2.306887, 0, 0, 0, 1, 1,
-1.02764, -0.1569276, -0.4894768, 0, 0, 0, 1, 1,
-1.02448, 0.3351026, -1.788982, 0, 0, 0, 1, 1,
-1.024106, 1.476153, -1.717474, 0, 0, 0, 1, 1,
-1.023812, -0.3056229, -2.202655, 0, 0, 0, 1, 1,
-1.020629, 1.361845, -1.350581, 0, 0, 0, 1, 1,
-1.016719, 1.096989, -0.2889463, 1, 1, 1, 1, 1,
-1.0156, -1.399827, -1.273753, 1, 1, 1, 1, 1,
-1.008358, 0.4891157, 0.8016726, 1, 1, 1, 1, 1,
-1.0077, -1.277695, -2.80914, 1, 1, 1, 1, 1,
-1.00461, -0.9925624, -1.216397, 1, 1, 1, 1, 1,
-1.00412, -0.2680475, -2.363969, 1, 1, 1, 1, 1,
-1.003651, -0.6601959, -2.844763, 1, 1, 1, 1, 1,
-1.001499, 1.947759, -0.665318, 1, 1, 1, 1, 1,
-1.000049, 0.1972721, -1.811419, 1, 1, 1, 1, 1,
-0.998085, -0.5044976, -1.469904, 1, 1, 1, 1, 1,
-0.996194, 1.318293, -0.9963142, 1, 1, 1, 1, 1,
-0.9923296, 0.1720478, -0.3137991, 1, 1, 1, 1, 1,
-0.9922726, -0.1941614, -0.9295868, 1, 1, 1, 1, 1,
-0.9801091, -0.1313454, -0.6810847, 1, 1, 1, 1, 1,
-0.9755669, 1.210218, -0.08986145, 1, 1, 1, 1, 1,
-0.9739497, 0.1228383, -0.843326, 0, 0, 1, 1, 1,
-0.9729733, 1.609232, -0.6952263, 1, 0, 0, 1, 1,
-0.9723293, -0.07000909, -3.165895, 1, 0, 0, 1, 1,
-0.9670851, 0.4109861, -1.145069, 1, 0, 0, 1, 1,
-0.9475954, 1.672264, -1.115712, 1, 0, 0, 1, 1,
-0.9459673, -1.147902, -3.697165, 1, 0, 0, 1, 1,
-0.9296569, 1.101603, -0.9210116, 0, 0, 0, 1, 1,
-0.919607, 0.7567918, -0.7984564, 0, 0, 0, 1, 1,
-0.913002, -0.6211773, -1.900336, 0, 0, 0, 1, 1,
-0.9099605, -0.8296233, -2.031097, 0, 0, 0, 1, 1,
-0.9052306, 2.239095, -1.493141, 0, 0, 0, 1, 1,
-0.9000972, -0.9635336, -5.072658, 0, 0, 0, 1, 1,
-0.8991475, 0.3742092, -3.463676, 0, 0, 0, 1, 1,
-0.8929036, 0.1884415, -0.4003389, 1, 1, 1, 1, 1,
-0.8872364, 1.105865, -0.8038186, 1, 1, 1, 1, 1,
-0.8832662, 2.138022, 0.2905199, 1, 1, 1, 1, 1,
-0.8821436, 0.4093258, -0.6502818, 1, 1, 1, 1, 1,
-0.8795139, 0.1534586, -1.43108, 1, 1, 1, 1, 1,
-0.8689006, 0.1697051, 0.3103766, 1, 1, 1, 1, 1,
-0.8681594, -0.4539878, -2.208687, 1, 1, 1, 1, 1,
-0.8509875, -0.6966526, -1.088807, 1, 1, 1, 1, 1,
-0.8398389, 0.7238362, -1.380472, 1, 1, 1, 1, 1,
-0.836212, 0.08173475, -1.972388, 1, 1, 1, 1, 1,
-0.8359553, -0.4730228, -2.405354, 1, 1, 1, 1, 1,
-0.8310675, -0.09382584, -1.586321, 1, 1, 1, 1, 1,
-0.8284838, -0.5527756, -1.15279, 1, 1, 1, 1, 1,
-0.8268306, -1.057065, -3.974786, 1, 1, 1, 1, 1,
-0.8221039, 0.7491555, -0.5885177, 1, 1, 1, 1, 1,
-0.8200793, -0.2810619, -0.5144566, 0, 0, 1, 1, 1,
-0.8184325, -0.4385351, -2.279983, 1, 0, 0, 1, 1,
-0.8181478, -1.265238, -4.422552, 1, 0, 0, 1, 1,
-0.8161857, -1.662921, -1.780852, 1, 0, 0, 1, 1,
-0.8146307, 1.139522, 0.4181256, 1, 0, 0, 1, 1,
-0.802411, -0.5961452, -3.620974, 1, 0, 0, 1, 1,
-0.8014301, 0.8518547, -0.005308176, 0, 0, 0, 1, 1,
-0.7958765, -0.7250169, -1.720578, 0, 0, 0, 1, 1,
-0.7942944, 0.7764833, 0.4546975, 0, 0, 0, 1, 1,
-0.7909565, 0.2557337, -2.200987, 0, 0, 0, 1, 1,
-0.7906708, -0.2028298, -1.952784, 0, 0, 0, 1, 1,
-0.7886676, 0.3193508, -2.417315, 0, 0, 0, 1, 1,
-0.7841894, 1.145241, -0.7821566, 0, 0, 0, 1, 1,
-0.7824081, 0.698163, 0.4558676, 1, 1, 1, 1, 1,
-0.7773913, -0.2400744, -0.4259354, 1, 1, 1, 1, 1,
-0.7745198, -0.7565379, -0.8005368, 1, 1, 1, 1, 1,
-0.7671791, 0.5796333, -1.128686, 1, 1, 1, 1, 1,
-0.7661229, 0.8119733, 0.004174101, 1, 1, 1, 1, 1,
-0.7635342, -0.8301428, -2.062557, 1, 1, 1, 1, 1,
-0.762445, -0.08090539, -1.597455, 1, 1, 1, 1, 1,
-0.7574731, -0.7157393, -2.428762, 1, 1, 1, 1, 1,
-0.7555691, -0.4392261, -2.619644, 1, 1, 1, 1, 1,
-0.7553061, -1.891299, -2.877909, 1, 1, 1, 1, 1,
-0.7511812, 1.388269, -0.125036, 1, 1, 1, 1, 1,
-0.7455375, 0.3066817, 0.2567335, 1, 1, 1, 1, 1,
-0.7425236, 0.3462778, 0.407077, 1, 1, 1, 1, 1,
-0.7424323, 0.007864139, -1.602571, 1, 1, 1, 1, 1,
-0.7367488, 0.6185377, -1.620838, 1, 1, 1, 1, 1,
-0.7355005, 0.7314061, -0.5563811, 0, 0, 1, 1, 1,
-0.7305893, -1.279503, -2.72112, 1, 0, 0, 1, 1,
-0.7305477, -0.5095928, -2.5396, 1, 0, 0, 1, 1,
-0.7292134, 0.2056761, -2.12663, 1, 0, 0, 1, 1,
-0.7275267, -0.3010158, -1.536309, 1, 0, 0, 1, 1,
-0.7244695, -1.195337, -2.541629, 1, 0, 0, 1, 1,
-0.7239121, -0.02745304, -2.550205, 0, 0, 0, 1, 1,
-0.7174687, -0.9084816, -3.186722, 0, 0, 0, 1, 1,
-0.7160252, -2.207832, -3.994946, 0, 0, 0, 1, 1,
-0.7137895, -1.36517, -4.365505, 0, 0, 0, 1, 1,
-0.7133457, -0.7017117, -2.212333, 0, 0, 0, 1, 1,
-0.7120085, 0.7314964, -0.6943061, 0, 0, 0, 1, 1,
-0.7090472, -0.4009216, -2.599917, 0, 0, 0, 1, 1,
-0.7082559, 0.8479947, -2.326821, 1, 1, 1, 1, 1,
-0.7067131, -0.2504724, -2.660127, 1, 1, 1, 1, 1,
-0.6994474, 0.6118347, 0.912378, 1, 1, 1, 1, 1,
-0.6992628, 1.333379, -0.9638455, 1, 1, 1, 1, 1,
-0.6989861, 0.5487431, -1.449886, 1, 1, 1, 1, 1,
-0.6970491, 0.2988932, -1.145667, 1, 1, 1, 1, 1,
-0.6963534, -1.376351, -2.155793, 1, 1, 1, 1, 1,
-0.6927649, 0.2997573, -0.5733618, 1, 1, 1, 1, 1,
-0.6914924, 1.29411, -1.815785, 1, 1, 1, 1, 1,
-0.6905496, -1.387118, -1.192739, 1, 1, 1, 1, 1,
-0.6887137, -0.4042361, -2.998236, 1, 1, 1, 1, 1,
-0.6868289, -0.3250971, -2.319208, 1, 1, 1, 1, 1,
-0.6786897, -0.2302782, -3.12346, 1, 1, 1, 1, 1,
-0.6755762, -1.20211, -1.771567, 1, 1, 1, 1, 1,
-0.6746429, -0.6320325, -2.643239, 1, 1, 1, 1, 1,
-0.6677141, -0.5342405, -1.630035, 0, 0, 1, 1, 1,
-0.6620389, 1.270923, -1.26876, 1, 0, 0, 1, 1,
-0.6604984, 2.32216, 0.1586792, 1, 0, 0, 1, 1,
-0.6588802, -0.3720727, -1.439433, 1, 0, 0, 1, 1,
-0.6560397, -1.125716, -3.858951, 1, 0, 0, 1, 1,
-0.6537762, 1.268339, -1.160942, 1, 0, 0, 1, 1,
-0.6486685, -0.7421902, -2.996607, 0, 0, 0, 1, 1,
-0.6415218, -0.5202814, -3.572427, 0, 0, 0, 1, 1,
-0.6393806, -0.6945122, -1.780837, 0, 0, 0, 1, 1,
-0.6318759, 1.15414, 2.289679, 0, 0, 0, 1, 1,
-0.6302333, 1.812909, -0.7419649, 0, 0, 0, 1, 1,
-0.6270262, 1.450766, -2.09836, 0, 0, 0, 1, 1,
-0.6257966, -0.5698117, -3.271252, 0, 0, 0, 1, 1,
-0.6255035, 0.7423075, -0.1657714, 1, 1, 1, 1, 1,
-0.6245542, 1.451909, -1.493478, 1, 1, 1, 1, 1,
-0.6242694, 0.1232403, -0.7677061, 1, 1, 1, 1, 1,
-0.6241592, -0.03555523, -1.524266, 1, 1, 1, 1, 1,
-0.6207359, -1.932373, -2.848544, 1, 1, 1, 1, 1,
-0.6193747, 0.1055816, 0.07946383, 1, 1, 1, 1, 1,
-0.6164842, 0.6060088, -1.542512, 1, 1, 1, 1, 1,
-0.6157454, -0.0393971, -1.381277, 1, 1, 1, 1, 1,
-0.6136916, 2.102488, -0.04548275, 1, 1, 1, 1, 1,
-0.6122016, 0.4465546, -1.427681, 1, 1, 1, 1, 1,
-0.6106498, -0.3105227, -1.249893, 1, 1, 1, 1, 1,
-0.600459, -0.2635503, -3.666463, 1, 1, 1, 1, 1,
-0.5987924, -0.3104914, -1.284098, 1, 1, 1, 1, 1,
-0.5978149, 0.686676, 1.298226, 1, 1, 1, 1, 1,
-0.5898302, -1.531641, -4.035964, 1, 1, 1, 1, 1,
-0.5872473, 0.04521385, -1.605267, 0, 0, 1, 1, 1,
-0.5802408, 1.220503, 0.02684481, 1, 0, 0, 1, 1,
-0.5782372, -1.229759, -1.412472, 1, 0, 0, 1, 1,
-0.5777231, 0.8327806, -0.8634694, 1, 0, 0, 1, 1,
-0.5775666, -0.3683099, -3.727626, 1, 0, 0, 1, 1,
-0.5755827, -1.168114, -4.357774, 1, 0, 0, 1, 1,
-0.5695019, -0.4461573, 0.946747, 0, 0, 0, 1, 1,
-0.5619819, -0.7758156, -2.13166, 0, 0, 0, 1, 1,
-0.5539248, -1.02481, -2.630322, 0, 0, 0, 1, 1,
-0.5522102, 0.2903211, -1.888949, 0, 0, 0, 1, 1,
-0.5416453, 0.677023, -0.875945, 0, 0, 0, 1, 1,
-0.5395329, -1.762041, -0.6772296, 0, 0, 0, 1, 1,
-0.5380384, -0.1277349, -2.938598, 0, 0, 0, 1, 1,
-0.5328346, 0.3884813, -0.3515671, 1, 1, 1, 1, 1,
-0.5310303, 1.228465, 0.1835104, 1, 1, 1, 1, 1,
-0.5229232, -1.077108, -3.175266, 1, 1, 1, 1, 1,
-0.5204238, -0.3828132, -1.130343, 1, 1, 1, 1, 1,
-0.517917, -1.412094, -2.738394, 1, 1, 1, 1, 1,
-0.5154701, -0.9201701, -4.244562, 1, 1, 1, 1, 1,
-0.5143268, -1.805452, -1.527947, 1, 1, 1, 1, 1,
-0.5104715, -0.3887222, -1.938776, 1, 1, 1, 1, 1,
-0.5092512, -0.3241275, -1.046846, 1, 1, 1, 1, 1,
-0.5080206, 0.9324952, 0.3564036, 1, 1, 1, 1, 1,
-0.5068802, 1.150076, -0.964433, 1, 1, 1, 1, 1,
-0.5060213, 1.484062, -0.4618829, 1, 1, 1, 1, 1,
-0.4970531, -0.3170215, -2.319298, 1, 1, 1, 1, 1,
-0.494281, 0.6251192, 0.4377892, 1, 1, 1, 1, 1,
-0.4909598, -0.1734309, -2.736892, 1, 1, 1, 1, 1,
-0.4902537, 0.1904996, -1.607505, 0, 0, 1, 1, 1,
-0.4900917, 0.2950545, -0.8331884, 1, 0, 0, 1, 1,
-0.4859057, 0.8045924, -2.553394, 1, 0, 0, 1, 1,
-0.4851198, 1.027889, 0.3919687, 1, 0, 0, 1, 1,
-0.4846236, 0.01268068, -0.9796442, 1, 0, 0, 1, 1,
-0.4844418, 0.6796061, -0.8530085, 1, 0, 0, 1, 1,
-0.4739124, 0.454281, -1.454178, 0, 0, 0, 1, 1,
-0.4730674, -0.4099166, -4.888107, 0, 0, 0, 1, 1,
-0.4719472, -0.2255471, -0.8927016, 0, 0, 0, 1, 1,
-0.4706063, -0.199645, -0.2518657, 0, 0, 0, 1, 1,
-0.4684826, 0.6323816, 0.8066769, 0, 0, 0, 1, 1,
-0.4674802, -0.5951365, -1.487378, 0, 0, 0, 1, 1,
-0.466885, 1.019808, -0.9616742, 0, 0, 0, 1, 1,
-0.4579693, 0.8239315, 0.2912138, 1, 1, 1, 1, 1,
-0.4554667, -0.5506198, -0.1900486, 1, 1, 1, 1, 1,
-0.4517835, -1.069345, -3.862426, 1, 1, 1, 1, 1,
-0.4515502, 0.5807024, -2.36279, 1, 1, 1, 1, 1,
-0.4511355, -0.5564083, -2.98689, 1, 1, 1, 1, 1,
-0.4487299, -0.6166939, -2.153192, 1, 1, 1, 1, 1,
-0.4476447, -0.6190804, -1.728922, 1, 1, 1, 1, 1,
-0.4466206, 0.1856841, -0.8551418, 1, 1, 1, 1, 1,
-0.4465763, -0.857632, -2.021669, 1, 1, 1, 1, 1,
-0.4376366, 0.6373339, -0.8426157, 1, 1, 1, 1, 1,
-0.4371453, 1.719807, -1.685179, 1, 1, 1, 1, 1,
-0.4349848, -2.643406, -3.043708, 1, 1, 1, 1, 1,
-0.4348019, 1.140238, -0.1057681, 1, 1, 1, 1, 1,
-0.4342402, 0.9616104, -0.3549831, 1, 1, 1, 1, 1,
-0.4277717, 0.08733027, -2.262012, 1, 1, 1, 1, 1,
-0.4270912, -0.3356365, -1.164554, 0, 0, 1, 1, 1,
-0.4245834, 0.4332193, -1.232264, 1, 0, 0, 1, 1,
-0.423662, -0.8033309, -2.459691, 1, 0, 0, 1, 1,
-0.4210022, -0.5264037, -3.221042, 1, 0, 0, 1, 1,
-0.4177494, -0.8221295, -1.499424, 1, 0, 0, 1, 1,
-0.4170562, -1.544558, -2.001868, 1, 0, 0, 1, 1,
-0.4167002, 0.3166761, -2.655404, 0, 0, 0, 1, 1,
-0.4160079, 0.1817339, -1.652571, 0, 0, 0, 1, 1,
-0.4158295, 0.6256779, -0.3275529, 0, 0, 0, 1, 1,
-0.4125619, 0.2931293, -1.303781, 0, 0, 0, 1, 1,
-0.4038494, -0.3864579, -3.476214, 0, 0, 0, 1, 1,
-0.4024172, 0.3891764, -1.072175, 0, 0, 0, 1, 1,
-0.3974766, -0.4876598, -3.013752, 0, 0, 0, 1, 1,
-0.3967128, 0.1608555, -2.529628, 1, 1, 1, 1, 1,
-0.3914542, 1.299025, -1.675444, 1, 1, 1, 1, 1,
-0.3909312, -0.3008474, -1.528693, 1, 1, 1, 1, 1,
-0.3891364, 2.274195, 0.4229549, 1, 1, 1, 1, 1,
-0.3882531, 0.05301369, -0.9209688, 1, 1, 1, 1, 1,
-0.3868314, 2.107519, -0.1669414, 1, 1, 1, 1, 1,
-0.3866812, 0.2963376, -1.524208, 1, 1, 1, 1, 1,
-0.3804117, -0.3773937, -0.8582658, 1, 1, 1, 1, 1,
-0.3784209, 0.05397681, -1.680634, 1, 1, 1, 1, 1,
-0.3746321, -0.5168411, -2.162117, 1, 1, 1, 1, 1,
-0.3738858, 1.137183, -0.8502731, 1, 1, 1, 1, 1,
-0.3721018, 0.6264253, 0.3183649, 1, 1, 1, 1, 1,
-0.3718544, -1.260901, -1.563326, 1, 1, 1, 1, 1,
-0.3717999, -0.4488859, -2.63634, 1, 1, 1, 1, 1,
-0.3711371, 0.9600307, -0.2181062, 1, 1, 1, 1, 1,
-0.36112, -1.158707, -3.862906, 0, 0, 1, 1, 1,
-0.3541225, 1.010847, -0.0618085, 1, 0, 0, 1, 1,
-0.3344911, 1.549603, 0.6657842, 1, 0, 0, 1, 1,
-0.3332232, 0.8418376, 0.3124063, 1, 0, 0, 1, 1,
-0.3296487, -1.890171, -2.722296, 1, 0, 0, 1, 1,
-0.3229669, 0.7464124, -0.6161439, 1, 0, 0, 1, 1,
-0.319994, 0.1485584, -0.7259941, 0, 0, 0, 1, 1,
-0.3185138, 0.5832503, -2.556022, 0, 0, 0, 1, 1,
-0.3173347, -0.4495969, -3.492777, 0, 0, 0, 1, 1,
-0.3172255, -1.338471, -2.836008, 0, 0, 0, 1, 1,
-0.3119565, 1.989378, 0.7315762, 0, 0, 0, 1, 1,
-0.311223, 1.421237, -0.4611858, 0, 0, 0, 1, 1,
-0.2976393, -0.6336498, -2.845462, 0, 0, 0, 1, 1,
-0.296435, -1.13164, -1.108497, 1, 1, 1, 1, 1,
-0.2955809, 0.3823103, -2.227476, 1, 1, 1, 1, 1,
-0.2955562, 0.349682, -0.4376951, 1, 1, 1, 1, 1,
-0.2952998, 0.5276287, -1.194246, 1, 1, 1, 1, 1,
-0.2943646, -0.56542, -2.538387, 1, 1, 1, 1, 1,
-0.2913058, 0.8643547, 0.5454774, 1, 1, 1, 1, 1,
-0.2911453, 1.872646, 0.8431827, 1, 1, 1, 1, 1,
-0.2841921, -1.288623, -2.620721, 1, 1, 1, 1, 1,
-0.2814658, -0.4966292, -3.77213, 1, 1, 1, 1, 1,
-0.2742012, -0.9336305, -1.653566, 1, 1, 1, 1, 1,
-0.2740231, -2.561347, -3.358073, 1, 1, 1, 1, 1,
-0.2734245, 0.8218114, 1.094887, 1, 1, 1, 1, 1,
-0.272807, 1.517948, 0.766039, 1, 1, 1, 1, 1,
-0.2696553, -1.273038, -4.611373, 1, 1, 1, 1, 1,
-0.2566461, -0.5971043, -1.300601, 1, 1, 1, 1, 1,
-0.2552066, 0.07267857, -1.684028, 0, 0, 1, 1, 1,
-0.251191, -0.03966027, -1.136284, 1, 0, 0, 1, 1,
-0.2388086, -0.1516652, -3.991989, 1, 0, 0, 1, 1,
-0.2354739, -0.2723669, -2.800329, 1, 0, 0, 1, 1,
-0.232297, 0.03611578, -1.350473, 1, 0, 0, 1, 1,
-0.2295675, 0.03799793, -1.425926, 1, 0, 0, 1, 1,
-0.2269241, -0.8763799, -2.437382, 0, 0, 0, 1, 1,
-0.2235732, -1.128937, -1.697095, 0, 0, 0, 1, 1,
-0.2191237, -0.06483193, -1.302881, 0, 0, 0, 1, 1,
-0.2189298, 2.369306, -1.311857, 0, 0, 0, 1, 1,
-0.2131016, 0.2405143, -0.2379988, 0, 0, 0, 1, 1,
-0.2109337, -1.336869, -2.437566, 0, 0, 0, 1, 1,
-0.209384, -0.7202151, -1.443922, 0, 0, 0, 1, 1,
-0.2079429, -0.5631738, -4.200433, 1, 1, 1, 1, 1,
-0.2060967, 0.150894, -1.28293, 1, 1, 1, 1, 1,
-0.1951988, -0.3268987, -2.040323, 1, 1, 1, 1, 1,
-0.1937878, 0.3649218, -0.8879448, 1, 1, 1, 1, 1,
-0.1926632, -1.107659, -2.254166, 1, 1, 1, 1, 1,
-0.1925332, 0.05766596, 1.105415, 1, 1, 1, 1, 1,
-0.1906999, -1.402623, -4.237435, 1, 1, 1, 1, 1,
-0.1883836, 0.4642767, -0.7528987, 1, 1, 1, 1, 1,
-0.1871808, 1.964941, 0.4134028, 1, 1, 1, 1, 1,
-0.1865124, -0.9630656, -3.113104, 1, 1, 1, 1, 1,
-0.1857028, 0.7560337, -0.4212179, 1, 1, 1, 1, 1,
-0.1851083, 1.610119, 0.3907934, 1, 1, 1, 1, 1,
-0.1851035, -0.7293593, -3.669291, 1, 1, 1, 1, 1,
-0.1850365, -1.375026, -2.440661, 1, 1, 1, 1, 1,
-0.1837767, 0.1232587, -3.714575, 1, 1, 1, 1, 1,
-0.1832376, 0.1367589, -1.101666, 0, 0, 1, 1, 1,
-0.1786535, 1.42987, 0.09711277, 1, 0, 0, 1, 1,
-0.1770704, 0.008437704, -2.454125, 1, 0, 0, 1, 1,
-0.1721213, 1.871975, -2.683124, 1, 0, 0, 1, 1,
-0.1703923, 0.01921134, 0.2162073, 1, 0, 0, 1, 1,
-0.1687462, 0.3522318, 1.107409, 1, 0, 0, 1, 1,
-0.1679562, -0.7864155, -2.41191, 0, 0, 0, 1, 1,
-0.1607958, 0.7015921, -0.3980249, 0, 0, 0, 1, 1,
-0.1563486, 0.4908068, 0.7268485, 0, 0, 0, 1, 1,
-0.156212, -0.799692, -3.912924, 0, 0, 0, 1, 1,
-0.149917, 1.013816, 2.192609, 0, 0, 0, 1, 1,
-0.1455423, 0.4465145, 0.8937628, 0, 0, 0, 1, 1,
-0.1437394, 0.5735889, -0.0187473, 0, 0, 0, 1, 1,
-0.1437354, -1.015367, -1.105766, 1, 1, 1, 1, 1,
-0.1415413, 0.4333225, 2.222661, 1, 1, 1, 1, 1,
-0.1379744, -1.408083, -4.412403, 1, 1, 1, 1, 1,
-0.1376822, 0.4091189, 0.3087752, 1, 1, 1, 1, 1,
-0.1355986, 0.1539455, 1.120211, 1, 1, 1, 1, 1,
-0.1349463, 0.898227, 0.3321143, 1, 1, 1, 1, 1,
-0.1284313, -0.5078281, -3.200789, 1, 1, 1, 1, 1,
-0.1268632, 2.003846, 0.1508132, 1, 1, 1, 1, 1,
-0.1233651, 1.344846, -0.4420632, 1, 1, 1, 1, 1,
-0.1206599, 1.05843, 0.05765091, 1, 1, 1, 1, 1,
-0.1196355, 2.096778, 0.3608314, 1, 1, 1, 1, 1,
-0.1189551, 0.750147, -0.3755713, 1, 1, 1, 1, 1,
-0.1187268, -1.238077, -4.000798, 1, 1, 1, 1, 1,
-0.1172013, -1.939887, -3.516158, 1, 1, 1, 1, 1,
-0.1168426, -0.2184992, -2.810262, 1, 1, 1, 1, 1,
-0.1149353, -0.672556, -2.426472, 0, 0, 1, 1, 1,
-0.1128464, 0.15437, -0.06531705, 1, 0, 0, 1, 1,
-0.1117824, -0.6484233, -2.312221, 1, 0, 0, 1, 1,
-0.1116812, 0.8034661, 0.02642536, 1, 0, 0, 1, 1,
-0.1089731, -1.427938, -2.431666, 1, 0, 0, 1, 1,
-0.1055678, -1.772436, -2.369757, 1, 0, 0, 1, 1,
-0.1043559, 0.05892283, -1.406548, 0, 0, 0, 1, 1,
-0.1040534, 1.926952, -1.061034, 0, 0, 0, 1, 1,
-0.1037135, 0.5296309, -0.1721795, 0, 0, 0, 1, 1,
-0.1030127, 0.1814827, 0.4229329, 0, 0, 0, 1, 1,
-0.09948238, 0.02092285, -1.654945, 0, 0, 0, 1, 1,
-0.09553225, -0.005592551, -1.460227, 0, 0, 0, 1, 1,
-0.09267493, 1.364249, -0.4890418, 0, 0, 0, 1, 1,
-0.085548, 0.2242381, -0.3782649, 1, 1, 1, 1, 1,
-0.07780803, -0.9151307, -1.148123, 1, 1, 1, 1, 1,
-0.07583728, 0.2761151, -1.142838, 1, 1, 1, 1, 1,
-0.07020823, 0.5243707, -0.8700961, 1, 1, 1, 1, 1,
-0.05446023, 1.633311, -2.834001, 1, 1, 1, 1, 1,
-0.05341534, -1.122312, -2.946024, 1, 1, 1, 1, 1,
-0.05274669, -0.3019792, -3.016018, 1, 1, 1, 1, 1,
-0.05062413, -1.5252, -3.217326, 1, 1, 1, 1, 1,
-0.04874174, -0.8555729, -3.715166, 1, 1, 1, 1, 1,
-0.04291511, -1.166985, -1.48479, 1, 1, 1, 1, 1,
-0.04089421, -0.4722291, -3.637785, 1, 1, 1, 1, 1,
-0.03671013, 0.4007594, 1.557053, 1, 1, 1, 1, 1,
-0.03631097, -1.297766, -2.734559, 1, 1, 1, 1, 1,
-0.03342514, 1.235021, 0.3883416, 1, 1, 1, 1, 1,
-0.03325132, 2.077707, 0.01734687, 1, 1, 1, 1, 1,
-0.03238252, 0.4925377, 0.8989142, 0, 0, 1, 1, 1,
-0.03234566, -1.058169, -2.841493, 1, 0, 0, 1, 1,
-0.02801091, -0.6773236, -2.063823, 1, 0, 0, 1, 1,
-0.02627216, 2.966728, -0.4949751, 1, 0, 0, 1, 1,
-0.02441063, -0.1041906, -0.2340657, 1, 0, 0, 1, 1,
-0.02362368, -1.162501, -1.261641, 1, 0, 0, 1, 1,
-0.02313253, 1.121309, -0.03641919, 0, 0, 0, 1, 1,
-0.01920057, -0.3033805, -4.355129, 0, 0, 0, 1, 1,
-0.01781201, 1.065018, 1.463663, 0, 0, 0, 1, 1,
-0.01725205, 1.56111, -1.164895, 0, 0, 0, 1, 1,
-0.01657717, -1.339368, -4.750584, 0, 0, 0, 1, 1,
-0.01258413, -1.497871, -3.313354, 0, 0, 0, 1, 1,
-0.009620321, -0.03508393, -3.576856, 0, 0, 0, 1, 1,
-0.008618323, 0.2094768, -0.2881609, 1, 1, 1, 1, 1,
-0.008601477, -0.7351058, -4.300995, 1, 1, 1, 1, 1,
-0.00669127, 1.227766, 0.9150057, 1, 1, 1, 1, 1,
-0.006674387, 2.199634, 1.692875, 1, 1, 1, 1, 1,
-0.005530696, -0.6745781, -3.428893, 1, 1, 1, 1, 1,
-0.005173919, -0.4445851, -3.296341, 1, 1, 1, 1, 1,
-9.623568e-05, 0.7620666, -2.007369, 1, 1, 1, 1, 1,
0.00293931, 0.3136111, 0.1975342, 1, 1, 1, 1, 1,
0.008232296, -0.3336626, 1.743933, 1, 1, 1, 1, 1,
0.01622089, 1.332496, -0.7603306, 1, 1, 1, 1, 1,
0.01872211, -0.3729885, 3.099875, 1, 1, 1, 1, 1,
0.0188722, 1.003538, 0.4374346, 1, 1, 1, 1, 1,
0.02396792, 0.3592052, -0.4208626, 1, 1, 1, 1, 1,
0.03321986, 0.3864441, -0.8220047, 1, 1, 1, 1, 1,
0.03331448, -0.01088182, 1.847522, 1, 1, 1, 1, 1,
0.03365292, -1.586962, 2.152261, 0, 0, 1, 1, 1,
0.0373072, 0.131234, -0.6842909, 1, 0, 0, 1, 1,
0.03886933, 0.7072567, -0.466968, 1, 0, 0, 1, 1,
0.04618526, -2.195793, 2.393321, 1, 0, 0, 1, 1,
0.04663038, 0.6197925, -0.3443702, 1, 0, 0, 1, 1,
0.05165574, -0.7999817, 4.585822, 1, 0, 0, 1, 1,
0.05627526, 0.6724137, -1.793209, 0, 0, 0, 1, 1,
0.05711411, 0.4043303, 0.5518645, 0, 0, 0, 1, 1,
0.05730262, 0.4576229, -0.5465595, 0, 0, 0, 1, 1,
0.06477645, 0.1010046, 0.9161274, 0, 0, 0, 1, 1,
0.06517626, -1.198795, 3.203867, 0, 0, 0, 1, 1,
0.06737857, 0.1679698, 0.7931439, 0, 0, 0, 1, 1,
0.06877433, -1.122426, 4.155904, 0, 0, 0, 1, 1,
0.07332995, -1.174744, 2.178687, 1, 1, 1, 1, 1,
0.0735518, 0.09875502, 0.4338762, 1, 1, 1, 1, 1,
0.07626318, -1.236302, 3.067002, 1, 1, 1, 1, 1,
0.07739957, -0.9260719, 3.386066, 1, 1, 1, 1, 1,
0.08133098, 1.464946, -0.1257378, 1, 1, 1, 1, 1,
0.08690839, 1.082215, 2.123506, 1, 1, 1, 1, 1,
0.08860727, -0.7351176, 1.313553, 1, 1, 1, 1, 1,
0.08999428, -0.7910264, 3.597502, 1, 1, 1, 1, 1,
0.09498306, -0.3399419, 1.961523, 1, 1, 1, 1, 1,
0.09773272, 1.369948, 0.8798431, 1, 1, 1, 1, 1,
0.100047, -1.172467, 5.087701, 1, 1, 1, 1, 1,
0.1066134, 0.5403818, -0.1929974, 1, 1, 1, 1, 1,
0.1090951, 1.30742, -1.017127, 1, 1, 1, 1, 1,
0.1121182, -0.9834637, 2.157545, 1, 1, 1, 1, 1,
0.1138782, -1.269744, 1.660903, 1, 1, 1, 1, 1,
0.1203948, -1.346943, 2.471365, 0, 0, 1, 1, 1,
0.1220041, 1.383526, 0.1471682, 1, 0, 0, 1, 1,
0.1260308, -0.9949519, 2.623468, 1, 0, 0, 1, 1,
0.1271387, -1.468536, 3.493312, 1, 0, 0, 1, 1,
0.1281596, 0.1798058, -0.5054159, 1, 0, 0, 1, 1,
0.1329933, 0.7908393, -0.8026947, 1, 0, 0, 1, 1,
0.1330009, -0.3853516, 0.6190658, 0, 0, 0, 1, 1,
0.1343911, 0.4723423, -1.003161, 0, 0, 0, 1, 1,
0.1368905, -2.248913, 3.043284, 0, 0, 0, 1, 1,
0.1404008, -0.07040304, 1.007732, 0, 0, 0, 1, 1,
0.1416737, 0.2846664, -0.4186511, 0, 0, 0, 1, 1,
0.1441044, 1.725221, 2.116011, 0, 0, 0, 1, 1,
0.1467632, 0.8837568, 2.356746, 0, 0, 0, 1, 1,
0.148603, 1.851183, 0.4000082, 1, 1, 1, 1, 1,
0.1512381, 0.7133266, 1.449898, 1, 1, 1, 1, 1,
0.1552224, 0.8062073, 1.411399, 1, 1, 1, 1, 1,
0.1612713, 1.786358, -1.559463, 1, 1, 1, 1, 1,
0.1662231, 0.5966299, -2.238706, 1, 1, 1, 1, 1,
0.166238, 0.4643801, -0.4579999, 1, 1, 1, 1, 1,
0.1666103, 1.512574, 0.1988276, 1, 1, 1, 1, 1,
0.1671769, -0.02846889, 1.519936, 1, 1, 1, 1, 1,
0.1705378, -1.344973, 2.05741, 1, 1, 1, 1, 1,
0.1733424, 0.6680707, 0.4033085, 1, 1, 1, 1, 1,
0.1744156, 1.400369, 0.2958257, 1, 1, 1, 1, 1,
0.1778933, 1.042182, 1.032053, 1, 1, 1, 1, 1,
0.1813064, -0.3172995, 3.118525, 1, 1, 1, 1, 1,
0.1841932, 1.871127, 1.3838, 1, 1, 1, 1, 1,
0.1893754, 0.3650259, -0.07694001, 1, 1, 1, 1, 1,
0.1906087, -1.531232, 2.835747, 0, 0, 1, 1, 1,
0.192, -1.12316, 2.131023, 1, 0, 0, 1, 1,
0.195392, -1.838, 2.986688, 1, 0, 0, 1, 1,
0.1956396, 0.9490002, -1.017469, 1, 0, 0, 1, 1,
0.2015154, 2.11708, -0.9511621, 1, 0, 0, 1, 1,
0.2045097, -0.3966241, 1.82009, 1, 0, 0, 1, 1,
0.2061746, -0.5393518, 2.252161, 0, 0, 0, 1, 1,
0.2066603, -1.117388, 2.127187, 0, 0, 0, 1, 1,
0.2117705, 0.3833147, 1.654585, 0, 0, 0, 1, 1,
0.2195914, 0.159902, 2.181602, 0, 0, 0, 1, 1,
0.2223493, 1.718338, 1.633926, 0, 0, 0, 1, 1,
0.2251621, 2.946449, 0.2010605, 0, 0, 0, 1, 1,
0.2253865, 0.5503426, 0.7173418, 0, 0, 0, 1, 1,
0.2269975, -0.1868435, 0.6455707, 1, 1, 1, 1, 1,
0.2274418, -0.7487447, 4.563682, 1, 1, 1, 1, 1,
0.2288539, -1.582037, 2.57172, 1, 1, 1, 1, 1,
0.2305749, 1.914446, 0.879109, 1, 1, 1, 1, 1,
0.2306762, -0.3370344, 3.598449, 1, 1, 1, 1, 1,
0.2361721, 0.8182421, 2.052441, 1, 1, 1, 1, 1,
0.2388463, -0.2977799, 2.244695, 1, 1, 1, 1, 1,
0.2411509, -1.748549, 3.466231, 1, 1, 1, 1, 1,
0.2430742, 0.1640588, 1.658457, 1, 1, 1, 1, 1,
0.2436122, -0.003257754, 1.108995, 1, 1, 1, 1, 1,
0.2446918, -0.1441355, 2.124001, 1, 1, 1, 1, 1,
0.2451694, 1.321661, -0.8390521, 1, 1, 1, 1, 1,
0.2478008, -1.275652, 1.875668, 1, 1, 1, 1, 1,
0.2486046, 1.264755, -0.2467637, 1, 1, 1, 1, 1,
0.2496149, -0.01758065, 2.110976, 1, 1, 1, 1, 1,
0.2529944, 1.224963, 0.2339932, 0, 0, 1, 1, 1,
0.2531429, 0.05763644, 1.633481, 1, 0, 0, 1, 1,
0.2588161, -2.270852, 1.065768, 1, 0, 0, 1, 1,
0.2592646, 0.6661813, 1.800674, 1, 0, 0, 1, 1,
0.2609499, -0.8240806, 3.383808, 1, 0, 0, 1, 1,
0.2627734, -0.04394329, 1.429963, 1, 0, 0, 1, 1,
0.2645151, 1.2357, -0.08337136, 0, 0, 0, 1, 1,
0.2728928, -1.50224, 3.320214, 0, 0, 0, 1, 1,
0.2782074, -0.9454263, 3.220853, 0, 0, 0, 1, 1,
0.2814398, -0.6849883, 2.967145, 0, 0, 0, 1, 1,
0.2833663, -0.09117469, 3.141712, 0, 0, 0, 1, 1,
0.2872351, 0.7037541, 1.287385, 0, 0, 0, 1, 1,
0.2905012, -0.6608996, 2.98487, 0, 0, 0, 1, 1,
0.2906502, 0.479536, 1.872238, 1, 1, 1, 1, 1,
0.2936768, -0.5364608, 3.953316, 1, 1, 1, 1, 1,
0.2943937, -0.5540345, 2.123304, 1, 1, 1, 1, 1,
0.2948553, 0.6983045, 0.05710148, 1, 1, 1, 1, 1,
0.2959169, -0.8607584, 2.889549, 1, 1, 1, 1, 1,
0.2959632, 0.3474011, 0.7231663, 1, 1, 1, 1, 1,
0.2959944, 0.2159806, 0.995462, 1, 1, 1, 1, 1,
0.2961313, 1.986003, 0.6135683, 1, 1, 1, 1, 1,
0.2969237, 0.6137233, 1.168809, 1, 1, 1, 1, 1,
0.2970655, -1.243302, 3.346209, 1, 1, 1, 1, 1,
0.2971249, 0.6034642, 0.09492587, 1, 1, 1, 1, 1,
0.2988375, 0.5514482, 1.191379, 1, 1, 1, 1, 1,
0.3002435, -1.179938, 1.295052, 1, 1, 1, 1, 1,
0.3067448, -1.228278, 1.751566, 1, 1, 1, 1, 1,
0.310155, 0.8314225, 0.3661165, 1, 1, 1, 1, 1,
0.3104244, -1.594561, 2.951555, 0, 0, 1, 1, 1,
0.3144569, 0.3739382, -0.7748536, 1, 0, 0, 1, 1,
0.3147784, -1.780473, 3.418203, 1, 0, 0, 1, 1,
0.3211673, 0.02441823, 1.651634, 1, 0, 0, 1, 1,
0.3317187, -0.1163933, 1.780382, 1, 0, 0, 1, 1,
0.3323555, -1.231462, 4.123969, 1, 0, 0, 1, 1,
0.3378609, -0.6662667, 4.183044, 0, 0, 0, 1, 1,
0.338005, -1.276079, 3.118484, 0, 0, 0, 1, 1,
0.3396064, 1.444085, 0.1644221, 0, 0, 0, 1, 1,
0.3422527, 0.4369753, 1.425388, 0, 0, 0, 1, 1,
0.3445831, -0.7500753, 1.977241, 0, 0, 0, 1, 1,
0.3491147, -1.196605, 3.740964, 0, 0, 0, 1, 1,
0.351241, 0.9517562, 0.5155986, 0, 0, 0, 1, 1,
0.3522753, -0.3961713, 2.020202, 1, 1, 1, 1, 1,
0.3593711, -1.432724, 1.81618, 1, 1, 1, 1, 1,
0.364281, 0.8891289, 0.01371963, 1, 1, 1, 1, 1,
0.3654318, 0.5976487, -1.434399, 1, 1, 1, 1, 1,
0.3668735, -0.3102157, 3.150488, 1, 1, 1, 1, 1,
0.3684638, 0.3908208, 0.3021563, 1, 1, 1, 1, 1,
0.3728487, -1.525728, 1.300047, 1, 1, 1, 1, 1,
0.3747979, -0.7169506, 3.559687, 1, 1, 1, 1, 1,
0.3767266, 0.5916345, 2.678519, 1, 1, 1, 1, 1,
0.3788781, 1.143793, -0.3577701, 1, 1, 1, 1, 1,
0.3799064, -1.116297, 1.267783, 1, 1, 1, 1, 1,
0.3802356, 0.6408868, 2.103747, 1, 1, 1, 1, 1,
0.3818271, -1.084759, 3.371214, 1, 1, 1, 1, 1,
0.3858003, -0.307208, 3.31746, 1, 1, 1, 1, 1,
0.3875546, -0.4219963, 0.07658407, 1, 1, 1, 1, 1,
0.3881339, -0.7122838, 4.081453, 0, 0, 1, 1, 1,
0.3946688, -0.1215455, 1.703161, 1, 0, 0, 1, 1,
0.398165, -0.3215321, 2.461958, 1, 0, 0, 1, 1,
0.3994338, -0.2633896, 3.088178, 1, 0, 0, 1, 1,
0.4083234, -2.4958, 1.709344, 1, 0, 0, 1, 1,
0.4104303, 0.002840566, 1.710619, 1, 0, 0, 1, 1,
0.4110149, 1.023319, 2.151024, 0, 0, 0, 1, 1,
0.416469, 0.4472022, 0.4018818, 0, 0, 0, 1, 1,
0.4167359, -0.1482252, 0.6193792, 0, 0, 0, 1, 1,
0.4181293, 0.6101318, -0.4510624, 0, 0, 0, 1, 1,
0.4201067, -0.4737835, 0.7759173, 0, 0, 0, 1, 1,
0.4216697, 0.2880791, 1.271837, 0, 0, 0, 1, 1,
0.4231627, -1.317801, 2.835385, 0, 0, 0, 1, 1,
0.4253598, -2.409952, 3.544488, 1, 1, 1, 1, 1,
0.4271991, 0.9441591, 0.175105, 1, 1, 1, 1, 1,
0.430693, -0.4722778, 2.867538, 1, 1, 1, 1, 1,
0.4421012, -1.323243, 2.723426, 1, 1, 1, 1, 1,
0.4447482, 0.6470737, 0.2324636, 1, 1, 1, 1, 1,
0.4467305, -0.1032039, 1.593215, 1, 1, 1, 1, 1,
0.4517058, -0.4965315, 1.706531, 1, 1, 1, 1, 1,
0.4529433, 1.619607, 0.4287089, 1, 1, 1, 1, 1,
0.4544393, -0.5319672, 3.404752, 1, 1, 1, 1, 1,
0.4569791, -1.422342, 3.570836, 1, 1, 1, 1, 1,
0.4605286, 0.4259562, 1.259403, 1, 1, 1, 1, 1,
0.4625582, 1.350583, 0.3360664, 1, 1, 1, 1, 1,
0.4680412, -0.5739939, 2.786809, 1, 1, 1, 1, 1,
0.4698612, -0.1213932, 1.58027, 1, 1, 1, 1, 1,
0.4734178, 0.707353, -0.7983944, 1, 1, 1, 1, 1,
0.473926, 0.9664357, -0.8549932, 0, 0, 1, 1, 1,
0.474427, 0.451733, 1.731379, 1, 0, 0, 1, 1,
0.480518, 0.9720854, 1.7878, 1, 0, 0, 1, 1,
0.4891766, 1.58567, 1.775696, 1, 0, 0, 1, 1,
0.4971181, -0.7104409, 1.216656, 1, 0, 0, 1, 1,
0.4972881, -0.9773762, 0.6395751, 1, 0, 0, 1, 1,
0.4992757, 1.294531, -0.5050201, 0, 0, 0, 1, 1,
0.4996674, -1.576914, 0.8473492, 0, 0, 0, 1, 1,
0.5003738, -0.5697933, 2.563501, 0, 0, 0, 1, 1,
0.5089988, -0.5764037, 2.229223, 0, 0, 0, 1, 1,
0.5107732, 0.331366, 0.04364058, 0, 0, 0, 1, 1,
0.5156239, 0.7477053, 1.045031, 0, 0, 0, 1, 1,
0.5168186, 0.02427202, -0.7190378, 0, 0, 0, 1, 1,
0.5181712, 0.3134906, -0.05446903, 1, 1, 1, 1, 1,
0.5197226, 1.362854, 1.341676, 1, 1, 1, 1, 1,
0.5208975, 1.351587, -0.3557376, 1, 1, 1, 1, 1,
0.5223459, 2.170457, -1.540331, 1, 1, 1, 1, 1,
0.5249887, 2.185805, 0.325757, 1, 1, 1, 1, 1,
0.5254779, -0.657208, 2.832118, 1, 1, 1, 1, 1,
0.5271059, 1.680154, -0.5499542, 1, 1, 1, 1, 1,
0.529864, -0.6437011, 2.060541, 1, 1, 1, 1, 1,
0.5308412, -1.395125, 4.789981, 1, 1, 1, 1, 1,
0.5325351, 1.520119, 1.130599, 1, 1, 1, 1, 1,
0.5393732, 2.46341, -0.3487386, 1, 1, 1, 1, 1,
0.5400066, 0.8293421, 0.7110841, 1, 1, 1, 1, 1,
0.5408396, 1.581344, 0.6490766, 1, 1, 1, 1, 1,
0.5521728, -0.8223711, 3.11033, 1, 1, 1, 1, 1,
0.5554893, 1.496831, -0.2943664, 1, 1, 1, 1, 1,
0.5582446, 0.7327138, 0.5012908, 0, 0, 1, 1, 1,
0.5608659, -0.6986539, 2.804615, 1, 0, 0, 1, 1,
0.5618405, -0.2341983, 1.415226, 1, 0, 0, 1, 1,
0.5635086, 0.4799185, 0.3590215, 1, 0, 0, 1, 1,
0.566349, 0.8988485, -1.005799, 1, 0, 0, 1, 1,
0.5668516, 1.289644, 1.152655, 1, 0, 0, 1, 1,
0.5718316, -0.04238831, 1.391476, 0, 0, 0, 1, 1,
0.5745084, 0.2022454, 1.157902, 0, 0, 0, 1, 1,
0.5746033, 1.293301, 1.730357, 0, 0, 0, 1, 1,
0.5766008, -0.5672375, 2.088846, 0, 0, 0, 1, 1,
0.5811492, -0.6738033, 2.119861, 0, 0, 0, 1, 1,
0.5867324, 0.7052751, 0.3790106, 0, 0, 0, 1, 1,
0.5879303, -1.266969, 3.87281, 0, 0, 0, 1, 1,
0.5890823, -0.1315268, 0.2482733, 1, 1, 1, 1, 1,
0.5928078, 0.2173825, 0.3195378, 1, 1, 1, 1, 1,
0.5991694, 0.535917, 0.9362932, 1, 1, 1, 1, 1,
0.60379, 1.018654, -0.720441, 1, 1, 1, 1, 1,
0.6084796, 1.046591, -2.141135, 1, 1, 1, 1, 1,
0.6107966, -0.03844269, 0.4110223, 1, 1, 1, 1, 1,
0.6131817, -0.9258811, 4.252795, 1, 1, 1, 1, 1,
0.6160067, 0.7140012, 1.460406, 1, 1, 1, 1, 1,
0.6169939, -1.529527, 1.929376, 1, 1, 1, 1, 1,
0.6187551, 0.9353464, -0.8490604, 1, 1, 1, 1, 1,
0.6247905, -1.274241, 1.347044, 1, 1, 1, 1, 1,
0.6297466, 0.4760351, 1.826723, 1, 1, 1, 1, 1,
0.6322585, 3.377939, 1.344408, 1, 1, 1, 1, 1,
0.6399755, -0.006742514, 0.4429547, 1, 1, 1, 1, 1,
0.6493467, -0.53803, 3.489577, 1, 1, 1, 1, 1,
0.6547128, -1.299066, 4.837327, 0, 0, 1, 1, 1,
0.6554083, 1.304884, 0.1511633, 1, 0, 0, 1, 1,
0.6568082, 1.032443, -0.3019689, 1, 0, 0, 1, 1,
0.6603016, -0.4573227, 1.078005, 1, 0, 0, 1, 1,
0.6822829, -0.2421032, 2.792065, 1, 0, 0, 1, 1,
0.6828562, -1.177237, 3.166618, 1, 0, 0, 1, 1,
0.6875209, 1.4999, 0.6895195, 0, 0, 0, 1, 1,
0.6878591, 0.8437529, -0.2343042, 0, 0, 0, 1, 1,
0.6920798, -1.762641, 3.603844, 0, 0, 0, 1, 1,
0.6954986, 1.942177, -0.7122681, 0, 0, 0, 1, 1,
0.7011555, -0.276868, 3.299128, 0, 0, 0, 1, 1,
0.7011859, -0.03381522, 3.942747, 0, 0, 0, 1, 1,
0.7022755, 2.562077, -0.7875726, 0, 0, 0, 1, 1,
0.7039378, 0.5390003, 0.8416622, 1, 1, 1, 1, 1,
0.7057688, -0.1790076, 4.429687, 1, 1, 1, 1, 1,
0.7077148, 1.137963, -0.3832945, 1, 1, 1, 1, 1,
0.7124106, -0.8102773, 3.36266, 1, 1, 1, 1, 1,
0.7137408, -0.4200141, 0.7428377, 1, 1, 1, 1, 1,
0.7141038, 1.852815, 1.578158, 1, 1, 1, 1, 1,
0.7205556, -0.02376489, -0.06679943, 1, 1, 1, 1, 1,
0.7341562, 2.145854, -0.8601621, 1, 1, 1, 1, 1,
0.7364624, 0.4500411, 2.771282, 1, 1, 1, 1, 1,
0.7372801, 1.861742, -0.3568059, 1, 1, 1, 1, 1,
0.7382358, 0.03720552, 2.209973, 1, 1, 1, 1, 1,
0.7413926, 0.2868595, -0.3742671, 1, 1, 1, 1, 1,
0.7441619, -0.3240863, 1.66369, 1, 1, 1, 1, 1,
0.7454231, -0.6290875, 1.325847, 1, 1, 1, 1, 1,
0.7455261, -1.419402, 3.395622, 1, 1, 1, 1, 1,
0.7512023, 1.959196, -1.069433, 0, 0, 1, 1, 1,
0.7528602, 0.7869683, 0.4472131, 1, 0, 0, 1, 1,
0.7554706, -0.5172431, 1.381815, 1, 0, 0, 1, 1,
0.75846, 0.1309212, -1.05418, 1, 0, 0, 1, 1,
0.761904, 1.079309, -0.1762164, 1, 0, 0, 1, 1,
0.7619185, -0.174616, 2.065963, 1, 0, 0, 1, 1,
0.7633634, -1.113998, 1.900721, 0, 0, 0, 1, 1,
0.7739202, -1.282665, 0.4668969, 0, 0, 0, 1, 1,
0.7760587, -0.8355395, 1.708797, 0, 0, 0, 1, 1,
0.7763473, 0.3951327, 0.4428073, 0, 0, 0, 1, 1,
0.7790658, -0.8202757, 2.975323, 0, 0, 0, 1, 1,
0.7808697, 0.8569043, 1.264814, 0, 0, 0, 1, 1,
0.7923541, -0.1831128, 2.563174, 0, 0, 0, 1, 1,
0.7942687, -0.6974341, 1.832361, 1, 1, 1, 1, 1,
0.7950875, -1.40276, 0.5442263, 1, 1, 1, 1, 1,
0.7993151, 0.6349369, 2.029473, 1, 1, 1, 1, 1,
0.8015143, 1.694244, -1.435193, 1, 1, 1, 1, 1,
0.8107454, 0.6809223, 1.171955, 1, 1, 1, 1, 1,
0.8117824, 0.2600592, 1.369162, 1, 1, 1, 1, 1,
0.8124769, -1.405964, 1.183675, 1, 1, 1, 1, 1,
0.8127182, 0.3849896, -1.129327, 1, 1, 1, 1, 1,
0.8127933, -1.404572, 3.181878, 1, 1, 1, 1, 1,
0.8136059, 0.6827273, 1.49199, 1, 1, 1, 1, 1,
0.8169616, -0.7554139, 1.583298, 1, 1, 1, 1, 1,
0.8188568, -1.275868, 4.525122, 1, 1, 1, 1, 1,
0.829671, 0.4209101, -0.2303764, 1, 1, 1, 1, 1,
0.8341282, 1.053457, 1.545222, 1, 1, 1, 1, 1,
0.8399658, -0.9499101, 4.086762, 1, 1, 1, 1, 1,
0.8483859, 0.2314315, 0.1567127, 0, 0, 1, 1, 1,
0.8486403, 1.042025, 1.687723, 1, 0, 0, 1, 1,
0.8495476, -0.9801747, 3.862828, 1, 0, 0, 1, 1,
0.8528138, 0.0450874, 2.781841, 1, 0, 0, 1, 1,
0.8558004, 1.99303, 1.370903, 1, 0, 0, 1, 1,
0.861318, 0.04752785, 0.8823559, 1, 0, 0, 1, 1,
0.8752565, -0.4614585, 1.576763, 0, 0, 0, 1, 1,
0.876302, 0.7091179, 0.3508287, 0, 0, 0, 1, 1,
0.8783316, 3.184002, -0.4740525, 0, 0, 0, 1, 1,
0.879893, 0.4119113, 2.248664, 0, 0, 0, 1, 1,
0.880161, 0.5386254, 0.2904732, 0, 0, 0, 1, 1,
0.880224, -2.043048, 2.505845, 0, 0, 0, 1, 1,
0.8803611, 1.425253, 1.890295, 0, 0, 0, 1, 1,
0.8937001, -0.1226652, 2.26456, 1, 1, 1, 1, 1,
0.8956134, 0.3411221, 0.8256641, 1, 1, 1, 1, 1,
0.9002943, 0.4563856, 1.056651, 1, 1, 1, 1, 1,
0.9036722, -1.875461, 2.041758, 1, 1, 1, 1, 1,
0.9039367, -0.8824002, 3.459286, 1, 1, 1, 1, 1,
0.9066747, 1.015369, 2.190443, 1, 1, 1, 1, 1,
0.9071959, -0.08197571, 1.372626, 1, 1, 1, 1, 1,
0.9097832, -0.6421468, 3.362508, 1, 1, 1, 1, 1,
0.9104202, 0.1186823, 1.876668, 1, 1, 1, 1, 1,
0.9108682, -0.09224635, 3.22685, 1, 1, 1, 1, 1,
0.912995, -0.8565179, 2.122053, 1, 1, 1, 1, 1,
0.9135128, -0.816736, 3.511408, 1, 1, 1, 1, 1,
0.9170501, -1.537792, 2.910449, 1, 1, 1, 1, 1,
0.9292708, 0.8905968, 1.442152, 1, 1, 1, 1, 1,
0.93115, -0.2529819, 1.159795, 1, 1, 1, 1, 1,
0.9324747, 2.249352, 0.5870734, 0, 0, 1, 1, 1,
0.9361223, -2.021045, 2.240111, 1, 0, 0, 1, 1,
0.9366567, 0.7471269, -0.7862917, 1, 0, 0, 1, 1,
0.9373217, -0.55994, 1.42253, 1, 0, 0, 1, 1,
0.9514483, 0.07612166, 1.242513, 1, 0, 0, 1, 1,
0.9548986, 0.630554, 2.007946, 1, 0, 0, 1, 1,
0.957568, -1.259307, 1.173459, 0, 0, 0, 1, 1,
0.9587146, 0.09994892, -1.137989, 0, 0, 0, 1, 1,
0.9602093, -0.1619257, 2.93137, 0, 0, 0, 1, 1,
0.966879, -0.1361496, 2.707085, 0, 0, 0, 1, 1,
0.9688334, 0.1344324, 1.710899, 0, 0, 0, 1, 1,
0.9696463, -0.8251024, 2.775875, 0, 0, 0, 1, 1,
0.9737065, 0.3954045, 0.3526621, 0, 0, 0, 1, 1,
0.9739784, 0.7988128, 0.8032522, 1, 1, 1, 1, 1,
0.9741481, -0.4544715, 2.788357, 1, 1, 1, 1, 1,
0.9794514, 2.629428, 1.256888, 1, 1, 1, 1, 1,
0.9916923, 1.067061, 1.159752, 1, 1, 1, 1, 1,
0.9973532, -0.3898371, 1.905961, 1, 1, 1, 1, 1,
0.998431, 0.4526912, 0.03933768, 1, 1, 1, 1, 1,
1.004036, 0.4887153, 1.066414, 1, 1, 1, 1, 1,
1.005471, -1.169375, 2.503354, 1, 1, 1, 1, 1,
1.009051, 0.6351865, 2.535876, 1, 1, 1, 1, 1,
1.012514, -2.384674, 2.805009, 1, 1, 1, 1, 1,
1.034385, 0.2107787, 0.03521554, 1, 1, 1, 1, 1,
1.045244, -0.1713678, 0.7702407, 1, 1, 1, 1, 1,
1.046568, -0.5879019, 1.843962, 1, 1, 1, 1, 1,
1.047035, 0.3509745, 3.446585, 1, 1, 1, 1, 1,
1.047115, 0.4014326, 1.701267, 1, 1, 1, 1, 1,
1.053903, 0.2050765, 2.484201, 0, 0, 1, 1, 1,
1.056383, 0.2988179, 2.598054, 1, 0, 0, 1, 1,
1.066981, 0.7269366, 1.129301, 1, 0, 0, 1, 1,
1.077982, 0.4439976, 2.076918, 1, 0, 0, 1, 1,
1.085374, -0.4126168, 1.911768, 1, 0, 0, 1, 1,
1.086129, 0.4856483, 2.043914, 1, 0, 0, 1, 1,
1.088223, -1.367836, 2.725044, 0, 0, 0, 1, 1,
1.091238, -0.7347727, 0.07773611, 0, 0, 0, 1, 1,
1.091682, 0.4133742, 1.211989, 0, 0, 0, 1, 1,
1.104602, 1.256401, 1.189786, 0, 0, 0, 1, 1,
1.108041, 0.1050406, 2.121268, 0, 0, 0, 1, 1,
1.113756, -0.5973186, 1.640256, 0, 0, 0, 1, 1,
1.123447, -0.187648, 0.5425994, 0, 0, 0, 1, 1,
1.12552, 0.98044, 1.019328, 1, 1, 1, 1, 1,
1.132027, 0.7106488, 0.7005453, 1, 1, 1, 1, 1,
1.132124, -0.904624, 2.176488, 1, 1, 1, 1, 1,
1.141877, 0.5690463, 1.627075, 1, 1, 1, 1, 1,
1.143037, -1.205378, 1.646798, 1, 1, 1, 1, 1,
1.148989, -0.4639029, 2.350383, 1, 1, 1, 1, 1,
1.153079, -0.7503039, 2.443044, 1, 1, 1, 1, 1,
1.160698, 2.31798, 0.8066067, 1, 1, 1, 1, 1,
1.167631, 1.854256, 0.4729154, 1, 1, 1, 1, 1,
1.168616, -1.113292, 1.421404, 1, 1, 1, 1, 1,
1.181396, 0.5615928, 1.373323, 1, 1, 1, 1, 1,
1.185959, -0.6417753, 1.283683, 1, 1, 1, 1, 1,
1.188324, -0.3390092, 1.729037, 1, 1, 1, 1, 1,
1.196682, 0.7384856, 2.169328, 1, 1, 1, 1, 1,
1.21064, 0.7721039, -0.7759607, 1, 1, 1, 1, 1,
1.214105, 1.194723, 1.306062, 0, 0, 1, 1, 1,
1.216467, 0.7613197, 0.5041119, 1, 0, 0, 1, 1,
1.218348, 0.5154228, 0.9163024, 1, 0, 0, 1, 1,
1.226416, 0.1751033, 1.233877, 1, 0, 0, 1, 1,
1.231965, 0.7047159, -0.907262, 1, 0, 0, 1, 1,
1.233071, -0.6376937, 3.85126, 1, 0, 0, 1, 1,
1.234131, 0.8352548, 0.8774907, 0, 0, 0, 1, 1,
1.255687, 0.05871423, 2.544644, 0, 0, 0, 1, 1,
1.257202, 3.380644, 0.21784, 0, 0, 0, 1, 1,
1.267453, -0.5872713, 2.346462, 0, 0, 0, 1, 1,
1.269741, -0.1003686, 1.847309, 0, 0, 0, 1, 1,
1.273403, 0.8104283, 0.0486505, 0, 0, 0, 1, 1,
1.276727, -0.7958084, 0.4357672, 0, 0, 0, 1, 1,
1.279473, 0.8948588, -0.210848, 1, 1, 1, 1, 1,
1.28478, -0.694167, 2.015811, 1, 1, 1, 1, 1,
1.285411, 2.124511, 0.5425014, 1, 1, 1, 1, 1,
1.286034, 2.252116, 0.6535727, 1, 1, 1, 1, 1,
1.299563, -1.451564, 1.737549, 1, 1, 1, 1, 1,
1.301312, 2.560443, 0.7690186, 1, 1, 1, 1, 1,
1.306088, -1.407248, 2.276987, 1, 1, 1, 1, 1,
1.313567, -1.246823, -0.02679231, 1, 1, 1, 1, 1,
1.31906, 0.6395331, 1.922639, 1, 1, 1, 1, 1,
1.320718, 0.7483668, 0.4953113, 1, 1, 1, 1, 1,
1.329769, -1.130255, 2.41249, 1, 1, 1, 1, 1,
1.342234, 1.020842, 0.296775, 1, 1, 1, 1, 1,
1.342988, 0.0265392, 2.535702, 1, 1, 1, 1, 1,
1.348705, 0.09815609, 1.618423, 1, 1, 1, 1, 1,
1.352522, -0.03633337, 2.912745, 1, 1, 1, 1, 1,
1.354873, -1.809351, 0.4394771, 0, 0, 1, 1, 1,
1.361601, -3.457392, 2.610852, 1, 0, 0, 1, 1,
1.367242, 0.7052737, 0.01799068, 1, 0, 0, 1, 1,
1.375044, -0.7117896, 2.996592, 1, 0, 0, 1, 1,
1.375979, -1.526482, 3.147917, 1, 0, 0, 1, 1,
1.377301, 0.8473943, 0.857181, 1, 0, 0, 1, 1,
1.381397, 1.763309, 1.134907, 0, 0, 0, 1, 1,
1.406157, -1.648409, 2.074712, 0, 0, 0, 1, 1,
1.410932, 0.5978896, 0.09203714, 0, 0, 0, 1, 1,
1.414771, -0.8533752, 2.683243, 0, 0, 0, 1, 1,
1.416258, -1.196846, 2.152009, 0, 0, 0, 1, 1,
1.416293, 1.106841, -1.359764, 0, 0, 0, 1, 1,
1.455422, -2.368216, 1.22185, 0, 0, 0, 1, 1,
1.462642, 0.6879547, 2.738702, 1, 1, 1, 1, 1,
1.464004, -1.098096, 1.970191, 1, 1, 1, 1, 1,
1.464715, 0.2200297, 0.8229771, 1, 1, 1, 1, 1,
1.467407, 0.07156328, 0.3698517, 1, 1, 1, 1, 1,
1.488487, -0.5355188, 2.380185, 1, 1, 1, 1, 1,
1.490155, 0.3689082, -0.4215513, 1, 1, 1, 1, 1,
1.50469, 1.703408, 1.335615, 1, 1, 1, 1, 1,
1.506648, -0.09280895, 2.193125, 1, 1, 1, 1, 1,
1.510831, 1.191531, -0.1336355, 1, 1, 1, 1, 1,
1.511262, -0.963017, 2.107832, 1, 1, 1, 1, 1,
1.512595, 1.35352, 1.997729, 1, 1, 1, 1, 1,
1.515504, 0.05109137, 0.1438218, 1, 1, 1, 1, 1,
1.518324, 1.358604, 1.88453, 1, 1, 1, 1, 1,
1.538017, -0.03334666, 2.161886, 1, 1, 1, 1, 1,
1.545122, -1.809068, 3.484636, 1, 1, 1, 1, 1,
1.545714, 0.3329463, 0.5858948, 0, 0, 1, 1, 1,
1.552706, -1.283012, 2.278073, 1, 0, 0, 1, 1,
1.557281, 0.703799, 1.12795, 1, 0, 0, 1, 1,
1.561944, 0.8347588, -0.1383845, 1, 0, 0, 1, 1,
1.567535, 0.9063309, 0.1748535, 1, 0, 0, 1, 1,
1.575827, -0.2720193, 1.93408, 1, 0, 0, 1, 1,
1.576411, 0.6267623, 0.3433836, 0, 0, 0, 1, 1,
1.582713, -0.0687433, 1.941891, 0, 0, 0, 1, 1,
1.586195, 1.708198, 2.457944, 0, 0, 0, 1, 1,
1.587268, -1.010061, 0.8662138, 0, 0, 0, 1, 1,
1.587284, 0.7078421, 0.5909233, 0, 0, 0, 1, 1,
1.5885, 0.11258, 0.5290034, 0, 0, 0, 1, 1,
1.627423, -0.9108272, 2.191267, 0, 0, 0, 1, 1,
1.634036, 0.4295103, 0.5788065, 1, 1, 1, 1, 1,
1.638457, 2.495314, 1.599326, 1, 1, 1, 1, 1,
1.639658, 1.625337, 0.1919006, 1, 1, 1, 1, 1,
1.649032, 0.3090186, 1.878315, 1, 1, 1, 1, 1,
1.653948, -0.9159994, 3.616404, 1, 1, 1, 1, 1,
1.655823, -0.9970911, 2.759701, 1, 1, 1, 1, 1,
1.657378, 1.530434, 2.37788, 1, 1, 1, 1, 1,
1.661982, -1.698607, 2.931424, 1, 1, 1, 1, 1,
1.668259, 0.1361216, 0.7745961, 1, 1, 1, 1, 1,
1.683243, 1.793304, -0.2072666, 1, 1, 1, 1, 1,
1.699341, -0.1183187, 2.959704, 1, 1, 1, 1, 1,
1.700782, 0.3804229, -0.4265064, 1, 1, 1, 1, 1,
1.719839, -0.4373718, 1.762736, 1, 1, 1, 1, 1,
1.732672, -1.496353, 1.917499, 1, 1, 1, 1, 1,
1.738445, -1.089833, 1.274855, 1, 1, 1, 1, 1,
1.741654, 0.6122975, 2.474054, 0, 0, 1, 1, 1,
1.7506, 1.483479, 1.184126, 1, 0, 0, 1, 1,
1.788253, 1.754845, 2.145908, 1, 0, 0, 1, 1,
1.792122, -0.3180743, 1.017669, 1, 0, 0, 1, 1,
1.817964, -0.7753349, 1.883353, 1, 0, 0, 1, 1,
1.829907, 1.902627, 3.631756, 1, 0, 0, 1, 1,
1.83778, -0.09990316, 2.07464, 0, 0, 0, 1, 1,
1.849077, -2.062926, 4.272159, 0, 0, 0, 1, 1,
1.861889, 0.6786488, 0.3204683, 0, 0, 0, 1, 1,
1.874853, 0.7928622, -0.5870779, 0, 0, 0, 1, 1,
1.885414, -0.3721946, 1.436324, 0, 0, 0, 1, 1,
1.893768, -1.457203, 2.228397, 0, 0, 0, 1, 1,
1.909306, 1.430606, -0.2486993, 0, 0, 0, 1, 1,
1.910653, 0.02042936, 0.2479994, 1, 1, 1, 1, 1,
1.937186, 0.2567396, 1.829279, 1, 1, 1, 1, 1,
1.941789, 1.24335, 1.480198, 1, 1, 1, 1, 1,
1.954459, 0.5329776, 0.3027349, 1, 1, 1, 1, 1,
1.956488, 0.7957569, 1.618894, 1, 1, 1, 1, 1,
1.971878, -1.015021, 1.892404, 1, 1, 1, 1, 1,
1.972807, -0.08730811, 2.322114, 1, 1, 1, 1, 1,
1.97347, -0.471069, 3.017577, 1, 1, 1, 1, 1,
1.995106, -0.7027443, 1.38577, 1, 1, 1, 1, 1,
2.003513, 1.914926, 0.8197984, 1, 1, 1, 1, 1,
2.017275, -0.7715324, 1.514549, 1, 1, 1, 1, 1,
2.023211, 0.09643619, 2.117954, 1, 1, 1, 1, 1,
2.027346, 0.5890566, 2.861539, 1, 1, 1, 1, 1,
2.04649, 0.3748879, 1.951407, 1, 1, 1, 1, 1,
2.048041, -0.3914917, 1.201095, 1, 1, 1, 1, 1,
2.06488, -0.7312235, 0.3053795, 0, 0, 1, 1, 1,
2.10434, 0.5418014, -0.8225016, 1, 0, 0, 1, 1,
2.110893, -0.2830739, 1.948631, 1, 0, 0, 1, 1,
2.150729, -0.8539023, 2.72157, 1, 0, 0, 1, 1,
2.154189, 0.3274499, 1.243243, 1, 0, 0, 1, 1,
2.159088, 0.1910619, 1.427894, 1, 0, 0, 1, 1,
2.198532, 0.05048173, 0.07847945, 0, 0, 0, 1, 1,
2.313127, -0.8057659, 1.937292, 0, 0, 0, 1, 1,
2.376793, -2.074684, 2.349895, 0, 0, 0, 1, 1,
2.449552, -0.1460929, 2.758252, 0, 0, 0, 1, 1,
2.52497, 0.3034698, 2.494449, 0, 0, 0, 1, 1,
2.586237, 0.7823575, -0.2775178, 0, 0, 0, 1, 1,
2.692028, 1.16922, 1.462162, 0, 0, 0, 1, 1,
2.731766, -0.1784069, 1.13213, 1, 1, 1, 1, 1,
2.748045, -1.313135, 2.101272, 1, 1, 1, 1, 1,
2.798872, 1.164383, 0.3682732, 1, 1, 1, 1, 1,
2.894241, -0.6292964, 1.46734, 1, 1, 1, 1, 1,
3.076112, -1.451005, 3.477069, 1, 1, 1, 1, 1,
3.146669, -0.755972, 3.48927, 1, 1, 1, 1, 1,
3.757469, -0.5158831, 2.381687, 1, 1, 1, 1, 1
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
var radius = 10.03338;
var distance = 35.24181;
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
mvMatrix.translate( -0.02909088, 0.03837395, 0.339736 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.24181);
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
