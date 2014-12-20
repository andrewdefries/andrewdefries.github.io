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
-3.027045, -0.6389144, -1.424368, 1, 0, 0, 1,
-2.996354, 1.601522, 0.04363359, 1, 0.007843138, 0, 1,
-2.747175, -0.8653052, -2.396556, 1, 0.01176471, 0, 1,
-2.632363, 0.6006517, 0.7059106, 1, 0.01960784, 0, 1,
-2.57311, -0.4916942, -0.2326756, 1, 0.02352941, 0, 1,
-2.487947, -0.8809509, -1.702643, 1, 0.03137255, 0, 1,
-2.477483, 0.1375977, -1.691286, 1, 0.03529412, 0, 1,
-2.455109, 0.3220899, -1.732768, 1, 0.04313726, 0, 1,
-2.305314, 0.225295, -1.390931, 1, 0.04705882, 0, 1,
-2.286078, -0.9351983, -2.45222, 1, 0.05490196, 0, 1,
-2.277626, -2.289012, -1.400214, 1, 0.05882353, 0, 1,
-2.213592, -0.7854207, -1.765035, 1, 0.06666667, 0, 1,
-2.171365, 1.207527, -1.306971, 1, 0.07058824, 0, 1,
-2.092556, -1.015277, -1.970884, 1, 0.07843138, 0, 1,
-2.058544, 1.483006, -1.904456, 1, 0.08235294, 0, 1,
-2.014934, 0.3440562, -0.2254329, 1, 0.09019608, 0, 1,
-1.970882, 1.330483, -0.9579864, 1, 0.09411765, 0, 1,
-1.968075, 0.8197778, 0.3071455, 1, 0.1019608, 0, 1,
-1.957747, 1.936147, -0.4033474, 1, 0.1098039, 0, 1,
-1.903444, 1.323712, -1.038343, 1, 0.1137255, 0, 1,
-1.892638, -0.1305493, -1.364682, 1, 0.1215686, 0, 1,
-1.888473, 0.6645423, -1.302068, 1, 0.1254902, 0, 1,
-1.873284, -2.028556, -1.32163, 1, 0.1333333, 0, 1,
-1.836578, 1.111233, -1.413492, 1, 0.1372549, 0, 1,
-1.820357, 0.5394749, -1.962245, 1, 0.145098, 0, 1,
-1.818817, -0.9175974, -2.425313, 1, 0.1490196, 0, 1,
-1.746456, 1.417855, -2.46635, 1, 0.1568628, 0, 1,
-1.737077, -0.2598111, -0.6939764, 1, 0.1607843, 0, 1,
-1.735885, -0.1771017, -1.709875, 1, 0.1686275, 0, 1,
-1.716067, 0.5275862, -1.291131, 1, 0.172549, 0, 1,
-1.713268, -0.187459, -1.507475, 1, 0.1803922, 0, 1,
-1.689869, 0.6911427, -1.408359, 1, 0.1843137, 0, 1,
-1.685363, -2.224602, -3.346928, 1, 0.1921569, 0, 1,
-1.679466, 1.004588, -0.8256713, 1, 0.1960784, 0, 1,
-1.646498, -0.7264243, -2.828056, 1, 0.2039216, 0, 1,
-1.635402, -1.786115, -0.8224204, 1, 0.2117647, 0, 1,
-1.616449, -1.137433, -3.613777, 1, 0.2156863, 0, 1,
-1.609124, 0.3010786, -0.3436271, 1, 0.2235294, 0, 1,
-1.601918, -1.314402, -4.117621, 1, 0.227451, 0, 1,
-1.599426, -0.9798368, -2.467262, 1, 0.2352941, 0, 1,
-1.591433, 0.2615851, -0.5402997, 1, 0.2392157, 0, 1,
-1.57406, 0.02851195, -1.109606, 1, 0.2470588, 0, 1,
-1.553938, 0.1676508, -2.595958, 1, 0.2509804, 0, 1,
-1.551278, -1.642603, -2.194795, 1, 0.2588235, 0, 1,
-1.533856, -0.4442277, -0.7674801, 1, 0.2627451, 0, 1,
-1.531511, 0.1008249, -1.838872, 1, 0.2705882, 0, 1,
-1.527793, -0.2889808, -1.190507, 1, 0.2745098, 0, 1,
-1.523581, -0.1133, -3.237685, 1, 0.282353, 0, 1,
-1.522002, 0.6187491, -0.9207217, 1, 0.2862745, 0, 1,
-1.52125, -0.8434657, -0.300694, 1, 0.2941177, 0, 1,
-1.48253, -1.143879, -1.162383, 1, 0.3019608, 0, 1,
-1.47659, 1.43216, -0.5144674, 1, 0.3058824, 0, 1,
-1.446581, 0.2969959, 0.2926616, 1, 0.3137255, 0, 1,
-1.436333, 0.9121532, -0.2569407, 1, 0.3176471, 0, 1,
-1.434841, -0.1335219, -0.7538889, 1, 0.3254902, 0, 1,
-1.424545, -0.1973369, -0.3480085, 1, 0.3294118, 0, 1,
-1.406649, -0.9393942, -1.52719, 1, 0.3372549, 0, 1,
-1.403356, 1.466997, 0.5219872, 1, 0.3411765, 0, 1,
-1.397791, 0.1459134, -0.8981863, 1, 0.3490196, 0, 1,
-1.397654, -0.8378977, -2.472337, 1, 0.3529412, 0, 1,
-1.393169, 1.905141, -0.8663314, 1, 0.3607843, 0, 1,
-1.364114, -1.144853, -1.65777, 1, 0.3647059, 0, 1,
-1.362442, -1.896909, -2.299336, 1, 0.372549, 0, 1,
-1.358937, -0.6986284, -1.585737, 1, 0.3764706, 0, 1,
-1.354334, -1.522372, -1.859679, 1, 0.3843137, 0, 1,
-1.336299, 0.3562966, -2.93776, 1, 0.3882353, 0, 1,
-1.335712, 1.717107, -0.3826411, 1, 0.3960784, 0, 1,
-1.333927, 0.2800469, -0.8077874, 1, 0.4039216, 0, 1,
-1.329736, 0.8050439, -0.7402413, 1, 0.4078431, 0, 1,
-1.329358, 0.9523469, -2.642245, 1, 0.4156863, 0, 1,
-1.313328, 0.2818768, -1.921079, 1, 0.4196078, 0, 1,
-1.312463, -1.320631, -4.061729, 1, 0.427451, 0, 1,
-1.307481, 0.7530504, -0.9065416, 1, 0.4313726, 0, 1,
-1.302881, 0.6737301, 0.24693, 1, 0.4392157, 0, 1,
-1.301743, 1.753929, -2.270607, 1, 0.4431373, 0, 1,
-1.299632, 0.7760405, -1.857256, 1, 0.4509804, 0, 1,
-1.297055, 0.5154284, -2.385062, 1, 0.454902, 0, 1,
-1.290138, 3.256082, 0.1476062, 1, 0.4627451, 0, 1,
-1.287573, -0.5002822, -0.9912033, 1, 0.4666667, 0, 1,
-1.279565, -1.665022, -4.334013, 1, 0.4745098, 0, 1,
-1.274673, 0.5226187, -0.5665535, 1, 0.4784314, 0, 1,
-1.273841, -1.110881, -2.908609, 1, 0.4862745, 0, 1,
-1.270658, 0.6179975, -2.337628, 1, 0.4901961, 0, 1,
-1.266, -0.8840342, -2.304408, 1, 0.4980392, 0, 1,
-1.259871, -2.392187, -1.211574, 1, 0.5058824, 0, 1,
-1.25493, -1.922003, -1.958549, 1, 0.509804, 0, 1,
-1.254539, -0.7641605, -1.899843, 1, 0.5176471, 0, 1,
-1.248013, 0.9812044, -0.7561478, 1, 0.5215687, 0, 1,
-1.243096, 1.307117, -0.4137731, 1, 0.5294118, 0, 1,
-1.222426, 0.2318362, -2.667129, 1, 0.5333334, 0, 1,
-1.219417, -0.6203756, -2.378911, 1, 0.5411765, 0, 1,
-1.203487, 1.43042, -1.410045, 1, 0.5450981, 0, 1,
-1.196057, -1.195246, -3.513915, 1, 0.5529412, 0, 1,
-1.185633, -1.849558, -3.486064, 1, 0.5568628, 0, 1,
-1.17853, 0.793451, -1.839197, 1, 0.5647059, 0, 1,
-1.176032, 0.06157633, -1.49613, 1, 0.5686275, 0, 1,
-1.17278, 0.3570873, -0.189758, 1, 0.5764706, 0, 1,
-1.168503, -0.1161245, -1.622414, 1, 0.5803922, 0, 1,
-1.160486, 0.3212043, -0.4521149, 1, 0.5882353, 0, 1,
-1.159522, 0.8661807, -2.138759, 1, 0.5921569, 0, 1,
-1.156592, 1.387211, 0.4562177, 1, 0.6, 0, 1,
-1.15028, -0.2256191, -3.831475, 1, 0.6078432, 0, 1,
-1.148348, -0.7766678, -1.236567, 1, 0.6117647, 0, 1,
-1.148094, 0.8613593, -3.278047, 1, 0.6196079, 0, 1,
-1.142099, 0.1368194, -1.149337, 1, 0.6235294, 0, 1,
-1.138348, -0.3343482, -2.849415, 1, 0.6313726, 0, 1,
-1.138011, 1.024113, -0.399904, 1, 0.6352941, 0, 1,
-1.137096, 0.2250244, -0.9773461, 1, 0.6431373, 0, 1,
-1.129428, -1.082014, -3.613879, 1, 0.6470588, 0, 1,
-1.129208, -0.9719337, -2.843516, 1, 0.654902, 0, 1,
-1.129169, 1.223776, -1.149513, 1, 0.6588235, 0, 1,
-1.127936, 0.2298115, -3.143674, 1, 0.6666667, 0, 1,
-1.126088, -0.3842409, -1.425867, 1, 0.6705883, 0, 1,
-1.118174, -0.1530232, -1.65317, 1, 0.6784314, 0, 1,
-1.108915, -0.5811676, -1.355278, 1, 0.682353, 0, 1,
-1.106407, -1.858484, -4.336917, 1, 0.6901961, 0, 1,
-1.105154, -1.485417, -1.76595, 1, 0.6941177, 0, 1,
-1.105077, 0.9538336, -0.4088203, 1, 0.7019608, 0, 1,
-1.10338, 0.6827651, -0.4005977, 1, 0.7098039, 0, 1,
-1.099827, -1.026164, -1.376391, 1, 0.7137255, 0, 1,
-1.097067, -2.276528, -4.871623, 1, 0.7215686, 0, 1,
-1.084844, 0.7300575, -1.764677, 1, 0.7254902, 0, 1,
-1.078677, -0.8762771, -2.342118, 1, 0.7333333, 0, 1,
-1.070439, 1.138357, 1.68644, 1, 0.7372549, 0, 1,
-1.063454, 1.635178, -1.162817, 1, 0.7450981, 0, 1,
-1.058048, 0.03285919, -1.439493, 1, 0.7490196, 0, 1,
-1.057931, 0.6252747, -1.262771, 1, 0.7568628, 0, 1,
-1.055434, -0.4952014, -3.009333, 1, 0.7607843, 0, 1,
-1.055126, -0.118862, -2.286984, 1, 0.7686275, 0, 1,
-1.053422, 0.266883, -2.95247, 1, 0.772549, 0, 1,
-1.052979, 1.231652, -1.126979, 1, 0.7803922, 0, 1,
-1.049203, 0.8829628, -0.8739502, 1, 0.7843137, 0, 1,
-1.044542, -1.259382, -2.170809, 1, 0.7921569, 0, 1,
-1.041226, 0.4815716, -0.8245859, 1, 0.7960784, 0, 1,
-1.032634, 1.207449, 0.1549643, 1, 0.8039216, 0, 1,
-1.017564, 2.325405, -0.2424311, 1, 0.8117647, 0, 1,
-0.9928808, 2.407795, 0.5082394, 1, 0.8156863, 0, 1,
-0.9870291, -0.2387006, -1.229105, 1, 0.8235294, 0, 1,
-0.9848166, 0.5928707, -1.413175, 1, 0.827451, 0, 1,
-0.9807038, -0.4136142, -1.999528, 1, 0.8352941, 0, 1,
-0.9621598, -2.039582, -2.626178, 1, 0.8392157, 0, 1,
-0.9480534, 0.2571959, -0.5416257, 1, 0.8470588, 0, 1,
-0.9474875, -0.2053396, -2.382347, 1, 0.8509804, 0, 1,
-0.9420789, -0.80545, -2.595385, 1, 0.8588235, 0, 1,
-0.9355831, 0.5587928, -2.205099, 1, 0.8627451, 0, 1,
-0.9351385, -0.2705211, -2.168784, 1, 0.8705882, 0, 1,
-0.9330193, -1.86193, -4.640489, 1, 0.8745098, 0, 1,
-0.9318737, -0.1347145, -0.6170751, 1, 0.8823529, 0, 1,
-0.9298055, -1.646978, -1.039099, 1, 0.8862745, 0, 1,
-0.9297407, 1.584126, -0.3187611, 1, 0.8941177, 0, 1,
-0.9291499, -0.4936381, -0.7948623, 1, 0.8980392, 0, 1,
-0.9286485, -0.1070588, -1.06906, 1, 0.9058824, 0, 1,
-0.9272607, 0.6782528, -1.643577, 1, 0.9137255, 0, 1,
-0.9250609, 1.485929, -2.111669, 1, 0.9176471, 0, 1,
-0.9233045, 1.6997, -0.8319792, 1, 0.9254902, 0, 1,
-0.9190523, 0.1688811, -2.53395, 1, 0.9294118, 0, 1,
-0.9150077, 0.06828029, -1.893121, 1, 0.9372549, 0, 1,
-0.91486, 1.284599, 0.00545873, 1, 0.9411765, 0, 1,
-0.9145963, -0.8993754, -2.954928, 1, 0.9490196, 0, 1,
-0.9129966, 0.3168013, -1.193534, 1, 0.9529412, 0, 1,
-0.8977692, -0.0201422, -2.285671, 1, 0.9607843, 0, 1,
-0.8934265, -0.9327975, -3.377733, 1, 0.9647059, 0, 1,
-0.8891065, 0.4539362, -3.077895, 1, 0.972549, 0, 1,
-0.8735061, -0.2871948, -3.120749, 1, 0.9764706, 0, 1,
-0.8658261, -0.9260784, -2.4803, 1, 0.9843137, 0, 1,
-0.8643174, -0.137911, -2.306282, 1, 0.9882353, 0, 1,
-0.8593411, -0.3105211, -3.095273, 1, 0.9960784, 0, 1,
-0.8589488, -0.1992975, -2.594693, 0.9960784, 1, 0, 1,
-0.8583584, 0.1713082, -3.020616, 0.9921569, 1, 0, 1,
-0.8497373, -1.292442, -3.46063, 0.9843137, 1, 0, 1,
-0.8485591, -0.9912921, -2.957369, 0.9803922, 1, 0, 1,
-0.848065, 1.520048, 1.935842, 0.972549, 1, 0, 1,
-0.8466593, -1.309346, -1.224751, 0.9686275, 1, 0, 1,
-0.8452372, -0.4413359, -3.218937, 0.9607843, 1, 0, 1,
-0.839648, -1.141034, -2.340728, 0.9568627, 1, 0, 1,
-0.83689, 0.02489167, -1.536012, 0.9490196, 1, 0, 1,
-0.8356959, -0.1154807, -1.414398, 0.945098, 1, 0, 1,
-0.8316997, -2.018763, -2.762502, 0.9372549, 1, 0, 1,
-0.8240353, -0.7410385, -2.464836, 0.9333333, 1, 0, 1,
-0.8188168, -0.9804688, -1.742379, 0.9254902, 1, 0, 1,
-0.8114502, -0.6683289, -2.721078, 0.9215686, 1, 0, 1,
-0.8041031, 0.6208649, -0.6288016, 0.9137255, 1, 0, 1,
-0.7995325, 1.827387, -2.880005, 0.9098039, 1, 0, 1,
-0.7927227, -0.3830867, -0.7507647, 0.9019608, 1, 0, 1,
-0.7922563, 0.4722846, -3.178222, 0.8941177, 1, 0, 1,
-0.7877553, -0.9971279, -3.592246, 0.8901961, 1, 0, 1,
-0.7793685, 1.489616, 0.4948346, 0.8823529, 1, 0, 1,
-0.7790949, 0.01397062, -0.4815919, 0.8784314, 1, 0, 1,
-0.7786967, -0.2090033, -2.149278, 0.8705882, 1, 0, 1,
-0.7778483, -0.01998589, -1.332561, 0.8666667, 1, 0, 1,
-0.7615704, 1.308925, -1.808666, 0.8588235, 1, 0, 1,
-0.7609188, 0.7469199, -0.6619616, 0.854902, 1, 0, 1,
-0.7579662, 0.9989031, -1.736912, 0.8470588, 1, 0, 1,
-0.7532246, 1.140124, -1.268646, 0.8431373, 1, 0, 1,
-0.7521362, 0.8055616, -0.9581335, 0.8352941, 1, 0, 1,
-0.7468183, -0.3007777, -3.931261, 0.8313726, 1, 0, 1,
-0.7463169, 0.2818311, -1.611924, 0.8235294, 1, 0, 1,
-0.7458857, 0.2030747, -3.486823, 0.8196079, 1, 0, 1,
-0.7406011, -0.8368807, -2.647537, 0.8117647, 1, 0, 1,
-0.7374012, -0.6299667, -3.955507, 0.8078431, 1, 0, 1,
-0.7319574, -0.4709954, -1.759532, 0.8, 1, 0, 1,
-0.7307836, -0.8119208, -1.335734, 0.7921569, 1, 0, 1,
-0.7269154, -0.5622282, -2.340865, 0.7882353, 1, 0, 1,
-0.7257607, -0.02452069, -1.585401, 0.7803922, 1, 0, 1,
-0.7253144, -2.16911, -2.562418, 0.7764706, 1, 0, 1,
-0.7148712, -0.8439401, -3.727715, 0.7686275, 1, 0, 1,
-0.7120506, -1.23473, -2.490748, 0.7647059, 1, 0, 1,
-0.7104948, -1.223254, -2.907795, 0.7568628, 1, 0, 1,
-0.7085795, 0.2348547, -0.9284307, 0.7529412, 1, 0, 1,
-0.7075365, -0.0003494774, -2.374024, 0.7450981, 1, 0, 1,
-0.7061516, 0.2001747, -1.22511, 0.7411765, 1, 0, 1,
-0.7056479, 0.5388864, 0.1145739, 0.7333333, 1, 0, 1,
-0.705018, -0.5086538, -1.923098, 0.7294118, 1, 0, 1,
-0.7043108, 0.8461574, -1.081193, 0.7215686, 1, 0, 1,
-0.7040379, 1.51076, 0.7416866, 0.7176471, 1, 0, 1,
-0.7024156, 1.309161, -0.6140153, 0.7098039, 1, 0, 1,
-0.7000394, 0.1429358, -1.755457, 0.7058824, 1, 0, 1,
-0.6955782, -0.8359854, -3.346813, 0.6980392, 1, 0, 1,
-0.694499, -1.486744, -3.919413, 0.6901961, 1, 0, 1,
-0.6883122, 0.4901086, -1.962497, 0.6862745, 1, 0, 1,
-0.6881868, -0.04148433, -1.430221, 0.6784314, 1, 0, 1,
-0.6859246, -0.8355635, -3.654085, 0.6745098, 1, 0, 1,
-0.6839158, 0.4480627, -0.3222173, 0.6666667, 1, 0, 1,
-0.6837721, 0.4501904, 0.522119, 0.6627451, 1, 0, 1,
-0.6834769, -1.354399, -3.326834, 0.654902, 1, 0, 1,
-0.6834478, -1.702796, -0.7584217, 0.6509804, 1, 0, 1,
-0.6809909, 0.5973231, -0.1189935, 0.6431373, 1, 0, 1,
-0.6751629, -1.460394, -2.769855, 0.6392157, 1, 0, 1,
-0.6742011, -1.433557, -2.060847, 0.6313726, 1, 0, 1,
-0.6657645, -0.4411116, -2.227767, 0.627451, 1, 0, 1,
-0.6614813, -0.2799819, -1.063176, 0.6196079, 1, 0, 1,
-0.656088, -0.5652217, -2.627196, 0.6156863, 1, 0, 1,
-0.6438916, -0.3399698, -0.4354074, 0.6078432, 1, 0, 1,
-0.6435248, 0.06028213, -2.45536, 0.6039216, 1, 0, 1,
-0.6397479, -2.970289, -3.061223, 0.5960785, 1, 0, 1,
-0.6363047, -1.480415, -1.281229, 0.5882353, 1, 0, 1,
-0.6356714, -2.166538, -4.513354, 0.5843138, 1, 0, 1,
-0.628554, -0.5219349, -1.724666, 0.5764706, 1, 0, 1,
-0.6261883, -0.2666492, -1.48699, 0.572549, 1, 0, 1,
-0.6256849, 1.190568, -1.004888, 0.5647059, 1, 0, 1,
-0.6250045, -0.2731276, -1.650573, 0.5607843, 1, 0, 1,
-0.6241764, 1.160196, -1.319262, 0.5529412, 1, 0, 1,
-0.6228533, 0.4498192, 0.4203819, 0.5490196, 1, 0, 1,
-0.6210035, -0.5164051, -0.9095922, 0.5411765, 1, 0, 1,
-0.6192915, -0.1262665, -2.030315, 0.5372549, 1, 0, 1,
-0.618493, 0.7189466, -1.931128, 0.5294118, 1, 0, 1,
-0.6155186, -0.7982438, -1.960796, 0.5254902, 1, 0, 1,
-0.6069579, 0.4090682, -0.7516636, 0.5176471, 1, 0, 1,
-0.6025097, 1.418368, -2.232658, 0.5137255, 1, 0, 1,
-0.6014364, -0.3536942, -1.119691, 0.5058824, 1, 0, 1,
-0.5978783, -0.8243928, -1.552402, 0.5019608, 1, 0, 1,
-0.5915151, 0.644784, -0.8797885, 0.4941176, 1, 0, 1,
-0.5912474, -0.5763267, -1.321787, 0.4862745, 1, 0, 1,
-0.5909249, -0.2285305, -1.700025, 0.4823529, 1, 0, 1,
-0.5887904, -2.206406, -2.654041, 0.4745098, 1, 0, 1,
-0.5879623, 0.5817277, -0.3326099, 0.4705882, 1, 0, 1,
-0.5878303, 0.6762488, 0.2962425, 0.4627451, 1, 0, 1,
-0.5873219, 0.3116476, -0.7816354, 0.4588235, 1, 0, 1,
-0.5829663, 1.23541, 0.4812938, 0.4509804, 1, 0, 1,
-0.5797964, 0.7039757, 1.128772, 0.4470588, 1, 0, 1,
-0.5790858, -0.1111636, -1.717026, 0.4392157, 1, 0, 1,
-0.5790114, 0.07507916, 0.1545607, 0.4352941, 1, 0, 1,
-0.5730673, -0.7490017, -2.916111, 0.427451, 1, 0, 1,
-0.5678725, -0.5662134, -1.714729, 0.4235294, 1, 0, 1,
-0.5674294, 0.8571067, 0.1826914, 0.4156863, 1, 0, 1,
-0.5672146, 1.64435, 1.130299, 0.4117647, 1, 0, 1,
-0.5642791, 0.4715007, -0.445554, 0.4039216, 1, 0, 1,
-0.5635686, -0.4988237, -3.670113, 0.3960784, 1, 0, 1,
-0.5626966, 0.009020559, -1.44784, 0.3921569, 1, 0, 1,
-0.5607836, 0.455461, -0.4666362, 0.3843137, 1, 0, 1,
-0.558787, -1.1874, -2.423009, 0.3803922, 1, 0, 1,
-0.5582984, -1.384284, -3.953314, 0.372549, 1, 0, 1,
-0.5541875, -1.674593, -1.885897, 0.3686275, 1, 0, 1,
-0.5519133, 0.598401, -0.5127558, 0.3607843, 1, 0, 1,
-0.5489401, -1.223335, -2.849804, 0.3568628, 1, 0, 1,
-0.5488085, 0.1036369, -1.795433, 0.3490196, 1, 0, 1,
-0.548482, 0.3073699, -2.879903, 0.345098, 1, 0, 1,
-0.5465796, -1.273629, -1.529199, 0.3372549, 1, 0, 1,
-0.5451449, 0.2028067, -0.2311868, 0.3333333, 1, 0, 1,
-0.5428274, -0.2667978, -3.12602, 0.3254902, 1, 0, 1,
-0.5399055, 0.2450695, 0.01431127, 0.3215686, 1, 0, 1,
-0.5370962, 0.2704259, -3.001063, 0.3137255, 1, 0, 1,
-0.5313915, 0.9155936, -1.694123, 0.3098039, 1, 0, 1,
-0.5214795, 0.2143201, -2.666069, 0.3019608, 1, 0, 1,
-0.5178128, -1.564462, -2.744175, 0.2941177, 1, 0, 1,
-0.514853, -0.1635065, -4.186171, 0.2901961, 1, 0, 1,
-0.509311, 0.09983987, -0.4739201, 0.282353, 1, 0, 1,
-0.5092294, -0.7019244, -0.8599479, 0.2784314, 1, 0, 1,
-0.5086327, -0.496511, -3.165699, 0.2705882, 1, 0, 1,
-0.5081712, 0.2887294, -0.399, 0.2666667, 1, 0, 1,
-0.5071363, 0.06662661, -2.167385, 0.2588235, 1, 0, 1,
-0.4990355, 0.4593704, -1.017848, 0.254902, 1, 0, 1,
-0.4975295, 0.5071574, -1.674276, 0.2470588, 1, 0, 1,
-0.4931059, -0.3045444, -0.831522, 0.2431373, 1, 0, 1,
-0.4875721, -0.08817013, -1.491817, 0.2352941, 1, 0, 1,
-0.478436, -0.09223101, -2.615414, 0.2313726, 1, 0, 1,
-0.4760066, -0.8645391, -2.8708, 0.2235294, 1, 0, 1,
-0.4721852, 1.125262, -1.363601, 0.2196078, 1, 0, 1,
-0.4711421, 1.656269, 1.602254, 0.2117647, 1, 0, 1,
-0.4653583, -0.7764357, -2.006315, 0.2078431, 1, 0, 1,
-0.4653074, -0.7645265, -3.227792, 0.2, 1, 0, 1,
-0.4590692, -1.85508, -3.445065, 0.1921569, 1, 0, 1,
-0.4535955, -0.7949493, -2.262118, 0.1882353, 1, 0, 1,
-0.4449164, -0.3284656, -1.684381, 0.1803922, 1, 0, 1,
-0.4412168, -2.173568, -3.434718, 0.1764706, 1, 0, 1,
-0.4400207, -0.5996307, -3.259192, 0.1686275, 1, 0, 1,
-0.4383449, -0.57088, -0.516461, 0.1647059, 1, 0, 1,
-0.4379792, 0.09170962, 0.1210337, 0.1568628, 1, 0, 1,
-0.4328921, -0.1852127, -0.9998891, 0.1529412, 1, 0, 1,
-0.4265189, -0.01277135, -1.71523, 0.145098, 1, 0, 1,
-0.4244142, 1.100538, 0.3854934, 0.1411765, 1, 0, 1,
-0.4174117, 0.3760554, -2.010726, 0.1333333, 1, 0, 1,
-0.416739, 0.1726206, -1.282246, 0.1294118, 1, 0, 1,
-0.4140079, 0.9744701, 0.4743408, 0.1215686, 1, 0, 1,
-0.4124219, 1.154486, -1.248763, 0.1176471, 1, 0, 1,
-0.4120162, -0.4368875, -2.87937, 0.1098039, 1, 0, 1,
-0.4115525, 0.5968941, -0.2354384, 0.1058824, 1, 0, 1,
-0.4076819, 0.008733073, -1.001147, 0.09803922, 1, 0, 1,
-0.4061624, 0.0521206, -1.724191, 0.09019608, 1, 0, 1,
-0.4059882, 0.2550582, 1.043066, 0.08627451, 1, 0, 1,
-0.4057257, 0.8071149, -1.7995, 0.07843138, 1, 0, 1,
-0.4046435, -0.06983238, -2.399228, 0.07450981, 1, 0, 1,
-0.4022595, 0.9258302, 1.011277, 0.06666667, 1, 0, 1,
-0.3994009, 0.4818121, -1.289681, 0.0627451, 1, 0, 1,
-0.398524, 0.0260362, -2.332129, 0.05490196, 1, 0, 1,
-0.3948135, -1.416854, -3.961423, 0.05098039, 1, 0, 1,
-0.3727644, 2.116927, 0.8946669, 0.04313726, 1, 0, 1,
-0.3723254, -0.28612, -1.234661, 0.03921569, 1, 0, 1,
-0.3720161, -0.4126107, -3.318476, 0.03137255, 1, 0, 1,
-0.3636196, 0.9830141, -0.8718724, 0.02745098, 1, 0, 1,
-0.3618201, 0.2911069, -0.6340728, 0.01960784, 1, 0, 1,
-0.3574006, -0.8371921, -3.236819, 0.01568628, 1, 0, 1,
-0.3535822, 0.2299733, -2.344092, 0.007843138, 1, 0, 1,
-0.3519549, 0.8752409, -1.885678, 0.003921569, 1, 0, 1,
-0.3488591, -0.953703, -2.498256, 0, 1, 0.003921569, 1,
-0.3478863, 0.8129662, 1.911722, 0, 1, 0.01176471, 1,
-0.3472668, -1.563567, -1.46485, 0, 1, 0.01568628, 1,
-0.3470573, -1.678352, -1.292112, 0, 1, 0.02352941, 1,
-0.3440694, -0.3820252, -3.910856, 0, 1, 0.02745098, 1,
-0.3417599, 1.064286, -1.546447, 0, 1, 0.03529412, 1,
-0.3416871, 0.1963873, -2.368404, 0, 1, 0.03921569, 1,
-0.3399064, 2.310265, -0.6269016, 0, 1, 0.04705882, 1,
-0.3390668, 1.82392, 1.352008, 0, 1, 0.05098039, 1,
-0.3384491, -0.9046755, -2.412967, 0, 1, 0.05882353, 1,
-0.338026, -1.09436, -4.093677, 0, 1, 0.0627451, 1,
-0.3365316, -0.04498513, -2.937461, 0, 1, 0.07058824, 1,
-0.3360641, 0.3637713, -0.5100027, 0, 1, 0.07450981, 1,
-0.3338381, -0.8490469, -1.976376, 0, 1, 0.08235294, 1,
-0.3337054, -0.5513043, -3.229235, 0, 1, 0.08627451, 1,
-0.3315462, -0.1684796, -3.249974, 0, 1, 0.09411765, 1,
-0.3310731, 2.067691, -0.8428592, 0, 1, 0.1019608, 1,
-0.3295818, -0.6415864, -0.6753591, 0, 1, 0.1058824, 1,
-0.3243747, -1.267022, -3.432405, 0, 1, 0.1137255, 1,
-0.3222269, -1.002738, -2.550851, 0, 1, 0.1176471, 1,
-0.3161227, -0.4058164, -4.083556, 0, 1, 0.1254902, 1,
-0.3114759, -2.121942, -3.834527, 0, 1, 0.1294118, 1,
-0.3107675, 2.274565, 0.6986362, 0, 1, 0.1372549, 1,
-0.3086104, 0.04678677, -1.649428, 0, 1, 0.1411765, 1,
-0.3050256, -0.2321055, -1.744268, 0, 1, 0.1490196, 1,
-0.3035746, -0.8876945, -2.758016, 0, 1, 0.1529412, 1,
-0.3010406, 0.546737, -0.8381483, 0, 1, 0.1607843, 1,
-0.3003897, 0.8428202, -2.047231, 0, 1, 0.1647059, 1,
-0.2998212, -0.8743219, -2.520838, 0, 1, 0.172549, 1,
-0.2911952, 0.5456468, 0.0634805, 0, 1, 0.1764706, 1,
-0.2886076, -0.6266772, -2.048508, 0, 1, 0.1843137, 1,
-0.2883831, 0.5570237, -0.9553442, 0, 1, 0.1882353, 1,
-0.2813057, -0.6437736, -2.999181, 0, 1, 0.1960784, 1,
-0.2775985, -0.01638894, -2.741069, 0, 1, 0.2039216, 1,
-0.2730598, 0.1348006, -1.049901, 0, 1, 0.2078431, 1,
-0.271594, -0.162726, -2.781762, 0, 1, 0.2156863, 1,
-0.2680275, -1.425409, -1.738855, 0, 1, 0.2196078, 1,
-0.2627165, -0.2441399, -1.566153, 0, 1, 0.227451, 1,
-0.2560121, 2.027064, 0.3762142, 0, 1, 0.2313726, 1,
-0.2559257, -0.08179028, -2.272344, 0, 1, 0.2392157, 1,
-0.2530141, 0.5402327, -0.004786057, 0, 1, 0.2431373, 1,
-0.2528278, -0.08940086, -1.776366, 0, 1, 0.2509804, 1,
-0.2462345, -0.7053272, -2.990276, 0, 1, 0.254902, 1,
-0.2399919, -0.3260141, -1.16249, 0, 1, 0.2627451, 1,
-0.2378385, -1.698912, -2.113422, 0, 1, 0.2666667, 1,
-0.2376434, 1.254106, 0.5004, 0, 1, 0.2745098, 1,
-0.2373509, -0.1558803, -1.23923, 0, 1, 0.2784314, 1,
-0.234631, 0.2663791, -0.7348937, 0, 1, 0.2862745, 1,
-0.2346275, 2.311598, 0.1705458, 0, 1, 0.2901961, 1,
-0.2344305, -0.840004, -2.070746, 0, 1, 0.2980392, 1,
-0.2327324, 0.7863911, 0.1801397, 0, 1, 0.3058824, 1,
-0.2325404, 0.4032812, -2.822195, 0, 1, 0.3098039, 1,
-0.2325269, 0.6731677, -1.081061, 0, 1, 0.3176471, 1,
-0.2305554, -1.996826, -4.133667, 0, 1, 0.3215686, 1,
-0.2282164, 0.2438996, -1.122475, 0, 1, 0.3294118, 1,
-0.2278492, -0.7762065, -2.287247, 0, 1, 0.3333333, 1,
-0.2267702, 0.4212463, 0.2450418, 0, 1, 0.3411765, 1,
-0.2256804, 0.6234813, -1.542944, 0, 1, 0.345098, 1,
-0.2252088, -0.2019727, -1.909761, 0, 1, 0.3529412, 1,
-0.2244233, 0.2977466, 1.068024, 0, 1, 0.3568628, 1,
-0.2230462, -0.7498549, -3.530896, 0, 1, 0.3647059, 1,
-0.221166, -1.209281, -3.585466, 0, 1, 0.3686275, 1,
-0.2196804, 0.5969893, -0.5749951, 0, 1, 0.3764706, 1,
-0.218127, 0.2557733, -0.5985134, 0, 1, 0.3803922, 1,
-0.2161558, 2.603914, -0.7549493, 0, 1, 0.3882353, 1,
-0.2155962, 1.290122, 1.300901, 0, 1, 0.3921569, 1,
-0.211307, 0.701598, -0.7267278, 0, 1, 0.4, 1,
-0.2088372, -0.03233635, -1.86428, 0, 1, 0.4078431, 1,
-0.2039407, -0.1618398, -2.39782, 0, 1, 0.4117647, 1,
-0.2033302, -0.6467717, 0.05244954, 0, 1, 0.4196078, 1,
-0.2019633, -1.422755, -1.95138, 0, 1, 0.4235294, 1,
-0.200857, 0.4534333, -0.2839008, 0, 1, 0.4313726, 1,
-0.1988514, -0.8711636, -1.842953, 0, 1, 0.4352941, 1,
-0.1964505, -0.5170255, -3.167374, 0, 1, 0.4431373, 1,
-0.1942615, 0.6090184, -0.1389902, 0, 1, 0.4470588, 1,
-0.1929502, 1.806711, -2.523533, 0, 1, 0.454902, 1,
-0.1912617, 0.2040968, 0.8312847, 0, 1, 0.4588235, 1,
-0.1906833, -0.2709979, -3.127667, 0, 1, 0.4666667, 1,
-0.1867896, 0.2270243, 0.3696783, 0, 1, 0.4705882, 1,
-0.1856898, 0.658447, -1.060743, 0, 1, 0.4784314, 1,
-0.1856143, -2.024958, -1.466056, 0, 1, 0.4823529, 1,
-0.1843848, -0.9088895, -3.983406, 0, 1, 0.4901961, 1,
-0.1806232, 0.4859879, -0.2537384, 0, 1, 0.4941176, 1,
-0.1775826, 1.607288, -0.8874852, 0, 1, 0.5019608, 1,
-0.1774094, -0.1889312, -1.285694, 0, 1, 0.509804, 1,
-0.1662145, 0.2794928, -1.868269, 0, 1, 0.5137255, 1,
-0.1584986, 0.3043777, -1.686288, 0, 1, 0.5215687, 1,
-0.1565553, 0.3768573, 0.4709142, 0, 1, 0.5254902, 1,
-0.156489, 0.2224231, 0.5753791, 0, 1, 0.5333334, 1,
-0.1461808, 1.213364, -0.4344858, 0, 1, 0.5372549, 1,
-0.1448971, 1.753799, 2.820143, 0, 1, 0.5450981, 1,
-0.1433049, -1.415045, -2.607542, 0, 1, 0.5490196, 1,
-0.1388765, -0.09891859, -3.444556, 0, 1, 0.5568628, 1,
-0.1350103, -0.4791663, -2.632173, 0, 1, 0.5607843, 1,
-0.1293664, 0.6999205, -1.322329, 0, 1, 0.5686275, 1,
-0.1250175, -0.6756525, -3.689285, 0, 1, 0.572549, 1,
-0.1224254, 1.793029, -1.092553, 0, 1, 0.5803922, 1,
-0.1219219, 1.334141, 0.4911261, 0, 1, 0.5843138, 1,
-0.1218041, 0.1372202, -0.08845184, 0, 1, 0.5921569, 1,
-0.1217381, -0.1624334, -2.414337, 0, 1, 0.5960785, 1,
-0.120323, -0.07974661, -2.998584, 0, 1, 0.6039216, 1,
-0.1195329, 0.105234, -2.930948, 0, 1, 0.6117647, 1,
-0.118276, -0.5587257, -4.209188, 0, 1, 0.6156863, 1,
-0.1135506, -0.3503354, -2.067147, 0, 1, 0.6235294, 1,
-0.109163, 0.5206044, -2.219794, 0, 1, 0.627451, 1,
-0.1030103, 0.3619049, 0.2112687, 0, 1, 0.6352941, 1,
-0.1021167, 0.04664634, -2.017265, 0, 1, 0.6392157, 1,
-0.09587158, -0.05471144, -0.4386243, 0, 1, 0.6470588, 1,
-0.0873609, -0.08388183, -2.941554, 0, 1, 0.6509804, 1,
-0.08707673, 1.010442, -0.4698661, 0, 1, 0.6588235, 1,
-0.08541638, -0.4817351, -1.835231, 0, 1, 0.6627451, 1,
-0.08313806, 0.0409917, 0.5853199, 0, 1, 0.6705883, 1,
-0.07760476, 0.1756835, -0.1917648, 0, 1, 0.6745098, 1,
-0.07269409, 1.242011, -0.3578072, 0, 1, 0.682353, 1,
-0.07175093, 0.4632312, -0.5299056, 0, 1, 0.6862745, 1,
-0.06954552, 0.473016, 0.2144289, 0, 1, 0.6941177, 1,
-0.06944679, -0.3070169, -0.6231737, 0, 1, 0.7019608, 1,
-0.06867336, 0.2126579, 0.04215566, 0, 1, 0.7058824, 1,
-0.06546091, -1.694264, -2.938307, 0, 1, 0.7137255, 1,
-0.06527317, 0.9536587, 0.5376869, 0, 1, 0.7176471, 1,
-0.06463868, 0.09602937, 0.8293804, 0, 1, 0.7254902, 1,
-0.06456637, 0.003384064, -1.148842, 0, 1, 0.7294118, 1,
-0.06294591, 0.8089685, 0.6629571, 0, 1, 0.7372549, 1,
-0.06288645, 0.822746, 0.4451137, 0, 1, 0.7411765, 1,
-0.06103854, 2.118984, -0.5924608, 0, 1, 0.7490196, 1,
-0.05869874, 1.802654, 1.615859, 0, 1, 0.7529412, 1,
-0.0582115, -0.3609964, -3.83428, 0, 1, 0.7607843, 1,
-0.04994573, -1.342907, -3.243738, 0, 1, 0.7647059, 1,
-0.04943594, 0.1623065, 0.4110845, 0, 1, 0.772549, 1,
-0.04522794, -0.7905439, -2.499562, 0, 1, 0.7764706, 1,
-0.04327755, 1.698465, 0.1090029, 0, 1, 0.7843137, 1,
-0.04064121, -0.7987689, -4.403821, 0, 1, 0.7882353, 1,
-0.04061689, 0.09027206, 0.06764468, 0, 1, 0.7960784, 1,
-0.03870055, -0.02843175, -2.221189, 0, 1, 0.8039216, 1,
-0.03830898, 2.456602, -1.012764, 0, 1, 0.8078431, 1,
-0.03669229, 0.1825765, -0.09428406, 0, 1, 0.8156863, 1,
-0.0346955, -1.130787, -3.106765, 0, 1, 0.8196079, 1,
-0.03147809, -1.352426, -4.253515, 0, 1, 0.827451, 1,
-0.02710835, -1.965856, -2.929514, 0, 1, 0.8313726, 1,
-0.01978733, -0.9022497, -3.632936, 0, 1, 0.8392157, 1,
-0.01471959, 1.407083, -0.6108339, 0, 1, 0.8431373, 1,
-0.01099923, 0.3405366, 1.434288, 0, 1, 0.8509804, 1,
-0.0107783, 1.133188, -0.05104811, 0, 1, 0.854902, 1,
-0.01022099, 0.1527748, 0.09527174, 0, 1, 0.8627451, 1,
-0.006751787, 1.58409, 0.00641025, 0, 1, 0.8666667, 1,
-0.006252181, -0.9337994, -3.665252, 0, 1, 0.8745098, 1,
-0.005600791, 0.9676299, -1.064578, 0, 1, 0.8784314, 1,
0.004752269, 0.3398033, -0.3246303, 0, 1, 0.8862745, 1,
0.008696504, 0.07379729, 0.02862262, 0, 1, 0.8901961, 1,
0.0110767, -1.649322, 3.545521, 0, 1, 0.8980392, 1,
0.01693544, 0.743081, 0.5264627, 0, 1, 0.9058824, 1,
0.01751261, -0.5226101, 3.34491, 0, 1, 0.9098039, 1,
0.02135885, 0.07575703, -0.005660672, 0, 1, 0.9176471, 1,
0.02196088, -0.6289771, 4.440435, 0, 1, 0.9215686, 1,
0.02200778, -0.7217633, 4.026075, 0, 1, 0.9294118, 1,
0.02534149, -1.110104, 3.943721, 0, 1, 0.9333333, 1,
0.03044377, 0.2862703, 1.103058, 0, 1, 0.9411765, 1,
0.03336375, 1.055398, 1.796051, 0, 1, 0.945098, 1,
0.03599114, 0.5077078, 0.3292018, 0, 1, 0.9529412, 1,
0.0370295, 0.9193221, -0.5849462, 0, 1, 0.9568627, 1,
0.03844365, -0.06824995, 3.661529, 0, 1, 0.9647059, 1,
0.04352551, -0.7658516, 3.432997, 0, 1, 0.9686275, 1,
0.04513727, 0.8637001, -1.249275, 0, 1, 0.9764706, 1,
0.04629593, -1.36367, 1.670187, 0, 1, 0.9803922, 1,
0.04664218, 0.1831416, 1.875975, 0, 1, 0.9882353, 1,
0.05585152, -0.05262272, 2.602872, 0, 1, 0.9921569, 1,
0.06172018, 0.7157099, 0.7290095, 0, 1, 1, 1,
0.0619345, -0.3896028, 2.085083, 0, 0.9921569, 1, 1,
0.07521325, -0.03051747, 1.848271, 0, 0.9882353, 1, 1,
0.07652368, 1.074053, 0.3573835, 0, 0.9803922, 1, 1,
0.07779102, -0.8741582, 1.510302, 0, 0.9764706, 1, 1,
0.07853934, -0.02216613, -0.1373327, 0, 0.9686275, 1, 1,
0.08356707, -1.869933, 3.515719, 0, 0.9647059, 1, 1,
0.08562634, 0.565755, -0.3530045, 0, 0.9568627, 1, 1,
0.08794477, 0.6559791, 0.0596744, 0, 0.9529412, 1, 1,
0.08876939, -0.955458, 2.227309, 0, 0.945098, 1, 1,
0.08986663, -1.772125, 2.131644, 0, 0.9411765, 1, 1,
0.0916873, 0.4605063, -0.4508334, 0, 0.9333333, 1, 1,
0.09448814, -0.487158, 4.141772, 0, 0.9294118, 1, 1,
0.09664521, 0.3250203, -0.2394001, 0, 0.9215686, 1, 1,
0.1021362, 0.7079076, -1.362364, 0, 0.9176471, 1, 1,
0.1032362, 0.881902, -0.9989488, 0, 0.9098039, 1, 1,
0.1084626, 1.867111, -0.3637445, 0, 0.9058824, 1, 1,
0.109719, -0.7895691, 5.084969, 0, 0.8980392, 1, 1,
0.1112145, -1.114797, 3.339209, 0, 0.8901961, 1, 1,
0.1132679, -1.234941, 2.938496, 0, 0.8862745, 1, 1,
0.1151668, 0.2644584, -0.7393764, 0, 0.8784314, 1, 1,
0.1183809, 0.6804677, -0.2189004, 0, 0.8745098, 1, 1,
0.1225539, -0.5388002, 3.019017, 0, 0.8666667, 1, 1,
0.1226841, -0.8978659, 1.670857, 0, 0.8627451, 1, 1,
0.1237563, 0.9231985, 1.507753, 0, 0.854902, 1, 1,
0.1239195, 1.192904, 0.09693924, 0, 0.8509804, 1, 1,
0.1265929, 0.1343257, 0.1436294, 0, 0.8431373, 1, 1,
0.127761, 0.63298, 1.759696, 0, 0.8392157, 1, 1,
0.1315695, 2.153717, 0.6741728, 0, 0.8313726, 1, 1,
0.1320376, 0.5880713, 1.873429, 0, 0.827451, 1, 1,
0.1323949, -0.7095189, 2.451055, 0, 0.8196079, 1, 1,
0.1356036, 0.6624192, 0.5426474, 0, 0.8156863, 1, 1,
0.1363861, -2.480679, 3.724494, 0, 0.8078431, 1, 1,
0.1402519, -2.026596, 4.396182, 0, 0.8039216, 1, 1,
0.1421299, 1.371776, 0.8973237, 0, 0.7960784, 1, 1,
0.1428807, 1.048357, -0.5839007, 0, 0.7882353, 1, 1,
0.1445297, 0.2344743, 0.7543601, 0, 0.7843137, 1, 1,
0.1461113, 1.136091, 0.1042665, 0, 0.7764706, 1, 1,
0.147574, -0.5670391, 3.836327, 0, 0.772549, 1, 1,
0.1489684, -0.1138176, 2.405779, 0, 0.7647059, 1, 1,
0.1501488, 0.7029136, 2.050635, 0, 0.7607843, 1, 1,
0.1512631, -1.774878, 3.447927, 0, 0.7529412, 1, 1,
0.1512809, -0.2514223, 3.636579, 0, 0.7490196, 1, 1,
0.1517889, 0.6279092, 0.5146594, 0, 0.7411765, 1, 1,
0.1576278, 1.539304, -1.844606, 0, 0.7372549, 1, 1,
0.1578334, 1.318676, 0.09372742, 0, 0.7294118, 1, 1,
0.1624847, -1.701153, 2.358384, 0, 0.7254902, 1, 1,
0.1703493, -1.583044, 4.062549, 0, 0.7176471, 1, 1,
0.175094, -1.90288, 3.827346, 0, 0.7137255, 1, 1,
0.1770281, 1.99594, -0.7568816, 0, 0.7058824, 1, 1,
0.1792645, 0.2670122, -1.619594, 0, 0.6980392, 1, 1,
0.1815491, -0.1009413, 2.592297, 0, 0.6941177, 1, 1,
0.1841254, -1.485032, 3.245111, 0, 0.6862745, 1, 1,
0.1884049, 0.09990487, 1.212398, 0, 0.682353, 1, 1,
0.1927426, -0.04623931, 1.836831, 0, 0.6745098, 1, 1,
0.1963706, 0.1109931, 0.6081764, 0, 0.6705883, 1, 1,
0.1969862, 0.6163055, -0.6823901, 0, 0.6627451, 1, 1,
0.1994967, -0.8354923, 4.2503, 0, 0.6588235, 1, 1,
0.2172459, -2.045822, 5.000814, 0, 0.6509804, 1, 1,
0.2279669, 0.466365, 0.2337731, 0, 0.6470588, 1, 1,
0.2282609, -0.7399679, 3.385945, 0, 0.6392157, 1, 1,
0.2287297, 2.089622, -0.3859201, 0, 0.6352941, 1, 1,
0.2303869, -0.1493095, 2.294201, 0, 0.627451, 1, 1,
0.2325743, 1.16485, 0.1542422, 0, 0.6235294, 1, 1,
0.2349498, 0.4006263, 1.054766, 0, 0.6156863, 1, 1,
0.2376393, -0.4642472, 2.344607, 0, 0.6117647, 1, 1,
0.2410673, 0.3258823, -1.456742, 0, 0.6039216, 1, 1,
0.2442994, 0.7853133, 1.311234, 0, 0.5960785, 1, 1,
0.2454457, 1.269847, 0.3727855, 0, 0.5921569, 1, 1,
0.2462778, 0.1889839, -0.5196449, 0, 0.5843138, 1, 1,
0.2463664, 1.128938, -1.033978, 0, 0.5803922, 1, 1,
0.2478637, 0.5199505, 0.2683274, 0, 0.572549, 1, 1,
0.2481011, -1.719161, 4.438852, 0, 0.5686275, 1, 1,
0.2501537, 0.1253653, 2.643489, 0, 0.5607843, 1, 1,
0.2549954, -0.4821675, 1.587237, 0, 0.5568628, 1, 1,
0.2572327, 2.492104, 0.5747706, 0, 0.5490196, 1, 1,
0.2576656, -1.396719, 4.648442, 0, 0.5450981, 1, 1,
0.2600346, -1.373841, 3.629455, 0, 0.5372549, 1, 1,
0.2614206, -0.2410665, 2.529982, 0, 0.5333334, 1, 1,
0.265763, -0.3476883, 2.635849, 0, 0.5254902, 1, 1,
0.2693904, -1.50839, 4.151309, 0, 0.5215687, 1, 1,
0.2694138, 0.2824397, 0.6167945, 0, 0.5137255, 1, 1,
0.2694446, 0.3905929, 2.038372, 0, 0.509804, 1, 1,
0.2694797, -0.07655206, 3.66615, 0, 0.5019608, 1, 1,
0.2697295, 0.3034527, 0.6219853, 0, 0.4941176, 1, 1,
0.2716424, 0.818568, 0.4218839, 0, 0.4901961, 1, 1,
0.2717142, -0.03501417, 1.906642, 0, 0.4823529, 1, 1,
0.2723729, -1.738695, 2.579385, 0, 0.4784314, 1, 1,
0.2737836, 1.485146, -0.6326854, 0, 0.4705882, 1, 1,
0.2741611, 0.7749131, -0.3195552, 0, 0.4666667, 1, 1,
0.2761377, 1.022465, -0.2903792, 0, 0.4588235, 1, 1,
0.2772794, 0.08056502, 0.5981221, 0, 0.454902, 1, 1,
0.2776543, -0.1383266, 2.88424, 0, 0.4470588, 1, 1,
0.2793284, 0.284595, 1.798233, 0, 0.4431373, 1, 1,
0.2813803, -0.1661599, 1.709674, 0, 0.4352941, 1, 1,
0.2840952, 1.034341, 0.3142307, 0, 0.4313726, 1, 1,
0.2892513, -1.936458, 2.264704, 0, 0.4235294, 1, 1,
0.289793, -1.224019, 2.352243, 0, 0.4196078, 1, 1,
0.2960217, -1.440386, 0.830124, 0, 0.4117647, 1, 1,
0.2975787, -0.9013171, 3.609963, 0, 0.4078431, 1, 1,
0.3019076, 0.2386603, 1.896482, 0, 0.4, 1, 1,
0.3022313, -0.8113226, 2.632478, 0, 0.3921569, 1, 1,
0.3044432, -0.739324, 4.261539, 0, 0.3882353, 1, 1,
0.3048796, 0.2885984, 0.7708488, 0, 0.3803922, 1, 1,
0.306883, 0.4064702, 2.787873, 0, 0.3764706, 1, 1,
0.3079312, 0.4264838, 0.5945389, 0, 0.3686275, 1, 1,
0.3095322, -1.978296, 3.696966, 0, 0.3647059, 1, 1,
0.3120816, 0.2148317, 0.8614458, 0, 0.3568628, 1, 1,
0.3147979, -0.3804386, 2.639557, 0, 0.3529412, 1, 1,
0.3149858, -1.04511, 2.53802, 0, 0.345098, 1, 1,
0.3157665, -1.399657, 2.726729, 0, 0.3411765, 1, 1,
0.3174164, 0.3608032, 1.225541, 0, 0.3333333, 1, 1,
0.3175497, -0.8300983, 4.202686, 0, 0.3294118, 1, 1,
0.3183393, -0.584402, 2.976354, 0, 0.3215686, 1, 1,
0.3284447, 0.9039757, -1.002842, 0, 0.3176471, 1, 1,
0.3298576, 0.7678313, 0.7319536, 0, 0.3098039, 1, 1,
0.3301709, 3.157521, 0.2720694, 0, 0.3058824, 1, 1,
0.3343713, 0.5519482, 0.5445983, 0, 0.2980392, 1, 1,
0.3357043, -0.4066849, 1.892284, 0, 0.2901961, 1, 1,
0.3365827, 0.5269774, 1.048416, 0, 0.2862745, 1, 1,
0.3384503, -1.791227, 2.460865, 0, 0.2784314, 1, 1,
0.340164, -1.693292, 0.8494892, 0, 0.2745098, 1, 1,
0.3416578, -0.2944207, 1.901592, 0, 0.2666667, 1, 1,
0.3431157, -1.706147, 3.99115, 0, 0.2627451, 1, 1,
0.3464731, -0.3831609, 1.116981, 0, 0.254902, 1, 1,
0.3480266, -0.8843583, 0.9007182, 0, 0.2509804, 1, 1,
0.3487399, 0.1030346, 0.7990657, 0, 0.2431373, 1, 1,
0.3500432, 0.6227333, -0.2620803, 0, 0.2392157, 1, 1,
0.3501542, -1.16598, 3.129653, 0, 0.2313726, 1, 1,
0.3529479, 1.186045, 0.6867134, 0, 0.227451, 1, 1,
0.3592854, -0.4575715, 2.585078, 0, 0.2196078, 1, 1,
0.3594604, 0.2371786, 2.644058, 0, 0.2156863, 1, 1,
0.3629591, 1.8808, 1.185853, 0, 0.2078431, 1, 1,
0.3709363, -0.5727038, 2.373737, 0, 0.2039216, 1, 1,
0.3715374, -1.744508, 5.040832, 0, 0.1960784, 1, 1,
0.3763209, 0.3512345, 2.031315, 0, 0.1882353, 1, 1,
0.376938, 0.6688268, 1.297757, 0, 0.1843137, 1, 1,
0.3797208, 1.03654, 1.400762, 0, 0.1764706, 1, 1,
0.3874205, -2.133971, 3.15767, 0, 0.172549, 1, 1,
0.3874471, -0.6061946, 2.344578, 0, 0.1647059, 1, 1,
0.3876593, -0.06784731, 2.254436, 0, 0.1607843, 1, 1,
0.3931869, 0.4354551, -0.4849808, 0, 0.1529412, 1, 1,
0.3952067, 0.5605412, -0.7294053, 0, 0.1490196, 1, 1,
0.396492, -0.3898749, 2.431687, 0, 0.1411765, 1, 1,
0.3974207, -0.7096061, 2.435473, 0, 0.1372549, 1, 1,
0.4026342, -0.8511131, 2.759238, 0, 0.1294118, 1, 1,
0.4037082, 1.463587, 0.02349764, 0, 0.1254902, 1, 1,
0.407831, 0.05454474, -1.534667, 0, 0.1176471, 1, 1,
0.4081965, 0.2287681, -0.4547966, 0, 0.1137255, 1, 1,
0.4099254, -0.1478152, 2.769033, 0, 0.1058824, 1, 1,
0.4127643, 1.633092, -0.1393815, 0, 0.09803922, 1, 1,
0.4183345, -1.563582, 2.614286, 0, 0.09411765, 1, 1,
0.4193135, 0.3434942, 1.327648, 0, 0.08627451, 1, 1,
0.4207076, 0.05850519, 1.108497, 0, 0.08235294, 1, 1,
0.4244007, 0.8680409, 1.198171, 0, 0.07450981, 1, 1,
0.4246544, -0.9921988, 3.916911, 0, 0.07058824, 1, 1,
0.4253946, 0.9294456, 0.6546071, 0, 0.0627451, 1, 1,
0.4259154, -1.442443, 2.914626, 0, 0.05882353, 1, 1,
0.4271256, 0.05997169, 2.269808, 0, 0.05098039, 1, 1,
0.4329278, -0.2093733, 1.961922, 0, 0.04705882, 1, 1,
0.4357457, -1.179898, 2.570091, 0, 0.03921569, 1, 1,
0.4365946, -0.7100275, 2.920669, 0, 0.03529412, 1, 1,
0.4388948, 0.07420729, 2.133326, 0, 0.02745098, 1, 1,
0.4409465, 2.299902, -0.4949445, 0, 0.02352941, 1, 1,
0.4492854, -1.070626, 1.745582, 0, 0.01568628, 1, 1,
0.4507604, -0.658213, 3.786324, 0, 0.01176471, 1, 1,
0.4517633, -1.185333, 2.783647, 0, 0.003921569, 1, 1,
0.4525374, 1.729306, -0.9816567, 0.003921569, 0, 1, 1,
0.4532926, 0.8189606, -0.09156433, 0.007843138, 0, 1, 1,
0.4537117, -0.7073168, 1.754771, 0.01568628, 0, 1, 1,
0.4540302, 0.2646073, 3.02938, 0.01960784, 0, 1, 1,
0.4542859, -0.6146778, 0.5842633, 0.02745098, 0, 1, 1,
0.4550774, 0.03491659, 0.773194, 0.03137255, 0, 1, 1,
0.4576839, -2.229907, 2.958713, 0.03921569, 0, 1, 1,
0.4590123, 0.6391609, 0.6548282, 0.04313726, 0, 1, 1,
0.4599625, -0.03249392, 1.445628, 0.05098039, 0, 1, 1,
0.4638332, 0.3044139, 1.662233, 0.05490196, 0, 1, 1,
0.4653055, -1.158872, 3.31755, 0.0627451, 0, 1, 1,
0.4682856, 0.01914309, -0.1777039, 0.06666667, 0, 1, 1,
0.4683041, -0.7990839, 2.947008, 0.07450981, 0, 1, 1,
0.4685378, 0.2023212, 0.8430137, 0.07843138, 0, 1, 1,
0.4740445, 1.343157, 0.2057066, 0.08627451, 0, 1, 1,
0.4752196, -0.314397, 2.625769, 0.09019608, 0, 1, 1,
0.476715, 0.006522706, 0.9702433, 0.09803922, 0, 1, 1,
0.4800305, -1.081367, 1.216325, 0.1058824, 0, 1, 1,
0.484604, 1.039045, 0.6661648, 0.1098039, 0, 1, 1,
0.4879288, 0.4973572, 1.297889, 0.1176471, 0, 1, 1,
0.4899054, -0.9163409, 2.102216, 0.1215686, 0, 1, 1,
0.4962216, 0.3180745, -0.5070452, 0.1294118, 0, 1, 1,
0.4977131, -0.7744927, 3.064077, 0.1333333, 0, 1, 1,
0.4982206, -0.07542618, 0.7379821, 0.1411765, 0, 1, 1,
0.4994995, 1.144579, -0.3057287, 0.145098, 0, 1, 1,
0.5010666, 0.7419578, 0.8253515, 0.1529412, 0, 1, 1,
0.5034958, 0.5284647, -0.9118237, 0.1568628, 0, 1, 1,
0.5061845, -0.03204142, 2.160187, 0.1647059, 0, 1, 1,
0.5073316, 0.7651389, -0.5303074, 0.1686275, 0, 1, 1,
0.5138848, 0.1933017, 0.9077482, 0.1764706, 0, 1, 1,
0.5145891, -1.545758, 3.125639, 0.1803922, 0, 1, 1,
0.5161902, -0.1359071, 4.069431, 0.1882353, 0, 1, 1,
0.5216709, 0.6716881, 2.110595, 0.1921569, 0, 1, 1,
0.5240331, -0.6342192, 2.477144, 0.2, 0, 1, 1,
0.527953, 0.4377731, -0.3679835, 0.2078431, 0, 1, 1,
0.5322436, -1.327741, 2.442368, 0.2117647, 0, 1, 1,
0.5361172, 2.30724, 1.010749, 0.2196078, 0, 1, 1,
0.5362503, -1.099089, 2.172886, 0.2235294, 0, 1, 1,
0.5381802, -0.5792612, 2.278746, 0.2313726, 0, 1, 1,
0.5415533, 0.9315327, 0.6404889, 0.2352941, 0, 1, 1,
0.5448766, -1.074144, 3.456503, 0.2431373, 0, 1, 1,
0.5465549, 1.719094, -0.4324184, 0.2470588, 0, 1, 1,
0.5509682, -0.07068969, 2.178227, 0.254902, 0, 1, 1,
0.5571918, 1.247897, 0.3188092, 0.2588235, 0, 1, 1,
0.5594667, 0.4140522, 1.269182, 0.2666667, 0, 1, 1,
0.5664287, 0.7264228, 0.9074273, 0.2705882, 0, 1, 1,
0.5686584, -1.280848, 1.921745, 0.2784314, 0, 1, 1,
0.5703294, -0.7349178, 3.050728, 0.282353, 0, 1, 1,
0.5786469, -0.3281876, 1.412272, 0.2901961, 0, 1, 1,
0.580346, 0.4101839, 1.131066, 0.2941177, 0, 1, 1,
0.5836924, -0.4607068, 2.190651, 0.3019608, 0, 1, 1,
0.5837381, -0.9297891, 2.07823, 0.3098039, 0, 1, 1,
0.5871611, 1.179465, 0.9310793, 0.3137255, 0, 1, 1,
0.5906047, -1.460687, 3.009721, 0.3215686, 0, 1, 1,
0.5949466, -1.562676, 2.143992, 0.3254902, 0, 1, 1,
0.5959882, -0.6143256, 1.180821, 0.3333333, 0, 1, 1,
0.5982306, -0.2961496, 0.7638817, 0.3372549, 0, 1, 1,
0.6043972, 1.026239, -0.5824828, 0.345098, 0, 1, 1,
0.6046835, 1.072798, 0.6960743, 0.3490196, 0, 1, 1,
0.6047783, -0.03489179, -0.3252996, 0.3568628, 0, 1, 1,
0.6098305, 0.4662563, 1.696628, 0.3607843, 0, 1, 1,
0.6172168, -0.007913598, 1.040807, 0.3686275, 0, 1, 1,
0.6179867, -1.084274, 2.26601, 0.372549, 0, 1, 1,
0.6245387, -0.9050863, 3.279641, 0.3803922, 0, 1, 1,
0.6268812, -1.171381, 4.046803, 0.3843137, 0, 1, 1,
0.6289591, 0.5840061, -0.762472, 0.3921569, 0, 1, 1,
0.6321507, 1.340863, 1.499244, 0.3960784, 0, 1, 1,
0.6342772, -0.4225694, 2.055851, 0.4039216, 0, 1, 1,
0.6343368, 1.652663, 1.271043, 0.4117647, 0, 1, 1,
0.6367766, 0.2700443, 1.689561, 0.4156863, 0, 1, 1,
0.6377187, 0.335323, 2.548403, 0.4235294, 0, 1, 1,
0.6387483, 0.2776912, 1.286161, 0.427451, 0, 1, 1,
0.6398928, 0.0431362, 2.779805, 0.4352941, 0, 1, 1,
0.6423593, -0.267643, 3.295781, 0.4392157, 0, 1, 1,
0.6449333, -0.7831185, 1.672147, 0.4470588, 0, 1, 1,
0.6494446, -1.260163, 2.40575, 0.4509804, 0, 1, 1,
0.6598161, 1.008727, 0.7262521, 0.4588235, 0, 1, 1,
0.6651648, -1.786204, 2.658531, 0.4627451, 0, 1, 1,
0.6659489, 0.3100476, 1.659099, 0.4705882, 0, 1, 1,
0.6675708, 0.6098338, 0.5290211, 0.4745098, 0, 1, 1,
0.6699809, -0.7289848, 1.262785, 0.4823529, 0, 1, 1,
0.6720181, 1.530483, -0.5693235, 0.4862745, 0, 1, 1,
0.6763091, -0.7773447, 3.012885, 0.4941176, 0, 1, 1,
0.6771732, -1.139091, 3.239482, 0.5019608, 0, 1, 1,
0.6829479, 1.933929, 0.6018293, 0.5058824, 0, 1, 1,
0.6843657, 1.339346, -0.1164869, 0.5137255, 0, 1, 1,
0.688995, -3.033543, 2.150061, 0.5176471, 0, 1, 1,
0.693332, 0.3217239, 1.571876, 0.5254902, 0, 1, 1,
0.6958402, -0.341908, 0.3013092, 0.5294118, 0, 1, 1,
0.6983174, 0.4113467, 1.021087, 0.5372549, 0, 1, 1,
0.7064111, -0.8613665, 3.644483, 0.5411765, 0, 1, 1,
0.709188, 0.9584442, 0.5977374, 0.5490196, 0, 1, 1,
0.7196811, -0.9797555, 1.5276, 0.5529412, 0, 1, 1,
0.726849, 0.8744269, 0.6049176, 0.5607843, 0, 1, 1,
0.7303909, -1.591737, 3.635693, 0.5647059, 0, 1, 1,
0.7335454, -0.1044864, 2.822492, 0.572549, 0, 1, 1,
0.734005, 1.231727, -0.5145586, 0.5764706, 0, 1, 1,
0.7349657, -1.882229, 3.014734, 0.5843138, 0, 1, 1,
0.7412692, 0.5058871, 2.105676, 0.5882353, 0, 1, 1,
0.7427609, -1.155086, 0.9570356, 0.5960785, 0, 1, 1,
0.7435009, -0.4309457, 2.184344, 0.6039216, 0, 1, 1,
0.7448607, -1.068906, 2.961716, 0.6078432, 0, 1, 1,
0.7450289, 1.826313, 0.7063512, 0.6156863, 0, 1, 1,
0.7483079, -0.3988355, 2.724232, 0.6196079, 0, 1, 1,
0.7505215, -0.7992236, 2.795167, 0.627451, 0, 1, 1,
0.7513852, 0.4903177, 1.491001, 0.6313726, 0, 1, 1,
0.753658, -1.715343, 3.738763, 0.6392157, 0, 1, 1,
0.7563591, 0.8701931, 0.07994975, 0.6431373, 0, 1, 1,
0.7616253, 0.09139498, 1.55338, 0.6509804, 0, 1, 1,
0.7649567, 0.01571462, 1.937237, 0.654902, 0, 1, 1,
0.7785178, 1.921606, 1.350403, 0.6627451, 0, 1, 1,
0.7801898, 0.2131746, 1.468352, 0.6666667, 0, 1, 1,
0.7826211, 1.586712, 1.791857, 0.6745098, 0, 1, 1,
0.7851008, -0.01389289, 1.624017, 0.6784314, 0, 1, 1,
0.7874049, 1.403898, 1.091807, 0.6862745, 0, 1, 1,
0.7906104, -0.2984799, 2.601729, 0.6901961, 0, 1, 1,
0.794016, -0.6485881, 3.44108, 0.6980392, 0, 1, 1,
0.7992077, 1.742767, 0.6730728, 0.7058824, 0, 1, 1,
0.8021554, 0.4178759, 2.605472, 0.7098039, 0, 1, 1,
0.8029459, -1.10941, 1.960075, 0.7176471, 0, 1, 1,
0.8070223, 0.03674053, 2.654717, 0.7215686, 0, 1, 1,
0.8202689, -0.09426923, 2.016074, 0.7294118, 0, 1, 1,
0.8225248, 0.4644294, -0.6459958, 0.7333333, 0, 1, 1,
0.8263377, 0.2525045, 0.8351395, 0.7411765, 0, 1, 1,
0.8308248, -1.023265, 4.059158, 0.7450981, 0, 1, 1,
0.8318527, -1.21351, 3.614319, 0.7529412, 0, 1, 1,
0.8334439, 0.8113511, 0.5340572, 0.7568628, 0, 1, 1,
0.8359348, -1.43769, 3.775869, 0.7647059, 0, 1, 1,
0.8376688, -0.5939139, 2.338508, 0.7686275, 0, 1, 1,
0.8409036, -0.5111808, 2.485813, 0.7764706, 0, 1, 1,
0.8445408, 0.9853482, 2.153201, 0.7803922, 0, 1, 1,
0.8488241, -0.3748133, 3.587707, 0.7882353, 0, 1, 1,
0.8495058, 1.964212, 0.07874417, 0.7921569, 0, 1, 1,
0.8496852, 1.213838, 1.3659, 0.8, 0, 1, 1,
0.8507675, -0.5593878, 2.319413, 0.8078431, 0, 1, 1,
0.8569273, -1.939899, 1.65783, 0.8117647, 0, 1, 1,
0.864673, 0.2542375, 2.424423, 0.8196079, 0, 1, 1,
0.8684685, -0.6652874, 1.905831, 0.8235294, 0, 1, 1,
0.8777102, 0.4342379, 1.436155, 0.8313726, 0, 1, 1,
0.8787656, -0.4930738, 2.356348, 0.8352941, 0, 1, 1,
0.8813781, 0.02997401, 1.290436, 0.8431373, 0, 1, 1,
0.885594, -1.820049, 3.117072, 0.8470588, 0, 1, 1,
0.8861138, 1.176423, -0.209316, 0.854902, 0, 1, 1,
0.8892907, 0.5524043, 0.8951893, 0.8588235, 0, 1, 1,
0.8910683, 0.05023958, 1.822475, 0.8666667, 0, 1, 1,
0.8911964, 0.6388793, 0.6523451, 0.8705882, 0, 1, 1,
0.8952089, -1.957723, 2.928957, 0.8784314, 0, 1, 1,
0.8978003, -0.5137251, 3.668396, 0.8823529, 0, 1, 1,
0.9021428, -0.1264064, 1.48064, 0.8901961, 0, 1, 1,
0.9055019, 1.533008, 0.3523305, 0.8941177, 0, 1, 1,
0.9058264, 0.5546221, 0.76048, 0.9019608, 0, 1, 1,
0.918801, -0.2056908, 0.7302114, 0.9098039, 0, 1, 1,
0.9233689, 0.06279123, 2.222759, 0.9137255, 0, 1, 1,
0.9281329, -0.18556, 1.579478, 0.9215686, 0, 1, 1,
0.9304608, -0.2778626, 1.099532, 0.9254902, 0, 1, 1,
0.9432064, 0.9885265, 0.3691689, 0.9333333, 0, 1, 1,
0.9467819, -1.868489, 3.216258, 0.9372549, 0, 1, 1,
0.9470014, 0.5096893, 2.012033, 0.945098, 0, 1, 1,
0.9494956, -1.218014, 2.300728, 0.9490196, 0, 1, 1,
0.9501453, -0.718885, 2.65797, 0.9568627, 0, 1, 1,
0.9520221, 0.8920075, 0.08347111, 0.9607843, 0, 1, 1,
0.9553615, 1.989352, 1.292511, 0.9686275, 0, 1, 1,
0.9562209, 2.062149, 1.100837, 0.972549, 0, 1, 1,
0.9640228, 0.748718, 2.310022, 0.9803922, 0, 1, 1,
0.9704446, 0.495163, 1.757034, 0.9843137, 0, 1, 1,
0.9755757, 1.409492, 2.020267, 0.9921569, 0, 1, 1,
0.9799333, 0.3607404, -0.2647526, 0.9960784, 0, 1, 1,
0.9835396, -0.4157546, 2.537138, 1, 0, 0.9960784, 1,
0.984547, -0.7104316, 2.547714, 1, 0, 0.9882353, 1,
0.9913255, -0.1603095, 1.696303, 1, 0, 0.9843137, 1,
0.992655, 0.2769635, 2.024846, 1, 0, 0.9764706, 1,
0.9986991, 0.8265073, 0.5695367, 1, 0, 0.972549, 1,
1.000965, 0.5845572, 0.587656, 1, 0, 0.9647059, 1,
1.001111, -0.3925434, 1.819741, 1, 0, 0.9607843, 1,
1.003327, 0.2246457, 1.112875, 1, 0, 0.9529412, 1,
1.005519, -0.2506732, 2.125734, 1, 0, 0.9490196, 1,
1.009599, 0.807972, 1.157601, 1, 0, 0.9411765, 1,
1.011537, 0.2921664, 1.353615, 1, 0, 0.9372549, 1,
1.012081, -1.830463, 3.777838, 1, 0, 0.9294118, 1,
1.013991, -0.5727875, 1.429691, 1, 0, 0.9254902, 1,
1.01777, -0.06945161, 1.907876, 1, 0, 0.9176471, 1,
1.018613, 0.05317239, 0.5550579, 1, 0, 0.9137255, 1,
1.027666, 1.319519, 0.3255013, 1, 0, 0.9058824, 1,
1.03518, 0.6593191, -1.239386, 1, 0, 0.9019608, 1,
1.036166, -0.3990216, 2.228981, 1, 0, 0.8941177, 1,
1.03843, 0.346583, 0.5809169, 1, 0, 0.8862745, 1,
1.045278, -0.006187811, 1.332363, 1, 0, 0.8823529, 1,
1.046059, 0.7601344, 1.656811, 1, 0, 0.8745098, 1,
1.057018, -0.08505526, 1.00233, 1, 0, 0.8705882, 1,
1.057939, 1.726009, 0.9712841, 1, 0, 0.8627451, 1,
1.059675, -1.31166, 2.661527, 1, 0, 0.8588235, 1,
1.066919, -0.2819667, 1.182859, 1, 0, 0.8509804, 1,
1.077012, 1.225316, 1.346267, 1, 0, 0.8470588, 1,
1.08176, -1.01283, 2.798028, 1, 0, 0.8392157, 1,
1.091364, 1.359298, 2.458549, 1, 0, 0.8352941, 1,
1.092038, 0.445166, -0.2721658, 1, 0, 0.827451, 1,
1.093995, 0.3319666, 1.582044, 1, 0, 0.8235294, 1,
1.094785, -0.9937969, 4.717499, 1, 0, 0.8156863, 1,
1.096663, -0.9003655, 1.738417, 1, 0, 0.8117647, 1,
1.098353, 1.323694, 1.743966, 1, 0, 0.8039216, 1,
1.100052, -0.4359912, 3.641403, 1, 0, 0.7960784, 1,
1.108634, 0.649707, 0.07887575, 1, 0, 0.7921569, 1,
1.115501, 0.8363533, 0.4410044, 1, 0, 0.7843137, 1,
1.116022, -0.3749741, 1.268657, 1, 0, 0.7803922, 1,
1.118332, -0.2967744, 2.025801, 1, 0, 0.772549, 1,
1.121594, 0.02589509, 1.679132, 1, 0, 0.7686275, 1,
1.121887, -0.5366281, 2.505409, 1, 0, 0.7607843, 1,
1.123057, 1.022239, 0.7716954, 1, 0, 0.7568628, 1,
1.124619, -0.1884079, 0.8073577, 1, 0, 0.7490196, 1,
1.131524, -0.2000887, 1.330954, 1, 0, 0.7450981, 1,
1.132693, 0.4653722, 0.4468126, 1, 0, 0.7372549, 1,
1.133676, -0.5134286, 3.023142, 1, 0, 0.7333333, 1,
1.139927, 1.740123, 1.267193, 1, 0, 0.7254902, 1,
1.158641, -0.2166606, 2.324822, 1, 0, 0.7215686, 1,
1.158935, -1.384701, 3.915234, 1, 0, 0.7137255, 1,
1.166342, -0.1124089, 0.5281122, 1, 0, 0.7098039, 1,
1.167022, -2.230636, 4.559874, 1, 0, 0.7019608, 1,
1.169023, 1.308211, 0.6991948, 1, 0, 0.6941177, 1,
1.170664, 0.8637306, 1.369148, 1, 0, 0.6901961, 1,
1.174024, -2.119798, 1.592094, 1, 0, 0.682353, 1,
1.187139, 0.5013792, 0.9647112, 1, 0, 0.6784314, 1,
1.187333, 1.475569, 0.8420523, 1, 0, 0.6705883, 1,
1.193043, 0.3203341, 0.146461, 1, 0, 0.6666667, 1,
1.19464, -0.263897, 1.624334, 1, 0, 0.6588235, 1,
1.211, 0.6287027, 1.50465, 1, 0, 0.654902, 1,
1.220233, -0.05772283, 2.50134, 1, 0, 0.6470588, 1,
1.225843, -0.01351471, 1.613942, 1, 0, 0.6431373, 1,
1.229592, -1.021526, 2.536827, 1, 0, 0.6352941, 1,
1.229971, 0.5019715, 1.467522, 1, 0, 0.6313726, 1,
1.25, 0.6132696, 2.366075, 1, 0, 0.6235294, 1,
1.250488, 0.2912824, 0.5953715, 1, 0, 0.6196079, 1,
1.26672, -3.165988, 3.210854, 1, 0, 0.6117647, 1,
1.278032, -0.02164548, 2.796391, 1, 0, 0.6078432, 1,
1.279755, -0.3317998, 0.8889464, 1, 0, 0.6, 1,
1.281311, 0.2850154, 0.8648226, 1, 0, 0.5921569, 1,
1.283901, -0.117326, 2.040931, 1, 0, 0.5882353, 1,
1.289906, 0.3487886, 2.262657, 1, 0, 0.5803922, 1,
1.296524, -0.7788917, 2.096648, 1, 0, 0.5764706, 1,
1.304851, -2.05512, 2.195979, 1, 0, 0.5686275, 1,
1.315096, -0.04830827, 4.123816, 1, 0, 0.5647059, 1,
1.320024, -1.200276, 3.602223, 1, 0, 0.5568628, 1,
1.321132, 0.2059521, -0.02470498, 1, 0, 0.5529412, 1,
1.324002, 1.089863, 0.31988, 1, 0, 0.5450981, 1,
1.3253, 0.4780788, 2.277794, 1, 0, 0.5411765, 1,
1.327996, -0.3180394, 0.3746668, 1, 0, 0.5333334, 1,
1.331988, -1.266253, 2.870863, 1, 0, 0.5294118, 1,
1.33904, -0.5935089, 0.1210886, 1, 0, 0.5215687, 1,
1.349232, -1.359256, 1.836091, 1, 0, 0.5176471, 1,
1.359695, -0.8226404, 2.527534, 1, 0, 0.509804, 1,
1.35994, 1.083463, -0.1321422, 1, 0, 0.5058824, 1,
1.372172, 0.661715, 1.473643, 1, 0, 0.4980392, 1,
1.383029, -0.3063272, 2.522533, 1, 0, 0.4901961, 1,
1.390329, -0.3083043, 1.756452, 1, 0, 0.4862745, 1,
1.402883, 0.1236076, 2.285047, 1, 0, 0.4784314, 1,
1.403598, 0.6369265, 0.4452555, 1, 0, 0.4745098, 1,
1.40874, -0.1266763, 1.06459, 1, 0, 0.4666667, 1,
1.410733, 0.3554962, 1.720648, 1, 0, 0.4627451, 1,
1.41635, 0.5938288, 1.898488, 1, 0, 0.454902, 1,
1.418149, -0.4018446, 2.023448, 1, 0, 0.4509804, 1,
1.420074, 1.442401, 0.4011775, 1, 0, 0.4431373, 1,
1.426987, 1.185668, 1.135553, 1, 0, 0.4392157, 1,
1.431179, 0.2408286, 1.064054, 1, 0, 0.4313726, 1,
1.441669, 0.1730683, 0.5793618, 1, 0, 0.427451, 1,
1.444473, -1.715521, 3.606043, 1, 0, 0.4196078, 1,
1.457316, -1.704542, 1.819537, 1, 0, 0.4156863, 1,
1.458082, 0.8601319, -0.06147645, 1, 0, 0.4078431, 1,
1.459159, -0.6704263, 0.7417659, 1, 0, 0.4039216, 1,
1.491717, -1.230377, 1.540069, 1, 0, 0.3960784, 1,
1.49425, 0.4474981, -0.3365639, 1, 0, 0.3882353, 1,
1.499591, 0.1954683, 1.971686, 1, 0, 0.3843137, 1,
1.508938, -0.3170746, 1.212929, 1, 0, 0.3764706, 1,
1.524226, -0.5466867, 2.069884, 1, 0, 0.372549, 1,
1.525225, -1.481213, 1.693238, 1, 0, 0.3647059, 1,
1.526634, 1.453718, 2.08568, 1, 0, 0.3607843, 1,
1.534021, -0.5589505, 0.9625966, 1, 0, 0.3529412, 1,
1.534627, -0.5045947, 1.432064, 1, 0, 0.3490196, 1,
1.534773, -0.5172365, 0.7001361, 1, 0, 0.3411765, 1,
1.55607, -2.016553, 2.237159, 1, 0, 0.3372549, 1,
1.57145, -2.179077, 2.010035, 1, 0, 0.3294118, 1,
1.608893, -0.1068961, 1.127149, 1, 0, 0.3254902, 1,
1.612142, 0.2993998, 2.755537, 1, 0, 0.3176471, 1,
1.622207, 0.09020444, 2.166481, 1, 0, 0.3137255, 1,
1.624176, -0.2063726, 0.8368501, 1, 0, 0.3058824, 1,
1.627119, 0.1160339, 1.182973, 1, 0, 0.2980392, 1,
1.636013, 0.734392, -0.3704207, 1, 0, 0.2941177, 1,
1.645743, 0.07233985, 3.428486, 1, 0, 0.2862745, 1,
1.651344, -0.3890103, -0.8205815, 1, 0, 0.282353, 1,
1.65737, 0.1133046, 3.839078, 1, 0, 0.2745098, 1,
1.659088, 0.06498905, 0.951059, 1, 0, 0.2705882, 1,
1.66823, 1.154112, 0.1001643, 1, 0, 0.2627451, 1,
1.679208, 1.282135, 1.547933, 1, 0, 0.2588235, 1,
1.689721, -0.4211402, 1.84903, 1, 0, 0.2509804, 1,
1.703601, -1.218222, 1.724373, 1, 0, 0.2470588, 1,
1.709146, -0.09914126, 0.5410264, 1, 0, 0.2392157, 1,
1.731947, 0.1917402, 1.848242, 1, 0, 0.2352941, 1,
1.756928, -0.2434977, 3.793213, 1, 0, 0.227451, 1,
1.757298, 0.1090918, 0.3341988, 1, 0, 0.2235294, 1,
1.768341, 0.05541071, 2.249777, 1, 0, 0.2156863, 1,
1.768643, 1.407656, 1.08583, 1, 0, 0.2117647, 1,
1.776992, -0.1267642, 1.636326, 1, 0, 0.2039216, 1,
1.790637, -0.1074859, 0.4717016, 1, 0, 0.1960784, 1,
1.797621, 1.597325, 0.7687331, 1, 0, 0.1921569, 1,
1.805233, -0.3715542, 1.953135, 1, 0, 0.1843137, 1,
1.87598, 0.05954727, 3.033825, 1, 0, 0.1803922, 1,
1.925497, -0.1173455, 1.793738, 1, 0, 0.172549, 1,
1.962931, -1.157933, 1.799289, 1, 0, 0.1686275, 1,
1.977989, 0.4012985, 2.082295, 1, 0, 0.1607843, 1,
1.983876, -0.6460764, 1.769918, 1, 0, 0.1568628, 1,
1.994972, 0.8821579, 1.820249, 1, 0, 0.1490196, 1,
2.031345, 0.08947854, 0.6434568, 1, 0, 0.145098, 1,
2.071389, 0.8306317, 0.8949171, 1, 0, 0.1372549, 1,
2.122046, -0.6077992, 1.845351, 1, 0, 0.1333333, 1,
2.137893, 1.497653, -0.18238, 1, 0, 0.1254902, 1,
2.147655, 0.3396951, 1.501318, 1, 0, 0.1215686, 1,
2.218183, 0.07706489, 1.524182, 1, 0, 0.1137255, 1,
2.221813, 0.2042148, 3.232917, 1, 0, 0.1098039, 1,
2.226449, 1.391785, 0.5770483, 1, 0, 0.1019608, 1,
2.251657, 1.215613, 2.250381, 1, 0, 0.09411765, 1,
2.274094, 0.435972, 0.5447367, 1, 0, 0.09019608, 1,
2.326228, -0.2039151, 2.290472, 1, 0, 0.08235294, 1,
2.433121, -1.157624, 3.814258, 1, 0, 0.07843138, 1,
2.46871, -0.5082762, 1.586451, 1, 0, 0.07058824, 1,
2.526565, 0.8975602, 0.3966766, 1, 0, 0.06666667, 1,
2.767969, -1.326338, 3.230283, 1, 0, 0.05882353, 1,
2.776604, 0.1933726, 1.958143, 1, 0, 0.05490196, 1,
2.778147, 0.6851051, 1.862872, 1, 0, 0.04705882, 1,
2.804515, -0.4280375, 1.875488, 1, 0, 0.04313726, 1,
2.845487, -0.8791625, 2.044752, 1, 0, 0.03529412, 1,
2.944935, 0.6480917, 2.54319, 1, 0, 0.03137255, 1,
3.078747, -0.5411125, 1.040126, 1, 0, 0.02352941, 1,
3.085409, 0.6462522, 0.02842112, 1, 0, 0.01960784, 1,
3.1098, -0.7565217, 1.413248, 1, 0, 0.01176471, 1,
3.51831, -0.3477529, 1.184733, 1, 0, 0.007843138, 1
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
0.2456326, -4.254529, -6.559266, 0, -0.5, 0.5, 0.5,
0.2456326, -4.254529, -6.559266, 1, -0.5, 0.5, 0.5,
0.2456326, -4.254529, -6.559266, 1, 1.5, 0.5, 0.5,
0.2456326, -4.254529, -6.559266, 0, 1.5, 0.5, 0.5
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
-4.136482, 0.04504704, -6.559266, 0, -0.5, 0.5, 0.5,
-4.136482, 0.04504704, -6.559266, 1, -0.5, 0.5, 0.5,
-4.136482, 0.04504704, -6.559266, 1, 1.5, 0.5, 0.5,
-4.136482, 0.04504704, -6.559266, 0, 1.5, 0.5, 0.5
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
-4.136482, -4.254529, 0.106673, 0, -0.5, 0.5, 0.5,
-4.136482, -4.254529, 0.106673, 1, -0.5, 0.5, 0.5,
-4.136482, -4.254529, 0.106673, 1, 1.5, 0.5, 0.5,
-4.136482, -4.254529, 0.106673, 0, 1.5, 0.5, 0.5
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
-3, -3.262319, -5.020972,
3, -3.262319, -5.020972,
-3, -3.262319, -5.020972,
-3, -3.427687, -5.277354,
-2, -3.262319, -5.020972,
-2, -3.427687, -5.277354,
-1, -3.262319, -5.020972,
-1, -3.427687, -5.277354,
0, -3.262319, -5.020972,
0, -3.427687, -5.277354,
1, -3.262319, -5.020972,
1, -3.427687, -5.277354,
2, -3.262319, -5.020972,
2, -3.427687, -5.277354,
3, -3.262319, -5.020972,
3, -3.427687, -5.277354
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
-3, -3.758424, -5.790119, 0, -0.5, 0.5, 0.5,
-3, -3.758424, -5.790119, 1, -0.5, 0.5, 0.5,
-3, -3.758424, -5.790119, 1, 1.5, 0.5, 0.5,
-3, -3.758424, -5.790119, 0, 1.5, 0.5, 0.5,
-2, -3.758424, -5.790119, 0, -0.5, 0.5, 0.5,
-2, -3.758424, -5.790119, 1, -0.5, 0.5, 0.5,
-2, -3.758424, -5.790119, 1, 1.5, 0.5, 0.5,
-2, -3.758424, -5.790119, 0, 1.5, 0.5, 0.5,
-1, -3.758424, -5.790119, 0, -0.5, 0.5, 0.5,
-1, -3.758424, -5.790119, 1, -0.5, 0.5, 0.5,
-1, -3.758424, -5.790119, 1, 1.5, 0.5, 0.5,
-1, -3.758424, -5.790119, 0, 1.5, 0.5, 0.5,
0, -3.758424, -5.790119, 0, -0.5, 0.5, 0.5,
0, -3.758424, -5.790119, 1, -0.5, 0.5, 0.5,
0, -3.758424, -5.790119, 1, 1.5, 0.5, 0.5,
0, -3.758424, -5.790119, 0, 1.5, 0.5, 0.5,
1, -3.758424, -5.790119, 0, -0.5, 0.5, 0.5,
1, -3.758424, -5.790119, 1, -0.5, 0.5, 0.5,
1, -3.758424, -5.790119, 1, 1.5, 0.5, 0.5,
1, -3.758424, -5.790119, 0, 1.5, 0.5, 0.5,
2, -3.758424, -5.790119, 0, -0.5, 0.5, 0.5,
2, -3.758424, -5.790119, 1, -0.5, 0.5, 0.5,
2, -3.758424, -5.790119, 1, 1.5, 0.5, 0.5,
2, -3.758424, -5.790119, 0, 1.5, 0.5, 0.5,
3, -3.758424, -5.790119, 0, -0.5, 0.5, 0.5,
3, -3.758424, -5.790119, 1, -0.5, 0.5, 0.5,
3, -3.758424, -5.790119, 1, 1.5, 0.5, 0.5,
3, -3.758424, -5.790119, 0, 1.5, 0.5, 0.5
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
-3.125225, -3, -5.020972,
-3.125225, 3, -5.020972,
-3.125225, -3, -5.020972,
-3.293768, -3, -5.277354,
-3.125225, -2, -5.020972,
-3.293768, -2, -5.277354,
-3.125225, -1, -5.020972,
-3.293768, -1, -5.277354,
-3.125225, 0, -5.020972,
-3.293768, 0, -5.277354,
-3.125225, 1, -5.020972,
-3.293768, 1, -5.277354,
-3.125225, 2, -5.020972,
-3.293768, 2, -5.277354,
-3.125225, 3, -5.020972,
-3.293768, 3, -5.277354
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
-3.630854, -3, -5.790119, 0, -0.5, 0.5, 0.5,
-3.630854, -3, -5.790119, 1, -0.5, 0.5, 0.5,
-3.630854, -3, -5.790119, 1, 1.5, 0.5, 0.5,
-3.630854, -3, -5.790119, 0, 1.5, 0.5, 0.5,
-3.630854, -2, -5.790119, 0, -0.5, 0.5, 0.5,
-3.630854, -2, -5.790119, 1, -0.5, 0.5, 0.5,
-3.630854, -2, -5.790119, 1, 1.5, 0.5, 0.5,
-3.630854, -2, -5.790119, 0, 1.5, 0.5, 0.5,
-3.630854, -1, -5.790119, 0, -0.5, 0.5, 0.5,
-3.630854, -1, -5.790119, 1, -0.5, 0.5, 0.5,
-3.630854, -1, -5.790119, 1, 1.5, 0.5, 0.5,
-3.630854, -1, -5.790119, 0, 1.5, 0.5, 0.5,
-3.630854, 0, -5.790119, 0, -0.5, 0.5, 0.5,
-3.630854, 0, -5.790119, 1, -0.5, 0.5, 0.5,
-3.630854, 0, -5.790119, 1, 1.5, 0.5, 0.5,
-3.630854, 0, -5.790119, 0, 1.5, 0.5, 0.5,
-3.630854, 1, -5.790119, 0, -0.5, 0.5, 0.5,
-3.630854, 1, -5.790119, 1, -0.5, 0.5, 0.5,
-3.630854, 1, -5.790119, 1, 1.5, 0.5, 0.5,
-3.630854, 1, -5.790119, 0, 1.5, 0.5, 0.5,
-3.630854, 2, -5.790119, 0, -0.5, 0.5, 0.5,
-3.630854, 2, -5.790119, 1, -0.5, 0.5, 0.5,
-3.630854, 2, -5.790119, 1, 1.5, 0.5, 0.5,
-3.630854, 2, -5.790119, 0, 1.5, 0.5, 0.5,
-3.630854, 3, -5.790119, 0, -0.5, 0.5, 0.5,
-3.630854, 3, -5.790119, 1, -0.5, 0.5, 0.5,
-3.630854, 3, -5.790119, 1, 1.5, 0.5, 0.5,
-3.630854, 3, -5.790119, 0, 1.5, 0.5, 0.5
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
-3.125225, -3.262319, -4,
-3.125225, -3.262319, 4,
-3.125225, -3.262319, -4,
-3.293768, -3.427687, -4,
-3.125225, -3.262319, -2,
-3.293768, -3.427687, -2,
-3.125225, -3.262319, 0,
-3.293768, -3.427687, 0,
-3.125225, -3.262319, 2,
-3.293768, -3.427687, 2,
-3.125225, -3.262319, 4,
-3.293768, -3.427687, 4
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
-3.630854, -3.758424, -4, 0, -0.5, 0.5, 0.5,
-3.630854, -3.758424, -4, 1, -0.5, 0.5, 0.5,
-3.630854, -3.758424, -4, 1, 1.5, 0.5, 0.5,
-3.630854, -3.758424, -4, 0, 1.5, 0.5, 0.5,
-3.630854, -3.758424, -2, 0, -0.5, 0.5, 0.5,
-3.630854, -3.758424, -2, 1, -0.5, 0.5, 0.5,
-3.630854, -3.758424, -2, 1, 1.5, 0.5, 0.5,
-3.630854, -3.758424, -2, 0, 1.5, 0.5, 0.5,
-3.630854, -3.758424, 0, 0, -0.5, 0.5, 0.5,
-3.630854, -3.758424, 0, 1, -0.5, 0.5, 0.5,
-3.630854, -3.758424, 0, 1, 1.5, 0.5, 0.5,
-3.630854, -3.758424, 0, 0, 1.5, 0.5, 0.5,
-3.630854, -3.758424, 2, 0, -0.5, 0.5, 0.5,
-3.630854, -3.758424, 2, 1, -0.5, 0.5, 0.5,
-3.630854, -3.758424, 2, 1, 1.5, 0.5, 0.5,
-3.630854, -3.758424, 2, 0, 1.5, 0.5, 0.5,
-3.630854, -3.758424, 4, 0, -0.5, 0.5, 0.5,
-3.630854, -3.758424, 4, 1, -0.5, 0.5, 0.5,
-3.630854, -3.758424, 4, 1, 1.5, 0.5, 0.5,
-3.630854, -3.758424, 4, 0, 1.5, 0.5, 0.5
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
-3.125225, -3.262319, -5.020972,
-3.125225, 3.352413, -5.020972,
-3.125225, -3.262319, 5.234318,
-3.125225, 3.352413, 5.234318,
-3.125225, -3.262319, -5.020972,
-3.125225, -3.262319, 5.234318,
-3.125225, 3.352413, -5.020972,
-3.125225, 3.352413, 5.234318,
-3.125225, -3.262319, -5.020972,
3.61649, -3.262319, -5.020972,
-3.125225, -3.262319, 5.234318,
3.61649, -3.262319, 5.234318,
-3.125225, 3.352413, -5.020972,
3.61649, 3.352413, -5.020972,
-3.125225, 3.352413, 5.234318,
3.61649, 3.352413, 5.234318,
3.61649, -3.262319, -5.020972,
3.61649, 3.352413, -5.020972,
3.61649, -3.262319, 5.234318,
3.61649, 3.352413, 5.234318,
3.61649, -3.262319, -5.020972,
3.61649, -3.262319, 5.234318,
3.61649, 3.352413, -5.020972,
3.61649, 3.352413, 5.234318
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
var radius = 7.4447;
var distance = 33.12231;
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
mvMatrix.translate( -0.2456326, -0.04504704, -0.106673 );
mvMatrix.scale( 1.193962, 1.216883, 0.7848979 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.12231);
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
CDAA<-read.table("CDAA.xyz")
```

```
## Error in read.table("CDAA.xyz"): no lines available in input
```

```r
x<-CDAA$V2
```

```
## Error in eval(expr, envir, enclos): object 'CDAA' not found
```

```r
y<-CDAA$V3
```

```
## Error in eval(expr, envir, enclos): object 'CDAA' not found
```

```r
z<-CDAA$V4
```

```
## Error in eval(expr, envir, enclos): object 'CDAA' not found
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
-3.027045, -0.6389144, -1.424368, 0, 0, 1, 1, 1,
-2.996354, 1.601522, 0.04363359, 1, 0, 0, 1, 1,
-2.747175, -0.8653052, -2.396556, 1, 0, 0, 1, 1,
-2.632363, 0.6006517, 0.7059106, 1, 0, 0, 1, 1,
-2.57311, -0.4916942, -0.2326756, 1, 0, 0, 1, 1,
-2.487947, -0.8809509, -1.702643, 1, 0, 0, 1, 1,
-2.477483, 0.1375977, -1.691286, 0, 0, 0, 1, 1,
-2.455109, 0.3220899, -1.732768, 0, 0, 0, 1, 1,
-2.305314, 0.225295, -1.390931, 0, 0, 0, 1, 1,
-2.286078, -0.9351983, -2.45222, 0, 0, 0, 1, 1,
-2.277626, -2.289012, -1.400214, 0, 0, 0, 1, 1,
-2.213592, -0.7854207, -1.765035, 0, 0, 0, 1, 1,
-2.171365, 1.207527, -1.306971, 0, 0, 0, 1, 1,
-2.092556, -1.015277, -1.970884, 1, 1, 1, 1, 1,
-2.058544, 1.483006, -1.904456, 1, 1, 1, 1, 1,
-2.014934, 0.3440562, -0.2254329, 1, 1, 1, 1, 1,
-1.970882, 1.330483, -0.9579864, 1, 1, 1, 1, 1,
-1.968075, 0.8197778, 0.3071455, 1, 1, 1, 1, 1,
-1.957747, 1.936147, -0.4033474, 1, 1, 1, 1, 1,
-1.903444, 1.323712, -1.038343, 1, 1, 1, 1, 1,
-1.892638, -0.1305493, -1.364682, 1, 1, 1, 1, 1,
-1.888473, 0.6645423, -1.302068, 1, 1, 1, 1, 1,
-1.873284, -2.028556, -1.32163, 1, 1, 1, 1, 1,
-1.836578, 1.111233, -1.413492, 1, 1, 1, 1, 1,
-1.820357, 0.5394749, -1.962245, 1, 1, 1, 1, 1,
-1.818817, -0.9175974, -2.425313, 1, 1, 1, 1, 1,
-1.746456, 1.417855, -2.46635, 1, 1, 1, 1, 1,
-1.737077, -0.2598111, -0.6939764, 1, 1, 1, 1, 1,
-1.735885, -0.1771017, -1.709875, 0, 0, 1, 1, 1,
-1.716067, 0.5275862, -1.291131, 1, 0, 0, 1, 1,
-1.713268, -0.187459, -1.507475, 1, 0, 0, 1, 1,
-1.689869, 0.6911427, -1.408359, 1, 0, 0, 1, 1,
-1.685363, -2.224602, -3.346928, 1, 0, 0, 1, 1,
-1.679466, 1.004588, -0.8256713, 1, 0, 0, 1, 1,
-1.646498, -0.7264243, -2.828056, 0, 0, 0, 1, 1,
-1.635402, -1.786115, -0.8224204, 0, 0, 0, 1, 1,
-1.616449, -1.137433, -3.613777, 0, 0, 0, 1, 1,
-1.609124, 0.3010786, -0.3436271, 0, 0, 0, 1, 1,
-1.601918, -1.314402, -4.117621, 0, 0, 0, 1, 1,
-1.599426, -0.9798368, -2.467262, 0, 0, 0, 1, 1,
-1.591433, 0.2615851, -0.5402997, 0, 0, 0, 1, 1,
-1.57406, 0.02851195, -1.109606, 1, 1, 1, 1, 1,
-1.553938, 0.1676508, -2.595958, 1, 1, 1, 1, 1,
-1.551278, -1.642603, -2.194795, 1, 1, 1, 1, 1,
-1.533856, -0.4442277, -0.7674801, 1, 1, 1, 1, 1,
-1.531511, 0.1008249, -1.838872, 1, 1, 1, 1, 1,
-1.527793, -0.2889808, -1.190507, 1, 1, 1, 1, 1,
-1.523581, -0.1133, -3.237685, 1, 1, 1, 1, 1,
-1.522002, 0.6187491, -0.9207217, 1, 1, 1, 1, 1,
-1.52125, -0.8434657, -0.300694, 1, 1, 1, 1, 1,
-1.48253, -1.143879, -1.162383, 1, 1, 1, 1, 1,
-1.47659, 1.43216, -0.5144674, 1, 1, 1, 1, 1,
-1.446581, 0.2969959, 0.2926616, 1, 1, 1, 1, 1,
-1.436333, 0.9121532, -0.2569407, 1, 1, 1, 1, 1,
-1.434841, -0.1335219, -0.7538889, 1, 1, 1, 1, 1,
-1.424545, -0.1973369, -0.3480085, 1, 1, 1, 1, 1,
-1.406649, -0.9393942, -1.52719, 0, 0, 1, 1, 1,
-1.403356, 1.466997, 0.5219872, 1, 0, 0, 1, 1,
-1.397791, 0.1459134, -0.8981863, 1, 0, 0, 1, 1,
-1.397654, -0.8378977, -2.472337, 1, 0, 0, 1, 1,
-1.393169, 1.905141, -0.8663314, 1, 0, 0, 1, 1,
-1.364114, -1.144853, -1.65777, 1, 0, 0, 1, 1,
-1.362442, -1.896909, -2.299336, 0, 0, 0, 1, 1,
-1.358937, -0.6986284, -1.585737, 0, 0, 0, 1, 1,
-1.354334, -1.522372, -1.859679, 0, 0, 0, 1, 1,
-1.336299, 0.3562966, -2.93776, 0, 0, 0, 1, 1,
-1.335712, 1.717107, -0.3826411, 0, 0, 0, 1, 1,
-1.333927, 0.2800469, -0.8077874, 0, 0, 0, 1, 1,
-1.329736, 0.8050439, -0.7402413, 0, 0, 0, 1, 1,
-1.329358, 0.9523469, -2.642245, 1, 1, 1, 1, 1,
-1.313328, 0.2818768, -1.921079, 1, 1, 1, 1, 1,
-1.312463, -1.320631, -4.061729, 1, 1, 1, 1, 1,
-1.307481, 0.7530504, -0.9065416, 1, 1, 1, 1, 1,
-1.302881, 0.6737301, 0.24693, 1, 1, 1, 1, 1,
-1.301743, 1.753929, -2.270607, 1, 1, 1, 1, 1,
-1.299632, 0.7760405, -1.857256, 1, 1, 1, 1, 1,
-1.297055, 0.5154284, -2.385062, 1, 1, 1, 1, 1,
-1.290138, 3.256082, 0.1476062, 1, 1, 1, 1, 1,
-1.287573, -0.5002822, -0.9912033, 1, 1, 1, 1, 1,
-1.279565, -1.665022, -4.334013, 1, 1, 1, 1, 1,
-1.274673, 0.5226187, -0.5665535, 1, 1, 1, 1, 1,
-1.273841, -1.110881, -2.908609, 1, 1, 1, 1, 1,
-1.270658, 0.6179975, -2.337628, 1, 1, 1, 1, 1,
-1.266, -0.8840342, -2.304408, 1, 1, 1, 1, 1,
-1.259871, -2.392187, -1.211574, 0, 0, 1, 1, 1,
-1.25493, -1.922003, -1.958549, 1, 0, 0, 1, 1,
-1.254539, -0.7641605, -1.899843, 1, 0, 0, 1, 1,
-1.248013, 0.9812044, -0.7561478, 1, 0, 0, 1, 1,
-1.243096, 1.307117, -0.4137731, 1, 0, 0, 1, 1,
-1.222426, 0.2318362, -2.667129, 1, 0, 0, 1, 1,
-1.219417, -0.6203756, -2.378911, 0, 0, 0, 1, 1,
-1.203487, 1.43042, -1.410045, 0, 0, 0, 1, 1,
-1.196057, -1.195246, -3.513915, 0, 0, 0, 1, 1,
-1.185633, -1.849558, -3.486064, 0, 0, 0, 1, 1,
-1.17853, 0.793451, -1.839197, 0, 0, 0, 1, 1,
-1.176032, 0.06157633, -1.49613, 0, 0, 0, 1, 1,
-1.17278, 0.3570873, -0.189758, 0, 0, 0, 1, 1,
-1.168503, -0.1161245, -1.622414, 1, 1, 1, 1, 1,
-1.160486, 0.3212043, -0.4521149, 1, 1, 1, 1, 1,
-1.159522, 0.8661807, -2.138759, 1, 1, 1, 1, 1,
-1.156592, 1.387211, 0.4562177, 1, 1, 1, 1, 1,
-1.15028, -0.2256191, -3.831475, 1, 1, 1, 1, 1,
-1.148348, -0.7766678, -1.236567, 1, 1, 1, 1, 1,
-1.148094, 0.8613593, -3.278047, 1, 1, 1, 1, 1,
-1.142099, 0.1368194, -1.149337, 1, 1, 1, 1, 1,
-1.138348, -0.3343482, -2.849415, 1, 1, 1, 1, 1,
-1.138011, 1.024113, -0.399904, 1, 1, 1, 1, 1,
-1.137096, 0.2250244, -0.9773461, 1, 1, 1, 1, 1,
-1.129428, -1.082014, -3.613879, 1, 1, 1, 1, 1,
-1.129208, -0.9719337, -2.843516, 1, 1, 1, 1, 1,
-1.129169, 1.223776, -1.149513, 1, 1, 1, 1, 1,
-1.127936, 0.2298115, -3.143674, 1, 1, 1, 1, 1,
-1.126088, -0.3842409, -1.425867, 0, 0, 1, 1, 1,
-1.118174, -0.1530232, -1.65317, 1, 0, 0, 1, 1,
-1.108915, -0.5811676, -1.355278, 1, 0, 0, 1, 1,
-1.106407, -1.858484, -4.336917, 1, 0, 0, 1, 1,
-1.105154, -1.485417, -1.76595, 1, 0, 0, 1, 1,
-1.105077, 0.9538336, -0.4088203, 1, 0, 0, 1, 1,
-1.10338, 0.6827651, -0.4005977, 0, 0, 0, 1, 1,
-1.099827, -1.026164, -1.376391, 0, 0, 0, 1, 1,
-1.097067, -2.276528, -4.871623, 0, 0, 0, 1, 1,
-1.084844, 0.7300575, -1.764677, 0, 0, 0, 1, 1,
-1.078677, -0.8762771, -2.342118, 0, 0, 0, 1, 1,
-1.070439, 1.138357, 1.68644, 0, 0, 0, 1, 1,
-1.063454, 1.635178, -1.162817, 0, 0, 0, 1, 1,
-1.058048, 0.03285919, -1.439493, 1, 1, 1, 1, 1,
-1.057931, 0.6252747, -1.262771, 1, 1, 1, 1, 1,
-1.055434, -0.4952014, -3.009333, 1, 1, 1, 1, 1,
-1.055126, -0.118862, -2.286984, 1, 1, 1, 1, 1,
-1.053422, 0.266883, -2.95247, 1, 1, 1, 1, 1,
-1.052979, 1.231652, -1.126979, 1, 1, 1, 1, 1,
-1.049203, 0.8829628, -0.8739502, 1, 1, 1, 1, 1,
-1.044542, -1.259382, -2.170809, 1, 1, 1, 1, 1,
-1.041226, 0.4815716, -0.8245859, 1, 1, 1, 1, 1,
-1.032634, 1.207449, 0.1549643, 1, 1, 1, 1, 1,
-1.017564, 2.325405, -0.2424311, 1, 1, 1, 1, 1,
-0.9928808, 2.407795, 0.5082394, 1, 1, 1, 1, 1,
-0.9870291, -0.2387006, -1.229105, 1, 1, 1, 1, 1,
-0.9848166, 0.5928707, -1.413175, 1, 1, 1, 1, 1,
-0.9807038, -0.4136142, -1.999528, 1, 1, 1, 1, 1,
-0.9621598, -2.039582, -2.626178, 0, 0, 1, 1, 1,
-0.9480534, 0.2571959, -0.5416257, 1, 0, 0, 1, 1,
-0.9474875, -0.2053396, -2.382347, 1, 0, 0, 1, 1,
-0.9420789, -0.80545, -2.595385, 1, 0, 0, 1, 1,
-0.9355831, 0.5587928, -2.205099, 1, 0, 0, 1, 1,
-0.9351385, -0.2705211, -2.168784, 1, 0, 0, 1, 1,
-0.9330193, -1.86193, -4.640489, 0, 0, 0, 1, 1,
-0.9318737, -0.1347145, -0.6170751, 0, 0, 0, 1, 1,
-0.9298055, -1.646978, -1.039099, 0, 0, 0, 1, 1,
-0.9297407, 1.584126, -0.3187611, 0, 0, 0, 1, 1,
-0.9291499, -0.4936381, -0.7948623, 0, 0, 0, 1, 1,
-0.9286485, -0.1070588, -1.06906, 0, 0, 0, 1, 1,
-0.9272607, 0.6782528, -1.643577, 0, 0, 0, 1, 1,
-0.9250609, 1.485929, -2.111669, 1, 1, 1, 1, 1,
-0.9233045, 1.6997, -0.8319792, 1, 1, 1, 1, 1,
-0.9190523, 0.1688811, -2.53395, 1, 1, 1, 1, 1,
-0.9150077, 0.06828029, -1.893121, 1, 1, 1, 1, 1,
-0.91486, 1.284599, 0.00545873, 1, 1, 1, 1, 1,
-0.9145963, -0.8993754, -2.954928, 1, 1, 1, 1, 1,
-0.9129966, 0.3168013, -1.193534, 1, 1, 1, 1, 1,
-0.8977692, -0.0201422, -2.285671, 1, 1, 1, 1, 1,
-0.8934265, -0.9327975, -3.377733, 1, 1, 1, 1, 1,
-0.8891065, 0.4539362, -3.077895, 1, 1, 1, 1, 1,
-0.8735061, -0.2871948, -3.120749, 1, 1, 1, 1, 1,
-0.8658261, -0.9260784, -2.4803, 1, 1, 1, 1, 1,
-0.8643174, -0.137911, -2.306282, 1, 1, 1, 1, 1,
-0.8593411, -0.3105211, -3.095273, 1, 1, 1, 1, 1,
-0.8589488, -0.1992975, -2.594693, 1, 1, 1, 1, 1,
-0.8583584, 0.1713082, -3.020616, 0, 0, 1, 1, 1,
-0.8497373, -1.292442, -3.46063, 1, 0, 0, 1, 1,
-0.8485591, -0.9912921, -2.957369, 1, 0, 0, 1, 1,
-0.848065, 1.520048, 1.935842, 1, 0, 0, 1, 1,
-0.8466593, -1.309346, -1.224751, 1, 0, 0, 1, 1,
-0.8452372, -0.4413359, -3.218937, 1, 0, 0, 1, 1,
-0.839648, -1.141034, -2.340728, 0, 0, 0, 1, 1,
-0.83689, 0.02489167, -1.536012, 0, 0, 0, 1, 1,
-0.8356959, -0.1154807, -1.414398, 0, 0, 0, 1, 1,
-0.8316997, -2.018763, -2.762502, 0, 0, 0, 1, 1,
-0.8240353, -0.7410385, -2.464836, 0, 0, 0, 1, 1,
-0.8188168, -0.9804688, -1.742379, 0, 0, 0, 1, 1,
-0.8114502, -0.6683289, -2.721078, 0, 0, 0, 1, 1,
-0.8041031, 0.6208649, -0.6288016, 1, 1, 1, 1, 1,
-0.7995325, 1.827387, -2.880005, 1, 1, 1, 1, 1,
-0.7927227, -0.3830867, -0.7507647, 1, 1, 1, 1, 1,
-0.7922563, 0.4722846, -3.178222, 1, 1, 1, 1, 1,
-0.7877553, -0.9971279, -3.592246, 1, 1, 1, 1, 1,
-0.7793685, 1.489616, 0.4948346, 1, 1, 1, 1, 1,
-0.7790949, 0.01397062, -0.4815919, 1, 1, 1, 1, 1,
-0.7786967, -0.2090033, -2.149278, 1, 1, 1, 1, 1,
-0.7778483, -0.01998589, -1.332561, 1, 1, 1, 1, 1,
-0.7615704, 1.308925, -1.808666, 1, 1, 1, 1, 1,
-0.7609188, 0.7469199, -0.6619616, 1, 1, 1, 1, 1,
-0.7579662, 0.9989031, -1.736912, 1, 1, 1, 1, 1,
-0.7532246, 1.140124, -1.268646, 1, 1, 1, 1, 1,
-0.7521362, 0.8055616, -0.9581335, 1, 1, 1, 1, 1,
-0.7468183, -0.3007777, -3.931261, 1, 1, 1, 1, 1,
-0.7463169, 0.2818311, -1.611924, 0, 0, 1, 1, 1,
-0.7458857, 0.2030747, -3.486823, 1, 0, 0, 1, 1,
-0.7406011, -0.8368807, -2.647537, 1, 0, 0, 1, 1,
-0.7374012, -0.6299667, -3.955507, 1, 0, 0, 1, 1,
-0.7319574, -0.4709954, -1.759532, 1, 0, 0, 1, 1,
-0.7307836, -0.8119208, -1.335734, 1, 0, 0, 1, 1,
-0.7269154, -0.5622282, -2.340865, 0, 0, 0, 1, 1,
-0.7257607, -0.02452069, -1.585401, 0, 0, 0, 1, 1,
-0.7253144, -2.16911, -2.562418, 0, 0, 0, 1, 1,
-0.7148712, -0.8439401, -3.727715, 0, 0, 0, 1, 1,
-0.7120506, -1.23473, -2.490748, 0, 0, 0, 1, 1,
-0.7104948, -1.223254, -2.907795, 0, 0, 0, 1, 1,
-0.7085795, 0.2348547, -0.9284307, 0, 0, 0, 1, 1,
-0.7075365, -0.0003494774, -2.374024, 1, 1, 1, 1, 1,
-0.7061516, 0.2001747, -1.22511, 1, 1, 1, 1, 1,
-0.7056479, 0.5388864, 0.1145739, 1, 1, 1, 1, 1,
-0.705018, -0.5086538, -1.923098, 1, 1, 1, 1, 1,
-0.7043108, 0.8461574, -1.081193, 1, 1, 1, 1, 1,
-0.7040379, 1.51076, 0.7416866, 1, 1, 1, 1, 1,
-0.7024156, 1.309161, -0.6140153, 1, 1, 1, 1, 1,
-0.7000394, 0.1429358, -1.755457, 1, 1, 1, 1, 1,
-0.6955782, -0.8359854, -3.346813, 1, 1, 1, 1, 1,
-0.694499, -1.486744, -3.919413, 1, 1, 1, 1, 1,
-0.6883122, 0.4901086, -1.962497, 1, 1, 1, 1, 1,
-0.6881868, -0.04148433, -1.430221, 1, 1, 1, 1, 1,
-0.6859246, -0.8355635, -3.654085, 1, 1, 1, 1, 1,
-0.6839158, 0.4480627, -0.3222173, 1, 1, 1, 1, 1,
-0.6837721, 0.4501904, 0.522119, 1, 1, 1, 1, 1,
-0.6834769, -1.354399, -3.326834, 0, 0, 1, 1, 1,
-0.6834478, -1.702796, -0.7584217, 1, 0, 0, 1, 1,
-0.6809909, 0.5973231, -0.1189935, 1, 0, 0, 1, 1,
-0.6751629, -1.460394, -2.769855, 1, 0, 0, 1, 1,
-0.6742011, -1.433557, -2.060847, 1, 0, 0, 1, 1,
-0.6657645, -0.4411116, -2.227767, 1, 0, 0, 1, 1,
-0.6614813, -0.2799819, -1.063176, 0, 0, 0, 1, 1,
-0.656088, -0.5652217, -2.627196, 0, 0, 0, 1, 1,
-0.6438916, -0.3399698, -0.4354074, 0, 0, 0, 1, 1,
-0.6435248, 0.06028213, -2.45536, 0, 0, 0, 1, 1,
-0.6397479, -2.970289, -3.061223, 0, 0, 0, 1, 1,
-0.6363047, -1.480415, -1.281229, 0, 0, 0, 1, 1,
-0.6356714, -2.166538, -4.513354, 0, 0, 0, 1, 1,
-0.628554, -0.5219349, -1.724666, 1, 1, 1, 1, 1,
-0.6261883, -0.2666492, -1.48699, 1, 1, 1, 1, 1,
-0.6256849, 1.190568, -1.004888, 1, 1, 1, 1, 1,
-0.6250045, -0.2731276, -1.650573, 1, 1, 1, 1, 1,
-0.6241764, 1.160196, -1.319262, 1, 1, 1, 1, 1,
-0.6228533, 0.4498192, 0.4203819, 1, 1, 1, 1, 1,
-0.6210035, -0.5164051, -0.9095922, 1, 1, 1, 1, 1,
-0.6192915, -0.1262665, -2.030315, 1, 1, 1, 1, 1,
-0.618493, 0.7189466, -1.931128, 1, 1, 1, 1, 1,
-0.6155186, -0.7982438, -1.960796, 1, 1, 1, 1, 1,
-0.6069579, 0.4090682, -0.7516636, 1, 1, 1, 1, 1,
-0.6025097, 1.418368, -2.232658, 1, 1, 1, 1, 1,
-0.6014364, -0.3536942, -1.119691, 1, 1, 1, 1, 1,
-0.5978783, -0.8243928, -1.552402, 1, 1, 1, 1, 1,
-0.5915151, 0.644784, -0.8797885, 1, 1, 1, 1, 1,
-0.5912474, -0.5763267, -1.321787, 0, 0, 1, 1, 1,
-0.5909249, -0.2285305, -1.700025, 1, 0, 0, 1, 1,
-0.5887904, -2.206406, -2.654041, 1, 0, 0, 1, 1,
-0.5879623, 0.5817277, -0.3326099, 1, 0, 0, 1, 1,
-0.5878303, 0.6762488, 0.2962425, 1, 0, 0, 1, 1,
-0.5873219, 0.3116476, -0.7816354, 1, 0, 0, 1, 1,
-0.5829663, 1.23541, 0.4812938, 0, 0, 0, 1, 1,
-0.5797964, 0.7039757, 1.128772, 0, 0, 0, 1, 1,
-0.5790858, -0.1111636, -1.717026, 0, 0, 0, 1, 1,
-0.5790114, 0.07507916, 0.1545607, 0, 0, 0, 1, 1,
-0.5730673, -0.7490017, -2.916111, 0, 0, 0, 1, 1,
-0.5678725, -0.5662134, -1.714729, 0, 0, 0, 1, 1,
-0.5674294, 0.8571067, 0.1826914, 0, 0, 0, 1, 1,
-0.5672146, 1.64435, 1.130299, 1, 1, 1, 1, 1,
-0.5642791, 0.4715007, -0.445554, 1, 1, 1, 1, 1,
-0.5635686, -0.4988237, -3.670113, 1, 1, 1, 1, 1,
-0.5626966, 0.009020559, -1.44784, 1, 1, 1, 1, 1,
-0.5607836, 0.455461, -0.4666362, 1, 1, 1, 1, 1,
-0.558787, -1.1874, -2.423009, 1, 1, 1, 1, 1,
-0.5582984, -1.384284, -3.953314, 1, 1, 1, 1, 1,
-0.5541875, -1.674593, -1.885897, 1, 1, 1, 1, 1,
-0.5519133, 0.598401, -0.5127558, 1, 1, 1, 1, 1,
-0.5489401, -1.223335, -2.849804, 1, 1, 1, 1, 1,
-0.5488085, 0.1036369, -1.795433, 1, 1, 1, 1, 1,
-0.548482, 0.3073699, -2.879903, 1, 1, 1, 1, 1,
-0.5465796, -1.273629, -1.529199, 1, 1, 1, 1, 1,
-0.5451449, 0.2028067, -0.2311868, 1, 1, 1, 1, 1,
-0.5428274, -0.2667978, -3.12602, 1, 1, 1, 1, 1,
-0.5399055, 0.2450695, 0.01431127, 0, 0, 1, 1, 1,
-0.5370962, 0.2704259, -3.001063, 1, 0, 0, 1, 1,
-0.5313915, 0.9155936, -1.694123, 1, 0, 0, 1, 1,
-0.5214795, 0.2143201, -2.666069, 1, 0, 0, 1, 1,
-0.5178128, -1.564462, -2.744175, 1, 0, 0, 1, 1,
-0.514853, -0.1635065, -4.186171, 1, 0, 0, 1, 1,
-0.509311, 0.09983987, -0.4739201, 0, 0, 0, 1, 1,
-0.5092294, -0.7019244, -0.8599479, 0, 0, 0, 1, 1,
-0.5086327, -0.496511, -3.165699, 0, 0, 0, 1, 1,
-0.5081712, 0.2887294, -0.399, 0, 0, 0, 1, 1,
-0.5071363, 0.06662661, -2.167385, 0, 0, 0, 1, 1,
-0.4990355, 0.4593704, -1.017848, 0, 0, 0, 1, 1,
-0.4975295, 0.5071574, -1.674276, 0, 0, 0, 1, 1,
-0.4931059, -0.3045444, -0.831522, 1, 1, 1, 1, 1,
-0.4875721, -0.08817013, -1.491817, 1, 1, 1, 1, 1,
-0.478436, -0.09223101, -2.615414, 1, 1, 1, 1, 1,
-0.4760066, -0.8645391, -2.8708, 1, 1, 1, 1, 1,
-0.4721852, 1.125262, -1.363601, 1, 1, 1, 1, 1,
-0.4711421, 1.656269, 1.602254, 1, 1, 1, 1, 1,
-0.4653583, -0.7764357, -2.006315, 1, 1, 1, 1, 1,
-0.4653074, -0.7645265, -3.227792, 1, 1, 1, 1, 1,
-0.4590692, -1.85508, -3.445065, 1, 1, 1, 1, 1,
-0.4535955, -0.7949493, -2.262118, 1, 1, 1, 1, 1,
-0.4449164, -0.3284656, -1.684381, 1, 1, 1, 1, 1,
-0.4412168, -2.173568, -3.434718, 1, 1, 1, 1, 1,
-0.4400207, -0.5996307, -3.259192, 1, 1, 1, 1, 1,
-0.4383449, -0.57088, -0.516461, 1, 1, 1, 1, 1,
-0.4379792, 0.09170962, 0.1210337, 1, 1, 1, 1, 1,
-0.4328921, -0.1852127, -0.9998891, 0, 0, 1, 1, 1,
-0.4265189, -0.01277135, -1.71523, 1, 0, 0, 1, 1,
-0.4244142, 1.100538, 0.3854934, 1, 0, 0, 1, 1,
-0.4174117, 0.3760554, -2.010726, 1, 0, 0, 1, 1,
-0.416739, 0.1726206, -1.282246, 1, 0, 0, 1, 1,
-0.4140079, 0.9744701, 0.4743408, 1, 0, 0, 1, 1,
-0.4124219, 1.154486, -1.248763, 0, 0, 0, 1, 1,
-0.4120162, -0.4368875, -2.87937, 0, 0, 0, 1, 1,
-0.4115525, 0.5968941, -0.2354384, 0, 0, 0, 1, 1,
-0.4076819, 0.008733073, -1.001147, 0, 0, 0, 1, 1,
-0.4061624, 0.0521206, -1.724191, 0, 0, 0, 1, 1,
-0.4059882, 0.2550582, 1.043066, 0, 0, 0, 1, 1,
-0.4057257, 0.8071149, -1.7995, 0, 0, 0, 1, 1,
-0.4046435, -0.06983238, -2.399228, 1, 1, 1, 1, 1,
-0.4022595, 0.9258302, 1.011277, 1, 1, 1, 1, 1,
-0.3994009, 0.4818121, -1.289681, 1, 1, 1, 1, 1,
-0.398524, 0.0260362, -2.332129, 1, 1, 1, 1, 1,
-0.3948135, -1.416854, -3.961423, 1, 1, 1, 1, 1,
-0.3727644, 2.116927, 0.8946669, 1, 1, 1, 1, 1,
-0.3723254, -0.28612, -1.234661, 1, 1, 1, 1, 1,
-0.3720161, -0.4126107, -3.318476, 1, 1, 1, 1, 1,
-0.3636196, 0.9830141, -0.8718724, 1, 1, 1, 1, 1,
-0.3618201, 0.2911069, -0.6340728, 1, 1, 1, 1, 1,
-0.3574006, -0.8371921, -3.236819, 1, 1, 1, 1, 1,
-0.3535822, 0.2299733, -2.344092, 1, 1, 1, 1, 1,
-0.3519549, 0.8752409, -1.885678, 1, 1, 1, 1, 1,
-0.3488591, -0.953703, -2.498256, 1, 1, 1, 1, 1,
-0.3478863, 0.8129662, 1.911722, 1, 1, 1, 1, 1,
-0.3472668, -1.563567, -1.46485, 0, 0, 1, 1, 1,
-0.3470573, -1.678352, -1.292112, 1, 0, 0, 1, 1,
-0.3440694, -0.3820252, -3.910856, 1, 0, 0, 1, 1,
-0.3417599, 1.064286, -1.546447, 1, 0, 0, 1, 1,
-0.3416871, 0.1963873, -2.368404, 1, 0, 0, 1, 1,
-0.3399064, 2.310265, -0.6269016, 1, 0, 0, 1, 1,
-0.3390668, 1.82392, 1.352008, 0, 0, 0, 1, 1,
-0.3384491, -0.9046755, -2.412967, 0, 0, 0, 1, 1,
-0.338026, -1.09436, -4.093677, 0, 0, 0, 1, 1,
-0.3365316, -0.04498513, -2.937461, 0, 0, 0, 1, 1,
-0.3360641, 0.3637713, -0.5100027, 0, 0, 0, 1, 1,
-0.3338381, -0.8490469, -1.976376, 0, 0, 0, 1, 1,
-0.3337054, -0.5513043, -3.229235, 0, 0, 0, 1, 1,
-0.3315462, -0.1684796, -3.249974, 1, 1, 1, 1, 1,
-0.3310731, 2.067691, -0.8428592, 1, 1, 1, 1, 1,
-0.3295818, -0.6415864, -0.6753591, 1, 1, 1, 1, 1,
-0.3243747, -1.267022, -3.432405, 1, 1, 1, 1, 1,
-0.3222269, -1.002738, -2.550851, 1, 1, 1, 1, 1,
-0.3161227, -0.4058164, -4.083556, 1, 1, 1, 1, 1,
-0.3114759, -2.121942, -3.834527, 1, 1, 1, 1, 1,
-0.3107675, 2.274565, 0.6986362, 1, 1, 1, 1, 1,
-0.3086104, 0.04678677, -1.649428, 1, 1, 1, 1, 1,
-0.3050256, -0.2321055, -1.744268, 1, 1, 1, 1, 1,
-0.3035746, -0.8876945, -2.758016, 1, 1, 1, 1, 1,
-0.3010406, 0.546737, -0.8381483, 1, 1, 1, 1, 1,
-0.3003897, 0.8428202, -2.047231, 1, 1, 1, 1, 1,
-0.2998212, -0.8743219, -2.520838, 1, 1, 1, 1, 1,
-0.2911952, 0.5456468, 0.0634805, 1, 1, 1, 1, 1,
-0.2886076, -0.6266772, -2.048508, 0, 0, 1, 1, 1,
-0.2883831, 0.5570237, -0.9553442, 1, 0, 0, 1, 1,
-0.2813057, -0.6437736, -2.999181, 1, 0, 0, 1, 1,
-0.2775985, -0.01638894, -2.741069, 1, 0, 0, 1, 1,
-0.2730598, 0.1348006, -1.049901, 1, 0, 0, 1, 1,
-0.271594, -0.162726, -2.781762, 1, 0, 0, 1, 1,
-0.2680275, -1.425409, -1.738855, 0, 0, 0, 1, 1,
-0.2627165, -0.2441399, -1.566153, 0, 0, 0, 1, 1,
-0.2560121, 2.027064, 0.3762142, 0, 0, 0, 1, 1,
-0.2559257, -0.08179028, -2.272344, 0, 0, 0, 1, 1,
-0.2530141, 0.5402327, -0.004786057, 0, 0, 0, 1, 1,
-0.2528278, -0.08940086, -1.776366, 0, 0, 0, 1, 1,
-0.2462345, -0.7053272, -2.990276, 0, 0, 0, 1, 1,
-0.2399919, -0.3260141, -1.16249, 1, 1, 1, 1, 1,
-0.2378385, -1.698912, -2.113422, 1, 1, 1, 1, 1,
-0.2376434, 1.254106, 0.5004, 1, 1, 1, 1, 1,
-0.2373509, -0.1558803, -1.23923, 1, 1, 1, 1, 1,
-0.234631, 0.2663791, -0.7348937, 1, 1, 1, 1, 1,
-0.2346275, 2.311598, 0.1705458, 1, 1, 1, 1, 1,
-0.2344305, -0.840004, -2.070746, 1, 1, 1, 1, 1,
-0.2327324, 0.7863911, 0.1801397, 1, 1, 1, 1, 1,
-0.2325404, 0.4032812, -2.822195, 1, 1, 1, 1, 1,
-0.2325269, 0.6731677, -1.081061, 1, 1, 1, 1, 1,
-0.2305554, -1.996826, -4.133667, 1, 1, 1, 1, 1,
-0.2282164, 0.2438996, -1.122475, 1, 1, 1, 1, 1,
-0.2278492, -0.7762065, -2.287247, 1, 1, 1, 1, 1,
-0.2267702, 0.4212463, 0.2450418, 1, 1, 1, 1, 1,
-0.2256804, 0.6234813, -1.542944, 1, 1, 1, 1, 1,
-0.2252088, -0.2019727, -1.909761, 0, 0, 1, 1, 1,
-0.2244233, 0.2977466, 1.068024, 1, 0, 0, 1, 1,
-0.2230462, -0.7498549, -3.530896, 1, 0, 0, 1, 1,
-0.221166, -1.209281, -3.585466, 1, 0, 0, 1, 1,
-0.2196804, 0.5969893, -0.5749951, 1, 0, 0, 1, 1,
-0.218127, 0.2557733, -0.5985134, 1, 0, 0, 1, 1,
-0.2161558, 2.603914, -0.7549493, 0, 0, 0, 1, 1,
-0.2155962, 1.290122, 1.300901, 0, 0, 0, 1, 1,
-0.211307, 0.701598, -0.7267278, 0, 0, 0, 1, 1,
-0.2088372, -0.03233635, -1.86428, 0, 0, 0, 1, 1,
-0.2039407, -0.1618398, -2.39782, 0, 0, 0, 1, 1,
-0.2033302, -0.6467717, 0.05244954, 0, 0, 0, 1, 1,
-0.2019633, -1.422755, -1.95138, 0, 0, 0, 1, 1,
-0.200857, 0.4534333, -0.2839008, 1, 1, 1, 1, 1,
-0.1988514, -0.8711636, -1.842953, 1, 1, 1, 1, 1,
-0.1964505, -0.5170255, -3.167374, 1, 1, 1, 1, 1,
-0.1942615, 0.6090184, -0.1389902, 1, 1, 1, 1, 1,
-0.1929502, 1.806711, -2.523533, 1, 1, 1, 1, 1,
-0.1912617, 0.2040968, 0.8312847, 1, 1, 1, 1, 1,
-0.1906833, -0.2709979, -3.127667, 1, 1, 1, 1, 1,
-0.1867896, 0.2270243, 0.3696783, 1, 1, 1, 1, 1,
-0.1856898, 0.658447, -1.060743, 1, 1, 1, 1, 1,
-0.1856143, -2.024958, -1.466056, 1, 1, 1, 1, 1,
-0.1843848, -0.9088895, -3.983406, 1, 1, 1, 1, 1,
-0.1806232, 0.4859879, -0.2537384, 1, 1, 1, 1, 1,
-0.1775826, 1.607288, -0.8874852, 1, 1, 1, 1, 1,
-0.1774094, -0.1889312, -1.285694, 1, 1, 1, 1, 1,
-0.1662145, 0.2794928, -1.868269, 1, 1, 1, 1, 1,
-0.1584986, 0.3043777, -1.686288, 0, 0, 1, 1, 1,
-0.1565553, 0.3768573, 0.4709142, 1, 0, 0, 1, 1,
-0.156489, 0.2224231, 0.5753791, 1, 0, 0, 1, 1,
-0.1461808, 1.213364, -0.4344858, 1, 0, 0, 1, 1,
-0.1448971, 1.753799, 2.820143, 1, 0, 0, 1, 1,
-0.1433049, -1.415045, -2.607542, 1, 0, 0, 1, 1,
-0.1388765, -0.09891859, -3.444556, 0, 0, 0, 1, 1,
-0.1350103, -0.4791663, -2.632173, 0, 0, 0, 1, 1,
-0.1293664, 0.6999205, -1.322329, 0, 0, 0, 1, 1,
-0.1250175, -0.6756525, -3.689285, 0, 0, 0, 1, 1,
-0.1224254, 1.793029, -1.092553, 0, 0, 0, 1, 1,
-0.1219219, 1.334141, 0.4911261, 0, 0, 0, 1, 1,
-0.1218041, 0.1372202, -0.08845184, 0, 0, 0, 1, 1,
-0.1217381, -0.1624334, -2.414337, 1, 1, 1, 1, 1,
-0.120323, -0.07974661, -2.998584, 1, 1, 1, 1, 1,
-0.1195329, 0.105234, -2.930948, 1, 1, 1, 1, 1,
-0.118276, -0.5587257, -4.209188, 1, 1, 1, 1, 1,
-0.1135506, -0.3503354, -2.067147, 1, 1, 1, 1, 1,
-0.109163, 0.5206044, -2.219794, 1, 1, 1, 1, 1,
-0.1030103, 0.3619049, 0.2112687, 1, 1, 1, 1, 1,
-0.1021167, 0.04664634, -2.017265, 1, 1, 1, 1, 1,
-0.09587158, -0.05471144, -0.4386243, 1, 1, 1, 1, 1,
-0.0873609, -0.08388183, -2.941554, 1, 1, 1, 1, 1,
-0.08707673, 1.010442, -0.4698661, 1, 1, 1, 1, 1,
-0.08541638, -0.4817351, -1.835231, 1, 1, 1, 1, 1,
-0.08313806, 0.0409917, 0.5853199, 1, 1, 1, 1, 1,
-0.07760476, 0.1756835, -0.1917648, 1, 1, 1, 1, 1,
-0.07269409, 1.242011, -0.3578072, 1, 1, 1, 1, 1,
-0.07175093, 0.4632312, -0.5299056, 0, 0, 1, 1, 1,
-0.06954552, 0.473016, 0.2144289, 1, 0, 0, 1, 1,
-0.06944679, -0.3070169, -0.6231737, 1, 0, 0, 1, 1,
-0.06867336, 0.2126579, 0.04215566, 1, 0, 0, 1, 1,
-0.06546091, -1.694264, -2.938307, 1, 0, 0, 1, 1,
-0.06527317, 0.9536587, 0.5376869, 1, 0, 0, 1, 1,
-0.06463868, 0.09602937, 0.8293804, 0, 0, 0, 1, 1,
-0.06456637, 0.003384064, -1.148842, 0, 0, 0, 1, 1,
-0.06294591, 0.8089685, 0.6629571, 0, 0, 0, 1, 1,
-0.06288645, 0.822746, 0.4451137, 0, 0, 0, 1, 1,
-0.06103854, 2.118984, -0.5924608, 0, 0, 0, 1, 1,
-0.05869874, 1.802654, 1.615859, 0, 0, 0, 1, 1,
-0.0582115, -0.3609964, -3.83428, 0, 0, 0, 1, 1,
-0.04994573, -1.342907, -3.243738, 1, 1, 1, 1, 1,
-0.04943594, 0.1623065, 0.4110845, 1, 1, 1, 1, 1,
-0.04522794, -0.7905439, -2.499562, 1, 1, 1, 1, 1,
-0.04327755, 1.698465, 0.1090029, 1, 1, 1, 1, 1,
-0.04064121, -0.7987689, -4.403821, 1, 1, 1, 1, 1,
-0.04061689, 0.09027206, 0.06764468, 1, 1, 1, 1, 1,
-0.03870055, -0.02843175, -2.221189, 1, 1, 1, 1, 1,
-0.03830898, 2.456602, -1.012764, 1, 1, 1, 1, 1,
-0.03669229, 0.1825765, -0.09428406, 1, 1, 1, 1, 1,
-0.0346955, -1.130787, -3.106765, 1, 1, 1, 1, 1,
-0.03147809, -1.352426, -4.253515, 1, 1, 1, 1, 1,
-0.02710835, -1.965856, -2.929514, 1, 1, 1, 1, 1,
-0.01978733, -0.9022497, -3.632936, 1, 1, 1, 1, 1,
-0.01471959, 1.407083, -0.6108339, 1, 1, 1, 1, 1,
-0.01099923, 0.3405366, 1.434288, 1, 1, 1, 1, 1,
-0.0107783, 1.133188, -0.05104811, 0, 0, 1, 1, 1,
-0.01022099, 0.1527748, 0.09527174, 1, 0, 0, 1, 1,
-0.006751787, 1.58409, 0.00641025, 1, 0, 0, 1, 1,
-0.006252181, -0.9337994, -3.665252, 1, 0, 0, 1, 1,
-0.005600791, 0.9676299, -1.064578, 1, 0, 0, 1, 1,
0.004752269, 0.3398033, -0.3246303, 1, 0, 0, 1, 1,
0.008696504, 0.07379729, 0.02862262, 0, 0, 0, 1, 1,
0.0110767, -1.649322, 3.545521, 0, 0, 0, 1, 1,
0.01693544, 0.743081, 0.5264627, 0, 0, 0, 1, 1,
0.01751261, -0.5226101, 3.34491, 0, 0, 0, 1, 1,
0.02135885, 0.07575703, -0.005660672, 0, 0, 0, 1, 1,
0.02196088, -0.6289771, 4.440435, 0, 0, 0, 1, 1,
0.02200778, -0.7217633, 4.026075, 0, 0, 0, 1, 1,
0.02534149, -1.110104, 3.943721, 1, 1, 1, 1, 1,
0.03044377, 0.2862703, 1.103058, 1, 1, 1, 1, 1,
0.03336375, 1.055398, 1.796051, 1, 1, 1, 1, 1,
0.03599114, 0.5077078, 0.3292018, 1, 1, 1, 1, 1,
0.0370295, 0.9193221, -0.5849462, 1, 1, 1, 1, 1,
0.03844365, -0.06824995, 3.661529, 1, 1, 1, 1, 1,
0.04352551, -0.7658516, 3.432997, 1, 1, 1, 1, 1,
0.04513727, 0.8637001, -1.249275, 1, 1, 1, 1, 1,
0.04629593, -1.36367, 1.670187, 1, 1, 1, 1, 1,
0.04664218, 0.1831416, 1.875975, 1, 1, 1, 1, 1,
0.05585152, -0.05262272, 2.602872, 1, 1, 1, 1, 1,
0.06172018, 0.7157099, 0.7290095, 1, 1, 1, 1, 1,
0.0619345, -0.3896028, 2.085083, 1, 1, 1, 1, 1,
0.07521325, -0.03051747, 1.848271, 1, 1, 1, 1, 1,
0.07652368, 1.074053, 0.3573835, 1, 1, 1, 1, 1,
0.07779102, -0.8741582, 1.510302, 0, 0, 1, 1, 1,
0.07853934, -0.02216613, -0.1373327, 1, 0, 0, 1, 1,
0.08356707, -1.869933, 3.515719, 1, 0, 0, 1, 1,
0.08562634, 0.565755, -0.3530045, 1, 0, 0, 1, 1,
0.08794477, 0.6559791, 0.0596744, 1, 0, 0, 1, 1,
0.08876939, -0.955458, 2.227309, 1, 0, 0, 1, 1,
0.08986663, -1.772125, 2.131644, 0, 0, 0, 1, 1,
0.0916873, 0.4605063, -0.4508334, 0, 0, 0, 1, 1,
0.09448814, -0.487158, 4.141772, 0, 0, 0, 1, 1,
0.09664521, 0.3250203, -0.2394001, 0, 0, 0, 1, 1,
0.1021362, 0.7079076, -1.362364, 0, 0, 0, 1, 1,
0.1032362, 0.881902, -0.9989488, 0, 0, 0, 1, 1,
0.1084626, 1.867111, -0.3637445, 0, 0, 0, 1, 1,
0.109719, -0.7895691, 5.084969, 1, 1, 1, 1, 1,
0.1112145, -1.114797, 3.339209, 1, 1, 1, 1, 1,
0.1132679, -1.234941, 2.938496, 1, 1, 1, 1, 1,
0.1151668, 0.2644584, -0.7393764, 1, 1, 1, 1, 1,
0.1183809, 0.6804677, -0.2189004, 1, 1, 1, 1, 1,
0.1225539, -0.5388002, 3.019017, 1, 1, 1, 1, 1,
0.1226841, -0.8978659, 1.670857, 1, 1, 1, 1, 1,
0.1237563, 0.9231985, 1.507753, 1, 1, 1, 1, 1,
0.1239195, 1.192904, 0.09693924, 1, 1, 1, 1, 1,
0.1265929, 0.1343257, 0.1436294, 1, 1, 1, 1, 1,
0.127761, 0.63298, 1.759696, 1, 1, 1, 1, 1,
0.1315695, 2.153717, 0.6741728, 1, 1, 1, 1, 1,
0.1320376, 0.5880713, 1.873429, 1, 1, 1, 1, 1,
0.1323949, -0.7095189, 2.451055, 1, 1, 1, 1, 1,
0.1356036, 0.6624192, 0.5426474, 1, 1, 1, 1, 1,
0.1363861, -2.480679, 3.724494, 0, 0, 1, 1, 1,
0.1402519, -2.026596, 4.396182, 1, 0, 0, 1, 1,
0.1421299, 1.371776, 0.8973237, 1, 0, 0, 1, 1,
0.1428807, 1.048357, -0.5839007, 1, 0, 0, 1, 1,
0.1445297, 0.2344743, 0.7543601, 1, 0, 0, 1, 1,
0.1461113, 1.136091, 0.1042665, 1, 0, 0, 1, 1,
0.147574, -0.5670391, 3.836327, 0, 0, 0, 1, 1,
0.1489684, -0.1138176, 2.405779, 0, 0, 0, 1, 1,
0.1501488, 0.7029136, 2.050635, 0, 0, 0, 1, 1,
0.1512631, -1.774878, 3.447927, 0, 0, 0, 1, 1,
0.1512809, -0.2514223, 3.636579, 0, 0, 0, 1, 1,
0.1517889, 0.6279092, 0.5146594, 0, 0, 0, 1, 1,
0.1576278, 1.539304, -1.844606, 0, 0, 0, 1, 1,
0.1578334, 1.318676, 0.09372742, 1, 1, 1, 1, 1,
0.1624847, -1.701153, 2.358384, 1, 1, 1, 1, 1,
0.1703493, -1.583044, 4.062549, 1, 1, 1, 1, 1,
0.175094, -1.90288, 3.827346, 1, 1, 1, 1, 1,
0.1770281, 1.99594, -0.7568816, 1, 1, 1, 1, 1,
0.1792645, 0.2670122, -1.619594, 1, 1, 1, 1, 1,
0.1815491, -0.1009413, 2.592297, 1, 1, 1, 1, 1,
0.1841254, -1.485032, 3.245111, 1, 1, 1, 1, 1,
0.1884049, 0.09990487, 1.212398, 1, 1, 1, 1, 1,
0.1927426, -0.04623931, 1.836831, 1, 1, 1, 1, 1,
0.1963706, 0.1109931, 0.6081764, 1, 1, 1, 1, 1,
0.1969862, 0.6163055, -0.6823901, 1, 1, 1, 1, 1,
0.1994967, -0.8354923, 4.2503, 1, 1, 1, 1, 1,
0.2172459, -2.045822, 5.000814, 1, 1, 1, 1, 1,
0.2279669, 0.466365, 0.2337731, 1, 1, 1, 1, 1,
0.2282609, -0.7399679, 3.385945, 0, 0, 1, 1, 1,
0.2287297, 2.089622, -0.3859201, 1, 0, 0, 1, 1,
0.2303869, -0.1493095, 2.294201, 1, 0, 0, 1, 1,
0.2325743, 1.16485, 0.1542422, 1, 0, 0, 1, 1,
0.2349498, 0.4006263, 1.054766, 1, 0, 0, 1, 1,
0.2376393, -0.4642472, 2.344607, 1, 0, 0, 1, 1,
0.2410673, 0.3258823, -1.456742, 0, 0, 0, 1, 1,
0.2442994, 0.7853133, 1.311234, 0, 0, 0, 1, 1,
0.2454457, 1.269847, 0.3727855, 0, 0, 0, 1, 1,
0.2462778, 0.1889839, -0.5196449, 0, 0, 0, 1, 1,
0.2463664, 1.128938, -1.033978, 0, 0, 0, 1, 1,
0.2478637, 0.5199505, 0.2683274, 0, 0, 0, 1, 1,
0.2481011, -1.719161, 4.438852, 0, 0, 0, 1, 1,
0.2501537, 0.1253653, 2.643489, 1, 1, 1, 1, 1,
0.2549954, -0.4821675, 1.587237, 1, 1, 1, 1, 1,
0.2572327, 2.492104, 0.5747706, 1, 1, 1, 1, 1,
0.2576656, -1.396719, 4.648442, 1, 1, 1, 1, 1,
0.2600346, -1.373841, 3.629455, 1, 1, 1, 1, 1,
0.2614206, -0.2410665, 2.529982, 1, 1, 1, 1, 1,
0.265763, -0.3476883, 2.635849, 1, 1, 1, 1, 1,
0.2693904, -1.50839, 4.151309, 1, 1, 1, 1, 1,
0.2694138, 0.2824397, 0.6167945, 1, 1, 1, 1, 1,
0.2694446, 0.3905929, 2.038372, 1, 1, 1, 1, 1,
0.2694797, -0.07655206, 3.66615, 1, 1, 1, 1, 1,
0.2697295, 0.3034527, 0.6219853, 1, 1, 1, 1, 1,
0.2716424, 0.818568, 0.4218839, 1, 1, 1, 1, 1,
0.2717142, -0.03501417, 1.906642, 1, 1, 1, 1, 1,
0.2723729, -1.738695, 2.579385, 1, 1, 1, 1, 1,
0.2737836, 1.485146, -0.6326854, 0, 0, 1, 1, 1,
0.2741611, 0.7749131, -0.3195552, 1, 0, 0, 1, 1,
0.2761377, 1.022465, -0.2903792, 1, 0, 0, 1, 1,
0.2772794, 0.08056502, 0.5981221, 1, 0, 0, 1, 1,
0.2776543, -0.1383266, 2.88424, 1, 0, 0, 1, 1,
0.2793284, 0.284595, 1.798233, 1, 0, 0, 1, 1,
0.2813803, -0.1661599, 1.709674, 0, 0, 0, 1, 1,
0.2840952, 1.034341, 0.3142307, 0, 0, 0, 1, 1,
0.2892513, -1.936458, 2.264704, 0, 0, 0, 1, 1,
0.289793, -1.224019, 2.352243, 0, 0, 0, 1, 1,
0.2960217, -1.440386, 0.830124, 0, 0, 0, 1, 1,
0.2975787, -0.9013171, 3.609963, 0, 0, 0, 1, 1,
0.3019076, 0.2386603, 1.896482, 0, 0, 0, 1, 1,
0.3022313, -0.8113226, 2.632478, 1, 1, 1, 1, 1,
0.3044432, -0.739324, 4.261539, 1, 1, 1, 1, 1,
0.3048796, 0.2885984, 0.7708488, 1, 1, 1, 1, 1,
0.306883, 0.4064702, 2.787873, 1, 1, 1, 1, 1,
0.3079312, 0.4264838, 0.5945389, 1, 1, 1, 1, 1,
0.3095322, -1.978296, 3.696966, 1, 1, 1, 1, 1,
0.3120816, 0.2148317, 0.8614458, 1, 1, 1, 1, 1,
0.3147979, -0.3804386, 2.639557, 1, 1, 1, 1, 1,
0.3149858, -1.04511, 2.53802, 1, 1, 1, 1, 1,
0.3157665, -1.399657, 2.726729, 1, 1, 1, 1, 1,
0.3174164, 0.3608032, 1.225541, 1, 1, 1, 1, 1,
0.3175497, -0.8300983, 4.202686, 1, 1, 1, 1, 1,
0.3183393, -0.584402, 2.976354, 1, 1, 1, 1, 1,
0.3284447, 0.9039757, -1.002842, 1, 1, 1, 1, 1,
0.3298576, 0.7678313, 0.7319536, 1, 1, 1, 1, 1,
0.3301709, 3.157521, 0.2720694, 0, 0, 1, 1, 1,
0.3343713, 0.5519482, 0.5445983, 1, 0, 0, 1, 1,
0.3357043, -0.4066849, 1.892284, 1, 0, 0, 1, 1,
0.3365827, 0.5269774, 1.048416, 1, 0, 0, 1, 1,
0.3384503, -1.791227, 2.460865, 1, 0, 0, 1, 1,
0.340164, -1.693292, 0.8494892, 1, 0, 0, 1, 1,
0.3416578, -0.2944207, 1.901592, 0, 0, 0, 1, 1,
0.3431157, -1.706147, 3.99115, 0, 0, 0, 1, 1,
0.3464731, -0.3831609, 1.116981, 0, 0, 0, 1, 1,
0.3480266, -0.8843583, 0.9007182, 0, 0, 0, 1, 1,
0.3487399, 0.1030346, 0.7990657, 0, 0, 0, 1, 1,
0.3500432, 0.6227333, -0.2620803, 0, 0, 0, 1, 1,
0.3501542, -1.16598, 3.129653, 0, 0, 0, 1, 1,
0.3529479, 1.186045, 0.6867134, 1, 1, 1, 1, 1,
0.3592854, -0.4575715, 2.585078, 1, 1, 1, 1, 1,
0.3594604, 0.2371786, 2.644058, 1, 1, 1, 1, 1,
0.3629591, 1.8808, 1.185853, 1, 1, 1, 1, 1,
0.3709363, -0.5727038, 2.373737, 1, 1, 1, 1, 1,
0.3715374, -1.744508, 5.040832, 1, 1, 1, 1, 1,
0.3763209, 0.3512345, 2.031315, 1, 1, 1, 1, 1,
0.376938, 0.6688268, 1.297757, 1, 1, 1, 1, 1,
0.3797208, 1.03654, 1.400762, 1, 1, 1, 1, 1,
0.3874205, -2.133971, 3.15767, 1, 1, 1, 1, 1,
0.3874471, -0.6061946, 2.344578, 1, 1, 1, 1, 1,
0.3876593, -0.06784731, 2.254436, 1, 1, 1, 1, 1,
0.3931869, 0.4354551, -0.4849808, 1, 1, 1, 1, 1,
0.3952067, 0.5605412, -0.7294053, 1, 1, 1, 1, 1,
0.396492, -0.3898749, 2.431687, 1, 1, 1, 1, 1,
0.3974207, -0.7096061, 2.435473, 0, 0, 1, 1, 1,
0.4026342, -0.8511131, 2.759238, 1, 0, 0, 1, 1,
0.4037082, 1.463587, 0.02349764, 1, 0, 0, 1, 1,
0.407831, 0.05454474, -1.534667, 1, 0, 0, 1, 1,
0.4081965, 0.2287681, -0.4547966, 1, 0, 0, 1, 1,
0.4099254, -0.1478152, 2.769033, 1, 0, 0, 1, 1,
0.4127643, 1.633092, -0.1393815, 0, 0, 0, 1, 1,
0.4183345, -1.563582, 2.614286, 0, 0, 0, 1, 1,
0.4193135, 0.3434942, 1.327648, 0, 0, 0, 1, 1,
0.4207076, 0.05850519, 1.108497, 0, 0, 0, 1, 1,
0.4244007, 0.8680409, 1.198171, 0, 0, 0, 1, 1,
0.4246544, -0.9921988, 3.916911, 0, 0, 0, 1, 1,
0.4253946, 0.9294456, 0.6546071, 0, 0, 0, 1, 1,
0.4259154, -1.442443, 2.914626, 1, 1, 1, 1, 1,
0.4271256, 0.05997169, 2.269808, 1, 1, 1, 1, 1,
0.4329278, -0.2093733, 1.961922, 1, 1, 1, 1, 1,
0.4357457, -1.179898, 2.570091, 1, 1, 1, 1, 1,
0.4365946, -0.7100275, 2.920669, 1, 1, 1, 1, 1,
0.4388948, 0.07420729, 2.133326, 1, 1, 1, 1, 1,
0.4409465, 2.299902, -0.4949445, 1, 1, 1, 1, 1,
0.4492854, -1.070626, 1.745582, 1, 1, 1, 1, 1,
0.4507604, -0.658213, 3.786324, 1, 1, 1, 1, 1,
0.4517633, -1.185333, 2.783647, 1, 1, 1, 1, 1,
0.4525374, 1.729306, -0.9816567, 1, 1, 1, 1, 1,
0.4532926, 0.8189606, -0.09156433, 1, 1, 1, 1, 1,
0.4537117, -0.7073168, 1.754771, 1, 1, 1, 1, 1,
0.4540302, 0.2646073, 3.02938, 1, 1, 1, 1, 1,
0.4542859, -0.6146778, 0.5842633, 1, 1, 1, 1, 1,
0.4550774, 0.03491659, 0.773194, 0, 0, 1, 1, 1,
0.4576839, -2.229907, 2.958713, 1, 0, 0, 1, 1,
0.4590123, 0.6391609, 0.6548282, 1, 0, 0, 1, 1,
0.4599625, -0.03249392, 1.445628, 1, 0, 0, 1, 1,
0.4638332, 0.3044139, 1.662233, 1, 0, 0, 1, 1,
0.4653055, -1.158872, 3.31755, 1, 0, 0, 1, 1,
0.4682856, 0.01914309, -0.1777039, 0, 0, 0, 1, 1,
0.4683041, -0.7990839, 2.947008, 0, 0, 0, 1, 1,
0.4685378, 0.2023212, 0.8430137, 0, 0, 0, 1, 1,
0.4740445, 1.343157, 0.2057066, 0, 0, 0, 1, 1,
0.4752196, -0.314397, 2.625769, 0, 0, 0, 1, 1,
0.476715, 0.006522706, 0.9702433, 0, 0, 0, 1, 1,
0.4800305, -1.081367, 1.216325, 0, 0, 0, 1, 1,
0.484604, 1.039045, 0.6661648, 1, 1, 1, 1, 1,
0.4879288, 0.4973572, 1.297889, 1, 1, 1, 1, 1,
0.4899054, -0.9163409, 2.102216, 1, 1, 1, 1, 1,
0.4962216, 0.3180745, -0.5070452, 1, 1, 1, 1, 1,
0.4977131, -0.7744927, 3.064077, 1, 1, 1, 1, 1,
0.4982206, -0.07542618, 0.7379821, 1, 1, 1, 1, 1,
0.4994995, 1.144579, -0.3057287, 1, 1, 1, 1, 1,
0.5010666, 0.7419578, 0.8253515, 1, 1, 1, 1, 1,
0.5034958, 0.5284647, -0.9118237, 1, 1, 1, 1, 1,
0.5061845, -0.03204142, 2.160187, 1, 1, 1, 1, 1,
0.5073316, 0.7651389, -0.5303074, 1, 1, 1, 1, 1,
0.5138848, 0.1933017, 0.9077482, 1, 1, 1, 1, 1,
0.5145891, -1.545758, 3.125639, 1, 1, 1, 1, 1,
0.5161902, -0.1359071, 4.069431, 1, 1, 1, 1, 1,
0.5216709, 0.6716881, 2.110595, 1, 1, 1, 1, 1,
0.5240331, -0.6342192, 2.477144, 0, 0, 1, 1, 1,
0.527953, 0.4377731, -0.3679835, 1, 0, 0, 1, 1,
0.5322436, -1.327741, 2.442368, 1, 0, 0, 1, 1,
0.5361172, 2.30724, 1.010749, 1, 0, 0, 1, 1,
0.5362503, -1.099089, 2.172886, 1, 0, 0, 1, 1,
0.5381802, -0.5792612, 2.278746, 1, 0, 0, 1, 1,
0.5415533, 0.9315327, 0.6404889, 0, 0, 0, 1, 1,
0.5448766, -1.074144, 3.456503, 0, 0, 0, 1, 1,
0.5465549, 1.719094, -0.4324184, 0, 0, 0, 1, 1,
0.5509682, -0.07068969, 2.178227, 0, 0, 0, 1, 1,
0.5571918, 1.247897, 0.3188092, 0, 0, 0, 1, 1,
0.5594667, 0.4140522, 1.269182, 0, 0, 0, 1, 1,
0.5664287, 0.7264228, 0.9074273, 0, 0, 0, 1, 1,
0.5686584, -1.280848, 1.921745, 1, 1, 1, 1, 1,
0.5703294, -0.7349178, 3.050728, 1, 1, 1, 1, 1,
0.5786469, -0.3281876, 1.412272, 1, 1, 1, 1, 1,
0.580346, 0.4101839, 1.131066, 1, 1, 1, 1, 1,
0.5836924, -0.4607068, 2.190651, 1, 1, 1, 1, 1,
0.5837381, -0.9297891, 2.07823, 1, 1, 1, 1, 1,
0.5871611, 1.179465, 0.9310793, 1, 1, 1, 1, 1,
0.5906047, -1.460687, 3.009721, 1, 1, 1, 1, 1,
0.5949466, -1.562676, 2.143992, 1, 1, 1, 1, 1,
0.5959882, -0.6143256, 1.180821, 1, 1, 1, 1, 1,
0.5982306, -0.2961496, 0.7638817, 1, 1, 1, 1, 1,
0.6043972, 1.026239, -0.5824828, 1, 1, 1, 1, 1,
0.6046835, 1.072798, 0.6960743, 1, 1, 1, 1, 1,
0.6047783, -0.03489179, -0.3252996, 1, 1, 1, 1, 1,
0.6098305, 0.4662563, 1.696628, 1, 1, 1, 1, 1,
0.6172168, -0.007913598, 1.040807, 0, 0, 1, 1, 1,
0.6179867, -1.084274, 2.26601, 1, 0, 0, 1, 1,
0.6245387, -0.9050863, 3.279641, 1, 0, 0, 1, 1,
0.6268812, -1.171381, 4.046803, 1, 0, 0, 1, 1,
0.6289591, 0.5840061, -0.762472, 1, 0, 0, 1, 1,
0.6321507, 1.340863, 1.499244, 1, 0, 0, 1, 1,
0.6342772, -0.4225694, 2.055851, 0, 0, 0, 1, 1,
0.6343368, 1.652663, 1.271043, 0, 0, 0, 1, 1,
0.6367766, 0.2700443, 1.689561, 0, 0, 0, 1, 1,
0.6377187, 0.335323, 2.548403, 0, 0, 0, 1, 1,
0.6387483, 0.2776912, 1.286161, 0, 0, 0, 1, 1,
0.6398928, 0.0431362, 2.779805, 0, 0, 0, 1, 1,
0.6423593, -0.267643, 3.295781, 0, 0, 0, 1, 1,
0.6449333, -0.7831185, 1.672147, 1, 1, 1, 1, 1,
0.6494446, -1.260163, 2.40575, 1, 1, 1, 1, 1,
0.6598161, 1.008727, 0.7262521, 1, 1, 1, 1, 1,
0.6651648, -1.786204, 2.658531, 1, 1, 1, 1, 1,
0.6659489, 0.3100476, 1.659099, 1, 1, 1, 1, 1,
0.6675708, 0.6098338, 0.5290211, 1, 1, 1, 1, 1,
0.6699809, -0.7289848, 1.262785, 1, 1, 1, 1, 1,
0.6720181, 1.530483, -0.5693235, 1, 1, 1, 1, 1,
0.6763091, -0.7773447, 3.012885, 1, 1, 1, 1, 1,
0.6771732, -1.139091, 3.239482, 1, 1, 1, 1, 1,
0.6829479, 1.933929, 0.6018293, 1, 1, 1, 1, 1,
0.6843657, 1.339346, -0.1164869, 1, 1, 1, 1, 1,
0.688995, -3.033543, 2.150061, 1, 1, 1, 1, 1,
0.693332, 0.3217239, 1.571876, 1, 1, 1, 1, 1,
0.6958402, -0.341908, 0.3013092, 1, 1, 1, 1, 1,
0.6983174, 0.4113467, 1.021087, 0, 0, 1, 1, 1,
0.7064111, -0.8613665, 3.644483, 1, 0, 0, 1, 1,
0.709188, 0.9584442, 0.5977374, 1, 0, 0, 1, 1,
0.7196811, -0.9797555, 1.5276, 1, 0, 0, 1, 1,
0.726849, 0.8744269, 0.6049176, 1, 0, 0, 1, 1,
0.7303909, -1.591737, 3.635693, 1, 0, 0, 1, 1,
0.7335454, -0.1044864, 2.822492, 0, 0, 0, 1, 1,
0.734005, 1.231727, -0.5145586, 0, 0, 0, 1, 1,
0.7349657, -1.882229, 3.014734, 0, 0, 0, 1, 1,
0.7412692, 0.5058871, 2.105676, 0, 0, 0, 1, 1,
0.7427609, -1.155086, 0.9570356, 0, 0, 0, 1, 1,
0.7435009, -0.4309457, 2.184344, 0, 0, 0, 1, 1,
0.7448607, -1.068906, 2.961716, 0, 0, 0, 1, 1,
0.7450289, 1.826313, 0.7063512, 1, 1, 1, 1, 1,
0.7483079, -0.3988355, 2.724232, 1, 1, 1, 1, 1,
0.7505215, -0.7992236, 2.795167, 1, 1, 1, 1, 1,
0.7513852, 0.4903177, 1.491001, 1, 1, 1, 1, 1,
0.753658, -1.715343, 3.738763, 1, 1, 1, 1, 1,
0.7563591, 0.8701931, 0.07994975, 1, 1, 1, 1, 1,
0.7616253, 0.09139498, 1.55338, 1, 1, 1, 1, 1,
0.7649567, 0.01571462, 1.937237, 1, 1, 1, 1, 1,
0.7785178, 1.921606, 1.350403, 1, 1, 1, 1, 1,
0.7801898, 0.2131746, 1.468352, 1, 1, 1, 1, 1,
0.7826211, 1.586712, 1.791857, 1, 1, 1, 1, 1,
0.7851008, -0.01389289, 1.624017, 1, 1, 1, 1, 1,
0.7874049, 1.403898, 1.091807, 1, 1, 1, 1, 1,
0.7906104, -0.2984799, 2.601729, 1, 1, 1, 1, 1,
0.794016, -0.6485881, 3.44108, 1, 1, 1, 1, 1,
0.7992077, 1.742767, 0.6730728, 0, 0, 1, 1, 1,
0.8021554, 0.4178759, 2.605472, 1, 0, 0, 1, 1,
0.8029459, -1.10941, 1.960075, 1, 0, 0, 1, 1,
0.8070223, 0.03674053, 2.654717, 1, 0, 0, 1, 1,
0.8202689, -0.09426923, 2.016074, 1, 0, 0, 1, 1,
0.8225248, 0.4644294, -0.6459958, 1, 0, 0, 1, 1,
0.8263377, 0.2525045, 0.8351395, 0, 0, 0, 1, 1,
0.8308248, -1.023265, 4.059158, 0, 0, 0, 1, 1,
0.8318527, -1.21351, 3.614319, 0, 0, 0, 1, 1,
0.8334439, 0.8113511, 0.5340572, 0, 0, 0, 1, 1,
0.8359348, -1.43769, 3.775869, 0, 0, 0, 1, 1,
0.8376688, -0.5939139, 2.338508, 0, 0, 0, 1, 1,
0.8409036, -0.5111808, 2.485813, 0, 0, 0, 1, 1,
0.8445408, 0.9853482, 2.153201, 1, 1, 1, 1, 1,
0.8488241, -0.3748133, 3.587707, 1, 1, 1, 1, 1,
0.8495058, 1.964212, 0.07874417, 1, 1, 1, 1, 1,
0.8496852, 1.213838, 1.3659, 1, 1, 1, 1, 1,
0.8507675, -0.5593878, 2.319413, 1, 1, 1, 1, 1,
0.8569273, -1.939899, 1.65783, 1, 1, 1, 1, 1,
0.864673, 0.2542375, 2.424423, 1, 1, 1, 1, 1,
0.8684685, -0.6652874, 1.905831, 1, 1, 1, 1, 1,
0.8777102, 0.4342379, 1.436155, 1, 1, 1, 1, 1,
0.8787656, -0.4930738, 2.356348, 1, 1, 1, 1, 1,
0.8813781, 0.02997401, 1.290436, 1, 1, 1, 1, 1,
0.885594, -1.820049, 3.117072, 1, 1, 1, 1, 1,
0.8861138, 1.176423, -0.209316, 1, 1, 1, 1, 1,
0.8892907, 0.5524043, 0.8951893, 1, 1, 1, 1, 1,
0.8910683, 0.05023958, 1.822475, 1, 1, 1, 1, 1,
0.8911964, 0.6388793, 0.6523451, 0, 0, 1, 1, 1,
0.8952089, -1.957723, 2.928957, 1, 0, 0, 1, 1,
0.8978003, -0.5137251, 3.668396, 1, 0, 0, 1, 1,
0.9021428, -0.1264064, 1.48064, 1, 0, 0, 1, 1,
0.9055019, 1.533008, 0.3523305, 1, 0, 0, 1, 1,
0.9058264, 0.5546221, 0.76048, 1, 0, 0, 1, 1,
0.918801, -0.2056908, 0.7302114, 0, 0, 0, 1, 1,
0.9233689, 0.06279123, 2.222759, 0, 0, 0, 1, 1,
0.9281329, -0.18556, 1.579478, 0, 0, 0, 1, 1,
0.9304608, -0.2778626, 1.099532, 0, 0, 0, 1, 1,
0.9432064, 0.9885265, 0.3691689, 0, 0, 0, 1, 1,
0.9467819, -1.868489, 3.216258, 0, 0, 0, 1, 1,
0.9470014, 0.5096893, 2.012033, 0, 0, 0, 1, 1,
0.9494956, -1.218014, 2.300728, 1, 1, 1, 1, 1,
0.9501453, -0.718885, 2.65797, 1, 1, 1, 1, 1,
0.9520221, 0.8920075, 0.08347111, 1, 1, 1, 1, 1,
0.9553615, 1.989352, 1.292511, 1, 1, 1, 1, 1,
0.9562209, 2.062149, 1.100837, 1, 1, 1, 1, 1,
0.9640228, 0.748718, 2.310022, 1, 1, 1, 1, 1,
0.9704446, 0.495163, 1.757034, 1, 1, 1, 1, 1,
0.9755757, 1.409492, 2.020267, 1, 1, 1, 1, 1,
0.9799333, 0.3607404, -0.2647526, 1, 1, 1, 1, 1,
0.9835396, -0.4157546, 2.537138, 1, 1, 1, 1, 1,
0.984547, -0.7104316, 2.547714, 1, 1, 1, 1, 1,
0.9913255, -0.1603095, 1.696303, 1, 1, 1, 1, 1,
0.992655, 0.2769635, 2.024846, 1, 1, 1, 1, 1,
0.9986991, 0.8265073, 0.5695367, 1, 1, 1, 1, 1,
1.000965, 0.5845572, 0.587656, 1, 1, 1, 1, 1,
1.001111, -0.3925434, 1.819741, 0, 0, 1, 1, 1,
1.003327, 0.2246457, 1.112875, 1, 0, 0, 1, 1,
1.005519, -0.2506732, 2.125734, 1, 0, 0, 1, 1,
1.009599, 0.807972, 1.157601, 1, 0, 0, 1, 1,
1.011537, 0.2921664, 1.353615, 1, 0, 0, 1, 1,
1.012081, -1.830463, 3.777838, 1, 0, 0, 1, 1,
1.013991, -0.5727875, 1.429691, 0, 0, 0, 1, 1,
1.01777, -0.06945161, 1.907876, 0, 0, 0, 1, 1,
1.018613, 0.05317239, 0.5550579, 0, 0, 0, 1, 1,
1.027666, 1.319519, 0.3255013, 0, 0, 0, 1, 1,
1.03518, 0.6593191, -1.239386, 0, 0, 0, 1, 1,
1.036166, -0.3990216, 2.228981, 0, 0, 0, 1, 1,
1.03843, 0.346583, 0.5809169, 0, 0, 0, 1, 1,
1.045278, -0.006187811, 1.332363, 1, 1, 1, 1, 1,
1.046059, 0.7601344, 1.656811, 1, 1, 1, 1, 1,
1.057018, -0.08505526, 1.00233, 1, 1, 1, 1, 1,
1.057939, 1.726009, 0.9712841, 1, 1, 1, 1, 1,
1.059675, -1.31166, 2.661527, 1, 1, 1, 1, 1,
1.066919, -0.2819667, 1.182859, 1, 1, 1, 1, 1,
1.077012, 1.225316, 1.346267, 1, 1, 1, 1, 1,
1.08176, -1.01283, 2.798028, 1, 1, 1, 1, 1,
1.091364, 1.359298, 2.458549, 1, 1, 1, 1, 1,
1.092038, 0.445166, -0.2721658, 1, 1, 1, 1, 1,
1.093995, 0.3319666, 1.582044, 1, 1, 1, 1, 1,
1.094785, -0.9937969, 4.717499, 1, 1, 1, 1, 1,
1.096663, -0.9003655, 1.738417, 1, 1, 1, 1, 1,
1.098353, 1.323694, 1.743966, 1, 1, 1, 1, 1,
1.100052, -0.4359912, 3.641403, 1, 1, 1, 1, 1,
1.108634, 0.649707, 0.07887575, 0, 0, 1, 1, 1,
1.115501, 0.8363533, 0.4410044, 1, 0, 0, 1, 1,
1.116022, -0.3749741, 1.268657, 1, 0, 0, 1, 1,
1.118332, -0.2967744, 2.025801, 1, 0, 0, 1, 1,
1.121594, 0.02589509, 1.679132, 1, 0, 0, 1, 1,
1.121887, -0.5366281, 2.505409, 1, 0, 0, 1, 1,
1.123057, 1.022239, 0.7716954, 0, 0, 0, 1, 1,
1.124619, -0.1884079, 0.8073577, 0, 0, 0, 1, 1,
1.131524, -0.2000887, 1.330954, 0, 0, 0, 1, 1,
1.132693, 0.4653722, 0.4468126, 0, 0, 0, 1, 1,
1.133676, -0.5134286, 3.023142, 0, 0, 0, 1, 1,
1.139927, 1.740123, 1.267193, 0, 0, 0, 1, 1,
1.158641, -0.2166606, 2.324822, 0, 0, 0, 1, 1,
1.158935, -1.384701, 3.915234, 1, 1, 1, 1, 1,
1.166342, -0.1124089, 0.5281122, 1, 1, 1, 1, 1,
1.167022, -2.230636, 4.559874, 1, 1, 1, 1, 1,
1.169023, 1.308211, 0.6991948, 1, 1, 1, 1, 1,
1.170664, 0.8637306, 1.369148, 1, 1, 1, 1, 1,
1.174024, -2.119798, 1.592094, 1, 1, 1, 1, 1,
1.187139, 0.5013792, 0.9647112, 1, 1, 1, 1, 1,
1.187333, 1.475569, 0.8420523, 1, 1, 1, 1, 1,
1.193043, 0.3203341, 0.146461, 1, 1, 1, 1, 1,
1.19464, -0.263897, 1.624334, 1, 1, 1, 1, 1,
1.211, 0.6287027, 1.50465, 1, 1, 1, 1, 1,
1.220233, -0.05772283, 2.50134, 1, 1, 1, 1, 1,
1.225843, -0.01351471, 1.613942, 1, 1, 1, 1, 1,
1.229592, -1.021526, 2.536827, 1, 1, 1, 1, 1,
1.229971, 0.5019715, 1.467522, 1, 1, 1, 1, 1,
1.25, 0.6132696, 2.366075, 0, 0, 1, 1, 1,
1.250488, 0.2912824, 0.5953715, 1, 0, 0, 1, 1,
1.26672, -3.165988, 3.210854, 1, 0, 0, 1, 1,
1.278032, -0.02164548, 2.796391, 1, 0, 0, 1, 1,
1.279755, -0.3317998, 0.8889464, 1, 0, 0, 1, 1,
1.281311, 0.2850154, 0.8648226, 1, 0, 0, 1, 1,
1.283901, -0.117326, 2.040931, 0, 0, 0, 1, 1,
1.289906, 0.3487886, 2.262657, 0, 0, 0, 1, 1,
1.296524, -0.7788917, 2.096648, 0, 0, 0, 1, 1,
1.304851, -2.05512, 2.195979, 0, 0, 0, 1, 1,
1.315096, -0.04830827, 4.123816, 0, 0, 0, 1, 1,
1.320024, -1.200276, 3.602223, 0, 0, 0, 1, 1,
1.321132, 0.2059521, -0.02470498, 0, 0, 0, 1, 1,
1.324002, 1.089863, 0.31988, 1, 1, 1, 1, 1,
1.3253, 0.4780788, 2.277794, 1, 1, 1, 1, 1,
1.327996, -0.3180394, 0.3746668, 1, 1, 1, 1, 1,
1.331988, -1.266253, 2.870863, 1, 1, 1, 1, 1,
1.33904, -0.5935089, 0.1210886, 1, 1, 1, 1, 1,
1.349232, -1.359256, 1.836091, 1, 1, 1, 1, 1,
1.359695, -0.8226404, 2.527534, 1, 1, 1, 1, 1,
1.35994, 1.083463, -0.1321422, 1, 1, 1, 1, 1,
1.372172, 0.661715, 1.473643, 1, 1, 1, 1, 1,
1.383029, -0.3063272, 2.522533, 1, 1, 1, 1, 1,
1.390329, -0.3083043, 1.756452, 1, 1, 1, 1, 1,
1.402883, 0.1236076, 2.285047, 1, 1, 1, 1, 1,
1.403598, 0.6369265, 0.4452555, 1, 1, 1, 1, 1,
1.40874, -0.1266763, 1.06459, 1, 1, 1, 1, 1,
1.410733, 0.3554962, 1.720648, 1, 1, 1, 1, 1,
1.41635, 0.5938288, 1.898488, 0, 0, 1, 1, 1,
1.418149, -0.4018446, 2.023448, 1, 0, 0, 1, 1,
1.420074, 1.442401, 0.4011775, 1, 0, 0, 1, 1,
1.426987, 1.185668, 1.135553, 1, 0, 0, 1, 1,
1.431179, 0.2408286, 1.064054, 1, 0, 0, 1, 1,
1.441669, 0.1730683, 0.5793618, 1, 0, 0, 1, 1,
1.444473, -1.715521, 3.606043, 0, 0, 0, 1, 1,
1.457316, -1.704542, 1.819537, 0, 0, 0, 1, 1,
1.458082, 0.8601319, -0.06147645, 0, 0, 0, 1, 1,
1.459159, -0.6704263, 0.7417659, 0, 0, 0, 1, 1,
1.491717, -1.230377, 1.540069, 0, 0, 0, 1, 1,
1.49425, 0.4474981, -0.3365639, 0, 0, 0, 1, 1,
1.499591, 0.1954683, 1.971686, 0, 0, 0, 1, 1,
1.508938, -0.3170746, 1.212929, 1, 1, 1, 1, 1,
1.524226, -0.5466867, 2.069884, 1, 1, 1, 1, 1,
1.525225, -1.481213, 1.693238, 1, 1, 1, 1, 1,
1.526634, 1.453718, 2.08568, 1, 1, 1, 1, 1,
1.534021, -0.5589505, 0.9625966, 1, 1, 1, 1, 1,
1.534627, -0.5045947, 1.432064, 1, 1, 1, 1, 1,
1.534773, -0.5172365, 0.7001361, 1, 1, 1, 1, 1,
1.55607, -2.016553, 2.237159, 1, 1, 1, 1, 1,
1.57145, -2.179077, 2.010035, 1, 1, 1, 1, 1,
1.608893, -0.1068961, 1.127149, 1, 1, 1, 1, 1,
1.612142, 0.2993998, 2.755537, 1, 1, 1, 1, 1,
1.622207, 0.09020444, 2.166481, 1, 1, 1, 1, 1,
1.624176, -0.2063726, 0.8368501, 1, 1, 1, 1, 1,
1.627119, 0.1160339, 1.182973, 1, 1, 1, 1, 1,
1.636013, 0.734392, -0.3704207, 1, 1, 1, 1, 1,
1.645743, 0.07233985, 3.428486, 0, 0, 1, 1, 1,
1.651344, -0.3890103, -0.8205815, 1, 0, 0, 1, 1,
1.65737, 0.1133046, 3.839078, 1, 0, 0, 1, 1,
1.659088, 0.06498905, 0.951059, 1, 0, 0, 1, 1,
1.66823, 1.154112, 0.1001643, 1, 0, 0, 1, 1,
1.679208, 1.282135, 1.547933, 1, 0, 0, 1, 1,
1.689721, -0.4211402, 1.84903, 0, 0, 0, 1, 1,
1.703601, -1.218222, 1.724373, 0, 0, 0, 1, 1,
1.709146, -0.09914126, 0.5410264, 0, 0, 0, 1, 1,
1.731947, 0.1917402, 1.848242, 0, 0, 0, 1, 1,
1.756928, -0.2434977, 3.793213, 0, 0, 0, 1, 1,
1.757298, 0.1090918, 0.3341988, 0, 0, 0, 1, 1,
1.768341, 0.05541071, 2.249777, 0, 0, 0, 1, 1,
1.768643, 1.407656, 1.08583, 1, 1, 1, 1, 1,
1.776992, -0.1267642, 1.636326, 1, 1, 1, 1, 1,
1.790637, -0.1074859, 0.4717016, 1, 1, 1, 1, 1,
1.797621, 1.597325, 0.7687331, 1, 1, 1, 1, 1,
1.805233, -0.3715542, 1.953135, 1, 1, 1, 1, 1,
1.87598, 0.05954727, 3.033825, 1, 1, 1, 1, 1,
1.925497, -0.1173455, 1.793738, 1, 1, 1, 1, 1,
1.962931, -1.157933, 1.799289, 1, 1, 1, 1, 1,
1.977989, 0.4012985, 2.082295, 1, 1, 1, 1, 1,
1.983876, -0.6460764, 1.769918, 1, 1, 1, 1, 1,
1.994972, 0.8821579, 1.820249, 1, 1, 1, 1, 1,
2.031345, 0.08947854, 0.6434568, 1, 1, 1, 1, 1,
2.071389, 0.8306317, 0.8949171, 1, 1, 1, 1, 1,
2.122046, -0.6077992, 1.845351, 1, 1, 1, 1, 1,
2.137893, 1.497653, -0.18238, 1, 1, 1, 1, 1,
2.147655, 0.3396951, 1.501318, 0, 0, 1, 1, 1,
2.218183, 0.07706489, 1.524182, 1, 0, 0, 1, 1,
2.221813, 0.2042148, 3.232917, 1, 0, 0, 1, 1,
2.226449, 1.391785, 0.5770483, 1, 0, 0, 1, 1,
2.251657, 1.215613, 2.250381, 1, 0, 0, 1, 1,
2.274094, 0.435972, 0.5447367, 1, 0, 0, 1, 1,
2.326228, -0.2039151, 2.290472, 0, 0, 0, 1, 1,
2.433121, -1.157624, 3.814258, 0, 0, 0, 1, 1,
2.46871, -0.5082762, 1.586451, 0, 0, 0, 1, 1,
2.526565, 0.8975602, 0.3966766, 0, 0, 0, 1, 1,
2.767969, -1.326338, 3.230283, 0, 0, 0, 1, 1,
2.776604, 0.1933726, 1.958143, 0, 0, 0, 1, 1,
2.778147, 0.6851051, 1.862872, 0, 0, 0, 1, 1,
2.804515, -0.4280375, 1.875488, 1, 1, 1, 1, 1,
2.845487, -0.8791625, 2.044752, 1, 1, 1, 1, 1,
2.944935, 0.6480917, 2.54319, 1, 1, 1, 1, 1,
3.078747, -0.5411125, 1.040126, 1, 1, 1, 1, 1,
3.085409, 0.6462522, 0.02842112, 1, 1, 1, 1, 1,
3.1098, -0.7565217, 1.413248, 1, 1, 1, 1, 1,
3.51831, -0.3477529, 1.184733, 1, 1, 1, 1, 1
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
var radius = 9.316202;
var distance = 32.72276;
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
mvMatrix.translate( -0.2456326, -0.04504681, -0.106673 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.72276);
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
