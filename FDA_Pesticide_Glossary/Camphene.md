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
-3.10917, -1.200661, -2.448298, 1, 0, 0, 1,
-3.096225, 1.981713, -1.319151, 1, 0.007843138, 0, 1,
-3.082848, -1.237584, -1.14373, 1, 0.01176471, 0, 1,
-2.539814, -1.382383, -2.491076, 1, 0.01960784, 0, 1,
-2.431253, -1.47362, -0.3678065, 1, 0.02352941, 0, 1,
-2.413399, 0.2033585, -2.825937, 1, 0.03137255, 0, 1,
-2.368102, -0.1558072, -2.82382, 1, 0.03529412, 0, 1,
-2.35517, 0.6313907, -2.358307, 1, 0.04313726, 0, 1,
-2.33408, -0.3652279, -1.425614, 1, 0.04705882, 0, 1,
-2.286702, 1.866112, -0.07770131, 1, 0.05490196, 0, 1,
-2.286361, -0.6494588, -0.9006717, 1, 0.05882353, 0, 1,
-2.244472, -1.213535, -3.023602, 1, 0.06666667, 0, 1,
-2.236519, 0.06328373, -2.217402, 1, 0.07058824, 0, 1,
-2.223159, 0.4041974, -2.185619, 1, 0.07843138, 0, 1,
-2.198387, -0.06445519, -2.120378, 1, 0.08235294, 0, 1,
-2.176853, 1.513135, -1.662825, 1, 0.09019608, 0, 1,
-2.174846, 0.5036517, -3.244508, 1, 0.09411765, 0, 1,
-2.111544, 0.1071967, -2.390632, 1, 0.1019608, 0, 1,
-2.088849, 0.6178142, -1.896558, 1, 0.1098039, 0, 1,
-2.060116, -0.2503135, -0.7322765, 1, 0.1137255, 0, 1,
-2.048171, 0.7067761, -1.326752, 1, 0.1215686, 0, 1,
-2.011026, -0.3429825, -1.669248, 1, 0.1254902, 0, 1,
-2.00328, -0.2761838, -0.2795307, 1, 0.1333333, 0, 1,
-1.987583, -0.04451106, -2.099723, 1, 0.1372549, 0, 1,
-1.974348, 0.7693894, -0.2376304, 1, 0.145098, 0, 1,
-1.971972, 0.001899477, -0.6688824, 1, 0.1490196, 0, 1,
-1.969066, -0.2085671, -0.9157305, 1, 0.1568628, 0, 1,
-1.961753, -0.7116745, -1.879115, 1, 0.1607843, 0, 1,
-1.893887, 1.272972, -0.7926349, 1, 0.1686275, 0, 1,
-1.873118, -0.614221, -2.075781, 1, 0.172549, 0, 1,
-1.870839, -1.186604, -1.431404, 1, 0.1803922, 0, 1,
-1.865863, 0.1684501, -1.317044, 1, 0.1843137, 0, 1,
-1.842013, -0.3693672, -2.631797, 1, 0.1921569, 0, 1,
-1.821789, 1.45576, 0.4527537, 1, 0.1960784, 0, 1,
-1.815333, -0.0738919, -1.072263, 1, 0.2039216, 0, 1,
-1.804036, -0.07903013, -0.4773529, 1, 0.2117647, 0, 1,
-1.802895, 0.2966505, -0.3473798, 1, 0.2156863, 0, 1,
-1.786543, -1.715461, -1.308591, 1, 0.2235294, 0, 1,
-1.747803, 1.614285, 0.06319138, 1, 0.227451, 0, 1,
-1.73706, -0.5688686, -1.787234, 1, 0.2352941, 0, 1,
-1.730127, 0.6121013, -0.8964794, 1, 0.2392157, 0, 1,
-1.715403, 0.6142398, -0.6257771, 1, 0.2470588, 0, 1,
-1.715225, -0.769136, -2.243382, 1, 0.2509804, 0, 1,
-1.696476, -1.168013, -2.647187, 1, 0.2588235, 0, 1,
-1.682238, 0.2272248, -3.101181, 1, 0.2627451, 0, 1,
-1.656586, 0.1074365, -2.307308, 1, 0.2705882, 0, 1,
-1.655769, -0.9676093, -1.577651, 1, 0.2745098, 0, 1,
-1.653012, 0.813835, -1.205652, 1, 0.282353, 0, 1,
-1.647653, -1.320837, -3.352412, 1, 0.2862745, 0, 1,
-1.632271, -0.2191497, -1.514126, 1, 0.2941177, 0, 1,
-1.631745, 0.3375088, -1.002765, 1, 0.3019608, 0, 1,
-1.627892, -1.019473, -2.647381, 1, 0.3058824, 0, 1,
-1.621615, 1.205721, -1.545848, 1, 0.3137255, 0, 1,
-1.591747, 0.3235453, -1.973062, 1, 0.3176471, 0, 1,
-1.589315, 0.8446094, -1.199861, 1, 0.3254902, 0, 1,
-1.58154, 2.370684, -0.6181692, 1, 0.3294118, 0, 1,
-1.577996, -1.111816, -2.702983, 1, 0.3372549, 0, 1,
-1.548915, -2.900794, -1.615213, 1, 0.3411765, 0, 1,
-1.547777, 0.7842494, -2.62999, 1, 0.3490196, 0, 1,
-1.544023, 0.5314335, -2.865971, 1, 0.3529412, 0, 1,
-1.541636, -1.035823, -1.514758, 1, 0.3607843, 0, 1,
-1.52697, -0.9591373, -2.740213, 1, 0.3647059, 0, 1,
-1.523809, -1.296823, -2.030609, 1, 0.372549, 0, 1,
-1.523235, 0.5691673, -1.681788, 1, 0.3764706, 0, 1,
-1.521457, -0.9457366, -1.442922, 1, 0.3843137, 0, 1,
-1.507068, -1.346422, -3.00892, 1, 0.3882353, 0, 1,
-1.496905, 0.343311, 0.9467282, 1, 0.3960784, 0, 1,
-1.496293, 0.3053215, -0.975758, 1, 0.4039216, 0, 1,
-1.48466, 1.478095, -2.513973, 1, 0.4078431, 0, 1,
-1.476911, -0.6718487, -2.680526, 1, 0.4156863, 0, 1,
-1.464445, 0.4617142, -0.2587409, 1, 0.4196078, 0, 1,
-1.453764, 0.4917485, -0.907479, 1, 0.427451, 0, 1,
-1.44852, -0.4046924, -1.029523, 1, 0.4313726, 0, 1,
-1.447701, -1.44052, -0.8744395, 1, 0.4392157, 0, 1,
-1.444293, -1.202621, -1.645609, 1, 0.4431373, 0, 1,
-1.442207, 1.219499, -1.60955, 1, 0.4509804, 0, 1,
-1.437904, -0.9593138, -2.394104, 1, 0.454902, 0, 1,
-1.430445, 0.9188062, -0.4179535, 1, 0.4627451, 0, 1,
-1.429573, 1.937735, -0.6885453, 1, 0.4666667, 0, 1,
-1.418475, -0.9530697, 0.6158468, 1, 0.4745098, 0, 1,
-1.415617, -1.53063, -2.508759, 1, 0.4784314, 0, 1,
-1.398162, -0.03153873, -0.752129, 1, 0.4862745, 0, 1,
-1.37775, -0.05206323, -2.068437, 1, 0.4901961, 0, 1,
-1.366718, -3.168277, -2.35794, 1, 0.4980392, 0, 1,
-1.356211, -0.5776893, -0.9466366, 1, 0.5058824, 0, 1,
-1.354041, 0.6368768, 0.9876581, 1, 0.509804, 0, 1,
-1.350893, -0.8116972, -2.338258, 1, 0.5176471, 0, 1,
-1.350685, 1.151864, 0.352869, 1, 0.5215687, 0, 1,
-1.346853, 0.8073732, -1.605882, 1, 0.5294118, 0, 1,
-1.343389, 1.636642, -0.5234655, 1, 0.5333334, 0, 1,
-1.324175, -1.077567, -1.697724, 1, 0.5411765, 0, 1,
-1.321233, 0.1043632, -0.5010424, 1, 0.5450981, 0, 1,
-1.319833, -0.276246, -2.343647, 1, 0.5529412, 0, 1,
-1.306821, 0.2251351, -2.922221, 1, 0.5568628, 0, 1,
-1.306613, -0.7719624, -1.786248, 1, 0.5647059, 0, 1,
-1.305298, -0.06941412, -1.078158, 1, 0.5686275, 0, 1,
-1.298428, -0.3565308, -1.608523, 1, 0.5764706, 0, 1,
-1.296094, -0.7962302, -2.71858, 1, 0.5803922, 0, 1,
-1.295118, -0.5840092, -1.617888, 1, 0.5882353, 0, 1,
-1.294398, -2.845479, -1.388023, 1, 0.5921569, 0, 1,
-1.292785, -0.6377037, -1.816402, 1, 0.6, 0, 1,
-1.285813, -0.8126904, -2.412437, 1, 0.6078432, 0, 1,
-1.279943, 0.8770368, -1.387572, 1, 0.6117647, 0, 1,
-1.2795, 1.03009, -2.342522, 1, 0.6196079, 0, 1,
-1.273571, 0.5405221, -0.9555365, 1, 0.6235294, 0, 1,
-1.272024, -0.1946526, -1.899303, 1, 0.6313726, 0, 1,
-1.271621, -0.06854746, -2.532735, 1, 0.6352941, 0, 1,
-1.269828, -1.176997, -1.793827, 1, 0.6431373, 0, 1,
-1.265218, -2.160784, -1.41346, 1, 0.6470588, 0, 1,
-1.261692, -1.75372, -3.765889, 1, 0.654902, 0, 1,
-1.244921, 0.3572641, 0.6979117, 1, 0.6588235, 0, 1,
-1.243546, 0.9109226, -0.05024453, 1, 0.6666667, 0, 1,
-1.236602, 0.4542487, -2.104219, 1, 0.6705883, 0, 1,
-1.229809, 0.1222259, -1.310292, 1, 0.6784314, 0, 1,
-1.22634, -1.174236, -3.172175, 1, 0.682353, 0, 1,
-1.222378, 0.8443825, 0.7183946, 1, 0.6901961, 0, 1,
-1.221896, -0.1331129, 0.0101966, 1, 0.6941177, 0, 1,
-1.221821, 1.200043, -0.1547454, 1, 0.7019608, 0, 1,
-1.218689, 0.7500311, -0.6438612, 1, 0.7098039, 0, 1,
-1.211776, 1.4883, 0.9291475, 1, 0.7137255, 0, 1,
-1.209488, -0.1409673, -0.6435158, 1, 0.7215686, 0, 1,
-1.20135, -0.5148667, -2.871289, 1, 0.7254902, 0, 1,
-1.197139, 0.9456126, -1.238592, 1, 0.7333333, 0, 1,
-1.190717, -0.5103162, -1.786219, 1, 0.7372549, 0, 1,
-1.189419, 0.1028447, -1.048337, 1, 0.7450981, 0, 1,
-1.176368, -0.7907034, -1.509318, 1, 0.7490196, 0, 1,
-1.170079, -0.1991312, -0.7116805, 1, 0.7568628, 0, 1,
-1.166347, 1.079833, 0.5396003, 1, 0.7607843, 0, 1,
-1.165045, -0.4206921, -0.9401258, 1, 0.7686275, 0, 1,
-1.164136, -1.508755, -1.802543, 1, 0.772549, 0, 1,
-1.159013, 0.4570539, -1.395945, 1, 0.7803922, 0, 1,
-1.148287, -0.1222021, 0.02839966, 1, 0.7843137, 0, 1,
-1.148108, -0.02648173, -1.22272, 1, 0.7921569, 0, 1,
-1.137597, 0.9198042, -1.700776, 1, 0.7960784, 0, 1,
-1.137589, -0.8489363, -4.111885, 1, 0.8039216, 0, 1,
-1.132126, 1.537383, -0.09130184, 1, 0.8117647, 0, 1,
-1.123523, 0.5065376, -2.354004, 1, 0.8156863, 0, 1,
-1.122891, -0.3835685, -2.671159, 1, 0.8235294, 0, 1,
-1.122724, -0.06851703, -2.391392, 1, 0.827451, 0, 1,
-1.122661, 0.000754675, -0.1551344, 1, 0.8352941, 0, 1,
-1.119732, -0.7876262, -2.929316, 1, 0.8392157, 0, 1,
-1.116376, 0.07321095, -1.252841, 1, 0.8470588, 0, 1,
-1.114577, -0.5977694, -3.54313, 1, 0.8509804, 0, 1,
-1.111665, -0.9654475, -1.578675, 1, 0.8588235, 0, 1,
-1.111306, 0.09777539, 0.4721271, 1, 0.8627451, 0, 1,
-1.104712, -1.307355, -3.334219, 1, 0.8705882, 0, 1,
-1.104302, -1.378656, -2.53804, 1, 0.8745098, 0, 1,
-1.102878, -1.007506, -3.269614, 1, 0.8823529, 0, 1,
-1.101747, 1.553897, 0.04468704, 1, 0.8862745, 0, 1,
-1.095883, -0.9683688, -1.780919, 1, 0.8941177, 0, 1,
-1.09579, -0.2953812, -0.763169, 1, 0.8980392, 0, 1,
-1.09137, -1.073913, -0.8768958, 1, 0.9058824, 0, 1,
-1.087274, -1.016466, -2.233609, 1, 0.9137255, 0, 1,
-1.077187, -0.8811721, -3.220376, 1, 0.9176471, 0, 1,
-1.07082, -0.791508, -0.1011743, 1, 0.9254902, 0, 1,
-1.069655, 0.1225465, -0.09673259, 1, 0.9294118, 0, 1,
-1.066346, 0.8936756, -1.882889, 1, 0.9372549, 0, 1,
-1.05953, -1.467021, -2.769324, 1, 0.9411765, 0, 1,
-1.051849, -3.782676, -2.919229, 1, 0.9490196, 0, 1,
-1.04737, 0.5332307, -1.210732, 1, 0.9529412, 0, 1,
-1.030009, -1.033104, -2.014078, 1, 0.9607843, 0, 1,
-1.027923, -0.8650718, -0.1030631, 1, 0.9647059, 0, 1,
-1.019496, 0.889318, 0.3368072, 1, 0.972549, 0, 1,
-1.015687, 1.648882, -1.426196, 1, 0.9764706, 0, 1,
-1.014005, 0.8110109, -1.341083, 1, 0.9843137, 0, 1,
-1.013446, 0.38266, -0.6494484, 1, 0.9882353, 0, 1,
-1.004501, -1.281452, -2.701914, 1, 0.9960784, 0, 1,
-1.000152, -0.7241132, -1.020801, 0.9960784, 1, 0, 1,
-0.9991626, -0.8698063, -0.6743943, 0.9921569, 1, 0, 1,
-0.9988203, 0.5268093, 0.4728567, 0.9843137, 1, 0, 1,
-0.9918872, -3.00211, -1.81241, 0.9803922, 1, 0, 1,
-0.990455, 0.004236239, -1.637397, 0.972549, 1, 0, 1,
-0.9852365, -0.7790176, -3.341733, 0.9686275, 1, 0, 1,
-0.9741923, 0.454731, 1.33444, 0.9607843, 1, 0, 1,
-0.9729003, -1.062029, -2.472701, 0.9568627, 1, 0, 1,
-0.9708701, 0.5931276, -0.5667098, 0.9490196, 1, 0, 1,
-0.959987, -1.255928, -3.902416, 0.945098, 1, 0, 1,
-0.9598079, 0.9038303, -1.150287, 0.9372549, 1, 0, 1,
-0.9446266, -0.9475148, -2.20474, 0.9333333, 1, 0, 1,
-0.9291772, -0.1256048, -1.206472, 0.9254902, 1, 0, 1,
-0.923519, 0.6624069, 0.125726, 0.9215686, 1, 0, 1,
-0.9180475, -1.975304, -1.755127, 0.9137255, 1, 0, 1,
-0.916044, 0.7444451, -1.28483, 0.9098039, 1, 0, 1,
-0.9116417, -0.6656885, -1.6971, 0.9019608, 1, 0, 1,
-0.9100758, -2.549471, -1.159373, 0.8941177, 1, 0, 1,
-0.9098654, 0.07006873, -1.830019, 0.8901961, 1, 0, 1,
-0.9096324, 0.2466802, -0.2591539, 0.8823529, 1, 0, 1,
-0.9019715, -2.113626, -2.800611, 0.8784314, 1, 0, 1,
-0.8979705, -0.3384349, -3.451173, 0.8705882, 1, 0, 1,
-0.8971657, 0.1665038, -3.305049, 0.8666667, 1, 0, 1,
-0.8971173, 1.91615, -2.126648, 0.8588235, 1, 0, 1,
-0.890837, -0.1029787, -0.476229, 0.854902, 1, 0, 1,
-0.8851244, -0.6466589, -0.6268706, 0.8470588, 1, 0, 1,
-0.8844292, 0.2555392, -1.051487, 0.8431373, 1, 0, 1,
-0.8821249, 2.269288, -0.5339476, 0.8352941, 1, 0, 1,
-0.8808842, 0.4719652, -0.6889259, 0.8313726, 1, 0, 1,
-0.8669698, -0.1173267, -1.312247, 0.8235294, 1, 0, 1,
-0.8643302, 0.5268889, -1.906664, 0.8196079, 1, 0, 1,
-0.8547683, 0.6388262, -2.063431, 0.8117647, 1, 0, 1,
-0.8490168, 0.1884817, -2.129255, 0.8078431, 1, 0, 1,
-0.8456098, -0.6929199, -2.969129, 0.8, 1, 0, 1,
-0.8452516, 0.4432432, -1.337746, 0.7921569, 1, 0, 1,
-0.8435179, -2.290212, -3.364424, 0.7882353, 1, 0, 1,
-0.8389632, 0.6785395, -1.063334, 0.7803922, 1, 0, 1,
-0.8296618, 1.594693, 0.2705972, 0.7764706, 1, 0, 1,
-0.8293819, -0.5951999, -2.503743, 0.7686275, 1, 0, 1,
-0.8251388, 1.005244, -0.4953415, 0.7647059, 1, 0, 1,
-0.8198012, 1.30917, 0.2835605, 0.7568628, 1, 0, 1,
-0.8169976, 1.010302, 0.1931245, 0.7529412, 1, 0, 1,
-0.8165665, -1.139014, -4.273772, 0.7450981, 1, 0, 1,
-0.81494, 1.636978, -0.5432873, 0.7411765, 1, 0, 1,
-0.8100407, 0.5529923, -1.761527, 0.7333333, 1, 0, 1,
-0.8043998, -0.5054461, -0.59218, 0.7294118, 1, 0, 1,
-0.7969588, 1.130132, -1.527206, 0.7215686, 1, 0, 1,
-0.7885677, -0.1044612, 0.6051657, 0.7176471, 1, 0, 1,
-0.783692, -0.4005589, -1.858668, 0.7098039, 1, 0, 1,
-0.7822337, 0.4399314, -1.658396, 0.7058824, 1, 0, 1,
-0.7741248, -0.5385582, -1.910663, 0.6980392, 1, 0, 1,
-0.7739729, 0.1154183, -0.1267197, 0.6901961, 1, 0, 1,
-0.7729325, -2.010042, -2.63793, 0.6862745, 1, 0, 1,
-0.7650694, -1.509001, -4.815873, 0.6784314, 1, 0, 1,
-0.7625495, -0.2727344, -0.570944, 0.6745098, 1, 0, 1,
-0.762138, -1.963557, -3.099127, 0.6666667, 1, 0, 1,
-0.7615619, -1.391216, -1.41666, 0.6627451, 1, 0, 1,
-0.7545474, -0.5846463, -1.138107, 0.654902, 1, 0, 1,
-0.7497817, 0.1035613, -1.563571, 0.6509804, 1, 0, 1,
-0.7471282, 0.2914935, -1.125823, 0.6431373, 1, 0, 1,
-0.7394242, 0.04914793, -0.268749, 0.6392157, 1, 0, 1,
-0.7330133, 1.26414, -1.307931, 0.6313726, 1, 0, 1,
-0.7322713, 1.64185, -1.34998, 0.627451, 1, 0, 1,
-0.7308096, -0.3869806, -2.27314, 0.6196079, 1, 0, 1,
-0.7294749, 0.4682646, -1.001562, 0.6156863, 1, 0, 1,
-0.7252069, -1.057452, -0.7613424, 0.6078432, 1, 0, 1,
-0.7237525, 2.374312, -0.7215813, 0.6039216, 1, 0, 1,
-0.7232138, 0.04090947, -2.171042, 0.5960785, 1, 0, 1,
-0.7184131, -0.7096708, -2.167647, 0.5882353, 1, 0, 1,
-0.7143133, 2.108023, -1.342509, 0.5843138, 1, 0, 1,
-0.7115663, -0.2217258, -2.127333, 0.5764706, 1, 0, 1,
-0.7095776, 1.435812, -0.1831146, 0.572549, 1, 0, 1,
-0.7065599, -0.3192828, -2.023312, 0.5647059, 1, 0, 1,
-0.7062409, -1.033251, -2.262216, 0.5607843, 1, 0, 1,
-0.7032049, -0.4838024, -1.504202, 0.5529412, 1, 0, 1,
-0.7002395, -0.3709131, -1.797308, 0.5490196, 1, 0, 1,
-0.6989179, -0.1130233, -0.7795601, 0.5411765, 1, 0, 1,
-0.6981398, -1.071328, -3.809596, 0.5372549, 1, 0, 1,
-0.6902082, 1.118004, 0.6495114, 0.5294118, 1, 0, 1,
-0.6901453, 0.2109878, -0.952898, 0.5254902, 1, 0, 1,
-0.6887336, 2.25185, 0.1261559, 0.5176471, 1, 0, 1,
-0.6826194, -3.228479, -0.9902786, 0.5137255, 1, 0, 1,
-0.67447, 0.1803394, -2.062998, 0.5058824, 1, 0, 1,
-0.6655773, -0.4529741, -3.074099, 0.5019608, 1, 0, 1,
-0.664124, 0.8660716, -3.181212, 0.4941176, 1, 0, 1,
-0.6616918, -1.334748, -2.279101, 0.4862745, 1, 0, 1,
-0.6587857, -0.02178352, -2.53926, 0.4823529, 1, 0, 1,
-0.6563089, -0.1571289, -1.976816, 0.4745098, 1, 0, 1,
-0.6433283, 0.7264739, -1.68495, 0.4705882, 1, 0, 1,
-0.6429707, -1.474432, -1.617694, 0.4627451, 1, 0, 1,
-0.6410264, 1.323635, -1.059132, 0.4588235, 1, 0, 1,
-0.632652, -0.2451239, -1.276501, 0.4509804, 1, 0, 1,
-0.6326144, -0.611153, -3.348673, 0.4470588, 1, 0, 1,
-0.6269659, 0.1249583, -1.96802, 0.4392157, 1, 0, 1,
-0.62644, 0.05821737, -1.596993, 0.4352941, 1, 0, 1,
-0.6261976, -0.2977622, -3.930635, 0.427451, 1, 0, 1,
-0.6182272, -0.06607677, -2.410004, 0.4235294, 1, 0, 1,
-0.6163077, 1.279678, -0.5225629, 0.4156863, 1, 0, 1,
-0.6135989, -0.435865, -3.662045, 0.4117647, 1, 0, 1,
-0.6040908, 0.1834205, -3.322299, 0.4039216, 1, 0, 1,
-0.6004511, -1.377215, -2.221353, 0.3960784, 1, 0, 1,
-0.597471, 0.7951097, 0.551945, 0.3921569, 1, 0, 1,
-0.5952951, -0.3437697, -3.121619, 0.3843137, 1, 0, 1,
-0.5943447, -1.350434, -2.435542, 0.3803922, 1, 0, 1,
-0.5906596, -0.5672014, -1.556805, 0.372549, 1, 0, 1,
-0.5882977, -0.442205, -3.599998, 0.3686275, 1, 0, 1,
-0.5874171, 1.895406, 1.439844, 0.3607843, 1, 0, 1,
-0.5861884, -0.9911904, -2.742381, 0.3568628, 1, 0, 1,
-0.5806692, 0.471533, -1.027158, 0.3490196, 1, 0, 1,
-0.5789571, 1.647712, 0.5466611, 0.345098, 1, 0, 1,
-0.5787906, 0.248946, -1.299296, 0.3372549, 1, 0, 1,
-0.5744123, -0.009278866, -2.270559, 0.3333333, 1, 0, 1,
-0.5728693, 0.08902444, -0.7812287, 0.3254902, 1, 0, 1,
-0.5665167, 0.8022184, 0.1615257, 0.3215686, 1, 0, 1,
-0.5639354, -0.0398838, -3.485776, 0.3137255, 1, 0, 1,
-0.5635791, -1.316983, -4.571416, 0.3098039, 1, 0, 1,
-0.556502, 0.3301367, -1.009273, 0.3019608, 1, 0, 1,
-0.5544032, 0.3378642, -0.04662853, 0.2941177, 1, 0, 1,
-0.5541929, -0.08794738, -2.499235, 0.2901961, 1, 0, 1,
-0.5518275, -0.4393901, -2.867013, 0.282353, 1, 0, 1,
-0.5474852, -0.4660622, -3.960272, 0.2784314, 1, 0, 1,
-0.5470046, 1.591481, -0.1193811, 0.2705882, 1, 0, 1,
-0.5424569, -0.2246279, -2.636313, 0.2666667, 1, 0, 1,
-0.5405084, -0.4728662, -2.560561, 0.2588235, 1, 0, 1,
-0.5384714, 1.009351, -0.6909896, 0.254902, 1, 0, 1,
-0.5379455, 1.33439, -0.2533035, 0.2470588, 1, 0, 1,
-0.5345527, 0.230636, -3.154975, 0.2431373, 1, 0, 1,
-0.532587, 0.3524874, -2.664864, 0.2352941, 1, 0, 1,
-0.527692, 0.6703383, -0.1607955, 0.2313726, 1, 0, 1,
-0.5274515, -0.2801321, -2.486068, 0.2235294, 1, 0, 1,
-0.5244357, 0.1348119, -0.4842632, 0.2196078, 1, 0, 1,
-0.5230373, -0.6061708, -0.531961, 0.2117647, 1, 0, 1,
-0.5221611, -0.07782675, -2.597097, 0.2078431, 1, 0, 1,
-0.5216281, -0.3410435, -2.345898, 0.2, 1, 0, 1,
-0.519583, 1.420979, 1.619414, 0.1921569, 1, 0, 1,
-0.5193182, 0.3731669, -3.083134, 0.1882353, 1, 0, 1,
-0.5170497, -1.418173, -1.517202, 0.1803922, 1, 0, 1,
-0.514663, -2.411935, -3.337455, 0.1764706, 1, 0, 1,
-0.5060942, -0.7535011, -1.609907, 0.1686275, 1, 0, 1,
-0.5056529, 0.326573, -0.1103162, 0.1647059, 1, 0, 1,
-0.5055721, -0.8090351, -2.707168, 0.1568628, 1, 0, 1,
-0.504921, -0.96933, -3.057745, 0.1529412, 1, 0, 1,
-0.5015555, -0.3897226, -3.532485, 0.145098, 1, 0, 1,
-0.4975819, -1.509809, -1.33538, 0.1411765, 1, 0, 1,
-0.4950012, -1.428961, -3.33776, 0.1333333, 1, 0, 1,
-0.491468, 0.7469077, 0.2366118, 0.1294118, 1, 0, 1,
-0.4898554, -0.3596146, -3.305345, 0.1215686, 1, 0, 1,
-0.4871312, 0.261291, -2.309547, 0.1176471, 1, 0, 1,
-0.4853852, -0.4133753, -2.653066, 0.1098039, 1, 0, 1,
-0.4821241, 0.9221411, -1.557427, 0.1058824, 1, 0, 1,
-0.4818119, 0.1100073, -2.148173, 0.09803922, 1, 0, 1,
-0.4795039, 0.9683378, -0.708604, 0.09019608, 1, 0, 1,
-0.4765667, 1.216922, -0.9309182, 0.08627451, 1, 0, 1,
-0.4744852, -1.50564, -3.835665, 0.07843138, 1, 0, 1,
-0.4675644, -0.1707437, -1.96488, 0.07450981, 1, 0, 1,
-0.4671847, 0.3720827, -0.6193348, 0.06666667, 1, 0, 1,
-0.4661535, 0.6165132, -0.3104106, 0.0627451, 1, 0, 1,
-0.4652749, -0.1512926, -2.364953, 0.05490196, 1, 0, 1,
-0.463786, 0.9491904, -1.442185, 0.05098039, 1, 0, 1,
-0.4536686, 0.1424272, -1.968319, 0.04313726, 1, 0, 1,
-0.4522824, -0.5344141, -3.064894, 0.03921569, 1, 0, 1,
-0.4451571, 0.04704961, -0.06254622, 0.03137255, 1, 0, 1,
-0.4408723, 0.7286837, 0.3647074, 0.02745098, 1, 0, 1,
-0.4358057, 0.1580293, -1.134519, 0.01960784, 1, 0, 1,
-0.4303605, 1.441389, -1.803952, 0.01568628, 1, 0, 1,
-0.4278762, 0.5614412, 0.8799302, 0.007843138, 1, 0, 1,
-0.4234852, 1.419408, 1.39387, 0.003921569, 1, 0, 1,
-0.4196892, 0.6815905, -0.5136777, 0, 1, 0.003921569, 1,
-0.4181188, -1.610339, -1.523443, 0, 1, 0.01176471, 1,
-0.4079061, -0.4400817, -3.273659, 0, 1, 0.01568628, 1,
-0.4063281, -1.836406, -2.645162, 0, 1, 0.02352941, 1,
-0.4049982, 1.53661, -1.085367, 0, 1, 0.02745098, 1,
-0.4049895, -0.34416, -1.982651, 0, 1, 0.03529412, 1,
-0.4031813, 0.904512, 1.277714, 0, 1, 0.03921569, 1,
-0.4027588, -0.247478, -2.265559, 0, 1, 0.04705882, 1,
-0.3963685, -1.026846, -2.436606, 0, 1, 0.05098039, 1,
-0.3948416, 0.9317834, -1.02459, 0, 1, 0.05882353, 1,
-0.3927747, -1.06277, -3.107873, 0, 1, 0.0627451, 1,
-0.3909521, 1.063614, -0.9638812, 0, 1, 0.07058824, 1,
-0.3839645, -0.7866253, -1.217105, 0, 1, 0.07450981, 1,
-0.3833267, 0.4171416, -1.203794, 0, 1, 0.08235294, 1,
-0.3806135, 1.649011, -0.7250041, 0, 1, 0.08627451, 1,
-0.3799275, 0.8028345, -0.329025, 0, 1, 0.09411765, 1,
-0.3798827, 1.264292, -1.212137, 0, 1, 0.1019608, 1,
-0.3795832, 0.1953808, -0.3004156, 0, 1, 0.1058824, 1,
-0.3784594, -0.05451455, -0.6931582, 0, 1, 0.1137255, 1,
-0.3753236, 0.3395371, -0.1290173, 0, 1, 0.1176471, 1,
-0.3725443, -1.343251, -4.651903, 0, 1, 0.1254902, 1,
-0.3697942, -2.140703, -3.165078, 0, 1, 0.1294118, 1,
-0.3694625, 0.4814697, -1.697991, 0, 1, 0.1372549, 1,
-0.3689776, 1.054753, -1.46547, 0, 1, 0.1411765, 1,
-0.368227, -0.7523772, -2.810287, 0, 1, 0.1490196, 1,
-0.3661122, -0.1844203, -1.162525, 0, 1, 0.1529412, 1,
-0.3648261, -0.6364186, -2.137636, 0, 1, 0.1607843, 1,
-0.3619528, -0.5803567, -1.394455, 0, 1, 0.1647059, 1,
-0.3598144, 0.8993914, -0.3068103, 0, 1, 0.172549, 1,
-0.3588052, 1.159192, -0.1272987, 0, 1, 0.1764706, 1,
-0.3557692, 1.343721, 0.7500218, 0, 1, 0.1843137, 1,
-0.3550583, -1.189051, -2.88427, 0, 1, 0.1882353, 1,
-0.3514808, -0.3628551, -0.8937954, 0, 1, 0.1960784, 1,
-0.350983, -1.074851, -1.745664, 0, 1, 0.2039216, 1,
-0.3503653, -1.016119, -3.570917, 0, 1, 0.2078431, 1,
-0.3493436, 0.4718636, -0.1618816, 0, 1, 0.2156863, 1,
-0.3463381, -0.1591107, -1.895612, 0, 1, 0.2196078, 1,
-0.3441073, -0.8036183, -3.054027, 0, 1, 0.227451, 1,
-0.3413864, 1.44159, 0.0863361, 0, 1, 0.2313726, 1,
-0.3376386, 0.6553121, 0.9556438, 0, 1, 0.2392157, 1,
-0.3329352, -0.2234879, -5.270574, 0, 1, 0.2431373, 1,
-0.3203494, 1.231246, -1.997165, 0, 1, 0.2509804, 1,
-0.3198448, 0.2996746, 0.323958, 0, 1, 0.254902, 1,
-0.317599, -0.5103617, -3.022307, 0, 1, 0.2627451, 1,
-0.3174183, -0.9273369, -3.861542, 0, 1, 0.2666667, 1,
-0.311587, 1.530146, -0.04742312, 0, 1, 0.2745098, 1,
-0.3106742, -0.01880888, -1.679508, 0, 1, 0.2784314, 1,
-0.3098286, -0.9240434, -3.57021, 0, 1, 0.2862745, 1,
-0.3064673, 0.1602922, -0.8875303, 0, 1, 0.2901961, 1,
-0.3062489, 0.7882403, -1.087937, 0, 1, 0.2980392, 1,
-0.3038895, -1.278538, -4.434931, 0, 1, 0.3058824, 1,
-0.3036238, -0.3912464, -3.422789, 0, 1, 0.3098039, 1,
-0.296549, 0.006847113, -2.15016, 0, 1, 0.3176471, 1,
-0.2951075, 0.3914003, -2.185509, 0, 1, 0.3215686, 1,
-0.289859, 0.1773024, -1.774772, 0, 1, 0.3294118, 1,
-0.2872676, -0.4024812, -3.468325, 0, 1, 0.3333333, 1,
-0.2863903, 1.528215, 1.087279, 0, 1, 0.3411765, 1,
-0.2818354, -0.5474272, -1.931341, 0, 1, 0.345098, 1,
-0.2802316, -0.927739, -2.407193, 0, 1, 0.3529412, 1,
-0.2799907, 1.544811, -0.5163137, 0, 1, 0.3568628, 1,
-0.2781627, 0.5380626, -1.570064, 0, 1, 0.3647059, 1,
-0.2765145, 0.9089671, -1.633379, 0, 1, 0.3686275, 1,
-0.271435, 0.3828343, 0.2401614, 0, 1, 0.3764706, 1,
-0.2696092, 1.2069, 0.1647239, 0, 1, 0.3803922, 1,
-0.2676632, 1.80213, -1.422175, 0, 1, 0.3882353, 1,
-0.2668109, 0.709474, 0.1432212, 0, 1, 0.3921569, 1,
-0.2595121, -0.8437166, -2.657053, 0, 1, 0.4, 1,
-0.2590797, -0.0147081, -1.334207, 0, 1, 0.4078431, 1,
-0.2553621, -1.567691, -3.012459, 0, 1, 0.4117647, 1,
-0.2550709, -0.4709197, -4.299492, 0, 1, 0.4196078, 1,
-0.254986, -0.3626494, -1.480308, 0, 1, 0.4235294, 1,
-0.2540734, -1.514537, -3.47097, 0, 1, 0.4313726, 1,
-0.2528761, 1.5613, 1.181385, 0, 1, 0.4352941, 1,
-0.2491801, 0.3309644, -1.527855, 0, 1, 0.4431373, 1,
-0.2487552, -0.8234617, -2.5496, 0, 1, 0.4470588, 1,
-0.2486142, -0.09317033, 0.1664743, 0, 1, 0.454902, 1,
-0.2472481, 0.887956, 0.5127791, 0, 1, 0.4588235, 1,
-0.2448758, -1.2209, -3.934204, 0, 1, 0.4666667, 1,
-0.2401809, 0.799154, -0.07137822, 0, 1, 0.4705882, 1,
-0.2388793, 0.3629071, -0.5093864, 0, 1, 0.4784314, 1,
-0.2351544, 1.945549, -0.3275207, 0, 1, 0.4823529, 1,
-0.2329424, 0.6107462, -0.08516342, 0, 1, 0.4901961, 1,
-0.2298516, -0.7122427, -2.939468, 0, 1, 0.4941176, 1,
-0.2257109, 0.5973359, -1.99138, 0, 1, 0.5019608, 1,
-0.2238212, 0.4540935, -0.166815, 0, 1, 0.509804, 1,
-0.2234076, 1.196935, 0.04721196, 0, 1, 0.5137255, 1,
-0.2227403, -1.098252, -2.377443, 0, 1, 0.5215687, 1,
-0.2215269, -0.1330265, -2.221215, 0, 1, 0.5254902, 1,
-0.220397, -1.056041, -3.757242, 0, 1, 0.5333334, 1,
-0.2199107, -0.208179, -2.015302, 0, 1, 0.5372549, 1,
-0.2186579, -0.5729358, -2.502736, 0, 1, 0.5450981, 1,
-0.2169766, 0.2558479, -1.055549, 0, 1, 0.5490196, 1,
-0.2147838, 1.396493, 1.680196, 0, 1, 0.5568628, 1,
-0.2145821, 1.106994, -0.8718249, 0, 1, 0.5607843, 1,
-0.2098611, 0.1394084, -0.5859472, 0, 1, 0.5686275, 1,
-0.2070347, -0.3692787, -2.854369, 0, 1, 0.572549, 1,
-0.2056213, 0.8142893, -0.8779349, 0, 1, 0.5803922, 1,
-0.2015077, 0.6937332, -1.051433, 0, 1, 0.5843138, 1,
-0.2003717, 0.8704118, 0.440384, 0, 1, 0.5921569, 1,
-0.1990535, -1.167111, -3.42523, 0, 1, 0.5960785, 1,
-0.1938637, -0.9108913, -2.646333, 0, 1, 0.6039216, 1,
-0.1912823, -0.9001521, -1.392674, 0, 1, 0.6117647, 1,
-0.1873509, 0.6161288, 0.1417783, 0, 1, 0.6156863, 1,
-0.1871971, 1.053108, 1.407066, 0, 1, 0.6235294, 1,
-0.1871233, 1.863216, -0.1995342, 0, 1, 0.627451, 1,
-0.1777022, -1.066356, -4.326097, 0, 1, 0.6352941, 1,
-0.177287, 1.015639, 0.8737565, 0, 1, 0.6392157, 1,
-0.1746399, 1.422303, 1.862128, 0, 1, 0.6470588, 1,
-0.1739247, -0.1253516, -3.003989, 0, 1, 0.6509804, 1,
-0.1698615, 0.6442522, 1.30219, 0, 1, 0.6588235, 1,
-0.1516804, -0.2536851, -2.545494, 0, 1, 0.6627451, 1,
-0.1421093, -0.3419335, -2.390666, 0, 1, 0.6705883, 1,
-0.1395302, 0.2885871, -0.7460229, 0, 1, 0.6745098, 1,
-0.139047, -0.1830172, -2.888443, 0, 1, 0.682353, 1,
-0.1272468, 0.2532483, 1.091014, 0, 1, 0.6862745, 1,
-0.1257542, 0.007771688, 1.436231, 0, 1, 0.6941177, 1,
-0.1240097, -1.532024, -3.445657, 0, 1, 0.7019608, 1,
-0.1232865, -0.9305585, -3.67178, 0, 1, 0.7058824, 1,
-0.1232644, -0.5268818, -3.890235, 0, 1, 0.7137255, 1,
-0.1220561, -0.6497247, -1.777207, 0, 1, 0.7176471, 1,
-0.1217903, 0.8992215, 0.02331617, 0, 1, 0.7254902, 1,
-0.1212244, 0.1316022, -2.071137, 0, 1, 0.7294118, 1,
-0.11711, -0.8333986, -4.491629, 0, 1, 0.7372549, 1,
-0.1159517, -0.4025997, -1.392838, 0, 1, 0.7411765, 1,
-0.1152471, 0.03404831, -0.1401252, 0, 1, 0.7490196, 1,
-0.1147322, 1.469898, -1.07738, 0, 1, 0.7529412, 1,
-0.114097, -2.041843, -3.727607, 0, 1, 0.7607843, 1,
-0.1125354, -1.643172, -2.931356, 0, 1, 0.7647059, 1,
-0.1119081, 0.4116059, -0.9791449, 0, 1, 0.772549, 1,
-0.1060809, -0.4942632, -3.323076, 0, 1, 0.7764706, 1,
-0.1042006, -1.305744, -1.628253, 0, 1, 0.7843137, 1,
-0.1010725, 0.2479086, 1.34948, 0, 1, 0.7882353, 1,
-0.1007458, -1.546013, -4.647841, 0, 1, 0.7960784, 1,
-0.09903881, 2.22488, 1.111889, 0, 1, 0.8039216, 1,
-0.09895468, -2.082124, -3.156996, 0, 1, 0.8078431, 1,
-0.09863121, 0.0729859, -0.2184182, 0, 1, 0.8156863, 1,
-0.09831279, 0.6837347, -0.271968, 0, 1, 0.8196079, 1,
-0.09128364, 1.840451, 0.3279922, 0, 1, 0.827451, 1,
-0.08625707, -0.008718893, -0.9138023, 0, 1, 0.8313726, 1,
-0.07966566, 0.5865414, 1.268625, 0, 1, 0.8392157, 1,
-0.07877835, 0.7745559, -0.4666227, 0, 1, 0.8431373, 1,
-0.07847944, -0.2935549, -2.901088, 0, 1, 0.8509804, 1,
-0.07725402, -0.9537142, -2.082427, 0, 1, 0.854902, 1,
-0.07521954, 0.4103697, -2.193515, 0, 1, 0.8627451, 1,
-0.07168425, -1.652079, -3.303091, 0, 1, 0.8666667, 1,
-0.0656554, 0.3107052, -1.030946, 0, 1, 0.8745098, 1,
-0.06475107, 0.1512825, 0.3817855, 0, 1, 0.8784314, 1,
-0.06468985, -0.9069333, -2.195196, 0, 1, 0.8862745, 1,
-0.06396614, 0.6551284, -0.932588, 0, 1, 0.8901961, 1,
-0.06390228, -0.5082558, -0.7417072, 0, 1, 0.8980392, 1,
-0.06086274, -1.923339, -3.611687, 0, 1, 0.9058824, 1,
-0.06047392, 1.271024, 2.199612, 0, 1, 0.9098039, 1,
-0.05954864, 2.483742, -0.5945876, 0, 1, 0.9176471, 1,
-0.05858623, 1.208628, 0.4502855, 0, 1, 0.9215686, 1,
-0.05574029, 0.9635679, -0.6680698, 0, 1, 0.9294118, 1,
-0.05436036, 1.202572, 0.3538033, 0, 1, 0.9333333, 1,
-0.05184162, 0.4062173, 0.358703, 0, 1, 0.9411765, 1,
-0.04679822, 0.6089299, -0.5538383, 0, 1, 0.945098, 1,
-0.04588452, 0.598433, -0.5110859, 0, 1, 0.9529412, 1,
-0.0453775, 0.5155058, 4.222075, 0, 1, 0.9568627, 1,
-0.03810035, -0.26905, -3.304942, 0, 1, 0.9647059, 1,
-0.03196497, 0.7505451, -2.05832, 0, 1, 0.9686275, 1,
-0.02955696, 1.303722, 0.04400082, 0, 1, 0.9764706, 1,
-0.02755422, 0.6690356, 0.008273305, 0, 1, 0.9803922, 1,
-0.02623441, -1.117942, -4.176476, 0, 1, 0.9882353, 1,
-0.0229322, 0.9664418, 0.1776648, 0, 1, 0.9921569, 1,
-0.02206972, 0.3060406, -0.8874115, 0, 1, 1, 1,
-0.01484602, 0.584116, 0.8293146, 0, 0.9921569, 1, 1,
-0.012112, 0.6038303, -0.8670653, 0, 0.9882353, 1, 1,
-0.01146683, 0.7198118, 0.4301069, 0, 0.9803922, 1, 1,
-0.007544599, 0.2468889, -1.413814, 0, 0.9764706, 1, 1,
-0.006549996, -1.599584, -3.623152, 0, 0.9686275, 1, 1,
-0.006206619, -2.444072, -2.786236, 0, 0.9647059, 1, 1,
-0.0029253, -0.5001839, -1.34168, 0, 0.9568627, 1, 1,
-0.002339151, 0.3673601, 0.1153348, 0, 0.9529412, 1, 1,
-0.001278313, 0.3585056, 0.12842, 0, 0.945098, 1, 1,
-0.0006330283, 0.05483565, 0.6342716, 0, 0.9411765, 1, 1,
0.0007787358, 0.7572744, 0.1050262, 0, 0.9333333, 1, 1,
0.0009899532, -1.337859, 3.059254, 0, 0.9294118, 1, 1,
0.005968644, -1.533856, 3.441373, 0, 0.9215686, 1, 1,
0.006345985, -0.5039306, 2.456168, 0, 0.9176471, 1, 1,
0.009921248, 1.017268, 0.8728636, 0, 0.9098039, 1, 1,
0.01136261, 0.3354961, 0.5903767, 0, 0.9058824, 1, 1,
0.01249637, -1.722395, 1.589334, 0, 0.8980392, 1, 1,
0.01424314, -0.325956, 3.268724, 0, 0.8901961, 1, 1,
0.01444777, 1.499242, -0.5421849, 0, 0.8862745, 1, 1,
0.0255887, 0.9475812, -1.336675, 0, 0.8784314, 1, 1,
0.02690589, 0.5118948, 0.4684908, 0, 0.8745098, 1, 1,
0.03022345, -0.3652709, 1.95651, 0, 0.8666667, 1, 1,
0.03210858, -0.1753234, 4.846601, 0, 0.8627451, 1, 1,
0.03453803, 0.2323308, 1.732468, 0, 0.854902, 1, 1,
0.0370748, 0.5851805, 0.9828939, 0, 0.8509804, 1, 1,
0.04156106, -1.862452, 4.928044, 0, 0.8431373, 1, 1,
0.04215308, -0.2065038, 3.996206, 0, 0.8392157, 1, 1,
0.04293642, 1.797099, -0.4839083, 0, 0.8313726, 1, 1,
0.04327969, 0.4949048, -0.1421961, 0, 0.827451, 1, 1,
0.04519827, 0.8719224, -0.254266, 0, 0.8196079, 1, 1,
0.04728152, -0.01171045, 1.409737, 0, 0.8156863, 1, 1,
0.05510097, -0.02487222, 2.135288, 0, 0.8078431, 1, 1,
0.05808644, -0.6093142, 2.391294, 0, 0.8039216, 1, 1,
0.06237449, 0.01660478, 0.5618786, 0, 0.7960784, 1, 1,
0.06258719, -0.6292925, 4.187855, 0, 0.7882353, 1, 1,
0.06488785, 0.07326914, 1.416803, 0, 0.7843137, 1, 1,
0.06928743, -0.4101634, 4.24951, 0, 0.7764706, 1, 1,
0.0701685, -1.474047, 3.624929, 0, 0.772549, 1, 1,
0.07162235, -1.447184, 4.413075, 0, 0.7647059, 1, 1,
0.07170036, 0.9529926, -0.1247229, 0, 0.7607843, 1, 1,
0.07202657, 1.638126, 0.0130853, 0, 0.7529412, 1, 1,
0.07212692, -0.5691913, 3.853178, 0, 0.7490196, 1, 1,
0.07300813, 1.515668, 0.5083074, 0, 0.7411765, 1, 1,
0.07360793, 0.7801525, 0.9184891, 0, 0.7372549, 1, 1,
0.07391004, 0.2417579, 0.6063633, 0, 0.7294118, 1, 1,
0.08613866, -1.8318, 2.333822, 0, 0.7254902, 1, 1,
0.09447255, 1.191577, -0.495814, 0, 0.7176471, 1, 1,
0.09702619, 0.4185633, 0.7332668, 0, 0.7137255, 1, 1,
0.1001672, -0.4247557, 2.995676, 0, 0.7058824, 1, 1,
0.1009866, -0.7449555, 1.66642, 0, 0.6980392, 1, 1,
0.1051056, 0.9215263, -0.2947597, 0, 0.6941177, 1, 1,
0.1065672, 0.3394952, -0.1885184, 0, 0.6862745, 1, 1,
0.1072863, 0.2848323, 0.4871332, 0, 0.682353, 1, 1,
0.1084116, -0.1196677, 1.735024, 0, 0.6745098, 1, 1,
0.108859, -0.4031222, 2.521286, 0, 0.6705883, 1, 1,
0.1089105, 2.03982, 1.459353, 0, 0.6627451, 1, 1,
0.114073, -1.635811, 3.473741, 0, 0.6588235, 1, 1,
0.121574, 1.172877, 0.6615891, 0, 0.6509804, 1, 1,
0.1272114, -0.4047254, 2.598832, 0, 0.6470588, 1, 1,
0.1281045, -1.408851, 2.527153, 0, 0.6392157, 1, 1,
0.1302254, 0.266163, 1.808021, 0, 0.6352941, 1, 1,
0.1337844, 0.5226653, -0.4707113, 0, 0.627451, 1, 1,
0.1342478, -0.9826357, 3.741061, 0, 0.6235294, 1, 1,
0.1348354, 1.257447, -0.167562, 0, 0.6156863, 1, 1,
0.1353093, 0.3086509, 0.8980525, 0, 0.6117647, 1, 1,
0.1498152, 1.12468, -1.062721, 0, 0.6039216, 1, 1,
0.1502475, 0.09559095, 1.478714, 0, 0.5960785, 1, 1,
0.1526037, 0.1914535, 1.363955, 0, 0.5921569, 1, 1,
0.1532478, 0.8907207, 0.8204037, 0, 0.5843138, 1, 1,
0.1607488, -0.8499897, 4.421947, 0, 0.5803922, 1, 1,
0.1637616, -0.1963397, 2.213119, 0, 0.572549, 1, 1,
0.1682122, -1.882985, 4.574644, 0, 0.5686275, 1, 1,
0.1684627, 0.2397067, 0.5998431, 0, 0.5607843, 1, 1,
0.1707839, -1.99804, 2.91965, 0, 0.5568628, 1, 1,
0.1725224, 1.970506, -0.5053067, 0, 0.5490196, 1, 1,
0.1738059, -1.758492, 2.433968, 0, 0.5450981, 1, 1,
0.1746836, -1.063145, 4.427335, 0, 0.5372549, 1, 1,
0.1746965, -0.8843187, 2.347016, 0, 0.5333334, 1, 1,
0.1773035, -1.487702, 1.499315, 0, 0.5254902, 1, 1,
0.1811134, 0.4221536, -1.063646, 0, 0.5215687, 1, 1,
0.1814997, 0.6417735, -0.2148854, 0, 0.5137255, 1, 1,
0.1844234, 0.2416656, 1.644079, 0, 0.509804, 1, 1,
0.1874367, -0.1246439, 2.310691, 0, 0.5019608, 1, 1,
0.192015, -1.055244, 3.30605, 0, 0.4941176, 1, 1,
0.1929415, -0.5403637, 2.45178, 0, 0.4901961, 1, 1,
0.1934119, -1.501997, 2.716843, 0, 0.4823529, 1, 1,
0.1995766, 0.4952189, -0.5314738, 0, 0.4784314, 1, 1,
0.2004588, -1.401447, 2.788286, 0, 0.4705882, 1, 1,
0.2012399, 1.050212, 0.6997741, 0, 0.4666667, 1, 1,
0.2034716, 1.060487, -0.8684528, 0, 0.4588235, 1, 1,
0.2055002, -1.307637, 3.24003, 0, 0.454902, 1, 1,
0.206662, -0.2741339, 4.4507, 0, 0.4470588, 1, 1,
0.2071445, 0.1578986, 0.5817136, 0, 0.4431373, 1, 1,
0.2103902, 1.092999, -0.4780469, 0, 0.4352941, 1, 1,
0.2166975, -1.037089, 0.6058252, 0, 0.4313726, 1, 1,
0.2223121, 0.582143, 1.59718, 0, 0.4235294, 1, 1,
0.2318024, -1.045333, 3.212249, 0, 0.4196078, 1, 1,
0.2323596, -0.6866491, 3.71127, 0, 0.4117647, 1, 1,
0.2334945, 0.5006421, -0.102289, 0, 0.4078431, 1, 1,
0.2360843, -0.6492819, 4.114227, 0, 0.4, 1, 1,
0.2450708, -0.2911077, 1.416987, 0, 0.3921569, 1, 1,
0.2466139, -0.2288859, 2.905705, 0, 0.3882353, 1, 1,
0.246731, 0.2646199, 1.827317, 0, 0.3803922, 1, 1,
0.2502612, -0.8929532, 3.793053, 0, 0.3764706, 1, 1,
0.2532476, -0.983736, 3.331035, 0, 0.3686275, 1, 1,
0.253713, -0.6979252, 1.429056, 0, 0.3647059, 1, 1,
0.2540594, -0.6805418, 2.346588, 0, 0.3568628, 1, 1,
0.2544857, 0.3525075, 0.982861, 0, 0.3529412, 1, 1,
0.2545443, 0.9673529, 0.2652422, 0, 0.345098, 1, 1,
0.2557801, 0.1938409, -0.6824002, 0, 0.3411765, 1, 1,
0.2585154, 1.258259, 1.297735, 0, 0.3333333, 1, 1,
0.2612913, -2.79624, 3.52128, 0, 0.3294118, 1, 1,
0.2618124, 1.642659, -1.67884, 0, 0.3215686, 1, 1,
0.2646017, -0.3614293, 0.7645728, 0, 0.3176471, 1, 1,
0.2656446, -0.3681069, 0.1107392, 0, 0.3098039, 1, 1,
0.2668268, 1.747624, -0.181509, 0, 0.3058824, 1, 1,
0.2693429, -0.6059878, 2.354426, 0, 0.2980392, 1, 1,
0.271889, -0.9083257, 2.327029, 0, 0.2901961, 1, 1,
0.272101, -1.558873, 4.928338, 0, 0.2862745, 1, 1,
0.2795942, 1.663773, 1.297506, 0, 0.2784314, 1, 1,
0.2801658, -0.2381654, 2.052093, 0, 0.2745098, 1, 1,
0.2830478, -0.792275, 3.188592, 0, 0.2666667, 1, 1,
0.2869987, 0.05425263, 3.03458, 0, 0.2627451, 1, 1,
0.2888855, 0.2857947, -0.2902025, 0, 0.254902, 1, 1,
0.2925233, 0.4822442, -0.0135232, 0, 0.2509804, 1, 1,
0.2947673, 0.4990709, 1.526053, 0, 0.2431373, 1, 1,
0.2966119, -1.08989, 2.241698, 0, 0.2392157, 1, 1,
0.2997462, -0.6334915, 4.478533, 0, 0.2313726, 1, 1,
0.3063591, -0.4860569, 2.788796, 0, 0.227451, 1, 1,
0.3087493, 0.857076, -0.0718701, 0, 0.2196078, 1, 1,
0.3172926, 0.9621003, 0.1728626, 0, 0.2156863, 1, 1,
0.3194723, 0.4968916, 2.287488, 0, 0.2078431, 1, 1,
0.322758, 1.482408, 0.2899691, 0, 0.2039216, 1, 1,
0.3254867, 1.009178, 1.13153, 0, 0.1960784, 1, 1,
0.3263848, -1.106034, 2.584874, 0, 0.1882353, 1, 1,
0.3264033, -0.9000961, 3.877179, 0, 0.1843137, 1, 1,
0.3283179, 0.6672279, 1.581635, 0, 0.1764706, 1, 1,
0.3285413, -0.6524192, 2.688408, 0, 0.172549, 1, 1,
0.3329085, -1.318505, 4.083152, 0, 0.1647059, 1, 1,
0.3352923, -1.126392, 2.215603, 0, 0.1607843, 1, 1,
0.3371221, -0.7859966, 1.936844, 0, 0.1529412, 1, 1,
0.3379125, 1.037206, -0.2251984, 0, 0.1490196, 1, 1,
0.3447672, -0.1505453, -0.02616705, 0, 0.1411765, 1, 1,
0.3456822, -0.02081964, 1.246828, 0, 0.1372549, 1, 1,
0.35055, 1.09101, 1.274482, 0, 0.1294118, 1, 1,
0.350989, 0.4619413, 0.743009, 0, 0.1254902, 1, 1,
0.351669, -0.3209532, 2.507474, 0, 0.1176471, 1, 1,
0.3546468, -0.112119, 0.8375629, 0, 0.1137255, 1, 1,
0.3718327, -1.525574, 2.682477, 0, 0.1058824, 1, 1,
0.3732768, 1.150648, -0.4117172, 0, 0.09803922, 1, 1,
0.3747705, 1.209569, 0.1702875, 0, 0.09411765, 1, 1,
0.3764015, 0.1864101, 2.153582, 0, 0.08627451, 1, 1,
0.3764246, -1.259177, 1.165619, 0, 0.08235294, 1, 1,
0.3766726, -0.5271987, 2.060665, 0, 0.07450981, 1, 1,
0.3813167, 0.6650532, 0.5975764, 0, 0.07058824, 1, 1,
0.382109, 0.8946535, 1.07377, 0, 0.0627451, 1, 1,
0.3821976, 0.7549863, 2.06289, 0, 0.05882353, 1, 1,
0.3864854, 0.08476481, 0.2667759, 0, 0.05098039, 1, 1,
0.3939646, -0.6915944, 2.908899, 0, 0.04705882, 1, 1,
0.3949668, -1.953349, 3.427928, 0, 0.03921569, 1, 1,
0.3965761, 0.04189311, 0.7949581, 0, 0.03529412, 1, 1,
0.3980071, -1.262825, 0.6300278, 0, 0.02745098, 1, 1,
0.3981199, -1.638015, 4.433495, 0, 0.02352941, 1, 1,
0.4031421, -0.4143219, 2.559506, 0, 0.01568628, 1, 1,
0.4103623, -0.6329724, 4.100018, 0, 0.01176471, 1, 1,
0.4118046, 0.3826757, 0.2082334, 0, 0.003921569, 1, 1,
0.4156239, -0.1734758, 2.234488, 0.003921569, 0, 1, 1,
0.4164517, 0.04528538, 0.3163789, 0.007843138, 0, 1, 1,
0.4175082, 1.06413, 1.857447, 0.01568628, 0, 1, 1,
0.4215896, -0.3085302, 4.260086, 0.01960784, 0, 1, 1,
0.4218019, 0.1758742, 1.961772, 0.02745098, 0, 1, 1,
0.4227516, 0.7067075, 0.7498176, 0.03137255, 0, 1, 1,
0.425651, -1.239356, 2.716747, 0.03921569, 0, 1, 1,
0.4259487, -0.3932181, 4.087811, 0.04313726, 0, 1, 1,
0.4260182, -1.186436, 3.276218, 0.05098039, 0, 1, 1,
0.4269284, 0.1356027, 0.668687, 0.05490196, 0, 1, 1,
0.4292194, -1.369509, 2.778941, 0.0627451, 0, 1, 1,
0.4381124, -0.4307684, 2.201537, 0.06666667, 0, 1, 1,
0.4462764, 1.466724, 0.9493459, 0.07450981, 0, 1, 1,
0.4470131, 1.158283, -0.2445189, 0.07843138, 0, 1, 1,
0.448246, 0.248553, 2.016234, 0.08627451, 0, 1, 1,
0.4497948, 0.355026, 0.2378834, 0.09019608, 0, 1, 1,
0.4505302, 1.360208, 0.3962743, 0.09803922, 0, 1, 1,
0.4532241, -0.06005206, 1.198333, 0.1058824, 0, 1, 1,
0.454522, 1.061068, -0.1469622, 0.1098039, 0, 1, 1,
0.4579561, -1.69179, 1.555264, 0.1176471, 0, 1, 1,
0.4585918, 0.1604695, 2.661926, 0.1215686, 0, 1, 1,
0.4600225, 0.5382241, 2.417182, 0.1294118, 0, 1, 1,
0.4629212, 0.2224882, -0.9247139, 0.1333333, 0, 1, 1,
0.463068, 0.2376891, 0.4184525, 0.1411765, 0, 1, 1,
0.465068, -0.4623064, 3.103822, 0.145098, 0, 1, 1,
0.4669979, 0.6597739, -0.3563849, 0.1529412, 0, 1, 1,
0.4796665, 0.5141793, 0.1856187, 0.1568628, 0, 1, 1,
0.4801858, -0.1002426, 0.5464646, 0.1647059, 0, 1, 1,
0.4854059, -0.3253952, 1.600665, 0.1686275, 0, 1, 1,
0.4858156, 0.808787, -0.9366674, 0.1764706, 0, 1, 1,
0.4923616, -0.0857933, 3.619378, 0.1803922, 0, 1, 1,
0.4931959, -0.2336744, 1.881457, 0.1882353, 0, 1, 1,
0.4934072, 0.465802, -1.06918, 0.1921569, 0, 1, 1,
0.5003728, -1.370209, 1.530908, 0.2, 0, 1, 1,
0.5009255, 0.2162498, 0.9673728, 0.2078431, 0, 1, 1,
0.5029801, -0.522659, 1.037901, 0.2117647, 0, 1, 1,
0.5042558, 1.582863, 0.885812, 0.2196078, 0, 1, 1,
0.5054326, -1.335049, 1.671516, 0.2235294, 0, 1, 1,
0.5075341, -0.06706814, 2.350453, 0.2313726, 0, 1, 1,
0.5136907, -0.658945, 4.962233, 0.2352941, 0, 1, 1,
0.5162968, 0.2999012, 2.024502, 0.2431373, 0, 1, 1,
0.5173165, -0.4775812, 2.425413, 0.2470588, 0, 1, 1,
0.5177544, 0.3069173, -0.1375411, 0.254902, 0, 1, 1,
0.5210626, 1.198942, 2.152417, 0.2588235, 0, 1, 1,
0.5224494, 0.4657461, 1.25129, 0.2666667, 0, 1, 1,
0.5238746, -0.4493009, 2.366594, 0.2705882, 0, 1, 1,
0.5327693, -0.1256649, 2.966954, 0.2784314, 0, 1, 1,
0.5358382, -0.251583, 1.74611, 0.282353, 0, 1, 1,
0.5391101, 0.239371, 2.022228, 0.2901961, 0, 1, 1,
0.5394071, -0.8229802, 3.162882, 0.2941177, 0, 1, 1,
0.53978, 0.1229335, 1.029802, 0.3019608, 0, 1, 1,
0.5401726, 0.0979051, -0.7164551, 0.3098039, 0, 1, 1,
0.5480106, -0.4210392, 1.53618, 0.3137255, 0, 1, 1,
0.5498295, 0.1316035, 0.4074119, 0.3215686, 0, 1, 1,
0.5499166, -1.138621, 2.352803, 0.3254902, 0, 1, 1,
0.5515535, 0.07149222, -0.3219792, 0.3333333, 0, 1, 1,
0.5524477, -0.5154034, 0.8498595, 0.3372549, 0, 1, 1,
0.5535972, 1.004459, 1.761969, 0.345098, 0, 1, 1,
0.5537676, -0.6058374, 1.092576, 0.3490196, 0, 1, 1,
0.5540442, 0.6792417, 0.5677651, 0.3568628, 0, 1, 1,
0.5615732, 0.9396784, 1.042161, 0.3607843, 0, 1, 1,
0.5627077, -1.571562, 2.148875, 0.3686275, 0, 1, 1,
0.5641463, 0.1378237, -0.3882852, 0.372549, 0, 1, 1,
0.5661144, -0.2471191, 1.618731, 0.3803922, 0, 1, 1,
0.5664119, -1.029773, 2.736222, 0.3843137, 0, 1, 1,
0.571587, 1.108701, -0.8992357, 0.3921569, 0, 1, 1,
0.5723419, 0.3132263, 0.5747696, 0.3960784, 0, 1, 1,
0.5747079, 1.1896, 0.9808695, 0.4039216, 0, 1, 1,
0.5785447, -1.140652, 1.759276, 0.4117647, 0, 1, 1,
0.5795208, -0.7037115, 4.278212, 0.4156863, 0, 1, 1,
0.5829326, -0.07870941, 0.1614562, 0.4235294, 0, 1, 1,
0.5847695, -0.8970531, 0.9128854, 0.427451, 0, 1, 1,
0.5866223, 0.2641475, 1.532426, 0.4352941, 0, 1, 1,
0.5885039, -0.1691931, 0.2526791, 0.4392157, 0, 1, 1,
0.5905405, -0.03415338, 2.667939, 0.4470588, 0, 1, 1,
0.5930625, -0.4912984, 3.151154, 0.4509804, 0, 1, 1,
0.596313, 0.2681182, 2.301558, 0.4588235, 0, 1, 1,
0.5982547, 1.311532, -0.3732983, 0.4627451, 0, 1, 1,
0.6054876, -0.4183543, 1.129489, 0.4705882, 0, 1, 1,
0.6068228, -0.8268926, 3.301795, 0.4745098, 0, 1, 1,
0.6095834, 0.5818981, 2.849589, 0.4823529, 0, 1, 1,
0.6148483, -0.2012185, 0.3855456, 0.4862745, 0, 1, 1,
0.6168109, -0.1637576, 0.6714016, 0.4941176, 0, 1, 1,
0.6287164, 0.7253394, 1.09931, 0.5019608, 0, 1, 1,
0.6299766, -1.002865, 3.067899, 0.5058824, 0, 1, 1,
0.6307092, -1.871125, 3.094707, 0.5137255, 0, 1, 1,
0.635169, 0.96688, 0.8164015, 0.5176471, 0, 1, 1,
0.6499092, -0.8040211, 4.319327, 0.5254902, 0, 1, 1,
0.6503631, 0.09765138, 3.050831, 0.5294118, 0, 1, 1,
0.6537069, 0.02242806, 2.169815, 0.5372549, 0, 1, 1,
0.6552008, -0.00211201, 1.462295, 0.5411765, 0, 1, 1,
0.6558854, 0.95492, -0.1860626, 0.5490196, 0, 1, 1,
0.6574733, 0.05739164, 1.84586, 0.5529412, 0, 1, 1,
0.6583934, 1.510199, 1.237859, 0.5607843, 0, 1, 1,
0.6649758, -0.7359655, 4.694795, 0.5647059, 0, 1, 1,
0.6663748, -1.05015, 2.828547, 0.572549, 0, 1, 1,
0.6690238, 1.322991, -0.8145689, 0.5764706, 0, 1, 1,
0.6717526, 0.7045692, 1.493354, 0.5843138, 0, 1, 1,
0.6718996, 0.1405681, 0.5189234, 0.5882353, 0, 1, 1,
0.6747752, 0.3478377, 1.714709, 0.5960785, 0, 1, 1,
0.6757073, 1.279364, -0.1449173, 0.6039216, 0, 1, 1,
0.6761699, 0.310364, 0.8956837, 0.6078432, 0, 1, 1,
0.6774207, 1.04939, -0.8677176, 0.6156863, 0, 1, 1,
0.6809388, 0.8263858, 0.2183959, 0.6196079, 0, 1, 1,
0.6823965, -0.9647775, 3.762238, 0.627451, 0, 1, 1,
0.6830875, -0.8972804, 2.45746, 0.6313726, 0, 1, 1,
0.6833495, -1.193436, 1.605469, 0.6392157, 0, 1, 1,
0.6841117, 0.01721228, -0.3861859, 0.6431373, 0, 1, 1,
0.6846072, 0.9278635, 0.3732781, 0.6509804, 0, 1, 1,
0.6885948, -1.134631, 2.887839, 0.654902, 0, 1, 1,
0.690436, 1.822907, 0.9587843, 0.6627451, 0, 1, 1,
0.6910991, 2.527509, -0.01108983, 0.6666667, 0, 1, 1,
0.6955935, -0.4690718, 1.01463, 0.6745098, 0, 1, 1,
0.6970576, -0.8594778, 2.320732, 0.6784314, 0, 1, 1,
0.6976258, 0.548201, 0.8334269, 0.6862745, 0, 1, 1,
0.6980027, 0.3886078, 0.7577797, 0.6901961, 0, 1, 1,
0.6984591, -0.7819219, 4.001891, 0.6980392, 0, 1, 1,
0.7038863, 0.4544222, 2.181776, 0.7058824, 0, 1, 1,
0.724034, -0.9136348, 2.249277, 0.7098039, 0, 1, 1,
0.7246024, -0.4386191, 2.578034, 0.7176471, 0, 1, 1,
0.7301897, 0.9146074, -0.2775153, 0.7215686, 0, 1, 1,
0.7323895, -0.5400023, 2.126018, 0.7294118, 0, 1, 1,
0.7365635, -1.717605, 3.428411, 0.7333333, 0, 1, 1,
0.7404783, -1.583553, 2.296821, 0.7411765, 0, 1, 1,
0.7426538, -0.2715542, 1.377942, 0.7450981, 0, 1, 1,
0.7432381, -0.4286299, 3.003426, 0.7529412, 0, 1, 1,
0.7525257, 0.9656251, 0.5604542, 0.7568628, 0, 1, 1,
0.7597961, -0.780943, 2.415936, 0.7647059, 0, 1, 1,
0.7614616, -1.38632, 3.090993, 0.7686275, 0, 1, 1,
0.7643631, 0.002822369, 2.730679, 0.7764706, 0, 1, 1,
0.7681363, -0.7525803, 2.523366, 0.7803922, 0, 1, 1,
0.7727187, -0.557134, 1.635905, 0.7882353, 0, 1, 1,
0.7730874, 1.775642, 0.865037, 0.7921569, 0, 1, 1,
0.7806645, -1.107715, 4.408551, 0.8, 0, 1, 1,
0.7835584, -0.3080015, 3.114354, 0.8078431, 0, 1, 1,
0.783658, 0.04458184, 1.651306, 0.8117647, 0, 1, 1,
0.7875603, 0.271704, 2.064946, 0.8196079, 0, 1, 1,
0.7907683, -0.05106987, 3.080722, 0.8235294, 0, 1, 1,
0.7964144, 1.313955, -0.9216713, 0.8313726, 0, 1, 1,
0.7975929, -1.147442, 2.024349, 0.8352941, 0, 1, 1,
0.8044266, 0.5647876, 0.2314222, 0.8431373, 0, 1, 1,
0.8077983, 1.069008, -0.3507278, 0.8470588, 0, 1, 1,
0.8098155, -1.687035, 2.66292, 0.854902, 0, 1, 1,
0.8142193, 1.296208, -0.2791, 0.8588235, 0, 1, 1,
0.8142481, 0.9707708, 3.285352, 0.8666667, 0, 1, 1,
0.8151661, 1.715466, -0.1604027, 0.8705882, 0, 1, 1,
0.8158334, -0.1731487, 4.241912, 0.8784314, 0, 1, 1,
0.8188734, 1.096623, -0.3570424, 0.8823529, 0, 1, 1,
0.8194283, 0.9442877, 3.119132, 0.8901961, 0, 1, 1,
0.8287881, 0.0244131, 1.093509, 0.8941177, 0, 1, 1,
0.8341869, 0.09500135, 1.801742, 0.9019608, 0, 1, 1,
0.842977, -0.09732237, 3.185881, 0.9098039, 0, 1, 1,
0.8436075, 1.13584, 0.4502183, 0.9137255, 0, 1, 1,
0.849862, -1.086672, 3.403833, 0.9215686, 0, 1, 1,
0.850268, -0.5768815, 2.192532, 0.9254902, 0, 1, 1,
0.8507884, -0.9441161, 1.649856, 0.9333333, 0, 1, 1,
0.8571243, -1.99266, 2.333913, 0.9372549, 0, 1, 1,
0.8576345, -0.4746552, 1.106669, 0.945098, 0, 1, 1,
0.8613085, 2.341069, -0.3745725, 0.9490196, 0, 1, 1,
0.8628597, -0.3664002, 1.608967, 0.9568627, 0, 1, 1,
0.8656112, -1.843701, 3.731536, 0.9607843, 0, 1, 1,
0.8656878, -2.070409, 2.047609, 0.9686275, 0, 1, 1,
0.8668889, 0.7748957, 0.9013184, 0.972549, 0, 1, 1,
0.8670477, -0.5173833, 1.611727, 0.9803922, 0, 1, 1,
0.8676506, 0.6224757, 0.6220906, 0.9843137, 0, 1, 1,
0.8679847, 0.7551979, 2.319091, 0.9921569, 0, 1, 1,
0.870378, -0.7658977, -0.258155, 0.9960784, 0, 1, 1,
0.8831697, -0.2509505, 1.27862, 1, 0, 0.9960784, 1,
0.8931428, 1.441101, 0.5356146, 1, 0, 0.9882353, 1,
0.8932439, -1.216503, 2.769821, 1, 0, 0.9843137, 1,
0.8941302, -1.997623, 3.240742, 1, 0, 0.9764706, 1,
0.8967541, -0.2042248, 2.317183, 1, 0, 0.972549, 1,
0.9003227, 0.7804946, -1.432093, 1, 0, 0.9647059, 1,
0.9014471, -0.8337182, 1.115281, 1, 0, 0.9607843, 1,
0.9053541, 0.1342872, 2.965631, 1, 0, 0.9529412, 1,
0.9055529, -0.2024069, 0.6090317, 1, 0, 0.9490196, 1,
0.908035, 2.681341, 0.559046, 1, 0, 0.9411765, 1,
0.9106769, 0.6092803, 0.3528023, 1, 0, 0.9372549, 1,
0.9194276, -1.442766, 4.01442, 1, 0, 0.9294118, 1,
0.9256021, -1.257244, 2.234162, 1, 0, 0.9254902, 1,
0.9288892, 0.673339, 1.72417, 1, 0, 0.9176471, 1,
0.9315023, 0.4903851, 0.09350549, 1, 0, 0.9137255, 1,
0.9496531, 0.4472035, 0.6936843, 1, 0, 0.9058824, 1,
0.9499084, 1.33728, -0.4268487, 1, 0, 0.9019608, 1,
0.9513445, 0.4843256, 1.026848, 1, 0, 0.8941177, 1,
0.9518162, -0.9152344, 1.75492, 1, 0, 0.8862745, 1,
0.9547567, 0.1246465, 1.666252, 1, 0, 0.8823529, 1,
0.9593267, -0.4755514, 1.405339, 1, 0, 0.8745098, 1,
0.959593, 0.3247981, 1.640604, 1, 0, 0.8705882, 1,
0.9598311, 1.08322, -1.163283, 1, 0, 0.8627451, 1,
0.9676178, -0.6326651, 1.544528, 1, 0, 0.8588235, 1,
0.9799931, 0.5695537, 2.121782, 1, 0, 0.8509804, 1,
0.9804223, 0.506075, 1.066978, 1, 0, 0.8470588, 1,
0.9883373, -0.4636687, 1.591612, 1, 0, 0.8392157, 1,
0.9967444, -0.330712, 1.956231, 1, 0, 0.8352941, 1,
1.006412, -0.7394266, 2.987623, 1, 0, 0.827451, 1,
1.007681, -1.064896, 1.40514, 1, 0, 0.8235294, 1,
1.014692, 0.328313, -1.161899, 1, 0, 0.8156863, 1,
1.018815, 1.468888, 0.502973, 1, 0, 0.8117647, 1,
1.028231, -0.3841067, 2.507285, 1, 0, 0.8039216, 1,
1.036769, 0.7564587, 0.7900388, 1, 0, 0.7960784, 1,
1.043674, 0.998188, 1.389864, 1, 0, 0.7921569, 1,
1.047507, 1.127366, 0.2107351, 1, 0, 0.7843137, 1,
1.051563, -0.05462898, 0.8077598, 1, 0, 0.7803922, 1,
1.05482, 1.686111, 2.008571, 1, 0, 0.772549, 1,
1.063673, 0.1718131, -0.8547967, 1, 0, 0.7686275, 1,
1.065968, -0.2536964, 1.688216, 1, 0, 0.7607843, 1,
1.072271, -1.292003, 2.832348, 1, 0, 0.7568628, 1,
1.076245, 0.6234201, -1.025734, 1, 0, 0.7490196, 1,
1.080528, 0.03890211, 1.816815, 1, 0, 0.7450981, 1,
1.087854, 0.5415948, 0.007409799, 1, 0, 0.7372549, 1,
1.101517, -0.4871212, 1.186117, 1, 0, 0.7333333, 1,
1.105401, 1.184309, 2.53184, 1, 0, 0.7254902, 1,
1.10839, -0.5627489, 1.81257, 1, 0, 0.7215686, 1,
1.126902, -0.7376942, 3.146741, 1, 0, 0.7137255, 1,
1.134886, -0.2733872, -0.4519546, 1, 0, 0.7098039, 1,
1.161028, 1.164933, 0.6142298, 1, 0, 0.7019608, 1,
1.164623, 1.908774, 1.103261, 1, 0, 0.6941177, 1,
1.168085, 0.5425766, 0.3818528, 1, 0, 0.6901961, 1,
1.170789, -1.082319, 1.378205, 1, 0, 0.682353, 1,
1.17194, -0.2380661, 0.1588619, 1, 0, 0.6784314, 1,
1.172148, -0.4189974, 2.460104, 1, 0, 0.6705883, 1,
1.174988, -0.2109169, 1.751197, 1, 0, 0.6666667, 1,
1.191038, -1.423656, 3.909623, 1, 0, 0.6588235, 1,
1.192127, 2.000086, 1.749292, 1, 0, 0.654902, 1,
1.196941, -0.8864048, 1.559236, 1, 0, 0.6470588, 1,
1.198895, -0.6378, 1.40108, 1, 0, 0.6431373, 1,
1.205307, 0.5462528, 1.83532, 1, 0, 0.6352941, 1,
1.208084, 0.4027465, 0.5516765, 1, 0, 0.6313726, 1,
1.214996, 0.3353624, 0.4457302, 1, 0, 0.6235294, 1,
1.215168, -0.6240812, 1.903337, 1, 0, 0.6196079, 1,
1.222843, -0.4692468, 2.259498, 1, 0, 0.6117647, 1,
1.223292, 0.3001828, 0.5517098, 1, 0, 0.6078432, 1,
1.234708, -0.09833841, 2.666896, 1, 0, 0.6, 1,
1.236432, -2.01492, 3.907726, 1, 0, 0.5921569, 1,
1.239534, -0.9194311, 1.754536, 1, 0, 0.5882353, 1,
1.246941, 1.127118, 1.678008, 1, 0, 0.5803922, 1,
1.24867, 1.214886, -1.780964, 1, 0, 0.5764706, 1,
1.249564, -0.004337084, 1.093401, 1, 0, 0.5686275, 1,
1.256534, 0.8910756, 1.071527, 1, 0, 0.5647059, 1,
1.264372, -1.860894, 4.060995, 1, 0, 0.5568628, 1,
1.272847, -0.1430987, 2.744244, 1, 0, 0.5529412, 1,
1.273578, 0.1027271, 2.336026, 1, 0, 0.5450981, 1,
1.279277, 0.3401597, 1.961803, 1, 0, 0.5411765, 1,
1.294145, -1.050211, 2.905643, 1, 0, 0.5333334, 1,
1.295879, 0.4595512, 1.416773, 1, 0, 0.5294118, 1,
1.29952, 0.03066188, 2.019492, 1, 0, 0.5215687, 1,
1.312067, -0.8745878, 2.798497, 1, 0, 0.5176471, 1,
1.31725, 1.141958, 0.06600517, 1, 0, 0.509804, 1,
1.317394, -0.9073824, 2.615133, 1, 0, 0.5058824, 1,
1.329431, 0.1162257, 1.34637, 1, 0, 0.4980392, 1,
1.331781, 0.1746242, 1.04538, 1, 0, 0.4901961, 1,
1.348253, 0.1197299, 2.408612, 1, 0, 0.4862745, 1,
1.349526, 0.07490862, 1.546291, 1, 0, 0.4784314, 1,
1.350757, -0.6557535, 0.8517587, 1, 0, 0.4745098, 1,
1.376435, 1.106672, 0.6717251, 1, 0, 0.4666667, 1,
1.387021, 0.15172, 2.734761, 1, 0, 0.4627451, 1,
1.396359, -0.2235469, 3.2902, 1, 0, 0.454902, 1,
1.399051, 1.808797, 2.314495, 1, 0, 0.4509804, 1,
1.399144, 0.9758046, 1.359783, 1, 0, 0.4431373, 1,
1.410948, -0.4290274, 2.400379, 1, 0, 0.4392157, 1,
1.415289, 0.6628472, 0.4788372, 1, 0, 0.4313726, 1,
1.427158, 0.1227494, 1.214102, 1, 0, 0.427451, 1,
1.431256, 0.6809238, 1.654562, 1, 0, 0.4196078, 1,
1.43805, -0.6974573, 1.030255, 1, 0, 0.4156863, 1,
1.438891, 0.2344108, 0.3623189, 1, 0, 0.4078431, 1,
1.443217, -1.619743, 1.348662, 1, 0, 0.4039216, 1,
1.446304, -0.4765582, 2.364012, 1, 0, 0.3960784, 1,
1.456247, -0.01259267, 2.365058, 1, 0, 0.3882353, 1,
1.456455, -1.12892, 1.982117, 1, 0, 0.3843137, 1,
1.456961, 1.636698, -1.495923, 1, 0, 0.3764706, 1,
1.460771, 0.9928759, 1.099628, 1, 0, 0.372549, 1,
1.473636, -1.258264, 2.352958, 1, 0, 0.3647059, 1,
1.48856, 0.5898388, 0.7825041, 1, 0, 0.3607843, 1,
1.50569, -0.1401355, 1.529237, 1, 0, 0.3529412, 1,
1.521536, -0.5784855, 1.880385, 1, 0, 0.3490196, 1,
1.528819, -2.03875, 3.211699, 1, 0, 0.3411765, 1,
1.544051, -0.4061446, 1.065371, 1, 0, 0.3372549, 1,
1.546744, 1.005296, 2.47229, 1, 0, 0.3294118, 1,
1.560416, -1.117452, 1.124041, 1, 0, 0.3254902, 1,
1.560739, -1.707889, 2.009313, 1, 0, 0.3176471, 1,
1.564981, 1.989006, 2.491251, 1, 0, 0.3137255, 1,
1.567221, -0.8489363, 2.717665, 1, 0, 0.3058824, 1,
1.573302, -0.8865213, 0.6774126, 1, 0, 0.2980392, 1,
1.577511, 0.1821745, 2.093726, 1, 0, 0.2941177, 1,
1.580092, 0.9486775, -0.7972083, 1, 0, 0.2862745, 1,
1.585645, 0.3748267, 0.6402883, 1, 0, 0.282353, 1,
1.586671, -1.163847, 4.261037, 1, 0, 0.2745098, 1,
1.588688, -1.228863, 2.171154, 1, 0, 0.2705882, 1,
1.612991, -2.048833, 2.414834, 1, 0, 0.2627451, 1,
1.62468, 0.4972278, 1.175515, 1, 0, 0.2588235, 1,
1.633691, 0.2136642, 2.686218, 1, 0, 0.2509804, 1,
1.644582, -0.0896217, 0.9657791, 1, 0, 0.2470588, 1,
1.654798, 1.20226, -0.3001637, 1, 0, 0.2392157, 1,
1.654815, -1.097905, 2.32078, 1, 0, 0.2352941, 1,
1.661469, 0.6344441, -0.7628623, 1, 0, 0.227451, 1,
1.666795, 0.5160167, 2.251835, 1, 0, 0.2235294, 1,
1.669407, 0.00277282, -0.8123906, 1, 0, 0.2156863, 1,
1.684283, -0.5646628, 2.2433, 1, 0, 0.2117647, 1,
1.688801, 0.3793104, 0.3963267, 1, 0, 0.2039216, 1,
1.695711, -0.1236261, 2.855445, 1, 0, 0.1960784, 1,
1.702648, 0.1907767, 1.889504, 1, 0, 0.1921569, 1,
1.720277, 0.8754972, -0.4439676, 1, 0, 0.1843137, 1,
1.739698, 1.021272, 1.915541, 1, 0, 0.1803922, 1,
1.743546, 0.4598584, 0.9236857, 1, 0, 0.172549, 1,
1.775693, -0.06329065, 0.7036868, 1, 0, 0.1686275, 1,
1.834854, 0.7212417, 0.8969849, 1, 0, 0.1607843, 1,
1.846097, -1.149238, 2.301237, 1, 0, 0.1568628, 1,
1.850947, 2.505323, -1.15805, 1, 0, 0.1490196, 1,
1.858988, -0.8342351, 1.102375, 1, 0, 0.145098, 1,
1.859627, -2.036013, 2.630117, 1, 0, 0.1372549, 1,
1.873328, -0.4597833, 1.092322, 1, 0, 0.1333333, 1,
1.876195, 0.6950622, 1.529014, 1, 0, 0.1254902, 1,
1.893645, 0.603303, 2.562759, 1, 0, 0.1215686, 1,
1.923173, -0.007316555, 2.97661, 1, 0, 0.1137255, 1,
1.932447, 0.05838037, 1.700873, 1, 0, 0.1098039, 1,
1.985582, 0.6470792, 2.878521, 1, 0, 0.1019608, 1,
1.992876, -2.27053, 4.434155, 1, 0, 0.09411765, 1,
2.005041, -0.5138136, 4.118868, 1, 0, 0.09019608, 1,
2.006183, -0.4113282, 3.458266, 1, 0, 0.08235294, 1,
2.035653, 1.679958, 2.371947, 1, 0, 0.07843138, 1,
2.047997, 1.284482, 0.7636101, 1, 0, 0.07058824, 1,
2.050804, -0.9011182, -0.3259214, 1, 0, 0.06666667, 1,
2.105625, -0.561218, 1.146257, 1, 0, 0.05882353, 1,
2.110334, -1.274151, 1.935211, 1, 0, 0.05490196, 1,
2.240622, -2.201128, 1.500501, 1, 0, 0.04705882, 1,
2.26832, 1.329156, 0.2532633, 1, 0, 0.04313726, 1,
2.356115, 0.1869307, 1.107627, 1, 0, 0.03529412, 1,
2.455678, -0.3285088, 0.7336827, 1, 0, 0.03137255, 1,
2.575014, -0.2767072, 2.114153, 1, 0, 0.02352941, 1,
2.64085, -0.6353466, 3.294025, 1, 0, 0.01960784, 1,
2.726525, -0.06436346, 2.183216, 1, 0, 0.01176471, 1,
3.595168, 2.055544, 0.4328734, 1, 0, 0.007843138, 1
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
0.2429987, -4.878326, -7.005035, 0, -0.5, 0.5, 0.5,
0.2429987, -4.878326, -7.005035, 1, -0.5, 0.5, 0.5,
0.2429987, -4.878326, -7.005035, 1, 1.5, 0.5, 0.5,
0.2429987, -4.878326, -7.005035, 0, 1.5, 0.5, 0.5
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
-4.245555, -0.5506673, -7.005035, 0, -0.5, 0.5, 0.5,
-4.245555, -0.5506673, -7.005035, 1, -0.5, 0.5, 0.5,
-4.245555, -0.5506673, -7.005035, 1, 1.5, 0.5, 0.5,
-4.245555, -0.5506673, -7.005035, 0, 1.5, 0.5, 0.5
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
-4.245555, -4.878326, -0.1541705, 0, -0.5, 0.5, 0.5,
-4.245555, -4.878326, -0.1541705, 1, -0.5, 0.5, 0.5,
-4.245555, -4.878326, -0.1541705, 1, 1.5, 0.5, 0.5,
-4.245555, -4.878326, -0.1541705, 0, 1.5, 0.5, 0.5
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
-3, -3.879636, -5.424066,
3, -3.879636, -5.424066,
-3, -3.879636, -5.424066,
-3, -4.046084, -5.687561,
-2, -3.879636, -5.424066,
-2, -4.046084, -5.687561,
-1, -3.879636, -5.424066,
-1, -4.046084, -5.687561,
0, -3.879636, -5.424066,
0, -4.046084, -5.687561,
1, -3.879636, -5.424066,
1, -4.046084, -5.687561,
2, -3.879636, -5.424066,
2, -4.046084, -5.687561,
3, -3.879636, -5.424066,
3, -4.046084, -5.687561
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
-3, -4.378981, -6.21455, 0, -0.5, 0.5, 0.5,
-3, -4.378981, -6.21455, 1, -0.5, 0.5, 0.5,
-3, -4.378981, -6.21455, 1, 1.5, 0.5, 0.5,
-3, -4.378981, -6.21455, 0, 1.5, 0.5, 0.5,
-2, -4.378981, -6.21455, 0, -0.5, 0.5, 0.5,
-2, -4.378981, -6.21455, 1, -0.5, 0.5, 0.5,
-2, -4.378981, -6.21455, 1, 1.5, 0.5, 0.5,
-2, -4.378981, -6.21455, 0, 1.5, 0.5, 0.5,
-1, -4.378981, -6.21455, 0, -0.5, 0.5, 0.5,
-1, -4.378981, -6.21455, 1, -0.5, 0.5, 0.5,
-1, -4.378981, -6.21455, 1, 1.5, 0.5, 0.5,
-1, -4.378981, -6.21455, 0, 1.5, 0.5, 0.5,
0, -4.378981, -6.21455, 0, -0.5, 0.5, 0.5,
0, -4.378981, -6.21455, 1, -0.5, 0.5, 0.5,
0, -4.378981, -6.21455, 1, 1.5, 0.5, 0.5,
0, -4.378981, -6.21455, 0, 1.5, 0.5, 0.5,
1, -4.378981, -6.21455, 0, -0.5, 0.5, 0.5,
1, -4.378981, -6.21455, 1, -0.5, 0.5, 0.5,
1, -4.378981, -6.21455, 1, 1.5, 0.5, 0.5,
1, -4.378981, -6.21455, 0, 1.5, 0.5, 0.5,
2, -4.378981, -6.21455, 0, -0.5, 0.5, 0.5,
2, -4.378981, -6.21455, 1, -0.5, 0.5, 0.5,
2, -4.378981, -6.21455, 1, 1.5, 0.5, 0.5,
2, -4.378981, -6.21455, 0, 1.5, 0.5, 0.5,
3, -4.378981, -6.21455, 0, -0.5, 0.5, 0.5,
3, -4.378981, -6.21455, 1, -0.5, 0.5, 0.5,
3, -4.378981, -6.21455, 1, 1.5, 0.5, 0.5,
3, -4.378981, -6.21455, 0, 1.5, 0.5, 0.5
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
-3.209735, -3, -5.424066,
-3.209735, 2, -5.424066,
-3.209735, -3, -5.424066,
-3.382372, -3, -5.687561,
-3.209735, -2, -5.424066,
-3.382372, -2, -5.687561,
-3.209735, -1, -5.424066,
-3.382372, -1, -5.687561,
-3.209735, 0, -5.424066,
-3.382372, 0, -5.687561,
-3.209735, 1, -5.424066,
-3.382372, 1, -5.687561,
-3.209735, 2, -5.424066,
-3.382372, 2, -5.687561
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
-3.727645, -3, -6.21455, 0, -0.5, 0.5, 0.5,
-3.727645, -3, -6.21455, 1, -0.5, 0.5, 0.5,
-3.727645, -3, -6.21455, 1, 1.5, 0.5, 0.5,
-3.727645, -3, -6.21455, 0, 1.5, 0.5, 0.5,
-3.727645, -2, -6.21455, 0, -0.5, 0.5, 0.5,
-3.727645, -2, -6.21455, 1, -0.5, 0.5, 0.5,
-3.727645, -2, -6.21455, 1, 1.5, 0.5, 0.5,
-3.727645, -2, -6.21455, 0, 1.5, 0.5, 0.5,
-3.727645, -1, -6.21455, 0, -0.5, 0.5, 0.5,
-3.727645, -1, -6.21455, 1, -0.5, 0.5, 0.5,
-3.727645, -1, -6.21455, 1, 1.5, 0.5, 0.5,
-3.727645, -1, -6.21455, 0, 1.5, 0.5, 0.5,
-3.727645, 0, -6.21455, 0, -0.5, 0.5, 0.5,
-3.727645, 0, -6.21455, 1, -0.5, 0.5, 0.5,
-3.727645, 0, -6.21455, 1, 1.5, 0.5, 0.5,
-3.727645, 0, -6.21455, 0, 1.5, 0.5, 0.5,
-3.727645, 1, -6.21455, 0, -0.5, 0.5, 0.5,
-3.727645, 1, -6.21455, 1, -0.5, 0.5, 0.5,
-3.727645, 1, -6.21455, 1, 1.5, 0.5, 0.5,
-3.727645, 1, -6.21455, 0, 1.5, 0.5, 0.5,
-3.727645, 2, -6.21455, 0, -0.5, 0.5, 0.5,
-3.727645, 2, -6.21455, 1, -0.5, 0.5, 0.5,
-3.727645, 2, -6.21455, 1, 1.5, 0.5, 0.5,
-3.727645, 2, -6.21455, 0, 1.5, 0.5, 0.5
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
-3.209735, -3.879636, -4,
-3.209735, -3.879636, 4,
-3.209735, -3.879636, -4,
-3.382372, -4.046084, -4,
-3.209735, -3.879636, -2,
-3.382372, -4.046084, -2,
-3.209735, -3.879636, 0,
-3.382372, -4.046084, 0,
-3.209735, -3.879636, 2,
-3.382372, -4.046084, 2,
-3.209735, -3.879636, 4,
-3.382372, -4.046084, 4
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
-3.727645, -4.378981, -4, 0, -0.5, 0.5, 0.5,
-3.727645, -4.378981, -4, 1, -0.5, 0.5, 0.5,
-3.727645, -4.378981, -4, 1, 1.5, 0.5, 0.5,
-3.727645, -4.378981, -4, 0, 1.5, 0.5, 0.5,
-3.727645, -4.378981, -2, 0, -0.5, 0.5, 0.5,
-3.727645, -4.378981, -2, 1, -0.5, 0.5, 0.5,
-3.727645, -4.378981, -2, 1, 1.5, 0.5, 0.5,
-3.727645, -4.378981, -2, 0, 1.5, 0.5, 0.5,
-3.727645, -4.378981, 0, 0, -0.5, 0.5, 0.5,
-3.727645, -4.378981, 0, 1, -0.5, 0.5, 0.5,
-3.727645, -4.378981, 0, 1, 1.5, 0.5, 0.5,
-3.727645, -4.378981, 0, 0, 1.5, 0.5, 0.5,
-3.727645, -4.378981, 2, 0, -0.5, 0.5, 0.5,
-3.727645, -4.378981, 2, 1, -0.5, 0.5, 0.5,
-3.727645, -4.378981, 2, 1, 1.5, 0.5, 0.5,
-3.727645, -4.378981, 2, 0, 1.5, 0.5, 0.5,
-3.727645, -4.378981, 4, 0, -0.5, 0.5, 0.5,
-3.727645, -4.378981, 4, 1, -0.5, 0.5, 0.5,
-3.727645, -4.378981, 4, 1, 1.5, 0.5, 0.5,
-3.727645, -4.378981, 4, 0, 1.5, 0.5, 0.5
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
-3.209735, -3.879636, -5.424066,
-3.209735, 2.778301, -5.424066,
-3.209735, -3.879636, 5.115725,
-3.209735, 2.778301, 5.115725,
-3.209735, -3.879636, -5.424066,
-3.209735, -3.879636, 5.115725,
-3.209735, 2.778301, -5.424066,
-3.209735, 2.778301, 5.115725,
-3.209735, -3.879636, -5.424066,
3.695733, -3.879636, -5.424066,
-3.209735, -3.879636, 5.115725,
3.695733, -3.879636, 5.115725,
-3.209735, 2.778301, -5.424066,
3.695733, 2.778301, -5.424066,
-3.209735, 2.778301, 5.115725,
3.695733, 2.778301, 5.115725,
3.695733, -3.879636, -5.424066,
3.695733, 2.778301, -5.424066,
3.695733, -3.879636, 5.115725,
3.695733, 2.778301, 5.115725,
3.695733, -3.879636, -5.424066,
3.695733, -3.879636, 5.115725,
3.695733, 2.778301, -5.424066,
3.695733, 2.778301, 5.115725
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
var radius = 7.609941;
var distance = 33.85749;
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
mvMatrix.translate( -0.2429987, 0.5506673, 0.1541705 );
mvMatrix.scale( 1.191522, 1.235821, 0.7806623 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.85749);
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
Camphene<-read.table("Camphene.xyz")
```

```
## Error in read.table("Camphene.xyz"): no lines available in input
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
-3.10917, -1.200661, -2.448298, 0, 0, 1, 1, 1,
-3.096225, 1.981713, -1.319151, 1, 0, 0, 1, 1,
-3.082848, -1.237584, -1.14373, 1, 0, 0, 1, 1,
-2.539814, -1.382383, -2.491076, 1, 0, 0, 1, 1,
-2.431253, -1.47362, -0.3678065, 1, 0, 0, 1, 1,
-2.413399, 0.2033585, -2.825937, 1, 0, 0, 1, 1,
-2.368102, -0.1558072, -2.82382, 0, 0, 0, 1, 1,
-2.35517, 0.6313907, -2.358307, 0, 0, 0, 1, 1,
-2.33408, -0.3652279, -1.425614, 0, 0, 0, 1, 1,
-2.286702, 1.866112, -0.07770131, 0, 0, 0, 1, 1,
-2.286361, -0.6494588, -0.9006717, 0, 0, 0, 1, 1,
-2.244472, -1.213535, -3.023602, 0, 0, 0, 1, 1,
-2.236519, 0.06328373, -2.217402, 0, 0, 0, 1, 1,
-2.223159, 0.4041974, -2.185619, 1, 1, 1, 1, 1,
-2.198387, -0.06445519, -2.120378, 1, 1, 1, 1, 1,
-2.176853, 1.513135, -1.662825, 1, 1, 1, 1, 1,
-2.174846, 0.5036517, -3.244508, 1, 1, 1, 1, 1,
-2.111544, 0.1071967, -2.390632, 1, 1, 1, 1, 1,
-2.088849, 0.6178142, -1.896558, 1, 1, 1, 1, 1,
-2.060116, -0.2503135, -0.7322765, 1, 1, 1, 1, 1,
-2.048171, 0.7067761, -1.326752, 1, 1, 1, 1, 1,
-2.011026, -0.3429825, -1.669248, 1, 1, 1, 1, 1,
-2.00328, -0.2761838, -0.2795307, 1, 1, 1, 1, 1,
-1.987583, -0.04451106, -2.099723, 1, 1, 1, 1, 1,
-1.974348, 0.7693894, -0.2376304, 1, 1, 1, 1, 1,
-1.971972, 0.001899477, -0.6688824, 1, 1, 1, 1, 1,
-1.969066, -0.2085671, -0.9157305, 1, 1, 1, 1, 1,
-1.961753, -0.7116745, -1.879115, 1, 1, 1, 1, 1,
-1.893887, 1.272972, -0.7926349, 0, 0, 1, 1, 1,
-1.873118, -0.614221, -2.075781, 1, 0, 0, 1, 1,
-1.870839, -1.186604, -1.431404, 1, 0, 0, 1, 1,
-1.865863, 0.1684501, -1.317044, 1, 0, 0, 1, 1,
-1.842013, -0.3693672, -2.631797, 1, 0, 0, 1, 1,
-1.821789, 1.45576, 0.4527537, 1, 0, 0, 1, 1,
-1.815333, -0.0738919, -1.072263, 0, 0, 0, 1, 1,
-1.804036, -0.07903013, -0.4773529, 0, 0, 0, 1, 1,
-1.802895, 0.2966505, -0.3473798, 0, 0, 0, 1, 1,
-1.786543, -1.715461, -1.308591, 0, 0, 0, 1, 1,
-1.747803, 1.614285, 0.06319138, 0, 0, 0, 1, 1,
-1.73706, -0.5688686, -1.787234, 0, 0, 0, 1, 1,
-1.730127, 0.6121013, -0.8964794, 0, 0, 0, 1, 1,
-1.715403, 0.6142398, -0.6257771, 1, 1, 1, 1, 1,
-1.715225, -0.769136, -2.243382, 1, 1, 1, 1, 1,
-1.696476, -1.168013, -2.647187, 1, 1, 1, 1, 1,
-1.682238, 0.2272248, -3.101181, 1, 1, 1, 1, 1,
-1.656586, 0.1074365, -2.307308, 1, 1, 1, 1, 1,
-1.655769, -0.9676093, -1.577651, 1, 1, 1, 1, 1,
-1.653012, 0.813835, -1.205652, 1, 1, 1, 1, 1,
-1.647653, -1.320837, -3.352412, 1, 1, 1, 1, 1,
-1.632271, -0.2191497, -1.514126, 1, 1, 1, 1, 1,
-1.631745, 0.3375088, -1.002765, 1, 1, 1, 1, 1,
-1.627892, -1.019473, -2.647381, 1, 1, 1, 1, 1,
-1.621615, 1.205721, -1.545848, 1, 1, 1, 1, 1,
-1.591747, 0.3235453, -1.973062, 1, 1, 1, 1, 1,
-1.589315, 0.8446094, -1.199861, 1, 1, 1, 1, 1,
-1.58154, 2.370684, -0.6181692, 1, 1, 1, 1, 1,
-1.577996, -1.111816, -2.702983, 0, 0, 1, 1, 1,
-1.548915, -2.900794, -1.615213, 1, 0, 0, 1, 1,
-1.547777, 0.7842494, -2.62999, 1, 0, 0, 1, 1,
-1.544023, 0.5314335, -2.865971, 1, 0, 0, 1, 1,
-1.541636, -1.035823, -1.514758, 1, 0, 0, 1, 1,
-1.52697, -0.9591373, -2.740213, 1, 0, 0, 1, 1,
-1.523809, -1.296823, -2.030609, 0, 0, 0, 1, 1,
-1.523235, 0.5691673, -1.681788, 0, 0, 0, 1, 1,
-1.521457, -0.9457366, -1.442922, 0, 0, 0, 1, 1,
-1.507068, -1.346422, -3.00892, 0, 0, 0, 1, 1,
-1.496905, 0.343311, 0.9467282, 0, 0, 0, 1, 1,
-1.496293, 0.3053215, -0.975758, 0, 0, 0, 1, 1,
-1.48466, 1.478095, -2.513973, 0, 0, 0, 1, 1,
-1.476911, -0.6718487, -2.680526, 1, 1, 1, 1, 1,
-1.464445, 0.4617142, -0.2587409, 1, 1, 1, 1, 1,
-1.453764, 0.4917485, -0.907479, 1, 1, 1, 1, 1,
-1.44852, -0.4046924, -1.029523, 1, 1, 1, 1, 1,
-1.447701, -1.44052, -0.8744395, 1, 1, 1, 1, 1,
-1.444293, -1.202621, -1.645609, 1, 1, 1, 1, 1,
-1.442207, 1.219499, -1.60955, 1, 1, 1, 1, 1,
-1.437904, -0.9593138, -2.394104, 1, 1, 1, 1, 1,
-1.430445, 0.9188062, -0.4179535, 1, 1, 1, 1, 1,
-1.429573, 1.937735, -0.6885453, 1, 1, 1, 1, 1,
-1.418475, -0.9530697, 0.6158468, 1, 1, 1, 1, 1,
-1.415617, -1.53063, -2.508759, 1, 1, 1, 1, 1,
-1.398162, -0.03153873, -0.752129, 1, 1, 1, 1, 1,
-1.37775, -0.05206323, -2.068437, 1, 1, 1, 1, 1,
-1.366718, -3.168277, -2.35794, 1, 1, 1, 1, 1,
-1.356211, -0.5776893, -0.9466366, 0, 0, 1, 1, 1,
-1.354041, 0.6368768, 0.9876581, 1, 0, 0, 1, 1,
-1.350893, -0.8116972, -2.338258, 1, 0, 0, 1, 1,
-1.350685, 1.151864, 0.352869, 1, 0, 0, 1, 1,
-1.346853, 0.8073732, -1.605882, 1, 0, 0, 1, 1,
-1.343389, 1.636642, -0.5234655, 1, 0, 0, 1, 1,
-1.324175, -1.077567, -1.697724, 0, 0, 0, 1, 1,
-1.321233, 0.1043632, -0.5010424, 0, 0, 0, 1, 1,
-1.319833, -0.276246, -2.343647, 0, 0, 0, 1, 1,
-1.306821, 0.2251351, -2.922221, 0, 0, 0, 1, 1,
-1.306613, -0.7719624, -1.786248, 0, 0, 0, 1, 1,
-1.305298, -0.06941412, -1.078158, 0, 0, 0, 1, 1,
-1.298428, -0.3565308, -1.608523, 0, 0, 0, 1, 1,
-1.296094, -0.7962302, -2.71858, 1, 1, 1, 1, 1,
-1.295118, -0.5840092, -1.617888, 1, 1, 1, 1, 1,
-1.294398, -2.845479, -1.388023, 1, 1, 1, 1, 1,
-1.292785, -0.6377037, -1.816402, 1, 1, 1, 1, 1,
-1.285813, -0.8126904, -2.412437, 1, 1, 1, 1, 1,
-1.279943, 0.8770368, -1.387572, 1, 1, 1, 1, 1,
-1.2795, 1.03009, -2.342522, 1, 1, 1, 1, 1,
-1.273571, 0.5405221, -0.9555365, 1, 1, 1, 1, 1,
-1.272024, -0.1946526, -1.899303, 1, 1, 1, 1, 1,
-1.271621, -0.06854746, -2.532735, 1, 1, 1, 1, 1,
-1.269828, -1.176997, -1.793827, 1, 1, 1, 1, 1,
-1.265218, -2.160784, -1.41346, 1, 1, 1, 1, 1,
-1.261692, -1.75372, -3.765889, 1, 1, 1, 1, 1,
-1.244921, 0.3572641, 0.6979117, 1, 1, 1, 1, 1,
-1.243546, 0.9109226, -0.05024453, 1, 1, 1, 1, 1,
-1.236602, 0.4542487, -2.104219, 0, 0, 1, 1, 1,
-1.229809, 0.1222259, -1.310292, 1, 0, 0, 1, 1,
-1.22634, -1.174236, -3.172175, 1, 0, 0, 1, 1,
-1.222378, 0.8443825, 0.7183946, 1, 0, 0, 1, 1,
-1.221896, -0.1331129, 0.0101966, 1, 0, 0, 1, 1,
-1.221821, 1.200043, -0.1547454, 1, 0, 0, 1, 1,
-1.218689, 0.7500311, -0.6438612, 0, 0, 0, 1, 1,
-1.211776, 1.4883, 0.9291475, 0, 0, 0, 1, 1,
-1.209488, -0.1409673, -0.6435158, 0, 0, 0, 1, 1,
-1.20135, -0.5148667, -2.871289, 0, 0, 0, 1, 1,
-1.197139, 0.9456126, -1.238592, 0, 0, 0, 1, 1,
-1.190717, -0.5103162, -1.786219, 0, 0, 0, 1, 1,
-1.189419, 0.1028447, -1.048337, 0, 0, 0, 1, 1,
-1.176368, -0.7907034, -1.509318, 1, 1, 1, 1, 1,
-1.170079, -0.1991312, -0.7116805, 1, 1, 1, 1, 1,
-1.166347, 1.079833, 0.5396003, 1, 1, 1, 1, 1,
-1.165045, -0.4206921, -0.9401258, 1, 1, 1, 1, 1,
-1.164136, -1.508755, -1.802543, 1, 1, 1, 1, 1,
-1.159013, 0.4570539, -1.395945, 1, 1, 1, 1, 1,
-1.148287, -0.1222021, 0.02839966, 1, 1, 1, 1, 1,
-1.148108, -0.02648173, -1.22272, 1, 1, 1, 1, 1,
-1.137597, 0.9198042, -1.700776, 1, 1, 1, 1, 1,
-1.137589, -0.8489363, -4.111885, 1, 1, 1, 1, 1,
-1.132126, 1.537383, -0.09130184, 1, 1, 1, 1, 1,
-1.123523, 0.5065376, -2.354004, 1, 1, 1, 1, 1,
-1.122891, -0.3835685, -2.671159, 1, 1, 1, 1, 1,
-1.122724, -0.06851703, -2.391392, 1, 1, 1, 1, 1,
-1.122661, 0.000754675, -0.1551344, 1, 1, 1, 1, 1,
-1.119732, -0.7876262, -2.929316, 0, 0, 1, 1, 1,
-1.116376, 0.07321095, -1.252841, 1, 0, 0, 1, 1,
-1.114577, -0.5977694, -3.54313, 1, 0, 0, 1, 1,
-1.111665, -0.9654475, -1.578675, 1, 0, 0, 1, 1,
-1.111306, 0.09777539, 0.4721271, 1, 0, 0, 1, 1,
-1.104712, -1.307355, -3.334219, 1, 0, 0, 1, 1,
-1.104302, -1.378656, -2.53804, 0, 0, 0, 1, 1,
-1.102878, -1.007506, -3.269614, 0, 0, 0, 1, 1,
-1.101747, 1.553897, 0.04468704, 0, 0, 0, 1, 1,
-1.095883, -0.9683688, -1.780919, 0, 0, 0, 1, 1,
-1.09579, -0.2953812, -0.763169, 0, 0, 0, 1, 1,
-1.09137, -1.073913, -0.8768958, 0, 0, 0, 1, 1,
-1.087274, -1.016466, -2.233609, 0, 0, 0, 1, 1,
-1.077187, -0.8811721, -3.220376, 1, 1, 1, 1, 1,
-1.07082, -0.791508, -0.1011743, 1, 1, 1, 1, 1,
-1.069655, 0.1225465, -0.09673259, 1, 1, 1, 1, 1,
-1.066346, 0.8936756, -1.882889, 1, 1, 1, 1, 1,
-1.05953, -1.467021, -2.769324, 1, 1, 1, 1, 1,
-1.051849, -3.782676, -2.919229, 1, 1, 1, 1, 1,
-1.04737, 0.5332307, -1.210732, 1, 1, 1, 1, 1,
-1.030009, -1.033104, -2.014078, 1, 1, 1, 1, 1,
-1.027923, -0.8650718, -0.1030631, 1, 1, 1, 1, 1,
-1.019496, 0.889318, 0.3368072, 1, 1, 1, 1, 1,
-1.015687, 1.648882, -1.426196, 1, 1, 1, 1, 1,
-1.014005, 0.8110109, -1.341083, 1, 1, 1, 1, 1,
-1.013446, 0.38266, -0.6494484, 1, 1, 1, 1, 1,
-1.004501, -1.281452, -2.701914, 1, 1, 1, 1, 1,
-1.000152, -0.7241132, -1.020801, 1, 1, 1, 1, 1,
-0.9991626, -0.8698063, -0.6743943, 0, 0, 1, 1, 1,
-0.9988203, 0.5268093, 0.4728567, 1, 0, 0, 1, 1,
-0.9918872, -3.00211, -1.81241, 1, 0, 0, 1, 1,
-0.990455, 0.004236239, -1.637397, 1, 0, 0, 1, 1,
-0.9852365, -0.7790176, -3.341733, 1, 0, 0, 1, 1,
-0.9741923, 0.454731, 1.33444, 1, 0, 0, 1, 1,
-0.9729003, -1.062029, -2.472701, 0, 0, 0, 1, 1,
-0.9708701, 0.5931276, -0.5667098, 0, 0, 0, 1, 1,
-0.959987, -1.255928, -3.902416, 0, 0, 0, 1, 1,
-0.9598079, 0.9038303, -1.150287, 0, 0, 0, 1, 1,
-0.9446266, -0.9475148, -2.20474, 0, 0, 0, 1, 1,
-0.9291772, -0.1256048, -1.206472, 0, 0, 0, 1, 1,
-0.923519, 0.6624069, 0.125726, 0, 0, 0, 1, 1,
-0.9180475, -1.975304, -1.755127, 1, 1, 1, 1, 1,
-0.916044, 0.7444451, -1.28483, 1, 1, 1, 1, 1,
-0.9116417, -0.6656885, -1.6971, 1, 1, 1, 1, 1,
-0.9100758, -2.549471, -1.159373, 1, 1, 1, 1, 1,
-0.9098654, 0.07006873, -1.830019, 1, 1, 1, 1, 1,
-0.9096324, 0.2466802, -0.2591539, 1, 1, 1, 1, 1,
-0.9019715, -2.113626, -2.800611, 1, 1, 1, 1, 1,
-0.8979705, -0.3384349, -3.451173, 1, 1, 1, 1, 1,
-0.8971657, 0.1665038, -3.305049, 1, 1, 1, 1, 1,
-0.8971173, 1.91615, -2.126648, 1, 1, 1, 1, 1,
-0.890837, -0.1029787, -0.476229, 1, 1, 1, 1, 1,
-0.8851244, -0.6466589, -0.6268706, 1, 1, 1, 1, 1,
-0.8844292, 0.2555392, -1.051487, 1, 1, 1, 1, 1,
-0.8821249, 2.269288, -0.5339476, 1, 1, 1, 1, 1,
-0.8808842, 0.4719652, -0.6889259, 1, 1, 1, 1, 1,
-0.8669698, -0.1173267, -1.312247, 0, 0, 1, 1, 1,
-0.8643302, 0.5268889, -1.906664, 1, 0, 0, 1, 1,
-0.8547683, 0.6388262, -2.063431, 1, 0, 0, 1, 1,
-0.8490168, 0.1884817, -2.129255, 1, 0, 0, 1, 1,
-0.8456098, -0.6929199, -2.969129, 1, 0, 0, 1, 1,
-0.8452516, 0.4432432, -1.337746, 1, 0, 0, 1, 1,
-0.8435179, -2.290212, -3.364424, 0, 0, 0, 1, 1,
-0.8389632, 0.6785395, -1.063334, 0, 0, 0, 1, 1,
-0.8296618, 1.594693, 0.2705972, 0, 0, 0, 1, 1,
-0.8293819, -0.5951999, -2.503743, 0, 0, 0, 1, 1,
-0.8251388, 1.005244, -0.4953415, 0, 0, 0, 1, 1,
-0.8198012, 1.30917, 0.2835605, 0, 0, 0, 1, 1,
-0.8169976, 1.010302, 0.1931245, 0, 0, 0, 1, 1,
-0.8165665, -1.139014, -4.273772, 1, 1, 1, 1, 1,
-0.81494, 1.636978, -0.5432873, 1, 1, 1, 1, 1,
-0.8100407, 0.5529923, -1.761527, 1, 1, 1, 1, 1,
-0.8043998, -0.5054461, -0.59218, 1, 1, 1, 1, 1,
-0.7969588, 1.130132, -1.527206, 1, 1, 1, 1, 1,
-0.7885677, -0.1044612, 0.6051657, 1, 1, 1, 1, 1,
-0.783692, -0.4005589, -1.858668, 1, 1, 1, 1, 1,
-0.7822337, 0.4399314, -1.658396, 1, 1, 1, 1, 1,
-0.7741248, -0.5385582, -1.910663, 1, 1, 1, 1, 1,
-0.7739729, 0.1154183, -0.1267197, 1, 1, 1, 1, 1,
-0.7729325, -2.010042, -2.63793, 1, 1, 1, 1, 1,
-0.7650694, -1.509001, -4.815873, 1, 1, 1, 1, 1,
-0.7625495, -0.2727344, -0.570944, 1, 1, 1, 1, 1,
-0.762138, -1.963557, -3.099127, 1, 1, 1, 1, 1,
-0.7615619, -1.391216, -1.41666, 1, 1, 1, 1, 1,
-0.7545474, -0.5846463, -1.138107, 0, 0, 1, 1, 1,
-0.7497817, 0.1035613, -1.563571, 1, 0, 0, 1, 1,
-0.7471282, 0.2914935, -1.125823, 1, 0, 0, 1, 1,
-0.7394242, 0.04914793, -0.268749, 1, 0, 0, 1, 1,
-0.7330133, 1.26414, -1.307931, 1, 0, 0, 1, 1,
-0.7322713, 1.64185, -1.34998, 1, 0, 0, 1, 1,
-0.7308096, -0.3869806, -2.27314, 0, 0, 0, 1, 1,
-0.7294749, 0.4682646, -1.001562, 0, 0, 0, 1, 1,
-0.7252069, -1.057452, -0.7613424, 0, 0, 0, 1, 1,
-0.7237525, 2.374312, -0.7215813, 0, 0, 0, 1, 1,
-0.7232138, 0.04090947, -2.171042, 0, 0, 0, 1, 1,
-0.7184131, -0.7096708, -2.167647, 0, 0, 0, 1, 1,
-0.7143133, 2.108023, -1.342509, 0, 0, 0, 1, 1,
-0.7115663, -0.2217258, -2.127333, 1, 1, 1, 1, 1,
-0.7095776, 1.435812, -0.1831146, 1, 1, 1, 1, 1,
-0.7065599, -0.3192828, -2.023312, 1, 1, 1, 1, 1,
-0.7062409, -1.033251, -2.262216, 1, 1, 1, 1, 1,
-0.7032049, -0.4838024, -1.504202, 1, 1, 1, 1, 1,
-0.7002395, -0.3709131, -1.797308, 1, 1, 1, 1, 1,
-0.6989179, -0.1130233, -0.7795601, 1, 1, 1, 1, 1,
-0.6981398, -1.071328, -3.809596, 1, 1, 1, 1, 1,
-0.6902082, 1.118004, 0.6495114, 1, 1, 1, 1, 1,
-0.6901453, 0.2109878, -0.952898, 1, 1, 1, 1, 1,
-0.6887336, 2.25185, 0.1261559, 1, 1, 1, 1, 1,
-0.6826194, -3.228479, -0.9902786, 1, 1, 1, 1, 1,
-0.67447, 0.1803394, -2.062998, 1, 1, 1, 1, 1,
-0.6655773, -0.4529741, -3.074099, 1, 1, 1, 1, 1,
-0.664124, 0.8660716, -3.181212, 1, 1, 1, 1, 1,
-0.6616918, -1.334748, -2.279101, 0, 0, 1, 1, 1,
-0.6587857, -0.02178352, -2.53926, 1, 0, 0, 1, 1,
-0.6563089, -0.1571289, -1.976816, 1, 0, 0, 1, 1,
-0.6433283, 0.7264739, -1.68495, 1, 0, 0, 1, 1,
-0.6429707, -1.474432, -1.617694, 1, 0, 0, 1, 1,
-0.6410264, 1.323635, -1.059132, 1, 0, 0, 1, 1,
-0.632652, -0.2451239, -1.276501, 0, 0, 0, 1, 1,
-0.6326144, -0.611153, -3.348673, 0, 0, 0, 1, 1,
-0.6269659, 0.1249583, -1.96802, 0, 0, 0, 1, 1,
-0.62644, 0.05821737, -1.596993, 0, 0, 0, 1, 1,
-0.6261976, -0.2977622, -3.930635, 0, 0, 0, 1, 1,
-0.6182272, -0.06607677, -2.410004, 0, 0, 0, 1, 1,
-0.6163077, 1.279678, -0.5225629, 0, 0, 0, 1, 1,
-0.6135989, -0.435865, -3.662045, 1, 1, 1, 1, 1,
-0.6040908, 0.1834205, -3.322299, 1, 1, 1, 1, 1,
-0.6004511, -1.377215, -2.221353, 1, 1, 1, 1, 1,
-0.597471, 0.7951097, 0.551945, 1, 1, 1, 1, 1,
-0.5952951, -0.3437697, -3.121619, 1, 1, 1, 1, 1,
-0.5943447, -1.350434, -2.435542, 1, 1, 1, 1, 1,
-0.5906596, -0.5672014, -1.556805, 1, 1, 1, 1, 1,
-0.5882977, -0.442205, -3.599998, 1, 1, 1, 1, 1,
-0.5874171, 1.895406, 1.439844, 1, 1, 1, 1, 1,
-0.5861884, -0.9911904, -2.742381, 1, 1, 1, 1, 1,
-0.5806692, 0.471533, -1.027158, 1, 1, 1, 1, 1,
-0.5789571, 1.647712, 0.5466611, 1, 1, 1, 1, 1,
-0.5787906, 0.248946, -1.299296, 1, 1, 1, 1, 1,
-0.5744123, -0.009278866, -2.270559, 1, 1, 1, 1, 1,
-0.5728693, 0.08902444, -0.7812287, 1, 1, 1, 1, 1,
-0.5665167, 0.8022184, 0.1615257, 0, 0, 1, 1, 1,
-0.5639354, -0.0398838, -3.485776, 1, 0, 0, 1, 1,
-0.5635791, -1.316983, -4.571416, 1, 0, 0, 1, 1,
-0.556502, 0.3301367, -1.009273, 1, 0, 0, 1, 1,
-0.5544032, 0.3378642, -0.04662853, 1, 0, 0, 1, 1,
-0.5541929, -0.08794738, -2.499235, 1, 0, 0, 1, 1,
-0.5518275, -0.4393901, -2.867013, 0, 0, 0, 1, 1,
-0.5474852, -0.4660622, -3.960272, 0, 0, 0, 1, 1,
-0.5470046, 1.591481, -0.1193811, 0, 0, 0, 1, 1,
-0.5424569, -0.2246279, -2.636313, 0, 0, 0, 1, 1,
-0.5405084, -0.4728662, -2.560561, 0, 0, 0, 1, 1,
-0.5384714, 1.009351, -0.6909896, 0, 0, 0, 1, 1,
-0.5379455, 1.33439, -0.2533035, 0, 0, 0, 1, 1,
-0.5345527, 0.230636, -3.154975, 1, 1, 1, 1, 1,
-0.532587, 0.3524874, -2.664864, 1, 1, 1, 1, 1,
-0.527692, 0.6703383, -0.1607955, 1, 1, 1, 1, 1,
-0.5274515, -0.2801321, -2.486068, 1, 1, 1, 1, 1,
-0.5244357, 0.1348119, -0.4842632, 1, 1, 1, 1, 1,
-0.5230373, -0.6061708, -0.531961, 1, 1, 1, 1, 1,
-0.5221611, -0.07782675, -2.597097, 1, 1, 1, 1, 1,
-0.5216281, -0.3410435, -2.345898, 1, 1, 1, 1, 1,
-0.519583, 1.420979, 1.619414, 1, 1, 1, 1, 1,
-0.5193182, 0.3731669, -3.083134, 1, 1, 1, 1, 1,
-0.5170497, -1.418173, -1.517202, 1, 1, 1, 1, 1,
-0.514663, -2.411935, -3.337455, 1, 1, 1, 1, 1,
-0.5060942, -0.7535011, -1.609907, 1, 1, 1, 1, 1,
-0.5056529, 0.326573, -0.1103162, 1, 1, 1, 1, 1,
-0.5055721, -0.8090351, -2.707168, 1, 1, 1, 1, 1,
-0.504921, -0.96933, -3.057745, 0, 0, 1, 1, 1,
-0.5015555, -0.3897226, -3.532485, 1, 0, 0, 1, 1,
-0.4975819, -1.509809, -1.33538, 1, 0, 0, 1, 1,
-0.4950012, -1.428961, -3.33776, 1, 0, 0, 1, 1,
-0.491468, 0.7469077, 0.2366118, 1, 0, 0, 1, 1,
-0.4898554, -0.3596146, -3.305345, 1, 0, 0, 1, 1,
-0.4871312, 0.261291, -2.309547, 0, 0, 0, 1, 1,
-0.4853852, -0.4133753, -2.653066, 0, 0, 0, 1, 1,
-0.4821241, 0.9221411, -1.557427, 0, 0, 0, 1, 1,
-0.4818119, 0.1100073, -2.148173, 0, 0, 0, 1, 1,
-0.4795039, 0.9683378, -0.708604, 0, 0, 0, 1, 1,
-0.4765667, 1.216922, -0.9309182, 0, 0, 0, 1, 1,
-0.4744852, -1.50564, -3.835665, 0, 0, 0, 1, 1,
-0.4675644, -0.1707437, -1.96488, 1, 1, 1, 1, 1,
-0.4671847, 0.3720827, -0.6193348, 1, 1, 1, 1, 1,
-0.4661535, 0.6165132, -0.3104106, 1, 1, 1, 1, 1,
-0.4652749, -0.1512926, -2.364953, 1, 1, 1, 1, 1,
-0.463786, 0.9491904, -1.442185, 1, 1, 1, 1, 1,
-0.4536686, 0.1424272, -1.968319, 1, 1, 1, 1, 1,
-0.4522824, -0.5344141, -3.064894, 1, 1, 1, 1, 1,
-0.4451571, 0.04704961, -0.06254622, 1, 1, 1, 1, 1,
-0.4408723, 0.7286837, 0.3647074, 1, 1, 1, 1, 1,
-0.4358057, 0.1580293, -1.134519, 1, 1, 1, 1, 1,
-0.4303605, 1.441389, -1.803952, 1, 1, 1, 1, 1,
-0.4278762, 0.5614412, 0.8799302, 1, 1, 1, 1, 1,
-0.4234852, 1.419408, 1.39387, 1, 1, 1, 1, 1,
-0.4196892, 0.6815905, -0.5136777, 1, 1, 1, 1, 1,
-0.4181188, -1.610339, -1.523443, 1, 1, 1, 1, 1,
-0.4079061, -0.4400817, -3.273659, 0, 0, 1, 1, 1,
-0.4063281, -1.836406, -2.645162, 1, 0, 0, 1, 1,
-0.4049982, 1.53661, -1.085367, 1, 0, 0, 1, 1,
-0.4049895, -0.34416, -1.982651, 1, 0, 0, 1, 1,
-0.4031813, 0.904512, 1.277714, 1, 0, 0, 1, 1,
-0.4027588, -0.247478, -2.265559, 1, 0, 0, 1, 1,
-0.3963685, -1.026846, -2.436606, 0, 0, 0, 1, 1,
-0.3948416, 0.9317834, -1.02459, 0, 0, 0, 1, 1,
-0.3927747, -1.06277, -3.107873, 0, 0, 0, 1, 1,
-0.3909521, 1.063614, -0.9638812, 0, 0, 0, 1, 1,
-0.3839645, -0.7866253, -1.217105, 0, 0, 0, 1, 1,
-0.3833267, 0.4171416, -1.203794, 0, 0, 0, 1, 1,
-0.3806135, 1.649011, -0.7250041, 0, 0, 0, 1, 1,
-0.3799275, 0.8028345, -0.329025, 1, 1, 1, 1, 1,
-0.3798827, 1.264292, -1.212137, 1, 1, 1, 1, 1,
-0.3795832, 0.1953808, -0.3004156, 1, 1, 1, 1, 1,
-0.3784594, -0.05451455, -0.6931582, 1, 1, 1, 1, 1,
-0.3753236, 0.3395371, -0.1290173, 1, 1, 1, 1, 1,
-0.3725443, -1.343251, -4.651903, 1, 1, 1, 1, 1,
-0.3697942, -2.140703, -3.165078, 1, 1, 1, 1, 1,
-0.3694625, 0.4814697, -1.697991, 1, 1, 1, 1, 1,
-0.3689776, 1.054753, -1.46547, 1, 1, 1, 1, 1,
-0.368227, -0.7523772, -2.810287, 1, 1, 1, 1, 1,
-0.3661122, -0.1844203, -1.162525, 1, 1, 1, 1, 1,
-0.3648261, -0.6364186, -2.137636, 1, 1, 1, 1, 1,
-0.3619528, -0.5803567, -1.394455, 1, 1, 1, 1, 1,
-0.3598144, 0.8993914, -0.3068103, 1, 1, 1, 1, 1,
-0.3588052, 1.159192, -0.1272987, 1, 1, 1, 1, 1,
-0.3557692, 1.343721, 0.7500218, 0, 0, 1, 1, 1,
-0.3550583, -1.189051, -2.88427, 1, 0, 0, 1, 1,
-0.3514808, -0.3628551, -0.8937954, 1, 0, 0, 1, 1,
-0.350983, -1.074851, -1.745664, 1, 0, 0, 1, 1,
-0.3503653, -1.016119, -3.570917, 1, 0, 0, 1, 1,
-0.3493436, 0.4718636, -0.1618816, 1, 0, 0, 1, 1,
-0.3463381, -0.1591107, -1.895612, 0, 0, 0, 1, 1,
-0.3441073, -0.8036183, -3.054027, 0, 0, 0, 1, 1,
-0.3413864, 1.44159, 0.0863361, 0, 0, 0, 1, 1,
-0.3376386, 0.6553121, 0.9556438, 0, 0, 0, 1, 1,
-0.3329352, -0.2234879, -5.270574, 0, 0, 0, 1, 1,
-0.3203494, 1.231246, -1.997165, 0, 0, 0, 1, 1,
-0.3198448, 0.2996746, 0.323958, 0, 0, 0, 1, 1,
-0.317599, -0.5103617, -3.022307, 1, 1, 1, 1, 1,
-0.3174183, -0.9273369, -3.861542, 1, 1, 1, 1, 1,
-0.311587, 1.530146, -0.04742312, 1, 1, 1, 1, 1,
-0.3106742, -0.01880888, -1.679508, 1, 1, 1, 1, 1,
-0.3098286, -0.9240434, -3.57021, 1, 1, 1, 1, 1,
-0.3064673, 0.1602922, -0.8875303, 1, 1, 1, 1, 1,
-0.3062489, 0.7882403, -1.087937, 1, 1, 1, 1, 1,
-0.3038895, -1.278538, -4.434931, 1, 1, 1, 1, 1,
-0.3036238, -0.3912464, -3.422789, 1, 1, 1, 1, 1,
-0.296549, 0.006847113, -2.15016, 1, 1, 1, 1, 1,
-0.2951075, 0.3914003, -2.185509, 1, 1, 1, 1, 1,
-0.289859, 0.1773024, -1.774772, 1, 1, 1, 1, 1,
-0.2872676, -0.4024812, -3.468325, 1, 1, 1, 1, 1,
-0.2863903, 1.528215, 1.087279, 1, 1, 1, 1, 1,
-0.2818354, -0.5474272, -1.931341, 1, 1, 1, 1, 1,
-0.2802316, -0.927739, -2.407193, 0, 0, 1, 1, 1,
-0.2799907, 1.544811, -0.5163137, 1, 0, 0, 1, 1,
-0.2781627, 0.5380626, -1.570064, 1, 0, 0, 1, 1,
-0.2765145, 0.9089671, -1.633379, 1, 0, 0, 1, 1,
-0.271435, 0.3828343, 0.2401614, 1, 0, 0, 1, 1,
-0.2696092, 1.2069, 0.1647239, 1, 0, 0, 1, 1,
-0.2676632, 1.80213, -1.422175, 0, 0, 0, 1, 1,
-0.2668109, 0.709474, 0.1432212, 0, 0, 0, 1, 1,
-0.2595121, -0.8437166, -2.657053, 0, 0, 0, 1, 1,
-0.2590797, -0.0147081, -1.334207, 0, 0, 0, 1, 1,
-0.2553621, -1.567691, -3.012459, 0, 0, 0, 1, 1,
-0.2550709, -0.4709197, -4.299492, 0, 0, 0, 1, 1,
-0.254986, -0.3626494, -1.480308, 0, 0, 0, 1, 1,
-0.2540734, -1.514537, -3.47097, 1, 1, 1, 1, 1,
-0.2528761, 1.5613, 1.181385, 1, 1, 1, 1, 1,
-0.2491801, 0.3309644, -1.527855, 1, 1, 1, 1, 1,
-0.2487552, -0.8234617, -2.5496, 1, 1, 1, 1, 1,
-0.2486142, -0.09317033, 0.1664743, 1, 1, 1, 1, 1,
-0.2472481, 0.887956, 0.5127791, 1, 1, 1, 1, 1,
-0.2448758, -1.2209, -3.934204, 1, 1, 1, 1, 1,
-0.2401809, 0.799154, -0.07137822, 1, 1, 1, 1, 1,
-0.2388793, 0.3629071, -0.5093864, 1, 1, 1, 1, 1,
-0.2351544, 1.945549, -0.3275207, 1, 1, 1, 1, 1,
-0.2329424, 0.6107462, -0.08516342, 1, 1, 1, 1, 1,
-0.2298516, -0.7122427, -2.939468, 1, 1, 1, 1, 1,
-0.2257109, 0.5973359, -1.99138, 1, 1, 1, 1, 1,
-0.2238212, 0.4540935, -0.166815, 1, 1, 1, 1, 1,
-0.2234076, 1.196935, 0.04721196, 1, 1, 1, 1, 1,
-0.2227403, -1.098252, -2.377443, 0, 0, 1, 1, 1,
-0.2215269, -0.1330265, -2.221215, 1, 0, 0, 1, 1,
-0.220397, -1.056041, -3.757242, 1, 0, 0, 1, 1,
-0.2199107, -0.208179, -2.015302, 1, 0, 0, 1, 1,
-0.2186579, -0.5729358, -2.502736, 1, 0, 0, 1, 1,
-0.2169766, 0.2558479, -1.055549, 1, 0, 0, 1, 1,
-0.2147838, 1.396493, 1.680196, 0, 0, 0, 1, 1,
-0.2145821, 1.106994, -0.8718249, 0, 0, 0, 1, 1,
-0.2098611, 0.1394084, -0.5859472, 0, 0, 0, 1, 1,
-0.2070347, -0.3692787, -2.854369, 0, 0, 0, 1, 1,
-0.2056213, 0.8142893, -0.8779349, 0, 0, 0, 1, 1,
-0.2015077, 0.6937332, -1.051433, 0, 0, 0, 1, 1,
-0.2003717, 0.8704118, 0.440384, 0, 0, 0, 1, 1,
-0.1990535, -1.167111, -3.42523, 1, 1, 1, 1, 1,
-0.1938637, -0.9108913, -2.646333, 1, 1, 1, 1, 1,
-0.1912823, -0.9001521, -1.392674, 1, 1, 1, 1, 1,
-0.1873509, 0.6161288, 0.1417783, 1, 1, 1, 1, 1,
-0.1871971, 1.053108, 1.407066, 1, 1, 1, 1, 1,
-0.1871233, 1.863216, -0.1995342, 1, 1, 1, 1, 1,
-0.1777022, -1.066356, -4.326097, 1, 1, 1, 1, 1,
-0.177287, 1.015639, 0.8737565, 1, 1, 1, 1, 1,
-0.1746399, 1.422303, 1.862128, 1, 1, 1, 1, 1,
-0.1739247, -0.1253516, -3.003989, 1, 1, 1, 1, 1,
-0.1698615, 0.6442522, 1.30219, 1, 1, 1, 1, 1,
-0.1516804, -0.2536851, -2.545494, 1, 1, 1, 1, 1,
-0.1421093, -0.3419335, -2.390666, 1, 1, 1, 1, 1,
-0.1395302, 0.2885871, -0.7460229, 1, 1, 1, 1, 1,
-0.139047, -0.1830172, -2.888443, 1, 1, 1, 1, 1,
-0.1272468, 0.2532483, 1.091014, 0, 0, 1, 1, 1,
-0.1257542, 0.007771688, 1.436231, 1, 0, 0, 1, 1,
-0.1240097, -1.532024, -3.445657, 1, 0, 0, 1, 1,
-0.1232865, -0.9305585, -3.67178, 1, 0, 0, 1, 1,
-0.1232644, -0.5268818, -3.890235, 1, 0, 0, 1, 1,
-0.1220561, -0.6497247, -1.777207, 1, 0, 0, 1, 1,
-0.1217903, 0.8992215, 0.02331617, 0, 0, 0, 1, 1,
-0.1212244, 0.1316022, -2.071137, 0, 0, 0, 1, 1,
-0.11711, -0.8333986, -4.491629, 0, 0, 0, 1, 1,
-0.1159517, -0.4025997, -1.392838, 0, 0, 0, 1, 1,
-0.1152471, 0.03404831, -0.1401252, 0, 0, 0, 1, 1,
-0.1147322, 1.469898, -1.07738, 0, 0, 0, 1, 1,
-0.114097, -2.041843, -3.727607, 0, 0, 0, 1, 1,
-0.1125354, -1.643172, -2.931356, 1, 1, 1, 1, 1,
-0.1119081, 0.4116059, -0.9791449, 1, 1, 1, 1, 1,
-0.1060809, -0.4942632, -3.323076, 1, 1, 1, 1, 1,
-0.1042006, -1.305744, -1.628253, 1, 1, 1, 1, 1,
-0.1010725, 0.2479086, 1.34948, 1, 1, 1, 1, 1,
-0.1007458, -1.546013, -4.647841, 1, 1, 1, 1, 1,
-0.09903881, 2.22488, 1.111889, 1, 1, 1, 1, 1,
-0.09895468, -2.082124, -3.156996, 1, 1, 1, 1, 1,
-0.09863121, 0.0729859, -0.2184182, 1, 1, 1, 1, 1,
-0.09831279, 0.6837347, -0.271968, 1, 1, 1, 1, 1,
-0.09128364, 1.840451, 0.3279922, 1, 1, 1, 1, 1,
-0.08625707, -0.008718893, -0.9138023, 1, 1, 1, 1, 1,
-0.07966566, 0.5865414, 1.268625, 1, 1, 1, 1, 1,
-0.07877835, 0.7745559, -0.4666227, 1, 1, 1, 1, 1,
-0.07847944, -0.2935549, -2.901088, 1, 1, 1, 1, 1,
-0.07725402, -0.9537142, -2.082427, 0, 0, 1, 1, 1,
-0.07521954, 0.4103697, -2.193515, 1, 0, 0, 1, 1,
-0.07168425, -1.652079, -3.303091, 1, 0, 0, 1, 1,
-0.0656554, 0.3107052, -1.030946, 1, 0, 0, 1, 1,
-0.06475107, 0.1512825, 0.3817855, 1, 0, 0, 1, 1,
-0.06468985, -0.9069333, -2.195196, 1, 0, 0, 1, 1,
-0.06396614, 0.6551284, -0.932588, 0, 0, 0, 1, 1,
-0.06390228, -0.5082558, -0.7417072, 0, 0, 0, 1, 1,
-0.06086274, -1.923339, -3.611687, 0, 0, 0, 1, 1,
-0.06047392, 1.271024, 2.199612, 0, 0, 0, 1, 1,
-0.05954864, 2.483742, -0.5945876, 0, 0, 0, 1, 1,
-0.05858623, 1.208628, 0.4502855, 0, 0, 0, 1, 1,
-0.05574029, 0.9635679, -0.6680698, 0, 0, 0, 1, 1,
-0.05436036, 1.202572, 0.3538033, 1, 1, 1, 1, 1,
-0.05184162, 0.4062173, 0.358703, 1, 1, 1, 1, 1,
-0.04679822, 0.6089299, -0.5538383, 1, 1, 1, 1, 1,
-0.04588452, 0.598433, -0.5110859, 1, 1, 1, 1, 1,
-0.0453775, 0.5155058, 4.222075, 1, 1, 1, 1, 1,
-0.03810035, -0.26905, -3.304942, 1, 1, 1, 1, 1,
-0.03196497, 0.7505451, -2.05832, 1, 1, 1, 1, 1,
-0.02955696, 1.303722, 0.04400082, 1, 1, 1, 1, 1,
-0.02755422, 0.6690356, 0.008273305, 1, 1, 1, 1, 1,
-0.02623441, -1.117942, -4.176476, 1, 1, 1, 1, 1,
-0.0229322, 0.9664418, 0.1776648, 1, 1, 1, 1, 1,
-0.02206972, 0.3060406, -0.8874115, 1, 1, 1, 1, 1,
-0.01484602, 0.584116, 0.8293146, 1, 1, 1, 1, 1,
-0.012112, 0.6038303, -0.8670653, 1, 1, 1, 1, 1,
-0.01146683, 0.7198118, 0.4301069, 1, 1, 1, 1, 1,
-0.007544599, 0.2468889, -1.413814, 0, 0, 1, 1, 1,
-0.006549996, -1.599584, -3.623152, 1, 0, 0, 1, 1,
-0.006206619, -2.444072, -2.786236, 1, 0, 0, 1, 1,
-0.0029253, -0.5001839, -1.34168, 1, 0, 0, 1, 1,
-0.002339151, 0.3673601, 0.1153348, 1, 0, 0, 1, 1,
-0.001278313, 0.3585056, 0.12842, 1, 0, 0, 1, 1,
-0.0006330283, 0.05483565, 0.6342716, 0, 0, 0, 1, 1,
0.0007787358, 0.7572744, 0.1050262, 0, 0, 0, 1, 1,
0.0009899532, -1.337859, 3.059254, 0, 0, 0, 1, 1,
0.005968644, -1.533856, 3.441373, 0, 0, 0, 1, 1,
0.006345985, -0.5039306, 2.456168, 0, 0, 0, 1, 1,
0.009921248, 1.017268, 0.8728636, 0, 0, 0, 1, 1,
0.01136261, 0.3354961, 0.5903767, 0, 0, 0, 1, 1,
0.01249637, -1.722395, 1.589334, 1, 1, 1, 1, 1,
0.01424314, -0.325956, 3.268724, 1, 1, 1, 1, 1,
0.01444777, 1.499242, -0.5421849, 1, 1, 1, 1, 1,
0.0255887, 0.9475812, -1.336675, 1, 1, 1, 1, 1,
0.02690589, 0.5118948, 0.4684908, 1, 1, 1, 1, 1,
0.03022345, -0.3652709, 1.95651, 1, 1, 1, 1, 1,
0.03210858, -0.1753234, 4.846601, 1, 1, 1, 1, 1,
0.03453803, 0.2323308, 1.732468, 1, 1, 1, 1, 1,
0.0370748, 0.5851805, 0.9828939, 1, 1, 1, 1, 1,
0.04156106, -1.862452, 4.928044, 1, 1, 1, 1, 1,
0.04215308, -0.2065038, 3.996206, 1, 1, 1, 1, 1,
0.04293642, 1.797099, -0.4839083, 1, 1, 1, 1, 1,
0.04327969, 0.4949048, -0.1421961, 1, 1, 1, 1, 1,
0.04519827, 0.8719224, -0.254266, 1, 1, 1, 1, 1,
0.04728152, -0.01171045, 1.409737, 1, 1, 1, 1, 1,
0.05510097, -0.02487222, 2.135288, 0, 0, 1, 1, 1,
0.05808644, -0.6093142, 2.391294, 1, 0, 0, 1, 1,
0.06237449, 0.01660478, 0.5618786, 1, 0, 0, 1, 1,
0.06258719, -0.6292925, 4.187855, 1, 0, 0, 1, 1,
0.06488785, 0.07326914, 1.416803, 1, 0, 0, 1, 1,
0.06928743, -0.4101634, 4.24951, 1, 0, 0, 1, 1,
0.0701685, -1.474047, 3.624929, 0, 0, 0, 1, 1,
0.07162235, -1.447184, 4.413075, 0, 0, 0, 1, 1,
0.07170036, 0.9529926, -0.1247229, 0, 0, 0, 1, 1,
0.07202657, 1.638126, 0.0130853, 0, 0, 0, 1, 1,
0.07212692, -0.5691913, 3.853178, 0, 0, 0, 1, 1,
0.07300813, 1.515668, 0.5083074, 0, 0, 0, 1, 1,
0.07360793, 0.7801525, 0.9184891, 0, 0, 0, 1, 1,
0.07391004, 0.2417579, 0.6063633, 1, 1, 1, 1, 1,
0.08613866, -1.8318, 2.333822, 1, 1, 1, 1, 1,
0.09447255, 1.191577, -0.495814, 1, 1, 1, 1, 1,
0.09702619, 0.4185633, 0.7332668, 1, 1, 1, 1, 1,
0.1001672, -0.4247557, 2.995676, 1, 1, 1, 1, 1,
0.1009866, -0.7449555, 1.66642, 1, 1, 1, 1, 1,
0.1051056, 0.9215263, -0.2947597, 1, 1, 1, 1, 1,
0.1065672, 0.3394952, -0.1885184, 1, 1, 1, 1, 1,
0.1072863, 0.2848323, 0.4871332, 1, 1, 1, 1, 1,
0.1084116, -0.1196677, 1.735024, 1, 1, 1, 1, 1,
0.108859, -0.4031222, 2.521286, 1, 1, 1, 1, 1,
0.1089105, 2.03982, 1.459353, 1, 1, 1, 1, 1,
0.114073, -1.635811, 3.473741, 1, 1, 1, 1, 1,
0.121574, 1.172877, 0.6615891, 1, 1, 1, 1, 1,
0.1272114, -0.4047254, 2.598832, 1, 1, 1, 1, 1,
0.1281045, -1.408851, 2.527153, 0, 0, 1, 1, 1,
0.1302254, 0.266163, 1.808021, 1, 0, 0, 1, 1,
0.1337844, 0.5226653, -0.4707113, 1, 0, 0, 1, 1,
0.1342478, -0.9826357, 3.741061, 1, 0, 0, 1, 1,
0.1348354, 1.257447, -0.167562, 1, 0, 0, 1, 1,
0.1353093, 0.3086509, 0.8980525, 1, 0, 0, 1, 1,
0.1498152, 1.12468, -1.062721, 0, 0, 0, 1, 1,
0.1502475, 0.09559095, 1.478714, 0, 0, 0, 1, 1,
0.1526037, 0.1914535, 1.363955, 0, 0, 0, 1, 1,
0.1532478, 0.8907207, 0.8204037, 0, 0, 0, 1, 1,
0.1607488, -0.8499897, 4.421947, 0, 0, 0, 1, 1,
0.1637616, -0.1963397, 2.213119, 0, 0, 0, 1, 1,
0.1682122, -1.882985, 4.574644, 0, 0, 0, 1, 1,
0.1684627, 0.2397067, 0.5998431, 1, 1, 1, 1, 1,
0.1707839, -1.99804, 2.91965, 1, 1, 1, 1, 1,
0.1725224, 1.970506, -0.5053067, 1, 1, 1, 1, 1,
0.1738059, -1.758492, 2.433968, 1, 1, 1, 1, 1,
0.1746836, -1.063145, 4.427335, 1, 1, 1, 1, 1,
0.1746965, -0.8843187, 2.347016, 1, 1, 1, 1, 1,
0.1773035, -1.487702, 1.499315, 1, 1, 1, 1, 1,
0.1811134, 0.4221536, -1.063646, 1, 1, 1, 1, 1,
0.1814997, 0.6417735, -0.2148854, 1, 1, 1, 1, 1,
0.1844234, 0.2416656, 1.644079, 1, 1, 1, 1, 1,
0.1874367, -0.1246439, 2.310691, 1, 1, 1, 1, 1,
0.192015, -1.055244, 3.30605, 1, 1, 1, 1, 1,
0.1929415, -0.5403637, 2.45178, 1, 1, 1, 1, 1,
0.1934119, -1.501997, 2.716843, 1, 1, 1, 1, 1,
0.1995766, 0.4952189, -0.5314738, 1, 1, 1, 1, 1,
0.2004588, -1.401447, 2.788286, 0, 0, 1, 1, 1,
0.2012399, 1.050212, 0.6997741, 1, 0, 0, 1, 1,
0.2034716, 1.060487, -0.8684528, 1, 0, 0, 1, 1,
0.2055002, -1.307637, 3.24003, 1, 0, 0, 1, 1,
0.206662, -0.2741339, 4.4507, 1, 0, 0, 1, 1,
0.2071445, 0.1578986, 0.5817136, 1, 0, 0, 1, 1,
0.2103902, 1.092999, -0.4780469, 0, 0, 0, 1, 1,
0.2166975, -1.037089, 0.6058252, 0, 0, 0, 1, 1,
0.2223121, 0.582143, 1.59718, 0, 0, 0, 1, 1,
0.2318024, -1.045333, 3.212249, 0, 0, 0, 1, 1,
0.2323596, -0.6866491, 3.71127, 0, 0, 0, 1, 1,
0.2334945, 0.5006421, -0.102289, 0, 0, 0, 1, 1,
0.2360843, -0.6492819, 4.114227, 0, 0, 0, 1, 1,
0.2450708, -0.2911077, 1.416987, 1, 1, 1, 1, 1,
0.2466139, -0.2288859, 2.905705, 1, 1, 1, 1, 1,
0.246731, 0.2646199, 1.827317, 1, 1, 1, 1, 1,
0.2502612, -0.8929532, 3.793053, 1, 1, 1, 1, 1,
0.2532476, -0.983736, 3.331035, 1, 1, 1, 1, 1,
0.253713, -0.6979252, 1.429056, 1, 1, 1, 1, 1,
0.2540594, -0.6805418, 2.346588, 1, 1, 1, 1, 1,
0.2544857, 0.3525075, 0.982861, 1, 1, 1, 1, 1,
0.2545443, 0.9673529, 0.2652422, 1, 1, 1, 1, 1,
0.2557801, 0.1938409, -0.6824002, 1, 1, 1, 1, 1,
0.2585154, 1.258259, 1.297735, 1, 1, 1, 1, 1,
0.2612913, -2.79624, 3.52128, 1, 1, 1, 1, 1,
0.2618124, 1.642659, -1.67884, 1, 1, 1, 1, 1,
0.2646017, -0.3614293, 0.7645728, 1, 1, 1, 1, 1,
0.2656446, -0.3681069, 0.1107392, 1, 1, 1, 1, 1,
0.2668268, 1.747624, -0.181509, 0, 0, 1, 1, 1,
0.2693429, -0.6059878, 2.354426, 1, 0, 0, 1, 1,
0.271889, -0.9083257, 2.327029, 1, 0, 0, 1, 1,
0.272101, -1.558873, 4.928338, 1, 0, 0, 1, 1,
0.2795942, 1.663773, 1.297506, 1, 0, 0, 1, 1,
0.2801658, -0.2381654, 2.052093, 1, 0, 0, 1, 1,
0.2830478, -0.792275, 3.188592, 0, 0, 0, 1, 1,
0.2869987, 0.05425263, 3.03458, 0, 0, 0, 1, 1,
0.2888855, 0.2857947, -0.2902025, 0, 0, 0, 1, 1,
0.2925233, 0.4822442, -0.0135232, 0, 0, 0, 1, 1,
0.2947673, 0.4990709, 1.526053, 0, 0, 0, 1, 1,
0.2966119, -1.08989, 2.241698, 0, 0, 0, 1, 1,
0.2997462, -0.6334915, 4.478533, 0, 0, 0, 1, 1,
0.3063591, -0.4860569, 2.788796, 1, 1, 1, 1, 1,
0.3087493, 0.857076, -0.0718701, 1, 1, 1, 1, 1,
0.3172926, 0.9621003, 0.1728626, 1, 1, 1, 1, 1,
0.3194723, 0.4968916, 2.287488, 1, 1, 1, 1, 1,
0.322758, 1.482408, 0.2899691, 1, 1, 1, 1, 1,
0.3254867, 1.009178, 1.13153, 1, 1, 1, 1, 1,
0.3263848, -1.106034, 2.584874, 1, 1, 1, 1, 1,
0.3264033, -0.9000961, 3.877179, 1, 1, 1, 1, 1,
0.3283179, 0.6672279, 1.581635, 1, 1, 1, 1, 1,
0.3285413, -0.6524192, 2.688408, 1, 1, 1, 1, 1,
0.3329085, -1.318505, 4.083152, 1, 1, 1, 1, 1,
0.3352923, -1.126392, 2.215603, 1, 1, 1, 1, 1,
0.3371221, -0.7859966, 1.936844, 1, 1, 1, 1, 1,
0.3379125, 1.037206, -0.2251984, 1, 1, 1, 1, 1,
0.3447672, -0.1505453, -0.02616705, 1, 1, 1, 1, 1,
0.3456822, -0.02081964, 1.246828, 0, 0, 1, 1, 1,
0.35055, 1.09101, 1.274482, 1, 0, 0, 1, 1,
0.350989, 0.4619413, 0.743009, 1, 0, 0, 1, 1,
0.351669, -0.3209532, 2.507474, 1, 0, 0, 1, 1,
0.3546468, -0.112119, 0.8375629, 1, 0, 0, 1, 1,
0.3718327, -1.525574, 2.682477, 1, 0, 0, 1, 1,
0.3732768, 1.150648, -0.4117172, 0, 0, 0, 1, 1,
0.3747705, 1.209569, 0.1702875, 0, 0, 0, 1, 1,
0.3764015, 0.1864101, 2.153582, 0, 0, 0, 1, 1,
0.3764246, -1.259177, 1.165619, 0, 0, 0, 1, 1,
0.3766726, -0.5271987, 2.060665, 0, 0, 0, 1, 1,
0.3813167, 0.6650532, 0.5975764, 0, 0, 0, 1, 1,
0.382109, 0.8946535, 1.07377, 0, 0, 0, 1, 1,
0.3821976, 0.7549863, 2.06289, 1, 1, 1, 1, 1,
0.3864854, 0.08476481, 0.2667759, 1, 1, 1, 1, 1,
0.3939646, -0.6915944, 2.908899, 1, 1, 1, 1, 1,
0.3949668, -1.953349, 3.427928, 1, 1, 1, 1, 1,
0.3965761, 0.04189311, 0.7949581, 1, 1, 1, 1, 1,
0.3980071, -1.262825, 0.6300278, 1, 1, 1, 1, 1,
0.3981199, -1.638015, 4.433495, 1, 1, 1, 1, 1,
0.4031421, -0.4143219, 2.559506, 1, 1, 1, 1, 1,
0.4103623, -0.6329724, 4.100018, 1, 1, 1, 1, 1,
0.4118046, 0.3826757, 0.2082334, 1, 1, 1, 1, 1,
0.4156239, -0.1734758, 2.234488, 1, 1, 1, 1, 1,
0.4164517, 0.04528538, 0.3163789, 1, 1, 1, 1, 1,
0.4175082, 1.06413, 1.857447, 1, 1, 1, 1, 1,
0.4215896, -0.3085302, 4.260086, 1, 1, 1, 1, 1,
0.4218019, 0.1758742, 1.961772, 1, 1, 1, 1, 1,
0.4227516, 0.7067075, 0.7498176, 0, 0, 1, 1, 1,
0.425651, -1.239356, 2.716747, 1, 0, 0, 1, 1,
0.4259487, -0.3932181, 4.087811, 1, 0, 0, 1, 1,
0.4260182, -1.186436, 3.276218, 1, 0, 0, 1, 1,
0.4269284, 0.1356027, 0.668687, 1, 0, 0, 1, 1,
0.4292194, -1.369509, 2.778941, 1, 0, 0, 1, 1,
0.4381124, -0.4307684, 2.201537, 0, 0, 0, 1, 1,
0.4462764, 1.466724, 0.9493459, 0, 0, 0, 1, 1,
0.4470131, 1.158283, -0.2445189, 0, 0, 0, 1, 1,
0.448246, 0.248553, 2.016234, 0, 0, 0, 1, 1,
0.4497948, 0.355026, 0.2378834, 0, 0, 0, 1, 1,
0.4505302, 1.360208, 0.3962743, 0, 0, 0, 1, 1,
0.4532241, -0.06005206, 1.198333, 0, 0, 0, 1, 1,
0.454522, 1.061068, -0.1469622, 1, 1, 1, 1, 1,
0.4579561, -1.69179, 1.555264, 1, 1, 1, 1, 1,
0.4585918, 0.1604695, 2.661926, 1, 1, 1, 1, 1,
0.4600225, 0.5382241, 2.417182, 1, 1, 1, 1, 1,
0.4629212, 0.2224882, -0.9247139, 1, 1, 1, 1, 1,
0.463068, 0.2376891, 0.4184525, 1, 1, 1, 1, 1,
0.465068, -0.4623064, 3.103822, 1, 1, 1, 1, 1,
0.4669979, 0.6597739, -0.3563849, 1, 1, 1, 1, 1,
0.4796665, 0.5141793, 0.1856187, 1, 1, 1, 1, 1,
0.4801858, -0.1002426, 0.5464646, 1, 1, 1, 1, 1,
0.4854059, -0.3253952, 1.600665, 1, 1, 1, 1, 1,
0.4858156, 0.808787, -0.9366674, 1, 1, 1, 1, 1,
0.4923616, -0.0857933, 3.619378, 1, 1, 1, 1, 1,
0.4931959, -0.2336744, 1.881457, 1, 1, 1, 1, 1,
0.4934072, 0.465802, -1.06918, 1, 1, 1, 1, 1,
0.5003728, -1.370209, 1.530908, 0, 0, 1, 1, 1,
0.5009255, 0.2162498, 0.9673728, 1, 0, 0, 1, 1,
0.5029801, -0.522659, 1.037901, 1, 0, 0, 1, 1,
0.5042558, 1.582863, 0.885812, 1, 0, 0, 1, 1,
0.5054326, -1.335049, 1.671516, 1, 0, 0, 1, 1,
0.5075341, -0.06706814, 2.350453, 1, 0, 0, 1, 1,
0.5136907, -0.658945, 4.962233, 0, 0, 0, 1, 1,
0.5162968, 0.2999012, 2.024502, 0, 0, 0, 1, 1,
0.5173165, -0.4775812, 2.425413, 0, 0, 0, 1, 1,
0.5177544, 0.3069173, -0.1375411, 0, 0, 0, 1, 1,
0.5210626, 1.198942, 2.152417, 0, 0, 0, 1, 1,
0.5224494, 0.4657461, 1.25129, 0, 0, 0, 1, 1,
0.5238746, -0.4493009, 2.366594, 0, 0, 0, 1, 1,
0.5327693, -0.1256649, 2.966954, 1, 1, 1, 1, 1,
0.5358382, -0.251583, 1.74611, 1, 1, 1, 1, 1,
0.5391101, 0.239371, 2.022228, 1, 1, 1, 1, 1,
0.5394071, -0.8229802, 3.162882, 1, 1, 1, 1, 1,
0.53978, 0.1229335, 1.029802, 1, 1, 1, 1, 1,
0.5401726, 0.0979051, -0.7164551, 1, 1, 1, 1, 1,
0.5480106, -0.4210392, 1.53618, 1, 1, 1, 1, 1,
0.5498295, 0.1316035, 0.4074119, 1, 1, 1, 1, 1,
0.5499166, -1.138621, 2.352803, 1, 1, 1, 1, 1,
0.5515535, 0.07149222, -0.3219792, 1, 1, 1, 1, 1,
0.5524477, -0.5154034, 0.8498595, 1, 1, 1, 1, 1,
0.5535972, 1.004459, 1.761969, 1, 1, 1, 1, 1,
0.5537676, -0.6058374, 1.092576, 1, 1, 1, 1, 1,
0.5540442, 0.6792417, 0.5677651, 1, 1, 1, 1, 1,
0.5615732, 0.9396784, 1.042161, 1, 1, 1, 1, 1,
0.5627077, -1.571562, 2.148875, 0, 0, 1, 1, 1,
0.5641463, 0.1378237, -0.3882852, 1, 0, 0, 1, 1,
0.5661144, -0.2471191, 1.618731, 1, 0, 0, 1, 1,
0.5664119, -1.029773, 2.736222, 1, 0, 0, 1, 1,
0.571587, 1.108701, -0.8992357, 1, 0, 0, 1, 1,
0.5723419, 0.3132263, 0.5747696, 1, 0, 0, 1, 1,
0.5747079, 1.1896, 0.9808695, 0, 0, 0, 1, 1,
0.5785447, -1.140652, 1.759276, 0, 0, 0, 1, 1,
0.5795208, -0.7037115, 4.278212, 0, 0, 0, 1, 1,
0.5829326, -0.07870941, 0.1614562, 0, 0, 0, 1, 1,
0.5847695, -0.8970531, 0.9128854, 0, 0, 0, 1, 1,
0.5866223, 0.2641475, 1.532426, 0, 0, 0, 1, 1,
0.5885039, -0.1691931, 0.2526791, 0, 0, 0, 1, 1,
0.5905405, -0.03415338, 2.667939, 1, 1, 1, 1, 1,
0.5930625, -0.4912984, 3.151154, 1, 1, 1, 1, 1,
0.596313, 0.2681182, 2.301558, 1, 1, 1, 1, 1,
0.5982547, 1.311532, -0.3732983, 1, 1, 1, 1, 1,
0.6054876, -0.4183543, 1.129489, 1, 1, 1, 1, 1,
0.6068228, -0.8268926, 3.301795, 1, 1, 1, 1, 1,
0.6095834, 0.5818981, 2.849589, 1, 1, 1, 1, 1,
0.6148483, -0.2012185, 0.3855456, 1, 1, 1, 1, 1,
0.6168109, -0.1637576, 0.6714016, 1, 1, 1, 1, 1,
0.6287164, 0.7253394, 1.09931, 1, 1, 1, 1, 1,
0.6299766, -1.002865, 3.067899, 1, 1, 1, 1, 1,
0.6307092, -1.871125, 3.094707, 1, 1, 1, 1, 1,
0.635169, 0.96688, 0.8164015, 1, 1, 1, 1, 1,
0.6499092, -0.8040211, 4.319327, 1, 1, 1, 1, 1,
0.6503631, 0.09765138, 3.050831, 1, 1, 1, 1, 1,
0.6537069, 0.02242806, 2.169815, 0, 0, 1, 1, 1,
0.6552008, -0.00211201, 1.462295, 1, 0, 0, 1, 1,
0.6558854, 0.95492, -0.1860626, 1, 0, 0, 1, 1,
0.6574733, 0.05739164, 1.84586, 1, 0, 0, 1, 1,
0.6583934, 1.510199, 1.237859, 1, 0, 0, 1, 1,
0.6649758, -0.7359655, 4.694795, 1, 0, 0, 1, 1,
0.6663748, -1.05015, 2.828547, 0, 0, 0, 1, 1,
0.6690238, 1.322991, -0.8145689, 0, 0, 0, 1, 1,
0.6717526, 0.7045692, 1.493354, 0, 0, 0, 1, 1,
0.6718996, 0.1405681, 0.5189234, 0, 0, 0, 1, 1,
0.6747752, 0.3478377, 1.714709, 0, 0, 0, 1, 1,
0.6757073, 1.279364, -0.1449173, 0, 0, 0, 1, 1,
0.6761699, 0.310364, 0.8956837, 0, 0, 0, 1, 1,
0.6774207, 1.04939, -0.8677176, 1, 1, 1, 1, 1,
0.6809388, 0.8263858, 0.2183959, 1, 1, 1, 1, 1,
0.6823965, -0.9647775, 3.762238, 1, 1, 1, 1, 1,
0.6830875, -0.8972804, 2.45746, 1, 1, 1, 1, 1,
0.6833495, -1.193436, 1.605469, 1, 1, 1, 1, 1,
0.6841117, 0.01721228, -0.3861859, 1, 1, 1, 1, 1,
0.6846072, 0.9278635, 0.3732781, 1, 1, 1, 1, 1,
0.6885948, -1.134631, 2.887839, 1, 1, 1, 1, 1,
0.690436, 1.822907, 0.9587843, 1, 1, 1, 1, 1,
0.6910991, 2.527509, -0.01108983, 1, 1, 1, 1, 1,
0.6955935, -0.4690718, 1.01463, 1, 1, 1, 1, 1,
0.6970576, -0.8594778, 2.320732, 1, 1, 1, 1, 1,
0.6976258, 0.548201, 0.8334269, 1, 1, 1, 1, 1,
0.6980027, 0.3886078, 0.7577797, 1, 1, 1, 1, 1,
0.6984591, -0.7819219, 4.001891, 1, 1, 1, 1, 1,
0.7038863, 0.4544222, 2.181776, 0, 0, 1, 1, 1,
0.724034, -0.9136348, 2.249277, 1, 0, 0, 1, 1,
0.7246024, -0.4386191, 2.578034, 1, 0, 0, 1, 1,
0.7301897, 0.9146074, -0.2775153, 1, 0, 0, 1, 1,
0.7323895, -0.5400023, 2.126018, 1, 0, 0, 1, 1,
0.7365635, -1.717605, 3.428411, 1, 0, 0, 1, 1,
0.7404783, -1.583553, 2.296821, 0, 0, 0, 1, 1,
0.7426538, -0.2715542, 1.377942, 0, 0, 0, 1, 1,
0.7432381, -0.4286299, 3.003426, 0, 0, 0, 1, 1,
0.7525257, 0.9656251, 0.5604542, 0, 0, 0, 1, 1,
0.7597961, -0.780943, 2.415936, 0, 0, 0, 1, 1,
0.7614616, -1.38632, 3.090993, 0, 0, 0, 1, 1,
0.7643631, 0.002822369, 2.730679, 0, 0, 0, 1, 1,
0.7681363, -0.7525803, 2.523366, 1, 1, 1, 1, 1,
0.7727187, -0.557134, 1.635905, 1, 1, 1, 1, 1,
0.7730874, 1.775642, 0.865037, 1, 1, 1, 1, 1,
0.7806645, -1.107715, 4.408551, 1, 1, 1, 1, 1,
0.7835584, -0.3080015, 3.114354, 1, 1, 1, 1, 1,
0.783658, 0.04458184, 1.651306, 1, 1, 1, 1, 1,
0.7875603, 0.271704, 2.064946, 1, 1, 1, 1, 1,
0.7907683, -0.05106987, 3.080722, 1, 1, 1, 1, 1,
0.7964144, 1.313955, -0.9216713, 1, 1, 1, 1, 1,
0.7975929, -1.147442, 2.024349, 1, 1, 1, 1, 1,
0.8044266, 0.5647876, 0.2314222, 1, 1, 1, 1, 1,
0.8077983, 1.069008, -0.3507278, 1, 1, 1, 1, 1,
0.8098155, -1.687035, 2.66292, 1, 1, 1, 1, 1,
0.8142193, 1.296208, -0.2791, 1, 1, 1, 1, 1,
0.8142481, 0.9707708, 3.285352, 1, 1, 1, 1, 1,
0.8151661, 1.715466, -0.1604027, 0, 0, 1, 1, 1,
0.8158334, -0.1731487, 4.241912, 1, 0, 0, 1, 1,
0.8188734, 1.096623, -0.3570424, 1, 0, 0, 1, 1,
0.8194283, 0.9442877, 3.119132, 1, 0, 0, 1, 1,
0.8287881, 0.0244131, 1.093509, 1, 0, 0, 1, 1,
0.8341869, 0.09500135, 1.801742, 1, 0, 0, 1, 1,
0.842977, -0.09732237, 3.185881, 0, 0, 0, 1, 1,
0.8436075, 1.13584, 0.4502183, 0, 0, 0, 1, 1,
0.849862, -1.086672, 3.403833, 0, 0, 0, 1, 1,
0.850268, -0.5768815, 2.192532, 0, 0, 0, 1, 1,
0.8507884, -0.9441161, 1.649856, 0, 0, 0, 1, 1,
0.8571243, -1.99266, 2.333913, 0, 0, 0, 1, 1,
0.8576345, -0.4746552, 1.106669, 0, 0, 0, 1, 1,
0.8613085, 2.341069, -0.3745725, 1, 1, 1, 1, 1,
0.8628597, -0.3664002, 1.608967, 1, 1, 1, 1, 1,
0.8656112, -1.843701, 3.731536, 1, 1, 1, 1, 1,
0.8656878, -2.070409, 2.047609, 1, 1, 1, 1, 1,
0.8668889, 0.7748957, 0.9013184, 1, 1, 1, 1, 1,
0.8670477, -0.5173833, 1.611727, 1, 1, 1, 1, 1,
0.8676506, 0.6224757, 0.6220906, 1, 1, 1, 1, 1,
0.8679847, 0.7551979, 2.319091, 1, 1, 1, 1, 1,
0.870378, -0.7658977, -0.258155, 1, 1, 1, 1, 1,
0.8831697, -0.2509505, 1.27862, 1, 1, 1, 1, 1,
0.8931428, 1.441101, 0.5356146, 1, 1, 1, 1, 1,
0.8932439, -1.216503, 2.769821, 1, 1, 1, 1, 1,
0.8941302, -1.997623, 3.240742, 1, 1, 1, 1, 1,
0.8967541, -0.2042248, 2.317183, 1, 1, 1, 1, 1,
0.9003227, 0.7804946, -1.432093, 1, 1, 1, 1, 1,
0.9014471, -0.8337182, 1.115281, 0, 0, 1, 1, 1,
0.9053541, 0.1342872, 2.965631, 1, 0, 0, 1, 1,
0.9055529, -0.2024069, 0.6090317, 1, 0, 0, 1, 1,
0.908035, 2.681341, 0.559046, 1, 0, 0, 1, 1,
0.9106769, 0.6092803, 0.3528023, 1, 0, 0, 1, 1,
0.9194276, -1.442766, 4.01442, 1, 0, 0, 1, 1,
0.9256021, -1.257244, 2.234162, 0, 0, 0, 1, 1,
0.9288892, 0.673339, 1.72417, 0, 0, 0, 1, 1,
0.9315023, 0.4903851, 0.09350549, 0, 0, 0, 1, 1,
0.9496531, 0.4472035, 0.6936843, 0, 0, 0, 1, 1,
0.9499084, 1.33728, -0.4268487, 0, 0, 0, 1, 1,
0.9513445, 0.4843256, 1.026848, 0, 0, 0, 1, 1,
0.9518162, -0.9152344, 1.75492, 0, 0, 0, 1, 1,
0.9547567, 0.1246465, 1.666252, 1, 1, 1, 1, 1,
0.9593267, -0.4755514, 1.405339, 1, 1, 1, 1, 1,
0.959593, 0.3247981, 1.640604, 1, 1, 1, 1, 1,
0.9598311, 1.08322, -1.163283, 1, 1, 1, 1, 1,
0.9676178, -0.6326651, 1.544528, 1, 1, 1, 1, 1,
0.9799931, 0.5695537, 2.121782, 1, 1, 1, 1, 1,
0.9804223, 0.506075, 1.066978, 1, 1, 1, 1, 1,
0.9883373, -0.4636687, 1.591612, 1, 1, 1, 1, 1,
0.9967444, -0.330712, 1.956231, 1, 1, 1, 1, 1,
1.006412, -0.7394266, 2.987623, 1, 1, 1, 1, 1,
1.007681, -1.064896, 1.40514, 1, 1, 1, 1, 1,
1.014692, 0.328313, -1.161899, 1, 1, 1, 1, 1,
1.018815, 1.468888, 0.502973, 1, 1, 1, 1, 1,
1.028231, -0.3841067, 2.507285, 1, 1, 1, 1, 1,
1.036769, 0.7564587, 0.7900388, 1, 1, 1, 1, 1,
1.043674, 0.998188, 1.389864, 0, 0, 1, 1, 1,
1.047507, 1.127366, 0.2107351, 1, 0, 0, 1, 1,
1.051563, -0.05462898, 0.8077598, 1, 0, 0, 1, 1,
1.05482, 1.686111, 2.008571, 1, 0, 0, 1, 1,
1.063673, 0.1718131, -0.8547967, 1, 0, 0, 1, 1,
1.065968, -0.2536964, 1.688216, 1, 0, 0, 1, 1,
1.072271, -1.292003, 2.832348, 0, 0, 0, 1, 1,
1.076245, 0.6234201, -1.025734, 0, 0, 0, 1, 1,
1.080528, 0.03890211, 1.816815, 0, 0, 0, 1, 1,
1.087854, 0.5415948, 0.007409799, 0, 0, 0, 1, 1,
1.101517, -0.4871212, 1.186117, 0, 0, 0, 1, 1,
1.105401, 1.184309, 2.53184, 0, 0, 0, 1, 1,
1.10839, -0.5627489, 1.81257, 0, 0, 0, 1, 1,
1.126902, -0.7376942, 3.146741, 1, 1, 1, 1, 1,
1.134886, -0.2733872, -0.4519546, 1, 1, 1, 1, 1,
1.161028, 1.164933, 0.6142298, 1, 1, 1, 1, 1,
1.164623, 1.908774, 1.103261, 1, 1, 1, 1, 1,
1.168085, 0.5425766, 0.3818528, 1, 1, 1, 1, 1,
1.170789, -1.082319, 1.378205, 1, 1, 1, 1, 1,
1.17194, -0.2380661, 0.1588619, 1, 1, 1, 1, 1,
1.172148, -0.4189974, 2.460104, 1, 1, 1, 1, 1,
1.174988, -0.2109169, 1.751197, 1, 1, 1, 1, 1,
1.191038, -1.423656, 3.909623, 1, 1, 1, 1, 1,
1.192127, 2.000086, 1.749292, 1, 1, 1, 1, 1,
1.196941, -0.8864048, 1.559236, 1, 1, 1, 1, 1,
1.198895, -0.6378, 1.40108, 1, 1, 1, 1, 1,
1.205307, 0.5462528, 1.83532, 1, 1, 1, 1, 1,
1.208084, 0.4027465, 0.5516765, 1, 1, 1, 1, 1,
1.214996, 0.3353624, 0.4457302, 0, 0, 1, 1, 1,
1.215168, -0.6240812, 1.903337, 1, 0, 0, 1, 1,
1.222843, -0.4692468, 2.259498, 1, 0, 0, 1, 1,
1.223292, 0.3001828, 0.5517098, 1, 0, 0, 1, 1,
1.234708, -0.09833841, 2.666896, 1, 0, 0, 1, 1,
1.236432, -2.01492, 3.907726, 1, 0, 0, 1, 1,
1.239534, -0.9194311, 1.754536, 0, 0, 0, 1, 1,
1.246941, 1.127118, 1.678008, 0, 0, 0, 1, 1,
1.24867, 1.214886, -1.780964, 0, 0, 0, 1, 1,
1.249564, -0.004337084, 1.093401, 0, 0, 0, 1, 1,
1.256534, 0.8910756, 1.071527, 0, 0, 0, 1, 1,
1.264372, -1.860894, 4.060995, 0, 0, 0, 1, 1,
1.272847, -0.1430987, 2.744244, 0, 0, 0, 1, 1,
1.273578, 0.1027271, 2.336026, 1, 1, 1, 1, 1,
1.279277, 0.3401597, 1.961803, 1, 1, 1, 1, 1,
1.294145, -1.050211, 2.905643, 1, 1, 1, 1, 1,
1.295879, 0.4595512, 1.416773, 1, 1, 1, 1, 1,
1.29952, 0.03066188, 2.019492, 1, 1, 1, 1, 1,
1.312067, -0.8745878, 2.798497, 1, 1, 1, 1, 1,
1.31725, 1.141958, 0.06600517, 1, 1, 1, 1, 1,
1.317394, -0.9073824, 2.615133, 1, 1, 1, 1, 1,
1.329431, 0.1162257, 1.34637, 1, 1, 1, 1, 1,
1.331781, 0.1746242, 1.04538, 1, 1, 1, 1, 1,
1.348253, 0.1197299, 2.408612, 1, 1, 1, 1, 1,
1.349526, 0.07490862, 1.546291, 1, 1, 1, 1, 1,
1.350757, -0.6557535, 0.8517587, 1, 1, 1, 1, 1,
1.376435, 1.106672, 0.6717251, 1, 1, 1, 1, 1,
1.387021, 0.15172, 2.734761, 1, 1, 1, 1, 1,
1.396359, -0.2235469, 3.2902, 0, 0, 1, 1, 1,
1.399051, 1.808797, 2.314495, 1, 0, 0, 1, 1,
1.399144, 0.9758046, 1.359783, 1, 0, 0, 1, 1,
1.410948, -0.4290274, 2.400379, 1, 0, 0, 1, 1,
1.415289, 0.6628472, 0.4788372, 1, 0, 0, 1, 1,
1.427158, 0.1227494, 1.214102, 1, 0, 0, 1, 1,
1.431256, 0.6809238, 1.654562, 0, 0, 0, 1, 1,
1.43805, -0.6974573, 1.030255, 0, 0, 0, 1, 1,
1.438891, 0.2344108, 0.3623189, 0, 0, 0, 1, 1,
1.443217, -1.619743, 1.348662, 0, 0, 0, 1, 1,
1.446304, -0.4765582, 2.364012, 0, 0, 0, 1, 1,
1.456247, -0.01259267, 2.365058, 0, 0, 0, 1, 1,
1.456455, -1.12892, 1.982117, 0, 0, 0, 1, 1,
1.456961, 1.636698, -1.495923, 1, 1, 1, 1, 1,
1.460771, 0.9928759, 1.099628, 1, 1, 1, 1, 1,
1.473636, -1.258264, 2.352958, 1, 1, 1, 1, 1,
1.48856, 0.5898388, 0.7825041, 1, 1, 1, 1, 1,
1.50569, -0.1401355, 1.529237, 1, 1, 1, 1, 1,
1.521536, -0.5784855, 1.880385, 1, 1, 1, 1, 1,
1.528819, -2.03875, 3.211699, 1, 1, 1, 1, 1,
1.544051, -0.4061446, 1.065371, 1, 1, 1, 1, 1,
1.546744, 1.005296, 2.47229, 1, 1, 1, 1, 1,
1.560416, -1.117452, 1.124041, 1, 1, 1, 1, 1,
1.560739, -1.707889, 2.009313, 1, 1, 1, 1, 1,
1.564981, 1.989006, 2.491251, 1, 1, 1, 1, 1,
1.567221, -0.8489363, 2.717665, 1, 1, 1, 1, 1,
1.573302, -0.8865213, 0.6774126, 1, 1, 1, 1, 1,
1.577511, 0.1821745, 2.093726, 1, 1, 1, 1, 1,
1.580092, 0.9486775, -0.7972083, 0, 0, 1, 1, 1,
1.585645, 0.3748267, 0.6402883, 1, 0, 0, 1, 1,
1.586671, -1.163847, 4.261037, 1, 0, 0, 1, 1,
1.588688, -1.228863, 2.171154, 1, 0, 0, 1, 1,
1.612991, -2.048833, 2.414834, 1, 0, 0, 1, 1,
1.62468, 0.4972278, 1.175515, 1, 0, 0, 1, 1,
1.633691, 0.2136642, 2.686218, 0, 0, 0, 1, 1,
1.644582, -0.0896217, 0.9657791, 0, 0, 0, 1, 1,
1.654798, 1.20226, -0.3001637, 0, 0, 0, 1, 1,
1.654815, -1.097905, 2.32078, 0, 0, 0, 1, 1,
1.661469, 0.6344441, -0.7628623, 0, 0, 0, 1, 1,
1.666795, 0.5160167, 2.251835, 0, 0, 0, 1, 1,
1.669407, 0.00277282, -0.8123906, 0, 0, 0, 1, 1,
1.684283, -0.5646628, 2.2433, 1, 1, 1, 1, 1,
1.688801, 0.3793104, 0.3963267, 1, 1, 1, 1, 1,
1.695711, -0.1236261, 2.855445, 1, 1, 1, 1, 1,
1.702648, 0.1907767, 1.889504, 1, 1, 1, 1, 1,
1.720277, 0.8754972, -0.4439676, 1, 1, 1, 1, 1,
1.739698, 1.021272, 1.915541, 1, 1, 1, 1, 1,
1.743546, 0.4598584, 0.9236857, 1, 1, 1, 1, 1,
1.775693, -0.06329065, 0.7036868, 1, 1, 1, 1, 1,
1.834854, 0.7212417, 0.8969849, 1, 1, 1, 1, 1,
1.846097, -1.149238, 2.301237, 1, 1, 1, 1, 1,
1.850947, 2.505323, -1.15805, 1, 1, 1, 1, 1,
1.858988, -0.8342351, 1.102375, 1, 1, 1, 1, 1,
1.859627, -2.036013, 2.630117, 1, 1, 1, 1, 1,
1.873328, -0.4597833, 1.092322, 1, 1, 1, 1, 1,
1.876195, 0.6950622, 1.529014, 1, 1, 1, 1, 1,
1.893645, 0.603303, 2.562759, 0, 0, 1, 1, 1,
1.923173, -0.007316555, 2.97661, 1, 0, 0, 1, 1,
1.932447, 0.05838037, 1.700873, 1, 0, 0, 1, 1,
1.985582, 0.6470792, 2.878521, 1, 0, 0, 1, 1,
1.992876, -2.27053, 4.434155, 1, 0, 0, 1, 1,
2.005041, -0.5138136, 4.118868, 1, 0, 0, 1, 1,
2.006183, -0.4113282, 3.458266, 0, 0, 0, 1, 1,
2.035653, 1.679958, 2.371947, 0, 0, 0, 1, 1,
2.047997, 1.284482, 0.7636101, 0, 0, 0, 1, 1,
2.050804, -0.9011182, -0.3259214, 0, 0, 0, 1, 1,
2.105625, -0.561218, 1.146257, 0, 0, 0, 1, 1,
2.110334, -1.274151, 1.935211, 0, 0, 0, 1, 1,
2.240622, -2.201128, 1.500501, 0, 0, 0, 1, 1,
2.26832, 1.329156, 0.2532633, 1, 1, 1, 1, 1,
2.356115, 0.1869307, 1.107627, 1, 1, 1, 1, 1,
2.455678, -0.3285088, 0.7336827, 1, 1, 1, 1, 1,
2.575014, -0.2767072, 2.114153, 1, 1, 1, 1, 1,
2.64085, -0.6353466, 3.294025, 1, 1, 1, 1, 1,
2.726525, -0.06436346, 2.183216, 1, 1, 1, 1, 1,
3.595168, 2.055544, 0.4328734, 1, 1, 1, 1, 1
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
var radius = 9.479273;
var distance = 33.29555;
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
mvMatrix.translate( -0.2429988, 0.5506674, 0.1541705 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.29555);
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
