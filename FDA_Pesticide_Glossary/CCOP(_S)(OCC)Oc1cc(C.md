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
-3.572347, 0.06409797, -3.816291, 1, 0, 0, 1,
-3.276583, 0.5228133, -1.943723, 1, 0.007843138, 0, 1,
-3.27534, 0.2384904, -0.131667, 1, 0.01176471, 0, 1,
-2.884691, -1.513752, -2.61975, 1, 0.01960784, 0, 1,
-2.681412, 0.3732564, -1.885084, 1, 0.02352941, 0, 1,
-2.667423, 1.14473, -2.079254, 1, 0.03137255, 0, 1,
-2.650416, 0.6680648, 0.1793845, 1, 0.03529412, 0, 1,
-2.477557, 0.5295438, -2.178696, 1, 0.04313726, 0, 1,
-2.43215, 0.457462, -1.848611, 1, 0.04705882, 0, 1,
-2.334644, -0.05091936, -1.674431, 1, 0.05490196, 0, 1,
-2.307387, -0.377804, -1.691195, 1, 0.05882353, 0, 1,
-2.304667, -1.852777, -2.358921, 1, 0.06666667, 0, 1,
-2.301091, 2.114372, -2.080911, 1, 0.07058824, 0, 1,
-2.131155, -0.02064956, -0.6468474, 1, 0.07843138, 0, 1,
-2.09549, -0.3582582, -2.873528, 1, 0.08235294, 0, 1,
-2.074616, 0.1620311, -2.138642, 1, 0.09019608, 0, 1,
-2.045448, 1.188835, 0.191103, 1, 0.09411765, 0, 1,
-2.012358, -1.605568, -1.125893, 1, 0.1019608, 0, 1,
-2.010472, -1.366032, -2.194478, 1, 0.1098039, 0, 1,
-1.99578, -0.1931648, -1.281382, 1, 0.1137255, 0, 1,
-1.932634, -0.164449, -0.1897212, 1, 0.1215686, 0, 1,
-1.834884, 0.4933563, -1.774067, 1, 0.1254902, 0, 1,
-1.811641, 0.1143597, -0.5877571, 1, 0.1333333, 0, 1,
-1.802697, -1.572984, -3.448698, 1, 0.1372549, 0, 1,
-1.801466, -0.07461074, -1.835312, 1, 0.145098, 0, 1,
-1.796311, 1.232366, 0.3151589, 1, 0.1490196, 0, 1,
-1.760282, -0.006734455, -2.019587, 1, 0.1568628, 0, 1,
-1.743438, -1.032221, -1.92456, 1, 0.1607843, 0, 1,
-1.740721, 0.2288239, -0.8641561, 1, 0.1686275, 0, 1,
-1.733742, -0.956516, -2.639421, 1, 0.172549, 0, 1,
-1.710437, -0.6598609, -1.815973, 1, 0.1803922, 0, 1,
-1.708802, -0.9268362, -3.873549, 1, 0.1843137, 0, 1,
-1.69791, -1.739714, -3.385725, 1, 0.1921569, 0, 1,
-1.695859, 0.08580645, -0.8085402, 1, 0.1960784, 0, 1,
-1.676312, -0.2068074, -2.205453, 1, 0.2039216, 0, 1,
-1.66511, -0.2085555, -1.747266, 1, 0.2117647, 0, 1,
-1.664437, 1.86745, -0.1903064, 1, 0.2156863, 0, 1,
-1.652629, -0.1029309, 0.5048854, 1, 0.2235294, 0, 1,
-1.647396, -2.675208, -1.890669, 1, 0.227451, 0, 1,
-1.644325, -1.241673, -3.394079, 1, 0.2352941, 0, 1,
-1.627351, -1.339499, -2.651866, 1, 0.2392157, 0, 1,
-1.621291, -0.8000038, -2.316483, 1, 0.2470588, 0, 1,
-1.600383, -0.5443814, -1.332002, 1, 0.2509804, 0, 1,
-1.588904, -0.688126, -2.88967, 1, 0.2588235, 0, 1,
-1.583209, -1.707185, -2.098785, 1, 0.2627451, 0, 1,
-1.57964, -1.541852, -2.051552, 1, 0.2705882, 0, 1,
-1.571855, 0.254959, 0.4513591, 1, 0.2745098, 0, 1,
-1.533773, -1.200875, -1.85194, 1, 0.282353, 0, 1,
-1.525383, 0.5229939, 0.1601501, 1, 0.2862745, 0, 1,
-1.525171, 1.307404, 0.568331, 1, 0.2941177, 0, 1,
-1.513926, 2.632564, 0.1225131, 1, 0.3019608, 0, 1,
-1.510183, 0.6008435, 0.2592435, 1, 0.3058824, 0, 1,
-1.507357, -1.151805, -1.621633, 1, 0.3137255, 0, 1,
-1.503431, -1.079686, -2.155416, 1, 0.3176471, 0, 1,
-1.491808, -1.751519, -1.206845, 1, 0.3254902, 0, 1,
-1.474053, 0.5705444, -1.890164, 1, 0.3294118, 0, 1,
-1.467422, 1.401994, -0.08824424, 1, 0.3372549, 0, 1,
-1.462266, -0.04394008, -2.217601, 1, 0.3411765, 0, 1,
-1.459691, -0.1980405, -0.7836875, 1, 0.3490196, 0, 1,
-1.4567, -0.2661461, 0.1204751, 1, 0.3529412, 0, 1,
-1.428915, 0.1790708, -0.8973491, 1, 0.3607843, 0, 1,
-1.413525, -0.358634, -1.93269, 1, 0.3647059, 0, 1,
-1.410446, -0.1051697, -0.7576555, 1, 0.372549, 0, 1,
-1.396253, -0.2530873, -2.946595, 1, 0.3764706, 0, 1,
-1.380056, -0.03935132, 0.4751774, 1, 0.3843137, 0, 1,
-1.379573, 0.07523295, -3.15037, 1, 0.3882353, 0, 1,
-1.368215, 1.634064, 0.8515571, 1, 0.3960784, 0, 1,
-1.367177, 0.4806816, -3.657223, 1, 0.4039216, 0, 1,
-1.363371, -0.9494575, -1.692309, 1, 0.4078431, 0, 1,
-1.361518, 1.149462, -1.018643, 1, 0.4156863, 0, 1,
-1.360626, -1.479183, -3.78097, 1, 0.4196078, 0, 1,
-1.347482, 0.7892439, -0.6592624, 1, 0.427451, 0, 1,
-1.34079, -0.2987599, -1.227022, 1, 0.4313726, 0, 1,
-1.321473, 0.04434989, -1.855075, 1, 0.4392157, 0, 1,
-1.319006, -0.3122378, -2.830265, 1, 0.4431373, 0, 1,
-1.311851, 1.563515, -1.00158, 1, 0.4509804, 0, 1,
-1.311031, 0.3426876, -1.941236, 1, 0.454902, 0, 1,
-1.309214, -0.5506493, -2.394101, 1, 0.4627451, 0, 1,
-1.30917, 0.04421233, -1.338168, 1, 0.4666667, 0, 1,
-1.301742, -0.6673861, -2.20993, 1, 0.4745098, 0, 1,
-1.297908, -0.1835172, -2.227648, 1, 0.4784314, 0, 1,
-1.291167, -1.944381, -2.693601, 1, 0.4862745, 0, 1,
-1.277871, 0.1533737, -2.35116, 1, 0.4901961, 0, 1,
-1.275262, 0.4296766, -0.7290183, 1, 0.4980392, 0, 1,
-1.265573, -0.4838623, -1.185001, 1, 0.5058824, 0, 1,
-1.259855, 1.204976, -0.7251021, 1, 0.509804, 0, 1,
-1.254218, -0.6120925, -2.947906, 1, 0.5176471, 0, 1,
-1.248626, 0.1254482, -1.664538, 1, 0.5215687, 0, 1,
-1.241949, 2.82905, 0.3781087, 1, 0.5294118, 0, 1,
-1.238245, 1.263962, -0.8937733, 1, 0.5333334, 0, 1,
-1.22932, -0.8025591, -2.541503, 1, 0.5411765, 0, 1,
-1.227421, 0.1298742, -2.285539, 1, 0.5450981, 0, 1,
-1.226324, -1.734457, -3.174453, 1, 0.5529412, 0, 1,
-1.225883, 0.9786019, 0.2893912, 1, 0.5568628, 0, 1,
-1.211116, -0.4695023, -2.866991, 1, 0.5647059, 0, 1,
-1.210162, -0.7651969, -1.598228, 1, 0.5686275, 0, 1,
-1.197969, -2.10678, -1.870642, 1, 0.5764706, 0, 1,
-1.195078, -0.3986227, -0.3919314, 1, 0.5803922, 0, 1,
-1.189953, 0.1037405, -1.301063, 1, 0.5882353, 0, 1,
-1.177383, -0.3008599, -0.3366021, 1, 0.5921569, 0, 1,
-1.17012, 0.3800288, -1.420237, 1, 0.6, 0, 1,
-1.169688, -0.03297191, -2.325078, 1, 0.6078432, 0, 1,
-1.167718, 0.3872001, -1.874817, 1, 0.6117647, 0, 1,
-1.16676, -0.01152402, -0.5818897, 1, 0.6196079, 0, 1,
-1.158162, -0.02146248, -2.591403, 1, 0.6235294, 0, 1,
-1.150714, 0.1834656, -2.466353, 1, 0.6313726, 0, 1,
-1.149833, 0.2228885, -1.73638, 1, 0.6352941, 0, 1,
-1.140342, 1.721416, 0.5309512, 1, 0.6431373, 0, 1,
-1.137561, -0.6476449, -2.391278, 1, 0.6470588, 0, 1,
-1.130356, 0.3636095, -1.638535, 1, 0.654902, 0, 1,
-1.128294, 0.645066, -0.7894508, 1, 0.6588235, 0, 1,
-1.125469, 0.7363257, -1.571433, 1, 0.6666667, 0, 1,
-1.125011, -1.594534, -1.244292, 1, 0.6705883, 0, 1,
-1.124153, 1.258185, -0.5317451, 1, 0.6784314, 0, 1,
-1.12199, 0.804175, -1.773505, 1, 0.682353, 0, 1,
-1.121666, -0.05327161, -1.45841, 1, 0.6901961, 0, 1,
-1.114144, -1.16702, -3.067601, 1, 0.6941177, 0, 1,
-1.113439, -0.1900791, -1.946471, 1, 0.7019608, 0, 1,
-1.112967, -1.191081, -0.4706835, 1, 0.7098039, 0, 1,
-1.103415, 0.05297859, 0.5730042, 1, 0.7137255, 0, 1,
-1.097623, -1.069641, -1.736596, 1, 0.7215686, 0, 1,
-1.082997, 0.132519, -1.713721, 1, 0.7254902, 0, 1,
-1.081663, 0.2894255, -4.394846, 1, 0.7333333, 0, 1,
-1.081289, -0.1677909, -1.693238, 1, 0.7372549, 0, 1,
-1.075793, -0.3450077, -1.579533, 1, 0.7450981, 0, 1,
-1.073398, -2.103466, -2.168317, 1, 0.7490196, 0, 1,
-1.071895, 0.8753798, -0.3844885, 1, 0.7568628, 0, 1,
-1.065051, 0.4014765, -1.968543, 1, 0.7607843, 0, 1,
-1.063793, -2.36084, -4.816974, 1, 0.7686275, 0, 1,
-1.061247, -0.4792666, -2.158016, 1, 0.772549, 0, 1,
-1.05421, -1.56643, -2.15358, 1, 0.7803922, 0, 1,
-1.052729, 0.8691393, -0.7619957, 1, 0.7843137, 0, 1,
-1.050778, 0.8702205, -0.7813618, 1, 0.7921569, 0, 1,
-1.048374, -0.03816082, -1.821061, 1, 0.7960784, 0, 1,
-1.047745, 2.458461, -0.7893822, 1, 0.8039216, 0, 1,
-1.046839, -0.9201678, -3.650026, 1, 0.8117647, 0, 1,
-1.042977, 0.451257, -2.808277, 1, 0.8156863, 0, 1,
-1.039119, -0.7828136, -1.965211, 1, 0.8235294, 0, 1,
-1.032088, 2.236431, -0.07145556, 1, 0.827451, 0, 1,
-1.029457, -0.2502497, -1.010707, 1, 0.8352941, 0, 1,
-1.027042, 1.692299, -1.111916, 1, 0.8392157, 0, 1,
-1.026922, -1.56302, -3.208163, 1, 0.8470588, 0, 1,
-1.023732, -0.6753829, -1.773873, 1, 0.8509804, 0, 1,
-1.022627, 1.339887, -0.3213875, 1, 0.8588235, 0, 1,
-1.019467, -0.07631198, -1.300379, 1, 0.8627451, 0, 1,
-1.019172, 0.9781517, 1.128065, 1, 0.8705882, 0, 1,
-1.01632, -0.3637923, -2.199866, 1, 0.8745098, 0, 1,
-1.014157, -0.6802959, -3.103233, 1, 0.8823529, 0, 1,
-1.001686, 0.1826158, -1.052445, 1, 0.8862745, 0, 1,
-0.9983394, -0.4219502, -0.4796035, 1, 0.8941177, 0, 1,
-0.9948672, -0.4913192, -1.12907, 1, 0.8980392, 0, 1,
-0.994076, 0.5101467, -1.626772, 1, 0.9058824, 0, 1,
-0.9924451, 0.313475, -1.580626, 1, 0.9137255, 0, 1,
-0.990839, 0.1000779, -1.686742, 1, 0.9176471, 0, 1,
-0.9904614, -2.33598, -2.227915, 1, 0.9254902, 0, 1,
-0.9895648, -1.604439, -3.004741, 1, 0.9294118, 0, 1,
-0.9764848, 0.1917496, 0.8730226, 1, 0.9372549, 0, 1,
-0.9757465, -1.46177, -3.987417, 1, 0.9411765, 0, 1,
-0.9734485, 0.2330125, -2.651812, 1, 0.9490196, 0, 1,
-0.9720632, 0.3543122, -1.425679, 1, 0.9529412, 0, 1,
-0.9700624, -0.7205669, -2.927234, 1, 0.9607843, 0, 1,
-0.9672161, -0.5691217, -3.475433, 1, 0.9647059, 0, 1,
-0.9668819, 0.5097861, -0.5748238, 1, 0.972549, 0, 1,
-0.9663615, 1.326087, -0.6180914, 1, 0.9764706, 0, 1,
-0.964726, 0.258532, -0.471177, 1, 0.9843137, 0, 1,
-0.9598754, -0.9788219, -2.06479, 1, 0.9882353, 0, 1,
-0.957153, -0.8561327, -2.038053, 1, 0.9960784, 0, 1,
-0.9551344, -1.441142, -2.411223, 0.9960784, 1, 0, 1,
-0.9469173, 0.1412603, -1.322084, 0.9921569, 1, 0, 1,
-0.9465253, 0.4472573, 0.5682792, 0.9843137, 1, 0, 1,
-0.9435066, -0.5027122, -1.806947, 0.9803922, 1, 0, 1,
-0.9382095, -0.4385487, -1.911713, 0.972549, 1, 0, 1,
-0.9380893, -1.494667, -1.592052, 0.9686275, 1, 0, 1,
-0.9354779, -0.5746179, -0.07118088, 0.9607843, 1, 0, 1,
-0.9276625, 0.8867808, -2.188353, 0.9568627, 1, 0, 1,
-0.9271688, 1.666253, 1.586829, 0.9490196, 1, 0, 1,
-0.9259514, 0.4775411, -1.704844, 0.945098, 1, 0, 1,
-0.9149896, 1.46209, 1.26606, 0.9372549, 1, 0, 1,
-0.9102889, 2.030199, -2.927642, 0.9333333, 1, 0, 1,
-0.907157, -0.1793697, 0.01863346, 0.9254902, 1, 0, 1,
-0.903749, 0.9877693, -2.210857, 0.9215686, 1, 0, 1,
-0.9029869, 0.8574011, -0.7812818, 0.9137255, 1, 0, 1,
-0.8899969, -0.7701527, -0.8701571, 0.9098039, 1, 0, 1,
-0.8899308, -0.06969547, -0.955337, 0.9019608, 1, 0, 1,
-0.8852425, -0.7230474, -2.726231, 0.8941177, 1, 0, 1,
-0.8785331, -0.93593, -3.390299, 0.8901961, 1, 0, 1,
-0.8730208, 0.7652062, -1.337745, 0.8823529, 1, 0, 1,
-0.8640096, -1.047434, -2.380549, 0.8784314, 1, 0, 1,
-0.8596643, -0.1040314, -1.875577, 0.8705882, 1, 0, 1,
-0.8574317, -0.1408293, -0.5961072, 0.8666667, 1, 0, 1,
-0.8551911, 0.6418008, 0.6985531, 0.8588235, 1, 0, 1,
-0.8532931, 0.7424863, 0.1741215, 0.854902, 1, 0, 1,
-0.8491881, -1.573457, -3.287417, 0.8470588, 1, 0, 1,
-0.8463711, -0.2182581, -1.302355, 0.8431373, 1, 0, 1,
-0.8375073, -1.027032, -3.474322, 0.8352941, 1, 0, 1,
-0.8289126, -0.3805352, -2.550556, 0.8313726, 1, 0, 1,
-0.8286946, -0.06822222, -2.608524, 0.8235294, 1, 0, 1,
-0.8266847, -1.037534, -1.201483, 0.8196079, 1, 0, 1,
-0.8246179, -0.7525226, -1.54003, 0.8117647, 1, 0, 1,
-0.8242368, 1.116611, -1.34977, 0.8078431, 1, 0, 1,
-0.8218207, 0.5357898, -0.843294, 0.8, 1, 0, 1,
-0.8192486, 0.7030651, -0.04356905, 0.7921569, 1, 0, 1,
-0.813297, -1.347988, -2.780552, 0.7882353, 1, 0, 1,
-0.8077554, -2.176123, -3.541252, 0.7803922, 1, 0, 1,
-0.7930977, -0.7346302, -1.744562, 0.7764706, 1, 0, 1,
-0.7864659, -0.1737893, -2.883074, 0.7686275, 1, 0, 1,
-0.7756091, 0.7511737, -1.565071, 0.7647059, 1, 0, 1,
-0.7694001, 0.2325424, -0.6422306, 0.7568628, 1, 0, 1,
-0.7689052, -0.01718583, -0.7754591, 0.7529412, 1, 0, 1,
-0.7606836, 0.1323036, -1.94559, 0.7450981, 1, 0, 1,
-0.7602885, -1.800555, -2.103471, 0.7411765, 1, 0, 1,
-0.7560576, -0.5018604, -1.771542, 0.7333333, 1, 0, 1,
-0.7532186, 0.8951147, -0.1332058, 0.7294118, 1, 0, 1,
-0.7529801, 0.1685918, -0.209515, 0.7215686, 1, 0, 1,
-0.7515858, 0.8278969, -1.352971, 0.7176471, 1, 0, 1,
-0.7511588, 1.596537, -0.4813624, 0.7098039, 1, 0, 1,
-0.7510233, 0.08337944, -0.321307, 0.7058824, 1, 0, 1,
-0.7478958, -1.367603, -2.382296, 0.6980392, 1, 0, 1,
-0.7459028, 1.254378, 0.1540793, 0.6901961, 1, 0, 1,
-0.7428859, -0.7884899, -1.24091, 0.6862745, 1, 0, 1,
-0.734811, 0.4339311, -1.319147, 0.6784314, 1, 0, 1,
-0.7316179, -0.8112262, -3.300675, 0.6745098, 1, 0, 1,
-0.7300338, 1.912655, 0.4416441, 0.6666667, 1, 0, 1,
-0.7257789, 0.0539803, -3.439389, 0.6627451, 1, 0, 1,
-0.719991, -0.1444181, -1.70095, 0.654902, 1, 0, 1,
-0.7190948, 1.722449, -0.2687007, 0.6509804, 1, 0, 1,
-0.7182992, 1.758084, -0.4120398, 0.6431373, 1, 0, 1,
-0.715137, 0.98884, -0.6180725, 0.6392157, 1, 0, 1,
-0.712004, -0.1481784, -1.396474, 0.6313726, 1, 0, 1,
-0.7095833, 0.9860013, 0.1797477, 0.627451, 1, 0, 1,
-0.6990968, 0.9278125, -1.246376, 0.6196079, 1, 0, 1,
-0.6978028, -0.6679192, -2.504327, 0.6156863, 1, 0, 1,
-0.6946305, 0.3165166, -2.053922, 0.6078432, 1, 0, 1,
-0.6854983, -0.3352446, -2.21524, 0.6039216, 1, 0, 1,
-0.6836001, -0.1249085, -0.7992747, 0.5960785, 1, 0, 1,
-0.6835145, -1.923072, -2.676383, 0.5882353, 1, 0, 1,
-0.6816193, -0.3232813, -0.5889833, 0.5843138, 1, 0, 1,
-0.681432, 0.7699464, -1.630773, 0.5764706, 1, 0, 1,
-0.6800789, 0.03401492, 0.101113, 0.572549, 1, 0, 1,
-0.6774514, 0.6547894, 0.5488878, 0.5647059, 1, 0, 1,
-0.6708539, 0.6906427, 0.373265, 0.5607843, 1, 0, 1,
-0.6707146, 0.6755141, -0.5634592, 0.5529412, 1, 0, 1,
-0.6702815, 0.6737487, -1.878993, 0.5490196, 1, 0, 1,
-0.6692595, -1.008584, -2.755683, 0.5411765, 1, 0, 1,
-0.668173, -1.556511, -2.384195, 0.5372549, 1, 0, 1,
-0.6551812, -0.3539451, -3.013985, 0.5294118, 1, 0, 1,
-0.6536759, -0.1530661, -0.7769706, 0.5254902, 1, 0, 1,
-0.6483848, 1.420771, 1.483662, 0.5176471, 1, 0, 1,
-0.6426692, -0.1677689, 0.4314496, 0.5137255, 1, 0, 1,
-0.6333085, 0.03502261, -1.336735, 0.5058824, 1, 0, 1,
-0.627525, 0.5545273, -0.5805915, 0.5019608, 1, 0, 1,
-0.6211004, -0.2714889, -2.229662, 0.4941176, 1, 0, 1,
-0.6192956, 0.3309668, -0.8629171, 0.4862745, 1, 0, 1,
-0.6174029, 0.6335333, -0.8225332, 0.4823529, 1, 0, 1,
-0.6133276, -2.248335, -2.321062, 0.4745098, 1, 0, 1,
-0.6113765, -2.110992, -3.836396, 0.4705882, 1, 0, 1,
-0.6084877, 0.08826966, -1.551356, 0.4627451, 1, 0, 1,
-0.6062687, -0.1036702, -1.74771, 0.4588235, 1, 0, 1,
-0.6051705, 0.1301995, -2.481291, 0.4509804, 1, 0, 1,
-0.6024127, 0.272254, -1.302892, 0.4470588, 1, 0, 1,
-0.6018569, 0.5312852, -1.719781, 0.4392157, 1, 0, 1,
-0.6013744, 1.076516, 0.3014744, 0.4352941, 1, 0, 1,
-0.5950603, 1.951505, 0.2652943, 0.427451, 1, 0, 1,
-0.5844485, -1.330554, -2.493112, 0.4235294, 1, 0, 1,
-0.5837427, 0.5262324, -0.4879009, 0.4156863, 1, 0, 1,
-0.5777041, 1.732342, -0.2712902, 0.4117647, 1, 0, 1,
-0.5776964, 0.3558108, 0.8326401, 0.4039216, 1, 0, 1,
-0.5722365, -0.2538834, -3.883023, 0.3960784, 1, 0, 1,
-0.5697936, -0.08282237, -2.522857, 0.3921569, 1, 0, 1,
-0.5691906, 0.152476, -1.678416, 0.3843137, 1, 0, 1,
-0.5680122, -0.8330904, -1.742838, 0.3803922, 1, 0, 1,
-0.5639855, 0.672246, 0.08220962, 0.372549, 1, 0, 1,
-0.5592906, -0.2913796, -1.878175, 0.3686275, 1, 0, 1,
-0.5589678, 0.6323403, -2.444969, 0.3607843, 1, 0, 1,
-0.5587884, -1.822532, -4.397583, 0.3568628, 1, 0, 1,
-0.5564541, -0.247216, -1.262391, 0.3490196, 1, 0, 1,
-0.5562745, -0.1315564, -1.823116, 0.345098, 1, 0, 1,
-0.5542519, 0.7494916, -0.4621955, 0.3372549, 1, 0, 1,
-0.5527241, 0.0882047, -1.27983, 0.3333333, 1, 0, 1,
-0.5519472, 0.723419, -1.709472, 0.3254902, 1, 0, 1,
-0.5499054, -1.328287, -4.237965, 0.3215686, 1, 0, 1,
-0.544885, -0.2718085, -1.972414, 0.3137255, 1, 0, 1,
-0.5430449, -0.9233104, -1.814294, 0.3098039, 1, 0, 1,
-0.5426697, -1.611442, -2.160903, 0.3019608, 1, 0, 1,
-0.5393175, 1.288132, -0.4807434, 0.2941177, 1, 0, 1,
-0.5352659, -1.147506, -2.996774, 0.2901961, 1, 0, 1,
-0.5331543, -0.7672437, -1.324015, 0.282353, 1, 0, 1,
-0.5318792, 0.05197392, -1.148834, 0.2784314, 1, 0, 1,
-0.5256879, 0.2749864, 1.425929, 0.2705882, 1, 0, 1,
-0.52542, 0.6513317, 0.1524255, 0.2666667, 1, 0, 1,
-0.5212852, 0.7782819, -0.6624804, 0.2588235, 1, 0, 1,
-0.5165218, 0.1455382, -0.9449119, 0.254902, 1, 0, 1,
-0.5121555, 0.598089, -2.562362, 0.2470588, 1, 0, 1,
-0.5108877, 0.7197702, -0.9856631, 0.2431373, 1, 0, 1,
-0.5108016, 0.5372778, -0.9260439, 0.2352941, 1, 0, 1,
-0.5100988, 1.362215, -1.660483, 0.2313726, 1, 0, 1,
-0.509156, -0.9853095, -2.011808, 0.2235294, 1, 0, 1,
-0.5090232, -2.016036, -2.728287, 0.2196078, 1, 0, 1,
-0.5070801, 0.8098593, -2.090951, 0.2117647, 1, 0, 1,
-0.5016551, -0.7178339, -1.808226, 0.2078431, 1, 0, 1,
-0.5013846, -1.776007, -3.913211, 0.2, 1, 0, 1,
-0.4920254, 1.177678, 0.2884498, 0.1921569, 1, 0, 1,
-0.490456, -0.4882866, -1.789727, 0.1882353, 1, 0, 1,
-0.488323, -0.7883474, -2.264807, 0.1803922, 1, 0, 1,
-0.4824094, 0.3733034, -0.4175793, 0.1764706, 1, 0, 1,
-0.4816815, 1.302186, -1.281699, 0.1686275, 1, 0, 1,
-0.4796177, 1.524892, -0.8394608, 0.1647059, 1, 0, 1,
-0.4714907, 1.005646, 0.6947644, 0.1568628, 1, 0, 1,
-0.4714276, 0.9574454, -1.075446, 0.1529412, 1, 0, 1,
-0.4706889, 0.0711619, -2.417719, 0.145098, 1, 0, 1,
-0.4676657, -1.193326, -1.806797, 0.1411765, 1, 0, 1,
-0.4662065, -1.875795, -2.642529, 0.1333333, 1, 0, 1,
-0.4651985, -0.0645852, -1.23659, 0.1294118, 1, 0, 1,
-0.4650976, -0.6824999, -2.996099, 0.1215686, 1, 0, 1,
-0.4635246, 1.355351, -0.132436, 0.1176471, 1, 0, 1,
-0.4562948, 0.837257, -1.537338, 0.1098039, 1, 0, 1,
-0.4534386, 1.375079, 0.6750349, 0.1058824, 1, 0, 1,
-0.4531937, -0.2267246, -3.452746, 0.09803922, 1, 0, 1,
-0.4502155, 0.3632228, -0.0673625, 0.09019608, 1, 0, 1,
-0.4461139, -0.8759686, -3.621078, 0.08627451, 1, 0, 1,
-0.4453047, -0.04937924, -2.28492, 0.07843138, 1, 0, 1,
-0.4448733, -0.4225459, -1.682282, 0.07450981, 1, 0, 1,
-0.4425972, 0.8421174, 0.0893511, 0.06666667, 1, 0, 1,
-0.4324794, 1.483094, 1.124549, 0.0627451, 1, 0, 1,
-0.4301328, 1.228452, 2.610309, 0.05490196, 1, 0, 1,
-0.4291086, -0.4490629, -1.219776, 0.05098039, 1, 0, 1,
-0.4267267, 2.65782, -0.5838209, 0.04313726, 1, 0, 1,
-0.4226192, -0.5300859, -1.663225, 0.03921569, 1, 0, 1,
-0.4141418, -0.1704211, -3.327923, 0.03137255, 1, 0, 1,
-0.4121259, -0.3758335, -1.621271, 0.02745098, 1, 0, 1,
-0.4114546, 0.08664543, -1.322834, 0.01960784, 1, 0, 1,
-0.4087091, -1.016109, -1.042655, 0.01568628, 1, 0, 1,
-0.4046003, -0.1793052, -2.435562, 0.007843138, 1, 0, 1,
-0.4027494, 1.376833, -0.9475256, 0.003921569, 1, 0, 1,
-0.4019997, -0.453463, -3.081303, 0, 1, 0.003921569, 1,
-0.3983064, 1.464177, 0.5896578, 0, 1, 0.01176471, 1,
-0.3980231, 0.004392488, -0.569411, 0, 1, 0.01568628, 1,
-0.3966131, -0.005790271, 0.5643594, 0, 1, 0.02352941, 1,
-0.395285, 0.8377826, 0.2816102, 0, 1, 0.02745098, 1,
-0.3905702, 0.3478689, -1.69639, 0, 1, 0.03529412, 1,
-0.3811576, 0.7094918, -0.8678391, 0, 1, 0.03921569, 1,
-0.3773997, 0.003289554, -1.951355, 0, 1, 0.04705882, 1,
-0.3773266, 1.868134, -1.994728, 0, 1, 0.05098039, 1,
-0.3727573, -0.01557719, -1.589614, 0, 1, 0.05882353, 1,
-0.3712133, 3.64716, 0.3074879, 0, 1, 0.0627451, 1,
-0.3703214, -0.3423499, -1.281293, 0, 1, 0.07058824, 1,
-0.3695806, -0.8139682, -3.831122, 0, 1, 0.07450981, 1,
-0.3666325, -1.845542, -5.338715, 0, 1, 0.08235294, 1,
-0.3649945, 0.5171598, -0.4173595, 0, 1, 0.08627451, 1,
-0.3647828, 0.282654, -2.195117, 0, 1, 0.09411765, 1,
-0.3630295, 0.1243607, -1.646451, 0, 1, 0.1019608, 1,
-0.3596318, -1.142844, -1.366727, 0, 1, 0.1058824, 1,
-0.3579135, 0.1032497, -0.388478, 0, 1, 0.1137255, 1,
-0.3572243, -1.237982, -3.33755, 0, 1, 0.1176471, 1,
-0.353282, 2.621539, -0.4377004, 0, 1, 0.1254902, 1,
-0.347555, 0.5182385, 0.7405229, 0, 1, 0.1294118, 1,
-0.3440959, -0.6165946, -2.591646, 0, 1, 0.1372549, 1,
-0.3439893, -0.4449033, -2.433253, 0, 1, 0.1411765, 1,
-0.3432649, -0.9349789, -3.710985, 0, 1, 0.1490196, 1,
-0.3410577, -0.08488031, -1.759704, 0, 1, 0.1529412, 1,
-0.3396185, 0.8566611, 1.956584, 0, 1, 0.1607843, 1,
-0.3373303, -0.2710412, -3.322071, 0, 1, 0.1647059, 1,
-0.3367005, -0.127792, -1.45534, 0, 1, 0.172549, 1,
-0.3356551, -0.9123316, -2.409535, 0, 1, 0.1764706, 1,
-0.3335916, -0.01051395, -1.211678, 0, 1, 0.1843137, 1,
-0.3335459, -0.107103, -2.399331, 0, 1, 0.1882353, 1,
-0.3318879, -0.6722023, -2.014017, 0, 1, 0.1960784, 1,
-0.3295778, -1.395342, -3.074727, 0, 1, 0.2039216, 1,
-0.3276812, 1.818788, -0.2413131, 0, 1, 0.2078431, 1,
-0.3239443, 1.50215, 0.5609221, 0, 1, 0.2156863, 1,
-0.3213111, -0.4862547, -2.35305, 0, 1, 0.2196078, 1,
-0.3211481, 1.997788, -0.11612, 0, 1, 0.227451, 1,
-0.3190628, 1.038114, 0.4861498, 0, 1, 0.2313726, 1,
-0.3176294, -0.07700337, -3.792834, 0, 1, 0.2392157, 1,
-0.3169519, 0.4109849, -1.127611, 0, 1, 0.2431373, 1,
-0.3140681, 0.1832994, 0.3083376, 0, 1, 0.2509804, 1,
-0.3133453, 0.05133267, 0.0813038, 0, 1, 0.254902, 1,
-0.3085384, 0.578238, 0.3513185, 0, 1, 0.2627451, 1,
-0.3067229, 0.1829602, -0.6871791, 0, 1, 0.2666667, 1,
-0.3048768, -0.7491609, -1.60636, 0, 1, 0.2745098, 1,
-0.3046863, -1.911798, -4.203135, 0, 1, 0.2784314, 1,
-0.3027796, 0.9157013, 1.460329, 0, 1, 0.2862745, 1,
-0.3011649, -0.02890129, -3.071749, 0, 1, 0.2901961, 1,
-0.2824711, -0.8473006, -1.962646, 0, 1, 0.2980392, 1,
-0.2819904, -1.341743, -2.820546, 0, 1, 0.3058824, 1,
-0.27972, -0.5522135, -1.888964, 0, 1, 0.3098039, 1,
-0.2782447, -0.9206689, -3.179904, 0, 1, 0.3176471, 1,
-0.2776761, -0.04640491, -3.572641, 0, 1, 0.3215686, 1,
-0.2776729, -0.9990551, -0.8822463, 0, 1, 0.3294118, 1,
-0.2756918, 0.8396793, 0.7860267, 0, 1, 0.3333333, 1,
-0.2710921, 0.1498991, 1.43497, 0, 1, 0.3411765, 1,
-0.2698652, 0.2337529, -1.104453, 0, 1, 0.345098, 1,
-0.2648203, 0.8035468, 0.4838458, 0, 1, 0.3529412, 1,
-0.2644108, -0.8929978, -3.396962, 0, 1, 0.3568628, 1,
-0.2599076, 1.747707, -0.01891342, 0, 1, 0.3647059, 1,
-0.2556025, -0.1737482, 0.2149806, 0, 1, 0.3686275, 1,
-0.2552418, -0.09231123, -1.826658, 0, 1, 0.3764706, 1,
-0.2548206, -0.4405761, -2.669343, 0, 1, 0.3803922, 1,
-0.2539865, 0.4608795, -0.5984686, 0, 1, 0.3882353, 1,
-0.252046, -0.2012955, -2.540673, 0, 1, 0.3921569, 1,
-0.2505435, 0.1472187, -2.093892, 0, 1, 0.4, 1,
-0.2485461, -0.2670825, -1.489062, 0, 1, 0.4078431, 1,
-0.2445935, 1.027594, 0.4535226, 0, 1, 0.4117647, 1,
-0.2383436, -0.7234267, -2.013968, 0, 1, 0.4196078, 1,
-0.2362725, 1.221481, -0.5126953, 0, 1, 0.4235294, 1,
-0.236221, 1.191688, -0.4952604, 0, 1, 0.4313726, 1,
-0.2354261, 0.259788, -1.497032, 0, 1, 0.4352941, 1,
-0.2307423, -0.4954669, -4.11616, 0, 1, 0.4431373, 1,
-0.2301882, -0.4460156, -1.704548, 0, 1, 0.4470588, 1,
-0.2285182, -0.48079, -1.690086, 0, 1, 0.454902, 1,
-0.223936, -0.1936759, -1.927138, 0, 1, 0.4588235, 1,
-0.2210006, 0.9211779, -0.8749804, 0, 1, 0.4666667, 1,
-0.219353, -0.3848518, -2.859752, 0, 1, 0.4705882, 1,
-0.2177453, -0.4827024, -2.286057, 0, 1, 0.4784314, 1,
-0.2099389, -0.5832013, -3.352453, 0, 1, 0.4823529, 1,
-0.2055207, -0.06326192, -0.5971945, 0, 1, 0.4901961, 1,
-0.2032578, -0.3355235, -2.006503, 0, 1, 0.4941176, 1,
-0.2029004, -0.1799649, -1.831012, 0, 1, 0.5019608, 1,
-0.1990159, -0.3006642, 0.01783421, 0, 1, 0.509804, 1,
-0.1971413, -0.2586409, -3.232203, 0, 1, 0.5137255, 1,
-0.1934394, 1.234097, -0.7779144, 0, 1, 0.5215687, 1,
-0.1931671, -1.039956, -3.635107, 0, 1, 0.5254902, 1,
-0.1930949, 1.276791, -0.1622693, 0, 1, 0.5333334, 1,
-0.1912434, 1.892882, -1.754899, 0, 1, 0.5372549, 1,
-0.1882674, -1.019096, -2.013518, 0, 1, 0.5450981, 1,
-0.1852355, 0.9325126, -2.039327, 0, 1, 0.5490196, 1,
-0.1813124, 2.093681, -0.4741259, 0, 1, 0.5568628, 1,
-0.1781775, -0.07602584, -2.152535, 0, 1, 0.5607843, 1,
-0.1661533, -1.487698, -3.312868, 0, 1, 0.5686275, 1,
-0.1584686, 1.977924, -1.663743, 0, 1, 0.572549, 1,
-0.1501943, -0.8075541, -3.734676, 0, 1, 0.5803922, 1,
-0.1484602, 1.834852, -1.354062, 0, 1, 0.5843138, 1,
-0.1435527, 0.004646226, -0.3845966, 0, 1, 0.5921569, 1,
-0.1428241, -2.061601, -3.718326, 0, 1, 0.5960785, 1,
-0.1407681, -0.05634062, -1.043187, 0, 1, 0.6039216, 1,
-0.138692, -1.143036, -3.064121, 0, 1, 0.6117647, 1,
-0.1368782, -0.7727447, -2.842875, 0, 1, 0.6156863, 1,
-0.1364292, 0.4340743, -1.38122, 0, 1, 0.6235294, 1,
-0.1352802, -0.4727218, -2.743037, 0, 1, 0.627451, 1,
-0.1317643, -0.5911306, -3.092793, 0, 1, 0.6352941, 1,
-0.1307003, -0.03452436, -2.683441, 0, 1, 0.6392157, 1,
-0.1256377, 1.047963, 0.2774315, 0, 1, 0.6470588, 1,
-0.1256313, 0.356919, -0.29985, 0, 1, 0.6509804, 1,
-0.1234448, 0.2433202, 1.938617, 0, 1, 0.6588235, 1,
-0.1234191, 1.047875, -0.3332901, 0, 1, 0.6627451, 1,
-0.1233689, -1.478471, -3.79467, 0, 1, 0.6705883, 1,
-0.1207669, 1.182953, -0.7964395, 0, 1, 0.6745098, 1,
-0.1207201, 0.328807, 0.2739892, 0, 1, 0.682353, 1,
-0.1206722, 0.5446739, -1.038448, 0, 1, 0.6862745, 1,
-0.1197523, 0.523414, 0.9835541, 0, 1, 0.6941177, 1,
-0.1189961, 0.6507275, -0.7145985, 0, 1, 0.7019608, 1,
-0.1185408, 1.186635, 0.8400092, 0, 1, 0.7058824, 1,
-0.1183383, -0.7723081, -1.646038, 0, 1, 0.7137255, 1,
-0.1166136, 0.2091284, -0.885223, 0, 1, 0.7176471, 1,
-0.1165636, -0.5019822, -1.341629, 0, 1, 0.7254902, 1,
-0.1158788, 0.8763399, 0.9860602, 0, 1, 0.7294118, 1,
-0.1139891, 1.241455, 0.9645351, 0, 1, 0.7372549, 1,
-0.112521, -0.3049729, -2.500724, 0, 1, 0.7411765, 1,
-0.1090724, 0.6080315, -0.00709861, 0, 1, 0.7490196, 1,
-0.1076344, -0.8933257, -3.432754, 0, 1, 0.7529412, 1,
-0.1031473, 1.466363, 0.2966538, 0, 1, 0.7607843, 1,
-0.09764663, 1.11221, 0.01566843, 0, 1, 0.7647059, 1,
-0.09495346, -0.2314033, -3.504457, 0, 1, 0.772549, 1,
-0.09443377, 0.5581846, -0.8859928, 0, 1, 0.7764706, 1,
-0.09347899, 0.9748819, -0.348092, 0, 1, 0.7843137, 1,
-0.09152456, 0.1875552, -1.151803, 0, 1, 0.7882353, 1,
-0.08613443, -0.5084094, -2.128805, 0, 1, 0.7960784, 1,
-0.08089809, 0.5788023, -0.6928213, 0, 1, 0.8039216, 1,
-0.06689513, 0.07523906, -0.5237986, 0, 1, 0.8078431, 1,
-0.06432503, 1.723689, -0.5652588, 0, 1, 0.8156863, 1,
-0.06410499, 0.9516404, 0.7340649, 0, 1, 0.8196079, 1,
-0.06055329, -0.4217121, -5.088806, 0, 1, 0.827451, 1,
-0.05958502, 1.138484, 0.6338928, 0, 1, 0.8313726, 1,
-0.05377026, 0.5399898, 0.1366535, 0, 1, 0.8392157, 1,
-0.05170006, -0.9193807, -1.315789, 0, 1, 0.8431373, 1,
-0.04993348, 1.290981, 0.2119324, 0, 1, 0.8509804, 1,
-0.04557171, -0.8310905, -3.380024, 0, 1, 0.854902, 1,
-0.04419029, -1.341919, -3.02224, 0, 1, 0.8627451, 1,
-0.04278732, 0.7140349, 0.3341271, 0, 1, 0.8666667, 1,
-0.04231373, 0.4603356, 0.1320874, 0, 1, 0.8745098, 1,
-0.04213243, -1.311266, -3.404706, 0, 1, 0.8784314, 1,
-0.04192084, 1.11253, -0.8299805, 0, 1, 0.8862745, 1,
-0.04046078, 0.3488472, 0.5802827, 0, 1, 0.8901961, 1,
-0.03968005, 0.5015281, -0.7107877, 0, 1, 0.8980392, 1,
-0.03793954, -0.6057269, -3.761337, 0, 1, 0.9058824, 1,
-0.03738422, -0.02441239, -3.044424, 0, 1, 0.9098039, 1,
-0.03610051, -0.4902714, -2.82675, 0, 1, 0.9176471, 1,
-0.03457765, 1.157878, 0.2472962, 0, 1, 0.9215686, 1,
-0.0329094, 0.6453965, -0.1478626, 0, 1, 0.9294118, 1,
-0.032189, 0.7033737, -0.6237009, 0, 1, 0.9333333, 1,
-0.03024746, -2.906728, -3.599064, 0, 1, 0.9411765, 1,
-0.0230497, -0.3554373, -3.420752, 0, 1, 0.945098, 1,
-0.02135203, -0.2794638, -3.400236, 0, 1, 0.9529412, 1,
-0.02120469, -0.4432494, -4.734872, 0, 1, 0.9568627, 1,
-0.01958651, 2.17764, -0.3840955, 0, 1, 0.9647059, 1,
-0.01929376, -0.6127709, -3.544325, 0, 1, 0.9686275, 1,
-0.01850513, -1.335781, -4.31794, 0, 1, 0.9764706, 1,
-0.01656145, -0.06069158, -3.206791, 0, 1, 0.9803922, 1,
-0.01570331, -0.0726334, -4.330946, 0, 1, 0.9882353, 1,
-0.01483685, 0.01346748, -1.792758, 0, 1, 0.9921569, 1,
-0.01315593, 1.605546, 1.150424, 0, 1, 1, 1,
-0.01045877, -0.3437226, -3.888285, 0, 0.9921569, 1, 1,
-0.003703836, -1.045856, -2.752059, 0, 0.9882353, 1, 1,
-0.0007168382, -0.9489278, -2.183718, 0, 0.9803922, 1, 1,
0.003042393, -1.774891, 3.682848, 0, 0.9764706, 1, 1,
0.006015403, -0.2436593, 3.318801, 0, 0.9686275, 1, 1,
0.00745779, 0.9479014, -0.5273644, 0, 0.9647059, 1, 1,
0.01072915, 0.9619187, -0.6856436, 0, 0.9568627, 1, 1,
0.01114676, 0.1821158, 0.2115873, 0, 0.9529412, 1, 1,
0.01360133, 0.6554081, -0.6261966, 0, 0.945098, 1, 1,
0.01579866, 0.2544635, -0.1853309, 0, 0.9411765, 1, 1,
0.01808771, -1.063385, 3.687646, 0, 0.9333333, 1, 1,
0.01989847, 0.0164461, 1.909202, 0, 0.9294118, 1, 1,
0.01997059, 0.0832276, -1.844838, 0, 0.9215686, 1, 1,
0.02871622, -1.016528, 4.417573, 0, 0.9176471, 1, 1,
0.02906985, -0.6299149, 2.783875, 0, 0.9098039, 1, 1,
0.03131081, 0.6000619, 0.9763697, 0, 0.9058824, 1, 1,
0.03587165, 1.370206, 0.5668077, 0, 0.8980392, 1, 1,
0.03625484, -1.294757, 0.9597329, 0, 0.8901961, 1, 1,
0.03915479, 0.3632716, 0.6305677, 0, 0.8862745, 1, 1,
0.04248771, 1.366092, 0.119134, 0, 0.8784314, 1, 1,
0.04506342, -1.231483, 4.189224, 0, 0.8745098, 1, 1,
0.04820481, -1.422128, 0.9717402, 0, 0.8666667, 1, 1,
0.05176513, 1.835662, -0.1415049, 0, 0.8627451, 1, 1,
0.05300064, 1.009829, 1.909373, 0, 0.854902, 1, 1,
0.05440234, 1.543239, -0.1656497, 0, 0.8509804, 1, 1,
0.05684144, -0.5693548, 2.892173, 0, 0.8431373, 1, 1,
0.05787508, 0.1502168, -0.135042, 0, 0.8392157, 1, 1,
0.05975561, -0.6341603, 2.613138, 0, 0.8313726, 1, 1,
0.06756438, 1.182095, 1.180383, 0, 0.827451, 1, 1,
0.06851844, 1.89774, 0.06437921, 0, 0.8196079, 1, 1,
0.07168931, 0.905256, 1.866223, 0, 0.8156863, 1, 1,
0.07177459, -0.1864212, 3.44198, 0, 0.8078431, 1, 1,
0.07293415, -1.779042, 3.793027, 0, 0.8039216, 1, 1,
0.07430822, -1.298149, 1.578047, 0, 0.7960784, 1, 1,
0.07631619, 0.6660427, 1.151551, 0, 0.7882353, 1, 1,
0.08126886, 0.4614052, -0.4659733, 0, 0.7843137, 1, 1,
0.08277646, -0.2949459, 4.174988, 0, 0.7764706, 1, 1,
0.08652387, 0.2104146, 1.600298, 0, 0.772549, 1, 1,
0.08697794, -0.3123165, 1.293158, 0, 0.7647059, 1, 1,
0.089039, 0.2046854, 2.375641, 0, 0.7607843, 1, 1,
0.08986834, 0.8946196, 1.014318, 0, 0.7529412, 1, 1,
0.0909248, 0.3937653, 0.6532274, 0, 0.7490196, 1, 1,
0.09187213, 1.04309, -0.4911518, 0, 0.7411765, 1, 1,
0.09274793, -1.083522, 2.57387, 0, 0.7372549, 1, 1,
0.09716809, 0.1848278, 2.764565, 0, 0.7294118, 1, 1,
0.09848328, -1.075683, 2.397875, 0, 0.7254902, 1, 1,
0.1007497, -0.4239602, 3.067177, 0, 0.7176471, 1, 1,
0.1015141, -0.2310258, 2.19607, 0, 0.7137255, 1, 1,
0.1039495, 0.9231461, -1.105877, 0, 0.7058824, 1, 1,
0.1054024, 0.2251431, 0.6310405, 0, 0.6980392, 1, 1,
0.1083808, 0.3564097, 0.2867388, 0, 0.6941177, 1, 1,
0.1102097, 0.7203172, -0.1738549, 0, 0.6862745, 1, 1,
0.1137678, 0.005178417, 1.067509, 0, 0.682353, 1, 1,
0.1171608, 0.6826171, -0.07752559, 0, 0.6745098, 1, 1,
0.1216608, 0.4763796, -0.222216, 0, 0.6705883, 1, 1,
0.1223081, 0.9185106, -0.3963551, 0, 0.6627451, 1, 1,
0.1259829, 0.3326173, 1.05017, 0, 0.6588235, 1, 1,
0.1301967, 0.6078241, 1.163867, 0, 0.6509804, 1, 1,
0.1335047, -1.080619, 2.106694, 0, 0.6470588, 1, 1,
0.1356259, 0.8314165, -0.8422592, 0, 0.6392157, 1, 1,
0.1394535, 1.464588, 0.8327971, 0, 0.6352941, 1, 1,
0.1402714, 1.409599, 0.807333, 0, 0.627451, 1, 1,
0.1433174, 1.6875, -0.08451574, 0, 0.6235294, 1, 1,
0.1435675, 0.3552995, 0.7718182, 0, 0.6156863, 1, 1,
0.144697, 0.7404634, -1.395652, 0, 0.6117647, 1, 1,
0.1466851, 0.9573388, 0.8127367, 0, 0.6039216, 1, 1,
0.1527114, -0.8913656, 2.468329, 0, 0.5960785, 1, 1,
0.154428, 0.4539607, 1.400639, 0, 0.5921569, 1, 1,
0.1586309, -0.296674, 2.750579, 0, 0.5843138, 1, 1,
0.1630473, -0.9512597, 2.998776, 0, 0.5803922, 1, 1,
0.164112, -0.7160152, 2.332705, 0, 0.572549, 1, 1,
0.1641872, -0.1924756, 3.078451, 0, 0.5686275, 1, 1,
0.1685956, -0.352015, 4.202474, 0, 0.5607843, 1, 1,
0.1738666, -2.199534, 1.990463, 0, 0.5568628, 1, 1,
0.1808265, -0.5960836, 2.530528, 0, 0.5490196, 1, 1,
0.1865238, -0.7869965, 1.845553, 0, 0.5450981, 1, 1,
0.1869522, -0.7015681, 3.889032, 0, 0.5372549, 1, 1,
0.1953359, 2.087136, -0.2349508, 0, 0.5333334, 1, 1,
0.1959918, -0.6147169, 4.569403, 0, 0.5254902, 1, 1,
0.1961235, 0.2406356, 0.8995671, 0, 0.5215687, 1, 1,
0.199543, 1.200555, -0.243301, 0, 0.5137255, 1, 1,
0.2006173, 0.2468132, 0.8555114, 0, 0.509804, 1, 1,
0.201558, 0.2600791, 1.333903, 0, 0.5019608, 1, 1,
0.2017347, 0.7305671, 1.855925, 0, 0.4941176, 1, 1,
0.2030193, 0.0913828, 1.642059, 0, 0.4901961, 1, 1,
0.2047758, -0.05127027, 2.685495, 0, 0.4823529, 1, 1,
0.2104921, 1.082062, 0.7239799, 0, 0.4784314, 1, 1,
0.2130127, 0.3050296, 0.8756171, 0, 0.4705882, 1, 1,
0.2141407, -0.08827068, 1.266408, 0, 0.4666667, 1, 1,
0.2154595, 1.388131, -1.743568, 0, 0.4588235, 1, 1,
0.2159734, -0.4042039, 1.959951, 0, 0.454902, 1, 1,
0.2200765, 0.5514927, -0.3640483, 0, 0.4470588, 1, 1,
0.2234849, -0.2917897, 2.313167, 0, 0.4431373, 1, 1,
0.2322356, -0.1744858, 3.485243, 0, 0.4352941, 1, 1,
0.2323274, 0.320806, 1.111184, 0, 0.4313726, 1, 1,
0.2338044, 0.3647054, -0.2093106, 0, 0.4235294, 1, 1,
0.2371296, -0.003829693, 1.2572, 0, 0.4196078, 1, 1,
0.2376589, 0.2724276, 0.4428241, 0, 0.4117647, 1, 1,
0.2407156, -1.333257, 1.985811, 0, 0.4078431, 1, 1,
0.2454323, 1.054601, -0.369873, 0, 0.4, 1, 1,
0.2461835, -1.153921, 2.840168, 0, 0.3921569, 1, 1,
0.2528275, 1.768838, -0.8988851, 0, 0.3882353, 1, 1,
0.2541533, 0.589372, 0.01924913, 0, 0.3803922, 1, 1,
0.2557689, 0.4349096, 1.761211, 0, 0.3764706, 1, 1,
0.2614595, -1.117705, 2.862074, 0, 0.3686275, 1, 1,
0.2615989, -1.57222, 3.226126, 0, 0.3647059, 1, 1,
0.2661552, -0.8447376, 2.248194, 0, 0.3568628, 1, 1,
0.2693593, -1.355904, 3.303322, 0, 0.3529412, 1, 1,
0.2700342, -0.5780949, 2.341193, 0, 0.345098, 1, 1,
0.2717314, -0.3586358, 2.860909, 0, 0.3411765, 1, 1,
0.2763014, 1.289565, -1.890578, 0, 0.3333333, 1, 1,
0.2772614, -0.4202097, 2.491214, 0, 0.3294118, 1, 1,
0.2773831, -0.06854009, 0.6715042, 0, 0.3215686, 1, 1,
0.2782536, 0.8208234, 0.562319, 0, 0.3176471, 1, 1,
0.2822091, 1.839834, 0.6781049, 0, 0.3098039, 1, 1,
0.2824031, -0.5546469, 4.932959, 0, 0.3058824, 1, 1,
0.2865789, 2.310282, 0.4932745, 0, 0.2980392, 1, 1,
0.2892803, -0.4806162, 2.03124, 0, 0.2901961, 1, 1,
0.2899799, 0.1127417, 1.135299, 0, 0.2862745, 1, 1,
0.2929683, -1.755462, 4.58438, 0, 0.2784314, 1, 1,
0.2932001, 0.06465757, 1.067402, 0, 0.2745098, 1, 1,
0.2968242, -2.798231, 3.067633, 0, 0.2666667, 1, 1,
0.2970908, 2.089092, -0.305588, 0, 0.2627451, 1, 1,
0.2985191, 1.014127, 0.941116, 0, 0.254902, 1, 1,
0.3017706, -0.3345551, 2.196451, 0, 0.2509804, 1, 1,
0.3019348, -0.08928394, 1.855231, 0, 0.2431373, 1, 1,
0.3067033, 1.759204, 0.6802411, 0, 0.2392157, 1, 1,
0.3067931, -0.8129089, 2.48061, 0, 0.2313726, 1, 1,
0.3095785, -0.131377, 2.73322, 0, 0.227451, 1, 1,
0.3112286, 0.6337183, 1.129688, 0, 0.2196078, 1, 1,
0.3129123, -1.160854, 3.990556, 0, 0.2156863, 1, 1,
0.3169061, 1.188984, 0.2631083, 0, 0.2078431, 1, 1,
0.3201866, -0.1622929, 2.22084, 0, 0.2039216, 1, 1,
0.3243796, 1.556577, -0.8483469, 0, 0.1960784, 1, 1,
0.3245538, -1.03134, 3.60006, 0, 0.1882353, 1, 1,
0.3247471, 1.793818, 0.1378329, 0, 0.1843137, 1, 1,
0.3278162, 1.356329, 0.2723045, 0, 0.1764706, 1, 1,
0.3293257, 1.634385, -1.295504, 0, 0.172549, 1, 1,
0.3318461, -0.8984073, 2.932064, 0, 0.1647059, 1, 1,
0.3360499, -1.070611, 4.337636, 0, 0.1607843, 1, 1,
0.3367007, 0.5638857, 0.589502, 0, 0.1529412, 1, 1,
0.338665, -0.2134279, 0.9552695, 0, 0.1490196, 1, 1,
0.3411033, 0.559917, 1.532909, 0, 0.1411765, 1, 1,
0.3462565, 0.8036432, 1.252114, 0, 0.1372549, 1, 1,
0.3493644, -1.62715, 1.533192, 0, 0.1294118, 1, 1,
0.3509874, -1.410458, 2.779351, 0, 0.1254902, 1, 1,
0.3560449, -0.6741479, 2.873888, 0, 0.1176471, 1, 1,
0.3656088, 1.406412, -0.1975285, 0, 0.1137255, 1, 1,
0.368053, -0.2575322, 1.346617, 0, 0.1058824, 1, 1,
0.3692315, 0.8458508, 0.6817221, 0, 0.09803922, 1, 1,
0.3713824, 0.09234498, 0.4661776, 0, 0.09411765, 1, 1,
0.3742683, -1.214584, 4.239648, 0, 0.08627451, 1, 1,
0.3751725, -0.3826129, 2.216138, 0, 0.08235294, 1, 1,
0.3818443, 0.6787832, 0.2798517, 0, 0.07450981, 1, 1,
0.3834184, 0.3395572, 1.561945, 0, 0.07058824, 1, 1,
0.3896436, -0.7488112, 2.486832, 0, 0.0627451, 1, 1,
0.3901469, 0.4970292, 0.9331709, 0, 0.05882353, 1, 1,
0.3902428, 0.9507852, 2.276815, 0, 0.05098039, 1, 1,
0.3965096, 0.2208906, 0.6145096, 0, 0.04705882, 1, 1,
0.3976666, 0.9778551, 2.851321, 0, 0.03921569, 1, 1,
0.3979277, -0.382572, 1.796363, 0, 0.03529412, 1, 1,
0.4011613, 0.3984778, 0.2240348, 0, 0.02745098, 1, 1,
0.4049191, 1.962681, 0.1936091, 0, 0.02352941, 1, 1,
0.4060935, 0.1352372, 2.215105, 0, 0.01568628, 1, 1,
0.4077911, 1.159191, -0.8503535, 0, 0.01176471, 1, 1,
0.4084024, 0.3406819, 1.169757, 0, 0.003921569, 1, 1,
0.4091911, -0.2581786, 0.89769, 0.003921569, 0, 1, 1,
0.4105997, 1.174151, -1.220603, 0.007843138, 0, 1, 1,
0.4131399, 1.42123, 0.1055834, 0.01568628, 0, 1, 1,
0.4140165, -0.7755795, 1.274159, 0.01960784, 0, 1, 1,
0.4147087, -0.4625097, 2.136242, 0.02745098, 0, 1, 1,
0.419793, -0.1925638, 2.779599, 0.03137255, 0, 1, 1,
0.4201619, -0.3071482, 2.3754, 0.03921569, 0, 1, 1,
0.4254442, 0.9842809, 0.3180205, 0.04313726, 0, 1, 1,
0.4263042, -0.9817997, 1.455905, 0.05098039, 0, 1, 1,
0.4353841, 1.775875, -1.18502, 0.05490196, 0, 1, 1,
0.4372267, 0.4081809, 1.793018, 0.0627451, 0, 1, 1,
0.4395682, 1.81022, 0.9863742, 0.06666667, 0, 1, 1,
0.4402097, -0.5490968, 1.406234, 0.07450981, 0, 1, 1,
0.4447603, 0.09307626, 1.619817, 0.07843138, 0, 1, 1,
0.4452571, -0.7075515, 2.978729, 0.08627451, 0, 1, 1,
0.4460987, -0.2518851, 0.05736962, 0.09019608, 0, 1, 1,
0.4469687, -1.580225, 1.404312, 0.09803922, 0, 1, 1,
0.4496373, -0.9593872, 2.349934, 0.1058824, 0, 1, 1,
0.4514582, -0.07443663, 0.4865346, 0.1098039, 0, 1, 1,
0.4605557, -0.5147185, 0.6061211, 0.1176471, 0, 1, 1,
0.4623868, -1.054937, 2.466046, 0.1215686, 0, 1, 1,
0.4659199, 1.513868, 1.454934, 0.1294118, 0, 1, 1,
0.466112, -0.7321103, 2.505213, 0.1333333, 0, 1, 1,
0.4684078, -1.186067, 3.460304, 0.1411765, 0, 1, 1,
0.478473, 2.008543, -1.129055, 0.145098, 0, 1, 1,
0.4835568, -0.2927891, 2.721237, 0.1529412, 0, 1, 1,
0.4889506, -0.8984123, 1.250898, 0.1568628, 0, 1, 1,
0.4893532, 0.2879946, 1.001335, 0.1647059, 0, 1, 1,
0.4900422, 1.048408, 1.629697, 0.1686275, 0, 1, 1,
0.4911409, -1.038223, 3.452691, 0.1764706, 0, 1, 1,
0.4922531, 0.4194255, 0.8044071, 0.1803922, 0, 1, 1,
0.4922914, 0.1317047, 1.062438, 0.1882353, 0, 1, 1,
0.4936887, -0.1280531, 1.940204, 0.1921569, 0, 1, 1,
0.4968535, 0.5163697, -0.3684609, 0.2, 0, 1, 1,
0.502156, 0.4329697, -1.87009, 0.2078431, 0, 1, 1,
0.5026681, 0.8100821, 1.281434, 0.2117647, 0, 1, 1,
0.5031046, -0.6035433, 1.396608, 0.2196078, 0, 1, 1,
0.5068069, 0.2303622, 1.143124, 0.2235294, 0, 1, 1,
0.5068426, 0.7487915, 0.5862987, 0.2313726, 0, 1, 1,
0.5080703, -0.436338, 2.817698, 0.2352941, 0, 1, 1,
0.5121178, -1.209079, 2.737085, 0.2431373, 0, 1, 1,
0.5149936, 0.3390505, -0.7753741, 0.2470588, 0, 1, 1,
0.5190203, -0.5958674, 4.200596, 0.254902, 0, 1, 1,
0.5224283, -1.521887, 1.63708, 0.2588235, 0, 1, 1,
0.5233741, 1.278796, 0.83991, 0.2666667, 0, 1, 1,
0.5248073, 0.3785273, 1.007997, 0.2705882, 0, 1, 1,
0.5262721, 0.7163379, 2.058218, 0.2784314, 0, 1, 1,
0.5298562, 0.03473247, 2.728943, 0.282353, 0, 1, 1,
0.5318612, -0.9266852, 2.080689, 0.2901961, 0, 1, 1,
0.532077, 0.9331678, -0.07287002, 0.2941177, 0, 1, 1,
0.537775, -1.297113, 3.13862, 0.3019608, 0, 1, 1,
0.5378943, -0.5215491, 2.315742, 0.3098039, 0, 1, 1,
0.5396128, 0.3312506, 1.289486, 0.3137255, 0, 1, 1,
0.5399274, 0.2950172, 3.230976, 0.3215686, 0, 1, 1,
0.5414619, -1.162974, 2.433307, 0.3254902, 0, 1, 1,
0.5427852, -0.678072, 1.756833, 0.3333333, 0, 1, 1,
0.5450554, -1.328776, 1.933735, 0.3372549, 0, 1, 1,
0.5458015, 0.2517772, 0.6457487, 0.345098, 0, 1, 1,
0.5477283, -1.626188, 2.988467, 0.3490196, 0, 1, 1,
0.549032, 1.711771, 1.294832, 0.3568628, 0, 1, 1,
0.5496686, -0.1955366, 0.211576, 0.3607843, 0, 1, 1,
0.5550531, 1.222448, 3.367156, 0.3686275, 0, 1, 1,
0.5624823, 0.6355974, -0.7013566, 0.372549, 0, 1, 1,
0.5635559, 1.530673, 1.843202, 0.3803922, 0, 1, 1,
0.5635798, -2.002658, 1.752076, 0.3843137, 0, 1, 1,
0.5637068, 2.042305, 2.400797, 0.3921569, 0, 1, 1,
0.5674363, 0.3412158, 2.112432, 0.3960784, 0, 1, 1,
0.5721044, -0.7063872, 2.441006, 0.4039216, 0, 1, 1,
0.5752242, 2.097751, 0.1242766, 0.4117647, 0, 1, 1,
0.5799336, -0.9328257, 1.722063, 0.4156863, 0, 1, 1,
0.581084, 0.9287285, 1.208731, 0.4235294, 0, 1, 1,
0.585683, 0.2337743, 1.979085, 0.427451, 0, 1, 1,
0.5866516, -0.5335615, 2.034971, 0.4352941, 0, 1, 1,
0.5887414, 0.3178643, 0.5324968, 0.4392157, 0, 1, 1,
0.5926921, -0.07886737, 2.596879, 0.4470588, 0, 1, 1,
0.594396, -1.588183, 3.077072, 0.4509804, 0, 1, 1,
0.5955557, -1.396775, 3.517237, 0.4588235, 0, 1, 1,
0.6122539, -0.5386842, 0.1691708, 0.4627451, 0, 1, 1,
0.6124515, 0.210383, 0.274847, 0.4705882, 0, 1, 1,
0.6142104, 0.0635378, 0.4986391, 0.4745098, 0, 1, 1,
0.6151115, -1.238783, 2.589038, 0.4823529, 0, 1, 1,
0.622595, -0.6367941, 3.509861, 0.4862745, 0, 1, 1,
0.6235085, 0.09689301, 1.925622, 0.4941176, 0, 1, 1,
0.6267719, 1.131448, -0.2512019, 0.5019608, 0, 1, 1,
0.6274388, 0.820494, 1.839794, 0.5058824, 0, 1, 1,
0.6309869, 2.061179, 1.029265, 0.5137255, 0, 1, 1,
0.6332349, -0.9588274, 3.878549, 0.5176471, 0, 1, 1,
0.6361147, 0.5258628, 1.449157, 0.5254902, 0, 1, 1,
0.6376569, 0.7098389, 2.941623, 0.5294118, 0, 1, 1,
0.642066, 1.208095, 0.4466516, 0.5372549, 0, 1, 1,
0.6435204, 1.183536, -0.6218853, 0.5411765, 0, 1, 1,
0.6441883, -0.5321777, 2.051069, 0.5490196, 0, 1, 1,
0.6556602, 0.3011476, 1.425288, 0.5529412, 0, 1, 1,
0.6560568, 1.192311, 0.8615293, 0.5607843, 0, 1, 1,
0.6609629, -0.4737355, 4.149881, 0.5647059, 0, 1, 1,
0.6654164, 0.4155208, -0.4954102, 0.572549, 0, 1, 1,
0.6746596, -0.7877899, 1.630475, 0.5764706, 0, 1, 1,
0.675727, 0.4816456, 2.250228, 0.5843138, 0, 1, 1,
0.6831098, -1.275576, 1.837727, 0.5882353, 0, 1, 1,
0.6882676, -0.2785754, 1.206903, 0.5960785, 0, 1, 1,
0.6902275, -0.3417273, 2.987411, 0.6039216, 0, 1, 1,
0.6937114, -1.506799, 4.607877, 0.6078432, 0, 1, 1,
0.6961375, -1.519011, 2.807376, 0.6156863, 0, 1, 1,
0.7068402, -1.891608, 2.922167, 0.6196079, 0, 1, 1,
0.7176447, -0.02341039, 2.033259, 0.627451, 0, 1, 1,
0.7192642, 0.9531056, 0.2483195, 0.6313726, 0, 1, 1,
0.7295735, -0.1868215, 2.067321, 0.6392157, 0, 1, 1,
0.7303171, 1.304969, -1.065818, 0.6431373, 0, 1, 1,
0.7348013, 0.5591568, 3.033204, 0.6509804, 0, 1, 1,
0.7384202, -0.468866, 2.648515, 0.654902, 0, 1, 1,
0.7432793, 1.381757, 0.7011657, 0.6627451, 0, 1, 1,
0.7442995, -0.1896884, 1.886368, 0.6666667, 0, 1, 1,
0.7481876, 0.6792191, -1.156241, 0.6745098, 0, 1, 1,
0.7487666, -0.7667751, 4.237926, 0.6784314, 0, 1, 1,
0.7536762, -0.3398603, 2.07697, 0.6862745, 0, 1, 1,
0.7589874, -1.045508, 1.836526, 0.6901961, 0, 1, 1,
0.7603575, 1.332888, -0.623986, 0.6980392, 0, 1, 1,
0.7612936, -0.4277503, 2.496187, 0.7058824, 0, 1, 1,
0.7629547, -0.2204159, 0.7853826, 0.7098039, 0, 1, 1,
0.7667335, 0.5553256, 0.3206524, 0.7176471, 0, 1, 1,
0.7760017, -1.213081, 1.837772, 0.7215686, 0, 1, 1,
0.7793851, 1.111799, -1.211488, 0.7294118, 0, 1, 1,
0.7804537, -0.6461003, 2.565559, 0.7333333, 0, 1, 1,
0.7854973, -1.593665, 4.647117, 0.7411765, 0, 1, 1,
0.7868978, -1.616538, 2.707337, 0.7450981, 0, 1, 1,
0.7888502, -0.3709776, 1.447607, 0.7529412, 0, 1, 1,
0.8092924, 1.050705, 1.502317, 0.7568628, 0, 1, 1,
0.815706, 1.074909, 1.43459, 0.7647059, 0, 1, 1,
0.8296426, -0.6853501, 1.952017, 0.7686275, 0, 1, 1,
0.8307145, 0.3838615, 1.139071, 0.7764706, 0, 1, 1,
0.8391638, 0.7943599, 0.2050776, 0.7803922, 0, 1, 1,
0.8400148, 1.00428, -0.9756914, 0.7882353, 0, 1, 1,
0.8401018, 0.3312643, 0.9657788, 0.7921569, 0, 1, 1,
0.8443498, 0.3134587, 0.1772588, 0.8, 0, 1, 1,
0.8466652, 0.0224825, 0.7649995, 0.8078431, 0, 1, 1,
0.8476648, -1.777133, 3.973205, 0.8117647, 0, 1, 1,
0.8525158, 0.02187789, 1.850259, 0.8196079, 0, 1, 1,
0.8533432, 0.1899148, 1.609613, 0.8235294, 0, 1, 1,
0.8541721, -1.364722, 3.00604, 0.8313726, 0, 1, 1,
0.8550949, 0.373611, 1.227287, 0.8352941, 0, 1, 1,
0.8660621, 0.150414, -0.02988954, 0.8431373, 0, 1, 1,
0.8792023, -1.529037, 2.381773, 0.8470588, 0, 1, 1,
0.8848301, 0.1725871, 1.687147, 0.854902, 0, 1, 1,
0.8849066, -0.1481764, 1.804332, 0.8588235, 0, 1, 1,
0.885042, -0.04590771, 1.664251, 0.8666667, 0, 1, 1,
0.8909583, -2.756315, 2.92712, 0.8705882, 0, 1, 1,
0.8912286, -0.04179066, 2.351803, 0.8784314, 0, 1, 1,
0.9023699, 0.4998329, 1.049446, 0.8823529, 0, 1, 1,
0.9030141, 0.2956562, 1.513815, 0.8901961, 0, 1, 1,
0.9095912, 1.206997, 0.8677742, 0.8941177, 0, 1, 1,
0.9130973, -0.8186185, 3.221482, 0.9019608, 0, 1, 1,
0.9171625, 0.6971332, 0.4400142, 0.9098039, 0, 1, 1,
0.9181114, -0.4380426, 0.2917916, 0.9137255, 0, 1, 1,
0.9218447, -1.08166, 2.522007, 0.9215686, 0, 1, 1,
0.9249894, 0.6196365, 1.145397, 0.9254902, 0, 1, 1,
0.9280887, 0.6772982, 0.7018849, 0.9333333, 0, 1, 1,
0.942881, -2.14834, 2.916851, 0.9372549, 0, 1, 1,
0.9445642, -0.2365696, 1.947582, 0.945098, 0, 1, 1,
0.9458148, -0.2096524, 1.945319, 0.9490196, 0, 1, 1,
0.9473286, -1.03535, 1.938004, 0.9568627, 0, 1, 1,
0.9483707, 0.08163562, 1.820475, 0.9607843, 0, 1, 1,
0.9596011, -1.334911, 2.380152, 0.9686275, 0, 1, 1,
0.9625278, 1.158457, -0.7354096, 0.972549, 0, 1, 1,
0.9723716, -0.5909527, 1.961893, 0.9803922, 0, 1, 1,
0.9744763, -0.05541226, 2.595608, 0.9843137, 0, 1, 1,
0.9755079, 0.3764523, 0.92212, 0.9921569, 0, 1, 1,
0.9846448, 0.2557733, 0.5601252, 0.9960784, 0, 1, 1,
0.992901, 0.3126563, 1.513814, 1, 0, 0.9960784, 1,
0.996149, 0.6681939, 1.896182, 1, 0, 0.9882353, 1,
1.01025, -0.1531422, 1.065854, 1, 0, 0.9843137, 1,
1.017317, 1.504647, 1.237491, 1, 0, 0.9764706, 1,
1.021963, 0.9406677, -0.2452225, 1, 0, 0.972549, 1,
1.024704, -1.168887, 1.198457, 1, 0, 0.9647059, 1,
1.029144, 2.172616, 1.621472, 1, 0, 0.9607843, 1,
1.029641, -0.1876089, -0.4333953, 1, 0, 0.9529412, 1,
1.031318, -1.042544, 1.924542, 1, 0, 0.9490196, 1,
1.032835, -0.4087772, 3.00858, 1, 0, 0.9411765, 1,
1.033457, 0.4145312, 2.685479, 1, 0, 0.9372549, 1,
1.034415, 1.637389, -0.9377474, 1, 0, 0.9294118, 1,
1.041276, 1.262862, 0.6835687, 1, 0, 0.9254902, 1,
1.056725, 0.183749, 1.985384, 1, 0, 0.9176471, 1,
1.057095, 0.2736415, 1.869644, 1, 0, 0.9137255, 1,
1.057749, 1.043782, -0.01781094, 1, 0, 0.9058824, 1,
1.060951, 0.4108258, 0.7217374, 1, 0, 0.9019608, 1,
1.065616, -0.4111053, 3.745038, 1, 0, 0.8941177, 1,
1.065657, -1.107643, 0.8740802, 1, 0, 0.8862745, 1,
1.068997, -0.0796108, 2.300022, 1, 0, 0.8823529, 1,
1.075292, 1.449636, 1.273046, 1, 0, 0.8745098, 1,
1.085871, 1.26295, 1.448644, 1, 0, 0.8705882, 1,
1.086146, 0.5516137, -0.1720347, 1, 0, 0.8627451, 1,
1.087442, -1.112901, 1.276454, 1, 0, 0.8588235, 1,
1.092123, -0.1213107, 2.335514, 1, 0, 0.8509804, 1,
1.092677, 0.5998305, 0.4558035, 1, 0, 0.8470588, 1,
1.096203, -0.6017961, 3.256234, 1, 0, 0.8392157, 1,
1.097977, 1.065559, 2.310818, 1, 0, 0.8352941, 1,
1.099839, -0.9450228, -0.6253362, 1, 0, 0.827451, 1,
1.101997, 0.9437564, -0.03694801, 1, 0, 0.8235294, 1,
1.102033, -1.372165, 2.047613, 1, 0, 0.8156863, 1,
1.106013, -0.1581873, 1.295475, 1, 0, 0.8117647, 1,
1.110065, -0.9501691, 1.561505, 1, 0, 0.8039216, 1,
1.11212, -0.2199463, -1.26951, 1, 0, 0.7960784, 1,
1.132666, -0.5987849, 1.134008, 1, 0, 0.7921569, 1,
1.135941, -1.14816, 1.994386, 1, 0, 0.7843137, 1,
1.154843, 0.5282732, 0.2909585, 1, 0, 0.7803922, 1,
1.161356, -0.2174789, 2.772949, 1, 0, 0.772549, 1,
1.172659, -0.3862941, 1.515623, 1, 0, 0.7686275, 1,
1.177962, -0.332409, 1.025541, 1, 0, 0.7607843, 1,
1.179854, 0.386032, -0.266854, 1, 0, 0.7568628, 1,
1.179971, -0.6700115, 1.81211, 1, 0, 0.7490196, 1,
1.183252, -0.01231037, 1.528505, 1, 0, 0.7450981, 1,
1.193779, -0.2379589, 3.818661, 1, 0, 0.7372549, 1,
1.193811, 0.04871792, 2.303467, 1, 0, 0.7333333, 1,
1.204674, 1.192349, 0.9540092, 1, 0, 0.7254902, 1,
1.216659, 0.2795376, 0.5448753, 1, 0, 0.7215686, 1,
1.22264, -0.5795096, 2.897187, 1, 0, 0.7137255, 1,
1.225202, -1.331402, 0.9320951, 1, 0, 0.7098039, 1,
1.227262, -1.87901, 2.624062, 1, 0, 0.7019608, 1,
1.233083, 2.239746, 2.053147, 1, 0, 0.6941177, 1,
1.239105, -0.4538885, 2.107004, 1, 0, 0.6901961, 1,
1.241802, 0.943371, -0.004024375, 1, 0, 0.682353, 1,
1.244337, 1.693068, -0.2008292, 1, 0, 0.6784314, 1,
1.247556, -0.9955509, 1.29446, 1, 0, 0.6705883, 1,
1.248128, -0.1217067, 4.80007, 1, 0, 0.6666667, 1,
1.248919, -1.740727, 3.150568, 1, 0, 0.6588235, 1,
1.2492, 1.648088, -0.2381807, 1, 0, 0.654902, 1,
1.250587, -0.5513962, 1.887436, 1, 0, 0.6470588, 1,
1.259117, 1.168974, 1.126605, 1, 0, 0.6431373, 1,
1.261704, -2.44399, 6.610925, 1, 0, 0.6352941, 1,
1.274781, 1.130481, 1.083095, 1, 0, 0.6313726, 1,
1.28372, 1.040328, -0.8122593, 1, 0, 0.6235294, 1,
1.28941, 0.007580234, 2.248256, 1, 0, 0.6196079, 1,
1.310631, 0.1241088, -0.03819189, 1, 0, 0.6117647, 1,
1.318085, -0.7965174, 2.08244, 1, 0, 0.6078432, 1,
1.32525, -1.010427, 1.447786, 1, 0, 0.6, 1,
1.331775, -0.9938257, 2.617108, 1, 0, 0.5921569, 1,
1.333124, -0.9047466, 2.914944, 1, 0, 0.5882353, 1,
1.339444, 0.3936156, 1.471551, 1, 0, 0.5803922, 1,
1.339513, 0.8008827, 0.6255189, 1, 0, 0.5764706, 1,
1.347422, -0.7163173, 2.159051, 1, 0, 0.5686275, 1,
1.34777, 0.7751765, 0.3624654, 1, 0, 0.5647059, 1,
1.351101, 2.557061, 1.118052, 1, 0, 0.5568628, 1,
1.354669, 0.7209074, 0.8228603, 1, 0, 0.5529412, 1,
1.356376, 0.5793818, 1.538006, 1, 0, 0.5450981, 1,
1.364333, 0.7791719, 3.575364, 1, 0, 0.5411765, 1,
1.364781, -0.6508546, 1.864014, 1, 0, 0.5333334, 1,
1.369661, -1.521278, 3.103033, 1, 0, 0.5294118, 1,
1.370742, 1.794735, -0.7978389, 1, 0, 0.5215687, 1,
1.375747, 0.5935798, 1.334469, 1, 0, 0.5176471, 1,
1.380185, -0.2602739, 2.322692, 1, 0, 0.509804, 1,
1.389821, 0.04869416, 1.629473, 1, 0, 0.5058824, 1,
1.39213, 0.5724633, 0.7063317, 1, 0, 0.4980392, 1,
1.398274, 0.226358, 0.8494721, 1, 0, 0.4901961, 1,
1.399687, 1.474347, 1.197114, 1, 0, 0.4862745, 1,
1.400945, 0.06252801, 0.4397981, 1, 0, 0.4784314, 1,
1.411531, -0.3584987, 1.861052, 1, 0, 0.4745098, 1,
1.437031, -0.5750602, 1.584307, 1, 0, 0.4666667, 1,
1.45169, -0.2146218, 2.736918, 1, 0, 0.4627451, 1,
1.466245, 0.2769852, 2.158256, 1, 0, 0.454902, 1,
1.470522, 0.5146332, 0.5402275, 1, 0, 0.4509804, 1,
1.490264, 0.4286577, 0.5285746, 1, 0, 0.4431373, 1,
1.505077, -1.420998, 2.170257, 1, 0, 0.4392157, 1,
1.509682, 1.245963, 0.6094376, 1, 0, 0.4313726, 1,
1.510628, -0.1505253, 2.062581, 1, 0, 0.427451, 1,
1.511567, 1.876485, 1.325388, 1, 0, 0.4196078, 1,
1.514501, 0.8034762, 1.04167, 1, 0, 0.4156863, 1,
1.517161, -0.1949294, 1.600143, 1, 0, 0.4078431, 1,
1.53706, -0.2125129, 1.624722, 1, 0, 0.4039216, 1,
1.553316, -0.08014843, 1.726191, 1, 0, 0.3960784, 1,
1.576999, -0.7105108, 1.858485, 1, 0, 0.3882353, 1,
1.584523, -0.9010433, 1.334211, 1, 0, 0.3843137, 1,
1.595045, -1.003411, 2.136867, 1, 0, 0.3764706, 1,
1.603335, 0.2636568, 2.840812, 1, 0, 0.372549, 1,
1.60863, 1.141582, 0.5571231, 1, 0, 0.3647059, 1,
1.608836, 1.746743, 1.479697, 1, 0, 0.3607843, 1,
1.623803, 1.039312, 1.197176, 1, 0, 0.3529412, 1,
1.632856, 0.5484031, 0.7452419, 1, 0, 0.3490196, 1,
1.634558, -0.1713785, 2.100843, 1, 0, 0.3411765, 1,
1.639047, -0.8732966, 4.001506, 1, 0, 0.3372549, 1,
1.648475, -1.345681, 2.048703, 1, 0, 0.3294118, 1,
1.656432, 0.3406593, 2.245437, 1, 0, 0.3254902, 1,
1.686312, 0.4709857, 2.684825, 1, 0, 0.3176471, 1,
1.688703, 0.1533431, 1.059176, 1, 0, 0.3137255, 1,
1.689017, -0.5712824, 0.7134222, 1, 0, 0.3058824, 1,
1.691059, -1.855899, 1.706504, 1, 0, 0.2980392, 1,
1.711844, 0.171858, 0.2943357, 1, 0, 0.2941177, 1,
1.733411, -0.1778143, 0.04251901, 1, 0, 0.2862745, 1,
1.745997, -1.800598, 1.070847, 1, 0, 0.282353, 1,
1.750266, 1.887839, 0.6365402, 1, 0, 0.2745098, 1,
1.764419, 1.308471, 0.7579889, 1, 0, 0.2705882, 1,
1.774603, -1.383682, 1.664602, 1, 0, 0.2627451, 1,
1.776612, 0.1979749, 0.826924, 1, 0, 0.2588235, 1,
1.806615, -1.630631, 1.328498, 1, 0, 0.2509804, 1,
1.851041, -0.2039078, 0.5506957, 1, 0, 0.2470588, 1,
1.880959, 0.8516551, 0.6112124, 1, 0, 0.2392157, 1,
1.933697, 0.9929752, 2.090979, 1, 0, 0.2352941, 1,
1.933828, -0.484396, 0.1098574, 1, 0, 0.227451, 1,
1.95919, -0.3261926, 1.928161, 1, 0, 0.2235294, 1,
1.965839, 1.8568, 1.054371, 1, 0, 0.2156863, 1,
1.969659, -1.377167, 1.91082, 1, 0, 0.2117647, 1,
1.980611, 0.4035927, 3.763779, 1, 0, 0.2039216, 1,
2.051592, 1.160204, 2.289734, 1, 0, 0.1960784, 1,
2.053677, 3.120576, -0.7210172, 1, 0, 0.1921569, 1,
2.06807, -1.450169, 2.744498, 1, 0, 0.1843137, 1,
2.073934, -0.04917387, 1.113366, 1, 0, 0.1803922, 1,
2.117578, -0.4109339, 1.528333, 1, 0, 0.172549, 1,
2.15398, 0.1783746, 0.2827446, 1, 0, 0.1686275, 1,
2.156818, -1.372947, 1.672899, 1, 0, 0.1607843, 1,
2.17308, 0.5528035, 2.168099, 1, 0, 0.1568628, 1,
2.184773, -0.608915, 2.032235, 1, 0, 0.1490196, 1,
2.18682, 0.5214707, -0.4051975, 1, 0, 0.145098, 1,
2.193461, -0.1720003, 2.390817, 1, 0, 0.1372549, 1,
2.195466, 0.4717275, 1.969472, 1, 0, 0.1333333, 1,
2.204258, 0.6422386, -0.001845266, 1, 0, 0.1254902, 1,
2.204666, -0.7087759, -0.08777044, 1, 0, 0.1215686, 1,
2.204684, 0.1048697, 0.7617584, 1, 0, 0.1137255, 1,
2.205231, 0.8793145, 0.7798181, 1, 0, 0.1098039, 1,
2.213768, 2.639266, 0.2959643, 1, 0, 0.1019608, 1,
2.264502, 0.477105, 1.335112, 1, 0, 0.09411765, 1,
2.310981, -0.5758849, 0.2160553, 1, 0, 0.09019608, 1,
2.351508, 0.8896231, 1.704556, 1, 0, 0.08235294, 1,
2.375175, -2.077268, 3.244599, 1, 0, 0.07843138, 1,
2.394787, 0.1900258, 1.847489, 1, 0, 0.07058824, 1,
2.39752, -1.792101, 1.536536, 1, 0, 0.06666667, 1,
2.455553, 0.6599743, 2.184631, 1, 0, 0.05882353, 1,
2.462508, -0.1079532, 2.679988, 1, 0, 0.05490196, 1,
2.519948, 0.1281754, 1.489604, 1, 0, 0.04705882, 1,
2.580121, -1.438041, 1.915988, 1, 0, 0.04313726, 1,
2.611662, 0.5241078, -0.5236813, 1, 0, 0.03529412, 1,
2.69855, 1.090088, 2.055305, 1, 0, 0.03137255, 1,
2.790844, 0.009023329, 1.432652, 1, 0, 0.02352941, 1,
2.807153, -0.5780793, 3.001749, 1, 0, 0.01960784, 1,
2.951656, 0.7363506, 2.011108, 1, 0, 0.01176471, 1,
3.498721, 0.8178411, 1.470985, 1, 0, 0.007843138, 1
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
-0.03681278, -4.017612, -7.364179, 0, -0.5, 0.5, 0.5,
-0.03681278, -4.017612, -7.364179, 1, -0.5, 0.5, 0.5,
-0.03681278, -4.017612, -7.364179, 1, 1.5, 0.5, 0.5,
-0.03681278, -4.017612, -7.364179, 0, 1.5, 0.5, 0.5
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
-4.770893, 0.3702159, -7.364179, 0, -0.5, 0.5, 0.5,
-4.770893, 0.3702159, -7.364179, 1, -0.5, 0.5, 0.5,
-4.770893, 0.3702159, -7.364179, 1, 1.5, 0.5, 0.5,
-4.770893, 0.3702159, -7.364179, 0, 1.5, 0.5, 0.5
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
-4.770893, -4.017612, 0.6361051, 0, -0.5, 0.5, 0.5,
-4.770893, -4.017612, 0.6361051, 1, -0.5, 0.5, 0.5,
-4.770893, -4.017612, 0.6361051, 1, 1.5, 0.5, 0.5,
-4.770893, -4.017612, 0.6361051, 0, 1.5, 0.5, 0.5
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
-2, -3.005036, -5.517959,
2, -3.005036, -5.517959,
-2, -3.005036, -5.517959,
-2, -3.173799, -5.825663,
0, -3.005036, -5.517959,
0, -3.173799, -5.825663,
2, -3.005036, -5.517959,
2, -3.173799, -5.825663
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
-2, -3.511324, -6.441069, 0, -0.5, 0.5, 0.5,
-2, -3.511324, -6.441069, 1, -0.5, 0.5, 0.5,
-2, -3.511324, -6.441069, 1, 1.5, 0.5, 0.5,
-2, -3.511324, -6.441069, 0, 1.5, 0.5, 0.5,
0, -3.511324, -6.441069, 0, -0.5, 0.5, 0.5,
0, -3.511324, -6.441069, 1, -0.5, 0.5, 0.5,
0, -3.511324, -6.441069, 1, 1.5, 0.5, 0.5,
0, -3.511324, -6.441069, 0, 1.5, 0.5, 0.5,
2, -3.511324, -6.441069, 0, -0.5, 0.5, 0.5,
2, -3.511324, -6.441069, 1, -0.5, 0.5, 0.5,
2, -3.511324, -6.441069, 1, 1.5, 0.5, 0.5,
2, -3.511324, -6.441069, 0, 1.5, 0.5, 0.5
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
-3.678413, -2, -5.517959,
-3.678413, 3, -5.517959,
-3.678413, -2, -5.517959,
-3.860493, -2, -5.825663,
-3.678413, -1, -5.517959,
-3.860493, -1, -5.825663,
-3.678413, 0, -5.517959,
-3.860493, 0, -5.825663,
-3.678413, 1, -5.517959,
-3.860493, 1, -5.825663,
-3.678413, 2, -5.517959,
-3.860493, 2, -5.825663,
-3.678413, 3, -5.517959,
-3.860493, 3, -5.825663
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
-4.224653, -2, -6.441069, 0, -0.5, 0.5, 0.5,
-4.224653, -2, -6.441069, 1, -0.5, 0.5, 0.5,
-4.224653, -2, -6.441069, 1, 1.5, 0.5, 0.5,
-4.224653, -2, -6.441069, 0, 1.5, 0.5, 0.5,
-4.224653, -1, -6.441069, 0, -0.5, 0.5, 0.5,
-4.224653, -1, -6.441069, 1, -0.5, 0.5, 0.5,
-4.224653, -1, -6.441069, 1, 1.5, 0.5, 0.5,
-4.224653, -1, -6.441069, 0, 1.5, 0.5, 0.5,
-4.224653, 0, -6.441069, 0, -0.5, 0.5, 0.5,
-4.224653, 0, -6.441069, 1, -0.5, 0.5, 0.5,
-4.224653, 0, -6.441069, 1, 1.5, 0.5, 0.5,
-4.224653, 0, -6.441069, 0, 1.5, 0.5, 0.5,
-4.224653, 1, -6.441069, 0, -0.5, 0.5, 0.5,
-4.224653, 1, -6.441069, 1, -0.5, 0.5, 0.5,
-4.224653, 1, -6.441069, 1, 1.5, 0.5, 0.5,
-4.224653, 1, -6.441069, 0, 1.5, 0.5, 0.5,
-4.224653, 2, -6.441069, 0, -0.5, 0.5, 0.5,
-4.224653, 2, -6.441069, 1, -0.5, 0.5, 0.5,
-4.224653, 2, -6.441069, 1, 1.5, 0.5, 0.5,
-4.224653, 2, -6.441069, 0, 1.5, 0.5, 0.5,
-4.224653, 3, -6.441069, 0, -0.5, 0.5, 0.5,
-4.224653, 3, -6.441069, 1, -0.5, 0.5, 0.5,
-4.224653, 3, -6.441069, 1, 1.5, 0.5, 0.5,
-4.224653, 3, -6.441069, 0, 1.5, 0.5, 0.5
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
-3.678413, -3.005036, -4,
-3.678413, -3.005036, 6,
-3.678413, -3.005036, -4,
-3.860493, -3.173799, -4,
-3.678413, -3.005036, -2,
-3.860493, -3.173799, -2,
-3.678413, -3.005036, 0,
-3.860493, -3.173799, 0,
-3.678413, -3.005036, 2,
-3.860493, -3.173799, 2,
-3.678413, -3.005036, 4,
-3.860493, -3.173799, 4,
-3.678413, -3.005036, 6,
-3.860493, -3.173799, 6
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
-4.224653, -3.511324, -4, 0, -0.5, 0.5, 0.5,
-4.224653, -3.511324, -4, 1, -0.5, 0.5, 0.5,
-4.224653, -3.511324, -4, 1, 1.5, 0.5, 0.5,
-4.224653, -3.511324, -4, 0, 1.5, 0.5, 0.5,
-4.224653, -3.511324, -2, 0, -0.5, 0.5, 0.5,
-4.224653, -3.511324, -2, 1, -0.5, 0.5, 0.5,
-4.224653, -3.511324, -2, 1, 1.5, 0.5, 0.5,
-4.224653, -3.511324, -2, 0, 1.5, 0.5, 0.5,
-4.224653, -3.511324, 0, 0, -0.5, 0.5, 0.5,
-4.224653, -3.511324, 0, 1, -0.5, 0.5, 0.5,
-4.224653, -3.511324, 0, 1, 1.5, 0.5, 0.5,
-4.224653, -3.511324, 0, 0, 1.5, 0.5, 0.5,
-4.224653, -3.511324, 2, 0, -0.5, 0.5, 0.5,
-4.224653, -3.511324, 2, 1, -0.5, 0.5, 0.5,
-4.224653, -3.511324, 2, 1, 1.5, 0.5, 0.5,
-4.224653, -3.511324, 2, 0, 1.5, 0.5, 0.5,
-4.224653, -3.511324, 4, 0, -0.5, 0.5, 0.5,
-4.224653, -3.511324, 4, 1, -0.5, 0.5, 0.5,
-4.224653, -3.511324, 4, 1, 1.5, 0.5, 0.5,
-4.224653, -3.511324, 4, 0, 1.5, 0.5, 0.5,
-4.224653, -3.511324, 6, 0, -0.5, 0.5, 0.5,
-4.224653, -3.511324, 6, 1, -0.5, 0.5, 0.5,
-4.224653, -3.511324, 6, 1, 1.5, 0.5, 0.5,
-4.224653, -3.511324, 6, 0, 1.5, 0.5, 0.5
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
-3.678413, -3.005036, -5.517959,
-3.678413, 3.745468, -5.517959,
-3.678413, -3.005036, 6.790169,
-3.678413, 3.745468, 6.790169,
-3.678413, -3.005036, -5.517959,
-3.678413, -3.005036, 6.790169,
-3.678413, 3.745468, -5.517959,
-3.678413, 3.745468, 6.790169,
-3.678413, -3.005036, -5.517959,
3.604787, -3.005036, -5.517959,
-3.678413, -3.005036, 6.790169,
3.604787, -3.005036, 6.790169,
-3.678413, 3.745468, -5.517959,
3.604787, 3.745468, -5.517959,
-3.678413, 3.745468, 6.790169,
3.604787, 3.745468, 6.790169,
3.604787, -3.005036, -5.517959,
3.604787, 3.745468, -5.517959,
3.604787, -3.005036, 6.790169,
3.604787, 3.745468, 6.790169,
3.604787, -3.005036, -5.517959,
3.604787, -3.005036, 6.790169,
3.604787, 3.745468, -5.517959,
3.604787, 3.745468, 6.790169
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
var radius = 8.444736;
var distance = 37.57159;
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
mvMatrix.translate( 0.03681278, -0.3702159, -0.6361051 );
mvMatrix.scale( 1.253654, 1.352582, 0.7418361 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.57159);
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


