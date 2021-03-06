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
-3.129394, -2.216652, -3.720463, 1, 0, 0, 1,
-2.644503, -0.9335974, -2.096182, 1, 0.007843138, 0, 1,
-2.541471, 0.6706947, -3.660632, 1, 0.01176471, 0, 1,
-2.488868, -0.6310996, -2.550586, 1, 0.01960784, 0, 1,
-2.407612, 0.9150687, -0.9561553, 1, 0.02352941, 0, 1,
-2.400033, 1.328683, -0.09227496, 1, 0.03137255, 0, 1,
-2.324665, -0.1060905, -2.723645, 1, 0.03529412, 0, 1,
-2.317299, 2.488326, 0.4138377, 1, 0.04313726, 0, 1,
-2.302101, 2.51723, -1.129598, 1, 0.04705882, 0, 1,
-2.28552, -0.6511378, -1.735, 1, 0.05490196, 0, 1,
-2.27578, 0.1000017, -1.989974, 1, 0.05882353, 0, 1,
-2.255808, -0.5443047, -0.581815, 1, 0.06666667, 0, 1,
-2.237182, -0.0970829, -1.992721, 1, 0.07058824, 0, 1,
-2.229573, 0.6231462, -1.349844, 1, 0.07843138, 0, 1,
-2.163231, -0.2417801, -3.134011, 1, 0.08235294, 0, 1,
-2.151354, -0.1204755, -2.690645, 1, 0.09019608, 0, 1,
-2.127742, 0.7047661, -2.971138, 1, 0.09411765, 0, 1,
-2.114957, 0.5474348, -2.314642, 1, 0.1019608, 0, 1,
-2.054629, -1.478549, -0.8436769, 1, 0.1098039, 0, 1,
-2.029942, -0.4650548, -1.216651, 1, 0.1137255, 0, 1,
-2.016223, 0.7114118, 0.2259754, 1, 0.1215686, 0, 1,
-2.004309, -2.275988, -1.849855, 1, 0.1254902, 0, 1,
-1.979661, -0.6383427, -3.271109, 1, 0.1333333, 0, 1,
-1.960061, 1.539365, 0.8482932, 1, 0.1372549, 0, 1,
-1.954607, 0.04121143, -0.5640239, 1, 0.145098, 0, 1,
-1.951438, -1.93321, -2.99885, 1, 0.1490196, 0, 1,
-1.949731, 1.118338, -0.9366331, 1, 0.1568628, 0, 1,
-1.946702, 0.3376803, -1.360885, 1, 0.1607843, 0, 1,
-1.937208, -0.4333186, 0.1795416, 1, 0.1686275, 0, 1,
-1.931292, 0.9427261, -0.692569, 1, 0.172549, 0, 1,
-1.9283, 0.290879, -1.994265, 1, 0.1803922, 0, 1,
-1.925012, 0.3437701, -0.7853636, 1, 0.1843137, 0, 1,
-1.841687, -0.01957721, -0.4427925, 1, 0.1921569, 0, 1,
-1.813082, -0.8732442, -3.115257, 1, 0.1960784, 0, 1,
-1.754473, -0.2962642, -2.293765, 1, 0.2039216, 0, 1,
-1.751866, 0.3223903, -1.826012, 1, 0.2117647, 0, 1,
-1.747745, -0.475036, -2.847922, 1, 0.2156863, 0, 1,
-1.74086, -0.6134459, -2.205621, 1, 0.2235294, 0, 1,
-1.731831, -1.141182, -2.066283, 1, 0.227451, 0, 1,
-1.730592, -1.160012, -1.693354, 1, 0.2352941, 0, 1,
-1.728265, -0.1077403, -0.5728924, 1, 0.2392157, 0, 1,
-1.716467, -0.9882939, -3.234013, 1, 0.2470588, 0, 1,
-1.702124, -0.46999, 0.9657977, 1, 0.2509804, 0, 1,
-1.69699, 0.1937149, -2.68936, 1, 0.2588235, 0, 1,
-1.691817, 0.8260484, -0.8058181, 1, 0.2627451, 0, 1,
-1.674132, -1.274043, -1.454623, 1, 0.2705882, 0, 1,
-1.670239, 0.6335447, -0.7607549, 1, 0.2745098, 0, 1,
-1.665276, 0.6875268, -0.5067677, 1, 0.282353, 0, 1,
-1.64722, 0.2427235, -2.724512, 1, 0.2862745, 0, 1,
-1.632869, -0.8717133, -0.9624614, 1, 0.2941177, 0, 1,
-1.630369, -0.5392404, -1.241351, 1, 0.3019608, 0, 1,
-1.619382, -1.114284, -2.293552, 1, 0.3058824, 0, 1,
-1.615933, -0.7732847, -2.48708, 1, 0.3137255, 0, 1,
-1.601788, 1.556447, -1.176469, 1, 0.3176471, 0, 1,
-1.598878, 1.428063, 0.178154, 1, 0.3254902, 0, 1,
-1.598674, -0.211289, -1.688944, 1, 0.3294118, 0, 1,
-1.585223, 0.9246236, -1.13003, 1, 0.3372549, 0, 1,
-1.579159, 0.9911832, -1.987698, 1, 0.3411765, 0, 1,
-1.574647, -0.1108303, -0.87229, 1, 0.3490196, 0, 1,
-1.548925, -1.265283, -3.14347, 1, 0.3529412, 0, 1,
-1.543487, -0.2133213, -2.998165, 1, 0.3607843, 0, 1,
-1.529573, -1.659372, -2.364918, 1, 0.3647059, 0, 1,
-1.523993, -0.04099579, -0.3038602, 1, 0.372549, 0, 1,
-1.517479, 1.426552, -0.5970976, 1, 0.3764706, 0, 1,
-1.507519, -0.651439, -1.886835, 1, 0.3843137, 0, 1,
-1.497612, 0.0370592, -1.334712, 1, 0.3882353, 0, 1,
-1.494424, 0.2220193, -1.299546, 1, 0.3960784, 0, 1,
-1.491223, -0.1095792, -1.470323, 1, 0.4039216, 0, 1,
-1.488486, -0.9815115, -2.792661, 1, 0.4078431, 0, 1,
-1.476496, 1.252939, -1.407652, 1, 0.4156863, 0, 1,
-1.473765, -0.09432425, -0.8767232, 1, 0.4196078, 0, 1,
-1.466171, -1.121483, -3.943929, 1, 0.427451, 0, 1,
-1.464207, -0.16935, -1.544582, 1, 0.4313726, 0, 1,
-1.464171, 1.214009, -0.08677815, 1, 0.4392157, 0, 1,
-1.458561, -1.10796, -1.469289, 1, 0.4431373, 0, 1,
-1.455181, 0.798172, -0.6307611, 1, 0.4509804, 0, 1,
-1.454389, -1.040709, -2.272132, 1, 0.454902, 0, 1,
-1.438796, 2.36112, -1.058728, 1, 0.4627451, 0, 1,
-1.433124, -0.2015951, -2.213129, 1, 0.4666667, 0, 1,
-1.431481, 0.7875883, 0.586833, 1, 0.4745098, 0, 1,
-1.411783, -0.1929426, -2.421462, 1, 0.4784314, 0, 1,
-1.40915, -1.221536, -1.959275, 1, 0.4862745, 0, 1,
-1.406582, 0.1403832, -1.627887, 1, 0.4901961, 0, 1,
-1.392726, -0.5852931, -2.159231, 1, 0.4980392, 0, 1,
-1.389911, 1.057566, -0.4997765, 1, 0.5058824, 0, 1,
-1.376105, 0.2703811, -2.479082, 1, 0.509804, 0, 1,
-1.350619, 0.866597, -1.376816, 1, 0.5176471, 0, 1,
-1.345736, -0.4844415, -1.717804, 1, 0.5215687, 0, 1,
-1.343213, 0.8791881, -1.25662, 1, 0.5294118, 0, 1,
-1.339791, 1.567542, 0.2225215, 1, 0.5333334, 0, 1,
-1.337654, 0.4023066, -3.841648, 1, 0.5411765, 0, 1,
-1.312341, 0.3394774, -3.187591, 1, 0.5450981, 0, 1,
-1.311743, -0.1758724, -0.7468976, 1, 0.5529412, 0, 1,
-1.3101, 0.1522573, -1.602157, 1, 0.5568628, 0, 1,
-1.307304, -1.689069, -3.2173, 1, 0.5647059, 0, 1,
-1.306007, -1.31704, -1.360157, 1, 0.5686275, 0, 1,
-1.305204, 1.076249, -2.228291, 1, 0.5764706, 0, 1,
-1.297285, -0.8828278, -1.926883, 1, 0.5803922, 0, 1,
-1.2861, 1.589407, 1.072745, 1, 0.5882353, 0, 1,
-1.284639, 0.02118058, -2.033858, 1, 0.5921569, 0, 1,
-1.282807, 0.01699221, -2.218083, 1, 0.6, 0, 1,
-1.277942, 0.6876929, -0.2403153, 1, 0.6078432, 0, 1,
-1.272548, -1.891515, -1.829188, 1, 0.6117647, 0, 1,
-1.265791, -0.358344, -3.270015, 1, 0.6196079, 0, 1,
-1.259084, -0.4522192, -0.3183298, 1, 0.6235294, 0, 1,
-1.258822, -1.020345, -3.135748, 1, 0.6313726, 0, 1,
-1.258299, 0.2051063, 0.7551367, 1, 0.6352941, 0, 1,
-1.243619, 1.913427, -0.1970586, 1, 0.6431373, 0, 1,
-1.240856, 0.3970755, -2.126171, 1, 0.6470588, 0, 1,
-1.235658, -0.1156536, -1.25186, 1, 0.654902, 0, 1,
-1.228714, 2.765899, -2.765208, 1, 0.6588235, 0, 1,
-1.227436, -0.4579441, -1.233939, 1, 0.6666667, 0, 1,
-1.227324, -1.192882, -2.017724, 1, 0.6705883, 0, 1,
-1.217725, 0.5417383, -1.323375, 1, 0.6784314, 0, 1,
-1.200734, -0.03434251, -1.418124, 1, 0.682353, 0, 1,
-1.195256, -0.8449459, -1.73567, 1, 0.6901961, 0, 1,
-1.194885, 0.4612729, -1.085059, 1, 0.6941177, 0, 1,
-1.18709, -1.64336, -2.319637, 1, 0.7019608, 0, 1,
-1.186011, 0.6518406, -1.965474, 1, 0.7098039, 0, 1,
-1.168551, -0.2525832, 0.1278436, 1, 0.7137255, 0, 1,
-1.163695, 1.888722, 2.044869, 1, 0.7215686, 0, 1,
-1.153792, 0.8156154, 0.5173962, 1, 0.7254902, 0, 1,
-1.143353, 1.931623, -2.075163, 1, 0.7333333, 0, 1,
-1.132325, -0.3996478, -0.3675065, 1, 0.7372549, 0, 1,
-1.112263, -2.073533, -2.96538, 1, 0.7450981, 0, 1,
-1.106855, -0.227683, -2.357009, 1, 0.7490196, 0, 1,
-1.105145, 1.763671, -0.4050951, 1, 0.7568628, 0, 1,
-1.104684, 0.4617912, -3.694396, 1, 0.7607843, 0, 1,
-1.088841, -0.1173555, -2.489723, 1, 0.7686275, 0, 1,
-1.083902, -0.1088984, -2.732118, 1, 0.772549, 0, 1,
-1.074481, -0.1374065, -4.329875, 1, 0.7803922, 0, 1,
-1.067994, -1.864004, -5.062237, 1, 0.7843137, 0, 1,
-1.065979, -1.662106, -1.465364, 1, 0.7921569, 0, 1,
-1.057078, 1.133993, 0.3303392, 1, 0.7960784, 0, 1,
-1.056871, -0.05608801, -1.203617, 1, 0.8039216, 0, 1,
-1.055326, 0.033127, -0.731766, 1, 0.8117647, 0, 1,
-1.049604, 0.9132302, -0.91181, 1, 0.8156863, 0, 1,
-1.048095, 1.546575, -0.8467291, 1, 0.8235294, 0, 1,
-1.044722, 0.6382672, -2.088333, 1, 0.827451, 0, 1,
-1.038603, -0.3175634, -5.460109, 1, 0.8352941, 0, 1,
-1.036181, 0.1378308, -2.192908, 1, 0.8392157, 0, 1,
-1.025033, 0.6935523, -0.179148, 1, 0.8470588, 0, 1,
-1.015194, -1.955547, -3.994616, 1, 0.8509804, 0, 1,
-1.008307, -0.7155982, -2.622856, 1, 0.8588235, 0, 1,
-1.00269, 1.286413, 1.385734, 1, 0.8627451, 0, 1,
-1.000401, 1.6026, -0.6623336, 1, 0.8705882, 0, 1,
-1.000291, -0.9066812, -2.444599, 1, 0.8745098, 0, 1,
-0.9948607, 1.580732, -0.04406152, 1, 0.8823529, 0, 1,
-0.9929087, -0.5666719, -2.147077, 1, 0.8862745, 0, 1,
-0.9868761, -1.879324, -2.594253, 1, 0.8941177, 0, 1,
-0.984692, 0.5675023, -2.010427, 1, 0.8980392, 0, 1,
-0.9763896, -2.534901, -2.693338, 1, 0.9058824, 0, 1,
-0.9757301, -0.2090979, -0.1341237, 1, 0.9137255, 0, 1,
-0.975616, 0.05524536, -0.9244732, 1, 0.9176471, 0, 1,
-0.9746833, 0.617449, -1.143993, 1, 0.9254902, 0, 1,
-0.9741364, 0.005219227, -1.617416, 1, 0.9294118, 0, 1,
-0.9736567, 0.1082425, -0.5014663, 1, 0.9372549, 0, 1,
-0.9714413, -0.3032971, -3.159261, 1, 0.9411765, 0, 1,
-0.9708047, 0.781705, -0.02230775, 1, 0.9490196, 0, 1,
-0.9684936, 1.006447, 0.8029174, 1, 0.9529412, 0, 1,
-0.9638244, 2.81527, -0.6420478, 1, 0.9607843, 0, 1,
-0.9500793, -1.681287, -2.621626, 1, 0.9647059, 0, 1,
-0.9451497, 2.429712, -1.194684, 1, 0.972549, 0, 1,
-0.9306499, -0.5480379, -2.387911, 1, 0.9764706, 0, 1,
-0.9303818, 0.4752136, -2.292151, 1, 0.9843137, 0, 1,
-0.9261065, -0.09666482, -2.187781, 1, 0.9882353, 0, 1,
-0.9236074, -0.7799634, -2.13529, 1, 0.9960784, 0, 1,
-0.9216617, 2.979878, -0.573664, 0.9960784, 1, 0, 1,
-0.919681, 0.8028339, -1.653859, 0.9921569, 1, 0, 1,
-0.9164109, 0.2890702, -0.6740979, 0.9843137, 1, 0, 1,
-0.9161068, -1.038586, -1.437974, 0.9803922, 1, 0, 1,
-0.9109537, 1.013314, -2.749702, 0.972549, 1, 0, 1,
-0.9077204, -1.245071, -2.587457, 0.9686275, 1, 0, 1,
-0.896642, 1.230182, 1.15705, 0.9607843, 1, 0, 1,
-0.8881348, 0.5464478, -1.232068, 0.9568627, 1, 0, 1,
-0.8880746, 0.8108617, -2.233062, 0.9490196, 1, 0, 1,
-0.8868059, -1.877709, -4.251014, 0.945098, 1, 0, 1,
-0.8782869, 1.292097, -0.9675214, 0.9372549, 1, 0, 1,
-0.8756999, -1.310662, -0.6863998, 0.9333333, 1, 0, 1,
-0.8750323, 0.4178849, -0.8766614, 0.9254902, 1, 0, 1,
-0.8680583, 0.4582005, -3.448691, 0.9215686, 1, 0, 1,
-0.8679123, -0.08943169, -2.335988, 0.9137255, 1, 0, 1,
-0.8626767, 0.05909342, -2.501698, 0.9098039, 1, 0, 1,
-0.8606876, 0.5903412, -0.4381214, 0.9019608, 1, 0, 1,
-0.856653, -0.09122399, -1.80004, 0.8941177, 1, 0, 1,
-0.8534279, -1.506562, -2.450171, 0.8901961, 1, 0, 1,
-0.84997, 0.3187218, -2.930841, 0.8823529, 1, 0, 1,
-0.8475136, 0.3486318, -1.79419, 0.8784314, 1, 0, 1,
-0.8457801, 0.1813103, -1.805984, 0.8705882, 1, 0, 1,
-0.8337955, 0.5952502, -1.934496, 0.8666667, 1, 0, 1,
-0.8315133, -0.07775049, -2.208914, 0.8588235, 1, 0, 1,
-0.8298552, 0.7706072, -0.2135013, 0.854902, 1, 0, 1,
-0.8279976, 0.7025169, 1.442489, 0.8470588, 1, 0, 1,
-0.8272115, 0.1977715, -1.235853, 0.8431373, 1, 0, 1,
-0.8236089, -1.379499, -1.545123, 0.8352941, 1, 0, 1,
-0.8219474, -0.9273659, -2.269375, 0.8313726, 1, 0, 1,
-0.813586, 1.899223, -0.9654332, 0.8235294, 1, 0, 1,
-0.8129689, 0.4993818, -1.351827, 0.8196079, 1, 0, 1,
-0.8077891, -1.898167, -2.460926, 0.8117647, 1, 0, 1,
-0.8047313, -0.1554668, -1.197667, 0.8078431, 1, 0, 1,
-0.804695, -0.8298387, -2.279429, 0.8, 1, 0, 1,
-0.8042011, 0.9568126, 1.235318, 0.7921569, 1, 0, 1,
-0.8031822, -0.1063012, -4.304725, 0.7882353, 1, 0, 1,
-0.7997987, 2.074178, 0.2662255, 0.7803922, 1, 0, 1,
-0.7963145, -1.184152, -2.506659, 0.7764706, 1, 0, 1,
-0.7928861, -1.062669, -1.956525, 0.7686275, 1, 0, 1,
-0.7917172, -0.1364056, -2.060818, 0.7647059, 1, 0, 1,
-0.7891294, -0.2677296, -3.081332, 0.7568628, 1, 0, 1,
-0.7845218, 0.09120327, 0.008732926, 0.7529412, 1, 0, 1,
-0.7820773, -1.098735, -1.845598, 0.7450981, 1, 0, 1,
-0.7753991, 0.1821769, -0.5265808, 0.7411765, 1, 0, 1,
-0.7611659, 1.139823, -1.033071, 0.7333333, 1, 0, 1,
-0.7453645, -1.267864, -0.9138526, 0.7294118, 1, 0, 1,
-0.7414522, 0.6561322, -2.518057, 0.7215686, 1, 0, 1,
-0.7409713, 1.354197, 0.3673532, 0.7176471, 1, 0, 1,
-0.740389, 0.253937, -1.105823, 0.7098039, 1, 0, 1,
-0.7402477, -0.6109368, -1.800685, 0.7058824, 1, 0, 1,
-0.7364203, -1.428973, -3.476808, 0.6980392, 1, 0, 1,
-0.7358403, 0.1085207, -2.256216, 0.6901961, 1, 0, 1,
-0.7278121, 0.7891513, -1.102971, 0.6862745, 1, 0, 1,
-0.7218485, -0.5647083, -3.598906, 0.6784314, 1, 0, 1,
-0.7183764, 1.333071, -0.3384397, 0.6745098, 1, 0, 1,
-0.7146618, -0.8805891, -2.588456, 0.6666667, 1, 0, 1,
-0.6986504, 0.1241117, -2.6484, 0.6627451, 1, 0, 1,
-0.6975807, -0.5742533, -1.335834, 0.654902, 1, 0, 1,
-0.6960375, -0.515715, -2.547371, 0.6509804, 1, 0, 1,
-0.6951833, 1.696587, -0.2630847, 0.6431373, 1, 0, 1,
-0.6949863, 0.1801234, -1.165841, 0.6392157, 1, 0, 1,
-0.694658, 0.7579609, -1.454284, 0.6313726, 1, 0, 1,
-0.6941469, 0.1509933, -2.13725, 0.627451, 1, 0, 1,
-0.6931373, -0.4669259, -1.60509, 0.6196079, 1, 0, 1,
-0.6878943, 2.315546, -0.6440455, 0.6156863, 1, 0, 1,
-0.685714, 2.043703, -0.5707809, 0.6078432, 1, 0, 1,
-0.6650773, 0.1938073, -0.2122719, 0.6039216, 1, 0, 1,
-0.6625009, 0.5674955, -0.05698993, 0.5960785, 1, 0, 1,
-0.6563064, -0.6655099, -3.744941, 0.5882353, 1, 0, 1,
-0.6556677, 0.1275317, -1.296904, 0.5843138, 1, 0, 1,
-0.6506044, 1.4169, 0.003006038, 0.5764706, 1, 0, 1,
-0.6497161, -0.3300578, -1.779991, 0.572549, 1, 0, 1,
-0.6491493, 0.175321, -1.278929, 0.5647059, 1, 0, 1,
-0.6475657, 0.6884775, 0.6788323, 0.5607843, 1, 0, 1,
-0.6474679, -0.4213931, -4.054465, 0.5529412, 1, 0, 1,
-0.6411474, -0.1401596, -0.3809821, 0.5490196, 1, 0, 1,
-0.6370903, 0.5450232, 0.124591, 0.5411765, 1, 0, 1,
-0.6349816, -0.0855841, -1.424183, 0.5372549, 1, 0, 1,
-0.6330998, 0.3989553, -1.722788, 0.5294118, 1, 0, 1,
-0.6234881, 1.953571, 1.198882, 0.5254902, 1, 0, 1,
-0.6185649, 0.9274032, 0.3629463, 0.5176471, 1, 0, 1,
-0.6167467, 0.6057636, -0.5505884, 0.5137255, 1, 0, 1,
-0.6155497, 1.465655, 1.520002, 0.5058824, 1, 0, 1,
-0.6106517, 0.3605038, -1.050965, 0.5019608, 1, 0, 1,
-0.6072193, 0.1773965, -0.947128, 0.4941176, 1, 0, 1,
-0.6021985, 0.7491912, -0.7632175, 0.4862745, 1, 0, 1,
-0.5983772, 0.8862881, -1.463841, 0.4823529, 1, 0, 1,
-0.5957536, -0.3257738, -3.569117, 0.4745098, 1, 0, 1,
-0.5904785, 1.828587, 0.9853556, 0.4705882, 1, 0, 1,
-0.5863625, 0.5884546, -0.6851755, 0.4627451, 1, 0, 1,
-0.5810511, -0.9323462, -4.556245, 0.4588235, 1, 0, 1,
-0.5789525, -1.002051, -1.798705, 0.4509804, 1, 0, 1,
-0.5775094, -1.305882, -2.793786, 0.4470588, 1, 0, 1,
-0.5749525, 0.6346393, -0.05773924, 0.4392157, 1, 0, 1,
-0.5746727, 1.011408, -1.78422, 0.4352941, 1, 0, 1,
-0.5729104, 0.228654, -2.458317, 0.427451, 1, 0, 1,
-0.5715783, 1.606861, 0.0528746, 0.4235294, 1, 0, 1,
-0.5668855, 0.9706879, -0.9921796, 0.4156863, 1, 0, 1,
-0.5637559, 1.118173, -0.9595179, 0.4117647, 1, 0, 1,
-0.5605445, 1.404442, -0.6603092, 0.4039216, 1, 0, 1,
-0.5579906, 0.5894843, 0.05951477, 0.3960784, 1, 0, 1,
-0.5573327, -2.313444, -2.335259, 0.3921569, 1, 0, 1,
-0.5557926, 0.2005087, -0.8441296, 0.3843137, 1, 0, 1,
-0.5531384, 0.05484457, -0.9344591, 0.3803922, 1, 0, 1,
-0.5526326, -1.355168, -2.930067, 0.372549, 1, 0, 1,
-0.5506709, -0.02689204, -1.533441, 0.3686275, 1, 0, 1,
-0.548544, -0.9453678, -3.593711, 0.3607843, 1, 0, 1,
-0.5435819, 2.293029, -1.055939, 0.3568628, 1, 0, 1,
-0.5394786, 0.7503198, -1.131886, 0.3490196, 1, 0, 1,
-0.5372066, 0.1563149, -0.223669, 0.345098, 1, 0, 1,
-0.5337127, -1.002965, -2.639216, 0.3372549, 1, 0, 1,
-0.5316744, -0.6380966, -2.229554, 0.3333333, 1, 0, 1,
-0.5310199, -0.4642887, -2.908149, 0.3254902, 1, 0, 1,
-0.527222, -0.1817301, -2.855819, 0.3215686, 1, 0, 1,
-0.5257581, -0.1042534, -2.113527, 0.3137255, 1, 0, 1,
-0.5241728, -0.3866375, -1.175893, 0.3098039, 1, 0, 1,
-0.5239801, 0.4021903, -0.992696, 0.3019608, 1, 0, 1,
-0.5236758, -1.424044, -2.060725, 0.2941177, 1, 0, 1,
-0.5226145, 0.8546099, -0.7920772, 0.2901961, 1, 0, 1,
-0.5197633, 0.4019235, -1.439974, 0.282353, 1, 0, 1,
-0.519393, -0.734111, -3.496262, 0.2784314, 1, 0, 1,
-0.5168905, -1.169846, -4.337919, 0.2705882, 1, 0, 1,
-0.5162583, 0.6423647, -0.7937197, 0.2666667, 1, 0, 1,
-0.509496, 0.9510528, -1.861306, 0.2588235, 1, 0, 1,
-0.5068834, 0.178886, -1.092925, 0.254902, 1, 0, 1,
-0.5027511, 2.207619, -0.6595348, 0.2470588, 1, 0, 1,
-0.5005175, -0.01518057, -0.5325801, 0.2431373, 1, 0, 1,
-0.4994198, -0.4657789, -2.489426, 0.2352941, 1, 0, 1,
-0.4991111, 0.01080374, 0.3799514, 0.2313726, 1, 0, 1,
-0.4955411, -1.017356, -2.918526, 0.2235294, 1, 0, 1,
-0.4941261, -0.6265282, -4.088329, 0.2196078, 1, 0, 1,
-0.4931563, -0.06027124, 0.04120551, 0.2117647, 1, 0, 1,
-0.4922325, -0.07573663, 0.07794864, 0.2078431, 1, 0, 1,
-0.4903782, -0.4530011, -2.80702, 0.2, 1, 0, 1,
-0.4896967, 0.9096992, -2.847936, 0.1921569, 1, 0, 1,
-0.4857681, 1.080911, 0.9442449, 0.1882353, 1, 0, 1,
-0.4820168, 0.600142, 1.261674, 0.1803922, 1, 0, 1,
-0.4790022, -1.732814, -2.688608, 0.1764706, 1, 0, 1,
-0.4762376, 1.16423, -2.90403, 0.1686275, 1, 0, 1,
-0.4709469, 0.6161991, -0.7332577, 0.1647059, 1, 0, 1,
-0.4662755, -0.3606015, -4.599992, 0.1568628, 1, 0, 1,
-0.4647943, 0.4318118, -0.9085402, 0.1529412, 1, 0, 1,
-0.4607967, 2.191787, -1.98938, 0.145098, 1, 0, 1,
-0.4587694, -0.9408711, -0.9788769, 0.1411765, 1, 0, 1,
-0.4574149, -0.5927919, -2.392787, 0.1333333, 1, 0, 1,
-0.4566202, -0.498756, -3.38187, 0.1294118, 1, 0, 1,
-0.4441467, 0.2739976, -1.914294, 0.1215686, 1, 0, 1,
-0.4439935, 1.031221, -1.146563, 0.1176471, 1, 0, 1,
-0.4426822, -0.2898055, -2.751437, 0.1098039, 1, 0, 1,
-0.4416522, 1.442384, 0.808295, 0.1058824, 1, 0, 1,
-0.4395154, 0.6910348, 0.06202456, 0.09803922, 1, 0, 1,
-0.4250764, 0.99457, -0.02951047, 0.09019608, 1, 0, 1,
-0.4210351, -0.4877268, -4.880916, 0.08627451, 1, 0, 1,
-0.4187946, 1.127564, -0.3731038, 0.07843138, 1, 0, 1,
-0.4152266, -0.6163516, -3.303492, 0.07450981, 1, 0, 1,
-0.4144036, 0.1271466, -1.451169, 0.06666667, 1, 0, 1,
-0.4128433, 0.2259678, -1.063771, 0.0627451, 1, 0, 1,
-0.4115512, 0.8066087, -1.289961, 0.05490196, 1, 0, 1,
-0.4075932, 0.7623311, 0.4540373, 0.05098039, 1, 0, 1,
-0.4055209, -0.9843939, -2.891474, 0.04313726, 1, 0, 1,
-0.4038194, 0.8508641, -0.3703332, 0.03921569, 1, 0, 1,
-0.4018086, -0.2422464, -2.760087, 0.03137255, 1, 0, 1,
-0.3980744, 0.3409086, -0.3970014, 0.02745098, 1, 0, 1,
-0.3946678, 0.7317417, 0.4122792, 0.01960784, 1, 0, 1,
-0.3932689, 0.570851, -0.212237, 0.01568628, 1, 0, 1,
-0.3918634, 0.6871626, -2.161053, 0.007843138, 1, 0, 1,
-0.3891029, 0.4560564, -0.001993736, 0.003921569, 1, 0, 1,
-0.3869337, 0.1999168, -3.237384, 0, 1, 0.003921569, 1,
-0.3857112, 1.073709, -0.009649037, 0, 1, 0.01176471, 1,
-0.3843668, 1.86429, -0.7181603, 0, 1, 0.01568628, 1,
-0.3803235, -0.6454555, -2.075104, 0, 1, 0.02352941, 1,
-0.3785629, 1.027396, -0.508333, 0, 1, 0.02745098, 1,
-0.3757758, 1.146398, -0.1409396, 0, 1, 0.03529412, 1,
-0.3753909, -1.592149, -1.542488, 0, 1, 0.03921569, 1,
-0.3709411, 0.4012142, 0.7485152, 0, 1, 0.04705882, 1,
-0.3608976, -0.7096242, -2.209043, 0, 1, 0.05098039, 1,
-0.3595952, -2.72136, -2.65379, 0, 1, 0.05882353, 1,
-0.3496359, 0.5394432, -0.1219823, 0, 1, 0.0627451, 1,
-0.3492517, 1.446878, -0.4476727, 0, 1, 0.07058824, 1,
-0.3393753, -0.2116109, -2.525803, 0, 1, 0.07450981, 1,
-0.3388279, 0.8458052, -0.2289131, 0, 1, 0.08235294, 1,
-0.3318554, -2.368572, -1.888404, 0, 1, 0.08627451, 1,
-0.3174252, -1.035759, -3.482496, 0, 1, 0.09411765, 1,
-0.3151457, 0.9217994, -0.2950829, 0, 1, 0.1019608, 1,
-0.3144693, 0.8753197, -1.018816, 0, 1, 0.1058824, 1,
-0.3134831, -1.675164, -3.667645, 0, 1, 0.1137255, 1,
-0.306255, -0.9829544, -4.210453, 0, 1, 0.1176471, 1,
-0.3061711, -0.8135365, -4.113689, 0, 1, 0.1254902, 1,
-0.3044939, 0.6724784, 1.081979, 0, 1, 0.1294118, 1,
-0.3036149, 0.4492939, -0.8096651, 0, 1, 0.1372549, 1,
-0.2971551, -1.274983, -4.415344, 0, 1, 0.1411765, 1,
-0.2964754, -0.3884966, -2.882744, 0, 1, 0.1490196, 1,
-0.2947116, -1.157127, -3.2766, 0, 1, 0.1529412, 1,
-0.2931145, -1.492094, -2.85427, 0, 1, 0.1607843, 1,
-0.289916, -0.1559197, -1.602969, 0, 1, 0.1647059, 1,
-0.2893672, 0.7304871, 1.055017, 0, 1, 0.172549, 1,
-0.2893205, -0.2782071, -1.857124, 0, 1, 0.1764706, 1,
-0.2772465, -1.473189, -3.862118, 0, 1, 0.1843137, 1,
-0.2756306, 1.445049, 0.2846583, 0, 1, 0.1882353, 1,
-0.2740371, 0.1606027, -0.5049652, 0, 1, 0.1960784, 1,
-0.2719573, -0.5846182, -2.274402, 0, 1, 0.2039216, 1,
-0.2707911, -0.7581957, -4.600087, 0, 1, 0.2078431, 1,
-0.2691194, -0.5779595, -1.153131, 0, 1, 0.2156863, 1,
-0.2608848, 0.1586175, -2.120898, 0, 1, 0.2196078, 1,
-0.2607457, -0.8053866, -2.47474, 0, 1, 0.227451, 1,
-0.2603262, 0.4328623, -0.6901581, 0, 1, 0.2313726, 1,
-0.2593225, -1.530109, -2.053446, 0, 1, 0.2392157, 1,
-0.2579526, 0.5742196, -0.8711266, 0, 1, 0.2431373, 1,
-0.256793, 0.550196, -1.364841, 0, 1, 0.2509804, 1,
-0.2539082, -0.1879022, -1.244117, 0, 1, 0.254902, 1,
-0.2520747, 1.112152, -0.2571931, 0, 1, 0.2627451, 1,
-0.2496051, 0.2025244, -0.7142668, 0, 1, 0.2666667, 1,
-0.2474484, -0.3157622, -1.766035, 0, 1, 0.2745098, 1,
-0.2434722, -0.1354649, -2.668416, 0, 1, 0.2784314, 1,
-0.242808, 1.044845, -0.6809601, 0, 1, 0.2862745, 1,
-0.2366003, -0.6286418, -5.63973, 0, 1, 0.2901961, 1,
-0.2302372, -0.7408221, -3.665908, 0, 1, 0.2980392, 1,
-0.2294788, -0.7875832, -3.266655, 0, 1, 0.3058824, 1,
-0.2259918, 0.5420288, -2.586695, 0, 1, 0.3098039, 1,
-0.2242503, 2.608312, 0.7695797, 0, 1, 0.3176471, 1,
-0.2240853, 0.9225029, -1.96423, 0, 1, 0.3215686, 1,
-0.2188067, -0.5628689, -3.24728, 0, 1, 0.3294118, 1,
-0.2074323, 1.911424, 1.272155, 0, 1, 0.3333333, 1,
-0.2073115, -0.2010292, -2.673615, 0, 1, 0.3411765, 1,
-0.2063349, 1.032697, 1.026911, 0, 1, 0.345098, 1,
-0.2059027, -1.940932, -2.232314, 0, 1, 0.3529412, 1,
-0.2044156, -1.63469, -3.198525, 0, 1, 0.3568628, 1,
-0.2004826, 1.208285, -0.1777603, 0, 1, 0.3647059, 1,
-0.2004499, 0.7092617, -0.3013929, 0, 1, 0.3686275, 1,
-0.1973296, -0.8575696, -3.303655, 0, 1, 0.3764706, 1,
-0.1938554, -0.4778454, -2.352078, 0, 1, 0.3803922, 1,
-0.1914837, 1.113059, 0.4700164, 0, 1, 0.3882353, 1,
-0.1902744, -1.351382, -1.247687, 0, 1, 0.3921569, 1,
-0.1845267, 0.190112, -0.02090112, 0, 1, 0.4, 1,
-0.1839015, -1.685244, -2.714706, 0, 1, 0.4078431, 1,
-0.1821547, -1.165925, -3.334866, 0, 1, 0.4117647, 1,
-0.1813581, -0.8117408, -2.692581, 0, 1, 0.4196078, 1,
-0.1812752, 0.3058042, -1.830091, 0, 1, 0.4235294, 1,
-0.1787017, 0.8341095, -1.025679, 0, 1, 0.4313726, 1,
-0.1780987, 1.428986, -1.538284, 0, 1, 0.4352941, 1,
-0.1688638, 0.3586819, -1.156606, 0, 1, 0.4431373, 1,
-0.168052, -1.156193, -1.815678, 0, 1, 0.4470588, 1,
-0.1657757, -0.5664664, -4.447575, 0, 1, 0.454902, 1,
-0.1649972, 0.4760105, -0.8927273, 0, 1, 0.4588235, 1,
-0.1618168, 1.087909, -0.643249, 0, 1, 0.4666667, 1,
-0.1606249, 0.2361502, -2.014557, 0, 1, 0.4705882, 1,
-0.1604764, 0.6566589, 0.132303, 0, 1, 0.4784314, 1,
-0.1597066, 1.614196, -1.092484, 0, 1, 0.4823529, 1,
-0.1594992, 1.602587, 0.1819886, 0, 1, 0.4901961, 1,
-0.1566044, -1.071926, -2.11698, 0, 1, 0.4941176, 1,
-0.1560222, -0.2240467, -3.564957, 0, 1, 0.5019608, 1,
-0.1536051, 0.3418098, -0.7475722, 0, 1, 0.509804, 1,
-0.1501618, -1.04597, -2.68924, 0, 1, 0.5137255, 1,
-0.1466168, -0.3800611, -2.66549, 0, 1, 0.5215687, 1,
-0.1455724, 0.848972, -0.1871836, 0, 1, 0.5254902, 1,
-0.1449338, 0.03722249, -1.50765, 0, 1, 0.5333334, 1,
-0.1390927, -0.5125595, -3.858668, 0, 1, 0.5372549, 1,
-0.1345707, -1.317525, -2.554297, 0, 1, 0.5450981, 1,
-0.1343964, -1.084724, -3.281876, 0, 1, 0.5490196, 1,
-0.131754, 0.4232171, 0.5701013, 0, 1, 0.5568628, 1,
-0.1314457, -1.03285, -4.14546, 0, 1, 0.5607843, 1,
-0.1309689, 1.637823, 2.090213, 0, 1, 0.5686275, 1,
-0.1290021, 0.8461055, 0.05136926, 0, 1, 0.572549, 1,
-0.1284045, 0.380795, -1.697809, 0, 1, 0.5803922, 1,
-0.1282734, -0.7392374, -3.821743, 0, 1, 0.5843138, 1,
-0.1278987, -0.8267387, -3.089, 0, 1, 0.5921569, 1,
-0.1245259, -0.5968677, -3.615007, 0, 1, 0.5960785, 1,
-0.1193158, -0.172115, -2.449703, 0, 1, 0.6039216, 1,
-0.1184282, 1.086362, -0.7248415, 0, 1, 0.6117647, 1,
-0.1150004, -0.8492126, -1.809687, 0, 1, 0.6156863, 1,
-0.1145099, 0.4903735, -1.416206, 0, 1, 0.6235294, 1,
-0.1121268, -0.1308053, -3.885143, 0, 1, 0.627451, 1,
-0.111051, -0.1818676, -3.452083, 0, 1, 0.6352941, 1,
-0.1008268, -1.789116, -3.669108, 0, 1, 0.6392157, 1,
-0.1001001, 0.20112, -0.1584406, 0, 1, 0.6470588, 1,
-0.09830011, -0.4741892, -4.586818, 0, 1, 0.6509804, 1,
-0.097719, 0.911777, -0.3737157, 0, 1, 0.6588235, 1,
-0.09754261, -2.168863, -2.94002, 0, 1, 0.6627451, 1,
-0.09628166, -0.08638886, -3.365814, 0, 1, 0.6705883, 1,
-0.09606728, 0.7256175, 0.1976038, 0, 1, 0.6745098, 1,
-0.09563377, -0.7824494, -2.488278, 0, 1, 0.682353, 1,
-0.09193804, -0.3577874, -3.098705, 0, 1, 0.6862745, 1,
-0.09144632, 0.0986198, -1.193142, 0, 1, 0.6941177, 1,
-0.08625607, -0.7340744, -2.787546, 0, 1, 0.7019608, 1,
-0.08583061, -0.5084209, -0.9700437, 0, 1, 0.7058824, 1,
-0.08056935, -0.7242821, -3.845678, 0, 1, 0.7137255, 1,
-0.07733722, 1.273708, -0.4014881, 0, 1, 0.7176471, 1,
-0.07611503, 0.6482395, -1.369215, 0, 1, 0.7254902, 1,
-0.07515987, 2.696823, -1.73042, 0, 1, 0.7294118, 1,
-0.07506147, -0.5176257, -1.364999, 0, 1, 0.7372549, 1,
-0.07054863, 0.8363298, 0.9543077, 0, 1, 0.7411765, 1,
-0.06945761, 0.5730131, -1.059163, 0, 1, 0.7490196, 1,
-0.06367749, 0.809281, -0.5106232, 0, 1, 0.7529412, 1,
-0.06191663, -0.9878766, -2.812045, 0, 1, 0.7607843, 1,
-0.06092878, 2.280943, -0.1728376, 0, 1, 0.7647059, 1,
-0.05925024, -0.1160075, -2.655474, 0, 1, 0.772549, 1,
-0.05884007, -1.073181, -3.48122, 0, 1, 0.7764706, 1,
-0.05821398, 0.9273627, 0.4764397, 0, 1, 0.7843137, 1,
-0.05691576, -0.3983685, -3.188958, 0, 1, 0.7882353, 1,
-0.05631914, 1.299947, -0.5896338, 0, 1, 0.7960784, 1,
-0.05531073, 0.01464485, -1.247268, 0, 1, 0.8039216, 1,
-0.05102016, 0.251741, -0.877952, 0, 1, 0.8078431, 1,
-0.04630476, -1.329108, -3.087808, 0, 1, 0.8156863, 1,
-0.04474354, 1.407001, 0.5486677, 0, 1, 0.8196079, 1,
-0.04068388, 1.725269, 2.219939, 0, 1, 0.827451, 1,
-0.04006538, -1.60274, -1.369678, 0, 1, 0.8313726, 1,
-0.03899468, 0.3793418, 0.7273346, 0, 1, 0.8392157, 1,
-0.03236295, 0.0101346, -2.259552, 0, 1, 0.8431373, 1,
-0.03169104, 0.8476121, 1.451022, 0, 1, 0.8509804, 1,
-0.03083289, -1.107658, -3.837632, 0, 1, 0.854902, 1,
-0.03059411, 0.6455202, -0.5284616, 0, 1, 0.8627451, 1,
-0.02825631, -1.781839, -2.525287, 0, 1, 0.8666667, 1,
-0.01978862, -1.16607, -2.097812, 0, 1, 0.8745098, 1,
-0.01782332, 0.160726, -0.378076, 0, 1, 0.8784314, 1,
-0.01243742, -0.09715518, -3.941521, 0, 1, 0.8862745, 1,
-0.009794762, -0.1864964, -1.591988, 0, 1, 0.8901961, 1,
-0.008832201, 0.08778627, -0.5997242, 0, 1, 0.8980392, 1,
-0.007486014, 0.9522624, -1.997754, 0, 1, 0.9058824, 1,
-0.005915515, -0.2561348, -2.85554, 0, 1, 0.9098039, 1,
-0.00561503, -0.127158, -4.71086, 0, 1, 0.9176471, 1,
-0.004704114, -1.268988, -3.034322, 0, 1, 0.9215686, 1,
0.0003277455, 0.5011737, 1.053323, 0, 1, 0.9294118, 1,
0.002737548, 0.492311, -0.7339123, 0, 1, 0.9333333, 1,
0.004747023, 2.384524, 0.2560783, 0, 1, 0.9411765, 1,
0.007110324, -0.004494855, 1.052297, 0, 1, 0.945098, 1,
0.009467754, 0.1196954, 0.2128276, 0, 1, 0.9529412, 1,
0.01166763, -2.321386, 3.214738, 0, 1, 0.9568627, 1,
0.01359003, -1.339477, 4.377104, 0, 1, 0.9647059, 1,
0.01519939, 0.9250063, -1.10184, 0, 1, 0.9686275, 1,
0.01521106, -1.280789, 3.551101, 0, 1, 0.9764706, 1,
0.01604382, 0.261973, -0.8610161, 0, 1, 0.9803922, 1,
0.01655401, 1.333009, 0.1153355, 0, 1, 0.9882353, 1,
0.01659107, -1.556592, 4.822831, 0, 1, 0.9921569, 1,
0.01814249, 1.241218, -0.2470906, 0, 1, 1, 1,
0.02515282, 0.05984305, -0.1757072, 0, 0.9921569, 1, 1,
0.02930269, -1.012148, 3.474367, 0, 0.9882353, 1, 1,
0.02962029, -1.947517, 2.407492, 0, 0.9803922, 1, 1,
0.03221224, -0.5539302, 4.123144, 0, 0.9764706, 1, 1,
0.03323223, -0.936621, 4.436429, 0, 0.9686275, 1, 1,
0.03748125, 0.7137842, 0.7040724, 0, 0.9647059, 1, 1,
0.03749406, 0.01540241, 1.430275, 0, 0.9568627, 1, 1,
0.03807044, -0.01743444, 1.26829, 0, 0.9529412, 1, 1,
0.0408628, -0.1289786, 2.709512, 0, 0.945098, 1, 1,
0.04145982, -0.2207203, 2.819381, 0, 0.9411765, 1, 1,
0.04263667, 1.814824, -0.6499919, 0, 0.9333333, 1, 1,
0.04494844, 0.5205884, -0.6662481, 0, 0.9294118, 1, 1,
0.05691711, -0.3309319, 2.055344, 0, 0.9215686, 1, 1,
0.0570325, -0.6059837, 1.225993, 0, 0.9176471, 1, 1,
0.06001172, -0.1164127, 3.113949, 0, 0.9098039, 1, 1,
0.06306682, 0.5646784, -0.8604399, 0, 0.9058824, 1, 1,
0.06597924, -1.796877, 3.590756, 0, 0.8980392, 1, 1,
0.06831924, 0.5446132, -1.621195, 0, 0.8901961, 1, 1,
0.06916975, 0.6012098, 0.06595904, 0, 0.8862745, 1, 1,
0.06948747, 1.002671, 0.6552203, 0, 0.8784314, 1, 1,
0.07143973, 0.4194357, 0.9148061, 0, 0.8745098, 1, 1,
0.07173673, 0.6403265, 1.101766, 0, 0.8666667, 1, 1,
0.07354473, 0.1043813, -0.2214684, 0, 0.8627451, 1, 1,
0.07838313, -0.1476013, 2.024395, 0, 0.854902, 1, 1,
0.08041606, 1.167099, -0.652144, 0, 0.8509804, 1, 1,
0.08141661, -0.5895155, 0.9715652, 0, 0.8431373, 1, 1,
0.08343127, 2.433806, 0.3153509, 0, 0.8392157, 1, 1,
0.08463696, 0.4186682, 0.2305775, 0, 0.8313726, 1, 1,
0.08978527, -0.3528586, 3.12914, 0, 0.827451, 1, 1,
0.09035194, -0.8476328, 3.995517, 0, 0.8196079, 1, 1,
0.09189056, 0.4061441, -0.4303765, 0, 0.8156863, 1, 1,
0.09431235, -0.3785223, 3.071454, 0, 0.8078431, 1, 1,
0.09694199, -0.7238279, 3.268182, 0, 0.8039216, 1, 1,
0.105814, 0.105596, -1.267333, 0, 0.7960784, 1, 1,
0.1094799, -0.09544806, 1.927251, 0, 0.7882353, 1, 1,
0.1099458, 0.701979, 0.9487002, 0, 0.7843137, 1, 1,
0.1122706, 0.6867489, -1.27126, 0, 0.7764706, 1, 1,
0.1133949, -1.623484, 2.937821, 0, 0.772549, 1, 1,
0.1178237, -1.185215, 2.479375, 0, 0.7647059, 1, 1,
0.1200911, 1.092269, -0.6384434, 0, 0.7607843, 1, 1,
0.1225282, 1.317167, 1.58085, 0, 0.7529412, 1, 1,
0.1226073, -0.5281317, 2.795695, 0, 0.7490196, 1, 1,
0.1256674, -1.788269, 2.767872, 0, 0.7411765, 1, 1,
0.1267471, -0.3068036, 4.138736, 0, 0.7372549, 1, 1,
0.1305487, 0.100957, 0.8831482, 0, 0.7294118, 1, 1,
0.1330554, 1.834742, 0.2251347, 0, 0.7254902, 1, 1,
0.1334652, -1.065932, 1.946935, 0, 0.7176471, 1, 1,
0.1382327, 0.1089491, 2.127105, 0, 0.7137255, 1, 1,
0.1427323, 0.9421425, -0.004517878, 0, 0.7058824, 1, 1,
0.1507992, 0.9130309, 0.4113863, 0, 0.6980392, 1, 1,
0.1512258, 0.3499002, 1.370062, 0, 0.6941177, 1, 1,
0.152672, 1.315208, 0.3292476, 0, 0.6862745, 1, 1,
0.1534567, 0.0228635, 1.03817, 0, 0.682353, 1, 1,
0.1555327, 0.08899178, 0.6630045, 0, 0.6745098, 1, 1,
0.1559497, -0.4650709, 2.716027, 0, 0.6705883, 1, 1,
0.1560489, 1.513542, 1.000083, 0, 0.6627451, 1, 1,
0.1635168, 0.6952252, -0.1519876, 0, 0.6588235, 1, 1,
0.163608, 0.09874132, -0.3788991, 0, 0.6509804, 1, 1,
0.1647739, -0.6833124, 2.514949, 0, 0.6470588, 1, 1,
0.1686754, 0.5502446, 1.040172, 0, 0.6392157, 1, 1,
0.1692145, -0.8433578, 2.127407, 0, 0.6352941, 1, 1,
0.1692159, 0.4419757, -0.8443898, 0, 0.627451, 1, 1,
0.1712972, -0.9619341, 1.489406, 0, 0.6235294, 1, 1,
0.1796409, -0.2579463, 2.519531, 0, 0.6156863, 1, 1,
0.1847219, 1.762463, -0.3656277, 0, 0.6117647, 1, 1,
0.184975, -1.053812, 3.880524, 0, 0.6039216, 1, 1,
0.18509, -0.5409977, 3.397951, 0, 0.5960785, 1, 1,
0.1856942, 1.012643, -2.39214, 0, 0.5921569, 1, 1,
0.1858709, 0.5267818, -0.8090107, 0, 0.5843138, 1, 1,
0.1905393, -2.052571, 1.110678, 0, 0.5803922, 1, 1,
0.1936924, 0.4107849, -0.02492131, 0, 0.572549, 1, 1,
0.1959992, 0.4207738, -0.3966944, 0, 0.5686275, 1, 1,
0.2014631, 0.028778, 1.573172, 0, 0.5607843, 1, 1,
0.2018424, 0.09369481, 0.3960369, 0, 0.5568628, 1, 1,
0.2054213, 1.095833, 0.428453, 0, 0.5490196, 1, 1,
0.2097995, -0.9047422, 3.13551, 0, 0.5450981, 1, 1,
0.2102455, 0.01843227, 1.966902, 0, 0.5372549, 1, 1,
0.2111585, 0.8717444, 1.312532, 0, 0.5333334, 1, 1,
0.2155656, -0.2019275, 2.467257, 0, 0.5254902, 1, 1,
0.2211549, 0.3306467, 1.138997, 0, 0.5215687, 1, 1,
0.2258236, 0.4532398, -1.084673, 0, 0.5137255, 1, 1,
0.2285789, -0.382604, 3.678347, 0, 0.509804, 1, 1,
0.2310249, -0.3288744, 2.14963, 0, 0.5019608, 1, 1,
0.2320199, -0.8561694, 3.456193, 0, 0.4941176, 1, 1,
0.2332838, -0.7636291, 4.651696, 0, 0.4901961, 1, 1,
0.2416731, -1.698004, 2.888144, 0, 0.4823529, 1, 1,
0.2433506, -0.1766093, 2.371895, 0, 0.4784314, 1, 1,
0.2502846, -0.9387996, 3.798652, 0, 0.4705882, 1, 1,
0.2516955, 0.8822328, -1.302617, 0, 0.4666667, 1, 1,
0.2520053, -0.8148924, 1.323097, 0, 0.4588235, 1, 1,
0.2536163, -0.1720007, 1.627632, 0, 0.454902, 1, 1,
0.2565828, -0.9594685, 2.841392, 0, 0.4470588, 1, 1,
0.2589918, -0.4780801, 1.93273, 0, 0.4431373, 1, 1,
0.2606239, -0.1382704, 2.388273, 0, 0.4352941, 1, 1,
0.26149, -1.267521, 2.592267, 0, 0.4313726, 1, 1,
0.2639915, -0.5203271, 3.925398, 0, 0.4235294, 1, 1,
0.2764591, -2.565995, 1.68729, 0, 0.4196078, 1, 1,
0.2796831, 0.1911598, 1.693086, 0, 0.4117647, 1, 1,
0.2814204, 0.5865109, 0.9777307, 0, 0.4078431, 1, 1,
0.2829886, -1.188905, 3.28601, 0, 0.4, 1, 1,
0.2877368, 1.847774, 2.298648, 0, 0.3921569, 1, 1,
0.2890192, 0.1497301, 3.558058, 0, 0.3882353, 1, 1,
0.2897492, -0.3479048, 4.696897, 0, 0.3803922, 1, 1,
0.2951326, 2.544843, 0.1721237, 0, 0.3764706, 1, 1,
0.3004099, 0.2322162, 0.314277, 0, 0.3686275, 1, 1,
0.3016289, -1.531278, 4.039542, 0, 0.3647059, 1, 1,
0.3028924, -1.11205, 2.769996, 0, 0.3568628, 1, 1,
0.3030979, 1.535837, 1.105703, 0, 0.3529412, 1, 1,
0.3032349, 0.9078957, 1.474872, 0, 0.345098, 1, 1,
0.3054999, -0.03014177, -0.01410517, 0, 0.3411765, 1, 1,
0.3061008, 0.8145453, 1.914013, 0, 0.3333333, 1, 1,
0.3064679, -1.066525, 2.589741, 0, 0.3294118, 1, 1,
0.3081489, 1.919473, -1.102806, 0, 0.3215686, 1, 1,
0.3108178, 0.9363409, 0.773032, 0, 0.3176471, 1, 1,
0.3150773, 0.8666871, 1.770358, 0, 0.3098039, 1, 1,
0.3155448, 1.471658, 0.3033783, 0, 0.3058824, 1, 1,
0.3158431, 0.8301295, 0.3216359, 0, 0.2980392, 1, 1,
0.3279477, -0.7089456, 1.679154, 0, 0.2901961, 1, 1,
0.3290773, -0.1146956, 3.218393, 0, 0.2862745, 1, 1,
0.3302312, -1.504663, 3.252995, 0, 0.2784314, 1, 1,
0.3313843, 0.2617332, 0.4258527, 0, 0.2745098, 1, 1,
0.3329715, -0.4187512, 3.306681, 0, 0.2666667, 1, 1,
0.3336998, 0.781936, 0.6154864, 0, 0.2627451, 1, 1,
0.3388744, -0.6585652, 4.114054, 0, 0.254902, 1, 1,
0.3424706, 2.166575, 2.386053, 0, 0.2509804, 1, 1,
0.3478447, 1.271809, -1.754874, 0, 0.2431373, 1, 1,
0.3478581, 1.301284, -0.9299074, 0, 0.2392157, 1, 1,
0.3507448, 0.6393977, 1.851754, 0, 0.2313726, 1, 1,
0.3508534, 0.7700488, 0.7203034, 0, 0.227451, 1, 1,
0.3553329, 0.002798825, 0.7598833, 0, 0.2196078, 1, 1,
0.3562653, 0.8494483, 0.5926378, 0, 0.2156863, 1, 1,
0.3571348, 0.8568831, -0.1320412, 0, 0.2078431, 1, 1,
0.3615233, -1.389374, 2.646429, 0, 0.2039216, 1, 1,
0.362348, 0.7070889, 2.245029, 0, 0.1960784, 1, 1,
0.3638935, 0.1166313, 1.020638, 0, 0.1882353, 1, 1,
0.3655942, 1.027352, 2.577075, 0, 0.1843137, 1, 1,
0.367254, 0.2539195, 1.208053, 0, 0.1764706, 1, 1,
0.3672602, 0.3844852, 1.597849, 0, 0.172549, 1, 1,
0.3680823, 0.33316, 1.69866, 0, 0.1647059, 1, 1,
0.3710795, 1.114928, -1.833719, 0, 0.1607843, 1, 1,
0.3718694, -0.8237761, 2.452154, 0, 0.1529412, 1, 1,
0.3730721, -0.6021641, 1.798523, 0, 0.1490196, 1, 1,
0.3746008, 1.1541, 1.294864, 0, 0.1411765, 1, 1,
0.3823174, -0.9792667, 3.779362, 0, 0.1372549, 1, 1,
0.3882763, 1.379478, -0.2029223, 0, 0.1294118, 1, 1,
0.3898594, 0.9072984, -0.1000091, 0, 0.1254902, 1, 1,
0.3921644, 0.1431089, 0.8935864, 0, 0.1176471, 1, 1,
0.3955404, 1.869046, -0.6903229, 0, 0.1137255, 1, 1,
0.3982704, -0.2558312, 5.550904, 0, 0.1058824, 1, 1,
0.4024294, 0.4135515, 1.154418, 0, 0.09803922, 1, 1,
0.4058034, -0.3822298, 0.6956189, 0, 0.09411765, 1, 1,
0.4068359, -1.108801, 3.471608, 0, 0.08627451, 1, 1,
0.4087114, -0.5595766, 3.293161, 0, 0.08235294, 1, 1,
0.4111945, -1.341612, 3.616778, 0, 0.07450981, 1, 1,
0.4134733, 0.01303162, 1.112482, 0, 0.07058824, 1, 1,
0.4185797, 0.1034752, 2.85556, 0, 0.0627451, 1, 1,
0.4233029, -0.03444933, 3.79937, 0, 0.05882353, 1, 1,
0.4244846, 0.3493029, 1.170452, 0, 0.05098039, 1, 1,
0.4260221, 1.724835, 1.304249, 0, 0.04705882, 1, 1,
0.4267576, -0.004802907, 0.7275975, 0, 0.03921569, 1, 1,
0.4294486, 1.155245, -0.7482038, 0, 0.03529412, 1, 1,
0.4307925, -2.182775, 0.6478561, 0, 0.02745098, 1, 1,
0.4321736, -0.7419313, 3.814438, 0, 0.02352941, 1, 1,
0.4330194, 0.2704433, 1.082172, 0, 0.01568628, 1, 1,
0.4348048, -0.07610487, 0.8418902, 0, 0.01176471, 1, 1,
0.4357043, 1.067159, 0.01233951, 0, 0.003921569, 1, 1,
0.4368181, -0.46319, 1.485985, 0.003921569, 0, 1, 1,
0.437774, 0.2988071, 1.477226, 0.007843138, 0, 1, 1,
0.4421036, 1.083405, 0.7104796, 0.01568628, 0, 1, 1,
0.4454757, 0.9534461, 1.102886, 0.01960784, 0, 1, 1,
0.4495829, -0.7177876, 3.906358, 0.02745098, 0, 1, 1,
0.4524921, -1.857835, 2.575688, 0.03137255, 0, 1, 1,
0.4586655, -3.347215, 2.457041, 0.03921569, 0, 1, 1,
0.4591024, 0.6577755, -0.704139, 0.04313726, 0, 1, 1,
0.4600328, -0.707082, 0.726687, 0.05098039, 0, 1, 1,
0.463832, 0.7294841, 0.7039148, 0.05490196, 0, 1, 1,
0.4693206, 1.243886, -1.05442, 0.0627451, 0, 1, 1,
0.4744583, 1.807479, -1.053377, 0.06666667, 0, 1, 1,
0.4772597, 1.470421, 0.1255569, 0.07450981, 0, 1, 1,
0.4778458, 1.138243, -0.7713276, 0.07843138, 0, 1, 1,
0.4794311, -0.9446495, 3.637103, 0.08627451, 0, 1, 1,
0.4845761, 1.296434, -0.6630319, 0.09019608, 0, 1, 1,
0.4853476, -0.7422938, 0.4880611, 0.09803922, 0, 1, 1,
0.492465, -1.075662, 2.978276, 0.1058824, 0, 1, 1,
0.4927242, 2.804175, -0.3614684, 0.1098039, 0, 1, 1,
0.4986528, 0.5880163, 1.191309, 0.1176471, 0, 1, 1,
0.5052952, -0.8041828, 2.837498, 0.1215686, 0, 1, 1,
0.5097055, -0.6606964, 3.755447, 0.1294118, 0, 1, 1,
0.5104918, 1.05974, 1.279101, 0.1333333, 0, 1, 1,
0.5126013, 0.7651799, 0.105932, 0.1411765, 0, 1, 1,
0.513594, 1.307741, 1.244489, 0.145098, 0, 1, 1,
0.5159787, -1.549734, 2.345893, 0.1529412, 0, 1, 1,
0.5175085, 0.1599472, 1.111169, 0.1568628, 0, 1, 1,
0.5231901, 1.904104, 0.6879368, 0.1647059, 0, 1, 1,
0.5241646, -1.644513, 4.145344, 0.1686275, 0, 1, 1,
0.525254, -0.2805918, 1.665411, 0.1764706, 0, 1, 1,
0.527833, 1.099758, 0.9301404, 0.1803922, 0, 1, 1,
0.5280892, -0.7140541, 4.626245, 0.1882353, 0, 1, 1,
0.5313672, 1.210616, -0.1333319, 0.1921569, 0, 1, 1,
0.5349465, 0.6776863, -0.03315777, 0.2, 0, 1, 1,
0.5367949, -0.140499, 3.811046, 0.2078431, 0, 1, 1,
0.537021, 0.07022882, 1.800193, 0.2117647, 0, 1, 1,
0.537676, -0.824315, 1.488796, 0.2196078, 0, 1, 1,
0.5384216, -1.3534, 4.981218, 0.2235294, 0, 1, 1,
0.5415395, -1.287498, 2.063517, 0.2313726, 0, 1, 1,
0.5464882, -0.8556241, 1.620099, 0.2352941, 0, 1, 1,
0.5505317, -0.08760802, 0.08129556, 0.2431373, 0, 1, 1,
0.5531282, -0.186611, 3.689173, 0.2470588, 0, 1, 1,
0.5575828, 1.185362, 0.51188, 0.254902, 0, 1, 1,
0.5588016, -1.462499, 2.171158, 0.2588235, 0, 1, 1,
0.5608816, 1.061107, -0.3594843, 0.2666667, 0, 1, 1,
0.5609295, -0.1519819, 0.9192283, 0.2705882, 0, 1, 1,
0.5660205, 0.5061376, 1.084952, 0.2784314, 0, 1, 1,
0.5708887, -0.5932182, 3.537616, 0.282353, 0, 1, 1,
0.5795138, 0.1650452, 1.756139, 0.2901961, 0, 1, 1,
0.5863465, 1.909425, 1.164332, 0.2941177, 0, 1, 1,
0.587885, -0.7595259, 0.5253685, 0.3019608, 0, 1, 1,
0.5923814, 0.8802907, 0.008440321, 0.3098039, 0, 1, 1,
0.5925226, -0.5421889, 4.29125, 0.3137255, 0, 1, 1,
0.5959092, 0.01744847, 1.842799, 0.3215686, 0, 1, 1,
0.596055, 0.7089862, 0.15073, 0.3254902, 0, 1, 1,
0.6095009, 0.8193157, -0.111585, 0.3333333, 0, 1, 1,
0.6156031, -1.421988, 3.374568, 0.3372549, 0, 1, 1,
0.6172526, 1.615603, 0.5300605, 0.345098, 0, 1, 1,
0.6177148, -0.2127256, 0.9356655, 0.3490196, 0, 1, 1,
0.6198198, 0.2896136, 1.229079, 0.3568628, 0, 1, 1,
0.6228144, -1.454078, 1.59674, 0.3607843, 0, 1, 1,
0.6268453, -0.2338792, 2.709868, 0.3686275, 0, 1, 1,
0.6309569, 0.02923538, 1.670915, 0.372549, 0, 1, 1,
0.6328859, 0.06397618, 1.054296, 0.3803922, 0, 1, 1,
0.63447, -0.6366974, 1.194781, 0.3843137, 0, 1, 1,
0.6361284, 0.4571672, 0.1087349, 0.3921569, 0, 1, 1,
0.6408463, -1.435609, 2.489282, 0.3960784, 0, 1, 1,
0.6413279, 0.4809485, -1.094687, 0.4039216, 0, 1, 1,
0.6453317, -0.5722488, 2.783457, 0.4117647, 0, 1, 1,
0.6470495, 1.036842, 0.5034911, 0.4156863, 0, 1, 1,
0.6474125, 0.9148256, -0.2965869, 0.4235294, 0, 1, 1,
0.6478983, -0.0210656, 0.8236308, 0.427451, 0, 1, 1,
0.6485794, 0.4001256, 0.2206666, 0.4352941, 0, 1, 1,
0.6498913, 0.6988235, 1.760053, 0.4392157, 0, 1, 1,
0.6539819, -0.4101952, 0.8110251, 0.4470588, 0, 1, 1,
0.6550487, 0.9679778, 2.812587, 0.4509804, 0, 1, 1,
0.6565623, -0.8332182, 2.787625, 0.4588235, 0, 1, 1,
0.6587446, -2.143994, 3.564068, 0.4627451, 0, 1, 1,
0.6624049, -0.3541868, 1.883193, 0.4705882, 0, 1, 1,
0.6633043, -0.7301099, 5.196636, 0.4745098, 0, 1, 1,
0.6697798, -0.2736434, 1.823579, 0.4823529, 0, 1, 1,
0.6765222, -0.221541, 4.147005, 0.4862745, 0, 1, 1,
0.6830603, 0.05465141, 0.730873, 0.4941176, 0, 1, 1,
0.6947477, 0.409973, 0.4343148, 0.5019608, 0, 1, 1,
0.6958417, -0.8028107, 1.861319, 0.5058824, 0, 1, 1,
0.696545, 0.1776657, -0.9764537, 0.5137255, 0, 1, 1,
0.6982434, 1.394716, -0.8948729, 0.5176471, 0, 1, 1,
0.7019356, -0.4110839, 1.686472, 0.5254902, 0, 1, 1,
0.7036579, -1.626993, 3.771383, 0.5294118, 0, 1, 1,
0.7038274, -0.5662238, 2.450282, 0.5372549, 0, 1, 1,
0.7078362, 0.2104957, 4.313212, 0.5411765, 0, 1, 1,
0.7126296, 1.337329, -0.1917863, 0.5490196, 0, 1, 1,
0.7195353, 1.002254, 0.1346528, 0.5529412, 0, 1, 1,
0.7205371, -0.7686456, 2.376462, 0.5607843, 0, 1, 1,
0.722128, -0.9525818, 1.850624, 0.5647059, 0, 1, 1,
0.725908, -2.318379, 4.704648, 0.572549, 0, 1, 1,
0.7286764, -1.747893, 1.750003, 0.5764706, 0, 1, 1,
0.7294723, 2.300975, 0.4098616, 0.5843138, 0, 1, 1,
0.730076, 1.119748, 0.6067377, 0.5882353, 0, 1, 1,
0.7318668, 0.2295894, 2.061777, 0.5960785, 0, 1, 1,
0.7340468, 0.6625636, 2.043783, 0.6039216, 0, 1, 1,
0.7353979, -1.598477, 4.342194, 0.6078432, 0, 1, 1,
0.7414578, 0.5006517, -0.08317237, 0.6156863, 0, 1, 1,
0.7466217, -0.6788408, 2.810287, 0.6196079, 0, 1, 1,
0.7475976, 1.440586, -0.03801103, 0.627451, 0, 1, 1,
0.7485847, -0.3405868, 2.943028, 0.6313726, 0, 1, 1,
0.7497076, -0.1723241, 0.8959406, 0.6392157, 0, 1, 1,
0.7516429, -0.3044595, 2.090514, 0.6431373, 0, 1, 1,
0.7578743, -0.1682068, 2.609311, 0.6509804, 0, 1, 1,
0.7585259, 0.8937972, -0.9579215, 0.654902, 0, 1, 1,
0.7660922, 0.4853052, 0.492138, 0.6627451, 0, 1, 1,
0.7708899, 1.240968, 0.8653032, 0.6666667, 0, 1, 1,
0.7737129, -1.804746, 2.398545, 0.6745098, 0, 1, 1,
0.7742783, 0.4585114, 1.258207, 0.6784314, 0, 1, 1,
0.7743928, 0.005135848, 2.636689, 0.6862745, 0, 1, 1,
0.7749867, 1.30648, -0.4156659, 0.6901961, 0, 1, 1,
0.7759357, 1.389482, 1.23134, 0.6980392, 0, 1, 1,
0.777594, -0.8442206, 0.9528143, 0.7058824, 0, 1, 1,
0.7784986, -1.496422, 2.485986, 0.7098039, 0, 1, 1,
0.7811634, 0.7643828, 0.4330465, 0.7176471, 0, 1, 1,
0.7984114, -0.7230044, 2.681365, 0.7215686, 0, 1, 1,
0.8006892, 0.810819, -0.01663104, 0.7294118, 0, 1, 1,
0.803821, 0.04768375, 0.7445405, 0.7333333, 0, 1, 1,
0.8238137, 0.9905066, 1.710623, 0.7411765, 0, 1, 1,
0.8243886, 1.069271, 0.6450148, 0.7450981, 0, 1, 1,
0.8253897, 0.1851119, 0.3421857, 0.7529412, 0, 1, 1,
0.8286296, 0.6037874, -0.2991057, 0.7568628, 0, 1, 1,
0.8286542, -0.6121536, 1.545415, 0.7647059, 0, 1, 1,
0.8314967, -0.2106317, 2.130404, 0.7686275, 0, 1, 1,
0.8346351, 1.552653, 0.1251852, 0.7764706, 0, 1, 1,
0.8366477, -0.7258286, 3.355381, 0.7803922, 0, 1, 1,
0.8383037, -0.2305252, 0.7256927, 0.7882353, 0, 1, 1,
0.8391419, 1.42081, 1.025729, 0.7921569, 0, 1, 1,
0.8464567, 0.956465, 1.870691, 0.8, 0, 1, 1,
0.8545343, 0.08580216, 0.3049959, 0.8078431, 0, 1, 1,
0.8560293, -1.13816, 4.957438, 0.8117647, 0, 1, 1,
0.8569425, -0.4256567, 2.533027, 0.8196079, 0, 1, 1,
0.857259, -0.1931368, -1.025176, 0.8235294, 0, 1, 1,
0.8650495, 1.187981, -0.05397439, 0.8313726, 0, 1, 1,
0.8686877, 0.2519163, 0.7118253, 0.8352941, 0, 1, 1,
0.8741928, 0.01588775, 1.510376, 0.8431373, 0, 1, 1,
0.8788666, 0.5527164, 1.60105, 0.8470588, 0, 1, 1,
0.8788823, 0.06087647, 3.488215, 0.854902, 0, 1, 1,
0.8804988, 0.2008574, 2.840195, 0.8588235, 0, 1, 1,
0.8877876, 0.5294334, 0.866078, 0.8666667, 0, 1, 1,
0.8897861, 0.7132171, 0.1817243, 0.8705882, 0, 1, 1,
0.8906975, -0.7301862, 2.254007, 0.8784314, 0, 1, 1,
0.8946658, 0.3244417, 1.752474, 0.8823529, 0, 1, 1,
0.9020039, -0.4483776, 3.289236, 0.8901961, 0, 1, 1,
0.9038231, -0.2628601, 0.5523829, 0.8941177, 0, 1, 1,
0.9047247, -0.9452161, 3.534475, 0.9019608, 0, 1, 1,
0.9116812, 0.3067061, 2.408811, 0.9098039, 0, 1, 1,
0.917915, 1.371178, 1.589359, 0.9137255, 0, 1, 1,
0.9209416, -0.9430417, 3.273658, 0.9215686, 0, 1, 1,
0.93085, -0.268299, 0.7031115, 0.9254902, 0, 1, 1,
0.9319443, -0.3504321, 1.573159, 0.9333333, 0, 1, 1,
0.9321625, -0.3708852, 1.464615, 0.9372549, 0, 1, 1,
0.9344536, 0.3021671, -0.003095224, 0.945098, 0, 1, 1,
0.9417914, 0.2922672, 1.788325, 0.9490196, 0, 1, 1,
0.9532807, -1.145076, 1.908104, 0.9568627, 0, 1, 1,
0.9541704, 0.8141706, 1.009948, 0.9607843, 0, 1, 1,
0.9591146, -0.957368, 1.284413, 0.9686275, 0, 1, 1,
0.95989, 0.6401842, -1.452357, 0.972549, 0, 1, 1,
0.9619149, 0.2023249, 1.872214, 0.9803922, 0, 1, 1,
0.961943, -1.243382, 1.360184, 0.9843137, 0, 1, 1,
0.9642882, -1.361232, 3.636921, 0.9921569, 0, 1, 1,
0.9813551, -0.1671796, 2.557334, 0.9960784, 0, 1, 1,
0.9855779, -0.9697339, 2.667735, 1, 0, 0.9960784, 1,
0.9917341, -0.3030261, 1.708708, 1, 0, 0.9882353, 1,
0.992236, -0.2565331, 2.913005, 1, 0, 0.9843137, 1,
0.9959539, 0.9765642, 0.7593479, 1, 0, 0.9764706, 1,
0.996554, -1.123995, 2.736701, 1, 0, 0.972549, 1,
1.001638, -0.4140424, 3.19405, 1, 0, 0.9647059, 1,
1.008647, -0.5124317, 3.83679, 1, 0, 0.9607843, 1,
1.012802, 2.40509, -1.365533, 1, 0, 0.9529412, 1,
1.016811, -1.147221, 2.635698, 1, 0, 0.9490196, 1,
1.025194, 2.31086, 0.686825, 1, 0, 0.9411765, 1,
1.028797, 1.737382, 0.09225859, 1, 0, 0.9372549, 1,
1.030242, -0.05949035, 1.589983, 1, 0, 0.9294118, 1,
1.030867, -0.7922918, 2.139545, 1, 0, 0.9254902, 1,
1.03624, 0.4739806, 0.9748209, 1, 0, 0.9176471, 1,
1.0387, 1.872007, 0.4242425, 1, 0, 0.9137255, 1,
1.04651, 1.172274, 1.798819, 1, 0, 0.9058824, 1,
1.056819, 0.5790269, 1.516006, 1, 0, 0.9019608, 1,
1.063452, -0.3267428, 3.418444, 1, 0, 0.8941177, 1,
1.067229, -0.3583354, 2.51506, 1, 0, 0.8862745, 1,
1.073227, 1.372777, 0.03570113, 1, 0, 0.8823529, 1,
1.088349, 0.6655621, 0.3373221, 1, 0, 0.8745098, 1,
1.09049, -0.6146168, 1.855959, 1, 0, 0.8705882, 1,
1.095245, 0.9096698, 1.824716, 1, 0, 0.8627451, 1,
1.096925, -0.3454796, 2.882125, 1, 0, 0.8588235, 1,
1.101272, -0.03437424, 1.934762, 1, 0, 0.8509804, 1,
1.111705, 0.1405552, 2.326691, 1, 0, 0.8470588, 1,
1.1151, -1.927599, 3.300275, 1, 0, 0.8392157, 1,
1.117119, -0.5953118, 1.491508, 1, 0, 0.8352941, 1,
1.120799, -1.522732, 1.603563, 1, 0, 0.827451, 1,
1.122069, 0.09456887, 1.040256, 1, 0, 0.8235294, 1,
1.122265, -0.4375615, 0.8045998, 1, 0, 0.8156863, 1,
1.123994, -0.00671638, 1.821765, 1, 0, 0.8117647, 1,
1.125685, -2.256459, 3.292813, 1, 0, 0.8039216, 1,
1.139583, -0.1317634, 1.296224, 1, 0, 0.7960784, 1,
1.146786, 0.4329511, 1.315891, 1, 0, 0.7921569, 1,
1.149876, -0.6507626, 2.20686, 1, 0, 0.7843137, 1,
1.151187, -0.3990472, 2.567299, 1, 0, 0.7803922, 1,
1.151403, 0.3406168, 1.359865, 1, 0, 0.772549, 1,
1.154411, -0.654216, 1.614998, 1, 0, 0.7686275, 1,
1.16949, -0.02880947, -0.4837118, 1, 0, 0.7607843, 1,
1.176321, 1.394538, 0.6177239, 1, 0, 0.7568628, 1,
1.192037, -0.1052341, 0.7944679, 1, 0, 0.7490196, 1,
1.201378, 0.3956876, 2.303244, 1, 0, 0.7450981, 1,
1.208215, -1.887023, 3.670961, 1, 0, 0.7372549, 1,
1.209858, 0.2311111, 1.679755, 1, 0, 0.7333333, 1,
1.21042, 1.126457, 0.6395394, 1, 0, 0.7254902, 1,
1.211805, 0.3111448, 1.447728, 1, 0, 0.7215686, 1,
1.215017, -1.330914, 2.129837, 1, 0, 0.7137255, 1,
1.232186, 1.168438, -0.2987322, 1, 0, 0.7098039, 1,
1.232796, -0.9339277, 5.06518, 1, 0, 0.7019608, 1,
1.237388, 1.017859, 1.22251, 1, 0, 0.6941177, 1,
1.24066, -1.274647, 2.951922, 1, 0, 0.6901961, 1,
1.243525, -0.1231995, 1.578366, 1, 0, 0.682353, 1,
1.251169, 1.74235, 0.4327766, 1, 0, 0.6784314, 1,
1.253433, 0.3842609, 1.286079, 1, 0, 0.6705883, 1,
1.25658, -0.5293447, 2.687158, 1, 0, 0.6666667, 1,
1.26665, -0.5724106, 3.26592, 1, 0, 0.6588235, 1,
1.267668, 1.460652, 1.395502, 1, 0, 0.654902, 1,
1.271605, 0.02594648, 1.742206, 1, 0, 0.6470588, 1,
1.273855, 0.7083021, 0.8152999, 1, 0, 0.6431373, 1,
1.279426, -0.3024417, 1.952285, 1, 0, 0.6352941, 1,
1.291341, 0.7035463, 0.6373982, 1, 0, 0.6313726, 1,
1.294299, 2.046477, 0.9501292, 1, 0, 0.6235294, 1,
1.296532, 0.003231171, 0.9289368, 1, 0, 0.6196079, 1,
1.296609, -0.01319422, 1.044913, 1, 0, 0.6117647, 1,
1.301659, 0.07628451, 0.1598409, 1, 0, 0.6078432, 1,
1.329581, 0.8845699, -0.09194647, 1, 0, 0.6, 1,
1.350876, 0.281755, 1.303853, 1, 0, 0.5921569, 1,
1.356738, -0.2906652, 3.138417, 1, 0, 0.5882353, 1,
1.358871, -0.07675935, 0.659, 1, 0, 0.5803922, 1,
1.359089, -1.613452, 3.265794, 1, 0, 0.5764706, 1,
1.363029, 0.1043686, 0.9056947, 1, 0, 0.5686275, 1,
1.365723, 1.092761, 1.594187, 1, 0, 0.5647059, 1,
1.367247, 0.08552378, 1.209701, 1, 0, 0.5568628, 1,
1.36805, -0.839724, 3.068308, 1, 0, 0.5529412, 1,
1.381239, 0.8585387, 2.317602, 1, 0, 0.5450981, 1,
1.391529, 0.8343526, -0.5457308, 1, 0, 0.5411765, 1,
1.392341, -0.2487046, 0.7982635, 1, 0, 0.5333334, 1,
1.396694, -1.010038, 0.5219618, 1, 0, 0.5294118, 1,
1.400699, 0.5229825, 1.580009, 1, 0, 0.5215687, 1,
1.408844, -1.177915, 3.437141, 1, 0, 0.5176471, 1,
1.412369, -0.2828889, 0.8928281, 1, 0, 0.509804, 1,
1.415664, 0.1293872, 0.8964588, 1, 0, 0.5058824, 1,
1.427963, 0.5945531, -0.2939927, 1, 0, 0.4980392, 1,
1.43123, 0.3580233, 0.288067, 1, 0, 0.4901961, 1,
1.435244, 0.9707463, 2.12683, 1, 0, 0.4862745, 1,
1.440302, 0.4315878, 3.964831, 1, 0, 0.4784314, 1,
1.440705, -0.02783093, 1.881628, 1, 0, 0.4745098, 1,
1.441976, -0.8619354, 2.328986, 1, 0, 0.4666667, 1,
1.444881, -1.665817, 1.343641, 1, 0, 0.4627451, 1,
1.451183, 0.06345581, 2.399128, 1, 0, 0.454902, 1,
1.485742, -0.338582, 2.281723, 1, 0, 0.4509804, 1,
1.491905, -1.244037, 3.467585, 1, 0, 0.4431373, 1,
1.502962, -0.8811561, 0.9927686, 1, 0, 0.4392157, 1,
1.507455, 0.4206998, 0.2925484, 1, 0, 0.4313726, 1,
1.517232, 0.2356728, 0.4021735, 1, 0, 0.427451, 1,
1.519541, -0.1732355, 3.072233, 1, 0, 0.4196078, 1,
1.528551, -1.803443, 1.731471, 1, 0, 0.4156863, 1,
1.529198, 0.5275429, 0.4348109, 1, 0, 0.4078431, 1,
1.545148, -0.3630607, 2.471585, 1, 0, 0.4039216, 1,
1.585947, -0.01686106, 1.961842, 1, 0, 0.3960784, 1,
1.589386, -0.82724, 3.198897, 1, 0, 0.3882353, 1,
1.59025, 0.6449184, 0.6158602, 1, 0, 0.3843137, 1,
1.593207, 0.05023699, 2.739402, 1, 0, 0.3764706, 1,
1.609039, 0.3864533, 1.068959, 1, 0, 0.372549, 1,
1.632021, -0.113188, 1.987911, 1, 0, 0.3647059, 1,
1.635528, -0.7179604, 1.511311, 1, 0, 0.3607843, 1,
1.638325, 0.7457241, 1.134619, 1, 0, 0.3529412, 1,
1.647971, -2.610816, 2.438289, 1, 0, 0.3490196, 1,
1.654916, -1.452503, 1.510581, 1, 0, 0.3411765, 1,
1.656005, -1.067006, 2.068608, 1, 0, 0.3372549, 1,
1.658171, 0.111975, 1.651582, 1, 0, 0.3294118, 1,
1.662528, -0.3026324, 1.813221, 1, 0, 0.3254902, 1,
1.663067, 1.638731, 0.4674031, 1, 0, 0.3176471, 1,
1.667852, 0.4883811, 1.549783, 1, 0, 0.3137255, 1,
1.669051, 0.8337892, 1.586491, 1, 0, 0.3058824, 1,
1.681708, -0.2705853, 1.823483, 1, 0, 0.2980392, 1,
1.698727, -0.9165276, 1.896968, 1, 0, 0.2941177, 1,
1.703439, -0.9842171, 2.095557, 1, 0, 0.2862745, 1,
1.709781, -0.4966481, 1.038876, 1, 0, 0.282353, 1,
1.71913, -0.702308, 1.559417, 1, 0, 0.2745098, 1,
1.720769, 0.125911, 1.039802, 1, 0, 0.2705882, 1,
1.730478, -0.3144345, 1.723992, 1, 0, 0.2627451, 1,
1.739656, -0.4800505, 0.5253228, 1, 0, 0.2588235, 1,
1.750128, -1.421739, 3.360072, 1, 0, 0.2509804, 1,
1.755067, 0.6044826, 2.12065, 1, 0, 0.2470588, 1,
1.762249, 0.007961293, 3.46542, 1, 0, 0.2392157, 1,
1.765894, -0.8678776, 2.208035, 1, 0, 0.2352941, 1,
1.768464, -0.6284706, 0.9480695, 1, 0, 0.227451, 1,
1.789688, 0.5198066, 0.9986708, 1, 0, 0.2235294, 1,
1.802794, -1.932841, 0.4790584, 1, 0, 0.2156863, 1,
1.814209, -0.05265256, 2.420103, 1, 0, 0.2117647, 1,
1.82011, 2.687133, 1.549729, 1, 0, 0.2039216, 1,
1.820347, -0.4059614, 3.367198, 1, 0, 0.1960784, 1,
1.836948, -0.9313649, 2.759438, 1, 0, 0.1921569, 1,
1.853963, -0.7996891, 1.782999, 1, 0, 0.1843137, 1,
1.890103, -0.2326451, 2.265678, 1, 0, 0.1803922, 1,
1.903933, -2.766559, 1.86857, 1, 0, 0.172549, 1,
1.913195, 2.756124, 1.268885, 1, 0, 0.1686275, 1,
1.917947, 0.9288881, -0.2513344, 1, 0, 0.1607843, 1,
1.942995, -2.049564, 2.623869, 1, 0, 0.1568628, 1,
1.943025, -1.250327, 1.204203, 1, 0, 0.1490196, 1,
1.967218, 0.174916, 2.684306, 1, 0, 0.145098, 1,
1.969012, -0.3597364, 3.039243, 1, 0, 0.1372549, 1,
2.028286, 2.160007, 2.373461, 1, 0, 0.1333333, 1,
2.035794, -0.3704954, 0.6071369, 1, 0, 0.1254902, 1,
2.047654, -0.09676299, 0.8915113, 1, 0, 0.1215686, 1,
2.051107, 0.2533067, 0.4867148, 1, 0, 0.1137255, 1,
2.089415, -0.09327149, 0.1541675, 1, 0, 0.1098039, 1,
2.141753, 1.094461, 2.783285, 1, 0, 0.1019608, 1,
2.222787, -0.4734458, 2.945007, 1, 0, 0.09411765, 1,
2.240003, 0.602257, 1.901985, 1, 0, 0.09019608, 1,
2.260713, -0.9978073, 0.5726497, 1, 0, 0.08235294, 1,
2.270646, -0.2407688, 0.9059456, 1, 0, 0.07843138, 1,
2.400908, -1.493076, 1.801239, 1, 0, 0.07058824, 1,
2.425514, -1.337164, 1.840502, 1, 0, 0.06666667, 1,
2.452314, -0.07312071, 0.9711453, 1, 0, 0.05882353, 1,
2.510295, 0.1961786, 0.422828, 1, 0, 0.05490196, 1,
2.559401, 0.08545932, 2.695808, 1, 0, 0.04705882, 1,
2.628682, 0.2527558, 0.9652197, 1, 0, 0.04313726, 1,
2.639189, 0.3969873, 0.935052, 1, 0, 0.03529412, 1,
2.728106, 0.8288332, 1.439954, 1, 0, 0.03137255, 1,
2.82911, 2.097469, 1.435998, 1, 0, 0.02352941, 1,
2.96685, -1.018141, 1.052011, 1, 0, 0.01960784, 1,
2.97308, -1.21602, 2.985686, 1, 0, 0.01176471, 1,
3.05485, 0.7794575, 3.246526, 1, 0, 0.007843138, 1
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
-0.03727174, -4.419657, -7.536542, 0, -0.5, 0.5, 0.5,
-0.03727174, -4.419657, -7.536542, 1, -0.5, 0.5, 0.5,
-0.03727174, -4.419657, -7.536542, 1, 1.5, 0.5, 0.5,
-0.03727174, -4.419657, -7.536542, 0, 1.5, 0.5, 0.5
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
-4.177623, -0.1836686, -7.536542, 0, -0.5, 0.5, 0.5,
-4.177623, -0.1836686, -7.536542, 1, -0.5, 0.5, 0.5,
-4.177623, -0.1836686, -7.536542, 1, 1.5, 0.5, 0.5,
-4.177623, -0.1836686, -7.536542, 0, 1.5, 0.5, 0.5
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
-4.177623, -4.419657, -0.04441309, 0, -0.5, 0.5, 0.5,
-4.177623, -4.419657, -0.04441309, 1, -0.5, 0.5, 0.5,
-4.177623, -4.419657, -0.04441309, 1, 1.5, 0.5, 0.5,
-4.177623, -4.419657, -0.04441309, 0, 1.5, 0.5, 0.5
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
-3, -3.442121, -5.80759,
3, -3.442121, -5.80759,
-3, -3.442121, -5.80759,
-3, -3.605044, -6.095748,
-2, -3.442121, -5.80759,
-2, -3.605044, -6.095748,
-1, -3.442121, -5.80759,
-1, -3.605044, -6.095748,
0, -3.442121, -5.80759,
0, -3.605044, -6.095748,
1, -3.442121, -5.80759,
1, -3.605044, -6.095748,
2, -3.442121, -5.80759,
2, -3.605044, -6.095748,
3, -3.442121, -5.80759,
3, -3.605044, -6.095748
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
-3, -3.930889, -6.672066, 0, -0.5, 0.5, 0.5,
-3, -3.930889, -6.672066, 1, -0.5, 0.5, 0.5,
-3, -3.930889, -6.672066, 1, 1.5, 0.5, 0.5,
-3, -3.930889, -6.672066, 0, 1.5, 0.5, 0.5,
-2, -3.930889, -6.672066, 0, -0.5, 0.5, 0.5,
-2, -3.930889, -6.672066, 1, -0.5, 0.5, 0.5,
-2, -3.930889, -6.672066, 1, 1.5, 0.5, 0.5,
-2, -3.930889, -6.672066, 0, 1.5, 0.5, 0.5,
-1, -3.930889, -6.672066, 0, -0.5, 0.5, 0.5,
-1, -3.930889, -6.672066, 1, -0.5, 0.5, 0.5,
-1, -3.930889, -6.672066, 1, 1.5, 0.5, 0.5,
-1, -3.930889, -6.672066, 0, 1.5, 0.5, 0.5,
0, -3.930889, -6.672066, 0, -0.5, 0.5, 0.5,
0, -3.930889, -6.672066, 1, -0.5, 0.5, 0.5,
0, -3.930889, -6.672066, 1, 1.5, 0.5, 0.5,
0, -3.930889, -6.672066, 0, 1.5, 0.5, 0.5,
1, -3.930889, -6.672066, 0, -0.5, 0.5, 0.5,
1, -3.930889, -6.672066, 1, -0.5, 0.5, 0.5,
1, -3.930889, -6.672066, 1, 1.5, 0.5, 0.5,
1, -3.930889, -6.672066, 0, 1.5, 0.5, 0.5,
2, -3.930889, -6.672066, 0, -0.5, 0.5, 0.5,
2, -3.930889, -6.672066, 1, -0.5, 0.5, 0.5,
2, -3.930889, -6.672066, 1, 1.5, 0.5, 0.5,
2, -3.930889, -6.672066, 0, 1.5, 0.5, 0.5,
3, -3.930889, -6.672066, 0, -0.5, 0.5, 0.5,
3, -3.930889, -6.672066, 1, -0.5, 0.5, 0.5,
3, -3.930889, -6.672066, 1, 1.5, 0.5, 0.5,
3, -3.930889, -6.672066, 0, 1.5, 0.5, 0.5
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
-3.222157, -3, -5.80759,
-3.222157, 2, -5.80759,
-3.222157, -3, -5.80759,
-3.381402, -3, -6.095748,
-3.222157, -2, -5.80759,
-3.381402, -2, -6.095748,
-3.222157, -1, -5.80759,
-3.381402, -1, -6.095748,
-3.222157, 0, -5.80759,
-3.381402, 0, -6.095748,
-3.222157, 1, -5.80759,
-3.381402, 1, -6.095748,
-3.222157, 2, -5.80759,
-3.381402, 2, -6.095748
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
-3.69989, -3, -6.672066, 0, -0.5, 0.5, 0.5,
-3.69989, -3, -6.672066, 1, -0.5, 0.5, 0.5,
-3.69989, -3, -6.672066, 1, 1.5, 0.5, 0.5,
-3.69989, -3, -6.672066, 0, 1.5, 0.5, 0.5,
-3.69989, -2, -6.672066, 0, -0.5, 0.5, 0.5,
-3.69989, -2, -6.672066, 1, -0.5, 0.5, 0.5,
-3.69989, -2, -6.672066, 1, 1.5, 0.5, 0.5,
-3.69989, -2, -6.672066, 0, 1.5, 0.5, 0.5,
-3.69989, -1, -6.672066, 0, -0.5, 0.5, 0.5,
-3.69989, -1, -6.672066, 1, -0.5, 0.5, 0.5,
-3.69989, -1, -6.672066, 1, 1.5, 0.5, 0.5,
-3.69989, -1, -6.672066, 0, 1.5, 0.5, 0.5,
-3.69989, 0, -6.672066, 0, -0.5, 0.5, 0.5,
-3.69989, 0, -6.672066, 1, -0.5, 0.5, 0.5,
-3.69989, 0, -6.672066, 1, 1.5, 0.5, 0.5,
-3.69989, 0, -6.672066, 0, 1.5, 0.5, 0.5,
-3.69989, 1, -6.672066, 0, -0.5, 0.5, 0.5,
-3.69989, 1, -6.672066, 1, -0.5, 0.5, 0.5,
-3.69989, 1, -6.672066, 1, 1.5, 0.5, 0.5,
-3.69989, 1, -6.672066, 0, 1.5, 0.5, 0.5,
-3.69989, 2, -6.672066, 0, -0.5, 0.5, 0.5,
-3.69989, 2, -6.672066, 1, -0.5, 0.5, 0.5,
-3.69989, 2, -6.672066, 1, 1.5, 0.5, 0.5,
-3.69989, 2, -6.672066, 0, 1.5, 0.5, 0.5
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
-3.222157, -3.442121, -4,
-3.222157, -3.442121, 4,
-3.222157, -3.442121, -4,
-3.381402, -3.605044, -4,
-3.222157, -3.442121, -2,
-3.381402, -3.605044, -2,
-3.222157, -3.442121, 0,
-3.381402, -3.605044, 0,
-3.222157, -3.442121, 2,
-3.381402, -3.605044, 2,
-3.222157, -3.442121, 4,
-3.381402, -3.605044, 4
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
-3.69989, -3.930889, -4, 0, -0.5, 0.5, 0.5,
-3.69989, -3.930889, -4, 1, -0.5, 0.5, 0.5,
-3.69989, -3.930889, -4, 1, 1.5, 0.5, 0.5,
-3.69989, -3.930889, -4, 0, 1.5, 0.5, 0.5,
-3.69989, -3.930889, -2, 0, -0.5, 0.5, 0.5,
-3.69989, -3.930889, -2, 1, -0.5, 0.5, 0.5,
-3.69989, -3.930889, -2, 1, 1.5, 0.5, 0.5,
-3.69989, -3.930889, -2, 0, 1.5, 0.5, 0.5,
-3.69989, -3.930889, 0, 0, -0.5, 0.5, 0.5,
-3.69989, -3.930889, 0, 1, -0.5, 0.5, 0.5,
-3.69989, -3.930889, 0, 1, 1.5, 0.5, 0.5,
-3.69989, -3.930889, 0, 0, 1.5, 0.5, 0.5,
-3.69989, -3.930889, 2, 0, -0.5, 0.5, 0.5,
-3.69989, -3.930889, 2, 1, -0.5, 0.5, 0.5,
-3.69989, -3.930889, 2, 1, 1.5, 0.5, 0.5,
-3.69989, -3.930889, 2, 0, 1.5, 0.5, 0.5,
-3.69989, -3.930889, 4, 0, -0.5, 0.5, 0.5,
-3.69989, -3.930889, 4, 1, -0.5, 0.5, 0.5,
-3.69989, -3.930889, 4, 1, 1.5, 0.5, 0.5,
-3.69989, -3.930889, 4, 0, 1.5, 0.5, 0.5
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
-3.222157, -3.442121, -5.80759,
-3.222157, 3.074784, -5.80759,
-3.222157, -3.442121, 5.718763,
-3.222157, 3.074784, 5.718763,
-3.222157, -3.442121, -5.80759,
-3.222157, -3.442121, 5.718763,
-3.222157, 3.074784, -5.80759,
-3.222157, 3.074784, 5.718763,
-3.222157, -3.442121, -5.80759,
3.147614, -3.442121, -5.80759,
-3.222157, -3.442121, 5.718763,
3.147614, -3.442121, 5.718763,
-3.222157, 3.074784, -5.80759,
3.147614, 3.074784, -5.80759,
-3.222157, 3.074784, 5.718763,
3.147614, 3.074784, 5.718763,
3.147614, -3.442121, -5.80759,
3.147614, 3.074784, -5.80759,
3.147614, -3.442121, 5.718763,
3.147614, 3.074784, 5.718763,
3.147614, -3.442121, -5.80759,
3.147614, -3.442121, 5.718763,
3.147614, 3.074784, -5.80759,
3.147614, 3.074784, 5.718763
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
var radius = 7.846078;
var distance = 34.90809;
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
mvMatrix.translate( 0.03727174, 0.1836686, 0.04441309 );
mvMatrix.scale( 1.331811, 1.301743, 0.7359946 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.90809);
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
Calcium_arsenate<-read.table("Calcium_arsenate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Calcium_arsenate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Calcium_arsenate' not found
```

```r
y<-Calcium_arsenate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Calcium_arsenate' not found
```

```r
z<-Calcium_arsenate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Calcium_arsenate' not found
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
-3.129394, -2.216652, -3.720463, 0, 0, 1, 1, 1,
-2.644503, -0.9335974, -2.096182, 1, 0, 0, 1, 1,
-2.541471, 0.6706947, -3.660632, 1, 0, 0, 1, 1,
-2.488868, -0.6310996, -2.550586, 1, 0, 0, 1, 1,
-2.407612, 0.9150687, -0.9561553, 1, 0, 0, 1, 1,
-2.400033, 1.328683, -0.09227496, 1, 0, 0, 1, 1,
-2.324665, -0.1060905, -2.723645, 0, 0, 0, 1, 1,
-2.317299, 2.488326, 0.4138377, 0, 0, 0, 1, 1,
-2.302101, 2.51723, -1.129598, 0, 0, 0, 1, 1,
-2.28552, -0.6511378, -1.735, 0, 0, 0, 1, 1,
-2.27578, 0.1000017, -1.989974, 0, 0, 0, 1, 1,
-2.255808, -0.5443047, -0.581815, 0, 0, 0, 1, 1,
-2.237182, -0.0970829, -1.992721, 0, 0, 0, 1, 1,
-2.229573, 0.6231462, -1.349844, 1, 1, 1, 1, 1,
-2.163231, -0.2417801, -3.134011, 1, 1, 1, 1, 1,
-2.151354, -0.1204755, -2.690645, 1, 1, 1, 1, 1,
-2.127742, 0.7047661, -2.971138, 1, 1, 1, 1, 1,
-2.114957, 0.5474348, -2.314642, 1, 1, 1, 1, 1,
-2.054629, -1.478549, -0.8436769, 1, 1, 1, 1, 1,
-2.029942, -0.4650548, -1.216651, 1, 1, 1, 1, 1,
-2.016223, 0.7114118, 0.2259754, 1, 1, 1, 1, 1,
-2.004309, -2.275988, -1.849855, 1, 1, 1, 1, 1,
-1.979661, -0.6383427, -3.271109, 1, 1, 1, 1, 1,
-1.960061, 1.539365, 0.8482932, 1, 1, 1, 1, 1,
-1.954607, 0.04121143, -0.5640239, 1, 1, 1, 1, 1,
-1.951438, -1.93321, -2.99885, 1, 1, 1, 1, 1,
-1.949731, 1.118338, -0.9366331, 1, 1, 1, 1, 1,
-1.946702, 0.3376803, -1.360885, 1, 1, 1, 1, 1,
-1.937208, -0.4333186, 0.1795416, 0, 0, 1, 1, 1,
-1.931292, 0.9427261, -0.692569, 1, 0, 0, 1, 1,
-1.9283, 0.290879, -1.994265, 1, 0, 0, 1, 1,
-1.925012, 0.3437701, -0.7853636, 1, 0, 0, 1, 1,
-1.841687, -0.01957721, -0.4427925, 1, 0, 0, 1, 1,
-1.813082, -0.8732442, -3.115257, 1, 0, 0, 1, 1,
-1.754473, -0.2962642, -2.293765, 0, 0, 0, 1, 1,
-1.751866, 0.3223903, -1.826012, 0, 0, 0, 1, 1,
-1.747745, -0.475036, -2.847922, 0, 0, 0, 1, 1,
-1.74086, -0.6134459, -2.205621, 0, 0, 0, 1, 1,
-1.731831, -1.141182, -2.066283, 0, 0, 0, 1, 1,
-1.730592, -1.160012, -1.693354, 0, 0, 0, 1, 1,
-1.728265, -0.1077403, -0.5728924, 0, 0, 0, 1, 1,
-1.716467, -0.9882939, -3.234013, 1, 1, 1, 1, 1,
-1.702124, -0.46999, 0.9657977, 1, 1, 1, 1, 1,
-1.69699, 0.1937149, -2.68936, 1, 1, 1, 1, 1,
-1.691817, 0.8260484, -0.8058181, 1, 1, 1, 1, 1,
-1.674132, -1.274043, -1.454623, 1, 1, 1, 1, 1,
-1.670239, 0.6335447, -0.7607549, 1, 1, 1, 1, 1,
-1.665276, 0.6875268, -0.5067677, 1, 1, 1, 1, 1,
-1.64722, 0.2427235, -2.724512, 1, 1, 1, 1, 1,
-1.632869, -0.8717133, -0.9624614, 1, 1, 1, 1, 1,
-1.630369, -0.5392404, -1.241351, 1, 1, 1, 1, 1,
-1.619382, -1.114284, -2.293552, 1, 1, 1, 1, 1,
-1.615933, -0.7732847, -2.48708, 1, 1, 1, 1, 1,
-1.601788, 1.556447, -1.176469, 1, 1, 1, 1, 1,
-1.598878, 1.428063, 0.178154, 1, 1, 1, 1, 1,
-1.598674, -0.211289, -1.688944, 1, 1, 1, 1, 1,
-1.585223, 0.9246236, -1.13003, 0, 0, 1, 1, 1,
-1.579159, 0.9911832, -1.987698, 1, 0, 0, 1, 1,
-1.574647, -0.1108303, -0.87229, 1, 0, 0, 1, 1,
-1.548925, -1.265283, -3.14347, 1, 0, 0, 1, 1,
-1.543487, -0.2133213, -2.998165, 1, 0, 0, 1, 1,
-1.529573, -1.659372, -2.364918, 1, 0, 0, 1, 1,
-1.523993, -0.04099579, -0.3038602, 0, 0, 0, 1, 1,
-1.517479, 1.426552, -0.5970976, 0, 0, 0, 1, 1,
-1.507519, -0.651439, -1.886835, 0, 0, 0, 1, 1,
-1.497612, 0.0370592, -1.334712, 0, 0, 0, 1, 1,
-1.494424, 0.2220193, -1.299546, 0, 0, 0, 1, 1,
-1.491223, -0.1095792, -1.470323, 0, 0, 0, 1, 1,
-1.488486, -0.9815115, -2.792661, 0, 0, 0, 1, 1,
-1.476496, 1.252939, -1.407652, 1, 1, 1, 1, 1,
-1.473765, -0.09432425, -0.8767232, 1, 1, 1, 1, 1,
-1.466171, -1.121483, -3.943929, 1, 1, 1, 1, 1,
-1.464207, -0.16935, -1.544582, 1, 1, 1, 1, 1,
-1.464171, 1.214009, -0.08677815, 1, 1, 1, 1, 1,
-1.458561, -1.10796, -1.469289, 1, 1, 1, 1, 1,
-1.455181, 0.798172, -0.6307611, 1, 1, 1, 1, 1,
-1.454389, -1.040709, -2.272132, 1, 1, 1, 1, 1,
-1.438796, 2.36112, -1.058728, 1, 1, 1, 1, 1,
-1.433124, -0.2015951, -2.213129, 1, 1, 1, 1, 1,
-1.431481, 0.7875883, 0.586833, 1, 1, 1, 1, 1,
-1.411783, -0.1929426, -2.421462, 1, 1, 1, 1, 1,
-1.40915, -1.221536, -1.959275, 1, 1, 1, 1, 1,
-1.406582, 0.1403832, -1.627887, 1, 1, 1, 1, 1,
-1.392726, -0.5852931, -2.159231, 1, 1, 1, 1, 1,
-1.389911, 1.057566, -0.4997765, 0, 0, 1, 1, 1,
-1.376105, 0.2703811, -2.479082, 1, 0, 0, 1, 1,
-1.350619, 0.866597, -1.376816, 1, 0, 0, 1, 1,
-1.345736, -0.4844415, -1.717804, 1, 0, 0, 1, 1,
-1.343213, 0.8791881, -1.25662, 1, 0, 0, 1, 1,
-1.339791, 1.567542, 0.2225215, 1, 0, 0, 1, 1,
-1.337654, 0.4023066, -3.841648, 0, 0, 0, 1, 1,
-1.312341, 0.3394774, -3.187591, 0, 0, 0, 1, 1,
-1.311743, -0.1758724, -0.7468976, 0, 0, 0, 1, 1,
-1.3101, 0.1522573, -1.602157, 0, 0, 0, 1, 1,
-1.307304, -1.689069, -3.2173, 0, 0, 0, 1, 1,
-1.306007, -1.31704, -1.360157, 0, 0, 0, 1, 1,
-1.305204, 1.076249, -2.228291, 0, 0, 0, 1, 1,
-1.297285, -0.8828278, -1.926883, 1, 1, 1, 1, 1,
-1.2861, 1.589407, 1.072745, 1, 1, 1, 1, 1,
-1.284639, 0.02118058, -2.033858, 1, 1, 1, 1, 1,
-1.282807, 0.01699221, -2.218083, 1, 1, 1, 1, 1,
-1.277942, 0.6876929, -0.2403153, 1, 1, 1, 1, 1,
-1.272548, -1.891515, -1.829188, 1, 1, 1, 1, 1,
-1.265791, -0.358344, -3.270015, 1, 1, 1, 1, 1,
-1.259084, -0.4522192, -0.3183298, 1, 1, 1, 1, 1,
-1.258822, -1.020345, -3.135748, 1, 1, 1, 1, 1,
-1.258299, 0.2051063, 0.7551367, 1, 1, 1, 1, 1,
-1.243619, 1.913427, -0.1970586, 1, 1, 1, 1, 1,
-1.240856, 0.3970755, -2.126171, 1, 1, 1, 1, 1,
-1.235658, -0.1156536, -1.25186, 1, 1, 1, 1, 1,
-1.228714, 2.765899, -2.765208, 1, 1, 1, 1, 1,
-1.227436, -0.4579441, -1.233939, 1, 1, 1, 1, 1,
-1.227324, -1.192882, -2.017724, 0, 0, 1, 1, 1,
-1.217725, 0.5417383, -1.323375, 1, 0, 0, 1, 1,
-1.200734, -0.03434251, -1.418124, 1, 0, 0, 1, 1,
-1.195256, -0.8449459, -1.73567, 1, 0, 0, 1, 1,
-1.194885, 0.4612729, -1.085059, 1, 0, 0, 1, 1,
-1.18709, -1.64336, -2.319637, 1, 0, 0, 1, 1,
-1.186011, 0.6518406, -1.965474, 0, 0, 0, 1, 1,
-1.168551, -0.2525832, 0.1278436, 0, 0, 0, 1, 1,
-1.163695, 1.888722, 2.044869, 0, 0, 0, 1, 1,
-1.153792, 0.8156154, 0.5173962, 0, 0, 0, 1, 1,
-1.143353, 1.931623, -2.075163, 0, 0, 0, 1, 1,
-1.132325, -0.3996478, -0.3675065, 0, 0, 0, 1, 1,
-1.112263, -2.073533, -2.96538, 0, 0, 0, 1, 1,
-1.106855, -0.227683, -2.357009, 1, 1, 1, 1, 1,
-1.105145, 1.763671, -0.4050951, 1, 1, 1, 1, 1,
-1.104684, 0.4617912, -3.694396, 1, 1, 1, 1, 1,
-1.088841, -0.1173555, -2.489723, 1, 1, 1, 1, 1,
-1.083902, -0.1088984, -2.732118, 1, 1, 1, 1, 1,
-1.074481, -0.1374065, -4.329875, 1, 1, 1, 1, 1,
-1.067994, -1.864004, -5.062237, 1, 1, 1, 1, 1,
-1.065979, -1.662106, -1.465364, 1, 1, 1, 1, 1,
-1.057078, 1.133993, 0.3303392, 1, 1, 1, 1, 1,
-1.056871, -0.05608801, -1.203617, 1, 1, 1, 1, 1,
-1.055326, 0.033127, -0.731766, 1, 1, 1, 1, 1,
-1.049604, 0.9132302, -0.91181, 1, 1, 1, 1, 1,
-1.048095, 1.546575, -0.8467291, 1, 1, 1, 1, 1,
-1.044722, 0.6382672, -2.088333, 1, 1, 1, 1, 1,
-1.038603, -0.3175634, -5.460109, 1, 1, 1, 1, 1,
-1.036181, 0.1378308, -2.192908, 0, 0, 1, 1, 1,
-1.025033, 0.6935523, -0.179148, 1, 0, 0, 1, 1,
-1.015194, -1.955547, -3.994616, 1, 0, 0, 1, 1,
-1.008307, -0.7155982, -2.622856, 1, 0, 0, 1, 1,
-1.00269, 1.286413, 1.385734, 1, 0, 0, 1, 1,
-1.000401, 1.6026, -0.6623336, 1, 0, 0, 1, 1,
-1.000291, -0.9066812, -2.444599, 0, 0, 0, 1, 1,
-0.9948607, 1.580732, -0.04406152, 0, 0, 0, 1, 1,
-0.9929087, -0.5666719, -2.147077, 0, 0, 0, 1, 1,
-0.9868761, -1.879324, -2.594253, 0, 0, 0, 1, 1,
-0.984692, 0.5675023, -2.010427, 0, 0, 0, 1, 1,
-0.9763896, -2.534901, -2.693338, 0, 0, 0, 1, 1,
-0.9757301, -0.2090979, -0.1341237, 0, 0, 0, 1, 1,
-0.975616, 0.05524536, -0.9244732, 1, 1, 1, 1, 1,
-0.9746833, 0.617449, -1.143993, 1, 1, 1, 1, 1,
-0.9741364, 0.005219227, -1.617416, 1, 1, 1, 1, 1,
-0.9736567, 0.1082425, -0.5014663, 1, 1, 1, 1, 1,
-0.9714413, -0.3032971, -3.159261, 1, 1, 1, 1, 1,
-0.9708047, 0.781705, -0.02230775, 1, 1, 1, 1, 1,
-0.9684936, 1.006447, 0.8029174, 1, 1, 1, 1, 1,
-0.9638244, 2.81527, -0.6420478, 1, 1, 1, 1, 1,
-0.9500793, -1.681287, -2.621626, 1, 1, 1, 1, 1,
-0.9451497, 2.429712, -1.194684, 1, 1, 1, 1, 1,
-0.9306499, -0.5480379, -2.387911, 1, 1, 1, 1, 1,
-0.9303818, 0.4752136, -2.292151, 1, 1, 1, 1, 1,
-0.9261065, -0.09666482, -2.187781, 1, 1, 1, 1, 1,
-0.9236074, -0.7799634, -2.13529, 1, 1, 1, 1, 1,
-0.9216617, 2.979878, -0.573664, 1, 1, 1, 1, 1,
-0.919681, 0.8028339, -1.653859, 0, 0, 1, 1, 1,
-0.9164109, 0.2890702, -0.6740979, 1, 0, 0, 1, 1,
-0.9161068, -1.038586, -1.437974, 1, 0, 0, 1, 1,
-0.9109537, 1.013314, -2.749702, 1, 0, 0, 1, 1,
-0.9077204, -1.245071, -2.587457, 1, 0, 0, 1, 1,
-0.896642, 1.230182, 1.15705, 1, 0, 0, 1, 1,
-0.8881348, 0.5464478, -1.232068, 0, 0, 0, 1, 1,
-0.8880746, 0.8108617, -2.233062, 0, 0, 0, 1, 1,
-0.8868059, -1.877709, -4.251014, 0, 0, 0, 1, 1,
-0.8782869, 1.292097, -0.9675214, 0, 0, 0, 1, 1,
-0.8756999, -1.310662, -0.6863998, 0, 0, 0, 1, 1,
-0.8750323, 0.4178849, -0.8766614, 0, 0, 0, 1, 1,
-0.8680583, 0.4582005, -3.448691, 0, 0, 0, 1, 1,
-0.8679123, -0.08943169, -2.335988, 1, 1, 1, 1, 1,
-0.8626767, 0.05909342, -2.501698, 1, 1, 1, 1, 1,
-0.8606876, 0.5903412, -0.4381214, 1, 1, 1, 1, 1,
-0.856653, -0.09122399, -1.80004, 1, 1, 1, 1, 1,
-0.8534279, -1.506562, -2.450171, 1, 1, 1, 1, 1,
-0.84997, 0.3187218, -2.930841, 1, 1, 1, 1, 1,
-0.8475136, 0.3486318, -1.79419, 1, 1, 1, 1, 1,
-0.8457801, 0.1813103, -1.805984, 1, 1, 1, 1, 1,
-0.8337955, 0.5952502, -1.934496, 1, 1, 1, 1, 1,
-0.8315133, -0.07775049, -2.208914, 1, 1, 1, 1, 1,
-0.8298552, 0.7706072, -0.2135013, 1, 1, 1, 1, 1,
-0.8279976, 0.7025169, 1.442489, 1, 1, 1, 1, 1,
-0.8272115, 0.1977715, -1.235853, 1, 1, 1, 1, 1,
-0.8236089, -1.379499, -1.545123, 1, 1, 1, 1, 1,
-0.8219474, -0.9273659, -2.269375, 1, 1, 1, 1, 1,
-0.813586, 1.899223, -0.9654332, 0, 0, 1, 1, 1,
-0.8129689, 0.4993818, -1.351827, 1, 0, 0, 1, 1,
-0.8077891, -1.898167, -2.460926, 1, 0, 0, 1, 1,
-0.8047313, -0.1554668, -1.197667, 1, 0, 0, 1, 1,
-0.804695, -0.8298387, -2.279429, 1, 0, 0, 1, 1,
-0.8042011, 0.9568126, 1.235318, 1, 0, 0, 1, 1,
-0.8031822, -0.1063012, -4.304725, 0, 0, 0, 1, 1,
-0.7997987, 2.074178, 0.2662255, 0, 0, 0, 1, 1,
-0.7963145, -1.184152, -2.506659, 0, 0, 0, 1, 1,
-0.7928861, -1.062669, -1.956525, 0, 0, 0, 1, 1,
-0.7917172, -0.1364056, -2.060818, 0, 0, 0, 1, 1,
-0.7891294, -0.2677296, -3.081332, 0, 0, 0, 1, 1,
-0.7845218, 0.09120327, 0.008732926, 0, 0, 0, 1, 1,
-0.7820773, -1.098735, -1.845598, 1, 1, 1, 1, 1,
-0.7753991, 0.1821769, -0.5265808, 1, 1, 1, 1, 1,
-0.7611659, 1.139823, -1.033071, 1, 1, 1, 1, 1,
-0.7453645, -1.267864, -0.9138526, 1, 1, 1, 1, 1,
-0.7414522, 0.6561322, -2.518057, 1, 1, 1, 1, 1,
-0.7409713, 1.354197, 0.3673532, 1, 1, 1, 1, 1,
-0.740389, 0.253937, -1.105823, 1, 1, 1, 1, 1,
-0.7402477, -0.6109368, -1.800685, 1, 1, 1, 1, 1,
-0.7364203, -1.428973, -3.476808, 1, 1, 1, 1, 1,
-0.7358403, 0.1085207, -2.256216, 1, 1, 1, 1, 1,
-0.7278121, 0.7891513, -1.102971, 1, 1, 1, 1, 1,
-0.7218485, -0.5647083, -3.598906, 1, 1, 1, 1, 1,
-0.7183764, 1.333071, -0.3384397, 1, 1, 1, 1, 1,
-0.7146618, -0.8805891, -2.588456, 1, 1, 1, 1, 1,
-0.6986504, 0.1241117, -2.6484, 1, 1, 1, 1, 1,
-0.6975807, -0.5742533, -1.335834, 0, 0, 1, 1, 1,
-0.6960375, -0.515715, -2.547371, 1, 0, 0, 1, 1,
-0.6951833, 1.696587, -0.2630847, 1, 0, 0, 1, 1,
-0.6949863, 0.1801234, -1.165841, 1, 0, 0, 1, 1,
-0.694658, 0.7579609, -1.454284, 1, 0, 0, 1, 1,
-0.6941469, 0.1509933, -2.13725, 1, 0, 0, 1, 1,
-0.6931373, -0.4669259, -1.60509, 0, 0, 0, 1, 1,
-0.6878943, 2.315546, -0.6440455, 0, 0, 0, 1, 1,
-0.685714, 2.043703, -0.5707809, 0, 0, 0, 1, 1,
-0.6650773, 0.1938073, -0.2122719, 0, 0, 0, 1, 1,
-0.6625009, 0.5674955, -0.05698993, 0, 0, 0, 1, 1,
-0.6563064, -0.6655099, -3.744941, 0, 0, 0, 1, 1,
-0.6556677, 0.1275317, -1.296904, 0, 0, 0, 1, 1,
-0.6506044, 1.4169, 0.003006038, 1, 1, 1, 1, 1,
-0.6497161, -0.3300578, -1.779991, 1, 1, 1, 1, 1,
-0.6491493, 0.175321, -1.278929, 1, 1, 1, 1, 1,
-0.6475657, 0.6884775, 0.6788323, 1, 1, 1, 1, 1,
-0.6474679, -0.4213931, -4.054465, 1, 1, 1, 1, 1,
-0.6411474, -0.1401596, -0.3809821, 1, 1, 1, 1, 1,
-0.6370903, 0.5450232, 0.124591, 1, 1, 1, 1, 1,
-0.6349816, -0.0855841, -1.424183, 1, 1, 1, 1, 1,
-0.6330998, 0.3989553, -1.722788, 1, 1, 1, 1, 1,
-0.6234881, 1.953571, 1.198882, 1, 1, 1, 1, 1,
-0.6185649, 0.9274032, 0.3629463, 1, 1, 1, 1, 1,
-0.6167467, 0.6057636, -0.5505884, 1, 1, 1, 1, 1,
-0.6155497, 1.465655, 1.520002, 1, 1, 1, 1, 1,
-0.6106517, 0.3605038, -1.050965, 1, 1, 1, 1, 1,
-0.6072193, 0.1773965, -0.947128, 1, 1, 1, 1, 1,
-0.6021985, 0.7491912, -0.7632175, 0, 0, 1, 1, 1,
-0.5983772, 0.8862881, -1.463841, 1, 0, 0, 1, 1,
-0.5957536, -0.3257738, -3.569117, 1, 0, 0, 1, 1,
-0.5904785, 1.828587, 0.9853556, 1, 0, 0, 1, 1,
-0.5863625, 0.5884546, -0.6851755, 1, 0, 0, 1, 1,
-0.5810511, -0.9323462, -4.556245, 1, 0, 0, 1, 1,
-0.5789525, -1.002051, -1.798705, 0, 0, 0, 1, 1,
-0.5775094, -1.305882, -2.793786, 0, 0, 0, 1, 1,
-0.5749525, 0.6346393, -0.05773924, 0, 0, 0, 1, 1,
-0.5746727, 1.011408, -1.78422, 0, 0, 0, 1, 1,
-0.5729104, 0.228654, -2.458317, 0, 0, 0, 1, 1,
-0.5715783, 1.606861, 0.0528746, 0, 0, 0, 1, 1,
-0.5668855, 0.9706879, -0.9921796, 0, 0, 0, 1, 1,
-0.5637559, 1.118173, -0.9595179, 1, 1, 1, 1, 1,
-0.5605445, 1.404442, -0.6603092, 1, 1, 1, 1, 1,
-0.5579906, 0.5894843, 0.05951477, 1, 1, 1, 1, 1,
-0.5573327, -2.313444, -2.335259, 1, 1, 1, 1, 1,
-0.5557926, 0.2005087, -0.8441296, 1, 1, 1, 1, 1,
-0.5531384, 0.05484457, -0.9344591, 1, 1, 1, 1, 1,
-0.5526326, -1.355168, -2.930067, 1, 1, 1, 1, 1,
-0.5506709, -0.02689204, -1.533441, 1, 1, 1, 1, 1,
-0.548544, -0.9453678, -3.593711, 1, 1, 1, 1, 1,
-0.5435819, 2.293029, -1.055939, 1, 1, 1, 1, 1,
-0.5394786, 0.7503198, -1.131886, 1, 1, 1, 1, 1,
-0.5372066, 0.1563149, -0.223669, 1, 1, 1, 1, 1,
-0.5337127, -1.002965, -2.639216, 1, 1, 1, 1, 1,
-0.5316744, -0.6380966, -2.229554, 1, 1, 1, 1, 1,
-0.5310199, -0.4642887, -2.908149, 1, 1, 1, 1, 1,
-0.527222, -0.1817301, -2.855819, 0, 0, 1, 1, 1,
-0.5257581, -0.1042534, -2.113527, 1, 0, 0, 1, 1,
-0.5241728, -0.3866375, -1.175893, 1, 0, 0, 1, 1,
-0.5239801, 0.4021903, -0.992696, 1, 0, 0, 1, 1,
-0.5236758, -1.424044, -2.060725, 1, 0, 0, 1, 1,
-0.5226145, 0.8546099, -0.7920772, 1, 0, 0, 1, 1,
-0.5197633, 0.4019235, -1.439974, 0, 0, 0, 1, 1,
-0.519393, -0.734111, -3.496262, 0, 0, 0, 1, 1,
-0.5168905, -1.169846, -4.337919, 0, 0, 0, 1, 1,
-0.5162583, 0.6423647, -0.7937197, 0, 0, 0, 1, 1,
-0.509496, 0.9510528, -1.861306, 0, 0, 0, 1, 1,
-0.5068834, 0.178886, -1.092925, 0, 0, 0, 1, 1,
-0.5027511, 2.207619, -0.6595348, 0, 0, 0, 1, 1,
-0.5005175, -0.01518057, -0.5325801, 1, 1, 1, 1, 1,
-0.4994198, -0.4657789, -2.489426, 1, 1, 1, 1, 1,
-0.4991111, 0.01080374, 0.3799514, 1, 1, 1, 1, 1,
-0.4955411, -1.017356, -2.918526, 1, 1, 1, 1, 1,
-0.4941261, -0.6265282, -4.088329, 1, 1, 1, 1, 1,
-0.4931563, -0.06027124, 0.04120551, 1, 1, 1, 1, 1,
-0.4922325, -0.07573663, 0.07794864, 1, 1, 1, 1, 1,
-0.4903782, -0.4530011, -2.80702, 1, 1, 1, 1, 1,
-0.4896967, 0.9096992, -2.847936, 1, 1, 1, 1, 1,
-0.4857681, 1.080911, 0.9442449, 1, 1, 1, 1, 1,
-0.4820168, 0.600142, 1.261674, 1, 1, 1, 1, 1,
-0.4790022, -1.732814, -2.688608, 1, 1, 1, 1, 1,
-0.4762376, 1.16423, -2.90403, 1, 1, 1, 1, 1,
-0.4709469, 0.6161991, -0.7332577, 1, 1, 1, 1, 1,
-0.4662755, -0.3606015, -4.599992, 1, 1, 1, 1, 1,
-0.4647943, 0.4318118, -0.9085402, 0, 0, 1, 1, 1,
-0.4607967, 2.191787, -1.98938, 1, 0, 0, 1, 1,
-0.4587694, -0.9408711, -0.9788769, 1, 0, 0, 1, 1,
-0.4574149, -0.5927919, -2.392787, 1, 0, 0, 1, 1,
-0.4566202, -0.498756, -3.38187, 1, 0, 0, 1, 1,
-0.4441467, 0.2739976, -1.914294, 1, 0, 0, 1, 1,
-0.4439935, 1.031221, -1.146563, 0, 0, 0, 1, 1,
-0.4426822, -0.2898055, -2.751437, 0, 0, 0, 1, 1,
-0.4416522, 1.442384, 0.808295, 0, 0, 0, 1, 1,
-0.4395154, 0.6910348, 0.06202456, 0, 0, 0, 1, 1,
-0.4250764, 0.99457, -0.02951047, 0, 0, 0, 1, 1,
-0.4210351, -0.4877268, -4.880916, 0, 0, 0, 1, 1,
-0.4187946, 1.127564, -0.3731038, 0, 0, 0, 1, 1,
-0.4152266, -0.6163516, -3.303492, 1, 1, 1, 1, 1,
-0.4144036, 0.1271466, -1.451169, 1, 1, 1, 1, 1,
-0.4128433, 0.2259678, -1.063771, 1, 1, 1, 1, 1,
-0.4115512, 0.8066087, -1.289961, 1, 1, 1, 1, 1,
-0.4075932, 0.7623311, 0.4540373, 1, 1, 1, 1, 1,
-0.4055209, -0.9843939, -2.891474, 1, 1, 1, 1, 1,
-0.4038194, 0.8508641, -0.3703332, 1, 1, 1, 1, 1,
-0.4018086, -0.2422464, -2.760087, 1, 1, 1, 1, 1,
-0.3980744, 0.3409086, -0.3970014, 1, 1, 1, 1, 1,
-0.3946678, 0.7317417, 0.4122792, 1, 1, 1, 1, 1,
-0.3932689, 0.570851, -0.212237, 1, 1, 1, 1, 1,
-0.3918634, 0.6871626, -2.161053, 1, 1, 1, 1, 1,
-0.3891029, 0.4560564, -0.001993736, 1, 1, 1, 1, 1,
-0.3869337, 0.1999168, -3.237384, 1, 1, 1, 1, 1,
-0.3857112, 1.073709, -0.009649037, 1, 1, 1, 1, 1,
-0.3843668, 1.86429, -0.7181603, 0, 0, 1, 1, 1,
-0.3803235, -0.6454555, -2.075104, 1, 0, 0, 1, 1,
-0.3785629, 1.027396, -0.508333, 1, 0, 0, 1, 1,
-0.3757758, 1.146398, -0.1409396, 1, 0, 0, 1, 1,
-0.3753909, -1.592149, -1.542488, 1, 0, 0, 1, 1,
-0.3709411, 0.4012142, 0.7485152, 1, 0, 0, 1, 1,
-0.3608976, -0.7096242, -2.209043, 0, 0, 0, 1, 1,
-0.3595952, -2.72136, -2.65379, 0, 0, 0, 1, 1,
-0.3496359, 0.5394432, -0.1219823, 0, 0, 0, 1, 1,
-0.3492517, 1.446878, -0.4476727, 0, 0, 0, 1, 1,
-0.3393753, -0.2116109, -2.525803, 0, 0, 0, 1, 1,
-0.3388279, 0.8458052, -0.2289131, 0, 0, 0, 1, 1,
-0.3318554, -2.368572, -1.888404, 0, 0, 0, 1, 1,
-0.3174252, -1.035759, -3.482496, 1, 1, 1, 1, 1,
-0.3151457, 0.9217994, -0.2950829, 1, 1, 1, 1, 1,
-0.3144693, 0.8753197, -1.018816, 1, 1, 1, 1, 1,
-0.3134831, -1.675164, -3.667645, 1, 1, 1, 1, 1,
-0.306255, -0.9829544, -4.210453, 1, 1, 1, 1, 1,
-0.3061711, -0.8135365, -4.113689, 1, 1, 1, 1, 1,
-0.3044939, 0.6724784, 1.081979, 1, 1, 1, 1, 1,
-0.3036149, 0.4492939, -0.8096651, 1, 1, 1, 1, 1,
-0.2971551, -1.274983, -4.415344, 1, 1, 1, 1, 1,
-0.2964754, -0.3884966, -2.882744, 1, 1, 1, 1, 1,
-0.2947116, -1.157127, -3.2766, 1, 1, 1, 1, 1,
-0.2931145, -1.492094, -2.85427, 1, 1, 1, 1, 1,
-0.289916, -0.1559197, -1.602969, 1, 1, 1, 1, 1,
-0.2893672, 0.7304871, 1.055017, 1, 1, 1, 1, 1,
-0.2893205, -0.2782071, -1.857124, 1, 1, 1, 1, 1,
-0.2772465, -1.473189, -3.862118, 0, 0, 1, 1, 1,
-0.2756306, 1.445049, 0.2846583, 1, 0, 0, 1, 1,
-0.2740371, 0.1606027, -0.5049652, 1, 0, 0, 1, 1,
-0.2719573, -0.5846182, -2.274402, 1, 0, 0, 1, 1,
-0.2707911, -0.7581957, -4.600087, 1, 0, 0, 1, 1,
-0.2691194, -0.5779595, -1.153131, 1, 0, 0, 1, 1,
-0.2608848, 0.1586175, -2.120898, 0, 0, 0, 1, 1,
-0.2607457, -0.8053866, -2.47474, 0, 0, 0, 1, 1,
-0.2603262, 0.4328623, -0.6901581, 0, 0, 0, 1, 1,
-0.2593225, -1.530109, -2.053446, 0, 0, 0, 1, 1,
-0.2579526, 0.5742196, -0.8711266, 0, 0, 0, 1, 1,
-0.256793, 0.550196, -1.364841, 0, 0, 0, 1, 1,
-0.2539082, -0.1879022, -1.244117, 0, 0, 0, 1, 1,
-0.2520747, 1.112152, -0.2571931, 1, 1, 1, 1, 1,
-0.2496051, 0.2025244, -0.7142668, 1, 1, 1, 1, 1,
-0.2474484, -0.3157622, -1.766035, 1, 1, 1, 1, 1,
-0.2434722, -0.1354649, -2.668416, 1, 1, 1, 1, 1,
-0.242808, 1.044845, -0.6809601, 1, 1, 1, 1, 1,
-0.2366003, -0.6286418, -5.63973, 1, 1, 1, 1, 1,
-0.2302372, -0.7408221, -3.665908, 1, 1, 1, 1, 1,
-0.2294788, -0.7875832, -3.266655, 1, 1, 1, 1, 1,
-0.2259918, 0.5420288, -2.586695, 1, 1, 1, 1, 1,
-0.2242503, 2.608312, 0.7695797, 1, 1, 1, 1, 1,
-0.2240853, 0.9225029, -1.96423, 1, 1, 1, 1, 1,
-0.2188067, -0.5628689, -3.24728, 1, 1, 1, 1, 1,
-0.2074323, 1.911424, 1.272155, 1, 1, 1, 1, 1,
-0.2073115, -0.2010292, -2.673615, 1, 1, 1, 1, 1,
-0.2063349, 1.032697, 1.026911, 1, 1, 1, 1, 1,
-0.2059027, -1.940932, -2.232314, 0, 0, 1, 1, 1,
-0.2044156, -1.63469, -3.198525, 1, 0, 0, 1, 1,
-0.2004826, 1.208285, -0.1777603, 1, 0, 0, 1, 1,
-0.2004499, 0.7092617, -0.3013929, 1, 0, 0, 1, 1,
-0.1973296, -0.8575696, -3.303655, 1, 0, 0, 1, 1,
-0.1938554, -0.4778454, -2.352078, 1, 0, 0, 1, 1,
-0.1914837, 1.113059, 0.4700164, 0, 0, 0, 1, 1,
-0.1902744, -1.351382, -1.247687, 0, 0, 0, 1, 1,
-0.1845267, 0.190112, -0.02090112, 0, 0, 0, 1, 1,
-0.1839015, -1.685244, -2.714706, 0, 0, 0, 1, 1,
-0.1821547, -1.165925, -3.334866, 0, 0, 0, 1, 1,
-0.1813581, -0.8117408, -2.692581, 0, 0, 0, 1, 1,
-0.1812752, 0.3058042, -1.830091, 0, 0, 0, 1, 1,
-0.1787017, 0.8341095, -1.025679, 1, 1, 1, 1, 1,
-0.1780987, 1.428986, -1.538284, 1, 1, 1, 1, 1,
-0.1688638, 0.3586819, -1.156606, 1, 1, 1, 1, 1,
-0.168052, -1.156193, -1.815678, 1, 1, 1, 1, 1,
-0.1657757, -0.5664664, -4.447575, 1, 1, 1, 1, 1,
-0.1649972, 0.4760105, -0.8927273, 1, 1, 1, 1, 1,
-0.1618168, 1.087909, -0.643249, 1, 1, 1, 1, 1,
-0.1606249, 0.2361502, -2.014557, 1, 1, 1, 1, 1,
-0.1604764, 0.6566589, 0.132303, 1, 1, 1, 1, 1,
-0.1597066, 1.614196, -1.092484, 1, 1, 1, 1, 1,
-0.1594992, 1.602587, 0.1819886, 1, 1, 1, 1, 1,
-0.1566044, -1.071926, -2.11698, 1, 1, 1, 1, 1,
-0.1560222, -0.2240467, -3.564957, 1, 1, 1, 1, 1,
-0.1536051, 0.3418098, -0.7475722, 1, 1, 1, 1, 1,
-0.1501618, -1.04597, -2.68924, 1, 1, 1, 1, 1,
-0.1466168, -0.3800611, -2.66549, 0, 0, 1, 1, 1,
-0.1455724, 0.848972, -0.1871836, 1, 0, 0, 1, 1,
-0.1449338, 0.03722249, -1.50765, 1, 0, 0, 1, 1,
-0.1390927, -0.5125595, -3.858668, 1, 0, 0, 1, 1,
-0.1345707, -1.317525, -2.554297, 1, 0, 0, 1, 1,
-0.1343964, -1.084724, -3.281876, 1, 0, 0, 1, 1,
-0.131754, 0.4232171, 0.5701013, 0, 0, 0, 1, 1,
-0.1314457, -1.03285, -4.14546, 0, 0, 0, 1, 1,
-0.1309689, 1.637823, 2.090213, 0, 0, 0, 1, 1,
-0.1290021, 0.8461055, 0.05136926, 0, 0, 0, 1, 1,
-0.1284045, 0.380795, -1.697809, 0, 0, 0, 1, 1,
-0.1282734, -0.7392374, -3.821743, 0, 0, 0, 1, 1,
-0.1278987, -0.8267387, -3.089, 0, 0, 0, 1, 1,
-0.1245259, -0.5968677, -3.615007, 1, 1, 1, 1, 1,
-0.1193158, -0.172115, -2.449703, 1, 1, 1, 1, 1,
-0.1184282, 1.086362, -0.7248415, 1, 1, 1, 1, 1,
-0.1150004, -0.8492126, -1.809687, 1, 1, 1, 1, 1,
-0.1145099, 0.4903735, -1.416206, 1, 1, 1, 1, 1,
-0.1121268, -0.1308053, -3.885143, 1, 1, 1, 1, 1,
-0.111051, -0.1818676, -3.452083, 1, 1, 1, 1, 1,
-0.1008268, -1.789116, -3.669108, 1, 1, 1, 1, 1,
-0.1001001, 0.20112, -0.1584406, 1, 1, 1, 1, 1,
-0.09830011, -0.4741892, -4.586818, 1, 1, 1, 1, 1,
-0.097719, 0.911777, -0.3737157, 1, 1, 1, 1, 1,
-0.09754261, -2.168863, -2.94002, 1, 1, 1, 1, 1,
-0.09628166, -0.08638886, -3.365814, 1, 1, 1, 1, 1,
-0.09606728, 0.7256175, 0.1976038, 1, 1, 1, 1, 1,
-0.09563377, -0.7824494, -2.488278, 1, 1, 1, 1, 1,
-0.09193804, -0.3577874, -3.098705, 0, 0, 1, 1, 1,
-0.09144632, 0.0986198, -1.193142, 1, 0, 0, 1, 1,
-0.08625607, -0.7340744, -2.787546, 1, 0, 0, 1, 1,
-0.08583061, -0.5084209, -0.9700437, 1, 0, 0, 1, 1,
-0.08056935, -0.7242821, -3.845678, 1, 0, 0, 1, 1,
-0.07733722, 1.273708, -0.4014881, 1, 0, 0, 1, 1,
-0.07611503, 0.6482395, -1.369215, 0, 0, 0, 1, 1,
-0.07515987, 2.696823, -1.73042, 0, 0, 0, 1, 1,
-0.07506147, -0.5176257, -1.364999, 0, 0, 0, 1, 1,
-0.07054863, 0.8363298, 0.9543077, 0, 0, 0, 1, 1,
-0.06945761, 0.5730131, -1.059163, 0, 0, 0, 1, 1,
-0.06367749, 0.809281, -0.5106232, 0, 0, 0, 1, 1,
-0.06191663, -0.9878766, -2.812045, 0, 0, 0, 1, 1,
-0.06092878, 2.280943, -0.1728376, 1, 1, 1, 1, 1,
-0.05925024, -0.1160075, -2.655474, 1, 1, 1, 1, 1,
-0.05884007, -1.073181, -3.48122, 1, 1, 1, 1, 1,
-0.05821398, 0.9273627, 0.4764397, 1, 1, 1, 1, 1,
-0.05691576, -0.3983685, -3.188958, 1, 1, 1, 1, 1,
-0.05631914, 1.299947, -0.5896338, 1, 1, 1, 1, 1,
-0.05531073, 0.01464485, -1.247268, 1, 1, 1, 1, 1,
-0.05102016, 0.251741, -0.877952, 1, 1, 1, 1, 1,
-0.04630476, -1.329108, -3.087808, 1, 1, 1, 1, 1,
-0.04474354, 1.407001, 0.5486677, 1, 1, 1, 1, 1,
-0.04068388, 1.725269, 2.219939, 1, 1, 1, 1, 1,
-0.04006538, -1.60274, -1.369678, 1, 1, 1, 1, 1,
-0.03899468, 0.3793418, 0.7273346, 1, 1, 1, 1, 1,
-0.03236295, 0.0101346, -2.259552, 1, 1, 1, 1, 1,
-0.03169104, 0.8476121, 1.451022, 1, 1, 1, 1, 1,
-0.03083289, -1.107658, -3.837632, 0, 0, 1, 1, 1,
-0.03059411, 0.6455202, -0.5284616, 1, 0, 0, 1, 1,
-0.02825631, -1.781839, -2.525287, 1, 0, 0, 1, 1,
-0.01978862, -1.16607, -2.097812, 1, 0, 0, 1, 1,
-0.01782332, 0.160726, -0.378076, 1, 0, 0, 1, 1,
-0.01243742, -0.09715518, -3.941521, 1, 0, 0, 1, 1,
-0.009794762, -0.1864964, -1.591988, 0, 0, 0, 1, 1,
-0.008832201, 0.08778627, -0.5997242, 0, 0, 0, 1, 1,
-0.007486014, 0.9522624, -1.997754, 0, 0, 0, 1, 1,
-0.005915515, -0.2561348, -2.85554, 0, 0, 0, 1, 1,
-0.00561503, -0.127158, -4.71086, 0, 0, 0, 1, 1,
-0.004704114, -1.268988, -3.034322, 0, 0, 0, 1, 1,
0.0003277455, 0.5011737, 1.053323, 0, 0, 0, 1, 1,
0.002737548, 0.492311, -0.7339123, 1, 1, 1, 1, 1,
0.004747023, 2.384524, 0.2560783, 1, 1, 1, 1, 1,
0.007110324, -0.004494855, 1.052297, 1, 1, 1, 1, 1,
0.009467754, 0.1196954, 0.2128276, 1, 1, 1, 1, 1,
0.01166763, -2.321386, 3.214738, 1, 1, 1, 1, 1,
0.01359003, -1.339477, 4.377104, 1, 1, 1, 1, 1,
0.01519939, 0.9250063, -1.10184, 1, 1, 1, 1, 1,
0.01521106, -1.280789, 3.551101, 1, 1, 1, 1, 1,
0.01604382, 0.261973, -0.8610161, 1, 1, 1, 1, 1,
0.01655401, 1.333009, 0.1153355, 1, 1, 1, 1, 1,
0.01659107, -1.556592, 4.822831, 1, 1, 1, 1, 1,
0.01814249, 1.241218, -0.2470906, 1, 1, 1, 1, 1,
0.02515282, 0.05984305, -0.1757072, 1, 1, 1, 1, 1,
0.02930269, -1.012148, 3.474367, 1, 1, 1, 1, 1,
0.02962029, -1.947517, 2.407492, 1, 1, 1, 1, 1,
0.03221224, -0.5539302, 4.123144, 0, 0, 1, 1, 1,
0.03323223, -0.936621, 4.436429, 1, 0, 0, 1, 1,
0.03748125, 0.7137842, 0.7040724, 1, 0, 0, 1, 1,
0.03749406, 0.01540241, 1.430275, 1, 0, 0, 1, 1,
0.03807044, -0.01743444, 1.26829, 1, 0, 0, 1, 1,
0.0408628, -0.1289786, 2.709512, 1, 0, 0, 1, 1,
0.04145982, -0.2207203, 2.819381, 0, 0, 0, 1, 1,
0.04263667, 1.814824, -0.6499919, 0, 0, 0, 1, 1,
0.04494844, 0.5205884, -0.6662481, 0, 0, 0, 1, 1,
0.05691711, -0.3309319, 2.055344, 0, 0, 0, 1, 1,
0.0570325, -0.6059837, 1.225993, 0, 0, 0, 1, 1,
0.06001172, -0.1164127, 3.113949, 0, 0, 0, 1, 1,
0.06306682, 0.5646784, -0.8604399, 0, 0, 0, 1, 1,
0.06597924, -1.796877, 3.590756, 1, 1, 1, 1, 1,
0.06831924, 0.5446132, -1.621195, 1, 1, 1, 1, 1,
0.06916975, 0.6012098, 0.06595904, 1, 1, 1, 1, 1,
0.06948747, 1.002671, 0.6552203, 1, 1, 1, 1, 1,
0.07143973, 0.4194357, 0.9148061, 1, 1, 1, 1, 1,
0.07173673, 0.6403265, 1.101766, 1, 1, 1, 1, 1,
0.07354473, 0.1043813, -0.2214684, 1, 1, 1, 1, 1,
0.07838313, -0.1476013, 2.024395, 1, 1, 1, 1, 1,
0.08041606, 1.167099, -0.652144, 1, 1, 1, 1, 1,
0.08141661, -0.5895155, 0.9715652, 1, 1, 1, 1, 1,
0.08343127, 2.433806, 0.3153509, 1, 1, 1, 1, 1,
0.08463696, 0.4186682, 0.2305775, 1, 1, 1, 1, 1,
0.08978527, -0.3528586, 3.12914, 1, 1, 1, 1, 1,
0.09035194, -0.8476328, 3.995517, 1, 1, 1, 1, 1,
0.09189056, 0.4061441, -0.4303765, 1, 1, 1, 1, 1,
0.09431235, -0.3785223, 3.071454, 0, 0, 1, 1, 1,
0.09694199, -0.7238279, 3.268182, 1, 0, 0, 1, 1,
0.105814, 0.105596, -1.267333, 1, 0, 0, 1, 1,
0.1094799, -0.09544806, 1.927251, 1, 0, 0, 1, 1,
0.1099458, 0.701979, 0.9487002, 1, 0, 0, 1, 1,
0.1122706, 0.6867489, -1.27126, 1, 0, 0, 1, 1,
0.1133949, -1.623484, 2.937821, 0, 0, 0, 1, 1,
0.1178237, -1.185215, 2.479375, 0, 0, 0, 1, 1,
0.1200911, 1.092269, -0.6384434, 0, 0, 0, 1, 1,
0.1225282, 1.317167, 1.58085, 0, 0, 0, 1, 1,
0.1226073, -0.5281317, 2.795695, 0, 0, 0, 1, 1,
0.1256674, -1.788269, 2.767872, 0, 0, 0, 1, 1,
0.1267471, -0.3068036, 4.138736, 0, 0, 0, 1, 1,
0.1305487, 0.100957, 0.8831482, 1, 1, 1, 1, 1,
0.1330554, 1.834742, 0.2251347, 1, 1, 1, 1, 1,
0.1334652, -1.065932, 1.946935, 1, 1, 1, 1, 1,
0.1382327, 0.1089491, 2.127105, 1, 1, 1, 1, 1,
0.1427323, 0.9421425, -0.004517878, 1, 1, 1, 1, 1,
0.1507992, 0.9130309, 0.4113863, 1, 1, 1, 1, 1,
0.1512258, 0.3499002, 1.370062, 1, 1, 1, 1, 1,
0.152672, 1.315208, 0.3292476, 1, 1, 1, 1, 1,
0.1534567, 0.0228635, 1.03817, 1, 1, 1, 1, 1,
0.1555327, 0.08899178, 0.6630045, 1, 1, 1, 1, 1,
0.1559497, -0.4650709, 2.716027, 1, 1, 1, 1, 1,
0.1560489, 1.513542, 1.000083, 1, 1, 1, 1, 1,
0.1635168, 0.6952252, -0.1519876, 1, 1, 1, 1, 1,
0.163608, 0.09874132, -0.3788991, 1, 1, 1, 1, 1,
0.1647739, -0.6833124, 2.514949, 1, 1, 1, 1, 1,
0.1686754, 0.5502446, 1.040172, 0, 0, 1, 1, 1,
0.1692145, -0.8433578, 2.127407, 1, 0, 0, 1, 1,
0.1692159, 0.4419757, -0.8443898, 1, 0, 0, 1, 1,
0.1712972, -0.9619341, 1.489406, 1, 0, 0, 1, 1,
0.1796409, -0.2579463, 2.519531, 1, 0, 0, 1, 1,
0.1847219, 1.762463, -0.3656277, 1, 0, 0, 1, 1,
0.184975, -1.053812, 3.880524, 0, 0, 0, 1, 1,
0.18509, -0.5409977, 3.397951, 0, 0, 0, 1, 1,
0.1856942, 1.012643, -2.39214, 0, 0, 0, 1, 1,
0.1858709, 0.5267818, -0.8090107, 0, 0, 0, 1, 1,
0.1905393, -2.052571, 1.110678, 0, 0, 0, 1, 1,
0.1936924, 0.4107849, -0.02492131, 0, 0, 0, 1, 1,
0.1959992, 0.4207738, -0.3966944, 0, 0, 0, 1, 1,
0.2014631, 0.028778, 1.573172, 1, 1, 1, 1, 1,
0.2018424, 0.09369481, 0.3960369, 1, 1, 1, 1, 1,
0.2054213, 1.095833, 0.428453, 1, 1, 1, 1, 1,
0.2097995, -0.9047422, 3.13551, 1, 1, 1, 1, 1,
0.2102455, 0.01843227, 1.966902, 1, 1, 1, 1, 1,
0.2111585, 0.8717444, 1.312532, 1, 1, 1, 1, 1,
0.2155656, -0.2019275, 2.467257, 1, 1, 1, 1, 1,
0.2211549, 0.3306467, 1.138997, 1, 1, 1, 1, 1,
0.2258236, 0.4532398, -1.084673, 1, 1, 1, 1, 1,
0.2285789, -0.382604, 3.678347, 1, 1, 1, 1, 1,
0.2310249, -0.3288744, 2.14963, 1, 1, 1, 1, 1,
0.2320199, -0.8561694, 3.456193, 1, 1, 1, 1, 1,
0.2332838, -0.7636291, 4.651696, 1, 1, 1, 1, 1,
0.2416731, -1.698004, 2.888144, 1, 1, 1, 1, 1,
0.2433506, -0.1766093, 2.371895, 1, 1, 1, 1, 1,
0.2502846, -0.9387996, 3.798652, 0, 0, 1, 1, 1,
0.2516955, 0.8822328, -1.302617, 1, 0, 0, 1, 1,
0.2520053, -0.8148924, 1.323097, 1, 0, 0, 1, 1,
0.2536163, -0.1720007, 1.627632, 1, 0, 0, 1, 1,
0.2565828, -0.9594685, 2.841392, 1, 0, 0, 1, 1,
0.2589918, -0.4780801, 1.93273, 1, 0, 0, 1, 1,
0.2606239, -0.1382704, 2.388273, 0, 0, 0, 1, 1,
0.26149, -1.267521, 2.592267, 0, 0, 0, 1, 1,
0.2639915, -0.5203271, 3.925398, 0, 0, 0, 1, 1,
0.2764591, -2.565995, 1.68729, 0, 0, 0, 1, 1,
0.2796831, 0.1911598, 1.693086, 0, 0, 0, 1, 1,
0.2814204, 0.5865109, 0.9777307, 0, 0, 0, 1, 1,
0.2829886, -1.188905, 3.28601, 0, 0, 0, 1, 1,
0.2877368, 1.847774, 2.298648, 1, 1, 1, 1, 1,
0.2890192, 0.1497301, 3.558058, 1, 1, 1, 1, 1,
0.2897492, -0.3479048, 4.696897, 1, 1, 1, 1, 1,
0.2951326, 2.544843, 0.1721237, 1, 1, 1, 1, 1,
0.3004099, 0.2322162, 0.314277, 1, 1, 1, 1, 1,
0.3016289, -1.531278, 4.039542, 1, 1, 1, 1, 1,
0.3028924, -1.11205, 2.769996, 1, 1, 1, 1, 1,
0.3030979, 1.535837, 1.105703, 1, 1, 1, 1, 1,
0.3032349, 0.9078957, 1.474872, 1, 1, 1, 1, 1,
0.3054999, -0.03014177, -0.01410517, 1, 1, 1, 1, 1,
0.3061008, 0.8145453, 1.914013, 1, 1, 1, 1, 1,
0.3064679, -1.066525, 2.589741, 1, 1, 1, 1, 1,
0.3081489, 1.919473, -1.102806, 1, 1, 1, 1, 1,
0.3108178, 0.9363409, 0.773032, 1, 1, 1, 1, 1,
0.3150773, 0.8666871, 1.770358, 1, 1, 1, 1, 1,
0.3155448, 1.471658, 0.3033783, 0, 0, 1, 1, 1,
0.3158431, 0.8301295, 0.3216359, 1, 0, 0, 1, 1,
0.3279477, -0.7089456, 1.679154, 1, 0, 0, 1, 1,
0.3290773, -0.1146956, 3.218393, 1, 0, 0, 1, 1,
0.3302312, -1.504663, 3.252995, 1, 0, 0, 1, 1,
0.3313843, 0.2617332, 0.4258527, 1, 0, 0, 1, 1,
0.3329715, -0.4187512, 3.306681, 0, 0, 0, 1, 1,
0.3336998, 0.781936, 0.6154864, 0, 0, 0, 1, 1,
0.3388744, -0.6585652, 4.114054, 0, 0, 0, 1, 1,
0.3424706, 2.166575, 2.386053, 0, 0, 0, 1, 1,
0.3478447, 1.271809, -1.754874, 0, 0, 0, 1, 1,
0.3478581, 1.301284, -0.9299074, 0, 0, 0, 1, 1,
0.3507448, 0.6393977, 1.851754, 0, 0, 0, 1, 1,
0.3508534, 0.7700488, 0.7203034, 1, 1, 1, 1, 1,
0.3553329, 0.002798825, 0.7598833, 1, 1, 1, 1, 1,
0.3562653, 0.8494483, 0.5926378, 1, 1, 1, 1, 1,
0.3571348, 0.8568831, -0.1320412, 1, 1, 1, 1, 1,
0.3615233, -1.389374, 2.646429, 1, 1, 1, 1, 1,
0.362348, 0.7070889, 2.245029, 1, 1, 1, 1, 1,
0.3638935, 0.1166313, 1.020638, 1, 1, 1, 1, 1,
0.3655942, 1.027352, 2.577075, 1, 1, 1, 1, 1,
0.367254, 0.2539195, 1.208053, 1, 1, 1, 1, 1,
0.3672602, 0.3844852, 1.597849, 1, 1, 1, 1, 1,
0.3680823, 0.33316, 1.69866, 1, 1, 1, 1, 1,
0.3710795, 1.114928, -1.833719, 1, 1, 1, 1, 1,
0.3718694, -0.8237761, 2.452154, 1, 1, 1, 1, 1,
0.3730721, -0.6021641, 1.798523, 1, 1, 1, 1, 1,
0.3746008, 1.1541, 1.294864, 1, 1, 1, 1, 1,
0.3823174, -0.9792667, 3.779362, 0, 0, 1, 1, 1,
0.3882763, 1.379478, -0.2029223, 1, 0, 0, 1, 1,
0.3898594, 0.9072984, -0.1000091, 1, 0, 0, 1, 1,
0.3921644, 0.1431089, 0.8935864, 1, 0, 0, 1, 1,
0.3955404, 1.869046, -0.6903229, 1, 0, 0, 1, 1,
0.3982704, -0.2558312, 5.550904, 1, 0, 0, 1, 1,
0.4024294, 0.4135515, 1.154418, 0, 0, 0, 1, 1,
0.4058034, -0.3822298, 0.6956189, 0, 0, 0, 1, 1,
0.4068359, -1.108801, 3.471608, 0, 0, 0, 1, 1,
0.4087114, -0.5595766, 3.293161, 0, 0, 0, 1, 1,
0.4111945, -1.341612, 3.616778, 0, 0, 0, 1, 1,
0.4134733, 0.01303162, 1.112482, 0, 0, 0, 1, 1,
0.4185797, 0.1034752, 2.85556, 0, 0, 0, 1, 1,
0.4233029, -0.03444933, 3.79937, 1, 1, 1, 1, 1,
0.4244846, 0.3493029, 1.170452, 1, 1, 1, 1, 1,
0.4260221, 1.724835, 1.304249, 1, 1, 1, 1, 1,
0.4267576, -0.004802907, 0.7275975, 1, 1, 1, 1, 1,
0.4294486, 1.155245, -0.7482038, 1, 1, 1, 1, 1,
0.4307925, -2.182775, 0.6478561, 1, 1, 1, 1, 1,
0.4321736, -0.7419313, 3.814438, 1, 1, 1, 1, 1,
0.4330194, 0.2704433, 1.082172, 1, 1, 1, 1, 1,
0.4348048, -0.07610487, 0.8418902, 1, 1, 1, 1, 1,
0.4357043, 1.067159, 0.01233951, 1, 1, 1, 1, 1,
0.4368181, -0.46319, 1.485985, 1, 1, 1, 1, 1,
0.437774, 0.2988071, 1.477226, 1, 1, 1, 1, 1,
0.4421036, 1.083405, 0.7104796, 1, 1, 1, 1, 1,
0.4454757, 0.9534461, 1.102886, 1, 1, 1, 1, 1,
0.4495829, -0.7177876, 3.906358, 1, 1, 1, 1, 1,
0.4524921, -1.857835, 2.575688, 0, 0, 1, 1, 1,
0.4586655, -3.347215, 2.457041, 1, 0, 0, 1, 1,
0.4591024, 0.6577755, -0.704139, 1, 0, 0, 1, 1,
0.4600328, -0.707082, 0.726687, 1, 0, 0, 1, 1,
0.463832, 0.7294841, 0.7039148, 1, 0, 0, 1, 1,
0.4693206, 1.243886, -1.05442, 1, 0, 0, 1, 1,
0.4744583, 1.807479, -1.053377, 0, 0, 0, 1, 1,
0.4772597, 1.470421, 0.1255569, 0, 0, 0, 1, 1,
0.4778458, 1.138243, -0.7713276, 0, 0, 0, 1, 1,
0.4794311, -0.9446495, 3.637103, 0, 0, 0, 1, 1,
0.4845761, 1.296434, -0.6630319, 0, 0, 0, 1, 1,
0.4853476, -0.7422938, 0.4880611, 0, 0, 0, 1, 1,
0.492465, -1.075662, 2.978276, 0, 0, 0, 1, 1,
0.4927242, 2.804175, -0.3614684, 1, 1, 1, 1, 1,
0.4986528, 0.5880163, 1.191309, 1, 1, 1, 1, 1,
0.5052952, -0.8041828, 2.837498, 1, 1, 1, 1, 1,
0.5097055, -0.6606964, 3.755447, 1, 1, 1, 1, 1,
0.5104918, 1.05974, 1.279101, 1, 1, 1, 1, 1,
0.5126013, 0.7651799, 0.105932, 1, 1, 1, 1, 1,
0.513594, 1.307741, 1.244489, 1, 1, 1, 1, 1,
0.5159787, -1.549734, 2.345893, 1, 1, 1, 1, 1,
0.5175085, 0.1599472, 1.111169, 1, 1, 1, 1, 1,
0.5231901, 1.904104, 0.6879368, 1, 1, 1, 1, 1,
0.5241646, -1.644513, 4.145344, 1, 1, 1, 1, 1,
0.525254, -0.2805918, 1.665411, 1, 1, 1, 1, 1,
0.527833, 1.099758, 0.9301404, 1, 1, 1, 1, 1,
0.5280892, -0.7140541, 4.626245, 1, 1, 1, 1, 1,
0.5313672, 1.210616, -0.1333319, 1, 1, 1, 1, 1,
0.5349465, 0.6776863, -0.03315777, 0, 0, 1, 1, 1,
0.5367949, -0.140499, 3.811046, 1, 0, 0, 1, 1,
0.537021, 0.07022882, 1.800193, 1, 0, 0, 1, 1,
0.537676, -0.824315, 1.488796, 1, 0, 0, 1, 1,
0.5384216, -1.3534, 4.981218, 1, 0, 0, 1, 1,
0.5415395, -1.287498, 2.063517, 1, 0, 0, 1, 1,
0.5464882, -0.8556241, 1.620099, 0, 0, 0, 1, 1,
0.5505317, -0.08760802, 0.08129556, 0, 0, 0, 1, 1,
0.5531282, -0.186611, 3.689173, 0, 0, 0, 1, 1,
0.5575828, 1.185362, 0.51188, 0, 0, 0, 1, 1,
0.5588016, -1.462499, 2.171158, 0, 0, 0, 1, 1,
0.5608816, 1.061107, -0.3594843, 0, 0, 0, 1, 1,
0.5609295, -0.1519819, 0.9192283, 0, 0, 0, 1, 1,
0.5660205, 0.5061376, 1.084952, 1, 1, 1, 1, 1,
0.5708887, -0.5932182, 3.537616, 1, 1, 1, 1, 1,
0.5795138, 0.1650452, 1.756139, 1, 1, 1, 1, 1,
0.5863465, 1.909425, 1.164332, 1, 1, 1, 1, 1,
0.587885, -0.7595259, 0.5253685, 1, 1, 1, 1, 1,
0.5923814, 0.8802907, 0.008440321, 1, 1, 1, 1, 1,
0.5925226, -0.5421889, 4.29125, 1, 1, 1, 1, 1,
0.5959092, 0.01744847, 1.842799, 1, 1, 1, 1, 1,
0.596055, 0.7089862, 0.15073, 1, 1, 1, 1, 1,
0.6095009, 0.8193157, -0.111585, 1, 1, 1, 1, 1,
0.6156031, -1.421988, 3.374568, 1, 1, 1, 1, 1,
0.6172526, 1.615603, 0.5300605, 1, 1, 1, 1, 1,
0.6177148, -0.2127256, 0.9356655, 1, 1, 1, 1, 1,
0.6198198, 0.2896136, 1.229079, 1, 1, 1, 1, 1,
0.6228144, -1.454078, 1.59674, 1, 1, 1, 1, 1,
0.6268453, -0.2338792, 2.709868, 0, 0, 1, 1, 1,
0.6309569, 0.02923538, 1.670915, 1, 0, 0, 1, 1,
0.6328859, 0.06397618, 1.054296, 1, 0, 0, 1, 1,
0.63447, -0.6366974, 1.194781, 1, 0, 0, 1, 1,
0.6361284, 0.4571672, 0.1087349, 1, 0, 0, 1, 1,
0.6408463, -1.435609, 2.489282, 1, 0, 0, 1, 1,
0.6413279, 0.4809485, -1.094687, 0, 0, 0, 1, 1,
0.6453317, -0.5722488, 2.783457, 0, 0, 0, 1, 1,
0.6470495, 1.036842, 0.5034911, 0, 0, 0, 1, 1,
0.6474125, 0.9148256, -0.2965869, 0, 0, 0, 1, 1,
0.6478983, -0.0210656, 0.8236308, 0, 0, 0, 1, 1,
0.6485794, 0.4001256, 0.2206666, 0, 0, 0, 1, 1,
0.6498913, 0.6988235, 1.760053, 0, 0, 0, 1, 1,
0.6539819, -0.4101952, 0.8110251, 1, 1, 1, 1, 1,
0.6550487, 0.9679778, 2.812587, 1, 1, 1, 1, 1,
0.6565623, -0.8332182, 2.787625, 1, 1, 1, 1, 1,
0.6587446, -2.143994, 3.564068, 1, 1, 1, 1, 1,
0.6624049, -0.3541868, 1.883193, 1, 1, 1, 1, 1,
0.6633043, -0.7301099, 5.196636, 1, 1, 1, 1, 1,
0.6697798, -0.2736434, 1.823579, 1, 1, 1, 1, 1,
0.6765222, -0.221541, 4.147005, 1, 1, 1, 1, 1,
0.6830603, 0.05465141, 0.730873, 1, 1, 1, 1, 1,
0.6947477, 0.409973, 0.4343148, 1, 1, 1, 1, 1,
0.6958417, -0.8028107, 1.861319, 1, 1, 1, 1, 1,
0.696545, 0.1776657, -0.9764537, 1, 1, 1, 1, 1,
0.6982434, 1.394716, -0.8948729, 1, 1, 1, 1, 1,
0.7019356, -0.4110839, 1.686472, 1, 1, 1, 1, 1,
0.7036579, -1.626993, 3.771383, 1, 1, 1, 1, 1,
0.7038274, -0.5662238, 2.450282, 0, 0, 1, 1, 1,
0.7078362, 0.2104957, 4.313212, 1, 0, 0, 1, 1,
0.7126296, 1.337329, -0.1917863, 1, 0, 0, 1, 1,
0.7195353, 1.002254, 0.1346528, 1, 0, 0, 1, 1,
0.7205371, -0.7686456, 2.376462, 1, 0, 0, 1, 1,
0.722128, -0.9525818, 1.850624, 1, 0, 0, 1, 1,
0.725908, -2.318379, 4.704648, 0, 0, 0, 1, 1,
0.7286764, -1.747893, 1.750003, 0, 0, 0, 1, 1,
0.7294723, 2.300975, 0.4098616, 0, 0, 0, 1, 1,
0.730076, 1.119748, 0.6067377, 0, 0, 0, 1, 1,
0.7318668, 0.2295894, 2.061777, 0, 0, 0, 1, 1,
0.7340468, 0.6625636, 2.043783, 0, 0, 0, 1, 1,
0.7353979, -1.598477, 4.342194, 0, 0, 0, 1, 1,
0.7414578, 0.5006517, -0.08317237, 1, 1, 1, 1, 1,
0.7466217, -0.6788408, 2.810287, 1, 1, 1, 1, 1,
0.7475976, 1.440586, -0.03801103, 1, 1, 1, 1, 1,
0.7485847, -0.3405868, 2.943028, 1, 1, 1, 1, 1,
0.7497076, -0.1723241, 0.8959406, 1, 1, 1, 1, 1,
0.7516429, -0.3044595, 2.090514, 1, 1, 1, 1, 1,
0.7578743, -0.1682068, 2.609311, 1, 1, 1, 1, 1,
0.7585259, 0.8937972, -0.9579215, 1, 1, 1, 1, 1,
0.7660922, 0.4853052, 0.492138, 1, 1, 1, 1, 1,
0.7708899, 1.240968, 0.8653032, 1, 1, 1, 1, 1,
0.7737129, -1.804746, 2.398545, 1, 1, 1, 1, 1,
0.7742783, 0.4585114, 1.258207, 1, 1, 1, 1, 1,
0.7743928, 0.005135848, 2.636689, 1, 1, 1, 1, 1,
0.7749867, 1.30648, -0.4156659, 1, 1, 1, 1, 1,
0.7759357, 1.389482, 1.23134, 1, 1, 1, 1, 1,
0.777594, -0.8442206, 0.9528143, 0, 0, 1, 1, 1,
0.7784986, -1.496422, 2.485986, 1, 0, 0, 1, 1,
0.7811634, 0.7643828, 0.4330465, 1, 0, 0, 1, 1,
0.7984114, -0.7230044, 2.681365, 1, 0, 0, 1, 1,
0.8006892, 0.810819, -0.01663104, 1, 0, 0, 1, 1,
0.803821, 0.04768375, 0.7445405, 1, 0, 0, 1, 1,
0.8238137, 0.9905066, 1.710623, 0, 0, 0, 1, 1,
0.8243886, 1.069271, 0.6450148, 0, 0, 0, 1, 1,
0.8253897, 0.1851119, 0.3421857, 0, 0, 0, 1, 1,
0.8286296, 0.6037874, -0.2991057, 0, 0, 0, 1, 1,
0.8286542, -0.6121536, 1.545415, 0, 0, 0, 1, 1,
0.8314967, -0.2106317, 2.130404, 0, 0, 0, 1, 1,
0.8346351, 1.552653, 0.1251852, 0, 0, 0, 1, 1,
0.8366477, -0.7258286, 3.355381, 1, 1, 1, 1, 1,
0.8383037, -0.2305252, 0.7256927, 1, 1, 1, 1, 1,
0.8391419, 1.42081, 1.025729, 1, 1, 1, 1, 1,
0.8464567, 0.956465, 1.870691, 1, 1, 1, 1, 1,
0.8545343, 0.08580216, 0.3049959, 1, 1, 1, 1, 1,
0.8560293, -1.13816, 4.957438, 1, 1, 1, 1, 1,
0.8569425, -0.4256567, 2.533027, 1, 1, 1, 1, 1,
0.857259, -0.1931368, -1.025176, 1, 1, 1, 1, 1,
0.8650495, 1.187981, -0.05397439, 1, 1, 1, 1, 1,
0.8686877, 0.2519163, 0.7118253, 1, 1, 1, 1, 1,
0.8741928, 0.01588775, 1.510376, 1, 1, 1, 1, 1,
0.8788666, 0.5527164, 1.60105, 1, 1, 1, 1, 1,
0.8788823, 0.06087647, 3.488215, 1, 1, 1, 1, 1,
0.8804988, 0.2008574, 2.840195, 1, 1, 1, 1, 1,
0.8877876, 0.5294334, 0.866078, 1, 1, 1, 1, 1,
0.8897861, 0.7132171, 0.1817243, 0, 0, 1, 1, 1,
0.8906975, -0.7301862, 2.254007, 1, 0, 0, 1, 1,
0.8946658, 0.3244417, 1.752474, 1, 0, 0, 1, 1,
0.9020039, -0.4483776, 3.289236, 1, 0, 0, 1, 1,
0.9038231, -0.2628601, 0.5523829, 1, 0, 0, 1, 1,
0.9047247, -0.9452161, 3.534475, 1, 0, 0, 1, 1,
0.9116812, 0.3067061, 2.408811, 0, 0, 0, 1, 1,
0.917915, 1.371178, 1.589359, 0, 0, 0, 1, 1,
0.9209416, -0.9430417, 3.273658, 0, 0, 0, 1, 1,
0.93085, -0.268299, 0.7031115, 0, 0, 0, 1, 1,
0.9319443, -0.3504321, 1.573159, 0, 0, 0, 1, 1,
0.9321625, -0.3708852, 1.464615, 0, 0, 0, 1, 1,
0.9344536, 0.3021671, -0.003095224, 0, 0, 0, 1, 1,
0.9417914, 0.2922672, 1.788325, 1, 1, 1, 1, 1,
0.9532807, -1.145076, 1.908104, 1, 1, 1, 1, 1,
0.9541704, 0.8141706, 1.009948, 1, 1, 1, 1, 1,
0.9591146, -0.957368, 1.284413, 1, 1, 1, 1, 1,
0.95989, 0.6401842, -1.452357, 1, 1, 1, 1, 1,
0.9619149, 0.2023249, 1.872214, 1, 1, 1, 1, 1,
0.961943, -1.243382, 1.360184, 1, 1, 1, 1, 1,
0.9642882, -1.361232, 3.636921, 1, 1, 1, 1, 1,
0.9813551, -0.1671796, 2.557334, 1, 1, 1, 1, 1,
0.9855779, -0.9697339, 2.667735, 1, 1, 1, 1, 1,
0.9917341, -0.3030261, 1.708708, 1, 1, 1, 1, 1,
0.992236, -0.2565331, 2.913005, 1, 1, 1, 1, 1,
0.9959539, 0.9765642, 0.7593479, 1, 1, 1, 1, 1,
0.996554, -1.123995, 2.736701, 1, 1, 1, 1, 1,
1.001638, -0.4140424, 3.19405, 1, 1, 1, 1, 1,
1.008647, -0.5124317, 3.83679, 0, 0, 1, 1, 1,
1.012802, 2.40509, -1.365533, 1, 0, 0, 1, 1,
1.016811, -1.147221, 2.635698, 1, 0, 0, 1, 1,
1.025194, 2.31086, 0.686825, 1, 0, 0, 1, 1,
1.028797, 1.737382, 0.09225859, 1, 0, 0, 1, 1,
1.030242, -0.05949035, 1.589983, 1, 0, 0, 1, 1,
1.030867, -0.7922918, 2.139545, 0, 0, 0, 1, 1,
1.03624, 0.4739806, 0.9748209, 0, 0, 0, 1, 1,
1.0387, 1.872007, 0.4242425, 0, 0, 0, 1, 1,
1.04651, 1.172274, 1.798819, 0, 0, 0, 1, 1,
1.056819, 0.5790269, 1.516006, 0, 0, 0, 1, 1,
1.063452, -0.3267428, 3.418444, 0, 0, 0, 1, 1,
1.067229, -0.3583354, 2.51506, 0, 0, 0, 1, 1,
1.073227, 1.372777, 0.03570113, 1, 1, 1, 1, 1,
1.088349, 0.6655621, 0.3373221, 1, 1, 1, 1, 1,
1.09049, -0.6146168, 1.855959, 1, 1, 1, 1, 1,
1.095245, 0.9096698, 1.824716, 1, 1, 1, 1, 1,
1.096925, -0.3454796, 2.882125, 1, 1, 1, 1, 1,
1.101272, -0.03437424, 1.934762, 1, 1, 1, 1, 1,
1.111705, 0.1405552, 2.326691, 1, 1, 1, 1, 1,
1.1151, -1.927599, 3.300275, 1, 1, 1, 1, 1,
1.117119, -0.5953118, 1.491508, 1, 1, 1, 1, 1,
1.120799, -1.522732, 1.603563, 1, 1, 1, 1, 1,
1.122069, 0.09456887, 1.040256, 1, 1, 1, 1, 1,
1.122265, -0.4375615, 0.8045998, 1, 1, 1, 1, 1,
1.123994, -0.00671638, 1.821765, 1, 1, 1, 1, 1,
1.125685, -2.256459, 3.292813, 1, 1, 1, 1, 1,
1.139583, -0.1317634, 1.296224, 1, 1, 1, 1, 1,
1.146786, 0.4329511, 1.315891, 0, 0, 1, 1, 1,
1.149876, -0.6507626, 2.20686, 1, 0, 0, 1, 1,
1.151187, -0.3990472, 2.567299, 1, 0, 0, 1, 1,
1.151403, 0.3406168, 1.359865, 1, 0, 0, 1, 1,
1.154411, -0.654216, 1.614998, 1, 0, 0, 1, 1,
1.16949, -0.02880947, -0.4837118, 1, 0, 0, 1, 1,
1.176321, 1.394538, 0.6177239, 0, 0, 0, 1, 1,
1.192037, -0.1052341, 0.7944679, 0, 0, 0, 1, 1,
1.201378, 0.3956876, 2.303244, 0, 0, 0, 1, 1,
1.208215, -1.887023, 3.670961, 0, 0, 0, 1, 1,
1.209858, 0.2311111, 1.679755, 0, 0, 0, 1, 1,
1.21042, 1.126457, 0.6395394, 0, 0, 0, 1, 1,
1.211805, 0.3111448, 1.447728, 0, 0, 0, 1, 1,
1.215017, -1.330914, 2.129837, 1, 1, 1, 1, 1,
1.232186, 1.168438, -0.2987322, 1, 1, 1, 1, 1,
1.232796, -0.9339277, 5.06518, 1, 1, 1, 1, 1,
1.237388, 1.017859, 1.22251, 1, 1, 1, 1, 1,
1.24066, -1.274647, 2.951922, 1, 1, 1, 1, 1,
1.243525, -0.1231995, 1.578366, 1, 1, 1, 1, 1,
1.251169, 1.74235, 0.4327766, 1, 1, 1, 1, 1,
1.253433, 0.3842609, 1.286079, 1, 1, 1, 1, 1,
1.25658, -0.5293447, 2.687158, 1, 1, 1, 1, 1,
1.26665, -0.5724106, 3.26592, 1, 1, 1, 1, 1,
1.267668, 1.460652, 1.395502, 1, 1, 1, 1, 1,
1.271605, 0.02594648, 1.742206, 1, 1, 1, 1, 1,
1.273855, 0.7083021, 0.8152999, 1, 1, 1, 1, 1,
1.279426, -0.3024417, 1.952285, 1, 1, 1, 1, 1,
1.291341, 0.7035463, 0.6373982, 1, 1, 1, 1, 1,
1.294299, 2.046477, 0.9501292, 0, 0, 1, 1, 1,
1.296532, 0.003231171, 0.9289368, 1, 0, 0, 1, 1,
1.296609, -0.01319422, 1.044913, 1, 0, 0, 1, 1,
1.301659, 0.07628451, 0.1598409, 1, 0, 0, 1, 1,
1.329581, 0.8845699, -0.09194647, 1, 0, 0, 1, 1,
1.350876, 0.281755, 1.303853, 1, 0, 0, 1, 1,
1.356738, -0.2906652, 3.138417, 0, 0, 0, 1, 1,
1.358871, -0.07675935, 0.659, 0, 0, 0, 1, 1,
1.359089, -1.613452, 3.265794, 0, 0, 0, 1, 1,
1.363029, 0.1043686, 0.9056947, 0, 0, 0, 1, 1,
1.365723, 1.092761, 1.594187, 0, 0, 0, 1, 1,
1.367247, 0.08552378, 1.209701, 0, 0, 0, 1, 1,
1.36805, -0.839724, 3.068308, 0, 0, 0, 1, 1,
1.381239, 0.8585387, 2.317602, 1, 1, 1, 1, 1,
1.391529, 0.8343526, -0.5457308, 1, 1, 1, 1, 1,
1.392341, -0.2487046, 0.7982635, 1, 1, 1, 1, 1,
1.396694, -1.010038, 0.5219618, 1, 1, 1, 1, 1,
1.400699, 0.5229825, 1.580009, 1, 1, 1, 1, 1,
1.408844, -1.177915, 3.437141, 1, 1, 1, 1, 1,
1.412369, -0.2828889, 0.8928281, 1, 1, 1, 1, 1,
1.415664, 0.1293872, 0.8964588, 1, 1, 1, 1, 1,
1.427963, 0.5945531, -0.2939927, 1, 1, 1, 1, 1,
1.43123, 0.3580233, 0.288067, 1, 1, 1, 1, 1,
1.435244, 0.9707463, 2.12683, 1, 1, 1, 1, 1,
1.440302, 0.4315878, 3.964831, 1, 1, 1, 1, 1,
1.440705, -0.02783093, 1.881628, 1, 1, 1, 1, 1,
1.441976, -0.8619354, 2.328986, 1, 1, 1, 1, 1,
1.444881, -1.665817, 1.343641, 1, 1, 1, 1, 1,
1.451183, 0.06345581, 2.399128, 0, 0, 1, 1, 1,
1.485742, -0.338582, 2.281723, 1, 0, 0, 1, 1,
1.491905, -1.244037, 3.467585, 1, 0, 0, 1, 1,
1.502962, -0.8811561, 0.9927686, 1, 0, 0, 1, 1,
1.507455, 0.4206998, 0.2925484, 1, 0, 0, 1, 1,
1.517232, 0.2356728, 0.4021735, 1, 0, 0, 1, 1,
1.519541, -0.1732355, 3.072233, 0, 0, 0, 1, 1,
1.528551, -1.803443, 1.731471, 0, 0, 0, 1, 1,
1.529198, 0.5275429, 0.4348109, 0, 0, 0, 1, 1,
1.545148, -0.3630607, 2.471585, 0, 0, 0, 1, 1,
1.585947, -0.01686106, 1.961842, 0, 0, 0, 1, 1,
1.589386, -0.82724, 3.198897, 0, 0, 0, 1, 1,
1.59025, 0.6449184, 0.6158602, 0, 0, 0, 1, 1,
1.593207, 0.05023699, 2.739402, 1, 1, 1, 1, 1,
1.609039, 0.3864533, 1.068959, 1, 1, 1, 1, 1,
1.632021, -0.113188, 1.987911, 1, 1, 1, 1, 1,
1.635528, -0.7179604, 1.511311, 1, 1, 1, 1, 1,
1.638325, 0.7457241, 1.134619, 1, 1, 1, 1, 1,
1.647971, -2.610816, 2.438289, 1, 1, 1, 1, 1,
1.654916, -1.452503, 1.510581, 1, 1, 1, 1, 1,
1.656005, -1.067006, 2.068608, 1, 1, 1, 1, 1,
1.658171, 0.111975, 1.651582, 1, 1, 1, 1, 1,
1.662528, -0.3026324, 1.813221, 1, 1, 1, 1, 1,
1.663067, 1.638731, 0.4674031, 1, 1, 1, 1, 1,
1.667852, 0.4883811, 1.549783, 1, 1, 1, 1, 1,
1.669051, 0.8337892, 1.586491, 1, 1, 1, 1, 1,
1.681708, -0.2705853, 1.823483, 1, 1, 1, 1, 1,
1.698727, -0.9165276, 1.896968, 1, 1, 1, 1, 1,
1.703439, -0.9842171, 2.095557, 0, 0, 1, 1, 1,
1.709781, -0.4966481, 1.038876, 1, 0, 0, 1, 1,
1.71913, -0.702308, 1.559417, 1, 0, 0, 1, 1,
1.720769, 0.125911, 1.039802, 1, 0, 0, 1, 1,
1.730478, -0.3144345, 1.723992, 1, 0, 0, 1, 1,
1.739656, -0.4800505, 0.5253228, 1, 0, 0, 1, 1,
1.750128, -1.421739, 3.360072, 0, 0, 0, 1, 1,
1.755067, 0.6044826, 2.12065, 0, 0, 0, 1, 1,
1.762249, 0.007961293, 3.46542, 0, 0, 0, 1, 1,
1.765894, -0.8678776, 2.208035, 0, 0, 0, 1, 1,
1.768464, -0.6284706, 0.9480695, 0, 0, 0, 1, 1,
1.789688, 0.5198066, 0.9986708, 0, 0, 0, 1, 1,
1.802794, -1.932841, 0.4790584, 0, 0, 0, 1, 1,
1.814209, -0.05265256, 2.420103, 1, 1, 1, 1, 1,
1.82011, 2.687133, 1.549729, 1, 1, 1, 1, 1,
1.820347, -0.4059614, 3.367198, 1, 1, 1, 1, 1,
1.836948, -0.9313649, 2.759438, 1, 1, 1, 1, 1,
1.853963, -0.7996891, 1.782999, 1, 1, 1, 1, 1,
1.890103, -0.2326451, 2.265678, 1, 1, 1, 1, 1,
1.903933, -2.766559, 1.86857, 1, 1, 1, 1, 1,
1.913195, 2.756124, 1.268885, 1, 1, 1, 1, 1,
1.917947, 0.9288881, -0.2513344, 1, 1, 1, 1, 1,
1.942995, -2.049564, 2.623869, 1, 1, 1, 1, 1,
1.943025, -1.250327, 1.204203, 1, 1, 1, 1, 1,
1.967218, 0.174916, 2.684306, 1, 1, 1, 1, 1,
1.969012, -0.3597364, 3.039243, 1, 1, 1, 1, 1,
2.028286, 2.160007, 2.373461, 1, 1, 1, 1, 1,
2.035794, -0.3704954, 0.6071369, 1, 1, 1, 1, 1,
2.047654, -0.09676299, 0.8915113, 0, 0, 1, 1, 1,
2.051107, 0.2533067, 0.4867148, 1, 0, 0, 1, 1,
2.089415, -0.09327149, 0.1541675, 1, 0, 0, 1, 1,
2.141753, 1.094461, 2.783285, 1, 0, 0, 1, 1,
2.222787, -0.4734458, 2.945007, 1, 0, 0, 1, 1,
2.240003, 0.602257, 1.901985, 1, 0, 0, 1, 1,
2.260713, -0.9978073, 0.5726497, 0, 0, 0, 1, 1,
2.270646, -0.2407688, 0.9059456, 0, 0, 0, 1, 1,
2.400908, -1.493076, 1.801239, 0, 0, 0, 1, 1,
2.425514, -1.337164, 1.840502, 0, 0, 0, 1, 1,
2.452314, -0.07312071, 0.9711453, 0, 0, 0, 1, 1,
2.510295, 0.1961786, 0.422828, 0, 0, 0, 1, 1,
2.559401, 0.08545932, 2.695808, 0, 0, 0, 1, 1,
2.628682, 0.2527558, 0.9652197, 1, 1, 1, 1, 1,
2.639189, 0.3969873, 0.935052, 1, 1, 1, 1, 1,
2.728106, 0.8288332, 1.439954, 1, 1, 1, 1, 1,
2.82911, 2.097469, 1.435998, 1, 1, 1, 1, 1,
2.96685, -1.018141, 1.052011, 1, 1, 1, 1, 1,
2.97308, -1.21602, 2.985686, 1, 1, 1, 1, 1,
3.05485, 0.7794575, 3.246526, 1, 1, 1, 1, 1
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
var radius = 9.68867;
var distance = 34.03104;
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
mvMatrix.translate( 0.0372715, 0.1836685, 0.04441309 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.03104);
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
