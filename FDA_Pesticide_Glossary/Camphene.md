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
-3.799223, -0.3509457, -3.105239, 1, 0, 0, 1,
-3.097896, -0.3852773, -2.163116, 1, 0.007843138, 0, 1,
-2.725775, -0.04472043, -1.398033, 1, 0.01176471, 0, 1,
-2.533696, 1.858641, 1.983727, 1, 0.01960784, 0, 1,
-2.499647, 0.5450424, -1.614567, 1, 0.02352941, 0, 1,
-2.4696, -1.420106, -2.887363, 1, 0.03137255, 0, 1,
-2.46247, -3.075033, -2.371857, 1, 0.03529412, 0, 1,
-2.419155, -0.3986216, -0.1612905, 1, 0.04313726, 0, 1,
-2.418149, 2.122067, -1.43227, 1, 0.04705882, 0, 1,
-2.393108, 0.5147887, -1.645923, 1, 0.05490196, 0, 1,
-2.384362, 0.8435045, -0.5414951, 1, 0.05882353, 0, 1,
-2.301085, -0.08087361, -0.2800717, 1, 0.06666667, 0, 1,
-2.290492, 1.442209, -1.794003, 1, 0.07058824, 0, 1,
-2.245406, -0.06336592, -2.381321, 1, 0.07843138, 0, 1,
-2.240148, 0.4324519, -3.032702, 1, 0.08235294, 0, 1,
-2.229727, -0.3199684, 0.03904657, 1, 0.09019608, 0, 1,
-2.215322, -0.723151, -1.86553, 1, 0.09411765, 0, 1,
-2.197179, -1.127027, -1.708047, 1, 0.1019608, 0, 1,
-2.147694, 1.58565, 0.1805113, 1, 0.1098039, 0, 1,
-2.106717, -0.4803148, -0.08531437, 1, 0.1137255, 0, 1,
-2.09953, 0.1295724, 0.3879394, 1, 0.1215686, 0, 1,
-2.069282, 0.7326025, -0.5303103, 1, 0.1254902, 0, 1,
-2.050967, 2.736255, -0.4217565, 1, 0.1333333, 0, 1,
-2.019984, 0.9139891, -0.261829, 1, 0.1372549, 0, 1,
-2.019093, 0.04195476, -0.3101349, 1, 0.145098, 0, 1,
-2.009621, 1.14242, -3.2554, 1, 0.1490196, 0, 1,
-1.999667, 0.8571733, -1.615604, 1, 0.1568628, 0, 1,
-1.991499, 0.5793123, 0.1412122, 1, 0.1607843, 0, 1,
-1.96623, 0.6354068, -0.4933398, 1, 0.1686275, 0, 1,
-1.955603, 0.546703, -0.8548947, 1, 0.172549, 0, 1,
-1.95274, -0.04098036, -2.287308, 1, 0.1803922, 0, 1,
-1.950464, -0.2162668, -2.131545, 1, 0.1843137, 0, 1,
-1.948503, -0.9229847, -0.7694866, 1, 0.1921569, 0, 1,
-1.945176, -2.843297, -2.711365, 1, 0.1960784, 0, 1,
-1.940149, -2.396002, -2.947457, 1, 0.2039216, 0, 1,
-1.90666, -0.2054008, -0.3643368, 1, 0.2117647, 0, 1,
-1.904255, 1.077659, 0.2860841, 1, 0.2156863, 0, 1,
-1.904092, 1.700633, -0.8242391, 1, 0.2235294, 0, 1,
-1.886224, -0.735274, -2.001748, 1, 0.227451, 0, 1,
-1.868111, -0.4487185, -1.967212, 1, 0.2352941, 0, 1,
-1.846734, -0.643118, -3.442614, 1, 0.2392157, 0, 1,
-1.831881, -1.627572, -0.802572, 1, 0.2470588, 0, 1,
-1.808452, 0.8854414, -0.8432474, 1, 0.2509804, 0, 1,
-1.805303, -1.645957, -3.548741, 1, 0.2588235, 0, 1,
-1.790765, 0.8629004, -2.337707, 1, 0.2627451, 0, 1,
-1.781108, -1.069758, -1.368097, 1, 0.2705882, 0, 1,
-1.780466, 1.662464, -0.5309811, 1, 0.2745098, 0, 1,
-1.772216, 0.7786908, -0.6532717, 1, 0.282353, 0, 1,
-1.761688, 0.00173869, -1.897691, 1, 0.2862745, 0, 1,
-1.733521, -0.007230437, -0.4277234, 1, 0.2941177, 0, 1,
-1.722904, -0.1428219, -1.082454, 1, 0.3019608, 0, 1,
-1.701284, 1.225965, -0.5858999, 1, 0.3058824, 0, 1,
-1.691112, -0.09037121, -1.167522, 1, 0.3137255, 0, 1,
-1.688553, -1.009706, -2.226043, 1, 0.3176471, 0, 1,
-1.661119, -1.503859, -0.2727879, 1, 0.3254902, 0, 1,
-1.660722, 0.7469598, -0.2658757, 1, 0.3294118, 0, 1,
-1.652784, -0.2309165, -1.251304, 1, 0.3372549, 0, 1,
-1.649955, 0.256638, -0.6412261, 1, 0.3411765, 0, 1,
-1.641076, -0.7205932, -1.202547, 1, 0.3490196, 0, 1,
-1.636871, 1.471757, -2.458077, 1, 0.3529412, 0, 1,
-1.636793, 0.3995981, -0.6014342, 1, 0.3607843, 0, 1,
-1.626636, 1.016612, -2.054518, 1, 0.3647059, 0, 1,
-1.626601, -2.018288, -3.412779, 1, 0.372549, 0, 1,
-1.618791, -0.06629282, -2.200169, 1, 0.3764706, 0, 1,
-1.61277, 0.5543766, 0.3352142, 1, 0.3843137, 0, 1,
-1.607581, -1.577947, -2.410415, 1, 0.3882353, 0, 1,
-1.588919, 0.2145965, -3.048298, 1, 0.3960784, 0, 1,
-1.576406, -0.1696256, -1.673305, 1, 0.4039216, 0, 1,
-1.573131, -1.40703, -0.9482247, 1, 0.4078431, 0, 1,
-1.557338, 1.126265, 0.4814529, 1, 0.4156863, 0, 1,
-1.554807, 1.730025, -1.333004, 1, 0.4196078, 0, 1,
-1.549606, 2.237426, -1.482454, 1, 0.427451, 0, 1,
-1.549416, 0.2013228, -1.817519, 1, 0.4313726, 0, 1,
-1.548887, 1.843933, -0.2449621, 1, 0.4392157, 0, 1,
-1.541989, -0.723431, -1.66479, 1, 0.4431373, 0, 1,
-1.538449, 1.95273, -1.570341, 1, 0.4509804, 0, 1,
-1.535798, 1.282171, -0.7774108, 1, 0.454902, 0, 1,
-1.526121, 2.176007, 0.07933082, 1, 0.4627451, 0, 1,
-1.51517, 0.3874238, -2.477084, 1, 0.4666667, 0, 1,
-1.513428, 1.996612, -0.8018155, 1, 0.4745098, 0, 1,
-1.511157, 0.1369044, -0.2924785, 1, 0.4784314, 0, 1,
-1.507903, -0.9930289, -0.8038209, 1, 0.4862745, 0, 1,
-1.482162, -0.2697559, -1.64157, 1, 0.4901961, 0, 1,
-1.478861, -0.6163253, -2.090693, 1, 0.4980392, 0, 1,
-1.463955, 0.9544407, -0.1796077, 1, 0.5058824, 0, 1,
-1.459837, -0.3824423, -2.671627, 1, 0.509804, 0, 1,
-1.457661, -0.8992808, -1.584874, 1, 0.5176471, 0, 1,
-1.4554, 2.227264, -0.6080294, 1, 0.5215687, 0, 1,
-1.446425, 0.6577919, -1.426858, 1, 0.5294118, 0, 1,
-1.442066, -0.3151454, -1.925514, 1, 0.5333334, 0, 1,
-1.428327, -0.9561179, -0.7943292, 1, 0.5411765, 0, 1,
-1.403528, -1.939436, -1.730795, 1, 0.5450981, 0, 1,
-1.402949, 1.395536, -2.78256, 1, 0.5529412, 0, 1,
-1.390757, 0.4460935, -2.711217, 1, 0.5568628, 0, 1,
-1.377658, -0.4150849, -1.717432, 1, 0.5647059, 0, 1,
-1.362816, 1.259427, -0.6393203, 1, 0.5686275, 0, 1,
-1.338607, 1.356118, -0.8318377, 1, 0.5764706, 0, 1,
-1.326487, -0.8209506, -1.840525, 1, 0.5803922, 0, 1,
-1.303429, -0.8717695, -0.1986605, 1, 0.5882353, 0, 1,
-1.300356, 1.189937, -0.07679481, 1, 0.5921569, 0, 1,
-1.283606, -1.886271, -2.539459, 1, 0.6, 0, 1,
-1.270966, -0.617044, -2.078416, 1, 0.6078432, 0, 1,
-1.257562, 1.748904, -0.02457795, 1, 0.6117647, 0, 1,
-1.256629, -1.454994, -1.949954, 1, 0.6196079, 0, 1,
-1.248951, -0.2385514, -4.586914, 1, 0.6235294, 0, 1,
-1.246224, -1.459015, -0.7063135, 1, 0.6313726, 0, 1,
-1.242923, 0.1230672, -1.289257, 1, 0.6352941, 0, 1,
-1.223937, 1.582195, -0.8153468, 1, 0.6431373, 0, 1,
-1.206359, -0.9476803, -1.8509, 1, 0.6470588, 0, 1,
-1.203595, -1.035465, -2.346417, 1, 0.654902, 0, 1,
-1.195592, 0.02634549, -3.898811, 1, 0.6588235, 0, 1,
-1.179754, -1.335436, -1.470985, 1, 0.6666667, 0, 1,
-1.177673, -0.6942303, -1.95084, 1, 0.6705883, 0, 1,
-1.16932, 0.3918507, -3.633584, 1, 0.6784314, 0, 1,
-1.163059, 0.9966925, -0.3809896, 1, 0.682353, 0, 1,
-1.162449, 0.7310781, -2.521839, 1, 0.6901961, 0, 1,
-1.156754, -0.1200137, -3.16165, 1, 0.6941177, 0, 1,
-1.155125, 0.8597503, -1.455875, 1, 0.7019608, 0, 1,
-1.146755, -0.5507256, -2.557098, 1, 0.7098039, 0, 1,
-1.145209, 0.1841109, -1.493587, 1, 0.7137255, 0, 1,
-1.143854, -1.38711, -3.433821, 1, 0.7215686, 0, 1,
-1.138647, 1.839058, -1.190103, 1, 0.7254902, 0, 1,
-1.115053, 0.793646, -1.095915, 1, 0.7333333, 0, 1,
-1.1143, -0.08954687, 0.3296805, 1, 0.7372549, 0, 1,
-1.105917, -1.071531, -3.129464, 1, 0.7450981, 0, 1,
-1.100656, 1.152537, -2.269919, 1, 0.7490196, 0, 1,
-1.093834, -0.8612691, -2.382799, 1, 0.7568628, 0, 1,
-1.093257, 0.3862424, 0.9981292, 1, 0.7607843, 0, 1,
-1.087089, -0.9633362, -2.2836, 1, 0.7686275, 0, 1,
-1.086994, 0.3316908, -0.9331553, 1, 0.772549, 0, 1,
-1.084682, 1.542183, -0.21783, 1, 0.7803922, 0, 1,
-1.083727, -0.5890807, -1.759876, 1, 0.7843137, 0, 1,
-1.078161, 0.1806892, -2.32336, 1, 0.7921569, 0, 1,
-1.070705, -0.9278047, -3.561367, 1, 0.7960784, 0, 1,
-1.054745, 0.04416353, -2.377942, 1, 0.8039216, 0, 1,
-1.051155, 0.5063601, -0.5508524, 1, 0.8117647, 0, 1,
-1.044553, 0.6566054, -0.3682009, 1, 0.8156863, 0, 1,
-1.033568, 0.6707087, 0.1568865, 1, 0.8235294, 0, 1,
-1.030259, 0.9052535, -1.41855, 1, 0.827451, 0, 1,
-1.027284, -0.4654828, -3.484617, 1, 0.8352941, 0, 1,
-1.027245, -0.3512046, -3.227865, 1, 0.8392157, 0, 1,
-1.0253, -0.9004472, -1.168708, 1, 0.8470588, 0, 1,
-1.02375, 1.013976, -0.5942264, 1, 0.8509804, 0, 1,
-1.023049, -0.7699707, -1.974915, 1, 0.8588235, 0, 1,
-1.009588, 1.489255, -0.9214758, 1, 0.8627451, 0, 1,
-1.009017, 1.298449, -0.4518974, 1, 0.8705882, 0, 1,
-1.005276, -0.3427199, -3.691717, 1, 0.8745098, 0, 1,
-1.00445, 1.025152, -1.708402, 1, 0.8823529, 0, 1,
-1.003444, -0.4261735, -3.985856, 1, 0.8862745, 0, 1,
-0.992779, 0.2792931, 0.3634031, 1, 0.8941177, 0, 1,
-0.9884237, -0.02540183, -2.02782, 1, 0.8980392, 0, 1,
-0.9793344, -0.4259399, -1.454039, 1, 0.9058824, 0, 1,
-0.9781684, -0.2440199, -3.028103, 1, 0.9137255, 0, 1,
-0.9767605, 1.153781, 0.1090217, 1, 0.9176471, 0, 1,
-0.9709262, 0.6577165, -1.039638, 1, 0.9254902, 0, 1,
-0.968529, -0.7317606, -2.795859, 1, 0.9294118, 0, 1,
-0.9670987, -0.7648437, -2.187896, 1, 0.9372549, 0, 1,
-0.966794, -0.3755298, -1.268725, 1, 0.9411765, 0, 1,
-0.964912, 1.488637, 0.9478723, 1, 0.9490196, 0, 1,
-0.9638908, 0.4185271, -1.254449, 1, 0.9529412, 0, 1,
-0.9632326, -1.27478, -4.210532, 1, 0.9607843, 0, 1,
-0.9516062, -0.04079733, -1.365537, 1, 0.9647059, 0, 1,
-0.9496565, -0.05183982, -1.506108, 1, 0.972549, 0, 1,
-0.9490153, 0.2209513, -0.3604368, 1, 0.9764706, 0, 1,
-0.9449393, -0.3234029, -2.725257, 1, 0.9843137, 0, 1,
-0.9402656, -0.254822, -1.196692, 1, 0.9882353, 0, 1,
-0.9281548, 0.5776596, -0.5414578, 1, 0.9960784, 0, 1,
-0.9168611, -0.03535981, -1.060145, 0.9960784, 1, 0, 1,
-0.9167547, -0.5431898, -2.736878, 0.9921569, 1, 0, 1,
-0.9159853, -1.27304, -3.195314, 0.9843137, 1, 0, 1,
-0.9136032, 1.005768, -2.699874, 0.9803922, 1, 0, 1,
-0.9076499, -0.891236, -2.045782, 0.972549, 1, 0, 1,
-0.899452, -0.8122872, -2.620184, 0.9686275, 1, 0, 1,
-0.8987023, -1.76351, -2.526903, 0.9607843, 1, 0, 1,
-0.8981625, 1.715253, -0.5777944, 0.9568627, 1, 0, 1,
-0.8958086, -0.4487563, 0.7632135, 0.9490196, 1, 0, 1,
-0.8886089, -0.02663031, -2.058886, 0.945098, 1, 0, 1,
-0.8875274, 0.8597901, -1.007666, 0.9372549, 1, 0, 1,
-0.8867387, -0.0853136, 0.0917955, 0.9333333, 1, 0, 1,
-0.8839639, -0.4433078, -2.477767, 0.9254902, 1, 0, 1,
-0.8785892, -0.3523057, -3.376614, 0.9215686, 1, 0, 1,
-0.8746429, 0.2250951, -1.287995, 0.9137255, 1, 0, 1,
-0.873733, -0.8909759, -3.762923, 0.9098039, 1, 0, 1,
-0.8721898, 0.1900385, -2.023938, 0.9019608, 1, 0, 1,
-0.8658451, -0.01326289, -0.8074129, 0.8941177, 1, 0, 1,
-0.8650217, 0.3428728, -1.15967, 0.8901961, 1, 0, 1,
-0.8569055, -1.84376, -1.873842, 0.8823529, 1, 0, 1,
-0.8554649, 0.1144895, -1.570094, 0.8784314, 1, 0, 1,
-0.8535165, 0.4541479, -1.859808, 0.8705882, 1, 0, 1,
-0.8529516, -1.74414, -2.095201, 0.8666667, 1, 0, 1,
-0.8475709, 0.1345787, -0.1636126, 0.8588235, 1, 0, 1,
-0.8469905, 0.3270845, -1.092314, 0.854902, 1, 0, 1,
-0.8374346, -1.469633, -3.701352, 0.8470588, 1, 0, 1,
-0.8306077, -0.7388514, -2.721622, 0.8431373, 1, 0, 1,
-0.8288035, -1.455277, -2.720459, 0.8352941, 1, 0, 1,
-0.828565, -1.766044, -0.4435232, 0.8313726, 1, 0, 1,
-0.825009, 0.3314415, -0.9010549, 0.8235294, 1, 0, 1,
-0.8248664, -0.5703211, -2.372977, 0.8196079, 1, 0, 1,
-0.8218608, -0.5155109, -1.531421, 0.8117647, 1, 0, 1,
-0.8208951, -1.088766, -4.757418, 0.8078431, 1, 0, 1,
-0.8201942, -1.582426, -1.076452, 0.8, 1, 0, 1,
-0.8185815, -0.6795307, -0.5731799, 0.7921569, 1, 0, 1,
-0.8178906, -1.096882, -1.146504, 0.7882353, 1, 0, 1,
-0.8117896, 0.3202395, -1.572859, 0.7803922, 1, 0, 1,
-0.8117558, 1.698142, -2.692631, 0.7764706, 1, 0, 1,
-0.8087615, 1.028248, -0.5178927, 0.7686275, 1, 0, 1,
-0.8082279, -0.5025328, -2.296517, 0.7647059, 1, 0, 1,
-0.80782, 1.106586, -0.6968559, 0.7568628, 1, 0, 1,
-0.8067068, -2.517998, -4.227657, 0.7529412, 1, 0, 1,
-0.8058838, 0.5586045, -1.016687, 0.7450981, 1, 0, 1,
-0.8031961, 0.2325008, -2.709533, 0.7411765, 1, 0, 1,
-0.7965118, -0.4832676, -0.4616663, 0.7333333, 1, 0, 1,
-0.7949796, 0.9918349, -2.105835, 0.7294118, 1, 0, 1,
-0.7900585, -0.1863772, -0.1648522, 0.7215686, 1, 0, 1,
-0.786908, -1.645361, -4.324837, 0.7176471, 1, 0, 1,
-0.7837675, -0.8510449, -1.192192, 0.7098039, 1, 0, 1,
-0.7831937, 0.1401444, -1.558459, 0.7058824, 1, 0, 1,
-0.7813962, 1.61043, -2.149654, 0.6980392, 1, 0, 1,
-0.7779838, -0.5916113, -4.058522, 0.6901961, 1, 0, 1,
-0.7777079, -0.03848093, -1.227989, 0.6862745, 1, 0, 1,
-0.7689254, -0.1921555, -1.927692, 0.6784314, 1, 0, 1,
-0.7614928, -0.06863023, -2.673773, 0.6745098, 1, 0, 1,
-0.7493178, 0.9145505, -1.501573, 0.6666667, 1, 0, 1,
-0.7473615, -0.8163771, -3.602177, 0.6627451, 1, 0, 1,
-0.7411302, -1.087584, -3.11541, 0.654902, 1, 0, 1,
-0.7403458, -1.030925, -1.908686, 0.6509804, 1, 0, 1,
-0.7374534, 1.588224, 0.05652299, 0.6431373, 1, 0, 1,
-0.7292532, -1.551318, -2.902446, 0.6392157, 1, 0, 1,
-0.7279662, -0.563144, -1.387975, 0.6313726, 1, 0, 1,
-0.7267143, 1.657776, -1.013225, 0.627451, 1, 0, 1,
-0.7218863, -0.9548479, -2.758046, 0.6196079, 1, 0, 1,
-0.72094, -0.04257847, -0.9998072, 0.6156863, 1, 0, 1,
-0.7093574, -0.5557482, -3.787229, 0.6078432, 1, 0, 1,
-0.7068897, 0.01561656, -1.892321, 0.6039216, 1, 0, 1,
-0.705064, -0.3888137, -0.6329057, 0.5960785, 1, 0, 1,
-0.7048607, 1.433919, -0.09462319, 0.5882353, 1, 0, 1,
-0.7005593, -1.409433, -3.070006, 0.5843138, 1, 0, 1,
-0.6965204, 0.1874409, -0.967682, 0.5764706, 1, 0, 1,
-0.6917781, -2.245262, -4.320078, 0.572549, 1, 0, 1,
-0.6854556, -2.522735, -2.633899, 0.5647059, 1, 0, 1,
-0.6630186, 0.4803764, -0.6043395, 0.5607843, 1, 0, 1,
-0.6626744, 0.2981755, -3.545664, 0.5529412, 1, 0, 1,
-0.6610469, 0.4646158, 0.1839457, 0.5490196, 1, 0, 1,
-0.6582279, -0.0008121079, -1.696101, 0.5411765, 1, 0, 1,
-0.6513349, 0.2297383, -3.032268, 0.5372549, 1, 0, 1,
-0.6510314, -0.5597273, -0.7849987, 0.5294118, 1, 0, 1,
-0.644062, 0.2665336, 0.5786858, 0.5254902, 1, 0, 1,
-0.6424084, 0.7557934, 0.4433582, 0.5176471, 1, 0, 1,
-0.6399902, 0.07919259, -1.745476, 0.5137255, 1, 0, 1,
-0.6387751, 0.04824118, -1.408508, 0.5058824, 1, 0, 1,
-0.6358365, -0.2337363, -2.717776, 0.5019608, 1, 0, 1,
-0.6334329, 0.8764034, -1.657559, 0.4941176, 1, 0, 1,
-0.6319982, 0.4568188, -1.471003, 0.4862745, 1, 0, 1,
-0.6312832, -0.03841769, -1.717996, 0.4823529, 1, 0, 1,
-0.6288859, 0.6607395, -0.09527586, 0.4745098, 1, 0, 1,
-0.6274879, 2.135984, -1.436226, 0.4705882, 1, 0, 1,
-0.6253949, -0.5457158, -2.979603, 0.4627451, 1, 0, 1,
-0.6241634, -1.019505, -2.3548, 0.4588235, 1, 0, 1,
-0.6152776, -1.142341, -2.528214, 0.4509804, 1, 0, 1,
-0.6144621, 0.4768358, -2.708238, 0.4470588, 1, 0, 1,
-0.6141753, 0.2313419, -1.081864, 0.4392157, 1, 0, 1,
-0.6121503, 1.338955, -1.37067, 0.4352941, 1, 0, 1,
-0.6087416, -0.6147796, -1.314074, 0.427451, 1, 0, 1,
-0.6086336, 0.7575613, -2.580956, 0.4235294, 1, 0, 1,
-0.6070944, -0.7563045, -1.592961, 0.4156863, 1, 0, 1,
-0.606017, -0.4964716, -2.0546, 0.4117647, 1, 0, 1,
-0.6058377, 0.09062022, -0.4711418, 0.4039216, 1, 0, 1,
-0.591965, -0.7167143, -1.947269, 0.3960784, 1, 0, 1,
-0.5907958, -0.794629, -1.246766, 0.3921569, 1, 0, 1,
-0.5900567, 0.7975164, -1.075955, 0.3843137, 1, 0, 1,
-0.5867088, 0.2291645, -3.876493, 0.3803922, 1, 0, 1,
-0.5859324, 0.440075, -2.429985, 0.372549, 1, 0, 1,
-0.5847877, -0.7219241, -2.152833, 0.3686275, 1, 0, 1,
-0.5823051, -1.295031, -3.425715, 0.3607843, 1, 0, 1,
-0.5812706, -0.8579379, -2.129831, 0.3568628, 1, 0, 1,
-0.5807599, 0.2153612, -1.714802, 0.3490196, 1, 0, 1,
-0.5766098, -2.155121, -1.949937, 0.345098, 1, 0, 1,
-0.5667801, 1.119624, -0.5731006, 0.3372549, 1, 0, 1,
-0.5662549, 0.9036726, -0.5530307, 0.3333333, 1, 0, 1,
-0.5643559, 0.7692463, 0.4144368, 0.3254902, 1, 0, 1,
-0.5591416, -0.9429845, -2.06292, 0.3215686, 1, 0, 1,
-0.5550734, 0.6930558, -1.243935, 0.3137255, 1, 0, 1,
-0.5538756, 0.9314756, 0.943594, 0.3098039, 1, 0, 1,
-0.5513565, 0.6535126, -0.6416961, 0.3019608, 1, 0, 1,
-0.5489979, 1.112312, -0.01213065, 0.2941177, 1, 0, 1,
-0.5478814, -0.6631292, -2.552782, 0.2901961, 1, 0, 1,
-0.5447192, 0.1832254, -1.243849, 0.282353, 1, 0, 1,
-0.5438195, 0.3653171, -0.8640065, 0.2784314, 1, 0, 1,
-0.5412667, -0.8283535, -3.32117, 0.2705882, 1, 0, 1,
-0.5365883, 2.175104, -2.041695, 0.2666667, 1, 0, 1,
-0.5339574, 3.564998, 0.3508249, 0.2588235, 1, 0, 1,
-0.5310463, -0.3980829, -4.486095, 0.254902, 1, 0, 1,
-0.5305555, 0.6739171, 0.17661, 0.2470588, 1, 0, 1,
-0.5286366, 2.318834, -0.40466, 0.2431373, 1, 0, 1,
-0.5277269, -0.5395172, -2.257118, 0.2352941, 1, 0, 1,
-0.5239958, 0.5554924, -1.822472, 0.2313726, 1, 0, 1,
-0.52354, 0.8653411, 0.2664604, 0.2235294, 1, 0, 1,
-0.5197417, 1.059719, -1.59237, 0.2196078, 1, 0, 1,
-0.5168931, -0.5822512, -2.291111, 0.2117647, 1, 0, 1,
-0.5006405, -1.345087, -2.729601, 0.2078431, 1, 0, 1,
-0.4961617, -0.5158834, -2.657876, 0.2, 1, 0, 1,
-0.4922128, -0.008684585, -2.259768, 0.1921569, 1, 0, 1,
-0.4920012, -0.901853, -0.1161205, 0.1882353, 1, 0, 1,
-0.4914943, -1.003595, -1.044528, 0.1803922, 1, 0, 1,
-0.4845504, 0.4797778, -2.577123, 0.1764706, 1, 0, 1,
-0.4809868, -0.5904633, -2.669419, 0.1686275, 1, 0, 1,
-0.4565037, -2.377226, -1.949225, 0.1647059, 1, 0, 1,
-0.4548921, 0.126668, -1.081095, 0.1568628, 1, 0, 1,
-0.4439427, -1.21322, -4.140228, 0.1529412, 1, 0, 1,
-0.4414012, -0.1259798, -0.8456944, 0.145098, 1, 0, 1,
-0.4395923, 0.1707, -0.4875388, 0.1411765, 1, 0, 1,
-0.4339238, -1.39064, -3.524216, 0.1333333, 1, 0, 1,
-0.4305086, 0.4761113, 2.33379, 0.1294118, 1, 0, 1,
-0.4278926, 1.361709, -0.5272505, 0.1215686, 1, 0, 1,
-0.4256846, 0.7380079, 1.488074, 0.1176471, 1, 0, 1,
-0.4241698, -1.567827, -2.590018, 0.1098039, 1, 0, 1,
-0.424082, 1.426182, -0.4496643, 0.1058824, 1, 0, 1,
-0.4234806, 0.670386, 1.864127, 0.09803922, 1, 0, 1,
-0.4232123, 0.3027438, -0.4968888, 0.09019608, 1, 0, 1,
-0.4227239, -1.234006, -2.53601, 0.08627451, 1, 0, 1,
-0.419569, -0.8800876, -4.116282, 0.07843138, 1, 0, 1,
-0.405349, 1.67005, -2.350137, 0.07450981, 1, 0, 1,
-0.4022065, 0.5511746, -1.439425, 0.06666667, 1, 0, 1,
-0.4002924, -1.128266, -4.163055, 0.0627451, 1, 0, 1,
-0.3998097, -1.071115, -2.458024, 0.05490196, 1, 0, 1,
-0.3992913, -0.1808292, -2.735705, 0.05098039, 1, 0, 1,
-0.398237, 0.444112, -1.424333, 0.04313726, 1, 0, 1,
-0.3952829, 0.8696128, 1.250969, 0.03921569, 1, 0, 1,
-0.3896891, -0.6482635, -3.129055, 0.03137255, 1, 0, 1,
-0.3884436, 1.056884, 0.3767579, 0.02745098, 1, 0, 1,
-0.3863526, 0.6041279, 0.1036856, 0.01960784, 1, 0, 1,
-0.3856604, 0.7518675, -2.744651, 0.01568628, 1, 0, 1,
-0.3843532, 1.205636, -1.095979, 0.007843138, 1, 0, 1,
-0.3829047, -0.05925559, -2.359937, 0.003921569, 1, 0, 1,
-0.3822424, -0.3920966, -1.799981, 0, 1, 0.003921569, 1,
-0.3748093, -1.274078, -2.100759, 0, 1, 0.01176471, 1,
-0.3742334, 0.04784193, -2.056785, 0, 1, 0.01568628, 1,
-0.3707368, 0.2554552, -0.7858828, 0, 1, 0.02352941, 1,
-0.3696042, -0.5754998, -3.466663, 0, 1, 0.02745098, 1,
-0.3670677, 0.3589877, -1.418839, 0, 1, 0.03529412, 1,
-0.3651068, 0.08896303, -0.3530936, 0, 1, 0.03921569, 1,
-0.3572943, 0.04455911, -1.370877, 0, 1, 0.04705882, 1,
-0.3482712, 0.3405927, -1.35438, 0, 1, 0.05098039, 1,
-0.3452352, 1.228661, -0.3643322, 0, 1, 0.05882353, 1,
-0.3451847, 0.07927921, -1.051604, 0, 1, 0.0627451, 1,
-0.3427821, -0.3839586, -2.254502, 0, 1, 0.07058824, 1,
-0.3424779, 0.1415433, -0.3673266, 0, 1, 0.07450981, 1,
-0.3396299, 1.063935, -0.02622675, 0, 1, 0.08235294, 1,
-0.3395266, 0.06968659, -0.9799488, 0, 1, 0.08627451, 1,
-0.3392513, -1.99261, -4.319865, 0, 1, 0.09411765, 1,
-0.3377496, 0.00493688, -0.451501, 0, 1, 0.1019608, 1,
-0.3365248, -1.216898, -5.29915, 0, 1, 0.1058824, 1,
-0.3324896, 0.9299495, 0.4868556, 0, 1, 0.1137255, 1,
-0.3214202, 0.6005418, -0.991209, 0, 1, 0.1176471, 1,
-0.3205453, 0.2024063, -0.3877298, 0, 1, 0.1254902, 1,
-0.319334, 1.581528, -0.003172934, 0, 1, 0.1294118, 1,
-0.3181254, 0.9039949, -0.4405632, 0, 1, 0.1372549, 1,
-0.3145276, -0.2347165, -2.27814, 0, 1, 0.1411765, 1,
-0.3036476, -0.4683588, -0.8725248, 0, 1, 0.1490196, 1,
-0.3028852, -0.1450403, -2.574876, 0, 1, 0.1529412, 1,
-0.3028749, -1.912366, -3.147763, 0, 1, 0.1607843, 1,
-0.3011709, 0.5871727, -1.71199, 0, 1, 0.1647059, 1,
-0.2948542, 1.027193, -0.9598427, 0, 1, 0.172549, 1,
-0.294719, 0.6743766, -1.274782, 0, 1, 0.1764706, 1,
-0.2931181, -0.3515182, -3.397774, 0, 1, 0.1843137, 1,
-0.2893497, 1.496629, 0.6826198, 0, 1, 0.1882353, 1,
-0.2883916, 0.9661597, -0.2172013, 0, 1, 0.1960784, 1,
-0.2839304, -1.187519, -4.081713, 0, 1, 0.2039216, 1,
-0.2778469, 0.3021618, -1.940224, 0, 1, 0.2078431, 1,
-0.2754726, 0.1367508, -1.108249, 0, 1, 0.2156863, 1,
-0.2748683, 1.317002, 0.4573248, 0, 1, 0.2196078, 1,
-0.2738794, 0.6068105, -0.3813281, 0, 1, 0.227451, 1,
-0.267491, -0.2204905, -2.613292, 0, 1, 0.2313726, 1,
-0.2674159, -0.4001323, -1.840017, 0, 1, 0.2392157, 1,
-0.2636738, -1.63525, -3.005317, 0, 1, 0.2431373, 1,
-0.2630914, -0.400029, -2.440068, 0, 1, 0.2509804, 1,
-0.2619778, -1.411634, -1.459325, 0, 1, 0.254902, 1,
-0.2609186, -1.307399, -2.870653, 0, 1, 0.2627451, 1,
-0.2547503, -0.1230327, -0.973389, 0, 1, 0.2666667, 1,
-0.2499866, -0.07090797, -2.445323, 0, 1, 0.2745098, 1,
-0.2477152, -0.555742, -0.952901, 0, 1, 0.2784314, 1,
-0.2474329, 1.757499, -0.2396346, 0, 1, 0.2862745, 1,
-0.2463275, 1.02329, 0.5520648, 0, 1, 0.2901961, 1,
-0.2424802, -0.747314, -3.43693, 0, 1, 0.2980392, 1,
-0.2417818, -0.3037138, -0.4923478, 0, 1, 0.3058824, 1,
-0.2366008, 1.487238, -0.05988628, 0, 1, 0.3098039, 1,
-0.2350347, 0.1202991, -0.720245, 0, 1, 0.3176471, 1,
-0.2337568, 0.03356392, -1.068321, 0, 1, 0.3215686, 1,
-0.2316045, 0.5588122, -1.373705, 0, 1, 0.3294118, 1,
-0.2306586, -0.7398651, -2.240411, 0, 1, 0.3333333, 1,
-0.230387, -2.165444, -2.204328, 0, 1, 0.3411765, 1,
-0.2292759, 2.109937, 0.3953627, 0, 1, 0.345098, 1,
-0.228974, -0.3740123, -3.609334, 0, 1, 0.3529412, 1,
-0.2245089, -2.084234, -2.490201, 0, 1, 0.3568628, 1,
-0.2243994, 1.006972, -0.5373712, 0, 1, 0.3647059, 1,
-0.2235012, 0.1345005, -2.041707, 0, 1, 0.3686275, 1,
-0.2222754, -1.358528, -1.730922, 0, 1, 0.3764706, 1,
-0.2213253, -0.2290854, -0.710322, 0, 1, 0.3803922, 1,
-0.2207528, -0.1518023, -3.457219, 0, 1, 0.3882353, 1,
-0.2194527, 0.3663448, -0.3791214, 0, 1, 0.3921569, 1,
-0.2171289, 0.8330179, 0.08117341, 0, 1, 0.4, 1,
-0.2159032, -0.410362, -2.57677, 0, 1, 0.4078431, 1,
-0.2129271, -0.830615, -1.635262, 0, 1, 0.4117647, 1,
-0.2118251, 0.2856255, -2.971274, 0, 1, 0.4196078, 1,
-0.207825, 0.5721384, -0.4692829, 0, 1, 0.4235294, 1,
-0.2034351, 0.8684956, -0.3759747, 0, 1, 0.4313726, 1,
-0.203094, -1.780848, -3.204632, 0, 1, 0.4352941, 1,
-0.1984281, 0.4821774, -0.3437583, 0, 1, 0.4431373, 1,
-0.1889742, 1.562871, 1.391323, 0, 1, 0.4470588, 1,
-0.1880192, -0.3545899, -2.201044, 0, 1, 0.454902, 1,
-0.1879068, -0.4452689, -4.127936, 0, 1, 0.4588235, 1,
-0.1834385, 2.501999, -1.529285, 0, 1, 0.4666667, 1,
-0.1821693, -0.3478139, -1.4122, 0, 1, 0.4705882, 1,
-0.1816303, -0.06027926, -1.046669, 0, 1, 0.4784314, 1,
-0.1812091, 1.098806, -0.7800004, 0, 1, 0.4823529, 1,
-0.1792501, -1.100542, -3.256822, 0, 1, 0.4901961, 1,
-0.1725523, 0.4466386, -0.8275734, 0, 1, 0.4941176, 1,
-0.1672056, 0.4065113, 0.1097315, 0, 1, 0.5019608, 1,
-0.1663821, 0.2682201, 0.3310654, 0, 1, 0.509804, 1,
-0.1650326, 0.7534614, -0.7499001, 0, 1, 0.5137255, 1,
-0.1582238, 2.306415, -0.07393512, 0, 1, 0.5215687, 1,
-0.1579483, 0.3892678, -1.926278, 0, 1, 0.5254902, 1,
-0.157367, 1.332373, -0.9310634, 0, 1, 0.5333334, 1,
-0.1560849, 0.6324506, 1.003537, 0, 1, 0.5372549, 1,
-0.1529376, -2.076399, -2.096902, 0, 1, 0.5450981, 1,
-0.1526452, 0.8733577, -0.1051608, 0, 1, 0.5490196, 1,
-0.1524159, 0.8354205, -1.083541, 0, 1, 0.5568628, 1,
-0.1450376, -1.722314, -2.611125, 0, 1, 0.5607843, 1,
-0.1418504, -0.6125335, -4.247445, 0, 1, 0.5686275, 1,
-0.1418399, 0.5182739, 0.4025449, 0, 1, 0.572549, 1,
-0.1410592, -1.050679, -2.012239, 0, 1, 0.5803922, 1,
-0.1409587, -0.7224872, -3.527898, 0, 1, 0.5843138, 1,
-0.1383625, 0.8993554, -1.39952, 0, 1, 0.5921569, 1,
-0.1378647, 0.1630266, -1.597287, 0, 1, 0.5960785, 1,
-0.1360602, -0.5674403, -2.571905, 0, 1, 0.6039216, 1,
-0.1328258, -2.298156, -2.924117, 0, 1, 0.6117647, 1,
-0.1323936, 0.4169146, 1.714747, 0, 1, 0.6156863, 1,
-0.1309814, -1.269282, -4.111705, 0, 1, 0.6235294, 1,
-0.1241969, 0.4351599, -0.1637326, 0, 1, 0.627451, 1,
-0.123908, -2.382217, -3.272226, 0, 1, 0.6352941, 1,
-0.1237944, 1.10866, 0.9652469, 0, 1, 0.6392157, 1,
-0.1227529, 0.3200929, 0.814535, 0, 1, 0.6470588, 1,
-0.1192467, 1.935233, 0.6080242, 0, 1, 0.6509804, 1,
-0.1186407, 0.6652467, -0.4487825, 0, 1, 0.6588235, 1,
-0.116567, 0.409247, -0.6425666, 0, 1, 0.6627451, 1,
-0.1158192, 0.5132384, 0.7623502, 0, 1, 0.6705883, 1,
-0.1155983, -1.733321, -1.50071, 0, 1, 0.6745098, 1,
-0.1126226, 0.541695, -0.2283965, 0, 1, 0.682353, 1,
-0.1071698, 0.09597491, -2.53676, 0, 1, 0.6862745, 1,
-0.09538808, -0.6342975, -4.729774, 0, 1, 0.6941177, 1,
-0.09233887, 0.815299, 1.275278, 0, 1, 0.7019608, 1,
-0.09153772, 1.427868, 1.068682, 0, 1, 0.7058824, 1,
-0.09137692, 1.485111, -1.290003, 0, 1, 0.7137255, 1,
-0.09002944, -0.03558796, -1.813326, 0, 1, 0.7176471, 1,
-0.08852133, 0.5633755, -0.07315285, 0, 1, 0.7254902, 1,
-0.08688402, -2.319062, -2.755895, 0, 1, 0.7294118, 1,
-0.08561904, -0.5348273, -3.54568, 0, 1, 0.7372549, 1,
-0.08461403, 0.1053688, -2.268923, 0, 1, 0.7411765, 1,
-0.08166946, 0.5959561, -1.051538, 0, 1, 0.7490196, 1,
-0.0805832, -1.28099, -1.332343, 0, 1, 0.7529412, 1,
-0.07825858, -0.8002236, -2.761932, 0, 1, 0.7607843, 1,
-0.07811508, -1.227918, -2.863036, 0, 1, 0.7647059, 1,
-0.07521392, -0.2217029, -4.927749, 0, 1, 0.772549, 1,
-0.07477185, 0.1481018, -0.008727407, 0, 1, 0.7764706, 1,
-0.06238682, -0.8231258, -2.292668, 0, 1, 0.7843137, 1,
-0.05524071, -0.2764791, -2.476704, 0, 1, 0.7882353, 1,
-0.05504722, 0.3831083, 0.1010455, 0, 1, 0.7960784, 1,
-0.05273382, -0.3222757, -2.861032, 0, 1, 0.8039216, 1,
-0.05142315, -1.188574, -2.629488, 0, 1, 0.8078431, 1,
-0.04999442, -1.478242, -1.664544, 0, 1, 0.8156863, 1,
-0.04741644, -0.1265302, -0.01580107, 0, 1, 0.8196079, 1,
-0.04312397, 2.679609, 0.7487128, 0, 1, 0.827451, 1,
-0.04271851, 0.2732739, -1.604765, 0, 1, 0.8313726, 1,
-0.03809271, 0.5483845, 0.003705316, 0, 1, 0.8392157, 1,
-0.02716998, 0.1384386, 0.4121481, 0, 1, 0.8431373, 1,
-0.02628371, 2.151648, 0.5599989, 0, 1, 0.8509804, 1,
-0.01795775, 0.05758009, 0.03375797, 0, 1, 0.854902, 1,
-0.01793814, 0.6249261, -0.585447, 0, 1, 0.8627451, 1,
-0.01641302, -0.2951027, -3.448844, 0, 1, 0.8666667, 1,
-0.01392732, -0.8447521, -4.207768, 0, 1, 0.8745098, 1,
-0.01360113, 0.2883434, 0.2796804, 0, 1, 0.8784314, 1,
-0.01160405, -0.4475209, -2.233915, 0, 1, 0.8862745, 1,
-0.01146718, 0.4757162, -0.5699653, 0, 1, 0.8901961, 1,
-0.01108901, 1.640801, 0.422993, 0, 1, 0.8980392, 1,
-0.009552673, 0.21914, 0.01474044, 0, 1, 0.9058824, 1,
-0.002246669, 0.7473307, -1.185805, 0, 1, 0.9098039, 1,
-6.668224e-05, 0.7261524, 1.430227, 0, 1, 0.9176471, 1,
0.003080304, -1.551567, 0.2254437, 0, 1, 0.9215686, 1,
0.009103604, -0.7153398, 3.366939, 0, 1, 0.9294118, 1,
0.01746926, -0.1751846, 3.018841, 0, 1, 0.9333333, 1,
0.01755878, 2.124976, 1.530189, 0, 1, 0.9411765, 1,
0.0190569, -0.9464968, 2.808469, 0, 1, 0.945098, 1,
0.02102182, -0.1527963, 1.411592, 0, 1, 0.9529412, 1,
0.02310757, 0.7457097, -0.8056316, 0, 1, 0.9568627, 1,
0.02379475, 1.302737, 0.3703905, 0, 1, 0.9647059, 1,
0.02389671, 1.163013, 1.982779, 0, 1, 0.9686275, 1,
0.02993143, 1.245053, -0.05377346, 0, 1, 0.9764706, 1,
0.03034983, -0.6362252, 3.758844, 0, 1, 0.9803922, 1,
0.03056502, -0.7322958, 0.7848107, 0, 1, 0.9882353, 1,
0.03760833, 0.1638639, -1.287931, 0, 1, 0.9921569, 1,
0.03868522, -0.566505, 3.659889, 0, 1, 1, 1,
0.03908823, -0.6914272, 3.743731, 0, 0.9921569, 1, 1,
0.03959033, 0.02253965, -0.1113504, 0, 0.9882353, 1, 1,
0.04076521, -0.7503456, 1.906199, 0, 0.9803922, 1, 1,
0.04112377, -1.907458, 4.598971, 0, 0.9764706, 1, 1,
0.0447524, 0.2160991, -0.9262303, 0, 0.9686275, 1, 1,
0.04588911, -0.08711945, 0.9470496, 0, 0.9647059, 1, 1,
0.04998739, 1.109985, -0.2096143, 0, 0.9568627, 1, 1,
0.05007397, 0.1103852, -1.035096, 0, 0.9529412, 1, 1,
0.05394597, -1.380407, 4.065133, 0, 0.945098, 1, 1,
0.05431527, 0.5915647, -0.3683071, 0, 0.9411765, 1, 1,
0.05532502, -2.500864, 2.681199, 0, 0.9333333, 1, 1,
0.06008345, -1.085034, 2.430414, 0, 0.9294118, 1, 1,
0.0639005, -0.08665789, 3.480632, 0, 0.9215686, 1, 1,
0.0672341, 0.4495504, 0.1026238, 0, 0.9176471, 1, 1,
0.07027812, -0.5359849, 1.640141, 0, 0.9098039, 1, 1,
0.07309076, 0.06105277, -2.123347, 0, 0.9058824, 1, 1,
0.07686844, 0.9708964, 1.758304, 0, 0.8980392, 1, 1,
0.08557654, 1.943256, 1.738861, 0, 0.8901961, 1, 1,
0.08586987, -0.01802045, 2.544268, 0, 0.8862745, 1, 1,
0.09180197, -0.1557387, 1.172666, 0, 0.8784314, 1, 1,
0.0936989, -0.8131737, 2.84441, 0, 0.8745098, 1, 1,
0.09441377, 2.101366, 1.356316, 0, 0.8666667, 1, 1,
0.1008179, -0.3159464, 1.806468, 0, 0.8627451, 1, 1,
0.1099729, 1.331355, -0.1049778, 0, 0.854902, 1, 1,
0.1149128, 0.689152, 1.266141, 0, 0.8509804, 1, 1,
0.1173025, -1.411052, 2.111819, 0, 0.8431373, 1, 1,
0.1231588, 0.7906989, -1.243375, 0, 0.8392157, 1, 1,
0.1241892, -0.7006866, 3.812526, 0, 0.8313726, 1, 1,
0.1243892, 0.4505177, -0.5286361, 0, 0.827451, 1, 1,
0.1288175, 0.8560793, 1.373754, 0, 0.8196079, 1, 1,
0.1295414, -0.3032348, 2.13466, 0, 0.8156863, 1, 1,
0.1295957, 0.6586291, -0.3980223, 0, 0.8078431, 1, 1,
0.1301022, -1.948109, 2.763286, 0, 0.8039216, 1, 1,
0.1309707, -1.15349, 2.23756, 0, 0.7960784, 1, 1,
0.1342659, 0.6056962, 0.5269957, 0, 0.7882353, 1, 1,
0.1344705, -0.02003191, 1.846009, 0, 0.7843137, 1, 1,
0.1383158, -0.4127646, 2.913693, 0, 0.7764706, 1, 1,
0.1438999, -0.05293711, 1.37797, 0, 0.772549, 1, 1,
0.1473999, 0.8393359, 0.6723058, 0, 0.7647059, 1, 1,
0.1491871, 0.6136557, -0.1789923, 0, 0.7607843, 1, 1,
0.1492185, -1.400399, 3.199781, 0, 0.7529412, 1, 1,
0.1533435, -0.000866024, 1.626833, 0, 0.7490196, 1, 1,
0.1544094, -0.2318649, 0.8418711, 0, 0.7411765, 1, 1,
0.1546149, -0.4616266, 1.314642, 0, 0.7372549, 1, 1,
0.1591302, 1.319356, 0.8770294, 0, 0.7294118, 1, 1,
0.1592579, 0.05529014, 2.316448, 0, 0.7254902, 1, 1,
0.1593194, 0.4845654, 1.665924, 0, 0.7176471, 1, 1,
0.1752779, -0.6294724, 2.499927, 0, 0.7137255, 1, 1,
0.1764697, 0.006569252, 1.536533, 0, 0.7058824, 1, 1,
0.1846644, 0.4974763, 1.060319, 0, 0.6980392, 1, 1,
0.1856148, 0.9602253, -0.8163926, 0, 0.6941177, 1, 1,
0.1880218, -1.113975, 3.276912, 0, 0.6862745, 1, 1,
0.1927242, -0.5107689, -0.1131993, 0, 0.682353, 1, 1,
0.1928723, -0.9021633, 4.069867, 0, 0.6745098, 1, 1,
0.195443, -0.4584929, 4.092015, 0, 0.6705883, 1, 1,
0.1993755, -1.216467, 3.712411, 0, 0.6627451, 1, 1,
0.199922, -0.2336717, 1.576314, 0, 0.6588235, 1, 1,
0.200051, 0.5655375, 0.5375315, 0, 0.6509804, 1, 1,
0.2054757, 0.01645798, 2.15267, 0, 0.6470588, 1, 1,
0.2065751, 1.826842, 1.01441, 0, 0.6392157, 1, 1,
0.2077994, 0.9928423, 0.5184765, 0, 0.6352941, 1, 1,
0.2086336, -0.009943315, 1.014023, 0, 0.627451, 1, 1,
0.2095432, -0.5490802, 2.140797, 0, 0.6235294, 1, 1,
0.2143892, 1.576002, -2.249492, 0, 0.6156863, 1, 1,
0.2148395, -0.4576148, 3.743138, 0, 0.6117647, 1, 1,
0.2194891, 0.3910486, 1.013494, 0, 0.6039216, 1, 1,
0.222848, 0.8399034, 0.8378955, 0, 0.5960785, 1, 1,
0.2228847, 0.8967607, -0.1857752, 0, 0.5921569, 1, 1,
0.2240784, -0.1621946, 1.51733, 0, 0.5843138, 1, 1,
0.2245489, 1.008614, -0.6340487, 0, 0.5803922, 1, 1,
0.2265459, 0.2895505, -0.7637762, 0, 0.572549, 1, 1,
0.2282387, -0.2038468, 1.826163, 0, 0.5686275, 1, 1,
0.2303516, 0.3436838, -0.220306, 0, 0.5607843, 1, 1,
0.2304931, 1.745986, -1.483708, 0, 0.5568628, 1, 1,
0.230665, -1.295681, 3.631447, 0, 0.5490196, 1, 1,
0.2331419, 0.7124965, -0.9580892, 0, 0.5450981, 1, 1,
0.2347361, 1.263347, 1.417199, 0, 0.5372549, 1, 1,
0.236198, 0.2935576, -0.7417346, 0, 0.5333334, 1, 1,
0.2376, 1.087815, 0.7578634, 0, 0.5254902, 1, 1,
0.2402135, -1.203746, 3.228027, 0, 0.5215687, 1, 1,
0.2432318, 2.787171, -1.835923, 0, 0.5137255, 1, 1,
0.2457507, -0.4113529, 3.993718, 0, 0.509804, 1, 1,
0.2467231, 0.08172605, 0.4654293, 0, 0.5019608, 1, 1,
0.2492796, -0.5140198, 2.227016, 0, 0.4941176, 1, 1,
0.2515779, -0.9374675, 2.733078, 0, 0.4901961, 1, 1,
0.2559838, 0.3052995, 1.084309, 0, 0.4823529, 1, 1,
0.2563742, 1.007769, 2.154092, 0, 0.4784314, 1, 1,
0.2581088, 0.7061329, 0.8384239, 0, 0.4705882, 1, 1,
0.2716306, 0.7299777, -0.5314396, 0, 0.4666667, 1, 1,
0.2766265, -1.409698, 3.033506, 0, 0.4588235, 1, 1,
0.2766733, 0.153387, 0.5481157, 0, 0.454902, 1, 1,
0.2780037, 1.857811, 0.3922084, 0, 0.4470588, 1, 1,
0.2795289, 0.0781384, 0.8172961, 0, 0.4431373, 1, 1,
0.2818408, 0.1602206, 2.299237, 0, 0.4352941, 1, 1,
0.2835535, -0.03018976, 2.463318, 0, 0.4313726, 1, 1,
0.2855234, 0.1674903, 1.345405, 0, 0.4235294, 1, 1,
0.2870228, 0.1952812, -0.192503, 0, 0.4196078, 1, 1,
0.2905327, -0.5298091, 1.747356, 0, 0.4117647, 1, 1,
0.2906318, 2.582547, -0.6073679, 0, 0.4078431, 1, 1,
0.2919538, 0.433284, 2.099908, 0, 0.4, 1, 1,
0.2927477, 1.859604, 0.2580759, 0, 0.3921569, 1, 1,
0.2969205, 0.9939569, -0.3923528, 0, 0.3882353, 1, 1,
0.3084214, 0.9567683, 1.56154, 0, 0.3803922, 1, 1,
0.3089145, 0.9772224, 1.106085, 0, 0.3764706, 1, 1,
0.309122, -0.3959723, 3.149144, 0, 0.3686275, 1, 1,
0.3125597, -1.238295, 3.461383, 0, 0.3647059, 1, 1,
0.3150743, -0.3976285, 4.219646, 0, 0.3568628, 1, 1,
0.3155934, -0.6391972, 3.855434, 0, 0.3529412, 1, 1,
0.3220461, -1.243586, 3.297559, 0, 0.345098, 1, 1,
0.3270131, -0.1025562, 1.325702, 0, 0.3411765, 1, 1,
0.3331806, -0.04152883, 0.7504779, 0, 0.3333333, 1, 1,
0.3332436, -1.106696, 3.299218, 0, 0.3294118, 1, 1,
0.3357747, -0.544656, 3.763357, 0, 0.3215686, 1, 1,
0.3364784, 0.0420217, 2.010377, 0, 0.3176471, 1, 1,
0.3381017, 1.867615, -0.6221361, 0, 0.3098039, 1, 1,
0.3387602, -1.264661, 2.044122, 0, 0.3058824, 1, 1,
0.341122, -1.50255, 2.375492, 0, 0.2980392, 1, 1,
0.3421581, 2.944721, -0.6756562, 0, 0.2901961, 1, 1,
0.342274, 0.8129834, -0.1628284, 0, 0.2862745, 1, 1,
0.3426416, 0.9203034, 0.6039653, 0, 0.2784314, 1, 1,
0.3438283, -0.546019, 2.589813, 0, 0.2745098, 1, 1,
0.3493822, 0.4418639, 0.3929976, 0, 0.2666667, 1, 1,
0.3501963, -0.7775682, 3.352907, 0, 0.2627451, 1, 1,
0.3566948, 1.054164, 0.05523239, 0, 0.254902, 1, 1,
0.3572535, 0.4492379, 0.5257786, 0, 0.2509804, 1, 1,
0.3601452, -1.501254, 3.872854, 0, 0.2431373, 1, 1,
0.3644378, -0.01723287, 1.439106, 0, 0.2392157, 1, 1,
0.3659808, -1.04177, 2.406816, 0, 0.2313726, 1, 1,
0.3665381, -0.1983383, 2.17027, 0, 0.227451, 1, 1,
0.3752126, -0.0202931, 1.214321, 0, 0.2196078, 1, 1,
0.3756513, -1.83399, 4.162048, 0, 0.2156863, 1, 1,
0.3771957, 1.586726, -0.1603487, 0, 0.2078431, 1, 1,
0.3773065, -0.2915984, 1.270555, 0, 0.2039216, 1, 1,
0.3824153, 0.2445986, -0.18715, 0, 0.1960784, 1, 1,
0.3825252, 0.5826355, -0.8266671, 0, 0.1882353, 1, 1,
0.3840184, 0.6183761, 2.411351, 0, 0.1843137, 1, 1,
0.3871271, 0.8757213, 1.671695, 0, 0.1764706, 1, 1,
0.3890733, -0.8556064, 3.863986, 0, 0.172549, 1, 1,
0.3894776, -1.083293, 4.145816, 0, 0.1647059, 1, 1,
0.3895506, 0.5899185, 0.7537568, 0, 0.1607843, 1, 1,
0.3898694, -0.3610271, 3.204229, 0, 0.1529412, 1, 1,
0.3907543, -0.5105222, 2.040531, 0, 0.1490196, 1, 1,
0.3914286, -1.137079, 1.373077, 0, 0.1411765, 1, 1,
0.4047422, 1.010718, 0.9101935, 0, 0.1372549, 1, 1,
0.4053414, 0.4105132, 0.9175162, 0, 0.1294118, 1, 1,
0.4094277, -1.075776, 3.234136, 0, 0.1254902, 1, 1,
0.4149542, -0.03295474, -0.6543494, 0, 0.1176471, 1, 1,
0.4154553, -0.4002197, 2.254852, 0, 0.1137255, 1, 1,
0.4156425, -0.9625647, 3.431589, 0, 0.1058824, 1, 1,
0.4188347, -0.6810488, 1.18003, 0, 0.09803922, 1, 1,
0.4208014, 0.582824, 1.40855, 0, 0.09411765, 1, 1,
0.4213601, -0.4218305, 3.446275, 0, 0.08627451, 1, 1,
0.4213727, -1.166249, 3.331496, 0, 0.08235294, 1, 1,
0.4218197, 0.4082537, -0.3463436, 0, 0.07450981, 1, 1,
0.4230058, 0.6863792, -1.023689, 0, 0.07058824, 1, 1,
0.4263932, -0.2277362, 2.912796, 0, 0.0627451, 1, 1,
0.4282762, -0.6254675, 3.023946, 0, 0.05882353, 1, 1,
0.4300868, 1.116996, -0.08947711, 0, 0.05098039, 1, 1,
0.4352665, -1.109604, 2.206079, 0, 0.04705882, 1, 1,
0.4380738, -0.4917576, 3.351335, 0, 0.03921569, 1, 1,
0.4385951, -0.6240491, 2.01434, 0, 0.03529412, 1, 1,
0.4387466, 1.800254, 0.6473529, 0, 0.02745098, 1, 1,
0.4388787, 0.2971938, 0.6374766, 0, 0.02352941, 1, 1,
0.4410782, 0.8854749, 1.178421, 0, 0.01568628, 1, 1,
0.4432317, -1.466044, 2.248469, 0, 0.01176471, 1, 1,
0.4440243, -1.65917, 3.745142, 0, 0.003921569, 1, 1,
0.4473987, 1.120413, 2.184238, 0.003921569, 0, 1, 1,
0.4474728, 0.02905997, 1.102157, 0.007843138, 0, 1, 1,
0.448555, 0.2304579, -0.3238075, 0.01568628, 0, 1, 1,
0.4488727, -0.9336797, 2.571963, 0.01960784, 0, 1, 1,
0.4490708, 0.3508665, 1.857488, 0.02745098, 0, 1, 1,
0.4497598, -0.9807855, 4.061602, 0.03137255, 0, 1, 1,
0.4570911, 0.2636862, 1.699952, 0.03921569, 0, 1, 1,
0.4588586, -0.7325401, 2.174138, 0.04313726, 0, 1, 1,
0.4636014, 0.01878905, 1.703334, 0.05098039, 0, 1, 1,
0.4643482, 0.2471835, 1.646773, 0.05490196, 0, 1, 1,
0.4650874, 2.028749, 0.04363098, 0.0627451, 0, 1, 1,
0.4653521, 0.02982036, 0.6755478, 0.06666667, 0, 1, 1,
0.4688507, -1.554325, 3.296781, 0.07450981, 0, 1, 1,
0.4705652, -0.2494434, 1.78402, 0.07843138, 0, 1, 1,
0.4715573, 0.3340359, 1.991953, 0.08627451, 0, 1, 1,
0.4720454, -0.9074228, 1.100206, 0.09019608, 0, 1, 1,
0.4722893, 0.09940775, 0.9607918, 0.09803922, 0, 1, 1,
0.4753568, 0.1625789, 0.9084756, 0.1058824, 0, 1, 1,
0.4807977, 0.1800337, 0.6866143, 0.1098039, 0, 1, 1,
0.4821632, -0.6451603, 1.823732, 0.1176471, 0, 1, 1,
0.482652, 0.3551913, -0.09095864, 0.1215686, 0, 1, 1,
0.4897252, 1.088393, 1.3464, 0.1294118, 0, 1, 1,
0.4930452, 0.3556539, 1.90861, 0.1333333, 0, 1, 1,
0.5039432, -0.3559805, 1.302139, 0.1411765, 0, 1, 1,
0.5057932, -0.02233636, 1.584384, 0.145098, 0, 1, 1,
0.5058972, -0.2895118, 0.3463478, 0.1529412, 0, 1, 1,
0.5066745, 1.409618, 0.1208884, 0.1568628, 0, 1, 1,
0.5082928, 0.1271344, 1.878094, 0.1647059, 0, 1, 1,
0.5102073, -1.27409, 1.819804, 0.1686275, 0, 1, 1,
0.5142733, 1.525788, 0.1563609, 0.1764706, 0, 1, 1,
0.5172686, -0.640951, 1.990367, 0.1803922, 0, 1, 1,
0.517276, 0.3306582, 2.582678, 0.1882353, 0, 1, 1,
0.5184212, -0.5061749, 2.223583, 0.1921569, 0, 1, 1,
0.518979, 0.05299952, 0.6397152, 0.2, 0, 1, 1,
0.5201486, -1.226719, 3.983228, 0.2078431, 0, 1, 1,
0.5230238, 0.01547467, 2.89544, 0.2117647, 0, 1, 1,
0.528684, -0.8527132, 2.516767, 0.2196078, 0, 1, 1,
0.5386075, 0.3566788, 0.3280362, 0.2235294, 0, 1, 1,
0.5400175, -1.027313, 2.772665, 0.2313726, 0, 1, 1,
0.5403868, 2.705864, -0.8146692, 0.2352941, 0, 1, 1,
0.5443456, -0.1906502, 1.711477, 0.2431373, 0, 1, 1,
0.5447874, -0.3615431, 2.734565, 0.2470588, 0, 1, 1,
0.5453149, -2.221443, 2.830912, 0.254902, 0, 1, 1,
0.5476562, -0.3341489, 0.9450549, 0.2588235, 0, 1, 1,
0.5582301, 0.5098097, 0.4922624, 0.2666667, 0, 1, 1,
0.5589992, -0.3923241, 2.301131, 0.2705882, 0, 1, 1,
0.5602813, 0.4560103, 0.9499847, 0.2784314, 0, 1, 1,
0.5651951, -0.1294988, 1.092454, 0.282353, 0, 1, 1,
0.5714169, 0.4851942, 0.7422293, 0.2901961, 0, 1, 1,
0.5748969, -0.4018061, 2.741487, 0.2941177, 0, 1, 1,
0.5755953, -0.3708984, 3.131892, 0.3019608, 0, 1, 1,
0.5795101, 1.868877, 0.3193262, 0.3098039, 0, 1, 1,
0.5809705, 0.4815732, 1.79287, 0.3137255, 0, 1, 1,
0.5817058, 0.8662803, 1.372159, 0.3215686, 0, 1, 1,
0.586176, 0.8250217, -0.4861633, 0.3254902, 0, 1, 1,
0.5875205, 0.7128347, -1.6495, 0.3333333, 0, 1, 1,
0.5875502, -0.8605763, 1.660706, 0.3372549, 0, 1, 1,
0.5917099, -0.04899501, 3.019635, 0.345098, 0, 1, 1,
0.5928267, 0.01243372, 1.752978, 0.3490196, 0, 1, 1,
0.5996259, 0.2708289, 0.6305178, 0.3568628, 0, 1, 1,
0.6008706, 0.2294951, 2.725376, 0.3607843, 0, 1, 1,
0.6037452, 2.471023, -0.702593, 0.3686275, 0, 1, 1,
0.6045707, -0.7569026, 1.460217, 0.372549, 0, 1, 1,
0.6053274, -2.671579, 3.723566, 0.3803922, 0, 1, 1,
0.6063877, 1.008723, 0.6669631, 0.3843137, 0, 1, 1,
0.6095347, 0.1343198, -0.08493727, 0.3921569, 0, 1, 1,
0.6121795, -0.3679316, 2.716125, 0.3960784, 0, 1, 1,
0.6143196, 0.4731499, 2.036184, 0.4039216, 0, 1, 1,
0.6170898, -0.436733, 1.186675, 0.4117647, 0, 1, 1,
0.6222497, -1.049676, 1.268863, 0.4156863, 0, 1, 1,
0.6247754, -0.2112807, 0.9695605, 0.4235294, 0, 1, 1,
0.630233, -2.064069, 2.251644, 0.427451, 0, 1, 1,
0.6322877, -0.1575302, 0.7243631, 0.4352941, 0, 1, 1,
0.6326153, -0.4475258, 1.135828, 0.4392157, 0, 1, 1,
0.6347795, 1.586271, 0.8158818, 0.4470588, 0, 1, 1,
0.6356236, 0.02653607, -0.5172362, 0.4509804, 0, 1, 1,
0.6389136, -0.7659887, 1.860664, 0.4588235, 0, 1, 1,
0.6399419, 1.366662, 1.309611, 0.4627451, 0, 1, 1,
0.6440525, 1.394428, 0.8210362, 0.4705882, 0, 1, 1,
0.6462298, 0.1588111, 0.8925619, 0.4745098, 0, 1, 1,
0.6462432, 1.258536, -1.016737, 0.4823529, 0, 1, 1,
0.6483936, -1.043305, 3.709665, 0.4862745, 0, 1, 1,
0.6547701, 1.161732, -0.1533208, 0.4941176, 0, 1, 1,
0.6571451, 0.9693842, -0.6004354, 0.5019608, 0, 1, 1,
0.663288, 1.169399, -0.1912751, 0.5058824, 0, 1, 1,
0.6643537, 0.141662, 0.9085682, 0.5137255, 0, 1, 1,
0.6663737, 1.699462, 0.1740951, 0.5176471, 0, 1, 1,
0.6680002, -1.745992, 3.507467, 0.5254902, 0, 1, 1,
0.6719967, -1.809847, 4.300099, 0.5294118, 0, 1, 1,
0.6745293, 0.5054215, 0.8821155, 0.5372549, 0, 1, 1,
0.6772088, 0.7394497, 0.2886724, 0.5411765, 0, 1, 1,
0.6775113, 0.6743019, 1.657465, 0.5490196, 0, 1, 1,
0.6790156, 0.4214918, -0.2310408, 0.5529412, 0, 1, 1,
0.6814049, -1.057412, 2.637577, 0.5607843, 0, 1, 1,
0.6824777, -1.717432, 3.921458, 0.5647059, 0, 1, 1,
0.6833443, -0.873252, 3.771713, 0.572549, 0, 1, 1,
0.6864486, 0.5720324, 0.9534995, 0.5764706, 0, 1, 1,
0.702742, 0.9991122, 0.411726, 0.5843138, 0, 1, 1,
0.7086269, 1.126215, 0.4674951, 0.5882353, 0, 1, 1,
0.7108877, 0.5462332, -0.5348647, 0.5960785, 0, 1, 1,
0.7188663, 0.1403493, 0.9621962, 0.6039216, 0, 1, 1,
0.723703, -0.8347336, 3.85597, 0.6078432, 0, 1, 1,
0.7266555, 0.2818079, 2.777221, 0.6156863, 0, 1, 1,
0.7271732, -0.3533596, 0.1841043, 0.6196079, 0, 1, 1,
0.7298234, 0.9778371, 0.512088, 0.627451, 0, 1, 1,
0.7455562, 0.8768435, -0.3760918, 0.6313726, 0, 1, 1,
0.7462909, -0.9851545, 3.24825, 0.6392157, 0, 1, 1,
0.7486461, 0.5323976, 1.155989, 0.6431373, 0, 1, 1,
0.7488983, 0.3696899, 0.02549148, 0.6509804, 0, 1, 1,
0.753888, 0.9717187, 1.774601, 0.654902, 0, 1, 1,
0.7560055, 0.5303057, 2.926172, 0.6627451, 0, 1, 1,
0.7577567, 0.2063555, -1.367947, 0.6666667, 0, 1, 1,
0.7621637, 1.587919, 0.5298279, 0.6745098, 0, 1, 1,
0.7718093, 0.1313429, 1.516933, 0.6784314, 0, 1, 1,
0.7739958, 0.01186681, 2.013446, 0.6862745, 0, 1, 1,
0.7753333, -1.297401, 3.615202, 0.6901961, 0, 1, 1,
0.7779212, -0.07348119, 0.8088783, 0.6980392, 0, 1, 1,
0.7782193, 0.2714452, 0.9158986, 0.7058824, 0, 1, 1,
0.783049, 0.4477215, 2.155008, 0.7098039, 0, 1, 1,
0.7865626, 0.7556164, 0.9778687, 0.7176471, 0, 1, 1,
0.7904884, 1.982078, -1.112885, 0.7215686, 0, 1, 1,
0.7944196, -0.6092607, 2.854465, 0.7294118, 0, 1, 1,
0.7978768, 0.4265685, 2.230515, 0.7333333, 0, 1, 1,
0.8008277, -0.4148381, 2.463002, 0.7411765, 0, 1, 1,
0.8014513, -0.4257722, 2.494831, 0.7450981, 0, 1, 1,
0.8081076, 0.3951898, 0.8605849, 0.7529412, 0, 1, 1,
0.8117145, 1.272348, -0.1884098, 0.7568628, 0, 1, 1,
0.8153989, 0.4421071, 2.29809, 0.7647059, 0, 1, 1,
0.8154449, 0.8426848, 3.03313, 0.7686275, 0, 1, 1,
0.8168746, -0.6532955, 2.233564, 0.7764706, 0, 1, 1,
0.8236098, 0.5061662, 1.956523, 0.7803922, 0, 1, 1,
0.8298995, -0.03890235, 1.671446, 0.7882353, 0, 1, 1,
0.8396258, -0.1120568, 1.837969, 0.7921569, 0, 1, 1,
0.8435725, 1.952847, 0.3304698, 0.8, 0, 1, 1,
0.854079, -1.032815, 1.37511, 0.8078431, 0, 1, 1,
0.8570178, -0.01848278, 2.223024, 0.8117647, 0, 1, 1,
0.8572553, 0.5738993, 1.674739, 0.8196079, 0, 1, 1,
0.8608283, -0.638673, 2.16368, 0.8235294, 0, 1, 1,
0.8627673, -1.212497, 3.033827, 0.8313726, 0, 1, 1,
0.8654813, -0.9707009, 3.743806, 0.8352941, 0, 1, 1,
0.8698722, 0.1531701, 1.454691, 0.8431373, 0, 1, 1,
0.8759855, 0.3298245, 0.5736621, 0.8470588, 0, 1, 1,
0.8811848, -1.502807, 2.271924, 0.854902, 0, 1, 1,
0.8828334, 0.3761742, 2.109337, 0.8588235, 0, 1, 1,
0.8830354, 1.11563, 0.2804713, 0.8666667, 0, 1, 1,
0.8841434, 0.1914056, 2.354343, 0.8705882, 0, 1, 1,
0.8899796, -0.58283, -0.377419, 0.8784314, 0, 1, 1,
0.8928337, 0.7439922, 0.4892147, 0.8823529, 0, 1, 1,
0.9033901, -1.509647, 3.193058, 0.8901961, 0, 1, 1,
0.9069328, 0.2667648, 0.4002956, 0.8941177, 0, 1, 1,
0.9083554, -0.3734003, 1.399337, 0.9019608, 0, 1, 1,
0.9085649, 0.6107622, 1.181233, 0.9098039, 0, 1, 1,
0.9153838, 0.1080573, 2.275267, 0.9137255, 0, 1, 1,
0.9221513, 2.342945, 0.7055888, 0.9215686, 0, 1, 1,
0.9227454, -1.019308, 2.879443, 0.9254902, 0, 1, 1,
0.923795, 0.7537919, 0.3379122, 0.9333333, 0, 1, 1,
0.9294063, -0.05764507, 2.186432, 0.9372549, 0, 1, 1,
0.937624, 0.6151205, 0.9997423, 0.945098, 0, 1, 1,
0.9376504, -1.796712, 2.420501, 0.9490196, 0, 1, 1,
0.945124, -1.820035, 1.867253, 0.9568627, 0, 1, 1,
0.9470016, 0.1685405, 1.494554, 0.9607843, 0, 1, 1,
0.9486598, 0.4384819, 3.63163, 0.9686275, 0, 1, 1,
0.9529365, -0.2352961, 0.1771984, 0.972549, 0, 1, 1,
0.9544951, -1.961188, 2.199605, 0.9803922, 0, 1, 1,
0.9676394, 0.7833813, 0.5052834, 0.9843137, 0, 1, 1,
0.9712412, 0.2918293, 2.67928, 0.9921569, 0, 1, 1,
0.9756823, -0.4745778, 2.753938, 0.9960784, 0, 1, 1,
0.9774568, -0.1983083, 2.094029, 1, 0, 0.9960784, 1,
0.9842478, -0.4514946, 2.0635, 1, 0, 0.9882353, 1,
0.9854413, 0.9537425, 2.778108, 1, 0, 0.9843137, 1,
0.9882936, -0.4326497, 1.599008, 1, 0, 0.9764706, 1,
0.9894477, 0.6223818, -0.2669196, 1, 0, 0.972549, 1,
0.9905467, -1.115577, 1.929027, 1, 0, 0.9647059, 1,
0.9906151, -0.4654238, 1.913896, 1, 0, 0.9607843, 1,
0.9974087, -0.2776234, 2.44903, 1, 0, 0.9529412, 1,
1.013743, -0.2740146, 2.261166, 1, 0, 0.9490196, 1,
1.017654, -1.813445, 4.143265, 1, 0, 0.9411765, 1,
1.01893, 0.3832575, 1.379599, 1, 0, 0.9372549, 1,
1.037523, 0.2406744, 1.264764, 1, 0, 0.9294118, 1,
1.038888, 0.576127, 0.4426798, 1, 0, 0.9254902, 1,
1.045791, 0.09808353, -0.3360884, 1, 0, 0.9176471, 1,
1.046481, 0.2381799, 1.630142, 1, 0, 0.9137255, 1,
1.060583, 0.08109826, 3.076892, 1, 0, 0.9058824, 1,
1.060787, 1.610227, 0.6359454, 1, 0, 0.9019608, 1,
1.061875, 1.218577, 2.296298, 1, 0, 0.8941177, 1,
1.069103, 0.9041001, 0.66285, 1, 0, 0.8862745, 1,
1.070004, 0.5894713, 0.4818423, 1, 0, 0.8823529, 1,
1.07114, -0.5956668, 1.037013, 1, 0, 0.8745098, 1,
1.071835, -0.6015093, 3.539238, 1, 0, 0.8705882, 1,
1.073514, 0.7381609, 2.21876, 1, 0, 0.8627451, 1,
1.074056, -0.4148227, 0.3413695, 1, 0, 0.8588235, 1,
1.083276, 0.1964529, 0.5328539, 1, 0, 0.8509804, 1,
1.084159, -0.181691, 0.7338746, 1, 0, 0.8470588, 1,
1.086607, 0.5420904, 1.441082, 1, 0, 0.8392157, 1,
1.087291, 0.7411537, 1.538627, 1, 0, 0.8352941, 1,
1.099804, 1.229181, 1.349644, 1, 0, 0.827451, 1,
1.101268, 1.286395, 0.6796825, 1, 0, 0.8235294, 1,
1.101319, 0.3563614, 1.793459, 1, 0, 0.8156863, 1,
1.105002, 0.9747095, 0.5058888, 1, 0, 0.8117647, 1,
1.108736, 0.9796878, 2.116109, 1, 0, 0.8039216, 1,
1.109765, 1.039817, 0.111656, 1, 0, 0.7960784, 1,
1.112419, -0.343189, 0.004856927, 1, 0, 0.7921569, 1,
1.113779, -1.336853, 2.747994, 1, 0, 0.7843137, 1,
1.116326, -0.5118981, 0.3815576, 1, 0, 0.7803922, 1,
1.118267, -0.3325225, 2.516061, 1, 0, 0.772549, 1,
1.135566, 0.08475775, 0.968087, 1, 0, 0.7686275, 1,
1.147932, -0.3826825, 1.245589, 1, 0, 0.7607843, 1,
1.149091, -0.8502639, 2.393759, 1, 0, 0.7568628, 1,
1.155273, 2.024273, -1.845379, 1, 0, 0.7490196, 1,
1.159761, -0.5755844, 2.750356, 1, 0, 0.7450981, 1,
1.160786, 0.0933083, 1.992577, 1, 0, 0.7372549, 1,
1.162969, 0.164346, -0.2903275, 1, 0, 0.7333333, 1,
1.169323, -0.2953511, 2.810773, 1, 0, 0.7254902, 1,
1.170985, 0.4902579, 0.6979197, 1, 0, 0.7215686, 1,
1.172567, -0.2230624, 0.7336795, 1, 0, 0.7137255, 1,
1.180406, 0.1574957, 0.4476365, 1, 0, 0.7098039, 1,
1.181741, -1.429801, 2.175532, 1, 0, 0.7019608, 1,
1.18525, 0.06118998, 0.8644788, 1, 0, 0.6941177, 1,
1.186514, 1.869365, 0.7030597, 1, 0, 0.6901961, 1,
1.19777, 0.03755173, 2.150893, 1, 0, 0.682353, 1,
1.198504, -0.3716539, 1.749066, 1, 0, 0.6784314, 1,
1.199638, 0.7277777, 1.386465, 1, 0, 0.6705883, 1,
1.207557, 0.04431883, 1.207106, 1, 0, 0.6666667, 1,
1.223462, 1.085693, 1.129401, 1, 0, 0.6588235, 1,
1.224659, 0.2150589, 1.661486, 1, 0, 0.654902, 1,
1.22655, 0.8544681, 1.228618, 1, 0, 0.6470588, 1,
1.231531, -0.9030942, 4.35192, 1, 0, 0.6431373, 1,
1.245146, -0.387695, 3.511575, 1, 0, 0.6352941, 1,
1.252964, 0.2902223, 0.9729601, 1, 0, 0.6313726, 1,
1.254845, -0.06924707, 3.59648, 1, 0, 0.6235294, 1,
1.260919, 0.9312467, -0.08522633, 1, 0, 0.6196079, 1,
1.278453, -1.405186, 1.437576, 1, 0, 0.6117647, 1,
1.287541, -1.103146, 1.672445, 1, 0, 0.6078432, 1,
1.295563, -0.3065141, 2.144483, 1, 0, 0.6, 1,
1.302655, 2.439626, 0.275132, 1, 0, 0.5921569, 1,
1.321251, 0.3367629, -0.6422026, 1, 0, 0.5882353, 1,
1.337459, -0.4188548, 2.433013, 1, 0, 0.5803922, 1,
1.343894, -0.3326733, 1.176438, 1, 0, 0.5764706, 1,
1.344193, 1.233587, 0.2023215, 1, 0, 0.5686275, 1,
1.345302, -0.985613, 2.024842, 1, 0, 0.5647059, 1,
1.352472, 1.123725, 0.3268394, 1, 0, 0.5568628, 1,
1.352717, -0.3886198, 1.329676, 1, 0, 0.5529412, 1,
1.353108, 0.338109, 1.228842, 1, 0, 0.5450981, 1,
1.373411, 0.08557223, 1.235438, 1, 0, 0.5411765, 1,
1.383776, -0.8691664, -0.7340347, 1, 0, 0.5333334, 1,
1.38755, -0.2729492, 3.830738, 1, 0, 0.5294118, 1,
1.390908, -0.2473511, 2.888461, 1, 0, 0.5215687, 1,
1.391993, -0.2535742, 2.525424, 1, 0, 0.5176471, 1,
1.420663, 1.715127, 1.670909, 1, 0, 0.509804, 1,
1.421541, -1.800025, 3.197025, 1, 0, 0.5058824, 1,
1.429599, 0.7613942, 0.6929726, 1, 0, 0.4980392, 1,
1.431985, 0.3545855, -0.2965541, 1, 0, 0.4901961, 1,
1.432526, 0.8072473, 1.702206, 1, 0, 0.4862745, 1,
1.433223, -0.1558011, 1.970206, 1, 0, 0.4784314, 1,
1.442713, 1.061546, 1.118801, 1, 0, 0.4745098, 1,
1.447586, 0.08980069, 1.501723, 1, 0, 0.4666667, 1,
1.460951, -1.227782, 4.897675, 1, 0, 0.4627451, 1,
1.462659, -0.9084839, 3.314149, 1, 0, 0.454902, 1,
1.470196, 0.7114542, 0.5359578, 1, 0, 0.4509804, 1,
1.473173, -0.2224582, 1.851881, 1, 0, 0.4431373, 1,
1.473306, 1.773044, -0.6031923, 1, 0, 0.4392157, 1,
1.482033, 0.272879, 0.2157768, 1, 0, 0.4313726, 1,
1.486692, -0.2828584, 1.780555, 1, 0, 0.427451, 1,
1.488574, 1.170009, 1.084384, 1, 0, 0.4196078, 1,
1.491913, -1.09002, 1.528538, 1, 0, 0.4156863, 1,
1.496682, -0.1569406, 2.208845, 1, 0, 0.4078431, 1,
1.497862, 0.6493296, 0.3505438, 1, 0, 0.4039216, 1,
1.509907, 1.370029, 0.8271108, 1, 0, 0.3960784, 1,
1.510151, -0.16577, 2.717658, 1, 0, 0.3882353, 1,
1.511526, 0.8908591, 2.822676, 1, 0, 0.3843137, 1,
1.513705, -0.9622779, 2.663979, 1, 0, 0.3764706, 1,
1.531757, -0.2596757, -0.6553729, 1, 0, 0.372549, 1,
1.540926, -1.611891, 2.353728, 1, 0, 0.3647059, 1,
1.55149, 0.6005844, 2.356625, 1, 0, 0.3607843, 1,
1.561143, -1.632874, 2.786925, 1, 0, 0.3529412, 1,
1.578634, -0.8236868, 1.017944, 1, 0, 0.3490196, 1,
1.578724, -1.558937, 0.07089181, 1, 0, 0.3411765, 1,
1.593324, 0.4386803, 2.239597, 1, 0, 0.3372549, 1,
1.597192, -1.636864, 3.236562, 1, 0, 0.3294118, 1,
1.609915, -0.1538804, 1.339898, 1, 0, 0.3254902, 1,
1.616693, 0.06542203, -0.7058854, 1, 0, 0.3176471, 1,
1.625132, 0.3296717, -0.02188244, 1, 0, 0.3137255, 1,
1.642728, -0.2185781, 1.589055, 1, 0, 0.3058824, 1,
1.64344, 0.5776104, 2.146091, 1, 0, 0.2980392, 1,
1.661194, 0.3090392, 0.4097459, 1, 0, 0.2941177, 1,
1.664514, 0.7686461, 0.5473318, 1, 0, 0.2862745, 1,
1.684329, -0.2922236, 1.323316, 1, 0, 0.282353, 1,
1.68556, 0.495473, 0.8339793, 1, 0, 0.2745098, 1,
1.695953, -0.4220391, 2.544328, 1, 0, 0.2705882, 1,
1.706523, 0.4698232, 0.7731105, 1, 0, 0.2627451, 1,
1.706897, -1.379411, 3.402193, 1, 0, 0.2588235, 1,
1.711732, -0.1492766, 2.156938, 1, 0, 0.2509804, 1,
1.712396, 0.9464437, 1.491368, 1, 0, 0.2470588, 1,
1.71442, -0.4224474, 1.380232, 1, 0, 0.2392157, 1,
1.738855, 0.4539978, 0.3559732, 1, 0, 0.2352941, 1,
1.755835, -0.6370858, 3.777642, 1, 0, 0.227451, 1,
1.7624, -0.8498314, 1.202315, 1, 0, 0.2235294, 1,
1.772449, 0.3945217, 2.016207, 1, 0, 0.2156863, 1,
1.789167, 1.312753, 0.9266831, 1, 0, 0.2117647, 1,
1.795172, -0.1828146, 1.996057, 1, 0, 0.2039216, 1,
1.805036, 1.268352, 0.2964082, 1, 0, 0.1960784, 1,
1.805932, -0.9409527, 1.707791, 1, 0, 0.1921569, 1,
1.838411, 0.3096978, 1.789811, 1, 0, 0.1843137, 1,
1.840598, -0.124179, 2.317787, 1, 0, 0.1803922, 1,
1.858729, 0.3509214, 2.310344, 1, 0, 0.172549, 1,
1.864075, -0.6932948, 0.633733, 1, 0, 0.1686275, 1,
1.864626, -0.9492075, 1.264663, 1, 0, 0.1607843, 1,
1.878729, 0.07219081, 1.966103, 1, 0, 0.1568628, 1,
1.887949, 0.4065155, 0.1709894, 1, 0, 0.1490196, 1,
1.910276, 0.7667941, 2.427482, 1, 0, 0.145098, 1,
1.964394, 1.531722, 0.8254762, 1, 0, 0.1372549, 1,
1.9834, -0.1160535, 1.878677, 1, 0, 0.1333333, 1,
1.986945, -1.163645, 3.29022, 1, 0, 0.1254902, 1,
2.019939, -0.8303382, 2.357089, 1, 0, 0.1215686, 1,
2.024356, -0.2861829, 1.906936, 1, 0, 0.1137255, 1,
2.033373, -1.089659, 1.971239, 1, 0, 0.1098039, 1,
2.061496, 0.2310706, 2.158063, 1, 0, 0.1019608, 1,
2.090389, 0.3210915, 0.6821892, 1, 0, 0.09411765, 1,
2.106611, -0.1249254, 0.8856585, 1, 0, 0.09019608, 1,
2.108095, -1.22562, 2.929927, 1, 0, 0.08235294, 1,
2.131342, 0.6728659, 0.6156253, 1, 0, 0.07843138, 1,
2.140689, 1.636907, 1.148218, 1, 0, 0.07058824, 1,
2.184006, -0.6221773, 1.05983, 1, 0, 0.06666667, 1,
2.197465, -0.2133652, 0.8816503, 1, 0, 0.05882353, 1,
2.222222, 1.508602, 1.379223, 1, 0, 0.05490196, 1,
2.313369, -0.4035241, 0.5858032, 1, 0, 0.04705882, 1,
2.317221, 1.278174, 0.8191491, 1, 0, 0.04313726, 1,
2.372345, -0.3695456, 0.8525784, 1, 0, 0.03529412, 1,
2.468163, 2.021984, 0.1962576, 1, 0, 0.03137255, 1,
2.536591, -1.464082, 2.878706, 1, 0, 0.02352941, 1,
2.585849, 0.194171, 1.39939, 1, 0, 0.01960784, 1,
2.709036, 0.1563327, 1.719772, 1, 0, 0.01176471, 1,
2.847248, 3.145272, 0.05909507, 1, 0, 0.007843138, 1
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
-0.4759877, -4.200519, -7.027513, 0, -0.5, 0.5, 0.5,
-0.4759877, -4.200519, -7.027513, 1, -0.5, 0.5, 0.5,
-0.4759877, -4.200519, -7.027513, 1, 1.5, 0.5, 0.5,
-0.4759877, -4.200519, -7.027513, 0, 1.5, 0.5, 0.5
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
-4.9258, 0.2449825, -7.027513, 0, -0.5, 0.5, 0.5,
-4.9258, 0.2449825, -7.027513, 1, -0.5, 0.5, 0.5,
-4.9258, 0.2449825, -7.027513, 1, 1.5, 0.5, 0.5,
-4.9258, 0.2449825, -7.027513, 0, 1.5, 0.5, 0.5
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
-4.9258, -4.200519, -0.2007377, 0, -0.5, 0.5, 0.5,
-4.9258, -4.200519, -0.2007377, 1, -0.5, 0.5, 0.5,
-4.9258, -4.200519, -0.2007377, 1, 1.5, 0.5, 0.5,
-4.9258, -4.200519, -0.2007377, 0, 1.5, 0.5, 0.5
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
-3, -3.174634, -5.452103,
2, -3.174634, -5.452103,
-3, -3.174634, -5.452103,
-3, -3.345614, -5.714671,
-2, -3.174634, -5.452103,
-2, -3.345614, -5.714671,
-1, -3.174634, -5.452103,
-1, -3.345614, -5.714671,
0, -3.174634, -5.452103,
0, -3.345614, -5.714671,
1, -3.174634, -5.452103,
1, -3.345614, -5.714671,
2, -3.174634, -5.452103,
2, -3.345614, -5.714671
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
-3, -3.687576, -6.239808, 0, -0.5, 0.5, 0.5,
-3, -3.687576, -6.239808, 1, -0.5, 0.5, 0.5,
-3, -3.687576, -6.239808, 1, 1.5, 0.5, 0.5,
-3, -3.687576, -6.239808, 0, 1.5, 0.5, 0.5,
-2, -3.687576, -6.239808, 0, -0.5, 0.5, 0.5,
-2, -3.687576, -6.239808, 1, -0.5, 0.5, 0.5,
-2, -3.687576, -6.239808, 1, 1.5, 0.5, 0.5,
-2, -3.687576, -6.239808, 0, 1.5, 0.5, 0.5,
-1, -3.687576, -6.239808, 0, -0.5, 0.5, 0.5,
-1, -3.687576, -6.239808, 1, -0.5, 0.5, 0.5,
-1, -3.687576, -6.239808, 1, 1.5, 0.5, 0.5,
-1, -3.687576, -6.239808, 0, 1.5, 0.5, 0.5,
0, -3.687576, -6.239808, 0, -0.5, 0.5, 0.5,
0, -3.687576, -6.239808, 1, -0.5, 0.5, 0.5,
0, -3.687576, -6.239808, 1, 1.5, 0.5, 0.5,
0, -3.687576, -6.239808, 0, 1.5, 0.5, 0.5,
1, -3.687576, -6.239808, 0, -0.5, 0.5, 0.5,
1, -3.687576, -6.239808, 1, -0.5, 0.5, 0.5,
1, -3.687576, -6.239808, 1, 1.5, 0.5, 0.5,
1, -3.687576, -6.239808, 0, 1.5, 0.5, 0.5,
2, -3.687576, -6.239808, 0, -0.5, 0.5, 0.5,
2, -3.687576, -6.239808, 1, -0.5, 0.5, 0.5,
2, -3.687576, -6.239808, 1, 1.5, 0.5, 0.5,
2, -3.687576, -6.239808, 0, 1.5, 0.5, 0.5
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
-3.898921, -3, -5.452103,
-3.898921, 3, -5.452103,
-3.898921, -3, -5.452103,
-4.070067, -3, -5.714671,
-3.898921, -2, -5.452103,
-4.070067, -2, -5.714671,
-3.898921, -1, -5.452103,
-4.070067, -1, -5.714671,
-3.898921, 0, -5.452103,
-4.070067, 0, -5.714671,
-3.898921, 1, -5.452103,
-4.070067, 1, -5.714671,
-3.898921, 2, -5.452103,
-4.070067, 2, -5.714671,
-3.898921, 3, -5.452103,
-4.070067, 3, -5.714671
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
-4.41236, -3, -6.239808, 0, -0.5, 0.5, 0.5,
-4.41236, -3, -6.239808, 1, -0.5, 0.5, 0.5,
-4.41236, -3, -6.239808, 1, 1.5, 0.5, 0.5,
-4.41236, -3, -6.239808, 0, 1.5, 0.5, 0.5,
-4.41236, -2, -6.239808, 0, -0.5, 0.5, 0.5,
-4.41236, -2, -6.239808, 1, -0.5, 0.5, 0.5,
-4.41236, -2, -6.239808, 1, 1.5, 0.5, 0.5,
-4.41236, -2, -6.239808, 0, 1.5, 0.5, 0.5,
-4.41236, -1, -6.239808, 0, -0.5, 0.5, 0.5,
-4.41236, -1, -6.239808, 1, -0.5, 0.5, 0.5,
-4.41236, -1, -6.239808, 1, 1.5, 0.5, 0.5,
-4.41236, -1, -6.239808, 0, 1.5, 0.5, 0.5,
-4.41236, 0, -6.239808, 0, -0.5, 0.5, 0.5,
-4.41236, 0, -6.239808, 1, -0.5, 0.5, 0.5,
-4.41236, 0, -6.239808, 1, 1.5, 0.5, 0.5,
-4.41236, 0, -6.239808, 0, 1.5, 0.5, 0.5,
-4.41236, 1, -6.239808, 0, -0.5, 0.5, 0.5,
-4.41236, 1, -6.239808, 1, -0.5, 0.5, 0.5,
-4.41236, 1, -6.239808, 1, 1.5, 0.5, 0.5,
-4.41236, 1, -6.239808, 0, 1.5, 0.5, 0.5,
-4.41236, 2, -6.239808, 0, -0.5, 0.5, 0.5,
-4.41236, 2, -6.239808, 1, -0.5, 0.5, 0.5,
-4.41236, 2, -6.239808, 1, 1.5, 0.5, 0.5,
-4.41236, 2, -6.239808, 0, 1.5, 0.5, 0.5,
-4.41236, 3, -6.239808, 0, -0.5, 0.5, 0.5,
-4.41236, 3, -6.239808, 1, -0.5, 0.5, 0.5,
-4.41236, 3, -6.239808, 1, 1.5, 0.5, 0.5,
-4.41236, 3, -6.239808, 0, 1.5, 0.5, 0.5
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
-3.898921, -3.174634, -4,
-3.898921, -3.174634, 4,
-3.898921, -3.174634, -4,
-4.070067, -3.345614, -4,
-3.898921, -3.174634, -2,
-4.070067, -3.345614, -2,
-3.898921, -3.174634, 0,
-4.070067, -3.345614, 0,
-3.898921, -3.174634, 2,
-4.070067, -3.345614, 2,
-3.898921, -3.174634, 4,
-4.070067, -3.345614, 4
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
-4.41236, -3.687576, -4, 0, -0.5, 0.5, 0.5,
-4.41236, -3.687576, -4, 1, -0.5, 0.5, 0.5,
-4.41236, -3.687576, -4, 1, 1.5, 0.5, 0.5,
-4.41236, -3.687576, -4, 0, 1.5, 0.5, 0.5,
-4.41236, -3.687576, -2, 0, -0.5, 0.5, 0.5,
-4.41236, -3.687576, -2, 1, -0.5, 0.5, 0.5,
-4.41236, -3.687576, -2, 1, 1.5, 0.5, 0.5,
-4.41236, -3.687576, -2, 0, 1.5, 0.5, 0.5,
-4.41236, -3.687576, 0, 0, -0.5, 0.5, 0.5,
-4.41236, -3.687576, 0, 1, -0.5, 0.5, 0.5,
-4.41236, -3.687576, 0, 1, 1.5, 0.5, 0.5,
-4.41236, -3.687576, 0, 0, 1.5, 0.5, 0.5,
-4.41236, -3.687576, 2, 0, -0.5, 0.5, 0.5,
-4.41236, -3.687576, 2, 1, -0.5, 0.5, 0.5,
-4.41236, -3.687576, 2, 1, 1.5, 0.5, 0.5,
-4.41236, -3.687576, 2, 0, 1.5, 0.5, 0.5,
-4.41236, -3.687576, 4, 0, -0.5, 0.5, 0.5,
-4.41236, -3.687576, 4, 1, -0.5, 0.5, 0.5,
-4.41236, -3.687576, 4, 1, 1.5, 0.5, 0.5,
-4.41236, -3.687576, 4, 0, 1.5, 0.5, 0.5
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
-3.898921, -3.174634, -5.452103,
-3.898921, 3.664599, -5.452103,
-3.898921, -3.174634, 5.050627,
-3.898921, 3.664599, 5.050627,
-3.898921, -3.174634, -5.452103,
-3.898921, -3.174634, 5.050627,
-3.898921, 3.664599, -5.452103,
-3.898921, 3.664599, 5.050627,
-3.898921, -3.174634, -5.452103,
2.946945, -3.174634, -5.452103,
-3.898921, -3.174634, 5.050627,
2.946945, -3.174634, 5.050627,
-3.898921, 3.664599, -5.452103,
2.946945, 3.664599, -5.452103,
-3.898921, 3.664599, 5.050627,
2.946945, 3.664599, 5.050627,
2.946945, -3.174634, -5.452103,
2.946945, 3.664599, -5.452103,
2.946945, -3.174634, 5.050627,
2.946945, 3.664599, 5.050627,
2.946945, -3.174634, -5.452103,
2.946945, -3.174634, 5.050627,
2.946945, 3.664599, -5.452103,
2.946945, 3.664599, 5.050627
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
var radius = 7.625802;
var distance = 33.92805;
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
mvMatrix.translate( 0.4759877, -0.2449825, 0.2007377 );
mvMatrix.scale( 1.204401, 1.205569, 0.7850499 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.92805);
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
Camphene<-read.table("Camphene.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Camphene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Camphene' not found
```

```r
y<-Camphene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Camphene' not found
```

```r
z<-Camphene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Camphene' not found
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
-3.799223, -0.3509457, -3.105239, 0, 0, 1, 1, 1,
-3.097896, -0.3852773, -2.163116, 1, 0, 0, 1, 1,
-2.725775, -0.04472043, -1.398033, 1, 0, 0, 1, 1,
-2.533696, 1.858641, 1.983727, 1, 0, 0, 1, 1,
-2.499647, 0.5450424, -1.614567, 1, 0, 0, 1, 1,
-2.4696, -1.420106, -2.887363, 1, 0, 0, 1, 1,
-2.46247, -3.075033, -2.371857, 0, 0, 0, 1, 1,
-2.419155, -0.3986216, -0.1612905, 0, 0, 0, 1, 1,
-2.418149, 2.122067, -1.43227, 0, 0, 0, 1, 1,
-2.393108, 0.5147887, -1.645923, 0, 0, 0, 1, 1,
-2.384362, 0.8435045, -0.5414951, 0, 0, 0, 1, 1,
-2.301085, -0.08087361, -0.2800717, 0, 0, 0, 1, 1,
-2.290492, 1.442209, -1.794003, 0, 0, 0, 1, 1,
-2.245406, -0.06336592, -2.381321, 1, 1, 1, 1, 1,
-2.240148, 0.4324519, -3.032702, 1, 1, 1, 1, 1,
-2.229727, -0.3199684, 0.03904657, 1, 1, 1, 1, 1,
-2.215322, -0.723151, -1.86553, 1, 1, 1, 1, 1,
-2.197179, -1.127027, -1.708047, 1, 1, 1, 1, 1,
-2.147694, 1.58565, 0.1805113, 1, 1, 1, 1, 1,
-2.106717, -0.4803148, -0.08531437, 1, 1, 1, 1, 1,
-2.09953, 0.1295724, 0.3879394, 1, 1, 1, 1, 1,
-2.069282, 0.7326025, -0.5303103, 1, 1, 1, 1, 1,
-2.050967, 2.736255, -0.4217565, 1, 1, 1, 1, 1,
-2.019984, 0.9139891, -0.261829, 1, 1, 1, 1, 1,
-2.019093, 0.04195476, -0.3101349, 1, 1, 1, 1, 1,
-2.009621, 1.14242, -3.2554, 1, 1, 1, 1, 1,
-1.999667, 0.8571733, -1.615604, 1, 1, 1, 1, 1,
-1.991499, 0.5793123, 0.1412122, 1, 1, 1, 1, 1,
-1.96623, 0.6354068, -0.4933398, 0, 0, 1, 1, 1,
-1.955603, 0.546703, -0.8548947, 1, 0, 0, 1, 1,
-1.95274, -0.04098036, -2.287308, 1, 0, 0, 1, 1,
-1.950464, -0.2162668, -2.131545, 1, 0, 0, 1, 1,
-1.948503, -0.9229847, -0.7694866, 1, 0, 0, 1, 1,
-1.945176, -2.843297, -2.711365, 1, 0, 0, 1, 1,
-1.940149, -2.396002, -2.947457, 0, 0, 0, 1, 1,
-1.90666, -0.2054008, -0.3643368, 0, 0, 0, 1, 1,
-1.904255, 1.077659, 0.2860841, 0, 0, 0, 1, 1,
-1.904092, 1.700633, -0.8242391, 0, 0, 0, 1, 1,
-1.886224, -0.735274, -2.001748, 0, 0, 0, 1, 1,
-1.868111, -0.4487185, -1.967212, 0, 0, 0, 1, 1,
-1.846734, -0.643118, -3.442614, 0, 0, 0, 1, 1,
-1.831881, -1.627572, -0.802572, 1, 1, 1, 1, 1,
-1.808452, 0.8854414, -0.8432474, 1, 1, 1, 1, 1,
-1.805303, -1.645957, -3.548741, 1, 1, 1, 1, 1,
-1.790765, 0.8629004, -2.337707, 1, 1, 1, 1, 1,
-1.781108, -1.069758, -1.368097, 1, 1, 1, 1, 1,
-1.780466, 1.662464, -0.5309811, 1, 1, 1, 1, 1,
-1.772216, 0.7786908, -0.6532717, 1, 1, 1, 1, 1,
-1.761688, 0.00173869, -1.897691, 1, 1, 1, 1, 1,
-1.733521, -0.007230437, -0.4277234, 1, 1, 1, 1, 1,
-1.722904, -0.1428219, -1.082454, 1, 1, 1, 1, 1,
-1.701284, 1.225965, -0.5858999, 1, 1, 1, 1, 1,
-1.691112, -0.09037121, -1.167522, 1, 1, 1, 1, 1,
-1.688553, -1.009706, -2.226043, 1, 1, 1, 1, 1,
-1.661119, -1.503859, -0.2727879, 1, 1, 1, 1, 1,
-1.660722, 0.7469598, -0.2658757, 1, 1, 1, 1, 1,
-1.652784, -0.2309165, -1.251304, 0, 0, 1, 1, 1,
-1.649955, 0.256638, -0.6412261, 1, 0, 0, 1, 1,
-1.641076, -0.7205932, -1.202547, 1, 0, 0, 1, 1,
-1.636871, 1.471757, -2.458077, 1, 0, 0, 1, 1,
-1.636793, 0.3995981, -0.6014342, 1, 0, 0, 1, 1,
-1.626636, 1.016612, -2.054518, 1, 0, 0, 1, 1,
-1.626601, -2.018288, -3.412779, 0, 0, 0, 1, 1,
-1.618791, -0.06629282, -2.200169, 0, 0, 0, 1, 1,
-1.61277, 0.5543766, 0.3352142, 0, 0, 0, 1, 1,
-1.607581, -1.577947, -2.410415, 0, 0, 0, 1, 1,
-1.588919, 0.2145965, -3.048298, 0, 0, 0, 1, 1,
-1.576406, -0.1696256, -1.673305, 0, 0, 0, 1, 1,
-1.573131, -1.40703, -0.9482247, 0, 0, 0, 1, 1,
-1.557338, 1.126265, 0.4814529, 1, 1, 1, 1, 1,
-1.554807, 1.730025, -1.333004, 1, 1, 1, 1, 1,
-1.549606, 2.237426, -1.482454, 1, 1, 1, 1, 1,
-1.549416, 0.2013228, -1.817519, 1, 1, 1, 1, 1,
-1.548887, 1.843933, -0.2449621, 1, 1, 1, 1, 1,
-1.541989, -0.723431, -1.66479, 1, 1, 1, 1, 1,
-1.538449, 1.95273, -1.570341, 1, 1, 1, 1, 1,
-1.535798, 1.282171, -0.7774108, 1, 1, 1, 1, 1,
-1.526121, 2.176007, 0.07933082, 1, 1, 1, 1, 1,
-1.51517, 0.3874238, -2.477084, 1, 1, 1, 1, 1,
-1.513428, 1.996612, -0.8018155, 1, 1, 1, 1, 1,
-1.511157, 0.1369044, -0.2924785, 1, 1, 1, 1, 1,
-1.507903, -0.9930289, -0.8038209, 1, 1, 1, 1, 1,
-1.482162, -0.2697559, -1.64157, 1, 1, 1, 1, 1,
-1.478861, -0.6163253, -2.090693, 1, 1, 1, 1, 1,
-1.463955, 0.9544407, -0.1796077, 0, 0, 1, 1, 1,
-1.459837, -0.3824423, -2.671627, 1, 0, 0, 1, 1,
-1.457661, -0.8992808, -1.584874, 1, 0, 0, 1, 1,
-1.4554, 2.227264, -0.6080294, 1, 0, 0, 1, 1,
-1.446425, 0.6577919, -1.426858, 1, 0, 0, 1, 1,
-1.442066, -0.3151454, -1.925514, 1, 0, 0, 1, 1,
-1.428327, -0.9561179, -0.7943292, 0, 0, 0, 1, 1,
-1.403528, -1.939436, -1.730795, 0, 0, 0, 1, 1,
-1.402949, 1.395536, -2.78256, 0, 0, 0, 1, 1,
-1.390757, 0.4460935, -2.711217, 0, 0, 0, 1, 1,
-1.377658, -0.4150849, -1.717432, 0, 0, 0, 1, 1,
-1.362816, 1.259427, -0.6393203, 0, 0, 0, 1, 1,
-1.338607, 1.356118, -0.8318377, 0, 0, 0, 1, 1,
-1.326487, -0.8209506, -1.840525, 1, 1, 1, 1, 1,
-1.303429, -0.8717695, -0.1986605, 1, 1, 1, 1, 1,
-1.300356, 1.189937, -0.07679481, 1, 1, 1, 1, 1,
-1.283606, -1.886271, -2.539459, 1, 1, 1, 1, 1,
-1.270966, -0.617044, -2.078416, 1, 1, 1, 1, 1,
-1.257562, 1.748904, -0.02457795, 1, 1, 1, 1, 1,
-1.256629, -1.454994, -1.949954, 1, 1, 1, 1, 1,
-1.248951, -0.2385514, -4.586914, 1, 1, 1, 1, 1,
-1.246224, -1.459015, -0.7063135, 1, 1, 1, 1, 1,
-1.242923, 0.1230672, -1.289257, 1, 1, 1, 1, 1,
-1.223937, 1.582195, -0.8153468, 1, 1, 1, 1, 1,
-1.206359, -0.9476803, -1.8509, 1, 1, 1, 1, 1,
-1.203595, -1.035465, -2.346417, 1, 1, 1, 1, 1,
-1.195592, 0.02634549, -3.898811, 1, 1, 1, 1, 1,
-1.179754, -1.335436, -1.470985, 1, 1, 1, 1, 1,
-1.177673, -0.6942303, -1.95084, 0, 0, 1, 1, 1,
-1.16932, 0.3918507, -3.633584, 1, 0, 0, 1, 1,
-1.163059, 0.9966925, -0.3809896, 1, 0, 0, 1, 1,
-1.162449, 0.7310781, -2.521839, 1, 0, 0, 1, 1,
-1.156754, -0.1200137, -3.16165, 1, 0, 0, 1, 1,
-1.155125, 0.8597503, -1.455875, 1, 0, 0, 1, 1,
-1.146755, -0.5507256, -2.557098, 0, 0, 0, 1, 1,
-1.145209, 0.1841109, -1.493587, 0, 0, 0, 1, 1,
-1.143854, -1.38711, -3.433821, 0, 0, 0, 1, 1,
-1.138647, 1.839058, -1.190103, 0, 0, 0, 1, 1,
-1.115053, 0.793646, -1.095915, 0, 0, 0, 1, 1,
-1.1143, -0.08954687, 0.3296805, 0, 0, 0, 1, 1,
-1.105917, -1.071531, -3.129464, 0, 0, 0, 1, 1,
-1.100656, 1.152537, -2.269919, 1, 1, 1, 1, 1,
-1.093834, -0.8612691, -2.382799, 1, 1, 1, 1, 1,
-1.093257, 0.3862424, 0.9981292, 1, 1, 1, 1, 1,
-1.087089, -0.9633362, -2.2836, 1, 1, 1, 1, 1,
-1.086994, 0.3316908, -0.9331553, 1, 1, 1, 1, 1,
-1.084682, 1.542183, -0.21783, 1, 1, 1, 1, 1,
-1.083727, -0.5890807, -1.759876, 1, 1, 1, 1, 1,
-1.078161, 0.1806892, -2.32336, 1, 1, 1, 1, 1,
-1.070705, -0.9278047, -3.561367, 1, 1, 1, 1, 1,
-1.054745, 0.04416353, -2.377942, 1, 1, 1, 1, 1,
-1.051155, 0.5063601, -0.5508524, 1, 1, 1, 1, 1,
-1.044553, 0.6566054, -0.3682009, 1, 1, 1, 1, 1,
-1.033568, 0.6707087, 0.1568865, 1, 1, 1, 1, 1,
-1.030259, 0.9052535, -1.41855, 1, 1, 1, 1, 1,
-1.027284, -0.4654828, -3.484617, 1, 1, 1, 1, 1,
-1.027245, -0.3512046, -3.227865, 0, 0, 1, 1, 1,
-1.0253, -0.9004472, -1.168708, 1, 0, 0, 1, 1,
-1.02375, 1.013976, -0.5942264, 1, 0, 0, 1, 1,
-1.023049, -0.7699707, -1.974915, 1, 0, 0, 1, 1,
-1.009588, 1.489255, -0.9214758, 1, 0, 0, 1, 1,
-1.009017, 1.298449, -0.4518974, 1, 0, 0, 1, 1,
-1.005276, -0.3427199, -3.691717, 0, 0, 0, 1, 1,
-1.00445, 1.025152, -1.708402, 0, 0, 0, 1, 1,
-1.003444, -0.4261735, -3.985856, 0, 0, 0, 1, 1,
-0.992779, 0.2792931, 0.3634031, 0, 0, 0, 1, 1,
-0.9884237, -0.02540183, -2.02782, 0, 0, 0, 1, 1,
-0.9793344, -0.4259399, -1.454039, 0, 0, 0, 1, 1,
-0.9781684, -0.2440199, -3.028103, 0, 0, 0, 1, 1,
-0.9767605, 1.153781, 0.1090217, 1, 1, 1, 1, 1,
-0.9709262, 0.6577165, -1.039638, 1, 1, 1, 1, 1,
-0.968529, -0.7317606, -2.795859, 1, 1, 1, 1, 1,
-0.9670987, -0.7648437, -2.187896, 1, 1, 1, 1, 1,
-0.966794, -0.3755298, -1.268725, 1, 1, 1, 1, 1,
-0.964912, 1.488637, 0.9478723, 1, 1, 1, 1, 1,
-0.9638908, 0.4185271, -1.254449, 1, 1, 1, 1, 1,
-0.9632326, -1.27478, -4.210532, 1, 1, 1, 1, 1,
-0.9516062, -0.04079733, -1.365537, 1, 1, 1, 1, 1,
-0.9496565, -0.05183982, -1.506108, 1, 1, 1, 1, 1,
-0.9490153, 0.2209513, -0.3604368, 1, 1, 1, 1, 1,
-0.9449393, -0.3234029, -2.725257, 1, 1, 1, 1, 1,
-0.9402656, -0.254822, -1.196692, 1, 1, 1, 1, 1,
-0.9281548, 0.5776596, -0.5414578, 1, 1, 1, 1, 1,
-0.9168611, -0.03535981, -1.060145, 1, 1, 1, 1, 1,
-0.9167547, -0.5431898, -2.736878, 0, 0, 1, 1, 1,
-0.9159853, -1.27304, -3.195314, 1, 0, 0, 1, 1,
-0.9136032, 1.005768, -2.699874, 1, 0, 0, 1, 1,
-0.9076499, -0.891236, -2.045782, 1, 0, 0, 1, 1,
-0.899452, -0.8122872, -2.620184, 1, 0, 0, 1, 1,
-0.8987023, -1.76351, -2.526903, 1, 0, 0, 1, 1,
-0.8981625, 1.715253, -0.5777944, 0, 0, 0, 1, 1,
-0.8958086, -0.4487563, 0.7632135, 0, 0, 0, 1, 1,
-0.8886089, -0.02663031, -2.058886, 0, 0, 0, 1, 1,
-0.8875274, 0.8597901, -1.007666, 0, 0, 0, 1, 1,
-0.8867387, -0.0853136, 0.0917955, 0, 0, 0, 1, 1,
-0.8839639, -0.4433078, -2.477767, 0, 0, 0, 1, 1,
-0.8785892, -0.3523057, -3.376614, 0, 0, 0, 1, 1,
-0.8746429, 0.2250951, -1.287995, 1, 1, 1, 1, 1,
-0.873733, -0.8909759, -3.762923, 1, 1, 1, 1, 1,
-0.8721898, 0.1900385, -2.023938, 1, 1, 1, 1, 1,
-0.8658451, -0.01326289, -0.8074129, 1, 1, 1, 1, 1,
-0.8650217, 0.3428728, -1.15967, 1, 1, 1, 1, 1,
-0.8569055, -1.84376, -1.873842, 1, 1, 1, 1, 1,
-0.8554649, 0.1144895, -1.570094, 1, 1, 1, 1, 1,
-0.8535165, 0.4541479, -1.859808, 1, 1, 1, 1, 1,
-0.8529516, -1.74414, -2.095201, 1, 1, 1, 1, 1,
-0.8475709, 0.1345787, -0.1636126, 1, 1, 1, 1, 1,
-0.8469905, 0.3270845, -1.092314, 1, 1, 1, 1, 1,
-0.8374346, -1.469633, -3.701352, 1, 1, 1, 1, 1,
-0.8306077, -0.7388514, -2.721622, 1, 1, 1, 1, 1,
-0.8288035, -1.455277, -2.720459, 1, 1, 1, 1, 1,
-0.828565, -1.766044, -0.4435232, 1, 1, 1, 1, 1,
-0.825009, 0.3314415, -0.9010549, 0, 0, 1, 1, 1,
-0.8248664, -0.5703211, -2.372977, 1, 0, 0, 1, 1,
-0.8218608, -0.5155109, -1.531421, 1, 0, 0, 1, 1,
-0.8208951, -1.088766, -4.757418, 1, 0, 0, 1, 1,
-0.8201942, -1.582426, -1.076452, 1, 0, 0, 1, 1,
-0.8185815, -0.6795307, -0.5731799, 1, 0, 0, 1, 1,
-0.8178906, -1.096882, -1.146504, 0, 0, 0, 1, 1,
-0.8117896, 0.3202395, -1.572859, 0, 0, 0, 1, 1,
-0.8117558, 1.698142, -2.692631, 0, 0, 0, 1, 1,
-0.8087615, 1.028248, -0.5178927, 0, 0, 0, 1, 1,
-0.8082279, -0.5025328, -2.296517, 0, 0, 0, 1, 1,
-0.80782, 1.106586, -0.6968559, 0, 0, 0, 1, 1,
-0.8067068, -2.517998, -4.227657, 0, 0, 0, 1, 1,
-0.8058838, 0.5586045, -1.016687, 1, 1, 1, 1, 1,
-0.8031961, 0.2325008, -2.709533, 1, 1, 1, 1, 1,
-0.7965118, -0.4832676, -0.4616663, 1, 1, 1, 1, 1,
-0.7949796, 0.9918349, -2.105835, 1, 1, 1, 1, 1,
-0.7900585, -0.1863772, -0.1648522, 1, 1, 1, 1, 1,
-0.786908, -1.645361, -4.324837, 1, 1, 1, 1, 1,
-0.7837675, -0.8510449, -1.192192, 1, 1, 1, 1, 1,
-0.7831937, 0.1401444, -1.558459, 1, 1, 1, 1, 1,
-0.7813962, 1.61043, -2.149654, 1, 1, 1, 1, 1,
-0.7779838, -0.5916113, -4.058522, 1, 1, 1, 1, 1,
-0.7777079, -0.03848093, -1.227989, 1, 1, 1, 1, 1,
-0.7689254, -0.1921555, -1.927692, 1, 1, 1, 1, 1,
-0.7614928, -0.06863023, -2.673773, 1, 1, 1, 1, 1,
-0.7493178, 0.9145505, -1.501573, 1, 1, 1, 1, 1,
-0.7473615, -0.8163771, -3.602177, 1, 1, 1, 1, 1,
-0.7411302, -1.087584, -3.11541, 0, 0, 1, 1, 1,
-0.7403458, -1.030925, -1.908686, 1, 0, 0, 1, 1,
-0.7374534, 1.588224, 0.05652299, 1, 0, 0, 1, 1,
-0.7292532, -1.551318, -2.902446, 1, 0, 0, 1, 1,
-0.7279662, -0.563144, -1.387975, 1, 0, 0, 1, 1,
-0.7267143, 1.657776, -1.013225, 1, 0, 0, 1, 1,
-0.7218863, -0.9548479, -2.758046, 0, 0, 0, 1, 1,
-0.72094, -0.04257847, -0.9998072, 0, 0, 0, 1, 1,
-0.7093574, -0.5557482, -3.787229, 0, 0, 0, 1, 1,
-0.7068897, 0.01561656, -1.892321, 0, 0, 0, 1, 1,
-0.705064, -0.3888137, -0.6329057, 0, 0, 0, 1, 1,
-0.7048607, 1.433919, -0.09462319, 0, 0, 0, 1, 1,
-0.7005593, -1.409433, -3.070006, 0, 0, 0, 1, 1,
-0.6965204, 0.1874409, -0.967682, 1, 1, 1, 1, 1,
-0.6917781, -2.245262, -4.320078, 1, 1, 1, 1, 1,
-0.6854556, -2.522735, -2.633899, 1, 1, 1, 1, 1,
-0.6630186, 0.4803764, -0.6043395, 1, 1, 1, 1, 1,
-0.6626744, 0.2981755, -3.545664, 1, 1, 1, 1, 1,
-0.6610469, 0.4646158, 0.1839457, 1, 1, 1, 1, 1,
-0.6582279, -0.0008121079, -1.696101, 1, 1, 1, 1, 1,
-0.6513349, 0.2297383, -3.032268, 1, 1, 1, 1, 1,
-0.6510314, -0.5597273, -0.7849987, 1, 1, 1, 1, 1,
-0.644062, 0.2665336, 0.5786858, 1, 1, 1, 1, 1,
-0.6424084, 0.7557934, 0.4433582, 1, 1, 1, 1, 1,
-0.6399902, 0.07919259, -1.745476, 1, 1, 1, 1, 1,
-0.6387751, 0.04824118, -1.408508, 1, 1, 1, 1, 1,
-0.6358365, -0.2337363, -2.717776, 1, 1, 1, 1, 1,
-0.6334329, 0.8764034, -1.657559, 1, 1, 1, 1, 1,
-0.6319982, 0.4568188, -1.471003, 0, 0, 1, 1, 1,
-0.6312832, -0.03841769, -1.717996, 1, 0, 0, 1, 1,
-0.6288859, 0.6607395, -0.09527586, 1, 0, 0, 1, 1,
-0.6274879, 2.135984, -1.436226, 1, 0, 0, 1, 1,
-0.6253949, -0.5457158, -2.979603, 1, 0, 0, 1, 1,
-0.6241634, -1.019505, -2.3548, 1, 0, 0, 1, 1,
-0.6152776, -1.142341, -2.528214, 0, 0, 0, 1, 1,
-0.6144621, 0.4768358, -2.708238, 0, 0, 0, 1, 1,
-0.6141753, 0.2313419, -1.081864, 0, 0, 0, 1, 1,
-0.6121503, 1.338955, -1.37067, 0, 0, 0, 1, 1,
-0.6087416, -0.6147796, -1.314074, 0, 0, 0, 1, 1,
-0.6086336, 0.7575613, -2.580956, 0, 0, 0, 1, 1,
-0.6070944, -0.7563045, -1.592961, 0, 0, 0, 1, 1,
-0.606017, -0.4964716, -2.0546, 1, 1, 1, 1, 1,
-0.6058377, 0.09062022, -0.4711418, 1, 1, 1, 1, 1,
-0.591965, -0.7167143, -1.947269, 1, 1, 1, 1, 1,
-0.5907958, -0.794629, -1.246766, 1, 1, 1, 1, 1,
-0.5900567, 0.7975164, -1.075955, 1, 1, 1, 1, 1,
-0.5867088, 0.2291645, -3.876493, 1, 1, 1, 1, 1,
-0.5859324, 0.440075, -2.429985, 1, 1, 1, 1, 1,
-0.5847877, -0.7219241, -2.152833, 1, 1, 1, 1, 1,
-0.5823051, -1.295031, -3.425715, 1, 1, 1, 1, 1,
-0.5812706, -0.8579379, -2.129831, 1, 1, 1, 1, 1,
-0.5807599, 0.2153612, -1.714802, 1, 1, 1, 1, 1,
-0.5766098, -2.155121, -1.949937, 1, 1, 1, 1, 1,
-0.5667801, 1.119624, -0.5731006, 1, 1, 1, 1, 1,
-0.5662549, 0.9036726, -0.5530307, 1, 1, 1, 1, 1,
-0.5643559, 0.7692463, 0.4144368, 1, 1, 1, 1, 1,
-0.5591416, -0.9429845, -2.06292, 0, 0, 1, 1, 1,
-0.5550734, 0.6930558, -1.243935, 1, 0, 0, 1, 1,
-0.5538756, 0.9314756, 0.943594, 1, 0, 0, 1, 1,
-0.5513565, 0.6535126, -0.6416961, 1, 0, 0, 1, 1,
-0.5489979, 1.112312, -0.01213065, 1, 0, 0, 1, 1,
-0.5478814, -0.6631292, -2.552782, 1, 0, 0, 1, 1,
-0.5447192, 0.1832254, -1.243849, 0, 0, 0, 1, 1,
-0.5438195, 0.3653171, -0.8640065, 0, 0, 0, 1, 1,
-0.5412667, -0.8283535, -3.32117, 0, 0, 0, 1, 1,
-0.5365883, 2.175104, -2.041695, 0, 0, 0, 1, 1,
-0.5339574, 3.564998, 0.3508249, 0, 0, 0, 1, 1,
-0.5310463, -0.3980829, -4.486095, 0, 0, 0, 1, 1,
-0.5305555, 0.6739171, 0.17661, 0, 0, 0, 1, 1,
-0.5286366, 2.318834, -0.40466, 1, 1, 1, 1, 1,
-0.5277269, -0.5395172, -2.257118, 1, 1, 1, 1, 1,
-0.5239958, 0.5554924, -1.822472, 1, 1, 1, 1, 1,
-0.52354, 0.8653411, 0.2664604, 1, 1, 1, 1, 1,
-0.5197417, 1.059719, -1.59237, 1, 1, 1, 1, 1,
-0.5168931, -0.5822512, -2.291111, 1, 1, 1, 1, 1,
-0.5006405, -1.345087, -2.729601, 1, 1, 1, 1, 1,
-0.4961617, -0.5158834, -2.657876, 1, 1, 1, 1, 1,
-0.4922128, -0.008684585, -2.259768, 1, 1, 1, 1, 1,
-0.4920012, -0.901853, -0.1161205, 1, 1, 1, 1, 1,
-0.4914943, -1.003595, -1.044528, 1, 1, 1, 1, 1,
-0.4845504, 0.4797778, -2.577123, 1, 1, 1, 1, 1,
-0.4809868, -0.5904633, -2.669419, 1, 1, 1, 1, 1,
-0.4565037, -2.377226, -1.949225, 1, 1, 1, 1, 1,
-0.4548921, 0.126668, -1.081095, 1, 1, 1, 1, 1,
-0.4439427, -1.21322, -4.140228, 0, 0, 1, 1, 1,
-0.4414012, -0.1259798, -0.8456944, 1, 0, 0, 1, 1,
-0.4395923, 0.1707, -0.4875388, 1, 0, 0, 1, 1,
-0.4339238, -1.39064, -3.524216, 1, 0, 0, 1, 1,
-0.4305086, 0.4761113, 2.33379, 1, 0, 0, 1, 1,
-0.4278926, 1.361709, -0.5272505, 1, 0, 0, 1, 1,
-0.4256846, 0.7380079, 1.488074, 0, 0, 0, 1, 1,
-0.4241698, -1.567827, -2.590018, 0, 0, 0, 1, 1,
-0.424082, 1.426182, -0.4496643, 0, 0, 0, 1, 1,
-0.4234806, 0.670386, 1.864127, 0, 0, 0, 1, 1,
-0.4232123, 0.3027438, -0.4968888, 0, 0, 0, 1, 1,
-0.4227239, -1.234006, -2.53601, 0, 0, 0, 1, 1,
-0.419569, -0.8800876, -4.116282, 0, 0, 0, 1, 1,
-0.405349, 1.67005, -2.350137, 1, 1, 1, 1, 1,
-0.4022065, 0.5511746, -1.439425, 1, 1, 1, 1, 1,
-0.4002924, -1.128266, -4.163055, 1, 1, 1, 1, 1,
-0.3998097, -1.071115, -2.458024, 1, 1, 1, 1, 1,
-0.3992913, -0.1808292, -2.735705, 1, 1, 1, 1, 1,
-0.398237, 0.444112, -1.424333, 1, 1, 1, 1, 1,
-0.3952829, 0.8696128, 1.250969, 1, 1, 1, 1, 1,
-0.3896891, -0.6482635, -3.129055, 1, 1, 1, 1, 1,
-0.3884436, 1.056884, 0.3767579, 1, 1, 1, 1, 1,
-0.3863526, 0.6041279, 0.1036856, 1, 1, 1, 1, 1,
-0.3856604, 0.7518675, -2.744651, 1, 1, 1, 1, 1,
-0.3843532, 1.205636, -1.095979, 1, 1, 1, 1, 1,
-0.3829047, -0.05925559, -2.359937, 1, 1, 1, 1, 1,
-0.3822424, -0.3920966, -1.799981, 1, 1, 1, 1, 1,
-0.3748093, -1.274078, -2.100759, 1, 1, 1, 1, 1,
-0.3742334, 0.04784193, -2.056785, 0, 0, 1, 1, 1,
-0.3707368, 0.2554552, -0.7858828, 1, 0, 0, 1, 1,
-0.3696042, -0.5754998, -3.466663, 1, 0, 0, 1, 1,
-0.3670677, 0.3589877, -1.418839, 1, 0, 0, 1, 1,
-0.3651068, 0.08896303, -0.3530936, 1, 0, 0, 1, 1,
-0.3572943, 0.04455911, -1.370877, 1, 0, 0, 1, 1,
-0.3482712, 0.3405927, -1.35438, 0, 0, 0, 1, 1,
-0.3452352, 1.228661, -0.3643322, 0, 0, 0, 1, 1,
-0.3451847, 0.07927921, -1.051604, 0, 0, 0, 1, 1,
-0.3427821, -0.3839586, -2.254502, 0, 0, 0, 1, 1,
-0.3424779, 0.1415433, -0.3673266, 0, 0, 0, 1, 1,
-0.3396299, 1.063935, -0.02622675, 0, 0, 0, 1, 1,
-0.3395266, 0.06968659, -0.9799488, 0, 0, 0, 1, 1,
-0.3392513, -1.99261, -4.319865, 1, 1, 1, 1, 1,
-0.3377496, 0.00493688, -0.451501, 1, 1, 1, 1, 1,
-0.3365248, -1.216898, -5.29915, 1, 1, 1, 1, 1,
-0.3324896, 0.9299495, 0.4868556, 1, 1, 1, 1, 1,
-0.3214202, 0.6005418, -0.991209, 1, 1, 1, 1, 1,
-0.3205453, 0.2024063, -0.3877298, 1, 1, 1, 1, 1,
-0.319334, 1.581528, -0.003172934, 1, 1, 1, 1, 1,
-0.3181254, 0.9039949, -0.4405632, 1, 1, 1, 1, 1,
-0.3145276, -0.2347165, -2.27814, 1, 1, 1, 1, 1,
-0.3036476, -0.4683588, -0.8725248, 1, 1, 1, 1, 1,
-0.3028852, -0.1450403, -2.574876, 1, 1, 1, 1, 1,
-0.3028749, -1.912366, -3.147763, 1, 1, 1, 1, 1,
-0.3011709, 0.5871727, -1.71199, 1, 1, 1, 1, 1,
-0.2948542, 1.027193, -0.9598427, 1, 1, 1, 1, 1,
-0.294719, 0.6743766, -1.274782, 1, 1, 1, 1, 1,
-0.2931181, -0.3515182, -3.397774, 0, 0, 1, 1, 1,
-0.2893497, 1.496629, 0.6826198, 1, 0, 0, 1, 1,
-0.2883916, 0.9661597, -0.2172013, 1, 0, 0, 1, 1,
-0.2839304, -1.187519, -4.081713, 1, 0, 0, 1, 1,
-0.2778469, 0.3021618, -1.940224, 1, 0, 0, 1, 1,
-0.2754726, 0.1367508, -1.108249, 1, 0, 0, 1, 1,
-0.2748683, 1.317002, 0.4573248, 0, 0, 0, 1, 1,
-0.2738794, 0.6068105, -0.3813281, 0, 0, 0, 1, 1,
-0.267491, -0.2204905, -2.613292, 0, 0, 0, 1, 1,
-0.2674159, -0.4001323, -1.840017, 0, 0, 0, 1, 1,
-0.2636738, -1.63525, -3.005317, 0, 0, 0, 1, 1,
-0.2630914, -0.400029, -2.440068, 0, 0, 0, 1, 1,
-0.2619778, -1.411634, -1.459325, 0, 0, 0, 1, 1,
-0.2609186, -1.307399, -2.870653, 1, 1, 1, 1, 1,
-0.2547503, -0.1230327, -0.973389, 1, 1, 1, 1, 1,
-0.2499866, -0.07090797, -2.445323, 1, 1, 1, 1, 1,
-0.2477152, -0.555742, -0.952901, 1, 1, 1, 1, 1,
-0.2474329, 1.757499, -0.2396346, 1, 1, 1, 1, 1,
-0.2463275, 1.02329, 0.5520648, 1, 1, 1, 1, 1,
-0.2424802, -0.747314, -3.43693, 1, 1, 1, 1, 1,
-0.2417818, -0.3037138, -0.4923478, 1, 1, 1, 1, 1,
-0.2366008, 1.487238, -0.05988628, 1, 1, 1, 1, 1,
-0.2350347, 0.1202991, -0.720245, 1, 1, 1, 1, 1,
-0.2337568, 0.03356392, -1.068321, 1, 1, 1, 1, 1,
-0.2316045, 0.5588122, -1.373705, 1, 1, 1, 1, 1,
-0.2306586, -0.7398651, -2.240411, 1, 1, 1, 1, 1,
-0.230387, -2.165444, -2.204328, 1, 1, 1, 1, 1,
-0.2292759, 2.109937, 0.3953627, 1, 1, 1, 1, 1,
-0.228974, -0.3740123, -3.609334, 0, 0, 1, 1, 1,
-0.2245089, -2.084234, -2.490201, 1, 0, 0, 1, 1,
-0.2243994, 1.006972, -0.5373712, 1, 0, 0, 1, 1,
-0.2235012, 0.1345005, -2.041707, 1, 0, 0, 1, 1,
-0.2222754, -1.358528, -1.730922, 1, 0, 0, 1, 1,
-0.2213253, -0.2290854, -0.710322, 1, 0, 0, 1, 1,
-0.2207528, -0.1518023, -3.457219, 0, 0, 0, 1, 1,
-0.2194527, 0.3663448, -0.3791214, 0, 0, 0, 1, 1,
-0.2171289, 0.8330179, 0.08117341, 0, 0, 0, 1, 1,
-0.2159032, -0.410362, -2.57677, 0, 0, 0, 1, 1,
-0.2129271, -0.830615, -1.635262, 0, 0, 0, 1, 1,
-0.2118251, 0.2856255, -2.971274, 0, 0, 0, 1, 1,
-0.207825, 0.5721384, -0.4692829, 0, 0, 0, 1, 1,
-0.2034351, 0.8684956, -0.3759747, 1, 1, 1, 1, 1,
-0.203094, -1.780848, -3.204632, 1, 1, 1, 1, 1,
-0.1984281, 0.4821774, -0.3437583, 1, 1, 1, 1, 1,
-0.1889742, 1.562871, 1.391323, 1, 1, 1, 1, 1,
-0.1880192, -0.3545899, -2.201044, 1, 1, 1, 1, 1,
-0.1879068, -0.4452689, -4.127936, 1, 1, 1, 1, 1,
-0.1834385, 2.501999, -1.529285, 1, 1, 1, 1, 1,
-0.1821693, -0.3478139, -1.4122, 1, 1, 1, 1, 1,
-0.1816303, -0.06027926, -1.046669, 1, 1, 1, 1, 1,
-0.1812091, 1.098806, -0.7800004, 1, 1, 1, 1, 1,
-0.1792501, -1.100542, -3.256822, 1, 1, 1, 1, 1,
-0.1725523, 0.4466386, -0.8275734, 1, 1, 1, 1, 1,
-0.1672056, 0.4065113, 0.1097315, 1, 1, 1, 1, 1,
-0.1663821, 0.2682201, 0.3310654, 1, 1, 1, 1, 1,
-0.1650326, 0.7534614, -0.7499001, 1, 1, 1, 1, 1,
-0.1582238, 2.306415, -0.07393512, 0, 0, 1, 1, 1,
-0.1579483, 0.3892678, -1.926278, 1, 0, 0, 1, 1,
-0.157367, 1.332373, -0.9310634, 1, 0, 0, 1, 1,
-0.1560849, 0.6324506, 1.003537, 1, 0, 0, 1, 1,
-0.1529376, -2.076399, -2.096902, 1, 0, 0, 1, 1,
-0.1526452, 0.8733577, -0.1051608, 1, 0, 0, 1, 1,
-0.1524159, 0.8354205, -1.083541, 0, 0, 0, 1, 1,
-0.1450376, -1.722314, -2.611125, 0, 0, 0, 1, 1,
-0.1418504, -0.6125335, -4.247445, 0, 0, 0, 1, 1,
-0.1418399, 0.5182739, 0.4025449, 0, 0, 0, 1, 1,
-0.1410592, -1.050679, -2.012239, 0, 0, 0, 1, 1,
-0.1409587, -0.7224872, -3.527898, 0, 0, 0, 1, 1,
-0.1383625, 0.8993554, -1.39952, 0, 0, 0, 1, 1,
-0.1378647, 0.1630266, -1.597287, 1, 1, 1, 1, 1,
-0.1360602, -0.5674403, -2.571905, 1, 1, 1, 1, 1,
-0.1328258, -2.298156, -2.924117, 1, 1, 1, 1, 1,
-0.1323936, 0.4169146, 1.714747, 1, 1, 1, 1, 1,
-0.1309814, -1.269282, -4.111705, 1, 1, 1, 1, 1,
-0.1241969, 0.4351599, -0.1637326, 1, 1, 1, 1, 1,
-0.123908, -2.382217, -3.272226, 1, 1, 1, 1, 1,
-0.1237944, 1.10866, 0.9652469, 1, 1, 1, 1, 1,
-0.1227529, 0.3200929, 0.814535, 1, 1, 1, 1, 1,
-0.1192467, 1.935233, 0.6080242, 1, 1, 1, 1, 1,
-0.1186407, 0.6652467, -0.4487825, 1, 1, 1, 1, 1,
-0.116567, 0.409247, -0.6425666, 1, 1, 1, 1, 1,
-0.1158192, 0.5132384, 0.7623502, 1, 1, 1, 1, 1,
-0.1155983, -1.733321, -1.50071, 1, 1, 1, 1, 1,
-0.1126226, 0.541695, -0.2283965, 1, 1, 1, 1, 1,
-0.1071698, 0.09597491, -2.53676, 0, 0, 1, 1, 1,
-0.09538808, -0.6342975, -4.729774, 1, 0, 0, 1, 1,
-0.09233887, 0.815299, 1.275278, 1, 0, 0, 1, 1,
-0.09153772, 1.427868, 1.068682, 1, 0, 0, 1, 1,
-0.09137692, 1.485111, -1.290003, 1, 0, 0, 1, 1,
-0.09002944, -0.03558796, -1.813326, 1, 0, 0, 1, 1,
-0.08852133, 0.5633755, -0.07315285, 0, 0, 0, 1, 1,
-0.08688402, -2.319062, -2.755895, 0, 0, 0, 1, 1,
-0.08561904, -0.5348273, -3.54568, 0, 0, 0, 1, 1,
-0.08461403, 0.1053688, -2.268923, 0, 0, 0, 1, 1,
-0.08166946, 0.5959561, -1.051538, 0, 0, 0, 1, 1,
-0.0805832, -1.28099, -1.332343, 0, 0, 0, 1, 1,
-0.07825858, -0.8002236, -2.761932, 0, 0, 0, 1, 1,
-0.07811508, -1.227918, -2.863036, 1, 1, 1, 1, 1,
-0.07521392, -0.2217029, -4.927749, 1, 1, 1, 1, 1,
-0.07477185, 0.1481018, -0.008727407, 1, 1, 1, 1, 1,
-0.06238682, -0.8231258, -2.292668, 1, 1, 1, 1, 1,
-0.05524071, -0.2764791, -2.476704, 1, 1, 1, 1, 1,
-0.05504722, 0.3831083, 0.1010455, 1, 1, 1, 1, 1,
-0.05273382, -0.3222757, -2.861032, 1, 1, 1, 1, 1,
-0.05142315, -1.188574, -2.629488, 1, 1, 1, 1, 1,
-0.04999442, -1.478242, -1.664544, 1, 1, 1, 1, 1,
-0.04741644, -0.1265302, -0.01580107, 1, 1, 1, 1, 1,
-0.04312397, 2.679609, 0.7487128, 1, 1, 1, 1, 1,
-0.04271851, 0.2732739, -1.604765, 1, 1, 1, 1, 1,
-0.03809271, 0.5483845, 0.003705316, 1, 1, 1, 1, 1,
-0.02716998, 0.1384386, 0.4121481, 1, 1, 1, 1, 1,
-0.02628371, 2.151648, 0.5599989, 1, 1, 1, 1, 1,
-0.01795775, 0.05758009, 0.03375797, 0, 0, 1, 1, 1,
-0.01793814, 0.6249261, -0.585447, 1, 0, 0, 1, 1,
-0.01641302, -0.2951027, -3.448844, 1, 0, 0, 1, 1,
-0.01392732, -0.8447521, -4.207768, 1, 0, 0, 1, 1,
-0.01360113, 0.2883434, 0.2796804, 1, 0, 0, 1, 1,
-0.01160405, -0.4475209, -2.233915, 1, 0, 0, 1, 1,
-0.01146718, 0.4757162, -0.5699653, 0, 0, 0, 1, 1,
-0.01108901, 1.640801, 0.422993, 0, 0, 0, 1, 1,
-0.009552673, 0.21914, 0.01474044, 0, 0, 0, 1, 1,
-0.002246669, 0.7473307, -1.185805, 0, 0, 0, 1, 1,
-6.668224e-05, 0.7261524, 1.430227, 0, 0, 0, 1, 1,
0.003080304, -1.551567, 0.2254437, 0, 0, 0, 1, 1,
0.009103604, -0.7153398, 3.366939, 0, 0, 0, 1, 1,
0.01746926, -0.1751846, 3.018841, 1, 1, 1, 1, 1,
0.01755878, 2.124976, 1.530189, 1, 1, 1, 1, 1,
0.0190569, -0.9464968, 2.808469, 1, 1, 1, 1, 1,
0.02102182, -0.1527963, 1.411592, 1, 1, 1, 1, 1,
0.02310757, 0.7457097, -0.8056316, 1, 1, 1, 1, 1,
0.02379475, 1.302737, 0.3703905, 1, 1, 1, 1, 1,
0.02389671, 1.163013, 1.982779, 1, 1, 1, 1, 1,
0.02993143, 1.245053, -0.05377346, 1, 1, 1, 1, 1,
0.03034983, -0.6362252, 3.758844, 1, 1, 1, 1, 1,
0.03056502, -0.7322958, 0.7848107, 1, 1, 1, 1, 1,
0.03760833, 0.1638639, -1.287931, 1, 1, 1, 1, 1,
0.03868522, -0.566505, 3.659889, 1, 1, 1, 1, 1,
0.03908823, -0.6914272, 3.743731, 1, 1, 1, 1, 1,
0.03959033, 0.02253965, -0.1113504, 1, 1, 1, 1, 1,
0.04076521, -0.7503456, 1.906199, 1, 1, 1, 1, 1,
0.04112377, -1.907458, 4.598971, 0, 0, 1, 1, 1,
0.0447524, 0.2160991, -0.9262303, 1, 0, 0, 1, 1,
0.04588911, -0.08711945, 0.9470496, 1, 0, 0, 1, 1,
0.04998739, 1.109985, -0.2096143, 1, 0, 0, 1, 1,
0.05007397, 0.1103852, -1.035096, 1, 0, 0, 1, 1,
0.05394597, -1.380407, 4.065133, 1, 0, 0, 1, 1,
0.05431527, 0.5915647, -0.3683071, 0, 0, 0, 1, 1,
0.05532502, -2.500864, 2.681199, 0, 0, 0, 1, 1,
0.06008345, -1.085034, 2.430414, 0, 0, 0, 1, 1,
0.0639005, -0.08665789, 3.480632, 0, 0, 0, 1, 1,
0.0672341, 0.4495504, 0.1026238, 0, 0, 0, 1, 1,
0.07027812, -0.5359849, 1.640141, 0, 0, 0, 1, 1,
0.07309076, 0.06105277, -2.123347, 0, 0, 0, 1, 1,
0.07686844, 0.9708964, 1.758304, 1, 1, 1, 1, 1,
0.08557654, 1.943256, 1.738861, 1, 1, 1, 1, 1,
0.08586987, -0.01802045, 2.544268, 1, 1, 1, 1, 1,
0.09180197, -0.1557387, 1.172666, 1, 1, 1, 1, 1,
0.0936989, -0.8131737, 2.84441, 1, 1, 1, 1, 1,
0.09441377, 2.101366, 1.356316, 1, 1, 1, 1, 1,
0.1008179, -0.3159464, 1.806468, 1, 1, 1, 1, 1,
0.1099729, 1.331355, -0.1049778, 1, 1, 1, 1, 1,
0.1149128, 0.689152, 1.266141, 1, 1, 1, 1, 1,
0.1173025, -1.411052, 2.111819, 1, 1, 1, 1, 1,
0.1231588, 0.7906989, -1.243375, 1, 1, 1, 1, 1,
0.1241892, -0.7006866, 3.812526, 1, 1, 1, 1, 1,
0.1243892, 0.4505177, -0.5286361, 1, 1, 1, 1, 1,
0.1288175, 0.8560793, 1.373754, 1, 1, 1, 1, 1,
0.1295414, -0.3032348, 2.13466, 1, 1, 1, 1, 1,
0.1295957, 0.6586291, -0.3980223, 0, 0, 1, 1, 1,
0.1301022, -1.948109, 2.763286, 1, 0, 0, 1, 1,
0.1309707, -1.15349, 2.23756, 1, 0, 0, 1, 1,
0.1342659, 0.6056962, 0.5269957, 1, 0, 0, 1, 1,
0.1344705, -0.02003191, 1.846009, 1, 0, 0, 1, 1,
0.1383158, -0.4127646, 2.913693, 1, 0, 0, 1, 1,
0.1438999, -0.05293711, 1.37797, 0, 0, 0, 1, 1,
0.1473999, 0.8393359, 0.6723058, 0, 0, 0, 1, 1,
0.1491871, 0.6136557, -0.1789923, 0, 0, 0, 1, 1,
0.1492185, -1.400399, 3.199781, 0, 0, 0, 1, 1,
0.1533435, -0.000866024, 1.626833, 0, 0, 0, 1, 1,
0.1544094, -0.2318649, 0.8418711, 0, 0, 0, 1, 1,
0.1546149, -0.4616266, 1.314642, 0, 0, 0, 1, 1,
0.1591302, 1.319356, 0.8770294, 1, 1, 1, 1, 1,
0.1592579, 0.05529014, 2.316448, 1, 1, 1, 1, 1,
0.1593194, 0.4845654, 1.665924, 1, 1, 1, 1, 1,
0.1752779, -0.6294724, 2.499927, 1, 1, 1, 1, 1,
0.1764697, 0.006569252, 1.536533, 1, 1, 1, 1, 1,
0.1846644, 0.4974763, 1.060319, 1, 1, 1, 1, 1,
0.1856148, 0.9602253, -0.8163926, 1, 1, 1, 1, 1,
0.1880218, -1.113975, 3.276912, 1, 1, 1, 1, 1,
0.1927242, -0.5107689, -0.1131993, 1, 1, 1, 1, 1,
0.1928723, -0.9021633, 4.069867, 1, 1, 1, 1, 1,
0.195443, -0.4584929, 4.092015, 1, 1, 1, 1, 1,
0.1993755, -1.216467, 3.712411, 1, 1, 1, 1, 1,
0.199922, -0.2336717, 1.576314, 1, 1, 1, 1, 1,
0.200051, 0.5655375, 0.5375315, 1, 1, 1, 1, 1,
0.2054757, 0.01645798, 2.15267, 1, 1, 1, 1, 1,
0.2065751, 1.826842, 1.01441, 0, 0, 1, 1, 1,
0.2077994, 0.9928423, 0.5184765, 1, 0, 0, 1, 1,
0.2086336, -0.009943315, 1.014023, 1, 0, 0, 1, 1,
0.2095432, -0.5490802, 2.140797, 1, 0, 0, 1, 1,
0.2143892, 1.576002, -2.249492, 1, 0, 0, 1, 1,
0.2148395, -0.4576148, 3.743138, 1, 0, 0, 1, 1,
0.2194891, 0.3910486, 1.013494, 0, 0, 0, 1, 1,
0.222848, 0.8399034, 0.8378955, 0, 0, 0, 1, 1,
0.2228847, 0.8967607, -0.1857752, 0, 0, 0, 1, 1,
0.2240784, -0.1621946, 1.51733, 0, 0, 0, 1, 1,
0.2245489, 1.008614, -0.6340487, 0, 0, 0, 1, 1,
0.2265459, 0.2895505, -0.7637762, 0, 0, 0, 1, 1,
0.2282387, -0.2038468, 1.826163, 0, 0, 0, 1, 1,
0.2303516, 0.3436838, -0.220306, 1, 1, 1, 1, 1,
0.2304931, 1.745986, -1.483708, 1, 1, 1, 1, 1,
0.230665, -1.295681, 3.631447, 1, 1, 1, 1, 1,
0.2331419, 0.7124965, -0.9580892, 1, 1, 1, 1, 1,
0.2347361, 1.263347, 1.417199, 1, 1, 1, 1, 1,
0.236198, 0.2935576, -0.7417346, 1, 1, 1, 1, 1,
0.2376, 1.087815, 0.7578634, 1, 1, 1, 1, 1,
0.2402135, -1.203746, 3.228027, 1, 1, 1, 1, 1,
0.2432318, 2.787171, -1.835923, 1, 1, 1, 1, 1,
0.2457507, -0.4113529, 3.993718, 1, 1, 1, 1, 1,
0.2467231, 0.08172605, 0.4654293, 1, 1, 1, 1, 1,
0.2492796, -0.5140198, 2.227016, 1, 1, 1, 1, 1,
0.2515779, -0.9374675, 2.733078, 1, 1, 1, 1, 1,
0.2559838, 0.3052995, 1.084309, 1, 1, 1, 1, 1,
0.2563742, 1.007769, 2.154092, 1, 1, 1, 1, 1,
0.2581088, 0.7061329, 0.8384239, 0, 0, 1, 1, 1,
0.2716306, 0.7299777, -0.5314396, 1, 0, 0, 1, 1,
0.2766265, -1.409698, 3.033506, 1, 0, 0, 1, 1,
0.2766733, 0.153387, 0.5481157, 1, 0, 0, 1, 1,
0.2780037, 1.857811, 0.3922084, 1, 0, 0, 1, 1,
0.2795289, 0.0781384, 0.8172961, 1, 0, 0, 1, 1,
0.2818408, 0.1602206, 2.299237, 0, 0, 0, 1, 1,
0.2835535, -0.03018976, 2.463318, 0, 0, 0, 1, 1,
0.2855234, 0.1674903, 1.345405, 0, 0, 0, 1, 1,
0.2870228, 0.1952812, -0.192503, 0, 0, 0, 1, 1,
0.2905327, -0.5298091, 1.747356, 0, 0, 0, 1, 1,
0.2906318, 2.582547, -0.6073679, 0, 0, 0, 1, 1,
0.2919538, 0.433284, 2.099908, 0, 0, 0, 1, 1,
0.2927477, 1.859604, 0.2580759, 1, 1, 1, 1, 1,
0.2969205, 0.9939569, -0.3923528, 1, 1, 1, 1, 1,
0.3084214, 0.9567683, 1.56154, 1, 1, 1, 1, 1,
0.3089145, 0.9772224, 1.106085, 1, 1, 1, 1, 1,
0.309122, -0.3959723, 3.149144, 1, 1, 1, 1, 1,
0.3125597, -1.238295, 3.461383, 1, 1, 1, 1, 1,
0.3150743, -0.3976285, 4.219646, 1, 1, 1, 1, 1,
0.3155934, -0.6391972, 3.855434, 1, 1, 1, 1, 1,
0.3220461, -1.243586, 3.297559, 1, 1, 1, 1, 1,
0.3270131, -0.1025562, 1.325702, 1, 1, 1, 1, 1,
0.3331806, -0.04152883, 0.7504779, 1, 1, 1, 1, 1,
0.3332436, -1.106696, 3.299218, 1, 1, 1, 1, 1,
0.3357747, -0.544656, 3.763357, 1, 1, 1, 1, 1,
0.3364784, 0.0420217, 2.010377, 1, 1, 1, 1, 1,
0.3381017, 1.867615, -0.6221361, 1, 1, 1, 1, 1,
0.3387602, -1.264661, 2.044122, 0, 0, 1, 1, 1,
0.341122, -1.50255, 2.375492, 1, 0, 0, 1, 1,
0.3421581, 2.944721, -0.6756562, 1, 0, 0, 1, 1,
0.342274, 0.8129834, -0.1628284, 1, 0, 0, 1, 1,
0.3426416, 0.9203034, 0.6039653, 1, 0, 0, 1, 1,
0.3438283, -0.546019, 2.589813, 1, 0, 0, 1, 1,
0.3493822, 0.4418639, 0.3929976, 0, 0, 0, 1, 1,
0.3501963, -0.7775682, 3.352907, 0, 0, 0, 1, 1,
0.3566948, 1.054164, 0.05523239, 0, 0, 0, 1, 1,
0.3572535, 0.4492379, 0.5257786, 0, 0, 0, 1, 1,
0.3601452, -1.501254, 3.872854, 0, 0, 0, 1, 1,
0.3644378, -0.01723287, 1.439106, 0, 0, 0, 1, 1,
0.3659808, -1.04177, 2.406816, 0, 0, 0, 1, 1,
0.3665381, -0.1983383, 2.17027, 1, 1, 1, 1, 1,
0.3752126, -0.0202931, 1.214321, 1, 1, 1, 1, 1,
0.3756513, -1.83399, 4.162048, 1, 1, 1, 1, 1,
0.3771957, 1.586726, -0.1603487, 1, 1, 1, 1, 1,
0.3773065, -0.2915984, 1.270555, 1, 1, 1, 1, 1,
0.3824153, 0.2445986, -0.18715, 1, 1, 1, 1, 1,
0.3825252, 0.5826355, -0.8266671, 1, 1, 1, 1, 1,
0.3840184, 0.6183761, 2.411351, 1, 1, 1, 1, 1,
0.3871271, 0.8757213, 1.671695, 1, 1, 1, 1, 1,
0.3890733, -0.8556064, 3.863986, 1, 1, 1, 1, 1,
0.3894776, -1.083293, 4.145816, 1, 1, 1, 1, 1,
0.3895506, 0.5899185, 0.7537568, 1, 1, 1, 1, 1,
0.3898694, -0.3610271, 3.204229, 1, 1, 1, 1, 1,
0.3907543, -0.5105222, 2.040531, 1, 1, 1, 1, 1,
0.3914286, -1.137079, 1.373077, 1, 1, 1, 1, 1,
0.4047422, 1.010718, 0.9101935, 0, 0, 1, 1, 1,
0.4053414, 0.4105132, 0.9175162, 1, 0, 0, 1, 1,
0.4094277, -1.075776, 3.234136, 1, 0, 0, 1, 1,
0.4149542, -0.03295474, -0.6543494, 1, 0, 0, 1, 1,
0.4154553, -0.4002197, 2.254852, 1, 0, 0, 1, 1,
0.4156425, -0.9625647, 3.431589, 1, 0, 0, 1, 1,
0.4188347, -0.6810488, 1.18003, 0, 0, 0, 1, 1,
0.4208014, 0.582824, 1.40855, 0, 0, 0, 1, 1,
0.4213601, -0.4218305, 3.446275, 0, 0, 0, 1, 1,
0.4213727, -1.166249, 3.331496, 0, 0, 0, 1, 1,
0.4218197, 0.4082537, -0.3463436, 0, 0, 0, 1, 1,
0.4230058, 0.6863792, -1.023689, 0, 0, 0, 1, 1,
0.4263932, -0.2277362, 2.912796, 0, 0, 0, 1, 1,
0.4282762, -0.6254675, 3.023946, 1, 1, 1, 1, 1,
0.4300868, 1.116996, -0.08947711, 1, 1, 1, 1, 1,
0.4352665, -1.109604, 2.206079, 1, 1, 1, 1, 1,
0.4380738, -0.4917576, 3.351335, 1, 1, 1, 1, 1,
0.4385951, -0.6240491, 2.01434, 1, 1, 1, 1, 1,
0.4387466, 1.800254, 0.6473529, 1, 1, 1, 1, 1,
0.4388787, 0.2971938, 0.6374766, 1, 1, 1, 1, 1,
0.4410782, 0.8854749, 1.178421, 1, 1, 1, 1, 1,
0.4432317, -1.466044, 2.248469, 1, 1, 1, 1, 1,
0.4440243, -1.65917, 3.745142, 1, 1, 1, 1, 1,
0.4473987, 1.120413, 2.184238, 1, 1, 1, 1, 1,
0.4474728, 0.02905997, 1.102157, 1, 1, 1, 1, 1,
0.448555, 0.2304579, -0.3238075, 1, 1, 1, 1, 1,
0.4488727, -0.9336797, 2.571963, 1, 1, 1, 1, 1,
0.4490708, 0.3508665, 1.857488, 1, 1, 1, 1, 1,
0.4497598, -0.9807855, 4.061602, 0, 0, 1, 1, 1,
0.4570911, 0.2636862, 1.699952, 1, 0, 0, 1, 1,
0.4588586, -0.7325401, 2.174138, 1, 0, 0, 1, 1,
0.4636014, 0.01878905, 1.703334, 1, 0, 0, 1, 1,
0.4643482, 0.2471835, 1.646773, 1, 0, 0, 1, 1,
0.4650874, 2.028749, 0.04363098, 1, 0, 0, 1, 1,
0.4653521, 0.02982036, 0.6755478, 0, 0, 0, 1, 1,
0.4688507, -1.554325, 3.296781, 0, 0, 0, 1, 1,
0.4705652, -0.2494434, 1.78402, 0, 0, 0, 1, 1,
0.4715573, 0.3340359, 1.991953, 0, 0, 0, 1, 1,
0.4720454, -0.9074228, 1.100206, 0, 0, 0, 1, 1,
0.4722893, 0.09940775, 0.9607918, 0, 0, 0, 1, 1,
0.4753568, 0.1625789, 0.9084756, 0, 0, 0, 1, 1,
0.4807977, 0.1800337, 0.6866143, 1, 1, 1, 1, 1,
0.4821632, -0.6451603, 1.823732, 1, 1, 1, 1, 1,
0.482652, 0.3551913, -0.09095864, 1, 1, 1, 1, 1,
0.4897252, 1.088393, 1.3464, 1, 1, 1, 1, 1,
0.4930452, 0.3556539, 1.90861, 1, 1, 1, 1, 1,
0.5039432, -0.3559805, 1.302139, 1, 1, 1, 1, 1,
0.5057932, -0.02233636, 1.584384, 1, 1, 1, 1, 1,
0.5058972, -0.2895118, 0.3463478, 1, 1, 1, 1, 1,
0.5066745, 1.409618, 0.1208884, 1, 1, 1, 1, 1,
0.5082928, 0.1271344, 1.878094, 1, 1, 1, 1, 1,
0.5102073, -1.27409, 1.819804, 1, 1, 1, 1, 1,
0.5142733, 1.525788, 0.1563609, 1, 1, 1, 1, 1,
0.5172686, -0.640951, 1.990367, 1, 1, 1, 1, 1,
0.517276, 0.3306582, 2.582678, 1, 1, 1, 1, 1,
0.5184212, -0.5061749, 2.223583, 1, 1, 1, 1, 1,
0.518979, 0.05299952, 0.6397152, 0, 0, 1, 1, 1,
0.5201486, -1.226719, 3.983228, 1, 0, 0, 1, 1,
0.5230238, 0.01547467, 2.89544, 1, 0, 0, 1, 1,
0.528684, -0.8527132, 2.516767, 1, 0, 0, 1, 1,
0.5386075, 0.3566788, 0.3280362, 1, 0, 0, 1, 1,
0.5400175, -1.027313, 2.772665, 1, 0, 0, 1, 1,
0.5403868, 2.705864, -0.8146692, 0, 0, 0, 1, 1,
0.5443456, -0.1906502, 1.711477, 0, 0, 0, 1, 1,
0.5447874, -0.3615431, 2.734565, 0, 0, 0, 1, 1,
0.5453149, -2.221443, 2.830912, 0, 0, 0, 1, 1,
0.5476562, -0.3341489, 0.9450549, 0, 0, 0, 1, 1,
0.5582301, 0.5098097, 0.4922624, 0, 0, 0, 1, 1,
0.5589992, -0.3923241, 2.301131, 0, 0, 0, 1, 1,
0.5602813, 0.4560103, 0.9499847, 1, 1, 1, 1, 1,
0.5651951, -0.1294988, 1.092454, 1, 1, 1, 1, 1,
0.5714169, 0.4851942, 0.7422293, 1, 1, 1, 1, 1,
0.5748969, -0.4018061, 2.741487, 1, 1, 1, 1, 1,
0.5755953, -0.3708984, 3.131892, 1, 1, 1, 1, 1,
0.5795101, 1.868877, 0.3193262, 1, 1, 1, 1, 1,
0.5809705, 0.4815732, 1.79287, 1, 1, 1, 1, 1,
0.5817058, 0.8662803, 1.372159, 1, 1, 1, 1, 1,
0.586176, 0.8250217, -0.4861633, 1, 1, 1, 1, 1,
0.5875205, 0.7128347, -1.6495, 1, 1, 1, 1, 1,
0.5875502, -0.8605763, 1.660706, 1, 1, 1, 1, 1,
0.5917099, -0.04899501, 3.019635, 1, 1, 1, 1, 1,
0.5928267, 0.01243372, 1.752978, 1, 1, 1, 1, 1,
0.5996259, 0.2708289, 0.6305178, 1, 1, 1, 1, 1,
0.6008706, 0.2294951, 2.725376, 1, 1, 1, 1, 1,
0.6037452, 2.471023, -0.702593, 0, 0, 1, 1, 1,
0.6045707, -0.7569026, 1.460217, 1, 0, 0, 1, 1,
0.6053274, -2.671579, 3.723566, 1, 0, 0, 1, 1,
0.6063877, 1.008723, 0.6669631, 1, 0, 0, 1, 1,
0.6095347, 0.1343198, -0.08493727, 1, 0, 0, 1, 1,
0.6121795, -0.3679316, 2.716125, 1, 0, 0, 1, 1,
0.6143196, 0.4731499, 2.036184, 0, 0, 0, 1, 1,
0.6170898, -0.436733, 1.186675, 0, 0, 0, 1, 1,
0.6222497, -1.049676, 1.268863, 0, 0, 0, 1, 1,
0.6247754, -0.2112807, 0.9695605, 0, 0, 0, 1, 1,
0.630233, -2.064069, 2.251644, 0, 0, 0, 1, 1,
0.6322877, -0.1575302, 0.7243631, 0, 0, 0, 1, 1,
0.6326153, -0.4475258, 1.135828, 0, 0, 0, 1, 1,
0.6347795, 1.586271, 0.8158818, 1, 1, 1, 1, 1,
0.6356236, 0.02653607, -0.5172362, 1, 1, 1, 1, 1,
0.6389136, -0.7659887, 1.860664, 1, 1, 1, 1, 1,
0.6399419, 1.366662, 1.309611, 1, 1, 1, 1, 1,
0.6440525, 1.394428, 0.8210362, 1, 1, 1, 1, 1,
0.6462298, 0.1588111, 0.8925619, 1, 1, 1, 1, 1,
0.6462432, 1.258536, -1.016737, 1, 1, 1, 1, 1,
0.6483936, -1.043305, 3.709665, 1, 1, 1, 1, 1,
0.6547701, 1.161732, -0.1533208, 1, 1, 1, 1, 1,
0.6571451, 0.9693842, -0.6004354, 1, 1, 1, 1, 1,
0.663288, 1.169399, -0.1912751, 1, 1, 1, 1, 1,
0.6643537, 0.141662, 0.9085682, 1, 1, 1, 1, 1,
0.6663737, 1.699462, 0.1740951, 1, 1, 1, 1, 1,
0.6680002, -1.745992, 3.507467, 1, 1, 1, 1, 1,
0.6719967, -1.809847, 4.300099, 1, 1, 1, 1, 1,
0.6745293, 0.5054215, 0.8821155, 0, 0, 1, 1, 1,
0.6772088, 0.7394497, 0.2886724, 1, 0, 0, 1, 1,
0.6775113, 0.6743019, 1.657465, 1, 0, 0, 1, 1,
0.6790156, 0.4214918, -0.2310408, 1, 0, 0, 1, 1,
0.6814049, -1.057412, 2.637577, 1, 0, 0, 1, 1,
0.6824777, -1.717432, 3.921458, 1, 0, 0, 1, 1,
0.6833443, -0.873252, 3.771713, 0, 0, 0, 1, 1,
0.6864486, 0.5720324, 0.9534995, 0, 0, 0, 1, 1,
0.702742, 0.9991122, 0.411726, 0, 0, 0, 1, 1,
0.7086269, 1.126215, 0.4674951, 0, 0, 0, 1, 1,
0.7108877, 0.5462332, -0.5348647, 0, 0, 0, 1, 1,
0.7188663, 0.1403493, 0.9621962, 0, 0, 0, 1, 1,
0.723703, -0.8347336, 3.85597, 0, 0, 0, 1, 1,
0.7266555, 0.2818079, 2.777221, 1, 1, 1, 1, 1,
0.7271732, -0.3533596, 0.1841043, 1, 1, 1, 1, 1,
0.7298234, 0.9778371, 0.512088, 1, 1, 1, 1, 1,
0.7455562, 0.8768435, -0.3760918, 1, 1, 1, 1, 1,
0.7462909, -0.9851545, 3.24825, 1, 1, 1, 1, 1,
0.7486461, 0.5323976, 1.155989, 1, 1, 1, 1, 1,
0.7488983, 0.3696899, 0.02549148, 1, 1, 1, 1, 1,
0.753888, 0.9717187, 1.774601, 1, 1, 1, 1, 1,
0.7560055, 0.5303057, 2.926172, 1, 1, 1, 1, 1,
0.7577567, 0.2063555, -1.367947, 1, 1, 1, 1, 1,
0.7621637, 1.587919, 0.5298279, 1, 1, 1, 1, 1,
0.7718093, 0.1313429, 1.516933, 1, 1, 1, 1, 1,
0.7739958, 0.01186681, 2.013446, 1, 1, 1, 1, 1,
0.7753333, -1.297401, 3.615202, 1, 1, 1, 1, 1,
0.7779212, -0.07348119, 0.8088783, 1, 1, 1, 1, 1,
0.7782193, 0.2714452, 0.9158986, 0, 0, 1, 1, 1,
0.783049, 0.4477215, 2.155008, 1, 0, 0, 1, 1,
0.7865626, 0.7556164, 0.9778687, 1, 0, 0, 1, 1,
0.7904884, 1.982078, -1.112885, 1, 0, 0, 1, 1,
0.7944196, -0.6092607, 2.854465, 1, 0, 0, 1, 1,
0.7978768, 0.4265685, 2.230515, 1, 0, 0, 1, 1,
0.8008277, -0.4148381, 2.463002, 0, 0, 0, 1, 1,
0.8014513, -0.4257722, 2.494831, 0, 0, 0, 1, 1,
0.8081076, 0.3951898, 0.8605849, 0, 0, 0, 1, 1,
0.8117145, 1.272348, -0.1884098, 0, 0, 0, 1, 1,
0.8153989, 0.4421071, 2.29809, 0, 0, 0, 1, 1,
0.8154449, 0.8426848, 3.03313, 0, 0, 0, 1, 1,
0.8168746, -0.6532955, 2.233564, 0, 0, 0, 1, 1,
0.8236098, 0.5061662, 1.956523, 1, 1, 1, 1, 1,
0.8298995, -0.03890235, 1.671446, 1, 1, 1, 1, 1,
0.8396258, -0.1120568, 1.837969, 1, 1, 1, 1, 1,
0.8435725, 1.952847, 0.3304698, 1, 1, 1, 1, 1,
0.854079, -1.032815, 1.37511, 1, 1, 1, 1, 1,
0.8570178, -0.01848278, 2.223024, 1, 1, 1, 1, 1,
0.8572553, 0.5738993, 1.674739, 1, 1, 1, 1, 1,
0.8608283, -0.638673, 2.16368, 1, 1, 1, 1, 1,
0.8627673, -1.212497, 3.033827, 1, 1, 1, 1, 1,
0.8654813, -0.9707009, 3.743806, 1, 1, 1, 1, 1,
0.8698722, 0.1531701, 1.454691, 1, 1, 1, 1, 1,
0.8759855, 0.3298245, 0.5736621, 1, 1, 1, 1, 1,
0.8811848, -1.502807, 2.271924, 1, 1, 1, 1, 1,
0.8828334, 0.3761742, 2.109337, 1, 1, 1, 1, 1,
0.8830354, 1.11563, 0.2804713, 1, 1, 1, 1, 1,
0.8841434, 0.1914056, 2.354343, 0, 0, 1, 1, 1,
0.8899796, -0.58283, -0.377419, 1, 0, 0, 1, 1,
0.8928337, 0.7439922, 0.4892147, 1, 0, 0, 1, 1,
0.9033901, -1.509647, 3.193058, 1, 0, 0, 1, 1,
0.9069328, 0.2667648, 0.4002956, 1, 0, 0, 1, 1,
0.9083554, -0.3734003, 1.399337, 1, 0, 0, 1, 1,
0.9085649, 0.6107622, 1.181233, 0, 0, 0, 1, 1,
0.9153838, 0.1080573, 2.275267, 0, 0, 0, 1, 1,
0.9221513, 2.342945, 0.7055888, 0, 0, 0, 1, 1,
0.9227454, -1.019308, 2.879443, 0, 0, 0, 1, 1,
0.923795, 0.7537919, 0.3379122, 0, 0, 0, 1, 1,
0.9294063, -0.05764507, 2.186432, 0, 0, 0, 1, 1,
0.937624, 0.6151205, 0.9997423, 0, 0, 0, 1, 1,
0.9376504, -1.796712, 2.420501, 1, 1, 1, 1, 1,
0.945124, -1.820035, 1.867253, 1, 1, 1, 1, 1,
0.9470016, 0.1685405, 1.494554, 1, 1, 1, 1, 1,
0.9486598, 0.4384819, 3.63163, 1, 1, 1, 1, 1,
0.9529365, -0.2352961, 0.1771984, 1, 1, 1, 1, 1,
0.9544951, -1.961188, 2.199605, 1, 1, 1, 1, 1,
0.9676394, 0.7833813, 0.5052834, 1, 1, 1, 1, 1,
0.9712412, 0.2918293, 2.67928, 1, 1, 1, 1, 1,
0.9756823, -0.4745778, 2.753938, 1, 1, 1, 1, 1,
0.9774568, -0.1983083, 2.094029, 1, 1, 1, 1, 1,
0.9842478, -0.4514946, 2.0635, 1, 1, 1, 1, 1,
0.9854413, 0.9537425, 2.778108, 1, 1, 1, 1, 1,
0.9882936, -0.4326497, 1.599008, 1, 1, 1, 1, 1,
0.9894477, 0.6223818, -0.2669196, 1, 1, 1, 1, 1,
0.9905467, -1.115577, 1.929027, 1, 1, 1, 1, 1,
0.9906151, -0.4654238, 1.913896, 0, 0, 1, 1, 1,
0.9974087, -0.2776234, 2.44903, 1, 0, 0, 1, 1,
1.013743, -0.2740146, 2.261166, 1, 0, 0, 1, 1,
1.017654, -1.813445, 4.143265, 1, 0, 0, 1, 1,
1.01893, 0.3832575, 1.379599, 1, 0, 0, 1, 1,
1.037523, 0.2406744, 1.264764, 1, 0, 0, 1, 1,
1.038888, 0.576127, 0.4426798, 0, 0, 0, 1, 1,
1.045791, 0.09808353, -0.3360884, 0, 0, 0, 1, 1,
1.046481, 0.2381799, 1.630142, 0, 0, 0, 1, 1,
1.060583, 0.08109826, 3.076892, 0, 0, 0, 1, 1,
1.060787, 1.610227, 0.6359454, 0, 0, 0, 1, 1,
1.061875, 1.218577, 2.296298, 0, 0, 0, 1, 1,
1.069103, 0.9041001, 0.66285, 0, 0, 0, 1, 1,
1.070004, 0.5894713, 0.4818423, 1, 1, 1, 1, 1,
1.07114, -0.5956668, 1.037013, 1, 1, 1, 1, 1,
1.071835, -0.6015093, 3.539238, 1, 1, 1, 1, 1,
1.073514, 0.7381609, 2.21876, 1, 1, 1, 1, 1,
1.074056, -0.4148227, 0.3413695, 1, 1, 1, 1, 1,
1.083276, 0.1964529, 0.5328539, 1, 1, 1, 1, 1,
1.084159, -0.181691, 0.7338746, 1, 1, 1, 1, 1,
1.086607, 0.5420904, 1.441082, 1, 1, 1, 1, 1,
1.087291, 0.7411537, 1.538627, 1, 1, 1, 1, 1,
1.099804, 1.229181, 1.349644, 1, 1, 1, 1, 1,
1.101268, 1.286395, 0.6796825, 1, 1, 1, 1, 1,
1.101319, 0.3563614, 1.793459, 1, 1, 1, 1, 1,
1.105002, 0.9747095, 0.5058888, 1, 1, 1, 1, 1,
1.108736, 0.9796878, 2.116109, 1, 1, 1, 1, 1,
1.109765, 1.039817, 0.111656, 1, 1, 1, 1, 1,
1.112419, -0.343189, 0.004856927, 0, 0, 1, 1, 1,
1.113779, -1.336853, 2.747994, 1, 0, 0, 1, 1,
1.116326, -0.5118981, 0.3815576, 1, 0, 0, 1, 1,
1.118267, -0.3325225, 2.516061, 1, 0, 0, 1, 1,
1.135566, 0.08475775, 0.968087, 1, 0, 0, 1, 1,
1.147932, -0.3826825, 1.245589, 1, 0, 0, 1, 1,
1.149091, -0.8502639, 2.393759, 0, 0, 0, 1, 1,
1.155273, 2.024273, -1.845379, 0, 0, 0, 1, 1,
1.159761, -0.5755844, 2.750356, 0, 0, 0, 1, 1,
1.160786, 0.0933083, 1.992577, 0, 0, 0, 1, 1,
1.162969, 0.164346, -0.2903275, 0, 0, 0, 1, 1,
1.169323, -0.2953511, 2.810773, 0, 0, 0, 1, 1,
1.170985, 0.4902579, 0.6979197, 0, 0, 0, 1, 1,
1.172567, -0.2230624, 0.7336795, 1, 1, 1, 1, 1,
1.180406, 0.1574957, 0.4476365, 1, 1, 1, 1, 1,
1.181741, -1.429801, 2.175532, 1, 1, 1, 1, 1,
1.18525, 0.06118998, 0.8644788, 1, 1, 1, 1, 1,
1.186514, 1.869365, 0.7030597, 1, 1, 1, 1, 1,
1.19777, 0.03755173, 2.150893, 1, 1, 1, 1, 1,
1.198504, -0.3716539, 1.749066, 1, 1, 1, 1, 1,
1.199638, 0.7277777, 1.386465, 1, 1, 1, 1, 1,
1.207557, 0.04431883, 1.207106, 1, 1, 1, 1, 1,
1.223462, 1.085693, 1.129401, 1, 1, 1, 1, 1,
1.224659, 0.2150589, 1.661486, 1, 1, 1, 1, 1,
1.22655, 0.8544681, 1.228618, 1, 1, 1, 1, 1,
1.231531, -0.9030942, 4.35192, 1, 1, 1, 1, 1,
1.245146, -0.387695, 3.511575, 1, 1, 1, 1, 1,
1.252964, 0.2902223, 0.9729601, 1, 1, 1, 1, 1,
1.254845, -0.06924707, 3.59648, 0, 0, 1, 1, 1,
1.260919, 0.9312467, -0.08522633, 1, 0, 0, 1, 1,
1.278453, -1.405186, 1.437576, 1, 0, 0, 1, 1,
1.287541, -1.103146, 1.672445, 1, 0, 0, 1, 1,
1.295563, -0.3065141, 2.144483, 1, 0, 0, 1, 1,
1.302655, 2.439626, 0.275132, 1, 0, 0, 1, 1,
1.321251, 0.3367629, -0.6422026, 0, 0, 0, 1, 1,
1.337459, -0.4188548, 2.433013, 0, 0, 0, 1, 1,
1.343894, -0.3326733, 1.176438, 0, 0, 0, 1, 1,
1.344193, 1.233587, 0.2023215, 0, 0, 0, 1, 1,
1.345302, -0.985613, 2.024842, 0, 0, 0, 1, 1,
1.352472, 1.123725, 0.3268394, 0, 0, 0, 1, 1,
1.352717, -0.3886198, 1.329676, 0, 0, 0, 1, 1,
1.353108, 0.338109, 1.228842, 1, 1, 1, 1, 1,
1.373411, 0.08557223, 1.235438, 1, 1, 1, 1, 1,
1.383776, -0.8691664, -0.7340347, 1, 1, 1, 1, 1,
1.38755, -0.2729492, 3.830738, 1, 1, 1, 1, 1,
1.390908, -0.2473511, 2.888461, 1, 1, 1, 1, 1,
1.391993, -0.2535742, 2.525424, 1, 1, 1, 1, 1,
1.420663, 1.715127, 1.670909, 1, 1, 1, 1, 1,
1.421541, -1.800025, 3.197025, 1, 1, 1, 1, 1,
1.429599, 0.7613942, 0.6929726, 1, 1, 1, 1, 1,
1.431985, 0.3545855, -0.2965541, 1, 1, 1, 1, 1,
1.432526, 0.8072473, 1.702206, 1, 1, 1, 1, 1,
1.433223, -0.1558011, 1.970206, 1, 1, 1, 1, 1,
1.442713, 1.061546, 1.118801, 1, 1, 1, 1, 1,
1.447586, 0.08980069, 1.501723, 1, 1, 1, 1, 1,
1.460951, -1.227782, 4.897675, 1, 1, 1, 1, 1,
1.462659, -0.9084839, 3.314149, 0, 0, 1, 1, 1,
1.470196, 0.7114542, 0.5359578, 1, 0, 0, 1, 1,
1.473173, -0.2224582, 1.851881, 1, 0, 0, 1, 1,
1.473306, 1.773044, -0.6031923, 1, 0, 0, 1, 1,
1.482033, 0.272879, 0.2157768, 1, 0, 0, 1, 1,
1.486692, -0.2828584, 1.780555, 1, 0, 0, 1, 1,
1.488574, 1.170009, 1.084384, 0, 0, 0, 1, 1,
1.491913, -1.09002, 1.528538, 0, 0, 0, 1, 1,
1.496682, -0.1569406, 2.208845, 0, 0, 0, 1, 1,
1.497862, 0.6493296, 0.3505438, 0, 0, 0, 1, 1,
1.509907, 1.370029, 0.8271108, 0, 0, 0, 1, 1,
1.510151, -0.16577, 2.717658, 0, 0, 0, 1, 1,
1.511526, 0.8908591, 2.822676, 0, 0, 0, 1, 1,
1.513705, -0.9622779, 2.663979, 1, 1, 1, 1, 1,
1.531757, -0.2596757, -0.6553729, 1, 1, 1, 1, 1,
1.540926, -1.611891, 2.353728, 1, 1, 1, 1, 1,
1.55149, 0.6005844, 2.356625, 1, 1, 1, 1, 1,
1.561143, -1.632874, 2.786925, 1, 1, 1, 1, 1,
1.578634, -0.8236868, 1.017944, 1, 1, 1, 1, 1,
1.578724, -1.558937, 0.07089181, 1, 1, 1, 1, 1,
1.593324, 0.4386803, 2.239597, 1, 1, 1, 1, 1,
1.597192, -1.636864, 3.236562, 1, 1, 1, 1, 1,
1.609915, -0.1538804, 1.339898, 1, 1, 1, 1, 1,
1.616693, 0.06542203, -0.7058854, 1, 1, 1, 1, 1,
1.625132, 0.3296717, -0.02188244, 1, 1, 1, 1, 1,
1.642728, -0.2185781, 1.589055, 1, 1, 1, 1, 1,
1.64344, 0.5776104, 2.146091, 1, 1, 1, 1, 1,
1.661194, 0.3090392, 0.4097459, 1, 1, 1, 1, 1,
1.664514, 0.7686461, 0.5473318, 0, 0, 1, 1, 1,
1.684329, -0.2922236, 1.323316, 1, 0, 0, 1, 1,
1.68556, 0.495473, 0.8339793, 1, 0, 0, 1, 1,
1.695953, -0.4220391, 2.544328, 1, 0, 0, 1, 1,
1.706523, 0.4698232, 0.7731105, 1, 0, 0, 1, 1,
1.706897, -1.379411, 3.402193, 1, 0, 0, 1, 1,
1.711732, -0.1492766, 2.156938, 0, 0, 0, 1, 1,
1.712396, 0.9464437, 1.491368, 0, 0, 0, 1, 1,
1.71442, -0.4224474, 1.380232, 0, 0, 0, 1, 1,
1.738855, 0.4539978, 0.3559732, 0, 0, 0, 1, 1,
1.755835, -0.6370858, 3.777642, 0, 0, 0, 1, 1,
1.7624, -0.8498314, 1.202315, 0, 0, 0, 1, 1,
1.772449, 0.3945217, 2.016207, 0, 0, 0, 1, 1,
1.789167, 1.312753, 0.9266831, 1, 1, 1, 1, 1,
1.795172, -0.1828146, 1.996057, 1, 1, 1, 1, 1,
1.805036, 1.268352, 0.2964082, 1, 1, 1, 1, 1,
1.805932, -0.9409527, 1.707791, 1, 1, 1, 1, 1,
1.838411, 0.3096978, 1.789811, 1, 1, 1, 1, 1,
1.840598, -0.124179, 2.317787, 1, 1, 1, 1, 1,
1.858729, 0.3509214, 2.310344, 1, 1, 1, 1, 1,
1.864075, -0.6932948, 0.633733, 1, 1, 1, 1, 1,
1.864626, -0.9492075, 1.264663, 1, 1, 1, 1, 1,
1.878729, 0.07219081, 1.966103, 1, 1, 1, 1, 1,
1.887949, 0.4065155, 0.1709894, 1, 1, 1, 1, 1,
1.910276, 0.7667941, 2.427482, 1, 1, 1, 1, 1,
1.964394, 1.531722, 0.8254762, 1, 1, 1, 1, 1,
1.9834, -0.1160535, 1.878677, 1, 1, 1, 1, 1,
1.986945, -1.163645, 3.29022, 1, 1, 1, 1, 1,
2.019939, -0.8303382, 2.357089, 0, 0, 1, 1, 1,
2.024356, -0.2861829, 1.906936, 1, 0, 0, 1, 1,
2.033373, -1.089659, 1.971239, 1, 0, 0, 1, 1,
2.061496, 0.2310706, 2.158063, 1, 0, 0, 1, 1,
2.090389, 0.3210915, 0.6821892, 1, 0, 0, 1, 1,
2.106611, -0.1249254, 0.8856585, 1, 0, 0, 1, 1,
2.108095, -1.22562, 2.929927, 0, 0, 0, 1, 1,
2.131342, 0.6728659, 0.6156253, 0, 0, 0, 1, 1,
2.140689, 1.636907, 1.148218, 0, 0, 0, 1, 1,
2.184006, -0.6221773, 1.05983, 0, 0, 0, 1, 1,
2.197465, -0.2133652, 0.8816503, 0, 0, 0, 1, 1,
2.222222, 1.508602, 1.379223, 0, 0, 0, 1, 1,
2.313369, -0.4035241, 0.5858032, 0, 0, 0, 1, 1,
2.317221, 1.278174, 0.8191491, 1, 1, 1, 1, 1,
2.372345, -0.3695456, 0.8525784, 1, 1, 1, 1, 1,
2.468163, 2.021984, 0.1962576, 1, 1, 1, 1, 1,
2.536591, -1.464082, 2.878706, 1, 1, 1, 1, 1,
2.585849, 0.194171, 1.39939, 1, 1, 1, 1, 1,
2.709036, 0.1563327, 1.719772, 1, 1, 1, 1, 1,
2.847248, 3.145272, 0.05909507, 1, 1, 1, 1, 1
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
var radius = 9.497246;
var distance = 33.35867;
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
mvMatrix.translate( 0.4759877, -0.2449825, 0.2007377 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.35867);
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
