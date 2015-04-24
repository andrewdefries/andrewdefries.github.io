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
-2.76149, -2.09479, -0.4266668, 1, 0, 0, 1,
-2.71269, 1.144468, -0.1983504, 1, 0.007843138, 0, 1,
-2.683626, 0.5722008, -2.369439, 1, 0.01176471, 0, 1,
-2.640665, -2.146886, -0.9660751, 1, 0.01960784, 0, 1,
-2.502838, -1.067149, -0.6643305, 1, 0.02352941, 0, 1,
-2.443976, -1.765199, -0.2025791, 1, 0.03137255, 0, 1,
-2.377666, 0.03923495, -1.202399, 1, 0.03529412, 0, 1,
-2.27474, -1.806405, -2.436016, 1, 0.04313726, 0, 1,
-2.264764, -0.6106415, -2.649506, 1, 0.04705882, 0, 1,
-2.256602, 1.860582, 0.8802627, 1, 0.05490196, 0, 1,
-2.1428, -0.2410219, -2.36572, 1, 0.05882353, 0, 1,
-2.140443, 0.830255, 0.5589298, 1, 0.06666667, 0, 1,
-2.114174, -1.250195, -1.33202, 1, 0.07058824, 0, 1,
-2.107281, -1.411981, -2.500623, 1, 0.07843138, 0, 1,
-2.104377, 0.1544787, -1.235939, 1, 0.08235294, 0, 1,
-2.070474, 0.8652276, -0.7828454, 1, 0.09019608, 0, 1,
-2.007488, 2.9357, -2.322616, 1, 0.09411765, 0, 1,
-1.999063, 0.5100097, -1.048335, 1, 0.1019608, 0, 1,
-1.997545, 2.335442, -0.37059, 1, 0.1098039, 0, 1,
-1.978122, -0.05158711, -1.789774, 1, 0.1137255, 0, 1,
-1.928702, 2.260064, -0.2288289, 1, 0.1215686, 0, 1,
-1.92689, 2.031696, -0.03928383, 1, 0.1254902, 0, 1,
-1.914979, 0.9296567, -4.129875, 1, 0.1333333, 0, 1,
-1.90842, 1.311312, -1.841873, 1, 0.1372549, 0, 1,
-1.83821, -0.7156222, -0.3308408, 1, 0.145098, 0, 1,
-1.837177, -1.160461, -2.942921, 1, 0.1490196, 0, 1,
-1.830956, -0.2042368, -0.5539777, 1, 0.1568628, 0, 1,
-1.823832, 0.0389762, -0.296571, 1, 0.1607843, 0, 1,
-1.794816, 0.5388146, -0.6012598, 1, 0.1686275, 0, 1,
-1.789729, -0.1619166, -1.450592, 1, 0.172549, 0, 1,
-1.788218, 1.03837, 0.3788819, 1, 0.1803922, 0, 1,
-1.788109, -0.02695552, -2.440919, 1, 0.1843137, 0, 1,
-1.781194, -0.6551175, -0.48733, 1, 0.1921569, 0, 1,
-1.77466, -0.631046, -0.5316209, 1, 0.1960784, 0, 1,
-1.769783, 0.3244113, -2.421558, 1, 0.2039216, 0, 1,
-1.734367, -0.0280368, -2.139692, 1, 0.2117647, 0, 1,
-1.714567, 0.1541499, -1.259778, 1, 0.2156863, 0, 1,
-1.711846, 0.2691837, -1.409981, 1, 0.2235294, 0, 1,
-1.711632, -0.02881299, -1.61454, 1, 0.227451, 0, 1,
-1.698541, -0.7445866, -2.731911, 1, 0.2352941, 0, 1,
-1.691916, -0.6636651, 0.01555878, 1, 0.2392157, 0, 1,
-1.688236, -1.00165, -1.697612, 1, 0.2470588, 0, 1,
-1.687579, -0.7244377, -3.331629, 1, 0.2509804, 0, 1,
-1.686464, -3.184805, -2.401703, 1, 0.2588235, 0, 1,
-1.684399, -1.509961, -2.573621, 1, 0.2627451, 0, 1,
-1.683516, 1.236345, -1.829357, 1, 0.2705882, 0, 1,
-1.683357, -0.05021837, -1.925861, 1, 0.2745098, 0, 1,
-1.677488, 0.60317, -0.04390734, 1, 0.282353, 0, 1,
-1.665106, -0.8018935, -2.447273, 1, 0.2862745, 0, 1,
-1.655295, -1.277579, -0.9142054, 1, 0.2941177, 0, 1,
-1.651553, 1.088864, -1.964513, 1, 0.3019608, 0, 1,
-1.631821, 0.8657148, -1.166537, 1, 0.3058824, 0, 1,
-1.623453, -0.08416617, -2.2638, 1, 0.3137255, 0, 1,
-1.609358, -1.058785, -2.345329, 1, 0.3176471, 0, 1,
-1.605929, -0.7573101, -2.509205, 1, 0.3254902, 0, 1,
-1.603678, -0.2318598, -1.829508, 1, 0.3294118, 0, 1,
-1.591887, 0.8472897, -3.128171, 1, 0.3372549, 0, 1,
-1.571458, 2.245991, 0.2858481, 1, 0.3411765, 0, 1,
-1.563635, 0.03630858, -1.610787, 1, 0.3490196, 0, 1,
-1.561671, 1.206745, -0.4995894, 1, 0.3529412, 0, 1,
-1.550165, 0.4627564, -0.06766267, 1, 0.3607843, 0, 1,
-1.544398, 0.8208488, 1.470157, 1, 0.3647059, 0, 1,
-1.538261, 1.285273, -0.04519128, 1, 0.372549, 0, 1,
-1.536084, 0.4442304, -0.9518232, 1, 0.3764706, 0, 1,
-1.526577, -1.668627, -3.024835, 1, 0.3843137, 0, 1,
-1.513934, -0.6331854, -1.644382, 1, 0.3882353, 0, 1,
-1.511792, 0.6237226, -1.473642, 1, 0.3960784, 0, 1,
-1.505276, 0.1130565, -1.58176, 1, 0.4039216, 0, 1,
-1.504908, -2.046514, -3.501461, 1, 0.4078431, 0, 1,
-1.501518, -1.801289, -2.9187, 1, 0.4156863, 0, 1,
-1.491775, -0.213021, -1.511098, 1, 0.4196078, 0, 1,
-1.490816, -0.976989, -2.670169, 1, 0.427451, 0, 1,
-1.486976, 0.4980096, -1.134994, 1, 0.4313726, 0, 1,
-1.461637, 1.142924, -0.8814884, 1, 0.4392157, 0, 1,
-1.458706, 0.6767986, -0.91425, 1, 0.4431373, 0, 1,
-1.449416, -1.084974, -2.707352, 1, 0.4509804, 0, 1,
-1.44741, -0.621989, -3.979356, 1, 0.454902, 0, 1,
-1.428536, 1.02385, -1.408218, 1, 0.4627451, 0, 1,
-1.425686, 0.7662908, -1.971682, 1, 0.4666667, 0, 1,
-1.421975, -0.3255174, -0.8945253, 1, 0.4745098, 0, 1,
-1.415309, -1.452902, -3.997013, 1, 0.4784314, 0, 1,
-1.415138, -1.554088, -2.12191, 1, 0.4862745, 0, 1,
-1.398842, 1.172562, -2.166152, 1, 0.4901961, 0, 1,
-1.397491, 0.8795942, -1.308669, 1, 0.4980392, 0, 1,
-1.353084, 0.3303922, -2.096175, 1, 0.5058824, 0, 1,
-1.351447, 0.7892556, -0.9123862, 1, 0.509804, 0, 1,
-1.345672, 1.125311, -0.9469504, 1, 0.5176471, 0, 1,
-1.331015, 0.5357455, -1.483924, 1, 0.5215687, 0, 1,
-1.322316, 2.106447, -0.9007275, 1, 0.5294118, 0, 1,
-1.31722, -0.9267541, -1.563681, 1, 0.5333334, 0, 1,
-1.299277, 2.422297, -1.588184, 1, 0.5411765, 0, 1,
-1.29313, 0.1393521, -0.2469335, 1, 0.5450981, 0, 1,
-1.284149, 0.6296129, -2.462932, 1, 0.5529412, 0, 1,
-1.282962, 0.4177907, -1.493322, 1, 0.5568628, 0, 1,
-1.282485, -0.7272704, -1.496034, 1, 0.5647059, 0, 1,
-1.281927, -0.5029515, -2.648787, 1, 0.5686275, 0, 1,
-1.277918, -0.07463009, -1.514623, 1, 0.5764706, 0, 1,
-1.270504, -0.221747, -2.446636, 1, 0.5803922, 0, 1,
-1.263959, -2.265815, -2.52044, 1, 0.5882353, 0, 1,
-1.26302, 0.413257, 0.2038565, 1, 0.5921569, 0, 1,
-1.261728, 0.9450383, -0.1517751, 1, 0.6, 0, 1,
-1.261021, -1.049988, -3.252613, 1, 0.6078432, 0, 1,
-1.257214, -1.595781, -1.157553, 1, 0.6117647, 0, 1,
-1.251167, 1.071331, -1.821295, 1, 0.6196079, 0, 1,
-1.249437, 0.4027383, -0.8037923, 1, 0.6235294, 0, 1,
-1.247847, -0.08018372, -0.8801296, 1, 0.6313726, 0, 1,
-1.245597, 1.408562, -1.076478, 1, 0.6352941, 0, 1,
-1.244793, -0.3797562, -2.963978, 1, 0.6431373, 0, 1,
-1.242901, 0.3786457, -1.675186, 1, 0.6470588, 0, 1,
-1.240904, 1.462544, -1.292572, 1, 0.654902, 0, 1,
-1.234606, 0.4700954, -0.7884832, 1, 0.6588235, 0, 1,
-1.231171, -0.2149134, -0.4059708, 1, 0.6666667, 0, 1,
-1.224846, 0.1492231, -1.969431, 1, 0.6705883, 0, 1,
-1.211673, -0.759444, -1.22818, 1, 0.6784314, 0, 1,
-1.20921, 1.228687, 1.111153, 1, 0.682353, 0, 1,
-1.206792, 0.04639728, -0.8623278, 1, 0.6901961, 0, 1,
-1.186198, -0.3971091, -1.615622, 1, 0.6941177, 0, 1,
-1.179133, -0.4791725, -3.00116, 1, 0.7019608, 0, 1,
-1.177533, 0.3153307, -1.819276, 1, 0.7098039, 0, 1,
-1.174543, -1.094168, -2.477943, 1, 0.7137255, 0, 1,
-1.173715, 0.4924491, -1.901418, 1, 0.7215686, 0, 1,
-1.169602, 0.5654069, -0.5660443, 1, 0.7254902, 0, 1,
-1.168294, 0.2590652, -1.100062, 1, 0.7333333, 0, 1,
-1.155263, -0.2049161, -1.226145, 1, 0.7372549, 0, 1,
-1.147959, -0.4932634, -1.035816, 1, 0.7450981, 0, 1,
-1.146086, 0.3669865, -2.326299, 1, 0.7490196, 0, 1,
-1.145245, 0.3136479, -1.267073, 1, 0.7568628, 0, 1,
-1.140353, 1.236527, -1.356778, 1, 0.7607843, 0, 1,
-1.137871, -0.5386009, -1.064428, 1, 0.7686275, 0, 1,
-1.131966, 0.5346023, -1.861929, 1, 0.772549, 0, 1,
-1.130263, 1.829387, -0.6935937, 1, 0.7803922, 0, 1,
-1.129308, 0.002343368, -1.628881, 1, 0.7843137, 0, 1,
-1.126818, -0.07246906, -3.763534, 1, 0.7921569, 0, 1,
-1.12355, -0.2849701, -1.621408, 1, 0.7960784, 0, 1,
-1.110496, 0.5175893, 0.7077971, 1, 0.8039216, 0, 1,
-1.10938, 2.225083, -0.419362, 1, 0.8117647, 0, 1,
-1.101982, -0.6624045, -3.472881, 1, 0.8156863, 0, 1,
-1.093284, 1.112988, -1.350576, 1, 0.8235294, 0, 1,
-1.088499, 0.4509535, -1.737192, 1, 0.827451, 0, 1,
-1.086256, -1.667585, -2.663181, 1, 0.8352941, 0, 1,
-1.053708, 2.377503, -0.3151213, 1, 0.8392157, 0, 1,
-1.052783, 0.8602689, 0.0106278, 1, 0.8470588, 0, 1,
-1.037313, -0.7504221, -2.516748, 1, 0.8509804, 0, 1,
-1.03361, -0.4469695, -2.329316, 1, 0.8588235, 0, 1,
-1.030354, -0.6915835, -2.772545, 1, 0.8627451, 0, 1,
-1.029861, 1.781731, 0.7303408, 1, 0.8705882, 0, 1,
-1.027333, 1.45795, 0.190661, 1, 0.8745098, 0, 1,
-1.020158, 0.610931, 0.5244021, 1, 0.8823529, 0, 1,
-1.019971, -1.790997, -4.91226, 1, 0.8862745, 0, 1,
-1.012871, -0.4447588, -2.278814, 1, 0.8941177, 0, 1,
-1.008898, 0.8328511, -0.02610814, 1, 0.8980392, 0, 1,
-1.00786, 1.129719, -0.07570443, 1, 0.9058824, 0, 1,
-1.007205, 0.5682568, -1.560772, 1, 0.9137255, 0, 1,
-1.006354, 1.174696, 0.4863028, 1, 0.9176471, 0, 1,
-1.003506, -1.332685, -1.34295, 1, 0.9254902, 0, 1,
-1.002773, 0.3031935, -2.131342, 1, 0.9294118, 0, 1,
-1.002308, 2.668673, -1.377582, 1, 0.9372549, 0, 1,
-0.9917141, -1.145794, -3.412442, 1, 0.9411765, 0, 1,
-0.990199, 0.4284297, 0.3530644, 1, 0.9490196, 0, 1,
-0.9884925, -2.160033, -3.256299, 1, 0.9529412, 0, 1,
-0.9878967, 1.122902, 1.57129, 1, 0.9607843, 0, 1,
-0.9817369, -0.09647955, -3.073889, 1, 0.9647059, 0, 1,
-0.9719223, 0.5339112, -2.467076, 1, 0.972549, 0, 1,
-0.9699384, -0.1962669, -2.111233, 1, 0.9764706, 0, 1,
-0.9661975, -0.1952447, -3.008425, 1, 0.9843137, 0, 1,
-0.9540848, -0.1071053, -2.43127, 1, 0.9882353, 0, 1,
-0.9530365, -0.1268639, -1.154548, 1, 0.9960784, 0, 1,
-0.9496928, 2.026812, -0.4947321, 0.9960784, 1, 0, 1,
-0.9496033, -1.381424, -1.923536, 0.9921569, 1, 0, 1,
-0.9483212, 0.520391, -1.71152, 0.9843137, 1, 0, 1,
-0.9478051, 0.6702054, -0.8814191, 0.9803922, 1, 0, 1,
-0.9475606, 0.1309829, -3.311492, 0.972549, 1, 0, 1,
-0.9442825, 1.36877, -0.703446, 0.9686275, 1, 0, 1,
-0.9434615, -0.01545833, -2.605919, 0.9607843, 1, 0, 1,
-0.9398842, 1.290128, 0.7549474, 0.9568627, 1, 0, 1,
-0.9355026, 1.323932, 0.6871815, 0.9490196, 1, 0, 1,
-0.9320428, -0.04686934, -2.284718, 0.945098, 1, 0, 1,
-0.9240677, -1.208676, -1.759933, 0.9372549, 1, 0, 1,
-0.9140242, -0.8534119, -2.032908, 0.9333333, 1, 0, 1,
-0.9134325, -0.4133756, -3.44565, 0.9254902, 1, 0, 1,
-0.9095087, 0.5015116, -0.5222245, 0.9215686, 1, 0, 1,
-0.9038849, 0.9392392, 1.254983, 0.9137255, 1, 0, 1,
-0.9035761, -0.3533268, -2.401844, 0.9098039, 1, 0, 1,
-0.8970764, 1.905462, -1.762712, 0.9019608, 1, 0, 1,
-0.8923846, -0.1446373, -0.531601, 0.8941177, 1, 0, 1,
-0.8888524, -1.477587, -3.122569, 0.8901961, 1, 0, 1,
-0.8819849, 0.9814636, -0.8131164, 0.8823529, 1, 0, 1,
-0.8796409, 1.002174, -1.473402, 0.8784314, 1, 0, 1,
-0.8647068, 2.183528, -1.193924, 0.8705882, 1, 0, 1,
-0.8637853, -1.097546, -1.820085, 0.8666667, 1, 0, 1,
-0.8582108, 0.3986326, -1.872394, 0.8588235, 1, 0, 1,
-0.8558993, 0.6132568, 0.1376959, 0.854902, 1, 0, 1,
-0.8534155, 0.3999927, -0.1663928, 0.8470588, 1, 0, 1,
-0.8525858, 0.3603418, -2.560129, 0.8431373, 1, 0, 1,
-0.8487451, 0.4192163, -1.728731, 0.8352941, 1, 0, 1,
-0.8476675, 0.8768274, -0.7252531, 0.8313726, 1, 0, 1,
-0.8467419, -0.5406485, -0.2765938, 0.8235294, 1, 0, 1,
-0.8458405, -1.799308, -2.672415, 0.8196079, 1, 0, 1,
-0.844362, -0.3124254, -1.260043, 0.8117647, 1, 0, 1,
-0.8439131, 2.319873, -1.311765, 0.8078431, 1, 0, 1,
-0.8420867, -0.3085766, -1.824697, 0.8, 1, 0, 1,
-0.8411192, -0.4666993, -2.662927, 0.7921569, 1, 0, 1,
-0.839514, -0.08864328, -1.557749, 0.7882353, 1, 0, 1,
-0.8374093, 1.526904, -0.5907586, 0.7803922, 1, 0, 1,
-0.8337066, -0.3156247, -1.665142, 0.7764706, 1, 0, 1,
-0.8304642, 1.358213, -0.7740934, 0.7686275, 1, 0, 1,
-0.8299381, -1.969929, -3.86513, 0.7647059, 1, 0, 1,
-0.819068, -0.3537785, -1.127781, 0.7568628, 1, 0, 1,
-0.818006, -0.215755, -1.633701, 0.7529412, 1, 0, 1,
-0.816599, 1.996331, -0.6745009, 0.7450981, 1, 0, 1,
-0.8129547, 0.5343225, -1.322837, 0.7411765, 1, 0, 1,
-0.809311, 0.8768222, -1.093125, 0.7333333, 1, 0, 1,
-0.8085674, -1.419729, -3.319443, 0.7294118, 1, 0, 1,
-0.798699, 0.6020136, 0.4811608, 0.7215686, 1, 0, 1,
-0.7924331, -0.0159726, -2.706068, 0.7176471, 1, 0, 1,
-0.7886233, 0.4364417, -0.3321024, 0.7098039, 1, 0, 1,
-0.7838335, -0.8692796, -3.046031, 0.7058824, 1, 0, 1,
-0.783544, -0.1044597, -0.2005489, 0.6980392, 1, 0, 1,
-0.7825339, 0.06066921, -1.323733, 0.6901961, 1, 0, 1,
-0.7806612, 1.261338, -0.6263718, 0.6862745, 1, 0, 1,
-0.7805879, 2.222058, -0.9862182, 0.6784314, 1, 0, 1,
-0.7792946, 0.2886496, -1.3038, 0.6745098, 1, 0, 1,
-0.7768767, -0.4097122, -2.871908, 0.6666667, 1, 0, 1,
-0.7669532, 0.798116, -0.2735182, 0.6627451, 1, 0, 1,
-0.7652383, -0.7184775, -1.421471, 0.654902, 1, 0, 1,
-0.7636802, 1.000979, -0.7237155, 0.6509804, 1, 0, 1,
-0.7556419, -0.1512649, -2.509334, 0.6431373, 1, 0, 1,
-0.7523251, -0.5498018, -2.239519, 0.6392157, 1, 0, 1,
-0.7463911, 1.105399, -0.6518842, 0.6313726, 1, 0, 1,
-0.7408031, -0.4328907, -2.825027, 0.627451, 1, 0, 1,
-0.7402725, -1.273924, -1.18763, 0.6196079, 1, 0, 1,
-0.7396087, -0.3641475, -2.165597, 0.6156863, 1, 0, 1,
-0.7367521, 0.005283512, -1.255533, 0.6078432, 1, 0, 1,
-0.7296322, -0.3665548, -2.675086, 0.6039216, 1, 0, 1,
-0.7295295, -0.5311352, -2.620073, 0.5960785, 1, 0, 1,
-0.7256234, -0.9872504, -1.282449, 0.5882353, 1, 0, 1,
-0.7215583, -1.530117, -4.048703, 0.5843138, 1, 0, 1,
-0.7201746, 0.8639859, -1.251127, 0.5764706, 1, 0, 1,
-0.7195893, 0.2962548, -1.146809, 0.572549, 1, 0, 1,
-0.7174525, 0.8910663, -0.1400543, 0.5647059, 1, 0, 1,
-0.7161849, -0.7031916, -1.910821, 0.5607843, 1, 0, 1,
-0.7124106, -0.9190608, -1.646083, 0.5529412, 1, 0, 1,
-0.7095842, -1.645145, -3.6044, 0.5490196, 1, 0, 1,
-0.6967235, -0.993803, -0.8272346, 0.5411765, 1, 0, 1,
-0.6959907, 0.735502, -1.026716, 0.5372549, 1, 0, 1,
-0.6928091, -0.2077851, -1.944121, 0.5294118, 1, 0, 1,
-0.683985, -1.421621, -2.314196, 0.5254902, 1, 0, 1,
-0.6802461, 1.353311, -1.45533, 0.5176471, 1, 0, 1,
-0.6756889, -1.262075, -2.7945, 0.5137255, 1, 0, 1,
-0.6739994, 0.1497751, -1.059062, 0.5058824, 1, 0, 1,
-0.6698096, -1.369843, -3.410221, 0.5019608, 1, 0, 1,
-0.6651334, 1.458242, -1.268624, 0.4941176, 1, 0, 1,
-0.6599505, 1.01083, -0.1416715, 0.4862745, 1, 0, 1,
-0.6573132, 0.2043473, 0.4059178, 0.4823529, 1, 0, 1,
-0.6565746, 0.4722573, -1.876343, 0.4745098, 1, 0, 1,
-0.6542615, 0.02283779, -0.3752022, 0.4705882, 1, 0, 1,
-0.6464291, -0.6192501, -2.373938, 0.4627451, 1, 0, 1,
-0.6455562, 0.4640884, -2.633042, 0.4588235, 1, 0, 1,
-0.6399539, 0.7615114, -0.2408913, 0.4509804, 1, 0, 1,
-0.6299886, -0.8456147, -4.192515, 0.4470588, 1, 0, 1,
-0.6272839, 0.1521751, 0.8461607, 0.4392157, 1, 0, 1,
-0.6257443, 1.375368, -1.991996, 0.4352941, 1, 0, 1,
-0.6178393, -0.05165076, -3.197098, 0.427451, 1, 0, 1,
-0.615224, -1.084749, -2.158967, 0.4235294, 1, 0, 1,
-0.613221, -0.3944211, -1.340773, 0.4156863, 1, 0, 1,
-0.6114627, -0.2973259, -1.651948, 0.4117647, 1, 0, 1,
-0.6114543, 0.337828, -0.4670061, 0.4039216, 1, 0, 1,
-0.5993111, 0.3823621, -1.448239, 0.3960784, 1, 0, 1,
-0.5919871, 0.3653014, -0.5052078, 0.3921569, 1, 0, 1,
-0.5809425, -0.5616523, -2.387509, 0.3843137, 1, 0, 1,
-0.5805711, -2.263973, -2.946117, 0.3803922, 1, 0, 1,
-0.579616, -0.09746375, -4.066292, 0.372549, 1, 0, 1,
-0.5781143, -0.0854924, -0.6646628, 0.3686275, 1, 0, 1,
-0.57732, -1.895806, -3.358269, 0.3607843, 1, 0, 1,
-0.5744305, -0.9453152, -3.008384, 0.3568628, 1, 0, 1,
-0.5737764, -0.001197352, -1.987702, 0.3490196, 1, 0, 1,
-0.5673403, 0.0582274, -1.681309, 0.345098, 1, 0, 1,
-0.5646844, 1.23424, -1.593753, 0.3372549, 1, 0, 1,
-0.5631515, -0.1914648, -3.387848, 0.3333333, 1, 0, 1,
-0.5627101, -0.2635576, -0.3587753, 0.3254902, 1, 0, 1,
-0.5606412, 0.1814145, -0.994915, 0.3215686, 1, 0, 1,
-0.5559546, 0.07188758, 0.980186, 0.3137255, 1, 0, 1,
-0.555603, 0.003227005, 0.08568968, 0.3098039, 1, 0, 1,
-0.555429, -3.017694, -3.276793, 0.3019608, 1, 0, 1,
-0.5539941, -1.915246, -0.2219636, 0.2941177, 1, 0, 1,
-0.5539389, -0.3135304, -0.308021, 0.2901961, 1, 0, 1,
-0.553903, 2.46286, 0.7759754, 0.282353, 1, 0, 1,
-0.5538836, 1.609901, -1.699375, 0.2784314, 1, 0, 1,
-0.5502432, -1.686836, -1.299039, 0.2705882, 1, 0, 1,
-0.5484074, 0.01900585, -1.284982, 0.2666667, 1, 0, 1,
-0.5414394, -0.9437116, -2.451607, 0.2588235, 1, 0, 1,
-0.5374721, 0.5310251, -0.3927291, 0.254902, 1, 0, 1,
-0.5263107, -1.414287, -3.148367, 0.2470588, 1, 0, 1,
-0.5261608, -0.8356735, -1.512658, 0.2431373, 1, 0, 1,
-0.5229996, 0.2822637, -3.382212, 0.2352941, 1, 0, 1,
-0.5137051, 0.2767801, -3.739554, 0.2313726, 1, 0, 1,
-0.5117056, -0.1767018, -1.73293, 0.2235294, 1, 0, 1,
-0.510758, 0.3418438, -1.32128, 0.2196078, 1, 0, 1,
-0.5073928, 1.640328, 1.189584, 0.2117647, 1, 0, 1,
-0.5057229, -0.6606814, -3.252505, 0.2078431, 1, 0, 1,
-0.5049747, 2.19606, -1.011427, 0.2, 1, 0, 1,
-0.5034612, 0.5573637, 0.7241977, 0.1921569, 1, 0, 1,
-0.5001517, 0.739127, -2.075371, 0.1882353, 1, 0, 1,
-0.5001031, -0.5704625, -1.762837, 0.1803922, 1, 0, 1,
-0.4977616, -1.219939, -3.432726, 0.1764706, 1, 0, 1,
-0.496743, -2.407969, -3.963786, 0.1686275, 1, 0, 1,
-0.4954242, -0.8469878, -0.3092536, 0.1647059, 1, 0, 1,
-0.4923218, 1.675403, -0.4403581, 0.1568628, 1, 0, 1,
-0.4922603, -0.360713, -2.341285, 0.1529412, 1, 0, 1,
-0.488065, 2.345679, -1.05254, 0.145098, 1, 0, 1,
-0.4825907, -1.030966, -2.193048, 0.1411765, 1, 0, 1,
-0.4684916, 0.3670547, 0.6669477, 0.1333333, 1, 0, 1,
-0.4676975, 0.6269622, -1.120087, 0.1294118, 1, 0, 1,
-0.4672615, -0.7946383, -1.601885, 0.1215686, 1, 0, 1,
-0.4665357, -1.065216, -1.650977, 0.1176471, 1, 0, 1,
-0.4642435, 0.1697101, -3.451593, 0.1098039, 1, 0, 1,
-0.4557668, -0.8219471, -3.15759, 0.1058824, 1, 0, 1,
-0.4451023, -1.62847, -1.419183, 0.09803922, 1, 0, 1,
-0.4448417, 0.4813185, -1.226401, 0.09019608, 1, 0, 1,
-0.4431121, 0.7756085, -1.130196, 0.08627451, 1, 0, 1,
-0.4416834, 0.62371, -0.4309627, 0.07843138, 1, 0, 1,
-0.4405333, -0.7524443, -2.640174, 0.07450981, 1, 0, 1,
-0.4397174, 0.3598602, -2.466303, 0.06666667, 1, 0, 1,
-0.4370686, 0.6871658, -0.9936653, 0.0627451, 1, 0, 1,
-0.4350315, 1.364421, 0.3417219, 0.05490196, 1, 0, 1,
-0.4340937, -1.06823, -2.425921, 0.05098039, 1, 0, 1,
-0.4328219, -0.1563942, -2.541796, 0.04313726, 1, 0, 1,
-0.4323487, 0.2488849, 1.066265, 0.03921569, 1, 0, 1,
-0.4305609, -1.926215, -2.325002, 0.03137255, 1, 0, 1,
-0.4264529, -0.1933222, -1.780753, 0.02745098, 1, 0, 1,
-0.4214532, 1.47382, -1.134932, 0.01960784, 1, 0, 1,
-0.4213041, 1.300584, -1.489217, 0.01568628, 1, 0, 1,
-0.4201396, 0.3909313, -0.2682862, 0.007843138, 1, 0, 1,
-0.4117599, 1.986273, -0.2265869, 0.003921569, 1, 0, 1,
-0.4109253, 0.9654521, -2.286269, 0, 1, 0.003921569, 1,
-0.407097, 1.555391, -0.07098941, 0, 1, 0.01176471, 1,
-0.4049662, 1.092128, -1.228207, 0, 1, 0.01568628, 1,
-0.4043873, -0.3728158, -2.935112, 0, 1, 0.02352941, 1,
-0.4039016, 0.6582346, -0.2466243, 0, 1, 0.02745098, 1,
-0.4015435, -1.667279, -0.478759, 0, 1, 0.03529412, 1,
-0.3995386, 2.270618, -0.3536622, 0, 1, 0.03921569, 1,
-0.3894007, -0.3511043, -4.147185, 0, 1, 0.04705882, 1,
-0.3853834, -0.4544654, -1.537542, 0, 1, 0.05098039, 1,
-0.3763797, 0.4019858, 0.1818137, 0, 1, 0.05882353, 1,
-0.3687389, -1.029135, -5.117095, 0, 1, 0.0627451, 1,
-0.3677855, -0.5362353, -2.655333, 0, 1, 0.07058824, 1,
-0.3676249, 0.009644949, -1.106446, 0, 1, 0.07450981, 1,
-0.3643847, 1.817281, -0.036326, 0, 1, 0.08235294, 1,
-0.3611564, 0.683117, -1.280099, 0, 1, 0.08627451, 1,
-0.3588411, 1.38816, -1.327758, 0, 1, 0.09411765, 1,
-0.355155, 1.805638, -0.9749998, 0, 1, 0.1019608, 1,
-0.3546361, -0.2779769, -0.8035751, 0, 1, 0.1058824, 1,
-0.3533157, -0.2677246, -0.8506591, 0, 1, 0.1137255, 1,
-0.3490382, -0.5214422, -2.703676, 0, 1, 0.1176471, 1,
-0.3473246, 0.7657892, -1.314532, 0, 1, 0.1254902, 1,
-0.3468636, 0.5554982, 0.07315945, 0, 1, 0.1294118, 1,
-0.3449124, -1.047817, -3.39468, 0, 1, 0.1372549, 1,
-0.3410857, -0.06694155, -2.193147, 0, 1, 0.1411765, 1,
-0.3396043, -0.5110277, -1.017054, 0, 1, 0.1490196, 1,
-0.3335706, 0.8978873, -1.721049, 0, 1, 0.1529412, 1,
-0.3264256, -1.198889, -3.423757, 0, 1, 0.1607843, 1,
-0.3261193, -1.693429, -4.349304, 0, 1, 0.1647059, 1,
-0.3207353, 0.476884, -1.11903, 0, 1, 0.172549, 1,
-0.307654, -1.447803, -3.424506, 0, 1, 0.1764706, 1,
-0.3056578, -0.2946445, -3.165638, 0, 1, 0.1843137, 1,
-0.3035752, -0.9320607, -2.596126, 0, 1, 0.1882353, 1,
-0.3028632, -1.717996, -1.787933, 0, 1, 0.1960784, 1,
-0.3024194, -0.09225697, -0.510699, 0, 1, 0.2039216, 1,
-0.3000843, -0.7198432, -2.092837, 0, 1, 0.2078431, 1,
-0.2987552, 1.594427, -0.7458155, 0, 1, 0.2156863, 1,
-0.2982001, -0.6118501, -2.458731, 0, 1, 0.2196078, 1,
-0.2980171, 0.9426447, 0.09932046, 0, 1, 0.227451, 1,
-0.297721, 1.972843, 0.6516164, 0, 1, 0.2313726, 1,
-0.2937936, -1.432513, -2.927707, 0, 1, 0.2392157, 1,
-0.2930011, 0.3115019, 0.6925834, 0, 1, 0.2431373, 1,
-0.288402, 0.1182193, -1.168525, 0, 1, 0.2509804, 1,
-0.2842374, 0.01595859, -2.477554, 0, 1, 0.254902, 1,
-0.28196, -0.8273271, -4.101486, 0, 1, 0.2627451, 1,
-0.2743428, 0.4354927, -1.674084, 0, 1, 0.2666667, 1,
-0.2729568, 0.3341712, -1.415614, 0, 1, 0.2745098, 1,
-0.2729215, -0.6418784, -1.997071, 0, 1, 0.2784314, 1,
-0.2704257, 0.9439954, 0.3359393, 0, 1, 0.2862745, 1,
-0.2676544, 0.7617519, 0.04028268, 0, 1, 0.2901961, 1,
-0.2675591, -0.8217264, -2.29972, 0, 1, 0.2980392, 1,
-0.2651728, -0.04378157, -0.9581245, 0, 1, 0.3058824, 1,
-0.2622853, 0.1976869, -1.032474, 0, 1, 0.3098039, 1,
-0.2602919, -1.235808, -4.779358, 0, 1, 0.3176471, 1,
-0.2571746, 1.821728, 0.6890115, 0, 1, 0.3215686, 1,
-0.2546495, -1.448912, -2.335036, 0, 1, 0.3294118, 1,
-0.2537137, 0.5654089, -2.040811, 0, 1, 0.3333333, 1,
-0.251348, 1.122441, 2.892457, 0, 1, 0.3411765, 1,
-0.2471744, 0.8429779, -1.263343, 0, 1, 0.345098, 1,
-0.2464111, -0.7254136, -4.42275, 0, 1, 0.3529412, 1,
-0.2431438, 1.038919, 0.06319527, 0, 1, 0.3568628, 1,
-0.2403379, 0.1458942, 0.1377435, 0, 1, 0.3647059, 1,
-0.2366355, -0.7898952, -3.709675, 0, 1, 0.3686275, 1,
-0.2354776, 0.7058803, -0.676906, 0, 1, 0.3764706, 1,
-0.2354128, 0.607264, 0.03785462, 0, 1, 0.3803922, 1,
-0.2337126, 1.23586, -0.5785061, 0, 1, 0.3882353, 1,
-0.2304722, 1.579728, -0.9378808, 0, 1, 0.3921569, 1,
-0.2299878, -0.6465228, -2.792209, 0, 1, 0.4, 1,
-0.2279835, 1.953682, -0.338003, 0, 1, 0.4078431, 1,
-0.225646, 0.7092033, 0.8783426, 0, 1, 0.4117647, 1,
-0.2218244, 0.4507349, 0.04142622, 0, 1, 0.4196078, 1,
-0.2214886, -0.1530538, -1.491647, 0, 1, 0.4235294, 1,
-0.2194941, -0.1765799, -0.9960461, 0, 1, 0.4313726, 1,
-0.2169521, 1.212568, 1.264798, 0, 1, 0.4352941, 1,
-0.2154834, 0.8058701, -0.8206035, 0, 1, 0.4431373, 1,
-0.2126457, 0.2217788, -1.76427, 0, 1, 0.4470588, 1,
-0.2105934, 0.4977956, -0.4049436, 0, 1, 0.454902, 1,
-0.2088647, -0.01570284, -1.756278, 0, 1, 0.4588235, 1,
-0.2082317, 0.08877891, -2.629215, 0, 1, 0.4666667, 1,
-0.2073972, 2.234799, -1.133782, 0, 1, 0.4705882, 1,
-0.2072439, -0.8225143, -3.357496, 0, 1, 0.4784314, 1,
-0.2042901, -0.4149819, -3.30879, 0, 1, 0.4823529, 1,
-0.2029821, -1.510468, -2.291189, 0, 1, 0.4901961, 1,
-0.2023814, 0.5217465, -0.5950055, 0, 1, 0.4941176, 1,
-0.202176, -1.548936, -4.03999, 0, 1, 0.5019608, 1,
-0.1971194, 0.1048989, -0.3613025, 0, 1, 0.509804, 1,
-0.1944722, 1.636088, -0.659174, 0, 1, 0.5137255, 1,
-0.1900624, -1.563195, -4.559189, 0, 1, 0.5215687, 1,
-0.1858263, -0.4384751, -2.234819, 0, 1, 0.5254902, 1,
-0.1853335, 0.1272286, -1.23143, 0, 1, 0.5333334, 1,
-0.1815593, -0.2497719, -1.657843, 0, 1, 0.5372549, 1,
-0.1803758, 0.6015443, -1.680202, 0, 1, 0.5450981, 1,
-0.1795455, 0.6725248, 0.8207744, 0, 1, 0.5490196, 1,
-0.1766252, 1.773592, 0.6394502, 0, 1, 0.5568628, 1,
-0.1727372, -0.3368614, -2.301749, 0, 1, 0.5607843, 1,
-0.1713201, 1.359952, -0.3154161, 0, 1, 0.5686275, 1,
-0.1712898, -2.311274, -3.623966, 0, 1, 0.572549, 1,
-0.1705443, 0.01756393, -2.285211, 0, 1, 0.5803922, 1,
-0.1704876, -1.25213, -4.617027, 0, 1, 0.5843138, 1,
-0.1664182, -0.2066182, -2.348034, 0, 1, 0.5921569, 1,
-0.1656644, 0.9165762, 0.7669512, 0, 1, 0.5960785, 1,
-0.1648371, 0.4910814, 0.1136059, 0, 1, 0.6039216, 1,
-0.1599572, 1.24813, 1.195616, 0, 1, 0.6117647, 1,
-0.1582199, 1.354754, -0.5435244, 0, 1, 0.6156863, 1,
-0.1554749, 0.9266235, -0.2621471, 0, 1, 0.6235294, 1,
-0.150049, 0.4072749, -0.7736219, 0, 1, 0.627451, 1,
-0.1499229, -0.336338, -4.109655, 0, 1, 0.6352941, 1,
-0.1488451, 0.4218526, -1.029673, 0, 1, 0.6392157, 1,
-0.1483435, 0.3036962, 0.5137714, 0, 1, 0.6470588, 1,
-0.148108, -0.1109557, -1.588222, 0, 1, 0.6509804, 1,
-0.147112, 0.06390093, -2.450394, 0, 1, 0.6588235, 1,
-0.1467345, -0.1268267, -2.157292, 0, 1, 0.6627451, 1,
-0.1464503, 0.7261696, -0.2296932, 0, 1, 0.6705883, 1,
-0.1411826, -0.4693303, -4.53451, 0, 1, 0.6745098, 1,
-0.1379434, -2.349123, -2.361387, 0, 1, 0.682353, 1,
-0.1343286, 0.3877083, -0.4415148, 0, 1, 0.6862745, 1,
-0.1294657, -0.3044657, -3.792318, 0, 1, 0.6941177, 1,
-0.1280628, 1.535529, -1.08975, 0, 1, 0.7019608, 1,
-0.1268906, -0.218401, -2.331015, 0, 1, 0.7058824, 1,
-0.1266513, -0.01408158, -2.258316, 0, 1, 0.7137255, 1,
-0.1251092, -0.6059367, -3.047829, 0, 1, 0.7176471, 1,
-0.1238646, -0.9276426, -3.383777, 0, 1, 0.7254902, 1,
-0.1234875, -1.689882, -1.997665, 0, 1, 0.7294118, 1,
-0.1169555, -0.4335485, -3.414414, 0, 1, 0.7372549, 1,
-0.1164381, 0.3935391, 0.8025722, 0, 1, 0.7411765, 1,
-0.1102557, 0.3408867, 0.2565227, 0, 1, 0.7490196, 1,
-0.1089434, 0.326696, -0.1582031, 0, 1, 0.7529412, 1,
-0.1024052, -0.06349626, -2.190823, 0, 1, 0.7607843, 1,
-0.1011574, -1.824969, -3.473824, 0, 1, 0.7647059, 1,
-0.09383687, 1.542537, -0.8668399, 0, 1, 0.772549, 1,
-0.09192522, -2.266387, -1.751682, 0, 1, 0.7764706, 1,
-0.09111832, -1.828565, -3.040668, 0, 1, 0.7843137, 1,
-0.0900505, 1.216843, -0.430808, 0, 1, 0.7882353, 1,
-0.08825508, -0.3758469, -2.407251, 0, 1, 0.7960784, 1,
-0.08802728, -0.01035023, -2.924418, 0, 1, 0.8039216, 1,
-0.08535706, -0.7606069, -3.355688, 0, 1, 0.8078431, 1,
-0.08303764, 0.2828548, -0.6629353, 0, 1, 0.8156863, 1,
-0.08242648, -0.7734643, -2.863276, 0, 1, 0.8196079, 1,
-0.0822094, -1.545208, -3.520702, 0, 1, 0.827451, 1,
-0.08075059, 0.9881096, 0.6562836, 0, 1, 0.8313726, 1,
-0.07840537, -1.635288, -4.406588, 0, 1, 0.8392157, 1,
-0.07688283, -1.105586, -2.654309, 0, 1, 0.8431373, 1,
-0.07550714, -1.851751, -3.375978, 0, 1, 0.8509804, 1,
-0.06848008, -1.16969, -2.063891, 0, 1, 0.854902, 1,
-0.06820627, -0.2241876, -4.521478, 0, 1, 0.8627451, 1,
-0.06630193, -1.00416, -3.611706, 0, 1, 0.8666667, 1,
-0.06481669, 0.6881754, -0.6574328, 0, 1, 0.8745098, 1,
-0.06410761, 2.527949, -0.3208144, 0, 1, 0.8784314, 1,
-0.06393835, -1.49698, -2.586517, 0, 1, 0.8862745, 1,
-0.05443074, -0.2145984, -2.373271, 0, 1, 0.8901961, 1,
-0.05024137, 1.623523, 0.1447759, 0, 1, 0.8980392, 1,
-0.04729242, 0.4567544, -0.4648839, 0, 1, 0.9058824, 1,
-0.04083874, 0.3578407, -1.719573, 0, 1, 0.9098039, 1,
-0.03954884, 1.718954, -0.5025885, 0, 1, 0.9176471, 1,
-0.03940239, 0.3505756, -0.1594283, 0, 1, 0.9215686, 1,
-0.03889803, 0.2819484, 1.048861, 0, 1, 0.9294118, 1,
-0.0383589, 0.7147599, 0.2541822, 0, 1, 0.9333333, 1,
-0.03404032, 0.7314735, -0.8090245, 0, 1, 0.9411765, 1,
-0.03384531, -2.751072, -2.478565, 0, 1, 0.945098, 1,
-0.03196698, -1.234202, -4.559404, 0, 1, 0.9529412, 1,
-0.03118704, -0.6036504, -3.21414, 0, 1, 0.9568627, 1,
-0.03106117, -1.211391, -2.547395, 0, 1, 0.9647059, 1,
-0.03046706, -1.212915, -2.962531, 0, 1, 0.9686275, 1,
-0.01830764, -0.227962, -3.091617, 0, 1, 0.9764706, 1,
-0.01329814, 0.4372534, -0.7037438, 0, 1, 0.9803922, 1,
-0.01254516, 0.3150919, -0.4219944, 0, 1, 0.9882353, 1,
-0.007346172, -0.3455975, -1.335715, 0, 1, 0.9921569, 1,
-0.006919662, -0.1607565, -3.069416, 0, 1, 1, 1,
-0.0007988471, -0.1376583, -3.597564, 0, 0.9921569, 1, 1,
0.004706824, 0.02152031, 0.6973498, 0, 0.9882353, 1, 1,
0.01076326, -0.06694043, 1.496338, 0, 0.9803922, 1, 1,
0.01097733, -0.3778571, 2.124087, 0, 0.9764706, 1, 1,
0.01684225, 0.2676641, -0.1821483, 0, 0.9686275, 1, 1,
0.01753376, 1.357633, 0.9581939, 0, 0.9647059, 1, 1,
0.01864489, -0.5556616, 3.874359, 0, 0.9568627, 1, 1,
0.019826, 1.276515, -1.488161, 0, 0.9529412, 1, 1,
0.02155351, -0.7716926, 4.532404, 0, 0.945098, 1, 1,
0.02399245, -0.6232504, 3.203363, 0, 0.9411765, 1, 1,
0.02803479, 0.918524, -0.03578895, 0, 0.9333333, 1, 1,
0.02902729, 0.2179216, 0.2805695, 0, 0.9294118, 1, 1,
0.03260655, 1.063456, 0.2620721, 0, 0.9215686, 1, 1,
0.04053475, 0.008362174, -0.204183, 0, 0.9176471, 1, 1,
0.04355967, 0.1175434, 0.5527779, 0, 0.9098039, 1, 1,
0.04494549, -0.2995001, 2.529786, 0, 0.9058824, 1, 1,
0.04536887, -0.2825916, 3.732378, 0, 0.8980392, 1, 1,
0.04663771, 0.2651577, 0.8161473, 0, 0.8901961, 1, 1,
0.05090801, 1.31058, -1.361117, 0, 0.8862745, 1, 1,
0.05110862, 1.583328, 1.582464, 0, 0.8784314, 1, 1,
0.05168543, -0.9926358, 4.086647, 0, 0.8745098, 1, 1,
0.05240121, 0.5547305, 1.087696, 0, 0.8666667, 1, 1,
0.05375008, -0.4226287, 0.9515798, 0, 0.8627451, 1, 1,
0.05818186, 0.1547853, -0.3016458, 0, 0.854902, 1, 1,
0.05938721, -0.2112796, 2.968276, 0, 0.8509804, 1, 1,
0.06142479, 0.4150864, 0.1728233, 0, 0.8431373, 1, 1,
0.06320393, -0.414763, 3.179051, 0, 0.8392157, 1, 1,
0.06631901, 0.3696904, -0.8545017, 0, 0.8313726, 1, 1,
0.06976707, -0.9824488, 2.932694, 0, 0.827451, 1, 1,
0.07081828, 1.110458, -1.456781, 0, 0.8196079, 1, 1,
0.07119186, -0.2762566, 2.416438, 0, 0.8156863, 1, 1,
0.07581328, -1.682709, 5.223501, 0, 0.8078431, 1, 1,
0.07594421, 0.09730659, 0.7342657, 0, 0.8039216, 1, 1,
0.08376557, 1.801608, 1.096774, 0, 0.7960784, 1, 1,
0.08605629, 0.2942199, -1.046107, 0, 0.7882353, 1, 1,
0.08612605, 1.014158, 2.060889, 0, 0.7843137, 1, 1,
0.09743127, 0.02609761, 1.054971, 0, 0.7764706, 1, 1,
0.1014951, 0.7564336, -1.252349, 0, 0.772549, 1, 1,
0.104298, -0.07716168, 2.469606, 0, 0.7647059, 1, 1,
0.1045471, 0.1748726, 1.186481, 0, 0.7607843, 1, 1,
0.106797, -0.3505113, 2.817748, 0, 0.7529412, 1, 1,
0.1116536, 2.361615, 0.1712672, 0, 0.7490196, 1, 1,
0.112517, -1.076, 4.146995, 0, 0.7411765, 1, 1,
0.1144601, -0.9637199, 1.762856, 0, 0.7372549, 1, 1,
0.1217925, 0.642408, -1.228366, 0, 0.7294118, 1, 1,
0.1234833, 1.679339, 0.5285282, 0, 0.7254902, 1, 1,
0.1271481, 2.683191, -1.689314, 0, 0.7176471, 1, 1,
0.1272737, 1.514479, 0.866731, 0, 0.7137255, 1, 1,
0.1287848, -1.239906, 5.441052, 0, 0.7058824, 1, 1,
0.1364818, -0.1972882, 3.559492, 0, 0.6980392, 1, 1,
0.1365506, -0.4977318, 2.790257, 0, 0.6941177, 1, 1,
0.1382148, -0.7867242, 3.697609, 0, 0.6862745, 1, 1,
0.1404978, -1.64197, 3.394023, 0, 0.682353, 1, 1,
0.1423104, 0.7296585, -0.3601889, 0, 0.6745098, 1, 1,
0.1451694, -0.4781729, 2.582289, 0, 0.6705883, 1, 1,
0.1532249, 1.554267, -0.7993287, 0, 0.6627451, 1, 1,
0.165222, -0.06412703, 2.270023, 0, 0.6588235, 1, 1,
0.1654565, -0.06245778, 2.722696, 0, 0.6509804, 1, 1,
0.1656511, 1.770469, 0.1315432, 0, 0.6470588, 1, 1,
0.1676524, -1.096738, 1.998314, 0, 0.6392157, 1, 1,
0.1718986, -0.01862258, 2.420048, 0, 0.6352941, 1, 1,
0.1730808, -0.04146343, 1.742071, 0, 0.627451, 1, 1,
0.1731155, 0.6006372, -0.3429001, 0, 0.6235294, 1, 1,
0.1765434, -0.758167, 3.675794, 0, 0.6156863, 1, 1,
0.1767411, -1.230958, 2.698659, 0, 0.6117647, 1, 1,
0.1774457, -0.9662475, 2.165669, 0, 0.6039216, 1, 1,
0.1781773, 0.7736644, 0.05996663, 0, 0.5960785, 1, 1,
0.1797188, -0.2278534, 2.022046, 0, 0.5921569, 1, 1,
0.1797504, 1.832027, 0.5934757, 0, 0.5843138, 1, 1,
0.1801646, 0.6590049, -0.7394405, 0, 0.5803922, 1, 1,
0.180751, 0.6451993, 0.1338239, 0, 0.572549, 1, 1,
0.1816804, 1.982112, 0.2296024, 0, 0.5686275, 1, 1,
0.1846294, -0.5392357, 2.184134, 0, 0.5607843, 1, 1,
0.1861951, 0.5335879, 0.2124467, 0, 0.5568628, 1, 1,
0.1867035, 0.5268939, -0.8377029, 0, 0.5490196, 1, 1,
0.1872344, 1.024387, 1.273904, 0, 0.5450981, 1, 1,
0.1899309, -0.03793114, 1.295561, 0, 0.5372549, 1, 1,
0.193732, 0.4488055, 0.668537, 0, 0.5333334, 1, 1,
0.1963802, -0.01865779, 2.61405, 0, 0.5254902, 1, 1,
0.1991587, -1.348632, 2.659193, 0, 0.5215687, 1, 1,
0.2000279, -1.13092, 3.042027, 0, 0.5137255, 1, 1,
0.2011067, -0.359579, 1.207025, 0, 0.509804, 1, 1,
0.2049856, -0.5443619, 4.646739, 0, 0.5019608, 1, 1,
0.2060339, 0.253577, -0.1298218, 0, 0.4941176, 1, 1,
0.2073032, -0.9364974, 2.142746, 0, 0.4901961, 1, 1,
0.2076351, -0.1340871, 2.367995, 0, 0.4823529, 1, 1,
0.2094036, 0.282091, 0.8631151, 0, 0.4784314, 1, 1,
0.2097274, -0.9990188, 0.3098948, 0, 0.4705882, 1, 1,
0.2138798, 1.320552, 0.2879086, 0, 0.4666667, 1, 1,
0.2139529, 0.5967957, 1.076431, 0, 0.4588235, 1, 1,
0.2144805, -0.5089664, 3.209824, 0, 0.454902, 1, 1,
0.2165664, 1.679348, 0.302319, 0, 0.4470588, 1, 1,
0.2179922, 1.268052, 0.05520229, 0, 0.4431373, 1, 1,
0.2224578, 0.6644807, 0.7568818, 0, 0.4352941, 1, 1,
0.2255916, -1.232228, 2.482225, 0, 0.4313726, 1, 1,
0.2294082, -1.164684, 1.497471, 0, 0.4235294, 1, 1,
0.2326564, 1.677321, 0.6912483, 0, 0.4196078, 1, 1,
0.2370951, 0.3552423, 1.193881, 0, 0.4117647, 1, 1,
0.2423513, -2.755816, 3.172674, 0, 0.4078431, 1, 1,
0.2427769, -2.571447, 3.53894, 0, 0.4, 1, 1,
0.2435896, -0.2557461, 1.485801, 0, 0.3921569, 1, 1,
0.2443302, 0.72851, 0.7988625, 0, 0.3882353, 1, 1,
0.2457837, 0.01923537, 1.006433, 0, 0.3803922, 1, 1,
0.2519139, 1.962663, 0.2827124, 0, 0.3764706, 1, 1,
0.2523939, -0.9775171, 3.94912, 0, 0.3686275, 1, 1,
0.2603943, 1.573658, -1.467839, 0, 0.3647059, 1, 1,
0.2620066, 0.164873, 1.169254, 0, 0.3568628, 1, 1,
0.269687, -0.4212225, 2.297118, 0, 0.3529412, 1, 1,
0.2709805, -1.285228, 3.738809, 0, 0.345098, 1, 1,
0.2778374, 0.6974701, 2.203571, 0, 0.3411765, 1, 1,
0.2809995, 0.6842564, 0.008290132, 0, 0.3333333, 1, 1,
0.2814534, -0.07079474, 1.786479, 0, 0.3294118, 1, 1,
0.2815107, -0.1514328, 1.368057, 0, 0.3215686, 1, 1,
0.2853853, 0.2595098, 0.17993, 0, 0.3176471, 1, 1,
0.2859299, -0.8573104, 2.621215, 0, 0.3098039, 1, 1,
0.290305, 1.589795, -1.619562, 0, 0.3058824, 1, 1,
0.2921435, 0.5086033, 0.4679815, 0, 0.2980392, 1, 1,
0.2962043, 0.9463326, 1.544002, 0, 0.2901961, 1, 1,
0.2967784, -0.02235124, 0.5798045, 0, 0.2862745, 1, 1,
0.2973919, -1.276408, 3.335526, 0, 0.2784314, 1, 1,
0.2988007, -0.4890841, 2.14162, 0, 0.2745098, 1, 1,
0.300923, -0.3247455, 1.514768, 0, 0.2666667, 1, 1,
0.3076049, -0.6968169, 3.358141, 0, 0.2627451, 1, 1,
0.3102834, 0.5997367, 0.6920021, 0, 0.254902, 1, 1,
0.3117664, 2.497575, -0.8478656, 0, 0.2509804, 1, 1,
0.3349033, 0.9358184, 0.2172621, 0, 0.2431373, 1, 1,
0.3371242, -0.2133483, 1.04324, 0, 0.2392157, 1, 1,
0.3376724, -1.442077, 2.973353, 0, 0.2313726, 1, 1,
0.341558, -0.3183008, 0.2687344, 0, 0.227451, 1, 1,
0.3460956, -1.180941, 2.456008, 0, 0.2196078, 1, 1,
0.3471229, 0.8507244, -0.4694794, 0, 0.2156863, 1, 1,
0.3480089, 0.2900648, 0.2346208, 0, 0.2078431, 1, 1,
0.3550479, 1.191099, 2.417105, 0, 0.2039216, 1, 1,
0.3568094, 0.6449761, 0.7856865, 0, 0.1960784, 1, 1,
0.3572348, -1.03578, 5.117857, 0, 0.1882353, 1, 1,
0.3589692, -1.132513, 1.829454, 0, 0.1843137, 1, 1,
0.359905, -1.186373, 3.433657, 0, 0.1764706, 1, 1,
0.3610622, -0.1931806, 3.565785, 0, 0.172549, 1, 1,
0.3616525, 1.815395, 0.1747285, 0, 0.1647059, 1, 1,
0.3620888, -1.248666, 3.67942, 0, 0.1607843, 1, 1,
0.3631923, -0.4782403, 1.771811, 0, 0.1529412, 1, 1,
0.367166, -0.4995711, 3.929607, 0, 0.1490196, 1, 1,
0.3674937, 1.458358, 0.3314075, 0, 0.1411765, 1, 1,
0.3738087, -0.1295903, 3.40734, 0, 0.1372549, 1, 1,
0.3753004, -0.3399597, 2.931039, 0, 0.1294118, 1, 1,
0.3799069, -0.7874751, 2.572727, 0, 0.1254902, 1, 1,
0.3813804, -0.1417591, 2.022423, 0, 0.1176471, 1, 1,
0.3840163, -2.134896, 2.261544, 0, 0.1137255, 1, 1,
0.3850843, 0.662402, 0.046274, 0, 0.1058824, 1, 1,
0.385223, 1.48408, 1.096155, 0, 0.09803922, 1, 1,
0.3852907, -0.002758507, 1.361186, 0, 0.09411765, 1, 1,
0.3863689, 0.8410755, 2.54368, 0, 0.08627451, 1, 1,
0.3869344, 1.147008, -1.208907, 0, 0.08235294, 1, 1,
0.3871479, -0.2770316, 3.330317, 0, 0.07450981, 1, 1,
0.3914414, -0.6389815, 3.038962, 0, 0.07058824, 1, 1,
0.3924936, 0.9507546, 2.175225, 0, 0.0627451, 1, 1,
0.3935595, -0.2790978, 3.300619, 0, 0.05882353, 1, 1,
0.3955549, 0.8854064, 0.1513719, 0, 0.05098039, 1, 1,
0.3975803, 1.570849, 0.1757134, 0, 0.04705882, 1, 1,
0.4081736, 2.137407, -0.4175082, 0, 0.03921569, 1, 1,
0.4083438, -0.68725, 3.511492, 0, 0.03529412, 1, 1,
0.4089935, 0.2696074, 0.04214724, 0, 0.02745098, 1, 1,
0.4090208, -1.630899, 2.949739, 0, 0.02352941, 1, 1,
0.4124351, -0.4983747, 2.088207, 0, 0.01568628, 1, 1,
0.4126344, 0.2270742, -0.3660713, 0, 0.01176471, 1, 1,
0.4142942, -0.54752, 1.72168, 0, 0.003921569, 1, 1,
0.4169219, 0.2483614, 1.262794, 0.003921569, 0, 1, 1,
0.4171836, -0.5463987, 1.354664, 0.007843138, 0, 1, 1,
0.4175872, -0.6682827, 2.302094, 0.01568628, 0, 1, 1,
0.4195565, -1.007852, 3.848967, 0.01960784, 0, 1, 1,
0.4201212, 1.011496, -0.4960418, 0.02745098, 0, 1, 1,
0.429193, -0.8987861, 3.353999, 0.03137255, 0, 1, 1,
0.4314786, -1.038735, 2.344721, 0.03921569, 0, 1, 1,
0.4343566, -1.468412, 4.834517, 0.04313726, 0, 1, 1,
0.4349566, 0.1010361, 0.8879329, 0.05098039, 0, 1, 1,
0.4374463, 0.4173532, -0.4771014, 0.05490196, 0, 1, 1,
0.4456122, -1.872157, 1.406601, 0.0627451, 0, 1, 1,
0.4482697, -0.3703095, 3.148327, 0.06666667, 0, 1, 1,
0.4492848, -0.1377786, 1.171874, 0.07450981, 0, 1, 1,
0.4521372, -1.299117, 1.478169, 0.07843138, 0, 1, 1,
0.4549851, -1.957451, 2.63239, 0.08627451, 0, 1, 1,
0.4567556, 0.3485799, -0.1561418, 0.09019608, 0, 1, 1,
0.4576795, -1.605629, 2.678124, 0.09803922, 0, 1, 1,
0.4609569, -0.8215044, 2.445762, 0.1058824, 0, 1, 1,
0.4617447, 0.5824406, 1.547987, 0.1098039, 0, 1, 1,
0.4690418, -1.603387, 3.592085, 0.1176471, 0, 1, 1,
0.4733975, 0.2167357, 0.6106427, 0.1215686, 0, 1, 1,
0.4773914, -0.6365013, 3.183772, 0.1294118, 0, 1, 1,
0.482246, 0.5008187, 2.12785, 0.1333333, 0, 1, 1,
0.4839126, -0.4769751, 1.938532, 0.1411765, 0, 1, 1,
0.4924924, 0.01305037, 2.021438, 0.145098, 0, 1, 1,
0.4959042, -0.7818945, 2.206027, 0.1529412, 0, 1, 1,
0.5103108, -0.1218292, 2.112266, 0.1568628, 0, 1, 1,
0.5167631, -0.5036886, 4.687132, 0.1647059, 0, 1, 1,
0.5180964, 0.6578498, 1.023262, 0.1686275, 0, 1, 1,
0.5181361, 0.3375525, 1.146439, 0.1764706, 0, 1, 1,
0.5183783, 0.5453939, 1.265095, 0.1803922, 0, 1, 1,
0.5199128, -0.5691129, 4.391064, 0.1882353, 0, 1, 1,
0.5302126, -2.364382, 0.848851, 0.1921569, 0, 1, 1,
0.5350937, -0.1503062, 1.239685, 0.2, 0, 1, 1,
0.5353318, -1.14228, 0.6584179, 0.2078431, 0, 1, 1,
0.5387037, -1.029895, 2.533568, 0.2117647, 0, 1, 1,
0.5549562, 0.2518943, -0.006146247, 0.2196078, 0, 1, 1,
0.5615658, -0.3071226, 1.79216, 0.2235294, 0, 1, 1,
0.5706358, 0.2893868, 3.462575, 0.2313726, 0, 1, 1,
0.5722907, 0.19782, 1.250046, 0.2352941, 0, 1, 1,
0.5765409, -0.3437208, 2.874741, 0.2431373, 0, 1, 1,
0.5765867, -1.392719, 2.73407, 0.2470588, 0, 1, 1,
0.5776283, 0.2739648, 0.2793688, 0.254902, 0, 1, 1,
0.5819513, 1.024547, -3.973393, 0.2588235, 0, 1, 1,
0.5882937, 0.2892627, 2.095736, 0.2666667, 0, 1, 1,
0.5950679, 0.2665781, 1.949805, 0.2705882, 0, 1, 1,
0.5962158, -0.1552387, 2.813538, 0.2784314, 0, 1, 1,
0.5981063, 1.556465, 1.419867, 0.282353, 0, 1, 1,
0.6011192, -0.9965206, 2.721661, 0.2901961, 0, 1, 1,
0.6032506, 0.3930123, 0.1376489, 0.2941177, 0, 1, 1,
0.6067216, 0.5094491, 0.9971668, 0.3019608, 0, 1, 1,
0.6103007, -0.6436934, 2.439176, 0.3098039, 0, 1, 1,
0.6147961, -0.3105736, 2.297924, 0.3137255, 0, 1, 1,
0.6157999, -0.2614201, 2.127819, 0.3215686, 0, 1, 1,
0.6165672, 0.3440624, 0.5341654, 0.3254902, 0, 1, 1,
0.61721, -1.291432, 2.937786, 0.3333333, 0, 1, 1,
0.6178051, -1.169041, 3.19859, 0.3372549, 0, 1, 1,
0.6207991, -1.241192, 1.925683, 0.345098, 0, 1, 1,
0.6263696, -1.417941, 3.42389, 0.3490196, 0, 1, 1,
0.6268494, 0.3323993, 1.622383, 0.3568628, 0, 1, 1,
0.6284117, 1.996285, 1.251989, 0.3607843, 0, 1, 1,
0.6320493, 0.2861369, 1.474359, 0.3686275, 0, 1, 1,
0.6330362, 1.349363, -0.3077141, 0.372549, 0, 1, 1,
0.6358827, -0.2986911, 1.649354, 0.3803922, 0, 1, 1,
0.6394681, 0.676072, 1.678477, 0.3843137, 0, 1, 1,
0.6404142, 1.174676, 1.383083, 0.3921569, 0, 1, 1,
0.6405342, 1.667842, -1.689025, 0.3960784, 0, 1, 1,
0.6432442, 1.367964, -0.4365078, 0.4039216, 0, 1, 1,
0.6475845, -0.8129045, 2.034117, 0.4117647, 0, 1, 1,
0.6480156, -1.764955, 2.909259, 0.4156863, 0, 1, 1,
0.648214, -0.9590115, 4.701583, 0.4235294, 0, 1, 1,
0.650693, -0.3699297, 3.541279, 0.427451, 0, 1, 1,
0.6507321, -0.4160993, 2.63192, 0.4352941, 0, 1, 1,
0.6526866, -1.39791, 2.886659, 0.4392157, 0, 1, 1,
0.6561711, -0.5928829, 2.572922, 0.4470588, 0, 1, 1,
0.6614295, 1.266592, -0.2795277, 0.4509804, 0, 1, 1,
0.6624798, 0.5891901, 1.400699, 0.4588235, 0, 1, 1,
0.6626589, 1.294356, -0.09454819, 0.4627451, 0, 1, 1,
0.6629611, 2.50169, -1.196022, 0.4705882, 0, 1, 1,
0.6658543, 0.6488596, 0.8663431, 0.4745098, 0, 1, 1,
0.6662213, -0.6030369, 3.735734, 0.4823529, 0, 1, 1,
0.6759135, 1.272378, 0.8041524, 0.4862745, 0, 1, 1,
0.6783744, -1.633663, 3.521122, 0.4941176, 0, 1, 1,
0.6804766, -0.5421125, 2.957363, 0.5019608, 0, 1, 1,
0.6832042, 0.06045169, 1.658279, 0.5058824, 0, 1, 1,
0.6847571, -1.617387, 4.356065, 0.5137255, 0, 1, 1,
0.6922668, 0.959489, 2.195465, 0.5176471, 0, 1, 1,
0.7010846, -0.8971829, 1.338579, 0.5254902, 0, 1, 1,
0.7127156, -0.2042305, 2.442931, 0.5294118, 0, 1, 1,
0.7201363, -1.226203, 2.07029, 0.5372549, 0, 1, 1,
0.7205524, -0.4108519, 0.6331555, 0.5411765, 0, 1, 1,
0.7236413, -0.008176538, 2.257511, 0.5490196, 0, 1, 1,
0.7277782, -0.278598, 1.179131, 0.5529412, 0, 1, 1,
0.7294781, 0.9463844, 0.01329052, 0.5607843, 0, 1, 1,
0.729973, -0.8489841, 1.839153, 0.5647059, 0, 1, 1,
0.7332564, -1.066241, 2.929701, 0.572549, 0, 1, 1,
0.7333117, -0.6661773, 3.021928, 0.5764706, 0, 1, 1,
0.7368059, -0.9098821, 2.214291, 0.5843138, 0, 1, 1,
0.7427061, 0.3117465, 2.445337, 0.5882353, 0, 1, 1,
0.7449765, -0.2716571, 2.028002, 0.5960785, 0, 1, 1,
0.7462322, 0.4808724, 0.8729849, 0.6039216, 0, 1, 1,
0.7486149, -0.53925, 1.102563, 0.6078432, 0, 1, 1,
0.7494951, 0.4975276, 0.8521656, 0.6156863, 0, 1, 1,
0.751318, -0.3227185, 1.851743, 0.6196079, 0, 1, 1,
0.7585117, -0.3250734, 0.7571369, 0.627451, 0, 1, 1,
0.7639499, -0.6405194, 1.907906, 0.6313726, 0, 1, 1,
0.7676919, -0.8202285, 1.808651, 0.6392157, 0, 1, 1,
0.7794525, -1.112153, 3.057159, 0.6431373, 0, 1, 1,
0.7816204, -0.6010282, 3.203046, 0.6509804, 0, 1, 1,
0.7829736, -0.1112588, 0.6040385, 0.654902, 0, 1, 1,
0.808713, -0.203391, 3.118759, 0.6627451, 0, 1, 1,
0.8100018, 1.212734, 0.991875, 0.6666667, 0, 1, 1,
0.8143889, -2.538474, 1.330335, 0.6745098, 0, 1, 1,
0.8153555, -1.567315, 3.596271, 0.6784314, 0, 1, 1,
0.8183521, -0.257617, 3.326789, 0.6862745, 0, 1, 1,
0.8263101, -0.5079092, 2.035021, 0.6901961, 0, 1, 1,
0.8315216, -0.5442904, 1.954066, 0.6980392, 0, 1, 1,
0.8332094, 1.636084, 0.9168248, 0.7058824, 0, 1, 1,
0.8389345, -0.5073361, 3.565543, 0.7098039, 0, 1, 1,
0.8411191, -0.2023007, 1.906846, 0.7176471, 0, 1, 1,
0.8492131, 0.4508646, -0.1923958, 0.7215686, 0, 1, 1,
0.8512121, 0.2270078, 2.49494, 0.7294118, 0, 1, 1,
0.8530782, 1.763216, -0.6473286, 0.7333333, 0, 1, 1,
0.856347, 1.169231, 1.234373, 0.7411765, 0, 1, 1,
0.8682533, 0.1131163, 1.766875, 0.7450981, 0, 1, 1,
0.8697729, 0.4199006, 1.039118, 0.7529412, 0, 1, 1,
0.8704286, 0.5172936, 0.5897695, 0.7568628, 0, 1, 1,
0.8769411, 0.06518122, 1.481397, 0.7647059, 0, 1, 1,
0.8777344, -0.1936396, 1.76155, 0.7686275, 0, 1, 1,
0.8793033, -0.2944449, 3.466108, 0.7764706, 0, 1, 1,
0.8834808, 1.188077, -0.7633058, 0.7803922, 0, 1, 1,
0.8857086, 0.1817062, 0.2999112, 0.7882353, 0, 1, 1,
0.8859845, 0.9005094, -0.01029056, 0.7921569, 0, 1, 1,
0.8864009, 0.8388088, -0.3713644, 0.8, 0, 1, 1,
0.8886096, 1.777578, -0.5279228, 0.8078431, 0, 1, 1,
0.8908529, -1.798783, 2.942188, 0.8117647, 0, 1, 1,
0.8999096, -0.3013385, 1.883895, 0.8196079, 0, 1, 1,
0.9064433, 0.9536066, -0.03588169, 0.8235294, 0, 1, 1,
0.9083635, -0.6946622, 1.857744, 0.8313726, 0, 1, 1,
0.9093544, 0.4521109, 1.19666, 0.8352941, 0, 1, 1,
0.9120958, -0.2750899, 2.487561, 0.8431373, 0, 1, 1,
0.9129146, -0.7880092, 3.191196, 0.8470588, 0, 1, 1,
0.9147309, 0.7788371, -0.1753268, 0.854902, 0, 1, 1,
0.9151268, 0.8801686, -0.01678498, 0.8588235, 0, 1, 1,
0.9422624, -0.160866, 4.033835, 0.8666667, 0, 1, 1,
0.9462753, -0.3840127, 2.590463, 0.8705882, 0, 1, 1,
0.9489859, 0.1765313, 2.601013, 0.8784314, 0, 1, 1,
0.9510151, 0.07037077, 2.030159, 0.8823529, 0, 1, 1,
0.9536642, 0.2584009, 2.096443, 0.8901961, 0, 1, 1,
0.9536739, 2.772759, -0.8863873, 0.8941177, 0, 1, 1,
0.9549435, -0.249799, 0.8055191, 0.9019608, 0, 1, 1,
0.9552655, -0.4601959, 1.108978, 0.9098039, 0, 1, 1,
0.9614629, -1.250097, 3.52051, 0.9137255, 0, 1, 1,
0.9637645, 0.2964682, 2.380458, 0.9215686, 0, 1, 1,
0.9642619, -0.5421137, 0.9283022, 0.9254902, 0, 1, 1,
0.964541, 1.483138, -0.4297349, 0.9333333, 0, 1, 1,
0.9647661, 0.01281497, 1.644626, 0.9372549, 0, 1, 1,
0.9649742, -0.5636711, 2.467992, 0.945098, 0, 1, 1,
0.9723206, -0.2792304, 1.600878, 0.9490196, 0, 1, 1,
0.9809129, -0.2336169, 0.4869179, 0.9568627, 0, 1, 1,
0.9838809, 0.7117941, 0.7073257, 0.9607843, 0, 1, 1,
0.9841468, 0.9538443, 1.072392, 0.9686275, 0, 1, 1,
0.993476, -0.01535199, 1.763679, 0.972549, 0, 1, 1,
0.993916, -0.5260385, 1.961356, 0.9803922, 0, 1, 1,
1.004228, -0.9081063, 1.57045, 0.9843137, 0, 1, 1,
1.021056, 0.4830109, 2.380964, 0.9921569, 0, 1, 1,
1.031893, -0.02230774, 2.041884, 0.9960784, 0, 1, 1,
1.033479, 0.7975823, 1.28851, 1, 0, 0.9960784, 1,
1.035399, 0.0168313, 1.871226, 1, 0, 0.9882353, 1,
1.036942, -0.3291443, 1.05663, 1, 0, 0.9843137, 1,
1.042442, 1.696875, 0.7536378, 1, 0, 0.9764706, 1,
1.043447, -0.6428839, 2.6399, 1, 0, 0.972549, 1,
1.046476, -0.4887569, 1.00523, 1, 0, 0.9647059, 1,
1.05403, -1.187601, 1.76554, 1, 0, 0.9607843, 1,
1.05432, 1.337965, 1.049807, 1, 0, 0.9529412, 1,
1.059013, -0.0991097, 1.475984, 1, 0, 0.9490196, 1,
1.059515, -0.6819441, 1.702286, 1, 0, 0.9411765, 1,
1.061541, -0.5563377, 0.7436703, 1, 0, 0.9372549, 1,
1.065047, 0.8083404, 2.378177, 1, 0, 0.9294118, 1,
1.065866, -0.8578654, 1.989231, 1, 0, 0.9254902, 1,
1.068779, -0.2592671, 1.249027, 1, 0, 0.9176471, 1,
1.069543, -0.64953, 3.394292, 1, 0, 0.9137255, 1,
1.069583, -0.3510364, 2.020947, 1, 0, 0.9058824, 1,
1.078373, -0.3975181, 2.074683, 1, 0, 0.9019608, 1,
1.082575, 1.722388, 0.08353188, 1, 0, 0.8941177, 1,
1.084379, -0.475631, 1.465037, 1, 0, 0.8862745, 1,
1.085337, 0.4906327, 0.09915899, 1, 0, 0.8823529, 1,
1.091165, -0.0932717, 3.050425, 1, 0, 0.8745098, 1,
1.093496, 0.5248666, 0.6118355, 1, 0, 0.8705882, 1,
1.097352, 1.110827, -0.8056504, 1, 0, 0.8627451, 1,
1.09845, 0.6354464, 2.388204, 1, 0, 0.8588235, 1,
1.10102, 2.055521, -0.6707796, 1, 0, 0.8509804, 1,
1.108245, 0.2394681, 1.078542, 1, 0, 0.8470588, 1,
1.109585, -0.01315326, 2.618511, 1, 0, 0.8392157, 1,
1.113984, -0.2405362, 1.305405, 1, 0, 0.8352941, 1,
1.121141, -0.5943548, -0.1645429, 1, 0, 0.827451, 1,
1.130147, -0.06647366, 3.779332, 1, 0, 0.8235294, 1,
1.130398, -0.799639, 2.71778, 1, 0, 0.8156863, 1,
1.145339, -1.435258, 2.171855, 1, 0, 0.8117647, 1,
1.14986, -0.5467129, 0.6519552, 1, 0, 0.8039216, 1,
1.170234, -0.1049898, -1.333959, 1, 0, 0.7960784, 1,
1.17928, 1.057979, 2.392112, 1, 0, 0.7921569, 1,
1.179656, -0.7904176, 3.53639, 1, 0, 0.7843137, 1,
1.192112, -0.258752, 0.9366313, 1, 0, 0.7803922, 1,
1.195625, -0.4785101, 1.939301, 1, 0, 0.772549, 1,
1.19849, 0.3707711, 1.525286, 1, 0, 0.7686275, 1,
1.199405, -0.8725841, 2.051584, 1, 0, 0.7607843, 1,
1.206498, 0.3775273, -0.03427834, 1, 0, 0.7568628, 1,
1.206521, 1.289268, 0.7905881, 1, 0, 0.7490196, 1,
1.207145, 1.684107, -0.3771088, 1, 0, 0.7450981, 1,
1.217931, 0.2948638, 1.641742, 1, 0, 0.7372549, 1,
1.234504, 0.4163606, 1.360447, 1, 0, 0.7333333, 1,
1.242301, -0.3517343, 2.319579, 1, 0, 0.7254902, 1,
1.256021, -1.66969, 1.904659, 1, 0, 0.7215686, 1,
1.261041, 0.5075372, 0.1144002, 1, 0, 0.7137255, 1,
1.268984, 0.2045583, 0.5779548, 1, 0, 0.7098039, 1,
1.271967, 1.969074, -0.874962, 1, 0, 0.7019608, 1,
1.273256, 0.2648868, 1.889366, 1, 0, 0.6941177, 1,
1.273497, 0.2338542, 2.929241, 1, 0, 0.6901961, 1,
1.278076, 0.1887689, 1.91271, 1, 0, 0.682353, 1,
1.279074, -0.3996557, 3.217348, 1, 0, 0.6784314, 1,
1.287358, -0.9500988, 3.392678, 1, 0, 0.6705883, 1,
1.28767, -1.111913, 4.833728, 1, 0, 0.6666667, 1,
1.290573, -0.8725848, 3.038816, 1, 0, 0.6588235, 1,
1.295786, -1.362093, 2.519199, 1, 0, 0.654902, 1,
1.296088, -0.367808, 0.6757572, 1, 0, 0.6470588, 1,
1.305679, -0.495313, 3.162099, 1, 0, 0.6431373, 1,
1.323867, 0.2653658, 1.881065, 1, 0, 0.6352941, 1,
1.330593, -1.396257, 2.614579, 1, 0, 0.6313726, 1,
1.338173, 0.6779961, 1.282793, 1, 0, 0.6235294, 1,
1.344972, -2.487182, 4.905005, 1, 0, 0.6196079, 1,
1.346604, -0.5470167, 2.199893, 1, 0, 0.6117647, 1,
1.355673, 0.8706139, -0.4196826, 1, 0, 0.6078432, 1,
1.368111, 1.260446, 1.961802, 1, 0, 0.6, 1,
1.373917, -0.6262317, -0.001079314, 1, 0, 0.5921569, 1,
1.393504, -0.648149, 0.5865957, 1, 0, 0.5882353, 1,
1.39589, -0.2948287, 1.238909, 1, 0, 0.5803922, 1,
1.398033, -1.041096, 1.020442, 1, 0, 0.5764706, 1,
1.399268, -1.291398, 1.625124, 1, 0, 0.5686275, 1,
1.406456, 0.3663144, -0.2036205, 1, 0, 0.5647059, 1,
1.416549, -2.333034, 0.7187485, 1, 0, 0.5568628, 1,
1.436574, -1.212044, 2.826411, 1, 0, 0.5529412, 1,
1.444826, 0.8038012, 1.87752, 1, 0, 0.5450981, 1,
1.451091, 0.4874073, 1.699281, 1, 0, 0.5411765, 1,
1.459526, -0.8666339, 3.507305, 1, 0, 0.5333334, 1,
1.463851, -1.283008, 4.837486, 1, 0, 0.5294118, 1,
1.482353, 0.259607, 2.966385, 1, 0, 0.5215687, 1,
1.485782, -0.5086427, 1.49879, 1, 0, 0.5176471, 1,
1.488648, -1.165902, 2.673221, 1, 0, 0.509804, 1,
1.489386, 2.062938, 0.7875419, 1, 0, 0.5058824, 1,
1.490809, -0.8698338, 2.298443, 1, 0, 0.4980392, 1,
1.493165, 0.680233, 1.81119, 1, 0, 0.4901961, 1,
1.499071, -0.0805472, 3.136661, 1, 0, 0.4862745, 1,
1.505081, -0.9210551, 0.104891, 1, 0, 0.4784314, 1,
1.506498, 0.09529378, 0.3514096, 1, 0, 0.4745098, 1,
1.527632, 2.197247, 0.1518802, 1, 0, 0.4666667, 1,
1.528211, 0.393163, 0.9990834, 1, 0, 0.4627451, 1,
1.533254, -0.2091867, 1.543913, 1, 0, 0.454902, 1,
1.543195, -0.4930617, 2.481754, 1, 0, 0.4509804, 1,
1.560676, 0.6497593, 1.952377, 1, 0, 0.4431373, 1,
1.576127, -0.1562653, 2.120168, 1, 0, 0.4392157, 1,
1.584165, -0.3577662, 2.547045, 1, 0, 0.4313726, 1,
1.61147, 1.218944, 0.8398499, 1, 0, 0.427451, 1,
1.617441, -0.2601212, 1.640179, 1, 0, 0.4196078, 1,
1.61945, -0.8771919, 1.527707, 1, 0, 0.4156863, 1,
1.622261, -0.8526192, 1.91498, 1, 0, 0.4078431, 1,
1.63157, 0.1470449, 2.688747, 1, 0, 0.4039216, 1,
1.632471, 0.8659027, 1.711621, 1, 0, 0.3960784, 1,
1.63596, 2.021575, 2.512385, 1, 0, 0.3882353, 1,
1.63613, -0.7358866, 0.7069379, 1, 0, 0.3843137, 1,
1.65492, 0.3590909, 1.561915, 1, 0, 0.3764706, 1,
1.661313, -0.2376366, 2.384019, 1, 0, 0.372549, 1,
1.664885, 0.6751504, 0.1272683, 1, 0, 0.3647059, 1,
1.668993, -1.408702, 2.300954, 1, 0, 0.3607843, 1,
1.670212, 0.5169557, 1.243472, 1, 0, 0.3529412, 1,
1.678909, 1.960855, 2.965809, 1, 0, 0.3490196, 1,
1.680552, -0.1343442, 1.633588, 1, 0, 0.3411765, 1,
1.690356, 1.181922, 0.9131964, 1, 0, 0.3372549, 1,
1.693957, -1.237563, 1.02209, 1, 0, 0.3294118, 1,
1.695903, -0.2084692, 1.022326, 1, 0, 0.3254902, 1,
1.696049, 0.1176991, 0.8929831, 1, 0, 0.3176471, 1,
1.713406, -1.353024, 2.366508, 1, 0, 0.3137255, 1,
1.72433, -0.3472216, 2.568679, 1, 0, 0.3058824, 1,
1.733433, 0.001955011, 2.143216, 1, 0, 0.2980392, 1,
1.736403, -0.06289563, 2.830467, 1, 0, 0.2941177, 1,
1.748307, 0.6860568, 3.7098, 1, 0, 0.2862745, 1,
1.749096, 1.205409, 0.2157364, 1, 0, 0.282353, 1,
1.761403, -0.2402093, 2.299823, 1, 0, 0.2745098, 1,
1.777671, -0.1326208, 1.301463, 1, 0, 0.2705882, 1,
1.809057, 1.988567, 3.08461, 1, 0, 0.2627451, 1,
1.817483, 1.063035, 0.5965222, 1, 0, 0.2588235, 1,
1.861968, -1.366262, 1.414774, 1, 0, 0.2509804, 1,
1.874493, -1.046527, 1.683866, 1, 0, 0.2470588, 1,
1.887085, 0.3762178, 1.493624, 1, 0, 0.2392157, 1,
1.944217, -0.7547199, 3.82288, 1, 0, 0.2352941, 1,
1.945586, -1.00286, 0.2490032, 1, 0, 0.227451, 1,
1.953719, -0.3774396, 1.285543, 1, 0, 0.2235294, 1,
1.956068, -1.076763, 2.008281, 1, 0, 0.2156863, 1,
1.964731, 1.212187, -1.028609, 1, 0, 0.2117647, 1,
1.970317, -2.703526, 2.902254, 1, 0, 0.2039216, 1,
1.986728, -0.6643642, 2.995702, 1, 0, 0.1960784, 1,
1.990858, 0.7353216, -0.1886712, 1, 0, 0.1921569, 1,
2.010155, 1.134021, 2.421625, 1, 0, 0.1843137, 1,
2.024935, -0.05592574, 1.288104, 1, 0, 0.1803922, 1,
2.032737, 1.035723, 2.017684, 1, 0, 0.172549, 1,
2.036167, 0.2886781, 1.519663, 1, 0, 0.1686275, 1,
2.063864, 0.4491501, 2.169359, 1, 0, 0.1607843, 1,
2.081716, 0.4350323, 1.614221, 1, 0, 0.1568628, 1,
2.104855, -0.8386832, 2.502643, 1, 0, 0.1490196, 1,
2.105097, -3.862576, 2.021642, 1, 0, 0.145098, 1,
2.124518, -0.2430812, 1.53684, 1, 0, 0.1372549, 1,
2.178865, 0.0870854, 1.258398, 1, 0, 0.1333333, 1,
2.192227, 0.777862, 1.249898, 1, 0, 0.1254902, 1,
2.199603, -0.04676579, 2.301649, 1, 0, 0.1215686, 1,
2.227813, -1.742772, 1.942123, 1, 0, 0.1137255, 1,
2.228424, 0.7865971, -0.1923136, 1, 0, 0.1098039, 1,
2.236481, -1.600252, 1.908967, 1, 0, 0.1019608, 1,
2.251826, 0.2411481, 2.286613, 1, 0, 0.09411765, 1,
2.274052, -1.034326, 1.961433, 1, 0, 0.09019608, 1,
2.294228, 0.2146305, 0.8559286, 1, 0, 0.08235294, 1,
2.295994, -0.3156195, 1.931682, 1, 0, 0.07843138, 1,
2.298107, 0.6157914, 0.9466379, 1, 0, 0.07058824, 1,
2.379295, -0.6392922, 1.713733, 1, 0, 0.06666667, 1,
2.40985, 0.1032958, 3.1883, 1, 0, 0.05882353, 1,
2.456722, 0.6689245, 2.603553, 1, 0, 0.05490196, 1,
2.48742, -0.8957252, 0.7815174, 1, 0, 0.04705882, 1,
2.632161, 0.2879995, 0.7015985, 1, 0, 0.04313726, 1,
2.660481, 0.6834723, 0.6414145, 1, 0, 0.03529412, 1,
2.859821, 0.8188717, 1.034652, 1, 0, 0.03137255, 1,
2.883093, 0.3564155, 1.06973, 1, 0, 0.02352941, 1,
2.898074, 0.2433165, 0.8542337, 1, 0, 0.01960784, 1,
2.969671, -1.675364, 1.483156, 1, 0, 0.01176471, 1,
3.455714, 0.6634402, 1.618621, 1, 0, 0.007843138, 1
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
0.3471119, -5.014884, -6.9067, 0, -0.5, 0.5, 0.5,
0.3471119, -5.014884, -6.9067, 1, -0.5, 0.5, 0.5,
0.3471119, -5.014884, -6.9067, 1, 1.5, 0.5, 0.5,
0.3471119, -5.014884, -6.9067, 0, 1.5, 0.5, 0.5
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
-3.815306, -0.4634378, -6.9067, 0, -0.5, 0.5, 0.5,
-3.815306, -0.4634378, -6.9067, 1, -0.5, 0.5, 0.5,
-3.815306, -0.4634378, -6.9067, 1, 1.5, 0.5, 0.5,
-3.815306, -0.4634378, -6.9067, 0, 1.5, 0.5, 0.5
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
-3.815306, -5.014884, 0.1619787, 0, -0.5, 0.5, 0.5,
-3.815306, -5.014884, 0.1619787, 1, -0.5, 0.5, 0.5,
-3.815306, -5.014884, 0.1619787, 1, 1.5, 0.5, 0.5,
-3.815306, -5.014884, 0.1619787, 0, 1.5, 0.5, 0.5
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
-2, -3.96455, -5.275467,
3, -3.96455, -5.275467,
-2, -3.96455, -5.275467,
-2, -4.139606, -5.547339,
-1, -3.96455, -5.275467,
-1, -4.139606, -5.547339,
0, -3.96455, -5.275467,
0, -4.139606, -5.547339,
1, -3.96455, -5.275467,
1, -4.139606, -5.547339,
2, -3.96455, -5.275467,
2, -4.139606, -5.547339,
3, -3.96455, -5.275467,
3, -4.139606, -5.547339
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
-2, -4.489717, -6.091084, 0, -0.5, 0.5, 0.5,
-2, -4.489717, -6.091084, 1, -0.5, 0.5, 0.5,
-2, -4.489717, -6.091084, 1, 1.5, 0.5, 0.5,
-2, -4.489717, -6.091084, 0, 1.5, 0.5, 0.5,
-1, -4.489717, -6.091084, 0, -0.5, 0.5, 0.5,
-1, -4.489717, -6.091084, 1, -0.5, 0.5, 0.5,
-1, -4.489717, -6.091084, 1, 1.5, 0.5, 0.5,
-1, -4.489717, -6.091084, 0, 1.5, 0.5, 0.5,
0, -4.489717, -6.091084, 0, -0.5, 0.5, 0.5,
0, -4.489717, -6.091084, 1, -0.5, 0.5, 0.5,
0, -4.489717, -6.091084, 1, 1.5, 0.5, 0.5,
0, -4.489717, -6.091084, 0, 1.5, 0.5, 0.5,
1, -4.489717, -6.091084, 0, -0.5, 0.5, 0.5,
1, -4.489717, -6.091084, 1, -0.5, 0.5, 0.5,
1, -4.489717, -6.091084, 1, 1.5, 0.5, 0.5,
1, -4.489717, -6.091084, 0, 1.5, 0.5, 0.5,
2, -4.489717, -6.091084, 0, -0.5, 0.5, 0.5,
2, -4.489717, -6.091084, 1, -0.5, 0.5, 0.5,
2, -4.489717, -6.091084, 1, 1.5, 0.5, 0.5,
2, -4.489717, -6.091084, 0, 1.5, 0.5, 0.5,
3, -4.489717, -6.091084, 0, -0.5, 0.5, 0.5,
3, -4.489717, -6.091084, 1, -0.5, 0.5, 0.5,
3, -4.489717, -6.091084, 1, 1.5, 0.5, 0.5,
3, -4.489717, -6.091084, 0, 1.5, 0.5, 0.5
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
-2.854748, -3, -5.275467,
-2.854748, 2, -5.275467,
-2.854748, -3, -5.275467,
-3.014841, -3, -5.547339,
-2.854748, -2, -5.275467,
-3.014841, -2, -5.547339,
-2.854748, -1, -5.275467,
-3.014841, -1, -5.547339,
-2.854748, 0, -5.275467,
-3.014841, 0, -5.547339,
-2.854748, 1, -5.275467,
-3.014841, 1, -5.547339,
-2.854748, 2, -5.275467,
-3.014841, 2, -5.547339
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
-3.335027, -3, -6.091084, 0, -0.5, 0.5, 0.5,
-3.335027, -3, -6.091084, 1, -0.5, 0.5, 0.5,
-3.335027, -3, -6.091084, 1, 1.5, 0.5, 0.5,
-3.335027, -3, -6.091084, 0, 1.5, 0.5, 0.5,
-3.335027, -2, -6.091084, 0, -0.5, 0.5, 0.5,
-3.335027, -2, -6.091084, 1, -0.5, 0.5, 0.5,
-3.335027, -2, -6.091084, 1, 1.5, 0.5, 0.5,
-3.335027, -2, -6.091084, 0, 1.5, 0.5, 0.5,
-3.335027, -1, -6.091084, 0, -0.5, 0.5, 0.5,
-3.335027, -1, -6.091084, 1, -0.5, 0.5, 0.5,
-3.335027, -1, -6.091084, 1, 1.5, 0.5, 0.5,
-3.335027, -1, -6.091084, 0, 1.5, 0.5, 0.5,
-3.335027, 0, -6.091084, 0, -0.5, 0.5, 0.5,
-3.335027, 0, -6.091084, 1, -0.5, 0.5, 0.5,
-3.335027, 0, -6.091084, 1, 1.5, 0.5, 0.5,
-3.335027, 0, -6.091084, 0, 1.5, 0.5, 0.5,
-3.335027, 1, -6.091084, 0, -0.5, 0.5, 0.5,
-3.335027, 1, -6.091084, 1, -0.5, 0.5, 0.5,
-3.335027, 1, -6.091084, 1, 1.5, 0.5, 0.5,
-3.335027, 1, -6.091084, 0, 1.5, 0.5, 0.5,
-3.335027, 2, -6.091084, 0, -0.5, 0.5, 0.5,
-3.335027, 2, -6.091084, 1, -0.5, 0.5, 0.5,
-3.335027, 2, -6.091084, 1, 1.5, 0.5, 0.5,
-3.335027, 2, -6.091084, 0, 1.5, 0.5, 0.5
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
-2.854748, -3.96455, -4,
-2.854748, -3.96455, 4,
-2.854748, -3.96455, -4,
-3.014841, -4.139606, -4,
-2.854748, -3.96455, -2,
-3.014841, -4.139606, -2,
-2.854748, -3.96455, 0,
-3.014841, -4.139606, 0,
-2.854748, -3.96455, 2,
-3.014841, -4.139606, 2,
-2.854748, -3.96455, 4,
-3.014841, -4.139606, 4
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
-3.335027, -4.489717, -4, 0, -0.5, 0.5, 0.5,
-3.335027, -4.489717, -4, 1, -0.5, 0.5, 0.5,
-3.335027, -4.489717, -4, 1, 1.5, 0.5, 0.5,
-3.335027, -4.489717, -4, 0, 1.5, 0.5, 0.5,
-3.335027, -4.489717, -2, 0, -0.5, 0.5, 0.5,
-3.335027, -4.489717, -2, 1, -0.5, 0.5, 0.5,
-3.335027, -4.489717, -2, 1, 1.5, 0.5, 0.5,
-3.335027, -4.489717, -2, 0, 1.5, 0.5, 0.5,
-3.335027, -4.489717, 0, 0, -0.5, 0.5, 0.5,
-3.335027, -4.489717, 0, 1, -0.5, 0.5, 0.5,
-3.335027, -4.489717, 0, 1, 1.5, 0.5, 0.5,
-3.335027, -4.489717, 0, 0, 1.5, 0.5, 0.5,
-3.335027, -4.489717, 2, 0, -0.5, 0.5, 0.5,
-3.335027, -4.489717, 2, 1, -0.5, 0.5, 0.5,
-3.335027, -4.489717, 2, 1, 1.5, 0.5, 0.5,
-3.335027, -4.489717, 2, 0, 1.5, 0.5, 0.5,
-3.335027, -4.489717, 4, 0, -0.5, 0.5, 0.5,
-3.335027, -4.489717, 4, 1, -0.5, 0.5, 0.5,
-3.335027, -4.489717, 4, 1, 1.5, 0.5, 0.5,
-3.335027, -4.489717, 4, 0, 1.5, 0.5, 0.5
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
-2.854748, -3.96455, -5.275467,
-2.854748, 3.037675, -5.275467,
-2.854748, -3.96455, 5.599424,
-2.854748, 3.037675, 5.599424,
-2.854748, -3.96455, -5.275467,
-2.854748, -3.96455, 5.599424,
-2.854748, 3.037675, -5.275467,
-2.854748, 3.037675, 5.599424,
-2.854748, -3.96455, -5.275467,
3.548972, -3.96455, -5.275467,
-2.854748, -3.96455, 5.599424,
3.548972, -3.96455, 5.599424,
-2.854748, 3.037675, -5.275467,
3.548972, 3.037675, -5.275467,
-2.854748, 3.037675, 5.599424,
3.548972, 3.037675, 5.599424,
3.548972, -3.96455, -5.275467,
3.548972, 3.037675, -5.275467,
3.548972, -3.96455, 5.599424,
3.548972, 3.037675, 5.599424,
3.548972, -3.96455, -5.275467,
3.548972, -3.96455, 5.599424,
3.548972, 3.037675, -5.275467,
3.548972, 3.037675, 5.599424
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
var radius = 7.706767;
var distance = 34.28828;
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
mvMatrix.translate( -0.3471119, 0.4634378, -0.1619787 );
mvMatrix.scale( 1.301229, 1.190009, 0.7662336 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.28828);
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
Caprylic_Acid<-read.table("Caprylic_Acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Caprylic_Acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'Caprylic_Acid' not found
```

```r
y<-Caprylic_Acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'Caprylic_Acid' not found
```

```r
z<-Caprylic_Acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'Caprylic_Acid' not found
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
-2.76149, -2.09479, -0.4266668, 0, 0, 1, 1, 1,
-2.71269, 1.144468, -0.1983504, 1, 0, 0, 1, 1,
-2.683626, 0.5722008, -2.369439, 1, 0, 0, 1, 1,
-2.640665, -2.146886, -0.9660751, 1, 0, 0, 1, 1,
-2.502838, -1.067149, -0.6643305, 1, 0, 0, 1, 1,
-2.443976, -1.765199, -0.2025791, 1, 0, 0, 1, 1,
-2.377666, 0.03923495, -1.202399, 0, 0, 0, 1, 1,
-2.27474, -1.806405, -2.436016, 0, 0, 0, 1, 1,
-2.264764, -0.6106415, -2.649506, 0, 0, 0, 1, 1,
-2.256602, 1.860582, 0.8802627, 0, 0, 0, 1, 1,
-2.1428, -0.2410219, -2.36572, 0, 0, 0, 1, 1,
-2.140443, 0.830255, 0.5589298, 0, 0, 0, 1, 1,
-2.114174, -1.250195, -1.33202, 0, 0, 0, 1, 1,
-2.107281, -1.411981, -2.500623, 1, 1, 1, 1, 1,
-2.104377, 0.1544787, -1.235939, 1, 1, 1, 1, 1,
-2.070474, 0.8652276, -0.7828454, 1, 1, 1, 1, 1,
-2.007488, 2.9357, -2.322616, 1, 1, 1, 1, 1,
-1.999063, 0.5100097, -1.048335, 1, 1, 1, 1, 1,
-1.997545, 2.335442, -0.37059, 1, 1, 1, 1, 1,
-1.978122, -0.05158711, -1.789774, 1, 1, 1, 1, 1,
-1.928702, 2.260064, -0.2288289, 1, 1, 1, 1, 1,
-1.92689, 2.031696, -0.03928383, 1, 1, 1, 1, 1,
-1.914979, 0.9296567, -4.129875, 1, 1, 1, 1, 1,
-1.90842, 1.311312, -1.841873, 1, 1, 1, 1, 1,
-1.83821, -0.7156222, -0.3308408, 1, 1, 1, 1, 1,
-1.837177, -1.160461, -2.942921, 1, 1, 1, 1, 1,
-1.830956, -0.2042368, -0.5539777, 1, 1, 1, 1, 1,
-1.823832, 0.0389762, -0.296571, 1, 1, 1, 1, 1,
-1.794816, 0.5388146, -0.6012598, 0, 0, 1, 1, 1,
-1.789729, -0.1619166, -1.450592, 1, 0, 0, 1, 1,
-1.788218, 1.03837, 0.3788819, 1, 0, 0, 1, 1,
-1.788109, -0.02695552, -2.440919, 1, 0, 0, 1, 1,
-1.781194, -0.6551175, -0.48733, 1, 0, 0, 1, 1,
-1.77466, -0.631046, -0.5316209, 1, 0, 0, 1, 1,
-1.769783, 0.3244113, -2.421558, 0, 0, 0, 1, 1,
-1.734367, -0.0280368, -2.139692, 0, 0, 0, 1, 1,
-1.714567, 0.1541499, -1.259778, 0, 0, 0, 1, 1,
-1.711846, 0.2691837, -1.409981, 0, 0, 0, 1, 1,
-1.711632, -0.02881299, -1.61454, 0, 0, 0, 1, 1,
-1.698541, -0.7445866, -2.731911, 0, 0, 0, 1, 1,
-1.691916, -0.6636651, 0.01555878, 0, 0, 0, 1, 1,
-1.688236, -1.00165, -1.697612, 1, 1, 1, 1, 1,
-1.687579, -0.7244377, -3.331629, 1, 1, 1, 1, 1,
-1.686464, -3.184805, -2.401703, 1, 1, 1, 1, 1,
-1.684399, -1.509961, -2.573621, 1, 1, 1, 1, 1,
-1.683516, 1.236345, -1.829357, 1, 1, 1, 1, 1,
-1.683357, -0.05021837, -1.925861, 1, 1, 1, 1, 1,
-1.677488, 0.60317, -0.04390734, 1, 1, 1, 1, 1,
-1.665106, -0.8018935, -2.447273, 1, 1, 1, 1, 1,
-1.655295, -1.277579, -0.9142054, 1, 1, 1, 1, 1,
-1.651553, 1.088864, -1.964513, 1, 1, 1, 1, 1,
-1.631821, 0.8657148, -1.166537, 1, 1, 1, 1, 1,
-1.623453, -0.08416617, -2.2638, 1, 1, 1, 1, 1,
-1.609358, -1.058785, -2.345329, 1, 1, 1, 1, 1,
-1.605929, -0.7573101, -2.509205, 1, 1, 1, 1, 1,
-1.603678, -0.2318598, -1.829508, 1, 1, 1, 1, 1,
-1.591887, 0.8472897, -3.128171, 0, 0, 1, 1, 1,
-1.571458, 2.245991, 0.2858481, 1, 0, 0, 1, 1,
-1.563635, 0.03630858, -1.610787, 1, 0, 0, 1, 1,
-1.561671, 1.206745, -0.4995894, 1, 0, 0, 1, 1,
-1.550165, 0.4627564, -0.06766267, 1, 0, 0, 1, 1,
-1.544398, 0.8208488, 1.470157, 1, 0, 0, 1, 1,
-1.538261, 1.285273, -0.04519128, 0, 0, 0, 1, 1,
-1.536084, 0.4442304, -0.9518232, 0, 0, 0, 1, 1,
-1.526577, -1.668627, -3.024835, 0, 0, 0, 1, 1,
-1.513934, -0.6331854, -1.644382, 0, 0, 0, 1, 1,
-1.511792, 0.6237226, -1.473642, 0, 0, 0, 1, 1,
-1.505276, 0.1130565, -1.58176, 0, 0, 0, 1, 1,
-1.504908, -2.046514, -3.501461, 0, 0, 0, 1, 1,
-1.501518, -1.801289, -2.9187, 1, 1, 1, 1, 1,
-1.491775, -0.213021, -1.511098, 1, 1, 1, 1, 1,
-1.490816, -0.976989, -2.670169, 1, 1, 1, 1, 1,
-1.486976, 0.4980096, -1.134994, 1, 1, 1, 1, 1,
-1.461637, 1.142924, -0.8814884, 1, 1, 1, 1, 1,
-1.458706, 0.6767986, -0.91425, 1, 1, 1, 1, 1,
-1.449416, -1.084974, -2.707352, 1, 1, 1, 1, 1,
-1.44741, -0.621989, -3.979356, 1, 1, 1, 1, 1,
-1.428536, 1.02385, -1.408218, 1, 1, 1, 1, 1,
-1.425686, 0.7662908, -1.971682, 1, 1, 1, 1, 1,
-1.421975, -0.3255174, -0.8945253, 1, 1, 1, 1, 1,
-1.415309, -1.452902, -3.997013, 1, 1, 1, 1, 1,
-1.415138, -1.554088, -2.12191, 1, 1, 1, 1, 1,
-1.398842, 1.172562, -2.166152, 1, 1, 1, 1, 1,
-1.397491, 0.8795942, -1.308669, 1, 1, 1, 1, 1,
-1.353084, 0.3303922, -2.096175, 0, 0, 1, 1, 1,
-1.351447, 0.7892556, -0.9123862, 1, 0, 0, 1, 1,
-1.345672, 1.125311, -0.9469504, 1, 0, 0, 1, 1,
-1.331015, 0.5357455, -1.483924, 1, 0, 0, 1, 1,
-1.322316, 2.106447, -0.9007275, 1, 0, 0, 1, 1,
-1.31722, -0.9267541, -1.563681, 1, 0, 0, 1, 1,
-1.299277, 2.422297, -1.588184, 0, 0, 0, 1, 1,
-1.29313, 0.1393521, -0.2469335, 0, 0, 0, 1, 1,
-1.284149, 0.6296129, -2.462932, 0, 0, 0, 1, 1,
-1.282962, 0.4177907, -1.493322, 0, 0, 0, 1, 1,
-1.282485, -0.7272704, -1.496034, 0, 0, 0, 1, 1,
-1.281927, -0.5029515, -2.648787, 0, 0, 0, 1, 1,
-1.277918, -0.07463009, -1.514623, 0, 0, 0, 1, 1,
-1.270504, -0.221747, -2.446636, 1, 1, 1, 1, 1,
-1.263959, -2.265815, -2.52044, 1, 1, 1, 1, 1,
-1.26302, 0.413257, 0.2038565, 1, 1, 1, 1, 1,
-1.261728, 0.9450383, -0.1517751, 1, 1, 1, 1, 1,
-1.261021, -1.049988, -3.252613, 1, 1, 1, 1, 1,
-1.257214, -1.595781, -1.157553, 1, 1, 1, 1, 1,
-1.251167, 1.071331, -1.821295, 1, 1, 1, 1, 1,
-1.249437, 0.4027383, -0.8037923, 1, 1, 1, 1, 1,
-1.247847, -0.08018372, -0.8801296, 1, 1, 1, 1, 1,
-1.245597, 1.408562, -1.076478, 1, 1, 1, 1, 1,
-1.244793, -0.3797562, -2.963978, 1, 1, 1, 1, 1,
-1.242901, 0.3786457, -1.675186, 1, 1, 1, 1, 1,
-1.240904, 1.462544, -1.292572, 1, 1, 1, 1, 1,
-1.234606, 0.4700954, -0.7884832, 1, 1, 1, 1, 1,
-1.231171, -0.2149134, -0.4059708, 1, 1, 1, 1, 1,
-1.224846, 0.1492231, -1.969431, 0, 0, 1, 1, 1,
-1.211673, -0.759444, -1.22818, 1, 0, 0, 1, 1,
-1.20921, 1.228687, 1.111153, 1, 0, 0, 1, 1,
-1.206792, 0.04639728, -0.8623278, 1, 0, 0, 1, 1,
-1.186198, -0.3971091, -1.615622, 1, 0, 0, 1, 1,
-1.179133, -0.4791725, -3.00116, 1, 0, 0, 1, 1,
-1.177533, 0.3153307, -1.819276, 0, 0, 0, 1, 1,
-1.174543, -1.094168, -2.477943, 0, 0, 0, 1, 1,
-1.173715, 0.4924491, -1.901418, 0, 0, 0, 1, 1,
-1.169602, 0.5654069, -0.5660443, 0, 0, 0, 1, 1,
-1.168294, 0.2590652, -1.100062, 0, 0, 0, 1, 1,
-1.155263, -0.2049161, -1.226145, 0, 0, 0, 1, 1,
-1.147959, -0.4932634, -1.035816, 0, 0, 0, 1, 1,
-1.146086, 0.3669865, -2.326299, 1, 1, 1, 1, 1,
-1.145245, 0.3136479, -1.267073, 1, 1, 1, 1, 1,
-1.140353, 1.236527, -1.356778, 1, 1, 1, 1, 1,
-1.137871, -0.5386009, -1.064428, 1, 1, 1, 1, 1,
-1.131966, 0.5346023, -1.861929, 1, 1, 1, 1, 1,
-1.130263, 1.829387, -0.6935937, 1, 1, 1, 1, 1,
-1.129308, 0.002343368, -1.628881, 1, 1, 1, 1, 1,
-1.126818, -0.07246906, -3.763534, 1, 1, 1, 1, 1,
-1.12355, -0.2849701, -1.621408, 1, 1, 1, 1, 1,
-1.110496, 0.5175893, 0.7077971, 1, 1, 1, 1, 1,
-1.10938, 2.225083, -0.419362, 1, 1, 1, 1, 1,
-1.101982, -0.6624045, -3.472881, 1, 1, 1, 1, 1,
-1.093284, 1.112988, -1.350576, 1, 1, 1, 1, 1,
-1.088499, 0.4509535, -1.737192, 1, 1, 1, 1, 1,
-1.086256, -1.667585, -2.663181, 1, 1, 1, 1, 1,
-1.053708, 2.377503, -0.3151213, 0, 0, 1, 1, 1,
-1.052783, 0.8602689, 0.0106278, 1, 0, 0, 1, 1,
-1.037313, -0.7504221, -2.516748, 1, 0, 0, 1, 1,
-1.03361, -0.4469695, -2.329316, 1, 0, 0, 1, 1,
-1.030354, -0.6915835, -2.772545, 1, 0, 0, 1, 1,
-1.029861, 1.781731, 0.7303408, 1, 0, 0, 1, 1,
-1.027333, 1.45795, 0.190661, 0, 0, 0, 1, 1,
-1.020158, 0.610931, 0.5244021, 0, 0, 0, 1, 1,
-1.019971, -1.790997, -4.91226, 0, 0, 0, 1, 1,
-1.012871, -0.4447588, -2.278814, 0, 0, 0, 1, 1,
-1.008898, 0.8328511, -0.02610814, 0, 0, 0, 1, 1,
-1.00786, 1.129719, -0.07570443, 0, 0, 0, 1, 1,
-1.007205, 0.5682568, -1.560772, 0, 0, 0, 1, 1,
-1.006354, 1.174696, 0.4863028, 1, 1, 1, 1, 1,
-1.003506, -1.332685, -1.34295, 1, 1, 1, 1, 1,
-1.002773, 0.3031935, -2.131342, 1, 1, 1, 1, 1,
-1.002308, 2.668673, -1.377582, 1, 1, 1, 1, 1,
-0.9917141, -1.145794, -3.412442, 1, 1, 1, 1, 1,
-0.990199, 0.4284297, 0.3530644, 1, 1, 1, 1, 1,
-0.9884925, -2.160033, -3.256299, 1, 1, 1, 1, 1,
-0.9878967, 1.122902, 1.57129, 1, 1, 1, 1, 1,
-0.9817369, -0.09647955, -3.073889, 1, 1, 1, 1, 1,
-0.9719223, 0.5339112, -2.467076, 1, 1, 1, 1, 1,
-0.9699384, -0.1962669, -2.111233, 1, 1, 1, 1, 1,
-0.9661975, -0.1952447, -3.008425, 1, 1, 1, 1, 1,
-0.9540848, -0.1071053, -2.43127, 1, 1, 1, 1, 1,
-0.9530365, -0.1268639, -1.154548, 1, 1, 1, 1, 1,
-0.9496928, 2.026812, -0.4947321, 1, 1, 1, 1, 1,
-0.9496033, -1.381424, -1.923536, 0, 0, 1, 1, 1,
-0.9483212, 0.520391, -1.71152, 1, 0, 0, 1, 1,
-0.9478051, 0.6702054, -0.8814191, 1, 0, 0, 1, 1,
-0.9475606, 0.1309829, -3.311492, 1, 0, 0, 1, 1,
-0.9442825, 1.36877, -0.703446, 1, 0, 0, 1, 1,
-0.9434615, -0.01545833, -2.605919, 1, 0, 0, 1, 1,
-0.9398842, 1.290128, 0.7549474, 0, 0, 0, 1, 1,
-0.9355026, 1.323932, 0.6871815, 0, 0, 0, 1, 1,
-0.9320428, -0.04686934, -2.284718, 0, 0, 0, 1, 1,
-0.9240677, -1.208676, -1.759933, 0, 0, 0, 1, 1,
-0.9140242, -0.8534119, -2.032908, 0, 0, 0, 1, 1,
-0.9134325, -0.4133756, -3.44565, 0, 0, 0, 1, 1,
-0.9095087, 0.5015116, -0.5222245, 0, 0, 0, 1, 1,
-0.9038849, 0.9392392, 1.254983, 1, 1, 1, 1, 1,
-0.9035761, -0.3533268, -2.401844, 1, 1, 1, 1, 1,
-0.8970764, 1.905462, -1.762712, 1, 1, 1, 1, 1,
-0.8923846, -0.1446373, -0.531601, 1, 1, 1, 1, 1,
-0.8888524, -1.477587, -3.122569, 1, 1, 1, 1, 1,
-0.8819849, 0.9814636, -0.8131164, 1, 1, 1, 1, 1,
-0.8796409, 1.002174, -1.473402, 1, 1, 1, 1, 1,
-0.8647068, 2.183528, -1.193924, 1, 1, 1, 1, 1,
-0.8637853, -1.097546, -1.820085, 1, 1, 1, 1, 1,
-0.8582108, 0.3986326, -1.872394, 1, 1, 1, 1, 1,
-0.8558993, 0.6132568, 0.1376959, 1, 1, 1, 1, 1,
-0.8534155, 0.3999927, -0.1663928, 1, 1, 1, 1, 1,
-0.8525858, 0.3603418, -2.560129, 1, 1, 1, 1, 1,
-0.8487451, 0.4192163, -1.728731, 1, 1, 1, 1, 1,
-0.8476675, 0.8768274, -0.7252531, 1, 1, 1, 1, 1,
-0.8467419, -0.5406485, -0.2765938, 0, 0, 1, 1, 1,
-0.8458405, -1.799308, -2.672415, 1, 0, 0, 1, 1,
-0.844362, -0.3124254, -1.260043, 1, 0, 0, 1, 1,
-0.8439131, 2.319873, -1.311765, 1, 0, 0, 1, 1,
-0.8420867, -0.3085766, -1.824697, 1, 0, 0, 1, 1,
-0.8411192, -0.4666993, -2.662927, 1, 0, 0, 1, 1,
-0.839514, -0.08864328, -1.557749, 0, 0, 0, 1, 1,
-0.8374093, 1.526904, -0.5907586, 0, 0, 0, 1, 1,
-0.8337066, -0.3156247, -1.665142, 0, 0, 0, 1, 1,
-0.8304642, 1.358213, -0.7740934, 0, 0, 0, 1, 1,
-0.8299381, -1.969929, -3.86513, 0, 0, 0, 1, 1,
-0.819068, -0.3537785, -1.127781, 0, 0, 0, 1, 1,
-0.818006, -0.215755, -1.633701, 0, 0, 0, 1, 1,
-0.816599, 1.996331, -0.6745009, 1, 1, 1, 1, 1,
-0.8129547, 0.5343225, -1.322837, 1, 1, 1, 1, 1,
-0.809311, 0.8768222, -1.093125, 1, 1, 1, 1, 1,
-0.8085674, -1.419729, -3.319443, 1, 1, 1, 1, 1,
-0.798699, 0.6020136, 0.4811608, 1, 1, 1, 1, 1,
-0.7924331, -0.0159726, -2.706068, 1, 1, 1, 1, 1,
-0.7886233, 0.4364417, -0.3321024, 1, 1, 1, 1, 1,
-0.7838335, -0.8692796, -3.046031, 1, 1, 1, 1, 1,
-0.783544, -0.1044597, -0.2005489, 1, 1, 1, 1, 1,
-0.7825339, 0.06066921, -1.323733, 1, 1, 1, 1, 1,
-0.7806612, 1.261338, -0.6263718, 1, 1, 1, 1, 1,
-0.7805879, 2.222058, -0.9862182, 1, 1, 1, 1, 1,
-0.7792946, 0.2886496, -1.3038, 1, 1, 1, 1, 1,
-0.7768767, -0.4097122, -2.871908, 1, 1, 1, 1, 1,
-0.7669532, 0.798116, -0.2735182, 1, 1, 1, 1, 1,
-0.7652383, -0.7184775, -1.421471, 0, 0, 1, 1, 1,
-0.7636802, 1.000979, -0.7237155, 1, 0, 0, 1, 1,
-0.7556419, -0.1512649, -2.509334, 1, 0, 0, 1, 1,
-0.7523251, -0.5498018, -2.239519, 1, 0, 0, 1, 1,
-0.7463911, 1.105399, -0.6518842, 1, 0, 0, 1, 1,
-0.7408031, -0.4328907, -2.825027, 1, 0, 0, 1, 1,
-0.7402725, -1.273924, -1.18763, 0, 0, 0, 1, 1,
-0.7396087, -0.3641475, -2.165597, 0, 0, 0, 1, 1,
-0.7367521, 0.005283512, -1.255533, 0, 0, 0, 1, 1,
-0.7296322, -0.3665548, -2.675086, 0, 0, 0, 1, 1,
-0.7295295, -0.5311352, -2.620073, 0, 0, 0, 1, 1,
-0.7256234, -0.9872504, -1.282449, 0, 0, 0, 1, 1,
-0.7215583, -1.530117, -4.048703, 0, 0, 0, 1, 1,
-0.7201746, 0.8639859, -1.251127, 1, 1, 1, 1, 1,
-0.7195893, 0.2962548, -1.146809, 1, 1, 1, 1, 1,
-0.7174525, 0.8910663, -0.1400543, 1, 1, 1, 1, 1,
-0.7161849, -0.7031916, -1.910821, 1, 1, 1, 1, 1,
-0.7124106, -0.9190608, -1.646083, 1, 1, 1, 1, 1,
-0.7095842, -1.645145, -3.6044, 1, 1, 1, 1, 1,
-0.6967235, -0.993803, -0.8272346, 1, 1, 1, 1, 1,
-0.6959907, 0.735502, -1.026716, 1, 1, 1, 1, 1,
-0.6928091, -0.2077851, -1.944121, 1, 1, 1, 1, 1,
-0.683985, -1.421621, -2.314196, 1, 1, 1, 1, 1,
-0.6802461, 1.353311, -1.45533, 1, 1, 1, 1, 1,
-0.6756889, -1.262075, -2.7945, 1, 1, 1, 1, 1,
-0.6739994, 0.1497751, -1.059062, 1, 1, 1, 1, 1,
-0.6698096, -1.369843, -3.410221, 1, 1, 1, 1, 1,
-0.6651334, 1.458242, -1.268624, 1, 1, 1, 1, 1,
-0.6599505, 1.01083, -0.1416715, 0, 0, 1, 1, 1,
-0.6573132, 0.2043473, 0.4059178, 1, 0, 0, 1, 1,
-0.6565746, 0.4722573, -1.876343, 1, 0, 0, 1, 1,
-0.6542615, 0.02283779, -0.3752022, 1, 0, 0, 1, 1,
-0.6464291, -0.6192501, -2.373938, 1, 0, 0, 1, 1,
-0.6455562, 0.4640884, -2.633042, 1, 0, 0, 1, 1,
-0.6399539, 0.7615114, -0.2408913, 0, 0, 0, 1, 1,
-0.6299886, -0.8456147, -4.192515, 0, 0, 0, 1, 1,
-0.6272839, 0.1521751, 0.8461607, 0, 0, 0, 1, 1,
-0.6257443, 1.375368, -1.991996, 0, 0, 0, 1, 1,
-0.6178393, -0.05165076, -3.197098, 0, 0, 0, 1, 1,
-0.615224, -1.084749, -2.158967, 0, 0, 0, 1, 1,
-0.613221, -0.3944211, -1.340773, 0, 0, 0, 1, 1,
-0.6114627, -0.2973259, -1.651948, 1, 1, 1, 1, 1,
-0.6114543, 0.337828, -0.4670061, 1, 1, 1, 1, 1,
-0.5993111, 0.3823621, -1.448239, 1, 1, 1, 1, 1,
-0.5919871, 0.3653014, -0.5052078, 1, 1, 1, 1, 1,
-0.5809425, -0.5616523, -2.387509, 1, 1, 1, 1, 1,
-0.5805711, -2.263973, -2.946117, 1, 1, 1, 1, 1,
-0.579616, -0.09746375, -4.066292, 1, 1, 1, 1, 1,
-0.5781143, -0.0854924, -0.6646628, 1, 1, 1, 1, 1,
-0.57732, -1.895806, -3.358269, 1, 1, 1, 1, 1,
-0.5744305, -0.9453152, -3.008384, 1, 1, 1, 1, 1,
-0.5737764, -0.001197352, -1.987702, 1, 1, 1, 1, 1,
-0.5673403, 0.0582274, -1.681309, 1, 1, 1, 1, 1,
-0.5646844, 1.23424, -1.593753, 1, 1, 1, 1, 1,
-0.5631515, -0.1914648, -3.387848, 1, 1, 1, 1, 1,
-0.5627101, -0.2635576, -0.3587753, 1, 1, 1, 1, 1,
-0.5606412, 0.1814145, -0.994915, 0, 0, 1, 1, 1,
-0.5559546, 0.07188758, 0.980186, 1, 0, 0, 1, 1,
-0.555603, 0.003227005, 0.08568968, 1, 0, 0, 1, 1,
-0.555429, -3.017694, -3.276793, 1, 0, 0, 1, 1,
-0.5539941, -1.915246, -0.2219636, 1, 0, 0, 1, 1,
-0.5539389, -0.3135304, -0.308021, 1, 0, 0, 1, 1,
-0.553903, 2.46286, 0.7759754, 0, 0, 0, 1, 1,
-0.5538836, 1.609901, -1.699375, 0, 0, 0, 1, 1,
-0.5502432, -1.686836, -1.299039, 0, 0, 0, 1, 1,
-0.5484074, 0.01900585, -1.284982, 0, 0, 0, 1, 1,
-0.5414394, -0.9437116, -2.451607, 0, 0, 0, 1, 1,
-0.5374721, 0.5310251, -0.3927291, 0, 0, 0, 1, 1,
-0.5263107, -1.414287, -3.148367, 0, 0, 0, 1, 1,
-0.5261608, -0.8356735, -1.512658, 1, 1, 1, 1, 1,
-0.5229996, 0.2822637, -3.382212, 1, 1, 1, 1, 1,
-0.5137051, 0.2767801, -3.739554, 1, 1, 1, 1, 1,
-0.5117056, -0.1767018, -1.73293, 1, 1, 1, 1, 1,
-0.510758, 0.3418438, -1.32128, 1, 1, 1, 1, 1,
-0.5073928, 1.640328, 1.189584, 1, 1, 1, 1, 1,
-0.5057229, -0.6606814, -3.252505, 1, 1, 1, 1, 1,
-0.5049747, 2.19606, -1.011427, 1, 1, 1, 1, 1,
-0.5034612, 0.5573637, 0.7241977, 1, 1, 1, 1, 1,
-0.5001517, 0.739127, -2.075371, 1, 1, 1, 1, 1,
-0.5001031, -0.5704625, -1.762837, 1, 1, 1, 1, 1,
-0.4977616, -1.219939, -3.432726, 1, 1, 1, 1, 1,
-0.496743, -2.407969, -3.963786, 1, 1, 1, 1, 1,
-0.4954242, -0.8469878, -0.3092536, 1, 1, 1, 1, 1,
-0.4923218, 1.675403, -0.4403581, 1, 1, 1, 1, 1,
-0.4922603, -0.360713, -2.341285, 0, 0, 1, 1, 1,
-0.488065, 2.345679, -1.05254, 1, 0, 0, 1, 1,
-0.4825907, -1.030966, -2.193048, 1, 0, 0, 1, 1,
-0.4684916, 0.3670547, 0.6669477, 1, 0, 0, 1, 1,
-0.4676975, 0.6269622, -1.120087, 1, 0, 0, 1, 1,
-0.4672615, -0.7946383, -1.601885, 1, 0, 0, 1, 1,
-0.4665357, -1.065216, -1.650977, 0, 0, 0, 1, 1,
-0.4642435, 0.1697101, -3.451593, 0, 0, 0, 1, 1,
-0.4557668, -0.8219471, -3.15759, 0, 0, 0, 1, 1,
-0.4451023, -1.62847, -1.419183, 0, 0, 0, 1, 1,
-0.4448417, 0.4813185, -1.226401, 0, 0, 0, 1, 1,
-0.4431121, 0.7756085, -1.130196, 0, 0, 0, 1, 1,
-0.4416834, 0.62371, -0.4309627, 0, 0, 0, 1, 1,
-0.4405333, -0.7524443, -2.640174, 1, 1, 1, 1, 1,
-0.4397174, 0.3598602, -2.466303, 1, 1, 1, 1, 1,
-0.4370686, 0.6871658, -0.9936653, 1, 1, 1, 1, 1,
-0.4350315, 1.364421, 0.3417219, 1, 1, 1, 1, 1,
-0.4340937, -1.06823, -2.425921, 1, 1, 1, 1, 1,
-0.4328219, -0.1563942, -2.541796, 1, 1, 1, 1, 1,
-0.4323487, 0.2488849, 1.066265, 1, 1, 1, 1, 1,
-0.4305609, -1.926215, -2.325002, 1, 1, 1, 1, 1,
-0.4264529, -0.1933222, -1.780753, 1, 1, 1, 1, 1,
-0.4214532, 1.47382, -1.134932, 1, 1, 1, 1, 1,
-0.4213041, 1.300584, -1.489217, 1, 1, 1, 1, 1,
-0.4201396, 0.3909313, -0.2682862, 1, 1, 1, 1, 1,
-0.4117599, 1.986273, -0.2265869, 1, 1, 1, 1, 1,
-0.4109253, 0.9654521, -2.286269, 1, 1, 1, 1, 1,
-0.407097, 1.555391, -0.07098941, 1, 1, 1, 1, 1,
-0.4049662, 1.092128, -1.228207, 0, 0, 1, 1, 1,
-0.4043873, -0.3728158, -2.935112, 1, 0, 0, 1, 1,
-0.4039016, 0.6582346, -0.2466243, 1, 0, 0, 1, 1,
-0.4015435, -1.667279, -0.478759, 1, 0, 0, 1, 1,
-0.3995386, 2.270618, -0.3536622, 1, 0, 0, 1, 1,
-0.3894007, -0.3511043, -4.147185, 1, 0, 0, 1, 1,
-0.3853834, -0.4544654, -1.537542, 0, 0, 0, 1, 1,
-0.3763797, 0.4019858, 0.1818137, 0, 0, 0, 1, 1,
-0.3687389, -1.029135, -5.117095, 0, 0, 0, 1, 1,
-0.3677855, -0.5362353, -2.655333, 0, 0, 0, 1, 1,
-0.3676249, 0.009644949, -1.106446, 0, 0, 0, 1, 1,
-0.3643847, 1.817281, -0.036326, 0, 0, 0, 1, 1,
-0.3611564, 0.683117, -1.280099, 0, 0, 0, 1, 1,
-0.3588411, 1.38816, -1.327758, 1, 1, 1, 1, 1,
-0.355155, 1.805638, -0.9749998, 1, 1, 1, 1, 1,
-0.3546361, -0.2779769, -0.8035751, 1, 1, 1, 1, 1,
-0.3533157, -0.2677246, -0.8506591, 1, 1, 1, 1, 1,
-0.3490382, -0.5214422, -2.703676, 1, 1, 1, 1, 1,
-0.3473246, 0.7657892, -1.314532, 1, 1, 1, 1, 1,
-0.3468636, 0.5554982, 0.07315945, 1, 1, 1, 1, 1,
-0.3449124, -1.047817, -3.39468, 1, 1, 1, 1, 1,
-0.3410857, -0.06694155, -2.193147, 1, 1, 1, 1, 1,
-0.3396043, -0.5110277, -1.017054, 1, 1, 1, 1, 1,
-0.3335706, 0.8978873, -1.721049, 1, 1, 1, 1, 1,
-0.3264256, -1.198889, -3.423757, 1, 1, 1, 1, 1,
-0.3261193, -1.693429, -4.349304, 1, 1, 1, 1, 1,
-0.3207353, 0.476884, -1.11903, 1, 1, 1, 1, 1,
-0.307654, -1.447803, -3.424506, 1, 1, 1, 1, 1,
-0.3056578, -0.2946445, -3.165638, 0, 0, 1, 1, 1,
-0.3035752, -0.9320607, -2.596126, 1, 0, 0, 1, 1,
-0.3028632, -1.717996, -1.787933, 1, 0, 0, 1, 1,
-0.3024194, -0.09225697, -0.510699, 1, 0, 0, 1, 1,
-0.3000843, -0.7198432, -2.092837, 1, 0, 0, 1, 1,
-0.2987552, 1.594427, -0.7458155, 1, 0, 0, 1, 1,
-0.2982001, -0.6118501, -2.458731, 0, 0, 0, 1, 1,
-0.2980171, 0.9426447, 0.09932046, 0, 0, 0, 1, 1,
-0.297721, 1.972843, 0.6516164, 0, 0, 0, 1, 1,
-0.2937936, -1.432513, -2.927707, 0, 0, 0, 1, 1,
-0.2930011, 0.3115019, 0.6925834, 0, 0, 0, 1, 1,
-0.288402, 0.1182193, -1.168525, 0, 0, 0, 1, 1,
-0.2842374, 0.01595859, -2.477554, 0, 0, 0, 1, 1,
-0.28196, -0.8273271, -4.101486, 1, 1, 1, 1, 1,
-0.2743428, 0.4354927, -1.674084, 1, 1, 1, 1, 1,
-0.2729568, 0.3341712, -1.415614, 1, 1, 1, 1, 1,
-0.2729215, -0.6418784, -1.997071, 1, 1, 1, 1, 1,
-0.2704257, 0.9439954, 0.3359393, 1, 1, 1, 1, 1,
-0.2676544, 0.7617519, 0.04028268, 1, 1, 1, 1, 1,
-0.2675591, -0.8217264, -2.29972, 1, 1, 1, 1, 1,
-0.2651728, -0.04378157, -0.9581245, 1, 1, 1, 1, 1,
-0.2622853, 0.1976869, -1.032474, 1, 1, 1, 1, 1,
-0.2602919, -1.235808, -4.779358, 1, 1, 1, 1, 1,
-0.2571746, 1.821728, 0.6890115, 1, 1, 1, 1, 1,
-0.2546495, -1.448912, -2.335036, 1, 1, 1, 1, 1,
-0.2537137, 0.5654089, -2.040811, 1, 1, 1, 1, 1,
-0.251348, 1.122441, 2.892457, 1, 1, 1, 1, 1,
-0.2471744, 0.8429779, -1.263343, 1, 1, 1, 1, 1,
-0.2464111, -0.7254136, -4.42275, 0, 0, 1, 1, 1,
-0.2431438, 1.038919, 0.06319527, 1, 0, 0, 1, 1,
-0.2403379, 0.1458942, 0.1377435, 1, 0, 0, 1, 1,
-0.2366355, -0.7898952, -3.709675, 1, 0, 0, 1, 1,
-0.2354776, 0.7058803, -0.676906, 1, 0, 0, 1, 1,
-0.2354128, 0.607264, 0.03785462, 1, 0, 0, 1, 1,
-0.2337126, 1.23586, -0.5785061, 0, 0, 0, 1, 1,
-0.2304722, 1.579728, -0.9378808, 0, 0, 0, 1, 1,
-0.2299878, -0.6465228, -2.792209, 0, 0, 0, 1, 1,
-0.2279835, 1.953682, -0.338003, 0, 0, 0, 1, 1,
-0.225646, 0.7092033, 0.8783426, 0, 0, 0, 1, 1,
-0.2218244, 0.4507349, 0.04142622, 0, 0, 0, 1, 1,
-0.2214886, -0.1530538, -1.491647, 0, 0, 0, 1, 1,
-0.2194941, -0.1765799, -0.9960461, 1, 1, 1, 1, 1,
-0.2169521, 1.212568, 1.264798, 1, 1, 1, 1, 1,
-0.2154834, 0.8058701, -0.8206035, 1, 1, 1, 1, 1,
-0.2126457, 0.2217788, -1.76427, 1, 1, 1, 1, 1,
-0.2105934, 0.4977956, -0.4049436, 1, 1, 1, 1, 1,
-0.2088647, -0.01570284, -1.756278, 1, 1, 1, 1, 1,
-0.2082317, 0.08877891, -2.629215, 1, 1, 1, 1, 1,
-0.2073972, 2.234799, -1.133782, 1, 1, 1, 1, 1,
-0.2072439, -0.8225143, -3.357496, 1, 1, 1, 1, 1,
-0.2042901, -0.4149819, -3.30879, 1, 1, 1, 1, 1,
-0.2029821, -1.510468, -2.291189, 1, 1, 1, 1, 1,
-0.2023814, 0.5217465, -0.5950055, 1, 1, 1, 1, 1,
-0.202176, -1.548936, -4.03999, 1, 1, 1, 1, 1,
-0.1971194, 0.1048989, -0.3613025, 1, 1, 1, 1, 1,
-0.1944722, 1.636088, -0.659174, 1, 1, 1, 1, 1,
-0.1900624, -1.563195, -4.559189, 0, 0, 1, 1, 1,
-0.1858263, -0.4384751, -2.234819, 1, 0, 0, 1, 1,
-0.1853335, 0.1272286, -1.23143, 1, 0, 0, 1, 1,
-0.1815593, -0.2497719, -1.657843, 1, 0, 0, 1, 1,
-0.1803758, 0.6015443, -1.680202, 1, 0, 0, 1, 1,
-0.1795455, 0.6725248, 0.8207744, 1, 0, 0, 1, 1,
-0.1766252, 1.773592, 0.6394502, 0, 0, 0, 1, 1,
-0.1727372, -0.3368614, -2.301749, 0, 0, 0, 1, 1,
-0.1713201, 1.359952, -0.3154161, 0, 0, 0, 1, 1,
-0.1712898, -2.311274, -3.623966, 0, 0, 0, 1, 1,
-0.1705443, 0.01756393, -2.285211, 0, 0, 0, 1, 1,
-0.1704876, -1.25213, -4.617027, 0, 0, 0, 1, 1,
-0.1664182, -0.2066182, -2.348034, 0, 0, 0, 1, 1,
-0.1656644, 0.9165762, 0.7669512, 1, 1, 1, 1, 1,
-0.1648371, 0.4910814, 0.1136059, 1, 1, 1, 1, 1,
-0.1599572, 1.24813, 1.195616, 1, 1, 1, 1, 1,
-0.1582199, 1.354754, -0.5435244, 1, 1, 1, 1, 1,
-0.1554749, 0.9266235, -0.2621471, 1, 1, 1, 1, 1,
-0.150049, 0.4072749, -0.7736219, 1, 1, 1, 1, 1,
-0.1499229, -0.336338, -4.109655, 1, 1, 1, 1, 1,
-0.1488451, 0.4218526, -1.029673, 1, 1, 1, 1, 1,
-0.1483435, 0.3036962, 0.5137714, 1, 1, 1, 1, 1,
-0.148108, -0.1109557, -1.588222, 1, 1, 1, 1, 1,
-0.147112, 0.06390093, -2.450394, 1, 1, 1, 1, 1,
-0.1467345, -0.1268267, -2.157292, 1, 1, 1, 1, 1,
-0.1464503, 0.7261696, -0.2296932, 1, 1, 1, 1, 1,
-0.1411826, -0.4693303, -4.53451, 1, 1, 1, 1, 1,
-0.1379434, -2.349123, -2.361387, 1, 1, 1, 1, 1,
-0.1343286, 0.3877083, -0.4415148, 0, 0, 1, 1, 1,
-0.1294657, -0.3044657, -3.792318, 1, 0, 0, 1, 1,
-0.1280628, 1.535529, -1.08975, 1, 0, 0, 1, 1,
-0.1268906, -0.218401, -2.331015, 1, 0, 0, 1, 1,
-0.1266513, -0.01408158, -2.258316, 1, 0, 0, 1, 1,
-0.1251092, -0.6059367, -3.047829, 1, 0, 0, 1, 1,
-0.1238646, -0.9276426, -3.383777, 0, 0, 0, 1, 1,
-0.1234875, -1.689882, -1.997665, 0, 0, 0, 1, 1,
-0.1169555, -0.4335485, -3.414414, 0, 0, 0, 1, 1,
-0.1164381, 0.3935391, 0.8025722, 0, 0, 0, 1, 1,
-0.1102557, 0.3408867, 0.2565227, 0, 0, 0, 1, 1,
-0.1089434, 0.326696, -0.1582031, 0, 0, 0, 1, 1,
-0.1024052, -0.06349626, -2.190823, 0, 0, 0, 1, 1,
-0.1011574, -1.824969, -3.473824, 1, 1, 1, 1, 1,
-0.09383687, 1.542537, -0.8668399, 1, 1, 1, 1, 1,
-0.09192522, -2.266387, -1.751682, 1, 1, 1, 1, 1,
-0.09111832, -1.828565, -3.040668, 1, 1, 1, 1, 1,
-0.0900505, 1.216843, -0.430808, 1, 1, 1, 1, 1,
-0.08825508, -0.3758469, -2.407251, 1, 1, 1, 1, 1,
-0.08802728, -0.01035023, -2.924418, 1, 1, 1, 1, 1,
-0.08535706, -0.7606069, -3.355688, 1, 1, 1, 1, 1,
-0.08303764, 0.2828548, -0.6629353, 1, 1, 1, 1, 1,
-0.08242648, -0.7734643, -2.863276, 1, 1, 1, 1, 1,
-0.0822094, -1.545208, -3.520702, 1, 1, 1, 1, 1,
-0.08075059, 0.9881096, 0.6562836, 1, 1, 1, 1, 1,
-0.07840537, -1.635288, -4.406588, 1, 1, 1, 1, 1,
-0.07688283, -1.105586, -2.654309, 1, 1, 1, 1, 1,
-0.07550714, -1.851751, -3.375978, 1, 1, 1, 1, 1,
-0.06848008, -1.16969, -2.063891, 0, 0, 1, 1, 1,
-0.06820627, -0.2241876, -4.521478, 1, 0, 0, 1, 1,
-0.06630193, -1.00416, -3.611706, 1, 0, 0, 1, 1,
-0.06481669, 0.6881754, -0.6574328, 1, 0, 0, 1, 1,
-0.06410761, 2.527949, -0.3208144, 1, 0, 0, 1, 1,
-0.06393835, -1.49698, -2.586517, 1, 0, 0, 1, 1,
-0.05443074, -0.2145984, -2.373271, 0, 0, 0, 1, 1,
-0.05024137, 1.623523, 0.1447759, 0, 0, 0, 1, 1,
-0.04729242, 0.4567544, -0.4648839, 0, 0, 0, 1, 1,
-0.04083874, 0.3578407, -1.719573, 0, 0, 0, 1, 1,
-0.03954884, 1.718954, -0.5025885, 0, 0, 0, 1, 1,
-0.03940239, 0.3505756, -0.1594283, 0, 0, 0, 1, 1,
-0.03889803, 0.2819484, 1.048861, 0, 0, 0, 1, 1,
-0.0383589, 0.7147599, 0.2541822, 1, 1, 1, 1, 1,
-0.03404032, 0.7314735, -0.8090245, 1, 1, 1, 1, 1,
-0.03384531, -2.751072, -2.478565, 1, 1, 1, 1, 1,
-0.03196698, -1.234202, -4.559404, 1, 1, 1, 1, 1,
-0.03118704, -0.6036504, -3.21414, 1, 1, 1, 1, 1,
-0.03106117, -1.211391, -2.547395, 1, 1, 1, 1, 1,
-0.03046706, -1.212915, -2.962531, 1, 1, 1, 1, 1,
-0.01830764, -0.227962, -3.091617, 1, 1, 1, 1, 1,
-0.01329814, 0.4372534, -0.7037438, 1, 1, 1, 1, 1,
-0.01254516, 0.3150919, -0.4219944, 1, 1, 1, 1, 1,
-0.007346172, -0.3455975, -1.335715, 1, 1, 1, 1, 1,
-0.006919662, -0.1607565, -3.069416, 1, 1, 1, 1, 1,
-0.0007988471, -0.1376583, -3.597564, 1, 1, 1, 1, 1,
0.004706824, 0.02152031, 0.6973498, 1, 1, 1, 1, 1,
0.01076326, -0.06694043, 1.496338, 1, 1, 1, 1, 1,
0.01097733, -0.3778571, 2.124087, 0, 0, 1, 1, 1,
0.01684225, 0.2676641, -0.1821483, 1, 0, 0, 1, 1,
0.01753376, 1.357633, 0.9581939, 1, 0, 0, 1, 1,
0.01864489, -0.5556616, 3.874359, 1, 0, 0, 1, 1,
0.019826, 1.276515, -1.488161, 1, 0, 0, 1, 1,
0.02155351, -0.7716926, 4.532404, 1, 0, 0, 1, 1,
0.02399245, -0.6232504, 3.203363, 0, 0, 0, 1, 1,
0.02803479, 0.918524, -0.03578895, 0, 0, 0, 1, 1,
0.02902729, 0.2179216, 0.2805695, 0, 0, 0, 1, 1,
0.03260655, 1.063456, 0.2620721, 0, 0, 0, 1, 1,
0.04053475, 0.008362174, -0.204183, 0, 0, 0, 1, 1,
0.04355967, 0.1175434, 0.5527779, 0, 0, 0, 1, 1,
0.04494549, -0.2995001, 2.529786, 0, 0, 0, 1, 1,
0.04536887, -0.2825916, 3.732378, 1, 1, 1, 1, 1,
0.04663771, 0.2651577, 0.8161473, 1, 1, 1, 1, 1,
0.05090801, 1.31058, -1.361117, 1, 1, 1, 1, 1,
0.05110862, 1.583328, 1.582464, 1, 1, 1, 1, 1,
0.05168543, -0.9926358, 4.086647, 1, 1, 1, 1, 1,
0.05240121, 0.5547305, 1.087696, 1, 1, 1, 1, 1,
0.05375008, -0.4226287, 0.9515798, 1, 1, 1, 1, 1,
0.05818186, 0.1547853, -0.3016458, 1, 1, 1, 1, 1,
0.05938721, -0.2112796, 2.968276, 1, 1, 1, 1, 1,
0.06142479, 0.4150864, 0.1728233, 1, 1, 1, 1, 1,
0.06320393, -0.414763, 3.179051, 1, 1, 1, 1, 1,
0.06631901, 0.3696904, -0.8545017, 1, 1, 1, 1, 1,
0.06976707, -0.9824488, 2.932694, 1, 1, 1, 1, 1,
0.07081828, 1.110458, -1.456781, 1, 1, 1, 1, 1,
0.07119186, -0.2762566, 2.416438, 1, 1, 1, 1, 1,
0.07581328, -1.682709, 5.223501, 0, 0, 1, 1, 1,
0.07594421, 0.09730659, 0.7342657, 1, 0, 0, 1, 1,
0.08376557, 1.801608, 1.096774, 1, 0, 0, 1, 1,
0.08605629, 0.2942199, -1.046107, 1, 0, 0, 1, 1,
0.08612605, 1.014158, 2.060889, 1, 0, 0, 1, 1,
0.09743127, 0.02609761, 1.054971, 1, 0, 0, 1, 1,
0.1014951, 0.7564336, -1.252349, 0, 0, 0, 1, 1,
0.104298, -0.07716168, 2.469606, 0, 0, 0, 1, 1,
0.1045471, 0.1748726, 1.186481, 0, 0, 0, 1, 1,
0.106797, -0.3505113, 2.817748, 0, 0, 0, 1, 1,
0.1116536, 2.361615, 0.1712672, 0, 0, 0, 1, 1,
0.112517, -1.076, 4.146995, 0, 0, 0, 1, 1,
0.1144601, -0.9637199, 1.762856, 0, 0, 0, 1, 1,
0.1217925, 0.642408, -1.228366, 1, 1, 1, 1, 1,
0.1234833, 1.679339, 0.5285282, 1, 1, 1, 1, 1,
0.1271481, 2.683191, -1.689314, 1, 1, 1, 1, 1,
0.1272737, 1.514479, 0.866731, 1, 1, 1, 1, 1,
0.1287848, -1.239906, 5.441052, 1, 1, 1, 1, 1,
0.1364818, -0.1972882, 3.559492, 1, 1, 1, 1, 1,
0.1365506, -0.4977318, 2.790257, 1, 1, 1, 1, 1,
0.1382148, -0.7867242, 3.697609, 1, 1, 1, 1, 1,
0.1404978, -1.64197, 3.394023, 1, 1, 1, 1, 1,
0.1423104, 0.7296585, -0.3601889, 1, 1, 1, 1, 1,
0.1451694, -0.4781729, 2.582289, 1, 1, 1, 1, 1,
0.1532249, 1.554267, -0.7993287, 1, 1, 1, 1, 1,
0.165222, -0.06412703, 2.270023, 1, 1, 1, 1, 1,
0.1654565, -0.06245778, 2.722696, 1, 1, 1, 1, 1,
0.1656511, 1.770469, 0.1315432, 1, 1, 1, 1, 1,
0.1676524, -1.096738, 1.998314, 0, 0, 1, 1, 1,
0.1718986, -0.01862258, 2.420048, 1, 0, 0, 1, 1,
0.1730808, -0.04146343, 1.742071, 1, 0, 0, 1, 1,
0.1731155, 0.6006372, -0.3429001, 1, 0, 0, 1, 1,
0.1765434, -0.758167, 3.675794, 1, 0, 0, 1, 1,
0.1767411, -1.230958, 2.698659, 1, 0, 0, 1, 1,
0.1774457, -0.9662475, 2.165669, 0, 0, 0, 1, 1,
0.1781773, 0.7736644, 0.05996663, 0, 0, 0, 1, 1,
0.1797188, -0.2278534, 2.022046, 0, 0, 0, 1, 1,
0.1797504, 1.832027, 0.5934757, 0, 0, 0, 1, 1,
0.1801646, 0.6590049, -0.7394405, 0, 0, 0, 1, 1,
0.180751, 0.6451993, 0.1338239, 0, 0, 0, 1, 1,
0.1816804, 1.982112, 0.2296024, 0, 0, 0, 1, 1,
0.1846294, -0.5392357, 2.184134, 1, 1, 1, 1, 1,
0.1861951, 0.5335879, 0.2124467, 1, 1, 1, 1, 1,
0.1867035, 0.5268939, -0.8377029, 1, 1, 1, 1, 1,
0.1872344, 1.024387, 1.273904, 1, 1, 1, 1, 1,
0.1899309, -0.03793114, 1.295561, 1, 1, 1, 1, 1,
0.193732, 0.4488055, 0.668537, 1, 1, 1, 1, 1,
0.1963802, -0.01865779, 2.61405, 1, 1, 1, 1, 1,
0.1991587, -1.348632, 2.659193, 1, 1, 1, 1, 1,
0.2000279, -1.13092, 3.042027, 1, 1, 1, 1, 1,
0.2011067, -0.359579, 1.207025, 1, 1, 1, 1, 1,
0.2049856, -0.5443619, 4.646739, 1, 1, 1, 1, 1,
0.2060339, 0.253577, -0.1298218, 1, 1, 1, 1, 1,
0.2073032, -0.9364974, 2.142746, 1, 1, 1, 1, 1,
0.2076351, -0.1340871, 2.367995, 1, 1, 1, 1, 1,
0.2094036, 0.282091, 0.8631151, 1, 1, 1, 1, 1,
0.2097274, -0.9990188, 0.3098948, 0, 0, 1, 1, 1,
0.2138798, 1.320552, 0.2879086, 1, 0, 0, 1, 1,
0.2139529, 0.5967957, 1.076431, 1, 0, 0, 1, 1,
0.2144805, -0.5089664, 3.209824, 1, 0, 0, 1, 1,
0.2165664, 1.679348, 0.302319, 1, 0, 0, 1, 1,
0.2179922, 1.268052, 0.05520229, 1, 0, 0, 1, 1,
0.2224578, 0.6644807, 0.7568818, 0, 0, 0, 1, 1,
0.2255916, -1.232228, 2.482225, 0, 0, 0, 1, 1,
0.2294082, -1.164684, 1.497471, 0, 0, 0, 1, 1,
0.2326564, 1.677321, 0.6912483, 0, 0, 0, 1, 1,
0.2370951, 0.3552423, 1.193881, 0, 0, 0, 1, 1,
0.2423513, -2.755816, 3.172674, 0, 0, 0, 1, 1,
0.2427769, -2.571447, 3.53894, 0, 0, 0, 1, 1,
0.2435896, -0.2557461, 1.485801, 1, 1, 1, 1, 1,
0.2443302, 0.72851, 0.7988625, 1, 1, 1, 1, 1,
0.2457837, 0.01923537, 1.006433, 1, 1, 1, 1, 1,
0.2519139, 1.962663, 0.2827124, 1, 1, 1, 1, 1,
0.2523939, -0.9775171, 3.94912, 1, 1, 1, 1, 1,
0.2603943, 1.573658, -1.467839, 1, 1, 1, 1, 1,
0.2620066, 0.164873, 1.169254, 1, 1, 1, 1, 1,
0.269687, -0.4212225, 2.297118, 1, 1, 1, 1, 1,
0.2709805, -1.285228, 3.738809, 1, 1, 1, 1, 1,
0.2778374, 0.6974701, 2.203571, 1, 1, 1, 1, 1,
0.2809995, 0.6842564, 0.008290132, 1, 1, 1, 1, 1,
0.2814534, -0.07079474, 1.786479, 1, 1, 1, 1, 1,
0.2815107, -0.1514328, 1.368057, 1, 1, 1, 1, 1,
0.2853853, 0.2595098, 0.17993, 1, 1, 1, 1, 1,
0.2859299, -0.8573104, 2.621215, 1, 1, 1, 1, 1,
0.290305, 1.589795, -1.619562, 0, 0, 1, 1, 1,
0.2921435, 0.5086033, 0.4679815, 1, 0, 0, 1, 1,
0.2962043, 0.9463326, 1.544002, 1, 0, 0, 1, 1,
0.2967784, -0.02235124, 0.5798045, 1, 0, 0, 1, 1,
0.2973919, -1.276408, 3.335526, 1, 0, 0, 1, 1,
0.2988007, -0.4890841, 2.14162, 1, 0, 0, 1, 1,
0.300923, -0.3247455, 1.514768, 0, 0, 0, 1, 1,
0.3076049, -0.6968169, 3.358141, 0, 0, 0, 1, 1,
0.3102834, 0.5997367, 0.6920021, 0, 0, 0, 1, 1,
0.3117664, 2.497575, -0.8478656, 0, 0, 0, 1, 1,
0.3349033, 0.9358184, 0.2172621, 0, 0, 0, 1, 1,
0.3371242, -0.2133483, 1.04324, 0, 0, 0, 1, 1,
0.3376724, -1.442077, 2.973353, 0, 0, 0, 1, 1,
0.341558, -0.3183008, 0.2687344, 1, 1, 1, 1, 1,
0.3460956, -1.180941, 2.456008, 1, 1, 1, 1, 1,
0.3471229, 0.8507244, -0.4694794, 1, 1, 1, 1, 1,
0.3480089, 0.2900648, 0.2346208, 1, 1, 1, 1, 1,
0.3550479, 1.191099, 2.417105, 1, 1, 1, 1, 1,
0.3568094, 0.6449761, 0.7856865, 1, 1, 1, 1, 1,
0.3572348, -1.03578, 5.117857, 1, 1, 1, 1, 1,
0.3589692, -1.132513, 1.829454, 1, 1, 1, 1, 1,
0.359905, -1.186373, 3.433657, 1, 1, 1, 1, 1,
0.3610622, -0.1931806, 3.565785, 1, 1, 1, 1, 1,
0.3616525, 1.815395, 0.1747285, 1, 1, 1, 1, 1,
0.3620888, -1.248666, 3.67942, 1, 1, 1, 1, 1,
0.3631923, -0.4782403, 1.771811, 1, 1, 1, 1, 1,
0.367166, -0.4995711, 3.929607, 1, 1, 1, 1, 1,
0.3674937, 1.458358, 0.3314075, 1, 1, 1, 1, 1,
0.3738087, -0.1295903, 3.40734, 0, 0, 1, 1, 1,
0.3753004, -0.3399597, 2.931039, 1, 0, 0, 1, 1,
0.3799069, -0.7874751, 2.572727, 1, 0, 0, 1, 1,
0.3813804, -0.1417591, 2.022423, 1, 0, 0, 1, 1,
0.3840163, -2.134896, 2.261544, 1, 0, 0, 1, 1,
0.3850843, 0.662402, 0.046274, 1, 0, 0, 1, 1,
0.385223, 1.48408, 1.096155, 0, 0, 0, 1, 1,
0.3852907, -0.002758507, 1.361186, 0, 0, 0, 1, 1,
0.3863689, 0.8410755, 2.54368, 0, 0, 0, 1, 1,
0.3869344, 1.147008, -1.208907, 0, 0, 0, 1, 1,
0.3871479, -0.2770316, 3.330317, 0, 0, 0, 1, 1,
0.3914414, -0.6389815, 3.038962, 0, 0, 0, 1, 1,
0.3924936, 0.9507546, 2.175225, 0, 0, 0, 1, 1,
0.3935595, -0.2790978, 3.300619, 1, 1, 1, 1, 1,
0.3955549, 0.8854064, 0.1513719, 1, 1, 1, 1, 1,
0.3975803, 1.570849, 0.1757134, 1, 1, 1, 1, 1,
0.4081736, 2.137407, -0.4175082, 1, 1, 1, 1, 1,
0.4083438, -0.68725, 3.511492, 1, 1, 1, 1, 1,
0.4089935, 0.2696074, 0.04214724, 1, 1, 1, 1, 1,
0.4090208, -1.630899, 2.949739, 1, 1, 1, 1, 1,
0.4124351, -0.4983747, 2.088207, 1, 1, 1, 1, 1,
0.4126344, 0.2270742, -0.3660713, 1, 1, 1, 1, 1,
0.4142942, -0.54752, 1.72168, 1, 1, 1, 1, 1,
0.4169219, 0.2483614, 1.262794, 1, 1, 1, 1, 1,
0.4171836, -0.5463987, 1.354664, 1, 1, 1, 1, 1,
0.4175872, -0.6682827, 2.302094, 1, 1, 1, 1, 1,
0.4195565, -1.007852, 3.848967, 1, 1, 1, 1, 1,
0.4201212, 1.011496, -0.4960418, 1, 1, 1, 1, 1,
0.429193, -0.8987861, 3.353999, 0, 0, 1, 1, 1,
0.4314786, -1.038735, 2.344721, 1, 0, 0, 1, 1,
0.4343566, -1.468412, 4.834517, 1, 0, 0, 1, 1,
0.4349566, 0.1010361, 0.8879329, 1, 0, 0, 1, 1,
0.4374463, 0.4173532, -0.4771014, 1, 0, 0, 1, 1,
0.4456122, -1.872157, 1.406601, 1, 0, 0, 1, 1,
0.4482697, -0.3703095, 3.148327, 0, 0, 0, 1, 1,
0.4492848, -0.1377786, 1.171874, 0, 0, 0, 1, 1,
0.4521372, -1.299117, 1.478169, 0, 0, 0, 1, 1,
0.4549851, -1.957451, 2.63239, 0, 0, 0, 1, 1,
0.4567556, 0.3485799, -0.1561418, 0, 0, 0, 1, 1,
0.4576795, -1.605629, 2.678124, 0, 0, 0, 1, 1,
0.4609569, -0.8215044, 2.445762, 0, 0, 0, 1, 1,
0.4617447, 0.5824406, 1.547987, 1, 1, 1, 1, 1,
0.4690418, -1.603387, 3.592085, 1, 1, 1, 1, 1,
0.4733975, 0.2167357, 0.6106427, 1, 1, 1, 1, 1,
0.4773914, -0.6365013, 3.183772, 1, 1, 1, 1, 1,
0.482246, 0.5008187, 2.12785, 1, 1, 1, 1, 1,
0.4839126, -0.4769751, 1.938532, 1, 1, 1, 1, 1,
0.4924924, 0.01305037, 2.021438, 1, 1, 1, 1, 1,
0.4959042, -0.7818945, 2.206027, 1, 1, 1, 1, 1,
0.5103108, -0.1218292, 2.112266, 1, 1, 1, 1, 1,
0.5167631, -0.5036886, 4.687132, 1, 1, 1, 1, 1,
0.5180964, 0.6578498, 1.023262, 1, 1, 1, 1, 1,
0.5181361, 0.3375525, 1.146439, 1, 1, 1, 1, 1,
0.5183783, 0.5453939, 1.265095, 1, 1, 1, 1, 1,
0.5199128, -0.5691129, 4.391064, 1, 1, 1, 1, 1,
0.5302126, -2.364382, 0.848851, 1, 1, 1, 1, 1,
0.5350937, -0.1503062, 1.239685, 0, 0, 1, 1, 1,
0.5353318, -1.14228, 0.6584179, 1, 0, 0, 1, 1,
0.5387037, -1.029895, 2.533568, 1, 0, 0, 1, 1,
0.5549562, 0.2518943, -0.006146247, 1, 0, 0, 1, 1,
0.5615658, -0.3071226, 1.79216, 1, 0, 0, 1, 1,
0.5706358, 0.2893868, 3.462575, 1, 0, 0, 1, 1,
0.5722907, 0.19782, 1.250046, 0, 0, 0, 1, 1,
0.5765409, -0.3437208, 2.874741, 0, 0, 0, 1, 1,
0.5765867, -1.392719, 2.73407, 0, 0, 0, 1, 1,
0.5776283, 0.2739648, 0.2793688, 0, 0, 0, 1, 1,
0.5819513, 1.024547, -3.973393, 0, 0, 0, 1, 1,
0.5882937, 0.2892627, 2.095736, 0, 0, 0, 1, 1,
0.5950679, 0.2665781, 1.949805, 0, 0, 0, 1, 1,
0.5962158, -0.1552387, 2.813538, 1, 1, 1, 1, 1,
0.5981063, 1.556465, 1.419867, 1, 1, 1, 1, 1,
0.6011192, -0.9965206, 2.721661, 1, 1, 1, 1, 1,
0.6032506, 0.3930123, 0.1376489, 1, 1, 1, 1, 1,
0.6067216, 0.5094491, 0.9971668, 1, 1, 1, 1, 1,
0.6103007, -0.6436934, 2.439176, 1, 1, 1, 1, 1,
0.6147961, -0.3105736, 2.297924, 1, 1, 1, 1, 1,
0.6157999, -0.2614201, 2.127819, 1, 1, 1, 1, 1,
0.6165672, 0.3440624, 0.5341654, 1, 1, 1, 1, 1,
0.61721, -1.291432, 2.937786, 1, 1, 1, 1, 1,
0.6178051, -1.169041, 3.19859, 1, 1, 1, 1, 1,
0.6207991, -1.241192, 1.925683, 1, 1, 1, 1, 1,
0.6263696, -1.417941, 3.42389, 1, 1, 1, 1, 1,
0.6268494, 0.3323993, 1.622383, 1, 1, 1, 1, 1,
0.6284117, 1.996285, 1.251989, 1, 1, 1, 1, 1,
0.6320493, 0.2861369, 1.474359, 0, 0, 1, 1, 1,
0.6330362, 1.349363, -0.3077141, 1, 0, 0, 1, 1,
0.6358827, -0.2986911, 1.649354, 1, 0, 0, 1, 1,
0.6394681, 0.676072, 1.678477, 1, 0, 0, 1, 1,
0.6404142, 1.174676, 1.383083, 1, 0, 0, 1, 1,
0.6405342, 1.667842, -1.689025, 1, 0, 0, 1, 1,
0.6432442, 1.367964, -0.4365078, 0, 0, 0, 1, 1,
0.6475845, -0.8129045, 2.034117, 0, 0, 0, 1, 1,
0.6480156, -1.764955, 2.909259, 0, 0, 0, 1, 1,
0.648214, -0.9590115, 4.701583, 0, 0, 0, 1, 1,
0.650693, -0.3699297, 3.541279, 0, 0, 0, 1, 1,
0.6507321, -0.4160993, 2.63192, 0, 0, 0, 1, 1,
0.6526866, -1.39791, 2.886659, 0, 0, 0, 1, 1,
0.6561711, -0.5928829, 2.572922, 1, 1, 1, 1, 1,
0.6614295, 1.266592, -0.2795277, 1, 1, 1, 1, 1,
0.6624798, 0.5891901, 1.400699, 1, 1, 1, 1, 1,
0.6626589, 1.294356, -0.09454819, 1, 1, 1, 1, 1,
0.6629611, 2.50169, -1.196022, 1, 1, 1, 1, 1,
0.6658543, 0.6488596, 0.8663431, 1, 1, 1, 1, 1,
0.6662213, -0.6030369, 3.735734, 1, 1, 1, 1, 1,
0.6759135, 1.272378, 0.8041524, 1, 1, 1, 1, 1,
0.6783744, -1.633663, 3.521122, 1, 1, 1, 1, 1,
0.6804766, -0.5421125, 2.957363, 1, 1, 1, 1, 1,
0.6832042, 0.06045169, 1.658279, 1, 1, 1, 1, 1,
0.6847571, -1.617387, 4.356065, 1, 1, 1, 1, 1,
0.6922668, 0.959489, 2.195465, 1, 1, 1, 1, 1,
0.7010846, -0.8971829, 1.338579, 1, 1, 1, 1, 1,
0.7127156, -0.2042305, 2.442931, 1, 1, 1, 1, 1,
0.7201363, -1.226203, 2.07029, 0, 0, 1, 1, 1,
0.7205524, -0.4108519, 0.6331555, 1, 0, 0, 1, 1,
0.7236413, -0.008176538, 2.257511, 1, 0, 0, 1, 1,
0.7277782, -0.278598, 1.179131, 1, 0, 0, 1, 1,
0.7294781, 0.9463844, 0.01329052, 1, 0, 0, 1, 1,
0.729973, -0.8489841, 1.839153, 1, 0, 0, 1, 1,
0.7332564, -1.066241, 2.929701, 0, 0, 0, 1, 1,
0.7333117, -0.6661773, 3.021928, 0, 0, 0, 1, 1,
0.7368059, -0.9098821, 2.214291, 0, 0, 0, 1, 1,
0.7427061, 0.3117465, 2.445337, 0, 0, 0, 1, 1,
0.7449765, -0.2716571, 2.028002, 0, 0, 0, 1, 1,
0.7462322, 0.4808724, 0.8729849, 0, 0, 0, 1, 1,
0.7486149, -0.53925, 1.102563, 0, 0, 0, 1, 1,
0.7494951, 0.4975276, 0.8521656, 1, 1, 1, 1, 1,
0.751318, -0.3227185, 1.851743, 1, 1, 1, 1, 1,
0.7585117, -0.3250734, 0.7571369, 1, 1, 1, 1, 1,
0.7639499, -0.6405194, 1.907906, 1, 1, 1, 1, 1,
0.7676919, -0.8202285, 1.808651, 1, 1, 1, 1, 1,
0.7794525, -1.112153, 3.057159, 1, 1, 1, 1, 1,
0.7816204, -0.6010282, 3.203046, 1, 1, 1, 1, 1,
0.7829736, -0.1112588, 0.6040385, 1, 1, 1, 1, 1,
0.808713, -0.203391, 3.118759, 1, 1, 1, 1, 1,
0.8100018, 1.212734, 0.991875, 1, 1, 1, 1, 1,
0.8143889, -2.538474, 1.330335, 1, 1, 1, 1, 1,
0.8153555, -1.567315, 3.596271, 1, 1, 1, 1, 1,
0.8183521, -0.257617, 3.326789, 1, 1, 1, 1, 1,
0.8263101, -0.5079092, 2.035021, 1, 1, 1, 1, 1,
0.8315216, -0.5442904, 1.954066, 1, 1, 1, 1, 1,
0.8332094, 1.636084, 0.9168248, 0, 0, 1, 1, 1,
0.8389345, -0.5073361, 3.565543, 1, 0, 0, 1, 1,
0.8411191, -0.2023007, 1.906846, 1, 0, 0, 1, 1,
0.8492131, 0.4508646, -0.1923958, 1, 0, 0, 1, 1,
0.8512121, 0.2270078, 2.49494, 1, 0, 0, 1, 1,
0.8530782, 1.763216, -0.6473286, 1, 0, 0, 1, 1,
0.856347, 1.169231, 1.234373, 0, 0, 0, 1, 1,
0.8682533, 0.1131163, 1.766875, 0, 0, 0, 1, 1,
0.8697729, 0.4199006, 1.039118, 0, 0, 0, 1, 1,
0.8704286, 0.5172936, 0.5897695, 0, 0, 0, 1, 1,
0.8769411, 0.06518122, 1.481397, 0, 0, 0, 1, 1,
0.8777344, -0.1936396, 1.76155, 0, 0, 0, 1, 1,
0.8793033, -0.2944449, 3.466108, 0, 0, 0, 1, 1,
0.8834808, 1.188077, -0.7633058, 1, 1, 1, 1, 1,
0.8857086, 0.1817062, 0.2999112, 1, 1, 1, 1, 1,
0.8859845, 0.9005094, -0.01029056, 1, 1, 1, 1, 1,
0.8864009, 0.8388088, -0.3713644, 1, 1, 1, 1, 1,
0.8886096, 1.777578, -0.5279228, 1, 1, 1, 1, 1,
0.8908529, -1.798783, 2.942188, 1, 1, 1, 1, 1,
0.8999096, -0.3013385, 1.883895, 1, 1, 1, 1, 1,
0.9064433, 0.9536066, -0.03588169, 1, 1, 1, 1, 1,
0.9083635, -0.6946622, 1.857744, 1, 1, 1, 1, 1,
0.9093544, 0.4521109, 1.19666, 1, 1, 1, 1, 1,
0.9120958, -0.2750899, 2.487561, 1, 1, 1, 1, 1,
0.9129146, -0.7880092, 3.191196, 1, 1, 1, 1, 1,
0.9147309, 0.7788371, -0.1753268, 1, 1, 1, 1, 1,
0.9151268, 0.8801686, -0.01678498, 1, 1, 1, 1, 1,
0.9422624, -0.160866, 4.033835, 1, 1, 1, 1, 1,
0.9462753, -0.3840127, 2.590463, 0, 0, 1, 1, 1,
0.9489859, 0.1765313, 2.601013, 1, 0, 0, 1, 1,
0.9510151, 0.07037077, 2.030159, 1, 0, 0, 1, 1,
0.9536642, 0.2584009, 2.096443, 1, 0, 0, 1, 1,
0.9536739, 2.772759, -0.8863873, 1, 0, 0, 1, 1,
0.9549435, -0.249799, 0.8055191, 1, 0, 0, 1, 1,
0.9552655, -0.4601959, 1.108978, 0, 0, 0, 1, 1,
0.9614629, -1.250097, 3.52051, 0, 0, 0, 1, 1,
0.9637645, 0.2964682, 2.380458, 0, 0, 0, 1, 1,
0.9642619, -0.5421137, 0.9283022, 0, 0, 0, 1, 1,
0.964541, 1.483138, -0.4297349, 0, 0, 0, 1, 1,
0.9647661, 0.01281497, 1.644626, 0, 0, 0, 1, 1,
0.9649742, -0.5636711, 2.467992, 0, 0, 0, 1, 1,
0.9723206, -0.2792304, 1.600878, 1, 1, 1, 1, 1,
0.9809129, -0.2336169, 0.4869179, 1, 1, 1, 1, 1,
0.9838809, 0.7117941, 0.7073257, 1, 1, 1, 1, 1,
0.9841468, 0.9538443, 1.072392, 1, 1, 1, 1, 1,
0.993476, -0.01535199, 1.763679, 1, 1, 1, 1, 1,
0.993916, -0.5260385, 1.961356, 1, 1, 1, 1, 1,
1.004228, -0.9081063, 1.57045, 1, 1, 1, 1, 1,
1.021056, 0.4830109, 2.380964, 1, 1, 1, 1, 1,
1.031893, -0.02230774, 2.041884, 1, 1, 1, 1, 1,
1.033479, 0.7975823, 1.28851, 1, 1, 1, 1, 1,
1.035399, 0.0168313, 1.871226, 1, 1, 1, 1, 1,
1.036942, -0.3291443, 1.05663, 1, 1, 1, 1, 1,
1.042442, 1.696875, 0.7536378, 1, 1, 1, 1, 1,
1.043447, -0.6428839, 2.6399, 1, 1, 1, 1, 1,
1.046476, -0.4887569, 1.00523, 1, 1, 1, 1, 1,
1.05403, -1.187601, 1.76554, 0, 0, 1, 1, 1,
1.05432, 1.337965, 1.049807, 1, 0, 0, 1, 1,
1.059013, -0.0991097, 1.475984, 1, 0, 0, 1, 1,
1.059515, -0.6819441, 1.702286, 1, 0, 0, 1, 1,
1.061541, -0.5563377, 0.7436703, 1, 0, 0, 1, 1,
1.065047, 0.8083404, 2.378177, 1, 0, 0, 1, 1,
1.065866, -0.8578654, 1.989231, 0, 0, 0, 1, 1,
1.068779, -0.2592671, 1.249027, 0, 0, 0, 1, 1,
1.069543, -0.64953, 3.394292, 0, 0, 0, 1, 1,
1.069583, -0.3510364, 2.020947, 0, 0, 0, 1, 1,
1.078373, -0.3975181, 2.074683, 0, 0, 0, 1, 1,
1.082575, 1.722388, 0.08353188, 0, 0, 0, 1, 1,
1.084379, -0.475631, 1.465037, 0, 0, 0, 1, 1,
1.085337, 0.4906327, 0.09915899, 1, 1, 1, 1, 1,
1.091165, -0.0932717, 3.050425, 1, 1, 1, 1, 1,
1.093496, 0.5248666, 0.6118355, 1, 1, 1, 1, 1,
1.097352, 1.110827, -0.8056504, 1, 1, 1, 1, 1,
1.09845, 0.6354464, 2.388204, 1, 1, 1, 1, 1,
1.10102, 2.055521, -0.6707796, 1, 1, 1, 1, 1,
1.108245, 0.2394681, 1.078542, 1, 1, 1, 1, 1,
1.109585, -0.01315326, 2.618511, 1, 1, 1, 1, 1,
1.113984, -0.2405362, 1.305405, 1, 1, 1, 1, 1,
1.121141, -0.5943548, -0.1645429, 1, 1, 1, 1, 1,
1.130147, -0.06647366, 3.779332, 1, 1, 1, 1, 1,
1.130398, -0.799639, 2.71778, 1, 1, 1, 1, 1,
1.145339, -1.435258, 2.171855, 1, 1, 1, 1, 1,
1.14986, -0.5467129, 0.6519552, 1, 1, 1, 1, 1,
1.170234, -0.1049898, -1.333959, 1, 1, 1, 1, 1,
1.17928, 1.057979, 2.392112, 0, 0, 1, 1, 1,
1.179656, -0.7904176, 3.53639, 1, 0, 0, 1, 1,
1.192112, -0.258752, 0.9366313, 1, 0, 0, 1, 1,
1.195625, -0.4785101, 1.939301, 1, 0, 0, 1, 1,
1.19849, 0.3707711, 1.525286, 1, 0, 0, 1, 1,
1.199405, -0.8725841, 2.051584, 1, 0, 0, 1, 1,
1.206498, 0.3775273, -0.03427834, 0, 0, 0, 1, 1,
1.206521, 1.289268, 0.7905881, 0, 0, 0, 1, 1,
1.207145, 1.684107, -0.3771088, 0, 0, 0, 1, 1,
1.217931, 0.2948638, 1.641742, 0, 0, 0, 1, 1,
1.234504, 0.4163606, 1.360447, 0, 0, 0, 1, 1,
1.242301, -0.3517343, 2.319579, 0, 0, 0, 1, 1,
1.256021, -1.66969, 1.904659, 0, 0, 0, 1, 1,
1.261041, 0.5075372, 0.1144002, 1, 1, 1, 1, 1,
1.268984, 0.2045583, 0.5779548, 1, 1, 1, 1, 1,
1.271967, 1.969074, -0.874962, 1, 1, 1, 1, 1,
1.273256, 0.2648868, 1.889366, 1, 1, 1, 1, 1,
1.273497, 0.2338542, 2.929241, 1, 1, 1, 1, 1,
1.278076, 0.1887689, 1.91271, 1, 1, 1, 1, 1,
1.279074, -0.3996557, 3.217348, 1, 1, 1, 1, 1,
1.287358, -0.9500988, 3.392678, 1, 1, 1, 1, 1,
1.28767, -1.111913, 4.833728, 1, 1, 1, 1, 1,
1.290573, -0.8725848, 3.038816, 1, 1, 1, 1, 1,
1.295786, -1.362093, 2.519199, 1, 1, 1, 1, 1,
1.296088, -0.367808, 0.6757572, 1, 1, 1, 1, 1,
1.305679, -0.495313, 3.162099, 1, 1, 1, 1, 1,
1.323867, 0.2653658, 1.881065, 1, 1, 1, 1, 1,
1.330593, -1.396257, 2.614579, 1, 1, 1, 1, 1,
1.338173, 0.6779961, 1.282793, 0, 0, 1, 1, 1,
1.344972, -2.487182, 4.905005, 1, 0, 0, 1, 1,
1.346604, -0.5470167, 2.199893, 1, 0, 0, 1, 1,
1.355673, 0.8706139, -0.4196826, 1, 0, 0, 1, 1,
1.368111, 1.260446, 1.961802, 1, 0, 0, 1, 1,
1.373917, -0.6262317, -0.001079314, 1, 0, 0, 1, 1,
1.393504, -0.648149, 0.5865957, 0, 0, 0, 1, 1,
1.39589, -0.2948287, 1.238909, 0, 0, 0, 1, 1,
1.398033, -1.041096, 1.020442, 0, 0, 0, 1, 1,
1.399268, -1.291398, 1.625124, 0, 0, 0, 1, 1,
1.406456, 0.3663144, -0.2036205, 0, 0, 0, 1, 1,
1.416549, -2.333034, 0.7187485, 0, 0, 0, 1, 1,
1.436574, -1.212044, 2.826411, 0, 0, 0, 1, 1,
1.444826, 0.8038012, 1.87752, 1, 1, 1, 1, 1,
1.451091, 0.4874073, 1.699281, 1, 1, 1, 1, 1,
1.459526, -0.8666339, 3.507305, 1, 1, 1, 1, 1,
1.463851, -1.283008, 4.837486, 1, 1, 1, 1, 1,
1.482353, 0.259607, 2.966385, 1, 1, 1, 1, 1,
1.485782, -0.5086427, 1.49879, 1, 1, 1, 1, 1,
1.488648, -1.165902, 2.673221, 1, 1, 1, 1, 1,
1.489386, 2.062938, 0.7875419, 1, 1, 1, 1, 1,
1.490809, -0.8698338, 2.298443, 1, 1, 1, 1, 1,
1.493165, 0.680233, 1.81119, 1, 1, 1, 1, 1,
1.499071, -0.0805472, 3.136661, 1, 1, 1, 1, 1,
1.505081, -0.9210551, 0.104891, 1, 1, 1, 1, 1,
1.506498, 0.09529378, 0.3514096, 1, 1, 1, 1, 1,
1.527632, 2.197247, 0.1518802, 1, 1, 1, 1, 1,
1.528211, 0.393163, 0.9990834, 1, 1, 1, 1, 1,
1.533254, -0.2091867, 1.543913, 0, 0, 1, 1, 1,
1.543195, -0.4930617, 2.481754, 1, 0, 0, 1, 1,
1.560676, 0.6497593, 1.952377, 1, 0, 0, 1, 1,
1.576127, -0.1562653, 2.120168, 1, 0, 0, 1, 1,
1.584165, -0.3577662, 2.547045, 1, 0, 0, 1, 1,
1.61147, 1.218944, 0.8398499, 1, 0, 0, 1, 1,
1.617441, -0.2601212, 1.640179, 0, 0, 0, 1, 1,
1.61945, -0.8771919, 1.527707, 0, 0, 0, 1, 1,
1.622261, -0.8526192, 1.91498, 0, 0, 0, 1, 1,
1.63157, 0.1470449, 2.688747, 0, 0, 0, 1, 1,
1.632471, 0.8659027, 1.711621, 0, 0, 0, 1, 1,
1.63596, 2.021575, 2.512385, 0, 0, 0, 1, 1,
1.63613, -0.7358866, 0.7069379, 0, 0, 0, 1, 1,
1.65492, 0.3590909, 1.561915, 1, 1, 1, 1, 1,
1.661313, -0.2376366, 2.384019, 1, 1, 1, 1, 1,
1.664885, 0.6751504, 0.1272683, 1, 1, 1, 1, 1,
1.668993, -1.408702, 2.300954, 1, 1, 1, 1, 1,
1.670212, 0.5169557, 1.243472, 1, 1, 1, 1, 1,
1.678909, 1.960855, 2.965809, 1, 1, 1, 1, 1,
1.680552, -0.1343442, 1.633588, 1, 1, 1, 1, 1,
1.690356, 1.181922, 0.9131964, 1, 1, 1, 1, 1,
1.693957, -1.237563, 1.02209, 1, 1, 1, 1, 1,
1.695903, -0.2084692, 1.022326, 1, 1, 1, 1, 1,
1.696049, 0.1176991, 0.8929831, 1, 1, 1, 1, 1,
1.713406, -1.353024, 2.366508, 1, 1, 1, 1, 1,
1.72433, -0.3472216, 2.568679, 1, 1, 1, 1, 1,
1.733433, 0.001955011, 2.143216, 1, 1, 1, 1, 1,
1.736403, -0.06289563, 2.830467, 1, 1, 1, 1, 1,
1.748307, 0.6860568, 3.7098, 0, 0, 1, 1, 1,
1.749096, 1.205409, 0.2157364, 1, 0, 0, 1, 1,
1.761403, -0.2402093, 2.299823, 1, 0, 0, 1, 1,
1.777671, -0.1326208, 1.301463, 1, 0, 0, 1, 1,
1.809057, 1.988567, 3.08461, 1, 0, 0, 1, 1,
1.817483, 1.063035, 0.5965222, 1, 0, 0, 1, 1,
1.861968, -1.366262, 1.414774, 0, 0, 0, 1, 1,
1.874493, -1.046527, 1.683866, 0, 0, 0, 1, 1,
1.887085, 0.3762178, 1.493624, 0, 0, 0, 1, 1,
1.944217, -0.7547199, 3.82288, 0, 0, 0, 1, 1,
1.945586, -1.00286, 0.2490032, 0, 0, 0, 1, 1,
1.953719, -0.3774396, 1.285543, 0, 0, 0, 1, 1,
1.956068, -1.076763, 2.008281, 0, 0, 0, 1, 1,
1.964731, 1.212187, -1.028609, 1, 1, 1, 1, 1,
1.970317, -2.703526, 2.902254, 1, 1, 1, 1, 1,
1.986728, -0.6643642, 2.995702, 1, 1, 1, 1, 1,
1.990858, 0.7353216, -0.1886712, 1, 1, 1, 1, 1,
2.010155, 1.134021, 2.421625, 1, 1, 1, 1, 1,
2.024935, -0.05592574, 1.288104, 1, 1, 1, 1, 1,
2.032737, 1.035723, 2.017684, 1, 1, 1, 1, 1,
2.036167, 0.2886781, 1.519663, 1, 1, 1, 1, 1,
2.063864, 0.4491501, 2.169359, 1, 1, 1, 1, 1,
2.081716, 0.4350323, 1.614221, 1, 1, 1, 1, 1,
2.104855, -0.8386832, 2.502643, 1, 1, 1, 1, 1,
2.105097, -3.862576, 2.021642, 1, 1, 1, 1, 1,
2.124518, -0.2430812, 1.53684, 1, 1, 1, 1, 1,
2.178865, 0.0870854, 1.258398, 1, 1, 1, 1, 1,
2.192227, 0.777862, 1.249898, 1, 1, 1, 1, 1,
2.199603, -0.04676579, 2.301649, 0, 0, 1, 1, 1,
2.227813, -1.742772, 1.942123, 1, 0, 0, 1, 1,
2.228424, 0.7865971, -0.1923136, 1, 0, 0, 1, 1,
2.236481, -1.600252, 1.908967, 1, 0, 0, 1, 1,
2.251826, 0.2411481, 2.286613, 1, 0, 0, 1, 1,
2.274052, -1.034326, 1.961433, 1, 0, 0, 1, 1,
2.294228, 0.2146305, 0.8559286, 0, 0, 0, 1, 1,
2.295994, -0.3156195, 1.931682, 0, 0, 0, 1, 1,
2.298107, 0.6157914, 0.9466379, 0, 0, 0, 1, 1,
2.379295, -0.6392922, 1.713733, 0, 0, 0, 1, 1,
2.40985, 0.1032958, 3.1883, 0, 0, 0, 1, 1,
2.456722, 0.6689245, 2.603553, 0, 0, 0, 1, 1,
2.48742, -0.8957252, 0.7815174, 0, 0, 0, 1, 1,
2.632161, 0.2879995, 0.7015985, 1, 1, 1, 1, 1,
2.660481, 0.6834723, 0.6414145, 1, 1, 1, 1, 1,
2.859821, 0.8188717, 1.034652, 1, 1, 1, 1, 1,
2.883093, 0.3564155, 1.06973, 1, 1, 1, 1, 1,
2.898074, 0.2433165, 0.8542337, 1, 1, 1, 1, 1,
2.969671, -1.675364, 1.483156, 1, 1, 1, 1, 1,
3.455714, 0.6634402, 1.618621, 1, 1, 1, 1, 1
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
var radius = 9.56809;
var distance = 33.60751;
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
mvMatrix.translate( -0.3471121, 0.4634378, -0.1619787 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.60751);
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