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
-3.065123, -0.7646319, -2.060036, 1, 0, 0, 1,
-2.87134, 0.04940967, -0.8853815, 1, 0.007843138, 0, 1,
-2.78775, 1.341637, -0.4940832, 1, 0.01176471, 0, 1,
-2.764434, 0.9619999, -1.198146, 1, 0.01960784, 0, 1,
-2.609051, 0.2818815, -1.896096, 1, 0.02352941, 0, 1,
-2.601745, -1.096867, -1.273335, 1, 0.03137255, 0, 1,
-2.542912, -1.155126, -2.270626, 1, 0.03529412, 0, 1,
-2.541289, 1.712393, -0.5874009, 1, 0.04313726, 0, 1,
-2.444139, 0.07055226, 0.5060651, 1, 0.04705882, 0, 1,
-2.437616, 0.6848935, -1.484363, 1, 0.05490196, 0, 1,
-2.393009, -0.231247, -1.749541, 1, 0.05882353, 0, 1,
-2.362564, -1.45567, -2.250296, 1, 0.06666667, 0, 1,
-2.358027, 0.1172082, -0.4638464, 1, 0.07058824, 0, 1,
-2.357947, 1.166591, -0.8046882, 1, 0.07843138, 0, 1,
-2.335825, 0.369226, -0.9121091, 1, 0.08235294, 0, 1,
-2.265671, -0.3388925, -2.575281, 1, 0.09019608, 0, 1,
-2.260955, -0.1467836, -1.482095, 1, 0.09411765, 0, 1,
-2.258355, -0.6649323, -2.858382, 1, 0.1019608, 0, 1,
-2.244851, 1.341239, -1.666139, 1, 0.1098039, 0, 1,
-2.238666, -0.2605041, -0.5453643, 1, 0.1137255, 0, 1,
-2.225999, 1.097069, -1.475996, 1, 0.1215686, 0, 1,
-2.219285, 0.6817609, -1.961207, 1, 0.1254902, 0, 1,
-2.148592, 0.7778808, -1.774568, 1, 0.1333333, 0, 1,
-2.130205, 1.547761, 0.5601128, 1, 0.1372549, 0, 1,
-2.086567, -0.3273171, -1.846052, 1, 0.145098, 0, 1,
-2.071509, -1.409151, -2.676879, 1, 0.1490196, 0, 1,
-2.058982, 0.5287379, -1.854666, 1, 0.1568628, 0, 1,
-2.055613, 0.6412975, -1.277135, 1, 0.1607843, 0, 1,
-2.028432, 0.152443, -1.358851, 1, 0.1686275, 0, 1,
-2.003566, -1.071386, -3.016688, 1, 0.172549, 0, 1,
-1.997606, -0.3360097, -2.224223, 1, 0.1803922, 0, 1,
-1.99033, -1.218428, -1.441974, 1, 0.1843137, 0, 1,
-1.988837, 2.653987, -1.566248, 1, 0.1921569, 0, 1,
-1.985352, 0.8170335, -0.484813, 1, 0.1960784, 0, 1,
-1.984985, 1.194959, -0.8367432, 1, 0.2039216, 0, 1,
-1.981033, 0.680468, 0.2719512, 1, 0.2117647, 0, 1,
-1.920175, -0.3216445, -0.5844784, 1, 0.2156863, 0, 1,
-1.889383, -0.1946182, -2.829204, 1, 0.2235294, 0, 1,
-1.886916, -0.4864621, -2.441221, 1, 0.227451, 0, 1,
-1.877954, -0.03504282, -1.851244, 1, 0.2352941, 0, 1,
-1.853491, 0.5405691, -1.139218, 1, 0.2392157, 0, 1,
-1.847448, 0.3321785, -2.11219, 1, 0.2470588, 0, 1,
-1.845366, -0.5161588, -0.688197, 1, 0.2509804, 0, 1,
-1.84453, 1.170225, -0.8600803, 1, 0.2588235, 0, 1,
-1.828157, 0.9868425, -1.768329, 1, 0.2627451, 0, 1,
-1.797639, -0.1332464, -2.355191, 1, 0.2705882, 0, 1,
-1.761255, -0.2564788, -0.7164846, 1, 0.2745098, 0, 1,
-1.749071, 0.9070961, -2.861951, 1, 0.282353, 0, 1,
-1.743603, -0.2591634, -1.711682, 1, 0.2862745, 0, 1,
-1.730478, 0.3331941, -0.03856453, 1, 0.2941177, 0, 1,
-1.721307, -0.6905268, -2.559668, 1, 0.3019608, 0, 1,
-1.718798, -0.1668859, -0.6459581, 1, 0.3058824, 0, 1,
-1.716009, 0.7417167, 0.3298658, 1, 0.3137255, 0, 1,
-1.6921, -0.09130205, -2.36189, 1, 0.3176471, 0, 1,
-1.691005, -0.6985575, -1.543606, 1, 0.3254902, 0, 1,
-1.684844, -1.806922, -2.168161, 1, 0.3294118, 0, 1,
-1.66995, 0.007094868, -0.3652768, 1, 0.3372549, 0, 1,
-1.66713, -0.4167296, -0.826674, 1, 0.3411765, 0, 1,
-1.630504, 2.386803, 0.8543013, 1, 0.3490196, 0, 1,
-1.61288, -0.1735075, -2.679448, 1, 0.3529412, 0, 1,
-1.600275, 2.061926, -2.583249, 1, 0.3607843, 0, 1,
-1.590382, -0.9835176, -1.883945, 1, 0.3647059, 0, 1,
-1.58648, -0.1456874, -0.7769852, 1, 0.372549, 0, 1,
-1.564381, -0.2968819, -1.029011, 1, 0.3764706, 0, 1,
-1.559007, -1.025084, -1.169607, 1, 0.3843137, 0, 1,
-1.558956, -0.04308698, -2.331576, 1, 0.3882353, 0, 1,
-1.553503, 0.7913787, 0.8699473, 1, 0.3960784, 0, 1,
-1.550599, 0.4349463, -1.920537, 1, 0.4039216, 0, 1,
-1.549433, 0.3974217, -0.5619313, 1, 0.4078431, 0, 1,
-1.549043, 0.9277936, -1.427142, 1, 0.4156863, 0, 1,
-1.538907, -0.6045493, -1.50446, 1, 0.4196078, 0, 1,
-1.528557, 1.365099, -2.290252, 1, 0.427451, 0, 1,
-1.527965, -0.7986023, -1.429647, 1, 0.4313726, 0, 1,
-1.521577, 1.068805, 0.295642, 1, 0.4392157, 0, 1,
-1.519234, 1.067269, 0.03796316, 1, 0.4431373, 0, 1,
-1.51778, -0.7101485, -0.6650506, 1, 0.4509804, 0, 1,
-1.508513, -0.6330369, -1.183616, 1, 0.454902, 0, 1,
-1.50477, 1.457883, -0.7657108, 1, 0.4627451, 0, 1,
-1.497477, -0.9908109, -2.319954, 1, 0.4666667, 0, 1,
-1.492323, 0.001312388, -1.890803, 1, 0.4745098, 0, 1,
-1.482316, -1.500351, -1.699482, 1, 0.4784314, 0, 1,
-1.480137, -0.4207964, -1.23266, 1, 0.4862745, 0, 1,
-1.474127, 0.9815397, -1.673469, 1, 0.4901961, 0, 1,
-1.469497, 1.796461, -1.042335, 1, 0.4980392, 0, 1,
-1.459919, 1.626129, 0.6595, 1, 0.5058824, 0, 1,
-1.455682, -0.2792848, -1.463445, 1, 0.509804, 0, 1,
-1.449602, 0.6658076, -3.796398, 1, 0.5176471, 0, 1,
-1.44816, 0.8462991, -1.689931, 1, 0.5215687, 0, 1,
-1.441924, -1.339482, -2.477386, 1, 0.5294118, 0, 1,
-1.441216, -0.09055112, -1.535273, 1, 0.5333334, 0, 1,
-1.440977, -1.126864, -2.227133, 1, 0.5411765, 0, 1,
-1.418874, 1.653935, 0.06656266, 1, 0.5450981, 0, 1,
-1.392942, -2.113612, -3.868117, 1, 0.5529412, 0, 1,
-1.362303, -2.051267, -2.736909, 1, 0.5568628, 0, 1,
-1.360893, 0.8891521, -0.9415377, 1, 0.5647059, 0, 1,
-1.360168, -0.2437819, -1.02817, 1, 0.5686275, 0, 1,
-1.357841, 2.106196, -2.053878, 1, 0.5764706, 0, 1,
-1.355494, 1.204202, -0.4697358, 1, 0.5803922, 0, 1,
-1.351534, -0.4464274, -1.290954, 1, 0.5882353, 0, 1,
-1.351199, -0.09570747, -4.349084, 1, 0.5921569, 0, 1,
-1.346233, -0.9092941, -3.184813, 1, 0.6, 0, 1,
-1.345945, -0.9090523, -1.867076, 1, 0.6078432, 0, 1,
-1.345833, -0.6001438, -2.487965, 1, 0.6117647, 0, 1,
-1.345676, 2.219198, -0.8194126, 1, 0.6196079, 0, 1,
-1.343677, 0.03695849, -1.279192, 1, 0.6235294, 0, 1,
-1.339952, -0.15407, -0.2464317, 1, 0.6313726, 0, 1,
-1.322842, -0.710428, -2.5539, 1, 0.6352941, 0, 1,
-1.302156, -1.830187, -3.22105, 1, 0.6431373, 0, 1,
-1.300314, -0.2207611, -4.600714, 1, 0.6470588, 0, 1,
-1.298681, -0.5106746, -0.2849085, 1, 0.654902, 0, 1,
-1.297971, 1.941687, -1.637329, 1, 0.6588235, 0, 1,
-1.294584, 0.356945, -1.235899, 1, 0.6666667, 0, 1,
-1.277945, 1.450716, 0.4506929, 1, 0.6705883, 0, 1,
-1.261337, 1.065639, -0.07102893, 1, 0.6784314, 0, 1,
-1.25501, -1.743122, -4.24548, 1, 0.682353, 0, 1,
-1.244379, 0.6077201, -1.89671, 1, 0.6901961, 0, 1,
-1.244215, -0.1407458, -1.949866, 1, 0.6941177, 0, 1,
-1.242725, -0.05185722, -0.2606813, 1, 0.7019608, 0, 1,
-1.235989, 0.5180529, -2.513062, 1, 0.7098039, 0, 1,
-1.232206, 1.041982, -0.978842, 1, 0.7137255, 0, 1,
-1.218161, 2.069958, -0.4431636, 1, 0.7215686, 0, 1,
-1.216393, -1.325271, -2.059296, 1, 0.7254902, 0, 1,
-1.214968, 0.3211066, -1.945132, 1, 0.7333333, 0, 1,
-1.214376, -0.4449824, -0.5350781, 1, 0.7372549, 0, 1,
-1.208473, -0.6470755, -3.023283, 1, 0.7450981, 0, 1,
-1.20592, -1.01585, -3.809628, 1, 0.7490196, 0, 1,
-1.204355, -1.490215, -2.25239, 1, 0.7568628, 0, 1,
-1.201736, -0.6753104, -3.114308, 1, 0.7607843, 0, 1,
-1.199871, -0.6890208, -0.4884512, 1, 0.7686275, 0, 1,
-1.190903, -1.959243, -2.118883, 1, 0.772549, 0, 1,
-1.190895, 2.086791, 0.9032664, 1, 0.7803922, 0, 1,
-1.189885, 0.6513408, -0.5254681, 1, 0.7843137, 0, 1,
-1.186572, 2.171479, -1.584819, 1, 0.7921569, 0, 1,
-1.183942, 0.3480599, -1.640324, 1, 0.7960784, 0, 1,
-1.163565, 0.1312215, -0.655786, 1, 0.8039216, 0, 1,
-1.152236, 0.3684988, -1.920812, 1, 0.8117647, 0, 1,
-1.148898, 1.156815, -0.607489, 1, 0.8156863, 0, 1,
-1.148692, 0.7012754, 0.9595079, 1, 0.8235294, 0, 1,
-1.141209, -0.1523807, -0.7061574, 1, 0.827451, 0, 1,
-1.140649, -0.2105231, -2.386304, 1, 0.8352941, 0, 1,
-1.131929, 1.09036, -1.849635, 1, 0.8392157, 0, 1,
-1.127348, 0.9416711, 0.0619125, 1, 0.8470588, 0, 1,
-1.122893, -0.0908292, -2.409121, 1, 0.8509804, 0, 1,
-1.122172, -0.7261587, -1.616287, 1, 0.8588235, 0, 1,
-1.119665, -1.089606, -2.055497, 1, 0.8627451, 0, 1,
-1.116727, -1.141175, -3.655559, 1, 0.8705882, 0, 1,
-1.1163, -0.9454265, -2.925937, 1, 0.8745098, 0, 1,
-1.11357, 0.8115187, -0.316936, 1, 0.8823529, 0, 1,
-1.111505, 0.9136834, -2.77892, 1, 0.8862745, 0, 1,
-1.110498, 2.496575, 0.1490388, 1, 0.8941177, 0, 1,
-1.110481, -0.5533102, -3.127278, 1, 0.8980392, 0, 1,
-1.10976, -0.7607173, -2.152853, 1, 0.9058824, 0, 1,
-1.10876, -0.8199574, -3.444945, 1, 0.9137255, 0, 1,
-1.105503, 0.5915209, -0.103243, 1, 0.9176471, 0, 1,
-1.10481, -1.485217, -2.163781, 1, 0.9254902, 0, 1,
-1.103598, 0.2735897, -0.5258514, 1, 0.9294118, 0, 1,
-1.097942, 1.142405, -0.07154519, 1, 0.9372549, 0, 1,
-1.090735, -0.7330874, -2.147029, 1, 0.9411765, 0, 1,
-1.081786, 0.01054157, -0.9970567, 1, 0.9490196, 0, 1,
-1.077319, -0.4716772, -1.260341, 1, 0.9529412, 0, 1,
-1.070422, -1.410844, -1.578372, 1, 0.9607843, 0, 1,
-1.070281, 0.8855881, -1.748977, 1, 0.9647059, 0, 1,
-1.06434, 0.8073565, -2.064299, 1, 0.972549, 0, 1,
-1.061414, 0.6738861, -0.8411112, 1, 0.9764706, 0, 1,
-1.05721, -0.0319159, -2.826521, 1, 0.9843137, 0, 1,
-1.055444, 2.26843, -2.280625, 1, 0.9882353, 0, 1,
-1.054572, -0.3581284, -2.115928, 1, 0.9960784, 0, 1,
-1.051257, 0.6856771, -1.505906, 0.9960784, 1, 0, 1,
-1.037306, 1.563688, 0.3360516, 0.9921569, 1, 0, 1,
-1.036499, -0.04250072, -1.375062, 0.9843137, 1, 0, 1,
-1.033133, -1.670212, -3.329322, 0.9803922, 1, 0, 1,
-1.029251, 1.170569, -2.902124, 0.972549, 1, 0, 1,
-1.028374, -2.118327, -2.964699, 0.9686275, 1, 0, 1,
-1.02599, -0.1010899, -2.035093, 0.9607843, 1, 0, 1,
-1.017007, -0.9456131, -1.14953, 0.9568627, 1, 0, 1,
-1.011217, -0.7281221, -1.754332, 0.9490196, 1, 0, 1,
-1.010748, 1.49788, -2.146709, 0.945098, 1, 0, 1,
-1.007251, -0.1321807, -0.1767956, 0.9372549, 1, 0, 1,
-0.9965491, -0.6068693, -3.42575, 0.9333333, 1, 0, 1,
-0.9897662, 0.2297796, -2.420773, 0.9254902, 1, 0, 1,
-0.9887836, -1.426457, -2.214508, 0.9215686, 1, 0, 1,
-0.9878104, 0.6888753, -0.08632389, 0.9137255, 1, 0, 1,
-0.9825936, 0.5299816, -0.7810008, 0.9098039, 1, 0, 1,
-0.9767659, 0.06751699, -1.164013, 0.9019608, 1, 0, 1,
-0.9649743, -0.5503971, -1.680102, 0.8941177, 1, 0, 1,
-0.9598048, 0.5789655, -2.039576, 0.8901961, 1, 0, 1,
-0.9573211, 0.6988309, -0.1566854, 0.8823529, 1, 0, 1,
-0.9572456, 0.3709085, -3.573385, 0.8784314, 1, 0, 1,
-0.9536583, 0.7947885, -1.716209, 0.8705882, 1, 0, 1,
-0.9474014, 1.186332, -1.071099, 0.8666667, 1, 0, 1,
-0.9400317, -2.695592, -3.462054, 0.8588235, 1, 0, 1,
-0.933664, 0.4544142, -0.2508374, 0.854902, 1, 0, 1,
-0.9317285, 1.542708, -1.180248, 0.8470588, 1, 0, 1,
-0.9261221, 0.08817398, 0.2786971, 0.8431373, 1, 0, 1,
-0.9257896, -0.5861647, -3.29859, 0.8352941, 1, 0, 1,
-0.9176561, 0.03894529, 0.4384825, 0.8313726, 1, 0, 1,
-0.8996997, -0.5354189, -2.809638, 0.8235294, 1, 0, 1,
-0.8962126, -1.104409, -4.11877, 0.8196079, 1, 0, 1,
-0.8889114, 1.116046, -0.1601021, 0.8117647, 1, 0, 1,
-0.8863667, 0.07359742, -1.367688, 0.8078431, 1, 0, 1,
-0.8862103, -0.500269, -1.594531, 0.8, 1, 0, 1,
-0.8816924, 0.7095963, -0.7583618, 0.7921569, 1, 0, 1,
-0.8748602, -0.06784329, -3.201629, 0.7882353, 1, 0, 1,
-0.8551961, -0.4193502, -3.282279, 0.7803922, 1, 0, 1,
-0.8476006, -1.337993, -0.004838235, 0.7764706, 1, 0, 1,
-0.8378558, -0.8670786, -2.948933, 0.7686275, 1, 0, 1,
-0.834488, -1.257827, -3.490453, 0.7647059, 1, 0, 1,
-0.8273011, 0.7483817, 1.59987, 0.7568628, 1, 0, 1,
-0.8200051, -1.609595, -1.787636, 0.7529412, 1, 0, 1,
-0.8092666, -0.7031158, -2.810812, 0.7450981, 1, 0, 1,
-0.8079937, -2.190822, -3.251946, 0.7411765, 1, 0, 1,
-0.8039951, -1.503183, -4.407265, 0.7333333, 1, 0, 1,
-0.8012737, -0.5789407, -0.2295304, 0.7294118, 1, 0, 1,
-0.8011365, -0.07838836, -2.518621, 0.7215686, 1, 0, 1,
-0.7987747, 0.7028359, -1.413686, 0.7176471, 1, 0, 1,
-0.7961567, -0.3013759, -0.8204682, 0.7098039, 1, 0, 1,
-0.79093, -0.6705838, -0.6018745, 0.7058824, 1, 0, 1,
-0.7843636, -2.206969, -3.578109, 0.6980392, 1, 0, 1,
-0.7782564, -1.029487, -2.525275, 0.6901961, 1, 0, 1,
-0.77428, 2.391699, -0.1998698, 0.6862745, 1, 0, 1,
-0.762515, -0.7938362, -0.9182788, 0.6784314, 1, 0, 1,
-0.7587535, 0.8764184, 0.3227777, 0.6745098, 1, 0, 1,
-0.7580458, 0.3524089, -1.716976, 0.6666667, 1, 0, 1,
-0.7467005, 1.364647, -1.195154, 0.6627451, 1, 0, 1,
-0.7361438, -0.2918882, -0.8010443, 0.654902, 1, 0, 1,
-0.7320213, -1.26145, -0.374025, 0.6509804, 1, 0, 1,
-0.7310023, -0.2838074, -3.682237, 0.6431373, 1, 0, 1,
-0.7302217, -1.185923, -4.568011, 0.6392157, 1, 0, 1,
-0.7123766, 0.9080318, 0.2777975, 0.6313726, 1, 0, 1,
-0.7117691, 0.792237, -0.2979097, 0.627451, 1, 0, 1,
-0.705889, -1.019532, -2.930447, 0.6196079, 1, 0, 1,
-0.7041687, -0.5977262, -2.550605, 0.6156863, 1, 0, 1,
-0.7009773, 0.6410445, -1.213681, 0.6078432, 1, 0, 1,
-0.7000371, 1.775508, -2.077532, 0.6039216, 1, 0, 1,
-0.6865211, -0.6440071, -3.718949, 0.5960785, 1, 0, 1,
-0.6856546, 0.8985863, -3.3162, 0.5882353, 1, 0, 1,
-0.6810682, -0.304066, -2.108748, 0.5843138, 1, 0, 1,
-0.6807066, 1.562025, -0.5878252, 0.5764706, 1, 0, 1,
-0.6803875, 2.249365, -1.506871, 0.572549, 1, 0, 1,
-0.6776307, -0.3677703, -1.535572, 0.5647059, 1, 0, 1,
-0.6668047, 0.1983704, -2.927681, 0.5607843, 1, 0, 1,
-0.6660641, -0.9097748, -3.318074, 0.5529412, 1, 0, 1,
-0.6604691, 0.2826601, -2.97717, 0.5490196, 1, 0, 1,
-0.6587493, 0.7921372, 0.01889155, 0.5411765, 1, 0, 1,
-0.6528949, -0.3305026, -0.9643893, 0.5372549, 1, 0, 1,
-0.6495134, -1.251893, -2.848496, 0.5294118, 1, 0, 1,
-0.6429996, -0.3834011, -2.246407, 0.5254902, 1, 0, 1,
-0.6407346, 1.440096, -1.231528, 0.5176471, 1, 0, 1,
-0.6399928, -0.5316339, -2.10277, 0.5137255, 1, 0, 1,
-0.6372149, -0.3428025, -2.615937, 0.5058824, 1, 0, 1,
-0.6368801, 3.163467, 0.2912185, 0.5019608, 1, 0, 1,
-0.6280832, -1.677536, -3.166427, 0.4941176, 1, 0, 1,
-0.6261557, -0.06914504, -2.497865, 0.4862745, 1, 0, 1,
-0.6239429, -0.654105, -2.078849, 0.4823529, 1, 0, 1,
-0.6199315, -0.02554718, -2.221833, 0.4745098, 1, 0, 1,
-0.6186134, -1.102218, -1.993471, 0.4705882, 1, 0, 1,
-0.6165558, -0.7503044, -0.9499677, 0.4627451, 1, 0, 1,
-0.6107173, -0.4856296, -2.852035, 0.4588235, 1, 0, 1,
-0.6105871, 0.009361272, 0.5146985, 0.4509804, 1, 0, 1,
-0.6104056, 1.150385, -1.388045, 0.4470588, 1, 0, 1,
-0.6095986, -0.8386343, -2.550244, 0.4392157, 1, 0, 1,
-0.6094639, -1.22844, -2.837117, 0.4352941, 1, 0, 1,
-0.6074971, -0.03502533, -3.096963, 0.427451, 1, 0, 1,
-0.6013178, 0.5442052, -2.067693, 0.4235294, 1, 0, 1,
-0.5998334, -0.2624931, -3.465588, 0.4156863, 1, 0, 1,
-0.598037, -1.983279, -2.306788, 0.4117647, 1, 0, 1,
-0.5956006, -0.02692096, -1.731465, 0.4039216, 1, 0, 1,
-0.5945187, -0.4513478, -3.189133, 0.3960784, 1, 0, 1,
-0.5933331, 1.418136, -2.587884, 0.3921569, 1, 0, 1,
-0.5918879, 0.7691189, -0.7831606, 0.3843137, 1, 0, 1,
-0.5916379, 1.427875, 1.697999, 0.3803922, 1, 0, 1,
-0.5911807, -0.5103696, -1.909099, 0.372549, 1, 0, 1,
-0.5893311, 1.812297, -1.040014, 0.3686275, 1, 0, 1,
-0.5880381, 0.2573926, -0.5515044, 0.3607843, 1, 0, 1,
-0.5822217, 1.667471, -0.3894099, 0.3568628, 1, 0, 1,
-0.5764531, 0.2012034, -0.2066442, 0.3490196, 1, 0, 1,
-0.5751011, -1.064093, -2.272718, 0.345098, 1, 0, 1,
-0.570412, -1.274736, -3.228615, 0.3372549, 1, 0, 1,
-0.5702249, 0.7830289, -1.590895, 0.3333333, 1, 0, 1,
-0.5672176, 0.1790991, -1.929024, 0.3254902, 1, 0, 1,
-0.5633253, -1.078504, -2.736089, 0.3215686, 1, 0, 1,
-0.5616016, -1.005617, -4.258012, 0.3137255, 1, 0, 1,
-0.5614893, -0.9108283, -1.281843, 0.3098039, 1, 0, 1,
-0.5576567, -1.353547, -3.857409, 0.3019608, 1, 0, 1,
-0.5557218, 0.5746071, -2.221527, 0.2941177, 1, 0, 1,
-0.5527915, -0.05837398, -0.8970097, 0.2901961, 1, 0, 1,
-0.5478888, -1.439359, -2.274441, 0.282353, 1, 0, 1,
-0.538345, 0.987838, -0.04873059, 0.2784314, 1, 0, 1,
-0.5351093, -0.4494708, -1.715024, 0.2705882, 1, 0, 1,
-0.5334646, -0.04632732, -0.7235144, 0.2666667, 1, 0, 1,
-0.5271714, -0.4149863, -1.610328, 0.2588235, 1, 0, 1,
-0.5254528, 0.5644934, -0.5647967, 0.254902, 1, 0, 1,
-0.5252749, 0.2224894, -0.6857591, 0.2470588, 1, 0, 1,
-0.5237681, -1.288596, -1.569277, 0.2431373, 1, 0, 1,
-0.5232179, -0.790141, -4.888445, 0.2352941, 1, 0, 1,
-0.5182362, 1.28162, -1.335331, 0.2313726, 1, 0, 1,
-0.5138105, -1.283649, -4.135573, 0.2235294, 1, 0, 1,
-0.5124184, -1.335581, -2.733235, 0.2196078, 1, 0, 1,
-0.5023421, -0.8419947, -3.458419, 0.2117647, 1, 0, 1,
-0.5012512, 0.3009471, -0.4948009, 0.2078431, 1, 0, 1,
-0.4997605, -1.336362, -1.706699, 0.2, 1, 0, 1,
-0.4992234, -0.8653187, -2.900735, 0.1921569, 1, 0, 1,
-0.4978766, -0.8235339, -1.980641, 0.1882353, 1, 0, 1,
-0.4944985, -0.5866918, -3.309923, 0.1803922, 1, 0, 1,
-0.4930374, -0.7779495, -3.999468, 0.1764706, 1, 0, 1,
-0.4871685, -1.005831, -2.729727, 0.1686275, 1, 0, 1,
-0.4871295, 1.656383, 0.2264471, 0.1647059, 1, 0, 1,
-0.4838877, 0.4591341, -1.376776, 0.1568628, 1, 0, 1,
-0.4803476, -0.07261991, 0.1968279, 0.1529412, 1, 0, 1,
-0.4796037, -1.26546, -2.54661, 0.145098, 1, 0, 1,
-0.4795478, 1.132879, 0.7293867, 0.1411765, 1, 0, 1,
-0.476997, -0.8099751, -4.751425, 0.1333333, 1, 0, 1,
-0.4744591, 1.963267, 1.330753, 0.1294118, 1, 0, 1,
-0.4723499, 0.5260169, 0.05149172, 0.1215686, 1, 0, 1,
-0.4707804, 0.5905672, -0.9717159, 0.1176471, 1, 0, 1,
-0.468358, -0.03612509, -1.496514, 0.1098039, 1, 0, 1,
-0.4670908, 0.01526217, -2.252304, 0.1058824, 1, 0, 1,
-0.4661425, 0.4025733, -0.3982843, 0.09803922, 1, 0, 1,
-0.4538603, -1.267177, -1.80599, 0.09019608, 1, 0, 1,
-0.4510546, -0.8529117, -2.332978, 0.08627451, 1, 0, 1,
-0.4501339, 1.431437, -0.3857657, 0.07843138, 1, 0, 1,
-0.4490532, 1.703261, -1.002744, 0.07450981, 1, 0, 1,
-0.4457668, 1.542958, 0.4908926, 0.06666667, 1, 0, 1,
-0.440133, 0.2104327, -2.069348, 0.0627451, 1, 0, 1,
-0.4390759, -0.4733093, -1.075667, 0.05490196, 1, 0, 1,
-0.438415, 0.6818151, -0.06504709, 0.05098039, 1, 0, 1,
-0.4351034, 0.7302614, -1.132072, 0.04313726, 1, 0, 1,
-0.4335372, 0.5204154, -1.06231, 0.03921569, 1, 0, 1,
-0.4311543, -0.4017204, -1.707314, 0.03137255, 1, 0, 1,
-0.4301721, 0.8648181, -0.4999435, 0.02745098, 1, 0, 1,
-0.4279981, -0.1778414, -3.327064, 0.01960784, 1, 0, 1,
-0.4251876, -0.6311631, -1.716128, 0.01568628, 1, 0, 1,
-0.4212803, -1.957693, -2.535232, 0.007843138, 1, 0, 1,
-0.4211746, 0.1838825, -0.7491692, 0.003921569, 1, 0, 1,
-0.4204542, -0.1539792, -1.348142, 0, 1, 0.003921569, 1,
-0.4202437, 1.076271, -0.5512678, 0, 1, 0.01176471, 1,
-0.4192975, -0.3256441, -2.24604, 0, 1, 0.01568628, 1,
-0.4167462, 0.04304903, -1.398451, 0, 1, 0.02352941, 1,
-0.4166609, -0.9463773, -3.274936, 0, 1, 0.02745098, 1,
-0.414828, 1.085707, -0.1410005, 0, 1, 0.03529412, 1,
-0.4087328, -0.01334697, -1.845378, 0, 1, 0.03921569, 1,
-0.4023103, -0.3921285, -1.954084, 0, 1, 0.04705882, 1,
-0.3955001, 2.026078, 0.7522323, 0, 1, 0.05098039, 1,
-0.3935581, -2.019179, -2.41286, 0, 1, 0.05882353, 1,
-0.3924217, -0.3277061, -2.351566, 0, 1, 0.0627451, 1,
-0.3874739, 1.471217, -0.2839388, 0, 1, 0.07058824, 1,
-0.3862026, -1.992551, -3.026184, 0, 1, 0.07450981, 1,
-0.385856, -0.05726653, -1.153602, 0, 1, 0.08235294, 1,
-0.3832547, -1.050418, -1.85762, 0, 1, 0.08627451, 1,
-0.382634, 0.8033503, -0.3371508, 0, 1, 0.09411765, 1,
-0.3818663, 0.1922762, -0.733724, 0, 1, 0.1019608, 1,
-0.380831, 0.4960555, 0.3430627, 0, 1, 0.1058824, 1,
-0.3806305, 0.5145329, -2.805063, 0, 1, 0.1137255, 1,
-0.3749969, 1.298288, -0.2845822, 0, 1, 0.1176471, 1,
-0.3709221, -0.8108364, -2.839591, 0, 1, 0.1254902, 1,
-0.3664784, 1.33126, -1.372209, 0, 1, 0.1294118, 1,
-0.3629383, -0.3733597, -2.255131, 0, 1, 0.1372549, 1,
-0.3513215, -1.559858, -2.395096, 0, 1, 0.1411765, 1,
-0.3493811, -0.06197695, -1.697368, 0, 1, 0.1490196, 1,
-0.3480241, -0.601974, -2.010031, 0, 1, 0.1529412, 1,
-0.3469568, 1.805452, -0.4560487, 0, 1, 0.1607843, 1,
-0.3425281, 2.246042, -0.7289924, 0, 1, 0.1647059, 1,
-0.3419126, 0.3971957, -0.7942151, 0, 1, 0.172549, 1,
-0.3350382, 0.5713333, -0.6010887, 0, 1, 0.1764706, 1,
-0.3322174, -0.6911924, -1.226243, 0, 1, 0.1843137, 1,
-0.3316209, -0.4887411, -2.776164, 0, 1, 0.1882353, 1,
-0.3263466, 1.283349, 0.4915185, 0, 1, 0.1960784, 1,
-0.3214269, 0.9062094, 0.2508342, 0, 1, 0.2039216, 1,
-0.3202771, 1.104193, -2.221429, 0, 1, 0.2078431, 1,
-0.3201766, -0.8579288, -2.447227, 0, 1, 0.2156863, 1,
-0.3201374, -0.01227773, -1.223, 0, 1, 0.2196078, 1,
-0.3172775, 0.05693078, -1.503773, 0, 1, 0.227451, 1,
-0.3154876, -0.3591537, -2.301653, 0, 1, 0.2313726, 1,
-0.3139716, 0.1686703, 0.4260482, 0, 1, 0.2392157, 1,
-0.3123904, -0.3580803, -1.22638, 0, 1, 0.2431373, 1,
-0.3118312, -0.5416304, -3.760849, 0, 1, 0.2509804, 1,
-0.3095019, 0.5852517, 0.5949216, 0, 1, 0.254902, 1,
-0.3056341, 0.3784843, -0.9888983, 0, 1, 0.2627451, 1,
-0.2987355, -0.2551757, -2.068323, 0, 1, 0.2666667, 1,
-0.2961016, -2.116727, -1.71908, 0, 1, 0.2745098, 1,
-0.2952196, 1.290405, 1.038621, 0, 1, 0.2784314, 1,
-0.2948751, -0.9945035, -4.123751, 0, 1, 0.2862745, 1,
-0.2928826, 0.7543673, 0.05758131, 0, 1, 0.2901961, 1,
-0.2903713, 1.361827, -0.5697352, 0, 1, 0.2980392, 1,
-0.2890601, -0.371958, -1.960996, 0, 1, 0.3058824, 1,
-0.2875549, -0.04348971, -2.096042, 0, 1, 0.3098039, 1,
-0.2868438, 0.06391507, 0.9243128, 0, 1, 0.3176471, 1,
-0.2857142, -0.7907282, -2.408445, 0, 1, 0.3215686, 1,
-0.2846168, -0.298876, -4.232766, 0, 1, 0.3294118, 1,
-0.2810361, 0.2248842, -1.725719, 0, 1, 0.3333333, 1,
-0.2786036, 0.3651838, -1.319103, 0, 1, 0.3411765, 1,
-0.2780918, 1.083901, -0.7259232, 0, 1, 0.345098, 1,
-0.2753586, -1.178019, -2.425701, 0, 1, 0.3529412, 1,
-0.2692285, -0.854222, -1.663283, 0, 1, 0.3568628, 1,
-0.2658521, -0.3882237, -1.597109, 0, 1, 0.3647059, 1,
-0.2641716, 0.9500101, -1.206861, 0, 1, 0.3686275, 1,
-0.2640378, -1.595133, -2.150285, 0, 1, 0.3764706, 1,
-0.25859, -0.8122237, -5.249462, 0, 1, 0.3803922, 1,
-0.2567244, -0.4775102, -1.445961, 0, 1, 0.3882353, 1,
-0.2518861, -0.9367751, -2.80807, 0, 1, 0.3921569, 1,
-0.2496098, -0.3007066, -2.221488, 0, 1, 0.4, 1,
-0.248417, -0.653883, -3.306726, 0, 1, 0.4078431, 1,
-0.2463654, -1.067365, -1.720815, 0, 1, 0.4117647, 1,
-0.2461341, 0.1661924, -1.596548, 0, 1, 0.4196078, 1,
-0.2451099, -0.6502215, -1.984057, 0, 1, 0.4235294, 1,
-0.2442327, -0.2933544, -2.303018, 0, 1, 0.4313726, 1,
-0.2428537, 0.1826949, -1.012063, 0, 1, 0.4352941, 1,
-0.2399106, 0.390949, -0.7645436, 0, 1, 0.4431373, 1,
-0.2395358, -0.569917, -3.181906, 0, 1, 0.4470588, 1,
-0.2317382, 1.080661, 1.201036, 0, 1, 0.454902, 1,
-0.2264661, -0.923812, -1.957376, 0, 1, 0.4588235, 1,
-0.2123571, -0.1629696, -1.761782, 0, 1, 0.4666667, 1,
-0.2110113, -1.125743, -2.465798, 0, 1, 0.4705882, 1,
-0.2088335, -0.003723978, -1.765806, 0, 1, 0.4784314, 1,
-0.2063968, 0.3050035, 0.8715914, 0, 1, 0.4823529, 1,
-0.2050081, -0.4256958, -1.929053, 0, 1, 0.4901961, 1,
-0.203619, 0.7743543, 0.6538564, 0, 1, 0.4941176, 1,
-0.2035528, -1.241141, -1.707264, 0, 1, 0.5019608, 1,
-0.2009093, 0.7614908, -2.759459, 0, 1, 0.509804, 1,
-0.1951006, 0.4866904, -1.267066, 0, 1, 0.5137255, 1,
-0.1950663, 0.9581335, 0.3157261, 0, 1, 0.5215687, 1,
-0.186167, -0.7944049, -2.653343, 0, 1, 0.5254902, 1,
-0.1820327, 0.5068744, 0.7303114, 0, 1, 0.5333334, 1,
-0.1801966, -0.2741734, -3.316635, 0, 1, 0.5372549, 1,
-0.1770788, -0.2744443, -2.777161, 0, 1, 0.5450981, 1,
-0.1750424, 0.7601281, 0.03225552, 0, 1, 0.5490196, 1,
-0.1740061, 0.3618851, -0.001926064, 0, 1, 0.5568628, 1,
-0.17252, -0.3707006, -2.582639, 0, 1, 0.5607843, 1,
-0.169683, 0.2019533, -1.72517, 0, 1, 0.5686275, 1,
-0.1671204, -0.2238433, -2.185447, 0, 1, 0.572549, 1,
-0.1660969, 0.09864026, -1.679228, 0, 1, 0.5803922, 1,
-0.1651046, 0.9583585, -1.123533, 0, 1, 0.5843138, 1,
-0.1643999, 0.406639, 2.353867, 0, 1, 0.5921569, 1,
-0.1607184, 2.027105, 1.428624, 0, 1, 0.5960785, 1,
-0.1602329, 0.2487321, 0.004641404, 0, 1, 0.6039216, 1,
-0.1562419, 1.022183, 0.03759792, 0, 1, 0.6117647, 1,
-0.1560751, -0.1710149, -4.131086, 0, 1, 0.6156863, 1,
-0.1481132, 0.398276, 0.1443404, 0, 1, 0.6235294, 1,
-0.1480051, -0.9991634, -3.612204, 0, 1, 0.627451, 1,
-0.1471071, 0.945398, -1.314673, 0, 1, 0.6352941, 1,
-0.14698, 1.288726, -0.6669021, 0, 1, 0.6392157, 1,
-0.1446896, -0.153532, -2.484691, 0, 1, 0.6470588, 1,
-0.1446689, -0.4822264, -3.695545, 0, 1, 0.6509804, 1,
-0.1403514, -0.5183874, -3.171663, 0, 1, 0.6588235, 1,
-0.1358733, 0.01348792, -1.246086, 0, 1, 0.6627451, 1,
-0.1311378, -0.2794534, -2.506901, 0, 1, 0.6705883, 1,
-0.1311021, -0.5839005, -4.065944, 0, 1, 0.6745098, 1,
-0.1307171, 0.5265784, -1.113554, 0, 1, 0.682353, 1,
-0.1281887, -1.084517, -4.169387, 0, 1, 0.6862745, 1,
-0.1255493, -0.3258566, -2.435735, 0, 1, 0.6941177, 1,
-0.1230338, -1.999349, -4.009446, 0, 1, 0.7019608, 1,
-0.1221205, 1.21899, -0.7335789, 0, 1, 0.7058824, 1,
-0.1211073, 0.05449355, -0.8380327, 0, 1, 0.7137255, 1,
-0.1210583, 0.238358, -0.3705828, 0, 1, 0.7176471, 1,
-0.1176974, -0.5928716, -3.202573, 0, 1, 0.7254902, 1,
-0.116844, -1.341516, -2.391368, 0, 1, 0.7294118, 1,
-0.1163517, -0.4059082, -2.898089, 0, 1, 0.7372549, 1,
-0.1130848, -0.1754585, -3.045655, 0, 1, 0.7411765, 1,
-0.1074188, 0.5216013, -0.1970794, 0, 1, 0.7490196, 1,
-0.1051832, 0.3449355, -0.2347036, 0, 1, 0.7529412, 1,
-0.1026572, 0.0821607, -0.06129409, 0, 1, 0.7607843, 1,
-0.09730475, -0.7996807, -4.030189, 0, 1, 0.7647059, 1,
-0.09612668, -0.4773431, -2.477386, 0, 1, 0.772549, 1,
-0.0944435, -0.3772047, -2.294657, 0, 1, 0.7764706, 1,
-0.09269603, -1.208274, -2.189009, 0, 1, 0.7843137, 1,
-0.09259291, 0.2504343, -0.3097132, 0, 1, 0.7882353, 1,
-0.08850477, -1.289692, -3.595774, 0, 1, 0.7960784, 1,
-0.08752827, 0.6537417, 1.151864, 0, 1, 0.8039216, 1,
-0.08714731, 0.2262661, -0.1564531, 0, 1, 0.8078431, 1,
-0.08126254, 0.8165357, 1.379362, 0, 1, 0.8156863, 1,
-0.08096868, -0.9857748, -2.756455, 0, 1, 0.8196079, 1,
-0.07082343, 0.1730354, -0.587452, 0, 1, 0.827451, 1,
-0.0690586, 0.1715075, -2.086747, 0, 1, 0.8313726, 1,
-0.06900115, 0.04068984, -1.202915, 0, 1, 0.8392157, 1,
-0.06147891, 0.2006444, 0.09826908, 0, 1, 0.8431373, 1,
-0.0587998, -0.4717109, -3.732895, 0, 1, 0.8509804, 1,
-0.05768376, -0.3916829, -3.006899, 0, 1, 0.854902, 1,
-0.05600825, 0.5645978, 1.387082, 0, 1, 0.8627451, 1,
-0.05374772, 0.4832398, -0.8097366, 0, 1, 0.8666667, 1,
-0.05372515, -0.9059705, -0.9194602, 0, 1, 0.8745098, 1,
-0.05106058, -0.5859029, -3.903777, 0, 1, 0.8784314, 1,
-0.04341789, 0.9956557, 0.2629122, 0, 1, 0.8862745, 1,
-0.04160914, -0.09681906, -1.852884, 0, 1, 0.8901961, 1,
-0.04098948, 0.01809502, -2.309082, 0, 1, 0.8980392, 1,
-0.03949657, 1.046647, -1.621575, 0, 1, 0.9058824, 1,
-0.03901786, 0.9506325, 0.3719424, 0, 1, 0.9098039, 1,
-0.03496654, -0.5540782, -2.873155, 0, 1, 0.9176471, 1,
-0.03460217, 0.1911795, -0.1128574, 0, 1, 0.9215686, 1,
-0.03364318, 0.3587698, 0.6690864, 0, 1, 0.9294118, 1,
-0.03233594, -0.9449888, -1.93088, 0, 1, 0.9333333, 1,
-0.02973883, -1.101203, -4.674982, 0, 1, 0.9411765, 1,
-0.02962189, -0.4816144, -0.2637553, 0, 1, 0.945098, 1,
-0.02879807, 0.7988595, 2.615147, 0, 1, 0.9529412, 1,
-0.02533527, 1.433725, 0.953124, 0, 1, 0.9568627, 1,
-0.02425335, -1.631708, -1.357196, 0, 1, 0.9647059, 1,
-0.02031773, -0.3037652, -3.696516, 0, 1, 0.9686275, 1,
-0.01942114, -1.031901, -1.905807, 0, 1, 0.9764706, 1,
-0.01372785, 0.6124159, -0.1532314, 0, 1, 0.9803922, 1,
-0.01355248, -0.7063493, -4.033919, 0, 1, 0.9882353, 1,
-0.01110196, 1.760055, -0.3785875, 0, 1, 0.9921569, 1,
-0.009428281, 0.8450631, -2.231556, 0, 1, 1, 1,
-0.006370324, 0.5390572, 0.1218833, 0, 0.9921569, 1, 1,
-0.003346408, -0.8684632, -5.063258, 0, 0.9882353, 1, 1,
-0.001013496, 0.1617357, 0.754531, 0, 0.9803922, 1, 1,
-0.0006127384, 2.313695, 1.12091, 0, 0.9764706, 1, 1,
-0.0002967565, 0.1748673, 0.6041586, 0, 0.9686275, 1, 1,
0.001892887, -1.246909, 4.260502, 0, 0.9647059, 1, 1,
0.003375557, -1.579231, 2.352084, 0, 0.9568627, 1, 1,
0.008598633, 0.8538746, -0.9045506, 0, 0.9529412, 1, 1,
0.01215347, -0.6798419, 1.962105, 0, 0.945098, 1, 1,
0.01584833, 1.985383, 0.6949254, 0, 0.9411765, 1, 1,
0.01902989, 0.5519477, 2.027746, 0, 0.9333333, 1, 1,
0.02084808, 0.2451844, -0.5825858, 0, 0.9294118, 1, 1,
0.02957927, -0.4818028, 2.488081, 0, 0.9215686, 1, 1,
0.0359596, -0.5539825, 2.259162, 0, 0.9176471, 1, 1,
0.03744528, 1.152666, 2.87761, 0, 0.9098039, 1, 1,
0.03836176, 0.584192, 1.572929, 0, 0.9058824, 1, 1,
0.03938588, -0.3483466, 3.08072, 0, 0.8980392, 1, 1,
0.04108296, -1.274573, 1.734003, 0, 0.8901961, 1, 1,
0.04507473, -3.229021, 4.228316, 0, 0.8862745, 1, 1,
0.04706915, -0.7068319, 3.83034, 0, 0.8784314, 1, 1,
0.04747078, 0.6130144, 2.180587, 0, 0.8745098, 1, 1,
0.05539593, 0.1657571, -0.2181703, 0, 0.8666667, 1, 1,
0.05840799, -0.2276545, 4.278807, 0, 0.8627451, 1, 1,
0.05862338, -1.227425, 2.084044, 0, 0.854902, 1, 1,
0.06046607, -0.1622467, 4.036234, 0, 0.8509804, 1, 1,
0.06167374, -0.6686064, 3.057209, 0, 0.8431373, 1, 1,
0.0687745, -0.4024894, 1.938911, 0, 0.8392157, 1, 1,
0.06956418, 0.04980323, 0.8161625, 0, 0.8313726, 1, 1,
0.07322311, -2.196544, 1.037805, 0, 0.827451, 1, 1,
0.07393467, -1.827026, 3.354686, 0, 0.8196079, 1, 1,
0.07548649, 0.07635024, 2.528731, 0, 0.8156863, 1, 1,
0.07624844, -0.5611911, 4.164797, 0, 0.8078431, 1, 1,
0.07689224, 0.03217071, 2.220525, 0, 0.8039216, 1, 1,
0.08333596, 0.0456894, 0.9214528, 0, 0.7960784, 1, 1,
0.08954072, -1.490123, 3.050355, 0, 0.7882353, 1, 1,
0.09354615, -0.5257503, 3.559637, 0, 0.7843137, 1, 1,
0.1002032, 1.023949, 2.176448, 0, 0.7764706, 1, 1,
0.1028001, -0.2476585, 2.352577, 0, 0.772549, 1, 1,
0.1106244, -0.0718211, 2.850416, 0, 0.7647059, 1, 1,
0.113251, 1.070069, 0.2257423, 0, 0.7607843, 1, 1,
0.1132631, 0.2218997, -0.841252, 0, 0.7529412, 1, 1,
0.1142741, -0.7754715, 2.877096, 0, 0.7490196, 1, 1,
0.1162638, 0.1437762, -0.3278272, 0, 0.7411765, 1, 1,
0.1169433, -0.6468003, 3.232709, 0, 0.7372549, 1, 1,
0.1169806, 0.1629432, -1.432478, 0, 0.7294118, 1, 1,
0.1191039, -0.994505, 3.223781, 0, 0.7254902, 1, 1,
0.1220552, 0.9152219, 0.6898271, 0, 0.7176471, 1, 1,
0.1228681, 0.2786224, 1.59191, 0, 0.7137255, 1, 1,
0.1239857, 0.8031793, 0.5883475, 0, 0.7058824, 1, 1,
0.1246391, -0.01545053, 2.92998, 0, 0.6980392, 1, 1,
0.1271022, -0.9315856, 2.395662, 0, 0.6941177, 1, 1,
0.1278076, 1.649792, -0.09978571, 0, 0.6862745, 1, 1,
0.1283301, 2.358307, 0.01995123, 0, 0.682353, 1, 1,
0.13201, 0.823391, 0.3129484, 0, 0.6745098, 1, 1,
0.1355408, 0.9019464, 0.1168042, 0, 0.6705883, 1, 1,
0.1388152, 0.9804241, 0.7026947, 0, 0.6627451, 1, 1,
0.1405051, -1.428383, 0.9745922, 0, 0.6588235, 1, 1,
0.1415769, 1.157762, -0.05761559, 0, 0.6509804, 1, 1,
0.1439679, -2.029145, 3.067964, 0, 0.6470588, 1, 1,
0.1450209, 0.2155494, 2.867802, 0, 0.6392157, 1, 1,
0.1474272, -0.9672808, 3.214319, 0, 0.6352941, 1, 1,
0.1490893, -1.028533, 2.006606, 0, 0.627451, 1, 1,
0.1549908, 2.283547, 0.7225498, 0, 0.6235294, 1, 1,
0.1565075, -0.9007806, 2.218744, 0, 0.6156863, 1, 1,
0.1586172, -0.6780254, 1.70098, 0, 0.6117647, 1, 1,
0.1615652, 0.9270825, -0.04346922, 0, 0.6039216, 1, 1,
0.1616142, -0.02815069, 1.613148, 0, 0.5960785, 1, 1,
0.1643346, -2.509054, 3.369866, 0, 0.5921569, 1, 1,
0.1662986, -0.2937667, 1.858809, 0, 0.5843138, 1, 1,
0.1693804, 0.4632927, -0.3679487, 0, 0.5803922, 1, 1,
0.1718944, -0.7734304, 2.662441, 0, 0.572549, 1, 1,
0.17248, 0.9052431, 2.221163, 0, 0.5686275, 1, 1,
0.1730251, -0.6206632, 2.160009, 0, 0.5607843, 1, 1,
0.1738792, 0.2627522, -0.03126006, 0, 0.5568628, 1, 1,
0.1809653, 0.206411, 0.6940677, 0, 0.5490196, 1, 1,
0.1818603, -0.8486837, 3.350858, 0, 0.5450981, 1, 1,
0.182876, -1.98484, 3.571569, 0, 0.5372549, 1, 1,
0.1869247, 0.2101594, 0.3421095, 0, 0.5333334, 1, 1,
0.1918439, -0.416558, 2.660015, 0, 0.5254902, 1, 1,
0.193729, -0.1858268, 2.41647, 0, 0.5215687, 1, 1,
0.195484, 0.09831333, 0.9985663, 0, 0.5137255, 1, 1,
0.1960107, -0.9380373, 1.926028, 0, 0.509804, 1, 1,
0.1990437, -2.30078, 3.128598, 0, 0.5019608, 1, 1,
0.2003773, 0.1387204, 1.785256, 0, 0.4941176, 1, 1,
0.2119922, 1.197003, -0.7873189, 0, 0.4901961, 1, 1,
0.2178064, -0.7446885, 1.968523, 0, 0.4823529, 1, 1,
0.2178485, 1.469704, -0.6487048, 0, 0.4784314, 1, 1,
0.2180032, -0.4513268, 2.422572, 0, 0.4705882, 1, 1,
0.2186993, 0.991675, 1.105933, 0, 0.4666667, 1, 1,
0.2187755, -0.549253, 2.92826, 0, 0.4588235, 1, 1,
0.2217864, 0.3048835, -0.6693445, 0, 0.454902, 1, 1,
0.2269307, -0.2058551, 0.398556, 0, 0.4470588, 1, 1,
0.231971, -0.6615044, 4.129476, 0, 0.4431373, 1, 1,
0.2327142, 1.774195, -0.4278093, 0, 0.4352941, 1, 1,
0.2386614, -0.3487402, 2.619168, 0, 0.4313726, 1, 1,
0.2390916, 0.07343271, 1.460541, 0, 0.4235294, 1, 1,
0.2405503, -0.1012692, 3.281054, 0, 0.4196078, 1, 1,
0.2434504, -0.1895648, 2.468807, 0, 0.4117647, 1, 1,
0.2454074, -0.4633241, 2.944897, 0, 0.4078431, 1, 1,
0.2461458, 0.2086442, -0.6128799, 0, 0.4, 1, 1,
0.2465496, -0.2769664, 1.150596, 0, 0.3921569, 1, 1,
0.2472154, 0.5661594, 1.147827, 0, 0.3882353, 1, 1,
0.2485497, 0.4026986, 0.6546311, 0, 0.3803922, 1, 1,
0.2549541, -0.1131852, 1.645514, 0, 0.3764706, 1, 1,
0.2578262, -0.4560204, 2.687213, 0, 0.3686275, 1, 1,
0.2608591, -0.1914826, 1.723033, 0, 0.3647059, 1, 1,
0.261648, 1.689626, 1.47293, 0, 0.3568628, 1, 1,
0.2633025, -0.4850561, 2.53843, 0, 0.3529412, 1, 1,
0.2634125, 0.5782796, 0.1280564, 0, 0.345098, 1, 1,
0.2669129, 0.3024538, 2.778756, 0, 0.3411765, 1, 1,
0.2720489, -1.311914, 1.924594, 0, 0.3333333, 1, 1,
0.2742499, -1.762293, 4.158699, 0, 0.3294118, 1, 1,
0.2761815, 0.5775417, 1.152418, 0, 0.3215686, 1, 1,
0.2771713, 0.1426268, 1.486856, 0, 0.3176471, 1, 1,
0.2783229, 0.4927649, 1.291933, 0, 0.3098039, 1, 1,
0.2792052, -1.177546, 3.907052, 0, 0.3058824, 1, 1,
0.2793793, 1.223815, 1.357872, 0, 0.2980392, 1, 1,
0.2794021, -0.2883503, 2.220922, 0, 0.2901961, 1, 1,
0.2799582, 0.8730695, 0.5056825, 0, 0.2862745, 1, 1,
0.28058, -1.158628, 3.411366, 0, 0.2784314, 1, 1,
0.2841828, -0.11973, 1.950665, 0, 0.2745098, 1, 1,
0.2848613, 0.01317913, 1.951431, 0, 0.2666667, 1, 1,
0.2856675, 0.8080873, -0.08640257, 0, 0.2627451, 1, 1,
0.2865117, 0.1728614, 0.512826, 0, 0.254902, 1, 1,
0.2869944, -1.518569, 4.012857, 0, 0.2509804, 1, 1,
0.2950564, 0.0387172, 0.1341129, 0, 0.2431373, 1, 1,
0.2955123, -0.9389581, 4.804596, 0, 0.2392157, 1, 1,
0.3004425, 2.653631, -0.4325054, 0, 0.2313726, 1, 1,
0.3006483, 2.05738, 0.5242041, 0, 0.227451, 1, 1,
0.3007066, -0.2602056, 2.84669, 0, 0.2196078, 1, 1,
0.3013345, -0.7968875, 3.870117, 0, 0.2156863, 1, 1,
0.3035272, -0.2998364, 0.5867429, 0, 0.2078431, 1, 1,
0.3044572, 2.237004, 1.203914, 0, 0.2039216, 1, 1,
0.3074288, -0.6253973, 3.437135, 0, 0.1960784, 1, 1,
0.3105887, 0.7209743, -0.6642045, 0, 0.1882353, 1, 1,
0.3143373, 1.29283, -0.6739926, 0, 0.1843137, 1, 1,
0.3151565, 1.652125, -0.366058, 0, 0.1764706, 1, 1,
0.3173907, 0.002423701, 0.8946739, 0, 0.172549, 1, 1,
0.3178028, -0.9722866, 4.339371, 0, 0.1647059, 1, 1,
0.3198857, 1.583646, 0.6286758, 0, 0.1607843, 1, 1,
0.3206775, 1.28133, 1.068911, 0, 0.1529412, 1, 1,
0.3215862, -1.247153, 3.252111, 0, 0.1490196, 1, 1,
0.3219406, 0.2168587, -0.2683792, 0, 0.1411765, 1, 1,
0.325035, 0.3408532, 1.05658, 0, 0.1372549, 1, 1,
0.326465, 0.5201764, 0.7046816, 0, 0.1294118, 1, 1,
0.3304247, 0.03474183, -1.042187, 0, 0.1254902, 1, 1,
0.3352114, 2.306076, -0.6899563, 0, 0.1176471, 1, 1,
0.3383461, 1.800465, -0.1515317, 0, 0.1137255, 1, 1,
0.3452826, 0.4254035, 0.8829133, 0, 0.1058824, 1, 1,
0.351024, 1.581071, 0.1619055, 0, 0.09803922, 1, 1,
0.3526009, -0.1591926, 3.61417, 0, 0.09411765, 1, 1,
0.3541523, 0.03668439, 0.3489938, 0, 0.08627451, 1, 1,
0.3665302, 1.155725, -1.298996, 0, 0.08235294, 1, 1,
0.3678781, 0.8061864, 1.11813, 0, 0.07450981, 1, 1,
0.3707104, -0.07379801, 2.245405, 0, 0.07058824, 1, 1,
0.370999, 0.2915609, -0.5876819, 0, 0.0627451, 1, 1,
0.3722181, 0.1635594, 0.9610397, 0, 0.05882353, 1, 1,
0.3797629, -0.4932773, 2.970647, 0, 0.05098039, 1, 1,
0.3797831, 1.303286, 0.04085314, 0, 0.04705882, 1, 1,
0.3798817, -1.601264, 3.12802, 0, 0.03921569, 1, 1,
0.3806355, -1.512257, 3.475162, 0, 0.03529412, 1, 1,
0.3810632, 0.3327277, -0.006889717, 0, 0.02745098, 1, 1,
0.3852093, -0.4105906, 3.167734, 0, 0.02352941, 1, 1,
0.389643, -0.7616134, 3.378222, 0, 0.01568628, 1, 1,
0.3905123, 1.826233, 1.423522, 0, 0.01176471, 1, 1,
0.3942118, 1.195404, 1.29879, 0, 0.003921569, 1, 1,
0.3982808, 0.8991163, -1.214758, 0.003921569, 0, 1, 1,
0.3993336, -1.361172, 3.476997, 0.007843138, 0, 1, 1,
0.4069897, -1.55113, 3.677525, 0.01568628, 0, 1, 1,
0.407006, -0.8654726, 2.902445, 0.01960784, 0, 1, 1,
0.4071857, -0.7868762, 2.933304, 0.02745098, 0, 1, 1,
0.4092409, -0.2902321, 1.872474, 0.03137255, 0, 1, 1,
0.4096519, 0.1964059, 1.44224, 0.03921569, 0, 1, 1,
0.4109626, 0.08123235, -0.02818083, 0.04313726, 0, 1, 1,
0.4114192, 0.8329542, 0.09629189, 0.05098039, 0, 1, 1,
0.4154079, -1.462006, 3.327939, 0.05490196, 0, 1, 1,
0.4191928, 0.9847128, 1.208665, 0.0627451, 0, 1, 1,
0.4197158, 0.7640838, 0.9692377, 0.06666667, 0, 1, 1,
0.4278524, -0.6668282, 0.596509, 0.07450981, 0, 1, 1,
0.429757, 0.7393171, -2.061539, 0.07843138, 0, 1, 1,
0.4393664, 1.158037, 0.5534849, 0.08627451, 0, 1, 1,
0.4429959, -1.075676, 3.389186, 0.09019608, 0, 1, 1,
0.4501626, -0.9828998, 4.499702, 0.09803922, 0, 1, 1,
0.4541948, 0.5973516, 0.2917309, 0.1058824, 0, 1, 1,
0.4543237, -0.4934302, 3.097769, 0.1098039, 0, 1, 1,
0.4650274, 0.9017164, -0.6432351, 0.1176471, 0, 1, 1,
0.4687862, 0.4595384, -0.6534725, 0.1215686, 0, 1, 1,
0.4688591, -0.2655947, 0.7790442, 0.1294118, 0, 1, 1,
0.4728627, 0.6003087, 0.5059388, 0.1333333, 0, 1, 1,
0.4761094, -0.7286257, 0.722607, 0.1411765, 0, 1, 1,
0.4763534, 1.244151, 0.6240923, 0.145098, 0, 1, 1,
0.4772806, -0.5968073, 2.198733, 0.1529412, 0, 1, 1,
0.4842748, -0.1976399, 4.451168, 0.1568628, 0, 1, 1,
0.4879797, -0.4152448, 2.545739, 0.1647059, 0, 1, 1,
0.4890373, -1.395282, 1.153707, 0.1686275, 0, 1, 1,
0.4935595, -0.5890789, 2.687495, 0.1764706, 0, 1, 1,
0.4938163, 0.08583521, 0.360491, 0.1803922, 0, 1, 1,
0.4944015, 0.3919451, 2.350237, 0.1882353, 0, 1, 1,
0.4975084, 0.04898659, 0.4657991, 0.1921569, 0, 1, 1,
0.4991807, 0.7209347, -0.5569506, 0.2, 0, 1, 1,
0.5003909, -0.9553331, 3.352257, 0.2078431, 0, 1, 1,
0.5023462, 1.671084, -1.346904, 0.2117647, 0, 1, 1,
0.512356, 1.413394, 0.6628357, 0.2196078, 0, 1, 1,
0.5189511, -0.7950974, 1.59441, 0.2235294, 0, 1, 1,
0.5205825, 0.01244905, 1.131745, 0.2313726, 0, 1, 1,
0.5247567, -2.82102, 1.873729, 0.2352941, 0, 1, 1,
0.5254005, 1.450208, 0.1923547, 0.2431373, 0, 1, 1,
0.529542, 0.8403636, -0.654651, 0.2470588, 0, 1, 1,
0.5343484, 1.377087, 0.5847689, 0.254902, 0, 1, 1,
0.5468844, -1.83239, 0.9198766, 0.2588235, 0, 1, 1,
0.54748, -1.157733, 4.082359, 0.2666667, 0, 1, 1,
0.5478596, 1.067373, 0.2564403, 0.2705882, 0, 1, 1,
0.561053, -0.6965284, 2.031312, 0.2784314, 0, 1, 1,
0.5677943, 0.0972217, 1.040595, 0.282353, 0, 1, 1,
0.5701085, -0.8090155, 2.369192, 0.2901961, 0, 1, 1,
0.5741786, -0.4327524, 2.582423, 0.2941177, 0, 1, 1,
0.5762913, -0.7907522, 5.094164, 0.3019608, 0, 1, 1,
0.5813875, 0.413409, 1.653463, 0.3098039, 0, 1, 1,
0.5839907, 0.4269913, 0.1659943, 0.3137255, 0, 1, 1,
0.5878662, 1.655101, 0.05186994, 0.3215686, 0, 1, 1,
0.5885031, -2.035786, 2.533118, 0.3254902, 0, 1, 1,
0.5892263, -1.295601, 2.21819, 0.3333333, 0, 1, 1,
0.5902999, 0.2491085, 2.211238, 0.3372549, 0, 1, 1,
0.5915726, 0.7761736, 0.7318529, 0.345098, 0, 1, 1,
0.5923895, -0.5053848, 1.953277, 0.3490196, 0, 1, 1,
0.5974506, -1.090551, 2.586625, 0.3568628, 0, 1, 1,
0.5982283, -0.3818168, 2.393346, 0.3607843, 0, 1, 1,
0.6011537, 0.3959875, 0.6140363, 0.3686275, 0, 1, 1,
0.6043399, -0.1021782, 1.980393, 0.372549, 0, 1, 1,
0.6101548, -1.248205, 3.509452, 0.3803922, 0, 1, 1,
0.6109706, -0.6908362, 3.787021, 0.3843137, 0, 1, 1,
0.6115136, -0.7539749, 3.242884, 0.3921569, 0, 1, 1,
0.6126654, 1.40458, 1.389266, 0.3960784, 0, 1, 1,
0.6230178, 0.528192, 0.5276439, 0.4039216, 0, 1, 1,
0.6234998, -0.8666178, 3.250731, 0.4117647, 0, 1, 1,
0.6275571, -0.4061325, 2.70521, 0.4156863, 0, 1, 1,
0.6349344, -1.243111, 2.899223, 0.4235294, 0, 1, 1,
0.6438816, -0.1828643, 0.8645976, 0.427451, 0, 1, 1,
0.6457061, -0.4085253, 2.479415, 0.4352941, 0, 1, 1,
0.6478389, 0.2385825, 1.910519, 0.4392157, 0, 1, 1,
0.6567281, 1.020599, -0.9777312, 0.4470588, 0, 1, 1,
0.6595736, -1.349108, 3.727264, 0.4509804, 0, 1, 1,
0.6611658, -1.33135, 2.878665, 0.4588235, 0, 1, 1,
0.6685411, 1.78433, 0.9422958, 0.4627451, 0, 1, 1,
0.6693636, -0.4073167, 1.18, 0.4705882, 0, 1, 1,
0.6703867, 0.4539475, 0.0008072386, 0.4745098, 0, 1, 1,
0.6761313, 0.8694978, -0.4479471, 0.4823529, 0, 1, 1,
0.6792682, -1.245999, 2.576185, 0.4862745, 0, 1, 1,
0.6884649, 1.05027, 1.280085, 0.4941176, 0, 1, 1,
0.6912125, -0.9087358, 2.962029, 0.5019608, 0, 1, 1,
0.6923621, 0.2589037, 1.950613, 0.5058824, 0, 1, 1,
0.6930548, -1.016984, 2.922651, 0.5137255, 0, 1, 1,
0.6931059, -0.01251864, 2.802603, 0.5176471, 0, 1, 1,
0.7019508, 0.7649311, 0.8995787, 0.5254902, 0, 1, 1,
0.7068927, 0.3503458, 1.737099, 0.5294118, 0, 1, 1,
0.7137044, -0.6319816, 1.382162, 0.5372549, 0, 1, 1,
0.7146607, -0.02550815, 2.515641, 0.5411765, 0, 1, 1,
0.7170755, 0.251145, 1.004842, 0.5490196, 0, 1, 1,
0.7211615, -1.563619, 1.725092, 0.5529412, 0, 1, 1,
0.7218046, -0.5506034, 2.377084, 0.5607843, 0, 1, 1,
0.7242369, 0.4201361, 1.90728, 0.5647059, 0, 1, 1,
0.729057, -1.466797, 2.938988, 0.572549, 0, 1, 1,
0.7298667, 0.7161024, -0.1558677, 0.5764706, 0, 1, 1,
0.7321786, -1.110843, 1.435777, 0.5843138, 0, 1, 1,
0.7379022, 1.185109, -0.1083177, 0.5882353, 0, 1, 1,
0.738615, 0.1591415, 1.577548, 0.5960785, 0, 1, 1,
0.7399557, 1.377085, 3.250192, 0.6039216, 0, 1, 1,
0.7422312, -1.671026, 3.127916, 0.6078432, 0, 1, 1,
0.7441173, -0.8991814, 2.331109, 0.6156863, 0, 1, 1,
0.7449889, -0.2895975, 1.03955, 0.6196079, 0, 1, 1,
0.7501598, 0.2659121, 2.339999, 0.627451, 0, 1, 1,
0.7536179, -0.03688826, 2.662345, 0.6313726, 0, 1, 1,
0.7556611, -1.718772, 2.121568, 0.6392157, 0, 1, 1,
0.7563009, -0.9123095, 1.294324, 0.6431373, 0, 1, 1,
0.7650036, 0.5598077, -0.9618069, 0.6509804, 0, 1, 1,
0.7654632, -0.3068227, 3.764939, 0.654902, 0, 1, 1,
0.7666391, 1.255701, 1.756309, 0.6627451, 0, 1, 1,
0.7666497, 0.6885065, 2.948635, 0.6666667, 0, 1, 1,
0.767576, -0.2216713, 0.9321614, 0.6745098, 0, 1, 1,
0.7703593, 2.386906, 1.071061, 0.6784314, 0, 1, 1,
0.7705057, 1.40423, 1.045362, 0.6862745, 0, 1, 1,
0.7864754, -1.45196, 2.417956, 0.6901961, 0, 1, 1,
0.7886873, -1.67199, 1.998171, 0.6980392, 0, 1, 1,
0.7897371, -0.5796345, 3.584023, 0.7058824, 0, 1, 1,
0.7987256, 0.6871619, 1.552039, 0.7098039, 0, 1, 1,
0.7991289, 2.446386, 1.506021, 0.7176471, 0, 1, 1,
0.8175167, 1.374592, 0.1562327, 0.7215686, 0, 1, 1,
0.8224728, 1.272834, 1.090682, 0.7294118, 0, 1, 1,
0.8248587, 0.3101681, -0.2576135, 0.7333333, 0, 1, 1,
0.8338342, -0.1580785, 3.02509, 0.7411765, 0, 1, 1,
0.8464205, 1.159282, 0.3556944, 0.7450981, 0, 1, 1,
0.8478646, -0.594206, 1.982527, 0.7529412, 0, 1, 1,
0.8554438, 0.3112368, 0.8787883, 0.7568628, 0, 1, 1,
0.8587723, -1.122267, 3.635987, 0.7647059, 0, 1, 1,
0.8590297, -0.3115943, 2.289152, 0.7686275, 0, 1, 1,
0.8598371, 0.9352806, 1.57949, 0.7764706, 0, 1, 1,
0.8603063, -0.8299119, 1.017022, 0.7803922, 0, 1, 1,
0.8619545, 0.04254043, 0.8296469, 0.7882353, 0, 1, 1,
0.8622178, 0.8127708, 0.9347288, 0.7921569, 0, 1, 1,
0.8625441, 0.2887942, 0.5811069, 0.8, 0, 1, 1,
0.8686823, -1.120476, 3.655791, 0.8078431, 0, 1, 1,
0.8692272, 0.01510155, 2.769785, 0.8117647, 0, 1, 1,
0.8815578, 0.428239, 1.897187, 0.8196079, 0, 1, 1,
0.8856311, -1.380543, 3.371813, 0.8235294, 0, 1, 1,
0.8932174, -0.662626, 1.813627, 0.8313726, 0, 1, 1,
0.9003579, 1.059254, 0.6528475, 0.8352941, 0, 1, 1,
0.9047172, -0.361041, 2.963973, 0.8431373, 0, 1, 1,
0.9098623, -1.4654, 1.279778, 0.8470588, 0, 1, 1,
0.9125926, 1.436529, 0.5501227, 0.854902, 0, 1, 1,
0.916393, -0.3591844, 3.362329, 0.8588235, 0, 1, 1,
0.9234726, 1.145046, 1.689215, 0.8666667, 0, 1, 1,
0.9252033, 0.515093, 0.6810452, 0.8705882, 0, 1, 1,
0.9279874, -0.8483131, 3.255599, 0.8784314, 0, 1, 1,
0.9347506, -1.98178, 1.925493, 0.8823529, 0, 1, 1,
0.9406145, 0.384683, 1.027413, 0.8901961, 0, 1, 1,
0.9444482, 1.073207, 0.430099, 0.8941177, 0, 1, 1,
0.9480687, 0.4661706, 2.065924, 0.9019608, 0, 1, 1,
0.9487283, -0.2512533, 2.135615, 0.9098039, 0, 1, 1,
0.9488112, -0.5183708, 2.821631, 0.9137255, 0, 1, 1,
0.9497517, -0.8340918, 2.104612, 0.9215686, 0, 1, 1,
0.9646688, 1.538488, 1.308474, 0.9254902, 0, 1, 1,
0.9657109, -0.420336, 1.655953, 0.9333333, 0, 1, 1,
0.9694092, 0.5655467, 0.9063492, 0.9372549, 0, 1, 1,
0.9729797, -1.169743, 4.873644, 0.945098, 0, 1, 1,
0.9735844, 0.8847846, 1.562538, 0.9490196, 0, 1, 1,
0.9804531, -0.3758196, 2.412752, 0.9568627, 0, 1, 1,
0.9813491, 0.1457069, 0.7894686, 0.9607843, 0, 1, 1,
0.985115, 0.4124339, -0.4298462, 0.9686275, 0, 1, 1,
0.9862462, 0.7504939, 0.4149766, 0.972549, 0, 1, 1,
0.9911059, -0.9256169, 3.230938, 0.9803922, 0, 1, 1,
0.9925694, 0.09329408, 0.9734521, 0.9843137, 0, 1, 1,
0.9935878, 0.05520041, 1.376754, 0.9921569, 0, 1, 1,
0.9942853, -0.4396249, 0.8892331, 0.9960784, 0, 1, 1,
0.9948151, 0.6547235, 0.4183259, 1, 0, 0.9960784, 1,
0.9970785, 2.470689, -0.1376062, 1, 0, 0.9882353, 1,
1.01282, -0.8771756, 2.572831, 1, 0, 0.9843137, 1,
1.013773, 0.4250593, -0.3077483, 1, 0, 0.9764706, 1,
1.01384, -0.2823057, 3.097721, 1, 0, 0.972549, 1,
1.014867, 0.9005173, 0.5968038, 1, 0, 0.9647059, 1,
1.015218, 0.009763438, 1.922765, 1, 0, 0.9607843, 1,
1.019896, 1.254849, 1.521623, 1, 0, 0.9529412, 1,
1.021421, -1.081074, 1.712007, 1, 0, 0.9490196, 1,
1.027948, -0.5246067, 2.407426, 1, 0, 0.9411765, 1,
1.029395, 1.731594, 1.269587, 1, 0, 0.9372549, 1,
1.030821, 0.5185367, 1.115764, 1, 0, 0.9294118, 1,
1.037871, -0.9433349, 3.150726, 1, 0, 0.9254902, 1,
1.038751, -1.721264, 2.794736, 1, 0, 0.9176471, 1,
1.044998, -0.3499765, 0.7202199, 1, 0, 0.9137255, 1,
1.045102, -0.7055767, 3.011491, 1, 0, 0.9058824, 1,
1.047419, -0.2392796, 0.4327046, 1, 0, 0.9019608, 1,
1.048129, -0.9346756, 1.406915, 1, 0, 0.8941177, 1,
1.050587, 0.2503815, 0.7403286, 1, 0, 0.8862745, 1,
1.05891, 1.993594, 0.2382456, 1, 0, 0.8823529, 1,
1.059957, 0.7868991, 0.7476808, 1, 0, 0.8745098, 1,
1.062482, 1.012601, -0.7075184, 1, 0, 0.8705882, 1,
1.070912, -0.8408793, 1.659673, 1, 0, 0.8627451, 1,
1.082484, -0.1865835, 1.7926, 1, 0, 0.8588235, 1,
1.089988, 0.3899341, 1.679061, 1, 0, 0.8509804, 1,
1.091659, 2.35109, -0.1109904, 1, 0, 0.8470588, 1,
1.09296, -0.4531198, 3.300534, 1, 0, 0.8392157, 1,
1.097012, 0.9084668, 0.01230068, 1, 0, 0.8352941, 1,
1.109419, -0.2866552, 2.059367, 1, 0, 0.827451, 1,
1.110556, 1.585503, -0.1928391, 1, 0, 0.8235294, 1,
1.120524, -2.074727, 2.352603, 1, 0, 0.8156863, 1,
1.121882, -0.9370003, -0.1087187, 1, 0, 0.8117647, 1,
1.124964, 1.454434, -0.3923427, 1, 0, 0.8039216, 1,
1.127321, -0.4915382, 0.9234861, 1, 0, 0.7960784, 1,
1.131225, -0.6663655, 0.5749432, 1, 0, 0.7921569, 1,
1.131743, 0.09728177, 2.340174, 1, 0, 0.7843137, 1,
1.14259, 2.327641, 0.3529043, 1, 0, 0.7803922, 1,
1.145169, 0.1822533, 4.16078, 1, 0, 0.772549, 1,
1.146606, -0.05488146, 1.877791, 1, 0, 0.7686275, 1,
1.152019, 0.7881786, 1.639884, 1, 0, 0.7607843, 1,
1.156165, 0.04858688, 2.280169, 1, 0, 0.7568628, 1,
1.15669, -1.459125, 3.163629, 1, 0, 0.7490196, 1,
1.161142, -0.2041778, 3.301172, 1, 0, 0.7450981, 1,
1.162268, -1.473711, 1.875801, 1, 0, 0.7372549, 1,
1.168969, 0.4152446, 1.727673, 1, 0, 0.7333333, 1,
1.171059, 0.1284351, 2.45748, 1, 0, 0.7254902, 1,
1.19295, 0.9320389, 2.001754, 1, 0, 0.7215686, 1,
1.198323, -0.4245588, 1.297818, 1, 0, 0.7137255, 1,
1.208491, -0.4849841, -0.7827319, 1, 0, 0.7098039, 1,
1.212945, -1.557614, 3.192301, 1, 0, 0.7019608, 1,
1.214205, 0.4491344, 1.855429, 1, 0, 0.6941177, 1,
1.21427, -0.8359646, 2.404413, 1, 0, 0.6901961, 1,
1.215673, 0.4113476, 0.6487275, 1, 0, 0.682353, 1,
1.21815, 0.5163153, 2.431583, 1, 0, 0.6784314, 1,
1.22885, 1.389353, 0.5609818, 1, 0, 0.6705883, 1,
1.23305, -0.719777, 2.374693, 1, 0, 0.6666667, 1,
1.253757, 0.3531224, 2.306765, 1, 0, 0.6588235, 1,
1.253924, 0.5475954, 2.313121, 1, 0, 0.654902, 1,
1.258282, 0.1441583, 0.8243564, 1, 0, 0.6470588, 1,
1.260282, 1.427113, 0.9553754, 1, 0, 0.6431373, 1,
1.267833, 0.7676842, 2.477033, 1, 0, 0.6352941, 1,
1.277403, -1.525199, 1.579286, 1, 0, 0.6313726, 1,
1.280403, 1.206831, -0.4268773, 1, 0, 0.6235294, 1,
1.285539, -0.09946748, 1.81182, 1, 0, 0.6196079, 1,
1.297166, -2.064217, 3.492712, 1, 0, 0.6117647, 1,
1.302595, 0.9894128, -0.02214236, 1, 0, 0.6078432, 1,
1.315189, -0.2814084, 2.575596, 1, 0, 0.6, 1,
1.323294, -0.7050658, 2.597865, 1, 0, 0.5921569, 1,
1.352582, -1.488533, 2.294447, 1, 0, 0.5882353, 1,
1.363297, 1.024936, 0.1415952, 1, 0, 0.5803922, 1,
1.365515, -0.182913, 2.222587, 1, 0, 0.5764706, 1,
1.366066, -1.243713, 2.429248, 1, 0, 0.5686275, 1,
1.373607, 0.03034692, 1.598728, 1, 0, 0.5647059, 1,
1.377421, 0.1492123, 2.118102, 1, 0, 0.5568628, 1,
1.377614, 0.2817733, 0.4604373, 1, 0, 0.5529412, 1,
1.378926, 0.9772909, 1.200045, 1, 0, 0.5450981, 1,
1.387781, -0.2613457, 1.826456, 1, 0, 0.5411765, 1,
1.388707, -0.08326711, 2.176903, 1, 0, 0.5333334, 1,
1.395068, -0.7799813, 1.886153, 1, 0, 0.5294118, 1,
1.395572, -0.2080756, 3.526166, 1, 0, 0.5215687, 1,
1.396914, 1.14569, 0.8606741, 1, 0, 0.5176471, 1,
1.400878, -0.5036017, 1.932691, 1, 0, 0.509804, 1,
1.411373, -1.119057, 4.223205, 1, 0, 0.5058824, 1,
1.413982, 1.063727, 1.276564, 1, 0, 0.4980392, 1,
1.415409, 1.771924, 1.743219, 1, 0, 0.4901961, 1,
1.420903, -0.5981885, 2.325615, 1, 0, 0.4862745, 1,
1.425067, 1.904801, -0.3274609, 1, 0, 0.4784314, 1,
1.426384, 1.305399, 0.1414214, 1, 0, 0.4745098, 1,
1.43509, -0.4848844, -0.1134771, 1, 0, 0.4666667, 1,
1.436727, -0.7524107, 2.888866, 1, 0, 0.4627451, 1,
1.437206, 0.755803, 1.262473, 1, 0, 0.454902, 1,
1.443286, 1.047444, -0.9935415, 1, 0, 0.4509804, 1,
1.465165, -0.3890945, 2.770949, 1, 0, 0.4431373, 1,
1.474542, 1.42438, 1.271615, 1, 0, 0.4392157, 1,
1.490339, -0.361383, 3.106146, 1, 0, 0.4313726, 1,
1.491545, -0.411909, 1.971938, 1, 0, 0.427451, 1,
1.511839, 0.901709, 2.533079, 1, 0, 0.4196078, 1,
1.528046, -1.293528, 1.60426, 1, 0, 0.4156863, 1,
1.533138, -1.752503, 2.532766, 1, 0, 0.4078431, 1,
1.543365, -0.644141, 3.030185, 1, 0, 0.4039216, 1,
1.553189, 0.1560509, 1.83018, 1, 0, 0.3960784, 1,
1.554546, -1.171851, 0.6626024, 1, 0, 0.3882353, 1,
1.584861, 0.2657956, 2.706406, 1, 0, 0.3843137, 1,
1.585521, 0.315951, 0.5176298, 1, 0, 0.3764706, 1,
1.589202, 0.2229093, 2.17763, 1, 0, 0.372549, 1,
1.591388, 1.654678, -0.2387763, 1, 0, 0.3647059, 1,
1.612762, -0.1157915, -0.1934434, 1, 0, 0.3607843, 1,
1.61333, -0.9309876, 0.4967925, 1, 0, 0.3529412, 1,
1.615927, 0.5862773, -0.6948607, 1, 0, 0.3490196, 1,
1.618164, 0.7286196, 0.8670787, 1, 0, 0.3411765, 1,
1.638881, 0.3151761, 1.808999, 1, 0, 0.3372549, 1,
1.639778, -1.433521, 1.835722, 1, 0, 0.3294118, 1,
1.650086, -0.1777447, 2.136933, 1, 0, 0.3254902, 1,
1.654338, 1.008986, 0.7762986, 1, 0, 0.3176471, 1,
1.669449, 0.3024933, 0.4999003, 1, 0, 0.3137255, 1,
1.674959, -0.9169227, 2.088733, 1, 0, 0.3058824, 1,
1.694379, 0.553638, 0.5101788, 1, 0, 0.2980392, 1,
1.696391, -2.239505, 0.3842636, 1, 0, 0.2941177, 1,
1.700754, 0.7938629, 1.333342, 1, 0, 0.2862745, 1,
1.72999, 0.2081287, 0.5777082, 1, 0, 0.282353, 1,
1.730422, -0.2207408, 0.8167021, 1, 0, 0.2745098, 1,
1.732889, 0.1261723, 2.470242, 1, 0, 0.2705882, 1,
1.750417, -0.4911026, 2.673441, 1, 0, 0.2627451, 1,
1.757469, -1.197494, 2.435093, 1, 0, 0.2588235, 1,
1.80267, -2.591891, 3.443278, 1, 0, 0.2509804, 1,
1.812669, -0.8863293, 4.034506, 1, 0, 0.2470588, 1,
1.817011, 1.777011, 2.537177, 1, 0, 0.2392157, 1,
1.823086, -1.83246, 2.00589, 1, 0, 0.2352941, 1,
1.83778, -0.581672, 4.205457, 1, 0, 0.227451, 1,
1.844733, 0.8103542, 0.8079119, 1, 0, 0.2235294, 1,
1.853977, -0.4933059, 0.6348268, 1, 0, 0.2156863, 1,
1.862078, -1.898444, -0.1028351, 1, 0, 0.2117647, 1,
1.862854, 0.7342523, 0.8733334, 1, 0, 0.2039216, 1,
1.890003, -1.96171, 2.826039, 1, 0, 0.1960784, 1,
1.898361, -0.7332023, 2.68481, 1, 0, 0.1921569, 1,
1.925584, 0.1646958, 1.527022, 1, 0, 0.1843137, 1,
1.932009, 1.514944, 0.767063, 1, 0, 0.1803922, 1,
1.942822, -0.444741, 0.558275, 1, 0, 0.172549, 1,
1.976322, -0.2159933, 1.386903, 1, 0, 0.1686275, 1,
1.980719, -1.677296, 2.046867, 1, 0, 0.1607843, 1,
1.985824, -1.558792, 0.5317037, 1, 0, 0.1568628, 1,
1.989279, 0.3571267, 1.529206, 1, 0, 0.1490196, 1,
2.025541, 0.6482958, 1.164938, 1, 0, 0.145098, 1,
2.066442, 1.394709, 2.725919, 1, 0, 0.1372549, 1,
2.142861, -0.69689, 1.862022, 1, 0, 0.1333333, 1,
2.171665, -0.6942887, 3.802704, 1, 0, 0.1254902, 1,
2.204062, -0.334666, 1.026273, 1, 0, 0.1215686, 1,
2.237139, -0.8135628, 0.9835732, 1, 0, 0.1137255, 1,
2.24209, -0.2458671, 3.117499, 1, 0, 0.1098039, 1,
2.247987, 1.111756, 2.982686, 1, 0, 0.1019608, 1,
2.274273, -0.5873948, 4.053911, 1, 0, 0.09411765, 1,
2.298146, 1.209425, 0.7442726, 1, 0, 0.09019608, 1,
2.327331, 0.3587604, 2.148674, 1, 0, 0.08235294, 1,
2.335203, -0.3361863, 3.428502, 1, 0, 0.07843138, 1,
2.339671, -0.9070994, 2.333811, 1, 0, 0.07058824, 1,
2.410671, 0.5335119, 2.10425, 1, 0, 0.06666667, 1,
2.420135, 1.946737, 1.619066, 1, 0, 0.05882353, 1,
2.507552, 1.920425, 1.101307, 1, 0, 0.05490196, 1,
2.51079, -0.3413125, 3.015146, 1, 0, 0.04705882, 1,
2.567947, -1.518807, 1.905777, 1, 0, 0.04313726, 1,
2.600277, -0.164718, 2.041203, 1, 0, 0.03529412, 1,
2.611252, 0.2468289, -0.2421152, 1, 0, 0.03137255, 1,
2.637895, 0.7932518, 2.601887, 1, 0, 0.02352941, 1,
2.638452, 1.076255, 1.901338, 1, 0, 0.01960784, 1,
3.413799, -0.873809, 1.285701, 1, 0, 0.01176471, 1,
3.541885, -0.2498182, 0.6585841, 1, 0, 0.007843138, 1
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
0.2383809, -4.312548, -7.002707, 0, -0.5, 0.5, 0.5,
0.2383809, -4.312548, -7.002707, 1, -0.5, 0.5, 0.5,
0.2383809, -4.312548, -7.002707, 1, 1.5, 0.5, 0.5,
0.2383809, -4.312548, -7.002707, 0, 1.5, 0.5, 0.5
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
-4.185011, -0.03277695, -7.002707, 0, -0.5, 0.5, 0.5,
-4.185011, -0.03277695, -7.002707, 1, -0.5, 0.5, 0.5,
-4.185011, -0.03277695, -7.002707, 1, 1.5, 0.5, 0.5,
-4.185011, -0.03277695, -7.002707, 0, 1.5, 0.5, 0.5
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
-4.185011, -4.312548, -0.07764912, 0, -0.5, 0.5, 0.5,
-4.185011, -4.312548, -0.07764912, 1, -0.5, 0.5, 0.5,
-4.185011, -4.312548, -0.07764912, 1, 1.5, 0.5, 0.5,
-4.185011, -4.312548, -0.07764912, 0, 1.5, 0.5, 0.5
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
-3, -3.324909, -5.404616,
3, -3.324909, -5.404616,
-3, -3.324909, -5.404616,
-3, -3.489515, -5.670965,
-2, -3.324909, -5.404616,
-2, -3.489515, -5.670965,
-1, -3.324909, -5.404616,
-1, -3.489515, -5.670965,
0, -3.324909, -5.404616,
0, -3.489515, -5.670965,
1, -3.324909, -5.404616,
1, -3.489515, -5.670965,
2, -3.324909, -5.404616,
2, -3.489515, -5.670965,
3, -3.324909, -5.404616,
3, -3.489515, -5.670965
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
-3, -3.818728, -6.203661, 0, -0.5, 0.5, 0.5,
-3, -3.818728, -6.203661, 1, -0.5, 0.5, 0.5,
-3, -3.818728, -6.203661, 1, 1.5, 0.5, 0.5,
-3, -3.818728, -6.203661, 0, 1.5, 0.5, 0.5,
-2, -3.818728, -6.203661, 0, -0.5, 0.5, 0.5,
-2, -3.818728, -6.203661, 1, -0.5, 0.5, 0.5,
-2, -3.818728, -6.203661, 1, 1.5, 0.5, 0.5,
-2, -3.818728, -6.203661, 0, 1.5, 0.5, 0.5,
-1, -3.818728, -6.203661, 0, -0.5, 0.5, 0.5,
-1, -3.818728, -6.203661, 1, -0.5, 0.5, 0.5,
-1, -3.818728, -6.203661, 1, 1.5, 0.5, 0.5,
-1, -3.818728, -6.203661, 0, 1.5, 0.5, 0.5,
0, -3.818728, -6.203661, 0, -0.5, 0.5, 0.5,
0, -3.818728, -6.203661, 1, -0.5, 0.5, 0.5,
0, -3.818728, -6.203661, 1, 1.5, 0.5, 0.5,
0, -3.818728, -6.203661, 0, 1.5, 0.5, 0.5,
1, -3.818728, -6.203661, 0, -0.5, 0.5, 0.5,
1, -3.818728, -6.203661, 1, -0.5, 0.5, 0.5,
1, -3.818728, -6.203661, 1, 1.5, 0.5, 0.5,
1, -3.818728, -6.203661, 0, 1.5, 0.5, 0.5,
2, -3.818728, -6.203661, 0, -0.5, 0.5, 0.5,
2, -3.818728, -6.203661, 1, -0.5, 0.5, 0.5,
2, -3.818728, -6.203661, 1, 1.5, 0.5, 0.5,
2, -3.818728, -6.203661, 0, 1.5, 0.5, 0.5,
3, -3.818728, -6.203661, 0, -0.5, 0.5, 0.5,
3, -3.818728, -6.203661, 1, -0.5, 0.5, 0.5,
3, -3.818728, -6.203661, 1, 1.5, 0.5, 0.5,
3, -3.818728, -6.203661, 0, 1.5, 0.5, 0.5
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
-3.164228, -3, -5.404616,
-3.164228, 3, -5.404616,
-3.164228, -3, -5.404616,
-3.334359, -3, -5.670965,
-3.164228, -2, -5.404616,
-3.334359, -2, -5.670965,
-3.164228, -1, -5.404616,
-3.334359, -1, -5.670965,
-3.164228, 0, -5.404616,
-3.334359, 0, -5.670965,
-3.164228, 1, -5.404616,
-3.334359, 1, -5.670965,
-3.164228, 2, -5.404616,
-3.334359, 2, -5.670965,
-3.164228, 3, -5.404616,
-3.334359, 3, -5.670965
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
-3.67462, -3, -6.203661, 0, -0.5, 0.5, 0.5,
-3.67462, -3, -6.203661, 1, -0.5, 0.5, 0.5,
-3.67462, -3, -6.203661, 1, 1.5, 0.5, 0.5,
-3.67462, -3, -6.203661, 0, 1.5, 0.5, 0.5,
-3.67462, -2, -6.203661, 0, -0.5, 0.5, 0.5,
-3.67462, -2, -6.203661, 1, -0.5, 0.5, 0.5,
-3.67462, -2, -6.203661, 1, 1.5, 0.5, 0.5,
-3.67462, -2, -6.203661, 0, 1.5, 0.5, 0.5,
-3.67462, -1, -6.203661, 0, -0.5, 0.5, 0.5,
-3.67462, -1, -6.203661, 1, -0.5, 0.5, 0.5,
-3.67462, -1, -6.203661, 1, 1.5, 0.5, 0.5,
-3.67462, -1, -6.203661, 0, 1.5, 0.5, 0.5,
-3.67462, 0, -6.203661, 0, -0.5, 0.5, 0.5,
-3.67462, 0, -6.203661, 1, -0.5, 0.5, 0.5,
-3.67462, 0, -6.203661, 1, 1.5, 0.5, 0.5,
-3.67462, 0, -6.203661, 0, 1.5, 0.5, 0.5,
-3.67462, 1, -6.203661, 0, -0.5, 0.5, 0.5,
-3.67462, 1, -6.203661, 1, -0.5, 0.5, 0.5,
-3.67462, 1, -6.203661, 1, 1.5, 0.5, 0.5,
-3.67462, 1, -6.203661, 0, 1.5, 0.5, 0.5,
-3.67462, 2, -6.203661, 0, -0.5, 0.5, 0.5,
-3.67462, 2, -6.203661, 1, -0.5, 0.5, 0.5,
-3.67462, 2, -6.203661, 1, 1.5, 0.5, 0.5,
-3.67462, 2, -6.203661, 0, 1.5, 0.5, 0.5,
-3.67462, 3, -6.203661, 0, -0.5, 0.5, 0.5,
-3.67462, 3, -6.203661, 1, -0.5, 0.5, 0.5,
-3.67462, 3, -6.203661, 1, 1.5, 0.5, 0.5,
-3.67462, 3, -6.203661, 0, 1.5, 0.5, 0.5
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
-3.164228, -3.324909, -4,
-3.164228, -3.324909, 4,
-3.164228, -3.324909, -4,
-3.334359, -3.489515, -4,
-3.164228, -3.324909, -2,
-3.334359, -3.489515, -2,
-3.164228, -3.324909, 0,
-3.334359, -3.489515, 0,
-3.164228, -3.324909, 2,
-3.334359, -3.489515, 2,
-3.164228, -3.324909, 4,
-3.334359, -3.489515, 4
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
-3.67462, -3.818728, -4, 0, -0.5, 0.5, 0.5,
-3.67462, -3.818728, -4, 1, -0.5, 0.5, 0.5,
-3.67462, -3.818728, -4, 1, 1.5, 0.5, 0.5,
-3.67462, -3.818728, -4, 0, 1.5, 0.5, 0.5,
-3.67462, -3.818728, -2, 0, -0.5, 0.5, 0.5,
-3.67462, -3.818728, -2, 1, -0.5, 0.5, 0.5,
-3.67462, -3.818728, -2, 1, 1.5, 0.5, 0.5,
-3.67462, -3.818728, -2, 0, 1.5, 0.5, 0.5,
-3.67462, -3.818728, 0, 0, -0.5, 0.5, 0.5,
-3.67462, -3.818728, 0, 1, -0.5, 0.5, 0.5,
-3.67462, -3.818728, 0, 1, 1.5, 0.5, 0.5,
-3.67462, -3.818728, 0, 0, 1.5, 0.5, 0.5,
-3.67462, -3.818728, 2, 0, -0.5, 0.5, 0.5,
-3.67462, -3.818728, 2, 1, -0.5, 0.5, 0.5,
-3.67462, -3.818728, 2, 1, 1.5, 0.5, 0.5,
-3.67462, -3.818728, 2, 0, 1.5, 0.5, 0.5,
-3.67462, -3.818728, 4, 0, -0.5, 0.5, 0.5,
-3.67462, -3.818728, 4, 1, -0.5, 0.5, 0.5,
-3.67462, -3.818728, 4, 1, 1.5, 0.5, 0.5,
-3.67462, -3.818728, 4, 0, 1.5, 0.5, 0.5
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
-3.164228, -3.324909, -5.404616,
-3.164228, 3.259355, -5.404616,
-3.164228, -3.324909, 5.249318,
-3.164228, 3.259355, 5.249318,
-3.164228, -3.324909, -5.404616,
-3.164228, -3.324909, 5.249318,
-3.164228, 3.259355, -5.404616,
-3.164228, 3.259355, 5.249318,
-3.164228, -3.324909, -5.404616,
3.64099, -3.324909, -5.404616,
-3.164228, -3.324909, 5.249318,
3.64099, -3.324909, 5.249318,
-3.164228, 3.259355, -5.404616,
3.64099, 3.259355, -5.404616,
-3.164228, 3.259355, 5.249318,
3.64099, 3.259355, 5.249318,
3.64099, -3.324909, -5.404616,
3.64099, 3.259355, -5.404616,
3.64099, -3.324909, 5.249318,
3.64099, 3.259355, 5.249318,
3.64099, -3.324909, -5.404616,
3.64099, -3.324909, 5.249318,
3.64099, 3.259355, -5.404616,
3.64099, 3.259355, 5.249318
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
var radius = 7.611234;
var distance = 33.86324;
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
mvMatrix.translate( -0.2383809, 0.03277695, 0.07764912 );
mvMatrix.scale( 1.20928, 1.249861, 0.7724297 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.86324);
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
Cadusafos<-read.table("Cadusafos.xyz")
```

```
## Error in read.table("Cadusafos.xyz"): no lines available in input
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
-3.065123, -0.7646319, -2.060036, 0, 0, 1, 1, 1,
-2.87134, 0.04940967, -0.8853815, 1, 0, 0, 1, 1,
-2.78775, 1.341637, -0.4940832, 1, 0, 0, 1, 1,
-2.764434, 0.9619999, -1.198146, 1, 0, 0, 1, 1,
-2.609051, 0.2818815, -1.896096, 1, 0, 0, 1, 1,
-2.601745, -1.096867, -1.273335, 1, 0, 0, 1, 1,
-2.542912, -1.155126, -2.270626, 0, 0, 0, 1, 1,
-2.541289, 1.712393, -0.5874009, 0, 0, 0, 1, 1,
-2.444139, 0.07055226, 0.5060651, 0, 0, 0, 1, 1,
-2.437616, 0.6848935, -1.484363, 0, 0, 0, 1, 1,
-2.393009, -0.231247, -1.749541, 0, 0, 0, 1, 1,
-2.362564, -1.45567, -2.250296, 0, 0, 0, 1, 1,
-2.358027, 0.1172082, -0.4638464, 0, 0, 0, 1, 1,
-2.357947, 1.166591, -0.8046882, 1, 1, 1, 1, 1,
-2.335825, 0.369226, -0.9121091, 1, 1, 1, 1, 1,
-2.265671, -0.3388925, -2.575281, 1, 1, 1, 1, 1,
-2.260955, -0.1467836, -1.482095, 1, 1, 1, 1, 1,
-2.258355, -0.6649323, -2.858382, 1, 1, 1, 1, 1,
-2.244851, 1.341239, -1.666139, 1, 1, 1, 1, 1,
-2.238666, -0.2605041, -0.5453643, 1, 1, 1, 1, 1,
-2.225999, 1.097069, -1.475996, 1, 1, 1, 1, 1,
-2.219285, 0.6817609, -1.961207, 1, 1, 1, 1, 1,
-2.148592, 0.7778808, -1.774568, 1, 1, 1, 1, 1,
-2.130205, 1.547761, 0.5601128, 1, 1, 1, 1, 1,
-2.086567, -0.3273171, -1.846052, 1, 1, 1, 1, 1,
-2.071509, -1.409151, -2.676879, 1, 1, 1, 1, 1,
-2.058982, 0.5287379, -1.854666, 1, 1, 1, 1, 1,
-2.055613, 0.6412975, -1.277135, 1, 1, 1, 1, 1,
-2.028432, 0.152443, -1.358851, 0, 0, 1, 1, 1,
-2.003566, -1.071386, -3.016688, 1, 0, 0, 1, 1,
-1.997606, -0.3360097, -2.224223, 1, 0, 0, 1, 1,
-1.99033, -1.218428, -1.441974, 1, 0, 0, 1, 1,
-1.988837, 2.653987, -1.566248, 1, 0, 0, 1, 1,
-1.985352, 0.8170335, -0.484813, 1, 0, 0, 1, 1,
-1.984985, 1.194959, -0.8367432, 0, 0, 0, 1, 1,
-1.981033, 0.680468, 0.2719512, 0, 0, 0, 1, 1,
-1.920175, -0.3216445, -0.5844784, 0, 0, 0, 1, 1,
-1.889383, -0.1946182, -2.829204, 0, 0, 0, 1, 1,
-1.886916, -0.4864621, -2.441221, 0, 0, 0, 1, 1,
-1.877954, -0.03504282, -1.851244, 0, 0, 0, 1, 1,
-1.853491, 0.5405691, -1.139218, 0, 0, 0, 1, 1,
-1.847448, 0.3321785, -2.11219, 1, 1, 1, 1, 1,
-1.845366, -0.5161588, -0.688197, 1, 1, 1, 1, 1,
-1.84453, 1.170225, -0.8600803, 1, 1, 1, 1, 1,
-1.828157, 0.9868425, -1.768329, 1, 1, 1, 1, 1,
-1.797639, -0.1332464, -2.355191, 1, 1, 1, 1, 1,
-1.761255, -0.2564788, -0.7164846, 1, 1, 1, 1, 1,
-1.749071, 0.9070961, -2.861951, 1, 1, 1, 1, 1,
-1.743603, -0.2591634, -1.711682, 1, 1, 1, 1, 1,
-1.730478, 0.3331941, -0.03856453, 1, 1, 1, 1, 1,
-1.721307, -0.6905268, -2.559668, 1, 1, 1, 1, 1,
-1.718798, -0.1668859, -0.6459581, 1, 1, 1, 1, 1,
-1.716009, 0.7417167, 0.3298658, 1, 1, 1, 1, 1,
-1.6921, -0.09130205, -2.36189, 1, 1, 1, 1, 1,
-1.691005, -0.6985575, -1.543606, 1, 1, 1, 1, 1,
-1.684844, -1.806922, -2.168161, 1, 1, 1, 1, 1,
-1.66995, 0.007094868, -0.3652768, 0, 0, 1, 1, 1,
-1.66713, -0.4167296, -0.826674, 1, 0, 0, 1, 1,
-1.630504, 2.386803, 0.8543013, 1, 0, 0, 1, 1,
-1.61288, -0.1735075, -2.679448, 1, 0, 0, 1, 1,
-1.600275, 2.061926, -2.583249, 1, 0, 0, 1, 1,
-1.590382, -0.9835176, -1.883945, 1, 0, 0, 1, 1,
-1.58648, -0.1456874, -0.7769852, 0, 0, 0, 1, 1,
-1.564381, -0.2968819, -1.029011, 0, 0, 0, 1, 1,
-1.559007, -1.025084, -1.169607, 0, 0, 0, 1, 1,
-1.558956, -0.04308698, -2.331576, 0, 0, 0, 1, 1,
-1.553503, 0.7913787, 0.8699473, 0, 0, 0, 1, 1,
-1.550599, 0.4349463, -1.920537, 0, 0, 0, 1, 1,
-1.549433, 0.3974217, -0.5619313, 0, 0, 0, 1, 1,
-1.549043, 0.9277936, -1.427142, 1, 1, 1, 1, 1,
-1.538907, -0.6045493, -1.50446, 1, 1, 1, 1, 1,
-1.528557, 1.365099, -2.290252, 1, 1, 1, 1, 1,
-1.527965, -0.7986023, -1.429647, 1, 1, 1, 1, 1,
-1.521577, 1.068805, 0.295642, 1, 1, 1, 1, 1,
-1.519234, 1.067269, 0.03796316, 1, 1, 1, 1, 1,
-1.51778, -0.7101485, -0.6650506, 1, 1, 1, 1, 1,
-1.508513, -0.6330369, -1.183616, 1, 1, 1, 1, 1,
-1.50477, 1.457883, -0.7657108, 1, 1, 1, 1, 1,
-1.497477, -0.9908109, -2.319954, 1, 1, 1, 1, 1,
-1.492323, 0.001312388, -1.890803, 1, 1, 1, 1, 1,
-1.482316, -1.500351, -1.699482, 1, 1, 1, 1, 1,
-1.480137, -0.4207964, -1.23266, 1, 1, 1, 1, 1,
-1.474127, 0.9815397, -1.673469, 1, 1, 1, 1, 1,
-1.469497, 1.796461, -1.042335, 1, 1, 1, 1, 1,
-1.459919, 1.626129, 0.6595, 0, 0, 1, 1, 1,
-1.455682, -0.2792848, -1.463445, 1, 0, 0, 1, 1,
-1.449602, 0.6658076, -3.796398, 1, 0, 0, 1, 1,
-1.44816, 0.8462991, -1.689931, 1, 0, 0, 1, 1,
-1.441924, -1.339482, -2.477386, 1, 0, 0, 1, 1,
-1.441216, -0.09055112, -1.535273, 1, 0, 0, 1, 1,
-1.440977, -1.126864, -2.227133, 0, 0, 0, 1, 1,
-1.418874, 1.653935, 0.06656266, 0, 0, 0, 1, 1,
-1.392942, -2.113612, -3.868117, 0, 0, 0, 1, 1,
-1.362303, -2.051267, -2.736909, 0, 0, 0, 1, 1,
-1.360893, 0.8891521, -0.9415377, 0, 0, 0, 1, 1,
-1.360168, -0.2437819, -1.02817, 0, 0, 0, 1, 1,
-1.357841, 2.106196, -2.053878, 0, 0, 0, 1, 1,
-1.355494, 1.204202, -0.4697358, 1, 1, 1, 1, 1,
-1.351534, -0.4464274, -1.290954, 1, 1, 1, 1, 1,
-1.351199, -0.09570747, -4.349084, 1, 1, 1, 1, 1,
-1.346233, -0.9092941, -3.184813, 1, 1, 1, 1, 1,
-1.345945, -0.9090523, -1.867076, 1, 1, 1, 1, 1,
-1.345833, -0.6001438, -2.487965, 1, 1, 1, 1, 1,
-1.345676, 2.219198, -0.8194126, 1, 1, 1, 1, 1,
-1.343677, 0.03695849, -1.279192, 1, 1, 1, 1, 1,
-1.339952, -0.15407, -0.2464317, 1, 1, 1, 1, 1,
-1.322842, -0.710428, -2.5539, 1, 1, 1, 1, 1,
-1.302156, -1.830187, -3.22105, 1, 1, 1, 1, 1,
-1.300314, -0.2207611, -4.600714, 1, 1, 1, 1, 1,
-1.298681, -0.5106746, -0.2849085, 1, 1, 1, 1, 1,
-1.297971, 1.941687, -1.637329, 1, 1, 1, 1, 1,
-1.294584, 0.356945, -1.235899, 1, 1, 1, 1, 1,
-1.277945, 1.450716, 0.4506929, 0, 0, 1, 1, 1,
-1.261337, 1.065639, -0.07102893, 1, 0, 0, 1, 1,
-1.25501, -1.743122, -4.24548, 1, 0, 0, 1, 1,
-1.244379, 0.6077201, -1.89671, 1, 0, 0, 1, 1,
-1.244215, -0.1407458, -1.949866, 1, 0, 0, 1, 1,
-1.242725, -0.05185722, -0.2606813, 1, 0, 0, 1, 1,
-1.235989, 0.5180529, -2.513062, 0, 0, 0, 1, 1,
-1.232206, 1.041982, -0.978842, 0, 0, 0, 1, 1,
-1.218161, 2.069958, -0.4431636, 0, 0, 0, 1, 1,
-1.216393, -1.325271, -2.059296, 0, 0, 0, 1, 1,
-1.214968, 0.3211066, -1.945132, 0, 0, 0, 1, 1,
-1.214376, -0.4449824, -0.5350781, 0, 0, 0, 1, 1,
-1.208473, -0.6470755, -3.023283, 0, 0, 0, 1, 1,
-1.20592, -1.01585, -3.809628, 1, 1, 1, 1, 1,
-1.204355, -1.490215, -2.25239, 1, 1, 1, 1, 1,
-1.201736, -0.6753104, -3.114308, 1, 1, 1, 1, 1,
-1.199871, -0.6890208, -0.4884512, 1, 1, 1, 1, 1,
-1.190903, -1.959243, -2.118883, 1, 1, 1, 1, 1,
-1.190895, 2.086791, 0.9032664, 1, 1, 1, 1, 1,
-1.189885, 0.6513408, -0.5254681, 1, 1, 1, 1, 1,
-1.186572, 2.171479, -1.584819, 1, 1, 1, 1, 1,
-1.183942, 0.3480599, -1.640324, 1, 1, 1, 1, 1,
-1.163565, 0.1312215, -0.655786, 1, 1, 1, 1, 1,
-1.152236, 0.3684988, -1.920812, 1, 1, 1, 1, 1,
-1.148898, 1.156815, -0.607489, 1, 1, 1, 1, 1,
-1.148692, 0.7012754, 0.9595079, 1, 1, 1, 1, 1,
-1.141209, -0.1523807, -0.7061574, 1, 1, 1, 1, 1,
-1.140649, -0.2105231, -2.386304, 1, 1, 1, 1, 1,
-1.131929, 1.09036, -1.849635, 0, 0, 1, 1, 1,
-1.127348, 0.9416711, 0.0619125, 1, 0, 0, 1, 1,
-1.122893, -0.0908292, -2.409121, 1, 0, 0, 1, 1,
-1.122172, -0.7261587, -1.616287, 1, 0, 0, 1, 1,
-1.119665, -1.089606, -2.055497, 1, 0, 0, 1, 1,
-1.116727, -1.141175, -3.655559, 1, 0, 0, 1, 1,
-1.1163, -0.9454265, -2.925937, 0, 0, 0, 1, 1,
-1.11357, 0.8115187, -0.316936, 0, 0, 0, 1, 1,
-1.111505, 0.9136834, -2.77892, 0, 0, 0, 1, 1,
-1.110498, 2.496575, 0.1490388, 0, 0, 0, 1, 1,
-1.110481, -0.5533102, -3.127278, 0, 0, 0, 1, 1,
-1.10976, -0.7607173, -2.152853, 0, 0, 0, 1, 1,
-1.10876, -0.8199574, -3.444945, 0, 0, 0, 1, 1,
-1.105503, 0.5915209, -0.103243, 1, 1, 1, 1, 1,
-1.10481, -1.485217, -2.163781, 1, 1, 1, 1, 1,
-1.103598, 0.2735897, -0.5258514, 1, 1, 1, 1, 1,
-1.097942, 1.142405, -0.07154519, 1, 1, 1, 1, 1,
-1.090735, -0.7330874, -2.147029, 1, 1, 1, 1, 1,
-1.081786, 0.01054157, -0.9970567, 1, 1, 1, 1, 1,
-1.077319, -0.4716772, -1.260341, 1, 1, 1, 1, 1,
-1.070422, -1.410844, -1.578372, 1, 1, 1, 1, 1,
-1.070281, 0.8855881, -1.748977, 1, 1, 1, 1, 1,
-1.06434, 0.8073565, -2.064299, 1, 1, 1, 1, 1,
-1.061414, 0.6738861, -0.8411112, 1, 1, 1, 1, 1,
-1.05721, -0.0319159, -2.826521, 1, 1, 1, 1, 1,
-1.055444, 2.26843, -2.280625, 1, 1, 1, 1, 1,
-1.054572, -0.3581284, -2.115928, 1, 1, 1, 1, 1,
-1.051257, 0.6856771, -1.505906, 1, 1, 1, 1, 1,
-1.037306, 1.563688, 0.3360516, 0, 0, 1, 1, 1,
-1.036499, -0.04250072, -1.375062, 1, 0, 0, 1, 1,
-1.033133, -1.670212, -3.329322, 1, 0, 0, 1, 1,
-1.029251, 1.170569, -2.902124, 1, 0, 0, 1, 1,
-1.028374, -2.118327, -2.964699, 1, 0, 0, 1, 1,
-1.02599, -0.1010899, -2.035093, 1, 0, 0, 1, 1,
-1.017007, -0.9456131, -1.14953, 0, 0, 0, 1, 1,
-1.011217, -0.7281221, -1.754332, 0, 0, 0, 1, 1,
-1.010748, 1.49788, -2.146709, 0, 0, 0, 1, 1,
-1.007251, -0.1321807, -0.1767956, 0, 0, 0, 1, 1,
-0.9965491, -0.6068693, -3.42575, 0, 0, 0, 1, 1,
-0.9897662, 0.2297796, -2.420773, 0, 0, 0, 1, 1,
-0.9887836, -1.426457, -2.214508, 0, 0, 0, 1, 1,
-0.9878104, 0.6888753, -0.08632389, 1, 1, 1, 1, 1,
-0.9825936, 0.5299816, -0.7810008, 1, 1, 1, 1, 1,
-0.9767659, 0.06751699, -1.164013, 1, 1, 1, 1, 1,
-0.9649743, -0.5503971, -1.680102, 1, 1, 1, 1, 1,
-0.9598048, 0.5789655, -2.039576, 1, 1, 1, 1, 1,
-0.9573211, 0.6988309, -0.1566854, 1, 1, 1, 1, 1,
-0.9572456, 0.3709085, -3.573385, 1, 1, 1, 1, 1,
-0.9536583, 0.7947885, -1.716209, 1, 1, 1, 1, 1,
-0.9474014, 1.186332, -1.071099, 1, 1, 1, 1, 1,
-0.9400317, -2.695592, -3.462054, 1, 1, 1, 1, 1,
-0.933664, 0.4544142, -0.2508374, 1, 1, 1, 1, 1,
-0.9317285, 1.542708, -1.180248, 1, 1, 1, 1, 1,
-0.9261221, 0.08817398, 0.2786971, 1, 1, 1, 1, 1,
-0.9257896, -0.5861647, -3.29859, 1, 1, 1, 1, 1,
-0.9176561, 0.03894529, 0.4384825, 1, 1, 1, 1, 1,
-0.8996997, -0.5354189, -2.809638, 0, 0, 1, 1, 1,
-0.8962126, -1.104409, -4.11877, 1, 0, 0, 1, 1,
-0.8889114, 1.116046, -0.1601021, 1, 0, 0, 1, 1,
-0.8863667, 0.07359742, -1.367688, 1, 0, 0, 1, 1,
-0.8862103, -0.500269, -1.594531, 1, 0, 0, 1, 1,
-0.8816924, 0.7095963, -0.7583618, 1, 0, 0, 1, 1,
-0.8748602, -0.06784329, -3.201629, 0, 0, 0, 1, 1,
-0.8551961, -0.4193502, -3.282279, 0, 0, 0, 1, 1,
-0.8476006, -1.337993, -0.004838235, 0, 0, 0, 1, 1,
-0.8378558, -0.8670786, -2.948933, 0, 0, 0, 1, 1,
-0.834488, -1.257827, -3.490453, 0, 0, 0, 1, 1,
-0.8273011, 0.7483817, 1.59987, 0, 0, 0, 1, 1,
-0.8200051, -1.609595, -1.787636, 0, 0, 0, 1, 1,
-0.8092666, -0.7031158, -2.810812, 1, 1, 1, 1, 1,
-0.8079937, -2.190822, -3.251946, 1, 1, 1, 1, 1,
-0.8039951, -1.503183, -4.407265, 1, 1, 1, 1, 1,
-0.8012737, -0.5789407, -0.2295304, 1, 1, 1, 1, 1,
-0.8011365, -0.07838836, -2.518621, 1, 1, 1, 1, 1,
-0.7987747, 0.7028359, -1.413686, 1, 1, 1, 1, 1,
-0.7961567, -0.3013759, -0.8204682, 1, 1, 1, 1, 1,
-0.79093, -0.6705838, -0.6018745, 1, 1, 1, 1, 1,
-0.7843636, -2.206969, -3.578109, 1, 1, 1, 1, 1,
-0.7782564, -1.029487, -2.525275, 1, 1, 1, 1, 1,
-0.77428, 2.391699, -0.1998698, 1, 1, 1, 1, 1,
-0.762515, -0.7938362, -0.9182788, 1, 1, 1, 1, 1,
-0.7587535, 0.8764184, 0.3227777, 1, 1, 1, 1, 1,
-0.7580458, 0.3524089, -1.716976, 1, 1, 1, 1, 1,
-0.7467005, 1.364647, -1.195154, 1, 1, 1, 1, 1,
-0.7361438, -0.2918882, -0.8010443, 0, 0, 1, 1, 1,
-0.7320213, -1.26145, -0.374025, 1, 0, 0, 1, 1,
-0.7310023, -0.2838074, -3.682237, 1, 0, 0, 1, 1,
-0.7302217, -1.185923, -4.568011, 1, 0, 0, 1, 1,
-0.7123766, 0.9080318, 0.2777975, 1, 0, 0, 1, 1,
-0.7117691, 0.792237, -0.2979097, 1, 0, 0, 1, 1,
-0.705889, -1.019532, -2.930447, 0, 0, 0, 1, 1,
-0.7041687, -0.5977262, -2.550605, 0, 0, 0, 1, 1,
-0.7009773, 0.6410445, -1.213681, 0, 0, 0, 1, 1,
-0.7000371, 1.775508, -2.077532, 0, 0, 0, 1, 1,
-0.6865211, -0.6440071, -3.718949, 0, 0, 0, 1, 1,
-0.6856546, 0.8985863, -3.3162, 0, 0, 0, 1, 1,
-0.6810682, -0.304066, -2.108748, 0, 0, 0, 1, 1,
-0.6807066, 1.562025, -0.5878252, 1, 1, 1, 1, 1,
-0.6803875, 2.249365, -1.506871, 1, 1, 1, 1, 1,
-0.6776307, -0.3677703, -1.535572, 1, 1, 1, 1, 1,
-0.6668047, 0.1983704, -2.927681, 1, 1, 1, 1, 1,
-0.6660641, -0.9097748, -3.318074, 1, 1, 1, 1, 1,
-0.6604691, 0.2826601, -2.97717, 1, 1, 1, 1, 1,
-0.6587493, 0.7921372, 0.01889155, 1, 1, 1, 1, 1,
-0.6528949, -0.3305026, -0.9643893, 1, 1, 1, 1, 1,
-0.6495134, -1.251893, -2.848496, 1, 1, 1, 1, 1,
-0.6429996, -0.3834011, -2.246407, 1, 1, 1, 1, 1,
-0.6407346, 1.440096, -1.231528, 1, 1, 1, 1, 1,
-0.6399928, -0.5316339, -2.10277, 1, 1, 1, 1, 1,
-0.6372149, -0.3428025, -2.615937, 1, 1, 1, 1, 1,
-0.6368801, 3.163467, 0.2912185, 1, 1, 1, 1, 1,
-0.6280832, -1.677536, -3.166427, 1, 1, 1, 1, 1,
-0.6261557, -0.06914504, -2.497865, 0, 0, 1, 1, 1,
-0.6239429, -0.654105, -2.078849, 1, 0, 0, 1, 1,
-0.6199315, -0.02554718, -2.221833, 1, 0, 0, 1, 1,
-0.6186134, -1.102218, -1.993471, 1, 0, 0, 1, 1,
-0.6165558, -0.7503044, -0.9499677, 1, 0, 0, 1, 1,
-0.6107173, -0.4856296, -2.852035, 1, 0, 0, 1, 1,
-0.6105871, 0.009361272, 0.5146985, 0, 0, 0, 1, 1,
-0.6104056, 1.150385, -1.388045, 0, 0, 0, 1, 1,
-0.6095986, -0.8386343, -2.550244, 0, 0, 0, 1, 1,
-0.6094639, -1.22844, -2.837117, 0, 0, 0, 1, 1,
-0.6074971, -0.03502533, -3.096963, 0, 0, 0, 1, 1,
-0.6013178, 0.5442052, -2.067693, 0, 0, 0, 1, 1,
-0.5998334, -0.2624931, -3.465588, 0, 0, 0, 1, 1,
-0.598037, -1.983279, -2.306788, 1, 1, 1, 1, 1,
-0.5956006, -0.02692096, -1.731465, 1, 1, 1, 1, 1,
-0.5945187, -0.4513478, -3.189133, 1, 1, 1, 1, 1,
-0.5933331, 1.418136, -2.587884, 1, 1, 1, 1, 1,
-0.5918879, 0.7691189, -0.7831606, 1, 1, 1, 1, 1,
-0.5916379, 1.427875, 1.697999, 1, 1, 1, 1, 1,
-0.5911807, -0.5103696, -1.909099, 1, 1, 1, 1, 1,
-0.5893311, 1.812297, -1.040014, 1, 1, 1, 1, 1,
-0.5880381, 0.2573926, -0.5515044, 1, 1, 1, 1, 1,
-0.5822217, 1.667471, -0.3894099, 1, 1, 1, 1, 1,
-0.5764531, 0.2012034, -0.2066442, 1, 1, 1, 1, 1,
-0.5751011, -1.064093, -2.272718, 1, 1, 1, 1, 1,
-0.570412, -1.274736, -3.228615, 1, 1, 1, 1, 1,
-0.5702249, 0.7830289, -1.590895, 1, 1, 1, 1, 1,
-0.5672176, 0.1790991, -1.929024, 1, 1, 1, 1, 1,
-0.5633253, -1.078504, -2.736089, 0, 0, 1, 1, 1,
-0.5616016, -1.005617, -4.258012, 1, 0, 0, 1, 1,
-0.5614893, -0.9108283, -1.281843, 1, 0, 0, 1, 1,
-0.5576567, -1.353547, -3.857409, 1, 0, 0, 1, 1,
-0.5557218, 0.5746071, -2.221527, 1, 0, 0, 1, 1,
-0.5527915, -0.05837398, -0.8970097, 1, 0, 0, 1, 1,
-0.5478888, -1.439359, -2.274441, 0, 0, 0, 1, 1,
-0.538345, 0.987838, -0.04873059, 0, 0, 0, 1, 1,
-0.5351093, -0.4494708, -1.715024, 0, 0, 0, 1, 1,
-0.5334646, -0.04632732, -0.7235144, 0, 0, 0, 1, 1,
-0.5271714, -0.4149863, -1.610328, 0, 0, 0, 1, 1,
-0.5254528, 0.5644934, -0.5647967, 0, 0, 0, 1, 1,
-0.5252749, 0.2224894, -0.6857591, 0, 0, 0, 1, 1,
-0.5237681, -1.288596, -1.569277, 1, 1, 1, 1, 1,
-0.5232179, -0.790141, -4.888445, 1, 1, 1, 1, 1,
-0.5182362, 1.28162, -1.335331, 1, 1, 1, 1, 1,
-0.5138105, -1.283649, -4.135573, 1, 1, 1, 1, 1,
-0.5124184, -1.335581, -2.733235, 1, 1, 1, 1, 1,
-0.5023421, -0.8419947, -3.458419, 1, 1, 1, 1, 1,
-0.5012512, 0.3009471, -0.4948009, 1, 1, 1, 1, 1,
-0.4997605, -1.336362, -1.706699, 1, 1, 1, 1, 1,
-0.4992234, -0.8653187, -2.900735, 1, 1, 1, 1, 1,
-0.4978766, -0.8235339, -1.980641, 1, 1, 1, 1, 1,
-0.4944985, -0.5866918, -3.309923, 1, 1, 1, 1, 1,
-0.4930374, -0.7779495, -3.999468, 1, 1, 1, 1, 1,
-0.4871685, -1.005831, -2.729727, 1, 1, 1, 1, 1,
-0.4871295, 1.656383, 0.2264471, 1, 1, 1, 1, 1,
-0.4838877, 0.4591341, -1.376776, 1, 1, 1, 1, 1,
-0.4803476, -0.07261991, 0.1968279, 0, 0, 1, 1, 1,
-0.4796037, -1.26546, -2.54661, 1, 0, 0, 1, 1,
-0.4795478, 1.132879, 0.7293867, 1, 0, 0, 1, 1,
-0.476997, -0.8099751, -4.751425, 1, 0, 0, 1, 1,
-0.4744591, 1.963267, 1.330753, 1, 0, 0, 1, 1,
-0.4723499, 0.5260169, 0.05149172, 1, 0, 0, 1, 1,
-0.4707804, 0.5905672, -0.9717159, 0, 0, 0, 1, 1,
-0.468358, -0.03612509, -1.496514, 0, 0, 0, 1, 1,
-0.4670908, 0.01526217, -2.252304, 0, 0, 0, 1, 1,
-0.4661425, 0.4025733, -0.3982843, 0, 0, 0, 1, 1,
-0.4538603, -1.267177, -1.80599, 0, 0, 0, 1, 1,
-0.4510546, -0.8529117, -2.332978, 0, 0, 0, 1, 1,
-0.4501339, 1.431437, -0.3857657, 0, 0, 0, 1, 1,
-0.4490532, 1.703261, -1.002744, 1, 1, 1, 1, 1,
-0.4457668, 1.542958, 0.4908926, 1, 1, 1, 1, 1,
-0.440133, 0.2104327, -2.069348, 1, 1, 1, 1, 1,
-0.4390759, -0.4733093, -1.075667, 1, 1, 1, 1, 1,
-0.438415, 0.6818151, -0.06504709, 1, 1, 1, 1, 1,
-0.4351034, 0.7302614, -1.132072, 1, 1, 1, 1, 1,
-0.4335372, 0.5204154, -1.06231, 1, 1, 1, 1, 1,
-0.4311543, -0.4017204, -1.707314, 1, 1, 1, 1, 1,
-0.4301721, 0.8648181, -0.4999435, 1, 1, 1, 1, 1,
-0.4279981, -0.1778414, -3.327064, 1, 1, 1, 1, 1,
-0.4251876, -0.6311631, -1.716128, 1, 1, 1, 1, 1,
-0.4212803, -1.957693, -2.535232, 1, 1, 1, 1, 1,
-0.4211746, 0.1838825, -0.7491692, 1, 1, 1, 1, 1,
-0.4204542, -0.1539792, -1.348142, 1, 1, 1, 1, 1,
-0.4202437, 1.076271, -0.5512678, 1, 1, 1, 1, 1,
-0.4192975, -0.3256441, -2.24604, 0, 0, 1, 1, 1,
-0.4167462, 0.04304903, -1.398451, 1, 0, 0, 1, 1,
-0.4166609, -0.9463773, -3.274936, 1, 0, 0, 1, 1,
-0.414828, 1.085707, -0.1410005, 1, 0, 0, 1, 1,
-0.4087328, -0.01334697, -1.845378, 1, 0, 0, 1, 1,
-0.4023103, -0.3921285, -1.954084, 1, 0, 0, 1, 1,
-0.3955001, 2.026078, 0.7522323, 0, 0, 0, 1, 1,
-0.3935581, -2.019179, -2.41286, 0, 0, 0, 1, 1,
-0.3924217, -0.3277061, -2.351566, 0, 0, 0, 1, 1,
-0.3874739, 1.471217, -0.2839388, 0, 0, 0, 1, 1,
-0.3862026, -1.992551, -3.026184, 0, 0, 0, 1, 1,
-0.385856, -0.05726653, -1.153602, 0, 0, 0, 1, 1,
-0.3832547, -1.050418, -1.85762, 0, 0, 0, 1, 1,
-0.382634, 0.8033503, -0.3371508, 1, 1, 1, 1, 1,
-0.3818663, 0.1922762, -0.733724, 1, 1, 1, 1, 1,
-0.380831, 0.4960555, 0.3430627, 1, 1, 1, 1, 1,
-0.3806305, 0.5145329, -2.805063, 1, 1, 1, 1, 1,
-0.3749969, 1.298288, -0.2845822, 1, 1, 1, 1, 1,
-0.3709221, -0.8108364, -2.839591, 1, 1, 1, 1, 1,
-0.3664784, 1.33126, -1.372209, 1, 1, 1, 1, 1,
-0.3629383, -0.3733597, -2.255131, 1, 1, 1, 1, 1,
-0.3513215, -1.559858, -2.395096, 1, 1, 1, 1, 1,
-0.3493811, -0.06197695, -1.697368, 1, 1, 1, 1, 1,
-0.3480241, -0.601974, -2.010031, 1, 1, 1, 1, 1,
-0.3469568, 1.805452, -0.4560487, 1, 1, 1, 1, 1,
-0.3425281, 2.246042, -0.7289924, 1, 1, 1, 1, 1,
-0.3419126, 0.3971957, -0.7942151, 1, 1, 1, 1, 1,
-0.3350382, 0.5713333, -0.6010887, 1, 1, 1, 1, 1,
-0.3322174, -0.6911924, -1.226243, 0, 0, 1, 1, 1,
-0.3316209, -0.4887411, -2.776164, 1, 0, 0, 1, 1,
-0.3263466, 1.283349, 0.4915185, 1, 0, 0, 1, 1,
-0.3214269, 0.9062094, 0.2508342, 1, 0, 0, 1, 1,
-0.3202771, 1.104193, -2.221429, 1, 0, 0, 1, 1,
-0.3201766, -0.8579288, -2.447227, 1, 0, 0, 1, 1,
-0.3201374, -0.01227773, -1.223, 0, 0, 0, 1, 1,
-0.3172775, 0.05693078, -1.503773, 0, 0, 0, 1, 1,
-0.3154876, -0.3591537, -2.301653, 0, 0, 0, 1, 1,
-0.3139716, 0.1686703, 0.4260482, 0, 0, 0, 1, 1,
-0.3123904, -0.3580803, -1.22638, 0, 0, 0, 1, 1,
-0.3118312, -0.5416304, -3.760849, 0, 0, 0, 1, 1,
-0.3095019, 0.5852517, 0.5949216, 0, 0, 0, 1, 1,
-0.3056341, 0.3784843, -0.9888983, 1, 1, 1, 1, 1,
-0.2987355, -0.2551757, -2.068323, 1, 1, 1, 1, 1,
-0.2961016, -2.116727, -1.71908, 1, 1, 1, 1, 1,
-0.2952196, 1.290405, 1.038621, 1, 1, 1, 1, 1,
-0.2948751, -0.9945035, -4.123751, 1, 1, 1, 1, 1,
-0.2928826, 0.7543673, 0.05758131, 1, 1, 1, 1, 1,
-0.2903713, 1.361827, -0.5697352, 1, 1, 1, 1, 1,
-0.2890601, -0.371958, -1.960996, 1, 1, 1, 1, 1,
-0.2875549, -0.04348971, -2.096042, 1, 1, 1, 1, 1,
-0.2868438, 0.06391507, 0.9243128, 1, 1, 1, 1, 1,
-0.2857142, -0.7907282, -2.408445, 1, 1, 1, 1, 1,
-0.2846168, -0.298876, -4.232766, 1, 1, 1, 1, 1,
-0.2810361, 0.2248842, -1.725719, 1, 1, 1, 1, 1,
-0.2786036, 0.3651838, -1.319103, 1, 1, 1, 1, 1,
-0.2780918, 1.083901, -0.7259232, 1, 1, 1, 1, 1,
-0.2753586, -1.178019, -2.425701, 0, 0, 1, 1, 1,
-0.2692285, -0.854222, -1.663283, 1, 0, 0, 1, 1,
-0.2658521, -0.3882237, -1.597109, 1, 0, 0, 1, 1,
-0.2641716, 0.9500101, -1.206861, 1, 0, 0, 1, 1,
-0.2640378, -1.595133, -2.150285, 1, 0, 0, 1, 1,
-0.25859, -0.8122237, -5.249462, 1, 0, 0, 1, 1,
-0.2567244, -0.4775102, -1.445961, 0, 0, 0, 1, 1,
-0.2518861, -0.9367751, -2.80807, 0, 0, 0, 1, 1,
-0.2496098, -0.3007066, -2.221488, 0, 0, 0, 1, 1,
-0.248417, -0.653883, -3.306726, 0, 0, 0, 1, 1,
-0.2463654, -1.067365, -1.720815, 0, 0, 0, 1, 1,
-0.2461341, 0.1661924, -1.596548, 0, 0, 0, 1, 1,
-0.2451099, -0.6502215, -1.984057, 0, 0, 0, 1, 1,
-0.2442327, -0.2933544, -2.303018, 1, 1, 1, 1, 1,
-0.2428537, 0.1826949, -1.012063, 1, 1, 1, 1, 1,
-0.2399106, 0.390949, -0.7645436, 1, 1, 1, 1, 1,
-0.2395358, -0.569917, -3.181906, 1, 1, 1, 1, 1,
-0.2317382, 1.080661, 1.201036, 1, 1, 1, 1, 1,
-0.2264661, -0.923812, -1.957376, 1, 1, 1, 1, 1,
-0.2123571, -0.1629696, -1.761782, 1, 1, 1, 1, 1,
-0.2110113, -1.125743, -2.465798, 1, 1, 1, 1, 1,
-0.2088335, -0.003723978, -1.765806, 1, 1, 1, 1, 1,
-0.2063968, 0.3050035, 0.8715914, 1, 1, 1, 1, 1,
-0.2050081, -0.4256958, -1.929053, 1, 1, 1, 1, 1,
-0.203619, 0.7743543, 0.6538564, 1, 1, 1, 1, 1,
-0.2035528, -1.241141, -1.707264, 1, 1, 1, 1, 1,
-0.2009093, 0.7614908, -2.759459, 1, 1, 1, 1, 1,
-0.1951006, 0.4866904, -1.267066, 1, 1, 1, 1, 1,
-0.1950663, 0.9581335, 0.3157261, 0, 0, 1, 1, 1,
-0.186167, -0.7944049, -2.653343, 1, 0, 0, 1, 1,
-0.1820327, 0.5068744, 0.7303114, 1, 0, 0, 1, 1,
-0.1801966, -0.2741734, -3.316635, 1, 0, 0, 1, 1,
-0.1770788, -0.2744443, -2.777161, 1, 0, 0, 1, 1,
-0.1750424, 0.7601281, 0.03225552, 1, 0, 0, 1, 1,
-0.1740061, 0.3618851, -0.001926064, 0, 0, 0, 1, 1,
-0.17252, -0.3707006, -2.582639, 0, 0, 0, 1, 1,
-0.169683, 0.2019533, -1.72517, 0, 0, 0, 1, 1,
-0.1671204, -0.2238433, -2.185447, 0, 0, 0, 1, 1,
-0.1660969, 0.09864026, -1.679228, 0, 0, 0, 1, 1,
-0.1651046, 0.9583585, -1.123533, 0, 0, 0, 1, 1,
-0.1643999, 0.406639, 2.353867, 0, 0, 0, 1, 1,
-0.1607184, 2.027105, 1.428624, 1, 1, 1, 1, 1,
-0.1602329, 0.2487321, 0.004641404, 1, 1, 1, 1, 1,
-0.1562419, 1.022183, 0.03759792, 1, 1, 1, 1, 1,
-0.1560751, -0.1710149, -4.131086, 1, 1, 1, 1, 1,
-0.1481132, 0.398276, 0.1443404, 1, 1, 1, 1, 1,
-0.1480051, -0.9991634, -3.612204, 1, 1, 1, 1, 1,
-0.1471071, 0.945398, -1.314673, 1, 1, 1, 1, 1,
-0.14698, 1.288726, -0.6669021, 1, 1, 1, 1, 1,
-0.1446896, -0.153532, -2.484691, 1, 1, 1, 1, 1,
-0.1446689, -0.4822264, -3.695545, 1, 1, 1, 1, 1,
-0.1403514, -0.5183874, -3.171663, 1, 1, 1, 1, 1,
-0.1358733, 0.01348792, -1.246086, 1, 1, 1, 1, 1,
-0.1311378, -0.2794534, -2.506901, 1, 1, 1, 1, 1,
-0.1311021, -0.5839005, -4.065944, 1, 1, 1, 1, 1,
-0.1307171, 0.5265784, -1.113554, 1, 1, 1, 1, 1,
-0.1281887, -1.084517, -4.169387, 0, 0, 1, 1, 1,
-0.1255493, -0.3258566, -2.435735, 1, 0, 0, 1, 1,
-0.1230338, -1.999349, -4.009446, 1, 0, 0, 1, 1,
-0.1221205, 1.21899, -0.7335789, 1, 0, 0, 1, 1,
-0.1211073, 0.05449355, -0.8380327, 1, 0, 0, 1, 1,
-0.1210583, 0.238358, -0.3705828, 1, 0, 0, 1, 1,
-0.1176974, -0.5928716, -3.202573, 0, 0, 0, 1, 1,
-0.116844, -1.341516, -2.391368, 0, 0, 0, 1, 1,
-0.1163517, -0.4059082, -2.898089, 0, 0, 0, 1, 1,
-0.1130848, -0.1754585, -3.045655, 0, 0, 0, 1, 1,
-0.1074188, 0.5216013, -0.1970794, 0, 0, 0, 1, 1,
-0.1051832, 0.3449355, -0.2347036, 0, 0, 0, 1, 1,
-0.1026572, 0.0821607, -0.06129409, 0, 0, 0, 1, 1,
-0.09730475, -0.7996807, -4.030189, 1, 1, 1, 1, 1,
-0.09612668, -0.4773431, -2.477386, 1, 1, 1, 1, 1,
-0.0944435, -0.3772047, -2.294657, 1, 1, 1, 1, 1,
-0.09269603, -1.208274, -2.189009, 1, 1, 1, 1, 1,
-0.09259291, 0.2504343, -0.3097132, 1, 1, 1, 1, 1,
-0.08850477, -1.289692, -3.595774, 1, 1, 1, 1, 1,
-0.08752827, 0.6537417, 1.151864, 1, 1, 1, 1, 1,
-0.08714731, 0.2262661, -0.1564531, 1, 1, 1, 1, 1,
-0.08126254, 0.8165357, 1.379362, 1, 1, 1, 1, 1,
-0.08096868, -0.9857748, -2.756455, 1, 1, 1, 1, 1,
-0.07082343, 0.1730354, -0.587452, 1, 1, 1, 1, 1,
-0.0690586, 0.1715075, -2.086747, 1, 1, 1, 1, 1,
-0.06900115, 0.04068984, -1.202915, 1, 1, 1, 1, 1,
-0.06147891, 0.2006444, 0.09826908, 1, 1, 1, 1, 1,
-0.0587998, -0.4717109, -3.732895, 1, 1, 1, 1, 1,
-0.05768376, -0.3916829, -3.006899, 0, 0, 1, 1, 1,
-0.05600825, 0.5645978, 1.387082, 1, 0, 0, 1, 1,
-0.05374772, 0.4832398, -0.8097366, 1, 0, 0, 1, 1,
-0.05372515, -0.9059705, -0.9194602, 1, 0, 0, 1, 1,
-0.05106058, -0.5859029, -3.903777, 1, 0, 0, 1, 1,
-0.04341789, 0.9956557, 0.2629122, 1, 0, 0, 1, 1,
-0.04160914, -0.09681906, -1.852884, 0, 0, 0, 1, 1,
-0.04098948, 0.01809502, -2.309082, 0, 0, 0, 1, 1,
-0.03949657, 1.046647, -1.621575, 0, 0, 0, 1, 1,
-0.03901786, 0.9506325, 0.3719424, 0, 0, 0, 1, 1,
-0.03496654, -0.5540782, -2.873155, 0, 0, 0, 1, 1,
-0.03460217, 0.1911795, -0.1128574, 0, 0, 0, 1, 1,
-0.03364318, 0.3587698, 0.6690864, 0, 0, 0, 1, 1,
-0.03233594, -0.9449888, -1.93088, 1, 1, 1, 1, 1,
-0.02973883, -1.101203, -4.674982, 1, 1, 1, 1, 1,
-0.02962189, -0.4816144, -0.2637553, 1, 1, 1, 1, 1,
-0.02879807, 0.7988595, 2.615147, 1, 1, 1, 1, 1,
-0.02533527, 1.433725, 0.953124, 1, 1, 1, 1, 1,
-0.02425335, -1.631708, -1.357196, 1, 1, 1, 1, 1,
-0.02031773, -0.3037652, -3.696516, 1, 1, 1, 1, 1,
-0.01942114, -1.031901, -1.905807, 1, 1, 1, 1, 1,
-0.01372785, 0.6124159, -0.1532314, 1, 1, 1, 1, 1,
-0.01355248, -0.7063493, -4.033919, 1, 1, 1, 1, 1,
-0.01110196, 1.760055, -0.3785875, 1, 1, 1, 1, 1,
-0.009428281, 0.8450631, -2.231556, 1, 1, 1, 1, 1,
-0.006370324, 0.5390572, 0.1218833, 1, 1, 1, 1, 1,
-0.003346408, -0.8684632, -5.063258, 1, 1, 1, 1, 1,
-0.001013496, 0.1617357, 0.754531, 1, 1, 1, 1, 1,
-0.0006127384, 2.313695, 1.12091, 0, 0, 1, 1, 1,
-0.0002967565, 0.1748673, 0.6041586, 1, 0, 0, 1, 1,
0.001892887, -1.246909, 4.260502, 1, 0, 0, 1, 1,
0.003375557, -1.579231, 2.352084, 1, 0, 0, 1, 1,
0.008598633, 0.8538746, -0.9045506, 1, 0, 0, 1, 1,
0.01215347, -0.6798419, 1.962105, 1, 0, 0, 1, 1,
0.01584833, 1.985383, 0.6949254, 0, 0, 0, 1, 1,
0.01902989, 0.5519477, 2.027746, 0, 0, 0, 1, 1,
0.02084808, 0.2451844, -0.5825858, 0, 0, 0, 1, 1,
0.02957927, -0.4818028, 2.488081, 0, 0, 0, 1, 1,
0.0359596, -0.5539825, 2.259162, 0, 0, 0, 1, 1,
0.03744528, 1.152666, 2.87761, 0, 0, 0, 1, 1,
0.03836176, 0.584192, 1.572929, 0, 0, 0, 1, 1,
0.03938588, -0.3483466, 3.08072, 1, 1, 1, 1, 1,
0.04108296, -1.274573, 1.734003, 1, 1, 1, 1, 1,
0.04507473, -3.229021, 4.228316, 1, 1, 1, 1, 1,
0.04706915, -0.7068319, 3.83034, 1, 1, 1, 1, 1,
0.04747078, 0.6130144, 2.180587, 1, 1, 1, 1, 1,
0.05539593, 0.1657571, -0.2181703, 1, 1, 1, 1, 1,
0.05840799, -0.2276545, 4.278807, 1, 1, 1, 1, 1,
0.05862338, -1.227425, 2.084044, 1, 1, 1, 1, 1,
0.06046607, -0.1622467, 4.036234, 1, 1, 1, 1, 1,
0.06167374, -0.6686064, 3.057209, 1, 1, 1, 1, 1,
0.0687745, -0.4024894, 1.938911, 1, 1, 1, 1, 1,
0.06956418, 0.04980323, 0.8161625, 1, 1, 1, 1, 1,
0.07322311, -2.196544, 1.037805, 1, 1, 1, 1, 1,
0.07393467, -1.827026, 3.354686, 1, 1, 1, 1, 1,
0.07548649, 0.07635024, 2.528731, 1, 1, 1, 1, 1,
0.07624844, -0.5611911, 4.164797, 0, 0, 1, 1, 1,
0.07689224, 0.03217071, 2.220525, 1, 0, 0, 1, 1,
0.08333596, 0.0456894, 0.9214528, 1, 0, 0, 1, 1,
0.08954072, -1.490123, 3.050355, 1, 0, 0, 1, 1,
0.09354615, -0.5257503, 3.559637, 1, 0, 0, 1, 1,
0.1002032, 1.023949, 2.176448, 1, 0, 0, 1, 1,
0.1028001, -0.2476585, 2.352577, 0, 0, 0, 1, 1,
0.1106244, -0.0718211, 2.850416, 0, 0, 0, 1, 1,
0.113251, 1.070069, 0.2257423, 0, 0, 0, 1, 1,
0.1132631, 0.2218997, -0.841252, 0, 0, 0, 1, 1,
0.1142741, -0.7754715, 2.877096, 0, 0, 0, 1, 1,
0.1162638, 0.1437762, -0.3278272, 0, 0, 0, 1, 1,
0.1169433, -0.6468003, 3.232709, 0, 0, 0, 1, 1,
0.1169806, 0.1629432, -1.432478, 1, 1, 1, 1, 1,
0.1191039, -0.994505, 3.223781, 1, 1, 1, 1, 1,
0.1220552, 0.9152219, 0.6898271, 1, 1, 1, 1, 1,
0.1228681, 0.2786224, 1.59191, 1, 1, 1, 1, 1,
0.1239857, 0.8031793, 0.5883475, 1, 1, 1, 1, 1,
0.1246391, -0.01545053, 2.92998, 1, 1, 1, 1, 1,
0.1271022, -0.9315856, 2.395662, 1, 1, 1, 1, 1,
0.1278076, 1.649792, -0.09978571, 1, 1, 1, 1, 1,
0.1283301, 2.358307, 0.01995123, 1, 1, 1, 1, 1,
0.13201, 0.823391, 0.3129484, 1, 1, 1, 1, 1,
0.1355408, 0.9019464, 0.1168042, 1, 1, 1, 1, 1,
0.1388152, 0.9804241, 0.7026947, 1, 1, 1, 1, 1,
0.1405051, -1.428383, 0.9745922, 1, 1, 1, 1, 1,
0.1415769, 1.157762, -0.05761559, 1, 1, 1, 1, 1,
0.1439679, -2.029145, 3.067964, 1, 1, 1, 1, 1,
0.1450209, 0.2155494, 2.867802, 0, 0, 1, 1, 1,
0.1474272, -0.9672808, 3.214319, 1, 0, 0, 1, 1,
0.1490893, -1.028533, 2.006606, 1, 0, 0, 1, 1,
0.1549908, 2.283547, 0.7225498, 1, 0, 0, 1, 1,
0.1565075, -0.9007806, 2.218744, 1, 0, 0, 1, 1,
0.1586172, -0.6780254, 1.70098, 1, 0, 0, 1, 1,
0.1615652, 0.9270825, -0.04346922, 0, 0, 0, 1, 1,
0.1616142, -0.02815069, 1.613148, 0, 0, 0, 1, 1,
0.1643346, -2.509054, 3.369866, 0, 0, 0, 1, 1,
0.1662986, -0.2937667, 1.858809, 0, 0, 0, 1, 1,
0.1693804, 0.4632927, -0.3679487, 0, 0, 0, 1, 1,
0.1718944, -0.7734304, 2.662441, 0, 0, 0, 1, 1,
0.17248, 0.9052431, 2.221163, 0, 0, 0, 1, 1,
0.1730251, -0.6206632, 2.160009, 1, 1, 1, 1, 1,
0.1738792, 0.2627522, -0.03126006, 1, 1, 1, 1, 1,
0.1809653, 0.206411, 0.6940677, 1, 1, 1, 1, 1,
0.1818603, -0.8486837, 3.350858, 1, 1, 1, 1, 1,
0.182876, -1.98484, 3.571569, 1, 1, 1, 1, 1,
0.1869247, 0.2101594, 0.3421095, 1, 1, 1, 1, 1,
0.1918439, -0.416558, 2.660015, 1, 1, 1, 1, 1,
0.193729, -0.1858268, 2.41647, 1, 1, 1, 1, 1,
0.195484, 0.09831333, 0.9985663, 1, 1, 1, 1, 1,
0.1960107, -0.9380373, 1.926028, 1, 1, 1, 1, 1,
0.1990437, -2.30078, 3.128598, 1, 1, 1, 1, 1,
0.2003773, 0.1387204, 1.785256, 1, 1, 1, 1, 1,
0.2119922, 1.197003, -0.7873189, 1, 1, 1, 1, 1,
0.2178064, -0.7446885, 1.968523, 1, 1, 1, 1, 1,
0.2178485, 1.469704, -0.6487048, 1, 1, 1, 1, 1,
0.2180032, -0.4513268, 2.422572, 0, 0, 1, 1, 1,
0.2186993, 0.991675, 1.105933, 1, 0, 0, 1, 1,
0.2187755, -0.549253, 2.92826, 1, 0, 0, 1, 1,
0.2217864, 0.3048835, -0.6693445, 1, 0, 0, 1, 1,
0.2269307, -0.2058551, 0.398556, 1, 0, 0, 1, 1,
0.231971, -0.6615044, 4.129476, 1, 0, 0, 1, 1,
0.2327142, 1.774195, -0.4278093, 0, 0, 0, 1, 1,
0.2386614, -0.3487402, 2.619168, 0, 0, 0, 1, 1,
0.2390916, 0.07343271, 1.460541, 0, 0, 0, 1, 1,
0.2405503, -0.1012692, 3.281054, 0, 0, 0, 1, 1,
0.2434504, -0.1895648, 2.468807, 0, 0, 0, 1, 1,
0.2454074, -0.4633241, 2.944897, 0, 0, 0, 1, 1,
0.2461458, 0.2086442, -0.6128799, 0, 0, 0, 1, 1,
0.2465496, -0.2769664, 1.150596, 1, 1, 1, 1, 1,
0.2472154, 0.5661594, 1.147827, 1, 1, 1, 1, 1,
0.2485497, 0.4026986, 0.6546311, 1, 1, 1, 1, 1,
0.2549541, -0.1131852, 1.645514, 1, 1, 1, 1, 1,
0.2578262, -0.4560204, 2.687213, 1, 1, 1, 1, 1,
0.2608591, -0.1914826, 1.723033, 1, 1, 1, 1, 1,
0.261648, 1.689626, 1.47293, 1, 1, 1, 1, 1,
0.2633025, -0.4850561, 2.53843, 1, 1, 1, 1, 1,
0.2634125, 0.5782796, 0.1280564, 1, 1, 1, 1, 1,
0.2669129, 0.3024538, 2.778756, 1, 1, 1, 1, 1,
0.2720489, -1.311914, 1.924594, 1, 1, 1, 1, 1,
0.2742499, -1.762293, 4.158699, 1, 1, 1, 1, 1,
0.2761815, 0.5775417, 1.152418, 1, 1, 1, 1, 1,
0.2771713, 0.1426268, 1.486856, 1, 1, 1, 1, 1,
0.2783229, 0.4927649, 1.291933, 1, 1, 1, 1, 1,
0.2792052, -1.177546, 3.907052, 0, 0, 1, 1, 1,
0.2793793, 1.223815, 1.357872, 1, 0, 0, 1, 1,
0.2794021, -0.2883503, 2.220922, 1, 0, 0, 1, 1,
0.2799582, 0.8730695, 0.5056825, 1, 0, 0, 1, 1,
0.28058, -1.158628, 3.411366, 1, 0, 0, 1, 1,
0.2841828, -0.11973, 1.950665, 1, 0, 0, 1, 1,
0.2848613, 0.01317913, 1.951431, 0, 0, 0, 1, 1,
0.2856675, 0.8080873, -0.08640257, 0, 0, 0, 1, 1,
0.2865117, 0.1728614, 0.512826, 0, 0, 0, 1, 1,
0.2869944, -1.518569, 4.012857, 0, 0, 0, 1, 1,
0.2950564, 0.0387172, 0.1341129, 0, 0, 0, 1, 1,
0.2955123, -0.9389581, 4.804596, 0, 0, 0, 1, 1,
0.3004425, 2.653631, -0.4325054, 0, 0, 0, 1, 1,
0.3006483, 2.05738, 0.5242041, 1, 1, 1, 1, 1,
0.3007066, -0.2602056, 2.84669, 1, 1, 1, 1, 1,
0.3013345, -0.7968875, 3.870117, 1, 1, 1, 1, 1,
0.3035272, -0.2998364, 0.5867429, 1, 1, 1, 1, 1,
0.3044572, 2.237004, 1.203914, 1, 1, 1, 1, 1,
0.3074288, -0.6253973, 3.437135, 1, 1, 1, 1, 1,
0.3105887, 0.7209743, -0.6642045, 1, 1, 1, 1, 1,
0.3143373, 1.29283, -0.6739926, 1, 1, 1, 1, 1,
0.3151565, 1.652125, -0.366058, 1, 1, 1, 1, 1,
0.3173907, 0.002423701, 0.8946739, 1, 1, 1, 1, 1,
0.3178028, -0.9722866, 4.339371, 1, 1, 1, 1, 1,
0.3198857, 1.583646, 0.6286758, 1, 1, 1, 1, 1,
0.3206775, 1.28133, 1.068911, 1, 1, 1, 1, 1,
0.3215862, -1.247153, 3.252111, 1, 1, 1, 1, 1,
0.3219406, 0.2168587, -0.2683792, 1, 1, 1, 1, 1,
0.325035, 0.3408532, 1.05658, 0, 0, 1, 1, 1,
0.326465, 0.5201764, 0.7046816, 1, 0, 0, 1, 1,
0.3304247, 0.03474183, -1.042187, 1, 0, 0, 1, 1,
0.3352114, 2.306076, -0.6899563, 1, 0, 0, 1, 1,
0.3383461, 1.800465, -0.1515317, 1, 0, 0, 1, 1,
0.3452826, 0.4254035, 0.8829133, 1, 0, 0, 1, 1,
0.351024, 1.581071, 0.1619055, 0, 0, 0, 1, 1,
0.3526009, -0.1591926, 3.61417, 0, 0, 0, 1, 1,
0.3541523, 0.03668439, 0.3489938, 0, 0, 0, 1, 1,
0.3665302, 1.155725, -1.298996, 0, 0, 0, 1, 1,
0.3678781, 0.8061864, 1.11813, 0, 0, 0, 1, 1,
0.3707104, -0.07379801, 2.245405, 0, 0, 0, 1, 1,
0.370999, 0.2915609, -0.5876819, 0, 0, 0, 1, 1,
0.3722181, 0.1635594, 0.9610397, 1, 1, 1, 1, 1,
0.3797629, -0.4932773, 2.970647, 1, 1, 1, 1, 1,
0.3797831, 1.303286, 0.04085314, 1, 1, 1, 1, 1,
0.3798817, -1.601264, 3.12802, 1, 1, 1, 1, 1,
0.3806355, -1.512257, 3.475162, 1, 1, 1, 1, 1,
0.3810632, 0.3327277, -0.006889717, 1, 1, 1, 1, 1,
0.3852093, -0.4105906, 3.167734, 1, 1, 1, 1, 1,
0.389643, -0.7616134, 3.378222, 1, 1, 1, 1, 1,
0.3905123, 1.826233, 1.423522, 1, 1, 1, 1, 1,
0.3942118, 1.195404, 1.29879, 1, 1, 1, 1, 1,
0.3982808, 0.8991163, -1.214758, 1, 1, 1, 1, 1,
0.3993336, -1.361172, 3.476997, 1, 1, 1, 1, 1,
0.4069897, -1.55113, 3.677525, 1, 1, 1, 1, 1,
0.407006, -0.8654726, 2.902445, 1, 1, 1, 1, 1,
0.4071857, -0.7868762, 2.933304, 1, 1, 1, 1, 1,
0.4092409, -0.2902321, 1.872474, 0, 0, 1, 1, 1,
0.4096519, 0.1964059, 1.44224, 1, 0, 0, 1, 1,
0.4109626, 0.08123235, -0.02818083, 1, 0, 0, 1, 1,
0.4114192, 0.8329542, 0.09629189, 1, 0, 0, 1, 1,
0.4154079, -1.462006, 3.327939, 1, 0, 0, 1, 1,
0.4191928, 0.9847128, 1.208665, 1, 0, 0, 1, 1,
0.4197158, 0.7640838, 0.9692377, 0, 0, 0, 1, 1,
0.4278524, -0.6668282, 0.596509, 0, 0, 0, 1, 1,
0.429757, 0.7393171, -2.061539, 0, 0, 0, 1, 1,
0.4393664, 1.158037, 0.5534849, 0, 0, 0, 1, 1,
0.4429959, -1.075676, 3.389186, 0, 0, 0, 1, 1,
0.4501626, -0.9828998, 4.499702, 0, 0, 0, 1, 1,
0.4541948, 0.5973516, 0.2917309, 0, 0, 0, 1, 1,
0.4543237, -0.4934302, 3.097769, 1, 1, 1, 1, 1,
0.4650274, 0.9017164, -0.6432351, 1, 1, 1, 1, 1,
0.4687862, 0.4595384, -0.6534725, 1, 1, 1, 1, 1,
0.4688591, -0.2655947, 0.7790442, 1, 1, 1, 1, 1,
0.4728627, 0.6003087, 0.5059388, 1, 1, 1, 1, 1,
0.4761094, -0.7286257, 0.722607, 1, 1, 1, 1, 1,
0.4763534, 1.244151, 0.6240923, 1, 1, 1, 1, 1,
0.4772806, -0.5968073, 2.198733, 1, 1, 1, 1, 1,
0.4842748, -0.1976399, 4.451168, 1, 1, 1, 1, 1,
0.4879797, -0.4152448, 2.545739, 1, 1, 1, 1, 1,
0.4890373, -1.395282, 1.153707, 1, 1, 1, 1, 1,
0.4935595, -0.5890789, 2.687495, 1, 1, 1, 1, 1,
0.4938163, 0.08583521, 0.360491, 1, 1, 1, 1, 1,
0.4944015, 0.3919451, 2.350237, 1, 1, 1, 1, 1,
0.4975084, 0.04898659, 0.4657991, 1, 1, 1, 1, 1,
0.4991807, 0.7209347, -0.5569506, 0, 0, 1, 1, 1,
0.5003909, -0.9553331, 3.352257, 1, 0, 0, 1, 1,
0.5023462, 1.671084, -1.346904, 1, 0, 0, 1, 1,
0.512356, 1.413394, 0.6628357, 1, 0, 0, 1, 1,
0.5189511, -0.7950974, 1.59441, 1, 0, 0, 1, 1,
0.5205825, 0.01244905, 1.131745, 1, 0, 0, 1, 1,
0.5247567, -2.82102, 1.873729, 0, 0, 0, 1, 1,
0.5254005, 1.450208, 0.1923547, 0, 0, 0, 1, 1,
0.529542, 0.8403636, -0.654651, 0, 0, 0, 1, 1,
0.5343484, 1.377087, 0.5847689, 0, 0, 0, 1, 1,
0.5468844, -1.83239, 0.9198766, 0, 0, 0, 1, 1,
0.54748, -1.157733, 4.082359, 0, 0, 0, 1, 1,
0.5478596, 1.067373, 0.2564403, 0, 0, 0, 1, 1,
0.561053, -0.6965284, 2.031312, 1, 1, 1, 1, 1,
0.5677943, 0.0972217, 1.040595, 1, 1, 1, 1, 1,
0.5701085, -0.8090155, 2.369192, 1, 1, 1, 1, 1,
0.5741786, -0.4327524, 2.582423, 1, 1, 1, 1, 1,
0.5762913, -0.7907522, 5.094164, 1, 1, 1, 1, 1,
0.5813875, 0.413409, 1.653463, 1, 1, 1, 1, 1,
0.5839907, 0.4269913, 0.1659943, 1, 1, 1, 1, 1,
0.5878662, 1.655101, 0.05186994, 1, 1, 1, 1, 1,
0.5885031, -2.035786, 2.533118, 1, 1, 1, 1, 1,
0.5892263, -1.295601, 2.21819, 1, 1, 1, 1, 1,
0.5902999, 0.2491085, 2.211238, 1, 1, 1, 1, 1,
0.5915726, 0.7761736, 0.7318529, 1, 1, 1, 1, 1,
0.5923895, -0.5053848, 1.953277, 1, 1, 1, 1, 1,
0.5974506, -1.090551, 2.586625, 1, 1, 1, 1, 1,
0.5982283, -0.3818168, 2.393346, 1, 1, 1, 1, 1,
0.6011537, 0.3959875, 0.6140363, 0, 0, 1, 1, 1,
0.6043399, -0.1021782, 1.980393, 1, 0, 0, 1, 1,
0.6101548, -1.248205, 3.509452, 1, 0, 0, 1, 1,
0.6109706, -0.6908362, 3.787021, 1, 0, 0, 1, 1,
0.6115136, -0.7539749, 3.242884, 1, 0, 0, 1, 1,
0.6126654, 1.40458, 1.389266, 1, 0, 0, 1, 1,
0.6230178, 0.528192, 0.5276439, 0, 0, 0, 1, 1,
0.6234998, -0.8666178, 3.250731, 0, 0, 0, 1, 1,
0.6275571, -0.4061325, 2.70521, 0, 0, 0, 1, 1,
0.6349344, -1.243111, 2.899223, 0, 0, 0, 1, 1,
0.6438816, -0.1828643, 0.8645976, 0, 0, 0, 1, 1,
0.6457061, -0.4085253, 2.479415, 0, 0, 0, 1, 1,
0.6478389, 0.2385825, 1.910519, 0, 0, 0, 1, 1,
0.6567281, 1.020599, -0.9777312, 1, 1, 1, 1, 1,
0.6595736, -1.349108, 3.727264, 1, 1, 1, 1, 1,
0.6611658, -1.33135, 2.878665, 1, 1, 1, 1, 1,
0.6685411, 1.78433, 0.9422958, 1, 1, 1, 1, 1,
0.6693636, -0.4073167, 1.18, 1, 1, 1, 1, 1,
0.6703867, 0.4539475, 0.0008072386, 1, 1, 1, 1, 1,
0.6761313, 0.8694978, -0.4479471, 1, 1, 1, 1, 1,
0.6792682, -1.245999, 2.576185, 1, 1, 1, 1, 1,
0.6884649, 1.05027, 1.280085, 1, 1, 1, 1, 1,
0.6912125, -0.9087358, 2.962029, 1, 1, 1, 1, 1,
0.6923621, 0.2589037, 1.950613, 1, 1, 1, 1, 1,
0.6930548, -1.016984, 2.922651, 1, 1, 1, 1, 1,
0.6931059, -0.01251864, 2.802603, 1, 1, 1, 1, 1,
0.7019508, 0.7649311, 0.8995787, 1, 1, 1, 1, 1,
0.7068927, 0.3503458, 1.737099, 1, 1, 1, 1, 1,
0.7137044, -0.6319816, 1.382162, 0, 0, 1, 1, 1,
0.7146607, -0.02550815, 2.515641, 1, 0, 0, 1, 1,
0.7170755, 0.251145, 1.004842, 1, 0, 0, 1, 1,
0.7211615, -1.563619, 1.725092, 1, 0, 0, 1, 1,
0.7218046, -0.5506034, 2.377084, 1, 0, 0, 1, 1,
0.7242369, 0.4201361, 1.90728, 1, 0, 0, 1, 1,
0.729057, -1.466797, 2.938988, 0, 0, 0, 1, 1,
0.7298667, 0.7161024, -0.1558677, 0, 0, 0, 1, 1,
0.7321786, -1.110843, 1.435777, 0, 0, 0, 1, 1,
0.7379022, 1.185109, -0.1083177, 0, 0, 0, 1, 1,
0.738615, 0.1591415, 1.577548, 0, 0, 0, 1, 1,
0.7399557, 1.377085, 3.250192, 0, 0, 0, 1, 1,
0.7422312, -1.671026, 3.127916, 0, 0, 0, 1, 1,
0.7441173, -0.8991814, 2.331109, 1, 1, 1, 1, 1,
0.7449889, -0.2895975, 1.03955, 1, 1, 1, 1, 1,
0.7501598, 0.2659121, 2.339999, 1, 1, 1, 1, 1,
0.7536179, -0.03688826, 2.662345, 1, 1, 1, 1, 1,
0.7556611, -1.718772, 2.121568, 1, 1, 1, 1, 1,
0.7563009, -0.9123095, 1.294324, 1, 1, 1, 1, 1,
0.7650036, 0.5598077, -0.9618069, 1, 1, 1, 1, 1,
0.7654632, -0.3068227, 3.764939, 1, 1, 1, 1, 1,
0.7666391, 1.255701, 1.756309, 1, 1, 1, 1, 1,
0.7666497, 0.6885065, 2.948635, 1, 1, 1, 1, 1,
0.767576, -0.2216713, 0.9321614, 1, 1, 1, 1, 1,
0.7703593, 2.386906, 1.071061, 1, 1, 1, 1, 1,
0.7705057, 1.40423, 1.045362, 1, 1, 1, 1, 1,
0.7864754, -1.45196, 2.417956, 1, 1, 1, 1, 1,
0.7886873, -1.67199, 1.998171, 1, 1, 1, 1, 1,
0.7897371, -0.5796345, 3.584023, 0, 0, 1, 1, 1,
0.7987256, 0.6871619, 1.552039, 1, 0, 0, 1, 1,
0.7991289, 2.446386, 1.506021, 1, 0, 0, 1, 1,
0.8175167, 1.374592, 0.1562327, 1, 0, 0, 1, 1,
0.8224728, 1.272834, 1.090682, 1, 0, 0, 1, 1,
0.8248587, 0.3101681, -0.2576135, 1, 0, 0, 1, 1,
0.8338342, -0.1580785, 3.02509, 0, 0, 0, 1, 1,
0.8464205, 1.159282, 0.3556944, 0, 0, 0, 1, 1,
0.8478646, -0.594206, 1.982527, 0, 0, 0, 1, 1,
0.8554438, 0.3112368, 0.8787883, 0, 0, 0, 1, 1,
0.8587723, -1.122267, 3.635987, 0, 0, 0, 1, 1,
0.8590297, -0.3115943, 2.289152, 0, 0, 0, 1, 1,
0.8598371, 0.9352806, 1.57949, 0, 0, 0, 1, 1,
0.8603063, -0.8299119, 1.017022, 1, 1, 1, 1, 1,
0.8619545, 0.04254043, 0.8296469, 1, 1, 1, 1, 1,
0.8622178, 0.8127708, 0.9347288, 1, 1, 1, 1, 1,
0.8625441, 0.2887942, 0.5811069, 1, 1, 1, 1, 1,
0.8686823, -1.120476, 3.655791, 1, 1, 1, 1, 1,
0.8692272, 0.01510155, 2.769785, 1, 1, 1, 1, 1,
0.8815578, 0.428239, 1.897187, 1, 1, 1, 1, 1,
0.8856311, -1.380543, 3.371813, 1, 1, 1, 1, 1,
0.8932174, -0.662626, 1.813627, 1, 1, 1, 1, 1,
0.9003579, 1.059254, 0.6528475, 1, 1, 1, 1, 1,
0.9047172, -0.361041, 2.963973, 1, 1, 1, 1, 1,
0.9098623, -1.4654, 1.279778, 1, 1, 1, 1, 1,
0.9125926, 1.436529, 0.5501227, 1, 1, 1, 1, 1,
0.916393, -0.3591844, 3.362329, 1, 1, 1, 1, 1,
0.9234726, 1.145046, 1.689215, 1, 1, 1, 1, 1,
0.9252033, 0.515093, 0.6810452, 0, 0, 1, 1, 1,
0.9279874, -0.8483131, 3.255599, 1, 0, 0, 1, 1,
0.9347506, -1.98178, 1.925493, 1, 0, 0, 1, 1,
0.9406145, 0.384683, 1.027413, 1, 0, 0, 1, 1,
0.9444482, 1.073207, 0.430099, 1, 0, 0, 1, 1,
0.9480687, 0.4661706, 2.065924, 1, 0, 0, 1, 1,
0.9487283, -0.2512533, 2.135615, 0, 0, 0, 1, 1,
0.9488112, -0.5183708, 2.821631, 0, 0, 0, 1, 1,
0.9497517, -0.8340918, 2.104612, 0, 0, 0, 1, 1,
0.9646688, 1.538488, 1.308474, 0, 0, 0, 1, 1,
0.9657109, -0.420336, 1.655953, 0, 0, 0, 1, 1,
0.9694092, 0.5655467, 0.9063492, 0, 0, 0, 1, 1,
0.9729797, -1.169743, 4.873644, 0, 0, 0, 1, 1,
0.9735844, 0.8847846, 1.562538, 1, 1, 1, 1, 1,
0.9804531, -0.3758196, 2.412752, 1, 1, 1, 1, 1,
0.9813491, 0.1457069, 0.7894686, 1, 1, 1, 1, 1,
0.985115, 0.4124339, -0.4298462, 1, 1, 1, 1, 1,
0.9862462, 0.7504939, 0.4149766, 1, 1, 1, 1, 1,
0.9911059, -0.9256169, 3.230938, 1, 1, 1, 1, 1,
0.9925694, 0.09329408, 0.9734521, 1, 1, 1, 1, 1,
0.9935878, 0.05520041, 1.376754, 1, 1, 1, 1, 1,
0.9942853, -0.4396249, 0.8892331, 1, 1, 1, 1, 1,
0.9948151, 0.6547235, 0.4183259, 1, 1, 1, 1, 1,
0.9970785, 2.470689, -0.1376062, 1, 1, 1, 1, 1,
1.01282, -0.8771756, 2.572831, 1, 1, 1, 1, 1,
1.013773, 0.4250593, -0.3077483, 1, 1, 1, 1, 1,
1.01384, -0.2823057, 3.097721, 1, 1, 1, 1, 1,
1.014867, 0.9005173, 0.5968038, 1, 1, 1, 1, 1,
1.015218, 0.009763438, 1.922765, 0, 0, 1, 1, 1,
1.019896, 1.254849, 1.521623, 1, 0, 0, 1, 1,
1.021421, -1.081074, 1.712007, 1, 0, 0, 1, 1,
1.027948, -0.5246067, 2.407426, 1, 0, 0, 1, 1,
1.029395, 1.731594, 1.269587, 1, 0, 0, 1, 1,
1.030821, 0.5185367, 1.115764, 1, 0, 0, 1, 1,
1.037871, -0.9433349, 3.150726, 0, 0, 0, 1, 1,
1.038751, -1.721264, 2.794736, 0, 0, 0, 1, 1,
1.044998, -0.3499765, 0.7202199, 0, 0, 0, 1, 1,
1.045102, -0.7055767, 3.011491, 0, 0, 0, 1, 1,
1.047419, -0.2392796, 0.4327046, 0, 0, 0, 1, 1,
1.048129, -0.9346756, 1.406915, 0, 0, 0, 1, 1,
1.050587, 0.2503815, 0.7403286, 0, 0, 0, 1, 1,
1.05891, 1.993594, 0.2382456, 1, 1, 1, 1, 1,
1.059957, 0.7868991, 0.7476808, 1, 1, 1, 1, 1,
1.062482, 1.012601, -0.7075184, 1, 1, 1, 1, 1,
1.070912, -0.8408793, 1.659673, 1, 1, 1, 1, 1,
1.082484, -0.1865835, 1.7926, 1, 1, 1, 1, 1,
1.089988, 0.3899341, 1.679061, 1, 1, 1, 1, 1,
1.091659, 2.35109, -0.1109904, 1, 1, 1, 1, 1,
1.09296, -0.4531198, 3.300534, 1, 1, 1, 1, 1,
1.097012, 0.9084668, 0.01230068, 1, 1, 1, 1, 1,
1.109419, -0.2866552, 2.059367, 1, 1, 1, 1, 1,
1.110556, 1.585503, -0.1928391, 1, 1, 1, 1, 1,
1.120524, -2.074727, 2.352603, 1, 1, 1, 1, 1,
1.121882, -0.9370003, -0.1087187, 1, 1, 1, 1, 1,
1.124964, 1.454434, -0.3923427, 1, 1, 1, 1, 1,
1.127321, -0.4915382, 0.9234861, 1, 1, 1, 1, 1,
1.131225, -0.6663655, 0.5749432, 0, 0, 1, 1, 1,
1.131743, 0.09728177, 2.340174, 1, 0, 0, 1, 1,
1.14259, 2.327641, 0.3529043, 1, 0, 0, 1, 1,
1.145169, 0.1822533, 4.16078, 1, 0, 0, 1, 1,
1.146606, -0.05488146, 1.877791, 1, 0, 0, 1, 1,
1.152019, 0.7881786, 1.639884, 1, 0, 0, 1, 1,
1.156165, 0.04858688, 2.280169, 0, 0, 0, 1, 1,
1.15669, -1.459125, 3.163629, 0, 0, 0, 1, 1,
1.161142, -0.2041778, 3.301172, 0, 0, 0, 1, 1,
1.162268, -1.473711, 1.875801, 0, 0, 0, 1, 1,
1.168969, 0.4152446, 1.727673, 0, 0, 0, 1, 1,
1.171059, 0.1284351, 2.45748, 0, 0, 0, 1, 1,
1.19295, 0.9320389, 2.001754, 0, 0, 0, 1, 1,
1.198323, -0.4245588, 1.297818, 1, 1, 1, 1, 1,
1.208491, -0.4849841, -0.7827319, 1, 1, 1, 1, 1,
1.212945, -1.557614, 3.192301, 1, 1, 1, 1, 1,
1.214205, 0.4491344, 1.855429, 1, 1, 1, 1, 1,
1.21427, -0.8359646, 2.404413, 1, 1, 1, 1, 1,
1.215673, 0.4113476, 0.6487275, 1, 1, 1, 1, 1,
1.21815, 0.5163153, 2.431583, 1, 1, 1, 1, 1,
1.22885, 1.389353, 0.5609818, 1, 1, 1, 1, 1,
1.23305, -0.719777, 2.374693, 1, 1, 1, 1, 1,
1.253757, 0.3531224, 2.306765, 1, 1, 1, 1, 1,
1.253924, 0.5475954, 2.313121, 1, 1, 1, 1, 1,
1.258282, 0.1441583, 0.8243564, 1, 1, 1, 1, 1,
1.260282, 1.427113, 0.9553754, 1, 1, 1, 1, 1,
1.267833, 0.7676842, 2.477033, 1, 1, 1, 1, 1,
1.277403, -1.525199, 1.579286, 1, 1, 1, 1, 1,
1.280403, 1.206831, -0.4268773, 0, 0, 1, 1, 1,
1.285539, -0.09946748, 1.81182, 1, 0, 0, 1, 1,
1.297166, -2.064217, 3.492712, 1, 0, 0, 1, 1,
1.302595, 0.9894128, -0.02214236, 1, 0, 0, 1, 1,
1.315189, -0.2814084, 2.575596, 1, 0, 0, 1, 1,
1.323294, -0.7050658, 2.597865, 1, 0, 0, 1, 1,
1.352582, -1.488533, 2.294447, 0, 0, 0, 1, 1,
1.363297, 1.024936, 0.1415952, 0, 0, 0, 1, 1,
1.365515, -0.182913, 2.222587, 0, 0, 0, 1, 1,
1.366066, -1.243713, 2.429248, 0, 0, 0, 1, 1,
1.373607, 0.03034692, 1.598728, 0, 0, 0, 1, 1,
1.377421, 0.1492123, 2.118102, 0, 0, 0, 1, 1,
1.377614, 0.2817733, 0.4604373, 0, 0, 0, 1, 1,
1.378926, 0.9772909, 1.200045, 1, 1, 1, 1, 1,
1.387781, -0.2613457, 1.826456, 1, 1, 1, 1, 1,
1.388707, -0.08326711, 2.176903, 1, 1, 1, 1, 1,
1.395068, -0.7799813, 1.886153, 1, 1, 1, 1, 1,
1.395572, -0.2080756, 3.526166, 1, 1, 1, 1, 1,
1.396914, 1.14569, 0.8606741, 1, 1, 1, 1, 1,
1.400878, -0.5036017, 1.932691, 1, 1, 1, 1, 1,
1.411373, -1.119057, 4.223205, 1, 1, 1, 1, 1,
1.413982, 1.063727, 1.276564, 1, 1, 1, 1, 1,
1.415409, 1.771924, 1.743219, 1, 1, 1, 1, 1,
1.420903, -0.5981885, 2.325615, 1, 1, 1, 1, 1,
1.425067, 1.904801, -0.3274609, 1, 1, 1, 1, 1,
1.426384, 1.305399, 0.1414214, 1, 1, 1, 1, 1,
1.43509, -0.4848844, -0.1134771, 1, 1, 1, 1, 1,
1.436727, -0.7524107, 2.888866, 1, 1, 1, 1, 1,
1.437206, 0.755803, 1.262473, 0, 0, 1, 1, 1,
1.443286, 1.047444, -0.9935415, 1, 0, 0, 1, 1,
1.465165, -0.3890945, 2.770949, 1, 0, 0, 1, 1,
1.474542, 1.42438, 1.271615, 1, 0, 0, 1, 1,
1.490339, -0.361383, 3.106146, 1, 0, 0, 1, 1,
1.491545, -0.411909, 1.971938, 1, 0, 0, 1, 1,
1.511839, 0.901709, 2.533079, 0, 0, 0, 1, 1,
1.528046, -1.293528, 1.60426, 0, 0, 0, 1, 1,
1.533138, -1.752503, 2.532766, 0, 0, 0, 1, 1,
1.543365, -0.644141, 3.030185, 0, 0, 0, 1, 1,
1.553189, 0.1560509, 1.83018, 0, 0, 0, 1, 1,
1.554546, -1.171851, 0.6626024, 0, 0, 0, 1, 1,
1.584861, 0.2657956, 2.706406, 0, 0, 0, 1, 1,
1.585521, 0.315951, 0.5176298, 1, 1, 1, 1, 1,
1.589202, 0.2229093, 2.17763, 1, 1, 1, 1, 1,
1.591388, 1.654678, -0.2387763, 1, 1, 1, 1, 1,
1.612762, -0.1157915, -0.1934434, 1, 1, 1, 1, 1,
1.61333, -0.9309876, 0.4967925, 1, 1, 1, 1, 1,
1.615927, 0.5862773, -0.6948607, 1, 1, 1, 1, 1,
1.618164, 0.7286196, 0.8670787, 1, 1, 1, 1, 1,
1.638881, 0.3151761, 1.808999, 1, 1, 1, 1, 1,
1.639778, -1.433521, 1.835722, 1, 1, 1, 1, 1,
1.650086, -0.1777447, 2.136933, 1, 1, 1, 1, 1,
1.654338, 1.008986, 0.7762986, 1, 1, 1, 1, 1,
1.669449, 0.3024933, 0.4999003, 1, 1, 1, 1, 1,
1.674959, -0.9169227, 2.088733, 1, 1, 1, 1, 1,
1.694379, 0.553638, 0.5101788, 1, 1, 1, 1, 1,
1.696391, -2.239505, 0.3842636, 1, 1, 1, 1, 1,
1.700754, 0.7938629, 1.333342, 0, 0, 1, 1, 1,
1.72999, 0.2081287, 0.5777082, 1, 0, 0, 1, 1,
1.730422, -0.2207408, 0.8167021, 1, 0, 0, 1, 1,
1.732889, 0.1261723, 2.470242, 1, 0, 0, 1, 1,
1.750417, -0.4911026, 2.673441, 1, 0, 0, 1, 1,
1.757469, -1.197494, 2.435093, 1, 0, 0, 1, 1,
1.80267, -2.591891, 3.443278, 0, 0, 0, 1, 1,
1.812669, -0.8863293, 4.034506, 0, 0, 0, 1, 1,
1.817011, 1.777011, 2.537177, 0, 0, 0, 1, 1,
1.823086, -1.83246, 2.00589, 0, 0, 0, 1, 1,
1.83778, -0.581672, 4.205457, 0, 0, 0, 1, 1,
1.844733, 0.8103542, 0.8079119, 0, 0, 0, 1, 1,
1.853977, -0.4933059, 0.6348268, 0, 0, 0, 1, 1,
1.862078, -1.898444, -0.1028351, 1, 1, 1, 1, 1,
1.862854, 0.7342523, 0.8733334, 1, 1, 1, 1, 1,
1.890003, -1.96171, 2.826039, 1, 1, 1, 1, 1,
1.898361, -0.7332023, 2.68481, 1, 1, 1, 1, 1,
1.925584, 0.1646958, 1.527022, 1, 1, 1, 1, 1,
1.932009, 1.514944, 0.767063, 1, 1, 1, 1, 1,
1.942822, -0.444741, 0.558275, 1, 1, 1, 1, 1,
1.976322, -0.2159933, 1.386903, 1, 1, 1, 1, 1,
1.980719, -1.677296, 2.046867, 1, 1, 1, 1, 1,
1.985824, -1.558792, 0.5317037, 1, 1, 1, 1, 1,
1.989279, 0.3571267, 1.529206, 1, 1, 1, 1, 1,
2.025541, 0.6482958, 1.164938, 1, 1, 1, 1, 1,
2.066442, 1.394709, 2.725919, 1, 1, 1, 1, 1,
2.142861, -0.69689, 1.862022, 1, 1, 1, 1, 1,
2.171665, -0.6942887, 3.802704, 1, 1, 1, 1, 1,
2.204062, -0.334666, 1.026273, 0, 0, 1, 1, 1,
2.237139, -0.8135628, 0.9835732, 1, 0, 0, 1, 1,
2.24209, -0.2458671, 3.117499, 1, 0, 0, 1, 1,
2.247987, 1.111756, 2.982686, 1, 0, 0, 1, 1,
2.274273, -0.5873948, 4.053911, 1, 0, 0, 1, 1,
2.298146, 1.209425, 0.7442726, 1, 0, 0, 1, 1,
2.327331, 0.3587604, 2.148674, 0, 0, 0, 1, 1,
2.335203, -0.3361863, 3.428502, 0, 0, 0, 1, 1,
2.339671, -0.9070994, 2.333811, 0, 0, 0, 1, 1,
2.410671, 0.5335119, 2.10425, 0, 0, 0, 1, 1,
2.420135, 1.946737, 1.619066, 0, 0, 0, 1, 1,
2.507552, 1.920425, 1.101307, 0, 0, 0, 1, 1,
2.51079, -0.3413125, 3.015146, 0, 0, 0, 1, 1,
2.567947, -1.518807, 1.905777, 1, 1, 1, 1, 1,
2.600277, -0.164718, 2.041203, 1, 1, 1, 1, 1,
2.611252, 0.2468289, -0.2421152, 1, 1, 1, 1, 1,
2.637895, 0.7932518, 2.601887, 1, 1, 1, 1, 1,
2.638452, 1.076255, 1.901338, 1, 1, 1, 1, 1,
3.413799, -0.873809, 1.285701, 1, 1, 1, 1, 1,
3.541885, -0.2498182, 0.6585841, 1, 1, 1, 1, 1
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
var radius = 9.476606;
var distance = 33.28618;
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
mvMatrix.translate( -0.2383809, 0.03277683, 0.07764912 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.28618);
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
