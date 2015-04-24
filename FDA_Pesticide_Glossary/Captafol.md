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
-3.833856, 0.01805094, 1.042119, 1, 0, 0, 1,
-3.00604, -0.669652, -1.922444, 1, 0.007843138, 0, 1,
-2.898619, 0.7952119, -0.7842022, 1, 0.01176471, 0, 1,
-2.799771, 1.119566, 2.311841, 1, 0.01960784, 0, 1,
-2.768007, -0.3361104, -2.263213, 1, 0.02352941, 0, 1,
-2.754862, -1.283465, -1.499622, 1, 0.03137255, 0, 1,
-2.680176, 0.9983028, -0.8496001, 1, 0.03529412, 0, 1,
-2.676611, 0.597761, -4.438765, 1, 0.04313726, 0, 1,
-2.6527, 0.8039734, -2.682949, 1, 0.04705882, 0, 1,
-2.416982, 1.414199, -1.003566, 1, 0.05490196, 0, 1,
-2.408208, -0.8894926, -1.438253, 1, 0.05882353, 0, 1,
-2.397496, 2.809729, -1.423616, 1, 0.06666667, 0, 1,
-2.396506, 1.995855, -0.7739125, 1, 0.07058824, 0, 1,
-2.341879, -0.664044, -2.593936, 1, 0.07843138, 0, 1,
-2.332267, -0.3169466, -0.9190266, 1, 0.08235294, 0, 1,
-2.316609, 1.46432, -0.04162738, 1, 0.09019608, 0, 1,
-2.287908, 2.00609, -0.4835442, 1, 0.09411765, 0, 1,
-2.198738, -0.8939807, -2.895633, 1, 0.1019608, 0, 1,
-2.168473, 0.3168809, -2.527076, 1, 0.1098039, 0, 1,
-2.140703, -2.608331, -2.335704, 1, 0.1137255, 0, 1,
-2.090193, -0.3554371, -1.427057, 1, 0.1215686, 0, 1,
-2.07045, -1.480018, -2.141189, 1, 0.1254902, 0, 1,
-2.054577, 1.525029, 0.04637955, 1, 0.1333333, 0, 1,
-2.038142, 0.2033071, -2.209426, 1, 0.1372549, 0, 1,
-2.0312, -0.802048, -3.279455, 1, 0.145098, 0, 1,
-2.010477, -0.3737802, -2.068558, 1, 0.1490196, 0, 1,
-2.008074, 0.7848916, -1.738917, 1, 0.1568628, 0, 1,
-1.982598, -0.9623639, -3.020723, 1, 0.1607843, 0, 1,
-1.967513, 1.190266, 0.3413976, 1, 0.1686275, 0, 1,
-1.966343, -1.164417, -2.25128, 1, 0.172549, 0, 1,
-1.949582, -2.018861, -2.809838, 1, 0.1803922, 0, 1,
-1.924152, -1.220779, -2.27126, 1, 0.1843137, 0, 1,
-1.914163, 0.5975968, -0.1833415, 1, 0.1921569, 0, 1,
-1.897821, -0.6277132, -2.759563, 1, 0.1960784, 0, 1,
-1.894411, 0.1532664, -2.816027, 1, 0.2039216, 0, 1,
-1.867661, -1.159708, -3.135524, 1, 0.2117647, 0, 1,
-1.860483, 0.4492061, 0.1416191, 1, 0.2156863, 0, 1,
-1.850149, -0.2086578, -0.8438557, 1, 0.2235294, 0, 1,
-1.847736, -0.8823524, -0.07860957, 1, 0.227451, 0, 1,
-1.817419, -1.022758, -2.176586, 1, 0.2352941, 0, 1,
-1.811266, -0.222371, -2.277972, 1, 0.2392157, 0, 1,
-1.803936, 0.879317, -1.41618, 1, 0.2470588, 0, 1,
-1.801224, 0.4228433, -3.982576, 1, 0.2509804, 0, 1,
-1.793043, -2.459132, -3.628155, 1, 0.2588235, 0, 1,
-1.762943, -0.7190317, -1.878597, 1, 0.2627451, 0, 1,
-1.758949, -0.7677272, -3.098384, 1, 0.2705882, 0, 1,
-1.732067, 1.258791, -0.700466, 1, 0.2745098, 0, 1,
-1.730845, -0.8164764, 0.8309262, 1, 0.282353, 0, 1,
-1.727688, 0.2134099, -1.32253, 1, 0.2862745, 0, 1,
-1.726813, -1.316341, -3.005484, 1, 0.2941177, 0, 1,
-1.725653, -0.2823337, -1.372949, 1, 0.3019608, 0, 1,
-1.721906, 0.615457, -2.207917, 1, 0.3058824, 0, 1,
-1.720035, -0.2443519, -2.366436, 1, 0.3137255, 0, 1,
-1.718689, -0.4322043, -2.627545, 1, 0.3176471, 0, 1,
-1.697375, -1.895429, -3.321458, 1, 0.3254902, 0, 1,
-1.691516, 1.363422, -1.63987, 1, 0.3294118, 0, 1,
-1.682816, -0.04690645, -1.679732, 1, 0.3372549, 0, 1,
-1.672379, 1.061872, -1.846648, 1, 0.3411765, 0, 1,
-1.671131, -0.4142824, -0.7530651, 1, 0.3490196, 0, 1,
-1.640954, 2.707371, 1.244573, 1, 0.3529412, 0, 1,
-1.636664, -0.4157383, -2.153485, 1, 0.3607843, 0, 1,
-1.612006, -1.05586, -2.233746, 1, 0.3647059, 0, 1,
-1.612005, -2.036915, -2.572405, 1, 0.372549, 0, 1,
-1.603608, -2.186581, -1.779827, 1, 0.3764706, 0, 1,
-1.59799, 0.6116124, -1.207371, 1, 0.3843137, 0, 1,
-1.584566, -0.03899295, -3.549206, 1, 0.3882353, 0, 1,
-1.530259, -1.910209, -2.776217, 1, 0.3960784, 0, 1,
-1.52818, 0.5513886, -0.3866258, 1, 0.4039216, 0, 1,
-1.525583, 0.8249262, 0.3849502, 1, 0.4078431, 0, 1,
-1.525565, 1.079568, -0.1168883, 1, 0.4156863, 0, 1,
-1.515106, -1.006226, -0.5250433, 1, 0.4196078, 0, 1,
-1.498171, -0.05424112, -0.8183014, 1, 0.427451, 0, 1,
-1.497385, 2.105603, -1.708987, 1, 0.4313726, 0, 1,
-1.489708, -1.037375, -2.308446, 1, 0.4392157, 0, 1,
-1.473394, -0.2764797, -2.273561, 1, 0.4431373, 0, 1,
-1.46218, 0.2374059, -2.120738, 1, 0.4509804, 0, 1,
-1.45421, 1.488678, 0.4781872, 1, 0.454902, 0, 1,
-1.452926, 0.972687, 0.1437182, 1, 0.4627451, 0, 1,
-1.447282, 0.7534226, -1.54703, 1, 0.4666667, 0, 1,
-1.439935, 1.875547, -0.2447572, 1, 0.4745098, 0, 1,
-1.426303, 0.5668842, -2.64329, 1, 0.4784314, 0, 1,
-1.425755, 1.032247, -0.05548317, 1, 0.4862745, 0, 1,
-1.423727, 0.5414633, -0.9018143, 1, 0.4901961, 0, 1,
-1.414317, 1.109099, -0.5605091, 1, 0.4980392, 0, 1,
-1.4129, -1.627686, -3.191256, 1, 0.5058824, 0, 1,
-1.404794, 0.2248008, -0.5676816, 1, 0.509804, 0, 1,
-1.401561, 0.04056703, 0.2349933, 1, 0.5176471, 0, 1,
-1.382271, -0.2196142, -0.8258935, 1, 0.5215687, 0, 1,
-1.377735, -1.428244, -2.599024, 1, 0.5294118, 0, 1,
-1.372419, -0.06966127, -2.603918, 1, 0.5333334, 0, 1,
-1.365045, 0.2178951, -1.068367, 1, 0.5411765, 0, 1,
-1.357646, -0.4256272, -0.8699791, 1, 0.5450981, 0, 1,
-1.352169, 0.42219, -2.632932, 1, 0.5529412, 0, 1,
-1.351959, -1.521551, -2.07455, 1, 0.5568628, 0, 1,
-1.346897, 1.326951, 1.291375, 1, 0.5647059, 0, 1,
-1.328016, -0.9697007, -1.777526, 1, 0.5686275, 0, 1,
-1.327444, 0.9399213, -1.260289, 1, 0.5764706, 0, 1,
-1.314494, 0.4847108, 0.2736377, 1, 0.5803922, 0, 1,
-1.311427, -1.102192, -1.226703, 1, 0.5882353, 0, 1,
-1.309106, 0.04772815, -0.09888271, 1, 0.5921569, 0, 1,
-1.308492, 0.1286957, -0.6165178, 1, 0.6, 0, 1,
-1.307056, -0.4252636, -2.844587, 1, 0.6078432, 0, 1,
-1.298747, 0.03450593, -1.077943, 1, 0.6117647, 0, 1,
-1.295372, 1.495945, 0.1918032, 1, 0.6196079, 0, 1,
-1.286784, 0.6530423, -0.9154254, 1, 0.6235294, 0, 1,
-1.280469, -0.6321349, -2.028322, 1, 0.6313726, 0, 1,
-1.269757, -0.3502315, 0.01454234, 1, 0.6352941, 0, 1,
-1.269226, 0.8216545, 0.375703, 1, 0.6431373, 0, 1,
-1.260159, 1.101718, -1.504377, 1, 0.6470588, 0, 1,
-1.259363, -0.3518567, -2.439048, 1, 0.654902, 0, 1,
-1.254363, -1.001499, -0.936417, 1, 0.6588235, 0, 1,
-1.253566, -0.4984126, -1.365444, 1, 0.6666667, 0, 1,
-1.240783, -2.070537, -3.352004, 1, 0.6705883, 0, 1,
-1.238477, -0.4923711, -1.956435, 1, 0.6784314, 0, 1,
-1.233972, -1.184623, -2.999989, 1, 0.682353, 0, 1,
-1.222657, -0.9370522, -0.6203269, 1, 0.6901961, 0, 1,
-1.221676, -1.066376, -1.441551, 1, 0.6941177, 0, 1,
-1.22161, -0.3756564, -0.4076531, 1, 0.7019608, 0, 1,
-1.215983, -1.243132, -3.428361, 1, 0.7098039, 0, 1,
-1.214464, 0.9652665, 0.3486525, 1, 0.7137255, 0, 1,
-1.214075, 0.1999706, -1.484801, 1, 0.7215686, 0, 1,
-1.210625, 0.3239301, -2.396435, 1, 0.7254902, 0, 1,
-1.210503, -1.197422, -0.5080709, 1, 0.7333333, 0, 1,
-1.210235, -0.1256019, -2.642888, 1, 0.7372549, 0, 1,
-1.21009, -0.01525057, -1.381641, 1, 0.7450981, 0, 1,
-1.209674, 0.8787798, -0.4115066, 1, 0.7490196, 0, 1,
-1.199684, -0.5233739, -1.174637, 1, 0.7568628, 0, 1,
-1.195573, -0.1623195, 0.07506278, 1, 0.7607843, 0, 1,
-1.191311, 0.04505005, -1.150557, 1, 0.7686275, 0, 1,
-1.177833, 0.2022326, -0.5250376, 1, 0.772549, 0, 1,
-1.175784, -0.3083918, -3.159369, 1, 0.7803922, 0, 1,
-1.171924, -0.1801443, -3.625308, 1, 0.7843137, 0, 1,
-1.169263, 0.9017162, -2.284683, 1, 0.7921569, 0, 1,
-1.164197, 0.7523797, -1.398517, 1, 0.7960784, 0, 1,
-1.163578, 0.5141093, -1.369701, 1, 0.8039216, 0, 1,
-1.161282, -1.72896, -2.840444, 1, 0.8117647, 0, 1,
-1.154465, -1.212986, -2.598001, 1, 0.8156863, 0, 1,
-1.15119, 0.1511915, -1.896605, 1, 0.8235294, 0, 1,
-1.147952, 0.06582529, -2.274546, 1, 0.827451, 0, 1,
-1.14652, 0.9976987, 1.007698, 1, 0.8352941, 0, 1,
-1.142029, -1.014735, -2.173408, 1, 0.8392157, 0, 1,
-1.13556, -0.6181186, -0.8279964, 1, 0.8470588, 0, 1,
-1.134563, -0.3653329, -1.021323, 1, 0.8509804, 0, 1,
-1.123414, 0.1537648, -2.531692, 1, 0.8588235, 0, 1,
-1.11456, -0.5881513, -1.924871, 1, 0.8627451, 0, 1,
-1.102852, 0.856508, -0.7817306, 1, 0.8705882, 0, 1,
-1.102631, 0.3777874, -1.770134, 1, 0.8745098, 0, 1,
-1.091675, 1.01401, -0.7999123, 1, 0.8823529, 0, 1,
-1.08535, -0.6730495, -0.7357449, 1, 0.8862745, 0, 1,
-1.07934, -0.4596367, -1.984935, 1, 0.8941177, 0, 1,
-1.078631, 0.6777925, -0.9207053, 1, 0.8980392, 0, 1,
-1.077012, 0.8172429, -0.09496528, 1, 0.9058824, 0, 1,
-1.076958, -1.269037, -3.05888, 1, 0.9137255, 0, 1,
-1.074637, -0.4162219, -1.476239, 1, 0.9176471, 0, 1,
-1.073623, 0.8393415, 0.2268356, 1, 0.9254902, 0, 1,
-1.066551, -0.0194787, -2.699423, 1, 0.9294118, 0, 1,
-1.063957, 1.156779, -1.183905, 1, 0.9372549, 0, 1,
-1.062991, -0.6917588, -2.773811, 1, 0.9411765, 0, 1,
-1.060557, 0.8433379, -2.809973, 1, 0.9490196, 0, 1,
-1.057868, -0.004543018, -0.09321938, 1, 0.9529412, 0, 1,
-1.057514, 0.4334351, -2.237311, 1, 0.9607843, 0, 1,
-1.051763, -0.07241427, -0.7890575, 1, 0.9647059, 0, 1,
-1.051034, 0.8409741, 0.2957749, 1, 0.972549, 0, 1,
-1.050964, 0.8785641, -2.714985, 1, 0.9764706, 0, 1,
-1.046294, 1.17708, 0.1086044, 1, 0.9843137, 0, 1,
-1.040712, 1.016019, -1.750717, 1, 0.9882353, 0, 1,
-1.039346, 0.3596173, -0.6106146, 1, 0.9960784, 0, 1,
-1.037476, -0.6083407, -1.839646, 0.9960784, 1, 0, 1,
-1.037449, -0.3439563, -0.5128424, 0.9921569, 1, 0, 1,
-1.03675, 0.5961637, -2.747438, 0.9843137, 1, 0, 1,
-1.026227, -0.6486953, -3.692013, 0.9803922, 1, 0, 1,
-1.024444, 0.003470307, -2.306059, 0.972549, 1, 0, 1,
-1.024089, -0.01022609, -1.433658, 0.9686275, 1, 0, 1,
-1.020577, 0.5716816, -1.274475, 0.9607843, 1, 0, 1,
-1.008884, -1.005906, -3.684938, 0.9568627, 1, 0, 1,
-1.006407, -1.224147, -2.775618, 0.9490196, 1, 0, 1,
-1.004903, -1.008565, -1.541696, 0.945098, 1, 0, 1,
-1.001741, -0.5577317, -2.055439, 0.9372549, 1, 0, 1,
-0.9885996, -1.01356, -1.313011, 0.9333333, 1, 0, 1,
-0.9814575, 0.651292, -1.669253, 0.9254902, 1, 0, 1,
-0.979742, 0.04558862, -2.420339, 0.9215686, 1, 0, 1,
-0.9729584, 0.6626375, -1.356233, 0.9137255, 1, 0, 1,
-0.9666942, 0.2996464, 0.2540545, 0.9098039, 1, 0, 1,
-0.9598795, -0.3021108, -1.512604, 0.9019608, 1, 0, 1,
-0.9575794, 0.9865099, -0.8241284, 0.8941177, 1, 0, 1,
-0.9574458, 0.9376436, -0.6506341, 0.8901961, 1, 0, 1,
-0.9563425, 1.533054, -0.2143807, 0.8823529, 1, 0, 1,
-0.9558644, 1.173486, 1.403252, 0.8784314, 1, 0, 1,
-0.9551663, 1.335609, -1.30948, 0.8705882, 1, 0, 1,
-0.9443586, 0.2056499, -0.09410155, 0.8666667, 1, 0, 1,
-0.9426984, -0.8358143, -3.662385, 0.8588235, 1, 0, 1,
-0.9421329, -1.742105, -3.060803, 0.854902, 1, 0, 1,
-0.9413647, -0.2984062, -1.798991, 0.8470588, 1, 0, 1,
-0.9389722, 1.373168, -0.6737071, 0.8431373, 1, 0, 1,
-0.9304362, 0.2178383, -2.206802, 0.8352941, 1, 0, 1,
-0.9282459, -1.199789, -2.951277, 0.8313726, 1, 0, 1,
-0.9257338, 0.3243226, -3.169882, 0.8235294, 1, 0, 1,
-0.9228224, 0.8743148, -1.990633, 0.8196079, 1, 0, 1,
-0.918305, 0.2967494, -1.46761, 0.8117647, 1, 0, 1,
-0.9178005, -0.5922128, -1.83603, 0.8078431, 1, 0, 1,
-0.9176343, -0.2593707, 0.0590746, 0.8, 1, 0, 1,
-0.9141316, 2.119846, -0.01231084, 0.7921569, 1, 0, 1,
-0.9108284, -0.04365356, -2.186167, 0.7882353, 1, 0, 1,
-0.903285, -0.4655007, -1.365016, 0.7803922, 1, 0, 1,
-0.8925294, 0.2852763, -2.72426, 0.7764706, 1, 0, 1,
-0.8922074, -0.4272355, -0.5178235, 0.7686275, 1, 0, 1,
-0.8892797, 0.9122298, -0.6068784, 0.7647059, 1, 0, 1,
-0.8866291, -1.490173, -1.737894, 0.7568628, 1, 0, 1,
-0.8837308, 0.02613178, -1.772189, 0.7529412, 1, 0, 1,
-0.8803376, -0.4931654, -2.599737, 0.7450981, 1, 0, 1,
-0.8738838, 0.2299794, -1.152131, 0.7411765, 1, 0, 1,
-0.8722841, -1.615972, -2.711615, 0.7333333, 1, 0, 1,
-0.8707529, 1.251233, 1.837837, 0.7294118, 1, 0, 1,
-0.8697507, 0.3494874, 1.658381, 0.7215686, 1, 0, 1,
-0.8601221, -0.3454526, -0.2004653, 0.7176471, 1, 0, 1,
-0.8570439, -0.9418815, -1.927871, 0.7098039, 1, 0, 1,
-0.8568513, -0.02661263, -1.822114, 0.7058824, 1, 0, 1,
-0.8553023, -0.9772774, -1.622211, 0.6980392, 1, 0, 1,
-0.853603, -0.1427276, -1.278818, 0.6901961, 1, 0, 1,
-0.8528612, 1.528405, -1.453793, 0.6862745, 1, 0, 1,
-0.852537, 0.05726815, -1.858548, 0.6784314, 1, 0, 1,
-0.8503156, -1.15761, -2.873043, 0.6745098, 1, 0, 1,
-0.8492391, 0.346063, -1.196645, 0.6666667, 1, 0, 1,
-0.8454316, 0.501538, -0.9431626, 0.6627451, 1, 0, 1,
-0.84119, 0.3116723, -1.800387, 0.654902, 1, 0, 1,
-0.8360171, 0.4123702, -0.1308298, 0.6509804, 1, 0, 1,
-0.8324694, 2.134133, -1.767429, 0.6431373, 1, 0, 1,
-0.8260401, 0.7364943, 1.087903, 0.6392157, 1, 0, 1,
-0.8213241, 0.6119832, 0.3571879, 0.6313726, 1, 0, 1,
-0.8143995, 0.4709116, -3.326742, 0.627451, 1, 0, 1,
-0.8073947, 0.42642, -0.3629639, 0.6196079, 1, 0, 1,
-0.805644, -0.3681309, -3.231273, 0.6156863, 1, 0, 1,
-0.8049722, -0.6338561, -2.616483, 0.6078432, 1, 0, 1,
-0.8026025, -1.98847, -2.508169, 0.6039216, 1, 0, 1,
-0.7955136, 0.1359507, -1.221838, 0.5960785, 1, 0, 1,
-0.7923682, -0.7095012, -2.421131, 0.5882353, 1, 0, 1,
-0.7896267, 1.514667, -0.6315978, 0.5843138, 1, 0, 1,
-0.7891942, -1.417146, -4.779675, 0.5764706, 1, 0, 1,
-0.7799355, -0.03152114, -2.754793, 0.572549, 1, 0, 1,
-0.7762955, -1.228772, -0.9008191, 0.5647059, 1, 0, 1,
-0.7554446, -0.7058767, -2.566526, 0.5607843, 1, 0, 1,
-0.7534533, 0.3835036, -2.156282, 0.5529412, 1, 0, 1,
-0.7510653, -0.5578485, -3.194423, 0.5490196, 1, 0, 1,
-0.7504489, 1.010491, -0.1017556, 0.5411765, 1, 0, 1,
-0.748776, 2.398547, -0.4754553, 0.5372549, 1, 0, 1,
-0.7459256, 0.7225739, -1.036196, 0.5294118, 1, 0, 1,
-0.7411866, -2.049139, -2.324826, 0.5254902, 1, 0, 1,
-0.7387944, -0.2546076, -1.564506, 0.5176471, 1, 0, 1,
-0.7330705, -0.7243958, -3.234043, 0.5137255, 1, 0, 1,
-0.731356, -1.906193, -3.964725, 0.5058824, 1, 0, 1,
-0.730314, 0.7197528, -0.05229061, 0.5019608, 1, 0, 1,
-0.7302977, -0.5093127, -1.973604, 0.4941176, 1, 0, 1,
-0.7239084, 0.6635347, 0.4638231, 0.4862745, 1, 0, 1,
-0.7207776, 0.716376, -0.5240109, 0.4823529, 1, 0, 1,
-0.7178051, 0.384455, 0.6486184, 0.4745098, 1, 0, 1,
-0.7156296, -0.8017528, -4.186142, 0.4705882, 1, 0, 1,
-0.7138575, 0.8151332, -1.008978, 0.4627451, 1, 0, 1,
-0.7038, 0.5760536, -2.310518, 0.4588235, 1, 0, 1,
-0.7011787, 0.02299175, -2.811562, 0.4509804, 1, 0, 1,
-0.701088, -0.004641765, -1.657668, 0.4470588, 1, 0, 1,
-0.7008705, -0.26414, -1.420329, 0.4392157, 1, 0, 1,
-0.6976495, -0.4754601, -3.442601, 0.4352941, 1, 0, 1,
-0.6962924, 1.635387, -1.543593, 0.427451, 1, 0, 1,
-0.6939465, -0.1147323, -2.260706, 0.4235294, 1, 0, 1,
-0.6918402, -1.758569, -2.937644, 0.4156863, 1, 0, 1,
-0.6891213, -1.4073, -3.746331, 0.4117647, 1, 0, 1,
-0.6863393, 0.7356845, -0.7766472, 0.4039216, 1, 0, 1,
-0.6847597, -0.7803672, -3.051774, 0.3960784, 1, 0, 1,
-0.6830887, -0.4356504, -1.971426, 0.3921569, 1, 0, 1,
-0.6801123, -0.2313725, -0.5142976, 0.3843137, 1, 0, 1,
-0.6747063, -0.9044674, -2.116694, 0.3803922, 1, 0, 1,
-0.6707235, 1.104216, -1.866988, 0.372549, 1, 0, 1,
-0.6671007, -1.25142, -2.335892, 0.3686275, 1, 0, 1,
-0.6665701, 1.433327, -1.278316, 0.3607843, 1, 0, 1,
-0.6600495, 0.275683, -1.027131, 0.3568628, 1, 0, 1,
-0.6585318, 1.369307, -1.464105, 0.3490196, 1, 0, 1,
-0.6545035, -0.07490999, -2.997757, 0.345098, 1, 0, 1,
-0.6496278, -0.671349, -1.670933, 0.3372549, 1, 0, 1,
-0.648084, -0.5047247, -2.260099, 0.3333333, 1, 0, 1,
-0.6447386, -0.1468959, -2.573092, 0.3254902, 1, 0, 1,
-0.6438367, 1.251758, -0.43298, 0.3215686, 1, 0, 1,
-0.6419995, 0.7666697, 0.1706724, 0.3137255, 1, 0, 1,
-0.6419823, -0.1559923, -3.012553, 0.3098039, 1, 0, 1,
-0.6396782, 1.291069, -0.9214324, 0.3019608, 1, 0, 1,
-0.6394734, 1.218928, -0.1785862, 0.2941177, 1, 0, 1,
-0.6357161, -0.2820269, -2.74098, 0.2901961, 1, 0, 1,
-0.6291674, -0.2851845, -1.743116, 0.282353, 1, 0, 1,
-0.6230495, -1.955386, -2.120771, 0.2784314, 1, 0, 1,
-0.6212115, -0.1488896, -1.330398, 0.2705882, 1, 0, 1,
-0.621173, -0.06418977, -2.807494, 0.2666667, 1, 0, 1,
-0.6202565, -0.7833089, -2.166064, 0.2588235, 1, 0, 1,
-0.6193341, -1.145101, -3.210533, 0.254902, 1, 0, 1,
-0.6171699, 0.6721862, -0.2428806, 0.2470588, 1, 0, 1,
-0.6145362, 1.649415, 1.047377, 0.2431373, 1, 0, 1,
-0.6136724, 0.7783278, -0.6747672, 0.2352941, 1, 0, 1,
-0.6126035, -0.6696448, -2.693368, 0.2313726, 1, 0, 1,
-0.6094451, 1.18964, -0.7873712, 0.2235294, 1, 0, 1,
-0.6056436, -0.2206776, -2.696954, 0.2196078, 1, 0, 1,
-0.6048944, 0.195179, -0.8775342, 0.2117647, 1, 0, 1,
-0.6005812, -0.7890478, -1.660977, 0.2078431, 1, 0, 1,
-0.6004351, 0.451519, -1.415536, 0.2, 1, 0, 1,
-0.5952284, 0.6143395, -0.176556, 0.1921569, 1, 0, 1,
-0.5843445, -0.8131174, -0.9701879, 0.1882353, 1, 0, 1,
-0.582839, 0.747521, -1.927981, 0.1803922, 1, 0, 1,
-0.5809314, -0.1691579, -1.446955, 0.1764706, 1, 0, 1,
-0.5748784, 0.3867815, -0.302173, 0.1686275, 1, 0, 1,
-0.5723259, 0.6284, -0.1023589, 0.1647059, 1, 0, 1,
-0.5713594, -1.638927, -2.65619, 0.1568628, 1, 0, 1,
-0.56476, -0.5395275, -3.748164, 0.1529412, 1, 0, 1,
-0.5585238, -0.06185641, -3.784906, 0.145098, 1, 0, 1,
-0.556466, -0.2019366, -1.6539, 0.1411765, 1, 0, 1,
-0.5562518, 0.05770787, -1.473861, 0.1333333, 1, 0, 1,
-0.5560958, 0.8031989, -1.579501, 0.1294118, 1, 0, 1,
-0.5525719, 0.4521742, 0.4821139, 0.1215686, 1, 0, 1,
-0.5522926, 0.1284653, -1.65947, 0.1176471, 1, 0, 1,
-0.5426456, 0.9870275, 0.3663573, 0.1098039, 1, 0, 1,
-0.5369065, -1.057155, -3.150099, 0.1058824, 1, 0, 1,
-0.5361412, -1.562585, -2.098344, 0.09803922, 1, 0, 1,
-0.5351951, 0.7525017, -0.8727813, 0.09019608, 1, 0, 1,
-0.5331747, -1.640547, -3.31746, 0.08627451, 1, 0, 1,
-0.5316377, 0.6514537, -0.6053404, 0.07843138, 1, 0, 1,
-0.5315498, 0.378745, -1.974885, 0.07450981, 1, 0, 1,
-0.5287307, -0.2913986, -1.138, 0.06666667, 1, 0, 1,
-0.5286479, -0.8940586, -1.71896, 0.0627451, 1, 0, 1,
-0.5158092, -0.1429671, -1.869687, 0.05490196, 1, 0, 1,
-0.5107703, 1.366529, -1.567435, 0.05098039, 1, 0, 1,
-0.5079023, 1.511578, -0.4779368, 0.04313726, 1, 0, 1,
-0.481159, 1.260084, 0.3781117, 0.03921569, 1, 0, 1,
-0.481029, -0.17545, -2.482195, 0.03137255, 1, 0, 1,
-0.4781996, -0.9044722, -4.377198, 0.02745098, 1, 0, 1,
-0.4779567, 0.6724348, -1.64077, 0.01960784, 1, 0, 1,
-0.4728265, 0.7073496, 0.5893933, 0.01568628, 1, 0, 1,
-0.4707779, 0.5182871, -1.374543, 0.007843138, 1, 0, 1,
-0.4663598, -1.238857, -3.422934, 0.003921569, 1, 0, 1,
-0.4581951, 0.1099379, 0.02261925, 0, 1, 0.003921569, 1,
-0.4559515, -0.4395648, -2.593174, 0, 1, 0.01176471, 1,
-0.4549632, -0.8888968, -3.100114, 0, 1, 0.01568628, 1,
-0.4545718, -1.186031, -4.668417, 0, 1, 0.02352941, 1,
-0.4545589, -0.2618653, -0.5833591, 0, 1, 0.02745098, 1,
-0.4501996, 0.7005484, -0.6287898, 0, 1, 0.03529412, 1,
-0.4475161, -0.1124383, -3.470169, 0, 1, 0.03921569, 1,
-0.4447417, -0.6515163, -1.56585, 0, 1, 0.04705882, 1,
-0.4379502, 0.04162933, -0.5610667, 0, 1, 0.05098039, 1,
-0.4359053, -1.475038, -2.61504, 0, 1, 0.05882353, 1,
-0.4355461, -0.8541816, -2.61655, 0, 1, 0.0627451, 1,
-0.4315921, -1.373252, -2.634427, 0, 1, 0.07058824, 1,
-0.4270035, 1.126115, -0.7581816, 0, 1, 0.07450981, 1,
-0.4268791, -0.1892912, -2.111039, 0, 1, 0.08235294, 1,
-0.4255888, 0.5413091, -1.043324, 0, 1, 0.08627451, 1,
-0.4238706, 0.08787355, -0.9785962, 0, 1, 0.09411765, 1,
-0.4227271, 0.1932578, -0.9134631, 0, 1, 0.1019608, 1,
-0.4104468, 0.4552734, -0.02256725, 0, 1, 0.1058824, 1,
-0.4089052, -1.049223, -3.295197, 0, 1, 0.1137255, 1,
-0.4016375, -1.190706, -2.355717, 0, 1, 0.1176471, 1,
-0.4002659, -1.691573, -0.826933, 0, 1, 0.1254902, 1,
-0.4000529, 0.8744451, -1.789507, 0, 1, 0.1294118, 1,
-0.3958566, 0.1210502, 0.8547906, 0, 1, 0.1372549, 1,
-0.3892834, 1.022276, 0.2139434, 0, 1, 0.1411765, 1,
-0.3885626, -0.6988167, -4.205171, 0, 1, 0.1490196, 1,
-0.3876686, -0.7338859, -0.8542265, 0, 1, 0.1529412, 1,
-0.3858216, 0.06641275, -3.127846, 0, 1, 0.1607843, 1,
-0.3856359, 0.9882888, -1.727878, 0, 1, 0.1647059, 1,
-0.3804026, 0.4677596, -0.7023675, 0, 1, 0.172549, 1,
-0.3783539, 0.6821668, -1.214107, 0, 1, 0.1764706, 1,
-0.3689645, 1.855007, 0.7492093, 0, 1, 0.1843137, 1,
-0.3648063, -1.484298, -5.665208, 0, 1, 0.1882353, 1,
-0.3644418, -0.4729437, -3.098428, 0, 1, 0.1960784, 1,
-0.363681, 0.414744, 1.041914, 0, 1, 0.2039216, 1,
-0.3622074, -0.163553, -1.132719, 0, 1, 0.2078431, 1,
-0.3598566, 1.380367, -1.61279, 0, 1, 0.2156863, 1,
-0.3593747, 0.5607657, 0.7796435, 0, 1, 0.2196078, 1,
-0.3562225, -1.1269, -3.847035, 0, 1, 0.227451, 1,
-0.3521905, -0.962945, -3.888917, 0, 1, 0.2313726, 1,
-0.3518451, 0.8794665, -0.4932914, 0, 1, 0.2392157, 1,
-0.3516364, 0.7889643, -0.7082286, 0, 1, 0.2431373, 1,
-0.3514485, -0.5681137, -3.601039, 0, 1, 0.2509804, 1,
-0.3498145, -1.499139, -2.996733, 0, 1, 0.254902, 1,
-0.3476216, 0.2446506, -0.6863912, 0, 1, 0.2627451, 1,
-0.3396458, 1.148366, 0.5146911, 0, 1, 0.2666667, 1,
-0.3387744, -1.557127, -2.698488, 0, 1, 0.2745098, 1,
-0.3382024, -0.1759098, -2.647517, 0, 1, 0.2784314, 1,
-0.3346592, -1.163814, -3.296347, 0, 1, 0.2862745, 1,
-0.3321396, -0.1021435, -1.10311, 0, 1, 0.2901961, 1,
-0.3285676, -0.5418301, -1.352814, 0, 1, 0.2980392, 1,
-0.3268395, -1.423109, -1.752788, 0, 1, 0.3058824, 1,
-0.3258136, -0.290271, -4.180327, 0, 1, 0.3098039, 1,
-0.3235863, -0.09894019, -3.01193, 0, 1, 0.3176471, 1,
-0.322944, -0.5273514, -3.349869, 0, 1, 0.3215686, 1,
-0.3220841, 0.3415665, 0.1951385, 0, 1, 0.3294118, 1,
-0.3207775, 0.1369169, -1.218469, 0, 1, 0.3333333, 1,
-0.318029, 0.2080848, 0.6785945, 0, 1, 0.3411765, 1,
-0.3157673, -0.7796358, -2.51356, 0, 1, 0.345098, 1,
-0.3156749, 1.679838, -1.479029, 0, 1, 0.3529412, 1,
-0.3148983, -0.9154522, -1.492825, 0, 1, 0.3568628, 1,
-0.313325, -0.1849499, -0.1291047, 0, 1, 0.3647059, 1,
-0.3120635, -0.2059964, -4.060117, 0, 1, 0.3686275, 1,
-0.3042073, 0.05169742, -1.239104, 0, 1, 0.3764706, 1,
-0.2991857, -0.7726468, -1.902517, 0, 1, 0.3803922, 1,
-0.29836, 0.405805, 0.3384375, 0, 1, 0.3882353, 1,
-0.2912832, 0.5055501, -0.7544321, 0, 1, 0.3921569, 1,
-0.2852236, 0.2746335, 0.0497386, 0, 1, 0.4, 1,
-0.2847856, -0.7929128, -2.505302, 0, 1, 0.4078431, 1,
-0.2783067, -1.838043, -3.43451, 0, 1, 0.4117647, 1,
-0.2754833, -0.4872371, -2.100889, 0, 1, 0.4196078, 1,
-0.2693244, -0.1114999, -0.7431912, 0, 1, 0.4235294, 1,
-0.2683267, 0.2425152, 0.1305637, 0, 1, 0.4313726, 1,
-0.2661334, 0.4017897, -0.4200678, 0, 1, 0.4352941, 1,
-0.2655328, 0.275927, -0.3739016, 0, 1, 0.4431373, 1,
-0.2638112, 0.3240547, 0.5060475, 0, 1, 0.4470588, 1,
-0.2632645, 0.11127, -1.170112, 0, 1, 0.454902, 1,
-0.2572054, 1.852479, -2.124476, 0, 1, 0.4588235, 1,
-0.2524158, -1.147162, -1.281479, 0, 1, 0.4666667, 1,
-0.251352, 1.991165, -1.728581, 0, 1, 0.4705882, 1,
-0.2489134, -0.8914669, -2.853669, 0, 1, 0.4784314, 1,
-0.2479719, 1.49083, -0.550989, 0, 1, 0.4823529, 1,
-0.2468873, -0.1541473, -2.645601, 0, 1, 0.4901961, 1,
-0.241886, 1.198552, 0.06506197, 0, 1, 0.4941176, 1,
-0.2403827, 1.028508, 0.7116639, 0, 1, 0.5019608, 1,
-0.2346309, 0.8273312, 0.5520086, 0, 1, 0.509804, 1,
-0.2329459, 0.4291779, -0.04294668, 0, 1, 0.5137255, 1,
-0.2297917, -0.5644921, -2.634746, 0, 1, 0.5215687, 1,
-0.2290905, -2.11315, -3.700646, 0, 1, 0.5254902, 1,
-0.2270183, -1.160258, -6.161052, 0, 1, 0.5333334, 1,
-0.220024, 0.2666485, -0.3816822, 0, 1, 0.5372549, 1,
-0.2198326, -0.433102, -1.840302, 0, 1, 0.5450981, 1,
-0.2156328, -2.224342, -1.857091, 0, 1, 0.5490196, 1,
-0.206331, -0.5330983, -1.43651, 0, 1, 0.5568628, 1,
-0.2055647, -1.260856, -4.502798, 0, 1, 0.5607843, 1,
-0.2041759, -0.8285315, -2.307558, 0, 1, 0.5686275, 1,
-0.1938828, -0.8537588, -1.865842, 0, 1, 0.572549, 1,
-0.1840583, -0.3364138, -2.756374, 0, 1, 0.5803922, 1,
-0.1829707, -0.1002501, -2.652241, 0, 1, 0.5843138, 1,
-0.1826518, 0.8711938, -1.123414, 0, 1, 0.5921569, 1,
-0.1802723, 1.208786, -1.783294, 0, 1, 0.5960785, 1,
-0.1777285, -0.05035916, -1.6269, 0, 1, 0.6039216, 1,
-0.176832, -2.823792, -4.37806, 0, 1, 0.6117647, 1,
-0.176755, -0.9252852, -2.453, 0, 1, 0.6156863, 1,
-0.1758886, 0.06060247, -1.267364, 0, 1, 0.6235294, 1,
-0.1705518, -0.1218336, -2.696996, 0, 1, 0.627451, 1,
-0.1693637, -1.431802, -3.179902, 0, 1, 0.6352941, 1,
-0.1606276, 0.03589408, -0.9455474, 0, 1, 0.6392157, 1,
-0.1571171, -1.51506, -1.996941, 0, 1, 0.6470588, 1,
-0.1566369, 0.2792143, -0.1545529, 0, 1, 0.6509804, 1,
-0.1564735, 0.3898166, -1.51013, 0, 1, 0.6588235, 1,
-0.1559718, 1.254638, 0.5319852, 0, 1, 0.6627451, 1,
-0.1549731, -0.9966242, -3.065262, 0, 1, 0.6705883, 1,
-0.1522631, -0.6297224, -4.394217, 0, 1, 0.6745098, 1,
-0.1515647, 0.5906477, -1.388883, 0, 1, 0.682353, 1,
-0.1513904, -0.2617135, -3.148308, 0, 1, 0.6862745, 1,
-0.1443517, 1.385907, 0.3980322, 0, 1, 0.6941177, 1,
-0.1439847, -0.2443566, -2.008528, 0, 1, 0.7019608, 1,
-0.1421609, -0.1081182, -2.750273, 0, 1, 0.7058824, 1,
-0.1401784, -0.7309931, -3.911937, 0, 1, 0.7137255, 1,
-0.1386141, -2.404396, -4.29982, 0, 1, 0.7176471, 1,
-0.138104, 0.2768242, -1.785526, 0, 1, 0.7254902, 1,
-0.1379246, -0.9551588, -5.441036, 0, 1, 0.7294118, 1,
-0.1370237, -0.2874428, -1.283569, 0, 1, 0.7372549, 1,
-0.1329121, 1.365467, 1.570057, 0, 1, 0.7411765, 1,
-0.1315005, 1.399127, -1.30014, 0, 1, 0.7490196, 1,
-0.1267619, 0.1347625, 0.6693375, 0, 1, 0.7529412, 1,
-0.1239716, 1.617936, -0.436078, 0, 1, 0.7607843, 1,
-0.1209833, 1.020521, -0.1606068, 0, 1, 0.7647059, 1,
-0.1168951, 0.02455319, -2.996703, 0, 1, 0.772549, 1,
-0.1167384, -1.407844, -2.558656, 0, 1, 0.7764706, 1,
-0.1157628, 0.1250727, -0.2004363, 0, 1, 0.7843137, 1,
-0.1078199, -0.5417997, -2.253676, 0, 1, 0.7882353, 1,
-0.1074165, 2.094497, -0.2112353, 0, 1, 0.7960784, 1,
-0.09836324, -2.346132, -4.273475, 0, 1, 0.8039216, 1,
-0.08954372, -1.07067, -2.676739, 0, 1, 0.8078431, 1,
-0.0890495, 2.158275, 0.5960101, 0, 1, 0.8156863, 1,
-0.0890189, 2.178245, -1.141647, 0, 1, 0.8196079, 1,
-0.08869082, -0.5410827, -2.670992, 0, 1, 0.827451, 1,
-0.08786175, -0.2740203, -2.148525, 0, 1, 0.8313726, 1,
-0.08560092, -0.2701904, -4.201571, 0, 1, 0.8392157, 1,
-0.08311883, -1.342097, -3.333375, 0, 1, 0.8431373, 1,
-0.08175371, 0.01540803, -2.384846, 0, 1, 0.8509804, 1,
-0.08072946, 0.5146057, 1.174742, 0, 1, 0.854902, 1,
-0.08034276, -0.8173114, -2.646434, 0, 1, 0.8627451, 1,
-0.0770025, 0.8144178, -0.9017709, 0, 1, 0.8666667, 1,
-0.07627606, 0.3688659, -1.257327, 0, 1, 0.8745098, 1,
-0.07384386, 0.7939216, 0.03661705, 0, 1, 0.8784314, 1,
-0.07367254, -0.3746819, -1.833086, 0, 1, 0.8862745, 1,
-0.07328171, -0.5690832, -1.714518, 0, 1, 0.8901961, 1,
-0.07308658, -2.158776, -3.789422, 0, 1, 0.8980392, 1,
-0.06943808, 0.8310823, 1.15793, 0, 1, 0.9058824, 1,
-0.06926604, -0.4861107, -1.383911, 0, 1, 0.9098039, 1,
-0.06908334, -0.2294303, -4.393929, 0, 1, 0.9176471, 1,
-0.06783622, -0.9536695, -2.948103, 0, 1, 0.9215686, 1,
-0.06733026, -0.3961482, -4.224334, 0, 1, 0.9294118, 1,
-0.06457692, 2.084972, 0.7078486, 0, 1, 0.9333333, 1,
-0.0607918, -1.426388, -5.059909, 0, 1, 0.9411765, 1,
-0.05850951, -0.9819969, -5.260578, 0, 1, 0.945098, 1,
-0.05747822, 0.2829906, 0.1912488, 0, 1, 0.9529412, 1,
-0.0548697, -0.0900037, -3.362873, 0, 1, 0.9568627, 1,
-0.05183618, 0.3836149, -1.727219, 0, 1, 0.9647059, 1,
-0.0502316, 1.570742, -1.220645, 0, 1, 0.9686275, 1,
-0.045826, -1.435231, -1.980314, 0, 1, 0.9764706, 1,
-0.04326347, 0.8124884, -0.8530634, 0, 1, 0.9803922, 1,
-0.04205501, 0.05514781, 0.1964075, 0, 1, 0.9882353, 1,
-0.0408597, -1.795107, -2.041458, 0, 1, 0.9921569, 1,
-0.04031429, 1.201557, -0.1218239, 0, 1, 1, 1,
-0.03843157, 1.93893, -0.04325869, 0, 0.9921569, 1, 1,
-0.03744126, -0.08591901, -1.135171, 0, 0.9882353, 1, 1,
-0.03571227, -1.104218, -2.872153, 0, 0.9803922, 1, 1,
-0.03121364, -1.575818, -1.132635, 0, 0.9764706, 1, 1,
-0.02895791, -0.07300642, -2.459117, 0, 0.9686275, 1, 1,
-0.02720116, -0.7511712, -2.324761, 0, 0.9647059, 1, 1,
-0.02216123, -0.3971547, -2.824675, 0, 0.9568627, 1, 1,
-0.01964546, 1.378453, 0.576804, 0, 0.9529412, 1, 1,
-0.01917067, 0.2250146, -0.9416128, 0, 0.945098, 1, 1,
-0.01538797, 0.2804651, -0.8457921, 0, 0.9411765, 1, 1,
-0.01533436, 0.185959, -0.579468, 0, 0.9333333, 1, 1,
-0.006522032, 0.05444591, -0.9055661, 0, 0.9294118, 1, 1,
-0.002067383, -0.9758679, -2.876724, 0, 0.9215686, 1, 1,
-0.0008983309, -0.8355476, -2.523653, 0, 0.9176471, 1, 1,
0.0004810278, 1.282705, 1.784887, 0, 0.9098039, 1, 1,
0.001756423, 0.6335577, 0.685855, 0, 0.9058824, 1, 1,
0.003296737, 1.501647, -2.245283, 0, 0.8980392, 1, 1,
0.005485153, 1.300912, 0.4390108, 0, 0.8901961, 1, 1,
0.007166153, 0.05088605, -0.397588, 0, 0.8862745, 1, 1,
0.01230497, 0.5311856, 0.9875523, 0, 0.8784314, 1, 1,
0.01786249, -0.7433323, 3.674139, 0, 0.8745098, 1, 1,
0.01836756, -0.5318076, 3.43045, 0, 0.8666667, 1, 1,
0.01847318, 1.049879, -1.475251, 0, 0.8627451, 1, 1,
0.01959086, -0.6321223, 4.035307, 0, 0.854902, 1, 1,
0.02050293, -0.06845329, 2.14102, 0, 0.8509804, 1, 1,
0.021477, 1.081137, 1.153175, 0, 0.8431373, 1, 1,
0.02219166, -0.7009371, 2.661872, 0, 0.8392157, 1, 1,
0.02487393, -0.326622, 3.991788, 0, 0.8313726, 1, 1,
0.02652109, 1.37467, 2.164254, 0, 0.827451, 1, 1,
0.02877485, -0.4547189, 3.168566, 0, 0.8196079, 1, 1,
0.02970204, 0.3452073, -0.3809464, 0, 0.8156863, 1, 1,
0.03389331, -1.187818, 4.229203, 0, 0.8078431, 1, 1,
0.034491, 0.1929397, 1.269446, 0, 0.8039216, 1, 1,
0.03452691, 0.5843846, 1.817968, 0, 0.7960784, 1, 1,
0.03809413, 2.876116, -0.2553646, 0, 0.7882353, 1, 1,
0.0386209, 1.618128, 0.9157074, 0, 0.7843137, 1, 1,
0.03930795, -1.216736, 2.539691, 0, 0.7764706, 1, 1,
0.03978108, 1.390727, 0.599984, 0, 0.772549, 1, 1,
0.04187577, -0.6447617, 1.009646, 0, 0.7647059, 1, 1,
0.0463569, 0.0358557, 0.9451999, 0, 0.7607843, 1, 1,
0.04820993, -0.4166318, 4.020013, 0, 0.7529412, 1, 1,
0.04932142, 1.259447, 0.4194648, 0, 0.7490196, 1, 1,
0.04936095, -0.7882886, 3.175321, 0, 0.7411765, 1, 1,
0.05046194, -1.277242, 4.940259, 0, 0.7372549, 1, 1,
0.0573125, 0.335417, -0.4512835, 0, 0.7294118, 1, 1,
0.05800406, -0.6995707, 3.589129, 0, 0.7254902, 1, 1,
0.06633687, 0.3562952, 0.9521844, 0, 0.7176471, 1, 1,
0.06739956, 1.33033, -0.4367968, 0, 0.7137255, 1, 1,
0.06913066, 0.2993875, 0.8301935, 0, 0.7058824, 1, 1,
0.07047325, 1.201153, 0.9605368, 0, 0.6980392, 1, 1,
0.07108971, -1.597438, 4.821974, 0, 0.6941177, 1, 1,
0.07179352, 0.7239388, 0.6804534, 0, 0.6862745, 1, 1,
0.07240843, -0.5545279, 4.208002, 0, 0.682353, 1, 1,
0.07254858, -0.4712338, 2.71259, 0, 0.6745098, 1, 1,
0.07281379, 0.8173352, -0.155723, 0, 0.6705883, 1, 1,
0.07414881, 1.510157, 0.9025083, 0, 0.6627451, 1, 1,
0.07598247, -0.54952, 2.965358, 0, 0.6588235, 1, 1,
0.08069409, 0.4971701, 0.9127796, 0, 0.6509804, 1, 1,
0.08174884, 0.01794081, 2.629597, 0, 0.6470588, 1, 1,
0.08298475, 1.438887, 0.7389926, 0, 0.6392157, 1, 1,
0.08316856, -0.4012512, 3.511623, 0, 0.6352941, 1, 1,
0.08337948, 1.290837, 0.2111109, 0, 0.627451, 1, 1,
0.08344313, 1.023408, -0.09989687, 0, 0.6235294, 1, 1,
0.08405934, -0.677564, 3.086465, 0, 0.6156863, 1, 1,
0.08545852, -0.05218573, 4.17769, 0, 0.6117647, 1, 1,
0.08622666, -0.5301679, 5.033356, 0, 0.6039216, 1, 1,
0.08679785, -0.464164, 3.036289, 0, 0.5960785, 1, 1,
0.08915646, -1.01594, 3.564588, 0, 0.5921569, 1, 1,
0.09484342, -1.366284, 2.816681, 0, 0.5843138, 1, 1,
0.09486061, 0.6481565, 0.3100743, 0, 0.5803922, 1, 1,
0.1003632, 2.193401, 1.532133, 0, 0.572549, 1, 1,
0.1027752, -1.218351, 2.71674, 0, 0.5686275, 1, 1,
0.1030138, -1.102912, 3.381609, 0, 0.5607843, 1, 1,
0.1031104, -0.3260418, 3.390288, 0, 0.5568628, 1, 1,
0.1045118, -0.2811741, 2.995342, 0, 0.5490196, 1, 1,
0.1054802, 0.02053917, 3.606309, 0, 0.5450981, 1, 1,
0.1096845, -1.546042, 1.77015, 0, 0.5372549, 1, 1,
0.1114227, 1.07391, -0.0986148, 0, 0.5333334, 1, 1,
0.1125508, 1.459401, -0.2982836, 0, 0.5254902, 1, 1,
0.1253515, 0.2833349, -0.3563076, 0, 0.5215687, 1, 1,
0.1290663, -0.3147722, 2.096824, 0, 0.5137255, 1, 1,
0.1301109, -0.3552783, 2.780231, 0, 0.509804, 1, 1,
0.1328475, -0.4850327, 1.924187, 0, 0.5019608, 1, 1,
0.1363134, -0.8295195, 4.864672, 0, 0.4941176, 1, 1,
0.1363534, 0.710302, 1.245103, 0, 0.4901961, 1, 1,
0.1405082, 2.440651, 0.5399044, 0, 0.4823529, 1, 1,
0.1474427, -0.6587316, 2.118575, 0, 0.4784314, 1, 1,
0.1506957, -1.729429, 4.960049, 0, 0.4705882, 1, 1,
0.1524357, 1.290181, -0.6074639, 0, 0.4666667, 1, 1,
0.1549724, 0.368269, 0.1566504, 0, 0.4588235, 1, 1,
0.1567436, -0.5628974, 2.626995, 0, 0.454902, 1, 1,
0.1590806, 1.492772, 1.663079, 0, 0.4470588, 1, 1,
0.159849, 0.5461386, 1.28776, 0, 0.4431373, 1, 1,
0.1619491, 0.2892542, -0.2453927, 0, 0.4352941, 1, 1,
0.1625518, 1.495834, 0.565534, 0, 0.4313726, 1, 1,
0.1675365, 0.1251457, 2.36823, 0, 0.4235294, 1, 1,
0.1703178, -0.9112052, 2.598267, 0, 0.4196078, 1, 1,
0.1705022, -0.3698691, 1.981937, 0, 0.4117647, 1, 1,
0.1759883, -0.01308274, 2.316096, 0, 0.4078431, 1, 1,
0.1774367, 0.04951504, 1.105225, 0, 0.4, 1, 1,
0.1853838, -0.2445495, 3.622796, 0, 0.3921569, 1, 1,
0.2025317, 0.2649671, 1.200698, 0, 0.3882353, 1, 1,
0.204989, -0.6408498, 3.887818, 0, 0.3803922, 1, 1,
0.2072795, -0.04838116, 3.199015, 0, 0.3764706, 1, 1,
0.2076656, 1.131225, -0.329827, 0, 0.3686275, 1, 1,
0.2083837, 0.5122809, 1.452647, 0, 0.3647059, 1, 1,
0.2111169, -1.161241, 4.007641, 0, 0.3568628, 1, 1,
0.2132831, 1.133955, -0.5134795, 0, 0.3529412, 1, 1,
0.2161579, 0.7347401, 0.5340967, 0, 0.345098, 1, 1,
0.2193858, -1.165936, 4.600819, 0, 0.3411765, 1, 1,
0.2212323, 0.7375342, 0.4848651, 0, 0.3333333, 1, 1,
0.2254513, 1.056186, -0.9447291, 0, 0.3294118, 1, 1,
0.2293162, -0.7223058, 1.428073, 0, 0.3215686, 1, 1,
0.2293942, -0.4064574, 2.438474, 0, 0.3176471, 1, 1,
0.2294322, 0.4802756, 1.130398, 0, 0.3098039, 1, 1,
0.2339988, 0.1211437, 0.4510134, 0, 0.3058824, 1, 1,
0.2380389, -0.7278612, 2.535592, 0, 0.2980392, 1, 1,
0.2406413, -1.253267, 2.811178, 0, 0.2901961, 1, 1,
0.2456732, 0.5527564, -2.024311, 0, 0.2862745, 1, 1,
0.2471111, -2.140948, 2.147242, 0, 0.2784314, 1, 1,
0.2476331, 0.1509545, -1.863505, 0, 0.2745098, 1, 1,
0.2497015, 0.01214299, 2.435573, 0, 0.2666667, 1, 1,
0.251563, -0.2861634, 2.85038, 0, 0.2627451, 1, 1,
0.2662592, -1.442968, 5.029861, 0, 0.254902, 1, 1,
0.2692349, -1.032105, 1.786177, 0, 0.2509804, 1, 1,
0.2735072, -1.692297, 3.014599, 0, 0.2431373, 1, 1,
0.2763303, 0.3473581, 1.264234, 0, 0.2392157, 1, 1,
0.2791338, -0.4232564, 3.219322, 0, 0.2313726, 1, 1,
0.2803018, -1.059677, 2.606192, 0, 0.227451, 1, 1,
0.2844884, -1.736502, 4.37195, 0, 0.2196078, 1, 1,
0.2902935, 0.3644077, 1.268612, 0, 0.2156863, 1, 1,
0.2903788, 0.4071337, 0.7048171, 0, 0.2078431, 1, 1,
0.2915783, -0.9747117, 3.455168, 0, 0.2039216, 1, 1,
0.3013013, -1.367504, 0.9691565, 0, 0.1960784, 1, 1,
0.303912, -0.9671263, 3.277541, 0, 0.1882353, 1, 1,
0.3073628, -0.6680894, 3.079805, 0, 0.1843137, 1, 1,
0.3076574, 0.1396963, 1.669708, 0, 0.1764706, 1, 1,
0.3080504, 1.090993, -0.3882698, 0, 0.172549, 1, 1,
0.3146794, -0.4284079, 1.890366, 0, 0.1647059, 1, 1,
0.3153501, 0.5080146, -0.0292665, 0, 0.1607843, 1, 1,
0.3183915, -1.792898, 1.940027, 0, 0.1529412, 1, 1,
0.3197787, -0.2281449, 2.731573, 0, 0.1490196, 1, 1,
0.3211232, 0.4978375, 1.118822, 0, 0.1411765, 1, 1,
0.3262392, 1.636864, 0.01794393, 0, 0.1372549, 1, 1,
0.3266904, -0.8687316, 3.401901, 0, 0.1294118, 1, 1,
0.3271253, 0.1843306, 2.01754, 0, 0.1254902, 1, 1,
0.3321921, -0.01023929, 0.7880156, 0, 0.1176471, 1, 1,
0.3331981, -0.9472199, 1.282017, 0, 0.1137255, 1, 1,
0.3360519, 0.5677355, 0.8961647, 0, 0.1058824, 1, 1,
0.3363549, 1.918259, 0.0397515, 0, 0.09803922, 1, 1,
0.344154, 0.8146675, 1.926095, 0, 0.09411765, 1, 1,
0.348184, 0.446916, 1.179219, 0, 0.08627451, 1, 1,
0.348943, -0.1057989, 1.384232, 0, 0.08235294, 1, 1,
0.3533334, 0.271661, 2.012246, 0, 0.07450981, 1, 1,
0.3561378, 1.195578, 0.09026935, 0, 0.07058824, 1, 1,
0.3586206, 1.235049, 1.082054, 0, 0.0627451, 1, 1,
0.3610948, -0.9790726, 3.056278, 0, 0.05882353, 1, 1,
0.3624737, 1.075052, 0.7651919, 0, 0.05098039, 1, 1,
0.3627972, -0.9490491, 2.325922, 0, 0.04705882, 1, 1,
0.3638878, 0.3095974, 1.19944, 0, 0.03921569, 1, 1,
0.3742274, 0.07216813, 1.961518, 0, 0.03529412, 1, 1,
0.3757558, -0.01607773, 1.844169, 0, 0.02745098, 1, 1,
0.3780515, 2.296119, -0.8264561, 0, 0.02352941, 1, 1,
0.3789439, 0.5438316, -0.5460241, 0, 0.01568628, 1, 1,
0.3823059, 1.276554, 0.5937629, 0, 0.01176471, 1, 1,
0.3833243, -1.190769, 3.000574, 0, 0.003921569, 1, 1,
0.3844744, 0.3756242, 3.460915, 0.003921569, 0, 1, 1,
0.3911486, -0.9038812, 2.813473, 0.007843138, 0, 1, 1,
0.3931481, -0.006232345, 0.3021615, 0.01568628, 0, 1, 1,
0.3953988, -1.098631, 2.765567, 0.01960784, 0, 1, 1,
0.3989517, 0.8125585, -0.08476058, 0.02745098, 0, 1, 1,
0.4059408, 0.4947297, 1.368072, 0.03137255, 0, 1, 1,
0.4088509, -1.397532, 3.172749, 0.03921569, 0, 1, 1,
0.4119215, 1.123291, 1.803982, 0.04313726, 0, 1, 1,
0.4179785, 0.3802682, -0.1515571, 0.05098039, 0, 1, 1,
0.419201, 1.778267, 0.512197, 0.05490196, 0, 1, 1,
0.41991, -1.437871, 1.631385, 0.0627451, 0, 1, 1,
0.4224187, -0.08051358, 0.9518891, 0.06666667, 0, 1, 1,
0.4232161, 1.353922, 1.612524, 0.07450981, 0, 1, 1,
0.4238268, 0.9237933, -1.663989, 0.07843138, 0, 1, 1,
0.4285968, -1.250207, 2.885024, 0.08627451, 0, 1, 1,
0.430575, -0.7436795, 2.253894, 0.09019608, 0, 1, 1,
0.4318911, 0.161205, 1.624975, 0.09803922, 0, 1, 1,
0.4326298, -1.005162, 3.309752, 0.1058824, 0, 1, 1,
0.4340119, -1.156721, 2.05439, 0.1098039, 0, 1, 1,
0.4434894, -1.259846, 2.385306, 0.1176471, 0, 1, 1,
0.4453075, -0.4840364, 3.121249, 0.1215686, 0, 1, 1,
0.4467518, 1.509086, 0.593619, 0.1294118, 0, 1, 1,
0.4477291, 0.308073, 0.07219726, 0.1333333, 0, 1, 1,
0.4517114, -1.84241, 1.463279, 0.1411765, 0, 1, 1,
0.4573034, 0.2188239, -1.543355, 0.145098, 0, 1, 1,
0.4587435, 1.01013, 1.144446, 0.1529412, 0, 1, 1,
0.4646266, -0.7711087, 1.817611, 0.1568628, 0, 1, 1,
0.4714144, 0.8800459, 0.1803232, 0.1647059, 0, 1, 1,
0.4732666, -1.797001, 4.475567, 0.1686275, 0, 1, 1,
0.4785635, -0.7732258, 0.9401115, 0.1764706, 0, 1, 1,
0.4815227, 0.558598, 0.7793048, 0.1803922, 0, 1, 1,
0.4854366, 0.4115351, 3.756767, 0.1882353, 0, 1, 1,
0.4879606, 1.02564, -0.9171867, 0.1921569, 0, 1, 1,
0.4889894, 0.5897794, -0.6624396, 0.2, 0, 1, 1,
0.491942, 0.01086554, 0.730206, 0.2078431, 0, 1, 1,
0.4935706, -0.4192336, 4.122197, 0.2117647, 0, 1, 1,
0.4967092, 0.1714023, 2.314214, 0.2196078, 0, 1, 1,
0.4983932, -0.6456918, 2.673098, 0.2235294, 0, 1, 1,
0.4999927, 1.556873, -1.830404, 0.2313726, 0, 1, 1,
0.5001822, -0.2780465, 2.831191, 0.2352941, 0, 1, 1,
0.5005897, -0.7912533, 1.893025, 0.2431373, 0, 1, 1,
0.5029842, 0.6868804, 1.948212, 0.2470588, 0, 1, 1,
0.5066099, 0.06893662, 3.42383, 0.254902, 0, 1, 1,
0.5126427, 0.7073356, 0.8379021, 0.2588235, 0, 1, 1,
0.5197197, 0.4481566, 1.551586, 0.2666667, 0, 1, 1,
0.5198386, -0.461131, 2.00423, 0.2705882, 0, 1, 1,
0.5357059, -0.910072, 3.153565, 0.2784314, 0, 1, 1,
0.5436532, -1.462878, 3.476099, 0.282353, 0, 1, 1,
0.543869, 0.6688351, -0.2815175, 0.2901961, 0, 1, 1,
0.5461735, 1.139701, 1.00192, 0.2941177, 0, 1, 1,
0.5538043, -0.008422399, -0.09962376, 0.3019608, 0, 1, 1,
0.5583429, 0.3479151, 0.8194252, 0.3098039, 0, 1, 1,
0.5602408, 0.6599131, 1.664305, 0.3137255, 0, 1, 1,
0.570644, 0.3988857, -1.669327, 0.3215686, 0, 1, 1,
0.5725856, 1.403706, -0.3105825, 0.3254902, 0, 1, 1,
0.5798486, -1.116123, 2.411914, 0.3333333, 0, 1, 1,
0.5879033, 1.680438, 1.605398, 0.3372549, 0, 1, 1,
0.5887011, 2.44773, -0.2320292, 0.345098, 0, 1, 1,
0.5960371, 0.2822036, 1.08578, 0.3490196, 0, 1, 1,
0.601696, 0.940069, 0.1797805, 0.3568628, 0, 1, 1,
0.6063696, -0.6255295, 0.9144585, 0.3607843, 0, 1, 1,
0.6101783, -0.4492248, 3.667048, 0.3686275, 0, 1, 1,
0.6102992, -1.515701, 3.35954, 0.372549, 0, 1, 1,
0.6112409, 0.3522176, 0.4631646, 0.3803922, 0, 1, 1,
0.615182, -0.4774504, 2.658503, 0.3843137, 0, 1, 1,
0.6171688, -0.6956017, 2.929241, 0.3921569, 0, 1, 1,
0.6193842, 0.1086448, 1.421327, 0.3960784, 0, 1, 1,
0.6216092, -1.73374, 1.316391, 0.4039216, 0, 1, 1,
0.6219466, 0.6726137, 2.935642, 0.4117647, 0, 1, 1,
0.6260469, 0.2864639, 1.979277, 0.4156863, 0, 1, 1,
0.6268966, 0.5784622, 0.1212932, 0.4235294, 0, 1, 1,
0.6275415, 0.8312556, 1.907552, 0.427451, 0, 1, 1,
0.6331018, -1.541627, 1.719604, 0.4352941, 0, 1, 1,
0.6351149, 0.5147022, 2.883826, 0.4392157, 0, 1, 1,
0.6363049, -0.8009325, 1.988132, 0.4470588, 0, 1, 1,
0.6377009, -2.107597, 4.232619, 0.4509804, 0, 1, 1,
0.6406144, 0.1028296, -0.9208246, 0.4588235, 0, 1, 1,
0.6407542, 0.7465683, 0.951581, 0.4627451, 0, 1, 1,
0.6420469, -0.9362546, 2.768014, 0.4705882, 0, 1, 1,
0.6440232, -0.3226649, 3.009357, 0.4745098, 0, 1, 1,
0.6485862, -1.957025, 3.396713, 0.4823529, 0, 1, 1,
0.6489376, 0.4701536, 0.9378549, 0.4862745, 0, 1, 1,
0.6535915, 1.250693, 0.6981413, 0.4941176, 0, 1, 1,
0.6540126, -1.516575, 3.751685, 0.5019608, 0, 1, 1,
0.655006, -0.3770746, 2.545294, 0.5058824, 0, 1, 1,
0.660803, 0.6829976, -0.2319958, 0.5137255, 0, 1, 1,
0.6616416, -0.4063234, 3.044271, 0.5176471, 0, 1, 1,
0.6629058, -1.162128, 3.598738, 0.5254902, 0, 1, 1,
0.663734, -1.064255, 2.066822, 0.5294118, 0, 1, 1,
0.6676344, -1.502333, 3.009273, 0.5372549, 0, 1, 1,
0.6689433, 0.6065858, 1.555525, 0.5411765, 0, 1, 1,
0.6699143, -1.743382, 3.454751, 0.5490196, 0, 1, 1,
0.6700014, -0.7325685, 3.491047, 0.5529412, 0, 1, 1,
0.6700256, -0.9218778, 1.899153, 0.5607843, 0, 1, 1,
0.6713946, -0.0445458, 0.9860256, 0.5647059, 0, 1, 1,
0.6738026, 0.1687901, 2.079874, 0.572549, 0, 1, 1,
0.676335, -1.238436, 0.1420641, 0.5764706, 0, 1, 1,
0.6905273, -1.111794, 2.838283, 0.5843138, 0, 1, 1,
0.6985514, -0.28608, 0.6484105, 0.5882353, 0, 1, 1,
0.7032072, -0.9237213, 1.595697, 0.5960785, 0, 1, 1,
0.7045542, -0.6359817, 0.6038479, 0.6039216, 0, 1, 1,
0.7047052, -0.3908629, 1.230841, 0.6078432, 0, 1, 1,
0.7058126, -1.613297, 1.487673, 0.6156863, 0, 1, 1,
0.7059525, -0.1524433, 1.993132, 0.6196079, 0, 1, 1,
0.7085235, -0.1081905, 3.27595, 0.627451, 0, 1, 1,
0.7113568, -1.971889, 3.216171, 0.6313726, 0, 1, 1,
0.7126955, 0.6215008, 1.306126, 0.6392157, 0, 1, 1,
0.7184882, -0.6682527, 3.023932, 0.6431373, 0, 1, 1,
0.7208531, 0.5346776, 2.681228, 0.6509804, 0, 1, 1,
0.7227128, 1.766875, 1.68864, 0.654902, 0, 1, 1,
0.7252605, -1.263175, 3.065126, 0.6627451, 0, 1, 1,
0.7261736, 1.474741, 0.9121605, 0.6666667, 0, 1, 1,
0.7262934, -1.070156, 2.696021, 0.6745098, 0, 1, 1,
0.7283968, -1.015321, 3.096677, 0.6784314, 0, 1, 1,
0.729012, 0.8728667, 0.2011671, 0.6862745, 0, 1, 1,
0.7309142, 0.833497, -1.251358, 0.6901961, 0, 1, 1,
0.7311698, -1.171037, 1.626134, 0.6980392, 0, 1, 1,
0.7332144, -0.247337, 1.142937, 0.7058824, 0, 1, 1,
0.7343205, -1.125876, 0.8677309, 0.7098039, 0, 1, 1,
0.7343512, -0.2435447, -0.007628536, 0.7176471, 0, 1, 1,
0.740416, 0.7795559, -0.1644588, 0.7215686, 0, 1, 1,
0.7429702, -0.1674227, 0.1191588, 0.7294118, 0, 1, 1,
0.7511096, -0.242066, 1.834756, 0.7333333, 0, 1, 1,
0.7515837, -0.7327979, 0.1282423, 0.7411765, 0, 1, 1,
0.7527476, 0.2612871, 1.85824, 0.7450981, 0, 1, 1,
0.7529535, -0.4892465, 2.294382, 0.7529412, 0, 1, 1,
0.7532203, -0.2374804, 3.319885, 0.7568628, 0, 1, 1,
0.7555711, 1.210669, 0.683182, 0.7647059, 0, 1, 1,
0.7596508, 0.06475174, 0.9679271, 0.7686275, 0, 1, 1,
0.7603453, 1.437608, 0.9268056, 0.7764706, 0, 1, 1,
0.7615103, 0.5202621, 1.15542, 0.7803922, 0, 1, 1,
0.7642615, -1.870492, 0.8553776, 0.7882353, 0, 1, 1,
0.7658657, 0.9490021, -0.2895127, 0.7921569, 0, 1, 1,
0.7707213, 0.8257417, 1.57724, 0.8, 0, 1, 1,
0.7707964, 2.020452, -1.674327, 0.8078431, 0, 1, 1,
0.7726557, -0.1819644, 0.8203838, 0.8117647, 0, 1, 1,
0.7759236, 0.3533263, 0.292178, 0.8196079, 0, 1, 1,
0.7768801, -0.8317494, 1.753587, 0.8235294, 0, 1, 1,
0.7792465, -0.3037357, 1.980648, 0.8313726, 0, 1, 1,
0.7809481, -1.230361, 0.8182105, 0.8352941, 0, 1, 1,
0.7835109, -1.6123, 1.56029, 0.8431373, 0, 1, 1,
0.7846237, 1.976166, -0.6219283, 0.8470588, 0, 1, 1,
0.7899271, -0.2765823, 2.808648, 0.854902, 0, 1, 1,
0.7964849, -2.136969, 2.738175, 0.8588235, 0, 1, 1,
0.8129788, -0.6272882, 0.9707588, 0.8666667, 0, 1, 1,
0.8146486, -0.663651, 3.731593, 0.8705882, 0, 1, 1,
0.82121, 0.6597387, 0.09524897, 0.8784314, 0, 1, 1,
0.8288037, -0.6245323, 0.8292598, 0.8823529, 0, 1, 1,
0.8332551, 1.065227, 0.7898384, 0.8901961, 0, 1, 1,
0.8368589, 1.822489, 0.9874957, 0.8941177, 0, 1, 1,
0.8480916, -1.218117, 1.120931, 0.9019608, 0, 1, 1,
0.8512766, 0.5047556, 1.784558, 0.9098039, 0, 1, 1,
0.8593979, 0.3709497, 0.0654835, 0.9137255, 0, 1, 1,
0.8695207, 1.989347, 0.8199691, 0.9215686, 0, 1, 1,
0.8709735, 0.5757166, 2.319524, 0.9254902, 0, 1, 1,
0.8721029, 0.786761, 1.556557, 0.9333333, 0, 1, 1,
0.8730265, 0.8659983, 0.06483013, 0.9372549, 0, 1, 1,
0.875222, -0.8276254, 3.098482, 0.945098, 0, 1, 1,
0.8790959, -0.8000841, 2.464713, 0.9490196, 0, 1, 1,
0.8801873, 0.6960393, 0.9313653, 0.9568627, 0, 1, 1,
0.880415, 2.373383, -0.721828, 0.9607843, 0, 1, 1,
0.8849356, -0.4013849, 2.564761, 0.9686275, 0, 1, 1,
0.8880152, 0.7347082, -1.629737, 0.972549, 0, 1, 1,
0.9049653, -0.3618962, 0.9151706, 0.9803922, 0, 1, 1,
0.9094144, 1.269244, 0.1726991, 0.9843137, 0, 1, 1,
0.9100837, 1.362365, 0.1561579, 0.9921569, 0, 1, 1,
0.9155435, -0.4388928, 0.6198882, 0.9960784, 0, 1, 1,
0.9156315, 0.9737845, 0.653256, 1, 0, 0.9960784, 1,
0.92813, -2.549819, 2.133154, 1, 0, 0.9882353, 1,
0.9289215, 0.8260499, -0.03985719, 1, 0, 0.9843137, 1,
0.9295651, -0.9556128, 2.059623, 1, 0, 0.9764706, 1,
0.9317457, 0.6612249, 0.7742203, 1, 0, 0.972549, 1,
0.9381077, -0.4729917, 2.425736, 1, 0, 0.9647059, 1,
0.940118, 0.7058579, 0.8624174, 1, 0, 0.9607843, 1,
0.9422497, 0.4944357, 3.147656, 1, 0, 0.9529412, 1,
0.9450206, -0.4171165, 2.587284, 1, 0, 0.9490196, 1,
0.9462167, 0.7186999, 0.7111605, 1, 0, 0.9411765, 1,
0.9483661, 0.5634836, 0.1691356, 1, 0, 0.9372549, 1,
0.9509265, -0.677997, 1.728365, 1, 0, 0.9294118, 1,
0.9587909, -0.7251727, 1.974231, 1, 0, 0.9254902, 1,
0.9600152, -0.7588832, 2.717123, 1, 0, 0.9176471, 1,
0.9687968, 2.596802, 0.07938764, 1, 0, 0.9137255, 1,
0.9722002, 0.2111566, 1.127999, 1, 0, 0.9058824, 1,
0.9781511, 1.049081, -0.5922837, 1, 0, 0.9019608, 1,
0.9794342, 1.888383, 0.1066729, 1, 0, 0.8941177, 1,
0.9798281, -0.8155239, 1.009104, 1, 0, 0.8862745, 1,
0.9832468, 1.189009, -1.295717, 1, 0, 0.8823529, 1,
0.9916745, 0.5479332, 1.543986, 1, 0, 0.8745098, 1,
0.9934228, 0.7941704, -0.470917, 1, 0, 0.8705882, 1,
0.996273, -1.187374, 3.107423, 1, 0, 0.8627451, 1,
0.9981295, -0.1388578, 2.903092, 1, 0, 0.8588235, 1,
1.002527, -0.8837966, 2.775507, 1, 0, 0.8509804, 1,
1.008175, 0.6381532, 1.080716, 1, 0, 0.8470588, 1,
1.016963, -0.3931052, 1.537962, 1, 0, 0.8392157, 1,
1.019691, 0.3318812, 0.6600165, 1, 0, 0.8352941, 1,
1.028085, -1.561711, 3.477431, 1, 0, 0.827451, 1,
1.02815, -1.24174, 2.583998, 1, 0, 0.8235294, 1,
1.03061, 2.0882, 0.7683718, 1, 0, 0.8156863, 1,
1.031411, 0.2667693, 1.960292, 1, 0, 0.8117647, 1,
1.032285, -0.3381869, 1.786108, 1, 0, 0.8039216, 1,
1.035227, -1.013788, 0.6903099, 1, 0, 0.7960784, 1,
1.035309, -0.1599628, 1.774182, 1, 0, 0.7921569, 1,
1.040906, -0.1007472, 2.721295, 1, 0, 0.7843137, 1,
1.041062, -0.3617851, 2.457677, 1, 0, 0.7803922, 1,
1.044018, -0.3380662, 0.9067747, 1, 0, 0.772549, 1,
1.055213, -0.4957288, 0.7107679, 1, 0, 0.7686275, 1,
1.057889, -0.778748, 2.4697, 1, 0, 0.7607843, 1,
1.058868, -0.8354784, 2.365738, 1, 0, 0.7568628, 1,
1.063056, -0.1979499, 0.2871173, 1, 0, 0.7490196, 1,
1.073533, 0.1188294, -0.01994018, 1, 0, 0.7450981, 1,
1.079014, 0.93094, 0.8972066, 1, 0, 0.7372549, 1,
1.08976, 2.924207, 0.3376197, 1, 0, 0.7333333, 1,
1.103598, 1.962363, 1.039003, 1, 0, 0.7254902, 1,
1.105881, -1.022221, 2.782845, 1, 0, 0.7215686, 1,
1.10837, 0.8327631, 0.4265594, 1, 0, 0.7137255, 1,
1.121789, -2.012267, 3.20496, 1, 0, 0.7098039, 1,
1.133916, 0.5739007, -1.665487, 1, 0, 0.7019608, 1,
1.136369, 0.1583357, 0.4372122, 1, 0, 0.6941177, 1,
1.144497, 0.9197526, 1.138538, 1, 0, 0.6901961, 1,
1.151213, -1.106587, 1.002813, 1, 0, 0.682353, 1,
1.164511, 1.241607, 0.2209901, 1, 0, 0.6784314, 1,
1.174546, -0.985762, 2.052631, 1, 0, 0.6705883, 1,
1.179367, 0.2675078, 0.1144241, 1, 0, 0.6666667, 1,
1.182689, 0.5372177, 0.8931187, 1, 0, 0.6588235, 1,
1.186238, -0.3917442, 2.427347, 1, 0, 0.654902, 1,
1.201877, 0.1316427, 0.8861557, 1, 0, 0.6470588, 1,
1.202659, 1.417126, 0.7614684, 1, 0, 0.6431373, 1,
1.207158, 0.1178962, 1.582964, 1, 0, 0.6352941, 1,
1.211335, -0.2773229, 2.461013, 1, 0, 0.6313726, 1,
1.217, -0.06801208, 1.743525, 1, 0, 0.6235294, 1,
1.21895, -1.577082, 1.473714, 1, 0, 0.6196079, 1,
1.230505, -1.111414, 3.566578, 1, 0, 0.6117647, 1,
1.241366, 0.5474361, 1.697845, 1, 0, 0.6078432, 1,
1.245206, 0.2324764, 1.085776, 1, 0, 0.6, 1,
1.245333, 1.659477, -1.505784, 1, 0, 0.5921569, 1,
1.24667, 0.617636, 1.899306, 1, 0, 0.5882353, 1,
1.247255, 0.7150137, 0.9419718, 1, 0, 0.5803922, 1,
1.250436, 1.002484, -0.2665652, 1, 0, 0.5764706, 1,
1.266, -0.4682055, 1.349022, 1, 0, 0.5686275, 1,
1.266006, -1.375002, 0.9431922, 1, 0, 0.5647059, 1,
1.286605, -2.291404, 3.451839, 1, 0, 0.5568628, 1,
1.287389, -1.656872, 2.804778, 1, 0, 0.5529412, 1,
1.289167, -0.06422531, 1.143302, 1, 0, 0.5450981, 1,
1.289325, -1.6472, 5.081161, 1, 0, 0.5411765, 1,
1.293796, -0.4586192, 1.904741, 1, 0, 0.5333334, 1,
1.298942, 1.295275, 1.00497, 1, 0, 0.5294118, 1,
1.299305, -0.2304229, 0.3865443, 1, 0, 0.5215687, 1,
1.300844, -0.0499814, 1.647432, 1, 0, 0.5176471, 1,
1.309128, 0.6532606, 2.255301, 1, 0, 0.509804, 1,
1.313944, 0.916398, 1.798452, 1, 0, 0.5058824, 1,
1.317776, 0.1151136, 1.796017, 1, 0, 0.4980392, 1,
1.318339, -0.2873765, 2.172269, 1, 0, 0.4901961, 1,
1.319016, 0.844028, 1.857774, 1, 0, 0.4862745, 1,
1.323527, 1.521221, -0.1827561, 1, 0, 0.4784314, 1,
1.325875, -0.7398103, 1.994105, 1, 0, 0.4745098, 1,
1.327726, -0.7422462, 2.695305, 1, 0, 0.4666667, 1,
1.330399, 0.6893051, -0.004255167, 1, 0, 0.4627451, 1,
1.338698, -1.072936, 2.954945, 1, 0, 0.454902, 1,
1.339805, -1.248173, 3.575426, 1, 0, 0.4509804, 1,
1.340892, -0.08158374, 2.055242, 1, 0, 0.4431373, 1,
1.343848, -0.9063523, 3.366819, 1, 0, 0.4392157, 1,
1.35478, 1.062191, 2.471785, 1, 0, 0.4313726, 1,
1.364227, -0.3584306, 1.752406, 1, 0, 0.427451, 1,
1.371818, 0.7855896, 1.401346, 1, 0, 0.4196078, 1,
1.384932, -0.6131199, 2.814586, 1, 0, 0.4156863, 1,
1.404089, 0.4804675, 5.551288, 1, 0, 0.4078431, 1,
1.407793, 1.130719, 1.126999, 1, 0, 0.4039216, 1,
1.409637, -1.286761, 1.9378, 1, 0, 0.3960784, 1,
1.4246, 0.5045664, 0.7929128, 1, 0, 0.3882353, 1,
1.430836, 0.9871424, 0.03276695, 1, 0, 0.3843137, 1,
1.438657, -0.1785025, 4.025332, 1, 0, 0.3764706, 1,
1.43927, 0.8069496, 4.424211, 1, 0, 0.372549, 1,
1.444235, -2.210118, 2.839226, 1, 0, 0.3647059, 1,
1.464724, 0.2984505, 1.758877, 1, 0, 0.3607843, 1,
1.480894, -0.5161506, 1.21021, 1, 0, 0.3529412, 1,
1.513086, -1.348073, 1.195155, 1, 0, 0.3490196, 1,
1.516181, -1.276086, 2.471352, 1, 0, 0.3411765, 1,
1.519274, 0.006456825, 3.759233, 1, 0, 0.3372549, 1,
1.521318, 0.4110444, 1.391982, 1, 0, 0.3294118, 1,
1.526413, -1.372135, 0.4843598, 1, 0, 0.3254902, 1,
1.533781, -0.4823172, 0.5967337, 1, 0, 0.3176471, 1,
1.537977, 1.249725, -0.07578611, 1, 0, 0.3137255, 1,
1.53944, -0.6469764, 2.480757, 1, 0, 0.3058824, 1,
1.552543, 0.1310523, 2.417915, 1, 0, 0.2980392, 1,
1.558404, -0.84425, 0.4511667, 1, 0, 0.2941177, 1,
1.56996, -0.7384142, 1.504209, 1, 0, 0.2862745, 1,
1.58376, 0.5272715, 1.983269, 1, 0, 0.282353, 1,
1.592826, 0.5492476, -0.4735639, 1, 0, 0.2745098, 1,
1.595189, -0.5250068, 0.5543057, 1, 0, 0.2705882, 1,
1.610975, 1.777679, 1.316445, 1, 0, 0.2627451, 1,
1.612255, -0.3727452, 2.88289, 1, 0, 0.2588235, 1,
1.623079, -0.647884, 2.684719, 1, 0, 0.2509804, 1,
1.623297, 1.889346, 0.3370521, 1, 0, 0.2470588, 1,
1.638984, -1.07281, 1.286543, 1, 0, 0.2392157, 1,
1.64387, 1.300264, 0.2714868, 1, 0, 0.2352941, 1,
1.648626, 0.8388039, 0.2342697, 1, 0, 0.227451, 1,
1.669404, -0.3531695, 1.199712, 1, 0, 0.2235294, 1,
1.688356, 1.16601, 1.302302, 1, 0, 0.2156863, 1,
1.699502, -1.19612, 0.6302581, 1, 0, 0.2117647, 1,
1.719271, -3.008372, 2.443571, 1, 0, 0.2039216, 1,
1.749488, 0.2607387, 2.159082, 1, 0, 0.1960784, 1,
1.770526, 0.162773, 2.075916, 1, 0, 0.1921569, 1,
1.782, -0.5131772, 1.986071, 1, 0, 0.1843137, 1,
1.793904, -1.402684, 2.227537, 1, 0, 0.1803922, 1,
1.811247, -0.439523, 4.251177, 1, 0, 0.172549, 1,
1.821358, 0.5993224, 0.4236973, 1, 0, 0.1686275, 1,
1.822459, 0.9784623, 1.179348, 1, 0, 0.1607843, 1,
1.854024, -0.8493305, -0.6978089, 1, 0, 0.1568628, 1,
1.859767, 0.9109959, 0.7489775, 1, 0, 0.1490196, 1,
1.86264, -0.9772623, 0.7778896, 1, 0, 0.145098, 1,
1.86374, 1.00423, 0.1608766, 1, 0, 0.1372549, 1,
1.872406, 1.379463, -0.09115717, 1, 0, 0.1333333, 1,
1.87248, 1.148251, 0.1976977, 1, 0, 0.1254902, 1,
1.883648, 0.09117679, 1.832619, 1, 0, 0.1215686, 1,
1.892499, 1.312469, 1.532787, 1, 0, 0.1137255, 1,
1.90937, -1.106632, 1.467999, 1, 0, 0.1098039, 1,
1.919942, 0.6889967, 1.519846, 1, 0, 0.1019608, 1,
1.93594, -2.374343, 1.672077, 1, 0, 0.09411765, 1,
1.943416, -0.9858866, 1.707056, 1, 0, 0.09019608, 1,
1.976953, 2.081196, -0.2132834, 1, 0, 0.08235294, 1,
2.046918, 1.184245, 0.5068753, 1, 0, 0.07843138, 1,
2.053563, -0.4721971, 1.650678, 1, 0, 0.07058824, 1,
2.070084, 1.290468, 2.06584, 1, 0, 0.06666667, 1,
2.133414, 0.2158287, 2.143757, 1, 0, 0.05882353, 1,
2.148559, 0.750443, 3.558787, 1, 0, 0.05490196, 1,
2.185177, 1.16138, 0.7409692, 1, 0, 0.04705882, 1,
2.294573, 1.567211, 1.313108, 1, 0, 0.04313726, 1,
2.313128, -0.2590969, 1.086002, 1, 0, 0.03529412, 1,
2.497339, -0.6187116, 2.614471, 1, 0, 0.03137255, 1,
2.54605, 1.239663, 0.2636807, 1, 0, 0.02352941, 1,
2.565062, -0.6821223, 4.612899, 1, 0, 0.01960784, 1,
2.650968, 0.6310816, 0.9894748, 1, 0, 0.01176471, 1,
2.682715, -1.680256, 1.960756, 1, 0, 0.007843138, 1
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
-0.5755706, -4.013945, -8.146294, 0, -0.5, 0.5, 0.5,
-0.5755706, -4.013945, -8.146294, 1, -0.5, 0.5, 0.5,
-0.5755706, -4.013945, -8.146294, 1, 1.5, 0.5, 0.5,
-0.5755706, -4.013945, -8.146294, 0, 1.5, 0.5, 0.5
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
-4.938415, -0.04208279, -8.146294, 0, -0.5, 0.5, 0.5,
-4.938415, -0.04208279, -8.146294, 1, -0.5, 0.5, 0.5,
-4.938415, -0.04208279, -8.146294, 1, 1.5, 0.5, 0.5,
-4.938415, -0.04208279, -8.146294, 0, 1.5, 0.5, 0.5
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
-4.938415, -4.013945, -0.304882, 0, -0.5, 0.5, 0.5,
-4.938415, -4.013945, -0.304882, 1, -0.5, 0.5, 0.5,
-4.938415, -4.013945, -0.304882, 1, 1.5, 0.5, 0.5,
-4.938415, -4.013945, -0.304882, 0, 1.5, 0.5, 0.5
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
-3, -3.097361, -6.336737,
2, -3.097361, -6.336737,
-3, -3.097361, -6.336737,
-3, -3.250125, -6.63833,
-2, -3.097361, -6.336737,
-2, -3.250125, -6.63833,
-1, -3.097361, -6.336737,
-1, -3.250125, -6.63833,
0, -3.097361, -6.336737,
0, -3.250125, -6.63833,
1, -3.097361, -6.336737,
1, -3.250125, -6.63833,
2, -3.097361, -6.336737,
2, -3.250125, -6.63833
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
-3, -3.555653, -7.241515, 0, -0.5, 0.5, 0.5,
-3, -3.555653, -7.241515, 1, -0.5, 0.5, 0.5,
-3, -3.555653, -7.241515, 1, 1.5, 0.5, 0.5,
-3, -3.555653, -7.241515, 0, 1.5, 0.5, 0.5,
-2, -3.555653, -7.241515, 0, -0.5, 0.5, 0.5,
-2, -3.555653, -7.241515, 1, -0.5, 0.5, 0.5,
-2, -3.555653, -7.241515, 1, 1.5, 0.5, 0.5,
-2, -3.555653, -7.241515, 0, 1.5, 0.5, 0.5,
-1, -3.555653, -7.241515, 0, -0.5, 0.5, 0.5,
-1, -3.555653, -7.241515, 1, -0.5, 0.5, 0.5,
-1, -3.555653, -7.241515, 1, 1.5, 0.5, 0.5,
-1, -3.555653, -7.241515, 0, 1.5, 0.5, 0.5,
0, -3.555653, -7.241515, 0, -0.5, 0.5, 0.5,
0, -3.555653, -7.241515, 1, -0.5, 0.5, 0.5,
0, -3.555653, -7.241515, 1, 1.5, 0.5, 0.5,
0, -3.555653, -7.241515, 0, 1.5, 0.5, 0.5,
1, -3.555653, -7.241515, 0, -0.5, 0.5, 0.5,
1, -3.555653, -7.241515, 1, -0.5, 0.5, 0.5,
1, -3.555653, -7.241515, 1, 1.5, 0.5, 0.5,
1, -3.555653, -7.241515, 0, 1.5, 0.5, 0.5,
2, -3.555653, -7.241515, 0, -0.5, 0.5, 0.5,
2, -3.555653, -7.241515, 1, -0.5, 0.5, 0.5,
2, -3.555653, -7.241515, 1, 1.5, 0.5, 0.5,
2, -3.555653, -7.241515, 0, 1.5, 0.5, 0.5
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
-3.931605, -3, -6.336737,
-3.931605, 2, -6.336737,
-3.931605, -3, -6.336737,
-4.099406, -3, -6.63833,
-3.931605, -2, -6.336737,
-4.099406, -2, -6.63833,
-3.931605, -1, -6.336737,
-4.099406, -1, -6.63833,
-3.931605, 0, -6.336737,
-4.099406, 0, -6.63833,
-3.931605, 1, -6.336737,
-4.099406, 1, -6.63833,
-3.931605, 2, -6.336737,
-4.099406, 2, -6.63833
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
-4.43501, -3, -7.241515, 0, -0.5, 0.5, 0.5,
-4.43501, -3, -7.241515, 1, -0.5, 0.5, 0.5,
-4.43501, -3, -7.241515, 1, 1.5, 0.5, 0.5,
-4.43501, -3, -7.241515, 0, 1.5, 0.5, 0.5,
-4.43501, -2, -7.241515, 0, -0.5, 0.5, 0.5,
-4.43501, -2, -7.241515, 1, -0.5, 0.5, 0.5,
-4.43501, -2, -7.241515, 1, 1.5, 0.5, 0.5,
-4.43501, -2, -7.241515, 0, 1.5, 0.5, 0.5,
-4.43501, -1, -7.241515, 0, -0.5, 0.5, 0.5,
-4.43501, -1, -7.241515, 1, -0.5, 0.5, 0.5,
-4.43501, -1, -7.241515, 1, 1.5, 0.5, 0.5,
-4.43501, -1, -7.241515, 0, 1.5, 0.5, 0.5,
-4.43501, 0, -7.241515, 0, -0.5, 0.5, 0.5,
-4.43501, 0, -7.241515, 1, -0.5, 0.5, 0.5,
-4.43501, 0, -7.241515, 1, 1.5, 0.5, 0.5,
-4.43501, 0, -7.241515, 0, 1.5, 0.5, 0.5,
-4.43501, 1, -7.241515, 0, -0.5, 0.5, 0.5,
-4.43501, 1, -7.241515, 1, -0.5, 0.5, 0.5,
-4.43501, 1, -7.241515, 1, 1.5, 0.5, 0.5,
-4.43501, 1, -7.241515, 0, 1.5, 0.5, 0.5,
-4.43501, 2, -7.241515, 0, -0.5, 0.5, 0.5,
-4.43501, 2, -7.241515, 1, -0.5, 0.5, 0.5,
-4.43501, 2, -7.241515, 1, 1.5, 0.5, 0.5,
-4.43501, 2, -7.241515, 0, 1.5, 0.5, 0.5
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
-3.931605, -3.097361, -6,
-3.931605, -3.097361, 4,
-3.931605, -3.097361, -6,
-4.099406, -3.250125, -6,
-3.931605, -3.097361, -4,
-4.099406, -3.250125, -4,
-3.931605, -3.097361, -2,
-4.099406, -3.250125, -2,
-3.931605, -3.097361, 0,
-4.099406, -3.250125, 0,
-3.931605, -3.097361, 2,
-4.099406, -3.250125, 2,
-3.931605, -3.097361, 4,
-4.099406, -3.250125, 4
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
"-6",
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
-4.43501, -3.555653, -6, 0, -0.5, 0.5, 0.5,
-4.43501, -3.555653, -6, 1, -0.5, 0.5, 0.5,
-4.43501, -3.555653, -6, 1, 1.5, 0.5, 0.5,
-4.43501, -3.555653, -6, 0, 1.5, 0.5, 0.5,
-4.43501, -3.555653, -4, 0, -0.5, 0.5, 0.5,
-4.43501, -3.555653, -4, 1, -0.5, 0.5, 0.5,
-4.43501, -3.555653, -4, 1, 1.5, 0.5, 0.5,
-4.43501, -3.555653, -4, 0, 1.5, 0.5, 0.5,
-4.43501, -3.555653, -2, 0, -0.5, 0.5, 0.5,
-4.43501, -3.555653, -2, 1, -0.5, 0.5, 0.5,
-4.43501, -3.555653, -2, 1, 1.5, 0.5, 0.5,
-4.43501, -3.555653, -2, 0, 1.5, 0.5, 0.5,
-4.43501, -3.555653, 0, 0, -0.5, 0.5, 0.5,
-4.43501, -3.555653, 0, 1, -0.5, 0.5, 0.5,
-4.43501, -3.555653, 0, 1, 1.5, 0.5, 0.5,
-4.43501, -3.555653, 0, 0, 1.5, 0.5, 0.5,
-4.43501, -3.555653, 2, 0, -0.5, 0.5, 0.5,
-4.43501, -3.555653, 2, 1, -0.5, 0.5, 0.5,
-4.43501, -3.555653, 2, 1, 1.5, 0.5, 0.5,
-4.43501, -3.555653, 2, 0, 1.5, 0.5, 0.5,
-4.43501, -3.555653, 4, 0, -0.5, 0.5, 0.5,
-4.43501, -3.555653, 4, 1, -0.5, 0.5, 0.5,
-4.43501, -3.555653, 4, 1, 1.5, 0.5, 0.5,
-4.43501, -3.555653, 4, 0, 1.5, 0.5, 0.5
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
-3.931605, -3.097361, -6.336737,
-3.931605, 3.013196, -6.336737,
-3.931605, -3.097361, 5.726973,
-3.931605, 3.013196, 5.726973,
-3.931605, -3.097361, -6.336737,
-3.931605, -3.097361, 5.726973,
-3.931605, 3.013196, -6.336737,
-3.931605, 3.013196, 5.726973,
-3.931605, -3.097361, -6.336737,
2.780463, -3.097361, -6.336737,
-3.931605, -3.097361, 5.726973,
2.780463, -3.097361, 5.726973,
-3.931605, 3.013196, -6.336737,
2.780463, 3.013196, -6.336737,
-3.931605, 3.013196, 5.726973,
2.780463, 3.013196, 5.726973,
2.780463, -3.097361, -6.336737,
2.780463, 3.013196, -6.336737,
2.780463, -3.097361, 5.726973,
2.780463, 3.013196, 5.726973,
2.780463, -3.097361, -6.336737,
2.780463, -3.097361, 5.726973,
2.780463, 3.013196, -6.336737,
2.780463, 3.013196, 5.726973
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
var radius = 8.061583;
var distance = 35.86689;
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
mvMatrix.translate( 0.5755706, 0.04208279, 0.304882 );
mvMatrix.scale( 1.298607, 1.42644, 0.7225258 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.86689);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Captafol<-read.table("Captafol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Captafol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Captafol' not found
```

```r
y<-Captafol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Captafol' not found
```

```r
z<-Captafol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Captafol' not found
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
-3.833856, 0.01805094, 1.042119, 0, 0, 1, 1, 1,
-3.00604, -0.669652, -1.922444, 1, 0, 0, 1, 1,
-2.898619, 0.7952119, -0.7842022, 1, 0, 0, 1, 1,
-2.799771, 1.119566, 2.311841, 1, 0, 0, 1, 1,
-2.768007, -0.3361104, -2.263213, 1, 0, 0, 1, 1,
-2.754862, -1.283465, -1.499622, 1, 0, 0, 1, 1,
-2.680176, 0.9983028, -0.8496001, 0, 0, 0, 1, 1,
-2.676611, 0.597761, -4.438765, 0, 0, 0, 1, 1,
-2.6527, 0.8039734, -2.682949, 0, 0, 0, 1, 1,
-2.416982, 1.414199, -1.003566, 0, 0, 0, 1, 1,
-2.408208, -0.8894926, -1.438253, 0, 0, 0, 1, 1,
-2.397496, 2.809729, -1.423616, 0, 0, 0, 1, 1,
-2.396506, 1.995855, -0.7739125, 0, 0, 0, 1, 1,
-2.341879, -0.664044, -2.593936, 1, 1, 1, 1, 1,
-2.332267, -0.3169466, -0.9190266, 1, 1, 1, 1, 1,
-2.316609, 1.46432, -0.04162738, 1, 1, 1, 1, 1,
-2.287908, 2.00609, -0.4835442, 1, 1, 1, 1, 1,
-2.198738, -0.8939807, -2.895633, 1, 1, 1, 1, 1,
-2.168473, 0.3168809, -2.527076, 1, 1, 1, 1, 1,
-2.140703, -2.608331, -2.335704, 1, 1, 1, 1, 1,
-2.090193, -0.3554371, -1.427057, 1, 1, 1, 1, 1,
-2.07045, -1.480018, -2.141189, 1, 1, 1, 1, 1,
-2.054577, 1.525029, 0.04637955, 1, 1, 1, 1, 1,
-2.038142, 0.2033071, -2.209426, 1, 1, 1, 1, 1,
-2.0312, -0.802048, -3.279455, 1, 1, 1, 1, 1,
-2.010477, -0.3737802, -2.068558, 1, 1, 1, 1, 1,
-2.008074, 0.7848916, -1.738917, 1, 1, 1, 1, 1,
-1.982598, -0.9623639, -3.020723, 1, 1, 1, 1, 1,
-1.967513, 1.190266, 0.3413976, 0, 0, 1, 1, 1,
-1.966343, -1.164417, -2.25128, 1, 0, 0, 1, 1,
-1.949582, -2.018861, -2.809838, 1, 0, 0, 1, 1,
-1.924152, -1.220779, -2.27126, 1, 0, 0, 1, 1,
-1.914163, 0.5975968, -0.1833415, 1, 0, 0, 1, 1,
-1.897821, -0.6277132, -2.759563, 1, 0, 0, 1, 1,
-1.894411, 0.1532664, -2.816027, 0, 0, 0, 1, 1,
-1.867661, -1.159708, -3.135524, 0, 0, 0, 1, 1,
-1.860483, 0.4492061, 0.1416191, 0, 0, 0, 1, 1,
-1.850149, -0.2086578, -0.8438557, 0, 0, 0, 1, 1,
-1.847736, -0.8823524, -0.07860957, 0, 0, 0, 1, 1,
-1.817419, -1.022758, -2.176586, 0, 0, 0, 1, 1,
-1.811266, -0.222371, -2.277972, 0, 0, 0, 1, 1,
-1.803936, 0.879317, -1.41618, 1, 1, 1, 1, 1,
-1.801224, 0.4228433, -3.982576, 1, 1, 1, 1, 1,
-1.793043, -2.459132, -3.628155, 1, 1, 1, 1, 1,
-1.762943, -0.7190317, -1.878597, 1, 1, 1, 1, 1,
-1.758949, -0.7677272, -3.098384, 1, 1, 1, 1, 1,
-1.732067, 1.258791, -0.700466, 1, 1, 1, 1, 1,
-1.730845, -0.8164764, 0.8309262, 1, 1, 1, 1, 1,
-1.727688, 0.2134099, -1.32253, 1, 1, 1, 1, 1,
-1.726813, -1.316341, -3.005484, 1, 1, 1, 1, 1,
-1.725653, -0.2823337, -1.372949, 1, 1, 1, 1, 1,
-1.721906, 0.615457, -2.207917, 1, 1, 1, 1, 1,
-1.720035, -0.2443519, -2.366436, 1, 1, 1, 1, 1,
-1.718689, -0.4322043, -2.627545, 1, 1, 1, 1, 1,
-1.697375, -1.895429, -3.321458, 1, 1, 1, 1, 1,
-1.691516, 1.363422, -1.63987, 1, 1, 1, 1, 1,
-1.682816, -0.04690645, -1.679732, 0, 0, 1, 1, 1,
-1.672379, 1.061872, -1.846648, 1, 0, 0, 1, 1,
-1.671131, -0.4142824, -0.7530651, 1, 0, 0, 1, 1,
-1.640954, 2.707371, 1.244573, 1, 0, 0, 1, 1,
-1.636664, -0.4157383, -2.153485, 1, 0, 0, 1, 1,
-1.612006, -1.05586, -2.233746, 1, 0, 0, 1, 1,
-1.612005, -2.036915, -2.572405, 0, 0, 0, 1, 1,
-1.603608, -2.186581, -1.779827, 0, 0, 0, 1, 1,
-1.59799, 0.6116124, -1.207371, 0, 0, 0, 1, 1,
-1.584566, -0.03899295, -3.549206, 0, 0, 0, 1, 1,
-1.530259, -1.910209, -2.776217, 0, 0, 0, 1, 1,
-1.52818, 0.5513886, -0.3866258, 0, 0, 0, 1, 1,
-1.525583, 0.8249262, 0.3849502, 0, 0, 0, 1, 1,
-1.525565, 1.079568, -0.1168883, 1, 1, 1, 1, 1,
-1.515106, -1.006226, -0.5250433, 1, 1, 1, 1, 1,
-1.498171, -0.05424112, -0.8183014, 1, 1, 1, 1, 1,
-1.497385, 2.105603, -1.708987, 1, 1, 1, 1, 1,
-1.489708, -1.037375, -2.308446, 1, 1, 1, 1, 1,
-1.473394, -0.2764797, -2.273561, 1, 1, 1, 1, 1,
-1.46218, 0.2374059, -2.120738, 1, 1, 1, 1, 1,
-1.45421, 1.488678, 0.4781872, 1, 1, 1, 1, 1,
-1.452926, 0.972687, 0.1437182, 1, 1, 1, 1, 1,
-1.447282, 0.7534226, -1.54703, 1, 1, 1, 1, 1,
-1.439935, 1.875547, -0.2447572, 1, 1, 1, 1, 1,
-1.426303, 0.5668842, -2.64329, 1, 1, 1, 1, 1,
-1.425755, 1.032247, -0.05548317, 1, 1, 1, 1, 1,
-1.423727, 0.5414633, -0.9018143, 1, 1, 1, 1, 1,
-1.414317, 1.109099, -0.5605091, 1, 1, 1, 1, 1,
-1.4129, -1.627686, -3.191256, 0, 0, 1, 1, 1,
-1.404794, 0.2248008, -0.5676816, 1, 0, 0, 1, 1,
-1.401561, 0.04056703, 0.2349933, 1, 0, 0, 1, 1,
-1.382271, -0.2196142, -0.8258935, 1, 0, 0, 1, 1,
-1.377735, -1.428244, -2.599024, 1, 0, 0, 1, 1,
-1.372419, -0.06966127, -2.603918, 1, 0, 0, 1, 1,
-1.365045, 0.2178951, -1.068367, 0, 0, 0, 1, 1,
-1.357646, -0.4256272, -0.8699791, 0, 0, 0, 1, 1,
-1.352169, 0.42219, -2.632932, 0, 0, 0, 1, 1,
-1.351959, -1.521551, -2.07455, 0, 0, 0, 1, 1,
-1.346897, 1.326951, 1.291375, 0, 0, 0, 1, 1,
-1.328016, -0.9697007, -1.777526, 0, 0, 0, 1, 1,
-1.327444, 0.9399213, -1.260289, 0, 0, 0, 1, 1,
-1.314494, 0.4847108, 0.2736377, 1, 1, 1, 1, 1,
-1.311427, -1.102192, -1.226703, 1, 1, 1, 1, 1,
-1.309106, 0.04772815, -0.09888271, 1, 1, 1, 1, 1,
-1.308492, 0.1286957, -0.6165178, 1, 1, 1, 1, 1,
-1.307056, -0.4252636, -2.844587, 1, 1, 1, 1, 1,
-1.298747, 0.03450593, -1.077943, 1, 1, 1, 1, 1,
-1.295372, 1.495945, 0.1918032, 1, 1, 1, 1, 1,
-1.286784, 0.6530423, -0.9154254, 1, 1, 1, 1, 1,
-1.280469, -0.6321349, -2.028322, 1, 1, 1, 1, 1,
-1.269757, -0.3502315, 0.01454234, 1, 1, 1, 1, 1,
-1.269226, 0.8216545, 0.375703, 1, 1, 1, 1, 1,
-1.260159, 1.101718, -1.504377, 1, 1, 1, 1, 1,
-1.259363, -0.3518567, -2.439048, 1, 1, 1, 1, 1,
-1.254363, -1.001499, -0.936417, 1, 1, 1, 1, 1,
-1.253566, -0.4984126, -1.365444, 1, 1, 1, 1, 1,
-1.240783, -2.070537, -3.352004, 0, 0, 1, 1, 1,
-1.238477, -0.4923711, -1.956435, 1, 0, 0, 1, 1,
-1.233972, -1.184623, -2.999989, 1, 0, 0, 1, 1,
-1.222657, -0.9370522, -0.6203269, 1, 0, 0, 1, 1,
-1.221676, -1.066376, -1.441551, 1, 0, 0, 1, 1,
-1.22161, -0.3756564, -0.4076531, 1, 0, 0, 1, 1,
-1.215983, -1.243132, -3.428361, 0, 0, 0, 1, 1,
-1.214464, 0.9652665, 0.3486525, 0, 0, 0, 1, 1,
-1.214075, 0.1999706, -1.484801, 0, 0, 0, 1, 1,
-1.210625, 0.3239301, -2.396435, 0, 0, 0, 1, 1,
-1.210503, -1.197422, -0.5080709, 0, 0, 0, 1, 1,
-1.210235, -0.1256019, -2.642888, 0, 0, 0, 1, 1,
-1.21009, -0.01525057, -1.381641, 0, 0, 0, 1, 1,
-1.209674, 0.8787798, -0.4115066, 1, 1, 1, 1, 1,
-1.199684, -0.5233739, -1.174637, 1, 1, 1, 1, 1,
-1.195573, -0.1623195, 0.07506278, 1, 1, 1, 1, 1,
-1.191311, 0.04505005, -1.150557, 1, 1, 1, 1, 1,
-1.177833, 0.2022326, -0.5250376, 1, 1, 1, 1, 1,
-1.175784, -0.3083918, -3.159369, 1, 1, 1, 1, 1,
-1.171924, -0.1801443, -3.625308, 1, 1, 1, 1, 1,
-1.169263, 0.9017162, -2.284683, 1, 1, 1, 1, 1,
-1.164197, 0.7523797, -1.398517, 1, 1, 1, 1, 1,
-1.163578, 0.5141093, -1.369701, 1, 1, 1, 1, 1,
-1.161282, -1.72896, -2.840444, 1, 1, 1, 1, 1,
-1.154465, -1.212986, -2.598001, 1, 1, 1, 1, 1,
-1.15119, 0.1511915, -1.896605, 1, 1, 1, 1, 1,
-1.147952, 0.06582529, -2.274546, 1, 1, 1, 1, 1,
-1.14652, 0.9976987, 1.007698, 1, 1, 1, 1, 1,
-1.142029, -1.014735, -2.173408, 0, 0, 1, 1, 1,
-1.13556, -0.6181186, -0.8279964, 1, 0, 0, 1, 1,
-1.134563, -0.3653329, -1.021323, 1, 0, 0, 1, 1,
-1.123414, 0.1537648, -2.531692, 1, 0, 0, 1, 1,
-1.11456, -0.5881513, -1.924871, 1, 0, 0, 1, 1,
-1.102852, 0.856508, -0.7817306, 1, 0, 0, 1, 1,
-1.102631, 0.3777874, -1.770134, 0, 0, 0, 1, 1,
-1.091675, 1.01401, -0.7999123, 0, 0, 0, 1, 1,
-1.08535, -0.6730495, -0.7357449, 0, 0, 0, 1, 1,
-1.07934, -0.4596367, -1.984935, 0, 0, 0, 1, 1,
-1.078631, 0.6777925, -0.9207053, 0, 0, 0, 1, 1,
-1.077012, 0.8172429, -0.09496528, 0, 0, 0, 1, 1,
-1.076958, -1.269037, -3.05888, 0, 0, 0, 1, 1,
-1.074637, -0.4162219, -1.476239, 1, 1, 1, 1, 1,
-1.073623, 0.8393415, 0.2268356, 1, 1, 1, 1, 1,
-1.066551, -0.0194787, -2.699423, 1, 1, 1, 1, 1,
-1.063957, 1.156779, -1.183905, 1, 1, 1, 1, 1,
-1.062991, -0.6917588, -2.773811, 1, 1, 1, 1, 1,
-1.060557, 0.8433379, -2.809973, 1, 1, 1, 1, 1,
-1.057868, -0.004543018, -0.09321938, 1, 1, 1, 1, 1,
-1.057514, 0.4334351, -2.237311, 1, 1, 1, 1, 1,
-1.051763, -0.07241427, -0.7890575, 1, 1, 1, 1, 1,
-1.051034, 0.8409741, 0.2957749, 1, 1, 1, 1, 1,
-1.050964, 0.8785641, -2.714985, 1, 1, 1, 1, 1,
-1.046294, 1.17708, 0.1086044, 1, 1, 1, 1, 1,
-1.040712, 1.016019, -1.750717, 1, 1, 1, 1, 1,
-1.039346, 0.3596173, -0.6106146, 1, 1, 1, 1, 1,
-1.037476, -0.6083407, -1.839646, 1, 1, 1, 1, 1,
-1.037449, -0.3439563, -0.5128424, 0, 0, 1, 1, 1,
-1.03675, 0.5961637, -2.747438, 1, 0, 0, 1, 1,
-1.026227, -0.6486953, -3.692013, 1, 0, 0, 1, 1,
-1.024444, 0.003470307, -2.306059, 1, 0, 0, 1, 1,
-1.024089, -0.01022609, -1.433658, 1, 0, 0, 1, 1,
-1.020577, 0.5716816, -1.274475, 1, 0, 0, 1, 1,
-1.008884, -1.005906, -3.684938, 0, 0, 0, 1, 1,
-1.006407, -1.224147, -2.775618, 0, 0, 0, 1, 1,
-1.004903, -1.008565, -1.541696, 0, 0, 0, 1, 1,
-1.001741, -0.5577317, -2.055439, 0, 0, 0, 1, 1,
-0.9885996, -1.01356, -1.313011, 0, 0, 0, 1, 1,
-0.9814575, 0.651292, -1.669253, 0, 0, 0, 1, 1,
-0.979742, 0.04558862, -2.420339, 0, 0, 0, 1, 1,
-0.9729584, 0.6626375, -1.356233, 1, 1, 1, 1, 1,
-0.9666942, 0.2996464, 0.2540545, 1, 1, 1, 1, 1,
-0.9598795, -0.3021108, -1.512604, 1, 1, 1, 1, 1,
-0.9575794, 0.9865099, -0.8241284, 1, 1, 1, 1, 1,
-0.9574458, 0.9376436, -0.6506341, 1, 1, 1, 1, 1,
-0.9563425, 1.533054, -0.2143807, 1, 1, 1, 1, 1,
-0.9558644, 1.173486, 1.403252, 1, 1, 1, 1, 1,
-0.9551663, 1.335609, -1.30948, 1, 1, 1, 1, 1,
-0.9443586, 0.2056499, -0.09410155, 1, 1, 1, 1, 1,
-0.9426984, -0.8358143, -3.662385, 1, 1, 1, 1, 1,
-0.9421329, -1.742105, -3.060803, 1, 1, 1, 1, 1,
-0.9413647, -0.2984062, -1.798991, 1, 1, 1, 1, 1,
-0.9389722, 1.373168, -0.6737071, 1, 1, 1, 1, 1,
-0.9304362, 0.2178383, -2.206802, 1, 1, 1, 1, 1,
-0.9282459, -1.199789, -2.951277, 1, 1, 1, 1, 1,
-0.9257338, 0.3243226, -3.169882, 0, 0, 1, 1, 1,
-0.9228224, 0.8743148, -1.990633, 1, 0, 0, 1, 1,
-0.918305, 0.2967494, -1.46761, 1, 0, 0, 1, 1,
-0.9178005, -0.5922128, -1.83603, 1, 0, 0, 1, 1,
-0.9176343, -0.2593707, 0.0590746, 1, 0, 0, 1, 1,
-0.9141316, 2.119846, -0.01231084, 1, 0, 0, 1, 1,
-0.9108284, -0.04365356, -2.186167, 0, 0, 0, 1, 1,
-0.903285, -0.4655007, -1.365016, 0, 0, 0, 1, 1,
-0.8925294, 0.2852763, -2.72426, 0, 0, 0, 1, 1,
-0.8922074, -0.4272355, -0.5178235, 0, 0, 0, 1, 1,
-0.8892797, 0.9122298, -0.6068784, 0, 0, 0, 1, 1,
-0.8866291, -1.490173, -1.737894, 0, 0, 0, 1, 1,
-0.8837308, 0.02613178, -1.772189, 0, 0, 0, 1, 1,
-0.8803376, -0.4931654, -2.599737, 1, 1, 1, 1, 1,
-0.8738838, 0.2299794, -1.152131, 1, 1, 1, 1, 1,
-0.8722841, -1.615972, -2.711615, 1, 1, 1, 1, 1,
-0.8707529, 1.251233, 1.837837, 1, 1, 1, 1, 1,
-0.8697507, 0.3494874, 1.658381, 1, 1, 1, 1, 1,
-0.8601221, -0.3454526, -0.2004653, 1, 1, 1, 1, 1,
-0.8570439, -0.9418815, -1.927871, 1, 1, 1, 1, 1,
-0.8568513, -0.02661263, -1.822114, 1, 1, 1, 1, 1,
-0.8553023, -0.9772774, -1.622211, 1, 1, 1, 1, 1,
-0.853603, -0.1427276, -1.278818, 1, 1, 1, 1, 1,
-0.8528612, 1.528405, -1.453793, 1, 1, 1, 1, 1,
-0.852537, 0.05726815, -1.858548, 1, 1, 1, 1, 1,
-0.8503156, -1.15761, -2.873043, 1, 1, 1, 1, 1,
-0.8492391, 0.346063, -1.196645, 1, 1, 1, 1, 1,
-0.8454316, 0.501538, -0.9431626, 1, 1, 1, 1, 1,
-0.84119, 0.3116723, -1.800387, 0, 0, 1, 1, 1,
-0.8360171, 0.4123702, -0.1308298, 1, 0, 0, 1, 1,
-0.8324694, 2.134133, -1.767429, 1, 0, 0, 1, 1,
-0.8260401, 0.7364943, 1.087903, 1, 0, 0, 1, 1,
-0.8213241, 0.6119832, 0.3571879, 1, 0, 0, 1, 1,
-0.8143995, 0.4709116, -3.326742, 1, 0, 0, 1, 1,
-0.8073947, 0.42642, -0.3629639, 0, 0, 0, 1, 1,
-0.805644, -0.3681309, -3.231273, 0, 0, 0, 1, 1,
-0.8049722, -0.6338561, -2.616483, 0, 0, 0, 1, 1,
-0.8026025, -1.98847, -2.508169, 0, 0, 0, 1, 1,
-0.7955136, 0.1359507, -1.221838, 0, 0, 0, 1, 1,
-0.7923682, -0.7095012, -2.421131, 0, 0, 0, 1, 1,
-0.7896267, 1.514667, -0.6315978, 0, 0, 0, 1, 1,
-0.7891942, -1.417146, -4.779675, 1, 1, 1, 1, 1,
-0.7799355, -0.03152114, -2.754793, 1, 1, 1, 1, 1,
-0.7762955, -1.228772, -0.9008191, 1, 1, 1, 1, 1,
-0.7554446, -0.7058767, -2.566526, 1, 1, 1, 1, 1,
-0.7534533, 0.3835036, -2.156282, 1, 1, 1, 1, 1,
-0.7510653, -0.5578485, -3.194423, 1, 1, 1, 1, 1,
-0.7504489, 1.010491, -0.1017556, 1, 1, 1, 1, 1,
-0.748776, 2.398547, -0.4754553, 1, 1, 1, 1, 1,
-0.7459256, 0.7225739, -1.036196, 1, 1, 1, 1, 1,
-0.7411866, -2.049139, -2.324826, 1, 1, 1, 1, 1,
-0.7387944, -0.2546076, -1.564506, 1, 1, 1, 1, 1,
-0.7330705, -0.7243958, -3.234043, 1, 1, 1, 1, 1,
-0.731356, -1.906193, -3.964725, 1, 1, 1, 1, 1,
-0.730314, 0.7197528, -0.05229061, 1, 1, 1, 1, 1,
-0.7302977, -0.5093127, -1.973604, 1, 1, 1, 1, 1,
-0.7239084, 0.6635347, 0.4638231, 0, 0, 1, 1, 1,
-0.7207776, 0.716376, -0.5240109, 1, 0, 0, 1, 1,
-0.7178051, 0.384455, 0.6486184, 1, 0, 0, 1, 1,
-0.7156296, -0.8017528, -4.186142, 1, 0, 0, 1, 1,
-0.7138575, 0.8151332, -1.008978, 1, 0, 0, 1, 1,
-0.7038, 0.5760536, -2.310518, 1, 0, 0, 1, 1,
-0.7011787, 0.02299175, -2.811562, 0, 0, 0, 1, 1,
-0.701088, -0.004641765, -1.657668, 0, 0, 0, 1, 1,
-0.7008705, -0.26414, -1.420329, 0, 0, 0, 1, 1,
-0.6976495, -0.4754601, -3.442601, 0, 0, 0, 1, 1,
-0.6962924, 1.635387, -1.543593, 0, 0, 0, 1, 1,
-0.6939465, -0.1147323, -2.260706, 0, 0, 0, 1, 1,
-0.6918402, -1.758569, -2.937644, 0, 0, 0, 1, 1,
-0.6891213, -1.4073, -3.746331, 1, 1, 1, 1, 1,
-0.6863393, 0.7356845, -0.7766472, 1, 1, 1, 1, 1,
-0.6847597, -0.7803672, -3.051774, 1, 1, 1, 1, 1,
-0.6830887, -0.4356504, -1.971426, 1, 1, 1, 1, 1,
-0.6801123, -0.2313725, -0.5142976, 1, 1, 1, 1, 1,
-0.6747063, -0.9044674, -2.116694, 1, 1, 1, 1, 1,
-0.6707235, 1.104216, -1.866988, 1, 1, 1, 1, 1,
-0.6671007, -1.25142, -2.335892, 1, 1, 1, 1, 1,
-0.6665701, 1.433327, -1.278316, 1, 1, 1, 1, 1,
-0.6600495, 0.275683, -1.027131, 1, 1, 1, 1, 1,
-0.6585318, 1.369307, -1.464105, 1, 1, 1, 1, 1,
-0.6545035, -0.07490999, -2.997757, 1, 1, 1, 1, 1,
-0.6496278, -0.671349, -1.670933, 1, 1, 1, 1, 1,
-0.648084, -0.5047247, -2.260099, 1, 1, 1, 1, 1,
-0.6447386, -0.1468959, -2.573092, 1, 1, 1, 1, 1,
-0.6438367, 1.251758, -0.43298, 0, 0, 1, 1, 1,
-0.6419995, 0.7666697, 0.1706724, 1, 0, 0, 1, 1,
-0.6419823, -0.1559923, -3.012553, 1, 0, 0, 1, 1,
-0.6396782, 1.291069, -0.9214324, 1, 0, 0, 1, 1,
-0.6394734, 1.218928, -0.1785862, 1, 0, 0, 1, 1,
-0.6357161, -0.2820269, -2.74098, 1, 0, 0, 1, 1,
-0.6291674, -0.2851845, -1.743116, 0, 0, 0, 1, 1,
-0.6230495, -1.955386, -2.120771, 0, 0, 0, 1, 1,
-0.6212115, -0.1488896, -1.330398, 0, 0, 0, 1, 1,
-0.621173, -0.06418977, -2.807494, 0, 0, 0, 1, 1,
-0.6202565, -0.7833089, -2.166064, 0, 0, 0, 1, 1,
-0.6193341, -1.145101, -3.210533, 0, 0, 0, 1, 1,
-0.6171699, 0.6721862, -0.2428806, 0, 0, 0, 1, 1,
-0.6145362, 1.649415, 1.047377, 1, 1, 1, 1, 1,
-0.6136724, 0.7783278, -0.6747672, 1, 1, 1, 1, 1,
-0.6126035, -0.6696448, -2.693368, 1, 1, 1, 1, 1,
-0.6094451, 1.18964, -0.7873712, 1, 1, 1, 1, 1,
-0.6056436, -0.2206776, -2.696954, 1, 1, 1, 1, 1,
-0.6048944, 0.195179, -0.8775342, 1, 1, 1, 1, 1,
-0.6005812, -0.7890478, -1.660977, 1, 1, 1, 1, 1,
-0.6004351, 0.451519, -1.415536, 1, 1, 1, 1, 1,
-0.5952284, 0.6143395, -0.176556, 1, 1, 1, 1, 1,
-0.5843445, -0.8131174, -0.9701879, 1, 1, 1, 1, 1,
-0.582839, 0.747521, -1.927981, 1, 1, 1, 1, 1,
-0.5809314, -0.1691579, -1.446955, 1, 1, 1, 1, 1,
-0.5748784, 0.3867815, -0.302173, 1, 1, 1, 1, 1,
-0.5723259, 0.6284, -0.1023589, 1, 1, 1, 1, 1,
-0.5713594, -1.638927, -2.65619, 1, 1, 1, 1, 1,
-0.56476, -0.5395275, -3.748164, 0, 0, 1, 1, 1,
-0.5585238, -0.06185641, -3.784906, 1, 0, 0, 1, 1,
-0.556466, -0.2019366, -1.6539, 1, 0, 0, 1, 1,
-0.5562518, 0.05770787, -1.473861, 1, 0, 0, 1, 1,
-0.5560958, 0.8031989, -1.579501, 1, 0, 0, 1, 1,
-0.5525719, 0.4521742, 0.4821139, 1, 0, 0, 1, 1,
-0.5522926, 0.1284653, -1.65947, 0, 0, 0, 1, 1,
-0.5426456, 0.9870275, 0.3663573, 0, 0, 0, 1, 1,
-0.5369065, -1.057155, -3.150099, 0, 0, 0, 1, 1,
-0.5361412, -1.562585, -2.098344, 0, 0, 0, 1, 1,
-0.5351951, 0.7525017, -0.8727813, 0, 0, 0, 1, 1,
-0.5331747, -1.640547, -3.31746, 0, 0, 0, 1, 1,
-0.5316377, 0.6514537, -0.6053404, 0, 0, 0, 1, 1,
-0.5315498, 0.378745, -1.974885, 1, 1, 1, 1, 1,
-0.5287307, -0.2913986, -1.138, 1, 1, 1, 1, 1,
-0.5286479, -0.8940586, -1.71896, 1, 1, 1, 1, 1,
-0.5158092, -0.1429671, -1.869687, 1, 1, 1, 1, 1,
-0.5107703, 1.366529, -1.567435, 1, 1, 1, 1, 1,
-0.5079023, 1.511578, -0.4779368, 1, 1, 1, 1, 1,
-0.481159, 1.260084, 0.3781117, 1, 1, 1, 1, 1,
-0.481029, -0.17545, -2.482195, 1, 1, 1, 1, 1,
-0.4781996, -0.9044722, -4.377198, 1, 1, 1, 1, 1,
-0.4779567, 0.6724348, -1.64077, 1, 1, 1, 1, 1,
-0.4728265, 0.7073496, 0.5893933, 1, 1, 1, 1, 1,
-0.4707779, 0.5182871, -1.374543, 1, 1, 1, 1, 1,
-0.4663598, -1.238857, -3.422934, 1, 1, 1, 1, 1,
-0.4581951, 0.1099379, 0.02261925, 1, 1, 1, 1, 1,
-0.4559515, -0.4395648, -2.593174, 1, 1, 1, 1, 1,
-0.4549632, -0.8888968, -3.100114, 0, 0, 1, 1, 1,
-0.4545718, -1.186031, -4.668417, 1, 0, 0, 1, 1,
-0.4545589, -0.2618653, -0.5833591, 1, 0, 0, 1, 1,
-0.4501996, 0.7005484, -0.6287898, 1, 0, 0, 1, 1,
-0.4475161, -0.1124383, -3.470169, 1, 0, 0, 1, 1,
-0.4447417, -0.6515163, -1.56585, 1, 0, 0, 1, 1,
-0.4379502, 0.04162933, -0.5610667, 0, 0, 0, 1, 1,
-0.4359053, -1.475038, -2.61504, 0, 0, 0, 1, 1,
-0.4355461, -0.8541816, -2.61655, 0, 0, 0, 1, 1,
-0.4315921, -1.373252, -2.634427, 0, 0, 0, 1, 1,
-0.4270035, 1.126115, -0.7581816, 0, 0, 0, 1, 1,
-0.4268791, -0.1892912, -2.111039, 0, 0, 0, 1, 1,
-0.4255888, 0.5413091, -1.043324, 0, 0, 0, 1, 1,
-0.4238706, 0.08787355, -0.9785962, 1, 1, 1, 1, 1,
-0.4227271, 0.1932578, -0.9134631, 1, 1, 1, 1, 1,
-0.4104468, 0.4552734, -0.02256725, 1, 1, 1, 1, 1,
-0.4089052, -1.049223, -3.295197, 1, 1, 1, 1, 1,
-0.4016375, -1.190706, -2.355717, 1, 1, 1, 1, 1,
-0.4002659, -1.691573, -0.826933, 1, 1, 1, 1, 1,
-0.4000529, 0.8744451, -1.789507, 1, 1, 1, 1, 1,
-0.3958566, 0.1210502, 0.8547906, 1, 1, 1, 1, 1,
-0.3892834, 1.022276, 0.2139434, 1, 1, 1, 1, 1,
-0.3885626, -0.6988167, -4.205171, 1, 1, 1, 1, 1,
-0.3876686, -0.7338859, -0.8542265, 1, 1, 1, 1, 1,
-0.3858216, 0.06641275, -3.127846, 1, 1, 1, 1, 1,
-0.3856359, 0.9882888, -1.727878, 1, 1, 1, 1, 1,
-0.3804026, 0.4677596, -0.7023675, 1, 1, 1, 1, 1,
-0.3783539, 0.6821668, -1.214107, 1, 1, 1, 1, 1,
-0.3689645, 1.855007, 0.7492093, 0, 0, 1, 1, 1,
-0.3648063, -1.484298, -5.665208, 1, 0, 0, 1, 1,
-0.3644418, -0.4729437, -3.098428, 1, 0, 0, 1, 1,
-0.363681, 0.414744, 1.041914, 1, 0, 0, 1, 1,
-0.3622074, -0.163553, -1.132719, 1, 0, 0, 1, 1,
-0.3598566, 1.380367, -1.61279, 1, 0, 0, 1, 1,
-0.3593747, 0.5607657, 0.7796435, 0, 0, 0, 1, 1,
-0.3562225, -1.1269, -3.847035, 0, 0, 0, 1, 1,
-0.3521905, -0.962945, -3.888917, 0, 0, 0, 1, 1,
-0.3518451, 0.8794665, -0.4932914, 0, 0, 0, 1, 1,
-0.3516364, 0.7889643, -0.7082286, 0, 0, 0, 1, 1,
-0.3514485, -0.5681137, -3.601039, 0, 0, 0, 1, 1,
-0.3498145, -1.499139, -2.996733, 0, 0, 0, 1, 1,
-0.3476216, 0.2446506, -0.6863912, 1, 1, 1, 1, 1,
-0.3396458, 1.148366, 0.5146911, 1, 1, 1, 1, 1,
-0.3387744, -1.557127, -2.698488, 1, 1, 1, 1, 1,
-0.3382024, -0.1759098, -2.647517, 1, 1, 1, 1, 1,
-0.3346592, -1.163814, -3.296347, 1, 1, 1, 1, 1,
-0.3321396, -0.1021435, -1.10311, 1, 1, 1, 1, 1,
-0.3285676, -0.5418301, -1.352814, 1, 1, 1, 1, 1,
-0.3268395, -1.423109, -1.752788, 1, 1, 1, 1, 1,
-0.3258136, -0.290271, -4.180327, 1, 1, 1, 1, 1,
-0.3235863, -0.09894019, -3.01193, 1, 1, 1, 1, 1,
-0.322944, -0.5273514, -3.349869, 1, 1, 1, 1, 1,
-0.3220841, 0.3415665, 0.1951385, 1, 1, 1, 1, 1,
-0.3207775, 0.1369169, -1.218469, 1, 1, 1, 1, 1,
-0.318029, 0.2080848, 0.6785945, 1, 1, 1, 1, 1,
-0.3157673, -0.7796358, -2.51356, 1, 1, 1, 1, 1,
-0.3156749, 1.679838, -1.479029, 0, 0, 1, 1, 1,
-0.3148983, -0.9154522, -1.492825, 1, 0, 0, 1, 1,
-0.313325, -0.1849499, -0.1291047, 1, 0, 0, 1, 1,
-0.3120635, -0.2059964, -4.060117, 1, 0, 0, 1, 1,
-0.3042073, 0.05169742, -1.239104, 1, 0, 0, 1, 1,
-0.2991857, -0.7726468, -1.902517, 1, 0, 0, 1, 1,
-0.29836, 0.405805, 0.3384375, 0, 0, 0, 1, 1,
-0.2912832, 0.5055501, -0.7544321, 0, 0, 0, 1, 1,
-0.2852236, 0.2746335, 0.0497386, 0, 0, 0, 1, 1,
-0.2847856, -0.7929128, -2.505302, 0, 0, 0, 1, 1,
-0.2783067, -1.838043, -3.43451, 0, 0, 0, 1, 1,
-0.2754833, -0.4872371, -2.100889, 0, 0, 0, 1, 1,
-0.2693244, -0.1114999, -0.7431912, 0, 0, 0, 1, 1,
-0.2683267, 0.2425152, 0.1305637, 1, 1, 1, 1, 1,
-0.2661334, 0.4017897, -0.4200678, 1, 1, 1, 1, 1,
-0.2655328, 0.275927, -0.3739016, 1, 1, 1, 1, 1,
-0.2638112, 0.3240547, 0.5060475, 1, 1, 1, 1, 1,
-0.2632645, 0.11127, -1.170112, 1, 1, 1, 1, 1,
-0.2572054, 1.852479, -2.124476, 1, 1, 1, 1, 1,
-0.2524158, -1.147162, -1.281479, 1, 1, 1, 1, 1,
-0.251352, 1.991165, -1.728581, 1, 1, 1, 1, 1,
-0.2489134, -0.8914669, -2.853669, 1, 1, 1, 1, 1,
-0.2479719, 1.49083, -0.550989, 1, 1, 1, 1, 1,
-0.2468873, -0.1541473, -2.645601, 1, 1, 1, 1, 1,
-0.241886, 1.198552, 0.06506197, 1, 1, 1, 1, 1,
-0.2403827, 1.028508, 0.7116639, 1, 1, 1, 1, 1,
-0.2346309, 0.8273312, 0.5520086, 1, 1, 1, 1, 1,
-0.2329459, 0.4291779, -0.04294668, 1, 1, 1, 1, 1,
-0.2297917, -0.5644921, -2.634746, 0, 0, 1, 1, 1,
-0.2290905, -2.11315, -3.700646, 1, 0, 0, 1, 1,
-0.2270183, -1.160258, -6.161052, 1, 0, 0, 1, 1,
-0.220024, 0.2666485, -0.3816822, 1, 0, 0, 1, 1,
-0.2198326, -0.433102, -1.840302, 1, 0, 0, 1, 1,
-0.2156328, -2.224342, -1.857091, 1, 0, 0, 1, 1,
-0.206331, -0.5330983, -1.43651, 0, 0, 0, 1, 1,
-0.2055647, -1.260856, -4.502798, 0, 0, 0, 1, 1,
-0.2041759, -0.8285315, -2.307558, 0, 0, 0, 1, 1,
-0.1938828, -0.8537588, -1.865842, 0, 0, 0, 1, 1,
-0.1840583, -0.3364138, -2.756374, 0, 0, 0, 1, 1,
-0.1829707, -0.1002501, -2.652241, 0, 0, 0, 1, 1,
-0.1826518, 0.8711938, -1.123414, 0, 0, 0, 1, 1,
-0.1802723, 1.208786, -1.783294, 1, 1, 1, 1, 1,
-0.1777285, -0.05035916, -1.6269, 1, 1, 1, 1, 1,
-0.176832, -2.823792, -4.37806, 1, 1, 1, 1, 1,
-0.176755, -0.9252852, -2.453, 1, 1, 1, 1, 1,
-0.1758886, 0.06060247, -1.267364, 1, 1, 1, 1, 1,
-0.1705518, -0.1218336, -2.696996, 1, 1, 1, 1, 1,
-0.1693637, -1.431802, -3.179902, 1, 1, 1, 1, 1,
-0.1606276, 0.03589408, -0.9455474, 1, 1, 1, 1, 1,
-0.1571171, -1.51506, -1.996941, 1, 1, 1, 1, 1,
-0.1566369, 0.2792143, -0.1545529, 1, 1, 1, 1, 1,
-0.1564735, 0.3898166, -1.51013, 1, 1, 1, 1, 1,
-0.1559718, 1.254638, 0.5319852, 1, 1, 1, 1, 1,
-0.1549731, -0.9966242, -3.065262, 1, 1, 1, 1, 1,
-0.1522631, -0.6297224, -4.394217, 1, 1, 1, 1, 1,
-0.1515647, 0.5906477, -1.388883, 1, 1, 1, 1, 1,
-0.1513904, -0.2617135, -3.148308, 0, 0, 1, 1, 1,
-0.1443517, 1.385907, 0.3980322, 1, 0, 0, 1, 1,
-0.1439847, -0.2443566, -2.008528, 1, 0, 0, 1, 1,
-0.1421609, -0.1081182, -2.750273, 1, 0, 0, 1, 1,
-0.1401784, -0.7309931, -3.911937, 1, 0, 0, 1, 1,
-0.1386141, -2.404396, -4.29982, 1, 0, 0, 1, 1,
-0.138104, 0.2768242, -1.785526, 0, 0, 0, 1, 1,
-0.1379246, -0.9551588, -5.441036, 0, 0, 0, 1, 1,
-0.1370237, -0.2874428, -1.283569, 0, 0, 0, 1, 1,
-0.1329121, 1.365467, 1.570057, 0, 0, 0, 1, 1,
-0.1315005, 1.399127, -1.30014, 0, 0, 0, 1, 1,
-0.1267619, 0.1347625, 0.6693375, 0, 0, 0, 1, 1,
-0.1239716, 1.617936, -0.436078, 0, 0, 0, 1, 1,
-0.1209833, 1.020521, -0.1606068, 1, 1, 1, 1, 1,
-0.1168951, 0.02455319, -2.996703, 1, 1, 1, 1, 1,
-0.1167384, -1.407844, -2.558656, 1, 1, 1, 1, 1,
-0.1157628, 0.1250727, -0.2004363, 1, 1, 1, 1, 1,
-0.1078199, -0.5417997, -2.253676, 1, 1, 1, 1, 1,
-0.1074165, 2.094497, -0.2112353, 1, 1, 1, 1, 1,
-0.09836324, -2.346132, -4.273475, 1, 1, 1, 1, 1,
-0.08954372, -1.07067, -2.676739, 1, 1, 1, 1, 1,
-0.0890495, 2.158275, 0.5960101, 1, 1, 1, 1, 1,
-0.0890189, 2.178245, -1.141647, 1, 1, 1, 1, 1,
-0.08869082, -0.5410827, -2.670992, 1, 1, 1, 1, 1,
-0.08786175, -0.2740203, -2.148525, 1, 1, 1, 1, 1,
-0.08560092, -0.2701904, -4.201571, 1, 1, 1, 1, 1,
-0.08311883, -1.342097, -3.333375, 1, 1, 1, 1, 1,
-0.08175371, 0.01540803, -2.384846, 1, 1, 1, 1, 1,
-0.08072946, 0.5146057, 1.174742, 0, 0, 1, 1, 1,
-0.08034276, -0.8173114, -2.646434, 1, 0, 0, 1, 1,
-0.0770025, 0.8144178, -0.9017709, 1, 0, 0, 1, 1,
-0.07627606, 0.3688659, -1.257327, 1, 0, 0, 1, 1,
-0.07384386, 0.7939216, 0.03661705, 1, 0, 0, 1, 1,
-0.07367254, -0.3746819, -1.833086, 1, 0, 0, 1, 1,
-0.07328171, -0.5690832, -1.714518, 0, 0, 0, 1, 1,
-0.07308658, -2.158776, -3.789422, 0, 0, 0, 1, 1,
-0.06943808, 0.8310823, 1.15793, 0, 0, 0, 1, 1,
-0.06926604, -0.4861107, -1.383911, 0, 0, 0, 1, 1,
-0.06908334, -0.2294303, -4.393929, 0, 0, 0, 1, 1,
-0.06783622, -0.9536695, -2.948103, 0, 0, 0, 1, 1,
-0.06733026, -0.3961482, -4.224334, 0, 0, 0, 1, 1,
-0.06457692, 2.084972, 0.7078486, 1, 1, 1, 1, 1,
-0.0607918, -1.426388, -5.059909, 1, 1, 1, 1, 1,
-0.05850951, -0.9819969, -5.260578, 1, 1, 1, 1, 1,
-0.05747822, 0.2829906, 0.1912488, 1, 1, 1, 1, 1,
-0.0548697, -0.0900037, -3.362873, 1, 1, 1, 1, 1,
-0.05183618, 0.3836149, -1.727219, 1, 1, 1, 1, 1,
-0.0502316, 1.570742, -1.220645, 1, 1, 1, 1, 1,
-0.045826, -1.435231, -1.980314, 1, 1, 1, 1, 1,
-0.04326347, 0.8124884, -0.8530634, 1, 1, 1, 1, 1,
-0.04205501, 0.05514781, 0.1964075, 1, 1, 1, 1, 1,
-0.0408597, -1.795107, -2.041458, 1, 1, 1, 1, 1,
-0.04031429, 1.201557, -0.1218239, 1, 1, 1, 1, 1,
-0.03843157, 1.93893, -0.04325869, 1, 1, 1, 1, 1,
-0.03744126, -0.08591901, -1.135171, 1, 1, 1, 1, 1,
-0.03571227, -1.104218, -2.872153, 1, 1, 1, 1, 1,
-0.03121364, -1.575818, -1.132635, 0, 0, 1, 1, 1,
-0.02895791, -0.07300642, -2.459117, 1, 0, 0, 1, 1,
-0.02720116, -0.7511712, -2.324761, 1, 0, 0, 1, 1,
-0.02216123, -0.3971547, -2.824675, 1, 0, 0, 1, 1,
-0.01964546, 1.378453, 0.576804, 1, 0, 0, 1, 1,
-0.01917067, 0.2250146, -0.9416128, 1, 0, 0, 1, 1,
-0.01538797, 0.2804651, -0.8457921, 0, 0, 0, 1, 1,
-0.01533436, 0.185959, -0.579468, 0, 0, 0, 1, 1,
-0.006522032, 0.05444591, -0.9055661, 0, 0, 0, 1, 1,
-0.002067383, -0.9758679, -2.876724, 0, 0, 0, 1, 1,
-0.0008983309, -0.8355476, -2.523653, 0, 0, 0, 1, 1,
0.0004810278, 1.282705, 1.784887, 0, 0, 0, 1, 1,
0.001756423, 0.6335577, 0.685855, 0, 0, 0, 1, 1,
0.003296737, 1.501647, -2.245283, 1, 1, 1, 1, 1,
0.005485153, 1.300912, 0.4390108, 1, 1, 1, 1, 1,
0.007166153, 0.05088605, -0.397588, 1, 1, 1, 1, 1,
0.01230497, 0.5311856, 0.9875523, 1, 1, 1, 1, 1,
0.01786249, -0.7433323, 3.674139, 1, 1, 1, 1, 1,
0.01836756, -0.5318076, 3.43045, 1, 1, 1, 1, 1,
0.01847318, 1.049879, -1.475251, 1, 1, 1, 1, 1,
0.01959086, -0.6321223, 4.035307, 1, 1, 1, 1, 1,
0.02050293, -0.06845329, 2.14102, 1, 1, 1, 1, 1,
0.021477, 1.081137, 1.153175, 1, 1, 1, 1, 1,
0.02219166, -0.7009371, 2.661872, 1, 1, 1, 1, 1,
0.02487393, -0.326622, 3.991788, 1, 1, 1, 1, 1,
0.02652109, 1.37467, 2.164254, 1, 1, 1, 1, 1,
0.02877485, -0.4547189, 3.168566, 1, 1, 1, 1, 1,
0.02970204, 0.3452073, -0.3809464, 1, 1, 1, 1, 1,
0.03389331, -1.187818, 4.229203, 0, 0, 1, 1, 1,
0.034491, 0.1929397, 1.269446, 1, 0, 0, 1, 1,
0.03452691, 0.5843846, 1.817968, 1, 0, 0, 1, 1,
0.03809413, 2.876116, -0.2553646, 1, 0, 0, 1, 1,
0.0386209, 1.618128, 0.9157074, 1, 0, 0, 1, 1,
0.03930795, -1.216736, 2.539691, 1, 0, 0, 1, 1,
0.03978108, 1.390727, 0.599984, 0, 0, 0, 1, 1,
0.04187577, -0.6447617, 1.009646, 0, 0, 0, 1, 1,
0.0463569, 0.0358557, 0.9451999, 0, 0, 0, 1, 1,
0.04820993, -0.4166318, 4.020013, 0, 0, 0, 1, 1,
0.04932142, 1.259447, 0.4194648, 0, 0, 0, 1, 1,
0.04936095, -0.7882886, 3.175321, 0, 0, 0, 1, 1,
0.05046194, -1.277242, 4.940259, 0, 0, 0, 1, 1,
0.0573125, 0.335417, -0.4512835, 1, 1, 1, 1, 1,
0.05800406, -0.6995707, 3.589129, 1, 1, 1, 1, 1,
0.06633687, 0.3562952, 0.9521844, 1, 1, 1, 1, 1,
0.06739956, 1.33033, -0.4367968, 1, 1, 1, 1, 1,
0.06913066, 0.2993875, 0.8301935, 1, 1, 1, 1, 1,
0.07047325, 1.201153, 0.9605368, 1, 1, 1, 1, 1,
0.07108971, -1.597438, 4.821974, 1, 1, 1, 1, 1,
0.07179352, 0.7239388, 0.6804534, 1, 1, 1, 1, 1,
0.07240843, -0.5545279, 4.208002, 1, 1, 1, 1, 1,
0.07254858, -0.4712338, 2.71259, 1, 1, 1, 1, 1,
0.07281379, 0.8173352, -0.155723, 1, 1, 1, 1, 1,
0.07414881, 1.510157, 0.9025083, 1, 1, 1, 1, 1,
0.07598247, -0.54952, 2.965358, 1, 1, 1, 1, 1,
0.08069409, 0.4971701, 0.9127796, 1, 1, 1, 1, 1,
0.08174884, 0.01794081, 2.629597, 1, 1, 1, 1, 1,
0.08298475, 1.438887, 0.7389926, 0, 0, 1, 1, 1,
0.08316856, -0.4012512, 3.511623, 1, 0, 0, 1, 1,
0.08337948, 1.290837, 0.2111109, 1, 0, 0, 1, 1,
0.08344313, 1.023408, -0.09989687, 1, 0, 0, 1, 1,
0.08405934, -0.677564, 3.086465, 1, 0, 0, 1, 1,
0.08545852, -0.05218573, 4.17769, 1, 0, 0, 1, 1,
0.08622666, -0.5301679, 5.033356, 0, 0, 0, 1, 1,
0.08679785, -0.464164, 3.036289, 0, 0, 0, 1, 1,
0.08915646, -1.01594, 3.564588, 0, 0, 0, 1, 1,
0.09484342, -1.366284, 2.816681, 0, 0, 0, 1, 1,
0.09486061, 0.6481565, 0.3100743, 0, 0, 0, 1, 1,
0.1003632, 2.193401, 1.532133, 0, 0, 0, 1, 1,
0.1027752, -1.218351, 2.71674, 0, 0, 0, 1, 1,
0.1030138, -1.102912, 3.381609, 1, 1, 1, 1, 1,
0.1031104, -0.3260418, 3.390288, 1, 1, 1, 1, 1,
0.1045118, -0.2811741, 2.995342, 1, 1, 1, 1, 1,
0.1054802, 0.02053917, 3.606309, 1, 1, 1, 1, 1,
0.1096845, -1.546042, 1.77015, 1, 1, 1, 1, 1,
0.1114227, 1.07391, -0.0986148, 1, 1, 1, 1, 1,
0.1125508, 1.459401, -0.2982836, 1, 1, 1, 1, 1,
0.1253515, 0.2833349, -0.3563076, 1, 1, 1, 1, 1,
0.1290663, -0.3147722, 2.096824, 1, 1, 1, 1, 1,
0.1301109, -0.3552783, 2.780231, 1, 1, 1, 1, 1,
0.1328475, -0.4850327, 1.924187, 1, 1, 1, 1, 1,
0.1363134, -0.8295195, 4.864672, 1, 1, 1, 1, 1,
0.1363534, 0.710302, 1.245103, 1, 1, 1, 1, 1,
0.1405082, 2.440651, 0.5399044, 1, 1, 1, 1, 1,
0.1474427, -0.6587316, 2.118575, 1, 1, 1, 1, 1,
0.1506957, -1.729429, 4.960049, 0, 0, 1, 1, 1,
0.1524357, 1.290181, -0.6074639, 1, 0, 0, 1, 1,
0.1549724, 0.368269, 0.1566504, 1, 0, 0, 1, 1,
0.1567436, -0.5628974, 2.626995, 1, 0, 0, 1, 1,
0.1590806, 1.492772, 1.663079, 1, 0, 0, 1, 1,
0.159849, 0.5461386, 1.28776, 1, 0, 0, 1, 1,
0.1619491, 0.2892542, -0.2453927, 0, 0, 0, 1, 1,
0.1625518, 1.495834, 0.565534, 0, 0, 0, 1, 1,
0.1675365, 0.1251457, 2.36823, 0, 0, 0, 1, 1,
0.1703178, -0.9112052, 2.598267, 0, 0, 0, 1, 1,
0.1705022, -0.3698691, 1.981937, 0, 0, 0, 1, 1,
0.1759883, -0.01308274, 2.316096, 0, 0, 0, 1, 1,
0.1774367, 0.04951504, 1.105225, 0, 0, 0, 1, 1,
0.1853838, -0.2445495, 3.622796, 1, 1, 1, 1, 1,
0.2025317, 0.2649671, 1.200698, 1, 1, 1, 1, 1,
0.204989, -0.6408498, 3.887818, 1, 1, 1, 1, 1,
0.2072795, -0.04838116, 3.199015, 1, 1, 1, 1, 1,
0.2076656, 1.131225, -0.329827, 1, 1, 1, 1, 1,
0.2083837, 0.5122809, 1.452647, 1, 1, 1, 1, 1,
0.2111169, -1.161241, 4.007641, 1, 1, 1, 1, 1,
0.2132831, 1.133955, -0.5134795, 1, 1, 1, 1, 1,
0.2161579, 0.7347401, 0.5340967, 1, 1, 1, 1, 1,
0.2193858, -1.165936, 4.600819, 1, 1, 1, 1, 1,
0.2212323, 0.7375342, 0.4848651, 1, 1, 1, 1, 1,
0.2254513, 1.056186, -0.9447291, 1, 1, 1, 1, 1,
0.2293162, -0.7223058, 1.428073, 1, 1, 1, 1, 1,
0.2293942, -0.4064574, 2.438474, 1, 1, 1, 1, 1,
0.2294322, 0.4802756, 1.130398, 1, 1, 1, 1, 1,
0.2339988, 0.1211437, 0.4510134, 0, 0, 1, 1, 1,
0.2380389, -0.7278612, 2.535592, 1, 0, 0, 1, 1,
0.2406413, -1.253267, 2.811178, 1, 0, 0, 1, 1,
0.2456732, 0.5527564, -2.024311, 1, 0, 0, 1, 1,
0.2471111, -2.140948, 2.147242, 1, 0, 0, 1, 1,
0.2476331, 0.1509545, -1.863505, 1, 0, 0, 1, 1,
0.2497015, 0.01214299, 2.435573, 0, 0, 0, 1, 1,
0.251563, -0.2861634, 2.85038, 0, 0, 0, 1, 1,
0.2662592, -1.442968, 5.029861, 0, 0, 0, 1, 1,
0.2692349, -1.032105, 1.786177, 0, 0, 0, 1, 1,
0.2735072, -1.692297, 3.014599, 0, 0, 0, 1, 1,
0.2763303, 0.3473581, 1.264234, 0, 0, 0, 1, 1,
0.2791338, -0.4232564, 3.219322, 0, 0, 0, 1, 1,
0.2803018, -1.059677, 2.606192, 1, 1, 1, 1, 1,
0.2844884, -1.736502, 4.37195, 1, 1, 1, 1, 1,
0.2902935, 0.3644077, 1.268612, 1, 1, 1, 1, 1,
0.2903788, 0.4071337, 0.7048171, 1, 1, 1, 1, 1,
0.2915783, -0.9747117, 3.455168, 1, 1, 1, 1, 1,
0.3013013, -1.367504, 0.9691565, 1, 1, 1, 1, 1,
0.303912, -0.9671263, 3.277541, 1, 1, 1, 1, 1,
0.3073628, -0.6680894, 3.079805, 1, 1, 1, 1, 1,
0.3076574, 0.1396963, 1.669708, 1, 1, 1, 1, 1,
0.3080504, 1.090993, -0.3882698, 1, 1, 1, 1, 1,
0.3146794, -0.4284079, 1.890366, 1, 1, 1, 1, 1,
0.3153501, 0.5080146, -0.0292665, 1, 1, 1, 1, 1,
0.3183915, -1.792898, 1.940027, 1, 1, 1, 1, 1,
0.3197787, -0.2281449, 2.731573, 1, 1, 1, 1, 1,
0.3211232, 0.4978375, 1.118822, 1, 1, 1, 1, 1,
0.3262392, 1.636864, 0.01794393, 0, 0, 1, 1, 1,
0.3266904, -0.8687316, 3.401901, 1, 0, 0, 1, 1,
0.3271253, 0.1843306, 2.01754, 1, 0, 0, 1, 1,
0.3321921, -0.01023929, 0.7880156, 1, 0, 0, 1, 1,
0.3331981, -0.9472199, 1.282017, 1, 0, 0, 1, 1,
0.3360519, 0.5677355, 0.8961647, 1, 0, 0, 1, 1,
0.3363549, 1.918259, 0.0397515, 0, 0, 0, 1, 1,
0.344154, 0.8146675, 1.926095, 0, 0, 0, 1, 1,
0.348184, 0.446916, 1.179219, 0, 0, 0, 1, 1,
0.348943, -0.1057989, 1.384232, 0, 0, 0, 1, 1,
0.3533334, 0.271661, 2.012246, 0, 0, 0, 1, 1,
0.3561378, 1.195578, 0.09026935, 0, 0, 0, 1, 1,
0.3586206, 1.235049, 1.082054, 0, 0, 0, 1, 1,
0.3610948, -0.9790726, 3.056278, 1, 1, 1, 1, 1,
0.3624737, 1.075052, 0.7651919, 1, 1, 1, 1, 1,
0.3627972, -0.9490491, 2.325922, 1, 1, 1, 1, 1,
0.3638878, 0.3095974, 1.19944, 1, 1, 1, 1, 1,
0.3742274, 0.07216813, 1.961518, 1, 1, 1, 1, 1,
0.3757558, -0.01607773, 1.844169, 1, 1, 1, 1, 1,
0.3780515, 2.296119, -0.8264561, 1, 1, 1, 1, 1,
0.3789439, 0.5438316, -0.5460241, 1, 1, 1, 1, 1,
0.3823059, 1.276554, 0.5937629, 1, 1, 1, 1, 1,
0.3833243, -1.190769, 3.000574, 1, 1, 1, 1, 1,
0.3844744, 0.3756242, 3.460915, 1, 1, 1, 1, 1,
0.3911486, -0.9038812, 2.813473, 1, 1, 1, 1, 1,
0.3931481, -0.006232345, 0.3021615, 1, 1, 1, 1, 1,
0.3953988, -1.098631, 2.765567, 1, 1, 1, 1, 1,
0.3989517, 0.8125585, -0.08476058, 1, 1, 1, 1, 1,
0.4059408, 0.4947297, 1.368072, 0, 0, 1, 1, 1,
0.4088509, -1.397532, 3.172749, 1, 0, 0, 1, 1,
0.4119215, 1.123291, 1.803982, 1, 0, 0, 1, 1,
0.4179785, 0.3802682, -0.1515571, 1, 0, 0, 1, 1,
0.419201, 1.778267, 0.512197, 1, 0, 0, 1, 1,
0.41991, -1.437871, 1.631385, 1, 0, 0, 1, 1,
0.4224187, -0.08051358, 0.9518891, 0, 0, 0, 1, 1,
0.4232161, 1.353922, 1.612524, 0, 0, 0, 1, 1,
0.4238268, 0.9237933, -1.663989, 0, 0, 0, 1, 1,
0.4285968, -1.250207, 2.885024, 0, 0, 0, 1, 1,
0.430575, -0.7436795, 2.253894, 0, 0, 0, 1, 1,
0.4318911, 0.161205, 1.624975, 0, 0, 0, 1, 1,
0.4326298, -1.005162, 3.309752, 0, 0, 0, 1, 1,
0.4340119, -1.156721, 2.05439, 1, 1, 1, 1, 1,
0.4434894, -1.259846, 2.385306, 1, 1, 1, 1, 1,
0.4453075, -0.4840364, 3.121249, 1, 1, 1, 1, 1,
0.4467518, 1.509086, 0.593619, 1, 1, 1, 1, 1,
0.4477291, 0.308073, 0.07219726, 1, 1, 1, 1, 1,
0.4517114, -1.84241, 1.463279, 1, 1, 1, 1, 1,
0.4573034, 0.2188239, -1.543355, 1, 1, 1, 1, 1,
0.4587435, 1.01013, 1.144446, 1, 1, 1, 1, 1,
0.4646266, -0.7711087, 1.817611, 1, 1, 1, 1, 1,
0.4714144, 0.8800459, 0.1803232, 1, 1, 1, 1, 1,
0.4732666, -1.797001, 4.475567, 1, 1, 1, 1, 1,
0.4785635, -0.7732258, 0.9401115, 1, 1, 1, 1, 1,
0.4815227, 0.558598, 0.7793048, 1, 1, 1, 1, 1,
0.4854366, 0.4115351, 3.756767, 1, 1, 1, 1, 1,
0.4879606, 1.02564, -0.9171867, 1, 1, 1, 1, 1,
0.4889894, 0.5897794, -0.6624396, 0, 0, 1, 1, 1,
0.491942, 0.01086554, 0.730206, 1, 0, 0, 1, 1,
0.4935706, -0.4192336, 4.122197, 1, 0, 0, 1, 1,
0.4967092, 0.1714023, 2.314214, 1, 0, 0, 1, 1,
0.4983932, -0.6456918, 2.673098, 1, 0, 0, 1, 1,
0.4999927, 1.556873, -1.830404, 1, 0, 0, 1, 1,
0.5001822, -0.2780465, 2.831191, 0, 0, 0, 1, 1,
0.5005897, -0.7912533, 1.893025, 0, 0, 0, 1, 1,
0.5029842, 0.6868804, 1.948212, 0, 0, 0, 1, 1,
0.5066099, 0.06893662, 3.42383, 0, 0, 0, 1, 1,
0.5126427, 0.7073356, 0.8379021, 0, 0, 0, 1, 1,
0.5197197, 0.4481566, 1.551586, 0, 0, 0, 1, 1,
0.5198386, -0.461131, 2.00423, 0, 0, 0, 1, 1,
0.5357059, -0.910072, 3.153565, 1, 1, 1, 1, 1,
0.5436532, -1.462878, 3.476099, 1, 1, 1, 1, 1,
0.543869, 0.6688351, -0.2815175, 1, 1, 1, 1, 1,
0.5461735, 1.139701, 1.00192, 1, 1, 1, 1, 1,
0.5538043, -0.008422399, -0.09962376, 1, 1, 1, 1, 1,
0.5583429, 0.3479151, 0.8194252, 1, 1, 1, 1, 1,
0.5602408, 0.6599131, 1.664305, 1, 1, 1, 1, 1,
0.570644, 0.3988857, -1.669327, 1, 1, 1, 1, 1,
0.5725856, 1.403706, -0.3105825, 1, 1, 1, 1, 1,
0.5798486, -1.116123, 2.411914, 1, 1, 1, 1, 1,
0.5879033, 1.680438, 1.605398, 1, 1, 1, 1, 1,
0.5887011, 2.44773, -0.2320292, 1, 1, 1, 1, 1,
0.5960371, 0.2822036, 1.08578, 1, 1, 1, 1, 1,
0.601696, 0.940069, 0.1797805, 1, 1, 1, 1, 1,
0.6063696, -0.6255295, 0.9144585, 1, 1, 1, 1, 1,
0.6101783, -0.4492248, 3.667048, 0, 0, 1, 1, 1,
0.6102992, -1.515701, 3.35954, 1, 0, 0, 1, 1,
0.6112409, 0.3522176, 0.4631646, 1, 0, 0, 1, 1,
0.615182, -0.4774504, 2.658503, 1, 0, 0, 1, 1,
0.6171688, -0.6956017, 2.929241, 1, 0, 0, 1, 1,
0.6193842, 0.1086448, 1.421327, 1, 0, 0, 1, 1,
0.6216092, -1.73374, 1.316391, 0, 0, 0, 1, 1,
0.6219466, 0.6726137, 2.935642, 0, 0, 0, 1, 1,
0.6260469, 0.2864639, 1.979277, 0, 0, 0, 1, 1,
0.6268966, 0.5784622, 0.1212932, 0, 0, 0, 1, 1,
0.6275415, 0.8312556, 1.907552, 0, 0, 0, 1, 1,
0.6331018, -1.541627, 1.719604, 0, 0, 0, 1, 1,
0.6351149, 0.5147022, 2.883826, 0, 0, 0, 1, 1,
0.6363049, -0.8009325, 1.988132, 1, 1, 1, 1, 1,
0.6377009, -2.107597, 4.232619, 1, 1, 1, 1, 1,
0.6406144, 0.1028296, -0.9208246, 1, 1, 1, 1, 1,
0.6407542, 0.7465683, 0.951581, 1, 1, 1, 1, 1,
0.6420469, -0.9362546, 2.768014, 1, 1, 1, 1, 1,
0.6440232, -0.3226649, 3.009357, 1, 1, 1, 1, 1,
0.6485862, -1.957025, 3.396713, 1, 1, 1, 1, 1,
0.6489376, 0.4701536, 0.9378549, 1, 1, 1, 1, 1,
0.6535915, 1.250693, 0.6981413, 1, 1, 1, 1, 1,
0.6540126, -1.516575, 3.751685, 1, 1, 1, 1, 1,
0.655006, -0.3770746, 2.545294, 1, 1, 1, 1, 1,
0.660803, 0.6829976, -0.2319958, 1, 1, 1, 1, 1,
0.6616416, -0.4063234, 3.044271, 1, 1, 1, 1, 1,
0.6629058, -1.162128, 3.598738, 1, 1, 1, 1, 1,
0.663734, -1.064255, 2.066822, 1, 1, 1, 1, 1,
0.6676344, -1.502333, 3.009273, 0, 0, 1, 1, 1,
0.6689433, 0.6065858, 1.555525, 1, 0, 0, 1, 1,
0.6699143, -1.743382, 3.454751, 1, 0, 0, 1, 1,
0.6700014, -0.7325685, 3.491047, 1, 0, 0, 1, 1,
0.6700256, -0.9218778, 1.899153, 1, 0, 0, 1, 1,
0.6713946, -0.0445458, 0.9860256, 1, 0, 0, 1, 1,
0.6738026, 0.1687901, 2.079874, 0, 0, 0, 1, 1,
0.676335, -1.238436, 0.1420641, 0, 0, 0, 1, 1,
0.6905273, -1.111794, 2.838283, 0, 0, 0, 1, 1,
0.6985514, -0.28608, 0.6484105, 0, 0, 0, 1, 1,
0.7032072, -0.9237213, 1.595697, 0, 0, 0, 1, 1,
0.7045542, -0.6359817, 0.6038479, 0, 0, 0, 1, 1,
0.7047052, -0.3908629, 1.230841, 0, 0, 0, 1, 1,
0.7058126, -1.613297, 1.487673, 1, 1, 1, 1, 1,
0.7059525, -0.1524433, 1.993132, 1, 1, 1, 1, 1,
0.7085235, -0.1081905, 3.27595, 1, 1, 1, 1, 1,
0.7113568, -1.971889, 3.216171, 1, 1, 1, 1, 1,
0.7126955, 0.6215008, 1.306126, 1, 1, 1, 1, 1,
0.7184882, -0.6682527, 3.023932, 1, 1, 1, 1, 1,
0.7208531, 0.5346776, 2.681228, 1, 1, 1, 1, 1,
0.7227128, 1.766875, 1.68864, 1, 1, 1, 1, 1,
0.7252605, -1.263175, 3.065126, 1, 1, 1, 1, 1,
0.7261736, 1.474741, 0.9121605, 1, 1, 1, 1, 1,
0.7262934, -1.070156, 2.696021, 1, 1, 1, 1, 1,
0.7283968, -1.015321, 3.096677, 1, 1, 1, 1, 1,
0.729012, 0.8728667, 0.2011671, 1, 1, 1, 1, 1,
0.7309142, 0.833497, -1.251358, 1, 1, 1, 1, 1,
0.7311698, -1.171037, 1.626134, 1, 1, 1, 1, 1,
0.7332144, -0.247337, 1.142937, 0, 0, 1, 1, 1,
0.7343205, -1.125876, 0.8677309, 1, 0, 0, 1, 1,
0.7343512, -0.2435447, -0.007628536, 1, 0, 0, 1, 1,
0.740416, 0.7795559, -0.1644588, 1, 0, 0, 1, 1,
0.7429702, -0.1674227, 0.1191588, 1, 0, 0, 1, 1,
0.7511096, -0.242066, 1.834756, 1, 0, 0, 1, 1,
0.7515837, -0.7327979, 0.1282423, 0, 0, 0, 1, 1,
0.7527476, 0.2612871, 1.85824, 0, 0, 0, 1, 1,
0.7529535, -0.4892465, 2.294382, 0, 0, 0, 1, 1,
0.7532203, -0.2374804, 3.319885, 0, 0, 0, 1, 1,
0.7555711, 1.210669, 0.683182, 0, 0, 0, 1, 1,
0.7596508, 0.06475174, 0.9679271, 0, 0, 0, 1, 1,
0.7603453, 1.437608, 0.9268056, 0, 0, 0, 1, 1,
0.7615103, 0.5202621, 1.15542, 1, 1, 1, 1, 1,
0.7642615, -1.870492, 0.8553776, 1, 1, 1, 1, 1,
0.7658657, 0.9490021, -0.2895127, 1, 1, 1, 1, 1,
0.7707213, 0.8257417, 1.57724, 1, 1, 1, 1, 1,
0.7707964, 2.020452, -1.674327, 1, 1, 1, 1, 1,
0.7726557, -0.1819644, 0.8203838, 1, 1, 1, 1, 1,
0.7759236, 0.3533263, 0.292178, 1, 1, 1, 1, 1,
0.7768801, -0.8317494, 1.753587, 1, 1, 1, 1, 1,
0.7792465, -0.3037357, 1.980648, 1, 1, 1, 1, 1,
0.7809481, -1.230361, 0.8182105, 1, 1, 1, 1, 1,
0.7835109, -1.6123, 1.56029, 1, 1, 1, 1, 1,
0.7846237, 1.976166, -0.6219283, 1, 1, 1, 1, 1,
0.7899271, -0.2765823, 2.808648, 1, 1, 1, 1, 1,
0.7964849, -2.136969, 2.738175, 1, 1, 1, 1, 1,
0.8129788, -0.6272882, 0.9707588, 1, 1, 1, 1, 1,
0.8146486, -0.663651, 3.731593, 0, 0, 1, 1, 1,
0.82121, 0.6597387, 0.09524897, 1, 0, 0, 1, 1,
0.8288037, -0.6245323, 0.8292598, 1, 0, 0, 1, 1,
0.8332551, 1.065227, 0.7898384, 1, 0, 0, 1, 1,
0.8368589, 1.822489, 0.9874957, 1, 0, 0, 1, 1,
0.8480916, -1.218117, 1.120931, 1, 0, 0, 1, 1,
0.8512766, 0.5047556, 1.784558, 0, 0, 0, 1, 1,
0.8593979, 0.3709497, 0.0654835, 0, 0, 0, 1, 1,
0.8695207, 1.989347, 0.8199691, 0, 0, 0, 1, 1,
0.8709735, 0.5757166, 2.319524, 0, 0, 0, 1, 1,
0.8721029, 0.786761, 1.556557, 0, 0, 0, 1, 1,
0.8730265, 0.8659983, 0.06483013, 0, 0, 0, 1, 1,
0.875222, -0.8276254, 3.098482, 0, 0, 0, 1, 1,
0.8790959, -0.8000841, 2.464713, 1, 1, 1, 1, 1,
0.8801873, 0.6960393, 0.9313653, 1, 1, 1, 1, 1,
0.880415, 2.373383, -0.721828, 1, 1, 1, 1, 1,
0.8849356, -0.4013849, 2.564761, 1, 1, 1, 1, 1,
0.8880152, 0.7347082, -1.629737, 1, 1, 1, 1, 1,
0.9049653, -0.3618962, 0.9151706, 1, 1, 1, 1, 1,
0.9094144, 1.269244, 0.1726991, 1, 1, 1, 1, 1,
0.9100837, 1.362365, 0.1561579, 1, 1, 1, 1, 1,
0.9155435, -0.4388928, 0.6198882, 1, 1, 1, 1, 1,
0.9156315, 0.9737845, 0.653256, 1, 1, 1, 1, 1,
0.92813, -2.549819, 2.133154, 1, 1, 1, 1, 1,
0.9289215, 0.8260499, -0.03985719, 1, 1, 1, 1, 1,
0.9295651, -0.9556128, 2.059623, 1, 1, 1, 1, 1,
0.9317457, 0.6612249, 0.7742203, 1, 1, 1, 1, 1,
0.9381077, -0.4729917, 2.425736, 1, 1, 1, 1, 1,
0.940118, 0.7058579, 0.8624174, 0, 0, 1, 1, 1,
0.9422497, 0.4944357, 3.147656, 1, 0, 0, 1, 1,
0.9450206, -0.4171165, 2.587284, 1, 0, 0, 1, 1,
0.9462167, 0.7186999, 0.7111605, 1, 0, 0, 1, 1,
0.9483661, 0.5634836, 0.1691356, 1, 0, 0, 1, 1,
0.9509265, -0.677997, 1.728365, 1, 0, 0, 1, 1,
0.9587909, -0.7251727, 1.974231, 0, 0, 0, 1, 1,
0.9600152, -0.7588832, 2.717123, 0, 0, 0, 1, 1,
0.9687968, 2.596802, 0.07938764, 0, 0, 0, 1, 1,
0.9722002, 0.2111566, 1.127999, 0, 0, 0, 1, 1,
0.9781511, 1.049081, -0.5922837, 0, 0, 0, 1, 1,
0.9794342, 1.888383, 0.1066729, 0, 0, 0, 1, 1,
0.9798281, -0.8155239, 1.009104, 0, 0, 0, 1, 1,
0.9832468, 1.189009, -1.295717, 1, 1, 1, 1, 1,
0.9916745, 0.5479332, 1.543986, 1, 1, 1, 1, 1,
0.9934228, 0.7941704, -0.470917, 1, 1, 1, 1, 1,
0.996273, -1.187374, 3.107423, 1, 1, 1, 1, 1,
0.9981295, -0.1388578, 2.903092, 1, 1, 1, 1, 1,
1.002527, -0.8837966, 2.775507, 1, 1, 1, 1, 1,
1.008175, 0.6381532, 1.080716, 1, 1, 1, 1, 1,
1.016963, -0.3931052, 1.537962, 1, 1, 1, 1, 1,
1.019691, 0.3318812, 0.6600165, 1, 1, 1, 1, 1,
1.028085, -1.561711, 3.477431, 1, 1, 1, 1, 1,
1.02815, -1.24174, 2.583998, 1, 1, 1, 1, 1,
1.03061, 2.0882, 0.7683718, 1, 1, 1, 1, 1,
1.031411, 0.2667693, 1.960292, 1, 1, 1, 1, 1,
1.032285, -0.3381869, 1.786108, 1, 1, 1, 1, 1,
1.035227, -1.013788, 0.6903099, 1, 1, 1, 1, 1,
1.035309, -0.1599628, 1.774182, 0, 0, 1, 1, 1,
1.040906, -0.1007472, 2.721295, 1, 0, 0, 1, 1,
1.041062, -0.3617851, 2.457677, 1, 0, 0, 1, 1,
1.044018, -0.3380662, 0.9067747, 1, 0, 0, 1, 1,
1.055213, -0.4957288, 0.7107679, 1, 0, 0, 1, 1,
1.057889, -0.778748, 2.4697, 1, 0, 0, 1, 1,
1.058868, -0.8354784, 2.365738, 0, 0, 0, 1, 1,
1.063056, -0.1979499, 0.2871173, 0, 0, 0, 1, 1,
1.073533, 0.1188294, -0.01994018, 0, 0, 0, 1, 1,
1.079014, 0.93094, 0.8972066, 0, 0, 0, 1, 1,
1.08976, 2.924207, 0.3376197, 0, 0, 0, 1, 1,
1.103598, 1.962363, 1.039003, 0, 0, 0, 1, 1,
1.105881, -1.022221, 2.782845, 0, 0, 0, 1, 1,
1.10837, 0.8327631, 0.4265594, 1, 1, 1, 1, 1,
1.121789, -2.012267, 3.20496, 1, 1, 1, 1, 1,
1.133916, 0.5739007, -1.665487, 1, 1, 1, 1, 1,
1.136369, 0.1583357, 0.4372122, 1, 1, 1, 1, 1,
1.144497, 0.9197526, 1.138538, 1, 1, 1, 1, 1,
1.151213, -1.106587, 1.002813, 1, 1, 1, 1, 1,
1.164511, 1.241607, 0.2209901, 1, 1, 1, 1, 1,
1.174546, -0.985762, 2.052631, 1, 1, 1, 1, 1,
1.179367, 0.2675078, 0.1144241, 1, 1, 1, 1, 1,
1.182689, 0.5372177, 0.8931187, 1, 1, 1, 1, 1,
1.186238, -0.3917442, 2.427347, 1, 1, 1, 1, 1,
1.201877, 0.1316427, 0.8861557, 1, 1, 1, 1, 1,
1.202659, 1.417126, 0.7614684, 1, 1, 1, 1, 1,
1.207158, 0.1178962, 1.582964, 1, 1, 1, 1, 1,
1.211335, -0.2773229, 2.461013, 1, 1, 1, 1, 1,
1.217, -0.06801208, 1.743525, 0, 0, 1, 1, 1,
1.21895, -1.577082, 1.473714, 1, 0, 0, 1, 1,
1.230505, -1.111414, 3.566578, 1, 0, 0, 1, 1,
1.241366, 0.5474361, 1.697845, 1, 0, 0, 1, 1,
1.245206, 0.2324764, 1.085776, 1, 0, 0, 1, 1,
1.245333, 1.659477, -1.505784, 1, 0, 0, 1, 1,
1.24667, 0.617636, 1.899306, 0, 0, 0, 1, 1,
1.247255, 0.7150137, 0.9419718, 0, 0, 0, 1, 1,
1.250436, 1.002484, -0.2665652, 0, 0, 0, 1, 1,
1.266, -0.4682055, 1.349022, 0, 0, 0, 1, 1,
1.266006, -1.375002, 0.9431922, 0, 0, 0, 1, 1,
1.286605, -2.291404, 3.451839, 0, 0, 0, 1, 1,
1.287389, -1.656872, 2.804778, 0, 0, 0, 1, 1,
1.289167, -0.06422531, 1.143302, 1, 1, 1, 1, 1,
1.289325, -1.6472, 5.081161, 1, 1, 1, 1, 1,
1.293796, -0.4586192, 1.904741, 1, 1, 1, 1, 1,
1.298942, 1.295275, 1.00497, 1, 1, 1, 1, 1,
1.299305, -0.2304229, 0.3865443, 1, 1, 1, 1, 1,
1.300844, -0.0499814, 1.647432, 1, 1, 1, 1, 1,
1.309128, 0.6532606, 2.255301, 1, 1, 1, 1, 1,
1.313944, 0.916398, 1.798452, 1, 1, 1, 1, 1,
1.317776, 0.1151136, 1.796017, 1, 1, 1, 1, 1,
1.318339, -0.2873765, 2.172269, 1, 1, 1, 1, 1,
1.319016, 0.844028, 1.857774, 1, 1, 1, 1, 1,
1.323527, 1.521221, -0.1827561, 1, 1, 1, 1, 1,
1.325875, -0.7398103, 1.994105, 1, 1, 1, 1, 1,
1.327726, -0.7422462, 2.695305, 1, 1, 1, 1, 1,
1.330399, 0.6893051, -0.004255167, 1, 1, 1, 1, 1,
1.338698, -1.072936, 2.954945, 0, 0, 1, 1, 1,
1.339805, -1.248173, 3.575426, 1, 0, 0, 1, 1,
1.340892, -0.08158374, 2.055242, 1, 0, 0, 1, 1,
1.343848, -0.9063523, 3.366819, 1, 0, 0, 1, 1,
1.35478, 1.062191, 2.471785, 1, 0, 0, 1, 1,
1.364227, -0.3584306, 1.752406, 1, 0, 0, 1, 1,
1.371818, 0.7855896, 1.401346, 0, 0, 0, 1, 1,
1.384932, -0.6131199, 2.814586, 0, 0, 0, 1, 1,
1.404089, 0.4804675, 5.551288, 0, 0, 0, 1, 1,
1.407793, 1.130719, 1.126999, 0, 0, 0, 1, 1,
1.409637, -1.286761, 1.9378, 0, 0, 0, 1, 1,
1.4246, 0.5045664, 0.7929128, 0, 0, 0, 1, 1,
1.430836, 0.9871424, 0.03276695, 0, 0, 0, 1, 1,
1.438657, -0.1785025, 4.025332, 1, 1, 1, 1, 1,
1.43927, 0.8069496, 4.424211, 1, 1, 1, 1, 1,
1.444235, -2.210118, 2.839226, 1, 1, 1, 1, 1,
1.464724, 0.2984505, 1.758877, 1, 1, 1, 1, 1,
1.480894, -0.5161506, 1.21021, 1, 1, 1, 1, 1,
1.513086, -1.348073, 1.195155, 1, 1, 1, 1, 1,
1.516181, -1.276086, 2.471352, 1, 1, 1, 1, 1,
1.519274, 0.006456825, 3.759233, 1, 1, 1, 1, 1,
1.521318, 0.4110444, 1.391982, 1, 1, 1, 1, 1,
1.526413, -1.372135, 0.4843598, 1, 1, 1, 1, 1,
1.533781, -0.4823172, 0.5967337, 1, 1, 1, 1, 1,
1.537977, 1.249725, -0.07578611, 1, 1, 1, 1, 1,
1.53944, -0.6469764, 2.480757, 1, 1, 1, 1, 1,
1.552543, 0.1310523, 2.417915, 1, 1, 1, 1, 1,
1.558404, -0.84425, 0.4511667, 1, 1, 1, 1, 1,
1.56996, -0.7384142, 1.504209, 0, 0, 1, 1, 1,
1.58376, 0.5272715, 1.983269, 1, 0, 0, 1, 1,
1.592826, 0.5492476, -0.4735639, 1, 0, 0, 1, 1,
1.595189, -0.5250068, 0.5543057, 1, 0, 0, 1, 1,
1.610975, 1.777679, 1.316445, 1, 0, 0, 1, 1,
1.612255, -0.3727452, 2.88289, 1, 0, 0, 1, 1,
1.623079, -0.647884, 2.684719, 0, 0, 0, 1, 1,
1.623297, 1.889346, 0.3370521, 0, 0, 0, 1, 1,
1.638984, -1.07281, 1.286543, 0, 0, 0, 1, 1,
1.64387, 1.300264, 0.2714868, 0, 0, 0, 1, 1,
1.648626, 0.8388039, 0.2342697, 0, 0, 0, 1, 1,
1.669404, -0.3531695, 1.199712, 0, 0, 0, 1, 1,
1.688356, 1.16601, 1.302302, 0, 0, 0, 1, 1,
1.699502, -1.19612, 0.6302581, 1, 1, 1, 1, 1,
1.719271, -3.008372, 2.443571, 1, 1, 1, 1, 1,
1.749488, 0.2607387, 2.159082, 1, 1, 1, 1, 1,
1.770526, 0.162773, 2.075916, 1, 1, 1, 1, 1,
1.782, -0.5131772, 1.986071, 1, 1, 1, 1, 1,
1.793904, -1.402684, 2.227537, 1, 1, 1, 1, 1,
1.811247, -0.439523, 4.251177, 1, 1, 1, 1, 1,
1.821358, 0.5993224, 0.4236973, 1, 1, 1, 1, 1,
1.822459, 0.9784623, 1.179348, 1, 1, 1, 1, 1,
1.854024, -0.8493305, -0.6978089, 1, 1, 1, 1, 1,
1.859767, 0.9109959, 0.7489775, 1, 1, 1, 1, 1,
1.86264, -0.9772623, 0.7778896, 1, 1, 1, 1, 1,
1.86374, 1.00423, 0.1608766, 1, 1, 1, 1, 1,
1.872406, 1.379463, -0.09115717, 1, 1, 1, 1, 1,
1.87248, 1.148251, 0.1976977, 1, 1, 1, 1, 1,
1.883648, 0.09117679, 1.832619, 0, 0, 1, 1, 1,
1.892499, 1.312469, 1.532787, 1, 0, 0, 1, 1,
1.90937, -1.106632, 1.467999, 1, 0, 0, 1, 1,
1.919942, 0.6889967, 1.519846, 1, 0, 0, 1, 1,
1.93594, -2.374343, 1.672077, 1, 0, 0, 1, 1,
1.943416, -0.9858866, 1.707056, 1, 0, 0, 1, 1,
1.976953, 2.081196, -0.2132834, 0, 0, 0, 1, 1,
2.046918, 1.184245, 0.5068753, 0, 0, 0, 1, 1,
2.053563, -0.4721971, 1.650678, 0, 0, 0, 1, 1,
2.070084, 1.290468, 2.06584, 0, 0, 0, 1, 1,
2.133414, 0.2158287, 2.143757, 0, 0, 0, 1, 1,
2.148559, 0.750443, 3.558787, 0, 0, 0, 1, 1,
2.185177, 1.16138, 0.7409692, 0, 0, 0, 1, 1,
2.294573, 1.567211, 1.313108, 1, 1, 1, 1, 1,
2.313128, -0.2590969, 1.086002, 1, 1, 1, 1, 1,
2.497339, -0.6187116, 2.614471, 1, 1, 1, 1, 1,
2.54605, 1.239663, 0.2636807, 1, 1, 1, 1, 1,
2.565062, -0.6821223, 4.612899, 1, 1, 1, 1, 1,
2.650968, 0.6310816, 0.9894748, 1, 1, 1, 1, 1,
2.682715, -1.680256, 1.960756, 1, 1, 1, 1, 1
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
var radius = 9.892145;
var distance = 34.74574;
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
mvMatrix.translate( 0.5755706, 0.04208279, 0.304882 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.74574);
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