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
-3.8866, 1.108545, -1.906118, 1, 0, 0, 1,
-3.304558, -0.8884257, -1.545685, 1, 0.007843138, 0, 1,
-3.207001, -0.5371262, -0.8347681, 1, 0.01176471, 0, 1,
-3.157166, -0.8187901, -0.2927969, 1, 0.01960784, 0, 1,
-3.062708, 1.323973, 0.08106334, 1, 0.02352941, 0, 1,
-2.916084, -0.3422666, -2.195693, 1, 0.03137255, 0, 1,
-2.708543, -0.4675568, -1.210358, 1, 0.03529412, 0, 1,
-2.702761, -1.045507, -3.347255, 1, 0.04313726, 0, 1,
-2.64424, 1.459013, -2.388297, 1, 0.04705882, 0, 1,
-2.530197, 0.3332313, -2.083936, 1, 0.05490196, 0, 1,
-2.528249, -1.758005, -2.471987, 1, 0.05882353, 0, 1,
-2.468997, 1.714184, -1.547629, 1, 0.06666667, 0, 1,
-2.378997, -1.297977, -2.069706, 1, 0.07058824, 0, 1,
-2.343062, 0.840516, -4.282881, 1, 0.07843138, 0, 1,
-2.210079, 1.606001, -0.6340443, 1, 0.08235294, 0, 1,
-2.164412, 0.2413046, -1.770914, 1, 0.09019608, 0, 1,
-2.161254, 1.635677, -0.9180784, 1, 0.09411765, 0, 1,
-2.140093, -1.685747, -2.714037, 1, 0.1019608, 0, 1,
-2.129907, 1.213025, -0.2102057, 1, 0.1098039, 0, 1,
-2.125288, 1.084293, -2.239054, 1, 0.1137255, 0, 1,
-2.106299, 1.675011, -1.354419, 1, 0.1215686, 0, 1,
-2.089665, -0.5161216, -2.204663, 1, 0.1254902, 0, 1,
-2.022952, -1.302002, -1.941355, 1, 0.1333333, 0, 1,
-2.018858, 1.471411, -1.872873, 1, 0.1372549, 0, 1,
-1.980028, -0.2743639, -1.18073, 1, 0.145098, 0, 1,
-1.966852, 0.9831474, -0.4118434, 1, 0.1490196, 0, 1,
-1.935463, 0.02568725, -1.898399, 1, 0.1568628, 0, 1,
-1.932724, 0.4418157, -2.168677, 1, 0.1607843, 0, 1,
-1.914223, -1.675505, -2.269018, 1, 0.1686275, 0, 1,
-1.901404, 0.3431793, -1.566977, 1, 0.172549, 0, 1,
-1.885713, 0.365026, -2.005366, 1, 0.1803922, 0, 1,
-1.885553, 1.327748, 0.8228253, 1, 0.1843137, 0, 1,
-1.882603, -0.1208962, -1.989948, 1, 0.1921569, 0, 1,
-1.88196, -0.07467892, -1.543907, 1, 0.1960784, 0, 1,
-1.880136, -1.308034, -2.531896, 1, 0.2039216, 0, 1,
-1.871443, -1.233423, -2.377053, 1, 0.2117647, 0, 1,
-1.87059, -0.2666254, -0.3247004, 1, 0.2156863, 0, 1,
-1.862229, 0.2246103, -0.1639606, 1, 0.2235294, 0, 1,
-1.842892, 0.6878789, -1.238906, 1, 0.227451, 0, 1,
-1.822333, 0.3162153, -0.9918063, 1, 0.2352941, 0, 1,
-1.811405, -0.06437099, -1.32147, 1, 0.2392157, 0, 1,
-1.803688, -1.001711, -2.991293, 1, 0.2470588, 0, 1,
-1.794214, -0.9903702, -3.067693, 1, 0.2509804, 0, 1,
-1.782897, -1.607435, -2.221353, 1, 0.2588235, 0, 1,
-1.77116, -1.690178, -1.235958, 1, 0.2627451, 0, 1,
-1.760429, -0.5475479, -2.893626, 1, 0.2705882, 0, 1,
-1.759691, -0.177752, -4.244768, 1, 0.2745098, 0, 1,
-1.728325, 0.447443, -2.349147, 1, 0.282353, 0, 1,
-1.695903, -0.4284865, -1.906838, 1, 0.2862745, 0, 1,
-1.69247, -0.5165262, -2.039387, 1, 0.2941177, 0, 1,
-1.687586, -0.4180402, -0.7281943, 1, 0.3019608, 0, 1,
-1.672144, 1.102359, -0.7696189, 1, 0.3058824, 0, 1,
-1.668588, -1.117923, -3.348801, 1, 0.3137255, 0, 1,
-1.667432, 0.4978991, -0.7293359, 1, 0.3176471, 0, 1,
-1.65697, -0.6712065, -3.087675, 1, 0.3254902, 0, 1,
-1.652624, 0.6799908, 0.3610052, 1, 0.3294118, 0, 1,
-1.643123, -1.19505, -4.563644, 1, 0.3372549, 0, 1,
-1.632734, -0.3497536, -2.719686, 1, 0.3411765, 0, 1,
-1.614914, 0.5547552, -1.688683, 1, 0.3490196, 0, 1,
-1.611064, -2.579359, -4.043865, 1, 0.3529412, 0, 1,
-1.605834, -1.033486, -2.790837, 1, 0.3607843, 0, 1,
-1.601989, 0.7692208, 0.8372889, 1, 0.3647059, 0, 1,
-1.587865, -0.3277692, -2.022276, 1, 0.372549, 0, 1,
-1.586894, 1.570384, -1.410436, 1, 0.3764706, 0, 1,
-1.584692, 0.3233014, -0.6859983, 1, 0.3843137, 0, 1,
-1.578268, -0.9724205, -3.716409, 1, 0.3882353, 0, 1,
-1.563735, 0.1060543, -1.30804, 1, 0.3960784, 0, 1,
-1.551933, 0.4589889, -1.835247, 1, 0.4039216, 0, 1,
-1.542365, -0.5848261, -1.810376, 1, 0.4078431, 0, 1,
-1.538948, 0.5513839, 0.1829821, 1, 0.4156863, 0, 1,
-1.534251, -1.528736, -1.68273, 1, 0.4196078, 0, 1,
-1.524195, -1.227251, -1.711429, 1, 0.427451, 0, 1,
-1.52387, -1.643632, -0.8676747, 1, 0.4313726, 0, 1,
-1.516629, -1.795491, -2.618734, 1, 0.4392157, 0, 1,
-1.503711, 0.2437249, -2.294543, 1, 0.4431373, 0, 1,
-1.502776, -2.892176, -2.910386, 1, 0.4509804, 0, 1,
-1.498219, 0.1301322, -1.74945, 1, 0.454902, 0, 1,
-1.497512, 0.1504356, -1.661298, 1, 0.4627451, 0, 1,
-1.457097, -0.6463763, -2.543306, 1, 0.4666667, 0, 1,
-1.447564, -0.2925414, -1.513045, 1, 0.4745098, 0, 1,
-1.443383, 0.1825664, -1.939346, 1, 0.4784314, 0, 1,
-1.443194, 1.059706, 0.1426397, 1, 0.4862745, 0, 1,
-1.442312, 1.300649, -2.320343, 1, 0.4901961, 0, 1,
-1.426559, 0.3100511, -0.6210288, 1, 0.4980392, 0, 1,
-1.418507, -0.4081035, -1.792613, 1, 0.5058824, 0, 1,
-1.413177, -0.08080981, -3.529089, 1, 0.509804, 0, 1,
-1.40971, -0.5133966, -1.185558, 1, 0.5176471, 0, 1,
-1.409547, 0.5743747, -1.292392, 1, 0.5215687, 0, 1,
-1.403423, 0.6949138, -0.8291363, 1, 0.5294118, 0, 1,
-1.403314, -0.4688581, -1.540581, 1, 0.5333334, 0, 1,
-1.396944, 0.5555286, 0.08490652, 1, 0.5411765, 0, 1,
-1.385537, 1.470431, -1.735368, 1, 0.5450981, 0, 1,
-1.38429, 0.7959197, -1.049366, 1, 0.5529412, 0, 1,
-1.381736, -0.6110319, -1.731628, 1, 0.5568628, 0, 1,
-1.3795, 0.9017638, -1.124871, 1, 0.5647059, 0, 1,
-1.358354, 1.349119, -1.854453, 1, 0.5686275, 0, 1,
-1.357159, 0.825799, -1.052323, 1, 0.5764706, 0, 1,
-1.348434, -0.9271439, -3.353537, 1, 0.5803922, 0, 1,
-1.347625, -1.659668, -2.770985, 1, 0.5882353, 0, 1,
-1.344806, -2.164758, -2.659297, 1, 0.5921569, 0, 1,
-1.340574, -0.02147003, -3.115997, 1, 0.6, 0, 1,
-1.339848, -1.677166, -3.503383, 1, 0.6078432, 0, 1,
-1.338289, -0.8366634, -2.092026, 1, 0.6117647, 0, 1,
-1.320152, 1.453372, 0.01904894, 1, 0.6196079, 0, 1,
-1.314547, 0.09085675, -2.272576, 1, 0.6235294, 0, 1,
-1.311175, -2.093952, -2.022049, 1, 0.6313726, 0, 1,
-1.303617, 1.636902, -1.61872, 1, 0.6352941, 0, 1,
-1.302863, 1.523351, 1.497155, 1, 0.6431373, 0, 1,
-1.295588, 2.717942, 1.088582, 1, 0.6470588, 0, 1,
-1.289472, 1.552211, -1.105255, 1, 0.654902, 0, 1,
-1.283809, -0.4913996, -2.293249, 1, 0.6588235, 0, 1,
-1.282331, 1.523937, -1.757144, 1, 0.6666667, 0, 1,
-1.280768, 0.9809852, -0.7282326, 1, 0.6705883, 0, 1,
-1.274334, -0.3687794, -1.809631, 1, 0.6784314, 0, 1,
-1.253875, -1.522495, -1.240068, 1, 0.682353, 0, 1,
-1.240752, 0.07861311, -1.361356, 1, 0.6901961, 0, 1,
-1.238063, 0.3032849, 0.6988868, 1, 0.6941177, 0, 1,
-1.233267, -0.001907778, -1.927434, 1, 0.7019608, 0, 1,
-1.226279, -1.422126, -2.8685, 1, 0.7098039, 0, 1,
-1.220053, 1.139258, -1.044054, 1, 0.7137255, 0, 1,
-1.216675, 0.7522746, 1.168352, 1, 0.7215686, 0, 1,
-1.208972, 0.8482168, 0.7743858, 1, 0.7254902, 0, 1,
-1.197608, 0.2712455, -0.4570479, 1, 0.7333333, 0, 1,
-1.179829, -0.1383218, -0.9192546, 1, 0.7372549, 0, 1,
-1.17949, 0.1986434, -0.4109425, 1, 0.7450981, 0, 1,
-1.175985, -1.013244, -0.7273449, 1, 0.7490196, 0, 1,
-1.160096, 0.7683947, -0.01317813, 1, 0.7568628, 0, 1,
-1.159149, 0.4285678, -2.249941, 1, 0.7607843, 0, 1,
-1.158027, -1.189584, -1.638174, 1, 0.7686275, 0, 1,
-1.156274, -0.1577261, -4.252745, 1, 0.772549, 0, 1,
-1.153645, -0.5844648, -0.7841918, 1, 0.7803922, 0, 1,
-1.152797, 0.1204196, -1.133508, 1, 0.7843137, 0, 1,
-1.145861, 0.5479681, -0.09482379, 1, 0.7921569, 0, 1,
-1.141203, -0.3980248, -3.320733, 1, 0.7960784, 0, 1,
-1.130572, 0.959148, -1.340591, 1, 0.8039216, 0, 1,
-1.121518, -1.235615, -0.5163305, 1, 0.8117647, 0, 1,
-1.114206, -0.6454453, -1.715038, 1, 0.8156863, 0, 1,
-1.113891, 1.298297, -1.181525, 1, 0.8235294, 0, 1,
-1.10905, -0.9254407, -2.340101, 1, 0.827451, 0, 1,
-1.107324, 0.1971346, -2.189919, 1, 0.8352941, 0, 1,
-1.103446, 0.2290004, -2.059109, 1, 0.8392157, 0, 1,
-1.101959, -2.599287, -1.775984, 1, 0.8470588, 0, 1,
-1.099577, -0.02973437, -1.883365, 1, 0.8509804, 0, 1,
-1.096181, 0.8508295, 0.6360583, 1, 0.8588235, 0, 1,
-1.069154, 0.3325756, -1.433889, 1, 0.8627451, 0, 1,
-1.066099, 1.288898, 1.673182, 1, 0.8705882, 0, 1,
-1.062973, -1.04795, -2.290586, 1, 0.8745098, 0, 1,
-1.058948, -0.3014318, -3.547654, 1, 0.8823529, 0, 1,
-1.055599, -1.903111, -3.132203, 1, 0.8862745, 0, 1,
-1.052818, 0.4800345, -0.3764534, 1, 0.8941177, 0, 1,
-1.044231, 0.5939618, -0.8040609, 1, 0.8980392, 0, 1,
-1.043231, 1.230407, -2.52721, 1, 0.9058824, 0, 1,
-1.027302, 1.340692, 0.2497433, 1, 0.9137255, 0, 1,
-1.020889, -0.320891, -0.5358114, 1, 0.9176471, 0, 1,
-1.004698, 1.688504, -1.91327, 1, 0.9254902, 0, 1,
-0.9927341, 0.6097366, 1.069414, 1, 0.9294118, 0, 1,
-0.9919492, 1.045084, -1.694616, 1, 0.9372549, 0, 1,
-0.9914002, 0.9776909, -0.05328825, 1, 0.9411765, 0, 1,
-0.9888557, -2.316804, -4.016527, 1, 0.9490196, 0, 1,
-0.981082, -0.06867666, 0.4128461, 1, 0.9529412, 0, 1,
-0.9673491, -0.11922, -1.155316, 1, 0.9607843, 0, 1,
-0.9630405, 0.02678888, -0.6182453, 1, 0.9647059, 0, 1,
-0.9613714, -0.02217585, -1.881861, 1, 0.972549, 0, 1,
-0.9543139, -0.4801727, -3.311975, 1, 0.9764706, 0, 1,
-0.9487985, -1.423021, -0.674818, 1, 0.9843137, 0, 1,
-0.9482077, 0.4657936, -1.284618, 1, 0.9882353, 0, 1,
-0.9423891, -0.03804056, -2.208016, 1, 0.9960784, 0, 1,
-0.9420331, 0.7960585, -2.884574, 0.9960784, 1, 0, 1,
-0.9305372, -0.6210036, -2.477615, 0.9921569, 1, 0, 1,
-0.9264562, -0.3663689, -3.317925, 0.9843137, 1, 0, 1,
-0.9169427, 1.438066, 0.6280804, 0.9803922, 1, 0, 1,
-0.9154584, 1.587136, -1.920803, 0.972549, 1, 0, 1,
-0.9037054, -1.044815, -1.974102, 0.9686275, 1, 0, 1,
-0.8997448, -0.5976141, -3.025236, 0.9607843, 1, 0, 1,
-0.8959112, 0.8148058, -1.782898, 0.9568627, 1, 0, 1,
-0.8836206, -0.6424682, -1.268283, 0.9490196, 1, 0, 1,
-0.8759626, -2.39031, -3.072743, 0.945098, 1, 0, 1,
-0.8685719, -0.4665585, -1.57404, 0.9372549, 1, 0, 1,
-0.8676878, -1.166426, -2.551089, 0.9333333, 1, 0, 1,
-0.8662202, -0.05469159, 0.3471819, 0.9254902, 1, 0, 1,
-0.8660843, -1.826406, -2.019365, 0.9215686, 1, 0, 1,
-0.8656871, -0.3235486, -0.8454081, 0.9137255, 1, 0, 1,
-0.8638753, -0.7997364, -2.342015, 0.9098039, 1, 0, 1,
-0.8627969, 1.597146, 0.08871823, 0.9019608, 1, 0, 1,
-0.859235, -0.1805829, -1.921614, 0.8941177, 1, 0, 1,
-0.8401932, 1.198423, 0.2178923, 0.8901961, 1, 0, 1,
-0.8387342, 0.5541354, -0.0469192, 0.8823529, 1, 0, 1,
-0.8385049, -0.1330638, 0.04954449, 0.8784314, 1, 0, 1,
-0.8376435, -1.18806, -3.570927, 0.8705882, 1, 0, 1,
-0.8343058, -0.01084127, -2.692642, 0.8666667, 1, 0, 1,
-0.8305768, -0.5942702, -2.301048, 0.8588235, 1, 0, 1,
-0.8227612, -0.6635486, -3.055713, 0.854902, 1, 0, 1,
-0.8203151, -0.5220998, -2.293737, 0.8470588, 1, 0, 1,
-0.80986, 0.5943782, -0.1979783, 0.8431373, 1, 0, 1,
-0.8096071, 0.2948194, -1.748013, 0.8352941, 1, 0, 1,
-0.8060628, -0.3494663, -3.399194, 0.8313726, 1, 0, 1,
-0.8052496, 0.3937698, 0.1306141, 0.8235294, 1, 0, 1,
-0.8013104, 1.459417, 1.069104, 0.8196079, 1, 0, 1,
-0.7946223, -0.4330499, -1.960323, 0.8117647, 1, 0, 1,
-0.7937553, 1.93117, -1.080766, 0.8078431, 1, 0, 1,
-0.7934245, 1.000464, -0.4085068, 0.8, 1, 0, 1,
-0.7917429, 1.01761, 0.00507122, 0.7921569, 1, 0, 1,
-0.7859696, 0.9867073, 0.4814374, 0.7882353, 1, 0, 1,
-0.7818525, -1.167742, -3.041869, 0.7803922, 1, 0, 1,
-0.7717564, -0.6545581, -2.257888, 0.7764706, 1, 0, 1,
-0.7701691, 0.2891286, -1.266518, 0.7686275, 1, 0, 1,
-0.7691041, -2.480296, -3.508001, 0.7647059, 1, 0, 1,
-0.76802, -0.2974635, -1.648598, 0.7568628, 1, 0, 1,
-0.7624593, 1.219097, -0.7170736, 0.7529412, 1, 0, 1,
-0.7623244, 0.8066488, 0.1944128, 0.7450981, 1, 0, 1,
-0.7607633, -0.4892206, -2.802648, 0.7411765, 1, 0, 1,
-0.7593768, -0.8275198, -1.381633, 0.7333333, 1, 0, 1,
-0.7541386, -0.2933412, -2.530104, 0.7294118, 1, 0, 1,
-0.7517898, -1.209476, -2.266554, 0.7215686, 1, 0, 1,
-0.7493521, -0.0517607, -1.353295, 0.7176471, 1, 0, 1,
-0.7488165, -0.4709071, -1.677423, 0.7098039, 1, 0, 1,
-0.7479675, 0.2733871, -0.7367835, 0.7058824, 1, 0, 1,
-0.7457621, -0.7009639, -2.818094, 0.6980392, 1, 0, 1,
-0.7452915, 0.9831998, -0.197728, 0.6901961, 1, 0, 1,
-0.7444518, 1.238233, -0.3436448, 0.6862745, 1, 0, 1,
-0.7430714, 0.3325424, -1.001447, 0.6784314, 1, 0, 1,
-0.7297186, 0.6769732, 0.303721, 0.6745098, 1, 0, 1,
-0.7249568, -1.463963, -2.75856, 0.6666667, 1, 0, 1,
-0.7237372, -1.289685, -3.262805, 0.6627451, 1, 0, 1,
-0.7235145, 0.4515583, -0.1936465, 0.654902, 1, 0, 1,
-0.7226864, 1.355788, 0.4670493, 0.6509804, 1, 0, 1,
-0.722497, -1.681244, -2.167012, 0.6431373, 1, 0, 1,
-0.7086715, 2.227388, 1.019634, 0.6392157, 1, 0, 1,
-0.7067244, -0.3861057, -3.506917, 0.6313726, 1, 0, 1,
-0.7064179, 0.4789464, -0.5897906, 0.627451, 1, 0, 1,
-0.7058581, -0.9388731, -2.512715, 0.6196079, 1, 0, 1,
-0.7023258, -0.363927, -2.47671, 0.6156863, 1, 0, 1,
-0.7011997, 1.534027, 0.2726583, 0.6078432, 1, 0, 1,
-0.7001529, -1.459359, -1.335127, 0.6039216, 1, 0, 1,
-0.6991733, -0.01157175, -1.22393, 0.5960785, 1, 0, 1,
-0.6975603, 0.2146652, -1.275581, 0.5882353, 1, 0, 1,
-0.6912961, 1.506701, -0.1809969, 0.5843138, 1, 0, 1,
-0.6868722, -1.639049, -1.804515, 0.5764706, 1, 0, 1,
-0.6801254, -0.5981293, -4.042738, 0.572549, 1, 0, 1,
-0.6784423, 0.06886668, -0.7621234, 0.5647059, 1, 0, 1,
-0.6761787, 0.6890014, -0.3190161, 0.5607843, 1, 0, 1,
-0.6706281, 0.2691008, 0.8957534, 0.5529412, 1, 0, 1,
-0.6643676, 0.196801, -1.842227, 0.5490196, 1, 0, 1,
-0.6612122, -1.853003, -3.34398, 0.5411765, 1, 0, 1,
-0.6573051, -0.3755655, -2.209894, 0.5372549, 1, 0, 1,
-0.64882, 0.9370655, -0.9728761, 0.5294118, 1, 0, 1,
-0.6339771, -0.02748126, -1.75721, 0.5254902, 1, 0, 1,
-0.6298588, 0.5586065, -0.7372638, 0.5176471, 1, 0, 1,
-0.6293151, 0.1839829, -2.091425, 0.5137255, 1, 0, 1,
-0.6241725, -0.02949585, -1.377576, 0.5058824, 1, 0, 1,
-0.6175997, 1.570038, -0.6500352, 0.5019608, 1, 0, 1,
-0.61365, 0.5769386, -0.6128781, 0.4941176, 1, 0, 1,
-0.6104196, -0.9419013, -1.748286, 0.4862745, 1, 0, 1,
-0.6102976, -0.5543773, -2.227237, 0.4823529, 1, 0, 1,
-0.5995218, 1.680233, -1.414674, 0.4745098, 1, 0, 1,
-0.5934404, 1.282085, -2.031198, 0.4705882, 1, 0, 1,
-0.5929983, 0.2862063, -1.573923, 0.4627451, 1, 0, 1,
-0.588903, -2.764499, -3.267064, 0.4588235, 1, 0, 1,
-0.5881358, 1.518778, 0.8763354, 0.4509804, 1, 0, 1,
-0.5792582, -1.123928, -0.6966258, 0.4470588, 1, 0, 1,
-0.5740946, -0.2589376, -3.254044, 0.4392157, 1, 0, 1,
-0.5725819, 1.243384, 0.07286242, 0.4352941, 1, 0, 1,
-0.5705597, -0.07678274, -4.069857, 0.427451, 1, 0, 1,
-0.5593092, 0.5201728, -0.856191, 0.4235294, 1, 0, 1,
-0.558852, 0.6994177, -0.7613083, 0.4156863, 1, 0, 1,
-0.5553052, 0.5908231, -0.8513907, 0.4117647, 1, 0, 1,
-0.5551667, -0.7367846, -2.537089, 0.4039216, 1, 0, 1,
-0.5549995, 1.56453, -2.36927, 0.3960784, 1, 0, 1,
-0.5531454, -0.4742175, -3.743017, 0.3921569, 1, 0, 1,
-0.5531134, 0.415133, -2.00495, 0.3843137, 1, 0, 1,
-0.5470201, 1.854725, 0.6832924, 0.3803922, 1, 0, 1,
-0.5438034, 1.976642, -0.70479, 0.372549, 1, 0, 1,
-0.5434573, -1.034333, -2.661666, 0.3686275, 1, 0, 1,
-0.5419249, -1.293744, -1.531023, 0.3607843, 1, 0, 1,
-0.5357378, 0.6101244, -0.1937688, 0.3568628, 1, 0, 1,
-0.5337658, -0.3312443, -1.804762, 0.3490196, 1, 0, 1,
-0.5327599, -0.08606575, -0.3176908, 0.345098, 1, 0, 1,
-0.525095, -1.108553, -2.777175, 0.3372549, 1, 0, 1,
-0.5228879, -0.01963832, -3.588004, 0.3333333, 1, 0, 1,
-0.5212371, -0.448841, -2.710263, 0.3254902, 1, 0, 1,
-0.5200813, -0.4518041, -3.500741, 0.3215686, 1, 0, 1,
-0.5180812, -1.872638, -1.429956, 0.3137255, 1, 0, 1,
-0.5176226, 0.1656923, -1.897293, 0.3098039, 1, 0, 1,
-0.5148343, -1.799993, -3.77295, 0.3019608, 1, 0, 1,
-0.5113873, 0.320452, -1.783349, 0.2941177, 1, 0, 1,
-0.5086301, -0.6358572, -2.894624, 0.2901961, 1, 0, 1,
-0.5055702, 0.9653726, -0.1465554, 0.282353, 1, 0, 1,
-0.5053558, 0.06380968, -1.435865, 0.2784314, 1, 0, 1,
-0.504225, -0.7541612, -2.063711, 0.2705882, 1, 0, 1,
-0.5041317, 1.057854, 0.8164936, 0.2666667, 1, 0, 1,
-0.5022813, 1.77462, 0.184348, 0.2588235, 1, 0, 1,
-0.4992057, -0.2412414, -2.306632, 0.254902, 1, 0, 1,
-0.4976569, 0.4307897, 2.019112, 0.2470588, 1, 0, 1,
-0.4943596, -0.5210106, -2.392389, 0.2431373, 1, 0, 1,
-0.4943048, 0.2728123, 0.3352371, 0.2352941, 1, 0, 1,
-0.48976, -0.9926246, -2.24728, 0.2313726, 1, 0, 1,
-0.4879851, -0.1614194, -1.579257, 0.2235294, 1, 0, 1,
-0.4876013, -0.6263493, -1.953944, 0.2196078, 1, 0, 1,
-0.4750697, -1.171893, -3.479605, 0.2117647, 1, 0, 1,
-0.4726686, -1.59492, -3.558416, 0.2078431, 1, 0, 1,
-0.4720187, 1.439008, 0.6542168, 0.2, 1, 0, 1,
-0.4706759, -1.273372, -2.935023, 0.1921569, 1, 0, 1,
-0.4610717, -0.2663129, -0.4513053, 0.1882353, 1, 0, 1,
-0.4588447, -0.572892, -2.884465, 0.1803922, 1, 0, 1,
-0.4563143, -0.7282664, -2.643705, 0.1764706, 1, 0, 1,
-0.4562182, 1.117381, -1.341503, 0.1686275, 1, 0, 1,
-0.453305, -0.2865201, -2.595719, 0.1647059, 1, 0, 1,
-0.452693, 0.04471033, -2.825399, 0.1568628, 1, 0, 1,
-0.4511054, 0.09785706, -1.179068, 0.1529412, 1, 0, 1,
-0.4505011, -2.306346, -3.677102, 0.145098, 1, 0, 1,
-0.4500906, 1.411129, -2.457228, 0.1411765, 1, 0, 1,
-0.4458621, 0.1041488, -2.881582, 0.1333333, 1, 0, 1,
-0.4448729, 0.09408448, -0.8225206, 0.1294118, 1, 0, 1,
-0.441929, -0.6009862, -1.168743, 0.1215686, 1, 0, 1,
-0.4416716, -1.830355, -1.413827, 0.1176471, 1, 0, 1,
-0.439077, 0.0499416, -0.3914435, 0.1098039, 1, 0, 1,
-0.4343752, 0.7184079, -2.36956, 0.1058824, 1, 0, 1,
-0.4338892, -1.035971, -2.194237, 0.09803922, 1, 0, 1,
-0.4331805, -0.4844705, -0.907468, 0.09019608, 1, 0, 1,
-0.4292897, 1.464157, 1.131134, 0.08627451, 1, 0, 1,
-0.4268064, -0.3605628, -0.9121812, 0.07843138, 1, 0, 1,
-0.4262077, -1.751829, -3.438802, 0.07450981, 1, 0, 1,
-0.4253916, 0.1437818, -0.8590924, 0.06666667, 1, 0, 1,
-0.4247261, 2.167782, 1.187297, 0.0627451, 1, 0, 1,
-0.4240141, -0.2464147, -3.4269, 0.05490196, 1, 0, 1,
-0.4215833, -0.2376077, -2.213337, 0.05098039, 1, 0, 1,
-0.4196461, -0.1712941, 0.8708875, 0.04313726, 1, 0, 1,
-0.4187699, 1.573624, -1.130205, 0.03921569, 1, 0, 1,
-0.4158206, -0.2222077, -2.251251, 0.03137255, 1, 0, 1,
-0.4075677, -0.8024862, -2.60527, 0.02745098, 1, 0, 1,
-0.4060201, 0.6414351, -1.612858, 0.01960784, 1, 0, 1,
-0.4050312, 0.5089629, -0.3400744, 0.01568628, 1, 0, 1,
-0.4043712, 0.8795666, 0.4242524, 0.007843138, 1, 0, 1,
-0.4020947, -0.9157873, -2.919615, 0.003921569, 1, 0, 1,
-0.3938593, -0.6278341, -1.34889, 0, 1, 0.003921569, 1,
-0.3934835, -0.1444403, -2.501628, 0, 1, 0.01176471, 1,
-0.3931999, 0.05777703, -0.7864617, 0, 1, 0.01568628, 1,
-0.3928991, 0.2827829, -0.2375868, 0, 1, 0.02352941, 1,
-0.3860468, -1.178077, -3.430194, 0, 1, 0.02745098, 1,
-0.3841928, 1.780815, 1.969451, 0, 1, 0.03529412, 1,
-0.3777041, 1.353951, -0.6369548, 0, 1, 0.03921569, 1,
-0.3763826, 0.5437074, -0.4510255, 0, 1, 0.04705882, 1,
-0.3759144, 0.5793545, -1.709972, 0, 1, 0.05098039, 1,
-0.3745424, -0.4794641, -2.861686, 0, 1, 0.05882353, 1,
-0.3729942, -0.2634999, -2.737048, 0, 1, 0.0627451, 1,
-0.3695924, 0.183911, -1.542699, 0, 1, 0.07058824, 1,
-0.3688524, 0.2902629, -1.066839, 0, 1, 0.07450981, 1,
-0.3674105, 0.6925906, -2.131179, 0, 1, 0.08235294, 1,
-0.3588325, 1.113027, -2.904854, 0, 1, 0.08627451, 1,
-0.3583556, 0.3596878, -2.037805, 0, 1, 0.09411765, 1,
-0.3578768, -0.7242758, -3.073611, 0, 1, 0.1019608, 1,
-0.3574226, 1.67718, -0.3980265, 0, 1, 0.1058824, 1,
-0.3468918, 1.246527, -0.1534405, 0, 1, 0.1137255, 1,
-0.346459, -0.9509978, -1.798479, 0, 1, 0.1176471, 1,
-0.3424275, 0.6357433, -2.294118, 0, 1, 0.1254902, 1,
-0.3418336, 0.3636732, -2.208416, 0, 1, 0.1294118, 1,
-0.3397547, -0.7004406, -4.178911, 0, 1, 0.1372549, 1,
-0.33969, -3.38776, -3.646193, 0, 1, 0.1411765, 1,
-0.3294124, 0.0523279, -0.5190361, 0, 1, 0.1490196, 1,
-0.3285691, -0.3557473, -3.712469, 0, 1, 0.1529412, 1,
-0.3239472, -0.3687415, -3.68894, 0, 1, 0.1607843, 1,
-0.3238454, -0.5715641, -2.798746, 0, 1, 0.1647059, 1,
-0.3228904, -0.06309277, -1.633377, 0, 1, 0.172549, 1,
-0.3183095, 0.919245, -2.20726, 0, 1, 0.1764706, 1,
-0.3147809, -0.5957558, -0.9350343, 0, 1, 0.1843137, 1,
-0.3143895, 0.1003084, -2.225847, 0, 1, 0.1882353, 1,
-0.3062057, 0.4459839, 0.4286982, 0, 1, 0.1960784, 1,
-0.3021377, -1.298297, -6.482707, 0, 1, 0.2039216, 1,
-0.299416, -0.7463208, -3.810763, 0, 1, 0.2078431, 1,
-0.2976185, -1.202636, -2.697015, 0, 1, 0.2156863, 1,
-0.2906042, 0.06552939, -2.882254, 0, 1, 0.2196078, 1,
-0.2760925, -0.1363823, -2.539297, 0, 1, 0.227451, 1,
-0.2750677, 0.5808704, 0.977808, 0, 1, 0.2313726, 1,
-0.2740629, 0.5946829, -2.588794, 0, 1, 0.2392157, 1,
-0.2736863, 1.092413, -0.05116859, 0, 1, 0.2431373, 1,
-0.2732205, 1.173016, 0.5326895, 0, 1, 0.2509804, 1,
-0.2709063, -2.536446, -3.378011, 0, 1, 0.254902, 1,
-0.2684683, -0.3101438, -4.362955, 0, 1, 0.2627451, 1,
-0.265752, 0.9172183, 0.3975829, 0, 1, 0.2666667, 1,
-0.2641039, -0.02790656, -2.027418, 0, 1, 0.2745098, 1,
-0.2544113, -0.6582294, -3.504849, 0, 1, 0.2784314, 1,
-0.2520017, -1.016171, -3.214988, 0, 1, 0.2862745, 1,
-0.2510985, -0.2400122, -2.763376, 0, 1, 0.2901961, 1,
-0.2496027, 0.2258185, -1.116345, 0, 1, 0.2980392, 1,
-0.2436453, 0.8458694, -1.217797, 0, 1, 0.3058824, 1,
-0.2419264, -0.7080815, -2.971359, 0, 1, 0.3098039, 1,
-0.2367948, 0.5997542, -1.391858, 0, 1, 0.3176471, 1,
-0.2365634, -0.3261689, -3.202461, 0, 1, 0.3215686, 1,
-0.2333505, -0.5853005, -3.983362, 0, 1, 0.3294118, 1,
-0.2296724, -0.1190227, -2.075012, 0, 1, 0.3333333, 1,
-0.2296043, 0.01455513, -2.055354, 0, 1, 0.3411765, 1,
-0.2275033, 0.1956971, 0.02058804, 0, 1, 0.345098, 1,
-0.2229945, 0.8458003, -0.3307997, 0, 1, 0.3529412, 1,
-0.2196714, 0.496896, 0.672556, 0, 1, 0.3568628, 1,
-0.2150835, 1.588203, 0.9860916, 0, 1, 0.3647059, 1,
-0.2134247, 0.02296057, 0.5107756, 0, 1, 0.3686275, 1,
-0.2118045, -0.1131676, -3.333068, 0, 1, 0.3764706, 1,
-0.2099088, 0.8083017, 1.051458, 0, 1, 0.3803922, 1,
-0.2095619, -0.7926553, -2.172494, 0, 1, 0.3882353, 1,
-0.2075004, -1.444613, -2.969105, 0, 1, 0.3921569, 1,
-0.2042768, -0.269396, -1.536249, 0, 1, 0.4, 1,
-0.1978741, -0.4902634, -3.352754, 0, 1, 0.4078431, 1,
-0.1907154, -1.412304, -2.361268, 0, 1, 0.4117647, 1,
-0.1870331, -0.01418532, -2.28631, 0, 1, 0.4196078, 1,
-0.1808954, 0.171162, -1.525536, 0, 1, 0.4235294, 1,
-0.1696504, 0.09083907, -2.53919, 0, 1, 0.4313726, 1,
-0.1692619, -0.3130521, -1.920039, 0, 1, 0.4352941, 1,
-0.16676, -0.2879628, -1.476602, 0, 1, 0.4431373, 1,
-0.1568254, -1.619743, -3.545922, 0, 1, 0.4470588, 1,
-0.1532609, -1.822215, -4.530379, 0, 1, 0.454902, 1,
-0.1527049, -1.391659, -1.155127, 0, 1, 0.4588235, 1,
-0.1477186, 0.8828343, -2.407637, 0, 1, 0.4666667, 1,
-0.1448723, 1.370838, -0.99563, 0, 1, 0.4705882, 1,
-0.1412543, -0.1974445, -3.99018, 0, 1, 0.4784314, 1,
-0.1361655, 0.4110854, -0.8393122, 0, 1, 0.4823529, 1,
-0.1357271, 1.243375, -1.06558, 0, 1, 0.4901961, 1,
-0.1345327, -0.2609213, -1.511168, 0, 1, 0.4941176, 1,
-0.1337148, 0.4705952, -1.505786, 0, 1, 0.5019608, 1,
-0.1316508, -0.185632, -2.562402, 0, 1, 0.509804, 1,
-0.1281413, 0.07813638, -0.6398315, 0, 1, 0.5137255, 1,
-0.1270766, 0.7293427, -0.7580104, 0, 1, 0.5215687, 1,
-0.1254151, 1.030822, 0.03053936, 0, 1, 0.5254902, 1,
-0.1250024, 0.4063711, -0.006957843, 0, 1, 0.5333334, 1,
-0.1234492, 1.693854, -0.3118082, 0, 1, 0.5372549, 1,
-0.1229427, 1.701684, -0.5547675, 0, 1, 0.5450981, 1,
-0.1213784, 0.06570262, -1.14634, 0, 1, 0.5490196, 1,
-0.1213303, 1.563774, -0.1170619, 0, 1, 0.5568628, 1,
-0.1202886, -1.787536, -3.573009, 0, 1, 0.5607843, 1,
-0.1189016, -0.1742313, -1.846999, 0, 1, 0.5686275, 1,
-0.1171456, -0.6685324, -2.649852, 0, 1, 0.572549, 1,
-0.1165539, -1.323311, -2.459517, 0, 1, 0.5803922, 1,
-0.1157375, -0.4554776, -3.440174, 0, 1, 0.5843138, 1,
-0.1132991, -1.544245, -3.508794, 0, 1, 0.5921569, 1,
-0.1129847, -0.6716318, -3.31379, 0, 1, 0.5960785, 1,
-0.1121783, 0.6737176, -1.583782, 0, 1, 0.6039216, 1,
-0.1077856, 0.6896214, 0.6992018, 0, 1, 0.6117647, 1,
-0.1051201, -1.353179, -2.419986, 0, 1, 0.6156863, 1,
-0.0990826, -0.3723351, -3.317248, 0, 1, 0.6235294, 1,
-0.09255289, -0.1025452, -2.215943, 0, 1, 0.627451, 1,
-0.08714185, 1.029259, 0.9719818, 0, 1, 0.6352941, 1,
-0.08135618, -0.08655122, -3.228232, 0, 1, 0.6392157, 1,
-0.06811289, 1.738756, 0.9242531, 0, 1, 0.6470588, 1,
-0.06754234, -0.7687638, -2.196913, 0, 1, 0.6509804, 1,
-0.06553343, -1.299971, -3.554255, 0, 1, 0.6588235, 1,
-0.06531064, 1.563357, -0.6583656, 0, 1, 0.6627451, 1,
-0.06071832, -1.087657, -3.93712, 0, 1, 0.6705883, 1,
-0.06008305, -0.6946505, -3.163465, 0, 1, 0.6745098, 1,
-0.05913753, 0.7208449, 1.628837, 0, 1, 0.682353, 1,
-0.0552891, -1.1162, -3.269395, 0, 1, 0.6862745, 1,
-0.05372912, -1.193347, -2.225162, 0, 1, 0.6941177, 1,
-0.05253362, -0.7936856, -2.535598, 0, 1, 0.7019608, 1,
-0.04183619, -1.953808, -3.701363, 0, 1, 0.7058824, 1,
-0.04120721, 0.4514111, 0.7736838, 0, 1, 0.7137255, 1,
-0.0411618, -0.5522773, -4.182142, 0, 1, 0.7176471, 1,
-0.03955318, 2.073947, -1.457723, 0, 1, 0.7254902, 1,
-0.03926829, 0.03461026, 0.3825531, 0, 1, 0.7294118, 1,
-0.03926029, 1.555069, -1.277394, 0, 1, 0.7372549, 1,
-0.03722896, -0.4850763, -3.847146, 0, 1, 0.7411765, 1,
-0.02730058, 0.6086593, 0.9699509, 0, 1, 0.7490196, 1,
-0.02681807, 0.4104183, -2.190571, 0, 1, 0.7529412, 1,
-0.02435727, -0.002310726, -1.937498, 0, 1, 0.7607843, 1,
-0.02328201, 0.726926, 0.9881428, 0, 1, 0.7647059, 1,
-0.01741746, 0.1189552, -0.1980417, 0, 1, 0.772549, 1,
-0.01683126, 0.3450576, -0.9415815, 0, 1, 0.7764706, 1,
-0.01594495, -2.437174, -2.125623, 0, 1, 0.7843137, 1,
-0.01495742, 1.165001, -1.547872, 0, 1, 0.7882353, 1,
-0.01490902, 0.2871789, -0.6431642, 0, 1, 0.7960784, 1,
-0.01002614, 0.1123591, -0.3018818, 0, 1, 0.8039216, 1,
-0.004665176, -0.2893673, -4.126029, 0, 1, 0.8078431, 1,
0.0007742379, -0.4736226, 0.4902223, 0, 1, 0.8156863, 1,
0.00132321, -0.5194039, 3.732625, 0, 1, 0.8196079, 1,
0.001742168, -0.9025522, 3.867195, 0, 1, 0.827451, 1,
0.004302027, -0.313269, 1.836066, 0, 1, 0.8313726, 1,
0.0099407, -0.05681191, 3.007359, 0, 1, 0.8392157, 1,
0.01323644, 0.8323235, -0.1149905, 0, 1, 0.8431373, 1,
0.01799487, 2.099094, -0.9172803, 0, 1, 0.8509804, 1,
0.02051037, -1.260107, 2.599594, 0, 1, 0.854902, 1,
0.02445186, 0.3324077, -0.3989151, 0, 1, 0.8627451, 1,
0.02603457, -0.6293418, 2.713795, 0, 1, 0.8666667, 1,
0.02653374, 1.219988, 0.8557418, 0, 1, 0.8745098, 1,
0.03088184, -0.446923, 3.283936, 0, 1, 0.8784314, 1,
0.03119105, -0.5032606, 3.269448, 0, 1, 0.8862745, 1,
0.03314162, -1.651494, 2.128884, 0, 1, 0.8901961, 1,
0.03589781, 0.6422041, 1.632579, 0, 1, 0.8980392, 1,
0.04142305, -1.149341, 2.798745, 0, 1, 0.9058824, 1,
0.04340683, -0.3225322, 4.44273, 0, 1, 0.9098039, 1,
0.04500989, 0.1626954, 2.013851, 0, 1, 0.9176471, 1,
0.04504489, -0.4246924, 0.3103859, 0, 1, 0.9215686, 1,
0.04645845, 1.43931, -1.780012, 0, 1, 0.9294118, 1,
0.04648052, -0.8329298, 3.146229, 0, 1, 0.9333333, 1,
0.04800145, -0.7060354, 1.58191, 0, 1, 0.9411765, 1,
0.05106676, 1.820203, -0.1550673, 0, 1, 0.945098, 1,
0.0550989, 0.8202497, -0.5022034, 0, 1, 0.9529412, 1,
0.05525808, 0.7504768, -1.255254, 0, 1, 0.9568627, 1,
0.0558989, 0.02678389, -0.3290367, 0, 1, 0.9647059, 1,
0.0563648, -0.5339604, 3.532084, 0, 1, 0.9686275, 1,
0.06012819, 1.230513, 0.7374058, 0, 1, 0.9764706, 1,
0.06291091, 1.309319, 0.3346264, 0, 1, 0.9803922, 1,
0.0630113, -0.580737, 1.400297, 0, 1, 0.9882353, 1,
0.0630354, 0.2412341, -1.146774, 0, 1, 0.9921569, 1,
0.06377827, -0.1532735, 4.199825, 0, 1, 1, 1,
0.06455854, 0.08835407, 2.455683, 0, 0.9921569, 1, 1,
0.06645933, 0.8857561, 0.4468109, 0, 0.9882353, 1, 1,
0.06808806, -0.1592794, 2.846663, 0, 0.9803922, 1, 1,
0.07107239, -1.244718, 3.63211, 0, 0.9764706, 1, 1,
0.07121185, -0.6150934, 1.008417, 0, 0.9686275, 1, 1,
0.07336783, -2.146829, 2.69961, 0, 0.9647059, 1, 1,
0.0739495, 0.3772634, 0.5284291, 0, 0.9568627, 1, 1,
0.07541873, 0.55558, -0.8984652, 0, 0.9529412, 1, 1,
0.09104253, -0.05980559, 0.9213223, 0, 0.945098, 1, 1,
0.0911774, 0.3039972, -1.635413, 0, 0.9411765, 1, 1,
0.09221247, -0.22949, 3.48615, 0, 0.9333333, 1, 1,
0.09416874, 1.099415, 0.9313828, 0, 0.9294118, 1, 1,
0.09658982, -0.2199942, 1.722114, 0, 0.9215686, 1, 1,
0.09831588, 1.147524, -0.04030878, 0, 0.9176471, 1, 1,
0.09922758, 0.04341154, 1.418669, 0, 0.9098039, 1, 1,
0.09940624, 0.06721239, 0.681208, 0, 0.9058824, 1, 1,
0.103642, 1.084199, 1.985382, 0, 0.8980392, 1, 1,
0.1044072, -0.2906961, 2.411901, 0, 0.8901961, 1, 1,
0.1049847, -2.542293, 2.674317, 0, 0.8862745, 1, 1,
0.1063267, 0.2671687, 1.688322, 0, 0.8784314, 1, 1,
0.1156764, -0.5345702, 2.052806, 0, 0.8745098, 1, 1,
0.1184889, 0.01412951, 1.472565, 0, 0.8666667, 1, 1,
0.1233244, -0.3056022, 2.393959, 0, 0.8627451, 1, 1,
0.1267308, 0.8252676, -0.4958225, 0, 0.854902, 1, 1,
0.1280215, 0.3790087, -1.470457, 0, 0.8509804, 1, 1,
0.1281322, 1.323361, 0.4739935, 0, 0.8431373, 1, 1,
0.1319352, 2.049688, 0.2940879, 0, 0.8392157, 1, 1,
0.1335341, 0.1110715, 2.655274, 0, 0.8313726, 1, 1,
0.1370341, -1.550639, 2.179456, 0, 0.827451, 1, 1,
0.1383462, 1.75908, 1.761038, 0, 0.8196079, 1, 1,
0.1407434, -0.5366855, 3.531685, 0, 0.8156863, 1, 1,
0.1417461, 0.8028511, 0.7431171, 0, 0.8078431, 1, 1,
0.1486909, 0.267279, -0.6196648, 0, 0.8039216, 1, 1,
0.1489604, 0.8626271, -0.7392721, 0, 0.7960784, 1, 1,
0.1520213, 2.137359, -1.696792, 0, 0.7882353, 1, 1,
0.1524943, -0.06029979, 1.211088, 0, 0.7843137, 1, 1,
0.1525916, -0.7621816, 1.952506, 0, 0.7764706, 1, 1,
0.155323, -0.1403115, 3.845988, 0, 0.772549, 1, 1,
0.1566064, 0.05241045, 0.8945551, 0, 0.7647059, 1, 1,
0.1589506, 1.064936, 0.4050925, 0, 0.7607843, 1, 1,
0.1647486, -1.456374, 2.486277, 0, 0.7529412, 1, 1,
0.1659207, -1.100084, 4.417059, 0, 0.7490196, 1, 1,
0.1677287, 0.3464877, 0.256724, 0, 0.7411765, 1, 1,
0.1713106, -0.2834248, 4.044136, 0, 0.7372549, 1, 1,
0.1715354, 0.5129408, -0.3992563, 0, 0.7294118, 1, 1,
0.1738513, 0.6249344, 0.7562522, 0, 0.7254902, 1, 1,
0.1746671, 0.02676181, 2.308898, 0, 0.7176471, 1, 1,
0.1802154, 0.05894897, -0.2074041, 0, 0.7137255, 1, 1,
0.1817787, 0.09604342, 2.118018, 0, 0.7058824, 1, 1,
0.1842106, -0.1925862, 2.333666, 0, 0.6980392, 1, 1,
0.1858352, -0.9770045, 2.81009, 0, 0.6941177, 1, 1,
0.1882115, -0.07814062, 2.898695, 0, 0.6862745, 1, 1,
0.1910816, -0.2026814, 4.131431, 0, 0.682353, 1, 1,
0.1914749, -0.2556402, 3.387764, 0, 0.6745098, 1, 1,
0.1951749, -0.1265894, 2.972081, 0, 0.6705883, 1, 1,
0.1973313, -0.5041301, 2.188046, 0, 0.6627451, 1, 1,
0.1986378, 2.212697, 0.7429814, 0, 0.6588235, 1, 1,
0.1987422, -0.02592809, 0.1279084, 0, 0.6509804, 1, 1,
0.2020864, -0.3866192, 3.54157, 0, 0.6470588, 1, 1,
0.2021593, -0.5964693, 2.773684, 0, 0.6392157, 1, 1,
0.2043539, -1.668414, 3.793705, 0, 0.6352941, 1, 1,
0.2059181, 0.7614863, -0.7027763, 0, 0.627451, 1, 1,
0.2074417, -0.8087227, 4.44626, 0, 0.6235294, 1, 1,
0.2082725, 0.1326737, -0.2480256, 0, 0.6156863, 1, 1,
0.214433, 0.03755483, 1.524317, 0, 0.6117647, 1, 1,
0.2184774, -0.7528032, 3.243721, 0, 0.6039216, 1, 1,
0.220836, 0.4449984, -0.3351076, 0, 0.5960785, 1, 1,
0.2210398, 0.5836234, 1.690094, 0, 0.5921569, 1, 1,
0.2210888, -0.8727848, 3.090386, 0, 0.5843138, 1, 1,
0.2214737, 0.2466431, 1.430459, 0, 0.5803922, 1, 1,
0.2287837, 0.2055556, -0.491413, 0, 0.572549, 1, 1,
0.230578, 1.573825, 0.3174734, 0, 0.5686275, 1, 1,
0.2346915, -0.3207148, -0.168312, 0, 0.5607843, 1, 1,
0.2360097, 0.3976683, 1.85294, 0, 0.5568628, 1, 1,
0.2375107, -1.468988, 4.116299, 0, 0.5490196, 1, 1,
0.238455, 1.379858, -1.950933, 0, 0.5450981, 1, 1,
0.2428232, 1.117337, -0.2948243, 0, 0.5372549, 1, 1,
0.2429558, -0.7513419, 2.680184, 0, 0.5333334, 1, 1,
0.2446677, 0.8501189, 0.8867573, 0, 0.5254902, 1, 1,
0.2451811, 0.8523237, 0.4078137, 0, 0.5215687, 1, 1,
0.2453031, 1.018014, 0.272945, 0, 0.5137255, 1, 1,
0.2454632, -1.876094, 6.094221, 0, 0.509804, 1, 1,
0.2462597, -0.1420087, 1.273141, 0, 0.5019608, 1, 1,
0.2496511, -0.7551382, 4.351585, 0, 0.4941176, 1, 1,
0.2532996, 0.5829303, 0.4458902, 0, 0.4901961, 1, 1,
0.257215, 0.6207961, 1.157547, 0, 0.4823529, 1, 1,
0.2586055, -0.6160454, 3.391687, 0, 0.4784314, 1, 1,
0.2607749, 0.3266024, 1.915534, 0, 0.4705882, 1, 1,
0.2645995, 0.0850748, 1.065365, 0, 0.4666667, 1, 1,
0.2652017, -0.5504759, 1.806149, 0, 0.4588235, 1, 1,
0.2661901, -0.7598001, 2.344059, 0, 0.454902, 1, 1,
0.2662353, -0.1900326, 2.370456, 0, 0.4470588, 1, 1,
0.2695792, 0.799108, 0.8772206, 0, 0.4431373, 1, 1,
0.2751269, -0.03913114, 2.633202, 0, 0.4352941, 1, 1,
0.2759411, 0.1446594, 0.3402886, 0, 0.4313726, 1, 1,
0.2786812, -0.4542635, 4.249647, 0, 0.4235294, 1, 1,
0.2838727, -0.1323925, 1.368154, 0, 0.4196078, 1, 1,
0.2871833, -0.8964506, 2.687031, 0, 0.4117647, 1, 1,
0.2874373, 0.2385516, 0.4302531, 0, 0.4078431, 1, 1,
0.2942037, 0.8222106, 2.112872, 0, 0.4, 1, 1,
0.2953109, 0.6381075, 1.138878, 0, 0.3921569, 1, 1,
0.3007188, -0.8520657, 1.847694, 0, 0.3882353, 1, 1,
0.3036164, 1.076808, 3.357534, 0, 0.3803922, 1, 1,
0.3059175, -2.676413, 3.096088, 0, 0.3764706, 1, 1,
0.308141, 1.972925, 0.1092644, 0, 0.3686275, 1, 1,
0.3111091, 0.9885931, -0.6286172, 0, 0.3647059, 1, 1,
0.311615, -1.902918, 1.877609, 0, 0.3568628, 1, 1,
0.3144968, -0.8680013, 4.07511, 0, 0.3529412, 1, 1,
0.3159877, 0.6149455, 0.2955687, 0, 0.345098, 1, 1,
0.3163933, -0.05973606, 2.030497, 0, 0.3411765, 1, 1,
0.3319639, 0.4739163, -2.651973, 0, 0.3333333, 1, 1,
0.33464, 0.267216, 0.8321115, 0, 0.3294118, 1, 1,
0.3369424, 0.8970899, 0.5984521, 0, 0.3215686, 1, 1,
0.3377582, 0.2872906, 0.5279129, 0, 0.3176471, 1, 1,
0.3413253, 0.4310416, -0.7063339, 0, 0.3098039, 1, 1,
0.3416221, 1.04725, 0.472224, 0, 0.3058824, 1, 1,
0.3446879, 0.0238112, 2.236973, 0, 0.2980392, 1, 1,
0.3469256, 0.4941173, 0.327869, 0, 0.2901961, 1, 1,
0.351658, 0.6425979, -0.1493176, 0, 0.2862745, 1, 1,
0.352618, -0.1633506, 4.361629, 0, 0.2784314, 1, 1,
0.353206, -0.6664712, 3.058795, 0, 0.2745098, 1, 1,
0.3548502, -1.056379, 2.575376, 0, 0.2666667, 1, 1,
0.357709, -1.422145, 4.006414, 0, 0.2627451, 1, 1,
0.3588027, -0.2023841, 1.881455, 0, 0.254902, 1, 1,
0.3598202, -0.7378953, 2.621544, 0, 0.2509804, 1, 1,
0.3618259, 0.2140148, 2.173187, 0, 0.2431373, 1, 1,
0.3625, -0.2047395, 2.008305, 0, 0.2392157, 1, 1,
0.3654888, -0.1470145, 2.795632, 0, 0.2313726, 1, 1,
0.3728603, -0.07176056, 2.400322, 0, 0.227451, 1, 1,
0.379199, -0.2661511, 2.803198, 0, 0.2196078, 1, 1,
0.3800282, -0.5928244, 2.771168, 0, 0.2156863, 1, 1,
0.3826295, -0.2108665, 1.13816, 0, 0.2078431, 1, 1,
0.384025, -2.235071, 2.107641, 0, 0.2039216, 1, 1,
0.3892964, -0.07766357, 2.662305, 0, 0.1960784, 1, 1,
0.3907106, 0.8926059, 1.723642, 0, 0.1882353, 1, 1,
0.39198, 1.014288, 1.615264, 0, 0.1843137, 1, 1,
0.3972746, 0.7589468, 0.2543712, 0, 0.1764706, 1, 1,
0.4013438, -1.042424, 3.913973, 0, 0.172549, 1, 1,
0.4092995, -1.19986, 1.305332, 0, 0.1647059, 1, 1,
0.4095921, 0.1481266, 1.493328, 0, 0.1607843, 1, 1,
0.4131192, 0.3429087, -0.6059555, 0, 0.1529412, 1, 1,
0.4133245, -2.482894, 4.218878, 0, 0.1490196, 1, 1,
0.4145029, 0.3596369, -0.149046, 0, 0.1411765, 1, 1,
0.4181334, -0.7374012, 3.434676, 0, 0.1372549, 1, 1,
0.41843, 1.277265, -0.8839557, 0, 0.1294118, 1, 1,
0.4189584, -0.9604433, 2.689595, 0, 0.1254902, 1, 1,
0.4237152, -0.663991, 1.722942, 0, 0.1176471, 1, 1,
0.4253324, -0.2603399, 1.020207, 0, 0.1137255, 1, 1,
0.430802, -0.4518906, 2.232982, 0, 0.1058824, 1, 1,
0.4322813, 1.539523, 0.02949546, 0, 0.09803922, 1, 1,
0.4344423, 0.2260555, 2.468445, 0, 0.09411765, 1, 1,
0.4375613, 0.3773065, 1.611496, 0, 0.08627451, 1, 1,
0.441164, -1.508057, 2.399876, 0, 0.08235294, 1, 1,
0.442011, 0.4970192, 1.232152, 0, 0.07450981, 1, 1,
0.4442278, 0.7540978, -0.09390198, 0, 0.07058824, 1, 1,
0.4446036, 0.1987035, 1.982721, 0, 0.0627451, 1, 1,
0.4470083, 0.5764542, 1.835806, 0, 0.05882353, 1, 1,
0.45518, -0.5988975, 3.95374, 0, 0.05098039, 1, 1,
0.4561459, 1.309784, 0.9886676, 0, 0.04705882, 1, 1,
0.4588558, 0.4004363, 0.6368425, 0, 0.03921569, 1, 1,
0.459107, -0.2994452, 1.001617, 0, 0.03529412, 1, 1,
0.4597829, -1.056727, 2.6851, 0, 0.02745098, 1, 1,
0.4604012, -0.8253783, 2.446944, 0, 0.02352941, 1, 1,
0.4607275, -0.1815927, 3.588861, 0, 0.01568628, 1, 1,
0.4611855, -1.6558, 2.553677, 0, 0.01176471, 1, 1,
0.4625458, -0.003153019, 2.286201, 0, 0.003921569, 1, 1,
0.4636539, 0.3397056, 2.654954, 0.003921569, 0, 1, 1,
0.4682133, -0.496573, 2.702592, 0.007843138, 0, 1, 1,
0.4713162, -1.820647, 5.09647, 0.01568628, 0, 1, 1,
0.4719189, -1.192792, 3.018339, 0.01960784, 0, 1, 1,
0.47243, 0.6561311, 0.4095254, 0.02745098, 0, 1, 1,
0.4729683, 0.1834273, 0.8763099, 0.03137255, 0, 1, 1,
0.4730715, -0.8199835, 2.699697, 0.03921569, 0, 1, 1,
0.4756795, 0.09486854, 1.510572, 0.04313726, 0, 1, 1,
0.4757682, -0.756787, 1.973658, 0.05098039, 0, 1, 1,
0.4764125, -0.5167398, 1.797744, 0.05490196, 0, 1, 1,
0.4825145, -0.7968209, 2.458531, 0.0627451, 0, 1, 1,
0.4825485, 1.203573, 0.571241, 0.06666667, 0, 1, 1,
0.485027, -0.4935991, 2.43881, 0.07450981, 0, 1, 1,
0.4861442, 1.309631, -0.1311897, 0.07843138, 0, 1, 1,
0.4874268, 0.4301793, 2.70184, 0.08627451, 0, 1, 1,
0.4880699, -0.1784877, 0.9987142, 0.09019608, 0, 1, 1,
0.4938946, -0.4402293, 2.539422, 0.09803922, 0, 1, 1,
0.4967485, -0.4429236, 3.634512, 0.1058824, 0, 1, 1,
0.4987736, -2.711418, 4.741432, 0.1098039, 0, 1, 1,
0.5001412, 0.6809105, 0.02840639, 0.1176471, 0, 1, 1,
0.5032281, 0.244528, 0.08825821, 0.1215686, 0, 1, 1,
0.505329, 0.3134298, -0.6926246, 0.1294118, 0, 1, 1,
0.5065107, 0.1517833, 3.215199, 0.1333333, 0, 1, 1,
0.5089775, -0.7337844, 1.591544, 0.1411765, 0, 1, 1,
0.5115877, 0.2001273, 1.534127, 0.145098, 0, 1, 1,
0.5147148, 0.368979, 0.1840905, 0.1529412, 0, 1, 1,
0.5174093, -1.372563, 1.267506, 0.1568628, 0, 1, 1,
0.5219051, 0.5171409, 1.305721, 0.1647059, 0, 1, 1,
0.5241005, -0.3439348, 2.083446, 0.1686275, 0, 1, 1,
0.5309218, 0.02492597, -0.5143946, 0.1764706, 0, 1, 1,
0.5345882, 1.443503, 0.1837931, 0.1803922, 0, 1, 1,
0.5398132, -0.4283174, 1.840067, 0.1882353, 0, 1, 1,
0.5425655, -0.02862329, 1.158653, 0.1921569, 0, 1, 1,
0.5461682, -0.5554032, 0.8953097, 0.2, 0, 1, 1,
0.5488909, -0.5600778, 1.092692, 0.2078431, 0, 1, 1,
0.5502326, 1.150024, 0.3989392, 0.2117647, 0, 1, 1,
0.5517523, -0.01359377, -0.8788512, 0.2196078, 0, 1, 1,
0.5519283, 0.7659876, 0.3209191, 0.2235294, 0, 1, 1,
0.5584362, 0.1663916, 0.5846398, 0.2313726, 0, 1, 1,
0.5584596, 0.3843816, 2.550982, 0.2352941, 0, 1, 1,
0.5604561, -0.8343477, 3.115209, 0.2431373, 0, 1, 1,
0.5666905, -0.9758787, 2.600513, 0.2470588, 0, 1, 1,
0.5719703, -0.410645, 1.41971, 0.254902, 0, 1, 1,
0.573622, 0.7178042, 2.13833, 0.2588235, 0, 1, 1,
0.5748736, -0.08918712, 3.271883, 0.2666667, 0, 1, 1,
0.5803463, -0.2713123, 1.799541, 0.2705882, 0, 1, 1,
0.5815019, -2.983203, 4.164708, 0.2784314, 0, 1, 1,
0.5852749, -0.9181082, 2.365721, 0.282353, 0, 1, 1,
0.5868376, -1.208418, 3.290633, 0.2901961, 0, 1, 1,
0.5913067, -0.7086359, 1.1388, 0.2941177, 0, 1, 1,
0.5916415, -0.03311907, 1.177255, 0.3019608, 0, 1, 1,
0.5921907, -0.5266309, 2.380542, 0.3098039, 0, 1, 1,
0.5932747, -0.1007176, 2.253569, 0.3137255, 0, 1, 1,
0.5949026, 1.537185, 1.243624, 0.3215686, 0, 1, 1,
0.5963473, 0.5051132, -1.423614, 0.3254902, 0, 1, 1,
0.5979212, -1.197267, 3.070676, 0.3333333, 0, 1, 1,
0.6045131, -0.1318175, 1.685252, 0.3372549, 0, 1, 1,
0.6070918, 1.155163, -0.982096, 0.345098, 0, 1, 1,
0.6109335, 1.05541, -0.1856285, 0.3490196, 0, 1, 1,
0.6136516, -1.584569, 2.461837, 0.3568628, 0, 1, 1,
0.6200581, 0.1066442, 1.358496, 0.3607843, 0, 1, 1,
0.6208957, 1.125705, 0.4862184, 0.3686275, 0, 1, 1,
0.6239046, 0.6186215, 1.95334, 0.372549, 0, 1, 1,
0.6280025, -0.7345099, 1.620734, 0.3803922, 0, 1, 1,
0.6307672, -0.2151892, 1.064012, 0.3843137, 0, 1, 1,
0.6332563, 0.1523691, -0.301829, 0.3921569, 0, 1, 1,
0.6336877, 1.305718, 1.026132, 0.3960784, 0, 1, 1,
0.6405027, 1.11185, 2.213909, 0.4039216, 0, 1, 1,
0.6437385, -0.200249, 2.603054, 0.4117647, 0, 1, 1,
0.6478896, -0.01071788, 2.211696, 0.4156863, 0, 1, 1,
0.6482586, -0.4623051, 3.438491, 0.4235294, 0, 1, 1,
0.6483024, -0.6251949, 1.812876, 0.427451, 0, 1, 1,
0.6497934, -0.3051509, 3.376557, 0.4352941, 0, 1, 1,
0.6536949, 0.3614141, 1.555428, 0.4392157, 0, 1, 1,
0.6561477, -1.832017, 2.719259, 0.4470588, 0, 1, 1,
0.6635157, -0.9590166, 1.806361, 0.4509804, 0, 1, 1,
0.6648785, 0.3340603, 0.6126778, 0.4588235, 0, 1, 1,
0.6649269, -0.9615393, 4.603888, 0.4627451, 0, 1, 1,
0.6658694, -1.705805, 3.307993, 0.4705882, 0, 1, 1,
0.6816345, -1.178501, 1.831021, 0.4745098, 0, 1, 1,
0.6817996, -0.6545097, 1.343316, 0.4823529, 0, 1, 1,
0.6826013, 1.265271, -0.002115703, 0.4862745, 0, 1, 1,
0.6908358, -0.8069763, 4.364403, 0.4941176, 0, 1, 1,
0.6911001, 0.06224255, 1.164843, 0.5019608, 0, 1, 1,
0.6925232, 0.7364184, 2.092845, 0.5058824, 0, 1, 1,
0.6962429, -0.6669312, 4.090213, 0.5137255, 0, 1, 1,
0.6971776, -0.7411573, 0.9153748, 0.5176471, 0, 1, 1,
0.6991165, -0.577877, 1.680882, 0.5254902, 0, 1, 1,
0.702812, 0.08005061, 0.3768026, 0.5294118, 0, 1, 1,
0.7045016, 1.628525, 0.1809994, 0.5372549, 0, 1, 1,
0.7095127, 0.9034399, 0.3315119, 0.5411765, 0, 1, 1,
0.7118095, -0.4138169, 2.536151, 0.5490196, 0, 1, 1,
0.7144046, 0.4337787, 0.3016346, 0.5529412, 0, 1, 1,
0.7217613, -0.02921881, 2.659209, 0.5607843, 0, 1, 1,
0.7222723, -0.5691123, 3.376675, 0.5647059, 0, 1, 1,
0.7228571, 0.1348861, 0.7058451, 0.572549, 0, 1, 1,
0.7282768, 0.6201099, 1.583596, 0.5764706, 0, 1, 1,
0.7288876, 0.6126887, -1.834134, 0.5843138, 0, 1, 1,
0.7310684, 1.927406, 0.258417, 0.5882353, 0, 1, 1,
0.7314999, -0.09107547, 1.644268, 0.5960785, 0, 1, 1,
0.7339681, 1.76427, 1.660146, 0.6039216, 0, 1, 1,
0.7361056, 2.095054, 1.527602, 0.6078432, 0, 1, 1,
0.7390519, -0.4572922, 2.786267, 0.6156863, 0, 1, 1,
0.7418536, -0.4309858, 2.293622, 0.6196079, 0, 1, 1,
0.7512519, 0.9225751, -0.4825305, 0.627451, 0, 1, 1,
0.751937, 0.05101393, 1.201176, 0.6313726, 0, 1, 1,
0.7568586, 0.02833506, 0.4467549, 0.6392157, 0, 1, 1,
0.7588521, -1.601169, 2.442412, 0.6431373, 0, 1, 1,
0.7595236, 0.7227153, 0.2510447, 0.6509804, 0, 1, 1,
0.7628605, -0.5291359, 1.429511, 0.654902, 0, 1, 1,
0.7647315, 0.6380593, 2.982911, 0.6627451, 0, 1, 1,
0.7670234, -0.8249077, 2.098106, 0.6666667, 0, 1, 1,
0.7675619, 1.12325, 0.6282449, 0.6745098, 0, 1, 1,
0.7734291, 0.4597197, 4.598574, 0.6784314, 0, 1, 1,
0.7749481, -0.9131261, 1.577916, 0.6862745, 0, 1, 1,
0.7831567, -0.1985192, 1.494904, 0.6901961, 0, 1, 1,
0.7841367, 0.04236855, 1.120306, 0.6980392, 0, 1, 1,
0.7891818, 0.2400611, 4.179359, 0.7058824, 0, 1, 1,
0.790491, 0.6519251, 0.4806354, 0.7098039, 0, 1, 1,
0.7956268, 1.246687, 0.2388991, 0.7176471, 0, 1, 1,
0.8081065, -2.368028, 2.482033, 0.7215686, 0, 1, 1,
0.8095629, -0.8288975, 1.198006, 0.7294118, 0, 1, 1,
0.8096316, 0.7997099, 1.508231, 0.7333333, 0, 1, 1,
0.8100149, -1.342514, 4.622661, 0.7411765, 0, 1, 1,
0.8125832, 1.228792, 1.28662, 0.7450981, 0, 1, 1,
0.8153534, -0.05827111, 0.8126824, 0.7529412, 0, 1, 1,
0.8174293, 0.21258, 1.753035, 0.7568628, 0, 1, 1,
0.8205416, 0.3137527, -0.9713603, 0.7647059, 0, 1, 1,
0.8226146, 0.6332958, 0.7436774, 0.7686275, 0, 1, 1,
0.8228225, -1.274807, 2.266711, 0.7764706, 0, 1, 1,
0.8243936, -0.2402418, -0.2863036, 0.7803922, 0, 1, 1,
0.8253509, -1.009337, 2.136218, 0.7882353, 0, 1, 1,
0.8274946, 0.3837295, 0.9996634, 0.7921569, 0, 1, 1,
0.8303049, 0.3950076, 1.078586, 0.8, 0, 1, 1,
0.8312061, 0.6818994, 2.804579, 0.8078431, 0, 1, 1,
0.837198, 0.05631724, 1.092169, 0.8117647, 0, 1, 1,
0.8396375, 1.367162, 0.3968047, 0.8196079, 0, 1, 1,
0.8414154, 0.1357531, 1.428291, 0.8235294, 0, 1, 1,
0.8620777, 0.4935212, 1.655829, 0.8313726, 0, 1, 1,
0.8654369, -0.08573609, 0.9720517, 0.8352941, 0, 1, 1,
0.8703125, -0.09111863, 3.251055, 0.8431373, 0, 1, 1,
0.8798405, 1.459493, 2.232914, 0.8470588, 0, 1, 1,
0.8827344, 0.6416167, 0.6803264, 0.854902, 0, 1, 1,
0.889029, -1.515846, 2.664009, 0.8588235, 0, 1, 1,
0.891126, -0.4845873, 1.985071, 0.8666667, 0, 1, 1,
0.9097615, 1.205815, 0.4772021, 0.8705882, 0, 1, 1,
0.9124665, 0.66716, -0.1027825, 0.8784314, 0, 1, 1,
0.9147679, -0.756447, -0.1997708, 0.8823529, 0, 1, 1,
0.915653, -2.041885, 2.371444, 0.8901961, 0, 1, 1,
0.9184308, 0.6748117, 1.097944, 0.8941177, 0, 1, 1,
0.9197053, -0.1737956, 2.199304, 0.9019608, 0, 1, 1,
0.9219874, 1.891258, 1.859699, 0.9098039, 0, 1, 1,
0.9277771, -0.4362961, 3.084221, 0.9137255, 0, 1, 1,
0.9351219, 0.1745867, 2.944053, 0.9215686, 0, 1, 1,
0.9371784, -0.04027058, 1.607022, 0.9254902, 0, 1, 1,
0.9434597, -0.1504116, 1.517352, 0.9333333, 0, 1, 1,
0.9502522, 0.5695639, 1.498691, 0.9372549, 0, 1, 1,
0.9527133, 0.604813, 0.2229476, 0.945098, 0, 1, 1,
0.9533074, -2.440729, 2.719304, 0.9490196, 0, 1, 1,
0.9561502, -0.3648978, 3.340376, 0.9568627, 0, 1, 1,
0.9647741, 0.07564957, 0.5770482, 0.9607843, 0, 1, 1,
0.9679743, -0.6280686, 1.863774, 0.9686275, 0, 1, 1,
0.9754627, -1.27742, 2.978264, 0.972549, 0, 1, 1,
0.9789402, 1.776453, -0.3813065, 0.9803922, 0, 1, 1,
0.9884589, -0.522735, 0.8767621, 0.9843137, 0, 1, 1,
0.9902891, 0.566993, 1.686645, 0.9921569, 0, 1, 1,
0.992662, 0.2365069, 0.2283392, 0.9960784, 0, 1, 1,
1.000284, -0.3768454, 1.890495, 1, 0, 0.9960784, 1,
1.002929, -1.752658, 2.915502, 1, 0, 0.9882353, 1,
1.013131, -1.311556, 3.372976, 1, 0, 0.9843137, 1,
1.014322, -0.5379991, 1.285931, 1, 0, 0.9764706, 1,
1.028811, -1.018507, 2.709532, 1, 0, 0.972549, 1,
1.034315, -0.1573551, 1.639785, 1, 0, 0.9647059, 1,
1.038748, 0.5570503, 1.660442, 1, 0, 0.9607843, 1,
1.041382, 0.128334, 1.676294, 1, 0, 0.9529412, 1,
1.043976, 0.09846327, 1.911386, 1, 0, 0.9490196, 1,
1.051389, -0.9829425, 1.819617, 1, 0, 0.9411765, 1,
1.054856, 0.4746135, -0.3925702, 1, 0, 0.9372549, 1,
1.064439, -0.2291741, 1.234608, 1, 0, 0.9294118, 1,
1.065512, -0.6399342, 1.297229, 1, 0, 0.9254902, 1,
1.065637, 0.8470464, 3.058984, 1, 0, 0.9176471, 1,
1.068726, -0.7208301, 1.40526, 1, 0, 0.9137255, 1,
1.081496, 0.4294703, 1.67501, 1, 0, 0.9058824, 1,
1.091312, -1.144681, 1.777922, 1, 0, 0.9019608, 1,
1.091324, 1.420998, 0.3957822, 1, 0, 0.8941177, 1,
1.097639, 1.086486, 1.934532, 1, 0, 0.8862745, 1,
1.109034, -0.1307491, 0.2602952, 1, 0, 0.8823529, 1,
1.115247, 1.021831, 0.8628986, 1, 0, 0.8745098, 1,
1.116744, -1.317577, 4.326832, 1, 0, 0.8705882, 1,
1.123965, -0.9660126, 4.220378, 1, 0, 0.8627451, 1,
1.128306, -1.112049, 2.246361, 1, 0, 0.8588235, 1,
1.138838, -0.03645777, 2.044336, 1, 0, 0.8509804, 1,
1.140826, -1.234726, 2.687895, 1, 0, 0.8470588, 1,
1.143873, -2.041995, 2.966531, 1, 0, 0.8392157, 1,
1.143946, -0.7029985, 3.846898, 1, 0, 0.8352941, 1,
1.152028, -0.8371757, 0.4885219, 1, 0, 0.827451, 1,
1.156202, -0.2590338, 2.379629, 1, 0, 0.8235294, 1,
1.167727, -1.061464, 1.287002, 1, 0, 0.8156863, 1,
1.171717, 0.7153845, 0.5601621, 1, 0, 0.8117647, 1,
1.176641, 1.017876, 3.308306, 1, 0, 0.8039216, 1,
1.193742, -2.24568, 2.741458, 1, 0, 0.7960784, 1,
1.194709, -1.274925, 3.007055, 1, 0, 0.7921569, 1,
1.19527, 1.445461, -0.9671136, 1, 0, 0.7843137, 1,
1.201299, 2.125853, 2.369124, 1, 0, 0.7803922, 1,
1.203964, 0.7806032, 1.973837, 1, 0, 0.772549, 1,
1.20511, 0.9152527, 2.138146, 1, 0, 0.7686275, 1,
1.209883, -0.1133244, 3.058973, 1, 0, 0.7607843, 1,
1.21, -0.2459847, 2.083537, 1, 0, 0.7568628, 1,
1.211636, 0.3762779, 0.5085841, 1, 0, 0.7490196, 1,
1.216174, 0.5342436, -0.02997986, 1, 0, 0.7450981, 1,
1.219786, 0.7661276, 1.938762, 1, 0, 0.7372549, 1,
1.219988, 0.8415226, 1.374157, 1, 0, 0.7333333, 1,
1.23014, -0.5088722, 1.47732, 1, 0, 0.7254902, 1,
1.230464, -1.69911, 1.814768, 1, 0, 0.7215686, 1,
1.231041, 0.2077156, 0.9263742, 1, 0, 0.7137255, 1,
1.237922, 0.1276969, 0.6173254, 1, 0, 0.7098039, 1,
1.239334, -0.9636109, 2.098248, 1, 0, 0.7019608, 1,
1.252067, 0.3429925, 1.037508, 1, 0, 0.6941177, 1,
1.252663, 0.2091837, 0.3853731, 1, 0, 0.6901961, 1,
1.277171, 0.002227418, 0.3035138, 1, 0, 0.682353, 1,
1.278298, 1.01916, 0.4573476, 1, 0, 0.6784314, 1,
1.284537, 1.410466, 0.2770856, 1, 0, 0.6705883, 1,
1.305347, -0.7251188, 2.268872, 1, 0, 0.6666667, 1,
1.312612, 1.68824, 1.59355, 1, 0, 0.6588235, 1,
1.316223, 0.1430739, -0.2195165, 1, 0, 0.654902, 1,
1.316797, -0.1375019, 2.087316, 1, 0, 0.6470588, 1,
1.32081, 0.6630836, 1.336046, 1, 0, 0.6431373, 1,
1.325921, -0.06088755, 3.035657, 1, 0, 0.6352941, 1,
1.330419, -0.4716775, 3.712662, 1, 0, 0.6313726, 1,
1.331302, -1.193319, 2.965008, 1, 0, 0.6235294, 1,
1.333284, -0.52296, 2.875669, 1, 0, 0.6196079, 1,
1.334813, 1.835689, -0.9355493, 1, 0, 0.6117647, 1,
1.33958, -1.268778, 2.531507, 1, 0, 0.6078432, 1,
1.351611, -1.077789, 1.786948, 1, 0, 0.6, 1,
1.366026, 0.4609382, 1.595874, 1, 0, 0.5921569, 1,
1.380143, -0.9509565, 2.020612, 1, 0, 0.5882353, 1,
1.388538, -0.2466854, 3.367513, 1, 0, 0.5803922, 1,
1.402474, -0.2399812, 3.06418, 1, 0, 0.5764706, 1,
1.402785, -1.415704, 1.423167, 1, 0, 0.5686275, 1,
1.405978, -1.207905, 2.84336, 1, 0, 0.5647059, 1,
1.406389, -1.519682, 1.071695, 1, 0, 0.5568628, 1,
1.415444, -1.201894, 1.401831, 1, 0, 0.5529412, 1,
1.417996, 0.06534752, 2.284131, 1, 0, 0.5450981, 1,
1.419316, -1.067529, 1.525317, 1, 0, 0.5411765, 1,
1.434109, -0.1026859, 3.237557, 1, 0, 0.5333334, 1,
1.436417, -1.024503, 1.582868, 1, 0, 0.5294118, 1,
1.436873, 0.03510064, 3.293868, 1, 0, 0.5215687, 1,
1.445197, 1.247949, 1.35641, 1, 0, 0.5176471, 1,
1.446312, -0.3534196, 1.57045, 1, 0, 0.509804, 1,
1.447504, -0.6375866, 1.30268, 1, 0, 0.5058824, 1,
1.453538, -0.9658005, 0.7774864, 1, 0, 0.4980392, 1,
1.459333, -0.8203056, 2.908121, 1, 0, 0.4901961, 1,
1.461064, 0.4046981, 1.244519, 1, 0, 0.4862745, 1,
1.466261, 0.5600455, 1.346323, 1, 0, 0.4784314, 1,
1.472095, -0.02702658, 3.162138, 1, 0, 0.4745098, 1,
1.48814, -1.134053, 1.860402, 1, 0, 0.4666667, 1,
1.49952, 0.6550711, 1.550504, 1, 0, 0.4627451, 1,
1.501768, 1.09698, 0.8530728, 1, 0, 0.454902, 1,
1.505667, -0.9402028, 2.455257, 1, 0, 0.4509804, 1,
1.509105, 1.021914, 1.188205, 1, 0, 0.4431373, 1,
1.510278, 1.885313, 1.199909, 1, 0, 0.4392157, 1,
1.511806, 1.00952, 0.7259091, 1, 0, 0.4313726, 1,
1.512092, 0.4467019, 2.282873, 1, 0, 0.427451, 1,
1.513255, 2.125976, 1.518046, 1, 0, 0.4196078, 1,
1.521671, 0.8119061, 0.8432239, 1, 0, 0.4156863, 1,
1.523195, -0.8683844, 1.855927, 1, 0, 0.4078431, 1,
1.548648, -1.228714, 2.519656, 1, 0, 0.4039216, 1,
1.57212, 0.4383807, 0.6403344, 1, 0, 0.3960784, 1,
1.573279, 0.2195823, -0.1303362, 1, 0, 0.3882353, 1,
1.591993, -0.2054485, 1.710779, 1, 0, 0.3843137, 1,
1.595099, 0.1621633, 2.886542, 1, 0, 0.3764706, 1,
1.598118, -1.538321, 2.700441, 1, 0, 0.372549, 1,
1.606556, 0.3268506, 0.5327373, 1, 0, 0.3647059, 1,
1.618489, 0.4140908, 2.236521, 1, 0, 0.3607843, 1,
1.621465, -0.4363141, 0.225058, 1, 0, 0.3529412, 1,
1.661221, 0.609548, 1.571807, 1, 0, 0.3490196, 1,
1.662097, -1.972828, 3.972124, 1, 0, 0.3411765, 1,
1.678545, -1.08086, 2.073448, 1, 0, 0.3372549, 1,
1.68547, -0.2864449, 1.174809, 1, 0, 0.3294118, 1,
1.687125, -0.4814335, 1.173794, 1, 0, 0.3254902, 1,
1.701875, 0.7521015, 1.712658, 1, 0, 0.3176471, 1,
1.706175, -0.4719762, 2.244539, 1, 0, 0.3137255, 1,
1.748523, 0.09711128, 1.974074, 1, 0, 0.3058824, 1,
1.769991, -0.7493185, 1.369846, 1, 0, 0.2980392, 1,
1.775868, 2.237842, 0.9523314, 1, 0, 0.2941177, 1,
1.788474, 0.9090685, 0.6797678, 1, 0, 0.2862745, 1,
1.789078, 1.203747, 0.5809951, 1, 0, 0.282353, 1,
1.79181, -0.4633899, 3.053034, 1, 0, 0.2745098, 1,
1.795345, -1.453037, 1.688596, 1, 0, 0.2705882, 1,
1.806182, -0.3153076, 3.286221, 1, 0, 0.2627451, 1,
1.809184, 1.145242, 1.917964, 1, 0, 0.2588235, 1,
1.825884, -0.08231381, 0.09135563, 1, 0, 0.2509804, 1,
1.826559, 1.075768, 0.3662471, 1, 0, 0.2470588, 1,
1.827735, -1.308904, 2.116654, 1, 0, 0.2392157, 1,
1.83278, -0.9064848, 2.939492, 1, 0, 0.2352941, 1,
1.835013, -1.132949, 1.38803, 1, 0, 0.227451, 1,
1.839289, -0.463761, -0.1339423, 1, 0, 0.2235294, 1,
1.840988, -0.9214452, 1.171028, 1, 0, 0.2156863, 1,
1.863823, -0.2635622, 2.897653, 1, 0, 0.2117647, 1,
1.873258, -2.456789, 2.497175, 1, 0, 0.2039216, 1,
1.883233, 0.2838905, 0.6887156, 1, 0, 0.1960784, 1,
1.889775, 0.8252976, 0.2560395, 1, 0, 0.1921569, 1,
1.945749, 0.6092089, 2.946461, 1, 0, 0.1843137, 1,
1.973781, -2.381304, 3.894652, 1, 0, 0.1803922, 1,
1.975757, 1.078479, 1.500739, 1, 0, 0.172549, 1,
1.980434, 0.7655946, 0.7550925, 1, 0, 0.1686275, 1,
1.987441, 0.3907112, 0.3740514, 1, 0, 0.1607843, 1,
1.999322, -0.3626409, 1.462246, 1, 0, 0.1568628, 1,
2.005577, 1.141479, 1.358336, 1, 0, 0.1490196, 1,
2.006784, 1.758302, -0.1475857, 1, 0, 0.145098, 1,
2.009142, -0.1150615, 2.52603, 1, 0, 0.1372549, 1,
2.045729, 0.8604613, 2.377527, 1, 0, 0.1333333, 1,
2.06943, -0.8620112, 2.207736, 1, 0, 0.1254902, 1,
2.07799, 0.4042919, 1.429861, 1, 0, 0.1215686, 1,
2.081299, -0.1234812, 1.161407, 1, 0, 0.1137255, 1,
2.088718, -1.641942, 1.964133, 1, 0, 0.1098039, 1,
2.089901, -0.32675, 1.014861, 1, 0, 0.1019608, 1,
2.136313, 1.68536, 2.00733, 1, 0, 0.09411765, 1,
2.145197, -0.7115214, 1.453465, 1, 0, 0.09019608, 1,
2.154051, 1.397995, 0.7737954, 1, 0, 0.08235294, 1,
2.173218, -1.009742, 1.274205, 1, 0, 0.07843138, 1,
2.200057, -0.6007425, 2.547325, 1, 0, 0.07058824, 1,
2.22034, 0.441189, 0.8230085, 1, 0, 0.06666667, 1,
2.366389, 0.9357072, -0.0801319, 1, 0, 0.05882353, 1,
2.367474, -0.005734099, 1.237189, 1, 0, 0.05490196, 1,
2.413076, -0.4570676, 1.047264, 1, 0, 0.04705882, 1,
2.450891, -0.6104664, -0.06647365, 1, 0, 0.04313726, 1,
2.516941, -0.7724609, 2.472596, 1, 0, 0.03529412, 1,
2.586464, -0.6801417, 0.9620854, 1, 0, 0.03137255, 1,
2.820154, 0.6716063, 0.6893587, 1, 0, 0.02352941, 1,
2.896055, -1.172504, 1.714302, 1, 0, 0.01960784, 1,
3.067412, 0.4006288, 0.8586309, 1, 0, 0.01176471, 1,
3.089505, 0.1326428, 1.185976, 1, 0, 0.007843138, 1
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
-0.3985476, -4.422676, -8.614495, 0, -0.5, 0.5, 0.5,
-0.3985476, -4.422676, -8.614495, 1, -0.5, 0.5, 0.5,
-0.3985476, -4.422676, -8.614495, 1, 1.5, 0.5, 0.5,
-0.3985476, -4.422676, -8.614495, 0, 1.5, 0.5, 0.5
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
-5.06905, -0.3349091, -8.614495, 0, -0.5, 0.5, 0.5,
-5.06905, -0.3349091, -8.614495, 1, -0.5, 0.5, 0.5,
-5.06905, -0.3349091, -8.614495, 1, 1.5, 0.5, 0.5,
-5.06905, -0.3349091, -8.614495, 0, 1.5, 0.5, 0.5
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
-5.06905, -4.422676, -0.194243, 0, -0.5, 0.5, 0.5,
-5.06905, -4.422676, -0.194243, 1, -0.5, 0.5, 0.5,
-5.06905, -4.422676, -0.194243, 1, 1.5, 0.5, 0.5,
-5.06905, -4.422676, -0.194243, 0, 1.5, 0.5, 0.5
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
-3, -3.479345, -6.67136,
3, -3.479345, -6.67136,
-3, -3.479345, -6.67136,
-3, -3.636567, -6.995216,
-2, -3.479345, -6.67136,
-2, -3.636567, -6.995216,
-1, -3.479345, -6.67136,
-1, -3.636567, -6.995216,
0, -3.479345, -6.67136,
0, -3.636567, -6.995216,
1, -3.479345, -6.67136,
1, -3.636567, -6.995216,
2, -3.479345, -6.67136,
2, -3.636567, -6.995216,
3, -3.479345, -6.67136,
3, -3.636567, -6.995216
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
-3, -3.951011, -7.642928, 0, -0.5, 0.5, 0.5,
-3, -3.951011, -7.642928, 1, -0.5, 0.5, 0.5,
-3, -3.951011, -7.642928, 1, 1.5, 0.5, 0.5,
-3, -3.951011, -7.642928, 0, 1.5, 0.5, 0.5,
-2, -3.951011, -7.642928, 0, -0.5, 0.5, 0.5,
-2, -3.951011, -7.642928, 1, -0.5, 0.5, 0.5,
-2, -3.951011, -7.642928, 1, 1.5, 0.5, 0.5,
-2, -3.951011, -7.642928, 0, 1.5, 0.5, 0.5,
-1, -3.951011, -7.642928, 0, -0.5, 0.5, 0.5,
-1, -3.951011, -7.642928, 1, -0.5, 0.5, 0.5,
-1, -3.951011, -7.642928, 1, 1.5, 0.5, 0.5,
-1, -3.951011, -7.642928, 0, 1.5, 0.5, 0.5,
0, -3.951011, -7.642928, 0, -0.5, 0.5, 0.5,
0, -3.951011, -7.642928, 1, -0.5, 0.5, 0.5,
0, -3.951011, -7.642928, 1, 1.5, 0.5, 0.5,
0, -3.951011, -7.642928, 0, 1.5, 0.5, 0.5,
1, -3.951011, -7.642928, 0, -0.5, 0.5, 0.5,
1, -3.951011, -7.642928, 1, -0.5, 0.5, 0.5,
1, -3.951011, -7.642928, 1, 1.5, 0.5, 0.5,
1, -3.951011, -7.642928, 0, 1.5, 0.5, 0.5,
2, -3.951011, -7.642928, 0, -0.5, 0.5, 0.5,
2, -3.951011, -7.642928, 1, -0.5, 0.5, 0.5,
2, -3.951011, -7.642928, 1, 1.5, 0.5, 0.5,
2, -3.951011, -7.642928, 0, 1.5, 0.5, 0.5,
3, -3.951011, -7.642928, 0, -0.5, 0.5, 0.5,
3, -3.951011, -7.642928, 1, -0.5, 0.5, 0.5,
3, -3.951011, -7.642928, 1, 1.5, 0.5, 0.5,
3, -3.951011, -7.642928, 0, 1.5, 0.5, 0.5
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
-3.991242, -3, -6.67136,
-3.991242, 2, -6.67136,
-3.991242, -3, -6.67136,
-4.170877, -3, -6.995216,
-3.991242, -2, -6.67136,
-4.170877, -2, -6.995216,
-3.991242, -1, -6.67136,
-4.170877, -1, -6.995216,
-3.991242, 0, -6.67136,
-4.170877, 0, -6.995216,
-3.991242, 1, -6.67136,
-4.170877, 1, -6.995216,
-3.991242, 2, -6.67136,
-4.170877, 2, -6.995216
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
-4.530146, -3, -7.642928, 0, -0.5, 0.5, 0.5,
-4.530146, -3, -7.642928, 1, -0.5, 0.5, 0.5,
-4.530146, -3, -7.642928, 1, 1.5, 0.5, 0.5,
-4.530146, -3, -7.642928, 0, 1.5, 0.5, 0.5,
-4.530146, -2, -7.642928, 0, -0.5, 0.5, 0.5,
-4.530146, -2, -7.642928, 1, -0.5, 0.5, 0.5,
-4.530146, -2, -7.642928, 1, 1.5, 0.5, 0.5,
-4.530146, -2, -7.642928, 0, 1.5, 0.5, 0.5,
-4.530146, -1, -7.642928, 0, -0.5, 0.5, 0.5,
-4.530146, -1, -7.642928, 1, -0.5, 0.5, 0.5,
-4.530146, -1, -7.642928, 1, 1.5, 0.5, 0.5,
-4.530146, -1, -7.642928, 0, 1.5, 0.5, 0.5,
-4.530146, 0, -7.642928, 0, -0.5, 0.5, 0.5,
-4.530146, 0, -7.642928, 1, -0.5, 0.5, 0.5,
-4.530146, 0, -7.642928, 1, 1.5, 0.5, 0.5,
-4.530146, 0, -7.642928, 0, 1.5, 0.5, 0.5,
-4.530146, 1, -7.642928, 0, -0.5, 0.5, 0.5,
-4.530146, 1, -7.642928, 1, -0.5, 0.5, 0.5,
-4.530146, 1, -7.642928, 1, 1.5, 0.5, 0.5,
-4.530146, 1, -7.642928, 0, 1.5, 0.5, 0.5,
-4.530146, 2, -7.642928, 0, -0.5, 0.5, 0.5,
-4.530146, 2, -7.642928, 1, -0.5, 0.5, 0.5,
-4.530146, 2, -7.642928, 1, 1.5, 0.5, 0.5,
-4.530146, 2, -7.642928, 0, 1.5, 0.5, 0.5
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
-3.991242, -3.479345, -6,
-3.991242, -3.479345, 6,
-3.991242, -3.479345, -6,
-4.170877, -3.636567, -6,
-3.991242, -3.479345, -4,
-4.170877, -3.636567, -4,
-3.991242, -3.479345, -2,
-4.170877, -3.636567, -2,
-3.991242, -3.479345, 0,
-4.170877, -3.636567, 0,
-3.991242, -3.479345, 2,
-4.170877, -3.636567, 2,
-3.991242, -3.479345, 4,
-4.170877, -3.636567, 4,
-3.991242, -3.479345, 6,
-4.170877, -3.636567, 6
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
"4",
"6"
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
-4.530146, -3.951011, -6, 0, -0.5, 0.5, 0.5,
-4.530146, -3.951011, -6, 1, -0.5, 0.5, 0.5,
-4.530146, -3.951011, -6, 1, 1.5, 0.5, 0.5,
-4.530146, -3.951011, -6, 0, 1.5, 0.5, 0.5,
-4.530146, -3.951011, -4, 0, -0.5, 0.5, 0.5,
-4.530146, -3.951011, -4, 1, -0.5, 0.5, 0.5,
-4.530146, -3.951011, -4, 1, 1.5, 0.5, 0.5,
-4.530146, -3.951011, -4, 0, 1.5, 0.5, 0.5,
-4.530146, -3.951011, -2, 0, -0.5, 0.5, 0.5,
-4.530146, -3.951011, -2, 1, -0.5, 0.5, 0.5,
-4.530146, -3.951011, -2, 1, 1.5, 0.5, 0.5,
-4.530146, -3.951011, -2, 0, 1.5, 0.5, 0.5,
-4.530146, -3.951011, 0, 0, -0.5, 0.5, 0.5,
-4.530146, -3.951011, 0, 1, -0.5, 0.5, 0.5,
-4.530146, -3.951011, 0, 1, 1.5, 0.5, 0.5,
-4.530146, -3.951011, 0, 0, 1.5, 0.5, 0.5,
-4.530146, -3.951011, 2, 0, -0.5, 0.5, 0.5,
-4.530146, -3.951011, 2, 1, -0.5, 0.5, 0.5,
-4.530146, -3.951011, 2, 1, 1.5, 0.5, 0.5,
-4.530146, -3.951011, 2, 0, 1.5, 0.5, 0.5,
-4.530146, -3.951011, 4, 0, -0.5, 0.5, 0.5,
-4.530146, -3.951011, 4, 1, -0.5, 0.5, 0.5,
-4.530146, -3.951011, 4, 1, 1.5, 0.5, 0.5,
-4.530146, -3.951011, 4, 0, 1.5, 0.5, 0.5,
-4.530146, -3.951011, 6, 0, -0.5, 0.5, 0.5,
-4.530146, -3.951011, 6, 1, -0.5, 0.5, 0.5,
-4.530146, -3.951011, 6, 1, 1.5, 0.5, 0.5,
-4.530146, -3.951011, 6, 0, 1.5, 0.5, 0.5
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
-3.991242, -3.479345, -6.67136,
-3.991242, 2.809527, -6.67136,
-3.991242, -3.479345, 6.282875,
-3.991242, 2.809527, 6.282875,
-3.991242, -3.479345, -6.67136,
-3.991242, -3.479345, 6.282875,
-3.991242, 2.809527, -6.67136,
-3.991242, 2.809527, 6.282875,
-3.991242, -3.479345, -6.67136,
3.194147, -3.479345, -6.67136,
-3.991242, -3.479345, 6.282875,
3.194147, -3.479345, 6.282875,
-3.991242, 2.809527, -6.67136,
3.194147, 2.809527, -6.67136,
-3.991242, 2.809527, 6.282875,
3.194147, 2.809527, 6.282875,
3.194147, -3.479345, -6.67136,
3.194147, 2.809527, -6.67136,
3.194147, -3.479345, 6.282875,
3.194147, 2.809527, 6.282875,
3.194147, -3.479345, -6.67136,
3.194147, -3.479345, 6.282875,
3.194147, 2.809527, -6.67136,
3.194147, 2.809527, 6.282875
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
var radius = 8.593471;
var distance = 38.23332;
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
mvMatrix.translate( 0.3985476, 0.3349091, 0.194243 );
mvMatrix.scale( 1.2931, 1.47744, 0.7172503 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.23332);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


