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
-3.64341, 0.1830671, -1.773254, 1, 0, 0, 1,
-3.321027, 0.8121175, -2.877534, 1, 0.007843138, 0, 1,
-3.008335, 0.03596677, -2.212897, 1, 0.01176471, 0, 1,
-2.971984, -0.4745209, -1.08264, 1, 0.01960784, 0, 1,
-2.821079, 0.9986638, -0.4474298, 1, 0.02352941, 0, 1,
-2.818884, 0.07285885, -1.135829, 1, 0.03137255, 0, 1,
-2.672657, 0.691537, -1.428447, 1, 0.03529412, 0, 1,
-2.578418, -0.6045958, -0.8207101, 1, 0.04313726, 0, 1,
-2.570852, -2.071882, -2.993764, 1, 0.04705882, 0, 1,
-2.45071, 0.9485338, -0.3491912, 1, 0.05490196, 0, 1,
-2.421971, 0.7837812, -1.430946, 1, 0.05882353, 0, 1,
-2.340783, 1.592561, -0.3085519, 1, 0.06666667, 0, 1,
-2.327077, -0.9224347, 0.5159696, 1, 0.07058824, 0, 1,
-2.193731, -0.1587066, -0.8267054, 1, 0.07843138, 0, 1,
-2.140527, -1.548608, -2.128277, 1, 0.08235294, 0, 1,
-2.123299, -0.9635491, -0.4366525, 1, 0.09019608, 0, 1,
-2.078873, -0.3501192, -2.606992, 1, 0.09411765, 0, 1,
-2.030547, -0.355579, -1.623604, 1, 0.1019608, 0, 1,
-2.027246, 1.184649, -1.814337, 1, 0.1098039, 0, 1,
-1.986769, -0.4433117, -0.7970809, 1, 0.1137255, 0, 1,
-1.943632, -0.7977592, -0.8628955, 1, 0.1215686, 0, 1,
-1.941237, -1.442723, -0.9082851, 1, 0.1254902, 0, 1,
-1.93798, -0.6635132, -1.697293, 1, 0.1333333, 0, 1,
-1.937307, 0.07562266, -1.564142, 1, 0.1372549, 0, 1,
-1.920519, 1.701665, -1.73718, 1, 0.145098, 0, 1,
-1.903602, -0.7529261, -2.761675, 1, 0.1490196, 0, 1,
-1.865773, -1.160775, -1.682686, 1, 0.1568628, 0, 1,
-1.856781, -1.255351, -3.130353, 1, 0.1607843, 0, 1,
-1.849356, -0.3590017, -0.9997054, 1, 0.1686275, 0, 1,
-1.848092, 1.507554, -1.06562, 1, 0.172549, 0, 1,
-1.847267, 0.8538265, -2.338633, 1, 0.1803922, 0, 1,
-1.846164, 1.103518, -1.044083, 1, 0.1843137, 0, 1,
-1.830942, -1.090312, -0.6535563, 1, 0.1921569, 0, 1,
-1.792949, 1.395163, -1.052231, 1, 0.1960784, 0, 1,
-1.789637, -0.8239434, -2.71395, 1, 0.2039216, 0, 1,
-1.789362, 0.4429018, -2.922865, 1, 0.2117647, 0, 1,
-1.773367, -0.6274542, -3.007874, 1, 0.2156863, 0, 1,
-1.771872, 0.5329214, -1.252176, 1, 0.2235294, 0, 1,
-1.768471, -0.001816813, -0.3187922, 1, 0.227451, 0, 1,
-1.762547, 0.1478111, -2.015144, 1, 0.2352941, 0, 1,
-1.747518, -1.55612, -1.158583, 1, 0.2392157, 0, 1,
-1.744468, 0.7004901, -0.7459072, 1, 0.2470588, 0, 1,
-1.734753, 0.06855351, -0.2386325, 1, 0.2509804, 0, 1,
-1.714278, 1.107422, -1.286641, 1, 0.2588235, 0, 1,
-1.711918, -0.7759601, 0.2411762, 1, 0.2627451, 0, 1,
-1.707788, 0.04592413, 0.557936, 1, 0.2705882, 0, 1,
-1.69021, -1.145731, -2.371568, 1, 0.2745098, 0, 1,
-1.662634, -0.3729034, -1.239074, 1, 0.282353, 0, 1,
-1.650682, -0.3397449, -1.748731, 1, 0.2862745, 0, 1,
-1.617261, 0.3323611, -0.8004591, 1, 0.2941177, 0, 1,
-1.596902, 0.9146692, 0.3582249, 1, 0.3019608, 0, 1,
-1.590133, -1.276285, -0.6097572, 1, 0.3058824, 0, 1,
-1.589314, 1.296455, -2.222854, 1, 0.3137255, 0, 1,
-1.583725, 0.1815477, -0.9587734, 1, 0.3176471, 0, 1,
-1.580495, -0.7878201, -1.706058, 1, 0.3254902, 0, 1,
-1.580017, -0.9380065, -2.911468, 1, 0.3294118, 0, 1,
-1.556857, -0.4171287, -0.6255206, 1, 0.3372549, 0, 1,
-1.55122, -0.5797496, -3.057501, 1, 0.3411765, 0, 1,
-1.518428, -0.194629, -2.151945, 1, 0.3490196, 0, 1,
-1.517311, -0.3470568, -0.9373274, 1, 0.3529412, 0, 1,
-1.510165, 0.7640137, -0.7696515, 1, 0.3607843, 0, 1,
-1.502437, 0.4523438, 0.1531568, 1, 0.3647059, 0, 1,
-1.483394, 1.32574, -1.4552, 1, 0.372549, 0, 1,
-1.476665, -0.3689536, -2.192012, 1, 0.3764706, 0, 1,
-1.471782, -1.027107, -2.447418, 1, 0.3843137, 0, 1,
-1.464514, 0.5064388, -1.726963, 1, 0.3882353, 0, 1,
-1.460832, -0.0968001, -3.110252, 1, 0.3960784, 0, 1,
-1.459394, -0.5310053, -1.498347, 1, 0.4039216, 0, 1,
-1.445722, 0.04246151, -1.669922, 1, 0.4078431, 0, 1,
-1.424024, 0.4994289, -2.540557, 1, 0.4156863, 0, 1,
-1.401629, -0.8689824, -3.213784, 1, 0.4196078, 0, 1,
-1.39906, 0.7710709, -0.8470544, 1, 0.427451, 0, 1,
-1.398664, -0.4577976, -1.246352, 1, 0.4313726, 0, 1,
-1.38905, 0.1992665, -1.299211, 1, 0.4392157, 0, 1,
-1.381369, -0.05058281, -2.548878, 1, 0.4431373, 0, 1,
-1.380498, -0.7917413, -3.130248, 1, 0.4509804, 0, 1,
-1.375857, 1.405276, -0.9124221, 1, 0.454902, 0, 1,
-1.372999, -0.3945913, -1.832253, 1, 0.4627451, 0, 1,
-1.370484, 0.627836, -2.712879, 1, 0.4666667, 0, 1,
-1.361538, 0.6669911, -2.28117, 1, 0.4745098, 0, 1,
-1.348321, -1.156926, -1.969933, 1, 0.4784314, 0, 1,
-1.330671, -0.113111, -3.003154, 1, 0.4862745, 0, 1,
-1.330206, 0.7336492, -0.3520104, 1, 0.4901961, 0, 1,
-1.329293, -0.1780962, -0.50314, 1, 0.4980392, 0, 1,
-1.328769, -0.5615242, -1.030753, 1, 0.5058824, 0, 1,
-1.322779, 0.8619186, -1.664292, 1, 0.509804, 0, 1,
-1.304792, 0.2422145, -1.452817, 1, 0.5176471, 0, 1,
-1.303762, 1.057212, -0.4662324, 1, 0.5215687, 0, 1,
-1.297352, -1.420383, -1.110623, 1, 0.5294118, 0, 1,
-1.292341, -0.2818434, -0.9125484, 1, 0.5333334, 0, 1,
-1.289684, 2.344738, -0.07105057, 1, 0.5411765, 0, 1,
-1.286023, 0.3261575, -1.691333, 1, 0.5450981, 0, 1,
-1.278851, 0.4978854, -0.3011665, 1, 0.5529412, 0, 1,
-1.273499, 1.261925, -0.04892931, 1, 0.5568628, 0, 1,
-1.269549, -0.4485655, -4.176863, 1, 0.5647059, 0, 1,
-1.268291, -0.0314723, -2.509514, 1, 0.5686275, 0, 1,
-1.253535, 1.374013, -1.043087, 1, 0.5764706, 0, 1,
-1.249117, -0.1454174, -0.1274197, 1, 0.5803922, 0, 1,
-1.24227, -0.9005616, -3.663828, 1, 0.5882353, 0, 1,
-1.238546, -1.516068, -1.878368, 1, 0.5921569, 0, 1,
-1.229142, 0.07089791, -1.845536, 1, 0.6, 0, 1,
-1.228513, 0.9564646, -1.919132, 1, 0.6078432, 0, 1,
-1.223483, -1.44767, -1.726941, 1, 0.6117647, 0, 1,
-1.220026, 0.1736504, -1.055986, 1, 0.6196079, 0, 1,
-1.220014, 0.4175098, -1.708382, 1, 0.6235294, 0, 1,
-1.218624, 1.123939, 0.03079484, 1, 0.6313726, 0, 1,
-1.217701, 1.278336, -0.6863785, 1, 0.6352941, 0, 1,
-1.21561, 0.2091664, -2.643242, 1, 0.6431373, 0, 1,
-1.206204, 3.355192, 0.7204158, 1, 0.6470588, 0, 1,
-1.204523, 0.2458952, -1.478203, 1, 0.654902, 0, 1,
-1.196509, -0.1115713, -2.593484, 1, 0.6588235, 0, 1,
-1.195833, -0.670681, -0.5317487, 1, 0.6666667, 0, 1,
-1.194101, 0.2166046, -1.313467, 1, 0.6705883, 0, 1,
-1.189874, 0.812793, 0.3975265, 1, 0.6784314, 0, 1,
-1.183738, -1.657547, -2.376199, 1, 0.682353, 0, 1,
-1.183432, 0.6662114, -2.717451, 1, 0.6901961, 0, 1,
-1.177374, 1.403966, -0.7594072, 1, 0.6941177, 0, 1,
-1.172447, 0.6872637, -0.9929293, 1, 0.7019608, 0, 1,
-1.168376, 0.8921466, -0.6744408, 1, 0.7098039, 0, 1,
-1.156218, 0.5793245, 0.9834079, 1, 0.7137255, 0, 1,
-1.1528, 1.229639, -1.140448, 1, 0.7215686, 0, 1,
-1.148258, -0.08489946, -2.408312, 1, 0.7254902, 0, 1,
-1.137606, -0.8342897, -2.844429, 1, 0.7333333, 0, 1,
-1.130924, -0.2479553, -2.786537, 1, 0.7372549, 0, 1,
-1.123748, 0.4736343, -0.6739296, 1, 0.7450981, 0, 1,
-1.121453, 0.4006265, 0.6854708, 1, 0.7490196, 0, 1,
-1.114528, 0.3886608, -0.9904484, 1, 0.7568628, 0, 1,
-1.105768, -0.4259703, 0.3196225, 1, 0.7607843, 0, 1,
-1.088654, 0.9357846, -0.6362836, 1, 0.7686275, 0, 1,
-1.087493, 0.9675481, -0.8325983, 1, 0.772549, 0, 1,
-1.078121, -1.504156, -2.528054, 1, 0.7803922, 0, 1,
-1.075135, -0.205184, -0.2071186, 1, 0.7843137, 0, 1,
-1.074683, 1.481924, -0.3698444, 1, 0.7921569, 0, 1,
-1.073933, -1.600887, -1.439826, 1, 0.7960784, 0, 1,
-1.06752, 0.9417076, -0.7201228, 1, 0.8039216, 0, 1,
-1.066601, -0.9540647, -1.864016, 1, 0.8117647, 0, 1,
-1.065844, -0.6144294, -1.43332, 1, 0.8156863, 0, 1,
-1.064152, 0.8602509, -1.185041, 1, 0.8235294, 0, 1,
-1.061136, 0.3723993, -1.965053, 1, 0.827451, 0, 1,
-1.053516, -0.2496834, -1.592272, 1, 0.8352941, 0, 1,
-1.044756, -0.205086, -1.502095, 1, 0.8392157, 0, 1,
-1.04455, -0.7463945, -1.559875, 1, 0.8470588, 0, 1,
-1.039136, 0.7395608, -1.25771, 1, 0.8509804, 0, 1,
-1.036635, -1.595958, -2.627507, 1, 0.8588235, 0, 1,
-1.036191, 1.408645, -0.07591633, 1, 0.8627451, 0, 1,
-1.033314, -1.364208, -2.308947, 1, 0.8705882, 0, 1,
-1.031756, 0.4990746, -2.779752, 1, 0.8745098, 0, 1,
-1.030345, -1.185928, -1.866727, 1, 0.8823529, 0, 1,
-1.029945, 0.379151, -2.037017, 1, 0.8862745, 0, 1,
-1.028539, 0.6511595, -0.982908, 1, 0.8941177, 0, 1,
-1.018641, 3.014049, -0.4326071, 1, 0.8980392, 0, 1,
-1.017292, -1.210931, -0.9585389, 1, 0.9058824, 0, 1,
-1.015208, -1.049683, -2.743975, 1, 0.9137255, 0, 1,
-0.9991547, -1.293367, -3.617726, 1, 0.9176471, 0, 1,
-0.9953531, -0.7565925, -2.340875, 1, 0.9254902, 0, 1,
-0.991581, 0.2464547, -0.4035389, 1, 0.9294118, 0, 1,
-0.9841546, -0.6556669, -1.490355, 1, 0.9372549, 0, 1,
-0.9789454, -0.3053628, -0.8598204, 1, 0.9411765, 0, 1,
-0.9763888, -0.5659269, -1.816474, 1, 0.9490196, 0, 1,
-0.9734123, 1.6906, -0.06737675, 1, 0.9529412, 0, 1,
-0.9689721, -1.226933, -1.31136, 1, 0.9607843, 0, 1,
-0.9672168, 0.3091682, -0.8500731, 1, 0.9647059, 0, 1,
-0.9649978, -2.091804, -5.622212, 1, 0.972549, 0, 1,
-0.9510498, 1.548995, -0.03313648, 1, 0.9764706, 0, 1,
-0.9482367, -0.5419368, -4.104036, 1, 0.9843137, 0, 1,
-0.9474025, 0.6486099, -1.619245, 1, 0.9882353, 0, 1,
-0.9436314, 0.03676194, -2.351253, 1, 0.9960784, 0, 1,
-0.9252024, 1.297203, -1.149792, 0.9960784, 1, 0, 1,
-0.9245765, -1.257511, -3.119545, 0.9921569, 1, 0, 1,
-0.91925, 0.3890307, -0.9589418, 0.9843137, 1, 0, 1,
-0.9149697, 1.038956, 0.2888558, 0.9803922, 1, 0, 1,
-0.9118153, 0.7747517, -1.734773, 0.972549, 1, 0, 1,
-0.9113685, 1.09306, -1.619183, 0.9686275, 1, 0, 1,
-0.8837721, -2.218702, -3.321549, 0.9607843, 1, 0, 1,
-0.8824045, -2.412266, -2.531243, 0.9568627, 1, 0, 1,
-0.8738855, -1.084969, -1.770561, 0.9490196, 1, 0, 1,
-0.8723915, 1.402724, 0.3632785, 0.945098, 1, 0, 1,
-0.8686628, 2.981908, -0.9308984, 0.9372549, 1, 0, 1,
-0.867905, -0.06736233, -3.860384, 0.9333333, 1, 0, 1,
-0.8628961, 0.2649064, -1.239915, 0.9254902, 1, 0, 1,
-0.8563763, 1.941937, 0.1148791, 0.9215686, 1, 0, 1,
-0.8558552, 0.3548674, -0.6955871, 0.9137255, 1, 0, 1,
-0.8479916, 1.343477, -1.266845, 0.9098039, 1, 0, 1,
-0.8462341, 0.3724638, -2.367069, 0.9019608, 1, 0, 1,
-0.8398242, 0.2651754, -0.4488107, 0.8941177, 1, 0, 1,
-0.8303364, -0.5153794, -0.6507181, 0.8901961, 1, 0, 1,
-0.8188043, -1.616194, -1.304198, 0.8823529, 1, 0, 1,
-0.8174672, -1.157051, -3.438713, 0.8784314, 1, 0, 1,
-0.8148121, 1.369055, -1.939715, 0.8705882, 1, 0, 1,
-0.7992017, 0.9571796, 2.890758, 0.8666667, 1, 0, 1,
-0.7903124, -0.3239092, 0.2259174, 0.8588235, 1, 0, 1,
-0.7805002, 0.5569177, -0.9072694, 0.854902, 1, 0, 1,
-0.7723179, -2.78144, -2.078781, 0.8470588, 1, 0, 1,
-0.76631, -1.418955, -2.920273, 0.8431373, 1, 0, 1,
-0.7659661, 0.1191271, -0.936031, 0.8352941, 1, 0, 1,
-0.7586257, 0.00677203, -0.2800107, 0.8313726, 1, 0, 1,
-0.7541888, 1.361707, -2.982489, 0.8235294, 1, 0, 1,
-0.7484639, 1.416918, -1.215769, 0.8196079, 1, 0, 1,
-0.7466603, -0.2049679, -0.9467722, 0.8117647, 1, 0, 1,
-0.744294, 0.112397, -1.285684, 0.8078431, 1, 0, 1,
-0.7400613, 1.667225, 1.102751, 0.8, 1, 0, 1,
-0.7386273, 0.756822, -0.9010139, 0.7921569, 1, 0, 1,
-0.7350278, -1.695382, -2.528867, 0.7882353, 1, 0, 1,
-0.7328262, -0.4496325, -3.571431, 0.7803922, 1, 0, 1,
-0.7157059, 0.2559698, -0.7418681, 0.7764706, 1, 0, 1,
-0.7141866, -0.5609137, -2.427617, 0.7686275, 1, 0, 1,
-0.7137421, -2.062113, -3.634096, 0.7647059, 1, 0, 1,
-0.7102465, -1.691135, -4.117804, 0.7568628, 1, 0, 1,
-0.7087039, -0.5812107, -2.356156, 0.7529412, 1, 0, 1,
-0.7050305, -1.990467, -2.737838, 0.7450981, 1, 0, 1,
-0.7032915, -1.558295, -2.243335, 0.7411765, 1, 0, 1,
-0.7029208, 0.7452786, -0.8185872, 0.7333333, 1, 0, 1,
-0.7023434, 0.2160629, -1.115303, 0.7294118, 1, 0, 1,
-0.69397, -0.08045624, -1.683791, 0.7215686, 1, 0, 1,
-0.6924407, 0.4623266, -1.414934, 0.7176471, 1, 0, 1,
-0.6903825, -0.7512214, -1.728879, 0.7098039, 1, 0, 1,
-0.6895697, 0.670426, -1.78987, 0.7058824, 1, 0, 1,
-0.6892791, 1.668949, 1.735971, 0.6980392, 1, 0, 1,
-0.6879518, -0.02478842, -2.194302, 0.6901961, 1, 0, 1,
-0.6798061, 1.643783, -0.2433818, 0.6862745, 1, 0, 1,
-0.6791067, -0.2128918, -0.6121269, 0.6784314, 1, 0, 1,
-0.6778178, 1.347376, -0.7910314, 0.6745098, 1, 0, 1,
-0.6762262, 1.001895, -2.400748, 0.6666667, 1, 0, 1,
-0.6759136, 0.04724734, -2.344014, 0.6627451, 1, 0, 1,
-0.6751925, 1.870491, -1.428225, 0.654902, 1, 0, 1,
-0.6748023, -0.9129221, -2.753587, 0.6509804, 1, 0, 1,
-0.6734586, -0.4690346, -0.4796233, 0.6431373, 1, 0, 1,
-0.6661437, 0.2341816, -1.584578, 0.6392157, 1, 0, 1,
-0.6653481, 0.1584885, 0.3422758, 0.6313726, 1, 0, 1,
-0.6622955, -0.08658691, -1.276441, 0.627451, 1, 0, 1,
-0.64766, 0.1658591, -0.04206331, 0.6196079, 1, 0, 1,
-0.6400731, -0.3010694, -1.205649, 0.6156863, 1, 0, 1,
-0.6398872, 0.06693552, -0.9292135, 0.6078432, 1, 0, 1,
-0.6392022, 0.2303063, -1.224622, 0.6039216, 1, 0, 1,
-0.6349271, 0.8014622, -0.5985649, 0.5960785, 1, 0, 1,
-0.631797, -1.130289, -3.441958, 0.5882353, 1, 0, 1,
-0.6316333, -1.19521, -1.778971, 0.5843138, 1, 0, 1,
-0.6211887, -1.556283, -2.497186, 0.5764706, 1, 0, 1,
-0.6200008, 0.8912345, 0.4250486, 0.572549, 1, 0, 1,
-0.6194369, -1.628807, -4.07193, 0.5647059, 1, 0, 1,
-0.6161758, 0.4596459, -2.6617, 0.5607843, 1, 0, 1,
-0.6152638, 0.4620093, -0.9806705, 0.5529412, 1, 0, 1,
-0.612943, 0.737996, 1.07765, 0.5490196, 1, 0, 1,
-0.6117443, -0.8698168, -1.193849, 0.5411765, 1, 0, 1,
-0.6052319, 0.5249914, -1.442149, 0.5372549, 1, 0, 1,
-0.6028078, -0.3513748, -1.587993, 0.5294118, 1, 0, 1,
-0.6017467, 0.7721087, 0.2459181, 0.5254902, 1, 0, 1,
-0.5921019, -0.5524722, -1.315765, 0.5176471, 1, 0, 1,
-0.5920868, 1.76679, 0.2126448, 0.5137255, 1, 0, 1,
-0.5918534, -1.537274, -2.33531, 0.5058824, 1, 0, 1,
-0.5846345, 0.7258646, -1.519927, 0.5019608, 1, 0, 1,
-0.5830968, 0.7745132, -1.444835, 0.4941176, 1, 0, 1,
-0.5810189, 0.7265148, -2.004007, 0.4862745, 1, 0, 1,
-0.5801819, 0.3805979, -0.6828993, 0.4823529, 1, 0, 1,
-0.5793364, 1.662343, -0.3372912, 0.4745098, 1, 0, 1,
-0.5769146, -1.236507, -5.017761, 0.4705882, 1, 0, 1,
-0.5767114, -1.489842, -2.506623, 0.4627451, 1, 0, 1,
-0.576706, -0.08695045, -1.945541, 0.4588235, 1, 0, 1,
-0.570934, 0.6764463, -0.6299098, 0.4509804, 1, 0, 1,
-0.5692987, -0.01838798, -0.7104728, 0.4470588, 1, 0, 1,
-0.5692574, 0.5333398, -1.625794, 0.4392157, 1, 0, 1,
-0.5660485, 1.050074, -0.04180419, 0.4352941, 1, 0, 1,
-0.5623332, 0.2708068, -1.266209, 0.427451, 1, 0, 1,
-0.5609159, 1.903986, 0.8145572, 0.4235294, 1, 0, 1,
-0.5600022, -0.6628714, -2.501487, 0.4156863, 1, 0, 1,
-0.558694, 0.04382247, -2.088386, 0.4117647, 1, 0, 1,
-0.5571231, 1.441159, 0.1308096, 0.4039216, 1, 0, 1,
-0.5484122, -1.183323, -4.368607, 0.3960784, 1, 0, 1,
-0.5461548, 0.6802961, -0.753328, 0.3921569, 1, 0, 1,
-0.5447078, -0.00804421, -2.288686, 0.3843137, 1, 0, 1,
-0.5365419, 0.5889513, -2.614928, 0.3803922, 1, 0, 1,
-0.5352035, -1.317092, -0.1748672, 0.372549, 1, 0, 1,
-0.5346436, -0.9949726, -3.275402, 0.3686275, 1, 0, 1,
-0.53127, 1.167612, -1.662799, 0.3607843, 1, 0, 1,
-0.5292161, 1.146675, -2.772697, 0.3568628, 1, 0, 1,
-0.5257039, -2.850727, -3.885965, 0.3490196, 1, 0, 1,
-0.5232987, -0.6351807, -0.5373302, 0.345098, 1, 0, 1,
-0.5205703, 0.3923509, -2.795259, 0.3372549, 1, 0, 1,
-0.5146998, 0.2293647, 0.2233872, 0.3333333, 1, 0, 1,
-0.5118684, 0.6189527, 0.6889253, 0.3254902, 1, 0, 1,
-0.5071877, -1.234211, -1.382208, 0.3215686, 1, 0, 1,
-0.5051351, -0.4052567, -2.350924, 0.3137255, 1, 0, 1,
-0.5006254, -0.9135247, -2.998363, 0.3098039, 1, 0, 1,
-0.4999737, 1.854292, 1.008599, 0.3019608, 1, 0, 1,
-0.4996847, -1.234271, -3.87691, 0.2941177, 1, 0, 1,
-0.496608, 0.3986486, -0.3637643, 0.2901961, 1, 0, 1,
-0.4950311, 1.431948, -1.9781, 0.282353, 1, 0, 1,
-0.494633, 0.9027978, -1.201322, 0.2784314, 1, 0, 1,
-0.4927475, -0.6405926, -2.773875, 0.2705882, 1, 0, 1,
-0.4925948, 0.7693821, -0.4197125, 0.2666667, 1, 0, 1,
-0.4876084, 0.7078057, -2.998253, 0.2588235, 1, 0, 1,
-0.4868371, -0.4034318, -2.934127, 0.254902, 1, 0, 1,
-0.4851154, 1.053952, -0.8735802, 0.2470588, 1, 0, 1,
-0.4827044, -0.4485359, -1.550998, 0.2431373, 1, 0, 1,
-0.4794301, 0.3306215, 0.2069299, 0.2352941, 1, 0, 1,
-0.4765577, -0.7883775, -1.508641, 0.2313726, 1, 0, 1,
-0.4754138, -0.2219607, -1.408946, 0.2235294, 1, 0, 1,
-0.4748981, 0.9485636, -0.4617364, 0.2196078, 1, 0, 1,
-0.4705596, 0.790558, -0.8312182, 0.2117647, 1, 0, 1,
-0.4664393, -0.1181119, -1.60609, 0.2078431, 1, 0, 1,
-0.4641912, 1.011532, -2.568283, 0.2, 1, 0, 1,
-0.46174, -0.846427, -2.257434, 0.1921569, 1, 0, 1,
-0.4606266, -0.3162216, -1.405453, 0.1882353, 1, 0, 1,
-0.4591813, 0.5140049, -0.5524681, 0.1803922, 1, 0, 1,
-0.4582942, -0.8906331, -1.01226, 0.1764706, 1, 0, 1,
-0.456453, -1.304245, -3.769803, 0.1686275, 1, 0, 1,
-0.4499491, 0.2427527, -2.598051, 0.1647059, 1, 0, 1,
-0.4439822, -0.8306587, -3.564773, 0.1568628, 1, 0, 1,
-0.4436613, 1.005537, 1.548917, 0.1529412, 1, 0, 1,
-0.4365332, 0.7463515, 0.1764176, 0.145098, 1, 0, 1,
-0.4347278, -0.8032243, -3.114446, 0.1411765, 1, 0, 1,
-0.4314802, -1.052283, -2.000013, 0.1333333, 1, 0, 1,
-0.4314318, -0.4526404, -1.608518, 0.1294118, 1, 0, 1,
-0.4275577, 0.820672, -0.008795643, 0.1215686, 1, 0, 1,
-0.4258525, 0.7170695, -0.5982896, 0.1176471, 1, 0, 1,
-0.4257262, 0.7185761, -0.4140844, 0.1098039, 1, 0, 1,
-0.4232991, 0.8610086, -1.871532, 0.1058824, 1, 0, 1,
-0.4219958, 0.1857385, -1.851422, 0.09803922, 1, 0, 1,
-0.4209366, 0.3355343, -2.108137, 0.09019608, 1, 0, 1,
-0.4194365, -0.5301522, -2.319817, 0.08627451, 1, 0, 1,
-0.4171352, -0.3694681, -2.325702, 0.07843138, 1, 0, 1,
-0.4153558, 0.07530007, -1.55111, 0.07450981, 1, 0, 1,
-0.4153036, 0.0773901, -1.162911, 0.06666667, 1, 0, 1,
-0.4148749, 1.135138, -2.243121, 0.0627451, 1, 0, 1,
-0.4143353, -0.8588652, -1.190277, 0.05490196, 1, 0, 1,
-0.4112445, 0.2345394, -1.566041, 0.05098039, 1, 0, 1,
-0.4047185, -0.8898929, -3.167676, 0.04313726, 1, 0, 1,
-0.4031851, 1.391348, -0.321111, 0.03921569, 1, 0, 1,
-0.4020996, 0.9559757, -1.012584, 0.03137255, 1, 0, 1,
-0.4002923, 1.248702, -0.9434443, 0.02745098, 1, 0, 1,
-0.3989181, -1.279482, -1.976022, 0.01960784, 1, 0, 1,
-0.3976476, 0.1387804, -2.385122, 0.01568628, 1, 0, 1,
-0.395653, -0.6738964, -0.003428455, 0.007843138, 1, 0, 1,
-0.3944854, 1.277037, -0.4915386, 0.003921569, 1, 0, 1,
-0.3897724, -1.13216, -4.161414, 0, 1, 0.003921569, 1,
-0.3861581, 1.093391, 1.103462, 0, 1, 0.01176471, 1,
-0.3811255, 1.64735, -0.5229086, 0, 1, 0.01568628, 1,
-0.3788899, 2.004136, -0.7451954, 0, 1, 0.02352941, 1,
-0.3746052, -1.107159, -3.34058, 0, 1, 0.02745098, 1,
-0.3729754, -0.153041, -1.621994, 0, 1, 0.03529412, 1,
-0.3711098, 0.4326259, -1.858282, 0, 1, 0.03921569, 1,
-0.3710315, -0.9160143, -0.5183562, 0, 1, 0.04705882, 1,
-0.3644264, 0.1714595, -2.009444, 0, 1, 0.05098039, 1,
-0.3640211, -1.029393, -1.757359, 0, 1, 0.05882353, 1,
-0.3589627, 0.7958912, 0.08864656, 0, 1, 0.0627451, 1,
-0.3584432, 1.623585, -0.6273365, 0, 1, 0.07058824, 1,
-0.356321, 0.4474172, 0.2286686, 0, 1, 0.07450981, 1,
-0.3538658, 1.010136, -1.328937, 0, 1, 0.08235294, 1,
-0.3529772, -0.3280456, -3.875505, 0, 1, 0.08627451, 1,
-0.3522184, 0.565226, 0.01163313, 0, 1, 0.09411765, 1,
-0.3506738, 0.2147997, -0.8857702, 0, 1, 0.1019608, 1,
-0.3435688, -0.7843956, -2.111614, 0, 1, 0.1058824, 1,
-0.3427395, 0.2613476, -0.7127597, 0, 1, 0.1137255, 1,
-0.3341095, 0.9464575, -0.5441855, 0, 1, 0.1176471, 1,
-0.3326484, 1.101747, -1.205367, 0, 1, 0.1254902, 1,
-0.3312683, -1.399281, -2.742965, 0, 1, 0.1294118, 1,
-0.3308456, -0.07028504, -0.9886841, 0, 1, 0.1372549, 1,
-0.3295215, 1.206861, 0.07202974, 0, 1, 0.1411765, 1,
-0.3268662, -1.013958, -4.306015, 0, 1, 0.1490196, 1,
-0.3241692, -1.172661, -3.238232, 0, 1, 0.1529412, 1,
-0.323893, -0.7423744, -2.594532, 0, 1, 0.1607843, 1,
-0.3231218, 0.1224313, -0.7141672, 0, 1, 0.1647059, 1,
-0.3205306, 2.562505, 0.300934, 0, 1, 0.172549, 1,
-0.3150971, 1.772639, 0.4809951, 0, 1, 0.1764706, 1,
-0.3143324, 0.3338366, -2.172331, 0, 1, 0.1843137, 1,
-0.3094377, -0.07440475, -2.790729, 0, 1, 0.1882353, 1,
-0.3036791, -0.991834, -2.365653, 0, 1, 0.1960784, 1,
-0.2977642, -1.844502, -3.1914, 0, 1, 0.2039216, 1,
-0.2974577, 0.08913625, -0.9841216, 0, 1, 0.2078431, 1,
-0.2942294, -0.6125687, -0.8098405, 0, 1, 0.2156863, 1,
-0.2933687, -0.5451899, -1.958489, 0, 1, 0.2196078, 1,
-0.2905215, -0.03731714, -3.413566, 0, 1, 0.227451, 1,
-0.2885911, 2.905898, -1.339381, 0, 1, 0.2313726, 1,
-0.285614, -0.6571254, -4.088254, 0, 1, 0.2392157, 1,
-0.2841364, -1.101291, -1.452264, 0, 1, 0.2431373, 1,
-0.2827051, -0.5283241, -2.729251, 0, 1, 0.2509804, 1,
-0.2816325, 0.009011314, -0.2968559, 0, 1, 0.254902, 1,
-0.2782861, -0.4809456, -0.9970561, 0, 1, 0.2627451, 1,
-0.2760921, -0.4176448, -3.329989, 0, 1, 0.2666667, 1,
-0.2735715, -1.421721, -2.648694, 0, 1, 0.2745098, 1,
-0.2665627, 0.323474, -1.360971, 0, 1, 0.2784314, 1,
-0.2594586, 0.1194359, -1.067634, 0, 1, 0.2862745, 1,
-0.2593785, 0.3156398, -0.2762283, 0, 1, 0.2901961, 1,
-0.2590494, -1.726035, -3.541235, 0, 1, 0.2980392, 1,
-0.2582442, 0.6508945, 0.9390262, 0, 1, 0.3058824, 1,
-0.2562642, -0.008773074, -0.8964518, 0, 1, 0.3098039, 1,
-0.2556414, -0.3956837, -2.482554, 0, 1, 0.3176471, 1,
-0.2531065, -1.108501, -2.764349, 0, 1, 0.3215686, 1,
-0.2530679, -1.982623, -2.704917, 0, 1, 0.3294118, 1,
-0.251256, 1.030179, -0.895318, 0, 1, 0.3333333, 1,
-0.2426574, 1.581562, 1.244685, 0, 1, 0.3411765, 1,
-0.2401235, 1.510986, -0.8268816, 0, 1, 0.345098, 1,
-0.2367734, 0.3910974, -0.1325819, 0, 1, 0.3529412, 1,
-0.2314355, 0.8684404, -0.2359187, 0, 1, 0.3568628, 1,
-0.2301596, -0.4651386, -0.183034, 0, 1, 0.3647059, 1,
-0.229569, 0.3148537, -0.8771774, 0, 1, 0.3686275, 1,
-0.2274329, -0.06721615, -3.336446, 0, 1, 0.3764706, 1,
-0.2219108, 0.9439474, -0.8327521, 0, 1, 0.3803922, 1,
-0.2198527, 1.326808, -1.780626, 0, 1, 0.3882353, 1,
-0.2139456, -0.6349895, -3.803421, 0, 1, 0.3921569, 1,
-0.2072573, -0.2543636, -2.440327, 0, 1, 0.4, 1,
-0.2036338, 0.2738326, -0.6094438, 0, 1, 0.4078431, 1,
-0.2018341, -0.3109019, -1.339745, 0, 1, 0.4117647, 1,
-0.1996416, -0.3150599, -3.17278, 0, 1, 0.4196078, 1,
-0.1967209, -0.8718068, -1.846826, 0, 1, 0.4235294, 1,
-0.1950711, 2.998509, -1.315128, 0, 1, 0.4313726, 1,
-0.1895594, 0.4550156, 0.9151422, 0, 1, 0.4352941, 1,
-0.1863108, 0.4714245, 0.1702322, 0, 1, 0.4431373, 1,
-0.184133, -0.7689937, -4.070529, 0, 1, 0.4470588, 1,
-0.1841118, 0.2642535, -0.21665, 0, 1, 0.454902, 1,
-0.1756529, -0.1697103, -1.449935, 0, 1, 0.4588235, 1,
-0.1754615, -0.6118402, -2.107271, 0, 1, 0.4666667, 1,
-0.1725411, 0.2469711, 0.5356948, 0, 1, 0.4705882, 1,
-0.1635364, -0.1253711, -2.729285, 0, 1, 0.4784314, 1,
-0.1615479, -2.33764, -3.90954, 0, 1, 0.4823529, 1,
-0.1611478, -0.4170799, -1.13664, 0, 1, 0.4901961, 1,
-0.1577993, 0.4558022, 0.6293424, 0, 1, 0.4941176, 1,
-0.1472449, -0.3473046, -5.679611, 0, 1, 0.5019608, 1,
-0.1471188, -1.542149, -1.725356, 0, 1, 0.509804, 1,
-0.1443052, -1.169626, -4.257415, 0, 1, 0.5137255, 1,
-0.1400128, -0.1517624, -2.250026, 0, 1, 0.5215687, 1,
-0.1388807, 0.5278185, 2.194996, 0, 1, 0.5254902, 1,
-0.1371213, 1.511204, -0.6669256, 0, 1, 0.5333334, 1,
-0.136405, -0.3915157, -3.870982, 0, 1, 0.5372549, 1,
-0.1356631, -0.7670407, -2.730939, 0, 1, 0.5450981, 1,
-0.1298606, 1.097022, -0.5429678, 0, 1, 0.5490196, 1,
-0.1269529, 1.011812, 0.5252463, 0, 1, 0.5568628, 1,
-0.1247735, -0.8238273, -2.714561, 0, 1, 0.5607843, 1,
-0.119906, 0.2374701, -0.8471895, 0, 1, 0.5686275, 1,
-0.1197291, 0.5803466, -0.4714248, 0, 1, 0.572549, 1,
-0.1162263, 0.5766776, -1.274292, 0, 1, 0.5803922, 1,
-0.1153482, -0.29759, -4.384686, 0, 1, 0.5843138, 1,
-0.1109937, 2.032279, 0.8629965, 0, 1, 0.5921569, 1,
-0.1109541, -1.671596, -2.550997, 0, 1, 0.5960785, 1,
-0.1096325, 0.004559406, -1.177835, 0, 1, 0.6039216, 1,
-0.1079738, -0.8029346, -3.217362, 0, 1, 0.6117647, 1,
-0.1036515, 0.9652697, -2.702713, 0, 1, 0.6156863, 1,
-0.09907866, -0.5939332, -3.643902, 0, 1, 0.6235294, 1,
-0.09905738, -0.8229287, -3.210412, 0, 1, 0.627451, 1,
-0.09628374, -0.0084926, -1.64078, 0, 1, 0.6352941, 1,
-0.09432969, -1.09694, -2.937253, 0, 1, 0.6392157, 1,
-0.09354708, 1.762325, -0.2866326, 0, 1, 0.6470588, 1,
-0.09136323, 0.225379, -0.3591709, 0, 1, 0.6509804, 1,
-0.09083451, 0.9221934, 0.1508817, 0, 1, 0.6588235, 1,
-0.08296599, -0.6501623, -2.494789, 0, 1, 0.6627451, 1,
-0.08095599, -1.120205, -2.853941, 0, 1, 0.6705883, 1,
-0.08093733, -1.304229, -4.961543, 0, 1, 0.6745098, 1,
-0.07104082, -0.1574233, -2.911115, 0, 1, 0.682353, 1,
-0.06626395, -0.6136792, -2.235032, 0, 1, 0.6862745, 1,
-0.06542225, -1.652102, -1.65005, 0, 1, 0.6941177, 1,
-0.06502709, -1.0274, -3.283045, 0, 1, 0.7019608, 1,
-0.06349737, -0.8338882, -2.543779, 0, 1, 0.7058824, 1,
-0.06294726, -1.178384, -2.742706, 0, 1, 0.7137255, 1,
-0.06067136, 0.180728, -1.17907, 0, 1, 0.7176471, 1,
-0.05092861, -0.2722729, -2.59476, 0, 1, 0.7254902, 1,
-0.05015012, -0.0315144, -1.137822, 0, 1, 0.7294118, 1,
-0.04459843, 0.5268943, 1.363595, 0, 1, 0.7372549, 1,
-0.0328666, -1.121396, -1.93013, 0, 1, 0.7411765, 1,
-0.02944109, -0.1818845, -3.760536, 0, 1, 0.7490196, 1,
-0.02897083, 0.6679468, -0.8671296, 0, 1, 0.7529412, 1,
-0.02412516, 0.5715973, -1.688608, 0, 1, 0.7607843, 1,
-0.0231289, 0.3919337, 1.060056, 0, 1, 0.7647059, 1,
-0.02276365, 0.1065294, 0.2431187, 0, 1, 0.772549, 1,
-0.02001756, 0.9763628, 0.4314307, 0, 1, 0.7764706, 1,
-0.01916873, 0.3696673, -0.1430308, 0, 1, 0.7843137, 1,
-0.01524286, -0.2534651, -4.007793, 0, 1, 0.7882353, 1,
-0.01489527, -1.761135, -1.499067, 0, 1, 0.7960784, 1,
-0.01017208, -0.4042386, -2.297002, 0, 1, 0.8039216, 1,
-0.005331357, 0.4965185, -0.1781783, 0, 1, 0.8078431, 1,
-0.001292257, 0.927569, 0.07663395, 0, 1, 0.8156863, 1,
-0.0008227122, 1.546399, 0.4792681, 0, 1, 0.8196079, 1,
-0.0006489649, -0.2593487, -3.206897, 0, 1, 0.827451, 1,
0.001130823, -0.1989725, 4.041714, 0, 1, 0.8313726, 1,
0.001209455, -0.618575, 2.995849, 0, 1, 0.8392157, 1,
0.001243458, 2.204365, 0.07570314, 0, 1, 0.8431373, 1,
0.006356341, -0.8137545, 0.08055376, 0, 1, 0.8509804, 1,
0.008440777, 0.291959, 0.3932459, 0, 1, 0.854902, 1,
0.01004216, -0.768875, 0.8805841, 0, 1, 0.8627451, 1,
0.01172047, -2.028311, 2.135082, 0, 1, 0.8666667, 1,
0.01423433, 0.2308768, 1.883955, 0, 1, 0.8745098, 1,
0.01758107, 0.1890922, 2.218194, 0, 1, 0.8784314, 1,
0.01942909, 0.4464009, -0.3098776, 0, 1, 0.8862745, 1,
0.02186833, -0.4419146, 1.812334, 0, 1, 0.8901961, 1,
0.0225363, -0.7982286, 3.105822, 0, 1, 0.8980392, 1,
0.02435177, 1.087084, -2.253376, 0, 1, 0.9058824, 1,
0.02468345, 1.082597, -0.3359925, 0, 1, 0.9098039, 1,
0.03127631, -0.287942, 2.26486, 0, 1, 0.9176471, 1,
0.03190892, 0.9959324, -0.2636098, 0, 1, 0.9215686, 1,
0.03568098, 0.7492413, 0.6868808, 0, 1, 0.9294118, 1,
0.04047097, 0.7304352, 1.353218, 0, 1, 0.9333333, 1,
0.04154037, -0.1585018, 2.611296, 0, 1, 0.9411765, 1,
0.0415706, -0.6542913, 2.440378, 0, 1, 0.945098, 1,
0.04239193, -0.9171875, 4.162996, 0, 1, 0.9529412, 1,
0.04265509, 0.3534382, -1.863079, 0, 1, 0.9568627, 1,
0.04570306, -1.700985, 2.439981, 0, 1, 0.9647059, 1,
0.04600238, -0.8916836, 3.15978, 0, 1, 0.9686275, 1,
0.04967603, -0.5722926, 4.521695, 0, 1, 0.9764706, 1,
0.04995747, -1.012198, 3.815614, 0, 1, 0.9803922, 1,
0.05007667, -0.8379913, 4.183366, 0, 1, 0.9882353, 1,
0.05151609, -0.1286184, 0.7845243, 0, 1, 0.9921569, 1,
0.05426487, 1.332986, 0.04845348, 0, 1, 1, 1,
0.05566846, -0.1448427, 3.187643, 0, 0.9921569, 1, 1,
0.05712292, -0.1846813, 2.894069, 0, 0.9882353, 1, 1,
0.05763999, -0.7472202, 1.419663, 0, 0.9803922, 1, 1,
0.0580361, 0.2190491, 1.049211, 0, 0.9764706, 1, 1,
0.05858509, -1.129574, 4.22076, 0, 0.9686275, 1, 1,
0.060637, 0.296211, -0.731661, 0, 0.9647059, 1, 1,
0.06122205, -0.6896799, 2.527766, 0, 0.9568627, 1, 1,
0.06211599, 0.4115582, -2.772464, 0, 0.9529412, 1, 1,
0.07082575, -1.024227, 3.844908, 0, 0.945098, 1, 1,
0.0721743, 0.7447301, 0.6236004, 0, 0.9411765, 1, 1,
0.07479864, -0.5549881, 2.703954, 0, 0.9333333, 1, 1,
0.07574953, 0.2454323, 1.344072, 0, 0.9294118, 1, 1,
0.07761171, 0.2005715, 1.135426, 0, 0.9215686, 1, 1,
0.07790079, -1.634839, 3.4644, 0, 0.9176471, 1, 1,
0.07890649, -0.4761993, 3.119377, 0, 0.9098039, 1, 1,
0.07913826, -1.911412, 4.551462, 0, 0.9058824, 1, 1,
0.08076762, -0.9848143, 2.707541, 0, 0.8980392, 1, 1,
0.0808474, -0.3465474, 3.050403, 0, 0.8901961, 1, 1,
0.0876351, 0.5195961, 0.6042634, 0, 0.8862745, 1, 1,
0.0881237, 0.09954704, -0.150778, 0, 0.8784314, 1, 1,
0.09408462, -2.372203, 1.221915, 0, 0.8745098, 1, 1,
0.09676655, 0.2689577, 0.7704691, 0, 0.8666667, 1, 1,
0.09996928, -0.9912362, 2.715841, 0, 0.8627451, 1, 1,
0.1003017, 0.9147355, 0.742624, 0, 0.854902, 1, 1,
0.1015471, -0.503363, 3.051692, 0, 0.8509804, 1, 1,
0.1063987, -0.4916779, 3.04297, 0, 0.8431373, 1, 1,
0.106774, -0.6585743, 3.496948, 0, 0.8392157, 1, 1,
0.1091905, 1.10717, -1.588615, 0, 0.8313726, 1, 1,
0.1152423, -0.3428693, 4.105205, 0, 0.827451, 1, 1,
0.1157891, -0.8621782, 3.313817, 0, 0.8196079, 1, 1,
0.1172154, 2.596564, 0.9404245, 0, 0.8156863, 1, 1,
0.11885, -0.5984116, 3.18682, 0, 0.8078431, 1, 1,
0.1190965, 0.9817241, -2.501582, 0, 0.8039216, 1, 1,
0.121771, -0.655107, 2.166892, 0, 0.7960784, 1, 1,
0.1230785, 1.386299, 0.5708549, 0, 0.7882353, 1, 1,
0.1268146, 0.0114947, 2.389761, 0, 0.7843137, 1, 1,
0.1273579, 0.918605, 1.546852, 0, 0.7764706, 1, 1,
0.1372351, 1.034902, -0.6300048, 0, 0.772549, 1, 1,
0.1380819, -0.8602105, 2.813073, 0, 0.7647059, 1, 1,
0.1384443, -0.01164237, 2.488398, 0, 0.7607843, 1, 1,
0.1411654, -0.9702466, 3.583995, 0, 0.7529412, 1, 1,
0.1415261, 0.2614638, -0.6677261, 0, 0.7490196, 1, 1,
0.1464179, -0.6215727, 3.025487, 0, 0.7411765, 1, 1,
0.146605, 1.452398, 0.1018515, 0, 0.7372549, 1, 1,
0.1485519, 0.6630307, 0.8871257, 0, 0.7294118, 1, 1,
0.1519904, -1.365067, 3.179584, 0, 0.7254902, 1, 1,
0.1542663, 1.9108, -2.039257, 0, 0.7176471, 1, 1,
0.1544317, -0.7920105, 3.140501, 0, 0.7137255, 1, 1,
0.1545051, 0.4334783, 0.4068083, 0, 0.7058824, 1, 1,
0.1590806, -0.0197372, 1.425467, 0, 0.6980392, 1, 1,
0.1594942, -0.9970167, 0.4331007, 0, 0.6941177, 1, 1,
0.1621674, -0.2002545, 0.8680242, 0, 0.6862745, 1, 1,
0.1625592, -1.427023, 1.810511, 0, 0.682353, 1, 1,
0.162929, -0.6358995, 4.606416, 0, 0.6745098, 1, 1,
0.1668015, 0.9220358, 0.4794922, 0, 0.6705883, 1, 1,
0.1701901, 0.5707314, 0.03881067, 0, 0.6627451, 1, 1,
0.1731916, -0.2609729, 2.085493, 0, 0.6588235, 1, 1,
0.1775704, 0.475829, -0.3152075, 0, 0.6509804, 1, 1,
0.18247, -0.1547045, 2.081797, 0, 0.6470588, 1, 1,
0.1842405, 0.344501, -0.3249861, 0, 0.6392157, 1, 1,
0.1871133, 0.3603701, 0.5451024, 0, 0.6352941, 1, 1,
0.1906258, 0.2389476, -0.8261507, 0, 0.627451, 1, 1,
0.1925915, 0.09750129, 0.8709125, 0, 0.6235294, 1, 1,
0.1959437, -0.6910507, 3.006402, 0, 0.6156863, 1, 1,
0.1985217, -1.029157, 3.060025, 0, 0.6117647, 1, 1,
0.199599, 0.7652107, 0.02365017, 0, 0.6039216, 1, 1,
0.2000654, -0.5575027, 2.473456, 0, 0.5960785, 1, 1,
0.2018659, 1.958381, 0.3184804, 0, 0.5921569, 1, 1,
0.202155, -2.494982, 3.902326, 0, 0.5843138, 1, 1,
0.2027521, 0.7170057, 1.357298, 0, 0.5803922, 1, 1,
0.2037624, -0.7438406, 2.533367, 0, 0.572549, 1, 1,
0.2065708, 0.5648827, -0.908254, 0, 0.5686275, 1, 1,
0.2093279, 2.277471, 1.021757, 0, 0.5607843, 1, 1,
0.2097597, 1.537094, -0.6116878, 0, 0.5568628, 1, 1,
0.210904, 0.3028114, 0.2893585, 0, 0.5490196, 1, 1,
0.2154269, -0.6028075, 2.029123, 0, 0.5450981, 1, 1,
0.2165813, -1.002911, 2.700932, 0, 0.5372549, 1, 1,
0.2180585, 0.09470423, 2.099846, 0, 0.5333334, 1, 1,
0.2229761, -0.2664434, 2.577367, 0, 0.5254902, 1, 1,
0.238085, -0.287236, 2.532862, 0, 0.5215687, 1, 1,
0.2505021, -1.012955, 4.465929, 0, 0.5137255, 1, 1,
0.2514244, 0.0757251, 0.06142784, 0, 0.509804, 1, 1,
0.2552078, 1.820462, 2.485443, 0, 0.5019608, 1, 1,
0.25873, 0.09770034, 1.496923, 0, 0.4941176, 1, 1,
0.2589253, -0.3077106, 1.99695, 0, 0.4901961, 1, 1,
0.2597973, -0.2593478, 1.717684, 0, 0.4823529, 1, 1,
0.2622032, 1.479351, 0.09732451, 0, 0.4784314, 1, 1,
0.2636762, -3.257652, 4.155931, 0, 0.4705882, 1, 1,
0.2653912, -0.08293173, 2.308621, 0, 0.4666667, 1, 1,
0.2655998, 1.377188, 0.02105704, 0, 0.4588235, 1, 1,
0.2682212, 1.037069, 0.4215105, 0, 0.454902, 1, 1,
0.2694793, 0.6721399, 0.1719706, 0, 0.4470588, 1, 1,
0.2772865, -0.7860237, 3.80245, 0, 0.4431373, 1, 1,
0.279742, 1.816205, -1.315685, 0, 0.4352941, 1, 1,
0.2938769, -0.294172, 0.9417899, 0, 0.4313726, 1, 1,
0.2959742, 0.2387104, -0.8616338, 0, 0.4235294, 1, 1,
0.2989945, -2.032717, 2.30994, 0, 0.4196078, 1, 1,
0.3038385, -0.5481221, 3.985947, 0, 0.4117647, 1, 1,
0.304221, 0.2876521, 0.470725, 0, 0.4078431, 1, 1,
0.3053027, -0.2966338, 2.320956, 0, 0.4, 1, 1,
0.3097956, -0.2534144, 1.109323, 0, 0.3921569, 1, 1,
0.3102469, -1.451553, 3.097794, 0, 0.3882353, 1, 1,
0.3108681, -2.265791, 4.198767, 0, 0.3803922, 1, 1,
0.3117379, 0.1713219, 0.9085743, 0, 0.3764706, 1, 1,
0.315384, 2.649262, -2.612384, 0, 0.3686275, 1, 1,
0.3161916, 0.8467622, -0.4923264, 0, 0.3647059, 1, 1,
0.3178902, -0.9667022, 4.307785, 0, 0.3568628, 1, 1,
0.3192488, 1.669506, -0.680662, 0, 0.3529412, 1, 1,
0.3249829, 0.2610238, 2.700784, 0, 0.345098, 1, 1,
0.3250768, 0.488251, -0.1824148, 0, 0.3411765, 1, 1,
0.3269071, -1.714825, 1.148378, 0, 0.3333333, 1, 1,
0.3323987, -0.3633968, 2.770138, 0, 0.3294118, 1, 1,
0.3349936, -0.8143296, 2.301327, 0, 0.3215686, 1, 1,
0.337727, 0.3432863, -0.8656774, 0, 0.3176471, 1, 1,
0.3440178, -0.7918782, 3.55601, 0, 0.3098039, 1, 1,
0.3453622, -0.9073682, 3.617763, 0, 0.3058824, 1, 1,
0.3482252, -0.1832169, 0.8567063, 0, 0.2980392, 1, 1,
0.3488323, 0.06916781, 0.3907329, 0, 0.2901961, 1, 1,
0.3516513, -1.110438, 1.935876, 0, 0.2862745, 1, 1,
0.3604951, 0.3358348, 0.05718258, 0, 0.2784314, 1, 1,
0.3676829, -0.7226334, 2.993289, 0, 0.2745098, 1, 1,
0.3702064, 0.7764441, 1.228799, 0, 0.2666667, 1, 1,
0.3759748, 1.460066, 0.1419744, 0, 0.2627451, 1, 1,
0.3812848, -0.8590503, 4.622159, 0, 0.254902, 1, 1,
0.3817407, -0.2962096, 0.8553222, 0, 0.2509804, 1, 1,
0.3830024, 0.5253121, 0.3506038, 0, 0.2431373, 1, 1,
0.3849257, 0.7123115, 1.040802, 0, 0.2392157, 1, 1,
0.3880247, -0.3342284, 0.7747149, 0, 0.2313726, 1, 1,
0.3904125, 0.2993166, 1.647801, 0, 0.227451, 1, 1,
0.3949641, -0.2462485, 3.418452, 0, 0.2196078, 1, 1,
0.396428, 0.3322145, 3.198027, 0, 0.2156863, 1, 1,
0.4002028, -1.095218, 3.258264, 0, 0.2078431, 1, 1,
0.4016431, -0.8621245, 2.922637, 0, 0.2039216, 1, 1,
0.401952, -0.3026195, 2.706183, 0, 0.1960784, 1, 1,
0.410136, 1.515245, 2.65326, 0, 0.1882353, 1, 1,
0.4188488, 0.0114908, 3.115667, 0, 0.1843137, 1, 1,
0.426018, 1.385124, 0.149955, 0, 0.1764706, 1, 1,
0.4275092, -0.9643977, -0.07777384, 0, 0.172549, 1, 1,
0.4283873, 0.1976406, 1.574754, 0, 0.1647059, 1, 1,
0.4317764, 1.132175, -3.173244, 0, 0.1607843, 1, 1,
0.4371486, -0.1811306, 0.9625256, 0, 0.1529412, 1, 1,
0.4380077, -0.1580089, 2.276531, 0, 0.1490196, 1, 1,
0.4461974, 0.3752643, 0.8102002, 0, 0.1411765, 1, 1,
0.4527032, 1.347731, 1.707508, 0, 0.1372549, 1, 1,
0.4702083, -0.3917831, 0.8096385, 0, 0.1294118, 1, 1,
0.4764617, -0.6634692, 3.058887, 0, 0.1254902, 1, 1,
0.4766937, 0.5162028, 0.1359352, 0, 0.1176471, 1, 1,
0.4808423, -0.2655649, 1.707101, 0, 0.1137255, 1, 1,
0.484133, 0.2256343, 0.6363289, 0, 0.1058824, 1, 1,
0.4900129, 0.9387808, 0.215084, 0, 0.09803922, 1, 1,
0.4908204, -0.8489645, 0.762557, 0, 0.09411765, 1, 1,
0.4936008, 0.22929, 0.5763397, 0, 0.08627451, 1, 1,
0.4970928, -0.7152193, 2.036935, 0, 0.08235294, 1, 1,
0.5063552, 0.7193351, 0.9397885, 0, 0.07450981, 1, 1,
0.5079427, -0.529274, 2.412324, 0, 0.07058824, 1, 1,
0.5131133, -1.385942, 2.656965, 0, 0.0627451, 1, 1,
0.5139738, -0.5206891, 1.98633, 0, 0.05882353, 1, 1,
0.517032, -1.005571, 2.798194, 0, 0.05098039, 1, 1,
0.5190067, 0.6140852, 3.136942, 0, 0.04705882, 1, 1,
0.5195929, 1.603938, 0.9546664, 0, 0.03921569, 1, 1,
0.5207084, 1.145008, 3.417198, 0, 0.03529412, 1, 1,
0.5214764, 0.65122, 0.1550532, 0, 0.02745098, 1, 1,
0.5274658, 1.350847, 1.189375, 0, 0.02352941, 1, 1,
0.5288202, -1.45255, 2.649426, 0, 0.01568628, 1, 1,
0.5290673, -1.350245, 2.011757, 0, 0.01176471, 1, 1,
0.5335389, -1.704619, 3.285468, 0, 0.003921569, 1, 1,
0.5337396, 0.07429259, 0.5808806, 0.003921569, 0, 1, 1,
0.5343791, -0.6484461, 2.066202, 0.007843138, 0, 1, 1,
0.5367297, 0.7423959, 2.178423, 0.01568628, 0, 1, 1,
0.5380861, -0.5337596, 3.467442, 0.01960784, 0, 1, 1,
0.5382171, -1.203617, 2.403828, 0.02745098, 0, 1, 1,
0.5403117, 0.5887499, 2.493104, 0.03137255, 0, 1, 1,
0.5413579, 0.4340092, 0.4316732, 0.03921569, 0, 1, 1,
0.5429255, 0.34984, 0.7560115, 0.04313726, 0, 1, 1,
0.5449005, -0.2857997, 0.7043883, 0.05098039, 0, 1, 1,
0.5473422, 0.2251664, 2.767186, 0.05490196, 0, 1, 1,
0.5522241, 0.4958837, 1.777905, 0.0627451, 0, 1, 1,
0.5564722, 0.3403713, 3.483446, 0.06666667, 0, 1, 1,
0.5595163, 0.05695973, 1.52695, 0.07450981, 0, 1, 1,
0.5631924, 0.2910429, 2.094356, 0.07843138, 0, 1, 1,
0.5644183, -0.6833302, 1.259203, 0.08627451, 0, 1, 1,
0.5672216, -1.948078, 5.102573, 0.09019608, 0, 1, 1,
0.5693967, -0.5114045, 2.643151, 0.09803922, 0, 1, 1,
0.5704691, -2.016177, 2.893538, 0.1058824, 0, 1, 1,
0.570628, 1.57148, 1.563221, 0.1098039, 0, 1, 1,
0.5726917, -0.2301547, 2.417097, 0.1176471, 0, 1, 1,
0.5729487, 0.4648728, 1.739903, 0.1215686, 0, 1, 1,
0.5775267, 0.9235145, 0.9246597, 0.1294118, 0, 1, 1,
0.5804605, -1.424905, 3.27093, 0.1333333, 0, 1, 1,
0.583938, 0.03955631, -0.08988971, 0.1411765, 0, 1, 1,
0.5883434, -0.005465626, 0.4496494, 0.145098, 0, 1, 1,
0.591369, -1.69981, 3.184446, 0.1529412, 0, 1, 1,
0.5914285, -0.4136492, 2.397945, 0.1568628, 0, 1, 1,
0.5975527, -0.2639817, 0.8539671, 0.1647059, 0, 1, 1,
0.599943, 1.333165, 1.435744, 0.1686275, 0, 1, 1,
0.6005943, 0.4321807, 1.839314, 0.1764706, 0, 1, 1,
0.6020393, 0.6277635, -1.185419, 0.1803922, 0, 1, 1,
0.6060732, 0.7785933, -0.4273134, 0.1882353, 0, 1, 1,
0.607298, 1.414005, -0.9309449, 0.1921569, 0, 1, 1,
0.6083478, -0.4636225, 2.856298, 0.2, 0, 1, 1,
0.6129701, -1.612584, 2.731226, 0.2078431, 0, 1, 1,
0.6152254, 2.188029, 1.492172, 0.2117647, 0, 1, 1,
0.6175793, -0.6129431, 1.587433, 0.2196078, 0, 1, 1,
0.6221153, 0.316184, 0.9668339, 0.2235294, 0, 1, 1,
0.6225471, 0.0560898, -0.6353829, 0.2313726, 0, 1, 1,
0.6256251, 2.934669, -0.04200094, 0.2352941, 0, 1, 1,
0.6431172, 0.940861, 0.7172433, 0.2431373, 0, 1, 1,
0.6469964, -0.2338881, 1.892328, 0.2470588, 0, 1, 1,
0.6495807, -1.910686, 2.054878, 0.254902, 0, 1, 1,
0.6499277, -0.06362393, 2.739974, 0.2588235, 0, 1, 1,
0.6580408, -1.3919, 4.102353, 0.2666667, 0, 1, 1,
0.6604902, 0.9133206, 1.601568, 0.2705882, 0, 1, 1,
0.6660763, -0.9471574, 2.664318, 0.2784314, 0, 1, 1,
0.6662835, -0.2355605, 1.802122, 0.282353, 0, 1, 1,
0.6665711, -1.106978, 2.86708, 0.2901961, 0, 1, 1,
0.6695132, -0.9225954, 1.668515, 0.2941177, 0, 1, 1,
0.671993, -0.6281106, 3.667491, 0.3019608, 0, 1, 1,
0.6749906, -0.4519939, 2.984773, 0.3098039, 0, 1, 1,
0.680004, 0.003402846, -0.5078654, 0.3137255, 0, 1, 1,
0.6807869, 0.900267, 0.511842, 0.3215686, 0, 1, 1,
0.6812937, 0.954852, 1.456859, 0.3254902, 0, 1, 1,
0.6820828, 0.2393748, 0.8289028, 0.3333333, 0, 1, 1,
0.6821613, 1.000397, 1.12735, 0.3372549, 0, 1, 1,
0.6822656, 1.570805, -0.1179335, 0.345098, 0, 1, 1,
0.6860788, 0.7289032, 0.9123763, 0.3490196, 0, 1, 1,
0.6862832, -1.055458, 3.713407, 0.3568628, 0, 1, 1,
0.6989172, 1.256644, 0.1798695, 0.3607843, 0, 1, 1,
0.7020528, -0.1283746, 2.255022, 0.3686275, 0, 1, 1,
0.7060097, 0.6381907, -0.07479236, 0.372549, 0, 1, 1,
0.7070337, -1.124412, 3.976263, 0.3803922, 0, 1, 1,
0.7089733, 1.108468, -1.428468, 0.3843137, 0, 1, 1,
0.7141186, -0.3128176, 1.710632, 0.3921569, 0, 1, 1,
0.7145292, -0.05860614, 0.02964854, 0.3960784, 0, 1, 1,
0.7152631, 1.221425, 0.2060432, 0.4039216, 0, 1, 1,
0.7187757, -0.05738648, 0.6752685, 0.4117647, 0, 1, 1,
0.7187946, 0.9117146, -0.1611109, 0.4156863, 0, 1, 1,
0.7237818, -0.5864019, 2.718386, 0.4235294, 0, 1, 1,
0.7245568, -0.2127922, 2.629013, 0.427451, 0, 1, 1,
0.7271146, 0.5822352, 3.605246, 0.4352941, 0, 1, 1,
0.7331685, 0.6325443, -0.2783964, 0.4392157, 0, 1, 1,
0.7359719, -1.920055, 3.211412, 0.4470588, 0, 1, 1,
0.7367484, -0.6801828, 1.756306, 0.4509804, 0, 1, 1,
0.7384742, 1.061073, 0.3843668, 0.4588235, 0, 1, 1,
0.7398524, -0.1412503, -0.8878668, 0.4627451, 0, 1, 1,
0.7399393, -0.5194671, 2.521995, 0.4705882, 0, 1, 1,
0.7442023, -0.1585151, 0.9812021, 0.4745098, 0, 1, 1,
0.7458674, -0.391967, 0.9255211, 0.4823529, 0, 1, 1,
0.7470315, 1.082442, 1.691529, 0.4862745, 0, 1, 1,
0.7507855, 0.5475999, -1.561973, 0.4941176, 0, 1, 1,
0.7536496, 2.271096, 1.075178, 0.5019608, 0, 1, 1,
0.7539003, -2.416764, 1.802957, 0.5058824, 0, 1, 1,
0.7563541, 0.03518518, 2.280325, 0.5137255, 0, 1, 1,
0.7607459, -0.9357772, 1.751223, 0.5176471, 0, 1, 1,
0.7629189, 0.6516508, 1.137268, 0.5254902, 0, 1, 1,
0.7688898, 0.4539402, -0.6590587, 0.5294118, 0, 1, 1,
0.7703274, -1.337188, 3.568465, 0.5372549, 0, 1, 1,
0.7717207, -0.7869055, 3.475893, 0.5411765, 0, 1, 1,
0.7727631, -0.267195, 0.7715858, 0.5490196, 0, 1, 1,
0.7730651, -0.5630025, 3.370014, 0.5529412, 0, 1, 1,
0.781302, -0.02914108, 3.163416, 0.5607843, 0, 1, 1,
0.7837304, -0.05071366, 2.182368, 0.5647059, 0, 1, 1,
0.7869627, -0.2649749, 1.157176, 0.572549, 0, 1, 1,
0.7924579, 0.5895901, 1.308569, 0.5764706, 0, 1, 1,
0.7971553, -0.3322335, 4.184906, 0.5843138, 0, 1, 1,
0.8029724, -0.7499393, 3.191998, 0.5882353, 0, 1, 1,
0.8046049, -0.2252344, -0.08216094, 0.5960785, 0, 1, 1,
0.8085951, -0.7261122, 0.741155, 0.6039216, 0, 1, 1,
0.8087939, -1.301545, 2.621944, 0.6078432, 0, 1, 1,
0.8129931, 0.9415954, 0.4275676, 0.6156863, 0, 1, 1,
0.819391, 0.2967787, 0.4590991, 0.6196079, 0, 1, 1,
0.8196378, -1.555738, 1.52407, 0.627451, 0, 1, 1,
0.8205193, -0.1696038, 2.00562, 0.6313726, 0, 1, 1,
0.8236473, -0.6073965, 2.469561, 0.6392157, 0, 1, 1,
0.8261843, -1.066348, 0.9641192, 0.6431373, 0, 1, 1,
0.8262852, 0.002894052, 1.512148, 0.6509804, 0, 1, 1,
0.827624, 0.2169897, 0.2237254, 0.654902, 0, 1, 1,
0.8277422, 0.6802825, 1.994519, 0.6627451, 0, 1, 1,
0.8289832, 0.7387785, 1.503283, 0.6666667, 0, 1, 1,
0.8312273, 0.1953885, 0.8525062, 0.6745098, 0, 1, 1,
0.8371763, -0.1030699, 3.467884, 0.6784314, 0, 1, 1,
0.8404605, -0.6811052, 1.473635, 0.6862745, 0, 1, 1,
0.8469052, -0.5292836, 2.638668, 0.6901961, 0, 1, 1,
0.8512723, 1.252007, 0.4079577, 0.6980392, 0, 1, 1,
0.8524212, 0.6269914, -1.395273, 0.7058824, 0, 1, 1,
0.857739, -1.902791, 3.708669, 0.7098039, 0, 1, 1,
0.8578926, 0.3572966, 2.028064, 0.7176471, 0, 1, 1,
0.8584533, 0.4199058, 1.418859, 0.7215686, 0, 1, 1,
0.8614232, 1.300279, -1.078324, 0.7294118, 0, 1, 1,
0.8619657, -1.675189, 2.851486, 0.7333333, 0, 1, 1,
0.8620634, -1.421894, 1.662811, 0.7411765, 0, 1, 1,
0.8670934, -0.008020529, 2.720486, 0.7450981, 0, 1, 1,
0.870579, 0.9380055, 0.1520445, 0.7529412, 0, 1, 1,
0.8751311, 0.7996346, 2.271144, 0.7568628, 0, 1, 1,
0.8795055, -1.134458, 2.521873, 0.7647059, 0, 1, 1,
0.8821237, -0.6620432, 0.4393603, 0.7686275, 0, 1, 1,
0.8823102, 1.24803, 0.6081214, 0.7764706, 0, 1, 1,
0.8835641, -1.042289, 2.278589, 0.7803922, 0, 1, 1,
0.8857139, -0.08987673, 2.556966, 0.7882353, 0, 1, 1,
0.887592, 1.007358, 0.5832393, 0.7921569, 0, 1, 1,
0.8884422, 0.2170115, -0.5653473, 0.8, 0, 1, 1,
0.8914064, -0.7296303, 1.554045, 0.8078431, 0, 1, 1,
0.8927735, -1.162467, 1.530001, 0.8117647, 0, 1, 1,
0.8931943, -0.9924278, 1.193167, 0.8196079, 0, 1, 1,
0.8968852, 1.491228, 1.273141, 0.8235294, 0, 1, 1,
0.8972831, 0.7134757, 1.631811, 0.8313726, 0, 1, 1,
0.9038358, 1.404189, -0.5869064, 0.8352941, 0, 1, 1,
0.9086173, 0.8068969, 1.261714, 0.8431373, 0, 1, 1,
0.9089388, -0.0572169, 2.859832, 0.8470588, 0, 1, 1,
0.909986, 0.5187485, 3.571403, 0.854902, 0, 1, 1,
0.9199865, 1.08268, 0.6676586, 0.8588235, 0, 1, 1,
0.920909, -0.7083908, 2.977978, 0.8666667, 0, 1, 1,
0.9243851, 0.2766273, -0.4611281, 0.8705882, 0, 1, 1,
0.9300685, -1.246381, 2.878485, 0.8784314, 0, 1, 1,
0.930301, -1.11608, 4.117499, 0.8823529, 0, 1, 1,
0.9341331, -0.1384486, 0.7628276, 0.8901961, 0, 1, 1,
0.9351811, -1.07931, 3.048517, 0.8941177, 0, 1, 1,
0.941066, -0.2506615, 2.247498, 0.9019608, 0, 1, 1,
0.9449455, 0.1302203, 2.927822, 0.9098039, 0, 1, 1,
0.9490277, 0.9475386, 1.089816, 0.9137255, 0, 1, 1,
0.9494807, -1.001611, 1.444233, 0.9215686, 0, 1, 1,
0.9500633, 0.750847, 0.5807413, 0.9254902, 0, 1, 1,
0.9519596, 0.6125564, 1.572093, 0.9333333, 0, 1, 1,
0.9558935, 1.24341, 2.065917, 0.9372549, 0, 1, 1,
0.9562449, 0.2555592, 1.130138, 0.945098, 0, 1, 1,
0.9605907, 0.6123414, 1.989227, 0.9490196, 0, 1, 1,
0.9630053, 0.4430955, 0.6995329, 0.9568627, 0, 1, 1,
0.9635393, -0.2262945, 2.081865, 0.9607843, 0, 1, 1,
0.9650127, 0.3666858, 1.365969, 0.9686275, 0, 1, 1,
0.9715201, 0.3279727, 1.952571, 0.972549, 0, 1, 1,
0.9720452, 0.06264228, 1.040359, 0.9803922, 0, 1, 1,
0.9740899, 1.72406, 0.9632584, 0.9843137, 0, 1, 1,
0.9795074, 1.648481, 1.745411, 0.9921569, 0, 1, 1,
0.9856548, 0.05380309, -0.4667984, 0.9960784, 0, 1, 1,
0.9925836, -1.043065, 2.64659, 1, 0, 0.9960784, 1,
1.00199, -0.6085893, 1.833617, 1, 0, 0.9882353, 1,
1.005937, 0.02692686, 2.697598, 1, 0, 0.9843137, 1,
1.019044, -0.8807207, 2.154443, 1, 0, 0.9764706, 1,
1.025407, -0.6435741, 2.886273, 1, 0, 0.972549, 1,
1.032548, -1.409826, 2.61378, 1, 0, 0.9647059, 1,
1.033997, -0.3272612, 2.092863, 1, 0, 0.9607843, 1,
1.035767, -1.062725, 1.842182, 1, 0, 0.9529412, 1,
1.037877, 2.541685, 0.4993382, 1, 0, 0.9490196, 1,
1.049579, 2.157232, 1.84304, 1, 0, 0.9411765, 1,
1.050827, 2.220528, 0.8549441, 1, 0, 0.9372549, 1,
1.063357, -0.3358361, 3.089459, 1, 0, 0.9294118, 1,
1.072873, -0.5650472, 2.804357, 1, 0, 0.9254902, 1,
1.072945, -0.117012, 1.318313, 1, 0, 0.9176471, 1,
1.073825, 0.05428361, 1.519764, 1, 0, 0.9137255, 1,
1.074051, 0.5599229, 1.050501, 1, 0, 0.9058824, 1,
1.083983, -0.1956138, 1.297811, 1, 0, 0.9019608, 1,
1.090124, 0.5431972, 1.91417, 1, 0, 0.8941177, 1,
1.092208, -0.1405139, 0.6183691, 1, 0, 0.8862745, 1,
1.102193, -0.1209039, 2.294237, 1, 0, 0.8823529, 1,
1.103324, -0.4319044, 1.875977, 1, 0, 0.8745098, 1,
1.106515, -1.17794, 0.8892206, 1, 0, 0.8705882, 1,
1.11776, 2.434606, 0.9485512, 1, 0, 0.8627451, 1,
1.12147, -0.8359925, 2.595446, 1, 0, 0.8588235, 1,
1.126633, -0.5843489, 2.632553, 1, 0, 0.8509804, 1,
1.13247, 0.4936148, 0.5571783, 1, 0, 0.8470588, 1,
1.133056, 0.7723675, 0.3991867, 1, 0, 0.8392157, 1,
1.137081, 0.9284415, 0.3388741, 1, 0, 0.8352941, 1,
1.141014, -0.8533316, 1.744761, 1, 0, 0.827451, 1,
1.145849, 1.148841, 0.4091838, 1, 0, 0.8235294, 1,
1.149831, -0.8400925, 1.447464, 1, 0, 0.8156863, 1,
1.15703, 0.1859009, 0.4009683, 1, 0, 0.8117647, 1,
1.161406, -0.9636946, 0.9169787, 1, 0, 0.8039216, 1,
1.182035, 1.634713, 1.524958, 1, 0, 0.7960784, 1,
1.182206, 1.08352, -0.5881327, 1, 0, 0.7921569, 1,
1.198391, 0.3808505, 1.724625, 1, 0, 0.7843137, 1,
1.201082, 0.3679038, 0.5991858, 1, 0, 0.7803922, 1,
1.207665, 0.5773419, 1.258354, 1, 0, 0.772549, 1,
1.209239, 0.6779485, 0.7645685, 1, 0, 0.7686275, 1,
1.212525, -1.03809, 3.193564, 1, 0, 0.7607843, 1,
1.213253, 0.8558097, 0.5149312, 1, 0, 0.7568628, 1,
1.217693, 0.8519166, 0.6494402, 1, 0, 0.7490196, 1,
1.244374, 0.2174257, 1.644354, 1, 0, 0.7450981, 1,
1.248011, 0.2392966, 1.712887, 1, 0, 0.7372549, 1,
1.25389, 0.2405434, 2.152337, 1, 0, 0.7333333, 1,
1.254115, 1.947105, -1.793061, 1, 0, 0.7254902, 1,
1.264091, -2.44798, 0.5323759, 1, 0, 0.7215686, 1,
1.270252, 0.2896011, 1.175343, 1, 0, 0.7137255, 1,
1.292803, -1.481053, 1.881424, 1, 0, 0.7098039, 1,
1.296985, 0.5411286, 2.269474, 1, 0, 0.7019608, 1,
1.30031, -0.01788969, 1.282524, 1, 0, 0.6941177, 1,
1.309058, 1.469864, 1.365268, 1, 0, 0.6901961, 1,
1.309465, 1.709443, 0.2785925, 1, 0, 0.682353, 1,
1.314865, -0.1341106, 4.368459, 1, 0, 0.6784314, 1,
1.321178, -0.04434992, 2.189301, 1, 0, 0.6705883, 1,
1.323194, 0.7305263, 3.009096, 1, 0, 0.6666667, 1,
1.326545, -1.300448, 1.765501, 1, 0, 0.6588235, 1,
1.330155, 0.2069377, 0.9175247, 1, 0, 0.654902, 1,
1.333629, 1.970544, 0.1952073, 1, 0, 0.6470588, 1,
1.334103, -0.37251, 1.279508, 1, 0, 0.6431373, 1,
1.337521, 0.4481955, 1.22522, 1, 0, 0.6352941, 1,
1.36325, -0.002018315, 1.238506, 1, 0, 0.6313726, 1,
1.365743, 0.4304683, 3.987991, 1, 0, 0.6235294, 1,
1.36731, -0.005152446, 3.142178, 1, 0, 0.6196079, 1,
1.371546, 0.1486927, -0.1144886, 1, 0, 0.6117647, 1,
1.37503, 0.817677, 1.805135, 1, 0, 0.6078432, 1,
1.398325, 0.4849215, 2.56475, 1, 0, 0.6, 1,
1.400051, 0.3474203, 0.4908105, 1, 0, 0.5921569, 1,
1.401948, 0.2213233, 2.583437, 1, 0, 0.5882353, 1,
1.408303, 1.257558, 0.3696094, 1, 0, 0.5803922, 1,
1.409494, -0.9017614, 1.787382, 1, 0, 0.5764706, 1,
1.411465, -1.096395, 2.531859, 1, 0, 0.5686275, 1,
1.413632, 0.7299491, 0.143577, 1, 0, 0.5647059, 1,
1.414421, 1.701373, 1.198641, 1, 0, 0.5568628, 1,
1.415902, 2.138036, 1.780658, 1, 0, 0.5529412, 1,
1.41749, 1.25169, 1.79873, 1, 0, 0.5450981, 1,
1.417688, -1.04252, 2.235653, 1, 0, 0.5411765, 1,
1.417941, 1.630738, 3.650468, 1, 0, 0.5333334, 1,
1.419757, 0.7267839, 1.546262, 1, 0, 0.5294118, 1,
1.421159, 0.9187036, 0.5281296, 1, 0, 0.5215687, 1,
1.422344, -0.6748074, 3.144864, 1, 0, 0.5176471, 1,
1.423615, 0.1793079, -0.5311946, 1, 0, 0.509804, 1,
1.441138, 0.5061472, 1.028875, 1, 0, 0.5058824, 1,
1.444929, -0.73557, 1.978273, 1, 0, 0.4980392, 1,
1.457108, -0.6719364, 1.644789, 1, 0, 0.4901961, 1,
1.45759, 0.08553924, 1.770164, 1, 0, 0.4862745, 1,
1.460475, -0.2505344, 1.790575, 1, 0, 0.4784314, 1,
1.468421, -0.4991626, 1.079423, 1, 0, 0.4745098, 1,
1.46981, 0.7686816, 0.7444936, 1, 0, 0.4666667, 1,
1.473361, -0.6281393, 0.8736069, 1, 0, 0.4627451, 1,
1.473377, 0.06501982, 1.568092, 1, 0, 0.454902, 1,
1.474977, -0.06142367, 2.324085, 1, 0, 0.4509804, 1,
1.477118, 1.334198, 3.735542, 1, 0, 0.4431373, 1,
1.479231, -0.9483225, 2.945221, 1, 0, 0.4392157, 1,
1.491454, 0.1387955, 1.507041, 1, 0, 0.4313726, 1,
1.494065, -0.2810243, 3.415112, 1, 0, 0.427451, 1,
1.501584, 0.913613, 0.2170132, 1, 0, 0.4196078, 1,
1.510483, 0.1890351, 1.693802, 1, 0, 0.4156863, 1,
1.520311, -0.689844, 1.770254, 1, 0, 0.4078431, 1,
1.534869, -1.457049, 0.08041596, 1, 0, 0.4039216, 1,
1.536535, -0.9476106, 3.245738, 1, 0, 0.3960784, 1,
1.540046, -1.22999, 2.196237, 1, 0, 0.3882353, 1,
1.540536, -2.536919, 3.878793, 1, 0, 0.3843137, 1,
1.540578, -1.045878, 2.364342, 1, 0, 0.3764706, 1,
1.553705, 2.086675, 1.07579, 1, 0, 0.372549, 1,
1.583148, 0.2454706, 2.228703, 1, 0, 0.3647059, 1,
1.585601, -0.986081, 2.066651, 1, 0, 0.3607843, 1,
1.588612, 1.420963, 0.8492582, 1, 0, 0.3529412, 1,
1.601364, -1.302808, 1.046646, 1, 0, 0.3490196, 1,
1.605064, 0.2783268, 3.352675, 1, 0, 0.3411765, 1,
1.630963, -1.117798, 2.795973, 1, 0, 0.3372549, 1,
1.634071, 0.8330518, 1.215124, 1, 0, 0.3294118, 1,
1.636123, 0.9673423, 1.34329, 1, 0, 0.3254902, 1,
1.66037, -1.442754, 2.481202, 1, 0, 0.3176471, 1,
1.667485, -0.1469993, 3.593221, 1, 0, 0.3137255, 1,
1.696355, -0.001981352, 0.8374578, 1, 0, 0.3058824, 1,
1.696523, -0.9776498, 2.229432, 1, 0, 0.2980392, 1,
1.712159, 1.123078, 1.925349, 1, 0, 0.2941177, 1,
1.718629, 0.1506114, 1.469853, 1, 0, 0.2862745, 1,
1.722352, 0.7732011, 1.3829, 1, 0, 0.282353, 1,
1.725242, 0.1876585, 2.414783, 1, 0, 0.2745098, 1,
1.726402, 1.155514, 2.021961, 1, 0, 0.2705882, 1,
1.742248, 0.1789841, 1.832631, 1, 0, 0.2627451, 1,
1.744664, 1.401621, 2.919752, 1, 0, 0.2588235, 1,
1.747489, -0.1960475, 1.726846, 1, 0, 0.2509804, 1,
1.756927, -0.2887564, 0.7706203, 1, 0, 0.2470588, 1,
1.781701, 0.5749992, 3.130083, 1, 0, 0.2392157, 1,
1.78655, 0.5112004, 2.713277, 1, 0, 0.2352941, 1,
1.816002, -0.04091233, 1.961715, 1, 0, 0.227451, 1,
1.829913, 1.154568, 1.336827, 1, 0, 0.2235294, 1,
1.843766, 0.4165542, 2.146943, 1, 0, 0.2156863, 1,
1.871739, -0.5201477, 1.123024, 1, 0, 0.2117647, 1,
1.875958, -1.910932, 1.942737, 1, 0, 0.2039216, 1,
1.901023, 0.158349, 0.7154374, 1, 0, 0.1960784, 1,
1.921725, 1.242989, -0.2564352, 1, 0, 0.1921569, 1,
1.923526, 2.084445, 1.090909, 1, 0, 0.1843137, 1,
1.93308, -0.5791705, 3.085418, 1, 0, 0.1803922, 1,
1.959822, -0.3569041, 2.463153, 1, 0, 0.172549, 1,
2.005456, 0.5487143, 2.50118, 1, 0, 0.1686275, 1,
2.008576, -1.996889, 0.8506654, 1, 0, 0.1607843, 1,
2.009401, 1.364413, -0.5333724, 1, 0, 0.1568628, 1,
2.009444, -0.7921485, 2.014171, 1, 0, 0.1490196, 1,
2.029197, 0.4168052, -0.1835122, 1, 0, 0.145098, 1,
2.035492, 1.075742, -0.3097583, 1, 0, 0.1372549, 1,
2.05731, -0.3798002, 2.918487, 1, 0, 0.1333333, 1,
2.06188, -0.3591816, 2.199426, 1, 0, 0.1254902, 1,
2.064036, 0.2463961, 2.401916, 1, 0, 0.1215686, 1,
2.070097, -0.06916204, -0.3621393, 1, 0, 0.1137255, 1,
2.08177, 1.798079, 0.9435943, 1, 0, 0.1098039, 1,
2.154053, -0.06158797, 0.6247795, 1, 0, 0.1019608, 1,
2.17518, -0.1549882, 0.7952131, 1, 0, 0.09411765, 1,
2.17936, -1.296759, 3.09798, 1, 0, 0.09019608, 1,
2.222168, 0.5948851, 1.909221, 1, 0, 0.08235294, 1,
2.250855, -1.252077, 2.10198, 1, 0, 0.07843138, 1,
2.311847, -0.864223, 1.891224, 1, 0, 0.07058824, 1,
2.314177, 1.453452, 0.1270075, 1, 0, 0.06666667, 1,
2.400504, -2.209926, 3.471848, 1, 0, 0.05882353, 1,
2.515858, -0.3109237, 2.698137, 1, 0, 0.05490196, 1,
2.724682, -1.411923, 1.693455, 1, 0, 0.04705882, 1,
2.825862, 1.616479, 1.3963, 1, 0, 0.04313726, 1,
2.86628, 0.4535774, 1.541755, 1, 0, 0.03529412, 1,
2.970073, -1.208658, 3.523375, 1, 0, 0.03137255, 1,
3.002974, 0.7412155, 2.121998, 1, 0, 0.02352941, 1,
3.18842, -2.822016, -0.1686353, 1, 0, 0.01960784, 1,
3.232612, 0.8846996, 1.345648, 1, 0, 0.01176471, 1,
3.237189, 1.422492, 1.494421, 1, 0, 0.007843138, 1
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
-0.2031107, -4.37853, -7.507191, 0, -0.5, 0.5, 0.5,
-0.2031107, -4.37853, -7.507191, 1, -0.5, 0.5, 0.5,
-0.2031107, -4.37853, -7.507191, 1, 1.5, 0.5, 0.5,
-0.2031107, -4.37853, -7.507191, 0, 1.5, 0.5, 0.5
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
-4.809672, 0.04877007, -7.507191, 0, -0.5, 0.5, 0.5,
-4.809672, 0.04877007, -7.507191, 1, -0.5, 0.5, 0.5,
-4.809672, 0.04877007, -7.507191, 1, 1.5, 0.5, 0.5,
-4.809672, 0.04877007, -7.507191, 0, 1.5, 0.5, 0.5
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
-4.809672, -4.37853, -0.2885189, 0, -0.5, 0.5, 0.5,
-4.809672, -4.37853, -0.2885189, 1, -0.5, 0.5, 0.5,
-4.809672, -4.37853, -0.2885189, 1, 1.5, 0.5, 0.5,
-4.809672, -4.37853, -0.2885189, 0, 1.5, 0.5, 0.5
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
-3, -3.356845, -5.841343,
3, -3.356845, -5.841343,
-3, -3.356845, -5.841343,
-3, -3.527126, -6.118985,
-2, -3.356845, -5.841343,
-2, -3.527126, -6.118985,
-1, -3.356845, -5.841343,
-1, -3.527126, -6.118985,
0, -3.356845, -5.841343,
0, -3.527126, -6.118985,
1, -3.356845, -5.841343,
1, -3.527126, -6.118985,
2, -3.356845, -5.841343,
2, -3.527126, -6.118985,
3, -3.356845, -5.841343,
3, -3.527126, -6.118985
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
-3, -3.867687, -6.674267, 0, -0.5, 0.5, 0.5,
-3, -3.867687, -6.674267, 1, -0.5, 0.5, 0.5,
-3, -3.867687, -6.674267, 1, 1.5, 0.5, 0.5,
-3, -3.867687, -6.674267, 0, 1.5, 0.5, 0.5,
-2, -3.867687, -6.674267, 0, -0.5, 0.5, 0.5,
-2, -3.867687, -6.674267, 1, -0.5, 0.5, 0.5,
-2, -3.867687, -6.674267, 1, 1.5, 0.5, 0.5,
-2, -3.867687, -6.674267, 0, 1.5, 0.5, 0.5,
-1, -3.867687, -6.674267, 0, -0.5, 0.5, 0.5,
-1, -3.867687, -6.674267, 1, -0.5, 0.5, 0.5,
-1, -3.867687, -6.674267, 1, 1.5, 0.5, 0.5,
-1, -3.867687, -6.674267, 0, 1.5, 0.5, 0.5,
0, -3.867687, -6.674267, 0, -0.5, 0.5, 0.5,
0, -3.867687, -6.674267, 1, -0.5, 0.5, 0.5,
0, -3.867687, -6.674267, 1, 1.5, 0.5, 0.5,
0, -3.867687, -6.674267, 0, 1.5, 0.5, 0.5,
1, -3.867687, -6.674267, 0, -0.5, 0.5, 0.5,
1, -3.867687, -6.674267, 1, -0.5, 0.5, 0.5,
1, -3.867687, -6.674267, 1, 1.5, 0.5, 0.5,
1, -3.867687, -6.674267, 0, 1.5, 0.5, 0.5,
2, -3.867687, -6.674267, 0, -0.5, 0.5, 0.5,
2, -3.867687, -6.674267, 1, -0.5, 0.5, 0.5,
2, -3.867687, -6.674267, 1, 1.5, 0.5, 0.5,
2, -3.867687, -6.674267, 0, 1.5, 0.5, 0.5,
3, -3.867687, -6.674267, 0, -0.5, 0.5, 0.5,
3, -3.867687, -6.674267, 1, -0.5, 0.5, 0.5,
3, -3.867687, -6.674267, 1, 1.5, 0.5, 0.5,
3, -3.867687, -6.674267, 0, 1.5, 0.5, 0.5
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
-3.746619, -3, -5.841343,
-3.746619, 3, -5.841343,
-3.746619, -3, -5.841343,
-3.923795, -3, -6.118985,
-3.746619, -2, -5.841343,
-3.923795, -2, -6.118985,
-3.746619, -1, -5.841343,
-3.923795, -1, -6.118985,
-3.746619, 0, -5.841343,
-3.923795, 0, -6.118985,
-3.746619, 1, -5.841343,
-3.923795, 1, -6.118985,
-3.746619, 2, -5.841343,
-3.923795, 2, -6.118985,
-3.746619, 3, -5.841343,
-3.923795, 3, -6.118985
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
-4.278146, -3, -6.674267, 0, -0.5, 0.5, 0.5,
-4.278146, -3, -6.674267, 1, -0.5, 0.5, 0.5,
-4.278146, -3, -6.674267, 1, 1.5, 0.5, 0.5,
-4.278146, -3, -6.674267, 0, 1.5, 0.5, 0.5,
-4.278146, -2, -6.674267, 0, -0.5, 0.5, 0.5,
-4.278146, -2, -6.674267, 1, -0.5, 0.5, 0.5,
-4.278146, -2, -6.674267, 1, 1.5, 0.5, 0.5,
-4.278146, -2, -6.674267, 0, 1.5, 0.5, 0.5,
-4.278146, -1, -6.674267, 0, -0.5, 0.5, 0.5,
-4.278146, -1, -6.674267, 1, -0.5, 0.5, 0.5,
-4.278146, -1, -6.674267, 1, 1.5, 0.5, 0.5,
-4.278146, -1, -6.674267, 0, 1.5, 0.5, 0.5,
-4.278146, 0, -6.674267, 0, -0.5, 0.5, 0.5,
-4.278146, 0, -6.674267, 1, -0.5, 0.5, 0.5,
-4.278146, 0, -6.674267, 1, 1.5, 0.5, 0.5,
-4.278146, 0, -6.674267, 0, 1.5, 0.5, 0.5,
-4.278146, 1, -6.674267, 0, -0.5, 0.5, 0.5,
-4.278146, 1, -6.674267, 1, -0.5, 0.5, 0.5,
-4.278146, 1, -6.674267, 1, 1.5, 0.5, 0.5,
-4.278146, 1, -6.674267, 0, 1.5, 0.5, 0.5,
-4.278146, 2, -6.674267, 0, -0.5, 0.5, 0.5,
-4.278146, 2, -6.674267, 1, -0.5, 0.5, 0.5,
-4.278146, 2, -6.674267, 1, 1.5, 0.5, 0.5,
-4.278146, 2, -6.674267, 0, 1.5, 0.5, 0.5,
-4.278146, 3, -6.674267, 0, -0.5, 0.5, 0.5,
-4.278146, 3, -6.674267, 1, -0.5, 0.5, 0.5,
-4.278146, 3, -6.674267, 1, 1.5, 0.5, 0.5,
-4.278146, 3, -6.674267, 0, 1.5, 0.5, 0.5
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
-3.746619, -3.356845, -4,
-3.746619, -3.356845, 4,
-3.746619, -3.356845, -4,
-3.923795, -3.527126, -4,
-3.746619, -3.356845, -2,
-3.923795, -3.527126, -2,
-3.746619, -3.356845, 0,
-3.923795, -3.527126, 0,
-3.746619, -3.356845, 2,
-3.923795, -3.527126, 2,
-3.746619, -3.356845, 4,
-3.923795, -3.527126, 4
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
-4.278146, -3.867687, -4, 0, -0.5, 0.5, 0.5,
-4.278146, -3.867687, -4, 1, -0.5, 0.5, 0.5,
-4.278146, -3.867687, -4, 1, 1.5, 0.5, 0.5,
-4.278146, -3.867687, -4, 0, 1.5, 0.5, 0.5,
-4.278146, -3.867687, -2, 0, -0.5, 0.5, 0.5,
-4.278146, -3.867687, -2, 1, -0.5, 0.5, 0.5,
-4.278146, -3.867687, -2, 1, 1.5, 0.5, 0.5,
-4.278146, -3.867687, -2, 0, 1.5, 0.5, 0.5,
-4.278146, -3.867687, 0, 0, -0.5, 0.5, 0.5,
-4.278146, -3.867687, 0, 1, -0.5, 0.5, 0.5,
-4.278146, -3.867687, 0, 1, 1.5, 0.5, 0.5,
-4.278146, -3.867687, 0, 0, 1.5, 0.5, 0.5,
-4.278146, -3.867687, 2, 0, -0.5, 0.5, 0.5,
-4.278146, -3.867687, 2, 1, -0.5, 0.5, 0.5,
-4.278146, -3.867687, 2, 1, 1.5, 0.5, 0.5,
-4.278146, -3.867687, 2, 0, 1.5, 0.5, 0.5,
-4.278146, -3.867687, 4, 0, -0.5, 0.5, 0.5,
-4.278146, -3.867687, 4, 1, -0.5, 0.5, 0.5,
-4.278146, -3.867687, 4, 1, 1.5, 0.5, 0.5,
-4.278146, -3.867687, 4, 0, 1.5, 0.5, 0.5
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
-3.746619, -3.356845, -5.841343,
-3.746619, 3.454385, -5.841343,
-3.746619, -3.356845, 5.264306,
-3.746619, 3.454385, 5.264306,
-3.746619, -3.356845, -5.841343,
-3.746619, -3.356845, 5.264306,
-3.746619, 3.454385, -5.841343,
-3.746619, 3.454385, 5.264306,
-3.746619, -3.356845, -5.841343,
3.340398, -3.356845, -5.841343,
-3.746619, -3.356845, 5.264306,
3.340398, -3.356845, 5.264306,
-3.746619, 3.454385, -5.841343,
3.340398, 3.454385, -5.841343,
-3.746619, 3.454385, 5.264306,
3.340398, 3.454385, 5.264306,
3.340398, -3.356845, -5.841343,
3.340398, 3.454385, -5.841343,
3.340398, -3.356845, 5.264306,
3.340398, 3.454385, 5.264306,
3.340398, -3.356845, -5.841343,
3.340398, -3.356845, 5.264306,
3.340398, 3.454385, -5.841343,
3.340398, 3.454385, 5.264306
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
var radius = 7.919386;
var distance = 35.23425;
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
mvMatrix.translate( 0.2031107, -0.04877007, 0.2885189 );
mvMatrix.scale( 1.208209, 1.257129, 0.7710126 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.23425);
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
Camphene<-read.table("Camphene.xyz", skip=1)
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
-3.64341, 0.1830671, -1.773254, 0, 0, 1, 1, 1,
-3.321027, 0.8121175, -2.877534, 1, 0, 0, 1, 1,
-3.008335, 0.03596677, -2.212897, 1, 0, 0, 1, 1,
-2.971984, -0.4745209, -1.08264, 1, 0, 0, 1, 1,
-2.821079, 0.9986638, -0.4474298, 1, 0, 0, 1, 1,
-2.818884, 0.07285885, -1.135829, 1, 0, 0, 1, 1,
-2.672657, 0.691537, -1.428447, 0, 0, 0, 1, 1,
-2.578418, -0.6045958, -0.8207101, 0, 0, 0, 1, 1,
-2.570852, -2.071882, -2.993764, 0, 0, 0, 1, 1,
-2.45071, 0.9485338, -0.3491912, 0, 0, 0, 1, 1,
-2.421971, 0.7837812, -1.430946, 0, 0, 0, 1, 1,
-2.340783, 1.592561, -0.3085519, 0, 0, 0, 1, 1,
-2.327077, -0.9224347, 0.5159696, 0, 0, 0, 1, 1,
-2.193731, -0.1587066, -0.8267054, 1, 1, 1, 1, 1,
-2.140527, -1.548608, -2.128277, 1, 1, 1, 1, 1,
-2.123299, -0.9635491, -0.4366525, 1, 1, 1, 1, 1,
-2.078873, -0.3501192, -2.606992, 1, 1, 1, 1, 1,
-2.030547, -0.355579, -1.623604, 1, 1, 1, 1, 1,
-2.027246, 1.184649, -1.814337, 1, 1, 1, 1, 1,
-1.986769, -0.4433117, -0.7970809, 1, 1, 1, 1, 1,
-1.943632, -0.7977592, -0.8628955, 1, 1, 1, 1, 1,
-1.941237, -1.442723, -0.9082851, 1, 1, 1, 1, 1,
-1.93798, -0.6635132, -1.697293, 1, 1, 1, 1, 1,
-1.937307, 0.07562266, -1.564142, 1, 1, 1, 1, 1,
-1.920519, 1.701665, -1.73718, 1, 1, 1, 1, 1,
-1.903602, -0.7529261, -2.761675, 1, 1, 1, 1, 1,
-1.865773, -1.160775, -1.682686, 1, 1, 1, 1, 1,
-1.856781, -1.255351, -3.130353, 1, 1, 1, 1, 1,
-1.849356, -0.3590017, -0.9997054, 0, 0, 1, 1, 1,
-1.848092, 1.507554, -1.06562, 1, 0, 0, 1, 1,
-1.847267, 0.8538265, -2.338633, 1, 0, 0, 1, 1,
-1.846164, 1.103518, -1.044083, 1, 0, 0, 1, 1,
-1.830942, -1.090312, -0.6535563, 1, 0, 0, 1, 1,
-1.792949, 1.395163, -1.052231, 1, 0, 0, 1, 1,
-1.789637, -0.8239434, -2.71395, 0, 0, 0, 1, 1,
-1.789362, 0.4429018, -2.922865, 0, 0, 0, 1, 1,
-1.773367, -0.6274542, -3.007874, 0, 0, 0, 1, 1,
-1.771872, 0.5329214, -1.252176, 0, 0, 0, 1, 1,
-1.768471, -0.001816813, -0.3187922, 0, 0, 0, 1, 1,
-1.762547, 0.1478111, -2.015144, 0, 0, 0, 1, 1,
-1.747518, -1.55612, -1.158583, 0, 0, 0, 1, 1,
-1.744468, 0.7004901, -0.7459072, 1, 1, 1, 1, 1,
-1.734753, 0.06855351, -0.2386325, 1, 1, 1, 1, 1,
-1.714278, 1.107422, -1.286641, 1, 1, 1, 1, 1,
-1.711918, -0.7759601, 0.2411762, 1, 1, 1, 1, 1,
-1.707788, 0.04592413, 0.557936, 1, 1, 1, 1, 1,
-1.69021, -1.145731, -2.371568, 1, 1, 1, 1, 1,
-1.662634, -0.3729034, -1.239074, 1, 1, 1, 1, 1,
-1.650682, -0.3397449, -1.748731, 1, 1, 1, 1, 1,
-1.617261, 0.3323611, -0.8004591, 1, 1, 1, 1, 1,
-1.596902, 0.9146692, 0.3582249, 1, 1, 1, 1, 1,
-1.590133, -1.276285, -0.6097572, 1, 1, 1, 1, 1,
-1.589314, 1.296455, -2.222854, 1, 1, 1, 1, 1,
-1.583725, 0.1815477, -0.9587734, 1, 1, 1, 1, 1,
-1.580495, -0.7878201, -1.706058, 1, 1, 1, 1, 1,
-1.580017, -0.9380065, -2.911468, 1, 1, 1, 1, 1,
-1.556857, -0.4171287, -0.6255206, 0, 0, 1, 1, 1,
-1.55122, -0.5797496, -3.057501, 1, 0, 0, 1, 1,
-1.518428, -0.194629, -2.151945, 1, 0, 0, 1, 1,
-1.517311, -0.3470568, -0.9373274, 1, 0, 0, 1, 1,
-1.510165, 0.7640137, -0.7696515, 1, 0, 0, 1, 1,
-1.502437, 0.4523438, 0.1531568, 1, 0, 0, 1, 1,
-1.483394, 1.32574, -1.4552, 0, 0, 0, 1, 1,
-1.476665, -0.3689536, -2.192012, 0, 0, 0, 1, 1,
-1.471782, -1.027107, -2.447418, 0, 0, 0, 1, 1,
-1.464514, 0.5064388, -1.726963, 0, 0, 0, 1, 1,
-1.460832, -0.0968001, -3.110252, 0, 0, 0, 1, 1,
-1.459394, -0.5310053, -1.498347, 0, 0, 0, 1, 1,
-1.445722, 0.04246151, -1.669922, 0, 0, 0, 1, 1,
-1.424024, 0.4994289, -2.540557, 1, 1, 1, 1, 1,
-1.401629, -0.8689824, -3.213784, 1, 1, 1, 1, 1,
-1.39906, 0.7710709, -0.8470544, 1, 1, 1, 1, 1,
-1.398664, -0.4577976, -1.246352, 1, 1, 1, 1, 1,
-1.38905, 0.1992665, -1.299211, 1, 1, 1, 1, 1,
-1.381369, -0.05058281, -2.548878, 1, 1, 1, 1, 1,
-1.380498, -0.7917413, -3.130248, 1, 1, 1, 1, 1,
-1.375857, 1.405276, -0.9124221, 1, 1, 1, 1, 1,
-1.372999, -0.3945913, -1.832253, 1, 1, 1, 1, 1,
-1.370484, 0.627836, -2.712879, 1, 1, 1, 1, 1,
-1.361538, 0.6669911, -2.28117, 1, 1, 1, 1, 1,
-1.348321, -1.156926, -1.969933, 1, 1, 1, 1, 1,
-1.330671, -0.113111, -3.003154, 1, 1, 1, 1, 1,
-1.330206, 0.7336492, -0.3520104, 1, 1, 1, 1, 1,
-1.329293, -0.1780962, -0.50314, 1, 1, 1, 1, 1,
-1.328769, -0.5615242, -1.030753, 0, 0, 1, 1, 1,
-1.322779, 0.8619186, -1.664292, 1, 0, 0, 1, 1,
-1.304792, 0.2422145, -1.452817, 1, 0, 0, 1, 1,
-1.303762, 1.057212, -0.4662324, 1, 0, 0, 1, 1,
-1.297352, -1.420383, -1.110623, 1, 0, 0, 1, 1,
-1.292341, -0.2818434, -0.9125484, 1, 0, 0, 1, 1,
-1.289684, 2.344738, -0.07105057, 0, 0, 0, 1, 1,
-1.286023, 0.3261575, -1.691333, 0, 0, 0, 1, 1,
-1.278851, 0.4978854, -0.3011665, 0, 0, 0, 1, 1,
-1.273499, 1.261925, -0.04892931, 0, 0, 0, 1, 1,
-1.269549, -0.4485655, -4.176863, 0, 0, 0, 1, 1,
-1.268291, -0.0314723, -2.509514, 0, 0, 0, 1, 1,
-1.253535, 1.374013, -1.043087, 0, 0, 0, 1, 1,
-1.249117, -0.1454174, -0.1274197, 1, 1, 1, 1, 1,
-1.24227, -0.9005616, -3.663828, 1, 1, 1, 1, 1,
-1.238546, -1.516068, -1.878368, 1, 1, 1, 1, 1,
-1.229142, 0.07089791, -1.845536, 1, 1, 1, 1, 1,
-1.228513, 0.9564646, -1.919132, 1, 1, 1, 1, 1,
-1.223483, -1.44767, -1.726941, 1, 1, 1, 1, 1,
-1.220026, 0.1736504, -1.055986, 1, 1, 1, 1, 1,
-1.220014, 0.4175098, -1.708382, 1, 1, 1, 1, 1,
-1.218624, 1.123939, 0.03079484, 1, 1, 1, 1, 1,
-1.217701, 1.278336, -0.6863785, 1, 1, 1, 1, 1,
-1.21561, 0.2091664, -2.643242, 1, 1, 1, 1, 1,
-1.206204, 3.355192, 0.7204158, 1, 1, 1, 1, 1,
-1.204523, 0.2458952, -1.478203, 1, 1, 1, 1, 1,
-1.196509, -0.1115713, -2.593484, 1, 1, 1, 1, 1,
-1.195833, -0.670681, -0.5317487, 1, 1, 1, 1, 1,
-1.194101, 0.2166046, -1.313467, 0, 0, 1, 1, 1,
-1.189874, 0.812793, 0.3975265, 1, 0, 0, 1, 1,
-1.183738, -1.657547, -2.376199, 1, 0, 0, 1, 1,
-1.183432, 0.6662114, -2.717451, 1, 0, 0, 1, 1,
-1.177374, 1.403966, -0.7594072, 1, 0, 0, 1, 1,
-1.172447, 0.6872637, -0.9929293, 1, 0, 0, 1, 1,
-1.168376, 0.8921466, -0.6744408, 0, 0, 0, 1, 1,
-1.156218, 0.5793245, 0.9834079, 0, 0, 0, 1, 1,
-1.1528, 1.229639, -1.140448, 0, 0, 0, 1, 1,
-1.148258, -0.08489946, -2.408312, 0, 0, 0, 1, 1,
-1.137606, -0.8342897, -2.844429, 0, 0, 0, 1, 1,
-1.130924, -0.2479553, -2.786537, 0, 0, 0, 1, 1,
-1.123748, 0.4736343, -0.6739296, 0, 0, 0, 1, 1,
-1.121453, 0.4006265, 0.6854708, 1, 1, 1, 1, 1,
-1.114528, 0.3886608, -0.9904484, 1, 1, 1, 1, 1,
-1.105768, -0.4259703, 0.3196225, 1, 1, 1, 1, 1,
-1.088654, 0.9357846, -0.6362836, 1, 1, 1, 1, 1,
-1.087493, 0.9675481, -0.8325983, 1, 1, 1, 1, 1,
-1.078121, -1.504156, -2.528054, 1, 1, 1, 1, 1,
-1.075135, -0.205184, -0.2071186, 1, 1, 1, 1, 1,
-1.074683, 1.481924, -0.3698444, 1, 1, 1, 1, 1,
-1.073933, -1.600887, -1.439826, 1, 1, 1, 1, 1,
-1.06752, 0.9417076, -0.7201228, 1, 1, 1, 1, 1,
-1.066601, -0.9540647, -1.864016, 1, 1, 1, 1, 1,
-1.065844, -0.6144294, -1.43332, 1, 1, 1, 1, 1,
-1.064152, 0.8602509, -1.185041, 1, 1, 1, 1, 1,
-1.061136, 0.3723993, -1.965053, 1, 1, 1, 1, 1,
-1.053516, -0.2496834, -1.592272, 1, 1, 1, 1, 1,
-1.044756, -0.205086, -1.502095, 0, 0, 1, 1, 1,
-1.04455, -0.7463945, -1.559875, 1, 0, 0, 1, 1,
-1.039136, 0.7395608, -1.25771, 1, 0, 0, 1, 1,
-1.036635, -1.595958, -2.627507, 1, 0, 0, 1, 1,
-1.036191, 1.408645, -0.07591633, 1, 0, 0, 1, 1,
-1.033314, -1.364208, -2.308947, 1, 0, 0, 1, 1,
-1.031756, 0.4990746, -2.779752, 0, 0, 0, 1, 1,
-1.030345, -1.185928, -1.866727, 0, 0, 0, 1, 1,
-1.029945, 0.379151, -2.037017, 0, 0, 0, 1, 1,
-1.028539, 0.6511595, -0.982908, 0, 0, 0, 1, 1,
-1.018641, 3.014049, -0.4326071, 0, 0, 0, 1, 1,
-1.017292, -1.210931, -0.9585389, 0, 0, 0, 1, 1,
-1.015208, -1.049683, -2.743975, 0, 0, 0, 1, 1,
-0.9991547, -1.293367, -3.617726, 1, 1, 1, 1, 1,
-0.9953531, -0.7565925, -2.340875, 1, 1, 1, 1, 1,
-0.991581, 0.2464547, -0.4035389, 1, 1, 1, 1, 1,
-0.9841546, -0.6556669, -1.490355, 1, 1, 1, 1, 1,
-0.9789454, -0.3053628, -0.8598204, 1, 1, 1, 1, 1,
-0.9763888, -0.5659269, -1.816474, 1, 1, 1, 1, 1,
-0.9734123, 1.6906, -0.06737675, 1, 1, 1, 1, 1,
-0.9689721, -1.226933, -1.31136, 1, 1, 1, 1, 1,
-0.9672168, 0.3091682, -0.8500731, 1, 1, 1, 1, 1,
-0.9649978, -2.091804, -5.622212, 1, 1, 1, 1, 1,
-0.9510498, 1.548995, -0.03313648, 1, 1, 1, 1, 1,
-0.9482367, -0.5419368, -4.104036, 1, 1, 1, 1, 1,
-0.9474025, 0.6486099, -1.619245, 1, 1, 1, 1, 1,
-0.9436314, 0.03676194, -2.351253, 1, 1, 1, 1, 1,
-0.9252024, 1.297203, -1.149792, 1, 1, 1, 1, 1,
-0.9245765, -1.257511, -3.119545, 0, 0, 1, 1, 1,
-0.91925, 0.3890307, -0.9589418, 1, 0, 0, 1, 1,
-0.9149697, 1.038956, 0.2888558, 1, 0, 0, 1, 1,
-0.9118153, 0.7747517, -1.734773, 1, 0, 0, 1, 1,
-0.9113685, 1.09306, -1.619183, 1, 0, 0, 1, 1,
-0.8837721, -2.218702, -3.321549, 1, 0, 0, 1, 1,
-0.8824045, -2.412266, -2.531243, 0, 0, 0, 1, 1,
-0.8738855, -1.084969, -1.770561, 0, 0, 0, 1, 1,
-0.8723915, 1.402724, 0.3632785, 0, 0, 0, 1, 1,
-0.8686628, 2.981908, -0.9308984, 0, 0, 0, 1, 1,
-0.867905, -0.06736233, -3.860384, 0, 0, 0, 1, 1,
-0.8628961, 0.2649064, -1.239915, 0, 0, 0, 1, 1,
-0.8563763, 1.941937, 0.1148791, 0, 0, 0, 1, 1,
-0.8558552, 0.3548674, -0.6955871, 1, 1, 1, 1, 1,
-0.8479916, 1.343477, -1.266845, 1, 1, 1, 1, 1,
-0.8462341, 0.3724638, -2.367069, 1, 1, 1, 1, 1,
-0.8398242, 0.2651754, -0.4488107, 1, 1, 1, 1, 1,
-0.8303364, -0.5153794, -0.6507181, 1, 1, 1, 1, 1,
-0.8188043, -1.616194, -1.304198, 1, 1, 1, 1, 1,
-0.8174672, -1.157051, -3.438713, 1, 1, 1, 1, 1,
-0.8148121, 1.369055, -1.939715, 1, 1, 1, 1, 1,
-0.7992017, 0.9571796, 2.890758, 1, 1, 1, 1, 1,
-0.7903124, -0.3239092, 0.2259174, 1, 1, 1, 1, 1,
-0.7805002, 0.5569177, -0.9072694, 1, 1, 1, 1, 1,
-0.7723179, -2.78144, -2.078781, 1, 1, 1, 1, 1,
-0.76631, -1.418955, -2.920273, 1, 1, 1, 1, 1,
-0.7659661, 0.1191271, -0.936031, 1, 1, 1, 1, 1,
-0.7586257, 0.00677203, -0.2800107, 1, 1, 1, 1, 1,
-0.7541888, 1.361707, -2.982489, 0, 0, 1, 1, 1,
-0.7484639, 1.416918, -1.215769, 1, 0, 0, 1, 1,
-0.7466603, -0.2049679, -0.9467722, 1, 0, 0, 1, 1,
-0.744294, 0.112397, -1.285684, 1, 0, 0, 1, 1,
-0.7400613, 1.667225, 1.102751, 1, 0, 0, 1, 1,
-0.7386273, 0.756822, -0.9010139, 1, 0, 0, 1, 1,
-0.7350278, -1.695382, -2.528867, 0, 0, 0, 1, 1,
-0.7328262, -0.4496325, -3.571431, 0, 0, 0, 1, 1,
-0.7157059, 0.2559698, -0.7418681, 0, 0, 0, 1, 1,
-0.7141866, -0.5609137, -2.427617, 0, 0, 0, 1, 1,
-0.7137421, -2.062113, -3.634096, 0, 0, 0, 1, 1,
-0.7102465, -1.691135, -4.117804, 0, 0, 0, 1, 1,
-0.7087039, -0.5812107, -2.356156, 0, 0, 0, 1, 1,
-0.7050305, -1.990467, -2.737838, 1, 1, 1, 1, 1,
-0.7032915, -1.558295, -2.243335, 1, 1, 1, 1, 1,
-0.7029208, 0.7452786, -0.8185872, 1, 1, 1, 1, 1,
-0.7023434, 0.2160629, -1.115303, 1, 1, 1, 1, 1,
-0.69397, -0.08045624, -1.683791, 1, 1, 1, 1, 1,
-0.6924407, 0.4623266, -1.414934, 1, 1, 1, 1, 1,
-0.6903825, -0.7512214, -1.728879, 1, 1, 1, 1, 1,
-0.6895697, 0.670426, -1.78987, 1, 1, 1, 1, 1,
-0.6892791, 1.668949, 1.735971, 1, 1, 1, 1, 1,
-0.6879518, -0.02478842, -2.194302, 1, 1, 1, 1, 1,
-0.6798061, 1.643783, -0.2433818, 1, 1, 1, 1, 1,
-0.6791067, -0.2128918, -0.6121269, 1, 1, 1, 1, 1,
-0.6778178, 1.347376, -0.7910314, 1, 1, 1, 1, 1,
-0.6762262, 1.001895, -2.400748, 1, 1, 1, 1, 1,
-0.6759136, 0.04724734, -2.344014, 1, 1, 1, 1, 1,
-0.6751925, 1.870491, -1.428225, 0, 0, 1, 1, 1,
-0.6748023, -0.9129221, -2.753587, 1, 0, 0, 1, 1,
-0.6734586, -0.4690346, -0.4796233, 1, 0, 0, 1, 1,
-0.6661437, 0.2341816, -1.584578, 1, 0, 0, 1, 1,
-0.6653481, 0.1584885, 0.3422758, 1, 0, 0, 1, 1,
-0.6622955, -0.08658691, -1.276441, 1, 0, 0, 1, 1,
-0.64766, 0.1658591, -0.04206331, 0, 0, 0, 1, 1,
-0.6400731, -0.3010694, -1.205649, 0, 0, 0, 1, 1,
-0.6398872, 0.06693552, -0.9292135, 0, 0, 0, 1, 1,
-0.6392022, 0.2303063, -1.224622, 0, 0, 0, 1, 1,
-0.6349271, 0.8014622, -0.5985649, 0, 0, 0, 1, 1,
-0.631797, -1.130289, -3.441958, 0, 0, 0, 1, 1,
-0.6316333, -1.19521, -1.778971, 0, 0, 0, 1, 1,
-0.6211887, -1.556283, -2.497186, 1, 1, 1, 1, 1,
-0.6200008, 0.8912345, 0.4250486, 1, 1, 1, 1, 1,
-0.6194369, -1.628807, -4.07193, 1, 1, 1, 1, 1,
-0.6161758, 0.4596459, -2.6617, 1, 1, 1, 1, 1,
-0.6152638, 0.4620093, -0.9806705, 1, 1, 1, 1, 1,
-0.612943, 0.737996, 1.07765, 1, 1, 1, 1, 1,
-0.6117443, -0.8698168, -1.193849, 1, 1, 1, 1, 1,
-0.6052319, 0.5249914, -1.442149, 1, 1, 1, 1, 1,
-0.6028078, -0.3513748, -1.587993, 1, 1, 1, 1, 1,
-0.6017467, 0.7721087, 0.2459181, 1, 1, 1, 1, 1,
-0.5921019, -0.5524722, -1.315765, 1, 1, 1, 1, 1,
-0.5920868, 1.76679, 0.2126448, 1, 1, 1, 1, 1,
-0.5918534, -1.537274, -2.33531, 1, 1, 1, 1, 1,
-0.5846345, 0.7258646, -1.519927, 1, 1, 1, 1, 1,
-0.5830968, 0.7745132, -1.444835, 1, 1, 1, 1, 1,
-0.5810189, 0.7265148, -2.004007, 0, 0, 1, 1, 1,
-0.5801819, 0.3805979, -0.6828993, 1, 0, 0, 1, 1,
-0.5793364, 1.662343, -0.3372912, 1, 0, 0, 1, 1,
-0.5769146, -1.236507, -5.017761, 1, 0, 0, 1, 1,
-0.5767114, -1.489842, -2.506623, 1, 0, 0, 1, 1,
-0.576706, -0.08695045, -1.945541, 1, 0, 0, 1, 1,
-0.570934, 0.6764463, -0.6299098, 0, 0, 0, 1, 1,
-0.5692987, -0.01838798, -0.7104728, 0, 0, 0, 1, 1,
-0.5692574, 0.5333398, -1.625794, 0, 0, 0, 1, 1,
-0.5660485, 1.050074, -0.04180419, 0, 0, 0, 1, 1,
-0.5623332, 0.2708068, -1.266209, 0, 0, 0, 1, 1,
-0.5609159, 1.903986, 0.8145572, 0, 0, 0, 1, 1,
-0.5600022, -0.6628714, -2.501487, 0, 0, 0, 1, 1,
-0.558694, 0.04382247, -2.088386, 1, 1, 1, 1, 1,
-0.5571231, 1.441159, 0.1308096, 1, 1, 1, 1, 1,
-0.5484122, -1.183323, -4.368607, 1, 1, 1, 1, 1,
-0.5461548, 0.6802961, -0.753328, 1, 1, 1, 1, 1,
-0.5447078, -0.00804421, -2.288686, 1, 1, 1, 1, 1,
-0.5365419, 0.5889513, -2.614928, 1, 1, 1, 1, 1,
-0.5352035, -1.317092, -0.1748672, 1, 1, 1, 1, 1,
-0.5346436, -0.9949726, -3.275402, 1, 1, 1, 1, 1,
-0.53127, 1.167612, -1.662799, 1, 1, 1, 1, 1,
-0.5292161, 1.146675, -2.772697, 1, 1, 1, 1, 1,
-0.5257039, -2.850727, -3.885965, 1, 1, 1, 1, 1,
-0.5232987, -0.6351807, -0.5373302, 1, 1, 1, 1, 1,
-0.5205703, 0.3923509, -2.795259, 1, 1, 1, 1, 1,
-0.5146998, 0.2293647, 0.2233872, 1, 1, 1, 1, 1,
-0.5118684, 0.6189527, 0.6889253, 1, 1, 1, 1, 1,
-0.5071877, -1.234211, -1.382208, 0, 0, 1, 1, 1,
-0.5051351, -0.4052567, -2.350924, 1, 0, 0, 1, 1,
-0.5006254, -0.9135247, -2.998363, 1, 0, 0, 1, 1,
-0.4999737, 1.854292, 1.008599, 1, 0, 0, 1, 1,
-0.4996847, -1.234271, -3.87691, 1, 0, 0, 1, 1,
-0.496608, 0.3986486, -0.3637643, 1, 0, 0, 1, 1,
-0.4950311, 1.431948, -1.9781, 0, 0, 0, 1, 1,
-0.494633, 0.9027978, -1.201322, 0, 0, 0, 1, 1,
-0.4927475, -0.6405926, -2.773875, 0, 0, 0, 1, 1,
-0.4925948, 0.7693821, -0.4197125, 0, 0, 0, 1, 1,
-0.4876084, 0.7078057, -2.998253, 0, 0, 0, 1, 1,
-0.4868371, -0.4034318, -2.934127, 0, 0, 0, 1, 1,
-0.4851154, 1.053952, -0.8735802, 0, 0, 0, 1, 1,
-0.4827044, -0.4485359, -1.550998, 1, 1, 1, 1, 1,
-0.4794301, 0.3306215, 0.2069299, 1, 1, 1, 1, 1,
-0.4765577, -0.7883775, -1.508641, 1, 1, 1, 1, 1,
-0.4754138, -0.2219607, -1.408946, 1, 1, 1, 1, 1,
-0.4748981, 0.9485636, -0.4617364, 1, 1, 1, 1, 1,
-0.4705596, 0.790558, -0.8312182, 1, 1, 1, 1, 1,
-0.4664393, -0.1181119, -1.60609, 1, 1, 1, 1, 1,
-0.4641912, 1.011532, -2.568283, 1, 1, 1, 1, 1,
-0.46174, -0.846427, -2.257434, 1, 1, 1, 1, 1,
-0.4606266, -0.3162216, -1.405453, 1, 1, 1, 1, 1,
-0.4591813, 0.5140049, -0.5524681, 1, 1, 1, 1, 1,
-0.4582942, -0.8906331, -1.01226, 1, 1, 1, 1, 1,
-0.456453, -1.304245, -3.769803, 1, 1, 1, 1, 1,
-0.4499491, 0.2427527, -2.598051, 1, 1, 1, 1, 1,
-0.4439822, -0.8306587, -3.564773, 1, 1, 1, 1, 1,
-0.4436613, 1.005537, 1.548917, 0, 0, 1, 1, 1,
-0.4365332, 0.7463515, 0.1764176, 1, 0, 0, 1, 1,
-0.4347278, -0.8032243, -3.114446, 1, 0, 0, 1, 1,
-0.4314802, -1.052283, -2.000013, 1, 0, 0, 1, 1,
-0.4314318, -0.4526404, -1.608518, 1, 0, 0, 1, 1,
-0.4275577, 0.820672, -0.008795643, 1, 0, 0, 1, 1,
-0.4258525, 0.7170695, -0.5982896, 0, 0, 0, 1, 1,
-0.4257262, 0.7185761, -0.4140844, 0, 0, 0, 1, 1,
-0.4232991, 0.8610086, -1.871532, 0, 0, 0, 1, 1,
-0.4219958, 0.1857385, -1.851422, 0, 0, 0, 1, 1,
-0.4209366, 0.3355343, -2.108137, 0, 0, 0, 1, 1,
-0.4194365, -0.5301522, -2.319817, 0, 0, 0, 1, 1,
-0.4171352, -0.3694681, -2.325702, 0, 0, 0, 1, 1,
-0.4153558, 0.07530007, -1.55111, 1, 1, 1, 1, 1,
-0.4153036, 0.0773901, -1.162911, 1, 1, 1, 1, 1,
-0.4148749, 1.135138, -2.243121, 1, 1, 1, 1, 1,
-0.4143353, -0.8588652, -1.190277, 1, 1, 1, 1, 1,
-0.4112445, 0.2345394, -1.566041, 1, 1, 1, 1, 1,
-0.4047185, -0.8898929, -3.167676, 1, 1, 1, 1, 1,
-0.4031851, 1.391348, -0.321111, 1, 1, 1, 1, 1,
-0.4020996, 0.9559757, -1.012584, 1, 1, 1, 1, 1,
-0.4002923, 1.248702, -0.9434443, 1, 1, 1, 1, 1,
-0.3989181, -1.279482, -1.976022, 1, 1, 1, 1, 1,
-0.3976476, 0.1387804, -2.385122, 1, 1, 1, 1, 1,
-0.395653, -0.6738964, -0.003428455, 1, 1, 1, 1, 1,
-0.3944854, 1.277037, -0.4915386, 1, 1, 1, 1, 1,
-0.3897724, -1.13216, -4.161414, 1, 1, 1, 1, 1,
-0.3861581, 1.093391, 1.103462, 1, 1, 1, 1, 1,
-0.3811255, 1.64735, -0.5229086, 0, 0, 1, 1, 1,
-0.3788899, 2.004136, -0.7451954, 1, 0, 0, 1, 1,
-0.3746052, -1.107159, -3.34058, 1, 0, 0, 1, 1,
-0.3729754, -0.153041, -1.621994, 1, 0, 0, 1, 1,
-0.3711098, 0.4326259, -1.858282, 1, 0, 0, 1, 1,
-0.3710315, -0.9160143, -0.5183562, 1, 0, 0, 1, 1,
-0.3644264, 0.1714595, -2.009444, 0, 0, 0, 1, 1,
-0.3640211, -1.029393, -1.757359, 0, 0, 0, 1, 1,
-0.3589627, 0.7958912, 0.08864656, 0, 0, 0, 1, 1,
-0.3584432, 1.623585, -0.6273365, 0, 0, 0, 1, 1,
-0.356321, 0.4474172, 0.2286686, 0, 0, 0, 1, 1,
-0.3538658, 1.010136, -1.328937, 0, 0, 0, 1, 1,
-0.3529772, -0.3280456, -3.875505, 0, 0, 0, 1, 1,
-0.3522184, 0.565226, 0.01163313, 1, 1, 1, 1, 1,
-0.3506738, 0.2147997, -0.8857702, 1, 1, 1, 1, 1,
-0.3435688, -0.7843956, -2.111614, 1, 1, 1, 1, 1,
-0.3427395, 0.2613476, -0.7127597, 1, 1, 1, 1, 1,
-0.3341095, 0.9464575, -0.5441855, 1, 1, 1, 1, 1,
-0.3326484, 1.101747, -1.205367, 1, 1, 1, 1, 1,
-0.3312683, -1.399281, -2.742965, 1, 1, 1, 1, 1,
-0.3308456, -0.07028504, -0.9886841, 1, 1, 1, 1, 1,
-0.3295215, 1.206861, 0.07202974, 1, 1, 1, 1, 1,
-0.3268662, -1.013958, -4.306015, 1, 1, 1, 1, 1,
-0.3241692, -1.172661, -3.238232, 1, 1, 1, 1, 1,
-0.323893, -0.7423744, -2.594532, 1, 1, 1, 1, 1,
-0.3231218, 0.1224313, -0.7141672, 1, 1, 1, 1, 1,
-0.3205306, 2.562505, 0.300934, 1, 1, 1, 1, 1,
-0.3150971, 1.772639, 0.4809951, 1, 1, 1, 1, 1,
-0.3143324, 0.3338366, -2.172331, 0, 0, 1, 1, 1,
-0.3094377, -0.07440475, -2.790729, 1, 0, 0, 1, 1,
-0.3036791, -0.991834, -2.365653, 1, 0, 0, 1, 1,
-0.2977642, -1.844502, -3.1914, 1, 0, 0, 1, 1,
-0.2974577, 0.08913625, -0.9841216, 1, 0, 0, 1, 1,
-0.2942294, -0.6125687, -0.8098405, 1, 0, 0, 1, 1,
-0.2933687, -0.5451899, -1.958489, 0, 0, 0, 1, 1,
-0.2905215, -0.03731714, -3.413566, 0, 0, 0, 1, 1,
-0.2885911, 2.905898, -1.339381, 0, 0, 0, 1, 1,
-0.285614, -0.6571254, -4.088254, 0, 0, 0, 1, 1,
-0.2841364, -1.101291, -1.452264, 0, 0, 0, 1, 1,
-0.2827051, -0.5283241, -2.729251, 0, 0, 0, 1, 1,
-0.2816325, 0.009011314, -0.2968559, 0, 0, 0, 1, 1,
-0.2782861, -0.4809456, -0.9970561, 1, 1, 1, 1, 1,
-0.2760921, -0.4176448, -3.329989, 1, 1, 1, 1, 1,
-0.2735715, -1.421721, -2.648694, 1, 1, 1, 1, 1,
-0.2665627, 0.323474, -1.360971, 1, 1, 1, 1, 1,
-0.2594586, 0.1194359, -1.067634, 1, 1, 1, 1, 1,
-0.2593785, 0.3156398, -0.2762283, 1, 1, 1, 1, 1,
-0.2590494, -1.726035, -3.541235, 1, 1, 1, 1, 1,
-0.2582442, 0.6508945, 0.9390262, 1, 1, 1, 1, 1,
-0.2562642, -0.008773074, -0.8964518, 1, 1, 1, 1, 1,
-0.2556414, -0.3956837, -2.482554, 1, 1, 1, 1, 1,
-0.2531065, -1.108501, -2.764349, 1, 1, 1, 1, 1,
-0.2530679, -1.982623, -2.704917, 1, 1, 1, 1, 1,
-0.251256, 1.030179, -0.895318, 1, 1, 1, 1, 1,
-0.2426574, 1.581562, 1.244685, 1, 1, 1, 1, 1,
-0.2401235, 1.510986, -0.8268816, 1, 1, 1, 1, 1,
-0.2367734, 0.3910974, -0.1325819, 0, 0, 1, 1, 1,
-0.2314355, 0.8684404, -0.2359187, 1, 0, 0, 1, 1,
-0.2301596, -0.4651386, -0.183034, 1, 0, 0, 1, 1,
-0.229569, 0.3148537, -0.8771774, 1, 0, 0, 1, 1,
-0.2274329, -0.06721615, -3.336446, 1, 0, 0, 1, 1,
-0.2219108, 0.9439474, -0.8327521, 1, 0, 0, 1, 1,
-0.2198527, 1.326808, -1.780626, 0, 0, 0, 1, 1,
-0.2139456, -0.6349895, -3.803421, 0, 0, 0, 1, 1,
-0.2072573, -0.2543636, -2.440327, 0, 0, 0, 1, 1,
-0.2036338, 0.2738326, -0.6094438, 0, 0, 0, 1, 1,
-0.2018341, -0.3109019, -1.339745, 0, 0, 0, 1, 1,
-0.1996416, -0.3150599, -3.17278, 0, 0, 0, 1, 1,
-0.1967209, -0.8718068, -1.846826, 0, 0, 0, 1, 1,
-0.1950711, 2.998509, -1.315128, 1, 1, 1, 1, 1,
-0.1895594, 0.4550156, 0.9151422, 1, 1, 1, 1, 1,
-0.1863108, 0.4714245, 0.1702322, 1, 1, 1, 1, 1,
-0.184133, -0.7689937, -4.070529, 1, 1, 1, 1, 1,
-0.1841118, 0.2642535, -0.21665, 1, 1, 1, 1, 1,
-0.1756529, -0.1697103, -1.449935, 1, 1, 1, 1, 1,
-0.1754615, -0.6118402, -2.107271, 1, 1, 1, 1, 1,
-0.1725411, 0.2469711, 0.5356948, 1, 1, 1, 1, 1,
-0.1635364, -0.1253711, -2.729285, 1, 1, 1, 1, 1,
-0.1615479, -2.33764, -3.90954, 1, 1, 1, 1, 1,
-0.1611478, -0.4170799, -1.13664, 1, 1, 1, 1, 1,
-0.1577993, 0.4558022, 0.6293424, 1, 1, 1, 1, 1,
-0.1472449, -0.3473046, -5.679611, 1, 1, 1, 1, 1,
-0.1471188, -1.542149, -1.725356, 1, 1, 1, 1, 1,
-0.1443052, -1.169626, -4.257415, 1, 1, 1, 1, 1,
-0.1400128, -0.1517624, -2.250026, 0, 0, 1, 1, 1,
-0.1388807, 0.5278185, 2.194996, 1, 0, 0, 1, 1,
-0.1371213, 1.511204, -0.6669256, 1, 0, 0, 1, 1,
-0.136405, -0.3915157, -3.870982, 1, 0, 0, 1, 1,
-0.1356631, -0.7670407, -2.730939, 1, 0, 0, 1, 1,
-0.1298606, 1.097022, -0.5429678, 1, 0, 0, 1, 1,
-0.1269529, 1.011812, 0.5252463, 0, 0, 0, 1, 1,
-0.1247735, -0.8238273, -2.714561, 0, 0, 0, 1, 1,
-0.119906, 0.2374701, -0.8471895, 0, 0, 0, 1, 1,
-0.1197291, 0.5803466, -0.4714248, 0, 0, 0, 1, 1,
-0.1162263, 0.5766776, -1.274292, 0, 0, 0, 1, 1,
-0.1153482, -0.29759, -4.384686, 0, 0, 0, 1, 1,
-0.1109937, 2.032279, 0.8629965, 0, 0, 0, 1, 1,
-0.1109541, -1.671596, -2.550997, 1, 1, 1, 1, 1,
-0.1096325, 0.004559406, -1.177835, 1, 1, 1, 1, 1,
-0.1079738, -0.8029346, -3.217362, 1, 1, 1, 1, 1,
-0.1036515, 0.9652697, -2.702713, 1, 1, 1, 1, 1,
-0.09907866, -0.5939332, -3.643902, 1, 1, 1, 1, 1,
-0.09905738, -0.8229287, -3.210412, 1, 1, 1, 1, 1,
-0.09628374, -0.0084926, -1.64078, 1, 1, 1, 1, 1,
-0.09432969, -1.09694, -2.937253, 1, 1, 1, 1, 1,
-0.09354708, 1.762325, -0.2866326, 1, 1, 1, 1, 1,
-0.09136323, 0.225379, -0.3591709, 1, 1, 1, 1, 1,
-0.09083451, 0.9221934, 0.1508817, 1, 1, 1, 1, 1,
-0.08296599, -0.6501623, -2.494789, 1, 1, 1, 1, 1,
-0.08095599, -1.120205, -2.853941, 1, 1, 1, 1, 1,
-0.08093733, -1.304229, -4.961543, 1, 1, 1, 1, 1,
-0.07104082, -0.1574233, -2.911115, 1, 1, 1, 1, 1,
-0.06626395, -0.6136792, -2.235032, 0, 0, 1, 1, 1,
-0.06542225, -1.652102, -1.65005, 1, 0, 0, 1, 1,
-0.06502709, -1.0274, -3.283045, 1, 0, 0, 1, 1,
-0.06349737, -0.8338882, -2.543779, 1, 0, 0, 1, 1,
-0.06294726, -1.178384, -2.742706, 1, 0, 0, 1, 1,
-0.06067136, 0.180728, -1.17907, 1, 0, 0, 1, 1,
-0.05092861, -0.2722729, -2.59476, 0, 0, 0, 1, 1,
-0.05015012, -0.0315144, -1.137822, 0, 0, 0, 1, 1,
-0.04459843, 0.5268943, 1.363595, 0, 0, 0, 1, 1,
-0.0328666, -1.121396, -1.93013, 0, 0, 0, 1, 1,
-0.02944109, -0.1818845, -3.760536, 0, 0, 0, 1, 1,
-0.02897083, 0.6679468, -0.8671296, 0, 0, 0, 1, 1,
-0.02412516, 0.5715973, -1.688608, 0, 0, 0, 1, 1,
-0.0231289, 0.3919337, 1.060056, 1, 1, 1, 1, 1,
-0.02276365, 0.1065294, 0.2431187, 1, 1, 1, 1, 1,
-0.02001756, 0.9763628, 0.4314307, 1, 1, 1, 1, 1,
-0.01916873, 0.3696673, -0.1430308, 1, 1, 1, 1, 1,
-0.01524286, -0.2534651, -4.007793, 1, 1, 1, 1, 1,
-0.01489527, -1.761135, -1.499067, 1, 1, 1, 1, 1,
-0.01017208, -0.4042386, -2.297002, 1, 1, 1, 1, 1,
-0.005331357, 0.4965185, -0.1781783, 1, 1, 1, 1, 1,
-0.001292257, 0.927569, 0.07663395, 1, 1, 1, 1, 1,
-0.0008227122, 1.546399, 0.4792681, 1, 1, 1, 1, 1,
-0.0006489649, -0.2593487, -3.206897, 1, 1, 1, 1, 1,
0.001130823, -0.1989725, 4.041714, 1, 1, 1, 1, 1,
0.001209455, -0.618575, 2.995849, 1, 1, 1, 1, 1,
0.001243458, 2.204365, 0.07570314, 1, 1, 1, 1, 1,
0.006356341, -0.8137545, 0.08055376, 1, 1, 1, 1, 1,
0.008440777, 0.291959, 0.3932459, 0, 0, 1, 1, 1,
0.01004216, -0.768875, 0.8805841, 1, 0, 0, 1, 1,
0.01172047, -2.028311, 2.135082, 1, 0, 0, 1, 1,
0.01423433, 0.2308768, 1.883955, 1, 0, 0, 1, 1,
0.01758107, 0.1890922, 2.218194, 1, 0, 0, 1, 1,
0.01942909, 0.4464009, -0.3098776, 1, 0, 0, 1, 1,
0.02186833, -0.4419146, 1.812334, 0, 0, 0, 1, 1,
0.0225363, -0.7982286, 3.105822, 0, 0, 0, 1, 1,
0.02435177, 1.087084, -2.253376, 0, 0, 0, 1, 1,
0.02468345, 1.082597, -0.3359925, 0, 0, 0, 1, 1,
0.03127631, -0.287942, 2.26486, 0, 0, 0, 1, 1,
0.03190892, 0.9959324, -0.2636098, 0, 0, 0, 1, 1,
0.03568098, 0.7492413, 0.6868808, 0, 0, 0, 1, 1,
0.04047097, 0.7304352, 1.353218, 1, 1, 1, 1, 1,
0.04154037, -0.1585018, 2.611296, 1, 1, 1, 1, 1,
0.0415706, -0.6542913, 2.440378, 1, 1, 1, 1, 1,
0.04239193, -0.9171875, 4.162996, 1, 1, 1, 1, 1,
0.04265509, 0.3534382, -1.863079, 1, 1, 1, 1, 1,
0.04570306, -1.700985, 2.439981, 1, 1, 1, 1, 1,
0.04600238, -0.8916836, 3.15978, 1, 1, 1, 1, 1,
0.04967603, -0.5722926, 4.521695, 1, 1, 1, 1, 1,
0.04995747, -1.012198, 3.815614, 1, 1, 1, 1, 1,
0.05007667, -0.8379913, 4.183366, 1, 1, 1, 1, 1,
0.05151609, -0.1286184, 0.7845243, 1, 1, 1, 1, 1,
0.05426487, 1.332986, 0.04845348, 1, 1, 1, 1, 1,
0.05566846, -0.1448427, 3.187643, 1, 1, 1, 1, 1,
0.05712292, -0.1846813, 2.894069, 1, 1, 1, 1, 1,
0.05763999, -0.7472202, 1.419663, 1, 1, 1, 1, 1,
0.0580361, 0.2190491, 1.049211, 0, 0, 1, 1, 1,
0.05858509, -1.129574, 4.22076, 1, 0, 0, 1, 1,
0.060637, 0.296211, -0.731661, 1, 0, 0, 1, 1,
0.06122205, -0.6896799, 2.527766, 1, 0, 0, 1, 1,
0.06211599, 0.4115582, -2.772464, 1, 0, 0, 1, 1,
0.07082575, -1.024227, 3.844908, 1, 0, 0, 1, 1,
0.0721743, 0.7447301, 0.6236004, 0, 0, 0, 1, 1,
0.07479864, -0.5549881, 2.703954, 0, 0, 0, 1, 1,
0.07574953, 0.2454323, 1.344072, 0, 0, 0, 1, 1,
0.07761171, 0.2005715, 1.135426, 0, 0, 0, 1, 1,
0.07790079, -1.634839, 3.4644, 0, 0, 0, 1, 1,
0.07890649, -0.4761993, 3.119377, 0, 0, 0, 1, 1,
0.07913826, -1.911412, 4.551462, 0, 0, 0, 1, 1,
0.08076762, -0.9848143, 2.707541, 1, 1, 1, 1, 1,
0.0808474, -0.3465474, 3.050403, 1, 1, 1, 1, 1,
0.0876351, 0.5195961, 0.6042634, 1, 1, 1, 1, 1,
0.0881237, 0.09954704, -0.150778, 1, 1, 1, 1, 1,
0.09408462, -2.372203, 1.221915, 1, 1, 1, 1, 1,
0.09676655, 0.2689577, 0.7704691, 1, 1, 1, 1, 1,
0.09996928, -0.9912362, 2.715841, 1, 1, 1, 1, 1,
0.1003017, 0.9147355, 0.742624, 1, 1, 1, 1, 1,
0.1015471, -0.503363, 3.051692, 1, 1, 1, 1, 1,
0.1063987, -0.4916779, 3.04297, 1, 1, 1, 1, 1,
0.106774, -0.6585743, 3.496948, 1, 1, 1, 1, 1,
0.1091905, 1.10717, -1.588615, 1, 1, 1, 1, 1,
0.1152423, -0.3428693, 4.105205, 1, 1, 1, 1, 1,
0.1157891, -0.8621782, 3.313817, 1, 1, 1, 1, 1,
0.1172154, 2.596564, 0.9404245, 1, 1, 1, 1, 1,
0.11885, -0.5984116, 3.18682, 0, 0, 1, 1, 1,
0.1190965, 0.9817241, -2.501582, 1, 0, 0, 1, 1,
0.121771, -0.655107, 2.166892, 1, 0, 0, 1, 1,
0.1230785, 1.386299, 0.5708549, 1, 0, 0, 1, 1,
0.1268146, 0.0114947, 2.389761, 1, 0, 0, 1, 1,
0.1273579, 0.918605, 1.546852, 1, 0, 0, 1, 1,
0.1372351, 1.034902, -0.6300048, 0, 0, 0, 1, 1,
0.1380819, -0.8602105, 2.813073, 0, 0, 0, 1, 1,
0.1384443, -0.01164237, 2.488398, 0, 0, 0, 1, 1,
0.1411654, -0.9702466, 3.583995, 0, 0, 0, 1, 1,
0.1415261, 0.2614638, -0.6677261, 0, 0, 0, 1, 1,
0.1464179, -0.6215727, 3.025487, 0, 0, 0, 1, 1,
0.146605, 1.452398, 0.1018515, 0, 0, 0, 1, 1,
0.1485519, 0.6630307, 0.8871257, 1, 1, 1, 1, 1,
0.1519904, -1.365067, 3.179584, 1, 1, 1, 1, 1,
0.1542663, 1.9108, -2.039257, 1, 1, 1, 1, 1,
0.1544317, -0.7920105, 3.140501, 1, 1, 1, 1, 1,
0.1545051, 0.4334783, 0.4068083, 1, 1, 1, 1, 1,
0.1590806, -0.0197372, 1.425467, 1, 1, 1, 1, 1,
0.1594942, -0.9970167, 0.4331007, 1, 1, 1, 1, 1,
0.1621674, -0.2002545, 0.8680242, 1, 1, 1, 1, 1,
0.1625592, -1.427023, 1.810511, 1, 1, 1, 1, 1,
0.162929, -0.6358995, 4.606416, 1, 1, 1, 1, 1,
0.1668015, 0.9220358, 0.4794922, 1, 1, 1, 1, 1,
0.1701901, 0.5707314, 0.03881067, 1, 1, 1, 1, 1,
0.1731916, -0.2609729, 2.085493, 1, 1, 1, 1, 1,
0.1775704, 0.475829, -0.3152075, 1, 1, 1, 1, 1,
0.18247, -0.1547045, 2.081797, 1, 1, 1, 1, 1,
0.1842405, 0.344501, -0.3249861, 0, 0, 1, 1, 1,
0.1871133, 0.3603701, 0.5451024, 1, 0, 0, 1, 1,
0.1906258, 0.2389476, -0.8261507, 1, 0, 0, 1, 1,
0.1925915, 0.09750129, 0.8709125, 1, 0, 0, 1, 1,
0.1959437, -0.6910507, 3.006402, 1, 0, 0, 1, 1,
0.1985217, -1.029157, 3.060025, 1, 0, 0, 1, 1,
0.199599, 0.7652107, 0.02365017, 0, 0, 0, 1, 1,
0.2000654, -0.5575027, 2.473456, 0, 0, 0, 1, 1,
0.2018659, 1.958381, 0.3184804, 0, 0, 0, 1, 1,
0.202155, -2.494982, 3.902326, 0, 0, 0, 1, 1,
0.2027521, 0.7170057, 1.357298, 0, 0, 0, 1, 1,
0.2037624, -0.7438406, 2.533367, 0, 0, 0, 1, 1,
0.2065708, 0.5648827, -0.908254, 0, 0, 0, 1, 1,
0.2093279, 2.277471, 1.021757, 1, 1, 1, 1, 1,
0.2097597, 1.537094, -0.6116878, 1, 1, 1, 1, 1,
0.210904, 0.3028114, 0.2893585, 1, 1, 1, 1, 1,
0.2154269, -0.6028075, 2.029123, 1, 1, 1, 1, 1,
0.2165813, -1.002911, 2.700932, 1, 1, 1, 1, 1,
0.2180585, 0.09470423, 2.099846, 1, 1, 1, 1, 1,
0.2229761, -0.2664434, 2.577367, 1, 1, 1, 1, 1,
0.238085, -0.287236, 2.532862, 1, 1, 1, 1, 1,
0.2505021, -1.012955, 4.465929, 1, 1, 1, 1, 1,
0.2514244, 0.0757251, 0.06142784, 1, 1, 1, 1, 1,
0.2552078, 1.820462, 2.485443, 1, 1, 1, 1, 1,
0.25873, 0.09770034, 1.496923, 1, 1, 1, 1, 1,
0.2589253, -0.3077106, 1.99695, 1, 1, 1, 1, 1,
0.2597973, -0.2593478, 1.717684, 1, 1, 1, 1, 1,
0.2622032, 1.479351, 0.09732451, 1, 1, 1, 1, 1,
0.2636762, -3.257652, 4.155931, 0, 0, 1, 1, 1,
0.2653912, -0.08293173, 2.308621, 1, 0, 0, 1, 1,
0.2655998, 1.377188, 0.02105704, 1, 0, 0, 1, 1,
0.2682212, 1.037069, 0.4215105, 1, 0, 0, 1, 1,
0.2694793, 0.6721399, 0.1719706, 1, 0, 0, 1, 1,
0.2772865, -0.7860237, 3.80245, 1, 0, 0, 1, 1,
0.279742, 1.816205, -1.315685, 0, 0, 0, 1, 1,
0.2938769, -0.294172, 0.9417899, 0, 0, 0, 1, 1,
0.2959742, 0.2387104, -0.8616338, 0, 0, 0, 1, 1,
0.2989945, -2.032717, 2.30994, 0, 0, 0, 1, 1,
0.3038385, -0.5481221, 3.985947, 0, 0, 0, 1, 1,
0.304221, 0.2876521, 0.470725, 0, 0, 0, 1, 1,
0.3053027, -0.2966338, 2.320956, 0, 0, 0, 1, 1,
0.3097956, -0.2534144, 1.109323, 1, 1, 1, 1, 1,
0.3102469, -1.451553, 3.097794, 1, 1, 1, 1, 1,
0.3108681, -2.265791, 4.198767, 1, 1, 1, 1, 1,
0.3117379, 0.1713219, 0.9085743, 1, 1, 1, 1, 1,
0.315384, 2.649262, -2.612384, 1, 1, 1, 1, 1,
0.3161916, 0.8467622, -0.4923264, 1, 1, 1, 1, 1,
0.3178902, -0.9667022, 4.307785, 1, 1, 1, 1, 1,
0.3192488, 1.669506, -0.680662, 1, 1, 1, 1, 1,
0.3249829, 0.2610238, 2.700784, 1, 1, 1, 1, 1,
0.3250768, 0.488251, -0.1824148, 1, 1, 1, 1, 1,
0.3269071, -1.714825, 1.148378, 1, 1, 1, 1, 1,
0.3323987, -0.3633968, 2.770138, 1, 1, 1, 1, 1,
0.3349936, -0.8143296, 2.301327, 1, 1, 1, 1, 1,
0.337727, 0.3432863, -0.8656774, 1, 1, 1, 1, 1,
0.3440178, -0.7918782, 3.55601, 1, 1, 1, 1, 1,
0.3453622, -0.9073682, 3.617763, 0, 0, 1, 1, 1,
0.3482252, -0.1832169, 0.8567063, 1, 0, 0, 1, 1,
0.3488323, 0.06916781, 0.3907329, 1, 0, 0, 1, 1,
0.3516513, -1.110438, 1.935876, 1, 0, 0, 1, 1,
0.3604951, 0.3358348, 0.05718258, 1, 0, 0, 1, 1,
0.3676829, -0.7226334, 2.993289, 1, 0, 0, 1, 1,
0.3702064, 0.7764441, 1.228799, 0, 0, 0, 1, 1,
0.3759748, 1.460066, 0.1419744, 0, 0, 0, 1, 1,
0.3812848, -0.8590503, 4.622159, 0, 0, 0, 1, 1,
0.3817407, -0.2962096, 0.8553222, 0, 0, 0, 1, 1,
0.3830024, 0.5253121, 0.3506038, 0, 0, 0, 1, 1,
0.3849257, 0.7123115, 1.040802, 0, 0, 0, 1, 1,
0.3880247, -0.3342284, 0.7747149, 0, 0, 0, 1, 1,
0.3904125, 0.2993166, 1.647801, 1, 1, 1, 1, 1,
0.3949641, -0.2462485, 3.418452, 1, 1, 1, 1, 1,
0.396428, 0.3322145, 3.198027, 1, 1, 1, 1, 1,
0.4002028, -1.095218, 3.258264, 1, 1, 1, 1, 1,
0.4016431, -0.8621245, 2.922637, 1, 1, 1, 1, 1,
0.401952, -0.3026195, 2.706183, 1, 1, 1, 1, 1,
0.410136, 1.515245, 2.65326, 1, 1, 1, 1, 1,
0.4188488, 0.0114908, 3.115667, 1, 1, 1, 1, 1,
0.426018, 1.385124, 0.149955, 1, 1, 1, 1, 1,
0.4275092, -0.9643977, -0.07777384, 1, 1, 1, 1, 1,
0.4283873, 0.1976406, 1.574754, 1, 1, 1, 1, 1,
0.4317764, 1.132175, -3.173244, 1, 1, 1, 1, 1,
0.4371486, -0.1811306, 0.9625256, 1, 1, 1, 1, 1,
0.4380077, -0.1580089, 2.276531, 1, 1, 1, 1, 1,
0.4461974, 0.3752643, 0.8102002, 1, 1, 1, 1, 1,
0.4527032, 1.347731, 1.707508, 0, 0, 1, 1, 1,
0.4702083, -0.3917831, 0.8096385, 1, 0, 0, 1, 1,
0.4764617, -0.6634692, 3.058887, 1, 0, 0, 1, 1,
0.4766937, 0.5162028, 0.1359352, 1, 0, 0, 1, 1,
0.4808423, -0.2655649, 1.707101, 1, 0, 0, 1, 1,
0.484133, 0.2256343, 0.6363289, 1, 0, 0, 1, 1,
0.4900129, 0.9387808, 0.215084, 0, 0, 0, 1, 1,
0.4908204, -0.8489645, 0.762557, 0, 0, 0, 1, 1,
0.4936008, 0.22929, 0.5763397, 0, 0, 0, 1, 1,
0.4970928, -0.7152193, 2.036935, 0, 0, 0, 1, 1,
0.5063552, 0.7193351, 0.9397885, 0, 0, 0, 1, 1,
0.5079427, -0.529274, 2.412324, 0, 0, 0, 1, 1,
0.5131133, -1.385942, 2.656965, 0, 0, 0, 1, 1,
0.5139738, -0.5206891, 1.98633, 1, 1, 1, 1, 1,
0.517032, -1.005571, 2.798194, 1, 1, 1, 1, 1,
0.5190067, 0.6140852, 3.136942, 1, 1, 1, 1, 1,
0.5195929, 1.603938, 0.9546664, 1, 1, 1, 1, 1,
0.5207084, 1.145008, 3.417198, 1, 1, 1, 1, 1,
0.5214764, 0.65122, 0.1550532, 1, 1, 1, 1, 1,
0.5274658, 1.350847, 1.189375, 1, 1, 1, 1, 1,
0.5288202, -1.45255, 2.649426, 1, 1, 1, 1, 1,
0.5290673, -1.350245, 2.011757, 1, 1, 1, 1, 1,
0.5335389, -1.704619, 3.285468, 1, 1, 1, 1, 1,
0.5337396, 0.07429259, 0.5808806, 1, 1, 1, 1, 1,
0.5343791, -0.6484461, 2.066202, 1, 1, 1, 1, 1,
0.5367297, 0.7423959, 2.178423, 1, 1, 1, 1, 1,
0.5380861, -0.5337596, 3.467442, 1, 1, 1, 1, 1,
0.5382171, -1.203617, 2.403828, 1, 1, 1, 1, 1,
0.5403117, 0.5887499, 2.493104, 0, 0, 1, 1, 1,
0.5413579, 0.4340092, 0.4316732, 1, 0, 0, 1, 1,
0.5429255, 0.34984, 0.7560115, 1, 0, 0, 1, 1,
0.5449005, -0.2857997, 0.7043883, 1, 0, 0, 1, 1,
0.5473422, 0.2251664, 2.767186, 1, 0, 0, 1, 1,
0.5522241, 0.4958837, 1.777905, 1, 0, 0, 1, 1,
0.5564722, 0.3403713, 3.483446, 0, 0, 0, 1, 1,
0.5595163, 0.05695973, 1.52695, 0, 0, 0, 1, 1,
0.5631924, 0.2910429, 2.094356, 0, 0, 0, 1, 1,
0.5644183, -0.6833302, 1.259203, 0, 0, 0, 1, 1,
0.5672216, -1.948078, 5.102573, 0, 0, 0, 1, 1,
0.5693967, -0.5114045, 2.643151, 0, 0, 0, 1, 1,
0.5704691, -2.016177, 2.893538, 0, 0, 0, 1, 1,
0.570628, 1.57148, 1.563221, 1, 1, 1, 1, 1,
0.5726917, -0.2301547, 2.417097, 1, 1, 1, 1, 1,
0.5729487, 0.4648728, 1.739903, 1, 1, 1, 1, 1,
0.5775267, 0.9235145, 0.9246597, 1, 1, 1, 1, 1,
0.5804605, -1.424905, 3.27093, 1, 1, 1, 1, 1,
0.583938, 0.03955631, -0.08988971, 1, 1, 1, 1, 1,
0.5883434, -0.005465626, 0.4496494, 1, 1, 1, 1, 1,
0.591369, -1.69981, 3.184446, 1, 1, 1, 1, 1,
0.5914285, -0.4136492, 2.397945, 1, 1, 1, 1, 1,
0.5975527, -0.2639817, 0.8539671, 1, 1, 1, 1, 1,
0.599943, 1.333165, 1.435744, 1, 1, 1, 1, 1,
0.6005943, 0.4321807, 1.839314, 1, 1, 1, 1, 1,
0.6020393, 0.6277635, -1.185419, 1, 1, 1, 1, 1,
0.6060732, 0.7785933, -0.4273134, 1, 1, 1, 1, 1,
0.607298, 1.414005, -0.9309449, 1, 1, 1, 1, 1,
0.6083478, -0.4636225, 2.856298, 0, 0, 1, 1, 1,
0.6129701, -1.612584, 2.731226, 1, 0, 0, 1, 1,
0.6152254, 2.188029, 1.492172, 1, 0, 0, 1, 1,
0.6175793, -0.6129431, 1.587433, 1, 0, 0, 1, 1,
0.6221153, 0.316184, 0.9668339, 1, 0, 0, 1, 1,
0.6225471, 0.0560898, -0.6353829, 1, 0, 0, 1, 1,
0.6256251, 2.934669, -0.04200094, 0, 0, 0, 1, 1,
0.6431172, 0.940861, 0.7172433, 0, 0, 0, 1, 1,
0.6469964, -0.2338881, 1.892328, 0, 0, 0, 1, 1,
0.6495807, -1.910686, 2.054878, 0, 0, 0, 1, 1,
0.6499277, -0.06362393, 2.739974, 0, 0, 0, 1, 1,
0.6580408, -1.3919, 4.102353, 0, 0, 0, 1, 1,
0.6604902, 0.9133206, 1.601568, 0, 0, 0, 1, 1,
0.6660763, -0.9471574, 2.664318, 1, 1, 1, 1, 1,
0.6662835, -0.2355605, 1.802122, 1, 1, 1, 1, 1,
0.6665711, -1.106978, 2.86708, 1, 1, 1, 1, 1,
0.6695132, -0.9225954, 1.668515, 1, 1, 1, 1, 1,
0.671993, -0.6281106, 3.667491, 1, 1, 1, 1, 1,
0.6749906, -0.4519939, 2.984773, 1, 1, 1, 1, 1,
0.680004, 0.003402846, -0.5078654, 1, 1, 1, 1, 1,
0.6807869, 0.900267, 0.511842, 1, 1, 1, 1, 1,
0.6812937, 0.954852, 1.456859, 1, 1, 1, 1, 1,
0.6820828, 0.2393748, 0.8289028, 1, 1, 1, 1, 1,
0.6821613, 1.000397, 1.12735, 1, 1, 1, 1, 1,
0.6822656, 1.570805, -0.1179335, 1, 1, 1, 1, 1,
0.6860788, 0.7289032, 0.9123763, 1, 1, 1, 1, 1,
0.6862832, -1.055458, 3.713407, 1, 1, 1, 1, 1,
0.6989172, 1.256644, 0.1798695, 1, 1, 1, 1, 1,
0.7020528, -0.1283746, 2.255022, 0, 0, 1, 1, 1,
0.7060097, 0.6381907, -0.07479236, 1, 0, 0, 1, 1,
0.7070337, -1.124412, 3.976263, 1, 0, 0, 1, 1,
0.7089733, 1.108468, -1.428468, 1, 0, 0, 1, 1,
0.7141186, -0.3128176, 1.710632, 1, 0, 0, 1, 1,
0.7145292, -0.05860614, 0.02964854, 1, 0, 0, 1, 1,
0.7152631, 1.221425, 0.2060432, 0, 0, 0, 1, 1,
0.7187757, -0.05738648, 0.6752685, 0, 0, 0, 1, 1,
0.7187946, 0.9117146, -0.1611109, 0, 0, 0, 1, 1,
0.7237818, -0.5864019, 2.718386, 0, 0, 0, 1, 1,
0.7245568, -0.2127922, 2.629013, 0, 0, 0, 1, 1,
0.7271146, 0.5822352, 3.605246, 0, 0, 0, 1, 1,
0.7331685, 0.6325443, -0.2783964, 0, 0, 0, 1, 1,
0.7359719, -1.920055, 3.211412, 1, 1, 1, 1, 1,
0.7367484, -0.6801828, 1.756306, 1, 1, 1, 1, 1,
0.7384742, 1.061073, 0.3843668, 1, 1, 1, 1, 1,
0.7398524, -0.1412503, -0.8878668, 1, 1, 1, 1, 1,
0.7399393, -0.5194671, 2.521995, 1, 1, 1, 1, 1,
0.7442023, -0.1585151, 0.9812021, 1, 1, 1, 1, 1,
0.7458674, -0.391967, 0.9255211, 1, 1, 1, 1, 1,
0.7470315, 1.082442, 1.691529, 1, 1, 1, 1, 1,
0.7507855, 0.5475999, -1.561973, 1, 1, 1, 1, 1,
0.7536496, 2.271096, 1.075178, 1, 1, 1, 1, 1,
0.7539003, -2.416764, 1.802957, 1, 1, 1, 1, 1,
0.7563541, 0.03518518, 2.280325, 1, 1, 1, 1, 1,
0.7607459, -0.9357772, 1.751223, 1, 1, 1, 1, 1,
0.7629189, 0.6516508, 1.137268, 1, 1, 1, 1, 1,
0.7688898, 0.4539402, -0.6590587, 1, 1, 1, 1, 1,
0.7703274, -1.337188, 3.568465, 0, 0, 1, 1, 1,
0.7717207, -0.7869055, 3.475893, 1, 0, 0, 1, 1,
0.7727631, -0.267195, 0.7715858, 1, 0, 0, 1, 1,
0.7730651, -0.5630025, 3.370014, 1, 0, 0, 1, 1,
0.781302, -0.02914108, 3.163416, 1, 0, 0, 1, 1,
0.7837304, -0.05071366, 2.182368, 1, 0, 0, 1, 1,
0.7869627, -0.2649749, 1.157176, 0, 0, 0, 1, 1,
0.7924579, 0.5895901, 1.308569, 0, 0, 0, 1, 1,
0.7971553, -0.3322335, 4.184906, 0, 0, 0, 1, 1,
0.8029724, -0.7499393, 3.191998, 0, 0, 0, 1, 1,
0.8046049, -0.2252344, -0.08216094, 0, 0, 0, 1, 1,
0.8085951, -0.7261122, 0.741155, 0, 0, 0, 1, 1,
0.8087939, -1.301545, 2.621944, 0, 0, 0, 1, 1,
0.8129931, 0.9415954, 0.4275676, 1, 1, 1, 1, 1,
0.819391, 0.2967787, 0.4590991, 1, 1, 1, 1, 1,
0.8196378, -1.555738, 1.52407, 1, 1, 1, 1, 1,
0.8205193, -0.1696038, 2.00562, 1, 1, 1, 1, 1,
0.8236473, -0.6073965, 2.469561, 1, 1, 1, 1, 1,
0.8261843, -1.066348, 0.9641192, 1, 1, 1, 1, 1,
0.8262852, 0.002894052, 1.512148, 1, 1, 1, 1, 1,
0.827624, 0.2169897, 0.2237254, 1, 1, 1, 1, 1,
0.8277422, 0.6802825, 1.994519, 1, 1, 1, 1, 1,
0.8289832, 0.7387785, 1.503283, 1, 1, 1, 1, 1,
0.8312273, 0.1953885, 0.8525062, 1, 1, 1, 1, 1,
0.8371763, -0.1030699, 3.467884, 1, 1, 1, 1, 1,
0.8404605, -0.6811052, 1.473635, 1, 1, 1, 1, 1,
0.8469052, -0.5292836, 2.638668, 1, 1, 1, 1, 1,
0.8512723, 1.252007, 0.4079577, 1, 1, 1, 1, 1,
0.8524212, 0.6269914, -1.395273, 0, 0, 1, 1, 1,
0.857739, -1.902791, 3.708669, 1, 0, 0, 1, 1,
0.8578926, 0.3572966, 2.028064, 1, 0, 0, 1, 1,
0.8584533, 0.4199058, 1.418859, 1, 0, 0, 1, 1,
0.8614232, 1.300279, -1.078324, 1, 0, 0, 1, 1,
0.8619657, -1.675189, 2.851486, 1, 0, 0, 1, 1,
0.8620634, -1.421894, 1.662811, 0, 0, 0, 1, 1,
0.8670934, -0.008020529, 2.720486, 0, 0, 0, 1, 1,
0.870579, 0.9380055, 0.1520445, 0, 0, 0, 1, 1,
0.8751311, 0.7996346, 2.271144, 0, 0, 0, 1, 1,
0.8795055, -1.134458, 2.521873, 0, 0, 0, 1, 1,
0.8821237, -0.6620432, 0.4393603, 0, 0, 0, 1, 1,
0.8823102, 1.24803, 0.6081214, 0, 0, 0, 1, 1,
0.8835641, -1.042289, 2.278589, 1, 1, 1, 1, 1,
0.8857139, -0.08987673, 2.556966, 1, 1, 1, 1, 1,
0.887592, 1.007358, 0.5832393, 1, 1, 1, 1, 1,
0.8884422, 0.2170115, -0.5653473, 1, 1, 1, 1, 1,
0.8914064, -0.7296303, 1.554045, 1, 1, 1, 1, 1,
0.8927735, -1.162467, 1.530001, 1, 1, 1, 1, 1,
0.8931943, -0.9924278, 1.193167, 1, 1, 1, 1, 1,
0.8968852, 1.491228, 1.273141, 1, 1, 1, 1, 1,
0.8972831, 0.7134757, 1.631811, 1, 1, 1, 1, 1,
0.9038358, 1.404189, -0.5869064, 1, 1, 1, 1, 1,
0.9086173, 0.8068969, 1.261714, 1, 1, 1, 1, 1,
0.9089388, -0.0572169, 2.859832, 1, 1, 1, 1, 1,
0.909986, 0.5187485, 3.571403, 1, 1, 1, 1, 1,
0.9199865, 1.08268, 0.6676586, 1, 1, 1, 1, 1,
0.920909, -0.7083908, 2.977978, 1, 1, 1, 1, 1,
0.9243851, 0.2766273, -0.4611281, 0, 0, 1, 1, 1,
0.9300685, -1.246381, 2.878485, 1, 0, 0, 1, 1,
0.930301, -1.11608, 4.117499, 1, 0, 0, 1, 1,
0.9341331, -0.1384486, 0.7628276, 1, 0, 0, 1, 1,
0.9351811, -1.07931, 3.048517, 1, 0, 0, 1, 1,
0.941066, -0.2506615, 2.247498, 1, 0, 0, 1, 1,
0.9449455, 0.1302203, 2.927822, 0, 0, 0, 1, 1,
0.9490277, 0.9475386, 1.089816, 0, 0, 0, 1, 1,
0.9494807, -1.001611, 1.444233, 0, 0, 0, 1, 1,
0.9500633, 0.750847, 0.5807413, 0, 0, 0, 1, 1,
0.9519596, 0.6125564, 1.572093, 0, 0, 0, 1, 1,
0.9558935, 1.24341, 2.065917, 0, 0, 0, 1, 1,
0.9562449, 0.2555592, 1.130138, 0, 0, 0, 1, 1,
0.9605907, 0.6123414, 1.989227, 1, 1, 1, 1, 1,
0.9630053, 0.4430955, 0.6995329, 1, 1, 1, 1, 1,
0.9635393, -0.2262945, 2.081865, 1, 1, 1, 1, 1,
0.9650127, 0.3666858, 1.365969, 1, 1, 1, 1, 1,
0.9715201, 0.3279727, 1.952571, 1, 1, 1, 1, 1,
0.9720452, 0.06264228, 1.040359, 1, 1, 1, 1, 1,
0.9740899, 1.72406, 0.9632584, 1, 1, 1, 1, 1,
0.9795074, 1.648481, 1.745411, 1, 1, 1, 1, 1,
0.9856548, 0.05380309, -0.4667984, 1, 1, 1, 1, 1,
0.9925836, -1.043065, 2.64659, 1, 1, 1, 1, 1,
1.00199, -0.6085893, 1.833617, 1, 1, 1, 1, 1,
1.005937, 0.02692686, 2.697598, 1, 1, 1, 1, 1,
1.019044, -0.8807207, 2.154443, 1, 1, 1, 1, 1,
1.025407, -0.6435741, 2.886273, 1, 1, 1, 1, 1,
1.032548, -1.409826, 2.61378, 1, 1, 1, 1, 1,
1.033997, -0.3272612, 2.092863, 0, 0, 1, 1, 1,
1.035767, -1.062725, 1.842182, 1, 0, 0, 1, 1,
1.037877, 2.541685, 0.4993382, 1, 0, 0, 1, 1,
1.049579, 2.157232, 1.84304, 1, 0, 0, 1, 1,
1.050827, 2.220528, 0.8549441, 1, 0, 0, 1, 1,
1.063357, -0.3358361, 3.089459, 1, 0, 0, 1, 1,
1.072873, -0.5650472, 2.804357, 0, 0, 0, 1, 1,
1.072945, -0.117012, 1.318313, 0, 0, 0, 1, 1,
1.073825, 0.05428361, 1.519764, 0, 0, 0, 1, 1,
1.074051, 0.5599229, 1.050501, 0, 0, 0, 1, 1,
1.083983, -0.1956138, 1.297811, 0, 0, 0, 1, 1,
1.090124, 0.5431972, 1.91417, 0, 0, 0, 1, 1,
1.092208, -0.1405139, 0.6183691, 0, 0, 0, 1, 1,
1.102193, -0.1209039, 2.294237, 1, 1, 1, 1, 1,
1.103324, -0.4319044, 1.875977, 1, 1, 1, 1, 1,
1.106515, -1.17794, 0.8892206, 1, 1, 1, 1, 1,
1.11776, 2.434606, 0.9485512, 1, 1, 1, 1, 1,
1.12147, -0.8359925, 2.595446, 1, 1, 1, 1, 1,
1.126633, -0.5843489, 2.632553, 1, 1, 1, 1, 1,
1.13247, 0.4936148, 0.5571783, 1, 1, 1, 1, 1,
1.133056, 0.7723675, 0.3991867, 1, 1, 1, 1, 1,
1.137081, 0.9284415, 0.3388741, 1, 1, 1, 1, 1,
1.141014, -0.8533316, 1.744761, 1, 1, 1, 1, 1,
1.145849, 1.148841, 0.4091838, 1, 1, 1, 1, 1,
1.149831, -0.8400925, 1.447464, 1, 1, 1, 1, 1,
1.15703, 0.1859009, 0.4009683, 1, 1, 1, 1, 1,
1.161406, -0.9636946, 0.9169787, 1, 1, 1, 1, 1,
1.182035, 1.634713, 1.524958, 1, 1, 1, 1, 1,
1.182206, 1.08352, -0.5881327, 0, 0, 1, 1, 1,
1.198391, 0.3808505, 1.724625, 1, 0, 0, 1, 1,
1.201082, 0.3679038, 0.5991858, 1, 0, 0, 1, 1,
1.207665, 0.5773419, 1.258354, 1, 0, 0, 1, 1,
1.209239, 0.6779485, 0.7645685, 1, 0, 0, 1, 1,
1.212525, -1.03809, 3.193564, 1, 0, 0, 1, 1,
1.213253, 0.8558097, 0.5149312, 0, 0, 0, 1, 1,
1.217693, 0.8519166, 0.6494402, 0, 0, 0, 1, 1,
1.244374, 0.2174257, 1.644354, 0, 0, 0, 1, 1,
1.248011, 0.2392966, 1.712887, 0, 0, 0, 1, 1,
1.25389, 0.2405434, 2.152337, 0, 0, 0, 1, 1,
1.254115, 1.947105, -1.793061, 0, 0, 0, 1, 1,
1.264091, -2.44798, 0.5323759, 0, 0, 0, 1, 1,
1.270252, 0.2896011, 1.175343, 1, 1, 1, 1, 1,
1.292803, -1.481053, 1.881424, 1, 1, 1, 1, 1,
1.296985, 0.5411286, 2.269474, 1, 1, 1, 1, 1,
1.30031, -0.01788969, 1.282524, 1, 1, 1, 1, 1,
1.309058, 1.469864, 1.365268, 1, 1, 1, 1, 1,
1.309465, 1.709443, 0.2785925, 1, 1, 1, 1, 1,
1.314865, -0.1341106, 4.368459, 1, 1, 1, 1, 1,
1.321178, -0.04434992, 2.189301, 1, 1, 1, 1, 1,
1.323194, 0.7305263, 3.009096, 1, 1, 1, 1, 1,
1.326545, -1.300448, 1.765501, 1, 1, 1, 1, 1,
1.330155, 0.2069377, 0.9175247, 1, 1, 1, 1, 1,
1.333629, 1.970544, 0.1952073, 1, 1, 1, 1, 1,
1.334103, -0.37251, 1.279508, 1, 1, 1, 1, 1,
1.337521, 0.4481955, 1.22522, 1, 1, 1, 1, 1,
1.36325, -0.002018315, 1.238506, 1, 1, 1, 1, 1,
1.365743, 0.4304683, 3.987991, 0, 0, 1, 1, 1,
1.36731, -0.005152446, 3.142178, 1, 0, 0, 1, 1,
1.371546, 0.1486927, -0.1144886, 1, 0, 0, 1, 1,
1.37503, 0.817677, 1.805135, 1, 0, 0, 1, 1,
1.398325, 0.4849215, 2.56475, 1, 0, 0, 1, 1,
1.400051, 0.3474203, 0.4908105, 1, 0, 0, 1, 1,
1.401948, 0.2213233, 2.583437, 0, 0, 0, 1, 1,
1.408303, 1.257558, 0.3696094, 0, 0, 0, 1, 1,
1.409494, -0.9017614, 1.787382, 0, 0, 0, 1, 1,
1.411465, -1.096395, 2.531859, 0, 0, 0, 1, 1,
1.413632, 0.7299491, 0.143577, 0, 0, 0, 1, 1,
1.414421, 1.701373, 1.198641, 0, 0, 0, 1, 1,
1.415902, 2.138036, 1.780658, 0, 0, 0, 1, 1,
1.41749, 1.25169, 1.79873, 1, 1, 1, 1, 1,
1.417688, -1.04252, 2.235653, 1, 1, 1, 1, 1,
1.417941, 1.630738, 3.650468, 1, 1, 1, 1, 1,
1.419757, 0.7267839, 1.546262, 1, 1, 1, 1, 1,
1.421159, 0.9187036, 0.5281296, 1, 1, 1, 1, 1,
1.422344, -0.6748074, 3.144864, 1, 1, 1, 1, 1,
1.423615, 0.1793079, -0.5311946, 1, 1, 1, 1, 1,
1.441138, 0.5061472, 1.028875, 1, 1, 1, 1, 1,
1.444929, -0.73557, 1.978273, 1, 1, 1, 1, 1,
1.457108, -0.6719364, 1.644789, 1, 1, 1, 1, 1,
1.45759, 0.08553924, 1.770164, 1, 1, 1, 1, 1,
1.460475, -0.2505344, 1.790575, 1, 1, 1, 1, 1,
1.468421, -0.4991626, 1.079423, 1, 1, 1, 1, 1,
1.46981, 0.7686816, 0.7444936, 1, 1, 1, 1, 1,
1.473361, -0.6281393, 0.8736069, 1, 1, 1, 1, 1,
1.473377, 0.06501982, 1.568092, 0, 0, 1, 1, 1,
1.474977, -0.06142367, 2.324085, 1, 0, 0, 1, 1,
1.477118, 1.334198, 3.735542, 1, 0, 0, 1, 1,
1.479231, -0.9483225, 2.945221, 1, 0, 0, 1, 1,
1.491454, 0.1387955, 1.507041, 1, 0, 0, 1, 1,
1.494065, -0.2810243, 3.415112, 1, 0, 0, 1, 1,
1.501584, 0.913613, 0.2170132, 0, 0, 0, 1, 1,
1.510483, 0.1890351, 1.693802, 0, 0, 0, 1, 1,
1.520311, -0.689844, 1.770254, 0, 0, 0, 1, 1,
1.534869, -1.457049, 0.08041596, 0, 0, 0, 1, 1,
1.536535, -0.9476106, 3.245738, 0, 0, 0, 1, 1,
1.540046, -1.22999, 2.196237, 0, 0, 0, 1, 1,
1.540536, -2.536919, 3.878793, 0, 0, 0, 1, 1,
1.540578, -1.045878, 2.364342, 1, 1, 1, 1, 1,
1.553705, 2.086675, 1.07579, 1, 1, 1, 1, 1,
1.583148, 0.2454706, 2.228703, 1, 1, 1, 1, 1,
1.585601, -0.986081, 2.066651, 1, 1, 1, 1, 1,
1.588612, 1.420963, 0.8492582, 1, 1, 1, 1, 1,
1.601364, -1.302808, 1.046646, 1, 1, 1, 1, 1,
1.605064, 0.2783268, 3.352675, 1, 1, 1, 1, 1,
1.630963, -1.117798, 2.795973, 1, 1, 1, 1, 1,
1.634071, 0.8330518, 1.215124, 1, 1, 1, 1, 1,
1.636123, 0.9673423, 1.34329, 1, 1, 1, 1, 1,
1.66037, -1.442754, 2.481202, 1, 1, 1, 1, 1,
1.667485, -0.1469993, 3.593221, 1, 1, 1, 1, 1,
1.696355, -0.001981352, 0.8374578, 1, 1, 1, 1, 1,
1.696523, -0.9776498, 2.229432, 1, 1, 1, 1, 1,
1.712159, 1.123078, 1.925349, 1, 1, 1, 1, 1,
1.718629, 0.1506114, 1.469853, 0, 0, 1, 1, 1,
1.722352, 0.7732011, 1.3829, 1, 0, 0, 1, 1,
1.725242, 0.1876585, 2.414783, 1, 0, 0, 1, 1,
1.726402, 1.155514, 2.021961, 1, 0, 0, 1, 1,
1.742248, 0.1789841, 1.832631, 1, 0, 0, 1, 1,
1.744664, 1.401621, 2.919752, 1, 0, 0, 1, 1,
1.747489, -0.1960475, 1.726846, 0, 0, 0, 1, 1,
1.756927, -0.2887564, 0.7706203, 0, 0, 0, 1, 1,
1.781701, 0.5749992, 3.130083, 0, 0, 0, 1, 1,
1.78655, 0.5112004, 2.713277, 0, 0, 0, 1, 1,
1.816002, -0.04091233, 1.961715, 0, 0, 0, 1, 1,
1.829913, 1.154568, 1.336827, 0, 0, 0, 1, 1,
1.843766, 0.4165542, 2.146943, 0, 0, 0, 1, 1,
1.871739, -0.5201477, 1.123024, 1, 1, 1, 1, 1,
1.875958, -1.910932, 1.942737, 1, 1, 1, 1, 1,
1.901023, 0.158349, 0.7154374, 1, 1, 1, 1, 1,
1.921725, 1.242989, -0.2564352, 1, 1, 1, 1, 1,
1.923526, 2.084445, 1.090909, 1, 1, 1, 1, 1,
1.93308, -0.5791705, 3.085418, 1, 1, 1, 1, 1,
1.959822, -0.3569041, 2.463153, 1, 1, 1, 1, 1,
2.005456, 0.5487143, 2.50118, 1, 1, 1, 1, 1,
2.008576, -1.996889, 0.8506654, 1, 1, 1, 1, 1,
2.009401, 1.364413, -0.5333724, 1, 1, 1, 1, 1,
2.009444, -0.7921485, 2.014171, 1, 1, 1, 1, 1,
2.029197, 0.4168052, -0.1835122, 1, 1, 1, 1, 1,
2.035492, 1.075742, -0.3097583, 1, 1, 1, 1, 1,
2.05731, -0.3798002, 2.918487, 1, 1, 1, 1, 1,
2.06188, -0.3591816, 2.199426, 1, 1, 1, 1, 1,
2.064036, 0.2463961, 2.401916, 0, 0, 1, 1, 1,
2.070097, -0.06916204, -0.3621393, 1, 0, 0, 1, 1,
2.08177, 1.798079, 0.9435943, 1, 0, 0, 1, 1,
2.154053, -0.06158797, 0.6247795, 1, 0, 0, 1, 1,
2.17518, -0.1549882, 0.7952131, 1, 0, 0, 1, 1,
2.17936, -1.296759, 3.09798, 1, 0, 0, 1, 1,
2.222168, 0.5948851, 1.909221, 0, 0, 0, 1, 1,
2.250855, -1.252077, 2.10198, 0, 0, 0, 1, 1,
2.311847, -0.864223, 1.891224, 0, 0, 0, 1, 1,
2.314177, 1.453452, 0.1270075, 0, 0, 0, 1, 1,
2.400504, -2.209926, 3.471848, 0, 0, 0, 1, 1,
2.515858, -0.3109237, 2.698137, 0, 0, 0, 1, 1,
2.724682, -1.411923, 1.693455, 0, 0, 0, 1, 1,
2.825862, 1.616479, 1.3963, 1, 1, 1, 1, 1,
2.86628, 0.4535774, 1.541755, 1, 1, 1, 1, 1,
2.970073, -1.208658, 3.523375, 1, 1, 1, 1, 1,
3.002974, 0.7412155, 2.121998, 1, 1, 1, 1, 1,
3.18842, -2.822016, -0.1686353, 1, 1, 1, 1, 1,
3.232612, 0.8846996, 1.345648, 1, 1, 1, 1, 1,
3.237189, 1.422492, 1.494421, 1, 1, 1, 1, 1
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
var radius = 9.783669;
var distance = 34.36472;
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
mvMatrix.translate( 0.2031107, -0.04876995, 0.2885189 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.36472);
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