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
-3.312938, -2.049845, -0.2944891, 1, 0, 0, 1,
-2.916484, 0.05308926, -3.034212, 1, 0.007843138, 0, 1,
-2.73573, 0.9109311, -1.729297, 1, 0.01176471, 0, 1,
-2.608929, 0.2861076, 0.1297332, 1, 0.01960784, 0, 1,
-2.536124, -1.145467, -1.462987, 1, 0.02352941, 0, 1,
-2.510515, -0.4102105, -1.248252, 1, 0.03137255, 0, 1,
-2.431898, -1.374609, -1.491163, 1, 0.03529412, 0, 1,
-2.426747, 1.258227, -1.80874, 1, 0.04313726, 0, 1,
-2.424316, 1.432714, 1.532049, 1, 0.04705882, 0, 1,
-2.398077, -0.6953625, -2.342924, 1, 0.05490196, 0, 1,
-2.391675, -0.1111689, -1.541403, 1, 0.05882353, 0, 1,
-2.382129, -1.993372, -3.205742, 1, 0.06666667, 0, 1,
-2.331147, -1.113844, -1.975833, 1, 0.07058824, 0, 1,
-2.299506, 0.8409429, -0.8058752, 1, 0.07843138, 0, 1,
-2.21919, 1.35058, 1.06394, 1, 0.08235294, 0, 1,
-2.206046, -1.47912, -4.280506, 1, 0.09019608, 0, 1,
-2.197447, -0.1122944, -1.028893, 1, 0.09411765, 0, 1,
-2.083455, 1.410006, -2.136464, 1, 0.1019608, 0, 1,
-2.079461, 0.0260831, -0.6560348, 1, 0.1098039, 0, 1,
-2.07057, 1.793177, -2.316025, 1, 0.1137255, 0, 1,
-2.057783, 2.629025, -2.085753, 1, 0.1215686, 0, 1,
-2.042951, -0.3093386, -2.759192, 1, 0.1254902, 0, 1,
-1.97315, 0.3836205, -1.362712, 1, 0.1333333, 0, 1,
-1.96735, -0.7714314, -1.523495, 1, 0.1372549, 0, 1,
-1.958006, -0.6595544, -2.163134, 1, 0.145098, 0, 1,
-1.953277, -1.222744, -2.647979, 1, 0.1490196, 0, 1,
-1.938855, 0.5382957, -0.5794079, 1, 0.1568628, 0, 1,
-1.917527, -2.137064, -1.716977, 1, 0.1607843, 0, 1,
-1.864324, -0.534886, -2.191485, 1, 0.1686275, 0, 1,
-1.85967, 0.1836647, -1.90077, 1, 0.172549, 0, 1,
-1.858125, 1.598467, -0.1627942, 1, 0.1803922, 0, 1,
-1.826212, -1.891118, -2.176217, 1, 0.1843137, 0, 1,
-1.795063, -0.2562252, -0.9015956, 1, 0.1921569, 0, 1,
-1.794838, 1.34568, -1.627265, 1, 0.1960784, 0, 1,
-1.791882, -0.2942081, -0.8133078, 1, 0.2039216, 0, 1,
-1.77373, -0.9739836, -1.491038, 1, 0.2117647, 0, 1,
-1.769702, 0.9078279, 0.4650819, 1, 0.2156863, 0, 1,
-1.755333, -0.2531879, -3.336978, 1, 0.2235294, 0, 1,
-1.735506, 1.041387, -0.2757911, 1, 0.227451, 0, 1,
-1.72534, 0.1428322, -2.261152, 1, 0.2352941, 0, 1,
-1.723426, -0.3667305, -2.6119, 1, 0.2392157, 0, 1,
-1.715835, -1.166043, -1.94971, 1, 0.2470588, 0, 1,
-1.711904, -0.9585264, -1.929753, 1, 0.2509804, 0, 1,
-1.711368, 0.3375272, -1.721382, 1, 0.2588235, 0, 1,
-1.703508, 0.6028941, -0.5444868, 1, 0.2627451, 0, 1,
-1.683106, 0.3693387, -1.040345, 1, 0.2705882, 0, 1,
-1.671145, 0.9074016, -3.242077, 1, 0.2745098, 0, 1,
-1.666434, -1.72625, -2.135953, 1, 0.282353, 0, 1,
-1.662435, 0.9311045, -1.568135, 1, 0.2862745, 0, 1,
-1.658164, -0.04145829, -0.9670136, 1, 0.2941177, 0, 1,
-1.658164, -1.147395, -2.908089, 1, 0.3019608, 0, 1,
-1.649771, 0.7967945, -1.661787, 1, 0.3058824, 0, 1,
-1.645026, -0.4105521, -1.542241, 1, 0.3137255, 0, 1,
-1.631117, -0.08903403, -1.395645, 1, 0.3176471, 0, 1,
-1.619651, 0.7429463, -1.38727, 1, 0.3254902, 0, 1,
-1.585004, 0.3448739, -0.7020302, 1, 0.3294118, 0, 1,
-1.565585, 0.6027945, -0.3612447, 1, 0.3372549, 0, 1,
-1.565556, 0.9486656, -0.3840386, 1, 0.3411765, 0, 1,
-1.562819, -1.009197, -3.080832, 1, 0.3490196, 0, 1,
-1.560378, -1.400095, -0.4486385, 1, 0.3529412, 0, 1,
-1.552618, -0.9371274, -2.034908, 1, 0.3607843, 0, 1,
-1.55206, 0.8266528, -0.9729791, 1, 0.3647059, 0, 1,
-1.539435, -0.7131386, -1.955051, 1, 0.372549, 0, 1,
-1.531289, 0.9179149, -0.5146312, 1, 0.3764706, 0, 1,
-1.524834, -0.9675499, 0.02231048, 1, 0.3843137, 0, 1,
-1.508438, 1.225875, -0.6889181, 1, 0.3882353, 0, 1,
-1.507354, 1.408276, -0.7610229, 1, 0.3960784, 0, 1,
-1.506939, -0.4647503, -3.515587, 1, 0.4039216, 0, 1,
-1.498859, 1.36671, -0.2208368, 1, 0.4078431, 0, 1,
-1.494545, -0.4252461, 0.5227894, 1, 0.4156863, 0, 1,
-1.487076, 0.742417, -0.6628836, 1, 0.4196078, 0, 1,
-1.481568, -0.1348878, -2.218475, 1, 0.427451, 0, 1,
-1.477086, -0.7457054, -2.483692, 1, 0.4313726, 0, 1,
-1.466536, -0.6359027, -2.865195, 1, 0.4392157, 0, 1,
-1.463695, 1.747206, -0.4399731, 1, 0.4431373, 0, 1,
-1.455384, 0.4366023, -0.5755647, 1, 0.4509804, 0, 1,
-1.452995, -0.3782313, -2.479725, 1, 0.454902, 0, 1,
-1.444978, -0.7692806, -2.749896, 1, 0.4627451, 0, 1,
-1.443305, 1.114976, 0.5939725, 1, 0.4666667, 0, 1,
-1.430394, 0.614243, 0.5765116, 1, 0.4745098, 0, 1,
-1.428761, 0.925971, -1.336045, 1, 0.4784314, 0, 1,
-1.420431, 1.82575, -2.727049, 1, 0.4862745, 0, 1,
-1.405112, -1.016277, -2.005268, 1, 0.4901961, 0, 1,
-1.404247, -1.003239, -2.010792, 1, 0.4980392, 0, 1,
-1.394048, 0.9686103, -2.120972, 1, 0.5058824, 0, 1,
-1.389463, -1.95699, -1.287927, 1, 0.509804, 0, 1,
-1.376114, 0.879804, -0.8867471, 1, 0.5176471, 0, 1,
-1.366865, 1.113977, -1.921229, 1, 0.5215687, 0, 1,
-1.365811, -1.808699, -0.9794996, 1, 0.5294118, 0, 1,
-1.359174, -0.1088068, -1.905876, 1, 0.5333334, 0, 1,
-1.352427, -0.8178449, -1.119351, 1, 0.5411765, 0, 1,
-1.348266, 0.8955887, -1.032343, 1, 0.5450981, 0, 1,
-1.345995, -0.310912, -1.769383, 1, 0.5529412, 0, 1,
-1.338296, 0.9977914, -0.7539154, 1, 0.5568628, 0, 1,
-1.301555, -0.8635074, -2.529746, 1, 0.5647059, 0, 1,
-1.300582, -0.157971, -2.20148, 1, 0.5686275, 0, 1,
-1.297188, -1.454773, -0.7666927, 1, 0.5764706, 0, 1,
-1.2844, -0.8621992, -2.912212, 1, 0.5803922, 0, 1,
-1.282385, -1.818671, -2.888222, 1, 0.5882353, 0, 1,
-1.280909, -0.4445102, -1.62184, 1, 0.5921569, 0, 1,
-1.278199, -1.720543, -2.269498, 1, 0.6, 0, 1,
-1.267826, 0.3672721, -0.6596798, 1, 0.6078432, 0, 1,
-1.256526, -0.9989168, -0.7356386, 1, 0.6117647, 0, 1,
-1.253881, 0.5848071, -1.732992, 1, 0.6196079, 0, 1,
-1.245257, -1.441398, -3.641498, 1, 0.6235294, 0, 1,
-1.2432, 0.2687744, -1.435089, 1, 0.6313726, 0, 1,
-1.232531, -1.283124, -3.471281, 1, 0.6352941, 0, 1,
-1.228695, -0.3570201, -0.7858522, 1, 0.6431373, 0, 1,
-1.223669, -0.5589463, -2.78889, 1, 0.6470588, 0, 1,
-1.220273, -2.150991, -0.8062337, 1, 0.654902, 0, 1,
-1.22027, 0.8132859, -2.206221, 1, 0.6588235, 0, 1,
-1.216004, 1.74524, -3.269357, 1, 0.6666667, 0, 1,
-1.214748, 0.8935813, -0.7136629, 1, 0.6705883, 0, 1,
-1.206417, -1.378826, -3.924752, 1, 0.6784314, 0, 1,
-1.198118, -0.996287, -2.125005, 1, 0.682353, 0, 1,
-1.196644, -1.230937, -0.8560668, 1, 0.6901961, 0, 1,
-1.191512, 0.08818569, -0.2312703, 1, 0.6941177, 0, 1,
-1.191243, 0.8218789, -2.138963, 1, 0.7019608, 0, 1,
-1.191076, 1.300203, -1.295662, 1, 0.7098039, 0, 1,
-1.181935, -0.8301896, -3.029431, 1, 0.7137255, 0, 1,
-1.16472, -1.054722, -2.67297, 1, 0.7215686, 0, 1,
-1.164271, -0.2490443, -3.336892, 1, 0.7254902, 0, 1,
-1.163506, -0.7881378, -2.928311, 1, 0.7333333, 0, 1,
-1.162204, 0.9801847, -1.409128, 1, 0.7372549, 0, 1,
-1.151001, 0.1361423, -1.194381, 1, 0.7450981, 0, 1,
-1.145016, 0.4421884, -1.323904, 1, 0.7490196, 0, 1,
-1.143072, 1.681326, -0.4813845, 1, 0.7568628, 0, 1,
-1.135949, -1.615194, -2.374917, 1, 0.7607843, 0, 1,
-1.131199, 0.5051996, -0.6175041, 1, 0.7686275, 0, 1,
-1.124318, 0.2154371, -1.008477, 1, 0.772549, 0, 1,
-1.117543, -0.01301312, -2.141988, 1, 0.7803922, 0, 1,
-1.108164, -1.168476, -1.882544, 1, 0.7843137, 0, 1,
-1.105896, 1.079363, -0.1209534, 1, 0.7921569, 0, 1,
-1.105572, 0.6810881, -1.741646, 1, 0.7960784, 0, 1,
-1.1043, 0.8565316, -1.694076, 1, 0.8039216, 0, 1,
-1.0985, 0.1951672, -0.07685909, 1, 0.8117647, 0, 1,
-1.098013, 1.143533, -1.031447, 1, 0.8156863, 0, 1,
-1.095603, 0.883334, -0.8340469, 1, 0.8235294, 0, 1,
-1.094827, -0.2695629, -2.28111, 1, 0.827451, 0, 1,
-1.086653, -1.858675, -2.718868, 1, 0.8352941, 0, 1,
-1.0849, -0.4321161, -1.819477, 1, 0.8392157, 0, 1,
-1.068731, -0.7686128, -2.101435, 1, 0.8470588, 0, 1,
-1.06722, -0.03323172, -1.719561, 1, 0.8509804, 0, 1,
-1.064677, 0.07080856, -0.5174744, 1, 0.8588235, 0, 1,
-1.061557, -1.147869, -2.465256, 1, 0.8627451, 0, 1,
-1.054836, -0.9630722, -2.113757, 1, 0.8705882, 0, 1,
-1.0491, -0.6419739, -2.460696, 1, 0.8745098, 0, 1,
-1.039939, 0.6974366, 0.05977464, 1, 0.8823529, 0, 1,
-1.035358, -1.454281, -3.575155, 1, 0.8862745, 0, 1,
-1.034573, 0.1125991, -0.8783266, 1, 0.8941177, 0, 1,
-1.034507, -1.161229, -2.541579, 1, 0.8980392, 0, 1,
-1.029972, 1.307376, -0.1595033, 1, 0.9058824, 0, 1,
-1.028991, 1.211452, -1.398408, 1, 0.9137255, 0, 1,
-1.028612, 0.1975362, -1.29395, 1, 0.9176471, 0, 1,
-1.024265, -1.316556, -2.51284, 1, 0.9254902, 0, 1,
-1.022329, -1.680827, -4.20574, 1, 0.9294118, 0, 1,
-1.021228, 1.350101, -2.70663, 1, 0.9372549, 0, 1,
-1.018503, 0.3467403, -1.891304, 1, 0.9411765, 0, 1,
-1.018197, -0.144763, -3.138633, 1, 0.9490196, 0, 1,
-1.014572, 0.9685262, -0.5844126, 1, 0.9529412, 0, 1,
-0.9906511, -0.8293319, -1.773493, 1, 0.9607843, 0, 1,
-0.9753585, -0.6433729, -3.200218, 1, 0.9647059, 0, 1,
-0.9722515, -0.2479547, -0.1601071, 1, 0.972549, 0, 1,
-0.9714789, 3.035565, 0.6700317, 1, 0.9764706, 0, 1,
-0.9672059, 1.251077, -0.4050827, 1, 0.9843137, 0, 1,
-0.9647083, 0.1453435, -0.8430007, 1, 0.9882353, 0, 1,
-0.9642591, 0.592227, 0.3093449, 1, 0.9960784, 0, 1,
-0.9597015, -1.423773, -3.375746, 0.9960784, 1, 0, 1,
-0.957404, 1.711793, -0.9526144, 0.9921569, 1, 0, 1,
-0.951766, -0.8249577, -2.56269, 0.9843137, 1, 0, 1,
-0.9507311, 0.0140448, -1.164598, 0.9803922, 1, 0, 1,
-0.9475399, 0.08360439, -0.7647884, 0.972549, 1, 0, 1,
-0.939971, -0.4284694, -4.166918, 0.9686275, 1, 0, 1,
-0.9340713, -0.3901904, -1.794218, 0.9607843, 1, 0, 1,
-0.9267058, 0.3939105, -0.1586744, 0.9568627, 1, 0, 1,
-0.9264374, 1.550437, -0.4016735, 0.9490196, 1, 0, 1,
-0.9245177, 0.07406918, -1.582667, 0.945098, 1, 0, 1,
-0.9224232, -0.2777387, -0.7588151, 0.9372549, 1, 0, 1,
-0.9200659, 0.188864, -0.1835996, 0.9333333, 1, 0, 1,
-0.909495, -0.6581509, -1.55178, 0.9254902, 1, 0, 1,
-0.8995063, -1.625184, -3.322545, 0.9215686, 1, 0, 1,
-0.8985434, -0.1061028, -0.8657033, 0.9137255, 1, 0, 1,
-0.8945757, 0.4482404, 0.1406598, 0.9098039, 1, 0, 1,
-0.885841, 1.664253, 0.8795573, 0.9019608, 1, 0, 1,
-0.879417, -0.2361136, -3.297472, 0.8941177, 1, 0, 1,
-0.8767936, 0.205603, -0.5707671, 0.8901961, 1, 0, 1,
-0.8765255, 0.07549126, -2.701221, 0.8823529, 1, 0, 1,
-0.8721823, 1.282789, -1.790862, 0.8784314, 1, 0, 1,
-0.8705116, -0.182602, -1.546509, 0.8705882, 1, 0, 1,
-0.8596374, 0.5879736, -1.082165, 0.8666667, 1, 0, 1,
-0.8565373, -0.3912447, 0.1005329, 0.8588235, 1, 0, 1,
-0.8554397, 0.8422982, -2.452391, 0.854902, 1, 0, 1,
-0.8449855, 1.010392, 0.242588, 0.8470588, 1, 0, 1,
-0.8422692, -1.025707, -2.638259, 0.8431373, 1, 0, 1,
-0.8405796, 1.353329, 1.039253, 0.8352941, 1, 0, 1,
-0.8330079, -0.1452557, -0.3243392, 0.8313726, 1, 0, 1,
-0.8295972, 0.6213878, -0.7249758, 0.8235294, 1, 0, 1,
-0.8255757, -0.4890134, -2.979251, 0.8196079, 1, 0, 1,
-0.8252687, 0.8554024, -2.905022, 0.8117647, 1, 0, 1,
-0.8159863, 0.9953701, -1.452036, 0.8078431, 1, 0, 1,
-0.8147735, 0.07174198, -3.500941, 0.8, 1, 0, 1,
-0.8121495, -1.051151, -2.660655, 0.7921569, 1, 0, 1,
-0.8098503, 0.1975085, -1.030391, 0.7882353, 1, 0, 1,
-0.8053676, 1.657645, 1.473764, 0.7803922, 1, 0, 1,
-0.805352, 0.9730832, -0.06372257, 0.7764706, 1, 0, 1,
-0.8007259, -0.5567453, -2.25814, 0.7686275, 1, 0, 1,
-0.7967858, -0.4309922, -1.803025, 0.7647059, 1, 0, 1,
-0.7888535, -1.340547, -2.05077, 0.7568628, 1, 0, 1,
-0.787993, 0.4332678, 0.4437996, 0.7529412, 1, 0, 1,
-0.7795979, -0.652554, -3.745233, 0.7450981, 1, 0, 1,
-0.7787578, 0.6857328, -3.814101, 0.7411765, 1, 0, 1,
-0.7784549, 0.1449168, -2.377297, 0.7333333, 1, 0, 1,
-0.7772173, 0.3185866, -1.554478, 0.7294118, 1, 0, 1,
-0.7755359, 1.09321, -1.647055, 0.7215686, 1, 0, 1,
-0.7736446, 1.736834, -1.420596, 0.7176471, 1, 0, 1,
-0.7663015, 0.4521909, -0.5447149, 0.7098039, 1, 0, 1,
-0.7636532, -1.1959, -1.892432, 0.7058824, 1, 0, 1,
-0.7627005, -1.262862, -2.504839, 0.6980392, 1, 0, 1,
-0.7533872, 0.8095667, -0.6524843, 0.6901961, 1, 0, 1,
-0.7525163, 1.626057, 0.58769, 0.6862745, 1, 0, 1,
-0.7502112, 0.008989138, -0.4713692, 0.6784314, 1, 0, 1,
-0.7417513, -0.9116267, -2.742761, 0.6745098, 1, 0, 1,
-0.7384853, 0.3511415, -0.4889721, 0.6666667, 1, 0, 1,
-0.7380382, 0.1161441, -1.783643, 0.6627451, 1, 0, 1,
-0.7372172, -1.022965, -3.623784, 0.654902, 1, 0, 1,
-0.736964, -0.2259874, -2.028834, 0.6509804, 1, 0, 1,
-0.7277142, 0.8703431, -0.4150352, 0.6431373, 1, 0, 1,
-0.7258091, 0.3541145, -1.57461, 0.6392157, 1, 0, 1,
-0.7253169, 0.6245088, -0.8185357, 0.6313726, 1, 0, 1,
-0.7124461, 0.474258, -0.3944571, 0.627451, 1, 0, 1,
-0.7090456, 0.4857956, -0.6291656, 0.6196079, 1, 0, 1,
-0.7063662, 1.245224, -0.2002336, 0.6156863, 1, 0, 1,
-0.6984262, -0.7203676, -4.784357, 0.6078432, 1, 0, 1,
-0.6937342, 0.5966088, -1.005104, 0.6039216, 1, 0, 1,
-0.6882098, 0.8876011, 0.3549916, 0.5960785, 1, 0, 1,
-0.6872445, -0.2825595, -3.559341, 0.5882353, 1, 0, 1,
-0.6860892, -0.1687914, -2.806037, 0.5843138, 1, 0, 1,
-0.681985, 1.229004, -1.657821, 0.5764706, 1, 0, 1,
-0.6802756, -0.3691857, -1.964417, 0.572549, 1, 0, 1,
-0.6801313, -0.5217841, -2.040977, 0.5647059, 1, 0, 1,
-0.6749852, 0.3962799, -0.2778335, 0.5607843, 1, 0, 1,
-0.6718646, -0.7968317, -1.302507, 0.5529412, 1, 0, 1,
-0.6674121, 0.3006037, -0.8280238, 0.5490196, 1, 0, 1,
-0.6626059, -0.4800686, -2.009461, 0.5411765, 1, 0, 1,
-0.6619633, -0.0131146, -3.9371, 0.5372549, 1, 0, 1,
-0.6586003, 0.9288937, -0.6366261, 0.5294118, 1, 0, 1,
-0.6572518, 0.7939214, -0.3215683, 0.5254902, 1, 0, 1,
-0.6556624, 0.7408581, 0.08778264, 0.5176471, 1, 0, 1,
-0.6548616, -1.436036, -2.307477, 0.5137255, 1, 0, 1,
-0.6465752, -0.1297469, 0.4542, 0.5058824, 1, 0, 1,
-0.6391001, 0.654864, -1.362971, 0.5019608, 1, 0, 1,
-0.6364272, -1.484976, -1.504174, 0.4941176, 1, 0, 1,
-0.6343669, 0.6243761, 0.02473582, 0.4862745, 1, 0, 1,
-0.6314827, -0.5714846, -4.522077, 0.4823529, 1, 0, 1,
-0.627486, 0.4786801, -2.099384, 0.4745098, 1, 0, 1,
-0.6251856, 0.9019047, -1.876568, 0.4705882, 1, 0, 1,
-0.6216043, -0.5573373, -0.04952232, 0.4627451, 1, 0, 1,
-0.618112, -0.2179985, 0.5640835, 0.4588235, 1, 0, 1,
-0.6159915, 0.9001786, -0.01528019, 0.4509804, 1, 0, 1,
-0.6117655, -0.7433608, -2.158698, 0.4470588, 1, 0, 1,
-0.610478, 0.2245119, 0.1870908, 0.4392157, 1, 0, 1,
-0.6100041, -0.6077418, -2.570846, 0.4352941, 1, 0, 1,
-0.6022804, 0.553566, -1.537928, 0.427451, 1, 0, 1,
-0.60169, 0.4569066, -1.544524, 0.4235294, 1, 0, 1,
-0.5903021, 0.6656826, -0.5494242, 0.4156863, 1, 0, 1,
-0.5876651, 1.303457, -0.1749686, 0.4117647, 1, 0, 1,
-0.5854208, -0.4648842, -1.888366, 0.4039216, 1, 0, 1,
-0.5837306, 0.02240657, -0.9119081, 0.3960784, 1, 0, 1,
-0.5836061, -0.6860245, -2.380159, 0.3921569, 1, 0, 1,
-0.5805414, 0.5058451, 0.005921839, 0.3843137, 1, 0, 1,
-0.578537, 0.5904994, -1.006287, 0.3803922, 1, 0, 1,
-0.573007, -0.1056264, -1.19497, 0.372549, 1, 0, 1,
-0.5718936, -0.327487, -4.155323, 0.3686275, 1, 0, 1,
-0.5688412, -0.893262, -2.541241, 0.3607843, 1, 0, 1,
-0.5684966, 0.0798147, -0.4287601, 0.3568628, 1, 0, 1,
-0.5629945, -1.652295, -1.334539, 0.3490196, 1, 0, 1,
-0.5608662, -0.1672521, -2.646862, 0.345098, 1, 0, 1,
-0.5597914, -1.08413, -4.636137, 0.3372549, 1, 0, 1,
-0.5590183, 0.1333786, 0.351263, 0.3333333, 1, 0, 1,
-0.5453008, 0.8866485, -1.004855, 0.3254902, 1, 0, 1,
-0.5405322, -0.1861398, -2.244546, 0.3215686, 1, 0, 1,
-0.536221, 1.335735, -0.2808253, 0.3137255, 1, 0, 1,
-0.5320182, 0.4436679, 1.1074, 0.3098039, 1, 0, 1,
-0.5300853, -1.5132, -2.858057, 0.3019608, 1, 0, 1,
-0.5299957, 0.1523051, -0.7677733, 0.2941177, 1, 0, 1,
-0.5272256, 1.578665, -0.06165745, 0.2901961, 1, 0, 1,
-0.5256345, 0.2337283, -1.526866, 0.282353, 1, 0, 1,
-0.5211722, -0.1470516, -0.8854463, 0.2784314, 1, 0, 1,
-0.5190429, -1.154288, -2.470407, 0.2705882, 1, 0, 1,
-0.5186462, -0.7560797, -3.137868, 0.2666667, 1, 0, 1,
-0.5183318, 0.7314517, -0.04477961, 0.2588235, 1, 0, 1,
-0.5149074, 1.142443, 0.6860359, 0.254902, 1, 0, 1,
-0.5120824, -0.2362854, -0.2362076, 0.2470588, 1, 0, 1,
-0.511708, -2.190246, -3.407089, 0.2431373, 1, 0, 1,
-0.5103723, 0.1154174, -1.130898, 0.2352941, 1, 0, 1,
-0.5065699, 1.501982, -1.219509, 0.2313726, 1, 0, 1,
-0.5061309, 0.430966, -1.144191, 0.2235294, 1, 0, 1,
-0.5042928, -0.6361069, -1.957361, 0.2196078, 1, 0, 1,
-0.5001341, 0.1989607, 1.290593, 0.2117647, 1, 0, 1,
-0.4975919, -1.195967, -1.162116, 0.2078431, 1, 0, 1,
-0.4921372, 0.0133037, -0.6276462, 0.2, 1, 0, 1,
-0.4892428, -2.835874, -1.898249, 0.1921569, 1, 0, 1,
-0.4823692, -0.3630809, -2.416376, 0.1882353, 1, 0, 1,
-0.4780623, 1.873829, -0.5686703, 0.1803922, 1, 0, 1,
-0.4763944, -0.9803971, -2.118454, 0.1764706, 1, 0, 1,
-0.4749025, -1.101899, -2.696026, 0.1686275, 1, 0, 1,
-0.4742771, -0.4871581, -1.665941, 0.1647059, 1, 0, 1,
-0.4742434, -0.6077272, -1.589503, 0.1568628, 1, 0, 1,
-0.4707336, 0.5926794, -1.68504, 0.1529412, 1, 0, 1,
-0.4669154, 1.853693, -1.18247, 0.145098, 1, 0, 1,
-0.464618, 0.1151732, 0.4369114, 0.1411765, 1, 0, 1,
-0.4639539, 0.3046906, 0.4656766, 0.1333333, 1, 0, 1,
-0.4579611, 1.549166, -1.517341, 0.1294118, 1, 0, 1,
-0.4524311, 0.3986673, 1.792679, 0.1215686, 1, 0, 1,
-0.4478861, 1.041945, -2.142974, 0.1176471, 1, 0, 1,
-0.425537, 0.1871556, -1.273122, 0.1098039, 1, 0, 1,
-0.4220512, -0.6845633, -1.960417, 0.1058824, 1, 0, 1,
-0.4195503, 0.533052, -1.469709, 0.09803922, 1, 0, 1,
-0.4170699, 1.433653, -1.418304, 0.09019608, 1, 0, 1,
-0.4168415, 0.8871588, -0.7887348, 0.08627451, 1, 0, 1,
-0.409705, 0.6989898, -1.835281, 0.07843138, 1, 0, 1,
-0.4061161, -0.5782033, -2.676893, 0.07450981, 1, 0, 1,
-0.4027686, -0.6983484, -3.077145, 0.06666667, 1, 0, 1,
-0.4000494, 1.082501, -1.78666, 0.0627451, 1, 0, 1,
-0.4000242, -0.3402404, -1.968765, 0.05490196, 1, 0, 1,
-0.3959099, 0.9450486, -1.091352, 0.05098039, 1, 0, 1,
-0.3947087, -1.249858, -3.075682, 0.04313726, 1, 0, 1,
-0.3901348, 0.03725875, -0.9465908, 0.03921569, 1, 0, 1,
-0.3881373, -0.0279801, 0.3030698, 0.03137255, 1, 0, 1,
-0.3850882, 1.088065, 1.686676, 0.02745098, 1, 0, 1,
-0.3845853, 0.1914537, -1.097563, 0.01960784, 1, 0, 1,
-0.3811067, 2.280202, 0.2341227, 0.01568628, 1, 0, 1,
-0.3800563, -0.4616437, -3.017389, 0.007843138, 1, 0, 1,
-0.377018, -1.341109, -2.903283, 0.003921569, 1, 0, 1,
-0.3766348, 0.06694768, -2.725032, 0, 1, 0.003921569, 1,
-0.3763885, -0.1383978, -1.843661, 0, 1, 0.01176471, 1,
-0.3751955, 0.1340259, -1.878379, 0, 1, 0.01568628, 1,
-0.3693734, -0.8521296, -1.300615, 0, 1, 0.02352941, 1,
-0.369185, -0.3964568, -3.824833, 0, 1, 0.02745098, 1,
-0.3606144, -0.2153772, 0.9166852, 0, 1, 0.03529412, 1,
-0.3598391, 1.128551, -1.990182, 0, 1, 0.03921569, 1,
-0.3588972, -0.5538684, -0.2297806, 0, 1, 0.04705882, 1,
-0.3553549, -0.9613711, -2.738317, 0, 1, 0.05098039, 1,
-0.3515925, -0.5162327, -3.000619, 0, 1, 0.05882353, 1,
-0.3352858, 0.3244784, 0.3019251, 0, 1, 0.0627451, 1,
-0.3232578, -0.8280174, -1.811404, 0, 1, 0.07058824, 1,
-0.3224466, 1.301976, 1.002055, 0, 1, 0.07450981, 1,
-0.3214731, -0.7505699, -3.341822, 0, 1, 0.08235294, 1,
-0.3170373, -1.642592, -1.382248, 0, 1, 0.08627451, 1,
-0.3143475, 1.065134, -0.7165564, 0, 1, 0.09411765, 1,
-0.3122234, 0.1548328, 0.4058748, 0, 1, 0.1019608, 1,
-0.3087556, -0.4668097, -3.845132, 0, 1, 0.1058824, 1,
-0.305217, -0.4197216, -2.535375, 0, 1, 0.1137255, 1,
-0.3035984, -0.6068674, -2.169684, 0, 1, 0.1176471, 1,
-0.3020931, 0.1456169, -1.820546, 0, 1, 0.1254902, 1,
-0.3011481, -0.8781968, -4.284403, 0, 1, 0.1294118, 1,
-0.2997435, -1.257553, -2.444491, 0, 1, 0.1372549, 1,
-0.2962928, 0.7573376, 0.7478448, 0, 1, 0.1411765, 1,
-0.2912099, -1.060791, -1.627589, 0, 1, 0.1490196, 1,
-0.2897508, -0.6733042, -1.714977, 0, 1, 0.1529412, 1,
-0.2881978, -0.2094346, -1.638109, 0, 1, 0.1607843, 1,
-0.2872215, 0.9747972, -0.4332788, 0, 1, 0.1647059, 1,
-0.2830257, -0.0233189, -3.448398, 0, 1, 0.172549, 1,
-0.2819984, -0.8392468, -3.45531, 0, 1, 0.1764706, 1,
-0.2809072, 0.7984277, 0.4317481, 0, 1, 0.1843137, 1,
-0.2619557, -2.135231, -4.71121, 0, 1, 0.1882353, 1,
-0.2581553, -0.120664, -3.603895, 0, 1, 0.1960784, 1,
-0.2565208, -1.040437, -1.32183, 0, 1, 0.2039216, 1,
-0.2545203, -2.119242, -3.288164, 0, 1, 0.2078431, 1,
-0.2483118, 1.913947, 1.554158, 0, 1, 0.2156863, 1,
-0.2464358, 1.316087, 0.1146072, 0, 1, 0.2196078, 1,
-0.2370354, 0.8280377, -1.767778, 0, 1, 0.227451, 1,
-0.2310948, 0.03352549, -1.669327, 0, 1, 0.2313726, 1,
-0.225539, 1.012675, -1.096447, 0, 1, 0.2392157, 1,
-0.2212621, 0.3850659, -0.8426633, 0, 1, 0.2431373, 1,
-0.2158757, 1.534105, -0.6942604, 0, 1, 0.2509804, 1,
-0.2156748, 0.4136287, -0.08369019, 0, 1, 0.254902, 1,
-0.2110332, 1.080101, -0.1128608, 0, 1, 0.2627451, 1,
-0.2087263, -0.2078267, -1.311397, 0, 1, 0.2666667, 1,
-0.2034059, 0.591892, 0.555064, 0, 1, 0.2745098, 1,
-0.2027536, 0.6310751, 0.1319883, 0, 1, 0.2784314, 1,
-0.2015582, -0.2697972, -2.530016, 0, 1, 0.2862745, 1,
-0.2008857, 0.7277862, 0.3895909, 0, 1, 0.2901961, 1,
-0.2008121, -0.0367795, -0.1985243, 0, 1, 0.2980392, 1,
-0.2004487, -0.9542444, -2.630249, 0, 1, 0.3058824, 1,
-0.1997639, 0.2622968, 1.808425, 0, 1, 0.3098039, 1,
-0.1968139, 1.776649, 0.2871012, 0, 1, 0.3176471, 1,
-0.1935184, 0.1620813, -0.02402041, 0, 1, 0.3215686, 1,
-0.1907625, -0.4602437, -2.592745, 0, 1, 0.3294118, 1,
-0.1901433, -3.003435, -2.465883, 0, 1, 0.3333333, 1,
-0.1837578, 0.121917, -2.432215, 0, 1, 0.3411765, 1,
-0.1797505, -1.831817, -1.891472, 0, 1, 0.345098, 1,
-0.1771212, 0.005653805, -2.617677, 0, 1, 0.3529412, 1,
-0.1770768, 1.774335, 0.3152103, 0, 1, 0.3568628, 1,
-0.1742096, -0.03225835, -0.5147063, 0, 1, 0.3647059, 1,
-0.1736386, 0.337694, 0.4600188, 0, 1, 0.3686275, 1,
-0.172383, -0.0705898, 0.9746383, 0, 1, 0.3764706, 1,
-0.1712863, -1.683717, -1.200644, 0, 1, 0.3803922, 1,
-0.1687785, 2.81559, -0.6279941, 0, 1, 0.3882353, 1,
-0.1670478, 0.1763813, -0.1148034, 0, 1, 0.3921569, 1,
-0.1642793, -1.110956, -4.532508, 0, 1, 0.4, 1,
-0.1567731, -2.142218, -2.442343, 0, 1, 0.4078431, 1,
-0.1496023, -1.488293, -2.471373, 0, 1, 0.4117647, 1,
-0.149556, -0.0826451, -2.066138, 0, 1, 0.4196078, 1,
-0.1446882, -0.8517841, -1.629335, 0, 1, 0.4235294, 1,
-0.1431534, -1.636047, -3.062985, 0, 1, 0.4313726, 1,
-0.1413438, -0.869966, -5.099838, 0, 1, 0.4352941, 1,
-0.1360515, -0.3600125, -1.209992, 0, 1, 0.4431373, 1,
-0.1343311, 0.02833182, -0.3803441, 0, 1, 0.4470588, 1,
-0.1337839, 0.3946929, -0.1743645, 0, 1, 0.454902, 1,
-0.1335097, -0.03087312, -2.200997, 0, 1, 0.4588235, 1,
-0.1304176, 0.04299771, -1.758244, 0, 1, 0.4666667, 1,
-0.1278268, 0.8421863, -0.6849618, 0, 1, 0.4705882, 1,
-0.1249133, -0.3528104, -0.4373596, 0, 1, 0.4784314, 1,
-0.1228109, -1.494834, -4.015306, 0, 1, 0.4823529, 1,
-0.1224864, -1.370613, -3.479078, 0, 1, 0.4901961, 1,
-0.1218104, -1.391682, -3.649535, 0, 1, 0.4941176, 1,
-0.1215995, 0.829278, -0.6626349, 0, 1, 0.5019608, 1,
-0.1181211, -1.719075, -3.870502, 0, 1, 0.509804, 1,
-0.1168866, -1.020451, -3.057581, 0, 1, 0.5137255, 1,
-0.1148657, 1.930642, -0.2178591, 0, 1, 0.5215687, 1,
-0.1109478, -2.400042, -2.795393, 0, 1, 0.5254902, 1,
-0.1098437, -0.3098097, -0.2200134, 0, 1, 0.5333334, 1,
-0.1077435, -0.1772443, -1.878471, 0, 1, 0.5372549, 1,
-0.1036717, 1.640809, 0.7093307, 0, 1, 0.5450981, 1,
-0.1027366, -1.359438, -3.725262, 0, 1, 0.5490196, 1,
-0.09440538, 0.5477369, 1.621318, 0, 1, 0.5568628, 1,
-0.09177887, 2.143596, 0.1205198, 0, 1, 0.5607843, 1,
-0.08322504, 0.5366931, -1.579409, 0, 1, 0.5686275, 1,
-0.07884892, 0.5219578, -1.101428, 0, 1, 0.572549, 1,
-0.07456494, -1.146292, -4.902586, 0, 1, 0.5803922, 1,
-0.07233035, -2.557129, -3.360263, 0, 1, 0.5843138, 1,
-0.07145122, 0.904564, 0.4413852, 0, 1, 0.5921569, 1,
-0.07113735, -0.06037815, -2.937381, 0, 1, 0.5960785, 1,
-0.07103549, 0.5385187, 0.8954486, 0, 1, 0.6039216, 1,
-0.07098018, 0.5616412, -0.2918917, 0, 1, 0.6117647, 1,
-0.07011263, 0.1209116, 0.03274005, 0, 1, 0.6156863, 1,
-0.06856184, -0.768155, -4.424246, 0, 1, 0.6235294, 1,
-0.0658579, 0.7979305, 2.167771, 0, 1, 0.627451, 1,
-0.06530693, 0.06436169, -0.2367433, 0, 1, 0.6352941, 1,
-0.06218291, 0.34505, -0.6136126, 0, 1, 0.6392157, 1,
-0.0565461, -0.6847128, -2.655625, 0, 1, 0.6470588, 1,
-0.04935623, -0.03575696, -3.445884, 0, 1, 0.6509804, 1,
-0.04694511, -0.2771042, -1.436821, 0, 1, 0.6588235, 1,
-0.04269676, 1.479931, -0.1523238, 0, 1, 0.6627451, 1,
-0.04204427, 0.6227009, -0.2555566, 0, 1, 0.6705883, 1,
-0.03910949, 0.8920097, 0.4338687, 0, 1, 0.6745098, 1,
-0.03804514, -0.00211198, -1.750403, 0, 1, 0.682353, 1,
-0.03802538, 2.654377, -0.6023464, 0, 1, 0.6862745, 1,
-0.03304877, -1.183481, -3.28743, 0, 1, 0.6941177, 1,
-0.03147784, -0.6083933, -3.531491, 0, 1, 0.7019608, 1,
-0.0282709, -1.142858, -4.017549, 0, 1, 0.7058824, 1,
-0.0276869, -0.8321063, -3.052243, 0, 1, 0.7137255, 1,
-0.02460206, 0.07585321, -1.725291, 0, 1, 0.7176471, 1,
-0.01487039, 0.5556169, 0.8132141, 0, 1, 0.7254902, 1,
-0.0120214, -0.9076096, -3.401374, 0, 1, 0.7294118, 1,
-0.01029357, -0.4339067, -4.273867, 0, 1, 0.7372549, 1,
-0.004244173, 0.2969677, 0.1963812, 0, 1, 0.7411765, 1,
-0.003966026, -1.742634, -2.872248, 0, 1, 0.7490196, 1,
-0.0001713859, -0.08001486, -3.20767, 0, 1, 0.7529412, 1,
0.0009214561, 0.4617346, 1.38341, 0, 1, 0.7607843, 1,
0.002561882, -0.2768562, 3.716577, 0, 1, 0.7647059, 1,
0.007241031, -0.6891346, 3.588172, 0, 1, 0.772549, 1,
0.007972697, -0.1581718, 4.722361, 0, 1, 0.7764706, 1,
0.01033351, 0.4309971, 0.2906914, 0, 1, 0.7843137, 1,
0.01479107, 0.7466322, 0.9037511, 0, 1, 0.7882353, 1,
0.02439963, -1.70288, 2.579074, 0, 1, 0.7960784, 1,
0.02644746, 1.074823, 0.03833622, 0, 1, 0.8039216, 1,
0.02831537, -1.592628, 3.513973, 0, 1, 0.8078431, 1,
0.03087868, -1.486515, 2.083776, 0, 1, 0.8156863, 1,
0.03338982, -0.7262126, 2.961058, 0, 1, 0.8196079, 1,
0.03430835, 1.54246, 0.4370871, 0, 1, 0.827451, 1,
0.03560591, 0.06115151, -0.7270769, 0, 1, 0.8313726, 1,
0.03743013, 1.510432, -3.095824, 0, 1, 0.8392157, 1,
0.04052616, -1.330824, 4.000751, 0, 1, 0.8431373, 1,
0.04130313, -0.1143753, 2.453912, 0, 1, 0.8509804, 1,
0.04430141, -0.05495631, 2.63944, 0, 1, 0.854902, 1,
0.04439544, -1.178616, 3.142906, 0, 1, 0.8627451, 1,
0.04468962, 0.001148199, 1.382751, 0, 1, 0.8666667, 1,
0.04522908, -0.6274516, 5.354339, 0, 1, 0.8745098, 1,
0.04695945, 0.3882554, -0.4406338, 0, 1, 0.8784314, 1,
0.04948878, -0.7176213, 3.318021, 0, 1, 0.8862745, 1,
0.05082072, 0.3604107, 1.357171, 0, 1, 0.8901961, 1,
0.05463437, 0.1923647, -1.72938, 0, 1, 0.8980392, 1,
0.05563625, -1.282279, 4.910219, 0, 1, 0.9058824, 1,
0.05774068, -0.9497725, 2.550108, 0, 1, 0.9098039, 1,
0.06099122, -1.266997, 3.19405, 0, 1, 0.9176471, 1,
0.06129437, -0.5505112, 3.81105, 0, 1, 0.9215686, 1,
0.06139133, -0.03756525, 0.7984338, 0, 1, 0.9294118, 1,
0.06243044, -1.357489, 2.759545, 0, 1, 0.9333333, 1,
0.06844582, 0.7890681, 0.4391748, 0, 1, 0.9411765, 1,
0.06939758, 0.9723645, -1.085577, 0, 1, 0.945098, 1,
0.06960192, 0.7345427, -0.7056345, 0, 1, 0.9529412, 1,
0.07002461, 1.229263, -0.6080848, 0, 1, 0.9568627, 1,
0.07039244, -1.248752, 3.735086, 0, 1, 0.9647059, 1,
0.07206233, 0.6533424, 2.351295, 0, 1, 0.9686275, 1,
0.08226939, -0.2439698, 3.20618, 0, 1, 0.9764706, 1,
0.08671134, -0.499828, 2.582221, 0, 1, 0.9803922, 1,
0.08717214, 0.2065219, 2.519314, 0, 1, 0.9882353, 1,
0.08992476, -1.798098, 3.249393, 0, 1, 0.9921569, 1,
0.09174751, -0.3565298, 4.095005, 0, 1, 1, 1,
0.09247347, -0.2552378, 4.124957, 0, 0.9921569, 1, 1,
0.09372061, -0.2067314, 2.172777, 0, 0.9882353, 1, 1,
0.09437995, 0.6456723, -0.8761193, 0, 0.9803922, 1, 1,
0.09538139, -1.472718, 1.981355, 0, 0.9764706, 1, 1,
0.09908331, -1.628981, 2.015305, 0, 0.9686275, 1, 1,
0.1068734, 0.3860331, 1.130172, 0, 0.9647059, 1, 1,
0.1073402, -0.7748808, 2.52508, 0, 0.9568627, 1, 1,
0.1170344, -1.25202, 1.548489, 0, 0.9529412, 1, 1,
0.1194424, 0.154318, -0.006145762, 0, 0.945098, 1, 1,
0.1195496, -0.859112, 3.364391, 0, 0.9411765, 1, 1,
0.1226564, -0.8363107, 3.061977, 0, 0.9333333, 1, 1,
0.1334198, 0.8741007, -0.9751254, 0, 0.9294118, 1, 1,
0.1356218, 0.5568749, 1.230001, 0, 0.9215686, 1, 1,
0.1375829, -0.1753918, 2.177943, 0, 0.9176471, 1, 1,
0.1385181, 1.922609, -0.8128139, 0, 0.9098039, 1, 1,
0.13984, -0.02573727, 2.097939, 0, 0.9058824, 1, 1,
0.1446104, -2.173113, 3.043256, 0, 0.8980392, 1, 1,
0.1483798, 0.9706335, 1.902366, 0, 0.8901961, 1, 1,
0.1494046, -0.2555384, 2.468059, 0, 0.8862745, 1, 1,
0.1513604, -0.5108622, 3.623062, 0, 0.8784314, 1, 1,
0.1519653, -0.7702875, 1.875943, 0, 0.8745098, 1, 1,
0.1571074, 1.331507, 0.7311745, 0, 0.8666667, 1, 1,
0.1581514, 0.6803794, 0.394607, 0, 0.8627451, 1, 1,
0.1595479, 0.481931, -0.1108118, 0, 0.854902, 1, 1,
0.1598289, -1.994525, 4.215523, 0, 0.8509804, 1, 1,
0.1634622, -0.4772587, 4.34203, 0, 0.8431373, 1, 1,
0.1661928, -0.2967427, 3.562864, 0, 0.8392157, 1, 1,
0.167062, -0.5713657, 3.99782, 0, 0.8313726, 1, 1,
0.1674336, -0.6143574, 1.948643, 0, 0.827451, 1, 1,
0.174851, -0.8926695, 3.810657, 0, 0.8196079, 1, 1,
0.1771751, 0.01305449, 0.8523758, 0, 0.8156863, 1, 1,
0.1773998, 0.1592707, 0.1532435, 0, 0.8078431, 1, 1,
0.1799128, 1.127308, -2.322047, 0, 0.8039216, 1, 1,
0.1902893, -0.4494881, 0.3848788, 0, 0.7960784, 1, 1,
0.1905826, 0.5230293, 1.999836, 0, 0.7882353, 1, 1,
0.1929165, 0.8583919, -0.9982688, 0, 0.7843137, 1, 1,
0.1939018, 0.9061627, -0.1981312, 0, 0.7764706, 1, 1,
0.1944823, 2.238148, 0.8787851, 0, 0.772549, 1, 1,
0.1968474, 1.609721, 0.4670251, 0, 0.7647059, 1, 1,
0.2008041, 0.9881847, 1.70795, 0, 0.7607843, 1, 1,
0.2021021, 1.009658, 0.5240692, 0, 0.7529412, 1, 1,
0.2089462, -1.245301, 1.810338, 0, 0.7490196, 1, 1,
0.2089841, 2.250056, -0.4081544, 0, 0.7411765, 1, 1,
0.2164341, 0.2602306, 1.042793, 0, 0.7372549, 1, 1,
0.2166696, -1.470605, 1.72919, 0, 0.7294118, 1, 1,
0.2167414, -0.2459021, 3.275593, 0, 0.7254902, 1, 1,
0.2171735, 0.1903235, 1.945604, 0, 0.7176471, 1, 1,
0.2173039, -1.375344, 3.479645, 0, 0.7137255, 1, 1,
0.2181609, -0.250836, 2.346452, 0, 0.7058824, 1, 1,
0.219271, -0.4699111, 2.528959, 0, 0.6980392, 1, 1,
0.2202225, 1.978678, 0.2669727, 0, 0.6941177, 1, 1,
0.2207801, -0.4573037, 2.825923, 0, 0.6862745, 1, 1,
0.2246085, 0.3794658, -0.2828464, 0, 0.682353, 1, 1,
0.2247435, -1.156867, 2.928953, 0, 0.6745098, 1, 1,
0.225885, 1.451703, -1.520319, 0, 0.6705883, 1, 1,
0.2259263, -0.3307695, 0.09966259, 0, 0.6627451, 1, 1,
0.2326084, -1.469673, 2.415441, 0, 0.6588235, 1, 1,
0.2332192, -1.382058, 3.04758, 0, 0.6509804, 1, 1,
0.2353391, -0.2748806, 3.017797, 0, 0.6470588, 1, 1,
0.235971, -0.6869895, 2.008476, 0, 0.6392157, 1, 1,
0.2364126, -1.839244, 3.946843, 0, 0.6352941, 1, 1,
0.2393945, -1.296316, 2.364271, 0, 0.627451, 1, 1,
0.2424937, -0.06103086, 2.858023, 0, 0.6235294, 1, 1,
0.2436474, -0.9202902, 4.501629, 0, 0.6156863, 1, 1,
0.2448671, 0.4517277, 0.2615981, 0, 0.6117647, 1, 1,
0.2449138, 2.054206, -0.5352088, 0, 0.6039216, 1, 1,
0.2462342, -0.8271586, 2.019833, 0, 0.5960785, 1, 1,
0.2503105, 2.031905, 0.8892114, 0, 0.5921569, 1, 1,
0.2550156, -0.1899507, 2.799241, 0, 0.5843138, 1, 1,
0.2568223, -0.1857071, 4.003635, 0, 0.5803922, 1, 1,
0.258789, 0.3671182, 0.5722266, 0, 0.572549, 1, 1,
0.2595859, -1.657984, 3.781608, 0, 0.5686275, 1, 1,
0.2597421, 1.092131, 1.399534, 0, 0.5607843, 1, 1,
0.2605042, 0.1363907, 1.817685, 0, 0.5568628, 1, 1,
0.2693084, -1.063024, 2.413477, 0, 0.5490196, 1, 1,
0.2719328, -0.8104222, 4.341955, 0, 0.5450981, 1, 1,
0.2727982, 1.288308, 0.472778, 0, 0.5372549, 1, 1,
0.2761373, 0.2150505, 2.903717, 0, 0.5333334, 1, 1,
0.279945, 0.2393166, 0.2458446, 0, 0.5254902, 1, 1,
0.2820955, -0.7520517, 1.325113, 0, 0.5215687, 1, 1,
0.2842197, 1.079179, 0.04242491, 0, 0.5137255, 1, 1,
0.2854491, -2.167482, 1.396342, 0, 0.509804, 1, 1,
0.2856828, 1.019989, 0.8503842, 0, 0.5019608, 1, 1,
0.293824, -0.546789, 5.04213, 0, 0.4941176, 1, 1,
0.2943846, 0.2134989, 0.7488847, 0, 0.4901961, 1, 1,
0.294873, 1.085279, 1.778023, 0, 0.4823529, 1, 1,
0.2974014, 0.7578028, 0.5183067, 0, 0.4784314, 1, 1,
0.3085787, 0.1456552, 0.6463827, 0, 0.4705882, 1, 1,
0.3091102, -0.02321637, 1.373297, 0, 0.4666667, 1, 1,
0.3121388, -0.4326718, 1.995128, 0, 0.4588235, 1, 1,
0.3130344, 0.0777005, 0.9379727, 0, 0.454902, 1, 1,
0.3132768, -0.5289786, 2.353184, 0, 0.4470588, 1, 1,
0.3225678, 0.2858076, 0.02479859, 0, 0.4431373, 1, 1,
0.3255843, -0.444257, 2.272385, 0, 0.4352941, 1, 1,
0.3313203, -1.408357, 3.364599, 0, 0.4313726, 1, 1,
0.3351078, 0.08410127, 1.032909, 0, 0.4235294, 1, 1,
0.3379146, -0.481532, 1.457607, 0, 0.4196078, 1, 1,
0.3397559, 0.8418244, -0.3108815, 0, 0.4117647, 1, 1,
0.3467784, -0.5633706, 1.272594, 0, 0.4078431, 1, 1,
0.3504155, 0.02650709, 1.565635, 0, 0.4, 1, 1,
0.3528504, 1.117146, -2.897941, 0, 0.3921569, 1, 1,
0.3548713, -0.6799525, 1.214981, 0, 0.3882353, 1, 1,
0.355192, -0.5701539, 1.620658, 0, 0.3803922, 1, 1,
0.3637712, 0.5896527, 1.822179, 0, 0.3764706, 1, 1,
0.3644884, 0.3161462, -0.3920828, 0, 0.3686275, 1, 1,
0.36516, -1.616454, 1.942422, 0, 0.3647059, 1, 1,
0.3706866, 0.620784, 0.3531605, 0, 0.3568628, 1, 1,
0.3768855, 0.8149104, 2.510425, 0, 0.3529412, 1, 1,
0.378028, 0.6853117, 0.7391093, 0, 0.345098, 1, 1,
0.3794429, -0.9348043, 3.730618, 0, 0.3411765, 1, 1,
0.3833873, 0.226904, 1.771969, 0, 0.3333333, 1, 1,
0.3846365, -1.286846, 4.242916, 0, 0.3294118, 1, 1,
0.3891678, -0.06788168, 1.54689, 0, 0.3215686, 1, 1,
0.3894266, 0.6174346, -0.7543813, 0, 0.3176471, 1, 1,
0.3924576, 1.695368, 0.9620761, 0, 0.3098039, 1, 1,
0.3955241, 0.48774, -1.569001, 0, 0.3058824, 1, 1,
0.3974737, -0.6774002, 1.17817, 0, 0.2980392, 1, 1,
0.397921, -0.6183861, 3.383259, 0, 0.2901961, 1, 1,
0.3983116, -2.105216, 2.730793, 0, 0.2862745, 1, 1,
0.4056931, 0.6437027, 1.643292, 0, 0.2784314, 1, 1,
0.4073175, 1.091786, 0.3636542, 0, 0.2745098, 1, 1,
0.4078517, -1.792193, 2.696702, 0, 0.2666667, 1, 1,
0.4085509, -0.4979172, 0.9468269, 0, 0.2627451, 1, 1,
0.4087867, 1.020611, 0.4779437, 0, 0.254902, 1, 1,
0.4100434, -0.1331873, 0.008683221, 0, 0.2509804, 1, 1,
0.4105628, 0.5974316, 1.866551, 0, 0.2431373, 1, 1,
0.4120057, -0.5904855, 2.019462, 0, 0.2392157, 1, 1,
0.4134318, 0.9751366, 0.9557955, 0, 0.2313726, 1, 1,
0.4135976, -0.3174882, 3.612286, 0, 0.227451, 1, 1,
0.4222369, -0.6937672, 2.429715, 0, 0.2196078, 1, 1,
0.4287578, 1.022244, -0.1192599, 0, 0.2156863, 1, 1,
0.4292755, 0.6349626, -0.1851556, 0, 0.2078431, 1, 1,
0.4307726, -0.2987507, 2.196293, 0, 0.2039216, 1, 1,
0.4325847, -0.3517925, 4.24611, 0, 0.1960784, 1, 1,
0.4341888, -0.3784352, -0.5038981, 0, 0.1882353, 1, 1,
0.4344611, -0.2697764, 2.057498, 0, 0.1843137, 1, 1,
0.4363198, -0.3048644, 1.478911, 0, 0.1764706, 1, 1,
0.4368749, 0.6979326, -0.9587734, 0, 0.172549, 1, 1,
0.4439244, -1.296501, 2.611732, 0, 0.1647059, 1, 1,
0.4441013, 0.07899459, 1.641282, 0, 0.1607843, 1, 1,
0.4446284, -1.038644, 1.980722, 0, 0.1529412, 1, 1,
0.4453717, -0.6448468, 1.032502, 0, 0.1490196, 1, 1,
0.4454875, -1.7471, 2.278603, 0, 0.1411765, 1, 1,
0.445786, 1.315302, 0.1740681, 0, 0.1372549, 1, 1,
0.4521413, -0.1193031, 1.839067, 0, 0.1294118, 1, 1,
0.4535658, -0.2725956, 4.326519, 0, 0.1254902, 1, 1,
0.4561445, -0.7350186, 4.095819, 0, 0.1176471, 1, 1,
0.4605635, 1.264463, 0.1760931, 0, 0.1137255, 1, 1,
0.4621447, 1.782101, 1.436176, 0, 0.1058824, 1, 1,
0.4650871, -0.02137944, 0.6617707, 0, 0.09803922, 1, 1,
0.4656264, 0.1453812, 2.282539, 0, 0.09411765, 1, 1,
0.4665738, -0.3264064, 1.501454, 0, 0.08627451, 1, 1,
0.4732268, -1.982178, 4.209194, 0, 0.08235294, 1, 1,
0.4759153, 0.08956718, 3.385367, 0, 0.07450981, 1, 1,
0.4773483, -2.066761, 3.687645, 0, 0.07058824, 1, 1,
0.4776227, 0.9878944, -0.1908757, 0, 0.0627451, 1, 1,
0.4789377, 0.9766265, 0.6691431, 0, 0.05882353, 1, 1,
0.4832328, -0.597815, 4.858389, 0, 0.05098039, 1, 1,
0.4882316, -1.524159, 0.9574931, 0, 0.04705882, 1, 1,
0.4915254, 2.32392, -1.34474, 0, 0.03921569, 1, 1,
0.5025052, 1.428298, 0.1067344, 0, 0.03529412, 1, 1,
0.5127819, 0.3405459, 2.116631, 0, 0.02745098, 1, 1,
0.5141596, -1.414055, 0.6222324, 0, 0.02352941, 1, 1,
0.5142508, 0.504777, 2.502157, 0, 0.01568628, 1, 1,
0.5152961, -0.3206793, 2.918635, 0, 0.01176471, 1, 1,
0.5183418, 0.1727515, 1.261191, 0, 0.003921569, 1, 1,
0.5229862, -1.418087, 3.040169, 0.003921569, 0, 1, 1,
0.5231609, 0.8743455, 0.6068394, 0.007843138, 0, 1, 1,
0.5330558, 0.2433529, 1.416653, 0.01568628, 0, 1, 1,
0.5440379, -0.3641346, 2.204382, 0.01960784, 0, 1, 1,
0.5440528, 0.5451216, -0.1327265, 0.02745098, 0, 1, 1,
0.5487863, -0.6975968, 1.409214, 0.03137255, 0, 1, 1,
0.5499366, 0.8443004, 0.4482559, 0.03921569, 0, 1, 1,
0.5510505, 0.3008039, 0.9185942, 0.04313726, 0, 1, 1,
0.5518568, 1.366051, 1.562751, 0.05098039, 0, 1, 1,
0.5580465, 0.4582246, 1.709662, 0.05490196, 0, 1, 1,
0.5583223, 0.643123, 1.203787, 0.0627451, 0, 1, 1,
0.5601745, 0.3047211, -0.7002797, 0.06666667, 0, 1, 1,
0.5612102, 1.11795, 2.622103, 0.07450981, 0, 1, 1,
0.5612164, 0.1632423, 0.6287372, 0.07843138, 0, 1, 1,
0.5657871, -1.049326, 4.324625, 0.08627451, 0, 1, 1,
0.5674626, -0.4058426, 0.5134836, 0.09019608, 0, 1, 1,
0.5677822, -1.115709, 4.599611, 0.09803922, 0, 1, 1,
0.5678339, 1.710926, 0.2380315, 0.1058824, 0, 1, 1,
0.5710463, -0.2545541, 1.663479, 0.1098039, 0, 1, 1,
0.5717127, -1.022588, 3.010719, 0.1176471, 0, 1, 1,
0.5733231, 0.03355652, 1.472305, 0.1215686, 0, 1, 1,
0.5743972, -0.9379944, 2.256241, 0.1294118, 0, 1, 1,
0.5778367, -2.75974, 2.915109, 0.1333333, 0, 1, 1,
0.580893, -1.581523, 3.883061, 0.1411765, 0, 1, 1,
0.5845755, 0.5077446, 2.611735, 0.145098, 0, 1, 1,
0.5869947, 0.8817546, -0.2051153, 0.1529412, 0, 1, 1,
0.5888302, 0.4148973, -0.9897159, 0.1568628, 0, 1, 1,
0.5900156, 1.854475, 1.371514, 0.1647059, 0, 1, 1,
0.590054, 0.9595577, 1.567603, 0.1686275, 0, 1, 1,
0.5907976, -0.7476532, 0.5910519, 0.1764706, 0, 1, 1,
0.610378, 0.3262157, 0.9062304, 0.1803922, 0, 1, 1,
0.61261, 0.09619293, 0.8095959, 0.1882353, 0, 1, 1,
0.6146752, 1.695006, 1.060076, 0.1921569, 0, 1, 1,
0.6179703, 1.00986, 1.50787, 0.2, 0, 1, 1,
0.6212471, -1.152284, 2.921064, 0.2078431, 0, 1, 1,
0.6318275, 0.334598, 1.561671, 0.2117647, 0, 1, 1,
0.6334448, 0.2486597, 1.20918, 0.2196078, 0, 1, 1,
0.6341941, 0.3040016, -0.3156192, 0.2235294, 0, 1, 1,
0.640063, -1.436637, 1.857521, 0.2313726, 0, 1, 1,
0.645013, 1.669474, -0.3458117, 0.2352941, 0, 1, 1,
0.6474211, 0.442328, 0.2445524, 0.2431373, 0, 1, 1,
0.650422, -1.814733, 2.957754, 0.2470588, 0, 1, 1,
0.6518998, 1.409583, 1.636034, 0.254902, 0, 1, 1,
0.6527035, 0.1039573, 1.135201, 0.2588235, 0, 1, 1,
0.6649718, 0.3538963, -0.55094, 0.2666667, 0, 1, 1,
0.666954, 1.14485, -0.6541162, 0.2705882, 0, 1, 1,
0.6697075, 0.537918, -0.4540426, 0.2784314, 0, 1, 1,
0.6710054, 1.543855, 1.398256, 0.282353, 0, 1, 1,
0.6710999, 1.27577, 1.068116, 0.2901961, 0, 1, 1,
0.6728289, 0.1756395, 1.123815, 0.2941177, 0, 1, 1,
0.6911852, -1.171944, 2.593948, 0.3019608, 0, 1, 1,
0.6951275, 0.5192505, 0.5170762, 0.3098039, 0, 1, 1,
0.6987015, -1.73386, 4.724791, 0.3137255, 0, 1, 1,
0.6991882, -0.4949505, 0.1604778, 0.3215686, 0, 1, 1,
0.6993406, 0.8351427, 0.2674645, 0.3254902, 0, 1, 1,
0.6997889, 0.2971751, 0.7170881, 0.3333333, 0, 1, 1,
0.7087887, 0.9497635, 1.325631, 0.3372549, 0, 1, 1,
0.7120356, 1.334842, 1.603057, 0.345098, 0, 1, 1,
0.7126396, -1.498104, 2.212097, 0.3490196, 0, 1, 1,
0.7132535, 1.770492, 1.246629, 0.3568628, 0, 1, 1,
0.7186183, 0.09046651, -0.09046441, 0.3607843, 0, 1, 1,
0.7267881, -1.084769, 2.112011, 0.3686275, 0, 1, 1,
0.7273249, -0.1503496, 2.893945, 0.372549, 0, 1, 1,
0.7286126, 0.08717651, 1.169739, 0.3803922, 0, 1, 1,
0.7304963, -0.3360237, 2.62585, 0.3843137, 0, 1, 1,
0.736549, 0.622591, 0.101928, 0.3921569, 0, 1, 1,
0.7381901, -1.540871, 0.3300559, 0.3960784, 0, 1, 1,
0.7446029, 0.4877435, 1.665949, 0.4039216, 0, 1, 1,
0.7464162, -1.831056, 3.27626, 0.4117647, 0, 1, 1,
0.7464208, 0.04435932, 2.293939, 0.4156863, 0, 1, 1,
0.7473197, -1.227801, 2.819031, 0.4235294, 0, 1, 1,
0.7514424, 0.5187951, 2.273896, 0.427451, 0, 1, 1,
0.7518175, -1.824582, 2.456097, 0.4352941, 0, 1, 1,
0.7529998, -0.07670272, 2.450633, 0.4392157, 0, 1, 1,
0.7531525, 0.5975584, -0.03276826, 0.4470588, 0, 1, 1,
0.7537795, -0.3785598, 3.127277, 0.4509804, 0, 1, 1,
0.7614316, -0.1856554, 1.619847, 0.4588235, 0, 1, 1,
0.7628144, -0.6187122, 1.745075, 0.4627451, 0, 1, 1,
0.7663966, -1.168897, 2.474228, 0.4705882, 0, 1, 1,
0.7672709, 0.2648148, 1.863066, 0.4745098, 0, 1, 1,
0.7708026, -1.478474, 3.037841, 0.4823529, 0, 1, 1,
0.7721288, 1.66548, 0.6024715, 0.4862745, 0, 1, 1,
0.7885253, -0.5690174, 1.300904, 0.4941176, 0, 1, 1,
0.7899166, 0.2387036, 2.888361, 0.5019608, 0, 1, 1,
0.8006523, -0.5889152, 3.537222, 0.5058824, 0, 1, 1,
0.8013707, -1.49494, 1.938118, 0.5137255, 0, 1, 1,
0.8053395, -1.395295, 3.258173, 0.5176471, 0, 1, 1,
0.8060573, 1.100942, -0.1439748, 0.5254902, 0, 1, 1,
0.8080936, -0.8256218, 1.396704, 0.5294118, 0, 1, 1,
0.8213281, 1.049771, 2.331665, 0.5372549, 0, 1, 1,
0.8244074, 0.765524, 1.689618, 0.5411765, 0, 1, 1,
0.8253695, -0.1046948, 1.766358, 0.5490196, 0, 1, 1,
0.8325374, -2.325261, 4.406884, 0.5529412, 0, 1, 1,
0.8342411, 3.013774, 1.93132, 0.5607843, 0, 1, 1,
0.8358267, 0.5610249, 2.880349, 0.5647059, 0, 1, 1,
0.8428122, -0.3770175, 2.466193, 0.572549, 0, 1, 1,
0.8501391, 0.413621, 1.138767, 0.5764706, 0, 1, 1,
0.8572592, -0.1806601, 1.102795, 0.5843138, 0, 1, 1,
0.8576052, -1.044693, 3.17259, 0.5882353, 0, 1, 1,
0.8600588, 0.6717634, -0.5418501, 0.5960785, 0, 1, 1,
0.8632739, -0.967668, 3.557858, 0.6039216, 0, 1, 1,
0.8655818, -0.8075264, 2.763756, 0.6078432, 0, 1, 1,
0.8680805, 0.1193987, 0.1075064, 0.6156863, 0, 1, 1,
0.8712234, -0.7283089, 1.437841, 0.6196079, 0, 1, 1,
0.8729081, -0.5820529, 3.651519, 0.627451, 0, 1, 1,
0.8735795, 0.2943965, 0.4883116, 0.6313726, 0, 1, 1,
0.8767487, 0.4110769, -0.00915157, 0.6392157, 0, 1, 1,
0.8775066, -1.412929, 2.59023, 0.6431373, 0, 1, 1,
0.8780628, -1.050058, 2.020157, 0.6509804, 0, 1, 1,
0.8812807, 0.6466708, 1.22266, 0.654902, 0, 1, 1,
0.8818541, 0.3441133, 1.490911, 0.6627451, 0, 1, 1,
0.8826578, 1.094123, 0.5731546, 0.6666667, 0, 1, 1,
0.8860862, 0.4885688, 0.8713296, 0.6745098, 0, 1, 1,
0.8864602, 1.816736, 0.6506646, 0.6784314, 0, 1, 1,
0.8872016, -0.2963467, 2.123693, 0.6862745, 0, 1, 1,
0.8897122, 0.9055876, 1.573078, 0.6901961, 0, 1, 1,
0.8897337, 1.560775, -0.3366247, 0.6980392, 0, 1, 1,
0.8931754, 1.01778, 0.2029826, 0.7058824, 0, 1, 1,
0.8936968, 1.240386, 0.8031027, 0.7098039, 0, 1, 1,
0.895835, -0.8238075, 2.611152, 0.7176471, 0, 1, 1,
0.8977027, -0.3821821, 0.5481317, 0.7215686, 0, 1, 1,
0.9000846, -0.005861023, 0.5344158, 0.7294118, 0, 1, 1,
0.901144, -0.5965902, -0.1162237, 0.7333333, 0, 1, 1,
0.905141, 0.9015671, 1.353312, 0.7411765, 0, 1, 1,
0.905447, 0.3088582, 1.626626, 0.7450981, 0, 1, 1,
0.9064503, -0.09725693, 2.865916, 0.7529412, 0, 1, 1,
0.9116127, 1.247959, 0.4571328, 0.7568628, 0, 1, 1,
0.9129709, 1.477361, 1.412017, 0.7647059, 0, 1, 1,
0.9152282, -0.1949155, 1.95161, 0.7686275, 0, 1, 1,
0.9171694, 0.9318939, 0.6874148, 0.7764706, 0, 1, 1,
0.9227967, 0.1457994, 1.492622, 0.7803922, 0, 1, 1,
0.9249841, 0.0327646, 0.8467139, 0.7882353, 0, 1, 1,
0.9285138, -0.2419774, 3.482952, 0.7921569, 0, 1, 1,
0.9446442, -0.2340791, 1.952827, 0.8, 0, 1, 1,
0.9513549, 0.506607, 2.203707, 0.8078431, 0, 1, 1,
0.9514308, 0.9653478, 0.6835296, 0.8117647, 0, 1, 1,
0.9533336, -1.664115, 2.457429, 0.8196079, 0, 1, 1,
0.9592084, -2.09346, 4.190156, 0.8235294, 0, 1, 1,
0.9603284, 1.033694, 0.2369077, 0.8313726, 0, 1, 1,
0.9624271, 0.4715193, -0.3217064, 0.8352941, 0, 1, 1,
0.9631838, -0.9031648, 3.066647, 0.8431373, 0, 1, 1,
0.9632254, -0.05434434, 2.059828, 0.8470588, 0, 1, 1,
0.963762, -0.40047, 3.753525, 0.854902, 0, 1, 1,
0.9649606, -0.2997626, 3.057826, 0.8588235, 0, 1, 1,
0.9653968, 1.127026, -0.1287685, 0.8666667, 0, 1, 1,
0.9672881, 1.352208, -0.2058409, 0.8705882, 0, 1, 1,
0.9694346, -0.8108514, 3.768507, 0.8784314, 0, 1, 1,
0.9750221, 0.7052822, -0.2250187, 0.8823529, 0, 1, 1,
0.9777071, -1.538188, 2.397126, 0.8901961, 0, 1, 1,
0.9803746, 1.077515, -0.3092464, 0.8941177, 0, 1, 1,
0.9805812, -0.4587788, 1.442058, 0.9019608, 0, 1, 1,
0.9806591, 2.210669, 1.992129, 0.9098039, 0, 1, 1,
0.9842007, -0.290157, 3.07922, 0.9137255, 0, 1, 1,
0.987253, -0.2871948, 2.689283, 0.9215686, 0, 1, 1,
0.9974391, -0.771445, 2.574456, 0.9254902, 0, 1, 1,
0.998092, 1.062727, 1.137323, 0.9333333, 0, 1, 1,
0.9983121, 1.88909, 0.5892943, 0.9372549, 0, 1, 1,
0.999659, -0.8291772, 2.359089, 0.945098, 0, 1, 1,
1.001013, -2.038877, 3.393697, 0.9490196, 0, 1, 1,
1.003932, 0.3175963, -0.1652338, 0.9568627, 0, 1, 1,
1.006358, -1.463741, 1.813328, 0.9607843, 0, 1, 1,
1.01541, 1.27947, 0.9465529, 0.9686275, 0, 1, 1,
1.019154, -0.5010796, 2.202125, 0.972549, 0, 1, 1,
1.026736, 1.183226, -1.047671, 0.9803922, 0, 1, 1,
1.027826, 0.676349, -0.224136, 0.9843137, 0, 1, 1,
1.033171, -1.47138, 2.067082, 0.9921569, 0, 1, 1,
1.035919, -2.39089, 2.832253, 0.9960784, 0, 1, 1,
1.03767, 1.198221, 1.149565, 1, 0, 0.9960784, 1,
1.039949, -1.359917, 3.285652, 1, 0, 0.9882353, 1,
1.051144, -1.059854, 1.171178, 1, 0, 0.9843137, 1,
1.053146, 0.9080504, -0.6111642, 1, 0, 0.9764706, 1,
1.055768, 0.6421806, 2.118495, 1, 0, 0.972549, 1,
1.057256, -1.338659, 2.759016, 1, 0, 0.9647059, 1,
1.064457, -0.7940174, -0.2321007, 1, 0, 0.9607843, 1,
1.068902, 0.6026657, 1.550107, 1, 0, 0.9529412, 1,
1.068998, -1.312392, 1.10764, 1, 0, 0.9490196, 1,
1.069122, 1.272461, 0.6602469, 1, 0, 0.9411765, 1,
1.075468, 0.3146472, 1.245751, 1, 0, 0.9372549, 1,
1.076277, -0.6720006, 0.8087136, 1, 0, 0.9294118, 1,
1.077842, -1.25162, 3.566308, 1, 0, 0.9254902, 1,
1.080302, 1.70508, -2.033108, 1, 0, 0.9176471, 1,
1.080976, -0.1624207, 2.747202, 1, 0, 0.9137255, 1,
1.082002, -0.4653158, 1.666164, 1, 0, 0.9058824, 1,
1.093688, 1.607348, 1.178765, 1, 0, 0.9019608, 1,
1.0959, -0.8655272, 2.776221, 1, 0, 0.8941177, 1,
1.103981, 0.3949563, 1.727836, 1, 0, 0.8862745, 1,
1.106869, -0.7286237, 2.889388, 1, 0, 0.8823529, 1,
1.109981, -1.232085, 3.786258, 1, 0, 0.8745098, 1,
1.118267, 0.8407513, -0.232405, 1, 0, 0.8705882, 1,
1.120853, -0.2380839, 1.290294, 1, 0, 0.8627451, 1,
1.121671, -1.706649, 3.467964, 1, 0, 0.8588235, 1,
1.125814, 0.4548859, 2.119953, 1, 0, 0.8509804, 1,
1.127567, 0.2399679, 0.06712303, 1, 0, 0.8470588, 1,
1.128958, 1.113608, 1.326732, 1, 0, 0.8392157, 1,
1.133029, -0.9177338, 1.706367, 1, 0, 0.8352941, 1,
1.13542, 1.064929, -0.829904, 1, 0, 0.827451, 1,
1.13712, 0.1326903, 1.464833, 1, 0, 0.8235294, 1,
1.14481, -0.5890394, 2.065231, 1, 0, 0.8156863, 1,
1.148429, 0.1628388, 2.471661, 1, 0, 0.8117647, 1,
1.152454, 1.366641, 1.109125, 1, 0, 0.8039216, 1,
1.15636, 1.769898, 0.6686697, 1, 0, 0.7960784, 1,
1.161294, 1.445032, 1.45253, 1, 0, 0.7921569, 1,
1.162965, -0.4245188, 0.7631294, 1, 0, 0.7843137, 1,
1.166566, -0.6760532, 3.387348, 1, 0, 0.7803922, 1,
1.170887, -0.7734017, 1.128883, 1, 0, 0.772549, 1,
1.173207, 0.6253569, 1.995708, 1, 0, 0.7686275, 1,
1.187467, -0.7981673, 2.153943, 1, 0, 0.7607843, 1,
1.190094, -0.893881, 2.536016, 1, 0, 0.7568628, 1,
1.207882, 1.510308, 0.8962328, 1, 0, 0.7490196, 1,
1.212215, -1.138067, 2.567729, 1, 0, 0.7450981, 1,
1.217571, 0.7161086, 1.784893, 1, 0, 0.7372549, 1,
1.237638, -0.3124392, 2.193789, 1, 0, 0.7333333, 1,
1.24071, 0.2619709, -0.8776351, 1, 0, 0.7254902, 1,
1.24391, -0.0161452, 2.277932, 1, 0, 0.7215686, 1,
1.24507, -0.6460181, 1.635736, 1, 0, 0.7137255, 1,
1.25624, -1.097284, 2.674538, 1, 0, 0.7098039, 1,
1.261268, -0.7316861, 2.64298, 1, 0, 0.7019608, 1,
1.267969, -0.458221, 2.266282, 1, 0, 0.6941177, 1,
1.27017, -0.5670578, 1.885662, 1, 0, 0.6901961, 1,
1.27373, 0.9128516, 1.817903, 1, 0, 0.682353, 1,
1.274465, 0.06793986, 1.965619, 1, 0, 0.6784314, 1,
1.285071, -0.6423897, 3.996264, 1, 0, 0.6705883, 1,
1.309925, -1.255374, 0.3501969, 1, 0, 0.6666667, 1,
1.310206, 0.7585243, 2.19745, 1, 0, 0.6588235, 1,
1.321788, -0.2225488, 2.88291, 1, 0, 0.654902, 1,
1.322046, 1.437258, 1.31017, 1, 0, 0.6470588, 1,
1.325926, -0.3507285, 1.033259, 1, 0, 0.6431373, 1,
1.326834, 0.5739261, 0.7332684, 1, 0, 0.6352941, 1,
1.330952, 0.5682599, 1.48401, 1, 0, 0.6313726, 1,
1.338885, 1.435681, 1.41794, 1, 0, 0.6235294, 1,
1.354592, -1.32004, 3.582463, 1, 0, 0.6196079, 1,
1.356504, -1.44716, 2.418562, 1, 0, 0.6117647, 1,
1.35915, -0.9393516, 2.996315, 1, 0, 0.6078432, 1,
1.369086, 1.132558, -0.2636952, 1, 0, 0.6, 1,
1.37248, 0.4726214, 2.823567, 1, 0, 0.5921569, 1,
1.376043, -0.5532802, 1.903368, 1, 0, 0.5882353, 1,
1.376481, 1.372861, 0.04738215, 1, 0, 0.5803922, 1,
1.379945, 1.521998, 0.6451757, 1, 0, 0.5764706, 1,
1.385741, -1.619939, 3.219647, 1, 0, 0.5686275, 1,
1.386055, 0.8225831, 1.12044, 1, 0, 0.5647059, 1,
1.389137, 1.732893, 0.5037377, 1, 0, 0.5568628, 1,
1.396733, -0.4254149, 2.607102, 1, 0, 0.5529412, 1,
1.403431, 1.15852, 0.9041984, 1, 0, 0.5450981, 1,
1.407051, -0.7122666, 2.956571, 1, 0, 0.5411765, 1,
1.408266, -0.1967965, 1.436859, 1, 0, 0.5333334, 1,
1.40848, 1.807493, 0.2491982, 1, 0, 0.5294118, 1,
1.410256, -0.9870566, 0.8383338, 1, 0, 0.5215687, 1,
1.415466, 0.8391583, -0.8046884, 1, 0, 0.5176471, 1,
1.416591, -0.7864126, 0.9728147, 1, 0, 0.509804, 1,
1.419109, 0.4780276, 2.649114, 1, 0, 0.5058824, 1,
1.42176, 1.218864, 0.7241522, 1, 0, 0.4980392, 1,
1.42315, -0.1786517, 3.108443, 1, 0, 0.4901961, 1,
1.42591, -0.8031443, 0.3841532, 1, 0, 0.4862745, 1,
1.433029, -0.1102094, 1.47107, 1, 0, 0.4784314, 1,
1.434067, 0.07997291, 0.1876457, 1, 0, 0.4745098, 1,
1.434749, -0.08101844, 2.135682, 1, 0, 0.4666667, 1,
1.44279, -0.1189549, 1.694943, 1, 0, 0.4627451, 1,
1.451261, 0.5852023, 1.499098, 1, 0, 0.454902, 1,
1.454617, 1.743579, 1.447754, 1, 0, 0.4509804, 1,
1.457329, 0.487045, 0.8815886, 1, 0, 0.4431373, 1,
1.457717, 1.976668, 1.251182, 1, 0, 0.4392157, 1,
1.460077, 1.566717, -0.4796428, 1, 0, 0.4313726, 1,
1.462153, -0.2825704, 0.5009513, 1, 0, 0.427451, 1,
1.464334, 0.01287543, 3.702102, 1, 0, 0.4196078, 1,
1.468747, 0.9009616, 0.1593093, 1, 0, 0.4156863, 1,
1.488842, -1.431608, 2.752744, 1, 0, 0.4078431, 1,
1.497017, -1.929446, 2.043485, 1, 0, 0.4039216, 1,
1.498712, 0.2635587, 0.963393, 1, 0, 0.3960784, 1,
1.500685, -0.7455773, 1.823493, 1, 0, 0.3882353, 1,
1.505371, -0.06702586, 0.3411718, 1, 0, 0.3843137, 1,
1.50551, -0.08441504, 0.4688785, 1, 0, 0.3764706, 1,
1.511889, 0.05277611, 1.469208, 1, 0, 0.372549, 1,
1.525629, 0.02441198, 0.7250295, 1, 0, 0.3647059, 1,
1.527315, -1.00975, 3.071758, 1, 0, 0.3607843, 1,
1.528069, -0.3806558, 4.527554, 1, 0, 0.3529412, 1,
1.538108, -2.298251, 2.67461, 1, 0, 0.3490196, 1,
1.545299, -1.627682, 2.698848, 1, 0, 0.3411765, 1,
1.546382, -0.1278492, 3.293324, 1, 0, 0.3372549, 1,
1.548433, 0.3355645, 2.17805, 1, 0, 0.3294118, 1,
1.554131, 0.4917649, 1.658871, 1, 0, 0.3254902, 1,
1.560152, 0.4337023, -0.0152856, 1, 0, 0.3176471, 1,
1.560329, 0.2049584, 0.6345708, 1, 0, 0.3137255, 1,
1.563806, -0.3477778, 0.8284483, 1, 0, 0.3058824, 1,
1.573461, 0.878793, 0.04984752, 1, 0, 0.2980392, 1,
1.596729, 1.382451, 1.034168, 1, 0, 0.2941177, 1,
1.60717, -1.158176, 1.38616, 1, 0, 0.2862745, 1,
1.609703, -2.238441, 1.341098, 1, 0, 0.282353, 1,
1.626969, -0.6610303, -0.5759195, 1, 0, 0.2745098, 1,
1.655736, -1.540201, 1.432385, 1, 0, 0.2705882, 1,
1.657211, 2.670676, -1.599017, 1, 0, 0.2627451, 1,
1.664837, -0.1289001, 1.789861, 1, 0, 0.2588235, 1,
1.672851, 1.55311, 0.3642755, 1, 0, 0.2509804, 1,
1.701524, 0.534916, 1.514459, 1, 0, 0.2470588, 1,
1.707132, 1.105294, 1.312339, 1, 0, 0.2392157, 1,
1.709531, -0.9970117, 3.072905, 1, 0, 0.2352941, 1,
1.724522, 0.3582749, 1.601262, 1, 0, 0.227451, 1,
1.738229, 0.726565, 0.9433532, 1, 0, 0.2235294, 1,
1.755557, -0.6679069, 1.662005, 1, 0, 0.2156863, 1,
1.756333, -2.748537, 3.389646, 1, 0, 0.2117647, 1,
1.768696, 1.256441, 0.4788428, 1, 0, 0.2039216, 1,
1.793983, -0.8386285, 0.2178184, 1, 0, 0.1960784, 1,
1.806825, -0.4980295, 2.805777, 1, 0, 0.1921569, 1,
1.807163, -0.7080299, 2.283855, 1, 0, 0.1843137, 1,
1.816018, 0.2352817, 0.9486206, 1, 0, 0.1803922, 1,
1.828084, -0.4561325, 1.167555, 1, 0, 0.172549, 1,
1.830384, 1.035739, 2.450997, 1, 0, 0.1686275, 1,
1.830977, -1.028235, 2.808387, 1, 0, 0.1607843, 1,
1.878747, 1.421387, 0.6900256, 1, 0, 0.1568628, 1,
1.951393, -0.4766831, 2.423118, 1, 0, 0.1490196, 1,
1.974125, -0.3912478, 1.218979, 1, 0, 0.145098, 1,
1.976992, -1.274511, 0.8540767, 1, 0, 0.1372549, 1,
1.978265, 1.36068, 2.180582, 1, 0, 0.1333333, 1,
1.98026, -0.4773092, 0.653616, 1, 0, 0.1254902, 1,
1.999569, -1.213437, 1.759153, 1, 0, 0.1215686, 1,
2.003796, 0.02201759, 1.175547, 1, 0, 0.1137255, 1,
2.077789, 0.2512376, 3.244725, 1, 0, 0.1098039, 1,
2.078146, -1.270058, 1.593185, 1, 0, 0.1019608, 1,
2.090064, -0.8263677, 1.571966, 1, 0, 0.09411765, 1,
2.101055, -1.894979, 1.719016, 1, 0, 0.09019608, 1,
2.161758, -0.4341159, 1.676504, 1, 0, 0.08235294, 1,
2.169185, 1.394771, -0.5292502, 1, 0, 0.07843138, 1,
2.230171, 0.6245239, 0.6320136, 1, 0, 0.07058824, 1,
2.245987, -0.1847368, 2.312029, 1, 0, 0.06666667, 1,
2.254637, 0.3209177, 1.94655, 1, 0, 0.05882353, 1,
2.307403, -0.09979672, 2.012908, 1, 0, 0.05490196, 1,
2.412053, 1.136873, 0.8268173, 1, 0, 0.04705882, 1,
2.414761, -1.189752, 3.36237, 1, 0, 0.04313726, 1,
2.468022, -1.056769, 2.571245, 1, 0, 0.03529412, 1,
2.543741, 1.10174, -0.1077543, 1, 0, 0.03137255, 1,
2.606114, -1.948416, 3.663086, 1, 0, 0.02352941, 1,
3.042811, -0.0659183, 2.149986, 1, 0, 0.01960784, 1,
3.161255, 0.4383163, 0.2960389, 1, 0, 0.01176471, 1,
3.324321, -0.6762258, 0.7419499, 1, 0, 0.007843138, 1
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
0.005691409, -4.027046, -6.871821, 0, -0.5, 0.5, 0.5,
0.005691409, -4.027046, -6.871821, 1, -0.5, 0.5, 0.5,
0.005691409, -4.027046, -6.871821, 1, 1.5, 0.5, 0.5,
0.005691409, -4.027046, -6.871821, 0, 1.5, 0.5, 0.5
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
-4.437953, 0.01606488, -6.871821, 0, -0.5, 0.5, 0.5,
-4.437953, 0.01606488, -6.871821, 1, -0.5, 0.5, 0.5,
-4.437953, 0.01606488, -6.871821, 1, 1.5, 0.5, 0.5,
-4.437953, 0.01606488, -6.871821, 0, 1.5, 0.5, 0.5
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
-4.437953, -4.027046, 0.1272502, 0, -0.5, 0.5, 0.5,
-4.437953, -4.027046, 0.1272502, 1, -0.5, 0.5, 0.5,
-4.437953, -4.027046, 0.1272502, 1, 1.5, 0.5, 0.5,
-4.437953, -4.027046, 0.1272502, 0, 1.5, 0.5, 0.5
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
-3, -3.09402, -5.256651,
3, -3.09402, -5.256651,
-3, -3.09402, -5.256651,
-3, -3.249524, -5.525846,
-2, -3.09402, -5.256651,
-2, -3.249524, -5.525846,
-1, -3.09402, -5.256651,
-1, -3.249524, -5.525846,
0, -3.09402, -5.256651,
0, -3.249524, -5.525846,
1, -3.09402, -5.256651,
1, -3.249524, -5.525846,
2, -3.09402, -5.256651,
2, -3.249524, -5.525846,
3, -3.09402, -5.256651,
3, -3.249524, -5.525846
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
-3, -3.560533, -6.064236, 0, -0.5, 0.5, 0.5,
-3, -3.560533, -6.064236, 1, -0.5, 0.5, 0.5,
-3, -3.560533, -6.064236, 1, 1.5, 0.5, 0.5,
-3, -3.560533, -6.064236, 0, 1.5, 0.5, 0.5,
-2, -3.560533, -6.064236, 0, -0.5, 0.5, 0.5,
-2, -3.560533, -6.064236, 1, -0.5, 0.5, 0.5,
-2, -3.560533, -6.064236, 1, 1.5, 0.5, 0.5,
-2, -3.560533, -6.064236, 0, 1.5, 0.5, 0.5,
-1, -3.560533, -6.064236, 0, -0.5, 0.5, 0.5,
-1, -3.560533, -6.064236, 1, -0.5, 0.5, 0.5,
-1, -3.560533, -6.064236, 1, 1.5, 0.5, 0.5,
-1, -3.560533, -6.064236, 0, 1.5, 0.5, 0.5,
0, -3.560533, -6.064236, 0, -0.5, 0.5, 0.5,
0, -3.560533, -6.064236, 1, -0.5, 0.5, 0.5,
0, -3.560533, -6.064236, 1, 1.5, 0.5, 0.5,
0, -3.560533, -6.064236, 0, 1.5, 0.5, 0.5,
1, -3.560533, -6.064236, 0, -0.5, 0.5, 0.5,
1, -3.560533, -6.064236, 1, -0.5, 0.5, 0.5,
1, -3.560533, -6.064236, 1, 1.5, 0.5, 0.5,
1, -3.560533, -6.064236, 0, 1.5, 0.5, 0.5,
2, -3.560533, -6.064236, 0, -0.5, 0.5, 0.5,
2, -3.560533, -6.064236, 1, -0.5, 0.5, 0.5,
2, -3.560533, -6.064236, 1, 1.5, 0.5, 0.5,
2, -3.560533, -6.064236, 0, 1.5, 0.5, 0.5,
3, -3.560533, -6.064236, 0, -0.5, 0.5, 0.5,
3, -3.560533, -6.064236, 1, -0.5, 0.5, 0.5,
3, -3.560533, -6.064236, 1, 1.5, 0.5, 0.5,
3, -3.560533, -6.064236, 0, 1.5, 0.5, 0.5
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
-3.412497, -3, -5.256651,
-3.412497, 3, -5.256651,
-3.412497, -3, -5.256651,
-3.583406, -3, -5.525846,
-3.412497, -2, -5.256651,
-3.583406, -2, -5.525846,
-3.412497, -1, -5.256651,
-3.583406, -1, -5.525846,
-3.412497, 0, -5.256651,
-3.583406, 0, -5.525846,
-3.412497, 1, -5.256651,
-3.583406, 1, -5.525846,
-3.412497, 2, -5.256651,
-3.583406, 2, -5.525846,
-3.412497, 3, -5.256651,
-3.583406, 3, -5.525846
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
-3.925225, -3, -6.064236, 0, -0.5, 0.5, 0.5,
-3.925225, -3, -6.064236, 1, -0.5, 0.5, 0.5,
-3.925225, -3, -6.064236, 1, 1.5, 0.5, 0.5,
-3.925225, -3, -6.064236, 0, 1.5, 0.5, 0.5,
-3.925225, -2, -6.064236, 0, -0.5, 0.5, 0.5,
-3.925225, -2, -6.064236, 1, -0.5, 0.5, 0.5,
-3.925225, -2, -6.064236, 1, 1.5, 0.5, 0.5,
-3.925225, -2, -6.064236, 0, 1.5, 0.5, 0.5,
-3.925225, -1, -6.064236, 0, -0.5, 0.5, 0.5,
-3.925225, -1, -6.064236, 1, -0.5, 0.5, 0.5,
-3.925225, -1, -6.064236, 1, 1.5, 0.5, 0.5,
-3.925225, -1, -6.064236, 0, 1.5, 0.5, 0.5,
-3.925225, 0, -6.064236, 0, -0.5, 0.5, 0.5,
-3.925225, 0, -6.064236, 1, -0.5, 0.5, 0.5,
-3.925225, 0, -6.064236, 1, 1.5, 0.5, 0.5,
-3.925225, 0, -6.064236, 0, 1.5, 0.5, 0.5,
-3.925225, 1, -6.064236, 0, -0.5, 0.5, 0.5,
-3.925225, 1, -6.064236, 1, -0.5, 0.5, 0.5,
-3.925225, 1, -6.064236, 1, 1.5, 0.5, 0.5,
-3.925225, 1, -6.064236, 0, 1.5, 0.5, 0.5,
-3.925225, 2, -6.064236, 0, -0.5, 0.5, 0.5,
-3.925225, 2, -6.064236, 1, -0.5, 0.5, 0.5,
-3.925225, 2, -6.064236, 1, 1.5, 0.5, 0.5,
-3.925225, 2, -6.064236, 0, 1.5, 0.5, 0.5,
-3.925225, 3, -6.064236, 0, -0.5, 0.5, 0.5,
-3.925225, 3, -6.064236, 1, -0.5, 0.5, 0.5,
-3.925225, 3, -6.064236, 1, 1.5, 0.5, 0.5,
-3.925225, 3, -6.064236, 0, 1.5, 0.5, 0.5
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
-3.412497, -3.09402, -4,
-3.412497, -3.09402, 4,
-3.412497, -3.09402, -4,
-3.583406, -3.249524, -4,
-3.412497, -3.09402, -2,
-3.583406, -3.249524, -2,
-3.412497, -3.09402, 0,
-3.583406, -3.249524, 0,
-3.412497, -3.09402, 2,
-3.583406, -3.249524, 2,
-3.412497, -3.09402, 4,
-3.583406, -3.249524, 4
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
-3.925225, -3.560533, -4, 0, -0.5, 0.5, 0.5,
-3.925225, -3.560533, -4, 1, -0.5, 0.5, 0.5,
-3.925225, -3.560533, -4, 1, 1.5, 0.5, 0.5,
-3.925225, -3.560533, -4, 0, 1.5, 0.5, 0.5,
-3.925225, -3.560533, -2, 0, -0.5, 0.5, 0.5,
-3.925225, -3.560533, -2, 1, -0.5, 0.5, 0.5,
-3.925225, -3.560533, -2, 1, 1.5, 0.5, 0.5,
-3.925225, -3.560533, -2, 0, 1.5, 0.5, 0.5,
-3.925225, -3.560533, 0, 0, -0.5, 0.5, 0.5,
-3.925225, -3.560533, 0, 1, -0.5, 0.5, 0.5,
-3.925225, -3.560533, 0, 1, 1.5, 0.5, 0.5,
-3.925225, -3.560533, 0, 0, 1.5, 0.5, 0.5,
-3.925225, -3.560533, 2, 0, -0.5, 0.5, 0.5,
-3.925225, -3.560533, 2, 1, -0.5, 0.5, 0.5,
-3.925225, -3.560533, 2, 1, 1.5, 0.5, 0.5,
-3.925225, -3.560533, 2, 0, 1.5, 0.5, 0.5,
-3.925225, -3.560533, 4, 0, -0.5, 0.5, 0.5,
-3.925225, -3.560533, 4, 1, -0.5, 0.5, 0.5,
-3.925225, -3.560533, 4, 1, 1.5, 0.5, 0.5,
-3.925225, -3.560533, 4, 0, 1.5, 0.5, 0.5
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
-3.412497, -3.09402, -5.256651,
-3.412497, 3.12615, -5.256651,
-3.412497, -3.09402, 5.511151,
-3.412497, 3.12615, 5.511151,
-3.412497, -3.09402, -5.256651,
-3.412497, -3.09402, 5.511151,
-3.412497, 3.12615, -5.256651,
-3.412497, 3.12615, 5.511151,
-3.412497, -3.09402, -5.256651,
3.42388, -3.09402, -5.256651,
-3.412497, -3.09402, 5.511151,
3.42388, -3.09402, 5.511151,
-3.412497, 3.12615, -5.256651,
3.42388, 3.12615, -5.256651,
-3.412497, 3.12615, 5.511151,
3.42388, 3.12615, 5.511151,
3.42388, -3.09402, -5.256651,
3.42388, 3.12615, -5.256651,
3.42388, -3.09402, 5.511151,
3.42388, 3.12615, 5.511151,
3.42388, -3.09402, -5.256651,
3.42388, -3.09402, 5.511151,
3.42388, 3.12615, -5.256651,
3.42388, 3.12615, 5.511151
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
var radius = 7.577486;
var distance = 33.71309;
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
mvMatrix.translate( -0.005691409, -0.01606488, -0.1272502 );
mvMatrix.scale( 1.198431, 1.317155, 0.7608727 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.71309);
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
CS2<-read.table("CS2.xyz")
```

```
## Error in read.table("CS2.xyz"): no lines available in input
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
-3.312938, -2.049845, -0.2944891, 0, 0, 1, 1, 1,
-2.916484, 0.05308926, -3.034212, 1, 0, 0, 1, 1,
-2.73573, 0.9109311, -1.729297, 1, 0, 0, 1, 1,
-2.608929, 0.2861076, 0.1297332, 1, 0, 0, 1, 1,
-2.536124, -1.145467, -1.462987, 1, 0, 0, 1, 1,
-2.510515, -0.4102105, -1.248252, 1, 0, 0, 1, 1,
-2.431898, -1.374609, -1.491163, 0, 0, 0, 1, 1,
-2.426747, 1.258227, -1.80874, 0, 0, 0, 1, 1,
-2.424316, 1.432714, 1.532049, 0, 0, 0, 1, 1,
-2.398077, -0.6953625, -2.342924, 0, 0, 0, 1, 1,
-2.391675, -0.1111689, -1.541403, 0, 0, 0, 1, 1,
-2.382129, -1.993372, -3.205742, 0, 0, 0, 1, 1,
-2.331147, -1.113844, -1.975833, 0, 0, 0, 1, 1,
-2.299506, 0.8409429, -0.8058752, 1, 1, 1, 1, 1,
-2.21919, 1.35058, 1.06394, 1, 1, 1, 1, 1,
-2.206046, -1.47912, -4.280506, 1, 1, 1, 1, 1,
-2.197447, -0.1122944, -1.028893, 1, 1, 1, 1, 1,
-2.083455, 1.410006, -2.136464, 1, 1, 1, 1, 1,
-2.079461, 0.0260831, -0.6560348, 1, 1, 1, 1, 1,
-2.07057, 1.793177, -2.316025, 1, 1, 1, 1, 1,
-2.057783, 2.629025, -2.085753, 1, 1, 1, 1, 1,
-2.042951, -0.3093386, -2.759192, 1, 1, 1, 1, 1,
-1.97315, 0.3836205, -1.362712, 1, 1, 1, 1, 1,
-1.96735, -0.7714314, -1.523495, 1, 1, 1, 1, 1,
-1.958006, -0.6595544, -2.163134, 1, 1, 1, 1, 1,
-1.953277, -1.222744, -2.647979, 1, 1, 1, 1, 1,
-1.938855, 0.5382957, -0.5794079, 1, 1, 1, 1, 1,
-1.917527, -2.137064, -1.716977, 1, 1, 1, 1, 1,
-1.864324, -0.534886, -2.191485, 0, 0, 1, 1, 1,
-1.85967, 0.1836647, -1.90077, 1, 0, 0, 1, 1,
-1.858125, 1.598467, -0.1627942, 1, 0, 0, 1, 1,
-1.826212, -1.891118, -2.176217, 1, 0, 0, 1, 1,
-1.795063, -0.2562252, -0.9015956, 1, 0, 0, 1, 1,
-1.794838, 1.34568, -1.627265, 1, 0, 0, 1, 1,
-1.791882, -0.2942081, -0.8133078, 0, 0, 0, 1, 1,
-1.77373, -0.9739836, -1.491038, 0, 0, 0, 1, 1,
-1.769702, 0.9078279, 0.4650819, 0, 0, 0, 1, 1,
-1.755333, -0.2531879, -3.336978, 0, 0, 0, 1, 1,
-1.735506, 1.041387, -0.2757911, 0, 0, 0, 1, 1,
-1.72534, 0.1428322, -2.261152, 0, 0, 0, 1, 1,
-1.723426, -0.3667305, -2.6119, 0, 0, 0, 1, 1,
-1.715835, -1.166043, -1.94971, 1, 1, 1, 1, 1,
-1.711904, -0.9585264, -1.929753, 1, 1, 1, 1, 1,
-1.711368, 0.3375272, -1.721382, 1, 1, 1, 1, 1,
-1.703508, 0.6028941, -0.5444868, 1, 1, 1, 1, 1,
-1.683106, 0.3693387, -1.040345, 1, 1, 1, 1, 1,
-1.671145, 0.9074016, -3.242077, 1, 1, 1, 1, 1,
-1.666434, -1.72625, -2.135953, 1, 1, 1, 1, 1,
-1.662435, 0.9311045, -1.568135, 1, 1, 1, 1, 1,
-1.658164, -0.04145829, -0.9670136, 1, 1, 1, 1, 1,
-1.658164, -1.147395, -2.908089, 1, 1, 1, 1, 1,
-1.649771, 0.7967945, -1.661787, 1, 1, 1, 1, 1,
-1.645026, -0.4105521, -1.542241, 1, 1, 1, 1, 1,
-1.631117, -0.08903403, -1.395645, 1, 1, 1, 1, 1,
-1.619651, 0.7429463, -1.38727, 1, 1, 1, 1, 1,
-1.585004, 0.3448739, -0.7020302, 1, 1, 1, 1, 1,
-1.565585, 0.6027945, -0.3612447, 0, 0, 1, 1, 1,
-1.565556, 0.9486656, -0.3840386, 1, 0, 0, 1, 1,
-1.562819, -1.009197, -3.080832, 1, 0, 0, 1, 1,
-1.560378, -1.400095, -0.4486385, 1, 0, 0, 1, 1,
-1.552618, -0.9371274, -2.034908, 1, 0, 0, 1, 1,
-1.55206, 0.8266528, -0.9729791, 1, 0, 0, 1, 1,
-1.539435, -0.7131386, -1.955051, 0, 0, 0, 1, 1,
-1.531289, 0.9179149, -0.5146312, 0, 0, 0, 1, 1,
-1.524834, -0.9675499, 0.02231048, 0, 0, 0, 1, 1,
-1.508438, 1.225875, -0.6889181, 0, 0, 0, 1, 1,
-1.507354, 1.408276, -0.7610229, 0, 0, 0, 1, 1,
-1.506939, -0.4647503, -3.515587, 0, 0, 0, 1, 1,
-1.498859, 1.36671, -0.2208368, 0, 0, 0, 1, 1,
-1.494545, -0.4252461, 0.5227894, 1, 1, 1, 1, 1,
-1.487076, 0.742417, -0.6628836, 1, 1, 1, 1, 1,
-1.481568, -0.1348878, -2.218475, 1, 1, 1, 1, 1,
-1.477086, -0.7457054, -2.483692, 1, 1, 1, 1, 1,
-1.466536, -0.6359027, -2.865195, 1, 1, 1, 1, 1,
-1.463695, 1.747206, -0.4399731, 1, 1, 1, 1, 1,
-1.455384, 0.4366023, -0.5755647, 1, 1, 1, 1, 1,
-1.452995, -0.3782313, -2.479725, 1, 1, 1, 1, 1,
-1.444978, -0.7692806, -2.749896, 1, 1, 1, 1, 1,
-1.443305, 1.114976, 0.5939725, 1, 1, 1, 1, 1,
-1.430394, 0.614243, 0.5765116, 1, 1, 1, 1, 1,
-1.428761, 0.925971, -1.336045, 1, 1, 1, 1, 1,
-1.420431, 1.82575, -2.727049, 1, 1, 1, 1, 1,
-1.405112, -1.016277, -2.005268, 1, 1, 1, 1, 1,
-1.404247, -1.003239, -2.010792, 1, 1, 1, 1, 1,
-1.394048, 0.9686103, -2.120972, 0, 0, 1, 1, 1,
-1.389463, -1.95699, -1.287927, 1, 0, 0, 1, 1,
-1.376114, 0.879804, -0.8867471, 1, 0, 0, 1, 1,
-1.366865, 1.113977, -1.921229, 1, 0, 0, 1, 1,
-1.365811, -1.808699, -0.9794996, 1, 0, 0, 1, 1,
-1.359174, -0.1088068, -1.905876, 1, 0, 0, 1, 1,
-1.352427, -0.8178449, -1.119351, 0, 0, 0, 1, 1,
-1.348266, 0.8955887, -1.032343, 0, 0, 0, 1, 1,
-1.345995, -0.310912, -1.769383, 0, 0, 0, 1, 1,
-1.338296, 0.9977914, -0.7539154, 0, 0, 0, 1, 1,
-1.301555, -0.8635074, -2.529746, 0, 0, 0, 1, 1,
-1.300582, -0.157971, -2.20148, 0, 0, 0, 1, 1,
-1.297188, -1.454773, -0.7666927, 0, 0, 0, 1, 1,
-1.2844, -0.8621992, -2.912212, 1, 1, 1, 1, 1,
-1.282385, -1.818671, -2.888222, 1, 1, 1, 1, 1,
-1.280909, -0.4445102, -1.62184, 1, 1, 1, 1, 1,
-1.278199, -1.720543, -2.269498, 1, 1, 1, 1, 1,
-1.267826, 0.3672721, -0.6596798, 1, 1, 1, 1, 1,
-1.256526, -0.9989168, -0.7356386, 1, 1, 1, 1, 1,
-1.253881, 0.5848071, -1.732992, 1, 1, 1, 1, 1,
-1.245257, -1.441398, -3.641498, 1, 1, 1, 1, 1,
-1.2432, 0.2687744, -1.435089, 1, 1, 1, 1, 1,
-1.232531, -1.283124, -3.471281, 1, 1, 1, 1, 1,
-1.228695, -0.3570201, -0.7858522, 1, 1, 1, 1, 1,
-1.223669, -0.5589463, -2.78889, 1, 1, 1, 1, 1,
-1.220273, -2.150991, -0.8062337, 1, 1, 1, 1, 1,
-1.22027, 0.8132859, -2.206221, 1, 1, 1, 1, 1,
-1.216004, 1.74524, -3.269357, 1, 1, 1, 1, 1,
-1.214748, 0.8935813, -0.7136629, 0, 0, 1, 1, 1,
-1.206417, -1.378826, -3.924752, 1, 0, 0, 1, 1,
-1.198118, -0.996287, -2.125005, 1, 0, 0, 1, 1,
-1.196644, -1.230937, -0.8560668, 1, 0, 0, 1, 1,
-1.191512, 0.08818569, -0.2312703, 1, 0, 0, 1, 1,
-1.191243, 0.8218789, -2.138963, 1, 0, 0, 1, 1,
-1.191076, 1.300203, -1.295662, 0, 0, 0, 1, 1,
-1.181935, -0.8301896, -3.029431, 0, 0, 0, 1, 1,
-1.16472, -1.054722, -2.67297, 0, 0, 0, 1, 1,
-1.164271, -0.2490443, -3.336892, 0, 0, 0, 1, 1,
-1.163506, -0.7881378, -2.928311, 0, 0, 0, 1, 1,
-1.162204, 0.9801847, -1.409128, 0, 0, 0, 1, 1,
-1.151001, 0.1361423, -1.194381, 0, 0, 0, 1, 1,
-1.145016, 0.4421884, -1.323904, 1, 1, 1, 1, 1,
-1.143072, 1.681326, -0.4813845, 1, 1, 1, 1, 1,
-1.135949, -1.615194, -2.374917, 1, 1, 1, 1, 1,
-1.131199, 0.5051996, -0.6175041, 1, 1, 1, 1, 1,
-1.124318, 0.2154371, -1.008477, 1, 1, 1, 1, 1,
-1.117543, -0.01301312, -2.141988, 1, 1, 1, 1, 1,
-1.108164, -1.168476, -1.882544, 1, 1, 1, 1, 1,
-1.105896, 1.079363, -0.1209534, 1, 1, 1, 1, 1,
-1.105572, 0.6810881, -1.741646, 1, 1, 1, 1, 1,
-1.1043, 0.8565316, -1.694076, 1, 1, 1, 1, 1,
-1.0985, 0.1951672, -0.07685909, 1, 1, 1, 1, 1,
-1.098013, 1.143533, -1.031447, 1, 1, 1, 1, 1,
-1.095603, 0.883334, -0.8340469, 1, 1, 1, 1, 1,
-1.094827, -0.2695629, -2.28111, 1, 1, 1, 1, 1,
-1.086653, -1.858675, -2.718868, 1, 1, 1, 1, 1,
-1.0849, -0.4321161, -1.819477, 0, 0, 1, 1, 1,
-1.068731, -0.7686128, -2.101435, 1, 0, 0, 1, 1,
-1.06722, -0.03323172, -1.719561, 1, 0, 0, 1, 1,
-1.064677, 0.07080856, -0.5174744, 1, 0, 0, 1, 1,
-1.061557, -1.147869, -2.465256, 1, 0, 0, 1, 1,
-1.054836, -0.9630722, -2.113757, 1, 0, 0, 1, 1,
-1.0491, -0.6419739, -2.460696, 0, 0, 0, 1, 1,
-1.039939, 0.6974366, 0.05977464, 0, 0, 0, 1, 1,
-1.035358, -1.454281, -3.575155, 0, 0, 0, 1, 1,
-1.034573, 0.1125991, -0.8783266, 0, 0, 0, 1, 1,
-1.034507, -1.161229, -2.541579, 0, 0, 0, 1, 1,
-1.029972, 1.307376, -0.1595033, 0, 0, 0, 1, 1,
-1.028991, 1.211452, -1.398408, 0, 0, 0, 1, 1,
-1.028612, 0.1975362, -1.29395, 1, 1, 1, 1, 1,
-1.024265, -1.316556, -2.51284, 1, 1, 1, 1, 1,
-1.022329, -1.680827, -4.20574, 1, 1, 1, 1, 1,
-1.021228, 1.350101, -2.70663, 1, 1, 1, 1, 1,
-1.018503, 0.3467403, -1.891304, 1, 1, 1, 1, 1,
-1.018197, -0.144763, -3.138633, 1, 1, 1, 1, 1,
-1.014572, 0.9685262, -0.5844126, 1, 1, 1, 1, 1,
-0.9906511, -0.8293319, -1.773493, 1, 1, 1, 1, 1,
-0.9753585, -0.6433729, -3.200218, 1, 1, 1, 1, 1,
-0.9722515, -0.2479547, -0.1601071, 1, 1, 1, 1, 1,
-0.9714789, 3.035565, 0.6700317, 1, 1, 1, 1, 1,
-0.9672059, 1.251077, -0.4050827, 1, 1, 1, 1, 1,
-0.9647083, 0.1453435, -0.8430007, 1, 1, 1, 1, 1,
-0.9642591, 0.592227, 0.3093449, 1, 1, 1, 1, 1,
-0.9597015, -1.423773, -3.375746, 1, 1, 1, 1, 1,
-0.957404, 1.711793, -0.9526144, 0, 0, 1, 1, 1,
-0.951766, -0.8249577, -2.56269, 1, 0, 0, 1, 1,
-0.9507311, 0.0140448, -1.164598, 1, 0, 0, 1, 1,
-0.9475399, 0.08360439, -0.7647884, 1, 0, 0, 1, 1,
-0.939971, -0.4284694, -4.166918, 1, 0, 0, 1, 1,
-0.9340713, -0.3901904, -1.794218, 1, 0, 0, 1, 1,
-0.9267058, 0.3939105, -0.1586744, 0, 0, 0, 1, 1,
-0.9264374, 1.550437, -0.4016735, 0, 0, 0, 1, 1,
-0.9245177, 0.07406918, -1.582667, 0, 0, 0, 1, 1,
-0.9224232, -0.2777387, -0.7588151, 0, 0, 0, 1, 1,
-0.9200659, 0.188864, -0.1835996, 0, 0, 0, 1, 1,
-0.909495, -0.6581509, -1.55178, 0, 0, 0, 1, 1,
-0.8995063, -1.625184, -3.322545, 0, 0, 0, 1, 1,
-0.8985434, -0.1061028, -0.8657033, 1, 1, 1, 1, 1,
-0.8945757, 0.4482404, 0.1406598, 1, 1, 1, 1, 1,
-0.885841, 1.664253, 0.8795573, 1, 1, 1, 1, 1,
-0.879417, -0.2361136, -3.297472, 1, 1, 1, 1, 1,
-0.8767936, 0.205603, -0.5707671, 1, 1, 1, 1, 1,
-0.8765255, 0.07549126, -2.701221, 1, 1, 1, 1, 1,
-0.8721823, 1.282789, -1.790862, 1, 1, 1, 1, 1,
-0.8705116, -0.182602, -1.546509, 1, 1, 1, 1, 1,
-0.8596374, 0.5879736, -1.082165, 1, 1, 1, 1, 1,
-0.8565373, -0.3912447, 0.1005329, 1, 1, 1, 1, 1,
-0.8554397, 0.8422982, -2.452391, 1, 1, 1, 1, 1,
-0.8449855, 1.010392, 0.242588, 1, 1, 1, 1, 1,
-0.8422692, -1.025707, -2.638259, 1, 1, 1, 1, 1,
-0.8405796, 1.353329, 1.039253, 1, 1, 1, 1, 1,
-0.8330079, -0.1452557, -0.3243392, 1, 1, 1, 1, 1,
-0.8295972, 0.6213878, -0.7249758, 0, 0, 1, 1, 1,
-0.8255757, -0.4890134, -2.979251, 1, 0, 0, 1, 1,
-0.8252687, 0.8554024, -2.905022, 1, 0, 0, 1, 1,
-0.8159863, 0.9953701, -1.452036, 1, 0, 0, 1, 1,
-0.8147735, 0.07174198, -3.500941, 1, 0, 0, 1, 1,
-0.8121495, -1.051151, -2.660655, 1, 0, 0, 1, 1,
-0.8098503, 0.1975085, -1.030391, 0, 0, 0, 1, 1,
-0.8053676, 1.657645, 1.473764, 0, 0, 0, 1, 1,
-0.805352, 0.9730832, -0.06372257, 0, 0, 0, 1, 1,
-0.8007259, -0.5567453, -2.25814, 0, 0, 0, 1, 1,
-0.7967858, -0.4309922, -1.803025, 0, 0, 0, 1, 1,
-0.7888535, -1.340547, -2.05077, 0, 0, 0, 1, 1,
-0.787993, 0.4332678, 0.4437996, 0, 0, 0, 1, 1,
-0.7795979, -0.652554, -3.745233, 1, 1, 1, 1, 1,
-0.7787578, 0.6857328, -3.814101, 1, 1, 1, 1, 1,
-0.7784549, 0.1449168, -2.377297, 1, 1, 1, 1, 1,
-0.7772173, 0.3185866, -1.554478, 1, 1, 1, 1, 1,
-0.7755359, 1.09321, -1.647055, 1, 1, 1, 1, 1,
-0.7736446, 1.736834, -1.420596, 1, 1, 1, 1, 1,
-0.7663015, 0.4521909, -0.5447149, 1, 1, 1, 1, 1,
-0.7636532, -1.1959, -1.892432, 1, 1, 1, 1, 1,
-0.7627005, -1.262862, -2.504839, 1, 1, 1, 1, 1,
-0.7533872, 0.8095667, -0.6524843, 1, 1, 1, 1, 1,
-0.7525163, 1.626057, 0.58769, 1, 1, 1, 1, 1,
-0.7502112, 0.008989138, -0.4713692, 1, 1, 1, 1, 1,
-0.7417513, -0.9116267, -2.742761, 1, 1, 1, 1, 1,
-0.7384853, 0.3511415, -0.4889721, 1, 1, 1, 1, 1,
-0.7380382, 0.1161441, -1.783643, 1, 1, 1, 1, 1,
-0.7372172, -1.022965, -3.623784, 0, 0, 1, 1, 1,
-0.736964, -0.2259874, -2.028834, 1, 0, 0, 1, 1,
-0.7277142, 0.8703431, -0.4150352, 1, 0, 0, 1, 1,
-0.7258091, 0.3541145, -1.57461, 1, 0, 0, 1, 1,
-0.7253169, 0.6245088, -0.8185357, 1, 0, 0, 1, 1,
-0.7124461, 0.474258, -0.3944571, 1, 0, 0, 1, 1,
-0.7090456, 0.4857956, -0.6291656, 0, 0, 0, 1, 1,
-0.7063662, 1.245224, -0.2002336, 0, 0, 0, 1, 1,
-0.6984262, -0.7203676, -4.784357, 0, 0, 0, 1, 1,
-0.6937342, 0.5966088, -1.005104, 0, 0, 0, 1, 1,
-0.6882098, 0.8876011, 0.3549916, 0, 0, 0, 1, 1,
-0.6872445, -0.2825595, -3.559341, 0, 0, 0, 1, 1,
-0.6860892, -0.1687914, -2.806037, 0, 0, 0, 1, 1,
-0.681985, 1.229004, -1.657821, 1, 1, 1, 1, 1,
-0.6802756, -0.3691857, -1.964417, 1, 1, 1, 1, 1,
-0.6801313, -0.5217841, -2.040977, 1, 1, 1, 1, 1,
-0.6749852, 0.3962799, -0.2778335, 1, 1, 1, 1, 1,
-0.6718646, -0.7968317, -1.302507, 1, 1, 1, 1, 1,
-0.6674121, 0.3006037, -0.8280238, 1, 1, 1, 1, 1,
-0.6626059, -0.4800686, -2.009461, 1, 1, 1, 1, 1,
-0.6619633, -0.0131146, -3.9371, 1, 1, 1, 1, 1,
-0.6586003, 0.9288937, -0.6366261, 1, 1, 1, 1, 1,
-0.6572518, 0.7939214, -0.3215683, 1, 1, 1, 1, 1,
-0.6556624, 0.7408581, 0.08778264, 1, 1, 1, 1, 1,
-0.6548616, -1.436036, -2.307477, 1, 1, 1, 1, 1,
-0.6465752, -0.1297469, 0.4542, 1, 1, 1, 1, 1,
-0.6391001, 0.654864, -1.362971, 1, 1, 1, 1, 1,
-0.6364272, -1.484976, -1.504174, 1, 1, 1, 1, 1,
-0.6343669, 0.6243761, 0.02473582, 0, 0, 1, 1, 1,
-0.6314827, -0.5714846, -4.522077, 1, 0, 0, 1, 1,
-0.627486, 0.4786801, -2.099384, 1, 0, 0, 1, 1,
-0.6251856, 0.9019047, -1.876568, 1, 0, 0, 1, 1,
-0.6216043, -0.5573373, -0.04952232, 1, 0, 0, 1, 1,
-0.618112, -0.2179985, 0.5640835, 1, 0, 0, 1, 1,
-0.6159915, 0.9001786, -0.01528019, 0, 0, 0, 1, 1,
-0.6117655, -0.7433608, -2.158698, 0, 0, 0, 1, 1,
-0.610478, 0.2245119, 0.1870908, 0, 0, 0, 1, 1,
-0.6100041, -0.6077418, -2.570846, 0, 0, 0, 1, 1,
-0.6022804, 0.553566, -1.537928, 0, 0, 0, 1, 1,
-0.60169, 0.4569066, -1.544524, 0, 0, 0, 1, 1,
-0.5903021, 0.6656826, -0.5494242, 0, 0, 0, 1, 1,
-0.5876651, 1.303457, -0.1749686, 1, 1, 1, 1, 1,
-0.5854208, -0.4648842, -1.888366, 1, 1, 1, 1, 1,
-0.5837306, 0.02240657, -0.9119081, 1, 1, 1, 1, 1,
-0.5836061, -0.6860245, -2.380159, 1, 1, 1, 1, 1,
-0.5805414, 0.5058451, 0.005921839, 1, 1, 1, 1, 1,
-0.578537, 0.5904994, -1.006287, 1, 1, 1, 1, 1,
-0.573007, -0.1056264, -1.19497, 1, 1, 1, 1, 1,
-0.5718936, -0.327487, -4.155323, 1, 1, 1, 1, 1,
-0.5688412, -0.893262, -2.541241, 1, 1, 1, 1, 1,
-0.5684966, 0.0798147, -0.4287601, 1, 1, 1, 1, 1,
-0.5629945, -1.652295, -1.334539, 1, 1, 1, 1, 1,
-0.5608662, -0.1672521, -2.646862, 1, 1, 1, 1, 1,
-0.5597914, -1.08413, -4.636137, 1, 1, 1, 1, 1,
-0.5590183, 0.1333786, 0.351263, 1, 1, 1, 1, 1,
-0.5453008, 0.8866485, -1.004855, 1, 1, 1, 1, 1,
-0.5405322, -0.1861398, -2.244546, 0, 0, 1, 1, 1,
-0.536221, 1.335735, -0.2808253, 1, 0, 0, 1, 1,
-0.5320182, 0.4436679, 1.1074, 1, 0, 0, 1, 1,
-0.5300853, -1.5132, -2.858057, 1, 0, 0, 1, 1,
-0.5299957, 0.1523051, -0.7677733, 1, 0, 0, 1, 1,
-0.5272256, 1.578665, -0.06165745, 1, 0, 0, 1, 1,
-0.5256345, 0.2337283, -1.526866, 0, 0, 0, 1, 1,
-0.5211722, -0.1470516, -0.8854463, 0, 0, 0, 1, 1,
-0.5190429, -1.154288, -2.470407, 0, 0, 0, 1, 1,
-0.5186462, -0.7560797, -3.137868, 0, 0, 0, 1, 1,
-0.5183318, 0.7314517, -0.04477961, 0, 0, 0, 1, 1,
-0.5149074, 1.142443, 0.6860359, 0, 0, 0, 1, 1,
-0.5120824, -0.2362854, -0.2362076, 0, 0, 0, 1, 1,
-0.511708, -2.190246, -3.407089, 1, 1, 1, 1, 1,
-0.5103723, 0.1154174, -1.130898, 1, 1, 1, 1, 1,
-0.5065699, 1.501982, -1.219509, 1, 1, 1, 1, 1,
-0.5061309, 0.430966, -1.144191, 1, 1, 1, 1, 1,
-0.5042928, -0.6361069, -1.957361, 1, 1, 1, 1, 1,
-0.5001341, 0.1989607, 1.290593, 1, 1, 1, 1, 1,
-0.4975919, -1.195967, -1.162116, 1, 1, 1, 1, 1,
-0.4921372, 0.0133037, -0.6276462, 1, 1, 1, 1, 1,
-0.4892428, -2.835874, -1.898249, 1, 1, 1, 1, 1,
-0.4823692, -0.3630809, -2.416376, 1, 1, 1, 1, 1,
-0.4780623, 1.873829, -0.5686703, 1, 1, 1, 1, 1,
-0.4763944, -0.9803971, -2.118454, 1, 1, 1, 1, 1,
-0.4749025, -1.101899, -2.696026, 1, 1, 1, 1, 1,
-0.4742771, -0.4871581, -1.665941, 1, 1, 1, 1, 1,
-0.4742434, -0.6077272, -1.589503, 1, 1, 1, 1, 1,
-0.4707336, 0.5926794, -1.68504, 0, 0, 1, 1, 1,
-0.4669154, 1.853693, -1.18247, 1, 0, 0, 1, 1,
-0.464618, 0.1151732, 0.4369114, 1, 0, 0, 1, 1,
-0.4639539, 0.3046906, 0.4656766, 1, 0, 0, 1, 1,
-0.4579611, 1.549166, -1.517341, 1, 0, 0, 1, 1,
-0.4524311, 0.3986673, 1.792679, 1, 0, 0, 1, 1,
-0.4478861, 1.041945, -2.142974, 0, 0, 0, 1, 1,
-0.425537, 0.1871556, -1.273122, 0, 0, 0, 1, 1,
-0.4220512, -0.6845633, -1.960417, 0, 0, 0, 1, 1,
-0.4195503, 0.533052, -1.469709, 0, 0, 0, 1, 1,
-0.4170699, 1.433653, -1.418304, 0, 0, 0, 1, 1,
-0.4168415, 0.8871588, -0.7887348, 0, 0, 0, 1, 1,
-0.409705, 0.6989898, -1.835281, 0, 0, 0, 1, 1,
-0.4061161, -0.5782033, -2.676893, 1, 1, 1, 1, 1,
-0.4027686, -0.6983484, -3.077145, 1, 1, 1, 1, 1,
-0.4000494, 1.082501, -1.78666, 1, 1, 1, 1, 1,
-0.4000242, -0.3402404, -1.968765, 1, 1, 1, 1, 1,
-0.3959099, 0.9450486, -1.091352, 1, 1, 1, 1, 1,
-0.3947087, -1.249858, -3.075682, 1, 1, 1, 1, 1,
-0.3901348, 0.03725875, -0.9465908, 1, 1, 1, 1, 1,
-0.3881373, -0.0279801, 0.3030698, 1, 1, 1, 1, 1,
-0.3850882, 1.088065, 1.686676, 1, 1, 1, 1, 1,
-0.3845853, 0.1914537, -1.097563, 1, 1, 1, 1, 1,
-0.3811067, 2.280202, 0.2341227, 1, 1, 1, 1, 1,
-0.3800563, -0.4616437, -3.017389, 1, 1, 1, 1, 1,
-0.377018, -1.341109, -2.903283, 1, 1, 1, 1, 1,
-0.3766348, 0.06694768, -2.725032, 1, 1, 1, 1, 1,
-0.3763885, -0.1383978, -1.843661, 1, 1, 1, 1, 1,
-0.3751955, 0.1340259, -1.878379, 0, 0, 1, 1, 1,
-0.3693734, -0.8521296, -1.300615, 1, 0, 0, 1, 1,
-0.369185, -0.3964568, -3.824833, 1, 0, 0, 1, 1,
-0.3606144, -0.2153772, 0.9166852, 1, 0, 0, 1, 1,
-0.3598391, 1.128551, -1.990182, 1, 0, 0, 1, 1,
-0.3588972, -0.5538684, -0.2297806, 1, 0, 0, 1, 1,
-0.3553549, -0.9613711, -2.738317, 0, 0, 0, 1, 1,
-0.3515925, -0.5162327, -3.000619, 0, 0, 0, 1, 1,
-0.3352858, 0.3244784, 0.3019251, 0, 0, 0, 1, 1,
-0.3232578, -0.8280174, -1.811404, 0, 0, 0, 1, 1,
-0.3224466, 1.301976, 1.002055, 0, 0, 0, 1, 1,
-0.3214731, -0.7505699, -3.341822, 0, 0, 0, 1, 1,
-0.3170373, -1.642592, -1.382248, 0, 0, 0, 1, 1,
-0.3143475, 1.065134, -0.7165564, 1, 1, 1, 1, 1,
-0.3122234, 0.1548328, 0.4058748, 1, 1, 1, 1, 1,
-0.3087556, -0.4668097, -3.845132, 1, 1, 1, 1, 1,
-0.305217, -0.4197216, -2.535375, 1, 1, 1, 1, 1,
-0.3035984, -0.6068674, -2.169684, 1, 1, 1, 1, 1,
-0.3020931, 0.1456169, -1.820546, 1, 1, 1, 1, 1,
-0.3011481, -0.8781968, -4.284403, 1, 1, 1, 1, 1,
-0.2997435, -1.257553, -2.444491, 1, 1, 1, 1, 1,
-0.2962928, 0.7573376, 0.7478448, 1, 1, 1, 1, 1,
-0.2912099, -1.060791, -1.627589, 1, 1, 1, 1, 1,
-0.2897508, -0.6733042, -1.714977, 1, 1, 1, 1, 1,
-0.2881978, -0.2094346, -1.638109, 1, 1, 1, 1, 1,
-0.2872215, 0.9747972, -0.4332788, 1, 1, 1, 1, 1,
-0.2830257, -0.0233189, -3.448398, 1, 1, 1, 1, 1,
-0.2819984, -0.8392468, -3.45531, 1, 1, 1, 1, 1,
-0.2809072, 0.7984277, 0.4317481, 0, 0, 1, 1, 1,
-0.2619557, -2.135231, -4.71121, 1, 0, 0, 1, 1,
-0.2581553, -0.120664, -3.603895, 1, 0, 0, 1, 1,
-0.2565208, -1.040437, -1.32183, 1, 0, 0, 1, 1,
-0.2545203, -2.119242, -3.288164, 1, 0, 0, 1, 1,
-0.2483118, 1.913947, 1.554158, 1, 0, 0, 1, 1,
-0.2464358, 1.316087, 0.1146072, 0, 0, 0, 1, 1,
-0.2370354, 0.8280377, -1.767778, 0, 0, 0, 1, 1,
-0.2310948, 0.03352549, -1.669327, 0, 0, 0, 1, 1,
-0.225539, 1.012675, -1.096447, 0, 0, 0, 1, 1,
-0.2212621, 0.3850659, -0.8426633, 0, 0, 0, 1, 1,
-0.2158757, 1.534105, -0.6942604, 0, 0, 0, 1, 1,
-0.2156748, 0.4136287, -0.08369019, 0, 0, 0, 1, 1,
-0.2110332, 1.080101, -0.1128608, 1, 1, 1, 1, 1,
-0.2087263, -0.2078267, -1.311397, 1, 1, 1, 1, 1,
-0.2034059, 0.591892, 0.555064, 1, 1, 1, 1, 1,
-0.2027536, 0.6310751, 0.1319883, 1, 1, 1, 1, 1,
-0.2015582, -0.2697972, -2.530016, 1, 1, 1, 1, 1,
-0.2008857, 0.7277862, 0.3895909, 1, 1, 1, 1, 1,
-0.2008121, -0.0367795, -0.1985243, 1, 1, 1, 1, 1,
-0.2004487, -0.9542444, -2.630249, 1, 1, 1, 1, 1,
-0.1997639, 0.2622968, 1.808425, 1, 1, 1, 1, 1,
-0.1968139, 1.776649, 0.2871012, 1, 1, 1, 1, 1,
-0.1935184, 0.1620813, -0.02402041, 1, 1, 1, 1, 1,
-0.1907625, -0.4602437, -2.592745, 1, 1, 1, 1, 1,
-0.1901433, -3.003435, -2.465883, 1, 1, 1, 1, 1,
-0.1837578, 0.121917, -2.432215, 1, 1, 1, 1, 1,
-0.1797505, -1.831817, -1.891472, 1, 1, 1, 1, 1,
-0.1771212, 0.005653805, -2.617677, 0, 0, 1, 1, 1,
-0.1770768, 1.774335, 0.3152103, 1, 0, 0, 1, 1,
-0.1742096, -0.03225835, -0.5147063, 1, 0, 0, 1, 1,
-0.1736386, 0.337694, 0.4600188, 1, 0, 0, 1, 1,
-0.172383, -0.0705898, 0.9746383, 1, 0, 0, 1, 1,
-0.1712863, -1.683717, -1.200644, 1, 0, 0, 1, 1,
-0.1687785, 2.81559, -0.6279941, 0, 0, 0, 1, 1,
-0.1670478, 0.1763813, -0.1148034, 0, 0, 0, 1, 1,
-0.1642793, -1.110956, -4.532508, 0, 0, 0, 1, 1,
-0.1567731, -2.142218, -2.442343, 0, 0, 0, 1, 1,
-0.1496023, -1.488293, -2.471373, 0, 0, 0, 1, 1,
-0.149556, -0.0826451, -2.066138, 0, 0, 0, 1, 1,
-0.1446882, -0.8517841, -1.629335, 0, 0, 0, 1, 1,
-0.1431534, -1.636047, -3.062985, 1, 1, 1, 1, 1,
-0.1413438, -0.869966, -5.099838, 1, 1, 1, 1, 1,
-0.1360515, -0.3600125, -1.209992, 1, 1, 1, 1, 1,
-0.1343311, 0.02833182, -0.3803441, 1, 1, 1, 1, 1,
-0.1337839, 0.3946929, -0.1743645, 1, 1, 1, 1, 1,
-0.1335097, -0.03087312, -2.200997, 1, 1, 1, 1, 1,
-0.1304176, 0.04299771, -1.758244, 1, 1, 1, 1, 1,
-0.1278268, 0.8421863, -0.6849618, 1, 1, 1, 1, 1,
-0.1249133, -0.3528104, -0.4373596, 1, 1, 1, 1, 1,
-0.1228109, -1.494834, -4.015306, 1, 1, 1, 1, 1,
-0.1224864, -1.370613, -3.479078, 1, 1, 1, 1, 1,
-0.1218104, -1.391682, -3.649535, 1, 1, 1, 1, 1,
-0.1215995, 0.829278, -0.6626349, 1, 1, 1, 1, 1,
-0.1181211, -1.719075, -3.870502, 1, 1, 1, 1, 1,
-0.1168866, -1.020451, -3.057581, 1, 1, 1, 1, 1,
-0.1148657, 1.930642, -0.2178591, 0, 0, 1, 1, 1,
-0.1109478, -2.400042, -2.795393, 1, 0, 0, 1, 1,
-0.1098437, -0.3098097, -0.2200134, 1, 0, 0, 1, 1,
-0.1077435, -0.1772443, -1.878471, 1, 0, 0, 1, 1,
-0.1036717, 1.640809, 0.7093307, 1, 0, 0, 1, 1,
-0.1027366, -1.359438, -3.725262, 1, 0, 0, 1, 1,
-0.09440538, 0.5477369, 1.621318, 0, 0, 0, 1, 1,
-0.09177887, 2.143596, 0.1205198, 0, 0, 0, 1, 1,
-0.08322504, 0.5366931, -1.579409, 0, 0, 0, 1, 1,
-0.07884892, 0.5219578, -1.101428, 0, 0, 0, 1, 1,
-0.07456494, -1.146292, -4.902586, 0, 0, 0, 1, 1,
-0.07233035, -2.557129, -3.360263, 0, 0, 0, 1, 1,
-0.07145122, 0.904564, 0.4413852, 0, 0, 0, 1, 1,
-0.07113735, -0.06037815, -2.937381, 1, 1, 1, 1, 1,
-0.07103549, 0.5385187, 0.8954486, 1, 1, 1, 1, 1,
-0.07098018, 0.5616412, -0.2918917, 1, 1, 1, 1, 1,
-0.07011263, 0.1209116, 0.03274005, 1, 1, 1, 1, 1,
-0.06856184, -0.768155, -4.424246, 1, 1, 1, 1, 1,
-0.0658579, 0.7979305, 2.167771, 1, 1, 1, 1, 1,
-0.06530693, 0.06436169, -0.2367433, 1, 1, 1, 1, 1,
-0.06218291, 0.34505, -0.6136126, 1, 1, 1, 1, 1,
-0.0565461, -0.6847128, -2.655625, 1, 1, 1, 1, 1,
-0.04935623, -0.03575696, -3.445884, 1, 1, 1, 1, 1,
-0.04694511, -0.2771042, -1.436821, 1, 1, 1, 1, 1,
-0.04269676, 1.479931, -0.1523238, 1, 1, 1, 1, 1,
-0.04204427, 0.6227009, -0.2555566, 1, 1, 1, 1, 1,
-0.03910949, 0.8920097, 0.4338687, 1, 1, 1, 1, 1,
-0.03804514, -0.00211198, -1.750403, 1, 1, 1, 1, 1,
-0.03802538, 2.654377, -0.6023464, 0, 0, 1, 1, 1,
-0.03304877, -1.183481, -3.28743, 1, 0, 0, 1, 1,
-0.03147784, -0.6083933, -3.531491, 1, 0, 0, 1, 1,
-0.0282709, -1.142858, -4.017549, 1, 0, 0, 1, 1,
-0.0276869, -0.8321063, -3.052243, 1, 0, 0, 1, 1,
-0.02460206, 0.07585321, -1.725291, 1, 0, 0, 1, 1,
-0.01487039, 0.5556169, 0.8132141, 0, 0, 0, 1, 1,
-0.0120214, -0.9076096, -3.401374, 0, 0, 0, 1, 1,
-0.01029357, -0.4339067, -4.273867, 0, 0, 0, 1, 1,
-0.004244173, 0.2969677, 0.1963812, 0, 0, 0, 1, 1,
-0.003966026, -1.742634, -2.872248, 0, 0, 0, 1, 1,
-0.0001713859, -0.08001486, -3.20767, 0, 0, 0, 1, 1,
0.0009214561, 0.4617346, 1.38341, 0, 0, 0, 1, 1,
0.002561882, -0.2768562, 3.716577, 1, 1, 1, 1, 1,
0.007241031, -0.6891346, 3.588172, 1, 1, 1, 1, 1,
0.007972697, -0.1581718, 4.722361, 1, 1, 1, 1, 1,
0.01033351, 0.4309971, 0.2906914, 1, 1, 1, 1, 1,
0.01479107, 0.7466322, 0.9037511, 1, 1, 1, 1, 1,
0.02439963, -1.70288, 2.579074, 1, 1, 1, 1, 1,
0.02644746, 1.074823, 0.03833622, 1, 1, 1, 1, 1,
0.02831537, -1.592628, 3.513973, 1, 1, 1, 1, 1,
0.03087868, -1.486515, 2.083776, 1, 1, 1, 1, 1,
0.03338982, -0.7262126, 2.961058, 1, 1, 1, 1, 1,
0.03430835, 1.54246, 0.4370871, 1, 1, 1, 1, 1,
0.03560591, 0.06115151, -0.7270769, 1, 1, 1, 1, 1,
0.03743013, 1.510432, -3.095824, 1, 1, 1, 1, 1,
0.04052616, -1.330824, 4.000751, 1, 1, 1, 1, 1,
0.04130313, -0.1143753, 2.453912, 1, 1, 1, 1, 1,
0.04430141, -0.05495631, 2.63944, 0, 0, 1, 1, 1,
0.04439544, -1.178616, 3.142906, 1, 0, 0, 1, 1,
0.04468962, 0.001148199, 1.382751, 1, 0, 0, 1, 1,
0.04522908, -0.6274516, 5.354339, 1, 0, 0, 1, 1,
0.04695945, 0.3882554, -0.4406338, 1, 0, 0, 1, 1,
0.04948878, -0.7176213, 3.318021, 1, 0, 0, 1, 1,
0.05082072, 0.3604107, 1.357171, 0, 0, 0, 1, 1,
0.05463437, 0.1923647, -1.72938, 0, 0, 0, 1, 1,
0.05563625, -1.282279, 4.910219, 0, 0, 0, 1, 1,
0.05774068, -0.9497725, 2.550108, 0, 0, 0, 1, 1,
0.06099122, -1.266997, 3.19405, 0, 0, 0, 1, 1,
0.06129437, -0.5505112, 3.81105, 0, 0, 0, 1, 1,
0.06139133, -0.03756525, 0.7984338, 0, 0, 0, 1, 1,
0.06243044, -1.357489, 2.759545, 1, 1, 1, 1, 1,
0.06844582, 0.7890681, 0.4391748, 1, 1, 1, 1, 1,
0.06939758, 0.9723645, -1.085577, 1, 1, 1, 1, 1,
0.06960192, 0.7345427, -0.7056345, 1, 1, 1, 1, 1,
0.07002461, 1.229263, -0.6080848, 1, 1, 1, 1, 1,
0.07039244, -1.248752, 3.735086, 1, 1, 1, 1, 1,
0.07206233, 0.6533424, 2.351295, 1, 1, 1, 1, 1,
0.08226939, -0.2439698, 3.20618, 1, 1, 1, 1, 1,
0.08671134, -0.499828, 2.582221, 1, 1, 1, 1, 1,
0.08717214, 0.2065219, 2.519314, 1, 1, 1, 1, 1,
0.08992476, -1.798098, 3.249393, 1, 1, 1, 1, 1,
0.09174751, -0.3565298, 4.095005, 1, 1, 1, 1, 1,
0.09247347, -0.2552378, 4.124957, 1, 1, 1, 1, 1,
0.09372061, -0.2067314, 2.172777, 1, 1, 1, 1, 1,
0.09437995, 0.6456723, -0.8761193, 1, 1, 1, 1, 1,
0.09538139, -1.472718, 1.981355, 0, 0, 1, 1, 1,
0.09908331, -1.628981, 2.015305, 1, 0, 0, 1, 1,
0.1068734, 0.3860331, 1.130172, 1, 0, 0, 1, 1,
0.1073402, -0.7748808, 2.52508, 1, 0, 0, 1, 1,
0.1170344, -1.25202, 1.548489, 1, 0, 0, 1, 1,
0.1194424, 0.154318, -0.006145762, 1, 0, 0, 1, 1,
0.1195496, -0.859112, 3.364391, 0, 0, 0, 1, 1,
0.1226564, -0.8363107, 3.061977, 0, 0, 0, 1, 1,
0.1334198, 0.8741007, -0.9751254, 0, 0, 0, 1, 1,
0.1356218, 0.5568749, 1.230001, 0, 0, 0, 1, 1,
0.1375829, -0.1753918, 2.177943, 0, 0, 0, 1, 1,
0.1385181, 1.922609, -0.8128139, 0, 0, 0, 1, 1,
0.13984, -0.02573727, 2.097939, 0, 0, 0, 1, 1,
0.1446104, -2.173113, 3.043256, 1, 1, 1, 1, 1,
0.1483798, 0.9706335, 1.902366, 1, 1, 1, 1, 1,
0.1494046, -0.2555384, 2.468059, 1, 1, 1, 1, 1,
0.1513604, -0.5108622, 3.623062, 1, 1, 1, 1, 1,
0.1519653, -0.7702875, 1.875943, 1, 1, 1, 1, 1,
0.1571074, 1.331507, 0.7311745, 1, 1, 1, 1, 1,
0.1581514, 0.6803794, 0.394607, 1, 1, 1, 1, 1,
0.1595479, 0.481931, -0.1108118, 1, 1, 1, 1, 1,
0.1598289, -1.994525, 4.215523, 1, 1, 1, 1, 1,
0.1634622, -0.4772587, 4.34203, 1, 1, 1, 1, 1,
0.1661928, -0.2967427, 3.562864, 1, 1, 1, 1, 1,
0.167062, -0.5713657, 3.99782, 1, 1, 1, 1, 1,
0.1674336, -0.6143574, 1.948643, 1, 1, 1, 1, 1,
0.174851, -0.8926695, 3.810657, 1, 1, 1, 1, 1,
0.1771751, 0.01305449, 0.8523758, 1, 1, 1, 1, 1,
0.1773998, 0.1592707, 0.1532435, 0, 0, 1, 1, 1,
0.1799128, 1.127308, -2.322047, 1, 0, 0, 1, 1,
0.1902893, -0.4494881, 0.3848788, 1, 0, 0, 1, 1,
0.1905826, 0.5230293, 1.999836, 1, 0, 0, 1, 1,
0.1929165, 0.8583919, -0.9982688, 1, 0, 0, 1, 1,
0.1939018, 0.9061627, -0.1981312, 1, 0, 0, 1, 1,
0.1944823, 2.238148, 0.8787851, 0, 0, 0, 1, 1,
0.1968474, 1.609721, 0.4670251, 0, 0, 0, 1, 1,
0.2008041, 0.9881847, 1.70795, 0, 0, 0, 1, 1,
0.2021021, 1.009658, 0.5240692, 0, 0, 0, 1, 1,
0.2089462, -1.245301, 1.810338, 0, 0, 0, 1, 1,
0.2089841, 2.250056, -0.4081544, 0, 0, 0, 1, 1,
0.2164341, 0.2602306, 1.042793, 0, 0, 0, 1, 1,
0.2166696, -1.470605, 1.72919, 1, 1, 1, 1, 1,
0.2167414, -0.2459021, 3.275593, 1, 1, 1, 1, 1,
0.2171735, 0.1903235, 1.945604, 1, 1, 1, 1, 1,
0.2173039, -1.375344, 3.479645, 1, 1, 1, 1, 1,
0.2181609, -0.250836, 2.346452, 1, 1, 1, 1, 1,
0.219271, -0.4699111, 2.528959, 1, 1, 1, 1, 1,
0.2202225, 1.978678, 0.2669727, 1, 1, 1, 1, 1,
0.2207801, -0.4573037, 2.825923, 1, 1, 1, 1, 1,
0.2246085, 0.3794658, -0.2828464, 1, 1, 1, 1, 1,
0.2247435, -1.156867, 2.928953, 1, 1, 1, 1, 1,
0.225885, 1.451703, -1.520319, 1, 1, 1, 1, 1,
0.2259263, -0.3307695, 0.09966259, 1, 1, 1, 1, 1,
0.2326084, -1.469673, 2.415441, 1, 1, 1, 1, 1,
0.2332192, -1.382058, 3.04758, 1, 1, 1, 1, 1,
0.2353391, -0.2748806, 3.017797, 1, 1, 1, 1, 1,
0.235971, -0.6869895, 2.008476, 0, 0, 1, 1, 1,
0.2364126, -1.839244, 3.946843, 1, 0, 0, 1, 1,
0.2393945, -1.296316, 2.364271, 1, 0, 0, 1, 1,
0.2424937, -0.06103086, 2.858023, 1, 0, 0, 1, 1,
0.2436474, -0.9202902, 4.501629, 1, 0, 0, 1, 1,
0.2448671, 0.4517277, 0.2615981, 1, 0, 0, 1, 1,
0.2449138, 2.054206, -0.5352088, 0, 0, 0, 1, 1,
0.2462342, -0.8271586, 2.019833, 0, 0, 0, 1, 1,
0.2503105, 2.031905, 0.8892114, 0, 0, 0, 1, 1,
0.2550156, -0.1899507, 2.799241, 0, 0, 0, 1, 1,
0.2568223, -0.1857071, 4.003635, 0, 0, 0, 1, 1,
0.258789, 0.3671182, 0.5722266, 0, 0, 0, 1, 1,
0.2595859, -1.657984, 3.781608, 0, 0, 0, 1, 1,
0.2597421, 1.092131, 1.399534, 1, 1, 1, 1, 1,
0.2605042, 0.1363907, 1.817685, 1, 1, 1, 1, 1,
0.2693084, -1.063024, 2.413477, 1, 1, 1, 1, 1,
0.2719328, -0.8104222, 4.341955, 1, 1, 1, 1, 1,
0.2727982, 1.288308, 0.472778, 1, 1, 1, 1, 1,
0.2761373, 0.2150505, 2.903717, 1, 1, 1, 1, 1,
0.279945, 0.2393166, 0.2458446, 1, 1, 1, 1, 1,
0.2820955, -0.7520517, 1.325113, 1, 1, 1, 1, 1,
0.2842197, 1.079179, 0.04242491, 1, 1, 1, 1, 1,
0.2854491, -2.167482, 1.396342, 1, 1, 1, 1, 1,
0.2856828, 1.019989, 0.8503842, 1, 1, 1, 1, 1,
0.293824, -0.546789, 5.04213, 1, 1, 1, 1, 1,
0.2943846, 0.2134989, 0.7488847, 1, 1, 1, 1, 1,
0.294873, 1.085279, 1.778023, 1, 1, 1, 1, 1,
0.2974014, 0.7578028, 0.5183067, 1, 1, 1, 1, 1,
0.3085787, 0.1456552, 0.6463827, 0, 0, 1, 1, 1,
0.3091102, -0.02321637, 1.373297, 1, 0, 0, 1, 1,
0.3121388, -0.4326718, 1.995128, 1, 0, 0, 1, 1,
0.3130344, 0.0777005, 0.9379727, 1, 0, 0, 1, 1,
0.3132768, -0.5289786, 2.353184, 1, 0, 0, 1, 1,
0.3225678, 0.2858076, 0.02479859, 1, 0, 0, 1, 1,
0.3255843, -0.444257, 2.272385, 0, 0, 0, 1, 1,
0.3313203, -1.408357, 3.364599, 0, 0, 0, 1, 1,
0.3351078, 0.08410127, 1.032909, 0, 0, 0, 1, 1,
0.3379146, -0.481532, 1.457607, 0, 0, 0, 1, 1,
0.3397559, 0.8418244, -0.3108815, 0, 0, 0, 1, 1,
0.3467784, -0.5633706, 1.272594, 0, 0, 0, 1, 1,
0.3504155, 0.02650709, 1.565635, 0, 0, 0, 1, 1,
0.3528504, 1.117146, -2.897941, 1, 1, 1, 1, 1,
0.3548713, -0.6799525, 1.214981, 1, 1, 1, 1, 1,
0.355192, -0.5701539, 1.620658, 1, 1, 1, 1, 1,
0.3637712, 0.5896527, 1.822179, 1, 1, 1, 1, 1,
0.3644884, 0.3161462, -0.3920828, 1, 1, 1, 1, 1,
0.36516, -1.616454, 1.942422, 1, 1, 1, 1, 1,
0.3706866, 0.620784, 0.3531605, 1, 1, 1, 1, 1,
0.3768855, 0.8149104, 2.510425, 1, 1, 1, 1, 1,
0.378028, 0.6853117, 0.7391093, 1, 1, 1, 1, 1,
0.3794429, -0.9348043, 3.730618, 1, 1, 1, 1, 1,
0.3833873, 0.226904, 1.771969, 1, 1, 1, 1, 1,
0.3846365, -1.286846, 4.242916, 1, 1, 1, 1, 1,
0.3891678, -0.06788168, 1.54689, 1, 1, 1, 1, 1,
0.3894266, 0.6174346, -0.7543813, 1, 1, 1, 1, 1,
0.3924576, 1.695368, 0.9620761, 1, 1, 1, 1, 1,
0.3955241, 0.48774, -1.569001, 0, 0, 1, 1, 1,
0.3974737, -0.6774002, 1.17817, 1, 0, 0, 1, 1,
0.397921, -0.6183861, 3.383259, 1, 0, 0, 1, 1,
0.3983116, -2.105216, 2.730793, 1, 0, 0, 1, 1,
0.4056931, 0.6437027, 1.643292, 1, 0, 0, 1, 1,
0.4073175, 1.091786, 0.3636542, 1, 0, 0, 1, 1,
0.4078517, -1.792193, 2.696702, 0, 0, 0, 1, 1,
0.4085509, -0.4979172, 0.9468269, 0, 0, 0, 1, 1,
0.4087867, 1.020611, 0.4779437, 0, 0, 0, 1, 1,
0.4100434, -0.1331873, 0.008683221, 0, 0, 0, 1, 1,
0.4105628, 0.5974316, 1.866551, 0, 0, 0, 1, 1,
0.4120057, -0.5904855, 2.019462, 0, 0, 0, 1, 1,
0.4134318, 0.9751366, 0.9557955, 0, 0, 0, 1, 1,
0.4135976, -0.3174882, 3.612286, 1, 1, 1, 1, 1,
0.4222369, -0.6937672, 2.429715, 1, 1, 1, 1, 1,
0.4287578, 1.022244, -0.1192599, 1, 1, 1, 1, 1,
0.4292755, 0.6349626, -0.1851556, 1, 1, 1, 1, 1,
0.4307726, -0.2987507, 2.196293, 1, 1, 1, 1, 1,
0.4325847, -0.3517925, 4.24611, 1, 1, 1, 1, 1,
0.4341888, -0.3784352, -0.5038981, 1, 1, 1, 1, 1,
0.4344611, -0.2697764, 2.057498, 1, 1, 1, 1, 1,
0.4363198, -0.3048644, 1.478911, 1, 1, 1, 1, 1,
0.4368749, 0.6979326, -0.9587734, 1, 1, 1, 1, 1,
0.4439244, -1.296501, 2.611732, 1, 1, 1, 1, 1,
0.4441013, 0.07899459, 1.641282, 1, 1, 1, 1, 1,
0.4446284, -1.038644, 1.980722, 1, 1, 1, 1, 1,
0.4453717, -0.6448468, 1.032502, 1, 1, 1, 1, 1,
0.4454875, -1.7471, 2.278603, 1, 1, 1, 1, 1,
0.445786, 1.315302, 0.1740681, 0, 0, 1, 1, 1,
0.4521413, -0.1193031, 1.839067, 1, 0, 0, 1, 1,
0.4535658, -0.2725956, 4.326519, 1, 0, 0, 1, 1,
0.4561445, -0.7350186, 4.095819, 1, 0, 0, 1, 1,
0.4605635, 1.264463, 0.1760931, 1, 0, 0, 1, 1,
0.4621447, 1.782101, 1.436176, 1, 0, 0, 1, 1,
0.4650871, -0.02137944, 0.6617707, 0, 0, 0, 1, 1,
0.4656264, 0.1453812, 2.282539, 0, 0, 0, 1, 1,
0.4665738, -0.3264064, 1.501454, 0, 0, 0, 1, 1,
0.4732268, -1.982178, 4.209194, 0, 0, 0, 1, 1,
0.4759153, 0.08956718, 3.385367, 0, 0, 0, 1, 1,
0.4773483, -2.066761, 3.687645, 0, 0, 0, 1, 1,
0.4776227, 0.9878944, -0.1908757, 0, 0, 0, 1, 1,
0.4789377, 0.9766265, 0.6691431, 1, 1, 1, 1, 1,
0.4832328, -0.597815, 4.858389, 1, 1, 1, 1, 1,
0.4882316, -1.524159, 0.9574931, 1, 1, 1, 1, 1,
0.4915254, 2.32392, -1.34474, 1, 1, 1, 1, 1,
0.5025052, 1.428298, 0.1067344, 1, 1, 1, 1, 1,
0.5127819, 0.3405459, 2.116631, 1, 1, 1, 1, 1,
0.5141596, -1.414055, 0.6222324, 1, 1, 1, 1, 1,
0.5142508, 0.504777, 2.502157, 1, 1, 1, 1, 1,
0.5152961, -0.3206793, 2.918635, 1, 1, 1, 1, 1,
0.5183418, 0.1727515, 1.261191, 1, 1, 1, 1, 1,
0.5229862, -1.418087, 3.040169, 1, 1, 1, 1, 1,
0.5231609, 0.8743455, 0.6068394, 1, 1, 1, 1, 1,
0.5330558, 0.2433529, 1.416653, 1, 1, 1, 1, 1,
0.5440379, -0.3641346, 2.204382, 1, 1, 1, 1, 1,
0.5440528, 0.5451216, -0.1327265, 1, 1, 1, 1, 1,
0.5487863, -0.6975968, 1.409214, 0, 0, 1, 1, 1,
0.5499366, 0.8443004, 0.4482559, 1, 0, 0, 1, 1,
0.5510505, 0.3008039, 0.9185942, 1, 0, 0, 1, 1,
0.5518568, 1.366051, 1.562751, 1, 0, 0, 1, 1,
0.5580465, 0.4582246, 1.709662, 1, 0, 0, 1, 1,
0.5583223, 0.643123, 1.203787, 1, 0, 0, 1, 1,
0.5601745, 0.3047211, -0.7002797, 0, 0, 0, 1, 1,
0.5612102, 1.11795, 2.622103, 0, 0, 0, 1, 1,
0.5612164, 0.1632423, 0.6287372, 0, 0, 0, 1, 1,
0.5657871, -1.049326, 4.324625, 0, 0, 0, 1, 1,
0.5674626, -0.4058426, 0.5134836, 0, 0, 0, 1, 1,
0.5677822, -1.115709, 4.599611, 0, 0, 0, 1, 1,
0.5678339, 1.710926, 0.2380315, 0, 0, 0, 1, 1,
0.5710463, -0.2545541, 1.663479, 1, 1, 1, 1, 1,
0.5717127, -1.022588, 3.010719, 1, 1, 1, 1, 1,
0.5733231, 0.03355652, 1.472305, 1, 1, 1, 1, 1,
0.5743972, -0.9379944, 2.256241, 1, 1, 1, 1, 1,
0.5778367, -2.75974, 2.915109, 1, 1, 1, 1, 1,
0.580893, -1.581523, 3.883061, 1, 1, 1, 1, 1,
0.5845755, 0.5077446, 2.611735, 1, 1, 1, 1, 1,
0.5869947, 0.8817546, -0.2051153, 1, 1, 1, 1, 1,
0.5888302, 0.4148973, -0.9897159, 1, 1, 1, 1, 1,
0.5900156, 1.854475, 1.371514, 1, 1, 1, 1, 1,
0.590054, 0.9595577, 1.567603, 1, 1, 1, 1, 1,
0.5907976, -0.7476532, 0.5910519, 1, 1, 1, 1, 1,
0.610378, 0.3262157, 0.9062304, 1, 1, 1, 1, 1,
0.61261, 0.09619293, 0.8095959, 1, 1, 1, 1, 1,
0.6146752, 1.695006, 1.060076, 1, 1, 1, 1, 1,
0.6179703, 1.00986, 1.50787, 0, 0, 1, 1, 1,
0.6212471, -1.152284, 2.921064, 1, 0, 0, 1, 1,
0.6318275, 0.334598, 1.561671, 1, 0, 0, 1, 1,
0.6334448, 0.2486597, 1.20918, 1, 0, 0, 1, 1,
0.6341941, 0.3040016, -0.3156192, 1, 0, 0, 1, 1,
0.640063, -1.436637, 1.857521, 1, 0, 0, 1, 1,
0.645013, 1.669474, -0.3458117, 0, 0, 0, 1, 1,
0.6474211, 0.442328, 0.2445524, 0, 0, 0, 1, 1,
0.650422, -1.814733, 2.957754, 0, 0, 0, 1, 1,
0.6518998, 1.409583, 1.636034, 0, 0, 0, 1, 1,
0.6527035, 0.1039573, 1.135201, 0, 0, 0, 1, 1,
0.6649718, 0.3538963, -0.55094, 0, 0, 0, 1, 1,
0.666954, 1.14485, -0.6541162, 0, 0, 0, 1, 1,
0.6697075, 0.537918, -0.4540426, 1, 1, 1, 1, 1,
0.6710054, 1.543855, 1.398256, 1, 1, 1, 1, 1,
0.6710999, 1.27577, 1.068116, 1, 1, 1, 1, 1,
0.6728289, 0.1756395, 1.123815, 1, 1, 1, 1, 1,
0.6911852, -1.171944, 2.593948, 1, 1, 1, 1, 1,
0.6951275, 0.5192505, 0.5170762, 1, 1, 1, 1, 1,
0.6987015, -1.73386, 4.724791, 1, 1, 1, 1, 1,
0.6991882, -0.4949505, 0.1604778, 1, 1, 1, 1, 1,
0.6993406, 0.8351427, 0.2674645, 1, 1, 1, 1, 1,
0.6997889, 0.2971751, 0.7170881, 1, 1, 1, 1, 1,
0.7087887, 0.9497635, 1.325631, 1, 1, 1, 1, 1,
0.7120356, 1.334842, 1.603057, 1, 1, 1, 1, 1,
0.7126396, -1.498104, 2.212097, 1, 1, 1, 1, 1,
0.7132535, 1.770492, 1.246629, 1, 1, 1, 1, 1,
0.7186183, 0.09046651, -0.09046441, 1, 1, 1, 1, 1,
0.7267881, -1.084769, 2.112011, 0, 0, 1, 1, 1,
0.7273249, -0.1503496, 2.893945, 1, 0, 0, 1, 1,
0.7286126, 0.08717651, 1.169739, 1, 0, 0, 1, 1,
0.7304963, -0.3360237, 2.62585, 1, 0, 0, 1, 1,
0.736549, 0.622591, 0.101928, 1, 0, 0, 1, 1,
0.7381901, -1.540871, 0.3300559, 1, 0, 0, 1, 1,
0.7446029, 0.4877435, 1.665949, 0, 0, 0, 1, 1,
0.7464162, -1.831056, 3.27626, 0, 0, 0, 1, 1,
0.7464208, 0.04435932, 2.293939, 0, 0, 0, 1, 1,
0.7473197, -1.227801, 2.819031, 0, 0, 0, 1, 1,
0.7514424, 0.5187951, 2.273896, 0, 0, 0, 1, 1,
0.7518175, -1.824582, 2.456097, 0, 0, 0, 1, 1,
0.7529998, -0.07670272, 2.450633, 0, 0, 0, 1, 1,
0.7531525, 0.5975584, -0.03276826, 1, 1, 1, 1, 1,
0.7537795, -0.3785598, 3.127277, 1, 1, 1, 1, 1,
0.7614316, -0.1856554, 1.619847, 1, 1, 1, 1, 1,
0.7628144, -0.6187122, 1.745075, 1, 1, 1, 1, 1,
0.7663966, -1.168897, 2.474228, 1, 1, 1, 1, 1,
0.7672709, 0.2648148, 1.863066, 1, 1, 1, 1, 1,
0.7708026, -1.478474, 3.037841, 1, 1, 1, 1, 1,
0.7721288, 1.66548, 0.6024715, 1, 1, 1, 1, 1,
0.7885253, -0.5690174, 1.300904, 1, 1, 1, 1, 1,
0.7899166, 0.2387036, 2.888361, 1, 1, 1, 1, 1,
0.8006523, -0.5889152, 3.537222, 1, 1, 1, 1, 1,
0.8013707, -1.49494, 1.938118, 1, 1, 1, 1, 1,
0.8053395, -1.395295, 3.258173, 1, 1, 1, 1, 1,
0.8060573, 1.100942, -0.1439748, 1, 1, 1, 1, 1,
0.8080936, -0.8256218, 1.396704, 1, 1, 1, 1, 1,
0.8213281, 1.049771, 2.331665, 0, 0, 1, 1, 1,
0.8244074, 0.765524, 1.689618, 1, 0, 0, 1, 1,
0.8253695, -0.1046948, 1.766358, 1, 0, 0, 1, 1,
0.8325374, -2.325261, 4.406884, 1, 0, 0, 1, 1,
0.8342411, 3.013774, 1.93132, 1, 0, 0, 1, 1,
0.8358267, 0.5610249, 2.880349, 1, 0, 0, 1, 1,
0.8428122, -0.3770175, 2.466193, 0, 0, 0, 1, 1,
0.8501391, 0.413621, 1.138767, 0, 0, 0, 1, 1,
0.8572592, -0.1806601, 1.102795, 0, 0, 0, 1, 1,
0.8576052, -1.044693, 3.17259, 0, 0, 0, 1, 1,
0.8600588, 0.6717634, -0.5418501, 0, 0, 0, 1, 1,
0.8632739, -0.967668, 3.557858, 0, 0, 0, 1, 1,
0.8655818, -0.8075264, 2.763756, 0, 0, 0, 1, 1,
0.8680805, 0.1193987, 0.1075064, 1, 1, 1, 1, 1,
0.8712234, -0.7283089, 1.437841, 1, 1, 1, 1, 1,
0.8729081, -0.5820529, 3.651519, 1, 1, 1, 1, 1,
0.8735795, 0.2943965, 0.4883116, 1, 1, 1, 1, 1,
0.8767487, 0.4110769, -0.00915157, 1, 1, 1, 1, 1,
0.8775066, -1.412929, 2.59023, 1, 1, 1, 1, 1,
0.8780628, -1.050058, 2.020157, 1, 1, 1, 1, 1,
0.8812807, 0.6466708, 1.22266, 1, 1, 1, 1, 1,
0.8818541, 0.3441133, 1.490911, 1, 1, 1, 1, 1,
0.8826578, 1.094123, 0.5731546, 1, 1, 1, 1, 1,
0.8860862, 0.4885688, 0.8713296, 1, 1, 1, 1, 1,
0.8864602, 1.816736, 0.6506646, 1, 1, 1, 1, 1,
0.8872016, -0.2963467, 2.123693, 1, 1, 1, 1, 1,
0.8897122, 0.9055876, 1.573078, 1, 1, 1, 1, 1,
0.8897337, 1.560775, -0.3366247, 1, 1, 1, 1, 1,
0.8931754, 1.01778, 0.2029826, 0, 0, 1, 1, 1,
0.8936968, 1.240386, 0.8031027, 1, 0, 0, 1, 1,
0.895835, -0.8238075, 2.611152, 1, 0, 0, 1, 1,
0.8977027, -0.3821821, 0.5481317, 1, 0, 0, 1, 1,
0.9000846, -0.005861023, 0.5344158, 1, 0, 0, 1, 1,
0.901144, -0.5965902, -0.1162237, 1, 0, 0, 1, 1,
0.905141, 0.9015671, 1.353312, 0, 0, 0, 1, 1,
0.905447, 0.3088582, 1.626626, 0, 0, 0, 1, 1,
0.9064503, -0.09725693, 2.865916, 0, 0, 0, 1, 1,
0.9116127, 1.247959, 0.4571328, 0, 0, 0, 1, 1,
0.9129709, 1.477361, 1.412017, 0, 0, 0, 1, 1,
0.9152282, -0.1949155, 1.95161, 0, 0, 0, 1, 1,
0.9171694, 0.9318939, 0.6874148, 0, 0, 0, 1, 1,
0.9227967, 0.1457994, 1.492622, 1, 1, 1, 1, 1,
0.9249841, 0.0327646, 0.8467139, 1, 1, 1, 1, 1,
0.9285138, -0.2419774, 3.482952, 1, 1, 1, 1, 1,
0.9446442, -0.2340791, 1.952827, 1, 1, 1, 1, 1,
0.9513549, 0.506607, 2.203707, 1, 1, 1, 1, 1,
0.9514308, 0.9653478, 0.6835296, 1, 1, 1, 1, 1,
0.9533336, -1.664115, 2.457429, 1, 1, 1, 1, 1,
0.9592084, -2.09346, 4.190156, 1, 1, 1, 1, 1,
0.9603284, 1.033694, 0.2369077, 1, 1, 1, 1, 1,
0.9624271, 0.4715193, -0.3217064, 1, 1, 1, 1, 1,
0.9631838, -0.9031648, 3.066647, 1, 1, 1, 1, 1,
0.9632254, -0.05434434, 2.059828, 1, 1, 1, 1, 1,
0.963762, -0.40047, 3.753525, 1, 1, 1, 1, 1,
0.9649606, -0.2997626, 3.057826, 1, 1, 1, 1, 1,
0.9653968, 1.127026, -0.1287685, 1, 1, 1, 1, 1,
0.9672881, 1.352208, -0.2058409, 0, 0, 1, 1, 1,
0.9694346, -0.8108514, 3.768507, 1, 0, 0, 1, 1,
0.9750221, 0.7052822, -0.2250187, 1, 0, 0, 1, 1,
0.9777071, -1.538188, 2.397126, 1, 0, 0, 1, 1,
0.9803746, 1.077515, -0.3092464, 1, 0, 0, 1, 1,
0.9805812, -0.4587788, 1.442058, 1, 0, 0, 1, 1,
0.9806591, 2.210669, 1.992129, 0, 0, 0, 1, 1,
0.9842007, -0.290157, 3.07922, 0, 0, 0, 1, 1,
0.987253, -0.2871948, 2.689283, 0, 0, 0, 1, 1,
0.9974391, -0.771445, 2.574456, 0, 0, 0, 1, 1,
0.998092, 1.062727, 1.137323, 0, 0, 0, 1, 1,
0.9983121, 1.88909, 0.5892943, 0, 0, 0, 1, 1,
0.999659, -0.8291772, 2.359089, 0, 0, 0, 1, 1,
1.001013, -2.038877, 3.393697, 1, 1, 1, 1, 1,
1.003932, 0.3175963, -0.1652338, 1, 1, 1, 1, 1,
1.006358, -1.463741, 1.813328, 1, 1, 1, 1, 1,
1.01541, 1.27947, 0.9465529, 1, 1, 1, 1, 1,
1.019154, -0.5010796, 2.202125, 1, 1, 1, 1, 1,
1.026736, 1.183226, -1.047671, 1, 1, 1, 1, 1,
1.027826, 0.676349, -0.224136, 1, 1, 1, 1, 1,
1.033171, -1.47138, 2.067082, 1, 1, 1, 1, 1,
1.035919, -2.39089, 2.832253, 1, 1, 1, 1, 1,
1.03767, 1.198221, 1.149565, 1, 1, 1, 1, 1,
1.039949, -1.359917, 3.285652, 1, 1, 1, 1, 1,
1.051144, -1.059854, 1.171178, 1, 1, 1, 1, 1,
1.053146, 0.9080504, -0.6111642, 1, 1, 1, 1, 1,
1.055768, 0.6421806, 2.118495, 1, 1, 1, 1, 1,
1.057256, -1.338659, 2.759016, 1, 1, 1, 1, 1,
1.064457, -0.7940174, -0.2321007, 0, 0, 1, 1, 1,
1.068902, 0.6026657, 1.550107, 1, 0, 0, 1, 1,
1.068998, -1.312392, 1.10764, 1, 0, 0, 1, 1,
1.069122, 1.272461, 0.6602469, 1, 0, 0, 1, 1,
1.075468, 0.3146472, 1.245751, 1, 0, 0, 1, 1,
1.076277, -0.6720006, 0.8087136, 1, 0, 0, 1, 1,
1.077842, -1.25162, 3.566308, 0, 0, 0, 1, 1,
1.080302, 1.70508, -2.033108, 0, 0, 0, 1, 1,
1.080976, -0.1624207, 2.747202, 0, 0, 0, 1, 1,
1.082002, -0.4653158, 1.666164, 0, 0, 0, 1, 1,
1.093688, 1.607348, 1.178765, 0, 0, 0, 1, 1,
1.0959, -0.8655272, 2.776221, 0, 0, 0, 1, 1,
1.103981, 0.3949563, 1.727836, 0, 0, 0, 1, 1,
1.106869, -0.7286237, 2.889388, 1, 1, 1, 1, 1,
1.109981, -1.232085, 3.786258, 1, 1, 1, 1, 1,
1.118267, 0.8407513, -0.232405, 1, 1, 1, 1, 1,
1.120853, -0.2380839, 1.290294, 1, 1, 1, 1, 1,
1.121671, -1.706649, 3.467964, 1, 1, 1, 1, 1,
1.125814, 0.4548859, 2.119953, 1, 1, 1, 1, 1,
1.127567, 0.2399679, 0.06712303, 1, 1, 1, 1, 1,
1.128958, 1.113608, 1.326732, 1, 1, 1, 1, 1,
1.133029, -0.9177338, 1.706367, 1, 1, 1, 1, 1,
1.13542, 1.064929, -0.829904, 1, 1, 1, 1, 1,
1.13712, 0.1326903, 1.464833, 1, 1, 1, 1, 1,
1.14481, -0.5890394, 2.065231, 1, 1, 1, 1, 1,
1.148429, 0.1628388, 2.471661, 1, 1, 1, 1, 1,
1.152454, 1.366641, 1.109125, 1, 1, 1, 1, 1,
1.15636, 1.769898, 0.6686697, 1, 1, 1, 1, 1,
1.161294, 1.445032, 1.45253, 0, 0, 1, 1, 1,
1.162965, -0.4245188, 0.7631294, 1, 0, 0, 1, 1,
1.166566, -0.6760532, 3.387348, 1, 0, 0, 1, 1,
1.170887, -0.7734017, 1.128883, 1, 0, 0, 1, 1,
1.173207, 0.6253569, 1.995708, 1, 0, 0, 1, 1,
1.187467, -0.7981673, 2.153943, 1, 0, 0, 1, 1,
1.190094, -0.893881, 2.536016, 0, 0, 0, 1, 1,
1.207882, 1.510308, 0.8962328, 0, 0, 0, 1, 1,
1.212215, -1.138067, 2.567729, 0, 0, 0, 1, 1,
1.217571, 0.7161086, 1.784893, 0, 0, 0, 1, 1,
1.237638, -0.3124392, 2.193789, 0, 0, 0, 1, 1,
1.24071, 0.2619709, -0.8776351, 0, 0, 0, 1, 1,
1.24391, -0.0161452, 2.277932, 0, 0, 0, 1, 1,
1.24507, -0.6460181, 1.635736, 1, 1, 1, 1, 1,
1.25624, -1.097284, 2.674538, 1, 1, 1, 1, 1,
1.261268, -0.7316861, 2.64298, 1, 1, 1, 1, 1,
1.267969, -0.458221, 2.266282, 1, 1, 1, 1, 1,
1.27017, -0.5670578, 1.885662, 1, 1, 1, 1, 1,
1.27373, 0.9128516, 1.817903, 1, 1, 1, 1, 1,
1.274465, 0.06793986, 1.965619, 1, 1, 1, 1, 1,
1.285071, -0.6423897, 3.996264, 1, 1, 1, 1, 1,
1.309925, -1.255374, 0.3501969, 1, 1, 1, 1, 1,
1.310206, 0.7585243, 2.19745, 1, 1, 1, 1, 1,
1.321788, -0.2225488, 2.88291, 1, 1, 1, 1, 1,
1.322046, 1.437258, 1.31017, 1, 1, 1, 1, 1,
1.325926, -0.3507285, 1.033259, 1, 1, 1, 1, 1,
1.326834, 0.5739261, 0.7332684, 1, 1, 1, 1, 1,
1.330952, 0.5682599, 1.48401, 1, 1, 1, 1, 1,
1.338885, 1.435681, 1.41794, 0, 0, 1, 1, 1,
1.354592, -1.32004, 3.582463, 1, 0, 0, 1, 1,
1.356504, -1.44716, 2.418562, 1, 0, 0, 1, 1,
1.35915, -0.9393516, 2.996315, 1, 0, 0, 1, 1,
1.369086, 1.132558, -0.2636952, 1, 0, 0, 1, 1,
1.37248, 0.4726214, 2.823567, 1, 0, 0, 1, 1,
1.376043, -0.5532802, 1.903368, 0, 0, 0, 1, 1,
1.376481, 1.372861, 0.04738215, 0, 0, 0, 1, 1,
1.379945, 1.521998, 0.6451757, 0, 0, 0, 1, 1,
1.385741, -1.619939, 3.219647, 0, 0, 0, 1, 1,
1.386055, 0.8225831, 1.12044, 0, 0, 0, 1, 1,
1.389137, 1.732893, 0.5037377, 0, 0, 0, 1, 1,
1.396733, -0.4254149, 2.607102, 0, 0, 0, 1, 1,
1.403431, 1.15852, 0.9041984, 1, 1, 1, 1, 1,
1.407051, -0.7122666, 2.956571, 1, 1, 1, 1, 1,
1.408266, -0.1967965, 1.436859, 1, 1, 1, 1, 1,
1.40848, 1.807493, 0.2491982, 1, 1, 1, 1, 1,
1.410256, -0.9870566, 0.8383338, 1, 1, 1, 1, 1,
1.415466, 0.8391583, -0.8046884, 1, 1, 1, 1, 1,
1.416591, -0.7864126, 0.9728147, 1, 1, 1, 1, 1,
1.419109, 0.4780276, 2.649114, 1, 1, 1, 1, 1,
1.42176, 1.218864, 0.7241522, 1, 1, 1, 1, 1,
1.42315, -0.1786517, 3.108443, 1, 1, 1, 1, 1,
1.42591, -0.8031443, 0.3841532, 1, 1, 1, 1, 1,
1.433029, -0.1102094, 1.47107, 1, 1, 1, 1, 1,
1.434067, 0.07997291, 0.1876457, 1, 1, 1, 1, 1,
1.434749, -0.08101844, 2.135682, 1, 1, 1, 1, 1,
1.44279, -0.1189549, 1.694943, 1, 1, 1, 1, 1,
1.451261, 0.5852023, 1.499098, 0, 0, 1, 1, 1,
1.454617, 1.743579, 1.447754, 1, 0, 0, 1, 1,
1.457329, 0.487045, 0.8815886, 1, 0, 0, 1, 1,
1.457717, 1.976668, 1.251182, 1, 0, 0, 1, 1,
1.460077, 1.566717, -0.4796428, 1, 0, 0, 1, 1,
1.462153, -0.2825704, 0.5009513, 1, 0, 0, 1, 1,
1.464334, 0.01287543, 3.702102, 0, 0, 0, 1, 1,
1.468747, 0.9009616, 0.1593093, 0, 0, 0, 1, 1,
1.488842, -1.431608, 2.752744, 0, 0, 0, 1, 1,
1.497017, -1.929446, 2.043485, 0, 0, 0, 1, 1,
1.498712, 0.2635587, 0.963393, 0, 0, 0, 1, 1,
1.500685, -0.7455773, 1.823493, 0, 0, 0, 1, 1,
1.505371, -0.06702586, 0.3411718, 0, 0, 0, 1, 1,
1.50551, -0.08441504, 0.4688785, 1, 1, 1, 1, 1,
1.511889, 0.05277611, 1.469208, 1, 1, 1, 1, 1,
1.525629, 0.02441198, 0.7250295, 1, 1, 1, 1, 1,
1.527315, -1.00975, 3.071758, 1, 1, 1, 1, 1,
1.528069, -0.3806558, 4.527554, 1, 1, 1, 1, 1,
1.538108, -2.298251, 2.67461, 1, 1, 1, 1, 1,
1.545299, -1.627682, 2.698848, 1, 1, 1, 1, 1,
1.546382, -0.1278492, 3.293324, 1, 1, 1, 1, 1,
1.548433, 0.3355645, 2.17805, 1, 1, 1, 1, 1,
1.554131, 0.4917649, 1.658871, 1, 1, 1, 1, 1,
1.560152, 0.4337023, -0.0152856, 1, 1, 1, 1, 1,
1.560329, 0.2049584, 0.6345708, 1, 1, 1, 1, 1,
1.563806, -0.3477778, 0.8284483, 1, 1, 1, 1, 1,
1.573461, 0.878793, 0.04984752, 1, 1, 1, 1, 1,
1.596729, 1.382451, 1.034168, 1, 1, 1, 1, 1,
1.60717, -1.158176, 1.38616, 0, 0, 1, 1, 1,
1.609703, -2.238441, 1.341098, 1, 0, 0, 1, 1,
1.626969, -0.6610303, -0.5759195, 1, 0, 0, 1, 1,
1.655736, -1.540201, 1.432385, 1, 0, 0, 1, 1,
1.657211, 2.670676, -1.599017, 1, 0, 0, 1, 1,
1.664837, -0.1289001, 1.789861, 1, 0, 0, 1, 1,
1.672851, 1.55311, 0.3642755, 0, 0, 0, 1, 1,
1.701524, 0.534916, 1.514459, 0, 0, 0, 1, 1,
1.707132, 1.105294, 1.312339, 0, 0, 0, 1, 1,
1.709531, -0.9970117, 3.072905, 0, 0, 0, 1, 1,
1.724522, 0.3582749, 1.601262, 0, 0, 0, 1, 1,
1.738229, 0.726565, 0.9433532, 0, 0, 0, 1, 1,
1.755557, -0.6679069, 1.662005, 0, 0, 0, 1, 1,
1.756333, -2.748537, 3.389646, 1, 1, 1, 1, 1,
1.768696, 1.256441, 0.4788428, 1, 1, 1, 1, 1,
1.793983, -0.8386285, 0.2178184, 1, 1, 1, 1, 1,
1.806825, -0.4980295, 2.805777, 1, 1, 1, 1, 1,
1.807163, -0.7080299, 2.283855, 1, 1, 1, 1, 1,
1.816018, 0.2352817, 0.9486206, 1, 1, 1, 1, 1,
1.828084, -0.4561325, 1.167555, 1, 1, 1, 1, 1,
1.830384, 1.035739, 2.450997, 1, 1, 1, 1, 1,
1.830977, -1.028235, 2.808387, 1, 1, 1, 1, 1,
1.878747, 1.421387, 0.6900256, 1, 1, 1, 1, 1,
1.951393, -0.4766831, 2.423118, 1, 1, 1, 1, 1,
1.974125, -0.3912478, 1.218979, 1, 1, 1, 1, 1,
1.976992, -1.274511, 0.8540767, 1, 1, 1, 1, 1,
1.978265, 1.36068, 2.180582, 1, 1, 1, 1, 1,
1.98026, -0.4773092, 0.653616, 1, 1, 1, 1, 1,
1.999569, -1.213437, 1.759153, 0, 0, 1, 1, 1,
2.003796, 0.02201759, 1.175547, 1, 0, 0, 1, 1,
2.077789, 0.2512376, 3.244725, 1, 0, 0, 1, 1,
2.078146, -1.270058, 1.593185, 1, 0, 0, 1, 1,
2.090064, -0.8263677, 1.571966, 1, 0, 0, 1, 1,
2.101055, -1.894979, 1.719016, 1, 0, 0, 1, 1,
2.161758, -0.4341159, 1.676504, 0, 0, 0, 1, 1,
2.169185, 1.394771, -0.5292502, 0, 0, 0, 1, 1,
2.230171, 0.6245239, 0.6320136, 0, 0, 0, 1, 1,
2.245987, -0.1847368, 2.312029, 0, 0, 0, 1, 1,
2.254637, 0.3209177, 1.94655, 0, 0, 0, 1, 1,
2.307403, -0.09979672, 2.012908, 0, 0, 0, 1, 1,
2.412053, 1.136873, 0.8268173, 0, 0, 0, 1, 1,
2.414761, -1.189752, 3.36237, 1, 1, 1, 1, 1,
2.468022, -1.056769, 2.571245, 1, 1, 1, 1, 1,
2.543741, 1.10174, -0.1077543, 1, 1, 1, 1, 1,
2.606114, -1.948416, 3.663086, 1, 1, 1, 1, 1,
3.042811, -0.0659183, 2.149986, 1, 1, 1, 1, 1,
3.161255, 0.4383163, 0.2960389, 1, 1, 1, 1, 1,
3.324321, -0.6762258, 0.7419499, 1, 1, 1, 1, 1
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
var radius = 9.435895;
var distance = 33.14318;
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
mvMatrix.translate( -0.00569129, -0.01606488, -0.1272502 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.14318);
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
