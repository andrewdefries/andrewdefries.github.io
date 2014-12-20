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
-2.978821, -3.122212, -1.949564, 1, 0, 0, 1,
-2.914986, 1.084278, -1.59763, 1, 0.007843138, 0, 1,
-2.758529, 0.1254562, -1.744446, 1, 0.01176471, 0, 1,
-2.722288, 0.1316639, -2.273915, 1, 0.01960784, 0, 1,
-2.540739, -0.6603565, -1.544805, 1, 0.02352941, 0, 1,
-2.475299, -1.168654, -2.700131, 1, 0.03137255, 0, 1,
-2.472269, -0.6260402, -2.670792, 1, 0.03529412, 0, 1,
-2.425924, 0.1499893, -2.338943, 1, 0.04313726, 0, 1,
-2.329761, -0.02107667, -0.2031746, 1, 0.04705882, 0, 1,
-2.282475, -0.1918597, -1.783662, 1, 0.05490196, 0, 1,
-2.280242, -0.2724461, -2.839218, 1, 0.05882353, 0, 1,
-2.252351, 0.668384, -2.918541, 1, 0.06666667, 0, 1,
-2.247691, 0.3002773, -2.29145, 1, 0.07058824, 0, 1,
-2.213194, -0.08933397, -1.586556, 1, 0.07843138, 0, 1,
-2.206862, -0.06925456, -1.188826, 1, 0.08235294, 0, 1,
-2.181272, 1.318164, -1.634004, 1, 0.09019608, 0, 1,
-2.1805, -0.05000175, -2.931154, 1, 0.09411765, 0, 1,
-2.179814, -0.4052049, -2.177056, 1, 0.1019608, 0, 1,
-2.175242, -0.9303948, -1.603085, 1, 0.1098039, 0, 1,
-2.162477, -0.5661133, -0.8331335, 1, 0.1137255, 0, 1,
-2.130587, -0.0167301, -0.7791717, 1, 0.1215686, 0, 1,
-2.067729, -1.658149, -3.071521, 1, 0.1254902, 0, 1,
-2.063974, 0.8982078, -0.7173111, 1, 0.1333333, 0, 1,
-2.046573, 0.9757691, 1.07787, 1, 0.1372549, 0, 1,
-2.033788, -0.7616233, -1.944281, 1, 0.145098, 0, 1,
-2.013152, -0.9640624, -4.516692, 1, 0.1490196, 0, 1,
-1.984911, 2.380614, 1.11368, 1, 0.1568628, 0, 1,
-1.979575, -1.72831, -3.698404, 1, 0.1607843, 0, 1,
-1.958932, 0.9403529, -1.802241, 1, 0.1686275, 0, 1,
-1.906767, 1.578055, 0.6080849, 1, 0.172549, 0, 1,
-1.864956, -0.3068155, -1.891494, 1, 0.1803922, 0, 1,
-1.859946, 0.5788154, 0.4269285, 1, 0.1843137, 0, 1,
-1.858481, -0.3915582, -2.688329, 1, 0.1921569, 0, 1,
-1.821551, -1.163656, -2.293108, 1, 0.1960784, 0, 1,
-1.803446, -0.286387, -1.241941, 1, 0.2039216, 0, 1,
-1.794733, -0.2573217, -1.978208, 1, 0.2117647, 0, 1,
-1.793903, -1.579303, -2.163337, 1, 0.2156863, 0, 1,
-1.784652, -1.386176, -2.287992, 1, 0.2235294, 0, 1,
-1.78435, 0.2145322, -1.08393, 1, 0.227451, 0, 1,
-1.77729, 0.1234916, -1.629779, 1, 0.2352941, 0, 1,
-1.766022, -1.263776, -3.641676, 1, 0.2392157, 0, 1,
-1.756371, 0.239194, -2.632559, 1, 0.2470588, 0, 1,
-1.742862, 0.5047243, -2.169294, 1, 0.2509804, 0, 1,
-1.701314, 0.6306884, -2.275393, 1, 0.2588235, 0, 1,
-1.679496, 1.664873, 0.2116618, 1, 0.2627451, 0, 1,
-1.670246, -0.5503137, -2.500205, 1, 0.2705882, 0, 1,
-1.645667, -0.2236325, -0.4797516, 1, 0.2745098, 0, 1,
-1.638971, 0.7421446, 0.4524762, 1, 0.282353, 0, 1,
-1.626722, -1.515633, -0.4326693, 1, 0.2862745, 0, 1,
-1.618554, 1.737228, 0.1678574, 1, 0.2941177, 0, 1,
-1.616597, 0.8696859, -2.592724, 1, 0.3019608, 0, 1,
-1.608366, -1.93167, -2.539411, 1, 0.3058824, 0, 1,
-1.599668, -0.4130282, 0.3712621, 1, 0.3137255, 0, 1,
-1.593236, -0.1154864, -1.789942, 1, 0.3176471, 0, 1,
-1.591415, 1.132498, -1.492319, 1, 0.3254902, 0, 1,
-1.587448, 0.2667956, -2.755893, 1, 0.3294118, 0, 1,
-1.585141, -1.094142, -2.528751, 1, 0.3372549, 0, 1,
-1.581199, 1.15036, -0.3711362, 1, 0.3411765, 0, 1,
-1.576577, 1.147607, -1.966261, 1, 0.3490196, 0, 1,
-1.569535, 0.5958993, -1.016647, 1, 0.3529412, 0, 1,
-1.568412, -0.2320883, -2.568473, 1, 0.3607843, 0, 1,
-1.562305, -0.44137, -0.5423632, 1, 0.3647059, 0, 1,
-1.557338, 0.7140993, -2.166634, 1, 0.372549, 0, 1,
-1.544891, 1.296464, -0.6171086, 1, 0.3764706, 0, 1,
-1.540748, 0.4135453, -0.1965902, 1, 0.3843137, 0, 1,
-1.539831, -1.061626, -3.171971, 1, 0.3882353, 0, 1,
-1.535224, -1.32339, -1.010211, 1, 0.3960784, 0, 1,
-1.533881, 0.5746446, -0.8832827, 1, 0.4039216, 0, 1,
-1.533735, -1.415398, -0.4424375, 1, 0.4078431, 0, 1,
-1.525616, 0.6621515, -0.4361924, 1, 0.4156863, 0, 1,
-1.523087, -1.574585, -1.802395, 1, 0.4196078, 0, 1,
-1.522343, -0.390571, -1.443925, 1, 0.427451, 0, 1,
-1.499522, -0.1284024, -1.471747, 1, 0.4313726, 0, 1,
-1.491926, -1.853084, -3.123398, 1, 0.4392157, 0, 1,
-1.475088, 0.3768044, -1.791071, 1, 0.4431373, 0, 1,
-1.468589, 0.05009376, -2.330314, 1, 0.4509804, 0, 1,
-1.457898, 0.06106474, -2.535439, 1, 0.454902, 0, 1,
-1.452219, -0.3739538, -2.261997, 1, 0.4627451, 0, 1,
-1.429638, -1.088216, -2.305929, 1, 0.4666667, 0, 1,
-1.422582, -0.4401531, -2.552701, 1, 0.4745098, 0, 1,
-1.422343, 0.863699, -1.77653, 1, 0.4784314, 0, 1,
-1.418934, 0.1179089, -2.150834, 1, 0.4862745, 0, 1,
-1.41436, 0.1621857, -1.712312, 1, 0.4901961, 0, 1,
-1.411324, 1.079149, -0.6214225, 1, 0.4980392, 0, 1,
-1.40327, 2.442838, -0.9776688, 1, 0.5058824, 0, 1,
-1.398219, -0.1433887, -1.626934, 1, 0.509804, 0, 1,
-1.390816, 1.018209, -2.384991, 1, 0.5176471, 0, 1,
-1.385764, -0.5693066, -3.686333, 1, 0.5215687, 0, 1,
-1.385323, -1.784971, -1.76424, 1, 0.5294118, 0, 1,
-1.369383, -1.85249, -3.213464, 1, 0.5333334, 0, 1,
-1.362985, -1.017469, -2.656124, 1, 0.5411765, 0, 1,
-1.354739, -0.3908947, -2.274936, 1, 0.5450981, 0, 1,
-1.35079, -1.080944, -3.79921, 1, 0.5529412, 0, 1,
-1.341835, 1.058272, -0.8098043, 1, 0.5568628, 0, 1,
-1.338891, -0.8066869, -3.166339, 1, 0.5647059, 0, 1,
-1.336907, 0.8085372, -0.1905391, 1, 0.5686275, 0, 1,
-1.336496, 0.1820758, -1.964473, 1, 0.5764706, 0, 1,
-1.329037, 1.058922, 1.134417, 1, 0.5803922, 0, 1,
-1.327388, 2.000328, -0.342929, 1, 0.5882353, 0, 1,
-1.320014, -0.8756698, -1.971744, 1, 0.5921569, 0, 1,
-1.302655, -0.7013692, -2.957387, 1, 0.6, 0, 1,
-1.296942, 0.990508, -1.635412, 1, 0.6078432, 0, 1,
-1.288467, 0.4636033, -0.7384118, 1, 0.6117647, 0, 1,
-1.287479, 0.7802083, -0.2699505, 1, 0.6196079, 0, 1,
-1.286092, -3.223298, -1.55887, 1, 0.6235294, 0, 1,
-1.27356, -0.1641838, -2.614373, 1, 0.6313726, 0, 1,
-1.271584, -1.325197, -0.297898, 1, 0.6352941, 0, 1,
-1.270509, -1.190514, -3.332347, 1, 0.6431373, 0, 1,
-1.269828, 0.05233002, -1.464323, 1, 0.6470588, 0, 1,
-1.268865, -1.616621, -3.627161, 1, 0.654902, 0, 1,
-1.241418, -1.539179, -2.224326, 1, 0.6588235, 0, 1,
-1.239443, -1.503645, -3.492873, 1, 0.6666667, 0, 1,
-1.238902, 0.5996405, -0.02529271, 1, 0.6705883, 0, 1,
-1.237627, -0.3254372, -1.577145, 1, 0.6784314, 0, 1,
-1.227878, 0.6057515, -0.643811, 1, 0.682353, 0, 1,
-1.226955, 1.498887, 0.4087201, 1, 0.6901961, 0, 1,
-1.22422, 0.5511342, -0.5187657, 1, 0.6941177, 0, 1,
-1.222713, -1.70749, -2.874398, 1, 0.7019608, 0, 1,
-1.207549, -1.423307, -1.22693, 1, 0.7098039, 0, 1,
-1.200859, 1.323381, -0.5066548, 1, 0.7137255, 0, 1,
-1.196149, -1.266713, -2.035928, 1, 0.7215686, 0, 1,
-1.1926, -1.659518, -0.8443339, 1, 0.7254902, 0, 1,
-1.191679, -0.1791365, -1.761916, 1, 0.7333333, 0, 1,
-1.189781, 1.179751, -1.439442, 1, 0.7372549, 0, 1,
-1.181492, 0.2151116, -1.051587, 1, 0.7450981, 0, 1,
-1.1812, -0.6224721, -3.235265, 1, 0.7490196, 0, 1,
-1.178525, 1.157863, -0.1175221, 1, 0.7568628, 0, 1,
-1.178238, -1.49347, -0.1179271, 1, 0.7607843, 0, 1,
-1.173174, -1.169872, -1.798837, 1, 0.7686275, 0, 1,
-1.165506, -0.8082931, -3.319818, 1, 0.772549, 0, 1,
-1.156801, -0.7474064, -2.379639, 1, 0.7803922, 0, 1,
-1.154502, 1.407972, -1.34637, 1, 0.7843137, 0, 1,
-1.152986, -1.072268, -2.313938, 1, 0.7921569, 0, 1,
-1.15195, 2.762539, -0.2969424, 1, 0.7960784, 0, 1,
-1.144184, 0.7911393, -0.5223219, 1, 0.8039216, 0, 1,
-1.143378, 0.330074, -1.841216, 1, 0.8117647, 0, 1,
-1.139516, 0.3641703, -2.391416, 1, 0.8156863, 0, 1,
-1.138319, -0.03767193, -0.9263976, 1, 0.8235294, 0, 1,
-1.137513, -0.1788748, -3.538684, 1, 0.827451, 0, 1,
-1.127376, -2.882571, -2.102116, 1, 0.8352941, 0, 1,
-1.124581, -1.109667, -3.590267, 1, 0.8392157, 0, 1,
-1.117154, -2.42497, -1.618007, 1, 0.8470588, 0, 1,
-1.116983, -1.348458, -2.032164, 1, 0.8509804, 0, 1,
-1.114364, -0.1546773, -1.678928, 1, 0.8588235, 0, 1,
-1.104784, 1.525112, -0.413208, 1, 0.8627451, 0, 1,
-1.099988, -3.116677, -4.276356, 1, 0.8705882, 0, 1,
-1.095784, 0.854566, 0.3703994, 1, 0.8745098, 0, 1,
-1.090025, -1.740512, -2.690989, 1, 0.8823529, 0, 1,
-1.089896, -0.9768216, -0.7419827, 1, 0.8862745, 0, 1,
-1.083541, 0.6865783, 0.412816, 1, 0.8941177, 0, 1,
-1.074463, 0.5781773, -1.441238, 1, 0.8980392, 0, 1,
-1.063055, 0.4541633, -0.679704, 1, 0.9058824, 0, 1,
-1.060769, -0.8245454, -3.50132, 1, 0.9137255, 0, 1,
-1.060349, 0.06736749, -1.537652, 1, 0.9176471, 0, 1,
-1.058388, -0.127986, -2.303263, 1, 0.9254902, 0, 1,
-1.057215, -1.102277, -1.152382, 1, 0.9294118, 0, 1,
-1.056106, 0.6348637, -1.908481, 1, 0.9372549, 0, 1,
-1.052939, -1.1673, -1.144868, 1, 0.9411765, 0, 1,
-1.05044, 0.892279, -0.9705264, 1, 0.9490196, 0, 1,
-1.049332, 0.5977773, -0.9258214, 1, 0.9529412, 0, 1,
-1.044566, -1.465525, -2.853735, 1, 0.9607843, 0, 1,
-1.039962, 0.8206071, -0.5988347, 1, 0.9647059, 0, 1,
-1.038593, -0.08283046, -1.991618, 1, 0.972549, 0, 1,
-1.036404, -0.5236578, -1.59156, 1, 0.9764706, 0, 1,
-1.030566, 0.1047727, -1.630166, 1, 0.9843137, 0, 1,
-1.025224, 0.5678197, -1.528823, 1, 0.9882353, 0, 1,
-1.017166, -0.3490233, 0.5072715, 1, 0.9960784, 0, 1,
-1.013955, 0.1491646, -2.163836, 0.9960784, 1, 0, 1,
-1.005436, -0.1335349, -1.498866, 0.9921569, 1, 0, 1,
-1.003974, 0.7736588, -0.1527104, 0.9843137, 1, 0, 1,
-0.998248, -0.7048622, -0.6728151, 0.9803922, 1, 0, 1,
-0.9931871, 1.292735, -0.2912548, 0.972549, 1, 0, 1,
-0.9883039, 0.9798191, 0.8925795, 0.9686275, 1, 0, 1,
-0.9866219, 1.584357, 0.8560668, 0.9607843, 1, 0, 1,
-0.9854116, -0.5456709, -3.237961, 0.9568627, 1, 0, 1,
-0.975695, 0.5837976, -0.9438646, 0.9490196, 1, 0, 1,
-0.9751327, -0.4189034, -2.141132, 0.945098, 1, 0, 1,
-0.9685839, -1.277998, -4.594172, 0.9372549, 1, 0, 1,
-0.9684599, -0.09282177, -2.826708, 0.9333333, 1, 0, 1,
-0.9672583, 0.6238025, -2.951063, 0.9254902, 1, 0, 1,
-0.9583197, 0.7532284, -1.352504, 0.9215686, 1, 0, 1,
-0.9568049, 0.2352574, -1.564047, 0.9137255, 1, 0, 1,
-0.9515248, 0.3087813, -0.8608453, 0.9098039, 1, 0, 1,
-0.9503855, 0.2826941, -1.590944, 0.9019608, 1, 0, 1,
-0.9464647, -1.705296, -3.190298, 0.8941177, 1, 0, 1,
-0.9428003, 0.08291552, -1.514863, 0.8901961, 1, 0, 1,
-0.9413953, 1.169022, -1.644047, 0.8823529, 1, 0, 1,
-0.9392059, 0.2915947, -2.106438, 0.8784314, 1, 0, 1,
-0.9364924, -1.998172, -3.095879, 0.8705882, 1, 0, 1,
-0.9302278, 1.179667, -0.6408704, 0.8666667, 1, 0, 1,
-0.9294431, 0.3296854, -1.236491, 0.8588235, 1, 0, 1,
-0.9267348, 0.2384721, -2.817566, 0.854902, 1, 0, 1,
-0.9198877, -2.050121, -2.739667, 0.8470588, 1, 0, 1,
-0.9182605, 0.1151777, -1.529242, 0.8431373, 1, 0, 1,
-0.9173781, 0.9711049, -0.9641072, 0.8352941, 1, 0, 1,
-0.9141287, -0.04126307, -2.688323, 0.8313726, 1, 0, 1,
-0.9134376, -0.04353093, -2.054293, 0.8235294, 1, 0, 1,
-0.9103208, -0.6855056, -2.002059, 0.8196079, 1, 0, 1,
-0.909869, -0.2739672, -1.354627, 0.8117647, 1, 0, 1,
-0.9098468, 0.7119181, -0.5682528, 0.8078431, 1, 0, 1,
-0.9034531, -1.611684, -4.769371, 0.8, 1, 0, 1,
-0.9021993, -0.1826385, 0.111322, 0.7921569, 1, 0, 1,
-0.897401, -0.4981215, -0.8598473, 0.7882353, 1, 0, 1,
-0.8938632, 0.3207717, -0.9873151, 0.7803922, 1, 0, 1,
-0.888302, 1.696857, -1.343049, 0.7764706, 1, 0, 1,
-0.8859693, 0.3437074, -0.4012289, 0.7686275, 1, 0, 1,
-0.8851895, 2.85146, 0.9995391, 0.7647059, 1, 0, 1,
-0.8779892, 1.851393, -0.4539288, 0.7568628, 1, 0, 1,
-0.8713567, 0.3624812, -2.097165, 0.7529412, 1, 0, 1,
-0.8705585, 1.214835, -0.09147325, 0.7450981, 1, 0, 1,
-0.8670207, -0.9825706, -1.847041, 0.7411765, 1, 0, 1,
-0.8661553, 1.207728, 0.9654054, 0.7333333, 1, 0, 1,
-0.8640054, -0.5638093, -3.46596, 0.7294118, 1, 0, 1,
-0.8572967, 2.163225, -1.425952, 0.7215686, 1, 0, 1,
-0.8537256, -0.2635452, -1.559831, 0.7176471, 1, 0, 1,
-0.8530671, 0.9564887, -0.892315, 0.7098039, 1, 0, 1,
-0.8424153, 1.896577, 1.452312, 0.7058824, 1, 0, 1,
-0.8325855, 0.1935663, -3.211821, 0.6980392, 1, 0, 1,
-0.8314416, 0.9125873, 0.07871108, 0.6901961, 1, 0, 1,
-0.8231225, -0.1000928, -3.724331, 0.6862745, 1, 0, 1,
-0.8224171, 2.135993, -1.809891, 0.6784314, 1, 0, 1,
-0.816884, 0.6214888, -0.4531967, 0.6745098, 1, 0, 1,
-0.813717, -2.248143, -2.729286, 0.6666667, 1, 0, 1,
-0.8080416, 1.967309, 0.7493683, 0.6627451, 1, 0, 1,
-0.8063226, -0.1779814, -1.986225, 0.654902, 1, 0, 1,
-0.7956657, -1.210184, -2.850665, 0.6509804, 1, 0, 1,
-0.7947706, -0.3266976, -1.122665, 0.6431373, 1, 0, 1,
-0.7919071, 2.218762, 0.8885343, 0.6392157, 1, 0, 1,
-0.7893649, 2.05445, 0.7403949, 0.6313726, 1, 0, 1,
-0.7869452, 0.0613585, -0.8785696, 0.627451, 1, 0, 1,
-0.7808779, -1.873254, -3.592385, 0.6196079, 1, 0, 1,
-0.773622, -0.9761077, -0.905539, 0.6156863, 1, 0, 1,
-0.7621603, 1.246049, -0.1636754, 0.6078432, 1, 0, 1,
-0.7609288, 0.2701449, -1.722181, 0.6039216, 1, 0, 1,
-0.7596583, -1.915534, -2.506045, 0.5960785, 1, 0, 1,
-0.75929, 0.8199128, -2.044875, 0.5882353, 1, 0, 1,
-0.7571876, -0.3535907, -1.396857, 0.5843138, 1, 0, 1,
-0.7562544, 0.4274635, -0.5707091, 0.5764706, 1, 0, 1,
-0.7524815, -1.015797, -2.8472, 0.572549, 1, 0, 1,
-0.7435542, 0.9602604, -0.178309, 0.5647059, 1, 0, 1,
-0.7416784, -2.467298, -1.565303, 0.5607843, 1, 0, 1,
-0.7354923, -0.878598, -3.9127, 0.5529412, 1, 0, 1,
-0.7231648, -1.67354, -2.639193, 0.5490196, 1, 0, 1,
-0.7150571, -0.02563297, -0.997066, 0.5411765, 1, 0, 1,
-0.710166, 0.1668653, -1.347419, 0.5372549, 1, 0, 1,
-0.7001308, 1.377113, -2.620639, 0.5294118, 1, 0, 1,
-0.7000433, -1.638044, -3.52218, 0.5254902, 1, 0, 1,
-0.6937456, 0.5665925, -1.4978, 0.5176471, 1, 0, 1,
-0.6899157, 0.9827693, -1.168407, 0.5137255, 1, 0, 1,
-0.6844593, 0.1972806, -1.99988, 0.5058824, 1, 0, 1,
-0.6833302, 0.8711396, 0.4966328, 0.5019608, 1, 0, 1,
-0.6812639, 1.685292, 2.910196, 0.4941176, 1, 0, 1,
-0.6764687, 1.30823, -0.8962491, 0.4862745, 1, 0, 1,
-0.6755031, 0.7065976, -2.309527, 0.4823529, 1, 0, 1,
-0.673978, -0.2383461, -4.23424, 0.4745098, 1, 0, 1,
-0.6736377, -0.09927734, -1.507119, 0.4705882, 1, 0, 1,
-0.6648641, 0.1079865, -1.8391, 0.4627451, 1, 0, 1,
-0.6648283, -0.5458085, -0.3944468, 0.4588235, 1, 0, 1,
-0.6608127, 0.1446697, -2.036162, 0.4509804, 1, 0, 1,
-0.6543047, 0.147974, -1.741333, 0.4470588, 1, 0, 1,
-0.6537168, -1.626531, -2.930146, 0.4392157, 1, 0, 1,
-0.6528936, -1.214188, -2.684449, 0.4352941, 1, 0, 1,
-0.6526754, -0.4994149, -2.543504, 0.427451, 1, 0, 1,
-0.6519548, 0.2416724, -2.05404, 0.4235294, 1, 0, 1,
-0.6457807, -0.5945497, -2.972476, 0.4156863, 1, 0, 1,
-0.6428505, 0.5272383, -1.463251, 0.4117647, 1, 0, 1,
-0.6398479, -0.3131991, -1.695123, 0.4039216, 1, 0, 1,
-0.6343628, -1.05795, -2.36291, 0.3960784, 1, 0, 1,
-0.6309239, 0.1288518, -2.147592, 0.3921569, 1, 0, 1,
-0.6257372, -1.198018, -1.86269, 0.3843137, 1, 0, 1,
-0.6231056, 1.104674, -1.08844, 0.3803922, 1, 0, 1,
-0.5989491, 1.03391, -0.7086879, 0.372549, 1, 0, 1,
-0.5964648, 1.960976, -0.5330113, 0.3686275, 1, 0, 1,
-0.5839148, 1.405631, -0.08861385, 0.3607843, 1, 0, 1,
-0.5823973, -0.1865478, -1.243644, 0.3568628, 1, 0, 1,
-0.579178, 0.1164755, -0.454107, 0.3490196, 1, 0, 1,
-0.5756205, 0.8526827, -2.779229, 0.345098, 1, 0, 1,
-0.5709131, 0.8020927, -2.042376, 0.3372549, 1, 0, 1,
-0.5676892, 0.5348086, -0.8233263, 0.3333333, 1, 0, 1,
-0.5672364, 0.4232823, 0.0443154, 0.3254902, 1, 0, 1,
-0.5632899, 0.8510661, -0.7137578, 0.3215686, 1, 0, 1,
-0.5622366, 0.2472622, -1.203025, 0.3137255, 1, 0, 1,
-0.5569843, -0.2259866, -0.9349496, 0.3098039, 1, 0, 1,
-0.5561087, 1.041778, -1.150462, 0.3019608, 1, 0, 1,
-0.5553807, 1.042739, 0.0698819, 0.2941177, 1, 0, 1,
-0.5548745, 0.4496597, -0.5214825, 0.2901961, 1, 0, 1,
-0.5499517, 2.790171, -1.163976, 0.282353, 1, 0, 1,
-0.5458416, 0.1356112, -1.651935, 0.2784314, 1, 0, 1,
-0.5442681, 1.290448, -2.254007, 0.2705882, 1, 0, 1,
-0.5434971, -0.0786037, -1.32547, 0.2666667, 1, 0, 1,
-0.5416062, -1.40099, -0.7197953, 0.2588235, 1, 0, 1,
-0.5398131, 1.99491, 0.04082184, 0.254902, 1, 0, 1,
-0.5375643, 0.6844165, -0.1270617, 0.2470588, 1, 0, 1,
-0.5280954, -0.2304042, -1.351238, 0.2431373, 1, 0, 1,
-0.5241362, 0.004634396, -2.338258, 0.2352941, 1, 0, 1,
-0.5224385, -0.6159454, -3.319574, 0.2313726, 1, 0, 1,
-0.5210305, 0.9462129, 0.7622581, 0.2235294, 1, 0, 1,
-0.5181436, -0.9096423, -2.951867, 0.2196078, 1, 0, 1,
-0.517565, 0.8365501, 1.053108, 0.2117647, 1, 0, 1,
-0.5174019, 0.344743, -1.721644, 0.2078431, 1, 0, 1,
-0.5173212, 0.3255333, -0.9034261, 0.2, 1, 0, 1,
-0.5123466, -0.6640152, -1.375326, 0.1921569, 1, 0, 1,
-0.5093191, 1.064553, -0.9357753, 0.1882353, 1, 0, 1,
-0.5062883, 0.7817361, -2.582116, 0.1803922, 1, 0, 1,
-0.5052875, 2.720464, 0.4969777, 0.1764706, 1, 0, 1,
-0.5031711, -0.2482609, -1.949367, 0.1686275, 1, 0, 1,
-0.5008963, -2.026009, -2.736095, 0.1647059, 1, 0, 1,
-0.4956127, 1.267511, -1.454984, 0.1568628, 1, 0, 1,
-0.4919328, -0.2069352, -2.263184, 0.1529412, 1, 0, 1,
-0.4918571, -0.9289311, -3.717129, 0.145098, 1, 0, 1,
-0.4881818, 0.3553285, -1.78908, 0.1411765, 1, 0, 1,
-0.487829, -0.2192471, -3.682228, 0.1333333, 1, 0, 1,
-0.4836608, -0.9215153, -2.593153, 0.1294118, 1, 0, 1,
-0.4823801, -1.650172, -3.149247, 0.1215686, 1, 0, 1,
-0.4783186, -1.261576, -2.212677, 0.1176471, 1, 0, 1,
-0.4719622, -1.116208, -3.855323, 0.1098039, 1, 0, 1,
-0.4655043, 0.6569787, -1.297338, 0.1058824, 1, 0, 1,
-0.4632365, 0.8878055, -1.674902, 0.09803922, 1, 0, 1,
-0.4630822, 0.03528504, -1.929884, 0.09019608, 1, 0, 1,
-0.4623144, -0.08761336, -0.8858146, 0.08627451, 1, 0, 1,
-0.4601851, -0.1809269, -0.7026608, 0.07843138, 1, 0, 1,
-0.4525018, -0.8035814, -2.268696, 0.07450981, 1, 0, 1,
-0.4504256, 1.693502, -0.8422669, 0.06666667, 1, 0, 1,
-0.4496181, 0.9078594, -0.02997963, 0.0627451, 1, 0, 1,
-0.4491575, 2.042714, 0.4027865, 0.05490196, 1, 0, 1,
-0.4473593, 0.2423106, -0.9572664, 0.05098039, 1, 0, 1,
-0.4455874, -0.9799868, -3.005372, 0.04313726, 1, 0, 1,
-0.442748, 1.321944, 0.1545503, 0.03921569, 1, 0, 1,
-0.4383299, -1.388664, -4.628535, 0.03137255, 1, 0, 1,
-0.4316972, -1.840927, -3.332602, 0.02745098, 1, 0, 1,
-0.4290616, -0.1202216, -0.5162063, 0.01960784, 1, 0, 1,
-0.4282138, -0.3187895, -2.448107, 0.01568628, 1, 0, 1,
-0.4262623, 1.325863, -0.5557173, 0.007843138, 1, 0, 1,
-0.4246355, 1.129305, -0.6277111, 0.003921569, 1, 0, 1,
-0.423145, -0.2015678, -2.291023, 0, 1, 0.003921569, 1,
-0.4212308, 0.1802214, -1.221247, 0, 1, 0.01176471, 1,
-0.4210428, -0.7075353, -1.373645, 0, 1, 0.01568628, 1,
-0.4162506, 2.651155, -1.642981, 0, 1, 0.02352941, 1,
-0.4151556, 0.3464788, -0.9001947, 0, 1, 0.02745098, 1,
-0.4123002, 0.5686385, 1.265539, 0, 1, 0.03529412, 1,
-0.4116102, -0.35505, -1.748996, 0, 1, 0.03921569, 1,
-0.4106707, -0.3225628, -2.414173, 0, 1, 0.04705882, 1,
-0.4034921, 0.6104678, -0.207625, 0, 1, 0.05098039, 1,
-0.4003581, 1.052601, -1.22215, 0, 1, 0.05882353, 1,
-0.3986273, 0.9964636, -0.8087904, 0, 1, 0.0627451, 1,
-0.3920848, 0.2128728, -1.673298, 0, 1, 0.07058824, 1,
-0.3916305, 0.6543372, -2.037539, 0, 1, 0.07450981, 1,
-0.3913085, -0.5647933, -2.01609, 0, 1, 0.08235294, 1,
-0.3896613, 0.4891951, -1.26961, 0, 1, 0.08627451, 1,
-0.3888542, 0.3404636, -1.324666, 0, 1, 0.09411765, 1,
-0.3866141, 0.8296399, -1.890857, 0, 1, 0.1019608, 1,
-0.3865221, 0.4177743, 0.5948012, 0, 1, 0.1058824, 1,
-0.3810202, -0.5001972, -0.5567778, 0, 1, 0.1137255, 1,
-0.3800744, 0.1389053, 0.6759904, 0, 1, 0.1176471, 1,
-0.3799409, -0.6215883, -4.121352, 0, 1, 0.1254902, 1,
-0.3795289, 0.7505732, -0.1346722, 0, 1, 0.1294118, 1,
-0.3772546, -1.297877, -2.737366, 0, 1, 0.1372549, 1,
-0.3687496, -0.6984009, -2.664103, 0, 1, 0.1411765, 1,
-0.3682534, -0.8578617, -2.360629, 0, 1, 0.1490196, 1,
-0.3680234, -0.03058557, -2.37523, 0, 1, 0.1529412, 1,
-0.3676725, -0.05702991, -0.8128675, 0, 1, 0.1607843, 1,
-0.3636993, 0.7321876, -0.1726023, 0, 1, 0.1647059, 1,
-0.3627426, -2.587055, -3.831341, 0, 1, 0.172549, 1,
-0.3576017, 1.543702, -0.6530304, 0, 1, 0.1764706, 1,
-0.3543957, -0.6863229, -2.042353, 0, 1, 0.1843137, 1,
-0.3541466, 0.4421133, -0.8247023, 0, 1, 0.1882353, 1,
-0.3527479, 1.004405, 0.5128595, 0, 1, 0.1960784, 1,
-0.351988, 0.1527238, -2.135103, 0, 1, 0.2039216, 1,
-0.3432624, 0.559485, -1.332251, 0, 1, 0.2078431, 1,
-0.3397419, 1.347456, 0.7311801, 0, 1, 0.2156863, 1,
-0.3357501, 0.6689962, -0.5693402, 0, 1, 0.2196078, 1,
-0.3340461, -2.283726, -3.654279, 0, 1, 0.227451, 1,
-0.3285374, -0.4627264, -4.285033, 0, 1, 0.2313726, 1,
-0.3251184, 0.05823224, -0.5267748, 0, 1, 0.2392157, 1,
-0.3151761, -0.7051629, -3.276763, 0, 1, 0.2431373, 1,
-0.3045164, 1.170398, -0.329618, 0, 1, 0.2509804, 1,
-0.3044369, -0.8804652, -3.319812, 0, 1, 0.254902, 1,
-0.3039921, 0.2348483, -1.747378, 0, 1, 0.2627451, 1,
-0.3012059, -0.6797011, -2.274096, 0, 1, 0.2666667, 1,
-0.2964481, -0.7849182, -2.086179, 0, 1, 0.2745098, 1,
-0.2935973, -0.3261129, -2.293797, 0, 1, 0.2784314, 1,
-0.2917115, -0.7474681, -4.409256, 0, 1, 0.2862745, 1,
-0.2873284, -0.2851759, -2.026016, 0, 1, 0.2901961, 1,
-0.2732513, -0.5369043, -3.49359, 0, 1, 0.2980392, 1,
-0.2711072, 0.4823206, 1.233214, 0, 1, 0.3058824, 1,
-0.2704237, 0.8199269, -1.594533, 0, 1, 0.3098039, 1,
-0.2692608, -0.3266762, -3.319249, 0, 1, 0.3176471, 1,
-0.262939, 1.334658, -1.283677, 0, 1, 0.3215686, 1,
-0.2562492, -1.584252, -2.418131, 0, 1, 0.3294118, 1,
-0.2551717, -1.578164, -3.796885, 0, 1, 0.3333333, 1,
-0.2549805, 1.451607, 1.318909, 0, 1, 0.3411765, 1,
-0.2545036, -2.050653, -5.304127, 0, 1, 0.345098, 1,
-0.2532011, -0.2571978, -1.843767, 0, 1, 0.3529412, 1,
-0.2488487, -2.135268, -3.721758, 0, 1, 0.3568628, 1,
-0.2488313, 0.1699199, -1.270406, 0, 1, 0.3647059, 1,
-0.248065, 0.4683733, 0.3882586, 0, 1, 0.3686275, 1,
-0.2457478, -0.149, -3.911299, 0, 1, 0.3764706, 1,
-0.2426099, 0.1035087, -0.8344196, 0, 1, 0.3803922, 1,
-0.2402299, -0.3137186, -2.776819, 0, 1, 0.3882353, 1,
-0.2390177, -0.09103923, -1.581978, 0, 1, 0.3921569, 1,
-0.2383263, 0.2565028, -0.5327237, 0, 1, 0.4, 1,
-0.2380632, 0.3056876, -0.7748395, 0, 1, 0.4078431, 1,
-0.236103, -0.1309266, -1.901767, 0, 1, 0.4117647, 1,
-0.2348579, 0.8728912, -0.02577345, 0, 1, 0.4196078, 1,
-0.2318614, -1.610446, -3.333348, 0, 1, 0.4235294, 1,
-0.231399, -0.06170578, -1.578776, 0, 1, 0.4313726, 1,
-0.2286828, -0.01279663, -4.061193, 0, 1, 0.4352941, 1,
-0.2286784, 0.3978503, -2.407626, 0, 1, 0.4431373, 1,
-0.2269975, 2.218384, -0.2280338, 0, 1, 0.4470588, 1,
-0.2182185, 0.03198011, -1.779151, 0, 1, 0.454902, 1,
-0.2164645, -1.396373, -3.152332, 0, 1, 0.4588235, 1,
-0.2157633, 0.04964057, -1.808339, 0, 1, 0.4666667, 1,
-0.213913, 1.577561, -0.775479, 0, 1, 0.4705882, 1,
-0.2105347, -0.2849103, -1.725484, 0, 1, 0.4784314, 1,
-0.2098145, -1.620585, -2.545512, 0, 1, 0.4823529, 1,
-0.2084969, 0.4335641, -1.181094, 0, 1, 0.4901961, 1,
-0.2054596, -0.06246405, -2.115339, 0, 1, 0.4941176, 1,
-0.202694, -1.383404, -2.413775, 0, 1, 0.5019608, 1,
-0.2020291, 0.2833473, 0.03500685, 0, 1, 0.509804, 1,
-0.2011375, 0.1988874, -0.9338835, 0, 1, 0.5137255, 1,
-0.2006847, -0.372765, -4.064775, 0, 1, 0.5215687, 1,
-0.1975346, -0.8381696, -2.811302, 0, 1, 0.5254902, 1,
-0.1970678, 1.283862, 0.7006139, 0, 1, 0.5333334, 1,
-0.1870516, -0.7316713, -1.122514, 0, 1, 0.5372549, 1,
-0.1860812, 1.018885, 0.3954272, 0, 1, 0.5450981, 1,
-0.1844229, 0.2732755, -2.146618, 0, 1, 0.5490196, 1,
-0.1824372, 0.2114491, 0.8616814, 0, 1, 0.5568628, 1,
-0.1798001, 1.24409, 1.532923, 0, 1, 0.5607843, 1,
-0.1797086, -0.4874499, -3.267326, 0, 1, 0.5686275, 1,
-0.1785474, 0.08505741, -1.135856, 0, 1, 0.572549, 1,
-0.1764805, 0.4845037, 1.032019, 0, 1, 0.5803922, 1,
-0.1757599, -1.6307, -3.577716, 0, 1, 0.5843138, 1,
-0.1752925, -0.4046208, -2.292883, 0, 1, 0.5921569, 1,
-0.1751716, 0.3070045, 1.462928, 0, 1, 0.5960785, 1,
-0.1740698, -0.8762852, -4.12045, 0, 1, 0.6039216, 1,
-0.1716953, 2.044935, 2.313299, 0, 1, 0.6117647, 1,
-0.1716464, 0.8284227, 0.2243699, 0, 1, 0.6156863, 1,
-0.1692061, -0.5894167, -4.112304, 0, 1, 0.6235294, 1,
-0.1690842, 0.4842192, -0.4979109, 0, 1, 0.627451, 1,
-0.167408, -0.5663053, -3.96984, 0, 1, 0.6352941, 1,
-0.1590052, -1.410445, -1.512261, 0, 1, 0.6392157, 1,
-0.1557422, -0.3303262, -1.328224, 0, 1, 0.6470588, 1,
-0.1533027, 0.4104433, -0.8621864, 0, 1, 0.6509804, 1,
-0.1513614, 0.4812977, -1.701841, 0, 1, 0.6588235, 1,
-0.1510742, 1.576314, -1.045195, 0, 1, 0.6627451, 1,
-0.1483301, -0.8506396, -3.186182, 0, 1, 0.6705883, 1,
-0.1478775, 0.6174804, 0.7052532, 0, 1, 0.6745098, 1,
-0.1478127, 1.919392, 1.073172, 0, 1, 0.682353, 1,
-0.1477048, 0.6041905, 0.9334707, 0, 1, 0.6862745, 1,
-0.146161, -1.181564, -2.706725, 0, 1, 0.6941177, 1,
-0.1427888, 0.4816408, -0.03771991, 0, 1, 0.7019608, 1,
-0.1420147, -0.3709317, -3.769113, 0, 1, 0.7058824, 1,
-0.1332421, 1.148701, -0.1491495, 0, 1, 0.7137255, 1,
-0.1247928, 0.3176946, 0.210964, 0, 1, 0.7176471, 1,
-0.1244684, 0.7740746, -0.3461092, 0, 1, 0.7254902, 1,
-0.1179428, 0.1923157, -1.92821, 0, 1, 0.7294118, 1,
-0.1178977, -0.6679949, -2.162869, 0, 1, 0.7372549, 1,
-0.1176474, -0.4793851, -0.6330764, 0, 1, 0.7411765, 1,
-0.1165224, -0.1625282, -2.894491, 0, 1, 0.7490196, 1,
-0.1137533, -0.2428042, -1.946429, 0, 1, 0.7529412, 1,
-0.1119483, -0.5797089, -3.559772, 0, 1, 0.7607843, 1,
-0.1099642, -0.4611498, -3.593098, 0, 1, 0.7647059, 1,
-0.1096596, 0.9725624, 1.393371, 0, 1, 0.772549, 1,
-0.1094668, 1.01276, -2.055578, 0, 1, 0.7764706, 1,
-0.106861, -0.05824887, -1.286251, 0, 1, 0.7843137, 1,
-0.1020616, -0.2508084, -2.039346, 0, 1, 0.7882353, 1,
-0.09078021, -0.2144962, -2.166734, 0, 1, 0.7960784, 1,
-0.09077697, 0.0873335, -1.250804, 0, 1, 0.8039216, 1,
-0.08653785, -0.7320052, -3.00474, 0, 1, 0.8078431, 1,
-0.0796263, 0.412033, -1.51406, 0, 1, 0.8156863, 1,
-0.07814308, 0.1926114, 1.34501, 0, 1, 0.8196079, 1,
-0.07482161, 0.6768913, 0.195425, 0, 1, 0.827451, 1,
-0.07371523, -0.2888694, -2.917882, 0, 1, 0.8313726, 1,
-0.07363628, 0.1183064, -2.972304, 0, 1, 0.8392157, 1,
-0.07278752, 0.97925, -1.376474, 0, 1, 0.8431373, 1,
-0.0722554, 0.6091096, -1.434944, 0, 1, 0.8509804, 1,
-0.07208115, -0.1836082, -3.475313, 0, 1, 0.854902, 1,
-0.07127579, 0.01901147, -1.987273, 0, 1, 0.8627451, 1,
-0.07035799, 1.459121, 0.4775282, 0, 1, 0.8666667, 1,
-0.07020003, 2.372165, 0.8491318, 0, 1, 0.8745098, 1,
-0.06818565, -2.213751, -2.775891, 0, 1, 0.8784314, 1,
-0.06670453, -1.287188, -3.23834, 0, 1, 0.8862745, 1,
-0.06554666, 0.2293375, -1.071007, 0, 1, 0.8901961, 1,
-0.06248339, -0.3451394, -3.333549, 0, 1, 0.8980392, 1,
-0.05745022, 0.555331, -1.252514, 0, 1, 0.9058824, 1,
-0.05361439, 1.221025, -0.3049892, 0, 1, 0.9098039, 1,
-0.04519888, -0.9112701, -3.529815, 0, 1, 0.9176471, 1,
-0.03516145, -2.027204, -3.17961, 0, 1, 0.9215686, 1,
-0.03231452, -1.053816, -3.367268, 0, 1, 0.9294118, 1,
-0.03026212, -1.226881, -3.40319, 0, 1, 0.9333333, 1,
-0.02848353, 0.1040951, -1.914373, 0, 1, 0.9411765, 1,
-0.0202496, -0.9836608, -1.659856, 0, 1, 0.945098, 1,
-0.0187415, -0.1517815, -2.464435, 0, 1, 0.9529412, 1,
-0.01728267, 0.09308019, 1.418128, 0, 1, 0.9568627, 1,
-0.01089231, -0.7258628, -2.878675, 0, 1, 0.9647059, 1,
-0.00874918, -0.6077081, -2.744878, 0, 1, 0.9686275, 1,
-0.004481563, -0.1779269, -4.531919, 0, 1, 0.9764706, 1,
-0.002033322, -0.8533562, -4.728827, 0, 1, 0.9803922, 1,
-0.001300194, -1.192378, -2.350213, 0, 1, 0.9882353, 1,
-0.001154884, -0.2512037, -2.446079, 0, 1, 0.9921569, 1,
-0.001063886, -0.1436515, -2.902699, 0, 1, 1, 1,
-0.0009825674, 0.1503262, -0.2891603, 0, 0.9921569, 1, 1,
-0.0007980606, -1.69544, -2.822821, 0, 0.9882353, 1, 1,
-0.0001096284, -0.7565068, -3.020024, 0, 0.9803922, 1, 1,
0.005429457, -2.143648, 3.771956, 0, 0.9764706, 1, 1,
0.01192598, 0.7198833, 0.08740082, 0, 0.9686275, 1, 1,
0.01407473, 0.712365, -0.8796998, 0, 0.9647059, 1, 1,
0.02148135, 0.2779187, -0.2984279, 0, 0.9568627, 1, 1,
0.02153841, -0.7566267, 3.560116, 0, 0.9529412, 1, 1,
0.02371207, 0.9844761, 0.2990405, 0, 0.945098, 1, 1,
0.02486285, 0.5151124, -0.7373646, 0, 0.9411765, 1, 1,
0.02548033, 0.949701, 1.79958, 0, 0.9333333, 1, 1,
0.03121413, -0.7020702, 2.968574, 0, 0.9294118, 1, 1,
0.03312463, -0.9455066, 3.31642, 0, 0.9215686, 1, 1,
0.03453269, 0.2000986, 0.8960208, 0, 0.9176471, 1, 1,
0.0389297, -0.3293533, 1.878996, 0, 0.9098039, 1, 1,
0.03988337, 0.3472443, -0.4260086, 0, 0.9058824, 1, 1,
0.04329139, -1.383805, 3.869678, 0, 0.8980392, 1, 1,
0.04528697, 1.207651, -0.7852844, 0, 0.8901961, 1, 1,
0.04531397, 1.273836, 1.60995, 0, 0.8862745, 1, 1,
0.04536164, 1.275667, -0.6401205, 0, 0.8784314, 1, 1,
0.05048476, 0.2425666, 0.5800116, 0, 0.8745098, 1, 1,
0.05490175, 0.8653374, 1.692474, 0, 0.8666667, 1, 1,
0.05638567, -1.028388, 2.772233, 0, 0.8627451, 1, 1,
0.05896464, 0.8105472, -0.0997623, 0, 0.854902, 1, 1,
0.06045673, 0.3424409, 1.206618, 0, 0.8509804, 1, 1,
0.06062542, -0.5811176, 1.316362, 0, 0.8431373, 1, 1,
0.06387641, -1.198467, 3.215982, 0, 0.8392157, 1, 1,
0.06571139, 1.619666, -0.6016439, 0, 0.8313726, 1, 1,
0.06580974, -1.457975, 1.350702, 0, 0.827451, 1, 1,
0.06788202, -0.3145806, 2.46418, 0, 0.8196079, 1, 1,
0.06810329, -1.698453, 3.312956, 0, 0.8156863, 1, 1,
0.06942824, -0.06420657, 2.242541, 0, 0.8078431, 1, 1,
0.07319272, 0.5585905, 1.222827, 0, 0.8039216, 1, 1,
0.07762464, 0.6207145, -0.5365258, 0, 0.7960784, 1, 1,
0.07880797, 0.194026, 0.6347912, 0, 0.7882353, 1, 1,
0.0830733, 1.341159, 0.4799195, 0, 0.7843137, 1, 1,
0.08511883, -1.829267, 2.323304, 0, 0.7764706, 1, 1,
0.08581083, -1.446144, 2.496251, 0, 0.772549, 1, 1,
0.08779342, -1.340871, 2.833629, 0, 0.7647059, 1, 1,
0.0882743, 0.3177769, 0.4660507, 0, 0.7607843, 1, 1,
0.08829046, 0.477797, 0.2107092, 0, 0.7529412, 1, 1,
0.09672377, -0.2143702, 3.099373, 0, 0.7490196, 1, 1,
0.09897182, -1.186826, 1.945781, 0, 0.7411765, 1, 1,
0.10036, 2.311061, 0.6487295, 0, 0.7372549, 1, 1,
0.1050862, 0.7228001, 0.1448636, 0, 0.7294118, 1, 1,
0.1080533, 1.066888, 1.016681, 0, 0.7254902, 1, 1,
0.1084448, 0.2924993, 0.6139671, 0, 0.7176471, 1, 1,
0.1109518, 3.146846, -0.01153936, 0, 0.7137255, 1, 1,
0.1211376, 0.2203583, 0.7736229, 0, 0.7058824, 1, 1,
0.1278324, -1.582511, 3.465639, 0, 0.6980392, 1, 1,
0.1279891, 0.2731107, -0.05841963, 0, 0.6941177, 1, 1,
0.1299427, -1.381643, 1.385551, 0, 0.6862745, 1, 1,
0.1300353, 2.086415, 0.9374896, 0, 0.682353, 1, 1,
0.1315178, 1.191263, 0.4109536, 0, 0.6745098, 1, 1,
0.1332859, 0.5363032, 0.4775445, 0, 0.6705883, 1, 1,
0.1336955, -1.14642, 3.490873, 0, 0.6627451, 1, 1,
0.1374542, 2.066866, 0.9630273, 0, 0.6588235, 1, 1,
0.1447921, 0.4513736, 0.6999047, 0, 0.6509804, 1, 1,
0.144824, -1.049863, 3.393724, 0, 0.6470588, 1, 1,
0.1448537, 1.508267, -0.8831605, 0, 0.6392157, 1, 1,
0.1507357, 0.7443306, -0.9874902, 0, 0.6352941, 1, 1,
0.1536437, -0.4383014, 4.812711, 0, 0.627451, 1, 1,
0.1556345, 0.9758663, 1.267492, 0, 0.6235294, 1, 1,
0.1575089, -0.8658989, 2.224167, 0, 0.6156863, 1, 1,
0.157538, -0.03475243, 1.840486, 0, 0.6117647, 1, 1,
0.1648246, -2.111976, 5.523122, 0, 0.6039216, 1, 1,
0.1663746, 0.9356318, -0.8231816, 0, 0.5960785, 1, 1,
0.1727925, 0.1138936, 0.6486666, 0, 0.5921569, 1, 1,
0.1768615, 1.684372, 1.131695, 0, 0.5843138, 1, 1,
0.1790776, -0.3603146, 1.519602, 0, 0.5803922, 1, 1,
0.1804347, 0.8941704, 1.197787, 0, 0.572549, 1, 1,
0.1829695, -1.46347, 2.486794, 0, 0.5686275, 1, 1,
0.1893467, -0.3169836, 3.314825, 0, 0.5607843, 1, 1,
0.1893837, 0.3248459, -1.540697, 0, 0.5568628, 1, 1,
0.1908261, 1.882226, 0.4620109, 0, 0.5490196, 1, 1,
0.1932692, 0.244887, 1.100865, 0, 0.5450981, 1, 1,
0.1936908, -1.08163, 3.851995, 0, 0.5372549, 1, 1,
0.1944719, 1.355784, -0.86753, 0, 0.5333334, 1, 1,
0.1969828, -0.004500221, 1.248735, 0, 0.5254902, 1, 1,
0.1972153, -1.442298, 3.841084, 0, 0.5215687, 1, 1,
0.1977351, -0.8633156, 2.124468, 0, 0.5137255, 1, 1,
0.1990964, 0.425559, 0.07730009, 0, 0.509804, 1, 1,
0.1998338, 0.1689625, 1.897924, 0, 0.5019608, 1, 1,
0.2093714, 1.321654, -0.07991634, 0, 0.4941176, 1, 1,
0.2119684, 1.691556, 1.922007, 0, 0.4901961, 1, 1,
0.2134067, -0.2522643, 1.664065, 0, 0.4823529, 1, 1,
0.2184103, -0.8951311, 2.802294, 0, 0.4784314, 1, 1,
0.2191361, 0.4347931, 1.685021, 0, 0.4705882, 1, 1,
0.2293809, 0.1061032, 1.181115, 0, 0.4666667, 1, 1,
0.2336456, 0.7229251, -0.2116292, 0, 0.4588235, 1, 1,
0.2383036, -0.8262466, 1.792644, 0, 0.454902, 1, 1,
0.2404113, 2.055585, 0.3532332, 0, 0.4470588, 1, 1,
0.2425763, -1.72052, 0.747747, 0, 0.4431373, 1, 1,
0.2440573, 1.25621, 0.05328726, 0, 0.4352941, 1, 1,
0.2482932, 0.1538364, 0.1918976, 0, 0.4313726, 1, 1,
0.2506477, 0.1470832, 1.947079, 0, 0.4235294, 1, 1,
0.2539471, -0.7421749, 0.1716395, 0, 0.4196078, 1, 1,
0.2568752, 1.922552, 0.636332, 0, 0.4117647, 1, 1,
0.2570584, -0.8687356, 2.169626, 0, 0.4078431, 1, 1,
0.2590387, 0.6795473, -1.308285, 0, 0.4, 1, 1,
0.264153, -0.6091983, 3.567237, 0, 0.3921569, 1, 1,
0.2643112, 2.271665, -0.611246, 0, 0.3882353, 1, 1,
0.2664103, -0.193512, 1.691018, 0, 0.3803922, 1, 1,
0.2721466, 0.3902372, 0.9150386, 0, 0.3764706, 1, 1,
0.2763809, -0.0414206, 1.275491, 0, 0.3686275, 1, 1,
0.279925, -1.971218, 3.342653, 0, 0.3647059, 1, 1,
0.2810351, 1.593814, 0.7526318, 0, 0.3568628, 1, 1,
0.2850603, -1.409643, 2.888119, 0, 0.3529412, 1, 1,
0.2898702, -0.1644928, 0.6701987, 0, 0.345098, 1, 1,
0.2932775, 0.6760653, -0.2418267, 0, 0.3411765, 1, 1,
0.2938806, 0.5082029, 0.07851022, 0, 0.3333333, 1, 1,
0.3036028, 0.2537999, 0.2935025, 0, 0.3294118, 1, 1,
0.3048138, 2.043629, 2.62766, 0, 0.3215686, 1, 1,
0.3061741, 0.07660659, 3.52512, 0, 0.3176471, 1, 1,
0.3140778, -2.314575, 1.684815, 0, 0.3098039, 1, 1,
0.3187803, -1.43856, 1.26559, 0, 0.3058824, 1, 1,
0.3238866, -0.6027977, 1.855729, 0, 0.2980392, 1, 1,
0.3245512, 0.4981867, 1.782074, 0, 0.2901961, 1, 1,
0.326484, -0.1581282, 1.670035, 0, 0.2862745, 1, 1,
0.3270798, -0.6043632, 4.334872, 0, 0.2784314, 1, 1,
0.3288163, -0.9957731, 2.763935, 0, 0.2745098, 1, 1,
0.3289623, -0.8832581, 2.422056, 0, 0.2666667, 1, 1,
0.3321855, 0.4593081, 2.954685, 0, 0.2627451, 1, 1,
0.3328184, 1.65607, 0.6098155, 0, 0.254902, 1, 1,
0.3382745, 0.285794, 1.376856, 0, 0.2509804, 1, 1,
0.338648, -0.6411878, 2.892984, 0, 0.2431373, 1, 1,
0.3440824, -0.2579516, 1.26647, 0, 0.2392157, 1, 1,
0.3449626, 0.2064309, 2.981678, 0, 0.2313726, 1, 1,
0.3464499, 1.289763, -0.2152225, 0, 0.227451, 1, 1,
0.3488418, 0.4184897, 1.727072, 0, 0.2196078, 1, 1,
0.3529954, 1.310755, 0.1557816, 0, 0.2156863, 1, 1,
0.3558762, -0.1057159, 1.705262, 0, 0.2078431, 1, 1,
0.3565002, 0.654972, 1.435663, 0, 0.2039216, 1, 1,
0.3609913, 1.987415, 0.9525996, 0, 0.1960784, 1, 1,
0.3665611, 0.4418659, 1.363971, 0, 0.1882353, 1, 1,
0.3668577, 1.370827, -0.04930206, 0, 0.1843137, 1, 1,
0.3737672, 0.00883435, 1.122852, 0, 0.1764706, 1, 1,
0.3739563, -0.6619703, 3.437076, 0, 0.172549, 1, 1,
0.3761653, 0.9378687, 1.141685, 0, 0.1647059, 1, 1,
0.3777621, -0.3710999, 2.38287, 0, 0.1607843, 1, 1,
0.3800254, 1.045448, 0.5160155, 0, 0.1529412, 1, 1,
0.3842024, -0.8018572, 2.497053, 0, 0.1490196, 1, 1,
0.3871475, 0.02527182, 0.3740848, 0, 0.1411765, 1, 1,
0.3884155, -1.770563, 4.33531, 0, 0.1372549, 1, 1,
0.3931136, -1.09359, 2.946937, 0, 0.1294118, 1, 1,
0.3997686, 1.259908, 0.2616225, 0, 0.1254902, 1, 1,
0.4015291, 0.8672575, 0.7451447, 0, 0.1176471, 1, 1,
0.4050662, 0.6283365, -0.1848853, 0, 0.1137255, 1, 1,
0.4057344, 1.613291, -0.514837, 0, 0.1058824, 1, 1,
0.4062136, 1.110554, -0.7641532, 0, 0.09803922, 1, 1,
0.406878, -0.8786631, 3.059225, 0, 0.09411765, 1, 1,
0.407479, -0.1204296, 2.749101, 0, 0.08627451, 1, 1,
0.4131677, -0.4438717, 1.493313, 0, 0.08235294, 1, 1,
0.4182613, 1.336547, -0.4449342, 0, 0.07450981, 1, 1,
0.4204946, -0.5770625, 4.404307, 0, 0.07058824, 1, 1,
0.4220552, 0.6611184, 1.117329, 0, 0.0627451, 1, 1,
0.4227134, -1.065365, 1.539601, 0, 0.05882353, 1, 1,
0.4230398, 0.412237, -0.08381329, 0, 0.05098039, 1, 1,
0.4244778, -1.004541, 1.299633, 0, 0.04705882, 1, 1,
0.42624, -0.5778551, 3.747302, 0, 0.03921569, 1, 1,
0.4282635, 0.1762654, 1.191294, 0, 0.03529412, 1, 1,
0.4298005, 1.316597, 0.9074721, 0, 0.02745098, 1, 1,
0.4314501, 1.233739, 2.147196, 0, 0.02352941, 1, 1,
0.4350259, -0.02411274, 2.166511, 0, 0.01568628, 1, 1,
0.4457181, 1.599633, -0.2860382, 0, 0.01176471, 1, 1,
0.4470342, -0.7193079, 1.451833, 0, 0.003921569, 1, 1,
0.4490767, -1.232111, 3.44615, 0.003921569, 0, 1, 1,
0.4583784, -1.56672, 2.358598, 0.007843138, 0, 1, 1,
0.4604709, 0.1333228, 1.19759, 0.01568628, 0, 1, 1,
0.4612591, 1.081557, 0.6469317, 0.01960784, 0, 1, 1,
0.4644418, -0.7342553, 3.573275, 0.02745098, 0, 1, 1,
0.4648597, -1.999928, 3.566248, 0.03137255, 0, 1, 1,
0.4701308, -1.193724, 1.612195, 0.03921569, 0, 1, 1,
0.4728765, 0.5781153, 0.9345858, 0.04313726, 0, 1, 1,
0.4740948, -0.2604013, 1.905432, 0.05098039, 0, 1, 1,
0.4752764, -0.5014061, 3.35253, 0.05490196, 0, 1, 1,
0.4800806, 0.2059804, 1.022083, 0.0627451, 0, 1, 1,
0.4805635, -0.8270201, 1.887742, 0.06666667, 0, 1, 1,
0.4811778, 0.7125741, 1.879736, 0.07450981, 0, 1, 1,
0.4820305, 0.3854196, -0.2888093, 0.07843138, 0, 1, 1,
0.4849935, -0.814096, 2.741599, 0.08627451, 0, 1, 1,
0.4850961, 1.562099, 2.137743, 0.09019608, 0, 1, 1,
0.4871731, 0.2281529, 0.6329851, 0.09803922, 0, 1, 1,
0.4908774, -0.5786243, 2.388493, 0.1058824, 0, 1, 1,
0.4969555, 0.5847202, 0.6751401, 0.1098039, 0, 1, 1,
0.4977715, 0.3764873, 1.729643, 0.1176471, 0, 1, 1,
0.5018191, -3.198832, 3.362946, 0.1215686, 0, 1, 1,
0.5020433, 0.01072897, 1.648885, 0.1294118, 0, 1, 1,
0.5107048, 1.804725, -0.5933995, 0.1333333, 0, 1, 1,
0.5107686, 0.8797618, 0.6594837, 0.1411765, 0, 1, 1,
0.5181385, 1.221299, 0.5263475, 0.145098, 0, 1, 1,
0.5223638, -0.1840971, 2.347543, 0.1529412, 0, 1, 1,
0.5316203, 0.6206165, -0.348802, 0.1568628, 0, 1, 1,
0.5346779, -2.354791, 1.82665, 0.1647059, 0, 1, 1,
0.5406663, 0.2198462, 0.02714907, 0.1686275, 0, 1, 1,
0.5435677, 1.599468, 2.261127, 0.1764706, 0, 1, 1,
0.5497965, -1.466266, 3.730003, 0.1803922, 0, 1, 1,
0.5511776, -0.1818784, 1.350773, 0.1882353, 0, 1, 1,
0.5524689, -1.913113, 3.106558, 0.1921569, 0, 1, 1,
0.5539877, -1.091528, 3.693349, 0.2, 0, 1, 1,
0.5542946, 0.4679112, 2.177517, 0.2078431, 0, 1, 1,
0.5553585, -1.055545, 2.476142, 0.2117647, 0, 1, 1,
0.5628538, 1.506827, -0.5719475, 0.2196078, 0, 1, 1,
0.564069, 0.05873122, 1.820635, 0.2235294, 0, 1, 1,
0.566916, -0.581952, 2.093071, 0.2313726, 0, 1, 1,
0.56708, -0.2699451, 1.628756, 0.2352941, 0, 1, 1,
0.5688964, 0.832258, 2.14465, 0.2431373, 0, 1, 1,
0.5730712, 1.125108, -0.4625529, 0.2470588, 0, 1, 1,
0.575868, 0.2678543, 0.9132286, 0.254902, 0, 1, 1,
0.5781646, 0.0174447, 2.967341, 0.2588235, 0, 1, 1,
0.5805782, 1.170639, -0.1398783, 0.2666667, 0, 1, 1,
0.5828478, -1.068928, 1.632215, 0.2705882, 0, 1, 1,
0.5848832, -1.477182, 3.117494, 0.2784314, 0, 1, 1,
0.5888271, 0.3621066, 0.8059071, 0.282353, 0, 1, 1,
0.5906932, 0.1222253, 1.20729, 0.2901961, 0, 1, 1,
0.5961914, -1.050541, 3.387293, 0.2941177, 0, 1, 1,
0.5982941, -0.5895235, 3.639912, 0.3019608, 0, 1, 1,
0.60146, 1.855297, 1.729993, 0.3098039, 0, 1, 1,
0.6026508, -1.246024, 2.928823, 0.3137255, 0, 1, 1,
0.6096377, -0.7469945, 4.684135, 0.3215686, 0, 1, 1,
0.6123412, 0.6364517, 1.520561, 0.3254902, 0, 1, 1,
0.6137907, 0.184459, 1.221499, 0.3333333, 0, 1, 1,
0.6168962, -0.3239721, 1.101017, 0.3372549, 0, 1, 1,
0.6213449, -2.468427, 2.601826, 0.345098, 0, 1, 1,
0.6243184, 0.2705366, -0.2934158, 0.3490196, 0, 1, 1,
0.6243442, 0.2305001, -0.6445143, 0.3568628, 0, 1, 1,
0.6295624, 0.7263831, 1.000753, 0.3607843, 0, 1, 1,
0.6308746, -0.8815325, 0.04528921, 0.3686275, 0, 1, 1,
0.631875, -0.4685762, 0.7374625, 0.372549, 0, 1, 1,
0.6321891, 1.075619, -0.08352433, 0.3803922, 0, 1, 1,
0.6343516, -0.8941155, 3.137138, 0.3843137, 0, 1, 1,
0.6372362, 0.8933074, 0.7451704, 0.3921569, 0, 1, 1,
0.6376622, -1.43462, 2.389521, 0.3960784, 0, 1, 1,
0.6420881, -0.2253357, 0.888809, 0.4039216, 0, 1, 1,
0.6462707, -1.238028, 3.435238, 0.4117647, 0, 1, 1,
0.6470326, 1.857518, -0.8775339, 0.4156863, 0, 1, 1,
0.6497743, 0.3503182, 0.4165949, 0.4235294, 0, 1, 1,
0.6501982, -0.9374472, 2.726964, 0.427451, 0, 1, 1,
0.6520415, 0.7361384, 0.6980662, 0.4352941, 0, 1, 1,
0.6527984, 0.9074033, 0.8188138, 0.4392157, 0, 1, 1,
0.6536033, -1.050994, 2.027887, 0.4470588, 0, 1, 1,
0.6542143, -0.4862631, 2.672477, 0.4509804, 0, 1, 1,
0.657097, -2.01948, 3.30171, 0.4588235, 0, 1, 1,
0.6586611, -1.100924, 0.9552627, 0.4627451, 0, 1, 1,
0.6627049, -0.1056524, 1.75058, 0.4705882, 0, 1, 1,
0.663214, -1.488831, 1.164492, 0.4745098, 0, 1, 1,
0.6661775, 1.053473, -0.02234417, 0.4823529, 0, 1, 1,
0.6667644, 2.678682, 1.267522, 0.4862745, 0, 1, 1,
0.6744519, -0.5429583, 2.404291, 0.4941176, 0, 1, 1,
0.675738, -1.667942, 3.057941, 0.5019608, 0, 1, 1,
0.6759748, 1.507025, -1.169107, 0.5058824, 0, 1, 1,
0.683686, 0.06734382, 1.558689, 0.5137255, 0, 1, 1,
0.6887982, 0.3433365, 0.2005466, 0.5176471, 0, 1, 1,
0.6897218, -1.066196, 2.727037, 0.5254902, 0, 1, 1,
0.699376, 0.05870879, 1.126456, 0.5294118, 0, 1, 1,
0.7013622, -0.6356166, 2.604886, 0.5372549, 0, 1, 1,
0.7035179, 0.5920646, 0.199474, 0.5411765, 0, 1, 1,
0.7050043, 2.670587, 0.09652685, 0.5490196, 0, 1, 1,
0.7053619, -1.51075, 2.056422, 0.5529412, 0, 1, 1,
0.7063532, 0.400061, 1.245447, 0.5607843, 0, 1, 1,
0.7066976, 0.09156326, 1.605257, 0.5647059, 0, 1, 1,
0.7108316, 0.0672098, 3.19566, 0.572549, 0, 1, 1,
0.7150598, -0.6366112, 3.669547, 0.5764706, 0, 1, 1,
0.7197292, -1.371105, 2.759511, 0.5843138, 0, 1, 1,
0.723567, 0.3661344, 0.6013982, 0.5882353, 0, 1, 1,
0.7311763, 0.5487843, 0.2062628, 0.5960785, 0, 1, 1,
0.737996, 0.07487281, 1.040979, 0.6039216, 0, 1, 1,
0.741818, 0.150486, 0.879529, 0.6078432, 0, 1, 1,
0.745748, -1.071794, 2.734493, 0.6156863, 0, 1, 1,
0.7570629, -0.627264, 2.540813, 0.6196079, 0, 1, 1,
0.7587777, -1.557412, 2.409132, 0.627451, 0, 1, 1,
0.7646399, -1.456162, 1.663237, 0.6313726, 0, 1, 1,
0.765623, 1.034481, 1.686991, 0.6392157, 0, 1, 1,
0.766795, -1.886913, 0.8671398, 0.6431373, 0, 1, 1,
0.7669621, -0.9547361, 3.163086, 0.6509804, 0, 1, 1,
0.766999, 0.9087696, 1.494129, 0.654902, 0, 1, 1,
0.7685785, 0.7540337, 1.303419, 0.6627451, 0, 1, 1,
0.7701494, -1.444624, 2.526788, 0.6666667, 0, 1, 1,
0.7743699, -1.035656, 4.740182, 0.6745098, 0, 1, 1,
0.7766797, -1.694692, 2.196434, 0.6784314, 0, 1, 1,
0.780184, -0.5865034, 3.676645, 0.6862745, 0, 1, 1,
0.7838928, -0.2714634, 1.421194, 0.6901961, 0, 1, 1,
0.7920757, -0.6432407, 4.026827, 0.6980392, 0, 1, 1,
0.7938495, 0.8363685, 1.044543, 0.7058824, 0, 1, 1,
0.7980681, 1.922762, -0.3315766, 0.7098039, 0, 1, 1,
0.799511, -1.622421, 2.499161, 0.7176471, 0, 1, 1,
0.7997951, 1.170918, 0.2504219, 0.7215686, 0, 1, 1,
0.8040242, -0.6098223, 2.442135, 0.7294118, 0, 1, 1,
0.8101167, -0.1310666, 3.021331, 0.7333333, 0, 1, 1,
0.8171902, 0.3676473, 1.610487, 0.7411765, 0, 1, 1,
0.8176852, -1.083945, 3.2508, 0.7450981, 0, 1, 1,
0.8189817, 1.368964, 2.461092, 0.7529412, 0, 1, 1,
0.8226622, -0.7168619, 0.3778132, 0.7568628, 0, 1, 1,
0.8242586, 0.3767429, 1.706983, 0.7647059, 0, 1, 1,
0.8262438, 0.07162616, 0.2780115, 0.7686275, 0, 1, 1,
0.8283256, 0.6635723, 1.095174, 0.7764706, 0, 1, 1,
0.8324334, 1.057767, 0.5089618, 0.7803922, 0, 1, 1,
0.8333715, -0.5901376, 3.018345, 0.7882353, 0, 1, 1,
0.8340232, -0.4067296, 0.7805391, 0.7921569, 0, 1, 1,
0.8368535, 1.356579, 0.2750022, 0.8, 0, 1, 1,
0.8422499, -1.278559, 4.458799, 0.8078431, 0, 1, 1,
0.84258, -0.2208063, 1.881842, 0.8117647, 0, 1, 1,
0.8436219, -0.2970688, 1.929359, 0.8196079, 0, 1, 1,
0.8491616, -0.5156769, 4.095642, 0.8235294, 0, 1, 1,
0.8502288, -0.523667, 2.750162, 0.8313726, 0, 1, 1,
0.8508198, -0.01816108, 0.9434513, 0.8352941, 0, 1, 1,
0.8565247, 1.503423, -0.1530283, 0.8431373, 0, 1, 1,
0.8628599, 2.330131, 1.331375, 0.8470588, 0, 1, 1,
0.8692631, -0.111175, 2.181516, 0.854902, 0, 1, 1,
0.8727843, 0.9827233, 1.411675, 0.8588235, 0, 1, 1,
0.8807399, -1.504351, 3.290848, 0.8666667, 0, 1, 1,
0.8854722, -1.114174, 1.398229, 0.8705882, 0, 1, 1,
0.8900816, 0.517633, -0.05162584, 0.8784314, 0, 1, 1,
0.894717, 0.03599331, 1.956246, 0.8823529, 0, 1, 1,
0.9005753, 1.127677, 0.8446081, 0.8901961, 0, 1, 1,
0.9078364, -0.4527867, 3.773975, 0.8941177, 0, 1, 1,
0.9085176, 0.2903737, 1.249483, 0.9019608, 0, 1, 1,
0.9252046, 0.4560486, 0.8439188, 0.9098039, 0, 1, 1,
0.9255116, -0.8384096, 2.969144, 0.9137255, 0, 1, 1,
0.927865, 0.4353696, 1.686384, 0.9215686, 0, 1, 1,
0.9301828, -1.580475, 1.829131, 0.9254902, 0, 1, 1,
0.9358392, 1.210828, 0.9355174, 0.9333333, 0, 1, 1,
0.9426625, -0.8491894, 1.551282, 0.9372549, 0, 1, 1,
0.9436376, -0.8328649, 3.661257, 0.945098, 0, 1, 1,
0.9484743, 0.01466186, 0.8141731, 0.9490196, 0, 1, 1,
0.9518683, -0.4022369, 0.08099957, 0.9568627, 0, 1, 1,
0.9533941, -0.6976661, 2.75509, 0.9607843, 0, 1, 1,
0.9621246, -2.018415, 3.242787, 0.9686275, 0, 1, 1,
0.963236, -1.429631, 2.069863, 0.972549, 0, 1, 1,
0.9839067, -1.970947, 4.312095, 0.9803922, 0, 1, 1,
0.9918535, 0.06889274, 2.825228, 0.9843137, 0, 1, 1,
0.991927, 0.4679927, 1.374572, 0.9921569, 0, 1, 1,
0.9931523, -1.116968, 1.866153, 0.9960784, 0, 1, 1,
0.9940791, 1.285377, 0.9438583, 1, 0, 0.9960784, 1,
1.003811, 3.183137, -0.394224, 1, 0, 0.9882353, 1,
1.006754, 0.2901826, 0.9499997, 1, 0, 0.9843137, 1,
1.009807, -1.470886, 2.049267, 1, 0, 0.9764706, 1,
1.016989, -0.1214026, 2.866349, 1, 0, 0.972549, 1,
1.019103, 0.4556623, 0.2330226, 1, 0, 0.9647059, 1,
1.029356, -0.009332815, 2.043823, 1, 0, 0.9607843, 1,
1.032034, 0.6293131, 1.952016, 1, 0, 0.9529412, 1,
1.035736, 1.395155, -1.066777, 1, 0, 0.9490196, 1,
1.035759, 1.145306, 0.918846, 1, 0, 0.9411765, 1,
1.038668, -0.44581, 1.165783, 1, 0, 0.9372549, 1,
1.039974, -1.062652, 2.833704, 1, 0, 0.9294118, 1,
1.054088, 3.061834, 1.060162, 1, 0, 0.9254902, 1,
1.054858, -0.65255, 4.287622, 1, 0, 0.9176471, 1,
1.059671, 0.01457277, 1.525084, 1, 0, 0.9137255, 1,
1.06412, -1.461599, 2.71064, 1, 0, 0.9058824, 1,
1.067337, -0.4844935, 2.352786, 1, 0, 0.9019608, 1,
1.067563, 1.135513, -0.4497447, 1, 0, 0.8941177, 1,
1.084443, 0.4808334, 0.6431867, 1, 0, 0.8862745, 1,
1.085113, 0.5940696, 3.648987, 1, 0, 0.8823529, 1,
1.086196, 0.2072599, 0.8494161, 1, 0, 0.8745098, 1,
1.094744, -0.9035629, 2.224543, 1, 0, 0.8705882, 1,
1.098823, 0.4273945, 2.34198, 1, 0, 0.8627451, 1,
1.106681, -0.9996478, 1.816372, 1, 0, 0.8588235, 1,
1.108223, -0.6760216, 3.71942, 1, 0, 0.8509804, 1,
1.110546, 0.8016584, 0.9016373, 1, 0, 0.8470588, 1,
1.116219, -0.9229315, 2.427996, 1, 0, 0.8392157, 1,
1.118113, 1.556549, 2.083555, 1, 0, 0.8352941, 1,
1.118251, -0.5366764, 3.501989, 1, 0, 0.827451, 1,
1.119154, -0.009713169, 1.622259, 1, 0, 0.8235294, 1,
1.122986, 1.578032, 2.560133, 1, 0, 0.8156863, 1,
1.136407, -0.627028, 1.939172, 1, 0, 0.8117647, 1,
1.136554, -0.7097813, 1.749849, 1, 0, 0.8039216, 1,
1.139024, 1.811658, 0.9824325, 1, 0, 0.7960784, 1,
1.143871, -1.584717, 2.54944, 1, 0, 0.7921569, 1,
1.148638, 1.009166, -0.4112249, 1, 0, 0.7843137, 1,
1.151297, -0.6450462, 2.380414, 1, 0, 0.7803922, 1,
1.159344, 1.090962, 2.540706, 1, 0, 0.772549, 1,
1.159584, -1.431608, 1.627051, 1, 0, 0.7686275, 1,
1.160021, -1.105759, 3.609113, 1, 0, 0.7607843, 1,
1.165121, -1.590607, 1.822018, 1, 0, 0.7568628, 1,
1.165962, 0.6322669, 0.331713, 1, 0, 0.7490196, 1,
1.166664, 0.1009771, 0.5589972, 1, 0, 0.7450981, 1,
1.172235, -0.8822651, 2.120418, 1, 0, 0.7372549, 1,
1.172742, 1.304873, -0.3100776, 1, 0, 0.7333333, 1,
1.175272, -0.01203486, 1.614516, 1, 0, 0.7254902, 1,
1.187009, -0.1855029, 1.4023, 1, 0, 0.7215686, 1,
1.19232, 0.07171231, 2.367042, 1, 0, 0.7137255, 1,
1.194244, -0.6457195, 2.774783, 1, 0, 0.7098039, 1,
1.196122, 1.642016, 1.575729, 1, 0, 0.7019608, 1,
1.198685, 0.1905627, 0.9342987, 1, 0, 0.6941177, 1,
1.199862, -0.2087502, 1.247612, 1, 0, 0.6901961, 1,
1.226961, -0.3852159, 0.5549369, 1, 0, 0.682353, 1,
1.230865, 1.059542, 1.359155, 1, 0, 0.6784314, 1,
1.234212, -0.07550959, 2.177479, 1, 0, 0.6705883, 1,
1.254694, 0.1710979, 0.8100112, 1, 0, 0.6666667, 1,
1.259932, -0.8223712, 2.707223, 1, 0, 0.6588235, 1,
1.262499, -0.1156877, 1.790874, 1, 0, 0.654902, 1,
1.262694, 0.4068212, 0.6469028, 1, 0, 0.6470588, 1,
1.273712, -0.4416839, 0.914343, 1, 0, 0.6431373, 1,
1.276176, 0.4121994, 2.381624, 1, 0, 0.6352941, 1,
1.282515, -0.9344702, 3.815945, 1, 0, 0.6313726, 1,
1.293114, 0.7080922, 0.8496134, 1, 0, 0.6235294, 1,
1.294787, 0.747951, -0.5457017, 1, 0, 0.6196079, 1,
1.296504, 1.33439, 1.155625, 1, 0, 0.6117647, 1,
1.3088, -1.258239, 2.755768, 1, 0, 0.6078432, 1,
1.309542, 0.7164586, 0.4657353, 1, 0, 0.6, 1,
1.309582, 0.246415, 0.7108686, 1, 0, 0.5921569, 1,
1.314641, -0.5819837, 3.405095, 1, 0, 0.5882353, 1,
1.316665, 0.8304601, 0.7373452, 1, 0, 0.5803922, 1,
1.318201, 0.1295008, 0.4956325, 1, 0, 0.5764706, 1,
1.321473, 0.5191903, 0.9434885, 1, 0, 0.5686275, 1,
1.325996, 0.4353939, 2.80245, 1, 0, 0.5647059, 1,
1.340049, -0.1912105, 0.6684534, 1, 0, 0.5568628, 1,
1.346387, 0.4990642, 1.331428, 1, 0, 0.5529412, 1,
1.347765, -1.734519, 3.274777, 1, 0, 0.5450981, 1,
1.352189, 0.4078165, 1.474686, 1, 0, 0.5411765, 1,
1.354829, -0.4302531, 1.900675, 1, 0, 0.5333334, 1,
1.35909, 1.258834, -1.337765, 1, 0, 0.5294118, 1,
1.361951, 0.5172148, 1.326027, 1, 0, 0.5215687, 1,
1.372795, 1.102994, -0.5841655, 1, 0, 0.5176471, 1,
1.37341, -0.1891036, 0.5971146, 1, 0, 0.509804, 1,
1.393773, -1.060882, 2.98308, 1, 0, 0.5058824, 1,
1.39815, -0.8009442, 1.776166, 1, 0, 0.4980392, 1,
1.410142, 0.4040054, 0.4328506, 1, 0, 0.4901961, 1,
1.412928, 1.250129, 0.4385763, 1, 0, 0.4862745, 1,
1.414352, -0.5977174, 2.759934, 1, 0, 0.4784314, 1,
1.42271, -0.1169329, 2.359936, 1, 0, 0.4745098, 1,
1.428751, -0.4740288, 1.499415, 1, 0, 0.4666667, 1,
1.4295, 0.4722203, 1.625398, 1, 0, 0.4627451, 1,
1.44377, -1.947403, 1.99526, 1, 0, 0.454902, 1,
1.444529, 0.662271, 2.180784, 1, 0, 0.4509804, 1,
1.456223, -0.2890587, 2.154306, 1, 0, 0.4431373, 1,
1.458073, -3.835838, 3.149412, 1, 0, 0.4392157, 1,
1.474245, 0.02298613, 1.258852, 1, 0, 0.4313726, 1,
1.499999, 1.712767, 1.237481, 1, 0, 0.427451, 1,
1.50082, 0.9671314, 1.058666, 1, 0, 0.4196078, 1,
1.503005, -0.249204, 1.397818, 1, 0, 0.4156863, 1,
1.510092, -1.721293, 2.694439, 1, 0, 0.4078431, 1,
1.513431, -0.843116, 3.600877, 1, 0, 0.4039216, 1,
1.526783, 1.934193, 2.039024, 1, 0, 0.3960784, 1,
1.52939, 1.334537, -0.1434364, 1, 0, 0.3882353, 1,
1.54534, -0.5201355, 1.609508, 1, 0, 0.3843137, 1,
1.549938, -1.212689, 2.439212, 1, 0, 0.3764706, 1,
1.550761, -0.2577758, 5.205133, 1, 0, 0.372549, 1,
1.562021, -0.5649096, 0.8750823, 1, 0, 0.3647059, 1,
1.562458, 1.291895, 0.3377618, 1, 0, 0.3607843, 1,
1.565709, -0.4142938, 1.793962, 1, 0, 0.3529412, 1,
1.565816, 1.309008, 3.403855, 1, 0, 0.3490196, 1,
1.573729, -0.190213, 0.9729581, 1, 0, 0.3411765, 1,
1.574297, -0.04539721, 1.321053, 1, 0, 0.3372549, 1,
1.577371, 0.7075956, 1.761164, 1, 0, 0.3294118, 1,
1.593585, -0.9434569, 2.280086, 1, 0, 0.3254902, 1,
1.59576, -0.2240199, 1.856282, 1, 0, 0.3176471, 1,
1.596221, 1.769343, 1.330907, 1, 0, 0.3137255, 1,
1.609132, 0.2631181, 1.885896, 1, 0, 0.3058824, 1,
1.624489, -1.062362, 2.940317, 1, 0, 0.2980392, 1,
1.625615, 0.6353006, -0.2952086, 1, 0, 0.2941177, 1,
1.630696, -1.929874, 3.570704, 1, 0, 0.2862745, 1,
1.65283, 1.068132, 2.337856, 1, 0, 0.282353, 1,
1.656693, 0.06166708, 1.604876, 1, 0, 0.2745098, 1,
1.697161, 1.342147, 2.059808, 1, 0, 0.2705882, 1,
1.698023, 0.1769158, 1.721695, 1, 0, 0.2627451, 1,
1.707773, -0.4675285, 0.9076223, 1, 0, 0.2588235, 1,
1.722886, -0.1455164, 1.824736, 1, 0, 0.2509804, 1,
1.733245, -0.04494139, 0.814175, 1, 0, 0.2470588, 1,
1.743206, 0.3250659, 1.923526, 1, 0, 0.2392157, 1,
1.761921, -1.378178, 0.8806214, 1, 0, 0.2352941, 1,
1.779573, 0.1817385, 2.616056, 1, 0, 0.227451, 1,
1.794626, 1.090226, 1.255487, 1, 0, 0.2235294, 1,
1.803806, 0.01526298, 2.523147, 1, 0, 0.2156863, 1,
1.805434, -0.9254662, 1.32135, 1, 0, 0.2117647, 1,
1.807078, 0.1546099, 0.8208477, 1, 0, 0.2039216, 1,
1.817442, -0.8194039, 0.8636377, 1, 0, 0.1960784, 1,
1.82006, -1.735709, 0.8134433, 1, 0, 0.1921569, 1,
1.826269, 1.328627, 0.1303153, 1, 0, 0.1843137, 1,
1.831624, 1.365664, 0.4983918, 1, 0, 0.1803922, 1,
1.841857, -0.7816571, 2.132056, 1, 0, 0.172549, 1,
1.845946, 0.1997872, 2.345179, 1, 0, 0.1686275, 1,
1.852709, 1.83366, 1.83679, 1, 0, 0.1607843, 1,
1.858863, 0.05818583, 1.887576, 1, 0, 0.1568628, 1,
1.859242, -2.034269, 1.866869, 1, 0, 0.1490196, 1,
1.865254, 0.4185783, 1.961472, 1, 0, 0.145098, 1,
1.919279, -2.754764, 2.360028, 1, 0, 0.1372549, 1,
1.92102, -1.51862, 4.253892, 1, 0, 0.1333333, 1,
1.958091, 1.379704, 2.487152, 1, 0, 0.1254902, 1,
2.062761, -0.3049915, 0.2851041, 1, 0, 0.1215686, 1,
2.091653, 1.050552, 1.466781, 1, 0, 0.1137255, 1,
2.122584, 0.4613234, 2.888154, 1, 0, 0.1098039, 1,
2.127663, -1.092126, 2.468551, 1, 0, 0.1019608, 1,
2.141212, -1.160918, 3.598897, 1, 0, 0.09411765, 1,
2.16504, -1.060734, 1.934178, 1, 0, 0.09019608, 1,
2.20887, 0.2454856, 1.318262, 1, 0, 0.08235294, 1,
2.253107, 0.9710145, 0.9409816, 1, 0, 0.07843138, 1,
2.273977, 0.01426895, 2.286098, 1, 0, 0.07058824, 1,
2.292165, 2.123263, 0.9068053, 1, 0, 0.06666667, 1,
2.300554, -1.252802, 2.76069, 1, 0, 0.05882353, 1,
2.301553, -1.979346, 1.508571, 1, 0, 0.05490196, 1,
2.306242, 0.8666717, 1.187081, 1, 0, 0.04705882, 1,
2.38128, 0.5873682, 1.898652, 1, 0, 0.04313726, 1,
2.481436, 1.805745, -1.517901, 1, 0, 0.03529412, 1,
2.488543, -0.2244629, 1.363754, 1, 0, 0.03137255, 1,
2.693638, -0.3639469, 1.948614, 1, 0, 0.02352941, 1,
2.825112, 1.198262, 1.45777, 1, 0, 0.01960784, 1,
2.869766, -0.712606, 1.190013, 1, 0, 0.01176471, 1,
2.935362, 0.4945885, 2.522382, 1, 0, 0.007843138, 1
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
-0.02172923, -5.025555, -7.139346, 0, -0.5, 0.5, 0.5,
-0.02172923, -5.025555, -7.139346, 1, -0.5, 0.5, 0.5,
-0.02172923, -5.025555, -7.139346, 1, 1.5, 0.5, 0.5,
-0.02172923, -5.025555, -7.139346, 0, 1.5, 0.5, 0.5
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
-3.981275, -0.3263508, -7.139346, 0, -0.5, 0.5, 0.5,
-3.981275, -0.3263508, -7.139346, 1, -0.5, 0.5, 0.5,
-3.981275, -0.3263508, -7.139346, 1, 1.5, 0.5, 0.5,
-3.981275, -0.3263508, -7.139346, 0, 1.5, 0.5, 0.5
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
-3.981275, -5.025555, 0.1094978, 0, -0.5, 0.5, 0.5,
-3.981275, -5.025555, 0.1094978, 1, -0.5, 0.5, 0.5,
-3.981275, -5.025555, 0.1094978, 1, 1.5, 0.5, 0.5,
-3.981275, -5.025555, 0.1094978, 0, 1.5, 0.5, 0.5
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
-2, -3.941123, -5.466536,
2, -3.941123, -5.466536,
-2, -3.941123, -5.466536,
-2, -4.121861, -5.745337,
-1, -3.941123, -5.466536,
-1, -4.121861, -5.745337,
0, -3.941123, -5.466536,
0, -4.121861, -5.745337,
1, -3.941123, -5.466536,
1, -4.121861, -5.745337,
2, -3.941123, -5.466536,
2, -4.121861, -5.745337
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
-2, -4.483339, -6.30294, 0, -0.5, 0.5, 0.5,
-2, -4.483339, -6.30294, 1, -0.5, 0.5, 0.5,
-2, -4.483339, -6.30294, 1, 1.5, 0.5, 0.5,
-2, -4.483339, -6.30294, 0, 1.5, 0.5, 0.5,
-1, -4.483339, -6.30294, 0, -0.5, 0.5, 0.5,
-1, -4.483339, -6.30294, 1, -0.5, 0.5, 0.5,
-1, -4.483339, -6.30294, 1, 1.5, 0.5, 0.5,
-1, -4.483339, -6.30294, 0, 1.5, 0.5, 0.5,
0, -4.483339, -6.30294, 0, -0.5, 0.5, 0.5,
0, -4.483339, -6.30294, 1, -0.5, 0.5, 0.5,
0, -4.483339, -6.30294, 1, 1.5, 0.5, 0.5,
0, -4.483339, -6.30294, 0, 1.5, 0.5, 0.5,
1, -4.483339, -6.30294, 0, -0.5, 0.5, 0.5,
1, -4.483339, -6.30294, 1, -0.5, 0.5, 0.5,
1, -4.483339, -6.30294, 1, 1.5, 0.5, 0.5,
1, -4.483339, -6.30294, 0, 1.5, 0.5, 0.5,
2, -4.483339, -6.30294, 0, -0.5, 0.5, 0.5,
2, -4.483339, -6.30294, 1, -0.5, 0.5, 0.5,
2, -4.483339, -6.30294, 1, 1.5, 0.5, 0.5,
2, -4.483339, -6.30294, 0, 1.5, 0.5, 0.5
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
-3.067533, -2, -5.466536,
-3.067533, 2, -5.466536,
-3.067533, -2, -5.466536,
-3.219824, -2, -5.745337,
-3.067533, 0, -5.466536,
-3.219824, 0, -5.745337,
-3.067533, 2, -5.466536,
-3.219824, 2, -5.745337
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
-3.524404, -2, -6.30294, 0, -0.5, 0.5, 0.5,
-3.524404, -2, -6.30294, 1, -0.5, 0.5, 0.5,
-3.524404, -2, -6.30294, 1, 1.5, 0.5, 0.5,
-3.524404, -2, -6.30294, 0, 1.5, 0.5, 0.5,
-3.524404, 0, -6.30294, 0, -0.5, 0.5, 0.5,
-3.524404, 0, -6.30294, 1, -0.5, 0.5, 0.5,
-3.524404, 0, -6.30294, 1, 1.5, 0.5, 0.5,
-3.524404, 0, -6.30294, 0, 1.5, 0.5, 0.5,
-3.524404, 2, -6.30294, 0, -0.5, 0.5, 0.5,
-3.524404, 2, -6.30294, 1, -0.5, 0.5, 0.5,
-3.524404, 2, -6.30294, 1, 1.5, 0.5, 0.5,
-3.524404, 2, -6.30294, 0, 1.5, 0.5, 0.5
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
-3.067533, -3.941123, -4,
-3.067533, -3.941123, 4,
-3.067533, -3.941123, -4,
-3.219824, -4.121861, -4,
-3.067533, -3.941123, -2,
-3.219824, -4.121861, -2,
-3.067533, -3.941123, 0,
-3.219824, -4.121861, 0,
-3.067533, -3.941123, 2,
-3.219824, -4.121861, 2,
-3.067533, -3.941123, 4,
-3.219824, -4.121861, 4
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
-3.524404, -4.483339, -4, 0, -0.5, 0.5, 0.5,
-3.524404, -4.483339, -4, 1, -0.5, 0.5, 0.5,
-3.524404, -4.483339, -4, 1, 1.5, 0.5, 0.5,
-3.524404, -4.483339, -4, 0, 1.5, 0.5, 0.5,
-3.524404, -4.483339, -2, 0, -0.5, 0.5, 0.5,
-3.524404, -4.483339, -2, 1, -0.5, 0.5, 0.5,
-3.524404, -4.483339, -2, 1, 1.5, 0.5, 0.5,
-3.524404, -4.483339, -2, 0, 1.5, 0.5, 0.5,
-3.524404, -4.483339, 0, 0, -0.5, 0.5, 0.5,
-3.524404, -4.483339, 0, 1, -0.5, 0.5, 0.5,
-3.524404, -4.483339, 0, 1, 1.5, 0.5, 0.5,
-3.524404, -4.483339, 0, 0, 1.5, 0.5, 0.5,
-3.524404, -4.483339, 2, 0, -0.5, 0.5, 0.5,
-3.524404, -4.483339, 2, 1, -0.5, 0.5, 0.5,
-3.524404, -4.483339, 2, 1, 1.5, 0.5, 0.5,
-3.524404, -4.483339, 2, 0, 1.5, 0.5, 0.5,
-3.524404, -4.483339, 4, 0, -0.5, 0.5, 0.5,
-3.524404, -4.483339, 4, 1, -0.5, 0.5, 0.5,
-3.524404, -4.483339, 4, 1, 1.5, 0.5, 0.5,
-3.524404, -4.483339, 4, 0, 1.5, 0.5, 0.5
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
-3.067533, -3.941123, -5.466536,
-3.067533, 3.288421, -5.466536,
-3.067533, -3.941123, 5.685531,
-3.067533, 3.288421, 5.685531,
-3.067533, -3.941123, -5.466536,
-3.067533, -3.941123, 5.685531,
-3.067533, 3.288421, -5.466536,
-3.067533, 3.288421, 5.685531,
-3.067533, -3.941123, -5.466536,
3.024075, -3.941123, -5.466536,
-3.067533, -3.941123, 5.685531,
3.024075, -3.941123, 5.685531,
-3.067533, 3.288421, -5.466536,
3.024075, 3.288421, -5.466536,
-3.067533, 3.288421, 5.685531,
3.024075, 3.288421, 5.685531,
3.024075, -3.941123, -5.466536,
3.024075, 3.288421, -5.466536,
3.024075, -3.941123, 5.685531,
3.024075, 3.288421, 5.685531,
3.024075, -3.941123, -5.466536,
3.024075, -3.941123, 5.685531,
3.024075, 3.288421, -5.466536,
3.024075, 3.288421, 5.685531
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
var radius = 7.806763;
var distance = 34.73317;
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
mvMatrix.translate( 0.02172923, 0.3263508, -0.1094978 );
mvMatrix.scale( 1.385648, 1.167546, 0.7568844 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.73317);
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
Cadusafos<-read.table("Cadusafos.xyz", skip=1)
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
-2.978821, -3.122212, -1.949564, 0, 0, 1, 1, 1,
-2.914986, 1.084278, -1.59763, 1, 0, 0, 1, 1,
-2.758529, 0.1254562, -1.744446, 1, 0, 0, 1, 1,
-2.722288, 0.1316639, -2.273915, 1, 0, 0, 1, 1,
-2.540739, -0.6603565, -1.544805, 1, 0, 0, 1, 1,
-2.475299, -1.168654, -2.700131, 1, 0, 0, 1, 1,
-2.472269, -0.6260402, -2.670792, 0, 0, 0, 1, 1,
-2.425924, 0.1499893, -2.338943, 0, 0, 0, 1, 1,
-2.329761, -0.02107667, -0.2031746, 0, 0, 0, 1, 1,
-2.282475, -0.1918597, -1.783662, 0, 0, 0, 1, 1,
-2.280242, -0.2724461, -2.839218, 0, 0, 0, 1, 1,
-2.252351, 0.668384, -2.918541, 0, 0, 0, 1, 1,
-2.247691, 0.3002773, -2.29145, 0, 0, 0, 1, 1,
-2.213194, -0.08933397, -1.586556, 1, 1, 1, 1, 1,
-2.206862, -0.06925456, -1.188826, 1, 1, 1, 1, 1,
-2.181272, 1.318164, -1.634004, 1, 1, 1, 1, 1,
-2.1805, -0.05000175, -2.931154, 1, 1, 1, 1, 1,
-2.179814, -0.4052049, -2.177056, 1, 1, 1, 1, 1,
-2.175242, -0.9303948, -1.603085, 1, 1, 1, 1, 1,
-2.162477, -0.5661133, -0.8331335, 1, 1, 1, 1, 1,
-2.130587, -0.0167301, -0.7791717, 1, 1, 1, 1, 1,
-2.067729, -1.658149, -3.071521, 1, 1, 1, 1, 1,
-2.063974, 0.8982078, -0.7173111, 1, 1, 1, 1, 1,
-2.046573, 0.9757691, 1.07787, 1, 1, 1, 1, 1,
-2.033788, -0.7616233, -1.944281, 1, 1, 1, 1, 1,
-2.013152, -0.9640624, -4.516692, 1, 1, 1, 1, 1,
-1.984911, 2.380614, 1.11368, 1, 1, 1, 1, 1,
-1.979575, -1.72831, -3.698404, 1, 1, 1, 1, 1,
-1.958932, 0.9403529, -1.802241, 0, 0, 1, 1, 1,
-1.906767, 1.578055, 0.6080849, 1, 0, 0, 1, 1,
-1.864956, -0.3068155, -1.891494, 1, 0, 0, 1, 1,
-1.859946, 0.5788154, 0.4269285, 1, 0, 0, 1, 1,
-1.858481, -0.3915582, -2.688329, 1, 0, 0, 1, 1,
-1.821551, -1.163656, -2.293108, 1, 0, 0, 1, 1,
-1.803446, -0.286387, -1.241941, 0, 0, 0, 1, 1,
-1.794733, -0.2573217, -1.978208, 0, 0, 0, 1, 1,
-1.793903, -1.579303, -2.163337, 0, 0, 0, 1, 1,
-1.784652, -1.386176, -2.287992, 0, 0, 0, 1, 1,
-1.78435, 0.2145322, -1.08393, 0, 0, 0, 1, 1,
-1.77729, 0.1234916, -1.629779, 0, 0, 0, 1, 1,
-1.766022, -1.263776, -3.641676, 0, 0, 0, 1, 1,
-1.756371, 0.239194, -2.632559, 1, 1, 1, 1, 1,
-1.742862, 0.5047243, -2.169294, 1, 1, 1, 1, 1,
-1.701314, 0.6306884, -2.275393, 1, 1, 1, 1, 1,
-1.679496, 1.664873, 0.2116618, 1, 1, 1, 1, 1,
-1.670246, -0.5503137, -2.500205, 1, 1, 1, 1, 1,
-1.645667, -0.2236325, -0.4797516, 1, 1, 1, 1, 1,
-1.638971, 0.7421446, 0.4524762, 1, 1, 1, 1, 1,
-1.626722, -1.515633, -0.4326693, 1, 1, 1, 1, 1,
-1.618554, 1.737228, 0.1678574, 1, 1, 1, 1, 1,
-1.616597, 0.8696859, -2.592724, 1, 1, 1, 1, 1,
-1.608366, -1.93167, -2.539411, 1, 1, 1, 1, 1,
-1.599668, -0.4130282, 0.3712621, 1, 1, 1, 1, 1,
-1.593236, -0.1154864, -1.789942, 1, 1, 1, 1, 1,
-1.591415, 1.132498, -1.492319, 1, 1, 1, 1, 1,
-1.587448, 0.2667956, -2.755893, 1, 1, 1, 1, 1,
-1.585141, -1.094142, -2.528751, 0, 0, 1, 1, 1,
-1.581199, 1.15036, -0.3711362, 1, 0, 0, 1, 1,
-1.576577, 1.147607, -1.966261, 1, 0, 0, 1, 1,
-1.569535, 0.5958993, -1.016647, 1, 0, 0, 1, 1,
-1.568412, -0.2320883, -2.568473, 1, 0, 0, 1, 1,
-1.562305, -0.44137, -0.5423632, 1, 0, 0, 1, 1,
-1.557338, 0.7140993, -2.166634, 0, 0, 0, 1, 1,
-1.544891, 1.296464, -0.6171086, 0, 0, 0, 1, 1,
-1.540748, 0.4135453, -0.1965902, 0, 0, 0, 1, 1,
-1.539831, -1.061626, -3.171971, 0, 0, 0, 1, 1,
-1.535224, -1.32339, -1.010211, 0, 0, 0, 1, 1,
-1.533881, 0.5746446, -0.8832827, 0, 0, 0, 1, 1,
-1.533735, -1.415398, -0.4424375, 0, 0, 0, 1, 1,
-1.525616, 0.6621515, -0.4361924, 1, 1, 1, 1, 1,
-1.523087, -1.574585, -1.802395, 1, 1, 1, 1, 1,
-1.522343, -0.390571, -1.443925, 1, 1, 1, 1, 1,
-1.499522, -0.1284024, -1.471747, 1, 1, 1, 1, 1,
-1.491926, -1.853084, -3.123398, 1, 1, 1, 1, 1,
-1.475088, 0.3768044, -1.791071, 1, 1, 1, 1, 1,
-1.468589, 0.05009376, -2.330314, 1, 1, 1, 1, 1,
-1.457898, 0.06106474, -2.535439, 1, 1, 1, 1, 1,
-1.452219, -0.3739538, -2.261997, 1, 1, 1, 1, 1,
-1.429638, -1.088216, -2.305929, 1, 1, 1, 1, 1,
-1.422582, -0.4401531, -2.552701, 1, 1, 1, 1, 1,
-1.422343, 0.863699, -1.77653, 1, 1, 1, 1, 1,
-1.418934, 0.1179089, -2.150834, 1, 1, 1, 1, 1,
-1.41436, 0.1621857, -1.712312, 1, 1, 1, 1, 1,
-1.411324, 1.079149, -0.6214225, 1, 1, 1, 1, 1,
-1.40327, 2.442838, -0.9776688, 0, 0, 1, 1, 1,
-1.398219, -0.1433887, -1.626934, 1, 0, 0, 1, 1,
-1.390816, 1.018209, -2.384991, 1, 0, 0, 1, 1,
-1.385764, -0.5693066, -3.686333, 1, 0, 0, 1, 1,
-1.385323, -1.784971, -1.76424, 1, 0, 0, 1, 1,
-1.369383, -1.85249, -3.213464, 1, 0, 0, 1, 1,
-1.362985, -1.017469, -2.656124, 0, 0, 0, 1, 1,
-1.354739, -0.3908947, -2.274936, 0, 0, 0, 1, 1,
-1.35079, -1.080944, -3.79921, 0, 0, 0, 1, 1,
-1.341835, 1.058272, -0.8098043, 0, 0, 0, 1, 1,
-1.338891, -0.8066869, -3.166339, 0, 0, 0, 1, 1,
-1.336907, 0.8085372, -0.1905391, 0, 0, 0, 1, 1,
-1.336496, 0.1820758, -1.964473, 0, 0, 0, 1, 1,
-1.329037, 1.058922, 1.134417, 1, 1, 1, 1, 1,
-1.327388, 2.000328, -0.342929, 1, 1, 1, 1, 1,
-1.320014, -0.8756698, -1.971744, 1, 1, 1, 1, 1,
-1.302655, -0.7013692, -2.957387, 1, 1, 1, 1, 1,
-1.296942, 0.990508, -1.635412, 1, 1, 1, 1, 1,
-1.288467, 0.4636033, -0.7384118, 1, 1, 1, 1, 1,
-1.287479, 0.7802083, -0.2699505, 1, 1, 1, 1, 1,
-1.286092, -3.223298, -1.55887, 1, 1, 1, 1, 1,
-1.27356, -0.1641838, -2.614373, 1, 1, 1, 1, 1,
-1.271584, -1.325197, -0.297898, 1, 1, 1, 1, 1,
-1.270509, -1.190514, -3.332347, 1, 1, 1, 1, 1,
-1.269828, 0.05233002, -1.464323, 1, 1, 1, 1, 1,
-1.268865, -1.616621, -3.627161, 1, 1, 1, 1, 1,
-1.241418, -1.539179, -2.224326, 1, 1, 1, 1, 1,
-1.239443, -1.503645, -3.492873, 1, 1, 1, 1, 1,
-1.238902, 0.5996405, -0.02529271, 0, 0, 1, 1, 1,
-1.237627, -0.3254372, -1.577145, 1, 0, 0, 1, 1,
-1.227878, 0.6057515, -0.643811, 1, 0, 0, 1, 1,
-1.226955, 1.498887, 0.4087201, 1, 0, 0, 1, 1,
-1.22422, 0.5511342, -0.5187657, 1, 0, 0, 1, 1,
-1.222713, -1.70749, -2.874398, 1, 0, 0, 1, 1,
-1.207549, -1.423307, -1.22693, 0, 0, 0, 1, 1,
-1.200859, 1.323381, -0.5066548, 0, 0, 0, 1, 1,
-1.196149, -1.266713, -2.035928, 0, 0, 0, 1, 1,
-1.1926, -1.659518, -0.8443339, 0, 0, 0, 1, 1,
-1.191679, -0.1791365, -1.761916, 0, 0, 0, 1, 1,
-1.189781, 1.179751, -1.439442, 0, 0, 0, 1, 1,
-1.181492, 0.2151116, -1.051587, 0, 0, 0, 1, 1,
-1.1812, -0.6224721, -3.235265, 1, 1, 1, 1, 1,
-1.178525, 1.157863, -0.1175221, 1, 1, 1, 1, 1,
-1.178238, -1.49347, -0.1179271, 1, 1, 1, 1, 1,
-1.173174, -1.169872, -1.798837, 1, 1, 1, 1, 1,
-1.165506, -0.8082931, -3.319818, 1, 1, 1, 1, 1,
-1.156801, -0.7474064, -2.379639, 1, 1, 1, 1, 1,
-1.154502, 1.407972, -1.34637, 1, 1, 1, 1, 1,
-1.152986, -1.072268, -2.313938, 1, 1, 1, 1, 1,
-1.15195, 2.762539, -0.2969424, 1, 1, 1, 1, 1,
-1.144184, 0.7911393, -0.5223219, 1, 1, 1, 1, 1,
-1.143378, 0.330074, -1.841216, 1, 1, 1, 1, 1,
-1.139516, 0.3641703, -2.391416, 1, 1, 1, 1, 1,
-1.138319, -0.03767193, -0.9263976, 1, 1, 1, 1, 1,
-1.137513, -0.1788748, -3.538684, 1, 1, 1, 1, 1,
-1.127376, -2.882571, -2.102116, 1, 1, 1, 1, 1,
-1.124581, -1.109667, -3.590267, 0, 0, 1, 1, 1,
-1.117154, -2.42497, -1.618007, 1, 0, 0, 1, 1,
-1.116983, -1.348458, -2.032164, 1, 0, 0, 1, 1,
-1.114364, -0.1546773, -1.678928, 1, 0, 0, 1, 1,
-1.104784, 1.525112, -0.413208, 1, 0, 0, 1, 1,
-1.099988, -3.116677, -4.276356, 1, 0, 0, 1, 1,
-1.095784, 0.854566, 0.3703994, 0, 0, 0, 1, 1,
-1.090025, -1.740512, -2.690989, 0, 0, 0, 1, 1,
-1.089896, -0.9768216, -0.7419827, 0, 0, 0, 1, 1,
-1.083541, 0.6865783, 0.412816, 0, 0, 0, 1, 1,
-1.074463, 0.5781773, -1.441238, 0, 0, 0, 1, 1,
-1.063055, 0.4541633, -0.679704, 0, 0, 0, 1, 1,
-1.060769, -0.8245454, -3.50132, 0, 0, 0, 1, 1,
-1.060349, 0.06736749, -1.537652, 1, 1, 1, 1, 1,
-1.058388, -0.127986, -2.303263, 1, 1, 1, 1, 1,
-1.057215, -1.102277, -1.152382, 1, 1, 1, 1, 1,
-1.056106, 0.6348637, -1.908481, 1, 1, 1, 1, 1,
-1.052939, -1.1673, -1.144868, 1, 1, 1, 1, 1,
-1.05044, 0.892279, -0.9705264, 1, 1, 1, 1, 1,
-1.049332, 0.5977773, -0.9258214, 1, 1, 1, 1, 1,
-1.044566, -1.465525, -2.853735, 1, 1, 1, 1, 1,
-1.039962, 0.8206071, -0.5988347, 1, 1, 1, 1, 1,
-1.038593, -0.08283046, -1.991618, 1, 1, 1, 1, 1,
-1.036404, -0.5236578, -1.59156, 1, 1, 1, 1, 1,
-1.030566, 0.1047727, -1.630166, 1, 1, 1, 1, 1,
-1.025224, 0.5678197, -1.528823, 1, 1, 1, 1, 1,
-1.017166, -0.3490233, 0.5072715, 1, 1, 1, 1, 1,
-1.013955, 0.1491646, -2.163836, 1, 1, 1, 1, 1,
-1.005436, -0.1335349, -1.498866, 0, 0, 1, 1, 1,
-1.003974, 0.7736588, -0.1527104, 1, 0, 0, 1, 1,
-0.998248, -0.7048622, -0.6728151, 1, 0, 0, 1, 1,
-0.9931871, 1.292735, -0.2912548, 1, 0, 0, 1, 1,
-0.9883039, 0.9798191, 0.8925795, 1, 0, 0, 1, 1,
-0.9866219, 1.584357, 0.8560668, 1, 0, 0, 1, 1,
-0.9854116, -0.5456709, -3.237961, 0, 0, 0, 1, 1,
-0.975695, 0.5837976, -0.9438646, 0, 0, 0, 1, 1,
-0.9751327, -0.4189034, -2.141132, 0, 0, 0, 1, 1,
-0.9685839, -1.277998, -4.594172, 0, 0, 0, 1, 1,
-0.9684599, -0.09282177, -2.826708, 0, 0, 0, 1, 1,
-0.9672583, 0.6238025, -2.951063, 0, 0, 0, 1, 1,
-0.9583197, 0.7532284, -1.352504, 0, 0, 0, 1, 1,
-0.9568049, 0.2352574, -1.564047, 1, 1, 1, 1, 1,
-0.9515248, 0.3087813, -0.8608453, 1, 1, 1, 1, 1,
-0.9503855, 0.2826941, -1.590944, 1, 1, 1, 1, 1,
-0.9464647, -1.705296, -3.190298, 1, 1, 1, 1, 1,
-0.9428003, 0.08291552, -1.514863, 1, 1, 1, 1, 1,
-0.9413953, 1.169022, -1.644047, 1, 1, 1, 1, 1,
-0.9392059, 0.2915947, -2.106438, 1, 1, 1, 1, 1,
-0.9364924, -1.998172, -3.095879, 1, 1, 1, 1, 1,
-0.9302278, 1.179667, -0.6408704, 1, 1, 1, 1, 1,
-0.9294431, 0.3296854, -1.236491, 1, 1, 1, 1, 1,
-0.9267348, 0.2384721, -2.817566, 1, 1, 1, 1, 1,
-0.9198877, -2.050121, -2.739667, 1, 1, 1, 1, 1,
-0.9182605, 0.1151777, -1.529242, 1, 1, 1, 1, 1,
-0.9173781, 0.9711049, -0.9641072, 1, 1, 1, 1, 1,
-0.9141287, -0.04126307, -2.688323, 1, 1, 1, 1, 1,
-0.9134376, -0.04353093, -2.054293, 0, 0, 1, 1, 1,
-0.9103208, -0.6855056, -2.002059, 1, 0, 0, 1, 1,
-0.909869, -0.2739672, -1.354627, 1, 0, 0, 1, 1,
-0.9098468, 0.7119181, -0.5682528, 1, 0, 0, 1, 1,
-0.9034531, -1.611684, -4.769371, 1, 0, 0, 1, 1,
-0.9021993, -0.1826385, 0.111322, 1, 0, 0, 1, 1,
-0.897401, -0.4981215, -0.8598473, 0, 0, 0, 1, 1,
-0.8938632, 0.3207717, -0.9873151, 0, 0, 0, 1, 1,
-0.888302, 1.696857, -1.343049, 0, 0, 0, 1, 1,
-0.8859693, 0.3437074, -0.4012289, 0, 0, 0, 1, 1,
-0.8851895, 2.85146, 0.9995391, 0, 0, 0, 1, 1,
-0.8779892, 1.851393, -0.4539288, 0, 0, 0, 1, 1,
-0.8713567, 0.3624812, -2.097165, 0, 0, 0, 1, 1,
-0.8705585, 1.214835, -0.09147325, 1, 1, 1, 1, 1,
-0.8670207, -0.9825706, -1.847041, 1, 1, 1, 1, 1,
-0.8661553, 1.207728, 0.9654054, 1, 1, 1, 1, 1,
-0.8640054, -0.5638093, -3.46596, 1, 1, 1, 1, 1,
-0.8572967, 2.163225, -1.425952, 1, 1, 1, 1, 1,
-0.8537256, -0.2635452, -1.559831, 1, 1, 1, 1, 1,
-0.8530671, 0.9564887, -0.892315, 1, 1, 1, 1, 1,
-0.8424153, 1.896577, 1.452312, 1, 1, 1, 1, 1,
-0.8325855, 0.1935663, -3.211821, 1, 1, 1, 1, 1,
-0.8314416, 0.9125873, 0.07871108, 1, 1, 1, 1, 1,
-0.8231225, -0.1000928, -3.724331, 1, 1, 1, 1, 1,
-0.8224171, 2.135993, -1.809891, 1, 1, 1, 1, 1,
-0.816884, 0.6214888, -0.4531967, 1, 1, 1, 1, 1,
-0.813717, -2.248143, -2.729286, 1, 1, 1, 1, 1,
-0.8080416, 1.967309, 0.7493683, 1, 1, 1, 1, 1,
-0.8063226, -0.1779814, -1.986225, 0, 0, 1, 1, 1,
-0.7956657, -1.210184, -2.850665, 1, 0, 0, 1, 1,
-0.7947706, -0.3266976, -1.122665, 1, 0, 0, 1, 1,
-0.7919071, 2.218762, 0.8885343, 1, 0, 0, 1, 1,
-0.7893649, 2.05445, 0.7403949, 1, 0, 0, 1, 1,
-0.7869452, 0.0613585, -0.8785696, 1, 0, 0, 1, 1,
-0.7808779, -1.873254, -3.592385, 0, 0, 0, 1, 1,
-0.773622, -0.9761077, -0.905539, 0, 0, 0, 1, 1,
-0.7621603, 1.246049, -0.1636754, 0, 0, 0, 1, 1,
-0.7609288, 0.2701449, -1.722181, 0, 0, 0, 1, 1,
-0.7596583, -1.915534, -2.506045, 0, 0, 0, 1, 1,
-0.75929, 0.8199128, -2.044875, 0, 0, 0, 1, 1,
-0.7571876, -0.3535907, -1.396857, 0, 0, 0, 1, 1,
-0.7562544, 0.4274635, -0.5707091, 1, 1, 1, 1, 1,
-0.7524815, -1.015797, -2.8472, 1, 1, 1, 1, 1,
-0.7435542, 0.9602604, -0.178309, 1, 1, 1, 1, 1,
-0.7416784, -2.467298, -1.565303, 1, 1, 1, 1, 1,
-0.7354923, -0.878598, -3.9127, 1, 1, 1, 1, 1,
-0.7231648, -1.67354, -2.639193, 1, 1, 1, 1, 1,
-0.7150571, -0.02563297, -0.997066, 1, 1, 1, 1, 1,
-0.710166, 0.1668653, -1.347419, 1, 1, 1, 1, 1,
-0.7001308, 1.377113, -2.620639, 1, 1, 1, 1, 1,
-0.7000433, -1.638044, -3.52218, 1, 1, 1, 1, 1,
-0.6937456, 0.5665925, -1.4978, 1, 1, 1, 1, 1,
-0.6899157, 0.9827693, -1.168407, 1, 1, 1, 1, 1,
-0.6844593, 0.1972806, -1.99988, 1, 1, 1, 1, 1,
-0.6833302, 0.8711396, 0.4966328, 1, 1, 1, 1, 1,
-0.6812639, 1.685292, 2.910196, 1, 1, 1, 1, 1,
-0.6764687, 1.30823, -0.8962491, 0, 0, 1, 1, 1,
-0.6755031, 0.7065976, -2.309527, 1, 0, 0, 1, 1,
-0.673978, -0.2383461, -4.23424, 1, 0, 0, 1, 1,
-0.6736377, -0.09927734, -1.507119, 1, 0, 0, 1, 1,
-0.6648641, 0.1079865, -1.8391, 1, 0, 0, 1, 1,
-0.6648283, -0.5458085, -0.3944468, 1, 0, 0, 1, 1,
-0.6608127, 0.1446697, -2.036162, 0, 0, 0, 1, 1,
-0.6543047, 0.147974, -1.741333, 0, 0, 0, 1, 1,
-0.6537168, -1.626531, -2.930146, 0, 0, 0, 1, 1,
-0.6528936, -1.214188, -2.684449, 0, 0, 0, 1, 1,
-0.6526754, -0.4994149, -2.543504, 0, 0, 0, 1, 1,
-0.6519548, 0.2416724, -2.05404, 0, 0, 0, 1, 1,
-0.6457807, -0.5945497, -2.972476, 0, 0, 0, 1, 1,
-0.6428505, 0.5272383, -1.463251, 1, 1, 1, 1, 1,
-0.6398479, -0.3131991, -1.695123, 1, 1, 1, 1, 1,
-0.6343628, -1.05795, -2.36291, 1, 1, 1, 1, 1,
-0.6309239, 0.1288518, -2.147592, 1, 1, 1, 1, 1,
-0.6257372, -1.198018, -1.86269, 1, 1, 1, 1, 1,
-0.6231056, 1.104674, -1.08844, 1, 1, 1, 1, 1,
-0.5989491, 1.03391, -0.7086879, 1, 1, 1, 1, 1,
-0.5964648, 1.960976, -0.5330113, 1, 1, 1, 1, 1,
-0.5839148, 1.405631, -0.08861385, 1, 1, 1, 1, 1,
-0.5823973, -0.1865478, -1.243644, 1, 1, 1, 1, 1,
-0.579178, 0.1164755, -0.454107, 1, 1, 1, 1, 1,
-0.5756205, 0.8526827, -2.779229, 1, 1, 1, 1, 1,
-0.5709131, 0.8020927, -2.042376, 1, 1, 1, 1, 1,
-0.5676892, 0.5348086, -0.8233263, 1, 1, 1, 1, 1,
-0.5672364, 0.4232823, 0.0443154, 1, 1, 1, 1, 1,
-0.5632899, 0.8510661, -0.7137578, 0, 0, 1, 1, 1,
-0.5622366, 0.2472622, -1.203025, 1, 0, 0, 1, 1,
-0.5569843, -0.2259866, -0.9349496, 1, 0, 0, 1, 1,
-0.5561087, 1.041778, -1.150462, 1, 0, 0, 1, 1,
-0.5553807, 1.042739, 0.0698819, 1, 0, 0, 1, 1,
-0.5548745, 0.4496597, -0.5214825, 1, 0, 0, 1, 1,
-0.5499517, 2.790171, -1.163976, 0, 0, 0, 1, 1,
-0.5458416, 0.1356112, -1.651935, 0, 0, 0, 1, 1,
-0.5442681, 1.290448, -2.254007, 0, 0, 0, 1, 1,
-0.5434971, -0.0786037, -1.32547, 0, 0, 0, 1, 1,
-0.5416062, -1.40099, -0.7197953, 0, 0, 0, 1, 1,
-0.5398131, 1.99491, 0.04082184, 0, 0, 0, 1, 1,
-0.5375643, 0.6844165, -0.1270617, 0, 0, 0, 1, 1,
-0.5280954, -0.2304042, -1.351238, 1, 1, 1, 1, 1,
-0.5241362, 0.004634396, -2.338258, 1, 1, 1, 1, 1,
-0.5224385, -0.6159454, -3.319574, 1, 1, 1, 1, 1,
-0.5210305, 0.9462129, 0.7622581, 1, 1, 1, 1, 1,
-0.5181436, -0.9096423, -2.951867, 1, 1, 1, 1, 1,
-0.517565, 0.8365501, 1.053108, 1, 1, 1, 1, 1,
-0.5174019, 0.344743, -1.721644, 1, 1, 1, 1, 1,
-0.5173212, 0.3255333, -0.9034261, 1, 1, 1, 1, 1,
-0.5123466, -0.6640152, -1.375326, 1, 1, 1, 1, 1,
-0.5093191, 1.064553, -0.9357753, 1, 1, 1, 1, 1,
-0.5062883, 0.7817361, -2.582116, 1, 1, 1, 1, 1,
-0.5052875, 2.720464, 0.4969777, 1, 1, 1, 1, 1,
-0.5031711, -0.2482609, -1.949367, 1, 1, 1, 1, 1,
-0.5008963, -2.026009, -2.736095, 1, 1, 1, 1, 1,
-0.4956127, 1.267511, -1.454984, 1, 1, 1, 1, 1,
-0.4919328, -0.2069352, -2.263184, 0, 0, 1, 1, 1,
-0.4918571, -0.9289311, -3.717129, 1, 0, 0, 1, 1,
-0.4881818, 0.3553285, -1.78908, 1, 0, 0, 1, 1,
-0.487829, -0.2192471, -3.682228, 1, 0, 0, 1, 1,
-0.4836608, -0.9215153, -2.593153, 1, 0, 0, 1, 1,
-0.4823801, -1.650172, -3.149247, 1, 0, 0, 1, 1,
-0.4783186, -1.261576, -2.212677, 0, 0, 0, 1, 1,
-0.4719622, -1.116208, -3.855323, 0, 0, 0, 1, 1,
-0.4655043, 0.6569787, -1.297338, 0, 0, 0, 1, 1,
-0.4632365, 0.8878055, -1.674902, 0, 0, 0, 1, 1,
-0.4630822, 0.03528504, -1.929884, 0, 0, 0, 1, 1,
-0.4623144, -0.08761336, -0.8858146, 0, 0, 0, 1, 1,
-0.4601851, -0.1809269, -0.7026608, 0, 0, 0, 1, 1,
-0.4525018, -0.8035814, -2.268696, 1, 1, 1, 1, 1,
-0.4504256, 1.693502, -0.8422669, 1, 1, 1, 1, 1,
-0.4496181, 0.9078594, -0.02997963, 1, 1, 1, 1, 1,
-0.4491575, 2.042714, 0.4027865, 1, 1, 1, 1, 1,
-0.4473593, 0.2423106, -0.9572664, 1, 1, 1, 1, 1,
-0.4455874, -0.9799868, -3.005372, 1, 1, 1, 1, 1,
-0.442748, 1.321944, 0.1545503, 1, 1, 1, 1, 1,
-0.4383299, -1.388664, -4.628535, 1, 1, 1, 1, 1,
-0.4316972, -1.840927, -3.332602, 1, 1, 1, 1, 1,
-0.4290616, -0.1202216, -0.5162063, 1, 1, 1, 1, 1,
-0.4282138, -0.3187895, -2.448107, 1, 1, 1, 1, 1,
-0.4262623, 1.325863, -0.5557173, 1, 1, 1, 1, 1,
-0.4246355, 1.129305, -0.6277111, 1, 1, 1, 1, 1,
-0.423145, -0.2015678, -2.291023, 1, 1, 1, 1, 1,
-0.4212308, 0.1802214, -1.221247, 1, 1, 1, 1, 1,
-0.4210428, -0.7075353, -1.373645, 0, 0, 1, 1, 1,
-0.4162506, 2.651155, -1.642981, 1, 0, 0, 1, 1,
-0.4151556, 0.3464788, -0.9001947, 1, 0, 0, 1, 1,
-0.4123002, 0.5686385, 1.265539, 1, 0, 0, 1, 1,
-0.4116102, -0.35505, -1.748996, 1, 0, 0, 1, 1,
-0.4106707, -0.3225628, -2.414173, 1, 0, 0, 1, 1,
-0.4034921, 0.6104678, -0.207625, 0, 0, 0, 1, 1,
-0.4003581, 1.052601, -1.22215, 0, 0, 0, 1, 1,
-0.3986273, 0.9964636, -0.8087904, 0, 0, 0, 1, 1,
-0.3920848, 0.2128728, -1.673298, 0, 0, 0, 1, 1,
-0.3916305, 0.6543372, -2.037539, 0, 0, 0, 1, 1,
-0.3913085, -0.5647933, -2.01609, 0, 0, 0, 1, 1,
-0.3896613, 0.4891951, -1.26961, 0, 0, 0, 1, 1,
-0.3888542, 0.3404636, -1.324666, 1, 1, 1, 1, 1,
-0.3866141, 0.8296399, -1.890857, 1, 1, 1, 1, 1,
-0.3865221, 0.4177743, 0.5948012, 1, 1, 1, 1, 1,
-0.3810202, -0.5001972, -0.5567778, 1, 1, 1, 1, 1,
-0.3800744, 0.1389053, 0.6759904, 1, 1, 1, 1, 1,
-0.3799409, -0.6215883, -4.121352, 1, 1, 1, 1, 1,
-0.3795289, 0.7505732, -0.1346722, 1, 1, 1, 1, 1,
-0.3772546, -1.297877, -2.737366, 1, 1, 1, 1, 1,
-0.3687496, -0.6984009, -2.664103, 1, 1, 1, 1, 1,
-0.3682534, -0.8578617, -2.360629, 1, 1, 1, 1, 1,
-0.3680234, -0.03058557, -2.37523, 1, 1, 1, 1, 1,
-0.3676725, -0.05702991, -0.8128675, 1, 1, 1, 1, 1,
-0.3636993, 0.7321876, -0.1726023, 1, 1, 1, 1, 1,
-0.3627426, -2.587055, -3.831341, 1, 1, 1, 1, 1,
-0.3576017, 1.543702, -0.6530304, 1, 1, 1, 1, 1,
-0.3543957, -0.6863229, -2.042353, 0, 0, 1, 1, 1,
-0.3541466, 0.4421133, -0.8247023, 1, 0, 0, 1, 1,
-0.3527479, 1.004405, 0.5128595, 1, 0, 0, 1, 1,
-0.351988, 0.1527238, -2.135103, 1, 0, 0, 1, 1,
-0.3432624, 0.559485, -1.332251, 1, 0, 0, 1, 1,
-0.3397419, 1.347456, 0.7311801, 1, 0, 0, 1, 1,
-0.3357501, 0.6689962, -0.5693402, 0, 0, 0, 1, 1,
-0.3340461, -2.283726, -3.654279, 0, 0, 0, 1, 1,
-0.3285374, -0.4627264, -4.285033, 0, 0, 0, 1, 1,
-0.3251184, 0.05823224, -0.5267748, 0, 0, 0, 1, 1,
-0.3151761, -0.7051629, -3.276763, 0, 0, 0, 1, 1,
-0.3045164, 1.170398, -0.329618, 0, 0, 0, 1, 1,
-0.3044369, -0.8804652, -3.319812, 0, 0, 0, 1, 1,
-0.3039921, 0.2348483, -1.747378, 1, 1, 1, 1, 1,
-0.3012059, -0.6797011, -2.274096, 1, 1, 1, 1, 1,
-0.2964481, -0.7849182, -2.086179, 1, 1, 1, 1, 1,
-0.2935973, -0.3261129, -2.293797, 1, 1, 1, 1, 1,
-0.2917115, -0.7474681, -4.409256, 1, 1, 1, 1, 1,
-0.2873284, -0.2851759, -2.026016, 1, 1, 1, 1, 1,
-0.2732513, -0.5369043, -3.49359, 1, 1, 1, 1, 1,
-0.2711072, 0.4823206, 1.233214, 1, 1, 1, 1, 1,
-0.2704237, 0.8199269, -1.594533, 1, 1, 1, 1, 1,
-0.2692608, -0.3266762, -3.319249, 1, 1, 1, 1, 1,
-0.262939, 1.334658, -1.283677, 1, 1, 1, 1, 1,
-0.2562492, -1.584252, -2.418131, 1, 1, 1, 1, 1,
-0.2551717, -1.578164, -3.796885, 1, 1, 1, 1, 1,
-0.2549805, 1.451607, 1.318909, 1, 1, 1, 1, 1,
-0.2545036, -2.050653, -5.304127, 1, 1, 1, 1, 1,
-0.2532011, -0.2571978, -1.843767, 0, 0, 1, 1, 1,
-0.2488487, -2.135268, -3.721758, 1, 0, 0, 1, 1,
-0.2488313, 0.1699199, -1.270406, 1, 0, 0, 1, 1,
-0.248065, 0.4683733, 0.3882586, 1, 0, 0, 1, 1,
-0.2457478, -0.149, -3.911299, 1, 0, 0, 1, 1,
-0.2426099, 0.1035087, -0.8344196, 1, 0, 0, 1, 1,
-0.2402299, -0.3137186, -2.776819, 0, 0, 0, 1, 1,
-0.2390177, -0.09103923, -1.581978, 0, 0, 0, 1, 1,
-0.2383263, 0.2565028, -0.5327237, 0, 0, 0, 1, 1,
-0.2380632, 0.3056876, -0.7748395, 0, 0, 0, 1, 1,
-0.236103, -0.1309266, -1.901767, 0, 0, 0, 1, 1,
-0.2348579, 0.8728912, -0.02577345, 0, 0, 0, 1, 1,
-0.2318614, -1.610446, -3.333348, 0, 0, 0, 1, 1,
-0.231399, -0.06170578, -1.578776, 1, 1, 1, 1, 1,
-0.2286828, -0.01279663, -4.061193, 1, 1, 1, 1, 1,
-0.2286784, 0.3978503, -2.407626, 1, 1, 1, 1, 1,
-0.2269975, 2.218384, -0.2280338, 1, 1, 1, 1, 1,
-0.2182185, 0.03198011, -1.779151, 1, 1, 1, 1, 1,
-0.2164645, -1.396373, -3.152332, 1, 1, 1, 1, 1,
-0.2157633, 0.04964057, -1.808339, 1, 1, 1, 1, 1,
-0.213913, 1.577561, -0.775479, 1, 1, 1, 1, 1,
-0.2105347, -0.2849103, -1.725484, 1, 1, 1, 1, 1,
-0.2098145, -1.620585, -2.545512, 1, 1, 1, 1, 1,
-0.2084969, 0.4335641, -1.181094, 1, 1, 1, 1, 1,
-0.2054596, -0.06246405, -2.115339, 1, 1, 1, 1, 1,
-0.202694, -1.383404, -2.413775, 1, 1, 1, 1, 1,
-0.2020291, 0.2833473, 0.03500685, 1, 1, 1, 1, 1,
-0.2011375, 0.1988874, -0.9338835, 1, 1, 1, 1, 1,
-0.2006847, -0.372765, -4.064775, 0, 0, 1, 1, 1,
-0.1975346, -0.8381696, -2.811302, 1, 0, 0, 1, 1,
-0.1970678, 1.283862, 0.7006139, 1, 0, 0, 1, 1,
-0.1870516, -0.7316713, -1.122514, 1, 0, 0, 1, 1,
-0.1860812, 1.018885, 0.3954272, 1, 0, 0, 1, 1,
-0.1844229, 0.2732755, -2.146618, 1, 0, 0, 1, 1,
-0.1824372, 0.2114491, 0.8616814, 0, 0, 0, 1, 1,
-0.1798001, 1.24409, 1.532923, 0, 0, 0, 1, 1,
-0.1797086, -0.4874499, -3.267326, 0, 0, 0, 1, 1,
-0.1785474, 0.08505741, -1.135856, 0, 0, 0, 1, 1,
-0.1764805, 0.4845037, 1.032019, 0, 0, 0, 1, 1,
-0.1757599, -1.6307, -3.577716, 0, 0, 0, 1, 1,
-0.1752925, -0.4046208, -2.292883, 0, 0, 0, 1, 1,
-0.1751716, 0.3070045, 1.462928, 1, 1, 1, 1, 1,
-0.1740698, -0.8762852, -4.12045, 1, 1, 1, 1, 1,
-0.1716953, 2.044935, 2.313299, 1, 1, 1, 1, 1,
-0.1716464, 0.8284227, 0.2243699, 1, 1, 1, 1, 1,
-0.1692061, -0.5894167, -4.112304, 1, 1, 1, 1, 1,
-0.1690842, 0.4842192, -0.4979109, 1, 1, 1, 1, 1,
-0.167408, -0.5663053, -3.96984, 1, 1, 1, 1, 1,
-0.1590052, -1.410445, -1.512261, 1, 1, 1, 1, 1,
-0.1557422, -0.3303262, -1.328224, 1, 1, 1, 1, 1,
-0.1533027, 0.4104433, -0.8621864, 1, 1, 1, 1, 1,
-0.1513614, 0.4812977, -1.701841, 1, 1, 1, 1, 1,
-0.1510742, 1.576314, -1.045195, 1, 1, 1, 1, 1,
-0.1483301, -0.8506396, -3.186182, 1, 1, 1, 1, 1,
-0.1478775, 0.6174804, 0.7052532, 1, 1, 1, 1, 1,
-0.1478127, 1.919392, 1.073172, 1, 1, 1, 1, 1,
-0.1477048, 0.6041905, 0.9334707, 0, 0, 1, 1, 1,
-0.146161, -1.181564, -2.706725, 1, 0, 0, 1, 1,
-0.1427888, 0.4816408, -0.03771991, 1, 0, 0, 1, 1,
-0.1420147, -0.3709317, -3.769113, 1, 0, 0, 1, 1,
-0.1332421, 1.148701, -0.1491495, 1, 0, 0, 1, 1,
-0.1247928, 0.3176946, 0.210964, 1, 0, 0, 1, 1,
-0.1244684, 0.7740746, -0.3461092, 0, 0, 0, 1, 1,
-0.1179428, 0.1923157, -1.92821, 0, 0, 0, 1, 1,
-0.1178977, -0.6679949, -2.162869, 0, 0, 0, 1, 1,
-0.1176474, -0.4793851, -0.6330764, 0, 0, 0, 1, 1,
-0.1165224, -0.1625282, -2.894491, 0, 0, 0, 1, 1,
-0.1137533, -0.2428042, -1.946429, 0, 0, 0, 1, 1,
-0.1119483, -0.5797089, -3.559772, 0, 0, 0, 1, 1,
-0.1099642, -0.4611498, -3.593098, 1, 1, 1, 1, 1,
-0.1096596, 0.9725624, 1.393371, 1, 1, 1, 1, 1,
-0.1094668, 1.01276, -2.055578, 1, 1, 1, 1, 1,
-0.106861, -0.05824887, -1.286251, 1, 1, 1, 1, 1,
-0.1020616, -0.2508084, -2.039346, 1, 1, 1, 1, 1,
-0.09078021, -0.2144962, -2.166734, 1, 1, 1, 1, 1,
-0.09077697, 0.0873335, -1.250804, 1, 1, 1, 1, 1,
-0.08653785, -0.7320052, -3.00474, 1, 1, 1, 1, 1,
-0.0796263, 0.412033, -1.51406, 1, 1, 1, 1, 1,
-0.07814308, 0.1926114, 1.34501, 1, 1, 1, 1, 1,
-0.07482161, 0.6768913, 0.195425, 1, 1, 1, 1, 1,
-0.07371523, -0.2888694, -2.917882, 1, 1, 1, 1, 1,
-0.07363628, 0.1183064, -2.972304, 1, 1, 1, 1, 1,
-0.07278752, 0.97925, -1.376474, 1, 1, 1, 1, 1,
-0.0722554, 0.6091096, -1.434944, 1, 1, 1, 1, 1,
-0.07208115, -0.1836082, -3.475313, 0, 0, 1, 1, 1,
-0.07127579, 0.01901147, -1.987273, 1, 0, 0, 1, 1,
-0.07035799, 1.459121, 0.4775282, 1, 0, 0, 1, 1,
-0.07020003, 2.372165, 0.8491318, 1, 0, 0, 1, 1,
-0.06818565, -2.213751, -2.775891, 1, 0, 0, 1, 1,
-0.06670453, -1.287188, -3.23834, 1, 0, 0, 1, 1,
-0.06554666, 0.2293375, -1.071007, 0, 0, 0, 1, 1,
-0.06248339, -0.3451394, -3.333549, 0, 0, 0, 1, 1,
-0.05745022, 0.555331, -1.252514, 0, 0, 0, 1, 1,
-0.05361439, 1.221025, -0.3049892, 0, 0, 0, 1, 1,
-0.04519888, -0.9112701, -3.529815, 0, 0, 0, 1, 1,
-0.03516145, -2.027204, -3.17961, 0, 0, 0, 1, 1,
-0.03231452, -1.053816, -3.367268, 0, 0, 0, 1, 1,
-0.03026212, -1.226881, -3.40319, 1, 1, 1, 1, 1,
-0.02848353, 0.1040951, -1.914373, 1, 1, 1, 1, 1,
-0.0202496, -0.9836608, -1.659856, 1, 1, 1, 1, 1,
-0.0187415, -0.1517815, -2.464435, 1, 1, 1, 1, 1,
-0.01728267, 0.09308019, 1.418128, 1, 1, 1, 1, 1,
-0.01089231, -0.7258628, -2.878675, 1, 1, 1, 1, 1,
-0.00874918, -0.6077081, -2.744878, 1, 1, 1, 1, 1,
-0.004481563, -0.1779269, -4.531919, 1, 1, 1, 1, 1,
-0.002033322, -0.8533562, -4.728827, 1, 1, 1, 1, 1,
-0.001300194, -1.192378, -2.350213, 1, 1, 1, 1, 1,
-0.001154884, -0.2512037, -2.446079, 1, 1, 1, 1, 1,
-0.001063886, -0.1436515, -2.902699, 1, 1, 1, 1, 1,
-0.0009825674, 0.1503262, -0.2891603, 1, 1, 1, 1, 1,
-0.0007980606, -1.69544, -2.822821, 1, 1, 1, 1, 1,
-0.0001096284, -0.7565068, -3.020024, 1, 1, 1, 1, 1,
0.005429457, -2.143648, 3.771956, 0, 0, 1, 1, 1,
0.01192598, 0.7198833, 0.08740082, 1, 0, 0, 1, 1,
0.01407473, 0.712365, -0.8796998, 1, 0, 0, 1, 1,
0.02148135, 0.2779187, -0.2984279, 1, 0, 0, 1, 1,
0.02153841, -0.7566267, 3.560116, 1, 0, 0, 1, 1,
0.02371207, 0.9844761, 0.2990405, 1, 0, 0, 1, 1,
0.02486285, 0.5151124, -0.7373646, 0, 0, 0, 1, 1,
0.02548033, 0.949701, 1.79958, 0, 0, 0, 1, 1,
0.03121413, -0.7020702, 2.968574, 0, 0, 0, 1, 1,
0.03312463, -0.9455066, 3.31642, 0, 0, 0, 1, 1,
0.03453269, 0.2000986, 0.8960208, 0, 0, 0, 1, 1,
0.0389297, -0.3293533, 1.878996, 0, 0, 0, 1, 1,
0.03988337, 0.3472443, -0.4260086, 0, 0, 0, 1, 1,
0.04329139, -1.383805, 3.869678, 1, 1, 1, 1, 1,
0.04528697, 1.207651, -0.7852844, 1, 1, 1, 1, 1,
0.04531397, 1.273836, 1.60995, 1, 1, 1, 1, 1,
0.04536164, 1.275667, -0.6401205, 1, 1, 1, 1, 1,
0.05048476, 0.2425666, 0.5800116, 1, 1, 1, 1, 1,
0.05490175, 0.8653374, 1.692474, 1, 1, 1, 1, 1,
0.05638567, -1.028388, 2.772233, 1, 1, 1, 1, 1,
0.05896464, 0.8105472, -0.0997623, 1, 1, 1, 1, 1,
0.06045673, 0.3424409, 1.206618, 1, 1, 1, 1, 1,
0.06062542, -0.5811176, 1.316362, 1, 1, 1, 1, 1,
0.06387641, -1.198467, 3.215982, 1, 1, 1, 1, 1,
0.06571139, 1.619666, -0.6016439, 1, 1, 1, 1, 1,
0.06580974, -1.457975, 1.350702, 1, 1, 1, 1, 1,
0.06788202, -0.3145806, 2.46418, 1, 1, 1, 1, 1,
0.06810329, -1.698453, 3.312956, 1, 1, 1, 1, 1,
0.06942824, -0.06420657, 2.242541, 0, 0, 1, 1, 1,
0.07319272, 0.5585905, 1.222827, 1, 0, 0, 1, 1,
0.07762464, 0.6207145, -0.5365258, 1, 0, 0, 1, 1,
0.07880797, 0.194026, 0.6347912, 1, 0, 0, 1, 1,
0.0830733, 1.341159, 0.4799195, 1, 0, 0, 1, 1,
0.08511883, -1.829267, 2.323304, 1, 0, 0, 1, 1,
0.08581083, -1.446144, 2.496251, 0, 0, 0, 1, 1,
0.08779342, -1.340871, 2.833629, 0, 0, 0, 1, 1,
0.0882743, 0.3177769, 0.4660507, 0, 0, 0, 1, 1,
0.08829046, 0.477797, 0.2107092, 0, 0, 0, 1, 1,
0.09672377, -0.2143702, 3.099373, 0, 0, 0, 1, 1,
0.09897182, -1.186826, 1.945781, 0, 0, 0, 1, 1,
0.10036, 2.311061, 0.6487295, 0, 0, 0, 1, 1,
0.1050862, 0.7228001, 0.1448636, 1, 1, 1, 1, 1,
0.1080533, 1.066888, 1.016681, 1, 1, 1, 1, 1,
0.1084448, 0.2924993, 0.6139671, 1, 1, 1, 1, 1,
0.1109518, 3.146846, -0.01153936, 1, 1, 1, 1, 1,
0.1211376, 0.2203583, 0.7736229, 1, 1, 1, 1, 1,
0.1278324, -1.582511, 3.465639, 1, 1, 1, 1, 1,
0.1279891, 0.2731107, -0.05841963, 1, 1, 1, 1, 1,
0.1299427, -1.381643, 1.385551, 1, 1, 1, 1, 1,
0.1300353, 2.086415, 0.9374896, 1, 1, 1, 1, 1,
0.1315178, 1.191263, 0.4109536, 1, 1, 1, 1, 1,
0.1332859, 0.5363032, 0.4775445, 1, 1, 1, 1, 1,
0.1336955, -1.14642, 3.490873, 1, 1, 1, 1, 1,
0.1374542, 2.066866, 0.9630273, 1, 1, 1, 1, 1,
0.1447921, 0.4513736, 0.6999047, 1, 1, 1, 1, 1,
0.144824, -1.049863, 3.393724, 1, 1, 1, 1, 1,
0.1448537, 1.508267, -0.8831605, 0, 0, 1, 1, 1,
0.1507357, 0.7443306, -0.9874902, 1, 0, 0, 1, 1,
0.1536437, -0.4383014, 4.812711, 1, 0, 0, 1, 1,
0.1556345, 0.9758663, 1.267492, 1, 0, 0, 1, 1,
0.1575089, -0.8658989, 2.224167, 1, 0, 0, 1, 1,
0.157538, -0.03475243, 1.840486, 1, 0, 0, 1, 1,
0.1648246, -2.111976, 5.523122, 0, 0, 0, 1, 1,
0.1663746, 0.9356318, -0.8231816, 0, 0, 0, 1, 1,
0.1727925, 0.1138936, 0.6486666, 0, 0, 0, 1, 1,
0.1768615, 1.684372, 1.131695, 0, 0, 0, 1, 1,
0.1790776, -0.3603146, 1.519602, 0, 0, 0, 1, 1,
0.1804347, 0.8941704, 1.197787, 0, 0, 0, 1, 1,
0.1829695, -1.46347, 2.486794, 0, 0, 0, 1, 1,
0.1893467, -0.3169836, 3.314825, 1, 1, 1, 1, 1,
0.1893837, 0.3248459, -1.540697, 1, 1, 1, 1, 1,
0.1908261, 1.882226, 0.4620109, 1, 1, 1, 1, 1,
0.1932692, 0.244887, 1.100865, 1, 1, 1, 1, 1,
0.1936908, -1.08163, 3.851995, 1, 1, 1, 1, 1,
0.1944719, 1.355784, -0.86753, 1, 1, 1, 1, 1,
0.1969828, -0.004500221, 1.248735, 1, 1, 1, 1, 1,
0.1972153, -1.442298, 3.841084, 1, 1, 1, 1, 1,
0.1977351, -0.8633156, 2.124468, 1, 1, 1, 1, 1,
0.1990964, 0.425559, 0.07730009, 1, 1, 1, 1, 1,
0.1998338, 0.1689625, 1.897924, 1, 1, 1, 1, 1,
0.2093714, 1.321654, -0.07991634, 1, 1, 1, 1, 1,
0.2119684, 1.691556, 1.922007, 1, 1, 1, 1, 1,
0.2134067, -0.2522643, 1.664065, 1, 1, 1, 1, 1,
0.2184103, -0.8951311, 2.802294, 1, 1, 1, 1, 1,
0.2191361, 0.4347931, 1.685021, 0, 0, 1, 1, 1,
0.2293809, 0.1061032, 1.181115, 1, 0, 0, 1, 1,
0.2336456, 0.7229251, -0.2116292, 1, 0, 0, 1, 1,
0.2383036, -0.8262466, 1.792644, 1, 0, 0, 1, 1,
0.2404113, 2.055585, 0.3532332, 1, 0, 0, 1, 1,
0.2425763, -1.72052, 0.747747, 1, 0, 0, 1, 1,
0.2440573, 1.25621, 0.05328726, 0, 0, 0, 1, 1,
0.2482932, 0.1538364, 0.1918976, 0, 0, 0, 1, 1,
0.2506477, 0.1470832, 1.947079, 0, 0, 0, 1, 1,
0.2539471, -0.7421749, 0.1716395, 0, 0, 0, 1, 1,
0.2568752, 1.922552, 0.636332, 0, 0, 0, 1, 1,
0.2570584, -0.8687356, 2.169626, 0, 0, 0, 1, 1,
0.2590387, 0.6795473, -1.308285, 0, 0, 0, 1, 1,
0.264153, -0.6091983, 3.567237, 1, 1, 1, 1, 1,
0.2643112, 2.271665, -0.611246, 1, 1, 1, 1, 1,
0.2664103, -0.193512, 1.691018, 1, 1, 1, 1, 1,
0.2721466, 0.3902372, 0.9150386, 1, 1, 1, 1, 1,
0.2763809, -0.0414206, 1.275491, 1, 1, 1, 1, 1,
0.279925, -1.971218, 3.342653, 1, 1, 1, 1, 1,
0.2810351, 1.593814, 0.7526318, 1, 1, 1, 1, 1,
0.2850603, -1.409643, 2.888119, 1, 1, 1, 1, 1,
0.2898702, -0.1644928, 0.6701987, 1, 1, 1, 1, 1,
0.2932775, 0.6760653, -0.2418267, 1, 1, 1, 1, 1,
0.2938806, 0.5082029, 0.07851022, 1, 1, 1, 1, 1,
0.3036028, 0.2537999, 0.2935025, 1, 1, 1, 1, 1,
0.3048138, 2.043629, 2.62766, 1, 1, 1, 1, 1,
0.3061741, 0.07660659, 3.52512, 1, 1, 1, 1, 1,
0.3140778, -2.314575, 1.684815, 1, 1, 1, 1, 1,
0.3187803, -1.43856, 1.26559, 0, 0, 1, 1, 1,
0.3238866, -0.6027977, 1.855729, 1, 0, 0, 1, 1,
0.3245512, 0.4981867, 1.782074, 1, 0, 0, 1, 1,
0.326484, -0.1581282, 1.670035, 1, 0, 0, 1, 1,
0.3270798, -0.6043632, 4.334872, 1, 0, 0, 1, 1,
0.3288163, -0.9957731, 2.763935, 1, 0, 0, 1, 1,
0.3289623, -0.8832581, 2.422056, 0, 0, 0, 1, 1,
0.3321855, 0.4593081, 2.954685, 0, 0, 0, 1, 1,
0.3328184, 1.65607, 0.6098155, 0, 0, 0, 1, 1,
0.3382745, 0.285794, 1.376856, 0, 0, 0, 1, 1,
0.338648, -0.6411878, 2.892984, 0, 0, 0, 1, 1,
0.3440824, -0.2579516, 1.26647, 0, 0, 0, 1, 1,
0.3449626, 0.2064309, 2.981678, 0, 0, 0, 1, 1,
0.3464499, 1.289763, -0.2152225, 1, 1, 1, 1, 1,
0.3488418, 0.4184897, 1.727072, 1, 1, 1, 1, 1,
0.3529954, 1.310755, 0.1557816, 1, 1, 1, 1, 1,
0.3558762, -0.1057159, 1.705262, 1, 1, 1, 1, 1,
0.3565002, 0.654972, 1.435663, 1, 1, 1, 1, 1,
0.3609913, 1.987415, 0.9525996, 1, 1, 1, 1, 1,
0.3665611, 0.4418659, 1.363971, 1, 1, 1, 1, 1,
0.3668577, 1.370827, -0.04930206, 1, 1, 1, 1, 1,
0.3737672, 0.00883435, 1.122852, 1, 1, 1, 1, 1,
0.3739563, -0.6619703, 3.437076, 1, 1, 1, 1, 1,
0.3761653, 0.9378687, 1.141685, 1, 1, 1, 1, 1,
0.3777621, -0.3710999, 2.38287, 1, 1, 1, 1, 1,
0.3800254, 1.045448, 0.5160155, 1, 1, 1, 1, 1,
0.3842024, -0.8018572, 2.497053, 1, 1, 1, 1, 1,
0.3871475, 0.02527182, 0.3740848, 1, 1, 1, 1, 1,
0.3884155, -1.770563, 4.33531, 0, 0, 1, 1, 1,
0.3931136, -1.09359, 2.946937, 1, 0, 0, 1, 1,
0.3997686, 1.259908, 0.2616225, 1, 0, 0, 1, 1,
0.4015291, 0.8672575, 0.7451447, 1, 0, 0, 1, 1,
0.4050662, 0.6283365, -0.1848853, 1, 0, 0, 1, 1,
0.4057344, 1.613291, -0.514837, 1, 0, 0, 1, 1,
0.4062136, 1.110554, -0.7641532, 0, 0, 0, 1, 1,
0.406878, -0.8786631, 3.059225, 0, 0, 0, 1, 1,
0.407479, -0.1204296, 2.749101, 0, 0, 0, 1, 1,
0.4131677, -0.4438717, 1.493313, 0, 0, 0, 1, 1,
0.4182613, 1.336547, -0.4449342, 0, 0, 0, 1, 1,
0.4204946, -0.5770625, 4.404307, 0, 0, 0, 1, 1,
0.4220552, 0.6611184, 1.117329, 0, 0, 0, 1, 1,
0.4227134, -1.065365, 1.539601, 1, 1, 1, 1, 1,
0.4230398, 0.412237, -0.08381329, 1, 1, 1, 1, 1,
0.4244778, -1.004541, 1.299633, 1, 1, 1, 1, 1,
0.42624, -0.5778551, 3.747302, 1, 1, 1, 1, 1,
0.4282635, 0.1762654, 1.191294, 1, 1, 1, 1, 1,
0.4298005, 1.316597, 0.9074721, 1, 1, 1, 1, 1,
0.4314501, 1.233739, 2.147196, 1, 1, 1, 1, 1,
0.4350259, -0.02411274, 2.166511, 1, 1, 1, 1, 1,
0.4457181, 1.599633, -0.2860382, 1, 1, 1, 1, 1,
0.4470342, -0.7193079, 1.451833, 1, 1, 1, 1, 1,
0.4490767, -1.232111, 3.44615, 1, 1, 1, 1, 1,
0.4583784, -1.56672, 2.358598, 1, 1, 1, 1, 1,
0.4604709, 0.1333228, 1.19759, 1, 1, 1, 1, 1,
0.4612591, 1.081557, 0.6469317, 1, 1, 1, 1, 1,
0.4644418, -0.7342553, 3.573275, 1, 1, 1, 1, 1,
0.4648597, -1.999928, 3.566248, 0, 0, 1, 1, 1,
0.4701308, -1.193724, 1.612195, 1, 0, 0, 1, 1,
0.4728765, 0.5781153, 0.9345858, 1, 0, 0, 1, 1,
0.4740948, -0.2604013, 1.905432, 1, 0, 0, 1, 1,
0.4752764, -0.5014061, 3.35253, 1, 0, 0, 1, 1,
0.4800806, 0.2059804, 1.022083, 1, 0, 0, 1, 1,
0.4805635, -0.8270201, 1.887742, 0, 0, 0, 1, 1,
0.4811778, 0.7125741, 1.879736, 0, 0, 0, 1, 1,
0.4820305, 0.3854196, -0.2888093, 0, 0, 0, 1, 1,
0.4849935, -0.814096, 2.741599, 0, 0, 0, 1, 1,
0.4850961, 1.562099, 2.137743, 0, 0, 0, 1, 1,
0.4871731, 0.2281529, 0.6329851, 0, 0, 0, 1, 1,
0.4908774, -0.5786243, 2.388493, 0, 0, 0, 1, 1,
0.4969555, 0.5847202, 0.6751401, 1, 1, 1, 1, 1,
0.4977715, 0.3764873, 1.729643, 1, 1, 1, 1, 1,
0.5018191, -3.198832, 3.362946, 1, 1, 1, 1, 1,
0.5020433, 0.01072897, 1.648885, 1, 1, 1, 1, 1,
0.5107048, 1.804725, -0.5933995, 1, 1, 1, 1, 1,
0.5107686, 0.8797618, 0.6594837, 1, 1, 1, 1, 1,
0.5181385, 1.221299, 0.5263475, 1, 1, 1, 1, 1,
0.5223638, -0.1840971, 2.347543, 1, 1, 1, 1, 1,
0.5316203, 0.6206165, -0.348802, 1, 1, 1, 1, 1,
0.5346779, -2.354791, 1.82665, 1, 1, 1, 1, 1,
0.5406663, 0.2198462, 0.02714907, 1, 1, 1, 1, 1,
0.5435677, 1.599468, 2.261127, 1, 1, 1, 1, 1,
0.5497965, -1.466266, 3.730003, 1, 1, 1, 1, 1,
0.5511776, -0.1818784, 1.350773, 1, 1, 1, 1, 1,
0.5524689, -1.913113, 3.106558, 1, 1, 1, 1, 1,
0.5539877, -1.091528, 3.693349, 0, 0, 1, 1, 1,
0.5542946, 0.4679112, 2.177517, 1, 0, 0, 1, 1,
0.5553585, -1.055545, 2.476142, 1, 0, 0, 1, 1,
0.5628538, 1.506827, -0.5719475, 1, 0, 0, 1, 1,
0.564069, 0.05873122, 1.820635, 1, 0, 0, 1, 1,
0.566916, -0.581952, 2.093071, 1, 0, 0, 1, 1,
0.56708, -0.2699451, 1.628756, 0, 0, 0, 1, 1,
0.5688964, 0.832258, 2.14465, 0, 0, 0, 1, 1,
0.5730712, 1.125108, -0.4625529, 0, 0, 0, 1, 1,
0.575868, 0.2678543, 0.9132286, 0, 0, 0, 1, 1,
0.5781646, 0.0174447, 2.967341, 0, 0, 0, 1, 1,
0.5805782, 1.170639, -0.1398783, 0, 0, 0, 1, 1,
0.5828478, -1.068928, 1.632215, 0, 0, 0, 1, 1,
0.5848832, -1.477182, 3.117494, 1, 1, 1, 1, 1,
0.5888271, 0.3621066, 0.8059071, 1, 1, 1, 1, 1,
0.5906932, 0.1222253, 1.20729, 1, 1, 1, 1, 1,
0.5961914, -1.050541, 3.387293, 1, 1, 1, 1, 1,
0.5982941, -0.5895235, 3.639912, 1, 1, 1, 1, 1,
0.60146, 1.855297, 1.729993, 1, 1, 1, 1, 1,
0.6026508, -1.246024, 2.928823, 1, 1, 1, 1, 1,
0.6096377, -0.7469945, 4.684135, 1, 1, 1, 1, 1,
0.6123412, 0.6364517, 1.520561, 1, 1, 1, 1, 1,
0.6137907, 0.184459, 1.221499, 1, 1, 1, 1, 1,
0.6168962, -0.3239721, 1.101017, 1, 1, 1, 1, 1,
0.6213449, -2.468427, 2.601826, 1, 1, 1, 1, 1,
0.6243184, 0.2705366, -0.2934158, 1, 1, 1, 1, 1,
0.6243442, 0.2305001, -0.6445143, 1, 1, 1, 1, 1,
0.6295624, 0.7263831, 1.000753, 1, 1, 1, 1, 1,
0.6308746, -0.8815325, 0.04528921, 0, 0, 1, 1, 1,
0.631875, -0.4685762, 0.7374625, 1, 0, 0, 1, 1,
0.6321891, 1.075619, -0.08352433, 1, 0, 0, 1, 1,
0.6343516, -0.8941155, 3.137138, 1, 0, 0, 1, 1,
0.6372362, 0.8933074, 0.7451704, 1, 0, 0, 1, 1,
0.6376622, -1.43462, 2.389521, 1, 0, 0, 1, 1,
0.6420881, -0.2253357, 0.888809, 0, 0, 0, 1, 1,
0.6462707, -1.238028, 3.435238, 0, 0, 0, 1, 1,
0.6470326, 1.857518, -0.8775339, 0, 0, 0, 1, 1,
0.6497743, 0.3503182, 0.4165949, 0, 0, 0, 1, 1,
0.6501982, -0.9374472, 2.726964, 0, 0, 0, 1, 1,
0.6520415, 0.7361384, 0.6980662, 0, 0, 0, 1, 1,
0.6527984, 0.9074033, 0.8188138, 0, 0, 0, 1, 1,
0.6536033, -1.050994, 2.027887, 1, 1, 1, 1, 1,
0.6542143, -0.4862631, 2.672477, 1, 1, 1, 1, 1,
0.657097, -2.01948, 3.30171, 1, 1, 1, 1, 1,
0.6586611, -1.100924, 0.9552627, 1, 1, 1, 1, 1,
0.6627049, -0.1056524, 1.75058, 1, 1, 1, 1, 1,
0.663214, -1.488831, 1.164492, 1, 1, 1, 1, 1,
0.6661775, 1.053473, -0.02234417, 1, 1, 1, 1, 1,
0.6667644, 2.678682, 1.267522, 1, 1, 1, 1, 1,
0.6744519, -0.5429583, 2.404291, 1, 1, 1, 1, 1,
0.675738, -1.667942, 3.057941, 1, 1, 1, 1, 1,
0.6759748, 1.507025, -1.169107, 1, 1, 1, 1, 1,
0.683686, 0.06734382, 1.558689, 1, 1, 1, 1, 1,
0.6887982, 0.3433365, 0.2005466, 1, 1, 1, 1, 1,
0.6897218, -1.066196, 2.727037, 1, 1, 1, 1, 1,
0.699376, 0.05870879, 1.126456, 1, 1, 1, 1, 1,
0.7013622, -0.6356166, 2.604886, 0, 0, 1, 1, 1,
0.7035179, 0.5920646, 0.199474, 1, 0, 0, 1, 1,
0.7050043, 2.670587, 0.09652685, 1, 0, 0, 1, 1,
0.7053619, -1.51075, 2.056422, 1, 0, 0, 1, 1,
0.7063532, 0.400061, 1.245447, 1, 0, 0, 1, 1,
0.7066976, 0.09156326, 1.605257, 1, 0, 0, 1, 1,
0.7108316, 0.0672098, 3.19566, 0, 0, 0, 1, 1,
0.7150598, -0.6366112, 3.669547, 0, 0, 0, 1, 1,
0.7197292, -1.371105, 2.759511, 0, 0, 0, 1, 1,
0.723567, 0.3661344, 0.6013982, 0, 0, 0, 1, 1,
0.7311763, 0.5487843, 0.2062628, 0, 0, 0, 1, 1,
0.737996, 0.07487281, 1.040979, 0, 0, 0, 1, 1,
0.741818, 0.150486, 0.879529, 0, 0, 0, 1, 1,
0.745748, -1.071794, 2.734493, 1, 1, 1, 1, 1,
0.7570629, -0.627264, 2.540813, 1, 1, 1, 1, 1,
0.7587777, -1.557412, 2.409132, 1, 1, 1, 1, 1,
0.7646399, -1.456162, 1.663237, 1, 1, 1, 1, 1,
0.765623, 1.034481, 1.686991, 1, 1, 1, 1, 1,
0.766795, -1.886913, 0.8671398, 1, 1, 1, 1, 1,
0.7669621, -0.9547361, 3.163086, 1, 1, 1, 1, 1,
0.766999, 0.9087696, 1.494129, 1, 1, 1, 1, 1,
0.7685785, 0.7540337, 1.303419, 1, 1, 1, 1, 1,
0.7701494, -1.444624, 2.526788, 1, 1, 1, 1, 1,
0.7743699, -1.035656, 4.740182, 1, 1, 1, 1, 1,
0.7766797, -1.694692, 2.196434, 1, 1, 1, 1, 1,
0.780184, -0.5865034, 3.676645, 1, 1, 1, 1, 1,
0.7838928, -0.2714634, 1.421194, 1, 1, 1, 1, 1,
0.7920757, -0.6432407, 4.026827, 1, 1, 1, 1, 1,
0.7938495, 0.8363685, 1.044543, 0, 0, 1, 1, 1,
0.7980681, 1.922762, -0.3315766, 1, 0, 0, 1, 1,
0.799511, -1.622421, 2.499161, 1, 0, 0, 1, 1,
0.7997951, 1.170918, 0.2504219, 1, 0, 0, 1, 1,
0.8040242, -0.6098223, 2.442135, 1, 0, 0, 1, 1,
0.8101167, -0.1310666, 3.021331, 1, 0, 0, 1, 1,
0.8171902, 0.3676473, 1.610487, 0, 0, 0, 1, 1,
0.8176852, -1.083945, 3.2508, 0, 0, 0, 1, 1,
0.8189817, 1.368964, 2.461092, 0, 0, 0, 1, 1,
0.8226622, -0.7168619, 0.3778132, 0, 0, 0, 1, 1,
0.8242586, 0.3767429, 1.706983, 0, 0, 0, 1, 1,
0.8262438, 0.07162616, 0.2780115, 0, 0, 0, 1, 1,
0.8283256, 0.6635723, 1.095174, 0, 0, 0, 1, 1,
0.8324334, 1.057767, 0.5089618, 1, 1, 1, 1, 1,
0.8333715, -0.5901376, 3.018345, 1, 1, 1, 1, 1,
0.8340232, -0.4067296, 0.7805391, 1, 1, 1, 1, 1,
0.8368535, 1.356579, 0.2750022, 1, 1, 1, 1, 1,
0.8422499, -1.278559, 4.458799, 1, 1, 1, 1, 1,
0.84258, -0.2208063, 1.881842, 1, 1, 1, 1, 1,
0.8436219, -0.2970688, 1.929359, 1, 1, 1, 1, 1,
0.8491616, -0.5156769, 4.095642, 1, 1, 1, 1, 1,
0.8502288, -0.523667, 2.750162, 1, 1, 1, 1, 1,
0.8508198, -0.01816108, 0.9434513, 1, 1, 1, 1, 1,
0.8565247, 1.503423, -0.1530283, 1, 1, 1, 1, 1,
0.8628599, 2.330131, 1.331375, 1, 1, 1, 1, 1,
0.8692631, -0.111175, 2.181516, 1, 1, 1, 1, 1,
0.8727843, 0.9827233, 1.411675, 1, 1, 1, 1, 1,
0.8807399, -1.504351, 3.290848, 1, 1, 1, 1, 1,
0.8854722, -1.114174, 1.398229, 0, 0, 1, 1, 1,
0.8900816, 0.517633, -0.05162584, 1, 0, 0, 1, 1,
0.894717, 0.03599331, 1.956246, 1, 0, 0, 1, 1,
0.9005753, 1.127677, 0.8446081, 1, 0, 0, 1, 1,
0.9078364, -0.4527867, 3.773975, 1, 0, 0, 1, 1,
0.9085176, 0.2903737, 1.249483, 1, 0, 0, 1, 1,
0.9252046, 0.4560486, 0.8439188, 0, 0, 0, 1, 1,
0.9255116, -0.8384096, 2.969144, 0, 0, 0, 1, 1,
0.927865, 0.4353696, 1.686384, 0, 0, 0, 1, 1,
0.9301828, -1.580475, 1.829131, 0, 0, 0, 1, 1,
0.9358392, 1.210828, 0.9355174, 0, 0, 0, 1, 1,
0.9426625, -0.8491894, 1.551282, 0, 0, 0, 1, 1,
0.9436376, -0.8328649, 3.661257, 0, 0, 0, 1, 1,
0.9484743, 0.01466186, 0.8141731, 1, 1, 1, 1, 1,
0.9518683, -0.4022369, 0.08099957, 1, 1, 1, 1, 1,
0.9533941, -0.6976661, 2.75509, 1, 1, 1, 1, 1,
0.9621246, -2.018415, 3.242787, 1, 1, 1, 1, 1,
0.963236, -1.429631, 2.069863, 1, 1, 1, 1, 1,
0.9839067, -1.970947, 4.312095, 1, 1, 1, 1, 1,
0.9918535, 0.06889274, 2.825228, 1, 1, 1, 1, 1,
0.991927, 0.4679927, 1.374572, 1, 1, 1, 1, 1,
0.9931523, -1.116968, 1.866153, 1, 1, 1, 1, 1,
0.9940791, 1.285377, 0.9438583, 1, 1, 1, 1, 1,
1.003811, 3.183137, -0.394224, 1, 1, 1, 1, 1,
1.006754, 0.2901826, 0.9499997, 1, 1, 1, 1, 1,
1.009807, -1.470886, 2.049267, 1, 1, 1, 1, 1,
1.016989, -0.1214026, 2.866349, 1, 1, 1, 1, 1,
1.019103, 0.4556623, 0.2330226, 1, 1, 1, 1, 1,
1.029356, -0.009332815, 2.043823, 0, 0, 1, 1, 1,
1.032034, 0.6293131, 1.952016, 1, 0, 0, 1, 1,
1.035736, 1.395155, -1.066777, 1, 0, 0, 1, 1,
1.035759, 1.145306, 0.918846, 1, 0, 0, 1, 1,
1.038668, -0.44581, 1.165783, 1, 0, 0, 1, 1,
1.039974, -1.062652, 2.833704, 1, 0, 0, 1, 1,
1.054088, 3.061834, 1.060162, 0, 0, 0, 1, 1,
1.054858, -0.65255, 4.287622, 0, 0, 0, 1, 1,
1.059671, 0.01457277, 1.525084, 0, 0, 0, 1, 1,
1.06412, -1.461599, 2.71064, 0, 0, 0, 1, 1,
1.067337, -0.4844935, 2.352786, 0, 0, 0, 1, 1,
1.067563, 1.135513, -0.4497447, 0, 0, 0, 1, 1,
1.084443, 0.4808334, 0.6431867, 0, 0, 0, 1, 1,
1.085113, 0.5940696, 3.648987, 1, 1, 1, 1, 1,
1.086196, 0.2072599, 0.8494161, 1, 1, 1, 1, 1,
1.094744, -0.9035629, 2.224543, 1, 1, 1, 1, 1,
1.098823, 0.4273945, 2.34198, 1, 1, 1, 1, 1,
1.106681, -0.9996478, 1.816372, 1, 1, 1, 1, 1,
1.108223, -0.6760216, 3.71942, 1, 1, 1, 1, 1,
1.110546, 0.8016584, 0.9016373, 1, 1, 1, 1, 1,
1.116219, -0.9229315, 2.427996, 1, 1, 1, 1, 1,
1.118113, 1.556549, 2.083555, 1, 1, 1, 1, 1,
1.118251, -0.5366764, 3.501989, 1, 1, 1, 1, 1,
1.119154, -0.009713169, 1.622259, 1, 1, 1, 1, 1,
1.122986, 1.578032, 2.560133, 1, 1, 1, 1, 1,
1.136407, -0.627028, 1.939172, 1, 1, 1, 1, 1,
1.136554, -0.7097813, 1.749849, 1, 1, 1, 1, 1,
1.139024, 1.811658, 0.9824325, 1, 1, 1, 1, 1,
1.143871, -1.584717, 2.54944, 0, 0, 1, 1, 1,
1.148638, 1.009166, -0.4112249, 1, 0, 0, 1, 1,
1.151297, -0.6450462, 2.380414, 1, 0, 0, 1, 1,
1.159344, 1.090962, 2.540706, 1, 0, 0, 1, 1,
1.159584, -1.431608, 1.627051, 1, 0, 0, 1, 1,
1.160021, -1.105759, 3.609113, 1, 0, 0, 1, 1,
1.165121, -1.590607, 1.822018, 0, 0, 0, 1, 1,
1.165962, 0.6322669, 0.331713, 0, 0, 0, 1, 1,
1.166664, 0.1009771, 0.5589972, 0, 0, 0, 1, 1,
1.172235, -0.8822651, 2.120418, 0, 0, 0, 1, 1,
1.172742, 1.304873, -0.3100776, 0, 0, 0, 1, 1,
1.175272, -0.01203486, 1.614516, 0, 0, 0, 1, 1,
1.187009, -0.1855029, 1.4023, 0, 0, 0, 1, 1,
1.19232, 0.07171231, 2.367042, 1, 1, 1, 1, 1,
1.194244, -0.6457195, 2.774783, 1, 1, 1, 1, 1,
1.196122, 1.642016, 1.575729, 1, 1, 1, 1, 1,
1.198685, 0.1905627, 0.9342987, 1, 1, 1, 1, 1,
1.199862, -0.2087502, 1.247612, 1, 1, 1, 1, 1,
1.226961, -0.3852159, 0.5549369, 1, 1, 1, 1, 1,
1.230865, 1.059542, 1.359155, 1, 1, 1, 1, 1,
1.234212, -0.07550959, 2.177479, 1, 1, 1, 1, 1,
1.254694, 0.1710979, 0.8100112, 1, 1, 1, 1, 1,
1.259932, -0.8223712, 2.707223, 1, 1, 1, 1, 1,
1.262499, -0.1156877, 1.790874, 1, 1, 1, 1, 1,
1.262694, 0.4068212, 0.6469028, 1, 1, 1, 1, 1,
1.273712, -0.4416839, 0.914343, 1, 1, 1, 1, 1,
1.276176, 0.4121994, 2.381624, 1, 1, 1, 1, 1,
1.282515, -0.9344702, 3.815945, 1, 1, 1, 1, 1,
1.293114, 0.7080922, 0.8496134, 0, 0, 1, 1, 1,
1.294787, 0.747951, -0.5457017, 1, 0, 0, 1, 1,
1.296504, 1.33439, 1.155625, 1, 0, 0, 1, 1,
1.3088, -1.258239, 2.755768, 1, 0, 0, 1, 1,
1.309542, 0.7164586, 0.4657353, 1, 0, 0, 1, 1,
1.309582, 0.246415, 0.7108686, 1, 0, 0, 1, 1,
1.314641, -0.5819837, 3.405095, 0, 0, 0, 1, 1,
1.316665, 0.8304601, 0.7373452, 0, 0, 0, 1, 1,
1.318201, 0.1295008, 0.4956325, 0, 0, 0, 1, 1,
1.321473, 0.5191903, 0.9434885, 0, 0, 0, 1, 1,
1.325996, 0.4353939, 2.80245, 0, 0, 0, 1, 1,
1.340049, -0.1912105, 0.6684534, 0, 0, 0, 1, 1,
1.346387, 0.4990642, 1.331428, 0, 0, 0, 1, 1,
1.347765, -1.734519, 3.274777, 1, 1, 1, 1, 1,
1.352189, 0.4078165, 1.474686, 1, 1, 1, 1, 1,
1.354829, -0.4302531, 1.900675, 1, 1, 1, 1, 1,
1.35909, 1.258834, -1.337765, 1, 1, 1, 1, 1,
1.361951, 0.5172148, 1.326027, 1, 1, 1, 1, 1,
1.372795, 1.102994, -0.5841655, 1, 1, 1, 1, 1,
1.37341, -0.1891036, 0.5971146, 1, 1, 1, 1, 1,
1.393773, -1.060882, 2.98308, 1, 1, 1, 1, 1,
1.39815, -0.8009442, 1.776166, 1, 1, 1, 1, 1,
1.410142, 0.4040054, 0.4328506, 1, 1, 1, 1, 1,
1.412928, 1.250129, 0.4385763, 1, 1, 1, 1, 1,
1.414352, -0.5977174, 2.759934, 1, 1, 1, 1, 1,
1.42271, -0.1169329, 2.359936, 1, 1, 1, 1, 1,
1.428751, -0.4740288, 1.499415, 1, 1, 1, 1, 1,
1.4295, 0.4722203, 1.625398, 1, 1, 1, 1, 1,
1.44377, -1.947403, 1.99526, 0, 0, 1, 1, 1,
1.444529, 0.662271, 2.180784, 1, 0, 0, 1, 1,
1.456223, -0.2890587, 2.154306, 1, 0, 0, 1, 1,
1.458073, -3.835838, 3.149412, 1, 0, 0, 1, 1,
1.474245, 0.02298613, 1.258852, 1, 0, 0, 1, 1,
1.499999, 1.712767, 1.237481, 1, 0, 0, 1, 1,
1.50082, 0.9671314, 1.058666, 0, 0, 0, 1, 1,
1.503005, -0.249204, 1.397818, 0, 0, 0, 1, 1,
1.510092, -1.721293, 2.694439, 0, 0, 0, 1, 1,
1.513431, -0.843116, 3.600877, 0, 0, 0, 1, 1,
1.526783, 1.934193, 2.039024, 0, 0, 0, 1, 1,
1.52939, 1.334537, -0.1434364, 0, 0, 0, 1, 1,
1.54534, -0.5201355, 1.609508, 0, 0, 0, 1, 1,
1.549938, -1.212689, 2.439212, 1, 1, 1, 1, 1,
1.550761, -0.2577758, 5.205133, 1, 1, 1, 1, 1,
1.562021, -0.5649096, 0.8750823, 1, 1, 1, 1, 1,
1.562458, 1.291895, 0.3377618, 1, 1, 1, 1, 1,
1.565709, -0.4142938, 1.793962, 1, 1, 1, 1, 1,
1.565816, 1.309008, 3.403855, 1, 1, 1, 1, 1,
1.573729, -0.190213, 0.9729581, 1, 1, 1, 1, 1,
1.574297, -0.04539721, 1.321053, 1, 1, 1, 1, 1,
1.577371, 0.7075956, 1.761164, 1, 1, 1, 1, 1,
1.593585, -0.9434569, 2.280086, 1, 1, 1, 1, 1,
1.59576, -0.2240199, 1.856282, 1, 1, 1, 1, 1,
1.596221, 1.769343, 1.330907, 1, 1, 1, 1, 1,
1.609132, 0.2631181, 1.885896, 1, 1, 1, 1, 1,
1.624489, -1.062362, 2.940317, 1, 1, 1, 1, 1,
1.625615, 0.6353006, -0.2952086, 1, 1, 1, 1, 1,
1.630696, -1.929874, 3.570704, 0, 0, 1, 1, 1,
1.65283, 1.068132, 2.337856, 1, 0, 0, 1, 1,
1.656693, 0.06166708, 1.604876, 1, 0, 0, 1, 1,
1.697161, 1.342147, 2.059808, 1, 0, 0, 1, 1,
1.698023, 0.1769158, 1.721695, 1, 0, 0, 1, 1,
1.707773, -0.4675285, 0.9076223, 1, 0, 0, 1, 1,
1.722886, -0.1455164, 1.824736, 0, 0, 0, 1, 1,
1.733245, -0.04494139, 0.814175, 0, 0, 0, 1, 1,
1.743206, 0.3250659, 1.923526, 0, 0, 0, 1, 1,
1.761921, -1.378178, 0.8806214, 0, 0, 0, 1, 1,
1.779573, 0.1817385, 2.616056, 0, 0, 0, 1, 1,
1.794626, 1.090226, 1.255487, 0, 0, 0, 1, 1,
1.803806, 0.01526298, 2.523147, 0, 0, 0, 1, 1,
1.805434, -0.9254662, 1.32135, 1, 1, 1, 1, 1,
1.807078, 0.1546099, 0.8208477, 1, 1, 1, 1, 1,
1.817442, -0.8194039, 0.8636377, 1, 1, 1, 1, 1,
1.82006, -1.735709, 0.8134433, 1, 1, 1, 1, 1,
1.826269, 1.328627, 0.1303153, 1, 1, 1, 1, 1,
1.831624, 1.365664, 0.4983918, 1, 1, 1, 1, 1,
1.841857, -0.7816571, 2.132056, 1, 1, 1, 1, 1,
1.845946, 0.1997872, 2.345179, 1, 1, 1, 1, 1,
1.852709, 1.83366, 1.83679, 1, 1, 1, 1, 1,
1.858863, 0.05818583, 1.887576, 1, 1, 1, 1, 1,
1.859242, -2.034269, 1.866869, 1, 1, 1, 1, 1,
1.865254, 0.4185783, 1.961472, 1, 1, 1, 1, 1,
1.919279, -2.754764, 2.360028, 1, 1, 1, 1, 1,
1.92102, -1.51862, 4.253892, 1, 1, 1, 1, 1,
1.958091, 1.379704, 2.487152, 1, 1, 1, 1, 1,
2.062761, -0.3049915, 0.2851041, 0, 0, 1, 1, 1,
2.091653, 1.050552, 1.466781, 1, 0, 0, 1, 1,
2.122584, 0.4613234, 2.888154, 1, 0, 0, 1, 1,
2.127663, -1.092126, 2.468551, 1, 0, 0, 1, 1,
2.141212, -1.160918, 3.598897, 1, 0, 0, 1, 1,
2.16504, -1.060734, 1.934178, 1, 0, 0, 1, 1,
2.20887, 0.2454856, 1.318262, 0, 0, 0, 1, 1,
2.253107, 0.9710145, 0.9409816, 0, 0, 0, 1, 1,
2.273977, 0.01426895, 2.286098, 0, 0, 0, 1, 1,
2.292165, 2.123263, 0.9068053, 0, 0, 0, 1, 1,
2.300554, -1.252802, 2.76069, 0, 0, 0, 1, 1,
2.301553, -1.979346, 1.508571, 0, 0, 0, 1, 1,
2.306242, 0.8666717, 1.187081, 0, 0, 0, 1, 1,
2.38128, 0.5873682, 1.898652, 1, 1, 1, 1, 1,
2.481436, 1.805745, -1.517901, 1, 1, 1, 1, 1,
2.488543, -0.2244629, 1.363754, 1, 1, 1, 1, 1,
2.693638, -0.3639469, 1.948614, 1, 1, 1, 1, 1,
2.825112, 1.198262, 1.45777, 1, 1, 1, 1, 1,
2.869766, -0.712606, 1.190013, 1, 1, 1, 1, 1,
2.935362, 0.4945885, 2.522382, 1, 1, 1, 1, 1
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
var radius = 9.66052;
var distance = 33.93216;
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
mvMatrix.translate( 0.02172923, 0.3263507, -0.1094978 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.93216);
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
