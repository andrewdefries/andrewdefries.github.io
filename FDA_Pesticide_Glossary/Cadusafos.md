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
-3.083419, 1.749972, -0.9485243, 1, 0, 0, 1,
-2.884005, -1.716903, -2.840589, 1, 0.007843138, 0, 1,
-2.649532, 0.5850172, -3.876523, 1, 0.01176471, 0, 1,
-2.566198, -0.7791575, -2.183897, 1, 0.01960784, 0, 1,
-2.560431, -0.03089453, -1.783223, 1, 0.02352941, 0, 1,
-2.534319, -1.738254, -2.797369, 1, 0.03137255, 0, 1,
-2.523339, -0.3478142, -2.838747, 1, 0.03529412, 0, 1,
-2.523142, -0.8463116, -3.198088, 1, 0.04313726, 0, 1,
-2.499314, -1.349381, -1.696188, 1, 0.04705882, 0, 1,
-2.364588, 0.3155514, -0.707566, 1, 0.05490196, 0, 1,
-2.299124, -0.3386485, -1.362681, 1, 0.05882353, 0, 1,
-2.280023, 0.8744177, -0.0197547, 1, 0.06666667, 0, 1,
-2.223512, -1.30958, -1.278801, 1, 0.07058824, 0, 1,
-2.182734, -0.8165467, -3.604389, 1, 0.07843138, 0, 1,
-2.18226, 1.044784, -1.296935, 1, 0.08235294, 0, 1,
-2.139082, -0.7341379, -2.600251, 1, 0.09019608, 0, 1,
-2.137634, 1.091223, -0.34357, 1, 0.09411765, 0, 1,
-2.074966, 0.0006830295, -3.069837, 1, 0.1019608, 0, 1,
-2.056358, 0.09956725, -2.500315, 1, 0.1098039, 0, 1,
-2.048411, -0.6937824, -3.890235, 1, 0.1137255, 0, 1,
-2.03822, 1.897866, -0.2498213, 1, 0.1215686, 0, 1,
-2.020678, 0.2024415, -2.10162, 1, 0.1254902, 0, 1,
-2.008065, 0.1112758, -1.522029, 1, 0.1333333, 0, 1,
-2.00568, 1.587232, -1.023334, 1, 0.1372549, 0, 1,
-2.001884, -1.627872, -1.981729, 1, 0.145098, 0, 1,
-1.954843, -0.4431945, -2.643661, 1, 0.1490196, 0, 1,
-1.954409, 0.8344261, -2.82435, 1, 0.1568628, 0, 1,
-1.937647, 0.7443473, -1.662938, 1, 0.1607843, 0, 1,
-1.907686, -0.270368, -2.633401, 1, 0.1686275, 0, 1,
-1.812606, 1.675828, -2.081155, 1, 0.172549, 0, 1,
-1.806201, -1.934928, -1.247965, 1, 0.1803922, 0, 1,
-1.766521, -0.5418774, -2.877475, 1, 0.1843137, 0, 1,
-1.753595, -0.4572221, -2.275471, 1, 0.1921569, 0, 1,
-1.751741, 1.942796, -0.2710532, 1, 0.1960784, 0, 1,
-1.745961, -0.3894504, -2.118523, 1, 0.2039216, 0, 1,
-1.745409, -1.562475, -3.195125, 1, 0.2117647, 0, 1,
-1.739918, 0.07132389, -0.5718561, 1, 0.2156863, 0, 1,
-1.714746, 1.501164, -0.5929236, 1, 0.2235294, 0, 1,
-1.69835, -0.8947065, -2.887408, 1, 0.227451, 0, 1,
-1.692435, -0.7075492, -1.429597, 1, 0.2352941, 0, 1,
-1.685534, -0.8283339, -0.5574908, 1, 0.2392157, 0, 1,
-1.682058, 0.04844876, -1.645011, 1, 0.2470588, 0, 1,
-1.649146, -0.4310901, -1.143087, 1, 0.2509804, 0, 1,
-1.63575, -0.1438836, -0.5558128, 1, 0.2588235, 0, 1,
-1.633789, -0.5926605, -3.563585, 1, 0.2627451, 0, 1,
-1.63363, 0.3733326, -2.026684, 1, 0.2705882, 0, 1,
-1.632524, 0.002909917, -2.439495, 1, 0.2745098, 0, 1,
-1.620381, -0.7060649, -2.79409, 1, 0.282353, 0, 1,
-1.619968, 0.2537254, -0.6356419, 1, 0.2862745, 0, 1,
-1.60145, -0.07243345, -2.894958, 1, 0.2941177, 0, 1,
-1.601164, -1.377917, -2.184767, 1, 0.3019608, 0, 1,
-1.598418, 0.9307289, 0.1635482, 1, 0.3058824, 0, 1,
-1.597557, -0.5317335, -3.06254, 1, 0.3137255, 0, 1,
-1.58494, 2.636983, -1.462238, 1, 0.3176471, 0, 1,
-1.548448, -0.3504958, -1.648385, 1, 0.3254902, 0, 1,
-1.530732, -2.158474, -4.793808, 1, 0.3294118, 0, 1,
-1.507699, -0.9045206, -2.866404, 1, 0.3372549, 0, 1,
-1.50691, 1.07351, 1.663561, 1, 0.3411765, 0, 1,
-1.504054, 0.8796552, -1.835739, 1, 0.3490196, 0, 1,
-1.499337, 1.081968, -0.8365395, 1, 0.3529412, 0, 1,
-1.496619, 2.022666, -0.8687482, 1, 0.3607843, 0, 1,
-1.496521, -0.7010826, -2.413365, 1, 0.3647059, 0, 1,
-1.494194, -0.4532691, -1.936875, 1, 0.372549, 0, 1,
-1.492135, 0.6118374, -1.035478, 1, 0.3764706, 0, 1,
-1.488492, 1.78956, 0.7639818, 1, 0.3843137, 0, 1,
-1.48375, 0.8632333, -0.5351384, 1, 0.3882353, 0, 1,
-1.464046, 0.6103588, -1.34886, 1, 0.3960784, 0, 1,
-1.440512, 1.688733, -0.0842719, 1, 0.4039216, 0, 1,
-1.44029, -1.105658, -3.156617, 1, 0.4078431, 0, 1,
-1.426803, -0.369557, -1.095564, 1, 0.4156863, 0, 1,
-1.422174, -0.1776311, -1.136543, 1, 0.4196078, 0, 1,
-1.420907, -1.123517, -3.279902, 1, 0.427451, 0, 1,
-1.418653, -0.5262113, -1.682676, 1, 0.4313726, 0, 1,
-1.418299, 0.4402481, -0.4562002, 1, 0.4392157, 0, 1,
-1.405944, 0.3129494, -1.933583, 1, 0.4431373, 0, 1,
-1.399972, 1.994312, 0.5073774, 1, 0.4509804, 0, 1,
-1.393036, 0.2496926, -1.512479, 1, 0.454902, 0, 1,
-1.380507, 1.121514, -0.01325621, 1, 0.4627451, 0, 1,
-1.374435, -0.4966651, -2.770128, 1, 0.4666667, 0, 1,
-1.353971, 0.2135398, -1.210299, 1, 0.4745098, 0, 1,
-1.334663, 1.286227, 0.9995636, 1, 0.4784314, 0, 1,
-1.323341, -2.668896, -2.743864, 1, 0.4862745, 0, 1,
-1.323128, 1.403568, -1.86869, 1, 0.4901961, 0, 1,
-1.320633, 0.04148035, -0.8666167, 1, 0.4980392, 0, 1,
-1.310094, -1.304435, -2.727079, 1, 0.5058824, 0, 1,
-1.307693, 0.3038583, -3.988633, 1, 0.509804, 0, 1,
-1.307095, 0.03298584, -2.407374, 1, 0.5176471, 0, 1,
-1.298209, -0.03272102, -1.156608, 1, 0.5215687, 0, 1,
-1.295936, -1.405724, -3.574305, 1, 0.5294118, 0, 1,
-1.295095, 1.425678, -1.035906, 1, 0.5333334, 0, 1,
-1.290798, 0.9895281, -0.7469413, 1, 0.5411765, 0, 1,
-1.28954, -0.1084068, -1.394426, 1, 0.5450981, 0, 1,
-1.287629, -1.206186, -4.462767, 1, 0.5529412, 0, 1,
-1.26704, -0.02686013, -0.2634649, 1, 0.5568628, 0, 1,
-1.261037, -0.3897069, -2.824609, 1, 0.5647059, 0, 1,
-1.239679, -0.8259337, 0.2108639, 1, 0.5686275, 0, 1,
-1.233062, -0.3384758, -1.320896, 1, 0.5764706, 0, 1,
-1.229073, 0.8326445, -0.8139219, 1, 0.5803922, 0, 1,
-1.225759, 0.46689, -0.9536517, 1, 0.5882353, 0, 1,
-1.223283, -0.7674671, -0.9413427, 1, 0.5921569, 0, 1,
-1.222696, 1.493845, -2.706502, 1, 0.6, 0, 1,
-1.222359, 1.118241, -0.2845115, 1, 0.6078432, 0, 1,
-1.213291, -0.534353, -1.168154, 1, 0.6117647, 0, 1,
-1.202348, 1.076103, -1.060317, 1, 0.6196079, 0, 1,
-1.192149, -1.472975, -3.771674, 1, 0.6235294, 0, 1,
-1.18444, -2.732643, -2.778212, 1, 0.6313726, 0, 1,
-1.183527, 1.462979, -2.309642, 1, 0.6352941, 0, 1,
-1.179417, -0.2874951, -1.961351, 1, 0.6431373, 0, 1,
-1.176201, 0.3379758, -1.244044, 1, 0.6470588, 0, 1,
-1.172958, 0.4270918, -0.8847402, 1, 0.654902, 0, 1,
-1.169378, -1.350162, -3.382609, 1, 0.6588235, 0, 1,
-1.169319, 1.484999, -1.903895, 1, 0.6666667, 0, 1,
-1.153366, -0.1799425, -1.274014, 1, 0.6705883, 0, 1,
-1.151268, -0.8938506, -4.728932, 1, 0.6784314, 0, 1,
-1.137939, 0.1387823, 0.229316, 1, 0.682353, 0, 1,
-1.136346, 1.283029, -0.01069557, 1, 0.6901961, 0, 1,
-1.136243, -0.2605359, -1.382953, 1, 0.6941177, 0, 1,
-1.127989, -0.2743943, -2.012392, 1, 0.7019608, 0, 1,
-1.120808, -0.683727, -3.196499, 1, 0.7098039, 0, 1,
-1.117936, 0.2354678, 0.1578927, 1, 0.7137255, 0, 1,
-1.117534, 0.4957818, -1.093324, 1, 0.7215686, 0, 1,
-1.115458, -1.133515, -2.654628, 1, 0.7254902, 0, 1,
-1.115253, 0.356936, -0.9443892, 1, 0.7333333, 0, 1,
-1.113928, 0.7236211, -0.3964079, 1, 0.7372549, 0, 1,
-1.109382, 0.7499908, -1.563933, 1, 0.7450981, 0, 1,
-1.104813, 0.4497574, -1.497373, 1, 0.7490196, 0, 1,
-1.103499, 1.108563, -1.553096, 1, 0.7568628, 0, 1,
-1.098303, -1.789885, -3.451867, 1, 0.7607843, 0, 1,
-1.090739, -0.4057373, -2.451929, 1, 0.7686275, 0, 1,
-1.090498, 0.1773169, -1.873064, 1, 0.772549, 0, 1,
-1.090422, -0.5355303, -1.237639, 1, 0.7803922, 0, 1,
-1.084068, -0.3620463, -2.308393, 1, 0.7843137, 0, 1,
-1.079742, 0.5357931, -0.6662066, 1, 0.7921569, 0, 1,
-1.078524, 0.03853242, 0.4338318, 1, 0.7960784, 0, 1,
-1.070182, -0.00349016, -3.051828, 1, 0.8039216, 0, 1,
-1.069438, 0.2953322, -3.142673, 1, 0.8117647, 0, 1,
-1.06387, -1.400021, -2.451555, 1, 0.8156863, 0, 1,
-1.057786, 0.2814233, -1.891572, 1, 0.8235294, 0, 1,
-1.050091, 0.3120028, 0.5482261, 1, 0.827451, 0, 1,
-1.050011, -1.297184, -2.225815, 1, 0.8352941, 0, 1,
-1.040664, -0.8224782, -4.203305, 1, 0.8392157, 0, 1,
-1.038276, -1.324536, -1.621666, 1, 0.8470588, 0, 1,
-1.037958, 1.0505, -1.30241, 1, 0.8509804, 0, 1,
-1.036324, 1.471774, 0.3629515, 1, 0.8588235, 0, 1,
-1.028301, -0.5287364, -2.209908, 1, 0.8627451, 0, 1,
-1.02452, -0.6226832, -1.994197, 1, 0.8705882, 0, 1,
-1.01964, -1.111887, -2.618118, 1, 0.8745098, 0, 1,
-1.019634, -0.780237, -1.159928, 1, 0.8823529, 0, 1,
-1.016757, -2.340794, -3.35087, 1, 0.8862745, 0, 1,
-1.013984, 0.3557219, -1.218567, 1, 0.8941177, 0, 1,
-1.008014, 1.27409, 0.7748578, 1, 0.8980392, 0, 1,
-1.006924, -0.8117568, -1.36908, 1, 0.9058824, 0, 1,
-1.006176, -0.009528886, -3.119012, 1, 0.9137255, 0, 1,
-0.9974049, -0.31352, -2.059542, 1, 0.9176471, 0, 1,
-0.9890237, -0.6092197, -5.42793, 1, 0.9254902, 0, 1,
-0.9857122, 0.2941415, 1.996709, 1, 0.9294118, 0, 1,
-0.9834755, -1.163221, -3.353754, 1, 0.9372549, 0, 1,
-0.9812139, -0.2905598, -2.524789, 1, 0.9411765, 0, 1,
-0.981205, 0.4555841, -1.404537, 1, 0.9490196, 0, 1,
-0.9765973, 0.1544622, 1.678423, 1, 0.9529412, 0, 1,
-0.9735446, -0.06766419, -2.771226, 1, 0.9607843, 0, 1,
-0.9713001, 0.7422556, -1.553704, 1, 0.9647059, 0, 1,
-0.9680332, 0.1516458, -2.122761, 1, 0.972549, 0, 1,
-0.9603515, -0.3526141, -0.9485475, 1, 0.9764706, 0, 1,
-0.9547477, -0.3986777, -2.027866, 1, 0.9843137, 0, 1,
-0.9509477, -1.3011, -2.263389, 1, 0.9882353, 0, 1,
-0.9459985, 2.144845, -1.123395, 1, 0.9960784, 0, 1,
-0.9455237, -1.297141, -1.532833, 0.9960784, 1, 0, 1,
-0.9449044, -0.6164794, -2.655312, 0.9921569, 1, 0, 1,
-0.9417409, -1.838707, -3.864558, 0.9843137, 1, 0, 1,
-0.9314558, 1.62813, 0.2184922, 0.9803922, 1, 0, 1,
-0.9200981, 0.6118609, -1.185132, 0.972549, 1, 0, 1,
-0.9196591, -0.4677857, -1.78894, 0.9686275, 1, 0, 1,
-0.9165942, 1.995293, -0.1823896, 0.9607843, 1, 0, 1,
-0.9122275, 1.889295, -0.06181595, 0.9568627, 1, 0, 1,
-0.9096668, 1.466603, -1.373623, 0.9490196, 1, 0, 1,
-0.9042763, 0.6399854, -1.301255, 0.945098, 1, 0, 1,
-0.8965336, -0.3997642, -5.072944, 0.9372549, 1, 0, 1,
-0.8951672, -1.372696, -3.956107, 0.9333333, 1, 0, 1,
-0.8851559, -0.4923829, -3.066395, 0.9254902, 1, 0, 1,
-0.8838763, -0.8471746, -3.559696, 0.9215686, 1, 0, 1,
-0.8816141, -2.006991, -3.748694, 0.9137255, 1, 0, 1,
-0.8757377, 0.1683991, -0.3767222, 0.9098039, 1, 0, 1,
-0.8753997, -0.8125342, -4.686534, 0.9019608, 1, 0, 1,
-0.8753039, 1.301718, -1.771382, 0.8941177, 1, 0, 1,
-0.8745354, 0.8565768, -0.8975192, 0.8901961, 1, 0, 1,
-0.8691902, -0.9601666, -3.67148, 0.8823529, 1, 0, 1,
-0.8686573, -2.529582, -3.285794, 0.8784314, 1, 0, 1,
-0.8686015, 0.3223925, -2.688098, 0.8705882, 1, 0, 1,
-0.8647093, 2.097577, -1.768698, 0.8666667, 1, 0, 1,
-0.8633693, 0.2188772, -0.6514065, 0.8588235, 1, 0, 1,
-0.8619748, 0.5709541, -1.742849, 0.854902, 1, 0, 1,
-0.8531375, 0.3282958, 0.112664, 0.8470588, 1, 0, 1,
-0.8510897, -0.4389526, -1.082269, 0.8431373, 1, 0, 1,
-0.8473381, -1.270149, -3.509176, 0.8352941, 1, 0, 1,
-0.8438014, 2.134834, 0.1425259, 0.8313726, 1, 0, 1,
-0.8423141, 0.7255877, -0.207454, 0.8235294, 1, 0, 1,
-0.8419737, -0.602417, -3.243918, 0.8196079, 1, 0, 1,
-0.8398782, 1.513994, -0.4135445, 0.8117647, 1, 0, 1,
-0.8374677, -0.5940145, -1.129714, 0.8078431, 1, 0, 1,
-0.8353779, -0.1780178, -3.310261, 0.8, 1, 0, 1,
-0.8270129, -1.510971, -1.984968, 0.7921569, 1, 0, 1,
-0.8247256, -0.4496157, -1.40837, 0.7882353, 1, 0, 1,
-0.8234147, 0.5513737, -1.968394, 0.7803922, 1, 0, 1,
-0.8224683, -0.2179287, -2.672523, 0.7764706, 1, 0, 1,
-0.8185818, -0.8919365, -1.796472, 0.7686275, 1, 0, 1,
-0.8108788, -0.4576972, -2.430742, 0.7647059, 1, 0, 1,
-0.8008893, 0.4507948, -0.2259825, 0.7568628, 1, 0, 1,
-0.7949923, -1.528182, -3.047127, 0.7529412, 1, 0, 1,
-0.7918852, -0.6428462, -3.503601, 0.7450981, 1, 0, 1,
-0.7733348, 1.874932, -0.3115035, 0.7411765, 1, 0, 1,
-0.7697619, 0.6386545, -0.9235417, 0.7333333, 1, 0, 1,
-0.7696734, -1.372742, -2.940468, 0.7294118, 1, 0, 1,
-0.7683254, -0.7189431, -0.9873743, 0.7215686, 1, 0, 1,
-0.7660672, -0.9950159, -4.057534, 0.7176471, 1, 0, 1,
-0.7568746, -2.863036, -2.905742, 0.7098039, 1, 0, 1,
-0.75019, 0.3611654, -1.229004, 0.7058824, 1, 0, 1,
-0.7472916, 1.575116, 0.4657165, 0.6980392, 1, 0, 1,
-0.7403703, -1.489028, -2.818034, 0.6901961, 1, 0, 1,
-0.7388885, 0.01009419, -1.549862, 0.6862745, 1, 0, 1,
-0.7369498, 0.2501675, -1.142241, 0.6784314, 1, 0, 1,
-0.7363869, -0.8749117, -2.376409, 0.6745098, 1, 0, 1,
-0.735081, -0.1535006, -1.257885, 0.6666667, 1, 0, 1,
-0.7313505, -1.129578, -2.376603, 0.6627451, 1, 0, 1,
-0.7310346, -1.062736, -1.445284, 0.654902, 1, 0, 1,
-0.7189262, -0.2682781, -2.338678, 0.6509804, 1, 0, 1,
-0.7147779, -1.144279, -2.835114, 0.6431373, 1, 0, 1,
-0.7110081, 0.112509, -1.394368, 0.6392157, 1, 0, 1,
-0.7081975, 0.1067078, -1.850716, 0.6313726, 1, 0, 1,
-0.7074845, 0.4908843, -1.372568, 0.627451, 1, 0, 1,
-0.7024941, 1.181234, -0.9283997, 0.6196079, 1, 0, 1,
-0.6939808, -0.5162457, -2.524188, 0.6156863, 1, 0, 1,
-0.6929307, 1.728064, -1.43876, 0.6078432, 1, 0, 1,
-0.6926003, 0.5369907, -1.253054, 0.6039216, 1, 0, 1,
-0.69161, -0.5972401, -2.526527, 0.5960785, 1, 0, 1,
-0.6915626, 0.1634825, -2.789228, 0.5882353, 1, 0, 1,
-0.6910241, -0.2541908, -1.381608, 0.5843138, 1, 0, 1,
-0.6871728, -0.6979316, -0.5674617, 0.5764706, 1, 0, 1,
-0.6723688, -0.4032395, -2.529281, 0.572549, 1, 0, 1,
-0.6713192, -1.231938, -2.68109, 0.5647059, 1, 0, 1,
-0.6672263, 1.310972, -1.170068, 0.5607843, 1, 0, 1,
-0.666251, 0.7607104, -2.370994, 0.5529412, 1, 0, 1,
-0.663849, -0.199333, -2.864555, 0.5490196, 1, 0, 1,
-0.6540601, 0.1380381, -1.532593, 0.5411765, 1, 0, 1,
-0.6431791, -0.4234155, -3.403006, 0.5372549, 1, 0, 1,
-0.6370178, 0.5966902, -0.2365159, 0.5294118, 1, 0, 1,
-0.6344138, 0.2679073, -1.846417, 0.5254902, 1, 0, 1,
-0.6266112, -0.2790641, -2.677924, 0.5176471, 1, 0, 1,
-0.6258533, 0.03760718, -1.69366, 0.5137255, 1, 0, 1,
-0.6255115, -2.646241, -3.366798, 0.5058824, 1, 0, 1,
-0.6237546, -0.6694426, -2.335673, 0.5019608, 1, 0, 1,
-0.622061, -0.07915509, -2.448798, 0.4941176, 1, 0, 1,
-0.6206555, 0.8892537, -1.994783, 0.4862745, 1, 0, 1,
-0.6185105, -0.5951641, -1.736939, 0.4823529, 1, 0, 1,
-0.6134426, 0.3709212, -1.14491, 0.4745098, 1, 0, 1,
-0.6114712, -1.363603, -4.572761, 0.4705882, 1, 0, 1,
-0.6089057, -0.247196, -0.4616008, 0.4627451, 1, 0, 1,
-0.6069987, -0.5176061, -1.590031, 0.4588235, 1, 0, 1,
-0.606971, -0.1966222, -1.759379, 0.4509804, 1, 0, 1,
-0.60306, -0.2272583, -1.159119, 0.4470588, 1, 0, 1,
-0.5987352, -1.352582, -2.340626, 0.4392157, 1, 0, 1,
-0.5885231, 0.3141739, -0.4497548, 0.4352941, 1, 0, 1,
-0.5880588, 0.6131932, -2.18044, 0.427451, 1, 0, 1,
-0.5875233, 0.5035042, -1.938881, 0.4235294, 1, 0, 1,
-0.5858678, 0.2803744, -1.407164, 0.4156863, 1, 0, 1,
-0.5849168, -0.02972271, -1.622023, 0.4117647, 1, 0, 1,
-0.582643, -1.182441, -3.06399, 0.4039216, 1, 0, 1,
-0.5820554, 1.157927, -0.03077377, 0.3960784, 1, 0, 1,
-0.5811496, -2.294976, -3.81447, 0.3921569, 1, 0, 1,
-0.5784356, 0.4816663, -0.1411845, 0.3843137, 1, 0, 1,
-0.5781795, -0.6552762, -2.192279, 0.3803922, 1, 0, 1,
-0.5755972, 0.06124204, -1.336683, 0.372549, 1, 0, 1,
-0.5719197, -0.3570338, -0.6661177, 0.3686275, 1, 0, 1,
-0.5710974, 0.1308596, -2.352005, 0.3607843, 1, 0, 1,
-0.5667669, -0.9193187, -2.285422, 0.3568628, 1, 0, 1,
-0.5665767, 0.05757482, -0.1134323, 0.3490196, 1, 0, 1,
-0.5490434, 0.6145544, 0.3134715, 0.345098, 1, 0, 1,
-0.5485629, 0.551964, -0.0009300679, 0.3372549, 1, 0, 1,
-0.5470179, 0.5384248, -0.4171169, 0.3333333, 1, 0, 1,
-0.5404168, -0.1884734, -2.625426, 0.3254902, 1, 0, 1,
-0.5385861, -0.009279471, -1.751054, 0.3215686, 1, 0, 1,
-0.5372993, 0.9054905, -1.061134, 0.3137255, 1, 0, 1,
-0.5367872, -0.8894723, -3.390204, 0.3098039, 1, 0, 1,
-0.5362067, 1.753749, 1.448182, 0.3019608, 1, 0, 1,
-0.5356327, -0.3475299, -0.7605821, 0.2941177, 1, 0, 1,
-0.5309843, 0.3219437, -1.749433, 0.2901961, 1, 0, 1,
-0.5299602, -0.9132842, -1.750285, 0.282353, 1, 0, 1,
-0.5274459, 1.121174, -0.2567496, 0.2784314, 1, 0, 1,
-0.5258431, 0.2312417, -2.403408, 0.2705882, 1, 0, 1,
-0.523307, -1.244226, -2.398143, 0.2666667, 1, 0, 1,
-0.5212216, 1.192378, 0.7695908, 0.2588235, 1, 0, 1,
-0.5193408, 0.5663983, -1.733887, 0.254902, 1, 0, 1,
-0.5192575, 0.08960213, -0.9821061, 0.2470588, 1, 0, 1,
-0.5184423, 0.1500723, -2.470276, 0.2431373, 1, 0, 1,
-0.5173462, -0.683073, -3.441263, 0.2352941, 1, 0, 1,
-0.5108433, -0.2778791, -3.272153, 0.2313726, 1, 0, 1,
-0.5079662, -0.2070116, -3.175879, 0.2235294, 1, 0, 1,
-0.50741, 0.418578, 0.6552048, 0.2196078, 1, 0, 1,
-0.4993383, -0.3147277, -1.08993, 0.2117647, 1, 0, 1,
-0.4958633, -2.316554, -2.744492, 0.2078431, 1, 0, 1,
-0.4931422, -0.7699842, -4.35807, 0.2, 1, 0, 1,
-0.4901552, -0.2627503, -2.242296, 0.1921569, 1, 0, 1,
-0.4888453, 0.7565563, -0.4701123, 0.1882353, 1, 0, 1,
-0.4814123, -1.662446, -3.11318, 0.1803922, 1, 0, 1,
-0.4724557, -0.009987179, -1.637386, 0.1764706, 1, 0, 1,
-0.471116, -2.092165, -2.501122, 0.1686275, 1, 0, 1,
-0.4706331, -0.1465842, -0.1046084, 0.1647059, 1, 0, 1,
-0.4664761, -1.766908, -3.929314, 0.1568628, 1, 0, 1,
-0.4660526, -0.05831029, -0.8319853, 0.1529412, 1, 0, 1,
-0.4657633, -0.8318129, -4.623441, 0.145098, 1, 0, 1,
-0.4625425, 1.07353, -0.2516554, 0.1411765, 1, 0, 1,
-0.4624226, 0.09343796, -0.9419786, 0.1333333, 1, 0, 1,
-0.4551059, -0.1709415, -3.402138, 0.1294118, 1, 0, 1,
-0.4527287, 0.299786, 0.7559327, 0.1215686, 1, 0, 1,
-0.4481616, 0.1456339, -2.38628, 0.1176471, 1, 0, 1,
-0.4466424, -0.7202284, -2.355586, 0.1098039, 1, 0, 1,
-0.4430439, -0.7156128, -1.71126, 0.1058824, 1, 0, 1,
-0.434522, 0.8501802, -2.256156, 0.09803922, 1, 0, 1,
-0.4316921, 0.2048523, -1.755702, 0.09019608, 1, 0, 1,
-0.4311823, -0.976218, -3.690377, 0.08627451, 1, 0, 1,
-0.4257745, -0.9502015, -1.194291, 0.07843138, 1, 0, 1,
-0.4252536, 0.4632655, 0.8851056, 0.07450981, 1, 0, 1,
-0.4245859, 1.444566, -0.4409242, 0.06666667, 1, 0, 1,
-0.421863, -0.04935577, -1.49854, 0.0627451, 1, 0, 1,
-0.4217725, 0.9058477, -0.4671014, 0.05490196, 1, 0, 1,
-0.421305, 0.03380489, -0.3646845, 0.05098039, 1, 0, 1,
-0.4172711, -1.889402, -2.268819, 0.04313726, 1, 0, 1,
-0.4170969, -2.465179, -3.622872, 0.03921569, 1, 0, 1,
-0.4154738, 0.03476, 0.6998664, 0.03137255, 1, 0, 1,
-0.4151905, -0.2315805, -1.140362, 0.02745098, 1, 0, 1,
-0.4151657, -0.7266715, -3.510996, 0.01960784, 1, 0, 1,
-0.4151351, -0.7749031, -3.286467, 0.01568628, 1, 0, 1,
-0.4107826, -0.5320442, -1.86577, 0.007843138, 1, 0, 1,
-0.4106547, 0.09096009, -2.34859, 0.003921569, 1, 0, 1,
-0.4079101, 0.1138593, -1.951458, 0, 1, 0.003921569, 1,
-0.407114, -0.4727163, -1.230541, 0, 1, 0.01176471, 1,
-0.4066121, -0.9731406, -1.142327, 0, 1, 0.01568628, 1,
-0.4060555, 0.6389691, -2.11489, 0, 1, 0.02352941, 1,
-0.4050534, 0.3400383, -1.787724, 0, 1, 0.02745098, 1,
-0.4031272, -0.9630364, -3.040509, 0, 1, 0.03529412, 1,
-0.4010513, -0.1313616, -4.259353, 0, 1, 0.03921569, 1,
-0.3949778, 0.7769269, -1.834912, 0, 1, 0.04705882, 1,
-0.3895528, 0.4890659, 2.458921, 0, 1, 0.05098039, 1,
-0.3879584, -1.29522, -3.23282, 0, 1, 0.05882353, 1,
-0.3873226, -0.5711777, -1.455404, 0, 1, 0.0627451, 1,
-0.3852873, 1.657789, -0.5489014, 0, 1, 0.07058824, 1,
-0.3834606, 1.462776, -0.6629852, 0, 1, 0.07450981, 1,
-0.3832238, 0.1572483, -2.54005, 0, 1, 0.08235294, 1,
-0.3830407, 0.5370869, -1.384563, 0, 1, 0.08627451, 1,
-0.3822667, -1.020927, -3.315318, 0, 1, 0.09411765, 1,
-0.3786869, -0.8885583, -1.492881, 0, 1, 0.1019608, 1,
-0.3768376, 0.342644, -0.6365749, 0, 1, 0.1058824, 1,
-0.3760644, 0.685964, -0.6358432, 0, 1, 0.1137255, 1,
-0.3727162, 1.017609, -0.8079889, 0, 1, 0.1176471, 1,
-0.3714979, -0.4110712, -4.12428, 0, 1, 0.1254902, 1,
-0.3640838, 0.09627798, -1.778525, 0, 1, 0.1294118, 1,
-0.3637764, -0.05969348, -2.20584, 0, 1, 0.1372549, 1,
-0.3610189, 1.032475, 2.615351, 0, 1, 0.1411765, 1,
-0.3599143, -1.900222, -2.033942, 0, 1, 0.1490196, 1,
-0.3595408, 0.6596069, -1.219685, 0, 1, 0.1529412, 1,
-0.3591544, -1.638983, -2.059004, 0, 1, 0.1607843, 1,
-0.3572953, -2.221481, -3.590827, 0, 1, 0.1647059, 1,
-0.3544686, 1.816875, -0.258153, 0, 1, 0.172549, 1,
-0.3528942, 0.6559926, 0.2241644, 0, 1, 0.1764706, 1,
-0.3472539, -0.2289268, -2.566865, 0, 1, 0.1843137, 1,
-0.3405455, 1.687523, 1.197461, 0, 1, 0.1882353, 1,
-0.3394473, -0.5964164, -4.294201, 0, 1, 0.1960784, 1,
-0.3377929, 0.0897407, -1.423978, 0, 1, 0.2039216, 1,
-0.3377711, 0.1408817, -2.551077, 0, 1, 0.2078431, 1,
-0.3361946, 1.418222, -0.1833212, 0, 1, 0.2156863, 1,
-0.3346286, -3.62077, -2.767974, 0, 1, 0.2196078, 1,
-0.3192409, -0.06844135, -0.2202943, 0, 1, 0.227451, 1,
-0.3190052, -1.260577, -4.700339, 0, 1, 0.2313726, 1,
-0.3177056, -2.146989, -2.809602, 0, 1, 0.2392157, 1,
-0.3163279, -0.3924889, -2.855969, 0, 1, 0.2431373, 1,
-0.3153104, 2.766417, -0.9529057, 0, 1, 0.2509804, 1,
-0.3143107, -0.5477762, -3.459838, 0, 1, 0.254902, 1,
-0.3072716, 0.01975655, -2.170358, 0, 1, 0.2627451, 1,
-0.3052871, 2.30605, 0.8009959, 0, 1, 0.2666667, 1,
-0.2959514, -2.11835, -4.820056, 0, 1, 0.2745098, 1,
-0.2921033, -1.284606, -2.069907, 0, 1, 0.2784314, 1,
-0.290536, 0.9945836, 0.2284013, 0, 1, 0.2862745, 1,
-0.2882433, -0.1773089, -2.010423, 0, 1, 0.2901961, 1,
-0.28333, -0.271386, -1.90051, 0, 1, 0.2980392, 1,
-0.2831554, -0.0956995, -3.483067, 0, 1, 0.3058824, 1,
-0.282227, 1.817157, 0.8706453, 0, 1, 0.3098039, 1,
-0.2815574, -0.8437251, -2.308673, 0, 1, 0.3176471, 1,
-0.2717931, -0.1353279, -3.320901, 0, 1, 0.3215686, 1,
-0.2695587, -0.411052, -3.705623, 0, 1, 0.3294118, 1,
-0.2615546, 1.372919, 1.523606, 0, 1, 0.3333333, 1,
-0.255856, -0.4701428, -3.768392, 0, 1, 0.3411765, 1,
-0.2556356, 0.7248589, -0.995652, 0, 1, 0.345098, 1,
-0.2523569, -0.5350412, -4.256989, 0, 1, 0.3529412, 1,
-0.2494768, 0.0052317, -2.163965, 0, 1, 0.3568628, 1,
-0.248321, 0.4616, -0.03765739, 0, 1, 0.3647059, 1,
-0.2478178, -1.398218, -4.083583, 0, 1, 0.3686275, 1,
-0.2460682, 0.2368309, -2.056823, 0, 1, 0.3764706, 1,
-0.2399339, 0.1511013, -0.05515867, 0, 1, 0.3803922, 1,
-0.236329, 2.001069, -0.1040952, 0, 1, 0.3882353, 1,
-0.2330724, -0.784623, -4.13834, 0, 1, 0.3921569, 1,
-0.2324391, 0.08054998, 0.209897, 0, 1, 0.4, 1,
-0.2267037, 2.00764, 0.1155957, 0, 1, 0.4078431, 1,
-0.2241821, 0.1894619, -1.705196, 0, 1, 0.4117647, 1,
-0.2220174, -1.055254, -3.697247, 0, 1, 0.4196078, 1,
-0.2192848, 1.202551, 0.05369058, 0, 1, 0.4235294, 1,
-0.2163357, -1.083962, -3.377815, 0, 1, 0.4313726, 1,
-0.2143518, 0.3225546, 1.409901, 0, 1, 0.4352941, 1,
-0.2141242, 0.1846631, -1.15163, 0, 1, 0.4431373, 1,
-0.2090819, 2.090419, -0.5368034, 0, 1, 0.4470588, 1,
-0.2082715, 0.5799311, 0.3565677, 0, 1, 0.454902, 1,
-0.2082621, 0.5510896, 0.008060683, 0, 1, 0.4588235, 1,
-0.2071485, 0.9512829, -0.2603552, 0, 1, 0.4666667, 1,
-0.204376, 2.558197, 0.4424255, 0, 1, 0.4705882, 1,
-0.2016477, -1.366671, -2.195067, 0, 1, 0.4784314, 1,
-0.1997488, -0.0880004, -2.525722, 0, 1, 0.4823529, 1,
-0.1975033, 1.077983, 0.3838072, 0, 1, 0.4901961, 1,
-0.1966713, -0.4312139, -5.280435, 0, 1, 0.4941176, 1,
-0.1928787, 0.8470047, -1.060395, 0, 1, 0.5019608, 1,
-0.186829, -1.073542, -3.278692, 0, 1, 0.509804, 1,
-0.1865153, 0.7074544, -0.9907111, 0, 1, 0.5137255, 1,
-0.1832195, -0.7784268, -5.386728, 0, 1, 0.5215687, 1,
-0.181045, 1.269351, -1.220646, 0, 1, 0.5254902, 1,
-0.1794882, 1.26716, -0.5365849, 0, 1, 0.5333334, 1,
-0.1754766, 1.231165, 1.28786, 0, 1, 0.5372549, 1,
-0.1726099, -0.280749, -2.303539, 0, 1, 0.5450981, 1,
-0.1715515, 1.967042, 0.2964793, 0, 1, 0.5490196, 1,
-0.1712497, 1.013337, 0.3814782, 0, 1, 0.5568628, 1,
-0.1693967, 2.493517, -1.90927, 0, 1, 0.5607843, 1,
-0.168489, -0.09604231, -1.902145, 0, 1, 0.5686275, 1,
-0.167086, 0.6733739, -0.9291235, 0, 1, 0.572549, 1,
-0.1591312, -1.043393, -1.905765, 0, 1, 0.5803922, 1,
-0.1566597, 0.1261399, -0.07406826, 0, 1, 0.5843138, 1,
-0.153607, -0.7050653, -3.450079, 0, 1, 0.5921569, 1,
-0.1528231, 0.1256628, -0.7326835, 0, 1, 0.5960785, 1,
-0.15047, 0.144392, -0.4513673, 0, 1, 0.6039216, 1,
-0.1503039, 1.523495, -1.490592, 0, 1, 0.6117647, 1,
-0.1493762, -2.873029, -2.97589, 0, 1, 0.6156863, 1,
-0.1480332, -0.7345261, -1.860675, 0, 1, 0.6235294, 1,
-0.1458672, -0.8424823, -2.349705, 0, 1, 0.627451, 1,
-0.1456379, 0.3271422, -1.346151, 0, 1, 0.6352941, 1,
-0.1441591, -0.8394962, -4.044556, 0, 1, 0.6392157, 1,
-0.1439153, -1.187709, -2.892117, 0, 1, 0.6470588, 1,
-0.1415456, -1.259236, -2.150363, 0, 1, 0.6509804, 1,
-0.1399759, 1.013834, -0.3921529, 0, 1, 0.6588235, 1,
-0.1395004, -0.4485111, -3.454459, 0, 1, 0.6627451, 1,
-0.13855, -0.3198749, -3.548127, 0, 1, 0.6705883, 1,
-0.1350758, 1.341213, 0.6303608, 0, 1, 0.6745098, 1,
-0.1340176, -1.440966, -3.304374, 0, 1, 0.682353, 1,
-0.1262973, 1.361036, -0.5610533, 0, 1, 0.6862745, 1,
-0.1239575, 0.4380343, 1.222388, 0, 1, 0.6941177, 1,
-0.1222492, 0.2079327, 1.411224, 0, 1, 0.7019608, 1,
-0.1193039, -0.008637846, -2.057138, 0, 1, 0.7058824, 1,
-0.1190115, 0.6996533, -1.489268, 0, 1, 0.7137255, 1,
-0.1187267, 0.6233182, -1.02334, 0, 1, 0.7176471, 1,
-0.1175957, -0.2994509, -3.385413, 0, 1, 0.7254902, 1,
-0.1172684, 0.2251562, -0.6315236, 0, 1, 0.7294118, 1,
-0.1147493, -0.7495087, -4.206051, 0, 1, 0.7372549, 1,
-0.1136029, -0.7768325, -2.475921, 0, 1, 0.7411765, 1,
-0.1105974, -0.1127967, -2.268975, 0, 1, 0.7490196, 1,
-0.1092594, 0.0685416, -1.682017, 0, 1, 0.7529412, 1,
-0.1086724, -1.812484, -3.841316, 0, 1, 0.7607843, 1,
-0.1083181, 0.8483247, 2.411988, 0, 1, 0.7647059, 1,
-0.1077097, 0.9935483, -1.581753, 0, 1, 0.772549, 1,
-0.1031922, -0.1614225, -3.313054, 0, 1, 0.7764706, 1,
-0.09701496, -0.7372089, -3.488786, 0, 1, 0.7843137, 1,
-0.08499584, -1.60865, -4.590701, 0, 1, 0.7882353, 1,
-0.08496539, 1.75422, -0.7045549, 0, 1, 0.7960784, 1,
-0.08401919, 0.1313692, -1.18344, 0, 1, 0.8039216, 1,
-0.07651161, 0.5884334, -0.1487992, 0, 1, 0.8078431, 1,
-0.07262032, 0.8504657, 0.2106871, 0, 1, 0.8156863, 1,
-0.06218318, 0.3799614, 0.3498392, 0, 1, 0.8196079, 1,
-0.06195219, 0.9340577, 0.2568888, 0, 1, 0.827451, 1,
-0.0506916, -0.7490923, -3.777099, 0, 1, 0.8313726, 1,
-0.05011765, -0.7277861, -3.298788, 0, 1, 0.8392157, 1,
-0.04543005, -1.220242, -3.749385, 0, 1, 0.8431373, 1,
-0.04292974, 1.433977, -1.067991, 0, 1, 0.8509804, 1,
-0.04173357, -0.1115056, -3.283099, 0, 1, 0.854902, 1,
-0.04147409, 1.532757, 0.2639177, 0, 1, 0.8627451, 1,
-0.03970431, 0.7509988, 0.5137669, 0, 1, 0.8666667, 1,
-0.03231358, 0.1903254, 0.1266327, 0, 1, 0.8745098, 1,
-0.03178795, -0.3950397, -2.979009, 0, 1, 0.8784314, 1,
-0.03012398, 0.9824722, -0.2950874, 0, 1, 0.8862745, 1,
-0.02868602, -1.472102, -3.750896, 0, 1, 0.8901961, 1,
-0.02446639, -1.32979, -3.527575, 0, 1, 0.8980392, 1,
-0.02164475, 0.5243281, -0.4861416, 0, 1, 0.9058824, 1,
-0.01712423, 0.1907805, 0.1991891, 0, 1, 0.9098039, 1,
-0.01585691, -1.593286, -2.595556, 0, 1, 0.9176471, 1,
-0.01556907, 0.8662038, -1.468588, 0, 1, 0.9215686, 1,
-0.009130402, -1.419319, -1.38106, 0, 1, 0.9294118, 1,
-0.003110072, -0.7223154, -1.8728, 0, 1, 0.9333333, 1,
-0.001944012, -0.312123, -3.016919, 0, 1, 0.9411765, 1,
0.00259647, 0.551739, 0.5512779, 0, 1, 0.945098, 1,
0.002697244, 0.8127264, -1.779149, 0, 1, 0.9529412, 1,
0.005239834, -0.2971738, 2.64711, 0, 1, 0.9568627, 1,
0.005272762, 0.4202837, -0.3156569, 0, 1, 0.9647059, 1,
0.01052075, -0.005018301, 1.179828, 0, 1, 0.9686275, 1,
0.01469413, 2.045452, -1.404607, 0, 1, 0.9764706, 1,
0.01729468, -0.1834914, 1.316286, 0, 1, 0.9803922, 1,
0.02618246, 2.041597, -0.9024787, 0, 1, 0.9882353, 1,
0.02752678, 0.1964736, 1.132514, 0, 1, 0.9921569, 1,
0.02948488, 0.6388344, -0.6887583, 0, 1, 1, 1,
0.03215375, 0.168141, -0.8134602, 0, 0.9921569, 1, 1,
0.03237344, 0.7472638, 1.031177, 0, 0.9882353, 1, 1,
0.03305274, -0.3093168, 3.696417, 0, 0.9803922, 1, 1,
0.03387347, -0.5320914, 5.177646, 0, 0.9764706, 1, 1,
0.03443025, 0.5481295, 0.5880353, 0, 0.9686275, 1, 1,
0.04021708, 0.1692368, -0.8257168, 0, 0.9647059, 1, 1,
0.04134606, 0.863959, 0.190117, 0, 0.9568627, 1, 1,
0.04223145, -0.2050751, 4.966251, 0, 0.9529412, 1, 1,
0.04668267, -2.420236, 3.093572, 0, 0.945098, 1, 1,
0.04777625, -1.373011, 2.615266, 0, 0.9411765, 1, 1,
0.04797649, -0.325759, 4.095115, 0, 0.9333333, 1, 1,
0.04891127, -1.005848, 2.799507, 0, 0.9294118, 1, 1,
0.05033485, 0.8148257, 1.883234, 0, 0.9215686, 1, 1,
0.05037201, 0.3197317, 0.2229179, 0, 0.9176471, 1, 1,
0.05159848, -1.632208, 3.104707, 0, 0.9098039, 1, 1,
0.05233687, -0.4637659, 3.156538, 0, 0.9058824, 1, 1,
0.05258771, -2.25527, 1.369441, 0, 0.8980392, 1, 1,
0.05412095, -0.2259472, 3.004318, 0, 0.8901961, 1, 1,
0.05605292, 0.7479373, 0.7664276, 0, 0.8862745, 1, 1,
0.0616991, 0.01039158, 2.314858, 0, 0.8784314, 1, 1,
0.0619501, 0.3596041, -0.5432622, 0, 0.8745098, 1, 1,
0.06201269, 0.09435078, -0.9736214, 0, 0.8666667, 1, 1,
0.06625417, 1.114588, 0.2710643, 0, 0.8627451, 1, 1,
0.06756914, -0.818767, 1.160841, 0, 0.854902, 1, 1,
0.0684446, 0.3176053, 1.875873, 0, 0.8509804, 1, 1,
0.06925298, -0.02096748, 2.959056, 0, 0.8431373, 1, 1,
0.07152707, 1.240201, -1.75784, 0, 0.8392157, 1, 1,
0.07292086, 0.1239482, 1.503478, 0, 0.8313726, 1, 1,
0.07490464, 0.5988045, -0.04387866, 0, 0.827451, 1, 1,
0.07762815, -0.252866, 4.231238, 0, 0.8196079, 1, 1,
0.07867913, -0.3251237, 2.490869, 0, 0.8156863, 1, 1,
0.0818094, -0.3812271, 3.375082, 0, 0.8078431, 1, 1,
0.08449427, 0.2270402, -1.550871, 0, 0.8039216, 1, 1,
0.0891256, -0.278302, 4.03112, 0, 0.7960784, 1, 1,
0.09007273, -0.8971534, 2.531338, 0, 0.7882353, 1, 1,
0.09177157, 0.1021048, 1.705395, 0, 0.7843137, 1, 1,
0.09316933, -0.1329821, 2.524196, 0, 0.7764706, 1, 1,
0.0953135, -1.674482, 2.669664, 0, 0.772549, 1, 1,
0.1024741, 1.357226, -0.6102487, 0, 0.7647059, 1, 1,
0.1027673, -0.463829, 4.941724, 0, 0.7607843, 1, 1,
0.1073082, 0.9792091, 1.006588, 0, 0.7529412, 1, 1,
0.1073158, 0.9124194, 0.6090332, 0, 0.7490196, 1, 1,
0.1087421, 0.04271634, 2.323894, 0, 0.7411765, 1, 1,
0.1119209, 1.083524, 1.156052, 0, 0.7372549, 1, 1,
0.1120242, 1.555024, -0.6049738, 0, 0.7294118, 1, 1,
0.1123373, -0.1112221, 2.735974, 0, 0.7254902, 1, 1,
0.114438, 1.034342, 0.3166779, 0, 0.7176471, 1, 1,
0.1163215, 1.307644, -0.5447477, 0, 0.7137255, 1, 1,
0.1173458, 0.8884826, 0.08546216, 0, 0.7058824, 1, 1,
0.1175867, 0.3835795, 0.2633372, 0, 0.6980392, 1, 1,
0.1228575, 1.493318, -0.6860284, 0, 0.6941177, 1, 1,
0.1253067, -0.1767576, 0.3045228, 0, 0.6862745, 1, 1,
0.1257494, -0.1950423, 4.812024, 0, 0.682353, 1, 1,
0.126582, 0.886663, 0.2104443, 0, 0.6745098, 1, 1,
0.1324511, -0.7807521, 3.974537, 0, 0.6705883, 1, 1,
0.1371833, 0.4200229, 1.217337, 0, 0.6627451, 1, 1,
0.1406737, 1.817745, -0.7196789, 0, 0.6588235, 1, 1,
0.1493323, -1.77401, 4.005965, 0, 0.6509804, 1, 1,
0.1499503, -0.230359, 2.894929, 0, 0.6470588, 1, 1,
0.1520125, 0.3932166, 0.8544052, 0, 0.6392157, 1, 1,
0.1634473, 1.51263, -0.8390714, 0, 0.6352941, 1, 1,
0.1652964, -1.141056, 1.717092, 0, 0.627451, 1, 1,
0.1658796, -1.593658, 4.15824, 0, 0.6235294, 1, 1,
0.166248, 0.03817889, 1.940182, 0, 0.6156863, 1, 1,
0.1666462, -0.04329127, 0.2438237, 0, 0.6117647, 1, 1,
0.1671059, -1.935068, 3.644415, 0, 0.6039216, 1, 1,
0.1684578, -0.1122037, 2.21994, 0, 0.5960785, 1, 1,
0.1697345, 0.623769, 0.8304028, 0, 0.5921569, 1, 1,
0.1699439, -0.8145258, 2.692113, 0, 0.5843138, 1, 1,
0.1732153, 0.1294062, 1.04956, 0, 0.5803922, 1, 1,
0.1743267, 0.7791885, 1.305415, 0, 0.572549, 1, 1,
0.1749648, -1.592938, 4.059466, 0, 0.5686275, 1, 1,
0.1788585, -0.6858879, 4.721231, 0, 0.5607843, 1, 1,
0.1839607, 0.9154989, -0.03587214, 0, 0.5568628, 1, 1,
0.1848292, -0.6961567, 2.255846, 0, 0.5490196, 1, 1,
0.1875871, 0.1580296, -0.0529562, 0, 0.5450981, 1, 1,
0.1882861, -1.521476, 4.612897, 0, 0.5372549, 1, 1,
0.192293, 0.3720656, 0.6974186, 0, 0.5333334, 1, 1,
0.1943302, -0.4906825, 1.730657, 0, 0.5254902, 1, 1,
0.1950374, -0.8190237, 1.013683, 0, 0.5215687, 1, 1,
0.1958936, 0.5906638, -0.5111493, 0, 0.5137255, 1, 1,
0.1961747, 1.044619, 0.786653, 0, 0.509804, 1, 1,
0.2080246, 0.07499187, 1.11607, 0, 0.5019608, 1, 1,
0.2092846, -0.5911502, 2.833193, 0, 0.4941176, 1, 1,
0.2118951, 0.6709302, 0.170901, 0, 0.4901961, 1, 1,
0.2128205, -0.4277364, 2.683666, 0, 0.4823529, 1, 1,
0.2139599, -0.277715, 1.942612, 0, 0.4784314, 1, 1,
0.2178979, -1.881902, 2.80758, 0, 0.4705882, 1, 1,
0.2183656, -2.388065, 3.449914, 0, 0.4666667, 1, 1,
0.2199694, 0.5505893, 1.474421, 0, 0.4588235, 1, 1,
0.2201482, 0.9391117, 2.57029, 0, 0.454902, 1, 1,
0.2225692, 0.6992773, -0.4198081, 0, 0.4470588, 1, 1,
0.2232449, 1.559256, 0.3519696, 0, 0.4431373, 1, 1,
0.2291674, 1.392486, 2.745349, 0, 0.4352941, 1, 1,
0.2335169, -0.4677961, 3.695984, 0, 0.4313726, 1, 1,
0.2372544, -1.03217, 2.828812, 0, 0.4235294, 1, 1,
0.237298, -1.231236, 3.654113, 0, 0.4196078, 1, 1,
0.2392117, -1.493633, 2.572891, 0, 0.4117647, 1, 1,
0.2435542, 0.9820905, 1.271286, 0, 0.4078431, 1, 1,
0.2459487, 2.12808, -0.187932, 0, 0.4, 1, 1,
0.2464236, 0.5038611, 0.3400858, 0, 0.3921569, 1, 1,
0.2466521, -0.4886415, 1.181203, 0, 0.3882353, 1, 1,
0.246918, -0.3123484, 1.723169, 0, 0.3803922, 1, 1,
0.2488613, 0.1230273, 1.570602, 0, 0.3764706, 1, 1,
0.2527437, 0.3403123, 0.5517858, 0, 0.3686275, 1, 1,
0.2529958, 1.392857, 0.4344224, 0, 0.3647059, 1, 1,
0.2539343, 0.310624, 0.6582294, 0, 0.3568628, 1, 1,
0.2545159, 0.2677504, 0.8412656, 0, 0.3529412, 1, 1,
0.2551115, -1.537068, 4.018972, 0, 0.345098, 1, 1,
0.2558445, 1.545061, -0.1726873, 0, 0.3411765, 1, 1,
0.2606043, 0.09520709, 0.6760114, 0, 0.3333333, 1, 1,
0.2607946, 0.9927918, 0.5944234, 0, 0.3294118, 1, 1,
0.2609368, 0.8349144, 0.807521, 0, 0.3215686, 1, 1,
0.2686204, 0.0007885523, 0.03630309, 0, 0.3176471, 1, 1,
0.2690041, 1.284224, 1.029106, 0, 0.3098039, 1, 1,
0.2692021, -0.9633027, 1.954431, 0, 0.3058824, 1, 1,
0.2727094, 0.9432182, -0.8228697, 0, 0.2980392, 1, 1,
0.2794487, -0.5619296, 2.867028, 0, 0.2901961, 1, 1,
0.2812594, 0.5098655, -0.6392685, 0, 0.2862745, 1, 1,
0.286494, -1.526192, 2.940694, 0, 0.2784314, 1, 1,
0.2867638, -0.444024, 2.487329, 0, 0.2745098, 1, 1,
0.2971941, -0.5066368, 3.878283, 0, 0.2666667, 1, 1,
0.2995974, -0.3681704, 2.446212, 0, 0.2627451, 1, 1,
0.3026172, -0.5524432, 2.229448, 0, 0.254902, 1, 1,
0.3039429, -0.6683997, 0.8665248, 0, 0.2509804, 1, 1,
0.3057166, -0.1891141, 2.581637, 0, 0.2431373, 1, 1,
0.3144107, -0.5314375, 3.317359, 0, 0.2392157, 1, 1,
0.3164345, 0.8171322, 0.3804187, 0, 0.2313726, 1, 1,
0.3187595, 0.064303, -0.1926043, 0, 0.227451, 1, 1,
0.3209611, -1.079785, 2.357531, 0, 0.2196078, 1, 1,
0.3245031, -0.5765579, 2.086411, 0, 0.2156863, 1, 1,
0.3252751, 1.11745, -1.074638, 0, 0.2078431, 1, 1,
0.3269396, 0.7895404, 1.259856, 0, 0.2039216, 1, 1,
0.3291451, 0.1135724, 2.698571, 0, 0.1960784, 1, 1,
0.3303606, 0.5610198, 0.4711653, 0, 0.1882353, 1, 1,
0.332718, -0.09216234, 2.19341, 0, 0.1843137, 1, 1,
0.3378328, -0.4585624, 3.970427, 0, 0.1764706, 1, 1,
0.3381985, 0.585535, -2.685739, 0, 0.172549, 1, 1,
0.3402994, 1.005714, 0.3207178, 0, 0.1647059, 1, 1,
0.3562539, -0.6991069, 3.460563, 0, 0.1607843, 1, 1,
0.3604376, -0.2189272, 1.483699, 0, 0.1529412, 1, 1,
0.3617788, 0.08682603, 1.328951, 0, 0.1490196, 1, 1,
0.3627455, -0.8998271, 2.944778, 0, 0.1411765, 1, 1,
0.3767122, 1.778934, 1.226978, 0, 0.1372549, 1, 1,
0.3791047, -0.2316368, 2.143471, 0, 0.1294118, 1, 1,
0.383764, -2.66826, 3.250404, 0, 0.1254902, 1, 1,
0.3872142, -0.2933794, 3.284024, 0, 0.1176471, 1, 1,
0.3916062, -1.469872, 1.837586, 0, 0.1137255, 1, 1,
0.3916849, 0.6804711, 1.735142, 0, 0.1058824, 1, 1,
0.3938579, 0.7838697, 0.02561195, 0, 0.09803922, 1, 1,
0.3960516, 1.017272, 0.4947789, 0, 0.09411765, 1, 1,
0.3967728, -0.2346383, 3.594202, 0, 0.08627451, 1, 1,
0.3997253, -1.212471, 3.598985, 0, 0.08235294, 1, 1,
0.4034336, -0.6488558, 2.647803, 0, 0.07450981, 1, 1,
0.4061213, -1.660306, 3.764564, 0, 0.07058824, 1, 1,
0.4071746, -1.063825, 1.897208, 0, 0.0627451, 1, 1,
0.407654, -0.8520122, 1.158585, 0, 0.05882353, 1, 1,
0.413298, -0.04090666, 1.249096, 0, 0.05098039, 1, 1,
0.4143037, -1.785061, 4.04336, 0, 0.04705882, 1, 1,
0.416678, -0.4246489, 3.452726, 0, 0.03921569, 1, 1,
0.4177459, -0.9123014, 3.671091, 0, 0.03529412, 1, 1,
0.4208549, 0.1213306, 0.2240551, 0, 0.02745098, 1, 1,
0.425165, 1.930717, 0.8537228, 0, 0.02352941, 1, 1,
0.4326952, -0.4071202, 0.7273824, 0, 0.01568628, 1, 1,
0.4346685, -1.546199, 1.59223, 0, 0.01176471, 1, 1,
0.4370577, -0.2547181, 0.3260628, 0, 0.003921569, 1, 1,
0.4384316, -1.28849, 2.734544, 0.003921569, 0, 1, 1,
0.4387118, 0.5909724, 0.9757344, 0.007843138, 0, 1, 1,
0.4416495, -1.768401, 2.270026, 0.01568628, 0, 1, 1,
0.4419684, 0.2020612, 1.285355, 0.01960784, 0, 1, 1,
0.4466368, 0.7606209, 0.143374, 0.02745098, 0, 1, 1,
0.4519381, 0.06371166, 0.06363564, 0.03137255, 0, 1, 1,
0.4557219, -0.03796104, 0.4326514, 0.03921569, 0, 1, 1,
0.4613521, -1.2894, 2.563314, 0.04313726, 0, 1, 1,
0.4659714, 1.421847, -0.6371514, 0.05098039, 0, 1, 1,
0.467231, 0.03492409, 1.917398, 0.05490196, 0, 1, 1,
0.4673187, -0.1366149, 1.144567, 0.0627451, 0, 1, 1,
0.4677432, -0.2237114, 2.005376, 0.06666667, 0, 1, 1,
0.4695806, -0.8191539, 0.4243021, 0.07450981, 0, 1, 1,
0.4760699, 1.363549, -0.9309511, 0.07843138, 0, 1, 1,
0.4787604, -0.07879286, 1.095259, 0.08627451, 0, 1, 1,
0.4842856, 0.8896233, 1.020394, 0.09019608, 0, 1, 1,
0.4859233, 1.644312, 1.277476, 0.09803922, 0, 1, 1,
0.4863089, -2.454639, 3.563513, 0.1058824, 0, 1, 1,
0.4910146, 0.8684636, -0.06193147, 0.1098039, 0, 1, 1,
0.4953296, -2.456558, 2.020917, 0.1176471, 0, 1, 1,
0.4976541, -0.7128206, 1.332306, 0.1215686, 0, 1, 1,
0.4986398, 0.7987882, 0.2726539, 0.1294118, 0, 1, 1,
0.5000442, 0.1752263, 0.5974035, 0.1333333, 0, 1, 1,
0.5048652, 0.3771565, -0.3115545, 0.1411765, 0, 1, 1,
0.5129846, -0.1213931, 0.09449744, 0.145098, 0, 1, 1,
0.5153931, -0.8323534, 3.833447, 0.1529412, 0, 1, 1,
0.518211, 1.824482, -0.1063771, 0.1568628, 0, 1, 1,
0.5185503, 0.556222, 0.7206616, 0.1647059, 0, 1, 1,
0.5209329, 0.8498901, -0.25, 0.1686275, 0, 1, 1,
0.528542, -2.364552, 2.556766, 0.1764706, 0, 1, 1,
0.5302228, 0.9137016, 0.4916499, 0.1803922, 0, 1, 1,
0.5340844, -0.571866, 2.271939, 0.1882353, 0, 1, 1,
0.5395236, 1.497955, 0.46031, 0.1921569, 0, 1, 1,
0.5429491, -1.092574, 2.269327, 0.2, 0, 1, 1,
0.5454567, 1.87443, 1.623196, 0.2078431, 0, 1, 1,
0.5460005, 0.7777145, 0.180933, 0.2117647, 0, 1, 1,
0.546784, -0.3913156, 0.8232697, 0.2196078, 0, 1, 1,
0.5474671, -0.8914518, 4.010751, 0.2235294, 0, 1, 1,
0.5480786, -1.654329, 1.476432, 0.2313726, 0, 1, 1,
0.5536372, -0.3176008, 3.663994, 0.2352941, 0, 1, 1,
0.5560864, 1.098124, 2.722004, 0.2431373, 0, 1, 1,
0.5586363, -1.048562, 2.601779, 0.2470588, 0, 1, 1,
0.5591744, -0.3935109, 2.197346, 0.254902, 0, 1, 1,
0.5599682, 0.4908154, 0.218922, 0.2588235, 0, 1, 1,
0.5670692, 1.409017, 0.9744888, 0.2666667, 0, 1, 1,
0.5703412, -0.6154028, 2.673761, 0.2705882, 0, 1, 1,
0.5743853, -0.8180003, 2.931878, 0.2784314, 0, 1, 1,
0.5751134, 0.4257057, 1.83915, 0.282353, 0, 1, 1,
0.5819452, -0.07829259, 1.461706, 0.2901961, 0, 1, 1,
0.5877544, -1.986972, 4.392913, 0.2941177, 0, 1, 1,
0.588157, 1.361928, -0.0819755, 0.3019608, 0, 1, 1,
0.5903681, -2.10507, 2.477938, 0.3098039, 0, 1, 1,
0.5926751, 1.686802, 0.8283208, 0.3137255, 0, 1, 1,
0.5950338, 1.127673, 2.806233, 0.3215686, 0, 1, 1,
0.5962507, -0.08506609, 1.642466, 0.3254902, 0, 1, 1,
0.6182058, 0.4647174, -0.9718387, 0.3333333, 0, 1, 1,
0.6198118, -0.6995092, 3.249388, 0.3372549, 0, 1, 1,
0.6217291, 0.5904727, 1.569949, 0.345098, 0, 1, 1,
0.625711, 0.06253163, 0.710963, 0.3490196, 0, 1, 1,
0.6291736, 0.3129259, 0.9255188, 0.3568628, 0, 1, 1,
0.6326904, -0.02709669, 1.393425, 0.3607843, 0, 1, 1,
0.6342678, -1.21665, 2.186756, 0.3686275, 0, 1, 1,
0.6363401, 2.920576, 0.05076613, 0.372549, 0, 1, 1,
0.640353, 0.9639928, 0.4946038, 0.3803922, 0, 1, 1,
0.6437237, -0.8959126, 1.97165, 0.3843137, 0, 1, 1,
0.6440024, -1.424917, 1.683761, 0.3921569, 0, 1, 1,
0.6528232, -0.2627195, 3.967139, 0.3960784, 0, 1, 1,
0.6554746, 0.08657513, 3.545242, 0.4039216, 0, 1, 1,
0.6581546, 0.7480602, 1.772544, 0.4117647, 0, 1, 1,
0.6598912, -1.279094, 3.500693, 0.4156863, 0, 1, 1,
0.6649446, -1.250726, 3.143878, 0.4235294, 0, 1, 1,
0.6652527, 1.10331, -0.2731365, 0.427451, 0, 1, 1,
0.6712382, 0.4408007, 1.876932, 0.4352941, 0, 1, 1,
0.6766476, 0.9680445, 1.281365, 0.4392157, 0, 1, 1,
0.6907077, 0.6746083, -0.1245913, 0.4470588, 0, 1, 1,
0.6959996, -1.196231, 1.614947, 0.4509804, 0, 1, 1,
0.6991143, -0.6898621, 2.294372, 0.4588235, 0, 1, 1,
0.7006869, 0.04202302, 0.6257048, 0.4627451, 0, 1, 1,
0.7033817, 1.421796, -0.3027147, 0.4705882, 0, 1, 1,
0.7045131, -0.2386501, 2.058043, 0.4745098, 0, 1, 1,
0.705462, 0.2297932, 3.441553, 0.4823529, 0, 1, 1,
0.7153825, 0.2967049, 1.931054, 0.4862745, 0, 1, 1,
0.7174743, -0.1912537, 1.164141, 0.4941176, 0, 1, 1,
0.7176297, -0.580394, 3.486982, 0.5019608, 0, 1, 1,
0.7188385, -1.098323, 3.323725, 0.5058824, 0, 1, 1,
0.7206047, 0.7931761, 1.321448, 0.5137255, 0, 1, 1,
0.7218003, 0.2336169, 2.336607, 0.5176471, 0, 1, 1,
0.7240742, 0.8430815, 3.728897, 0.5254902, 0, 1, 1,
0.7260347, -0.4247292, 1.505476, 0.5294118, 0, 1, 1,
0.730149, 0.7739375, 0.161832, 0.5372549, 0, 1, 1,
0.7306837, -0.3921036, 0.7165892, 0.5411765, 0, 1, 1,
0.7359115, -0.05317275, 2.373443, 0.5490196, 0, 1, 1,
0.7364898, -0.677756, 1.554197, 0.5529412, 0, 1, 1,
0.7366278, 1.523976, 1.264057, 0.5607843, 0, 1, 1,
0.7386551, 0.4294353, 0.1448046, 0.5647059, 0, 1, 1,
0.7431156, -0.8337719, 3.175524, 0.572549, 0, 1, 1,
0.7487419, -0.05395469, 1.39543, 0.5764706, 0, 1, 1,
0.749432, 1.808417, -0.03856362, 0.5843138, 0, 1, 1,
0.7515659, 1.561914, 0.04735962, 0.5882353, 0, 1, 1,
0.7530251, -0.7327981, 3.726373, 0.5960785, 0, 1, 1,
0.7539186, -0.1189716, 2.08413, 0.6039216, 0, 1, 1,
0.7564356, 1.54195, -0.2989012, 0.6078432, 0, 1, 1,
0.7570429, -1.829638, 2.726166, 0.6156863, 0, 1, 1,
0.7582985, 0.5224826, 2.984066, 0.6196079, 0, 1, 1,
0.7643005, 0.2121744, 1.88434, 0.627451, 0, 1, 1,
0.7709506, -0.06452785, 2.199777, 0.6313726, 0, 1, 1,
0.7736134, 0.6718941, 0.2444391, 0.6392157, 0, 1, 1,
0.774511, -1.590194, 4.732069, 0.6431373, 0, 1, 1,
0.7764851, -0.249819, 2.616508, 0.6509804, 0, 1, 1,
0.7787855, 0.101659, -0.4292015, 0.654902, 0, 1, 1,
0.7817428, 0.1619819, 2.119503, 0.6627451, 0, 1, 1,
0.7821207, -0.2663034, 1.976615, 0.6666667, 0, 1, 1,
0.7834362, 1.408073, 1.36488, 0.6745098, 0, 1, 1,
0.7929623, 1.72043, 0.006099428, 0.6784314, 0, 1, 1,
0.7932551, 1.216794, 1.674003, 0.6862745, 0, 1, 1,
0.8031942, 0.9570721, 0.6186987, 0.6901961, 0, 1, 1,
0.8090628, 1.177255, 2.364674, 0.6980392, 0, 1, 1,
0.8097007, 0.6813201, 0.627347, 0.7058824, 0, 1, 1,
0.8107665, 0.8108357, 0.8455743, 0.7098039, 0, 1, 1,
0.8108149, 0.8503835, 1.303754, 0.7176471, 0, 1, 1,
0.8118483, -2.294339, 4.138498, 0.7215686, 0, 1, 1,
0.8171659, 0.5603049, 1.293166, 0.7294118, 0, 1, 1,
0.8189492, -0.6999577, 2.461986, 0.7333333, 0, 1, 1,
0.8255576, 0.3894608, 4.037998, 0.7411765, 0, 1, 1,
0.8333665, -1.004267, 4.033867, 0.7450981, 0, 1, 1,
0.8379633, -0.5126042, 2.15802, 0.7529412, 0, 1, 1,
0.8386527, -1.012462, 3.46141, 0.7568628, 0, 1, 1,
0.8452122, -0.192543, 0.5841149, 0.7647059, 0, 1, 1,
0.8477701, 0.8733833, -0.9587131, 0.7686275, 0, 1, 1,
0.8565442, -0.6612535, 3.308149, 0.7764706, 0, 1, 1,
0.856945, -0.1825576, 2.806501, 0.7803922, 0, 1, 1,
0.8624449, 1.321526, 2.594991, 0.7882353, 0, 1, 1,
0.8666466, -0.6848999, 1.809123, 0.7921569, 0, 1, 1,
0.8713753, -1.46221, 2.455163, 0.8, 0, 1, 1,
0.8730911, 0.8337627, 2.40448, 0.8078431, 0, 1, 1,
0.8763691, 1.233975, -0.01381529, 0.8117647, 0, 1, 1,
0.8778997, 0.6403372, 1.633499, 0.8196079, 0, 1, 1,
0.8796307, 2.387285, -0.4380763, 0.8235294, 0, 1, 1,
0.8914785, -0.7557154, 2.310652, 0.8313726, 0, 1, 1,
0.8937783, -1.456077, 1.122174, 0.8352941, 0, 1, 1,
0.8982999, -1.301533, 2.777393, 0.8431373, 0, 1, 1,
0.8995696, -0.3266297, 0.7827123, 0.8470588, 0, 1, 1,
0.9007989, -1.234301, 2.392887, 0.854902, 0, 1, 1,
0.9032744, 0.6636225, -0.05876024, 0.8588235, 0, 1, 1,
0.9034522, -1.066256, 1.754887, 0.8666667, 0, 1, 1,
0.905353, 0.3887587, 0.7694677, 0.8705882, 0, 1, 1,
0.9054169, -0.9818229, 1.4677, 0.8784314, 0, 1, 1,
0.9072519, 1.011321, -1.028653, 0.8823529, 0, 1, 1,
0.9076983, -0.229105, 2.548316, 0.8901961, 0, 1, 1,
0.9115807, -0.5352873, 3.432824, 0.8941177, 0, 1, 1,
0.9129534, -0.4868481, 2.569778, 0.9019608, 0, 1, 1,
0.9130783, 0.423446, 1.549167, 0.9098039, 0, 1, 1,
0.9153621, -2.271934, 2.318354, 0.9137255, 0, 1, 1,
0.9198221, -0.5815127, 2.011817, 0.9215686, 0, 1, 1,
0.924163, -1.678112, 2.61556, 0.9254902, 0, 1, 1,
0.9289774, 0.1394283, 3.207796, 0.9333333, 0, 1, 1,
0.9329934, 0.2554896, -0.1469566, 0.9372549, 0, 1, 1,
0.9396691, 0.9121314, 0.5632378, 0.945098, 0, 1, 1,
0.9505367, 0.8555551, 2.38285, 0.9490196, 0, 1, 1,
0.9572531, -0.7597709, 3.214861, 0.9568627, 0, 1, 1,
0.959483, -0.1757856, 1.016422, 0.9607843, 0, 1, 1,
0.9630414, -0.3069416, 1.774579, 0.9686275, 0, 1, 1,
0.9641476, 1.53608, 1.667968, 0.972549, 0, 1, 1,
0.9704853, -0.5677595, 2.866061, 0.9803922, 0, 1, 1,
0.9706931, -0.2617142, 0.751978, 0.9843137, 0, 1, 1,
0.971883, -0.5674713, 2.063007, 0.9921569, 0, 1, 1,
0.9732738, -0.1910664, 2.600107, 0.9960784, 0, 1, 1,
0.9737852, 0.4645078, 0.4845343, 1, 0, 0.9960784, 1,
0.9804304, -0.5746622, 0.2055717, 1, 0, 0.9882353, 1,
0.9936587, 0.4285366, 1.238677, 1, 0, 0.9843137, 1,
0.9957548, 0.9495547, 1.331403, 1, 0, 0.9764706, 1,
1.002432, -1.400833, 2.501591, 1, 0, 0.972549, 1,
1.005328, 0.5300487, 1.185522, 1, 0, 0.9647059, 1,
1.008251, -0.6736088, 2.27129, 1, 0, 0.9607843, 1,
1.009164, -1.445432, 0.8734265, 1, 0, 0.9529412, 1,
1.011093, 2.043334, -0.7122698, 1, 0, 0.9490196, 1,
1.023388, 1.031161, -1.014528, 1, 0, 0.9411765, 1,
1.026911, -0.3378048, 3.089718, 1, 0, 0.9372549, 1,
1.036171, 0.6669509, 0.6346628, 1, 0, 0.9294118, 1,
1.038039, -0.1072912, 0.7043594, 1, 0, 0.9254902, 1,
1.048392, -1.082125, 2.316006, 1, 0, 0.9176471, 1,
1.050566, 0.6436693, 2.493085, 1, 0, 0.9137255, 1,
1.050753, -0.3816648, 2.288922, 1, 0, 0.9058824, 1,
1.060391, -1.366126, 2.383515, 1, 0, 0.9019608, 1,
1.060743, -0.8914827, 1.128942, 1, 0, 0.8941177, 1,
1.06487, 1.278571, -0.5639725, 1, 0, 0.8862745, 1,
1.069096, -0.4418184, 2.472537, 1, 0, 0.8823529, 1,
1.07019, 0.2792769, 0.5666116, 1, 0, 0.8745098, 1,
1.074727, 1.830498, 1.774133, 1, 0, 0.8705882, 1,
1.086395, 0.9863124, -0.1150626, 1, 0, 0.8627451, 1,
1.090309, 0.7914183, 2.334186, 1, 0, 0.8588235, 1,
1.101406, 1.850166, 1.455682, 1, 0, 0.8509804, 1,
1.10182, -0.9031575, 2.72689, 1, 0, 0.8470588, 1,
1.102232, -1.57356, 2.388039, 1, 0, 0.8392157, 1,
1.106869, -1.310721, 2.749091, 1, 0, 0.8352941, 1,
1.107281, -1.259485, 3.00056, 1, 0, 0.827451, 1,
1.109462, -0.3066163, 2.896586, 1, 0, 0.8235294, 1,
1.111253, -2.545549, 3.05067, 1, 0, 0.8156863, 1,
1.111518, -0.4434902, 0.6315687, 1, 0, 0.8117647, 1,
1.116686, 0.1709301, 1.719055, 1, 0, 0.8039216, 1,
1.118593, -1.409182, 2.72847, 1, 0, 0.7960784, 1,
1.136539, -0.445263, 0.8896625, 1, 0, 0.7921569, 1,
1.141411, -0.1233214, 1.728225, 1, 0, 0.7843137, 1,
1.144424, 1.583813, 0.677002, 1, 0, 0.7803922, 1,
1.146667, 1.00956, 0.4673445, 1, 0, 0.772549, 1,
1.157569, 0.3885857, 2.765691, 1, 0, 0.7686275, 1,
1.162359, -0.6486983, 0.3956514, 1, 0, 0.7607843, 1,
1.168025, 1.958169, 0.2935138, 1, 0, 0.7568628, 1,
1.1755, 0.638546, 1.300091, 1, 0, 0.7490196, 1,
1.17561, 0.08631307, 1.832924, 1, 0, 0.7450981, 1,
1.179609, -0.3526627, 2.555046, 1, 0, 0.7372549, 1,
1.183295, -1.059242, 2.767524, 1, 0, 0.7333333, 1,
1.188215, -0.385462, 1.718148, 1, 0, 0.7254902, 1,
1.189023, 1.718775, 0.3015899, 1, 0, 0.7215686, 1,
1.191002, 0.655467, 0.03324832, 1, 0, 0.7137255, 1,
1.196603, 1.059664, 1.527914, 1, 0, 0.7098039, 1,
1.197107, 0.2992121, 1.514766, 1, 0, 0.7019608, 1,
1.212041, -0.05823592, 3.195444, 1, 0, 0.6941177, 1,
1.218441, -0.1706203, -0.1404395, 1, 0, 0.6901961, 1,
1.227573, 2.104616, 0.9265648, 1, 0, 0.682353, 1,
1.235068, -0.4273711, 1.437572, 1, 0, 0.6784314, 1,
1.240169, 0.9097126, -1.011071, 1, 0, 0.6705883, 1,
1.241204, -1.017323, 1.703951, 1, 0, 0.6666667, 1,
1.244041, -0.2619401, 2.855221, 1, 0, 0.6588235, 1,
1.24568, -0.2809543, 0.4036345, 1, 0, 0.654902, 1,
1.258598, 0.02913328, 2.509213, 1, 0, 0.6470588, 1,
1.258949, 0.5269777, -0.09267672, 1, 0, 0.6431373, 1,
1.260433, 0.2042631, 1.419954, 1, 0, 0.6352941, 1,
1.272909, -1.012524, 1.005053, 1, 0, 0.6313726, 1,
1.273645, 0.6931275, 0.04190239, 1, 0, 0.6235294, 1,
1.277292, -1.723195, 3.721519, 1, 0, 0.6196079, 1,
1.285847, 0.4490494, 3.073669, 1, 0, 0.6117647, 1,
1.289249, 1.929513, 0.6935534, 1, 0, 0.6078432, 1,
1.297806, -0.1805021, 1.479467, 1, 0, 0.6, 1,
1.307277, -0.2292645, 0.8795084, 1, 0, 0.5921569, 1,
1.31856, 0.2924868, 1.909078, 1, 0, 0.5882353, 1,
1.321759, -0.6152651, 1.837927, 1, 0, 0.5803922, 1,
1.322907, -0.8289375, 2.644438, 1, 0, 0.5764706, 1,
1.335963, 0.3135546, 1.793833, 1, 0, 0.5686275, 1,
1.339148, 0.02365945, -0.2705879, 1, 0, 0.5647059, 1,
1.344986, -1.70633, 1.511473, 1, 0, 0.5568628, 1,
1.346363, 0.5874711, 1.522127, 1, 0, 0.5529412, 1,
1.350522, 0.9911798, 1.139618, 1, 0, 0.5450981, 1,
1.357596, 0.4800529, 2.325064, 1, 0, 0.5411765, 1,
1.360098, -0.2209822, 1.677108, 1, 0, 0.5333334, 1,
1.377486, 0.7735281, 1.736112, 1, 0, 0.5294118, 1,
1.379198, -0.7500175, 2.944289, 1, 0, 0.5215687, 1,
1.380171, 0.6393018, 1.017906, 1, 0, 0.5176471, 1,
1.385295, -0.01084164, 0.9497003, 1, 0, 0.509804, 1,
1.390638, -1.380357, 2.395795, 1, 0, 0.5058824, 1,
1.398872, 0.9190784, 0.3686419, 1, 0, 0.4980392, 1,
1.404992, 0.1216415, 2.837863, 1, 0, 0.4901961, 1,
1.410938, -0.8373645, -1.566283, 1, 0, 0.4862745, 1,
1.413607, -0.6944391, 3.023479, 1, 0, 0.4784314, 1,
1.429389, -0.1512431, 0.1992517, 1, 0, 0.4745098, 1,
1.4306, -1.221598, 2.566054, 1, 0, 0.4666667, 1,
1.437765, 1.432434, 0.851842, 1, 0, 0.4627451, 1,
1.447817, -0.1133141, 0.2039073, 1, 0, 0.454902, 1,
1.468437, 2.566071, -0.4468521, 1, 0, 0.4509804, 1,
1.47187, -0.3030494, 0.989937, 1, 0, 0.4431373, 1,
1.472117, -0.9346328, 3.110041, 1, 0, 0.4392157, 1,
1.476784, -1.262764, 2.177701, 1, 0, 0.4313726, 1,
1.484861, -1.314391, 2.551852, 1, 0, 0.427451, 1,
1.485792, 0.7048268, 0.9282953, 1, 0, 0.4196078, 1,
1.486835, 2.226693, 0.633368, 1, 0, 0.4156863, 1,
1.504569, -0.1286126, 3.661536, 1, 0, 0.4078431, 1,
1.504906, -0.1178515, 2.039506, 1, 0, 0.4039216, 1,
1.507422, -0.3405054, 1.281654, 1, 0, 0.3960784, 1,
1.508562, -1.664959, 4.152048, 1, 0, 0.3882353, 1,
1.513234, -1.875158, 2.52316, 1, 0, 0.3843137, 1,
1.52343, 0.4609824, 1.353192, 1, 0, 0.3764706, 1,
1.526169, 0.5168674, 1.391356, 1, 0, 0.372549, 1,
1.52694, 1.189158, 1.297506, 1, 0, 0.3647059, 1,
1.531473, 0.9564239, 0.02699262, 1, 0, 0.3607843, 1,
1.533106, 0.4395013, 0.6676354, 1, 0, 0.3529412, 1,
1.533807, 0.1461438, 0.1604493, 1, 0, 0.3490196, 1,
1.53907, -0.3571198, 2.532307, 1, 0, 0.3411765, 1,
1.54806, 0.2178103, 2.403507, 1, 0, 0.3372549, 1,
1.549219, 0.6488667, 2.04112, 1, 0, 0.3294118, 1,
1.556194, 0.2002723, -0.5069175, 1, 0, 0.3254902, 1,
1.567684, -0.6026674, 0.9350706, 1, 0, 0.3176471, 1,
1.575375, 0.02195843, 1.197984, 1, 0, 0.3137255, 1,
1.584284, -1.047652, 3.612036, 1, 0, 0.3058824, 1,
1.586364, 0.2365061, 1.58238, 1, 0, 0.2980392, 1,
1.597736, -1.087556, 2.21844, 1, 0, 0.2941177, 1,
1.61906, -0.09368135, 2.311307, 1, 0, 0.2862745, 1,
1.624627, 0.176621, 0.8951993, 1, 0, 0.282353, 1,
1.627836, -0.785365, 1.726126, 1, 0, 0.2745098, 1,
1.631447, 1.614128, 0.7343324, 1, 0, 0.2705882, 1,
1.635872, 2.590701, 0.09729919, 1, 0, 0.2627451, 1,
1.640576, 0.3924829, 1.014646, 1, 0, 0.2588235, 1,
1.642693, 0.2588212, 1.337226, 1, 0, 0.2509804, 1,
1.647057, -1.128505, 0.9360352, 1, 0, 0.2470588, 1,
1.6676, 2.330337, 0.1818788, 1, 0, 0.2392157, 1,
1.6741, 0.9125965, 0.9476053, 1, 0, 0.2352941, 1,
1.676828, -0.4831401, 0.9255295, 1, 0, 0.227451, 1,
1.688054, -0.003177557, 2.559255, 1, 0, 0.2235294, 1,
1.688551, -0.4806022, -0.220314, 1, 0, 0.2156863, 1,
1.721534, 0.4308403, 2.40692, 1, 0, 0.2117647, 1,
1.729427, -0.7247143, 2.152408, 1, 0, 0.2039216, 1,
1.731951, -0.9972886, 2.532872, 1, 0, 0.1960784, 1,
1.780799, 0.3141059, 2.827588, 1, 0, 0.1921569, 1,
1.781429, 0.7283384, -0.8419418, 1, 0, 0.1843137, 1,
1.786761, -0.03169262, 1.945093, 1, 0, 0.1803922, 1,
1.829831, -1.035009, 1.940583, 1, 0, 0.172549, 1,
1.83746, 0.1369694, 1.735706, 1, 0, 0.1686275, 1,
1.839063, 0.7103191, 0.379247, 1, 0, 0.1607843, 1,
1.896888, -1.870106, 2.206518, 1, 0, 0.1568628, 1,
1.903677, -0.0196804, 2.918974, 1, 0, 0.1490196, 1,
1.904052, 0.3108949, 2.854511, 1, 0, 0.145098, 1,
1.953943, 0.7390003, 0.2881946, 1, 0, 0.1372549, 1,
1.961667, -0.7516507, 2.806837, 1, 0, 0.1333333, 1,
1.971763, 0.9690333, -0.3972458, 1, 0, 0.1254902, 1,
1.97204, 0.372061, 2.858625, 1, 0, 0.1215686, 1,
1.980549, 0.5432515, 2.818144, 1, 0, 0.1137255, 1,
1.990536, -1.879735, 0.1693229, 1, 0, 0.1098039, 1,
2.01028, -1.153043, 3.821447, 1, 0, 0.1019608, 1,
2.029425, -1.000378, 0.2815112, 1, 0, 0.09411765, 1,
2.085847, -0.6757318, 1.2969, 1, 0, 0.09019608, 1,
2.09662, 1.123308, 0.4229405, 1, 0, 0.08235294, 1,
2.125631, -2.191223, 2.103294, 1, 0, 0.07843138, 1,
2.153823, 0.1534651, 1.454137, 1, 0, 0.07058824, 1,
2.182177, 0.01278079, 1.558292, 1, 0, 0.06666667, 1,
2.198924, -1.145192, 0.7552912, 1, 0, 0.05882353, 1,
2.246921, -0.4965901, 1.69544, 1, 0, 0.05490196, 1,
2.247959, -0.2543335, 2.915979, 1, 0, 0.04705882, 1,
2.251009, -0.5724608, 1.17745, 1, 0, 0.04313726, 1,
2.310041, -1.179284, 1.478555, 1, 0, 0.03529412, 1,
2.524746, -0.3937318, 2.440361, 1, 0, 0.03137255, 1,
2.546095, 0.4009928, -0.1810225, 1, 0, 0.02352941, 1,
2.567549, 0.6632895, 0.6961523, 1, 0, 0.01960784, 1,
2.693476, 0.2254062, 1.11425, 1, 0, 0.01176471, 1,
2.930995, -0.8468877, 0.6325604, 1, 0, 0.007843138, 1
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
-0.07621217, -4.729527, -7.225575, 0, -0.5, 0.5, 0.5,
-0.07621217, -4.729527, -7.225575, 1, -0.5, 0.5, 0.5,
-0.07621217, -4.729527, -7.225575, 1, 1.5, 0.5, 0.5,
-0.07621217, -4.729527, -7.225575, 0, 1.5, 0.5, 0.5
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
-4.102862, -0.3500968, -7.225575, 0, -0.5, 0.5, 0.5,
-4.102862, -0.3500968, -7.225575, 1, -0.5, 0.5, 0.5,
-4.102862, -0.3500968, -7.225575, 1, 1.5, 0.5, 0.5,
-4.102862, -0.3500968, -7.225575, 0, 1.5, 0.5, 0.5
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
-4.102862, -4.729527, -0.1251423, 0, -0.5, 0.5, 0.5,
-4.102862, -4.729527, -0.1251423, 1, -0.5, 0.5, 0.5,
-4.102862, -4.729527, -0.1251423, 1, 1.5, 0.5, 0.5,
-4.102862, -4.729527, -0.1251423, 0, 1.5, 0.5, 0.5
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
-3, -3.71889, -5.587014,
2, -3.71889, -5.587014,
-3, -3.71889, -5.587014,
-3, -3.887329, -5.860107,
-2, -3.71889, -5.587014,
-2, -3.887329, -5.860107,
-1, -3.71889, -5.587014,
-1, -3.887329, -5.860107,
0, -3.71889, -5.587014,
0, -3.887329, -5.860107,
1, -3.71889, -5.587014,
1, -3.887329, -5.860107,
2, -3.71889, -5.587014,
2, -3.887329, -5.860107
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
-3, -4.224209, -6.406295, 0, -0.5, 0.5, 0.5,
-3, -4.224209, -6.406295, 1, -0.5, 0.5, 0.5,
-3, -4.224209, -6.406295, 1, 1.5, 0.5, 0.5,
-3, -4.224209, -6.406295, 0, 1.5, 0.5, 0.5,
-2, -4.224209, -6.406295, 0, -0.5, 0.5, 0.5,
-2, -4.224209, -6.406295, 1, -0.5, 0.5, 0.5,
-2, -4.224209, -6.406295, 1, 1.5, 0.5, 0.5,
-2, -4.224209, -6.406295, 0, 1.5, 0.5, 0.5,
-1, -4.224209, -6.406295, 0, -0.5, 0.5, 0.5,
-1, -4.224209, -6.406295, 1, -0.5, 0.5, 0.5,
-1, -4.224209, -6.406295, 1, 1.5, 0.5, 0.5,
-1, -4.224209, -6.406295, 0, 1.5, 0.5, 0.5,
0, -4.224209, -6.406295, 0, -0.5, 0.5, 0.5,
0, -4.224209, -6.406295, 1, -0.5, 0.5, 0.5,
0, -4.224209, -6.406295, 1, 1.5, 0.5, 0.5,
0, -4.224209, -6.406295, 0, 1.5, 0.5, 0.5,
1, -4.224209, -6.406295, 0, -0.5, 0.5, 0.5,
1, -4.224209, -6.406295, 1, -0.5, 0.5, 0.5,
1, -4.224209, -6.406295, 1, 1.5, 0.5, 0.5,
1, -4.224209, -6.406295, 0, 1.5, 0.5, 0.5,
2, -4.224209, -6.406295, 0, -0.5, 0.5, 0.5,
2, -4.224209, -6.406295, 1, -0.5, 0.5, 0.5,
2, -4.224209, -6.406295, 1, 1.5, 0.5, 0.5,
2, -4.224209, -6.406295, 0, 1.5, 0.5, 0.5
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
-3.173635, -3, -5.587014,
-3.173635, 2, -5.587014,
-3.173635, -3, -5.587014,
-3.328507, -3, -5.860107,
-3.173635, -2, -5.587014,
-3.328507, -2, -5.860107,
-3.173635, -1, -5.587014,
-3.328507, -1, -5.860107,
-3.173635, 0, -5.587014,
-3.328507, 0, -5.860107,
-3.173635, 1, -5.587014,
-3.328507, 1, -5.860107,
-3.173635, 2, -5.587014,
-3.328507, 2, -5.860107
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
-3.638249, -3, -6.406295, 0, -0.5, 0.5, 0.5,
-3.638249, -3, -6.406295, 1, -0.5, 0.5, 0.5,
-3.638249, -3, -6.406295, 1, 1.5, 0.5, 0.5,
-3.638249, -3, -6.406295, 0, 1.5, 0.5, 0.5,
-3.638249, -2, -6.406295, 0, -0.5, 0.5, 0.5,
-3.638249, -2, -6.406295, 1, -0.5, 0.5, 0.5,
-3.638249, -2, -6.406295, 1, 1.5, 0.5, 0.5,
-3.638249, -2, -6.406295, 0, 1.5, 0.5, 0.5,
-3.638249, -1, -6.406295, 0, -0.5, 0.5, 0.5,
-3.638249, -1, -6.406295, 1, -0.5, 0.5, 0.5,
-3.638249, -1, -6.406295, 1, 1.5, 0.5, 0.5,
-3.638249, -1, -6.406295, 0, 1.5, 0.5, 0.5,
-3.638249, 0, -6.406295, 0, -0.5, 0.5, 0.5,
-3.638249, 0, -6.406295, 1, -0.5, 0.5, 0.5,
-3.638249, 0, -6.406295, 1, 1.5, 0.5, 0.5,
-3.638249, 0, -6.406295, 0, 1.5, 0.5, 0.5,
-3.638249, 1, -6.406295, 0, -0.5, 0.5, 0.5,
-3.638249, 1, -6.406295, 1, -0.5, 0.5, 0.5,
-3.638249, 1, -6.406295, 1, 1.5, 0.5, 0.5,
-3.638249, 1, -6.406295, 0, 1.5, 0.5, 0.5,
-3.638249, 2, -6.406295, 0, -0.5, 0.5, 0.5,
-3.638249, 2, -6.406295, 1, -0.5, 0.5, 0.5,
-3.638249, 2, -6.406295, 1, 1.5, 0.5, 0.5,
-3.638249, 2, -6.406295, 0, 1.5, 0.5, 0.5
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
-3.173635, -3.71889, -4,
-3.173635, -3.71889, 4,
-3.173635, -3.71889, -4,
-3.328507, -3.887329, -4,
-3.173635, -3.71889, -2,
-3.328507, -3.887329, -2,
-3.173635, -3.71889, 0,
-3.328507, -3.887329, 0,
-3.173635, -3.71889, 2,
-3.328507, -3.887329, 2,
-3.173635, -3.71889, 4,
-3.328507, -3.887329, 4
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
-3.638249, -4.224209, -4, 0, -0.5, 0.5, 0.5,
-3.638249, -4.224209, -4, 1, -0.5, 0.5, 0.5,
-3.638249, -4.224209, -4, 1, 1.5, 0.5, 0.5,
-3.638249, -4.224209, -4, 0, 1.5, 0.5, 0.5,
-3.638249, -4.224209, -2, 0, -0.5, 0.5, 0.5,
-3.638249, -4.224209, -2, 1, -0.5, 0.5, 0.5,
-3.638249, -4.224209, -2, 1, 1.5, 0.5, 0.5,
-3.638249, -4.224209, -2, 0, 1.5, 0.5, 0.5,
-3.638249, -4.224209, 0, 0, -0.5, 0.5, 0.5,
-3.638249, -4.224209, 0, 1, -0.5, 0.5, 0.5,
-3.638249, -4.224209, 0, 1, 1.5, 0.5, 0.5,
-3.638249, -4.224209, 0, 0, 1.5, 0.5, 0.5,
-3.638249, -4.224209, 2, 0, -0.5, 0.5, 0.5,
-3.638249, -4.224209, 2, 1, -0.5, 0.5, 0.5,
-3.638249, -4.224209, 2, 1, 1.5, 0.5, 0.5,
-3.638249, -4.224209, 2, 0, 1.5, 0.5, 0.5,
-3.638249, -4.224209, 4, 0, -0.5, 0.5, 0.5,
-3.638249, -4.224209, 4, 1, -0.5, 0.5, 0.5,
-3.638249, -4.224209, 4, 1, 1.5, 0.5, 0.5,
-3.638249, -4.224209, 4, 0, 1.5, 0.5, 0.5
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
-3.173635, -3.71889, -5.587014,
-3.173635, 3.018696, -5.587014,
-3.173635, -3.71889, 5.33673,
-3.173635, 3.018696, 5.33673,
-3.173635, -3.71889, -5.587014,
-3.173635, -3.71889, 5.33673,
-3.173635, 3.018696, -5.587014,
-3.173635, 3.018696, 5.33673,
-3.173635, -3.71889, -5.587014,
3.021211, -3.71889, -5.587014,
-3.173635, -3.71889, 5.33673,
3.021211, -3.71889, 5.33673,
-3.173635, 3.018696, -5.587014,
3.021211, 3.018696, -5.587014,
-3.173635, 3.018696, 5.33673,
3.021211, 3.018696, 5.33673,
3.021211, -3.71889, -5.587014,
3.021211, 3.018696, -5.587014,
3.021211, -3.71889, 5.33673,
3.021211, 3.018696, 5.33673,
3.021211, -3.71889, -5.587014,
3.021211, -3.71889, 5.33673,
3.021211, 3.018696, -5.587014,
3.021211, 3.018696, 5.33673
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
var radius = 7.609914;
var distance = 33.85736;
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
mvMatrix.translate( 0.07621217, 0.3500968, 0.1251423 );
mvMatrix.scale( 1.328199, 1.221207, 0.7532206 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.85736);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Cadusafos<-read.table("Cadusafos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Cadusafos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Cadusafos' not found
```

```r
y<-Cadusafos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Cadusafos' not found
```

```r
z<-Cadusafos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Cadusafos' not found
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
-3.083419, 1.749972, -0.9485243, 0, 0, 1, 1, 1,
-2.884005, -1.716903, -2.840589, 1, 0, 0, 1, 1,
-2.649532, 0.5850172, -3.876523, 1, 0, 0, 1, 1,
-2.566198, -0.7791575, -2.183897, 1, 0, 0, 1, 1,
-2.560431, -0.03089453, -1.783223, 1, 0, 0, 1, 1,
-2.534319, -1.738254, -2.797369, 1, 0, 0, 1, 1,
-2.523339, -0.3478142, -2.838747, 0, 0, 0, 1, 1,
-2.523142, -0.8463116, -3.198088, 0, 0, 0, 1, 1,
-2.499314, -1.349381, -1.696188, 0, 0, 0, 1, 1,
-2.364588, 0.3155514, -0.707566, 0, 0, 0, 1, 1,
-2.299124, -0.3386485, -1.362681, 0, 0, 0, 1, 1,
-2.280023, 0.8744177, -0.0197547, 0, 0, 0, 1, 1,
-2.223512, -1.30958, -1.278801, 0, 0, 0, 1, 1,
-2.182734, -0.8165467, -3.604389, 1, 1, 1, 1, 1,
-2.18226, 1.044784, -1.296935, 1, 1, 1, 1, 1,
-2.139082, -0.7341379, -2.600251, 1, 1, 1, 1, 1,
-2.137634, 1.091223, -0.34357, 1, 1, 1, 1, 1,
-2.074966, 0.0006830295, -3.069837, 1, 1, 1, 1, 1,
-2.056358, 0.09956725, -2.500315, 1, 1, 1, 1, 1,
-2.048411, -0.6937824, -3.890235, 1, 1, 1, 1, 1,
-2.03822, 1.897866, -0.2498213, 1, 1, 1, 1, 1,
-2.020678, 0.2024415, -2.10162, 1, 1, 1, 1, 1,
-2.008065, 0.1112758, -1.522029, 1, 1, 1, 1, 1,
-2.00568, 1.587232, -1.023334, 1, 1, 1, 1, 1,
-2.001884, -1.627872, -1.981729, 1, 1, 1, 1, 1,
-1.954843, -0.4431945, -2.643661, 1, 1, 1, 1, 1,
-1.954409, 0.8344261, -2.82435, 1, 1, 1, 1, 1,
-1.937647, 0.7443473, -1.662938, 1, 1, 1, 1, 1,
-1.907686, -0.270368, -2.633401, 0, 0, 1, 1, 1,
-1.812606, 1.675828, -2.081155, 1, 0, 0, 1, 1,
-1.806201, -1.934928, -1.247965, 1, 0, 0, 1, 1,
-1.766521, -0.5418774, -2.877475, 1, 0, 0, 1, 1,
-1.753595, -0.4572221, -2.275471, 1, 0, 0, 1, 1,
-1.751741, 1.942796, -0.2710532, 1, 0, 0, 1, 1,
-1.745961, -0.3894504, -2.118523, 0, 0, 0, 1, 1,
-1.745409, -1.562475, -3.195125, 0, 0, 0, 1, 1,
-1.739918, 0.07132389, -0.5718561, 0, 0, 0, 1, 1,
-1.714746, 1.501164, -0.5929236, 0, 0, 0, 1, 1,
-1.69835, -0.8947065, -2.887408, 0, 0, 0, 1, 1,
-1.692435, -0.7075492, -1.429597, 0, 0, 0, 1, 1,
-1.685534, -0.8283339, -0.5574908, 0, 0, 0, 1, 1,
-1.682058, 0.04844876, -1.645011, 1, 1, 1, 1, 1,
-1.649146, -0.4310901, -1.143087, 1, 1, 1, 1, 1,
-1.63575, -0.1438836, -0.5558128, 1, 1, 1, 1, 1,
-1.633789, -0.5926605, -3.563585, 1, 1, 1, 1, 1,
-1.63363, 0.3733326, -2.026684, 1, 1, 1, 1, 1,
-1.632524, 0.002909917, -2.439495, 1, 1, 1, 1, 1,
-1.620381, -0.7060649, -2.79409, 1, 1, 1, 1, 1,
-1.619968, 0.2537254, -0.6356419, 1, 1, 1, 1, 1,
-1.60145, -0.07243345, -2.894958, 1, 1, 1, 1, 1,
-1.601164, -1.377917, -2.184767, 1, 1, 1, 1, 1,
-1.598418, 0.9307289, 0.1635482, 1, 1, 1, 1, 1,
-1.597557, -0.5317335, -3.06254, 1, 1, 1, 1, 1,
-1.58494, 2.636983, -1.462238, 1, 1, 1, 1, 1,
-1.548448, -0.3504958, -1.648385, 1, 1, 1, 1, 1,
-1.530732, -2.158474, -4.793808, 1, 1, 1, 1, 1,
-1.507699, -0.9045206, -2.866404, 0, 0, 1, 1, 1,
-1.50691, 1.07351, 1.663561, 1, 0, 0, 1, 1,
-1.504054, 0.8796552, -1.835739, 1, 0, 0, 1, 1,
-1.499337, 1.081968, -0.8365395, 1, 0, 0, 1, 1,
-1.496619, 2.022666, -0.8687482, 1, 0, 0, 1, 1,
-1.496521, -0.7010826, -2.413365, 1, 0, 0, 1, 1,
-1.494194, -0.4532691, -1.936875, 0, 0, 0, 1, 1,
-1.492135, 0.6118374, -1.035478, 0, 0, 0, 1, 1,
-1.488492, 1.78956, 0.7639818, 0, 0, 0, 1, 1,
-1.48375, 0.8632333, -0.5351384, 0, 0, 0, 1, 1,
-1.464046, 0.6103588, -1.34886, 0, 0, 0, 1, 1,
-1.440512, 1.688733, -0.0842719, 0, 0, 0, 1, 1,
-1.44029, -1.105658, -3.156617, 0, 0, 0, 1, 1,
-1.426803, -0.369557, -1.095564, 1, 1, 1, 1, 1,
-1.422174, -0.1776311, -1.136543, 1, 1, 1, 1, 1,
-1.420907, -1.123517, -3.279902, 1, 1, 1, 1, 1,
-1.418653, -0.5262113, -1.682676, 1, 1, 1, 1, 1,
-1.418299, 0.4402481, -0.4562002, 1, 1, 1, 1, 1,
-1.405944, 0.3129494, -1.933583, 1, 1, 1, 1, 1,
-1.399972, 1.994312, 0.5073774, 1, 1, 1, 1, 1,
-1.393036, 0.2496926, -1.512479, 1, 1, 1, 1, 1,
-1.380507, 1.121514, -0.01325621, 1, 1, 1, 1, 1,
-1.374435, -0.4966651, -2.770128, 1, 1, 1, 1, 1,
-1.353971, 0.2135398, -1.210299, 1, 1, 1, 1, 1,
-1.334663, 1.286227, 0.9995636, 1, 1, 1, 1, 1,
-1.323341, -2.668896, -2.743864, 1, 1, 1, 1, 1,
-1.323128, 1.403568, -1.86869, 1, 1, 1, 1, 1,
-1.320633, 0.04148035, -0.8666167, 1, 1, 1, 1, 1,
-1.310094, -1.304435, -2.727079, 0, 0, 1, 1, 1,
-1.307693, 0.3038583, -3.988633, 1, 0, 0, 1, 1,
-1.307095, 0.03298584, -2.407374, 1, 0, 0, 1, 1,
-1.298209, -0.03272102, -1.156608, 1, 0, 0, 1, 1,
-1.295936, -1.405724, -3.574305, 1, 0, 0, 1, 1,
-1.295095, 1.425678, -1.035906, 1, 0, 0, 1, 1,
-1.290798, 0.9895281, -0.7469413, 0, 0, 0, 1, 1,
-1.28954, -0.1084068, -1.394426, 0, 0, 0, 1, 1,
-1.287629, -1.206186, -4.462767, 0, 0, 0, 1, 1,
-1.26704, -0.02686013, -0.2634649, 0, 0, 0, 1, 1,
-1.261037, -0.3897069, -2.824609, 0, 0, 0, 1, 1,
-1.239679, -0.8259337, 0.2108639, 0, 0, 0, 1, 1,
-1.233062, -0.3384758, -1.320896, 0, 0, 0, 1, 1,
-1.229073, 0.8326445, -0.8139219, 1, 1, 1, 1, 1,
-1.225759, 0.46689, -0.9536517, 1, 1, 1, 1, 1,
-1.223283, -0.7674671, -0.9413427, 1, 1, 1, 1, 1,
-1.222696, 1.493845, -2.706502, 1, 1, 1, 1, 1,
-1.222359, 1.118241, -0.2845115, 1, 1, 1, 1, 1,
-1.213291, -0.534353, -1.168154, 1, 1, 1, 1, 1,
-1.202348, 1.076103, -1.060317, 1, 1, 1, 1, 1,
-1.192149, -1.472975, -3.771674, 1, 1, 1, 1, 1,
-1.18444, -2.732643, -2.778212, 1, 1, 1, 1, 1,
-1.183527, 1.462979, -2.309642, 1, 1, 1, 1, 1,
-1.179417, -0.2874951, -1.961351, 1, 1, 1, 1, 1,
-1.176201, 0.3379758, -1.244044, 1, 1, 1, 1, 1,
-1.172958, 0.4270918, -0.8847402, 1, 1, 1, 1, 1,
-1.169378, -1.350162, -3.382609, 1, 1, 1, 1, 1,
-1.169319, 1.484999, -1.903895, 1, 1, 1, 1, 1,
-1.153366, -0.1799425, -1.274014, 0, 0, 1, 1, 1,
-1.151268, -0.8938506, -4.728932, 1, 0, 0, 1, 1,
-1.137939, 0.1387823, 0.229316, 1, 0, 0, 1, 1,
-1.136346, 1.283029, -0.01069557, 1, 0, 0, 1, 1,
-1.136243, -0.2605359, -1.382953, 1, 0, 0, 1, 1,
-1.127989, -0.2743943, -2.012392, 1, 0, 0, 1, 1,
-1.120808, -0.683727, -3.196499, 0, 0, 0, 1, 1,
-1.117936, 0.2354678, 0.1578927, 0, 0, 0, 1, 1,
-1.117534, 0.4957818, -1.093324, 0, 0, 0, 1, 1,
-1.115458, -1.133515, -2.654628, 0, 0, 0, 1, 1,
-1.115253, 0.356936, -0.9443892, 0, 0, 0, 1, 1,
-1.113928, 0.7236211, -0.3964079, 0, 0, 0, 1, 1,
-1.109382, 0.7499908, -1.563933, 0, 0, 0, 1, 1,
-1.104813, 0.4497574, -1.497373, 1, 1, 1, 1, 1,
-1.103499, 1.108563, -1.553096, 1, 1, 1, 1, 1,
-1.098303, -1.789885, -3.451867, 1, 1, 1, 1, 1,
-1.090739, -0.4057373, -2.451929, 1, 1, 1, 1, 1,
-1.090498, 0.1773169, -1.873064, 1, 1, 1, 1, 1,
-1.090422, -0.5355303, -1.237639, 1, 1, 1, 1, 1,
-1.084068, -0.3620463, -2.308393, 1, 1, 1, 1, 1,
-1.079742, 0.5357931, -0.6662066, 1, 1, 1, 1, 1,
-1.078524, 0.03853242, 0.4338318, 1, 1, 1, 1, 1,
-1.070182, -0.00349016, -3.051828, 1, 1, 1, 1, 1,
-1.069438, 0.2953322, -3.142673, 1, 1, 1, 1, 1,
-1.06387, -1.400021, -2.451555, 1, 1, 1, 1, 1,
-1.057786, 0.2814233, -1.891572, 1, 1, 1, 1, 1,
-1.050091, 0.3120028, 0.5482261, 1, 1, 1, 1, 1,
-1.050011, -1.297184, -2.225815, 1, 1, 1, 1, 1,
-1.040664, -0.8224782, -4.203305, 0, 0, 1, 1, 1,
-1.038276, -1.324536, -1.621666, 1, 0, 0, 1, 1,
-1.037958, 1.0505, -1.30241, 1, 0, 0, 1, 1,
-1.036324, 1.471774, 0.3629515, 1, 0, 0, 1, 1,
-1.028301, -0.5287364, -2.209908, 1, 0, 0, 1, 1,
-1.02452, -0.6226832, -1.994197, 1, 0, 0, 1, 1,
-1.01964, -1.111887, -2.618118, 0, 0, 0, 1, 1,
-1.019634, -0.780237, -1.159928, 0, 0, 0, 1, 1,
-1.016757, -2.340794, -3.35087, 0, 0, 0, 1, 1,
-1.013984, 0.3557219, -1.218567, 0, 0, 0, 1, 1,
-1.008014, 1.27409, 0.7748578, 0, 0, 0, 1, 1,
-1.006924, -0.8117568, -1.36908, 0, 0, 0, 1, 1,
-1.006176, -0.009528886, -3.119012, 0, 0, 0, 1, 1,
-0.9974049, -0.31352, -2.059542, 1, 1, 1, 1, 1,
-0.9890237, -0.6092197, -5.42793, 1, 1, 1, 1, 1,
-0.9857122, 0.2941415, 1.996709, 1, 1, 1, 1, 1,
-0.9834755, -1.163221, -3.353754, 1, 1, 1, 1, 1,
-0.9812139, -0.2905598, -2.524789, 1, 1, 1, 1, 1,
-0.981205, 0.4555841, -1.404537, 1, 1, 1, 1, 1,
-0.9765973, 0.1544622, 1.678423, 1, 1, 1, 1, 1,
-0.9735446, -0.06766419, -2.771226, 1, 1, 1, 1, 1,
-0.9713001, 0.7422556, -1.553704, 1, 1, 1, 1, 1,
-0.9680332, 0.1516458, -2.122761, 1, 1, 1, 1, 1,
-0.9603515, -0.3526141, -0.9485475, 1, 1, 1, 1, 1,
-0.9547477, -0.3986777, -2.027866, 1, 1, 1, 1, 1,
-0.9509477, -1.3011, -2.263389, 1, 1, 1, 1, 1,
-0.9459985, 2.144845, -1.123395, 1, 1, 1, 1, 1,
-0.9455237, -1.297141, -1.532833, 1, 1, 1, 1, 1,
-0.9449044, -0.6164794, -2.655312, 0, 0, 1, 1, 1,
-0.9417409, -1.838707, -3.864558, 1, 0, 0, 1, 1,
-0.9314558, 1.62813, 0.2184922, 1, 0, 0, 1, 1,
-0.9200981, 0.6118609, -1.185132, 1, 0, 0, 1, 1,
-0.9196591, -0.4677857, -1.78894, 1, 0, 0, 1, 1,
-0.9165942, 1.995293, -0.1823896, 1, 0, 0, 1, 1,
-0.9122275, 1.889295, -0.06181595, 0, 0, 0, 1, 1,
-0.9096668, 1.466603, -1.373623, 0, 0, 0, 1, 1,
-0.9042763, 0.6399854, -1.301255, 0, 0, 0, 1, 1,
-0.8965336, -0.3997642, -5.072944, 0, 0, 0, 1, 1,
-0.8951672, -1.372696, -3.956107, 0, 0, 0, 1, 1,
-0.8851559, -0.4923829, -3.066395, 0, 0, 0, 1, 1,
-0.8838763, -0.8471746, -3.559696, 0, 0, 0, 1, 1,
-0.8816141, -2.006991, -3.748694, 1, 1, 1, 1, 1,
-0.8757377, 0.1683991, -0.3767222, 1, 1, 1, 1, 1,
-0.8753997, -0.8125342, -4.686534, 1, 1, 1, 1, 1,
-0.8753039, 1.301718, -1.771382, 1, 1, 1, 1, 1,
-0.8745354, 0.8565768, -0.8975192, 1, 1, 1, 1, 1,
-0.8691902, -0.9601666, -3.67148, 1, 1, 1, 1, 1,
-0.8686573, -2.529582, -3.285794, 1, 1, 1, 1, 1,
-0.8686015, 0.3223925, -2.688098, 1, 1, 1, 1, 1,
-0.8647093, 2.097577, -1.768698, 1, 1, 1, 1, 1,
-0.8633693, 0.2188772, -0.6514065, 1, 1, 1, 1, 1,
-0.8619748, 0.5709541, -1.742849, 1, 1, 1, 1, 1,
-0.8531375, 0.3282958, 0.112664, 1, 1, 1, 1, 1,
-0.8510897, -0.4389526, -1.082269, 1, 1, 1, 1, 1,
-0.8473381, -1.270149, -3.509176, 1, 1, 1, 1, 1,
-0.8438014, 2.134834, 0.1425259, 1, 1, 1, 1, 1,
-0.8423141, 0.7255877, -0.207454, 0, 0, 1, 1, 1,
-0.8419737, -0.602417, -3.243918, 1, 0, 0, 1, 1,
-0.8398782, 1.513994, -0.4135445, 1, 0, 0, 1, 1,
-0.8374677, -0.5940145, -1.129714, 1, 0, 0, 1, 1,
-0.8353779, -0.1780178, -3.310261, 1, 0, 0, 1, 1,
-0.8270129, -1.510971, -1.984968, 1, 0, 0, 1, 1,
-0.8247256, -0.4496157, -1.40837, 0, 0, 0, 1, 1,
-0.8234147, 0.5513737, -1.968394, 0, 0, 0, 1, 1,
-0.8224683, -0.2179287, -2.672523, 0, 0, 0, 1, 1,
-0.8185818, -0.8919365, -1.796472, 0, 0, 0, 1, 1,
-0.8108788, -0.4576972, -2.430742, 0, 0, 0, 1, 1,
-0.8008893, 0.4507948, -0.2259825, 0, 0, 0, 1, 1,
-0.7949923, -1.528182, -3.047127, 0, 0, 0, 1, 1,
-0.7918852, -0.6428462, -3.503601, 1, 1, 1, 1, 1,
-0.7733348, 1.874932, -0.3115035, 1, 1, 1, 1, 1,
-0.7697619, 0.6386545, -0.9235417, 1, 1, 1, 1, 1,
-0.7696734, -1.372742, -2.940468, 1, 1, 1, 1, 1,
-0.7683254, -0.7189431, -0.9873743, 1, 1, 1, 1, 1,
-0.7660672, -0.9950159, -4.057534, 1, 1, 1, 1, 1,
-0.7568746, -2.863036, -2.905742, 1, 1, 1, 1, 1,
-0.75019, 0.3611654, -1.229004, 1, 1, 1, 1, 1,
-0.7472916, 1.575116, 0.4657165, 1, 1, 1, 1, 1,
-0.7403703, -1.489028, -2.818034, 1, 1, 1, 1, 1,
-0.7388885, 0.01009419, -1.549862, 1, 1, 1, 1, 1,
-0.7369498, 0.2501675, -1.142241, 1, 1, 1, 1, 1,
-0.7363869, -0.8749117, -2.376409, 1, 1, 1, 1, 1,
-0.735081, -0.1535006, -1.257885, 1, 1, 1, 1, 1,
-0.7313505, -1.129578, -2.376603, 1, 1, 1, 1, 1,
-0.7310346, -1.062736, -1.445284, 0, 0, 1, 1, 1,
-0.7189262, -0.2682781, -2.338678, 1, 0, 0, 1, 1,
-0.7147779, -1.144279, -2.835114, 1, 0, 0, 1, 1,
-0.7110081, 0.112509, -1.394368, 1, 0, 0, 1, 1,
-0.7081975, 0.1067078, -1.850716, 1, 0, 0, 1, 1,
-0.7074845, 0.4908843, -1.372568, 1, 0, 0, 1, 1,
-0.7024941, 1.181234, -0.9283997, 0, 0, 0, 1, 1,
-0.6939808, -0.5162457, -2.524188, 0, 0, 0, 1, 1,
-0.6929307, 1.728064, -1.43876, 0, 0, 0, 1, 1,
-0.6926003, 0.5369907, -1.253054, 0, 0, 0, 1, 1,
-0.69161, -0.5972401, -2.526527, 0, 0, 0, 1, 1,
-0.6915626, 0.1634825, -2.789228, 0, 0, 0, 1, 1,
-0.6910241, -0.2541908, -1.381608, 0, 0, 0, 1, 1,
-0.6871728, -0.6979316, -0.5674617, 1, 1, 1, 1, 1,
-0.6723688, -0.4032395, -2.529281, 1, 1, 1, 1, 1,
-0.6713192, -1.231938, -2.68109, 1, 1, 1, 1, 1,
-0.6672263, 1.310972, -1.170068, 1, 1, 1, 1, 1,
-0.666251, 0.7607104, -2.370994, 1, 1, 1, 1, 1,
-0.663849, -0.199333, -2.864555, 1, 1, 1, 1, 1,
-0.6540601, 0.1380381, -1.532593, 1, 1, 1, 1, 1,
-0.6431791, -0.4234155, -3.403006, 1, 1, 1, 1, 1,
-0.6370178, 0.5966902, -0.2365159, 1, 1, 1, 1, 1,
-0.6344138, 0.2679073, -1.846417, 1, 1, 1, 1, 1,
-0.6266112, -0.2790641, -2.677924, 1, 1, 1, 1, 1,
-0.6258533, 0.03760718, -1.69366, 1, 1, 1, 1, 1,
-0.6255115, -2.646241, -3.366798, 1, 1, 1, 1, 1,
-0.6237546, -0.6694426, -2.335673, 1, 1, 1, 1, 1,
-0.622061, -0.07915509, -2.448798, 1, 1, 1, 1, 1,
-0.6206555, 0.8892537, -1.994783, 0, 0, 1, 1, 1,
-0.6185105, -0.5951641, -1.736939, 1, 0, 0, 1, 1,
-0.6134426, 0.3709212, -1.14491, 1, 0, 0, 1, 1,
-0.6114712, -1.363603, -4.572761, 1, 0, 0, 1, 1,
-0.6089057, -0.247196, -0.4616008, 1, 0, 0, 1, 1,
-0.6069987, -0.5176061, -1.590031, 1, 0, 0, 1, 1,
-0.606971, -0.1966222, -1.759379, 0, 0, 0, 1, 1,
-0.60306, -0.2272583, -1.159119, 0, 0, 0, 1, 1,
-0.5987352, -1.352582, -2.340626, 0, 0, 0, 1, 1,
-0.5885231, 0.3141739, -0.4497548, 0, 0, 0, 1, 1,
-0.5880588, 0.6131932, -2.18044, 0, 0, 0, 1, 1,
-0.5875233, 0.5035042, -1.938881, 0, 0, 0, 1, 1,
-0.5858678, 0.2803744, -1.407164, 0, 0, 0, 1, 1,
-0.5849168, -0.02972271, -1.622023, 1, 1, 1, 1, 1,
-0.582643, -1.182441, -3.06399, 1, 1, 1, 1, 1,
-0.5820554, 1.157927, -0.03077377, 1, 1, 1, 1, 1,
-0.5811496, -2.294976, -3.81447, 1, 1, 1, 1, 1,
-0.5784356, 0.4816663, -0.1411845, 1, 1, 1, 1, 1,
-0.5781795, -0.6552762, -2.192279, 1, 1, 1, 1, 1,
-0.5755972, 0.06124204, -1.336683, 1, 1, 1, 1, 1,
-0.5719197, -0.3570338, -0.6661177, 1, 1, 1, 1, 1,
-0.5710974, 0.1308596, -2.352005, 1, 1, 1, 1, 1,
-0.5667669, -0.9193187, -2.285422, 1, 1, 1, 1, 1,
-0.5665767, 0.05757482, -0.1134323, 1, 1, 1, 1, 1,
-0.5490434, 0.6145544, 0.3134715, 1, 1, 1, 1, 1,
-0.5485629, 0.551964, -0.0009300679, 1, 1, 1, 1, 1,
-0.5470179, 0.5384248, -0.4171169, 1, 1, 1, 1, 1,
-0.5404168, -0.1884734, -2.625426, 1, 1, 1, 1, 1,
-0.5385861, -0.009279471, -1.751054, 0, 0, 1, 1, 1,
-0.5372993, 0.9054905, -1.061134, 1, 0, 0, 1, 1,
-0.5367872, -0.8894723, -3.390204, 1, 0, 0, 1, 1,
-0.5362067, 1.753749, 1.448182, 1, 0, 0, 1, 1,
-0.5356327, -0.3475299, -0.7605821, 1, 0, 0, 1, 1,
-0.5309843, 0.3219437, -1.749433, 1, 0, 0, 1, 1,
-0.5299602, -0.9132842, -1.750285, 0, 0, 0, 1, 1,
-0.5274459, 1.121174, -0.2567496, 0, 0, 0, 1, 1,
-0.5258431, 0.2312417, -2.403408, 0, 0, 0, 1, 1,
-0.523307, -1.244226, -2.398143, 0, 0, 0, 1, 1,
-0.5212216, 1.192378, 0.7695908, 0, 0, 0, 1, 1,
-0.5193408, 0.5663983, -1.733887, 0, 0, 0, 1, 1,
-0.5192575, 0.08960213, -0.9821061, 0, 0, 0, 1, 1,
-0.5184423, 0.1500723, -2.470276, 1, 1, 1, 1, 1,
-0.5173462, -0.683073, -3.441263, 1, 1, 1, 1, 1,
-0.5108433, -0.2778791, -3.272153, 1, 1, 1, 1, 1,
-0.5079662, -0.2070116, -3.175879, 1, 1, 1, 1, 1,
-0.50741, 0.418578, 0.6552048, 1, 1, 1, 1, 1,
-0.4993383, -0.3147277, -1.08993, 1, 1, 1, 1, 1,
-0.4958633, -2.316554, -2.744492, 1, 1, 1, 1, 1,
-0.4931422, -0.7699842, -4.35807, 1, 1, 1, 1, 1,
-0.4901552, -0.2627503, -2.242296, 1, 1, 1, 1, 1,
-0.4888453, 0.7565563, -0.4701123, 1, 1, 1, 1, 1,
-0.4814123, -1.662446, -3.11318, 1, 1, 1, 1, 1,
-0.4724557, -0.009987179, -1.637386, 1, 1, 1, 1, 1,
-0.471116, -2.092165, -2.501122, 1, 1, 1, 1, 1,
-0.4706331, -0.1465842, -0.1046084, 1, 1, 1, 1, 1,
-0.4664761, -1.766908, -3.929314, 1, 1, 1, 1, 1,
-0.4660526, -0.05831029, -0.8319853, 0, 0, 1, 1, 1,
-0.4657633, -0.8318129, -4.623441, 1, 0, 0, 1, 1,
-0.4625425, 1.07353, -0.2516554, 1, 0, 0, 1, 1,
-0.4624226, 0.09343796, -0.9419786, 1, 0, 0, 1, 1,
-0.4551059, -0.1709415, -3.402138, 1, 0, 0, 1, 1,
-0.4527287, 0.299786, 0.7559327, 1, 0, 0, 1, 1,
-0.4481616, 0.1456339, -2.38628, 0, 0, 0, 1, 1,
-0.4466424, -0.7202284, -2.355586, 0, 0, 0, 1, 1,
-0.4430439, -0.7156128, -1.71126, 0, 0, 0, 1, 1,
-0.434522, 0.8501802, -2.256156, 0, 0, 0, 1, 1,
-0.4316921, 0.2048523, -1.755702, 0, 0, 0, 1, 1,
-0.4311823, -0.976218, -3.690377, 0, 0, 0, 1, 1,
-0.4257745, -0.9502015, -1.194291, 0, 0, 0, 1, 1,
-0.4252536, 0.4632655, 0.8851056, 1, 1, 1, 1, 1,
-0.4245859, 1.444566, -0.4409242, 1, 1, 1, 1, 1,
-0.421863, -0.04935577, -1.49854, 1, 1, 1, 1, 1,
-0.4217725, 0.9058477, -0.4671014, 1, 1, 1, 1, 1,
-0.421305, 0.03380489, -0.3646845, 1, 1, 1, 1, 1,
-0.4172711, -1.889402, -2.268819, 1, 1, 1, 1, 1,
-0.4170969, -2.465179, -3.622872, 1, 1, 1, 1, 1,
-0.4154738, 0.03476, 0.6998664, 1, 1, 1, 1, 1,
-0.4151905, -0.2315805, -1.140362, 1, 1, 1, 1, 1,
-0.4151657, -0.7266715, -3.510996, 1, 1, 1, 1, 1,
-0.4151351, -0.7749031, -3.286467, 1, 1, 1, 1, 1,
-0.4107826, -0.5320442, -1.86577, 1, 1, 1, 1, 1,
-0.4106547, 0.09096009, -2.34859, 1, 1, 1, 1, 1,
-0.4079101, 0.1138593, -1.951458, 1, 1, 1, 1, 1,
-0.407114, -0.4727163, -1.230541, 1, 1, 1, 1, 1,
-0.4066121, -0.9731406, -1.142327, 0, 0, 1, 1, 1,
-0.4060555, 0.6389691, -2.11489, 1, 0, 0, 1, 1,
-0.4050534, 0.3400383, -1.787724, 1, 0, 0, 1, 1,
-0.4031272, -0.9630364, -3.040509, 1, 0, 0, 1, 1,
-0.4010513, -0.1313616, -4.259353, 1, 0, 0, 1, 1,
-0.3949778, 0.7769269, -1.834912, 1, 0, 0, 1, 1,
-0.3895528, 0.4890659, 2.458921, 0, 0, 0, 1, 1,
-0.3879584, -1.29522, -3.23282, 0, 0, 0, 1, 1,
-0.3873226, -0.5711777, -1.455404, 0, 0, 0, 1, 1,
-0.3852873, 1.657789, -0.5489014, 0, 0, 0, 1, 1,
-0.3834606, 1.462776, -0.6629852, 0, 0, 0, 1, 1,
-0.3832238, 0.1572483, -2.54005, 0, 0, 0, 1, 1,
-0.3830407, 0.5370869, -1.384563, 0, 0, 0, 1, 1,
-0.3822667, -1.020927, -3.315318, 1, 1, 1, 1, 1,
-0.3786869, -0.8885583, -1.492881, 1, 1, 1, 1, 1,
-0.3768376, 0.342644, -0.6365749, 1, 1, 1, 1, 1,
-0.3760644, 0.685964, -0.6358432, 1, 1, 1, 1, 1,
-0.3727162, 1.017609, -0.8079889, 1, 1, 1, 1, 1,
-0.3714979, -0.4110712, -4.12428, 1, 1, 1, 1, 1,
-0.3640838, 0.09627798, -1.778525, 1, 1, 1, 1, 1,
-0.3637764, -0.05969348, -2.20584, 1, 1, 1, 1, 1,
-0.3610189, 1.032475, 2.615351, 1, 1, 1, 1, 1,
-0.3599143, -1.900222, -2.033942, 1, 1, 1, 1, 1,
-0.3595408, 0.6596069, -1.219685, 1, 1, 1, 1, 1,
-0.3591544, -1.638983, -2.059004, 1, 1, 1, 1, 1,
-0.3572953, -2.221481, -3.590827, 1, 1, 1, 1, 1,
-0.3544686, 1.816875, -0.258153, 1, 1, 1, 1, 1,
-0.3528942, 0.6559926, 0.2241644, 1, 1, 1, 1, 1,
-0.3472539, -0.2289268, -2.566865, 0, 0, 1, 1, 1,
-0.3405455, 1.687523, 1.197461, 1, 0, 0, 1, 1,
-0.3394473, -0.5964164, -4.294201, 1, 0, 0, 1, 1,
-0.3377929, 0.0897407, -1.423978, 1, 0, 0, 1, 1,
-0.3377711, 0.1408817, -2.551077, 1, 0, 0, 1, 1,
-0.3361946, 1.418222, -0.1833212, 1, 0, 0, 1, 1,
-0.3346286, -3.62077, -2.767974, 0, 0, 0, 1, 1,
-0.3192409, -0.06844135, -0.2202943, 0, 0, 0, 1, 1,
-0.3190052, -1.260577, -4.700339, 0, 0, 0, 1, 1,
-0.3177056, -2.146989, -2.809602, 0, 0, 0, 1, 1,
-0.3163279, -0.3924889, -2.855969, 0, 0, 0, 1, 1,
-0.3153104, 2.766417, -0.9529057, 0, 0, 0, 1, 1,
-0.3143107, -0.5477762, -3.459838, 0, 0, 0, 1, 1,
-0.3072716, 0.01975655, -2.170358, 1, 1, 1, 1, 1,
-0.3052871, 2.30605, 0.8009959, 1, 1, 1, 1, 1,
-0.2959514, -2.11835, -4.820056, 1, 1, 1, 1, 1,
-0.2921033, -1.284606, -2.069907, 1, 1, 1, 1, 1,
-0.290536, 0.9945836, 0.2284013, 1, 1, 1, 1, 1,
-0.2882433, -0.1773089, -2.010423, 1, 1, 1, 1, 1,
-0.28333, -0.271386, -1.90051, 1, 1, 1, 1, 1,
-0.2831554, -0.0956995, -3.483067, 1, 1, 1, 1, 1,
-0.282227, 1.817157, 0.8706453, 1, 1, 1, 1, 1,
-0.2815574, -0.8437251, -2.308673, 1, 1, 1, 1, 1,
-0.2717931, -0.1353279, -3.320901, 1, 1, 1, 1, 1,
-0.2695587, -0.411052, -3.705623, 1, 1, 1, 1, 1,
-0.2615546, 1.372919, 1.523606, 1, 1, 1, 1, 1,
-0.255856, -0.4701428, -3.768392, 1, 1, 1, 1, 1,
-0.2556356, 0.7248589, -0.995652, 1, 1, 1, 1, 1,
-0.2523569, -0.5350412, -4.256989, 0, 0, 1, 1, 1,
-0.2494768, 0.0052317, -2.163965, 1, 0, 0, 1, 1,
-0.248321, 0.4616, -0.03765739, 1, 0, 0, 1, 1,
-0.2478178, -1.398218, -4.083583, 1, 0, 0, 1, 1,
-0.2460682, 0.2368309, -2.056823, 1, 0, 0, 1, 1,
-0.2399339, 0.1511013, -0.05515867, 1, 0, 0, 1, 1,
-0.236329, 2.001069, -0.1040952, 0, 0, 0, 1, 1,
-0.2330724, -0.784623, -4.13834, 0, 0, 0, 1, 1,
-0.2324391, 0.08054998, 0.209897, 0, 0, 0, 1, 1,
-0.2267037, 2.00764, 0.1155957, 0, 0, 0, 1, 1,
-0.2241821, 0.1894619, -1.705196, 0, 0, 0, 1, 1,
-0.2220174, -1.055254, -3.697247, 0, 0, 0, 1, 1,
-0.2192848, 1.202551, 0.05369058, 0, 0, 0, 1, 1,
-0.2163357, -1.083962, -3.377815, 1, 1, 1, 1, 1,
-0.2143518, 0.3225546, 1.409901, 1, 1, 1, 1, 1,
-0.2141242, 0.1846631, -1.15163, 1, 1, 1, 1, 1,
-0.2090819, 2.090419, -0.5368034, 1, 1, 1, 1, 1,
-0.2082715, 0.5799311, 0.3565677, 1, 1, 1, 1, 1,
-0.2082621, 0.5510896, 0.008060683, 1, 1, 1, 1, 1,
-0.2071485, 0.9512829, -0.2603552, 1, 1, 1, 1, 1,
-0.204376, 2.558197, 0.4424255, 1, 1, 1, 1, 1,
-0.2016477, -1.366671, -2.195067, 1, 1, 1, 1, 1,
-0.1997488, -0.0880004, -2.525722, 1, 1, 1, 1, 1,
-0.1975033, 1.077983, 0.3838072, 1, 1, 1, 1, 1,
-0.1966713, -0.4312139, -5.280435, 1, 1, 1, 1, 1,
-0.1928787, 0.8470047, -1.060395, 1, 1, 1, 1, 1,
-0.186829, -1.073542, -3.278692, 1, 1, 1, 1, 1,
-0.1865153, 0.7074544, -0.9907111, 1, 1, 1, 1, 1,
-0.1832195, -0.7784268, -5.386728, 0, 0, 1, 1, 1,
-0.181045, 1.269351, -1.220646, 1, 0, 0, 1, 1,
-0.1794882, 1.26716, -0.5365849, 1, 0, 0, 1, 1,
-0.1754766, 1.231165, 1.28786, 1, 0, 0, 1, 1,
-0.1726099, -0.280749, -2.303539, 1, 0, 0, 1, 1,
-0.1715515, 1.967042, 0.2964793, 1, 0, 0, 1, 1,
-0.1712497, 1.013337, 0.3814782, 0, 0, 0, 1, 1,
-0.1693967, 2.493517, -1.90927, 0, 0, 0, 1, 1,
-0.168489, -0.09604231, -1.902145, 0, 0, 0, 1, 1,
-0.167086, 0.6733739, -0.9291235, 0, 0, 0, 1, 1,
-0.1591312, -1.043393, -1.905765, 0, 0, 0, 1, 1,
-0.1566597, 0.1261399, -0.07406826, 0, 0, 0, 1, 1,
-0.153607, -0.7050653, -3.450079, 0, 0, 0, 1, 1,
-0.1528231, 0.1256628, -0.7326835, 1, 1, 1, 1, 1,
-0.15047, 0.144392, -0.4513673, 1, 1, 1, 1, 1,
-0.1503039, 1.523495, -1.490592, 1, 1, 1, 1, 1,
-0.1493762, -2.873029, -2.97589, 1, 1, 1, 1, 1,
-0.1480332, -0.7345261, -1.860675, 1, 1, 1, 1, 1,
-0.1458672, -0.8424823, -2.349705, 1, 1, 1, 1, 1,
-0.1456379, 0.3271422, -1.346151, 1, 1, 1, 1, 1,
-0.1441591, -0.8394962, -4.044556, 1, 1, 1, 1, 1,
-0.1439153, -1.187709, -2.892117, 1, 1, 1, 1, 1,
-0.1415456, -1.259236, -2.150363, 1, 1, 1, 1, 1,
-0.1399759, 1.013834, -0.3921529, 1, 1, 1, 1, 1,
-0.1395004, -0.4485111, -3.454459, 1, 1, 1, 1, 1,
-0.13855, -0.3198749, -3.548127, 1, 1, 1, 1, 1,
-0.1350758, 1.341213, 0.6303608, 1, 1, 1, 1, 1,
-0.1340176, -1.440966, -3.304374, 1, 1, 1, 1, 1,
-0.1262973, 1.361036, -0.5610533, 0, 0, 1, 1, 1,
-0.1239575, 0.4380343, 1.222388, 1, 0, 0, 1, 1,
-0.1222492, 0.2079327, 1.411224, 1, 0, 0, 1, 1,
-0.1193039, -0.008637846, -2.057138, 1, 0, 0, 1, 1,
-0.1190115, 0.6996533, -1.489268, 1, 0, 0, 1, 1,
-0.1187267, 0.6233182, -1.02334, 1, 0, 0, 1, 1,
-0.1175957, -0.2994509, -3.385413, 0, 0, 0, 1, 1,
-0.1172684, 0.2251562, -0.6315236, 0, 0, 0, 1, 1,
-0.1147493, -0.7495087, -4.206051, 0, 0, 0, 1, 1,
-0.1136029, -0.7768325, -2.475921, 0, 0, 0, 1, 1,
-0.1105974, -0.1127967, -2.268975, 0, 0, 0, 1, 1,
-0.1092594, 0.0685416, -1.682017, 0, 0, 0, 1, 1,
-0.1086724, -1.812484, -3.841316, 0, 0, 0, 1, 1,
-0.1083181, 0.8483247, 2.411988, 1, 1, 1, 1, 1,
-0.1077097, 0.9935483, -1.581753, 1, 1, 1, 1, 1,
-0.1031922, -0.1614225, -3.313054, 1, 1, 1, 1, 1,
-0.09701496, -0.7372089, -3.488786, 1, 1, 1, 1, 1,
-0.08499584, -1.60865, -4.590701, 1, 1, 1, 1, 1,
-0.08496539, 1.75422, -0.7045549, 1, 1, 1, 1, 1,
-0.08401919, 0.1313692, -1.18344, 1, 1, 1, 1, 1,
-0.07651161, 0.5884334, -0.1487992, 1, 1, 1, 1, 1,
-0.07262032, 0.8504657, 0.2106871, 1, 1, 1, 1, 1,
-0.06218318, 0.3799614, 0.3498392, 1, 1, 1, 1, 1,
-0.06195219, 0.9340577, 0.2568888, 1, 1, 1, 1, 1,
-0.0506916, -0.7490923, -3.777099, 1, 1, 1, 1, 1,
-0.05011765, -0.7277861, -3.298788, 1, 1, 1, 1, 1,
-0.04543005, -1.220242, -3.749385, 1, 1, 1, 1, 1,
-0.04292974, 1.433977, -1.067991, 1, 1, 1, 1, 1,
-0.04173357, -0.1115056, -3.283099, 0, 0, 1, 1, 1,
-0.04147409, 1.532757, 0.2639177, 1, 0, 0, 1, 1,
-0.03970431, 0.7509988, 0.5137669, 1, 0, 0, 1, 1,
-0.03231358, 0.1903254, 0.1266327, 1, 0, 0, 1, 1,
-0.03178795, -0.3950397, -2.979009, 1, 0, 0, 1, 1,
-0.03012398, 0.9824722, -0.2950874, 1, 0, 0, 1, 1,
-0.02868602, -1.472102, -3.750896, 0, 0, 0, 1, 1,
-0.02446639, -1.32979, -3.527575, 0, 0, 0, 1, 1,
-0.02164475, 0.5243281, -0.4861416, 0, 0, 0, 1, 1,
-0.01712423, 0.1907805, 0.1991891, 0, 0, 0, 1, 1,
-0.01585691, -1.593286, -2.595556, 0, 0, 0, 1, 1,
-0.01556907, 0.8662038, -1.468588, 0, 0, 0, 1, 1,
-0.009130402, -1.419319, -1.38106, 0, 0, 0, 1, 1,
-0.003110072, -0.7223154, -1.8728, 1, 1, 1, 1, 1,
-0.001944012, -0.312123, -3.016919, 1, 1, 1, 1, 1,
0.00259647, 0.551739, 0.5512779, 1, 1, 1, 1, 1,
0.002697244, 0.8127264, -1.779149, 1, 1, 1, 1, 1,
0.005239834, -0.2971738, 2.64711, 1, 1, 1, 1, 1,
0.005272762, 0.4202837, -0.3156569, 1, 1, 1, 1, 1,
0.01052075, -0.005018301, 1.179828, 1, 1, 1, 1, 1,
0.01469413, 2.045452, -1.404607, 1, 1, 1, 1, 1,
0.01729468, -0.1834914, 1.316286, 1, 1, 1, 1, 1,
0.02618246, 2.041597, -0.9024787, 1, 1, 1, 1, 1,
0.02752678, 0.1964736, 1.132514, 1, 1, 1, 1, 1,
0.02948488, 0.6388344, -0.6887583, 1, 1, 1, 1, 1,
0.03215375, 0.168141, -0.8134602, 1, 1, 1, 1, 1,
0.03237344, 0.7472638, 1.031177, 1, 1, 1, 1, 1,
0.03305274, -0.3093168, 3.696417, 1, 1, 1, 1, 1,
0.03387347, -0.5320914, 5.177646, 0, 0, 1, 1, 1,
0.03443025, 0.5481295, 0.5880353, 1, 0, 0, 1, 1,
0.04021708, 0.1692368, -0.8257168, 1, 0, 0, 1, 1,
0.04134606, 0.863959, 0.190117, 1, 0, 0, 1, 1,
0.04223145, -0.2050751, 4.966251, 1, 0, 0, 1, 1,
0.04668267, -2.420236, 3.093572, 1, 0, 0, 1, 1,
0.04777625, -1.373011, 2.615266, 0, 0, 0, 1, 1,
0.04797649, -0.325759, 4.095115, 0, 0, 0, 1, 1,
0.04891127, -1.005848, 2.799507, 0, 0, 0, 1, 1,
0.05033485, 0.8148257, 1.883234, 0, 0, 0, 1, 1,
0.05037201, 0.3197317, 0.2229179, 0, 0, 0, 1, 1,
0.05159848, -1.632208, 3.104707, 0, 0, 0, 1, 1,
0.05233687, -0.4637659, 3.156538, 0, 0, 0, 1, 1,
0.05258771, -2.25527, 1.369441, 1, 1, 1, 1, 1,
0.05412095, -0.2259472, 3.004318, 1, 1, 1, 1, 1,
0.05605292, 0.7479373, 0.7664276, 1, 1, 1, 1, 1,
0.0616991, 0.01039158, 2.314858, 1, 1, 1, 1, 1,
0.0619501, 0.3596041, -0.5432622, 1, 1, 1, 1, 1,
0.06201269, 0.09435078, -0.9736214, 1, 1, 1, 1, 1,
0.06625417, 1.114588, 0.2710643, 1, 1, 1, 1, 1,
0.06756914, -0.818767, 1.160841, 1, 1, 1, 1, 1,
0.0684446, 0.3176053, 1.875873, 1, 1, 1, 1, 1,
0.06925298, -0.02096748, 2.959056, 1, 1, 1, 1, 1,
0.07152707, 1.240201, -1.75784, 1, 1, 1, 1, 1,
0.07292086, 0.1239482, 1.503478, 1, 1, 1, 1, 1,
0.07490464, 0.5988045, -0.04387866, 1, 1, 1, 1, 1,
0.07762815, -0.252866, 4.231238, 1, 1, 1, 1, 1,
0.07867913, -0.3251237, 2.490869, 1, 1, 1, 1, 1,
0.0818094, -0.3812271, 3.375082, 0, 0, 1, 1, 1,
0.08449427, 0.2270402, -1.550871, 1, 0, 0, 1, 1,
0.0891256, -0.278302, 4.03112, 1, 0, 0, 1, 1,
0.09007273, -0.8971534, 2.531338, 1, 0, 0, 1, 1,
0.09177157, 0.1021048, 1.705395, 1, 0, 0, 1, 1,
0.09316933, -0.1329821, 2.524196, 1, 0, 0, 1, 1,
0.0953135, -1.674482, 2.669664, 0, 0, 0, 1, 1,
0.1024741, 1.357226, -0.6102487, 0, 0, 0, 1, 1,
0.1027673, -0.463829, 4.941724, 0, 0, 0, 1, 1,
0.1073082, 0.9792091, 1.006588, 0, 0, 0, 1, 1,
0.1073158, 0.9124194, 0.6090332, 0, 0, 0, 1, 1,
0.1087421, 0.04271634, 2.323894, 0, 0, 0, 1, 1,
0.1119209, 1.083524, 1.156052, 0, 0, 0, 1, 1,
0.1120242, 1.555024, -0.6049738, 1, 1, 1, 1, 1,
0.1123373, -0.1112221, 2.735974, 1, 1, 1, 1, 1,
0.114438, 1.034342, 0.3166779, 1, 1, 1, 1, 1,
0.1163215, 1.307644, -0.5447477, 1, 1, 1, 1, 1,
0.1173458, 0.8884826, 0.08546216, 1, 1, 1, 1, 1,
0.1175867, 0.3835795, 0.2633372, 1, 1, 1, 1, 1,
0.1228575, 1.493318, -0.6860284, 1, 1, 1, 1, 1,
0.1253067, -0.1767576, 0.3045228, 1, 1, 1, 1, 1,
0.1257494, -0.1950423, 4.812024, 1, 1, 1, 1, 1,
0.126582, 0.886663, 0.2104443, 1, 1, 1, 1, 1,
0.1324511, -0.7807521, 3.974537, 1, 1, 1, 1, 1,
0.1371833, 0.4200229, 1.217337, 1, 1, 1, 1, 1,
0.1406737, 1.817745, -0.7196789, 1, 1, 1, 1, 1,
0.1493323, -1.77401, 4.005965, 1, 1, 1, 1, 1,
0.1499503, -0.230359, 2.894929, 1, 1, 1, 1, 1,
0.1520125, 0.3932166, 0.8544052, 0, 0, 1, 1, 1,
0.1634473, 1.51263, -0.8390714, 1, 0, 0, 1, 1,
0.1652964, -1.141056, 1.717092, 1, 0, 0, 1, 1,
0.1658796, -1.593658, 4.15824, 1, 0, 0, 1, 1,
0.166248, 0.03817889, 1.940182, 1, 0, 0, 1, 1,
0.1666462, -0.04329127, 0.2438237, 1, 0, 0, 1, 1,
0.1671059, -1.935068, 3.644415, 0, 0, 0, 1, 1,
0.1684578, -0.1122037, 2.21994, 0, 0, 0, 1, 1,
0.1697345, 0.623769, 0.8304028, 0, 0, 0, 1, 1,
0.1699439, -0.8145258, 2.692113, 0, 0, 0, 1, 1,
0.1732153, 0.1294062, 1.04956, 0, 0, 0, 1, 1,
0.1743267, 0.7791885, 1.305415, 0, 0, 0, 1, 1,
0.1749648, -1.592938, 4.059466, 0, 0, 0, 1, 1,
0.1788585, -0.6858879, 4.721231, 1, 1, 1, 1, 1,
0.1839607, 0.9154989, -0.03587214, 1, 1, 1, 1, 1,
0.1848292, -0.6961567, 2.255846, 1, 1, 1, 1, 1,
0.1875871, 0.1580296, -0.0529562, 1, 1, 1, 1, 1,
0.1882861, -1.521476, 4.612897, 1, 1, 1, 1, 1,
0.192293, 0.3720656, 0.6974186, 1, 1, 1, 1, 1,
0.1943302, -0.4906825, 1.730657, 1, 1, 1, 1, 1,
0.1950374, -0.8190237, 1.013683, 1, 1, 1, 1, 1,
0.1958936, 0.5906638, -0.5111493, 1, 1, 1, 1, 1,
0.1961747, 1.044619, 0.786653, 1, 1, 1, 1, 1,
0.2080246, 0.07499187, 1.11607, 1, 1, 1, 1, 1,
0.2092846, -0.5911502, 2.833193, 1, 1, 1, 1, 1,
0.2118951, 0.6709302, 0.170901, 1, 1, 1, 1, 1,
0.2128205, -0.4277364, 2.683666, 1, 1, 1, 1, 1,
0.2139599, -0.277715, 1.942612, 1, 1, 1, 1, 1,
0.2178979, -1.881902, 2.80758, 0, 0, 1, 1, 1,
0.2183656, -2.388065, 3.449914, 1, 0, 0, 1, 1,
0.2199694, 0.5505893, 1.474421, 1, 0, 0, 1, 1,
0.2201482, 0.9391117, 2.57029, 1, 0, 0, 1, 1,
0.2225692, 0.6992773, -0.4198081, 1, 0, 0, 1, 1,
0.2232449, 1.559256, 0.3519696, 1, 0, 0, 1, 1,
0.2291674, 1.392486, 2.745349, 0, 0, 0, 1, 1,
0.2335169, -0.4677961, 3.695984, 0, 0, 0, 1, 1,
0.2372544, -1.03217, 2.828812, 0, 0, 0, 1, 1,
0.237298, -1.231236, 3.654113, 0, 0, 0, 1, 1,
0.2392117, -1.493633, 2.572891, 0, 0, 0, 1, 1,
0.2435542, 0.9820905, 1.271286, 0, 0, 0, 1, 1,
0.2459487, 2.12808, -0.187932, 0, 0, 0, 1, 1,
0.2464236, 0.5038611, 0.3400858, 1, 1, 1, 1, 1,
0.2466521, -0.4886415, 1.181203, 1, 1, 1, 1, 1,
0.246918, -0.3123484, 1.723169, 1, 1, 1, 1, 1,
0.2488613, 0.1230273, 1.570602, 1, 1, 1, 1, 1,
0.2527437, 0.3403123, 0.5517858, 1, 1, 1, 1, 1,
0.2529958, 1.392857, 0.4344224, 1, 1, 1, 1, 1,
0.2539343, 0.310624, 0.6582294, 1, 1, 1, 1, 1,
0.2545159, 0.2677504, 0.8412656, 1, 1, 1, 1, 1,
0.2551115, -1.537068, 4.018972, 1, 1, 1, 1, 1,
0.2558445, 1.545061, -0.1726873, 1, 1, 1, 1, 1,
0.2606043, 0.09520709, 0.6760114, 1, 1, 1, 1, 1,
0.2607946, 0.9927918, 0.5944234, 1, 1, 1, 1, 1,
0.2609368, 0.8349144, 0.807521, 1, 1, 1, 1, 1,
0.2686204, 0.0007885523, 0.03630309, 1, 1, 1, 1, 1,
0.2690041, 1.284224, 1.029106, 1, 1, 1, 1, 1,
0.2692021, -0.9633027, 1.954431, 0, 0, 1, 1, 1,
0.2727094, 0.9432182, -0.8228697, 1, 0, 0, 1, 1,
0.2794487, -0.5619296, 2.867028, 1, 0, 0, 1, 1,
0.2812594, 0.5098655, -0.6392685, 1, 0, 0, 1, 1,
0.286494, -1.526192, 2.940694, 1, 0, 0, 1, 1,
0.2867638, -0.444024, 2.487329, 1, 0, 0, 1, 1,
0.2971941, -0.5066368, 3.878283, 0, 0, 0, 1, 1,
0.2995974, -0.3681704, 2.446212, 0, 0, 0, 1, 1,
0.3026172, -0.5524432, 2.229448, 0, 0, 0, 1, 1,
0.3039429, -0.6683997, 0.8665248, 0, 0, 0, 1, 1,
0.3057166, -0.1891141, 2.581637, 0, 0, 0, 1, 1,
0.3144107, -0.5314375, 3.317359, 0, 0, 0, 1, 1,
0.3164345, 0.8171322, 0.3804187, 0, 0, 0, 1, 1,
0.3187595, 0.064303, -0.1926043, 1, 1, 1, 1, 1,
0.3209611, -1.079785, 2.357531, 1, 1, 1, 1, 1,
0.3245031, -0.5765579, 2.086411, 1, 1, 1, 1, 1,
0.3252751, 1.11745, -1.074638, 1, 1, 1, 1, 1,
0.3269396, 0.7895404, 1.259856, 1, 1, 1, 1, 1,
0.3291451, 0.1135724, 2.698571, 1, 1, 1, 1, 1,
0.3303606, 0.5610198, 0.4711653, 1, 1, 1, 1, 1,
0.332718, -0.09216234, 2.19341, 1, 1, 1, 1, 1,
0.3378328, -0.4585624, 3.970427, 1, 1, 1, 1, 1,
0.3381985, 0.585535, -2.685739, 1, 1, 1, 1, 1,
0.3402994, 1.005714, 0.3207178, 1, 1, 1, 1, 1,
0.3562539, -0.6991069, 3.460563, 1, 1, 1, 1, 1,
0.3604376, -0.2189272, 1.483699, 1, 1, 1, 1, 1,
0.3617788, 0.08682603, 1.328951, 1, 1, 1, 1, 1,
0.3627455, -0.8998271, 2.944778, 1, 1, 1, 1, 1,
0.3767122, 1.778934, 1.226978, 0, 0, 1, 1, 1,
0.3791047, -0.2316368, 2.143471, 1, 0, 0, 1, 1,
0.383764, -2.66826, 3.250404, 1, 0, 0, 1, 1,
0.3872142, -0.2933794, 3.284024, 1, 0, 0, 1, 1,
0.3916062, -1.469872, 1.837586, 1, 0, 0, 1, 1,
0.3916849, 0.6804711, 1.735142, 1, 0, 0, 1, 1,
0.3938579, 0.7838697, 0.02561195, 0, 0, 0, 1, 1,
0.3960516, 1.017272, 0.4947789, 0, 0, 0, 1, 1,
0.3967728, -0.2346383, 3.594202, 0, 0, 0, 1, 1,
0.3997253, -1.212471, 3.598985, 0, 0, 0, 1, 1,
0.4034336, -0.6488558, 2.647803, 0, 0, 0, 1, 1,
0.4061213, -1.660306, 3.764564, 0, 0, 0, 1, 1,
0.4071746, -1.063825, 1.897208, 0, 0, 0, 1, 1,
0.407654, -0.8520122, 1.158585, 1, 1, 1, 1, 1,
0.413298, -0.04090666, 1.249096, 1, 1, 1, 1, 1,
0.4143037, -1.785061, 4.04336, 1, 1, 1, 1, 1,
0.416678, -0.4246489, 3.452726, 1, 1, 1, 1, 1,
0.4177459, -0.9123014, 3.671091, 1, 1, 1, 1, 1,
0.4208549, 0.1213306, 0.2240551, 1, 1, 1, 1, 1,
0.425165, 1.930717, 0.8537228, 1, 1, 1, 1, 1,
0.4326952, -0.4071202, 0.7273824, 1, 1, 1, 1, 1,
0.4346685, -1.546199, 1.59223, 1, 1, 1, 1, 1,
0.4370577, -0.2547181, 0.3260628, 1, 1, 1, 1, 1,
0.4384316, -1.28849, 2.734544, 1, 1, 1, 1, 1,
0.4387118, 0.5909724, 0.9757344, 1, 1, 1, 1, 1,
0.4416495, -1.768401, 2.270026, 1, 1, 1, 1, 1,
0.4419684, 0.2020612, 1.285355, 1, 1, 1, 1, 1,
0.4466368, 0.7606209, 0.143374, 1, 1, 1, 1, 1,
0.4519381, 0.06371166, 0.06363564, 0, 0, 1, 1, 1,
0.4557219, -0.03796104, 0.4326514, 1, 0, 0, 1, 1,
0.4613521, -1.2894, 2.563314, 1, 0, 0, 1, 1,
0.4659714, 1.421847, -0.6371514, 1, 0, 0, 1, 1,
0.467231, 0.03492409, 1.917398, 1, 0, 0, 1, 1,
0.4673187, -0.1366149, 1.144567, 1, 0, 0, 1, 1,
0.4677432, -0.2237114, 2.005376, 0, 0, 0, 1, 1,
0.4695806, -0.8191539, 0.4243021, 0, 0, 0, 1, 1,
0.4760699, 1.363549, -0.9309511, 0, 0, 0, 1, 1,
0.4787604, -0.07879286, 1.095259, 0, 0, 0, 1, 1,
0.4842856, 0.8896233, 1.020394, 0, 0, 0, 1, 1,
0.4859233, 1.644312, 1.277476, 0, 0, 0, 1, 1,
0.4863089, -2.454639, 3.563513, 0, 0, 0, 1, 1,
0.4910146, 0.8684636, -0.06193147, 1, 1, 1, 1, 1,
0.4953296, -2.456558, 2.020917, 1, 1, 1, 1, 1,
0.4976541, -0.7128206, 1.332306, 1, 1, 1, 1, 1,
0.4986398, 0.7987882, 0.2726539, 1, 1, 1, 1, 1,
0.5000442, 0.1752263, 0.5974035, 1, 1, 1, 1, 1,
0.5048652, 0.3771565, -0.3115545, 1, 1, 1, 1, 1,
0.5129846, -0.1213931, 0.09449744, 1, 1, 1, 1, 1,
0.5153931, -0.8323534, 3.833447, 1, 1, 1, 1, 1,
0.518211, 1.824482, -0.1063771, 1, 1, 1, 1, 1,
0.5185503, 0.556222, 0.7206616, 1, 1, 1, 1, 1,
0.5209329, 0.8498901, -0.25, 1, 1, 1, 1, 1,
0.528542, -2.364552, 2.556766, 1, 1, 1, 1, 1,
0.5302228, 0.9137016, 0.4916499, 1, 1, 1, 1, 1,
0.5340844, -0.571866, 2.271939, 1, 1, 1, 1, 1,
0.5395236, 1.497955, 0.46031, 1, 1, 1, 1, 1,
0.5429491, -1.092574, 2.269327, 0, 0, 1, 1, 1,
0.5454567, 1.87443, 1.623196, 1, 0, 0, 1, 1,
0.5460005, 0.7777145, 0.180933, 1, 0, 0, 1, 1,
0.546784, -0.3913156, 0.8232697, 1, 0, 0, 1, 1,
0.5474671, -0.8914518, 4.010751, 1, 0, 0, 1, 1,
0.5480786, -1.654329, 1.476432, 1, 0, 0, 1, 1,
0.5536372, -0.3176008, 3.663994, 0, 0, 0, 1, 1,
0.5560864, 1.098124, 2.722004, 0, 0, 0, 1, 1,
0.5586363, -1.048562, 2.601779, 0, 0, 0, 1, 1,
0.5591744, -0.3935109, 2.197346, 0, 0, 0, 1, 1,
0.5599682, 0.4908154, 0.218922, 0, 0, 0, 1, 1,
0.5670692, 1.409017, 0.9744888, 0, 0, 0, 1, 1,
0.5703412, -0.6154028, 2.673761, 0, 0, 0, 1, 1,
0.5743853, -0.8180003, 2.931878, 1, 1, 1, 1, 1,
0.5751134, 0.4257057, 1.83915, 1, 1, 1, 1, 1,
0.5819452, -0.07829259, 1.461706, 1, 1, 1, 1, 1,
0.5877544, -1.986972, 4.392913, 1, 1, 1, 1, 1,
0.588157, 1.361928, -0.0819755, 1, 1, 1, 1, 1,
0.5903681, -2.10507, 2.477938, 1, 1, 1, 1, 1,
0.5926751, 1.686802, 0.8283208, 1, 1, 1, 1, 1,
0.5950338, 1.127673, 2.806233, 1, 1, 1, 1, 1,
0.5962507, -0.08506609, 1.642466, 1, 1, 1, 1, 1,
0.6182058, 0.4647174, -0.9718387, 1, 1, 1, 1, 1,
0.6198118, -0.6995092, 3.249388, 1, 1, 1, 1, 1,
0.6217291, 0.5904727, 1.569949, 1, 1, 1, 1, 1,
0.625711, 0.06253163, 0.710963, 1, 1, 1, 1, 1,
0.6291736, 0.3129259, 0.9255188, 1, 1, 1, 1, 1,
0.6326904, -0.02709669, 1.393425, 1, 1, 1, 1, 1,
0.6342678, -1.21665, 2.186756, 0, 0, 1, 1, 1,
0.6363401, 2.920576, 0.05076613, 1, 0, 0, 1, 1,
0.640353, 0.9639928, 0.4946038, 1, 0, 0, 1, 1,
0.6437237, -0.8959126, 1.97165, 1, 0, 0, 1, 1,
0.6440024, -1.424917, 1.683761, 1, 0, 0, 1, 1,
0.6528232, -0.2627195, 3.967139, 1, 0, 0, 1, 1,
0.6554746, 0.08657513, 3.545242, 0, 0, 0, 1, 1,
0.6581546, 0.7480602, 1.772544, 0, 0, 0, 1, 1,
0.6598912, -1.279094, 3.500693, 0, 0, 0, 1, 1,
0.6649446, -1.250726, 3.143878, 0, 0, 0, 1, 1,
0.6652527, 1.10331, -0.2731365, 0, 0, 0, 1, 1,
0.6712382, 0.4408007, 1.876932, 0, 0, 0, 1, 1,
0.6766476, 0.9680445, 1.281365, 0, 0, 0, 1, 1,
0.6907077, 0.6746083, -0.1245913, 1, 1, 1, 1, 1,
0.6959996, -1.196231, 1.614947, 1, 1, 1, 1, 1,
0.6991143, -0.6898621, 2.294372, 1, 1, 1, 1, 1,
0.7006869, 0.04202302, 0.6257048, 1, 1, 1, 1, 1,
0.7033817, 1.421796, -0.3027147, 1, 1, 1, 1, 1,
0.7045131, -0.2386501, 2.058043, 1, 1, 1, 1, 1,
0.705462, 0.2297932, 3.441553, 1, 1, 1, 1, 1,
0.7153825, 0.2967049, 1.931054, 1, 1, 1, 1, 1,
0.7174743, -0.1912537, 1.164141, 1, 1, 1, 1, 1,
0.7176297, -0.580394, 3.486982, 1, 1, 1, 1, 1,
0.7188385, -1.098323, 3.323725, 1, 1, 1, 1, 1,
0.7206047, 0.7931761, 1.321448, 1, 1, 1, 1, 1,
0.7218003, 0.2336169, 2.336607, 1, 1, 1, 1, 1,
0.7240742, 0.8430815, 3.728897, 1, 1, 1, 1, 1,
0.7260347, -0.4247292, 1.505476, 1, 1, 1, 1, 1,
0.730149, 0.7739375, 0.161832, 0, 0, 1, 1, 1,
0.7306837, -0.3921036, 0.7165892, 1, 0, 0, 1, 1,
0.7359115, -0.05317275, 2.373443, 1, 0, 0, 1, 1,
0.7364898, -0.677756, 1.554197, 1, 0, 0, 1, 1,
0.7366278, 1.523976, 1.264057, 1, 0, 0, 1, 1,
0.7386551, 0.4294353, 0.1448046, 1, 0, 0, 1, 1,
0.7431156, -0.8337719, 3.175524, 0, 0, 0, 1, 1,
0.7487419, -0.05395469, 1.39543, 0, 0, 0, 1, 1,
0.749432, 1.808417, -0.03856362, 0, 0, 0, 1, 1,
0.7515659, 1.561914, 0.04735962, 0, 0, 0, 1, 1,
0.7530251, -0.7327981, 3.726373, 0, 0, 0, 1, 1,
0.7539186, -0.1189716, 2.08413, 0, 0, 0, 1, 1,
0.7564356, 1.54195, -0.2989012, 0, 0, 0, 1, 1,
0.7570429, -1.829638, 2.726166, 1, 1, 1, 1, 1,
0.7582985, 0.5224826, 2.984066, 1, 1, 1, 1, 1,
0.7643005, 0.2121744, 1.88434, 1, 1, 1, 1, 1,
0.7709506, -0.06452785, 2.199777, 1, 1, 1, 1, 1,
0.7736134, 0.6718941, 0.2444391, 1, 1, 1, 1, 1,
0.774511, -1.590194, 4.732069, 1, 1, 1, 1, 1,
0.7764851, -0.249819, 2.616508, 1, 1, 1, 1, 1,
0.7787855, 0.101659, -0.4292015, 1, 1, 1, 1, 1,
0.7817428, 0.1619819, 2.119503, 1, 1, 1, 1, 1,
0.7821207, -0.2663034, 1.976615, 1, 1, 1, 1, 1,
0.7834362, 1.408073, 1.36488, 1, 1, 1, 1, 1,
0.7929623, 1.72043, 0.006099428, 1, 1, 1, 1, 1,
0.7932551, 1.216794, 1.674003, 1, 1, 1, 1, 1,
0.8031942, 0.9570721, 0.6186987, 1, 1, 1, 1, 1,
0.8090628, 1.177255, 2.364674, 1, 1, 1, 1, 1,
0.8097007, 0.6813201, 0.627347, 0, 0, 1, 1, 1,
0.8107665, 0.8108357, 0.8455743, 1, 0, 0, 1, 1,
0.8108149, 0.8503835, 1.303754, 1, 0, 0, 1, 1,
0.8118483, -2.294339, 4.138498, 1, 0, 0, 1, 1,
0.8171659, 0.5603049, 1.293166, 1, 0, 0, 1, 1,
0.8189492, -0.6999577, 2.461986, 1, 0, 0, 1, 1,
0.8255576, 0.3894608, 4.037998, 0, 0, 0, 1, 1,
0.8333665, -1.004267, 4.033867, 0, 0, 0, 1, 1,
0.8379633, -0.5126042, 2.15802, 0, 0, 0, 1, 1,
0.8386527, -1.012462, 3.46141, 0, 0, 0, 1, 1,
0.8452122, -0.192543, 0.5841149, 0, 0, 0, 1, 1,
0.8477701, 0.8733833, -0.9587131, 0, 0, 0, 1, 1,
0.8565442, -0.6612535, 3.308149, 0, 0, 0, 1, 1,
0.856945, -0.1825576, 2.806501, 1, 1, 1, 1, 1,
0.8624449, 1.321526, 2.594991, 1, 1, 1, 1, 1,
0.8666466, -0.6848999, 1.809123, 1, 1, 1, 1, 1,
0.8713753, -1.46221, 2.455163, 1, 1, 1, 1, 1,
0.8730911, 0.8337627, 2.40448, 1, 1, 1, 1, 1,
0.8763691, 1.233975, -0.01381529, 1, 1, 1, 1, 1,
0.8778997, 0.6403372, 1.633499, 1, 1, 1, 1, 1,
0.8796307, 2.387285, -0.4380763, 1, 1, 1, 1, 1,
0.8914785, -0.7557154, 2.310652, 1, 1, 1, 1, 1,
0.8937783, -1.456077, 1.122174, 1, 1, 1, 1, 1,
0.8982999, -1.301533, 2.777393, 1, 1, 1, 1, 1,
0.8995696, -0.3266297, 0.7827123, 1, 1, 1, 1, 1,
0.9007989, -1.234301, 2.392887, 1, 1, 1, 1, 1,
0.9032744, 0.6636225, -0.05876024, 1, 1, 1, 1, 1,
0.9034522, -1.066256, 1.754887, 1, 1, 1, 1, 1,
0.905353, 0.3887587, 0.7694677, 0, 0, 1, 1, 1,
0.9054169, -0.9818229, 1.4677, 1, 0, 0, 1, 1,
0.9072519, 1.011321, -1.028653, 1, 0, 0, 1, 1,
0.9076983, -0.229105, 2.548316, 1, 0, 0, 1, 1,
0.9115807, -0.5352873, 3.432824, 1, 0, 0, 1, 1,
0.9129534, -0.4868481, 2.569778, 1, 0, 0, 1, 1,
0.9130783, 0.423446, 1.549167, 0, 0, 0, 1, 1,
0.9153621, -2.271934, 2.318354, 0, 0, 0, 1, 1,
0.9198221, -0.5815127, 2.011817, 0, 0, 0, 1, 1,
0.924163, -1.678112, 2.61556, 0, 0, 0, 1, 1,
0.9289774, 0.1394283, 3.207796, 0, 0, 0, 1, 1,
0.9329934, 0.2554896, -0.1469566, 0, 0, 0, 1, 1,
0.9396691, 0.9121314, 0.5632378, 0, 0, 0, 1, 1,
0.9505367, 0.8555551, 2.38285, 1, 1, 1, 1, 1,
0.9572531, -0.7597709, 3.214861, 1, 1, 1, 1, 1,
0.959483, -0.1757856, 1.016422, 1, 1, 1, 1, 1,
0.9630414, -0.3069416, 1.774579, 1, 1, 1, 1, 1,
0.9641476, 1.53608, 1.667968, 1, 1, 1, 1, 1,
0.9704853, -0.5677595, 2.866061, 1, 1, 1, 1, 1,
0.9706931, -0.2617142, 0.751978, 1, 1, 1, 1, 1,
0.971883, -0.5674713, 2.063007, 1, 1, 1, 1, 1,
0.9732738, -0.1910664, 2.600107, 1, 1, 1, 1, 1,
0.9737852, 0.4645078, 0.4845343, 1, 1, 1, 1, 1,
0.9804304, -0.5746622, 0.2055717, 1, 1, 1, 1, 1,
0.9936587, 0.4285366, 1.238677, 1, 1, 1, 1, 1,
0.9957548, 0.9495547, 1.331403, 1, 1, 1, 1, 1,
1.002432, -1.400833, 2.501591, 1, 1, 1, 1, 1,
1.005328, 0.5300487, 1.185522, 1, 1, 1, 1, 1,
1.008251, -0.6736088, 2.27129, 0, 0, 1, 1, 1,
1.009164, -1.445432, 0.8734265, 1, 0, 0, 1, 1,
1.011093, 2.043334, -0.7122698, 1, 0, 0, 1, 1,
1.023388, 1.031161, -1.014528, 1, 0, 0, 1, 1,
1.026911, -0.3378048, 3.089718, 1, 0, 0, 1, 1,
1.036171, 0.6669509, 0.6346628, 1, 0, 0, 1, 1,
1.038039, -0.1072912, 0.7043594, 0, 0, 0, 1, 1,
1.048392, -1.082125, 2.316006, 0, 0, 0, 1, 1,
1.050566, 0.6436693, 2.493085, 0, 0, 0, 1, 1,
1.050753, -0.3816648, 2.288922, 0, 0, 0, 1, 1,
1.060391, -1.366126, 2.383515, 0, 0, 0, 1, 1,
1.060743, -0.8914827, 1.128942, 0, 0, 0, 1, 1,
1.06487, 1.278571, -0.5639725, 0, 0, 0, 1, 1,
1.069096, -0.4418184, 2.472537, 1, 1, 1, 1, 1,
1.07019, 0.2792769, 0.5666116, 1, 1, 1, 1, 1,
1.074727, 1.830498, 1.774133, 1, 1, 1, 1, 1,
1.086395, 0.9863124, -0.1150626, 1, 1, 1, 1, 1,
1.090309, 0.7914183, 2.334186, 1, 1, 1, 1, 1,
1.101406, 1.850166, 1.455682, 1, 1, 1, 1, 1,
1.10182, -0.9031575, 2.72689, 1, 1, 1, 1, 1,
1.102232, -1.57356, 2.388039, 1, 1, 1, 1, 1,
1.106869, -1.310721, 2.749091, 1, 1, 1, 1, 1,
1.107281, -1.259485, 3.00056, 1, 1, 1, 1, 1,
1.109462, -0.3066163, 2.896586, 1, 1, 1, 1, 1,
1.111253, -2.545549, 3.05067, 1, 1, 1, 1, 1,
1.111518, -0.4434902, 0.6315687, 1, 1, 1, 1, 1,
1.116686, 0.1709301, 1.719055, 1, 1, 1, 1, 1,
1.118593, -1.409182, 2.72847, 1, 1, 1, 1, 1,
1.136539, -0.445263, 0.8896625, 0, 0, 1, 1, 1,
1.141411, -0.1233214, 1.728225, 1, 0, 0, 1, 1,
1.144424, 1.583813, 0.677002, 1, 0, 0, 1, 1,
1.146667, 1.00956, 0.4673445, 1, 0, 0, 1, 1,
1.157569, 0.3885857, 2.765691, 1, 0, 0, 1, 1,
1.162359, -0.6486983, 0.3956514, 1, 0, 0, 1, 1,
1.168025, 1.958169, 0.2935138, 0, 0, 0, 1, 1,
1.1755, 0.638546, 1.300091, 0, 0, 0, 1, 1,
1.17561, 0.08631307, 1.832924, 0, 0, 0, 1, 1,
1.179609, -0.3526627, 2.555046, 0, 0, 0, 1, 1,
1.183295, -1.059242, 2.767524, 0, 0, 0, 1, 1,
1.188215, -0.385462, 1.718148, 0, 0, 0, 1, 1,
1.189023, 1.718775, 0.3015899, 0, 0, 0, 1, 1,
1.191002, 0.655467, 0.03324832, 1, 1, 1, 1, 1,
1.196603, 1.059664, 1.527914, 1, 1, 1, 1, 1,
1.197107, 0.2992121, 1.514766, 1, 1, 1, 1, 1,
1.212041, -0.05823592, 3.195444, 1, 1, 1, 1, 1,
1.218441, -0.1706203, -0.1404395, 1, 1, 1, 1, 1,
1.227573, 2.104616, 0.9265648, 1, 1, 1, 1, 1,
1.235068, -0.4273711, 1.437572, 1, 1, 1, 1, 1,
1.240169, 0.9097126, -1.011071, 1, 1, 1, 1, 1,
1.241204, -1.017323, 1.703951, 1, 1, 1, 1, 1,
1.244041, -0.2619401, 2.855221, 1, 1, 1, 1, 1,
1.24568, -0.2809543, 0.4036345, 1, 1, 1, 1, 1,
1.258598, 0.02913328, 2.509213, 1, 1, 1, 1, 1,
1.258949, 0.5269777, -0.09267672, 1, 1, 1, 1, 1,
1.260433, 0.2042631, 1.419954, 1, 1, 1, 1, 1,
1.272909, -1.012524, 1.005053, 1, 1, 1, 1, 1,
1.273645, 0.6931275, 0.04190239, 0, 0, 1, 1, 1,
1.277292, -1.723195, 3.721519, 1, 0, 0, 1, 1,
1.285847, 0.4490494, 3.073669, 1, 0, 0, 1, 1,
1.289249, 1.929513, 0.6935534, 1, 0, 0, 1, 1,
1.297806, -0.1805021, 1.479467, 1, 0, 0, 1, 1,
1.307277, -0.2292645, 0.8795084, 1, 0, 0, 1, 1,
1.31856, 0.2924868, 1.909078, 0, 0, 0, 1, 1,
1.321759, -0.6152651, 1.837927, 0, 0, 0, 1, 1,
1.322907, -0.8289375, 2.644438, 0, 0, 0, 1, 1,
1.335963, 0.3135546, 1.793833, 0, 0, 0, 1, 1,
1.339148, 0.02365945, -0.2705879, 0, 0, 0, 1, 1,
1.344986, -1.70633, 1.511473, 0, 0, 0, 1, 1,
1.346363, 0.5874711, 1.522127, 0, 0, 0, 1, 1,
1.350522, 0.9911798, 1.139618, 1, 1, 1, 1, 1,
1.357596, 0.4800529, 2.325064, 1, 1, 1, 1, 1,
1.360098, -0.2209822, 1.677108, 1, 1, 1, 1, 1,
1.377486, 0.7735281, 1.736112, 1, 1, 1, 1, 1,
1.379198, -0.7500175, 2.944289, 1, 1, 1, 1, 1,
1.380171, 0.6393018, 1.017906, 1, 1, 1, 1, 1,
1.385295, -0.01084164, 0.9497003, 1, 1, 1, 1, 1,
1.390638, -1.380357, 2.395795, 1, 1, 1, 1, 1,
1.398872, 0.9190784, 0.3686419, 1, 1, 1, 1, 1,
1.404992, 0.1216415, 2.837863, 1, 1, 1, 1, 1,
1.410938, -0.8373645, -1.566283, 1, 1, 1, 1, 1,
1.413607, -0.6944391, 3.023479, 1, 1, 1, 1, 1,
1.429389, -0.1512431, 0.1992517, 1, 1, 1, 1, 1,
1.4306, -1.221598, 2.566054, 1, 1, 1, 1, 1,
1.437765, 1.432434, 0.851842, 1, 1, 1, 1, 1,
1.447817, -0.1133141, 0.2039073, 0, 0, 1, 1, 1,
1.468437, 2.566071, -0.4468521, 1, 0, 0, 1, 1,
1.47187, -0.3030494, 0.989937, 1, 0, 0, 1, 1,
1.472117, -0.9346328, 3.110041, 1, 0, 0, 1, 1,
1.476784, -1.262764, 2.177701, 1, 0, 0, 1, 1,
1.484861, -1.314391, 2.551852, 1, 0, 0, 1, 1,
1.485792, 0.7048268, 0.9282953, 0, 0, 0, 1, 1,
1.486835, 2.226693, 0.633368, 0, 0, 0, 1, 1,
1.504569, -0.1286126, 3.661536, 0, 0, 0, 1, 1,
1.504906, -0.1178515, 2.039506, 0, 0, 0, 1, 1,
1.507422, -0.3405054, 1.281654, 0, 0, 0, 1, 1,
1.508562, -1.664959, 4.152048, 0, 0, 0, 1, 1,
1.513234, -1.875158, 2.52316, 0, 0, 0, 1, 1,
1.52343, 0.4609824, 1.353192, 1, 1, 1, 1, 1,
1.526169, 0.5168674, 1.391356, 1, 1, 1, 1, 1,
1.52694, 1.189158, 1.297506, 1, 1, 1, 1, 1,
1.531473, 0.9564239, 0.02699262, 1, 1, 1, 1, 1,
1.533106, 0.4395013, 0.6676354, 1, 1, 1, 1, 1,
1.533807, 0.1461438, 0.1604493, 1, 1, 1, 1, 1,
1.53907, -0.3571198, 2.532307, 1, 1, 1, 1, 1,
1.54806, 0.2178103, 2.403507, 1, 1, 1, 1, 1,
1.549219, 0.6488667, 2.04112, 1, 1, 1, 1, 1,
1.556194, 0.2002723, -0.5069175, 1, 1, 1, 1, 1,
1.567684, -0.6026674, 0.9350706, 1, 1, 1, 1, 1,
1.575375, 0.02195843, 1.197984, 1, 1, 1, 1, 1,
1.584284, -1.047652, 3.612036, 1, 1, 1, 1, 1,
1.586364, 0.2365061, 1.58238, 1, 1, 1, 1, 1,
1.597736, -1.087556, 2.21844, 1, 1, 1, 1, 1,
1.61906, -0.09368135, 2.311307, 0, 0, 1, 1, 1,
1.624627, 0.176621, 0.8951993, 1, 0, 0, 1, 1,
1.627836, -0.785365, 1.726126, 1, 0, 0, 1, 1,
1.631447, 1.614128, 0.7343324, 1, 0, 0, 1, 1,
1.635872, 2.590701, 0.09729919, 1, 0, 0, 1, 1,
1.640576, 0.3924829, 1.014646, 1, 0, 0, 1, 1,
1.642693, 0.2588212, 1.337226, 0, 0, 0, 1, 1,
1.647057, -1.128505, 0.9360352, 0, 0, 0, 1, 1,
1.6676, 2.330337, 0.1818788, 0, 0, 0, 1, 1,
1.6741, 0.9125965, 0.9476053, 0, 0, 0, 1, 1,
1.676828, -0.4831401, 0.9255295, 0, 0, 0, 1, 1,
1.688054, -0.003177557, 2.559255, 0, 0, 0, 1, 1,
1.688551, -0.4806022, -0.220314, 0, 0, 0, 1, 1,
1.721534, 0.4308403, 2.40692, 1, 1, 1, 1, 1,
1.729427, -0.7247143, 2.152408, 1, 1, 1, 1, 1,
1.731951, -0.9972886, 2.532872, 1, 1, 1, 1, 1,
1.780799, 0.3141059, 2.827588, 1, 1, 1, 1, 1,
1.781429, 0.7283384, -0.8419418, 1, 1, 1, 1, 1,
1.786761, -0.03169262, 1.945093, 1, 1, 1, 1, 1,
1.829831, -1.035009, 1.940583, 1, 1, 1, 1, 1,
1.83746, 0.1369694, 1.735706, 1, 1, 1, 1, 1,
1.839063, 0.7103191, 0.379247, 1, 1, 1, 1, 1,
1.896888, -1.870106, 2.206518, 1, 1, 1, 1, 1,
1.903677, -0.0196804, 2.918974, 1, 1, 1, 1, 1,
1.904052, 0.3108949, 2.854511, 1, 1, 1, 1, 1,
1.953943, 0.7390003, 0.2881946, 1, 1, 1, 1, 1,
1.961667, -0.7516507, 2.806837, 1, 1, 1, 1, 1,
1.971763, 0.9690333, -0.3972458, 1, 1, 1, 1, 1,
1.97204, 0.372061, 2.858625, 0, 0, 1, 1, 1,
1.980549, 0.5432515, 2.818144, 1, 0, 0, 1, 1,
1.990536, -1.879735, 0.1693229, 1, 0, 0, 1, 1,
2.01028, -1.153043, 3.821447, 1, 0, 0, 1, 1,
2.029425, -1.000378, 0.2815112, 1, 0, 0, 1, 1,
2.085847, -0.6757318, 1.2969, 1, 0, 0, 1, 1,
2.09662, 1.123308, 0.4229405, 0, 0, 0, 1, 1,
2.125631, -2.191223, 2.103294, 0, 0, 0, 1, 1,
2.153823, 0.1534651, 1.454137, 0, 0, 0, 1, 1,
2.182177, 0.01278079, 1.558292, 0, 0, 0, 1, 1,
2.198924, -1.145192, 0.7552912, 0, 0, 0, 1, 1,
2.246921, -0.4965901, 1.69544, 0, 0, 0, 1, 1,
2.247959, -0.2543335, 2.915979, 0, 0, 0, 1, 1,
2.251009, -0.5724608, 1.17745, 1, 1, 1, 1, 1,
2.310041, -1.179284, 1.478555, 1, 1, 1, 1, 1,
2.524746, -0.3937318, 2.440361, 1, 1, 1, 1, 1,
2.546095, 0.4009928, -0.1810225, 1, 1, 1, 1, 1,
2.567549, 0.6632895, 0.6961523, 1, 1, 1, 1, 1,
2.693476, 0.2254062, 1.11425, 1, 1, 1, 1, 1,
2.930995, -0.8468877, 0.6325604, 1, 1, 1, 1, 1
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
var radius = 9.463932;
var distance = 33.24166;
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
mvMatrix.translate( 0.07621217, 0.3500968, 0.1251423 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.24166);
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
