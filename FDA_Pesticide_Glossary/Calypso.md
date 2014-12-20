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
-3.632157, -0.723495, -2.178039, 1, 0, 0, 1,
-3.411598, -0.01906587, -0.4580893, 1, 0.007843138, 0, 1,
-2.945063, 0.6439664, -1.649087, 1, 0.01176471, 0, 1,
-2.869888, -0.8638351, -1.474717, 1, 0.01960784, 0, 1,
-2.865307, 0.585858, -1.082656, 1, 0.02352941, 0, 1,
-2.819014, 0.2827577, -0.4489263, 1, 0.03137255, 0, 1,
-2.760162, 0.5542102, 0.2120467, 1, 0.03529412, 0, 1,
-2.726054, 0.2231708, -1.456718, 1, 0.04313726, 0, 1,
-2.612472, 0.3877255, -1.9049, 1, 0.04705882, 0, 1,
-2.527334, -1.346815, -1.559152, 1, 0.05490196, 0, 1,
-2.499018, -0.8893221, 0.01122888, 1, 0.05882353, 0, 1,
-2.440591, 0.3963777, -2.848702, 1, 0.06666667, 0, 1,
-2.379729, -2.761047, -2.676009, 1, 0.07058824, 0, 1,
-2.378011, 0.04075995, -2.942687, 1, 0.07843138, 0, 1,
-2.352744, -0.9448614, -0.4425651, 1, 0.08235294, 0, 1,
-2.348277, 0.3180867, -0.7811102, 1, 0.09019608, 0, 1,
-2.277137, 0.4613804, -1.915954, 1, 0.09411765, 0, 1,
-2.274365, -0.5482553, -2.18763, 1, 0.1019608, 0, 1,
-2.213223, 1.235299, -1.405008, 1, 0.1098039, 0, 1,
-2.197579, 0.3687062, -1.805221, 1, 0.1137255, 0, 1,
-2.159739, -0.8602381, -2.407186, 1, 0.1215686, 0, 1,
-2.149064, -1.073117, -1.422843, 1, 0.1254902, 0, 1,
-2.14751, 1.517128, -1.268455, 1, 0.1333333, 0, 1,
-2.091645, -0.5718455, -3.73045, 1, 0.1372549, 0, 1,
-2.07262, -0.2459061, -2.575577, 1, 0.145098, 0, 1,
-1.922294, -0.9884385, -1.41006, 1, 0.1490196, 0, 1,
-1.91939, 0.2897081, -2.659977, 1, 0.1568628, 0, 1,
-1.904941, 0.4024537, -1.115526, 1, 0.1607843, 0, 1,
-1.899928, -2.500525, -1.010925, 1, 0.1686275, 0, 1,
-1.885732, 0.8214081, 0.4077874, 1, 0.172549, 0, 1,
-1.88241, -0.3056293, -1.816028, 1, 0.1803922, 0, 1,
-1.879862, 0.8446152, -0.730554, 1, 0.1843137, 0, 1,
-1.878549, 0.4514824, -1.599416, 1, 0.1921569, 0, 1,
-1.86728, -1.757103, -3.167279, 1, 0.1960784, 0, 1,
-1.864271, 0.8298475, -2.719488, 1, 0.2039216, 0, 1,
-1.863158, -0.7511053, -1.809607, 1, 0.2117647, 0, 1,
-1.862621, -0.9576292, -0.8738236, 1, 0.2156863, 0, 1,
-1.830315, 0.1847311, -0.7498423, 1, 0.2235294, 0, 1,
-1.820083, 0.4038145, -2.961329, 1, 0.227451, 0, 1,
-1.815464, 0.01927188, -1.996266, 1, 0.2352941, 0, 1,
-1.797336, -0.7677563, -0.2325211, 1, 0.2392157, 0, 1,
-1.792986, -0.7658026, -1.797069, 1, 0.2470588, 0, 1,
-1.787629, -0.8331732, 1.226243, 1, 0.2509804, 0, 1,
-1.778032, 0.8470398, -0.4784439, 1, 0.2588235, 0, 1,
-1.761885, -1.155337, -1.679224, 1, 0.2627451, 0, 1,
-1.722653, 1.737246, -0.7623104, 1, 0.2705882, 0, 1,
-1.712171, 1.137738, -1.980437, 1, 0.2745098, 0, 1,
-1.71156, 1.33415, -1.079216, 1, 0.282353, 0, 1,
-1.689735, -0.07803157, -2.141173, 1, 0.2862745, 0, 1,
-1.675714, -0.5541602, -1.595262, 1, 0.2941177, 0, 1,
-1.671777, 2.337095, -0.3790361, 1, 0.3019608, 0, 1,
-1.671398, 0.3324427, -1.914721, 1, 0.3058824, 0, 1,
-1.658884, 0.8319342, -1.559178, 1, 0.3137255, 0, 1,
-1.647666, -0.7799339, -2.601794, 1, 0.3176471, 0, 1,
-1.623603, 0.7261112, -2.236433, 1, 0.3254902, 0, 1,
-1.62322, -0.05537827, -2.64256, 1, 0.3294118, 0, 1,
-1.618571, 0.5555081, -1.304077, 1, 0.3372549, 0, 1,
-1.615679, -1.070946, -1.762673, 1, 0.3411765, 0, 1,
-1.611728, -1.162427, -2.041252, 1, 0.3490196, 0, 1,
-1.591264, -0.3004639, -3.614864, 1, 0.3529412, 0, 1,
-1.589275, -1.762178, -2.602572, 1, 0.3607843, 0, 1,
-1.587976, -1.086815, -3.291051, 1, 0.3647059, 0, 1,
-1.57621, 0.3523982, -2.535938, 1, 0.372549, 0, 1,
-1.575908, -0.3075581, -2.178751, 1, 0.3764706, 0, 1,
-1.573992, -1.932903, -2.058846, 1, 0.3843137, 0, 1,
-1.571769, 0.4792557, -0.2331642, 1, 0.3882353, 0, 1,
-1.570772, -0.7013191, -0.6403905, 1, 0.3960784, 0, 1,
-1.554153, -0.8602886, -2.341691, 1, 0.4039216, 0, 1,
-1.549272, 0.5787201, -1.360199, 1, 0.4078431, 0, 1,
-1.544088, -0.3343104, -1.319952, 1, 0.4156863, 0, 1,
-1.543963, -0.7523685, -1.25935, 1, 0.4196078, 0, 1,
-1.543708, 0.2910306, 0.9612761, 1, 0.427451, 0, 1,
-1.52996, 0.3584712, -0.522799, 1, 0.4313726, 0, 1,
-1.512684, 0.6070518, -2.622267, 1, 0.4392157, 0, 1,
-1.482, -0.7054237, -1.469132, 1, 0.4431373, 0, 1,
-1.464213, 1.756299, -1.536601, 1, 0.4509804, 0, 1,
-1.453286, 1.038936, -0.5698119, 1, 0.454902, 0, 1,
-1.451889, 0.3626814, -1.52223, 1, 0.4627451, 0, 1,
-1.445775, -0.6619186, -3.278924, 1, 0.4666667, 0, 1,
-1.435647, -0.5603591, -2.185995, 1, 0.4745098, 0, 1,
-1.426838, -0.4283946, -2.089785, 1, 0.4784314, 0, 1,
-1.42408, 0.8449248, -0.4410213, 1, 0.4862745, 0, 1,
-1.421524, -0.17313, -0.5162265, 1, 0.4901961, 0, 1,
-1.39103, 0.7437369, -0.2600133, 1, 0.4980392, 0, 1,
-1.385229, 0.886656, -0.04384593, 1, 0.5058824, 0, 1,
-1.38099, 0.7298927, -0.9830375, 1, 0.509804, 0, 1,
-1.374698, -0.897624, -1.423194, 1, 0.5176471, 0, 1,
-1.366669, -0.09411123, -1.98759, 1, 0.5215687, 0, 1,
-1.366419, -1.850919, -2.947362, 1, 0.5294118, 0, 1,
-1.360952, -1.566225, -2.159333, 1, 0.5333334, 0, 1,
-1.355976, -0.2837499, -3.050552, 1, 0.5411765, 0, 1,
-1.352048, -1.237892, -1.528573, 1, 0.5450981, 0, 1,
-1.351923, -0.3503002, -1.595558, 1, 0.5529412, 0, 1,
-1.339451, -0.9219906, -1.930816, 1, 0.5568628, 0, 1,
-1.336654, -1.021381, -2.605712, 1, 0.5647059, 0, 1,
-1.326287, -0.1106308, -1.300066, 1, 0.5686275, 0, 1,
-1.324909, 0.3583756, -0.6452841, 1, 0.5764706, 0, 1,
-1.320127, -2.658524, -2.019676, 1, 0.5803922, 0, 1,
-1.315531, 0.4772739, -0.8078873, 1, 0.5882353, 0, 1,
-1.29736, 0.247503, -2.507331, 1, 0.5921569, 0, 1,
-1.296208, -0.7250808, -1.823759, 1, 0.6, 0, 1,
-1.294554, -0.2207783, -0.7978784, 1, 0.6078432, 0, 1,
-1.290294, 1.234669, -1.134461, 1, 0.6117647, 0, 1,
-1.284427, -2.132022, -2.183601, 1, 0.6196079, 0, 1,
-1.272213, 0.1388823, -1.885862, 1, 0.6235294, 0, 1,
-1.269078, -0.3044401, -3.582931, 1, 0.6313726, 0, 1,
-1.26751, -1.16185, -2.330494, 1, 0.6352941, 0, 1,
-1.262232, -0.31854, -0.8085669, 1, 0.6431373, 0, 1,
-1.254565, -1.011793, -1.624224, 1, 0.6470588, 0, 1,
-1.252575, -1.283139, -2.815173, 1, 0.654902, 0, 1,
-1.251489, -0.04635404, -2.799317, 1, 0.6588235, 0, 1,
-1.247214, 0.4224303, -0.3583419, 1, 0.6666667, 0, 1,
-1.238836, -1.431095, -2.559644, 1, 0.6705883, 0, 1,
-1.233182, 1.065352, -0.8239747, 1, 0.6784314, 0, 1,
-1.225972, 1.301912, 0.2801744, 1, 0.682353, 0, 1,
-1.223039, -0.8115442, -2.72553, 1, 0.6901961, 0, 1,
-1.222081, 0.8604387, -3.926136, 1, 0.6941177, 0, 1,
-1.21979, -0.3979995, -1.273021, 1, 0.7019608, 0, 1,
-1.214683, -0.7609801, -1.651008, 1, 0.7098039, 0, 1,
-1.209815, 0.167926, -2.286472, 1, 0.7137255, 0, 1,
-1.203838, 0.6026925, 0.169005, 1, 0.7215686, 0, 1,
-1.195364, -0.4986166, -0.74388, 1, 0.7254902, 0, 1,
-1.186769, -0.7351484, -2.99481, 1, 0.7333333, 0, 1,
-1.185488, -0.3327971, -2.151853, 1, 0.7372549, 0, 1,
-1.183009, 0.9649215, -1.176089, 1, 0.7450981, 0, 1,
-1.179197, -0.8968248, -2.63907, 1, 0.7490196, 0, 1,
-1.174677, 0.1352288, -3.529051, 1, 0.7568628, 0, 1,
-1.169927, -0.7800783, -1.256699, 1, 0.7607843, 0, 1,
-1.147999, -0.6110107, -2.71678, 1, 0.7686275, 0, 1,
-1.147059, 0.597474, -2.315003, 1, 0.772549, 0, 1,
-1.139915, -0.7612016, -0.5365927, 1, 0.7803922, 0, 1,
-1.137326, 0.4228965, -0.9240029, 1, 0.7843137, 0, 1,
-1.136651, -0.7736574, -2.638685, 1, 0.7921569, 0, 1,
-1.127621, 2.237043, 0.5756932, 1, 0.7960784, 0, 1,
-1.125593, -0.0839453, -1.244078, 1, 0.8039216, 0, 1,
-1.122126, 0.1910375, 0.06328537, 1, 0.8117647, 0, 1,
-1.120965, -3.029407, -1.481349, 1, 0.8156863, 0, 1,
-1.115959, 0.8911946, -0.3140927, 1, 0.8235294, 0, 1,
-1.112079, 0.642828, 0.2563952, 1, 0.827451, 0, 1,
-1.11191, 0.481416, -2.46716, 1, 0.8352941, 0, 1,
-1.110455, -1.325872, -5.395265, 1, 0.8392157, 0, 1,
-1.105036, 0.6415997, -0.04783712, 1, 0.8470588, 0, 1,
-1.102474, 0.5013395, -2.503793, 1, 0.8509804, 0, 1,
-1.101348, -0.4533246, -1.230092, 1, 0.8588235, 0, 1,
-1.099182, 2.093284, -1.582068, 1, 0.8627451, 0, 1,
-1.095057, -1.528773, -0.7422153, 1, 0.8705882, 0, 1,
-1.09155, 1.137943, -0.2151735, 1, 0.8745098, 0, 1,
-1.08781, -0.3677473, -1.095043, 1, 0.8823529, 0, 1,
-1.087429, -1.450681, -2.975448, 1, 0.8862745, 0, 1,
-1.087166, 0.2583811, -0.9592406, 1, 0.8941177, 0, 1,
-1.080601, 0.1617352, -1.508258, 1, 0.8980392, 0, 1,
-1.06178, -0.05570645, -0.9458643, 1, 0.9058824, 0, 1,
-1.059494, 0.3661492, -1.677936, 1, 0.9137255, 0, 1,
-1.055027, -0.1783662, -2.070291, 1, 0.9176471, 0, 1,
-1.052463, 1.925077, -2.230846, 1, 0.9254902, 0, 1,
-1.047395, -0.7772683, -2.707886, 1, 0.9294118, 0, 1,
-1.041174, -0.4853531, -4.157935, 1, 0.9372549, 0, 1,
-1.04072, -1.586041, -0.01971425, 1, 0.9411765, 0, 1,
-1.036041, 0.2741099, -2.114314, 1, 0.9490196, 0, 1,
-1.034366, -2.433154, -2.595717, 1, 0.9529412, 0, 1,
-1.033572, 2.611431, -0.6179344, 1, 0.9607843, 0, 1,
-1.030114, 0.007528284, -0.2925622, 1, 0.9647059, 0, 1,
-1.027598, -0.5446048, -3.301054, 1, 0.972549, 0, 1,
-1.026272, -0.8206729, -2.081343, 1, 0.9764706, 0, 1,
-1.017278, -1.503128, -2.110357, 1, 0.9843137, 0, 1,
-1.016085, -0.9285223, -1.611923, 1, 0.9882353, 0, 1,
-1.013592, 0.5471079, -1.480774, 1, 0.9960784, 0, 1,
-1.005065, 0.8112504, 0.1733652, 0.9960784, 1, 0, 1,
-0.9991391, -0.9185303, -2.603568, 0.9921569, 1, 0, 1,
-0.9968768, -0.3827524, -3.386201, 0.9843137, 1, 0, 1,
-0.9951705, 2.594108, 0.5394283, 0.9803922, 1, 0, 1,
-0.9709975, 1.159857, -1.476341, 0.972549, 1, 0, 1,
-0.9697273, 2.704141, 1.24918, 0.9686275, 1, 0, 1,
-0.9689763, -0.6723996, -2.313534, 0.9607843, 1, 0, 1,
-0.9643166, -0.1179811, -1.388154, 0.9568627, 1, 0, 1,
-0.9622388, 0.8245987, -2.263512, 0.9490196, 1, 0, 1,
-0.9562585, 0.2245119, -1.930922, 0.945098, 1, 0, 1,
-0.9493835, 0.8049972, -0.7982842, 0.9372549, 1, 0, 1,
-0.9438254, 0.2369473, -2.076036, 0.9333333, 1, 0, 1,
-0.9416819, -0.4947124, -2.086995, 0.9254902, 1, 0, 1,
-0.9395205, 1.410133, -1.732962, 0.9215686, 1, 0, 1,
-0.936481, -1.491724, -3.228017, 0.9137255, 1, 0, 1,
-0.9363526, 0.004006862, -2.299716, 0.9098039, 1, 0, 1,
-0.9308625, 2.137405, -1.919176, 0.9019608, 1, 0, 1,
-0.9234493, 1.769326, -1.58302, 0.8941177, 1, 0, 1,
-0.9227914, -0.9885281, -2.67214, 0.8901961, 1, 0, 1,
-0.9226345, 1.229691, -0.3694267, 0.8823529, 1, 0, 1,
-0.9222236, -0.6494118, -4.209496, 0.8784314, 1, 0, 1,
-0.9221134, 0.2729866, -2.375827, 0.8705882, 1, 0, 1,
-0.9219727, -1.592532, 0.40782, 0.8666667, 1, 0, 1,
-0.9159371, -0.9424888, -2.146938, 0.8588235, 1, 0, 1,
-0.9136264, -2.081831, -2.369529, 0.854902, 1, 0, 1,
-0.9133301, 0.8483611, -0.5917375, 0.8470588, 1, 0, 1,
-0.9048416, -0.04868478, -2.326046, 0.8431373, 1, 0, 1,
-0.9001728, 0.5491127, 0.6244868, 0.8352941, 1, 0, 1,
-0.8934122, 1.002131, 0.5903517, 0.8313726, 1, 0, 1,
-0.8866467, -1.253135, -3.201396, 0.8235294, 1, 0, 1,
-0.8865567, -0.8472837, -3.619066, 0.8196079, 1, 0, 1,
-0.8849714, 0.7762552, 0.4175031, 0.8117647, 1, 0, 1,
-0.8845037, -0.4114386, -3.119958, 0.8078431, 1, 0, 1,
-0.8792242, -0.237774, -1.668885, 0.8, 1, 0, 1,
-0.8750505, 1.216798, -2.315296, 0.7921569, 1, 0, 1,
-0.8748716, -1.333025, -2.455411, 0.7882353, 1, 0, 1,
-0.8744428, 1.561609, -2.165063, 0.7803922, 1, 0, 1,
-0.8741881, 0.973964, -1.573366, 0.7764706, 1, 0, 1,
-0.8619401, -0.01701794, -0.4137813, 0.7686275, 1, 0, 1,
-0.8503643, -1.71854, -3.089975, 0.7647059, 1, 0, 1,
-0.8364865, 0.0983455, -2.877802, 0.7568628, 1, 0, 1,
-0.83178, 1.579956, -1.036616, 0.7529412, 1, 0, 1,
-0.8314916, -0.291066, -0.9697564, 0.7450981, 1, 0, 1,
-0.830981, 0.2996037, -0.02981775, 0.7411765, 1, 0, 1,
-0.8306676, 0.4200528, -1.646637, 0.7333333, 1, 0, 1,
-0.8290478, 1.531577, -0.7693198, 0.7294118, 1, 0, 1,
-0.8261451, 0.8515907, -0.6501063, 0.7215686, 1, 0, 1,
-0.8240826, 1.296318, -0.7135776, 0.7176471, 1, 0, 1,
-0.8198167, 1.022654, -1.732394, 0.7098039, 1, 0, 1,
-0.8095967, 0.2909789, -0.5416681, 0.7058824, 1, 0, 1,
-0.8073913, 0.06465087, -0.35121, 0.6980392, 1, 0, 1,
-0.8061925, 0.1235854, -2.021334, 0.6901961, 1, 0, 1,
-0.8044223, -0.6049412, -2.705088, 0.6862745, 1, 0, 1,
-0.8017731, -0.5246086, -1.946076, 0.6784314, 1, 0, 1,
-0.8009725, -1.487802, -3.666134, 0.6745098, 1, 0, 1,
-0.7960286, 3.343447, -1.246571, 0.6666667, 1, 0, 1,
-0.795282, 0.898167, -0.1420741, 0.6627451, 1, 0, 1,
-0.7940045, -0.7411972, -3.648935, 0.654902, 1, 0, 1,
-0.7911764, -0.9119326, -3.563383, 0.6509804, 1, 0, 1,
-0.7901114, -0.232512, -4.324814, 0.6431373, 1, 0, 1,
-0.7878864, 1.907716, 0.3962022, 0.6392157, 1, 0, 1,
-0.7819364, 0.4951681, -1.025615, 0.6313726, 1, 0, 1,
-0.7763273, -0.2734238, -2.501546, 0.627451, 1, 0, 1,
-0.7737749, 0.2547051, -0.4010104, 0.6196079, 1, 0, 1,
-0.7731347, 0.9583362, 0.4693144, 0.6156863, 1, 0, 1,
-0.7666225, 1.689669, -1.727301, 0.6078432, 1, 0, 1,
-0.7650492, -0.2920466, -2.213941, 0.6039216, 1, 0, 1,
-0.7647555, 2.311225, -0.08091626, 0.5960785, 1, 0, 1,
-0.7642775, 0.6444771, -1.034246, 0.5882353, 1, 0, 1,
-0.7641103, 0.2724867, -0.6054474, 0.5843138, 1, 0, 1,
-0.7617575, -0.4971623, -3.919927, 0.5764706, 1, 0, 1,
-0.7569193, 0.001065687, -1.973402, 0.572549, 1, 0, 1,
-0.7568759, 0.8388736, -0.5793025, 0.5647059, 1, 0, 1,
-0.7519764, 0.2639948, -0.9572833, 0.5607843, 1, 0, 1,
-0.7467214, -0.4610654, -1.581618, 0.5529412, 1, 0, 1,
-0.7430045, -0.9482003, -2.874609, 0.5490196, 1, 0, 1,
-0.7389355, -0.7842087, -1.362571, 0.5411765, 1, 0, 1,
-0.7381586, -1.039096, -3.922783, 0.5372549, 1, 0, 1,
-0.7376095, 1.063996, -0.02301794, 0.5294118, 1, 0, 1,
-0.7334624, -0.1631476, -1.98247, 0.5254902, 1, 0, 1,
-0.7326138, -1.525435, -3.706658, 0.5176471, 1, 0, 1,
-0.7324618, -1.697017, -1.587112, 0.5137255, 1, 0, 1,
-0.7216851, -0.07693402, -0.5505542, 0.5058824, 1, 0, 1,
-0.7176512, -0.5037667, -0.6250483, 0.5019608, 1, 0, 1,
-0.7148433, -0.0591263, -0.4228864, 0.4941176, 1, 0, 1,
-0.7070636, 0.005854631, -0.4297225, 0.4862745, 1, 0, 1,
-0.7057885, 1.201776, -0.3442986, 0.4823529, 1, 0, 1,
-0.7052476, 0.136158, -1.642293, 0.4745098, 1, 0, 1,
-0.7023933, 1.200692, -1.193223, 0.4705882, 1, 0, 1,
-0.6998689, 1.088962, -1.178812, 0.4627451, 1, 0, 1,
-0.6951219, 0.6115316, 0.9083865, 0.4588235, 1, 0, 1,
-0.6926856, 0.204328, -2.475875, 0.4509804, 1, 0, 1,
-0.6759196, 0.9894564, 0.8483384, 0.4470588, 1, 0, 1,
-0.6745517, 0.22101, -0.3693213, 0.4392157, 1, 0, 1,
-0.6723498, -0.2023738, -1.012759, 0.4352941, 1, 0, 1,
-0.6653765, 0.7026001, -0.8671157, 0.427451, 1, 0, 1,
-0.6633703, 0.3681146, -2.318703, 0.4235294, 1, 0, 1,
-0.6573426, -0.1336239, -3.400621, 0.4156863, 1, 0, 1,
-0.6528104, 1.57156, -0.946296, 0.4117647, 1, 0, 1,
-0.6505679, -1.29283, -3.024929, 0.4039216, 1, 0, 1,
-0.6496592, -0.30676, -1.362408, 0.3960784, 1, 0, 1,
-0.6403962, -0.3000458, -1.507613, 0.3921569, 1, 0, 1,
-0.6389754, 0.1532838, -1.417281, 0.3843137, 1, 0, 1,
-0.6371017, 2.45909, 0.2760517, 0.3803922, 1, 0, 1,
-0.6355079, -2.620682, -1.986918, 0.372549, 1, 0, 1,
-0.6332199, 0.2246586, 0.2117153, 0.3686275, 1, 0, 1,
-0.6325113, 0.152097, 0.01753684, 0.3607843, 1, 0, 1,
-0.6273771, -1.768669, -1.903938, 0.3568628, 1, 0, 1,
-0.6271453, -1.868897, -1.599562, 0.3490196, 1, 0, 1,
-0.6226293, -0.7928563, -2.18818, 0.345098, 1, 0, 1,
-0.617507, -0.5300758, -1.839511, 0.3372549, 1, 0, 1,
-0.6169101, 1.255033, -0.6447774, 0.3333333, 1, 0, 1,
-0.6159624, -0.7395435, -2.80025, 0.3254902, 1, 0, 1,
-0.612606, -0.5031673, -3.761262, 0.3215686, 1, 0, 1,
-0.6115975, -0.2341383, -3.164721, 0.3137255, 1, 0, 1,
-0.6115474, -2.417761, -2.968211, 0.3098039, 1, 0, 1,
-0.60681, 0.716089, -0.3503154, 0.3019608, 1, 0, 1,
-0.6060346, -1.760696, -1.463574, 0.2941177, 1, 0, 1,
-0.6006224, 0.1301332, -2.258045, 0.2901961, 1, 0, 1,
-0.5945867, 0.5085722, -0.3621075, 0.282353, 1, 0, 1,
-0.5739136, 0.6661388, 0.4935333, 0.2784314, 1, 0, 1,
-0.5709467, 1.207077, -2.0267, 0.2705882, 1, 0, 1,
-0.5701738, 0.2004681, -0.3789129, 0.2666667, 1, 0, 1,
-0.5692756, 0.2063672, -1.475502, 0.2588235, 1, 0, 1,
-0.5684198, -0.01904835, -1.227235, 0.254902, 1, 0, 1,
-0.5665711, -0.2633801, -2.447822, 0.2470588, 1, 0, 1,
-0.5647185, -2.019869, -1.917192, 0.2431373, 1, 0, 1,
-0.5641575, 1.34823, 0.1388829, 0.2352941, 1, 0, 1,
-0.563816, 1.490994, -0.1987037, 0.2313726, 1, 0, 1,
-0.5604644, 0.6715996, -0.7679254, 0.2235294, 1, 0, 1,
-0.5600155, 0.2053224, 0.1025561, 0.2196078, 1, 0, 1,
-0.5574415, 0.07224123, -0.9749444, 0.2117647, 1, 0, 1,
-0.5539977, -0.4153888, -3.133848, 0.2078431, 1, 0, 1,
-0.5539336, -1.518275, -1.554151, 0.2, 1, 0, 1,
-0.5486017, 1.152164, -0.1323418, 0.1921569, 1, 0, 1,
-0.5472497, 1.548476, 0.8558812, 0.1882353, 1, 0, 1,
-0.5440551, 1.225376, 0.1379455, 0.1803922, 1, 0, 1,
-0.5436941, 0.6337338, 0.668699, 0.1764706, 1, 0, 1,
-0.5399729, 1.08222, -1.158664, 0.1686275, 1, 0, 1,
-0.5389872, -0.8719227, -0.6004516, 0.1647059, 1, 0, 1,
-0.5356122, 0.2605932, -0.2784449, 0.1568628, 1, 0, 1,
-0.5338918, 0.876915, -0.8198447, 0.1529412, 1, 0, 1,
-0.5294426, -1.775386, -2.492652, 0.145098, 1, 0, 1,
-0.5254473, -0.957117, -1.762304, 0.1411765, 1, 0, 1,
-0.5185602, -0.6014038, -2.352176, 0.1333333, 1, 0, 1,
-0.5151815, -0.07454459, -2.68781, 0.1294118, 1, 0, 1,
-0.5124664, -2.055195, -3.889536, 0.1215686, 1, 0, 1,
-0.5111689, 0.02692329, -0.6059329, 0.1176471, 1, 0, 1,
-0.5071931, -1.633144, -3.036386, 0.1098039, 1, 0, 1,
-0.50424, -2.203533, -2.350026, 0.1058824, 1, 0, 1,
-0.5038178, 0.0968265, -0.5859159, 0.09803922, 1, 0, 1,
-0.4984747, 0.7843117, -0.03359577, 0.09019608, 1, 0, 1,
-0.4975829, -0.06956866, -0.7490777, 0.08627451, 1, 0, 1,
-0.4956421, 0.5548592, -0.292919, 0.07843138, 1, 0, 1,
-0.4938578, 0.02288919, -2.13549, 0.07450981, 1, 0, 1,
-0.4898311, 0.8537817, -1.321555, 0.06666667, 1, 0, 1,
-0.4865114, 0.5406338, 0.8261886, 0.0627451, 1, 0, 1,
-0.4829746, -0.3139433, -2.757352, 0.05490196, 1, 0, 1,
-0.4757627, -0.5074662, -3.07049, 0.05098039, 1, 0, 1,
-0.4722248, -0.5267873, -1.367034, 0.04313726, 1, 0, 1,
-0.4720327, 0.6636989, -0.07007327, 0.03921569, 1, 0, 1,
-0.4714343, 0.05131086, -2.603012, 0.03137255, 1, 0, 1,
-0.462389, -1.458799, -1.252894, 0.02745098, 1, 0, 1,
-0.4589065, 1.307821, -0.3508413, 0.01960784, 1, 0, 1,
-0.4534616, 2.473036, -0.8734584, 0.01568628, 1, 0, 1,
-0.451634, -0.6879135, -3.258503, 0.007843138, 1, 0, 1,
-0.4507734, 0.7082537, 1.683254, 0.003921569, 1, 0, 1,
-0.4489387, 1.005113, -0.07252438, 0, 1, 0.003921569, 1,
-0.4464108, 1.395505, 1.026886, 0, 1, 0.01176471, 1,
-0.4435745, 0.169439, -1.120461, 0, 1, 0.01568628, 1,
-0.442124, 0.6606277, -0.8993203, 0, 1, 0.02352941, 1,
-0.4382953, 0.1708602, -1.41982, 0, 1, 0.02745098, 1,
-0.4379471, -0.111947, -2.569377, 0, 1, 0.03529412, 1,
-0.4371106, 0.1731984, -0.1251087, 0, 1, 0.03921569, 1,
-0.4350798, -0.7796815, -1.596841, 0, 1, 0.04705882, 1,
-0.4332466, -0.01587165, -1.438734, 0, 1, 0.05098039, 1,
-0.429706, -0.3069752, -2.962994, 0, 1, 0.05882353, 1,
-0.4277578, -0.0428215, -0.4909731, 0, 1, 0.0627451, 1,
-0.4257758, -0.5697812, -3.434132, 0, 1, 0.07058824, 1,
-0.425577, 0.4862884, -0.5074546, 0, 1, 0.07450981, 1,
-0.4229682, 0.3602947, -0.06824555, 0, 1, 0.08235294, 1,
-0.4219618, -0.5596904, -2.060211, 0, 1, 0.08627451, 1,
-0.4181727, 1.546533, 0.4810601, 0, 1, 0.09411765, 1,
-0.4164025, -0.09949209, -2.022374, 0, 1, 0.1019608, 1,
-0.4128938, 0.3511954, 0.009693455, 0, 1, 0.1058824, 1,
-0.4107946, -0.7713803, -3.741238, 0, 1, 0.1137255, 1,
-0.4087149, -0.7170074, -0.763797, 0, 1, 0.1176471, 1,
-0.4053169, 0.8861541, -0.5518851, 0, 1, 0.1254902, 1,
-0.4003873, -0.773635, -2.580372, 0, 1, 0.1294118, 1,
-0.400328, -0.09299563, -1.429904, 0, 1, 0.1372549, 1,
-0.394206, -0.1846373, -1.111974, 0, 1, 0.1411765, 1,
-0.3939052, -0.5036713, -2.584564, 0, 1, 0.1490196, 1,
-0.393894, 1.043059, 0.7956755, 0, 1, 0.1529412, 1,
-0.3909404, -0.02834648, -1.170039, 0, 1, 0.1607843, 1,
-0.3900506, -0.3290216, -0.8479523, 0, 1, 0.1647059, 1,
-0.3893649, 0.3850335, 0.5623891, 0, 1, 0.172549, 1,
-0.3859962, -0.5966231, -1.735288, 0, 1, 0.1764706, 1,
-0.3847989, 0.7523072, -2.188414, 0, 1, 0.1843137, 1,
-0.3839481, 0.04451808, -1.195272, 0, 1, 0.1882353, 1,
-0.3839323, 1.359969, -0.4688669, 0, 1, 0.1960784, 1,
-0.3806696, 0.419929, -0.7342451, 0, 1, 0.2039216, 1,
-0.3775321, 0.6877093, 2.143314, 0, 1, 0.2078431, 1,
-0.3738486, -0.2454882, -3.518377, 0, 1, 0.2156863, 1,
-0.3704272, 0.7513211, -0.9724648, 0, 1, 0.2196078, 1,
-0.3699289, 0.8189693, -1.023736, 0, 1, 0.227451, 1,
-0.364849, -0.9005221, -3.518314, 0, 1, 0.2313726, 1,
-0.3593864, 0.4823743, -1.458933, 0, 1, 0.2392157, 1,
-0.356465, 0.207032, -2.230432, 0, 1, 0.2431373, 1,
-0.3550781, 0.1522658, -1.104418, 0, 1, 0.2509804, 1,
-0.3549123, -1.461125, -4.423386, 0, 1, 0.254902, 1,
-0.3540365, 0.3783286, -1.392248, 0, 1, 0.2627451, 1,
-0.3528285, -0.8470071, -2.31082, 0, 1, 0.2666667, 1,
-0.3514918, -0.06386132, -2.432375, 0, 1, 0.2745098, 1,
-0.3453191, 0.1098765, -1.227039, 0, 1, 0.2784314, 1,
-0.3416475, -0.948201, -2.169041, 0, 1, 0.2862745, 1,
-0.3415054, -0.4637553, -3.2717, 0, 1, 0.2901961, 1,
-0.3406854, 1.8293, 0.6975196, 0, 1, 0.2980392, 1,
-0.3295047, 1.211194, -0.04677066, 0, 1, 0.3058824, 1,
-0.3284037, 0.1253655, -1.639924, 0, 1, 0.3098039, 1,
-0.3281108, 0.7988489, -0.7318988, 0, 1, 0.3176471, 1,
-0.3233635, 0.3187324, -0.4365087, 0, 1, 0.3215686, 1,
-0.323095, -1.481135, -3.320548, 0, 1, 0.3294118, 1,
-0.3188379, -0.5559596, -3.060926, 0, 1, 0.3333333, 1,
-0.3188378, -1.57351, -2.931944, 0, 1, 0.3411765, 1,
-0.3176944, -0.1094984, -2.465199, 0, 1, 0.345098, 1,
-0.3172318, 2.213634, 0.2749062, 0, 1, 0.3529412, 1,
-0.3142592, -1.187822, -3.065953, 0, 1, 0.3568628, 1,
-0.3137787, 0.2345424, 0.1648938, 0, 1, 0.3647059, 1,
-0.3064219, 0.898546, 0.7664659, 0, 1, 0.3686275, 1,
-0.3030177, -0.6922008, -3.671454, 0, 1, 0.3764706, 1,
-0.3020843, 0.5426991, 0.4799303, 0, 1, 0.3803922, 1,
-0.2954744, -1.421282, -2.812035, 0, 1, 0.3882353, 1,
-0.2953519, -1.510814, -5.510449, 0, 1, 0.3921569, 1,
-0.287938, -0.5913258, -3.166966, 0, 1, 0.4, 1,
-0.2800796, -0.1295268, -1.473749, 0, 1, 0.4078431, 1,
-0.2791471, -0.007065549, -2.681528, 0, 1, 0.4117647, 1,
-0.2742704, 0.1958158, -2.461967, 0, 1, 0.4196078, 1,
-0.2734444, 2.299948, 1.971941, 0, 1, 0.4235294, 1,
-0.269307, -0.941542, -3.050301, 0, 1, 0.4313726, 1,
-0.2656587, 0.6729892, -2.688051, 0, 1, 0.4352941, 1,
-0.262798, 0.05284261, -1.205022, 0, 1, 0.4431373, 1,
-0.2626446, 1.093241, -1.001345, 0, 1, 0.4470588, 1,
-0.2622627, -0.8828833, -2.465856, 0, 1, 0.454902, 1,
-0.2620985, -1.100558, -3.793359, 0, 1, 0.4588235, 1,
-0.2505824, -0.04433579, -1.837431, 0, 1, 0.4666667, 1,
-0.2480213, 0.8350923, 3.494378, 0, 1, 0.4705882, 1,
-0.2441128, 0.05429339, -0.3835333, 0, 1, 0.4784314, 1,
-0.2428528, 0.5893656, 1.408608, 0, 1, 0.4823529, 1,
-0.2423743, 0.6170682, -0.4590865, 0, 1, 0.4901961, 1,
-0.2414587, 0.8831341, -2.309174, 0, 1, 0.4941176, 1,
-0.2401569, 0.4089344, 0.1349052, 0, 1, 0.5019608, 1,
-0.2373357, -0.3202746, -1.304705, 0, 1, 0.509804, 1,
-0.2329544, -1.272808, -2.959342, 0, 1, 0.5137255, 1,
-0.2298339, 1.011221, 0.1928031, 0, 1, 0.5215687, 1,
-0.2284475, 0.7085269, -2.438189, 0, 1, 0.5254902, 1,
-0.2212872, -0.4615781, -1.165804, 0, 1, 0.5333334, 1,
-0.2157508, 0.6938611, -0.01330826, 0, 1, 0.5372549, 1,
-0.2100513, -0.5664851, -2.481374, 0, 1, 0.5450981, 1,
-0.2089595, -1.176643, -3.568208, 0, 1, 0.5490196, 1,
-0.204483, 2.62229, -0.2983617, 0, 1, 0.5568628, 1,
-0.2040231, -0.912089, -3.766959, 0, 1, 0.5607843, 1,
-0.2029285, -0.8009605, -3.63938, 0, 1, 0.5686275, 1,
-0.2012459, 1.076671, -0.2256051, 0, 1, 0.572549, 1,
-0.1993006, 1.699018, 1.182068, 0, 1, 0.5803922, 1,
-0.1948989, -2.162337, -3.333829, 0, 1, 0.5843138, 1,
-0.1948571, 0.2500955, -1.437135, 0, 1, 0.5921569, 1,
-0.1938545, -1.754568, -1.278924, 0, 1, 0.5960785, 1,
-0.1878145, 0.4963624, -0.9226572, 0, 1, 0.6039216, 1,
-0.1845803, -1.064894, -3.755243, 0, 1, 0.6117647, 1,
-0.1831333, 1.313912, 0.2267606, 0, 1, 0.6156863, 1,
-0.1814626, -0.8713784, -3.006673, 0, 1, 0.6235294, 1,
-0.178082, 0.5292784, 0.008721215, 0, 1, 0.627451, 1,
-0.1773077, 0.8782517, 1.541311, 0, 1, 0.6352941, 1,
-0.1770856, 0.9157411, -0.4750117, 0, 1, 0.6392157, 1,
-0.1767928, -1.143346, -4.203154, 0, 1, 0.6470588, 1,
-0.175306, -2.10396, -2.579344, 0, 1, 0.6509804, 1,
-0.1749556, -0.3568006, -1.510107, 0, 1, 0.6588235, 1,
-0.1748785, 0.8396758, 0.3744642, 0, 1, 0.6627451, 1,
-0.1706962, -1.126021, -1.341245, 0, 1, 0.6705883, 1,
-0.1701316, -0.4635685, -2.31906, 0, 1, 0.6745098, 1,
-0.1604789, 0.5595115, 0.6926181, 0, 1, 0.682353, 1,
-0.1584067, 0.4371752, -1.830956, 0, 1, 0.6862745, 1,
-0.1573185, -0.1686969, -3.06493, 0, 1, 0.6941177, 1,
-0.157088, 1.251107, 0.3737885, 0, 1, 0.7019608, 1,
-0.1558115, -0.515218, -3.45549, 0, 1, 0.7058824, 1,
-0.1543217, 0.8337403, -0.2611885, 0, 1, 0.7137255, 1,
-0.1536376, 1.184711, 0.2858298, 0, 1, 0.7176471, 1,
-0.1470632, -1.3557, -1.920732, 0, 1, 0.7254902, 1,
-0.1455278, -0.2666622, -2.253195, 0, 1, 0.7294118, 1,
-0.1446273, -1.103206, -4.170352, 0, 1, 0.7372549, 1,
-0.1438944, -1.210546, -2.098212, 0, 1, 0.7411765, 1,
-0.1430257, -0.9526529, -2.98155, 0, 1, 0.7490196, 1,
-0.1422392, -0.3285754, -2.081211, 0, 1, 0.7529412, 1,
-0.1386198, 0.3500837, -1.241787, 0, 1, 0.7607843, 1,
-0.1371181, -0.2697625, -4.273654, 0, 1, 0.7647059, 1,
-0.1332376, -0.192979, -1.08611, 0, 1, 0.772549, 1,
-0.1306892, -0.7543554, -2.592887, 0, 1, 0.7764706, 1,
-0.1301758, 0.4847158, -0.4434133, 0, 1, 0.7843137, 1,
-0.1299381, 1.081642, 0.675628, 0, 1, 0.7882353, 1,
-0.1232424, 0.1891333, -0.8171135, 0, 1, 0.7960784, 1,
-0.1230832, -0.4640043, -1.946514, 0, 1, 0.8039216, 1,
-0.1208992, 0.3293774, 0.5011352, 0, 1, 0.8078431, 1,
-0.1158089, 2.159933, -1.282932, 0, 1, 0.8156863, 1,
-0.1095478, -1.102381, -4.154572, 0, 1, 0.8196079, 1,
-0.1049346, -0.09858003, -2.518804, 0, 1, 0.827451, 1,
-0.1024775, 0.07007831, 0.3280474, 0, 1, 0.8313726, 1,
-0.101566, -1.126641, -1.368949, 0, 1, 0.8392157, 1,
-0.1001036, -1.623099, -1.321, 0, 1, 0.8431373, 1,
-0.09474377, -0.9420243, -2.109727, 0, 1, 0.8509804, 1,
-0.09172853, 0.3316548, -0.09335489, 0, 1, 0.854902, 1,
-0.08828765, 0.9002228, 1.480264, 0, 1, 0.8627451, 1,
-0.08789029, -0.3375638, -2.817172, 0, 1, 0.8666667, 1,
-0.08483342, 0.6303473, -0.4490612, 0, 1, 0.8745098, 1,
-0.08085895, -0.7076734, -1.873217, 0, 1, 0.8784314, 1,
-0.07711285, -1.01601, -5.796887, 0, 1, 0.8862745, 1,
-0.07553508, 0.7428314, 0.1633457, 0, 1, 0.8901961, 1,
-0.07502671, 0.01664836, -0.8677776, 0, 1, 0.8980392, 1,
-0.06562661, -0.3717042, -0.9863653, 0, 1, 0.9058824, 1,
-0.06313884, 0.9276231, -0.6503698, 0, 1, 0.9098039, 1,
-0.06307071, 0.6824259, -1.677503, 0, 1, 0.9176471, 1,
-0.0626903, -0.8020414, -3.656544, 0, 1, 0.9215686, 1,
-0.05777935, 0.4511774, -0.09782194, 0, 1, 0.9294118, 1,
-0.05752973, 0.7906051, 0.691583, 0, 1, 0.9333333, 1,
-0.05564492, 1.359087, -1.02861, 0, 1, 0.9411765, 1,
-0.05359603, -0.24336, -2.863845, 0, 1, 0.945098, 1,
-0.041382, 0.5901486, 0.1600481, 0, 1, 0.9529412, 1,
-0.03862497, 1.181313, 0.5629164, 0, 1, 0.9568627, 1,
-0.03598333, -0.6201792, -3.116235, 0, 1, 0.9647059, 1,
-0.03516521, 0.8025085, 0.08041574, 0, 1, 0.9686275, 1,
-0.02966362, -1.346297, -3.946982, 0, 1, 0.9764706, 1,
-0.02634736, -0.6616545, -0.7393914, 0, 1, 0.9803922, 1,
-0.02598294, 1.284117, 1.457406, 0, 1, 0.9882353, 1,
-0.0259216, -0.8714156, -3.406988, 0, 1, 0.9921569, 1,
-0.02551302, -0.2687621, -1.982394, 0, 1, 1, 1,
-0.02347326, -2.414793, -2.345515, 0, 0.9921569, 1, 1,
-0.0177975, 0.2060001, 0.9733363, 0, 0.9882353, 1, 1,
-0.01491372, -1.11392, -4.031669, 0, 0.9803922, 1, 1,
-0.01152868, -1.019786, -3.774271, 0, 0.9764706, 1, 1,
-0.01087946, 1.643238, -0.6161399, 0, 0.9686275, 1, 1,
-0.010604, 0.4451691, 0.2932596, 0, 0.9647059, 1, 1,
-0.009992254, 0.1274045, -0.06650761, 0, 0.9568627, 1, 1,
-0.001725229, 0.05597941, -0.2912477, 0, 0.9529412, 1, 1,
-0.001015049, -0.2419183, -2.908445, 0, 0.945098, 1, 1,
0.004915533, 2.232876, 0.4719461, 0, 0.9411765, 1, 1,
0.005795176, 0.3915835, 0.4456011, 0, 0.9333333, 1, 1,
0.009987213, -0.3685328, 2.628305, 0, 0.9294118, 1, 1,
0.01071333, 0.2300868, 0.5070856, 0, 0.9215686, 1, 1,
0.01886027, -0.1171549, 2.163637, 0, 0.9176471, 1, 1,
0.02018264, -0.568756, 4.095325, 0, 0.9098039, 1, 1,
0.02326366, -0.1499409, 2.882647, 0, 0.9058824, 1, 1,
0.02472047, -1.306221, 2.26645, 0, 0.8980392, 1, 1,
0.02821148, -0.6614619, 4.324169, 0, 0.8901961, 1, 1,
0.03047226, 0.09630292, 1.085625, 0, 0.8862745, 1, 1,
0.0313766, 0.01112338, 0.05456295, 0, 0.8784314, 1, 1,
0.03314407, -0.1931561, 1.504554, 0, 0.8745098, 1, 1,
0.03338917, 0.921102, 1.199608, 0, 0.8666667, 1, 1,
0.03761845, 3.303673, -0.6049554, 0, 0.8627451, 1, 1,
0.03954476, 1.496044, 2.153533, 0, 0.854902, 1, 1,
0.03990388, -1.183247, 3.359859, 0, 0.8509804, 1, 1,
0.04077144, 0.688764, -0.4262517, 0, 0.8431373, 1, 1,
0.04412524, -0.2652723, 1.351448, 0, 0.8392157, 1, 1,
0.0503326, 0.1767345, 0.7424963, 0, 0.8313726, 1, 1,
0.05158375, -1.19635, 2.283039, 0, 0.827451, 1, 1,
0.05374118, 0.4768792, 0.4742657, 0, 0.8196079, 1, 1,
0.05745386, 0.7873327, -0.586069, 0, 0.8156863, 1, 1,
0.05789869, 1.518632, -0.5928708, 0, 0.8078431, 1, 1,
0.05847434, 0.03928011, 0.747942, 0, 0.8039216, 1, 1,
0.06409226, 0.8710398, -0.01362708, 0, 0.7960784, 1, 1,
0.07162851, 2.041525, -0.4081505, 0, 0.7882353, 1, 1,
0.07173488, 1.172034, -0.3259396, 0, 0.7843137, 1, 1,
0.07787652, -0.615117, 4.145802, 0, 0.7764706, 1, 1,
0.08036954, 0.1923655, 1.013822, 0, 0.772549, 1, 1,
0.08491895, 0.1147453, 1.105858, 0, 0.7647059, 1, 1,
0.09650884, 0.3951488, 0.04561277, 0, 0.7607843, 1, 1,
0.0972475, 0.3687088, -0.7338014, 0, 0.7529412, 1, 1,
0.09769353, -0.4011418, 1.899728, 0, 0.7490196, 1, 1,
0.09834851, 0.263056, 0.8388696, 0, 0.7411765, 1, 1,
0.09906501, -1.277617, 3.13876, 0, 0.7372549, 1, 1,
0.1044415, -0.4280948, 3.418548, 0, 0.7294118, 1, 1,
0.1091952, -0.953274, 1.139268, 0, 0.7254902, 1, 1,
0.1108082, -0.6717426, 1.797656, 0, 0.7176471, 1, 1,
0.111151, 1.285813, -0.003809279, 0, 0.7137255, 1, 1,
0.1142523, -0.8436688, 4.165308, 0, 0.7058824, 1, 1,
0.1183534, 0.7025045, -0.4043326, 0, 0.6980392, 1, 1,
0.1220461, 0.2715129, 0.3452026, 0, 0.6941177, 1, 1,
0.1284011, 0.7566639, 0.1257315, 0, 0.6862745, 1, 1,
0.12886, 0.1682852, 0.5092369, 0, 0.682353, 1, 1,
0.1295597, 0.5209998, 1.391755, 0, 0.6745098, 1, 1,
0.1297572, -0.4540003, 3.049712, 0, 0.6705883, 1, 1,
0.1346387, 0.2266294, 0.2002455, 0, 0.6627451, 1, 1,
0.1358397, -1.211738, 3.471738, 0, 0.6588235, 1, 1,
0.1383661, 0.491565, 2.811986, 0, 0.6509804, 1, 1,
0.1407, -1.768929, 3.252397, 0, 0.6470588, 1, 1,
0.1414468, 1.432597, -1.217602, 0, 0.6392157, 1, 1,
0.1418021, 0.5742847, -0.9464053, 0, 0.6352941, 1, 1,
0.1443158, 1.215995, 0.3691829, 0, 0.627451, 1, 1,
0.144893, -0.08149467, 2.223832, 0, 0.6235294, 1, 1,
0.1455731, 0.7160053, 0.4064577, 0, 0.6156863, 1, 1,
0.1459135, 0.5892242, -1.314548, 0, 0.6117647, 1, 1,
0.1459647, -0.7287967, 2.491359, 0, 0.6039216, 1, 1,
0.1479897, 0.1499521, 1.415022, 0, 0.5960785, 1, 1,
0.1506403, -0.8366156, 4.634063, 0, 0.5921569, 1, 1,
0.1527305, -0.3874427, 3.120265, 0, 0.5843138, 1, 1,
0.1529059, -0.04541278, 0.4914134, 0, 0.5803922, 1, 1,
0.1532373, 1.6936, -0.3287784, 0, 0.572549, 1, 1,
0.1538433, -1.780206, 2.559875, 0, 0.5686275, 1, 1,
0.156324, -0.01176778, 2.721833, 0, 0.5607843, 1, 1,
0.1567188, -0.3737719, 3.268312, 0, 0.5568628, 1, 1,
0.1571309, 1.540446, -1.770233, 0, 0.5490196, 1, 1,
0.157987, 0.2269625, 2.05379, 0, 0.5450981, 1, 1,
0.1610512, -0.8304978, 1.898775, 0, 0.5372549, 1, 1,
0.1632478, -0.06813166, 0.8386321, 0, 0.5333334, 1, 1,
0.1678977, -0.8699284, 2.567446, 0, 0.5254902, 1, 1,
0.1685774, -0.4098471, 3.021827, 0, 0.5215687, 1, 1,
0.1730896, 0.01676271, 0.8869663, 0, 0.5137255, 1, 1,
0.1752722, -0.990675, 4.377245, 0, 0.509804, 1, 1,
0.1764947, 1.088753, 0.8840334, 0, 0.5019608, 1, 1,
0.186612, -1.534596, 2.807068, 0, 0.4941176, 1, 1,
0.1878824, 0.1204776, 0.9147921, 0, 0.4901961, 1, 1,
0.1903444, 0.2679326, 1.183142, 0, 0.4823529, 1, 1,
0.1919838, 1.936195, 0.6613734, 0, 0.4784314, 1, 1,
0.1925868, 2.090401, 0.5489331, 0, 0.4705882, 1, 1,
0.1927058, -2.063409, 3.463832, 0, 0.4666667, 1, 1,
0.1976235, 2.304939, 0.1276133, 0, 0.4588235, 1, 1,
0.2026135, 0.8511046, -1.16067, 0, 0.454902, 1, 1,
0.2031117, -0.7236402, 2.052516, 0, 0.4470588, 1, 1,
0.2041988, 0.1651097, 0.4451936, 0, 0.4431373, 1, 1,
0.205165, -0.5933976, 2.096268, 0, 0.4352941, 1, 1,
0.210775, -0.5669467, 2.770804, 0, 0.4313726, 1, 1,
0.2147583, -0.04946138, 2.486795, 0, 0.4235294, 1, 1,
0.2184687, 1.709266, -1.765037, 0, 0.4196078, 1, 1,
0.2221658, -0.8692618, 2.583007, 0, 0.4117647, 1, 1,
0.2233266, 1.752332, -0.2870595, 0, 0.4078431, 1, 1,
0.2249229, -0.4012394, 3.172892, 0, 0.4, 1, 1,
0.22664, 0.9513192, 0.8221666, 0, 0.3921569, 1, 1,
0.2275497, 0.2226766, 2.813681, 0, 0.3882353, 1, 1,
0.2299344, -0.5430218, 3.401958, 0, 0.3803922, 1, 1,
0.2327995, -0.2148324, 2.058681, 0, 0.3764706, 1, 1,
0.2331599, -0.3227112, 3.151084, 0, 0.3686275, 1, 1,
0.2333944, 1.706623, 1.557102, 0, 0.3647059, 1, 1,
0.2359108, 0.6837076, 0.3443736, 0, 0.3568628, 1, 1,
0.2372498, -0.1093934, -1.37931, 0, 0.3529412, 1, 1,
0.2372833, -0.6630275, 2.321286, 0, 0.345098, 1, 1,
0.2376019, 0.1132237, 2.65094, 0, 0.3411765, 1, 1,
0.2379704, 0.4318894, 1.528899, 0, 0.3333333, 1, 1,
0.2406353, -2.31481, 2.913386, 0, 0.3294118, 1, 1,
0.2427814, -0.4038531, 1.589273, 0, 0.3215686, 1, 1,
0.2452472, 0.8274145, -0.3132418, 0, 0.3176471, 1, 1,
0.2471153, 0.735918, 0.6327595, 0, 0.3098039, 1, 1,
0.2522544, -0.4391984, 3.440021, 0, 0.3058824, 1, 1,
0.2663651, -0.9597538, 2.347742, 0, 0.2980392, 1, 1,
0.267812, -1.925295, 4.083378, 0, 0.2901961, 1, 1,
0.2721623, 0.9327716, 2.456441, 0, 0.2862745, 1, 1,
0.2731791, -0.5168269, 1.72576, 0, 0.2784314, 1, 1,
0.2737404, 1.177557, 0.4444904, 0, 0.2745098, 1, 1,
0.2765176, 1.072257, 0.1749589, 0, 0.2666667, 1, 1,
0.2766513, 0.9017133, 0.3588442, 0, 0.2627451, 1, 1,
0.2782761, -1.365067, 2.371378, 0, 0.254902, 1, 1,
0.2803602, 0.7947464, -1.781027, 0, 0.2509804, 1, 1,
0.2812946, 0.3865326, 0.08005312, 0, 0.2431373, 1, 1,
0.2951941, 0.9298198, 0.6693778, 0, 0.2392157, 1, 1,
0.301266, -1.403325, 3.81199, 0, 0.2313726, 1, 1,
0.3029208, 0.5293118, 0.1176553, 0, 0.227451, 1, 1,
0.3037845, -0.09241987, 0.5627348, 0, 0.2196078, 1, 1,
0.3038439, -0.658775, 2.184164, 0, 0.2156863, 1, 1,
0.3052294, 1.029824, 0.3863715, 0, 0.2078431, 1, 1,
0.3064033, 1.341302, 0.4810937, 0, 0.2039216, 1, 1,
0.3087082, -0.4764298, 3.045338, 0, 0.1960784, 1, 1,
0.3091022, 0.7304749, 0.3490901, 0, 0.1882353, 1, 1,
0.3122264, -1.628963, 3.051508, 0, 0.1843137, 1, 1,
0.3193664, 0.3360483, 1.900217, 0, 0.1764706, 1, 1,
0.3194417, -1.135543, 5.075217, 0, 0.172549, 1, 1,
0.32252, 0.7102385, 1.643801, 0, 0.1647059, 1, 1,
0.3274732, 1.475646, 0.4744287, 0, 0.1607843, 1, 1,
0.3302713, 1.133807, 2.260427, 0, 0.1529412, 1, 1,
0.3327726, -3.028429, 2.396406, 0, 0.1490196, 1, 1,
0.3331493, -2.077995, 2.653611, 0, 0.1411765, 1, 1,
0.3336424, -0.03321587, 2.796034, 0, 0.1372549, 1, 1,
0.3338793, 0.1745276, -0.07101955, 0, 0.1294118, 1, 1,
0.3365488, -0.6389155, 2.526797, 0, 0.1254902, 1, 1,
0.3401476, 0.5091015, -0.2597368, 0, 0.1176471, 1, 1,
0.3412677, -2.650004, 2.314357, 0, 0.1137255, 1, 1,
0.343421, 0.7609125, 0.6051257, 0, 0.1058824, 1, 1,
0.3470255, 0.8577091, 1.411391, 0, 0.09803922, 1, 1,
0.3478415, -0.9317123, 3.410035, 0, 0.09411765, 1, 1,
0.3506956, 0.5201252, 0.4090848, 0, 0.08627451, 1, 1,
0.3516604, -0.4889011, 2.35776, 0, 0.08235294, 1, 1,
0.3527371, 0.04997093, 0.6128397, 0, 0.07450981, 1, 1,
0.3528188, -0.3744571, 2.774604, 0, 0.07058824, 1, 1,
0.3531678, 0.116257, 0.6871045, 0, 0.0627451, 1, 1,
0.3537513, 1.148196, -0.5737609, 0, 0.05882353, 1, 1,
0.3717081, -0.4316484, 2.2792, 0, 0.05098039, 1, 1,
0.3767878, -1.538484, 2.017198, 0, 0.04705882, 1, 1,
0.3771068, 0.19934, -0.161926, 0, 0.03921569, 1, 1,
0.3794471, 0.1514417, 0.8969499, 0, 0.03529412, 1, 1,
0.3892663, 0.7301644, 1.190252, 0, 0.02745098, 1, 1,
0.3921036, 1.966415, 0.2857431, 0, 0.02352941, 1, 1,
0.392729, -1.961158, 4.276589, 0, 0.01568628, 1, 1,
0.3958444, -0.2601127, 1.424904, 0, 0.01176471, 1, 1,
0.4027651, -0.276731, 2.472742, 0, 0.003921569, 1, 1,
0.4114527, -0.2268012, 1.110865, 0.003921569, 0, 1, 1,
0.4169001, 0.1358865, 0.465997, 0.007843138, 0, 1, 1,
0.4185864, -0.8583003, 2.432479, 0.01568628, 0, 1, 1,
0.4192166, -0.9658215, 3.587536, 0.01960784, 0, 1, 1,
0.4197912, 0.5651513, -0.1273267, 0.02745098, 0, 1, 1,
0.4228397, -1.307053, 3.175336, 0.03137255, 0, 1, 1,
0.4228612, 0.8818033, 1.678129, 0.03921569, 0, 1, 1,
0.4237649, 0.7095203, 0.3555425, 0.04313726, 0, 1, 1,
0.4244782, 1.327262, -0.7987189, 0.05098039, 0, 1, 1,
0.426697, -0.1022075, 2.465886, 0.05490196, 0, 1, 1,
0.4273709, -1.042381, 2.549611, 0.0627451, 0, 1, 1,
0.4299976, -0.07965422, 1.794631, 0.06666667, 0, 1, 1,
0.4311769, -0.5091645, 2.24273, 0.07450981, 0, 1, 1,
0.4388448, -0.007319943, 0.9585379, 0.07843138, 0, 1, 1,
0.4390358, -2.106544, 3.968292, 0.08627451, 0, 1, 1,
0.4409746, -1.085271, 3.749424, 0.09019608, 0, 1, 1,
0.4486659, -0.760592, 2.175948, 0.09803922, 0, 1, 1,
0.4545937, -0.8029762, 1.782833, 0.1058824, 0, 1, 1,
0.4548568, 0.9575588, 0.5086382, 0.1098039, 0, 1, 1,
0.4634458, 1.688094, -0.5714995, 0.1176471, 0, 1, 1,
0.4708917, -1.259743, 2.970454, 0.1215686, 0, 1, 1,
0.473539, -0.390198, 2.228124, 0.1294118, 0, 1, 1,
0.4795068, 1.868949, -0.8263715, 0.1333333, 0, 1, 1,
0.4802986, 0.3712233, -1.165868, 0.1411765, 0, 1, 1,
0.4828183, 0.7358366, 0.8803242, 0.145098, 0, 1, 1,
0.4843207, -0.07950973, 1.329984, 0.1529412, 0, 1, 1,
0.4846824, 1.630057, -0.5651728, 0.1568628, 0, 1, 1,
0.4894476, -0.09639625, 3.420943, 0.1647059, 0, 1, 1,
0.5036812, -0.7608467, 2.982586, 0.1686275, 0, 1, 1,
0.5038636, 0.08694045, 1.179643, 0.1764706, 0, 1, 1,
0.5065392, -1.555443, 4.195816, 0.1803922, 0, 1, 1,
0.5073083, -0.4220238, 2.857473, 0.1882353, 0, 1, 1,
0.5074656, -0.5155054, 2.268245, 0.1921569, 0, 1, 1,
0.5081505, -1.123345, 3.458305, 0.2, 0, 1, 1,
0.5102636, 0.2629987, 1.627909, 0.2078431, 0, 1, 1,
0.5147341, 0.07541131, 0.439823, 0.2117647, 0, 1, 1,
0.5174198, 0.3168953, -0.2188827, 0.2196078, 0, 1, 1,
0.5176366, -1.56778, 3.951785, 0.2235294, 0, 1, 1,
0.5185836, 0.8400542, 0.9505115, 0.2313726, 0, 1, 1,
0.5186032, -0.5352336, 2.378724, 0.2352941, 0, 1, 1,
0.5243618, 0.7829072, 1.845984, 0.2431373, 0, 1, 1,
0.5323813, 1.259279, -0.7973588, 0.2470588, 0, 1, 1,
0.5336094, 1.4486, -0.6453715, 0.254902, 0, 1, 1,
0.5360128, 0.3658524, 0.4362119, 0.2588235, 0, 1, 1,
0.5382408, 0.5387128, 2.940686, 0.2666667, 0, 1, 1,
0.5390103, -1.24024, 2.462196, 0.2705882, 0, 1, 1,
0.5423684, 0.4668534, 0.34288, 0.2784314, 0, 1, 1,
0.5459639, -0.04009017, 0.8986465, 0.282353, 0, 1, 1,
0.5463649, -0.3779009, 3.32678, 0.2901961, 0, 1, 1,
0.5475219, 0.8168285, 0.06307536, 0.2941177, 0, 1, 1,
0.5503317, -0.3247311, 3.888767, 0.3019608, 0, 1, 1,
0.5510926, 0.755925, 1.765424, 0.3098039, 0, 1, 1,
0.5524648, 0.5837792, 1.117803, 0.3137255, 0, 1, 1,
0.5537521, -0.5133439, 2.882279, 0.3215686, 0, 1, 1,
0.5554819, -1.079589, 3.072042, 0.3254902, 0, 1, 1,
0.5564005, -0.8146497, 1.700409, 0.3333333, 0, 1, 1,
0.5601682, 0.5658706, 2.410955, 0.3372549, 0, 1, 1,
0.5680343, -0.7023171, 2.576131, 0.345098, 0, 1, 1,
0.5691747, -0.5444659, 4.76293, 0.3490196, 0, 1, 1,
0.5696969, -0.5759122, 1.140581, 0.3568628, 0, 1, 1,
0.5700204, 0.1601043, 2.150795, 0.3607843, 0, 1, 1,
0.5700313, 1.325169, 0.5712446, 0.3686275, 0, 1, 1,
0.571031, 0.5439883, 0.8658502, 0.372549, 0, 1, 1,
0.5826142, 1.254134, 1.698218, 0.3803922, 0, 1, 1,
0.5848424, 0.5851694, 3.279343, 0.3843137, 0, 1, 1,
0.5864092, 0.8892192, -1.150617, 0.3921569, 0, 1, 1,
0.5871359, 0.9529251, -0.8683857, 0.3960784, 0, 1, 1,
0.5969593, 0.673524, 0.8870437, 0.4039216, 0, 1, 1,
0.6005604, -0.2093102, 0.6682148, 0.4117647, 0, 1, 1,
0.6007102, 1.516842, -0.4108429, 0.4156863, 0, 1, 1,
0.6008075, -1.316702, 2.112026, 0.4235294, 0, 1, 1,
0.6014894, 0.6931816, -1.465252, 0.427451, 0, 1, 1,
0.6057674, 0.03483325, 2.709036, 0.4352941, 0, 1, 1,
0.609355, -0.8314751, 0.5153866, 0.4392157, 0, 1, 1,
0.6094136, -0.2370454, 2.060769, 0.4470588, 0, 1, 1,
0.6095636, -0.3714585, 1.3219, 0.4509804, 0, 1, 1,
0.6106191, 0.7281644, -0.2107228, 0.4588235, 0, 1, 1,
0.6113319, 0.3954162, 0.3207963, 0.4627451, 0, 1, 1,
0.6117672, -1.138521, 4.354772, 0.4705882, 0, 1, 1,
0.6117923, -0.7721654, 3.376144, 0.4745098, 0, 1, 1,
0.6183603, 0.8505779, 0.6612226, 0.4823529, 0, 1, 1,
0.6188556, -0.6126421, 3.492095, 0.4862745, 0, 1, 1,
0.6196905, -0.1897867, 1.093116, 0.4941176, 0, 1, 1,
0.6208805, 0.5014732, 1.752474, 0.5019608, 0, 1, 1,
0.6221741, 0.8210269, 0.9579666, 0.5058824, 0, 1, 1,
0.6262065, 1.053027, -0.2831424, 0.5137255, 0, 1, 1,
0.6293988, 0.06963329, 2.016531, 0.5176471, 0, 1, 1,
0.6312275, 0.9154766, -0.3885633, 0.5254902, 0, 1, 1,
0.6370332, -0.4582986, 2.919023, 0.5294118, 0, 1, 1,
0.6394379, -0.5280503, 4.987319, 0.5372549, 0, 1, 1,
0.6423931, -1.210336, 2.525437, 0.5411765, 0, 1, 1,
0.6434281, -0.1652621, 1.842887, 0.5490196, 0, 1, 1,
0.650032, 1.617161, 0.03966443, 0.5529412, 0, 1, 1,
0.6522875, -0.4903031, 1.816203, 0.5607843, 0, 1, 1,
0.6543427, -0.4826817, 2.827345, 0.5647059, 0, 1, 1,
0.6549935, -0.1290116, 1.481552, 0.572549, 0, 1, 1,
0.6618202, 0.6315824, 1.753397, 0.5764706, 0, 1, 1,
0.665097, 1.086398, 0.6088444, 0.5843138, 0, 1, 1,
0.6660396, -0.072216, 1.503509, 0.5882353, 0, 1, 1,
0.6676269, 0.1090071, 0.7611113, 0.5960785, 0, 1, 1,
0.6723573, -0.9918545, 4.739615, 0.6039216, 0, 1, 1,
0.6785883, -0.1463891, 2.506487, 0.6078432, 0, 1, 1,
0.6834849, -0.3641883, 0.8146967, 0.6156863, 0, 1, 1,
0.6858473, -0.4425828, 2.519693, 0.6196079, 0, 1, 1,
0.6896394, -1.623197, 1.243568, 0.627451, 0, 1, 1,
0.7066482, 0.4723287, -0.02231686, 0.6313726, 0, 1, 1,
0.7069169, -1.374037, 4.030839, 0.6392157, 0, 1, 1,
0.7081563, -0.3604013, 1.223674, 0.6431373, 0, 1, 1,
0.7089664, -1.580576, 3.450691, 0.6509804, 0, 1, 1,
0.7123624, -0.04643088, 2.343102, 0.654902, 0, 1, 1,
0.7181191, -1.908581, 1.097764, 0.6627451, 0, 1, 1,
0.7242795, 1.243879, -0.342863, 0.6666667, 0, 1, 1,
0.7315215, -1.915481, 1.427593, 0.6745098, 0, 1, 1,
0.7316055, -0.08989346, 1.197171, 0.6784314, 0, 1, 1,
0.7337279, -0.7310457, 2.947544, 0.6862745, 0, 1, 1,
0.736371, -0.1423863, 1.92492, 0.6901961, 0, 1, 1,
0.7383924, -0.7926573, 2.538296, 0.6980392, 0, 1, 1,
0.739669, -0.6027461, 3.470705, 0.7058824, 0, 1, 1,
0.7424298, 0.8630887, 1.384534, 0.7098039, 0, 1, 1,
0.7430423, 0.1866306, -0.09627832, 0.7176471, 0, 1, 1,
0.7482855, 1.035449, 2.793065, 0.7215686, 0, 1, 1,
0.7483558, 0.6373582, 1.358976, 0.7294118, 0, 1, 1,
0.7485514, -0.1637275, 1.751614, 0.7333333, 0, 1, 1,
0.7487453, -0.9036247, 2.033084, 0.7411765, 0, 1, 1,
0.7535399, 0.4758669, -1.494345, 0.7450981, 0, 1, 1,
0.7555963, 2.704423, 1.29703, 0.7529412, 0, 1, 1,
0.7573812, 0.5525194, -0.8047699, 0.7568628, 0, 1, 1,
0.7622287, -0.8475834, 3.22978, 0.7647059, 0, 1, 1,
0.7665284, 0.2604047, 1.258552, 0.7686275, 0, 1, 1,
0.7739531, 0.4132997, 2.438198, 0.7764706, 0, 1, 1,
0.7750359, 0.3115258, 1.24395, 0.7803922, 0, 1, 1,
0.7775258, -1.487336, 2.543449, 0.7882353, 0, 1, 1,
0.7863919, 2.85603, 1.694028, 0.7921569, 0, 1, 1,
0.7871355, 0.0008649638, 1.387874, 0.8, 0, 1, 1,
0.7924126, -1.602125, 3.711739, 0.8078431, 0, 1, 1,
0.7958544, 0.8955782, 0.306272, 0.8117647, 0, 1, 1,
0.7986902, 0.7264991, 0.3494514, 0.8196079, 0, 1, 1,
0.8059648, 0.2699925, 3.241594, 0.8235294, 0, 1, 1,
0.8060779, -0.3677123, 1.421965, 0.8313726, 0, 1, 1,
0.8066059, -1.169994, 2.00939, 0.8352941, 0, 1, 1,
0.8125851, 0.6342816, -1.744028, 0.8431373, 0, 1, 1,
0.8177989, -0.2364197, 1.632752, 0.8470588, 0, 1, 1,
0.819187, -1.106873, 3.528078, 0.854902, 0, 1, 1,
0.8239208, 1.623115, 1.110467, 0.8588235, 0, 1, 1,
0.8306248, 0.8130336, 0.9980648, 0.8666667, 0, 1, 1,
0.8317811, -1.065038, 2.266444, 0.8705882, 0, 1, 1,
0.8391211, 0.5111626, 2.831436, 0.8784314, 0, 1, 1,
0.8401843, 1.068683, 1.121194, 0.8823529, 0, 1, 1,
0.8403549, -0.8889918, 1.737543, 0.8901961, 0, 1, 1,
0.8415172, -0.2127461, 1.170586, 0.8941177, 0, 1, 1,
0.8434156, 0.1148402, 2.069432, 0.9019608, 0, 1, 1,
0.843669, 0.202379, 3.434537, 0.9098039, 0, 1, 1,
0.8516945, 0.4459935, 0.7739272, 0.9137255, 0, 1, 1,
0.8564743, 0.7511864, 2.95137, 0.9215686, 0, 1, 1,
0.8635929, -1.562778, 1.413007, 0.9254902, 0, 1, 1,
0.8645012, -0.3911311, 2.102779, 0.9333333, 0, 1, 1,
0.8667042, 0.6592695, 1.938977, 0.9372549, 0, 1, 1,
0.8686019, -1.235733, 1.165811, 0.945098, 0, 1, 1,
0.8716769, -0.1733406, 2.756077, 0.9490196, 0, 1, 1,
0.8729157, -0.2842706, 3.483441, 0.9568627, 0, 1, 1,
0.880482, -0.1700229, 1.06109, 0.9607843, 0, 1, 1,
0.8841521, -0.3222573, 2.973194, 0.9686275, 0, 1, 1,
0.8846691, -1.995407, 3.261317, 0.972549, 0, 1, 1,
0.8855874, -1.852938, 1.755054, 0.9803922, 0, 1, 1,
0.8952351, 0.7049288, 1.51979, 0.9843137, 0, 1, 1,
0.9116107, -0.321106, 1.381833, 0.9921569, 0, 1, 1,
0.9251732, -0.03882491, 0.07440459, 0.9960784, 0, 1, 1,
0.9257306, 0.3081723, 0.8816058, 1, 0, 0.9960784, 1,
0.9266593, 1.56353, 2.281561, 1, 0, 0.9882353, 1,
0.9295813, -0.1578876, 1.237971, 1, 0, 0.9843137, 1,
0.9309852, -0.5666949, 2.808958, 1, 0, 0.9764706, 1,
0.9329413, 1.439471, 1.068492, 1, 0, 0.972549, 1,
0.9341628, 0.0677231, 0.79373, 1, 0, 0.9647059, 1,
0.9349973, 1.093664, 0.09967875, 1, 0, 0.9607843, 1,
0.9502536, -0.0692327, 1.660426, 1, 0, 0.9529412, 1,
0.9600062, -0.5651082, 3.928857, 1, 0, 0.9490196, 1,
0.9607741, -0.6184837, 3.439073, 1, 0, 0.9411765, 1,
0.9622157, -0.3938317, -0.2595397, 1, 0, 0.9372549, 1,
0.9625465, 0.7387905, 1.792287, 1, 0, 0.9294118, 1,
0.9674781, 1.087388, 1.672316, 1, 0, 0.9254902, 1,
0.9688075, 0.5249138, 0.3325696, 1, 0, 0.9176471, 1,
0.9782402, -0.8360979, 2.818295, 1, 0, 0.9137255, 1,
0.9782515, 0.8347721, 0.291906, 1, 0, 0.9058824, 1,
0.9830928, 0.3372732, 1.546309, 1, 0, 0.9019608, 1,
0.9889426, -1.434939, 3.674994, 1, 0, 0.8941177, 1,
0.9913464, 0.9772807, -0.590823, 1, 0, 0.8862745, 1,
0.9916278, 1.021568, 0.7005825, 1, 0, 0.8823529, 1,
1.000985, 0.2335944, 2.953538, 1, 0, 0.8745098, 1,
1.001392, -0.946693, 2.655289, 1, 0, 0.8705882, 1,
1.005363, -0.8167955, 2.845079, 1, 0, 0.8627451, 1,
1.006922, -1.76422, 2.572078, 1, 0, 0.8588235, 1,
1.007306, 1.041714, -0.1776933, 1, 0, 0.8509804, 1,
1.007662, -0.9061278, 3.128253, 1, 0, 0.8470588, 1,
1.010168, 0.1299068, 2.935308, 1, 0, 0.8392157, 1,
1.015179, 1.60009, 1.232127, 1, 0, 0.8352941, 1,
1.015534, -0.1527553, 2.699781, 1, 0, 0.827451, 1,
1.015627, 0.09152362, 1.653738, 1, 0, 0.8235294, 1,
1.033345, 0.7525465, 1.323354, 1, 0, 0.8156863, 1,
1.038644, -0.8055279, 3.493709, 1, 0, 0.8117647, 1,
1.039292, 0.4247065, 0.3014237, 1, 0, 0.8039216, 1,
1.046234, 1.522509, 1.177372, 1, 0, 0.7960784, 1,
1.056023, 0.4831188, -0.600559, 1, 0, 0.7921569, 1,
1.069307, 1.157715, 0.5334008, 1, 0, 0.7843137, 1,
1.070845, -0.3664048, 0.9691918, 1, 0, 0.7803922, 1,
1.08457, -0.8808331, 3.249524, 1, 0, 0.772549, 1,
1.084777, 0.5523061, 1.930122, 1, 0, 0.7686275, 1,
1.087076, 1.637592, 2.672934, 1, 0, 0.7607843, 1,
1.091809, -0.2313011, 1.429762, 1, 0, 0.7568628, 1,
1.095325, -0.8296982, 1.165141, 1, 0, 0.7490196, 1,
1.108618, -0.4843613, 2.145022, 1, 0, 0.7450981, 1,
1.119825, 1.400028, 0.7579755, 1, 0, 0.7372549, 1,
1.12287, 1.061101, 2.937705, 1, 0, 0.7333333, 1,
1.125812, 0.3703776, 1.728486, 1, 0, 0.7254902, 1,
1.126516, -0.01098046, 0.7475554, 1, 0, 0.7215686, 1,
1.127477, 0.9556462, 2.824432, 1, 0, 0.7137255, 1,
1.144602, 0.3224398, 1.259273, 1, 0, 0.7098039, 1,
1.14956, -1.021861, 1.429582, 1, 0, 0.7019608, 1,
1.150738, 2.436305, -0.1079471, 1, 0, 0.6941177, 1,
1.15554, 1.531548, 1.626397, 1, 0, 0.6901961, 1,
1.16257, -1.106821, 2.408304, 1, 0, 0.682353, 1,
1.169136, 1.593004, 1.028011, 1, 0, 0.6784314, 1,
1.175655, -1.027684, 4.023283, 1, 0, 0.6705883, 1,
1.176391, 0.4924788, 1.304527, 1, 0, 0.6666667, 1,
1.177885, 0.8219856, 1.016167, 1, 0, 0.6588235, 1,
1.188537, -0.3679722, 0.724478, 1, 0, 0.654902, 1,
1.195882, -0.8679712, 1.419403, 1, 0, 0.6470588, 1,
1.198922, 2.060394, 0.4580413, 1, 0, 0.6431373, 1,
1.201701, 0.6372674, 1.171497, 1, 0, 0.6352941, 1,
1.203168, 2.190555, 1.370378, 1, 0, 0.6313726, 1,
1.203266, -0.4517329, 1.637136, 1, 0, 0.6235294, 1,
1.210257, -0.2004276, 2.227497, 1, 0, 0.6196079, 1,
1.215111, 2.346693, 0.4287136, 1, 0, 0.6117647, 1,
1.217584, -0.5852216, 0.6322967, 1, 0, 0.6078432, 1,
1.219283, -1.10458, 1.665566, 1, 0, 0.6, 1,
1.221121, 0.6591605, 0.6173707, 1, 0, 0.5921569, 1,
1.222719, -0.8507199, 1.669916, 1, 0, 0.5882353, 1,
1.246951, 0.495265, 1.098355, 1, 0, 0.5803922, 1,
1.248504, 0.4768984, 1.439292, 1, 0, 0.5764706, 1,
1.254468, -1.435404, 3.488457, 1, 0, 0.5686275, 1,
1.256628, -0.4211351, 2.082477, 1, 0, 0.5647059, 1,
1.263929, -1.018818, 2.344066, 1, 0, 0.5568628, 1,
1.273162, -0.5183026, 2.142867, 1, 0, 0.5529412, 1,
1.276128, 0.02424647, 0.5096784, 1, 0, 0.5450981, 1,
1.277026, 2.239288, -1.335518, 1, 0, 0.5411765, 1,
1.277184, 0.993444, 0.4756296, 1, 0, 0.5333334, 1,
1.290819, 0.4550441, 3.688096, 1, 0, 0.5294118, 1,
1.293754, 0.4598944, 0.8345764, 1, 0, 0.5215687, 1,
1.30032, 1.213354, 1.656792, 1, 0, 0.5176471, 1,
1.305177, -0.6842974, 3.098057, 1, 0, 0.509804, 1,
1.309136, 0.07158674, 2.766145, 1, 0, 0.5058824, 1,
1.316393, -1.396233, 1.488649, 1, 0, 0.4980392, 1,
1.319582, -1.183653, 0.7973167, 1, 0, 0.4901961, 1,
1.31978, -0.7900789, 1.7546, 1, 0, 0.4862745, 1,
1.320523, 0.5198475, -0.8893423, 1, 0, 0.4784314, 1,
1.320984, 0.6983919, 1.407242, 1, 0, 0.4745098, 1,
1.340629, 1.193671, 1.451708, 1, 0, 0.4666667, 1,
1.351163, 0.7503742, -0.6237296, 1, 0, 0.4627451, 1,
1.352968, 0.4643773, -0.318787, 1, 0, 0.454902, 1,
1.369381, -0.07848573, 0.5856489, 1, 0, 0.4509804, 1,
1.37091, -1.537692, 0.8283114, 1, 0, 0.4431373, 1,
1.371023, 1.763916, 1.333636, 1, 0, 0.4392157, 1,
1.38346, 1.261607, 1.76573, 1, 0, 0.4313726, 1,
1.389644, -0.3852765, 1.281769, 1, 0, 0.427451, 1,
1.401585, -1.648251, 3.016712, 1, 0, 0.4196078, 1,
1.420367, -0.2210827, 0.5116066, 1, 0, 0.4156863, 1,
1.424733, -1.128273, 0.7330381, 1, 0, 0.4078431, 1,
1.425126, 0.429561, 0.2198565, 1, 0, 0.4039216, 1,
1.428316, 0.3698491, 0.732021, 1, 0, 0.3960784, 1,
1.457666, -2.236289, 3.805935, 1, 0, 0.3882353, 1,
1.462402, -1.929396, 2.323912, 1, 0, 0.3843137, 1,
1.471157, -1.779496, 2.987767, 1, 0, 0.3764706, 1,
1.472853, -1.009415, 0.02264052, 1, 0, 0.372549, 1,
1.476964, -0.09227636, 2.090346, 1, 0, 0.3647059, 1,
1.502514, 0.7190731, 0.6044509, 1, 0, 0.3607843, 1,
1.506542, 1.143458, 2.279162, 1, 0, 0.3529412, 1,
1.510283, -1.451838, 2.635848, 1, 0, 0.3490196, 1,
1.510552, 0.3945217, 2.315728, 1, 0, 0.3411765, 1,
1.518387, 0.2278086, 1.746836, 1, 0, 0.3372549, 1,
1.544071, -2.344593, 3.089407, 1, 0, 0.3294118, 1,
1.545093, 0.1334312, 1.484305, 1, 0, 0.3254902, 1,
1.54577, 0.1989512, 0.1864288, 1, 0, 0.3176471, 1,
1.54792, -0.5662006, 2.766566, 1, 0, 0.3137255, 1,
1.566679, 1.81704, 2.176423, 1, 0, 0.3058824, 1,
1.603416, -0.904398, 0.2851963, 1, 0, 0.2980392, 1,
1.610581, -0.2629414, 2.875183, 1, 0, 0.2941177, 1,
1.613292, -0.135422, -0.367856, 1, 0, 0.2862745, 1,
1.62778, -0.5768248, 0.5878335, 1, 0, 0.282353, 1,
1.629464, 0.4375193, 2.398806, 1, 0, 0.2745098, 1,
1.637037, 0.4948642, 1.215063, 1, 0, 0.2705882, 1,
1.653291, 0.1533616, 0.8387845, 1, 0, 0.2627451, 1,
1.697912, -0.4681678, 1.331523, 1, 0, 0.2588235, 1,
1.70265, -0.8947531, 1.944396, 1, 0, 0.2509804, 1,
1.710908, 0.3590552, 2.92351, 1, 0, 0.2470588, 1,
1.713099, -0.9107609, 0.7022377, 1, 0, 0.2392157, 1,
1.713387, 0.7084956, 2.460744, 1, 0, 0.2352941, 1,
1.718211, -0.04408517, 1.73649, 1, 0, 0.227451, 1,
1.728847, -0.4894391, 1.885113, 1, 0, 0.2235294, 1,
1.734532, 0.1723016, 2.070036, 1, 0, 0.2156863, 1,
1.749769, 0.7270092, 0.6210671, 1, 0, 0.2117647, 1,
1.755659, -2.63385, 1.6904, 1, 0, 0.2039216, 1,
1.766732, 0.864553, -0.2571128, 1, 0, 0.1960784, 1,
1.797537, -0.1781419, 3.810792, 1, 0, 0.1921569, 1,
1.828454, 0.04919875, 1.782237, 1, 0, 0.1843137, 1,
1.873302, -0.2895708, 1.975719, 1, 0, 0.1803922, 1,
1.893333, -0.8123091, 1.02289, 1, 0, 0.172549, 1,
1.907038, 0.03634438, 4.056613, 1, 0, 0.1686275, 1,
1.91579, 0.1021035, 0.09128483, 1, 0, 0.1607843, 1,
1.920186, -0.9328021, 0.5262214, 1, 0, 0.1568628, 1,
1.92118, -0.2460502, 2.062818, 1, 0, 0.1490196, 1,
1.974932, -0.5021411, 2.097646, 1, 0, 0.145098, 1,
2.021292, 0.3489597, 1.775863, 1, 0, 0.1372549, 1,
2.048023, -0.5829287, 2.961276, 1, 0, 0.1333333, 1,
2.062465, 2.662591, 0.8744488, 1, 0, 0.1254902, 1,
2.06904, -1.349702, 2.167875, 1, 0, 0.1215686, 1,
2.076186, -2.364768, 3.999883, 1, 0, 0.1137255, 1,
2.122047, 1.002259, 0.4434578, 1, 0, 0.1098039, 1,
2.136823, 0.9659785, 1.258952, 1, 0, 0.1019608, 1,
2.155909, -0.1174241, 3.430449, 1, 0, 0.09411765, 1,
2.204136, -1.305007, 1.426217, 1, 0, 0.09019608, 1,
2.2571, -2.82618, 2.005019, 1, 0, 0.08235294, 1,
2.267209, 0.7617661, 0.9698578, 1, 0, 0.07843138, 1,
2.272367, 1.576037, -0.08474348, 1, 0, 0.07058824, 1,
2.372045, 1.023541, -0.0432076, 1, 0, 0.06666667, 1,
2.467916, -2.024311, 1.628118, 1, 0, 0.05882353, 1,
2.547685, -2.624731, 1.733347, 1, 0, 0.05490196, 1,
2.641427, -0.4744461, -1.822731, 1, 0, 0.04705882, 1,
2.685028, -0.269481, 1.965309, 1, 0, 0.04313726, 1,
2.701281, 0.175098, 1.086361, 1, 0, 0.03529412, 1,
2.702035, -0.2683895, 0.3503321, 1, 0, 0.03137255, 1,
2.795034, 0.09970643, 1.0064, 1, 0, 0.02352941, 1,
2.82579, 1.001395, 0.6271569, 1, 0, 0.01960784, 1,
2.854719, -1.003758, 0.9907026, 1, 0, 0.01176471, 1,
2.900644, -0.4023595, 0.1498562, 1, 0, 0.007843138, 1
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
-0.3657565, -4.109606, -7.639709, 0, -0.5, 0.5, 0.5,
-0.3657565, -4.109606, -7.639709, 1, -0.5, 0.5, 0.5,
-0.3657565, -4.109606, -7.639709, 1, 1.5, 0.5, 0.5,
-0.3657565, -4.109606, -7.639709, 0, 1.5, 0.5, 0.5
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
-4.739467, 0.1570199, -7.639709, 0, -0.5, 0.5, 0.5,
-4.739467, 0.1570199, -7.639709, 1, -0.5, 0.5, 0.5,
-4.739467, 0.1570199, -7.639709, 1, 1.5, 0.5, 0.5,
-4.739467, 0.1570199, -7.639709, 0, 1.5, 0.5, 0.5
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
-4.739467, -4.109606, -0.3608351, 0, -0.5, 0.5, 0.5,
-4.739467, -4.109606, -0.3608351, 1, -0.5, 0.5, 0.5,
-4.739467, -4.109606, -0.3608351, 1, 1.5, 0.5, 0.5,
-4.739467, -4.109606, -0.3608351, 0, 1.5, 0.5, 0.5
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
-3, -3.125, -5.959969,
2, -3.125, -5.959969,
-3, -3.125, -5.959969,
-3, -3.289101, -6.239925,
-2, -3.125, -5.959969,
-2, -3.289101, -6.239925,
-1, -3.125, -5.959969,
-1, -3.289101, -6.239925,
0, -3.125, -5.959969,
0, -3.289101, -6.239925,
1, -3.125, -5.959969,
1, -3.289101, -6.239925,
2, -3.125, -5.959969,
2, -3.289101, -6.239925
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
-3, -3.617303, -6.799839, 0, -0.5, 0.5, 0.5,
-3, -3.617303, -6.799839, 1, -0.5, 0.5, 0.5,
-3, -3.617303, -6.799839, 1, 1.5, 0.5, 0.5,
-3, -3.617303, -6.799839, 0, 1.5, 0.5, 0.5,
-2, -3.617303, -6.799839, 0, -0.5, 0.5, 0.5,
-2, -3.617303, -6.799839, 1, -0.5, 0.5, 0.5,
-2, -3.617303, -6.799839, 1, 1.5, 0.5, 0.5,
-2, -3.617303, -6.799839, 0, 1.5, 0.5, 0.5,
-1, -3.617303, -6.799839, 0, -0.5, 0.5, 0.5,
-1, -3.617303, -6.799839, 1, -0.5, 0.5, 0.5,
-1, -3.617303, -6.799839, 1, 1.5, 0.5, 0.5,
-1, -3.617303, -6.799839, 0, 1.5, 0.5, 0.5,
0, -3.617303, -6.799839, 0, -0.5, 0.5, 0.5,
0, -3.617303, -6.799839, 1, -0.5, 0.5, 0.5,
0, -3.617303, -6.799839, 1, 1.5, 0.5, 0.5,
0, -3.617303, -6.799839, 0, 1.5, 0.5, 0.5,
1, -3.617303, -6.799839, 0, -0.5, 0.5, 0.5,
1, -3.617303, -6.799839, 1, -0.5, 0.5, 0.5,
1, -3.617303, -6.799839, 1, 1.5, 0.5, 0.5,
1, -3.617303, -6.799839, 0, 1.5, 0.5, 0.5,
2, -3.617303, -6.799839, 0, -0.5, 0.5, 0.5,
2, -3.617303, -6.799839, 1, -0.5, 0.5, 0.5,
2, -3.617303, -6.799839, 1, 1.5, 0.5, 0.5,
2, -3.617303, -6.799839, 0, 1.5, 0.5, 0.5
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
-3.730149, -3, -5.959969,
-3.730149, 3, -5.959969,
-3.730149, -3, -5.959969,
-3.898369, -3, -6.239925,
-3.730149, -2, -5.959969,
-3.898369, -2, -6.239925,
-3.730149, -1, -5.959969,
-3.898369, -1, -6.239925,
-3.730149, 0, -5.959969,
-3.898369, 0, -6.239925,
-3.730149, 1, -5.959969,
-3.898369, 1, -6.239925,
-3.730149, 2, -5.959969,
-3.898369, 2, -6.239925,
-3.730149, 3, -5.959969,
-3.898369, 3, -6.239925
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
-4.234808, -3, -6.799839, 0, -0.5, 0.5, 0.5,
-4.234808, -3, -6.799839, 1, -0.5, 0.5, 0.5,
-4.234808, -3, -6.799839, 1, 1.5, 0.5, 0.5,
-4.234808, -3, -6.799839, 0, 1.5, 0.5, 0.5,
-4.234808, -2, -6.799839, 0, -0.5, 0.5, 0.5,
-4.234808, -2, -6.799839, 1, -0.5, 0.5, 0.5,
-4.234808, -2, -6.799839, 1, 1.5, 0.5, 0.5,
-4.234808, -2, -6.799839, 0, 1.5, 0.5, 0.5,
-4.234808, -1, -6.799839, 0, -0.5, 0.5, 0.5,
-4.234808, -1, -6.799839, 1, -0.5, 0.5, 0.5,
-4.234808, -1, -6.799839, 1, 1.5, 0.5, 0.5,
-4.234808, -1, -6.799839, 0, 1.5, 0.5, 0.5,
-4.234808, 0, -6.799839, 0, -0.5, 0.5, 0.5,
-4.234808, 0, -6.799839, 1, -0.5, 0.5, 0.5,
-4.234808, 0, -6.799839, 1, 1.5, 0.5, 0.5,
-4.234808, 0, -6.799839, 0, 1.5, 0.5, 0.5,
-4.234808, 1, -6.799839, 0, -0.5, 0.5, 0.5,
-4.234808, 1, -6.799839, 1, -0.5, 0.5, 0.5,
-4.234808, 1, -6.799839, 1, 1.5, 0.5, 0.5,
-4.234808, 1, -6.799839, 0, 1.5, 0.5, 0.5,
-4.234808, 2, -6.799839, 0, -0.5, 0.5, 0.5,
-4.234808, 2, -6.799839, 1, -0.5, 0.5, 0.5,
-4.234808, 2, -6.799839, 1, 1.5, 0.5, 0.5,
-4.234808, 2, -6.799839, 0, 1.5, 0.5, 0.5,
-4.234808, 3, -6.799839, 0, -0.5, 0.5, 0.5,
-4.234808, 3, -6.799839, 1, -0.5, 0.5, 0.5,
-4.234808, 3, -6.799839, 1, 1.5, 0.5, 0.5,
-4.234808, 3, -6.799839, 0, 1.5, 0.5, 0.5
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
-3.730149, -3.125, -4,
-3.730149, -3.125, 4,
-3.730149, -3.125, -4,
-3.898369, -3.289101, -4,
-3.730149, -3.125, -2,
-3.898369, -3.289101, -2,
-3.730149, -3.125, 0,
-3.898369, -3.289101, 0,
-3.730149, -3.125, 2,
-3.898369, -3.289101, 2,
-3.730149, -3.125, 4,
-3.898369, -3.289101, 4
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
-4.234808, -3.617303, -4, 0, -0.5, 0.5, 0.5,
-4.234808, -3.617303, -4, 1, -0.5, 0.5, 0.5,
-4.234808, -3.617303, -4, 1, 1.5, 0.5, 0.5,
-4.234808, -3.617303, -4, 0, 1.5, 0.5, 0.5,
-4.234808, -3.617303, -2, 0, -0.5, 0.5, 0.5,
-4.234808, -3.617303, -2, 1, -0.5, 0.5, 0.5,
-4.234808, -3.617303, -2, 1, 1.5, 0.5, 0.5,
-4.234808, -3.617303, -2, 0, 1.5, 0.5, 0.5,
-4.234808, -3.617303, 0, 0, -0.5, 0.5, 0.5,
-4.234808, -3.617303, 0, 1, -0.5, 0.5, 0.5,
-4.234808, -3.617303, 0, 1, 1.5, 0.5, 0.5,
-4.234808, -3.617303, 0, 0, 1.5, 0.5, 0.5,
-4.234808, -3.617303, 2, 0, -0.5, 0.5, 0.5,
-4.234808, -3.617303, 2, 1, -0.5, 0.5, 0.5,
-4.234808, -3.617303, 2, 1, 1.5, 0.5, 0.5,
-4.234808, -3.617303, 2, 0, 1.5, 0.5, 0.5,
-4.234808, -3.617303, 4, 0, -0.5, 0.5, 0.5,
-4.234808, -3.617303, 4, 1, -0.5, 0.5, 0.5,
-4.234808, -3.617303, 4, 1, 1.5, 0.5, 0.5,
-4.234808, -3.617303, 4, 0, 1.5, 0.5, 0.5
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
-3.730149, -3.125, -5.959969,
-3.730149, 3.43904, -5.959969,
-3.730149, -3.125, 5.238298,
-3.730149, 3.43904, 5.238298,
-3.730149, -3.125, -5.959969,
-3.730149, -3.125, 5.238298,
-3.730149, 3.43904, -5.959969,
-3.730149, 3.43904, 5.238298,
-3.730149, -3.125, -5.959969,
2.998636, -3.125, -5.959969,
-3.730149, -3.125, 5.238298,
2.998636, -3.125, 5.238298,
-3.730149, 3.43904, -5.959969,
2.998636, 3.43904, -5.959969,
-3.730149, 3.43904, 5.238298,
2.998636, 3.43904, 5.238298,
2.998636, -3.125, -5.959969,
2.998636, 3.43904, -5.959969,
2.998636, -3.125, 5.238298,
2.998636, 3.43904, 5.238298,
2.998636, -3.125, -5.959969,
2.998636, -3.125, 5.238298,
2.998636, 3.43904, -5.959969,
2.998636, 3.43904, 5.238298
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
var radius = 7.80716;
var distance = 34.73494;
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
mvMatrix.translate( 0.3657565, -0.1570199, 0.3608351 );
mvMatrix.scale( 1.254499, 1.285985, 0.7538001 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.73494);
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
Calypso<-read.table("Calypso.xyz", skip=1)
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
-3.632157, -0.723495, -2.178039, 0, 0, 1, 1, 1,
-3.411598, -0.01906587, -0.4580893, 1, 0, 0, 1, 1,
-2.945063, 0.6439664, -1.649087, 1, 0, 0, 1, 1,
-2.869888, -0.8638351, -1.474717, 1, 0, 0, 1, 1,
-2.865307, 0.585858, -1.082656, 1, 0, 0, 1, 1,
-2.819014, 0.2827577, -0.4489263, 1, 0, 0, 1, 1,
-2.760162, 0.5542102, 0.2120467, 0, 0, 0, 1, 1,
-2.726054, 0.2231708, -1.456718, 0, 0, 0, 1, 1,
-2.612472, 0.3877255, -1.9049, 0, 0, 0, 1, 1,
-2.527334, -1.346815, -1.559152, 0, 0, 0, 1, 1,
-2.499018, -0.8893221, 0.01122888, 0, 0, 0, 1, 1,
-2.440591, 0.3963777, -2.848702, 0, 0, 0, 1, 1,
-2.379729, -2.761047, -2.676009, 0, 0, 0, 1, 1,
-2.378011, 0.04075995, -2.942687, 1, 1, 1, 1, 1,
-2.352744, -0.9448614, -0.4425651, 1, 1, 1, 1, 1,
-2.348277, 0.3180867, -0.7811102, 1, 1, 1, 1, 1,
-2.277137, 0.4613804, -1.915954, 1, 1, 1, 1, 1,
-2.274365, -0.5482553, -2.18763, 1, 1, 1, 1, 1,
-2.213223, 1.235299, -1.405008, 1, 1, 1, 1, 1,
-2.197579, 0.3687062, -1.805221, 1, 1, 1, 1, 1,
-2.159739, -0.8602381, -2.407186, 1, 1, 1, 1, 1,
-2.149064, -1.073117, -1.422843, 1, 1, 1, 1, 1,
-2.14751, 1.517128, -1.268455, 1, 1, 1, 1, 1,
-2.091645, -0.5718455, -3.73045, 1, 1, 1, 1, 1,
-2.07262, -0.2459061, -2.575577, 1, 1, 1, 1, 1,
-1.922294, -0.9884385, -1.41006, 1, 1, 1, 1, 1,
-1.91939, 0.2897081, -2.659977, 1, 1, 1, 1, 1,
-1.904941, 0.4024537, -1.115526, 1, 1, 1, 1, 1,
-1.899928, -2.500525, -1.010925, 0, 0, 1, 1, 1,
-1.885732, 0.8214081, 0.4077874, 1, 0, 0, 1, 1,
-1.88241, -0.3056293, -1.816028, 1, 0, 0, 1, 1,
-1.879862, 0.8446152, -0.730554, 1, 0, 0, 1, 1,
-1.878549, 0.4514824, -1.599416, 1, 0, 0, 1, 1,
-1.86728, -1.757103, -3.167279, 1, 0, 0, 1, 1,
-1.864271, 0.8298475, -2.719488, 0, 0, 0, 1, 1,
-1.863158, -0.7511053, -1.809607, 0, 0, 0, 1, 1,
-1.862621, -0.9576292, -0.8738236, 0, 0, 0, 1, 1,
-1.830315, 0.1847311, -0.7498423, 0, 0, 0, 1, 1,
-1.820083, 0.4038145, -2.961329, 0, 0, 0, 1, 1,
-1.815464, 0.01927188, -1.996266, 0, 0, 0, 1, 1,
-1.797336, -0.7677563, -0.2325211, 0, 0, 0, 1, 1,
-1.792986, -0.7658026, -1.797069, 1, 1, 1, 1, 1,
-1.787629, -0.8331732, 1.226243, 1, 1, 1, 1, 1,
-1.778032, 0.8470398, -0.4784439, 1, 1, 1, 1, 1,
-1.761885, -1.155337, -1.679224, 1, 1, 1, 1, 1,
-1.722653, 1.737246, -0.7623104, 1, 1, 1, 1, 1,
-1.712171, 1.137738, -1.980437, 1, 1, 1, 1, 1,
-1.71156, 1.33415, -1.079216, 1, 1, 1, 1, 1,
-1.689735, -0.07803157, -2.141173, 1, 1, 1, 1, 1,
-1.675714, -0.5541602, -1.595262, 1, 1, 1, 1, 1,
-1.671777, 2.337095, -0.3790361, 1, 1, 1, 1, 1,
-1.671398, 0.3324427, -1.914721, 1, 1, 1, 1, 1,
-1.658884, 0.8319342, -1.559178, 1, 1, 1, 1, 1,
-1.647666, -0.7799339, -2.601794, 1, 1, 1, 1, 1,
-1.623603, 0.7261112, -2.236433, 1, 1, 1, 1, 1,
-1.62322, -0.05537827, -2.64256, 1, 1, 1, 1, 1,
-1.618571, 0.5555081, -1.304077, 0, 0, 1, 1, 1,
-1.615679, -1.070946, -1.762673, 1, 0, 0, 1, 1,
-1.611728, -1.162427, -2.041252, 1, 0, 0, 1, 1,
-1.591264, -0.3004639, -3.614864, 1, 0, 0, 1, 1,
-1.589275, -1.762178, -2.602572, 1, 0, 0, 1, 1,
-1.587976, -1.086815, -3.291051, 1, 0, 0, 1, 1,
-1.57621, 0.3523982, -2.535938, 0, 0, 0, 1, 1,
-1.575908, -0.3075581, -2.178751, 0, 0, 0, 1, 1,
-1.573992, -1.932903, -2.058846, 0, 0, 0, 1, 1,
-1.571769, 0.4792557, -0.2331642, 0, 0, 0, 1, 1,
-1.570772, -0.7013191, -0.6403905, 0, 0, 0, 1, 1,
-1.554153, -0.8602886, -2.341691, 0, 0, 0, 1, 1,
-1.549272, 0.5787201, -1.360199, 0, 0, 0, 1, 1,
-1.544088, -0.3343104, -1.319952, 1, 1, 1, 1, 1,
-1.543963, -0.7523685, -1.25935, 1, 1, 1, 1, 1,
-1.543708, 0.2910306, 0.9612761, 1, 1, 1, 1, 1,
-1.52996, 0.3584712, -0.522799, 1, 1, 1, 1, 1,
-1.512684, 0.6070518, -2.622267, 1, 1, 1, 1, 1,
-1.482, -0.7054237, -1.469132, 1, 1, 1, 1, 1,
-1.464213, 1.756299, -1.536601, 1, 1, 1, 1, 1,
-1.453286, 1.038936, -0.5698119, 1, 1, 1, 1, 1,
-1.451889, 0.3626814, -1.52223, 1, 1, 1, 1, 1,
-1.445775, -0.6619186, -3.278924, 1, 1, 1, 1, 1,
-1.435647, -0.5603591, -2.185995, 1, 1, 1, 1, 1,
-1.426838, -0.4283946, -2.089785, 1, 1, 1, 1, 1,
-1.42408, 0.8449248, -0.4410213, 1, 1, 1, 1, 1,
-1.421524, -0.17313, -0.5162265, 1, 1, 1, 1, 1,
-1.39103, 0.7437369, -0.2600133, 1, 1, 1, 1, 1,
-1.385229, 0.886656, -0.04384593, 0, 0, 1, 1, 1,
-1.38099, 0.7298927, -0.9830375, 1, 0, 0, 1, 1,
-1.374698, -0.897624, -1.423194, 1, 0, 0, 1, 1,
-1.366669, -0.09411123, -1.98759, 1, 0, 0, 1, 1,
-1.366419, -1.850919, -2.947362, 1, 0, 0, 1, 1,
-1.360952, -1.566225, -2.159333, 1, 0, 0, 1, 1,
-1.355976, -0.2837499, -3.050552, 0, 0, 0, 1, 1,
-1.352048, -1.237892, -1.528573, 0, 0, 0, 1, 1,
-1.351923, -0.3503002, -1.595558, 0, 0, 0, 1, 1,
-1.339451, -0.9219906, -1.930816, 0, 0, 0, 1, 1,
-1.336654, -1.021381, -2.605712, 0, 0, 0, 1, 1,
-1.326287, -0.1106308, -1.300066, 0, 0, 0, 1, 1,
-1.324909, 0.3583756, -0.6452841, 0, 0, 0, 1, 1,
-1.320127, -2.658524, -2.019676, 1, 1, 1, 1, 1,
-1.315531, 0.4772739, -0.8078873, 1, 1, 1, 1, 1,
-1.29736, 0.247503, -2.507331, 1, 1, 1, 1, 1,
-1.296208, -0.7250808, -1.823759, 1, 1, 1, 1, 1,
-1.294554, -0.2207783, -0.7978784, 1, 1, 1, 1, 1,
-1.290294, 1.234669, -1.134461, 1, 1, 1, 1, 1,
-1.284427, -2.132022, -2.183601, 1, 1, 1, 1, 1,
-1.272213, 0.1388823, -1.885862, 1, 1, 1, 1, 1,
-1.269078, -0.3044401, -3.582931, 1, 1, 1, 1, 1,
-1.26751, -1.16185, -2.330494, 1, 1, 1, 1, 1,
-1.262232, -0.31854, -0.8085669, 1, 1, 1, 1, 1,
-1.254565, -1.011793, -1.624224, 1, 1, 1, 1, 1,
-1.252575, -1.283139, -2.815173, 1, 1, 1, 1, 1,
-1.251489, -0.04635404, -2.799317, 1, 1, 1, 1, 1,
-1.247214, 0.4224303, -0.3583419, 1, 1, 1, 1, 1,
-1.238836, -1.431095, -2.559644, 0, 0, 1, 1, 1,
-1.233182, 1.065352, -0.8239747, 1, 0, 0, 1, 1,
-1.225972, 1.301912, 0.2801744, 1, 0, 0, 1, 1,
-1.223039, -0.8115442, -2.72553, 1, 0, 0, 1, 1,
-1.222081, 0.8604387, -3.926136, 1, 0, 0, 1, 1,
-1.21979, -0.3979995, -1.273021, 1, 0, 0, 1, 1,
-1.214683, -0.7609801, -1.651008, 0, 0, 0, 1, 1,
-1.209815, 0.167926, -2.286472, 0, 0, 0, 1, 1,
-1.203838, 0.6026925, 0.169005, 0, 0, 0, 1, 1,
-1.195364, -0.4986166, -0.74388, 0, 0, 0, 1, 1,
-1.186769, -0.7351484, -2.99481, 0, 0, 0, 1, 1,
-1.185488, -0.3327971, -2.151853, 0, 0, 0, 1, 1,
-1.183009, 0.9649215, -1.176089, 0, 0, 0, 1, 1,
-1.179197, -0.8968248, -2.63907, 1, 1, 1, 1, 1,
-1.174677, 0.1352288, -3.529051, 1, 1, 1, 1, 1,
-1.169927, -0.7800783, -1.256699, 1, 1, 1, 1, 1,
-1.147999, -0.6110107, -2.71678, 1, 1, 1, 1, 1,
-1.147059, 0.597474, -2.315003, 1, 1, 1, 1, 1,
-1.139915, -0.7612016, -0.5365927, 1, 1, 1, 1, 1,
-1.137326, 0.4228965, -0.9240029, 1, 1, 1, 1, 1,
-1.136651, -0.7736574, -2.638685, 1, 1, 1, 1, 1,
-1.127621, 2.237043, 0.5756932, 1, 1, 1, 1, 1,
-1.125593, -0.0839453, -1.244078, 1, 1, 1, 1, 1,
-1.122126, 0.1910375, 0.06328537, 1, 1, 1, 1, 1,
-1.120965, -3.029407, -1.481349, 1, 1, 1, 1, 1,
-1.115959, 0.8911946, -0.3140927, 1, 1, 1, 1, 1,
-1.112079, 0.642828, 0.2563952, 1, 1, 1, 1, 1,
-1.11191, 0.481416, -2.46716, 1, 1, 1, 1, 1,
-1.110455, -1.325872, -5.395265, 0, 0, 1, 1, 1,
-1.105036, 0.6415997, -0.04783712, 1, 0, 0, 1, 1,
-1.102474, 0.5013395, -2.503793, 1, 0, 0, 1, 1,
-1.101348, -0.4533246, -1.230092, 1, 0, 0, 1, 1,
-1.099182, 2.093284, -1.582068, 1, 0, 0, 1, 1,
-1.095057, -1.528773, -0.7422153, 1, 0, 0, 1, 1,
-1.09155, 1.137943, -0.2151735, 0, 0, 0, 1, 1,
-1.08781, -0.3677473, -1.095043, 0, 0, 0, 1, 1,
-1.087429, -1.450681, -2.975448, 0, 0, 0, 1, 1,
-1.087166, 0.2583811, -0.9592406, 0, 0, 0, 1, 1,
-1.080601, 0.1617352, -1.508258, 0, 0, 0, 1, 1,
-1.06178, -0.05570645, -0.9458643, 0, 0, 0, 1, 1,
-1.059494, 0.3661492, -1.677936, 0, 0, 0, 1, 1,
-1.055027, -0.1783662, -2.070291, 1, 1, 1, 1, 1,
-1.052463, 1.925077, -2.230846, 1, 1, 1, 1, 1,
-1.047395, -0.7772683, -2.707886, 1, 1, 1, 1, 1,
-1.041174, -0.4853531, -4.157935, 1, 1, 1, 1, 1,
-1.04072, -1.586041, -0.01971425, 1, 1, 1, 1, 1,
-1.036041, 0.2741099, -2.114314, 1, 1, 1, 1, 1,
-1.034366, -2.433154, -2.595717, 1, 1, 1, 1, 1,
-1.033572, 2.611431, -0.6179344, 1, 1, 1, 1, 1,
-1.030114, 0.007528284, -0.2925622, 1, 1, 1, 1, 1,
-1.027598, -0.5446048, -3.301054, 1, 1, 1, 1, 1,
-1.026272, -0.8206729, -2.081343, 1, 1, 1, 1, 1,
-1.017278, -1.503128, -2.110357, 1, 1, 1, 1, 1,
-1.016085, -0.9285223, -1.611923, 1, 1, 1, 1, 1,
-1.013592, 0.5471079, -1.480774, 1, 1, 1, 1, 1,
-1.005065, 0.8112504, 0.1733652, 1, 1, 1, 1, 1,
-0.9991391, -0.9185303, -2.603568, 0, 0, 1, 1, 1,
-0.9968768, -0.3827524, -3.386201, 1, 0, 0, 1, 1,
-0.9951705, 2.594108, 0.5394283, 1, 0, 0, 1, 1,
-0.9709975, 1.159857, -1.476341, 1, 0, 0, 1, 1,
-0.9697273, 2.704141, 1.24918, 1, 0, 0, 1, 1,
-0.9689763, -0.6723996, -2.313534, 1, 0, 0, 1, 1,
-0.9643166, -0.1179811, -1.388154, 0, 0, 0, 1, 1,
-0.9622388, 0.8245987, -2.263512, 0, 0, 0, 1, 1,
-0.9562585, 0.2245119, -1.930922, 0, 0, 0, 1, 1,
-0.9493835, 0.8049972, -0.7982842, 0, 0, 0, 1, 1,
-0.9438254, 0.2369473, -2.076036, 0, 0, 0, 1, 1,
-0.9416819, -0.4947124, -2.086995, 0, 0, 0, 1, 1,
-0.9395205, 1.410133, -1.732962, 0, 0, 0, 1, 1,
-0.936481, -1.491724, -3.228017, 1, 1, 1, 1, 1,
-0.9363526, 0.004006862, -2.299716, 1, 1, 1, 1, 1,
-0.9308625, 2.137405, -1.919176, 1, 1, 1, 1, 1,
-0.9234493, 1.769326, -1.58302, 1, 1, 1, 1, 1,
-0.9227914, -0.9885281, -2.67214, 1, 1, 1, 1, 1,
-0.9226345, 1.229691, -0.3694267, 1, 1, 1, 1, 1,
-0.9222236, -0.6494118, -4.209496, 1, 1, 1, 1, 1,
-0.9221134, 0.2729866, -2.375827, 1, 1, 1, 1, 1,
-0.9219727, -1.592532, 0.40782, 1, 1, 1, 1, 1,
-0.9159371, -0.9424888, -2.146938, 1, 1, 1, 1, 1,
-0.9136264, -2.081831, -2.369529, 1, 1, 1, 1, 1,
-0.9133301, 0.8483611, -0.5917375, 1, 1, 1, 1, 1,
-0.9048416, -0.04868478, -2.326046, 1, 1, 1, 1, 1,
-0.9001728, 0.5491127, 0.6244868, 1, 1, 1, 1, 1,
-0.8934122, 1.002131, 0.5903517, 1, 1, 1, 1, 1,
-0.8866467, -1.253135, -3.201396, 0, 0, 1, 1, 1,
-0.8865567, -0.8472837, -3.619066, 1, 0, 0, 1, 1,
-0.8849714, 0.7762552, 0.4175031, 1, 0, 0, 1, 1,
-0.8845037, -0.4114386, -3.119958, 1, 0, 0, 1, 1,
-0.8792242, -0.237774, -1.668885, 1, 0, 0, 1, 1,
-0.8750505, 1.216798, -2.315296, 1, 0, 0, 1, 1,
-0.8748716, -1.333025, -2.455411, 0, 0, 0, 1, 1,
-0.8744428, 1.561609, -2.165063, 0, 0, 0, 1, 1,
-0.8741881, 0.973964, -1.573366, 0, 0, 0, 1, 1,
-0.8619401, -0.01701794, -0.4137813, 0, 0, 0, 1, 1,
-0.8503643, -1.71854, -3.089975, 0, 0, 0, 1, 1,
-0.8364865, 0.0983455, -2.877802, 0, 0, 0, 1, 1,
-0.83178, 1.579956, -1.036616, 0, 0, 0, 1, 1,
-0.8314916, -0.291066, -0.9697564, 1, 1, 1, 1, 1,
-0.830981, 0.2996037, -0.02981775, 1, 1, 1, 1, 1,
-0.8306676, 0.4200528, -1.646637, 1, 1, 1, 1, 1,
-0.8290478, 1.531577, -0.7693198, 1, 1, 1, 1, 1,
-0.8261451, 0.8515907, -0.6501063, 1, 1, 1, 1, 1,
-0.8240826, 1.296318, -0.7135776, 1, 1, 1, 1, 1,
-0.8198167, 1.022654, -1.732394, 1, 1, 1, 1, 1,
-0.8095967, 0.2909789, -0.5416681, 1, 1, 1, 1, 1,
-0.8073913, 0.06465087, -0.35121, 1, 1, 1, 1, 1,
-0.8061925, 0.1235854, -2.021334, 1, 1, 1, 1, 1,
-0.8044223, -0.6049412, -2.705088, 1, 1, 1, 1, 1,
-0.8017731, -0.5246086, -1.946076, 1, 1, 1, 1, 1,
-0.8009725, -1.487802, -3.666134, 1, 1, 1, 1, 1,
-0.7960286, 3.343447, -1.246571, 1, 1, 1, 1, 1,
-0.795282, 0.898167, -0.1420741, 1, 1, 1, 1, 1,
-0.7940045, -0.7411972, -3.648935, 0, 0, 1, 1, 1,
-0.7911764, -0.9119326, -3.563383, 1, 0, 0, 1, 1,
-0.7901114, -0.232512, -4.324814, 1, 0, 0, 1, 1,
-0.7878864, 1.907716, 0.3962022, 1, 0, 0, 1, 1,
-0.7819364, 0.4951681, -1.025615, 1, 0, 0, 1, 1,
-0.7763273, -0.2734238, -2.501546, 1, 0, 0, 1, 1,
-0.7737749, 0.2547051, -0.4010104, 0, 0, 0, 1, 1,
-0.7731347, 0.9583362, 0.4693144, 0, 0, 0, 1, 1,
-0.7666225, 1.689669, -1.727301, 0, 0, 0, 1, 1,
-0.7650492, -0.2920466, -2.213941, 0, 0, 0, 1, 1,
-0.7647555, 2.311225, -0.08091626, 0, 0, 0, 1, 1,
-0.7642775, 0.6444771, -1.034246, 0, 0, 0, 1, 1,
-0.7641103, 0.2724867, -0.6054474, 0, 0, 0, 1, 1,
-0.7617575, -0.4971623, -3.919927, 1, 1, 1, 1, 1,
-0.7569193, 0.001065687, -1.973402, 1, 1, 1, 1, 1,
-0.7568759, 0.8388736, -0.5793025, 1, 1, 1, 1, 1,
-0.7519764, 0.2639948, -0.9572833, 1, 1, 1, 1, 1,
-0.7467214, -0.4610654, -1.581618, 1, 1, 1, 1, 1,
-0.7430045, -0.9482003, -2.874609, 1, 1, 1, 1, 1,
-0.7389355, -0.7842087, -1.362571, 1, 1, 1, 1, 1,
-0.7381586, -1.039096, -3.922783, 1, 1, 1, 1, 1,
-0.7376095, 1.063996, -0.02301794, 1, 1, 1, 1, 1,
-0.7334624, -0.1631476, -1.98247, 1, 1, 1, 1, 1,
-0.7326138, -1.525435, -3.706658, 1, 1, 1, 1, 1,
-0.7324618, -1.697017, -1.587112, 1, 1, 1, 1, 1,
-0.7216851, -0.07693402, -0.5505542, 1, 1, 1, 1, 1,
-0.7176512, -0.5037667, -0.6250483, 1, 1, 1, 1, 1,
-0.7148433, -0.0591263, -0.4228864, 1, 1, 1, 1, 1,
-0.7070636, 0.005854631, -0.4297225, 0, 0, 1, 1, 1,
-0.7057885, 1.201776, -0.3442986, 1, 0, 0, 1, 1,
-0.7052476, 0.136158, -1.642293, 1, 0, 0, 1, 1,
-0.7023933, 1.200692, -1.193223, 1, 0, 0, 1, 1,
-0.6998689, 1.088962, -1.178812, 1, 0, 0, 1, 1,
-0.6951219, 0.6115316, 0.9083865, 1, 0, 0, 1, 1,
-0.6926856, 0.204328, -2.475875, 0, 0, 0, 1, 1,
-0.6759196, 0.9894564, 0.8483384, 0, 0, 0, 1, 1,
-0.6745517, 0.22101, -0.3693213, 0, 0, 0, 1, 1,
-0.6723498, -0.2023738, -1.012759, 0, 0, 0, 1, 1,
-0.6653765, 0.7026001, -0.8671157, 0, 0, 0, 1, 1,
-0.6633703, 0.3681146, -2.318703, 0, 0, 0, 1, 1,
-0.6573426, -0.1336239, -3.400621, 0, 0, 0, 1, 1,
-0.6528104, 1.57156, -0.946296, 1, 1, 1, 1, 1,
-0.6505679, -1.29283, -3.024929, 1, 1, 1, 1, 1,
-0.6496592, -0.30676, -1.362408, 1, 1, 1, 1, 1,
-0.6403962, -0.3000458, -1.507613, 1, 1, 1, 1, 1,
-0.6389754, 0.1532838, -1.417281, 1, 1, 1, 1, 1,
-0.6371017, 2.45909, 0.2760517, 1, 1, 1, 1, 1,
-0.6355079, -2.620682, -1.986918, 1, 1, 1, 1, 1,
-0.6332199, 0.2246586, 0.2117153, 1, 1, 1, 1, 1,
-0.6325113, 0.152097, 0.01753684, 1, 1, 1, 1, 1,
-0.6273771, -1.768669, -1.903938, 1, 1, 1, 1, 1,
-0.6271453, -1.868897, -1.599562, 1, 1, 1, 1, 1,
-0.6226293, -0.7928563, -2.18818, 1, 1, 1, 1, 1,
-0.617507, -0.5300758, -1.839511, 1, 1, 1, 1, 1,
-0.6169101, 1.255033, -0.6447774, 1, 1, 1, 1, 1,
-0.6159624, -0.7395435, -2.80025, 1, 1, 1, 1, 1,
-0.612606, -0.5031673, -3.761262, 0, 0, 1, 1, 1,
-0.6115975, -0.2341383, -3.164721, 1, 0, 0, 1, 1,
-0.6115474, -2.417761, -2.968211, 1, 0, 0, 1, 1,
-0.60681, 0.716089, -0.3503154, 1, 0, 0, 1, 1,
-0.6060346, -1.760696, -1.463574, 1, 0, 0, 1, 1,
-0.6006224, 0.1301332, -2.258045, 1, 0, 0, 1, 1,
-0.5945867, 0.5085722, -0.3621075, 0, 0, 0, 1, 1,
-0.5739136, 0.6661388, 0.4935333, 0, 0, 0, 1, 1,
-0.5709467, 1.207077, -2.0267, 0, 0, 0, 1, 1,
-0.5701738, 0.2004681, -0.3789129, 0, 0, 0, 1, 1,
-0.5692756, 0.2063672, -1.475502, 0, 0, 0, 1, 1,
-0.5684198, -0.01904835, -1.227235, 0, 0, 0, 1, 1,
-0.5665711, -0.2633801, -2.447822, 0, 0, 0, 1, 1,
-0.5647185, -2.019869, -1.917192, 1, 1, 1, 1, 1,
-0.5641575, 1.34823, 0.1388829, 1, 1, 1, 1, 1,
-0.563816, 1.490994, -0.1987037, 1, 1, 1, 1, 1,
-0.5604644, 0.6715996, -0.7679254, 1, 1, 1, 1, 1,
-0.5600155, 0.2053224, 0.1025561, 1, 1, 1, 1, 1,
-0.5574415, 0.07224123, -0.9749444, 1, 1, 1, 1, 1,
-0.5539977, -0.4153888, -3.133848, 1, 1, 1, 1, 1,
-0.5539336, -1.518275, -1.554151, 1, 1, 1, 1, 1,
-0.5486017, 1.152164, -0.1323418, 1, 1, 1, 1, 1,
-0.5472497, 1.548476, 0.8558812, 1, 1, 1, 1, 1,
-0.5440551, 1.225376, 0.1379455, 1, 1, 1, 1, 1,
-0.5436941, 0.6337338, 0.668699, 1, 1, 1, 1, 1,
-0.5399729, 1.08222, -1.158664, 1, 1, 1, 1, 1,
-0.5389872, -0.8719227, -0.6004516, 1, 1, 1, 1, 1,
-0.5356122, 0.2605932, -0.2784449, 1, 1, 1, 1, 1,
-0.5338918, 0.876915, -0.8198447, 0, 0, 1, 1, 1,
-0.5294426, -1.775386, -2.492652, 1, 0, 0, 1, 1,
-0.5254473, -0.957117, -1.762304, 1, 0, 0, 1, 1,
-0.5185602, -0.6014038, -2.352176, 1, 0, 0, 1, 1,
-0.5151815, -0.07454459, -2.68781, 1, 0, 0, 1, 1,
-0.5124664, -2.055195, -3.889536, 1, 0, 0, 1, 1,
-0.5111689, 0.02692329, -0.6059329, 0, 0, 0, 1, 1,
-0.5071931, -1.633144, -3.036386, 0, 0, 0, 1, 1,
-0.50424, -2.203533, -2.350026, 0, 0, 0, 1, 1,
-0.5038178, 0.0968265, -0.5859159, 0, 0, 0, 1, 1,
-0.4984747, 0.7843117, -0.03359577, 0, 0, 0, 1, 1,
-0.4975829, -0.06956866, -0.7490777, 0, 0, 0, 1, 1,
-0.4956421, 0.5548592, -0.292919, 0, 0, 0, 1, 1,
-0.4938578, 0.02288919, -2.13549, 1, 1, 1, 1, 1,
-0.4898311, 0.8537817, -1.321555, 1, 1, 1, 1, 1,
-0.4865114, 0.5406338, 0.8261886, 1, 1, 1, 1, 1,
-0.4829746, -0.3139433, -2.757352, 1, 1, 1, 1, 1,
-0.4757627, -0.5074662, -3.07049, 1, 1, 1, 1, 1,
-0.4722248, -0.5267873, -1.367034, 1, 1, 1, 1, 1,
-0.4720327, 0.6636989, -0.07007327, 1, 1, 1, 1, 1,
-0.4714343, 0.05131086, -2.603012, 1, 1, 1, 1, 1,
-0.462389, -1.458799, -1.252894, 1, 1, 1, 1, 1,
-0.4589065, 1.307821, -0.3508413, 1, 1, 1, 1, 1,
-0.4534616, 2.473036, -0.8734584, 1, 1, 1, 1, 1,
-0.451634, -0.6879135, -3.258503, 1, 1, 1, 1, 1,
-0.4507734, 0.7082537, 1.683254, 1, 1, 1, 1, 1,
-0.4489387, 1.005113, -0.07252438, 1, 1, 1, 1, 1,
-0.4464108, 1.395505, 1.026886, 1, 1, 1, 1, 1,
-0.4435745, 0.169439, -1.120461, 0, 0, 1, 1, 1,
-0.442124, 0.6606277, -0.8993203, 1, 0, 0, 1, 1,
-0.4382953, 0.1708602, -1.41982, 1, 0, 0, 1, 1,
-0.4379471, -0.111947, -2.569377, 1, 0, 0, 1, 1,
-0.4371106, 0.1731984, -0.1251087, 1, 0, 0, 1, 1,
-0.4350798, -0.7796815, -1.596841, 1, 0, 0, 1, 1,
-0.4332466, -0.01587165, -1.438734, 0, 0, 0, 1, 1,
-0.429706, -0.3069752, -2.962994, 0, 0, 0, 1, 1,
-0.4277578, -0.0428215, -0.4909731, 0, 0, 0, 1, 1,
-0.4257758, -0.5697812, -3.434132, 0, 0, 0, 1, 1,
-0.425577, 0.4862884, -0.5074546, 0, 0, 0, 1, 1,
-0.4229682, 0.3602947, -0.06824555, 0, 0, 0, 1, 1,
-0.4219618, -0.5596904, -2.060211, 0, 0, 0, 1, 1,
-0.4181727, 1.546533, 0.4810601, 1, 1, 1, 1, 1,
-0.4164025, -0.09949209, -2.022374, 1, 1, 1, 1, 1,
-0.4128938, 0.3511954, 0.009693455, 1, 1, 1, 1, 1,
-0.4107946, -0.7713803, -3.741238, 1, 1, 1, 1, 1,
-0.4087149, -0.7170074, -0.763797, 1, 1, 1, 1, 1,
-0.4053169, 0.8861541, -0.5518851, 1, 1, 1, 1, 1,
-0.4003873, -0.773635, -2.580372, 1, 1, 1, 1, 1,
-0.400328, -0.09299563, -1.429904, 1, 1, 1, 1, 1,
-0.394206, -0.1846373, -1.111974, 1, 1, 1, 1, 1,
-0.3939052, -0.5036713, -2.584564, 1, 1, 1, 1, 1,
-0.393894, 1.043059, 0.7956755, 1, 1, 1, 1, 1,
-0.3909404, -0.02834648, -1.170039, 1, 1, 1, 1, 1,
-0.3900506, -0.3290216, -0.8479523, 1, 1, 1, 1, 1,
-0.3893649, 0.3850335, 0.5623891, 1, 1, 1, 1, 1,
-0.3859962, -0.5966231, -1.735288, 1, 1, 1, 1, 1,
-0.3847989, 0.7523072, -2.188414, 0, 0, 1, 1, 1,
-0.3839481, 0.04451808, -1.195272, 1, 0, 0, 1, 1,
-0.3839323, 1.359969, -0.4688669, 1, 0, 0, 1, 1,
-0.3806696, 0.419929, -0.7342451, 1, 0, 0, 1, 1,
-0.3775321, 0.6877093, 2.143314, 1, 0, 0, 1, 1,
-0.3738486, -0.2454882, -3.518377, 1, 0, 0, 1, 1,
-0.3704272, 0.7513211, -0.9724648, 0, 0, 0, 1, 1,
-0.3699289, 0.8189693, -1.023736, 0, 0, 0, 1, 1,
-0.364849, -0.9005221, -3.518314, 0, 0, 0, 1, 1,
-0.3593864, 0.4823743, -1.458933, 0, 0, 0, 1, 1,
-0.356465, 0.207032, -2.230432, 0, 0, 0, 1, 1,
-0.3550781, 0.1522658, -1.104418, 0, 0, 0, 1, 1,
-0.3549123, -1.461125, -4.423386, 0, 0, 0, 1, 1,
-0.3540365, 0.3783286, -1.392248, 1, 1, 1, 1, 1,
-0.3528285, -0.8470071, -2.31082, 1, 1, 1, 1, 1,
-0.3514918, -0.06386132, -2.432375, 1, 1, 1, 1, 1,
-0.3453191, 0.1098765, -1.227039, 1, 1, 1, 1, 1,
-0.3416475, -0.948201, -2.169041, 1, 1, 1, 1, 1,
-0.3415054, -0.4637553, -3.2717, 1, 1, 1, 1, 1,
-0.3406854, 1.8293, 0.6975196, 1, 1, 1, 1, 1,
-0.3295047, 1.211194, -0.04677066, 1, 1, 1, 1, 1,
-0.3284037, 0.1253655, -1.639924, 1, 1, 1, 1, 1,
-0.3281108, 0.7988489, -0.7318988, 1, 1, 1, 1, 1,
-0.3233635, 0.3187324, -0.4365087, 1, 1, 1, 1, 1,
-0.323095, -1.481135, -3.320548, 1, 1, 1, 1, 1,
-0.3188379, -0.5559596, -3.060926, 1, 1, 1, 1, 1,
-0.3188378, -1.57351, -2.931944, 1, 1, 1, 1, 1,
-0.3176944, -0.1094984, -2.465199, 1, 1, 1, 1, 1,
-0.3172318, 2.213634, 0.2749062, 0, 0, 1, 1, 1,
-0.3142592, -1.187822, -3.065953, 1, 0, 0, 1, 1,
-0.3137787, 0.2345424, 0.1648938, 1, 0, 0, 1, 1,
-0.3064219, 0.898546, 0.7664659, 1, 0, 0, 1, 1,
-0.3030177, -0.6922008, -3.671454, 1, 0, 0, 1, 1,
-0.3020843, 0.5426991, 0.4799303, 1, 0, 0, 1, 1,
-0.2954744, -1.421282, -2.812035, 0, 0, 0, 1, 1,
-0.2953519, -1.510814, -5.510449, 0, 0, 0, 1, 1,
-0.287938, -0.5913258, -3.166966, 0, 0, 0, 1, 1,
-0.2800796, -0.1295268, -1.473749, 0, 0, 0, 1, 1,
-0.2791471, -0.007065549, -2.681528, 0, 0, 0, 1, 1,
-0.2742704, 0.1958158, -2.461967, 0, 0, 0, 1, 1,
-0.2734444, 2.299948, 1.971941, 0, 0, 0, 1, 1,
-0.269307, -0.941542, -3.050301, 1, 1, 1, 1, 1,
-0.2656587, 0.6729892, -2.688051, 1, 1, 1, 1, 1,
-0.262798, 0.05284261, -1.205022, 1, 1, 1, 1, 1,
-0.2626446, 1.093241, -1.001345, 1, 1, 1, 1, 1,
-0.2622627, -0.8828833, -2.465856, 1, 1, 1, 1, 1,
-0.2620985, -1.100558, -3.793359, 1, 1, 1, 1, 1,
-0.2505824, -0.04433579, -1.837431, 1, 1, 1, 1, 1,
-0.2480213, 0.8350923, 3.494378, 1, 1, 1, 1, 1,
-0.2441128, 0.05429339, -0.3835333, 1, 1, 1, 1, 1,
-0.2428528, 0.5893656, 1.408608, 1, 1, 1, 1, 1,
-0.2423743, 0.6170682, -0.4590865, 1, 1, 1, 1, 1,
-0.2414587, 0.8831341, -2.309174, 1, 1, 1, 1, 1,
-0.2401569, 0.4089344, 0.1349052, 1, 1, 1, 1, 1,
-0.2373357, -0.3202746, -1.304705, 1, 1, 1, 1, 1,
-0.2329544, -1.272808, -2.959342, 1, 1, 1, 1, 1,
-0.2298339, 1.011221, 0.1928031, 0, 0, 1, 1, 1,
-0.2284475, 0.7085269, -2.438189, 1, 0, 0, 1, 1,
-0.2212872, -0.4615781, -1.165804, 1, 0, 0, 1, 1,
-0.2157508, 0.6938611, -0.01330826, 1, 0, 0, 1, 1,
-0.2100513, -0.5664851, -2.481374, 1, 0, 0, 1, 1,
-0.2089595, -1.176643, -3.568208, 1, 0, 0, 1, 1,
-0.204483, 2.62229, -0.2983617, 0, 0, 0, 1, 1,
-0.2040231, -0.912089, -3.766959, 0, 0, 0, 1, 1,
-0.2029285, -0.8009605, -3.63938, 0, 0, 0, 1, 1,
-0.2012459, 1.076671, -0.2256051, 0, 0, 0, 1, 1,
-0.1993006, 1.699018, 1.182068, 0, 0, 0, 1, 1,
-0.1948989, -2.162337, -3.333829, 0, 0, 0, 1, 1,
-0.1948571, 0.2500955, -1.437135, 0, 0, 0, 1, 1,
-0.1938545, -1.754568, -1.278924, 1, 1, 1, 1, 1,
-0.1878145, 0.4963624, -0.9226572, 1, 1, 1, 1, 1,
-0.1845803, -1.064894, -3.755243, 1, 1, 1, 1, 1,
-0.1831333, 1.313912, 0.2267606, 1, 1, 1, 1, 1,
-0.1814626, -0.8713784, -3.006673, 1, 1, 1, 1, 1,
-0.178082, 0.5292784, 0.008721215, 1, 1, 1, 1, 1,
-0.1773077, 0.8782517, 1.541311, 1, 1, 1, 1, 1,
-0.1770856, 0.9157411, -0.4750117, 1, 1, 1, 1, 1,
-0.1767928, -1.143346, -4.203154, 1, 1, 1, 1, 1,
-0.175306, -2.10396, -2.579344, 1, 1, 1, 1, 1,
-0.1749556, -0.3568006, -1.510107, 1, 1, 1, 1, 1,
-0.1748785, 0.8396758, 0.3744642, 1, 1, 1, 1, 1,
-0.1706962, -1.126021, -1.341245, 1, 1, 1, 1, 1,
-0.1701316, -0.4635685, -2.31906, 1, 1, 1, 1, 1,
-0.1604789, 0.5595115, 0.6926181, 1, 1, 1, 1, 1,
-0.1584067, 0.4371752, -1.830956, 0, 0, 1, 1, 1,
-0.1573185, -0.1686969, -3.06493, 1, 0, 0, 1, 1,
-0.157088, 1.251107, 0.3737885, 1, 0, 0, 1, 1,
-0.1558115, -0.515218, -3.45549, 1, 0, 0, 1, 1,
-0.1543217, 0.8337403, -0.2611885, 1, 0, 0, 1, 1,
-0.1536376, 1.184711, 0.2858298, 1, 0, 0, 1, 1,
-0.1470632, -1.3557, -1.920732, 0, 0, 0, 1, 1,
-0.1455278, -0.2666622, -2.253195, 0, 0, 0, 1, 1,
-0.1446273, -1.103206, -4.170352, 0, 0, 0, 1, 1,
-0.1438944, -1.210546, -2.098212, 0, 0, 0, 1, 1,
-0.1430257, -0.9526529, -2.98155, 0, 0, 0, 1, 1,
-0.1422392, -0.3285754, -2.081211, 0, 0, 0, 1, 1,
-0.1386198, 0.3500837, -1.241787, 0, 0, 0, 1, 1,
-0.1371181, -0.2697625, -4.273654, 1, 1, 1, 1, 1,
-0.1332376, -0.192979, -1.08611, 1, 1, 1, 1, 1,
-0.1306892, -0.7543554, -2.592887, 1, 1, 1, 1, 1,
-0.1301758, 0.4847158, -0.4434133, 1, 1, 1, 1, 1,
-0.1299381, 1.081642, 0.675628, 1, 1, 1, 1, 1,
-0.1232424, 0.1891333, -0.8171135, 1, 1, 1, 1, 1,
-0.1230832, -0.4640043, -1.946514, 1, 1, 1, 1, 1,
-0.1208992, 0.3293774, 0.5011352, 1, 1, 1, 1, 1,
-0.1158089, 2.159933, -1.282932, 1, 1, 1, 1, 1,
-0.1095478, -1.102381, -4.154572, 1, 1, 1, 1, 1,
-0.1049346, -0.09858003, -2.518804, 1, 1, 1, 1, 1,
-0.1024775, 0.07007831, 0.3280474, 1, 1, 1, 1, 1,
-0.101566, -1.126641, -1.368949, 1, 1, 1, 1, 1,
-0.1001036, -1.623099, -1.321, 1, 1, 1, 1, 1,
-0.09474377, -0.9420243, -2.109727, 1, 1, 1, 1, 1,
-0.09172853, 0.3316548, -0.09335489, 0, 0, 1, 1, 1,
-0.08828765, 0.9002228, 1.480264, 1, 0, 0, 1, 1,
-0.08789029, -0.3375638, -2.817172, 1, 0, 0, 1, 1,
-0.08483342, 0.6303473, -0.4490612, 1, 0, 0, 1, 1,
-0.08085895, -0.7076734, -1.873217, 1, 0, 0, 1, 1,
-0.07711285, -1.01601, -5.796887, 1, 0, 0, 1, 1,
-0.07553508, 0.7428314, 0.1633457, 0, 0, 0, 1, 1,
-0.07502671, 0.01664836, -0.8677776, 0, 0, 0, 1, 1,
-0.06562661, -0.3717042, -0.9863653, 0, 0, 0, 1, 1,
-0.06313884, 0.9276231, -0.6503698, 0, 0, 0, 1, 1,
-0.06307071, 0.6824259, -1.677503, 0, 0, 0, 1, 1,
-0.0626903, -0.8020414, -3.656544, 0, 0, 0, 1, 1,
-0.05777935, 0.4511774, -0.09782194, 0, 0, 0, 1, 1,
-0.05752973, 0.7906051, 0.691583, 1, 1, 1, 1, 1,
-0.05564492, 1.359087, -1.02861, 1, 1, 1, 1, 1,
-0.05359603, -0.24336, -2.863845, 1, 1, 1, 1, 1,
-0.041382, 0.5901486, 0.1600481, 1, 1, 1, 1, 1,
-0.03862497, 1.181313, 0.5629164, 1, 1, 1, 1, 1,
-0.03598333, -0.6201792, -3.116235, 1, 1, 1, 1, 1,
-0.03516521, 0.8025085, 0.08041574, 1, 1, 1, 1, 1,
-0.02966362, -1.346297, -3.946982, 1, 1, 1, 1, 1,
-0.02634736, -0.6616545, -0.7393914, 1, 1, 1, 1, 1,
-0.02598294, 1.284117, 1.457406, 1, 1, 1, 1, 1,
-0.0259216, -0.8714156, -3.406988, 1, 1, 1, 1, 1,
-0.02551302, -0.2687621, -1.982394, 1, 1, 1, 1, 1,
-0.02347326, -2.414793, -2.345515, 1, 1, 1, 1, 1,
-0.0177975, 0.2060001, 0.9733363, 1, 1, 1, 1, 1,
-0.01491372, -1.11392, -4.031669, 1, 1, 1, 1, 1,
-0.01152868, -1.019786, -3.774271, 0, 0, 1, 1, 1,
-0.01087946, 1.643238, -0.6161399, 1, 0, 0, 1, 1,
-0.010604, 0.4451691, 0.2932596, 1, 0, 0, 1, 1,
-0.009992254, 0.1274045, -0.06650761, 1, 0, 0, 1, 1,
-0.001725229, 0.05597941, -0.2912477, 1, 0, 0, 1, 1,
-0.001015049, -0.2419183, -2.908445, 1, 0, 0, 1, 1,
0.004915533, 2.232876, 0.4719461, 0, 0, 0, 1, 1,
0.005795176, 0.3915835, 0.4456011, 0, 0, 0, 1, 1,
0.009987213, -0.3685328, 2.628305, 0, 0, 0, 1, 1,
0.01071333, 0.2300868, 0.5070856, 0, 0, 0, 1, 1,
0.01886027, -0.1171549, 2.163637, 0, 0, 0, 1, 1,
0.02018264, -0.568756, 4.095325, 0, 0, 0, 1, 1,
0.02326366, -0.1499409, 2.882647, 0, 0, 0, 1, 1,
0.02472047, -1.306221, 2.26645, 1, 1, 1, 1, 1,
0.02821148, -0.6614619, 4.324169, 1, 1, 1, 1, 1,
0.03047226, 0.09630292, 1.085625, 1, 1, 1, 1, 1,
0.0313766, 0.01112338, 0.05456295, 1, 1, 1, 1, 1,
0.03314407, -0.1931561, 1.504554, 1, 1, 1, 1, 1,
0.03338917, 0.921102, 1.199608, 1, 1, 1, 1, 1,
0.03761845, 3.303673, -0.6049554, 1, 1, 1, 1, 1,
0.03954476, 1.496044, 2.153533, 1, 1, 1, 1, 1,
0.03990388, -1.183247, 3.359859, 1, 1, 1, 1, 1,
0.04077144, 0.688764, -0.4262517, 1, 1, 1, 1, 1,
0.04412524, -0.2652723, 1.351448, 1, 1, 1, 1, 1,
0.0503326, 0.1767345, 0.7424963, 1, 1, 1, 1, 1,
0.05158375, -1.19635, 2.283039, 1, 1, 1, 1, 1,
0.05374118, 0.4768792, 0.4742657, 1, 1, 1, 1, 1,
0.05745386, 0.7873327, -0.586069, 1, 1, 1, 1, 1,
0.05789869, 1.518632, -0.5928708, 0, 0, 1, 1, 1,
0.05847434, 0.03928011, 0.747942, 1, 0, 0, 1, 1,
0.06409226, 0.8710398, -0.01362708, 1, 0, 0, 1, 1,
0.07162851, 2.041525, -0.4081505, 1, 0, 0, 1, 1,
0.07173488, 1.172034, -0.3259396, 1, 0, 0, 1, 1,
0.07787652, -0.615117, 4.145802, 1, 0, 0, 1, 1,
0.08036954, 0.1923655, 1.013822, 0, 0, 0, 1, 1,
0.08491895, 0.1147453, 1.105858, 0, 0, 0, 1, 1,
0.09650884, 0.3951488, 0.04561277, 0, 0, 0, 1, 1,
0.0972475, 0.3687088, -0.7338014, 0, 0, 0, 1, 1,
0.09769353, -0.4011418, 1.899728, 0, 0, 0, 1, 1,
0.09834851, 0.263056, 0.8388696, 0, 0, 0, 1, 1,
0.09906501, -1.277617, 3.13876, 0, 0, 0, 1, 1,
0.1044415, -0.4280948, 3.418548, 1, 1, 1, 1, 1,
0.1091952, -0.953274, 1.139268, 1, 1, 1, 1, 1,
0.1108082, -0.6717426, 1.797656, 1, 1, 1, 1, 1,
0.111151, 1.285813, -0.003809279, 1, 1, 1, 1, 1,
0.1142523, -0.8436688, 4.165308, 1, 1, 1, 1, 1,
0.1183534, 0.7025045, -0.4043326, 1, 1, 1, 1, 1,
0.1220461, 0.2715129, 0.3452026, 1, 1, 1, 1, 1,
0.1284011, 0.7566639, 0.1257315, 1, 1, 1, 1, 1,
0.12886, 0.1682852, 0.5092369, 1, 1, 1, 1, 1,
0.1295597, 0.5209998, 1.391755, 1, 1, 1, 1, 1,
0.1297572, -0.4540003, 3.049712, 1, 1, 1, 1, 1,
0.1346387, 0.2266294, 0.2002455, 1, 1, 1, 1, 1,
0.1358397, -1.211738, 3.471738, 1, 1, 1, 1, 1,
0.1383661, 0.491565, 2.811986, 1, 1, 1, 1, 1,
0.1407, -1.768929, 3.252397, 1, 1, 1, 1, 1,
0.1414468, 1.432597, -1.217602, 0, 0, 1, 1, 1,
0.1418021, 0.5742847, -0.9464053, 1, 0, 0, 1, 1,
0.1443158, 1.215995, 0.3691829, 1, 0, 0, 1, 1,
0.144893, -0.08149467, 2.223832, 1, 0, 0, 1, 1,
0.1455731, 0.7160053, 0.4064577, 1, 0, 0, 1, 1,
0.1459135, 0.5892242, -1.314548, 1, 0, 0, 1, 1,
0.1459647, -0.7287967, 2.491359, 0, 0, 0, 1, 1,
0.1479897, 0.1499521, 1.415022, 0, 0, 0, 1, 1,
0.1506403, -0.8366156, 4.634063, 0, 0, 0, 1, 1,
0.1527305, -0.3874427, 3.120265, 0, 0, 0, 1, 1,
0.1529059, -0.04541278, 0.4914134, 0, 0, 0, 1, 1,
0.1532373, 1.6936, -0.3287784, 0, 0, 0, 1, 1,
0.1538433, -1.780206, 2.559875, 0, 0, 0, 1, 1,
0.156324, -0.01176778, 2.721833, 1, 1, 1, 1, 1,
0.1567188, -0.3737719, 3.268312, 1, 1, 1, 1, 1,
0.1571309, 1.540446, -1.770233, 1, 1, 1, 1, 1,
0.157987, 0.2269625, 2.05379, 1, 1, 1, 1, 1,
0.1610512, -0.8304978, 1.898775, 1, 1, 1, 1, 1,
0.1632478, -0.06813166, 0.8386321, 1, 1, 1, 1, 1,
0.1678977, -0.8699284, 2.567446, 1, 1, 1, 1, 1,
0.1685774, -0.4098471, 3.021827, 1, 1, 1, 1, 1,
0.1730896, 0.01676271, 0.8869663, 1, 1, 1, 1, 1,
0.1752722, -0.990675, 4.377245, 1, 1, 1, 1, 1,
0.1764947, 1.088753, 0.8840334, 1, 1, 1, 1, 1,
0.186612, -1.534596, 2.807068, 1, 1, 1, 1, 1,
0.1878824, 0.1204776, 0.9147921, 1, 1, 1, 1, 1,
0.1903444, 0.2679326, 1.183142, 1, 1, 1, 1, 1,
0.1919838, 1.936195, 0.6613734, 1, 1, 1, 1, 1,
0.1925868, 2.090401, 0.5489331, 0, 0, 1, 1, 1,
0.1927058, -2.063409, 3.463832, 1, 0, 0, 1, 1,
0.1976235, 2.304939, 0.1276133, 1, 0, 0, 1, 1,
0.2026135, 0.8511046, -1.16067, 1, 0, 0, 1, 1,
0.2031117, -0.7236402, 2.052516, 1, 0, 0, 1, 1,
0.2041988, 0.1651097, 0.4451936, 1, 0, 0, 1, 1,
0.205165, -0.5933976, 2.096268, 0, 0, 0, 1, 1,
0.210775, -0.5669467, 2.770804, 0, 0, 0, 1, 1,
0.2147583, -0.04946138, 2.486795, 0, 0, 0, 1, 1,
0.2184687, 1.709266, -1.765037, 0, 0, 0, 1, 1,
0.2221658, -0.8692618, 2.583007, 0, 0, 0, 1, 1,
0.2233266, 1.752332, -0.2870595, 0, 0, 0, 1, 1,
0.2249229, -0.4012394, 3.172892, 0, 0, 0, 1, 1,
0.22664, 0.9513192, 0.8221666, 1, 1, 1, 1, 1,
0.2275497, 0.2226766, 2.813681, 1, 1, 1, 1, 1,
0.2299344, -0.5430218, 3.401958, 1, 1, 1, 1, 1,
0.2327995, -0.2148324, 2.058681, 1, 1, 1, 1, 1,
0.2331599, -0.3227112, 3.151084, 1, 1, 1, 1, 1,
0.2333944, 1.706623, 1.557102, 1, 1, 1, 1, 1,
0.2359108, 0.6837076, 0.3443736, 1, 1, 1, 1, 1,
0.2372498, -0.1093934, -1.37931, 1, 1, 1, 1, 1,
0.2372833, -0.6630275, 2.321286, 1, 1, 1, 1, 1,
0.2376019, 0.1132237, 2.65094, 1, 1, 1, 1, 1,
0.2379704, 0.4318894, 1.528899, 1, 1, 1, 1, 1,
0.2406353, -2.31481, 2.913386, 1, 1, 1, 1, 1,
0.2427814, -0.4038531, 1.589273, 1, 1, 1, 1, 1,
0.2452472, 0.8274145, -0.3132418, 1, 1, 1, 1, 1,
0.2471153, 0.735918, 0.6327595, 1, 1, 1, 1, 1,
0.2522544, -0.4391984, 3.440021, 0, 0, 1, 1, 1,
0.2663651, -0.9597538, 2.347742, 1, 0, 0, 1, 1,
0.267812, -1.925295, 4.083378, 1, 0, 0, 1, 1,
0.2721623, 0.9327716, 2.456441, 1, 0, 0, 1, 1,
0.2731791, -0.5168269, 1.72576, 1, 0, 0, 1, 1,
0.2737404, 1.177557, 0.4444904, 1, 0, 0, 1, 1,
0.2765176, 1.072257, 0.1749589, 0, 0, 0, 1, 1,
0.2766513, 0.9017133, 0.3588442, 0, 0, 0, 1, 1,
0.2782761, -1.365067, 2.371378, 0, 0, 0, 1, 1,
0.2803602, 0.7947464, -1.781027, 0, 0, 0, 1, 1,
0.2812946, 0.3865326, 0.08005312, 0, 0, 0, 1, 1,
0.2951941, 0.9298198, 0.6693778, 0, 0, 0, 1, 1,
0.301266, -1.403325, 3.81199, 0, 0, 0, 1, 1,
0.3029208, 0.5293118, 0.1176553, 1, 1, 1, 1, 1,
0.3037845, -0.09241987, 0.5627348, 1, 1, 1, 1, 1,
0.3038439, -0.658775, 2.184164, 1, 1, 1, 1, 1,
0.3052294, 1.029824, 0.3863715, 1, 1, 1, 1, 1,
0.3064033, 1.341302, 0.4810937, 1, 1, 1, 1, 1,
0.3087082, -0.4764298, 3.045338, 1, 1, 1, 1, 1,
0.3091022, 0.7304749, 0.3490901, 1, 1, 1, 1, 1,
0.3122264, -1.628963, 3.051508, 1, 1, 1, 1, 1,
0.3193664, 0.3360483, 1.900217, 1, 1, 1, 1, 1,
0.3194417, -1.135543, 5.075217, 1, 1, 1, 1, 1,
0.32252, 0.7102385, 1.643801, 1, 1, 1, 1, 1,
0.3274732, 1.475646, 0.4744287, 1, 1, 1, 1, 1,
0.3302713, 1.133807, 2.260427, 1, 1, 1, 1, 1,
0.3327726, -3.028429, 2.396406, 1, 1, 1, 1, 1,
0.3331493, -2.077995, 2.653611, 1, 1, 1, 1, 1,
0.3336424, -0.03321587, 2.796034, 0, 0, 1, 1, 1,
0.3338793, 0.1745276, -0.07101955, 1, 0, 0, 1, 1,
0.3365488, -0.6389155, 2.526797, 1, 0, 0, 1, 1,
0.3401476, 0.5091015, -0.2597368, 1, 0, 0, 1, 1,
0.3412677, -2.650004, 2.314357, 1, 0, 0, 1, 1,
0.343421, 0.7609125, 0.6051257, 1, 0, 0, 1, 1,
0.3470255, 0.8577091, 1.411391, 0, 0, 0, 1, 1,
0.3478415, -0.9317123, 3.410035, 0, 0, 0, 1, 1,
0.3506956, 0.5201252, 0.4090848, 0, 0, 0, 1, 1,
0.3516604, -0.4889011, 2.35776, 0, 0, 0, 1, 1,
0.3527371, 0.04997093, 0.6128397, 0, 0, 0, 1, 1,
0.3528188, -0.3744571, 2.774604, 0, 0, 0, 1, 1,
0.3531678, 0.116257, 0.6871045, 0, 0, 0, 1, 1,
0.3537513, 1.148196, -0.5737609, 1, 1, 1, 1, 1,
0.3717081, -0.4316484, 2.2792, 1, 1, 1, 1, 1,
0.3767878, -1.538484, 2.017198, 1, 1, 1, 1, 1,
0.3771068, 0.19934, -0.161926, 1, 1, 1, 1, 1,
0.3794471, 0.1514417, 0.8969499, 1, 1, 1, 1, 1,
0.3892663, 0.7301644, 1.190252, 1, 1, 1, 1, 1,
0.3921036, 1.966415, 0.2857431, 1, 1, 1, 1, 1,
0.392729, -1.961158, 4.276589, 1, 1, 1, 1, 1,
0.3958444, -0.2601127, 1.424904, 1, 1, 1, 1, 1,
0.4027651, -0.276731, 2.472742, 1, 1, 1, 1, 1,
0.4114527, -0.2268012, 1.110865, 1, 1, 1, 1, 1,
0.4169001, 0.1358865, 0.465997, 1, 1, 1, 1, 1,
0.4185864, -0.8583003, 2.432479, 1, 1, 1, 1, 1,
0.4192166, -0.9658215, 3.587536, 1, 1, 1, 1, 1,
0.4197912, 0.5651513, -0.1273267, 1, 1, 1, 1, 1,
0.4228397, -1.307053, 3.175336, 0, 0, 1, 1, 1,
0.4228612, 0.8818033, 1.678129, 1, 0, 0, 1, 1,
0.4237649, 0.7095203, 0.3555425, 1, 0, 0, 1, 1,
0.4244782, 1.327262, -0.7987189, 1, 0, 0, 1, 1,
0.426697, -0.1022075, 2.465886, 1, 0, 0, 1, 1,
0.4273709, -1.042381, 2.549611, 1, 0, 0, 1, 1,
0.4299976, -0.07965422, 1.794631, 0, 0, 0, 1, 1,
0.4311769, -0.5091645, 2.24273, 0, 0, 0, 1, 1,
0.4388448, -0.007319943, 0.9585379, 0, 0, 0, 1, 1,
0.4390358, -2.106544, 3.968292, 0, 0, 0, 1, 1,
0.4409746, -1.085271, 3.749424, 0, 0, 0, 1, 1,
0.4486659, -0.760592, 2.175948, 0, 0, 0, 1, 1,
0.4545937, -0.8029762, 1.782833, 0, 0, 0, 1, 1,
0.4548568, 0.9575588, 0.5086382, 1, 1, 1, 1, 1,
0.4634458, 1.688094, -0.5714995, 1, 1, 1, 1, 1,
0.4708917, -1.259743, 2.970454, 1, 1, 1, 1, 1,
0.473539, -0.390198, 2.228124, 1, 1, 1, 1, 1,
0.4795068, 1.868949, -0.8263715, 1, 1, 1, 1, 1,
0.4802986, 0.3712233, -1.165868, 1, 1, 1, 1, 1,
0.4828183, 0.7358366, 0.8803242, 1, 1, 1, 1, 1,
0.4843207, -0.07950973, 1.329984, 1, 1, 1, 1, 1,
0.4846824, 1.630057, -0.5651728, 1, 1, 1, 1, 1,
0.4894476, -0.09639625, 3.420943, 1, 1, 1, 1, 1,
0.5036812, -0.7608467, 2.982586, 1, 1, 1, 1, 1,
0.5038636, 0.08694045, 1.179643, 1, 1, 1, 1, 1,
0.5065392, -1.555443, 4.195816, 1, 1, 1, 1, 1,
0.5073083, -0.4220238, 2.857473, 1, 1, 1, 1, 1,
0.5074656, -0.5155054, 2.268245, 1, 1, 1, 1, 1,
0.5081505, -1.123345, 3.458305, 0, 0, 1, 1, 1,
0.5102636, 0.2629987, 1.627909, 1, 0, 0, 1, 1,
0.5147341, 0.07541131, 0.439823, 1, 0, 0, 1, 1,
0.5174198, 0.3168953, -0.2188827, 1, 0, 0, 1, 1,
0.5176366, -1.56778, 3.951785, 1, 0, 0, 1, 1,
0.5185836, 0.8400542, 0.9505115, 1, 0, 0, 1, 1,
0.5186032, -0.5352336, 2.378724, 0, 0, 0, 1, 1,
0.5243618, 0.7829072, 1.845984, 0, 0, 0, 1, 1,
0.5323813, 1.259279, -0.7973588, 0, 0, 0, 1, 1,
0.5336094, 1.4486, -0.6453715, 0, 0, 0, 1, 1,
0.5360128, 0.3658524, 0.4362119, 0, 0, 0, 1, 1,
0.5382408, 0.5387128, 2.940686, 0, 0, 0, 1, 1,
0.5390103, -1.24024, 2.462196, 0, 0, 0, 1, 1,
0.5423684, 0.4668534, 0.34288, 1, 1, 1, 1, 1,
0.5459639, -0.04009017, 0.8986465, 1, 1, 1, 1, 1,
0.5463649, -0.3779009, 3.32678, 1, 1, 1, 1, 1,
0.5475219, 0.8168285, 0.06307536, 1, 1, 1, 1, 1,
0.5503317, -0.3247311, 3.888767, 1, 1, 1, 1, 1,
0.5510926, 0.755925, 1.765424, 1, 1, 1, 1, 1,
0.5524648, 0.5837792, 1.117803, 1, 1, 1, 1, 1,
0.5537521, -0.5133439, 2.882279, 1, 1, 1, 1, 1,
0.5554819, -1.079589, 3.072042, 1, 1, 1, 1, 1,
0.5564005, -0.8146497, 1.700409, 1, 1, 1, 1, 1,
0.5601682, 0.5658706, 2.410955, 1, 1, 1, 1, 1,
0.5680343, -0.7023171, 2.576131, 1, 1, 1, 1, 1,
0.5691747, -0.5444659, 4.76293, 1, 1, 1, 1, 1,
0.5696969, -0.5759122, 1.140581, 1, 1, 1, 1, 1,
0.5700204, 0.1601043, 2.150795, 1, 1, 1, 1, 1,
0.5700313, 1.325169, 0.5712446, 0, 0, 1, 1, 1,
0.571031, 0.5439883, 0.8658502, 1, 0, 0, 1, 1,
0.5826142, 1.254134, 1.698218, 1, 0, 0, 1, 1,
0.5848424, 0.5851694, 3.279343, 1, 0, 0, 1, 1,
0.5864092, 0.8892192, -1.150617, 1, 0, 0, 1, 1,
0.5871359, 0.9529251, -0.8683857, 1, 0, 0, 1, 1,
0.5969593, 0.673524, 0.8870437, 0, 0, 0, 1, 1,
0.6005604, -0.2093102, 0.6682148, 0, 0, 0, 1, 1,
0.6007102, 1.516842, -0.4108429, 0, 0, 0, 1, 1,
0.6008075, -1.316702, 2.112026, 0, 0, 0, 1, 1,
0.6014894, 0.6931816, -1.465252, 0, 0, 0, 1, 1,
0.6057674, 0.03483325, 2.709036, 0, 0, 0, 1, 1,
0.609355, -0.8314751, 0.5153866, 0, 0, 0, 1, 1,
0.6094136, -0.2370454, 2.060769, 1, 1, 1, 1, 1,
0.6095636, -0.3714585, 1.3219, 1, 1, 1, 1, 1,
0.6106191, 0.7281644, -0.2107228, 1, 1, 1, 1, 1,
0.6113319, 0.3954162, 0.3207963, 1, 1, 1, 1, 1,
0.6117672, -1.138521, 4.354772, 1, 1, 1, 1, 1,
0.6117923, -0.7721654, 3.376144, 1, 1, 1, 1, 1,
0.6183603, 0.8505779, 0.6612226, 1, 1, 1, 1, 1,
0.6188556, -0.6126421, 3.492095, 1, 1, 1, 1, 1,
0.6196905, -0.1897867, 1.093116, 1, 1, 1, 1, 1,
0.6208805, 0.5014732, 1.752474, 1, 1, 1, 1, 1,
0.6221741, 0.8210269, 0.9579666, 1, 1, 1, 1, 1,
0.6262065, 1.053027, -0.2831424, 1, 1, 1, 1, 1,
0.6293988, 0.06963329, 2.016531, 1, 1, 1, 1, 1,
0.6312275, 0.9154766, -0.3885633, 1, 1, 1, 1, 1,
0.6370332, -0.4582986, 2.919023, 1, 1, 1, 1, 1,
0.6394379, -0.5280503, 4.987319, 0, 0, 1, 1, 1,
0.6423931, -1.210336, 2.525437, 1, 0, 0, 1, 1,
0.6434281, -0.1652621, 1.842887, 1, 0, 0, 1, 1,
0.650032, 1.617161, 0.03966443, 1, 0, 0, 1, 1,
0.6522875, -0.4903031, 1.816203, 1, 0, 0, 1, 1,
0.6543427, -0.4826817, 2.827345, 1, 0, 0, 1, 1,
0.6549935, -0.1290116, 1.481552, 0, 0, 0, 1, 1,
0.6618202, 0.6315824, 1.753397, 0, 0, 0, 1, 1,
0.665097, 1.086398, 0.6088444, 0, 0, 0, 1, 1,
0.6660396, -0.072216, 1.503509, 0, 0, 0, 1, 1,
0.6676269, 0.1090071, 0.7611113, 0, 0, 0, 1, 1,
0.6723573, -0.9918545, 4.739615, 0, 0, 0, 1, 1,
0.6785883, -0.1463891, 2.506487, 0, 0, 0, 1, 1,
0.6834849, -0.3641883, 0.8146967, 1, 1, 1, 1, 1,
0.6858473, -0.4425828, 2.519693, 1, 1, 1, 1, 1,
0.6896394, -1.623197, 1.243568, 1, 1, 1, 1, 1,
0.7066482, 0.4723287, -0.02231686, 1, 1, 1, 1, 1,
0.7069169, -1.374037, 4.030839, 1, 1, 1, 1, 1,
0.7081563, -0.3604013, 1.223674, 1, 1, 1, 1, 1,
0.7089664, -1.580576, 3.450691, 1, 1, 1, 1, 1,
0.7123624, -0.04643088, 2.343102, 1, 1, 1, 1, 1,
0.7181191, -1.908581, 1.097764, 1, 1, 1, 1, 1,
0.7242795, 1.243879, -0.342863, 1, 1, 1, 1, 1,
0.7315215, -1.915481, 1.427593, 1, 1, 1, 1, 1,
0.7316055, -0.08989346, 1.197171, 1, 1, 1, 1, 1,
0.7337279, -0.7310457, 2.947544, 1, 1, 1, 1, 1,
0.736371, -0.1423863, 1.92492, 1, 1, 1, 1, 1,
0.7383924, -0.7926573, 2.538296, 1, 1, 1, 1, 1,
0.739669, -0.6027461, 3.470705, 0, 0, 1, 1, 1,
0.7424298, 0.8630887, 1.384534, 1, 0, 0, 1, 1,
0.7430423, 0.1866306, -0.09627832, 1, 0, 0, 1, 1,
0.7482855, 1.035449, 2.793065, 1, 0, 0, 1, 1,
0.7483558, 0.6373582, 1.358976, 1, 0, 0, 1, 1,
0.7485514, -0.1637275, 1.751614, 1, 0, 0, 1, 1,
0.7487453, -0.9036247, 2.033084, 0, 0, 0, 1, 1,
0.7535399, 0.4758669, -1.494345, 0, 0, 0, 1, 1,
0.7555963, 2.704423, 1.29703, 0, 0, 0, 1, 1,
0.7573812, 0.5525194, -0.8047699, 0, 0, 0, 1, 1,
0.7622287, -0.8475834, 3.22978, 0, 0, 0, 1, 1,
0.7665284, 0.2604047, 1.258552, 0, 0, 0, 1, 1,
0.7739531, 0.4132997, 2.438198, 0, 0, 0, 1, 1,
0.7750359, 0.3115258, 1.24395, 1, 1, 1, 1, 1,
0.7775258, -1.487336, 2.543449, 1, 1, 1, 1, 1,
0.7863919, 2.85603, 1.694028, 1, 1, 1, 1, 1,
0.7871355, 0.0008649638, 1.387874, 1, 1, 1, 1, 1,
0.7924126, -1.602125, 3.711739, 1, 1, 1, 1, 1,
0.7958544, 0.8955782, 0.306272, 1, 1, 1, 1, 1,
0.7986902, 0.7264991, 0.3494514, 1, 1, 1, 1, 1,
0.8059648, 0.2699925, 3.241594, 1, 1, 1, 1, 1,
0.8060779, -0.3677123, 1.421965, 1, 1, 1, 1, 1,
0.8066059, -1.169994, 2.00939, 1, 1, 1, 1, 1,
0.8125851, 0.6342816, -1.744028, 1, 1, 1, 1, 1,
0.8177989, -0.2364197, 1.632752, 1, 1, 1, 1, 1,
0.819187, -1.106873, 3.528078, 1, 1, 1, 1, 1,
0.8239208, 1.623115, 1.110467, 1, 1, 1, 1, 1,
0.8306248, 0.8130336, 0.9980648, 1, 1, 1, 1, 1,
0.8317811, -1.065038, 2.266444, 0, 0, 1, 1, 1,
0.8391211, 0.5111626, 2.831436, 1, 0, 0, 1, 1,
0.8401843, 1.068683, 1.121194, 1, 0, 0, 1, 1,
0.8403549, -0.8889918, 1.737543, 1, 0, 0, 1, 1,
0.8415172, -0.2127461, 1.170586, 1, 0, 0, 1, 1,
0.8434156, 0.1148402, 2.069432, 1, 0, 0, 1, 1,
0.843669, 0.202379, 3.434537, 0, 0, 0, 1, 1,
0.8516945, 0.4459935, 0.7739272, 0, 0, 0, 1, 1,
0.8564743, 0.7511864, 2.95137, 0, 0, 0, 1, 1,
0.8635929, -1.562778, 1.413007, 0, 0, 0, 1, 1,
0.8645012, -0.3911311, 2.102779, 0, 0, 0, 1, 1,
0.8667042, 0.6592695, 1.938977, 0, 0, 0, 1, 1,
0.8686019, -1.235733, 1.165811, 0, 0, 0, 1, 1,
0.8716769, -0.1733406, 2.756077, 1, 1, 1, 1, 1,
0.8729157, -0.2842706, 3.483441, 1, 1, 1, 1, 1,
0.880482, -0.1700229, 1.06109, 1, 1, 1, 1, 1,
0.8841521, -0.3222573, 2.973194, 1, 1, 1, 1, 1,
0.8846691, -1.995407, 3.261317, 1, 1, 1, 1, 1,
0.8855874, -1.852938, 1.755054, 1, 1, 1, 1, 1,
0.8952351, 0.7049288, 1.51979, 1, 1, 1, 1, 1,
0.9116107, -0.321106, 1.381833, 1, 1, 1, 1, 1,
0.9251732, -0.03882491, 0.07440459, 1, 1, 1, 1, 1,
0.9257306, 0.3081723, 0.8816058, 1, 1, 1, 1, 1,
0.9266593, 1.56353, 2.281561, 1, 1, 1, 1, 1,
0.9295813, -0.1578876, 1.237971, 1, 1, 1, 1, 1,
0.9309852, -0.5666949, 2.808958, 1, 1, 1, 1, 1,
0.9329413, 1.439471, 1.068492, 1, 1, 1, 1, 1,
0.9341628, 0.0677231, 0.79373, 1, 1, 1, 1, 1,
0.9349973, 1.093664, 0.09967875, 0, 0, 1, 1, 1,
0.9502536, -0.0692327, 1.660426, 1, 0, 0, 1, 1,
0.9600062, -0.5651082, 3.928857, 1, 0, 0, 1, 1,
0.9607741, -0.6184837, 3.439073, 1, 0, 0, 1, 1,
0.9622157, -0.3938317, -0.2595397, 1, 0, 0, 1, 1,
0.9625465, 0.7387905, 1.792287, 1, 0, 0, 1, 1,
0.9674781, 1.087388, 1.672316, 0, 0, 0, 1, 1,
0.9688075, 0.5249138, 0.3325696, 0, 0, 0, 1, 1,
0.9782402, -0.8360979, 2.818295, 0, 0, 0, 1, 1,
0.9782515, 0.8347721, 0.291906, 0, 0, 0, 1, 1,
0.9830928, 0.3372732, 1.546309, 0, 0, 0, 1, 1,
0.9889426, -1.434939, 3.674994, 0, 0, 0, 1, 1,
0.9913464, 0.9772807, -0.590823, 0, 0, 0, 1, 1,
0.9916278, 1.021568, 0.7005825, 1, 1, 1, 1, 1,
1.000985, 0.2335944, 2.953538, 1, 1, 1, 1, 1,
1.001392, -0.946693, 2.655289, 1, 1, 1, 1, 1,
1.005363, -0.8167955, 2.845079, 1, 1, 1, 1, 1,
1.006922, -1.76422, 2.572078, 1, 1, 1, 1, 1,
1.007306, 1.041714, -0.1776933, 1, 1, 1, 1, 1,
1.007662, -0.9061278, 3.128253, 1, 1, 1, 1, 1,
1.010168, 0.1299068, 2.935308, 1, 1, 1, 1, 1,
1.015179, 1.60009, 1.232127, 1, 1, 1, 1, 1,
1.015534, -0.1527553, 2.699781, 1, 1, 1, 1, 1,
1.015627, 0.09152362, 1.653738, 1, 1, 1, 1, 1,
1.033345, 0.7525465, 1.323354, 1, 1, 1, 1, 1,
1.038644, -0.8055279, 3.493709, 1, 1, 1, 1, 1,
1.039292, 0.4247065, 0.3014237, 1, 1, 1, 1, 1,
1.046234, 1.522509, 1.177372, 1, 1, 1, 1, 1,
1.056023, 0.4831188, -0.600559, 0, 0, 1, 1, 1,
1.069307, 1.157715, 0.5334008, 1, 0, 0, 1, 1,
1.070845, -0.3664048, 0.9691918, 1, 0, 0, 1, 1,
1.08457, -0.8808331, 3.249524, 1, 0, 0, 1, 1,
1.084777, 0.5523061, 1.930122, 1, 0, 0, 1, 1,
1.087076, 1.637592, 2.672934, 1, 0, 0, 1, 1,
1.091809, -0.2313011, 1.429762, 0, 0, 0, 1, 1,
1.095325, -0.8296982, 1.165141, 0, 0, 0, 1, 1,
1.108618, -0.4843613, 2.145022, 0, 0, 0, 1, 1,
1.119825, 1.400028, 0.7579755, 0, 0, 0, 1, 1,
1.12287, 1.061101, 2.937705, 0, 0, 0, 1, 1,
1.125812, 0.3703776, 1.728486, 0, 0, 0, 1, 1,
1.126516, -0.01098046, 0.7475554, 0, 0, 0, 1, 1,
1.127477, 0.9556462, 2.824432, 1, 1, 1, 1, 1,
1.144602, 0.3224398, 1.259273, 1, 1, 1, 1, 1,
1.14956, -1.021861, 1.429582, 1, 1, 1, 1, 1,
1.150738, 2.436305, -0.1079471, 1, 1, 1, 1, 1,
1.15554, 1.531548, 1.626397, 1, 1, 1, 1, 1,
1.16257, -1.106821, 2.408304, 1, 1, 1, 1, 1,
1.169136, 1.593004, 1.028011, 1, 1, 1, 1, 1,
1.175655, -1.027684, 4.023283, 1, 1, 1, 1, 1,
1.176391, 0.4924788, 1.304527, 1, 1, 1, 1, 1,
1.177885, 0.8219856, 1.016167, 1, 1, 1, 1, 1,
1.188537, -0.3679722, 0.724478, 1, 1, 1, 1, 1,
1.195882, -0.8679712, 1.419403, 1, 1, 1, 1, 1,
1.198922, 2.060394, 0.4580413, 1, 1, 1, 1, 1,
1.201701, 0.6372674, 1.171497, 1, 1, 1, 1, 1,
1.203168, 2.190555, 1.370378, 1, 1, 1, 1, 1,
1.203266, -0.4517329, 1.637136, 0, 0, 1, 1, 1,
1.210257, -0.2004276, 2.227497, 1, 0, 0, 1, 1,
1.215111, 2.346693, 0.4287136, 1, 0, 0, 1, 1,
1.217584, -0.5852216, 0.6322967, 1, 0, 0, 1, 1,
1.219283, -1.10458, 1.665566, 1, 0, 0, 1, 1,
1.221121, 0.6591605, 0.6173707, 1, 0, 0, 1, 1,
1.222719, -0.8507199, 1.669916, 0, 0, 0, 1, 1,
1.246951, 0.495265, 1.098355, 0, 0, 0, 1, 1,
1.248504, 0.4768984, 1.439292, 0, 0, 0, 1, 1,
1.254468, -1.435404, 3.488457, 0, 0, 0, 1, 1,
1.256628, -0.4211351, 2.082477, 0, 0, 0, 1, 1,
1.263929, -1.018818, 2.344066, 0, 0, 0, 1, 1,
1.273162, -0.5183026, 2.142867, 0, 0, 0, 1, 1,
1.276128, 0.02424647, 0.5096784, 1, 1, 1, 1, 1,
1.277026, 2.239288, -1.335518, 1, 1, 1, 1, 1,
1.277184, 0.993444, 0.4756296, 1, 1, 1, 1, 1,
1.290819, 0.4550441, 3.688096, 1, 1, 1, 1, 1,
1.293754, 0.4598944, 0.8345764, 1, 1, 1, 1, 1,
1.30032, 1.213354, 1.656792, 1, 1, 1, 1, 1,
1.305177, -0.6842974, 3.098057, 1, 1, 1, 1, 1,
1.309136, 0.07158674, 2.766145, 1, 1, 1, 1, 1,
1.316393, -1.396233, 1.488649, 1, 1, 1, 1, 1,
1.319582, -1.183653, 0.7973167, 1, 1, 1, 1, 1,
1.31978, -0.7900789, 1.7546, 1, 1, 1, 1, 1,
1.320523, 0.5198475, -0.8893423, 1, 1, 1, 1, 1,
1.320984, 0.6983919, 1.407242, 1, 1, 1, 1, 1,
1.340629, 1.193671, 1.451708, 1, 1, 1, 1, 1,
1.351163, 0.7503742, -0.6237296, 1, 1, 1, 1, 1,
1.352968, 0.4643773, -0.318787, 0, 0, 1, 1, 1,
1.369381, -0.07848573, 0.5856489, 1, 0, 0, 1, 1,
1.37091, -1.537692, 0.8283114, 1, 0, 0, 1, 1,
1.371023, 1.763916, 1.333636, 1, 0, 0, 1, 1,
1.38346, 1.261607, 1.76573, 1, 0, 0, 1, 1,
1.389644, -0.3852765, 1.281769, 1, 0, 0, 1, 1,
1.401585, -1.648251, 3.016712, 0, 0, 0, 1, 1,
1.420367, -0.2210827, 0.5116066, 0, 0, 0, 1, 1,
1.424733, -1.128273, 0.7330381, 0, 0, 0, 1, 1,
1.425126, 0.429561, 0.2198565, 0, 0, 0, 1, 1,
1.428316, 0.3698491, 0.732021, 0, 0, 0, 1, 1,
1.457666, -2.236289, 3.805935, 0, 0, 0, 1, 1,
1.462402, -1.929396, 2.323912, 0, 0, 0, 1, 1,
1.471157, -1.779496, 2.987767, 1, 1, 1, 1, 1,
1.472853, -1.009415, 0.02264052, 1, 1, 1, 1, 1,
1.476964, -0.09227636, 2.090346, 1, 1, 1, 1, 1,
1.502514, 0.7190731, 0.6044509, 1, 1, 1, 1, 1,
1.506542, 1.143458, 2.279162, 1, 1, 1, 1, 1,
1.510283, -1.451838, 2.635848, 1, 1, 1, 1, 1,
1.510552, 0.3945217, 2.315728, 1, 1, 1, 1, 1,
1.518387, 0.2278086, 1.746836, 1, 1, 1, 1, 1,
1.544071, -2.344593, 3.089407, 1, 1, 1, 1, 1,
1.545093, 0.1334312, 1.484305, 1, 1, 1, 1, 1,
1.54577, 0.1989512, 0.1864288, 1, 1, 1, 1, 1,
1.54792, -0.5662006, 2.766566, 1, 1, 1, 1, 1,
1.566679, 1.81704, 2.176423, 1, 1, 1, 1, 1,
1.603416, -0.904398, 0.2851963, 1, 1, 1, 1, 1,
1.610581, -0.2629414, 2.875183, 1, 1, 1, 1, 1,
1.613292, -0.135422, -0.367856, 0, 0, 1, 1, 1,
1.62778, -0.5768248, 0.5878335, 1, 0, 0, 1, 1,
1.629464, 0.4375193, 2.398806, 1, 0, 0, 1, 1,
1.637037, 0.4948642, 1.215063, 1, 0, 0, 1, 1,
1.653291, 0.1533616, 0.8387845, 1, 0, 0, 1, 1,
1.697912, -0.4681678, 1.331523, 1, 0, 0, 1, 1,
1.70265, -0.8947531, 1.944396, 0, 0, 0, 1, 1,
1.710908, 0.3590552, 2.92351, 0, 0, 0, 1, 1,
1.713099, -0.9107609, 0.7022377, 0, 0, 0, 1, 1,
1.713387, 0.7084956, 2.460744, 0, 0, 0, 1, 1,
1.718211, -0.04408517, 1.73649, 0, 0, 0, 1, 1,
1.728847, -0.4894391, 1.885113, 0, 0, 0, 1, 1,
1.734532, 0.1723016, 2.070036, 0, 0, 0, 1, 1,
1.749769, 0.7270092, 0.6210671, 1, 1, 1, 1, 1,
1.755659, -2.63385, 1.6904, 1, 1, 1, 1, 1,
1.766732, 0.864553, -0.2571128, 1, 1, 1, 1, 1,
1.797537, -0.1781419, 3.810792, 1, 1, 1, 1, 1,
1.828454, 0.04919875, 1.782237, 1, 1, 1, 1, 1,
1.873302, -0.2895708, 1.975719, 1, 1, 1, 1, 1,
1.893333, -0.8123091, 1.02289, 1, 1, 1, 1, 1,
1.907038, 0.03634438, 4.056613, 1, 1, 1, 1, 1,
1.91579, 0.1021035, 0.09128483, 1, 1, 1, 1, 1,
1.920186, -0.9328021, 0.5262214, 1, 1, 1, 1, 1,
1.92118, -0.2460502, 2.062818, 1, 1, 1, 1, 1,
1.974932, -0.5021411, 2.097646, 1, 1, 1, 1, 1,
2.021292, 0.3489597, 1.775863, 1, 1, 1, 1, 1,
2.048023, -0.5829287, 2.961276, 1, 1, 1, 1, 1,
2.062465, 2.662591, 0.8744488, 1, 1, 1, 1, 1,
2.06904, -1.349702, 2.167875, 0, 0, 1, 1, 1,
2.076186, -2.364768, 3.999883, 1, 0, 0, 1, 1,
2.122047, 1.002259, 0.4434578, 1, 0, 0, 1, 1,
2.136823, 0.9659785, 1.258952, 1, 0, 0, 1, 1,
2.155909, -0.1174241, 3.430449, 1, 0, 0, 1, 1,
2.204136, -1.305007, 1.426217, 1, 0, 0, 1, 1,
2.2571, -2.82618, 2.005019, 0, 0, 0, 1, 1,
2.267209, 0.7617661, 0.9698578, 0, 0, 0, 1, 1,
2.272367, 1.576037, -0.08474348, 0, 0, 0, 1, 1,
2.372045, 1.023541, -0.0432076, 0, 0, 0, 1, 1,
2.467916, -2.024311, 1.628118, 0, 0, 0, 1, 1,
2.547685, -2.624731, 1.733347, 0, 0, 0, 1, 1,
2.641427, -0.4744461, -1.822731, 0, 0, 0, 1, 1,
2.685028, -0.269481, 1.965309, 1, 1, 1, 1, 1,
2.701281, 0.175098, 1.086361, 1, 1, 1, 1, 1,
2.702035, -0.2683895, 0.3503321, 1, 1, 1, 1, 1,
2.795034, 0.09970643, 1.0064, 1, 1, 1, 1, 1,
2.82579, 1.001395, 0.6271569, 1, 1, 1, 1, 1,
2.854719, -1.003758, 0.9907026, 1, 1, 1, 1, 1,
2.900644, -0.4023595, 0.1498562, 1, 1, 1, 1, 1
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
var radius = 9.661928;
var distance = 33.93711;
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
mvMatrix.translate( 0.3657566, -0.1570196, 0.3608351 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.93711);
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
