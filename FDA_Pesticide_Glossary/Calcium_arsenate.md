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
-3.595478, 1.219755, -0.5438059, 1, 0, 0, 1,
-2.718431, -3.643973, -2.702894, 1, 0.007843138, 0, 1,
-2.591275, 1.088254, -0.9876145, 1, 0.01176471, 0, 1,
-2.467406, 0.5481725, -1.086791, 1, 0.01960784, 0, 1,
-2.461507, 0.6625715, -1.224026, 1, 0.02352941, 0, 1,
-2.461136, -0.9019304, -3.381471, 1, 0.03137255, 0, 1,
-2.393703, -0.951009, -0.9552064, 1, 0.03529412, 0, 1,
-2.387213, -0.7401173, -1.484553, 1, 0.04313726, 0, 1,
-2.343565, -1.294048, -3.210564, 1, 0.04705882, 0, 1,
-2.316857, -0.8965503, -1.544584, 1, 0.05490196, 0, 1,
-2.24752, -0.5132203, -1.312983, 1, 0.05882353, 0, 1,
-2.229296, 0.5364805, -2.966359, 1, 0.06666667, 0, 1,
-2.228276, 0.6947495, -0.3849258, 1, 0.07058824, 0, 1,
-2.192362, -0.697938, -3.864826, 1, 0.07843138, 0, 1,
-2.169667, 0.03204598, -1.947564, 1, 0.08235294, 0, 1,
-2.12242, 0.3179775, -1.895755, 1, 0.09019608, 0, 1,
-1.999476, 0.9958693, -0.4974843, 1, 0.09411765, 0, 1,
-1.992325, -1.099875, -2.950826, 1, 0.1019608, 0, 1,
-1.977779, -0.7274195, -1.661209, 1, 0.1098039, 0, 1,
-1.950186, -0.417304, -1.807237, 1, 0.1137255, 0, 1,
-1.945547, -0.3976537, -2.080997, 1, 0.1215686, 0, 1,
-1.910369, -1.083185, -1.999472, 1, 0.1254902, 0, 1,
-1.900355, 0.7248543, -0.3996834, 1, 0.1333333, 0, 1,
-1.853084, 0.7503077, -1.395333, 1, 0.1372549, 0, 1,
-1.845302, 0.5793866, -0.9975235, 1, 0.145098, 0, 1,
-1.796373, -0.8591375, -2.717471, 1, 0.1490196, 0, 1,
-1.782108, -1.39716, -3.277884, 1, 0.1568628, 0, 1,
-1.762633, -0.1460253, -1.378452, 1, 0.1607843, 0, 1,
-1.718503, -1.278273, -0.3644084, 1, 0.1686275, 0, 1,
-1.697857, -0.4493909, -2.988769, 1, 0.172549, 0, 1,
-1.691979, -1.804764, -1.457534, 1, 0.1803922, 0, 1,
-1.686472, -0.09124334, -1.414814, 1, 0.1843137, 0, 1,
-1.685624, -0.4839933, -3.301052, 1, 0.1921569, 0, 1,
-1.678281, 0.9575263, -1.496691, 1, 0.1960784, 0, 1,
-1.675362, -1.008704, -2.427443, 1, 0.2039216, 0, 1,
-1.666926, -0.4958824, -2.096853, 1, 0.2117647, 0, 1,
-1.656766, -0.0003473235, -1.686023, 1, 0.2156863, 0, 1,
-1.649816, -0.05514212, -2.036483, 1, 0.2235294, 0, 1,
-1.633384, 0.1023881, -0.03880867, 1, 0.227451, 0, 1,
-1.613286, -1.040535, -3.339212, 1, 0.2352941, 0, 1,
-1.605978, 0.6492513, -0.6313854, 1, 0.2392157, 0, 1,
-1.591872, 0.7176164, -0.9218634, 1, 0.2470588, 0, 1,
-1.57734, -0.7514562, -1.908565, 1, 0.2509804, 0, 1,
-1.573321, -2.005524, -1.739575, 1, 0.2588235, 0, 1,
-1.525079, -1.11538, -4.862833, 1, 0.2627451, 0, 1,
-1.51455, -1.50586, -1.683634, 1, 0.2705882, 0, 1,
-1.507551, -0.9478328, -3.580322, 1, 0.2745098, 0, 1,
-1.507275, -2.30428, -3.540622, 1, 0.282353, 0, 1,
-1.48949, -0.6758384, -1.362593, 1, 0.2862745, 0, 1,
-1.489468, -0.3539499, -3.06716, 1, 0.2941177, 0, 1,
-1.477061, -0.1813999, -0.9408444, 1, 0.3019608, 0, 1,
-1.468089, -0.2926781, -2.509385, 1, 0.3058824, 0, 1,
-1.441812, -0.2447942, -3.274086, 1, 0.3137255, 0, 1,
-1.430084, -0.5900757, -0.8456182, 1, 0.3176471, 0, 1,
-1.428179, -0.05441298, -1.926938, 1, 0.3254902, 0, 1,
-1.418766, 0.2028946, -0.4680435, 1, 0.3294118, 0, 1,
-1.402582, -1.862189, -4.197094, 1, 0.3372549, 0, 1,
-1.400298, -1.108236, -2.382774, 1, 0.3411765, 0, 1,
-1.395439, 0.1224273, -0.3013006, 1, 0.3490196, 0, 1,
-1.388362, -0.03280856, -0.8333851, 1, 0.3529412, 0, 1,
-1.385779, 1.056833, -0.2571234, 1, 0.3607843, 0, 1,
-1.374993, 1.245329, -2.239803, 1, 0.3647059, 0, 1,
-1.37307, 0.212666, -0.3589418, 1, 0.372549, 0, 1,
-1.364896, -1.514528, -2.570894, 1, 0.3764706, 0, 1,
-1.360005, 0.9146624, 0.8226892, 1, 0.3843137, 0, 1,
-1.356718, 1.072421, -2.636939, 1, 0.3882353, 0, 1,
-1.349961, -0.02749889, -0.07136524, 1, 0.3960784, 0, 1,
-1.349432, 0.5593274, -0.07752769, 1, 0.4039216, 0, 1,
-1.345064, 1.173584, 0.03503275, 1, 0.4078431, 0, 1,
-1.339017, -0.4047479, -3.175548, 1, 0.4156863, 0, 1,
-1.338478, 0.4288004, -2.077789, 1, 0.4196078, 0, 1,
-1.335562, 0.5056857, -1.809502, 1, 0.427451, 0, 1,
-1.326788, 2.041032, -2.127075, 1, 0.4313726, 0, 1,
-1.323498, 0.7424991, -1.161613, 1, 0.4392157, 0, 1,
-1.316005, 0.7367169, 0.00944468, 1, 0.4431373, 0, 1,
-1.314471, 0.2529398, -2.500798, 1, 0.4509804, 0, 1,
-1.310058, -0.2476431, -1.930548, 1, 0.454902, 0, 1,
-1.308005, -1.36149, -3.516079, 1, 0.4627451, 0, 1,
-1.298413, 0.6019563, -2.030888, 1, 0.4666667, 0, 1,
-1.295289, 1.630208, 0.3669157, 1, 0.4745098, 0, 1,
-1.292657, 1.229265, 0.0939621, 1, 0.4784314, 0, 1,
-1.290133, 0.9579682, -0.4150233, 1, 0.4862745, 0, 1,
-1.28503, 0.007682153, -2.898427, 1, 0.4901961, 0, 1,
-1.265834, 0.5678532, -0.1473381, 1, 0.4980392, 0, 1,
-1.262957, 1.389435, -2.827474, 1, 0.5058824, 0, 1,
-1.257193, 0.8733786, -0.3295839, 1, 0.509804, 0, 1,
-1.238172, 0.5917566, -1.730233, 1, 0.5176471, 0, 1,
-1.233911, 0.2413812, -0.8065496, 1, 0.5215687, 0, 1,
-1.232152, 0.8060287, -0.7783648, 1, 0.5294118, 0, 1,
-1.229089, -0.440328, -1.60961, 1, 0.5333334, 0, 1,
-1.225557, 0.333112, -0.9360401, 1, 0.5411765, 0, 1,
-1.223921, -0.9550491, -0.7151283, 1, 0.5450981, 0, 1,
-1.174842, 1.376677, 0.0288813, 1, 0.5529412, 0, 1,
-1.172472, -0.08101963, -2.378169, 1, 0.5568628, 0, 1,
-1.171762, -1.154152, -1.594384, 1, 0.5647059, 0, 1,
-1.167314, 0.3407799, -0.8711201, 1, 0.5686275, 0, 1,
-1.164921, 0.5629091, -0.2345137, 1, 0.5764706, 0, 1,
-1.163982, -0.745759, -2.596923, 1, 0.5803922, 0, 1,
-1.160248, 0.1524995, -2.574192, 1, 0.5882353, 0, 1,
-1.15872, 1.011767, -1.753751, 1, 0.5921569, 0, 1,
-1.158516, 0.4886747, -1.028811, 1, 0.6, 0, 1,
-1.157248, -0.1046842, -1.6957, 1, 0.6078432, 0, 1,
-1.156276, -2.082153, -5.119245, 1, 0.6117647, 0, 1,
-1.154499, -0.4593037, -3.153475, 1, 0.6196079, 0, 1,
-1.141198, 1.692577, -0.8589298, 1, 0.6235294, 0, 1,
-1.141023, 0.3932039, -0.6427203, 1, 0.6313726, 0, 1,
-1.137267, 0.03824594, -1.636648, 1, 0.6352941, 0, 1,
-1.114075, -0.2653244, -3.028642, 1, 0.6431373, 0, 1,
-1.108093, 0.595157, -0.320911, 1, 0.6470588, 0, 1,
-1.1067, -0.3324206, -2.335855, 1, 0.654902, 0, 1,
-1.105571, 0.1864352, -0.9589839, 1, 0.6588235, 0, 1,
-1.105119, 0.9160048, -1.211273, 1, 0.6666667, 0, 1,
-1.0979, -0.6092743, -2.986379, 1, 0.6705883, 0, 1,
-1.089824, -0.6977689, -3.535765, 1, 0.6784314, 0, 1,
-1.08541, 0.8018693, -1.323398, 1, 0.682353, 0, 1,
-1.083257, 0.1067497, -2.180622, 1, 0.6901961, 0, 1,
-1.082021, -0.4253275, -3.788291, 1, 0.6941177, 0, 1,
-1.079434, -0.4224767, -2.162063, 1, 0.7019608, 0, 1,
-1.073915, -1.220729, -2.590721, 1, 0.7098039, 0, 1,
-1.068067, 0.9431561, -2.355006, 1, 0.7137255, 0, 1,
-1.066889, -1.62369, -2.499356, 1, 0.7215686, 0, 1,
-1.062923, 1.162116, -0.3647046, 1, 0.7254902, 0, 1,
-1.046216, -0.8666781, -1.81191, 1, 0.7333333, 0, 1,
-1.046106, 0.649774, 0.01105305, 1, 0.7372549, 0, 1,
-1.040579, 0.1263378, -0.8883105, 1, 0.7450981, 0, 1,
-1.033302, -1.050021, -1.52658, 1, 0.7490196, 0, 1,
-1.033143, -1.111007, -0.6585451, 1, 0.7568628, 0, 1,
-1.030206, -1.375104, -2.342468, 1, 0.7607843, 0, 1,
-1.027063, 0.7208288, -0.2380978, 1, 0.7686275, 0, 1,
-1.025507, 0.01556823, -1.12535, 1, 0.772549, 0, 1,
-1.025114, 0.5778449, -1.431721, 1, 0.7803922, 0, 1,
-1.016785, -3.359855, -2.535841, 1, 0.7843137, 0, 1,
-1.015741, 0.8152215, -0.2121027, 1, 0.7921569, 0, 1,
-1.013619, 0.6693206, -2.463768, 1, 0.7960784, 0, 1,
-1.010123, 0.02792395, -0.5457215, 1, 0.8039216, 0, 1,
-1.007797, 1.220157, -2.421527, 1, 0.8117647, 0, 1,
-0.9939376, -1.015527, -4.643232, 1, 0.8156863, 0, 1,
-0.9862733, 0.539881, -0.7645448, 1, 0.8235294, 0, 1,
-0.9837742, -0.8114608, -3.292329, 1, 0.827451, 0, 1,
-0.9813678, -0.886038, -3.284181, 1, 0.8352941, 0, 1,
-0.9785528, -0.2018087, 0.1418836, 1, 0.8392157, 0, 1,
-0.9779107, 0.1450893, -1.965436, 1, 0.8470588, 0, 1,
-0.9776165, 1.553709, -1.041689, 1, 0.8509804, 0, 1,
-0.9775543, -0.9616453, -1.680211, 1, 0.8588235, 0, 1,
-0.9763194, -0.4495697, -1.725787, 1, 0.8627451, 0, 1,
-0.9717784, 0.8255937, -0.7678728, 1, 0.8705882, 0, 1,
-0.9685418, 1.301678, -1.772868, 1, 0.8745098, 0, 1,
-0.9603938, -0.6564624, -2.049483, 1, 0.8823529, 0, 1,
-0.9591955, -1.628476, -2.03947, 1, 0.8862745, 0, 1,
-0.9552594, 0.5424484, -0.9832996, 1, 0.8941177, 0, 1,
-0.9547155, -0.474239, 0.9098727, 1, 0.8980392, 0, 1,
-0.9538614, 0.4554933, -1.365933, 1, 0.9058824, 0, 1,
-0.9362449, -0.1421255, -2.206845, 1, 0.9137255, 0, 1,
-0.9350928, -2.434003, -2.271555, 1, 0.9176471, 0, 1,
-0.9345394, -1.149365, -2.196205, 1, 0.9254902, 0, 1,
-0.930434, 1.461047, -0.4254509, 1, 0.9294118, 0, 1,
-0.928219, 0.08431769, -2.161608, 1, 0.9372549, 0, 1,
-0.9274594, -1.243186, -2.343775, 1, 0.9411765, 0, 1,
-0.9122102, -0.8004797, -2.599614, 1, 0.9490196, 0, 1,
-0.9079055, 1.273597, -1.545966, 1, 0.9529412, 0, 1,
-0.9065902, -0.4936222, -2.459703, 1, 0.9607843, 0, 1,
-0.9062786, 0.9462775, -1.771853, 1, 0.9647059, 0, 1,
-0.8900132, -1.418502, -2.309727, 1, 0.972549, 0, 1,
-0.887233, 0.6047593, -1.403752, 1, 0.9764706, 0, 1,
-0.8795991, -1.939899, -2.394988, 1, 0.9843137, 0, 1,
-0.8781688, 0.01278106, -3.319212, 1, 0.9882353, 0, 1,
-0.8769035, -1.716484, -2.095478, 1, 0.9960784, 0, 1,
-0.8762765, -0.4209207, -0.131074, 0.9960784, 1, 0, 1,
-0.874376, -0.2589346, -0.6965192, 0.9921569, 1, 0, 1,
-0.8698514, 1.648081, -0.0002532427, 0.9843137, 1, 0, 1,
-0.8673756, 0.4691541, -0.8460698, 0.9803922, 1, 0, 1,
-0.860073, -1.526401, -1.361658, 0.972549, 1, 0, 1,
-0.8575767, -1.100823, -1.754634, 0.9686275, 1, 0, 1,
-0.8476635, 1.092974, -2.684958, 0.9607843, 1, 0, 1,
-0.8357149, 0.7605897, -1.013851, 0.9568627, 1, 0, 1,
-0.8327616, 0.1175292, -2.101609, 0.9490196, 1, 0, 1,
-0.8303539, 1.147511, -1.849525, 0.945098, 1, 0, 1,
-0.8254733, 0.7155702, -2.591292, 0.9372549, 1, 0, 1,
-0.8239177, -0.08454347, -1.190233, 0.9333333, 1, 0, 1,
-0.8211991, -0.816586, -2.874226, 0.9254902, 1, 0, 1,
-0.8205884, -0.713016, -3.028053, 0.9215686, 1, 0, 1,
-0.8204557, -0.62878, -4.716641, 0.9137255, 1, 0, 1,
-0.8199146, -0.522238, -1.627394, 0.9098039, 1, 0, 1,
-0.8181781, -0.9591519, -1.71592, 0.9019608, 1, 0, 1,
-0.8091872, -1.404789, -2.953989, 0.8941177, 1, 0, 1,
-0.8081574, 0.7994568, -1.539542, 0.8901961, 1, 0, 1,
-0.8030989, 0.9159597, -0.9209653, 0.8823529, 1, 0, 1,
-0.8001463, -1.393359, -1.616466, 0.8784314, 1, 0, 1,
-0.7981347, -0.8352812, -2.484079, 0.8705882, 1, 0, 1,
-0.7978201, 0.06920701, -1.866984, 0.8666667, 1, 0, 1,
-0.7890535, -2.098843, -3.09904, 0.8588235, 1, 0, 1,
-0.7869194, -0.03003886, -1.961269, 0.854902, 1, 0, 1,
-0.781691, 0.4432208, -0.2165893, 0.8470588, 1, 0, 1,
-0.7795808, 0.4663569, -1.201472, 0.8431373, 1, 0, 1,
-0.777835, -0.4537306, -1.859427, 0.8352941, 1, 0, 1,
-0.7778163, -0.5047825, -4.661044, 0.8313726, 1, 0, 1,
-0.7681694, -0.4030359, -0.06596944, 0.8235294, 1, 0, 1,
-0.7662506, 1.714943, 0.1838338, 0.8196079, 1, 0, 1,
-0.764792, 1.509609, -0.04610259, 0.8117647, 1, 0, 1,
-0.7596511, -0.9481002, -2.72343, 0.8078431, 1, 0, 1,
-0.7517099, -1.916153, -2.402276, 0.8, 1, 0, 1,
-0.7501496, -0.8990076, -3.331383, 0.7921569, 1, 0, 1,
-0.7491651, 1.065993, -0.667907, 0.7882353, 1, 0, 1,
-0.7467164, 0.1759918, 0.01048801, 0.7803922, 1, 0, 1,
-0.7368104, 0.5499893, -0.08512516, 0.7764706, 1, 0, 1,
-0.7331756, 0.8896149, -0.563623, 0.7686275, 1, 0, 1,
-0.7317768, -0.09454188, -0.1747793, 0.7647059, 1, 0, 1,
-0.7313245, 0.7731155, 0.6433356, 0.7568628, 1, 0, 1,
-0.7273123, 1.357996, -1.164501, 0.7529412, 1, 0, 1,
-0.7229533, 0.2361713, -1.639939, 0.7450981, 1, 0, 1,
-0.7132475, -1.64954, -2.491235, 0.7411765, 1, 0, 1,
-0.712361, -1.949876, -3.759152, 0.7333333, 1, 0, 1,
-0.7111849, -0.3485979, -0.7750819, 0.7294118, 1, 0, 1,
-0.7088912, -0.2653776, -2.488253, 0.7215686, 1, 0, 1,
-0.7058938, 0.3481764, -0.7947767, 0.7176471, 1, 0, 1,
-0.7056772, -0.5563676, -1.066726, 0.7098039, 1, 0, 1,
-0.7042255, -1.947, -1.949196, 0.7058824, 1, 0, 1,
-0.7008622, 1.044363, -0.889202, 0.6980392, 1, 0, 1,
-0.700223, 0.6251518, -3.142634, 0.6901961, 1, 0, 1,
-0.6971385, -1.270139, -1.727911, 0.6862745, 1, 0, 1,
-0.6941229, -0.2453391, -2.235796, 0.6784314, 1, 0, 1,
-0.6867325, -1.271421, -2.484671, 0.6745098, 1, 0, 1,
-0.6860383, -1.013703, -2.243911, 0.6666667, 1, 0, 1,
-0.673921, 0.1686414, -0.80569, 0.6627451, 1, 0, 1,
-0.6713719, -1.012469, -1.807054, 0.654902, 1, 0, 1,
-0.6637928, -0.02034859, -1.618465, 0.6509804, 1, 0, 1,
-0.6635447, -0.085501, -2.088547, 0.6431373, 1, 0, 1,
-0.6633559, -0.7047485, -4.872191, 0.6392157, 1, 0, 1,
-0.658293, -0.1630349, -2.055204, 0.6313726, 1, 0, 1,
-0.6580858, 0.2169257, -1.282612, 0.627451, 1, 0, 1,
-0.6579442, 1.760731, 0.2905114, 0.6196079, 1, 0, 1,
-0.6573721, 0.9936271, -1.797271, 0.6156863, 1, 0, 1,
-0.654816, 0.5683399, 0.4649104, 0.6078432, 1, 0, 1,
-0.6535614, 0.1223535, -0.494651, 0.6039216, 1, 0, 1,
-0.6530095, 0.5504073, 0.1220627, 0.5960785, 1, 0, 1,
-0.6487902, -0.03547206, -1.558094, 0.5882353, 1, 0, 1,
-0.6473703, 0.0643139, 0.177095, 0.5843138, 1, 0, 1,
-0.6463724, 0.9471415, 0.9554387, 0.5764706, 1, 0, 1,
-0.6447039, 0.7611731, -1.129697, 0.572549, 1, 0, 1,
-0.6391695, -0.1133683, -2.669178, 0.5647059, 1, 0, 1,
-0.637112, 0.5014389, -1.872515, 0.5607843, 1, 0, 1,
-0.6367813, 1.408311, -0.2649846, 0.5529412, 1, 0, 1,
-0.6339118, -0.68942, -2.217085, 0.5490196, 1, 0, 1,
-0.6336669, 1.414073, -0.1799441, 0.5411765, 1, 0, 1,
-0.6277294, 0.5562078, -3.070174, 0.5372549, 1, 0, 1,
-0.6261666, -0.4255742, -2.29229, 0.5294118, 1, 0, 1,
-0.6257611, -0.7611346, -4.057472, 0.5254902, 1, 0, 1,
-0.6218541, -0.01600768, -2.229704, 0.5176471, 1, 0, 1,
-0.6209242, 1.340252, 0.04311059, 0.5137255, 1, 0, 1,
-0.6208116, 0.06130029, -2.288994, 0.5058824, 1, 0, 1,
-0.6174241, 0.767488, -0.7693095, 0.5019608, 1, 0, 1,
-0.6157674, 0.3830731, -1.85533, 0.4941176, 1, 0, 1,
-0.6153671, 1.86915, -0.03212374, 0.4862745, 1, 0, 1,
-0.6103721, 0.3853067, -1.487138, 0.4823529, 1, 0, 1,
-0.607317, -0.653331, -0.1780237, 0.4745098, 1, 0, 1,
-0.6053599, -1.083384, -2.246151, 0.4705882, 1, 0, 1,
-0.6031865, 1.631424, 0.2071785, 0.4627451, 1, 0, 1,
-0.6026253, 0.3376126, -2.027653, 0.4588235, 1, 0, 1,
-0.5997165, -0.4829253, -2.118366, 0.4509804, 1, 0, 1,
-0.5965557, -0.5512404, -2.132124, 0.4470588, 1, 0, 1,
-0.5952522, -0.02554735, -1.50239, 0.4392157, 1, 0, 1,
-0.5949767, -1.734904, -3.995535, 0.4352941, 1, 0, 1,
-0.5896915, -1.020327, -3.770976, 0.427451, 1, 0, 1,
-0.58941, -0.8946086, -2.555808, 0.4235294, 1, 0, 1,
-0.5861883, -2.3417, -3.399835, 0.4156863, 1, 0, 1,
-0.5858142, 1.038247, -1.756648, 0.4117647, 1, 0, 1,
-0.5850365, -0.2567306, -1.645205, 0.4039216, 1, 0, 1,
-0.5850301, 0.4951631, 0.7299067, 0.3960784, 1, 0, 1,
-0.5828514, 0.8962399, -0.0760382, 0.3921569, 1, 0, 1,
-0.5778269, -0.7751645, -2.32233, 0.3843137, 1, 0, 1,
-0.5678765, 1.736073, -0.5982145, 0.3803922, 1, 0, 1,
-0.5521553, -1.900063, -5.45752, 0.372549, 1, 0, 1,
-0.5423374, 0.2310893, -1.687966, 0.3686275, 1, 0, 1,
-0.5414996, 1.430815, 0.5611759, 0.3607843, 1, 0, 1,
-0.5409901, -0.5397707, -1.423043, 0.3568628, 1, 0, 1,
-0.5391563, 0.4924625, -2.426282, 0.3490196, 1, 0, 1,
-0.5381055, -0.8766218, -2.609674, 0.345098, 1, 0, 1,
-0.5368033, -0.3338237, -1.198887, 0.3372549, 1, 0, 1,
-0.5360985, -0.4373192, -3.107042, 0.3333333, 1, 0, 1,
-0.527458, -1.135586, -1.981081, 0.3254902, 1, 0, 1,
-0.5261552, 1.669298, 0.504473, 0.3215686, 1, 0, 1,
-0.5256925, -0.4467679, -3.270517, 0.3137255, 1, 0, 1,
-0.5253716, 2.02679, 1.266081, 0.3098039, 1, 0, 1,
-0.5243743, -0.009477293, 0.337939, 0.3019608, 1, 0, 1,
-0.523137, -0.5873218, -3.822117, 0.2941177, 1, 0, 1,
-0.5229282, 0.152479, -1.426291, 0.2901961, 1, 0, 1,
-0.5181108, 2.187768, 0.7839175, 0.282353, 1, 0, 1,
-0.5153823, -1.857848, -2.928727, 0.2784314, 1, 0, 1,
-0.5144423, 0.4094915, -0.3704048, 0.2705882, 1, 0, 1,
-0.5131841, -0.7037166, -2.632461, 0.2666667, 1, 0, 1,
-0.5070539, -0.4660122, -1.001578, 0.2588235, 1, 0, 1,
-0.5055289, 1.582608, 1.242733, 0.254902, 1, 0, 1,
-0.5054437, -1.666989, -2.929224, 0.2470588, 1, 0, 1,
-0.503723, -0.8767369, -1.081666, 0.2431373, 1, 0, 1,
-0.4975343, -0.9136937, -1.466748, 0.2352941, 1, 0, 1,
-0.497341, -0.8981405, -1.619651, 0.2313726, 1, 0, 1,
-0.4966667, 0.09161329, 0.6009373, 0.2235294, 1, 0, 1,
-0.4923643, -1.550598, -2.946779, 0.2196078, 1, 0, 1,
-0.4887187, -0.8945009, -2.245989, 0.2117647, 1, 0, 1,
-0.4874882, 1.78529, -1.279967, 0.2078431, 1, 0, 1,
-0.4858257, -0.8436086, -4.4769, 0.2, 1, 0, 1,
-0.4840814, -1.137419, -1.911914, 0.1921569, 1, 0, 1,
-0.4776466, 0.07520529, -2.208428, 0.1882353, 1, 0, 1,
-0.4774145, -1.199553, -2.913895, 0.1803922, 1, 0, 1,
-0.4772784, 1.071768, 0.3572956, 0.1764706, 1, 0, 1,
-0.4762469, -0.1468727, -1.622886, 0.1686275, 1, 0, 1,
-0.475581, -0.00130367, -2.992359, 0.1647059, 1, 0, 1,
-0.475433, 0.02629141, 0.3050887, 0.1568628, 1, 0, 1,
-0.4741046, 1.021035, -0.728525, 0.1529412, 1, 0, 1,
-0.4727617, 0.873899, -0.9117276, 0.145098, 1, 0, 1,
-0.4714506, -1.687744, -2.55854, 0.1411765, 1, 0, 1,
-0.4674484, -0.1281355, -1.424245, 0.1333333, 1, 0, 1,
-0.4672436, -0.1239835, -0.8825271, 0.1294118, 1, 0, 1,
-0.4659109, 0.5277109, -0.678268, 0.1215686, 1, 0, 1,
-0.4646469, -0.2818624, -1.562832, 0.1176471, 1, 0, 1,
-0.4626519, 0.4083063, 0.2255911, 0.1098039, 1, 0, 1,
-0.4578075, -0.8714615, -1.95055, 0.1058824, 1, 0, 1,
-0.4555694, -0.5675135, -1.928098, 0.09803922, 1, 0, 1,
-0.4534069, -0.5524561, -3.113633, 0.09019608, 1, 0, 1,
-0.4495124, -0.2747502, -2.6406, 0.08627451, 1, 0, 1,
-0.4423037, 0.6211607, -0.9246465, 0.07843138, 1, 0, 1,
-0.4420319, -0.5577894, -4.507031, 0.07450981, 1, 0, 1,
-0.4363031, 1.15708, 0.9447757, 0.06666667, 1, 0, 1,
-0.4303905, 1.19505, -1.348174, 0.0627451, 1, 0, 1,
-0.4249494, -1.75779, -1.668945, 0.05490196, 1, 0, 1,
-0.4236354, -0.07870883, -3.511722, 0.05098039, 1, 0, 1,
-0.4189513, -0.2203767, -2.482077, 0.04313726, 1, 0, 1,
-0.4142672, 1.919451, -0.8468962, 0.03921569, 1, 0, 1,
-0.4133779, -0.09139399, -2.159148, 0.03137255, 1, 0, 1,
-0.412837, -0.5520962, -1.970967, 0.02745098, 1, 0, 1,
-0.409209, 0.004501804, -1.585963, 0.01960784, 1, 0, 1,
-0.3962846, -0.2053609, -2.008913, 0.01568628, 1, 0, 1,
-0.3942224, -0.6339775, -2.671419, 0.007843138, 1, 0, 1,
-0.391369, -0.1625427, -1.229757, 0.003921569, 1, 0, 1,
-0.3846267, 0.558767, -0.4126554, 0, 1, 0.003921569, 1,
-0.3806448, 1.900797, 0.08688328, 0, 1, 0.01176471, 1,
-0.3778194, 0.7040967, -1.168883, 0, 1, 0.01568628, 1,
-0.3698575, 0.7953801, 0.226566, 0, 1, 0.02352941, 1,
-0.3691508, 0.03023626, -3.50029, 0, 1, 0.02745098, 1,
-0.3671364, -1.074838, -2.060483, 0, 1, 0.03529412, 1,
-0.3605784, -0.1356697, -1.781655, 0, 1, 0.03921569, 1,
-0.3581547, 0.2703508, 0.004282914, 0, 1, 0.04705882, 1,
-0.3577189, 1.657974, 0.5620352, 0, 1, 0.05098039, 1,
-0.3567245, -0.5563494, -1.619265, 0, 1, 0.05882353, 1,
-0.352007, 0.3501807, -0.8746174, 0, 1, 0.0627451, 1,
-0.3509915, -1.231505, -2.873806, 0, 1, 0.07058824, 1,
-0.34411, -2.088128, -4.932405, 0, 1, 0.07450981, 1,
-0.3426467, -0.4759229, -2.289974, 0, 1, 0.08235294, 1,
-0.3385749, 1.450752, -1.354571, 0, 1, 0.08627451, 1,
-0.3373491, -1.716105, -0.3261642, 0, 1, 0.09411765, 1,
-0.336176, 0.2821547, -0.2966643, 0, 1, 0.1019608, 1,
-0.3345675, 0.7470153, -0.4195507, 0, 1, 0.1058824, 1,
-0.3321233, -0.9455698, -3.299562, 0, 1, 0.1137255, 1,
-0.3304627, -0.6866349, -1.652619, 0, 1, 0.1176471, 1,
-0.3274054, -0.7088748, -2.523261, 0, 1, 0.1254902, 1,
-0.3270406, 0.4159007, -0.2502341, 0, 1, 0.1294118, 1,
-0.3245664, 0.2306586, -1.933621, 0, 1, 0.1372549, 1,
-0.3219785, -0.7631227, -2.883726, 0, 1, 0.1411765, 1,
-0.3169706, -0.3574702, -2.770824, 0, 1, 0.1490196, 1,
-0.3162243, 1.098836, -0.7161229, 0, 1, 0.1529412, 1,
-0.3144942, 0.5911959, -0.8189813, 0, 1, 0.1607843, 1,
-0.3106975, 0.0121412, -0.997296, 0, 1, 0.1647059, 1,
-0.3076462, -0.8862038, -2.494786, 0, 1, 0.172549, 1,
-0.3036602, -0.5308195, -1.601529, 0, 1, 0.1764706, 1,
-0.3035318, 0.761151, -1.174693, 0, 1, 0.1843137, 1,
-0.3021612, -0.6408729, -3.092121, 0, 1, 0.1882353, 1,
-0.2957034, 1.164775, 1.146153, 0, 1, 0.1960784, 1,
-0.2944365, 0.4501477, -0.9931418, 0, 1, 0.2039216, 1,
-0.2931188, 1.163168, -0.5642676, 0, 1, 0.2078431, 1,
-0.2928012, -1.073189, -3.535917, 0, 1, 0.2156863, 1,
-0.2920396, -1.206309, -4.45049, 0, 1, 0.2196078, 1,
-0.2878568, 0.04846477, -1.422185, 0, 1, 0.227451, 1,
-0.2860315, -0.08244657, 0.08947738, 0, 1, 0.2313726, 1,
-0.2855294, -2.063716, -2.27288, 0, 1, 0.2392157, 1,
-0.2841742, -1.38847, -2.776944, 0, 1, 0.2431373, 1,
-0.283319, 0.7976205, -0.6217928, 0, 1, 0.2509804, 1,
-0.281912, 0.8635423, 0.0791251, 0, 1, 0.254902, 1,
-0.2810397, -0.04052467, -1.548557, 0, 1, 0.2627451, 1,
-0.280698, 1.377377, 0.6955891, 0, 1, 0.2666667, 1,
-0.2692649, -1.570414, -4.179205, 0, 1, 0.2745098, 1,
-0.2666725, 1.974545, 0.4942424, 0, 1, 0.2784314, 1,
-0.2580935, 0.07627039, -1.229205, 0, 1, 0.2862745, 1,
-0.2554342, -1.319691, -0.8502125, 0, 1, 0.2901961, 1,
-0.2520999, 0.01777682, -0.277294, 0, 1, 0.2980392, 1,
-0.2487988, 2.039907, -0.1835365, 0, 1, 0.3058824, 1,
-0.2472734, 0.05964262, -1.2571, 0, 1, 0.3098039, 1,
-0.2427873, -0.2355749, -0.8008537, 0, 1, 0.3176471, 1,
-0.2386648, 0.2962196, -1.494378, 0, 1, 0.3215686, 1,
-0.237222, 1.933237, -0.1197084, 0, 1, 0.3294118, 1,
-0.2356668, -0.4308482, -4.318392, 0, 1, 0.3333333, 1,
-0.2319939, 1.855103, 0.8347844, 0, 1, 0.3411765, 1,
-0.2250306, -0.1906883, -1.970444, 0, 1, 0.345098, 1,
-0.2243573, -2.146781, -3.699605, 0, 1, 0.3529412, 1,
-0.2231471, -0.4265961, -2.433792, 0, 1, 0.3568628, 1,
-0.2212142, 1.05698, -2.052688, 0, 1, 0.3647059, 1,
-0.2184389, -0.4133863, -4.196367, 0, 1, 0.3686275, 1,
-0.2184043, 0.1436251, -0.8943933, 0, 1, 0.3764706, 1,
-0.2147418, 0.3204902, -1.263043, 0, 1, 0.3803922, 1,
-0.2136452, -0.8058705, -3.485759, 0, 1, 0.3882353, 1,
-0.2111941, 2.213411, 1.132621, 0, 1, 0.3921569, 1,
-0.2100718, -0.6104495, -1.951746, 0, 1, 0.4, 1,
-0.20952, -0.3775738, -2.083874, 0, 1, 0.4078431, 1,
-0.2089982, -1.851228, -2.737766, 0, 1, 0.4117647, 1,
-0.2077255, -0.7179196, -2.671099, 0, 1, 0.4196078, 1,
-0.2029462, 0.2945132, -0.2988002, 0, 1, 0.4235294, 1,
-0.1995998, -2.070077, -3.919834, 0, 1, 0.4313726, 1,
-0.1965884, -0.01045952, -0.8016486, 0, 1, 0.4352941, 1,
-0.1963129, -0.4288552, -2.103043, 0, 1, 0.4431373, 1,
-0.1907325, 0.9867672, 0.9180108, 0, 1, 0.4470588, 1,
-0.1878274, 0.2030754, 0.423296, 0, 1, 0.454902, 1,
-0.1869521, 0.5381092, -0.658896, 0, 1, 0.4588235, 1,
-0.1868506, -1.617669, -4.040061, 0, 1, 0.4666667, 1,
-0.1867061, -0.192215, -2.639998, 0, 1, 0.4705882, 1,
-0.1847901, -1.473354, -3.356745, 0, 1, 0.4784314, 1,
-0.1842293, -0.5362107, -1.977593, 0, 1, 0.4823529, 1,
-0.1825322, 0.3187096, 1.827762, 0, 1, 0.4901961, 1,
-0.1817984, -0.8758146, -1.429285, 0, 1, 0.4941176, 1,
-0.177296, -0.7831607, -1.205955, 0, 1, 0.5019608, 1,
-0.1771623, 1.06538, -1.21707, 0, 1, 0.509804, 1,
-0.1764252, 1.444897, -0.7705034, 0, 1, 0.5137255, 1,
-0.1737566, -0.1702577, -2.641296, 0, 1, 0.5215687, 1,
-0.1714503, -2.096286, -1.44675, 0, 1, 0.5254902, 1,
-0.1691328, 1.374035, 1.412637, 0, 1, 0.5333334, 1,
-0.1688562, -0.8932399, -2.78754, 0, 1, 0.5372549, 1,
-0.1617244, -0.9336491, -1.678792, 0, 1, 0.5450981, 1,
-0.1614185, -0.1407131, -2.627109, 0, 1, 0.5490196, 1,
-0.1601714, -0.1624409, -2.281056, 0, 1, 0.5568628, 1,
-0.159572, 0.5041987, -0.5838607, 0, 1, 0.5607843, 1,
-0.1594624, -0.5128991, -3.651874, 0, 1, 0.5686275, 1,
-0.1574527, 0.3424915, -1.575812, 0, 1, 0.572549, 1,
-0.1526443, 0.6588413, -1.246487, 0, 1, 0.5803922, 1,
-0.1475433, 0.01696455, -1.375071, 0, 1, 0.5843138, 1,
-0.1473932, 0.8456869, 0.6005539, 0, 1, 0.5921569, 1,
-0.144789, -0.06550206, -2.350995, 0, 1, 0.5960785, 1,
-0.1427788, 0.5818943, 0.04481608, 0, 1, 0.6039216, 1,
-0.1425718, 0.3399687, 0.1205787, 0, 1, 0.6117647, 1,
-0.142148, 0.2408764, 0.7186984, 0, 1, 0.6156863, 1,
-0.1408989, 1.787484, 0.1015116, 0, 1, 0.6235294, 1,
-0.1398249, 0.3005496, -0.6116858, 0, 1, 0.627451, 1,
-0.1373911, -0.3941491, -1.031952, 0, 1, 0.6352941, 1,
-0.1372702, 0.5424525, -1.628111, 0, 1, 0.6392157, 1,
-0.1328978, 0.8013937, 0.8094947, 0, 1, 0.6470588, 1,
-0.1297435, -0.5265, -2.812439, 0, 1, 0.6509804, 1,
-0.1239089, -0.9642947, -2.630258, 0, 1, 0.6588235, 1,
-0.1199309, -0.7272312, -2.341478, 0, 1, 0.6627451, 1,
-0.1191846, 0.526867, -0.6451553, 0, 1, 0.6705883, 1,
-0.118377, 0.6797611, -0.4857866, 0, 1, 0.6745098, 1,
-0.1181566, -0.3058336, -3.306804, 0, 1, 0.682353, 1,
-0.1176221, 1.070529, 0.2894986, 0, 1, 0.6862745, 1,
-0.1164198, 1.113945, 0.9184719, 0, 1, 0.6941177, 1,
-0.1003836, -0.4493155, -2.042603, 0, 1, 0.7019608, 1,
-0.09986224, -0.892118, -4.813426, 0, 1, 0.7058824, 1,
-0.09643231, -0.03926557, -1.967676, 0, 1, 0.7137255, 1,
-0.09431236, -0.6647686, -3.074814, 0, 1, 0.7176471, 1,
-0.09008323, -1.357128, -3.272875, 0, 1, 0.7254902, 1,
-0.09002289, 0.02766089, -1.261193, 0, 1, 0.7294118, 1,
-0.0887989, -0.6299647, -3.153326, 0, 1, 0.7372549, 1,
-0.08765467, 1.217306, -1.141782, 0, 1, 0.7411765, 1,
-0.08659536, 0.7198062, 0.1547187, 0, 1, 0.7490196, 1,
-0.08479198, -0.8938928, -3.309689, 0, 1, 0.7529412, 1,
-0.07764094, -1.331105, -4.14982, 0, 1, 0.7607843, 1,
-0.07367355, 0.9275372, 0.3927162, 0, 1, 0.7647059, 1,
-0.0694599, -0.2972372, -3.756813, 0, 1, 0.772549, 1,
-0.06362171, -0.3182502, -2.722867, 0, 1, 0.7764706, 1,
-0.06305145, -0.8130285, -3.432661, 0, 1, 0.7843137, 1,
-0.06051051, 0.7220735, -0.7437261, 0, 1, 0.7882353, 1,
-0.05873035, -0.2163218, -3.436245, 0, 1, 0.7960784, 1,
-0.05853249, -0.2457532, -2.181453, 0, 1, 0.8039216, 1,
-0.05776136, 1.17719, -0.6794167, 0, 1, 0.8078431, 1,
-0.05621619, 0.4839209, -0.6425206, 0, 1, 0.8156863, 1,
-0.05547396, 0.1246178, 0.8337647, 0, 1, 0.8196079, 1,
-0.05500773, 0.1490261, -0.3314942, 0, 1, 0.827451, 1,
-0.05429421, -0.9143425, -3.756781, 0, 1, 0.8313726, 1,
-0.05170211, 1.136379, 0.1453111, 0, 1, 0.8392157, 1,
-0.05049662, -1.400907, -3.03468, 0, 1, 0.8431373, 1,
-0.04903916, 0.1815719, -0.1438504, 0, 1, 0.8509804, 1,
-0.0488125, -1.01347, -2.586707, 0, 1, 0.854902, 1,
-0.04332788, -1.132982, -1.519628, 0, 1, 0.8627451, 1,
-0.04270569, -1.762258, -3.009347, 0, 1, 0.8666667, 1,
-0.04259047, -0.1987243, -3.731744, 0, 1, 0.8745098, 1,
-0.03953203, 0.1613101, -1.6806, 0, 1, 0.8784314, 1,
-0.02969245, -0.1997511, -2.257364, 0, 1, 0.8862745, 1,
-0.02335992, 1.340448, -2.250408, 0, 1, 0.8901961, 1,
-0.02278196, 0.9504468, -0.5008888, 0, 1, 0.8980392, 1,
-0.02023566, -1.346412, -3.541653, 0, 1, 0.9058824, 1,
-0.01295673, -0.7405297, -3.2797, 0, 1, 0.9098039, 1,
-0.005515488, -0.4304441, -2.963376, 0, 1, 0.9176471, 1,
-0.004258041, 1.913453, 0.5428379, 0, 1, 0.9215686, 1,
-0.003825205, 0.3139845, -1.068081, 0, 1, 0.9294118, 1,
-0.001803258, 1.928791, 0.5851504, 0, 1, 0.9333333, 1,
-0.001744737, 1.220101, 0.5712649, 0, 1, 0.9411765, 1,
0.00156785, 0.7509651, 0.1037796, 0, 1, 0.945098, 1,
0.004620887, -0.06426212, 2.146669, 0, 1, 0.9529412, 1,
0.009691589, -0.2253061, 3.17041, 0, 1, 0.9568627, 1,
0.01066957, -0.7202337, 3.442264, 0, 1, 0.9647059, 1,
0.01271547, -0.09800023, 3.318034, 0, 1, 0.9686275, 1,
0.01732084, -0.1375167, 2.755683, 0, 1, 0.9764706, 1,
0.01807787, 1.258157, -0.1046183, 0, 1, 0.9803922, 1,
0.01983967, 1.316306, -0.7094838, 0, 1, 0.9882353, 1,
0.02266813, 2.621806, -0.4530082, 0, 1, 0.9921569, 1,
0.02389459, 0.7287557, 0.7555951, 0, 1, 1, 1,
0.02487076, -1.097569, 4.375038, 0, 0.9921569, 1, 1,
0.02559216, -0.3258955, 4.398362, 0, 0.9882353, 1, 1,
0.02902953, -0.9263985, 2.596122, 0, 0.9803922, 1, 1,
0.03244022, 0.982935, 0.2879536, 0, 0.9764706, 1, 1,
0.0333484, 1.626583, -0.805889, 0, 0.9686275, 1, 1,
0.0353747, -1.354072, 3.608982, 0, 0.9647059, 1, 1,
0.03896862, 0.4089311, -0.5406294, 0, 0.9568627, 1, 1,
0.04024115, -1.596929, 2.523839, 0, 0.9529412, 1, 1,
0.04492407, -0.3759023, 4.344702, 0, 0.945098, 1, 1,
0.04590404, 1.754429, -2.166626, 0, 0.9411765, 1, 1,
0.04821563, 0.9843042, -2.427713, 0, 0.9333333, 1, 1,
0.04935822, -0.5561473, 2.637809, 0, 0.9294118, 1, 1,
0.04965544, 0.3497282, 1.992448, 0, 0.9215686, 1, 1,
0.05100377, 0.2740487, -0.5245472, 0, 0.9176471, 1, 1,
0.05390302, 0.3120197, -1.164062, 0, 0.9098039, 1, 1,
0.05451887, 0.2194155, -0.2442218, 0, 0.9058824, 1, 1,
0.05722802, 0.1090667, 1.235003, 0, 0.8980392, 1, 1,
0.05852421, 0.25295, 0.09828136, 0, 0.8901961, 1, 1,
0.06143293, -0.6929189, 0.4096982, 0, 0.8862745, 1, 1,
0.06423712, 0.5644307, -0.3756143, 0, 0.8784314, 1, 1,
0.07881964, -0.2670548, 2.932162, 0, 0.8745098, 1, 1,
0.08325124, -0.124294, 0.9705029, 0, 0.8666667, 1, 1,
0.08331483, 0.7681042, 2.30782, 0, 0.8627451, 1, 1,
0.08590242, -0.2730221, 3.03741, 0, 0.854902, 1, 1,
0.08595157, 1.156116, 1.178117, 0, 0.8509804, 1, 1,
0.086482, -1.621864, 3.814462, 0, 0.8431373, 1, 1,
0.08813515, -2.351022, 3.36343, 0, 0.8392157, 1, 1,
0.08819477, -0.002344676, 1.342752, 0, 0.8313726, 1, 1,
0.09189381, -0.2826123, 1.639608, 0, 0.827451, 1, 1,
0.09701075, 0.2973525, -0.09818037, 0, 0.8196079, 1, 1,
0.09992453, -0.5731702, 2.386664, 0, 0.8156863, 1, 1,
0.1029427, 1.492682, 0.1892845, 0, 0.8078431, 1, 1,
0.1033357, 0.5682954, 1.176625, 0, 0.8039216, 1, 1,
0.1039907, 0.5155268, -0.2755168, 0, 0.7960784, 1, 1,
0.1049068, 2.262892, -0.917397, 0, 0.7882353, 1, 1,
0.1063085, -0.4064883, 3.376755, 0, 0.7843137, 1, 1,
0.1089654, -0.6159828, 3.543772, 0, 0.7764706, 1, 1,
0.1178079, 1.035484, 0.9353716, 0, 0.772549, 1, 1,
0.1220882, -0.4596632, 1.224588, 0, 0.7647059, 1, 1,
0.1224798, 0.7411232, -1.265454, 0, 0.7607843, 1, 1,
0.1236346, 1.225069, -0.6448324, 0, 0.7529412, 1, 1,
0.1239305, -0.3102922, 3.35994, 0, 0.7490196, 1, 1,
0.1273709, 0.4783836, 1.574924, 0, 0.7411765, 1, 1,
0.1301302, 1.165059, -0.4551332, 0, 0.7372549, 1, 1,
0.1316422, 0.04475981, 1.557185, 0, 0.7294118, 1, 1,
0.1336813, 1.432803, -0.3645846, 0, 0.7254902, 1, 1,
0.1411215, 1.144486, -2.522785, 0, 0.7176471, 1, 1,
0.141267, 1.514125, -0.1303238, 0, 0.7137255, 1, 1,
0.1487817, -0.4074464, 1.640747, 0, 0.7058824, 1, 1,
0.1489431, -0.2482003, 1.879855, 0, 0.6980392, 1, 1,
0.1504882, -1.836733, 1.998842, 0, 0.6941177, 1, 1,
0.1506714, 0.4853288, -2.147479, 0, 0.6862745, 1, 1,
0.1552766, 0.355998, 3.186228, 0, 0.682353, 1, 1,
0.1558423, -0.06574383, 2.392314, 0, 0.6745098, 1, 1,
0.1558965, 1.72558, 0.4568346, 0, 0.6705883, 1, 1,
0.1627927, -0.3928567, 3.377061, 0, 0.6627451, 1, 1,
0.1635272, -0.4012952, 3.809478, 0, 0.6588235, 1, 1,
0.1665638, -0.3088356, 4.325891, 0, 0.6509804, 1, 1,
0.1675838, 0.4666898, -0.7225591, 0, 0.6470588, 1, 1,
0.1715978, 1.296191, 1.006261, 0, 0.6392157, 1, 1,
0.1725798, -0.1597026, 3.062083, 0, 0.6352941, 1, 1,
0.1793858, 0.4541907, 1.175647, 0, 0.627451, 1, 1,
0.1835543, 3.813553, -0.8686424, 0, 0.6235294, 1, 1,
0.1885631, 0.8479388, 0.7405314, 0, 0.6156863, 1, 1,
0.1888559, 0.5734009, -0.3286192, 0, 0.6117647, 1, 1,
0.1906011, -0.7221439, 4.486008, 0, 0.6039216, 1, 1,
0.19435, 0.08686846, -0.1869558, 0, 0.5960785, 1, 1,
0.1952828, 1.631058, 1.554455, 0, 0.5921569, 1, 1,
0.1974965, -0.706352, 4.152229, 0, 0.5843138, 1, 1,
0.2010485, -1.807239, 4.168035, 0, 0.5803922, 1, 1,
0.2013433, -0.974975, 4.422817, 0, 0.572549, 1, 1,
0.2018314, 1.291947, -1.215012, 0, 0.5686275, 1, 1,
0.2037064, -0.2175957, 2.186911, 0, 0.5607843, 1, 1,
0.2043516, 0.1300818, 1.385259, 0, 0.5568628, 1, 1,
0.2107782, 1.231761, 0.2376976, 0, 0.5490196, 1, 1,
0.214489, 0.06534497, 2.752435, 0, 0.5450981, 1, 1,
0.2183888, 0.0590472, 1.158068, 0, 0.5372549, 1, 1,
0.2256847, 0.6316844, -1.253408, 0, 0.5333334, 1, 1,
0.2265734, 1.073897, -0.4094895, 0, 0.5254902, 1, 1,
0.2321632, -1.030515, 4.132036, 0, 0.5215687, 1, 1,
0.2369299, 0.6529505, 0.7532077, 0, 0.5137255, 1, 1,
0.2387487, -0.8370468, 3.312197, 0, 0.509804, 1, 1,
0.2400498, -0.3193148, 1.979889, 0, 0.5019608, 1, 1,
0.2401223, -0.0005097414, 1.138932, 0, 0.4941176, 1, 1,
0.2402659, -0.4567331, 0.1683625, 0, 0.4901961, 1, 1,
0.2438739, -1.587129, 2.362382, 0, 0.4823529, 1, 1,
0.246653, -0.07134695, 1.912004, 0, 0.4784314, 1, 1,
0.2484872, -0.3247424, 1.846543, 0, 0.4705882, 1, 1,
0.2491852, 2.037414, -0.4858022, 0, 0.4666667, 1, 1,
0.2509202, 0.2170728, 1.658737, 0, 0.4588235, 1, 1,
0.2525658, 0.2053051, 0.4798161, 0, 0.454902, 1, 1,
0.2527176, 0.02042702, 2.50466, 0, 0.4470588, 1, 1,
0.2537324, 0.7379478, 0.1940775, 0, 0.4431373, 1, 1,
0.2541706, 0.8259423, 0.8343986, 0, 0.4352941, 1, 1,
0.257647, -1.06189, 3.821821, 0, 0.4313726, 1, 1,
0.2583208, -0.2119548, 1.27918, 0, 0.4235294, 1, 1,
0.2607504, -0.7926453, 4.032183, 0, 0.4196078, 1, 1,
0.2608081, -0.9640115, 2.473246, 0, 0.4117647, 1, 1,
0.2658986, -0.2309601, 3.333828, 0, 0.4078431, 1, 1,
0.266946, 2.418198, 0.360324, 0, 0.4, 1, 1,
0.26916, 2.543012, -0.06489188, 0, 0.3921569, 1, 1,
0.2735018, 0.5214545, 0.4110053, 0, 0.3882353, 1, 1,
0.2741607, -0.4596093, 1.871496, 0, 0.3803922, 1, 1,
0.2756072, -0.6631936, 1.840807, 0, 0.3764706, 1, 1,
0.2784032, -1.690451, 4.67487, 0, 0.3686275, 1, 1,
0.2808576, -1.705297, 2.48851, 0, 0.3647059, 1, 1,
0.2808982, -1.035187, 1.977406, 0, 0.3568628, 1, 1,
0.2818634, -0.1217444, -0.6424372, 0, 0.3529412, 1, 1,
0.2918577, 1.17473, -0.61967, 0, 0.345098, 1, 1,
0.2965608, -0.8915038, 4.55451, 0, 0.3411765, 1, 1,
0.2985403, -0.4463108, 2.405154, 0, 0.3333333, 1, 1,
0.3049976, 0.4503621, 0.179086, 0, 0.3294118, 1, 1,
0.3111686, -0.2504972, 3.382749, 0, 0.3215686, 1, 1,
0.3113265, 0.6310003, 0.7662101, 0, 0.3176471, 1, 1,
0.3131239, 1.485015, -1.093098, 0, 0.3098039, 1, 1,
0.3136857, -0.1511671, 1.807881, 0, 0.3058824, 1, 1,
0.3158219, -0.478832, 2.762227, 0, 0.2980392, 1, 1,
0.3197722, 1.13669, 1.165626, 0, 0.2901961, 1, 1,
0.3241381, -1.118179, 1.783852, 0, 0.2862745, 1, 1,
0.3268856, 2.854669, -0.8781275, 0, 0.2784314, 1, 1,
0.3395317, 1.20302, -0.4396807, 0, 0.2745098, 1, 1,
0.3403148, 0.07485389, -0.1603419, 0, 0.2666667, 1, 1,
0.3465738, 0.8202097, -0.1221897, 0, 0.2627451, 1, 1,
0.3490096, -0.2037055, 0.3266025, 0, 0.254902, 1, 1,
0.3498416, -0.3187546, 1.779928, 0, 0.2509804, 1, 1,
0.3552796, -0.040883, 2.053764, 0, 0.2431373, 1, 1,
0.3566641, 0.3891124, 0.2535619, 0, 0.2392157, 1, 1,
0.3569703, 0.02279308, 3.589118, 0, 0.2313726, 1, 1,
0.3576252, -0.3845912, 2.111186, 0, 0.227451, 1, 1,
0.3627122, 0.5921748, -0.3362955, 0, 0.2196078, 1, 1,
0.3636123, -1.675432, 3.001545, 0, 0.2156863, 1, 1,
0.3654125, 0.2240571, 1.642478, 0, 0.2078431, 1, 1,
0.3720383, -0.5646604, 3.638386, 0, 0.2039216, 1, 1,
0.3744724, 0.6850501, 0.8617238, 0, 0.1960784, 1, 1,
0.3771815, -0.7362709, 3.846711, 0, 0.1882353, 1, 1,
0.3818552, -0.2074654, 1.868658, 0, 0.1843137, 1, 1,
0.3823889, -0.02589725, 2.49069, 0, 0.1764706, 1, 1,
0.383541, -1.354935, 4.2735, 0, 0.172549, 1, 1,
0.3844986, -0.04313216, 1.457307, 0, 0.1647059, 1, 1,
0.3970329, -0.1982509, 3.369977, 0, 0.1607843, 1, 1,
0.3998405, 0.3041581, 0.6665289, 0, 0.1529412, 1, 1,
0.400191, 1.823872, 0.9434716, 0, 0.1490196, 1, 1,
0.4026895, 0.1074814, 0.8433505, 0, 0.1411765, 1, 1,
0.4050432, -0.3853955, 3.877766, 0, 0.1372549, 1, 1,
0.4085672, -0.4496674, 1.052565, 0, 0.1294118, 1, 1,
0.4114563, 1.196688, 0.02816169, 0, 0.1254902, 1, 1,
0.4134761, -0.4212047, 3.508088, 0, 0.1176471, 1, 1,
0.4169361, -2.243819, 3.097823, 0, 0.1137255, 1, 1,
0.4196267, 0.2351976, 2.145068, 0, 0.1058824, 1, 1,
0.4204461, 0.2905539, 1.527528, 0, 0.09803922, 1, 1,
0.4215681, 1.129229, 0.8869827, 0, 0.09411765, 1, 1,
0.4241955, 0.9781794, 1.035085, 0, 0.08627451, 1, 1,
0.4260344, 1.121651, -0.6868407, 0, 0.08235294, 1, 1,
0.4337636, 0.1170023, -0.2213117, 0, 0.07450981, 1, 1,
0.4352565, -1.192456, 4.118658, 0, 0.07058824, 1, 1,
0.4389991, 2.192003, 2.239942, 0, 0.0627451, 1, 1,
0.4415778, -0.02770159, 2.098436, 0, 0.05882353, 1, 1,
0.4451203, 1.915536, -0.5850312, 0, 0.05098039, 1, 1,
0.445437, -0.1140998, 1.608967, 0, 0.04705882, 1, 1,
0.4482678, -0.2057387, 2.950051, 0, 0.03921569, 1, 1,
0.4507284, 0.8851816, 0.4583926, 0, 0.03529412, 1, 1,
0.4529273, 1.157963, 1.464323, 0, 0.02745098, 1, 1,
0.4531667, -0.6352871, 2.71649, 0, 0.02352941, 1, 1,
0.4540884, 0.1797791, 1.032415, 0, 0.01568628, 1, 1,
0.4582583, 0.5348042, 0.6956692, 0, 0.01176471, 1, 1,
0.4651957, 1.609571, -0.4074086, 0, 0.003921569, 1, 1,
0.4661151, 0.06959165, 0.7900898, 0.003921569, 0, 1, 1,
0.4720205, -0.6793814, 2.942951, 0.007843138, 0, 1, 1,
0.4730574, -0.3337461, 2.805536, 0.01568628, 0, 1, 1,
0.4734863, 1.76383, 1.116999, 0.01960784, 0, 1, 1,
0.4815261, 0.2209923, 1.961592, 0.02745098, 0, 1, 1,
0.4821142, -1.301061, 2.723062, 0.03137255, 0, 1, 1,
0.4823903, 0.1549343, 1.001386, 0.03921569, 0, 1, 1,
0.4848397, 1.637823, 0.2746932, 0.04313726, 0, 1, 1,
0.4861309, 0.3609738, 1.513745, 0.05098039, 0, 1, 1,
0.4866805, 0.9325305, -0.7882566, 0.05490196, 0, 1, 1,
0.4890926, -0.09176263, 0.4113818, 0.0627451, 0, 1, 1,
0.4909742, -0.2427893, 1.060799, 0.06666667, 0, 1, 1,
0.4949303, -0.6272607, 4.063524, 0.07450981, 0, 1, 1,
0.5023137, 0.3989368, 2.014446, 0.07843138, 0, 1, 1,
0.5043479, 1.631648, 2.121043, 0.08627451, 0, 1, 1,
0.5067906, 0.4598884, 0.6101023, 0.09019608, 0, 1, 1,
0.5109674, -0.1470041, 2.010685, 0.09803922, 0, 1, 1,
0.512421, -0.7050517, 3.156862, 0.1058824, 0, 1, 1,
0.5125982, -0.3381476, 2.131265, 0.1098039, 0, 1, 1,
0.5176529, 0.3127556, 3.720754, 0.1176471, 0, 1, 1,
0.5242251, 0.4254683, 0.1345321, 0.1215686, 0, 1, 1,
0.5284834, 0.4825238, 0.2362601, 0.1294118, 0, 1, 1,
0.5292609, 0.3201106, 0.4673332, 0.1333333, 0, 1, 1,
0.5309722, 0.6429495, -1.018561, 0.1411765, 0, 1, 1,
0.5313947, 0.4590004, 1.217525, 0.145098, 0, 1, 1,
0.5316444, -1.551078, 2.190192, 0.1529412, 0, 1, 1,
0.532316, 0.8855466, 1.213431, 0.1568628, 0, 1, 1,
0.539986, 0.6551114, 0.9729149, 0.1647059, 0, 1, 1,
0.5424344, -0.1128815, 2.549592, 0.1686275, 0, 1, 1,
0.5426356, 1.404749, -0.4486997, 0.1764706, 0, 1, 1,
0.5529033, 0.04812299, -0.2226371, 0.1803922, 0, 1, 1,
0.5534716, -0.1328418, 1.830291, 0.1882353, 0, 1, 1,
0.5604054, 0.1628607, 1.366315, 0.1921569, 0, 1, 1,
0.5614545, -1.138598, 3.880472, 0.2, 0, 1, 1,
0.565471, 1.358096, -0.639635, 0.2078431, 0, 1, 1,
0.5661073, 0.406008, 0.6010163, 0.2117647, 0, 1, 1,
0.5765049, 0.8962079, -0.07582359, 0.2196078, 0, 1, 1,
0.5770069, 2.618602, 1.10537, 0.2235294, 0, 1, 1,
0.5799158, 0.1103284, 2.724822, 0.2313726, 0, 1, 1,
0.5833653, -0.2265584, 3.348126, 0.2352941, 0, 1, 1,
0.5838209, -0.9911677, 4.648238, 0.2431373, 0, 1, 1,
0.5881809, 0.4243751, 1.354227, 0.2470588, 0, 1, 1,
0.5925745, 0.4388205, 0.719545, 0.254902, 0, 1, 1,
0.5957814, -1.089561, 2.911989, 0.2588235, 0, 1, 1,
0.5999478, -0.151891, 2.754946, 0.2666667, 0, 1, 1,
0.6001265, 1.256489, 0.9820218, 0.2705882, 0, 1, 1,
0.6025624, 1.011142, -0.1392706, 0.2784314, 0, 1, 1,
0.6054745, -0.4210036, 3.888651, 0.282353, 0, 1, 1,
0.6110867, -0.3117475, 3.378503, 0.2901961, 0, 1, 1,
0.6136467, 1.305188, -0.7762573, 0.2941177, 0, 1, 1,
0.6160908, 0.01881571, 1.927865, 0.3019608, 0, 1, 1,
0.6192924, -0.9270286, 1.547019, 0.3098039, 0, 1, 1,
0.621925, 0.1755688, 2.336957, 0.3137255, 0, 1, 1,
0.6229342, -0.1702156, 1.444589, 0.3215686, 0, 1, 1,
0.6236398, 2.314373, -1.908296, 0.3254902, 0, 1, 1,
0.6254593, 0.6484749, 0.6642927, 0.3333333, 0, 1, 1,
0.6266547, -1.506388, 1.957833, 0.3372549, 0, 1, 1,
0.6323936, 0.6137928, 0.316406, 0.345098, 0, 1, 1,
0.6343535, 0.5663941, 2.096014, 0.3490196, 0, 1, 1,
0.6354676, 0.8857203, 0.1146513, 0.3568628, 0, 1, 1,
0.6399602, 1.407754, 0.1617114, 0.3607843, 0, 1, 1,
0.64028, 0.6495202, 1.918562, 0.3686275, 0, 1, 1,
0.6471916, 0.4952606, 1.020949, 0.372549, 0, 1, 1,
0.6493, -1.503602, 1.174843, 0.3803922, 0, 1, 1,
0.6505749, -1.197625, 1.129367, 0.3843137, 0, 1, 1,
0.6525765, -1.258119, 3.21128, 0.3921569, 0, 1, 1,
0.6572556, 0.2629384, 1.49892, 0.3960784, 0, 1, 1,
0.6574685, -1.45968, 1.878592, 0.4039216, 0, 1, 1,
0.6626687, -0.2597873, 0.9395253, 0.4117647, 0, 1, 1,
0.6651067, 1.626078, 0.9809104, 0.4156863, 0, 1, 1,
0.6684262, -0.9365904, 3.65784, 0.4235294, 0, 1, 1,
0.6701816, 0.9918385, 0.5581961, 0.427451, 0, 1, 1,
0.6702371, -0.3856185, 2.714025, 0.4352941, 0, 1, 1,
0.6719366, 1.246277, 0.855838, 0.4392157, 0, 1, 1,
0.6812559, 0.5486617, 0.5151326, 0.4470588, 0, 1, 1,
0.6825427, -0.7395829, 1.021948, 0.4509804, 0, 1, 1,
0.6832392, 0.3164627, 0.8220005, 0.4588235, 0, 1, 1,
0.6837636, 0.6719738, -0.6201733, 0.4627451, 0, 1, 1,
0.6841218, -0.6868754, 1.659762, 0.4705882, 0, 1, 1,
0.6890177, 0.1997588, 1.919009, 0.4745098, 0, 1, 1,
0.6897132, -2.777514, 2.614085, 0.4823529, 0, 1, 1,
0.690074, -0.5942872, 2.756649, 0.4862745, 0, 1, 1,
0.6915644, -1.443706, 1.983526, 0.4941176, 0, 1, 1,
0.6939272, -0.4076407, 1.925851, 0.5019608, 0, 1, 1,
0.697828, -1.56579, 5.645991, 0.5058824, 0, 1, 1,
0.6994074, -0.4639088, 0.3605509, 0.5137255, 0, 1, 1,
0.7053685, 0.04539429, 2.399749, 0.5176471, 0, 1, 1,
0.7057787, 0.4625497, 1.883456, 0.5254902, 0, 1, 1,
0.7081965, -1.755448, 3.665738, 0.5294118, 0, 1, 1,
0.709041, -0.5118877, 1.72294, 0.5372549, 0, 1, 1,
0.7127843, -1.341797, 2.686006, 0.5411765, 0, 1, 1,
0.7134082, -0.2408993, 2.024399, 0.5490196, 0, 1, 1,
0.7191834, 0.03700518, 0.2248044, 0.5529412, 0, 1, 1,
0.7293479, -0.3688584, 1.957062, 0.5607843, 0, 1, 1,
0.7299817, 0.4923877, 1.740382, 0.5647059, 0, 1, 1,
0.732101, 0.02202933, 1.513213, 0.572549, 0, 1, 1,
0.7381477, -0.1036598, 1.519347, 0.5764706, 0, 1, 1,
0.7398411, -0.1706645, 2.713247, 0.5843138, 0, 1, 1,
0.7439222, 0.569081, 1.760971, 0.5882353, 0, 1, 1,
0.7449958, -0.9754724, 2.141352, 0.5960785, 0, 1, 1,
0.7517594, 0.04660125, 3.432364, 0.6039216, 0, 1, 1,
0.7590432, -0.4391496, 2.195819, 0.6078432, 0, 1, 1,
0.7623349, -1.432628, 4.63966, 0.6156863, 0, 1, 1,
0.7645544, 0.5150945, 0.848849, 0.6196079, 0, 1, 1,
0.7704619, 0.1586172, 2.789153, 0.627451, 0, 1, 1,
0.7705532, -0.6007346, 4.88428, 0.6313726, 0, 1, 1,
0.7727364, 0.446547, 1.07907, 0.6392157, 0, 1, 1,
0.7855283, 0.0969024, 0.6592804, 0.6431373, 0, 1, 1,
0.7952769, -0.0170777, 2.014944, 0.6509804, 0, 1, 1,
0.7983654, 0.8654574, 0.7319329, 0.654902, 0, 1, 1,
0.8022994, -0.1581715, 1.165259, 0.6627451, 0, 1, 1,
0.8069008, -0.6552725, 1.302894, 0.6666667, 0, 1, 1,
0.8098956, -0.4897475, 1.328753, 0.6745098, 0, 1, 1,
0.8103442, 0.1827789, 1.441342, 0.6784314, 0, 1, 1,
0.8130763, -0.07142904, 1.580699, 0.6862745, 0, 1, 1,
0.8135719, 0.1085883, 1.92944, 0.6901961, 0, 1, 1,
0.8180757, 1.418789, 1.167374, 0.6980392, 0, 1, 1,
0.8206716, -0.1846558, 2.734422, 0.7058824, 0, 1, 1,
0.8215602, -0.03785168, 0.5344235, 0.7098039, 0, 1, 1,
0.8247073, 0.5385126, 0.9610958, 0.7176471, 0, 1, 1,
0.8382145, 0.1784728, 0.6517918, 0.7215686, 0, 1, 1,
0.8402741, -0.08128157, 2.702109, 0.7294118, 0, 1, 1,
0.8451305, -0.8269774, 3.276052, 0.7333333, 0, 1, 1,
0.8460271, 0.7825718, 1.18024, 0.7411765, 0, 1, 1,
0.8485618, -1.48737, 2.324194, 0.7450981, 0, 1, 1,
0.8524482, -1.700423, 3.589122, 0.7529412, 0, 1, 1,
0.8556203, -0.8436324, 2.840683, 0.7568628, 0, 1, 1,
0.8566667, -1.323195, 2.090122, 0.7647059, 0, 1, 1,
0.8567907, -0.2559588, 1.267382, 0.7686275, 0, 1, 1,
0.8613595, -0.06474279, 1.035827, 0.7764706, 0, 1, 1,
0.8670987, 0.05208078, 1.835057, 0.7803922, 0, 1, 1,
0.8675838, 0.5687566, 0.642358, 0.7882353, 0, 1, 1,
0.869127, -0.6674625, 2.812349, 0.7921569, 0, 1, 1,
0.8698177, -0.4972215, 2.296527, 0.8, 0, 1, 1,
0.8711269, 0.03494376, 0.426451, 0.8078431, 0, 1, 1,
0.8725289, 0.4904918, 1.526964, 0.8117647, 0, 1, 1,
0.878742, -0.8015979, 3.558775, 0.8196079, 0, 1, 1,
0.8838, -1.217842, 0.5073358, 0.8235294, 0, 1, 1,
0.8838123, -0.9241688, 1.683418, 0.8313726, 0, 1, 1,
0.8851201, 0.2083456, 0.3858256, 0.8352941, 0, 1, 1,
0.8919575, -0.8194284, 3.430841, 0.8431373, 0, 1, 1,
0.8949724, 0.9317114, 0.180722, 0.8470588, 0, 1, 1,
0.8980229, -0.4934591, 0.547385, 0.854902, 0, 1, 1,
0.9028928, 1.09399, 0.4491293, 0.8588235, 0, 1, 1,
0.9106554, 1.201333, -0.6071455, 0.8666667, 0, 1, 1,
0.9172807, 0.5213945, -1.340194, 0.8705882, 0, 1, 1,
0.924284, 1.699845, 0.1207623, 0.8784314, 0, 1, 1,
0.9318887, 1.22362, 2.167218, 0.8823529, 0, 1, 1,
0.9338266, -0.2682794, 3.543769, 0.8901961, 0, 1, 1,
0.9386288, 0.753758, 0.9604897, 0.8941177, 0, 1, 1,
0.9492537, -0.04245949, 1.348313, 0.9019608, 0, 1, 1,
0.9666791, -0.4317066, 1.091886, 0.9098039, 0, 1, 1,
0.9693434, -1.511181, 1.78341, 0.9137255, 0, 1, 1,
0.969547, 1.581853, 1.573011, 0.9215686, 0, 1, 1,
0.9730494, 0.7962119, 0.1144355, 0.9254902, 0, 1, 1,
0.9730942, 0.9579248, 0.05569313, 0.9333333, 0, 1, 1,
0.9766402, -1.664696, 1.517133, 0.9372549, 0, 1, 1,
0.9841313, -1.223487, 2.408953, 0.945098, 0, 1, 1,
0.9852696, -0.04522157, 2.942771, 0.9490196, 0, 1, 1,
0.9854341, -0.110072, 2.86213, 0.9568627, 0, 1, 1,
0.9897, -0.4707083, 2.14259, 0.9607843, 0, 1, 1,
0.9900858, -0.8671607, 1.866165, 0.9686275, 0, 1, 1,
0.9916835, -0.05896999, 0.703507, 0.972549, 0, 1, 1,
0.9925909, 0.5857822, 1.169784, 0.9803922, 0, 1, 1,
0.9926196, 0.2180603, 2.202635, 0.9843137, 0, 1, 1,
0.9937948, -1.668885, 2.216445, 0.9921569, 0, 1, 1,
0.9959037, -0.160439, 2.921174, 0.9960784, 0, 1, 1,
1.001422, -1.415064, 2.202892, 1, 0, 0.9960784, 1,
1.003132, -0.2514572, 1.844594, 1, 0, 0.9882353, 1,
1.003837, 1.536926, 1.340447, 1, 0, 0.9843137, 1,
1.007678, -1.253335, 2.984204, 1, 0, 0.9764706, 1,
1.017567, -1.480596, 2.143054, 1, 0, 0.972549, 1,
1.020118, -2.439188, 0.9034214, 1, 0, 0.9647059, 1,
1.025213, -1.444577, 3.233435, 1, 0, 0.9607843, 1,
1.026548, -2.510828, 2.655471, 1, 0, 0.9529412, 1,
1.030719, -0.4210732, 1.971088, 1, 0, 0.9490196, 1,
1.038038, -0.2988472, 2.793662, 1, 0, 0.9411765, 1,
1.041372, -0.397003, 1.848445, 1, 0, 0.9372549, 1,
1.04317, -0.9606846, 2.300222, 1, 0, 0.9294118, 1,
1.050716, -1.414786, 2.726284, 1, 0, 0.9254902, 1,
1.051799, -1.1671, 2.282202, 1, 0, 0.9176471, 1,
1.054586, 0.3266756, 0.5953727, 1, 0, 0.9137255, 1,
1.056997, 0.9124555, 0.6794689, 1, 0, 0.9058824, 1,
1.060069, 0.009930497, 2.211734, 1, 0, 0.9019608, 1,
1.063252, -0.8117351, 2.954402, 1, 0, 0.8941177, 1,
1.069298, 0.3190863, 1.635285, 1, 0, 0.8862745, 1,
1.078481, -0.7723686, 3.016366, 1, 0, 0.8823529, 1,
1.079201, -1.811245, 1.871196, 1, 0, 0.8745098, 1,
1.090202, -1.225633, 4.187382, 1, 0, 0.8705882, 1,
1.09799, -0.06727514, 2.249126, 1, 0, 0.8627451, 1,
1.098474, 2.10007, 2.721128, 1, 0, 0.8588235, 1,
1.102209, 2.140761, -0.4489941, 1, 0, 0.8509804, 1,
1.103067, -0.1192948, 2.851544, 1, 0, 0.8470588, 1,
1.106208, 0.8920406, 1.124272, 1, 0, 0.8392157, 1,
1.106804, 0.4372721, 1.495066, 1, 0, 0.8352941, 1,
1.115279, -0.2575889, 1.65341, 1, 0, 0.827451, 1,
1.119277, 1.082876, 1.9045, 1, 0, 0.8235294, 1,
1.125556, -0.6716915, 2.879488, 1, 0, 0.8156863, 1,
1.125614, 0.4002319, 1.79889, 1, 0, 0.8117647, 1,
1.127029, 0.2401964, 1.816107, 1, 0, 0.8039216, 1,
1.127205, 0.6905053, 0.7405816, 1, 0, 0.7960784, 1,
1.138052, 0.4516872, 2.365988, 1, 0, 0.7921569, 1,
1.14327, 0.8073215, 0.02494634, 1, 0, 0.7843137, 1,
1.152242, 0.8768557, 0.3795285, 1, 0, 0.7803922, 1,
1.15323, -1.185657, 1.64257, 1, 0, 0.772549, 1,
1.157438, -0.001981283, 3.052396, 1, 0, 0.7686275, 1,
1.16166, -0.5508428, 1.443141, 1, 0, 0.7607843, 1,
1.16266, 1.624152, 1.147461, 1, 0, 0.7568628, 1,
1.16641, 1.894141, 1.109862, 1, 0, 0.7490196, 1,
1.168299, 0.5884187, 0.3545178, 1, 0, 0.7450981, 1,
1.174954, -0.8674046, 2.609676, 1, 0, 0.7372549, 1,
1.176183, 1.369694, -0.3686619, 1, 0, 0.7333333, 1,
1.188403, -0.9875544, 1.940797, 1, 0, 0.7254902, 1,
1.190949, -0.5972716, 2.484172, 1, 0, 0.7215686, 1,
1.191597, -1.0583, 3.013948, 1, 0, 0.7137255, 1,
1.199967, -0.9902581, 0.5716386, 1, 0, 0.7098039, 1,
1.200038, 1.846737, 1.163679, 1, 0, 0.7019608, 1,
1.218147, -0.1068872, 3.04594, 1, 0, 0.6941177, 1,
1.221812, 0.2770635, 2.581341, 1, 0, 0.6901961, 1,
1.233304, 0.7894543, -1.174831, 1, 0, 0.682353, 1,
1.236186, 0.7304118, 0.4279098, 1, 0, 0.6784314, 1,
1.239202, 0.1373625, 1.519271, 1, 0, 0.6705883, 1,
1.243789, 2.156305, -0.9910938, 1, 0, 0.6666667, 1,
1.255498, 0.6739751, 1.461016, 1, 0, 0.6588235, 1,
1.259882, -0.860078, 3.833759, 1, 0, 0.654902, 1,
1.262072, 0.7639699, 0.3379678, 1, 0, 0.6470588, 1,
1.280441, -0.1149128, 3.398787, 1, 0, 0.6431373, 1,
1.302554, -0.6910864, 2.202847, 1, 0, 0.6352941, 1,
1.307223, -1.072206, 1.853159, 1, 0, 0.6313726, 1,
1.316433, -1.904983, 1.076049, 1, 0, 0.6235294, 1,
1.316788, 0.08901895, 2.167845, 1, 0, 0.6196079, 1,
1.324231, 0.4671292, 2.387903, 1, 0, 0.6117647, 1,
1.331303, -1.075827, 1.166385, 1, 0, 0.6078432, 1,
1.331655, 1.443, 1.026595, 1, 0, 0.6, 1,
1.33526, 1.335663, -0.255434, 1, 0, 0.5921569, 1,
1.340101, 0.3816834, 1.224571, 1, 0, 0.5882353, 1,
1.371063, -1.42086, 2.292902, 1, 0, 0.5803922, 1,
1.372129, -0.4599914, 2.953892, 1, 0, 0.5764706, 1,
1.384042, 0.3537996, 1.187304, 1, 0, 0.5686275, 1,
1.387089, -0.04860927, 1.828586, 1, 0, 0.5647059, 1,
1.394035, -1.020805, 2.660104, 1, 0, 0.5568628, 1,
1.399832, -1.680181, 2.384082, 1, 0, 0.5529412, 1,
1.423216, -0.08626213, 0.1940191, 1, 0, 0.5450981, 1,
1.42455, -1.028088, 1.392855, 1, 0, 0.5411765, 1,
1.43298, 1.175191, 0.7364568, 1, 0, 0.5333334, 1,
1.435146, 0.6655384, 2.213787, 1, 0, 0.5294118, 1,
1.436658, 1.139171, 0.549644, 1, 0, 0.5215687, 1,
1.448764, -0.1544053, 1.647534, 1, 0, 0.5176471, 1,
1.458066, 0.5841198, -0.5480511, 1, 0, 0.509804, 1,
1.463225, 0.01557949, 0.9412031, 1, 0, 0.5058824, 1,
1.464437, 0.129939, 1.326955, 1, 0, 0.4980392, 1,
1.476246, -0.02494627, -0.778473, 1, 0, 0.4901961, 1,
1.476481, 0.8971563, 1.811556, 1, 0, 0.4862745, 1,
1.48348, -0.8053468, 1.065255, 1, 0, 0.4784314, 1,
1.48721, -0.8889982, 2.053668, 1, 0, 0.4745098, 1,
1.489929, 0.4406166, 0.5562317, 1, 0, 0.4666667, 1,
1.491655, 0.5213997, 2.072059, 1, 0, 0.4627451, 1,
1.495892, 1.247871, 0.5063704, 1, 0, 0.454902, 1,
1.502501, 0.02401021, 1.936288, 1, 0, 0.4509804, 1,
1.502708, 0.3725207, 1.145216, 1, 0, 0.4431373, 1,
1.516175, -0.3140799, 3.310878, 1, 0, 0.4392157, 1,
1.555171, -0.1471096, 0.5752935, 1, 0, 0.4313726, 1,
1.576881, -0.6894701, 2.340625, 1, 0, 0.427451, 1,
1.581106, -0.2044735, -1.59227, 1, 0, 0.4196078, 1,
1.586829, 1.447836, -0.3017736, 1, 0, 0.4156863, 1,
1.590084, 0.3105257, 1.753416, 1, 0, 0.4078431, 1,
1.595214, -1.46053, -0.1430442, 1, 0, 0.4039216, 1,
1.596987, 1.139936, -0.03213046, 1, 0, 0.3960784, 1,
1.609205, -2.00753, 2.354637, 1, 0, 0.3882353, 1,
1.612785, 0.7029064, 0.3737274, 1, 0, 0.3843137, 1,
1.620297, 0.615344, 0.463249, 1, 0, 0.3764706, 1,
1.622731, -0.7786919, 1.987089, 1, 0, 0.372549, 1,
1.634955, -0.03670929, 1.727839, 1, 0, 0.3647059, 1,
1.658187, -0.4310539, 0.9980362, 1, 0, 0.3607843, 1,
1.660041, 1.704204, 0.3836479, 1, 0, 0.3529412, 1,
1.693899, -1.303266, 1.269028, 1, 0, 0.3490196, 1,
1.698841, 0.2937297, 2.547118, 1, 0, 0.3411765, 1,
1.700204, -0.03336314, 1.342829, 1, 0, 0.3372549, 1,
1.706673, -0.3003351, 0.1651022, 1, 0, 0.3294118, 1,
1.711254, 0.08436615, -0.6278951, 1, 0, 0.3254902, 1,
1.726078, 0.8528316, 0.4395758, 1, 0, 0.3176471, 1,
1.749136, -1.016634, 2.079131, 1, 0, 0.3137255, 1,
1.756473, 2.197027, 0.446356, 1, 0, 0.3058824, 1,
1.767737, 1.285635, 0.3470278, 1, 0, 0.2980392, 1,
1.788967, -1.201506, 2.352854, 1, 0, 0.2941177, 1,
1.810986, 0.8405615, 0.05650267, 1, 0, 0.2862745, 1,
1.817849, -2.53093, 1.777656, 1, 0, 0.282353, 1,
1.84818, -1.710364, 3.457663, 1, 0, 0.2745098, 1,
1.869578, 0.3594054, -0.4899242, 1, 0, 0.2705882, 1,
1.874959, 0.6169643, 0.4757486, 1, 0, 0.2627451, 1,
1.912113, -1.763105, 2.702245, 1, 0, 0.2588235, 1,
1.918266, -0.4212704, 1.927362, 1, 0, 0.2509804, 1,
1.91882, 0.8083479, -0.3801732, 1, 0, 0.2470588, 1,
1.93587, -2.529616, 3.476783, 1, 0, 0.2392157, 1,
1.957802, -0.8623258, 0.4932213, 1, 0, 0.2352941, 1,
1.959047, -0.8261378, 2.062967, 1, 0, 0.227451, 1,
1.973797, 1.079081, 1.248594, 1, 0, 0.2235294, 1,
2.008143, -1.288887, 1.730282, 1, 0, 0.2156863, 1,
2.041624, 1.622215, -0.4169389, 1, 0, 0.2117647, 1,
2.048942, -1.353168, 3.319657, 1, 0, 0.2039216, 1,
2.049695, -0.2478683, 1.11614, 1, 0, 0.1960784, 1,
2.054575, -1.117994, 2.64631, 1, 0, 0.1921569, 1,
2.064259, -0.6195913, 3.429489, 1, 0, 0.1843137, 1,
2.080881, 1.36746, 0.6949654, 1, 0, 0.1803922, 1,
2.091847, 1.920533, -0.3267464, 1, 0, 0.172549, 1,
2.145046, 0.7895538, -0.8592398, 1, 0, 0.1686275, 1,
2.149855, 0.9759485, 2.97723, 1, 0, 0.1607843, 1,
2.169601, 1.508148, 1.086506, 1, 0, 0.1568628, 1,
2.169602, 0.08054243, 5.188451, 1, 0, 0.1490196, 1,
2.260525, -1.369365, 0.8123981, 1, 0, 0.145098, 1,
2.266836, 1.384124, -0.3147304, 1, 0, 0.1372549, 1,
2.293885, -1.019704, 1.902649, 1, 0, 0.1333333, 1,
2.296311, -1.230103, 2.408846, 1, 0, 0.1254902, 1,
2.296511, 1.292029, 1.369777, 1, 0, 0.1215686, 1,
2.368855, 0.2573099, 1.69478, 1, 0, 0.1137255, 1,
2.38799, 1.136569, 1.741782, 1, 0, 0.1098039, 1,
2.431645, -0.09138845, 4.072109, 1, 0, 0.1019608, 1,
2.470718, 2.194877, 0.6746299, 1, 0, 0.09411765, 1,
2.48991, -0.9756402, 2.708501, 1, 0, 0.09019608, 1,
2.506041, 1.566977, 0.5987914, 1, 0, 0.08235294, 1,
2.524251, -2.099886, 2.13028, 1, 0, 0.07843138, 1,
2.56234, -0.7501662, 1.895476, 1, 0, 0.07058824, 1,
2.579376, 0.7633464, 1.376266, 1, 0, 0.06666667, 1,
2.631296, -1.386575, 1.370099, 1, 0, 0.05882353, 1,
2.734583, 0.9624116, 0.7493701, 1, 0, 0.05490196, 1,
2.786504, -1.069631, 1.189098, 1, 0, 0.04705882, 1,
2.819549, 1.829053, 1.019748, 1, 0, 0.04313726, 1,
2.819987, 0.8513881, 1.866863, 1, 0, 0.03529412, 1,
2.836646, 0.5712814, 0.3267658, 1, 0, 0.03137255, 1,
2.842789, -0.02887846, 1.183788, 1, 0, 0.02352941, 1,
3.032165, -0.03013651, 1.02494, 1, 0, 0.01960784, 1,
3.269217, 0.1250534, 0.7530001, 1, 0, 0.01176471, 1,
3.335495, -0.6095167, 1.651944, 1, 0, 0.007843138, 1
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
-0.1299915, -4.908023, -7.339565, 0, -0.5, 0.5, 0.5,
-0.1299915, -4.908023, -7.339565, 1, -0.5, 0.5, 0.5,
-0.1299915, -4.908023, -7.339565, 1, 1.5, 0.5, 0.5,
-0.1299915, -4.908023, -7.339565, 0, 1.5, 0.5, 0.5
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
-4.770278, 0.08478999, -7.339565, 0, -0.5, 0.5, 0.5,
-4.770278, 0.08478999, -7.339565, 1, -0.5, 0.5, 0.5,
-4.770278, 0.08478999, -7.339565, 1, 1.5, 0.5, 0.5,
-4.770278, 0.08478999, -7.339565, 0, 1.5, 0.5, 0.5
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
-4.770278, -4.908023, 0.0942359, 0, -0.5, 0.5, 0.5,
-4.770278, -4.908023, 0.0942359, 1, -0.5, 0.5, 0.5,
-4.770278, -4.908023, 0.0942359, 1, 1.5, 0.5, 0.5,
-4.770278, -4.908023, 0.0942359, 0, 1.5, 0.5, 0.5
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
-3, -3.755836, -5.624072,
3, -3.755836, -5.624072,
-3, -3.755836, -5.624072,
-3, -3.947867, -5.909987,
-2, -3.755836, -5.624072,
-2, -3.947867, -5.909987,
-1, -3.755836, -5.624072,
-1, -3.947867, -5.909987,
0, -3.755836, -5.624072,
0, -3.947867, -5.909987,
1, -3.755836, -5.624072,
1, -3.947867, -5.909987,
2, -3.755836, -5.624072,
2, -3.947867, -5.909987,
3, -3.755836, -5.624072,
3, -3.947867, -5.909987
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
-3, -4.331929, -6.481818, 0, -0.5, 0.5, 0.5,
-3, -4.331929, -6.481818, 1, -0.5, 0.5, 0.5,
-3, -4.331929, -6.481818, 1, 1.5, 0.5, 0.5,
-3, -4.331929, -6.481818, 0, 1.5, 0.5, 0.5,
-2, -4.331929, -6.481818, 0, -0.5, 0.5, 0.5,
-2, -4.331929, -6.481818, 1, -0.5, 0.5, 0.5,
-2, -4.331929, -6.481818, 1, 1.5, 0.5, 0.5,
-2, -4.331929, -6.481818, 0, 1.5, 0.5, 0.5,
-1, -4.331929, -6.481818, 0, -0.5, 0.5, 0.5,
-1, -4.331929, -6.481818, 1, -0.5, 0.5, 0.5,
-1, -4.331929, -6.481818, 1, 1.5, 0.5, 0.5,
-1, -4.331929, -6.481818, 0, 1.5, 0.5, 0.5,
0, -4.331929, -6.481818, 0, -0.5, 0.5, 0.5,
0, -4.331929, -6.481818, 1, -0.5, 0.5, 0.5,
0, -4.331929, -6.481818, 1, 1.5, 0.5, 0.5,
0, -4.331929, -6.481818, 0, 1.5, 0.5, 0.5,
1, -4.331929, -6.481818, 0, -0.5, 0.5, 0.5,
1, -4.331929, -6.481818, 1, -0.5, 0.5, 0.5,
1, -4.331929, -6.481818, 1, 1.5, 0.5, 0.5,
1, -4.331929, -6.481818, 0, 1.5, 0.5, 0.5,
2, -4.331929, -6.481818, 0, -0.5, 0.5, 0.5,
2, -4.331929, -6.481818, 1, -0.5, 0.5, 0.5,
2, -4.331929, -6.481818, 1, 1.5, 0.5, 0.5,
2, -4.331929, -6.481818, 0, 1.5, 0.5, 0.5,
3, -4.331929, -6.481818, 0, -0.5, 0.5, 0.5,
3, -4.331929, -6.481818, 1, -0.5, 0.5, 0.5,
3, -4.331929, -6.481818, 1, 1.5, 0.5, 0.5,
3, -4.331929, -6.481818, 0, 1.5, 0.5, 0.5
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
-3.699443, -2, -5.624072,
-3.699443, 2, -5.624072,
-3.699443, -2, -5.624072,
-3.877915, -2, -5.909987,
-3.699443, 0, -5.624072,
-3.877915, 0, -5.909987,
-3.699443, 2, -5.624072,
-3.877915, 2, -5.909987
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
-4.23486, -2, -6.481818, 0, -0.5, 0.5, 0.5,
-4.23486, -2, -6.481818, 1, -0.5, 0.5, 0.5,
-4.23486, -2, -6.481818, 1, 1.5, 0.5, 0.5,
-4.23486, -2, -6.481818, 0, 1.5, 0.5, 0.5,
-4.23486, 0, -6.481818, 0, -0.5, 0.5, 0.5,
-4.23486, 0, -6.481818, 1, -0.5, 0.5, 0.5,
-4.23486, 0, -6.481818, 1, 1.5, 0.5, 0.5,
-4.23486, 0, -6.481818, 0, 1.5, 0.5, 0.5,
-4.23486, 2, -6.481818, 0, -0.5, 0.5, 0.5,
-4.23486, 2, -6.481818, 1, -0.5, 0.5, 0.5,
-4.23486, 2, -6.481818, 1, 1.5, 0.5, 0.5,
-4.23486, 2, -6.481818, 0, 1.5, 0.5, 0.5
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
-3.699443, -3.755836, -4,
-3.699443, -3.755836, 4,
-3.699443, -3.755836, -4,
-3.877915, -3.947867, -4,
-3.699443, -3.755836, -2,
-3.877915, -3.947867, -2,
-3.699443, -3.755836, 0,
-3.877915, -3.947867, 0,
-3.699443, -3.755836, 2,
-3.877915, -3.947867, 2,
-3.699443, -3.755836, 4,
-3.877915, -3.947867, 4
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
-4.23486, -4.331929, -4, 0, -0.5, 0.5, 0.5,
-4.23486, -4.331929, -4, 1, -0.5, 0.5, 0.5,
-4.23486, -4.331929, -4, 1, 1.5, 0.5, 0.5,
-4.23486, -4.331929, -4, 0, 1.5, 0.5, 0.5,
-4.23486, -4.331929, -2, 0, -0.5, 0.5, 0.5,
-4.23486, -4.331929, -2, 1, -0.5, 0.5, 0.5,
-4.23486, -4.331929, -2, 1, 1.5, 0.5, 0.5,
-4.23486, -4.331929, -2, 0, 1.5, 0.5, 0.5,
-4.23486, -4.331929, 0, 0, -0.5, 0.5, 0.5,
-4.23486, -4.331929, 0, 1, -0.5, 0.5, 0.5,
-4.23486, -4.331929, 0, 1, 1.5, 0.5, 0.5,
-4.23486, -4.331929, 0, 0, 1.5, 0.5, 0.5,
-4.23486, -4.331929, 2, 0, -0.5, 0.5, 0.5,
-4.23486, -4.331929, 2, 1, -0.5, 0.5, 0.5,
-4.23486, -4.331929, 2, 1, 1.5, 0.5, 0.5,
-4.23486, -4.331929, 2, 0, 1.5, 0.5, 0.5,
-4.23486, -4.331929, 4, 0, -0.5, 0.5, 0.5,
-4.23486, -4.331929, 4, 1, -0.5, 0.5, 0.5,
-4.23486, -4.331929, 4, 1, 1.5, 0.5, 0.5,
-4.23486, -4.331929, 4, 0, 1.5, 0.5, 0.5
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
-3.699443, -3.755836, -5.624072,
-3.699443, 3.925416, -5.624072,
-3.699443, -3.755836, 5.812544,
-3.699443, 3.925416, 5.812544,
-3.699443, -3.755836, -5.624072,
-3.699443, -3.755836, 5.812544,
-3.699443, 3.925416, -5.624072,
-3.699443, 3.925416, 5.812544,
-3.699443, -3.755836, -5.624072,
3.43946, -3.755836, -5.624072,
-3.699443, -3.755836, 5.812544,
3.43946, -3.755836, 5.812544,
-3.699443, 3.925416, -5.624072,
3.43946, 3.925416, -5.624072,
-3.699443, 3.925416, 5.812544,
3.43946, 3.925416, 5.812544,
3.43946, -3.755836, -5.624072,
3.43946, 3.925416, -5.624072,
3.43946, -3.755836, 5.812544,
3.43946, 3.925416, 5.812544,
3.43946, -3.755836, -5.624072,
3.43946, -3.755836, 5.812544,
3.43946, 3.925416, -5.624072,
3.43946, 3.925416, 5.812544
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
var radius = 8.285509;
var distance = 36.86317;
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
mvMatrix.translate( 0.1299915, -0.08478999, -0.0942359 );
mvMatrix.scale( 1.254879, 1.166276, 0.7833134 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.86317);
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
Calcium_arsenate<-read.table("Calcium_arsenate.xyz")
```

```
## Error in read.table("Calcium_arsenate.xyz"): no lines available in input
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
-3.595478, 1.219755, -0.5438059, 0, 0, 1, 1, 1,
-2.718431, -3.643973, -2.702894, 1, 0, 0, 1, 1,
-2.591275, 1.088254, -0.9876145, 1, 0, 0, 1, 1,
-2.467406, 0.5481725, -1.086791, 1, 0, 0, 1, 1,
-2.461507, 0.6625715, -1.224026, 1, 0, 0, 1, 1,
-2.461136, -0.9019304, -3.381471, 1, 0, 0, 1, 1,
-2.393703, -0.951009, -0.9552064, 0, 0, 0, 1, 1,
-2.387213, -0.7401173, -1.484553, 0, 0, 0, 1, 1,
-2.343565, -1.294048, -3.210564, 0, 0, 0, 1, 1,
-2.316857, -0.8965503, -1.544584, 0, 0, 0, 1, 1,
-2.24752, -0.5132203, -1.312983, 0, 0, 0, 1, 1,
-2.229296, 0.5364805, -2.966359, 0, 0, 0, 1, 1,
-2.228276, 0.6947495, -0.3849258, 0, 0, 0, 1, 1,
-2.192362, -0.697938, -3.864826, 1, 1, 1, 1, 1,
-2.169667, 0.03204598, -1.947564, 1, 1, 1, 1, 1,
-2.12242, 0.3179775, -1.895755, 1, 1, 1, 1, 1,
-1.999476, 0.9958693, -0.4974843, 1, 1, 1, 1, 1,
-1.992325, -1.099875, -2.950826, 1, 1, 1, 1, 1,
-1.977779, -0.7274195, -1.661209, 1, 1, 1, 1, 1,
-1.950186, -0.417304, -1.807237, 1, 1, 1, 1, 1,
-1.945547, -0.3976537, -2.080997, 1, 1, 1, 1, 1,
-1.910369, -1.083185, -1.999472, 1, 1, 1, 1, 1,
-1.900355, 0.7248543, -0.3996834, 1, 1, 1, 1, 1,
-1.853084, 0.7503077, -1.395333, 1, 1, 1, 1, 1,
-1.845302, 0.5793866, -0.9975235, 1, 1, 1, 1, 1,
-1.796373, -0.8591375, -2.717471, 1, 1, 1, 1, 1,
-1.782108, -1.39716, -3.277884, 1, 1, 1, 1, 1,
-1.762633, -0.1460253, -1.378452, 1, 1, 1, 1, 1,
-1.718503, -1.278273, -0.3644084, 0, 0, 1, 1, 1,
-1.697857, -0.4493909, -2.988769, 1, 0, 0, 1, 1,
-1.691979, -1.804764, -1.457534, 1, 0, 0, 1, 1,
-1.686472, -0.09124334, -1.414814, 1, 0, 0, 1, 1,
-1.685624, -0.4839933, -3.301052, 1, 0, 0, 1, 1,
-1.678281, 0.9575263, -1.496691, 1, 0, 0, 1, 1,
-1.675362, -1.008704, -2.427443, 0, 0, 0, 1, 1,
-1.666926, -0.4958824, -2.096853, 0, 0, 0, 1, 1,
-1.656766, -0.0003473235, -1.686023, 0, 0, 0, 1, 1,
-1.649816, -0.05514212, -2.036483, 0, 0, 0, 1, 1,
-1.633384, 0.1023881, -0.03880867, 0, 0, 0, 1, 1,
-1.613286, -1.040535, -3.339212, 0, 0, 0, 1, 1,
-1.605978, 0.6492513, -0.6313854, 0, 0, 0, 1, 1,
-1.591872, 0.7176164, -0.9218634, 1, 1, 1, 1, 1,
-1.57734, -0.7514562, -1.908565, 1, 1, 1, 1, 1,
-1.573321, -2.005524, -1.739575, 1, 1, 1, 1, 1,
-1.525079, -1.11538, -4.862833, 1, 1, 1, 1, 1,
-1.51455, -1.50586, -1.683634, 1, 1, 1, 1, 1,
-1.507551, -0.9478328, -3.580322, 1, 1, 1, 1, 1,
-1.507275, -2.30428, -3.540622, 1, 1, 1, 1, 1,
-1.48949, -0.6758384, -1.362593, 1, 1, 1, 1, 1,
-1.489468, -0.3539499, -3.06716, 1, 1, 1, 1, 1,
-1.477061, -0.1813999, -0.9408444, 1, 1, 1, 1, 1,
-1.468089, -0.2926781, -2.509385, 1, 1, 1, 1, 1,
-1.441812, -0.2447942, -3.274086, 1, 1, 1, 1, 1,
-1.430084, -0.5900757, -0.8456182, 1, 1, 1, 1, 1,
-1.428179, -0.05441298, -1.926938, 1, 1, 1, 1, 1,
-1.418766, 0.2028946, -0.4680435, 1, 1, 1, 1, 1,
-1.402582, -1.862189, -4.197094, 0, 0, 1, 1, 1,
-1.400298, -1.108236, -2.382774, 1, 0, 0, 1, 1,
-1.395439, 0.1224273, -0.3013006, 1, 0, 0, 1, 1,
-1.388362, -0.03280856, -0.8333851, 1, 0, 0, 1, 1,
-1.385779, 1.056833, -0.2571234, 1, 0, 0, 1, 1,
-1.374993, 1.245329, -2.239803, 1, 0, 0, 1, 1,
-1.37307, 0.212666, -0.3589418, 0, 0, 0, 1, 1,
-1.364896, -1.514528, -2.570894, 0, 0, 0, 1, 1,
-1.360005, 0.9146624, 0.8226892, 0, 0, 0, 1, 1,
-1.356718, 1.072421, -2.636939, 0, 0, 0, 1, 1,
-1.349961, -0.02749889, -0.07136524, 0, 0, 0, 1, 1,
-1.349432, 0.5593274, -0.07752769, 0, 0, 0, 1, 1,
-1.345064, 1.173584, 0.03503275, 0, 0, 0, 1, 1,
-1.339017, -0.4047479, -3.175548, 1, 1, 1, 1, 1,
-1.338478, 0.4288004, -2.077789, 1, 1, 1, 1, 1,
-1.335562, 0.5056857, -1.809502, 1, 1, 1, 1, 1,
-1.326788, 2.041032, -2.127075, 1, 1, 1, 1, 1,
-1.323498, 0.7424991, -1.161613, 1, 1, 1, 1, 1,
-1.316005, 0.7367169, 0.00944468, 1, 1, 1, 1, 1,
-1.314471, 0.2529398, -2.500798, 1, 1, 1, 1, 1,
-1.310058, -0.2476431, -1.930548, 1, 1, 1, 1, 1,
-1.308005, -1.36149, -3.516079, 1, 1, 1, 1, 1,
-1.298413, 0.6019563, -2.030888, 1, 1, 1, 1, 1,
-1.295289, 1.630208, 0.3669157, 1, 1, 1, 1, 1,
-1.292657, 1.229265, 0.0939621, 1, 1, 1, 1, 1,
-1.290133, 0.9579682, -0.4150233, 1, 1, 1, 1, 1,
-1.28503, 0.007682153, -2.898427, 1, 1, 1, 1, 1,
-1.265834, 0.5678532, -0.1473381, 1, 1, 1, 1, 1,
-1.262957, 1.389435, -2.827474, 0, 0, 1, 1, 1,
-1.257193, 0.8733786, -0.3295839, 1, 0, 0, 1, 1,
-1.238172, 0.5917566, -1.730233, 1, 0, 0, 1, 1,
-1.233911, 0.2413812, -0.8065496, 1, 0, 0, 1, 1,
-1.232152, 0.8060287, -0.7783648, 1, 0, 0, 1, 1,
-1.229089, -0.440328, -1.60961, 1, 0, 0, 1, 1,
-1.225557, 0.333112, -0.9360401, 0, 0, 0, 1, 1,
-1.223921, -0.9550491, -0.7151283, 0, 0, 0, 1, 1,
-1.174842, 1.376677, 0.0288813, 0, 0, 0, 1, 1,
-1.172472, -0.08101963, -2.378169, 0, 0, 0, 1, 1,
-1.171762, -1.154152, -1.594384, 0, 0, 0, 1, 1,
-1.167314, 0.3407799, -0.8711201, 0, 0, 0, 1, 1,
-1.164921, 0.5629091, -0.2345137, 0, 0, 0, 1, 1,
-1.163982, -0.745759, -2.596923, 1, 1, 1, 1, 1,
-1.160248, 0.1524995, -2.574192, 1, 1, 1, 1, 1,
-1.15872, 1.011767, -1.753751, 1, 1, 1, 1, 1,
-1.158516, 0.4886747, -1.028811, 1, 1, 1, 1, 1,
-1.157248, -0.1046842, -1.6957, 1, 1, 1, 1, 1,
-1.156276, -2.082153, -5.119245, 1, 1, 1, 1, 1,
-1.154499, -0.4593037, -3.153475, 1, 1, 1, 1, 1,
-1.141198, 1.692577, -0.8589298, 1, 1, 1, 1, 1,
-1.141023, 0.3932039, -0.6427203, 1, 1, 1, 1, 1,
-1.137267, 0.03824594, -1.636648, 1, 1, 1, 1, 1,
-1.114075, -0.2653244, -3.028642, 1, 1, 1, 1, 1,
-1.108093, 0.595157, -0.320911, 1, 1, 1, 1, 1,
-1.1067, -0.3324206, -2.335855, 1, 1, 1, 1, 1,
-1.105571, 0.1864352, -0.9589839, 1, 1, 1, 1, 1,
-1.105119, 0.9160048, -1.211273, 1, 1, 1, 1, 1,
-1.0979, -0.6092743, -2.986379, 0, 0, 1, 1, 1,
-1.089824, -0.6977689, -3.535765, 1, 0, 0, 1, 1,
-1.08541, 0.8018693, -1.323398, 1, 0, 0, 1, 1,
-1.083257, 0.1067497, -2.180622, 1, 0, 0, 1, 1,
-1.082021, -0.4253275, -3.788291, 1, 0, 0, 1, 1,
-1.079434, -0.4224767, -2.162063, 1, 0, 0, 1, 1,
-1.073915, -1.220729, -2.590721, 0, 0, 0, 1, 1,
-1.068067, 0.9431561, -2.355006, 0, 0, 0, 1, 1,
-1.066889, -1.62369, -2.499356, 0, 0, 0, 1, 1,
-1.062923, 1.162116, -0.3647046, 0, 0, 0, 1, 1,
-1.046216, -0.8666781, -1.81191, 0, 0, 0, 1, 1,
-1.046106, 0.649774, 0.01105305, 0, 0, 0, 1, 1,
-1.040579, 0.1263378, -0.8883105, 0, 0, 0, 1, 1,
-1.033302, -1.050021, -1.52658, 1, 1, 1, 1, 1,
-1.033143, -1.111007, -0.6585451, 1, 1, 1, 1, 1,
-1.030206, -1.375104, -2.342468, 1, 1, 1, 1, 1,
-1.027063, 0.7208288, -0.2380978, 1, 1, 1, 1, 1,
-1.025507, 0.01556823, -1.12535, 1, 1, 1, 1, 1,
-1.025114, 0.5778449, -1.431721, 1, 1, 1, 1, 1,
-1.016785, -3.359855, -2.535841, 1, 1, 1, 1, 1,
-1.015741, 0.8152215, -0.2121027, 1, 1, 1, 1, 1,
-1.013619, 0.6693206, -2.463768, 1, 1, 1, 1, 1,
-1.010123, 0.02792395, -0.5457215, 1, 1, 1, 1, 1,
-1.007797, 1.220157, -2.421527, 1, 1, 1, 1, 1,
-0.9939376, -1.015527, -4.643232, 1, 1, 1, 1, 1,
-0.9862733, 0.539881, -0.7645448, 1, 1, 1, 1, 1,
-0.9837742, -0.8114608, -3.292329, 1, 1, 1, 1, 1,
-0.9813678, -0.886038, -3.284181, 1, 1, 1, 1, 1,
-0.9785528, -0.2018087, 0.1418836, 0, 0, 1, 1, 1,
-0.9779107, 0.1450893, -1.965436, 1, 0, 0, 1, 1,
-0.9776165, 1.553709, -1.041689, 1, 0, 0, 1, 1,
-0.9775543, -0.9616453, -1.680211, 1, 0, 0, 1, 1,
-0.9763194, -0.4495697, -1.725787, 1, 0, 0, 1, 1,
-0.9717784, 0.8255937, -0.7678728, 1, 0, 0, 1, 1,
-0.9685418, 1.301678, -1.772868, 0, 0, 0, 1, 1,
-0.9603938, -0.6564624, -2.049483, 0, 0, 0, 1, 1,
-0.9591955, -1.628476, -2.03947, 0, 0, 0, 1, 1,
-0.9552594, 0.5424484, -0.9832996, 0, 0, 0, 1, 1,
-0.9547155, -0.474239, 0.9098727, 0, 0, 0, 1, 1,
-0.9538614, 0.4554933, -1.365933, 0, 0, 0, 1, 1,
-0.9362449, -0.1421255, -2.206845, 0, 0, 0, 1, 1,
-0.9350928, -2.434003, -2.271555, 1, 1, 1, 1, 1,
-0.9345394, -1.149365, -2.196205, 1, 1, 1, 1, 1,
-0.930434, 1.461047, -0.4254509, 1, 1, 1, 1, 1,
-0.928219, 0.08431769, -2.161608, 1, 1, 1, 1, 1,
-0.9274594, -1.243186, -2.343775, 1, 1, 1, 1, 1,
-0.9122102, -0.8004797, -2.599614, 1, 1, 1, 1, 1,
-0.9079055, 1.273597, -1.545966, 1, 1, 1, 1, 1,
-0.9065902, -0.4936222, -2.459703, 1, 1, 1, 1, 1,
-0.9062786, 0.9462775, -1.771853, 1, 1, 1, 1, 1,
-0.8900132, -1.418502, -2.309727, 1, 1, 1, 1, 1,
-0.887233, 0.6047593, -1.403752, 1, 1, 1, 1, 1,
-0.8795991, -1.939899, -2.394988, 1, 1, 1, 1, 1,
-0.8781688, 0.01278106, -3.319212, 1, 1, 1, 1, 1,
-0.8769035, -1.716484, -2.095478, 1, 1, 1, 1, 1,
-0.8762765, -0.4209207, -0.131074, 1, 1, 1, 1, 1,
-0.874376, -0.2589346, -0.6965192, 0, 0, 1, 1, 1,
-0.8698514, 1.648081, -0.0002532427, 1, 0, 0, 1, 1,
-0.8673756, 0.4691541, -0.8460698, 1, 0, 0, 1, 1,
-0.860073, -1.526401, -1.361658, 1, 0, 0, 1, 1,
-0.8575767, -1.100823, -1.754634, 1, 0, 0, 1, 1,
-0.8476635, 1.092974, -2.684958, 1, 0, 0, 1, 1,
-0.8357149, 0.7605897, -1.013851, 0, 0, 0, 1, 1,
-0.8327616, 0.1175292, -2.101609, 0, 0, 0, 1, 1,
-0.8303539, 1.147511, -1.849525, 0, 0, 0, 1, 1,
-0.8254733, 0.7155702, -2.591292, 0, 0, 0, 1, 1,
-0.8239177, -0.08454347, -1.190233, 0, 0, 0, 1, 1,
-0.8211991, -0.816586, -2.874226, 0, 0, 0, 1, 1,
-0.8205884, -0.713016, -3.028053, 0, 0, 0, 1, 1,
-0.8204557, -0.62878, -4.716641, 1, 1, 1, 1, 1,
-0.8199146, -0.522238, -1.627394, 1, 1, 1, 1, 1,
-0.8181781, -0.9591519, -1.71592, 1, 1, 1, 1, 1,
-0.8091872, -1.404789, -2.953989, 1, 1, 1, 1, 1,
-0.8081574, 0.7994568, -1.539542, 1, 1, 1, 1, 1,
-0.8030989, 0.9159597, -0.9209653, 1, 1, 1, 1, 1,
-0.8001463, -1.393359, -1.616466, 1, 1, 1, 1, 1,
-0.7981347, -0.8352812, -2.484079, 1, 1, 1, 1, 1,
-0.7978201, 0.06920701, -1.866984, 1, 1, 1, 1, 1,
-0.7890535, -2.098843, -3.09904, 1, 1, 1, 1, 1,
-0.7869194, -0.03003886, -1.961269, 1, 1, 1, 1, 1,
-0.781691, 0.4432208, -0.2165893, 1, 1, 1, 1, 1,
-0.7795808, 0.4663569, -1.201472, 1, 1, 1, 1, 1,
-0.777835, -0.4537306, -1.859427, 1, 1, 1, 1, 1,
-0.7778163, -0.5047825, -4.661044, 1, 1, 1, 1, 1,
-0.7681694, -0.4030359, -0.06596944, 0, 0, 1, 1, 1,
-0.7662506, 1.714943, 0.1838338, 1, 0, 0, 1, 1,
-0.764792, 1.509609, -0.04610259, 1, 0, 0, 1, 1,
-0.7596511, -0.9481002, -2.72343, 1, 0, 0, 1, 1,
-0.7517099, -1.916153, -2.402276, 1, 0, 0, 1, 1,
-0.7501496, -0.8990076, -3.331383, 1, 0, 0, 1, 1,
-0.7491651, 1.065993, -0.667907, 0, 0, 0, 1, 1,
-0.7467164, 0.1759918, 0.01048801, 0, 0, 0, 1, 1,
-0.7368104, 0.5499893, -0.08512516, 0, 0, 0, 1, 1,
-0.7331756, 0.8896149, -0.563623, 0, 0, 0, 1, 1,
-0.7317768, -0.09454188, -0.1747793, 0, 0, 0, 1, 1,
-0.7313245, 0.7731155, 0.6433356, 0, 0, 0, 1, 1,
-0.7273123, 1.357996, -1.164501, 0, 0, 0, 1, 1,
-0.7229533, 0.2361713, -1.639939, 1, 1, 1, 1, 1,
-0.7132475, -1.64954, -2.491235, 1, 1, 1, 1, 1,
-0.712361, -1.949876, -3.759152, 1, 1, 1, 1, 1,
-0.7111849, -0.3485979, -0.7750819, 1, 1, 1, 1, 1,
-0.7088912, -0.2653776, -2.488253, 1, 1, 1, 1, 1,
-0.7058938, 0.3481764, -0.7947767, 1, 1, 1, 1, 1,
-0.7056772, -0.5563676, -1.066726, 1, 1, 1, 1, 1,
-0.7042255, -1.947, -1.949196, 1, 1, 1, 1, 1,
-0.7008622, 1.044363, -0.889202, 1, 1, 1, 1, 1,
-0.700223, 0.6251518, -3.142634, 1, 1, 1, 1, 1,
-0.6971385, -1.270139, -1.727911, 1, 1, 1, 1, 1,
-0.6941229, -0.2453391, -2.235796, 1, 1, 1, 1, 1,
-0.6867325, -1.271421, -2.484671, 1, 1, 1, 1, 1,
-0.6860383, -1.013703, -2.243911, 1, 1, 1, 1, 1,
-0.673921, 0.1686414, -0.80569, 1, 1, 1, 1, 1,
-0.6713719, -1.012469, -1.807054, 0, 0, 1, 1, 1,
-0.6637928, -0.02034859, -1.618465, 1, 0, 0, 1, 1,
-0.6635447, -0.085501, -2.088547, 1, 0, 0, 1, 1,
-0.6633559, -0.7047485, -4.872191, 1, 0, 0, 1, 1,
-0.658293, -0.1630349, -2.055204, 1, 0, 0, 1, 1,
-0.6580858, 0.2169257, -1.282612, 1, 0, 0, 1, 1,
-0.6579442, 1.760731, 0.2905114, 0, 0, 0, 1, 1,
-0.6573721, 0.9936271, -1.797271, 0, 0, 0, 1, 1,
-0.654816, 0.5683399, 0.4649104, 0, 0, 0, 1, 1,
-0.6535614, 0.1223535, -0.494651, 0, 0, 0, 1, 1,
-0.6530095, 0.5504073, 0.1220627, 0, 0, 0, 1, 1,
-0.6487902, -0.03547206, -1.558094, 0, 0, 0, 1, 1,
-0.6473703, 0.0643139, 0.177095, 0, 0, 0, 1, 1,
-0.6463724, 0.9471415, 0.9554387, 1, 1, 1, 1, 1,
-0.6447039, 0.7611731, -1.129697, 1, 1, 1, 1, 1,
-0.6391695, -0.1133683, -2.669178, 1, 1, 1, 1, 1,
-0.637112, 0.5014389, -1.872515, 1, 1, 1, 1, 1,
-0.6367813, 1.408311, -0.2649846, 1, 1, 1, 1, 1,
-0.6339118, -0.68942, -2.217085, 1, 1, 1, 1, 1,
-0.6336669, 1.414073, -0.1799441, 1, 1, 1, 1, 1,
-0.6277294, 0.5562078, -3.070174, 1, 1, 1, 1, 1,
-0.6261666, -0.4255742, -2.29229, 1, 1, 1, 1, 1,
-0.6257611, -0.7611346, -4.057472, 1, 1, 1, 1, 1,
-0.6218541, -0.01600768, -2.229704, 1, 1, 1, 1, 1,
-0.6209242, 1.340252, 0.04311059, 1, 1, 1, 1, 1,
-0.6208116, 0.06130029, -2.288994, 1, 1, 1, 1, 1,
-0.6174241, 0.767488, -0.7693095, 1, 1, 1, 1, 1,
-0.6157674, 0.3830731, -1.85533, 1, 1, 1, 1, 1,
-0.6153671, 1.86915, -0.03212374, 0, 0, 1, 1, 1,
-0.6103721, 0.3853067, -1.487138, 1, 0, 0, 1, 1,
-0.607317, -0.653331, -0.1780237, 1, 0, 0, 1, 1,
-0.6053599, -1.083384, -2.246151, 1, 0, 0, 1, 1,
-0.6031865, 1.631424, 0.2071785, 1, 0, 0, 1, 1,
-0.6026253, 0.3376126, -2.027653, 1, 0, 0, 1, 1,
-0.5997165, -0.4829253, -2.118366, 0, 0, 0, 1, 1,
-0.5965557, -0.5512404, -2.132124, 0, 0, 0, 1, 1,
-0.5952522, -0.02554735, -1.50239, 0, 0, 0, 1, 1,
-0.5949767, -1.734904, -3.995535, 0, 0, 0, 1, 1,
-0.5896915, -1.020327, -3.770976, 0, 0, 0, 1, 1,
-0.58941, -0.8946086, -2.555808, 0, 0, 0, 1, 1,
-0.5861883, -2.3417, -3.399835, 0, 0, 0, 1, 1,
-0.5858142, 1.038247, -1.756648, 1, 1, 1, 1, 1,
-0.5850365, -0.2567306, -1.645205, 1, 1, 1, 1, 1,
-0.5850301, 0.4951631, 0.7299067, 1, 1, 1, 1, 1,
-0.5828514, 0.8962399, -0.0760382, 1, 1, 1, 1, 1,
-0.5778269, -0.7751645, -2.32233, 1, 1, 1, 1, 1,
-0.5678765, 1.736073, -0.5982145, 1, 1, 1, 1, 1,
-0.5521553, -1.900063, -5.45752, 1, 1, 1, 1, 1,
-0.5423374, 0.2310893, -1.687966, 1, 1, 1, 1, 1,
-0.5414996, 1.430815, 0.5611759, 1, 1, 1, 1, 1,
-0.5409901, -0.5397707, -1.423043, 1, 1, 1, 1, 1,
-0.5391563, 0.4924625, -2.426282, 1, 1, 1, 1, 1,
-0.5381055, -0.8766218, -2.609674, 1, 1, 1, 1, 1,
-0.5368033, -0.3338237, -1.198887, 1, 1, 1, 1, 1,
-0.5360985, -0.4373192, -3.107042, 1, 1, 1, 1, 1,
-0.527458, -1.135586, -1.981081, 1, 1, 1, 1, 1,
-0.5261552, 1.669298, 0.504473, 0, 0, 1, 1, 1,
-0.5256925, -0.4467679, -3.270517, 1, 0, 0, 1, 1,
-0.5253716, 2.02679, 1.266081, 1, 0, 0, 1, 1,
-0.5243743, -0.009477293, 0.337939, 1, 0, 0, 1, 1,
-0.523137, -0.5873218, -3.822117, 1, 0, 0, 1, 1,
-0.5229282, 0.152479, -1.426291, 1, 0, 0, 1, 1,
-0.5181108, 2.187768, 0.7839175, 0, 0, 0, 1, 1,
-0.5153823, -1.857848, -2.928727, 0, 0, 0, 1, 1,
-0.5144423, 0.4094915, -0.3704048, 0, 0, 0, 1, 1,
-0.5131841, -0.7037166, -2.632461, 0, 0, 0, 1, 1,
-0.5070539, -0.4660122, -1.001578, 0, 0, 0, 1, 1,
-0.5055289, 1.582608, 1.242733, 0, 0, 0, 1, 1,
-0.5054437, -1.666989, -2.929224, 0, 0, 0, 1, 1,
-0.503723, -0.8767369, -1.081666, 1, 1, 1, 1, 1,
-0.4975343, -0.9136937, -1.466748, 1, 1, 1, 1, 1,
-0.497341, -0.8981405, -1.619651, 1, 1, 1, 1, 1,
-0.4966667, 0.09161329, 0.6009373, 1, 1, 1, 1, 1,
-0.4923643, -1.550598, -2.946779, 1, 1, 1, 1, 1,
-0.4887187, -0.8945009, -2.245989, 1, 1, 1, 1, 1,
-0.4874882, 1.78529, -1.279967, 1, 1, 1, 1, 1,
-0.4858257, -0.8436086, -4.4769, 1, 1, 1, 1, 1,
-0.4840814, -1.137419, -1.911914, 1, 1, 1, 1, 1,
-0.4776466, 0.07520529, -2.208428, 1, 1, 1, 1, 1,
-0.4774145, -1.199553, -2.913895, 1, 1, 1, 1, 1,
-0.4772784, 1.071768, 0.3572956, 1, 1, 1, 1, 1,
-0.4762469, -0.1468727, -1.622886, 1, 1, 1, 1, 1,
-0.475581, -0.00130367, -2.992359, 1, 1, 1, 1, 1,
-0.475433, 0.02629141, 0.3050887, 1, 1, 1, 1, 1,
-0.4741046, 1.021035, -0.728525, 0, 0, 1, 1, 1,
-0.4727617, 0.873899, -0.9117276, 1, 0, 0, 1, 1,
-0.4714506, -1.687744, -2.55854, 1, 0, 0, 1, 1,
-0.4674484, -0.1281355, -1.424245, 1, 0, 0, 1, 1,
-0.4672436, -0.1239835, -0.8825271, 1, 0, 0, 1, 1,
-0.4659109, 0.5277109, -0.678268, 1, 0, 0, 1, 1,
-0.4646469, -0.2818624, -1.562832, 0, 0, 0, 1, 1,
-0.4626519, 0.4083063, 0.2255911, 0, 0, 0, 1, 1,
-0.4578075, -0.8714615, -1.95055, 0, 0, 0, 1, 1,
-0.4555694, -0.5675135, -1.928098, 0, 0, 0, 1, 1,
-0.4534069, -0.5524561, -3.113633, 0, 0, 0, 1, 1,
-0.4495124, -0.2747502, -2.6406, 0, 0, 0, 1, 1,
-0.4423037, 0.6211607, -0.9246465, 0, 0, 0, 1, 1,
-0.4420319, -0.5577894, -4.507031, 1, 1, 1, 1, 1,
-0.4363031, 1.15708, 0.9447757, 1, 1, 1, 1, 1,
-0.4303905, 1.19505, -1.348174, 1, 1, 1, 1, 1,
-0.4249494, -1.75779, -1.668945, 1, 1, 1, 1, 1,
-0.4236354, -0.07870883, -3.511722, 1, 1, 1, 1, 1,
-0.4189513, -0.2203767, -2.482077, 1, 1, 1, 1, 1,
-0.4142672, 1.919451, -0.8468962, 1, 1, 1, 1, 1,
-0.4133779, -0.09139399, -2.159148, 1, 1, 1, 1, 1,
-0.412837, -0.5520962, -1.970967, 1, 1, 1, 1, 1,
-0.409209, 0.004501804, -1.585963, 1, 1, 1, 1, 1,
-0.3962846, -0.2053609, -2.008913, 1, 1, 1, 1, 1,
-0.3942224, -0.6339775, -2.671419, 1, 1, 1, 1, 1,
-0.391369, -0.1625427, -1.229757, 1, 1, 1, 1, 1,
-0.3846267, 0.558767, -0.4126554, 1, 1, 1, 1, 1,
-0.3806448, 1.900797, 0.08688328, 1, 1, 1, 1, 1,
-0.3778194, 0.7040967, -1.168883, 0, 0, 1, 1, 1,
-0.3698575, 0.7953801, 0.226566, 1, 0, 0, 1, 1,
-0.3691508, 0.03023626, -3.50029, 1, 0, 0, 1, 1,
-0.3671364, -1.074838, -2.060483, 1, 0, 0, 1, 1,
-0.3605784, -0.1356697, -1.781655, 1, 0, 0, 1, 1,
-0.3581547, 0.2703508, 0.004282914, 1, 0, 0, 1, 1,
-0.3577189, 1.657974, 0.5620352, 0, 0, 0, 1, 1,
-0.3567245, -0.5563494, -1.619265, 0, 0, 0, 1, 1,
-0.352007, 0.3501807, -0.8746174, 0, 0, 0, 1, 1,
-0.3509915, -1.231505, -2.873806, 0, 0, 0, 1, 1,
-0.34411, -2.088128, -4.932405, 0, 0, 0, 1, 1,
-0.3426467, -0.4759229, -2.289974, 0, 0, 0, 1, 1,
-0.3385749, 1.450752, -1.354571, 0, 0, 0, 1, 1,
-0.3373491, -1.716105, -0.3261642, 1, 1, 1, 1, 1,
-0.336176, 0.2821547, -0.2966643, 1, 1, 1, 1, 1,
-0.3345675, 0.7470153, -0.4195507, 1, 1, 1, 1, 1,
-0.3321233, -0.9455698, -3.299562, 1, 1, 1, 1, 1,
-0.3304627, -0.6866349, -1.652619, 1, 1, 1, 1, 1,
-0.3274054, -0.7088748, -2.523261, 1, 1, 1, 1, 1,
-0.3270406, 0.4159007, -0.2502341, 1, 1, 1, 1, 1,
-0.3245664, 0.2306586, -1.933621, 1, 1, 1, 1, 1,
-0.3219785, -0.7631227, -2.883726, 1, 1, 1, 1, 1,
-0.3169706, -0.3574702, -2.770824, 1, 1, 1, 1, 1,
-0.3162243, 1.098836, -0.7161229, 1, 1, 1, 1, 1,
-0.3144942, 0.5911959, -0.8189813, 1, 1, 1, 1, 1,
-0.3106975, 0.0121412, -0.997296, 1, 1, 1, 1, 1,
-0.3076462, -0.8862038, -2.494786, 1, 1, 1, 1, 1,
-0.3036602, -0.5308195, -1.601529, 1, 1, 1, 1, 1,
-0.3035318, 0.761151, -1.174693, 0, 0, 1, 1, 1,
-0.3021612, -0.6408729, -3.092121, 1, 0, 0, 1, 1,
-0.2957034, 1.164775, 1.146153, 1, 0, 0, 1, 1,
-0.2944365, 0.4501477, -0.9931418, 1, 0, 0, 1, 1,
-0.2931188, 1.163168, -0.5642676, 1, 0, 0, 1, 1,
-0.2928012, -1.073189, -3.535917, 1, 0, 0, 1, 1,
-0.2920396, -1.206309, -4.45049, 0, 0, 0, 1, 1,
-0.2878568, 0.04846477, -1.422185, 0, 0, 0, 1, 1,
-0.2860315, -0.08244657, 0.08947738, 0, 0, 0, 1, 1,
-0.2855294, -2.063716, -2.27288, 0, 0, 0, 1, 1,
-0.2841742, -1.38847, -2.776944, 0, 0, 0, 1, 1,
-0.283319, 0.7976205, -0.6217928, 0, 0, 0, 1, 1,
-0.281912, 0.8635423, 0.0791251, 0, 0, 0, 1, 1,
-0.2810397, -0.04052467, -1.548557, 1, 1, 1, 1, 1,
-0.280698, 1.377377, 0.6955891, 1, 1, 1, 1, 1,
-0.2692649, -1.570414, -4.179205, 1, 1, 1, 1, 1,
-0.2666725, 1.974545, 0.4942424, 1, 1, 1, 1, 1,
-0.2580935, 0.07627039, -1.229205, 1, 1, 1, 1, 1,
-0.2554342, -1.319691, -0.8502125, 1, 1, 1, 1, 1,
-0.2520999, 0.01777682, -0.277294, 1, 1, 1, 1, 1,
-0.2487988, 2.039907, -0.1835365, 1, 1, 1, 1, 1,
-0.2472734, 0.05964262, -1.2571, 1, 1, 1, 1, 1,
-0.2427873, -0.2355749, -0.8008537, 1, 1, 1, 1, 1,
-0.2386648, 0.2962196, -1.494378, 1, 1, 1, 1, 1,
-0.237222, 1.933237, -0.1197084, 1, 1, 1, 1, 1,
-0.2356668, -0.4308482, -4.318392, 1, 1, 1, 1, 1,
-0.2319939, 1.855103, 0.8347844, 1, 1, 1, 1, 1,
-0.2250306, -0.1906883, -1.970444, 1, 1, 1, 1, 1,
-0.2243573, -2.146781, -3.699605, 0, 0, 1, 1, 1,
-0.2231471, -0.4265961, -2.433792, 1, 0, 0, 1, 1,
-0.2212142, 1.05698, -2.052688, 1, 0, 0, 1, 1,
-0.2184389, -0.4133863, -4.196367, 1, 0, 0, 1, 1,
-0.2184043, 0.1436251, -0.8943933, 1, 0, 0, 1, 1,
-0.2147418, 0.3204902, -1.263043, 1, 0, 0, 1, 1,
-0.2136452, -0.8058705, -3.485759, 0, 0, 0, 1, 1,
-0.2111941, 2.213411, 1.132621, 0, 0, 0, 1, 1,
-0.2100718, -0.6104495, -1.951746, 0, 0, 0, 1, 1,
-0.20952, -0.3775738, -2.083874, 0, 0, 0, 1, 1,
-0.2089982, -1.851228, -2.737766, 0, 0, 0, 1, 1,
-0.2077255, -0.7179196, -2.671099, 0, 0, 0, 1, 1,
-0.2029462, 0.2945132, -0.2988002, 0, 0, 0, 1, 1,
-0.1995998, -2.070077, -3.919834, 1, 1, 1, 1, 1,
-0.1965884, -0.01045952, -0.8016486, 1, 1, 1, 1, 1,
-0.1963129, -0.4288552, -2.103043, 1, 1, 1, 1, 1,
-0.1907325, 0.9867672, 0.9180108, 1, 1, 1, 1, 1,
-0.1878274, 0.2030754, 0.423296, 1, 1, 1, 1, 1,
-0.1869521, 0.5381092, -0.658896, 1, 1, 1, 1, 1,
-0.1868506, -1.617669, -4.040061, 1, 1, 1, 1, 1,
-0.1867061, -0.192215, -2.639998, 1, 1, 1, 1, 1,
-0.1847901, -1.473354, -3.356745, 1, 1, 1, 1, 1,
-0.1842293, -0.5362107, -1.977593, 1, 1, 1, 1, 1,
-0.1825322, 0.3187096, 1.827762, 1, 1, 1, 1, 1,
-0.1817984, -0.8758146, -1.429285, 1, 1, 1, 1, 1,
-0.177296, -0.7831607, -1.205955, 1, 1, 1, 1, 1,
-0.1771623, 1.06538, -1.21707, 1, 1, 1, 1, 1,
-0.1764252, 1.444897, -0.7705034, 1, 1, 1, 1, 1,
-0.1737566, -0.1702577, -2.641296, 0, 0, 1, 1, 1,
-0.1714503, -2.096286, -1.44675, 1, 0, 0, 1, 1,
-0.1691328, 1.374035, 1.412637, 1, 0, 0, 1, 1,
-0.1688562, -0.8932399, -2.78754, 1, 0, 0, 1, 1,
-0.1617244, -0.9336491, -1.678792, 1, 0, 0, 1, 1,
-0.1614185, -0.1407131, -2.627109, 1, 0, 0, 1, 1,
-0.1601714, -0.1624409, -2.281056, 0, 0, 0, 1, 1,
-0.159572, 0.5041987, -0.5838607, 0, 0, 0, 1, 1,
-0.1594624, -0.5128991, -3.651874, 0, 0, 0, 1, 1,
-0.1574527, 0.3424915, -1.575812, 0, 0, 0, 1, 1,
-0.1526443, 0.6588413, -1.246487, 0, 0, 0, 1, 1,
-0.1475433, 0.01696455, -1.375071, 0, 0, 0, 1, 1,
-0.1473932, 0.8456869, 0.6005539, 0, 0, 0, 1, 1,
-0.144789, -0.06550206, -2.350995, 1, 1, 1, 1, 1,
-0.1427788, 0.5818943, 0.04481608, 1, 1, 1, 1, 1,
-0.1425718, 0.3399687, 0.1205787, 1, 1, 1, 1, 1,
-0.142148, 0.2408764, 0.7186984, 1, 1, 1, 1, 1,
-0.1408989, 1.787484, 0.1015116, 1, 1, 1, 1, 1,
-0.1398249, 0.3005496, -0.6116858, 1, 1, 1, 1, 1,
-0.1373911, -0.3941491, -1.031952, 1, 1, 1, 1, 1,
-0.1372702, 0.5424525, -1.628111, 1, 1, 1, 1, 1,
-0.1328978, 0.8013937, 0.8094947, 1, 1, 1, 1, 1,
-0.1297435, -0.5265, -2.812439, 1, 1, 1, 1, 1,
-0.1239089, -0.9642947, -2.630258, 1, 1, 1, 1, 1,
-0.1199309, -0.7272312, -2.341478, 1, 1, 1, 1, 1,
-0.1191846, 0.526867, -0.6451553, 1, 1, 1, 1, 1,
-0.118377, 0.6797611, -0.4857866, 1, 1, 1, 1, 1,
-0.1181566, -0.3058336, -3.306804, 1, 1, 1, 1, 1,
-0.1176221, 1.070529, 0.2894986, 0, 0, 1, 1, 1,
-0.1164198, 1.113945, 0.9184719, 1, 0, 0, 1, 1,
-0.1003836, -0.4493155, -2.042603, 1, 0, 0, 1, 1,
-0.09986224, -0.892118, -4.813426, 1, 0, 0, 1, 1,
-0.09643231, -0.03926557, -1.967676, 1, 0, 0, 1, 1,
-0.09431236, -0.6647686, -3.074814, 1, 0, 0, 1, 1,
-0.09008323, -1.357128, -3.272875, 0, 0, 0, 1, 1,
-0.09002289, 0.02766089, -1.261193, 0, 0, 0, 1, 1,
-0.0887989, -0.6299647, -3.153326, 0, 0, 0, 1, 1,
-0.08765467, 1.217306, -1.141782, 0, 0, 0, 1, 1,
-0.08659536, 0.7198062, 0.1547187, 0, 0, 0, 1, 1,
-0.08479198, -0.8938928, -3.309689, 0, 0, 0, 1, 1,
-0.07764094, -1.331105, -4.14982, 0, 0, 0, 1, 1,
-0.07367355, 0.9275372, 0.3927162, 1, 1, 1, 1, 1,
-0.0694599, -0.2972372, -3.756813, 1, 1, 1, 1, 1,
-0.06362171, -0.3182502, -2.722867, 1, 1, 1, 1, 1,
-0.06305145, -0.8130285, -3.432661, 1, 1, 1, 1, 1,
-0.06051051, 0.7220735, -0.7437261, 1, 1, 1, 1, 1,
-0.05873035, -0.2163218, -3.436245, 1, 1, 1, 1, 1,
-0.05853249, -0.2457532, -2.181453, 1, 1, 1, 1, 1,
-0.05776136, 1.17719, -0.6794167, 1, 1, 1, 1, 1,
-0.05621619, 0.4839209, -0.6425206, 1, 1, 1, 1, 1,
-0.05547396, 0.1246178, 0.8337647, 1, 1, 1, 1, 1,
-0.05500773, 0.1490261, -0.3314942, 1, 1, 1, 1, 1,
-0.05429421, -0.9143425, -3.756781, 1, 1, 1, 1, 1,
-0.05170211, 1.136379, 0.1453111, 1, 1, 1, 1, 1,
-0.05049662, -1.400907, -3.03468, 1, 1, 1, 1, 1,
-0.04903916, 0.1815719, -0.1438504, 1, 1, 1, 1, 1,
-0.0488125, -1.01347, -2.586707, 0, 0, 1, 1, 1,
-0.04332788, -1.132982, -1.519628, 1, 0, 0, 1, 1,
-0.04270569, -1.762258, -3.009347, 1, 0, 0, 1, 1,
-0.04259047, -0.1987243, -3.731744, 1, 0, 0, 1, 1,
-0.03953203, 0.1613101, -1.6806, 1, 0, 0, 1, 1,
-0.02969245, -0.1997511, -2.257364, 1, 0, 0, 1, 1,
-0.02335992, 1.340448, -2.250408, 0, 0, 0, 1, 1,
-0.02278196, 0.9504468, -0.5008888, 0, 0, 0, 1, 1,
-0.02023566, -1.346412, -3.541653, 0, 0, 0, 1, 1,
-0.01295673, -0.7405297, -3.2797, 0, 0, 0, 1, 1,
-0.005515488, -0.4304441, -2.963376, 0, 0, 0, 1, 1,
-0.004258041, 1.913453, 0.5428379, 0, 0, 0, 1, 1,
-0.003825205, 0.3139845, -1.068081, 0, 0, 0, 1, 1,
-0.001803258, 1.928791, 0.5851504, 1, 1, 1, 1, 1,
-0.001744737, 1.220101, 0.5712649, 1, 1, 1, 1, 1,
0.00156785, 0.7509651, 0.1037796, 1, 1, 1, 1, 1,
0.004620887, -0.06426212, 2.146669, 1, 1, 1, 1, 1,
0.009691589, -0.2253061, 3.17041, 1, 1, 1, 1, 1,
0.01066957, -0.7202337, 3.442264, 1, 1, 1, 1, 1,
0.01271547, -0.09800023, 3.318034, 1, 1, 1, 1, 1,
0.01732084, -0.1375167, 2.755683, 1, 1, 1, 1, 1,
0.01807787, 1.258157, -0.1046183, 1, 1, 1, 1, 1,
0.01983967, 1.316306, -0.7094838, 1, 1, 1, 1, 1,
0.02266813, 2.621806, -0.4530082, 1, 1, 1, 1, 1,
0.02389459, 0.7287557, 0.7555951, 1, 1, 1, 1, 1,
0.02487076, -1.097569, 4.375038, 1, 1, 1, 1, 1,
0.02559216, -0.3258955, 4.398362, 1, 1, 1, 1, 1,
0.02902953, -0.9263985, 2.596122, 1, 1, 1, 1, 1,
0.03244022, 0.982935, 0.2879536, 0, 0, 1, 1, 1,
0.0333484, 1.626583, -0.805889, 1, 0, 0, 1, 1,
0.0353747, -1.354072, 3.608982, 1, 0, 0, 1, 1,
0.03896862, 0.4089311, -0.5406294, 1, 0, 0, 1, 1,
0.04024115, -1.596929, 2.523839, 1, 0, 0, 1, 1,
0.04492407, -0.3759023, 4.344702, 1, 0, 0, 1, 1,
0.04590404, 1.754429, -2.166626, 0, 0, 0, 1, 1,
0.04821563, 0.9843042, -2.427713, 0, 0, 0, 1, 1,
0.04935822, -0.5561473, 2.637809, 0, 0, 0, 1, 1,
0.04965544, 0.3497282, 1.992448, 0, 0, 0, 1, 1,
0.05100377, 0.2740487, -0.5245472, 0, 0, 0, 1, 1,
0.05390302, 0.3120197, -1.164062, 0, 0, 0, 1, 1,
0.05451887, 0.2194155, -0.2442218, 0, 0, 0, 1, 1,
0.05722802, 0.1090667, 1.235003, 1, 1, 1, 1, 1,
0.05852421, 0.25295, 0.09828136, 1, 1, 1, 1, 1,
0.06143293, -0.6929189, 0.4096982, 1, 1, 1, 1, 1,
0.06423712, 0.5644307, -0.3756143, 1, 1, 1, 1, 1,
0.07881964, -0.2670548, 2.932162, 1, 1, 1, 1, 1,
0.08325124, -0.124294, 0.9705029, 1, 1, 1, 1, 1,
0.08331483, 0.7681042, 2.30782, 1, 1, 1, 1, 1,
0.08590242, -0.2730221, 3.03741, 1, 1, 1, 1, 1,
0.08595157, 1.156116, 1.178117, 1, 1, 1, 1, 1,
0.086482, -1.621864, 3.814462, 1, 1, 1, 1, 1,
0.08813515, -2.351022, 3.36343, 1, 1, 1, 1, 1,
0.08819477, -0.002344676, 1.342752, 1, 1, 1, 1, 1,
0.09189381, -0.2826123, 1.639608, 1, 1, 1, 1, 1,
0.09701075, 0.2973525, -0.09818037, 1, 1, 1, 1, 1,
0.09992453, -0.5731702, 2.386664, 1, 1, 1, 1, 1,
0.1029427, 1.492682, 0.1892845, 0, 0, 1, 1, 1,
0.1033357, 0.5682954, 1.176625, 1, 0, 0, 1, 1,
0.1039907, 0.5155268, -0.2755168, 1, 0, 0, 1, 1,
0.1049068, 2.262892, -0.917397, 1, 0, 0, 1, 1,
0.1063085, -0.4064883, 3.376755, 1, 0, 0, 1, 1,
0.1089654, -0.6159828, 3.543772, 1, 0, 0, 1, 1,
0.1178079, 1.035484, 0.9353716, 0, 0, 0, 1, 1,
0.1220882, -0.4596632, 1.224588, 0, 0, 0, 1, 1,
0.1224798, 0.7411232, -1.265454, 0, 0, 0, 1, 1,
0.1236346, 1.225069, -0.6448324, 0, 0, 0, 1, 1,
0.1239305, -0.3102922, 3.35994, 0, 0, 0, 1, 1,
0.1273709, 0.4783836, 1.574924, 0, 0, 0, 1, 1,
0.1301302, 1.165059, -0.4551332, 0, 0, 0, 1, 1,
0.1316422, 0.04475981, 1.557185, 1, 1, 1, 1, 1,
0.1336813, 1.432803, -0.3645846, 1, 1, 1, 1, 1,
0.1411215, 1.144486, -2.522785, 1, 1, 1, 1, 1,
0.141267, 1.514125, -0.1303238, 1, 1, 1, 1, 1,
0.1487817, -0.4074464, 1.640747, 1, 1, 1, 1, 1,
0.1489431, -0.2482003, 1.879855, 1, 1, 1, 1, 1,
0.1504882, -1.836733, 1.998842, 1, 1, 1, 1, 1,
0.1506714, 0.4853288, -2.147479, 1, 1, 1, 1, 1,
0.1552766, 0.355998, 3.186228, 1, 1, 1, 1, 1,
0.1558423, -0.06574383, 2.392314, 1, 1, 1, 1, 1,
0.1558965, 1.72558, 0.4568346, 1, 1, 1, 1, 1,
0.1627927, -0.3928567, 3.377061, 1, 1, 1, 1, 1,
0.1635272, -0.4012952, 3.809478, 1, 1, 1, 1, 1,
0.1665638, -0.3088356, 4.325891, 1, 1, 1, 1, 1,
0.1675838, 0.4666898, -0.7225591, 1, 1, 1, 1, 1,
0.1715978, 1.296191, 1.006261, 0, 0, 1, 1, 1,
0.1725798, -0.1597026, 3.062083, 1, 0, 0, 1, 1,
0.1793858, 0.4541907, 1.175647, 1, 0, 0, 1, 1,
0.1835543, 3.813553, -0.8686424, 1, 0, 0, 1, 1,
0.1885631, 0.8479388, 0.7405314, 1, 0, 0, 1, 1,
0.1888559, 0.5734009, -0.3286192, 1, 0, 0, 1, 1,
0.1906011, -0.7221439, 4.486008, 0, 0, 0, 1, 1,
0.19435, 0.08686846, -0.1869558, 0, 0, 0, 1, 1,
0.1952828, 1.631058, 1.554455, 0, 0, 0, 1, 1,
0.1974965, -0.706352, 4.152229, 0, 0, 0, 1, 1,
0.2010485, -1.807239, 4.168035, 0, 0, 0, 1, 1,
0.2013433, -0.974975, 4.422817, 0, 0, 0, 1, 1,
0.2018314, 1.291947, -1.215012, 0, 0, 0, 1, 1,
0.2037064, -0.2175957, 2.186911, 1, 1, 1, 1, 1,
0.2043516, 0.1300818, 1.385259, 1, 1, 1, 1, 1,
0.2107782, 1.231761, 0.2376976, 1, 1, 1, 1, 1,
0.214489, 0.06534497, 2.752435, 1, 1, 1, 1, 1,
0.2183888, 0.0590472, 1.158068, 1, 1, 1, 1, 1,
0.2256847, 0.6316844, -1.253408, 1, 1, 1, 1, 1,
0.2265734, 1.073897, -0.4094895, 1, 1, 1, 1, 1,
0.2321632, -1.030515, 4.132036, 1, 1, 1, 1, 1,
0.2369299, 0.6529505, 0.7532077, 1, 1, 1, 1, 1,
0.2387487, -0.8370468, 3.312197, 1, 1, 1, 1, 1,
0.2400498, -0.3193148, 1.979889, 1, 1, 1, 1, 1,
0.2401223, -0.0005097414, 1.138932, 1, 1, 1, 1, 1,
0.2402659, -0.4567331, 0.1683625, 1, 1, 1, 1, 1,
0.2438739, -1.587129, 2.362382, 1, 1, 1, 1, 1,
0.246653, -0.07134695, 1.912004, 1, 1, 1, 1, 1,
0.2484872, -0.3247424, 1.846543, 0, 0, 1, 1, 1,
0.2491852, 2.037414, -0.4858022, 1, 0, 0, 1, 1,
0.2509202, 0.2170728, 1.658737, 1, 0, 0, 1, 1,
0.2525658, 0.2053051, 0.4798161, 1, 0, 0, 1, 1,
0.2527176, 0.02042702, 2.50466, 1, 0, 0, 1, 1,
0.2537324, 0.7379478, 0.1940775, 1, 0, 0, 1, 1,
0.2541706, 0.8259423, 0.8343986, 0, 0, 0, 1, 1,
0.257647, -1.06189, 3.821821, 0, 0, 0, 1, 1,
0.2583208, -0.2119548, 1.27918, 0, 0, 0, 1, 1,
0.2607504, -0.7926453, 4.032183, 0, 0, 0, 1, 1,
0.2608081, -0.9640115, 2.473246, 0, 0, 0, 1, 1,
0.2658986, -0.2309601, 3.333828, 0, 0, 0, 1, 1,
0.266946, 2.418198, 0.360324, 0, 0, 0, 1, 1,
0.26916, 2.543012, -0.06489188, 1, 1, 1, 1, 1,
0.2735018, 0.5214545, 0.4110053, 1, 1, 1, 1, 1,
0.2741607, -0.4596093, 1.871496, 1, 1, 1, 1, 1,
0.2756072, -0.6631936, 1.840807, 1, 1, 1, 1, 1,
0.2784032, -1.690451, 4.67487, 1, 1, 1, 1, 1,
0.2808576, -1.705297, 2.48851, 1, 1, 1, 1, 1,
0.2808982, -1.035187, 1.977406, 1, 1, 1, 1, 1,
0.2818634, -0.1217444, -0.6424372, 1, 1, 1, 1, 1,
0.2918577, 1.17473, -0.61967, 1, 1, 1, 1, 1,
0.2965608, -0.8915038, 4.55451, 1, 1, 1, 1, 1,
0.2985403, -0.4463108, 2.405154, 1, 1, 1, 1, 1,
0.3049976, 0.4503621, 0.179086, 1, 1, 1, 1, 1,
0.3111686, -0.2504972, 3.382749, 1, 1, 1, 1, 1,
0.3113265, 0.6310003, 0.7662101, 1, 1, 1, 1, 1,
0.3131239, 1.485015, -1.093098, 1, 1, 1, 1, 1,
0.3136857, -0.1511671, 1.807881, 0, 0, 1, 1, 1,
0.3158219, -0.478832, 2.762227, 1, 0, 0, 1, 1,
0.3197722, 1.13669, 1.165626, 1, 0, 0, 1, 1,
0.3241381, -1.118179, 1.783852, 1, 0, 0, 1, 1,
0.3268856, 2.854669, -0.8781275, 1, 0, 0, 1, 1,
0.3395317, 1.20302, -0.4396807, 1, 0, 0, 1, 1,
0.3403148, 0.07485389, -0.1603419, 0, 0, 0, 1, 1,
0.3465738, 0.8202097, -0.1221897, 0, 0, 0, 1, 1,
0.3490096, -0.2037055, 0.3266025, 0, 0, 0, 1, 1,
0.3498416, -0.3187546, 1.779928, 0, 0, 0, 1, 1,
0.3552796, -0.040883, 2.053764, 0, 0, 0, 1, 1,
0.3566641, 0.3891124, 0.2535619, 0, 0, 0, 1, 1,
0.3569703, 0.02279308, 3.589118, 0, 0, 0, 1, 1,
0.3576252, -0.3845912, 2.111186, 1, 1, 1, 1, 1,
0.3627122, 0.5921748, -0.3362955, 1, 1, 1, 1, 1,
0.3636123, -1.675432, 3.001545, 1, 1, 1, 1, 1,
0.3654125, 0.2240571, 1.642478, 1, 1, 1, 1, 1,
0.3720383, -0.5646604, 3.638386, 1, 1, 1, 1, 1,
0.3744724, 0.6850501, 0.8617238, 1, 1, 1, 1, 1,
0.3771815, -0.7362709, 3.846711, 1, 1, 1, 1, 1,
0.3818552, -0.2074654, 1.868658, 1, 1, 1, 1, 1,
0.3823889, -0.02589725, 2.49069, 1, 1, 1, 1, 1,
0.383541, -1.354935, 4.2735, 1, 1, 1, 1, 1,
0.3844986, -0.04313216, 1.457307, 1, 1, 1, 1, 1,
0.3970329, -0.1982509, 3.369977, 1, 1, 1, 1, 1,
0.3998405, 0.3041581, 0.6665289, 1, 1, 1, 1, 1,
0.400191, 1.823872, 0.9434716, 1, 1, 1, 1, 1,
0.4026895, 0.1074814, 0.8433505, 1, 1, 1, 1, 1,
0.4050432, -0.3853955, 3.877766, 0, 0, 1, 1, 1,
0.4085672, -0.4496674, 1.052565, 1, 0, 0, 1, 1,
0.4114563, 1.196688, 0.02816169, 1, 0, 0, 1, 1,
0.4134761, -0.4212047, 3.508088, 1, 0, 0, 1, 1,
0.4169361, -2.243819, 3.097823, 1, 0, 0, 1, 1,
0.4196267, 0.2351976, 2.145068, 1, 0, 0, 1, 1,
0.4204461, 0.2905539, 1.527528, 0, 0, 0, 1, 1,
0.4215681, 1.129229, 0.8869827, 0, 0, 0, 1, 1,
0.4241955, 0.9781794, 1.035085, 0, 0, 0, 1, 1,
0.4260344, 1.121651, -0.6868407, 0, 0, 0, 1, 1,
0.4337636, 0.1170023, -0.2213117, 0, 0, 0, 1, 1,
0.4352565, -1.192456, 4.118658, 0, 0, 0, 1, 1,
0.4389991, 2.192003, 2.239942, 0, 0, 0, 1, 1,
0.4415778, -0.02770159, 2.098436, 1, 1, 1, 1, 1,
0.4451203, 1.915536, -0.5850312, 1, 1, 1, 1, 1,
0.445437, -0.1140998, 1.608967, 1, 1, 1, 1, 1,
0.4482678, -0.2057387, 2.950051, 1, 1, 1, 1, 1,
0.4507284, 0.8851816, 0.4583926, 1, 1, 1, 1, 1,
0.4529273, 1.157963, 1.464323, 1, 1, 1, 1, 1,
0.4531667, -0.6352871, 2.71649, 1, 1, 1, 1, 1,
0.4540884, 0.1797791, 1.032415, 1, 1, 1, 1, 1,
0.4582583, 0.5348042, 0.6956692, 1, 1, 1, 1, 1,
0.4651957, 1.609571, -0.4074086, 1, 1, 1, 1, 1,
0.4661151, 0.06959165, 0.7900898, 1, 1, 1, 1, 1,
0.4720205, -0.6793814, 2.942951, 1, 1, 1, 1, 1,
0.4730574, -0.3337461, 2.805536, 1, 1, 1, 1, 1,
0.4734863, 1.76383, 1.116999, 1, 1, 1, 1, 1,
0.4815261, 0.2209923, 1.961592, 1, 1, 1, 1, 1,
0.4821142, -1.301061, 2.723062, 0, 0, 1, 1, 1,
0.4823903, 0.1549343, 1.001386, 1, 0, 0, 1, 1,
0.4848397, 1.637823, 0.2746932, 1, 0, 0, 1, 1,
0.4861309, 0.3609738, 1.513745, 1, 0, 0, 1, 1,
0.4866805, 0.9325305, -0.7882566, 1, 0, 0, 1, 1,
0.4890926, -0.09176263, 0.4113818, 1, 0, 0, 1, 1,
0.4909742, -0.2427893, 1.060799, 0, 0, 0, 1, 1,
0.4949303, -0.6272607, 4.063524, 0, 0, 0, 1, 1,
0.5023137, 0.3989368, 2.014446, 0, 0, 0, 1, 1,
0.5043479, 1.631648, 2.121043, 0, 0, 0, 1, 1,
0.5067906, 0.4598884, 0.6101023, 0, 0, 0, 1, 1,
0.5109674, -0.1470041, 2.010685, 0, 0, 0, 1, 1,
0.512421, -0.7050517, 3.156862, 0, 0, 0, 1, 1,
0.5125982, -0.3381476, 2.131265, 1, 1, 1, 1, 1,
0.5176529, 0.3127556, 3.720754, 1, 1, 1, 1, 1,
0.5242251, 0.4254683, 0.1345321, 1, 1, 1, 1, 1,
0.5284834, 0.4825238, 0.2362601, 1, 1, 1, 1, 1,
0.5292609, 0.3201106, 0.4673332, 1, 1, 1, 1, 1,
0.5309722, 0.6429495, -1.018561, 1, 1, 1, 1, 1,
0.5313947, 0.4590004, 1.217525, 1, 1, 1, 1, 1,
0.5316444, -1.551078, 2.190192, 1, 1, 1, 1, 1,
0.532316, 0.8855466, 1.213431, 1, 1, 1, 1, 1,
0.539986, 0.6551114, 0.9729149, 1, 1, 1, 1, 1,
0.5424344, -0.1128815, 2.549592, 1, 1, 1, 1, 1,
0.5426356, 1.404749, -0.4486997, 1, 1, 1, 1, 1,
0.5529033, 0.04812299, -0.2226371, 1, 1, 1, 1, 1,
0.5534716, -0.1328418, 1.830291, 1, 1, 1, 1, 1,
0.5604054, 0.1628607, 1.366315, 1, 1, 1, 1, 1,
0.5614545, -1.138598, 3.880472, 0, 0, 1, 1, 1,
0.565471, 1.358096, -0.639635, 1, 0, 0, 1, 1,
0.5661073, 0.406008, 0.6010163, 1, 0, 0, 1, 1,
0.5765049, 0.8962079, -0.07582359, 1, 0, 0, 1, 1,
0.5770069, 2.618602, 1.10537, 1, 0, 0, 1, 1,
0.5799158, 0.1103284, 2.724822, 1, 0, 0, 1, 1,
0.5833653, -0.2265584, 3.348126, 0, 0, 0, 1, 1,
0.5838209, -0.9911677, 4.648238, 0, 0, 0, 1, 1,
0.5881809, 0.4243751, 1.354227, 0, 0, 0, 1, 1,
0.5925745, 0.4388205, 0.719545, 0, 0, 0, 1, 1,
0.5957814, -1.089561, 2.911989, 0, 0, 0, 1, 1,
0.5999478, -0.151891, 2.754946, 0, 0, 0, 1, 1,
0.6001265, 1.256489, 0.9820218, 0, 0, 0, 1, 1,
0.6025624, 1.011142, -0.1392706, 1, 1, 1, 1, 1,
0.6054745, -0.4210036, 3.888651, 1, 1, 1, 1, 1,
0.6110867, -0.3117475, 3.378503, 1, 1, 1, 1, 1,
0.6136467, 1.305188, -0.7762573, 1, 1, 1, 1, 1,
0.6160908, 0.01881571, 1.927865, 1, 1, 1, 1, 1,
0.6192924, -0.9270286, 1.547019, 1, 1, 1, 1, 1,
0.621925, 0.1755688, 2.336957, 1, 1, 1, 1, 1,
0.6229342, -0.1702156, 1.444589, 1, 1, 1, 1, 1,
0.6236398, 2.314373, -1.908296, 1, 1, 1, 1, 1,
0.6254593, 0.6484749, 0.6642927, 1, 1, 1, 1, 1,
0.6266547, -1.506388, 1.957833, 1, 1, 1, 1, 1,
0.6323936, 0.6137928, 0.316406, 1, 1, 1, 1, 1,
0.6343535, 0.5663941, 2.096014, 1, 1, 1, 1, 1,
0.6354676, 0.8857203, 0.1146513, 1, 1, 1, 1, 1,
0.6399602, 1.407754, 0.1617114, 1, 1, 1, 1, 1,
0.64028, 0.6495202, 1.918562, 0, 0, 1, 1, 1,
0.6471916, 0.4952606, 1.020949, 1, 0, 0, 1, 1,
0.6493, -1.503602, 1.174843, 1, 0, 0, 1, 1,
0.6505749, -1.197625, 1.129367, 1, 0, 0, 1, 1,
0.6525765, -1.258119, 3.21128, 1, 0, 0, 1, 1,
0.6572556, 0.2629384, 1.49892, 1, 0, 0, 1, 1,
0.6574685, -1.45968, 1.878592, 0, 0, 0, 1, 1,
0.6626687, -0.2597873, 0.9395253, 0, 0, 0, 1, 1,
0.6651067, 1.626078, 0.9809104, 0, 0, 0, 1, 1,
0.6684262, -0.9365904, 3.65784, 0, 0, 0, 1, 1,
0.6701816, 0.9918385, 0.5581961, 0, 0, 0, 1, 1,
0.6702371, -0.3856185, 2.714025, 0, 0, 0, 1, 1,
0.6719366, 1.246277, 0.855838, 0, 0, 0, 1, 1,
0.6812559, 0.5486617, 0.5151326, 1, 1, 1, 1, 1,
0.6825427, -0.7395829, 1.021948, 1, 1, 1, 1, 1,
0.6832392, 0.3164627, 0.8220005, 1, 1, 1, 1, 1,
0.6837636, 0.6719738, -0.6201733, 1, 1, 1, 1, 1,
0.6841218, -0.6868754, 1.659762, 1, 1, 1, 1, 1,
0.6890177, 0.1997588, 1.919009, 1, 1, 1, 1, 1,
0.6897132, -2.777514, 2.614085, 1, 1, 1, 1, 1,
0.690074, -0.5942872, 2.756649, 1, 1, 1, 1, 1,
0.6915644, -1.443706, 1.983526, 1, 1, 1, 1, 1,
0.6939272, -0.4076407, 1.925851, 1, 1, 1, 1, 1,
0.697828, -1.56579, 5.645991, 1, 1, 1, 1, 1,
0.6994074, -0.4639088, 0.3605509, 1, 1, 1, 1, 1,
0.7053685, 0.04539429, 2.399749, 1, 1, 1, 1, 1,
0.7057787, 0.4625497, 1.883456, 1, 1, 1, 1, 1,
0.7081965, -1.755448, 3.665738, 1, 1, 1, 1, 1,
0.709041, -0.5118877, 1.72294, 0, 0, 1, 1, 1,
0.7127843, -1.341797, 2.686006, 1, 0, 0, 1, 1,
0.7134082, -0.2408993, 2.024399, 1, 0, 0, 1, 1,
0.7191834, 0.03700518, 0.2248044, 1, 0, 0, 1, 1,
0.7293479, -0.3688584, 1.957062, 1, 0, 0, 1, 1,
0.7299817, 0.4923877, 1.740382, 1, 0, 0, 1, 1,
0.732101, 0.02202933, 1.513213, 0, 0, 0, 1, 1,
0.7381477, -0.1036598, 1.519347, 0, 0, 0, 1, 1,
0.7398411, -0.1706645, 2.713247, 0, 0, 0, 1, 1,
0.7439222, 0.569081, 1.760971, 0, 0, 0, 1, 1,
0.7449958, -0.9754724, 2.141352, 0, 0, 0, 1, 1,
0.7517594, 0.04660125, 3.432364, 0, 0, 0, 1, 1,
0.7590432, -0.4391496, 2.195819, 0, 0, 0, 1, 1,
0.7623349, -1.432628, 4.63966, 1, 1, 1, 1, 1,
0.7645544, 0.5150945, 0.848849, 1, 1, 1, 1, 1,
0.7704619, 0.1586172, 2.789153, 1, 1, 1, 1, 1,
0.7705532, -0.6007346, 4.88428, 1, 1, 1, 1, 1,
0.7727364, 0.446547, 1.07907, 1, 1, 1, 1, 1,
0.7855283, 0.0969024, 0.6592804, 1, 1, 1, 1, 1,
0.7952769, -0.0170777, 2.014944, 1, 1, 1, 1, 1,
0.7983654, 0.8654574, 0.7319329, 1, 1, 1, 1, 1,
0.8022994, -0.1581715, 1.165259, 1, 1, 1, 1, 1,
0.8069008, -0.6552725, 1.302894, 1, 1, 1, 1, 1,
0.8098956, -0.4897475, 1.328753, 1, 1, 1, 1, 1,
0.8103442, 0.1827789, 1.441342, 1, 1, 1, 1, 1,
0.8130763, -0.07142904, 1.580699, 1, 1, 1, 1, 1,
0.8135719, 0.1085883, 1.92944, 1, 1, 1, 1, 1,
0.8180757, 1.418789, 1.167374, 1, 1, 1, 1, 1,
0.8206716, -0.1846558, 2.734422, 0, 0, 1, 1, 1,
0.8215602, -0.03785168, 0.5344235, 1, 0, 0, 1, 1,
0.8247073, 0.5385126, 0.9610958, 1, 0, 0, 1, 1,
0.8382145, 0.1784728, 0.6517918, 1, 0, 0, 1, 1,
0.8402741, -0.08128157, 2.702109, 1, 0, 0, 1, 1,
0.8451305, -0.8269774, 3.276052, 1, 0, 0, 1, 1,
0.8460271, 0.7825718, 1.18024, 0, 0, 0, 1, 1,
0.8485618, -1.48737, 2.324194, 0, 0, 0, 1, 1,
0.8524482, -1.700423, 3.589122, 0, 0, 0, 1, 1,
0.8556203, -0.8436324, 2.840683, 0, 0, 0, 1, 1,
0.8566667, -1.323195, 2.090122, 0, 0, 0, 1, 1,
0.8567907, -0.2559588, 1.267382, 0, 0, 0, 1, 1,
0.8613595, -0.06474279, 1.035827, 0, 0, 0, 1, 1,
0.8670987, 0.05208078, 1.835057, 1, 1, 1, 1, 1,
0.8675838, 0.5687566, 0.642358, 1, 1, 1, 1, 1,
0.869127, -0.6674625, 2.812349, 1, 1, 1, 1, 1,
0.8698177, -0.4972215, 2.296527, 1, 1, 1, 1, 1,
0.8711269, 0.03494376, 0.426451, 1, 1, 1, 1, 1,
0.8725289, 0.4904918, 1.526964, 1, 1, 1, 1, 1,
0.878742, -0.8015979, 3.558775, 1, 1, 1, 1, 1,
0.8838, -1.217842, 0.5073358, 1, 1, 1, 1, 1,
0.8838123, -0.9241688, 1.683418, 1, 1, 1, 1, 1,
0.8851201, 0.2083456, 0.3858256, 1, 1, 1, 1, 1,
0.8919575, -0.8194284, 3.430841, 1, 1, 1, 1, 1,
0.8949724, 0.9317114, 0.180722, 1, 1, 1, 1, 1,
0.8980229, -0.4934591, 0.547385, 1, 1, 1, 1, 1,
0.9028928, 1.09399, 0.4491293, 1, 1, 1, 1, 1,
0.9106554, 1.201333, -0.6071455, 1, 1, 1, 1, 1,
0.9172807, 0.5213945, -1.340194, 0, 0, 1, 1, 1,
0.924284, 1.699845, 0.1207623, 1, 0, 0, 1, 1,
0.9318887, 1.22362, 2.167218, 1, 0, 0, 1, 1,
0.9338266, -0.2682794, 3.543769, 1, 0, 0, 1, 1,
0.9386288, 0.753758, 0.9604897, 1, 0, 0, 1, 1,
0.9492537, -0.04245949, 1.348313, 1, 0, 0, 1, 1,
0.9666791, -0.4317066, 1.091886, 0, 0, 0, 1, 1,
0.9693434, -1.511181, 1.78341, 0, 0, 0, 1, 1,
0.969547, 1.581853, 1.573011, 0, 0, 0, 1, 1,
0.9730494, 0.7962119, 0.1144355, 0, 0, 0, 1, 1,
0.9730942, 0.9579248, 0.05569313, 0, 0, 0, 1, 1,
0.9766402, -1.664696, 1.517133, 0, 0, 0, 1, 1,
0.9841313, -1.223487, 2.408953, 0, 0, 0, 1, 1,
0.9852696, -0.04522157, 2.942771, 1, 1, 1, 1, 1,
0.9854341, -0.110072, 2.86213, 1, 1, 1, 1, 1,
0.9897, -0.4707083, 2.14259, 1, 1, 1, 1, 1,
0.9900858, -0.8671607, 1.866165, 1, 1, 1, 1, 1,
0.9916835, -0.05896999, 0.703507, 1, 1, 1, 1, 1,
0.9925909, 0.5857822, 1.169784, 1, 1, 1, 1, 1,
0.9926196, 0.2180603, 2.202635, 1, 1, 1, 1, 1,
0.9937948, -1.668885, 2.216445, 1, 1, 1, 1, 1,
0.9959037, -0.160439, 2.921174, 1, 1, 1, 1, 1,
1.001422, -1.415064, 2.202892, 1, 1, 1, 1, 1,
1.003132, -0.2514572, 1.844594, 1, 1, 1, 1, 1,
1.003837, 1.536926, 1.340447, 1, 1, 1, 1, 1,
1.007678, -1.253335, 2.984204, 1, 1, 1, 1, 1,
1.017567, -1.480596, 2.143054, 1, 1, 1, 1, 1,
1.020118, -2.439188, 0.9034214, 1, 1, 1, 1, 1,
1.025213, -1.444577, 3.233435, 0, 0, 1, 1, 1,
1.026548, -2.510828, 2.655471, 1, 0, 0, 1, 1,
1.030719, -0.4210732, 1.971088, 1, 0, 0, 1, 1,
1.038038, -0.2988472, 2.793662, 1, 0, 0, 1, 1,
1.041372, -0.397003, 1.848445, 1, 0, 0, 1, 1,
1.04317, -0.9606846, 2.300222, 1, 0, 0, 1, 1,
1.050716, -1.414786, 2.726284, 0, 0, 0, 1, 1,
1.051799, -1.1671, 2.282202, 0, 0, 0, 1, 1,
1.054586, 0.3266756, 0.5953727, 0, 0, 0, 1, 1,
1.056997, 0.9124555, 0.6794689, 0, 0, 0, 1, 1,
1.060069, 0.009930497, 2.211734, 0, 0, 0, 1, 1,
1.063252, -0.8117351, 2.954402, 0, 0, 0, 1, 1,
1.069298, 0.3190863, 1.635285, 0, 0, 0, 1, 1,
1.078481, -0.7723686, 3.016366, 1, 1, 1, 1, 1,
1.079201, -1.811245, 1.871196, 1, 1, 1, 1, 1,
1.090202, -1.225633, 4.187382, 1, 1, 1, 1, 1,
1.09799, -0.06727514, 2.249126, 1, 1, 1, 1, 1,
1.098474, 2.10007, 2.721128, 1, 1, 1, 1, 1,
1.102209, 2.140761, -0.4489941, 1, 1, 1, 1, 1,
1.103067, -0.1192948, 2.851544, 1, 1, 1, 1, 1,
1.106208, 0.8920406, 1.124272, 1, 1, 1, 1, 1,
1.106804, 0.4372721, 1.495066, 1, 1, 1, 1, 1,
1.115279, -0.2575889, 1.65341, 1, 1, 1, 1, 1,
1.119277, 1.082876, 1.9045, 1, 1, 1, 1, 1,
1.125556, -0.6716915, 2.879488, 1, 1, 1, 1, 1,
1.125614, 0.4002319, 1.79889, 1, 1, 1, 1, 1,
1.127029, 0.2401964, 1.816107, 1, 1, 1, 1, 1,
1.127205, 0.6905053, 0.7405816, 1, 1, 1, 1, 1,
1.138052, 0.4516872, 2.365988, 0, 0, 1, 1, 1,
1.14327, 0.8073215, 0.02494634, 1, 0, 0, 1, 1,
1.152242, 0.8768557, 0.3795285, 1, 0, 0, 1, 1,
1.15323, -1.185657, 1.64257, 1, 0, 0, 1, 1,
1.157438, -0.001981283, 3.052396, 1, 0, 0, 1, 1,
1.16166, -0.5508428, 1.443141, 1, 0, 0, 1, 1,
1.16266, 1.624152, 1.147461, 0, 0, 0, 1, 1,
1.16641, 1.894141, 1.109862, 0, 0, 0, 1, 1,
1.168299, 0.5884187, 0.3545178, 0, 0, 0, 1, 1,
1.174954, -0.8674046, 2.609676, 0, 0, 0, 1, 1,
1.176183, 1.369694, -0.3686619, 0, 0, 0, 1, 1,
1.188403, -0.9875544, 1.940797, 0, 0, 0, 1, 1,
1.190949, -0.5972716, 2.484172, 0, 0, 0, 1, 1,
1.191597, -1.0583, 3.013948, 1, 1, 1, 1, 1,
1.199967, -0.9902581, 0.5716386, 1, 1, 1, 1, 1,
1.200038, 1.846737, 1.163679, 1, 1, 1, 1, 1,
1.218147, -0.1068872, 3.04594, 1, 1, 1, 1, 1,
1.221812, 0.2770635, 2.581341, 1, 1, 1, 1, 1,
1.233304, 0.7894543, -1.174831, 1, 1, 1, 1, 1,
1.236186, 0.7304118, 0.4279098, 1, 1, 1, 1, 1,
1.239202, 0.1373625, 1.519271, 1, 1, 1, 1, 1,
1.243789, 2.156305, -0.9910938, 1, 1, 1, 1, 1,
1.255498, 0.6739751, 1.461016, 1, 1, 1, 1, 1,
1.259882, -0.860078, 3.833759, 1, 1, 1, 1, 1,
1.262072, 0.7639699, 0.3379678, 1, 1, 1, 1, 1,
1.280441, -0.1149128, 3.398787, 1, 1, 1, 1, 1,
1.302554, -0.6910864, 2.202847, 1, 1, 1, 1, 1,
1.307223, -1.072206, 1.853159, 1, 1, 1, 1, 1,
1.316433, -1.904983, 1.076049, 0, 0, 1, 1, 1,
1.316788, 0.08901895, 2.167845, 1, 0, 0, 1, 1,
1.324231, 0.4671292, 2.387903, 1, 0, 0, 1, 1,
1.331303, -1.075827, 1.166385, 1, 0, 0, 1, 1,
1.331655, 1.443, 1.026595, 1, 0, 0, 1, 1,
1.33526, 1.335663, -0.255434, 1, 0, 0, 1, 1,
1.340101, 0.3816834, 1.224571, 0, 0, 0, 1, 1,
1.371063, -1.42086, 2.292902, 0, 0, 0, 1, 1,
1.372129, -0.4599914, 2.953892, 0, 0, 0, 1, 1,
1.384042, 0.3537996, 1.187304, 0, 0, 0, 1, 1,
1.387089, -0.04860927, 1.828586, 0, 0, 0, 1, 1,
1.394035, -1.020805, 2.660104, 0, 0, 0, 1, 1,
1.399832, -1.680181, 2.384082, 0, 0, 0, 1, 1,
1.423216, -0.08626213, 0.1940191, 1, 1, 1, 1, 1,
1.42455, -1.028088, 1.392855, 1, 1, 1, 1, 1,
1.43298, 1.175191, 0.7364568, 1, 1, 1, 1, 1,
1.435146, 0.6655384, 2.213787, 1, 1, 1, 1, 1,
1.436658, 1.139171, 0.549644, 1, 1, 1, 1, 1,
1.448764, -0.1544053, 1.647534, 1, 1, 1, 1, 1,
1.458066, 0.5841198, -0.5480511, 1, 1, 1, 1, 1,
1.463225, 0.01557949, 0.9412031, 1, 1, 1, 1, 1,
1.464437, 0.129939, 1.326955, 1, 1, 1, 1, 1,
1.476246, -0.02494627, -0.778473, 1, 1, 1, 1, 1,
1.476481, 0.8971563, 1.811556, 1, 1, 1, 1, 1,
1.48348, -0.8053468, 1.065255, 1, 1, 1, 1, 1,
1.48721, -0.8889982, 2.053668, 1, 1, 1, 1, 1,
1.489929, 0.4406166, 0.5562317, 1, 1, 1, 1, 1,
1.491655, 0.5213997, 2.072059, 1, 1, 1, 1, 1,
1.495892, 1.247871, 0.5063704, 0, 0, 1, 1, 1,
1.502501, 0.02401021, 1.936288, 1, 0, 0, 1, 1,
1.502708, 0.3725207, 1.145216, 1, 0, 0, 1, 1,
1.516175, -0.3140799, 3.310878, 1, 0, 0, 1, 1,
1.555171, -0.1471096, 0.5752935, 1, 0, 0, 1, 1,
1.576881, -0.6894701, 2.340625, 1, 0, 0, 1, 1,
1.581106, -0.2044735, -1.59227, 0, 0, 0, 1, 1,
1.586829, 1.447836, -0.3017736, 0, 0, 0, 1, 1,
1.590084, 0.3105257, 1.753416, 0, 0, 0, 1, 1,
1.595214, -1.46053, -0.1430442, 0, 0, 0, 1, 1,
1.596987, 1.139936, -0.03213046, 0, 0, 0, 1, 1,
1.609205, -2.00753, 2.354637, 0, 0, 0, 1, 1,
1.612785, 0.7029064, 0.3737274, 0, 0, 0, 1, 1,
1.620297, 0.615344, 0.463249, 1, 1, 1, 1, 1,
1.622731, -0.7786919, 1.987089, 1, 1, 1, 1, 1,
1.634955, -0.03670929, 1.727839, 1, 1, 1, 1, 1,
1.658187, -0.4310539, 0.9980362, 1, 1, 1, 1, 1,
1.660041, 1.704204, 0.3836479, 1, 1, 1, 1, 1,
1.693899, -1.303266, 1.269028, 1, 1, 1, 1, 1,
1.698841, 0.2937297, 2.547118, 1, 1, 1, 1, 1,
1.700204, -0.03336314, 1.342829, 1, 1, 1, 1, 1,
1.706673, -0.3003351, 0.1651022, 1, 1, 1, 1, 1,
1.711254, 0.08436615, -0.6278951, 1, 1, 1, 1, 1,
1.726078, 0.8528316, 0.4395758, 1, 1, 1, 1, 1,
1.749136, -1.016634, 2.079131, 1, 1, 1, 1, 1,
1.756473, 2.197027, 0.446356, 1, 1, 1, 1, 1,
1.767737, 1.285635, 0.3470278, 1, 1, 1, 1, 1,
1.788967, -1.201506, 2.352854, 1, 1, 1, 1, 1,
1.810986, 0.8405615, 0.05650267, 0, 0, 1, 1, 1,
1.817849, -2.53093, 1.777656, 1, 0, 0, 1, 1,
1.84818, -1.710364, 3.457663, 1, 0, 0, 1, 1,
1.869578, 0.3594054, -0.4899242, 1, 0, 0, 1, 1,
1.874959, 0.6169643, 0.4757486, 1, 0, 0, 1, 1,
1.912113, -1.763105, 2.702245, 1, 0, 0, 1, 1,
1.918266, -0.4212704, 1.927362, 0, 0, 0, 1, 1,
1.91882, 0.8083479, -0.3801732, 0, 0, 0, 1, 1,
1.93587, -2.529616, 3.476783, 0, 0, 0, 1, 1,
1.957802, -0.8623258, 0.4932213, 0, 0, 0, 1, 1,
1.959047, -0.8261378, 2.062967, 0, 0, 0, 1, 1,
1.973797, 1.079081, 1.248594, 0, 0, 0, 1, 1,
2.008143, -1.288887, 1.730282, 0, 0, 0, 1, 1,
2.041624, 1.622215, -0.4169389, 1, 1, 1, 1, 1,
2.048942, -1.353168, 3.319657, 1, 1, 1, 1, 1,
2.049695, -0.2478683, 1.11614, 1, 1, 1, 1, 1,
2.054575, -1.117994, 2.64631, 1, 1, 1, 1, 1,
2.064259, -0.6195913, 3.429489, 1, 1, 1, 1, 1,
2.080881, 1.36746, 0.6949654, 1, 1, 1, 1, 1,
2.091847, 1.920533, -0.3267464, 1, 1, 1, 1, 1,
2.145046, 0.7895538, -0.8592398, 1, 1, 1, 1, 1,
2.149855, 0.9759485, 2.97723, 1, 1, 1, 1, 1,
2.169601, 1.508148, 1.086506, 1, 1, 1, 1, 1,
2.169602, 0.08054243, 5.188451, 1, 1, 1, 1, 1,
2.260525, -1.369365, 0.8123981, 1, 1, 1, 1, 1,
2.266836, 1.384124, -0.3147304, 1, 1, 1, 1, 1,
2.293885, -1.019704, 1.902649, 1, 1, 1, 1, 1,
2.296311, -1.230103, 2.408846, 1, 1, 1, 1, 1,
2.296511, 1.292029, 1.369777, 0, 0, 1, 1, 1,
2.368855, 0.2573099, 1.69478, 1, 0, 0, 1, 1,
2.38799, 1.136569, 1.741782, 1, 0, 0, 1, 1,
2.431645, -0.09138845, 4.072109, 1, 0, 0, 1, 1,
2.470718, 2.194877, 0.6746299, 1, 0, 0, 1, 1,
2.48991, -0.9756402, 2.708501, 1, 0, 0, 1, 1,
2.506041, 1.566977, 0.5987914, 0, 0, 0, 1, 1,
2.524251, -2.099886, 2.13028, 0, 0, 0, 1, 1,
2.56234, -0.7501662, 1.895476, 0, 0, 0, 1, 1,
2.579376, 0.7633464, 1.376266, 0, 0, 0, 1, 1,
2.631296, -1.386575, 1.370099, 0, 0, 0, 1, 1,
2.734583, 0.9624116, 0.7493701, 0, 0, 0, 1, 1,
2.786504, -1.069631, 1.189098, 0, 0, 0, 1, 1,
2.819549, 1.829053, 1.019748, 1, 1, 1, 1, 1,
2.819987, 0.8513881, 1.866863, 1, 1, 1, 1, 1,
2.836646, 0.5712814, 0.3267658, 1, 1, 1, 1, 1,
2.842789, -0.02887846, 1.183788, 1, 1, 1, 1, 1,
3.032165, -0.03013651, 1.02494, 1, 1, 1, 1, 1,
3.269217, 0.1250534, 0.7530001, 1, 1, 1, 1, 1,
3.335495, -0.6095167, 1.651944, 1, 1, 1, 1, 1
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
var radius = 10.15505;
var distance = 35.66917;
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
mvMatrix.translate( 0.1299915, -0.08479023, -0.0942359 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.66917);
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
