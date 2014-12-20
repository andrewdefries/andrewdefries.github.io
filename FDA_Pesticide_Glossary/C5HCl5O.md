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
-3.595399, -1.13342, -1.555913, 1, 0, 0, 1,
-3.198255, 2.347173, -1.859775, 1, 0.007843138, 0, 1,
-3.07465, -1.509812, -3.168509, 1, 0.01176471, 0, 1,
-2.725744, 2.197917, -0.4464366, 1, 0.01960784, 0, 1,
-2.713916, -0.7889366, -2.454841, 1, 0.02352941, 0, 1,
-2.689825, -0.2032017, -2.461257, 1, 0.03137255, 0, 1,
-2.601205, 1.098711, -2.145431, 1, 0.03529412, 0, 1,
-2.481355, 1.81337, -0.1706102, 1, 0.04313726, 0, 1,
-2.469353, -0.3965147, -3.424451, 1, 0.04705882, 0, 1,
-2.467326, -1.092003, -2.760464, 1, 0.05490196, 0, 1,
-2.333242, 0.07109477, -0.4150046, 1, 0.05882353, 0, 1,
-2.318221, -0.3687659, -0.857013, 1, 0.06666667, 0, 1,
-2.297272, 0.5129839, -1.060654, 1, 0.07058824, 0, 1,
-2.292909, 0.135945, -2.267496, 1, 0.07843138, 0, 1,
-2.26168, 0.4406206, 0.3958505, 1, 0.08235294, 0, 1,
-2.256042, 1.29102, -2.329116, 1, 0.09019608, 0, 1,
-2.240664, 0.7107732, -0.3027159, 1, 0.09411765, 0, 1,
-2.186875, 0.6985887, 0.002734801, 1, 0.1019608, 0, 1,
-2.082877, 0.3453031, -0.1899487, 1, 0.1098039, 0, 1,
-2.046717, -0.5786412, 0.3220114, 1, 0.1137255, 0, 1,
-2.025451, 0.8640121, -2.021562, 1, 0.1215686, 0, 1,
-2.013361, -0.2779085, -2.351706, 1, 0.1254902, 0, 1,
-1.947049, 1.077771, -0.024284, 1, 0.1333333, 0, 1,
-1.91135, 0.6992377, -2.03946, 1, 0.1372549, 0, 1,
-1.896955, 0.8820814, -0.8368226, 1, 0.145098, 0, 1,
-1.863093, -0.7953132, -1.054806, 1, 0.1490196, 0, 1,
-1.861222, -0.7147429, -3.135164, 1, 0.1568628, 0, 1,
-1.851887, 0.5707527, 0.5051456, 1, 0.1607843, 0, 1,
-1.849406, -0.6825339, -2.234529, 1, 0.1686275, 0, 1,
-1.817595, -0.9883842, -0.5902953, 1, 0.172549, 0, 1,
-1.816513, 0.01413535, -0.6016818, 1, 0.1803922, 0, 1,
-1.809046, 0.1587457, -1.843517, 1, 0.1843137, 0, 1,
-1.746032, -0.6973441, -2.161794, 1, 0.1921569, 0, 1,
-1.733225, 2.509386, 0.8852396, 1, 0.1960784, 0, 1,
-1.712754, 0.9823419, -2.866734, 1, 0.2039216, 0, 1,
-1.700619, 1.417098, -1.391506, 1, 0.2117647, 0, 1,
-1.687998, -0.7536662, -1.115394, 1, 0.2156863, 0, 1,
-1.67673, -0.3080184, -0.8580428, 1, 0.2235294, 0, 1,
-1.657687, 0.2653252, -1.512667, 1, 0.227451, 0, 1,
-1.639436, 1.031291, -1.563488, 1, 0.2352941, 0, 1,
-1.630597, 1.044351, -1.365636, 1, 0.2392157, 0, 1,
-1.625125, -1.331272, -2.264446, 1, 0.2470588, 0, 1,
-1.620213, 0.2174245, -1.801848, 1, 0.2509804, 0, 1,
-1.617608, 0.4908284, 0.4383194, 1, 0.2588235, 0, 1,
-1.610237, -0.1554685, -1.971982, 1, 0.2627451, 0, 1,
-1.608993, 0.2778198, -0.9951566, 1, 0.2705882, 0, 1,
-1.608591, 1.267458, -1.198013, 1, 0.2745098, 0, 1,
-1.588049, -1.493155, -1.127673, 1, 0.282353, 0, 1,
-1.58768, -1.305072, -1.725018, 1, 0.2862745, 0, 1,
-1.584989, 0.2943964, -2.071951, 1, 0.2941177, 0, 1,
-1.578932, -1.05148, -2.279661, 1, 0.3019608, 0, 1,
-1.560692, -0.3752, -2.642947, 1, 0.3058824, 0, 1,
-1.560392, -0.01741889, -1.495894, 1, 0.3137255, 0, 1,
-1.555785, 0.4113318, -1.483309, 1, 0.3176471, 0, 1,
-1.545088, -3.293959, -2.527689, 1, 0.3254902, 0, 1,
-1.543906, 1.527192, -0.4317102, 1, 0.3294118, 0, 1,
-1.533235, 0.5899269, -2.688854, 1, 0.3372549, 0, 1,
-1.531884, 0.3622539, -1.790134, 1, 0.3411765, 0, 1,
-1.521009, 1.3076, -0.7300112, 1, 0.3490196, 0, 1,
-1.520774, 0.3320027, -0.60946, 1, 0.3529412, 0, 1,
-1.514489, 0.1613631, -0.1512513, 1, 0.3607843, 0, 1,
-1.513901, 1.453242, -2.032804, 1, 0.3647059, 0, 1,
-1.504161, 0.04480491, -1.442139, 1, 0.372549, 0, 1,
-1.498753, -0.3439837, -0.4079624, 1, 0.3764706, 0, 1,
-1.488871, -1.593201, -1.417127, 1, 0.3843137, 0, 1,
-1.488479, 0.2203752, -1.077209, 1, 0.3882353, 0, 1,
-1.488303, -0.4425441, -2.148523, 1, 0.3960784, 0, 1,
-1.482691, -0.239989, -2.068575, 1, 0.4039216, 0, 1,
-1.476366, -1.15511, -2.965189, 1, 0.4078431, 0, 1,
-1.473585, 0.3306171, -2.558135, 1, 0.4156863, 0, 1,
-1.472298, 0.9536592, -1.195102, 1, 0.4196078, 0, 1,
-1.467967, -0.04807726, -1.959389, 1, 0.427451, 0, 1,
-1.455728, 0.07320539, -0.6840016, 1, 0.4313726, 0, 1,
-1.446338, 0.8491048, -1.387288, 1, 0.4392157, 0, 1,
-1.444012, -1.222048, -2.107246, 1, 0.4431373, 0, 1,
-1.435359, -1.469585, -2.416495, 1, 0.4509804, 0, 1,
-1.428108, -0.3359739, -1.10914, 1, 0.454902, 0, 1,
-1.424579, 1.415911, -1.214038, 1, 0.4627451, 0, 1,
-1.42082, -1.209755, -2.484257, 1, 0.4666667, 0, 1,
-1.416056, -1.481392, -3.462671, 1, 0.4745098, 0, 1,
-1.414051, -1.73782, -2.1545, 1, 0.4784314, 0, 1,
-1.41295, 1.196811, -2.209201, 1, 0.4862745, 0, 1,
-1.411159, -0.8538327, -4.498915, 1, 0.4901961, 0, 1,
-1.39808, 0.9890543, -2.398477, 1, 0.4980392, 0, 1,
-1.393547, -0.129739, -2.27058, 1, 0.5058824, 0, 1,
-1.393358, -0.2009202, -2.267937, 1, 0.509804, 0, 1,
-1.392828, -1.53183, -1.37027, 1, 0.5176471, 0, 1,
-1.379746, -2.235252, -2.589701, 1, 0.5215687, 0, 1,
-1.379114, -0.9923538, -2.436007, 1, 0.5294118, 0, 1,
-1.370808, 1.329855, -0.4427221, 1, 0.5333334, 0, 1,
-1.366091, 0.506534, -1.409847, 1, 0.5411765, 0, 1,
-1.361645, 0.3233873, -2.745217, 1, 0.5450981, 0, 1,
-1.356408, 0.8207929, -1.120033, 1, 0.5529412, 0, 1,
-1.353329, 0.2209202, -2.750412, 1, 0.5568628, 0, 1,
-1.342926, 0.1197569, -0.498242, 1, 0.5647059, 0, 1,
-1.335733, -1.636062, -1.757411, 1, 0.5686275, 0, 1,
-1.335003, -1.089774, -2.378816, 1, 0.5764706, 0, 1,
-1.33121, 0.5114135, -0.7504094, 1, 0.5803922, 0, 1,
-1.328756, -0.3305227, -3.15369, 1, 0.5882353, 0, 1,
-1.314894, -0.6881441, 0.2308309, 1, 0.5921569, 0, 1,
-1.307078, -1.978054, -2.030411, 1, 0.6, 0, 1,
-1.303394, 1.070795, -0.7604107, 1, 0.6078432, 0, 1,
-1.303169, 0.1568374, -1.84434, 1, 0.6117647, 0, 1,
-1.300085, 0.7018768, -0.1282113, 1, 0.6196079, 0, 1,
-1.293378, -0.4933468, -3.093078, 1, 0.6235294, 0, 1,
-1.28399, 1.449696, 0.4356955, 1, 0.6313726, 0, 1,
-1.267802, 0.04482555, -1.119762, 1, 0.6352941, 0, 1,
-1.26377, -0.5516809, -1.140591, 1, 0.6431373, 0, 1,
-1.261759, 1.538421, -1.467598, 1, 0.6470588, 0, 1,
-1.259928, 0.4095322, -1.592521, 1, 0.654902, 0, 1,
-1.257885, 1.35406, -1.465076, 1, 0.6588235, 0, 1,
-1.256288, -0.5800852, -2.757148, 1, 0.6666667, 0, 1,
-1.246016, -0.6208185, -0.7064351, 1, 0.6705883, 0, 1,
-1.245578, -0.1420008, -2.08478, 1, 0.6784314, 0, 1,
-1.244689, 0.5227408, -3.296026, 1, 0.682353, 0, 1,
-1.244282, 0.7466643, -1.968883, 1, 0.6901961, 0, 1,
-1.235585, 0.07076092, -1.431074, 1, 0.6941177, 0, 1,
-1.228285, -1.376799, -2.865633, 1, 0.7019608, 0, 1,
-1.226751, -0.8551182, -3.184271, 1, 0.7098039, 0, 1,
-1.210849, 0.6550592, -1.465089, 1, 0.7137255, 0, 1,
-1.192555, 2.146375, -0.1263826, 1, 0.7215686, 0, 1,
-1.184196, 0.6933432, -2.018861, 1, 0.7254902, 0, 1,
-1.182946, -0.3718452, -0.6853651, 1, 0.7333333, 0, 1,
-1.16092, 0.8423533, -0.7113875, 1, 0.7372549, 0, 1,
-1.155593, -1.036342, -3.959833, 1, 0.7450981, 0, 1,
-1.146484, -1.058389, -3.419038, 1, 0.7490196, 0, 1,
-1.143489, 0.4610007, -2.139083, 1, 0.7568628, 0, 1,
-1.141497, 0.146513, -2.696252, 1, 0.7607843, 0, 1,
-1.137991, -1.482643, -2.675649, 1, 0.7686275, 0, 1,
-1.13003, 0.1676648, -1.292944, 1, 0.772549, 0, 1,
-1.119945, 0.5397227, -0.1173155, 1, 0.7803922, 0, 1,
-1.119485, -0.2167714, -2.025674, 1, 0.7843137, 0, 1,
-1.112941, 0.1669384, -2.21801, 1, 0.7921569, 0, 1,
-1.106374, 0.2981916, -0.1291307, 1, 0.7960784, 0, 1,
-1.10205, -0.1166367, -1.23659, 1, 0.8039216, 0, 1,
-1.098648, 0.733546, -1.115068, 1, 0.8117647, 0, 1,
-1.095011, 0.7231236, -0.4785307, 1, 0.8156863, 0, 1,
-1.092906, 0.06328405, -0.3757368, 1, 0.8235294, 0, 1,
-1.091265, -1.545354, -2.654254, 1, 0.827451, 0, 1,
-1.079946, -0.8115961, -1.617882, 1, 0.8352941, 0, 1,
-1.069603, -0.0342535, -0.1133881, 1, 0.8392157, 0, 1,
-1.064284, 0.4194822, -2.970459, 1, 0.8470588, 0, 1,
-1.054964, 0.1503905, -1.043994, 1, 0.8509804, 0, 1,
-1.052173, -0.647077, -0.388565, 1, 0.8588235, 0, 1,
-1.051027, -1.228392, -2.020628, 1, 0.8627451, 0, 1,
-1.04751, 0.389645, -2.283071, 1, 0.8705882, 0, 1,
-1.04381, -0.4314419, -1.374167, 1, 0.8745098, 0, 1,
-1.030908, 0.6588849, 0.07113329, 1, 0.8823529, 0, 1,
-1.029801, 0.8562289, -3.03215, 1, 0.8862745, 0, 1,
-1.028515, 2.752964, 0.0847363, 1, 0.8941177, 0, 1,
-1.017912, -0.3016445, -1.858099, 1, 0.8980392, 0, 1,
-1.017099, -1.064463, -2.122833, 1, 0.9058824, 0, 1,
-1.0149, -0.02029245, -1.681662, 1, 0.9137255, 0, 1,
-1.008382, 0.8406858, -0.8377278, 1, 0.9176471, 0, 1,
-1.006589, 0.3418655, -1.684524, 1, 0.9254902, 0, 1,
-1.006486, -0.2853967, -3.511975, 1, 0.9294118, 0, 1,
-0.9973799, -0.4262577, -2.973142, 1, 0.9372549, 0, 1,
-0.9889598, -1.074735, -2.229187, 1, 0.9411765, 0, 1,
-0.9867219, -0.9152839, -1.446936, 1, 0.9490196, 0, 1,
-0.9860847, -0.1168347, -2.876714, 1, 0.9529412, 0, 1,
-0.9720331, -1.236101, -2.013422, 1, 0.9607843, 0, 1,
-0.9636008, 0.3947288, -1.477989, 1, 0.9647059, 0, 1,
-0.9615233, 0.4330613, -1.571571, 1, 0.972549, 0, 1,
-0.9614154, 1.003355, -1.56536, 1, 0.9764706, 0, 1,
-0.9579244, 0.1726445, -3.358792, 1, 0.9843137, 0, 1,
-0.9562155, 1.533344, 0.08326264, 1, 0.9882353, 0, 1,
-0.9531366, 0.483194, -1.249355, 1, 0.9960784, 0, 1,
-0.9466016, 0.2395266, -0.9858686, 0.9960784, 1, 0, 1,
-0.9463401, -0.9725153, -2.916735, 0.9921569, 1, 0, 1,
-0.9432004, 2.679294, -1.747278, 0.9843137, 1, 0, 1,
-0.9429976, -1.829061, -4.07, 0.9803922, 1, 0, 1,
-0.9417926, 0.3632567, -1.102508, 0.972549, 1, 0, 1,
-0.9389769, -0.5667036, -2.810752, 0.9686275, 1, 0, 1,
-0.9320704, -0.2478453, -3.319099, 0.9607843, 1, 0, 1,
-0.9319291, 0.4011436, -0.6257292, 0.9568627, 1, 0, 1,
-0.9295249, 0.5526274, -1.777899, 0.9490196, 1, 0, 1,
-0.9214545, -0.7698871, -1.910532, 0.945098, 1, 0, 1,
-0.8980264, -0.9162444, -3.24359, 0.9372549, 1, 0, 1,
-0.8917956, 0.1341402, -0.7394906, 0.9333333, 1, 0, 1,
-0.8759587, -0.1074936, -1.382903, 0.9254902, 1, 0, 1,
-0.875885, -1.801479, -0.8294372, 0.9215686, 1, 0, 1,
-0.8720904, -0.3491687, -2.866307, 0.9137255, 1, 0, 1,
-0.8714436, 0.636479, -0.3956747, 0.9098039, 1, 0, 1,
-0.868516, -0.02747622, -2.04349, 0.9019608, 1, 0, 1,
-0.8678336, -0.3797431, -1.236865, 0.8941177, 1, 0, 1,
-0.866607, 0.8881875, 0.1060285, 0.8901961, 1, 0, 1,
-0.8659401, -1.304157, -2.339708, 0.8823529, 1, 0, 1,
-0.8649182, 0.0587846, -0.8497913, 0.8784314, 1, 0, 1,
-0.8620961, 0.1690346, -0.4212477, 0.8705882, 1, 0, 1,
-0.8618659, -0.0424432, -2.982167, 0.8666667, 1, 0, 1,
-0.8605218, 0.1611845, -2.613036, 0.8588235, 1, 0, 1,
-0.8568975, 1.299972, -0.4001049, 0.854902, 1, 0, 1,
-0.8549759, -1.152368, -2.319178, 0.8470588, 1, 0, 1,
-0.8546207, 0.601976, 0.2112394, 0.8431373, 1, 0, 1,
-0.8529193, 1.292681, 0.03562956, 0.8352941, 1, 0, 1,
-0.848656, -0.126653, -2.515158, 0.8313726, 1, 0, 1,
-0.8472705, -0.5167122, -4.049504, 0.8235294, 1, 0, 1,
-0.8461095, -1.423412, -2.512377, 0.8196079, 1, 0, 1,
-0.8391619, 1.391968, 1.455706, 0.8117647, 1, 0, 1,
-0.8327515, -1.165223, -3.254544, 0.8078431, 1, 0, 1,
-0.8305094, 0.08019344, -2.659784, 0.8, 1, 0, 1,
-0.8288727, -0.3288371, -2.115905, 0.7921569, 1, 0, 1,
-0.8263756, 1.269602, -0.8902045, 0.7882353, 1, 0, 1,
-0.8232673, 0.6073236, -0.2735562, 0.7803922, 1, 0, 1,
-0.8205399, 1.007118, -0.6759436, 0.7764706, 1, 0, 1,
-0.8157184, -1.55407, -3.153826, 0.7686275, 1, 0, 1,
-0.8138634, -1.03906, -2.574443, 0.7647059, 1, 0, 1,
-0.8112464, -0.8281965, -3.76701, 0.7568628, 1, 0, 1,
-0.8002315, -0.4912021, -0.8167984, 0.7529412, 1, 0, 1,
-0.8001041, -0.8419646, -1.605134, 0.7450981, 1, 0, 1,
-0.795644, 0.5100915, -0.8267896, 0.7411765, 1, 0, 1,
-0.7899005, 1.648199, -0.5873766, 0.7333333, 1, 0, 1,
-0.786031, -0.6184885, -2.56417, 0.7294118, 1, 0, 1,
-0.7792991, -1.38141, -3.347168, 0.7215686, 1, 0, 1,
-0.7775882, -0.08103316, -3.119863, 0.7176471, 1, 0, 1,
-0.7643468, -1.356601, -3.059159, 0.7098039, 1, 0, 1,
-0.7640759, 1.420445, -1.084989, 0.7058824, 1, 0, 1,
-0.7629061, -1.075011, -3.125802, 0.6980392, 1, 0, 1,
-0.7460611, 0.1367396, -2.110402, 0.6901961, 1, 0, 1,
-0.7445934, -0.5046084, -1.415967, 0.6862745, 1, 0, 1,
-0.7401667, 1.200682, 1.128223, 0.6784314, 1, 0, 1,
-0.738074, 0.07965555, -1.114875, 0.6745098, 1, 0, 1,
-0.7366119, 0.04878997, -2.3018, 0.6666667, 1, 0, 1,
-0.735259, 0.2454202, -0.707325, 0.6627451, 1, 0, 1,
-0.7284169, 0.9623704, -0.2380325, 0.654902, 1, 0, 1,
-0.7279451, -1.019842, -1.485371, 0.6509804, 1, 0, 1,
-0.7203047, 0.4422431, -2.005625, 0.6431373, 1, 0, 1,
-0.7182407, -0.2241945, -3.71277, 0.6392157, 1, 0, 1,
-0.7165189, -0.2166713, -2.723222, 0.6313726, 1, 0, 1,
-0.7149579, 1.388534, -1.291584, 0.627451, 1, 0, 1,
-0.7056766, -0.05421615, -2.164537, 0.6196079, 1, 0, 1,
-0.7040836, 1.094114, -1.103165, 0.6156863, 1, 0, 1,
-0.7029237, 2.20185, 1.059016, 0.6078432, 1, 0, 1,
-0.7014681, 1.301541, -2.282072, 0.6039216, 1, 0, 1,
-0.695426, 2.293017, 1.155004, 0.5960785, 1, 0, 1,
-0.6938828, 0.1877859, -1.725927, 0.5882353, 1, 0, 1,
-0.6918802, 0.115333, -0.8203965, 0.5843138, 1, 0, 1,
-0.6912087, -0.943896, -1.69394, 0.5764706, 1, 0, 1,
-0.6897244, 0.249585, -3.148551, 0.572549, 1, 0, 1,
-0.688202, -0.05109547, -2.962567, 0.5647059, 1, 0, 1,
-0.6804435, 0.5251012, -2.35173, 0.5607843, 1, 0, 1,
-0.6770861, 0.2786629, -3.496402, 0.5529412, 1, 0, 1,
-0.6733849, -1.410025, -0.5848274, 0.5490196, 1, 0, 1,
-0.6731692, -0.3439068, -2.852022, 0.5411765, 1, 0, 1,
-0.6647745, -1.376744, -2.700016, 0.5372549, 1, 0, 1,
-0.6635926, -0.7880901, -1.649632, 0.5294118, 1, 0, 1,
-0.6588668, -1.306555, -2.530588, 0.5254902, 1, 0, 1,
-0.6586153, 0.4710914, -1.09853, 0.5176471, 1, 0, 1,
-0.6585208, 1.234841, -0.5193465, 0.5137255, 1, 0, 1,
-0.6568071, 1.700342, -0.2796413, 0.5058824, 1, 0, 1,
-0.6550959, -0.8511599, -2.624524, 0.5019608, 1, 0, 1,
-0.6535113, 1.010507, -0.964979, 0.4941176, 1, 0, 1,
-0.6501103, -0.7300846, -0.1404631, 0.4862745, 1, 0, 1,
-0.6473646, 0.7210471, -0.404307, 0.4823529, 1, 0, 1,
-0.6473566, 0.602236, -0.9707015, 0.4745098, 1, 0, 1,
-0.6445602, 0.2108253, -0.4128865, 0.4705882, 1, 0, 1,
-0.6370642, -0.3780617, -2.793834, 0.4627451, 1, 0, 1,
-0.629841, 0.8455803, 0.9166476, 0.4588235, 1, 0, 1,
-0.6282798, 0.9077686, -1.128594, 0.4509804, 1, 0, 1,
-0.6259466, -0.1873032, -0.946271, 0.4470588, 1, 0, 1,
-0.6242161, 0.05112242, -2.219302, 0.4392157, 1, 0, 1,
-0.620505, -1.472638, -5.297589, 0.4352941, 1, 0, 1,
-0.6204457, -0.6922771, -1.779705, 0.427451, 1, 0, 1,
-0.6185842, 0.2037776, -1.799699, 0.4235294, 1, 0, 1,
-0.6181948, 1.463505, -1.07475, 0.4156863, 1, 0, 1,
-0.6127386, -0.5274228, -0.4567141, 0.4117647, 1, 0, 1,
-0.608853, -0.0962746, -2.242, 0.4039216, 1, 0, 1,
-0.6083918, 0.2845781, -1.592237, 0.3960784, 1, 0, 1,
-0.6046087, -0.8440998, -1.590808, 0.3921569, 1, 0, 1,
-0.6019293, -0.7326881, -1.764051, 0.3843137, 1, 0, 1,
-0.6011622, 0.3416146, -0.9383051, 0.3803922, 1, 0, 1,
-0.5940553, 0.8777139, -0.3478109, 0.372549, 1, 0, 1,
-0.5922841, 0.161847, -2.247943, 0.3686275, 1, 0, 1,
-0.5916737, -0.4154087, -1.888262, 0.3607843, 1, 0, 1,
-0.5879207, -0.5303282, -1.850572, 0.3568628, 1, 0, 1,
-0.5867223, 2.497205, 0.07796599, 0.3490196, 1, 0, 1,
-0.5851567, -0.5229278, -2.740192, 0.345098, 1, 0, 1,
-0.582593, -0.1946594, -0.4036329, 0.3372549, 1, 0, 1,
-0.5762414, -0.3245581, -1.480632, 0.3333333, 1, 0, 1,
-0.5747271, -0.1389071, -1.683227, 0.3254902, 1, 0, 1,
-0.5729316, 0.131074, -2.862945, 0.3215686, 1, 0, 1,
-0.5717931, -0.05537092, -0.7195547, 0.3137255, 1, 0, 1,
-0.5706102, 0.7571381, -1.76028, 0.3098039, 1, 0, 1,
-0.5690287, 0.5443776, -0.5460014, 0.3019608, 1, 0, 1,
-0.5675772, 1.399047, -0.5374789, 0.2941177, 1, 0, 1,
-0.5668586, -0.446546, 0.1234634, 0.2901961, 1, 0, 1,
-0.5664014, -1.826777, -1.648061, 0.282353, 1, 0, 1,
-0.5621497, -1.404152, -3.039039, 0.2784314, 1, 0, 1,
-0.5615969, 0.4964626, -0.3924597, 0.2705882, 1, 0, 1,
-0.5588064, -0.8303933, -1.663706, 0.2666667, 1, 0, 1,
-0.5577531, -0.9750072, -3.897871, 0.2588235, 1, 0, 1,
-0.5562553, 0.4304415, -1.206151, 0.254902, 1, 0, 1,
-0.5558452, 0.2700738, -3.117252, 0.2470588, 1, 0, 1,
-0.5552696, 1.253275, 0.0477434, 0.2431373, 1, 0, 1,
-0.5540397, -0.9175634, -2.578743, 0.2352941, 1, 0, 1,
-0.5540096, -1.363831, -1.734625, 0.2313726, 1, 0, 1,
-0.5489808, -0.3791334, -0.8333064, 0.2235294, 1, 0, 1,
-0.5400673, 0.7377457, 0.2870311, 0.2196078, 1, 0, 1,
-0.5371461, -0.3708544, -2.950129, 0.2117647, 1, 0, 1,
-0.5348783, -1.936652, -0.7773626, 0.2078431, 1, 0, 1,
-0.5348206, -0.9979351, -3.844678, 0.2, 1, 0, 1,
-0.5316562, -0.4983983, -3.257731, 0.1921569, 1, 0, 1,
-0.5290942, -1.083376, -3.033564, 0.1882353, 1, 0, 1,
-0.5267491, -0.9810175, -1.247939, 0.1803922, 1, 0, 1,
-0.526252, -0.6943171, -2.896688, 0.1764706, 1, 0, 1,
-0.5232413, 0.3494706, -1.935201, 0.1686275, 1, 0, 1,
-0.5218574, 0.8368641, -0.3262802, 0.1647059, 1, 0, 1,
-0.5190836, -0.4975804, -2.120107, 0.1568628, 1, 0, 1,
-0.5176418, -0.8655239, -3.797315, 0.1529412, 1, 0, 1,
-0.517507, 0.9979984, -0.3807911, 0.145098, 1, 0, 1,
-0.5157148, 1.30708, 1.333132, 0.1411765, 1, 0, 1,
-0.5125854, -0.9228435, -1.171725, 0.1333333, 1, 0, 1,
-0.5087798, 1.095356, 0.2459852, 0.1294118, 1, 0, 1,
-0.5005015, 0.4983143, -1.147592, 0.1215686, 1, 0, 1,
-0.4995551, 1.45067, -0.2455963, 0.1176471, 1, 0, 1,
-0.4931399, 1.019502, -1.015544, 0.1098039, 1, 0, 1,
-0.4914874, -0.6648695, -1.913041, 0.1058824, 1, 0, 1,
-0.490716, -1.139191, -3.777795, 0.09803922, 1, 0, 1,
-0.48253, 1.245617, 0.1362877, 0.09019608, 1, 0, 1,
-0.4729305, 0.02364677, -1.611513, 0.08627451, 1, 0, 1,
-0.4727511, 0.3517984, 0.2826624, 0.07843138, 1, 0, 1,
-0.472291, -0.5650274, -2.897648, 0.07450981, 1, 0, 1,
-0.4715168, -0.9183725, -3.090228, 0.06666667, 1, 0, 1,
-0.4714756, -0.2946171, -1.104026, 0.0627451, 1, 0, 1,
-0.4675969, 1.253821, -0.6608085, 0.05490196, 1, 0, 1,
-0.462482, -0.4787991, -0.2036604, 0.05098039, 1, 0, 1,
-0.4578134, -1.029055, -2.747191, 0.04313726, 1, 0, 1,
-0.4570656, -1.285532, -2.918198, 0.03921569, 1, 0, 1,
-0.4564887, 0.8955504, 0.7989111, 0.03137255, 1, 0, 1,
-0.4494973, -0.1810265, -3.103587, 0.02745098, 1, 0, 1,
-0.4464271, 0.9291618, -1.175321, 0.01960784, 1, 0, 1,
-0.4450175, -1.478342, -1.586377, 0.01568628, 1, 0, 1,
-0.444955, -1.84243, -1.567758, 0.007843138, 1, 0, 1,
-0.4440055, 0.3559299, 1.026141, 0.003921569, 1, 0, 1,
-0.4399459, -1.30696, -3.686209, 0, 1, 0.003921569, 1,
-0.4285244, -0.09064304, -3.325504, 0, 1, 0.01176471, 1,
-0.4270898, 0.4634608, -0.8796751, 0, 1, 0.01568628, 1,
-0.4219643, -1.777033, -2.413884, 0, 1, 0.02352941, 1,
-0.4205552, -0.8228261, 0.03869652, 0, 1, 0.02745098, 1,
-0.4176469, -0.4561577, -2.345994, 0, 1, 0.03529412, 1,
-0.4162866, 0.2269531, -0.3999501, 0, 1, 0.03921569, 1,
-0.4112568, 1.604962, -1.142779, 0, 1, 0.04705882, 1,
-0.4101735, 0.5336539, 0.3808174, 0, 1, 0.05098039, 1,
-0.3983088, 0.3014866, 0.5091794, 0, 1, 0.05882353, 1,
-0.3970583, 0.6517952, 0.3300312, 0, 1, 0.0627451, 1,
-0.3969051, 1.149037, -1.008196, 0, 1, 0.07058824, 1,
-0.3879987, -1.23401, -1.695066, 0, 1, 0.07450981, 1,
-0.3879319, -2.354535, -3.085234, 0, 1, 0.08235294, 1,
-0.3870941, -0.8677296, -1.715098, 0, 1, 0.08627451, 1,
-0.3860706, 0.5560051, -0.5356097, 0, 1, 0.09411765, 1,
-0.3804541, -0.7216199, -3.262919, 0, 1, 0.1019608, 1,
-0.3786164, 0.6796814, -1.087559, 0, 1, 0.1058824, 1,
-0.3766562, 1.069854, 0.9993584, 0, 1, 0.1137255, 1,
-0.3718897, -0.7098189, -0.2352008, 0, 1, 0.1176471, 1,
-0.371675, -0.8173017, -2.375949, 0, 1, 0.1254902, 1,
-0.3706951, -0.1520044, -3.505346, 0, 1, 0.1294118, 1,
-0.3697976, -2.11987, -4.458039, 0, 1, 0.1372549, 1,
-0.3521987, 0.8701222, -1.408919, 0, 1, 0.1411765, 1,
-0.3502035, 0.8448972, -2.148886, 0, 1, 0.1490196, 1,
-0.3451309, 0.2058807, -1.826784, 0, 1, 0.1529412, 1,
-0.3397536, 0.3765905, -1.307281, 0, 1, 0.1607843, 1,
-0.3328618, 0.9175872, 0.5268262, 0, 1, 0.1647059, 1,
-0.3318113, 0.4836437, -1.492957, 0, 1, 0.172549, 1,
-0.329507, 0.887659, 1.480228, 0, 1, 0.1764706, 1,
-0.3292263, -2.004569, -3.904777, 0, 1, 0.1843137, 1,
-0.3264427, -0.3407419, -3.762767, 0, 1, 0.1882353, 1,
-0.3100994, 1.083947, -0.5580262, 0, 1, 0.1960784, 1,
-0.3057384, -1.120342, -2.699587, 0, 1, 0.2039216, 1,
-0.305424, -0.4220613, -1.778234, 0, 1, 0.2078431, 1,
-0.3046519, 0.4561308, -1.398396, 0, 1, 0.2156863, 1,
-0.304627, 1.091416, 0.7428166, 0, 1, 0.2196078, 1,
-0.3039144, -1.434914, -3.624835, 0, 1, 0.227451, 1,
-0.3039125, -0.5829099, -3.88021, 0, 1, 0.2313726, 1,
-0.2899162, -1.161791, -2.446204, 0, 1, 0.2392157, 1,
-0.2891837, 0.129119, -1.393087, 0, 1, 0.2431373, 1,
-0.2852311, 0.2218148, 0.4300798, 0, 1, 0.2509804, 1,
-0.2850638, 0.06731053, 1.099232, 0, 1, 0.254902, 1,
-0.2841068, 0.910553, -0.8125826, 0, 1, 0.2627451, 1,
-0.283583, 1.563437, 0.1719709, 0, 1, 0.2666667, 1,
-0.2787674, 1.222575, 0.1153772, 0, 1, 0.2745098, 1,
-0.277895, 0.5587643, 0.9218542, 0, 1, 0.2784314, 1,
-0.2724519, 0.3219703, -1.351241, 0, 1, 0.2862745, 1,
-0.2721696, 0.959357, -1.949953, 0, 1, 0.2901961, 1,
-0.2702992, 0.7825713, 1.082663, 0, 1, 0.2980392, 1,
-0.2687577, 0.296467, -1.06681, 0, 1, 0.3058824, 1,
-0.2650081, 1.160468, -1.174745, 0, 1, 0.3098039, 1,
-0.2595007, -2.163221, -2.938777, 0, 1, 0.3176471, 1,
-0.2561866, -1.035991, -4.346159, 0, 1, 0.3215686, 1,
-0.2558776, -0.4704799, -2.016418, 0, 1, 0.3294118, 1,
-0.2546994, -0.1905797, -1.994478, 0, 1, 0.3333333, 1,
-0.2540998, 0.2244923, -1.159611, 0, 1, 0.3411765, 1,
-0.252536, -0.8295236, -3.905731, 0, 1, 0.345098, 1,
-0.2488472, -0.4714481, -1.936578, 0, 1, 0.3529412, 1,
-0.2485849, 1.057442, 0.2373058, 0, 1, 0.3568628, 1,
-0.2451965, -1.373376, -2.865456, 0, 1, 0.3647059, 1,
-0.2432027, -0.3619715, -2.64017, 0, 1, 0.3686275, 1,
-0.2398209, -0.1145452, -2.787833, 0, 1, 0.3764706, 1,
-0.2386283, -0.3296892, -3.207963, 0, 1, 0.3803922, 1,
-0.2377072, 0.2592548, -1.01616, 0, 1, 0.3882353, 1,
-0.2338421, -0.06497069, -1.168219, 0, 1, 0.3921569, 1,
-0.2334945, -2.202463, -2.219259, 0, 1, 0.4, 1,
-0.2275691, -1.210516, -3.092391, 0, 1, 0.4078431, 1,
-0.2266884, 0.8548223, -1.037303, 0, 1, 0.4117647, 1,
-0.2247825, -0.7659266, -3.373471, 0, 1, 0.4196078, 1,
-0.2237977, -0.1646313, -2.014914, 0, 1, 0.4235294, 1,
-0.2232202, -1.730196, -3.06409, 0, 1, 0.4313726, 1,
-0.2221941, 0.348823, 0.399454, 0, 1, 0.4352941, 1,
-0.2135693, -1.081112, -3.49023, 0, 1, 0.4431373, 1,
-0.2120321, -0.7760562, -2.124167, 0, 1, 0.4470588, 1,
-0.210048, 0.625611, 0.7485948, 0, 1, 0.454902, 1,
-0.2097326, 1.596662, 1.089334, 0, 1, 0.4588235, 1,
-0.2082642, -0.4578972, -4.132503, 0, 1, 0.4666667, 1,
-0.2052757, 0.1886704, -1.637239, 0, 1, 0.4705882, 1,
-0.204563, 1.851875, 0.3415786, 0, 1, 0.4784314, 1,
-0.1980263, -0.1960864, -1.179269, 0, 1, 0.4823529, 1,
-0.1979914, -0.1424917, -3.155, 0, 1, 0.4901961, 1,
-0.1962721, -0.7565903, -3.666651, 0, 1, 0.4941176, 1,
-0.1916585, -0.1788163, -3.218712, 0, 1, 0.5019608, 1,
-0.187789, 0.8693767, 1.07304, 0, 1, 0.509804, 1,
-0.180287, 0.6565486, 1.005919, 0, 1, 0.5137255, 1,
-0.1740341, 1.031794, -0.3490354, 0, 1, 0.5215687, 1,
-0.1737847, -1.037182, -3.379877, 0, 1, 0.5254902, 1,
-0.1734341, -0.1338456, 0.2890243, 0, 1, 0.5333334, 1,
-0.173049, -0.2663274, -3.712483, 0, 1, 0.5372549, 1,
-0.1702148, 0.3644988, -1.264794, 0, 1, 0.5450981, 1,
-0.163573, 0.2475363, 0.6910327, 0, 1, 0.5490196, 1,
-0.1608824, -1.390769, -1.990792, 0, 1, 0.5568628, 1,
-0.1600899, 0.8749025, -1.389424, 0, 1, 0.5607843, 1,
-0.1568357, -1.29141, -4.28837, 0, 1, 0.5686275, 1,
-0.1558917, 0.3836634, -0.4966187, 0, 1, 0.572549, 1,
-0.1548239, -0.4208608, -4.467543, 0, 1, 0.5803922, 1,
-0.1509344, 1.20423, 0.9311136, 0, 1, 0.5843138, 1,
-0.1470914, -0.551756, -1.623978, 0, 1, 0.5921569, 1,
-0.1469052, 0.9082606, -1.614334, 0, 1, 0.5960785, 1,
-0.1465569, 1.449328, -0.5119938, 0, 1, 0.6039216, 1,
-0.1457098, 1.521054, 0.7281989, 0, 1, 0.6117647, 1,
-0.1426168, 0.2244166, 0.4041565, 0, 1, 0.6156863, 1,
-0.1377, -1.048311, -3.587438, 0, 1, 0.6235294, 1,
-0.1368409, -0.7898656, -3.612705, 0, 1, 0.627451, 1,
-0.1363406, 2.648259, 1.852651, 0, 1, 0.6352941, 1,
-0.1340641, 1.214087, -1.288058, 0, 1, 0.6392157, 1,
-0.1315604, -1.721341, -4.555536, 0, 1, 0.6470588, 1,
-0.131172, 0.1822138, -0.6791673, 0, 1, 0.6509804, 1,
-0.1309839, -0.01034149, -1.40374, 0, 1, 0.6588235, 1,
-0.1279097, 0.4112804, 1.127417, 0, 1, 0.6627451, 1,
-0.1253666, 0.3504067, 0.2550882, 0, 1, 0.6705883, 1,
-0.1236387, 0.127787, -2.076885, 0, 1, 0.6745098, 1,
-0.1189807, 0.9812137, -1.214108, 0, 1, 0.682353, 1,
-0.1172678, -1.211157, -2.127544, 0, 1, 0.6862745, 1,
-0.1111189, 0.06758182, 0.2701304, 0, 1, 0.6941177, 1,
-0.1056482, 0.5219027, -0.5201937, 0, 1, 0.7019608, 1,
-0.09957971, 0.3404984, -0.6737554, 0, 1, 0.7058824, 1,
-0.09611469, 0.08276909, -1.329957, 0, 1, 0.7137255, 1,
-0.09387119, -0.1269081, -5.009337, 0, 1, 0.7176471, 1,
-0.09273034, 0.6477899, 1.982405, 0, 1, 0.7254902, 1,
-0.09228617, -1.307246, -2.048802, 0, 1, 0.7294118, 1,
-0.09221834, -1.634459, -1.815961, 0, 1, 0.7372549, 1,
-0.08608707, -0.6587686, -1.351798, 0, 1, 0.7411765, 1,
-0.08169015, 2.078377, 0.1077028, 0, 1, 0.7490196, 1,
-0.08099848, 0.5714988, -0.2213729, 0, 1, 0.7529412, 1,
-0.07891162, 0.3194364, -0.1104267, 0, 1, 0.7607843, 1,
-0.0771885, -0.4854041, -2.220868, 0, 1, 0.7647059, 1,
-0.07694915, 0.6274521, 0.2935081, 0, 1, 0.772549, 1,
-0.06846496, 0.7491988, 0.4334619, 0, 1, 0.7764706, 1,
-0.06816414, -2.055466, -3.294726, 0, 1, 0.7843137, 1,
-0.0677438, 1.302593, 0.1904835, 0, 1, 0.7882353, 1,
-0.06768708, 0.4003491, 0.6044574, 0, 1, 0.7960784, 1,
-0.06433365, -0.6357815, -4.4695, 0, 1, 0.8039216, 1,
-0.06099033, -0.838352, -3.300422, 0, 1, 0.8078431, 1,
-0.05861015, -0.1619624, -2.191723, 0, 1, 0.8156863, 1,
-0.05815178, -0.6162333, -3.441277, 0, 1, 0.8196079, 1,
-0.05553566, 1.344823, -1.205228, 0, 1, 0.827451, 1,
-0.05243162, -1.401954, -5.201091, 0, 1, 0.8313726, 1,
-0.0457608, 0.3528931, -0.1121733, 0, 1, 0.8392157, 1,
-0.04274781, -1.092161, -3.563929, 0, 1, 0.8431373, 1,
-0.04202496, 2.138604, 0.8173079, 0, 1, 0.8509804, 1,
-0.03310259, -0.09534035, -3.07751, 0, 1, 0.854902, 1,
-0.03151058, -0.2169553, -3.544611, 0, 1, 0.8627451, 1,
-0.02986127, 0.7229927, -0.1990125, 0, 1, 0.8666667, 1,
-0.02718122, -0.08306308, -4.616569, 0, 1, 0.8745098, 1,
-0.02259677, 0.8806833, 0.5659743, 0, 1, 0.8784314, 1,
-0.0210901, -0.9484713, -1.825904, 0, 1, 0.8862745, 1,
-0.020784, -0.1674515, -5.344504, 0, 1, 0.8901961, 1,
-0.02030772, -0.04089664, -0.5527956, 0, 1, 0.8980392, 1,
-0.01867482, -0.5543274, -2.003546, 0, 1, 0.9058824, 1,
-0.01444196, 1.426007, 1.72003, 0, 1, 0.9098039, 1,
-0.005241908, 0.5345268, -1.043792, 0, 1, 0.9176471, 1,
-0.001320391, 1.897266, 1.567515, 0, 1, 0.9215686, 1,
-0.001000627, 1.003741, -0.692227, 0, 1, 0.9294118, 1,
-0.0002389461, -1.473507, -4.3901, 0, 1, 0.9333333, 1,
0.001858233, 1.39686, 1.907636, 0, 1, 0.9411765, 1,
0.006073256, 0.7295837, -0.4182013, 0, 1, 0.945098, 1,
0.009272796, 0.2821234, -0.1930055, 0, 1, 0.9529412, 1,
0.009930639, 1.086252, -0.9224805, 0, 1, 0.9568627, 1,
0.01350723, 0.1254902, 1.091627, 0, 1, 0.9647059, 1,
0.01474009, -0.4714252, 3.789647, 0, 1, 0.9686275, 1,
0.01662319, -1.130445, 3.802866, 0, 1, 0.9764706, 1,
0.01718952, 0.3407194, -0.7855828, 0, 1, 0.9803922, 1,
0.0172216, -0.2287248, 3.675909, 0, 1, 0.9882353, 1,
0.02630779, -0.1934438, 3.669644, 0, 1, 0.9921569, 1,
0.02970329, 0.1669963, 0.8940567, 0, 1, 1, 1,
0.0318776, 0.2189154, -0.6828657, 0, 0.9921569, 1, 1,
0.03362765, -0.5692685, 1.725522, 0, 0.9882353, 1, 1,
0.04122788, 1.544297, 0.615669, 0, 0.9803922, 1, 1,
0.04235424, -1.629483, 2.281199, 0, 0.9764706, 1, 1,
0.04351383, -1.091853, 3.655332, 0, 0.9686275, 1, 1,
0.04489785, -0.3879059, 3.089297, 0, 0.9647059, 1, 1,
0.05384943, -0.9471029, 2.172879, 0, 0.9568627, 1, 1,
0.05398357, 0.9410371, 1.113639, 0, 0.9529412, 1, 1,
0.05478393, 0.1944491, 0.5520551, 0, 0.945098, 1, 1,
0.05497833, 1.256596, 0.1202019, 0, 0.9411765, 1, 1,
0.05902215, 0.3645914, -0.9641788, 0, 0.9333333, 1, 1,
0.06151828, 1.649507, 1.206173, 0, 0.9294118, 1, 1,
0.06249572, 0.5237941, 0.5583262, 0, 0.9215686, 1, 1,
0.06304348, 0.3364821, 0.5708678, 0, 0.9176471, 1, 1,
0.06897185, -0.3908347, 3.164991, 0, 0.9098039, 1, 1,
0.07145381, -1.203554, 3.062574, 0, 0.9058824, 1, 1,
0.07150254, -0.1837186, 2.143858, 0, 0.8980392, 1, 1,
0.07358091, 0.2185449, -1.113217, 0, 0.8901961, 1, 1,
0.07888138, 0.2884115, -0.1274124, 0, 0.8862745, 1, 1,
0.0839951, -0.7497492, 2.118693, 0, 0.8784314, 1, 1,
0.08666209, -0.1969436, 3.41454, 0, 0.8745098, 1, 1,
0.0920177, -0.07974078, 1.886491, 0, 0.8666667, 1, 1,
0.0931102, -2.161036, 1.157236, 0, 0.8627451, 1, 1,
0.09366743, 1.109777, 0.4200515, 0, 0.854902, 1, 1,
0.09389619, -0.3003071, 2.305294, 0, 0.8509804, 1, 1,
0.09761093, 1.098673, -0.5153489, 0, 0.8431373, 1, 1,
0.09908636, -0.06984372, 3.591257, 0, 0.8392157, 1, 1,
0.09970412, 2.344919, 1.504156, 0, 0.8313726, 1, 1,
0.1043045, 0.4533022, 0.1272259, 0, 0.827451, 1, 1,
0.1070001, 1.130724, 0.4199512, 0, 0.8196079, 1, 1,
0.1107581, -0.3176926, 3.016814, 0, 0.8156863, 1, 1,
0.1135329, -1.916614, 0.9718155, 0, 0.8078431, 1, 1,
0.1173641, 0.2989667, 0.04303951, 0, 0.8039216, 1, 1,
0.1203953, 1.038948, -1.159551, 0, 0.7960784, 1, 1,
0.1213431, -0.5725374, 4.870095, 0, 0.7882353, 1, 1,
0.1256793, -0.3337561, 2.381023, 0, 0.7843137, 1, 1,
0.1300796, -1.677075, 2.740518, 0, 0.7764706, 1, 1,
0.134926, 0.9998139, -0.5285047, 0, 0.772549, 1, 1,
0.1418617, 1.653981, 0.6304219, 0, 0.7647059, 1, 1,
0.1429583, -0.9299476, 3.446037, 0, 0.7607843, 1, 1,
0.1443187, 0.4287642, 1.915575, 0, 0.7529412, 1, 1,
0.1446833, -0.5788503, 1.405364, 0, 0.7490196, 1, 1,
0.1474293, -0.1060881, 1.73015, 0, 0.7411765, 1, 1,
0.1491551, 0.6539519, 0.374785, 0, 0.7372549, 1, 1,
0.1497763, 0.6206024, 0.8266217, 0, 0.7294118, 1, 1,
0.1524357, 1.111854, -1.392547, 0, 0.7254902, 1, 1,
0.1528622, -0.6365728, 2.840252, 0, 0.7176471, 1, 1,
0.1529124, -0.3649925, 2.012631, 0, 0.7137255, 1, 1,
0.1572199, 0.2670324, -0.2163762, 0, 0.7058824, 1, 1,
0.159318, -1.971775, 0.9023004, 0, 0.6980392, 1, 1,
0.1648673, -0.9511907, 2.979236, 0, 0.6941177, 1, 1,
0.1653375, 0.1385421, 0.3067756, 0, 0.6862745, 1, 1,
0.1662425, 1.372145, 0.754039, 0, 0.682353, 1, 1,
0.1682186, -0.4349708, 4.248161, 0, 0.6745098, 1, 1,
0.1688089, -0.05396097, 2.204843, 0, 0.6705883, 1, 1,
0.1697896, -1.82429, 2.017137, 0, 0.6627451, 1, 1,
0.1725939, -0.8890868, 2.040926, 0, 0.6588235, 1, 1,
0.1739611, 1.100234, -0.0148761, 0, 0.6509804, 1, 1,
0.1763153, -1.159818, 1.759383, 0, 0.6470588, 1, 1,
0.18513, -0.6117427, 3.919454, 0, 0.6392157, 1, 1,
0.1880389, -0.4708435, 3.619151, 0, 0.6352941, 1, 1,
0.1881145, -1.485065, 2.043753, 0, 0.627451, 1, 1,
0.1905807, 1.245354, 0.02717792, 0, 0.6235294, 1, 1,
0.1963599, -0.526854, 2.300451, 0, 0.6156863, 1, 1,
0.19882, 1.143554, 1.063081, 0, 0.6117647, 1, 1,
0.2023065, -0.04268945, 1.481107, 0, 0.6039216, 1, 1,
0.2047187, -0.5512286, 1.626469, 0, 0.5960785, 1, 1,
0.2061369, 0.7898866, -1.041624, 0, 0.5921569, 1, 1,
0.2091539, -0.3232558, 4.178406, 0, 0.5843138, 1, 1,
0.2095142, -1.912061, 2.014678, 0, 0.5803922, 1, 1,
0.2100027, -0.4350123, 3.405362, 0, 0.572549, 1, 1,
0.2107182, 0.006272443, 2.718174, 0, 0.5686275, 1, 1,
0.2114224, -0.6582704, 1.757161, 0, 0.5607843, 1, 1,
0.2133896, -1.705842, 4.731692, 0, 0.5568628, 1, 1,
0.2140483, 0.6816002, 2.032554, 0, 0.5490196, 1, 1,
0.2141996, 0.8999638, 0.4084775, 0, 0.5450981, 1, 1,
0.214506, -0.659746, 3.31919, 0, 0.5372549, 1, 1,
0.224305, 0.7508395, 0.03084673, 0, 0.5333334, 1, 1,
0.2290952, -1.1808, 1.406929, 0, 0.5254902, 1, 1,
0.2311147, 0.6558898, 0.9754722, 0, 0.5215687, 1, 1,
0.2340455, 0.5278702, 1.531301, 0, 0.5137255, 1, 1,
0.235106, 1.172681, 0.2747281, 0, 0.509804, 1, 1,
0.2388941, -0.2575994, 1.356532, 0, 0.5019608, 1, 1,
0.2397423, 0.3347006, -0.7011681, 0, 0.4941176, 1, 1,
0.2424162, 0.4036103, 1.148524, 0, 0.4901961, 1, 1,
0.2442843, -0.9970192, 4.13245, 0, 0.4823529, 1, 1,
0.2453707, -2.263424, 3.743063, 0, 0.4784314, 1, 1,
0.250506, -0.3797268, 2.450755, 0, 0.4705882, 1, 1,
0.2568626, 0.2366273, 1.651844, 0, 0.4666667, 1, 1,
0.2571294, -2.289671, 1.766776, 0, 0.4588235, 1, 1,
0.2587079, 0.553687, -0.001511794, 0, 0.454902, 1, 1,
0.2590197, 0.4943512, -1.083269, 0, 0.4470588, 1, 1,
0.2628983, -0.4862722, 3.691824, 0, 0.4431373, 1, 1,
0.2645129, 0.1683938, 0.4283061, 0, 0.4352941, 1, 1,
0.2656956, -1.261635, 3.058578, 0, 0.4313726, 1, 1,
0.266041, -1.676942, 3.457983, 0, 0.4235294, 1, 1,
0.272718, -2.780866, 1.995077, 0, 0.4196078, 1, 1,
0.2734498, 0.8534641, 0.6670023, 0, 0.4117647, 1, 1,
0.2748916, -0.6085318, 3.141664, 0, 0.4078431, 1, 1,
0.2761769, 0.2395502, -0.09042531, 0, 0.4, 1, 1,
0.2843444, 0.5783333, 1.981713, 0, 0.3921569, 1, 1,
0.2915694, -1.994417, 2.112851, 0, 0.3882353, 1, 1,
0.2920991, 1.262128, 0.7603381, 0, 0.3803922, 1, 1,
0.3008806, 2.175464, 0.8535175, 0, 0.3764706, 1, 1,
0.3069128, -1.227284, 4.215002, 0, 0.3686275, 1, 1,
0.307548, 0.4311384, 0.6859007, 0, 0.3647059, 1, 1,
0.3107634, 0.4577494, 1.081573, 0, 0.3568628, 1, 1,
0.3109505, 0.7095893, 3.130841, 0, 0.3529412, 1, 1,
0.3136445, 1.505161, -0.7006102, 0, 0.345098, 1, 1,
0.314252, 0.9382151, 0.1522237, 0, 0.3411765, 1, 1,
0.3153568, -0.5051382, 2.914556, 0, 0.3333333, 1, 1,
0.3208179, 0.5678837, 1.0878, 0, 0.3294118, 1, 1,
0.3229181, -2.263716, 1.605462, 0, 0.3215686, 1, 1,
0.3255921, -1.287685, 2.544186, 0, 0.3176471, 1, 1,
0.3294812, -0.593944, 1.920744, 0, 0.3098039, 1, 1,
0.3298062, 0.918933, -0.8826081, 0, 0.3058824, 1, 1,
0.3323601, 0.118356, 3.226061, 0, 0.2980392, 1, 1,
0.3326813, -0.4130746, 1.400841, 0, 0.2901961, 1, 1,
0.3369511, 0.2215877, 1.904529, 0, 0.2862745, 1, 1,
0.3373619, -0.1112774, 0.3060665, 0, 0.2784314, 1, 1,
0.3415185, 0.1061364, 1.186704, 0, 0.2745098, 1, 1,
0.3415912, 0.02422697, 1.520699, 0, 0.2666667, 1, 1,
0.3422716, 1.053471, 0.144007, 0, 0.2627451, 1, 1,
0.3451557, 0.4461232, -0.2985447, 0, 0.254902, 1, 1,
0.3531491, 0.3152794, 2.192454, 0, 0.2509804, 1, 1,
0.355829, -0.5370566, 0.8533872, 0, 0.2431373, 1, 1,
0.3582091, -0.1606449, 2.799989, 0, 0.2392157, 1, 1,
0.364999, 0.5701162, 0.7202289, 0, 0.2313726, 1, 1,
0.3711162, -1.231071, 3.425342, 0, 0.227451, 1, 1,
0.3756213, -0.7469769, 3.498285, 0, 0.2196078, 1, 1,
0.3791455, 0.7431964, -0.6472408, 0, 0.2156863, 1, 1,
0.3819306, 0.2803141, 2.176721, 0, 0.2078431, 1, 1,
0.3830699, -1.070006, 3.069064, 0, 0.2039216, 1, 1,
0.3832597, 0.9438066, 1.302654, 0, 0.1960784, 1, 1,
0.3870041, -0.71259, 2.824121, 0, 0.1882353, 1, 1,
0.3943791, -0.4110701, 1.073369, 0, 0.1843137, 1, 1,
0.4009779, -0.5081335, 2.918881, 0, 0.1764706, 1, 1,
0.4036576, 0.3355502, 2.334921, 0, 0.172549, 1, 1,
0.4047591, 1.440621, 0.5243611, 0, 0.1647059, 1, 1,
0.4101253, -1.185073, 2.48507, 0, 0.1607843, 1, 1,
0.4133276, 0.2004916, 0.9147435, 0, 0.1529412, 1, 1,
0.4153335, 0.6208853, 1.037753, 0, 0.1490196, 1, 1,
0.4156505, -0.004870315, 2.990201, 0, 0.1411765, 1, 1,
0.4187378, -0.9696888, 2.517735, 0, 0.1372549, 1, 1,
0.4188001, 0.9791631, 1.918841, 0, 0.1294118, 1, 1,
0.4201772, -0.05222499, 0.5914518, 0, 0.1254902, 1, 1,
0.4217604, -0.6919886, 1.198656, 0, 0.1176471, 1, 1,
0.4274239, 0.50465, 0.8434988, 0, 0.1137255, 1, 1,
0.4286285, 0.9564452, 0.3649128, 0, 0.1058824, 1, 1,
0.4325802, 0.223657, 1.830507, 0, 0.09803922, 1, 1,
0.4360774, 0.1121321, 0.8960493, 0, 0.09411765, 1, 1,
0.4375639, 0.3693461, -0.2635975, 0, 0.08627451, 1, 1,
0.4421628, -0.5934954, 1.487089, 0, 0.08235294, 1, 1,
0.4436822, 1.821949, -0.439941, 0, 0.07450981, 1, 1,
0.4438898, 0.7829984, 0.4459237, 0, 0.07058824, 1, 1,
0.4474447, 0.4350692, 0.6771506, 0, 0.0627451, 1, 1,
0.4506641, 0.9645751, 1.418583, 0, 0.05882353, 1, 1,
0.4518001, -2.49405, 3.476216, 0, 0.05098039, 1, 1,
0.4522766, -0.5490587, 2.531576, 0, 0.04705882, 1, 1,
0.4535794, -0.4572667, 2.341303, 0, 0.03921569, 1, 1,
0.4539428, -0.4308996, 5.73099, 0, 0.03529412, 1, 1,
0.4569562, -0.3750404, 3.474886, 0, 0.02745098, 1, 1,
0.4597938, 0.3887576, 0.3845227, 0, 0.02352941, 1, 1,
0.4628346, -0.2317773, 1.270822, 0, 0.01568628, 1, 1,
0.4688995, -0.9541351, 3.138699, 0, 0.01176471, 1, 1,
0.4727799, 1.154649, 2.478477, 0, 0.003921569, 1, 1,
0.4743599, -0.8178421, 3.065026, 0.003921569, 0, 1, 1,
0.4834268, 0.9851167, 1.820533, 0.007843138, 0, 1, 1,
0.4942662, -0.5259942, 4.55384, 0.01568628, 0, 1, 1,
0.4943456, -2.314079, 1.857622, 0.01960784, 0, 1, 1,
0.5035934, 0.1661669, 0.4339191, 0.02745098, 0, 1, 1,
0.5039796, 1.146548, 0.2633624, 0.03137255, 0, 1, 1,
0.5061442, 0.9966178, -0.668156, 0.03921569, 0, 1, 1,
0.5077121, -0.00315556, 1.842673, 0.04313726, 0, 1, 1,
0.5115351, -0.7456199, 3.711169, 0.05098039, 0, 1, 1,
0.5127375, 1.223567, -1.604716, 0.05490196, 0, 1, 1,
0.5164626, -1.253232, 4.260971, 0.0627451, 0, 1, 1,
0.5191032, -1.052891, 2.481561, 0.06666667, 0, 1, 1,
0.5294784, -0.9047571, 1.440937, 0.07450981, 0, 1, 1,
0.5322249, -0.6767102, 2.407104, 0.07843138, 0, 1, 1,
0.5322503, 1.377245, 0.7085389, 0.08627451, 0, 1, 1,
0.5407203, -1.012741, 2.380745, 0.09019608, 0, 1, 1,
0.5422681, -0.667983, 1.578597, 0.09803922, 0, 1, 1,
0.5466319, 0.8783222, 1.149099, 0.1058824, 0, 1, 1,
0.5471098, -1.827626, 1.860242, 0.1098039, 0, 1, 1,
0.5482535, -0.9857739, 2.763419, 0.1176471, 0, 1, 1,
0.5545381, -2.819243, 3.576972, 0.1215686, 0, 1, 1,
0.5613604, -0.6661911, 2.933567, 0.1294118, 0, 1, 1,
0.5616643, -0.4405613, 1.316189, 0.1333333, 0, 1, 1,
0.5652847, -1.670147, 3.413469, 0.1411765, 0, 1, 1,
0.5695558, -1.467469, 2.419556, 0.145098, 0, 1, 1,
0.5722408, -0.1822994, 1.002162, 0.1529412, 0, 1, 1,
0.5795751, 0.2180552, 0.5681143, 0.1568628, 0, 1, 1,
0.584381, -0.03082507, 1.183599, 0.1647059, 0, 1, 1,
0.5933194, -1.672471, 2.485003, 0.1686275, 0, 1, 1,
0.5933272, -0.9461361, 4.52989, 0.1764706, 0, 1, 1,
0.5957373, -0.1338106, 1.998813, 0.1803922, 0, 1, 1,
0.6019033, -1.415337, 3.072537, 0.1882353, 0, 1, 1,
0.6021613, 0.1806083, 0.5361784, 0.1921569, 0, 1, 1,
0.6035122, 1.29969, -0.303677, 0.2, 0, 1, 1,
0.605525, 0.2089249, 1.6415, 0.2078431, 0, 1, 1,
0.6076503, -1.985865, 2.097747, 0.2117647, 0, 1, 1,
0.6123657, 0.1102251, 2.425683, 0.2196078, 0, 1, 1,
0.6162419, -1.919454, 2.70699, 0.2235294, 0, 1, 1,
0.6176285, 0.8903785, 0.5941513, 0.2313726, 0, 1, 1,
0.6204216, -0.6329103, 2.917522, 0.2352941, 0, 1, 1,
0.620846, 0.5362773, -0.2449532, 0.2431373, 0, 1, 1,
0.6217856, 0.2199468, 1.457158, 0.2470588, 0, 1, 1,
0.6225418, 1.62567, -1.27832, 0.254902, 0, 1, 1,
0.6256626, -0.8828875, 0.7749475, 0.2588235, 0, 1, 1,
0.6273998, -0.1483869, 1.086365, 0.2666667, 0, 1, 1,
0.6301173, 0.9762127, -0.9752262, 0.2705882, 0, 1, 1,
0.6313907, -0.1821966, 1.428112, 0.2784314, 0, 1, 1,
0.6328211, 1.193133, 0.8236365, 0.282353, 0, 1, 1,
0.6367761, -0.9909085, 2.083071, 0.2901961, 0, 1, 1,
0.6416829, -0.6414049, 2.070869, 0.2941177, 0, 1, 1,
0.642728, 0.2365457, 1.048531, 0.3019608, 0, 1, 1,
0.6458339, 0.7736026, 0.3335196, 0.3098039, 0, 1, 1,
0.6552529, 0.5394647, 1.012086, 0.3137255, 0, 1, 1,
0.6567506, 0.8502862, 1.566487, 0.3215686, 0, 1, 1,
0.6569467, 0.1770653, 1.100124, 0.3254902, 0, 1, 1,
0.6597934, 0.6647393, 0.6957394, 0.3333333, 0, 1, 1,
0.6614005, 0.6977782, 1.572881, 0.3372549, 0, 1, 1,
0.6640282, -1.391056, 3.850143, 0.345098, 0, 1, 1,
0.6660556, 1.505134, 0.3391334, 0.3490196, 0, 1, 1,
0.6685988, 0.2644154, 2.043665, 0.3568628, 0, 1, 1,
0.6703759, -0.6754586, 1.566336, 0.3607843, 0, 1, 1,
0.6704462, 0.5855643, 0.06718345, 0.3686275, 0, 1, 1,
0.674072, 0.550463, 1.555278, 0.372549, 0, 1, 1,
0.676098, 0.5645666, 0.5460111, 0.3803922, 0, 1, 1,
0.6785415, -1.630578, 1.356776, 0.3843137, 0, 1, 1,
0.6817771, 0.5051855, 0.253453, 0.3921569, 0, 1, 1,
0.682082, -1.530894, 2.748966, 0.3960784, 0, 1, 1,
0.6821733, -0.6034225, 1.766929, 0.4039216, 0, 1, 1,
0.6848575, -0.6131452, 5.052287, 0.4117647, 0, 1, 1,
0.6857331, 0.3682196, 0.7955669, 0.4156863, 0, 1, 1,
0.6862153, 0.7033187, 1.755877, 0.4235294, 0, 1, 1,
0.694441, 0.3458965, 1.945701, 0.427451, 0, 1, 1,
0.6974187, -0.01824532, 3.008996, 0.4352941, 0, 1, 1,
0.6998826, -0.03355955, 3.099324, 0.4392157, 0, 1, 1,
0.7017027, -0.2724218, 1.448773, 0.4470588, 0, 1, 1,
0.707889, -0.1181435, 1.988766, 0.4509804, 0, 1, 1,
0.7085797, 0.5214004, 1.298784, 0.4588235, 0, 1, 1,
0.710129, 0.2808797, 1.255499, 0.4627451, 0, 1, 1,
0.713102, -0.2076539, 2.147341, 0.4705882, 0, 1, 1,
0.7165124, -1.669054, 3.112586, 0.4745098, 0, 1, 1,
0.7170444, 0.4818056, 0.3977985, 0.4823529, 0, 1, 1,
0.7235493, 0.6108398, 1.233162, 0.4862745, 0, 1, 1,
0.7242527, -0.6977972, 3.472646, 0.4941176, 0, 1, 1,
0.7248448, -0.2732893, 3.533003, 0.5019608, 0, 1, 1,
0.7252065, 0.3664615, 2.893752, 0.5058824, 0, 1, 1,
0.7260901, 0.0002486216, 0.9973927, 0.5137255, 0, 1, 1,
0.7272903, -0.4081751, 2.403413, 0.5176471, 0, 1, 1,
0.7278231, 0.3417837, 0.7562251, 0.5254902, 0, 1, 1,
0.7278299, -0.3510299, 1.070264, 0.5294118, 0, 1, 1,
0.7297783, 0.6002221, 2.661117, 0.5372549, 0, 1, 1,
0.7337084, 1.496728, 0.01993784, 0.5411765, 0, 1, 1,
0.7338343, -0.668614, 2.463177, 0.5490196, 0, 1, 1,
0.7344263, 0.8709697, -0.0801187, 0.5529412, 0, 1, 1,
0.7404978, -0.05164838, 1.780706, 0.5607843, 0, 1, 1,
0.7408751, -0.5653564, 2.818885, 0.5647059, 0, 1, 1,
0.7434546, 0.02936622, 0.7043079, 0.572549, 0, 1, 1,
0.747647, -2.732967, 1.496923, 0.5764706, 0, 1, 1,
0.7484144, 1.626156, -2.343137, 0.5843138, 0, 1, 1,
0.7507241, 1.578243, -0.8049959, 0.5882353, 0, 1, 1,
0.7553334, 0.6626139, 2.898114, 0.5960785, 0, 1, 1,
0.7689114, 1.794151, 1.454525, 0.6039216, 0, 1, 1,
0.7694575, -0.6249967, 1.750059, 0.6078432, 0, 1, 1,
0.772407, -0.8539052, 2.807167, 0.6156863, 0, 1, 1,
0.7727225, -0.6268032, 0.5044433, 0.6196079, 0, 1, 1,
0.7785742, 0.3877081, 0.5762509, 0.627451, 0, 1, 1,
0.7850637, 0.6601362, 0.2486385, 0.6313726, 0, 1, 1,
0.7934605, -1.676663, 1.061267, 0.6392157, 0, 1, 1,
0.7977253, 1.513134, -0.2805442, 0.6431373, 0, 1, 1,
0.7988409, 2.296346, 0.2477816, 0.6509804, 0, 1, 1,
0.8065159, 0.02372029, 0.6720569, 0.654902, 0, 1, 1,
0.8097954, -0.1908633, 1.347425, 0.6627451, 0, 1, 1,
0.8103027, -1.61406, 2.101825, 0.6666667, 0, 1, 1,
0.8125181, -0.3328818, 2.793834, 0.6745098, 0, 1, 1,
0.8149674, 1.264081, -0.131551, 0.6784314, 0, 1, 1,
0.8168169, 0.1735003, 2.421667, 0.6862745, 0, 1, 1,
0.8194861, 1.305298, -0.03902742, 0.6901961, 0, 1, 1,
0.8203876, 0.3974366, 0.6567191, 0.6980392, 0, 1, 1,
0.8237601, -0.2091152, 2.706938, 0.7058824, 0, 1, 1,
0.8245845, 0.5780944, 0.99189, 0.7098039, 0, 1, 1,
0.8273129, -1.005623, 1.127764, 0.7176471, 0, 1, 1,
0.8275813, -0.6959437, 1.022287, 0.7215686, 0, 1, 1,
0.8282593, -0.1716207, 0.3340878, 0.7294118, 0, 1, 1,
0.8298236, -0.4841628, 3.486865, 0.7333333, 0, 1, 1,
0.8310376, 1.674091, 0.4701747, 0.7411765, 0, 1, 1,
0.8347681, 0.5531631, 0.6785312, 0.7450981, 0, 1, 1,
0.8373817, 1.579995, -1.156683, 0.7529412, 0, 1, 1,
0.8377702, 0.323785, 0.237628, 0.7568628, 0, 1, 1,
0.843551, -0.6722981, 0.6071194, 0.7647059, 0, 1, 1,
0.8458517, -0.6773455, 2.474938, 0.7686275, 0, 1, 1,
0.8472299, -0.07474043, 1.343244, 0.7764706, 0, 1, 1,
0.8507312, -0.542808, 2.495662, 0.7803922, 0, 1, 1,
0.8516582, 2.057403, 0.862501, 0.7882353, 0, 1, 1,
0.8532184, -0.4632905, 2.336335, 0.7921569, 0, 1, 1,
0.8542641, 0.554893, 2.14262, 0.8, 0, 1, 1,
0.8571834, 1.171348, 1.877941, 0.8078431, 0, 1, 1,
0.8606444, 0.2349606, 0.008417526, 0.8117647, 0, 1, 1,
0.8648455, 0.04955322, 0.9078377, 0.8196079, 0, 1, 1,
0.8682085, -0.09933765, 1.856737, 0.8235294, 0, 1, 1,
0.8704397, 0.9142311, 2.271687, 0.8313726, 0, 1, 1,
0.8786962, -0.9137383, 3.062745, 0.8352941, 0, 1, 1,
0.8787575, -0.04933004, 1.421328, 0.8431373, 0, 1, 1,
0.8793455, -0.5251683, 1.879912, 0.8470588, 0, 1, 1,
0.8811827, -0.1764483, 0.8984705, 0.854902, 0, 1, 1,
0.8840635, -0.08709418, 0.3896528, 0.8588235, 0, 1, 1,
0.8906891, 0.06302971, 1.671461, 0.8666667, 0, 1, 1,
0.8919623, -0.08429195, 3.147873, 0.8705882, 0, 1, 1,
0.896514, -0.9636128, 3.816545, 0.8784314, 0, 1, 1,
0.8969222, 0.1319067, -0.1917819, 0.8823529, 0, 1, 1,
0.8987059, 0.1156645, 1.848635, 0.8901961, 0, 1, 1,
0.8987634, 0.9941321, 1.228438, 0.8941177, 0, 1, 1,
0.9123948, 0.08154988, 2.017865, 0.9019608, 0, 1, 1,
0.9132057, -0.8817667, 2.751375, 0.9098039, 0, 1, 1,
0.9154714, 0.4234251, 1.60878, 0.9137255, 0, 1, 1,
0.9176586, -0.05607675, 1.893368, 0.9215686, 0, 1, 1,
0.9247386, 0.8933114, 0.8871148, 0.9254902, 0, 1, 1,
0.9247749, -0.4455386, 1.558739, 0.9333333, 0, 1, 1,
0.9259177, 1.22302, 2.437795, 0.9372549, 0, 1, 1,
0.9294327, -2.663604, 4.094414, 0.945098, 0, 1, 1,
0.9304782, 0.4675472, 0.3640355, 0.9490196, 0, 1, 1,
0.9315634, 1.048825, 0.3546791, 0.9568627, 0, 1, 1,
0.9339051, -0.03442484, 1.983382, 0.9607843, 0, 1, 1,
0.9366169, -0.5137857, 2.160296, 0.9686275, 0, 1, 1,
0.942395, -0.9028144, 3.093163, 0.972549, 0, 1, 1,
0.9467542, 0.738829, 1.337074, 0.9803922, 0, 1, 1,
0.9511691, -0.219961, 0.2919806, 0.9843137, 0, 1, 1,
0.9615532, -0.3716109, 3.584539, 0.9921569, 0, 1, 1,
0.9621204, -1.01251, 2.913974, 0.9960784, 0, 1, 1,
0.9633446, 1.155306, -0.3205853, 1, 0, 0.9960784, 1,
0.9647167, 0.6128469, 2.296129, 1, 0, 0.9882353, 1,
0.9648578, 1.051123, 2.135063, 1, 0, 0.9843137, 1,
0.9654753, -0.7218159, 1.75194, 1, 0, 0.9764706, 1,
0.9675121, 0.8325166, -0.0787893, 1, 0, 0.972549, 1,
0.9738238, -0.5515716, 2.466064, 1, 0, 0.9647059, 1,
0.9797263, -0.4949945, 1.907582, 1, 0, 0.9607843, 1,
0.9811841, 1.634484, 0.1744216, 1, 0, 0.9529412, 1,
0.9834087, 0.05715675, 1.883119, 1, 0, 0.9490196, 1,
0.9851631, -0.2629571, -0.02498771, 1, 0, 0.9411765, 1,
0.9944205, 1.102701, -0.7392298, 1, 0, 0.9372549, 1,
0.9988802, -0.5414822, 1.835001, 1, 0, 0.9294118, 1,
0.9993658, 0.1278826, 3.53029, 1, 0, 0.9254902, 1,
1.006154, -1.486829, 3.09725, 1, 0, 0.9176471, 1,
1.009699, -1.86228, 4.312569, 1, 0, 0.9137255, 1,
1.028187, 0.8931882, 3.28549, 1, 0, 0.9058824, 1,
1.030351, -0.6597108, 3.853199, 1, 0, 0.9019608, 1,
1.030578, -0.7413685, 3.548808, 1, 0, 0.8941177, 1,
1.036502, 1.075135, 0.4610521, 1, 0, 0.8862745, 1,
1.03835, 2.188306, 0.7722487, 1, 0, 0.8823529, 1,
1.040504, 0.6834685, 3.162999, 1, 0, 0.8745098, 1,
1.049006, -1.37476, 2.912592, 1, 0, 0.8705882, 1,
1.05225, -1.418322, 3.896608, 1, 0, 0.8627451, 1,
1.060498, 1.591924, 0.6863741, 1, 0, 0.8588235, 1,
1.062989, 0.3440795, 2.941013, 1, 0, 0.8509804, 1,
1.066402, -1.106948, 2.863372, 1, 0, 0.8470588, 1,
1.075405, -1.395952, 3.980175, 1, 0, 0.8392157, 1,
1.078284, 1.011562, 1.146368, 1, 0, 0.8352941, 1,
1.080634, 1.175796, 0.36023, 1, 0, 0.827451, 1,
1.082538, -0.639654, 1.388664, 1, 0, 0.8235294, 1,
1.090429, -0.2994379, 1.628526, 1, 0, 0.8156863, 1,
1.091339, -0.615396, 0.841658, 1, 0, 0.8117647, 1,
1.093969, -1.011766, 1.528484, 1, 0, 0.8039216, 1,
1.107571, 0.1099756, 0.786463, 1, 0, 0.7960784, 1,
1.107635, 0.389558, 1.763912, 1, 0, 0.7921569, 1,
1.108415, -0.8663318, 2.296088, 1, 0, 0.7843137, 1,
1.110874, -1.323357, 2.716288, 1, 0, 0.7803922, 1,
1.116701, -0.09628545, 2.454946, 1, 0, 0.772549, 1,
1.122588, -0.7309313, 3.769794, 1, 0, 0.7686275, 1,
1.127601, -0.324133, 0.7974346, 1, 0, 0.7607843, 1,
1.134476, -1.648438, 3.895873, 1, 0, 0.7568628, 1,
1.135556, 0.3115161, 2.408191, 1, 0, 0.7490196, 1,
1.136811, -0.3461647, 2.035685, 1, 0, 0.7450981, 1,
1.148777, 0.2004914, 2.49661, 1, 0, 0.7372549, 1,
1.163963, 1.428885, 2.14953, 1, 0, 0.7333333, 1,
1.17554, 0.2035557, 0.4911028, 1, 0, 0.7254902, 1,
1.192759, -0.7875466, 0.2739037, 1, 0, 0.7215686, 1,
1.19576, 0.07712948, 2.531685, 1, 0, 0.7137255, 1,
1.202058, 1.497374, 1.384382, 1, 0, 0.7098039, 1,
1.204359, -0.5447359, 2.775974, 1, 0, 0.7019608, 1,
1.204978, 0.5751197, 1.50614, 1, 0, 0.6941177, 1,
1.208767, 0.1653644, 2.287097, 1, 0, 0.6901961, 1,
1.211406, -2.069829, 0.9156212, 1, 0, 0.682353, 1,
1.217015, -0.9237654, 3.333556, 1, 0, 0.6784314, 1,
1.218626, -0.003345401, 2.874613, 1, 0, 0.6705883, 1,
1.226886, -1.954032, 2.858709, 1, 0, 0.6666667, 1,
1.234295, -0.5808637, 3.504628, 1, 0, 0.6588235, 1,
1.240478, 1.246544, -0.5386224, 1, 0, 0.654902, 1,
1.248803, 0.6615804, 1.502353, 1, 0, 0.6470588, 1,
1.252534, 1.434524, -0.144821, 1, 0, 0.6431373, 1,
1.257838, 0.5677748, 0.04276657, 1, 0, 0.6352941, 1,
1.25827, 0.06582698, 2.825562, 1, 0, 0.6313726, 1,
1.261576, -0.6848393, 2.06902, 1, 0, 0.6235294, 1,
1.276913, -0.5423427, 2.73791, 1, 0, 0.6196079, 1,
1.277389, -0.4357699, 2.64336, 1, 0, 0.6117647, 1,
1.2809, 0.5704518, 1.837478, 1, 0, 0.6078432, 1,
1.286194, 0.3965442, 0.7148471, 1, 0, 0.6, 1,
1.293044, -0.3236975, 1.984312, 1, 0, 0.5921569, 1,
1.295891, -0.1818344, 1.998202, 1, 0, 0.5882353, 1,
1.29599, -0.148921, 1.856536, 1, 0, 0.5803922, 1,
1.299331, -0.619581, 3.841241, 1, 0, 0.5764706, 1,
1.299713, -1.371277, 4.487, 1, 0, 0.5686275, 1,
1.29985, 0.2300965, 1.887835, 1, 0, 0.5647059, 1,
1.301136, 0.05997779, 1.513494, 1, 0, 0.5568628, 1,
1.302402, 0.7348108, 1.406818, 1, 0, 0.5529412, 1,
1.315385, -0.03546529, 3.619906, 1, 0, 0.5450981, 1,
1.349775, 0.5766722, 2.52839, 1, 0, 0.5411765, 1,
1.370072, 0.6212148, 0.7452632, 1, 0, 0.5333334, 1,
1.389522, 1.768376, 1.062003, 1, 0, 0.5294118, 1,
1.395163, 1.876135, 1.426113, 1, 0, 0.5215687, 1,
1.397374, 1.803726, 0.6575212, 1, 0, 0.5176471, 1,
1.400338, 1.006568, 1.580394, 1, 0, 0.509804, 1,
1.400428, 0.03893877, 2.800174, 1, 0, 0.5058824, 1,
1.408143, -0.7812399, 2.502644, 1, 0, 0.4980392, 1,
1.427591, -1.342906, 2.275528, 1, 0, 0.4901961, 1,
1.433678, -1.461102, 0.1048837, 1, 0, 0.4862745, 1,
1.438219, 1.922654, 1.364802, 1, 0, 0.4784314, 1,
1.440037, -1.703432, 2.025724, 1, 0, 0.4745098, 1,
1.446205, 0.4748098, 0.7944361, 1, 0, 0.4666667, 1,
1.461396, 0.7714799, -0.9517164, 1, 0, 0.4627451, 1,
1.462039, 0.1230334, 3.688344, 1, 0, 0.454902, 1,
1.463111, -0.4126421, 0.96304, 1, 0, 0.4509804, 1,
1.472395, 0.5110039, 1.093549, 1, 0, 0.4431373, 1,
1.486368, -1.174933, 1.641071, 1, 0, 0.4392157, 1,
1.489828, 0.1514322, 1.970645, 1, 0, 0.4313726, 1,
1.496561, -0.8368112, 2.453278, 1, 0, 0.427451, 1,
1.503171, -0.08191525, 1.01787, 1, 0, 0.4196078, 1,
1.506578, -0.2171022, 0.9149735, 1, 0, 0.4156863, 1,
1.508405, -0.9409961, 3.364378, 1, 0, 0.4078431, 1,
1.50911, 0.1072376, 0.2819119, 1, 0, 0.4039216, 1,
1.520036, -0.5304122, 1.789586, 1, 0, 0.3960784, 1,
1.525658, 1.407408, -0.4044844, 1, 0, 0.3882353, 1,
1.526862, 0.9671443, 1.552649, 1, 0, 0.3843137, 1,
1.535182, -1.124817, 0.412713, 1, 0, 0.3764706, 1,
1.542158, 0.937784, 2.1142, 1, 0, 0.372549, 1,
1.565181, 1.298284, 0.9676961, 1, 0, 0.3647059, 1,
1.56618, -0.7657464, 1.543772, 1, 0, 0.3607843, 1,
1.570645, 0.7251824, 0.8159795, 1, 0, 0.3529412, 1,
1.576353, 1.636167, 1.153126, 1, 0, 0.3490196, 1,
1.581939, 0.7343808, 2.184323, 1, 0, 0.3411765, 1,
1.594323, 0.8651108, 1.280147, 1, 0, 0.3372549, 1,
1.595436, -1.627222, 4.354618, 1, 0, 0.3294118, 1,
1.601622, 0.9390036, 0.6564365, 1, 0, 0.3254902, 1,
1.602799, 0.6198007, 1.557215, 1, 0, 0.3176471, 1,
1.610379, -0.817394, 0.7951235, 1, 0, 0.3137255, 1,
1.641849, -0.2691604, 2.401621, 1, 0, 0.3058824, 1,
1.645663, -0.6743985, 1.414016, 1, 0, 0.2980392, 1,
1.659797, -0.04077858, 2.802684, 1, 0, 0.2941177, 1,
1.695637, -0.4133697, 1.005031, 1, 0, 0.2862745, 1,
1.700271, -0.5154552, 2.035611, 1, 0, 0.282353, 1,
1.705735, -0.5882023, 3.329703, 1, 0, 0.2745098, 1,
1.717906, -0.2370991, 2.096733, 1, 0, 0.2705882, 1,
1.733277, -0.6608292, 2.01306, 1, 0, 0.2627451, 1,
1.741215, 0.1351044, 1.790441, 1, 0, 0.2588235, 1,
1.749846, 1.145516, -0.790104, 1, 0, 0.2509804, 1,
1.764812, -1.616344, 2.540336, 1, 0, 0.2470588, 1,
1.772298, 0.03762323, -0.2481382, 1, 0, 0.2392157, 1,
1.779739, -1.163703, 3.872037, 1, 0, 0.2352941, 1,
1.801303, -1.484868, 1.719464, 1, 0, 0.227451, 1,
1.809672, -0.09413308, 1.624991, 1, 0, 0.2235294, 1,
1.816743, 1.184514, 0.889787, 1, 0, 0.2156863, 1,
1.833769, -0.9428362, 2.17027, 1, 0, 0.2117647, 1,
1.870871, 2.212069, 0.3309409, 1, 0, 0.2039216, 1,
1.881974, 1.972935, 1.12596, 1, 0, 0.1960784, 1,
1.883989, 0.5137805, 1.28579, 1, 0, 0.1921569, 1,
1.888541, -0.3916435, 0.5685968, 1, 0, 0.1843137, 1,
1.902091, 1.114593, 1.239321, 1, 0, 0.1803922, 1,
1.923014, -1.309196, 2.384416, 1, 0, 0.172549, 1,
1.929642, 0.3050788, 1.343279, 1, 0, 0.1686275, 1,
1.936651, 0.3503361, 1.685981, 1, 0, 0.1607843, 1,
1.957157, 0.622907, 0.09286993, 1, 0, 0.1568628, 1,
1.959102, -0.1600879, 2.739916, 1, 0, 0.1490196, 1,
2.021037, 1.665789, -1.28232, 1, 0, 0.145098, 1,
2.031424, 0.7197006, 2.165417, 1, 0, 0.1372549, 1,
2.059969, 0.254616, 0.4606576, 1, 0, 0.1333333, 1,
2.104708, 0.6809588, 1.896187, 1, 0, 0.1254902, 1,
2.126267, -0.8997101, 2.479283, 1, 0, 0.1215686, 1,
2.127983, 1.876972, 0.4170838, 1, 0, 0.1137255, 1,
2.149683, -0.1074657, 3.031526, 1, 0, 0.1098039, 1,
2.151622, -0.6390476, 0.5961043, 1, 0, 0.1019608, 1,
2.165236, -0.4848286, 1.91289, 1, 0, 0.09411765, 1,
2.284933, 0.231387, 1.854528, 1, 0, 0.09019608, 1,
2.350861, 1.406114, 1.807699, 1, 0, 0.08235294, 1,
2.361223, -0.6995006, 1.782448, 1, 0, 0.07843138, 1,
2.420939, -0.7279175, 1.281117, 1, 0, 0.07058824, 1,
2.455115, -1.078001, 3.05125, 1, 0, 0.06666667, 1,
2.462689, 0.6671836, 0.8645006, 1, 0, 0.05882353, 1,
2.470811, 0.7741492, 0.6393217, 1, 0, 0.05490196, 1,
2.471511, 1.756068, 1.573586, 1, 0, 0.04705882, 1,
2.57688, -0.1356425, 1.502898, 1, 0, 0.04313726, 1,
2.654568, 0.7681773, 1.07812, 1, 0, 0.03529412, 1,
2.670585, -0.8003502, 1.311427, 1, 0, 0.03137255, 1,
2.818323, 1.179157, 0.9968697, 1, 0, 0.02352941, 1,
2.85956, -0.4711455, 1.623804, 1, 0, 0.01960784, 1,
3.017721, -0.1495461, 2.69808, 1, 0, 0.01176471, 1,
3.239253, 0.6647635, 1.707567, 1, 0, 0.007843138, 1
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
-0.1780732, -4.318912, -7.221801, 0, -0.5, 0.5, 0.5,
-0.1780732, -4.318912, -7.221801, 1, -0.5, 0.5, 0.5,
-0.1780732, -4.318912, -7.221801, 1, 1.5, 0.5, 0.5,
-0.1780732, -4.318912, -7.221801, 0, 1.5, 0.5, 0.5
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
-4.753873, -0.2704972, -7.221801, 0, -0.5, 0.5, 0.5,
-4.753873, -0.2704972, -7.221801, 1, -0.5, 0.5, 0.5,
-4.753873, -0.2704972, -7.221801, 1, 1.5, 0.5, 0.5,
-4.753873, -0.2704972, -7.221801, 0, 1.5, 0.5, 0.5
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
-4.753873, -4.318912, 0.1932428, 0, -0.5, 0.5, 0.5,
-4.753873, -4.318912, 0.1932428, 1, -0.5, 0.5, 0.5,
-4.753873, -4.318912, 0.1932428, 1, 1.5, 0.5, 0.5,
-4.753873, -4.318912, 0.1932428, 0, 1.5, 0.5, 0.5
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
-3, -3.384662, -5.510637,
3, -3.384662, -5.510637,
-3, -3.384662, -5.510637,
-3, -3.540371, -5.795831,
-2, -3.384662, -5.510637,
-2, -3.540371, -5.795831,
-1, -3.384662, -5.510637,
-1, -3.540371, -5.795831,
0, -3.384662, -5.510637,
0, -3.540371, -5.795831,
1, -3.384662, -5.510637,
1, -3.540371, -5.795831,
2, -3.384662, -5.510637,
2, -3.540371, -5.795831,
3, -3.384662, -5.510637,
3, -3.540371, -5.795831
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
-3, -3.851787, -6.366219, 0, -0.5, 0.5, 0.5,
-3, -3.851787, -6.366219, 1, -0.5, 0.5, 0.5,
-3, -3.851787, -6.366219, 1, 1.5, 0.5, 0.5,
-3, -3.851787, -6.366219, 0, 1.5, 0.5, 0.5,
-2, -3.851787, -6.366219, 0, -0.5, 0.5, 0.5,
-2, -3.851787, -6.366219, 1, -0.5, 0.5, 0.5,
-2, -3.851787, -6.366219, 1, 1.5, 0.5, 0.5,
-2, -3.851787, -6.366219, 0, 1.5, 0.5, 0.5,
-1, -3.851787, -6.366219, 0, -0.5, 0.5, 0.5,
-1, -3.851787, -6.366219, 1, -0.5, 0.5, 0.5,
-1, -3.851787, -6.366219, 1, 1.5, 0.5, 0.5,
-1, -3.851787, -6.366219, 0, 1.5, 0.5, 0.5,
0, -3.851787, -6.366219, 0, -0.5, 0.5, 0.5,
0, -3.851787, -6.366219, 1, -0.5, 0.5, 0.5,
0, -3.851787, -6.366219, 1, 1.5, 0.5, 0.5,
0, -3.851787, -6.366219, 0, 1.5, 0.5, 0.5,
1, -3.851787, -6.366219, 0, -0.5, 0.5, 0.5,
1, -3.851787, -6.366219, 1, -0.5, 0.5, 0.5,
1, -3.851787, -6.366219, 1, 1.5, 0.5, 0.5,
1, -3.851787, -6.366219, 0, 1.5, 0.5, 0.5,
2, -3.851787, -6.366219, 0, -0.5, 0.5, 0.5,
2, -3.851787, -6.366219, 1, -0.5, 0.5, 0.5,
2, -3.851787, -6.366219, 1, 1.5, 0.5, 0.5,
2, -3.851787, -6.366219, 0, 1.5, 0.5, 0.5,
3, -3.851787, -6.366219, 0, -0.5, 0.5, 0.5,
3, -3.851787, -6.366219, 1, -0.5, 0.5, 0.5,
3, -3.851787, -6.366219, 1, 1.5, 0.5, 0.5,
3, -3.851787, -6.366219, 0, 1.5, 0.5, 0.5
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
-3.697919, -3, -5.510637,
-3.697919, 2, -5.510637,
-3.697919, -3, -5.510637,
-3.873911, -3, -5.795831,
-3.697919, -2, -5.510637,
-3.873911, -2, -5.795831,
-3.697919, -1, -5.510637,
-3.873911, -1, -5.795831,
-3.697919, 0, -5.510637,
-3.873911, 0, -5.795831,
-3.697919, 1, -5.510637,
-3.873911, 1, -5.795831,
-3.697919, 2, -5.510637,
-3.873911, 2, -5.795831
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
-4.225896, -3, -6.366219, 0, -0.5, 0.5, 0.5,
-4.225896, -3, -6.366219, 1, -0.5, 0.5, 0.5,
-4.225896, -3, -6.366219, 1, 1.5, 0.5, 0.5,
-4.225896, -3, -6.366219, 0, 1.5, 0.5, 0.5,
-4.225896, -2, -6.366219, 0, -0.5, 0.5, 0.5,
-4.225896, -2, -6.366219, 1, -0.5, 0.5, 0.5,
-4.225896, -2, -6.366219, 1, 1.5, 0.5, 0.5,
-4.225896, -2, -6.366219, 0, 1.5, 0.5, 0.5,
-4.225896, -1, -6.366219, 0, -0.5, 0.5, 0.5,
-4.225896, -1, -6.366219, 1, -0.5, 0.5, 0.5,
-4.225896, -1, -6.366219, 1, 1.5, 0.5, 0.5,
-4.225896, -1, -6.366219, 0, 1.5, 0.5, 0.5,
-4.225896, 0, -6.366219, 0, -0.5, 0.5, 0.5,
-4.225896, 0, -6.366219, 1, -0.5, 0.5, 0.5,
-4.225896, 0, -6.366219, 1, 1.5, 0.5, 0.5,
-4.225896, 0, -6.366219, 0, 1.5, 0.5, 0.5,
-4.225896, 1, -6.366219, 0, -0.5, 0.5, 0.5,
-4.225896, 1, -6.366219, 1, -0.5, 0.5, 0.5,
-4.225896, 1, -6.366219, 1, 1.5, 0.5, 0.5,
-4.225896, 1, -6.366219, 0, 1.5, 0.5, 0.5,
-4.225896, 2, -6.366219, 0, -0.5, 0.5, 0.5,
-4.225896, 2, -6.366219, 1, -0.5, 0.5, 0.5,
-4.225896, 2, -6.366219, 1, 1.5, 0.5, 0.5,
-4.225896, 2, -6.366219, 0, 1.5, 0.5, 0.5
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
-3.697919, -3.384662, -4,
-3.697919, -3.384662, 4,
-3.697919, -3.384662, -4,
-3.873911, -3.540371, -4,
-3.697919, -3.384662, -2,
-3.873911, -3.540371, -2,
-3.697919, -3.384662, 0,
-3.873911, -3.540371, 0,
-3.697919, -3.384662, 2,
-3.873911, -3.540371, 2,
-3.697919, -3.384662, 4,
-3.873911, -3.540371, 4
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
-4.225896, -3.851787, -4, 0, -0.5, 0.5, 0.5,
-4.225896, -3.851787, -4, 1, -0.5, 0.5, 0.5,
-4.225896, -3.851787, -4, 1, 1.5, 0.5, 0.5,
-4.225896, -3.851787, -4, 0, 1.5, 0.5, 0.5,
-4.225896, -3.851787, -2, 0, -0.5, 0.5, 0.5,
-4.225896, -3.851787, -2, 1, -0.5, 0.5, 0.5,
-4.225896, -3.851787, -2, 1, 1.5, 0.5, 0.5,
-4.225896, -3.851787, -2, 0, 1.5, 0.5, 0.5,
-4.225896, -3.851787, 0, 0, -0.5, 0.5, 0.5,
-4.225896, -3.851787, 0, 1, -0.5, 0.5, 0.5,
-4.225896, -3.851787, 0, 1, 1.5, 0.5, 0.5,
-4.225896, -3.851787, 0, 0, 1.5, 0.5, 0.5,
-4.225896, -3.851787, 2, 0, -0.5, 0.5, 0.5,
-4.225896, -3.851787, 2, 1, -0.5, 0.5, 0.5,
-4.225896, -3.851787, 2, 1, 1.5, 0.5, 0.5,
-4.225896, -3.851787, 2, 0, 1.5, 0.5, 0.5,
-4.225896, -3.851787, 4, 0, -0.5, 0.5, 0.5,
-4.225896, -3.851787, 4, 1, -0.5, 0.5, 0.5,
-4.225896, -3.851787, 4, 1, 1.5, 0.5, 0.5,
-4.225896, -3.851787, 4, 0, 1.5, 0.5, 0.5
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
-3.697919, -3.384662, -5.510637,
-3.697919, 2.843668, -5.510637,
-3.697919, -3.384662, 5.897122,
-3.697919, 2.843668, 5.897122,
-3.697919, -3.384662, -5.510637,
-3.697919, -3.384662, 5.897122,
-3.697919, 2.843668, -5.510637,
-3.697919, 2.843668, 5.897122,
-3.697919, -3.384662, -5.510637,
3.341773, -3.384662, -5.510637,
-3.697919, -3.384662, 5.897122,
3.341773, -3.384662, 5.897122,
-3.697919, 2.843668, -5.510637,
3.341773, 2.843668, -5.510637,
-3.697919, 2.843668, 5.897122,
3.341773, 2.843668, 5.897122,
3.341773, -3.384662, -5.510637,
3.341773, 2.843668, -5.510637,
3.341773, -3.384662, 5.897122,
3.341773, 2.843668, 5.897122,
3.341773, -3.384662, -5.510637,
3.341773, -3.384662, 5.897122,
3.341773, 2.843668, -5.510637,
3.341773, 2.843668, 5.897122
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
var radius = 7.892918;
var distance = 35.11649;
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
mvMatrix.translate( 0.1780732, 0.2704972, -0.1932428 );
mvMatrix.scale( 1.212266, 1.370187, 0.7480854 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.11649);
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
C5HCl5O<-read.table("C5HCl5O.xyz")
```

```
## Error in read.table("C5HCl5O.xyz"): no lines available in input
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
-3.595399, -1.13342, -1.555913, 0, 0, 1, 1, 1,
-3.198255, 2.347173, -1.859775, 1, 0, 0, 1, 1,
-3.07465, -1.509812, -3.168509, 1, 0, 0, 1, 1,
-2.725744, 2.197917, -0.4464366, 1, 0, 0, 1, 1,
-2.713916, -0.7889366, -2.454841, 1, 0, 0, 1, 1,
-2.689825, -0.2032017, -2.461257, 1, 0, 0, 1, 1,
-2.601205, 1.098711, -2.145431, 0, 0, 0, 1, 1,
-2.481355, 1.81337, -0.1706102, 0, 0, 0, 1, 1,
-2.469353, -0.3965147, -3.424451, 0, 0, 0, 1, 1,
-2.467326, -1.092003, -2.760464, 0, 0, 0, 1, 1,
-2.333242, 0.07109477, -0.4150046, 0, 0, 0, 1, 1,
-2.318221, -0.3687659, -0.857013, 0, 0, 0, 1, 1,
-2.297272, 0.5129839, -1.060654, 0, 0, 0, 1, 1,
-2.292909, 0.135945, -2.267496, 1, 1, 1, 1, 1,
-2.26168, 0.4406206, 0.3958505, 1, 1, 1, 1, 1,
-2.256042, 1.29102, -2.329116, 1, 1, 1, 1, 1,
-2.240664, 0.7107732, -0.3027159, 1, 1, 1, 1, 1,
-2.186875, 0.6985887, 0.002734801, 1, 1, 1, 1, 1,
-2.082877, 0.3453031, -0.1899487, 1, 1, 1, 1, 1,
-2.046717, -0.5786412, 0.3220114, 1, 1, 1, 1, 1,
-2.025451, 0.8640121, -2.021562, 1, 1, 1, 1, 1,
-2.013361, -0.2779085, -2.351706, 1, 1, 1, 1, 1,
-1.947049, 1.077771, -0.024284, 1, 1, 1, 1, 1,
-1.91135, 0.6992377, -2.03946, 1, 1, 1, 1, 1,
-1.896955, 0.8820814, -0.8368226, 1, 1, 1, 1, 1,
-1.863093, -0.7953132, -1.054806, 1, 1, 1, 1, 1,
-1.861222, -0.7147429, -3.135164, 1, 1, 1, 1, 1,
-1.851887, 0.5707527, 0.5051456, 1, 1, 1, 1, 1,
-1.849406, -0.6825339, -2.234529, 0, 0, 1, 1, 1,
-1.817595, -0.9883842, -0.5902953, 1, 0, 0, 1, 1,
-1.816513, 0.01413535, -0.6016818, 1, 0, 0, 1, 1,
-1.809046, 0.1587457, -1.843517, 1, 0, 0, 1, 1,
-1.746032, -0.6973441, -2.161794, 1, 0, 0, 1, 1,
-1.733225, 2.509386, 0.8852396, 1, 0, 0, 1, 1,
-1.712754, 0.9823419, -2.866734, 0, 0, 0, 1, 1,
-1.700619, 1.417098, -1.391506, 0, 0, 0, 1, 1,
-1.687998, -0.7536662, -1.115394, 0, 0, 0, 1, 1,
-1.67673, -0.3080184, -0.8580428, 0, 0, 0, 1, 1,
-1.657687, 0.2653252, -1.512667, 0, 0, 0, 1, 1,
-1.639436, 1.031291, -1.563488, 0, 0, 0, 1, 1,
-1.630597, 1.044351, -1.365636, 0, 0, 0, 1, 1,
-1.625125, -1.331272, -2.264446, 1, 1, 1, 1, 1,
-1.620213, 0.2174245, -1.801848, 1, 1, 1, 1, 1,
-1.617608, 0.4908284, 0.4383194, 1, 1, 1, 1, 1,
-1.610237, -0.1554685, -1.971982, 1, 1, 1, 1, 1,
-1.608993, 0.2778198, -0.9951566, 1, 1, 1, 1, 1,
-1.608591, 1.267458, -1.198013, 1, 1, 1, 1, 1,
-1.588049, -1.493155, -1.127673, 1, 1, 1, 1, 1,
-1.58768, -1.305072, -1.725018, 1, 1, 1, 1, 1,
-1.584989, 0.2943964, -2.071951, 1, 1, 1, 1, 1,
-1.578932, -1.05148, -2.279661, 1, 1, 1, 1, 1,
-1.560692, -0.3752, -2.642947, 1, 1, 1, 1, 1,
-1.560392, -0.01741889, -1.495894, 1, 1, 1, 1, 1,
-1.555785, 0.4113318, -1.483309, 1, 1, 1, 1, 1,
-1.545088, -3.293959, -2.527689, 1, 1, 1, 1, 1,
-1.543906, 1.527192, -0.4317102, 1, 1, 1, 1, 1,
-1.533235, 0.5899269, -2.688854, 0, 0, 1, 1, 1,
-1.531884, 0.3622539, -1.790134, 1, 0, 0, 1, 1,
-1.521009, 1.3076, -0.7300112, 1, 0, 0, 1, 1,
-1.520774, 0.3320027, -0.60946, 1, 0, 0, 1, 1,
-1.514489, 0.1613631, -0.1512513, 1, 0, 0, 1, 1,
-1.513901, 1.453242, -2.032804, 1, 0, 0, 1, 1,
-1.504161, 0.04480491, -1.442139, 0, 0, 0, 1, 1,
-1.498753, -0.3439837, -0.4079624, 0, 0, 0, 1, 1,
-1.488871, -1.593201, -1.417127, 0, 0, 0, 1, 1,
-1.488479, 0.2203752, -1.077209, 0, 0, 0, 1, 1,
-1.488303, -0.4425441, -2.148523, 0, 0, 0, 1, 1,
-1.482691, -0.239989, -2.068575, 0, 0, 0, 1, 1,
-1.476366, -1.15511, -2.965189, 0, 0, 0, 1, 1,
-1.473585, 0.3306171, -2.558135, 1, 1, 1, 1, 1,
-1.472298, 0.9536592, -1.195102, 1, 1, 1, 1, 1,
-1.467967, -0.04807726, -1.959389, 1, 1, 1, 1, 1,
-1.455728, 0.07320539, -0.6840016, 1, 1, 1, 1, 1,
-1.446338, 0.8491048, -1.387288, 1, 1, 1, 1, 1,
-1.444012, -1.222048, -2.107246, 1, 1, 1, 1, 1,
-1.435359, -1.469585, -2.416495, 1, 1, 1, 1, 1,
-1.428108, -0.3359739, -1.10914, 1, 1, 1, 1, 1,
-1.424579, 1.415911, -1.214038, 1, 1, 1, 1, 1,
-1.42082, -1.209755, -2.484257, 1, 1, 1, 1, 1,
-1.416056, -1.481392, -3.462671, 1, 1, 1, 1, 1,
-1.414051, -1.73782, -2.1545, 1, 1, 1, 1, 1,
-1.41295, 1.196811, -2.209201, 1, 1, 1, 1, 1,
-1.411159, -0.8538327, -4.498915, 1, 1, 1, 1, 1,
-1.39808, 0.9890543, -2.398477, 1, 1, 1, 1, 1,
-1.393547, -0.129739, -2.27058, 0, 0, 1, 1, 1,
-1.393358, -0.2009202, -2.267937, 1, 0, 0, 1, 1,
-1.392828, -1.53183, -1.37027, 1, 0, 0, 1, 1,
-1.379746, -2.235252, -2.589701, 1, 0, 0, 1, 1,
-1.379114, -0.9923538, -2.436007, 1, 0, 0, 1, 1,
-1.370808, 1.329855, -0.4427221, 1, 0, 0, 1, 1,
-1.366091, 0.506534, -1.409847, 0, 0, 0, 1, 1,
-1.361645, 0.3233873, -2.745217, 0, 0, 0, 1, 1,
-1.356408, 0.8207929, -1.120033, 0, 0, 0, 1, 1,
-1.353329, 0.2209202, -2.750412, 0, 0, 0, 1, 1,
-1.342926, 0.1197569, -0.498242, 0, 0, 0, 1, 1,
-1.335733, -1.636062, -1.757411, 0, 0, 0, 1, 1,
-1.335003, -1.089774, -2.378816, 0, 0, 0, 1, 1,
-1.33121, 0.5114135, -0.7504094, 1, 1, 1, 1, 1,
-1.328756, -0.3305227, -3.15369, 1, 1, 1, 1, 1,
-1.314894, -0.6881441, 0.2308309, 1, 1, 1, 1, 1,
-1.307078, -1.978054, -2.030411, 1, 1, 1, 1, 1,
-1.303394, 1.070795, -0.7604107, 1, 1, 1, 1, 1,
-1.303169, 0.1568374, -1.84434, 1, 1, 1, 1, 1,
-1.300085, 0.7018768, -0.1282113, 1, 1, 1, 1, 1,
-1.293378, -0.4933468, -3.093078, 1, 1, 1, 1, 1,
-1.28399, 1.449696, 0.4356955, 1, 1, 1, 1, 1,
-1.267802, 0.04482555, -1.119762, 1, 1, 1, 1, 1,
-1.26377, -0.5516809, -1.140591, 1, 1, 1, 1, 1,
-1.261759, 1.538421, -1.467598, 1, 1, 1, 1, 1,
-1.259928, 0.4095322, -1.592521, 1, 1, 1, 1, 1,
-1.257885, 1.35406, -1.465076, 1, 1, 1, 1, 1,
-1.256288, -0.5800852, -2.757148, 1, 1, 1, 1, 1,
-1.246016, -0.6208185, -0.7064351, 0, 0, 1, 1, 1,
-1.245578, -0.1420008, -2.08478, 1, 0, 0, 1, 1,
-1.244689, 0.5227408, -3.296026, 1, 0, 0, 1, 1,
-1.244282, 0.7466643, -1.968883, 1, 0, 0, 1, 1,
-1.235585, 0.07076092, -1.431074, 1, 0, 0, 1, 1,
-1.228285, -1.376799, -2.865633, 1, 0, 0, 1, 1,
-1.226751, -0.8551182, -3.184271, 0, 0, 0, 1, 1,
-1.210849, 0.6550592, -1.465089, 0, 0, 0, 1, 1,
-1.192555, 2.146375, -0.1263826, 0, 0, 0, 1, 1,
-1.184196, 0.6933432, -2.018861, 0, 0, 0, 1, 1,
-1.182946, -0.3718452, -0.6853651, 0, 0, 0, 1, 1,
-1.16092, 0.8423533, -0.7113875, 0, 0, 0, 1, 1,
-1.155593, -1.036342, -3.959833, 0, 0, 0, 1, 1,
-1.146484, -1.058389, -3.419038, 1, 1, 1, 1, 1,
-1.143489, 0.4610007, -2.139083, 1, 1, 1, 1, 1,
-1.141497, 0.146513, -2.696252, 1, 1, 1, 1, 1,
-1.137991, -1.482643, -2.675649, 1, 1, 1, 1, 1,
-1.13003, 0.1676648, -1.292944, 1, 1, 1, 1, 1,
-1.119945, 0.5397227, -0.1173155, 1, 1, 1, 1, 1,
-1.119485, -0.2167714, -2.025674, 1, 1, 1, 1, 1,
-1.112941, 0.1669384, -2.21801, 1, 1, 1, 1, 1,
-1.106374, 0.2981916, -0.1291307, 1, 1, 1, 1, 1,
-1.10205, -0.1166367, -1.23659, 1, 1, 1, 1, 1,
-1.098648, 0.733546, -1.115068, 1, 1, 1, 1, 1,
-1.095011, 0.7231236, -0.4785307, 1, 1, 1, 1, 1,
-1.092906, 0.06328405, -0.3757368, 1, 1, 1, 1, 1,
-1.091265, -1.545354, -2.654254, 1, 1, 1, 1, 1,
-1.079946, -0.8115961, -1.617882, 1, 1, 1, 1, 1,
-1.069603, -0.0342535, -0.1133881, 0, 0, 1, 1, 1,
-1.064284, 0.4194822, -2.970459, 1, 0, 0, 1, 1,
-1.054964, 0.1503905, -1.043994, 1, 0, 0, 1, 1,
-1.052173, -0.647077, -0.388565, 1, 0, 0, 1, 1,
-1.051027, -1.228392, -2.020628, 1, 0, 0, 1, 1,
-1.04751, 0.389645, -2.283071, 1, 0, 0, 1, 1,
-1.04381, -0.4314419, -1.374167, 0, 0, 0, 1, 1,
-1.030908, 0.6588849, 0.07113329, 0, 0, 0, 1, 1,
-1.029801, 0.8562289, -3.03215, 0, 0, 0, 1, 1,
-1.028515, 2.752964, 0.0847363, 0, 0, 0, 1, 1,
-1.017912, -0.3016445, -1.858099, 0, 0, 0, 1, 1,
-1.017099, -1.064463, -2.122833, 0, 0, 0, 1, 1,
-1.0149, -0.02029245, -1.681662, 0, 0, 0, 1, 1,
-1.008382, 0.8406858, -0.8377278, 1, 1, 1, 1, 1,
-1.006589, 0.3418655, -1.684524, 1, 1, 1, 1, 1,
-1.006486, -0.2853967, -3.511975, 1, 1, 1, 1, 1,
-0.9973799, -0.4262577, -2.973142, 1, 1, 1, 1, 1,
-0.9889598, -1.074735, -2.229187, 1, 1, 1, 1, 1,
-0.9867219, -0.9152839, -1.446936, 1, 1, 1, 1, 1,
-0.9860847, -0.1168347, -2.876714, 1, 1, 1, 1, 1,
-0.9720331, -1.236101, -2.013422, 1, 1, 1, 1, 1,
-0.9636008, 0.3947288, -1.477989, 1, 1, 1, 1, 1,
-0.9615233, 0.4330613, -1.571571, 1, 1, 1, 1, 1,
-0.9614154, 1.003355, -1.56536, 1, 1, 1, 1, 1,
-0.9579244, 0.1726445, -3.358792, 1, 1, 1, 1, 1,
-0.9562155, 1.533344, 0.08326264, 1, 1, 1, 1, 1,
-0.9531366, 0.483194, -1.249355, 1, 1, 1, 1, 1,
-0.9466016, 0.2395266, -0.9858686, 1, 1, 1, 1, 1,
-0.9463401, -0.9725153, -2.916735, 0, 0, 1, 1, 1,
-0.9432004, 2.679294, -1.747278, 1, 0, 0, 1, 1,
-0.9429976, -1.829061, -4.07, 1, 0, 0, 1, 1,
-0.9417926, 0.3632567, -1.102508, 1, 0, 0, 1, 1,
-0.9389769, -0.5667036, -2.810752, 1, 0, 0, 1, 1,
-0.9320704, -0.2478453, -3.319099, 1, 0, 0, 1, 1,
-0.9319291, 0.4011436, -0.6257292, 0, 0, 0, 1, 1,
-0.9295249, 0.5526274, -1.777899, 0, 0, 0, 1, 1,
-0.9214545, -0.7698871, -1.910532, 0, 0, 0, 1, 1,
-0.8980264, -0.9162444, -3.24359, 0, 0, 0, 1, 1,
-0.8917956, 0.1341402, -0.7394906, 0, 0, 0, 1, 1,
-0.8759587, -0.1074936, -1.382903, 0, 0, 0, 1, 1,
-0.875885, -1.801479, -0.8294372, 0, 0, 0, 1, 1,
-0.8720904, -0.3491687, -2.866307, 1, 1, 1, 1, 1,
-0.8714436, 0.636479, -0.3956747, 1, 1, 1, 1, 1,
-0.868516, -0.02747622, -2.04349, 1, 1, 1, 1, 1,
-0.8678336, -0.3797431, -1.236865, 1, 1, 1, 1, 1,
-0.866607, 0.8881875, 0.1060285, 1, 1, 1, 1, 1,
-0.8659401, -1.304157, -2.339708, 1, 1, 1, 1, 1,
-0.8649182, 0.0587846, -0.8497913, 1, 1, 1, 1, 1,
-0.8620961, 0.1690346, -0.4212477, 1, 1, 1, 1, 1,
-0.8618659, -0.0424432, -2.982167, 1, 1, 1, 1, 1,
-0.8605218, 0.1611845, -2.613036, 1, 1, 1, 1, 1,
-0.8568975, 1.299972, -0.4001049, 1, 1, 1, 1, 1,
-0.8549759, -1.152368, -2.319178, 1, 1, 1, 1, 1,
-0.8546207, 0.601976, 0.2112394, 1, 1, 1, 1, 1,
-0.8529193, 1.292681, 0.03562956, 1, 1, 1, 1, 1,
-0.848656, -0.126653, -2.515158, 1, 1, 1, 1, 1,
-0.8472705, -0.5167122, -4.049504, 0, 0, 1, 1, 1,
-0.8461095, -1.423412, -2.512377, 1, 0, 0, 1, 1,
-0.8391619, 1.391968, 1.455706, 1, 0, 0, 1, 1,
-0.8327515, -1.165223, -3.254544, 1, 0, 0, 1, 1,
-0.8305094, 0.08019344, -2.659784, 1, 0, 0, 1, 1,
-0.8288727, -0.3288371, -2.115905, 1, 0, 0, 1, 1,
-0.8263756, 1.269602, -0.8902045, 0, 0, 0, 1, 1,
-0.8232673, 0.6073236, -0.2735562, 0, 0, 0, 1, 1,
-0.8205399, 1.007118, -0.6759436, 0, 0, 0, 1, 1,
-0.8157184, -1.55407, -3.153826, 0, 0, 0, 1, 1,
-0.8138634, -1.03906, -2.574443, 0, 0, 0, 1, 1,
-0.8112464, -0.8281965, -3.76701, 0, 0, 0, 1, 1,
-0.8002315, -0.4912021, -0.8167984, 0, 0, 0, 1, 1,
-0.8001041, -0.8419646, -1.605134, 1, 1, 1, 1, 1,
-0.795644, 0.5100915, -0.8267896, 1, 1, 1, 1, 1,
-0.7899005, 1.648199, -0.5873766, 1, 1, 1, 1, 1,
-0.786031, -0.6184885, -2.56417, 1, 1, 1, 1, 1,
-0.7792991, -1.38141, -3.347168, 1, 1, 1, 1, 1,
-0.7775882, -0.08103316, -3.119863, 1, 1, 1, 1, 1,
-0.7643468, -1.356601, -3.059159, 1, 1, 1, 1, 1,
-0.7640759, 1.420445, -1.084989, 1, 1, 1, 1, 1,
-0.7629061, -1.075011, -3.125802, 1, 1, 1, 1, 1,
-0.7460611, 0.1367396, -2.110402, 1, 1, 1, 1, 1,
-0.7445934, -0.5046084, -1.415967, 1, 1, 1, 1, 1,
-0.7401667, 1.200682, 1.128223, 1, 1, 1, 1, 1,
-0.738074, 0.07965555, -1.114875, 1, 1, 1, 1, 1,
-0.7366119, 0.04878997, -2.3018, 1, 1, 1, 1, 1,
-0.735259, 0.2454202, -0.707325, 1, 1, 1, 1, 1,
-0.7284169, 0.9623704, -0.2380325, 0, 0, 1, 1, 1,
-0.7279451, -1.019842, -1.485371, 1, 0, 0, 1, 1,
-0.7203047, 0.4422431, -2.005625, 1, 0, 0, 1, 1,
-0.7182407, -0.2241945, -3.71277, 1, 0, 0, 1, 1,
-0.7165189, -0.2166713, -2.723222, 1, 0, 0, 1, 1,
-0.7149579, 1.388534, -1.291584, 1, 0, 0, 1, 1,
-0.7056766, -0.05421615, -2.164537, 0, 0, 0, 1, 1,
-0.7040836, 1.094114, -1.103165, 0, 0, 0, 1, 1,
-0.7029237, 2.20185, 1.059016, 0, 0, 0, 1, 1,
-0.7014681, 1.301541, -2.282072, 0, 0, 0, 1, 1,
-0.695426, 2.293017, 1.155004, 0, 0, 0, 1, 1,
-0.6938828, 0.1877859, -1.725927, 0, 0, 0, 1, 1,
-0.6918802, 0.115333, -0.8203965, 0, 0, 0, 1, 1,
-0.6912087, -0.943896, -1.69394, 1, 1, 1, 1, 1,
-0.6897244, 0.249585, -3.148551, 1, 1, 1, 1, 1,
-0.688202, -0.05109547, -2.962567, 1, 1, 1, 1, 1,
-0.6804435, 0.5251012, -2.35173, 1, 1, 1, 1, 1,
-0.6770861, 0.2786629, -3.496402, 1, 1, 1, 1, 1,
-0.6733849, -1.410025, -0.5848274, 1, 1, 1, 1, 1,
-0.6731692, -0.3439068, -2.852022, 1, 1, 1, 1, 1,
-0.6647745, -1.376744, -2.700016, 1, 1, 1, 1, 1,
-0.6635926, -0.7880901, -1.649632, 1, 1, 1, 1, 1,
-0.6588668, -1.306555, -2.530588, 1, 1, 1, 1, 1,
-0.6586153, 0.4710914, -1.09853, 1, 1, 1, 1, 1,
-0.6585208, 1.234841, -0.5193465, 1, 1, 1, 1, 1,
-0.6568071, 1.700342, -0.2796413, 1, 1, 1, 1, 1,
-0.6550959, -0.8511599, -2.624524, 1, 1, 1, 1, 1,
-0.6535113, 1.010507, -0.964979, 1, 1, 1, 1, 1,
-0.6501103, -0.7300846, -0.1404631, 0, 0, 1, 1, 1,
-0.6473646, 0.7210471, -0.404307, 1, 0, 0, 1, 1,
-0.6473566, 0.602236, -0.9707015, 1, 0, 0, 1, 1,
-0.6445602, 0.2108253, -0.4128865, 1, 0, 0, 1, 1,
-0.6370642, -0.3780617, -2.793834, 1, 0, 0, 1, 1,
-0.629841, 0.8455803, 0.9166476, 1, 0, 0, 1, 1,
-0.6282798, 0.9077686, -1.128594, 0, 0, 0, 1, 1,
-0.6259466, -0.1873032, -0.946271, 0, 0, 0, 1, 1,
-0.6242161, 0.05112242, -2.219302, 0, 0, 0, 1, 1,
-0.620505, -1.472638, -5.297589, 0, 0, 0, 1, 1,
-0.6204457, -0.6922771, -1.779705, 0, 0, 0, 1, 1,
-0.6185842, 0.2037776, -1.799699, 0, 0, 0, 1, 1,
-0.6181948, 1.463505, -1.07475, 0, 0, 0, 1, 1,
-0.6127386, -0.5274228, -0.4567141, 1, 1, 1, 1, 1,
-0.608853, -0.0962746, -2.242, 1, 1, 1, 1, 1,
-0.6083918, 0.2845781, -1.592237, 1, 1, 1, 1, 1,
-0.6046087, -0.8440998, -1.590808, 1, 1, 1, 1, 1,
-0.6019293, -0.7326881, -1.764051, 1, 1, 1, 1, 1,
-0.6011622, 0.3416146, -0.9383051, 1, 1, 1, 1, 1,
-0.5940553, 0.8777139, -0.3478109, 1, 1, 1, 1, 1,
-0.5922841, 0.161847, -2.247943, 1, 1, 1, 1, 1,
-0.5916737, -0.4154087, -1.888262, 1, 1, 1, 1, 1,
-0.5879207, -0.5303282, -1.850572, 1, 1, 1, 1, 1,
-0.5867223, 2.497205, 0.07796599, 1, 1, 1, 1, 1,
-0.5851567, -0.5229278, -2.740192, 1, 1, 1, 1, 1,
-0.582593, -0.1946594, -0.4036329, 1, 1, 1, 1, 1,
-0.5762414, -0.3245581, -1.480632, 1, 1, 1, 1, 1,
-0.5747271, -0.1389071, -1.683227, 1, 1, 1, 1, 1,
-0.5729316, 0.131074, -2.862945, 0, 0, 1, 1, 1,
-0.5717931, -0.05537092, -0.7195547, 1, 0, 0, 1, 1,
-0.5706102, 0.7571381, -1.76028, 1, 0, 0, 1, 1,
-0.5690287, 0.5443776, -0.5460014, 1, 0, 0, 1, 1,
-0.5675772, 1.399047, -0.5374789, 1, 0, 0, 1, 1,
-0.5668586, -0.446546, 0.1234634, 1, 0, 0, 1, 1,
-0.5664014, -1.826777, -1.648061, 0, 0, 0, 1, 1,
-0.5621497, -1.404152, -3.039039, 0, 0, 0, 1, 1,
-0.5615969, 0.4964626, -0.3924597, 0, 0, 0, 1, 1,
-0.5588064, -0.8303933, -1.663706, 0, 0, 0, 1, 1,
-0.5577531, -0.9750072, -3.897871, 0, 0, 0, 1, 1,
-0.5562553, 0.4304415, -1.206151, 0, 0, 0, 1, 1,
-0.5558452, 0.2700738, -3.117252, 0, 0, 0, 1, 1,
-0.5552696, 1.253275, 0.0477434, 1, 1, 1, 1, 1,
-0.5540397, -0.9175634, -2.578743, 1, 1, 1, 1, 1,
-0.5540096, -1.363831, -1.734625, 1, 1, 1, 1, 1,
-0.5489808, -0.3791334, -0.8333064, 1, 1, 1, 1, 1,
-0.5400673, 0.7377457, 0.2870311, 1, 1, 1, 1, 1,
-0.5371461, -0.3708544, -2.950129, 1, 1, 1, 1, 1,
-0.5348783, -1.936652, -0.7773626, 1, 1, 1, 1, 1,
-0.5348206, -0.9979351, -3.844678, 1, 1, 1, 1, 1,
-0.5316562, -0.4983983, -3.257731, 1, 1, 1, 1, 1,
-0.5290942, -1.083376, -3.033564, 1, 1, 1, 1, 1,
-0.5267491, -0.9810175, -1.247939, 1, 1, 1, 1, 1,
-0.526252, -0.6943171, -2.896688, 1, 1, 1, 1, 1,
-0.5232413, 0.3494706, -1.935201, 1, 1, 1, 1, 1,
-0.5218574, 0.8368641, -0.3262802, 1, 1, 1, 1, 1,
-0.5190836, -0.4975804, -2.120107, 1, 1, 1, 1, 1,
-0.5176418, -0.8655239, -3.797315, 0, 0, 1, 1, 1,
-0.517507, 0.9979984, -0.3807911, 1, 0, 0, 1, 1,
-0.5157148, 1.30708, 1.333132, 1, 0, 0, 1, 1,
-0.5125854, -0.9228435, -1.171725, 1, 0, 0, 1, 1,
-0.5087798, 1.095356, 0.2459852, 1, 0, 0, 1, 1,
-0.5005015, 0.4983143, -1.147592, 1, 0, 0, 1, 1,
-0.4995551, 1.45067, -0.2455963, 0, 0, 0, 1, 1,
-0.4931399, 1.019502, -1.015544, 0, 0, 0, 1, 1,
-0.4914874, -0.6648695, -1.913041, 0, 0, 0, 1, 1,
-0.490716, -1.139191, -3.777795, 0, 0, 0, 1, 1,
-0.48253, 1.245617, 0.1362877, 0, 0, 0, 1, 1,
-0.4729305, 0.02364677, -1.611513, 0, 0, 0, 1, 1,
-0.4727511, 0.3517984, 0.2826624, 0, 0, 0, 1, 1,
-0.472291, -0.5650274, -2.897648, 1, 1, 1, 1, 1,
-0.4715168, -0.9183725, -3.090228, 1, 1, 1, 1, 1,
-0.4714756, -0.2946171, -1.104026, 1, 1, 1, 1, 1,
-0.4675969, 1.253821, -0.6608085, 1, 1, 1, 1, 1,
-0.462482, -0.4787991, -0.2036604, 1, 1, 1, 1, 1,
-0.4578134, -1.029055, -2.747191, 1, 1, 1, 1, 1,
-0.4570656, -1.285532, -2.918198, 1, 1, 1, 1, 1,
-0.4564887, 0.8955504, 0.7989111, 1, 1, 1, 1, 1,
-0.4494973, -0.1810265, -3.103587, 1, 1, 1, 1, 1,
-0.4464271, 0.9291618, -1.175321, 1, 1, 1, 1, 1,
-0.4450175, -1.478342, -1.586377, 1, 1, 1, 1, 1,
-0.444955, -1.84243, -1.567758, 1, 1, 1, 1, 1,
-0.4440055, 0.3559299, 1.026141, 1, 1, 1, 1, 1,
-0.4399459, -1.30696, -3.686209, 1, 1, 1, 1, 1,
-0.4285244, -0.09064304, -3.325504, 1, 1, 1, 1, 1,
-0.4270898, 0.4634608, -0.8796751, 0, 0, 1, 1, 1,
-0.4219643, -1.777033, -2.413884, 1, 0, 0, 1, 1,
-0.4205552, -0.8228261, 0.03869652, 1, 0, 0, 1, 1,
-0.4176469, -0.4561577, -2.345994, 1, 0, 0, 1, 1,
-0.4162866, 0.2269531, -0.3999501, 1, 0, 0, 1, 1,
-0.4112568, 1.604962, -1.142779, 1, 0, 0, 1, 1,
-0.4101735, 0.5336539, 0.3808174, 0, 0, 0, 1, 1,
-0.3983088, 0.3014866, 0.5091794, 0, 0, 0, 1, 1,
-0.3970583, 0.6517952, 0.3300312, 0, 0, 0, 1, 1,
-0.3969051, 1.149037, -1.008196, 0, 0, 0, 1, 1,
-0.3879987, -1.23401, -1.695066, 0, 0, 0, 1, 1,
-0.3879319, -2.354535, -3.085234, 0, 0, 0, 1, 1,
-0.3870941, -0.8677296, -1.715098, 0, 0, 0, 1, 1,
-0.3860706, 0.5560051, -0.5356097, 1, 1, 1, 1, 1,
-0.3804541, -0.7216199, -3.262919, 1, 1, 1, 1, 1,
-0.3786164, 0.6796814, -1.087559, 1, 1, 1, 1, 1,
-0.3766562, 1.069854, 0.9993584, 1, 1, 1, 1, 1,
-0.3718897, -0.7098189, -0.2352008, 1, 1, 1, 1, 1,
-0.371675, -0.8173017, -2.375949, 1, 1, 1, 1, 1,
-0.3706951, -0.1520044, -3.505346, 1, 1, 1, 1, 1,
-0.3697976, -2.11987, -4.458039, 1, 1, 1, 1, 1,
-0.3521987, 0.8701222, -1.408919, 1, 1, 1, 1, 1,
-0.3502035, 0.8448972, -2.148886, 1, 1, 1, 1, 1,
-0.3451309, 0.2058807, -1.826784, 1, 1, 1, 1, 1,
-0.3397536, 0.3765905, -1.307281, 1, 1, 1, 1, 1,
-0.3328618, 0.9175872, 0.5268262, 1, 1, 1, 1, 1,
-0.3318113, 0.4836437, -1.492957, 1, 1, 1, 1, 1,
-0.329507, 0.887659, 1.480228, 1, 1, 1, 1, 1,
-0.3292263, -2.004569, -3.904777, 0, 0, 1, 1, 1,
-0.3264427, -0.3407419, -3.762767, 1, 0, 0, 1, 1,
-0.3100994, 1.083947, -0.5580262, 1, 0, 0, 1, 1,
-0.3057384, -1.120342, -2.699587, 1, 0, 0, 1, 1,
-0.305424, -0.4220613, -1.778234, 1, 0, 0, 1, 1,
-0.3046519, 0.4561308, -1.398396, 1, 0, 0, 1, 1,
-0.304627, 1.091416, 0.7428166, 0, 0, 0, 1, 1,
-0.3039144, -1.434914, -3.624835, 0, 0, 0, 1, 1,
-0.3039125, -0.5829099, -3.88021, 0, 0, 0, 1, 1,
-0.2899162, -1.161791, -2.446204, 0, 0, 0, 1, 1,
-0.2891837, 0.129119, -1.393087, 0, 0, 0, 1, 1,
-0.2852311, 0.2218148, 0.4300798, 0, 0, 0, 1, 1,
-0.2850638, 0.06731053, 1.099232, 0, 0, 0, 1, 1,
-0.2841068, 0.910553, -0.8125826, 1, 1, 1, 1, 1,
-0.283583, 1.563437, 0.1719709, 1, 1, 1, 1, 1,
-0.2787674, 1.222575, 0.1153772, 1, 1, 1, 1, 1,
-0.277895, 0.5587643, 0.9218542, 1, 1, 1, 1, 1,
-0.2724519, 0.3219703, -1.351241, 1, 1, 1, 1, 1,
-0.2721696, 0.959357, -1.949953, 1, 1, 1, 1, 1,
-0.2702992, 0.7825713, 1.082663, 1, 1, 1, 1, 1,
-0.2687577, 0.296467, -1.06681, 1, 1, 1, 1, 1,
-0.2650081, 1.160468, -1.174745, 1, 1, 1, 1, 1,
-0.2595007, -2.163221, -2.938777, 1, 1, 1, 1, 1,
-0.2561866, -1.035991, -4.346159, 1, 1, 1, 1, 1,
-0.2558776, -0.4704799, -2.016418, 1, 1, 1, 1, 1,
-0.2546994, -0.1905797, -1.994478, 1, 1, 1, 1, 1,
-0.2540998, 0.2244923, -1.159611, 1, 1, 1, 1, 1,
-0.252536, -0.8295236, -3.905731, 1, 1, 1, 1, 1,
-0.2488472, -0.4714481, -1.936578, 0, 0, 1, 1, 1,
-0.2485849, 1.057442, 0.2373058, 1, 0, 0, 1, 1,
-0.2451965, -1.373376, -2.865456, 1, 0, 0, 1, 1,
-0.2432027, -0.3619715, -2.64017, 1, 0, 0, 1, 1,
-0.2398209, -0.1145452, -2.787833, 1, 0, 0, 1, 1,
-0.2386283, -0.3296892, -3.207963, 1, 0, 0, 1, 1,
-0.2377072, 0.2592548, -1.01616, 0, 0, 0, 1, 1,
-0.2338421, -0.06497069, -1.168219, 0, 0, 0, 1, 1,
-0.2334945, -2.202463, -2.219259, 0, 0, 0, 1, 1,
-0.2275691, -1.210516, -3.092391, 0, 0, 0, 1, 1,
-0.2266884, 0.8548223, -1.037303, 0, 0, 0, 1, 1,
-0.2247825, -0.7659266, -3.373471, 0, 0, 0, 1, 1,
-0.2237977, -0.1646313, -2.014914, 0, 0, 0, 1, 1,
-0.2232202, -1.730196, -3.06409, 1, 1, 1, 1, 1,
-0.2221941, 0.348823, 0.399454, 1, 1, 1, 1, 1,
-0.2135693, -1.081112, -3.49023, 1, 1, 1, 1, 1,
-0.2120321, -0.7760562, -2.124167, 1, 1, 1, 1, 1,
-0.210048, 0.625611, 0.7485948, 1, 1, 1, 1, 1,
-0.2097326, 1.596662, 1.089334, 1, 1, 1, 1, 1,
-0.2082642, -0.4578972, -4.132503, 1, 1, 1, 1, 1,
-0.2052757, 0.1886704, -1.637239, 1, 1, 1, 1, 1,
-0.204563, 1.851875, 0.3415786, 1, 1, 1, 1, 1,
-0.1980263, -0.1960864, -1.179269, 1, 1, 1, 1, 1,
-0.1979914, -0.1424917, -3.155, 1, 1, 1, 1, 1,
-0.1962721, -0.7565903, -3.666651, 1, 1, 1, 1, 1,
-0.1916585, -0.1788163, -3.218712, 1, 1, 1, 1, 1,
-0.187789, 0.8693767, 1.07304, 1, 1, 1, 1, 1,
-0.180287, 0.6565486, 1.005919, 1, 1, 1, 1, 1,
-0.1740341, 1.031794, -0.3490354, 0, 0, 1, 1, 1,
-0.1737847, -1.037182, -3.379877, 1, 0, 0, 1, 1,
-0.1734341, -0.1338456, 0.2890243, 1, 0, 0, 1, 1,
-0.173049, -0.2663274, -3.712483, 1, 0, 0, 1, 1,
-0.1702148, 0.3644988, -1.264794, 1, 0, 0, 1, 1,
-0.163573, 0.2475363, 0.6910327, 1, 0, 0, 1, 1,
-0.1608824, -1.390769, -1.990792, 0, 0, 0, 1, 1,
-0.1600899, 0.8749025, -1.389424, 0, 0, 0, 1, 1,
-0.1568357, -1.29141, -4.28837, 0, 0, 0, 1, 1,
-0.1558917, 0.3836634, -0.4966187, 0, 0, 0, 1, 1,
-0.1548239, -0.4208608, -4.467543, 0, 0, 0, 1, 1,
-0.1509344, 1.20423, 0.9311136, 0, 0, 0, 1, 1,
-0.1470914, -0.551756, -1.623978, 0, 0, 0, 1, 1,
-0.1469052, 0.9082606, -1.614334, 1, 1, 1, 1, 1,
-0.1465569, 1.449328, -0.5119938, 1, 1, 1, 1, 1,
-0.1457098, 1.521054, 0.7281989, 1, 1, 1, 1, 1,
-0.1426168, 0.2244166, 0.4041565, 1, 1, 1, 1, 1,
-0.1377, -1.048311, -3.587438, 1, 1, 1, 1, 1,
-0.1368409, -0.7898656, -3.612705, 1, 1, 1, 1, 1,
-0.1363406, 2.648259, 1.852651, 1, 1, 1, 1, 1,
-0.1340641, 1.214087, -1.288058, 1, 1, 1, 1, 1,
-0.1315604, -1.721341, -4.555536, 1, 1, 1, 1, 1,
-0.131172, 0.1822138, -0.6791673, 1, 1, 1, 1, 1,
-0.1309839, -0.01034149, -1.40374, 1, 1, 1, 1, 1,
-0.1279097, 0.4112804, 1.127417, 1, 1, 1, 1, 1,
-0.1253666, 0.3504067, 0.2550882, 1, 1, 1, 1, 1,
-0.1236387, 0.127787, -2.076885, 1, 1, 1, 1, 1,
-0.1189807, 0.9812137, -1.214108, 1, 1, 1, 1, 1,
-0.1172678, -1.211157, -2.127544, 0, 0, 1, 1, 1,
-0.1111189, 0.06758182, 0.2701304, 1, 0, 0, 1, 1,
-0.1056482, 0.5219027, -0.5201937, 1, 0, 0, 1, 1,
-0.09957971, 0.3404984, -0.6737554, 1, 0, 0, 1, 1,
-0.09611469, 0.08276909, -1.329957, 1, 0, 0, 1, 1,
-0.09387119, -0.1269081, -5.009337, 1, 0, 0, 1, 1,
-0.09273034, 0.6477899, 1.982405, 0, 0, 0, 1, 1,
-0.09228617, -1.307246, -2.048802, 0, 0, 0, 1, 1,
-0.09221834, -1.634459, -1.815961, 0, 0, 0, 1, 1,
-0.08608707, -0.6587686, -1.351798, 0, 0, 0, 1, 1,
-0.08169015, 2.078377, 0.1077028, 0, 0, 0, 1, 1,
-0.08099848, 0.5714988, -0.2213729, 0, 0, 0, 1, 1,
-0.07891162, 0.3194364, -0.1104267, 0, 0, 0, 1, 1,
-0.0771885, -0.4854041, -2.220868, 1, 1, 1, 1, 1,
-0.07694915, 0.6274521, 0.2935081, 1, 1, 1, 1, 1,
-0.06846496, 0.7491988, 0.4334619, 1, 1, 1, 1, 1,
-0.06816414, -2.055466, -3.294726, 1, 1, 1, 1, 1,
-0.0677438, 1.302593, 0.1904835, 1, 1, 1, 1, 1,
-0.06768708, 0.4003491, 0.6044574, 1, 1, 1, 1, 1,
-0.06433365, -0.6357815, -4.4695, 1, 1, 1, 1, 1,
-0.06099033, -0.838352, -3.300422, 1, 1, 1, 1, 1,
-0.05861015, -0.1619624, -2.191723, 1, 1, 1, 1, 1,
-0.05815178, -0.6162333, -3.441277, 1, 1, 1, 1, 1,
-0.05553566, 1.344823, -1.205228, 1, 1, 1, 1, 1,
-0.05243162, -1.401954, -5.201091, 1, 1, 1, 1, 1,
-0.0457608, 0.3528931, -0.1121733, 1, 1, 1, 1, 1,
-0.04274781, -1.092161, -3.563929, 1, 1, 1, 1, 1,
-0.04202496, 2.138604, 0.8173079, 1, 1, 1, 1, 1,
-0.03310259, -0.09534035, -3.07751, 0, 0, 1, 1, 1,
-0.03151058, -0.2169553, -3.544611, 1, 0, 0, 1, 1,
-0.02986127, 0.7229927, -0.1990125, 1, 0, 0, 1, 1,
-0.02718122, -0.08306308, -4.616569, 1, 0, 0, 1, 1,
-0.02259677, 0.8806833, 0.5659743, 1, 0, 0, 1, 1,
-0.0210901, -0.9484713, -1.825904, 1, 0, 0, 1, 1,
-0.020784, -0.1674515, -5.344504, 0, 0, 0, 1, 1,
-0.02030772, -0.04089664, -0.5527956, 0, 0, 0, 1, 1,
-0.01867482, -0.5543274, -2.003546, 0, 0, 0, 1, 1,
-0.01444196, 1.426007, 1.72003, 0, 0, 0, 1, 1,
-0.005241908, 0.5345268, -1.043792, 0, 0, 0, 1, 1,
-0.001320391, 1.897266, 1.567515, 0, 0, 0, 1, 1,
-0.001000627, 1.003741, -0.692227, 0, 0, 0, 1, 1,
-0.0002389461, -1.473507, -4.3901, 1, 1, 1, 1, 1,
0.001858233, 1.39686, 1.907636, 1, 1, 1, 1, 1,
0.006073256, 0.7295837, -0.4182013, 1, 1, 1, 1, 1,
0.009272796, 0.2821234, -0.1930055, 1, 1, 1, 1, 1,
0.009930639, 1.086252, -0.9224805, 1, 1, 1, 1, 1,
0.01350723, 0.1254902, 1.091627, 1, 1, 1, 1, 1,
0.01474009, -0.4714252, 3.789647, 1, 1, 1, 1, 1,
0.01662319, -1.130445, 3.802866, 1, 1, 1, 1, 1,
0.01718952, 0.3407194, -0.7855828, 1, 1, 1, 1, 1,
0.0172216, -0.2287248, 3.675909, 1, 1, 1, 1, 1,
0.02630779, -0.1934438, 3.669644, 1, 1, 1, 1, 1,
0.02970329, 0.1669963, 0.8940567, 1, 1, 1, 1, 1,
0.0318776, 0.2189154, -0.6828657, 1, 1, 1, 1, 1,
0.03362765, -0.5692685, 1.725522, 1, 1, 1, 1, 1,
0.04122788, 1.544297, 0.615669, 1, 1, 1, 1, 1,
0.04235424, -1.629483, 2.281199, 0, 0, 1, 1, 1,
0.04351383, -1.091853, 3.655332, 1, 0, 0, 1, 1,
0.04489785, -0.3879059, 3.089297, 1, 0, 0, 1, 1,
0.05384943, -0.9471029, 2.172879, 1, 0, 0, 1, 1,
0.05398357, 0.9410371, 1.113639, 1, 0, 0, 1, 1,
0.05478393, 0.1944491, 0.5520551, 1, 0, 0, 1, 1,
0.05497833, 1.256596, 0.1202019, 0, 0, 0, 1, 1,
0.05902215, 0.3645914, -0.9641788, 0, 0, 0, 1, 1,
0.06151828, 1.649507, 1.206173, 0, 0, 0, 1, 1,
0.06249572, 0.5237941, 0.5583262, 0, 0, 0, 1, 1,
0.06304348, 0.3364821, 0.5708678, 0, 0, 0, 1, 1,
0.06897185, -0.3908347, 3.164991, 0, 0, 0, 1, 1,
0.07145381, -1.203554, 3.062574, 0, 0, 0, 1, 1,
0.07150254, -0.1837186, 2.143858, 1, 1, 1, 1, 1,
0.07358091, 0.2185449, -1.113217, 1, 1, 1, 1, 1,
0.07888138, 0.2884115, -0.1274124, 1, 1, 1, 1, 1,
0.0839951, -0.7497492, 2.118693, 1, 1, 1, 1, 1,
0.08666209, -0.1969436, 3.41454, 1, 1, 1, 1, 1,
0.0920177, -0.07974078, 1.886491, 1, 1, 1, 1, 1,
0.0931102, -2.161036, 1.157236, 1, 1, 1, 1, 1,
0.09366743, 1.109777, 0.4200515, 1, 1, 1, 1, 1,
0.09389619, -0.3003071, 2.305294, 1, 1, 1, 1, 1,
0.09761093, 1.098673, -0.5153489, 1, 1, 1, 1, 1,
0.09908636, -0.06984372, 3.591257, 1, 1, 1, 1, 1,
0.09970412, 2.344919, 1.504156, 1, 1, 1, 1, 1,
0.1043045, 0.4533022, 0.1272259, 1, 1, 1, 1, 1,
0.1070001, 1.130724, 0.4199512, 1, 1, 1, 1, 1,
0.1107581, -0.3176926, 3.016814, 1, 1, 1, 1, 1,
0.1135329, -1.916614, 0.9718155, 0, 0, 1, 1, 1,
0.1173641, 0.2989667, 0.04303951, 1, 0, 0, 1, 1,
0.1203953, 1.038948, -1.159551, 1, 0, 0, 1, 1,
0.1213431, -0.5725374, 4.870095, 1, 0, 0, 1, 1,
0.1256793, -0.3337561, 2.381023, 1, 0, 0, 1, 1,
0.1300796, -1.677075, 2.740518, 1, 0, 0, 1, 1,
0.134926, 0.9998139, -0.5285047, 0, 0, 0, 1, 1,
0.1418617, 1.653981, 0.6304219, 0, 0, 0, 1, 1,
0.1429583, -0.9299476, 3.446037, 0, 0, 0, 1, 1,
0.1443187, 0.4287642, 1.915575, 0, 0, 0, 1, 1,
0.1446833, -0.5788503, 1.405364, 0, 0, 0, 1, 1,
0.1474293, -0.1060881, 1.73015, 0, 0, 0, 1, 1,
0.1491551, 0.6539519, 0.374785, 0, 0, 0, 1, 1,
0.1497763, 0.6206024, 0.8266217, 1, 1, 1, 1, 1,
0.1524357, 1.111854, -1.392547, 1, 1, 1, 1, 1,
0.1528622, -0.6365728, 2.840252, 1, 1, 1, 1, 1,
0.1529124, -0.3649925, 2.012631, 1, 1, 1, 1, 1,
0.1572199, 0.2670324, -0.2163762, 1, 1, 1, 1, 1,
0.159318, -1.971775, 0.9023004, 1, 1, 1, 1, 1,
0.1648673, -0.9511907, 2.979236, 1, 1, 1, 1, 1,
0.1653375, 0.1385421, 0.3067756, 1, 1, 1, 1, 1,
0.1662425, 1.372145, 0.754039, 1, 1, 1, 1, 1,
0.1682186, -0.4349708, 4.248161, 1, 1, 1, 1, 1,
0.1688089, -0.05396097, 2.204843, 1, 1, 1, 1, 1,
0.1697896, -1.82429, 2.017137, 1, 1, 1, 1, 1,
0.1725939, -0.8890868, 2.040926, 1, 1, 1, 1, 1,
0.1739611, 1.100234, -0.0148761, 1, 1, 1, 1, 1,
0.1763153, -1.159818, 1.759383, 1, 1, 1, 1, 1,
0.18513, -0.6117427, 3.919454, 0, 0, 1, 1, 1,
0.1880389, -0.4708435, 3.619151, 1, 0, 0, 1, 1,
0.1881145, -1.485065, 2.043753, 1, 0, 0, 1, 1,
0.1905807, 1.245354, 0.02717792, 1, 0, 0, 1, 1,
0.1963599, -0.526854, 2.300451, 1, 0, 0, 1, 1,
0.19882, 1.143554, 1.063081, 1, 0, 0, 1, 1,
0.2023065, -0.04268945, 1.481107, 0, 0, 0, 1, 1,
0.2047187, -0.5512286, 1.626469, 0, 0, 0, 1, 1,
0.2061369, 0.7898866, -1.041624, 0, 0, 0, 1, 1,
0.2091539, -0.3232558, 4.178406, 0, 0, 0, 1, 1,
0.2095142, -1.912061, 2.014678, 0, 0, 0, 1, 1,
0.2100027, -0.4350123, 3.405362, 0, 0, 0, 1, 1,
0.2107182, 0.006272443, 2.718174, 0, 0, 0, 1, 1,
0.2114224, -0.6582704, 1.757161, 1, 1, 1, 1, 1,
0.2133896, -1.705842, 4.731692, 1, 1, 1, 1, 1,
0.2140483, 0.6816002, 2.032554, 1, 1, 1, 1, 1,
0.2141996, 0.8999638, 0.4084775, 1, 1, 1, 1, 1,
0.214506, -0.659746, 3.31919, 1, 1, 1, 1, 1,
0.224305, 0.7508395, 0.03084673, 1, 1, 1, 1, 1,
0.2290952, -1.1808, 1.406929, 1, 1, 1, 1, 1,
0.2311147, 0.6558898, 0.9754722, 1, 1, 1, 1, 1,
0.2340455, 0.5278702, 1.531301, 1, 1, 1, 1, 1,
0.235106, 1.172681, 0.2747281, 1, 1, 1, 1, 1,
0.2388941, -0.2575994, 1.356532, 1, 1, 1, 1, 1,
0.2397423, 0.3347006, -0.7011681, 1, 1, 1, 1, 1,
0.2424162, 0.4036103, 1.148524, 1, 1, 1, 1, 1,
0.2442843, -0.9970192, 4.13245, 1, 1, 1, 1, 1,
0.2453707, -2.263424, 3.743063, 1, 1, 1, 1, 1,
0.250506, -0.3797268, 2.450755, 0, 0, 1, 1, 1,
0.2568626, 0.2366273, 1.651844, 1, 0, 0, 1, 1,
0.2571294, -2.289671, 1.766776, 1, 0, 0, 1, 1,
0.2587079, 0.553687, -0.001511794, 1, 0, 0, 1, 1,
0.2590197, 0.4943512, -1.083269, 1, 0, 0, 1, 1,
0.2628983, -0.4862722, 3.691824, 1, 0, 0, 1, 1,
0.2645129, 0.1683938, 0.4283061, 0, 0, 0, 1, 1,
0.2656956, -1.261635, 3.058578, 0, 0, 0, 1, 1,
0.266041, -1.676942, 3.457983, 0, 0, 0, 1, 1,
0.272718, -2.780866, 1.995077, 0, 0, 0, 1, 1,
0.2734498, 0.8534641, 0.6670023, 0, 0, 0, 1, 1,
0.2748916, -0.6085318, 3.141664, 0, 0, 0, 1, 1,
0.2761769, 0.2395502, -0.09042531, 0, 0, 0, 1, 1,
0.2843444, 0.5783333, 1.981713, 1, 1, 1, 1, 1,
0.2915694, -1.994417, 2.112851, 1, 1, 1, 1, 1,
0.2920991, 1.262128, 0.7603381, 1, 1, 1, 1, 1,
0.3008806, 2.175464, 0.8535175, 1, 1, 1, 1, 1,
0.3069128, -1.227284, 4.215002, 1, 1, 1, 1, 1,
0.307548, 0.4311384, 0.6859007, 1, 1, 1, 1, 1,
0.3107634, 0.4577494, 1.081573, 1, 1, 1, 1, 1,
0.3109505, 0.7095893, 3.130841, 1, 1, 1, 1, 1,
0.3136445, 1.505161, -0.7006102, 1, 1, 1, 1, 1,
0.314252, 0.9382151, 0.1522237, 1, 1, 1, 1, 1,
0.3153568, -0.5051382, 2.914556, 1, 1, 1, 1, 1,
0.3208179, 0.5678837, 1.0878, 1, 1, 1, 1, 1,
0.3229181, -2.263716, 1.605462, 1, 1, 1, 1, 1,
0.3255921, -1.287685, 2.544186, 1, 1, 1, 1, 1,
0.3294812, -0.593944, 1.920744, 1, 1, 1, 1, 1,
0.3298062, 0.918933, -0.8826081, 0, 0, 1, 1, 1,
0.3323601, 0.118356, 3.226061, 1, 0, 0, 1, 1,
0.3326813, -0.4130746, 1.400841, 1, 0, 0, 1, 1,
0.3369511, 0.2215877, 1.904529, 1, 0, 0, 1, 1,
0.3373619, -0.1112774, 0.3060665, 1, 0, 0, 1, 1,
0.3415185, 0.1061364, 1.186704, 1, 0, 0, 1, 1,
0.3415912, 0.02422697, 1.520699, 0, 0, 0, 1, 1,
0.3422716, 1.053471, 0.144007, 0, 0, 0, 1, 1,
0.3451557, 0.4461232, -0.2985447, 0, 0, 0, 1, 1,
0.3531491, 0.3152794, 2.192454, 0, 0, 0, 1, 1,
0.355829, -0.5370566, 0.8533872, 0, 0, 0, 1, 1,
0.3582091, -0.1606449, 2.799989, 0, 0, 0, 1, 1,
0.364999, 0.5701162, 0.7202289, 0, 0, 0, 1, 1,
0.3711162, -1.231071, 3.425342, 1, 1, 1, 1, 1,
0.3756213, -0.7469769, 3.498285, 1, 1, 1, 1, 1,
0.3791455, 0.7431964, -0.6472408, 1, 1, 1, 1, 1,
0.3819306, 0.2803141, 2.176721, 1, 1, 1, 1, 1,
0.3830699, -1.070006, 3.069064, 1, 1, 1, 1, 1,
0.3832597, 0.9438066, 1.302654, 1, 1, 1, 1, 1,
0.3870041, -0.71259, 2.824121, 1, 1, 1, 1, 1,
0.3943791, -0.4110701, 1.073369, 1, 1, 1, 1, 1,
0.4009779, -0.5081335, 2.918881, 1, 1, 1, 1, 1,
0.4036576, 0.3355502, 2.334921, 1, 1, 1, 1, 1,
0.4047591, 1.440621, 0.5243611, 1, 1, 1, 1, 1,
0.4101253, -1.185073, 2.48507, 1, 1, 1, 1, 1,
0.4133276, 0.2004916, 0.9147435, 1, 1, 1, 1, 1,
0.4153335, 0.6208853, 1.037753, 1, 1, 1, 1, 1,
0.4156505, -0.004870315, 2.990201, 1, 1, 1, 1, 1,
0.4187378, -0.9696888, 2.517735, 0, 0, 1, 1, 1,
0.4188001, 0.9791631, 1.918841, 1, 0, 0, 1, 1,
0.4201772, -0.05222499, 0.5914518, 1, 0, 0, 1, 1,
0.4217604, -0.6919886, 1.198656, 1, 0, 0, 1, 1,
0.4274239, 0.50465, 0.8434988, 1, 0, 0, 1, 1,
0.4286285, 0.9564452, 0.3649128, 1, 0, 0, 1, 1,
0.4325802, 0.223657, 1.830507, 0, 0, 0, 1, 1,
0.4360774, 0.1121321, 0.8960493, 0, 0, 0, 1, 1,
0.4375639, 0.3693461, -0.2635975, 0, 0, 0, 1, 1,
0.4421628, -0.5934954, 1.487089, 0, 0, 0, 1, 1,
0.4436822, 1.821949, -0.439941, 0, 0, 0, 1, 1,
0.4438898, 0.7829984, 0.4459237, 0, 0, 0, 1, 1,
0.4474447, 0.4350692, 0.6771506, 0, 0, 0, 1, 1,
0.4506641, 0.9645751, 1.418583, 1, 1, 1, 1, 1,
0.4518001, -2.49405, 3.476216, 1, 1, 1, 1, 1,
0.4522766, -0.5490587, 2.531576, 1, 1, 1, 1, 1,
0.4535794, -0.4572667, 2.341303, 1, 1, 1, 1, 1,
0.4539428, -0.4308996, 5.73099, 1, 1, 1, 1, 1,
0.4569562, -0.3750404, 3.474886, 1, 1, 1, 1, 1,
0.4597938, 0.3887576, 0.3845227, 1, 1, 1, 1, 1,
0.4628346, -0.2317773, 1.270822, 1, 1, 1, 1, 1,
0.4688995, -0.9541351, 3.138699, 1, 1, 1, 1, 1,
0.4727799, 1.154649, 2.478477, 1, 1, 1, 1, 1,
0.4743599, -0.8178421, 3.065026, 1, 1, 1, 1, 1,
0.4834268, 0.9851167, 1.820533, 1, 1, 1, 1, 1,
0.4942662, -0.5259942, 4.55384, 1, 1, 1, 1, 1,
0.4943456, -2.314079, 1.857622, 1, 1, 1, 1, 1,
0.5035934, 0.1661669, 0.4339191, 1, 1, 1, 1, 1,
0.5039796, 1.146548, 0.2633624, 0, 0, 1, 1, 1,
0.5061442, 0.9966178, -0.668156, 1, 0, 0, 1, 1,
0.5077121, -0.00315556, 1.842673, 1, 0, 0, 1, 1,
0.5115351, -0.7456199, 3.711169, 1, 0, 0, 1, 1,
0.5127375, 1.223567, -1.604716, 1, 0, 0, 1, 1,
0.5164626, -1.253232, 4.260971, 1, 0, 0, 1, 1,
0.5191032, -1.052891, 2.481561, 0, 0, 0, 1, 1,
0.5294784, -0.9047571, 1.440937, 0, 0, 0, 1, 1,
0.5322249, -0.6767102, 2.407104, 0, 0, 0, 1, 1,
0.5322503, 1.377245, 0.7085389, 0, 0, 0, 1, 1,
0.5407203, -1.012741, 2.380745, 0, 0, 0, 1, 1,
0.5422681, -0.667983, 1.578597, 0, 0, 0, 1, 1,
0.5466319, 0.8783222, 1.149099, 0, 0, 0, 1, 1,
0.5471098, -1.827626, 1.860242, 1, 1, 1, 1, 1,
0.5482535, -0.9857739, 2.763419, 1, 1, 1, 1, 1,
0.5545381, -2.819243, 3.576972, 1, 1, 1, 1, 1,
0.5613604, -0.6661911, 2.933567, 1, 1, 1, 1, 1,
0.5616643, -0.4405613, 1.316189, 1, 1, 1, 1, 1,
0.5652847, -1.670147, 3.413469, 1, 1, 1, 1, 1,
0.5695558, -1.467469, 2.419556, 1, 1, 1, 1, 1,
0.5722408, -0.1822994, 1.002162, 1, 1, 1, 1, 1,
0.5795751, 0.2180552, 0.5681143, 1, 1, 1, 1, 1,
0.584381, -0.03082507, 1.183599, 1, 1, 1, 1, 1,
0.5933194, -1.672471, 2.485003, 1, 1, 1, 1, 1,
0.5933272, -0.9461361, 4.52989, 1, 1, 1, 1, 1,
0.5957373, -0.1338106, 1.998813, 1, 1, 1, 1, 1,
0.6019033, -1.415337, 3.072537, 1, 1, 1, 1, 1,
0.6021613, 0.1806083, 0.5361784, 1, 1, 1, 1, 1,
0.6035122, 1.29969, -0.303677, 0, 0, 1, 1, 1,
0.605525, 0.2089249, 1.6415, 1, 0, 0, 1, 1,
0.6076503, -1.985865, 2.097747, 1, 0, 0, 1, 1,
0.6123657, 0.1102251, 2.425683, 1, 0, 0, 1, 1,
0.6162419, -1.919454, 2.70699, 1, 0, 0, 1, 1,
0.6176285, 0.8903785, 0.5941513, 1, 0, 0, 1, 1,
0.6204216, -0.6329103, 2.917522, 0, 0, 0, 1, 1,
0.620846, 0.5362773, -0.2449532, 0, 0, 0, 1, 1,
0.6217856, 0.2199468, 1.457158, 0, 0, 0, 1, 1,
0.6225418, 1.62567, -1.27832, 0, 0, 0, 1, 1,
0.6256626, -0.8828875, 0.7749475, 0, 0, 0, 1, 1,
0.6273998, -0.1483869, 1.086365, 0, 0, 0, 1, 1,
0.6301173, 0.9762127, -0.9752262, 0, 0, 0, 1, 1,
0.6313907, -0.1821966, 1.428112, 1, 1, 1, 1, 1,
0.6328211, 1.193133, 0.8236365, 1, 1, 1, 1, 1,
0.6367761, -0.9909085, 2.083071, 1, 1, 1, 1, 1,
0.6416829, -0.6414049, 2.070869, 1, 1, 1, 1, 1,
0.642728, 0.2365457, 1.048531, 1, 1, 1, 1, 1,
0.6458339, 0.7736026, 0.3335196, 1, 1, 1, 1, 1,
0.6552529, 0.5394647, 1.012086, 1, 1, 1, 1, 1,
0.6567506, 0.8502862, 1.566487, 1, 1, 1, 1, 1,
0.6569467, 0.1770653, 1.100124, 1, 1, 1, 1, 1,
0.6597934, 0.6647393, 0.6957394, 1, 1, 1, 1, 1,
0.6614005, 0.6977782, 1.572881, 1, 1, 1, 1, 1,
0.6640282, -1.391056, 3.850143, 1, 1, 1, 1, 1,
0.6660556, 1.505134, 0.3391334, 1, 1, 1, 1, 1,
0.6685988, 0.2644154, 2.043665, 1, 1, 1, 1, 1,
0.6703759, -0.6754586, 1.566336, 1, 1, 1, 1, 1,
0.6704462, 0.5855643, 0.06718345, 0, 0, 1, 1, 1,
0.674072, 0.550463, 1.555278, 1, 0, 0, 1, 1,
0.676098, 0.5645666, 0.5460111, 1, 0, 0, 1, 1,
0.6785415, -1.630578, 1.356776, 1, 0, 0, 1, 1,
0.6817771, 0.5051855, 0.253453, 1, 0, 0, 1, 1,
0.682082, -1.530894, 2.748966, 1, 0, 0, 1, 1,
0.6821733, -0.6034225, 1.766929, 0, 0, 0, 1, 1,
0.6848575, -0.6131452, 5.052287, 0, 0, 0, 1, 1,
0.6857331, 0.3682196, 0.7955669, 0, 0, 0, 1, 1,
0.6862153, 0.7033187, 1.755877, 0, 0, 0, 1, 1,
0.694441, 0.3458965, 1.945701, 0, 0, 0, 1, 1,
0.6974187, -0.01824532, 3.008996, 0, 0, 0, 1, 1,
0.6998826, -0.03355955, 3.099324, 0, 0, 0, 1, 1,
0.7017027, -0.2724218, 1.448773, 1, 1, 1, 1, 1,
0.707889, -0.1181435, 1.988766, 1, 1, 1, 1, 1,
0.7085797, 0.5214004, 1.298784, 1, 1, 1, 1, 1,
0.710129, 0.2808797, 1.255499, 1, 1, 1, 1, 1,
0.713102, -0.2076539, 2.147341, 1, 1, 1, 1, 1,
0.7165124, -1.669054, 3.112586, 1, 1, 1, 1, 1,
0.7170444, 0.4818056, 0.3977985, 1, 1, 1, 1, 1,
0.7235493, 0.6108398, 1.233162, 1, 1, 1, 1, 1,
0.7242527, -0.6977972, 3.472646, 1, 1, 1, 1, 1,
0.7248448, -0.2732893, 3.533003, 1, 1, 1, 1, 1,
0.7252065, 0.3664615, 2.893752, 1, 1, 1, 1, 1,
0.7260901, 0.0002486216, 0.9973927, 1, 1, 1, 1, 1,
0.7272903, -0.4081751, 2.403413, 1, 1, 1, 1, 1,
0.7278231, 0.3417837, 0.7562251, 1, 1, 1, 1, 1,
0.7278299, -0.3510299, 1.070264, 1, 1, 1, 1, 1,
0.7297783, 0.6002221, 2.661117, 0, 0, 1, 1, 1,
0.7337084, 1.496728, 0.01993784, 1, 0, 0, 1, 1,
0.7338343, -0.668614, 2.463177, 1, 0, 0, 1, 1,
0.7344263, 0.8709697, -0.0801187, 1, 0, 0, 1, 1,
0.7404978, -0.05164838, 1.780706, 1, 0, 0, 1, 1,
0.7408751, -0.5653564, 2.818885, 1, 0, 0, 1, 1,
0.7434546, 0.02936622, 0.7043079, 0, 0, 0, 1, 1,
0.747647, -2.732967, 1.496923, 0, 0, 0, 1, 1,
0.7484144, 1.626156, -2.343137, 0, 0, 0, 1, 1,
0.7507241, 1.578243, -0.8049959, 0, 0, 0, 1, 1,
0.7553334, 0.6626139, 2.898114, 0, 0, 0, 1, 1,
0.7689114, 1.794151, 1.454525, 0, 0, 0, 1, 1,
0.7694575, -0.6249967, 1.750059, 0, 0, 0, 1, 1,
0.772407, -0.8539052, 2.807167, 1, 1, 1, 1, 1,
0.7727225, -0.6268032, 0.5044433, 1, 1, 1, 1, 1,
0.7785742, 0.3877081, 0.5762509, 1, 1, 1, 1, 1,
0.7850637, 0.6601362, 0.2486385, 1, 1, 1, 1, 1,
0.7934605, -1.676663, 1.061267, 1, 1, 1, 1, 1,
0.7977253, 1.513134, -0.2805442, 1, 1, 1, 1, 1,
0.7988409, 2.296346, 0.2477816, 1, 1, 1, 1, 1,
0.8065159, 0.02372029, 0.6720569, 1, 1, 1, 1, 1,
0.8097954, -0.1908633, 1.347425, 1, 1, 1, 1, 1,
0.8103027, -1.61406, 2.101825, 1, 1, 1, 1, 1,
0.8125181, -0.3328818, 2.793834, 1, 1, 1, 1, 1,
0.8149674, 1.264081, -0.131551, 1, 1, 1, 1, 1,
0.8168169, 0.1735003, 2.421667, 1, 1, 1, 1, 1,
0.8194861, 1.305298, -0.03902742, 1, 1, 1, 1, 1,
0.8203876, 0.3974366, 0.6567191, 1, 1, 1, 1, 1,
0.8237601, -0.2091152, 2.706938, 0, 0, 1, 1, 1,
0.8245845, 0.5780944, 0.99189, 1, 0, 0, 1, 1,
0.8273129, -1.005623, 1.127764, 1, 0, 0, 1, 1,
0.8275813, -0.6959437, 1.022287, 1, 0, 0, 1, 1,
0.8282593, -0.1716207, 0.3340878, 1, 0, 0, 1, 1,
0.8298236, -0.4841628, 3.486865, 1, 0, 0, 1, 1,
0.8310376, 1.674091, 0.4701747, 0, 0, 0, 1, 1,
0.8347681, 0.5531631, 0.6785312, 0, 0, 0, 1, 1,
0.8373817, 1.579995, -1.156683, 0, 0, 0, 1, 1,
0.8377702, 0.323785, 0.237628, 0, 0, 0, 1, 1,
0.843551, -0.6722981, 0.6071194, 0, 0, 0, 1, 1,
0.8458517, -0.6773455, 2.474938, 0, 0, 0, 1, 1,
0.8472299, -0.07474043, 1.343244, 0, 0, 0, 1, 1,
0.8507312, -0.542808, 2.495662, 1, 1, 1, 1, 1,
0.8516582, 2.057403, 0.862501, 1, 1, 1, 1, 1,
0.8532184, -0.4632905, 2.336335, 1, 1, 1, 1, 1,
0.8542641, 0.554893, 2.14262, 1, 1, 1, 1, 1,
0.8571834, 1.171348, 1.877941, 1, 1, 1, 1, 1,
0.8606444, 0.2349606, 0.008417526, 1, 1, 1, 1, 1,
0.8648455, 0.04955322, 0.9078377, 1, 1, 1, 1, 1,
0.8682085, -0.09933765, 1.856737, 1, 1, 1, 1, 1,
0.8704397, 0.9142311, 2.271687, 1, 1, 1, 1, 1,
0.8786962, -0.9137383, 3.062745, 1, 1, 1, 1, 1,
0.8787575, -0.04933004, 1.421328, 1, 1, 1, 1, 1,
0.8793455, -0.5251683, 1.879912, 1, 1, 1, 1, 1,
0.8811827, -0.1764483, 0.8984705, 1, 1, 1, 1, 1,
0.8840635, -0.08709418, 0.3896528, 1, 1, 1, 1, 1,
0.8906891, 0.06302971, 1.671461, 1, 1, 1, 1, 1,
0.8919623, -0.08429195, 3.147873, 0, 0, 1, 1, 1,
0.896514, -0.9636128, 3.816545, 1, 0, 0, 1, 1,
0.8969222, 0.1319067, -0.1917819, 1, 0, 0, 1, 1,
0.8987059, 0.1156645, 1.848635, 1, 0, 0, 1, 1,
0.8987634, 0.9941321, 1.228438, 1, 0, 0, 1, 1,
0.9123948, 0.08154988, 2.017865, 1, 0, 0, 1, 1,
0.9132057, -0.8817667, 2.751375, 0, 0, 0, 1, 1,
0.9154714, 0.4234251, 1.60878, 0, 0, 0, 1, 1,
0.9176586, -0.05607675, 1.893368, 0, 0, 0, 1, 1,
0.9247386, 0.8933114, 0.8871148, 0, 0, 0, 1, 1,
0.9247749, -0.4455386, 1.558739, 0, 0, 0, 1, 1,
0.9259177, 1.22302, 2.437795, 0, 0, 0, 1, 1,
0.9294327, -2.663604, 4.094414, 0, 0, 0, 1, 1,
0.9304782, 0.4675472, 0.3640355, 1, 1, 1, 1, 1,
0.9315634, 1.048825, 0.3546791, 1, 1, 1, 1, 1,
0.9339051, -0.03442484, 1.983382, 1, 1, 1, 1, 1,
0.9366169, -0.5137857, 2.160296, 1, 1, 1, 1, 1,
0.942395, -0.9028144, 3.093163, 1, 1, 1, 1, 1,
0.9467542, 0.738829, 1.337074, 1, 1, 1, 1, 1,
0.9511691, -0.219961, 0.2919806, 1, 1, 1, 1, 1,
0.9615532, -0.3716109, 3.584539, 1, 1, 1, 1, 1,
0.9621204, -1.01251, 2.913974, 1, 1, 1, 1, 1,
0.9633446, 1.155306, -0.3205853, 1, 1, 1, 1, 1,
0.9647167, 0.6128469, 2.296129, 1, 1, 1, 1, 1,
0.9648578, 1.051123, 2.135063, 1, 1, 1, 1, 1,
0.9654753, -0.7218159, 1.75194, 1, 1, 1, 1, 1,
0.9675121, 0.8325166, -0.0787893, 1, 1, 1, 1, 1,
0.9738238, -0.5515716, 2.466064, 1, 1, 1, 1, 1,
0.9797263, -0.4949945, 1.907582, 0, 0, 1, 1, 1,
0.9811841, 1.634484, 0.1744216, 1, 0, 0, 1, 1,
0.9834087, 0.05715675, 1.883119, 1, 0, 0, 1, 1,
0.9851631, -0.2629571, -0.02498771, 1, 0, 0, 1, 1,
0.9944205, 1.102701, -0.7392298, 1, 0, 0, 1, 1,
0.9988802, -0.5414822, 1.835001, 1, 0, 0, 1, 1,
0.9993658, 0.1278826, 3.53029, 0, 0, 0, 1, 1,
1.006154, -1.486829, 3.09725, 0, 0, 0, 1, 1,
1.009699, -1.86228, 4.312569, 0, 0, 0, 1, 1,
1.028187, 0.8931882, 3.28549, 0, 0, 0, 1, 1,
1.030351, -0.6597108, 3.853199, 0, 0, 0, 1, 1,
1.030578, -0.7413685, 3.548808, 0, 0, 0, 1, 1,
1.036502, 1.075135, 0.4610521, 0, 0, 0, 1, 1,
1.03835, 2.188306, 0.7722487, 1, 1, 1, 1, 1,
1.040504, 0.6834685, 3.162999, 1, 1, 1, 1, 1,
1.049006, -1.37476, 2.912592, 1, 1, 1, 1, 1,
1.05225, -1.418322, 3.896608, 1, 1, 1, 1, 1,
1.060498, 1.591924, 0.6863741, 1, 1, 1, 1, 1,
1.062989, 0.3440795, 2.941013, 1, 1, 1, 1, 1,
1.066402, -1.106948, 2.863372, 1, 1, 1, 1, 1,
1.075405, -1.395952, 3.980175, 1, 1, 1, 1, 1,
1.078284, 1.011562, 1.146368, 1, 1, 1, 1, 1,
1.080634, 1.175796, 0.36023, 1, 1, 1, 1, 1,
1.082538, -0.639654, 1.388664, 1, 1, 1, 1, 1,
1.090429, -0.2994379, 1.628526, 1, 1, 1, 1, 1,
1.091339, -0.615396, 0.841658, 1, 1, 1, 1, 1,
1.093969, -1.011766, 1.528484, 1, 1, 1, 1, 1,
1.107571, 0.1099756, 0.786463, 1, 1, 1, 1, 1,
1.107635, 0.389558, 1.763912, 0, 0, 1, 1, 1,
1.108415, -0.8663318, 2.296088, 1, 0, 0, 1, 1,
1.110874, -1.323357, 2.716288, 1, 0, 0, 1, 1,
1.116701, -0.09628545, 2.454946, 1, 0, 0, 1, 1,
1.122588, -0.7309313, 3.769794, 1, 0, 0, 1, 1,
1.127601, -0.324133, 0.7974346, 1, 0, 0, 1, 1,
1.134476, -1.648438, 3.895873, 0, 0, 0, 1, 1,
1.135556, 0.3115161, 2.408191, 0, 0, 0, 1, 1,
1.136811, -0.3461647, 2.035685, 0, 0, 0, 1, 1,
1.148777, 0.2004914, 2.49661, 0, 0, 0, 1, 1,
1.163963, 1.428885, 2.14953, 0, 0, 0, 1, 1,
1.17554, 0.2035557, 0.4911028, 0, 0, 0, 1, 1,
1.192759, -0.7875466, 0.2739037, 0, 0, 0, 1, 1,
1.19576, 0.07712948, 2.531685, 1, 1, 1, 1, 1,
1.202058, 1.497374, 1.384382, 1, 1, 1, 1, 1,
1.204359, -0.5447359, 2.775974, 1, 1, 1, 1, 1,
1.204978, 0.5751197, 1.50614, 1, 1, 1, 1, 1,
1.208767, 0.1653644, 2.287097, 1, 1, 1, 1, 1,
1.211406, -2.069829, 0.9156212, 1, 1, 1, 1, 1,
1.217015, -0.9237654, 3.333556, 1, 1, 1, 1, 1,
1.218626, -0.003345401, 2.874613, 1, 1, 1, 1, 1,
1.226886, -1.954032, 2.858709, 1, 1, 1, 1, 1,
1.234295, -0.5808637, 3.504628, 1, 1, 1, 1, 1,
1.240478, 1.246544, -0.5386224, 1, 1, 1, 1, 1,
1.248803, 0.6615804, 1.502353, 1, 1, 1, 1, 1,
1.252534, 1.434524, -0.144821, 1, 1, 1, 1, 1,
1.257838, 0.5677748, 0.04276657, 1, 1, 1, 1, 1,
1.25827, 0.06582698, 2.825562, 1, 1, 1, 1, 1,
1.261576, -0.6848393, 2.06902, 0, 0, 1, 1, 1,
1.276913, -0.5423427, 2.73791, 1, 0, 0, 1, 1,
1.277389, -0.4357699, 2.64336, 1, 0, 0, 1, 1,
1.2809, 0.5704518, 1.837478, 1, 0, 0, 1, 1,
1.286194, 0.3965442, 0.7148471, 1, 0, 0, 1, 1,
1.293044, -0.3236975, 1.984312, 1, 0, 0, 1, 1,
1.295891, -0.1818344, 1.998202, 0, 0, 0, 1, 1,
1.29599, -0.148921, 1.856536, 0, 0, 0, 1, 1,
1.299331, -0.619581, 3.841241, 0, 0, 0, 1, 1,
1.299713, -1.371277, 4.487, 0, 0, 0, 1, 1,
1.29985, 0.2300965, 1.887835, 0, 0, 0, 1, 1,
1.301136, 0.05997779, 1.513494, 0, 0, 0, 1, 1,
1.302402, 0.7348108, 1.406818, 0, 0, 0, 1, 1,
1.315385, -0.03546529, 3.619906, 1, 1, 1, 1, 1,
1.349775, 0.5766722, 2.52839, 1, 1, 1, 1, 1,
1.370072, 0.6212148, 0.7452632, 1, 1, 1, 1, 1,
1.389522, 1.768376, 1.062003, 1, 1, 1, 1, 1,
1.395163, 1.876135, 1.426113, 1, 1, 1, 1, 1,
1.397374, 1.803726, 0.6575212, 1, 1, 1, 1, 1,
1.400338, 1.006568, 1.580394, 1, 1, 1, 1, 1,
1.400428, 0.03893877, 2.800174, 1, 1, 1, 1, 1,
1.408143, -0.7812399, 2.502644, 1, 1, 1, 1, 1,
1.427591, -1.342906, 2.275528, 1, 1, 1, 1, 1,
1.433678, -1.461102, 0.1048837, 1, 1, 1, 1, 1,
1.438219, 1.922654, 1.364802, 1, 1, 1, 1, 1,
1.440037, -1.703432, 2.025724, 1, 1, 1, 1, 1,
1.446205, 0.4748098, 0.7944361, 1, 1, 1, 1, 1,
1.461396, 0.7714799, -0.9517164, 1, 1, 1, 1, 1,
1.462039, 0.1230334, 3.688344, 0, 0, 1, 1, 1,
1.463111, -0.4126421, 0.96304, 1, 0, 0, 1, 1,
1.472395, 0.5110039, 1.093549, 1, 0, 0, 1, 1,
1.486368, -1.174933, 1.641071, 1, 0, 0, 1, 1,
1.489828, 0.1514322, 1.970645, 1, 0, 0, 1, 1,
1.496561, -0.8368112, 2.453278, 1, 0, 0, 1, 1,
1.503171, -0.08191525, 1.01787, 0, 0, 0, 1, 1,
1.506578, -0.2171022, 0.9149735, 0, 0, 0, 1, 1,
1.508405, -0.9409961, 3.364378, 0, 0, 0, 1, 1,
1.50911, 0.1072376, 0.2819119, 0, 0, 0, 1, 1,
1.520036, -0.5304122, 1.789586, 0, 0, 0, 1, 1,
1.525658, 1.407408, -0.4044844, 0, 0, 0, 1, 1,
1.526862, 0.9671443, 1.552649, 0, 0, 0, 1, 1,
1.535182, -1.124817, 0.412713, 1, 1, 1, 1, 1,
1.542158, 0.937784, 2.1142, 1, 1, 1, 1, 1,
1.565181, 1.298284, 0.9676961, 1, 1, 1, 1, 1,
1.56618, -0.7657464, 1.543772, 1, 1, 1, 1, 1,
1.570645, 0.7251824, 0.8159795, 1, 1, 1, 1, 1,
1.576353, 1.636167, 1.153126, 1, 1, 1, 1, 1,
1.581939, 0.7343808, 2.184323, 1, 1, 1, 1, 1,
1.594323, 0.8651108, 1.280147, 1, 1, 1, 1, 1,
1.595436, -1.627222, 4.354618, 1, 1, 1, 1, 1,
1.601622, 0.9390036, 0.6564365, 1, 1, 1, 1, 1,
1.602799, 0.6198007, 1.557215, 1, 1, 1, 1, 1,
1.610379, -0.817394, 0.7951235, 1, 1, 1, 1, 1,
1.641849, -0.2691604, 2.401621, 1, 1, 1, 1, 1,
1.645663, -0.6743985, 1.414016, 1, 1, 1, 1, 1,
1.659797, -0.04077858, 2.802684, 1, 1, 1, 1, 1,
1.695637, -0.4133697, 1.005031, 0, 0, 1, 1, 1,
1.700271, -0.5154552, 2.035611, 1, 0, 0, 1, 1,
1.705735, -0.5882023, 3.329703, 1, 0, 0, 1, 1,
1.717906, -0.2370991, 2.096733, 1, 0, 0, 1, 1,
1.733277, -0.6608292, 2.01306, 1, 0, 0, 1, 1,
1.741215, 0.1351044, 1.790441, 1, 0, 0, 1, 1,
1.749846, 1.145516, -0.790104, 0, 0, 0, 1, 1,
1.764812, -1.616344, 2.540336, 0, 0, 0, 1, 1,
1.772298, 0.03762323, -0.2481382, 0, 0, 0, 1, 1,
1.779739, -1.163703, 3.872037, 0, 0, 0, 1, 1,
1.801303, -1.484868, 1.719464, 0, 0, 0, 1, 1,
1.809672, -0.09413308, 1.624991, 0, 0, 0, 1, 1,
1.816743, 1.184514, 0.889787, 0, 0, 0, 1, 1,
1.833769, -0.9428362, 2.17027, 1, 1, 1, 1, 1,
1.870871, 2.212069, 0.3309409, 1, 1, 1, 1, 1,
1.881974, 1.972935, 1.12596, 1, 1, 1, 1, 1,
1.883989, 0.5137805, 1.28579, 1, 1, 1, 1, 1,
1.888541, -0.3916435, 0.5685968, 1, 1, 1, 1, 1,
1.902091, 1.114593, 1.239321, 1, 1, 1, 1, 1,
1.923014, -1.309196, 2.384416, 1, 1, 1, 1, 1,
1.929642, 0.3050788, 1.343279, 1, 1, 1, 1, 1,
1.936651, 0.3503361, 1.685981, 1, 1, 1, 1, 1,
1.957157, 0.622907, 0.09286993, 1, 1, 1, 1, 1,
1.959102, -0.1600879, 2.739916, 1, 1, 1, 1, 1,
2.021037, 1.665789, -1.28232, 1, 1, 1, 1, 1,
2.031424, 0.7197006, 2.165417, 1, 1, 1, 1, 1,
2.059969, 0.254616, 0.4606576, 1, 1, 1, 1, 1,
2.104708, 0.6809588, 1.896187, 1, 1, 1, 1, 1,
2.126267, -0.8997101, 2.479283, 0, 0, 1, 1, 1,
2.127983, 1.876972, 0.4170838, 1, 0, 0, 1, 1,
2.149683, -0.1074657, 3.031526, 1, 0, 0, 1, 1,
2.151622, -0.6390476, 0.5961043, 1, 0, 0, 1, 1,
2.165236, -0.4848286, 1.91289, 1, 0, 0, 1, 1,
2.284933, 0.231387, 1.854528, 1, 0, 0, 1, 1,
2.350861, 1.406114, 1.807699, 0, 0, 0, 1, 1,
2.361223, -0.6995006, 1.782448, 0, 0, 0, 1, 1,
2.420939, -0.7279175, 1.281117, 0, 0, 0, 1, 1,
2.455115, -1.078001, 3.05125, 0, 0, 0, 1, 1,
2.462689, 0.6671836, 0.8645006, 0, 0, 0, 1, 1,
2.470811, 0.7741492, 0.6393217, 0, 0, 0, 1, 1,
2.471511, 1.756068, 1.573586, 0, 0, 0, 1, 1,
2.57688, -0.1356425, 1.502898, 1, 1, 1, 1, 1,
2.654568, 0.7681773, 1.07812, 1, 1, 1, 1, 1,
2.670585, -0.8003502, 1.311427, 1, 1, 1, 1, 1,
2.818323, 1.179157, 0.9968697, 1, 1, 1, 1, 1,
2.85956, -0.4711455, 1.623804, 1, 1, 1, 1, 1,
3.017721, -0.1495461, 2.69808, 1, 1, 1, 1, 1,
3.239253, 0.6647635, 1.707567, 1, 1, 1, 1, 1
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
var radius = 9.742495;
var distance = 34.2201;
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
mvMatrix.translate( 0.1780729, 0.2704972, -0.1932428 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2201);
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
