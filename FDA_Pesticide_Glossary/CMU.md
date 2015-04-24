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
-2.858355, -0.8081274, -3.306496, 1, 0, 0, 1,
-2.654336, 0.7554861, -1.260785, 1, 0.007843138, 0, 1,
-2.646008, -1.022655, -2.084223, 1, 0.01176471, 0, 1,
-2.624269, 1.220163, -1.721807, 1, 0.01960784, 0, 1,
-2.609783, -0.3276816, -2.508705, 1, 0.02352941, 0, 1,
-2.336635, 2.443183, 0.03510693, 1, 0.03137255, 0, 1,
-2.326036, -0.2517592, -0.8462839, 1, 0.03529412, 0, 1,
-2.310116, 0.3595693, -1.947675, 1, 0.04313726, 0, 1,
-2.280984, 1.83744, -1.817287, 1, 0.04705882, 0, 1,
-2.218848, -0.3722171, -1.848963, 1, 0.05490196, 0, 1,
-2.141233, -3.289747, -1.687723, 1, 0.05882353, 0, 1,
-2.138017, -0.1530297, -0.9502983, 1, 0.06666667, 0, 1,
-2.116816, -0.7645455, -1.576991, 1, 0.07058824, 0, 1,
-2.052398, -0.7759053, -3.429577, 1, 0.07843138, 0, 1,
-2.037951, -0.4443613, -3.280063, 1, 0.08235294, 0, 1,
-2.032818, -0.319057, -2.564979, 1, 0.09019608, 0, 1,
-2.024622, 1.067402, -0.9338018, 1, 0.09411765, 0, 1,
-2.021236, 0.7137097, -1.759707, 1, 0.1019608, 0, 1,
-2.003673, -0.8492464, -0.8990691, 1, 0.1098039, 0, 1,
-2.00086, -0.07856683, -1.968111, 1, 0.1137255, 0, 1,
-1.968321, 1.716425, 0.7105043, 1, 0.1215686, 0, 1,
-1.920275, 0.3620646, -1.90443, 1, 0.1254902, 0, 1,
-1.918926, -0.7341034, -2.662216, 1, 0.1333333, 0, 1,
-1.871972, 0.7335336, -1.120337, 1, 0.1372549, 0, 1,
-1.86615, -0.4348327, -1.637441, 1, 0.145098, 0, 1,
-1.863844, -0.4636009, -3.079687, 1, 0.1490196, 0, 1,
-1.848148, -0.9151218, -3.746473, 1, 0.1568628, 0, 1,
-1.831565, 2.118481, -2.240618, 1, 0.1607843, 0, 1,
-1.818623, -0.6415027, -0.9026819, 1, 0.1686275, 0, 1,
-1.775894, -0.09581912, -2.912978, 1, 0.172549, 0, 1,
-1.7509, -1.640985, -1.769058, 1, 0.1803922, 0, 1,
-1.74307, 0.7303794, -0.4673772, 1, 0.1843137, 0, 1,
-1.708062, -0.4107641, -2.245225, 1, 0.1921569, 0, 1,
-1.684857, 0.5053077, -2.616705, 1, 0.1960784, 0, 1,
-1.672851, -0.468823, -1.131124, 1, 0.2039216, 0, 1,
-1.671177, -0.4586765, -2.857083, 1, 0.2117647, 0, 1,
-1.670135, -2.027109, -4.066588, 1, 0.2156863, 0, 1,
-1.665465, 1.909101, -1.277098, 1, 0.2235294, 0, 1,
-1.622824, -0.3723465, -1.933676, 1, 0.227451, 0, 1,
-1.60653, -1.494074, -1.720571, 1, 0.2352941, 0, 1,
-1.60052, -0.5876496, -3.110133, 1, 0.2392157, 0, 1,
-1.600012, -0.7098455, -2.182064, 1, 0.2470588, 0, 1,
-1.577848, -1.527551, -1.258426, 1, 0.2509804, 0, 1,
-1.570015, -0.1991886, -1.06098, 1, 0.2588235, 0, 1,
-1.569628, -0.2907763, -3.039542, 1, 0.2627451, 0, 1,
-1.559241, -1.669159, -1.534891, 1, 0.2705882, 0, 1,
-1.556282, 0.640327, -1.203587, 1, 0.2745098, 0, 1,
-1.548603, -0.3023587, -0.7810799, 1, 0.282353, 0, 1,
-1.545845, 1.155684, -0.2625739, 1, 0.2862745, 0, 1,
-1.520959, -0.3455372, -1.685887, 1, 0.2941177, 0, 1,
-1.517578, 0.04638393, -0.8198482, 1, 0.3019608, 0, 1,
-1.507007, -0.340641, -1.204563, 1, 0.3058824, 0, 1,
-1.506258, -0.06032185, -1.952137, 1, 0.3137255, 0, 1,
-1.497932, -0.8809179, -1.569703, 1, 0.3176471, 0, 1,
-1.497129, -0.85572, -2.426519, 1, 0.3254902, 0, 1,
-1.483021, 1.333704, -1.359499, 1, 0.3294118, 0, 1,
-1.470882, 1.235377, -1.661188, 1, 0.3372549, 0, 1,
-1.465185, 0.7232081, -4.426448, 1, 0.3411765, 0, 1,
-1.464933, 0.6877441, -0.207312, 1, 0.3490196, 0, 1,
-1.463248, -1.00496, -2.031515, 1, 0.3529412, 0, 1,
-1.454473, 1.021584, 0.6567335, 1, 0.3607843, 0, 1,
-1.444815, 0.08764526, -0.2950495, 1, 0.3647059, 0, 1,
-1.443598, -0.4160943, -1.935845, 1, 0.372549, 0, 1,
-1.436795, -0.4836785, -2.081343, 1, 0.3764706, 0, 1,
-1.436358, -1.33606, -2.441586, 1, 0.3843137, 0, 1,
-1.432091, 0.09564301, -1.05972, 1, 0.3882353, 0, 1,
-1.423403, 0.2875829, -1.117328, 1, 0.3960784, 0, 1,
-1.420333, 0.3941885, -2.415453, 1, 0.4039216, 0, 1,
-1.417994, -0.5517778, -0.5862867, 1, 0.4078431, 0, 1,
-1.413768, -0.8159162, -2.506102, 1, 0.4156863, 0, 1,
-1.410404, 1.552001, 0.4559258, 1, 0.4196078, 0, 1,
-1.409316, -0.4708301, -1.648591, 1, 0.427451, 0, 1,
-1.40803, 0.3956011, -0.7046561, 1, 0.4313726, 0, 1,
-1.407524, -1.071395, -2.032044, 1, 0.4392157, 0, 1,
-1.393831, -0.09822925, -1.298481, 1, 0.4431373, 0, 1,
-1.393446, -0.4847165, -1.430027, 1, 0.4509804, 0, 1,
-1.381457, 0.8329959, -0.4227968, 1, 0.454902, 0, 1,
-1.374781, 0.4064398, 0.6526452, 1, 0.4627451, 0, 1,
-1.373486, -0.649647, -2.150864, 1, 0.4666667, 0, 1,
-1.369604, -1.031, -1.578649, 1, 0.4745098, 0, 1,
-1.363149, 0.5769489, -1.593554, 1, 0.4784314, 0, 1,
-1.355261, 0.1349954, -0.4076696, 1, 0.4862745, 0, 1,
-1.3463, 0.1446183, -0.6706901, 1, 0.4901961, 0, 1,
-1.334547, 0.8655886, 0.5056291, 1, 0.4980392, 0, 1,
-1.332063, 0.1539331, -0.4879985, 1, 0.5058824, 0, 1,
-1.32395, 0.2919947, -0.4917249, 1, 0.509804, 0, 1,
-1.312199, 0.84157, -0.9943253, 1, 0.5176471, 0, 1,
-1.290776, -0.2285241, -2.617701, 1, 0.5215687, 0, 1,
-1.288209, -1.217483, -3.280423, 1, 0.5294118, 0, 1,
-1.281064, -1.221097, -0.4495593, 1, 0.5333334, 0, 1,
-1.279629, 0.683389, -2.339224, 1, 0.5411765, 0, 1,
-1.276803, 1.471094, -0.2739503, 1, 0.5450981, 0, 1,
-1.2743, -1.385116, -1.942719, 1, 0.5529412, 0, 1,
-1.272667, -1.073227, -2.482473, 1, 0.5568628, 0, 1,
-1.268276, 0.5883146, -1.808403, 1, 0.5647059, 0, 1,
-1.266886, 0.03437056, -0.4997246, 1, 0.5686275, 0, 1,
-1.242446, -0.4336163, -2.242617, 1, 0.5764706, 0, 1,
-1.240199, 0.5118005, -3.396317, 1, 0.5803922, 0, 1,
-1.234665, 0.1751234, -0.7814562, 1, 0.5882353, 0, 1,
-1.227754, -0.5355674, -2.567474, 1, 0.5921569, 0, 1,
-1.224078, -0.2491173, -3.03685, 1, 0.6, 0, 1,
-1.214925, 0.2117606, -0.8737503, 1, 0.6078432, 0, 1,
-1.211001, 1.011149, -1.792366, 1, 0.6117647, 0, 1,
-1.210514, -0.1017692, 0.06442489, 1, 0.6196079, 0, 1,
-1.206149, -0.02314803, -2.632189, 1, 0.6235294, 0, 1,
-1.203588, 0.1178346, -0.793492, 1, 0.6313726, 0, 1,
-1.202713, 0.7705833, -1.435332, 1, 0.6352941, 0, 1,
-1.200198, 0.4643416, 0.2316528, 1, 0.6431373, 0, 1,
-1.190681, 1.662693, -0.593335, 1, 0.6470588, 0, 1,
-1.181352, -1.680402, -1.893435, 1, 0.654902, 0, 1,
-1.180607, -0.5655624, -1.93765, 1, 0.6588235, 0, 1,
-1.179477, 1.816346, -0.4426876, 1, 0.6666667, 0, 1,
-1.17314, 0.4600269, 0.0593558, 1, 0.6705883, 0, 1,
-1.170285, -1.572236, -2.497565, 1, 0.6784314, 0, 1,
-1.165548, -1.436778, -2.388163, 1, 0.682353, 0, 1,
-1.164122, 0.7798639, -1.559574, 1, 0.6901961, 0, 1,
-1.163284, 0.2230051, -0.4317602, 1, 0.6941177, 0, 1,
-1.159853, -1.261555, -3.129636, 1, 0.7019608, 0, 1,
-1.15962, -0.5326523, -2.354032, 1, 0.7098039, 0, 1,
-1.158768, -1.168698, -0.3022255, 1, 0.7137255, 0, 1,
-1.141662, -1.223442, -2.477757, 1, 0.7215686, 0, 1,
-1.130953, -0.1567906, -2.93105, 1, 0.7254902, 0, 1,
-1.120024, 0.9184976, 1.221526, 1, 0.7333333, 0, 1,
-1.119691, -1.666446, -4.231045, 1, 0.7372549, 0, 1,
-1.118538, 1.174497, 0.0686027, 1, 0.7450981, 0, 1,
-1.10949, 0.3396252, -1.966355, 1, 0.7490196, 0, 1,
-1.101428, 0.1783262, -1.964335, 1, 0.7568628, 0, 1,
-1.099894, -1.965415, -2.24965, 1, 0.7607843, 0, 1,
-1.092158, -0.199535, 0.05721719, 1, 0.7686275, 0, 1,
-1.091061, 0.2953367, -0.7997996, 1, 0.772549, 0, 1,
-1.090464, 2.555964, -0.1432009, 1, 0.7803922, 0, 1,
-1.090359, 0.3389267, -1.732839, 1, 0.7843137, 0, 1,
-1.081813, 1.759397, -0.5919445, 1, 0.7921569, 0, 1,
-1.081416, -0.2061299, -4.035833, 1, 0.7960784, 0, 1,
-1.077062, 0.757049, -0.105645, 1, 0.8039216, 0, 1,
-1.05915, -1.318844, -2.72326, 1, 0.8117647, 0, 1,
-1.05517, -0.7519841, -3.923731, 1, 0.8156863, 0, 1,
-1.054518, 1.460004, -1.368417, 1, 0.8235294, 0, 1,
-1.05017, 0.2061969, -1.2634, 1, 0.827451, 0, 1,
-1.048161, -0.6299703, -1.817625, 1, 0.8352941, 0, 1,
-1.043516, 0.6816618, -0.8574066, 1, 0.8392157, 0, 1,
-1.031735, 0.9552698, 0.6300167, 1, 0.8470588, 0, 1,
-1.031314, -0.6481104, -0.7004606, 1, 0.8509804, 0, 1,
-1.030147, 2.628296, -0.1259898, 1, 0.8588235, 0, 1,
-1.027545, -0.242181, -0.8223059, 1, 0.8627451, 0, 1,
-1.026247, -1.099535, -1.667127, 1, 0.8705882, 0, 1,
-1.025471, -0.4585648, -3.68506, 1, 0.8745098, 0, 1,
-1.019547, -1.309112, -4.733658, 1, 0.8823529, 0, 1,
-1.015155, -1.691398, -1.617589, 1, 0.8862745, 0, 1,
-0.9969566, -0.5822641, -2.148642, 1, 0.8941177, 0, 1,
-0.9945506, -0.5238376, -0.8410194, 1, 0.8980392, 0, 1,
-0.9940681, 1.292355, -0.8151852, 1, 0.9058824, 0, 1,
-0.9850368, 0.2487422, -0.8465853, 1, 0.9137255, 0, 1,
-0.9843765, -0.4504658, -0.2537703, 1, 0.9176471, 0, 1,
-0.9801142, 0.1805241, -0.9133666, 1, 0.9254902, 0, 1,
-0.9765857, -2.039106, -3.917565, 1, 0.9294118, 0, 1,
-0.9750412, -0.2352152, -2.382188, 1, 0.9372549, 0, 1,
-0.9709479, 0.4048985, -2.386325, 1, 0.9411765, 0, 1,
-0.9662859, -1.718078, -3.856721, 1, 0.9490196, 0, 1,
-0.963857, -2.344076, -4.34523, 1, 0.9529412, 0, 1,
-0.9636414, 1.236924, -1.415533, 1, 0.9607843, 0, 1,
-0.9624864, 2.195464, 0.2988255, 1, 0.9647059, 0, 1,
-0.9576171, 0.5797874, -1.505156, 1, 0.972549, 0, 1,
-0.9567689, -1.654201, -2.22291, 1, 0.9764706, 0, 1,
-0.95276, 0.505033, -2.120425, 1, 0.9843137, 0, 1,
-0.9502992, 1.431558, -1.049628, 1, 0.9882353, 0, 1,
-0.9440939, 0.3198477, -0.9031118, 1, 0.9960784, 0, 1,
-0.9352082, -0.4444989, -1.810723, 0.9960784, 1, 0, 1,
-0.931608, -0.9758838, -4.154041, 0.9921569, 1, 0, 1,
-0.927296, 0.1155229, -1.654811, 0.9843137, 1, 0, 1,
-0.9247948, 0.2857507, -1.995339, 0.9803922, 1, 0, 1,
-0.9187056, -0.8956084, -3.197241, 0.972549, 1, 0, 1,
-0.9171141, -0.1394152, -1.584912, 0.9686275, 1, 0, 1,
-0.9154086, -0.06152618, -0.8426793, 0.9607843, 1, 0, 1,
-0.9133194, -0.1007945, -2.091266, 0.9568627, 1, 0, 1,
-0.9072829, -0.156792, -2.822159, 0.9490196, 1, 0, 1,
-0.9061792, 1.91186, -0.7010862, 0.945098, 1, 0, 1,
-0.9061104, 1.31278, -2.45117, 0.9372549, 1, 0, 1,
-0.9004176, -1.083172, -2.821193, 0.9333333, 1, 0, 1,
-0.899711, 1.801795, -0.4561158, 0.9254902, 1, 0, 1,
-0.898409, -0.3434341, -2.110477, 0.9215686, 1, 0, 1,
-0.8871985, -1.168751, -2.617793, 0.9137255, 1, 0, 1,
-0.8864449, 0.7352066, -0.9686612, 0.9098039, 1, 0, 1,
-0.8846165, -0.7847626, -0.1658212, 0.9019608, 1, 0, 1,
-0.8760897, 0.08208361, -1.131413, 0.8941177, 1, 0, 1,
-0.874611, 0.5808753, 2.444317, 0.8901961, 1, 0, 1,
-0.8614323, -0.4992821, -2.23785, 0.8823529, 1, 0, 1,
-0.8561488, 1.087748, -0.4610712, 0.8784314, 1, 0, 1,
-0.8534939, -0.1522528, -1.996246, 0.8705882, 1, 0, 1,
-0.8506107, -0.1021207, -1.414933, 0.8666667, 1, 0, 1,
-0.8495646, -1.690098, -0.548458, 0.8588235, 1, 0, 1,
-0.8485143, 0.6651775, -1.87723, 0.854902, 1, 0, 1,
-0.847178, -0.4368617, -1.801846, 0.8470588, 1, 0, 1,
-0.8439371, -0.6142027, -1.390027, 0.8431373, 1, 0, 1,
-0.8388584, 0.5431489, -0.6516419, 0.8352941, 1, 0, 1,
-0.8388394, 1.127743, 0.6107309, 0.8313726, 1, 0, 1,
-0.8368976, 0.7186006, 0.8438851, 0.8235294, 1, 0, 1,
-0.8345631, -1.026545, -2.628482, 0.8196079, 1, 0, 1,
-0.83429, -0.3947116, -2.683728, 0.8117647, 1, 0, 1,
-0.8332717, 1.239459, -1.377352, 0.8078431, 1, 0, 1,
-0.8320812, -0.07202487, -2.671187, 0.8, 1, 0, 1,
-0.8276343, -0.7165958, -2.946197, 0.7921569, 1, 0, 1,
-0.8258248, -0.2619461, -1.19257, 0.7882353, 1, 0, 1,
-0.8221982, -1.124174, -2.519641, 0.7803922, 1, 0, 1,
-0.8153726, -1.930326, -3.82001, 0.7764706, 1, 0, 1,
-0.8153231, -0.9846365, -2.091454, 0.7686275, 1, 0, 1,
-0.8149272, 0.8440871, -1.062962, 0.7647059, 1, 0, 1,
-0.8047878, 1.657462, -0.8579563, 0.7568628, 1, 0, 1,
-0.7953253, -1.265559, -4.119542, 0.7529412, 1, 0, 1,
-0.7947372, -1.211169, -2.140669, 0.7450981, 1, 0, 1,
-0.7930794, -1.655108, -1.677231, 0.7411765, 1, 0, 1,
-0.7920994, -0.310908, -2.346485, 0.7333333, 1, 0, 1,
-0.7910974, -0.1487251, -1.509325, 0.7294118, 1, 0, 1,
-0.7863549, 0.3919656, -1.998309, 0.7215686, 1, 0, 1,
-0.7837282, -1.461339, -0.5690845, 0.7176471, 1, 0, 1,
-0.7829075, 0.3346244, -1.892501, 0.7098039, 1, 0, 1,
-0.7821208, -0.04111467, 0.7417368, 0.7058824, 1, 0, 1,
-0.779047, 1.738922, 0.3593508, 0.6980392, 1, 0, 1,
-0.7766949, 1.136202, -0.6407233, 0.6901961, 1, 0, 1,
-0.7752931, 0.04889265, -0.07473746, 0.6862745, 1, 0, 1,
-0.7575244, -0.4866288, -1.653004, 0.6784314, 1, 0, 1,
-0.7537539, -1.178738, -2.90924, 0.6745098, 1, 0, 1,
-0.7515791, -0.5515, -2.476952, 0.6666667, 1, 0, 1,
-0.7512901, 1.162839, -1.246457, 0.6627451, 1, 0, 1,
-0.7509619, -1.265141, -2.844145, 0.654902, 1, 0, 1,
-0.7503307, 1.898925, -0.3742105, 0.6509804, 1, 0, 1,
-0.7499313, -0.547199, -3.419123, 0.6431373, 1, 0, 1,
-0.7462838, -1.659277, -3.065162, 0.6392157, 1, 0, 1,
-0.733429, 0.6867738, -0.9614818, 0.6313726, 1, 0, 1,
-0.7331661, -1.232804, -3.335994, 0.627451, 1, 0, 1,
-0.7331061, 0.3052396, -1.563827, 0.6196079, 1, 0, 1,
-0.72835, 1.468182, -1.962856, 0.6156863, 1, 0, 1,
-0.7273475, 0.1874028, 0.1850602, 0.6078432, 1, 0, 1,
-0.7263663, 0.4811058, -0.3622776, 0.6039216, 1, 0, 1,
-0.7151796, 0.2656724, -1.810629, 0.5960785, 1, 0, 1,
-0.710223, -1.302999, -2.979847, 0.5882353, 1, 0, 1,
-0.7096533, 0.8051509, 1.099577, 0.5843138, 1, 0, 1,
-0.7082388, 0.1754274, -2.233152, 0.5764706, 1, 0, 1,
-0.7047932, 0.3131985, 0.3545449, 0.572549, 1, 0, 1,
-0.6966321, 1.381651, -0.3332212, 0.5647059, 1, 0, 1,
-0.6890146, -0.326892, -1.244686, 0.5607843, 1, 0, 1,
-0.679943, 0.1796291, 0.1292942, 0.5529412, 1, 0, 1,
-0.6743249, 1.265882, -0.4512293, 0.5490196, 1, 0, 1,
-0.6717864, 0.8849045, -0.5534244, 0.5411765, 1, 0, 1,
-0.6660381, -0.1320278, -1.412416, 0.5372549, 1, 0, 1,
-0.6648964, -2.222338, -4.528867, 0.5294118, 1, 0, 1,
-0.6644637, 1.590208, -0.8467957, 0.5254902, 1, 0, 1,
-0.664004, 0.4092206, -1.903402, 0.5176471, 1, 0, 1,
-0.6633025, -1.533777, -3.548945, 0.5137255, 1, 0, 1,
-0.6563556, 1.007745, -2.041273, 0.5058824, 1, 0, 1,
-0.6559657, 0.6197831, -2.163192, 0.5019608, 1, 0, 1,
-0.6517699, 0.4431432, -1.095388, 0.4941176, 1, 0, 1,
-0.6471315, 0.2998317, -1.090872, 0.4862745, 1, 0, 1,
-0.6446916, 1.062344, -0.2068783, 0.4823529, 1, 0, 1,
-0.6442443, -0.3668513, -2.601714, 0.4745098, 1, 0, 1,
-0.6411512, 0.64146, 0.3863049, 0.4705882, 1, 0, 1,
-0.6381902, -1.309732, -0.8137099, 0.4627451, 1, 0, 1,
-0.6346692, -0.7798733, -1.808792, 0.4588235, 1, 0, 1,
-0.6343158, 0.3891445, -1.720272, 0.4509804, 1, 0, 1,
-0.6321022, 0.3920738, -1.300533, 0.4470588, 1, 0, 1,
-0.6311427, -0.03330184, -0.7935607, 0.4392157, 1, 0, 1,
-0.6274934, -0.91145, -3.646313, 0.4352941, 1, 0, 1,
-0.6196877, 1.411401, -1.461482, 0.427451, 1, 0, 1,
-0.6118763, -0.1845832, -1.468105, 0.4235294, 1, 0, 1,
-0.606261, -2.611755, -1.986456, 0.4156863, 1, 0, 1,
-0.601083, 1.048812, 0.5463876, 0.4117647, 1, 0, 1,
-0.5889431, -0.8493727, -2.724346, 0.4039216, 1, 0, 1,
-0.5851026, -1.454752, -3.07263, 0.3960784, 1, 0, 1,
-0.5838133, -0.814598, -1.378475, 0.3921569, 1, 0, 1,
-0.581193, 0.162679, -1.43313, 0.3843137, 1, 0, 1,
-0.5744331, -0.5177729, -1.646469, 0.3803922, 1, 0, 1,
-0.5715788, -1.874535, -3.072641, 0.372549, 1, 0, 1,
-0.5690164, -0.09689469, -3.344131, 0.3686275, 1, 0, 1,
-0.5631948, -0.9128036, -2.762083, 0.3607843, 1, 0, 1,
-0.5626204, 1.320613, 0.2853683, 0.3568628, 1, 0, 1,
-0.5576335, -1.024855, -3.281859, 0.3490196, 1, 0, 1,
-0.5568123, -0.3173121, -1.320269, 0.345098, 1, 0, 1,
-0.5559192, 0.1869191, -1.273227, 0.3372549, 1, 0, 1,
-0.5548867, 0.04181033, -2.475486, 0.3333333, 1, 0, 1,
-0.5533482, 1.539117, -3.135307, 0.3254902, 1, 0, 1,
-0.5519871, -0.2196129, -2.092347, 0.3215686, 1, 0, 1,
-0.5398484, 0.3994297, -0.6452777, 0.3137255, 1, 0, 1,
-0.5395745, 0.2077941, -2.067173, 0.3098039, 1, 0, 1,
-0.5340031, -0.15757, -1.362852, 0.3019608, 1, 0, 1,
-0.5308891, -0.0419233, -1.297176, 0.2941177, 1, 0, 1,
-0.5292833, 0.01892078, -3.557192, 0.2901961, 1, 0, 1,
-0.5284939, -0.5576259, -2.333095, 0.282353, 1, 0, 1,
-0.5228526, 0.1522291, -1.112185, 0.2784314, 1, 0, 1,
-0.5205695, -0.5689324, -2.270175, 0.2705882, 1, 0, 1,
-0.5196852, 0.6888672, 0.3567936, 0.2666667, 1, 0, 1,
-0.5194238, -0.5563986, -1.959255, 0.2588235, 1, 0, 1,
-0.5188377, 1.735644, 2.009962, 0.254902, 1, 0, 1,
-0.5177431, 1.873725, -1.175663, 0.2470588, 1, 0, 1,
-0.5127245, -0.4902866, -2.1641, 0.2431373, 1, 0, 1,
-0.5078409, -1.598891, -2.246972, 0.2352941, 1, 0, 1,
-0.5061008, 0.9867117, 0.3319003, 0.2313726, 1, 0, 1,
-0.5049585, 0.6082197, -1.242876, 0.2235294, 1, 0, 1,
-0.5022877, -1.35156, -1.93633, 0.2196078, 1, 0, 1,
-0.49999, 0.2641809, -1.587733, 0.2117647, 1, 0, 1,
-0.4915582, 0.9645731, -1.050067, 0.2078431, 1, 0, 1,
-0.4911419, -1.282597, -0.8641586, 0.2, 1, 0, 1,
-0.4902571, -0.9875768, -2.575837, 0.1921569, 1, 0, 1,
-0.4878176, -0.1018591, -2.617816, 0.1882353, 1, 0, 1,
-0.4823456, -0.7367941, -2.972559, 0.1803922, 1, 0, 1,
-0.4806653, 0.2908598, -1.118597, 0.1764706, 1, 0, 1,
-0.4801102, -0.9841499, -4.228996, 0.1686275, 1, 0, 1,
-0.4795565, -1.858193, -2.539827, 0.1647059, 1, 0, 1,
-0.4789636, 0.6454363, 0.1793274, 0.1568628, 1, 0, 1,
-0.4766077, 1.664858, -0.3972751, 0.1529412, 1, 0, 1,
-0.4715374, -0.6674441, -2.723059, 0.145098, 1, 0, 1,
-0.4663498, -2.060261, -2.50349, 0.1411765, 1, 0, 1,
-0.4600343, -2.352731, -3.254954, 0.1333333, 1, 0, 1,
-0.4573258, -1.138667, -2.790441, 0.1294118, 1, 0, 1,
-0.4526281, 0.8665036, -1.853958, 0.1215686, 1, 0, 1,
-0.4470235, 1.519441, -1.866239, 0.1176471, 1, 0, 1,
-0.4420816, -1.561351, -3.316046, 0.1098039, 1, 0, 1,
-0.4402101, 1.738926, -1.684302, 0.1058824, 1, 0, 1,
-0.4346676, -0.4963552, -1.7236, 0.09803922, 1, 0, 1,
-0.4340598, 1.103052, -0.1232144, 0.09019608, 1, 0, 1,
-0.4287604, 0.6006747, -0.44231, 0.08627451, 1, 0, 1,
-0.4269179, 0.2765724, -1.925731, 0.07843138, 1, 0, 1,
-0.4242789, -0.4498449, -3.544128, 0.07450981, 1, 0, 1,
-0.4191827, 0.3686337, -0.7234687, 0.06666667, 1, 0, 1,
-0.4167102, 0.3419223, -0.1744852, 0.0627451, 1, 0, 1,
-0.4146224, -0.7862183, -2.120312, 0.05490196, 1, 0, 1,
-0.4144502, -0.9543064, -3.628171, 0.05098039, 1, 0, 1,
-0.410801, -0.07787073, -2.026366, 0.04313726, 1, 0, 1,
-0.4030244, -1.29771, -4.090112, 0.03921569, 1, 0, 1,
-0.3977684, -0.7215517, -2.214005, 0.03137255, 1, 0, 1,
-0.3976208, 0.3866163, 0.2407182, 0.02745098, 1, 0, 1,
-0.3976109, -0.2711834, -3.214213, 0.01960784, 1, 0, 1,
-0.3959407, -1.133739, -2.425066, 0.01568628, 1, 0, 1,
-0.3948536, -0.4074313, -1.403498, 0.007843138, 1, 0, 1,
-0.3921377, 1.247599, 0.5106218, 0.003921569, 1, 0, 1,
-0.3904124, -0.511306, -4.422495, 0, 1, 0.003921569, 1,
-0.3895522, 1.359907, -0.194435, 0, 1, 0.01176471, 1,
-0.3893753, 1.975094, -1.005645, 0, 1, 0.01568628, 1,
-0.3885616, 0.2753442, -0.9497699, 0, 1, 0.02352941, 1,
-0.3751567, 1.18751, 0.9736947, 0, 1, 0.02745098, 1,
-0.3712081, -1.147728, -3.749193, 0, 1, 0.03529412, 1,
-0.3711216, -0.3469788, -2.787647, 0, 1, 0.03921569, 1,
-0.3695237, -0.9814427, -3.045622, 0, 1, 0.04705882, 1,
-0.3683247, -0.8262133, -3.192888, 0, 1, 0.05098039, 1,
-0.3639958, 1.452645, -1.194608, 0, 1, 0.05882353, 1,
-0.3604896, 1.793353, 0.6275908, 0, 1, 0.0627451, 1,
-0.3584704, 0.3994262, -0.5533334, 0, 1, 0.07058824, 1,
-0.3549535, 0.4252076, -0.6947169, 0, 1, 0.07450981, 1,
-0.3508011, 1.229676, -0.106042, 0, 1, 0.08235294, 1,
-0.3494493, -0.5040572, -2.36465, 0, 1, 0.08627451, 1,
-0.3494458, 0.2773706, 0.05785228, 0, 1, 0.09411765, 1,
-0.3476357, -0.3007374, -1.659176, 0, 1, 0.1019608, 1,
-0.3457173, -1.368197, -4.332031, 0, 1, 0.1058824, 1,
-0.3436491, -0.6022635, -2.121357, 0, 1, 0.1137255, 1,
-0.3432294, 0.7967848, -0.9519632, 0, 1, 0.1176471, 1,
-0.342036, 1.171194, -0.1799631, 0, 1, 0.1254902, 1,
-0.341128, 0.4998185, 0.8807877, 0, 1, 0.1294118, 1,
-0.3403076, -0.9544548, -4.080211, 0, 1, 0.1372549, 1,
-0.3270496, -0.5107735, -2.226388, 0, 1, 0.1411765, 1,
-0.3249661, -1.157727, -3.049791, 0, 1, 0.1490196, 1,
-0.3239922, -0.8118798, -2.071721, 0, 1, 0.1529412, 1,
-0.3218703, 0.6248907, -0.1404927, 0, 1, 0.1607843, 1,
-0.3196213, 1.443205, -0.5561803, 0, 1, 0.1647059, 1,
-0.3142147, -1.199242, -3.655818, 0, 1, 0.172549, 1,
-0.3125253, -0.6845381, -2.933378, 0, 1, 0.1764706, 1,
-0.3103889, 0.06744353, -1.112771, 0, 1, 0.1843137, 1,
-0.3096142, 0.9426907, -3.127134, 0, 1, 0.1882353, 1,
-0.3067445, 0.09492835, -3.444257, 0, 1, 0.1960784, 1,
-0.3060267, -1.148376, -4.555491, 0, 1, 0.2039216, 1,
-0.3013308, 0.8777264, 1.769272, 0, 1, 0.2078431, 1,
-0.2999893, 0.448333, -0.6396084, 0, 1, 0.2156863, 1,
-0.2972485, -1.178495, -3.687734, 0, 1, 0.2196078, 1,
-0.2943802, -0.642343, -4.388721, 0, 1, 0.227451, 1,
-0.2934382, -0.1456503, -1.500997, 0, 1, 0.2313726, 1,
-0.2908579, 1.038017, -0.373217, 0, 1, 0.2392157, 1,
-0.2863052, -0.7344449, -3.454901, 0, 1, 0.2431373, 1,
-0.2834612, -0.03370803, -0.8187504, 0, 1, 0.2509804, 1,
-0.2834545, 0.7006586, -0.4270142, 0, 1, 0.254902, 1,
-0.2833384, 0.3064257, 0.1977343, 0, 1, 0.2627451, 1,
-0.279531, 0.4134761, -0.4078384, 0, 1, 0.2666667, 1,
-0.2763522, 0.3663993, -2.349099, 0, 1, 0.2745098, 1,
-0.2758242, -1.121902, -2.784677, 0, 1, 0.2784314, 1,
-0.2718009, 1.480809, 0.3429193, 0, 1, 0.2862745, 1,
-0.2648763, 1.369712, 0.9670692, 0, 1, 0.2901961, 1,
-0.2646764, 0.1041608, 0.5591686, 0, 1, 0.2980392, 1,
-0.2637713, -0.6956613, -3.284902, 0, 1, 0.3058824, 1,
-0.26125, 0.05380918, -1.240788, 0, 1, 0.3098039, 1,
-0.2609726, 1.312807, -0.1628647, 0, 1, 0.3176471, 1,
-0.2588629, 0.1904397, 0.6745182, 0, 1, 0.3215686, 1,
-0.2588114, -0.4854977, -3.096333, 0, 1, 0.3294118, 1,
-0.2539271, 0.3869684, -0.7521963, 0, 1, 0.3333333, 1,
-0.2523518, -0.9062313, -4.040303, 0, 1, 0.3411765, 1,
-0.2504299, -0.7997882, -3.486632, 0, 1, 0.345098, 1,
-0.2467353, 0.9571484, -0.1981564, 0, 1, 0.3529412, 1,
-0.2459379, 1.142811, 0.5560076, 0, 1, 0.3568628, 1,
-0.2458541, -0.3844169, -3.515471, 0, 1, 0.3647059, 1,
-0.2345536, -1.157652, -4.556371, 0, 1, 0.3686275, 1,
-0.2332033, -1.501148, -3.132676, 0, 1, 0.3764706, 1,
-0.2310072, 0.08466338, -1.406918, 0, 1, 0.3803922, 1,
-0.2304042, -1.066044, -3.893475, 0, 1, 0.3882353, 1,
-0.2283134, -0.4928912, -2.631914, 0, 1, 0.3921569, 1,
-0.2267758, 0.6682927, -0.5831628, 0, 1, 0.4, 1,
-0.2247022, -0.802288, -4.162428, 0, 1, 0.4078431, 1,
-0.2206734, -0.7026697, -1.15572, 0, 1, 0.4117647, 1,
-0.2189705, 1.018627, -0.910947, 0, 1, 0.4196078, 1,
-0.2167385, 0.9089851, -0.4603691, 0, 1, 0.4235294, 1,
-0.2162122, -0.1953649, -4.098752, 0, 1, 0.4313726, 1,
-0.2140904, 0.4458292, -0.8786443, 0, 1, 0.4352941, 1,
-0.2135541, -0.644837, -3.812171, 0, 1, 0.4431373, 1,
-0.2080527, 1.055864, 1.240074, 0, 1, 0.4470588, 1,
-0.2040905, 1.395767, -1.935147, 0, 1, 0.454902, 1,
-0.2029581, -0.1374456, -1.636717, 0, 1, 0.4588235, 1,
-0.19856, -0.0356282, -2.718711, 0, 1, 0.4666667, 1,
-0.1982086, -0.9689338, -3.121388, 0, 1, 0.4705882, 1,
-0.1979049, -1.134028, -2.637668, 0, 1, 0.4784314, 1,
-0.1958992, 0.4447825, -0.4659361, 0, 1, 0.4823529, 1,
-0.1957435, 0.5783062, 0.7069476, 0, 1, 0.4901961, 1,
-0.1913696, -0.7045919, -4.588966, 0, 1, 0.4941176, 1,
-0.190938, 1.03502, -0.7244096, 0, 1, 0.5019608, 1,
-0.1906394, 1.092529, 0.07336833, 0, 1, 0.509804, 1,
-0.1853761, 0.01956614, -3.101224, 0, 1, 0.5137255, 1,
-0.1821841, -0.4983764, -3.939606, 0, 1, 0.5215687, 1,
-0.1790286, 1.656952, 0.1945454, 0, 1, 0.5254902, 1,
-0.1761738, -0.6116056, -1.924029, 0, 1, 0.5333334, 1,
-0.1756158, 0.4563847, 1.292856, 0, 1, 0.5372549, 1,
-0.1748636, 0.04636655, -1.283429, 0, 1, 0.5450981, 1,
-0.172746, 0.7049431, 0.6036573, 0, 1, 0.5490196, 1,
-0.1703107, 0.210879, -2.452076, 0, 1, 0.5568628, 1,
-0.1687232, 0.1876702, -0.3153858, 0, 1, 0.5607843, 1,
-0.1665327, -0.3089845, -3.514155, 0, 1, 0.5686275, 1,
-0.1657366, 1.892831, 0.09408003, 0, 1, 0.572549, 1,
-0.1645859, 2.757681, 0.2399806, 0, 1, 0.5803922, 1,
-0.1622453, -0.5395205, -4.677807, 0, 1, 0.5843138, 1,
-0.160957, -0.09701589, -2.434848, 0, 1, 0.5921569, 1,
-0.1574439, 1.311131, 0.713621, 0, 1, 0.5960785, 1,
-0.1552244, 1.418861, -0.2995673, 0, 1, 0.6039216, 1,
-0.1518806, 0.1423444, 0.8466529, 0, 1, 0.6117647, 1,
-0.1510912, -0.9176013, -2.160944, 0, 1, 0.6156863, 1,
-0.1445428, -2.148878, -1.753656, 0, 1, 0.6235294, 1,
-0.144095, -0.5931937, -3.004109, 0, 1, 0.627451, 1,
-0.1440207, -0.0799429, -1.087814, 0, 1, 0.6352941, 1,
-0.1402859, -0.008687355, -1.146881, 0, 1, 0.6392157, 1,
-0.1374715, -1.246243, -3.692089, 0, 1, 0.6470588, 1,
-0.1343282, -0.9624695, -2.6324, 0, 1, 0.6509804, 1,
-0.1322426, 0.03889625, -1.552946, 0, 1, 0.6588235, 1,
-0.1322258, 0.1921674, -0.07755999, 0, 1, 0.6627451, 1,
-0.1300772, -1.052507, -4.369565, 0, 1, 0.6705883, 1,
-0.1288667, -1.411022, -1.847585, 0, 1, 0.6745098, 1,
-0.1281703, -0.7981601, -2.774377, 0, 1, 0.682353, 1,
-0.1269195, -0.002253455, -2.327032, 0, 1, 0.6862745, 1,
-0.1251674, 0.8328809, -0.2213286, 0, 1, 0.6941177, 1,
-0.1243096, -0.8716259, -3.862238, 0, 1, 0.7019608, 1,
-0.1237876, 0.752535, -0.787415, 0, 1, 0.7058824, 1,
-0.1198246, -1.011562, -4.665499, 0, 1, 0.7137255, 1,
-0.1155907, 1.288065, -1.162836, 0, 1, 0.7176471, 1,
-0.1139503, -1.69578, -2.946334, 0, 1, 0.7254902, 1,
-0.1125411, 1.241652, -0.2902509, 0, 1, 0.7294118, 1,
-0.1120689, 1.198877, 0.4250841, 0, 1, 0.7372549, 1,
-0.1094164, 0.7299282, -0.7135115, 0, 1, 0.7411765, 1,
-0.104145, 0.5602047, -1.447514, 0, 1, 0.7490196, 1,
-0.1040446, -0.7648574, -3.437789, 0, 1, 0.7529412, 1,
-0.1016242, -0.789014, -2.428572, 0, 1, 0.7607843, 1,
-0.1011205, -0.9568224, -1.836659, 0, 1, 0.7647059, 1,
-0.09548495, -2.585139, -1.641093, 0, 1, 0.772549, 1,
-0.09512472, 0.4444559, -1.929027, 0, 1, 0.7764706, 1,
-0.09139203, 1.75188, -0.2039125, 0, 1, 0.7843137, 1,
-0.09097786, 0.08409302, -1.6302, 0, 1, 0.7882353, 1,
-0.08547185, -0.5644085, -2.8725, 0, 1, 0.7960784, 1,
-0.08225592, 1.39435, 1.212915, 0, 1, 0.8039216, 1,
-0.08100656, -0.4136999, -1.054977, 0, 1, 0.8078431, 1,
-0.08057626, -1.475545, -3.045728, 0, 1, 0.8156863, 1,
-0.0775537, -1.347815, -2.578057, 0, 1, 0.8196079, 1,
-0.07356212, 1.562727, -0.1608478, 0, 1, 0.827451, 1,
-0.07325216, 0.8134483, -0.3901797, 0, 1, 0.8313726, 1,
-0.07277608, 0.01792979, -1.102552, 0, 1, 0.8392157, 1,
-0.07268622, -1.562308, -2.401188, 0, 1, 0.8431373, 1,
-0.07227799, 1.020642, 0.7469276, 0, 1, 0.8509804, 1,
-0.07123467, -0.4941735, -3.599639, 0, 1, 0.854902, 1,
-0.06499112, -1.49915, -4.655501, 0, 1, 0.8627451, 1,
-0.0636735, -0.09908589, -1.964039, 0, 1, 0.8666667, 1,
-0.0629876, -1.957982, -1.885285, 0, 1, 0.8745098, 1,
-0.06263841, 0.3011521, 1.111054, 0, 1, 0.8784314, 1,
-0.06180557, 0.253321, -1.353825, 0, 1, 0.8862745, 1,
-0.05734047, 0.004978498, -1.422053, 0, 1, 0.8901961, 1,
-0.05604809, -0.1504118, -3.197439, 0, 1, 0.8980392, 1,
-0.0557137, 1.70169, 0.2675207, 0, 1, 0.9058824, 1,
-0.05381256, 0.7263572, 0.5132921, 0, 1, 0.9098039, 1,
-0.05114723, -1.041225, -4.369077, 0, 1, 0.9176471, 1,
-0.05096683, 0.6866168, -0.2159579, 0, 1, 0.9215686, 1,
-0.04998963, -1.512914, -3.476118, 0, 1, 0.9294118, 1,
-0.0492021, -1.014264, -4.490179, 0, 1, 0.9333333, 1,
-0.04890119, 1.140859, -0.3812613, 0, 1, 0.9411765, 1,
-0.04656978, -0.00325002, -1.352667, 0, 1, 0.945098, 1,
-0.04652612, 0.1096326, -0.1713413, 0, 1, 0.9529412, 1,
-0.04645158, 0.5757868, -0.6172867, 0, 1, 0.9568627, 1,
-0.04422215, -0.03785024, -3.246728, 0, 1, 0.9647059, 1,
-0.03974424, -0.4020848, -2.903159, 0, 1, 0.9686275, 1,
-0.03420604, 0.4881067, -1.114787, 0, 1, 0.9764706, 1,
-0.03258092, 1.05617, -1.666986, 0, 1, 0.9803922, 1,
-0.03030149, -0.7139941, -2.633649, 0, 1, 0.9882353, 1,
-0.02710586, -1.051321, -2.551653, 0, 1, 0.9921569, 1,
-0.02683366, -1.88925, -3.995243, 0, 1, 1, 1,
-0.02652791, 0.2074312, -0.6441546, 0, 0.9921569, 1, 1,
-0.02151019, -0.2343147, -3.398231, 0, 0.9882353, 1, 1,
-0.01925814, -0.6916287, -4.24389, 0, 0.9803922, 1, 1,
-0.0179163, -1.417965, -3.21068, 0, 0.9764706, 1, 1,
-0.01753652, 0.8087883, 0.9947799, 0, 0.9686275, 1, 1,
-0.01445474, -1.643546, -3.670157, 0, 0.9647059, 1, 1,
-0.01420808, 0.9315723, 0.05066079, 0, 0.9568627, 1, 1,
-0.0125405, -1.245215, -4.576088, 0, 0.9529412, 1, 1,
-0.008886253, -0.9735284, -2.917902, 0, 0.945098, 1, 1,
-0.008087558, 0.9399876, 0.4136091, 0, 0.9411765, 1, 1,
-0.007696193, -0.4148066, -2.801143, 0, 0.9333333, 1, 1,
-0.007621389, -0.3182133, -3.109669, 0, 0.9294118, 1, 1,
-0.001402641, 0.424393, -0.6995569, 0, 0.9215686, 1, 1,
-0.001339914, 1.856521, 0.6819959, 0, 0.9176471, 1, 1,
-0.001234001, -1.616352, -2.497754, 0, 0.9098039, 1, 1,
-0.001186217, -0.3276995, -2.663108, 0, 0.9058824, 1, 1,
0.003802577, 0.5008035, 1.775728, 0, 0.8980392, 1, 1,
0.004556602, 0.4673041, -0.1041133, 0, 0.8901961, 1, 1,
0.005770818, -1.415851, 3.447701, 0, 0.8862745, 1, 1,
0.01111627, 0.9215365, 0.8539439, 0, 0.8784314, 1, 1,
0.0118129, 0.555154, 0.5407421, 0, 0.8745098, 1, 1,
0.01653571, -0.3608622, 3.921395, 0, 0.8666667, 1, 1,
0.01708236, -0.1020348, 2.529402, 0, 0.8627451, 1, 1,
0.02417159, -0.0006288585, 1.285468, 0, 0.854902, 1, 1,
0.02490666, -0.05590499, 3.66438, 0, 0.8509804, 1, 1,
0.02657508, -0.1192512, 3.750032, 0, 0.8431373, 1, 1,
0.02777021, -0.9240475, 0.4067871, 0, 0.8392157, 1, 1,
0.03264084, -0.3851138, 1.714125, 0, 0.8313726, 1, 1,
0.03333791, 0.06664441, 0.9637722, 0, 0.827451, 1, 1,
0.0343847, 0.9084811, -1.159299, 0, 0.8196079, 1, 1,
0.03518823, 0.6645164, 2.0396, 0, 0.8156863, 1, 1,
0.03793937, -0.5618294, 3.613962, 0, 0.8078431, 1, 1,
0.03895649, -0.2972101, 4.046018, 0, 0.8039216, 1, 1,
0.04563682, 0.1476713, 1.732751, 0, 0.7960784, 1, 1,
0.04631222, 0.4277134, 1.629009, 0, 0.7882353, 1, 1,
0.04665877, -0.3520859, 3.01488, 0, 0.7843137, 1, 1,
0.0508196, 0.9313977, -0.3421462, 0, 0.7764706, 1, 1,
0.05239625, 1.271433, -0.7447587, 0, 0.772549, 1, 1,
0.05330395, -1.029579, 3.925944, 0, 0.7647059, 1, 1,
0.05914249, -0.5243872, 1.231459, 0, 0.7607843, 1, 1,
0.060278, 0.3161992, -0.8110536, 0, 0.7529412, 1, 1,
0.06032844, 0.08184348, -0.04774373, 0, 0.7490196, 1, 1,
0.06517687, -0.3071702, 0.7895374, 0, 0.7411765, 1, 1,
0.06595992, 0.4185045, 0.8300546, 0, 0.7372549, 1, 1,
0.07362711, 0.2214702, 0.3993346, 0, 0.7294118, 1, 1,
0.07772506, -0.5661506, 3.459291, 0, 0.7254902, 1, 1,
0.07874274, -0.2719298, 3.10518, 0, 0.7176471, 1, 1,
0.07917384, 0.8446383, 0.08318415, 0, 0.7137255, 1, 1,
0.07941989, 0.4358607, 0.5835992, 0, 0.7058824, 1, 1,
0.07983778, 1.475127, -0.253901, 0, 0.6980392, 1, 1,
0.08179007, 0.09301783, 0.6213195, 0, 0.6941177, 1, 1,
0.08422529, 1.391318, 0.3723749, 0, 0.6862745, 1, 1,
0.08438587, -0.4230652, 4.276198, 0, 0.682353, 1, 1,
0.08472803, 0.3171728, 1.008855, 0, 0.6745098, 1, 1,
0.08524717, -0.1152886, 1.986353, 0, 0.6705883, 1, 1,
0.08635588, 0.9134734, -0.9709622, 0, 0.6627451, 1, 1,
0.08842972, -0.8005789, 3.864473, 0, 0.6588235, 1, 1,
0.08864132, 1.556846, -0.542427, 0, 0.6509804, 1, 1,
0.09732582, -0.4313427, 1.857528, 0, 0.6470588, 1, 1,
0.1063825, -0.1148316, 1.832205, 0, 0.6392157, 1, 1,
0.1084104, -0.001133955, 2.549054, 0, 0.6352941, 1, 1,
0.1117528, -1.162116, 2.621781, 0, 0.627451, 1, 1,
0.1127209, 0.5634131, 0.8388394, 0, 0.6235294, 1, 1,
0.1174198, -0.9948644, 0.8545909, 0, 0.6156863, 1, 1,
0.1213643, 1.371979, -0.3753166, 0, 0.6117647, 1, 1,
0.1217868, -2.124858, 2.336177, 0, 0.6039216, 1, 1,
0.1240441, -0.8130377, 2.521894, 0, 0.5960785, 1, 1,
0.1245069, -2.684429, 3.072732, 0, 0.5921569, 1, 1,
0.1271425, 0.3820376, 0.8681308, 0, 0.5843138, 1, 1,
0.1276325, -0.7473133, 2.81655, 0, 0.5803922, 1, 1,
0.1339603, -0.8583378, 2.753033, 0, 0.572549, 1, 1,
0.1373866, 0.1323561, 1.595746, 0, 0.5686275, 1, 1,
0.1376687, -0.6378888, 3.928849, 0, 0.5607843, 1, 1,
0.1430764, 0.9231271, 0.6736613, 0, 0.5568628, 1, 1,
0.1437926, 0.9875081, -1.121303, 0, 0.5490196, 1, 1,
0.144993, 0.7972935, -0.7021421, 0, 0.5450981, 1, 1,
0.1598778, -0.3955653, 2.745462, 0, 0.5372549, 1, 1,
0.1615577, -0.5335968, 2.586145, 0, 0.5333334, 1, 1,
0.1615748, 1.347278, 0.9439015, 0, 0.5254902, 1, 1,
0.1623667, 1.061632, -0.6440063, 0, 0.5215687, 1, 1,
0.1648643, -0.8751656, 3.743331, 0, 0.5137255, 1, 1,
0.1725691, -0.3909834, 1.194891, 0, 0.509804, 1, 1,
0.1790474, -0.4326295, 1.202359, 0, 0.5019608, 1, 1,
0.1793281, -1.741731, 2.376492, 0, 0.4941176, 1, 1,
0.1803261, -0.715584, 2.974667, 0, 0.4901961, 1, 1,
0.1808771, 0.5891261, -1.134094, 0, 0.4823529, 1, 1,
0.1821486, -0.670334, 2.578233, 0, 0.4784314, 1, 1,
0.1867146, -1.078995, 1.996546, 0, 0.4705882, 1, 1,
0.193044, -2.042502, 4.224889, 0, 0.4666667, 1, 1,
0.1972166, 0.284289, -0.5542896, 0, 0.4588235, 1, 1,
0.1994376, -0.5374033, 3.718467, 0, 0.454902, 1, 1,
0.2029829, -1.279028, 3.029487, 0, 0.4470588, 1, 1,
0.2041171, -0.7304035, 4.901841, 0, 0.4431373, 1, 1,
0.2058597, 0.4436066, 1.621211, 0, 0.4352941, 1, 1,
0.2072042, -0.5536597, 2.449482, 0, 0.4313726, 1, 1,
0.215932, -0.3757936, 2.692959, 0, 0.4235294, 1, 1,
0.2201573, -0.06827652, 2.558023, 0, 0.4196078, 1, 1,
0.2206095, 1.208165, -0.7884436, 0, 0.4117647, 1, 1,
0.2225736, -1.276906, 1.310066, 0, 0.4078431, 1, 1,
0.2258046, -0.5373511, 3.548794, 0, 0.4, 1, 1,
0.2309872, -1.468986, 2.662309, 0, 0.3921569, 1, 1,
0.2312204, 1.938385, 0.346858, 0, 0.3882353, 1, 1,
0.2354414, 0.1805913, -0.944623, 0, 0.3803922, 1, 1,
0.2377289, -0.03940343, 1.174694, 0, 0.3764706, 1, 1,
0.2381988, -0.8888894, 2.199428, 0, 0.3686275, 1, 1,
0.2409561, -1.155183, 3.26121, 0, 0.3647059, 1, 1,
0.2415976, 0.5825041, -0.4139303, 0, 0.3568628, 1, 1,
0.2473909, -0.6449235, 1.953066, 0, 0.3529412, 1, 1,
0.248462, 1.126963, 0.1709099, 0, 0.345098, 1, 1,
0.254073, -0.5487565, 3.155178, 0, 0.3411765, 1, 1,
0.2611876, -0.1032963, 0.5793654, 0, 0.3333333, 1, 1,
0.2664803, -0.6109955, 2.486112, 0, 0.3294118, 1, 1,
0.2705269, 0.7562842, -0.5527819, 0, 0.3215686, 1, 1,
0.2713459, -0.5613334, 3.405694, 0, 0.3176471, 1, 1,
0.2713539, -0.1315823, 1.111758, 0, 0.3098039, 1, 1,
0.2745048, -0.05201127, 2.602802, 0, 0.3058824, 1, 1,
0.2828938, 0.8186172, 2.645262, 0, 0.2980392, 1, 1,
0.2842184, 0.3257994, -1.83814, 0, 0.2901961, 1, 1,
0.2856669, -1.573081, 4.020682, 0, 0.2862745, 1, 1,
0.2902564, 3.005406, 1.587125, 0, 0.2784314, 1, 1,
0.2905545, -1.161198, 2.550176, 0, 0.2745098, 1, 1,
0.2926714, -0.3784784, 1.423359, 0, 0.2666667, 1, 1,
0.2934104, -0.8351907, 3.18821, 0, 0.2627451, 1, 1,
0.2941609, -2.006558, 3.751382, 0, 0.254902, 1, 1,
0.300234, -0.06204991, 0.7575744, 0, 0.2509804, 1, 1,
0.3072225, -0.4638149, 2.101515, 0, 0.2431373, 1, 1,
0.3122219, 1.941558, -1.065019, 0, 0.2392157, 1, 1,
0.313626, 1.206864, -0.3186258, 0, 0.2313726, 1, 1,
0.3196202, 1.379592, -0.4848217, 0, 0.227451, 1, 1,
0.3197893, -0.8458073, 2.047744, 0, 0.2196078, 1, 1,
0.3204899, -0.3696595, 2.082857, 0, 0.2156863, 1, 1,
0.3276168, -1.271932, 2.623056, 0, 0.2078431, 1, 1,
0.3323845, 2.072847, 0.8256072, 0, 0.2039216, 1, 1,
0.3330517, 1.109232, 1.468884, 0, 0.1960784, 1, 1,
0.3336762, 2.156604, -0.2986968, 0, 0.1882353, 1, 1,
0.3348942, 0.4062099, 1.299843, 0, 0.1843137, 1, 1,
0.3368878, 0.9189097, -1.331758, 0, 0.1764706, 1, 1,
0.3391954, -0.9944201, 2.988462, 0, 0.172549, 1, 1,
0.3396021, 0.7875126, 1.662921, 0, 0.1647059, 1, 1,
0.3408179, -0.1728918, 3.251563, 0, 0.1607843, 1, 1,
0.3444091, -0.3911788, 1.444552, 0, 0.1529412, 1, 1,
0.3445792, 0.3273472, -0.2872034, 0, 0.1490196, 1, 1,
0.3446592, 0.3348763, 2.739367, 0, 0.1411765, 1, 1,
0.3454164, -1.284098, 2.387187, 0, 0.1372549, 1, 1,
0.3455395, 0.3283136, 0.7540384, 0, 0.1294118, 1, 1,
0.3501312, 1.351323, 0.7740515, 0, 0.1254902, 1, 1,
0.3505457, 0.5998857, 0.2998009, 0, 0.1176471, 1, 1,
0.3524998, -2.022842, 2.19647, 0, 0.1137255, 1, 1,
0.3539676, 0.03691574, -0.2920015, 0, 0.1058824, 1, 1,
0.3570194, 0.8635592, -0.001886418, 0, 0.09803922, 1, 1,
0.3587381, -0.007303975, 1.537112, 0, 0.09411765, 1, 1,
0.3591704, 0.3346271, 0.545766, 0, 0.08627451, 1, 1,
0.3593532, 0.5476348, 0.567201, 0, 0.08235294, 1, 1,
0.3623885, 2.27894, -1.245198, 0, 0.07450981, 1, 1,
0.362499, -0.3135321, 1.915907, 0, 0.07058824, 1, 1,
0.3632712, -0.09916802, 1.381744, 0, 0.0627451, 1, 1,
0.3675012, -0.4936188, 2.572071, 0, 0.05882353, 1, 1,
0.3728644, 0.7230773, 0.1818535, 0, 0.05098039, 1, 1,
0.3765558, 1.485546, 0.6229177, 0, 0.04705882, 1, 1,
0.3847606, 0.2484407, 0.9864101, 0, 0.03921569, 1, 1,
0.3852429, -0.01174039, 2.716529, 0, 0.03529412, 1, 1,
0.387158, -1.638447, 2.375994, 0, 0.02745098, 1, 1,
0.3911903, 0.6611747, -0.5204583, 0, 0.02352941, 1, 1,
0.3934688, -0.3520989, 2.305536, 0, 0.01568628, 1, 1,
0.3948053, -0.7701198, 3.797676, 0, 0.01176471, 1, 1,
0.394813, 0.5348412, 1.043023, 0, 0.003921569, 1, 1,
0.398312, -1.097726, 2.738064, 0.003921569, 0, 1, 1,
0.4038881, 0.7519466, 0.2577735, 0.007843138, 0, 1, 1,
0.4094872, 1.341908, 1.468213, 0.01568628, 0, 1, 1,
0.4103505, -0.1911881, 2.300801, 0.01960784, 0, 1, 1,
0.411635, 0.3863567, 0.1933936, 0.02745098, 0, 1, 1,
0.4179659, 0.3008671, 2.281032, 0.03137255, 0, 1, 1,
0.4201515, -0.3627448, 2.7882, 0.03921569, 0, 1, 1,
0.4216716, -0.07973545, -0.05449345, 0.04313726, 0, 1, 1,
0.4266278, 0.8177292, -0.08089847, 0.05098039, 0, 1, 1,
0.4293875, 1.076935, 0.9287597, 0.05490196, 0, 1, 1,
0.4317601, 2.187277, 0.8950302, 0.0627451, 0, 1, 1,
0.4373678, -1.022858, 4.505508, 0.06666667, 0, 1, 1,
0.4391807, 1.041311, 1.493453, 0.07450981, 0, 1, 1,
0.4399172, 0.09115522, 0.5006372, 0.07843138, 0, 1, 1,
0.4409913, -0.03408458, 1.540854, 0.08627451, 0, 1, 1,
0.4452474, 1.481143, -0.4520908, 0.09019608, 0, 1, 1,
0.4498266, -0.005844652, 0.73857, 0.09803922, 0, 1, 1,
0.4498546, -0.5505334, 1.760774, 0.1058824, 0, 1, 1,
0.4574548, 0.2328776, 1.660954, 0.1098039, 0, 1, 1,
0.4612714, 0.8243885, 0.02771525, 0.1176471, 0, 1, 1,
0.4618461, -0.04794566, 1.574579, 0.1215686, 0, 1, 1,
0.4659911, 0.5411472, 1.529824, 0.1294118, 0, 1, 1,
0.4677434, -1.405357, 3.221143, 0.1333333, 0, 1, 1,
0.4691484, -1.106828, 2.952288, 0.1411765, 0, 1, 1,
0.4691559, -0.03073328, -0.8628435, 0.145098, 0, 1, 1,
0.4695965, 0.4979093, 0.8282154, 0.1529412, 0, 1, 1,
0.470331, -0.2299238, 2.123622, 0.1568628, 0, 1, 1,
0.4726589, -0.4435056, 2.455901, 0.1647059, 0, 1, 1,
0.4733244, -0.1104634, 1.912794, 0.1686275, 0, 1, 1,
0.4755453, 0.3495769, 0.9177323, 0.1764706, 0, 1, 1,
0.4757368, -1.82996, 2.597795, 0.1803922, 0, 1, 1,
0.4759781, -1.447061, 3.200881, 0.1882353, 0, 1, 1,
0.4816446, 1.411882, 0.6300258, 0.1921569, 0, 1, 1,
0.4824416, -0.4001114, 2.12133, 0.2, 0, 1, 1,
0.4832044, 1.478428, -1.558667, 0.2078431, 0, 1, 1,
0.4832961, 0.1424074, 2.562066, 0.2117647, 0, 1, 1,
0.4835972, 1.491311, 1.291008, 0.2196078, 0, 1, 1,
0.4863169, 0.1788873, 0.5461341, 0.2235294, 0, 1, 1,
0.4896466, 0.0699565, 2.083134, 0.2313726, 0, 1, 1,
0.4899453, 0.2124086, 1.634753, 0.2352941, 0, 1, 1,
0.494358, 1.078545, 0.7144818, 0.2431373, 0, 1, 1,
0.4961886, -0.6900165, -0.5773601, 0.2470588, 0, 1, 1,
0.4975971, -0.5767509, 2.604326, 0.254902, 0, 1, 1,
0.497822, -1.525272, 2.44918, 0.2588235, 0, 1, 1,
0.4984936, 1.210161, 0.7234795, 0.2666667, 0, 1, 1,
0.498953, 0.5097578, 2.282231, 0.2705882, 0, 1, 1,
0.499438, -0.2830549, 2.433838, 0.2784314, 0, 1, 1,
0.5003076, 0.04329431, 0.9417045, 0.282353, 0, 1, 1,
0.5004261, -0.2670067, 2.89779, 0.2901961, 0, 1, 1,
0.5028822, 0.1140667, -0.4662815, 0.2941177, 0, 1, 1,
0.5082738, -1.357531, 3.004476, 0.3019608, 0, 1, 1,
0.5113884, -1.253481, 1.966374, 0.3098039, 0, 1, 1,
0.5122717, -0.08260331, 2.003913, 0.3137255, 0, 1, 1,
0.5136259, -1.513629, 1.768071, 0.3215686, 0, 1, 1,
0.5166426, 0.5883641, -0.2346865, 0.3254902, 0, 1, 1,
0.5168183, 1.361093, 0.4865915, 0.3333333, 0, 1, 1,
0.5172407, -0.3586234, 0.8643309, 0.3372549, 0, 1, 1,
0.52266, -0.02784307, 0.9243683, 0.345098, 0, 1, 1,
0.5296352, -0.01132674, 2.930374, 0.3490196, 0, 1, 1,
0.5303463, -0.8658591, 3.80186, 0.3568628, 0, 1, 1,
0.5315859, 2.821081, 1.527223, 0.3607843, 0, 1, 1,
0.532021, -0.7874442, 3.664855, 0.3686275, 0, 1, 1,
0.5411126, -1.127875, 0.7944449, 0.372549, 0, 1, 1,
0.5503907, 0.350808, 0.6324838, 0.3803922, 0, 1, 1,
0.5510513, -0.34751, 1.27558, 0.3843137, 0, 1, 1,
0.5602496, 1.720466, 0.1087557, 0.3921569, 0, 1, 1,
0.5603983, 0.6038545, 1.517895, 0.3960784, 0, 1, 1,
0.5615515, -0.4686733, 2.292699, 0.4039216, 0, 1, 1,
0.5639328, -0.389632, 1.144381, 0.4117647, 0, 1, 1,
0.5646525, 0.24735, 1.258736, 0.4156863, 0, 1, 1,
0.564852, -0.2361708, 2.0964, 0.4235294, 0, 1, 1,
0.567621, 0.132731, 1.215352, 0.427451, 0, 1, 1,
0.5682425, 0.1850627, 1.207084, 0.4352941, 0, 1, 1,
0.5801261, 0.7736804, 0.5351186, 0.4392157, 0, 1, 1,
0.5827217, -0.9767975, 2.332515, 0.4470588, 0, 1, 1,
0.5841406, -0.6663918, 1.951313, 0.4509804, 0, 1, 1,
0.5912573, 1.39323, 0.4207344, 0.4588235, 0, 1, 1,
0.5921711, 0.3238129, -0.9517612, 0.4627451, 0, 1, 1,
0.5927168, 0.4429398, -0.9173016, 0.4705882, 0, 1, 1,
0.5938431, 0.7381471, 0.08023518, 0.4745098, 0, 1, 1,
0.5953658, -1.589688, 1.643296, 0.4823529, 0, 1, 1,
0.5977293, 0.8139154, -0.1264002, 0.4862745, 0, 1, 1,
0.5989531, 1.445492, 1.946925, 0.4941176, 0, 1, 1,
0.6027622, -0.1584235, 1.085966, 0.5019608, 0, 1, 1,
0.606732, 0.2530697, 2.052873, 0.5058824, 0, 1, 1,
0.6100218, 1.358449, -0.01387319, 0.5137255, 0, 1, 1,
0.6157097, -0.03327126, 0.7690822, 0.5176471, 0, 1, 1,
0.6159183, -1.031509, 3.319235, 0.5254902, 0, 1, 1,
0.6245845, -1.37267, 1.534965, 0.5294118, 0, 1, 1,
0.6305997, -0.03979088, 1.06036, 0.5372549, 0, 1, 1,
0.6329791, -0.2515104, 1.575168, 0.5411765, 0, 1, 1,
0.6350217, -0.4235946, 2.430734, 0.5490196, 0, 1, 1,
0.6374637, 0.1344934, 0.1153103, 0.5529412, 0, 1, 1,
0.6411965, -1.281975, 3.211061, 0.5607843, 0, 1, 1,
0.6448717, -0.9891366, 4.325947, 0.5647059, 0, 1, 1,
0.6520516, 0.65061, 0.9276407, 0.572549, 0, 1, 1,
0.654884, -0.5640904, 2.28156, 0.5764706, 0, 1, 1,
0.6550497, -0.5980834, 2.30579, 0.5843138, 0, 1, 1,
0.6559452, 1.003708, 1.187793, 0.5882353, 0, 1, 1,
0.6572027, 0.8464035, 2.669183, 0.5960785, 0, 1, 1,
0.6658431, -1.316538, 2.879777, 0.6039216, 0, 1, 1,
0.66948, 1.209477, -0.7688108, 0.6078432, 0, 1, 1,
0.6701347, 1.114703, 0.3857963, 0.6156863, 0, 1, 1,
0.6709544, 1.783786, 0.2688361, 0.6196079, 0, 1, 1,
0.6715375, -0.2867314, 2.885531, 0.627451, 0, 1, 1,
0.6719826, -1.176855, 3.163478, 0.6313726, 0, 1, 1,
0.6724541, 0.9633337, 2.150752, 0.6392157, 0, 1, 1,
0.6752358, 0.3708153, 2.773205, 0.6431373, 0, 1, 1,
0.6775286, 0.455126, 1.966692, 0.6509804, 0, 1, 1,
0.6806186, 0.9066644, -0.1142704, 0.654902, 0, 1, 1,
0.6827751, -1.001457, 2.368763, 0.6627451, 0, 1, 1,
0.6943721, -0.4884542, 1.008701, 0.6666667, 0, 1, 1,
0.6961147, 1.519694, 0.4170657, 0.6745098, 0, 1, 1,
0.6976618, -0.1256168, 1.742349, 0.6784314, 0, 1, 1,
0.6984244, 2.112728, -0.8470968, 0.6862745, 0, 1, 1,
0.7010688, 0.625372, 1.734087, 0.6901961, 0, 1, 1,
0.7024415, 1.173922, -1.036605, 0.6980392, 0, 1, 1,
0.709595, -0.00375942, 1.268653, 0.7058824, 0, 1, 1,
0.7151369, 0.3568218, 2.112035, 0.7098039, 0, 1, 1,
0.719339, -1.081099, 2.707227, 0.7176471, 0, 1, 1,
0.723503, -0.07170089, 1.853988, 0.7215686, 0, 1, 1,
0.7243733, -1.228326, 2.335914, 0.7294118, 0, 1, 1,
0.7258151, -0.4948793, 2.00155, 0.7333333, 0, 1, 1,
0.7279606, 0.7665551, 0.9548938, 0.7411765, 0, 1, 1,
0.7291951, 0.237963, 0.1113639, 0.7450981, 0, 1, 1,
0.7316105, -1.246868, 3.307002, 0.7529412, 0, 1, 1,
0.7340298, 0.5421827, 1.409178, 0.7568628, 0, 1, 1,
0.7492414, 0.9271901, 1.178733, 0.7647059, 0, 1, 1,
0.7530647, 0.07436828, 0.7539822, 0.7686275, 0, 1, 1,
0.754249, 0.1036619, 0.02035445, 0.7764706, 0, 1, 1,
0.76296, 0.5530473, 1.405782, 0.7803922, 0, 1, 1,
0.7738035, -0.3035195, 3.960882, 0.7882353, 0, 1, 1,
0.7741603, 0.7905434, 0.2141233, 0.7921569, 0, 1, 1,
0.7751289, -1.556388, 2.185579, 0.8, 0, 1, 1,
0.7841096, -0.05439993, -0.1911189, 0.8078431, 0, 1, 1,
0.7893887, 0.7942656, -0.03302538, 0.8117647, 0, 1, 1,
0.7895509, -0.3737833, 3.158241, 0.8196079, 0, 1, 1,
0.7929618, -0.2917126, 1.98604, 0.8235294, 0, 1, 1,
0.800477, 0.06673434, 0.07341273, 0.8313726, 0, 1, 1,
0.802808, -1.291502, 3.455176, 0.8352941, 0, 1, 1,
0.8049074, 0.8778527, -0.6797636, 0.8431373, 0, 1, 1,
0.8073438, 1.083667, 0.03866617, 0.8470588, 0, 1, 1,
0.8158097, 0.382609, 1.589505, 0.854902, 0, 1, 1,
0.8176985, 1.04645, 0.650929, 0.8588235, 0, 1, 1,
0.8331262, 1.574854, 1.066492, 0.8666667, 0, 1, 1,
0.8442958, 0.4894855, 0.7582844, 0.8705882, 0, 1, 1,
0.8448999, -0.384123, 2.564241, 0.8784314, 0, 1, 1,
0.8488778, 0.7316328, 1.418224, 0.8823529, 0, 1, 1,
0.8509591, 0.2745723, 0.8886769, 0.8901961, 0, 1, 1,
0.8509897, 0.1486079, 0.09090251, 0.8941177, 0, 1, 1,
0.8519234, -0.6859627, 3.254106, 0.9019608, 0, 1, 1,
0.8549959, 0.2290335, 1.19831, 0.9098039, 0, 1, 1,
0.8553184, 0.308334, -0.05348583, 0.9137255, 0, 1, 1,
0.8634539, 0.9284368, 1.08402, 0.9215686, 0, 1, 1,
0.8673425, 1.306989, 3.236887, 0.9254902, 0, 1, 1,
0.8711116, -1.460565, 3.26721, 0.9333333, 0, 1, 1,
0.8727136, -0.2510082, 0.3382117, 0.9372549, 0, 1, 1,
0.8785542, 3.939824, 0.768293, 0.945098, 0, 1, 1,
0.8830479, -0.3384858, 3.31278, 0.9490196, 0, 1, 1,
0.8863825, -0.4599306, 2.174155, 0.9568627, 0, 1, 1,
0.8904377, -0.9713225, 2.753796, 0.9607843, 0, 1, 1,
0.8972884, -1.369986, 1.717356, 0.9686275, 0, 1, 1,
0.901035, 0.03631808, 1.475399, 0.972549, 0, 1, 1,
0.9018711, -1.109926, 2.723524, 0.9803922, 0, 1, 1,
0.9094331, -0.7797335, 1.813609, 0.9843137, 0, 1, 1,
0.9122817, 0.2194664, 3.987965, 0.9921569, 0, 1, 1,
0.9152496, -0.549246, 1.721789, 0.9960784, 0, 1, 1,
0.9199697, -0.05792864, 0.9634363, 1, 0, 0.9960784, 1,
0.9200784, 0.5333807, 1.733259, 1, 0, 0.9882353, 1,
0.9201165, -0.2226975, 2.035817, 1, 0, 0.9843137, 1,
0.9289032, 1.352069, 1.742946, 1, 0, 0.9764706, 1,
0.9311808, -0.8878628, 1.959405, 1, 0, 0.972549, 1,
0.9341455, 0.3715304, 1.878392, 1, 0, 0.9647059, 1,
0.9381459, -0.8235614, 2.32823, 1, 0, 0.9607843, 1,
0.943485, 0.554589, 1.902893, 1, 0, 0.9529412, 1,
0.9539312, 0.2918782, 0.7488468, 1, 0, 0.9490196, 1,
0.9571273, 0.1569827, 1.296791, 1, 0, 0.9411765, 1,
0.9636083, -0.5756035, 0.5916877, 1, 0, 0.9372549, 1,
0.9658579, 1.093424, 0.1514487, 1, 0, 0.9294118, 1,
0.9658692, -0.02001261, 1.535264, 1, 0, 0.9254902, 1,
0.9730307, 0.5939996, 0.8310434, 1, 0, 0.9176471, 1,
0.9740899, 0.04577607, 0.8953794, 1, 0, 0.9137255, 1,
0.9781969, -0.6194183, 1.702782, 1, 0, 0.9058824, 1,
0.9933997, 0.8058801, 0.6898701, 1, 0, 0.9019608, 1,
1.000201, 0.5429022, 0.4483651, 1, 0, 0.8941177, 1,
1.002681, -0.2130623, 1.931045, 1, 0, 0.8862745, 1,
1.004554, -1.502523, 2.863555, 1, 0, 0.8823529, 1,
1.006141, 2.827984, 1.319132, 1, 0, 0.8745098, 1,
1.009411, 0.4353454, 1.122974, 1, 0, 0.8705882, 1,
1.019114, -1.394036, 2.530687, 1, 0, 0.8627451, 1,
1.021879, 0.06146298, -0.03869959, 1, 0, 0.8588235, 1,
1.029057, 1.520742, 0.426847, 1, 0, 0.8509804, 1,
1.0315, 0.1414463, 1.844713, 1, 0, 0.8470588, 1,
1.042263, -1.227573, 2.328092, 1, 0, 0.8392157, 1,
1.045875, 0.06562369, 1.351651, 1, 0, 0.8352941, 1,
1.050595, 0.08070093, 2.62858, 1, 0, 0.827451, 1,
1.050841, -0.584713, 2.306527, 1, 0, 0.8235294, 1,
1.056748, 0.03712729, 2.067165, 1, 0, 0.8156863, 1,
1.066728, -1.086884, 1.747727, 1, 0, 0.8117647, 1,
1.070882, -0.0855261, 1.833677, 1, 0, 0.8039216, 1,
1.076729, 0.2021037, 0.03839897, 1, 0, 0.7960784, 1,
1.077172, 0.6474724, 0.6764166, 1, 0, 0.7921569, 1,
1.077945, 1.571925, 0.2293202, 1, 0, 0.7843137, 1,
1.078279, 0.4433155, 1.568784, 1, 0, 0.7803922, 1,
1.079618, 1.434697, -0.610051, 1, 0, 0.772549, 1,
1.084697, -0.8515615, 2.114252, 1, 0, 0.7686275, 1,
1.087291, 0.4702982, 2.260567, 1, 0, 0.7607843, 1,
1.088414, -1.498138, 1.274475, 1, 0, 0.7568628, 1,
1.096621, 0.04712114, 0.2503971, 1, 0, 0.7490196, 1,
1.10272, 0.2454408, 1.548943, 1, 0, 0.7450981, 1,
1.103523, 0.9686161, 0.768253, 1, 0, 0.7372549, 1,
1.107228, 1.610357, 1.054535, 1, 0, 0.7333333, 1,
1.110977, -2.162812, 2.355744, 1, 0, 0.7254902, 1,
1.115721, 1.285275, 2.094655, 1, 0, 0.7215686, 1,
1.11783, -0.8959103, 3.740403, 1, 0, 0.7137255, 1,
1.123069, 0.4422991, 0.9469528, 1, 0, 0.7098039, 1,
1.125905, 0.3875856, -1.368026, 1, 0, 0.7019608, 1,
1.127288, -0.4542072, 1.57739, 1, 0, 0.6941177, 1,
1.129288, -0.748363, 2.256791, 1, 0, 0.6901961, 1,
1.133207, 0.8546155, 1.889801, 1, 0, 0.682353, 1,
1.15229, -0.3618896, 1.001115, 1, 0, 0.6784314, 1,
1.156424, 0.6056302, 0.9744838, 1, 0, 0.6705883, 1,
1.158388, 2.097055, 0.1746774, 1, 0, 0.6666667, 1,
1.166348, 0.5884982, -0.02749116, 1, 0, 0.6588235, 1,
1.167206, -2.486732, 2.148383, 1, 0, 0.654902, 1,
1.167252, 1.109876, 1.464877, 1, 0, 0.6470588, 1,
1.168161, 1.51047, -0.3269519, 1, 0, 0.6431373, 1,
1.170072, -0.5545284, 2.566539, 1, 0, 0.6352941, 1,
1.172605, -0.8556185, 1.802436, 1, 0, 0.6313726, 1,
1.17825, 1.201777, 1.55139, 1, 0, 0.6235294, 1,
1.199475, 0.1779194, 2.030084, 1, 0, 0.6196079, 1,
1.206181, -0.1250258, 1.924136, 1, 0, 0.6117647, 1,
1.214666, 1.571557, 1.499046, 1, 0, 0.6078432, 1,
1.215201, -0.1494796, 3.417889, 1, 0, 0.6, 1,
1.219011, -0.09129215, 1.410119, 1, 0, 0.5921569, 1,
1.220473, 0.1425842, 1.073405, 1, 0, 0.5882353, 1,
1.222796, 0.1755515, 1.725156, 1, 0, 0.5803922, 1,
1.235901, 1.520096, -0.4608748, 1, 0, 0.5764706, 1,
1.236192, -0.8825366, 2.536315, 1, 0, 0.5686275, 1,
1.246619, 0.6404897, 2.388298, 1, 0, 0.5647059, 1,
1.248011, 1.505261, -0.2665982, 1, 0, 0.5568628, 1,
1.253521, -0.1303965, 1.818716, 1, 0, 0.5529412, 1,
1.255576, -1.88529, 3.317888, 1, 0, 0.5450981, 1,
1.255747, -0.8573642, 2.313754, 1, 0, 0.5411765, 1,
1.261964, 0.2709725, 0.1252084, 1, 0, 0.5333334, 1,
1.262446, 0.6803566, 0.2818011, 1, 0, 0.5294118, 1,
1.275644, -0.6806089, 2.063828, 1, 0, 0.5215687, 1,
1.277331, 0.3625739, 0.2922131, 1, 0, 0.5176471, 1,
1.286412, 0.2691844, 0.4381498, 1, 0, 0.509804, 1,
1.286847, -1.043886, 1.881856, 1, 0, 0.5058824, 1,
1.298441, 1.277334, 0.06352375, 1, 0, 0.4980392, 1,
1.305339, 1.676584, -0.03301328, 1, 0, 0.4901961, 1,
1.316765, 0.2949687, 1.318747, 1, 0, 0.4862745, 1,
1.320144, 0.01024139, 1.886648, 1, 0, 0.4784314, 1,
1.322492, 2.101807, 0.2773035, 1, 0, 0.4745098, 1,
1.325794, -0.5328197, 2.949232, 1, 0, 0.4666667, 1,
1.329179, -0.3312204, 1.118275, 1, 0, 0.4627451, 1,
1.335332, 1.0844, 2.975204, 1, 0, 0.454902, 1,
1.353161, 1.523815, 0.9135999, 1, 0, 0.4509804, 1,
1.358224, 1.103854, -0.493987, 1, 0, 0.4431373, 1,
1.36412, -0.5547794, 2.80546, 1, 0, 0.4392157, 1,
1.367466, -1.083535, 0.6864835, 1, 0, 0.4313726, 1,
1.370457, 0.2159515, 0.5581123, 1, 0, 0.427451, 1,
1.379989, -0.5290241, 2.71681, 1, 0, 0.4196078, 1,
1.39263, -0.8502707, 2.609725, 1, 0, 0.4156863, 1,
1.408511, 0.4126526, 3.266847, 1, 0, 0.4078431, 1,
1.409496, 0.3592004, 1.334176, 1, 0, 0.4039216, 1,
1.420296, -1.134712, 3.966766, 1, 0, 0.3960784, 1,
1.427727, -0.6830522, 0.6751022, 1, 0, 0.3882353, 1,
1.430232, -0.3528904, 0.2902971, 1, 0, 0.3843137, 1,
1.439138, 0.3884321, 0.9209948, 1, 0, 0.3764706, 1,
1.452199, 0.0853893, 0.9804007, 1, 0, 0.372549, 1,
1.459403, -0.7323083, 2.179924, 1, 0, 0.3647059, 1,
1.462411, -0.1293756, 2.154866, 1, 0, 0.3607843, 1,
1.463625, -1.259636, 0.9074739, 1, 0, 0.3529412, 1,
1.47046, 2.823945, 0.3265312, 1, 0, 0.3490196, 1,
1.491663, 1.257622, 1.573098, 1, 0, 0.3411765, 1,
1.492092, -0.1592848, 3.410726, 1, 0, 0.3372549, 1,
1.504752, -0.09146076, 1.312519, 1, 0, 0.3294118, 1,
1.512203, 0.216244, 0.5775008, 1, 0, 0.3254902, 1,
1.516748, 0.1907523, 0.8709785, 1, 0, 0.3176471, 1,
1.530434, 0.4366928, 1.728572, 1, 0, 0.3137255, 1,
1.549981, 0.08208825, 0.8475198, 1, 0, 0.3058824, 1,
1.56524, -0.3376196, 1.34086, 1, 0, 0.2980392, 1,
1.566862, -0.86323, 3.462733, 1, 0, 0.2941177, 1,
1.570548, 0.773081, 0.173924, 1, 0, 0.2862745, 1,
1.573162, 0.8647376, 0.1504038, 1, 0, 0.282353, 1,
1.58415, 0.8337138, 0.6437631, 1, 0, 0.2745098, 1,
1.58658, 0.5294157, 3.309565, 1, 0, 0.2705882, 1,
1.603054, -1.68164, 2.958996, 1, 0, 0.2627451, 1,
1.631152, 0.7179352, 1.43716, 1, 0, 0.2588235, 1,
1.640074, 0.2291406, 2.149238, 1, 0, 0.2509804, 1,
1.64543, 1.741444, 1.69017, 1, 0, 0.2470588, 1,
1.656547, -0.4622933, 1.548606, 1, 0, 0.2392157, 1,
1.658854, -2.139372, 1.23574, 1, 0, 0.2352941, 1,
1.664699, 0.2317461, 0.8227499, 1, 0, 0.227451, 1,
1.673511, 1.63165, 1.757976, 1, 0, 0.2235294, 1,
1.674054, -0.2202756, 1.674739, 1, 0, 0.2156863, 1,
1.680283, 0.5208935, 0.5286531, 1, 0, 0.2117647, 1,
1.701929, 0.1242561, 1.772639, 1, 0, 0.2039216, 1,
1.703365, 0.2918739, 0.6005912, 1, 0, 0.1960784, 1,
1.715622, -1.035511, 1.342111, 1, 0, 0.1921569, 1,
1.716608, 0.4729474, 2.176164, 1, 0, 0.1843137, 1,
1.727375, 0.009205451, 0.7063498, 1, 0, 0.1803922, 1,
1.734927, 1.287234, -0.9356186, 1, 0, 0.172549, 1,
1.754996, -1.519648, 0.9382644, 1, 0, 0.1686275, 1,
1.758586, 0.0567622, 2.534734, 1, 0, 0.1607843, 1,
1.815916, 0.9569617, 1.62636, 1, 0, 0.1568628, 1,
1.829101, -0.7549938, 2.672703, 1, 0, 0.1490196, 1,
1.840374, 0.2885171, 1.497427, 1, 0, 0.145098, 1,
1.849221, 1.4072, -0.2366181, 1, 0, 0.1372549, 1,
1.879743, -1.277013, 2.139692, 1, 0, 0.1333333, 1,
1.90964, -0.03183959, 1.159552, 1, 0, 0.1254902, 1,
1.926587, 0.8197818, 2.592741, 1, 0, 0.1215686, 1,
1.940162, 0.8087196, 1.982024, 1, 0, 0.1137255, 1,
2.006586, -1.780267, 2.62559, 1, 0, 0.1098039, 1,
2.011578, 0.2954147, 1.489462, 1, 0, 0.1019608, 1,
2.101366, -2.950114, 2.55468, 1, 0, 0.09411765, 1,
2.120701, -0.430354, 0.3166074, 1, 0, 0.09019608, 1,
2.140444, 1.252462, 0.1283437, 1, 0, 0.08235294, 1,
2.237646, 0.3855485, 2.680259, 1, 0, 0.07843138, 1,
2.277568, -2.380398, 3.243124, 1, 0, 0.07058824, 1,
2.28342, -0.1668118, 1.936612, 1, 0, 0.06666667, 1,
2.290687, 0.9507557, 0.271033, 1, 0, 0.05882353, 1,
2.344817, -0.8486259, 2.708181, 1, 0, 0.05490196, 1,
2.355327, -0.7316917, 1.961044, 1, 0, 0.04705882, 1,
2.358433, 0.4414302, 0.01044673, 1, 0, 0.04313726, 1,
2.516491, 0.8249564, 2.651157, 1, 0, 0.03529412, 1,
2.619907, -0.7368006, 2.634615, 1, 0, 0.03137255, 1,
2.640663, 1.968839, 0.9593509, 1, 0, 0.02352941, 1,
2.786297, 1.211818, 1.36289, 1, 0, 0.01960784, 1,
2.816762, 0.4557644, 0.3155001, 1, 0, 0.01176471, 1,
2.993693, -0.5769368, 1.431229, 1, 0, 0.007843138, 1
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
0.06766891, -4.515159, -6.366875, 0, -0.5, 0.5, 0.5,
0.06766891, -4.515159, -6.366875, 1, -0.5, 0.5, 0.5,
0.06766891, -4.515159, -6.366875, 1, 1.5, 0.5, 0.5,
0.06766891, -4.515159, -6.366875, 0, 1.5, 0.5, 0.5
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
-3.850277, 0.3250387, -6.366875, 0, -0.5, 0.5, 0.5,
-3.850277, 0.3250387, -6.366875, 1, -0.5, 0.5, 0.5,
-3.850277, 0.3250387, -6.366875, 1, 1.5, 0.5, 0.5,
-3.850277, 0.3250387, -6.366875, 0, 1.5, 0.5, 0.5
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
-3.850277, -4.515159, 0.08409119, 0, -0.5, 0.5, 0.5,
-3.850277, -4.515159, 0.08409119, 1, -0.5, 0.5, 0.5,
-3.850277, -4.515159, 0.08409119, 1, 1.5, 0.5, 0.5,
-3.850277, -4.515159, 0.08409119, 0, 1.5, 0.5, 0.5
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
-2, -3.39819, -4.878191,
2, -3.39819, -4.878191,
-2, -3.39819, -4.878191,
-2, -3.584352, -5.126305,
-1, -3.39819, -4.878191,
-1, -3.584352, -5.126305,
0, -3.39819, -4.878191,
0, -3.584352, -5.126305,
1, -3.39819, -4.878191,
1, -3.584352, -5.126305,
2, -3.39819, -4.878191,
2, -3.584352, -5.126305
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
-2, -3.956675, -5.622533, 0, -0.5, 0.5, 0.5,
-2, -3.956675, -5.622533, 1, -0.5, 0.5, 0.5,
-2, -3.956675, -5.622533, 1, 1.5, 0.5, 0.5,
-2, -3.956675, -5.622533, 0, 1.5, 0.5, 0.5,
-1, -3.956675, -5.622533, 0, -0.5, 0.5, 0.5,
-1, -3.956675, -5.622533, 1, -0.5, 0.5, 0.5,
-1, -3.956675, -5.622533, 1, 1.5, 0.5, 0.5,
-1, -3.956675, -5.622533, 0, 1.5, 0.5, 0.5,
0, -3.956675, -5.622533, 0, -0.5, 0.5, 0.5,
0, -3.956675, -5.622533, 1, -0.5, 0.5, 0.5,
0, -3.956675, -5.622533, 1, 1.5, 0.5, 0.5,
0, -3.956675, -5.622533, 0, 1.5, 0.5, 0.5,
1, -3.956675, -5.622533, 0, -0.5, 0.5, 0.5,
1, -3.956675, -5.622533, 1, -0.5, 0.5, 0.5,
1, -3.956675, -5.622533, 1, 1.5, 0.5, 0.5,
1, -3.956675, -5.622533, 0, 1.5, 0.5, 0.5,
2, -3.956675, -5.622533, 0, -0.5, 0.5, 0.5,
2, -3.956675, -5.622533, 1, -0.5, 0.5, 0.5,
2, -3.956675, -5.622533, 1, 1.5, 0.5, 0.5,
2, -3.956675, -5.622533, 0, 1.5, 0.5, 0.5
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
-2.946136, -2, -4.878191,
-2.946136, 2, -4.878191,
-2.946136, -2, -4.878191,
-3.096826, -2, -5.126305,
-2.946136, 0, -4.878191,
-3.096826, 0, -5.126305,
-2.946136, 2, -4.878191,
-3.096826, 2, -5.126305
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
-3.398206, -2, -5.622533, 0, -0.5, 0.5, 0.5,
-3.398206, -2, -5.622533, 1, -0.5, 0.5, 0.5,
-3.398206, -2, -5.622533, 1, 1.5, 0.5, 0.5,
-3.398206, -2, -5.622533, 0, 1.5, 0.5, 0.5,
-3.398206, 0, -5.622533, 0, -0.5, 0.5, 0.5,
-3.398206, 0, -5.622533, 1, -0.5, 0.5, 0.5,
-3.398206, 0, -5.622533, 1, 1.5, 0.5, 0.5,
-3.398206, 0, -5.622533, 0, 1.5, 0.5, 0.5,
-3.398206, 2, -5.622533, 0, -0.5, 0.5, 0.5,
-3.398206, 2, -5.622533, 1, -0.5, 0.5, 0.5,
-3.398206, 2, -5.622533, 1, 1.5, 0.5, 0.5,
-3.398206, 2, -5.622533, 0, 1.5, 0.5, 0.5
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
-2.946136, -3.39819, -4,
-2.946136, -3.39819, 4,
-2.946136, -3.39819, -4,
-3.096826, -3.584352, -4,
-2.946136, -3.39819, -2,
-3.096826, -3.584352, -2,
-2.946136, -3.39819, 0,
-3.096826, -3.584352, 0,
-2.946136, -3.39819, 2,
-3.096826, -3.584352, 2,
-2.946136, -3.39819, 4,
-3.096826, -3.584352, 4
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
-3.398206, -3.956675, -4, 0, -0.5, 0.5, 0.5,
-3.398206, -3.956675, -4, 1, -0.5, 0.5, 0.5,
-3.398206, -3.956675, -4, 1, 1.5, 0.5, 0.5,
-3.398206, -3.956675, -4, 0, 1.5, 0.5, 0.5,
-3.398206, -3.956675, -2, 0, -0.5, 0.5, 0.5,
-3.398206, -3.956675, -2, 1, -0.5, 0.5, 0.5,
-3.398206, -3.956675, -2, 1, 1.5, 0.5, 0.5,
-3.398206, -3.956675, -2, 0, 1.5, 0.5, 0.5,
-3.398206, -3.956675, 0, 0, -0.5, 0.5, 0.5,
-3.398206, -3.956675, 0, 1, -0.5, 0.5, 0.5,
-3.398206, -3.956675, 0, 1, 1.5, 0.5, 0.5,
-3.398206, -3.956675, 0, 0, 1.5, 0.5, 0.5,
-3.398206, -3.956675, 2, 0, -0.5, 0.5, 0.5,
-3.398206, -3.956675, 2, 1, -0.5, 0.5, 0.5,
-3.398206, -3.956675, 2, 1, 1.5, 0.5, 0.5,
-3.398206, -3.956675, 2, 0, 1.5, 0.5, 0.5,
-3.398206, -3.956675, 4, 0, -0.5, 0.5, 0.5,
-3.398206, -3.956675, 4, 1, -0.5, 0.5, 0.5,
-3.398206, -3.956675, 4, 1, 1.5, 0.5, 0.5,
-3.398206, -3.956675, 4, 0, 1.5, 0.5, 0.5
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
-2.946136, -3.39819, -4.878191,
-2.946136, 4.048268, -4.878191,
-2.946136, -3.39819, 5.046373,
-2.946136, 4.048268, 5.046373,
-2.946136, -3.39819, -4.878191,
-2.946136, -3.39819, 5.046373,
-2.946136, 4.048268, -4.878191,
-2.946136, 4.048268, 5.046373,
-2.946136, -3.39819, -4.878191,
3.081474, -3.39819, -4.878191,
-2.946136, -3.39819, 5.046373,
3.081474, -3.39819, 5.046373,
-2.946136, 4.048268, -4.878191,
3.081474, 4.048268, -4.878191,
-2.946136, 4.048268, 5.046373,
3.081474, 4.048268, 5.046373,
3.081474, -3.39819, -4.878191,
3.081474, 4.048268, -4.878191,
3.081474, -3.39819, 5.046373,
3.081474, 4.048268, 5.046373,
3.081474, -3.39819, -4.878191,
3.081474, -3.39819, 5.046373,
3.081474, 4.048268, -4.878191,
3.081474, 4.048268, 5.046373
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
var radius = 7.365812;
var distance = 32.77133;
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
mvMatrix.translate( -0.06766891, -0.3250387, -0.08409119 );
mvMatrix.scale( 1.321264, 1.06951, 0.8024595 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.77133);
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
CMU<-read.table("CMU.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-CMU$V2
```

```
## Error in eval(expr, envir, enclos): object 'CMU' not found
```

```r
y<-CMU$V3
```

```
## Error in eval(expr, envir, enclos): object 'CMU' not found
```

```r
z<-CMU$V4
```

```
## Error in eval(expr, envir, enclos): object 'CMU' not found
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
-2.858355, -0.8081274, -3.306496, 0, 0, 1, 1, 1,
-2.654336, 0.7554861, -1.260785, 1, 0, 0, 1, 1,
-2.646008, -1.022655, -2.084223, 1, 0, 0, 1, 1,
-2.624269, 1.220163, -1.721807, 1, 0, 0, 1, 1,
-2.609783, -0.3276816, -2.508705, 1, 0, 0, 1, 1,
-2.336635, 2.443183, 0.03510693, 1, 0, 0, 1, 1,
-2.326036, -0.2517592, -0.8462839, 0, 0, 0, 1, 1,
-2.310116, 0.3595693, -1.947675, 0, 0, 0, 1, 1,
-2.280984, 1.83744, -1.817287, 0, 0, 0, 1, 1,
-2.218848, -0.3722171, -1.848963, 0, 0, 0, 1, 1,
-2.141233, -3.289747, -1.687723, 0, 0, 0, 1, 1,
-2.138017, -0.1530297, -0.9502983, 0, 0, 0, 1, 1,
-2.116816, -0.7645455, -1.576991, 0, 0, 0, 1, 1,
-2.052398, -0.7759053, -3.429577, 1, 1, 1, 1, 1,
-2.037951, -0.4443613, -3.280063, 1, 1, 1, 1, 1,
-2.032818, -0.319057, -2.564979, 1, 1, 1, 1, 1,
-2.024622, 1.067402, -0.9338018, 1, 1, 1, 1, 1,
-2.021236, 0.7137097, -1.759707, 1, 1, 1, 1, 1,
-2.003673, -0.8492464, -0.8990691, 1, 1, 1, 1, 1,
-2.00086, -0.07856683, -1.968111, 1, 1, 1, 1, 1,
-1.968321, 1.716425, 0.7105043, 1, 1, 1, 1, 1,
-1.920275, 0.3620646, -1.90443, 1, 1, 1, 1, 1,
-1.918926, -0.7341034, -2.662216, 1, 1, 1, 1, 1,
-1.871972, 0.7335336, -1.120337, 1, 1, 1, 1, 1,
-1.86615, -0.4348327, -1.637441, 1, 1, 1, 1, 1,
-1.863844, -0.4636009, -3.079687, 1, 1, 1, 1, 1,
-1.848148, -0.9151218, -3.746473, 1, 1, 1, 1, 1,
-1.831565, 2.118481, -2.240618, 1, 1, 1, 1, 1,
-1.818623, -0.6415027, -0.9026819, 0, 0, 1, 1, 1,
-1.775894, -0.09581912, -2.912978, 1, 0, 0, 1, 1,
-1.7509, -1.640985, -1.769058, 1, 0, 0, 1, 1,
-1.74307, 0.7303794, -0.4673772, 1, 0, 0, 1, 1,
-1.708062, -0.4107641, -2.245225, 1, 0, 0, 1, 1,
-1.684857, 0.5053077, -2.616705, 1, 0, 0, 1, 1,
-1.672851, -0.468823, -1.131124, 0, 0, 0, 1, 1,
-1.671177, -0.4586765, -2.857083, 0, 0, 0, 1, 1,
-1.670135, -2.027109, -4.066588, 0, 0, 0, 1, 1,
-1.665465, 1.909101, -1.277098, 0, 0, 0, 1, 1,
-1.622824, -0.3723465, -1.933676, 0, 0, 0, 1, 1,
-1.60653, -1.494074, -1.720571, 0, 0, 0, 1, 1,
-1.60052, -0.5876496, -3.110133, 0, 0, 0, 1, 1,
-1.600012, -0.7098455, -2.182064, 1, 1, 1, 1, 1,
-1.577848, -1.527551, -1.258426, 1, 1, 1, 1, 1,
-1.570015, -0.1991886, -1.06098, 1, 1, 1, 1, 1,
-1.569628, -0.2907763, -3.039542, 1, 1, 1, 1, 1,
-1.559241, -1.669159, -1.534891, 1, 1, 1, 1, 1,
-1.556282, 0.640327, -1.203587, 1, 1, 1, 1, 1,
-1.548603, -0.3023587, -0.7810799, 1, 1, 1, 1, 1,
-1.545845, 1.155684, -0.2625739, 1, 1, 1, 1, 1,
-1.520959, -0.3455372, -1.685887, 1, 1, 1, 1, 1,
-1.517578, 0.04638393, -0.8198482, 1, 1, 1, 1, 1,
-1.507007, -0.340641, -1.204563, 1, 1, 1, 1, 1,
-1.506258, -0.06032185, -1.952137, 1, 1, 1, 1, 1,
-1.497932, -0.8809179, -1.569703, 1, 1, 1, 1, 1,
-1.497129, -0.85572, -2.426519, 1, 1, 1, 1, 1,
-1.483021, 1.333704, -1.359499, 1, 1, 1, 1, 1,
-1.470882, 1.235377, -1.661188, 0, 0, 1, 1, 1,
-1.465185, 0.7232081, -4.426448, 1, 0, 0, 1, 1,
-1.464933, 0.6877441, -0.207312, 1, 0, 0, 1, 1,
-1.463248, -1.00496, -2.031515, 1, 0, 0, 1, 1,
-1.454473, 1.021584, 0.6567335, 1, 0, 0, 1, 1,
-1.444815, 0.08764526, -0.2950495, 1, 0, 0, 1, 1,
-1.443598, -0.4160943, -1.935845, 0, 0, 0, 1, 1,
-1.436795, -0.4836785, -2.081343, 0, 0, 0, 1, 1,
-1.436358, -1.33606, -2.441586, 0, 0, 0, 1, 1,
-1.432091, 0.09564301, -1.05972, 0, 0, 0, 1, 1,
-1.423403, 0.2875829, -1.117328, 0, 0, 0, 1, 1,
-1.420333, 0.3941885, -2.415453, 0, 0, 0, 1, 1,
-1.417994, -0.5517778, -0.5862867, 0, 0, 0, 1, 1,
-1.413768, -0.8159162, -2.506102, 1, 1, 1, 1, 1,
-1.410404, 1.552001, 0.4559258, 1, 1, 1, 1, 1,
-1.409316, -0.4708301, -1.648591, 1, 1, 1, 1, 1,
-1.40803, 0.3956011, -0.7046561, 1, 1, 1, 1, 1,
-1.407524, -1.071395, -2.032044, 1, 1, 1, 1, 1,
-1.393831, -0.09822925, -1.298481, 1, 1, 1, 1, 1,
-1.393446, -0.4847165, -1.430027, 1, 1, 1, 1, 1,
-1.381457, 0.8329959, -0.4227968, 1, 1, 1, 1, 1,
-1.374781, 0.4064398, 0.6526452, 1, 1, 1, 1, 1,
-1.373486, -0.649647, -2.150864, 1, 1, 1, 1, 1,
-1.369604, -1.031, -1.578649, 1, 1, 1, 1, 1,
-1.363149, 0.5769489, -1.593554, 1, 1, 1, 1, 1,
-1.355261, 0.1349954, -0.4076696, 1, 1, 1, 1, 1,
-1.3463, 0.1446183, -0.6706901, 1, 1, 1, 1, 1,
-1.334547, 0.8655886, 0.5056291, 1, 1, 1, 1, 1,
-1.332063, 0.1539331, -0.4879985, 0, 0, 1, 1, 1,
-1.32395, 0.2919947, -0.4917249, 1, 0, 0, 1, 1,
-1.312199, 0.84157, -0.9943253, 1, 0, 0, 1, 1,
-1.290776, -0.2285241, -2.617701, 1, 0, 0, 1, 1,
-1.288209, -1.217483, -3.280423, 1, 0, 0, 1, 1,
-1.281064, -1.221097, -0.4495593, 1, 0, 0, 1, 1,
-1.279629, 0.683389, -2.339224, 0, 0, 0, 1, 1,
-1.276803, 1.471094, -0.2739503, 0, 0, 0, 1, 1,
-1.2743, -1.385116, -1.942719, 0, 0, 0, 1, 1,
-1.272667, -1.073227, -2.482473, 0, 0, 0, 1, 1,
-1.268276, 0.5883146, -1.808403, 0, 0, 0, 1, 1,
-1.266886, 0.03437056, -0.4997246, 0, 0, 0, 1, 1,
-1.242446, -0.4336163, -2.242617, 0, 0, 0, 1, 1,
-1.240199, 0.5118005, -3.396317, 1, 1, 1, 1, 1,
-1.234665, 0.1751234, -0.7814562, 1, 1, 1, 1, 1,
-1.227754, -0.5355674, -2.567474, 1, 1, 1, 1, 1,
-1.224078, -0.2491173, -3.03685, 1, 1, 1, 1, 1,
-1.214925, 0.2117606, -0.8737503, 1, 1, 1, 1, 1,
-1.211001, 1.011149, -1.792366, 1, 1, 1, 1, 1,
-1.210514, -0.1017692, 0.06442489, 1, 1, 1, 1, 1,
-1.206149, -0.02314803, -2.632189, 1, 1, 1, 1, 1,
-1.203588, 0.1178346, -0.793492, 1, 1, 1, 1, 1,
-1.202713, 0.7705833, -1.435332, 1, 1, 1, 1, 1,
-1.200198, 0.4643416, 0.2316528, 1, 1, 1, 1, 1,
-1.190681, 1.662693, -0.593335, 1, 1, 1, 1, 1,
-1.181352, -1.680402, -1.893435, 1, 1, 1, 1, 1,
-1.180607, -0.5655624, -1.93765, 1, 1, 1, 1, 1,
-1.179477, 1.816346, -0.4426876, 1, 1, 1, 1, 1,
-1.17314, 0.4600269, 0.0593558, 0, 0, 1, 1, 1,
-1.170285, -1.572236, -2.497565, 1, 0, 0, 1, 1,
-1.165548, -1.436778, -2.388163, 1, 0, 0, 1, 1,
-1.164122, 0.7798639, -1.559574, 1, 0, 0, 1, 1,
-1.163284, 0.2230051, -0.4317602, 1, 0, 0, 1, 1,
-1.159853, -1.261555, -3.129636, 1, 0, 0, 1, 1,
-1.15962, -0.5326523, -2.354032, 0, 0, 0, 1, 1,
-1.158768, -1.168698, -0.3022255, 0, 0, 0, 1, 1,
-1.141662, -1.223442, -2.477757, 0, 0, 0, 1, 1,
-1.130953, -0.1567906, -2.93105, 0, 0, 0, 1, 1,
-1.120024, 0.9184976, 1.221526, 0, 0, 0, 1, 1,
-1.119691, -1.666446, -4.231045, 0, 0, 0, 1, 1,
-1.118538, 1.174497, 0.0686027, 0, 0, 0, 1, 1,
-1.10949, 0.3396252, -1.966355, 1, 1, 1, 1, 1,
-1.101428, 0.1783262, -1.964335, 1, 1, 1, 1, 1,
-1.099894, -1.965415, -2.24965, 1, 1, 1, 1, 1,
-1.092158, -0.199535, 0.05721719, 1, 1, 1, 1, 1,
-1.091061, 0.2953367, -0.7997996, 1, 1, 1, 1, 1,
-1.090464, 2.555964, -0.1432009, 1, 1, 1, 1, 1,
-1.090359, 0.3389267, -1.732839, 1, 1, 1, 1, 1,
-1.081813, 1.759397, -0.5919445, 1, 1, 1, 1, 1,
-1.081416, -0.2061299, -4.035833, 1, 1, 1, 1, 1,
-1.077062, 0.757049, -0.105645, 1, 1, 1, 1, 1,
-1.05915, -1.318844, -2.72326, 1, 1, 1, 1, 1,
-1.05517, -0.7519841, -3.923731, 1, 1, 1, 1, 1,
-1.054518, 1.460004, -1.368417, 1, 1, 1, 1, 1,
-1.05017, 0.2061969, -1.2634, 1, 1, 1, 1, 1,
-1.048161, -0.6299703, -1.817625, 1, 1, 1, 1, 1,
-1.043516, 0.6816618, -0.8574066, 0, 0, 1, 1, 1,
-1.031735, 0.9552698, 0.6300167, 1, 0, 0, 1, 1,
-1.031314, -0.6481104, -0.7004606, 1, 0, 0, 1, 1,
-1.030147, 2.628296, -0.1259898, 1, 0, 0, 1, 1,
-1.027545, -0.242181, -0.8223059, 1, 0, 0, 1, 1,
-1.026247, -1.099535, -1.667127, 1, 0, 0, 1, 1,
-1.025471, -0.4585648, -3.68506, 0, 0, 0, 1, 1,
-1.019547, -1.309112, -4.733658, 0, 0, 0, 1, 1,
-1.015155, -1.691398, -1.617589, 0, 0, 0, 1, 1,
-0.9969566, -0.5822641, -2.148642, 0, 0, 0, 1, 1,
-0.9945506, -0.5238376, -0.8410194, 0, 0, 0, 1, 1,
-0.9940681, 1.292355, -0.8151852, 0, 0, 0, 1, 1,
-0.9850368, 0.2487422, -0.8465853, 0, 0, 0, 1, 1,
-0.9843765, -0.4504658, -0.2537703, 1, 1, 1, 1, 1,
-0.9801142, 0.1805241, -0.9133666, 1, 1, 1, 1, 1,
-0.9765857, -2.039106, -3.917565, 1, 1, 1, 1, 1,
-0.9750412, -0.2352152, -2.382188, 1, 1, 1, 1, 1,
-0.9709479, 0.4048985, -2.386325, 1, 1, 1, 1, 1,
-0.9662859, -1.718078, -3.856721, 1, 1, 1, 1, 1,
-0.963857, -2.344076, -4.34523, 1, 1, 1, 1, 1,
-0.9636414, 1.236924, -1.415533, 1, 1, 1, 1, 1,
-0.9624864, 2.195464, 0.2988255, 1, 1, 1, 1, 1,
-0.9576171, 0.5797874, -1.505156, 1, 1, 1, 1, 1,
-0.9567689, -1.654201, -2.22291, 1, 1, 1, 1, 1,
-0.95276, 0.505033, -2.120425, 1, 1, 1, 1, 1,
-0.9502992, 1.431558, -1.049628, 1, 1, 1, 1, 1,
-0.9440939, 0.3198477, -0.9031118, 1, 1, 1, 1, 1,
-0.9352082, -0.4444989, -1.810723, 1, 1, 1, 1, 1,
-0.931608, -0.9758838, -4.154041, 0, 0, 1, 1, 1,
-0.927296, 0.1155229, -1.654811, 1, 0, 0, 1, 1,
-0.9247948, 0.2857507, -1.995339, 1, 0, 0, 1, 1,
-0.9187056, -0.8956084, -3.197241, 1, 0, 0, 1, 1,
-0.9171141, -0.1394152, -1.584912, 1, 0, 0, 1, 1,
-0.9154086, -0.06152618, -0.8426793, 1, 0, 0, 1, 1,
-0.9133194, -0.1007945, -2.091266, 0, 0, 0, 1, 1,
-0.9072829, -0.156792, -2.822159, 0, 0, 0, 1, 1,
-0.9061792, 1.91186, -0.7010862, 0, 0, 0, 1, 1,
-0.9061104, 1.31278, -2.45117, 0, 0, 0, 1, 1,
-0.9004176, -1.083172, -2.821193, 0, 0, 0, 1, 1,
-0.899711, 1.801795, -0.4561158, 0, 0, 0, 1, 1,
-0.898409, -0.3434341, -2.110477, 0, 0, 0, 1, 1,
-0.8871985, -1.168751, -2.617793, 1, 1, 1, 1, 1,
-0.8864449, 0.7352066, -0.9686612, 1, 1, 1, 1, 1,
-0.8846165, -0.7847626, -0.1658212, 1, 1, 1, 1, 1,
-0.8760897, 0.08208361, -1.131413, 1, 1, 1, 1, 1,
-0.874611, 0.5808753, 2.444317, 1, 1, 1, 1, 1,
-0.8614323, -0.4992821, -2.23785, 1, 1, 1, 1, 1,
-0.8561488, 1.087748, -0.4610712, 1, 1, 1, 1, 1,
-0.8534939, -0.1522528, -1.996246, 1, 1, 1, 1, 1,
-0.8506107, -0.1021207, -1.414933, 1, 1, 1, 1, 1,
-0.8495646, -1.690098, -0.548458, 1, 1, 1, 1, 1,
-0.8485143, 0.6651775, -1.87723, 1, 1, 1, 1, 1,
-0.847178, -0.4368617, -1.801846, 1, 1, 1, 1, 1,
-0.8439371, -0.6142027, -1.390027, 1, 1, 1, 1, 1,
-0.8388584, 0.5431489, -0.6516419, 1, 1, 1, 1, 1,
-0.8388394, 1.127743, 0.6107309, 1, 1, 1, 1, 1,
-0.8368976, 0.7186006, 0.8438851, 0, 0, 1, 1, 1,
-0.8345631, -1.026545, -2.628482, 1, 0, 0, 1, 1,
-0.83429, -0.3947116, -2.683728, 1, 0, 0, 1, 1,
-0.8332717, 1.239459, -1.377352, 1, 0, 0, 1, 1,
-0.8320812, -0.07202487, -2.671187, 1, 0, 0, 1, 1,
-0.8276343, -0.7165958, -2.946197, 1, 0, 0, 1, 1,
-0.8258248, -0.2619461, -1.19257, 0, 0, 0, 1, 1,
-0.8221982, -1.124174, -2.519641, 0, 0, 0, 1, 1,
-0.8153726, -1.930326, -3.82001, 0, 0, 0, 1, 1,
-0.8153231, -0.9846365, -2.091454, 0, 0, 0, 1, 1,
-0.8149272, 0.8440871, -1.062962, 0, 0, 0, 1, 1,
-0.8047878, 1.657462, -0.8579563, 0, 0, 0, 1, 1,
-0.7953253, -1.265559, -4.119542, 0, 0, 0, 1, 1,
-0.7947372, -1.211169, -2.140669, 1, 1, 1, 1, 1,
-0.7930794, -1.655108, -1.677231, 1, 1, 1, 1, 1,
-0.7920994, -0.310908, -2.346485, 1, 1, 1, 1, 1,
-0.7910974, -0.1487251, -1.509325, 1, 1, 1, 1, 1,
-0.7863549, 0.3919656, -1.998309, 1, 1, 1, 1, 1,
-0.7837282, -1.461339, -0.5690845, 1, 1, 1, 1, 1,
-0.7829075, 0.3346244, -1.892501, 1, 1, 1, 1, 1,
-0.7821208, -0.04111467, 0.7417368, 1, 1, 1, 1, 1,
-0.779047, 1.738922, 0.3593508, 1, 1, 1, 1, 1,
-0.7766949, 1.136202, -0.6407233, 1, 1, 1, 1, 1,
-0.7752931, 0.04889265, -0.07473746, 1, 1, 1, 1, 1,
-0.7575244, -0.4866288, -1.653004, 1, 1, 1, 1, 1,
-0.7537539, -1.178738, -2.90924, 1, 1, 1, 1, 1,
-0.7515791, -0.5515, -2.476952, 1, 1, 1, 1, 1,
-0.7512901, 1.162839, -1.246457, 1, 1, 1, 1, 1,
-0.7509619, -1.265141, -2.844145, 0, 0, 1, 1, 1,
-0.7503307, 1.898925, -0.3742105, 1, 0, 0, 1, 1,
-0.7499313, -0.547199, -3.419123, 1, 0, 0, 1, 1,
-0.7462838, -1.659277, -3.065162, 1, 0, 0, 1, 1,
-0.733429, 0.6867738, -0.9614818, 1, 0, 0, 1, 1,
-0.7331661, -1.232804, -3.335994, 1, 0, 0, 1, 1,
-0.7331061, 0.3052396, -1.563827, 0, 0, 0, 1, 1,
-0.72835, 1.468182, -1.962856, 0, 0, 0, 1, 1,
-0.7273475, 0.1874028, 0.1850602, 0, 0, 0, 1, 1,
-0.7263663, 0.4811058, -0.3622776, 0, 0, 0, 1, 1,
-0.7151796, 0.2656724, -1.810629, 0, 0, 0, 1, 1,
-0.710223, -1.302999, -2.979847, 0, 0, 0, 1, 1,
-0.7096533, 0.8051509, 1.099577, 0, 0, 0, 1, 1,
-0.7082388, 0.1754274, -2.233152, 1, 1, 1, 1, 1,
-0.7047932, 0.3131985, 0.3545449, 1, 1, 1, 1, 1,
-0.6966321, 1.381651, -0.3332212, 1, 1, 1, 1, 1,
-0.6890146, -0.326892, -1.244686, 1, 1, 1, 1, 1,
-0.679943, 0.1796291, 0.1292942, 1, 1, 1, 1, 1,
-0.6743249, 1.265882, -0.4512293, 1, 1, 1, 1, 1,
-0.6717864, 0.8849045, -0.5534244, 1, 1, 1, 1, 1,
-0.6660381, -0.1320278, -1.412416, 1, 1, 1, 1, 1,
-0.6648964, -2.222338, -4.528867, 1, 1, 1, 1, 1,
-0.6644637, 1.590208, -0.8467957, 1, 1, 1, 1, 1,
-0.664004, 0.4092206, -1.903402, 1, 1, 1, 1, 1,
-0.6633025, -1.533777, -3.548945, 1, 1, 1, 1, 1,
-0.6563556, 1.007745, -2.041273, 1, 1, 1, 1, 1,
-0.6559657, 0.6197831, -2.163192, 1, 1, 1, 1, 1,
-0.6517699, 0.4431432, -1.095388, 1, 1, 1, 1, 1,
-0.6471315, 0.2998317, -1.090872, 0, 0, 1, 1, 1,
-0.6446916, 1.062344, -0.2068783, 1, 0, 0, 1, 1,
-0.6442443, -0.3668513, -2.601714, 1, 0, 0, 1, 1,
-0.6411512, 0.64146, 0.3863049, 1, 0, 0, 1, 1,
-0.6381902, -1.309732, -0.8137099, 1, 0, 0, 1, 1,
-0.6346692, -0.7798733, -1.808792, 1, 0, 0, 1, 1,
-0.6343158, 0.3891445, -1.720272, 0, 0, 0, 1, 1,
-0.6321022, 0.3920738, -1.300533, 0, 0, 0, 1, 1,
-0.6311427, -0.03330184, -0.7935607, 0, 0, 0, 1, 1,
-0.6274934, -0.91145, -3.646313, 0, 0, 0, 1, 1,
-0.6196877, 1.411401, -1.461482, 0, 0, 0, 1, 1,
-0.6118763, -0.1845832, -1.468105, 0, 0, 0, 1, 1,
-0.606261, -2.611755, -1.986456, 0, 0, 0, 1, 1,
-0.601083, 1.048812, 0.5463876, 1, 1, 1, 1, 1,
-0.5889431, -0.8493727, -2.724346, 1, 1, 1, 1, 1,
-0.5851026, -1.454752, -3.07263, 1, 1, 1, 1, 1,
-0.5838133, -0.814598, -1.378475, 1, 1, 1, 1, 1,
-0.581193, 0.162679, -1.43313, 1, 1, 1, 1, 1,
-0.5744331, -0.5177729, -1.646469, 1, 1, 1, 1, 1,
-0.5715788, -1.874535, -3.072641, 1, 1, 1, 1, 1,
-0.5690164, -0.09689469, -3.344131, 1, 1, 1, 1, 1,
-0.5631948, -0.9128036, -2.762083, 1, 1, 1, 1, 1,
-0.5626204, 1.320613, 0.2853683, 1, 1, 1, 1, 1,
-0.5576335, -1.024855, -3.281859, 1, 1, 1, 1, 1,
-0.5568123, -0.3173121, -1.320269, 1, 1, 1, 1, 1,
-0.5559192, 0.1869191, -1.273227, 1, 1, 1, 1, 1,
-0.5548867, 0.04181033, -2.475486, 1, 1, 1, 1, 1,
-0.5533482, 1.539117, -3.135307, 1, 1, 1, 1, 1,
-0.5519871, -0.2196129, -2.092347, 0, 0, 1, 1, 1,
-0.5398484, 0.3994297, -0.6452777, 1, 0, 0, 1, 1,
-0.5395745, 0.2077941, -2.067173, 1, 0, 0, 1, 1,
-0.5340031, -0.15757, -1.362852, 1, 0, 0, 1, 1,
-0.5308891, -0.0419233, -1.297176, 1, 0, 0, 1, 1,
-0.5292833, 0.01892078, -3.557192, 1, 0, 0, 1, 1,
-0.5284939, -0.5576259, -2.333095, 0, 0, 0, 1, 1,
-0.5228526, 0.1522291, -1.112185, 0, 0, 0, 1, 1,
-0.5205695, -0.5689324, -2.270175, 0, 0, 0, 1, 1,
-0.5196852, 0.6888672, 0.3567936, 0, 0, 0, 1, 1,
-0.5194238, -0.5563986, -1.959255, 0, 0, 0, 1, 1,
-0.5188377, 1.735644, 2.009962, 0, 0, 0, 1, 1,
-0.5177431, 1.873725, -1.175663, 0, 0, 0, 1, 1,
-0.5127245, -0.4902866, -2.1641, 1, 1, 1, 1, 1,
-0.5078409, -1.598891, -2.246972, 1, 1, 1, 1, 1,
-0.5061008, 0.9867117, 0.3319003, 1, 1, 1, 1, 1,
-0.5049585, 0.6082197, -1.242876, 1, 1, 1, 1, 1,
-0.5022877, -1.35156, -1.93633, 1, 1, 1, 1, 1,
-0.49999, 0.2641809, -1.587733, 1, 1, 1, 1, 1,
-0.4915582, 0.9645731, -1.050067, 1, 1, 1, 1, 1,
-0.4911419, -1.282597, -0.8641586, 1, 1, 1, 1, 1,
-0.4902571, -0.9875768, -2.575837, 1, 1, 1, 1, 1,
-0.4878176, -0.1018591, -2.617816, 1, 1, 1, 1, 1,
-0.4823456, -0.7367941, -2.972559, 1, 1, 1, 1, 1,
-0.4806653, 0.2908598, -1.118597, 1, 1, 1, 1, 1,
-0.4801102, -0.9841499, -4.228996, 1, 1, 1, 1, 1,
-0.4795565, -1.858193, -2.539827, 1, 1, 1, 1, 1,
-0.4789636, 0.6454363, 0.1793274, 1, 1, 1, 1, 1,
-0.4766077, 1.664858, -0.3972751, 0, 0, 1, 1, 1,
-0.4715374, -0.6674441, -2.723059, 1, 0, 0, 1, 1,
-0.4663498, -2.060261, -2.50349, 1, 0, 0, 1, 1,
-0.4600343, -2.352731, -3.254954, 1, 0, 0, 1, 1,
-0.4573258, -1.138667, -2.790441, 1, 0, 0, 1, 1,
-0.4526281, 0.8665036, -1.853958, 1, 0, 0, 1, 1,
-0.4470235, 1.519441, -1.866239, 0, 0, 0, 1, 1,
-0.4420816, -1.561351, -3.316046, 0, 0, 0, 1, 1,
-0.4402101, 1.738926, -1.684302, 0, 0, 0, 1, 1,
-0.4346676, -0.4963552, -1.7236, 0, 0, 0, 1, 1,
-0.4340598, 1.103052, -0.1232144, 0, 0, 0, 1, 1,
-0.4287604, 0.6006747, -0.44231, 0, 0, 0, 1, 1,
-0.4269179, 0.2765724, -1.925731, 0, 0, 0, 1, 1,
-0.4242789, -0.4498449, -3.544128, 1, 1, 1, 1, 1,
-0.4191827, 0.3686337, -0.7234687, 1, 1, 1, 1, 1,
-0.4167102, 0.3419223, -0.1744852, 1, 1, 1, 1, 1,
-0.4146224, -0.7862183, -2.120312, 1, 1, 1, 1, 1,
-0.4144502, -0.9543064, -3.628171, 1, 1, 1, 1, 1,
-0.410801, -0.07787073, -2.026366, 1, 1, 1, 1, 1,
-0.4030244, -1.29771, -4.090112, 1, 1, 1, 1, 1,
-0.3977684, -0.7215517, -2.214005, 1, 1, 1, 1, 1,
-0.3976208, 0.3866163, 0.2407182, 1, 1, 1, 1, 1,
-0.3976109, -0.2711834, -3.214213, 1, 1, 1, 1, 1,
-0.3959407, -1.133739, -2.425066, 1, 1, 1, 1, 1,
-0.3948536, -0.4074313, -1.403498, 1, 1, 1, 1, 1,
-0.3921377, 1.247599, 0.5106218, 1, 1, 1, 1, 1,
-0.3904124, -0.511306, -4.422495, 1, 1, 1, 1, 1,
-0.3895522, 1.359907, -0.194435, 1, 1, 1, 1, 1,
-0.3893753, 1.975094, -1.005645, 0, 0, 1, 1, 1,
-0.3885616, 0.2753442, -0.9497699, 1, 0, 0, 1, 1,
-0.3751567, 1.18751, 0.9736947, 1, 0, 0, 1, 1,
-0.3712081, -1.147728, -3.749193, 1, 0, 0, 1, 1,
-0.3711216, -0.3469788, -2.787647, 1, 0, 0, 1, 1,
-0.3695237, -0.9814427, -3.045622, 1, 0, 0, 1, 1,
-0.3683247, -0.8262133, -3.192888, 0, 0, 0, 1, 1,
-0.3639958, 1.452645, -1.194608, 0, 0, 0, 1, 1,
-0.3604896, 1.793353, 0.6275908, 0, 0, 0, 1, 1,
-0.3584704, 0.3994262, -0.5533334, 0, 0, 0, 1, 1,
-0.3549535, 0.4252076, -0.6947169, 0, 0, 0, 1, 1,
-0.3508011, 1.229676, -0.106042, 0, 0, 0, 1, 1,
-0.3494493, -0.5040572, -2.36465, 0, 0, 0, 1, 1,
-0.3494458, 0.2773706, 0.05785228, 1, 1, 1, 1, 1,
-0.3476357, -0.3007374, -1.659176, 1, 1, 1, 1, 1,
-0.3457173, -1.368197, -4.332031, 1, 1, 1, 1, 1,
-0.3436491, -0.6022635, -2.121357, 1, 1, 1, 1, 1,
-0.3432294, 0.7967848, -0.9519632, 1, 1, 1, 1, 1,
-0.342036, 1.171194, -0.1799631, 1, 1, 1, 1, 1,
-0.341128, 0.4998185, 0.8807877, 1, 1, 1, 1, 1,
-0.3403076, -0.9544548, -4.080211, 1, 1, 1, 1, 1,
-0.3270496, -0.5107735, -2.226388, 1, 1, 1, 1, 1,
-0.3249661, -1.157727, -3.049791, 1, 1, 1, 1, 1,
-0.3239922, -0.8118798, -2.071721, 1, 1, 1, 1, 1,
-0.3218703, 0.6248907, -0.1404927, 1, 1, 1, 1, 1,
-0.3196213, 1.443205, -0.5561803, 1, 1, 1, 1, 1,
-0.3142147, -1.199242, -3.655818, 1, 1, 1, 1, 1,
-0.3125253, -0.6845381, -2.933378, 1, 1, 1, 1, 1,
-0.3103889, 0.06744353, -1.112771, 0, 0, 1, 1, 1,
-0.3096142, 0.9426907, -3.127134, 1, 0, 0, 1, 1,
-0.3067445, 0.09492835, -3.444257, 1, 0, 0, 1, 1,
-0.3060267, -1.148376, -4.555491, 1, 0, 0, 1, 1,
-0.3013308, 0.8777264, 1.769272, 1, 0, 0, 1, 1,
-0.2999893, 0.448333, -0.6396084, 1, 0, 0, 1, 1,
-0.2972485, -1.178495, -3.687734, 0, 0, 0, 1, 1,
-0.2943802, -0.642343, -4.388721, 0, 0, 0, 1, 1,
-0.2934382, -0.1456503, -1.500997, 0, 0, 0, 1, 1,
-0.2908579, 1.038017, -0.373217, 0, 0, 0, 1, 1,
-0.2863052, -0.7344449, -3.454901, 0, 0, 0, 1, 1,
-0.2834612, -0.03370803, -0.8187504, 0, 0, 0, 1, 1,
-0.2834545, 0.7006586, -0.4270142, 0, 0, 0, 1, 1,
-0.2833384, 0.3064257, 0.1977343, 1, 1, 1, 1, 1,
-0.279531, 0.4134761, -0.4078384, 1, 1, 1, 1, 1,
-0.2763522, 0.3663993, -2.349099, 1, 1, 1, 1, 1,
-0.2758242, -1.121902, -2.784677, 1, 1, 1, 1, 1,
-0.2718009, 1.480809, 0.3429193, 1, 1, 1, 1, 1,
-0.2648763, 1.369712, 0.9670692, 1, 1, 1, 1, 1,
-0.2646764, 0.1041608, 0.5591686, 1, 1, 1, 1, 1,
-0.2637713, -0.6956613, -3.284902, 1, 1, 1, 1, 1,
-0.26125, 0.05380918, -1.240788, 1, 1, 1, 1, 1,
-0.2609726, 1.312807, -0.1628647, 1, 1, 1, 1, 1,
-0.2588629, 0.1904397, 0.6745182, 1, 1, 1, 1, 1,
-0.2588114, -0.4854977, -3.096333, 1, 1, 1, 1, 1,
-0.2539271, 0.3869684, -0.7521963, 1, 1, 1, 1, 1,
-0.2523518, -0.9062313, -4.040303, 1, 1, 1, 1, 1,
-0.2504299, -0.7997882, -3.486632, 1, 1, 1, 1, 1,
-0.2467353, 0.9571484, -0.1981564, 0, 0, 1, 1, 1,
-0.2459379, 1.142811, 0.5560076, 1, 0, 0, 1, 1,
-0.2458541, -0.3844169, -3.515471, 1, 0, 0, 1, 1,
-0.2345536, -1.157652, -4.556371, 1, 0, 0, 1, 1,
-0.2332033, -1.501148, -3.132676, 1, 0, 0, 1, 1,
-0.2310072, 0.08466338, -1.406918, 1, 0, 0, 1, 1,
-0.2304042, -1.066044, -3.893475, 0, 0, 0, 1, 1,
-0.2283134, -0.4928912, -2.631914, 0, 0, 0, 1, 1,
-0.2267758, 0.6682927, -0.5831628, 0, 0, 0, 1, 1,
-0.2247022, -0.802288, -4.162428, 0, 0, 0, 1, 1,
-0.2206734, -0.7026697, -1.15572, 0, 0, 0, 1, 1,
-0.2189705, 1.018627, -0.910947, 0, 0, 0, 1, 1,
-0.2167385, 0.9089851, -0.4603691, 0, 0, 0, 1, 1,
-0.2162122, -0.1953649, -4.098752, 1, 1, 1, 1, 1,
-0.2140904, 0.4458292, -0.8786443, 1, 1, 1, 1, 1,
-0.2135541, -0.644837, -3.812171, 1, 1, 1, 1, 1,
-0.2080527, 1.055864, 1.240074, 1, 1, 1, 1, 1,
-0.2040905, 1.395767, -1.935147, 1, 1, 1, 1, 1,
-0.2029581, -0.1374456, -1.636717, 1, 1, 1, 1, 1,
-0.19856, -0.0356282, -2.718711, 1, 1, 1, 1, 1,
-0.1982086, -0.9689338, -3.121388, 1, 1, 1, 1, 1,
-0.1979049, -1.134028, -2.637668, 1, 1, 1, 1, 1,
-0.1958992, 0.4447825, -0.4659361, 1, 1, 1, 1, 1,
-0.1957435, 0.5783062, 0.7069476, 1, 1, 1, 1, 1,
-0.1913696, -0.7045919, -4.588966, 1, 1, 1, 1, 1,
-0.190938, 1.03502, -0.7244096, 1, 1, 1, 1, 1,
-0.1906394, 1.092529, 0.07336833, 1, 1, 1, 1, 1,
-0.1853761, 0.01956614, -3.101224, 1, 1, 1, 1, 1,
-0.1821841, -0.4983764, -3.939606, 0, 0, 1, 1, 1,
-0.1790286, 1.656952, 0.1945454, 1, 0, 0, 1, 1,
-0.1761738, -0.6116056, -1.924029, 1, 0, 0, 1, 1,
-0.1756158, 0.4563847, 1.292856, 1, 0, 0, 1, 1,
-0.1748636, 0.04636655, -1.283429, 1, 0, 0, 1, 1,
-0.172746, 0.7049431, 0.6036573, 1, 0, 0, 1, 1,
-0.1703107, 0.210879, -2.452076, 0, 0, 0, 1, 1,
-0.1687232, 0.1876702, -0.3153858, 0, 0, 0, 1, 1,
-0.1665327, -0.3089845, -3.514155, 0, 0, 0, 1, 1,
-0.1657366, 1.892831, 0.09408003, 0, 0, 0, 1, 1,
-0.1645859, 2.757681, 0.2399806, 0, 0, 0, 1, 1,
-0.1622453, -0.5395205, -4.677807, 0, 0, 0, 1, 1,
-0.160957, -0.09701589, -2.434848, 0, 0, 0, 1, 1,
-0.1574439, 1.311131, 0.713621, 1, 1, 1, 1, 1,
-0.1552244, 1.418861, -0.2995673, 1, 1, 1, 1, 1,
-0.1518806, 0.1423444, 0.8466529, 1, 1, 1, 1, 1,
-0.1510912, -0.9176013, -2.160944, 1, 1, 1, 1, 1,
-0.1445428, -2.148878, -1.753656, 1, 1, 1, 1, 1,
-0.144095, -0.5931937, -3.004109, 1, 1, 1, 1, 1,
-0.1440207, -0.0799429, -1.087814, 1, 1, 1, 1, 1,
-0.1402859, -0.008687355, -1.146881, 1, 1, 1, 1, 1,
-0.1374715, -1.246243, -3.692089, 1, 1, 1, 1, 1,
-0.1343282, -0.9624695, -2.6324, 1, 1, 1, 1, 1,
-0.1322426, 0.03889625, -1.552946, 1, 1, 1, 1, 1,
-0.1322258, 0.1921674, -0.07755999, 1, 1, 1, 1, 1,
-0.1300772, -1.052507, -4.369565, 1, 1, 1, 1, 1,
-0.1288667, -1.411022, -1.847585, 1, 1, 1, 1, 1,
-0.1281703, -0.7981601, -2.774377, 1, 1, 1, 1, 1,
-0.1269195, -0.002253455, -2.327032, 0, 0, 1, 1, 1,
-0.1251674, 0.8328809, -0.2213286, 1, 0, 0, 1, 1,
-0.1243096, -0.8716259, -3.862238, 1, 0, 0, 1, 1,
-0.1237876, 0.752535, -0.787415, 1, 0, 0, 1, 1,
-0.1198246, -1.011562, -4.665499, 1, 0, 0, 1, 1,
-0.1155907, 1.288065, -1.162836, 1, 0, 0, 1, 1,
-0.1139503, -1.69578, -2.946334, 0, 0, 0, 1, 1,
-0.1125411, 1.241652, -0.2902509, 0, 0, 0, 1, 1,
-0.1120689, 1.198877, 0.4250841, 0, 0, 0, 1, 1,
-0.1094164, 0.7299282, -0.7135115, 0, 0, 0, 1, 1,
-0.104145, 0.5602047, -1.447514, 0, 0, 0, 1, 1,
-0.1040446, -0.7648574, -3.437789, 0, 0, 0, 1, 1,
-0.1016242, -0.789014, -2.428572, 0, 0, 0, 1, 1,
-0.1011205, -0.9568224, -1.836659, 1, 1, 1, 1, 1,
-0.09548495, -2.585139, -1.641093, 1, 1, 1, 1, 1,
-0.09512472, 0.4444559, -1.929027, 1, 1, 1, 1, 1,
-0.09139203, 1.75188, -0.2039125, 1, 1, 1, 1, 1,
-0.09097786, 0.08409302, -1.6302, 1, 1, 1, 1, 1,
-0.08547185, -0.5644085, -2.8725, 1, 1, 1, 1, 1,
-0.08225592, 1.39435, 1.212915, 1, 1, 1, 1, 1,
-0.08100656, -0.4136999, -1.054977, 1, 1, 1, 1, 1,
-0.08057626, -1.475545, -3.045728, 1, 1, 1, 1, 1,
-0.0775537, -1.347815, -2.578057, 1, 1, 1, 1, 1,
-0.07356212, 1.562727, -0.1608478, 1, 1, 1, 1, 1,
-0.07325216, 0.8134483, -0.3901797, 1, 1, 1, 1, 1,
-0.07277608, 0.01792979, -1.102552, 1, 1, 1, 1, 1,
-0.07268622, -1.562308, -2.401188, 1, 1, 1, 1, 1,
-0.07227799, 1.020642, 0.7469276, 1, 1, 1, 1, 1,
-0.07123467, -0.4941735, -3.599639, 0, 0, 1, 1, 1,
-0.06499112, -1.49915, -4.655501, 1, 0, 0, 1, 1,
-0.0636735, -0.09908589, -1.964039, 1, 0, 0, 1, 1,
-0.0629876, -1.957982, -1.885285, 1, 0, 0, 1, 1,
-0.06263841, 0.3011521, 1.111054, 1, 0, 0, 1, 1,
-0.06180557, 0.253321, -1.353825, 1, 0, 0, 1, 1,
-0.05734047, 0.004978498, -1.422053, 0, 0, 0, 1, 1,
-0.05604809, -0.1504118, -3.197439, 0, 0, 0, 1, 1,
-0.0557137, 1.70169, 0.2675207, 0, 0, 0, 1, 1,
-0.05381256, 0.7263572, 0.5132921, 0, 0, 0, 1, 1,
-0.05114723, -1.041225, -4.369077, 0, 0, 0, 1, 1,
-0.05096683, 0.6866168, -0.2159579, 0, 0, 0, 1, 1,
-0.04998963, -1.512914, -3.476118, 0, 0, 0, 1, 1,
-0.0492021, -1.014264, -4.490179, 1, 1, 1, 1, 1,
-0.04890119, 1.140859, -0.3812613, 1, 1, 1, 1, 1,
-0.04656978, -0.00325002, -1.352667, 1, 1, 1, 1, 1,
-0.04652612, 0.1096326, -0.1713413, 1, 1, 1, 1, 1,
-0.04645158, 0.5757868, -0.6172867, 1, 1, 1, 1, 1,
-0.04422215, -0.03785024, -3.246728, 1, 1, 1, 1, 1,
-0.03974424, -0.4020848, -2.903159, 1, 1, 1, 1, 1,
-0.03420604, 0.4881067, -1.114787, 1, 1, 1, 1, 1,
-0.03258092, 1.05617, -1.666986, 1, 1, 1, 1, 1,
-0.03030149, -0.7139941, -2.633649, 1, 1, 1, 1, 1,
-0.02710586, -1.051321, -2.551653, 1, 1, 1, 1, 1,
-0.02683366, -1.88925, -3.995243, 1, 1, 1, 1, 1,
-0.02652791, 0.2074312, -0.6441546, 1, 1, 1, 1, 1,
-0.02151019, -0.2343147, -3.398231, 1, 1, 1, 1, 1,
-0.01925814, -0.6916287, -4.24389, 1, 1, 1, 1, 1,
-0.0179163, -1.417965, -3.21068, 0, 0, 1, 1, 1,
-0.01753652, 0.8087883, 0.9947799, 1, 0, 0, 1, 1,
-0.01445474, -1.643546, -3.670157, 1, 0, 0, 1, 1,
-0.01420808, 0.9315723, 0.05066079, 1, 0, 0, 1, 1,
-0.0125405, -1.245215, -4.576088, 1, 0, 0, 1, 1,
-0.008886253, -0.9735284, -2.917902, 1, 0, 0, 1, 1,
-0.008087558, 0.9399876, 0.4136091, 0, 0, 0, 1, 1,
-0.007696193, -0.4148066, -2.801143, 0, 0, 0, 1, 1,
-0.007621389, -0.3182133, -3.109669, 0, 0, 0, 1, 1,
-0.001402641, 0.424393, -0.6995569, 0, 0, 0, 1, 1,
-0.001339914, 1.856521, 0.6819959, 0, 0, 0, 1, 1,
-0.001234001, -1.616352, -2.497754, 0, 0, 0, 1, 1,
-0.001186217, -0.3276995, -2.663108, 0, 0, 0, 1, 1,
0.003802577, 0.5008035, 1.775728, 1, 1, 1, 1, 1,
0.004556602, 0.4673041, -0.1041133, 1, 1, 1, 1, 1,
0.005770818, -1.415851, 3.447701, 1, 1, 1, 1, 1,
0.01111627, 0.9215365, 0.8539439, 1, 1, 1, 1, 1,
0.0118129, 0.555154, 0.5407421, 1, 1, 1, 1, 1,
0.01653571, -0.3608622, 3.921395, 1, 1, 1, 1, 1,
0.01708236, -0.1020348, 2.529402, 1, 1, 1, 1, 1,
0.02417159, -0.0006288585, 1.285468, 1, 1, 1, 1, 1,
0.02490666, -0.05590499, 3.66438, 1, 1, 1, 1, 1,
0.02657508, -0.1192512, 3.750032, 1, 1, 1, 1, 1,
0.02777021, -0.9240475, 0.4067871, 1, 1, 1, 1, 1,
0.03264084, -0.3851138, 1.714125, 1, 1, 1, 1, 1,
0.03333791, 0.06664441, 0.9637722, 1, 1, 1, 1, 1,
0.0343847, 0.9084811, -1.159299, 1, 1, 1, 1, 1,
0.03518823, 0.6645164, 2.0396, 1, 1, 1, 1, 1,
0.03793937, -0.5618294, 3.613962, 0, 0, 1, 1, 1,
0.03895649, -0.2972101, 4.046018, 1, 0, 0, 1, 1,
0.04563682, 0.1476713, 1.732751, 1, 0, 0, 1, 1,
0.04631222, 0.4277134, 1.629009, 1, 0, 0, 1, 1,
0.04665877, -0.3520859, 3.01488, 1, 0, 0, 1, 1,
0.0508196, 0.9313977, -0.3421462, 1, 0, 0, 1, 1,
0.05239625, 1.271433, -0.7447587, 0, 0, 0, 1, 1,
0.05330395, -1.029579, 3.925944, 0, 0, 0, 1, 1,
0.05914249, -0.5243872, 1.231459, 0, 0, 0, 1, 1,
0.060278, 0.3161992, -0.8110536, 0, 0, 0, 1, 1,
0.06032844, 0.08184348, -0.04774373, 0, 0, 0, 1, 1,
0.06517687, -0.3071702, 0.7895374, 0, 0, 0, 1, 1,
0.06595992, 0.4185045, 0.8300546, 0, 0, 0, 1, 1,
0.07362711, 0.2214702, 0.3993346, 1, 1, 1, 1, 1,
0.07772506, -0.5661506, 3.459291, 1, 1, 1, 1, 1,
0.07874274, -0.2719298, 3.10518, 1, 1, 1, 1, 1,
0.07917384, 0.8446383, 0.08318415, 1, 1, 1, 1, 1,
0.07941989, 0.4358607, 0.5835992, 1, 1, 1, 1, 1,
0.07983778, 1.475127, -0.253901, 1, 1, 1, 1, 1,
0.08179007, 0.09301783, 0.6213195, 1, 1, 1, 1, 1,
0.08422529, 1.391318, 0.3723749, 1, 1, 1, 1, 1,
0.08438587, -0.4230652, 4.276198, 1, 1, 1, 1, 1,
0.08472803, 0.3171728, 1.008855, 1, 1, 1, 1, 1,
0.08524717, -0.1152886, 1.986353, 1, 1, 1, 1, 1,
0.08635588, 0.9134734, -0.9709622, 1, 1, 1, 1, 1,
0.08842972, -0.8005789, 3.864473, 1, 1, 1, 1, 1,
0.08864132, 1.556846, -0.542427, 1, 1, 1, 1, 1,
0.09732582, -0.4313427, 1.857528, 1, 1, 1, 1, 1,
0.1063825, -0.1148316, 1.832205, 0, 0, 1, 1, 1,
0.1084104, -0.001133955, 2.549054, 1, 0, 0, 1, 1,
0.1117528, -1.162116, 2.621781, 1, 0, 0, 1, 1,
0.1127209, 0.5634131, 0.8388394, 1, 0, 0, 1, 1,
0.1174198, -0.9948644, 0.8545909, 1, 0, 0, 1, 1,
0.1213643, 1.371979, -0.3753166, 1, 0, 0, 1, 1,
0.1217868, -2.124858, 2.336177, 0, 0, 0, 1, 1,
0.1240441, -0.8130377, 2.521894, 0, 0, 0, 1, 1,
0.1245069, -2.684429, 3.072732, 0, 0, 0, 1, 1,
0.1271425, 0.3820376, 0.8681308, 0, 0, 0, 1, 1,
0.1276325, -0.7473133, 2.81655, 0, 0, 0, 1, 1,
0.1339603, -0.8583378, 2.753033, 0, 0, 0, 1, 1,
0.1373866, 0.1323561, 1.595746, 0, 0, 0, 1, 1,
0.1376687, -0.6378888, 3.928849, 1, 1, 1, 1, 1,
0.1430764, 0.9231271, 0.6736613, 1, 1, 1, 1, 1,
0.1437926, 0.9875081, -1.121303, 1, 1, 1, 1, 1,
0.144993, 0.7972935, -0.7021421, 1, 1, 1, 1, 1,
0.1598778, -0.3955653, 2.745462, 1, 1, 1, 1, 1,
0.1615577, -0.5335968, 2.586145, 1, 1, 1, 1, 1,
0.1615748, 1.347278, 0.9439015, 1, 1, 1, 1, 1,
0.1623667, 1.061632, -0.6440063, 1, 1, 1, 1, 1,
0.1648643, -0.8751656, 3.743331, 1, 1, 1, 1, 1,
0.1725691, -0.3909834, 1.194891, 1, 1, 1, 1, 1,
0.1790474, -0.4326295, 1.202359, 1, 1, 1, 1, 1,
0.1793281, -1.741731, 2.376492, 1, 1, 1, 1, 1,
0.1803261, -0.715584, 2.974667, 1, 1, 1, 1, 1,
0.1808771, 0.5891261, -1.134094, 1, 1, 1, 1, 1,
0.1821486, -0.670334, 2.578233, 1, 1, 1, 1, 1,
0.1867146, -1.078995, 1.996546, 0, 0, 1, 1, 1,
0.193044, -2.042502, 4.224889, 1, 0, 0, 1, 1,
0.1972166, 0.284289, -0.5542896, 1, 0, 0, 1, 1,
0.1994376, -0.5374033, 3.718467, 1, 0, 0, 1, 1,
0.2029829, -1.279028, 3.029487, 1, 0, 0, 1, 1,
0.2041171, -0.7304035, 4.901841, 1, 0, 0, 1, 1,
0.2058597, 0.4436066, 1.621211, 0, 0, 0, 1, 1,
0.2072042, -0.5536597, 2.449482, 0, 0, 0, 1, 1,
0.215932, -0.3757936, 2.692959, 0, 0, 0, 1, 1,
0.2201573, -0.06827652, 2.558023, 0, 0, 0, 1, 1,
0.2206095, 1.208165, -0.7884436, 0, 0, 0, 1, 1,
0.2225736, -1.276906, 1.310066, 0, 0, 0, 1, 1,
0.2258046, -0.5373511, 3.548794, 0, 0, 0, 1, 1,
0.2309872, -1.468986, 2.662309, 1, 1, 1, 1, 1,
0.2312204, 1.938385, 0.346858, 1, 1, 1, 1, 1,
0.2354414, 0.1805913, -0.944623, 1, 1, 1, 1, 1,
0.2377289, -0.03940343, 1.174694, 1, 1, 1, 1, 1,
0.2381988, -0.8888894, 2.199428, 1, 1, 1, 1, 1,
0.2409561, -1.155183, 3.26121, 1, 1, 1, 1, 1,
0.2415976, 0.5825041, -0.4139303, 1, 1, 1, 1, 1,
0.2473909, -0.6449235, 1.953066, 1, 1, 1, 1, 1,
0.248462, 1.126963, 0.1709099, 1, 1, 1, 1, 1,
0.254073, -0.5487565, 3.155178, 1, 1, 1, 1, 1,
0.2611876, -0.1032963, 0.5793654, 1, 1, 1, 1, 1,
0.2664803, -0.6109955, 2.486112, 1, 1, 1, 1, 1,
0.2705269, 0.7562842, -0.5527819, 1, 1, 1, 1, 1,
0.2713459, -0.5613334, 3.405694, 1, 1, 1, 1, 1,
0.2713539, -0.1315823, 1.111758, 1, 1, 1, 1, 1,
0.2745048, -0.05201127, 2.602802, 0, 0, 1, 1, 1,
0.2828938, 0.8186172, 2.645262, 1, 0, 0, 1, 1,
0.2842184, 0.3257994, -1.83814, 1, 0, 0, 1, 1,
0.2856669, -1.573081, 4.020682, 1, 0, 0, 1, 1,
0.2902564, 3.005406, 1.587125, 1, 0, 0, 1, 1,
0.2905545, -1.161198, 2.550176, 1, 0, 0, 1, 1,
0.2926714, -0.3784784, 1.423359, 0, 0, 0, 1, 1,
0.2934104, -0.8351907, 3.18821, 0, 0, 0, 1, 1,
0.2941609, -2.006558, 3.751382, 0, 0, 0, 1, 1,
0.300234, -0.06204991, 0.7575744, 0, 0, 0, 1, 1,
0.3072225, -0.4638149, 2.101515, 0, 0, 0, 1, 1,
0.3122219, 1.941558, -1.065019, 0, 0, 0, 1, 1,
0.313626, 1.206864, -0.3186258, 0, 0, 0, 1, 1,
0.3196202, 1.379592, -0.4848217, 1, 1, 1, 1, 1,
0.3197893, -0.8458073, 2.047744, 1, 1, 1, 1, 1,
0.3204899, -0.3696595, 2.082857, 1, 1, 1, 1, 1,
0.3276168, -1.271932, 2.623056, 1, 1, 1, 1, 1,
0.3323845, 2.072847, 0.8256072, 1, 1, 1, 1, 1,
0.3330517, 1.109232, 1.468884, 1, 1, 1, 1, 1,
0.3336762, 2.156604, -0.2986968, 1, 1, 1, 1, 1,
0.3348942, 0.4062099, 1.299843, 1, 1, 1, 1, 1,
0.3368878, 0.9189097, -1.331758, 1, 1, 1, 1, 1,
0.3391954, -0.9944201, 2.988462, 1, 1, 1, 1, 1,
0.3396021, 0.7875126, 1.662921, 1, 1, 1, 1, 1,
0.3408179, -0.1728918, 3.251563, 1, 1, 1, 1, 1,
0.3444091, -0.3911788, 1.444552, 1, 1, 1, 1, 1,
0.3445792, 0.3273472, -0.2872034, 1, 1, 1, 1, 1,
0.3446592, 0.3348763, 2.739367, 1, 1, 1, 1, 1,
0.3454164, -1.284098, 2.387187, 0, 0, 1, 1, 1,
0.3455395, 0.3283136, 0.7540384, 1, 0, 0, 1, 1,
0.3501312, 1.351323, 0.7740515, 1, 0, 0, 1, 1,
0.3505457, 0.5998857, 0.2998009, 1, 0, 0, 1, 1,
0.3524998, -2.022842, 2.19647, 1, 0, 0, 1, 1,
0.3539676, 0.03691574, -0.2920015, 1, 0, 0, 1, 1,
0.3570194, 0.8635592, -0.001886418, 0, 0, 0, 1, 1,
0.3587381, -0.007303975, 1.537112, 0, 0, 0, 1, 1,
0.3591704, 0.3346271, 0.545766, 0, 0, 0, 1, 1,
0.3593532, 0.5476348, 0.567201, 0, 0, 0, 1, 1,
0.3623885, 2.27894, -1.245198, 0, 0, 0, 1, 1,
0.362499, -0.3135321, 1.915907, 0, 0, 0, 1, 1,
0.3632712, -0.09916802, 1.381744, 0, 0, 0, 1, 1,
0.3675012, -0.4936188, 2.572071, 1, 1, 1, 1, 1,
0.3728644, 0.7230773, 0.1818535, 1, 1, 1, 1, 1,
0.3765558, 1.485546, 0.6229177, 1, 1, 1, 1, 1,
0.3847606, 0.2484407, 0.9864101, 1, 1, 1, 1, 1,
0.3852429, -0.01174039, 2.716529, 1, 1, 1, 1, 1,
0.387158, -1.638447, 2.375994, 1, 1, 1, 1, 1,
0.3911903, 0.6611747, -0.5204583, 1, 1, 1, 1, 1,
0.3934688, -0.3520989, 2.305536, 1, 1, 1, 1, 1,
0.3948053, -0.7701198, 3.797676, 1, 1, 1, 1, 1,
0.394813, 0.5348412, 1.043023, 1, 1, 1, 1, 1,
0.398312, -1.097726, 2.738064, 1, 1, 1, 1, 1,
0.4038881, 0.7519466, 0.2577735, 1, 1, 1, 1, 1,
0.4094872, 1.341908, 1.468213, 1, 1, 1, 1, 1,
0.4103505, -0.1911881, 2.300801, 1, 1, 1, 1, 1,
0.411635, 0.3863567, 0.1933936, 1, 1, 1, 1, 1,
0.4179659, 0.3008671, 2.281032, 0, 0, 1, 1, 1,
0.4201515, -0.3627448, 2.7882, 1, 0, 0, 1, 1,
0.4216716, -0.07973545, -0.05449345, 1, 0, 0, 1, 1,
0.4266278, 0.8177292, -0.08089847, 1, 0, 0, 1, 1,
0.4293875, 1.076935, 0.9287597, 1, 0, 0, 1, 1,
0.4317601, 2.187277, 0.8950302, 1, 0, 0, 1, 1,
0.4373678, -1.022858, 4.505508, 0, 0, 0, 1, 1,
0.4391807, 1.041311, 1.493453, 0, 0, 0, 1, 1,
0.4399172, 0.09115522, 0.5006372, 0, 0, 0, 1, 1,
0.4409913, -0.03408458, 1.540854, 0, 0, 0, 1, 1,
0.4452474, 1.481143, -0.4520908, 0, 0, 0, 1, 1,
0.4498266, -0.005844652, 0.73857, 0, 0, 0, 1, 1,
0.4498546, -0.5505334, 1.760774, 0, 0, 0, 1, 1,
0.4574548, 0.2328776, 1.660954, 1, 1, 1, 1, 1,
0.4612714, 0.8243885, 0.02771525, 1, 1, 1, 1, 1,
0.4618461, -0.04794566, 1.574579, 1, 1, 1, 1, 1,
0.4659911, 0.5411472, 1.529824, 1, 1, 1, 1, 1,
0.4677434, -1.405357, 3.221143, 1, 1, 1, 1, 1,
0.4691484, -1.106828, 2.952288, 1, 1, 1, 1, 1,
0.4691559, -0.03073328, -0.8628435, 1, 1, 1, 1, 1,
0.4695965, 0.4979093, 0.8282154, 1, 1, 1, 1, 1,
0.470331, -0.2299238, 2.123622, 1, 1, 1, 1, 1,
0.4726589, -0.4435056, 2.455901, 1, 1, 1, 1, 1,
0.4733244, -0.1104634, 1.912794, 1, 1, 1, 1, 1,
0.4755453, 0.3495769, 0.9177323, 1, 1, 1, 1, 1,
0.4757368, -1.82996, 2.597795, 1, 1, 1, 1, 1,
0.4759781, -1.447061, 3.200881, 1, 1, 1, 1, 1,
0.4816446, 1.411882, 0.6300258, 1, 1, 1, 1, 1,
0.4824416, -0.4001114, 2.12133, 0, 0, 1, 1, 1,
0.4832044, 1.478428, -1.558667, 1, 0, 0, 1, 1,
0.4832961, 0.1424074, 2.562066, 1, 0, 0, 1, 1,
0.4835972, 1.491311, 1.291008, 1, 0, 0, 1, 1,
0.4863169, 0.1788873, 0.5461341, 1, 0, 0, 1, 1,
0.4896466, 0.0699565, 2.083134, 1, 0, 0, 1, 1,
0.4899453, 0.2124086, 1.634753, 0, 0, 0, 1, 1,
0.494358, 1.078545, 0.7144818, 0, 0, 0, 1, 1,
0.4961886, -0.6900165, -0.5773601, 0, 0, 0, 1, 1,
0.4975971, -0.5767509, 2.604326, 0, 0, 0, 1, 1,
0.497822, -1.525272, 2.44918, 0, 0, 0, 1, 1,
0.4984936, 1.210161, 0.7234795, 0, 0, 0, 1, 1,
0.498953, 0.5097578, 2.282231, 0, 0, 0, 1, 1,
0.499438, -0.2830549, 2.433838, 1, 1, 1, 1, 1,
0.5003076, 0.04329431, 0.9417045, 1, 1, 1, 1, 1,
0.5004261, -0.2670067, 2.89779, 1, 1, 1, 1, 1,
0.5028822, 0.1140667, -0.4662815, 1, 1, 1, 1, 1,
0.5082738, -1.357531, 3.004476, 1, 1, 1, 1, 1,
0.5113884, -1.253481, 1.966374, 1, 1, 1, 1, 1,
0.5122717, -0.08260331, 2.003913, 1, 1, 1, 1, 1,
0.5136259, -1.513629, 1.768071, 1, 1, 1, 1, 1,
0.5166426, 0.5883641, -0.2346865, 1, 1, 1, 1, 1,
0.5168183, 1.361093, 0.4865915, 1, 1, 1, 1, 1,
0.5172407, -0.3586234, 0.8643309, 1, 1, 1, 1, 1,
0.52266, -0.02784307, 0.9243683, 1, 1, 1, 1, 1,
0.5296352, -0.01132674, 2.930374, 1, 1, 1, 1, 1,
0.5303463, -0.8658591, 3.80186, 1, 1, 1, 1, 1,
0.5315859, 2.821081, 1.527223, 1, 1, 1, 1, 1,
0.532021, -0.7874442, 3.664855, 0, 0, 1, 1, 1,
0.5411126, -1.127875, 0.7944449, 1, 0, 0, 1, 1,
0.5503907, 0.350808, 0.6324838, 1, 0, 0, 1, 1,
0.5510513, -0.34751, 1.27558, 1, 0, 0, 1, 1,
0.5602496, 1.720466, 0.1087557, 1, 0, 0, 1, 1,
0.5603983, 0.6038545, 1.517895, 1, 0, 0, 1, 1,
0.5615515, -0.4686733, 2.292699, 0, 0, 0, 1, 1,
0.5639328, -0.389632, 1.144381, 0, 0, 0, 1, 1,
0.5646525, 0.24735, 1.258736, 0, 0, 0, 1, 1,
0.564852, -0.2361708, 2.0964, 0, 0, 0, 1, 1,
0.567621, 0.132731, 1.215352, 0, 0, 0, 1, 1,
0.5682425, 0.1850627, 1.207084, 0, 0, 0, 1, 1,
0.5801261, 0.7736804, 0.5351186, 0, 0, 0, 1, 1,
0.5827217, -0.9767975, 2.332515, 1, 1, 1, 1, 1,
0.5841406, -0.6663918, 1.951313, 1, 1, 1, 1, 1,
0.5912573, 1.39323, 0.4207344, 1, 1, 1, 1, 1,
0.5921711, 0.3238129, -0.9517612, 1, 1, 1, 1, 1,
0.5927168, 0.4429398, -0.9173016, 1, 1, 1, 1, 1,
0.5938431, 0.7381471, 0.08023518, 1, 1, 1, 1, 1,
0.5953658, -1.589688, 1.643296, 1, 1, 1, 1, 1,
0.5977293, 0.8139154, -0.1264002, 1, 1, 1, 1, 1,
0.5989531, 1.445492, 1.946925, 1, 1, 1, 1, 1,
0.6027622, -0.1584235, 1.085966, 1, 1, 1, 1, 1,
0.606732, 0.2530697, 2.052873, 1, 1, 1, 1, 1,
0.6100218, 1.358449, -0.01387319, 1, 1, 1, 1, 1,
0.6157097, -0.03327126, 0.7690822, 1, 1, 1, 1, 1,
0.6159183, -1.031509, 3.319235, 1, 1, 1, 1, 1,
0.6245845, -1.37267, 1.534965, 1, 1, 1, 1, 1,
0.6305997, -0.03979088, 1.06036, 0, 0, 1, 1, 1,
0.6329791, -0.2515104, 1.575168, 1, 0, 0, 1, 1,
0.6350217, -0.4235946, 2.430734, 1, 0, 0, 1, 1,
0.6374637, 0.1344934, 0.1153103, 1, 0, 0, 1, 1,
0.6411965, -1.281975, 3.211061, 1, 0, 0, 1, 1,
0.6448717, -0.9891366, 4.325947, 1, 0, 0, 1, 1,
0.6520516, 0.65061, 0.9276407, 0, 0, 0, 1, 1,
0.654884, -0.5640904, 2.28156, 0, 0, 0, 1, 1,
0.6550497, -0.5980834, 2.30579, 0, 0, 0, 1, 1,
0.6559452, 1.003708, 1.187793, 0, 0, 0, 1, 1,
0.6572027, 0.8464035, 2.669183, 0, 0, 0, 1, 1,
0.6658431, -1.316538, 2.879777, 0, 0, 0, 1, 1,
0.66948, 1.209477, -0.7688108, 0, 0, 0, 1, 1,
0.6701347, 1.114703, 0.3857963, 1, 1, 1, 1, 1,
0.6709544, 1.783786, 0.2688361, 1, 1, 1, 1, 1,
0.6715375, -0.2867314, 2.885531, 1, 1, 1, 1, 1,
0.6719826, -1.176855, 3.163478, 1, 1, 1, 1, 1,
0.6724541, 0.9633337, 2.150752, 1, 1, 1, 1, 1,
0.6752358, 0.3708153, 2.773205, 1, 1, 1, 1, 1,
0.6775286, 0.455126, 1.966692, 1, 1, 1, 1, 1,
0.6806186, 0.9066644, -0.1142704, 1, 1, 1, 1, 1,
0.6827751, -1.001457, 2.368763, 1, 1, 1, 1, 1,
0.6943721, -0.4884542, 1.008701, 1, 1, 1, 1, 1,
0.6961147, 1.519694, 0.4170657, 1, 1, 1, 1, 1,
0.6976618, -0.1256168, 1.742349, 1, 1, 1, 1, 1,
0.6984244, 2.112728, -0.8470968, 1, 1, 1, 1, 1,
0.7010688, 0.625372, 1.734087, 1, 1, 1, 1, 1,
0.7024415, 1.173922, -1.036605, 1, 1, 1, 1, 1,
0.709595, -0.00375942, 1.268653, 0, 0, 1, 1, 1,
0.7151369, 0.3568218, 2.112035, 1, 0, 0, 1, 1,
0.719339, -1.081099, 2.707227, 1, 0, 0, 1, 1,
0.723503, -0.07170089, 1.853988, 1, 0, 0, 1, 1,
0.7243733, -1.228326, 2.335914, 1, 0, 0, 1, 1,
0.7258151, -0.4948793, 2.00155, 1, 0, 0, 1, 1,
0.7279606, 0.7665551, 0.9548938, 0, 0, 0, 1, 1,
0.7291951, 0.237963, 0.1113639, 0, 0, 0, 1, 1,
0.7316105, -1.246868, 3.307002, 0, 0, 0, 1, 1,
0.7340298, 0.5421827, 1.409178, 0, 0, 0, 1, 1,
0.7492414, 0.9271901, 1.178733, 0, 0, 0, 1, 1,
0.7530647, 0.07436828, 0.7539822, 0, 0, 0, 1, 1,
0.754249, 0.1036619, 0.02035445, 0, 0, 0, 1, 1,
0.76296, 0.5530473, 1.405782, 1, 1, 1, 1, 1,
0.7738035, -0.3035195, 3.960882, 1, 1, 1, 1, 1,
0.7741603, 0.7905434, 0.2141233, 1, 1, 1, 1, 1,
0.7751289, -1.556388, 2.185579, 1, 1, 1, 1, 1,
0.7841096, -0.05439993, -0.1911189, 1, 1, 1, 1, 1,
0.7893887, 0.7942656, -0.03302538, 1, 1, 1, 1, 1,
0.7895509, -0.3737833, 3.158241, 1, 1, 1, 1, 1,
0.7929618, -0.2917126, 1.98604, 1, 1, 1, 1, 1,
0.800477, 0.06673434, 0.07341273, 1, 1, 1, 1, 1,
0.802808, -1.291502, 3.455176, 1, 1, 1, 1, 1,
0.8049074, 0.8778527, -0.6797636, 1, 1, 1, 1, 1,
0.8073438, 1.083667, 0.03866617, 1, 1, 1, 1, 1,
0.8158097, 0.382609, 1.589505, 1, 1, 1, 1, 1,
0.8176985, 1.04645, 0.650929, 1, 1, 1, 1, 1,
0.8331262, 1.574854, 1.066492, 1, 1, 1, 1, 1,
0.8442958, 0.4894855, 0.7582844, 0, 0, 1, 1, 1,
0.8448999, -0.384123, 2.564241, 1, 0, 0, 1, 1,
0.8488778, 0.7316328, 1.418224, 1, 0, 0, 1, 1,
0.8509591, 0.2745723, 0.8886769, 1, 0, 0, 1, 1,
0.8509897, 0.1486079, 0.09090251, 1, 0, 0, 1, 1,
0.8519234, -0.6859627, 3.254106, 1, 0, 0, 1, 1,
0.8549959, 0.2290335, 1.19831, 0, 0, 0, 1, 1,
0.8553184, 0.308334, -0.05348583, 0, 0, 0, 1, 1,
0.8634539, 0.9284368, 1.08402, 0, 0, 0, 1, 1,
0.8673425, 1.306989, 3.236887, 0, 0, 0, 1, 1,
0.8711116, -1.460565, 3.26721, 0, 0, 0, 1, 1,
0.8727136, -0.2510082, 0.3382117, 0, 0, 0, 1, 1,
0.8785542, 3.939824, 0.768293, 0, 0, 0, 1, 1,
0.8830479, -0.3384858, 3.31278, 1, 1, 1, 1, 1,
0.8863825, -0.4599306, 2.174155, 1, 1, 1, 1, 1,
0.8904377, -0.9713225, 2.753796, 1, 1, 1, 1, 1,
0.8972884, -1.369986, 1.717356, 1, 1, 1, 1, 1,
0.901035, 0.03631808, 1.475399, 1, 1, 1, 1, 1,
0.9018711, -1.109926, 2.723524, 1, 1, 1, 1, 1,
0.9094331, -0.7797335, 1.813609, 1, 1, 1, 1, 1,
0.9122817, 0.2194664, 3.987965, 1, 1, 1, 1, 1,
0.9152496, -0.549246, 1.721789, 1, 1, 1, 1, 1,
0.9199697, -0.05792864, 0.9634363, 1, 1, 1, 1, 1,
0.9200784, 0.5333807, 1.733259, 1, 1, 1, 1, 1,
0.9201165, -0.2226975, 2.035817, 1, 1, 1, 1, 1,
0.9289032, 1.352069, 1.742946, 1, 1, 1, 1, 1,
0.9311808, -0.8878628, 1.959405, 1, 1, 1, 1, 1,
0.9341455, 0.3715304, 1.878392, 1, 1, 1, 1, 1,
0.9381459, -0.8235614, 2.32823, 0, 0, 1, 1, 1,
0.943485, 0.554589, 1.902893, 1, 0, 0, 1, 1,
0.9539312, 0.2918782, 0.7488468, 1, 0, 0, 1, 1,
0.9571273, 0.1569827, 1.296791, 1, 0, 0, 1, 1,
0.9636083, -0.5756035, 0.5916877, 1, 0, 0, 1, 1,
0.9658579, 1.093424, 0.1514487, 1, 0, 0, 1, 1,
0.9658692, -0.02001261, 1.535264, 0, 0, 0, 1, 1,
0.9730307, 0.5939996, 0.8310434, 0, 0, 0, 1, 1,
0.9740899, 0.04577607, 0.8953794, 0, 0, 0, 1, 1,
0.9781969, -0.6194183, 1.702782, 0, 0, 0, 1, 1,
0.9933997, 0.8058801, 0.6898701, 0, 0, 0, 1, 1,
1.000201, 0.5429022, 0.4483651, 0, 0, 0, 1, 1,
1.002681, -0.2130623, 1.931045, 0, 0, 0, 1, 1,
1.004554, -1.502523, 2.863555, 1, 1, 1, 1, 1,
1.006141, 2.827984, 1.319132, 1, 1, 1, 1, 1,
1.009411, 0.4353454, 1.122974, 1, 1, 1, 1, 1,
1.019114, -1.394036, 2.530687, 1, 1, 1, 1, 1,
1.021879, 0.06146298, -0.03869959, 1, 1, 1, 1, 1,
1.029057, 1.520742, 0.426847, 1, 1, 1, 1, 1,
1.0315, 0.1414463, 1.844713, 1, 1, 1, 1, 1,
1.042263, -1.227573, 2.328092, 1, 1, 1, 1, 1,
1.045875, 0.06562369, 1.351651, 1, 1, 1, 1, 1,
1.050595, 0.08070093, 2.62858, 1, 1, 1, 1, 1,
1.050841, -0.584713, 2.306527, 1, 1, 1, 1, 1,
1.056748, 0.03712729, 2.067165, 1, 1, 1, 1, 1,
1.066728, -1.086884, 1.747727, 1, 1, 1, 1, 1,
1.070882, -0.0855261, 1.833677, 1, 1, 1, 1, 1,
1.076729, 0.2021037, 0.03839897, 1, 1, 1, 1, 1,
1.077172, 0.6474724, 0.6764166, 0, 0, 1, 1, 1,
1.077945, 1.571925, 0.2293202, 1, 0, 0, 1, 1,
1.078279, 0.4433155, 1.568784, 1, 0, 0, 1, 1,
1.079618, 1.434697, -0.610051, 1, 0, 0, 1, 1,
1.084697, -0.8515615, 2.114252, 1, 0, 0, 1, 1,
1.087291, 0.4702982, 2.260567, 1, 0, 0, 1, 1,
1.088414, -1.498138, 1.274475, 0, 0, 0, 1, 1,
1.096621, 0.04712114, 0.2503971, 0, 0, 0, 1, 1,
1.10272, 0.2454408, 1.548943, 0, 0, 0, 1, 1,
1.103523, 0.9686161, 0.768253, 0, 0, 0, 1, 1,
1.107228, 1.610357, 1.054535, 0, 0, 0, 1, 1,
1.110977, -2.162812, 2.355744, 0, 0, 0, 1, 1,
1.115721, 1.285275, 2.094655, 0, 0, 0, 1, 1,
1.11783, -0.8959103, 3.740403, 1, 1, 1, 1, 1,
1.123069, 0.4422991, 0.9469528, 1, 1, 1, 1, 1,
1.125905, 0.3875856, -1.368026, 1, 1, 1, 1, 1,
1.127288, -0.4542072, 1.57739, 1, 1, 1, 1, 1,
1.129288, -0.748363, 2.256791, 1, 1, 1, 1, 1,
1.133207, 0.8546155, 1.889801, 1, 1, 1, 1, 1,
1.15229, -0.3618896, 1.001115, 1, 1, 1, 1, 1,
1.156424, 0.6056302, 0.9744838, 1, 1, 1, 1, 1,
1.158388, 2.097055, 0.1746774, 1, 1, 1, 1, 1,
1.166348, 0.5884982, -0.02749116, 1, 1, 1, 1, 1,
1.167206, -2.486732, 2.148383, 1, 1, 1, 1, 1,
1.167252, 1.109876, 1.464877, 1, 1, 1, 1, 1,
1.168161, 1.51047, -0.3269519, 1, 1, 1, 1, 1,
1.170072, -0.5545284, 2.566539, 1, 1, 1, 1, 1,
1.172605, -0.8556185, 1.802436, 1, 1, 1, 1, 1,
1.17825, 1.201777, 1.55139, 0, 0, 1, 1, 1,
1.199475, 0.1779194, 2.030084, 1, 0, 0, 1, 1,
1.206181, -0.1250258, 1.924136, 1, 0, 0, 1, 1,
1.214666, 1.571557, 1.499046, 1, 0, 0, 1, 1,
1.215201, -0.1494796, 3.417889, 1, 0, 0, 1, 1,
1.219011, -0.09129215, 1.410119, 1, 0, 0, 1, 1,
1.220473, 0.1425842, 1.073405, 0, 0, 0, 1, 1,
1.222796, 0.1755515, 1.725156, 0, 0, 0, 1, 1,
1.235901, 1.520096, -0.4608748, 0, 0, 0, 1, 1,
1.236192, -0.8825366, 2.536315, 0, 0, 0, 1, 1,
1.246619, 0.6404897, 2.388298, 0, 0, 0, 1, 1,
1.248011, 1.505261, -0.2665982, 0, 0, 0, 1, 1,
1.253521, -0.1303965, 1.818716, 0, 0, 0, 1, 1,
1.255576, -1.88529, 3.317888, 1, 1, 1, 1, 1,
1.255747, -0.8573642, 2.313754, 1, 1, 1, 1, 1,
1.261964, 0.2709725, 0.1252084, 1, 1, 1, 1, 1,
1.262446, 0.6803566, 0.2818011, 1, 1, 1, 1, 1,
1.275644, -0.6806089, 2.063828, 1, 1, 1, 1, 1,
1.277331, 0.3625739, 0.2922131, 1, 1, 1, 1, 1,
1.286412, 0.2691844, 0.4381498, 1, 1, 1, 1, 1,
1.286847, -1.043886, 1.881856, 1, 1, 1, 1, 1,
1.298441, 1.277334, 0.06352375, 1, 1, 1, 1, 1,
1.305339, 1.676584, -0.03301328, 1, 1, 1, 1, 1,
1.316765, 0.2949687, 1.318747, 1, 1, 1, 1, 1,
1.320144, 0.01024139, 1.886648, 1, 1, 1, 1, 1,
1.322492, 2.101807, 0.2773035, 1, 1, 1, 1, 1,
1.325794, -0.5328197, 2.949232, 1, 1, 1, 1, 1,
1.329179, -0.3312204, 1.118275, 1, 1, 1, 1, 1,
1.335332, 1.0844, 2.975204, 0, 0, 1, 1, 1,
1.353161, 1.523815, 0.9135999, 1, 0, 0, 1, 1,
1.358224, 1.103854, -0.493987, 1, 0, 0, 1, 1,
1.36412, -0.5547794, 2.80546, 1, 0, 0, 1, 1,
1.367466, -1.083535, 0.6864835, 1, 0, 0, 1, 1,
1.370457, 0.2159515, 0.5581123, 1, 0, 0, 1, 1,
1.379989, -0.5290241, 2.71681, 0, 0, 0, 1, 1,
1.39263, -0.8502707, 2.609725, 0, 0, 0, 1, 1,
1.408511, 0.4126526, 3.266847, 0, 0, 0, 1, 1,
1.409496, 0.3592004, 1.334176, 0, 0, 0, 1, 1,
1.420296, -1.134712, 3.966766, 0, 0, 0, 1, 1,
1.427727, -0.6830522, 0.6751022, 0, 0, 0, 1, 1,
1.430232, -0.3528904, 0.2902971, 0, 0, 0, 1, 1,
1.439138, 0.3884321, 0.9209948, 1, 1, 1, 1, 1,
1.452199, 0.0853893, 0.9804007, 1, 1, 1, 1, 1,
1.459403, -0.7323083, 2.179924, 1, 1, 1, 1, 1,
1.462411, -0.1293756, 2.154866, 1, 1, 1, 1, 1,
1.463625, -1.259636, 0.9074739, 1, 1, 1, 1, 1,
1.47046, 2.823945, 0.3265312, 1, 1, 1, 1, 1,
1.491663, 1.257622, 1.573098, 1, 1, 1, 1, 1,
1.492092, -0.1592848, 3.410726, 1, 1, 1, 1, 1,
1.504752, -0.09146076, 1.312519, 1, 1, 1, 1, 1,
1.512203, 0.216244, 0.5775008, 1, 1, 1, 1, 1,
1.516748, 0.1907523, 0.8709785, 1, 1, 1, 1, 1,
1.530434, 0.4366928, 1.728572, 1, 1, 1, 1, 1,
1.549981, 0.08208825, 0.8475198, 1, 1, 1, 1, 1,
1.56524, -0.3376196, 1.34086, 1, 1, 1, 1, 1,
1.566862, -0.86323, 3.462733, 1, 1, 1, 1, 1,
1.570548, 0.773081, 0.173924, 0, 0, 1, 1, 1,
1.573162, 0.8647376, 0.1504038, 1, 0, 0, 1, 1,
1.58415, 0.8337138, 0.6437631, 1, 0, 0, 1, 1,
1.58658, 0.5294157, 3.309565, 1, 0, 0, 1, 1,
1.603054, -1.68164, 2.958996, 1, 0, 0, 1, 1,
1.631152, 0.7179352, 1.43716, 1, 0, 0, 1, 1,
1.640074, 0.2291406, 2.149238, 0, 0, 0, 1, 1,
1.64543, 1.741444, 1.69017, 0, 0, 0, 1, 1,
1.656547, -0.4622933, 1.548606, 0, 0, 0, 1, 1,
1.658854, -2.139372, 1.23574, 0, 0, 0, 1, 1,
1.664699, 0.2317461, 0.8227499, 0, 0, 0, 1, 1,
1.673511, 1.63165, 1.757976, 0, 0, 0, 1, 1,
1.674054, -0.2202756, 1.674739, 0, 0, 0, 1, 1,
1.680283, 0.5208935, 0.5286531, 1, 1, 1, 1, 1,
1.701929, 0.1242561, 1.772639, 1, 1, 1, 1, 1,
1.703365, 0.2918739, 0.6005912, 1, 1, 1, 1, 1,
1.715622, -1.035511, 1.342111, 1, 1, 1, 1, 1,
1.716608, 0.4729474, 2.176164, 1, 1, 1, 1, 1,
1.727375, 0.009205451, 0.7063498, 1, 1, 1, 1, 1,
1.734927, 1.287234, -0.9356186, 1, 1, 1, 1, 1,
1.754996, -1.519648, 0.9382644, 1, 1, 1, 1, 1,
1.758586, 0.0567622, 2.534734, 1, 1, 1, 1, 1,
1.815916, 0.9569617, 1.62636, 1, 1, 1, 1, 1,
1.829101, -0.7549938, 2.672703, 1, 1, 1, 1, 1,
1.840374, 0.2885171, 1.497427, 1, 1, 1, 1, 1,
1.849221, 1.4072, -0.2366181, 1, 1, 1, 1, 1,
1.879743, -1.277013, 2.139692, 1, 1, 1, 1, 1,
1.90964, -0.03183959, 1.159552, 1, 1, 1, 1, 1,
1.926587, 0.8197818, 2.592741, 0, 0, 1, 1, 1,
1.940162, 0.8087196, 1.982024, 1, 0, 0, 1, 1,
2.006586, -1.780267, 2.62559, 1, 0, 0, 1, 1,
2.011578, 0.2954147, 1.489462, 1, 0, 0, 1, 1,
2.101366, -2.950114, 2.55468, 1, 0, 0, 1, 1,
2.120701, -0.430354, 0.3166074, 1, 0, 0, 1, 1,
2.140444, 1.252462, 0.1283437, 0, 0, 0, 1, 1,
2.237646, 0.3855485, 2.680259, 0, 0, 0, 1, 1,
2.277568, -2.380398, 3.243124, 0, 0, 0, 1, 1,
2.28342, -0.1668118, 1.936612, 0, 0, 0, 1, 1,
2.290687, 0.9507557, 0.271033, 0, 0, 0, 1, 1,
2.344817, -0.8486259, 2.708181, 0, 0, 0, 1, 1,
2.355327, -0.7316917, 1.961044, 0, 0, 0, 1, 1,
2.358433, 0.4414302, 0.01044673, 1, 1, 1, 1, 1,
2.516491, 0.8249564, 2.651157, 1, 1, 1, 1, 1,
2.619907, -0.7368006, 2.634615, 1, 1, 1, 1, 1,
2.640663, 1.968839, 0.9593509, 1, 1, 1, 1, 1,
2.786297, 1.211818, 1.36289, 1, 1, 1, 1, 1,
2.816762, 0.4557644, 0.3155001, 1, 1, 1, 1, 1,
2.993693, -0.5769368, 1.431229, 1, 1, 1, 1, 1
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
var radius = 9.239746;
var distance = 32.45422;
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
mvMatrix.translate( -0.06766891, -0.3250384, -0.08409119 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.45422);
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