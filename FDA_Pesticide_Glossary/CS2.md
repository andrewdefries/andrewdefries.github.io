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
-3.062069, -0.5917183, -3.114003, 1, 0, 0, 1,
-2.831038, -1.201449, -0.5120805, 1, 0.007843138, 0, 1,
-2.790632, 0.3014081, -1.099997, 1, 0.01176471, 0, 1,
-2.698112, -1.236172, -1.189673, 1, 0.01960784, 0, 1,
-2.691025, -0.6203575, -2.084413, 1, 0.02352941, 0, 1,
-2.570329, 1.742302, -2.07344, 1, 0.03137255, 0, 1,
-2.546802, -1.92629, -1.366986, 1, 0.03529412, 0, 1,
-2.539897, 0.1879318, -2.340914, 1, 0.04313726, 0, 1,
-2.524002, 0.1688405, -1.621096, 1, 0.04705882, 0, 1,
-2.453796, -0.1262006, -2.353652, 1, 0.05490196, 0, 1,
-2.390338, -1.031281, -1.979713, 1, 0.05882353, 0, 1,
-2.371031, -0.04867318, -1.52058, 1, 0.06666667, 0, 1,
-2.356628, 0.1611185, -0.9516878, 1, 0.07058824, 0, 1,
-2.284837, 0.144178, -0.09028166, 1, 0.07843138, 0, 1,
-2.27857, -0.1012322, -2.943393, 1, 0.08235294, 0, 1,
-2.262379, -1.372069, -3.603729, 1, 0.09019608, 0, 1,
-2.209853, -2.6906, -3.464085, 1, 0.09411765, 0, 1,
-2.207813, -0.3850461, -0.02392751, 1, 0.1019608, 0, 1,
-2.147945, -0.7544786, -0.8687763, 1, 0.1098039, 0, 1,
-2.113078, 0.5587283, -1.809754, 1, 0.1137255, 0, 1,
-2.099015, 1.020975, -1.061803, 1, 0.1215686, 0, 1,
-2.098747, 1.980188, 0.9086198, 1, 0.1254902, 0, 1,
-2.038078, 0.283955, -2.374706, 1, 0.1333333, 0, 1,
-2.025056, 0.6789839, -0.503939, 1, 0.1372549, 0, 1,
-2.016574, -0.1769803, -1.752418, 1, 0.145098, 0, 1,
-1.951005, 1.962218, -0.4593338, 1, 0.1490196, 0, 1,
-1.928271, 0.4069172, -0.4591663, 1, 0.1568628, 0, 1,
-1.92121, 0.3684492, -1.096388, 1, 0.1607843, 0, 1,
-1.908686, -0.2429723, -1.825062, 1, 0.1686275, 0, 1,
-1.891078, 0.1281444, -1.417963, 1, 0.172549, 0, 1,
-1.877311, 0.07698538, -1.711834, 1, 0.1803922, 0, 1,
-1.855888, 0.4626942, -1.783979, 1, 0.1843137, 0, 1,
-1.854159, 0.6779407, -0.6552396, 1, 0.1921569, 0, 1,
-1.830616, -0.1726749, -1.160386, 1, 0.1960784, 0, 1,
-1.830548, 1.425305, -1.255426, 1, 0.2039216, 0, 1,
-1.818813, -0.7665704, -3.608946, 1, 0.2117647, 0, 1,
-1.818722, -0.3820245, -2.337595, 1, 0.2156863, 0, 1,
-1.810685, -1.833007, -2.976075, 1, 0.2235294, 0, 1,
-1.788667, 1.091207, -1.274654, 1, 0.227451, 0, 1,
-1.782993, -0.8154638, -0.220081, 1, 0.2352941, 0, 1,
-1.777898, -0.2354872, -1.828894, 1, 0.2392157, 0, 1,
-1.773523, -0.07361918, -2.467264, 1, 0.2470588, 0, 1,
-1.765736, 0.04358494, -0.5144662, 1, 0.2509804, 0, 1,
-1.761269, 0.2696485, 0.1893677, 1, 0.2588235, 0, 1,
-1.757804, -0.657309, 0.3072764, 1, 0.2627451, 0, 1,
-1.749564, 0.6994433, -0.7928722, 1, 0.2705882, 0, 1,
-1.746687, 0.7397678, -0.1627839, 1, 0.2745098, 0, 1,
-1.744515, 1.768954, 0.5751955, 1, 0.282353, 0, 1,
-1.737083, -0.6747174, -0.979026, 1, 0.2862745, 0, 1,
-1.717608, -0.8135775, -3.409294, 1, 0.2941177, 0, 1,
-1.700791, -0.8483335, -2.756189, 1, 0.3019608, 0, 1,
-1.69651, 1.699662, -1.324937, 1, 0.3058824, 0, 1,
-1.663004, -0.3019967, -1.721601, 1, 0.3137255, 0, 1,
-1.644414, -0.8950432, -2.126107, 1, 0.3176471, 0, 1,
-1.643032, -1.970365, -4.573067, 1, 0.3254902, 0, 1,
-1.602892, 0.5447861, -1.245842, 1, 0.3294118, 0, 1,
-1.602792, 1.714015, -0.9687997, 1, 0.3372549, 0, 1,
-1.600382, 0.208493, -4.077608, 1, 0.3411765, 0, 1,
-1.597245, 1.570446, -0.08427224, 1, 0.3490196, 0, 1,
-1.596762, -0.002592419, -1.366001, 1, 0.3529412, 0, 1,
-1.595502, 1.828403, -1.299058, 1, 0.3607843, 0, 1,
-1.594129, 2.466434, -2.161902, 1, 0.3647059, 0, 1,
-1.59168, -0.4983299, -1.488963, 1, 0.372549, 0, 1,
-1.58822, 0.5910847, -0.179215, 1, 0.3764706, 0, 1,
-1.581645, 0.2678756, -2.10864, 1, 0.3843137, 0, 1,
-1.579776, -0.533532, -2.289102, 1, 0.3882353, 0, 1,
-1.560726, -1.34875, -3.14355, 1, 0.3960784, 0, 1,
-1.557723, 0.3271387, -0.4972218, 1, 0.4039216, 0, 1,
-1.534974, 1.548698, -0.7628294, 1, 0.4078431, 0, 1,
-1.530416, 1.768587, -1.320527, 1, 0.4156863, 0, 1,
-1.508112, -0.6108099, -1.49147, 1, 0.4196078, 0, 1,
-1.493935, 0.1027632, -0.8786734, 1, 0.427451, 0, 1,
-1.491628, -0.4582312, -0.3807574, 1, 0.4313726, 0, 1,
-1.488181, -0.07383651, -1.480002, 1, 0.4392157, 0, 1,
-1.468428, -0.284968, -1.406055, 1, 0.4431373, 0, 1,
-1.468059, 1.370094, -0.198137, 1, 0.4509804, 0, 1,
-1.465171, 0.2696209, -0.191183, 1, 0.454902, 0, 1,
-1.442283, -0.2128199, -2.426468, 1, 0.4627451, 0, 1,
-1.442199, -1.342447, -1.995865, 1, 0.4666667, 0, 1,
-1.419227, -0.1119719, -0.8800032, 1, 0.4745098, 0, 1,
-1.415352, 1.39467, 0.8219976, 1, 0.4784314, 0, 1,
-1.40442, -0.3477997, -2.558136, 1, 0.4862745, 0, 1,
-1.396926, 1.16752, -1.652716, 1, 0.4901961, 0, 1,
-1.365738, 1.070426, -0.8229015, 1, 0.4980392, 0, 1,
-1.359957, -0.3980007, -1.117115, 1, 0.5058824, 0, 1,
-1.358335, 0.3261681, -2.218993, 1, 0.509804, 0, 1,
-1.354569, 0.03997496, -2.448797, 1, 0.5176471, 0, 1,
-1.354017, 1.561768, -0.6838012, 1, 0.5215687, 0, 1,
-1.345074, -1.457283, -1.900585, 1, 0.5294118, 0, 1,
-1.343892, -0.82106, -1.921192, 1, 0.5333334, 0, 1,
-1.341629, 0.8416926, -0.8632525, 1, 0.5411765, 0, 1,
-1.341291, 0.4555374, -3.048852, 1, 0.5450981, 0, 1,
-1.339079, -0.01783271, -0.7763936, 1, 0.5529412, 0, 1,
-1.33831, -1.871584, -3.823865, 1, 0.5568628, 0, 1,
-1.33542, 0.2857147, -1.500228, 1, 0.5647059, 0, 1,
-1.334188, -0.368056, -1.732111, 1, 0.5686275, 0, 1,
-1.334044, 0.638163, -3.364289, 1, 0.5764706, 0, 1,
-1.329967, 1.965056, -1.309872, 1, 0.5803922, 0, 1,
-1.325307, 0.04123597, -0.6619099, 1, 0.5882353, 0, 1,
-1.312011, -1.111846, -0.267308, 1, 0.5921569, 0, 1,
-1.308427, 1.008146, -2.184743, 1, 0.6, 0, 1,
-1.300854, 1.023205, -2.221026, 1, 0.6078432, 0, 1,
-1.296745, 1.346334, -1.0572, 1, 0.6117647, 0, 1,
-1.295153, 0.004030267, -2.012152, 1, 0.6196079, 0, 1,
-1.287173, 0.4174733, -2.553375, 1, 0.6235294, 0, 1,
-1.27943, 1.403335, -1.408395, 1, 0.6313726, 0, 1,
-1.275484, 0.2770098, -1.208726, 1, 0.6352941, 0, 1,
-1.266148, -1.011693, -2.125755, 1, 0.6431373, 0, 1,
-1.2647, 0.1963765, -1.032496, 1, 0.6470588, 0, 1,
-1.26283, 0.4505761, -0.5049361, 1, 0.654902, 0, 1,
-1.25854, -0.2117448, -1.604166, 1, 0.6588235, 0, 1,
-1.255039, -0.2682379, -0.2422669, 1, 0.6666667, 0, 1,
-1.254901, 1.006877, -1.987366, 1, 0.6705883, 0, 1,
-1.253117, 1.155731, -1.659677, 1, 0.6784314, 0, 1,
-1.24988, -0.619788, -1.635969, 1, 0.682353, 0, 1,
-1.246695, 0.9421199, -0.5202405, 1, 0.6901961, 0, 1,
-1.226784, -0.3266844, -0.03251658, 1, 0.6941177, 0, 1,
-1.224828, 0.6659371, -1.501523, 1, 0.7019608, 0, 1,
-1.218686, -2.199053, -3.146685, 1, 0.7098039, 0, 1,
-1.212044, 0.5018135, 1.282436, 1, 0.7137255, 0, 1,
-1.210699, -0.6088554, 0.7318537, 1, 0.7215686, 0, 1,
-1.209726, -0.4800863, -1.8932, 1, 0.7254902, 0, 1,
-1.208678, 0.3675391, -0.6806922, 1, 0.7333333, 0, 1,
-1.204745, -0.0004249631, -2.139519, 1, 0.7372549, 0, 1,
-1.203525, -0.1990584, -0.3348648, 1, 0.7450981, 0, 1,
-1.199509, -0.1487914, -2.186948, 1, 0.7490196, 0, 1,
-1.196837, -0.7679579, -2.931581, 1, 0.7568628, 0, 1,
-1.19074, -0.0004722159, -0.7803892, 1, 0.7607843, 0, 1,
-1.185046, 0.7948825, -1.699946, 1, 0.7686275, 0, 1,
-1.183812, 1.316677, -3.564378, 1, 0.772549, 0, 1,
-1.171049, -0.109227, -1.093245, 1, 0.7803922, 0, 1,
-1.167823, 0.2868642, -2.388445, 1, 0.7843137, 0, 1,
-1.159408, -0.5353197, -1.581088, 1, 0.7921569, 0, 1,
-1.149788, -0.2733822, -0.08144502, 1, 0.7960784, 0, 1,
-1.144507, -0.9131322, -1.607577, 1, 0.8039216, 0, 1,
-1.142349, 0.5112005, -0.2720254, 1, 0.8117647, 0, 1,
-1.125081, 0.1748606, -1.264677, 1, 0.8156863, 0, 1,
-1.12468, -0.1445086, -1.541527, 1, 0.8235294, 0, 1,
-1.118395, 1.789311, -0.9211842, 1, 0.827451, 0, 1,
-1.114797, 1.400701, 0.4495434, 1, 0.8352941, 0, 1,
-1.114167, 2.104815, -0.05210273, 1, 0.8392157, 0, 1,
-1.112579, 1.083707, 0.3576178, 1, 0.8470588, 0, 1,
-1.107021, -0.6095588, -2.457096, 1, 0.8509804, 0, 1,
-1.101186, 0.08753126, -1.512457, 1, 0.8588235, 0, 1,
-1.07884, -1.258537, -0.7124932, 1, 0.8627451, 0, 1,
-1.076293, 0.3082954, 0.5702068, 1, 0.8705882, 0, 1,
-1.073398, 1.351193, -1.19309, 1, 0.8745098, 0, 1,
-1.070027, 0.3618698, -0.03421738, 1, 0.8823529, 0, 1,
-1.069624, 0.6227816, 1.413339, 1, 0.8862745, 0, 1,
-1.068274, 1.33508, -0.7520515, 1, 0.8941177, 0, 1,
-1.061722, 1.108777, -1.632138, 1, 0.8980392, 0, 1,
-1.059513, 0.6932689, 0.8426374, 1, 0.9058824, 0, 1,
-1.058482, -1.219495, -0.8735234, 1, 0.9137255, 0, 1,
-1.058305, -1.04983, -1.407768, 1, 0.9176471, 0, 1,
-1.05056, -0.5619714, -3.105418, 1, 0.9254902, 0, 1,
-1.049284, -0.1418054, -2.256956, 1, 0.9294118, 0, 1,
-1.037314, -2.171789, -2.240102, 1, 0.9372549, 0, 1,
-1.036051, 0.4087052, -2.022705, 1, 0.9411765, 0, 1,
-1.03491, 2.24487, -1.660362, 1, 0.9490196, 0, 1,
-1.033884, -1.011014, -2.660416, 1, 0.9529412, 0, 1,
-1.032009, -1.154446, -3.768579, 1, 0.9607843, 0, 1,
-1.027585, -1.099681, -2.445525, 1, 0.9647059, 0, 1,
-1.025601, 0.1713005, -1.425928, 1, 0.972549, 0, 1,
-1.025551, 1.802192, 0.1934263, 1, 0.9764706, 0, 1,
-1.024691, 0.7365766, -1.574227, 1, 0.9843137, 0, 1,
-1.023556, -0.5538509, -2.265173, 1, 0.9882353, 0, 1,
-1.023143, 0.3253208, -1.339191, 1, 0.9960784, 0, 1,
-1.012973, 0.4194098, -1.11367, 0.9960784, 1, 0, 1,
-1.011942, 0.1874024, -1.725383, 0.9921569, 1, 0, 1,
-1.011719, -0.05425256, 0.5831293, 0.9843137, 1, 0, 1,
-1.010712, 1.750981, 0.5827957, 0.9803922, 1, 0, 1,
-1.007435, -1.321369, -1.967191, 0.972549, 1, 0, 1,
-0.9952156, 1.284341, -0.3638928, 0.9686275, 1, 0, 1,
-0.9935194, -1.029742, -2.313775, 0.9607843, 1, 0, 1,
-0.9901701, 2.159185, -0.5776666, 0.9568627, 1, 0, 1,
-0.9884847, -0.008400974, -1.372021, 0.9490196, 1, 0, 1,
-0.9867777, 0.1385128, -0.8590124, 0.945098, 1, 0, 1,
-0.9803065, -0.7056141, -1.336755, 0.9372549, 1, 0, 1,
-0.9747397, -1.471558, -3.854463, 0.9333333, 1, 0, 1,
-0.9745126, 0.2178813, 0.6025566, 0.9254902, 1, 0, 1,
-0.9701245, 0.2329423, -2.18639, 0.9215686, 1, 0, 1,
-0.964058, -1.313082, -1.563426, 0.9137255, 1, 0, 1,
-0.9631195, -0.1754892, -0.7918627, 0.9098039, 1, 0, 1,
-0.9626142, -0.791226, -3.011317, 0.9019608, 1, 0, 1,
-0.9604183, -0.2099812, -1.767494, 0.8941177, 1, 0, 1,
-0.9595802, -0.2036406, -1.669836, 0.8901961, 1, 0, 1,
-0.9538817, 0.3231669, -2.045344, 0.8823529, 1, 0, 1,
-0.9515144, 1.241167, 0.2134519, 0.8784314, 1, 0, 1,
-0.9389675, 0.2370771, -1.125403, 0.8705882, 1, 0, 1,
-0.8985572, 0.4181935, -1.895562, 0.8666667, 1, 0, 1,
-0.8947443, 1.473113, -0.9824232, 0.8588235, 1, 0, 1,
-0.8931352, -0.8076593, -3.671962, 0.854902, 1, 0, 1,
-0.8910502, -0.2637751, 0.06007554, 0.8470588, 1, 0, 1,
-0.8860287, 0.4770931, -1.043062, 0.8431373, 1, 0, 1,
-0.88036, 1.219993, -1.242646, 0.8352941, 1, 0, 1,
-0.8678635, 0.1105924, -2.751602, 0.8313726, 1, 0, 1,
-0.8601201, 0.1060894, -2.466515, 0.8235294, 1, 0, 1,
-0.8589299, -1.312765, -1.66235, 0.8196079, 1, 0, 1,
-0.8583544, 0.6246621, -1.083723, 0.8117647, 1, 0, 1,
-0.8580745, 0.6001791, 1.780985, 0.8078431, 1, 0, 1,
-0.850997, 0.2058912, -1.535954, 0.8, 1, 0, 1,
-0.8482502, 1.276532, -1.061573, 0.7921569, 1, 0, 1,
-0.8479403, -1.353071, -1.080191, 0.7882353, 1, 0, 1,
-0.8416721, -0.6308712, -1.803164, 0.7803922, 1, 0, 1,
-0.8340017, 0.9591677, -1.287255, 0.7764706, 1, 0, 1,
-0.8323863, -0.4284181, -1.582123, 0.7686275, 1, 0, 1,
-0.8258631, 0.2067426, -1.853196, 0.7647059, 1, 0, 1,
-0.8198884, 0.4169873, -2.687513, 0.7568628, 1, 0, 1,
-0.8096051, 0.2434855, -1.349948, 0.7529412, 1, 0, 1,
-0.8077516, 0.514217, 0.6673992, 0.7450981, 1, 0, 1,
-0.8045593, -0.228054, -1.239898, 0.7411765, 1, 0, 1,
-0.7939103, -0.5740018, -3.176883, 0.7333333, 1, 0, 1,
-0.7915531, 0.4534861, -2.067643, 0.7294118, 1, 0, 1,
-0.7913632, -0.4967793, -2.443265, 0.7215686, 1, 0, 1,
-0.7860197, -0.04511474, -0.9892661, 0.7176471, 1, 0, 1,
-0.7844258, 0.4849972, -0.5611315, 0.7098039, 1, 0, 1,
-0.7783344, -0.1312775, -2.869512, 0.7058824, 1, 0, 1,
-0.7750746, 0.2403117, -2.577778, 0.6980392, 1, 0, 1,
-0.7735974, 0.3720515, -3.550994, 0.6901961, 1, 0, 1,
-0.7707669, -0.6708814, -3.273322, 0.6862745, 1, 0, 1,
-0.7682328, -1.063638, -3.724092, 0.6784314, 1, 0, 1,
-0.7597476, 2.677386, -1.881456, 0.6745098, 1, 0, 1,
-0.7579023, 0.5178822, -1.469682, 0.6666667, 1, 0, 1,
-0.7566666, -0.1866577, -1.236449, 0.6627451, 1, 0, 1,
-0.7487887, -1.301981, -1.243264, 0.654902, 1, 0, 1,
-0.7474401, -0.8516093, -4.074621, 0.6509804, 1, 0, 1,
-0.7472672, 0.7107216, -0.54206, 0.6431373, 1, 0, 1,
-0.7456182, 0.6494388, 1.60692, 0.6392157, 1, 0, 1,
-0.7381369, -0.9746157, -2.176844, 0.6313726, 1, 0, 1,
-0.7313724, -1.152712, -1.478223, 0.627451, 1, 0, 1,
-0.7243283, 0.1017766, -2.022242, 0.6196079, 1, 0, 1,
-0.7214564, 0.09251339, -2.200508, 0.6156863, 1, 0, 1,
-0.7201664, -1.755336, -2.987183, 0.6078432, 1, 0, 1,
-0.7140293, 1.165109, -0.1422735, 0.6039216, 1, 0, 1,
-0.7121147, -0.7387134, -3.284287, 0.5960785, 1, 0, 1,
-0.7011974, -1.047396, -5.46175, 0.5882353, 1, 0, 1,
-0.6909866, -0.007715361, -1.76075, 0.5843138, 1, 0, 1,
-0.6863862, 1.500625, 0.2249073, 0.5764706, 1, 0, 1,
-0.6856898, 0.4385529, -2.616824, 0.572549, 1, 0, 1,
-0.6846245, -1.631231, -3.781687, 0.5647059, 1, 0, 1,
-0.6832056, -0.08454716, -3.482019, 0.5607843, 1, 0, 1,
-0.677756, 0.3518597, -1.617268, 0.5529412, 1, 0, 1,
-0.6777471, -0.2344582, -2.705832, 0.5490196, 1, 0, 1,
-0.6772512, 0.2257745, -1.853047, 0.5411765, 1, 0, 1,
-0.6742421, 0.9170904, -0.563135, 0.5372549, 1, 0, 1,
-0.673565, 0.9724633, -0.5407231, 0.5294118, 1, 0, 1,
-0.6676566, 1.041852, -0.4527451, 0.5254902, 1, 0, 1,
-0.6663037, -0.5963037, -2.673005, 0.5176471, 1, 0, 1,
-0.6652766, -2.941626, -2.737587, 0.5137255, 1, 0, 1,
-0.6632898, -0.2159838, -1.620865, 0.5058824, 1, 0, 1,
-0.6625062, 0.3576704, -0.5555245, 0.5019608, 1, 0, 1,
-0.6557443, 0.2245399, -0.9447349, 0.4941176, 1, 0, 1,
-0.651751, -0.514783, -0.8342251, 0.4862745, 1, 0, 1,
-0.6513253, 2.071641, -0.7771631, 0.4823529, 1, 0, 1,
-0.6503831, 0.6158572, 1.120792, 0.4745098, 1, 0, 1,
-0.6463323, -0.5666778, -2.899067, 0.4705882, 1, 0, 1,
-0.6452191, 2.035954, -0.1497137, 0.4627451, 1, 0, 1,
-0.6430478, 1.000698, 0.4069057, 0.4588235, 1, 0, 1,
-0.6391922, -0.9272804, -2.141198, 0.4509804, 1, 0, 1,
-0.6385458, 1.370172, 0.29898, 0.4470588, 1, 0, 1,
-0.6377189, -0.2832712, -1.569681, 0.4392157, 1, 0, 1,
-0.6366173, 0.5154666, -0.01386663, 0.4352941, 1, 0, 1,
-0.6357673, -1.531663, -2.736954, 0.427451, 1, 0, 1,
-0.6348588, -0.1938904, -0.9465541, 0.4235294, 1, 0, 1,
-0.6301289, -0.5912176, -3.163195, 0.4156863, 1, 0, 1,
-0.6298692, 0.2222984, -2.682917, 0.4117647, 1, 0, 1,
-0.6226048, 0.3930766, 1.066328, 0.4039216, 1, 0, 1,
-0.6205841, -0.3970727, -3.325409, 0.3960784, 1, 0, 1,
-0.6069577, 0.2808416, -1.345356, 0.3921569, 1, 0, 1,
-0.6035163, -0.9553899, -2.273975, 0.3843137, 1, 0, 1,
-0.5980402, -1.408493, -2.29664, 0.3803922, 1, 0, 1,
-0.5968499, -1.940482, -2.307947, 0.372549, 1, 0, 1,
-0.5938385, -1.457663, -3.537486, 0.3686275, 1, 0, 1,
-0.5928873, 1.169023, 0.7048101, 0.3607843, 1, 0, 1,
-0.5910387, 0.2304849, -2.728451, 0.3568628, 1, 0, 1,
-0.5899076, -0.3035703, -3.723687, 0.3490196, 1, 0, 1,
-0.5880396, 0.9259958, -2.131339, 0.345098, 1, 0, 1,
-0.5877911, 0.06073638, -1.867567, 0.3372549, 1, 0, 1,
-0.5859035, -0.8260244, -2.381564, 0.3333333, 1, 0, 1,
-0.5847334, -1.25759, -0.1480351, 0.3254902, 1, 0, 1,
-0.5832533, -0.2585974, -3.043212, 0.3215686, 1, 0, 1,
-0.5822076, 0.1745515, -2.543644, 0.3137255, 1, 0, 1,
-0.5791446, 0.237162, -0.5131366, 0.3098039, 1, 0, 1,
-0.578556, -0.0989987, -1.474441, 0.3019608, 1, 0, 1,
-0.5783117, -0.1922712, -0.6287397, 0.2941177, 1, 0, 1,
-0.5780876, 1.100448, -1.519412, 0.2901961, 1, 0, 1,
-0.5772551, 0.1922647, -1.973824, 0.282353, 1, 0, 1,
-0.5771573, -0.8005059, -1.851335, 0.2784314, 1, 0, 1,
-0.5746928, 0.2166931, -4.334809, 0.2705882, 1, 0, 1,
-0.5746838, 0.58494, -0.7774724, 0.2666667, 1, 0, 1,
-0.5737025, 1.143492, 1.294305, 0.2588235, 1, 0, 1,
-0.5731911, 0.3309392, -0.4163107, 0.254902, 1, 0, 1,
-0.5685226, 0.07736548, -1.711916, 0.2470588, 1, 0, 1,
-0.5669183, -0.8645058, -2.61551, 0.2431373, 1, 0, 1,
-0.5583839, -0.3324166, -0.3208312, 0.2352941, 1, 0, 1,
-0.5576597, 0.4557595, -0.1356239, 0.2313726, 1, 0, 1,
-0.5559709, -0.5096929, -2.870558, 0.2235294, 1, 0, 1,
-0.5540985, 0.02793152, -1.154932, 0.2196078, 1, 0, 1,
-0.5519802, 0.6077237, -0.9865184, 0.2117647, 1, 0, 1,
-0.5487327, 1.908299, -0.9767192, 0.2078431, 1, 0, 1,
-0.5370846, 0.3208405, -2.184273, 0.2, 1, 0, 1,
-0.5370404, -2.098767, -4.060424, 0.1921569, 1, 0, 1,
-0.5347585, -0.5529151, -3.81339, 0.1882353, 1, 0, 1,
-0.5328797, 0.5900759, -0.06129377, 0.1803922, 1, 0, 1,
-0.527431, 1.12049, -1.197477, 0.1764706, 1, 0, 1,
-0.5266369, -0.8154677, -2.901588, 0.1686275, 1, 0, 1,
-0.5199871, 0.2107882, -1.337537, 0.1647059, 1, 0, 1,
-0.5198169, 0.1874337, -1.96706, 0.1568628, 1, 0, 1,
-0.5170631, 0.8117594, 0.1221288, 0.1529412, 1, 0, 1,
-0.5160192, 0.7657773, 0.3220024, 0.145098, 1, 0, 1,
-0.5146576, 1.493784, 0.2838556, 0.1411765, 1, 0, 1,
-0.5137084, 1.647972, 0.6113616, 0.1333333, 1, 0, 1,
-0.5132618, 0.8556274, -2.251821, 0.1294118, 1, 0, 1,
-0.5102661, 0.5994635, -2.065444, 0.1215686, 1, 0, 1,
-0.5062037, -0.2381402, -2.216539, 0.1176471, 1, 0, 1,
-0.5061672, 1.086249, -0.8117452, 0.1098039, 1, 0, 1,
-0.5017632, -0.3304161, -1.949206, 0.1058824, 1, 0, 1,
-0.4993044, -1.10694, -2.872784, 0.09803922, 1, 0, 1,
-0.4929553, -0.944845, -3.01935, 0.09019608, 1, 0, 1,
-0.4917774, -1.979019, -1.481768, 0.08627451, 1, 0, 1,
-0.489888, -1.516996, -2.792831, 0.07843138, 1, 0, 1,
-0.4856845, -1.244018, -0.3843679, 0.07450981, 1, 0, 1,
-0.4833146, 1.807552, -0.9581773, 0.06666667, 1, 0, 1,
-0.4831808, -0.7338369, -0.2427393, 0.0627451, 1, 0, 1,
-0.483082, 0.2162934, -0.2950157, 0.05490196, 1, 0, 1,
-0.482406, 0.9984514, -1.719926, 0.05098039, 1, 0, 1,
-0.4821411, 0.2502171, -1.50703, 0.04313726, 1, 0, 1,
-0.4797389, 2.014426, -1.167694, 0.03921569, 1, 0, 1,
-0.478908, 0.9323518, 0.0477747, 0.03137255, 1, 0, 1,
-0.4779597, 1.666039, -1.743708, 0.02745098, 1, 0, 1,
-0.4673665, 0.02082498, -2.427483, 0.01960784, 1, 0, 1,
-0.4606849, 0.6896909, -1.116447, 0.01568628, 1, 0, 1,
-0.4567695, -0.2381256, -1.456834, 0.007843138, 1, 0, 1,
-0.4546995, 1.73322, 0.3964262, 0.003921569, 1, 0, 1,
-0.4532738, 0.3878336, -1.97171, 0, 1, 0.003921569, 1,
-0.4503176, 0.6546279, -0.2473285, 0, 1, 0.01176471, 1,
-0.4446236, 0.101963, -0.5360924, 0, 1, 0.01568628, 1,
-0.4445137, 1.236387, 0.2912548, 0, 1, 0.02352941, 1,
-0.4399044, -0.9938771, -3.120455, 0, 1, 0.02745098, 1,
-0.4363087, -0.627953, -4.193944, 0, 1, 0.03529412, 1,
-0.4291792, -0.8960103, -3.101681, 0, 1, 0.03921569, 1,
-0.4254948, -1.076943, -3.6508, 0, 1, 0.04705882, 1,
-0.4237359, 0.2669044, -0.4083491, 0, 1, 0.05098039, 1,
-0.4223846, -0.3309218, -2.354747, 0, 1, 0.05882353, 1,
-0.421971, -0.2130366, -3.00382, 0, 1, 0.0627451, 1,
-0.4203008, 0.03710523, -0.6642144, 0, 1, 0.07058824, 1,
-0.4172327, 0.6980178, -0.08010142, 0, 1, 0.07450981, 1,
-0.4168409, -0.3201555, -3.133336, 0, 1, 0.08235294, 1,
-0.4167581, 0.2141118, -0.7724378, 0, 1, 0.08627451, 1,
-0.4139249, -0.7535803, -2.039026, 0, 1, 0.09411765, 1,
-0.4097203, -0.3886096, -3.252452, 0, 1, 0.1019608, 1,
-0.4060676, 1.119012, -1.841552, 0, 1, 0.1058824, 1,
-0.4055113, 1.065974, 0.5973641, 0, 1, 0.1137255, 1,
-0.4021715, 0.7555487, -1.448769, 0, 1, 0.1176471, 1,
-0.3949532, 0.3555795, -1.066251, 0, 1, 0.1254902, 1,
-0.3929183, -0.4140526, -2.3756, 0, 1, 0.1294118, 1,
-0.3917266, -1.399475, -2.235978, 0, 1, 0.1372549, 1,
-0.3849248, -1.058869, -3.806522, 0, 1, 0.1411765, 1,
-0.3803764, 0.2161961, -3.678025, 0, 1, 0.1490196, 1,
-0.374359, -0.8373978, -3.416042, 0, 1, 0.1529412, 1,
-0.3712137, -0.7391505, -1.09054, 0, 1, 0.1607843, 1,
-0.3688364, 0.4186543, 0.4640432, 0, 1, 0.1647059, 1,
-0.3670272, 0.4942692, 1.429331, 0, 1, 0.172549, 1,
-0.3668173, 0.5067316, -0.2871695, 0, 1, 0.1764706, 1,
-0.3644176, 0.02073355, -1.616245, 0, 1, 0.1843137, 1,
-0.3565079, 0.6532488, 0.4588867, 0, 1, 0.1882353, 1,
-0.3488146, 0.3551979, 0.1223109, 0, 1, 0.1960784, 1,
-0.3464978, 0.4978185, 0.03410216, 0, 1, 0.2039216, 1,
-0.3360474, -0.2226274, -4.362566, 0, 1, 0.2078431, 1,
-0.335481, -0.3321857, -2.231598, 0, 1, 0.2156863, 1,
-0.3349754, 1.356349, -0.9122418, 0, 1, 0.2196078, 1,
-0.3342984, -0.3333131, -2.327076, 0, 1, 0.227451, 1,
-0.3340545, -1.231489, -2.066831, 0, 1, 0.2313726, 1,
-0.3318716, -0.8467193, -3.211791, 0, 1, 0.2392157, 1,
-0.3268154, 0.9199548, -1.400281, 0, 1, 0.2431373, 1,
-0.3196979, 0.2360594, -0.2443503, 0, 1, 0.2509804, 1,
-0.3191427, 0.4443037, -0.5759057, 0, 1, 0.254902, 1,
-0.3140534, -0.07870843, -2.350613, 0, 1, 0.2627451, 1,
-0.3102995, -0.627628, -3.466644, 0, 1, 0.2666667, 1,
-0.3075759, 0.5975379, 0.02176913, 0, 1, 0.2745098, 1,
-0.3055431, -0.6153205, -2.027095, 0, 1, 0.2784314, 1,
-0.3038872, 1.174081, -1.732533, 0, 1, 0.2862745, 1,
-0.3021502, -0.3980474, -2.391412, 0, 1, 0.2901961, 1,
-0.2988297, -0.3190511, -3.199073, 0, 1, 0.2980392, 1,
-0.2953728, -0.5590552, -2.746426, 0, 1, 0.3058824, 1,
-0.2928471, 1.194828, -1.892404, 0, 1, 0.3098039, 1,
-0.2871484, 0.5911447, -0.3781922, 0, 1, 0.3176471, 1,
-0.2859344, -0.235487, -3.931753, 0, 1, 0.3215686, 1,
-0.2849175, 0.1250028, -3.38785, 0, 1, 0.3294118, 1,
-0.2846846, 0.100707, 1.208296, 0, 1, 0.3333333, 1,
-0.2845867, -0.2574724, -2.765202, 0, 1, 0.3411765, 1,
-0.2838517, -0.1505368, -1.280066, 0, 1, 0.345098, 1,
-0.282633, -0.4965693, -2.736644, 0, 1, 0.3529412, 1,
-0.2812076, 0.07731324, -0.6923299, 0, 1, 0.3568628, 1,
-0.2811692, -2.298779, -4.124443, 0, 1, 0.3647059, 1,
-0.2808861, 0.07940687, -3.021416, 0, 1, 0.3686275, 1,
-0.2776523, -0.2200407, -3.420105, 0, 1, 0.3764706, 1,
-0.2733999, -0.53928, -2.572388, 0, 1, 0.3803922, 1,
-0.2722277, -0.3870138, -2.134592, 0, 1, 0.3882353, 1,
-0.2710305, 0.2257775, 1.167488, 0, 1, 0.3921569, 1,
-0.2611633, -0.9595563, -2.586951, 0, 1, 0.4, 1,
-0.2607006, -0.1247488, -0.4020011, 0, 1, 0.4078431, 1,
-0.2573098, -0.8853669, -4.041304, 0, 1, 0.4117647, 1,
-0.2561505, -0.6566019, -3.070099, 0, 1, 0.4196078, 1,
-0.2557053, 0.4703626, 0.1913107, 0, 1, 0.4235294, 1,
-0.2544758, -1.026343, -3.888837, 0, 1, 0.4313726, 1,
-0.2528266, 0.9815517, -0.6857934, 0, 1, 0.4352941, 1,
-0.2515051, 0.8401635, -1.310132, 0, 1, 0.4431373, 1,
-0.2514151, 1.275369, 1.762963, 0, 1, 0.4470588, 1,
-0.2501823, -1.024004, -5.05524, 0, 1, 0.454902, 1,
-0.2473792, 0.6521481, -2.254202, 0, 1, 0.4588235, 1,
-0.2432826, -0.9698799, -2.096667, 0, 1, 0.4666667, 1,
-0.2423153, -0.3503918, -3.723291, 0, 1, 0.4705882, 1,
-0.2387237, 2.731188, -1.607635, 0, 1, 0.4784314, 1,
-0.2379224, -0.9081497, -5.971064, 0, 1, 0.4823529, 1,
-0.2357806, -0.1878985, -0.958768, 0, 1, 0.4901961, 1,
-0.2354144, -1.224412, -3.756661, 0, 1, 0.4941176, 1,
-0.2271487, 0.3227021, 1.125318, 0, 1, 0.5019608, 1,
-0.2234557, -1.061341, -2.272342, 0, 1, 0.509804, 1,
-0.2138932, 0.6333346, 1.209562, 0, 1, 0.5137255, 1,
-0.2128999, -1.460718, -3.911385, 0, 1, 0.5215687, 1,
-0.2109826, 0.3959511, -1.883532, 0, 1, 0.5254902, 1,
-0.2109066, 1.022439, 1.384359, 0, 1, 0.5333334, 1,
-0.2105072, 0.542029, -0.08521817, 0, 1, 0.5372549, 1,
-0.2090885, 0.009461874, -2.365839, 0, 1, 0.5450981, 1,
-0.2074976, -2.129812, -3.303362, 0, 1, 0.5490196, 1,
-0.2067848, -0.00490775, 0.1441903, 0, 1, 0.5568628, 1,
-0.2016802, -0.1812019, -2.262871, 0, 1, 0.5607843, 1,
-0.2015884, 0.7222537, -1.786814, 0, 1, 0.5686275, 1,
-0.1926423, -0.003112115, -0.184239, 0, 1, 0.572549, 1,
-0.1898621, 1.189551, 0.4455499, 0, 1, 0.5803922, 1,
-0.189226, 1.187931, -3.051903, 0, 1, 0.5843138, 1,
-0.1858702, -0.4076481, -1.760207, 0, 1, 0.5921569, 1,
-0.1847781, -0.4978958, 0.205924, 0, 1, 0.5960785, 1,
-0.178376, -1.458769, -3.508069, 0, 1, 0.6039216, 1,
-0.1766325, 1.108949, 0.2904775, 0, 1, 0.6117647, 1,
-0.1744728, 0.996756, -0.2949971, 0, 1, 0.6156863, 1,
-0.1731997, -1.733191, -4.897969, 0, 1, 0.6235294, 1,
-0.1728373, 0.6548078, 0.320048, 0, 1, 0.627451, 1,
-0.1728243, 0.9046549, -0.5120886, 0, 1, 0.6352941, 1,
-0.1720208, 1.209923, -0.1338297, 0, 1, 0.6392157, 1,
-0.1710668, 1.236912, -0.7925848, 0, 1, 0.6470588, 1,
-0.170242, 0.6421947, -0.4459679, 0, 1, 0.6509804, 1,
-0.1696291, 0.3312035, 0.5759346, 0, 1, 0.6588235, 1,
-0.1686921, -0.6798924, -2.711203, 0, 1, 0.6627451, 1,
-0.168179, 2.096481, 1.691647, 0, 1, 0.6705883, 1,
-0.168176, 1.353384, 1.695197, 0, 1, 0.6745098, 1,
-0.1672431, 1.597217, -1.264031, 0, 1, 0.682353, 1,
-0.1657632, 0.7761496, -0.0693, 0, 1, 0.6862745, 1,
-0.1648919, 0.7406051, -0.1562164, 0, 1, 0.6941177, 1,
-0.1646104, -1.060462, -1.939193, 0, 1, 0.7019608, 1,
-0.1639378, 0.6107317, 1.077529, 0, 1, 0.7058824, 1,
-0.1624813, -0.5319158, -2.94056, 0, 1, 0.7137255, 1,
-0.1576857, 0.9040784, -0.7403536, 0, 1, 0.7176471, 1,
-0.1568435, 1.298046, -0.2904167, 0, 1, 0.7254902, 1,
-0.1557454, 0.7478887, -0.06933266, 0, 1, 0.7294118, 1,
-0.1551348, 1.287195, 0.1834578, 0, 1, 0.7372549, 1,
-0.153325, 0.4519309, -1.386907, 0, 1, 0.7411765, 1,
-0.1506755, 0.03599792, -2.807653, 0, 1, 0.7490196, 1,
-0.1502974, -1.701603, -1.295302, 0, 1, 0.7529412, 1,
-0.149038, -0.4154126, -2.43942, 0, 1, 0.7607843, 1,
-0.1465316, -0.2484736, -2.452377, 0, 1, 0.7647059, 1,
-0.1453511, -0.338369, -2.891906, 0, 1, 0.772549, 1,
-0.1448771, -0.3371939, -2.88264, 0, 1, 0.7764706, 1,
-0.1426055, -2.153941, -2.885018, 0, 1, 0.7843137, 1,
-0.1391544, 1.231538, 0.8373925, 0, 1, 0.7882353, 1,
-0.1380409, 0.2287162, 2.406649, 0, 1, 0.7960784, 1,
-0.1379215, -0.04169529, -2.251226, 0, 1, 0.8039216, 1,
-0.1376033, -0.9972099, -2.562293, 0, 1, 0.8078431, 1,
-0.1365394, -0.522074, -2.988594, 0, 1, 0.8156863, 1,
-0.134653, -1.287754, -3.258629, 0, 1, 0.8196079, 1,
-0.134596, 1.356163, 0.8231028, 0, 1, 0.827451, 1,
-0.1309586, -0.1052101, -1.488125, 0, 1, 0.8313726, 1,
-0.1304161, 0.5635029, 0.4184412, 0, 1, 0.8392157, 1,
-0.1296099, -0.3868707, -1.582773, 0, 1, 0.8431373, 1,
-0.1284238, 0.6706131, -0.5494287, 0, 1, 0.8509804, 1,
-0.1238451, -1.384144, -2.337679, 0, 1, 0.854902, 1,
-0.1176654, 0.4077584, -0.1788886, 0, 1, 0.8627451, 1,
-0.1164191, 0.6312348, -0.4725607, 0, 1, 0.8666667, 1,
-0.114334, -0.3337624, -3.950119, 0, 1, 0.8745098, 1,
-0.1130799, -0.3068369, -3.374249, 0, 1, 0.8784314, 1,
-0.104476, 0.8101737, -6.559122e-05, 0, 1, 0.8862745, 1,
-0.1008654, -1.837558, -1.156315, 0, 1, 0.8901961, 1,
-0.09949044, 1.104037, 0.6053977, 0, 1, 0.8980392, 1,
-0.09908746, -0.09332737, -2.179236, 0, 1, 0.9058824, 1,
-0.09262362, -2.331097, -4.021008, 0, 1, 0.9098039, 1,
-0.08692856, -1.902179, -3.380804, 0, 1, 0.9176471, 1,
-0.08549594, -0.7253944, -4.250199, 0, 1, 0.9215686, 1,
-0.07911807, -1.349634, -0.6358563, 0, 1, 0.9294118, 1,
-0.07609901, 0.06186661, -1.895176, 0, 1, 0.9333333, 1,
-0.07592859, 0.1486613, -2.733429, 0, 1, 0.9411765, 1,
-0.0726494, -0.6227039, -1.197847, 0, 1, 0.945098, 1,
-0.0715013, 0.04776571, -1.436533, 0, 1, 0.9529412, 1,
-0.07079885, 0.4750362, -1.869117, 0, 1, 0.9568627, 1,
-0.06970258, -0.1836939, -2.481107, 0, 1, 0.9647059, 1,
-0.06380972, -0.5715788, -2.904517, 0, 1, 0.9686275, 1,
-0.06051703, -0.4868237, -2.216714, 0, 1, 0.9764706, 1,
-0.05475006, -0.6192069, -2.989404, 0, 1, 0.9803922, 1,
-0.04329534, -1.463326, -1.5628, 0, 1, 0.9882353, 1,
-0.0431169, 0.365707, -2.078932, 0, 1, 0.9921569, 1,
-0.0428257, -0.5446032, -2.728826, 0, 1, 1, 1,
-0.04276505, 0.26764, -0.3170773, 0, 0.9921569, 1, 1,
-0.04088434, -2.156023, -3.670128, 0, 0.9882353, 1, 1,
-0.04058099, 0.3229599, -0.8023297, 0, 0.9803922, 1, 1,
-0.03787585, 1.26321, -1.095205, 0, 0.9764706, 1, 1,
-0.0368304, -1.4033, -2.483302, 0, 0.9686275, 1, 1,
-0.03441606, 1.248614, -0.9145265, 0, 0.9647059, 1, 1,
-0.02666108, 0.006798547, -0.7644028, 0, 0.9568627, 1, 1,
-0.01959674, -0.4611564, -2.681907, 0, 0.9529412, 1, 1,
-0.01405277, 0.1106746, -0.5507856, 0, 0.945098, 1, 1,
-0.01403419, 0.5729993, -0.2496136, 0, 0.9411765, 1, 1,
-0.01371876, 0.02179013, -1.096576, 0, 0.9333333, 1, 1,
-0.01180477, -0.09787668, -3.394419, 0, 0.9294118, 1, 1,
-0.008651702, 0.2374599, -0.09034614, 0, 0.9215686, 1, 1,
0.0005530947, -0.4895571, 1.900454, 0, 0.9176471, 1, 1,
0.002839888, -0.1024857, 2.580498, 0, 0.9098039, 1, 1,
0.01313338, 0.4013892, -2.197943, 0, 0.9058824, 1, 1,
0.01470716, 0.2609147, 0.3273279, 0, 0.8980392, 1, 1,
0.01707367, -0.2167428, 4.327462, 0, 0.8901961, 1, 1,
0.02071534, -0.3851894, 4.468344, 0, 0.8862745, 1, 1,
0.02310988, -0.2878001, 3.214901, 0, 0.8784314, 1, 1,
0.02420888, 0.8302024, 0.1303275, 0, 0.8745098, 1, 1,
0.02611518, 0.7995603, -0.8996787, 0, 0.8666667, 1, 1,
0.0264505, -0.9307045, 3.975896, 0, 0.8627451, 1, 1,
0.02828362, 0.1073729, -1.203753, 0, 0.854902, 1, 1,
0.0290317, 1.414126, 1.130737, 0, 0.8509804, 1, 1,
0.03234344, -1.371578, 3.301614, 0, 0.8431373, 1, 1,
0.03549441, -1.031214, 3.883219, 0, 0.8392157, 1, 1,
0.03714033, -0.5484116, 2.1569, 0, 0.8313726, 1, 1,
0.04199163, 0.8399619, -0.4955684, 0, 0.827451, 1, 1,
0.04702251, -1.728122, 3.28084, 0, 0.8196079, 1, 1,
0.05133895, -2.585962, 2.818086, 0, 0.8156863, 1, 1,
0.05822791, 0.02516364, 1.961813, 0, 0.8078431, 1, 1,
0.06058461, -1.395777, 2.700067, 0, 0.8039216, 1, 1,
0.06308784, 1.044338, 0.374613, 0, 0.7960784, 1, 1,
0.06495541, 0.5981737, 0.8909695, 0, 0.7882353, 1, 1,
0.06555716, -0.7992938, 4.502884, 0, 0.7843137, 1, 1,
0.06802226, -0.528469, 4.002833, 0, 0.7764706, 1, 1,
0.0681534, -1.00229, 2.787344, 0, 0.772549, 1, 1,
0.06978097, 1.337429, -0.4064488, 0, 0.7647059, 1, 1,
0.07170791, -1.079239, 2.17348, 0, 0.7607843, 1, 1,
0.07510634, -0.6875024, 4.04114, 0, 0.7529412, 1, 1,
0.07628311, 2.219703, -0.4496279, 0, 0.7490196, 1, 1,
0.08169742, 2.328632, 0.8462013, 0, 0.7411765, 1, 1,
0.08178551, -0.7124754, 5.355844, 0, 0.7372549, 1, 1,
0.08385835, -1.619846, 1.917566, 0, 0.7294118, 1, 1,
0.08416685, 1.0087, -0.7240977, 0, 0.7254902, 1, 1,
0.09311984, -0.07430069, 2.862362, 0, 0.7176471, 1, 1,
0.09364679, 0.270326, -0.8424473, 0, 0.7137255, 1, 1,
0.0947916, -0.6839992, 1.995064, 0, 0.7058824, 1, 1,
0.09497026, 0.2872536, 0.4007721, 0, 0.6980392, 1, 1,
0.09539724, 0.4247723, 0.8686036, 0, 0.6941177, 1, 1,
0.09717697, 0.8314679, -0.6237617, 0, 0.6862745, 1, 1,
0.100293, -1.260877, 1.17313, 0, 0.682353, 1, 1,
0.1052049, 1.240193, 0.1469222, 0, 0.6745098, 1, 1,
0.1054837, -1.125973, 4.376073, 0, 0.6705883, 1, 1,
0.1055182, 0.1606081, 0.3086225, 0, 0.6627451, 1, 1,
0.1062161, 0.245452, -0.3395566, 0, 0.6588235, 1, 1,
0.1076273, 0.5102395, 1.506613, 0, 0.6509804, 1, 1,
0.108364, -0.07228474, 1.364806, 0, 0.6470588, 1, 1,
0.1120283, 0.767152, -0.02410073, 0, 0.6392157, 1, 1,
0.1132016, -2.083266, 1.590524, 0, 0.6352941, 1, 1,
0.1138038, 0.6936089, 0.5125486, 0, 0.627451, 1, 1,
0.1167446, -0.9049089, 3.405616, 0, 0.6235294, 1, 1,
0.1176352, -0.05874852, 3.018373, 0, 0.6156863, 1, 1,
0.1199582, -0.5844383, 2.373873, 0, 0.6117647, 1, 1,
0.125778, 0.2359781, -0.4883743, 0, 0.6039216, 1, 1,
0.127048, -0.928262, 3.9762, 0, 0.5960785, 1, 1,
0.127451, 0.0975977, 1.085719, 0, 0.5921569, 1, 1,
0.1341592, 0.617543, -0.2060062, 0, 0.5843138, 1, 1,
0.1348553, -0.1640288, 3.272597, 0, 0.5803922, 1, 1,
0.1375867, 0.700492, -0.09493124, 0, 0.572549, 1, 1,
0.1501632, -1.000578, 3.148231, 0, 0.5686275, 1, 1,
0.1516039, -1.791536, 2.595604, 0, 0.5607843, 1, 1,
0.1553034, -1.011868, 3.386263, 0, 0.5568628, 1, 1,
0.1571745, -0.6647305, 0.9854789, 0, 0.5490196, 1, 1,
0.1609016, -0.7241497, 3.375248, 0, 0.5450981, 1, 1,
0.161667, 0.6696951, 0.8750796, 0, 0.5372549, 1, 1,
0.1680911, 0.2836156, 1.894107, 0, 0.5333334, 1, 1,
0.1715782, -1.074425, 1.319696, 0, 0.5254902, 1, 1,
0.1720654, 0.2099387, 2.992538, 0, 0.5215687, 1, 1,
0.1721135, 0.6926372, 0.6309578, 0, 0.5137255, 1, 1,
0.1726112, -0.4950068, 2.4793, 0, 0.509804, 1, 1,
0.1728084, -0.4271321, 4.073789, 0, 0.5019608, 1, 1,
0.1765248, 1.225239, 0.3084033, 0, 0.4941176, 1, 1,
0.1786777, 0.479526, -0.5163777, 0, 0.4901961, 1, 1,
0.1793828, 0.8049825, 1.257738, 0, 0.4823529, 1, 1,
0.1828898, 0.9976246, -1.01966, 0, 0.4784314, 1, 1,
0.1872991, -2.568921, 3.402016, 0, 0.4705882, 1, 1,
0.1884728, -1.609964, 1.098782, 0, 0.4666667, 1, 1,
0.1906557, -1.242209, 3.082868, 0, 0.4588235, 1, 1,
0.1917564, 0.1678053, 2.163169, 0, 0.454902, 1, 1,
0.1933078, 0.9641904, 0.2513576, 0, 0.4470588, 1, 1,
0.1934182, 0.2864606, -0.1660706, 0, 0.4431373, 1, 1,
0.1935399, -0.4438531, 2.208414, 0, 0.4352941, 1, 1,
0.1938197, -1.766642, 4.003968, 0, 0.4313726, 1, 1,
0.2020468, -0.5580734, 3.805069, 0, 0.4235294, 1, 1,
0.2024914, -1.359716, 3.297145, 0, 0.4196078, 1, 1,
0.2030337, -1.013254, 3.627746, 0, 0.4117647, 1, 1,
0.2034398, 1.54856, 1.133023, 0, 0.4078431, 1, 1,
0.2098763, 1.321541, -0.2997224, 0, 0.4, 1, 1,
0.2117814, 0.01014742, 2.604179, 0, 0.3921569, 1, 1,
0.2120334, 0.4578442, 0.2630282, 0, 0.3882353, 1, 1,
0.212565, 0.7702399, 1.926575, 0, 0.3803922, 1, 1,
0.2161881, -0.08705164, 1.666339, 0, 0.3764706, 1, 1,
0.21788, -0.6593974, 2.950354, 0, 0.3686275, 1, 1,
0.2179198, 1.715247, 1.025929, 0, 0.3647059, 1, 1,
0.2195463, 0.1853764, 1.879599, 0, 0.3568628, 1, 1,
0.2213942, -0.7513018, 1.379288, 0, 0.3529412, 1, 1,
0.2241603, 0.4800455, -1.454511, 0, 0.345098, 1, 1,
0.2247094, -0.6286771, 2.240216, 0, 0.3411765, 1, 1,
0.2260304, 0.219234, 1.993983, 0, 0.3333333, 1, 1,
0.2278067, 0.9279613, -0.9959544, 0, 0.3294118, 1, 1,
0.2287986, -0.6658928, 2.898146, 0, 0.3215686, 1, 1,
0.2299861, -0.6294408, 3.846126, 0, 0.3176471, 1, 1,
0.2312454, -0.6791743, 4.327761, 0, 0.3098039, 1, 1,
0.2373306, 1.747602, -0.5687146, 0, 0.3058824, 1, 1,
0.2413952, -0.3786651, 3.648525, 0, 0.2980392, 1, 1,
0.2424958, 1.828829, 0.1289566, 0, 0.2901961, 1, 1,
0.2441105, 0.6400903, -1.292939, 0, 0.2862745, 1, 1,
0.2458948, 0.2044607, 0.7413774, 0, 0.2784314, 1, 1,
0.2475445, 2.032882, 0.5992702, 0, 0.2745098, 1, 1,
0.2480295, -1.076533, 3.338095, 0, 0.2666667, 1, 1,
0.2570962, -1.374993, 4.548306, 0, 0.2627451, 1, 1,
0.2646737, 2.345932, -1.522834, 0, 0.254902, 1, 1,
0.2695834, 0.4075483, -0.8297082, 0, 0.2509804, 1, 1,
0.2743031, 0.335365, 2.600497, 0, 0.2431373, 1, 1,
0.2751342, -2.839954, 3.115603, 0, 0.2392157, 1, 1,
0.2751757, 1.932334, -1.105771, 0, 0.2313726, 1, 1,
0.2820238, -0.4481584, 3.483979, 0, 0.227451, 1, 1,
0.2824745, 1.327353, 1.407778, 0, 0.2196078, 1, 1,
0.2940748, 0.7634857, -0.8127466, 0, 0.2156863, 1, 1,
0.296061, 0.9383322, 0.3568639, 0, 0.2078431, 1, 1,
0.2983861, -0.5635087, 3.563603, 0, 0.2039216, 1, 1,
0.3004643, -0.8590505, 3.204871, 0, 0.1960784, 1, 1,
0.3058545, -0.33384, 1.937023, 0, 0.1882353, 1, 1,
0.3133841, 0.5236035, -0.896562, 0, 0.1843137, 1, 1,
0.3134373, 0.1184663, 1.42485, 0, 0.1764706, 1, 1,
0.3193969, 0.1978871, -0.8952264, 0, 0.172549, 1, 1,
0.3194078, 0.2858593, 0.8930473, 0, 0.1647059, 1, 1,
0.3204985, -0.2037401, 1.989439, 0, 0.1607843, 1, 1,
0.3246916, -1.24523, 3.339497, 0, 0.1529412, 1, 1,
0.3284601, 0.6019267, -0.2948492, 0, 0.1490196, 1, 1,
0.3320251, -0.1745955, 1.267908, 0, 0.1411765, 1, 1,
0.3344035, -0.04980051, 2.035737, 0, 0.1372549, 1, 1,
0.3353157, 0.2606511, 1.290607, 0, 0.1294118, 1, 1,
0.3397057, 0.7488173, -0.3067884, 0, 0.1254902, 1, 1,
0.3478778, -0.1199626, 2.291981, 0, 0.1176471, 1, 1,
0.3518243, 2.144611, 0.5935103, 0, 0.1137255, 1, 1,
0.3555318, 0.1271033, 2.216513, 0, 0.1058824, 1, 1,
0.3587047, 0.9120209, 2.808768, 0, 0.09803922, 1, 1,
0.3602408, 0.9981117, -0.1436981, 0, 0.09411765, 1, 1,
0.3646071, 0.725323, -0.5312636, 0, 0.08627451, 1, 1,
0.3701724, 0.06910199, -0.2286261, 0, 0.08235294, 1, 1,
0.3708671, 1.277735, 1.313897, 0, 0.07450981, 1, 1,
0.3742501, 1.89875, 1.122778, 0, 0.07058824, 1, 1,
0.3747048, 0.1972741, 0.07931586, 0, 0.0627451, 1, 1,
0.3767043, -2.016778, 1.821073, 0, 0.05882353, 1, 1,
0.3781503, -0.7508008, 3.763827, 0, 0.05098039, 1, 1,
0.379814, -0.2177685, 1.944831, 0, 0.04705882, 1, 1,
0.380862, -0.6863825, 3.744492, 0, 0.03921569, 1, 1,
0.3817228, 0.4301935, 1.670114, 0, 0.03529412, 1, 1,
0.3820975, -1.960905, 2.332603, 0, 0.02745098, 1, 1,
0.3821613, -1.317028, 2.239178, 0, 0.02352941, 1, 1,
0.384115, -1.072427, 4.612731, 0, 0.01568628, 1, 1,
0.3856927, -1.108777, 2.067355, 0, 0.01176471, 1, 1,
0.3867205, 0.444208, 0.8029537, 0, 0.003921569, 1, 1,
0.3874851, -1.856631, 4.808457, 0.003921569, 0, 1, 1,
0.3886883, 0.5982656, -0.4769056, 0.007843138, 0, 1, 1,
0.3914246, 1.33854, 0.05169245, 0.01568628, 0, 1, 1,
0.3936763, 0.06654672, 0.9550346, 0.01960784, 0, 1, 1,
0.39484, -1.462162, 3.502023, 0.02745098, 0, 1, 1,
0.4067274, 0.6856074, -0.2208159, 0.03137255, 0, 1, 1,
0.4079286, -0.1808061, 2.067992, 0.03921569, 0, 1, 1,
0.4168062, -0.7916962, 2.689705, 0.04313726, 0, 1, 1,
0.4206277, -0.3996418, 2.36305, 0.05098039, 0, 1, 1,
0.4211091, 0.2764833, -1.406311, 0.05490196, 0, 1, 1,
0.423154, -1.460789, 2.595347, 0.0627451, 0, 1, 1,
0.4231748, 1.795503, 1.034623, 0.06666667, 0, 1, 1,
0.4251545, -0.8405648, 2.766715, 0.07450981, 0, 1, 1,
0.4256248, 0.4828628, 1.190091, 0.07843138, 0, 1, 1,
0.4358966, 0.7578964, 0.5896956, 0.08627451, 0, 1, 1,
0.4364832, 1.882056, -1.010543, 0.09019608, 0, 1, 1,
0.4375242, 1.486237, 1.996353, 0.09803922, 0, 1, 1,
0.4380536, -1.718352, 2.516906, 0.1058824, 0, 1, 1,
0.4394381, 0.05564239, 2.407617, 0.1098039, 0, 1, 1,
0.4400777, 1.373114, 0.6526015, 0.1176471, 0, 1, 1,
0.4410615, 1.087564, 1.838107, 0.1215686, 0, 1, 1,
0.4423927, 0.3658572, 1.471057, 0.1294118, 0, 1, 1,
0.4460407, 0.0187362, 2.801415, 0.1333333, 0, 1, 1,
0.4527878, 0.3299417, 0.6624321, 0.1411765, 0, 1, 1,
0.4534318, 1.794158, 0.1917706, 0.145098, 0, 1, 1,
0.45417, 0.2349426, -0.05067104, 0.1529412, 0, 1, 1,
0.454336, 1.516979, -0.5678197, 0.1568628, 0, 1, 1,
0.4627638, 2.689134, -1.032903, 0.1647059, 0, 1, 1,
0.4641715, -0.07863016, -0.6450149, 0.1686275, 0, 1, 1,
0.4670793, 0.9116728, 0.7865632, 0.1764706, 0, 1, 1,
0.4737955, 0.2691636, 0.2387008, 0.1803922, 0, 1, 1,
0.4832864, 0.4521028, -0.917285, 0.1882353, 0, 1, 1,
0.4875464, -0.4636526, 1.681464, 0.1921569, 0, 1, 1,
0.4877686, -1.095605, 3.912448, 0.2, 0, 1, 1,
0.4933331, 1.180505, 1.030904, 0.2078431, 0, 1, 1,
0.4933773, -0.676352, 3.959013, 0.2117647, 0, 1, 1,
0.4970024, -0.2449559, 1.771424, 0.2196078, 0, 1, 1,
0.4998389, -0.6133114, 3.152917, 0.2235294, 0, 1, 1,
0.5137568, 0.5097531, -0.03512433, 0.2313726, 0, 1, 1,
0.5151611, 0.09725551, 0.8431636, 0.2352941, 0, 1, 1,
0.5202922, 1.419999, -0.03922565, 0.2431373, 0, 1, 1,
0.5210168, 1.421081, 0.1525552, 0.2470588, 0, 1, 1,
0.5219091, 1.033852, 1.51057, 0.254902, 0, 1, 1,
0.5246162, 0.1562586, 1.757363, 0.2588235, 0, 1, 1,
0.5253137, -1.314228, 1.034819, 0.2666667, 0, 1, 1,
0.5272281, -1.257947, 3.370301, 0.2705882, 0, 1, 1,
0.5279239, 1.109481, -0.6614837, 0.2784314, 0, 1, 1,
0.5288283, 0.2289337, 0.877028, 0.282353, 0, 1, 1,
0.5291027, 1.399367, 0.5542639, 0.2901961, 0, 1, 1,
0.5300675, -0.1781031, 1.019541, 0.2941177, 0, 1, 1,
0.5326931, -0.2282562, 1.746569, 0.3019608, 0, 1, 1,
0.5329077, 0.6824545, 0.6363593, 0.3098039, 0, 1, 1,
0.5342479, 0.1193697, 0.7067599, 0.3137255, 0, 1, 1,
0.540707, 0.4448533, 1.154537, 0.3215686, 0, 1, 1,
0.5431059, 0.5110849, 1.083133, 0.3254902, 0, 1, 1,
0.543271, 0.5606783, 0.9852214, 0.3333333, 0, 1, 1,
0.5432786, -0.8042674, 1.110572, 0.3372549, 0, 1, 1,
0.5469547, 1.906863, 0.3031293, 0.345098, 0, 1, 1,
0.5580111, 2.149862, -0.7524506, 0.3490196, 0, 1, 1,
0.5631469, -0.5905478, -1.771747, 0.3568628, 0, 1, 1,
0.566744, 1.175542, 0.01282826, 0.3607843, 0, 1, 1,
0.5669724, 0.3475821, 1.926968, 0.3686275, 0, 1, 1,
0.5860823, 1.77916, -0.7637742, 0.372549, 0, 1, 1,
0.5901004, -1.809265, 5.533917, 0.3803922, 0, 1, 1,
0.5909209, 0.9578092, -0.4215782, 0.3843137, 0, 1, 1,
0.5921302, -0.9328021, 3.073595, 0.3921569, 0, 1, 1,
0.5958394, 0.6754797, 0.2831608, 0.3960784, 0, 1, 1,
0.5976275, -0.3658689, 2.591742, 0.4039216, 0, 1, 1,
0.5976458, 1.015849, -0.05708966, 0.4117647, 0, 1, 1,
0.6009052, -1.088478, 1.394281, 0.4156863, 0, 1, 1,
0.6057932, 1.138796, 2.154257, 0.4235294, 0, 1, 1,
0.6095976, 0.8203627, 0.4413754, 0.427451, 0, 1, 1,
0.6151643, 1.494165, 0.4772717, 0.4352941, 0, 1, 1,
0.6168684, 0.133252, 1.636899, 0.4392157, 0, 1, 1,
0.6176558, -0.9238794, 1.095364, 0.4470588, 0, 1, 1,
0.6211689, 0.4925928, 0.04261152, 0.4509804, 0, 1, 1,
0.6243872, 0.08308776, 2.573535, 0.4588235, 0, 1, 1,
0.6290928, 1.614428, 1.224029, 0.4627451, 0, 1, 1,
0.6299441, -0.1299836, 0.384187, 0.4705882, 0, 1, 1,
0.6308172, -0.4067443, 2.821306, 0.4745098, 0, 1, 1,
0.6354849, 0.5546098, 0.5246704, 0.4823529, 0, 1, 1,
0.6390433, -0.6641346, 1.171082, 0.4862745, 0, 1, 1,
0.6442901, 0.4784344, 1.129102, 0.4941176, 0, 1, 1,
0.6448358, 0.1996171, 2.08951, 0.5019608, 0, 1, 1,
0.6558381, 1.167754, 0.4374113, 0.5058824, 0, 1, 1,
0.6560032, 0.1779502, 1.890129, 0.5137255, 0, 1, 1,
0.6560324, 0.2816038, 0.6141092, 0.5176471, 0, 1, 1,
0.656213, 1.186425, 0.0008638658, 0.5254902, 0, 1, 1,
0.6618143, -0.1644371, 0.974377, 0.5294118, 0, 1, 1,
0.6647242, -0.1628333, 2.573102, 0.5372549, 0, 1, 1,
0.6787282, 0.2562263, 0.9025491, 0.5411765, 0, 1, 1,
0.6820405, -0.6782093, 1.264454, 0.5490196, 0, 1, 1,
0.6843522, -0.5192594, 2.712748, 0.5529412, 0, 1, 1,
0.7036395, 1.457991, 1.62377, 0.5607843, 0, 1, 1,
0.7127379, -0.6503845, 1.338207, 0.5647059, 0, 1, 1,
0.7163706, 0.08776762, 1.337797, 0.572549, 0, 1, 1,
0.7261987, 0.493908, 0.1378929, 0.5764706, 0, 1, 1,
0.7373328, 0.06032661, 2.403934, 0.5843138, 0, 1, 1,
0.738732, -0.3333674, 2.463904, 0.5882353, 0, 1, 1,
0.740495, -0.7443433, 3.916327, 0.5960785, 0, 1, 1,
0.7405217, -0.6962801, 1.951249, 0.6039216, 0, 1, 1,
0.7431608, 0.9277993, 0.657244, 0.6078432, 0, 1, 1,
0.7432891, 0.1417202, 2.602891, 0.6156863, 0, 1, 1,
0.7438564, 0.3313976, 1.278149, 0.6196079, 0, 1, 1,
0.7478178, 0.08514396, 0.6753154, 0.627451, 0, 1, 1,
0.7489426, -0.5345759, 0.6637213, 0.6313726, 0, 1, 1,
0.7498775, -2.151955, 4.049923, 0.6392157, 0, 1, 1,
0.7516665, 1.005224, 0.2182582, 0.6431373, 0, 1, 1,
0.7517229, 0.0672572, 0.7290787, 0.6509804, 0, 1, 1,
0.7674551, 1.297037, 0.7853228, 0.654902, 0, 1, 1,
0.7714633, 0.8132425, 1.000671, 0.6627451, 0, 1, 1,
0.7803463, 1.370073, 0.04361967, 0.6666667, 0, 1, 1,
0.7883317, 0.03966492, 1.378461, 0.6745098, 0, 1, 1,
0.7887832, -0.6635045, 1.335313, 0.6784314, 0, 1, 1,
0.7943264, 0.4217411, 1.212141, 0.6862745, 0, 1, 1,
0.7973728, -1.402872, 4.423854, 0.6901961, 0, 1, 1,
0.7983599, 0.4103122, -0.5492416, 0.6980392, 0, 1, 1,
0.8004437, 0.138832, 1.830579, 0.7058824, 0, 1, 1,
0.8014791, 0.4957033, 2.277642, 0.7098039, 0, 1, 1,
0.8071779, 0.298125, 0.8185244, 0.7176471, 0, 1, 1,
0.8076056, 1.265486, 0.9291601, 0.7215686, 0, 1, 1,
0.8127874, 0.0701505, 0.5655694, 0.7294118, 0, 1, 1,
0.8197356, 0.8002272, -0.2567693, 0.7333333, 0, 1, 1,
0.8239595, 0.2648862, 2.06491, 0.7411765, 0, 1, 1,
0.8263012, 0.592748, 0.5578766, 0.7450981, 0, 1, 1,
0.8310863, -1.124745, 2.798232, 0.7529412, 0, 1, 1,
0.8323194, -0.7006706, 2.093315, 0.7568628, 0, 1, 1,
0.8401455, 1.204309, -0.5595455, 0.7647059, 0, 1, 1,
0.8413963, 1.043996, -0.1103756, 0.7686275, 0, 1, 1,
0.8419117, 0.9586549, 1.379868, 0.7764706, 0, 1, 1,
0.8457443, -0.4952317, -0.5964161, 0.7803922, 0, 1, 1,
0.8471874, 1.201819, 1.038825, 0.7882353, 0, 1, 1,
0.8486174, 0.5976508, 0.1810535, 0.7921569, 0, 1, 1,
0.857646, -1.108855, 3.798342, 0.8, 0, 1, 1,
0.8590218, -0.9113014, 2.575722, 0.8078431, 0, 1, 1,
0.8676587, -0.1196758, -0.3861437, 0.8117647, 0, 1, 1,
0.8707623, 1.236534, -0.02745853, 0.8196079, 0, 1, 1,
0.8744673, 1.625742, 1.190563, 0.8235294, 0, 1, 1,
0.8748832, 0.1853436, 2.383729, 0.8313726, 0, 1, 1,
0.876745, 1.266891, 1.248521, 0.8352941, 0, 1, 1,
0.8846865, 0.5541564, 1.736515, 0.8431373, 0, 1, 1,
0.8895854, 0.1976748, 2.174879, 0.8470588, 0, 1, 1,
0.8911766, -0.009939868, 0.01607588, 0.854902, 0, 1, 1,
0.9011272, 0.8861413, 0.7995991, 0.8588235, 0, 1, 1,
0.9025742, 1.756598, -0.4014757, 0.8666667, 0, 1, 1,
0.9027678, -1.119625, 0.4229842, 0.8705882, 0, 1, 1,
0.9033778, -0.09503333, 2.498901, 0.8784314, 0, 1, 1,
0.9064051, -0.05165481, 0.8205314, 0.8823529, 0, 1, 1,
0.9072077, 1.070983, 2.4294, 0.8901961, 0, 1, 1,
0.9084378, -0.391194, 3.378072, 0.8941177, 0, 1, 1,
0.9102952, -0.6196413, 3.314471, 0.9019608, 0, 1, 1,
0.9147354, -0.1747579, 0.4077898, 0.9098039, 0, 1, 1,
0.917594, -0.7895416, 3.646242, 0.9137255, 0, 1, 1,
0.9177519, 1.2648, -2.211653, 0.9215686, 0, 1, 1,
0.9189902, 0.0589667, 1.009038, 0.9254902, 0, 1, 1,
0.9226152, 0.8249574, -0.41372, 0.9333333, 0, 1, 1,
0.9242082, 0.001675601, 0.2035841, 0.9372549, 0, 1, 1,
0.9285831, 0.09937617, 2.420588, 0.945098, 0, 1, 1,
0.9311072, -0.6747485, 1.917644, 0.9490196, 0, 1, 1,
0.931114, -0.2366987, 2.395824, 0.9568627, 0, 1, 1,
0.9314902, -0.6624163, -0.001903136, 0.9607843, 0, 1, 1,
0.9333613, 0.05409164, 0.6938958, 0.9686275, 0, 1, 1,
0.9337317, -1.373133, 1.974644, 0.972549, 0, 1, 1,
0.9362061, 0.7338277, -0.1792475, 0.9803922, 0, 1, 1,
0.9370388, -0.366489, 2.22938, 0.9843137, 0, 1, 1,
0.9375799, -0.1275451, 0.4264979, 0.9921569, 0, 1, 1,
0.9384577, 0.1160066, 1.485097, 0.9960784, 0, 1, 1,
0.9391891, 1.282753, 1.507598, 1, 0, 0.9960784, 1,
0.9408388, 1.543673, 0.129088, 1, 0, 0.9882353, 1,
0.9412923, 0.065161, -0.000564268, 1, 0, 0.9843137, 1,
0.9422362, 0.2906428, 2.599174, 1, 0, 0.9764706, 1,
0.9440913, -0.03672858, 0.7817374, 1, 0, 0.972549, 1,
0.9443986, -0.2819789, 1.80557, 1, 0, 0.9647059, 1,
0.9448304, 0.805167, 0.8371705, 1, 0, 0.9607843, 1,
0.9509225, 0.4663443, 0.8207383, 1, 0, 0.9529412, 1,
0.9623683, 1.677528, 1.199338, 1, 0, 0.9490196, 1,
0.9628173, -0.8630644, 3.146769, 1, 0, 0.9411765, 1,
0.9644982, -2.32456, 3.601158, 1, 0, 0.9372549, 1,
0.9712647, 0.150819, -0.3290552, 1, 0, 0.9294118, 1,
0.9723071, -0.002564478, 1.599785, 1, 0, 0.9254902, 1,
0.9929625, 1.257802, 1.786266, 1, 0, 0.9176471, 1,
0.9981476, -0.4548647, 3.181615, 1, 0, 0.9137255, 1,
1.002521, -0.3147099, 2.913695, 1, 0, 0.9058824, 1,
1.006539, 1.827831, 1.133429, 1, 0, 0.9019608, 1,
1.016503, 0.9952344, 0.8310934, 1, 0, 0.8941177, 1,
1.016533, -1.0382, 2.951301, 1, 0, 0.8862745, 1,
1.023175, -0.1204399, 2.63662, 1, 0, 0.8823529, 1,
1.027149, 1.031465, -0.2326598, 1, 0, 0.8745098, 1,
1.028025, 1.893294, 0.7939144, 1, 0, 0.8705882, 1,
1.031832, 1.533427, -1.119133, 1, 0, 0.8627451, 1,
1.034897, 0.3790146, 0.8929601, 1, 0, 0.8588235, 1,
1.044062, -0.7819351, 0.7624254, 1, 0, 0.8509804, 1,
1.044112, 0.7391524, 1.711684, 1, 0, 0.8470588, 1,
1.06134, -1.431629, 3.456769, 1, 0, 0.8392157, 1,
1.066786, 1.044462, 2.330335, 1, 0, 0.8352941, 1,
1.070188, 1.939467, -0.2413454, 1, 0, 0.827451, 1,
1.078171, 0.5035616, 1.591339, 1, 0, 0.8235294, 1,
1.088881, -0.5231249, 2.217911, 1, 0, 0.8156863, 1,
1.089306, 1.315783, -0.6759243, 1, 0, 0.8117647, 1,
1.090703, -0.7211519, 1.962955, 1, 0, 0.8039216, 1,
1.09501, 0.2273569, 0.9110731, 1, 0, 0.7960784, 1,
1.096596, 0.3490896, 0.7074943, 1, 0, 0.7921569, 1,
1.098158, -0.9571685, 2.879615, 1, 0, 0.7843137, 1,
1.102865, -0.3902403, 2.397538, 1, 0, 0.7803922, 1,
1.108355, -0.3517551, 0.4880135, 1, 0, 0.772549, 1,
1.118256, -0.1771377, 0.1967453, 1, 0, 0.7686275, 1,
1.118328, 0.2690948, 2.686182, 1, 0, 0.7607843, 1,
1.123189, -2.175386, 1.895041, 1, 0, 0.7568628, 1,
1.123702, -0.1621878, 2.976965, 1, 0, 0.7490196, 1,
1.134418, -0.5176099, 1.005563, 1, 0, 0.7450981, 1,
1.14277, 1.316452, 0.9442478, 1, 0, 0.7372549, 1,
1.143192, 0.2430555, 2.582338, 1, 0, 0.7333333, 1,
1.145977, -0.9840504, 3.08539, 1, 0, 0.7254902, 1,
1.149741, 0.03803588, 1.421303, 1, 0, 0.7215686, 1,
1.153265, -0.01853291, 1.022035, 1, 0, 0.7137255, 1,
1.158234, 0.2890396, 1.543741, 1, 0, 0.7098039, 1,
1.167106, -0.03509478, 1.449316, 1, 0, 0.7019608, 1,
1.175014, -0.3987681, -0.2632844, 1, 0, 0.6941177, 1,
1.175077, 0.08525266, 2.529614, 1, 0, 0.6901961, 1,
1.18665, 1.390127, 1.360231, 1, 0, 0.682353, 1,
1.188382, -1.803597, 3.252422, 1, 0, 0.6784314, 1,
1.191486, -0.8686141, 3.354665, 1, 0, 0.6705883, 1,
1.197748, -1.651358, 1.686507, 1, 0, 0.6666667, 1,
1.20179, -0.3426366, 3.26614, 1, 0, 0.6588235, 1,
1.210481, -1.461265, 1.353292, 1, 0, 0.654902, 1,
1.217417, -0.4667828, 2.18414, 1, 0, 0.6470588, 1,
1.22264, -0.07470129, 3.287406, 1, 0, 0.6431373, 1,
1.231849, 0.4477982, 1.448493, 1, 0, 0.6352941, 1,
1.239812, 0.8312087, 0.9523168, 1, 0, 0.6313726, 1,
1.240461, -1.305506, 2.588148, 1, 0, 0.6235294, 1,
1.24068, 0.9398145, 2.089104, 1, 0, 0.6196079, 1,
1.243319, -0.6641456, 2.0353, 1, 0, 0.6117647, 1,
1.249163, 0.3932538, 1.032911, 1, 0, 0.6078432, 1,
1.26027, -0.8573222, 1.535767, 1, 0, 0.6, 1,
1.264444, 0.1470435, 1.731688, 1, 0, 0.5921569, 1,
1.271874, -1.090041, 1.477347, 1, 0, 0.5882353, 1,
1.27573, -2.877211, 4.135211, 1, 0, 0.5803922, 1,
1.280195, -1.536905, 3.974392, 1, 0, 0.5764706, 1,
1.284956, -0.1754717, 2.361689, 1, 0, 0.5686275, 1,
1.287217, -0.8482643, 1.814468, 1, 0, 0.5647059, 1,
1.295612, -0.1992988, 1.696597, 1, 0, 0.5568628, 1,
1.298058, -0.8961051, 3.160208, 1, 0, 0.5529412, 1,
1.303386, -0.1801777, 2.82232, 1, 0, 0.5450981, 1,
1.309618, 1.37544, 1.479397, 1, 0, 0.5411765, 1,
1.311574, 0.7407545, 0.672676, 1, 0, 0.5333334, 1,
1.332956, 2.27204, 1.009966, 1, 0, 0.5294118, 1,
1.333036, -0.7497562, 1.782299, 1, 0, 0.5215687, 1,
1.348156, -0.9402252, 0.925327, 1, 0, 0.5176471, 1,
1.349654, 0.08550683, 1.846034, 1, 0, 0.509804, 1,
1.3593, 0.4590566, 1.26861, 1, 0, 0.5058824, 1,
1.362333, 0.6673816, -0.1621892, 1, 0, 0.4980392, 1,
1.372088, 1.115532, 0.2705113, 1, 0, 0.4901961, 1,
1.379495, -0.7586865, 2.716618, 1, 0, 0.4862745, 1,
1.38844, -0.4654405, 1.52041, 1, 0, 0.4784314, 1,
1.3937, -0.2704309, 1.46982, 1, 0, 0.4745098, 1,
1.395568, -0.9341586, 2.329433, 1, 0, 0.4666667, 1,
1.413661, 1.76002, 1.168529, 1, 0, 0.4627451, 1,
1.413725, 1.229137, 0.7651629, 1, 0, 0.454902, 1,
1.416254, 1.617065, -0.2774154, 1, 0, 0.4509804, 1,
1.419267, 0.2896479, 1.620962, 1, 0, 0.4431373, 1,
1.423453, -0.7433922, 3.161079, 1, 0, 0.4392157, 1,
1.429481, -0.2436589, 1.662692, 1, 0, 0.4313726, 1,
1.43394, -0.6360587, 2.921468, 1, 0, 0.427451, 1,
1.44134, -1.558082, 2.822893, 1, 0, 0.4196078, 1,
1.444421, 0.4171349, 0.8742535, 1, 0, 0.4156863, 1,
1.452559, -0.06641726, 0.9489403, 1, 0, 0.4078431, 1,
1.453353, 0.8065432, 0.4072903, 1, 0, 0.4039216, 1,
1.456021, -0.6441305, 0.9316209, 1, 0, 0.3960784, 1,
1.457789, 0.6097836, 1.389816, 1, 0, 0.3882353, 1,
1.474971, 0.8103729, 0.3192663, 1, 0, 0.3843137, 1,
1.484711, 0.4613197, 2.114361, 1, 0, 0.3764706, 1,
1.487283, 0.7301677, 1.190141, 1, 0, 0.372549, 1,
1.489734, 0.8399951, 1.972845, 1, 0, 0.3647059, 1,
1.503601, 0.4233414, 0.1098499, 1, 0, 0.3607843, 1,
1.523784, 0.1067849, 2.693308, 1, 0, 0.3529412, 1,
1.525327, 1.972867, 1.826371, 1, 0, 0.3490196, 1,
1.525442, -0.9613399, 1.937614, 1, 0, 0.3411765, 1,
1.537565, 1.383266, 0.02345672, 1, 0, 0.3372549, 1,
1.547398, -1.278045, -0.001078027, 1, 0, 0.3294118, 1,
1.551786, -0.9247671, 2.716429, 1, 0, 0.3254902, 1,
1.554363, -1.510602, 1.548924, 1, 0, 0.3176471, 1,
1.56608, 1.368183, -0.1854827, 1, 0, 0.3137255, 1,
1.568602, -0.677739, 4.503284, 1, 0, 0.3058824, 1,
1.570292, 0.1257539, 1.516159, 1, 0, 0.2980392, 1,
1.598841, -0.3805442, 0.9631116, 1, 0, 0.2941177, 1,
1.608442, 0.7592335, -0.1834296, 1, 0, 0.2862745, 1,
1.609558, 1.696846, 0.2000547, 1, 0, 0.282353, 1,
1.617108, -0.9551722, 1.865045, 1, 0, 0.2745098, 1,
1.622651, 2.338454, -0.1178409, 1, 0, 0.2705882, 1,
1.629422, 0.1296105, 1.582948, 1, 0, 0.2627451, 1,
1.639945, -1.377237, 2.170087, 1, 0, 0.2588235, 1,
1.645676, 0.425703, 0.2993887, 1, 0, 0.2509804, 1,
1.651303, 0.4308141, 0.3233328, 1, 0, 0.2470588, 1,
1.665959, 0.9642755, 1.39434, 1, 0, 0.2392157, 1,
1.669053, 0.1084994, 1.443622, 1, 0, 0.2352941, 1,
1.67881, -1.312468, 2.681806, 1, 0, 0.227451, 1,
1.692236, -0.4978031, 2.177557, 1, 0, 0.2235294, 1,
1.699011, 1.273453, -0.5934772, 1, 0, 0.2156863, 1,
1.709018, -0.9128146, 1.590249, 1, 0, 0.2117647, 1,
1.713825, 2.217007, -0.5766177, 1, 0, 0.2039216, 1,
1.72496, 1.937262, 0.660504, 1, 0, 0.1960784, 1,
1.733263, 0.9731685, 0.5412825, 1, 0, 0.1921569, 1,
1.787958, 1.317304, 1.152718, 1, 0, 0.1843137, 1,
1.79074, 1.856177, -0.02688709, 1, 0, 0.1803922, 1,
1.798637, 2.013162, 3.351755, 1, 0, 0.172549, 1,
1.834084, -1.981077, 1.617661, 1, 0, 0.1686275, 1,
1.854364, 0.5712405, 0.985262, 1, 0, 0.1607843, 1,
1.869543, -2.034716, 3.22443, 1, 0, 0.1568628, 1,
1.873968, -0.3112378, 3.234335, 1, 0, 0.1490196, 1,
1.890402, -0.3819672, -0.8482259, 1, 0, 0.145098, 1,
1.933607, 1.305467, 1.385701, 1, 0, 0.1372549, 1,
1.946747, -0.136004, 0.1872905, 1, 0, 0.1333333, 1,
1.954506, 0.6735001, 1.084085, 1, 0, 0.1254902, 1,
1.977889, -1.49135, 2.949586, 1, 0, 0.1215686, 1,
2.027312, -0.9778741, 0.6848133, 1, 0, 0.1137255, 1,
2.108394, -0.9430174, 2.76504, 1, 0, 0.1098039, 1,
2.123871, 2.11062, 1.460354, 1, 0, 0.1019608, 1,
2.153025, 0.1823063, 0.8989825, 1, 0, 0.09411765, 1,
2.181295, -0.5443138, 2.57282, 1, 0, 0.09019608, 1,
2.236228, -3.040171, 4.413011, 1, 0, 0.08235294, 1,
2.294181, 0.5422213, 1.57478, 1, 0, 0.07843138, 1,
2.300598, 0.1160532, 0.7073953, 1, 0, 0.07058824, 1,
2.303868, 0.4629748, 1.460657, 1, 0, 0.06666667, 1,
2.315838, -0.8149644, 1.284241, 1, 0, 0.05882353, 1,
2.329077, 1.086949, 1.691763, 1, 0, 0.05490196, 1,
2.403624, -1.480229, 3.320311, 1, 0, 0.04705882, 1,
2.435563, -1.148074, 3.859932, 1, 0, 0.04313726, 1,
2.526541, -0.1775346, 0.321769, 1, 0, 0.03529412, 1,
2.537702, 0.5664312, 2.320773, 1, 0, 0.03137255, 1,
2.619967, 0.2225075, 1.275879, 1, 0, 0.02352941, 1,
2.647686, 0.5811211, 0.9867597, 1, 0, 0.01960784, 1,
3.486727, 0.150337, 2.284273, 1, 0, 0.01176471, 1,
3.639373, 0.3216367, 1.151259, 1, 0, 0.007843138, 1
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
0.2886518, -4.018417, -7.921158, 0, -0.5, 0.5, 0.5,
0.2886518, -4.018417, -7.921158, 1, -0.5, 0.5, 0.5,
0.2886518, -4.018417, -7.921158, 1, 1.5, 0.5, 0.5,
0.2886518, -4.018417, -7.921158, 0, 1.5, 0.5, 0.5
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
-4.197964, -0.1544915, -7.921158, 0, -0.5, 0.5, 0.5,
-4.197964, -0.1544915, -7.921158, 1, -0.5, 0.5, 0.5,
-4.197964, -0.1544915, -7.921158, 1, 1.5, 0.5, 0.5,
-4.197964, -0.1544915, -7.921158, 0, 1.5, 0.5, 0.5
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
-4.197964, -4.018417, -0.2185731, 0, -0.5, 0.5, 0.5,
-4.197964, -4.018417, -0.2185731, 1, -0.5, 0.5, 0.5,
-4.197964, -4.018417, -0.2185731, 1, 1.5, 0.5, 0.5,
-4.197964, -4.018417, -0.2185731, 0, 1.5, 0.5, 0.5
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
-3, -3.126742, -6.143638,
3, -3.126742, -6.143638,
-3, -3.126742, -6.143638,
-3, -3.275354, -6.439892,
-2, -3.126742, -6.143638,
-2, -3.275354, -6.439892,
-1, -3.126742, -6.143638,
-1, -3.275354, -6.439892,
0, -3.126742, -6.143638,
0, -3.275354, -6.439892,
1, -3.126742, -6.143638,
1, -3.275354, -6.439892,
2, -3.126742, -6.143638,
2, -3.275354, -6.439892,
3, -3.126742, -6.143638,
3, -3.275354, -6.439892
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
-3, -3.572579, -7.032398, 0, -0.5, 0.5, 0.5,
-3, -3.572579, -7.032398, 1, -0.5, 0.5, 0.5,
-3, -3.572579, -7.032398, 1, 1.5, 0.5, 0.5,
-3, -3.572579, -7.032398, 0, 1.5, 0.5, 0.5,
-2, -3.572579, -7.032398, 0, -0.5, 0.5, 0.5,
-2, -3.572579, -7.032398, 1, -0.5, 0.5, 0.5,
-2, -3.572579, -7.032398, 1, 1.5, 0.5, 0.5,
-2, -3.572579, -7.032398, 0, 1.5, 0.5, 0.5,
-1, -3.572579, -7.032398, 0, -0.5, 0.5, 0.5,
-1, -3.572579, -7.032398, 1, -0.5, 0.5, 0.5,
-1, -3.572579, -7.032398, 1, 1.5, 0.5, 0.5,
-1, -3.572579, -7.032398, 0, 1.5, 0.5, 0.5,
0, -3.572579, -7.032398, 0, -0.5, 0.5, 0.5,
0, -3.572579, -7.032398, 1, -0.5, 0.5, 0.5,
0, -3.572579, -7.032398, 1, 1.5, 0.5, 0.5,
0, -3.572579, -7.032398, 0, 1.5, 0.5, 0.5,
1, -3.572579, -7.032398, 0, -0.5, 0.5, 0.5,
1, -3.572579, -7.032398, 1, -0.5, 0.5, 0.5,
1, -3.572579, -7.032398, 1, 1.5, 0.5, 0.5,
1, -3.572579, -7.032398, 0, 1.5, 0.5, 0.5,
2, -3.572579, -7.032398, 0, -0.5, 0.5, 0.5,
2, -3.572579, -7.032398, 1, -0.5, 0.5, 0.5,
2, -3.572579, -7.032398, 1, 1.5, 0.5, 0.5,
2, -3.572579, -7.032398, 0, 1.5, 0.5, 0.5,
3, -3.572579, -7.032398, 0, -0.5, 0.5, 0.5,
3, -3.572579, -7.032398, 1, -0.5, 0.5, 0.5,
3, -3.572579, -7.032398, 1, 1.5, 0.5, 0.5,
3, -3.572579, -7.032398, 0, 1.5, 0.5, 0.5
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
-3.162591, -3, -6.143638,
-3.162591, 2, -6.143638,
-3.162591, -3, -6.143638,
-3.335153, -3, -6.439892,
-3.162591, -2, -6.143638,
-3.335153, -2, -6.439892,
-3.162591, -1, -6.143638,
-3.335153, -1, -6.439892,
-3.162591, 0, -6.143638,
-3.335153, 0, -6.439892,
-3.162591, 1, -6.143638,
-3.335153, 1, -6.439892,
-3.162591, 2, -6.143638,
-3.335153, 2, -6.439892
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
-3.680278, -3, -7.032398, 0, -0.5, 0.5, 0.5,
-3.680278, -3, -7.032398, 1, -0.5, 0.5, 0.5,
-3.680278, -3, -7.032398, 1, 1.5, 0.5, 0.5,
-3.680278, -3, -7.032398, 0, 1.5, 0.5, 0.5,
-3.680278, -2, -7.032398, 0, -0.5, 0.5, 0.5,
-3.680278, -2, -7.032398, 1, -0.5, 0.5, 0.5,
-3.680278, -2, -7.032398, 1, 1.5, 0.5, 0.5,
-3.680278, -2, -7.032398, 0, 1.5, 0.5, 0.5,
-3.680278, -1, -7.032398, 0, -0.5, 0.5, 0.5,
-3.680278, -1, -7.032398, 1, -0.5, 0.5, 0.5,
-3.680278, -1, -7.032398, 1, 1.5, 0.5, 0.5,
-3.680278, -1, -7.032398, 0, 1.5, 0.5, 0.5,
-3.680278, 0, -7.032398, 0, -0.5, 0.5, 0.5,
-3.680278, 0, -7.032398, 1, -0.5, 0.5, 0.5,
-3.680278, 0, -7.032398, 1, 1.5, 0.5, 0.5,
-3.680278, 0, -7.032398, 0, 1.5, 0.5, 0.5,
-3.680278, 1, -7.032398, 0, -0.5, 0.5, 0.5,
-3.680278, 1, -7.032398, 1, -0.5, 0.5, 0.5,
-3.680278, 1, -7.032398, 1, 1.5, 0.5, 0.5,
-3.680278, 1, -7.032398, 0, 1.5, 0.5, 0.5,
-3.680278, 2, -7.032398, 0, -0.5, 0.5, 0.5,
-3.680278, 2, -7.032398, 1, -0.5, 0.5, 0.5,
-3.680278, 2, -7.032398, 1, 1.5, 0.5, 0.5,
-3.680278, 2, -7.032398, 0, 1.5, 0.5, 0.5
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
-3.162591, -3.126742, -4,
-3.162591, -3.126742, 4,
-3.162591, -3.126742, -4,
-3.335153, -3.275354, -4,
-3.162591, -3.126742, -2,
-3.335153, -3.275354, -2,
-3.162591, -3.126742, 0,
-3.335153, -3.275354, 0,
-3.162591, -3.126742, 2,
-3.335153, -3.275354, 2,
-3.162591, -3.126742, 4,
-3.335153, -3.275354, 4
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
-3.680278, -3.572579, -4, 0, -0.5, 0.5, 0.5,
-3.680278, -3.572579, -4, 1, -0.5, 0.5, 0.5,
-3.680278, -3.572579, -4, 1, 1.5, 0.5, 0.5,
-3.680278, -3.572579, -4, 0, 1.5, 0.5, 0.5,
-3.680278, -3.572579, -2, 0, -0.5, 0.5, 0.5,
-3.680278, -3.572579, -2, 1, -0.5, 0.5, 0.5,
-3.680278, -3.572579, -2, 1, 1.5, 0.5, 0.5,
-3.680278, -3.572579, -2, 0, 1.5, 0.5, 0.5,
-3.680278, -3.572579, 0, 0, -0.5, 0.5, 0.5,
-3.680278, -3.572579, 0, 1, -0.5, 0.5, 0.5,
-3.680278, -3.572579, 0, 1, 1.5, 0.5, 0.5,
-3.680278, -3.572579, 0, 0, 1.5, 0.5, 0.5,
-3.680278, -3.572579, 2, 0, -0.5, 0.5, 0.5,
-3.680278, -3.572579, 2, 1, -0.5, 0.5, 0.5,
-3.680278, -3.572579, 2, 1, 1.5, 0.5, 0.5,
-3.680278, -3.572579, 2, 0, 1.5, 0.5, 0.5,
-3.680278, -3.572579, 4, 0, -0.5, 0.5, 0.5,
-3.680278, -3.572579, 4, 1, -0.5, 0.5, 0.5,
-3.680278, -3.572579, 4, 1, 1.5, 0.5, 0.5,
-3.680278, -3.572579, 4, 0, 1.5, 0.5, 0.5
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
-3.162591, -3.126742, -6.143638,
-3.162591, 2.817759, -6.143638,
-3.162591, -3.126742, 5.706492,
-3.162591, 2.817759, 5.706492,
-3.162591, -3.126742, -6.143638,
-3.162591, -3.126742, 5.706492,
-3.162591, 2.817759, -6.143638,
-3.162591, 2.817759, 5.706492,
-3.162591, -3.126742, -6.143638,
3.739895, -3.126742, -6.143638,
-3.162591, -3.126742, 5.706492,
3.739895, -3.126742, 5.706492,
-3.162591, 2.817759, -6.143638,
3.739895, 2.817759, -6.143638,
-3.162591, 2.817759, 5.706492,
3.739895, 2.817759, 5.706492,
3.739895, -3.126742, -6.143638,
3.739895, 2.817759, -6.143638,
3.739895, -3.126742, 5.706492,
3.739895, 2.817759, 5.706492,
3.739895, -3.126742, -6.143638,
3.739895, -3.126742, 5.706492,
3.739895, 2.817759, -6.143638,
3.739895, 2.817759, 5.706492
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
var radius = 7.981304;
var distance = 35.50972;
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
mvMatrix.translate( -0.2886518, 0.1544915, 0.2185731 );
mvMatrix.scale( 1.250208, 1.451685, 0.7282234 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.50972);
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
CS2<-read.table("CS2.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-CS2$V2
```

```
## Error in eval(expr, envir, enclos): object 'CS2' not found
```

```r
y<-CS2$V3
```

```
## Error in eval(expr, envir, enclos): object 'CS2' not found
```

```r
z<-CS2$V4
```

```
## Error in eval(expr, envir, enclos): object 'CS2' not found
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
-3.062069, -0.5917183, -3.114003, 0, 0, 1, 1, 1,
-2.831038, -1.201449, -0.5120805, 1, 0, 0, 1, 1,
-2.790632, 0.3014081, -1.099997, 1, 0, 0, 1, 1,
-2.698112, -1.236172, -1.189673, 1, 0, 0, 1, 1,
-2.691025, -0.6203575, -2.084413, 1, 0, 0, 1, 1,
-2.570329, 1.742302, -2.07344, 1, 0, 0, 1, 1,
-2.546802, -1.92629, -1.366986, 0, 0, 0, 1, 1,
-2.539897, 0.1879318, -2.340914, 0, 0, 0, 1, 1,
-2.524002, 0.1688405, -1.621096, 0, 0, 0, 1, 1,
-2.453796, -0.1262006, -2.353652, 0, 0, 0, 1, 1,
-2.390338, -1.031281, -1.979713, 0, 0, 0, 1, 1,
-2.371031, -0.04867318, -1.52058, 0, 0, 0, 1, 1,
-2.356628, 0.1611185, -0.9516878, 0, 0, 0, 1, 1,
-2.284837, 0.144178, -0.09028166, 1, 1, 1, 1, 1,
-2.27857, -0.1012322, -2.943393, 1, 1, 1, 1, 1,
-2.262379, -1.372069, -3.603729, 1, 1, 1, 1, 1,
-2.209853, -2.6906, -3.464085, 1, 1, 1, 1, 1,
-2.207813, -0.3850461, -0.02392751, 1, 1, 1, 1, 1,
-2.147945, -0.7544786, -0.8687763, 1, 1, 1, 1, 1,
-2.113078, 0.5587283, -1.809754, 1, 1, 1, 1, 1,
-2.099015, 1.020975, -1.061803, 1, 1, 1, 1, 1,
-2.098747, 1.980188, 0.9086198, 1, 1, 1, 1, 1,
-2.038078, 0.283955, -2.374706, 1, 1, 1, 1, 1,
-2.025056, 0.6789839, -0.503939, 1, 1, 1, 1, 1,
-2.016574, -0.1769803, -1.752418, 1, 1, 1, 1, 1,
-1.951005, 1.962218, -0.4593338, 1, 1, 1, 1, 1,
-1.928271, 0.4069172, -0.4591663, 1, 1, 1, 1, 1,
-1.92121, 0.3684492, -1.096388, 1, 1, 1, 1, 1,
-1.908686, -0.2429723, -1.825062, 0, 0, 1, 1, 1,
-1.891078, 0.1281444, -1.417963, 1, 0, 0, 1, 1,
-1.877311, 0.07698538, -1.711834, 1, 0, 0, 1, 1,
-1.855888, 0.4626942, -1.783979, 1, 0, 0, 1, 1,
-1.854159, 0.6779407, -0.6552396, 1, 0, 0, 1, 1,
-1.830616, -0.1726749, -1.160386, 1, 0, 0, 1, 1,
-1.830548, 1.425305, -1.255426, 0, 0, 0, 1, 1,
-1.818813, -0.7665704, -3.608946, 0, 0, 0, 1, 1,
-1.818722, -0.3820245, -2.337595, 0, 0, 0, 1, 1,
-1.810685, -1.833007, -2.976075, 0, 0, 0, 1, 1,
-1.788667, 1.091207, -1.274654, 0, 0, 0, 1, 1,
-1.782993, -0.8154638, -0.220081, 0, 0, 0, 1, 1,
-1.777898, -0.2354872, -1.828894, 0, 0, 0, 1, 1,
-1.773523, -0.07361918, -2.467264, 1, 1, 1, 1, 1,
-1.765736, 0.04358494, -0.5144662, 1, 1, 1, 1, 1,
-1.761269, 0.2696485, 0.1893677, 1, 1, 1, 1, 1,
-1.757804, -0.657309, 0.3072764, 1, 1, 1, 1, 1,
-1.749564, 0.6994433, -0.7928722, 1, 1, 1, 1, 1,
-1.746687, 0.7397678, -0.1627839, 1, 1, 1, 1, 1,
-1.744515, 1.768954, 0.5751955, 1, 1, 1, 1, 1,
-1.737083, -0.6747174, -0.979026, 1, 1, 1, 1, 1,
-1.717608, -0.8135775, -3.409294, 1, 1, 1, 1, 1,
-1.700791, -0.8483335, -2.756189, 1, 1, 1, 1, 1,
-1.69651, 1.699662, -1.324937, 1, 1, 1, 1, 1,
-1.663004, -0.3019967, -1.721601, 1, 1, 1, 1, 1,
-1.644414, -0.8950432, -2.126107, 1, 1, 1, 1, 1,
-1.643032, -1.970365, -4.573067, 1, 1, 1, 1, 1,
-1.602892, 0.5447861, -1.245842, 1, 1, 1, 1, 1,
-1.602792, 1.714015, -0.9687997, 0, 0, 1, 1, 1,
-1.600382, 0.208493, -4.077608, 1, 0, 0, 1, 1,
-1.597245, 1.570446, -0.08427224, 1, 0, 0, 1, 1,
-1.596762, -0.002592419, -1.366001, 1, 0, 0, 1, 1,
-1.595502, 1.828403, -1.299058, 1, 0, 0, 1, 1,
-1.594129, 2.466434, -2.161902, 1, 0, 0, 1, 1,
-1.59168, -0.4983299, -1.488963, 0, 0, 0, 1, 1,
-1.58822, 0.5910847, -0.179215, 0, 0, 0, 1, 1,
-1.581645, 0.2678756, -2.10864, 0, 0, 0, 1, 1,
-1.579776, -0.533532, -2.289102, 0, 0, 0, 1, 1,
-1.560726, -1.34875, -3.14355, 0, 0, 0, 1, 1,
-1.557723, 0.3271387, -0.4972218, 0, 0, 0, 1, 1,
-1.534974, 1.548698, -0.7628294, 0, 0, 0, 1, 1,
-1.530416, 1.768587, -1.320527, 1, 1, 1, 1, 1,
-1.508112, -0.6108099, -1.49147, 1, 1, 1, 1, 1,
-1.493935, 0.1027632, -0.8786734, 1, 1, 1, 1, 1,
-1.491628, -0.4582312, -0.3807574, 1, 1, 1, 1, 1,
-1.488181, -0.07383651, -1.480002, 1, 1, 1, 1, 1,
-1.468428, -0.284968, -1.406055, 1, 1, 1, 1, 1,
-1.468059, 1.370094, -0.198137, 1, 1, 1, 1, 1,
-1.465171, 0.2696209, -0.191183, 1, 1, 1, 1, 1,
-1.442283, -0.2128199, -2.426468, 1, 1, 1, 1, 1,
-1.442199, -1.342447, -1.995865, 1, 1, 1, 1, 1,
-1.419227, -0.1119719, -0.8800032, 1, 1, 1, 1, 1,
-1.415352, 1.39467, 0.8219976, 1, 1, 1, 1, 1,
-1.40442, -0.3477997, -2.558136, 1, 1, 1, 1, 1,
-1.396926, 1.16752, -1.652716, 1, 1, 1, 1, 1,
-1.365738, 1.070426, -0.8229015, 1, 1, 1, 1, 1,
-1.359957, -0.3980007, -1.117115, 0, 0, 1, 1, 1,
-1.358335, 0.3261681, -2.218993, 1, 0, 0, 1, 1,
-1.354569, 0.03997496, -2.448797, 1, 0, 0, 1, 1,
-1.354017, 1.561768, -0.6838012, 1, 0, 0, 1, 1,
-1.345074, -1.457283, -1.900585, 1, 0, 0, 1, 1,
-1.343892, -0.82106, -1.921192, 1, 0, 0, 1, 1,
-1.341629, 0.8416926, -0.8632525, 0, 0, 0, 1, 1,
-1.341291, 0.4555374, -3.048852, 0, 0, 0, 1, 1,
-1.339079, -0.01783271, -0.7763936, 0, 0, 0, 1, 1,
-1.33831, -1.871584, -3.823865, 0, 0, 0, 1, 1,
-1.33542, 0.2857147, -1.500228, 0, 0, 0, 1, 1,
-1.334188, -0.368056, -1.732111, 0, 0, 0, 1, 1,
-1.334044, 0.638163, -3.364289, 0, 0, 0, 1, 1,
-1.329967, 1.965056, -1.309872, 1, 1, 1, 1, 1,
-1.325307, 0.04123597, -0.6619099, 1, 1, 1, 1, 1,
-1.312011, -1.111846, -0.267308, 1, 1, 1, 1, 1,
-1.308427, 1.008146, -2.184743, 1, 1, 1, 1, 1,
-1.300854, 1.023205, -2.221026, 1, 1, 1, 1, 1,
-1.296745, 1.346334, -1.0572, 1, 1, 1, 1, 1,
-1.295153, 0.004030267, -2.012152, 1, 1, 1, 1, 1,
-1.287173, 0.4174733, -2.553375, 1, 1, 1, 1, 1,
-1.27943, 1.403335, -1.408395, 1, 1, 1, 1, 1,
-1.275484, 0.2770098, -1.208726, 1, 1, 1, 1, 1,
-1.266148, -1.011693, -2.125755, 1, 1, 1, 1, 1,
-1.2647, 0.1963765, -1.032496, 1, 1, 1, 1, 1,
-1.26283, 0.4505761, -0.5049361, 1, 1, 1, 1, 1,
-1.25854, -0.2117448, -1.604166, 1, 1, 1, 1, 1,
-1.255039, -0.2682379, -0.2422669, 1, 1, 1, 1, 1,
-1.254901, 1.006877, -1.987366, 0, 0, 1, 1, 1,
-1.253117, 1.155731, -1.659677, 1, 0, 0, 1, 1,
-1.24988, -0.619788, -1.635969, 1, 0, 0, 1, 1,
-1.246695, 0.9421199, -0.5202405, 1, 0, 0, 1, 1,
-1.226784, -0.3266844, -0.03251658, 1, 0, 0, 1, 1,
-1.224828, 0.6659371, -1.501523, 1, 0, 0, 1, 1,
-1.218686, -2.199053, -3.146685, 0, 0, 0, 1, 1,
-1.212044, 0.5018135, 1.282436, 0, 0, 0, 1, 1,
-1.210699, -0.6088554, 0.7318537, 0, 0, 0, 1, 1,
-1.209726, -0.4800863, -1.8932, 0, 0, 0, 1, 1,
-1.208678, 0.3675391, -0.6806922, 0, 0, 0, 1, 1,
-1.204745, -0.0004249631, -2.139519, 0, 0, 0, 1, 1,
-1.203525, -0.1990584, -0.3348648, 0, 0, 0, 1, 1,
-1.199509, -0.1487914, -2.186948, 1, 1, 1, 1, 1,
-1.196837, -0.7679579, -2.931581, 1, 1, 1, 1, 1,
-1.19074, -0.0004722159, -0.7803892, 1, 1, 1, 1, 1,
-1.185046, 0.7948825, -1.699946, 1, 1, 1, 1, 1,
-1.183812, 1.316677, -3.564378, 1, 1, 1, 1, 1,
-1.171049, -0.109227, -1.093245, 1, 1, 1, 1, 1,
-1.167823, 0.2868642, -2.388445, 1, 1, 1, 1, 1,
-1.159408, -0.5353197, -1.581088, 1, 1, 1, 1, 1,
-1.149788, -0.2733822, -0.08144502, 1, 1, 1, 1, 1,
-1.144507, -0.9131322, -1.607577, 1, 1, 1, 1, 1,
-1.142349, 0.5112005, -0.2720254, 1, 1, 1, 1, 1,
-1.125081, 0.1748606, -1.264677, 1, 1, 1, 1, 1,
-1.12468, -0.1445086, -1.541527, 1, 1, 1, 1, 1,
-1.118395, 1.789311, -0.9211842, 1, 1, 1, 1, 1,
-1.114797, 1.400701, 0.4495434, 1, 1, 1, 1, 1,
-1.114167, 2.104815, -0.05210273, 0, 0, 1, 1, 1,
-1.112579, 1.083707, 0.3576178, 1, 0, 0, 1, 1,
-1.107021, -0.6095588, -2.457096, 1, 0, 0, 1, 1,
-1.101186, 0.08753126, -1.512457, 1, 0, 0, 1, 1,
-1.07884, -1.258537, -0.7124932, 1, 0, 0, 1, 1,
-1.076293, 0.3082954, 0.5702068, 1, 0, 0, 1, 1,
-1.073398, 1.351193, -1.19309, 0, 0, 0, 1, 1,
-1.070027, 0.3618698, -0.03421738, 0, 0, 0, 1, 1,
-1.069624, 0.6227816, 1.413339, 0, 0, 0, 1, 1,
-1.068274, 1.33508, -0.7520515, 0, 0, 0, 1, 1,
-1.061722, 1.108777, -1.632138, 0, 0, 0, 1, 1,
-1.059513, 0.6932689, 0.8426374, 0, 0, 0, 1, 1,
-1.058482, -1.219495, -0.8735234, 0, 0, 0, 1, 1,
-1.058305, -1.04983, -1.407768, 1, 1, 1, 1, 1,
-1.05056, -0.5619714, -3.105418, 1, 1, 1, 1, 1,
-1.049284, -0.1418054, -2.256956, 1, 1, 1, 1, 1,
-1.037314, -2.171789, -2.240102, 1, 1, 1, 1, 1,
-1.036051, 0.4087052, -2.022705, 1, 1, 1, 1, 1,
-1.03491, 2.24487, -1.660362, 1, 1, 1, 1, 1,
-1.033884, -1.011014, -2.660416, 1, 1, 1, 1, 1,
-1.032009, -1.154446, -3.768579, 1, 1, 1, 1, 1,
-1.027585, -1.099681, -2.445525, 1, 1, 1, 1, 1,
-1.025601, 0.1713005, -1.425928, 1, 1, 1, 1, 1,
-1.025551, 1.802192, 0.1934263, 1, 1, 1, 1, 1,
-1.024691, 0.7365766, -1.574227, 1, 1, 1, 1, 1,
-1.023556, -0.5538509, -2.265173, 1, 1, 1, 1, 1,
-1.023143, 0.3253208, -1.339191, 1, 1, 1, 1, 1,
-1.012973, 0.4194098, -1.11367, 1, 1, 1, 1, 1,
-1.011942, 0.1874024, -1.725383, 0, 0, 1, 1, 1,
-1.011719, -0.05425256, 0.5831293, 1, 0, 0, 1, 1,
-1.010712, 1.750981, 0.5827957, 1, 0, 0, 1, 1,
-1.007435, -1.321369, -1.967191, 1, 0, 0, 1, 1,
-0.9952156, 1.284341, -0.3638928, 1, 0, 0, 1, 1,
-0.9935194, -1.029742, -2.313775, 1, 0, 0, 1, 1,
-0.9901701, 2.159185, -0.5776666, 0, 0, 0, 1, 1,
-0.9884847, -0.008400974, -1.372021, 0, 0, 0, 1, 1,
-0.9867777, 0.1385128, -0.8590124, 0, 0, 0, 1, 1,
-0.9803065, -0.7056141, -1.336755, 0, 0, 0, 1, 1,
-0.9747397, -1.471558, -3.854463, 0, 0, 0, 1, 1,
-0.9745126, 0.2178813, 0.6025566, 0, 0, 0, 1, 1,
-0.9701245, 0.2329423, -2.18639, 0, 0, 0, 1, 1,
-0.964058, -1.313082, -1.563426, 1, 1, 1, 1, 1,
-0.9631195, -0.1754892, -0.7918627, 1, 1, 1, 1, 1,
-0.9626142, -0.791226, -3.011317, 1, 1, 1, 1, 1,
-0.9604183, -0.2099812, -1.767494, 1, 1, 1, 1, 1,
-0.9595802, -0.2036406, -1.669836, 1, 1, 1, 1, 1,
-0.9538817, 0.3231669, -2.045344, 1, 1, 1, 1, 1,
-0.9515144, 1.241167, 0.2134519, 1, 1, 1, 1, 1,
-0.9389675, 0.2370771, -1.125403, 1, 1, 1, 1, 1,
-0.8985572, 0.4181935, -1.895562, 1, 1, 1, 1, 1,
-0.8947443, 1.473113, -0.9824232, 1, 1, 1, 1, 1,
-0.8931352, -0.8076593, -3.671962, 1, 1, 1, 1, 1,
-0.8910502, -0.2637751, 0.06007554, 1, 1, 1, 1, 1,
-0.8860287, 0.4770931, -1.043062, 1, 1, 1, 1, 1,
-0.88036, 1.219993, -1.242646, 1, 1, 1, 1, 1,
-0.8678635, 0.1105924, -2.751602, 1, 1, 1, 1, 1,
-0.8601201, 0.1060894, -2.466515, 0, 0, 1, 1, 1,
-0.8589299, -1.312765, -1.66235, 1, 0, 0, 1, 1,
-0.8583544, 0.6246621, -1.083723, 1, 0, 0, 1, 1,
-0.8580745, 0.6001791, 1.780985, 1, 0, 0, 1, 1,
-0.850997, 0.2058912, -1.535954, 1, 0, 0, 1, 1,
-0.8482502, 1.276532, -1.061573, 1, 0, 0, 1, 1,
-0.8479403, -1.353071, -1.080191, 0, 0, 0, 1, 1,
-0.8416721, -0.6308712, -1.803164, 0, 0, 0, 1, 1,
-0.8340017, 0.9591677, -1.287255, 0, 0, 0, 1, 1,
-0.8323863, -0.4284181, -1.582123, 0, 0, 0, 1, 1,
-0.8258631, 0.2067426, -1.853196, 0, 0, 0, 1, 1,
-0.8198884, 0.4169873, -2.687513, 0, 0, 0, 1, 1,
-0.8096051, 0.2434855, -1.349948, 0, 0, 0, 1, 1,
-0.8077516, 0.514217, 0.6673992, 1, 1, 1, 1, 1,
-0.8045593, -0.228054, -1.239898, 1, 1, 1, 1, 1,
-0.7939103, -0.5740018, -3.176883, 1, 1, 1, 1, 1,
-0.7915531, 0.4534861, -2.067643, 1, 1, 1, 1, 1,
-0.7913632, -0.4967793, -2.443265, 1, 1, 1, 1, 1,
-0.7860197, -0.04511474, -0.9892661, 1, 1, 1, 1, 1,
-0.7844258, 0.4849972, -0.5611315, 1, 1, 1, 1, 1,
-0.7783344, -0.1312775, -2.869512, 1, 1, 1, 1, 1,
-0.7750746, 0.2403117, -2.577778, 1, 1, 1, 1, 1,
-0.7735974, 0.3720515, -3.550994, 1, 1, 1, 1, 1,
-0.7707669, -0.6708814, -3.273322, 1, 1, 1, 1, 1,
-0.7682328, -1.063638, -3.724092, 1, 1, 1, 1, 1,
-0.7597476, 2.677386, -1.881456, 1, 1, 1, 1, 1,
-0.7579023, 0.5178822, -1.469682, 1, 1, 1, 1, 1,
-0.7566666, -0.1866577, -1.236449, 1, 1, 1, 1, 1,
-0.7487887, -1.301981, -1.243264, 0, 0, 1, 1, 1,
-0.7474401, -0.8516093, -4.074621, 1, 0, 0, 1, 1,
-0.7472672, 0.7107216, -0.54206, 1, 0, 0, 1, 1,
-0.7456182, 0.6494388, 1.60692, 1, 0, 0, 1, 1,
-0.7381369, -0.9746157, -2.176844, 1, 0, 0, 1, 1,
-0.7313724, -1.152712, -1.478223, 1, 0, 0, 1, 1,
-0.7243283, 0.1017766, -2.022242, 0, 0, 0, 1, 1,
-0.7214564, 0.09251339, -2.200508, 0, 0, 0, 1, 1,
-0.7201664, -1.755336, -2.987183, 0, 0, 0, 1, 1,
-0.7140293, 1.165109, -0.1422735, 0, 0, 0, 1, 1,
-0.7121147, -0.7387134, -3.284287, 0, 0, 0, 1, 1,
-0.7011974, -1.047396, -5.46175, 0, 0, 0, 1, 1,
-0.6909866, -0.007715361, -1.76075, 0, 0, 0, 1, 1,
-0.6863862, 1.500625, 0.2249073, 1, 1, 1, 1, 1,
-0.6856898, 0.4385529, -2.616824, 1, 1, 1, 1, 1,
-0.6846245, -1.631231, -3.781687, 1, 1, 1, 1, 1,
-0.6832056, -0.08454716, -3.482019, 1, 1, 1, 1, 1,
-0.677756, 0.3518597, -1.617268, 1, 1, 1, 1, 1,
-0.6777471, -0.2344582, -2.705832, 1, 1, 1, 1, 1,
-0.6772512, 0.2257745, -1.853047, 1, 1, 1, 1, 1,
-0.6742421, 0.9170904, -0.563135, 1, 1, 1, 1, 1,
-0.673565, 0.9724633, -0.5407231, 1, 1, 1, 1, 1,
-0.6676566, 1.041852, -0.4527451, 1, 1, 1, 1, 1,
-0.6663037, -0.5963037, -2.673005, 1, 1, 1, 1, 1,
-0.6652766, -2.941626, -2.737587, 1, 1, 1, 1, 1,
-0.6632898, -0.2159838, -1.620865, 1, 1, 1, 1, 1,
-0.6625062, 0.3576704, -0.5555245, 1, 1, 1, 1, 1,
-0.6557443, 0.2245399, -0.9447349, 1, 1, 1, 1, 1,
-0.651751, -0.514783, -0.8342251, 0, 0, 1, 1, 1,
-0.6513253, 2.071641, -0.7771631, 1, 0, 0, 1, 1,
-0.6503831, 0.6158572, 1.120792, 1, 0, 0, 1, 1,
-0.6463323, -0.5666778, -2.899067, 1, 0, 0, 1, 1,
-0.6452191, 2.035954, -0.1497137, 1, 0, 0, 1, 1,
-0.6430478, 1.000698, 0.4069057, 1, 0, 0, 1, 1,
-0.6391922, -0.9272804, -2.141198, 0, 0, 0, 1, 1,
-0.6385458, 1.370172, 0.29898, 0, 0, 0, 1, 1,
-0.6377189, -0.2832712, -1.569681, 0, 0, 0, 1, 1,
-0.6366173, 0.5154666, -0.01386663, 0, 0, 0, 1, 1,
-0.6357673, -1.531663, -2.736954, 0, 0, 0, 1, 1,
-0.6348588, -0.1938904, -0.9465541, 0, 0, 0, 1, 1,
-0.6301289, -0.5912176, -3.163195, 0, 0, 0, 1, 1,
-0.6298692, 0.2222984, -2.682917, 1, 1, 1, 1, 1,
-0.6226048, 0.3930766, 1.066328, 1, 1, 1, 1, 1,
-0.6205841, -0.3970727, -3.325409, 1, 1, 1, 1, 1,
-0.6069577, 0.2808416, -1.345356, 1, 1, 1, 1, 1,
-0.6035163, -0.9553899, -2.273975, 1, 1, 1, 1, 1,
-0.5980402, -1.408493, -2.29664, 1, 1, 1, 1, 1,
-0.5968499, -1.940482, -2.307947, 1, 1, 1, 1, 1,
-0.5938385, -1.457663, -3.537486, 1, 1, 1, 1, 1,
-0.5928873, 1.169023, 0.7048101, 1, 1, 1, 1, 1,
-0.5910387, 0.2304849, -2.728451, 1, 1, 1, 1, 1,
-0.5899076, -0.3035703, -3.723687, 1, 1, 1, 1, 1,
-0.5880396, 0.9259958, -2.131339, 1, 1, 1, 1, 1,
-0.5877911, 0.06073638, -1.867567, 1, 1, 1, 1, 1,
-0.5859035, -0.8260244, -2.381564, 1, 1, 1, 1, 1,
-0.5847334, -1.25759, -0.1480351, 1, 1, 1, 1, 1,
-0.5832533, -0.2585974, -3.043212, 0, 0, 1, 1, 1,
-0.5822076, 0.1745515, -2.543644, 1, 0, 0, 1, 1,
-0.5791446, 0.237162, -0.5131366, 1, 0, 0, 1, 1,
-0.578556, -0.0989987, -1.474441, 1, 0, 0, 1, 1,
-0.5783117, -0.1922712, -0.6287397, 1, 0, 0, 1, 1,
-0.5780876, 1.100448, -1.519412, 1, 0, 0, 1, 1,
-0.5772551, 0.1922647, -1.973824, 0, 0, 0, 1, 1,
-0.5771573, -0.8005059, -1.851335, 0, 0, 0, 1, 1,
-0.5746928, 0.2166931, -4.334809, 0, 0, 0, 1, 1,
-0.5746838, 0.58494, -0.7774724, 0, 0, 0, 1, 1,
-0.5737025, 1.143492, 1.294305, 0, 0, 0, 1, 1,
-0.5731911, 0.3309392, -0.4163107, 0, 0, 0, 1, 1,
-0.5685226, 0.07736548, -1.711916, 0, 0, 0, 1, 1,
-0.5669183, -0.8645058, -2.61551, 1, 1, 1, 1, 1,
-0.5583839, -0.3324166, -0.3208312, 1, 1, 1, 1, 1,
-0.5576597, 0.4557595, -0.1356239, 1, 1, 1, 1, 1,
-0.5559709, -0.5096929, -2.870558, 1, 1, 1, 1, 1,
-0.5540985, 0.02793152, -1.154932, 1, 1, 1, 1, 1,
-0.5519802, 0.6077237, -0.9865184, 1, 1, 1, 1, 1,
-0.5487327, 1.908299, -0.9767192, 1, 1, 1, 1, 1,
-0.5370846, 0.3208405, -2.184273, 1, 1, 1, 1, 1,
-0.5370404, -2.098767, -4.060424, 1, 1, 1, 1, 1,
-0.5347585, -0.5529151, -3.81339, 1, 1, 1, 1, 1,
-0.5328797, 0.5900759, -0.06129377, 1, 1, 1, 1, 1,
-0.527431, 1.12049, -1.197477, 1, 1, 1, 1, 1,
-0.5266369, -0.8154677, -2.901588, 1, 1, 1, 1, 1,
-0.5199871, 0.2107882, -1.337537, 1, 1, 1, 1, 1,
-0.5198169, 0.1874337, -1.96706, 1, 1, 1, 1, 1,
-0.5170631, 0.8117594, 0.1221288, 0, 0, 1, 1, 1,
-0.5160192, 0.7657773, 0.3220024, 1, 0, 0, 1, 1,
-0.5146576, 1.493784, 0.2838556, 1, 0, 0, 1, 1,
-0.5137084, 1.647972, 0.6113616, 1, 0, 0, 1, 1,
-0.5132618, 0.8556274, -2.251821, 1, 0, 0, 1, 1,
-0.5102661, 0.5994635, -2.065444, 1, 0, 0, 1, 1,
-0.5062037, -0.2381402, -2.216539, 0, 0, 0, 1, 1,
-0.5061672, 1.086249, -0.8117452, 0, 0, 0, 1, 1,
-0.5017632, -0.3304161, -1.949206, 0, 0, 0, 1, 1,
-0.4993044, -1.10694, -2.872784, 0, 0, 0, 1, 1,
-0.4929553, -0.944845, -3.01935, 0, 0, 0, 1, 1,
-0.4917774, -1.979019, -1.481768, 0, 0, 0, 1, 1,
-0.489888, -1.516996, -2.792831, 0, 0, 0, 1, 1,
-0.4856845, -1.244018, -0.3843679, 1, 1, 1, 1, 1,
-0.4833146, 1.807552, -0.9581773, 1, 1, 1, 1, 1,
-0.4831808, -0.7338369, -0.2427393, 1, 1, 1, 1, 1,
-0.483082, 0.2162934, -0.2950157, 1, 1, 1, 1, 1,
-0.482406, 0.9984514, -1.719926, 1, 1, 1, 1, 1,
-0.4821411, 0.2502171, -1.50703, 1, 1, 1, 1, 1,
-0.4797389, 2.014426, -1.167694, 1, 1, 1, 1, 1,
-0.478908, 0.9323518, 0.0477747, 1, 1, 1, 1, 1,
-0.4779597, 1.666039, -1.743708, 1, 1, 1, 1, 1,
-0.4673665, 0.02082498, -2.427483, 1, 1, 1, 1, 1,
-0.4606849, 0.6896909, -1.116447, 1, 1, 1, 1, 1,
-0.4567695, -0.2381256, -1.456834, 1, 1, 1, 1, 1,
-0.4546995, 1.73322, 0.3964262, 1, 1, 1, 1, 1,
-0.4532738, 0.3878336, -1.97171, 1, 1, 1, 1, 1,
-0.4503176, 0.6546279, -0.2473285, 1, 1, 1, 1, 1,
-0.4446236, 0.101963, -0.5360924, 0, 0, 1, 1, 1,
-0.4445137, 1.236387, 0.2912548, 1, 0, 0, 1, 1,
-0.4399044, -0.9938771, -3.120455, 1, 0, 0, 1, 1,
-0.4363087, -0.627953, -4.193944, 1, 0, 0, 1, 1,
-0.4291792, -0.8960103, -3.101681, 1, 0, 0, 1, 1,
-0.4254948, -1.076943, -3.6508, 1, 0, 0, 1, 1,
-0.4237359, 0.2669044, -0.4083491, 0, 0, 0, 1, 1,
-0.4223846, -0.3309218, -2.354747, 0, 0, 0, 1, 1,
-0.421971, -0.2130366, -3.00382, 0, 0, 0, 1, 1,
-0.4203008, 0.03710523, -0.6642144, 0, 0, 0, 1, 1,
-0.4172327, 0.6980178, -0.08010142, 0, 0, 0, 1, 1,
-0.4168409, -0.3201555, -3.133336, 0, 0, 0, 1, 1,
-0.4167581, 0.2141118, -0.7724378, 0, 0, 0, 1, 1,
-0.4139249, -0.7535803, -2.039026, 1, 1, 1, 1, 1,
-0.4097203, -0.3886096, -3.252452, 1, 1, 1, 1, 1,
-0.4060676, 1.119012, -1.841552, 1, 1, 1, 1, 1,
-0.4055113, 1.065974, 0.5973641, 1, 1, 1, 1, 1,
-0.4021715, 0.7555487, -1.448769, 1, 1, 1, 1, 1,
-0.3949532, 0.3555795, -1.066251, 1, 1, 1, 1, 1,
-0.3929183, -0.4140526, -2.3756, 1, 1, 1, 1, 1,
-0.3917266, -1.399475, -2.235978, 1, 1, 1, 1, 1,
-0.3849248, -1.058869, -3.806522, 1, 1, 1, 1, 1,
-0.3803764, 0.2161961, -3.678025, 1, 1, 1, 1, 1,
-0.374359, -0.8373978, -3.416042, 1, 1, 1, 1, 1,
-0.3712137, -0.7391505, -1.09054, 1, 1, 1, 1, 1,
-0.3688364, 0.4186543, 0.4640432, 1, 1, 1, 1, 1,
-0.3670272, 0.4942692, 1.429331, 1, 1, 1, 1, 1,
-0.3668173, 0.5067316, -0.2871695, 1, 1, 1, 1, 1,
-0.3644176, 0.02073355, -1.616245, 0, 0, 1, 1, 1,
-0.3565079, 0.6532488, 0.4588867, 1, 0, 0, 1, 1,
-0.3488146, 0.3551979, 0.1223109, 1, 0, 0, 1, 1,
-0.3464978, 0.4978185, 0.03410216, 1, 0, 0, 1, 1,
-0.3360474, -0.2226274, -4.362566, 1, 0, 0, 1, 1,
-0.335481, -0.3321857, -2.231598, 1, 0, 0, 1, 1,
-0.3349754, 1.356349, -0.9122418, 0, 0, 0, 1, 1,
-0.3342984, -0.3333131, -2.327076, 0, 0, 0, 1, 1,
-0.3340545, -1.231489, -2.066831, 0, 0, 0, 1, 1,
-0.3318716, -0.8467193, -3.211791, 0, 0, 0, 1, 1,
-0.3268154, 0.9199548, -1.400281, 0, 0, 0, 1, 1,
-0.3196979, 0.2360594, -0.2443503, 0, 0, 0, 1, 1,
-0.3191427, 0.4443037, -0.5759057, 0, 0, 0, 1, 1,
-0.3140534, -0.07870843, -2.350613, 1, 1, 1, 1, 1,
-0.3102995, -0.627628, -3.466644, 1, 1, 1, 1, 1,
-0.3075759, 0.5975379, 0.02176913, 1, 1, 1, 1, 1,
-0.3055431, -0.6153205, -2.027095, 1, 1, 1, 1, 1,
-0.3038872, 1.174081, -1.732533, 1, 1, 1, 1, 1,
-0.3021502, -0.3980474, -2.391412, 1, 1, 1, 1, 1,
-0.2988297, -0.3190511, -3.199073, 1, 1, 1, 1, 1,
-0.2953728, -0.5590552, -2.746426, 1, 1, 1, 1, 1,
-0.2928471, 1.194828, -1.892404, 1, 1, 1, 1, 1,
-0.2871484, 0.5911447, -0.3781922, 1, 1, 1, 1, 1,
-0.2859344, -0.235487, -3.931753, 1, 1, 1, 1, 1,
-0.2849175, 0.1250028, -3.38785, 1, 1, 1, 1, 1,
-0.2846846, 0.100707, 1.208296, 1, 1, 1, 1, 1,
-0.2845867, -0.2574724, -2.765202, 1, 1, 1, 1, 1,
-0.2838517, -0.1505368, -1.280066, 1, 1, 1, 1, 1,
-0.282633, -0.4965693, -2.736644, 0, 0, 1, 1, 1,
-0.2812076, 0.07731324, -0.6923299, 1, 0, 0, 1, 1,
-0.2811692, -2.298779, -4.124443, 1, 0, 0, 1, 1,
-0.2808861, 0.07940687, -3.021416, 1, 0, 0, 1, 1,
-0.2776523, -0.2200407, -3.420105, 1, 0, 0, 1, 1,
-0.2733999, -0.53928, -2.572388, 1, 0, 0, 1, 1,
-0.2722277, -0.3870138, -2.134592, 0, 0, 0, 1, 1,
-0.2710305, 0.2257775, 1.167488, 0, 0, 0, 1, 1,
-0.2611633, -0.9595563, -2.586951, 0, 0, 0, 1, 1,
-0.2607006, -0.1247488, -0.4020011, 0, 0, 0, 1, 1,
-0.2573098, -0.8853669, -4.041304, 0, 0, 0, 1, 1,
-0.2561505, -0.6566019, -3.070099, 0, 0, 0, 1, 1,
-0.2557053, 0.4703626, 0.1913107, 0, 0, 0, 1, 1,
-0.2544758, -1.026343, -3.888837, 1, 1, 1, 1, 1,
-0.2528266, 0.9815517, -0.6857934, 1, 1, 1, 1, 1,
-0.2515051, 0.8401635, -1.310132, 1, 1, 1, 1, 1,
-0.2514151, 1.275369, 1.762963, 1, 1, 1, 1, 1,
-0.2501823, -1.024004, -5.05524, 1, 1, 1, 1, 1,
-0.2473792, 0.6521481, -2.254202, 1, 1, 1, 1, 1,
-0.2432826, -0.9698799, -2.096667, 1, 1, 1, 1, 1,
-0.2423153, -0.3503918, -3.723291, 1, 1, 1, 1, 1,
-0.2387237, 2.731188, -1.607635, 1, 1, 1, 1, 1,
-0.2379224, -0.9081497, -5.971064, 1, 1, 1, 1, 1,
-0.2357806, -0.1878985, -0.958768, 1, 1, 1, 1, 1,
-0.2354144, -1.224412, -3.756661, 1, 1, 1, 1, 1,
-0.2271487, 0.3227021, 1.125318, 1, 1, 1, 1, 1,
-0.2234557, -1.061341, -2.272342, 1, 1, 1, 1, 1,
-0.2138932, 0.6333346, 1.209562, 1, 1, 1, 1, 1,
-0.2128999, -1.460718, -3.911385, 0, 0, 1, 1, 1,
-0.2109826, 0.3959511, -1.883532, 1, 0, 0, 1, 1,
-0.2109066, 1.022439, 1.384359, 1, 0, 0, 1, 1,
-0.2105072, 0.542029, -0.08521817, 1, 0, 0, 1, 1,
-0.2090885, 0.009461874, -2.365839, 1, 0, 0, 1, 1,
-0.2074976, -2.129812, -3.303362, 1, 0, 0, 1, 1,
-0.2067848, -0.00490775, 0.1441903, 0, 0, 0, 1, 1,
-0.2016802, -0.1812019, -2.262871, 0, 0, 0, 1, 1,
-0.2015884, 0.7222537, -1.786814, 0, 0, 0, 1, 1,
-0.1926423, -0.003112115, -0.184239, 0, 0, 0, 1, 1,
-0.1898621, 1.189551, 0.4455499, 0, 0, 0, 1, 1,
-0.189226, 1.187931, -3.051903, 0, 0, 0, 1, 1,
-0.1858702, -0.4076481, -1.760207, 0, 0, 0, 1, 1,
-0.1847781, -0.4978958, 0.205924, 1, 1, 1, 1, 1,
-0.178376, -1.458769, -3.508069, 1, 1, 1, 1, 1,
-0.1766325, 1.108949, 0.2904775, 1, 1, 1, 1, 1,
-0.1744728, 0.996756, -0.2949971, 1, 1, 1, 1, 1,
-0.1731997, -1.733191, -4.897969, 1, 1, 1, 1, 1,
-0.1728373, 0.6548078, 0.320048, 1, 1, 1, 1, 1,
-0.1728243, 0.9046549, -0.5120886, 1, 1, 1, 1, 1,
-0.1720208, 1.209923, -0.1338297, 1, 1, 1, 1, 1,
-0.1710668, 1.236912, -0.7925848, 1, 1, 1, 1, 1,
-0.170242, 0.6421947, -0.4459679, 1, 1, 1, 1, 1,
-0.1696291, 0.3312035, 0.5759346, 1, 1, 1, 1, 1,
-0.1686921, -0.6798924, -2.711203, 1, 1, 1, 1, 1,
-0.168179, 2.096481, 1.691647, 1, 1, 1, 1, 1,
-0.168176, 1.353384, 1.695197, 1, 1, 1, 1, 1,
-0.1672431, 1.597217, -1.264031, 1, 1, 1, 1, 1,
-0.1657632, 0.7761496, -0.0693, 0, 0, 1, 1, 1,
-0.1648919, 0.7406051, -0.1562164, 1, 0, 0, 1, 1,
-0.1646104, -1.060462, -1.939193, 1, 0, 0, 1, 1,
-0.1639378, 0.6107317, 1.077529, 1, 0, 0, 1, 1,
-0.1624813, -0.5319158, -2.94056, 1, 0, 0, 1, 1,
-0.1576857, 0.9040784, -0.7403536, 1, 0, 0, 1, 1,
-0.1568435, 1.298046, -0.2904167, 0, 0, 0, 1, 1,
-0.1557454, 0.7478887, -0.06933266, 0, 0, 0, 1, 1,
-0.1551348, 1.287195, 0.1834578, 0, 0, 0, 1, 1,
-0.153325, 0.4519309, -1.386907, 0, 0, 0, 1, 1,
-0.1506755, 0.03599792, -2.807653, 0, 0, 0, 1, 1,
-0.1502974, -1.701603, -1.295302, 0, 0, 0, 1, 1,
-0.149038, -0.4154126, -2.43942, 0, 0, 0, 1, 1,
-0.1465316, -0.2484736, -2.452377, 1, 1, 1, 1, 1,
-0.1453511, -0.338369, -2.891906, 1, 1, 1, 1, 1,
-0.1448771, -0.3371939, -2.88264, 1, 1, 1, 1, 1,
-0.1426055, -2.153941, -2.885018, 1, 1, 1, 1, 1,
-0.1391544, 1.231538, 0.8373925, 1, 1, 1, 1, 1,
-0.1380409, 0.2287162, 2.406649, 1, 1, 1, 1, 1,
-0.1379215, -0.04169529, -2.251226, 1, 1, 1, 1, 1,
-0.1376033, -0.9972099, -2.562293, 1, 1, 1, 1, 1,
-0.1365394, -0.522074, -2.988594, 1, 1, 1, 1, 1,
-0.134653, -1.287754, -3.258629, 1, 1, 1, 1, 1,
-0.134596, 1.356163, 0.8231028, 1, 1, 1, 1, 1,
-0.1309586, -0.1052101, -1.488125, 1, 1, 1, 1, 1,
-0.1304161, 0.5635029, 0.4184412, 1, 1, 1, 1, 1,
-0.1296099, -0.3868707, -1.582773, 1, 1, 1, 1, 1,
-0.1284238, 0.6706131, -0.5494287, 1, 1, 1, 1, 1,
-0.1238451, -1.384144, -2.337679, 0, 0, 1, 1, 1,
-0.1176654, 0.4077584, -0.1788886, 1, 0, 0, 1, 1,
-0.1164191, 0.6312348, -0.4725607, 1, 0, 0, 1, 1,
-0.114334, -0.3337624, -3.950119, 1, 0, 0, 1, 1,
-0.1130799, -0.3068369, -3.374249, 1, 0, 0, 1, 1,
-0.104476, 0.8101737, -6.559122e-05, 1, 0, 0, 1, 1,
-0.1008654, -1.837558, -1.156315, 0, 0, 0, 1, 1,
-0.09949044, 1.104037, 0.6053977, 0, 0, 0, 1, 1,
-0.09908746, -0.09332737, -2.179236, 0, 0, 0, 1, 1,
-0.09262362, -2.331097, -4.021008, 0, 0, 0, 1, 1,
-0.08692856, -1.902179, -3.380804, 0, 0, 0, 1, 1,
-0.08549594, -0.7253944, -4.250199, 0, 0, 0, 1, 1,
-0.07911807, -1.349634, -0.6358563, 0, 0, 0, 1, 1,
-0.07609901, 0.06186661, -1.895176, 1, 1, 1, 1, 1,
-0.07592859, 0.1486613, -2.733429, 1, 1, 1, 1, 1,
-0.0726494, -0.6227039, -1.197847, 1, 1, 1, 1, 1,
-0.0715013, 0.04776571, -1.436533, 1, 1, 1, 1, 1,
-0.07079885, 0.4750362, -1.869117, 1, 1, 1, 1, 1,
-0.06970258, -0.1836939, -2.481107, 1, 1, 1, 1, 1,
-0.06380972, -0.5715788, -2.904517, 1, 1, 1, 1, 1,
-0.06051703, -0.4868237, -2.216714, 1, 1, 1, 1, 1,
-0.05475006, -0.6192069, -2.989404, 1, 1, 1, 1, 1,
-0.04329534, -1.463326, -1.5628, 1, 1, 1, 1, 1,
-0.0431169, 0.365707, -2.078932, 1, 1, 1, 1, 1,
-0.0428257, -0.5446032, -2.728826, 1, 1, 1, 1, 1,
-0.04276505, 0.26764, -0.3170773, 1, 1, 1, 1, 1,
-0.04088434, -2.156023, -3.670128, 1, 1, 1, 1, 1,
-0.04058099, 0.3229599, -0.8023297, 1, 1, 1, 1, 1,
-0.03787585, 1.26321, -1.095205, 0, 0, 1, 1, 1,
-0.0368304, -1.4033, -2.483302, 1, 0, 0, 1, 1,
-0.03441606, 1.248614, -0.9145265, 1, 0, 0, 1, 1,
-0.02666108, 0.006798547, -0.7644028, 1, 0, 0, 1, 1,
-0.01959674, -0.4611564, -2.681907, 1, 0, 0, 1, 1,
-0.01405277, 0.1106746, -0.5507856, 1, 0, 0, 1, 1,
-0.01403419, 0.5729993, -0.2496136, 0, 0, 0, 1, 1,
-0.01371876, 0.02179013, -1.096576, 0, 0, 0, 1, 1,
-0.01180477, -0.09787668, -3.394419, 0, 0, 0, 1, 1,
-0.008651702, 0.2374599, -0.09034614, 0, 0, 0, 1, 1,
0.0005530947, -0.4895571, 1.900454, 0, 0, 0, 1, 1,
0.002839888, -0.1024857, 2.580498, 0, 0, 0, 1, 1,
0.01313338, 0.4013892, -2.197943, 0, 0, 0, 1, 1,
0.01470716, 0.2609147, 0.3273279, 1, 1, 1, 1, 1,
0.01707367, -0.2167428, 4.327462, 1, 1, 1, 1, 1,
0.02071534, -0.3851894, 4.468344, 1, 1, 1, 1, 1,
0.02310988, -0.2878001, 3.214901, 1, 1, 1, 1, 1,
0.02420888, 0.8302024, 0.1303275, 1, 1, 1, 1, 1,
0.02611518, 0.7995603, -0.8996787, 1, 1, 1, 1, 1,
0.0264505, -0.9307045, 3.975896, 1, 1, 1, 1, 1,
0.02828362, 0.1073729, -1.203753, 1, 1, 1, 1, 1,
0.0290317, 1.414126, 1.130737, 1, 1, 1, 1, 1,
0.03234344, -1.371578, 3.301614, 1, 1, 1, 1, 1,
0.03549441, -1.031214, 3.883219, 1, 1, 1, 1, 1,
0.03714033, -0.5484116, 2.1569, 1, 1, 1, 1, 1,
0.04199163, 0.8399619, -0.4955684, 1, 1, 1, 1, 1,
0.04702251, -1.728122, 3.28084, 1, 1, 1, 1, 1,
0.05133895, -2.585962, 2.818086, 1, 1, 1, 1, 1,
0.05822791, 0.02516364, 1.961813, 0, 0, 1, 1, 1,
0.06058461, -1.395777, 2.700067, 1, 0, 0, 1, 1,
0.06308784, 1.044338, 0.374613, 1, 0, 0, 1, 1,
0.06495541, 0.5981737, 0.8909695, 1, 0, 0, 1, 1,
0.06555716, -0.7992938, 4.502884, 1, 0, 0, 1, 1,
0.06802226, -0.528469, 4.002833, 1, 0, 0, 1, 1,
0.0681534, -1.00229, 2.787344, 0, 0, 0, 1, 1,
0.06978097, 1.337429, -0.4064488, 0, 0, 0, 1, 1,
0.07170791, -1.079239, 2.17348, 0, 0, 0, 1, 1,
0.07510634, -0.6875024, 4.04114, 0, 0, 0, 1, 1,
0.07628311, 2.219703, -0.4496279, 0, 0, 0, 1, 1,
0.08169742, 2.328632, 0.8462013, 0, 0, 0, 1, 1,
0.08178551, -0.7124754, 5.355844, 0, 0, 0, 1, 1,
0.08385835, -1.619846, 1.917566, 1, 1, 1, 1, 1,
0.08416685, 1.0087, -0.7240977, 1, 1, 1, 1, 1,
0.09311984, -0.07430069, 2.862362, 1, 1, 1, 1, 1,
0.09364679, 0.270326, -0.8424473, 1, 1, 1, 1, 1,
0.0947916, -0.6839992, 1.995064, 1, 1, 1, 1, 1,
0.09497026, 0.2872536, 0.4007721, 1, 1, 1, 1, 1,
0.09539724, 0.4247723, 0.8686036, 1, 1, 1, 1, 1,
0.09717697, 0.8314679, -0.6237617, 1, 1, 1, 1, 1,
0.100293, -1.260877, 1.17313, 1, 1, 1, 1, 1,
0.1052049, 1.240193, 0.1469222, 1, 1, 1, 1, 1,
0.1054837, -1.125973, 4.376073, 1, 1, 1, 1, 1,
0.1055182, 0.1606081, 0.3086225, 1, 1, 1, 1, 1,
0.1062161, 0.245452, -0.3395566, 1, 1, 1, 1, 1,
0.1076273, 0.5102395, 1.506613, 1, 1, 1, 1, 1,
0.108364, -0.07228474, 1.364806, 1, 1, 1, 1, 1,
0.1120283, 0.767152, -0.02410073, 0, 0, 1, 1, 1,
0.1132016, -2.083266, 1.590524, 1, 0, 0, 1, 1,
0.1138038, 0.6936089, 0.5125486, 1, 0, 0, 1, 1,
0.1167446, -0.9049089, 3.405616, 1, 0, 0, 1, 1,
0.1176352, -0.05874852, 3.018373, 1, 0, 0, 1, 1,
0.1199582, -0.5844383, 2.373873, 1, 0, 0, 1, 1,
0.125778, 0.2359781, -0.4883743, 0, 0, 0, 1, 1,
0.127048, -0.928262, 3.9762, 0, 0, 0, 1, 1,
0.127451, 0.0975977, 1.085719, 0, 0, 0, 1, 1,
0.1341592, 0.617543, -0.2060062, 0, 0, 0, 1, 1,
0.1348553, -0.1640288, 3.272597, 0, 0, 0, 1, 1,
0.1375867, 0.700492, -0.09493124, 0, 0, 0, 1, 1,
0.1501632, -1.000578, 3.148231, 0, 0, 0, 1, 1,
0.1516039, -1.791536, 2.595604, 1, 1, 1, 1, 1,
0.1553034, -1.011868, 3.386263, 1, 1, 1, 1, 1,
0.1571745, -0.6647305, 0.9854789, 1, 1, 1, 1, 1,
0.1609016, -0.7241497, 3.375248, 1, 1, 1, 1, 1,
0.161667, 0.6696951, 0.8750796, 1, 1, 1, 1, 1,
0.1680911, 0.2836156, 1.894107, 1, 1, 1, 1, 1,
0.1715782, -1.074425, 1.319696, 1, 1, 1, 1, 1,
0.1720654, 0.2099387, 2.992538, 1, 1, 1, 1, 1,
0.1721135, 0.6926372, 0.6309578, 1, 1, 1, 1, 1,
0.1726112, -0.4950068, 2.4793, 1, 1, 1, 1, 1,
0.1728084, -0.4271321, 4.073789, 1, 1, 1, 1, 1,
0.1765248, 1.225239, 0.3084033, 1, 1, 1, 1, 1,
0.1786777, 0.479526, -0.5163777, 1, 1, 1, 1, 1,
0.1793828, 0.8049825, 1.257738, 1, 1, 1, 1, 1,
0.1828898, 0.9976246, -1.01966, 1, 1, 1, 1, 1,
0.1872991, -2.568921, 3.402016, 0, 0, 1, 1, 1,
0.1884728, -1.609964, 1.098782, 1, 0, 0, 1, 1,
0.1906557, -1.242209, 3.082868, 1, 0, 0, 1, 1,
0.1917564, 0.1678053, 2.163169, 1, 0, 0, 1, 1,
0.1933078, 0.9641904, 0.2513576, 1, 0, 0, 1, 1,
0.1934182, 0.2864606, -0.1660706, 1, 0, 0, 1, 1,
0.1935399, -0.4438531, 2.208414, 0, 0, 0, 1, 1,
0.1938197, -1.766642, 4.003968, 0, 0, 0, 1, 1,
0.2020468, -0.5580734, 3.805069, 0, 0, 0, 1, 1,
0.2024914, -1.359716, 3.297145, 0, 0, 0, 1, 1,
0.2030337, -1.013254, 3.627746, 0, 0, 0, 1, 1,
0.2034398, 1.54856, 1.133023, 0, 0, 0, 1, 1,
0.2098763, 1.321541, -0.2997224, 0, 0, 0, 1, 1,
0.2117814, 0.01014742, 2.604179, 1, 1, 1, 1, 1,
0.2120334, 0.4578442, 0.2630282, 1, 1, 1, 1, 1,
0.212565, 0.7702399, 1.926575, 1, 1, 1, 1, 1,
0.2161881, -0.08705164, 1.666339, 1, 1, 1, 1, 1,
0.21788, -0.6593974, 2.950354, 1, 1, 1, 1, 1,
0.2179198, 1.715247, 1.025929, 1, 1, 1, 1, 1,
0.2195463, 0.1853764, 1.879599, 1, 1, 1, 1, 1,
0.2213942, -0.7513018, 1.379288, 1, 1, 1, 1, 1,
0.2241603, 0.4800455, -1.454511, 1, 1, 1, 1, 1,
0.2247094, -0.6286771, 2.240216, 1, 1, 1, 1, 1,
0.2260304, 0.219234, 1.993983, 1, 1, 1, 1, 1,
0.2278067, 0.9279613, -0.9959544, 1, 1, 1, 1, 1,
0.2287986, -0.6658928, 2.898146, 1, 1, 1, 1, 1,
0.2299861, -0.6294408, 3.846126, 1, 1, 1, 1, 1,
0.2312454, -0.6791743, 4.327761, 1, 1, 1, 1, 1,
0.2373306, 1.747602, -0.5687146, 0, 0, 1, 1, 1,
0.2413952, -0.3786651, 3.648525, 1, 0, 0, 1, 1,
0.2424958, 1.828829, 0.1289566, 1, 0, 0, 1, 1,
0.2441105, 0.6400903, -1.292939, 1, 0, 0, 1, 1,
0.2458948, 0.2044607, 0.7413774, 1, 0, 0, 1, 1,
0.2475445, 2.032882, 0.5992702, 1, 0, 0, 1, 1,
0.2480295, -1.076533, 3.338095, 0, 0, 0, 1, 1,
0.2570962, -1.374993, 4.548306, 0, 0, 0, 1, 1,
0.2646737, 2.345932, -1.522834, 0, 0, 0, 1, 1,
0.2695834, 0.4075483, -0.8297082, 0, 0, 0, 1, 1,
0.2743031, 0.335365, 2.600497, 0, 0, 0, 1, 1,
0.2751342, -2.839954, 3.115603, 0, 0, 0, 1, 1,
0.2751757, 1.932334, -1.105771, 0, 0, 0, 1, 1,
0.2820238, -0.4481584, 3.483979, 1, 1, 1, 1, 1,
0.2824745, 1.327353, 1.407778, 1, 1, 1, 1, 1,
0.2940748, 0.7634857, -0.8127466, 1, 1, 1, 1, 1,
0.296061, 0.9383322, 0.3568639, 1, 1, 1, 1, 1,
0.2983861, -0.5635087, 3.563603, 1, 1, 1, 1, 1,
0.3004643, -0.8590505, 3.204871, 1, 1, 1, 1, 1,
0.3058545, -0.33384, 1.937023, 1, 1, 1, 1, 1,
0.3133841, 0.5236035, -0.896562, 1, 1, 1, 1, 1,
0.3134373, 0.1184663, 1.42485, 1, 1, 1, 1, 1,
0.3193969, 0.1978871, -0.8952264, 1, 1, 1, 1, 1,
0.3194078, 0.2858593, 0.8930473, 1, 1, 1, 1, 1,
0.3204985, -0.2037401, 1.989439, 1, 1, 1, 1, 1,
0.3246916, -1.24523, 3.339497, 1, 1, 1, 1, 1,
0.3284601, 0.6019267, -0.2948492, 1, 1, 1, 1, 1,
0.3320251, -0.1745955, 1.267908, 1, 1, 1, 1, 1,
0.3344035, -0.04980051, 2.035737, 0, 0, 1, 1, 1,
0.3353157, 0.2606511, 1.290607, 1, 0, 0, 1, 1,
0.3397057, 0.7488173, -0.3067884, 1, 0, 0, 1, 1,
0.3478778, -0.1199626, 2.291981, 1, 0, 0, 1, 1,
0.3518243, 2.144611, 0.5935103, 1, 0, 0, 1, 1,
0.3555318, 0.1271033, 2.216513, 1, 0, 0, 1, 1,
0.3587047, 0.9120209, 2.808768, 0, 0, 0, 1, 1,
0.3602408, 0.9981117, -0.1436981, 0, 0, 0, 1, 1,
0.3646071, 0.725323, -0.5312636, 0, 0, 0, 1, 1,
0.3701724, 0.06910199, -0.2286261, 0, 0, 0, 1, 1,
0.3708671, 1.277735, 1.313897, 0, 0, 0, 1, 1,
0.3742501, 1.89875, 1.122778, 0, 0, 0, 1, 1,
0.3747048, 0.1972741, 0.07931586, 0, 0, 0, 1, 1,
0.3767043, -2.016778, 1.821073, 1, 1, 1, 1, 1,
0.3781503, -0.7508008, 3.763827, 1, 1, 1, 1, 1,
0.379814, -0.2177685, 1.944831, 1, 1, 1, 1, 1,
0.380862, -0.6863825, 3.744492, 1, 1, 1, 1, 1,
0.3817228, 0.4301935, 1.670114, 1, 1, 1, 1, 1,
0.3820975, -1.960905, 2.332603, 1, 1, 1, 1, 1,
0.3821613, -1.317028, 2.239178, 1, 1, 1, 1, 1,
0.384115, -1.072427, 4.612731, 1, 1, 1, 1, 1,
0.3856927, -1.108777, 2.067355, 1, 1, 1, 1, 1,
0.3867205, 0.444208, 0.8029537, 1, 1, 1, 1, 1,
0.3874851, -1.856631, 4.808457, 1, 1, 1, 1, 1,
0.3886883, 0.5982656, -0.4769056, 1, 1, 1, 1, 1,
0.3914246, 1.33854, 0.05169245, 1, 1, 1, 1, 1,
0.3936763, 0.06654672, 0.9550346, 1, 1, 1, 1, 1,
0.39484, -1.462162, 3.502023, 1, 1, 1, 1, 1,
0.4067274, 0.6856074, -0.2208159, 0, 0, 1, 1, 1,
0.4079286, -0.1808061, 2.067992, 1, 0, 0, 1, 1,
0.4168062, -0.7916962, 2.689705, 1, 0, 0, 1, 1,
0.4206277, -0.3996418, 2.36305, 1, 0, 0, 1, 1,
0.4211091, 0.2764833, -1.406311, 1, 0, 0, 1, 1,
0.423154, -1.460789, 2.595347, 1, 0, 0, 1, 1,
0.4231748, 1.795503, 1.034623, 0, 0, 0, 1, 1,
0.4251545, -0.8405648, 2.766715, 0, 0, 0, 1, 1,
0.4256248, 0.4828628, 1.190091, 0, 0, 0, 1, 1,
0.4358966, 0.7578964, 0.5896956, 0, 0, 0, 1, 1,
0.4364832, 1.882056, -1.010543, 0, 0, 0, 1, 1,
0.4375242, 1.486237, 1.996353, 0, 0, 0, 1, 1,
0.4380536, -1.718352, 2.516906, 0, 0, 0, 1, 1,
0.4394381, 0.05564239, 2.407617, 1, 1, 1, 1, 1,
0.4400777, 1.373114, 0.6526015, 1, 1, 1, 1, 1,
0.4410615, 1.087564, 1.838107, 1, 1, 1, 1, 1,
0.4423927, 0.3658572, 1.471057, 1, 1, 1, 1, 1,
0.4460407, 0.0187362, 2.801415, 1, 1, 1, 1, 1,
0.4527878, 0.3299417, 0.6624321, 1, 1, 1, 1, 1,
0.4534318, 1.794158, 0.1917706, 1, 1, 1, 1, 1,
0.45417, 0.2349426, -0.05067104, 1, 1, 1, 1, 1,
0.454336, 1.516979, -0.5678197, 1, 1, 1, 1, 1,
0.4627638, 2.689134, -1.032903, 1, 1, 1, 1, 1,
0.4641715, -0.07863016, -0.6450149, 1, 1, 1, 1, 1,
0.4670793, 0.9116728, 0.7865632, 1, 1, 1, 1, 1,
0.4737955, 0.2691636, 0.2387008, 1, 1, 1, 1, 1,
0.4832864, 0.4521028, -0.917285, 1, 1, 1, 1, 1,
0.4875464, -0.4636526, 1.681464, 1, 1, 1, 1, 1,
0.4877686, -1.095605, 3.912448, 0, 0, 1, 1, 1,
0.4933331, 1.180505, 1.030904, 1, 0, 0, 1, 1,
0.4933773, -0.676352, 3.959013, 1, 0, 0, 1, 1,
0.4970024, -0.2449559, 1.771424, 1, 0, 0, 1, 1,
0.4998389, -0.6133114, 3.152917, 1, 0, 0, 1, 1,
0.5137568, 0.5097531, -0.03512433, 1, 0, 0, 1, 1,
0.5151611, 0.09725551, 0.8431636, 0, 0, 0, 1, 1,
0.5202922, 1.419999, -0.03922565, 0, 0, 0, 1, 1,
0.5210168, 1.421081, 0.1525552, 0, 0, 0, 1, 1,
0.5219091, 1.033852, 1.51057, 0, 0, 0, 1, 1,
0.5246162, 0.1562586, 1.757363, 0, 0, 0, 1, 1,
0.5253137, -1.314228, 1.034819, 0, 0, 0, 1, 1,
0.5272281, -1.257947, 3.370301, 0, 0, 0, 1, 1,
0.5279239, 1.109481, -0.6614837, 1, 1, 1, 1, 1,
0.5288283, 0.2289337, 0.877028, 1, 1, 1, 1, 1,
0.5291027, 1.399367, 0.5542639, 1, 1, 1, 1, 1,
0.5300675, -0.1781031, 1.019541, 1, 1, 1, 1, 1,
0.5326931, -0.2282562, 1.746569, 1, 1, 1, 1, 1,
0.5329077, 0.6824545, 0.6363593, 1, 1, 1, 1, 1,
0.5342479, 0.1193697, 0.7067599, 1, 1, 1, 1, 1,
0.540707, 0.4448533, 1.154537, 1, 1, 1, 1, 1,
0.5431059, 0.5110849, 1.083133, 1, 1, 1, 1, 1,
0.543271, 0.5606783, 0.9852214, 1, 1, 1, 1, 1,
0.5432786, -0.8042674, 1.110572, 1, 1, 1, 1, 1,
0.5469547, 1.906863, 0.3031293, 1, 1, 1, 1, 1,
0.5580111, 2.149862, -0.7524506, 1, 1, 1, 1, 1,
0.5631469, -0.5905478, -1.771747, 1, 1, 1, 1, 1,
0.566744, 1.175542, 0.01282826, 1, 1, 1, 1, 1,
0.5669724, 0.3475821, 1.926968, 0, 0, 1, 1, 1,
0.5860823, 1.77916, -0.7637742, 1, 0, 0, 1, 1,
0.5901004, -1.809265, 5.533917, 1, 0, 0, 1, 1,
0.5909209, 0.9578092, -0.4215782, 1, 0, 0, 1, 1,
0.5921302, -0.9328021, 3.073595, 1, 0, 0, 1, 1,
0.5958394, 0.6754797, 0.2831608, 1, 0, 0, 1, 1,
0.5976275, -0.3658689, 2.591742, 0, 0, 0, 1, 1,
0.5976458, 1.015849, -0.05708966, 0, 0, 0, 1, 1,
0.6009052, -1.088478, 1.394281, 0, 0, 0, 1, 1,
0.6057932, 1.138796, 2.154257, 0, 0, 0, 1, 1,
0.6095976, 0.8203627, 0.4413754, 0, 0, 0, 1, 1,
0.6151643, 1.494165, 0.4772717, 0, 0, 0, 1, 1,
0.6168684, 0.133252, 1.636899, 0, 0, 0, 1, 1,
0.6176558, -0.9238794, 1.095364, 1, 1, 1, 1, 1,
0.6211689, 0.4925928, 0.04261152, 1, 1, 1, 1, 1,
0.6243872, 0.08308776, 2.573535, 1, 1, 1, 1, 1,
0.6290928, 1.614428, 1.224029, 1, 1, 1, 1, 1,
0.6299441, -0.1299836, 0.384187, 1, 1, 1, 1, 1,
0.6308172, -0.4067443, 2.821306, 1, 1, 1, 1, 1,
0.6354849, 0.5546098, 0.5246704, 1, 1, 1, 1, 1,
0.6390433, -0.6641346, 1.171082, 1, 1, 1, 1, 1,
0.6442901, 0.4784344, 1.129102, 1, 1, 1, 1, 1,
0.6448358, 0.1996171, 2.08951, 1, 1, 1, 1, 1,
0.6558381, 1.167754, 0.4374113, 1, 1, 1, 1, 1,
0.6560032, 0.1779502, 1.890129, 1, 1, 1, 1, 1,
0.6560324, 0.2816038, 0.6141092, 1, 1, 1, 1, 1,
0.656213, 1.186425, 0.0008638658, 1, 1, 1, 1, 1,
0.6618143, -0.1644371, 0.974377, 1, 1, 1, 1, 1,
0.6647242, -0.1628333, 2.573102, 0, 0, 1, 1, 1,
0.6787282, 0.2562263, 0.9025491, 1, 0, 0, 1, 1,
0.6820405, -0.6782093, 1.264454, 1, 0, 0, 1, 1,
0.6843522, -0.5192594, 2.712748, 1, 0, 0, 1, 1,
0.7036395, 1.457991, 1.62377, 1, 0, 0, 1, 1,
0.7127379, -0.6503845, 1.338207, 1, 0, 0, 1, 1,
0.7163706, 0.08776762, 1.337797, 0, 0, 0, 1, 1,
0.7261987, 0.493908, 0.1378929, 0, 0, 0, 1, 1,
0.7373328, 0.06032661, 2.403934, 0, 0, 0, 1, 1,
0.738732, -0.3333674, 2.463904, 0, 0, 0, 1, 1,
0.740495, -0.7443433, 3.916327, 0, 0, 0, 1, 1,
0.7405217, -0.6962801, 1.951249, 0, 0, 0, 1, 1,
0.7431608, 0.9277993, 0.657244, 0, 0, 0, 1, 1,
0.7432891, 0.1417202, 2.602891, 1, 1, 1, 1, 1,
0.7438564, 0.3313976, 1.278149, 1, 1, 1, 1, 1,
0.7478178, 0.08514396, 0.6753154, 1, 1, 1, 1, 1,
0.7489426, -0.5345759, 0.6637213, 1, 1, 1, 1, 1,
0.7498775, -2.151955, 4.049923, 1, 1, 1, 1, 1,
0.7516665, 1.005224, 0.2182582, 1, 1, 1, 1, 1,
0.7517229, 0.0672572, 0.7290787, 1, 1, 1, 1, 1,
0.7674551, 1.297037, 0.7853228, 1, 1, 1, 1, 1,
0.7714633, 0.8132425, 1.000671, 1, 1, 1, 1, 1,
0.7803463, 1.370073, 0.04361967, 1, 1, 1, 1, 1,
0.7883317, 0.03966492, 1.378461, 1, 1, 1, 1, 1,
0.7887832, -0.6635045, 1.335313, 1, 1, 1, 1, 1,
0.7943264, 0.4217411, 1.212141, 1, 1, 1, 1, 1,
0.7973728, -1.402872, 4.423854, 1, 1, 1, 1, 1,
0.7983599, 0.4103122, -0.5492416, 1, 1, 1, 1, 1,
0.8004437, 0.138832, 1.830579, 0, 0, 1, 1, 1,
0.8014791, 0.4957033, 2.277642, 1, 0, 0, 1, 1,
0.8071779, 0.298125, 0.8185244, 1, 0, 0, 1, 1,
0.8076056, 1.265486, 0.9291601, 1, 0, 0, 1, 1,
0.8127874, 0.0701505, 0.5655694, 1, 0, 0, 1, 1,
0.8197356, 0.8002272, -0.2567693, 1, 0, 0, 1, 1,
0.8239595, 0.2648862, 2.06491, 0, 0, 0, 1, 1,
0.8263012, 0.592748, 0.5578766, 0, 0, 0, 1, 1,
0.8310863, -1.124745, 2.798232, 0, 0, 0, 1, 1,
0.8323194, -0.7006706, 2.093315, 0, 0, 0, 1, 1,
0.8401455, 1.204309, -0.5595455, 0, 0, 0, 1, 1,
0.8413963, 1.043996, -0.1103756, 0, 0, 0, 1, 1,
0.8419117, 0.9586549, 1.379868, 0, 0, 0, 1, 1,
0.8457443, -0.4952317, -0.5964161, 1, 1, 1, 1, 1,
0.8471874, 1.201819, 1.038825, 1, 1, 1, 1, 1,
0.8486174, 0.5976508, 0.1810535, 1, 1, 1, 1, 1,
0.857646, -1.108855, 3.798342, 1, 1, 1, 1, 1,
0.8590218, -0.9113014, 2.575722, 1, 1, 1, 1, 1,
0.8676587, -0.1196758, -0.3861437, 1, 1, 1, 1, 1,
0.8707623, 1.236534, -0.02745853, 1, 1, 1, 1, 1,
0.8744673, 1.625742, 1.190563, 1, 1, 1, 1, 1,
0.8748832, 0.1853436, 2.383729, 1, 1, 1, 1, 1,
0.876745, 1.266891, 1.248521, 1, 1, 1, 1, 1,
0.8846865, 0.5541564, 1.736515, 1, 1, 1, 1, 1,
0.8895854, 0.1976748, 2.174879, 1, 1, 1, 1, 1,
0.8911766, -0.009939868, 0.01607588, 1, 1, 1, 1, 1,
0.9011272, 0.8861413, 0.7995991, 1, 1, 1, 1, 1,
0.9025742, 1.756598, -0.4014757, 1, 1, 1, 1, 1,
0.9027678, -1.119625, 0.4229842, 0, 0, 1, 1, 1,
0.9033778, -0.09503333, 2.498901, 1, 0, 0, 1, 1,
0.9064051, -0.05165481, 0.8205314, 1, 0, 0, 1, 1,
0.9072077, 1.070983, 2.4294, 1, 0, 0, 1, 1,
0.9084378, -0.391194, 3.378072, 1, 0, 0, 1, 1,
0.9102952, -0.6196413, 3.314471, 1, 0, 0, 1, 1,
0.9147354, -0.1747579, 0.4077898, 0, 0, 0, 1, 1,
0.917594, -0.7895416, 3.646242, 0, 0, 0, 1, 1,
0.9177519, 1.2648, -2.211653, 0, 0, 0, 1, 1,
0.9189902, 0.0589667, 1.009038, 0, 0, 0, 1, 1,
0.9226152, 0.8249574, -0.41372, 0, 0, 0, 1, 1,
0.9242082, 0.001675601, 0.2035841, 0, 0, 0, 1, 1,
0.9285831, 0.09937617, 2.420588, 0, 0, 0, 1, 1,
0.9311072, -0.6747485, 1.917644, 1, 1, 1, 1, 1,
0.931114, -0.2366987, 2.395824, 1, 1, 1, 1, 1,
0.9314902, -0.6624163, -0.001903136, 1, 1, 1, 1, 1,
0.9333613, 0.05409164, 0.6938958, 1, 1, 1, 1, 1,
0.9337317, -1.373133, 1.974644, 1, 1, 1, 1, 1,
0.9362061, 0.7338277, -0.1792475, 1, 1, 1, 1, 1,
0.9370388, -0.366489, 2.22938, 1, 1, 1, 1, 1,
0.9375799, -0.1275451, 0.4264979, 1, 1, 1, 1, 1,
0.9384577, 0.1160066, 1.485097, 1, 1, 1, 1, 1,
0.9391891, 1.282753, 1.507598, 1, 1, 1, 1, 1,
0.9408388, 1.543673, 0.129088, 1, 1, 1, 1, 1,
0.9412923, 0.065161, -0.000564268, 1, 1, 1, 1, 1,
0.9422362, 0.2906428, 2.599174, 1, 1, 1, 1, 1,
0.9440913, -0.03672858, 0.7817374, 1, 1, 1, 1, 1,
0.9443986, -0.2819789, 1.80557, 1, 1, 1, 1, 1,
0.9448304, 0.805167, 0.8371705, 0, 0, 1, 1, 1,
0.9509225, 0.4663443, 0.8207383, 1, 0, 0, 1, 1,
0.9623683, 1.677528, 1.199338, 1, 0, 0, 1, 1,
0.9628173, -0.8630644, 3.146769, 1, 0, 0, 1, 1,
0.9644982, -2.32456, 3.601158, 1, 0, 0, 1, 1,
0.9712647, 0.150819, -0.3290552, 1, 0, 0, 1, 1,
0.9723071, -0.002564478, 1.599785, 0, 0, 0, 1, 1,
0.9929625, 1.257802, 1.786266, 0, 0, 0, 1, 1,
0.9981476, -0.4548647, 3.181615, 0, 0, 0, 1, 1,
1.002521, -0.3147099, 2.913695, 0, 0, 0, 1, 1,
1.006539, 1.827831, 1.133429, 0, 0, 0, 1, 1,
1.016503, 0.9952344, 0.8310934, 0, 0, 0, 1, 1,
1.016533, -1.0382, 2.951301, 0, 0, 0, 1, 1,
1.023175, -0.1204399, 2.63662, 1, 1, 1, 1, 1,
1.027149, 1.031465, -0.2326598, 1, 1, 1, 1, 1,
1.028025, 1.893294, 0.7939144, 1, 1, 1, 1, 1,
1.031832, 1.533427, -1.119133, 1, 1, 1, 1, 1,
1.034897, 0.3790146, 0.8929601, 1, 1, 1, 1, 1,
1.044062, -0.7819351, 0.7624254, 1, 1, 1, 1, 1,
1.044112, 0.7391524, 1.711684, 1, 1, 1, 1, 1,
1.06134, -1.431629, 3.456769, 1, 1, 1, 1, 1,
1.066786, 1.044462, 2.330335, 1, 1, 1, 1, 1,
1.070188, 1.939467, -0.2413454, 1, 1, 1, 1, 1,
1.078171, 0.5035616, 1.591339, 1, 1, 1, 1, 1,
1.088881, -0.5231249, 2.217911, 1, 1, 1, 1, 1,
1.089306, 1.315783, -0.6759243, 1, 1, 1, 1, 1,
1.090703, -0.7211519, 1.962955, 1, 1, 1, 1, 1,
1.09501, 0.2273569, 0.9110731, 1, 1, 1, 1, 1,
1.096596, 0.3490896, 0.7074943, 0, 0, 1, 1, 1,
1.098158, -0.9571685, 2.879615, 1, 0, 0, 1, 1,
1.102865, -0.3902403, 2.397538, 1, 0, 0, 1, 1,
1.108355, -0.3517551, 0.4880135, 1, 0, 0, 1, 1,
1.118256, -0.1771377, 0.1967453, 1, 0, 0, 1, 1,
1.118328, 0.2690948, 2.686182, 1, 0, 0, 1, 1,
1.123189, -2.175386, 1.895041, 0, 0, 0, 1, 1,
1.123702, -0.1621878, 2.976965, 0, 0, 0, 1, 1,
1.134418, -0.5176099, 1.005563, 0, 0, 0, 1, 1,
1.14277, 1.316452, 0.9442478, 0, 0, 0, 1, 1,
1.143192, 0.2430555, 2.582338, 0, 0, 0, 1, 1,
1.145977, -0.9840504, 3.08539, 0, 0, 0, 1, 1,
1.149741, 0.03803588, 1.421303, 0, 0, 0, 1, 1,
1.153265, -0.01853291, 1.022035, 1, 1, 1, 1, 1,
1.158234, 0.2890396, 1.543741, 1, 1, 1, 1, 1,
1.167106, -0.03509478, 1.449316, 1, 1, 1, 1, 1,
1.175014, -0.3987681, -0.2632844, 1, 1, 1, 1, 1,
1.175077, 0.08525266, 2.529614, 1, 1, 1, 1, 1,
1.18665, 1.390127, 1.360231, 1, 1, 1, 1, 1,
1.188382, -1.803597, 3.252422, 1, 1, 1, 1, 1,
1.191486, -0.8686141, 3.354665, 1, 1, 1, 1, 1,
1.197748, -1.651358, 1.686507, 1, 1, 1, 1, 1,
1.20179, -0.3426366, 3.26614, 1, 1, 1, 1, 1,
1.210481, -1.461265, 1.353292, 1, 1, 1, 1, 1,
1.217417, -0.4667828, 2.18414, 1, 1, 1, 1, 1,
1.22264, -0.07470129, 3.287406, 1, 1, 1, 1, 1,
1.231849, 0.4477982, 1.448493, 1, 1, 1, 1, 1,
1.239812, 0.8312087, 0.9523168, 1, 1, 1, 1, 1,
1.240461, -1.305506, 2.588148, 0, 0, 1, 1, 1,
1.24068, 0.9398145, 2.089104, 1, 0, 0, 1, 1,
1.243319, -0.6641456, 2.0353, 1, 0, 0, 1, 1,
1.249163, 0.3932538, 1.032911, 1, 0, 0, 1, 1,
1.26027, -0.8573222, 1.535767, 1, 0, 0, 1, 1,
1.264444, 0.1470435, 1.731688, 1, 0, 0, 1, 1,
1.271874, -1.090041, 1.477347, 0, 0, 0, 1, 1,
1.27573, -2.877211, 4.135211, 0, 0, 0, 1, 1,
1.280195, -1.536905, 3.974392, 0, 0, 0, 1, 1,
1.284956, -0.1754717, 2.361689, 0, 0, 0, 1, 1,
1.287217, -0.8482643, 1.814468, 0, 0, 0, 1, 1,
1.295612, -0.1992988, 1.696597, 0, 0, 0, 1, 1,
1.298058, -0.8961051, 3.160208, 0, 0, 0, 1, 1,
1.303386, -0.1801777, 2.82232, 1, 1, 1, 1, 1,
1.309618, 1.37544, 1.479397, 1, 1, 1, 1, 1,
1.311574, 0.7407545, 0.672676, 1, 1, 1, 1, 1,
1.332956, 2.27204, 1.009966, 1, 1, 1, 1, 1,
1.333036, -0.7497562, 1.782299, 1, 1, 1, 1, 1,
1.348156, -0.9402252, 0.925327, 1, 1, 1, 1, 1,
1.349654, 0.08550683, 1.846034, 1, 1, 1, 1, 1,
1.3593, 0.4590566, 1.26861, 1, 1, 1, 1, 1,
1.362333, 0.6673816, -0.1621892, 1, 1, 1, 1, 1,
1.372088, 1.115532, 0.2705113, 1, 1, 1, 1, 1,
1.379495, -0.7586865, 2.716618, 1, 1, 1, 1, 1,
1.38844, -0.4654405, 1.52041, 1, 1, 1, 1, 1,
1.3937, -0.2704309, 1.46982, 1, 1, 1, 1, 1,
1.395568, -0.9341586, 2.329433, 1, 1, 1, 1, 1,
1.413661, 1.76002, 1.168529, 1, 1, 1, 1, 1,
1.413725, 1.229137, 0.7651629, 0, 0, 1, 1, 1,
1.416254, 1.617065, -0.2774154, 1, 0, 0, 1, 1,
1.419267, 0.2896479, 1.620962, 1, 0, 0, 1, 1,
1.423453, -0.7433922, 3.161079, 1, 0, 0, 1, 1,
1.429481, -0.2436589, 1.662692, 1, 0, 0, 1, 1,
1.43394, -0.6360587, 2.921468, 1, 0, 0, 1, 1,
1.44134, -1.558082, 2.822893, 0, 0, 0, 1, 1,
1.444421, 0.4171349, 0.8742535, 0, 0, 0, 1, 1,
1.452559, -0.06641726, 0.9489403, 0, 0, 0, 1, 1,
1.453353, 0.8065432, 0.4072903, 0, 0, 0, 1, 1,
1.456021, -0.6441305, 0.9316209, 0, 0, 0, 1, 1,
1.457789, 0.6097836, 1.389816, 0, 0, 0, 1, 1,
1.474971, 0.8103729, 0.3192663, 0, 0, 0, 1, 1,
1.484711, 0.4613197, 2.114361, 1, 1, 1, 1, 1,
1.487283, 0.7301677, 1.190141, 1, 1, 1, 1, 1,
1.489734, 0.8399951, 1.972845, 1, 1, 1, 1, 1,
1.503601, 0.4233414, 0.1098499, 1, 1, 1, 1, 1,
1.523784, 0.1067849, 2.693308, 1, 1, 1, 1, 1,
1.525327, 1.972867, 1.826371, 1, 1, 1, 1, 1,
1.525442, -0.9613399, 1.937614, 1, 1, 1, 1, 1,
1.537565, 1.383266, 0.02345672, 1, 1, 1, 1, 1,
1.547398, -1.278045, -0.001078027, 1, 1, 1, 1, 1,
1.551786, -0.9247671, 2.716429, 1, 1, 1, 1, 1,
1.554363, -1.510602, 1.548924, 1, 1, 1, 1, 1,
1.56608, 1.368183, -0.1854827, 1, 1, 1, 1, 1,
1.568602, -0.677739, 4.503284, 1, 1, 1, 1, 1,
1.570292, 0.1257539, 1.516159, 1, 1, 1, 1, 1,
1.598841, -0.3805442, 0.9631116, 1, 1, 1, 1, 1,
1.608442, 0.7592335, -0.1834296, 0, 0, 1, 1, 1,
1.609558, 1.696846, 0.2000547, 1, 0, 0, 1, 1,
1.617108, -0.9551722, 1.865045, 1, 0, 0, 1, 1,
1.622651, 2.338454, -0.1178409, 1, 0, 0, 1, 1,
1.629422, 0.1296105, 1.582948, 1, 0, 0, 1, 1,
1.639945, -1.377237, 2.170087, 1, 0, 0, 1, 1,
1.645676, 0.425703, 0.2993887, 0, 0, 0, 1, 1,
1.651303, 0.4308141, 0.3233328, 0, 0, 0, 1, 1,
1.665959, 0.9642755, 1.39434, 0, 0, 0, 1, 1,
1.669053, 0.1084994, 1.443622, 0, 0, 0, 1, 1,
1.67881, -1.312468, 2.681806, 0, 0, 0, 1, 1,
1.692236, -0.4978031, 2.177557, 0, 0, 0, 1, 1,
1.699011, 1.273453, -0.5934772, 0, 0, 0, 1, 1,
1.709018, -0.9128146, 1.590249, 1, 1, 1, 1, 1,
1.713825, 2.217007, -0.5766177, 1, 1, 1, 1, 1,
1.72496, 1.937262, 0.660504, 1, 1, 1, 1, 1,
1.733263, 0.9731685, 0.5412825, 1, 1, 1, 1, 1,
1.787958, 1.317304, 1.152718, 1, 1, 1, 1, 1,
1.79074, 1.856177, -0.02688709, 1, 1, 1, 1, 1,
1.798637, 2.013162, 3.351755, 1, 1, 1, 1, 1,
1.834084, -1.981077, 1.617661, 1, 1, 1, 1, 1,
1.854364, 0.5712405, 0.985262, 1, 1, 1, 1, 1,
1.869543, -2.034716, 3.22443, 1, 1, 1, 1, 1,
1.873968, -0.3112378, 3.234335, 1, 1, 1, 1, 1,
1.890402, -0.3819672, -0.8482259, 1, 1, 1, 1, 1,
1.933607, 1.305467, 1.385701, 1, 1, 1, 1, 1,
1.946747, -0.136004, 0.1872905, 1, 1, 1, 1, 1,
1.954506, 0.6735001, 1.084085, 1, 1, 1, 1, 1,
1.977889, -1.49135, 2.949586, 0, 0, 1, 1, 1,
2.027312, -0.9778741, 0.6848133, 1, 0, 0, 1, 1,
2.108394, -0.9430174, 2.76504, 1, 0, 0, 1, 1,
2.123871, 2.11062, 1.460354, 1, 0, 0, 1, 1,
2.153025, 0.1823063, 0.8989825, 1, 0, 0, 1, 1,
2.181295, -0.5443138, 2.57282, 1, 0, 0, 1, 1,
2.236228, -3.040171, 4.413011, 0, 0, 0, 1, 1,
2.294181, 0.5422213, 1.57478, 0, 0, 0, 1, 1,
2.300598, 0.1160532, 0.7073953, 0, 0, 0, 1, 1,
2.303868, 0.4629748, 1.460657, 0, 0, 0, 1, 1,
2.315838, -0.8149644, 1.284241, 0, 0, 0, 1, 1,
2.329077, 1.086949, 1.691763, 0, 0, 0, 1, 1,
2.403624, -1.480229, 3.320311, 0, 0, 0, 1, 1,
2.435563, -1.148074, 3.859932, 1, 1, 1, 1, 1,
2.526541, -0.1775346, 0.321769, 1, 1, 1, 1, 1,
2.537702, 0.5664312, 2.320773, 1, 1, 1, 1, 1,
2.619967, 0.2225075, 1.275879, 1, 1, 1, 1, 1,
2.647686, 0.5811211, 0.9867597, 1, 1, 1, 1, 1,
3.486727, 0.150337, 2.284273, 1, 1, 1, 1, 1,
3.639373, 0.3216367, 1.151259, 1, 1, 1, 1, 1
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
var radius = 9.815515;
var distance = 34.47658;
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
mvMatrix.translate( -0.2886517, 0.1544917, 0.2185731 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.47658);
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
