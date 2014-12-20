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
-3.679635, 0.5410222, -0.9037558, 1, 0, 0, 1,
-3.212208, -0.07035429, -1.318815, 1, 0.007843138, 0, 1,
-3.181388, 0.6558033, -1.305025, 1, 0.01176471, 0, 1,
-2.830945, -0.06987347, -2.337506, 1, 0.01960784, 0, 1,
-2.465389, -2.457793, -5.524286, 1, 0.02352941, 0, 1,
-2.459714, -0.8615567, -0.8513677, 1, 0.03137255, 0, 1,
-2.433961, -2.473339, -2.83583, 1, 0.03529412, 0, 1,
-2.372213, -1.10827, -3.110187, 1, 0.04313726, 0, 1,
-2.344261, 0.3921041, 0.268202, 1, 0.04705882, 0, 1,
-2.323816, -2.333624, -1.742363, 1, 0.05490196, 0, 1,
-2.312154, 1.839709, -2.249787, 1, 0.05882353, 0, 1,
-2.201004, -1.503809, -5.648138, 1, 0.06666667, 0, 1,
-2.199963, 0.220216, 0.2587434, 1, 0.07058824, 0, 1,
-2.190748, 1.334567, -3.078547, 1, 0.07843138, 0, 1,
-2.176786, 1.669721, -0.9235371, 1, 0.08235294, 0, 1,
-2.168655, 0.4027189, -2.494208, 1, 0.09019608, 0, 1,
-2.105108, -0.8233824, -1.528608, 1, 0.09411765, 0, 1,
-2.077868, -1.233611, -3.466524, 1, 0.1019608, 0, 1,
-2.061714, 1.968634, -1.562374, 1, 0.1098039, 0, 1,
-2.057524, -1.663795, -1.268243, 1, 0.1137255, 0, 1,
-2.007158, 1.619078, -2.1411, 1, 0.1215686, 0, 1,
-1.999644, 0.2969607, -2.679493, 1, 0.1254902, 0, 1,
-1.976856, -1.009146, -3.484779, 1, 0.1333333, 0, 1,
-1.960432, 0.1761354, -2.333355, 1, 0.1372549, 0, 1,
-1.95511, -0.07063555, -1.751479, 1, 0.145098, 0, 1,
-1.94995, -0.3331092, -2.510853, 1, 0.1490196, 0, 1,
-1.94758, -0.6166547, -0.1826783, 1, 0.1568628, 0, 1,
-1.932014, -0.8319817, -1.199607, 1, 0.1607843, 0, 1,
-1.915939, -1.055035, -1.152567, 1, 0.1686275, 0, 1,
-1.905583, -1.392757, -1.945136, 1, 0.172549, 0, 1,
-1.866262, -0.441581, -0.3593459, 1, 0.1803922, 0, 1,
-1.858632, 0.9062614, -1.557459, 1, 0.1843137, 0, 1,
-1.839502, -0.4847535, -2.464559, 1, 0.1921569, 0, 1,
-1.838206, 0.4253549, -1.37205, 1, 0.1960784, 0, 1,
-1.835547, 0.4469671, -2.429057, 1, 0.2039216, 0, 1,
-1.82106, 1.015471, -2.369178, 1, 0.2117647, 0, 1,
-1.818804, -1.621831, -2.843126, 1, 0.2156863, 0, 1,
-1.739043, -1.070096, -2.871478, 1, 0.2235294, 0, 1,
-1.737406, 0.8456317, -1.437179, 1, 0.227451, 0, 1,
-1.724496, 0.8871702, 0.6570404, 1, 0.2352941, 0, 1,
-1.718022, -0.2824203, -2.54589, 1, 0.2392157, 0, 1,
-1.708911, 3.012939, -0.5025814, 1, 0.2470588, 0, 1,
-1.702346, 1.21676, -0.3866072, 1, 0.2509804, 0, 1,
-1.682702, 1.255429, -0.1478284, 1, 0.2588235, 0, 1,
-1.65131, 0.783465, -1.285324, 1, 0.2627451, 0, 1,
-1.643621, -0.3582174, -1.538545, 1, 0.2705882, 0, 1,
-1.6198, -0.9512585, -3.833404, 1, 0.2745098, 0, 1,
-1.619482, -1.53869, -1.576657, 1, 0.282353, 0, 1,
-1.612101, -0.2820758, -2.327966, 1, 0.2862745, 0, 1,
-1.598188, -0.2266436, -1.770137, 1, 0.2941177, 0, 1,
-1.578734, -1.510742, -3.223165, 1, 0.3019608, 0, 1,
-1.57699, 0.9370317, -0.1455065, 1, 0.3058824, 0, 1,
-1.562633, -0.2931505, -2.027511, 1, 0.3137255, 0, 1,
-1.553316, -1.446739, -1.976311, 1, 0.3176471, 0, 1,
-1.551162, 0.07316595, -0.373645, 1, 0.3254902, 0, 1,
-1.550431, -0.4670738, -0.7232851, 1, 0.3294118, 0, 1,
-1.547378, 0.8954951, 0.141063, 1, 0.3372549, 0, 1,
-1.547297, 0.3137293, -2.100035, 1, 0.3411765, 0, 1,
-1.531712, 0.8520177, -1.501593, 1, 0.3490196, 0, 1,
-1.527011, 0.3069928, -0.2498252, 1, 0.3529412, 0, 1,
-1.526415, -0.5458997, -1.251384, 1, 0.3607843, 0, 1,
-1.520968, -0.3010727, -0.1522755, 1, 0.3647059, 0, 1,
-1.511436, -1.427467, -2.922998, 1, 0.372549, 0, 1,
-1.496661, 1.144199, -0.5989565, 1, 0.3764706, 0, 1,
-1.477503, 0.8826539, -1.247472, 1, 0.3843137, 0, 1,
-1.473376, 0.3142826, -2.553982, 1, 0.3882353, 0, 1,
-1.452047, 0.3543437, -2.266879, 1, 0.3960784, 0, 1,
-1.443648, 0.976706, -1.468858, 1, 0.4039216, 0, 1,
-1.442594, 0.320998, -0.8121304, 1, 0.4078431, 0, 1,
-1.429562, 0.6649028, -1.10051, 1, 0.4156863, 0, 1,
-1.428006, -2.37471, -3.18241, 1, 0.4196078, 0, 1,
-1.420835, 0.188141, -1.60001, 1, 0.427451, 0, 1,
-1.409086, -1.953072, -1.489403, 1, 0.4313726, 0, 1,
-1.404361, -0.3906263, -1.931178, 1, 0.4392157, 0, 1,
-1.397699, -0.6244236, 0.5308924, 1, 0.4431373, 0, 1,
-1.397209, 1.272962, -0.8298658, 1, 0.4509804, 0, 1,
-1.395791, 0.9622764, -2.324687, 1, 0.454902, 0, 1,
-1.395296, -2.067422, -3.419448, 1, 0.4627451, 0, 1,
-1.392536, -0.7061967, -1.762207, 1, 0.4666667, 0, 1,
-1.391055, 1.309372, -0.02735092, 1, 0.4745098, 0, 1,
-1.390583, 0.07621179, -2.993048, 1, 0.4784314, 0, 1,
-1.374915, 1.280581, -3.199985, 1, 0.4862745, 0, 1,
-1.372391, 1.390729, -0.540406, 1, 0.4901961, 0, 1,
-1.369369, -0.4541614, -3.028694, 1, 0.4980392, 0, 1,
-1.368037, -2.624341, -2.618216, 1, 0.5058824, 0, 1,
-1.344861, 0.5778672, -0.3232504, 1, 0.509804, 0, 1,
-1.337697, 1.633912, -1.846974, 1, 0.5176471, 0, 1,
-1.336723, -0.2417054, -2.58219, 1, 0.5215687, 0, 1,
-1.332368, -0.6342437, -2.128042, 1, 0.5294118, 0, 1,
-1.3222, 0.8232687, 0.6728527, 1, 0.5333334, 0, 1,
-1.312375, -0.3551472, -1.875889, 1, 0.5411765, 0, 1,
-1.310997, -0.2316514, -3.657465, 1, 0.5450981, 0, 1,
-1.308919, 0.9556943, -1.567926, 1, 0.5529412, 0, 1,
-1.308259, 1.191138, -1.90752, 1, 0.5568628, 0, 1,
-1.304293, 1.847663, -0.7353321, 1, 0.5647059, 0, 1,
-1.302543, -1.400951, -1.85177, 1, 0.5686275, 0, 1,
-1.300152, 1.517979, -1.774437, 1, 0.5764706, 0, 1,
-1.297977, -0.313266, -0.5258071, 1, 0.5803922, 0, 1,
-1.296053, -0.1696305, -3.198635, 1, 0.5882353, 0, 1,
-1.295581, -0.2680909, -2.399559, 1, 0.5921569, 0, 1,
-1.294463, -0.9861249, -2.240589, 1, 0.6, 0, 1,
-1.292651, 0.7335218, -1.892449, 1, 0.6078432, 0, 1,
-1.286726, 0.9687974, -1.706783, 1, 0.6117647, 0, 1,
-1.283102, 1.84175, 0.4446916, 1, 0.6196079, 0, 1,
-1.282177, -0.6956471, -3.121052, 1, 0.6235294, 0, 1,
-1.279153, 0.107249, -3.428574, 1, 0.6313726, 0, 1,
-1.278329, -1.101758, -3.478605, 1, 0.6352941, 0, 1,
-1.268843, 0.2886349, -2.524905, 1, 0.6431373, 0, 1,
-1.262077, -1.211647, -2.07748, 1, 0.6470588, 0, 1,
-1.259669, -0.7346707, -2.47788, 1, 0.654902, 0, 1,
-1.247019, 0.2502325, -0.007156771, 1, 0.6588235, 0, 1,
-1.246295, 0.5539575, -0.7707902, 1, 0.6666667, 0, 1,
-1.239283, 0.5864143, -0.3749631, 1, 0.6705883, 0, 1,
-1.226343, 0.1527795, -2.862043, 1, 0.6784314, 0, 1,
-1.220181, 0.3242953, -1.666366, 1, 0.682353, 0, 1,
-1.210544, 0.04900965, -1.800014, 1, 0.6901961, 0, 1,
-1.206652, 2.062758, 1.312268, 1, 0.6941177, 0, 1,
-1.202356, -0.3153386, -1.142836, 1, 0.7019608, 0, 1,
-1.199659, -0.6346447, -1.868445, 1, 0.7098039, 0, 1,
-1.197914, 0.1776293, -0.1642917, 1, 0.7137255, 0, 1,
-1.190285, 0.278906, -2.270885, 1, 0.7215686, 0, 1,
-1.17923, 0.2728923, -1.082958, 1, 0.7254902, 0, 1,
-1.178301, 0.0136959, -1.58366, 1, 0.7333333, 0, 1,
-1.17782, -0.6942431, -1.978893, 1, 0.7372549, 0, 1,
-1.177629, 2.064974, -1.356512, 1, 0.7450981, 0, 1,
-1.175538, 0.2166694, -0.7662871, 1, 0.7490196, 0, 1,
-1.170391, -0.6596119, -2.427817, 1, 0.7568628, 0, 1,
-1.168241, 0.7797182, -0.8418565, 1, 0.7607843, 0, 1,
-1.161744, 0.3950303, -1.179504, 1, 0.7686275, 0, 1,
-1.160619, -0.5855803, -1.957054, 1, 0.772549, 0, 1,
-1.160085, -0.9283501, -3.300799, 1, 0.7803922, 0, 1,
-1.154605, 0.7547426, -1.45328, 1, 0.7843137, 0, 1,
-1.15361, -0.5449833, -2.893229, 1, 0.7921569, 0, 1,
-1.151679, -1.795671, -1.09332, 1, 0.7960784, 0, 1,
-1.149654, -0.6327202, -3.279187, 1, 0.8039216, 0, 1,
-1.144768, 1.176195, -0.7302259, 1, 0.8117647, 0, 1,
-1.144287, -1.674124, -1.206815, 1, 0.8156863, 0, 1,
-1.139247, -0.1722654, -0.1550453, 1, 0.8235294, 0, 1,
-1.136397, 1.441952, 0.5417818, 1, 0.827451, 0, 1,
-1.119338, 1.587111, -0.4381845, 1, 0.8352941, 0, 1,
-1.116352, 2.085716, -0.2393534, 1, 0.8392157, 0, 1,
-1.103751, -0.3919175, -1.971762, 1, 0.8470588, 0, 1,
-1.103235, 0.09774552, -2.420521, 1, 0.8509804, 0, 1,
-1.101219, 0.5741846, -0.9604043, 1, 0.8588235, 0, 1,
-1.097259, 0.969435, -1.358466, 1, 0.8627451, 0, 1,
-1.097106, 0.8814636, -2.375074, 1, 0.8705882, 0, 1,
-1.087717, -0.6959698, 0.3487119, 1, 0.8745098, 0, 1,
-1.081656, 0.8831334, -1.03914, 1, 0.8823529, 0, 1,
-1.081539, -1.723796, -2.123012, 1, 0.8862745, 0, 1,
-1.075715, 0.4593552, -0.8543891, 1, 0.8941177, 0, 1,
-1.074397, 0.4423965, -0.8179618, 1, 0.8980392, 0, 1,
-1.067763, 0.5351619, -2.285944, 1, 0.9058824, 0, 1,
-1.065715, 1.299741, -1.074128, 1, 0.9137255, 0, 1,
-1.064535, 0.5860639, -1.877284, 1, 0.9176471, 0, 1,
-1.059664, -0.2947357, -3.831876, 1, 0.9254902, 0, 1,
-1.054119, -1.109189, -3.011021, 1, 0.9294118, 0, 1,
-1.045567, 0.7833136, -1.461829, 1, 0.9372549, 0, 1,
-1.045419, 0.895983, 0.07613812, 1, 0.9411765, 0, 1,
-1.045334, 1.862912, 0.6539707, 1, 0.9490196, 0, 1,
-1.043074, 1.366951, -0.7888529, 1, 0.9529412, 0, 1,
-1.042335, -0.909981, -1.120434, 1, 0.9607843, 0, 1,
-1.039923, 0.1455939, -2.39872, 1, 0.9647059, 0, 1,
-1.03969, -0.308595, -1.732486, 1, 0.972549, 0, 1,
-1.030183, 0.6238515, -0.218193, 1, 0.9764706, 0, 1,
-1.02531, -0.5657031, -2.373488, 1, 0.9843137, 0, 1,
-1.020028, -0.2853645, -2.105216, 1, 0.9882353, 0, 1,
-1.01947, 0.1416923, -0.9366048, 1, 0.9960784, 0, 1,
-1.014776, 0.9222996, -0.1616126, 0.9960784, 1, 0, 1,
-1.013644, 0.001515916, -1.827119, 0.9921569, 1, 0, 1,
-1.002928, -0.2602694, -2.212632, 0.9843137, 1, 0, 1,
-0.997892, 0.03611666, -3.60877, 0.9803922, 1, 0, 1,
-0.9969115, 1.596521, -0.7585098, 0.972549, 1, 0, 1,
-0.9961477, -0.534825, -3.410126, 0.9686275, 1, 0, 1,
-0.9841716, -0.4484538, -1.157359, 0.9607843, 1, 0, 1,
-0.9828447, 2.206529, 1.597767, 0.9568627, 1, 0, 1,
-0.9728789, -0.4353707, -1.511035, 0.9490196, 1, 0, 1,
-0.9674389, -1.774905, -1.769688, 0.945098, 1, 0, 1,
-0.9603871, 1.181138, -0.6435822, 0.9372549, 1, 0, 1,
-0.9570554, -1.731471, -2.256349, 0.9333333, 1, 0, 1,
-0.9473943, 0.3088978, -2.098123, 0.9254902, 1, 0, 1,
-0.9406192, 0.3615451, -0.7906372, 0.9215686, 1, 0, 1,
-0.9327473, 1.302329, -1.34576, 0.9137255, 1, 0, 1,
-0.9259137, -0.7472023, -2.375726, 0.9098039, 1, 0, 1,
-0.9232097, -0.1063727, -0.2795941, 0.9019608, 1, 0, 1,
-0.9212418, -0.1249716, -1.405973, 0.8941177, 1, 0, 1,
-0.9185107, 0.8652771, -1.991214, 0.8901961, 1, 0, 1,
-0.9032321, -0.07718171, -1.733011, 0.8823529, 1, 0, 1,
-0.9022673, 1.049994, 1.213688, 0.8784314, 1, 0, 1,
-0.8994786, -0.2321504, -1.870806, 0.8705882, 1, 0, 1,
-0.89803, -0.6057849, -1.475358, 0.8666667, 1, 0, 1,
-0.8934323, -0.2027604, -2.586534, 0.8588235, 1, 0, 1,
-0.8933493, -0.4272522, -1.393277, 0.854902, 1, 0, 1,
-0.8903412, -1.842585, -3.699068, 0.8470588, 1, 0, 1,
-0.8833034, 0.5818408, -2.218076, 0.8431373, 1, 0, 1,
-0.8804273, 1.103205, -0.4810044, 0.8352941, 1, 0, 1,
-0.8765826, 0.5925682, -1.579938, 0.8313726, 1, 0, 1,
-0.872507, 1.247545, -1.272128, 0.8235294, 1, 0, 1,
-0.8606888, -1.034778, -3.390002, 0.8196079, 1, 0, 1,
-0.8600546, -0.7071466, -2.759154, 0.8117647, 1, 0, 1,
-0.8596408, -0.6682132, -3.090703, 0.8078431, 1, 0, 1,
-0.8534705, 1.727071, -0.5990878, 0.8, 1, 0, 1,
-0.8525389, 0.0789879, -0.8760415, 0.7921569, 1, 0, 1,
-0.8514264, -0.04679991, -1.268558, 0.7882353, 1, 0, 1,
-0.8479118, 0.7188151, -0.6323965, 0.7803922, 1, 0, 1,
-0.8400169, 1.314491, 0.3676005, 0.7764706, 1, 0, 1,
-0.8384497, -0.09646304, -2.38606, 0.7686275, 1, 0, 1,
-0.8369725, -0.006916196, -0.6644049, 0.7647059, 1, 0, 1,
-0.8361295, 0.3204751, -0.8684449, 0.7568628, 1, 0, 1,
-0.8338964, -0.6918053, -2.844, 0.7529412, 1, 0, 1,
-0.8242176, 0.864862, -0.9095123, 0.7450981, 1, 0, 1,
-0.8195068, -0.5481195, -2.877606, 0.7411765, 1, 0, 1,
-0.8189508, -1.27409, -2.209857, 0.7333333, 1, 0, 1,
-0.8155295, -0.015611, -2.391519, 0.7294118, 1, 0, 1,
-0.8093326, -2.376617, -3.280954, 0.7215686, 1, 0, 1,
-0.8089362, 0.1858138, -0.3905197, 0.7176471, 1, 0, 1,
-0.8061609, 1.285948, 0.1867003, 0.7098039, 1, 0, 1,
-0.8060376, -0.2204138, -0.7390735, 0.7058824, 1, 0, 1,
-0.7910581, 0.1295153, -0.6448961, 0.6980392, 1, 0, 1,
-0.7817224, 0.282366, -1.137028, 0.6901961, 1, 0, 1,
-0.7801316, -0.1225094, -0.5220568, 0.6862745, 1, 0, 1,
-0.7793017, -0.3352341, -3.178524, 0.6784314, 1, 0, 1,
-0.7787501, -1.240344, -1.795197, 0.6745098, 1, 0, 1,
-0.7785233, -0.9517237, -2.320369, 0.6666667, 1, 0, 1,
-0.7751086, -0.1953594, -0.954104, 0.6627451, 1, 0, 1,
-0.7750505, -0.2053594, -1.506544, 0.654902, 1, 0, 1,
-0.7748536, -0.8434192, -3.007112, 0.6509804, 1, 0, 1,
-0.7747218, -0.0932085, -2.482018, 0.6431373, 1, 0, 1,
-0.7735078, 0.9564443, -0.5637254, 0.6392157, 1, 0, 1,
-0.7712378, 0.3624157, -0.7866163, 0.6313726, 1, 0, 1,
-0.7688792, -0.8639239, -1.968686, 0.627451, 1, 0, 1,
-0.7580255, -0.4925265, -1.334195, 0.6196079, 1, 0, 1,
-0.7553707, -0.1357501, -3.192721, 0.6156863, 1, 0, 1,
-0.7531773, 2.10217, -0.8941327, 0.6078432, 1, 0, 1,
-0.7430698, 0.3644007, -2.694838, 0.6039216, 1, 0, 1,
-0.7410057, 0.2193471, -0.9196513, 0.5960785, 1, 0, 1,
-0.7401128, 0.689383, -1.435316, 0.5882353, 1, 0, 1,
-0.7380745, -0.4062715, -2.179168, 0.5843138, 1, 0, 1,
-0.7371252, -0.7498626, -3.424171, 0.5764706, 1, 0, 1,
-0.7364531, -1.550086, -2.527199, 0.572549, 1, 0, 1,
-0.7314383, -0.7251714, -2.631077, 0.5647059, 1, 0, 1,
-0.7280049, -0.6580834, -3.162052, 0.5607843, 1, 0, 1,
-0.7267798, -0.6101291, -2.763779, 0.5529412, 1, 0, 1,
-0.722127, -0.1565128, -3.208649, 0.5490196, 1, 0, 1,
-0.7193277, -2.040397, -3.078332, 0.5411765, 1, 0, 1,
-0.7185966, -1.423687, -2.036988, 0.5372549, 1, 0, 1,
-0.7176901, 1.536988, -0.6434951, 0.5294118, 1, 0, 1,
-0.7170377, -0.7396534, -1.977809, 0.5254902, 1, 0, 1,
-0.7128885, -0.111153, -3.390993, 0.5176471, 1, 0, 1,
-0.7108746, -0.08544073, -2.572699, 0.5137255, 1, 0, 1,
-0.706995, 1.005117, -0.6523067, 0.5058824, 1, 0, 1,
-0.7061637, -1.889603, -2.417955, 0.5019608, 1, 0, 1,
-0.7050245, -0.4649029, -1.960597, 0.4941176, 1, 0, 1,
-0.7040389, 0.05522665, -2.697679, 0.4862745, 1, 0, 1,
-0.7013432, -1.287919, -0.8684272, 0.4823529, 1, 0, 1,
-0.694328, 0.4622132, 0.2969485, 0.4745098, 1, 0, 1,
-0.688895, 0.1047233, -1.394205, 0.4705882, 1, 0, 1,
-0.6773732, -0.07361346, -1.54969, 0.4627451, 1, 0, 1,
-0.6710085, -1.115558, -1.93584, 0.4588235, 1, 0, 1,
-0.6690959, -0.2637235, -2.834787, 0.4509804, 1, 0, 1,
-0.6660453, 0.3995348, 0.3742565, 0.4470588, 1, 0, 1,
-0.6658041, -0.7902998, -1.065815, 0.4392157, 1, 0, 1,
-0.6652592, -0.401467, -4.080485, 0.4352941, 1, 0, 1,
-0.6618971, -0.121023, -1.384154, 0.427451, 1, 0, 1,
-0.6609044, 0.8695687, 0.346333, 0.4235294, 1, 0, 1,
-0.6577806, 1.277019, -2.349483, 0.4156863, 1, 0, 1,
-0.6557029, 1.98721, -1.020372, 0.4117647, 1, 0, 1,
-0.6525361, 0.4978335, -0.2367049, 0.4039216, 1, 0, 1,
-0.6498138, -0.9045582, -1.558136, 0.3960784, 1, 0, 1,
-0.6431302, -0.4034997, -0.395428, 0.3921569, 1, 0, 1,
-0.6365173, 1.249476, -0.4781941, 0.3843137, 1, 0, 1,
-0.6359245, -1.635094, -2.569832, 0.3803922, 1, 0, 1,
-0.6358798, -0.9842565, -2.100249, 0.372549, 1, 0, 1,
-0.6347294, -0.1059552, -1.546846, 0.3686275, 1, 0, 1,
-0.6335654, 1.550228, -0.7957109, 0.3607843, 1, 0, 1,
-0.6323785, 1.122013, 1.726603, 0.3568628, 1, 0, 1,
-0.6309453, -0.7614008, -1.722512, 0.3490196, 1, 0, 1,
-0.6248537, 0.4558625, 0.5858904, 0.345098, 1, 0, 1,
-0.6203892, -0.0410411, -2.60201, 0.3372549, 1, 0, 1,
-0.6168772, -0.8813862, -2.071918, 0.3333333, 1, 0, 1,
-0.6122497, -0.9881815, -1.864873, 0.3254902, 1, 0, 1,
-0.6118417, -0.4374264, -0.9683331, 0.3215686, 1, 0, 1,
-0.6084862, -0.7373765, -2.153916, 0.3137255, 1, 0, 1,
-0.6064118, -1.035525, -2.418063, 0.3098039, 1, 0, 1,
-0.6059607, 1.548373, -1.636541, 0.3019608, 1, 0, 1,
-0.599775, -0.7613139, -2.126781, 0.2941177, 1, 0, 1,
-0.5981556, -0.6180856, -2.321845, 0.2901961, 1, 0, 1,
-0.5960351, 0.1385886, -0.8672823, 0.282353, 1, 0, 1,
-0.5887278, 0.7378459, -0.3895285, 0.2784314, 1, 0, 1,
-0.5878785, -0.6226364, -2.811368, 0.2705882, 1, 0, 1,
-0.5728037, 0.3023755, -3.155757, 0.2666667, 1, 0, 1,
-0.5662478, -0.4506495, -2.231298, 0.2588235, 1, 0, 1,
-0.5661766, 0.08845834, -1.568812, 0.254902, 1, 0, 1,
-0.5659819, 0.2104843, -1.156202, 0.2470588, 1, 0, 1,
-0.5567033, 0.9280556, 0.654254, 0.2431373, 1, 0, 1,
-0.5556167, -1.586305, -1.711981, 0.2352941, 1, 0, 1,
-0.5490122, -0.9401806, -2.637577, 0.2313726, 1, 0, 1,
-0.5456434, 0.295302, 0.07883888, 0.2235294, 1, 0, 1,
-0.5420317, -0.4869103, -2.76404, 0.2196078, 1, 0, 1,
-0.5398438, -0.2649779, -2.293258, 0.2117647, 1, 0, 1,
-0.5397105, 1.1357, -1.134259, 0.2078431, 1, 0, 1,
-0.5382814, 0.4332477, -0.9980332, 0.2, 1, 0, 1,
-0.5366674, -0.02027564, -2.117572, 0.1921569, 1, 0, 1,
-0.5364867, -0.5969728, -0.00933014, 0.1882353, 1, 0, 1,
-0.5352898, 0.1163274, -2.498944, 0.1803922, 1, 0, 1,
-0.5279803, 1.40951, -0.5131261, 0.1764706, 1, 0, 1,
-0.5277363, 1.291925, -0.09090103, 0.1686275, 1, 0, 1,
-0.5251763, 0.3890749, -0.2646837, 0.1647059, 1, 0, 1,
-0.5212017, 0.6533121, -0.161296, 0.1568628, 1, 0, 1,
-0.5193551, -0.9856935, -3.691916, 0.1529412, 1, 0, 1,
-0.507816, -1.717489, -0.9894221, 0.145098, 1, 0, 1,
-0.501875, 0.725888, 0.02746334, 0.1411765, 1, 0, 1,
-0.4969943, 0.2577052, -2.622605, 0.1333333, 1, 0, 1,
-0.496723, -1.489707, -3.483465, 0.1294118, 1, 0, 1,
-0.492077, -0.1693088, -2.790943, 0.1215686, 1, 0, 1,
-0.4910486, -0.6979144, -3.99414, 0.1176471, 1, 0, 1,
-0.4908019, 0.7673816, -0.2432171, 0.1098039, 1, 0, 1,
-0.4897546, -1.142721, -2.830028, 0.1058824, 1, 0, 1,
-0.4897003, 2.777055, 0.6231655, 0.09803922, 1, 0, 1,
-0.4879214, -1.320865, -1.613786, 0.09019608, 1, 0, 1,
-0.4854786, 0.4654975, -1.322973, 0.08627451, 1, 0, 1,
-0.4814141, -1.361109, -1.744755, 0.07843138, 1, 0, 1,
-0.4788884, -0.05718229, -2.183335, 0.07450981, 1, 0, 1,
-0.4745489, 0.421759, -0.4147979, 0.06666667, 1, 0, 1,
-0.470271, 0.4371594, 0.06650719, 0.0627451, 1, 0, 1,
-0.4695476, -0.7363834, -0.2857226, 0.05490196, 1, 0, 1,
-0.4687133, -0.2224772, -1.697913, 0.05098039, 1, 0, 1,
-0.468377, -0.3316296, -0.6169076, 0.04313726, 1, 0, 1,
-0.4636536, -1.00616, -3.646636, 0.03921569, 1, 0, 1,
-0.4522446, -0.5430599, -1.776936, 0.03137255, 1, 0, 1,
-0.4522201, 1.722807, -3.226743, 0.02745098, 1, 0, 1,
-0.4410676, -0.2919301, -2.504254, 0.01960784, 1, 0, 1,
-0.4400384, -0.3559827, -2.981687, 0.01568628, 1, 0, 1,
-0.4337309, -1.1156, -3.766476, 0.007843138, 1, 0, 1,
-0.4307321, 0.0656445, -1.678393, 0.003921569, 1, 0, 1,
-0.4289037, -1.15291, -2.697162, 0, 1, 0.003921569, 1,
-0.4270813, 0.01149804, -0.5424756, 0, 1, 0.01176471, 1,
-0.4247803, 0.1344067, -0.4487684, 0, 1, 0.01568628, 1,
-0.4194894, 1.288812, 0.1534635, 0, 1, 0.02352941, 1,
-0.4184211, -1.517686, -3.163385, 0, 1, 0.02745098, 1,
-0.4149915, -0.4884182, -3.805598, 0, 1, 0.03529412, 1,
-0.4131497, 1.199521, -0.5125334, 0, 1, 0.03921569, 1,
-0.4128258, -0.3212164, -1.433526, 0, 1, 0.04705882, 1,
-0.4127647, -0.6696918, -2.208162, 0, 1, 0.05098039, 1,
-0.4114134, -0.7929103, -1.753604, 0, 1, 0.05882353, 1,
-0.4098647, 2.007733, -0.4429934, 0, 1, 0.0627451, 1,
-0.4018881, 1.340769, -0.04257461, 0, 1, 0.07058824, 1,
-0.4013188, -1.510114, -2.093644, 0, 1, 0.07450981, 1,
-0.3994555, 0.28417, -3.039896, 0, 1, 0.08235294, 1,
-0.3992452, -0.8502033, -2.503767, 0, 1, 0.08627451, 1,
-0.391964, 0.1346565, -3.374111, 0, 1, 0.09411765, 1,
-0.3917162, 1.114246, -2.105787, 0, 1, 0.1019608, 1,
-0.3907536, -0.8803476, -2.797075, 0, 1, 0.1058824, 1,
-0.3906208, 0.20212, -1.457542, 0, 1, 0.1137255, 1,
-0.3866263, 0.07553329, -2.050091, 0, 1, 0.1176471, 1,
-0.3861701, 1.146886, 0.7578853, 0, 1, 0.1254902, 1,
-0.3769804, 0.828639, 0.4298716, 0, 1, 0.1294118, 1,
-0.3766852, -0.4184811, -2.830384, 0, 1, 0.1372549, 1,
-0.3754896, 0.937577, -0.4902272, 0, 1, 0.1411765, 1,
-0.3737831, 0.08003994, -1.903134, 0, 1, 0.1490196, 1,
-0.3728827, 1.941407, -0.2368504, 0, 1, 0.1529412, 1,
-0.3712699, -0.9059821, -3.014937, 0, 1, 0.1607843, 1,
-0.3710881, 0.2626311, -1.054657, 0, 1, 0.1647059, 1,
-0.3692181, 1.542142, -0.1318356, 0, 1, 0.172549, 1,
-0.3666747, 0.858126, -1.127713, 0, 1, 0.1764706, 1,
-0.3642853, 1.450923, 0.5598346, 0, 1, 0.1843137, 1,
-0.3623858, -1.184923, -3.182022, 0, 1, 0.1882353, 1,
-0.359096, 0.6797632, -0.4141467, 0, 1, 0.1960784, 1,
-0.3578937, 1.548218, -2.354143, 0, 1, 0.2039216, 1,
-0.3528054, -1.301714, -1.377591, 0, 1, 0.2078431, 1,
-0.3473588, -0.9254344, -2.039064, 0, 1, 0.2156863, 1,
-0.3464613, 2.263384, -0.8359772, 0, 1, 0.2196078, 1,
-0.3460583, 0.7024893, -1.102601, 0, 1, 0.227451, 1,
-0.3439589, 0.007643764, -0.9675385, 0, 1, 0.2313726, 1,
-0.3394381, 1.684108, 0.2985243, 0, 1, 0.2392157, 1,
-0.335977, 1.13274, -0.5318044, 0, 1, 0.2431373, 1,
-0.3341078, -1.087917, -1.89484, 0, 1, 0.2509804, 1,
-0.3301489, 0.7115911, -1.633046, 0, 1, 0.254902, 1,
-0.328693, -0.8956426, -3.380921, 0, 1, 0.2627451, 1,
-0.3240775, 0.3722214, -1.576743, 0, 1, 0.2666667, 1,
-0.3230685, 0.1105675, -1.253208, 0, 1, 0.2745098, 1,
-0.3206147, 1.451849, -2.381731, 0, 1, 0.2784314, 1,
-0.3198874, 0.4601697, -0.6412399, 0, 1, 0.2862745, 1,
-0.317815, 0.02123647, -2.518737, 0, 1, 0.2901961, 1,
-0.3177156, -0.3578407, -0.6225375, 0, 1, 0.2980392, 1,
-0.3163329, 0.5297276, -0.3262744, 0, 1, 0.3058824, 1,
-0.3145997, -1.077798, -4.588273, 0, 1, 0.3098039, 1,
-0.3119119, 1.625048, 0.2603846, 0, 1, 0.3176471, 1,
-0.309237, 1.103881, 0.1735134, 0, 1, 0.3215686, 1,
-0.3080534, 0.6327345, -1.793059, 0, 1, 0.3294118, 1,
-0.3025682, 0.7617645, -0.2571289, 0, 1, 0.3333333, 1,
-0.2988886, -0.3515147, -1.686672, 0, 1, 0.3411765, 1,
-0.2986772, 1.052654, 0.3158414, 0, 1, 0.345098, 1,
-0.2957702, -0.9771102, -3.421375, 0, 1, 0.3529412, 1,
-0.2947387, 0.8852875, -0.08366148, 0, 1, 0.3568628, 1,
-0.2929703, 1.004723, 0.284791, 0, 1, 0.3647059, 1,
-0.2866783, 0.04047707, -0.6307842, 0, 1, 0.3686275, 1,
-0.2861042, 1.916262, 0.7877707, 0, 1, 0.3764706, 1,
-0.2843696, -1.244139, -3.524169, 0, 1, 0.3803922, 1,
-0.2825205, 1.405732, -0.4070374, 0, 1, 0.3882353, 1,
-0.2809637, 0.5014424, -0.3609076, 0, 1, 0.3921569, 1,
-0.2770003, -0.1835776, -2.080015, 0, 1, 0.4, 1,
-0.2731375, 1.220124, 0.6118879, 0, 1, 0.4078431, 1,
-0.2722359, 0.7241611, 0.2245484, 0, 1, 0.4117647, 1,
-0.2673028, 0.9972376, -0.9207852, 0, 1, 0.4196078, 1,
-0.2630174, 0.5380911, -0.8193078, 0, 1, 0.4235294, 1,
-0.2607645, 1.374569, 1.118621, 0, 1, 0.4313726, 1,
-0.2584794, 1.237522, -0.7093157, 0, 1, 0.4352941, 1,
-0.2577233, -0.368093, -2.918767, 0, 1, 0.4431373, 1,
-0.2508763, 0.04133454, -0.5304295, 0, 1, 0.4470588, 1,
-0.2497173, -0.5076361, -1.973578, 0, 1, 0.454902, 1,
-0.2480147, -0.821286, -2.19233, 0, 1, 0.4588235, 1,
-0.2442684, -0.7782538, -3.8482, 0, 1, 0.4666667, 1,
-0.2442046, -1.17089, -1.784473, 0, 1, 0.4705882, 1,
-0.2430347, -0.709533, -3.028547, 0, 1, 0.4784314, 1,
-0.2428888, -0.761651, -1.830819, 0, 1, 0.4823529, 1,
-0.236594, 0.3707929, 0.4708911, 0, 1, 0.4901961, 1,
-0.2345104, 1.259692, 0.05730826, 0, 1, 0.4941176, 1,
-0.233862, 1.488554, -0.9548874, 0, 1, 0.5019608, 1,
-0.2305394, 1.032622, -1.746135, 0, 1, 0.509804, 1,
-0.2291754, -1.301111, -3.028331, 0, 1, 0.5137255, 1,
-0.2288568, -1.438607, -2.996096, 0, 1, 0.5215687, 1,
-0.2281727, -1.362767, -4.452726, 0, 1, 0.5254902, 1,
-0.2277434, 1.337706, -0.8121083, 0, 1, 0.5333334, 1,
-0.226175, 1.119543, 0.5067593, 0, 1, 0.5372549, 1,
-0.226163, -0.6405523, 1.039207, 0, 1, 0.5450981, 1,
-0.2232236, 1.2312, -0.6938769, 0, 1, 0.5490196, 1,
-0.22321, 0.9933559, -0.201036, 0, 1, 0.5568628, 1,
-0.2226229, -0.06460126, -1.851505, 0, 1, 0.5607843, 1,
-0.2181612, -0.191364, -2.714653, 0, 1, 0.5686275, 1,
-0.218151, -1.663426, -1.162443, 0, 1, 0.572549, 1,
-0.2164658, -1.376184, -3.809022, 0, 1, 0.5803922, 1,
-0.2161396, -1.002381, -3.026168, 0, 1, 0.5843138, 1,
-0.2160109, -0.07957911, -2.324847, 0, 1, 0.5921569, 1,
-0.2122628, 1.887426, -0.7938788, 0, 1, 0.5960785, 1,
-0.2094637, 0.2305813, 0.5736263, 0, 1, 0.6039216, 1,
-0.2089721, 1.0184, -0.3340573, 0, 1, 0.6117647, 1,
-0.2061661, -0.2654624, -0.6890442, 0, 1, 0.6156863, 1,
-0.2025793, -1.234427, -2.487712, 0, 1, 0.6235294, 1,
-0.2019852, -0.2515263, -3.752692, 0, 1, 0.627451, 1,
-0.1989614, -0.004764086, -0.1379907, 0, 1, 0.6352941, 1,
-0.1939452, 3.122276, 0.008249132, 0, 1, 0.6392157, 1,
-0.192139, 0.5242031, -1.468535, 0, 1, 0.6470588, 1,
-0.185392, 0.942025, -0.1653666, 0, 1, 0.6509804, 1,
-0.182135, 1.813114, -0.2854734, 0, 1, 0.6588235, 1,
-0.1771557, -0.1945739, -3.1061, 0, 1, 0.6627451, 1,
-0.176477, -0.1795703, -2.759226, 0, 1, 0.6705883, 1,
-0.1761229, -1.425508, -2.773169, 0, 1, 0.6745098, 1,
-0.1690707, -0.07748327, -1.746103, 0, 1, 0.682353, 1,
-0.1673572, 0.6717957, -0.5984062, 0, 1, 0.6862745, 1,
-0.1672598, 2.173708, 0.2977246, 0, 1, 0.6941177, 1,
-0.1639193, 0.3889085, 2.482288, 0, 1, 0.7019608, 1,
-0.1634156, -0.8968669, -3.492306, 0, 1, 0.7058824, 1,
-0.1618666, -0.0467163, -2.579124, 0, 1, 0.7137255, 1,
-0.1590725, 1.076615, -1.221637, 0, 1, 0.7176471, 1,
-0.1585357, 0.5354686, -0.01742967, 0, 1, 0.7254902, 1,
-0.1550727, 1.326133, 0.1757789, 0, 1, 0.7294118, 1,
-0.1535763, 0.07039685, -1.001366, 0, 1, 0.7372549, 1,
-0.1523333, 1.315259, 0.6217157, 0, 1, 0.7411765, 1,
-0.1492492, -0.3405051, -2.908926, 0, 1, 0.7490196, 1,
-0.1425118, -1.289228, -1.65393, 0, 1, 0.7529412, 1,
-0.1409962, 0.7286313, 0.5456974, 0, 1, 0.7607843, 1,
-0.1400332, 1.422563, 0.9096419, 0, 1, 0.7647059, 1,
-0.13965, 0.7292863, -0.1779293, 0, 1, 0.772549, 1,
-0.1379282, -0.6011298, -3.324561, 0, 1, 0.7764706, 1,
-0.1359075, -0.5904534, -1.503125, 0, 1, 0.7843137, 1,
-0.1305512, -0.2841458, -2.006951, 0, 1, 0.7882353, 1,
-0.1251874, -0.4172795, -3.955808, 0, 1, 0.7960784, 1,
-0.1240697, -2.125988, -4.067834, 0, 1, 0.8039216, 1,
-0.1201371, -0.8508208, -2.662045, 0, 1, 0.8078431, 1,
-0.1200715, -0.6734771, -2.285411, 0, 1, 0.8156863, 1,
-0.1193188, 0.08844846, -1.022337, 0, 1, 0.8196079, 1,
-0.1180246, -0.3502599, -4.286239, 0, 1, 0.827451, 1,
-0.116262, 0.7540191, 0.4408812, 0, 1, 0.8313726, 1,
-0.1138261, 0.4217828, -0.2707596, 0, 1, 0.8392157, 1,
-0.113221, 0.2650385, 0.376423, 0, 1, 0.8431373, 1,
-0.1119097, 1.071517, -2.371142, 0, 1, 0.8509804, 1,
-0.1092738, 1.010002, 0.4473771, 0, 1, 0.854902, 1,
-0.1063196, -0.6146072, -3.567491, 0, 1, 0.8627451, 1,
-0.1050014, -1.134672, -3.260168, 0, 1, 0.8666667, 1,
-0.1037299, -0.6200805, -3.052468, 0, 1, 0.8745098, 1,
-0.0962467, -2.258326, -3.96963, 0, 1, 0.8784314, 1,
-0.09347435, -1.317001, -1.886757, 0, 1, 0.8862745, 1,
-0.09022025, 0.3848191, 0.3000788, 0, 1, 0.8901961, 1,
-0.08956268, 2.885573, 1.366601, 0, 1, 0.8980392, 1,
-0.08517793, 0.975089, -0.5414132, 0, 1, 0.9058824, 1,
-0.08486271, 0.2630437, 1.026218, 0, 1, 0.9098039, 1,
-0.08265091, -0.6900508, -4.037538, 0, 1, 0.9176471, 1,
-0.08227331, 0.7559912, 0.5336745, 0, 1, 0.9215686, 1,
-0.07959768, 0.2830601, -0.164414, 0, 1, 0.9294118, 1,
-0.07681972, 0.5290012, 0.356118, 0, 1, 0.9333333, 1,
-0.06904969, -1.046095, -1.771649, 0, 1, 0.9411765, 1,
-0.06724782, -0.2308345, -2.289796, 0, 1, 0.945098, 1,
-0.06027521, 0.9689929, -0.2378708, 0, 1, 0.9529412, 1,
-0.05952285, -0.2096854, -3.017051, 0, 1, 0.9568627, 1,
-0.0524985, 0.4157788, -0.9986986, 0, 1, 0.9647059, 1,
-0.05218567, 0.04892541, -2.659793, 0, 1, 0.9686275, 1,
-0.04929344, 1.455764, -1.367905, 0, 1, 0.9764706, 1,
-0.04876386, -0.3783986, -2.497425, 0, 1, 0.9803922, 1,
-0.04874982, -0.1732914, -2.720826, 0, 1, 0.9882353, 1,
-0.04760604, 2.851496, 0.1742364, 0, 1, 0.9921569, 1,
-0.03953226, -1.729258, -2.296473, 0, 1, 1, 1,
-0.03784603, 0.9080675, -0.003149613, 0, 0.9921569, 1, 1,
-0.03029419, -0.3224399, -2.32012, 0, 0.9882353, 1, 1,
-0.02705019, -0.2730691, -1.883297, 0, 0.9803922, 1, 1,
-0.02637395, 0.4298114, 0.5633241, 0, 0.9764706, 1, 1,
-0.02151465, -0.321495, -3.112915, 0, 0.9686275, 1, 1,
-0.01942336, -0.6036909, -1.464452, 0, 0.9647059, 1, 1,
-0.01363862, 0.1110151, 0.2876899, 0, 0.9568627, 1, 1,
-0.01121523, -0.283536, -3.59824, 0, 0.9529412, 1, 1,
-0.01108673, 2.174703, -0.7370163, 0, 0.945098, 1, 1,
-0.005212583, 0.7115229, 0.3278843, 0, 0.9411765, 1, 1,
-0.00485292, -0.1457868, -2.710736, 0, 0.9333333, 1, 1,
-0.002947389, -0.3274051, -2.531703, 0, 0.9294118, 1, 1,
0.00605048, 0.6928021, -1.46842, 0, 0.9215686, 1, 1,
0.007761892, -0.07510824, 3.362233, 0, 0.9176471, 1, 1,
0.008010694, 0.2676048, 0.7872302, 0, 0.9098039, 1, 1,
0.008039881, -0.05412287, 2.136199, 0, 0.9058824, 1, 1,
0.009488659, 0.6429799, 0.6439595, 0, 0.8980392, 1, 1,
0.01758959, -0.5988528, 2.40083, 0, 0.8901961, 1, 1,
0.02108808, -0.8182092, 3.258528, 0, 0.8862745, 1, 1,
0.02609118, 0.1682351, -0.2242596, 0, 0.8784314, 1, 1,
0.02753197, -0.2752823, 4.403863, 0, 0.8745098, 1, 1,
0.03428947, 1.262656, 0.5311114, 0, 0.8666667, 1, 1,
0.04116983, -1.212018, 4.690175, 0, 0.8627451, 1, 1,
0.0496194, -0.8791127, 3.059421, 0, 0.854902, 1, 1,
0.04973618, 1.225423, -1.827231, 0, 0.8509804, 1, 1,
0.05763469, -0.2028408, 3.079397, 0, 0.8431373, 1, 1,
0.06532709, -0.001903773, 2.011718, 0, 0.8392157, 1, 1,
0.0706889, -2.983987, 4.403984, 0, 0.8313726, 1, 1,
0.07135346, 0.6986766, 0.4105888, 0, 0.827451, 1, 1,
0.07202366, -0.6254071, 2.935232, 0, 0.8196079, 1, 1,
0.07271504, -1.339938, 2.190121, 0, 0.8156863, 1, 1,
0.07340766, -0.5805829, 4.276896, 0, 0.8078431, 1, 1,
0.07354727, 2.960559, 1.159523, 0, 0.8039216, 1, 1,
0.07435078, -0.7197032, 4.111948, 0, 0.7960784, 1, 1,
0.07706929, -1.000413, 3.291323, 0, 0.7882353, 1, 1,
0.07964662, -3.571007, 3.821462, 0, 0.7843137, 1, 1,
0.08294725, -2.847363, 5.35731, 0, 0.7764706, 1, 1,
0.08596329, -1.283354, 3.634974, 0, 0.772549, 1, 1,
0.08852772, 1.161015, 0.5597496, 0, 0.7647059, 1, 1,
0.0896772, 0.5255784, -0.898547, 0, 0.7607843, 1, 1,
0.09227648, -0.02053521, 0.6397356, 0, 0.7529412, 1, 1,
0.09247202, 0.2059197, 0.125497, 0, 0.7490196, 1, 1,
0.09626227, 0.7422272, -0.02195201, 0, 0.7411765, 1, 1,
0.09911943, 0.2418667, -1.019529, 0, 0.7372549, 1, 1,
0.09956123, 2.429489, 0.7550994, 0, 0.7294118, 1, 1,
0.1105709, 0.04934502, 1.125038, 0, 0.7254902, 1, 1,
0.1131259, 0.3691583, 1.769396, 0, 0.7176471, 1, 1,
0.1172171, -1.553029, 2.160499, 0, 0.7137255, 1, 1,
0.1191409, 0.694103, 0.8611758, 0, 0.7058824, 1, 1,
0.1202038, -0.2892081, 1.070089, 0, 0.6980392, 1, 1,
0.1210318, 1.238184, 0.2017396, 0, 0.6941177, 1, 1,
0.1270601, -0.5696788, 1.524305, 0, 0.6862745, 1, 1,
0.1333985, -0.2504513, 3.166397, 0, 0.682353, 1, 1,
0.1371948, -0.4826483, 3.080427, 0, 0.6745098, 1, 1,
0.1377816, -1.00374, 2.774991, 0, 0.6705883, 1, 1,
0.138294, 0.1740302, 0.4852643, 0, 0.6627451, 1, 1,
0.1387064, -0.7284731, 2.56667, 0, 0.6588235, 1, 1,
0.1466421, -1.727505, 4.257193, 0, 0.6509804, 1, 1,
0.1474648, 2.083496, 1.354681, 0, 0.6470588, 1, 1,
0.1489664, 1.973364, 0.08470225, 0, 0.6392157, 1, 1,
0.1528467, 0.3037951, 0.8687541, 0, 0.6352941, 1, 1,
0.1565366, 0.3528755, 0.4495202, 0, 0.627451, 1, 1,
0.1571996, 0.2964363, 0.9931896, 0, 0.6235294, 1, 1,
0.1608022, 0.269833, 1.488479, 0, 0.6156863, 1, 1,
0.1619026, -1.32662, 1.872125, 0, 0.6117647, 1, 1,
0.1634634, 1.403613, 0.05473827, 0, 0.6039216, 1, 1,
0.1699769, -1.137328, 2.907449, 0, 0.5960785, 1, 1,
0.1717632, 1.413069, 1.0511, 0, 0.5921569, 1, 1,
0.1718893, -0.1624133, 2.927551, 0, 0.5843138, 1, 1,
0.1734732, 0.7974526, -0.4229411, 0, 0.5803922, 1, 1,
0.1748953, -0.9871564, 2.254962, 0, 0.572549, 1, 1,
0.1750291, 0.4682073, -0.5368397, 0, 0.5686275, 1, 1,
0.1798164, -0.2302105, 1.515336, 0, 0.5607843, 1, 1,
0.1812702, -0.9547195, 2.423246, 0, 0.5568628, 1, 1,
0.1824221, 0.9937575, 0.3209437, 0, 0.5490196, 1, 1,
0.1851321, -1.138921, 4.216624, 0, 0.5450981, 1, 1,
0.188082, -0.6061406, 5.245859, 0, 0.5372549, 1, 1,
0.1948999, 1.864418, 0.3967843, 0, 0.5333334, 1, 1,
0.1982428, -0.3217764, 3.098394, 0, 0.5254902, 1, 1,
0.2070594, 0.984082, 0.6754891, 0, 0.5215687, 1, 1,
0.2078285, -1.61032, 2.762399, 0, 0.5137255, 1, 1,
0.2087074, -0.6671293, 3.494596, 0, 0.509804, 1, 1,
0.2115497, -0.8430168, 3.072706, 0, 0.5019608, 1, 1,
0.2145607, -0.919783, 3.903696, 0, 0.4941176, 1, 1,
0.214592, 1.037572, -0.1799345, 0, 0.4901961, 1, 1,
0.2160928, -0.4441242, 3.533052, 0, 0.4823529, 1, 1,
0.2172459, -1.552811, 3.484977, 0, 0.4784314, 1, 1,
0.2234045, -1.312997, 3.591536, 0, 0.4705882, 1, 1,
0.2234225, -0.6524942, 0.9005243, 0, 0.4666667, 1, 1,
0.2270432, -1.042874, 3.735257, 0, 0.4588235, 1, 1,
0.2342543, 1.1222, -1.129218, 0, 0.454902, 1, 1,
0.2376546, 0.3680005, 1.018304, 0, 0.4470588, 1, 1,
0.2378009, -0.1757846, 3.622562, 0, 0.4431373, 1, 1,
0.2385505, 0.8626531, -0.4376966, 0, 0.4352941, 1, 1,
0.2397952, 0.1426326, 1.607833, 0, 0.4313726, 1, 1,
0.2416757, 0.8200909, 1.881441, 0, 0.4235294, 1, 1,
0.2441583, -0.7747403, 1.183629, 0, 0.4196078, 1, 1,
0.2487384, 0.7004915, 0.3828252, 0, 0.4117647, 1, 1,
0.2540556, 1.056766, 2.286014, 0, 0.4078431, 1, 1,
0.2568417, 0.2432517, 1.122216, 0, 0.4, 1, 1,
0.2585858, 0.5798994, 1.571733, 0, 0.3921569, 1, 1,
0.2657263, 0.2083453, 0.2627581, 0, 0.3882353, 1, 1,
0.2662112, 0.1824966, 0.04008908, 0, 0.3803922, 1, 1,
0.2672922, 0.3170972, 0.8354321, 0, 0.3764706, 1, 1,
0.2700934, -1.025755, 3.628033, 0, 0.3686275, 1, 1,
0.2704932, -0.2895977, 1.184053, 0, 0.3647059, 1, 1,
0.2713141, 1.682896, 0.07834411, 0, 0.3568628, 1, 1,
0.2720367, 0.355738, -0.03186122, 0, 0.3529412, 1, 1,
0.2751785, -0.6564789, 2.068112, 0, 0.345098, 1, 1,
0.2773319, 0.06932466, 3.403937, 0, 0.3411765, 1, 1,
0.2781317, -0.8235387, 2.080625, 0, 0.3333333, 1, 1,
0.2791811, 1.4441, 0.07866296, 0, 0.3294118, 1, 1,
0.281352, 0.6454854, 0.7675253, 0, 0.3215686, 1, 1,
0.2889749, -0.938871, 1.42577, 0, 0.3176471, 1, 1,
0.290071, -0.4298715, 1.49218, 0, 0.3098039, 1, 1,
0.2900918, 0.522168, 0.8387173, 0, 0.3058824, 1, 1,
0.2941234, 0.5539412, 0.7225694, 0, 0.2980392, 1, 1,
0.2974821, -0.7494965, 2.397507, 0, 0.2901961, 1, 1,
0.2989123, -0.09906087, 0.9323037, 0, 0.2862745, 1, 1,
0.3003584, 0.4077395, 2.804796, 0, 0.2784314, 1, 1,
0.308587, 1.62662, 0.7049035, 0, 0.2745098, 1, 1,
0.3119273, -0.9609612, 3.499904, 0, 0.2666667, 1, 1,
0.3207485, 0.3850663, 0.8815919, 0, 0.2627451, 1, 1,
0.3211247, -0.2331697, 2.052425, 0, 0.254902, 1, 1,
0.3256743, 0.7941672, 0.9086859, 0, 0.2509804, 1, 1,
0.32749, -0.1990533, 2.063281, 0, 0.2431373, 1, 1,
0.3334509, 2.569746, -0.1646084, 0, 0.2392157, 1, 1,
0.3350621, 2.818053, 1.219714, 0, 0.2313726, 1, 1,
0.3352611, -0.1553776, 0.671867, 0, 0.227451, 1, 1,
0.3353674, 2.261148, 1.156303, 0, 0.2196078, 1, 1,
0.3355875, -0.9679135, 3.352519, 0, 0.2156863, 1, 1,
0.3403214, 1.240676, -0.5336283, 0, 0.2078431, 1, 1,
0.3437901, -1.000083, 3.233274, 0, 0.2039216, 1, 1,
0.3481693, 0.3510238, 1.746057, 0, 0.1960784, 1, 1,
0.3495293, -0.5187582, 0.421636, 0, 0.1882353, 1, 1,
0.3506314, 0.4123437, 2.009016, 0, 0.1843137, 1, 1,
0.3562127, 1.421622, 0.07593396, 0, 0.1764706, 1, 1,
0.3620064, -2.061278, 4.062397, 0, 0.172549, 1, 1,
0.3639106, -0.6885717, 2.597987, 0, 0.1647059, 1, 1,
0.3674519, -0.1692687, 1.975616, 0, 0.1607843, 1, 1,
0.3680672, 0.1525501, 1.161176, 0, 0.1529412, 1, 1,
0.3687651, 0.01861618, 1.059152, 0, 0.1490196, 1, 1,
0.3708009, 0.7016991, 0.7190686, 0, 0.1411765, 1, 1,
0.3750892, 1.678464, -1.042617, 0, 0.1372549, 1, 1,
0.3788077, -0.9420102, 4.51451, 0, 0.1294118, 1, 1,
0.3793433, -0.02963978, 1.334252, 0, 0.1254902, 1, 1,
0.380422, -0.4961647, 1.017373, 0, 0.1176471, 1, 1,
0.3809016, 0.2394381, 0.981519, 0, 0.1137255, 1, 1,
0.3837761, 0.6722718, 1.278413, 0, 0.1058824, 1, 1,
0.3888079, 0.1153686, 2.654153, 0, 0.09803922, 1, 1,
0.3890771, 0.3517674, 2.095958, 0, 0.09411765, 1, 1,
0.3968198, -0.5881919, 2.12396, 0, 0.08627451, 1, 1,
0.3972567, 0.0484293, 0.2557077, 0, 0.08235294, 1, 1,
0.3990868, -0.8327717, 3.887426, 0, 0.07450981, 1, 1,
0.3998011, -0.2886041, 0.8421498, 0, 0.07058824, 1, 1,
0.4008436, -0.6734804, 1.778417, 0, 0.0627451, 1, 1,
0.4030417, 0.4762602, -0.7508493, 0, 0.05882353, 1, 1,
0.404483, -0.4000404, 1.766706, 0, 0.05098039, 1, 1,
0.4075898, -1.703231, 4.137625, 0, 0.04705882, 1, 1,
0.4146052, 0.3975864, 3.215832, 0, 0.03921569, 1, 1,
0.4165099, -0.843173, 2.564665, 0, 0.03529412, 1, 1,
0.4197152, -0.01427381, 2.057734, 0, 0.02745098, 1, 1,
0.4229535, 0.2991048, 0.1582098, 0, 0.02352941, 1, 1,
0.4283442, -0.187533, 2.377319, 0, 0.01568628, 1, 1,
0.4284863, 0.2175184, 0.9018729, 0, 0.01176471, 1, 1,
0.4308259, -1.065846, 0.2589884, 0, 0.003921569, 1, 1,
0.4343019, 1.188492, -0.6721454, 0.003921569, 0, 1, 1,
0.4345489, -1.750329, 2.155951, 0.007843138, 0, 1, 1,
0.436462, 0.289815, 0.4950158, 0.01568628, 0, 1, 1,
0.4405894, -2.084841, 5.186123, 0.01960784, 0, 1, 1,
0.4492366, 1.728962, -1.121354, 0.02745098, 0, 1, 1,
0.4493343, 0.06403912, 1.021183, 0.03137255, 0, 1, 1,
0.4528765, -0.973286, 2.931524, 0.03921569, 0, 1, 1,
0.4531218, 1.657318, 0.03821449, 0.04313726, 0, 1, 1,
0.4577528, -0.8164921, 2.36646, 0.05098039, 0, 1, 1,
0.4615328, -1.121303, 0.178183, 0.05490196, 0, 1, 1,
0.4622777, -1.151626, 3.993119, 0.0627451, 0, 1, 1,
0.4662116, 0.212465, 1.411533, 0.06666667, 0, 1, 1,
0.4667377, -0.4270878, 0.8210317, 0.07450981, 0, 1, 1,
0.46984, 1.350561, 2.150094, 0.07843138, 0, 1, 1,
0.4773792, -0.6947629, 1.309884, 0.08627451, 0, 1, 1,
0.4784182, -1.153004, 3.862274, 0.09019608, 0, 1, 1,
0.4817875, -0.6136146, 3.947507, 0.09803922, 0, 1, 1,
0.4836633, 1.174226, 0.7316879, 0.1058824, 0, 1, 1,
0.4837622, -0.4294287, -0.4656645, 0.1098039, 0, 1, 1,
0.4841311, -0.1581236, 1.106043, 0.1176471, 0, 1, 1,
0.4906352, -0.1742991, 2.032342, 0.1215686, 0, 1, 1,
0.4936242, -0.4223128, 3.6007, 0.1294118, 0, 1, 1,
0.4963941, -0.2100354, 2.742409, 0.1333333, 0, 1, 1,
0.5084674, -0.3047298, 1.818232, 0.1411765, 0, 1, 1,
0.5112351, 1.183791, 0.8107473, 0.145098, 0, 1, 1,
0.521754, 0.1876897, 2.824331, 0.1529412, 0, 1, 1,
0.5245354, 1.354985, 1.707003, 0.1568628, 0, 1, 1,
0.5273997, 0.1663391, 0.4206188, 0.1647059, 0, 1, 1,
0.5298129, -0.1506559, 0.7654141, 0.1686275, 0, 1, 1,
0.5334002, -0.8100445, 2.090418, 0.1764706, 0, 1, 1,
0.5379051, 0.3301869, 1.356435, 0.1803922, 0, 1, 1,
0.5399044, -0.5825562, 3.402629, 0.1882353, 0, 1, 1,
0.5438465, 1.31986, 0.01284512, 0.1921569, 0, 1, 1,
0.5453024, -0.9978924, 1.582087, 0.2, 0, 1, 1,
0.5486023, -1.034012, 3.43716, 0.2078431, 0, 1, 1,
0.5511949, -0.4127159, 1.354474, 0.2117647, 0, 1, 1,
0.5529487, -0.668814, 3.791102, 0.2196078, 0, 1, 1,
0.5549617, -0.05294808, -0.05053143, 0.2235294, 0, 1, 1,
0.5557553, -1.985222, 3.320166, 0.2313726, 0, 1, 1,
0.5561705, -0.3725063, 2.333567, 0.2352941, 0, 1, 1,
0.5572436, -0.5505357, 1.831843, 0.2431373, 0, 1, 1,
0.5573038, 0.5676129, 0.7603706, 0.2470588, 0, 1, 1,
0.5582475, 0.481304, 0.1540147, 0.254902, 0, 1, 1,
0.5681696, -1.55324, 2.564002, 0.2588235, 0, 1, 1,
0.5747323, -1.122767, 1.983729, 0.2666667, 0, 1, 1,
0.5765855, 0.3822179, 1.397211, 0.2705882, 0, 1, 1,
0.5795519, -1.042716, 2.25886, 0.2784314, 0, 1, 1,
0.5801434, 1.117014, 1.465722, 0.282353, 0, 1, 1,
0.5859784, 1.579337, 0.8262162, 0.2901961, 0, 1, 1,
0.5864806, -0.4570025, 2.583608, 0.2941177, 0, 1, 1,
0.5882578, 0.1910229, 1.100636, 0.3019608, 0, 1, 1,
0.5897279, -0.9789166, 2.10592, 0.3098039, 0, 1, 1,
0.5927234, -0.9652364, 3.724784, 0.3137255, 0, 1, 1,
0.5931428, 1.885921, 1.899708, 0.3215686, 0, 1, 1,
0.5944207, 0.9860435, 1.69716, 0.3254902, 0, 1, 1,
0.5962461, 0.4827407, -0.9951051, 0.3333333, 0, 1, 1,
0.5992966, 1.55134, 0.7906836, 0.3372549, 0, 1, 1,
0.5994959, -0.2269415, 1.692048, 0.345098, 0, 1, 1,
0.6011246, 0.3301035, 0.1076368, 0.3490196, 0, 1, 1,
0.6021463, -0.9047419, 2.993632, 0.3568628, 0, 1, 1,
0.6026803, -0.08391699, 1.709574, 0.3607843, 0, 1, 1,
0.6075954, 1.143206, 0.2863991, 0.3686275, 0, 1, 1,
0.6081751, -0.8402498, 4.135515, 0.372549, 0, 1, 1,
0.6117103, 1.028527, -0.1529047, 0.3803922, 0, 1, 1,
0.6143838, -1.74531, 0.5380874, 0.3843137, 0, 1, 1,
0.6205514, 0.7319946, 1.142698, 0.3921569, 0, 1, 1,
0.6213346, -0.2430572, 1.111447, 0.3960784, 0, 1, 1,
0.6266415, -0.211589, 2.575252, 0.4039216, 0, 1, 1,
0.6295159, -0.4038822, 2.106665, 0.4117647, 0, 1, 1,
0.6296559, -1.987004, 3.873861, 0.4156863, 0, 1, 1,
0.6312872, 0.399632, 0.1421624, 0.4235294, 0, 1, 1,
0.6323184, 0.3329503, 0.6133829, 0.427451, 0, 1, 1,
0.6436158, 0.4708688, 1.049802, 0.4352941, 0, 1, 1,
0.6450638, -0.8561103, 1.358649, 0.4392157, 0, 1, 1,
0.6550933, -0.8525789, 2.398106, 0.4470588, 0, 1, 1,
0.6585492, -0.9849913, 0.2944582, 0.4509804, 0, 1, 1,
0.6588458, -0.8776738, 1.556844, 0.4588235, 0, 1, 1,
0.6616812, -0.576107, 2.743254, 0.4627451, 0, 1, 1,
0.6646324, 0.7911583, 0.3957053, 0.4705882, 0, 1, 1,
0.6646466, 0.4357521, 1.375419, 0.4745098, 0, 1, 1,
0.668561, -0.3330734, 1.07214, 0.4823529, 0, 1, 1,
0.6722041, -0.4753878, 1.881773, 0.4862745, 0, 1, 1,
0.6727664, 0.9451959, 0.780396, 0.4941176, 0, 1, 1,
0.674026, -1.625423, 3.556951, 0.5019608, 0, 1, 1,
0.679637, 0.03302869, 2.251987, 0.5058824, 0, 1, 1,
0.6831363, 0.006429755, 2.076714, 0.5137255, 0, 1, 1,
0.6889572, -2.280813, 4.480343, 0.5176471, 0, 1, 1,
0.6890247, -2.168513, 2.36833, 0.5254902, 0, 1, 1,
0.6912845, 1.481646, -0.9510137, 0.5294118, 0, 1, 1,
0.6946067, 1.003104, 2.067588, 0.5372549, 0, 1, 1,
0.694976, 0.8300667, -0.120678, 0.5411765, 0, 1, 1,
0.7052929, 0.1698274, -0.9699206, 0.5490196, 0, 1, 1,
0.7092187, -0.3232888, 1.19706, 0.5529412, 0, 1, 1,
0.7107066, 1.065354, 0.3756203, 0.5607843, 0, 1, 1,
0.7132606, -2.507279, 2.139724, 0.5647059, 0, 1, 1,
0.7147921, -1.477261, 3.654694, 0.572549, 0, 1, 1,
0.7150355, -1.333143, 1.601777, 0.5764706, 0, 1, 1,
0.7219868, -0.7759008, 2.592512, 0.5843138, 0, 1, 1,
0.7232931, -0.1479538, 2.865271, 0.5882353, 0, 1, 1,
0.725542, -0.01165963, 2.637423, 0.5960785, 0, 1, 1,
0.7394798, 0.1574285, 0.2450614, 0.6039216, 0, 1, 1,
0.752001, -0.3915211, 2.558084, 0.6078432, 0, 1, 1,
0.7535782, 0.5793072, 3.061411, 0.6156863, 0, 1, 1,
0.7544082, 0.4515111, 0.2091479, 0.6196079, 0, 1, 1,
0.7633717, -1.268515, 2.210753, 0.627451, 0, 1, 1,
0.7715793, 1.421852, -2.317289, 0.6313726, 0, 1, 1,
0.7750392, -0.5371957, 2.358737, 0.6392157, 0, 1, 1,
0.7767992, -1.576879, 1.920067, 0.6431373, 0, 1, 1,
0.7819623, -0.1568523, 2.248906, 0.6509804, 0, 1, 1,
0.7877044, -0.3437335, 1.752564, 0.654902, 0, 1, 1,
0.7883128, 1.320114, -0.7467865, 0.6627451, 0, 1, 1,
0.7906529, -0.1180195, 1.511027, 0.6666667, 0, 1, 1,
0.7909108, 0.08449918, 2.316822, 0.6745098, 0, 1, 1,
0.7928799, 0.5115044, 0.3795916, 0.6784314, 0, 1, 1,
0.7931378, 0.5758553, 2.418585, 0.6862745, 0, 1, 1,
0.7953579, -0.898266, 3.074934, 0.6901961, 0, 1, 1,
0.7993776, -0.8426892, 2.132221, 0.6980392, 0, 1, 1,
0.8034543, -0.08771691, 3.132841, 0.7058824, 0, 1, 1,
0.8046144, 0.1384974, 2.713187, 0.7098039, 0, 1, 1,
0.8060086, 0.9912754, 0.9015417, 0.7176471, 0, 1, 1,
0.8062481, -1.003126, 1.742518, 0.7215686, 0, 1, 1,
0.8104464, 0.1986952, 2.077766, 0.7294118, 0, 1, 1,
0.8110995, -0.0726717, -0.2034359, 0.7333333, 0, 1, 1,
0.8122328, -0.5129192, 2.067953, 0.7411765, 0, 1, 1,
0.8149415, 0.4830056, 1.639938, 0.7450981, 0, 1, 1,
0.8163579, 1.488527, 1.050377, 0.7529412, 0, 1, 1,
0.8169479, -0.2773103, 3.142829, 0.7568628, 0, 1, 1,
0.8189518, 0.7486488, 1.496385, 0.7647059, 0, 1, 1,
0.8241947, -1.347445, 3.597309, 0.7686275, 0, 1, 1,
0.8252291, 0.0927252, 1.490432, 0.7764706, 0, 1, 1,
0.8286897, 1.373832, 1.036175, 0.7803922, 0, 1, 1,
0.8299384, 0.04226134, 1.00742, 0.7882353, 0, 1, 1,
0.8346572, -0.3334841, 1.033453, 0.7921569, 0, 1, 1,
0.8352522, -1.947931, 0.8341722, 0.8, 0, 1, 1,
0.8360229, -0.01155009, 1.938934, 0.8078431, 0, 1, 1,
0.8423122, 1.907704, 0.8799071, 0.8117647, 0, 1, 1,
0.8425677, -0.7739271, 3.68975, 0.8196079, 0, 1, 1,
0.8439512, 1.345741, 1.410785, 0.8235294, 0, 1, 1,
0.8460428, -0.02331403, 0.752055, 0.8313726, 0, 1, 1,
0.8469242, -0.3440005, 1.740504, 0.8352941, 0, 1, 1,
0.8602035, 0.09249822, 1.961307, 0.8431373, 0, 1, 1,
0.8609994, 2.516661, 0.06599579, 0.8470588, 0, 1, 1,
0.8630785, 1.158059, 1.95106, 0.854902, 0, 1, 1,
0.8637639, 0.8380749, 0.01613369, 0.8588235, 0, 1, 1,
0.8734899, -1.78725, 2.54724, 0.8666667, 0, 1, 1,
0.8741367, -0.6177634, 1.410643, 0.8705882, 0, 1, 1,
0.8748121, -2.200202, 3.529312, 0.8784314, 0, 1, 1,
0.8803351, 0.5881546, -0.0947884, 0.8823529, 0, 1, 1,
0.8810962, 1.063601, 0.5848046, 0.8901961, 0, 1, 1,
0.8817544, 0.7038764, 0.5706555, 0.8941177, 0, 1, 1,
0.8895523, 0.1029676, 1.73673, 0.9019608, 0, 1, 1,
0.894448, 0.7675816, 0.3811778, 0.9098039, 0, 1, 1,
0.8951858, -0.5588061, 2.819087, 0.9137255, 0, 1, 1,
0.8954754, -0.8096014, 2.432062, 0.9215686, 0, 1, 1,
0.9065186, -0.4326438, 1.906191, 0.9254902, 0, 1, 1,
0.9101415, -0.1427467, 0.06709781, 0.9333333, 0, 1, 1,
0.9170511, 0.993686, -0.07081454, 0.9372549, 0, 1, 1,
0.9177788, 1.448589, 1.701477, 0.945098, 0, 1, 1,
0.9179836, 0.2776356, 1.919432, 0.9490196, 0, 1, 1,
0.9212437, 1.012084, 1.819886, 0.9568627, 0, 1, 1,
0.9303263, 1.031444, 3.108899, 0.9607843, 0, 1, 1,
0.9321895, 1.193911, 0.6086192, 0.9686275, 0, 1, 1,
0.9393237, -1.515715, 3.040552, 0.972549, 0, 1, 1,
0.9402257, -0.6928477, 1.006838, 0.9803922, 0, 1, 1,
0.9416286, -0.0522263, 0.7456953, 0.9843137, 0, 1, 1,
0.9444857, -0.03351327, 2.507311, 0.9921569, 0, 1, 1,
0.9446824, -0.0488582, 1.281408, 0.9960784, 0, 1, 1,
0.9484916, -0.2466666, 2.502175, 1, 0, 0.9960784, 1,
0.9499039, 1.150458, -0.7547597, 1, 0, 0.9882353, 1,
0.9533329, 2.358255, 0.2154469, 1, 0, 0.9843137, 1,
0.9533432, -0.8275865, 2.026998, 1, 0, 0.9764706, 1,
0.9533911, 2.015395, 1.82698, 1, 0, 0.972549, 1,
0.9577016, -0.2229411, 3.750495, 1, 0, 0.9647059, 1,
0.961733, 0.1688211, 0.5000473, 1, 0, 0.9607843, 1,
0.9658666, -0.9161216, 0.3078254, 1, 0, 0.9529412, 1,
0.9658829, -1.221161, 2.39694, 1, 0, 0.9490196, 1,
0.9746867, -0.05425233, 1.04995, 1, 0, 0.9411765, 1,
0.9790965, 0.1652163, 1.321386, 1, 0, 0.9372549, 1,
0.9827902, 0.3395616, 1.314784, 1, 0, 0.9294118, 1,
0.9847792, 0.1965965, 0.4421345, 1, 0, 0.9254902, 1,
0.9924834, -0.7962971, 2.375382, 1, 0, 0.9176471, 1,
1.009902, 0.3501109, -0.1209894, 1, 0, 0.9137255, 1,
1.016511, -1.226309, 2.939929, 1, 0, 0.9058824, 1,
1.024987, -1.559847, 3.424896, 1, 0, 0.9019608, 1,
1.0267, 0.1555625, 1.530589, 1, 0, 0.8941177, 1,
1.027957, -0.3287232, 4.977773, 1, 0, 0.8862745, 1,
1.035805, -0.6365964, 1.601259, 1, 0, 0.8823529, 1,
1.042598, 1.669152, 1.505455, 1, 0, 0.8745098, 1,
1.042994, -1.017693, 3.444905, 1, 0, 0.8705882, 1,
1.043889, -0.1959829, 1.163645, 1, 0, 0.8627451, 1,
1.047155, 0.1004305, 2.298, 1, 0, 0.8588235, 1,
1.054247, 1.016241, 0.7203413, 1, 0, 0.8509804, 1,
1.065702, -0.2555318, 1.650006, 1, 0, 0.8470588, 1,
1.066763, 1.253068, 2.008845, 1, 0, 0.8392157, 1,
1.06746, 1.387135, 0.1389451, 1, 0, 0.8352941, 1,
1.070367, 0.5634217, 0.001129934, 1, 0, 0.827451, 1,
1.077494, 1.416756, 0.4736007, 1, 0, 0.8235294, 1,
1.082643, -0.05498083, 1.517131, 1, 0, 0.8156863, 1,
1.085137, -0.03915056, -0.1212118, 1, 0, 0.8117647, 1,
1.091596, -0.1333923, 2.258814, 1, 0, 0.8039216, 1,
1.096254, 0.8921742, 0.2213037, 1, 0, 0.7960784, 1,
1.10021, 0.5266772, -2.698308, 1, 0, 0.7921569, 1,
1.100577, 0.02426773, 1.267226, 1, 0, 0.7843137, 1,
1.105076, -0.4394063, 1.704039, 1, 0, 0.7803922, 1,
1.119679, 1.352437, -1.028886, 1, 0, 0.772549, 1,
1.124084, -0.7111983, 3.529442, 1, 0, 0.7686275, 1,
1.126225, -1.290685, 2.247057, 1, 0, 0.7607843, 1,
1.132034, -2.079389, 0.7971344, 1, 0, 0.7568628, 1,
1.13438, 0.6707755, 1.453795, 1, 0, 0.7490196, 1,
1.134552, 0.582935, 0.897339, 1, 0, 0.7450981, 1,
1.139613, -1.977698, 2.888048, 1, 0, 0.7372549, 1,
1.140376, -0.7713573, 1.647067, 1, 0, 0.7333333, 1,
1.147765, 1.282349, -0.3013844, 1, 0, 0.7254902, 1,
1.151886, 0.002583641, 0.413119, 1, 0, 0.7215686, 1,
1.157411, 1.880878, 1.854492, 1, 0, 0.7137255, 1,
1.159541, 1.869887, 1.197124, 1, 0, 0.7098039, 1,
1.161959, -0.9249531, 1.929296, 1, 0, 0.7019608, 1,
1.162156, 0.7509821, -1.00913, 1, 0, 0.6941177, 1,
1.168338, -2.67416, 2.932069, 1, 0, 0.6901961, 1,
1.171683, -0.2556151, 3.571817, 1, 0, 0.682353, 1,
1.178863, -0.3927869, 1.554249, 1, 0, 0.6784314, 1,
1.18705, -1.300716, 3.624714, 1, 0, 0.6705883, 1,
1.188051, -0.5128672, 3.639721, 1, 0, 0.6666667, 1,
1.19116, -1.641301, 1.810329, 1, 0, 0.6588235, 1,
1.196998, -0.9188782, 3.065554, 1, 0, 0.654902, 1,
1.197643, 1.385759, -0.3793968, 1, 0, 0.6470588, 1,
1.198615, -0.3214025, 1.216495, 1, 0, 0.6431373, 1,
1.199144, -1.52162, 2.778674, 1, 0, 0.6352941, 1,
1.202666, -0.1302859, 0.06788036, 1, 0, 0.6313726, 1,
1.206172, -0.3995639, 1.2955, 1, 0, 0.6235294, 1,
1.210027, -0.1119117, 1.950509, 1, 0, 0.6196079, 1,
1.210284, 0.169454, 1.270279, 1, 0, 0.6117647, 1,
1.211342, -0.1919731, 3.238189, 1, 0, 0.6078432, 1,
1.220024, -0.9155415, 0.4170265, 1, 0, 0.6, 1,
1.222192, 0.8592016, 1.478748, 1, 0, 0.5921569, 1,
1.224042, -2.679842, 3.570584, 1, 0, 0.5882353, 1,
1.226351, 0.829791, 0.8655156, 1, 0, 0.5803922, 1,
1.232902, 1.34756, 1.34173, 1, 0, 0.5764706, 1,
1.240655, -0.6721599, 1.973074, 1, 0, 0.5686275, 1,
1.245253, 0.1902678, -0.2151364, 1, 0, 0.5647059, 1,
1.252124, -0.5291741, 2.225276, 1, 0, 0.5568628, 1,
1.264836, 0.469438, 0.07851051, 1, 0, 0.5529412, 1,
1.273554, 0.2185942, 1.232162, 1, 0, 0.5450981, 1,
1.273871, -2.85347, 3.57202, 1, 0, 0.5411765, 1,
1.275948, 0.9656712, 0.673371, 1, 0, 0.5333334, 1,
1.279287, -0.4821712, 3.535034, 1, 0, 0.5294118, 1,
1.289711, -0.4578687, 2.119795, 1, 0, 0.5215687, 1,
1.292503, -0.8717441, 0.9433908, 1, 0, 0.5176471, 1,
1.302991, -1.327734, 1.455306, 1, 0, 0.509804, 1,
1.312693, -0.02699929, 2.423101, 1, 0, 0.5058824, 1,
1.327536, -0.4865219, 0.5872939, 1, 0, 0.4980392, 1,
1.330032, 0.2225393, 2.135407, 1, 0, 0.4901961, 1,
1.338214, 1.762604, -1.355394, 1, 0, 0.4862745, 1,
1.339978, -0.8261723, 1.288287, 1, 0, 0.4784314, 1,
1.341077, -1.046319, 0.2751917, 1, 0, 0.4745098, 1,
1.344287, -0.9630552, 2.360023, 1, 0, 0.4666667, 1,
1.349426, 0.2543949, 2.910065, 1, 0, 0.4627451, 1,
1.357921, 0.3267997, 2.399757, 1, 0, 0.454902, 1,
1.362718, -0.7285143, 0.6060717, 1, 0, 0.4509804, 1,
1.383939, 0.06048783, 1.851489, 1, 0, 0.4431373, 1,
1.384033, -0.2541615, 2.607916, 1, 0, 0.4392157, 1,
1.389278, 0.9350488, 2.130866, 1, 0, 0.4313726, 1,
1.400883, -1.152674, 2.681089, 1, 0, 0.427451, 1,
1.401175, -0.008773776, 2.230788, 1, 0, 0.4196078, 1,
1.42015, -2.199596, 3.267964, 1, 0, 0.4156863, 1,
1.449495, -0.9340821, 2.501568, 1, 0, 0.4078431, 1,
1.450503, 0.8265317, 0.5098109, 1, 0, 0.4039216, 1,
1.473541, -1.812648, 1.495957, 1, 0, 0.3960784, 1,
1.476761, -0.9551519, 1.084565, 1, 0, 0.3882353, 1,
1.477028, -1.134524, 3.584514, 1, 0, 0.3843137, 1,
1.480698, 0.2608743, 1.681055, 1, 0, 0.3764706, 1,
1.501012, -0.487711, 1.025254, 1, 0, 0.372549, 1,
1.503793, -0.2809047, 0.9609299, 1, 0, 0.3647059, 1,
1.515856, 0.3504281, 1.106358, 1, 0, 0.3607843, 1,
1.525161, -0.6095548, 2.339905, 1, 0, 0.3529412, 1,
1.53523, 0.1273462, 1.34512, 1, 0, 0.3490196, 1,
1.566035, -0.1628331, 0.4857805, 1, 0, 0.3411765, 1,
1.573418, 0.6799001, 1.520214, 1, 0, 0.3372549, 1,
1.579941, 0.5339131, 0.6196226, 1, 0, 0.3294118, 1,
1.583748, -2.04312, 1.206051, 1, 0, 0.3254902, 1,
1.587582, -0.207228, 1.47423, 1, 0, 0.3176471, 1,
1.590896, 0.4861917, 2.030762, 1, 0, 0.3137255, 1,
1.601003, 0.6243283, -1.082169, 1, 0, 0.3058824, 1,
1.609795, 1.695133, 1.054141, 1, 0, 0.2980392, 1,
1.643655, -0.3070969, 2.627075, 1, 0, 0.2941177, 1,
1.645986, -0.6126159, 3.485726, 1, 0, 0.2862745, 1,
1.696541, 1.546567, -0.4283007, 1, 0, 0.282353, 1,
1.699101, -0.6989062, 3.219807, 1, 0, 0.2745098, 1,
1.703461, 1.309258, 1.114771, 1, 0, 0.2705882, 1,
1.719859, -0.1126917, 0.2431508, 1, 0, 0.2627451, 1,
1.730719, -0.3715446, 2.635792, 1, 0, 0.2588235, 1,
1.743104, -0.2594966, 2.037449, 1, 0, 0.2509804, 1,
1.754483, -0.4671766, 3.356373, 1, 0, 0.2470588, 1,
1.755542, 0.5305156, 0.9411488, 1, 0, 0.2392157, 1,
1.781836, 1.12048, 0.06058601, 1, 0, 0.2352941, 1,
1.789736, 1.915118, 0.4512383, 1, 0, 0.227451, 1,
1.793376, 1.117899, 1.997613, 1, 0, 0.2235294, 1,
1.79888, -1.004347, 2.132173, 1, 0, 0.2156863, 1,
1.826938, 0.5153882, -0.03852192, 1, 0, 0.2117647, 1,
1.829623, -0.1656787, 2.282854, 1, 0, 0.2039216, 1,
1.830141, -1.13482, 2.020938, 1, 0, 0.1960784, 1,
1.830423, -0.3911414, 3.059475, 1, 0, 0.1921569, 1,
1.83996, 0.118121, 2.666037, 1, 0, 0.1843137, 1,
1.843698, -0.4844822, 0.7209423, 1, 0, 0.1803922, 1,
1.847533, 0.1336386, 2.9619, 1, 0, 0.172549, 1,
1.849073, 0.4829169, 2.088822, 1, 0, 0.1686275, 1,
1.851255, -1.62209, 1.353335, 1, 0, 0.1607843, 1,
1.86939, 0.1170009, 0.1476006, 1, 0, 0.1568628, 1,
1.87068, 0.4601916, 1.641954, 1, 0, 0.1490196, 1,
1.877352, 0.3385758, 0.6521395, 1, 0, 0.145098, 1,
1.877658, -0.2992234, 1.171304, 1, 0, 0.1372549, 1,
1.887039, 1.366219, 0.2320711, 1, 0, 0.1333333, 1,
1.891359, -0.03711556, 2.460641, 1, 0, 0.1254902, 1,
1.897171, 2.352514, -0.5753552, 1, 0, 0.1215686, 1,
1.92904, -1.725446, 2.198773, 1, 0, 0.1137255, 1,
1.944331, 0.4338509, 0.5153723, 1, 0, 0.1098039, 1,
1.984714, -2.11516, 1.557466, 1, 0, 0.1019608, 1,
1.998649, 0.1074268, 0.3385142, 1, 0, 0.09411765, 1,
2.0013, -2.222876, 1.747814, 1, 0, 0.09019608, 1,
2.013872, 0.5554258, 1.571784, 1, 0, 0.08235294, 1,
2.01741, 0.4302303, 1.829901, 1, 0, 0.07843138, 1,
2.071478, -0.6500401, 2.74747, 1, 0, 0.07058824, 1,
2.137483, -1.678566, 1.517283, 1, 0, 0.06666667, 1,
2.138371, -0.4206396, 2.122124, 1, 0, 0.05882353, 1,
2.165947, 0.6045523, 0.5346699, 1, 0, 0.05490196, 1,
2.168901, -0.9546988, 2.017352, 1, 0, 0.04705882, 1,
2.202596, 0.8632545, 2.702709, 1, 0, 0.04313726, 1,
2.207346, -0.2814477, 1.519537, 1, 0, 0.03529412, 1,
2.279224, -1.696104, 1.601904, 1, 0, 0.03137255, 1,
2.36986, 0.6980441, 0.1169527, 1, 0, 0.02352941, 1,
2.529946, 0.7828479, 0.4092795, 1, 0, 0.01960784, 1,
2.609393, 1.132672, 1.546921, 1, 0, 0.01176471, 1,
2.655089, 0.3401952, 1.604777, 1, 0, 0.007843138, 1
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
-0.5122732, -4.705518, -7.513561, 0, -0.5, 0.5, 0.5,
-0.5122732, -4.705518, -7.513561, 1, -0.5, 0.5, 0.5,
-0.5122732, -4.705518, -7.513561, 1, 1.5, 0.5, 0.5,
-0.5122732, -4.705518, -7.513561, 0, 1.5, 0.5, 0.5
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
-4.753371, -0.2243654, -7.513561, 0, -0.5, 0.5, 0.5,
-4.753371, -0.2243654, -7.513561, 1, -0.5, 0.5, 0.5,
-4.753371, -0.2243654, -7.513561, 1, 1.5, 0.5, 0.5,
-4.753371, -0.2243654, -7.513561, 0, 1.5, 0.5, 0.5
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
-4.753371, -4.705518, -0.1454139, 0, -0.5, 0.5, 0.5,
-4.753371, -4.705518, -0.1454139, 1, -0.5, 0.5, 0.5,
-4.753371, -4.705518, -0.1454139, 1, 1.5, 0.5, 0.5,
-4.753371, -4.705518, -0.1454139, 0, 1.5, 0.5, 0.5
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
-3, -3.671406, -5.813219,
2, -3.671406, -5.813219,
-3, -3.671406, -5.813219,
-3, -3.843758, -6.09661,
-2, -3.671406, -5.813219,
-2, -3.843758, -6.09661,
-1, -3.671406, -5.813219,
-1, -3.843758, -6.09661,
0, -3.671406, -5.813219,
0, -3.843758, -6.09661,
1, -3.671406, -5.813219,
1, -3.843758, -6.09661,
2, -3.671406, -5.813219,
2, -3.843758, -6.09661
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
-3, -4.188462, -6.66339, 0, -0.5, 0.5, 0.5,
-3, -4.188462, -6.66339, 1, -0.5, 0.5, 0.5,
-3, -4.188462, -6.66339, 1, 1.5, 0.5, 0.5,
-3, -4.188462, -6.66339, 0, 1.5, 0.5, 0.5,
-2, -4.188462, -6.66339, 0, -0.5, 0.5, 0.5,
-2, -4.188462, -6.66339, 1, -0.5, 0.5, 0.5,
-2, -4.188462, -6.66339, 1, 1.5, 0.5, 0.5,
-2, -4.188462, -6.66339, 0, 1.5, 0.5, 0.5,
-1, -4.188462, -6.66339, 0, -0.5, 0.5, 0.5,
-1, -4.188462, -6.66339, 1, -0.5, 0.5, 0.5,
-1, -4.188462, -6.66339, 1, 1.5, 0.5, 0.5,
-1, -4.188462, -6.66339, 0, 1.5, 0.5, 0.5,
0, -4.188462, -6.66339, 0, -0.5, 0.5, 0.5,
0, -4.188462, -6.66339, 1, -0.5, 0.5, 0.5,
0, -4.188462, -6.66339, 1, 1.5, 0.5, 0.5,
0, -4.188462, -6.66339, 0, 1.5, 0.5, 0.5,
1, -4.188462, -6.66339, 0, -0.5, 0.5, 0.5,
1, -4.188462, -6.66339, 1, -0.5, 0.5, 0.5,
1, -4.188462, -6.66339, 1, 1.5, 0.5, 0.5,
1, -4.188462, -6.66339, 0, 1.5, 0.5, 0.5,
2, -4.188462, -6.66339, 0, -0.5, 0.5, 0.5,
2, -4.188462, -6.66339, 1, -0.5, 0.5, 0.5,
2, -4.188462, -6.66339, 1, 1.5, 0.5, 0.5,
2, -4.188462, -6.66339, 0, 1.5, 0.5, 0.5
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
-3.774656, -3, -5.813219,
-3.774656, 3, -5.813219,
-3.774656, -3, -5.813219,
-3.937775, -3, -6.09661,
-3.774656, -2, -5.813219,
-3.937775, -2, -6.09661,
-3.774656, -1, -5.813219,
-3.937775, -1, -6.09661,
-3.774656, 0, -5.813219,
-3.937775, 0, -6.09661,
-3.774656, 1, -5.813219,
-3.937775, 1, -6.09661,
-3.774656, 2, -5.813219,
-3.937775, 2, -6.09661,
-3.774656, 3, -5.813219,
-3.937775, 3, -6.09661
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
-4.264013, -3, -6.66339, 0, -0.5, 0.5, 0.5,
-4.264013, -3, -6.66339, 1, -0.5, 0.5, 0.5,
-4.264013, -3, -6.66339, 1, 1.5, 0.5, 0.5,
-4.264013, -3, -6.66339, 0, 1.5, 0.5, 0.5,
-4.264013, -2, -6.66339, 0, -0.5, 0.5, 0.5,
-4.264013, -2, -6.66339, 1, -0.5, 0.5, 0.5,
-4.264013, -2, -6.66339, 1, 1.5, 0.5, 0.5,
-4.264013, -2, -6.66339, 0, 1.5, 0.5, 0.5,
-4.264013, -1, -6.66339, 0, -0.5, 0.5, 0.5,
-4.264013, -1, -6.66339, 1, -0.5, 0.5, 0.5,
-4.264013, -1, -6.66339, 1, 1.5, 0.5, 0.5,
-4.264013, -1, -6.66339, 0, 1.5, 0.5, 0.5,
-4.264013, 0, -6.66339, 0, -0.5, 0.5, 0.5,
-4.264013, 0, -6.66339, 1, -0.5, 0.5, 0.5,
-4.264013, 0, -6.66339, 1, 1.5, 0.5, 0.5,
-4.264013, 0, -6.66339, 0, 1.5, 0.5, 0.5,
-4.264013, 1, -6.66339, 0, -0.5, 0.5, 0.5,
-4.264013, 1, -6.66339, 1, -0.5, 0.5, 0.5,
-4.264013, 1, -6.66339, 1, 1.5, 0.5, 0.5,
-4.264013, 1, -6.66339, 0, 1.5, 0.5, 0.5,
-4.264013, 2, -6.66339, 0, -0.5, 0.5, 0.5,
-4.264013, 2, -6.66339, 1, -0.5, 0.5, 0.5,
-4.264013, 2, -6.66339, 1, 1.5, 0.5, 0.5,
-4.264013, 2, -6.66339, 0, 1.5, 0.5, 0.5,
-4.264013, 3, -6.66339, 0, -0.5, 0.5, 0.5,
-4.264013, 3, -6.66339, 1, -0.5, 0.5, 0.5,
-4.264013, 3, -6.66339, 1, 1.5, 0.5, 0.5,
-4.264013, 3, -6.66339, 0, 1.5, 0.5, 0.5
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
-3.774656, -3.671406, -4,
-3.774656, -3.671406, 4,
-3.774656, -3.671406, -4,
-3.937775, -3.843758, -4,
-3.774656, -3.671406, -2,
-3.937775, -3.843758, -2,
-3.774656, -3.671406, 0,
-3.937775, -3.843758, 0,
-3.774656, -3.671406, 2,
-3.937775, -3.843758, 2,
-3.774656, -3.671406, 4,
-3.937775, -3.843758, 4
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
-4.264013, -4.188462, -4, 0, -0.5, 0.5, 0.5,
-4.264013, -4.188462, -4, 1, -0.5, 0.5, 0.5,
-4.264013, -4.188462, -4, 1, 1.5, 0.5, 0.5,
-4.264013, -4.188462, -4, 0, 1.5, 0.5, 0.5,
-4.264013, -4.188462, -2, 0, -0.5, 0.5, 0.5,
-4.264013, -4.188462, -2, 1, -0.5, 0.5, 0.5,
-4.264013, -4.188462, -2, 1, 1.5, 0.5, 0.5,
-4.264013, -4.188462, -2, 0, 1.5, 0.5, 0.5,
-4.264013, -4.188462, 0, 0, -0.5, 0.5, 0.5,
-4.264013, -4.188462, 0, 1, -0.5, 0.5, 0.5,
-4.264013, -4.188462, 0, 1, 1.5, 0.5, 0.5,
-4.264013, -4.188462, 0, 0, 1.5, 0.5, 0.5,
-4.264013, -4.188462, 2, 0, -0.5, 0.5, 0.5,
-4.264013, -4.188462, 2, 1, -0.5, 0.5, 0.5,
-4.264013, -4.188462, 2, 1, 1.5, 0.5, 0.5,
-4.264013, -4.188462, 2, 0, 1.5, 0.5, 0.5,
-4.264013, -4.188462, 4, 0, -0.5, 0.5, 0.5,
-4.264013, -4.188462, 4, 1, -0.5, 0.5, 0.5,
-4.264013, -4.188462, 4, 1, 1.5, 0.5, 0.5,
-4.264013, -4.188462, 4, 0, 1.5, 0.5, 0.5
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
-3.774656, -3.671406, -5.813219,
-3.774656, 3.222675, -5.813219,
-3.774656, -3.671406, 5.522391,
-3.774656, 3.222675, 5.522391,
-3.774656, -3.671406, -5.813219,
-3.774656, -3.671406, 5.522391,
-3.774656, 3.222675, -5.813219,
-3.774656, 3.222675, 5.522391,
-3.774656, -3.671406, -5.813219,
2.750109, -3.671406, -5.813219,
-3.774656, -3.671406, 5.522391,
2.750109, -3.671406, 5.522391,
-3.774656, 3.222675, -5.813219,
2.750109, 3.222675, -5.813219,
-3.774656, 3.222675, 5.522391,
2.750109, 3.222675, 5.522391,
2.750109, -3.671406, -5.813219,
2.750109, 3.222675, -5.813219,
2.750109, -3.671406, 5.522391,
2.750109, 3.222675, 5.522391,
2.750109, -3.671406, -5.813219,
2.750109, -3.671406, 5.522391,
2.750109, 3.222675, -5.813219,
2.750109, 3.222675, 5.522391
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
var radius = 7.894917;
var distance = 35.12537;
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
mvMatrix.translate( 0.5122732, 0.2243654, 0.1454139 );
mvMatrix.scale( 1.308267, 1.238184, 0.7530374 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.12537);
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
Carbamate_Hydrochlor<-read.table("Carbamate_Hydrochlor.xyz")
```

```
## Error in read.table("Carbamate_Hydrochlor.xyz"): no lines available in input
```

```r
x<-Carbamate_Hydrochlor$V2
```

```
## Error in eval(expr, envir, enclos): object 'Carbamate_Hydrochlor' not found
```

```r
y<-Carbamate_Hydrochlor$V3
```

```
## Error in eval(expr, envir, enclos): object 'Carbamate_Hydrochlor' not found
```

```r
z<-Carbamate_Hydrochlor$V4
```

```
## Error in eval(expr, envir, enclos): object 'Carbamate_Hydrochlor' not found
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
-3.679635, 0.5410222, -0.9037558, 0, 0, 1, 1, 1,
-3.212208, -0.07035429, -1.318815, 1, 0, 0, 1, 1,
-3.181388, 0.6558033, -1.305025, 1, 0, 0, 1, 1,
-2.830945, -0.06987347, -2.337506, 1, 0, 0, 1, 1,
-2.465389, -2.457793, -5.524286, 1, 0, 0, 1, 1,
-2.459714, -0.8615567, -0.8513677, 1, 0, 0, 1, 1,
-2.433961, -2.473339, -2.83583, 0, 0, 0, 1, 1,
-2.372213, -1.10827, -3.110187, 0, 0, 0, 1, 1,
-2.344261, 0.3921041, 0.268202, 0, 0, 0, 1, 1,
-2.323816, -2.333624, -1.742363, 0, 0, 0, 1, 1,
-2.312154, 1.839709, -2.249787, 0, 0, 0, 1, 1,
-2.201004, -1.503809, -5.648138, 0, 0, 0, 1, 1,
-2.199963, 0.220216, 0.2587434, 0, 0, 0, 1, 1,
-2.190748, 1.334567, -3.078547, 1, 1, 1, 1, 1,
-2.176786, 1.669721, -0.9235371, 1, 1, 1, 1, 1,
-2.168655, 0.4027189, -2.494208, 1, 1, 1, 1, 1,
-2.105108, -0.8233824, -1.528608, 1, 1, 1, 1, 1,
-2.077868, -1.233611, -3.466524, 1, 1, 1, 1, 1,
-2.061714, 1.968634, -1.562374, 1, 1, 1, 1, 1,
-2.057524, -1.663795, -1.268243, 1, 1, 1, 1, 1,
-2.007158, 1.619078, -2.1411, 1, 1, 1, 1, 1,
-1.999644, 0.2969607, -2.679493, 1, 1, 1, 1, 1,
-1.976856, -1.009146, -3.484779, 1, 1, 1, 1, 1,
-1.960432, 0.1761354, -2.333355, 1, 1, 1, 1, 1,
-1.95511, -0.07063555, -1.751479, 1, 1, 1, 1, 1,
-1.94995, -0.3331092, -2.510853, 1, 1, 1, 1, 1,
-1.94758, -0.6166547, -0.1826783, 1, 1, 1, 1, 1,
-1.932014, -0.8319817, -1.199607, 1, 1, 1, 1, 1,
-1.915939, -1.055035, -1.152567, 0, 0, 1, 1, 1,
-1.905583, -1.392757, -1.945136, 1, 0, 0, 1, 1,
-1.866262, -0.441581, -0.3593459, 1, 0, 0, 1, 1,
-1.858632, 0.9062614, -1.557459, 1, 0, 0, 1, 1,
-1.839502, -0.4847535, -2.464559, 1, 0, 0, 1, 1,
-1.838206, 0.4253549, -1.37205, 1, 0, 0, 1, 1,
-1.835547, 0.4469671, -2.429057, 0, 0, 0, 1, 1,
-1.82106, 1.015471, -2.369178, 0, 0, 0, 1, 1,
-1.818804, -1.621831, -2.843126, 0, 0, 0, 1, 1,
-1.739043, -1.070096, -2.871478, 0, 0, 0, 1, 1,
-1.737406, 0.8456317, -1.437179, 0, 0, 0, 1, 1,
-1.724496, 0.8871702, 0.6570404, 0, 0, 0, 1, 1,
-1.718022, -0.2824203, -2.54589, 0, 0, 0, 1, 1,
-1.708911, 3.012939, -0.5025814, 1, 1, 1, 1, 1,
-1.702346, 1.21676, -0.3866072, 1, 1, 1, 1, 1,
-1.682702, 1.255429, -0.1478284, 1, 1, 1, 1, 1,
-1.65131, 0.783465, -1.285324, 1, 1, 1, 1, 1,
-1.643621, -0.3582174, -1.538545, 1, 1, 1, 1, 1,
-1.6198, -0.9512585, -3.833404, 1, 1, 1, 1, 1,
-1.619482, -1.53869, -1.576657, 1, 1, 1, 1, 1,
-1.612101, -0.2820758, -2.327966, 1, 1, 1, 1, 1,
-1.598188, -0.2266436, -1.770137, 1, 1, 1, 1, 1,
-1.578734, -1.510742, -3.223165, 1, 1, 1, 1, 1,
-1.57699, 0.9370317, -0.1455065, 1, 1, 1, 1, 1,
-1.562633, -0.2931505, -2.027511, 1, 1, 1, 1, 1,
-1.553316, -1.446739, -1.976311, 1, 1, 1, 1, 1,
-1.551162, 0.07316595, -0.373645, 1, 1, 1, 1, 1,
-1.550431, -0.4670738, -0.7232851, 1, 1, 1, 1, 1,
-1.547378, 0.8954951, 0.141063, 0, 0, 1, 1, 1,
-1.547297, 0.3137293, -2.100035, 1, 0, 0, 1, 1,
-1.531712, 0.8520177, -1.501593, 1, 0, 0, 1, 1,
-1.527011, 0.3069928, -0.2498252, 1, 0, 0, 1, 1,
-1.526415, -0.5458997, -1.251384, 1, 0, 0, 1, 1,
-1.520968, -0.3010727, -0.1522755, 1, 0, 0, 1, 1,
-1.511436, -1.427467, -2.922998, 0, 0, 0, 1, 1,
-1.496661, 1.144199, -0.5989565, 0, 0, 0, 1, 1,
-1.477503, 0.8826539, -1.247472, 0, 0, 0, 1, 1,
-1.473376, 0.3142826, -2.553982, 0, 0, 0, 1, 1,
-1.452047, 0.3543437, -2.266879, 0, 0, 0, 1, 1,
-1.443648, 0.976706, -1.468858, 0, 0, 0, 1, 1,
-1.442594, 0.320998, -0.8121304, 0, 0, 0, 1, 1,
-1.429562, 0.6649028, -1.10051, 1, 1, 1, 1, 1,
-1.428006, -2.37471, -3.18241, 1, 1, 1, 1, 1,
-1.420835, 0.188141, -1.60001, 1, 1, 1, 1, 1,
-1.409086, -1.953072, -1.489403, 1, 1, 1, 1, 1,
-1.404361, -0.3906263, -1.931178, 1, 1, 1, 1, 1,
-1.397699, -0.6244236, 0.5308924, 1, 1, 1, 1, 1,
-1.397209, 1.272962, -0.8298658, 1, 1, 1, 1, 1,
-1.395791, 0.9622764, -2.324687, 1, 1, 1, 1, 1,
-1.395296, -2.067422, -3.419448, 1, 1, 1, 1, 1,
-1.392536, -0.7061967, -1.762207, 1, 1, 1, 1, 1,
-1.391055, 1.309372, -0.02735092, 1, 1, 1, 1, 1,
-1.390583, 0.07621179, -2.993048, 1, 1, 1, 1, 1,
-1.374915, 1.280581, -3.199985, 1, 1, 1, 1, 1,
-1.372391, 1.390729, -0.540406, 1, 1, 1, 1, 1,
-1.369369, -0.4541614, -3.028694, 1, 1, 1, 1, 1,
-1.368037, -2.624341, -2.618216, 0, 0, 1, 1, 1,
-1.344861, 0.5778672, -0.3232504, 1, 0, 0, 1, 1,
-1.337697, 1.633912, -1.846974, 1, 0, 0, 1, 1,
-1.336723, -0.2417054, -2.58219, 1, 0, 0, 1, 1,
-1.332368, -0.6342437, -2.128042, 1, 0, 0, 1, 1,
-1.3222, 0.8232687, 0.6728527, 1, 0, 0, 1, 1,
-1.312375, -0.3551472, -1.875889, 0, 0, 0, 1, 1,
-1.310997, -0.2316514, -3.657465, 0, 0, 0, 1, 1,
-1.308919, 0.9556943, -1.567926, 0, 0, 0, 1, 1,
-1.308259, 1.191138, -1.90752, 0, 0, 0, 1, 1,
-1.304293, 1.847663, -0.7353321, 0, 0, 0, 1, 1,
-1.302543, -1.400951, -1.85177, 0, 0, 0, 1, 1,
-1.300152, 1.517979, -1.774437, 0, 0, 0, 1, 1,
-1.297977, -0.313266, -0.5258071, 1, 1, 1, 1, 1,
-1.296053, -0.1696305, -3.198635, 1, 1, 1, 1, 1,
-1.295581, -0.2680909, -2.399559, 1, 1, 1, 1, 1,
-1.294463, -0.9861249, -2.240589, 1, 1, 1, 1, 1,
-1.292651, 0.7335218, -1.892449, 1, 1, 1, 1, 1,
-1.286726, 0.9687974, -1.706783, 1, 1, 1, 1, 1,
-1.283102, 1.84175, 0.4446916, 1, 1, 1, 1, 1,
-1.282177, -0.6956471, -3.121052, 1, 1, 1, 1, 1,
-1.279153, 0.107249, -3.428574, 1, 1, 1, 1, 1,
-1.278329, -1.101758, -3.478605, 1, 1, 1, 1, 1,
-1.268843, 0.2886349, -2.524905, 1, 1, 1, 1, 1,
-1.262077, -1.211647, -2.07748, 1, 1, 1, 1, 1,
-1.259669, -0.7346707, -2.47788, 1, 1, 1, 1, 1,
-1.247019, 0.2502325, -0.007156771, 1, 1, 1, 1, 1,
-1.246295, 0.5539575, -0.7707902, 1, 1, 1, 1, 1,
-1.239283, 0.5864143, -0.3749631, 0, 0, 1, 1, 1,
-1.226343, 0.1527795, -2.862043, 1, 0, 0, 1, 1,
-1.220181, 0.3242953, -1.666366, 1, 0, 0, 1, 1,
-1.210544, 0.04900965, -1.800014, 1, 0, 0, 1, 1,
-1.206652, 2.062758, 1.312268, 1, 0, 0, 1, 1,
-1.202356, -0.3153386, -1.142836, 1, 0, 0, 1, 1,
-1.199659, -0.6346447, -1.868445, 0, 0, 0, 1, 1,
-1.197914, 0.1776293, -0.1642917, 0, 0, 0, 1, 1,
-1.190285, 0.278906, -2.270885, 0, 0, 0, 1, 1,
-1.17923, 0.2728923, -1.082958, 0, 0, 0, 1, 1,
-1.178301, 0.0136959, -1.58366, 0, 0, 0, 1, 1,
-1.17782, -0.6942431, -1.978893, 0, 0, 0, 1, 1,
-1.177629, 2.064974, -1.356512, 0, 0, 0, 1, 1,
-1.175538, 0.2166694, -0.7662871, 1, 1, 1, 1, 1,
-1.170391, -0.6596119, -2.427817, 1, 1, 1, 1, 1,
-1.168241, 0.7797182, -0.8418565, 1, 1, 1, 1, 1,
-1.161744, 0.3950303, -1.179504, 1, 1, 1, 1, 1,
-1.160619, -0.5855803, -1.957054, 1, 1, 1, 1, 1,
-1.160085, -0.9283501, -3.300799, 1, 1, 1, 1, 1,
-1.154605, 0.7547426, -1.45328, 1, 1, 1, 1, 1,
-1.15361, -0.5449833, -2.893229, 1, 1, 1, 1, 1,
-1.151679, -1.795671, -1.09332, 1, 1, 1, 1, 1,
-1.149654, -0.6327202, -3.279187, 1, 1, 1, 1, 1,
-1.144768, 1.176195, -0.7302259, 1, 1, 1, 1, 1,
-1.144287, -1.674124, -1.206815, 1, 1, 1, 1, 1,
-1.139247, -0.1722654, -0.1550453, 1, 1, 1, 1, 1,
-1.136397, 1.441952, 0.5417818, 1, 1, 1, 1, 1,
-1.119338, 1.587111, -0.4381845, 1, 1, 1, 1, 1,
-1.116352, 2.085716, -0.2393534, 0, 0, 1, 1, 1,
-1.103751, -0.3919175, -1.971762, 1, 0, 0, 1, 1,
-1.103235, 0.09774552, -2.420521, 1, 0, 0, 1, 1,
-1.101219, 0.5741846, -0.9604043, 1, 0, 0, 1, 1,
-1.097259, 0.969435, -1.358466, 1, 0, 0, 1, 1,
-1.097106, 0.8814636, -2.375074, 1, 0, 0, 1, 1,
-1.087717, -0.6959698, 0.3487119, 0, 0, 0, 1, 1,
-1.081656, 0.8831334, -1.03914, 0, 0, 0, 1, 1,
-1.081539, -1.723796, -2.123012, 0, 0, 0, 1, 1,
-1.075715, 0.4593552, -0.8543891, 0, 0, 0, 1, 1,
-1.074397, 0.4423965, -0.8179618, 0, 0, 0, 1, 1,
-1.067763, 0.5351619, -2.285944, 0, 0, 0, 1, 1,
-1.065715, 1.299741, -1.074128, 0, 0, 0, 1, 1,
-1.064535, 0.5860639, -1.877284, 1, 1, 1, 1, 1,
-1.059664, -0.2947357, -3.831876, 1, 1, 1, 1, 1,
-1.054119, -1.109189, -3.011021, 1, 1, 1, 1, 1,
-1.045567, 0.7833136, -1.461829, 1, 1, 1, 1, 1,
-1.045419, 0.895983, 0.07613812, 1, 1, 1, 1, 1,
-1.045334, 1.862912, 0.6539707, 1, 1, 1, 1, 1,
-1.043074, 1.366951, -0.7888529, 1, 1, 1, 1, 1,
-1.042335, -0.909981, -1.120434, 1, 1, 1, 1, 1,
-1.039923, 0.1455939, -2.39872, 1, 1, 1, 1, 1,
-1.03969, -0.308595, -1.732486, 1, 1, 1, 1, 1,
-1.030183, 0.6238515, -0.218193, 1, 1, 1, 1, 1,
-1.02531, -0.5657031, -2.373488, 1, 1, 1, 1, 1,
-1.020028, -0.2853645, -2.105216, 1, 1, 1, 1, 1,
-1.01947, 0.1416923, -0.9366048, 1, 1, 1, 1, 1,
-1.014776, 0.9222996, -0.1616126, 1, 1, 1, 1, 1,
-1.013644, 0.001515916, -1.827119, 0, 0, 1, 1, 1,
-1.002928, -0.2602694, -2.212632, 1, 0, 0, 1, 1,
-0.997892, 0.03611666, -3.60877, 1, 0, 0, 1, 1,
-0.9969115, 1.596521, -0.7585098, 1, 0, 0, 1, 1,
-0.9961477, -0.534825, -3.410126, 1, 0, 0, 1, 1,
-0.9841716, -0.4484538, -1.157359, 1, 0, 0, 1, 1,
-0.9828447, 2.206529, 1.597767, 0, 0, 0, 1, 1,
-0.9728789, -0.4353707, -1.511035, 0, 0, 0, 1, 1,
-0.9674389, -1.774905, -1.769688, 0, 0, 0, 1, 1,
-0.9603871, 1.181138, -0.6435822, 0, 0, 0, 1, 1,
-0.9570554, -1.731471, -2.256349, 0, 0, 0, 1, 1,
-0.9473943, 0.3088978, -2.098123, 0, 0, 0, 1, 1,
-0.9406192, 0.3615451, -0.7906372, 0, 0, 0, 1, 1,
-0.9327473, 1.302329, -1.34576, 1, 1, 1, 1, 1,
-0.9259137, -0.7472023, -2.375726, 1, 1, 1, 1, 1,
-0.9232097, -0.1063727, -0.2795941, 1, 1, 1, 1, 1,
-0.9212418, -0.1249716, -1.405973, 1, 1, 1, 1, 1,
-0.9185107, 0.8652771, -1.991214, 1, 1, 1, 1, 1,
-0.9032321, -0.07718171, -1.733011, 1, 1, 1, 1, 1,
-0.9022673, 1.049994, 1.213688, 1, 1, 1, 1, 1,
-0.8994786, -0.2321504, -1.870806, 1, 1, 1, 1, 1,
-0.89803, -0.6057849, -1.475358, 1, 1, 1, 1, 1,
-0.8934323, -0.2027604, -2.586534, 1, 1, 1, 1, 1,
-0.8933493, -0.4272522, -1.393277, 1, 1, 1, 1, 1,
-0.8903412, -1.842585, -3.699068, 1, 1, 1, 1, 1,
-0.8833034, 0.5818408, -2.218076, 1, 1, 1, 1, 1,
-0.8804273, 1.103205, -0.4810044, 1, 1, 1, 1, 1,
-0.8765826, 0.5925682, -1.579938, 1, 1, 1, 1, 1,
-0.872507, 1.247545, -1.272128, 0, 0, 1, 1, 1,
-0.8606888, -1.034778, -3.390002, 1, 0, 0, 1, 1,
-0.8600546, -0.7071466, -2.759154, 1, 0, 0, 1, 1,
-0.8596408, -0.6682132, -3.090703, 1, 0, 0, 1, 1,
-0.8534705, 1.727071, -0.5990878, 1, 0, 0, 1, 1,
-0.8525389, 0.0789879, -0.8760415, 1, 0, 0, 1, 1,
-0.8514264, -0.04679991, -1.268558, 0, 0, 0, 1, 1,
-0.8479118, 0.7188151, -0.6323965, 0, 0, 0, 1, 1,
-0.8400169, 1.314491, 0.3676005, 0, 0, 0, 1, 1,
-0.8384497, -0.09646304, -2.38606, 0, 0, 0, 1, 1,
-0.8369725, -0.006916196, -0.6644049, 0, 0, 0, 1, 1,
-0.8361295, 0.3204751, -0.8684449, 0, 0, 0, 1, 1,
-0.8338964, -0.6918053, -2.844, 0, 0, 0, 1, 1,
-0.8242176, 0.864862, -0.9095123, 1, 1, 1, 1, 1,
-0.8195068, -0.5481195, -2.877606, 1, 1, 1, 1, 1,
-0.8189508, -1.27409, -2.209857, 1, 1, 1, 1, 1,
-0.8155295, -0.015611, -2.391519, 1, 1, 1, 1, 1,
-0.8093326, -2.376617, -3.280954, 1, 1, 1, 1, 1,
-0.8089362, 0.1858138, -0.3905197, 1, 1, 1, 1, 1,
-0.8061609, 1.285948, 0.1867003, 1, 1, 1, 1, 1,
-0.8060376, -0.2204138, -0.7390735, 1, 1, 1, 1, 1,
-0.7910581, 0.1295153, -0.6448961, 1, 1, 1, 1, 1,
-0.7817224, 0.282366, -1.137028, 1, 1, 1, 1, 1,
-0.7801316, -0.1225094, -0.5220568, 1, 1, 1, 1, 1,
-0.7793017, -0.3352341, -3.178524, 1, 1, 1, 1, 1,
-0.7787501, -1.240344, -1.795197, 1, 1, 1, 1, 1,
-0.7785233, -0.9517237, -2.320369, 1, 1, 1, 1, 1,
-0.7751086, -0.1953594, -0.954104, 1, 1, 1, 1, 1,
-0.7750505, -0.2053594, -1.506544, 0, 0, 1, 1, 1,
-0.7748536, -0.8434192, -3.007112, 1, 0, 0, 1, 1,
-0.7747218, -0.0932085, -2.482018, 1, 0, 0, 1, 1,
-0.7735078, 0.9564443, -0.5637254, 1, 0, 0, 1, 1,
-0.7712378, 0.3624157, -0.7866163, 1, 0, 0, 1, 1,
-0.7688792, -0.8639239, -1.968686, 1, 0, 0, 1, 1,
-0.7580255, -0.4925265, -1.334195, 0, 0, 0, 1, 1,
-0.7553707, -0.1357501, -3.192721, 0, 0, 0, 1, 1,
-0.7531773, 2.10217, -0.8941327, 0, 0, 0, 1, 1,
-0.7430698, 0.3644007, -2.694838, 0, 0, 0, 1, 1,
-0.7410057, 0.2193471, -0.9196513, 0, 0, 0, 1, 1,
-0.7401128, 0.689383, -1.435316, 0, 0, 0, 1, 1,
-0.7380745, -0.4062715, -2.179168, 0, 0, 0, 1, 1,
-0.7371252, -0.7498626, -3.424171, 1, 1, 1, 1, 1,
-0.7364531, -1.550086, -2.527199, 1, 1, 1, 1, 1,
-0.7314383, -0.7251714, -2.631077, 1, 1, 1, 1, 1,
-0.7280049, -0.6580834, -3.162052, 1, 1, 1, 1, 1,
-0.7267798, -0.6101291, -2.763779, 1, 1, 1, 1, 1,
-0.722127, -0.1565128, -3.208649, 1, 1, 1, 1, 1,
-0.7193277, -2.040397, -3.078332, 1, 1, 1, 1, 1,
-0.7185966, -1.423687, -2.036988, 1, 1, 1, 1, 1,
-0.7176901, 1.536988, -0.6434951, 1, 1, 1, 1, 1,
-0.7170377, -0.7396534, -1.977809, 1, 1, 1, 1, 1,
-0.7128885, -0.111153, -3.390993, 1, 1, 1, 1, 1,
-0.7108746, -0.08544073, -2.572699, 1, 1, 1, 1, 1,
-0.706995, 1.005117, -0.6523067, 1, 1, 1, 1, 1,
-0.7061637, -1.889603, -2.417955, 1, 1, 1, 1, 1,
-0.7050245, -0.4649029, -1.960597, 1, 1, 1, 1, 1,
-0.7040389, 0.05522665, -2.697679, 0, 0, 1, 1, 1,
-0.7013432, -1.287919, -0.8684272, 1, 0, 0, 1, 1,
-0.694328, 0.4622132, 0.2969485, 1, 0, 0, 1, 1,
-0.688895, 0.1047233, -1.394205, 1, 0, 0, 1, 1,
-0.6773732, -0.07361346, -1.54969, 1, 0, 0, 1, 1,
-0.6710085, -1.115558, -1.93584, 1, 0, 0, 1, 1,
-0.6690959, -0.2637235, -2.834787, 0, 0, 0, 1, 1,
-0.6660453, 0.3995348, 0.3742565, 0, 0, 0, 1, 1,
-0.6658041, -0.7902998, -1.065815, 0, 0, 0, 1, 1,
-0.6652592, -0.401467, -4.080485, 0, 0, 0, 1, 1,
-0.6618971, -0.121023, -1.384154, 0, 0, 0, 1, 1,
-0.6609044, 0.8695687, 0.346333, 0, 0, 0, 1, 1,
-0.6577806, 1.277019, -2.349483, 0, 0, 0, 1, 1,
-0.6557029, 1.98721, -1.020372, 1, 1, 1, 1, 1,
-0.6525361, 0.4978335, -0.2367049, 1, 1, 1, 1, 1,
-0.6498138, -0.9045582, -1.558136, 1, 1, 1, 1, 1,
-0.6431302, -0.4034997, -0.395428, 1, 1, 1, 1, 1,
-0.6365173, 1.249476, -0.4781941, 1, 1, 1, 1, 1,
-0.6359245, -1.635094, -2.569832, 1, 1, 1, 1, 1,
-0.6358798, -0.9842565, -2.100249, 1, 1, 1, 1, 1,
-0.6347294, -0.1059552, -1.546846, 1, 1, 1, 1, 1,
-0.6335654, 1.550228, -0.7957109, 1, 1, 1, 1, 1,
-0.6323785, 1.122013, 1.726603, 1, 1, 1, 1, 1,
-0.6309453, -0.7614008, -1.722512, 1, 1, 1, 1, 1,
-0.6248537, 0.4558625, 0.5858904, 1, 1, 1, 1, 1,
-0.6203892, -0.0410411, -2.60201, 1, 1, 1, 1, 1,
-0.6168772, -0.8813862, -2.071918, 1, 1, 1, 1, 1,
-0.6122497, -0.9881815, -1.864873, 1, 1, 1, 1, 1,
-0.6118417, -0.4374264, -0.9683331, 0, 0, 1, 1, 1,
-0.6084862, -0.7373765, -2.153916, 1, 0, 0, 1, 1,
-0.6064118, -1.035525, -2.418063, 1, 0, 0, 1, 1,
-0.6059607, 1.548373, -1.636541, 1, 0, 0, 1, 1,
-0.599775, -0.7613139, -2.126781, 1, 0, 0, 1, 1,
-0.5981556, -0.6180856, -2.321845, 1, 0, 0, 1, 1,
-0.5960351, 0.1385886, -0.8672823, 0, 0, 0, 1, 1,
-0.5887278, 0.7378459, -0.3895285, 0, 0, 0, 1, 1,
-0.5878785, -0.6226364, -2.811368, 0, 0, 0, 1, 1,
-0.5728037, 0.3023755, -3.155757, 0, 0, 0, 1, 1,
-0.5662478, -0.4506495, -2.231298, 0, 0, 0, 1, 1,
-0.5661766, 0.08845834, -1.568812, 0, 0, 0, 1, 1,
-0.5659819, 0.2104843, -1.156202, 0, 0, 0, 1, 1,
-0.5567033, 0.9280556, 0.654254, 1, 1, 1, 1, 1,
-0.5556167, -1.586305, -1.711981, 1, 1, 1, 1, 1,
-0.5490122, -0.9401806, -2.637577, 1, 1, 1, 1, 1,
-0.5456434, 0.295302, 0.07883888, 1, 1, 1, 1, 1,
-0.5420317, -0.4869103, -2.76404, 1, 1, 1, 1, 1,
-0.5398438, -0.2649779, -2.293258, 1, 1, 1, 1, 1,
-0.5397105, 1.1357, -1.134259, 1, 1, 1, 1, 1,
-0.5382814, 0.4332477, -0.9980332, 1, 1, 1, 1, 1,
-0.5366674, -0.02027564, -2.117572, 1, 1, 1, 1, 1,
-0.5364867, -0.5969728, -0.00933014, 1, 1, 1, 1, 1,
-0.5352898, 0.1163274, -2.498944, 1, 1, 1, 1, 1,
-0.5279803, 1.40951, -0.5131261, 1, 1, 1, 1, 1,
-0.5277363, 1.291925, -0.09090103, 1, 1, 1, 1, 1,
-0.5251763, 0.3890749, -0.2646837, 1, 1, 1, 1, 1,
-0.5212017, 0.6533121, -0.161296, 1, 1, 1, 1, 1,
-0.5193551, -0.9856935, -3.691916, 0, 0, 1, 1, 1,
-0.507816, -1.717489, -0.9894221, 1, 0, 0, 1, 1,
-0.501875, 0.725888, 0.02746334, 1, 0, 0, 1, 1,
-0.4969943, 0.2577052, -2.622605, 1, 0, 0, 1, 1,
-0.496723, -1.489707, -3.483465, 1, 0, 0, 1, 1,
-0.492077, -0.1693088, -2.790943, 1, 0, 0, 1, 1,
-0.4910486, -0.6979144, -3.99414, 0, 0, 0, 1, 1,
-0.4908019, 0.7673816, -0.2432171, 0, 0, 0, 1, 1,
-0.4897546, -1.142721, -2.830028, 0, 0, 0, 1, 1,
-0.4897003, 2.777055, 0.6231655, 0, 0, 0, 1, 1,
-0.4879214, -1.320865, -1.613786, 0, 0, 0, 1, 1,
-0.4854786, 0.4654975, -1.322973, 0, 0, 0, 1, 1,
-0.4814141, -1.361109, -1.744755, 0, 0, 0, 1, 1,
-0.4788884, -0.05718229, -2.183335, 1, 1, 1, 1, 1,
-0.4745489, 0.421759, -0.4147979, 1, 1, 1, 1, 1,
-0.470271, 0.4371594, 0.06650719, 1, 1, 1, 1, 1,
-0.4695476, -0.7363834, -0.2857226, 1, 1, 1, 1, 1,
-0.4687133, -0.2224772, -1.697913, 1, 1, 1, 1, 1,
-0.468377, -0.3316296, -0.6169076, 1, 1, 1, 1, 1,
-0.4636536, -1.00616, -3.646636, 1, 1, 1, 1, 1,
-0.4522446, -0.5430599, -1.776936, 1, 1, 1, 1, 1,
-0.4522201, 1.722807, -3.226743, 1, 1, 1, 1, 1,
-0.4410676, -0.2919301, -2.504254, 1, 1, 1, 1, 1,
-0.4400384, -0.3559827, -2.981687, 1, 1, 1, 1, 1,
-0.4337309, -1.1156, -3.766476, 1, 1, 1, 1, 1,
-0.4307321, 0.0656445, -1.678393, 1, 1, 1, 1, 1,
-0.4289037, -1.15291, -2.697162, 1, 1, 1, 1, 1,
-0.4270813, 0.01149804, -0.5424756, 1, 1, 1, 1, 1,
-0.4247803, 0.1344067, -0.4487684, 0, 0, 1, 1, 1,
-0.4194894, 1.288812, 0.1534635, 1, 0, 0, 1, 1,
-0.4184211, -1.517686, -3.163385, 1, 0, 0, 1, 1,
-0.4149915, -0.4884182, -3.805598, 1, 0, 0, 1, 1,
-0.4131497, 1.199521, -0.5125334, 1, 0, 0, 1, 1,
-0.4128258, -0.3212164, -1.433526, 1, 0, 0, 1, 1,
-0.4127647, -0.6696918, -2.208162, 0, 0, 0, 1, 1,
-0.4114134, -0.7929103, -1.753604, 0, 0, 0, 1, 1,
-0.4098647, 2.007733, -0.4429934, 0, 0, 0, 1, 1,
-0.4018881, 1.340769, -0.04257461, 0, 0, 0, 1, 1,
-0.4013188, -1.510114, -2.093644, 0, 0, 0, 1, 1,
-0.3994555, 0.28417, -3.039896, 0, 0, 0, 1, 1,
-0.3992452, -0.8502033, -2.503767, 0, 0, 0, 1, 1,
-0.391964, 0.1346565, -3.374111, 1, 1, 1, 1, 1,
-0.3917162, 1.114246, -2.105787, 1, 1, 1, 1, 1,
-0.3907536, -0.8803476, -2.797075, 1, 1, 1, 1, 1,
-0.3906208, 0.20212, -1.457542, 1, 1, 1, 1, 1,
-0.3866263, 0.07553329, -2.050091, 1, 1, 1, 1, 1,
-0.3861701, 1.146886, 0.7578853, 1, 1, 1, 1, 1,
-0.3769804, 0.828639, 0.4298716, 1, 1, 1, 1, 1,
-0.3766852, -0.4184811, -2.830384, 1, 1, 1, 1, 1,
-0.3754896, 0.937577, -0.4902272, 1, 1, 1, 1, 1,
-0.3737831, 0.08003994, -1.903134, 1, 1, 1, 1, 1,
-0.3728827, 1.941407, -0.2368504, 1, 1, 1, 1, 1,
-0.3712699, -0.9059821, -3.014937, 1, 1, 1, 1, 1,
-0.3710881, 0.2626311, -1.054657, 1, 1, 1, 1, 1,
-0.3692181, 1.542142, -0.1318356, 1, 1, 1, 1, 1,
-0.3666747, 0.858126, -1.127713, 1, 1, 1, 1, 1,
-0.3642853, 1.450923, 0.5598346, 0, 0, 1, 1, 1,
-0.3623858, -1.184923, -3.182022, 1, 0, 0, 1, 1,
-0.359096, 0.6797632, -0.4141467, 1, 0, 0, 1, 1,
-0.3578937, 1.548218, -2.354143, 1, 0, 0, 1, 1,
-0.3528054, -1.301714, -1.377591, 1, 0, 0, 1, 1,
-0.3473588, -0.9254344, -2.039064, 1, 0, 0, 1, 1,
-0.3464613, 2.263384, -0.8359772, 0, 0, 0, 1, 1,
-0.3460583, 0.7024893, -1.102601, 0, 0, 0, 1, 1,
-0.3439589, 0.007643764, -0.9675385, 0, 0, 0, 1, 1,
-0.3394381, 1.684108, 0.2985243, 0, 0, 0, 1, 1,
-0.335977, 1.13274, -0.5318044, 0, 0, 0, 1, 1,
-0.3341078, -1.087917, -1.89484, 0, 0, 0, 1, 1,
-0.3301489, 0.7115911, -1.633046, 0, 0, 0, 1, 1,
-0.328693, -0.8956426, -3.380921, 1, 1, 1, 1, 1,
-0.3240775, 0.3722214, -1.576743, 1, 1, 1, 1, 1,
-0.3230685, 0.1105675, -1.253208, 1, 1, 1, 1, 1,
-0.3206147, 1.451849, -2.381731, 1, 1, 1, 1, 1,
-0.3198874, 0.4601697, -0.6412399, 1, 1, 1, 1, 1,
-0.317815, 0.02123647, -2.518737, 1, 1, 1, 1, 1,
-0.3177156, -0.3578407, -0.6225375, 1, 1, 1, 1, 1,
-0.3163329, 0.5297276, -0.3262744, 1, 1, 1, 1, 1,
-0.3145997, -1.077798, -4.588273, 1, 1, 1, 1, 1,
-0.3119119, 1.625048, 0.2603846, 1, 1, 1, 1, 1,
-0.309237, 1.103881, 0.1735134, 1, 1, 1, 1, 1,
-0.3080534, 0.6327345, -1.793059, 1, 1, 1, 1, 1,
-0.3025682, 0.7617645, -0.2571289, 1, 1, 1, 1, 1,
-0.2988886, -0.3515147, -1.686672, 1, 1, 1, 1, 1,
-0.2986772, 1.052654, 0.3158414, 1, 1, 1, 1, 1,
-0.2957702, -0.9771102, -3.421375, 0, 0, 1, 1, 1,
-0.2947387, 0.8852875, -0.08366148, 1, 0, 0, 1, 1,
-0.2929703, 1.004723, 0.284791, 1, 0, 0, 1, 1,
-0.2866783, 0.04047707, -0.6307842, 1, 0, 0, 1, 1,
-0.2861042, 1.916262, 0.7877707, 1, 0, 0, 1, 1,
-0.2843696, -1.244139, -3.524169, 1, 0, 0, 1, 1,
-0.2825205, 1.405732, -0.4070374, 0, 0, 0, 1, 1,
-0.2809637, 0.5014424, -0.3609076, 0, 0, 0, 1, 1,
-0.2770003, -0.1835776, -2.080015, 0, 0, 0, 1, 1,
-0.2731375, 1.220124, 0.6118879, 0, 0, 0, 1, 1,
-0.2722359, 0.7241611, 0.2245484, 0, 0, 0, 1, 1,
-0.2673028, 0.9972376, -0.9207852, 0, 0, 0, 1, 1,
-0.2630174, 0.5380911, -0.8193078, 0, 0, 0, 1, 1,
-0.2607645, 1.374569, 1.118621, 1, 1, 1, 1, 1,
-0.2584794, 1.237522, -0.7093157, 1, 1, 1, 1, 1,
-0.2577233, -0.368093, -2.918767, 1, 1, 1, 1, 1,
-0.2508763, 0.04133454, -0.5304295, 1, 1, 1, 1, 1,
-0.2497173, -0.5076361, -1.973578, 1, 1, 1, 1, 1,
-0.2480147, -0.821286, -2.19233, 1, 1, 1, 1, 1,
-0.2442684, -0.7782538, -3.8482, 1, 1, 1, 1, 1,
-0.2442046, -1.17089, -1.784473, 1, 1, 1, 1, 1,
-0.2430347, -0.709533, -3.028547, 1, 1, 1, 1, 1,
-0.2428888, -0.761651, -1.830819, 1, 1, 1, 1, 1,
-0.236594, 0.3707929, 0.4708911, 1, 1, 1, 1, 1,
-0.2345104, 1.259692, 0.05730826, 1, 1, 1, 1, 1,
-0.233862, 1.488554, -0.9548874, 1, 1, 1, 1, 1,
-0.2305394, 1.032622, -1.746135, 1, 1, 1, 1, 1,
-0.2291754, -1.301111, -3.028331, 1, 1, 1, 1, 1,
-0.2288568, -1.438607, -2.996096, 0, 0, 1, 1, 1,
-0.2281727, -1.362767, -4.452726, 1, 0, 0, 1, 1,
-0.2277434, 1.337706, -0.8121083, 1, 0, 0, 1, 1,
-0.226175, 1.119543, 0.5067593, 1, 0, 0, 1, 1,
-0.226163, -0.6405523, 1.039207, 1, 0, 0, 1, 1,
-0.2232236, 1.2312, -0.6938769, 1, 0, 0, 1, 1,
-0.22321, 0.9933559, -0.201036, 0, 0, 0, 1, 1,
-0.2226229, -0.06460126, -1.851505, 0, 0, 0, 1, 1,
-0.2181612, -0.191364, -2.714653, 0, 0, 0, 1, 1,
-0.218151, -1.663426, -1.162443, 0, 0, 0, 1, 1,
-0.2164658, -1.376184, -3.809022, 0, 0, 0, 1, 1,
-0.2161396, -1.002381, -3.026168, 0, 0, 0, 1, 1,
-0.2160109, -0.07957911, -2.324847, 0, 0, 0, 1, 1,
-0.2122628, 1.887426, -0.7938788, 1, 1, 1, 1, 1,
-0.2094637, 0.2305813, 0.5736263, 1, 1, 1, 1, 1,
-0.2089721, 1.0184, -0.3340573, 1, 1, 1, 1, 1,
-0.2061661, -0.2654624, -0.6890442, 1, 1, 1, 1, 1,
-0.2025793, -1.234427, -2.487712, 1, 1, 1, 1, 1,
-0.2019852, -0.2515263, -3.752692, 1, 1, 1, 1, 1,
-0.1989614, -0.004764086, -0.1379907, 1, 1, 1, 1, 1,
-0.1939452, 3.122276, 0.008249132, 1, 1, 1, 1, 1,
-0.192139, 0.5242031, -1.468535, 1, 1, 1, 1, 1,
-0.185392, 0.942025, -0.1653666, 1, 1, 1, 1, 1,
-0.182135, 1.813114, -0.2854734, 1, 1, 1, 1, 1,
-0.1771557, -0.1945739, -3.1061, 1, 1, 1, 1, 1,
-0.176477, -0.1795703, -2.759226, 1, 1, 1, 1, 1,
-0.1761229, -1.425508, -2.773169, 1, 1, 1, 1, 1,
-0.1690707, -0.07748327, -1.746103, 1, 1, 1, 1, 1,
-0.1673572, 0.6717957, -0.5984062, 0, 0, 1, 1, 1,
-0.1672598, 2.173708, 0.2977246, 1, 0, 0, 1, 1,
-0.1639193, 0.3889085, 2.482288, 1, 0, 0, 1, 1,
-0.1634156, -0.8968669, -3.492306, 1, 0, 0, 1, 1,
-0.1618666, -0.0467163, -2.579124, 1, 0, 0, 1, 1,
-0.1590725, 1.076615, -1.221637, 1, 0, 0, 1, 1,
-0.1585357, 0.5354686, -0.01742967, 0, 0, 0, 1, 1,
-0.1550727, 1.326133, 0.1757789, 0, 0, 0, 1, 1,
-0.1535763, 0.07039685, -1.001366, 0, 0, 0, 1, 1,
-0.1523333, 1.315259, 0.6217157, 0, 0, 0, 1, 1,
-0.1492492, -0.3405051, -2.908926, 0, 0, 0, 1, 1,
-0.1425118, -1.289228, -1.65393, 0, 0, 0, 1, 1,
-0.1409962, 0.7286313, 0.5456974, 0, 0, 0, 1, 1,
-0.1400332, 1.422563, 0.9096419, 1, 1, 1, 1, 1,
-0.13965, 0.7292863, -0.1779293, 1, 1, 1, 1, 1,
-0.1379282, -0.6011298, -3.324561, 1, 1, 1, 1, 1,
-0.1359075, -0.5904534, -1.503125, 1, 1, 1, 1, 1,
-0.1305512, -0.2841458, -2.006951, 1, 1, 1, 1, 1,
-0.1251874, -0.4172795, -3.955808, 1, 1, 1, 1, 1,
-0.1240697, -2.125988, -4.067834, 1, 1, 1, 1, 1,
-0.1201371, -0.8508208, -2.662045, 1, 1, 1, 1, 1,
-0.1200715, -0.6734771, -2.285411, 1, 1, 1, 1, 1,
-0.1193188, 0.08844846, -1.022337, 1, 1, 1, 1, 1,
-0.1180246, -0.3502599, -4.286239, 1, 1, 1, 1, 1,
-0.116262, 0.7540191, 0.4408812, 1, 1, 1, 1, 1,
-0.1138261, 0.4217828, -0.2707596, 1, 1, 1, 1, 1,
-0.113221, 0.2650385, 0.376423, 1, 1, 1, 1, 1,
-0.1119097, 1.071517, -2.371142, 1, 1, 1, 1, 1,
-0.1092738, 1.010002, 0.4473771, 0, 0, 1, 1, 1,
-0.1063196, -0.6146072, -3.567491, 1, 0, 0, 1, 1,
-0.1050014, -1.134672, -3.260168, 1, 0, 0, 1, 1,
-0.1037299, -0.6200805, -3.052468, 1, 0, 0, 1, 1,
-0.0962467, -2.258326, -3.96963, 1, 0, 0, 1, 1,
-0.09347435, -1.317001, -1.886757, 1, 0, 0, 1, 1,
-0.09022025, 0.3848191, 0.3000788, 0, 0, 0, 1, 1,
-0.08956268, 2.885573, 1.366601, 0, 0, 0, 1, 1,
-0.08517793, 0.975089, -0.5414132, 0, 0, 0, 1, 1,
-0.08486271, 0.2630437, 1.026218, 0, 0, 0, 1, 1,
-0.08265091, -0.6900508, -4.037538, 0, 0, 0, 1, 1,
-0.08227331, 0.7559912, 0.5336745, 0, 0, 0, 1, 1,
-0.07959768, 0.2830601, -0.164414, 0, 0, 0, 1, 1,
-0.07681972, 0.5290012, 0.356118, 1, 1, 1, 1, 1,
-0.06904969, -1.046095, -1.771649, 1, 1, 1, 1, 1,
-0.06724782, -0.2308345, -2.289796, 1, 1, 1, 1, 1,
-0.06027521, 0.9689929, -0.2378708, 1, 1, 1, 1, 1,
-0.05952285, -0.2096854, -3.017051, 1, 1, 1, 1, 1,
-0.0524985, 0.4157788, -0.9986986, 1, 1, 1, 1, 1,
-0.05218567, 0.04892541, -2.659793, 1, 1, 1, 1, 1,
-0.04929344, 1.455764, -1.367905, 1, 1, 1, 1, 1,
-0.04876386, -0.3783986, -2.497425, 1, 1, 1, 1, 1,
-0.04874982, -0.1732914, -2.720826, 1, 1, 1, 1, 1,
-0.04760604, 2.851496, 0.1742364, 1, 1, 1, 1, 1,
-0.03953226, -1.729258, -2.296473, 1, 1, 1, 1, 1,
-0.03784603, 0.9080675, -0.003149613, 1, 1, 1, 1, 1,
-0.03029419, -0.3224399, -2.32012, 1, 1, 1, 1, 1,
-0.02705019, -0.2730691, -1.883297, 1, 1, 1, 1, 1,
-0.02637395, 0.4298114, 0.5633241, 0, 0, 1, 1, 1,
-0.02151465, -0.321495, -3.112915, 1, 0, 0, 1, 1,
-0.01942336, -0.6036909, -1.464452, 1, 0, 0, 1, 1,
-0.01363862, 0.1110151, 0.2876899, 1, 0, 0, 1, 1,
-0.01121523, -0.283536, -3.59824, 1, 0, 0, 1, 1,
-0.01108673, 2.174703, -0.7370163, 1, 0, 0, 1, 1,
-0.005212583, 0.7115229, 0.3278843, 0, 0, 0, 1, 1,
-0.00485292, -0.1457868, -2.710736, 0, 0, 0, 1, 1,
-0.002947389, -0.3274051, -2.531703, 0, 0, 0, 1, 1,
0.00605048, 0.6928021, -1.46842, 0, 0, 0, 1, 1,
0.007761892, -0.07510824, 3.362233, 0, 0, 0, 1, 1,
0.008010694, 0.2676048, 0.7872302, 0, 0, 0, 1, 1,
0.008039881, -0.05412287, 2.136199, 0, 0, 0, 1, 1,
0.009488659, 0.6429799, 0.6439595, 1, 1, 1, 1, 1,
0.01758959, -0.5988528, 2.40083, 1, 1, 1, 1, 1,
0.02108808, -0.8182092, 3.258528, 1, 1, 1, 1, 1,
0.02609118, 0.1682351, -0.2242596, 1, 1, 1, 1, 1,
0.02753197, -0.2752823, 4.403863, 1, 1, 1, 1, 1,
0.03428947, 1.262656, 0.5311114, 1, 1, 1, 1, 1,
0.04116983, -1.212018, 4.690175, 1, 1, 1, 1, 1,
0.0496194, -0.8791127, 3.059421, 1, 1, 1, 1, 1,
0.04973618, 1.225423, -1.827231, 1, 1, 1, 1, 1,
0.05763469, -0.2028408, 3.079397, 1, 1, 1, 1, 1,
0.06532709, -0.001903773, 2.011718, 1, 1, 1, 1, 1,
0.0706889, -2.983987, 4.403984, 1, 1, 1, 1, 1,
0.07135346, 0.6986766, 0.4105888, 1, 1, 1, 1, 1,
0.07202366, -0.6254071, 2.935232, 1, 1, 1, 1, 1,
0.07271504, -1.339938, 2.190121, 1, 1, 1, 1, 1,
0.07340766, -0.5805829, 4.276896, 0, 0, 1, 1, 1,
0.07354727, 2.960559, 1.159523, 1, 0, 0, 1, 1,
0.07435078, -0.7197032, 4.111948, 1, 0, 0, 1, 1,
0.07706929, -1.000413, 3.291323, 1, 0, 0, 1, 1,
0.07964662, -3.571007, 3.821462, 1, 0, 0, 1, 1,
0.08294725, -2.847363, 5.35731, 1, 0, 0, 1, 1,
0.08596329, -1.283354, 3.634974, 0, 0, 0, 1, 1,
0.08852772, 1.161015, 0.5597496, 0, 0, 0, 1, 1,
0.0896772, 0.5255784, -0.898547, 0, 0, 0, 1, 1,
0.09227648, -0.02053521, 0.6397356, 0, 0, 0, 1, 1,
0.09247202, 0.2059197, 0.125497, 0, 0, 0, 1, 1,
0.09626227, 0.7422272, -0.02195201, 0, 0, 0, 1, 1,
0.09911943, 0.2418667, -1.019529, 0, 0, 0, 1, 1,
0.09956123, 2.429489, 0.7550994, 1, 1, 1, 1, 1,
0.1105709, 0.04934502, 1.125038, 1, 1, 1, 1, 1,
0.1131259, 0.3691583, 1.769396, 1, 1, 1, 1, 1,
0.1172171, -1.553029, 2.160499, 1, 1, 1, 1, 1,
0.1191409, 0.694103, 0.8611758, 1, 1, 1, 1, 1,
0.1202038, -0.2892081, 1.070089, 1, 1, 1, 1, 1,
0.1210318, 1.238184, 0.2017396, 1, 1, 1, 1, 1,
0.1270601, -0.5696788, 1.524305, 1, 1, 1, 1, 1,
0.1333985, -0.2504513, 3.166397, 1, 1, 1, 1, 1,
0.1371948, -0.4826483, 3.080427, 1, 1, 1, 1, 1,
0.1377816, -1.00374, 2.774991, 1, 1, 1, 1, 1,
0.138294, 0.1740302, 0.4852643, 1, 1, 1, 1, 1,
0.1387064, -0.7284731, 2.56667, 1, 1, 1, 1, 1,
0.1466421, -1.727505, 4.257193, 1, 1, 1, 1, 1,
0.1474648, 2.083496, 1.354681, 1, 1, 1, 1, 1,
0.1489664, 1.973364, 0.08470225, 0, 0, 1, 1, 1,
0.1528467, 0.3037951, 0.8687541, 1, 0, 0, 1, 1,
0.1565366, 0.3528755, 0.4495202, 1, 0, 0, 1, 1,
0.1571996, 0.2964363, 0.9931896, 1, 0, 0, 1, 1,
0.1608022, 0.269833, 1.488479, 1, 0, 0, 1, 1,
0.1619026, -1.32662, 1.872125, 1, 0, 0, 1, 1,
0.1634634, 1.403613, 0.05473827, 0, 0, 0, 1, 1,
0.1699769, -1.137328, 2.907449, 0, 0, 0, 1, 1,
0.1717632, 1.413069, 1.0511, 0, 0, 0, 1, 1,
0.1718893, -0.1624133, 2.927551, 0, 0, 0, 1, 1,
0.1734732, 0.7974526, -0.4229411, 0, 0, 0, 1, 1,
0.1748953, -0.9871564, 2.254962, 0, 0, 0, 1, 1,
0.1750291, 0.4682073, -0.5368397, 0, 0, 0, 1, 1,
0.1798164, -0.2302105, 1.515336, 1, 1, 1, 1, 1,
0.1812702, -0.9547195, 2.423246, 1, 1, 1, 1, 1,
0.1824221, 0.9937575, 0.3209437, 1, 1, 1, 1, 1,
0.1851321, -1.138921, 4.216624, 1, 1, 1, 1, 1,
0.188082, -0.6061406, 5.245859, 1, 1, 1, 1, 1,
0.1948999, 1.864418, 0.3967843, 1, 1, 1, 1, 1,
0.1982428, -0.3217764, 3.098394, 1, 1, 1, 1, 1,
0.2070594, 0.984082, 0.6754891, 1, 1, 1, 1, 1,
0.2078285, -1.61032, 2.762399, 1, 1, 1, 1, 1,
0.2087074, -0.6671293, 3.494596, 1, 1, 1, 1, 1,
0.2115497, -0.8430168, 3.072706, 1, 1, 1, 1, 1,
0.2145607, -0.919783, 3.903696, 1, 1, 1, 1, 1,
0.214592, 1.037572, -0.1799345, 1, 1, 1, 1, 1,
0.2160928, -0.4441242, 3.533052, 1, 1, 1, 1, 1,
0.2172459, -1.552811, 3.484977, 1, 1, 1, 1, 1,
0.2234045, -1.312997, 3.591536, 0, 0, 1, 1, 1,
0.2234225, -0.6524942, 0.9005243, 1, 0, 0, 1, 1,
0.2270432, -1.042874, 3.735257, 1, 0, 0, 1, 1,
0.2342543, 1.1222, -1.129218, 1, 0, 0, 1, 1,
0.2376546, 0.3680005, 1.018304, 1, 0, 0, 1, 1,
0.2378009, -0.1757846, 3.622562, 1, 0, 0, 1, 1,
0.2385505, 0.8626531, -0.4376966, 0, 0, 0, 1, 1,
0.2397952, 0.1426326, 1.607833, 0, 0, 0, 1, 1,
0.2416757, 0.8200909, 1.881441, 0, 0, 0, 1, 1,
0.2441583, -0.7747403, 1.183629, 0, 0, 0, 1, 1,
0.2487384, 0.7004915, 0.3828252, 0, 0, 0, 1, 1,
0.2540556, 1.056766, 2.286014, 0, 0, 0, 1, 1,
0.2568417, 0.2432517, 1.122216, 0, 0, 0, 1, 1,
0.2585858, 0.5798994, 1.571733, 1, 1, 1, 1, 1,
0.2657263, 0.2083453, 0.2627581, 1, 1, 1, 1, 1,
0.2662112, 0.1824966, 0.04008908, 1, 1, 1, 1, 1,
0.2672922, 0.3170972, 0.8354321, 1, 1, 1, 1, 1,
0.2700934, -1.025755, 3.628033, 1, 1, 1, 1, 1,
0.2704932, -0.2895977, 1.184053, 1, 1, 1, 1, 1,
0.2713141, 1.682896, 0.07834411, 1, 1, 1, 1, 1,
0.2720367, 0.355738, -0.03186122, 1, 1, 1, 1, 1,
0.2751785, -0.6564789, 2.068112, 1, 1, 1, 1, 1,
0.2773319, 0.06932466, 3.403937, 1, 1, 1, 1, 1,
0.2781317, -0.8235387, 2.080625, 1, 1, 1, 1, 1,
0.2791811, 1.4441, 0.07866296, 1, 1, 1, 1, 1,
0.281352, 0.6454854, 0.7675253, 1, 1, 1, 1, 1,
0.2889749, -0.938871, 1.42577, 1, 1, 1, 1, 1,
0.290071, -0.4298715, 1.49218, 1, 1, 1, 1, 1,
0.2900918, 0.522168, 0.8387173, 0, 0, 1, 1, 1,
0.2941234, 0.5539412, 0.7225694, 1, 0, 0, 1, 1,
0.2974821, -0.7494965, 2.397507, 1, 0, 0, 1, 1,
0.2989123, -0.09906087, 0.9323037, 1, 0, 0, 1, 1,
0.3003584, 0.4077395, 2.804796, 1, 0, 0, 1, 1,
0.308587, 1.62662, 0.7049035, 1, 0, 0, 1, 1,
0.3119273, -0.9609612, 3.499904, 0, 0, 0, 1, 1,
0.3207485, 0.3850663, 0.8815919, 0, 0, 0, 1, 1,
0.3211247, -0.2331697, 2.052425, 0, 0, 0, 1, 1,
0.3256743, 0.7941672, 0.9086859, 0, 0, 0, 1, 1,
0.32749, -0.1990533, 2.063281, 0, 0, 0, 1, 1,
0.3334509, 2.569746, -0.1646084, 0, 0, 0, 1, 1,
0.3350621, 2.818053, 1.219714, 0, 0, 0, 1, 1,
0.3352611, -0.1553776, 0.671867, 1, 1, 1, 1, 1,
0.3353674, 2.261148, 1.156303, 1, 1, 1, 1, 1,
0.3355875, -0.9679135, 3.352519, 1, 1, 1, 1, 1,
0.3403214, 1.240676, -0.5336283, 1, 1, 1, 1, 1,
0.3437901, -1.000083, 3.233274, 1, 1, 1, 1, 1,
0.3481693, 0.3510238, 1.746057, 1, 1, 1, 1, 1,
0.3495293, -0.5187582, 0.421636, 1, 1, 1, 1, 1,
0.3506314, 0.4123437, 2.009016, 1, 1, 1, 1, 1,
0.3562127, 1.421622, 0.07593396, 1, 1, 1, 1, 1,
0.3620064, -2.061278, 4.062397, 1, 1, 1, 1, 1,
0.3639106, -0.6885717, 2.597987, 1, 1, 1, 1, 1,
0.3674519, -0.1692687, 1.975616, 1, 1, 1, 1, 1,
0.3680672, 0.1525501, 1.161176, 1, 1, 1, 1, 1,
0.3687651, 0.01861618, 1.059152, 1, 1, 1, 1, 1,
0.3708009, 0.7016991, 0.7190686, 1, 1, 1, 1, 1,
0.3750892, 1.678464, -1.042617, 0, 0, 1, 1, 1,
0.3788077, -0.9420102, 4.51451, 1, 0, 0, 1, 1,
0.3793433, -0.02963978, 1.334252, 1, 0, 0, 1, 1,
0.380422, -0.4961647, 1.017373, 1, 0, 0, 1, 1,
0.3809016, 0.2394381, 0.981519, 1, 0, 0, 1, 1,
0.3837761, 0.6722718, 1.278413, 1, 0, 0, 1, 1,
0.3888079, 0.1153686, 2.654153, 0, 0, 0, 1, 1,
0.3890771, 0.3517674, 2.095958, 0, 0, 0, 1, 1,
0.3968198, -0.5881919, 2.12396, 0, 0, 0, 1, 1,
0.3972567, 0.0484293, 0.2557077, 0, 0, 0, 1, 1,
0.3990868, -0.8327717, 3.887426, 0, 0, 0, 1, 1,
0.3998011, -0.2886041, 0.8421498, 0, 0, 0, 1, 1,
0.4008436, -0.6734804, 1.778417, 0, 0, 0, 1, 1,
0.4030417, 0.4762602, -0.7508493, 1, 1, 1, 1, 1,
0.404483, -0.4000404, 1.766706, 1, 1, 1, 1, 1,
0.4075898, -1.703231, 4.137625, 1, 1, 1, 1, 1,
0.4146052, 0.3975864, 3.215832, 1, 1, 1, 1, 1,
0.4165099, -0.843173, 2.564665, 1, 1, 1, 1, 1,
0.4197152, -0.01427381, 2.057734, 1, 1, 1, 1, 1,
0.4229535, 0.2991048, 0.1582098, 1, 1, 1, 1, 1,
0.4283442, -0.187533, 2.377319, 1, 1, 1, 1, 1,
0.4284863, 0.2175184, 0.9018729, 1, 1, 1, 1, 1,
0.4308259, -1.065846, 0.2589884, 1, 1, 1, 1, 1,
0.4343019, 1.188492, -0.6721454, 1, 1, 1, 1, 1,
0.4345489, -1.750329, 2.155951, 1, 1, 1, 1, 1,
0.436462, 0.289815, 0.4950158, 1, 1, 1, 1, 1,
0.4405894, -2.084841, 5.186123, 1, 1, 1, 1, 1,
0.4492366, 1.728962, -1.121354, 1, 1, 1, 1, 1,
0.4493343, 0.06403912, 1.021183, 0, 0, 1, 1, 1,
0.4528765, -0.973286, 2.931524, 1, 0, 0, 1, 1,
0.4531218, 1.657318, 0.03821449, 1, 0, 0, 1, 1,
0.4577528, -0.8164921, 2.36646, 1, 0, 0, 1, 1,
0.4615328, -1.121303, 0.178183, 1, 0, 0, 1, 1,
0.4622777, -1.151626, 3.993119, 1, 0, 0, 1, 1,
0.4662116, 0.212465, 1.411533, 0, 0, 0, 1, 1,
0.4667377, -0.4270878, 0.8210317, 0, 0, 0, 1, 1,
0.46984, 1.350561, 2.150094, 0, 0, 0, 1, 1,
0.4773792, -0.6947629, 1.309884, 0, 0, 0, 1, 1,
0.4784182, -1.153004, 3.862274, 0, 0, 0, 1, 1,
0.4817875, -0.6136146, 3.947507, 0, 0, 0, 1, 1,
0.4836633, 1.174226, 0.7316879, 0, 0, 0, 1, 1,
0.4837622, -0.4294287, -0.4656645, 1, 1, 1, 1, 1,
0.4841311, -0.1581236, 1.106043, 1, 1, 1, 1, 1,
0.4906352, -0.1742991, 2.032342, 1, 1, 1, 1, 1,
0.4936242, -0.4223128, 3.6007, 1, 1, 1, 1, 1,
0.4963941, -0.2100354, 2.742409, 1, 1, 1, 1, 1,
0.5084674, -0.3047298, 1.818232, 1, 1, 1, 1, 1,
0.5112351, 1.183791, 0.8107473, 1, 1, 1, 1, 1,
0.521754, 0.1876897, 2.824331, 1, 1, 1, 1, 1,
0.5245354, 1.354985, 1.707003, 1, 1, 1, 1, 1,
0.5273997, 0.1663391, 0.4206188, 1, 1, 1, 1, 1,
0.5298129, -0.1506559, 0.7654141, 1, 1, 1, 1, 1,
0.5334002, -0.8100445, 2.090418, 1, 1, 1, 1, 1,
0.5379051, 0.3301869, 1.356435, 1, 1, 1, 1, 1,
0.5399044, -0.5825562, 3.402629, 1, 1, 1, 1, 1,
0.5438465, 1.31986, 0.01284512, 1, 1, 1, 1, 1,
0.5453024, -0.9978924, 1.582087, 0, 0, 1, 1, 1,
0.5486023, -1.034012, 3.43716, 1, 0, 0, 1, 1,
0.5511949, -0.4127159, 1.354474, 1, 0, 0, 1, 1,
0.5529487, -0.668814, 3.791102, 1, 0, 0, 1, 1,
0.5549617, -0.05294808, -0.05053143, 1, 0, 0, 1, 1,
0.5557553, -1.985222, 3.320166, 1, 0, 0, 1, 1,
0.5561705, -0.3725063, 2.333567, 0, 0, 0, 1, 1,
0.5572436, -0.5505357, 1.831843, 0, 0, 0, 1, 1,
0.5573038, 0.5676129, 0.7603706, 0, 0, 0, 1, 1,
0.5582475, 0.481304, 0.1540147, 0, 0, 0, 1, 1,
0.5681696, -1.55324, 2.564002, 0, 0, 0, 1, 1,
0.5747323, -1.122767, 1.983729, 0, 0, 0, 1, 1,
0.5765855, 0.3822179, 1.397211, 0, 0, 0, 1, 1,
0.5795519, -1.042716, 2.25886, 1, 1, 1, 1, 1,
0.5801434, 1.117014, 1.465722, 1, 1, 1, 1, 1,
0.5859784, 1.579337, 0.8262162, 1, 1, 1, 1, 1,
0.5864806, -0.4570025, 2.583608, 1, 1, 1, 1, 1,
0.5882578, 0.1910229, 1.100636, 1, 1, 1, 1, 1,
0.5897279, -0.9789166, 2.10592, 1, 1, 1, 1, 1,
0.5927234, -0.9652364, 3.724784, 1, 1, 1, 1, 1,
0.5931428, 1.885921, 1.899708, 1, 1, 1, 1, 1,
0.5944207, 0.9860435, 1.69716, 1, 1, 1, 1, 1,
0.5962461, 0.4827407, -0.9951051, 1, 1, 1, 1, 1,
0.5992966, 1.55134, 0.7906836, 1, 1, 1, 1, 1,
0.5994959, -0.2269415, 1.692048, 1, 1, 1, 1, 1,
0.6011246, 0.3301035, 0.1076368, 1, 1, 1, 1, 1,
0.6021463, -0.9047419, 2.993632, 1, 1, 1, 1, 1,
0.6026803, -0.08391699, 1.709574, 1, 1, 1, 1, 1,
0.6075954, 1.143206, 0.2863991, 0, 0, 1, 1, 1,
0.6081751, -0.8402498, 4.135515, 1, 0, 0, 1, 1,
0.6117103, 1.028527, -0.1529047, 1, 0, 0, 1, 1,
0.6143838, -1.74531, 0.5380874, 1, 0, 0, 1, 1,
0.6205514, 0.7319946, 1.142698, 1, 0, 0, 1, 1,
0.6213346, -0.2430572, 1.111447, 1, 0, 0, 1, 1,
0.6266415, -0.211589, 2.575252, 0, 0, 0, 1, 1,
0.6295159, -0.4038822, 2.106665, 0, 0, 0, 1, 1,
0.6296559, -1.987004, 3.873861, 0, 0, 0, 1, 1,
0.6312872, 0.399632, 0.1421624, 0, 0, 0, 1, 1,
0.6323184, 0.3329503, 0.6133829, 0, 0, 0, 1, 1,
0.6436158, 0.4708688, 1.049802, 0, 0, 0, 1, 1,
0.6450638, -0.8561103, 1.358649, 0, 0, 0, 1, 1,
0.6550933, -0.8525789, 2.398106, 1, 1, 1, 1, 1,
0.6585492, -0.9849913, 0.2944582, 1, 1, 1, 1, 1,
0.6588458, -0.8776738, 1.556844, 1, 1, 1, 1, 1,
0.6616812, -0.576107, 2.743254, 1, 1, 1, 1, 1,
0.6646324, 0.7911583, 0.3957053, 1, 1, 1, 1, 1,
0.6646466, 0.4357521, 1.375419, 1, 1, 1, 1, 1,
0.668561, -0.3330734, 1.07214, 1, 1, 1, 1, 1,
0.6722041, -0.4753878, 1.881773, 1, 1, 1, 1, 1,
0.6727664, 0.9451959, 0.780396, 1, 1, 1, 1, 1,
0.674026, -1.625423, 3.556951, 1, 1, 1, 1, 1,
0.679637, 0.03302869, 2.251987, 1, 1, 1, 1, 1,
0.6831363, 0.006429755, 2.076714, 1, 1, 1, 1, 1,
0.6889572, -2.280813, 4.480343, 1, 1, 1, 1, 1,
0.6890247, -2.168513, 2.36833, 1, 1, 1, 1, 1,
0.6912845, 1.481646, -0.9510137, 1, 1, 1, 1, 1,
0.6946067, 1.003104, 2.067588, 0, 0, 1, 1, 1,
0.694976, 0.8300667, -0.120678, 1, 0, 0, 1, 1,
0.7052929, 0.1698274, -0.9699206, 1, 0, 0, 1, 1,
0.7092187, -0.3232888, 1.19706, 1, 0, 0, 1, 1,
0.7107066, 1.065354, 0.3756203, 1, 0, 0, 1, 1,
0.7132606, -2.507279, 2.139724, 1, 0, 0, 1, 1,
0.7147921, -1.477261, 3.654694, 0, 0, 0, 1, 1,
0.7150355, -1.333143, 1.601777, 0, 0, 0, 1, 1,
0.7219868, -0.7759008, 2.592512, 0, 0, 0, 1, 1,
0.7232931, -0.1479538, 2.865271, 0, 0, 0, 1, 1,
0.725542, -0.01165963, 2.637423, 0, 0, 0, 1, 1,
0.7394798, 0.1574285, 0.2450614, 0, 0, 0, 1, 1,
0.752001, -0.3915211, 2.558084, 0, 0, 0, 1, 1,
0.7535782, 0.5793072, 3.061411, 1, 1, 1, 1, 1,
0.7544082, 0.4515111, 0.2091479, 1, 1, 1, 1, 1,
0.7633717, -1.268515, 2.210753, 1, 1, 1, 1, 1,
0.7715793, 1.421852, -2.317289, 1, 1, 1, 1, 1,
0.7750392, -0.5371957, 2.358737, 1, 1, 1, 1, 1,
0.7767992, -1.576879, 1.920067, 1, 1, 1, 1, 1,
0.7819623, -0.1568523, 2.248906, 1, 1, 1, 1, 1,
0.7877044, -0.3437335, 1.752564, 1, 1, 1, 1, 1,
0.7883128, 1.320114, -0.7467865, 1, 1, 1, 1, 1,
0.7906529, -0.1180195, 1.511027, 1, 1, 1, 1, 1,
0.7909108, 0.08449918, 2.316822, 1, 1, 1, 1, 1,
0.7928799, 0.5115044, 0.3795916, 1, 1, 1, 1, 1,
0.7931378, 0.5758553, 2.418585, 1, 1, 1, 1, 1,
0.7953579, -0.898266, 3.074934, 1, 1, 1, 1, 1,
0.7993776, -0.8426892, 2.132221, 1, 1, 1, 1, 1,
0.8034543, -0.08771691, 3.132841, 0, 0, 1, 1, 1,
0.8046144, 0.1384974, 2.713187, 1, 0, 0, 1, 1,
0.8060086, 0.9912754, 0.9015417, 1, 0, 0, 1, 1,
0.8062481, -1.003126, 1.742518, 1, 0, 0, 1, 1,
0.8104464, 0.1986952, 2.077766, 1, 0, 0, 1, 1,
0.8110995, -0.0726717, -0.2034359, 1, 0, 0, 1, 1,
0.8122328, -0.5129192, 2.067953, 0, 0, 0, 1, 1,
0.8149415, 0.4830056, 1.639938, 0, 0, 0, 1, 1,
0.8163579, 1.488527, 1.050377, 0, 0, 0, 1, 1,
0.8169479, -0.2773103, 3.142829, 0, 0, 0, 1, 1,
0.8189518, 0.7486488, 1.496385, 0, 0, 0, 1, 1,
0.8241947, -1.347445, 3.597309, 0, 0, 0, 1, 1,
0.8252291, 0.0927252, 1.490432, 0, 0, 0, 1, 1,
0.8286897, 1.373832, 1.036175, 1, 1, 1, 1, 1,
0.8299384, 0.04226134, 1.00742, 1, 1, 1, 1, 1,
0.8346572, -0.3334841, 1.033453, 1, 1, 1, 1, 1,
0.8352522, -1.947931, 0.8341722, 1, 1, 1, 1, 1,
0.8360229, -0.01155009, 1.938934, 1, 1, 1, 1, 1,
0.8423122, 1.907704, 0.8799071, 1, 1, 1, 1, 1,
0.8425677, -0.7739271, 3.68975, 1, 1, 1, 1, 1,
0.8439512, 1.345741, 1.410785, 1, 1, 1, 1, 1,
0.8460428, -0.02331403, 0.752055, 1, 1, 1, 1, 1,
0.8469242, -0.3440005, 1.740504, 1, 1, 1, 1, 1,
0.8602035, 0.09249822, 1.961307, 1, 1, 1, 1, 1,
0.8609994, 2.516661, 0.06599579, 1, 1, 1, 1, 1,
0.8630785, 1.158059, 1.95106, 1, 1, 1, 1, 1,
0.8637639, 0.8380749, 0.01613369, 1, 1, 1, 1, 1,
0.8734899, -1.78725, 2.54724, 1, 1, 1, 1, 1,
0.8741367, -0.6177634, 1.410643, 0, 0, 1, 1, 1,
0.8748121, -2.200202, 3.529312, 1, 0, 0, 1, 1,
0.8803351, 0.5881546, -0.0947884, 1, 0, 0, 1, 1,
0.8810962, 1.063601, 0.5848046, 1, 0, 0, 1, 1,
0.8817544, 0.7038764, 0.5706555, 1, 0, 0, 1, 1,
0.8895523, 0.1029676, 1.73673, 1, 0, 0, 1, 1,
0.894448, 0.7675816, 0.3811778, 0, 0, 0, 1, 1,
0.8951858, -0.5588061, 2.819087, 0, 0, 0, 1, 1,
0.8954754, -0.8096014, 2.432062, 0, 0, 0, 1, 1,
0.9065186, -0.4326438, 1.906191, 0, 0, 0, 1, 1,
0.9101415, -0.1427467, 0.06709781, 0, 0, 0, 1, 1,
0.9170511, 0.993686, -0.07081454, 0, 0, 0, 1, 1,
0.9177788, 1.448589, 1.701477, 0, 0, 0, 1, 1,
0.9179836, 0.2776356, 1.919432, 1, 1, 1, 1, 1,
0.9212437, 1.012084, 1.819886, 1, 1, 1, 1, 1,
0.9303263, 1.031444, 3.108899, 1, 1, 1, 1, 1,
0.9321895, 1.193911, 0.6086192, 1, 1, 1, 1, 1,
0.9393237, -1.515715, 3.040552, 1, 1, 1, 1, 1,
0.9402257, -0.6928477, 1.006838, 1, 1, 1, 1, 1,
0.9416286, -0.0522263, 0.7456953, 1, 1, 1, 1, 1,
0.9444857, -0.03351327, 2.507311, 1, 1, 1, 1, 1,
0.9446824, -0.0488582, 1.281408, 1, 1, 1, 1, 1,
0.9484916, -0.2466666, 2.502175, 1, 1, 1, 1, 1,
0.9499039, 1.150458, -0.7547597, 1, 1, 1, 1, 1,
0.9533329, 2.358255, 0.2154469, 1, 1, 1, 1, 1,
0.9533432, -0.8275865, 2.026998, 1, 1, 1, 1, 1,
0.9533911, 2.015395, 1.82698, 1, 1, 1, 1, 1,
0.9577016, -0.2229411, 3.750495, 1, 1, 1, 1, 1,
0.961733, 0.1688211, 0.5000473, 0, 0, 1, 1, 1,
0.9658666, -0.9161216, 0.3078254, 1, 0, 0, 1, 1,
0.9658829, -1.221161, 2.39694, 1, 0, 0, 1, 1,
0.9746867, -0.05425233, 1.04995, 1, 0, 0, 1, 1,
0.9790965, 0.1652163, 1.321386, 1, 0, 0, 1, 1,
0.9827902, 0.3395616, 1.314784, 1, 0, 0, 1, 1,
0.9847792, 0.1965965, 0.4421345, 0, 0, 0, 1, 1,
0.9924834, -0.7962971, 2.375382, 0, 0, 0, 1, 1,
1.009902, 0.3501109, -0.1209894, 0, 0, 0, 1, 1,
1.016511, -1.226309, 2.939929, 0, 0, 0, 1, 1,
1.024987, -1.559847, 3.424896, 0, 0, 0, 1, 1,
1.0267, 0.1555625, 1.530589, 0, 0, 0, 1, 1,
1.027957, -0.3287232, 4.977773, 0, 0, 0, 1, 1,
1.035805, -0.6365964, 1.601259, 1, 1, 1, 1, 1,
1.042598, 1.669152, 1.505455, 1, 1, 1, 1, 1,
1.042994, -1.017693, 3.444905, 1, 1, 1, 1, 1,
1.043889, -0.1959829, 1.163645, 1, 1, 1, 1, 1,
1.047155, 0.1004305, 2.298, 1, 1, 1, 1, 1,
1.054247, 1.016241, 0.7203413, 1, 1, 1, 1, 1,
1.065702, -0.2555318, 1.650006, 1, 1, 1, 1, 1,
1.066763, 1.253068, 2.008845, 1, 1, 1, 1, 1,
1.06746, 1.387135, 0.1389451, 1, 1, 1, 1, 1,
1.070367, 0.5634217, 0.001129934, 1, 1, 1, 1, 1,
1.077494, 1.416756, 0.4736007, 1, 1, 1, 1, 1,
1.082643, -0.05498083, 1.517131, 1, 1, 1, 1, 1,
1.085137, -0.03915056, -0.1212118, 1, 1, 1, 1, 1,
1.091596, -0.1333923, 2.258814, 1, 1, 1, 1, 1,
1.096254, 0.8921742, 0.2213037, 1, 1, 1, 1, 1,
1.10021, 0.5266772, -2.698308, 0, 0, 1, 1, 1,
1.100577, 0.02426773, 1.267226, 1, 0, 0, 1, 1,
1.105076, -0.4394063, 1.704039, 1, 0, 0, 1, 1,
1.119679, 1.352437, -1.028886, 1, 0, 0, 1, 1,
1.124084, -0.7111983, 3.529442, 1, 0, 0, 1, 1,
1.126225, -1.290685, 2.247057, 1, 0, 0, 1, 1,
1.132034, -2.079389, 0.7971344, 0, 0, 0, 1, 1,
1.13438, 0.6707755, 1.453795, 0, 0, 0, 1, 1,
1.134552, 0.582935, 0.897339, 0, 0, 0, 1, 1,
1.139613, -1.977698, 2.888048, 0, 0, 0, 1, 1,
1.140376, -0.7713573, 1.647067, 0, 0, 0, 1, 1,
1.147765, 1.282349, -0.3013844, 0, 0, 0, 1, 1,
1.151886, 0.002583641, 0.413119, 0, 0, 0, 1, 1,
1.157411, 1.880878, 1.854492, 1, 1, 1, 1, 1,
1.159541, 1.869887, 1.197124, 1, 1, 1, 1, 1,
1.161959, -0.9249531, 1.929296, 1, 1, 1, 1, 1,
1.162156, 0.7509821, -1.00913, 1, 1, 1, 1, 1,
1.168338, -2.67416, 2.932069, 1, 1, 1, 1, 1,
1.171683, -0.2556151, 3.571817, 1, 1, 1, 1, 1,
1.178863, -0.3927869, 1.554249, 1, 1, 1, 1, 1,
1.18705, -1.300716, 3.624714, 1, 1, 1, 1, 1,
1.188051, -0.5128672, 3.639721, 1, 1, 1, 1, 1,
1.19116, -1.641301, 1.810329, 1, 1, 1, 1, 1,
1.196998, -0.9188782, 3.065554, 1, 1, 1, 1, 1,
1.197643, 1.385759, -0.3793968, 1, 1, 1, 1, 1,
1.198615, -0.3214025, 1.216495, 1, 1, 1, 1, 1,
1.199144, -1.52162, 2.778674, 1, 1, 1, 1, 1,
1.202666, -0.1302859, 0.06788036, 1, 1, 1, 1, 1,
1.206172, -0.3995639, 1.2955, 0, 0, 1, 1, 1,
1.210027, -0.1119117, 1.950509, 1, 0, 0, 1, 1,
1.210284, 0.169454, 1.270279, 1, 0, 0, 1, 1,
1.211342, -0.1919731, 3.238189, 1, 0, 0, 1, 1,
1.220024, -0.9155415, 0.4170265, 1, 0, 0, 1, 1,
1.222192, 0.8592016, 1.478748, 1, 0, 0, 1, 1,
1.224042, -2.679842, 3.570584, 0, 0, 0, 1, 1,
1.226351, 0.829791, 0.8655156, 0, 0, 0, 1, 1,
1.232902, 1.34756, 1.34173, 0, 0, 0, 1, 1,
1.240655, -0.6721599, 1.973074, 0, 0, 0, 1, 1,
1.245253, 0.1902678, -0.2151364, 0, 0, 0, 1, 1,
1.252124, -0.5291741, 2.225276, 0, 0, 0, 1, 1,
1.264836, 0.469438, 0.07851051, 0, 0, 0, 1, 1,
1.273554, 0.2185942, 1.232162, 1, 1, 1, 1, 1,
1.273871, -2.85347, 3.57202, 1, 1, 1, 1, 1,
1.275948, 0.9656712, 0.673371, 1, 1, 1, 1, 1,
1.279287, -0.4821712, 3.535034, 1, 1, 1, 1, 1,
1.289711, -0.4578687, 2.119795, 1, 1, 1, 1, 1,
1.292503, -0.8717441, 0.9433908, 1, 1, 1, 1, 1,
1.302991, -1.327734, 1.455306, 1, 1, 1, 1, 1,
1.312693, -0.02699929, 2.423101, 1, 1, 1, 1, 1,
1.327536, -0.4865219, 0.5872939, 1, 1, 1, 1, 1,
1.330032, 0.2225393, 2.135407, 1, 1, 1, 1, 1,
1.338214, 1.762604, -1.355394, 1, 1, 1, 1, 1,
1.339978, -0.8261723, 1.288287, 1, 1, 1, 1, 1,
1.341077, -1.046319, 0.2751917, 1, 1, 1, 1, 1,
1.344287, -0.9630552, 2.360023, 1, 1, 1, 1, 1,
1.349426, 0.2543949, 2.910065, 1, 1, 1, 1, 1,
1.357921, 0.3267997, 2.399757, 0, 0, 1, 1, 1,
1.362718, -0.7285143, 0.6060717, 1, 0, 0, 1, 1,
1.383939, 0.06048783, 1.851489, 1, 0, 0, 1, 1,
1.384033, -0.2541615, 2.607916, 1, 0, 0, 1, 1,
1.389278, 0.9350488, 2.130866, 1, 0, 0, 1, 1,
1.400883, -1.152674, 2.681089, 1, 0, 0, 1, 1,
1.401175, -0.008773776, 2.230788, 0, 0, 0, 1, 1,
1.42015, -2.199596, 3.267964, 0, 0, 0, 1, 1,
1.449495, -0.9340821, 2.501568, 0, 0, 0, 1, 1,
1.450503, 0.8265317, 0.5098109, 0, 0, 0, 1, 1,
1.473541, -1.812648, 1.495957, 0, 0, 0, 1, 1,
1.476761, -0.9551519, 1.084565, 0, 0, 0, 1, 1,
1.477028, -1.134524, 3.584514, 0, 0, 0, 1, 1,
1.480698, 0.2608743, 1.681055, 1, 1, 1, 1, 1,
1.501012, -0.487711, 1.025254, 1, 1, 1, 1, 1,
1.503793, -0.2809047, 0.9609299, 1, 1, 1, 1, 1,
1.515856, 0.3504281, 1.106358, 1, 1, 1, 1, 1,
1.525161, -0.6095548, 2.339905, 1, 1, 1, 1, 1,
1.53523, 0.1273462, 1.34512, 1, 1, 1, 1, 1,
1.566035, -0.1628331, 0.4857805, 1, 1, 1, 1, 1,
1.573418, 0.6799001, 1.520214, 1, 1, 1, 1, 1,
1.579941, 0.5339131, 0.6196226, 1, 1, 1, 1, 1,
1.583748, -2.04312, 1.206051, 1, 1, 1, 1, 1,
1.587582, -0.207228, 1.47423, 1, 1, 1, 1, 1,
1.590896, 0.4861917, 2.030762, 1, 1, 1, 1, 1,
1.601003, 0.6243283, -1.082169, 1, 1, 1, 1, 1,
1.609795, 1.695133, 1.054141, 1, 1, 1, 1, 1,
1.643655, -0.3070969, 2.627075, 1, 1, 1, 1, 1,
1.645986, -0.6126159, 3.485726, 0, 0, 1, 1, 1,
1.696541, 1.546567, -0.4283007, 1, 0, 0, 1, 1,
1.699101, -0.6989062, 3.219807, 1, 0, 0, 1, 1,
1.703461, 1.309258, 1.114771, 1, 0, 0, 1, 1,
1.719859, -0.1126917, 0.2431508, 1, 0, 0, 1, 1,
1.730719, -0.3715446, 2.635792, 1, 0, 0, 1, 1,
1.743104, -0.2594966, 2.037449, 0, 0, 0, 1, 1,
1.754483, -0.4671766, 3.356373, 0, 0, 0, 1, 1,
1.755542, 0.5305156, 0.9411488, 0, 0, 0, 1, 1,
1.781836, 1.12048, 0.06058601, 0, 0, 0, 1, 1,
1.789736, 1.915118, 0.4512383, 0, 0, 0, 1, 1,
1.793376, 1.117899, 1.997613, 0, 0, 0, 1, 1,
1.79888, -1.004347, 2.132173, 0, 0, 0, 1, 1,
1.826938, 0.5153882, -0.03852192, 1, 1, 1, 1, 1,
1.829623, -0.1656787, 2.282854, 1, 1, 1, 1, 1,
1.830141, -1.13482, 2.020938, 1, 1, 1, 1, 1,
1.830423, -0.3911414, 3.059475, 1, 1, 1, 1, 1,
1.83996, 0.118121, 2.666037, 1, 1, 1, 1, 1,
1.843698, -0.4844822, 0.7209423, 1, 1, 1, 1, 1,
1.847533, 0.1336386, 2.9619, 1, 1, 1, 1, 1,
1.849073, 0.4829169, 2.088822, 1, 1, 1, 1, 1,
1.851255, -1.62209, 1.353335, 1, 1, 1, 1, 1,
1.86939, 0.1170009, 0.1476006, 1, 1, 1, 1, 1,
1.87068, 0.4601916, 1.641954, 1, 1, 1, 1, 1,
1.877352, 0.3385758, 0.6521395, 1, 1, 1, 1, 1,
1.877658, -0.2992234, 1.171304, 1, 1, 1, 1, 1,
1.887039, 1.366219, 0.2320711, 1, 1, 1, 1, 1,
1.891359, -0.03711556, 2.460641, 1, 1, 1, 1, 1,
1.897171, 2.352514, -0.5753552, 0, 0, 1, 1, 1,
1.92904, -1.725446, 2.198773, 1, 0, 0, 1, 1,
1.944331, 0.4338509, 0.5153723, 1, 0, 0, 1, 1,
1.984714, -2.11516, 1.557466, 1, 0, 0, 1, 1,
1.998649, 0.1074268, 0.3385142, 1, 0, 0, 1, 1,
2.0013, -2.222876, 1.747814, 1, 0, 0, 1, 1,
2.013872, 0.5554258, 1.571784, 0, 0, 0, 1, 1,
2.01741, 0.4302303, 1.829901, 0, 0, 0, 1, 1,
2.071478, -0.6500401, 2.74747, 0, 0, 0, 1, 1,
2.137483, -1.678566, 1.517283, 0, 0, 0, 1, 1,
2.138371, -0.4206396, 2.122124, 0, 0, 0, 1, 1,
2.165947, 0.6045523, 0.5346699, 0, 0, 0, 1, 1,
2.168901, -0.9546988, 2.017352, 0, 0, 0, 1, 1,
2.202596, 0.8632545, 2.702709, 1, 1, 1, 1, 1,
2.207346, -0.2814477, 1.519537, 1, 1, 1, 1, 1,
2.279224, -1.696104, 1.601904, 1, 1, 1, 1, 1,
2.36986, 0.6980441, 0.1169527, 1, 1, 1, 1, 1,
2.529946, 0.7828479, 0.4092795, 1, 1, 1, 1, 1,
2.609393, 1.132672, 1.546921, 1, 1, 1, 1, 1,
2.655089, 0.3401952, 1.604777, 1, 1, 1, 1, 1
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
var radius = 9.748856;
var distance = 34.24244;
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
mvMatrix.translate( 0.5122732, 0.2243655, 0.1454139 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.24244);
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
