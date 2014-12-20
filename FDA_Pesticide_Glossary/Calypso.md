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
-3.138715, 1.875122, -1.285166, 1, 0, 0, 1,
-3.064442, -0.2276789, -2.568262, 1, 0.007843138, 0, 1,
-3.059841, 0.8995553, -1.208941, 1, 0.01176471, 0, 1,
-2.979214, -0.2234906, -2.543376, 1, 0.01960784, 0, 1,
-2.877671, 0.8482861, -0.6683907, 1, 0.02352941, 0, 1,
-2.81611, -0.9120994, -2.094469, 1, 0.03137255, 0, 1,
-2.597316, 0.5905125, -0.3737837, 1, 0.03529412, 0, 1,
-2.591243, 0.4782586, -0.7258979, 1, 0.04313726, 0, 1,
-2.513678, 0.1296465, -1.815574, 1, 0.04705882, 0, 1,
-2.398024, 0.8615102, -0.8414486, 1, 0.05490196, 0, 1,
-2.393481, -0.4077129, -0.4073451, 1, 0.05882353, 0, 1,
-2.344345, 0.4058532, -1.244979, 1, 0.06666667, 0, 1,
-2.341108, 0.7580917, -2.26562, 1, 0.07058824, 0, 1,
-2.329003, 0.8724676, -0.71244, 1, 0.07843138, 0, 1,
-2.255322, -0.1128632, -2.634603, 1, 0.08235294, 0, 1,
-2.239469, 0.6120733, -0.3352278, 1, 0.09019608, 0, 1,
-2.209713, 0.5753745, -1.515593, 1, 0.09411765, 0, 1,
-2.196737, -0.6714854, -2.802703, 1, 0.1019608, 0, 1,
-2.190535, -0.5923533, -2.081537, 1, 0.1098039, 0, 1,
-2.187119, -1.111541, -2.549276, 1, 0.1137255, 0, 1,
-2.153306, 0.3730976, -1.06065, 1, 0.1215686, 0, 1,
-2.12876, -0.7277634, -1.616611, 1, 0.1254902, 0, 1,
-2.127553, 1.585649, -0.392465, 1, 0.1333333, 0, 1,
-2.119173, -0.9322768, -1.051869, 1, 0.1372549, 0, 1,
-2.05306, -0.7172335, -2.141919, 1, 0.145098, 0, 1,
-2.018886, 1.462715, -1.589279, 1, 0.1490196, 0, 1,
-2.018731, 0.6502602, -2.545544, 1, 0.1568628, 0, 1,
-1.958735, 0.6315022, -2.131316, 1, 0.1607843, 0, 1,
-1.939299, -0.9888881, -2.818695, 1, 0.1686275, 0, 1,
-1.933089, 0.3392416, -0.625567, 1, 0.172549, 0, 1,
-1.920999, -1.46111, -1.779171, 1, 0.1803922, 0, 1,
-1.909741, 0.1326394, -1.668671, 1, 0.1843137, 0, 1,
-1.908052, -1.019834, -3.680993, 1, 0.1921569, 0, 1,
-1.901044, 1.917525, -0.720238, 1, 0.1960784, 0, 1,
-1.892463, 0.4158959, -0.9739404, 1, 0.2039216, 0, 1,
-1.870888, 1.178194, -1.301937, 1, 0.2117647, 0, 1,
-1.857012, -1.394083, -2.083161, 1, 0.2156863, 0, 1,
-1.853965, -0.2810153, -0.9659503, 1, 0.2235294, 0, 1,
-1.851388, 0.1114309, -2.796691, 1, 0.227451, 0, 1,
-1.797643, 0.2168826, 0.0353028, 1, 0.2352941, 0, 1,
-1.792763, -0.8161607, -0.8605164, 1, 0.2392157, 0, 1,
-1.791418, 1.343699, -2.039925, 1, 0.2470588, 0, 1,
-1.788487, 0.4132842, -1.472661, 1, 0.2509804, 0, 1,
-1.779122, -0.01950851, -1.78582, 1, 0.2588235, 0, 1,
-1.77678, 0.5026386, -1.208837, 1, 0.2627451, 0, 1,
-1.770584, 0.520876, -1.585675, 1, 0.2705882, 0, 1,
-1.760815, -0.9235957, -1.07284, 1, 0.2745098, 0, 1,
-1.753952, -1.150091, -2.80139, 1, 0.282353, 0, 1,
-1.75113, -0.5904898, -0.748956, 1, 0.2862745, 0, 1,
-1.731852, 0.45454, -0.5768266, 1, 0.2941177, 0, 1,
-1.720907, -0.8848168, -2.006461, 1, 0.3019608, 0, 1,
-1.719066, -1.525669, -2.13511, 1, 0.3058824, 0, 1,
-1.718736, 1.901611, -0.301328, 1, 0.3137255, 0, 1,
-1.713242, -1.097258, -2.313604, 1, 0.3176471, 0, 1,
-1.711412, -0.9287739, -2.243757, 1, 0.3254902, 0, 1,
-1.698174, 0.4108014, -0.9736013, 1, 0.3294118, 0, 1,
-1.695486, -0.03160535, -2.222456, 1, 0.3372549, 0, 1,
-1.690911, -1.375632, -1.436323, 1, 0.3411765, 0, 1,
-1.668244, 0.1184573, -1.48252, 1, 0.3490196, 0, 1,
-1.646572, -1.22043, -2.894093, 1, 0.3529412, 0, 1,
-1.628869, 0.6874277, -1.603996, 1, 0.3607843, 0, 1,
-1.627744, -1.139452, -3.637211, 1, 0.3647059, 0, 1,
-1.627341, 0.3175325, -2.475676, 1, 0.372549, 0, 1,
-1.621226, -0.09063749, -1.359299, 1, 0.3764706, 0, 1,
-1.601641, 0.3102228, -0.9388192, 1, 0.3843137, 0, 1,
-1.599008, 1.203642, -2.429033, 1, 0.3882353, 0, 1,
-1.595818, 0.3159221, -0.8313685, 1, 0.3960784, 0, 1,
-1.589718, 0.7709802, -2.115684, 1, 0.4039216, 0, 1,
-1.581015, 0.8470601, 1.011459, 1, 0.4078431, 0, 1,
-1.578755, 0.6055472, -0.5301776, 1, 0.4156863, 0, 1,
-1.571971, -1.096981, -2.840988, 1, 0.4196078, 0, 1,
-1.561689, -2.105402, -2.768796, 1, 0.427451, 0, 1,
-1.550561, -0.5192687, -1.600978, 1, 0.4313726, 0, 1,
-1.543191, -2.660527, -1.863136, 1, 0.4392157, 0, 1,
-1.537446, -0.1473289, -3.63527, 1, 0.4431373, 0, 1,
-1.535656, -0.5587482, -0.2693264, 1, 0.4509804, 0, 1,
-1.53397, -1.118644, -3.149667, 1, 0.454902, 0, 1,
-1.492203, 1.997364, 1.121142, 1, 0.4627451, 0, 1,
-1.48913, 0.8516759, -1.47131, 1, 0.4666667, 0, 1,
-1.486609, 0.09577498, 0.04806499, 1, 0.4745098, 0, 1,
-1.478359, -2.286039, -2.884521, 1, 0.4784314, 0, 1,
-1.475506, -0.9268602, -2.671747, 1, 0.4862745, 0, 1,
-1.46942, 1.506804, -0.8188586, 1, 0.4901961, 0, 1,
-1.467708, 0.02905557, -3.40019, 1, 0.4980392, 0, 1,
-1.462647, -0.8080142, -2.251064, 1, 0.5058824, 0, 1,
-1.457739, -0.5356135, -1.307699, 1, 0.509804, 0, 1,
-1.457715, 0.9940832, -0.06838685, 1, 0.5176471, 0, 1,
-1.444745, -0.8320641, -1.51839, 1, 0.5215687, 0, 1,
-1.427753, 1.569624, -1.089107, 1, 0.5294118, 0, 1,
-1.424209, 0.669879, -0.7421502, 1, 0.5333334, 0, 1,
-1.415947, -1.024003, -2.571563, 1, 0.5411765, 0, 1,
-1.407181, 2.039154, 0.2151503, 1, 0.5450981, 0, 1,
-1.398476, 0.9266582, -0.9327387, 1, 0.5529412, 0, 1,
-1.397934, 1.916956, -0.2431061, 1, 0.5568628, 0, 1,
-1.394901, -0.9200305, -3.587237, 1, 0.5647059, 0, 1,
-1.393583, -2.868457, -2.878073, 1, 0.5686275, 0, 1,
-1.384053, 1.800133, -1.134455, 1, 0.5764706, 0, 1,
-1.381653, 0.38704, -1.417853, 1, 0.5803922, 0, 1,
-1.380383, -1.250568, -0.7290531, 1, 0.5882353, 0, 1,
-1.369072, -0.0808035, -0.3281103, 1, 0.5921569, 0, 1,
-1.359961, -0.7848948, -1.863307, 1, 0.6, 0, 1,
-1.359867, -0.3598981, -2.382807, 1, 0.6078432, 0, 1,
-1.349721, 0.3789613, -1.767737, 1, 0.6117647, 0, 1,
-1.349652, 0.04603621, -2.039522, 1, 0.6196079, 0, 1,
-1.348059, -0.7674824, -1.164156, 1, 0.6235294, 0, 1,
-1.341328, 0.7507522, -2.056093, 1, 0.6313726, 0, 1,
-1.339938, -1.205649, -2.798953, 1, 0.6352941, 0, 1,
-1.328211, 0.4181226, -0.3880988, 1, 0.6431373, 0, 1,
-1.324733, 0.01926098, -1.799804, 1, 0.6470588, 0, 1,
-1.317098, -0.8931587, -1.775786, 1, 0.654902, 0, 1,
-1.316728, -0.08292788, -2.911157, 1, 0.6588235, 0, 1,
-1.315676, 0.2910206, -1.253791, 1, 0.6666667, 0, 1,
-1.314668, 0.4467382, -1.104321, 1, 0.6705883, 0, 1,
-1.301489, 0.8300412, -0.6980217, 1, 0.6784314, 0, 1,
-1.300034, 1.355649, 0.9113597, 1, 0.682353, 0, 1,
-1.287436, 1.322124, -1.368269, 1, 0.6901961, 0, 1,
-1.286267, 0.2905033, -2.114687, 1, 0.6941177, 0, 1,
-1.28282, -0.4136324, -0.4503615, 1, 0.7019608, 0, 1,
-1.27977, 1.786945, -0.03065026, 1, 0.7098039, 0, 1,
-1.278824, -0.7366208, -1.524799, 1, 0.7137255, 0, 1,
-1.264812, -1.719941, -1.561916, 1, 0.7215686, 0, 1,
-1.264721, 0.8474115, -1.19691, 1, 0.7254902, 0, 1,
-1.258232, 0.3430849, -1.585474, 1, 0.7333333, 0, 1,
-1.251349, 0.01149653, -3.636158, 1, 0.7372549, 0, 1,
-1.250182, 0.5161082, -2.291425, 1, 0.7450981, 0, 1,
-1.247992, -0.98467, -1.008824, 1, 0.7490196, 0, 1,
-1.242164, 0.0593557, -2.903974, 1, 0.7568628, 0, 1,
-1.234214, 1.849522, -0.5495043, 1, 0.7607843, 0, 1,
-1.226579, -0.5084684, -2.068182, 1, 0.7686275, 0, 1,
-1.213099, 0.1081975, -2.482801, 1, 0.772549, 0, 1,
-1.204768, -1.14214, -3.999806, 1, 0.7803922, 0, 1,
-1.198285, -1.712658, -1.173476, 1, 0.7843137, 0, 1,
-1.197668, 1.460815, 0.126141, 1, 0.7921569, 0, 1,
-1.195161, -0.2008955, -3.083233, 1, 0.7960784, 0, 1,
-1.190966, 0.2936846, -2.13207, 1, 0.8039216, 0, 1,
-1.184982, 0.1070222, -2.558052, 1, 0.8117647, 0, 1,
-1.181407, -0.3833416, -2.880123, 1, 0.8156863, 0, 1,
-1.178817, 0.09374763, -1.818037, 1, 0.8235294, 0, 1,
-1.173868, 0.8861594, -0.133751, 1, 0.827451, 0, 1,
-1.163726, 0.3383615, -0.827991, 1, 0.8352941, 0, 1,
-1.163164, 1.398532, -0.1190371, 1, 0.8392157, 0, 1,
-1.16312, 0.1620259, -1.015143, 1, 0.8470588, 0, 1,
-1.154647, 0.7264099, -0.3874362, 1, 0.8509804, 0, 1,
-1.150324, -0.5199083, -2.625233, 1, 0.8588235, 0, 1,
-1.144303, 0.06816978, -1.54195, 1, 0.8627451, 0, 1,
-1.141115, -0.2699972, -1.546366, 1, 0.8705882, 0, 1,
-1.137473, 2.490606, -0.386686, 1, 0.8745098, 0, 1,
-1.128007, -0.5396789, -1.892433, 1, 0.8823529, 0, 1,
-1.119634, -1.224493, -1.912112, 1, 0.8862745, 0, 1,
-1.118503, -0.9503819, -2.935757, 1, 0.8941177, 0, 1,
-1.117099, 0.3525344, -0.6341724, 1, 0.8980392, 0, 1,
-1.114388, 0.6012158, 0.6788487, 1, 0.9058824, 0, 1,
-1.112902, -2.110065, -3.148527, 1, 0.9137255, 0, 1,
-1.110087, 0.8152446, -0.5101401, 1, 0.9176471, 0, 1,
-1.10667, 1.327969, -0.5305886, 1, 0.9254902, 0, 1,
-1.105795, -1.046351, -3.766609, 1, 0.9294118, 0, 1,
-1.102915, -1.438444, -2.978307, 1, 0.9372549, 0, 1,
-1.095126, -1.147496, -2.750392, 1, 0.9411765, 0, 1,
-1.086928, 1.078483, -0.9438862, 1, 0.9490196, 0, 1,
-1.084143, -0.4115213, -2.516876, 1, 0.9529412, 0, 1,
-1.083069, 1.764839, -3.026447, 1, 0.9607843, 0, 1,
-1.082166, -0.8020367, 0.2524265, 1, 0.9647059, 0, 1,
-1.079257, 0.1798872, -1.285943, 1, 0.972549, 0, 1,
-1.077894, -0.3555313, -1.850321, 1, 0.9764706, 0, 1,
-1.075452, -2.339004, -3.671055, 1, 0.9843137, 0, 1,
-1.07059, 0.283179, -1.681238, 1, 0.9882353, 0, 1,
-1.066047, 1.704974, 1.025555, 1, 0.9960784, 0, 1,
-1.053727, -1.03133, -1.64054, 0.9960784, 1, 0, 1,
-1.053008, -0.4357235, -1.369782, 0.9921569, 1, 0, 1,
-1.047286, 0.1544949, -2.02637, 0.9843137, 1, 0, 1,
-1.045549, 1.045518, -1.566493, 0.9803922, 1, 0, 1,
-1.043847, -1.142572, -2.206564, 0.972549, 1, 0, 1,
-1.04178, 0.3987144, -0.8229715, 0.9686275, 1, 0, 1,
-1.039492, 0.2525292, -2.374337, 0.9607843, 1, 0, 1,
-1.025873, 0.6308947, -1.234104, 0.9568627, 1, 0, 1,
-1.023411, 0.3528538, -2.367003, 0.9490196, 1, 0, 1,
-1.017934, -0.08539882, -3.421134, 0.945098, 1, 0, 1,
-1.016136, -2.232578, -4.09403, 0.9372549, 1, 0, 1,
-1.014768, -1.385707, -3.096, 0.9333333, 1, 0, 1,
-1.010211, -0.1526511, -2.211449, 0.9254902, 1, 0, 1,
-1.001686, -0.3351771, -3.450752, 0.9215686, 1, 0, 1,
-0.9975454, -0.1385234, -0.2662514, 0.9137255, 1, 0, 1,
-0.9938542, -0.6256761, -1.891697, 0.9098039, 1, 0, 1,
-0.9919676, 0.7880285, -2.686628, 0.9019608, 1, 0, 1,
-0.9913635, 0.7220159, 0.1905052, 0.8941177, 1, 0, 1,
-0.9910712, -0.1887873, -2.930018, 0.8901961, 1, 0, 1,
-0.987352, -0.6018637, -1.878854, 0.8823529, 1, 0, 1,
-0.9815511, 0.7170869, 0.9288882, 0.8784314, 1, 0, 1,
-0.9750394, 0.6468276, -2.752195, 0.8705882, 1, 0, 1,
-0.9728593, -0.5225977, -2.322333, 0.8666667, 1, 0, 1,
-0.9721325, 1.391026, -0.5971555, 0.8588235, 1, 0, 1,
-0.9671021, -0.2132671, -3.017586, 0.854902, 1, 0, 1,
-0.9654845, -1.216834, -3.1557, 0.8470588, 1, 0, 1,
-0.9590688, 0.6716991, -0.08341515, 0.8431373, 1, 0, 1,
-0.9590032, -1.823511, 0.07831836, 0.8352941, 1, 0, 1,
-0.952527, 1.120902, -1.636683, 0.8313726, 1, 0, 1,
-0.9475855, -0.38831, -2.699389, 0.8235294, 1, 0, 1,
-0.9436341, 1.126589, -2.615304, 0.8196079, 1, 0, 1,
-0.9413483, -0.07742497, -2.311152, 0.8117647, 1, 0, 1,
-0.9391426, 0.3711156, -2.20966, 0.8078431, 1, 0, 1,
-0.9388075, -1.903744, -2.667338, 0.8, 1, 0, 1,
-0.9377068, 0.5019226, -1.638983, 0.7921569, 1, 0, 1,
-0.9336765, 2.152803, -0.99276, 0.7882353, 1, 0, 1,
-0.9293533, -0.1630643, -1.402944, 0.7803922, 1, 0, 1,
-0.9176698, 0.6612425, -1.347867, 0.7764706, 1, 0, 1,
-0.9082971, 0.4245299, 0.6443858, 0.7686275, 1, 0, 1,
-0.9054361, -0.8899902, -3.257608, 0.7647059, 1, 0, 1,
-0.9031377, -0.5016872, -0.7203438, 0.7568628, 1, 0, 1,
-0.8976088, -0.225292, -3.200481, 0.7529412, 1, 0, 1,
-0.8952367, 0.2877814, -1.142779, 0.7450981, 1, 0, 1,
-0.8938122, 0.1194994, -2.795111, 0.7411765, 1, 0, 1,
-0.8853462, -1.008638, -1.697218, 0.7333333, 1, 0, 1,
-0.87967, 0.2337305, -2.132552, 0.7294118, 1, 0, 1,
-0.8764002, 0.5462444, 0.5146945, 0.7215686, 1, 0, 1,
-0.8722284, 0.5789515, -0.2465367, 0.7176471, 1, 0, 1,
-0.8719298, 0.3955491, -0.5054067, 0.7098039, 1, 0, 1,
-0.8650151, 0.8340701, 0.4222725, 0.7058824, 1, 0, 1,
-0.8555236, -1.153897, -4.004827, 0.6980392, 1, 0, 1,
-0.844872, 2.1975, 2.364115, 0.6901961, 1, 0, 1,
-0.8415242, -0.06042755, -2.226612, 0.6862745, 1, 0, 1,
-0.8398064, -2.241381, -3.934026, 0.6784314, 1, 0, 1,
-0.8384496, -0.7368719, -2.529169, 0.6745098, 1, 0, 1,
-0.826372, 1.286635, -0.7325385, 0.6666667, 1, 0, 1,
-0.8176441, -0.4891751, -1.116094, 0.6627451, 1, 0, 1,
-0.8162634, 0.1351093, -1.909869, 0.654902, 1, 0, 1,
-0.8117556, 0.3099671, -2.391411, 0.6509804, 1, 0, 1,
-0.8104596, 0.4073256, 0.4091977, 0.6431373, 1, 0, 1,
-0.797232, 1.198037, -1.371714, 0.6392157, 1, 0, 1,
-0.7828154, 0.4325319, -1.954525, 0.6313726, 1, 0, 1,
-0.7805048, -0.3846849, -1.86121, 0.627451, 1, 0, 1,
-0.7796577, -0.3108199, -1.061033, 0.6196079, 1, 0, 1,
-0.7718651, 1.31241, 0.1328564, 0.6156863, 1, 0, 1,
-0.769609, -0.6100686, -1.072101, 0.6078432, 1, 0, 1,
-0.7626318, 0.758319, -0.8500369, 0.6039216, 1, 0, 1,
-0.7597257, 0.883132, 0.09670822, 0.5960785, 1, 0, 1,
-0.7551859, -0.7005661, -0.8115349, 0.5882353, 1, 0, 1,
-0.7523001, 0.3854766, -2.101393, 0.5843138, 1, 0, 1,
-0.752103, -1.214127, -3.191273, 0.5764706, 1, 0, 1,
-0.7498776, 1.504383, -2.077868, 0.572549, 1, 0, 1,
-0.746657, -1.530892, -1.614162, 0.5647059, 1, 0, 1,
-0.7441221, -0.7318032, -2.21814, 0.5607843, 1, 0, 1,
-0.7409147, 0.3675848, -2.946374, 0.5529412, 1, 0, 1,
-0.7281867, -0.6938914, -1.238741, 0.5490196, 1, 0, 1,
-0.725463, 0.7606581, 0.2654408, 0.5411765, 1, 0, 1,
-0.7188473, -0.7395445, -2.050824, 0.5372549, 1, 0, 1,
-0.7130076, 0.1941724, -1.740925, 0.5294118, 1, 0, 1,
-0.7116302, -0.7704971, -1.646185, 0.5254902, 1, 0, 1,
-0.7113959, -0.4442946, -0.8500704, 0.5176471, 1, 0, 1,
-0.7102648, -0.7673275, -1.261399, 0.5137255, 1, 0, 1,
-0.7032335, -1.698671, -3.773494, 0.5058824, 1, 0, 1,
-0.7032095, 0.1193832, -1.261344, 0.5019608, 1, 0, 1,
-0.7009449, 2.325043, 0.8365703, 0.4941176, 1, 0, 1,
-0.6984075, 0.2617516, -1.526373, 0.4862745, 1, 0, 1,
-0.6967036, 1.736351, -2.277961, 0.4823529, 1, 0, 1,
-0.6959324, -0.1123872, -1.437006, 0.4745098, 1, 0, 1,
-0.6955072, 0.2478087, 0.9733362, 0.4705882, 1, 0, 1,
-0.6918756, 0.05023509, -2.837399, 0.4627451, 1, 0, 1,
-0.6897128, 0.3717113, -0.3300547, 0.4588235, 1, 0, 1,
-0.6886086, -0.4596942, -0.05196088, 0.4509804, 1, 0, 1,
-0.6861193, 0.1883951, -1.926043, 0.4470588, 1, 0, 1,
-0.6804122, 0.6376272, -2.867399, 0.4392157, 1, 0, 1,
-0.6674176, -1.709978, -3.135688, 0.4352941, 1, 0, 1,
-0.6668218, 2.706376, -0.5353965, 0.427451, 1, 0, 1,
-0.663527, -2.026269, -3.238788, 0.4235294, 1, 0, 1,
-0.6632822, -0.6967711, -0.2846263, 0.4156863, 1, 0, 1,
-0.6588576, 1.253613, 0.7910689, 0.4117647, 1, 0, 1,
-0.655569, 2.289898, -1.569289, 0.4039216, 1, 0, 1,
-0.6520222, -1.269558, -3.770872, 0.3960784, 1, 0, 1,
-0.6440681, -1.16101, -3.228819, 0.3921569, 1, 0, 1,
-0.6432864, -0.3352489, -0.1979304, 0.3843137, 1, 0, 1,
-0.6397755, 0.2857853, -1.71309, 0.3803922, 1, 0, 1,
-0.6375663, 0.3352851, -1.32, 0.372549, 1, 0, 1,
-0.6305724, 0.5890338, -2.107135, 0.3686275, 1, 0, 1,
-0.6254378, 0.3042148, -1.727054, 0.3607843, 1, 0, 1,
-0.6239093, 0.60945, -1.696386, 0.3568628, 1, 0, 1,
-0.6228082, -0.3110387, -1.643134, 0.3490196, 1, 0, 1,
-0.6161429, -0.929187, -3.593858, 0.345098, 1, 0, 1,
-0.6155668, 0.03815042, 0.4361782, 0.3372549, 1, 0, 1,
-0.6154093, 0.06574478, -1.793031, 0.3333333, 1, 0, 1,
-0.615276, 0.5272387, -1.809482, 0.3254902, 1, 0, 1,
-0.6150997, -2.340633, -2.17157, 0.3215686, 1, 0, 1,
-0.6137685, -1.3154, -3.370553, 0.3137255, 1, 0, 1,
-0.6134657, -3.271391, -4.723019, 0.3098039, 1, 0, 1,
-0.6122773, -0.2423007, -0.8846223, 0.3019608, 1, 0, 1,
-0.6081899, 0.02508198, -1.366739, 0.2941177, 1, 0, 1,
-0.6069, -1.564679, -2.705153, 0.2901961, 1, 0, 1,
-0.6020823, 0.4662226, 0.3093307, 0.282353, 1, 0, 1,
-0.6013693, -0.3300702, -2.231275, 0.2784314, 1, 0, 1,
-0.6001333, 1.180637, -1.472576, 0.2705882, 1, 0, 1,
-0.5983236, -1.740217, -3.239457, 0.2666667, 1, 0, 1,
-0.5974626, -0.4931194, -1.928858, 0.2588235, 1, 0, 1,
-0.5971489, -0.8678092, -2.862715, 0.254902, 1, 0, 1,
-0.5913017, 0.7582031, 0.801393, 0.2470588, 1, 0, 1,
-0.5909618, -1.377114, -2.537682, 0.2431373, 1, 0, 1,
-0.5902261, 1.963268, 0.9508542, 0.2352941, 1, 0, 1,
-0.5798843, 0.9101658, -1.219703, 0.2313726, 1, 0, 1,
-0.5738145, -0.9162099, -2.167928, 0.2235294, 1, 0, 1,
-0.5711505, -0.06140536, -1.776877, 0.2196078, 1, 0, 1,
-0.5705387, -0.3559254, -2.276067, 0.2117647, 1, 0, 1,
-0.5698105, -1.43663, -3.729302, 0.2078431, 1, 0, 1,
-0.5668682, -0.3855857, -1.365201, 0.2, 1, 0, 1,
-0.5628982, -0.1085159, -0.9111612, 0.1921569, 1, 0, 1,
-0.5619566, 1.280262, -0.1711941, 0.1882353, 1, 0, 1,
-0.560559, -1.686213, -2.36434, 0.1803922, 1, 0, 1,
-0.5580094, 0.1632364, 0.1905065, 0.1764706, 1, 0, 1,
-0.5539811, 0.7878995, 0.08858519, 0.1686275, 1, 0, 1,
-0.553546, 0.5647979, -1.444519, 0.1647059, 1, 0, 1,
-0.5522923, -0.1778734, -2.55988, 0.1568628, 1, 0, 1,
-0.5453706, 0.2101503, -0.3072842, 0.1529412, 1, 0, 1,
-0.5450391, 0.1346297, -0.6751962, 0.145098, 1, 0, 1,
-0.5430827, -0.3635844, -3.42542, 0.1411765, 1, 0, 1,
-0.541323, -0.1108163, -0.6055796, 0.1333333, 1, 0, 1,
-0.5399327, -0.2305817, -1.166235, 0.1294118, 1, 0, 1,
-0.5393291, -0.009882821, -2.1529, 0.1215686, 1, 0, 1,
-0.5388703, -0.295958, -2.792174, 0.1176471, 1, 0, 1,
-0.5377558, 0.9783969, -0.7863115, 0.1098039, 1, 0, 1,
-0.5300707, -0.6663805, -1.997742, 0.1058824, 1, 0, 1,
-0.5299257, -0.3477052, -2.617488, 0.09803922, 1, 0, 1,
-0.5295534, 0.5638651, -1.626601, 0.09019608, 1, 0, 1,
-0.5171384, -0.2340005, 0.7784456, 0.08627451, 1, 0, 1,
-0.5121317, 0.8935256, 0.4551133, 0.07843138, 1, 0, 1,
-0.5084348, 0.4390631, 0.172868, 0.07450981, 1, 0, 1,
-0.5055465, 0.38663, -0.6119117, 0.06666667, 1, 0, 1,
-0.4954419, -0.5628569, -1.51051, 0.0627451, 1, 0, 1,
-0.4935872, 0.7950892, -2.767085, 0.05490196, 1, 0, 1,
-0.4899222, 2.00419, -2.013134, 0.05098039, 1, 0, 1,
-0.4888095, 0.2709215, -3.14999, 0.04313726, 1, 0, 1,
-0.485404, -1.568905, -3.541289, 0.03921569, 1, 0, 1,
-0.4769164, -0.3314292, -3.720112, 0.03137255, 1, 0, 1,
-0.4756817, 0.2063218, -2.114053, 0.02745098, 1, 0, 1,
-0.4737248, 0.0983123, -0.7308122, 0.01960784, 1, 0, 1,
-0.4715474, 1.462208, -0.3401082, 0.01568628, 1, 0, 1,
-0.46932, 1.303551, -0.7560894, 0.007843138, 1, 0, 1,
-0.4691115, -0.3449844, -2.757931, 0.003921569, 1, 0, 1,
-0.463508, 1.030145, -0.04697188, 0, 1, 0.003921569, 1,
-0.4583916, -0.2662111, -1.02634, 0, 1, 0.01176471, 1,
-0.4531775, -0.3722485, -0.7094175, 0, 1, 0.01568628, 1,
-0.4528478, 1.086041, -0.1368249, 0, 1, 0.02352941, 1,
-0.4491329, 1.283986, -0.4509742, 0, 1, 0.02745098, 1,
-0.4470839, -0.5123624, -2.6045, 0, 1, 0.03529412, 1,
-0.4442707, 0.81378, -1.291487, 0, 1, 0.03921569, 1,
-0.4347478, 0.8449893, -1.804703, 0, 1, 0.04705882, 1,
-0.4345663, -0.1061231, -3.507787, 0, 1, 0.05098039, 1,
-0.427699, 0.3933815, -1.64456, 0, 1, 0.05882353, 1,
-0.4263366, 0.3181984, -0.0376061, 0, 1, 0.0627451, 1,
-0.4258463, -1.277162, -1.868407, 0, 1, 0.07058824, 1,
-0.4228764, 0.6826137, -0.6361908, 0, 1, 0.07450981, 1,
-0.42252, -0.5259922, -1.185944, 0, 1, 0.08235294, 1,
-0.4201167, -1.132711, -1.948943, 0, 1, 0.08627451, 1,
-0.4167082, -1.034871, -2.79209, 0, 1, 0.09411765, 1,
-0.4046328, 1.123302, -1.121527, 0, 1, 0.1019608, 1,
-0.4030696, 0.5316871, -1.888743, 0, 1, 0.1058824, 1,
-0.4003405, -0.5891759, -2.088593, 0, 1, 0.1137255, 1,
-0.3983992, -1.848657, -3.584702, 0, 1, 0.1176471, 1,
-0.3972527, -0.480163, -4.37129, 0, 1, 0.1254902, 1,
-0.395874, 0.1003207, -2.724342, 0, 1, 0.1294118, 1,
-0.3903402, -1.628281, -3.076354, 0, 1, 0.1372549, 1,
-0.3893685, -1.262017, -2.037452, 0, 1, 0.1411765, 1,
-0.3890015, 0.24942, -1.385582, 0, 1, 0.1490196, 1,
-0.3839135, -1.004846, -1.869816, 0, 1, 0.1529412, 1,
-0.3837948, 1.799893, -2.51484, 0, 1, 0.1607843, 1,
-0.3833509, 1.079107, -1.637857, 0, 1, 0.1647059, 1,
-0.3761089, 0.4094632, -0.7282445, 0, 1, 0.172549, 1,
-0.3699411, 0.2864209, -2.415608, 0, 1, 0.1764706, 1,
-0.3694584, 1.364397, -0.6442005, 0, 1, 0.1843137, 1,
-0.3679247, -0.5634326, -4.618713, 0, 1, 0.1882353, 1,
-0.3677964, 0.4741915, -0.8179285, 0, 1, 0.1960784, 1,
-0.3670388, -0.7986836, -1.320626, 0, 1, 0.2039216, 1,
-0.3624521, -0.862472, -3.030882, 0, 1, 0.2078431, 1,
-0.3615226, 0.8157448, 0.07192995, 0, 1, 0.2156863, 1,
-0.3607149, -0.7611303, -2.153746, 0, 1, 0.2196078, 1,
-0.3599961, 0.5462088, 0.1771786, 0, 1, 0.227451, 1,
-0.3570132, -0.2483625, -1.683586, 0, 1, 0.2313726, 1,
-0.3552994, -1.882689, -4.47686, 0, 1, 0.2392157, 1,
-0.3520448, -0.2046002, -2.557393, 0, 1, 0.2431373, 1,
-0.3500568, 0.5964419, 0.850323, 0, 1, 0.2509804, 1,
-0.3473101, 0.754176, -1.338316, 0, 1, 0.254902, 1,
-0.3462445, -0.6841385, -2.037821, 0, 1, 0.2627451, 1,
-0.340838, 0.01565357, -1.741832, 0, 1, 0.2666667, 1,
-0.3351173, -1.146761, -3.764186, 0, 1, 0.2745098, 1,
-0.334957, 0.4579723, 0.06081412, 0, 1, 0.2784314, 1,
-0.3349107, -0.5484462, -2.746023, 0, 1, 0.2862745, 1,
-0.3333647, -2.179738, -2.810823, 0, 1, 0.2901961, 1,
-0.3320669, -0.6292419, -2.282146, 0, 1, 0.2980392, 1,
-0.3236486, 1.022158, -1.099665, 0, 1, 0.3058824, 1,
-0.3212076, -0.280381, -2.424148, 0, 1, 0.3098039, 1,
-0.3211126, 0.2830394, 0.1441761, 0, 1, 0.3176471, 1,
-0.3195606, -0.5216109, -2.680251, 0, 1, 0.3215686, 1,
-0.3167949, -0.4116004, -1.319437, 0, 1, 0.3294118, 1,
-0.3139075, 1.027204, 0.8471105, 0, 1, 0.3333333, 1,
-0.3118245, -0.6009706, -2.641826, 0, 1, 0.3411765, 1,
-0.3117227, 0.08815186, -2.592385, 0, 1, 0.345098, 1,
-0.3115239, -0.2017813, -2.106524, 0, 1, 0.3529412, 1,
-0.3097174, 0.09759986, -2.244894, 0, 1, 0.3568628, 1,
-0.3083006, 0.5775203, -1.660174, 0, 1, 0.3647059, 1,
-0.3078542, 0.519701, -1.358477, 0, 1, 0.3686275, 1,
-0.3075457, -0.1568315, -1.727265, 0, 1, 0.3764706, 1,
-0.3056928, 0.701851, -0.5326482, 0, 1, 0.3803922, 1,
-0.3019662, 1.733644, -1.018895, 0, 1, 0.3882353, 1,
-0.2975677, -0.20676, -2.673494, 0, 1, 0.3921569, 1,
-0.2940861, -0.7513615, -3.764562, 0, 1, 0.4, 1,
-0.2940059, -0.1374391, -2.206004, 0, 1, 0.4078431, 1,
-0.2915463, -2.12597, -1.849094, 0, 1, 0.4117647, 1,
-0.2906616, -1.509955, -3.471586, 0, 1, 0.4196078, 1,
-0.2819335, 1.143265, -1.658834, 0, 1, 0.4235294, 1,
-0.2763047, 1.050425, -0.3895012, 0, 1, 0.4313726, 1,
-0.272879, 1.541098, 1.473963, 0, 1, 0.4352941, 1,
-0.2711945, 0.2687756, -1.019615, 0, 1, 0.4431373, 1,
-0.2701109, -2.770137, -2.36277, 0, 1, 0.4470588, 1,
-0.2699513, -0.2362837, -3.281484, 0, 1, 0.454902, 1,
-0.2659016, -0.6260297, -3.436777, 0, 1, 0.4588235, 1,
-0.2654791, 0.2922492, -2.802722, 0, 1, 0.4666667, 1,
-0.2534016, -1.521078, -3.872178, 0, 1, 0.4705882, 1,
-0.2526937, -1.325168, -4.197478, 0, 1, 0.4784314, 1,
-0.25159, -0.7961881, -1.260436, 0, 1, 0.4823529, 1,
-0.2500412, -0.9372966, -2.533197, 0, 1, 0.4901961, 1,
-0.2463663, -0.1565616, -1.530331, 0, 1, 0.4941176, 1,
-0.2415158, -0.3868169, -2.069121, 0, 1, 0.5019608, 1,
-0.2375974, -0.005147386, -0.9079893, 0, 1, 0.509804, 1,
-0.2373461, 0.7878768, 1.242332, 0, 1, 0.5137255, 1,
-0.235838, -1.329942, -1.175332, 0, 1, 0.5215687, 1,
-0.2356198, 1.206613, -0.3374068, 0, 1, 0.5254902, 1,
-0.2284435, -1.196357, -1.854396, 0, 1, 0.5333334, 1,
-0.2271256, -0.6197142, -3.831774, 0, 1, 0.5372549, 1,
-0.2242388, 1.529238, 0.1984843, 0, 1, 0.5450981, 1,
-0.2185442, -0.7506167, -4.079531, 0, 1, 0.5490196, 1,
-0.2165416, -0.9079356, -4.636116, 0, 1, 0.5568628, 1,
-0.2161445, 0.75519, 0.2086171, 0, 1, 0.5607843, 1,
-0.2107331, -0.1173578, -0.3573029, 0, 1, 0.5686275, 1,
-0.20751, -0.2784325, -1.762384, 0, 1, 0.572549, 1,
-0.2028625, -0.5194555, -4.834104, 0, 1, 0.5803922, 1,
-0.2026382, 2.065088, -0.1826113, 0, 1, 0.5843138, 1,
-0.2018941, -1.079304, -5.310837, 0, 1, 0.5921569, 1,
-0.1951919, 0.3034785, -1.055743, 0, 1, 0.5960785, 1,
-0.1920513, 1.426313, -0.7309757, 0, 1, 0.6039216, 1,
-0.1914706, -1.57793, -3.886086, 0, 1, 0.6117647, 1,
-0.1862993, 1.205398, -1.5455, 0, 1, 0.6156863, 1,
-0.1851303, -0.7675685, -1.821344, 0, 1, 0.6235294, 1,
-0.1850448, -0.4077429, -4.153826, 0, 1, 0.627451, 1,
-0.1835314, 1.49259, -0.5424777, 0, 1, 0.6352941, 1,
-0.1833426, 0.4399276, 1.090035, 0, 1, 0.6392157, 1,
-0.1817069, -0.1684988, -0.8330904, 0, 1, 0.6470588, 1,
-0.1802048, 2.521409, -1.923424, 0, 1, 0.6509804, 1,
-0.1796023, 1.38095, -0.6863896, 0, 1, 0.6588235, 1,
-0.1749901, 0.2295542, 0.2011558, 0, 1, 0.6627451, 1,
-0.1743327, 0.7808118, 0.9442315, 0, 1, 0.6705883, 1,
-0.1736963, 0.7301923, 1.895699, 0, 1, 0.6745098, 1,
-0.1726968, -0.02061443, -2.922687, 0, 1, 0.682353, 1,
-0.1717031, -0.2278007, -2.151201, 0, 1, 0.6862745, 1,
-0.1699648, -0.4617317, -3.924768, 0, 1, 0.6941177, 1,
-0.1654376, 0.2798669, 0.07386567, 0, 1, 0.7019608, 1,
-0.1635449, 1.592932, -0.2927529, 0, 1, 0.7058824, 1,
-0.1571757, 1.046303, -0.2439843, 0, 1, 0.7137255, 1,
-0.1565506, -0.4708881, -2.6789, 0, 1, 0.7176471, 1,
-0.1534475, 0.09692451, -0.6881254, 0, 1, 0.7254902, 1,
-0.1489943, -1.375058, -3.056307, 0, 1, 0.7294118, 1,
-0.1488086, -1.210531, -2.77145, 0, 1, 0.7372549, 1,
-0.1481173, -0.2836556, -3.914291, 0, 1, 0.7411765, 1,
-0.1468309, 1.213649, -0.2401023, 0, 1, 0.7490196, 1,
-0.1437668, -0.5555512, -4.262396, 0, 1, 0.7529412, 1,
-0.1406322, 1.812737, 0.2575741, 0, 1, 0.7607843, 1,
-0.1388547, -1.412167, -2.97061, 0, 1, 0.7647059, 1,
-0.1375801, -1.263554, -2.752838, 0, 1, 0.772549, 1,
-0.1373919, 0.064771, -1.406942, 0, 1, 0.7764706, 1,
-0.1373819, -0.9471992, -4.050237, 0, 1, 0.7843137, 1,
-0.1365033, -0.6105993, -4.202107, 0, 1, 0.7882353, 1,
-0.1359845, 0.2951135, 0.1160898, 0, 1, 0.7960784, 1,
-0.133176, 1.844128, 0.7644745, 0, 1, 0.8039216, 1,
-0.1315624, 0.3803811, -2.137417, 0, 1, 0.8078431, 1,
-0.1297834, -0.9005548, -2.293762, 0, 1, 0.8156863, 1,
-0.1284356, -0.7963027, -2.76275, 0, 1, 0.8196079, 1,
-0.1270731, 0.8768699, -0.9319046, 0, 1, 0.827451, 1,
-0.1253226, -0.5698158, -3.162506, 0, 1, 0.8313726, 1,
-0.1117751, -0.5351316, -2.272245, 0, 1, 0.8392157, 1,
-0.1112867, 0.6980101, -1.09247, 0, 1, 0.8431373, 1,
-0.106664, -0.2507141, -3.15618, 0, 1, 0.8509804, 1,
-0.106222, 1.53829, 0.4225909, 0, 1, 0.854902, 1,
-0.1048861, 0.6571199, -0.9514242, 0, 1, 0.8627451, 1,
-0.1040064, -0.8736454, -1.231378, 0, 1, 0.8666667, 1,
-0.1018085, -0.6518694, -2.457313, 0, 1, 0.8745098, 1,
-0.1014812, -0.9389188, -3.02914, 0, 1, 0.8784314, 1,
-0.09765151, -0.4871382, -0.8574384, 0, 1, 0.8862745, 1,
-0.09746195, 1.05617, -0.5055363, 0, 1, 0.8901961, 1,
-0.08694817, -0.4392057, -4.034523, 0, 1, 0.8980392, 1,
-0.08558497, -0.3070349, -2.395804, 0, 1, 0.9058824, 1,
-0.08350216, 0.4274643, 0.7221722, 0, 1, 0.9098039, 1,
-0.08268218, -0.7376296, -2.171411, 0, 1, 0.9176471, 1,
-0.08070401, 2.342553, -1.455988, 0, 1, 0.9215686, 1,
-0.07578518, 0.03036327, -1.220834, 0, 1, 0.9294118, 1,
-0.07526566, 0.700648, -0.2525777, 0, 1, 0.9333333, 1,
-0.074099, -0.30879, -2.660652, 0, 1, 0.9411765, 1,
-0.073479, 1.024099, -0.1473184, 0, 1, 0.945098, 1,
-0.06581768, 0.6552014, -0.2968214, 0, 1, 0.9529412, 1,
-0.0609739, 0.4767464, -0.9342084, 0, 1, 0.9568627, 1,
-0.05941955, 1.082172, 1.049922, 0, 1, 0.9647059, 1,
-0.05780297, -0.07686331, -2.488189, 0, 1, 0.9686275, 1,
-0.05567573, -1.098225, -3.874958, 0, 1, 0.9764706, 1,
-0.05402518, 0.2494353, 0.6340187, 0, 1, 0.9803922, 1,
-0.05217713, 0.3351162, -0.07273563, 0, 1, 0.9882353, 1,
-0.05092296, 0.7840903, 1.161155, 0, 1, 0.9921569, 1,
-0.0483719, 0.4068392, 0.819517, 0, 1, 1, 1,
-0.04835626, 0.2548131, 0.4979617, 0, 0.9921569, 1, 1,
-0.04429534, 0.6889027, 1.028256, 0, 0.9882353, 1, 1,
-0.04254134, -0.4655432, -2.908023, 0, 0.9803922, 1, 1,
-0.04217469, -0.9507671, -1.879849, 0, 0.9764706, 1, 1,
-0.03674655, 0.1112127, 1.207377, 0, 0.9686275, 1, 1,
-0.03611369, -0.4266739, -3.995202, 0, 0.9647059, 1, 1,
-0.0337086, -0.9457455, -3.660622, 0, 0.9568627, 1, 1,
-0.03190127, 0.8867865, -0.2880357, 0, 0.9529412, 1, 1,
-0.02753358, 0.4995602, -0.9814057, 0, 0.945098, 1, 1,
-0.02319398, 0.7208949, -2.30695, 0, 0.9411765, 1, 1,
-0.02210704, 0.8637796, 0.5940585, 0, 0.9333333, 1, 1,
-0.02143456, -0.1006595, -0.9080424, 0, 0.9294118, 1, 1,
-0.01982199, 0.3185138, 0.3538454, 0, 0.9215686, 1, 1,
-0.01774006, -1.355515, -2.768482, 0, 0.9176471, 1, 1,
-0.01555737, 0.4872176, -0.0499555, 0, 0.9098039, 1, 1,
-0.01383514, -0.7655309, -3.800598, 0, 0.9058824, 1, 1,
-0.01368628, -0.824216, -1.993578, 0, 0.8980392, 1, 1,
-0.01243514, -1.359533, -3.289579, 0, 0.8901961, 1, 1,
-0.004949346, 1.165147, -1.128681, 0, 0.8862745, 1, 1,
-0.0005687132, 1.626958, -1.003993, 0, 0.8784314, 1, 1,
0.004830202, -1.279432, 2.339891, 0, 0.8745098, 1, 1,
0.01256445, -1.288563, 3.054752, 0, 0.8666667, 1, 1,
0.01936201, 0.1932506, 0.2622558, 0, 0.8627451, 1, 1,
0.0194671, 1.102619, 0.5344187, 0, 0.854902, 1, 1,
0.01988225, 0.2448209, -1.49583, 0, 0.8509804, 1, 1,
0.02263052, 1.10768, -1.940691, 0, 0.8431373, 1, 1,
0.02275045, -0.7543305, 3.169437, 0, 0.8392157, 1, 1,
0.02308976, -1.091096, 2.752756, 0, 0.8313726, 1, 1,
0.02631561, -1.112205, 4.769445, 0, 0.827451, 1, 1,
0.02688462, 0.2585166, -0.0804657, 0, 0.8196079, 1, 1,
0.04103082, 0.7043328, -1.397837, 0, 0.8156863, 1, 1,
0.04288804, 0.9104493, 0.2852419, 0, 0.8078431, 1, 1,
0.0444143, -0.3138613, 3.910578, 0, 0.8039216, 1, 1,
0.04538105, 1.501648, 0.1400243, 0, 0.7960784, 1, 1,
0.04554909, -0.01779019, 1.837251, 0, 0.7882353, 1, 1,
0.05023907, -0.7403578, 4.053912, 0, 0.7843137, 1, 1,
0.05047136, -1.476645, 5.039361, 0, 0.7764706, 1, 1,
0.05100749, -0.04030768, 2.313594, 0, 0.772549, 1, 1,
0.05135588, 1.634572, 1.344345, 0, 0.7647059, 1, 1,
0.05317866, 1.31512, -0.3542391, 0, 0.7607843, 1, 1,
0.05329438, 0.3157159, 1.665993, 0, 0.7529412, 1, 1,
0.05484091, -0.3405735, 1.791031, 0, 0.7490196, 1, 1,
0.05547272, -0.1843227, 4.235138, 0, 0.7411765, 1, 1,
0.0573962, -2.01283, 3.400821, 0, 0.7372549, 1, 1,
0.06038061, 1.167973, 0.6737943, 0, 0.7294118, 1, 1,
0.06466343, -1.389316, 3.725801, 0, 0.7254902, 1, 1,
0.06709564, -1.475741, 4.230893, 0, 0.7176471, 1, 1,
0.07720949, -0.7090917, 3.081448, 0, 0.7137255, 1, 1,
0.07761453, 0.09379177, 0.6084425, 0, 0.7058824, 1, 1,
0.0786216, 1.83848, -0.07820575, 0, 0.6980392, 1, 1,
0.07961735, -1.93435, 4.039678, 0, 0.6941177, 1, 1,
0.08499432, 0.9029945, -0.3737175, 0, 0.6862745, 1, 1,
0.08617892, -0.2963514, 1.124349, 0, 0.682353, 1, 1,
0.08626534, 1.237595, -0.2183318, 0, 0.6745098, 1, 1,
0.09059691, -0.9233757, 2.806379, 0, 0.6705883, 1, 1,
0.09334408, 1.035236, 0.2046216, 0, 0.6627451, 1, 1,
0.09471747, -0.7468339, 2.724506, 0, 0.6588235, 1, 1,
0.09629012, 1.092505, -0.4675353, 0, 0.6509804, 1, 1,
0.09656953, 0.43391, 0.2685356, 0, 0.6470588, 1, 1,
0.1018578, -0.3510668, 2.869334, 0, 0.6392157, 1, 1,
0.1039551, 1.17837, 1.308409, 0, 0.6352941, 1, 1,
0.104887, -2.853367, 2.338866, 0, 0.627451, 1, 1,
0.1058331, 1.930035, 0.3296186, 0, 0.6235294, 1, 1,
0.1072824, -1.350645, 3.402788, 0, 0.6156863, 1, 1,
0.1085606, 0.2342567, 0.2196625, 0, 0.6117647, 1, 1,
0.1105446, 0.4407355, -0.760368, 0, 0.6039216, 1, 1,
0.1140737, -0.852634, 3.574346, 0, 0.5960785, 1, 1,
0.1158431, -0.9400231, 3.712872, 0, 0.5921569, 1, 1,
0.1178142, 1.325402, 0.7960069, 0, 0.5843138, 1, 1,
0.1179084, -0.9840356, 0.977964, 0, 0.5803922, 1, 1,
0.1234479, -1.303328, 1.626417, 0, 0.572549, 1, 1,
0.1242482, -1.030564, 1.47655, 0, 0.5686275, 1, 1,
0.1272334, -0.01377744, 1.047373, 0, 0.5607843, 1, 1,
0.1292332, 0.2768015, -0.8320512, 0, 0.5568628, 1, 1,
0.1330494, -0.843548, 2.513901, 0, 0.5490196, 1, 1,
0.1368552, 0.9317937, -1.092488, 0, 0.5450981, 1, 1,
0.1389474, -1.313053, 2.475303, 0, 0.5372549, 1, 1,
0.1408678, 0.4647276, 0.630834, 0, 0.5333334, 1, 1,
0.1417094, -0.564151, 2.971195, 0, 0.5254902, 1, 1,
0.1456453, -1.348853, 1.92048, 0, 0.5215687, 1, 1,
0.1582464, -1.381821, 3.215441, 0, 0.5137255, 1, 1,
0.1611423, -0.5824973, 2.994879, 0, 0.509804, 1, 1,
0.1616144, 0.5175955, 1.453829, 0, 0.5019608, 1, 1,
0.1635932, 0.1930319, -0.01227654, 0, 0.4941176, 1, 1,
0.1639928, -0.09923904, 2.458328, 0, 0.4901961, 1, 1,
0.1642388, 0.9597445, 0.1578241, 0, 0.4823529, 1, 1,
0.1643724, -0.7960984, 3.472916, 0, 0.4784314, 1, 1,
0.1660132, 2.300419, -0.8608068, 0, 0.4705882, 1, 1,
0.1725036, 1.338104, -0.36032, 0, 0.4666667, 1, 1,
0.1782798, 1.10979, 0.5014785, 0, 0.4588235, 1, 1,
0.1802064, -0.7591764, 2.769533, 0, 0.454902, 1, 1,
0.1894553, -0.6203825, 2.368639, 0, 0.4470588, 1, 1,
0.1929018, -0.743745, 2.856819, 0, 0.4431373, 1, 1,
0.1934732, 0.3606731, 0.737153, 0, 0.4352941, 1, 1,
0.1956052, -1.074183, 2.579087, 0, 0.4313726, 1, 1,
0.197438, 0.2572598, 0.06917045, 0, 0.4235294, 1, 1,
0.2065266, -0.1063805, 1.949023, 0, 0.4196078, 1, 1,
0.2088547, 0.1252012, 1.39193, 0, 0.4117647, 1, 1,
0.2100693, 0.6888806, 0.507234, 0, 0.4078431, 1, 1,
0.2169924, 0.02188429, 2.698995, 0, 0.4, 1, 1,
0.2174966, -3.014902, 3.615131, 0, 0.3921569, 1, 1,
0.2191054, 1.519866, 0.1049553, 0, 0.3882353, 1, 1,
0.2191242, 1.444469, 2.320506, 0, 0.3803922, 1, 1,
0.2206548, 0.35971, 0.06978761, 0, 0.3764706, 1, 1,
0.2207377, -0.5787866, 3.059225, 0, 0.3686275, 1, 1,
0.2220776, 1.500568, 1.017097, 0, 0.3647059, 1, 1,
0.2224234, -0.7975443, 3.564922, 0, 0.3568628, 1, 1,
0.2247112, 0.1899484, -0.5307686, 0, 0.3529412, 1, 1,
0.2256756, -0.5365415, 3.324068, 0, 0.345098, 1, 1,
0.227139, 1.457427, 0.4825672, 0, 0.3411765, 1, 1,
0.2280862, -0.4021868, 1.615319, 0, 0.3333333, 1, 1,
0.2297283, -0.9046742, 3.644522, 0, 0.3294118, 1, 1,
0.2350877, -0.8792933, 1.851716, 0, 0.3215686, 1, 1,
0.2359822, 1.704603, 1.486806, 0, 0.3176471, 1, 1,
0.2408371, 0.7707403, -0.1261536, 0, 0.3098039, 1, 1,
0.2433207, -0.05309825, 1.33131, 0, 0.3058824, 1, 1,
0.2450987, -0.641106, 2.958306, 0, 0.2980392, 1, 1,
0.2458164, -1.376129, 3.40141, 0, 0.2901961, 1, 1,
0.2472412, 0.4756671, 1.663281, 0, 0.2862745, 1, 1,
0.2495559, -0.5105559, 1.540034, 0, 0.2784314, 1, 1,
0.2502911, 0.9831725, 0.6347802, 0, 0.2745098, 1, 1,
0.251328, 0.7051741, 1.145818, 0, 0.2666667, 1, 1,
0.2517138, -0.9602312, 3.137264, 0, 0.2627451, 1, 1,
0.2528951, -0.4949847, 3.172478, 0, 0.254902, 1, 1,
0.2594812, -0.4218595, 3.885135, 0, 0.2509804, 1, 1,
0.259559, -1.013783, 2.982398, 0, 0.2431373, 1, 1,
0.2631747, -1.174261, 2.413182, 0, 0.2392157, 1, 1,
0.2685733, 1.32822, -0.04851147, 0, 0.2313726, 1, 1,
0.2689999, -1.585982, 3.732065, 0, 0.227451, 1, 1,
0.2744933, -0.8324744, 4.711045, 0, 0.2196078, 1, 1,
0.2814174, 0.2334178, 1.150228, 0, 0.2156863, 1, 1,
0.2819655, -0.8838756, 1.791059, 0, 0.2078431, 1, 1,
0.287374, -0.7127644, 2.744705, 0, 0.2039216, 1, 1,
0.291444, 1.391648, -0.2869723, 0, 0.1960784, 1, 1,
0.2959979, -0.5938059, 3.510563, 0, 0.1882353, 1, 1,
0.2981634, -0.859502, 2.186715, 0, 0.1843137, 1, 1,
0.3022693, -0.9931444, 1.368195, 0, 0.1764706, 1, 1,
0.3027803, -1.593295, 3.037156, 0, 0.172549, 1, 1,
0.3101851, -0.9034598, 3.493404, 0, 0.1647059, 1, 1,
0.3102272, -0.234236, 2.137323, 0, 0.1607843, 1, 1,
0.3189402, -0.2814969, 1.265657, 0, 0.1529412, 1, 1,
0.3208479, -0.6045488, 2.120256, 0, 0.1490196, 1, 1,
0.3218048, 0.6575274, 1.426481, 0, 0.1411765, 1, 1,
0.3240679, -1.168327, 2.227507, 0, 0.1372549, 1, 1,
0.3243276, 1.353909, 0.8123474, 0, 0.1294118, 1, 1,
0.3273393, 0.2829576, 0.3791956, 0, 0.1254902, 1, 1,
0.327763, 2.332309, -0.7572829, 0, 0.1176471, 1, 1,
0.3332316, -0.4730951, 3.698481, 0, 0.1137255, 1, 1,
0.3346524, -0.8473569, 3.959378, 0, 0.1058824, 1, 1,
0.3372798, -0.4642453, 1.990943, 0, 0.09803922, 1, 1,
0.3414846, 0.005509177, 2.105491, 0, 0.09411765, 1, 1,
0.3420841, -0.3302267, 2.248842, 0, 0.08627451, 1, 1,
0.3421708, 0.1877039, 0.7000527, 0, 0.08235294, 1, 1,
0.3439317, 0.9434094, -0.5255917, 0, 0.07450981, 1, 1,
0.3535555, -0.7788342, 3.737822, 0, 0.07058824, 1, 1,
0.3564039, 1.660968, 0.4829122, 0, 0.0627451, 1, 1,
0.3588661, 0.09603643, 2.079897, 0, 0.05882353, 1, 1,
0.3632298, 0.2861571, 0.7737443, 0, 0.05098039, 1, 1,
0.3659822, 0.2631746, 0.3425218, 0, 0.04705882, 1, 1,
0.3679183, 2.795683, -0.5765327, 0, 0.03921569, 1, 1,
0.3685239, 0.4462515, -0.04621599, 0, 0.03529412, 1, 1,
0.3718516, -0.4387679, 2.654334, 0, 0.02745098, 1, 1,
0.3794, -0.261641, 2.089565, 0, 0.02352941, 1, 1,
0.3824702, -1.094148, 3.868529, 0, 0.01568628, 1, 1,
0.3924327, 1.475438, -0.7240151, 0, 0.01176471, 1, 1,
0.3926967, -0.5619079, 4.564317, 0, 0.003921569, 1, 1,
0.3974447, -0.6319259, 1.844922, 0.003921569, 0, 1, 1,
0.4030181, 0.2094402, 0.3231034, 0.007843138, 0, 1, 1,
0.4057754, 0.2636328, 0.395803, 0.01568628, 0, 1, 1,
0.4083131, -0.6232336, 5.005096, 0.01960784, 0, 1, 1,
0.4103744, -0.06735131, 3.709006, 0.02745098, 0, 1, 1,
0.4174957, -2.501561, 3.564111, 0.03137255, 0, 1, 1,
0.4179406, -1.19453, 3.266007, 0.03921569, 0, 1, 1,
0.422277, 1.178609, 1.28005, 0.04313726, 0, 1, 1,
0.4249549, -0.6434272, 2.849161, 0.05098039, 0, 1, 1,
0.4302624, 0.5207843, -0.08521644, 0.05490196, 0, 1, 1,
0.4315829, 1.431371, 0.2794244, 0.0627451, 0, 1, 1,
0.4362043, -0.1502945, 1.873978, 0.06666667, 0, 1, 1,
0.439364, -0.3934549, 3.162227, 0.07450981, 0, 1, 1,
0.4401895, -0.03356403, 1.83268, 0.07843138, 0, 1, 1,
0.4433808, 1.123435, -0.4587479, 0.08627451, 0, 1, 1,
0.4546972, -0.2315108, 1.443888, 0.09019608, 0, 1, 1,
0.4571539, 0.0310237, 3.21395, 0.09803922, 0, 1, 1,
0.4595414, -0.1265509, 0.1410582, 0.1058824, 0, 1, 1,
0.4604199, -0.573264, 3.192198, 0.1098039, 0, 1, 1,
0.4660771, -1.212455, 4.179026, 0.1176471, 0, 1, 1,
0.4685649, 0.3159979, 2.549237, 0.1215686, 0, 1, 1,
0.4730043, -0.9317987, 2.542748, 0.1294118, 0, 1, 1,
0.473309, 0.9256476, -0.2320393, 0.1333333, 0, 1, 1,
0.4752364, -1.544331, 3.379905, 0.1411765, 0, 1, 1,
0.4759503, -0.02953117, 1.202815, 0.145098, 0, 1, 1,
0.4844512, 0.06824437, 0.8111409, 0.1529412, 0, 1, 1,
0.4867776, 0.604226, 0.29543, 0.1568628, 0, 1, 1,
0.4868445, 1.197047, 1.944876, 0.1647059, 0, 1, 1,
0.4887965, -0.314478, 3.94079, 0.1686275, 0, 1, 1,
0.4931749, -0.09146065, 1.651605, 0.1764706, 0, 1, 1,
0.5008076, 0.3692816, 3.004329, 0.1803922, 0, 1, 1,
0.5038731, -0.8551023, 2.0315, 0.1882353, 0, 1, 1,
0.5059351, -0.2164048, 3.199754, 0.1921569, 0, 1, 1,
0.5069993, -0.4820499, 1.571636, 0.2, 0, 1, 1,
0.5142789, -0.2877688, 2.08121, 0.2078431, 0, 1, 1,
0.5180151, -0.1049023, 2.274138, 0.2117647, 0, 1, 1,
0.5195168, 1.809983, 1.418065, 0.2196078, 0, 1, 1,
0.524992, 1.055932, 2.309489, 0.2235294, 0, 1, 1,
0.5256341, -0.07062255, -0.2031321, 0.2313726, 0, 1, 1,
0.5280065, -1.049649, 4.109433, 0.2352941, 0, 1, 1,
0.5287248, 1.164899, 0.1838975, 0.2431373, 0, 1, 1,
0.5293438, -0.1113745, 1.094148, 0.2470588, 0, 1, 1,
0.5303186, 0.9105518, 0.4375829, 0.254902, 0, 1, 1,
0.5341435, 0.2523791, 0.08579376, 0.2588235, 0, 1, 1,
0.5357875, -0.1927942, 2.690326, 0.2666667, 0, 1, 1,
0.5359525, -0.7548705, 1.016962, 0.2705882, 0, 1, 1,
0.5424156, -0.8502895, 2.410738, 0.2784314, 0, 1, 1,
0.5432954, 1.413239, 1.135144, 0.282353, 0, 1, 1,
0.5441025, 1.037131, 0.4139618, 0.2901961, 0, 1, 1,
0.5514838, -0.5767955, 1.517948, 0.2941177, 0, 1, 1,
0.5517597, -1.238366, 4.452555, 0.3019608, 0, 1, 1,
0.5554569, 2.2061, -0.6793398, 0.3098039, 0, 1, 1,
0.5580149, 0.2776741, 1.623965, 0.3137255, 0, 1, 1,
0.5641768, -0.5737503, 0.9612218, 0.3215686, 0, 1, 1,
0.5642057, 0.1393276, 1.491063, 0.3254902, 0, 1, 1,
0.5688376, -0.2850274, 0.7042705, 0.3333333, 0, 1, 1,
0.5799677, 2.104215, 0.9381876, 0.3372549, 0, 1, 1,
0.5803346, -1.77939, 3.163464, 0.345098, 0, 1, 1,
0.5809767, -1.08575, 3.810402, 0.3490196, 0, 1, 1,
0.5813024, -1.681724, 2.812213, 0.3568628, 0, 1, 1,
0.5855364, 0.03691241, -0.3509891, 0.3607843, 0, 1, 1,
0.5861069, -0.2009544, 1.322554, 0.3686275, 0, 1, 1,
0.5916649, 1.958723, 1.125398, 0.372549, 0, 1, 1,
0.5962743, -0.2482628, 1.489407, 0.3803922, 0, 1, 1,
0.60081, -0.6949822, 2.037087, 0.3843137, 0, 1, 1,
0.6011891, 0.04151903, -0.2730836, 0.3921569, 0, 1, 1,
0.602149, 0.6424296, 1.117451, 0.3960784, 0, 1, 1,
0.6038473, -0.5649813, 2.798224, 0.4039216, 0, 1, 1,
0.6042591, -1.221273, 3.104126, 0.4117647, 0, 1, 1,
0.605902, 1.932559, 0.7983672, 0.4156863, 0, 1, 1,
0.6070295, -0.5082716, 2.15835, 0.4235294, 0, 1, 1,
0.6120666, 1.932664, 0.2708179, 0.427451, 0, 1, 1,
0.6121988, -0.6278902, 3.641379, 0.4352941, 0, 1, 1,
0.6178812, -2.799866, 2.576784, 0.4392157, 0, 1, 1,
0.6243488, -0.7399749, 3.47656, 0.4470588, 0, 1, 1,
0.6287307, -0.5333745, 3.733014, 0.4509804, 0, 1, 1,
0.6322201, 0.6019015, 2.018151, 0.4588235, 0, 1, 1,
0.6372611, -0.8573079, 2.563344, 0.4627451, 0, 1, 1,
0.6375985, -0.4587915, 2.125281, 0.4705882, 0, 1, 1,
0.6379367, 1.703828, 0.6419146, 0.4745098, 0, 1, 1,
0.6406453, 0.01865811, 2.377048, 0.4823529, 0, 1, 1,
0.640967, -0.1266255, 2.15715, 0.4862745, 0, 1, 1,
0.6421577, -0.06699418, 1.475218, 0.4941176, 0, 1, 1,
0.6515806, 0.290207, 1.664473, 0.5019608, 0, 1, 1,
0.6610122, 0.3340203, 2.115388, 0.5058824, 0, 1, 1,
0.6644616, 0.3047218, 2.559957, 0.5137255, 0, 1, 1,
0.6661735, -0.1179143, 2.840507, 0.5176471, 0, 1, 1,
0.671864, -1.466855, 1.115748, 0.5254902, 0, 1, 1,
0.6718904, 0.2275311, 2.047817, 0.5294118, 0, 1, 1,
0.673499, -0.5584788, 0.06685084, 0.5372549, 0, 1, 1,
0.6751252, -0.2840531, 2.236293, 0.5411765, 0, 1, 1,
0.6802702, 1.094854, -0.1624132, 0.5490196, 0, 1, 1,
0.6815814, -0.4210141, 3.188685, 0.5529412, 0, 1, 1,
0.6838477, -0.5597739, 3.164624, 0.5607843, 0, 1, 1,
0.6866968, -0.5115132, 2.530054, 0.5647059, 0, 1, 1,
0.6903303, -0.5903815, 1.540488, 0.572549, 0, 1, 1,
0.6906245, 0.9118703, 1.412636, 0.5764706, 0, 1, 1,
0.6993557, 0.1690178, 2.056853, 0.5843138, 0, 1, 1,
0.7019964, 1.689305, 0.5585428, 0.5882353, 0, 1, 1,
0.7023796, 1.858099, 0.6197569, 0.5960785, 0, 1, 1,
0.7055854, -1.040777, 4.425719, 0.6039216, 0, 1, 1,
0.7091435, 0.4148367, 0.8468007, 0.6078432, 0, 1, 1,
0.7211198, 0.8437976, 1.280082, 0.6156863, 0, 1, 1,
0.7243337, -0.9047443, 1.290335, 0.6196079, 0, 1, 1,
0.72731, 1.544008, 0.2810395, 0.627451, 0, 1, 1,
0.7298838, -0.1377322, 1.544505, 0.6313726, 0, 1, 1,
0.7344107, -0.7014096, 3.518336, 0.6392157, 0, 1, 1,
0.7350844, -0.1654228, 0.3590123, 0.6431373, 0, 1, 1,
0.7366819, 0.3486607, -0.3083873, 0.6509804, 0, 1, 1,
0.7380374, 0.009907424, 2.438139, 0.654902, 0, 1, 1,
0.7416329, 0.3819374, 2.64549, 0.6627451, 0, 1, 1,
0.7424606, -0.8033219, 3.815464, 0.6666667, 0, 1, 1,
0.7425015, 0.6944832, 0.3018619, 0.6745098, 0, 1, 1,
0.7452934, 0.3154143, 2.471421, 0.6784314, 0, 1, 1,
0.7491891, 1.507821, 2.067305, 0.6862745, 0, 1, 1,
0.7496786, 2.381761, 0.9362513, 0.6901961, 0, 1, 1,
0.7623728, -0.7460404, 2.971044, 0.6980392, 0, 1, 1,
0.7643002, -0.872198, 2.649453, 0.7058824, 0, 1, 1,
0.769879, -1.643998, 0.257439, 0.7098039, 0, 1, 1,
0.7713279, 0.4035502, 0.9236034, 0.7176471, 0, 1, 1,
0.7715145, 0.2335014, 2.139449, 0.7215686, 0, 1, 1,
0.77253, 0.2412679, 1.654879, 0.7294118, 0, 1, 1,
0.7730271, 1.129646, 0.4541793, 0.7333333, 0, 1, 1,
0.7733181, -1.510289, 1.493724, 0.7411765, 0, 1, 1,
0.7784103, -0.8478228, 2.999586, 0.7450981, 0, 1, 1,
0.7790193, -0.8731885, 2.584997, 0.7529412, 0, 1, 1,
0.7817066, -0.5209719, 2.587867, 0.7568628, 0, 1, 1,
0.7897902, 0.9465529, 0.7197977, 0.7647059, 0, 1, 1,
0.80177, 0.5402738, 3.348814, 0.7686275, 0, 1, 1,
0.8018037, -0.8488517, 2.803318, 0.7764706, 0, 1, 1,
0.804727, 0.3084675, 3.356502, 0.7803922, 0, 1, 1,
0.809609, -0.3409083, 1.226385, 0.7882353, 0, 1, 1,
0.8112124, -1.077746, 0.9275084, 0.7921569, 0, 1, 1,
0.8163546, -1.098897, 2.844028, 0.8, 0, 1, 1,
0.8174536, -0.9033738, 3.766437, 0.8078431, 0, 1, 1,
0.8187087, 0.7969863, 0.1722252, 0.8117647, 0, 1, 1,
0.8194391, 0.691597, -0.5365195, 0.8196079, 0, 1, 1,
0.8207462, 0.2057494, 1.320867, 0.8235294, 0, 1, 1,
0.8246163, 1.945615, 1.192404, 0.8313726, 0, 1, 1,
0.8257971, -0.3783764, 1.539875, 0.8352941, 0, 1, 1,
0.825839, -1.21355, 2.77221, 0.8431373, 0, 1, 1,
0.8268856, 1.255086, -1.334284, 0.8470588, 0, 1, 1,
0.8277743, 1.435951, -0.09456162, 0.854902, 0, 1, 1,
0.8297399, 1.117941, 0.26415, 0.8588235, 0, 1, 1,
0.836782, -1.31008, 3.463036, 0.8666667, 0, 1, 1,
0.8405414, 0.06660903, 2.356116, 0.8705882, 0, 1, 1,
0.8416315, -1.436688, 3.045079, 0.8784314, 0, 1, 1,
0.846628, -0.1790541, 1.923741, 0.8823529, 0, 1, 1,
0.8522473, -1.32421, 3.207289, 0.8901961, 0, 1, 1,
0.8575698, 0.4430203, 1.80303, 0.8941177, 0, 1, 1,
0.8595535, -2.79018, 1.952236, 0.9019608, 0, 1, 1,
0.8726949, -1.330722, 3.047936, 0.9098039, 0, 1, 1,
0.8729116, 0.714505, 1.36637, 0.9137255, 0, 1, 1,
0.8732842, 1.344315, 1.049097, 0.9215686, 0, 1, 1,
0.8813604, -1.973896, 1.090776, 0.9254902, 0, 1, 1,
0.8829252, -0.6763439, 2.12414, 0.9333333, 0, 1, 1,
0.8831716, 0.521394, 1.864914, 0.9372549, 0, 1, 1,
0.8845887, 1.100079, 1.051544, 0.945098, 0, 1, 1,
0.8871388, -1.268309, 2.713112, 0.9490196, 0, 1, 1,
0.8906943, 0.05618655, 0.07148566, 0.9568627, 0, 1, 1,
0.8938482, 0.1849263, 0.284278, 0.9607843, 0, 1, 1,
0.8970324, -0.6745089, 2.788003, 0.9686275, 0, 1, 1,
0.9000681, -0.2569269, 1.934767, 0.972549, 0, 1, 1,
0.9022308, 0.3735241, 2.355914, 0.9803922, 0, 1, 1,
0.9090194, 2.331425, 1.5371, 0.9843137, 0, 1, 1,
0.9231642, 0.07674666, 2.065193, 0.9921569, 0, 1, 1,
0.9288357, -1.143812, 2.662997, 0.9960784, 0, 1, 1,
0.9296271, -0.40422, 0.5643124, 1, 0, 0.9960784, 1,
0.9351674, -0.05281205, 1.837966, 1, 0, 0.9882353, 1,
0.9473423, 0.5618103, -0.8829259, 1, 0, 0.9843137, 1,
0.9474418, -0.9182546, 1.053139, 1, 0, 0.9764706, 1,
0.9490741, 0.2694377, 0.8428721, 1, 0, 0.972549, 1,
0.9498295, -0.5922176, 2.393056, 1, 0, 0.9647059, 1,
0.95362, -0.745927, 1.413755, 1, 0, 0.9607843, 1,
0.9549246, 0.8847193, -0.1682775, 1, 0, 0.9529412, 1,
0.9552717, 0.3642271, 1.39847, 1, 0, 0.9490196, 1,
0.955764, 0.6510993, 1.549315, 1, 0, 0.9411765, 1,
0.9585135, 1.729885, -0.6344939, 1, 0, 0.9372549, 1,
0.9625166, 0.03694477, 0.6196682, 1, 0, 0.9294118, 1,
0.965574, -1.031324, 1.634726, 1, 0, 0.9254902, 1,
0.9755535, -0.08011584, 2.352405, 1, 0, 0.9176471, 1,
0.9761725, -0.0007941072, 0.6990818, 1, 0, 0.9137255, 1,
0.9889219, 0.09755728, 0.4979341, 1, 0, 0.9058824, 1,
0.9893318, -0.765536, 2.283193, 1, 0, 0.9019608, 1,
0.9941247, 0.180803, 1.309986, 1, 0, 0.8941177, 1,
1.009232, -0.5738451, 0.6658347, 1, 0, 0.8862745, 1,
1.022351, -1.366767, 1.952969, 1, 0, 0.8823529, 1,
1.024104, 0.8030629, 0.4930768, 1, 0, 0.8745098, 1,
1.027973, -0.9258923, 1.888024, 1, 0, 0.8705882, 1,
1.030782, -1.570547, 4.148524, 1, 0, 0.8627451, 1,
1.040871, 3.369276, 0.9566041, 1, 0, 0.8588235, 1,
1.044522, -0.9534737, 2.964692, 1, 0, 0.8509804, 1,
1.048773, -1.138217, 1.318398, 1, 0, 0.8470588, 1,
1.062837, -0.7898738, 1.243027, 1, 0, 0.8392157, 1,
1.071721, -0.4205317, 1.836869, 1, 0, 0.8352941, 1,
1.084292, 0.623428, 0.921692, 1, 0, 0.827451, 1,
1.08552, 0.09582532, 1.144659, 1, 0, 0.8235294, 1,
1.089651, -0.07001662, 2.77356, 1, 0, 0.8156863, 1,
1.102958, 1.234626, -0.7826418, 1, 0, 0.8117647, 1,
1.106821, -0.374429, 2.244522, 1, 0, 0.8039216, 1,
1.115554, 0.7215608, 1.182551, 1, 0, 0.7960784, 1,
1.115974, -1.251522, 2.468846, 1, 0, 0.7921569, 1,
1.11871, -2.20475, 4.385304, 1, 0, 0.7843137, 1,
1.127093, 1.331793, 1.761596, 1, 0, 0.7803922, 1,
1.129928, 0.5708368, 0.4035821, 1, 0, 0.772549, 1,
1.136513, -0.9931833, 2.390285, 1, 0, 0.7686275, 1,
1.136834, 0.4521424, 1.456834, 1, 0, 0.7607843, 1,
1.162244, 0.1401067, 1.751246, 1, 0, 0.7568628, 1,
1.162682, 0.3435308, -0.6788209, 1, 0, 0.7490196, 1,
1.165674, -0.8980842, 0.9545988, 1, 0, 0.7450981, 1,
1.175527, -0.02752565, 4.129669, 1, 0, 0.7372549, 1,
1.182141, 0.344029, -0.1369363, 1, 0, 0.7333333, 1,
1.192432, 0.9756647, 2.621956, 1, 0, 0.7254902, 1,
1.196994, -0.9486155, 0.2512248, 1, 0, 0.7215686, 1,
1.200395, 0.2431691, 2.96922, 1, 0, 0.7137255, 1,
1.203943, 0.2180663, 1.920702, 1, 0, 0.7098039, 1,
1.205791, 0.1665253, -1.044509, 1, 0, 0.7019608, 1,
1.217633, 0.8036212, 2.303823, 1, 0, 0.6941177, 1,
1.228551, 1.527878, 0.8690313, 1, 0, 0.6901961, 1,
1.239889, -1.147783, 3.135363, 1, 0, 0.682353, 1,
1.241745, 2.033776, 1.336925, 1, 0, 0.6784314, 1,
1.24199, -1.847992, 2.391952, 1, 0, 0.6705883, 1,
1.242359, -1.160996, 1.166025, 1, 0, 0.6666667, 1,
1.245504, 0.009330356, 2.853019, 1, 0, 0.6588235, 1,
1.245534, -0.5752863, 3.182313, 1, 0, 0.654902, 1,
1.245553, -0.3116786, 4.311333, 1, 0, 0.6470588, 1,
1.245675, -3.03719, 2.846522, 1, 0, 0.6431373, 1,
1.255354, 0.2281905, 0.1391622, 1, 0, 0.6352941, 1,
1.262604, -2.058985, 1.246938, 1, 0, 0.6313726, 1,
1.26794, -0.9358689, 4.597149, 1, 0, 0.6235294, 1,
1.268875, 0.6377911, 0.6574314, 1, 0, 0.6196079, 1,
1.277301, -0.6921505, 4.823879, 1, 0, 0.6117647, 1,
1.282828, -0.9642189, 1.823174, 1, 0, 0.6078432, 1,
1.287676, -0.4530991, 1.674498, 1, 0, 0.6, 1,
1.301526, -0.3713648, 1.44271, 1, 0, 0.5921569, 1,
1.319495, -0.9108561, 2.192906, 1, 0, 0.5882353, 1,
1.321404, 2.389302, -0.6860767, 1, 0, 0.5803922, 1,
1.322536, -0.5347809, 2.170633, 1, 0, 0.5764706, 1,
1.339785, -0.3310969, 0.8366787, 1, 0, 0.5686275, 1,
1.340346, 0.7710585, -0.266107, 1, 0, 0.5647059, 1,
1.360134, -1.857231, 4.652986, 1, 0, 0.5568628, 1,
1.364519, 0.4601544, 2.102912, 1, 0, 0.5529412, 1,
1.365104, 0.2328994, 0.9643982, 1, 0, 0.5450981, 1,
1.394453, -1.31593, 3.175011, 1, 0, 0.5411765, 1,
1.394513, -0.8690777, 1.799621, 1, 0, 0.5333334, 1,
1.397606, -1.839783, 2.501605, 1, 0, 0.5294118, 1,
1.397637, -1.023364, 2.116789, 1, 0, 0.5215687, 1,
1.409147, -0.7242835, 2.580937, 1, 0, 0.5176471, 1,
1.411573, -1.358918, 2.883827, 1, 0, 0.509804, 1,
1.462373, -0.5221526, 1.431905, 1, 0, 0.5058824, 1,
1.462389, -1.399755, 1.984635, 1, 0, 0.4980392, 1,
1.465859, -0.8314309, 1.132018, 1, 0, 0.4901961, 1,
1.472139, 0.5510066, 1.629746, 1, 0, 0.4862745, 1,
1.480823, -0.7907768, 2.798242, 1, 0, 0.4784314, 1,
1.491353, -0.09532271, 3.978543, 1, 0, 0.4745098, 1,
1.492973, 1.397262, 1.383192, 1, 0, 0.4666667, 1,
1.49873, -1.225953, 2.163499, 1, 0, 0.4627451, 1,
1.499414, -1.172835, 3.671804, 1, 0, 0.454902, 1,
1.500097, -0.09410819, 1.210662, 1, 0, 0.4509804, 1,
1.502973, 1.575378, 0.3447802, 1, 0, 0.4431373, 1,
1.508433, -1.221954, 3.71702, 1, 0, 0.4392157, 1,
1.510045, -1.030324, 1.618454, 1, 0, 0.4313726, 1,
1.513625, -0.4188135, 2.777615, 1, 0, 0.427451, 1,
1.514771, -1.102793, 1.976954, 1, 0, 0.4196078, 1,
1.532263, -0.714273, 1.901304, 1, 0, 0.4156863, 1,
1.55423, 0.820422, 3.135754, 1, 0, 0.4078431, 1,
1.566894, 1.435676, -0.7637358, 1, 0, 0.4039216, 1,
1.569528, 0.9053505, 1.783034, 1, 0, 0.3960784, 1,
1.574719, 1.093666, 0.6900079, 1, 0, 0.3882353, 1,
1.583831, 0.6090893, 0.3149179, 1, 0, 0.3843137, 1,
1.585076, -0.09914616, 2.690992, 1, 0, 0.3764706, 1,
1.591016, 1.379778, -0.4898712, 1, 0, 0.372549, 1,
1.593532, -1.063231, 1.582379, 1, 0, 0.3647059, 1,
1.593991, -0.7195421, 2.125101, 1, 0, 0.3607843, 1,
1.599177, 0.3543957, 1.130562, 1, 0, 0.3529412, 1,
1.608965, 0.8401757, 0.4895516, 1, 0, 0.3490196, 1,
1.637514, -0.7473967, 1.086193, 1, 0, 0.3411765, 1,
1.637673, 0.1055481, 1.864401, 1, 0, 0.3372549, 1,
1.638808, -0.02166667, 1.044402, 1, 0, 0.3294118, 1,
1.639203, 0.08051156, 0.7415797, 1, 0, 0.3254902, 1,
1.64068, -1.722781, 2.136276, 1, 0, 0.3176471, 1,
1.649732, 0.5748311, -0.788194, 1, 0, 0.3137255, 1,
1.649821, 0.4846333, 3.03406, 1, 0, 0.3058824, 1,
1.675739, 1.167214, 0.8640701, 1, 0, 0.2980392, 1,
1.699821, 0.6006316, 1.014781, 1, 0, 0.2941177, 1,
1.700414, 0.08918609, 1.802547, 1, 0, 0.2862745, 1,
1.703713, -1.205333, 2.498425, 1, 0, 0.282353, 1,
1.713266, 0.3926044, 1.494433, 1, 0, 0.2745098, 1,
1.721101, 0.04157566, 0.3305967, 1, 0, 0.2705882, 1,
1.721703, -0.4153727, 2.858474, 1, 0, 0.2627451, 1,
1.731826, -1.793563, 4.38832, 1, 0, 0.2588235, 1,
1.740993, 0.3263574, 2.596301, 1, 0, 0.2509804, 1,
1.758093, -0.5812984, 1.711953, 1, 0, 0.2470588, 1,
1.765228, 0.03343331, 0.869041, 1, 0, 0.2392157, 1,
1.784493, 1.266557, 0.3334667, 1, 0, 0.2352941, 1,
1.803739, -1.063053, 1.342334, 1, 0, 0.227451, 1,
1.813874, 0.7317601, 1.617732, 1, 0, 0.2235294, 1,
1.816695, 0.3694828, 1.672715, 1, 0, 0.2156863, 1,
1.825078, -0.6230662, 1.794528, 1, 0, 0.2117647, 1,
1.827502, -3.262212, 1.619903, 1, 0, 0.2039216, 1,
1.848123, -0.7875572, 4.632406, 1, 0, 0.1960784, 1,
1.848763, -1.305639, 4.181071, 1, 0, 0.1921569, 1,
1.848831, -1.358087, 1.576152, 1, 0, 0.1843137, 1,
1.899391, 0.3264508, 1.052952, 1, 0, 0.1803922, 1,
1.920418, 0.4855884, 0.7571616, 1, 0, 0.172549, 1,
1.93332, 0.002641953, 2.881737, 1, 0, 0.1686275, 1,
1.934857, 1.322592, -0.1153035, 1, 0, 0.1607843, 1,
1.945603, 0.3599737, 1.629493, 1, 0, 0.1568628, 1,
1.965766, 0.1553443, 0.1234407, 1, 0, 0.1490196, 1,
1.969851, -0.1215224, -0.4038363, 1, 0, 0.145098, 1,
2.00024, 0.3843202, 2.449708, 1, 0, 0.1372549, 1,
2.061193, 0.1538395, 0.9235194, 1, 0, 0.1333333, 1,
2.098642, -1.999178, 1.524467, 1, 0, 0.1254902, 1,
2.113667, -0.4913182, 2.123128, 1, 0, 0.1215686, 1,
2.142666, 1.778994, 1.771402, 1, 0, 0.1137255, 1,
2.151561, 1.104783, 2.106169, 1, 0, 0.1098039, 1,
2.161517, 0.4973431, 1.33544, 1, 0, 0.1019608, 1,
2.167255, 0.5802836, 0.69263, 1, 0, 0.09411765, 1,
2.195287, -0.1080391, 1.198255, 1, 0, 0.09019608, 1,
2.213378, -0.1071128, 1.916266, 1, 0, 0.08235294, 1,
2.226803, -0.6526166, 0.8691252, 1, 0, 0.07843138, 1,
2.257697, 0.6393753, 2.866444, 1, 0, 0.07058824, 1,
2.260577, -0.03786448, 2.469956, 1, 0, 0.06666667, 1,
2.272766, 1.929843, 2.110124, 1, 0, 0.05882353, 1,
2.305041, -0.6013498, 1.193371, 1, 0, 0.05490196, 1,
2.360406, 0.2027948, 2.07371, 1, 0, 0.04705882, 1,
2.417445, 1.342182, 0.6390413, 1, 0, 0.04313726, 1,
2.464291, -0.1425469, 1.268687, 1, 0, 0.03529412, 1,
2.650515, -0.0200634, 0.6321964, 1, 0, 0.03137255, 1,
2.657859, -0.4959471, 3.467096, 1, 0, 0.02352941, 1,
2.731543, -0.7102669, 0.9856836, 1, 0, 0.01960784, 1,
2.875145, -1.650279, 0.07861456, 1, 0, 0.01176471, 1,
3.240047, -1.226395, 1.371968, 1, 0, 0.007843138, 1
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
0.05066562, -4.396984, -7.065196, 0, -0.5, 0.5, 0.5,
0.05066562, -4.396984, -7.065196, 1, -0.5, 0.5, 0.5,
0.05066562, -4.396984, -7.065196, 1, 1.5, 0.5, 0.5,
0.05066562, -4.396984, -7.065196, 0, 1.5, 0.5, 0.5
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
-4.219915, 0.04894257, -7.065196, 0, -0.5, 0.5, 0.5,
-4.219915, 0.04894257, -7.065196, 1, -0.5, 0.5, 0.5,
-4.219915, 0.04894257, -7.065196, 1, 1.5, 0.5, 0.5,
-4.219915, 0.04894257, -7.065196, 0, 1.5, 0.5, 0.5
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
-4.219915, -4.396984, -0.1357379, 0, -0.5, 0.5, 0.5,
-4.219915, -4.396984, -0.1357379, 1, -0.5, 0.5, 0.5,
-4.219915, -4.396984, -0.1357379, 1, 1.5, 0.5, 0.5,
-4.219915, -4.396984, -0.1357379, 0, 1.5, 0.5, 0.5
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
-3, -3.371001, -5.46609,
3, -3.371001, -5.46609,
-3, -3.371001, -5.46609,
-3, -3.541998, -5.732608,
-2, -3.371001, -5.46609,
-2, -3.541998, -5.732608,
-1, -3.371001, -5.46609,
-1, -3.541998, -5.732608,
0, -3.371001, -5.46609,
0, -3.541998, -5.732608,
1, -3.371001, -5.46609,
1, -3.541998, -5.732608,
2, -3.371001, -5.46609,
2, -3.541998, -5.732608,
3, -3.371001, -5.46609,
3, -3.541998, -5.732608
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
-3, -3.883993, -6.265643, 0, -0.5, 0.5, 0.5,
-3, -3.883993, -6.265643, 1, -0.5, 0.5, 0.5,
-3, -3.883993, -6.265643, 1, 1.5, 0.5, 0.5,
-3, -3.883993, -6.265643, 0, 1.5, 0.5, 0.5,
-2, -3.883993, -6.265643, 0, -0.5, 0.5, 0.5,
-2, -3.883993, -6.265643, 1, -0.5, 0.5, 0.5,
-2, -3.883993, -6.265643, 1, 1.5, 0.5, 0.5,
-2, -3.883993, -6.265643, 0, 1.5, 0.5, 0.5,
-1, -3.883993, -6.265643, 0, -0.5, 0.5, 0.5,
-1, -3.883993, -6.265643, 1, -0.5, 0.5, 0.5,
-1, -3.883993, -6.265643, 1, 1.5, 0.5, 0.5,
-1, -3.883993, -6.265643, 0, 1.5, 0.5, 0.5,
0, -3.883993, -6.265643, 0, -0.5, 0.5, 0.5,
0, -3.883993, -6.265643, 1, -0.5, 0.5, 0.5,
0, -3.883993, -6.265643, 1, 1.5, 0.5, 0.5,
0, -3.883993, -6.265643, 0, 1.5, 0.5, 0.5,
1, -3.883993, -6.265643, 0, -0.5, 0.5, 0.5,
1, -3.883993, -6.265643, 1, -0.5, 0.5, 0.5,
1, -3.883993, -6.265643, 1, 1.5, 0.5, 0.5,
1, -3.883993, -6.265643, 0, 1.5, 0.5, 0.5,
2, -3.883993, -6.265643, 0, -0.5, 0.5, 0.5,
2, -3.883993, -6.265643, 1, -0.5, 0.5, 0.5,
2, -3.883993, -6.265643, 1, 1.5, 0.5, 0.5,
2, -3.883993, -6.265643, 0, 1.5, 0.5, 0.5,
3, -3.883993, -6.265643, 0, -0.5, 0.5, 0.5,
3, -3.883993, -6.265643, 1, -0.5, 0.5, 0.5,
3, -3.883993, -6.265643, 1, 1.5, 0.5, 0.5,
3, -3.883993, -6.265643, 0, 1.5, 0.5, 0.5
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
-3.234397, -3, -5.46609,
-3.234397, 3, -5.46609,
-3.234397, -3, -5.46609,
-3.39865, -3, -5.732608,
-3.234397, -2, -5.46609,
-3.39865, -2, -5.732608,
-3.234397, -1, -5.46609,
-3.39865, -1, -5.732608,
-3.234397, 0, -5.46609,
-3.39865, 0, -5.732608,
-3.234397, 1, -5.46609,
-3.39865, 1, -5.732608,
-3.234397, 2, -5.46609,
-3.39865, 2, -5.732608,
-3.234397, 3, -5.46609,
-3.39865, 3, -5.732608
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
-3.727156, -3, -6.265643, 0, -0.5, 0.5, 0.5,
-3.727156, -3, -6.265643, 1, -0.5, 0.5, 0.5,
-3.727156, -3, -6.265643, 1, 1.5, 0.5, 0.5,
-3.727156, -3, -6.265643, 0, 1.5, 0.5, 0.5,
-3.727156, -2, -6.265643, 0, -0.5, 0.5, 0.5,
-3.727156, -2, -6.265643, 1, -0.5, 0.5, 0.5,
-3.727156, -2, -6.265643, 1, 1.5, 0.5, 0.5,
-3.727156, -2, -6.265643, 0, 1.5, 0.5, 0.5,
-3.727156, -1, -6.265643, 0, -0.5, 0.5, 0.5,
-3.727156, -1, -6.265643, 1, -0.5, 0.5, 0.5,
-3.727156, -1, -6.265643, 1, 1.5, 0.5, 0.5,
-3.727156, -1, -6.265643, 0, 1.5, 0.5, 0.5,
-3.727156, 0, -6.265643, 0, -0.5, 0.5, 0.5,
-3.727156, 0, -6.265643, 1, -0.5, 0.5, 0.5,
-3.727156, 0, -6.265643, 1, 1.5, 0.5, 0.5,
-3.727156, 0, -6.265643, 0, 1.5, 0.5, 0.5,
-3.727156, 1, -6.265643, 0, -0.5, 0.5, 0.5,
-3.727156, 1, -6.265643, 1, -0.5, 0.5, 0.5,
-3.727156, 1, -6.265643, 1, 1.5, 0.5, 0.5,
-3.727156, 1, -6.265643, 0, 1.5, 0.5, 0.5,
-3.727156, 2, -6.265643, 0, -0.5, 0.5, 0.5,
-3.727156, 2, -6.265643, 1, -0.5, 0.5, 0.5,
-3.727156, 2, -6.265643, 1, 1.5, 0.5, 0.5,
-3.727156, 2, -6.265643, 0, 1.5, 0.5, 0.5,
-3.727156, 3, -6.265643, 0, -0.5, 0.5, 0.5,
-3.727156, 3, -6.265643, 1, -0.5, 0.5, 0.5,
-3.727156, 3, -6.265643, 1, 1.5, 0.5, 0.5,
-3.727156, 3, -6.265643, 0, 1.5, 0.5, 0.5
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
-3.234397, -3.371001, -4,
-3.234397, -3.371001, 4,
-3.234397, -3.371001, -4,
-3.39865, -3.541998, -4,
-3.234397, -3.371001, -2,
-3.39865, -3.541998, -2,
-3.234397, -3.371001, 0,
-3.39865, -3.541998, 0,
-3.234397, -3.371001, 2,
-3.39865, -3.541998, 2,
-3.234397, -3.371001, 4,
-3.39865, -3.541998, 4
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
-3.727156, -3.883993, -4, 0, -0.5, 0.5, 0.5,
-3.727156, -3.883993, -4, 1, -0.5, 0.5, 0.5,
-3.727156, -3.883993, -4, 1, 1.5, 0.5, 0.5,
-3.727156, -3.883993, -4, 0, 1.5, 0.5, 0.5,
-3.727156, -3.883993, -2, 0, -0.5, 0.5, 0.5,
-3.727156, -3.883993, -2, 1, -0.5, 0.5, 0.5,
-3.727156, -3.883993, -2, 1, 1.5, 0.5, 0.5,
-3.727156, -3.883993, -2, 0, 1.5, 0.5, 0.5,
-3.727156, -3.883993, 0, 0, -0.5, 0.5, 0.5,
-3.727156, -3.883993, 0, 1, -0.5, 0.5, 0.5,
-3.727156, -3.883993, 0, 1, 1.5, 0.5, 0.5,
-3.727156, -3.883993, 0, 0, 1.5, 0.5, 0.5,
-3.727156, -3.883993, 2, 0, -0.5, 0.5, 0.5,
-3.727156, -3.883993, 2, 1, -0.5, 0.5, 0.5,
-3.727156, -3.883993, 2, 1, 1.5, 0.5, 0.5,
-3.727156, -3.883993, 2, 0, 1.5, 0.5, 0.5,
-3.727156, -3.883993, 4, 0, -0.5, 0.5, 0.5,
-3.727156, -3.883993, 4, 1, -0.5, 0.5, 0.5,
-3.727156, -3.883993, 4, 1, 1.5, 0.5, 0.5,
-3.727156, -3.883993, 4, 0, 1.5, 0.5, 0.5
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
-3.234397, -3.371001, -5.46609,
-3.234397, 3.468886, -5.46609,
-3.234397, -3.371001, 5.194614,
-3.234397, 3.468886, 5.194614,
-3.234397, -3.371001, -5.46609,
-3.234397, -3.371001, 5.194614,
-3.234397, 3.468886, -5.46609,
-3.234397, 3.468886, 5.194614,
-3.234397, -3.371001, -5.46609,
3.335728, -3.371001, -5.46609,
-3.234397, -3.371001, 5.194614,
3.335728, -3.371001, 5.194614,
-3.234397, 3.468886, -5.46609,
3.335728, 3.468886, -5.46609,
-3.234397, 3.468886, 5.194614,
3.335728, 3.468886, 5.194614,
3.335728, -3.371001, -5.46609,
3.335728, 3.468886, -5.46609,
3.335728, -3.371001, 5.194614,
3.335728, 3.468886, 5.194614,
3.335728, -3.371001, -5.46609,
3.335728, -3.371001, 5.194614,
3.335728, 3.468886, -5.46609,
3.335728, 3.468886, 5.194614
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
var radius = 7.61931;
var distance = 33.89917;
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
mvMatrix.translate( -0.05066562, -0.04894257, 0.1357379 );
mvMatrix.scale( 1.25388, 1.204427, 0.7727582 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.89917);
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
Calypso<-read.table("Calypso.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Calypso$V2
```

```
## Error in eval(expr, envir, enclos): object 'Calypso' not found
```

```r
y<-Calypso$V3
```

```
## Error in eval(expr, envir, enclos): object 'Calypso' not found
```

```r
z<-Calypso$V4
```

```
## Error in eval(expr, envir, enclos): object 'Calypso' not found
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
-3.138715, 1.875122, -1.285166, 0, 0, 1, 1, 1,
-3.064442, -0.2276789, -2.568262, 1, 0, 0, 1, 1,
-3.059841, 0.8995553, -1.208941, 1, 0, 0, 1, 1,
-2.979214, -0.2234906, -2.543376, 1, 0, 0, 1, 1,
-2.877671, 0.8482861, -0.6683907, 1, 0, 0, 1, 1,
-2.81611, -0.9120994, -2.094469, 1, 0, 0, 1, 1,
-2.597316, 0.5905125, -0.3737837, 0, 0, 0, 1, 1,
-2.591243, 0.4782586, -0.7258979, 0, 0, 0, 1, 1,
-2.513678, 0.1296465, -1.815574, 0, 0, 0, 1, 1,
-2.398024, 0.8615102, -0.8414486, 0, 0, 0, 1, 1,
-2.393481, -0.4077129, -0.4073451, 0, 0, 0, 1, 1,
-2.344345, 0.4058532, -1.244979, 0, 0, 0, 1, 1,
-2.341108, 0.7580917, -2.26562, 0, 0, 0, 1, 1,
-2.329003, 0.8724676, -0.71244, 1, 1, 1, 1, 1,
-2.255322, -0.1128632, -2.634603, 1, 1, 1, 1, 1,
-2.239469, 0.6120733, -0.3352278, 1, 1, 1, 1, 1,
-2.209713, 0.5753745, -1.515593, 1, 1, 1, 1, 1,
-2.196737, -0.6714854, -2.802703, 1, 1, 1, 1, 1,
-2.190535, -0.5923533, -2.081537, 1, 1, 1, 1, 1,
-2.187119, -1.111541, -2.549276, 1, 1, 1, 1, 1,
-2.153306, 0.3730976, -1.06065, 1, 1, 1, 1, 1,
-2.12876, -0.7277634, -1.616611, 1, 1, 1, 1, 1,
-2.127553, 1.585649, -0.392465, 1, 1, 1, 1, 1,
-2.119173, -0.9322768, -1.051869, 1, 1, 1, 1, 1,
-2.05306, -0.7172335, -2.141919, 1, 1, 1, 1, 1,
-2.018886, 1.462715, -1.589279, 1, 1, 1, 1, 1,
-2.018731, 0.6502602, -2.545544, 1, 1, 1, 1, 1,
-1.958735, 0.6315022, -2.131316, 1, 1, 1, 1, 1,
-1.939299, -0.9888881, -2.818695, 0, 0, 1, 1, 1,
-1.933089, 0.3392416, -0.625567, 1, 0, 0, 1, 1,
-1.920999, -1.46111, -1.779171, 1, 0, 0, 1, 1,
-1.909741, 0.1326394, -1.668671, 1, 0, 0, 1, 1,
-1.908052, -1.019834, -3.680993, 1, 0, 0, 1, 1,
-1.901044, 1.917525, -0.720238, 1, 0, 0, 1, 1,
-1.892463, 0.4158959, -0.9739404, 0, 0, 0, 1, 1,
-1.870888, 1.178194, -1.301937, 0, 0, 0, 1, 1,
-1.857012, -1.394083, -2.083161, 0, 0, 0, 1, 1,
-1.853965, -0.2810153, -0.9659503, 0, 0, 0, 1, 1,
-1.851388, 0.1114309, -2.796691, 0, 0, 0, 1, 1,
-1.797643, 0.2168826, 0.0353028, 0, 0, 0, 1, 1,
-1.792763, -0.8161607, -0.8605164, 0, 0, 0, 1, 1,
-1.791418, 1.343699, -2.039925, 1, 1, 1, 1, 1,
-1.788487, 0.4132842, -1.472661, 1, 1, 1, 1, 1,
-1.779122, -0.01950851, -1.78582, 1, 1, 1, 1, 1,
-1.77678, 0.5026386, -1.208837, 1, 1, 1, 1, 1,
-1.770584, 0.520876, -1.585675, 1, 1, 1, 1, 1,
-1.760815, -0.9235957, -1.07284, 1, 1, 1, 1, 1,
-1.753952, -1.150091, -2.80139, 1, 1, 1, 1, 1,
-1.75113, -0.5904898, -0.748956, 1, 1, 1, 1, 1,
-1.731852, 0.45454, -0.5768266, 1, 1, 1, 1, 1,
-1.720907, -0.8848168, -2.006461, 1, 1, 1, 1, 1,
-1.719066, -1.525669, -2.13511, 1, 1, 1, 1, 1,
-1.718736, 1.901611, -0.301328, 1, 1, 1, 1, 1,
-1.713242, -1.097258, -2.313604, 1, 1, 1, 1, 1,
-1.711412, -0.9287739, -2.243757, 1, 1, 1, 1, 1,
-1.698174, 0.4108014, -0.9736013, 1, 1, 1, 1, 1,
-1.695486, -0.03160535, -2.222456, 0, 0, 1, 1, 1,
-1.690911, -1.375632, -1.436323, 1, 0, 0, 1, 1,
-1.668244, 0.1184573, -1.48252, 1, 0, 0, 1, 1,
-1.646572, -1.22043, -2.894093, 1, 0, 0, 1, 1,
-1.628869, 0.6874277, -1.603996, 1, 0, 0, 1, 1,
-1.627744, -1.139452, -3.637211, 1, 0, 0, 1, 1,
-1.627341, 0.3175325, -2.475676, 0, 0, 0, 1, 1,
-1.621226, -0.09063749, -1.359299, 0, 0, 0, 1, 1,
-1.601641, 0.3102228, -0.9388192, 0, 0, 0, 1, 1,
-1.599008, 1.203642, -2.429033, 0, 0, 0, 1, 1,
-1.595818, 0.3159221, -0.8313685, 0, 0, 0, 1, 1,
-1.589718, 0.7709802, -2.115684, 0, 0, 0, 1, 1,
-1.581015, 0.8470601, 1.011459, 0, 0, 0, 1, 1,
-1.578755, 0.6055472, -0.5301776, 1, 1, 1, 1, 1,
-1.571971, -1.096981, -2.840988, 1, 1, 1, 1, 1,
-1.561689, -2.105402, -2.768796, 1, 1, 1, 1, 1,
-1.550561, -0.5192687, -1.600978, 1, 1, 1, 1, 1,
-1.543191, -2.660527, -1.863136, 1, 1, 1, 1, 1,
-1.537446, -0.1473289, -3.63527, 1, 1, 1, 1, 1,
-1.535656, -0.5587482, -0.2693264, 1, 1, 1, 1, 1,
-1.53397, -1.118644, -3.149667, 1, 1, 1, 1, 1,
-1.492203, 1.997364, 1.121142, 1, 1, 1, 1, 1,
-1.48913, 0.8516759, -1.47131, 1, 1, 1, 1, 1,
-1.486609, 0.09577498, 0.04806499, 1, 1, 1, 1, 1,
-1.478359, -2.286039, -2.884521, 1, 1, 1, 1, 1,
-1.475506, -0.9268602, -2.671747, 1, 1, 1, 1, 1,
-1.46942, 1.506804, -0.8188586, 1, 1, 1, 1, 1,
-1.467708, 0.02905557, -3.40019, 1, 1, 1, 1, 1,
-1.462647, -0.8080142, -2.251064, 0, 0, 1, 1, 1,
-1.457739, -0.5356135, -1.307699, 1, 0, 0, 1, 1,
-1.457715, 0.9940832, -0.06838685, 1, 0, 0, 1, 1,
-1.444745, -0.8320641, -1.51839, 1, 0, 0, 1, 1,
-1.427753, 1.569624, -1.089107, 1, 0, 0, 1, 1,
-1.424209, 0.669879, -0.7421502, 1, 0, 0, 1, 1,
-1.415947, -1.024003, -2.571563, 0, 0, 0, 1, 1,
-1.407181, 2.039154, 0.2151503, 0, 0, 0, 1, 1,
-1.398476, 0.9266582, -0.9327387, 0, 0, 0, 1, 1,
-1.397934, 1.916956, -0.2431061, 0, 0, 0, 1, 1,
-1.394901, -0.9200305, -3.587237, 0, 0, 0, 1, 1,
-1.393583, -2.868457, -2.878073, 0, 0, 0, 1, 1,
-1.384053, 1.800133, -1.134455, 0, 0, 0, 1, 1,
-1.381653, 0.38704, -1.417853, 1, 1, 1, 1, 1,
-1.380383, -1.250568, -0.7290531, 1, 1, 1, 1, 1,
-1.369072, -0.0808035, -0.3281103, 1, 1, 1, 1, 1,
-1.359961, -0.7848948, -1.863307, 1, 1, 1, 1, 1,
-1.359867, -0.3598981, -2.382807, 1, 1, 1, 1, 1,
-1.349721, 0.3789613, -1.767737, 1, 1, 1, 1, 1,
-1.349652, 0.04603621, -2.039522, 1, 1, 1, 1, 1,
-1.348059, -0.7674824, -1.164156, 1, 1, 1, 1, 1,
-1.341328, 0.7507522, -2.056093, 1, 1, 1, 1, 1,
-1.339938, -1.205649, -2.798953, 1, 1, 1, 1, 1,
-1.328211, 0.4181226, -0.3880988, 1, 1, 1, 1, 1,
-1.324733, 0.01926098, -1.799804, 1, 1, 1, 1, 1,
-1.317098, -0.8931587, -1.775786, 1, 1, 1, 1, 1,
-1.316728, -0.08292788, -2.911157, 1, 1, 1, 1, 1,
-1.315676, 0.2910206, -1.253791, 1, 1, 1, 1, 1,
-1.314668, 0.4467382, -1.104321, 0, 0, 1, 1, 1,
-1.301489, 0.8300412, -0.6980217, 1, 0, 0, 1, 1,
-1.300034, 1.355649, 0.9113597, 1, 0, 0, 1, 1,
-1.287436, 1.322124, -1.368269, 1, 0, 0, 1, 1,
-1.286267, 0.2905033, -2.114687, 1, 0, 0, 1, 1,
-1.28282, -0.4136324, -0.4503615, 1, 0, 0, 1, 1,
-1.27977, 1.786945, -0.03065026, 0, 0, 0, 1, 1,
-1.278824, -0.7366208, -1.524799, 0, 0, 0, 1, 1,
-1.264812, -1.719941, -1.561916, 0, 0, 0, 1, 1,
-1.264721, 0.8474115, -1.19691, 0, 0, 0, 1, 1,
-1.258232, 0.3430849, -1.585474, 0, 0, 0, 1, 1,
-1.251349, 0.01149653, -3.636158, 0, 0, 0, 1, 1,
-1.250182, 0.5161082, -2.291425, 0, 0, 0, 1, 1,
-1.247992, -0.98467, -1.008824, 1, 1, 1, 1, 1,
-1.242164, 0.0593557, -2.903974, 1, 1, 1, 1, 1,
-1.234214, 1.849522, -0.5495043, 1, 1, 1, 1, 1,
-1.226579, -0.5084684, -2.068182, 1, 1, 1, 1, 1,
-1.213099, 0.1081975, -2.482801, 1, 1, 1, 1, 1,
-1.204768, -1.14214, -3.999806, 1, 1, 1, 1, 1,
-1.198285, -1.712658, -1.173476, 1, 1, 1, 1, 1,
-1.197668, 1.460815, 0.126141, 1, 1, 1, 1, 1,
-1.195161, -0.2008955, -3.083233, 1, 1, 1, 1, 1,
-1.190966, 0.2936846, -2.13207, 1, 1, 1, 1, 1,
-1.184982, 0.1070222, -2.558052, 1, 1, 1, 1, 1,
-1.181407, -0.3833416, -2.880123, 1, 1, 1, 1, 1,
-1.178817, 0.09374763, -1.818037, 1, 1, 1, 1, 1,
-1.173868, 0.8861594, -0.133751, 1, 1, 1, 1, 1,
-1.163726, 0.3383615, -0.827991, 1, 1, 1, 1, 1,
-1.163164, 1.398532, -0.1190371, 0, 0, 1, 1, 1,
-1.16312, 0.1620259, -1.015143, 1, 0, 0, 1, 1,
-1.154647, 0.7264099, -0.3874362, 1, 0, 0, 1, 1,
-1.150324, -0.5199083, -2.625233, 1, 0, 0, 1, 1,
-1.144303, 0.06816978, -1.54195, 1, 0, 0, 1, 1,
-1.141115, -0.2699972, -1.546366, 1, 0, 0, 1, 1,
-1.137473, 2.490606, -0.386686, 0, 0, 0, 1, 1,
-1.128007, -0.5396789, -1.892433, 0, 0, 0, 1, 1,
-1.119634, -1.224493, -1.912112, 0, 0, 0, 1, 1,
-1.118503, -0.9503819, -2.935757, 0, 0, 0, 1, 1,
-1.117099, 0.3525344, -0.6341724, 0, 0, 0, 1, 1,
-1.114388, 0.6012158, 0.6788487, 0, 0, 0, 1, 1,
-1.112902, -2.110065, -3.148527, 0, 0, 0, 1, 1,
-1.110087, 0.8152446, -0.5101401, 1, 1, 1, 1, 1,
-1.10667, 1.327969, -0.5305886, 1, 1, 1, 1, 1,
-1.105795, -1.046351, -3.766609, 1, 1, 1, 1, 1,
-1.102915, -1.438444, -2.978307, 1, 1, 1, 1, 1,
-1.095126, -1.147496, -2.750392, 1, 1, 1, 1, 1,
-1.086928, 1.078483, -0.9438862, 1, 1, 1, 1, 1,
-1.084143, -0.4115213, -2.516876, 1, 1, 1, 1, 1,
-1.083069, 1.764839, -3.026447, 1, 1, 1, 1, 1,
-1.082166, -0.8020367, 0.2524265, 1, 1, 1, 1, 1,
-1.079257, 0.1798872, -1.285943, 1, 1, 1, 1, 1,
-1.077894, -0.3555313, -1.850321, 1, 1, 1, 1, 1,
-1.075452, -2.339004, -3.671055, 1, 1, 1, 1, 1,
-1.07059, 0.283179, -1.681238, 1, 1, 1, 1, 1,
-1.066047, 1.704974, 1.025555, 1, 1, 1, 1, 1,
-1.053727, -1.03133, -1.64054, 1, 1, 1, 1, 1,
-1.053008, -0.4357235, -1.369782, 0, 0, 1, 1, 1,
-1.047286, 0.1544949, -2.02637, 1, 0, 0, 1, 1,
-1.045549, 1.045518, -1.566493, 1, 0, 0, 1, 1,
-1.043847, -1.142572, -2.206564, 1, 0, 0, 1, 1,
-1.04178, 0.3987144, -0.8229715, 1, 0, 0, 1, 1,
-1.039492, 0.2525292, -2.374337, 1, 0, 0, 1, 1,
-1.025873, 0.6308947, -1.234104, 0, 0, 0, 1, 1,
-1.023411, 0.3528538, -2.367003, 0, 0, 0, 1, 1,
-1.017934, -0.08539882, -3.421134, 0, 0, 0, 1, 1,
-1.016136, -2.232578, -4.09403, 0, 0, 0, 1, 1,
-1.014768, -1.385707, -3.096, 0, 0, 0, 1, 1,
-1.010211, -0.1526511, -2.211449, 0, 0, 0, 1, 1,
-1.001686, -0.3351771, -3.450752, 0, 0, 0, 1, 1,
-0.9975454, -0.1385234, -0.2662514, 1, 1, 1, 1, 1,
-0.9938542, -0.6256761, -1.891697, 1, 1, 1, 1, 1,
-0.9919676, 0.7880285, -2.686628, 1, 1, 1, 1, 1,
-0.9913635, 0.7220159, 0.1905052, 1, 1, 1, 1, 1,
-0.9910712, -0.1887873, -2.930018, 1, 1, 1, 1, 1,
-0.987352, -0.6018637, -1.878854, 1, 1, 1, 1, 1,
-0.9815511, 0.7170869, 0.9288882, 1, 1, 1, 1, 1,
-0.9750394, 0.6468276, -2.752195, 1, 1, 1, 1, 1,
-0.9728593, -0.5225977, -2.322333, 1, 1, 1, 1, 1,
-0.9721325, 1.391026, -0.5971555, 1, 1, 1, 1, 1,
-0.9671021, -0.2132671, -3.017586, 1, 1, 1, 1, 1,
-0.9654845, -1.216834, -3.1557, 1, 1, 1, 1, 1,
-0.9590688, 0.6716991, -0.08341515, 1, 1, 1, 1, 1,
-0.9590032, -1.823511, 0.07831836, 1, 1, 1, 1, 1,
-0.952527, 1.120902, -1.636683, 1, 1, 1, 1, 1,
-0.9475855, -0.38831, -2.699389, 0, 0, 1, 1, 1,
-0.9436341, 1.126589, -2.615304, 1, 0, 0, 1, 1,
-0.9413483, -0.07742497, -2.311152, 1, 0, 0, 1, 1,
-0.9391426, 0.3711156, -2.20966, 1, 0, 0, 1, 1,
-0.9388075, -1.903744, -2.667338, 1, 0, 0, 1, 1,
-0.9377068, 0.5019226, -1.638983, 1, 0, 0, 1, 1,
-0.9336765, 2.152803, -0.99276, 0, 0, 0, 1, 1,
-0.9293533, -0.1630643, -1.402944, 0, 0, 0, 1, 1,
-0.9176698, 0.6612425, -1.347867, 0, 0, 0, 1, 1,
-0.9082971, 0.4245299, 0.6443858, 0, 0, 0, 1, 1,
-0.9054361, -0.8899902, -3.257608, 0, 0, 0, 1, 1,
-0.9031377, -0.5016872, -0.7203438, 0, 0, 0, 1, 1,
-0.8976088, -0.225292, -3.200481, 0, 0, 0, 1, 1,
-0.8952367, 0.2877814, -1.142779, 1, 1, 1, 1, 1,
-0.8938122, 0.1194994, -2.795111, 1, 1, 1, 1, 1,
-0.8853462, -1.008638, -1.697218, 1, 1, 1, 1, 1,
-0.87967, 0.2337305, -2.132552, 1, 1, 1, 1, 1,
-0.8764002, 0.5462444, 0.5146945, 1, 1, 1, 1, 1,
-0.8722284, 0.5789515, -0.2465367, 1, 1, 1, 1, 1,
-0.8719298, 0.3955491, -0.5054067, 1, 1, 1, 1, 1,
-0.8650151, 0.8340701, 0.4222725, 1, 1, 1, 1, 1,
-0.8555236, -1.153897, -4.004827, 1, 1, 1, 1, 1,
-0.844872, 2.1975, 2.364115, 1, 1, 1, 1, 1,
-0.8415242, -0.06042755, -2.226612, 1, 1, 1, 1, 1,
-0.8398064, -2.241381, -3.934026, 1, 1, 1, 1, 1,
-0.8384496, -0.7368719, -2.529169, 1, 1, 1, 1, 1,
-0.826372, 1.286635, -0.7325385, 1, 1, 1, 1, 1,
-0.8176441, -0.4891751, -1.116094, 1, 1, 1, 1, 1,
-0.8162634, 0.1351093, -1.909869, 0, 0, 1, 1, 1,
-0.8117556, 0.3099671, -2.391411, 1, 0, 0, 1, 1,
-0.8104596, 0.4073256, 0.4091977, 1, 0, 0, 1, 1,
-0.797232, 1.198037, -1.371714, 1, 0, 0, 1, 1,
-0.7828154, 0.4325319, -1.954525, 1, 0, 0, 1, 1,
-0.7805048, -0.3846849, -1.86121, 1, 0, 0, 1, 1,
-0.7796577, -0.3108199, -1.061033, 0, 0, 0, 1, 1,
-0.7718651, 1.31241, 0.1328564, 0, 0, 0, 1, 1,
-0.769609, -0.6100686, -1.072101, 0, 0, 0, 1, 1,
-0.7626318, 0.758319, -0.8500369, 0, 0, 0, 1, 1,
-0.7597257, 0.883132, 0.09670822, 0, 0, 0, 1, 1,
-0.7551859, -0.7005661, -0.8115349, 0, 0, 0, 1, 1,
-0.7523001, 0.3854766, -2.101393, 0, 0, 0, 1, 1,
-0.752103, -1.214127, -3.191273, 1, 1, 1, 1, 1,
-0.7498776, 1.504383, -2.077868, 1, 1, 1, 1, 1,
-0.746657, -1.530892, -1.614162, 1, 1, 1, 1, 1,
-0.7441221, -0.7318032, -2.21814, 1, 1, 1, 1, 1,
-0.7409147, 0.3675848, -2.946374, 1, 1, 1, 1, 1,
-0.7281867, -0.6938914, -1.238741, 1, 1, 1, 1, 1,
-0.725463, 0.7606581, 0.2654408, 1, 1, 1, 1, 1,
-0.7188473, -0.7395445, -2.050824, 1, 1, 1, 1, 1,
-0.7130076, 0.1941724, -1.740925, 1, 1, 1, 1, 1,
-0.7116302, -0.7704971, -1.646185, 1, 1, 1, 1, 1,
-0.7113959, -0.4442946, -0.8500704, 1, 1, 1, 1, 1,
-0.7102648, -0.7673275, -1.261399, 1, 1, 1, 1, 1,
-0.7032335, -1.698671, -3.773494, 1, 1, 1, 1, 1,
-0.7032095, 0.1193832, -1.261344, 1, 1, 1, 1, 1,
-0.7009449, 2.325043, 0.8365703, 1, 1, 1, 1, 1,
-0.6984075, 0.2617516, -1.526373, 0, 0, 1, 1, 1,
-0.6967036, 1.736351, -2.277961, 1, 0, 0, 1, 1,
-0.6959324, -0.1123872, -1.437006, 1, 0, 0, 1, 1,
-0.6955072, 0.2478087, 0.9733362, 1, 0, 0, 1, 1,
-0.6918756, 0.05023509, -2.837399, 1, 0, 0, 1, 1,
-0.6897128, 0.3717113, -0.3300547, 1, 0, 0, 1, 1,
-0.6886086, -0.4596942, -0.05196088, 0, 0, 0, 1, 1,
-0.6861193, 0.1883951, -1.926043, 0, 0, 0, 1, 1,
-0.6804122, 0.6376272, -2.867399, 0, 0, 0, 1, 1,
-0.6674176, -1.709978, -3.135688, 0, 0, 0, 1, 1,
-0.6668218, 2.706376, -0.5353965, 0, 0, 0, 1, 1,
-0.663527, -2.026269, -3.238788, 0, 0, 0, 1, 1,
-0.6632822, -0.6967711, -0.2846263, 0, 0, 0, 1, 1,
-0.6588576, 1.253613, 0.7910689, 1, 1, 1, 1, 1,
-0.655569, 2.289898, -1.569289, 1, 1, 1, 1, 1,
-0.6520222, -1.269558, -3.770872, 1, 1, 1, 1, 1,
-0.6440681, -1.16101, -3.228819, 1, 1, 1, 1, 1,
-0.6432864, -0.3352489, -0.1979304, 1, 1, 1, 1, 1,
-0.6397755, 0.2857853, -1.71309, 1, 1, 1, 1, 1,
-0.6375663, 0.3352851, -1.32, 1, 1, 1, 1, 1,
-0.6305724, 0.5890338, -2.107135, 1, 1, 1, 1, 1,
-0.6254378, 0.3042148, -1.727054, 1, 1, 1, 1, 1,
-0.6239093, 0.60945, -1.696386, 1, 1, 1, 1, 1,
-0.6228082, -0.3110387, -1.643134, 1, 1, 1, 1, 1,
-0.6161429, -0.929187, -3.593858, 1, 1, 1, 1, 1,
-0.6155668, 0.03815042, 0.4361782, 1, 1, 1, 1, 1,
-0.6154093, 0.06574478, -1.793031, 1, 1, 1, 1, 1,
-0.615276, 0.5272387, -1.809482, 1, 1, 1, 1, 1,
-0.6150997, -2.340633, -2.17157, 0, 0, 1, 1, 1,
-0.6137685, -1.3154, -3.370553, 1, 0, 0, 1, 1,
-0.6134657, -3.271391, -4.723019, 1, 0, 0, 1, 1,
-0.6122773, -0.2423007, -0.8846223, 1, 0, 0, 1, 1,
-0.6081899, 0.02508198, -1.366739, 1, 0, 0, 1, 1,
-0.6069, -1.564679, -2.705153, 1, 0, 0, 1, 1,
-0.6020823, 0.4662226, 0.3093307, 0, 0, 0, 1, 1,
-0.6013693, -0.3300702, -2.231275, 0, 0, 0, 1, 1,
-0.6001333, 1.180637, -1.472576, 0, 0, 0, 1, 1,
-0.5983236, -1.740217, -3.239457, 0, 0, 0, 1, 1,
-0.5974626, -0.4931194, -1.928858, 0, 0, 0, 1, 1,
-0.5971489, -0.8678092, -2.862715, 0, 0, 0, 1, 1,
-0.5913017, 0.7582031, 0.801393, 0, 0, 0, 1, 1,
-0.5909618, -1.377114, -2.537682, 1, 1, 1, 1, 1,
-0.5902261, 1.963268, 0.9508542, 1, 1, 1, 1, 1,
-0.5798843, 0.9101658, -1.219703, 1, 1, 1, 1, 1,
-0.5738145, -0.9162099, -2.167928, 1, 1, 1, 1, 1,
-0.5711505, -0.06140536, -1.776877, 1, 1, 1, 1, 1,
-0.5705387, -0.3559254, -2.276067, 1, 1, 1, 1, 1,
-0.5698105, -1.43663, -3.729302, 1, 1, 1, 1, 1,
-0.5668682, -0.3855857, -1.365201, 1, 1, 1, 1, 1,
-0.5628982, -0.1085159, -0.9111612, 1, 1, 1, 1, 1,
-0.5619566, 1.280262, -0.1711941, 1, 1, 1, 1, 1,
-0.560559, -1.686213, -2.36434, 1, 1, 1, 1, 1,
-0.5580094, 0.1632364, 0.1905065, 1, 1, 1, 1, 1,
-0.5539811, 0.7878995, 0.08858519, 1, 1, 1, 1, 1,
-0.553546, 0.5647979, -1.444519, 1, 1, 1, 1, 1,
-0.5522923, -0.1778734, -2.55988, 1, 1, 1, 1, 1,
-0.5453706, 0.2101503, -0.3072842, 0, 0, 1, 1, 1,
-0.5450391, 0.1346297, -0.6751962, 1, 0, 0, 1, 1,
-0.5430827, -0.3635844, -3.42542, 1, 0, 0, 1, 1,
-0.541323, -0.1108163, -0.6055796, 1, 0, 0, 1, 1,
-0.5399327, -0.2305817, -1.166235, 1, 0, 0, 1, 1,
-0.5393291, -0.009882821, -2.1529, 1, 0, 0, 1, 1,
-0.5388703, -0.295958, -2.792174, 0, 0, 0, 1, 1,
-0.5377558, 0.9783969, -0.7863115, 0, 0, 0, 1, 1,
-0.5300707, -0.6663805, -1.997742, 0, 0, 0, 1, 1,
-0.5299257, -0.3477052, -2.617488, 0, 0, 0, 1, 1,
-0.5295534, 0.5638651, -1.626601, 0, 0, 0, 1, 1,
-0.5171384, -0.2340005, 0.7784456, 0, 0, 0, 1, 1,
-0.5121317, 0.8935256, 0.4551133, 0, 0, 0, 1, 1,
-0.5084348, 0.4390631, 0.172868, 1, 1, 1, 1, 1,
-0.5055465, 0.38663, -0.6119117, 1, 1, 1, 1, 1,
-0.4954419, -0.5628569, -1.51051, 1, 1, 1, 1, 1,
-0.4935872, 0.7950892, -2.767085, 1, 1, 1, 1, 1,
-0.4899222, 2.00419, -2.013134, 1, 1, 1, 1, 1,
-0.4888095, 0.2709215, -3.14999, 1, 1, 1, 1, 1,
-0.485404, -1.568905, -3.541289, 1, 1, 1, 1, 1,
-0.4769164, -0.3314292, -3.720112, 1, 1, 1, 1, 1,
-0.4756817, 0.2063218, -2.114053, 1, 1, 1, 1, 1,
-0.4737248, 0.0983123, -0.7308122, 1, 1, 1, 1, 1,
-0.4715474, 1.462208, -0.3401082, 1, 1, 1, 1, 1,
-0.46932, 1.303551, -0.7560894, 1, 1, 1, 1, 1,
-0.4691115, -0.3449844, -2.757931, 1, 1, 1, 1, 1,
-0.463508, 1.030145, -0.04697188, 1, 1, 1, 1, 1,
-0.4583916, -0.2662111, -1.02634, 1, 1, 1, 1, 1,
-0.4531775, -0.3722485, -0.7094175, 0, 0, 1, 1, 1,
-0.4528478, 1.086041, -0.1368249, 1, 0, 0, 1, 1,
-0.4491329, 1.283986, -0.4509742, 1, 0, 0, 1, 1,
-0.4470839, -0.5123624, -2.6045, 1, 0, 0, 1, 1,
-0.4442707, 0.81378, -1.291487, 1, 0, 0, 1, 1,
-0.4347478, 0.8449893, -1.804703, 1, 0, 0, 1, 1,
-0.4345663, -0.1061231, -3.507787, 0, 0, 0, 1, 1,
-0.427699, 0.3933815, -1.64456, 0, 0, 0, 1, 1,
-0.4263366, 0.3181984, -0.0376061, 0, 0, 0, 1, 1,
-0.4258463, -1.277162, -1.868407, 0, 0, 0, 1, 1,
-0.4228764, 0.6826137, -0.6361908, 0, 0, 0, 1, 1,
-0.42252, -0.5259922, -1.185944, 0, 0, 0, 1, 1,
-0.4201167, -1.132711, -1.948943, 0, 0, 0, 1, 1,
-0.4167082, -1.034871, -2.79209, 1, 1, 1, 1, 1,
-0.4046328, 1.123302, -1.121527, 1, 1, 1, 1, 1,
-0.4030696, 0.5316871, -1.888743, 1, 1, 1, 1, 1,
-0.4003405, -0.5891759, -2.088593, 1, 1, 1, 1, 1,
-0.3983992, -1.848657, -3.584702, 1, 1, 1, 1, 1,
-0.3972527, -0.480163, -4.37129, 1, 1, 1, 1, 1,
-0.395874, 0.1003207, -2.724342, 1, 1, 1, 1, 1,
-0.3903402, -1.628281, -3.076354, 1, 1, 1, 1, 1,
-0.3893685, -1.262017, -2.037452, 1, 1, 1, 1, 1,
-0.3890015, 0.24942, -1.385582, 1, 1, 1, 1, 1,
-0.3839135, -1.004846, -1.869816, 1, 1, 1, 1, 1,
-0.3837948, 1.799893, -2.51484, 1, 1, 1, 1, 1,
-0.3833509, 1.079107, -1.637857, 1, 1, 1, 1, 1,
-0.3761089, 0.4094632, -0.7282445, 1, 1, 1, 1, 1,
-0.3699411, 0.2864209, -2.415608, 1, 1, 1, 1, 1,
-0.3694584, 1.364397, -0.6442005, 0, 0, 1, 1, 1,
-0.3679247, -0.5634326, -4.618713, 1, 0, 0, 1, 1,
-0.3677964, 0.4741915, -0.8179285, 1, 0, 0, 1, 1,
-0.3670388, -0.7986836, -1.320626, 1, 0, 0, 1, 1,
-0.3624521, -0.862472, -3.030882, 1, 0, 0, 1, 1,
-0.3615226, 0.8157448, 0.07192995, 1, 0, 0, 1, 1,
-0.3607149, -0.7611303, -2.153746, 0, 0, 0, 1, 1,
-0.3599961, 0.5462088, 0.1771786, 0, 0, 0, 1, 1,
-0.3570132, -0.2483625, -1.683586, 0, 0, 0, 1, 1,
-0.3552994, -1.882689, -4.47686, 0, 0, 0, 1, 1,
-0.3520448, -0.2046002, -2.557393, 0, 0, 0, 1, 1,
-0.3500568, 0.5964419, 0.850323, 0, 0, 0, 1, 1,
-0.3473101, 0.754176, -1.338316, 0, 0, 0, 1, 1,
-0.3462445, -0.6841385, -2.037821, 1, 1, 1, 1, 1,
-0.340838, 0.01565357, -1.741832, 1, 1, 1, 1, 1,
-0.3351173, -1.146761, -3.764186, 1, 1, 1, 1, 1,
-0.334957, 0.4579723, 0.06081412, 1, 1, 1, 1, 1,
-0.3349107, -0.5484462, -2.746023, 1, 1, 1, 1, 1,
-0.3333647, -2.179738, -2.810823, 1, 1, 1, 1, 1,
-0.3320669, -0.6292419, -2.282146, 1, 1, 1, 1, 1,
-0.3236486, 1.022158, -1.099665, 1, 1, 1, 1, 1,
-0.3212076, -0.280381, -2.424148, 1, 1, 1, 1, 1,
-0.3211126, 0.2830394, 0.1441761, 1, 1, 1, 1, 1,
-0.3195606, -0.5216109, -2.680251, 1, 1, 1, 1, 1,
-0.3167949, -0.4116004, -1.319437, 1, 1, 1, 1, 1,
-0.3139075, 1.027204, 0.8471105, 1, 1, 1, 1, 1,
-0.3118245, -0.6009706, -2.641826, 1, 1, 1, 1, 1,
-0.3117227, 0.08815186, -2.592385, 1, 1, 1, 1, 1,
-0.3115239, -0.2017813, -2.106524, 0, 0, 1, 1, 1,
-0.3097174, 0.09759986, -2.244894, 1, 0, 0, 1, 1,
-0.3083006, 0.5775203, -1.660174, 1, 0, 0, 1, 1,
-0.3078542, 0.519701, -1.358477, 1, 0, 0, 1, 1,
-0.3075457, -0.1568315, -1.727265, 1, 0, 0, 1, 1,
-0.3056928, 0.701851, -0.5326482, 1, 0, 0, 1, 1,
-0.3019662, 1.733644, -1.018895, 0, 0, 0, 1, 1,
-0.2975677, -0.20676, -2.673494, 0, 0, 0, 1, 1,
-0.2940861, -0.7513615, -3.764562, 0, 0, 0, 1, 1,
-0.2940059, -0.1374391, -2.206004, 0, 0, 0, 1, 1,
-0.2915463, -2.12597, -1.849094, 0, 0, 0, 1, 1,
-0.2906616, -1.509955, -3.471586, 0, 0, 0, 1, 1,
-0.2819335, 1.143265, -1.658834, 0, 0, 0, 1, 1,
-0.2763047, 1.050425, -0.3895012, 1, 1, 1, 1, 1,
-0.272879, 1.541098, 1.473963, 1, 1, 1, 1, 1,
-0.2711945, 0.2687756, -1.019615, 1, 1, 1, 1, 1,
-0.2701109, -2.770137, -2.36277, 1, 1, 1, 1, 1,
-0.2699513, -0.2362837, -3.281484, 1, 1, 1, 1, 1,
-0.2659016, -0.6260297, -3.436777, 1, 1, 1, 1, 1,
-0.2654791, 0.2922492, -2.802722, 1, 1, 1, 1, 1,
-0.2534016, -1.521078, -3.872178, 1, 1, 1, 1, 1,
-0.2526937, -1.325168, -4.197478, 1, 1, 1, 1, 1,
-0.25159, -0.7961881, -1.260436, 1, 1, 1, 1, 1,
-0.2500412, -0.9372966, -2.533197, 1, 1, 1, 1, 1,
-0.2463663, -0.1565616, -1.530331, 1, 1, 1, 1, 1,
-0.2415158, -0.3868169, -2.069121, 1, 1, 1, 1, 1,
-0.2375974, -0.005147386, -0.9079893, 1, 1, 1, 1, 1,
-0.2373461, 0.7878768, 1.242332, 1, 1, 1, 1, 1,
-0.235838, -1.329942, -1.175332, 0, 0, 1, 1, 1,
-0.2356198, 1.206613, -0.3374068, 1, 0, 0, 1, 1,
-0.2284435, -1.196357, -1.854396, 1, 0, 0, 1, 1,
-0.2271256, -0.6197142, -3.831774, 1, 0, 0, 1, 1,
-0.2242388, 1.529238, 0.1984843, 1, 0, 0, 1, 1,
-0.2185442, -0.7506167, -4.079531, 1, 0, 0, 1, 1,
-0.2165416, -0.9079356, -4.636116, 0, 0, 0, 1, 1,
-0.2161445, 0.75519, 0.2086171, 0, 0, 0, 1, 1,
-0.2107331, -0.1173578, -0.3573029, 0, 0, 0, 1, 1,
-0.20751, -0.2784325, -1.762384, 0, 0, 0, 1, 1,
-0.2028625, -0.5194555, -4.834104, 0, 0, 0, 1, 1,
-0.2026382, 2.065088, -0.1826113, 0, 0, 0, 1, 1,
-0.2018941, -1.079304, -5.310837, 0, 0, 0, 1, 1,
-0.1951919, 0.3034785, -1.055743, 1, 1, 1, 1, 1,
-0.1920513, 1.426313, -0.7309757, 1, 1, 1, 1, 1,
-0.1914706, -1.57793, -3.886086, 1, 1, 1, 1, 1,
-0.1862993, 1.205398, -1.5455, 1, 1, 1, 1, 1,
-0.1851303, -0.7675685, -1.821344, 1, 1, 1, 1, 1,
-0.1850448, -0.4077429, -4.153826, 1, 1, 1, 1, 1,
-0.1835314, 1.49259, -0.5424777, 1, 1, 1, 1, 1,
-0.1833426, 0.4399276, 1.090035, 1, 1, 1, 1, 1,
-0.1817069, -0.1684988, -0.8330904, 1, 1, 1, 1, 1,
-0.1802048, 2.521409, -1.923424, 1, 1, 1, 1, 1,
-0.1796023, 1.38095, -0.6863896, 1, 1, 1, 1, 1,
-0.1749901, 0.2295542, 0.2011558, 1, 1, 1, 1, 1,
-0.1743327, 0.7808118, 0.9442315, 1, 1, 1, 1, 1,
-0.1736963, 0.7301923, 1.895699, 1, 1, 1, 1, 1,
-0.1726968, -0.02061443, -2.922687, 1, 1, 1, 1, 1,
-0.1717031, -0.2278007, -2.151201, 0, 0, 1, 1, 1,
-0.1699648, -0.4617317, -3.924768, 1, 0, 0, 1, 1,
-0.1654376, 0.2798669, 0.07386567, 1, 0, 0, 1, 1,
-0.1635449, 1.592932, -0.2927529, 1, 0, 0, 1, 1,
-0.1571757, 1.046303, -0.2439843, 1, 0, 0, 1, 1,
-0.1565506, -0.4708881, -2.6789, 1, 0, 0, 1, 1,
-0.1534475, 0.09692451, -0.6881254, 0, 0, 0, 1, 1,
-0.1489943, -1.375058, -3.056307, 0, 0, 0, 1, 1,
-0.1488086, -1.210531, -2.77145, 0, 0, 0, 1, 1,
-0.1481173, -0.2836556, -3.914291, 0, 0, 0, 1, 1,
-0.1468309, 1.213649, -0.2401023, 0, 0, 0, 1, 1,
-0.1437668, -0.5555512, -4.262396, 0, 0, 0, 1, 1,
-0.1406322, 1.812737, 0.2575741, 0, 0, 0, 1, 1,
-0.1388547, -1.412167, -2.97061, 1, 1, 1, 1, 1,
-0.1375801, -1.263554, -2.752838, 1, 1, 1, 1, 1,
-0.1373919, 0.064771, -1.406942, 1, 1, 1, 1, 1,
-0.1373819, -0.9471992, -4.050237, 1, 1, 1, 1, 1,
-0.1365033, -0.6105993, -4.202107, 1, 1, 1, 1, 1,
-0.1359845, 0.2951135, 0.1160898, 1, 1, 1, 1, 1,
-0.133176, 1.844128, 0.7644745, 1, 1, 1, 1, 1,
-0.1315624, 0.3803811, -2.137417, 1, 1, 1, 1, 1,
-0.1297834, -0.9005548, -2.293762, 1, 1, 1, 1, 1,
-0.1284356, -0.7963027, -2.76275, 1, 1, 1, 1, 1,
-0.1270731, 0.8768699, -0.9319046, 1, 1, 1, 1, 1,
-0.1253226, -0.5698158, -3.162506, 1, 1, 1, 1, 1,
-0.1117751, -0.5351316, -2.272245, 1, 1, 1, 1, 1,
-0.1112867, 0.6980101, -1.09247, 1, 1, 1, 1, 1,
-0.106664, -0.2507141, -3.15618, 1, 1, 1, 1, 1,
-0.106222, 1.53829, 0.4225909, 0, 0, 1, 1, 1,
-0.1048861, 0.6571199, -0.9514242, 1, 0, 0, 1, 1,
-0.1040064, -0.8736454, -1.231378, 1, 0, 0, 1, 1,
-0.1018085, -0.6518694, -2.457313, 1, 0, 0, 1, 1,
-0.1014812, -0.9389188, -3.02914, 1, 0, 0, 1, 1,
-0.09765151, -0.4871382, -0.8574384, 1, 0, 0, 1, 1,
-0.09746195, 1.05617, -0.5055363, 0, 0, 0, 1, 1,
-0.08694817, -0.4392057, -4.034523, 0, 0, 0, 1, 1,
-0.08558497, -0.3070349, -2.395804, 0, 0, 0, 1, 1,
-0.08350216, 0.4274643, 0.7221722, 0, 0, 0, 1, 1,
-0.08268218, -0.7376296, -2.171411, 0, 0, 0, 1, 1,
-0.08070401, 2.342553, -1.455988, 0, 0, 0, 1, 1,
-0.07578518, 0.03036327, -1.220834, 0, 0, 0, 1, 1,
-0.07526566, 0.700648, -0.2525777, 1, 1, 1, 1, 1,
-0.074099, -0.30879, -2.660652, 1, 1, 1, 1, 1,
-0.073479, 1.024099, -0.1473184, 1, 1, 1, 1, 1,
-0.06581768, 0.6552014, -0.2968214, 1, 1, 1, 1, 1,
-0.0609739, 0.4767464, -0.9342084, 1, 1, 1, 1, 1,
-0.05941955, 1.082172, 1.049922, 1, 1, 1, 1, 1,
-0.05780297, -0.07686331, -2.488189, 1, 1, 1, 1, 1,
-0.05567573, -1.098225, -3.874958, 1, 1, 1, 1, 1,
-0.05402518, 0.2494353, 0.6340187, 1, 1, 1, 1, 1,
-0.05217713, 0.3351162, -0.07273563, 1, 1, 1, 1, 1,
-0.05092296, 0.7840903, 1.161155, 1, 1, 1, 1, 1,
-0.0483719, 0.4068392, 0.819517, 1, 1, 1, 1, 1,
-0.04835626, 0.2548131, 0.4979617, 1, 1, 1, 1, 1,
-0.04429534, 0.6889027, 1.028256, 1, 1, 1, 1, 1,
-0.04254134, -0.4655432, -2.908023, 1, 1, 1, 1, 1,
-0.04217469, -0.9507671, -1.879849, 0, 0, 1, 1, 1,
-0.03674655, 0.1112127, 1.207377, 1, 0, 0, 1, 1,
-0.03611369, -0.4266739, -3.995202, 1, 0, 0, 1, 1,
-0.0337086, -0.9457455, -3.660622, 1, 0, 0, 1, 1,
-0.03190127, 0.8867865, -0.2880357, 1, 0, 0, 1, 1,
-0.02753358, 0.4995602, -0.9814057, 1, 0, 0, 1, 1,
-0.02319398, 0.7208949, -2.30695, 0, 0, 0, 1, 1,
-0.02210704, 0.8637796, 0.5940585, 0, 0, 0, 1, 1,
-0.02143456, -0.1006595, -0.9080424, 0, 0, 0, 1, 1,
-0.01982199, 0.3185138, 0.3538454, 0, 0, 0, 1, 1,
-0.01774006, -1.355515, -2.768482, 0, 0, 0, 1, 1,
-0.01555737, 0.4872176, -0.0499555, 0, 0, 0, 1, 1,
-0.01383514, -0.7655309, -3.800598, 0, 0, 0, 1, 1,
-0.01368628, -0.824216, -1.993578, 1, 1, 1, 1, 1,
-0.01243514, -1.359533, -3.289579, 1, 1, 1, 1, 1,
-0.004949346, 1.165147, -1.128681, 1, 1, 1, 1, 1,
-0.0005687132, 1.626958, -1.003993, 1, 1, 1, 1, 1,
0.004830202, -1.279432, 2.339891, 1, 1, 1, 1, 1,
0.01256445, -1.288563, 3.054752, 1, 1, 1, 1, 1,
0.01936201, 0.1932506, 0.2622558, 1, 1, 1, 1, 1,
0.0194671, 1.102619, 0.5344187, 1, 1, 1, 1, 1,
0.01988225, 0.2448209, -1.49583, 1, 1, 1, 1, 1,
0.02263052, 1.10768, -1.940691, 1, 1, 1, 1, 1,
0.02275045, -0.7543305, 3.169437, 1, 1, 1, 1, 1,
0.02308976, -1.091096, 2.752756, 1, 1, 1, 1, 1,
0.02631561, -1.112205, 4.769445, 1, 1, 1, 1, 1,
0.02688462, 0.2585166, -0.0804657, 1, 1, 1, 1, 1,
0.04103082, 0.7043328, -1.397837, 1, 1, 1, 1, 1,
0.04288804, 0.9104493, 0.2852419, 0, 0, 1, 1, 1,
0.0444143, -0.3138613, 3.910578, 1, 0, 0, 1, 1,
0.04538105, 1.501648, 0.1400243, 1, 0, 0, 1, 1,
0.04554909, -0.01779019, 1.837251, 1, 0, 0, 1, 1,
0.05023907, -0.7403578, 4.053912, 1, 0, 0, 1, 1,
0.05047136, -1.476645, 5.039361, 1, 0, 0, 1, 1,
0.05100749, -0.04030768, 2.313594, 0, 0, 0, 1, 1,
0.05135588, 1.634572, 1.344345, 0, 0, 0, 1, 1,
0.05317866, 1.31512, -0.3542391, 0, 0, 0, 1, 1,
0.05329438, 0.3157159, 1.665993, 0, 0, 0, 1, 1,
0.05484091, -0.3405735, 1.791031, 0, 0, 0, 1, 1,
0.05547272, -0.1843227, 4.235138, 0, 0, 0, 1, 1,
0.0573962, -2.01283, 3.400821, 0, 0, 0, 1, 1,
0.06038061, 1.167973, 0.6737943, 1, 1, 1, 1, 1,
0.06466343, -1.389316, 3.725801, 1, 1, 1, 1, 1,
0.06709564, -1.475741, 4.230893, 1, 1, 1, 1, 1,
0.07720949, -0.7090917, 3.081448, 1, 1, 1, 1, 1,
0.07761453, 0.09379177, 0.6084425, 1, 1, 1, 1, 1,
0.0786216, 1.83848, -0.07820575, 1, 1, 1, 1, 1,
0.07961735, -1.93435, 4.039678, 1, 1, 1, 1, 1,
0.08499432, 0.9029945, -0.3737175, 1, 1, 1, 1, 1,
0.08617892, -0.2963514, 1.124349, 1, 1, 1, 1, 1,
0.08626534, 1.237595, -0.2183318, 1, 1, 1, 1, 1,
0.09059691, -0.9233757, 2.806379, 1, 1, 1, 1, 1,
0.09334408, 1.035236, 0.2046216, 1, 1, 1, 1, 1,
0.09471747, -0.7468339, 2.724506, 1, 1, 1, 1, 1,
0.09629012, 1.092505, -0.4675353, 1, 1, 1, 1, 1,
0.09656953, 0.43391, 0.2685356, 1, 1, 1, 1, 1,
0.1018578, -0.3510668, 2.869334, 0, 0, 1, 1, 1,
0.1039551, 1.17837, 1.308409, 1, 0, 0, 1, 1,
0.104887, -2.853367, 2.338866, 1, 0, 0, 1, 1,
0.1058331, 1.930035, 0.3296186, 1, 0, 0, 1, 1,
0.1072824, -1.350645, 3.402788, 1, 0, 0, 1, 1,
0.1085606, 0.2342567, 0.2196625, 1, 0, 0, 1, 1,
0.1105446, 0.4407355, -0.760368, 0, 0, 0, 1, 1,
0.1140737, -0.852634, 3.574346, 0, 0, 0, 1, 1,
0.1158431, -0.9400231, 3.712872, 0, 0, 0, 1, 1,
0.1178142, 1.325402, 0.7960069, 0, 0, 0, 1, 1,
0.1179084, -0.9840356, 0.977964, 0, 0, 0, 1, 1,
0.1234479, -1.303328, 1.626417, 0, 0, 0, 1, 1,
0.1242482, -1.030564, 1.47655, 0, 0, 0, 1, 1,
0.1272334, -0.01377744, 1.047373, 1, 1, 1, 1, 1,
0.1292332, 0.2768015, -0.8320512, 1, 1, 1, 1, 1,
0.1330494, -0.843548, 2.513901, 1, 1, 1, 1, 1,
0.1368552, 0.9317937, -1.092488, 1, 1, 1, 1, 1,
0.1389474, -1.313053, 2.475303, 1, 1, 1, 1, 1,
0.1408678, 0.4647276, 0.630834, 1, 1, 1, 1, 1,
0.1417094, -0.564151, 2.971195, 1, 1, 1, 1, 1,
0.1456453, -1.348853, 1.92048, 1, 1, 1, 1, 1,
0.1582464, -1.381821, 3.215441, 1, 1, 1, 1, 1,
0.1611423, -0.5824973, 2.994879, 1, 1, 1, 1, 1,
0.1616144, 0.5175955, 1.453829, 1, 1, 1, 1, 1,
0.1635932, 0.1930319, -0.01227654, 1, 1, 1, 1, 1,
0.1639928, -0.09923904, 2.458328, 1, 1, 1, 1, 1,
0.1642388, 0.9597445, 0.1578241, 1, 1, 1, 1, 1,
0.1643724, -0.7960984, 3.472916, 1, 1, 1, 1, 1,
0.1660132, 2.300419, -0.8608068, 0, 0, 1, 1, 1,
0.1725036, 1.338104, -0.36032, 1, 0, 0, 1, 1,
0.1782798, 1.10979, 0.5014785, 1, 0, 0, 1, 1,
0.1802064, -0.7591764, 2.769533, 1, 0, 0, 1, 1,
0.1894553, -0.6203825, 2.368639, 1, 0, 0, 1, 1,
0.1929018, -0.743745, 2.856819, 1, 0, 0, 1, 1,
0.1934732, 0.3606731, 0.737153, 0, 0, 0, 1, 1,
0.1956052, -1.074183, 2.579087, 0, 0, 0, 1, 1,
0.197438, 0.2572598, 0.06917045, 0, 0, 0, 1, 1,
0.2065266, -0.1063805, 1.949023, 0, 0, 0, 1, 1,
0.2088547, 0.1252012, 1.39193, 0, 0, 0, 1, 1,
0.2100693, 0.6888806, 0.507234, 0, 0, 0, 1, 1,
0.2169924, 0.02188429, 2.698995, 0, 0, 0, 1, 1,
0.2174966, -3.014902, 3.615131, 1, 1, 1, 1, 1,
0.2191054, 1.519866, 0.1049553, 1, 1, 1, 1, 1,
0.2191242, 1.444469, 2.320506, 1, 1, 1, 1, 1,
0.2206548, 0.35971, 0.06978761, 1, 1, 1, 1, 1,
0.2207377, -0.5787866, 3.059225, 1, 1, 1, 1, 1,
0.2220776, 1.500568, 1.017097, 1, 1, 1, 1, 1,
0.2224234, -0.7975443, 3.564922, 1, 1, 1, 1, 1,
0.2247112, 0.1899484, -0.5307686, 1, 1, 1, 1, 1,
0.2256756, -0.5365415, 3.324068, 1, 1, 1, 1, 1,
0.227139, 1.457427, 0.4825672, 1, 1, 1, 1, 1,
0.2280862, -0.4021868, 1.615319, 1, 1, 1, 1, 1,
0.2297283, -0.9046742, 3.644522, 1, 1, 1, 1, 1,
0.2350877, -0.8792933, 1.851716, 1, 1, 1, 1, 1,
0.2359822, 1.704603, 1.486806, 1, 1, 1, 1, 1,
0.2408371, 0.7707403, -0.1261536, 1, 1, 1, 1, 1,
0.2433207, -0.05309825, 1.33131, 0, 0, 1, 1, 1,
0.2450987, -0.641106, 2.958306, 1, 0, 0, 1, 1,
0.2458164, -1.376129, 3.40141, 1, 0, 0, 1, 1,
0.2472412, 0.4756671, 1.663281, 1, 0, 0, 1, 1,
0.2495559, -0.5105559, 1.540034, 1, 0, 0, 1, 1,
0.2502911, 0.9831725, 0.6347802, 1, 0, 0, 1, 1,
0.251328, 0.7051741, 1.145818, 0, 0, 0, 1, 1,
0.2517138, -0.9602312, 3.137264, 0, 0, 0, 1, 1,
0.2528951, -0.4949847, 3.172478, 0, 0, 0, 1, 1,
0.2594812, -0.4218595, 3.885135, 0, 0, 0, 1, 1,
0.259559, -1.013783, 2.982398, 0, 0, 0, 1, 1,
0.2631747, -1.174261, 2.413182, 0, 0, 0, 1, 1,
0.2685733, 1.32822, -0.04851147, 0, 0, 0, 1, 1,
0.2689999, -1.585982, 3.732065, 1, 1, 1, 1, 1,
0.2744933, -0.8324744, 4.711045, 1, 1, 1, 1, 1,
0.2814174, 0.2334178, 1.150228, 1, 1, 1, 1, 1,
0.2819655, -0.8838756, 1.791059, 1, 1, 1, 1, 1,
0.287374, -0.7127644, 2.744705, 1, 1, 1, 1, 1,
0.291444, 1.391648, -0.2869723, 1, 1, 1, 1, 1,
0.2959979, -0.5938059, 3.510563, 1, 1, 1, 1, 1,
0.2981634, -0.859502, 2.186715, 1, 1, 1, 1, 1,
0.3022693, -0.9931444, 1.368195, 1, 1, 1, 1, 1,
0.3027803, -1.593295, 3.037156, 1, 1, 1, 1, 1,
0.3101851, -0.9034598, 3.493404, 1, 1, 1, 1, 1,
0.3102272, -0.234236, 2.137323, 1, 1, 1, 1, 1,
0.3189402, -0.2814969, 1.265657, 1, 1, 1, 1, 1,
0.3208479, -0.6045488, 2.120256, 1, 1, 1, 1, 1,
0.3218048, 0.6575274, 1.426481, 1, 1, 1, 1, 1,
0.3240679, -1.168327, 2.227507, 0, 0, 1, 1, 1,
0.3243276, 1.353909, 0.8123474, 1, 0, 0, 1, 1,
0.3273393, 0.2829576, 0.3791956, 1, 0, 0, 1, 1,
0.327763, 2.332309, -0.7572829, 1, 0, 0, 1, 1,
0.3332316, -0.4730951, 3.698481, 1, 0, 0, 1, 1,
0.3346524, -0.8473569, 3.959378, 1, 0, 0, 1, 1,
0.3372798, -0.4642453, 1.990943, 0, 0, 0, 1, 1,
0.3414846, 0.005509177, 2.105491, 0, 0, 0, 1, 1,
0.3420841, -0.3302267, 2.248842, 0, 0, 0, 1, 1,
0.3421708, 0.1877039, 0.7000527, 0, 0, 0, 1, 1,
0.3439317, 0.9434094, -0.5255917, 0, 0, 0, 1, 1,
0.3535555, -0.7788342, 3.737822, 0, 0, 0, 1, 1,
0.3564039, 1.660968, 0.4829122, 0, 0, 0, 1, 1,
0.3588661, 0.09603643, 2.079897, 1, 1, 1, 1, 1,
0.3632298, 0.2861571, 0.7737443, 1, 1, 1, 1, 1,
0.3659822, 0.2631746, 0.3425218, 1, 1, 1, 1, 1,
0.3679183, 2.795683, -0.5765327, 1, 1, 1, 1, 1,
0.3685239, 0.4462515, -0.04621599, 1, 1, 1, 1, 1,
0.3718516, -0.4387679, 2.654334, 1, 1, 1, 1, 1,
0.3794, -0.261641, 2.089565, 1, 1, 1, 1, 1,
0.3824702, -1.094148, 3.868529, 1, 1, 1, 1, 1,
0.3924327, 1.475438, -0.7240151, 1, 1, 1, 1, 1,
0.3926967, -0.5619079, 4.564317, 1, 1, 1, 1, 1,
0.3974447, -0.6319259, 1.844922, 1, 1, 1, 1, 1,
0.4030181, 0.2094402, 0.3231034, 1, 1, 1, 1, 1,
0.4057754, 0.2636328, 0.395803, 1, 1, 1, 1, 1,
0.4083131, -0.6232336, 5.005096, 1, 1, 1, 1, 1,
0.4103744, -0.06735131, 3.709006, 1, 1, 1, 1, 1,
0.4174957, -2.501561, 3.564111, 0, 0, 1, 1, 1,
0.4179406, -1.19453, 3.266007, 1, 0, 0, 1, 1,
0.422277, 1.178609, 1.28005, 1, 0, 0, 1, 1,
0.4249549, -0.6434272, 2.849161, 1, 0, 0, 1, 1,
0.4302624, 0.5207843, -0.08521644, 1, 0, 0, 1, 1,
0.4315829, 1.431371, 0.2794244, 1, 0, 0, 1, 1,
0.4362043, -0.1502945, 1.873978, 0, 0, 0, 1, 1,
0.439364, -0.3934549, 3.162227, 0, 0, 0, 1, 1,
0.4401895, -0.03356403, 1.83268, 0, 0, 0, 1, 1,
0.4433808, 1.123435, -0.4587479, 0, 0, 0, 1, 1,
0.4546972, -0.2315108, 1.443888, 0, 0, 0, 1, 1,
0.4571539, 0.0310237, 3.21395, 0, 0, 0, 1, 1,
0.4595414, -0.1265509, 0.1410582, 0, 0, 0, 1, 1,
0.4604199, -0.573264, 3.192198, 1, 1, 1, 1, 1,
0.4660771, -1.212455, 4.179026, 1, 1, 1, 1, 1,
0.4685649, 0.3159979, 2.549237, 1, 1, 1, 1, 1,
0.4730043, -0.9317987, 2.542748, 1, 1, 1, 1, 1,
0.473309, 0.9256476, -0.2320393, 1, 1, 1, 1, 1,
0.4752364, -1.544331, 3.379905, 1, 1, 1, 1, 1,
0.4759503, -0.02953117, 1.202815, 1, 1, 1, 1, 1,
0.4844512, 0.06824437, 0.8111409, 1, 1, 1, 1, 1,
0.4867776, 0.604226, 0.29543, 1, 1, 1, 1, 1,
0.4868445, 1.197047, 1.944876, 1, 1, 1, 1, 1,
0.4887965, -0.314478, 3.94079, 1, 1, 1, 1, 1,
0.4931749, -0.09146065, 1.651605, 1, 1, 1, 1, 1,
0.5008076, 0.3692816, 3.004329, 1, 1, 1, 1, 1,
0.5038731, -0.8551023, 2.0315, 1, 1, 1, 1, 1,
0.5059351, -0.2164048, 3.199754, 1, 1, 1, 1, 1,
0.5069993, -0.4820499, 1.571636, 0, 0, 1, 1, 1,
0.5142789, -0.2877688, 2.08121, 1, 0, 0, 1, 1,
0.5180151, -0.1049023, 2.274138, 1, 0, 0, 1, 1,
0.5195168, 1.809983, 1.418065, 1, 0, 0, 1, 1,
0.524992, 1.055932, 2.309489, 1, 0, 0, 1, 1,
0.5256341, -0.07062255, -0.2031321, 1, 0, 0, 1, 1,
0.5280065, -1.049649, 4.109433, 0, 0, 0, 1, 1,
0.5287248, 1.164899, 0.1838975, 0, 0, 0, 1, 1,
0.5293438, -0.1113745, 1.094148, 0, 0, 0, 1, 1,
0.5303186, 0.9105518, 0.4375829, 0, 0, 0, 1, 1,
0.5341435, 0.2523791, 0.08579376, 0, 0, 0, 1, 1,
0.5357875, -0.1927942, 2.690326, 0, 0, 0, 1, 1,
0.5359525, -0.7548705, 1.016962, 0, 0, 0, 1, 1,
0.5424156, -0.8502895, 2.410738, 1, 1, 1, 1, 1,
0.5432954, 1.413239, 1.135144, 1, 1, 1, 1, 1,
0.5441025, 1.037131, 0.4139618, 1, 1, 1, 1, 1,
0.5514838, -0.5767955, 1.517948, 1, 1, 1, 1, 1,
0.5517597, -1.238366, 4.452555, 1, 1, 1, 1, 1,
0.5554569, 2.2061, -0.6793398, 1, 1, 1, 1, 1,
0.5580149, 0.2776741, 1.623965, 1, 1, 1, 1, 1,
0.5641768, -0.5737503, 0.9612218, 1, 1, 1, 1, 1,
0.5642057, 0.1393276, 1.491063, 1, 1, 1, 1, 1,
0.5688376, -0.2850274, 0.7042705, 1, 1, 1, 1, 1,
0.5799677, 2.104215, 0.9381876, 1, 1, 1, 1, 1,
0.5803346, -1.77939, 3.163464, 1, 1, 1, 1, 1,
0.5809767, -1.08575, 3.810402, 1, 1, 1, 1, 1,
0.5813024, -1.681724, 2.812213, 1, 1, 1, 1, 1,
0.5855364, 0.03691241, -0.3509891, 1, 1, 1, 1, 1,
0.5861069, -0.2009544, 1.322554, 0, 0, 1, 1, 1,
0.5916649, 1.958723, 1.125398, 1, 0, 0, 1, 1,
0.5962743, -0.2482628, 1.489407, 1, 0, 0, 1, 1,
0.60081, -0.6949822, 2.037087, 1, 0, 0, 1, 1,
0.6011891, 0.04151903, -0.2730836, 1, 0, 0, 1, 1,
0.602149, 0.6424296, 1.117451, 1, 0, 0, 1, 1,
0.6038473, -0.5649813, 2.798224, 0, 0, 0, 1, 1,
0.6042591, -1.221273, 3.104126, 0, 0, 0, 1, 1,
0.605902, 1.932559, 0.7983672, 0, 0, 0, 1, 1,
0.6070295, -0.5082716, 2.15835, 0, 0, 0, 1, 1,
0.6120666, 1.932664, 0.2708179, 0, 0, 0, 1, 1,
0.6121988, -0.6278902, 3.641379, 0, 0, 0, 1, 1,
0.6178812, -2.799866, 2.576784, 0, 0, 0, 1, 1,
0.6243488, -0.7399749, 3.47656, 1, 1, 1, 1, 1,
0.6287307, -0.5333745, 3.733014, 1, 1, 1, 1, 1,
0.6322201, 0.6019015, 2.018151, 1, 1, 1, 1, 1,
0.6372611, -0.8573079, 2.563344, 1, 1, 1, 1, 1,
0.6375985, -0.4587915, 2.125281, 1, 1, 1, 1, 1,
0.6379367, 1.703828, 0.6419146, 1, 1, 1, 1, 1,
0.6406453, 0.01865811, 2.377048, 1, 1, 1, 1, 1,
0.640967, -0.1266255, 2.15715, 1, 1, 1, 1, 1,
0.6421577, -0.06699418, 1.475218, 1, 1, 1, 1, 1,
0.6515806, 0.290207, 1.664473, 1, 1, 1, 1, 1,
0.6610122, 0.3340203, 2.115388, 1, 1, 1, 1, 1,
0.6644616, 0.3047218, 2.559957, 1, 1, 1, 1, 1,
0.6661735, -0.1179143, 2.840507, 1, 1, 1, 1, 1,
0.671864, -1.466855, 1.115748, 1, 1, 1, 1, 1,
0.6718904, 0.2275311, 2.047817, 1, 1, 1, 1, 1,
0.673499, -0.5584788, 0.06685084, 0, 0, 1, 1, 1,
0.6751252, -0.2840531, 2.236293, 1, 0, 0, 1, 1,
0.6802702, 1.094854, -0.1624132, 1, 0, 0, 1, 1,
0.6815814, -0.4210141, 3.188685, 1, 0, 0, 1, 1,
0.6838477, -0.5597739, 3.164624, 1, 0, 0, 1, 1,
0.6866968, -0.5115132, 2.530054, 1, 0, 0, 1, 1,
0.6903303, -0.5903815, 1.540488, 0, 0, 0, 1, 1,
0.6906245, 0.9118703, 1.412636, 0, 0, 0, 1, 1,
0.6993557, 0.1690178, 2.056853, 0, 0, 0, 1, 1,
0.7019964, 1.689305, 0.5585428, 0, 0, 0, 1, 1,
0.7023796, 1.858099, 0.6197569, 0, 0, 0, 1, 1,
0.7055854, -1.040777, 4.425719, 0, 0, 0, 1, 1,
0.7091435, 0.4148367, 0.8468007, 0, 0, 0, 1, 1,
0.7211198, 0.8437976, 1.280082, 1, 1, 1, 1, 1,
0.7243337, -0.9047443, 1.290335, 1, 1, 1, 1, 1,
0.72731, 1.544008, 0.2810395, 1, 1, 1, 1, 1,
0.7298838, -0.1377322, 1.544505, 1, 1, 1, 1, 1,
0.7344107, -0.7014096, 3.518336, 1, 1, 1, 1, 1,
0.7350844, -0.1654228, 0.3590123, 1, 1, 1, 1, 1,
0.7366819, 0.3486607, -0.3083873, 1, 1, 1, 1, 1,
0.7380374, 0.009907424, 2.438139, 1, 1, 1, 1, 1,
0.7416329, 0.3819374, 2.64549, 1, 1, 1, 1, 1,
0.7424606, -0.8033219, 3.815464, 1, 1, 1, 1, 1,
0.7425015, 0.6944832, 0.3018619, 1, 1, 1, 1, 1,
0.7452934, 0.3154143, 2.471421, 1, 1, 1, 1, 1,
0.7491891, 1.507821, 2.067305, 1, 1, 1, 1, 1,
0.7496786, 2.381761, 0.9362513, 1, 1, 1, 1, 1,
0.7623728, -0.7460404, 2.971044, 1, 1, 1, 1, 1,
0.7643002, -0.872198, 2.649453, 0, 0, 1, 1, 1,
0.769879, -1.643998, 0.257439, 1, 0, 0, 1, 1,
0.7713279, 0.4035502, 0.9236034, 1, 0, 0, 1, 1,
0.7715145, 0.2335014, 2.139449, 1, 0, 0, 1, 1,
0.77253, 0.2412679, 1.654879, 1, 0, 0, 1, 1,
0.7730271, 1.129646, 0.4541793, 1, 0, 0, 1, 1,
0.7733181, -1.510289, 1.493724, 0, 0, 0, 1, 1,
0.7784103, -0.8478228, 2.999586, 0, 0, 0, 1, 1,
0.7790193, -0.8731885, 2.584997, 0, 0, 0, 1, 1,
0.7817066, -0.5209719, 2.587867, 0, 0, 0, 1, 1,
0.7897902, 0.9465529, 0.7197977, 0, 0, 0, 1, 1,
0.80177, 0.5402738, 3.348814, 0, 0, 0, 1, 1,
0.8018037, -0.8488517, 2.803318, 0, 0, 0, 1, 1,
0.804727, 0.3084675, 3.356502, 1, 1, 1, 1, 1,
0.809609, -0.3409083, 1.226385, 1, 1, 1, 1, 1,
0.8112124, -1.077746, 0.9275084, 1, 1, 1, 1, 1,
0.8163546, -1.098897, 2.844028, 1, 1, 1, 1, 1,
0.8174536, -0.9033738, 3.766437, 1, 1, 1, 1, 1,
0.8187087, 0.7969863, 0.1722252, 1, 1, 1, 1, 1,
0.8194391, 0.691597, -0.5365195, 1, 1, 1, 1, 1,
0.8207462, 0.2057494, 1.320867, 1, 1, 1, 1, 1,
0.8246163, 1.945615, 1.192404, 1, 1, 1, 1, 1,
0.8257971, -0.3783764, 1.539875, 1, 1, 1, 1, 1,
0.825839, -1.21355, 2.77221, 1, 1, 1, 1, 1,
0.8268856, 1.255086, -1.334284, 1, 1, 1, 1, 1,
0.8277743, 1.435951, -0.09456162, 1, 1, 1, 1, 1,
0.8297399, 1.117941, 0.26415, 1, 1, 1, 1, 1,
0.836782, -1.31008, 3.463036, 1, 1, 1, 1, 1,
0.8405414, 0.06660903, 2.356116, 0, 0, 1, 1, 1,
0.8416315, -1.436688, 3.045079, 1, 0, 0, 1, 1,
0.846628, -0.1790541, 1.923741, 1, 0, 0, 1, 1,
0.8522473, -1.32421, 3.207289, 1, 0, 0, 1, 1,
0.8575698, 0.4430203, 1.80303, 1, 0, 0, 1, 1,
0.8595535, -2.79018, 1.952236, 1, 0, 0, 1, 1,
0.8726949, -1.330722, 3.047936, 0, 0, 0, 1, 1,
0.8729116, 0.714505, 1.36637, 0, 0, 0, 1, 1,
0.8732842, 1.344315, 1.049097, 0, 0, 0, 1, 1,
0.8813604, -1.973896, 1.090776, 0, 0, 0, 1, 1,
0.8829252, -0.6763439, 2.12414, 0, 0, 0, 1, 1,
0.8831716, 0.521394, 1.864914, 0, 0, 0, 1, 1,
0.8845887, 1.100079, 1.051544, 0, 0, 0, 1, 1,
0.8871388, -1.268309, 2.713112, 1, 1, 1, 1, 1,
0.8906943, 0.05618655, 0.07148566, 1, 1, 1, 1, 1,
0.8938482, 0.1849263, 0.284278, 1, 1, 1, 1, 1,
0.8970324, -0.6745089, 2.788003, 1, 1, 1, 1, 1,
0.9000681, -0.2569269, 1.934767, 1, 1, 1, 1, 1,
0.9022308, 0.3735241, 2.355914, 1, 1, 1, 1, 1,
0.9090194, 2.331425, 1.5371, 1, 1, 1, 1, 1,
0.9231642, 0.07674666, 2.065193, 1, 1, 1, 1, 1,
0.9288357, -1.143812, 2.662997, 1, 1, 1, 1, 1,
0.9296271, -0.40422, 0.5643124, 1, 1, 1, 1, 1,
0.9351674, -0.05281205, 1.837966, 1, 1, 1, 1, 1,
0.9473423, 0.5618103, -0.8829259, 1, 1, 1, 1, 1,
0.9474418, -0.9182546, 1.053139, 1, 1, 1, 1, 1,
0.9490741, 0.2694377, 0.8428721, 1, 1, 1, 1, 1,
0.9498295, -0.5922176, 2.393056, 1, 1, 1, 1, 1,
0.95362, -0.745927, 1.413755, 0, 0, 1, 1, 1,
0.9549246, 0.8847193, -0.1682775, 1, 0, 0, 1, 1,
0.9552717, 0.3642271, 1.39847, 1, 0, 0, 1, 1,
0.955764, 0.6510993, 1.549315, 1, 0, 0, 1, 1,
0.9585135, 1.729885, -0.6344939, 1, 0, 0, 1, 1,
0.9625166, 0.03694477, 0.6196682, 1, 0, 0, 1, 1,
0.965574, -1.031324, 1.634726, 0, 0, 0, 1, 1,
0.9755535, -0.08011584, 2.352405, 0, 0, 0, 1, 1,
0.9761725, -0.0007941072, 0.6990818, 0, 0, 0, 1, 1,
0.9889219, 0.09755728, 0.4979341, 0, 0, 0, 1, 1,
0.9893318, -0.765536, 2.283193, 0, 0, 0, 1, 1,
0.9941247, 0.180803, 1.309986, 0, 0, 0, 1, 1,
1.009232, -0.5738451, 0.6658347, 0, 0, 0, 1, 1,
1.022351, -1.366767, 1.952969, 1, 1, 1, 1, 1,
1.024104, 0.8030629, 0.4930768, 1, 1, 1, 1, 1,
1.027973, -0.9258923, 1.888024, 1, 1, 1, 1, 1,
1.030782, -1.570547, 4.148524, 1, 1, 1, 1, 1,
1.040871, 3.369276, 0.9566041, 1, 1, 1, 1, 1,
1.044522, -0.9534737, 2.964692, 1, 1, 1, 1, 1,
1.048773, -1.138217, 1.318398, 1, 1, 1, 1, 1,
1.062837, -0.7898738, 1.243027, 1, 1, 1, 1, 1,
1.071721, -0.4205317, 1.836869, 1, 1, 1, 1, 1,
1.084292, 0.623428, 0.921692, 1, 1, 1, 1, 1,
1.08552, 0.09582532, 1.144659, 1, 1, 1, 1, 1,
1.089651, -0.07001662, 2.77356, 1, 1, 1, 1, 1,
1.102958, 1.234626, -0.7826418, 1, 1, 1, 1, 1,
1.106821, -0.374429, 2.244522, 1, 1, 1, 1, 1,
1.115554, 0.7215608, 1.182551, 1, 1, 1, 1, 1,
1.115974, -1.251522, 2.468846, 0, 0, 1, 1, 1,
1.11871, -2.20475, 4.385304, 1, 0, 0, 1, 1,
1.127093, 1.331793, 1.761596, 1, 0, 0, 1, 1,
1.129928, 0.5708368, 0.4035821, 1, 0, 0, 1, 1,
1.136513, -0.9931833, 2.390285, 1, 0, 0, 1, 1,
1.136834, 0.4521424, 1.456834, 1, 0, 0, 1, 1,
1.162244, 0.1401067, 1.751246, 0, 0, 0, 1, 1,
1.162682, 0.3435308, -0.6788209, 0, 0, 0, 1, 1,
1.165674, -0.8980842, 0.9545988, 0, 0, 0, 1, 1,
1.175527, -0.02752565, 4.129669, 0, 0, 0, 1, 1,
1.182141, 0.344029, -0.1369363, 0, 0, 0, 1, 1,
1.192432, 0.9756647, 2.621956, 0, 0, 0, 1, 1,
1.196994, -0.9486155, 0.2512248, 0, 0, 0, 1, 1,
1.200395, 0.2431691, 2.96922, 1, 1, 1, 1, 1,
1.203943, 0.2180663, 1.920702, 1, 1, 1, 1, 1,
1.205791, 0.1665253, -1.044509, 1, 1, 1, 1, 1,
1.217633, 0.8036212, 2.303823, 1, 1, 1, 1, 1,
1.228551, 1.527878, 0.8690313, 1, 1, 1, 1, 1,
1.239889, -1.147783, 3.135363, 1, 1, 1, 1, 1,
1.241745, 2.033776, 1.336925, 1, 1, 1, 1, 1,
1.24199, -1.847992, 2.391952, 1, 1, 1, 1, 1,
1.242359, -1.160996, 1.166025, 1, 1, 1, 1, 1,
1.245504, 0.009330356, 2.853019, 1, 1, 1, 1, 1,
1.245534, -0.5752863, 3.182313, 1, 1, 1, 1, 1,
1.245553, -0.3116786, 4.311333, 1, 1, 1, 1, 1,
1.245675, -3.03719, 2.846522, 1, 1, 1, 1, 1,
1.255354, 0.2281905, 0.1391622, 1, 1, 1, 1, 1,
1.262604, -2.058985, 1.246938, 1, 1, 1, 1, 1,
1.26794, -0.9358689, 4.597149, 0, 0, 1, 1, 1,
1.268875, 0.6377911, 0.6574314, 1, 0, 0, 1, 1,
1.277301, -0.6921505, 4.823879, 1, 0, 0, 1, 1,
1.282828, -0.9642189, 1.823174, 1, 0, 0, 1, 1,
1.287676, -0.4530991, 1.674498, 1, 0, 0, 1, 1,
1.301526, -0.3713648, 1.44271, 1, 0, 0, 1, 1,
1.319495, -0.9108561, 2.192906, 0, 0, 0, 1, 1,
1.321404, 2.389302, -0.6860767, 0, 0, 0, 1, 1,
1.322536, -0.5347809, 2.170633, 0, 0, 0, 1, 1,
1.339785, -0.3310969, 0.8366787, 0, 0, 0, 1, 1,
1.340346, 0.7710585, -0.266107, 0, 0, 0, 1, 1,
1.360134, -1.857231, 4.652986, 0, 0, 0, 1, 1,
1.364519, 0.4601544, 2.102912, 0, 0, 0, 1, 1,
1.365104, 0.2328994, 0.9643982, 1, 1, 1, 1, 1,
1.394453, -1.31593, 3.175011, 1, 1, 1, 1, 1,
1.394513, -0.8690777, 1.799621, 1, 1, 1, 1, 1,
1.397606, -1.839783, 2.501605, 1, 1, 1, 1, 1,
1.397637, -1.023364, 2.116789, 1, 1, 1, 1, 1,
1.409147, -0.7242835, 2.580937, 1, 1, 1, 1, 1,
1.411573, -1.358918, 2.883827, 1, 1, 1, 1, 1,
1.462373, -0.5221526, 1.431905, 1, 1, 1, 1, 1,
1.462389, -1.399755, 1.984635, 1, 1, 1, 1, 1,
1.465859, -0.8314309, 1.132018, 1, 1, 1, 1, 1,
1.472139, 0.5510066, 1.629746, 1, 1, 1, 1, 1,
1.480823, -0.7907768, 2.798242, 1, 1, 1, 1, 1,
1.491353, -0.09532271, 3.978543, 1, 1, 1, 1, 1,
1.492973, 1.397262, 1.383192, 1, 1, 1, 1, 1,
1.49873, -1.225953, 2.163499, 1, 1, 1, 1, 1,
1.499414, -1.172835, 3.671804, 0, 0, 1, 1, 1,
1.500097, -0.09410819, 1.210662, 1, 0, 0, 1, 1,
1.502973, 1.575378, 0.3447802, 1, 0, 0, 1, 1,
1.508433, -1.221954, 3.71702, 1, 0, 0, 1, 1,
1.510045, -1.030324, 1.618454, 1, 0, 0, 1, 1,
1.513625, -0.4188135, 2.777615, 1, 0, 0, 1, 1,
1.514771, -1.102793, 1.976954, 0, 0, 0, 1, 1,
1.532263, -0.714273, 1.901304, 0, 0, 0, 1, 1,
1.55423, 0.820422, 3.135754, 0, 0, 0, 1, 1,
1.566894, 1.435676, -0.7637358, 0, 0, 0, 1, 1,
1.569528, 0.9053505, 1.783034, 0, 0, 0, 1, 1,
1.574719, 1.093666, 0.6900079, 0, 0, 0, 1, 1,
1.583831, 0.6090893, 0.3149179, 0, 0, 0, 1, 1,
1.585076, -0.09914616, 2.690992, 1, 1, 1, 1, 1,
1.591016, 1.379778, -0.4898712, 1, 1, 1, 1, 1,
1.593532, -1.063231, 1.582379, 1, 1, 1, 1, 1,
1.593991, -0.7195421, 2.125101, 1, 1, 1, 1, 1,
1.599177, 0.3543957, 1.130562, 1, 1, 1, 1, 1,
1.608965, 0.8401757, 0.4895516, 1, 1, 1, 1, 1,
1.637514, -0.7473967, 1.086193, 1, 1, 1, 1, 1,
1.637673, 0.1055481, 1.864401, 1, 1, 1, 1, 1,
1.638808, -0.02166667, 1.044402, 1, 1, 1, 1, 1,
1.639203, 0.08051156, 0.7415797, 1, 1, 1, 1, 1,
1.64068, -1.722781, 2.136276, 1, 1, 1, 1, 1,
1.649732, 0.5748311, -0.788194, 1, 1, 1, 1, 1,
1.649821, 0.4846333, 3.03406, 1, 1, 1, 1, 1,
1.675739, 1.167214, 0.8640701, 1, 1, 1, 1, 1,
1.699821, 0.6006316, 1.014781, 1, 1, 1, 1, 1,
1.700414, 0.08918609, 1.802547, 0, 0, 1, 1, 1,
1.703713, -1.205333, 2.498425, 1, 0, 0, 1, 1,
1.713266, 0.3926044, 1.494433, 1, 0, 0, 1, 1,
1.721101, 0.04157566, 0.3305967, 1, 0, 0, 1, 1,
1.721703, -0.4153727, 2.858474, 1, 0, 0, 1, 1,
1.731826, -1.793563, 4.38832, 1, 0, 0, 1, 1,
1.740993, 0.3263574, 2.596301, 0, 0, 0, 1, 1,
1.758093, -0.5812984, 1.711953, 0, 0, 0, 1, 1,
1.765228, 0.03343331, 0.869041, 0, 0, 0, 1, 1,
1.784493, 1.266557, 0.3334667, 0, 0, 0, 1, 1,
1.803739, -1.063053, 1.342334, 0, 0, 0, 1, 1,
1.813874, 0.7317601, 1.617732, 0, 0, 0, 1, 1,
1.816695, 0.3694828, 1.672715, 0, 0, 0, 1, 1,
1.825078, -0.6230662, 1.794528, 1, 1, 1, 1, 1,
1.827502, -3.262212, 1.619903, 1, 1, 1, 1, 1,
1.848123, -0.7875572, 4.632406, 1, 1, 1, 1, 1,
1.848763, -1.305639, 4.181071, 1, 1, 1, 1, 1,
1.848831, -1.358087, 1.576152, 1, 1, 1, 1, 1,
1.899391, 0.3264508, 1.052952, 1, 1, 1, 1, 1,
1.920418, 0.4855884, 0.7571616, 1, 1, 1, 1, 1,
1.93332, 0.002641953, 2.881737, 1, 1, 1, 1, 1,
1.934857, 1.322592, -0.1153035, 1, 1, 1, 1, 1,
1.945603, 0.3599737, 1.629493, 1, 1, 1, 1, 1,
1.965766, 0.1553443, 0.1234407, 1, 1, 1, 1, 1,
1.969851, -0.1215224, -0.4038363, 1, 1, 1, 1, 1,
2.00024, 0.3843202, 2.449708, 1, 1, 1, 1, 1,
2.061193, 0.1538395, 0.9235194, 1, 1, 1, 1, 1,
2.098642, -1.999178, 1.524467, 1, 1, 1, 1, 1,
2.113667, -0.4913182, 2.123128, 0, 0, 1, 1, 1,
2.142666, 1.778994, 1.771402, 1, 0, 0, 1, 1,
2.151561, 1.104783, 2.106169, 1, 0, 0, 1, 1,
2.161517, 0.4973431, 1.33544, 1, 0, 0, 1, 1,
2.167255, 0.5802836, 0.69263, 1, 0, 0, 1, 1,
2.195287, -0.1080391, 1.198255, 1, 0, 0, 1, 1,
2.213378, -0.1071128, 1.916266, 0, 0, 0, 1, 1,
2.226803, -0.6526166, 0.8691252, 0, 0, 0, 1, 1,
2.257697, 0.6393753, 2.866444, 0, 0, 0, 1, 1,
2.260577, -0.03786448, 2.469956, 0, 0, 0, 1, 1,
2.272766, 1.929843, 2.110124, 0, 0, 0, 1, 1,
2.305041, -0.6013498, 1.193371, 0, 0, 0, 1, 1,
2.360406, 0.2027948, 2.07371, 0, 0, 0, 1, 1,
2.417445, 1.342182, 0.6390413, 1, 1, 1, 1, 1,
2.464291, -0.1425469, 1.268687, 1, 1, 1, 1, 1,
2.650515, -0.0200634, 0.6321964, 1, 1, 1, 1, 1,
2.657859, -0.4959471, 3.467096, 1, 1, 1, 1, 1,
2.731543, -0.7102669, 0.9856836, 1, 1, 1, 1, 1,
2.875145, -1.650279, 0.07861456, 1, 1, 1, 1, 1,
3.240047, -1.226395, 1.371968, 1, 1, 1, 1, 1
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
var radius = 9.484784;
var distance = 33.3149;
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
mvMatrix.translate( -0.05066562, -0.04894257, 0.1357379 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.3149);
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
