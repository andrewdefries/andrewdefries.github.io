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
-3.358134, 0.4502283, -1.213902, 1, 0, 0, 1,
-2.959756, 0.1209419, -0.1162175, 1, 0.007843138, 0, 1,
-2.914559, 2.751718, 0.3685771, 1, 0.01176471, 0, 1,
-2.894588, 0.4061298, -1.740667, 1, 0.01960784, 0, 1,
-2.742186, -0.3501521, -4.029343, 1, 0.02352941, 0, 1,
-2.678247, 0.4656875, -1.112552, 1, 0.03137255, 0, 1,
-2.674369, 0.06370664, -1.938661, 1, 0.03529412, 0, 1,
-2.665446, 1.522517, 0.5865257, 1, 0.04313726, 0, 1,
-2.617282, 0.1164887, -3.147662, 1, 0.04705882, 0, 1,
-2.515997, 1.009997, -1.714083, 1, 0.05490196, 0, 1,
-2.496858, -1.605414, -1.722493, 1, 0.05882353, 0, 1,
-2.476564, -0.4312683, -0.6547883, 1, 0.06666667, 0, 1,
-2.377106, -0.769533, -3.512322, 1, 0.07058824, 0, 1,
-2.304016, 1.185898, -1.119465, 1, 0.07843138, 0, 1,
-2.301799, 0.6376684, -0.05302783, 1, 0.08235294, 0, 1,
-2.296907, -1.020591, -0.1206183, 1, 0.09019608, 0, 1,
-2.266883, 0.845997, -0.8533286, 1, 0.09411765, 0, 1,
-2.259402, -0.1929961, -0.6360832, 1, 0.1019608, 0, 1,
-2.255945, -0.3319765, -1.079404, 1, 0.1098039, 0, 1,
-2.25062, -0.8070728, -1.919107, 1, 0.1137255, 0, 1,
-2.22989, 0.7648449, -0.8181216, 1, 0.1215686, 0, 1,
-2.229281, -0.6896288, -0.6361913, 1, 0.1254902, 0, 1,
-2.217467, 1.378593, -2.040592, 1, 0.1333333, 0, 1,
-2.16898, 1.494992, -4.343379, 1, 0.1372549, 0, 1,
-2.161258, -0.1281053, -2.752498, 1, 0.145098, 0, 1,
-2.117635, -0.8768945, -4.014254, 1, 0.1490196, 0, 1,
-2.113008, -0.2570452, -0.1756668, 1, 0.1568628, 0, 1,
-2.076596, 0.05661846, -2.717878, 1, 0.1607843, 0, 1,
-2.076431, 0.9784051, -0.3123856, 1, 0.1686275, 0, 1,
-2.048191, -0.2344513, -2.684491, 1, 0.172549, 0, 1,
-2.009094, -0.2373673, -1.522308, 1, 0.1803922, 0, 1,
-2.000473, 0.005983435, -1.951647, 1, 0.1843137, 0, 1,
-1.998809, -0.7505291, -1.656178, 1, 0.1921569, 0, 1,
-1.985638, -0.2609278, -1.471961, 1, 0.1960784, 0, 1,
-1.980971, -0.6288457, -1.950974, 1, 0.2039216, 0, 1,
-1.951015, 0.4103242, -1.329743, 1, 0.2117647, 0, 1,
-1.935902, 1.190557, 0.2208326, 1, 0.2156863, 0, 1,
-1.928926, 0.05072794, -2.446156, 1, 0.2235294, 0, 1,
-1.915731, 0.2849595, -0.5519233, 1, 0.227451, 0, 1,
-1.911426, -2.495787, -2.809064, 1, 0.2352941, 0, 1,
-1.899301, 0.9087628, -0.7338545, 1, 0.2392157, 0, 1,
-1.897413, 0.2538058, 0.1728695, 1, 0.2470588, 0, 1,
-1.876223, 0.6832827, -1.786277, 1, 0.2509804, 0, 1,
-1.849236, -1.690475, -2.741121, 1, 0.2588235, 0, 1,
-1.845905, 0.7567264, 0.0505478, 1, 0.2627451, 0, 1,
-1.8421, 1.914595, -0.7784468, 1, 0.2705882, 0, 1,
-1.833158, -0.1919294, -1.881904, 1, 0.2745098, 0, 1,
-1.81131, 0.4052785, 0.2658805, 1, 0.282353, 0, 1,
-1.801122, 2.183408, -1.725723, 1, 0.2862745, 0, 1,
-1.797709, -0.8649334, -1.830585, 1, 0.2941177, 0, 1,
-1.790664, 0.8707982, -1.783802, 1, 0.3019608, 0, 1,
-1.771457, -0.01666972, -1.007067, 1, 0.3058824, 0, 1,
-1.755461, 0.7483799, 0.1591627, 1, 0.3137255, 0, 1,
-1.696065, 0.7921504, -0.6742813, 1, 0.3176471, 0, 1,
-1.684767, -0.4077741, -1.873256, 1, 0.3254902, 0, 1,
-1.656753, 0.3402376, -0.7804703, 1, 0.3294118, 0, 1,
-1.651877, 0.7962233, -0.2179739, 1, 0.3372549, 0, 1,
-1.63169, -0.04464068, -3.868387, 1, 0.3411765, 0, 1,
-1.631598, -1.595186, -1.070526, 1, 0.3490196, 0, 1,
-1.628858, -0.7297505, -2.578484, 1, 0.3529412, 0, 1,
-1.615653, 1.769341, -0.5676777, 1, 0.3607843, 0, 1,
-1.607163, -1.3065, -1.793109, 1, 0.3647059, 0, 1,
-1.605168, -0.7275017, -0.9594386, 1, 0.372549, 0, 1,
-1.591469, -2.016388, -2.31924, 1, 0.3764706, 0, 1,
-1.585524, 1.01416, -1.841462, 1, 0.3843137, 0, 1,
-1.580171, 0.4110428, 0.3349755, 1, 0.3882353, 0, 1,
-1.560166, 0.2495263, 1.103329, 1, 0.3960784, 0, 1,
-1.557632, 0.435186, -1.143826, 1, 0.4039216, 0, 1,
-1.555916, -0.6019858, -2.008527, 1, 0.4078431, 0, 1,
-1.553868, 1.773146, -1.222062, 1, 0.4156863, 0, 1,
-1.552841, 1.127392, 0.5469257, 1, 0.4196078, 0, 1,
-1.552781, -0.3429773, -3.157924, 1, 0.427451, 0, 1,
-1.547998, 0.6495647, -1.934039, 1, 0.4313726, 0, 1,
-1.547304, -0.5537181, -1.890765, 1, 0.4392157, 0, 1,
-1.537776, 0.4656149, -1.26203, 1, 0.4431373, 0, 1,
-1.536536, 1.694765, -1.860835, 1, 0.4509804, 0, 1,
-1.524723, -0.0255675, -3.091758, 1, 0.454902, 0, 1,
-1.513858, -0.698595, -2.911909, 1, 0.4627451, 0, 1,
-1.511058, -0.3167697, -2.175194, 1, 0.4666667, 0, 1,
-1.506364, 1.875546, 0.3466594, 1, 0.4745098, 0, 1,
-1.490756, 1.738926, -0.3835634, 1, 0.4784314, 0, 1,
-1.48457, -1.059279, -0.9266431, 1, 0.4862745, 0, 1,
-1.473478, 1.215043, -0.6220759, 1, 0.4901961, 0, 1,
-1.454746, -1.26346, -2.902158, 1, 0.4980392, 0, 1,
-1.450237, 0.1000771, -0.509451, 1, 0.5058824, 0, 1,
-1.445563, -1.704514, -3.872488, 1, 0.509804, 0, 1,
-1.432527, 1.405859, -1.035241, 1, 0.5176471, 0, 1,
-1.4282, -2.285597, -2.785675, 1, 0.5215687, 0, 1,
-1.423902, 0.4684293, -2.958486, 1, 0.5294118, 0, 1,
-1.421469, 0.5506535, -1.733786, 1, 0.5333334, 0, 1,
-1.415429, 0.6637338, -1.318696, 1, 0.5411765, 0, 1,
-1.409957, 0.4225901, -2.564454, 1, 0.5450981, 0, 1,
-1.397105, 0.553436, -0.6416026, 1, 0.5529412, 0, 1,
-1.396191, -0.8077058, -1.542815, 1, 0.5568628, 0, 1,
-1.391453, -0.7387136, -2.562121, 1, 0.5647059, 0, 1,
-1.384184, -0.260656, -2.408713, 1, 0.5686275, 0, 1,
-1.376418, -0.4849874, -1.665858, 1, 0.5764706, 0, 1,
-1.352479, -0.2331902, -0.8221119, 1, 0.5803922, 0, 1,
-1.343376, -0.551131, -3.010308, 1, 0.5882353, 0, 1,
-1.342598, -0.624871, -0.7157652, 1, 0.5921569, 0, 1,
-1.341074, 2.417529, -0.1039926, 1, 0.6, 0, 1,
-1.337501, -0.08143582, -1.443701, 1, 0.6078432, 0, 1,
-1.33406, 0.6961524, -1.03725, 1, 0.6117647, 0, 1,
-1.333854, 0.0884099, -1.215812, 1, 0.6196079, 0, 1,
-1.320685, -1.373298, -3.248861, 1, 0.6235294, 0, 1,
-1.311878, -0.1830377, -2.42547, 1, 0.6313726, 0, 1,
-1.302117, 0.9751422, 1.859273, 1, 0.6352941, 0, 1,
-1.297122, 0.5674202, -1.586014, 1, 0.6431373, 0, 1,
-1.293026, 1.707343, -0.2958989, 1, 0.6470588, 0, 1,
-1.288841, -0.298016, 0.4551365, 1, 0.654902, 0, 1,
-1.280847, -0.7088989, -1.839613, 1, 0.6588235, 0, 1,
-1.274954, 0.6708604, -1.068605, 1, 0.6666667, 0, 1,
-1.267151, -0.007516334, -2.998117, 1, 0.6705883, 0, 1,
-1.26637, 1.689156, 0.169981, 1, 0.6784314, 0, 1,
-1.265641, -0.9559633, -1.058407, 1, 0.682353, 0, 1,
-1.259096, 0.9006211, -1.207682, 1, 0.6901961, 0, 1,
-1.25847, -0.1212137, -0.3170402, 1, 0.6941177, 0, 1,
-1.253159, 0.9575839, -0.9277446, 1, 0.7019608, 0, 1,
-1.248214, -0.8654339, -1.802728, 1, 0.7098039, 0, 1,
-1.246285, 0.02748598, -1.346432, 1, 0.7137255, 0, 1,
-1.243231, 1.089011, 0.7656569, 1, 0.7215686, 0, 1,
-1.24208, -1.574387, -2.01379, 1, 0.7254902, 0, 1,
-1.241832, -1.300788, -2.487559, 1, 0.7333333, 0, 1,
-1.241065, -0.03078873, -2.322476, 1, 0.7372549, 0, 1,
-1.238656, -1.095347, -1.47132, 1, 0.7450981, 0, 1,
-1.237012, -0.08691075, -1.81923, 1, 0.7490196, 0, 1,
-1.231225, 0.7262243, -1.85751, 1, 0.7568628, 0, 1,
-1.227356, -1.125672, -1.026883, 1, 0.7607843, 0, 1,
-1.212595, 1.000969, -3.1205, 1, 0.7686275, 0, 1,
-1.192651, 2.421714, 1.540147, 1, 0.772549, 0, 1,
-1.186925, -2.676657, -1.340957, 1, 0.7803922, 0, 1,
-1.184713, 0.7743997, -0.8738965, 1, 0.7843137, 0, 1,
-1.181447, -0.627037, -2.301174, 1, 0.7921569, 0, 1,
-1.178535, -1.312905, -2.328421, 1, 0.7960784, 0, 1,
-1.152281, -0.355289, -1.444653, 1, 0.8039216, 0, 1,
-1.140535, -1.07761, -2.89166, 1, 0.8117647, 0, 1,
-1.138445, -0.8624582, -3.777695, 1, 0.8156863, 0, 1,
-1.134782, 0.534332, -2.11588, 1, 0.8235294, 0, 1,
-1.134659, 0.5357932, -2.49591, 1, 0.827451, 0, 1,
-1.131893, -1.296028, -1.561269, 1, 0.8352941, 0, 1,
-1.125368, 2.722837, -1.142438, 1, 0.8392157, 0, 1,
-1.12536, -0.1637398, -0.24345, 1, 0.8470588, 0, 1,
-1.112766, -1.45974, -2.360691, 1, 0.8509804, 0, 1,
-1.108091, -0.2815869, -0.8423458, 1, 0.8588235, 0, 1,
-1.106958, -0.9090239, -4.839672, 1, 0.8627451, 0, 1,
-1.106351, 0.6422743, 0.144058, 1, 0.8705882, 0, 1,
-1.099446, 0.3359614, -0.8567597, 1, 0.8745098, 0, 1,
-1.093179, 0.4084648, -1.747802, 1, 0.8823529, 0, 1,
-1.08944, -0.9575335, -0.02112482, 1, 0.8862745, 0, 1,
-1.088295, 1.024554, -1.074937, 1, 0.8941177, 0, 1,
-1.086994, 0.4603366, -1.157194, 1, 0.8980392, 0, 1,
-1.086848, -0.4139166, -2.591423, 1, 0.9058824, 0, 1,
-1.084469, 0.3792422, -0.17773, 1, 0.9137255, 0, 1,
-1.078594, -0.04341764, -0.9564158, 1, 0.9176471, 0, 1,
-1.050178, 0.06036417, -0.7706025, 1, 0.9254902, 0, 1,
-1.047895, 0.3638571, -2.678681, 1, 0.9294118, 0, 1,
-1.043245, 0.9079773, -0.5897753, 1, 0.9372549, 0, 1,
-1.036703, 0.2135649, -0.8649498, 1, 0.9411765, 0, 1,
-1.03639, -0.9363257, -0.8503498, 1, 0.9490196, 0, 1,
-1.035771, -2.33908, -3.119122, 1, 0.9529412, 0, 1,
-1.034629, -0.3808296, -3.120387, 1, 0.9607843, 0, 1,
-1.032268, 0.4100084, -2.230335, 1, 0.9647059, 0, 1,
-1.028098, -0.5966288, -1.027022, 1, 0.972549, 0, 1,
-1.010648, -0.983982, -1.226672, 1, 0.9764706, 0, 1,
-0.9997488, 1.423888, -0.923124, 1, 0.9843137, 0, 1,
-0.9916667, -0.2184691, -2.054306, 1, 0.9882353, 0, 1,
-0.9912465, 0.0008024464, -1.336653, 1, 0.9960784, 0, 1,
-0.987038, 1.04952, -0.01267015, 0.9960784, 1, 0, 1,
-0.9834028, 0.2343816, -1.87281, 0.9921569, 1, 0, 1,
-0.9762775, -1.308982, -2.110164, 0.9843137, 1, 0, 1,
-0.9739789, 1.555645, -0.9455186, 0.9803922, 1, 0, 1,
-0.9606562, 0.779727, -0.7047921, 0.972549, 1, 0, 1,
-0.9533817, -0.1171908, -1.245073, 0.9686275, 1, 0, 1,
-0.9358031, 1.87989, -1.984385, 0.9607843, 1, 0, 1,
-0.9346575, -0.6725476, -1.19183, 0.9568627, 1, 0, 1,
-0.9259553, 0.2727136, -0.8947141, 0.9490196, 1, 0, 1,
-0.9259216, 0.4367773, -1.946327, 0.945098, 1, 0, 1,
-0.9239031, 0.4823924, -1.434385, 0.9372549, 1, 0, 1,
-0.91533, 0.2527699, -2.268953, 0.9333333, 1, 0, 1,
-0.9149584, 0.671504, -0.7285837, 0.9254902, 1, 0, 1,
-0.9114322, -1.081506, -3.577312, 0.9215686, 1, 0, 1,
-0.9099314, -0.2252732, -3.257327, 0.9137255, 1, 0, 1,
-0.9089596, -0.8745656, -1.951405, 0.9098039, 1, 0, 1,
-0.9023747, 1.152955, -0.8159518, 0.9019608, 1, 0, 1,
-0.8987263, -1.295899, -2.314004, 0.8941177, 1, 0, 1,
-0.8958219, 0.6005158, -0.4540872, 0.8901961, 1, 0, 1,
-0.881556, -0.4308372, -1.581038, 0.8823529, 1, 0, 1,
-0.876068, -0.5613449, -2.192668, 0.8784314, 1, 0, 1,
-0.8750409, 0.6841583, -2.259474, 0.8705882, 1, 0, 1,
-0.8745096, -0.5809335, -1.748064, 0.8666667, 1, 0, 1,
-0.8639259, 0.8870507, 0.003464723, 0.8588235, 1, 0, 1,
-0.8598972, 0.3629115, -2.727006, 0.854902, 1, 0, 1,
-0.8584663, -1.812497, -2.538052, 0.8470588, 1, 0, 1,
-0.8506133, -0.7182578, -2.119949, 0.8431373, 1, 0, 1,
-0.8487907, -0.9175391, -1.10673, 0.8352941, 1, 0, 1,
-0.846152, -1.412582, -1.079895, 0.8313726, 1, 0, 1,
-0.8434781, 0.466361, -0.8727674, 0.8235294, 1, 0, 1,
-0.8390135, -1.162185, -2.270889, 0.8196079, 1, 0, 1,
-0.8366226, -0.2008112, -2.095268, 0.8117647, 1, 0, 1,
-0.8334866, 1.006446, 0.05044588, 0.8078431, 1, 0, 1,
-0.8205262, -0.8136529, -3.08394, 0.8, 1, 0, 1,
-0.8118768, 0.4880776, 0.0245085, 0.7921569, 1, 0, 1,
-0.8064662, -2.03868, -1.868958, 0.7882353, 1, 0, 1,
-0.8053058, -0.7005912, -2.918232, 0.7803922, 1, 0, 1,
-0.8048235, -0.6820612, -2.692139, 0.7764706, 1, 0, 1,
-0.8021073, -0.9076331, -3.583243, 0.7686275, 1, 0, 1,
-0.8017207, 0.8781583, 0.4772469, 0.7647059, 1, 0, 1,
-0.7975575, 0.2922447, -2.537564, 0.7568628, 1, 0, 1,
-0.7927986, 1.015658, -1.817549, 0.7529412, 1, 0, 1,
-0.7908483, 1.780209, -1.846266, 0.7450981, 1, 0, 1,
-0.7900629, -0.8157831, -2.649301, 0.7411765, 1, 0, 1,
-0.7877786, 0.2691953, -1.284654, 0.7333333, 1, 0, 1,
-0.7745943, 0.9571439, -1.335697, 0.7294118, 1, 0, 1,
-0.7732439, -0.2610697, -1.320339, 0.7215686, 1, 0, 1,
-0.7691469, -0.3556265, -2.810077, 0.7176471, 1, 0, 1,
-0.7684256, 0.02184255, -1.814627, 0.7098039, 1, 0, 1,
-0.7612098, 0.4669079, -1.03923, 0.7058824, 1, 0, 1,
-0.760244, 0.74353, -0.5757156, 0.6980392, 1, 0, 1,
-0.7598301, 0.1475002, -2.086426, 0.6901961, 1, 0, 1,
-0.7530372, -0.6384348, -1.982028, 0.6862745, 1, 0, 1,
-0.7524281, 0.5436773, -1.380999, 0.6784314, 1, 0, 1,
-0.7485417, -0.7342146, -2.858122, 0.6745098, 1, 0, 1,
-0.7484587, 1.320151, -1.42556, 0.6666667, 1, 0, 1,
-0.7441357, -1.251627, -0.2780033, 0.6627451, 1, 0, 1,
-0.7363408, -1.986784, -2.73777, 0.654902, 1, 0, 1,
-0.7321039, -0.0100298, -1.727617, 0.6509804, 1, 0, 1,
-0.7295272, 1.61674, -0.7251501, 0.6431373, 1, 0, 1,
-0.7284196, 0.8530412, -0.8685468, 0.6392157, 1, 0, 1,
-0.7260414, 1.377351, -1.039523, 0.6313726, 1, 0, 1,
-0.7194257, 0.5506245, -0.3002201, 0.627451, 1, 0, 1,
-0.6966666, -1.326209, -1.766535, 0.6196079, 1, 0, 1,
-0.6869524, 0.1582534, -1.348183, 0.6156863, 1, 0, 1,
-0.6865395, 1.72539, 0.9267063, 0.6078432, 1, 0, 1,
-0.6854346, -0.6586821, -1.625854, 0.6039216, 1, 0, 1,
-0.6852546, 0.825152, -1.029798, 0.5960785, 1, 0, 1,
-0.6799207, 1.143381, 0.3426854, 0.5882353, 1, 0, 1,
-0.678728, 0.6796828, 0.1527726, 0.5843138, 1, 0, 1,
-0.6761565, 1.303707, -0.6645479, 0.5764706, 1, 0, 1,
-0.670948, 1.585995, -0.4695902, 0.572549, 1, 0, 1,
-0.6620572, 0.02823855, -2.917435, 0.5647059, 1, 0, 1,
-0.6620247, -2.116824, -2.312487, 0.5607843, 1, 0, 1,
-0.6606437, -1.838651, -3.378893, 0.5529412, 1, 0, 1,
-0.658361, 1.398969, -1.891357, 0.5490196, 1, 0, 1,
-0.6576889, 0.2315523, -1.42875, 0.5411765, 1, 0, 1,
-0.6489131, -0.2558169, -1.578016, 0.5372549, 1, 0, 1,
-0.6455104, 0.5265819, -0.4175242, 0.5294118, 1, 0, 1,
-0.6442434, 0.8179582, 0.0311923, 0.5254902, 1, 0, 1,
-0.6392877, -0.4902363, -0.1595891, 0.5176471, 1, 0, 1,
-0.631179, -0.3916378, -2.109319, 0.5137255, 1, 0, 1,
-0.6208177, 1.037177, -1.250364, 0.5058824, 1, 0, 1,
-0.6153873, -0.957078, -3.352108, 0.5019608, 1, 0, 1,
-0.6121423, 0.391118, -1.171226, 0.4941176, 1, 0, 1,
-0.6087973, 0.536895, -1.387179, 0.4862745, 1, 0, 1,
-0.6074234, -0.4447751, -2.160098, 0.4823529, 1, 0, 1,
-0.6040115, -0.86751, -3.186538, 0.4745098, 1, 0, 1,
-0.5960414, -0.7244548, -1.257078, 0.4705882, 1, 0, 1,
-0.5887258, -0.5822029, -1.689675, 0.4627451, 1, 0, 1,
-0.5869214, -0.6774511, -1.960348, 0.4588235, 1, 0, 1,
-0.5867809, -0.00558411, -0.9432173, 0.4509804, 1, 0, 1,
-0.5843756, -0.5952233, -3.416721, 0.4470588, 1, 0, 1,
-0.5828218, -0.2435106, -0.5838183, 0.4392157, 1, 0, 1,
-0.581549, -1.358127, -1.051983, 0.4352941, 1, 0, 1,
-0.5760759, -0.8797159, -1.361261, 0.427451, 1, 0, 1,
-0.5750864, 0.3534235, -1.556099, 0.4235294, 1, 0, 1,
-0.5739409, 0.8974729, -0.2793162, 0.4156863, 1, 0, 1,
-0.5680348, 1.763805, -0.01042058, 0.4117647, 1, 0, 1,
-0.5578166, -0.6174396, -3.65135, 0.4039216, 1, 0, 1,
-0.5487008, 0.2586385, -2.543816, 0.3960784, 1, 0, 1,
-0.5484222, -0.5991434, -2.851435, 0.3921569, 1, 0, 1,
-0.5463394, -0.9507415, -4.846443, 0.3843137, 1, 0, 1,
-0.5451853, -0.1501274, -1.012022, 0.3803922, 1, 0, 1,
-0.5423597, 0.05534912, -2.336651, 0.372549, 1, 0, 1,
-0.5331455, -0.4514566, -2.053355, 0.3686275, 1, 0, 1,
-0.5287164, -0.6726137, -3.161214, 0.3607843, 1, 0, 1,
-0.5253715, 0.7158068, 0.4455654, 0.3568628, 1, 0, 1,
-0.5252135, 0.3423032, -0.9395632, 0.3490196, 1, 0, 1,
-0.5234939, -1.668143, -3.088365, 0.345098, 1, 0, 1,
-0.5215691, 0.6571544, -0.06364062, 0.3372549, 1, 0, 1,
-0.5092503, -0.1058447, 0.2583449, 0.3333333, 1, 0, 1,
-0.5081161, 0.4453908, -1.511147, 0.3254902, 1, 0, 1,
-0.5075141, -1.888704, -1.782732, 0.3215686, 1, 0, 1,
-0.503935, -1.350848, -1.225982, 0.3137255, 1, 0, 1,
-0.503779, 0.1377656, -0.9274459, 0.3098039, 1, 0, 1,
-0.5032101, -0.3066331, -2.051436, 0.3019608, 1, 0, 1,
-0.5016113, -0.5724953, -1.312967, 0.2941177, 1, 0, 1,
-0.494226, 0.3198476, -2.551364, 0.2901961, 1, 0, 1,
-0.4891755, -1.556831, -3.10863, 0.282353, 1, 0, 1,
-0.4865532, -1.767861, -4.083038, 0.2784314, 1, 0, 1,
-0.4845427, -0.5580516, -2.430683, 0.2705882, 1, 0, 1,
-0.4818747, -0.683197, -1.10534, 0.2666667, 1, 0, 1,
-0.4801072, 0.6408899, -2.049838, 0.2588235, 1, 0, 1,
-0.4751509, -0.6977195, -2.345704, 0.254902, 1, 0, 1,
-0.4697425, 0.8010309, -1.534839, 0.2470588, 1, 0, 1,
-0.4681495, -0.638017, -2.581396, 0.2431373, 1, 0, 1,
-0.4680848, -1.449584, -1.383616, 0.2352941, 1, 0, 1,
-0.4644036, 2.227998, -1.028722, 0.2313726, 1, 0, 1,
-0.4592772, -0.7666847, -2.117372, 0.2235294, 1, 0, 1,
-0.457009, -0.5965951, -2.184043, 0.2196078, 1, 0, 1,
-0.4540809, -0.470139, -2.683624, 0.2117647, 1, 0, 1,
-0.4538106, 1.906636, -1.189048, 0.2078431, 1, 0, 1,
-0.4510727, 0.8530923, -0.2916808, 0.2, 1, 0, 1,
-0.4462216, -1.613653, -2.96793, 0.1921569, 1, 0, 1,
-0.4460962, 0.3564586, -2.080437, 0.1882353, 1, 0, 1,
-0.4450339, -0.6827961, -2.051154, 0.1803922, 1, 0, 1,
-0.4436235, 0.394848, 0.0850556, 0.1764706, 1, 0, 1,
-0.4433043, -0.6973869, -4.19971, 0.1686275, 1, 0, 1,
-0.4395621, -0.2476843, -2.047238, 0.1647059, 1, 0, 1,
-0.4360639, 0.01568359, 0.2523837, 0.1568628, 1, 0, 1,
-0.4354576, 0.3363491, -0.4660931, 0.1529412, 1, 0, 1,
-0.4319286, 1.409836, -0.552081, 0.145098, 1, 0, 1,
-0.4311233, 0.6363856, -0.04163861, 0.1411765, 1, 0, 1,
-0.4280085, 0.2835191, -1.414364, 0.1333333, 1, 0, 1,
-0.4259723, 0.402654, 0.03799781, 0.1294118, 1, 0, 1,
-0.4220867, -0.2492815, -1.762412, 0.1215686, 1, 0, 1,
-0.4165567, 2.137617, -0.9286963, 0.1176471, 1, 0, 1,
-0.4129849, 0.03499683, -0.8683609, 0.1098039, 1, 0, 1,
-0.4117867, 1.018829, -0.08606452, 0.1058824, 1, 0, 1,
-0.4093749, 0.7356329, -0.68625, 0.09803922, 1, 0, 1,
-0.4086664, -0.4061382, -2.763716, 0.09019608, 1, 0, 1,
-0.4020428, 0.4554202, 0.5342163, 0.08627451, 1, 0, 1,
-0.3980036, 0.7915836, -0.4091974, 0.07843138, 1, 0, 1,
-0.3841867, -1.008779, -2.002499, 0.07450981, 1, 0, 1,
-0.37762, -0.2590592, -1.535473, 0.06666667, 1, 0, 1,
-0.3762412, -0.6764622, -2.858227, 0.0627451, 1, 0, 1,
-0.3671913, 0.392142, 1.077306, 0.05490196, 1, 0, 1,
-0.3669662, -0.147535, -2.50482, 0.05098039, 1, 0, 1,
-0.365312, -1.326808, -1.699841, 0.04313726, 1, 0, 1,
-0.3640455, 0.4248064, -0.3823361, 0.03921569, 1, 0, 1,
-0.3624111, -0.233817, -2.955596, 0.03137255, 1, 0, 1,
-0.3593718, 1.246223, 0.9343746, 0.02745098, 1, 0, 1,
-0.3575409, 0.7767343, -1.110835, 0.01960784, 1, 0, 1,
-0.3574177, 1.464154, -0.9724631, 0.01568628, 1, 0, 1,
-0.3539581, -0.09758306, -2.254687, 0.007843138, 1, 0, 1,
-0.3510769, -1.239501, -3.928298, 0.003921569, 1, 0, 1,
-0.3464344, 2.764738, -0.3573743, 0, 1, 0.003921569, 1,
-0.3452421, -0.7355249, -3.736194, 0, 1, 0.01176471, 1,
-0.3391958, -0.224363, -0.6380906, 0, 1, 0.01568628, 1,
-0.3344944, -0.5362267, -0.7557515, 0, 1, 0.02352941, 1,
-0.3334618, 0.2465174, -0.4757086, 0, 1, 0.02745098, 1,
-0.3273312, -0.3667171, -2.097952, 0, 1, 0.03529412, 1,
-0.3272724, -0.916253, -2.31433, 0, 1, 0.03921569, 1,
-0.3262385, 0.6706296, -1.476226, 0, 1, 0.04705882, 1,
-0.3254372, -1.20813, -2.436621, 0, 1, 0.05098039, 1,
-0.3231939, 1.696089, 1.913043, 0, 1, 0.05882353, 1,
-0.3166383, -0.3244668, -1.2096, 0, 1, 0.0627451, 1,
-0.3146055, -0.07856911, -3.008027, 0, 1, 0.07058824, 1,
-0.3139217, -1.968555, -4.311362, 0, 1, 0.07450981, 1,
-0.308059, -0.02620889, -0.1879374, 0, 1, 0.08235294, 1,
-0.3054992, -0.3872003, -3.793745, 0, 1, 0.08627451, 1,
-0.3053896, 0.7893938, 0.1942152, 0, 1, 0.09411765, 1,
-0.3033626, -0.2560117, -3.358191, 0, 1, 0.1019608, 1,
-0.3031981, -0.6890598, -2.495846, 0, 1, 0.1058824, 1,
-0.3018901, 0.2430275, -0.2486343, 0, 1, 0.1137255, 1,
-0.2996275, -0.380531, -2.705473, 0, 1, 0.1176471, 1,
-0.2946788, -0.3155695, -2.943353, 0, 1, 0.1254902, 1,
-0.2894562, 0.3517971, -0.3153022, 0, 1, 0.1294118, 1,
-0.2888913, 0.9880842, 0.1859759, 0, 1, 0.1372549, 1,
-0.2817425, -0.2940001, -1.259541, 0, 1, 0.1411765, 1,
-0.278174, 0.04435017, -0.3426878, 0, 1, 0.1490196, 1,
-0.2711338, -0.8545908, -2.938744, 0, 1, 0.1529412, 1,
-0.2684311, 1.211941, 1.247449, 0, 1, 0.1607843, 1,
-0.2684162, 0.6217417, 0.2933118, 0, 1, 0.1647059, 1,
-0.2678218, 0.6902994, -0.04972223, 0, 1, 0.172549, 1,
-0.2653652, -1.000662, -3.088633, 0, 1, 0.1764706, 1,
-0.2652244, -0.8534502, -3.282632, 0, 1, 0.1843137, 1,
-0.2642066, 1.417309, 0.873884, 0, 1, 0.1882353, 1,
-0.2607441, -0.44515, -3.750362, 0, 1, 0.1960784, 1,
-0.2459019, -1.137381, -1.503345, 0, 1, 0.2039216, 1,
-0.2431597, 2.500829, -0.06241185, 0, 1, 0.2078431, 1,
-0.2424771, 0.01783882, -1.637374, 0, 1, 0.2156863, 1,
-0.2390445, 0.4434536, -0.1803554, 0, 1, 0.2196078, 1,
-0.2390009, -0.3560376, -3.368644, 0, 1, 0.227451, 1,
-0.2378829, -0.1457242, -2.610712, 0, 1, 0.2313726, 1,
-0.2342805, 0.5885644, -0.1703633, 0, 1, 0.2392157, 1,
-0.2340764, -0.9696139, -3.949768, 0, 1, 0.2431373, 1,
-0.2318503, -0.289077, -1.769502, 0, 1, 0.2509804, 1,
-0.2304936, -0.3209648, -1.636974, 0, 1, 0.254902, 1,
-0.2295154, -0.9439486, -2.019947, 0, 1, 0.2627451, 1,
-0.2210746, 1.670863, -0.02033482, 0, 1, 0.2666667, 1,
-0.2200699, -0.9527915, -3.506734, 0, 1, 0.2745098, 1,
-0.2174212, 0.1149953, 0.1646427, 0, 1, 0.2784314, 1,
-0.2145162, -1.581352, -2.714035, 0, 1, 0.2862745, 1,
-0.2106684, -0.3756262, -1.170147, 0, 1, 0.2901961, 1,
-0.2084463, -0.7764319, -1.631499, 0, 1, 0.2980392, 1,
-0.206878, 0.1872199, -0.1704287, 0, 1, 0.3058824, 1,
-0.2053307, 0.7369639, 0.1044181, 0, 1, 0.3098039, 1,
-0.2051064, 0.2910023, 0.3469201, 0, 1, 0.3176471, 1,
-0.2042068, -1.268323, -2.424091, 0, 1, 0.3215686, 1,
-0.2026131, -0.1137872, -1.438603, 0, 1, 0.3294118, 1,
-0.1978209, -0.143626, -2.470587, 0, 1, 0.3333333, 1,
-0.1915796, -1.005034, -2.798694, 0, 1, 0.3411765, 1,
-0.1856167, -1.254558, -3.23459, 0, 1, 0.345098, 1,
-0.1855261, -0.6502024, -2.277993, 0, 1, 0.3529412, 1,
-0.1853921, 0.878862, -0.2063333, 0, 1, 0.3568628, 1,
-0.174413, 0.278192, -2.163481, 0, 1, 0.3647059, 1,
-0.1730244, 0.06570526, -0.09071511, 0, 1, 0.3686275, 1,
-0.1662181, -0.7047288, -2.587773, 0, 1, 0.3764706, 1,
-0.165885, 0.3509554, -1.106487, 0, 1, 0.3803922, 1,
-0.1567958, -0.6895791, -3.872325, 0, 1, 0.3882353, 1,
-0.1567662, 0.6586607, 0.8622515, 0, 1, 0.3921569, 1,
-0.1567658, -0.756282, -1.624816, 0, 1, 0.4, 1,
-0.1543577, -0.01922924, -0.2272643, 0, 1, 0.4078431, 1,
-0.1522411, 0.9626663, -0.2339537, 0, 1, 0.4117647, 1,
-0.1505098, 0.1973386, -0.8487923, 0, 1, 0.4196078, 1,
-0.1460066, 0.4295315, -1.346727, 0, 1, 0.4235294, 1,
-0.1439444, 0.1621536, -0.5662075, 0, 1, 0.4313726, 1,
-0.1428436, -0.8359917, -4.168068, 0, 1, 0.4352941, 1,
-0.1348902, -1.827433, -2.305245, 0, 1, 0.4431373, 1,
-0.1336087, -0.1328884, -1.818798, 0, 1, 0.4470588, 1,
-0.133345, 0.7591916, -0.685709, 0, 1, 0.454902, 1,
-0.133215, 0.6132693, 1.074066, 0, 1, 0.4588235, 1,
-0.1254413, 1.246021, -0.05478034, 0, 1, 0.4666667, 1,
-0.125044, -0.8183969, -3.283306, 0, 1, 0.4705882, 1,
-0.1210793, -1.159383, -2.377687, 0, 1, 0.4784314, 1,
-0.1152578, 0.1133347, -1.366814, 0, 1, 0.4823529, 1,
-0.1150486, 1.561806, 0.4255078, 0, 1, 0.4901961, 1,
-0.1128065, 0.8940545, -1.217388, 0, 1, 0.4941176, 1,
-0.106944, 1.569753, 1.51709, 0, 1, 0.5019608, 1,
-0.1062947, -0.2376281, -2.83793, 0, 1, 0.509804, 1,
-0.1005338, -1.944812, -3.591796, 0, 1, 0.5137255, 1,
-0.09871042, -0.7195974, -2.252309, 0, 1, 0.5215687, 1,
-0.09750364, -0.5161254, -2.493706, 0, 1, 0.5254902, 1,
-0.09576888, -0.9520171, -3.710577, 0, 1, 0.5333334, 1,
-0.09416003, -1.87478, -2.182781, 0, 1, 0.5372549, 1,
-0.09240768, -0.2838591, -2.191351, 0, 1, 0.5450981, 1,
-0.09208441, 1.997683, 0.4777346, 0, 1, 0.5490196, 1,
-0.09175188, 0.5682532, -0.7857708, 0, 1, 0.5568628, 1,
-0.09097122, 0.3301073, -0.7986915, 0, 1, 0.5607843, 1,
-0.08226284, 1.13451, -0.4125865, 0, 1, 0.5686275, 1,
-0.08042628, 0.6236969, -0.9212806, 0, 1, 0.572549, 1,
-0.08028198, -1.729487, -1.820584, 0, 1, 0.5803922, 1,
-0.07533726, -0.4132575, -3.803214, 0, 1, 0.5843138, 1,
-0.07519063, 1.249193, -0.2380221, 0, 1, 0.5921569, 1,
-0.07212756, -0.3303823, -2.654934, 0, 1, 0.5960785, 1,
-0.0714236, 0.4905726, 0.1187537, 0, 1, 0.6039216, 1,
-0.06823359, 0.479212, -0.199642, 0, 1, 0.6117647, 1,
-0.06817074, -0.1754339, -2.04548, 0, 1, 0.6156863, 1,
-0.06588323, 1.011002, 0.5139735, 0, 1, 0.6235294, 1,
-0.06475431, -0.5046895, -3.924173, 0, 1, 0.627451, 1,
-0.06245306, -0.1844737, -4.502508, 0, 1, 0.6352941, 1,
-0.06191574, -0.8869401, -1.575197, 0, 1, 0.6392157, 1,
-0.06046486, -1.000204, -2.487573, 0, 1, 0.6470588, 1,
-0.05993434, -1.590627, -3.82069, 0, 1, 0.6509804, 1,
-0.05920469, 0.3744561, 1.225713, 0, 1, 0.6588235, 1,
-0.05780555, -0.02640313, -2.281316, 0, 1, 0.6627451, 1,
-0.05689336, 0.8556573, 0.09071728, 0, 1, 0.6705883, 1,
-0.05501546, 1.30578, 0.5290976, 0, 1, 0.6745098, 1,
-0.05453917, -1.066985, -4.302679, 0, 1, 0.682353, 1,
-0.05446739, -0.3609315, -2.265952, 0, 1, 0.6862745, 1,
-0.04811313, -1.171221, -3.376044, 0, 1, 0.6941177, 1,
-0.04562804, -2.194716, -3.139964, 0, 1, 0.7019608, 1,
-0.04441218, -0.8185307, -2.875756, 0, 1, 0.7058824, 1,
-0.04206177, -1.432756, -3.6104, 0, 1, 0.7137255, 1,
-0.03944128, 0.9058079, -0.6485804, 0, 1, 0.7176471, 1,
-0.03551175, 0.2981344, -1.517287, 0, 1, 0.7254902, 1,
-0.03049429, 0.3331068, -0.310182, 0, 1, 0.7294118, 1,
-0.02952533, 0.8205737, -0.514473, 0, 1, 0.7372549, 1,
-0.02754621, -0.1332086, -3.17084, 0, 1, 0.7411765, 1,
-0.02632664, -0.4478734, -3.557645, 0, 1, 0.7490196, 1,
-0.02377254, -0.6478519, -1.916711, 0, 1, 0.7529412, 1,
-0.02223457, 0.3699743, -0.8660547, 0, 1, 0.7607843, 1,
-0.02215731, 0.4041208, 0.9588971, 0, 1, 0.7647059, 1,
-0.01861626, -0.7593234, -2.15574, 0, 1, 0.772549, 1,
-0.0150192, 0.4692262, -0.4868695, 0, 1, 0.7764706, 1,
-0.01447434, 1.120924, 1.05988, 0, 1, 0.7843137, 1,
-0.01312875, -0.8972864, -2.518346, 0, 1, 0.7882353, 1,
-0.01277352, 0.1622476, 0.3819088, 0, 1, 0.7960784, 1,
-0.005085237, -0.6276748, -2.884982, 0, 1, 0.8039216, 1,
-0.00309411, 0.1880411, 0.1708471, 0, 1, 0.8078431, 1,
-0.0005547188, 0.1243796, -2.313278, 0, 1, 0.8156863, 1,
0.007112199, 1.140005, -0.7734436, 0, 1, 0.8196079, 1,
0.01232885, 2.035807, 0.2007724, 0, 1, 0.827451, 1,
0.01311139, -0.2364586, 3.333069, 0, 1, 0.8313726, 1,
0.01357462, 0.6290265, -0.1004022, 0, 1, 0.8392157, 1,
0.0159522, -0.6328942, 1.813475, 0, 1, 0.8431373, 1,
0.01609251, 1.855355, 0.01550783, 0, 1, 0.8509804, 1,
0.01841804, 1.07202, 0.7799692, 0, 1, 0.854902, 1,
0.01929357, -0.2939635, 2.780994, 0, 1, 0.8627451, 1,
0.02085072, -0.415283, 3.088074, 0, 1, 0.8666667, 1,
0.02339987, 0.904258, 0.1556769, 0, 1, 0.8745098, 1,
0.0262447, -1.817648, 1.925793, 0, 1, 0.8784314, 1,
0.03163892, 1.129603, 1.049798, 0, 1, 0.8862745, 1,
0.04306464, -1.675184, 3.05205, 0, 1, 0.8901961, 1,
0.04624046, -2.024742, 2.065728, 0, 1, 0.8980392, 1,
0.04905811, -1.182539, 3.3436, 0, 1, 0.9058824, 1,
0.05107938, 1.266666, -1.660874, 0, 1, 0.9098039, 1,
0.0525062, 1.490667, 2.250577, 0, 1, 0.9176471, 1,
0.05425856, -1.553518, 4.894191, 0, 1, 0.9215686, 1,
0.05432591, 1.333378, 1.075346, 0, 1, 0.9294118, 1,
0.05637069, 0.2472394, -0.6115248, 0, 1, 0.9333333, 1,
0.05749408, -1.709287, 2.711792, 0, 1, 0.9411765, 1,
0.06627819, 0.3231688, -0.3747503, 0, 1, 0.945098, 1,
0.06996233, 0.01643023, -0.07052767, 0, 1, 0.9529412, 1,
0.07190334, -0.02946746, 2.774378, 0, 1, 0.9568627, 1,
0.07345904, 0.217868, 0.1795228, 0, 1, 0.9647059, 1,
0.07576195, -0.5532653, 2.647395, 0, 1, 0.9686275, 1,
0.07676718, -0.0291583, 1.66598, 0, 1, 0.9764706, 1,
0.08012136, -0.1299566, 3.47189, 0, 1, 0.9803922, 1,
0.08032802, -0.3583785, 4.071877, 0, 1, 0.9882353, 1,
0.08270253, -0.4865832, 3.225435, 0, 1, 0.9921569, 1,
0.08324219, 0.7734395, 0.3672234, 0, 1, 1, 1,
0.08712115, 0.2480247, 1.363167, 0, 0.9921569, 1, 1,
0.0886035, -0.3381029, 3.503415, 0, 0.9882353, 1, 1,
0.09146471, 0.7102959, 0.003687477, 0, 0.9803922, 1, 1,
0.09379296, 0.6507283, -1.016811, 0, 0.9764706, 1, 1,
0.101426, 0.8116249, 1.71112, 0, 0.9686275, 1, 1,
0.1044054, -0.2600132, 3.206584, 0, 0.9647059, 1, 1,
0.107534, -0.4512902, 2.052847, 0, 0.9568627, 1, 1,
0.1082901, -0.4858572, 1.91488, 0, 0.9529412, 1, 1,
0.1154586, -0.3038751, 3.86524, 0, 0.945098, 1, 1,
0.1189947, -1.874793, 1.606298, 0, 0.9411765, 1, 1,
0.1205807, 0.102453, 0.3873465, 0, 0.9333333, 1, 1,
0.1237423, 0.9211179, 0.2187716, 0, 0.9294118, 1, 1,
0.1260387, 1.45818, -0.599233, 0, 0.9215686, 1, 1,
0.1268173, -1.145201, 2.813733, 0, 0.9176471, 1, 1,
0.1330974, -0.8385662, 3.563025, 0, 0.9098039, 1, 1,
0.1337981, 0.9764106, 1.050308, 0, 0.9058824, 1, 1,
0.1345726, 0.4339822, 0.2396455, 0, 0.8980392, 1, 1,
0.1349823, -0.4180092, 2.265446, 0, 0.8901961, 1, 1,
0.1363441, 0.227077, -0.1324186, 0, 0.8862745, 1, 1,
0.1387757, -0.3281368, 1.999846, 0, 0.8784314, 1, 1,
0.1389385, 0.3484436, -1.356161, 0, 0.8745098, 1, 1,
0.1466681, 1.6913, 1.454973, 0, 0.8666667, 1, 1,
0.1470128, -0.5215712, 2.701818, 0, 0.8627451, 1, 1,
0.1492462, -1.155524, 4.27662, 0, 0.854902, 1, 1,
0.1513101, -0.3214544, 1.937372, 0, 0.8509804, 1, 1,
0.1519159, -0.2483018, 3.083877, 0, 0.8431373, 1, 1,
0.1532399, -0.4086209, 4.163077, 0, 0.8392157, 1, 1,
0.154418, -0.5580313, 2.396052, 0, 0.8313726, 1, 1,
0.1592144, -1.176076, 3.337647, 0, 0.827451, 1, 1,
0.1620719, 0.1079326, -0.1408888, 0, 0.8196079, 1, 1,
0.1626814, 0.2245174, 0.817291, 0, 0.8156863, 1, 1,
0.163522, -0.7661895, 2.440263, 0, 0.8078431, 1, 1,
0.1709648, 1.520913, 0.9598319, 0, 0.8039216, 1, 1,
0.174711, -1.378658, 4.426259, 0, 0.7960784, 1, 1,
0.1754786, 1.135127, -1.060673, 0, 0.7882353, 1, 1,
0.1762868, -0.5095757, 3.139671, 0, 0.7843137, 1, 1,
0.1778332, 0.615459, -0.9098857, 0, 0.7764706, 1, 1,
0.1795288, -1.066564, 3.412907, 0, 0.772549, 1, 1,
0.1823575, -0.2532921, 2.110674, 0, 0.7647059, 1, 1,
0.1949326, -0.3365521, 2.929433, 0, 0.7607843, 1, 1,
0.1970737, 0.5521166, 0.5198988, 0, 0.7529412, 1, 1,
0.2001074, 0.7102078, -0.4526614, 0, 0.7490196, 1, 1,
0.2050424, 1.25059, -0.3761258, 0, 0.7411765, 1, 1,
0.2127152, -0.3762423, 0.6417304, 0, 0.7372549, 1, 1,
0.2131173, 0.4421693, -0.9121113, 0, 0.7294118, 1, 1,
0.2136162, -0.2685342, 3.578481, 0, 0.7254902, 1, 1,
0.2165787, -0.634197, 2.350266, 0, 0.7176471, 1, 1,
0.2197975, 1.074779, -0.5259361, 0, 0.7137255, 1, 1,
0.2203949, -0.5688822, 1.606491, 0, 0.7058824, 1, 1,
0.227355, 0.2824786, 0.8031077, 0, 0.6980392, 1, 1,
0.2338148, -0.354743, 1.473622, 0, 0.6941177, 1, 1,
0.2348922, -0.3757696, 1.997595, 0, 0.6862745, 1, 1,
0.2349773, 1.30756, 0.2894022, 0, 0.682353, 1, 1,
0.2510685, -0.9553151, 4.644825, 0, 0.6745098, 1, 1,
0.2546319, -1.059774, 3.615739, 0, 0.6705883, 1, 1,
0.2567949, -0.7513389, 3.188822, 0, 0.6627451, 1, 1,
0.2605967, 0.5031558, 1.142717, 0, 0.6588235, 1, 1,
0.26134, 0.5372369, 0.1064829, 0, 0.6509804, 1, 1,
0.2628838, -1.288507, 3.274341, 0, 0.6470588, 1, 1,
0.2640207, -0.3764244, 2.285472, 0, 0.6392157, 1, 1,
0.2642063, 1.069211, -0.1686128, 0, 0.6352941, 1, 1,
0.2673689, -0.609548, 2.544262, 0, 0.627451, 1, 1,
0.2682141, -0.1128235, 0.3184758, 0, 0.6235294, 1, 1,
0.2770706, -0.3893241, 2.356094, 0, 0.6156863, 1, 1,
0.2781417, -2.077607, 1.640242, 0, 0.6117647, 1, 1,
0.2791473, 0.02548733, 2.719891, 0, 0.6039216, 1, 1,
0.2813319, 0.4082951, 0.03281218, 0, 0.5960785, 1, 1,
0.2830118, 0.1468996, -0.1797146, 0, 0.5921569, 1, 1,
0.2851843, 0.204238, -0.1439373, 0, 0.5843138, 1, 1,
0.2855793, -2.06327, 3.090285, 0, 0.5803922, 1, 1,
0.2885673, -0.7620244, 3.20572, 0, 0.572549, 1, 1,
0.2933228, -0.5069215, 2.423499, 0, 0.5686275, 1, 1,
0.2949941, 1.405243, 1.421381, 0, 0.5607843, 1, 1,
0.2956538, -0.1038127, 1.48602, 0, 0.5568628, 1, 1,
0.2959037, 0.1462908, 0.7096815, 0, 0.5490196, 1, 1,
0.3004468, -0.9464775, 3.921294, 0, 0.5450981, 1, 1,
0.3030338, 0.1725272, 0.1086314, 0, 0.5372549, 1, 1,
0.3047729, -0.7821953, 1.523564, 0, 0.5333334, 1, 1,
0.3114122, 0.01787987, -0.01046462, 0, 0.5254902, 1, 1,
0.3128254, 1.041237, -0.3381107, 0, 0.5215687, 1, 1,
0.3146993, 0.2215791, 0.7393263, 0, 0.5137255, 1, 1,
0.3157839, -0.05121984, 2.819418, 0, 0.509804, 1, 1,
0.3169034, -0.9852989, 3.021166, 0, 0.5019608, 1, 1,
0.3239849, 0.3182081, 1.085333, 0, 0.4941176, 1, 1,
0.3242541, -0.0401465, 4.650968, 0, 0.4901961, 1, 1,
0.3272551, -1.587609, 2.999178, 0, 0.4823529, 1, 1,
0.3284968, 0.7044558, 2.621485, 0, 0.4784314, 1, 1,
0.3303011, 0.01886691, 1.868975, 0, 0.4705882, 1, 1,
0.3337449, 1.529517, -2.906967, 0, 0.4666667, 1, 1,
0.3352988, -2.162271, 3.561788, 0, 0.4588235, 1, 1,
0.3359899, -0.6396315, 3.443874, 0, 0.454902, 1, 1,
0.3392834, 0.946793, -1.756366, 0, 0.4470588, 1, 1,
0.3404892, 0.2563285, 0.1411833, 0, 0.4431373, 1, 1,
0.3429508, -1.025578, 3.371283, 0, 0.4352941, 1, 1,
0.3453822, -0.5853413, 0.7151929, 0, 0.4313726, 1, 1,
0.3459646, -1.010049, 1.515713, 0, 0.4235294, 1, 1,
0.3462835, 2.265572, -1.431015, 0, 0.4196078, 1, 1,
0.3464812, -0.4394638, 0.4852546, 0, 0.4117647, 1, 1,
0.3497186, -0.6504058, 1.470984, 0, 0.4078431, 1, 1,
0.3499705, 1.260997, -0.9121094, 0, 0.4, 1, 1,
0.3507895, -3.044174, 2.160833, 0, 0.3921569, 1, 1,
0.3519719, 0.682582, 1.189718, 0, 0.3882353, 1, 1,
0.3603684, 1.633972, 0.3605101, 0, 0.3803922, 1, 1,
0.3605149, 1.427565, -0.2160243, 0, 0.3764706, 1, 1,
0.3662327, -0.7674952, 3.080028, 0, 0.3686275, 1, 1,
0.3672356, -1.104352, 3.308583, 0, 0.3647059, 1, 1,
0.3673728, -1.900596, 2.833374, 0, 0.3568628, 1, 1,
0.3679468, 0.9287197, 0.7854883, 0, 0.3529412, 1, 1,
0.3684196, 1.327332, -0.8686625, 0, 0.345098, 1, 1,
0.3688703, -2.408897, 4.373592, 0, 0.3411765, 1, 1,
0.3690257, 0.005969755, 2.303507, 0, 0.3333333, 1, 1,
0.3692907, 1.296172, 0.7230905, 0, 0.3294118, 1, 1,
0.3704196, -0.3900955, 2.644896, 0, 0.3215686, 1, 1,
0.3705616, 1.277828, 0.02549989, 0, 0.3176471, 1, 1,
0.3708292, 0.3291948, 1.259871, 0, 0.3098039, 1, 1,
0.3732017, -0.2293213, 2.589951, 0, 0.3058824, 1, 1,
0.3742551, -2.248109, 5.65393, 0, 0.2980392, 1, 1,
0.376616, 0.7208394, 0.3171614, 0, 0.2901961, 1, 1,
0.3853588, -1.440678, 3.388622, 0, 0.2862745, 1, 1,
0.3893909, 0.9794837, 0.7438446, 0, 0.2784314, 1, 1,
0.3937382, 0.9163588, 0.6672289, 0, 0.2745098, 1, 1,
0.3945367, -0.3867896, 2.801248, 0, 0.2666667, 1, 1,
0.3965266, 0.01909152, 0.6863463, 0, 0.2627451, 1, 1,
0.4010721, 1.118419, -0.313462, 0, 0.254902, 1, 1,
0.4043235, 0.745842, 1.004995, 0, 0.2509804, 1, 1,
0.4115283, 0.217764, -0.5871357, 0, 0.2431373, 1, 1,
0.4141403, 0.7273923, 0.6786678, 0, 0.2392157, 1, 1,
0.4163285, -0.004119403, 2.246485, 0, 0.2313726, 1, 1,
0.416625, -0.4111547, 1.17095, 0, 0.227451, 1, 1,
0.4185208, 1.039969, 1.003041, 0, 0.2196078, 1, 1,
0.4209257, 0.7369956, 0.414587, 0, 0.2156863, 1, 1,
0.4253585, 2.122846, 1.154158, 0, 0.2078431, 1, 1,
0.4263606, -0.35359, 3.100139, 0, 0.2039216, 1, 1,
0.426631, 1.933022, 1.20235, 0, 0.1960784, 1, 1,
0.4287333, 0.602439, -0.7703487, 0, 0.1882353, 1, 1,
0.4305888, -1.707514, 3.611352, 0, 0.1843137, 1, 1,
0.4315642, -0.5208732, 2.355295, 0, 0.1764706, 1, 1,
0.433498, 0.6262847, 0.2598255, 0, 0.172549, 1, 1,
0.4374145, 0.2573804, 0.8553811, 0, 0.1647059, 1, 1,
0.4414801, -0.8598528, 3.858465, 0, 0.1607843, 1, 1,
0.4485418, 0.1523859, 0.9203638, 0, 0.1529412, 1, 1,
0.4486649, 1.023484, 1.414184, 0, 0.1490196, 1, 1,
0.4586631, -1.484821, -0.5137284, 0, 0.1411765, 1, 1,
0.4613974, 0.1090793, 2.258375, 0, 0.1372549, 1, 1,
0.4629321, 2.431689, 0.4516289, 0, 0.1294118, 1, 1,
0.4631332, -0.1191326, 1.738599, 0, 0.1254902, 1, 1,
0.4645929, 0.5041695, 1.967888, 0, 0.1176471, 1, 1,
0.4656976, 1.135615, 2.086869, 0, 0.1137255, 1, 1,
0.4678138, 0.7233845, 0.06769613, 0, 0.1058824, 1, 1,
0.4724989, -0.984542, 2.753839, 0, 0.09803922, 1, 1,
0.472978, -0.6622148, 1.79571, 0, 0.09411765, 1, 1,
0.4800422, 0.431086, 0.3922538, 0, 0.08627451, 1, 1,
0.4812128, 0.1140959, 0.8336505, 0, 0.08235294, 1, 1,
0.4812831, 0.908232, -2.552154, 0, 0.07450981, 1, 1,
0.4846741, 0.2395808, 1.199974, 0, 0.07058824, 1, 1,
0.4858546, -0.1625868, 2.695174, 0, 0.0627451, 1, 1,
0.4863499, 0.0187259, 2.984214, 0, 0.05882353, 1, 1,
0.4865813, 1.025483, -0.2141532, 0, 0.05098039, 1, 1,
0.4873531, 0.2504221, 1.046566, 0, 0.04705882, 1, 1,
0.4890016, -0.6330775, 1.353303, 0, 0.03921569, 1, 1,
0.490494, 0.09800573, 1.304715, 0, 0.03529412, 1, 1,
0.4914881, -0.2290843, 1.95069, 0, 0.02745098, 1, 1,
0.4928773, -1.210884, 2.303745, 0, 0.02352941, 1, 1,
0.4955915, 0.1536362, 1.647686, 0, 0.01568628, 1, 1,
0.4971357, 0.3282194, 1.711198, 0, 0.01176471, 1, 1,
0.4995521, 0.8002424, 1.878031, 0, 0.003921569, 1, 1,
0.5017335, 0.3449094, 1.751497, 0.003921569, 0, 1, 1,
0.5048246, 0.06568976, 0.2556879, 0.007843138, 0, 1, 1,
0.5096852, 0.4623299, 2.13146, 0.01568628, 0, 1, 1,
0.5116116, -1.257237, 3.175915, 0.01960784, 0, 1, 1,
0.5119272, 1.750651, -1.642247, 0.02745098, 0, 1, 1,
0.5196061, 0.5001819, -2.058609, 0.03137255, 0, 1, 1,
0.520163, 0.5502179, -0.4899576, 0.03921569, 0, 1, 1,
0.521067, 0.4323367, 1.055014, 0.04313726, 0, 1, 1,
0.5255355, 0.793382, 1.140295, 0.05098039, 0, 1, 1,
0.5279436, 0.1133474, 2.451562, 0.05490196, 0, 1, 1,
0.534756, 0.1983102, 1.151448, 0.0627451, 0, 1, 1,
0.5350782, -0.02458337, 3.056826, 0.06666667, 0, 1, 1,
0.5384144, -0.2805911, 2.656727, 0.07450981, 0, 1, 1,
0.5427291, 0.6090635, 1.825094, 0.07843138, 0, 1, 1,
0.553376, -0.2947564, -0.3266759, 0.08627451, 0, 1, 1,
0.5541753, 0.543062, 0.5984114, 0.09019608, 0, 1, 1,
0.5556437, 1.070346, -1.011353, 0.09803922, 0, 1, 1,
0.5557603, -1.84991, 2.539338, 0.1058824, 0, 1, 1,
0.5558745, 0.833243, 0.2639824, 0.1098039, 0, 1, 1,
0.5585566, 1.555242, 0.04363435, 0.1176471, 0, 1, 1,
0.5642787, 0.6148359, -0.1609196, 0.1215686, 0, 1, 1,
0.5653489, -2.506971, 4.275149, 0.1294118, 0, 1, 1,
0.5656748, 0.5178387, 1.924289, 0.1333333, 0, 1, 1,
0.56625, 1.761651, 0.0278318, 0.1411765, 0, 1, 1,
0.5726319, 0.2999626, 1.028639, 0.145098, 0, 1, 1,
0.5737051, 0.2507451, -0.06017087, 0.1529412, 0, 1, 1,
0.574827, 1.075756, -0.1391711, 0.1568628, 0, 1, 1,
0.5773153, -0.3924883, 0.2847123, 0.1647059, 0, 1, 1,
0.5796489, 1.455525, 1.389187, 0.1686275, 0, 1, 1,
0.5809167, -0.3222909, 1.169155, 0.1764706, 0, 1, 1,
0.5833228, -1.631817, 3.954383, 0.1803922, 0, 1, 1,
0.5849018, -1.897597, 2.655999, 0.1882353, 0, 1, 1,
0.5850834, 1.027253, 0.3188526, 0.1921569, 0, 1, 1,
0.5867774, -1.689544, 4.703041, 0.2, 0, 1, 1,
0.5914537, -0.7320306, 2.629897, 0.2078431, 0, 1, 1,
0.5921966, 0.9804385, 2.505076, 0.2117647, 0, 1, 1,
0.5923912, 0.09307821, 2.514077, 0.2196078, 0, 1, 1,
0.5955741, -0.4507097, 2.534698, 0.2235294, 0, 1, 1,
0.6021758, 1.127676, 0.5403876, 0.2313726, 0, 1, 1,
0.6054161, 0.4943444, -0.5441709, 0.2352941, 0, 1, 1,
0.60715, -1.194504, 1.603694, 0.2431373, 0, 1, 1,
0.608088, -0.00715737, -0.2417085, 0.2470588, 0, 1, 1,
0.608713, -1.630251, 3.620692, 0.254902, 0, 1, 1,
0.6140839, -0.9912779, 3.430038, 0.2588235, 0, 1, 1,
0.6201056, -1.402685, 3.455378, 0.2666667, 0, 1, 1,
0.6251067, 0.3170406, 1.939381, 0.2705882, 0, 1, 1,
0.6273392, 2.724786, -1.473931, 0.2784314, 0, 1, 1,
0.6292188, 1.149352, -1.263598, 0.282353, 0, 1, 1,
0.6295233, -1.135242, 5.771294, 0.2901961, 0, 1, 1,
0.6419535, -0.459226, 1.160178, 0.2941177, 0, 1, 1,
0.6487986, -0.4179149, 2.633432, 0.3019608, 0, 1, 1,
0.6564845, 1.338132, 0.06085587, 0.3098039, 0, 1, 1,
0.6582679, 1.791635, 1.469591, 0.3137255, 0, 1, 1,
0.6599113, -0.4145609, 2.720918, 0.3215686, 0, 1, 1,
0.6650539, 0.04476089, 2.030873, 0.3254902, 0, 1, 1,
0.6670396, -1.107046, 2.321092, 0.3333333, 0, 1, 1,
0.668031, -0.09638145, -0.1671707, 0.3372549, 0, 1, 1,
0.6723315, 1.045428, -0.8804896, 0.345098, 0, 1, 1,
0.6726304, -1.43911, 1.902962, 0.3490196, 0, 1, 1,
0.6733942, -0.1619031, 2.277621, 0.3568628, 0, 1, 1,
0.6827538, -0.09677952, 0.6103774, 0.3607843, 0, 1, 1,
0.6834098, 0.9758731, 2.478867, 0.3686275, 0, 1, 1,
0.6897175, 1.029885, 1.887803, 0.372549, 0, 1, 1,
0.6905577, -0.7097626, 2.203174, 0.3803922, 0, 1, 1,
0.6913139, 0.1435539, 1.975117, 0.3843137, 0, 1, 1,
0.6921232, -0.4334128, 3.196313, 0.3921569, 0, 1, 1,
0.6983014, 2.152714, 1.055102, 0.3960784, 0, 1, 1,
0.6988095, 1.136975, 1.931531, 0.4039216, 0, 1, 1,
0.704755, 1.283518, -0.455299, 0.4117647, 0, 1, 1,
0.706662, 0.01948279, 0.5497663, 0.4156863, 0, 1, 1,
0.7089505, 0.2091483, 0.973819, 0.4235294, 0, 1, 1,
0.7133014, 1.355965, 1.247666, 0.427451, 0, 1, 1,
0.7168854, 0.7404625, -0.2978941, 0.4352941, 0, 1, 1,
0.7217435, 0.2545142, 1.999858, 0.4392157, 0, 1, 1,
0.7225575, -0.2777352, 1.697416, 0.4470588, 0, 1, 1,
0.7245133, 0.1358827, 1.502349, 0.4509804, 0, 1, 1,
0.7246915, 0.2001859, 0.7036892, 0.4588235, 0, 1, 1,
0.7255233, -0.1263919, 1.081264, 0.4627451, 0, 1, 1,
0.7307026, 1.006353, 0.3019764, 0.4705882, 0, 1, 1,
0.7340482, 0.511175, 2.357154, 0.4745098, 0, 1, 1,
0.7384751, 0.9889252, -0.6945692, 0.4823529, 0, 1, 1,
0.7424707, 0.152868, 0.9681823, 0.4862745, 0, 1, 1,
0.7437534, 1.158096, 1.468734, 0.4941176, 0, 1, 1,
0.7465472, 1.559101, -0.0766627, 0.5019608, 0, 1, 1,
0.7489041, -0.684265, -0.06615756, 0.5058824, 0, 1, 1,
0.7491909, 0.3161993, 0.1459076, 0.5137255, 0, 1, 1,
0.7505482, 0.4195624, 0.7965689, 0.5176471, 0, 1, 1,
0.7525225, -0.9153797, 2.665372, 0.5254902, 0, 1, 1,
0.7675705, -0.8148376, 2.215754, 0.5294118, 0, 1, 1,
0.7693433, -0.05842748, 1.461527, 0.5372549, 0, 1, 1,
0.7703506, -2.831197, 1.661617, 0.5411765, 0, 1, 1,
0.7811372, 0.8525279, 1.682484, 0.5490196, 0, 1, 1,
0.782021, -1.698415, 3.242863, 0.5529412, 0, 1, 1,
0.792398, 0.4726126, 0.8259534, 0.5607843, 0, 1, 1,
0.7934352, 1.027012, 1.249595, 0.5647059, 0, 1, 1,
0.7968937, 1.040703, -0.5398424, 0.572549, 0, 1, 1,
0.8031661, -2.120534, 2.869866, 0.5764706, 0, 1, 1,
0.8033506, -1.348573, 1.614358, 0.5843138, 0, 1, 1,
0.8094652, 1.304413, -0.1332029, 0.5882353, 0, 1, 1,
0.8126798, 0.8004509, 1.577594, 0.5960785, 0, 1, 1,
0.8132616, 1.530122, 2.42566, 0.6039216, 0, 1, 1,
0.8133808, -1.224228, 3.378209, 0.6078432, 0, 1, 1,
0.8139153, -1.347171, 2.001707, 0.6156863, 0, 1, 1,
0.8263221, 0.6455056, 0.55031, 0.6196079, 0, 1, 1,
0.8276643, -0.4657691, 2.010067, 0.627451, 0, 1, 1,
0.8286752, 1.209844, 0.1573961, 0.6313726, 0, 1, 1,
0.8287805, -0.03297287, 2.186485, 0.6392157, 0, 1, 1,
0.8291439, -0.02547759, 1.900538, 0.6431373, 0, 1, 1,
0.8335013, 0.1330288, 0.2963867, 0.6509804, 0, 1, 1,
0.8472555, 1.147346, 1.507348, 0.654902, 0, 1, 1,
0.8484975, -0.178709, 1.095045, 0.6627451, 0, 1, 1,
0.8487478, -0.9551675, 0.590767, 0.6666667, 0, 1, 1,
0.8501055, 0.6045796, -0.433995, 0.6745098, 0, 1, 1,
0.8501706, -1.701646, 2.703804, 0.6784314, 0, 1, 1,
0.8506737, -0.03378443, 1.956723, 0.6862745, 0, 1, 1,
0.8557782, 0.9729056, -0.9778979, 0.6901961, 0, 1, 1,
0.860673, -0.5855343, 2.870502, 0.6980392, 0, 1, 1,
0.8609933, 1.520015, 0.1661648, 0.7058824, 0, 1, 1,
0.8661428, -0.1515131, 2.26899, 0.7098039, 0, 1, 1,
0.8670528, 0.3542082, 2.422258, 0.7176471, 0, 1, 1,
0.8673534, 0.9423824, 2.280705, 0.7215686, 0, 1, 1,
0.8679863, 0.09158784, 0.7312093, 0.7294118, 0, 1, 1,
0.8711766, 0.03954025, 1.312034, 0.7333333, 0, 1, 1,
0.8725418, -1.230027, 1.760453, 0.7411765, 0, 1, 1,
0.8728225, 2.229057, 0.08230206, 0.7450981, 0, 1, 1,
0.8742467, 0.3546892, -0.5056135, 0.7529412, 0, 1, 1,
0.8835947, 0.4675246, 0.2905393, 0.7568628, 0, 1, 1,
0.8859419, -0.2734745, 1.532901, 0.7647059, 0, 1, 1,
0.8867288, -0.2316288, 0.4540417, 0.7686275, 0, 1, 1,
0.8884588, 0.7166451, 1.736651, 0.7764706, 0, 1, 1,
0.8955724, 1.232628, 1.317669, 0.7803922, 0, 1, 1,
0.8995537, 0.60929, 2.407633, 0.7882353, 0, 1, 1,
0.9026058, -1.239382, 2.446162, 0.7921569, 0, 1, 1,
0.9080147, -0.4530894, 1.924964, 0.8, 0, 1, 1,
0.9090597, -0.1638481, 2.465942, 0.8078431, 0, 1, 1,
0.9102181, 0.8505919, 0.2478748, 0.8117647, 0, 1, 1,
0.9115307, -0.1272701, 1.137446, 0.8196079, 0, 1, 1,
0.9132425, -0.9914758, 1.308374, 0.8235294, 0, 1, 1,
0.9150981, -0.5055439, 1.770659, 0.8313726, 0, 1, 1,
0.9176732, 0.5170496, 3.922101, 0.8352941, 0, 1, 1,
0.9202732, 1.161547, 0.2779789, 0.8431373, 0, 1, 1,
0.9229282, -0.1690694, 1.434652, 0.8470588, 0, 1, 1,
0.9264007, -0.1879962, 2.501114, 0.854902, 0, 1, 1,
0.9264144, -0.3115487, 3.823489, 0.8588235, 0, 1, 1,
0.9295908, 2.351399, -2.349294, 0.8666667, 0, 1, 1,
0.9305871, 0.1941751, 1.001557, 0.8705882, 0, 1, 1,
0.931864, 0.1741682, 2.849677, 0.8784314, 0, 1, 1,
0.9354351, 1.819646, -0.2476862, 0.8823529, 0, 1, 1,
0.9412478, -0.6781347, 2.596052, 0.8901961, 0, 1, 1,
0.9442078, 0.6412479, 2.18825, 0.8941177, 0, 1, 1,
0.9553633, 0.2501815, -0.2460565, 0.9019608, 0, 1, 1,
0.9589664, 0.7743971, 0.3711356, 0.9098039, 0, 1, 1,
0.9623108, 0.08999292, 2.722998, 0.9137255, 0, 1, 1,
0.9641134, -0.04489112, 4.269357, 0.9215686, 0, 1, 1,
0.9655844, 1.047695, 3.034675, 0.9254902, 0, 1, 1,
0.9740298, -1.345854, 2.907824, 0.9333333, 0, 1, 1,
0.9754006, -0.4284712, 2.832634, 0.9372549, 0, 1, 1,
0.9756284, -0.09865927, 0.8957022, 0.945098, 0, 1, 1,
0.9781713, 1.775633, 2.319691, 0.9490196, 0, 1, 1,
0.9866294, -0.06275703, 1.298445, 0.9568627, 0, 1, 1,
0.9885982, -0.03227381, 2.981421, 0.9607843, 0, 1, 1,
0.9944903, -1.834734, 2.113144, 0.9686275, 0, 1, 1,
1.001643, -0.9703787, 3.662655, 0.972549, 0, 1, 1,
1.007601, -0.3142143, 2.497383, 0.9803922, 0, 1, 1,
1.013572, -0.359344, 2.792155, 0.9843137, 0, 1, 1,
1.014224, -0.1346841, 0.9515993, 0.9921569, 0, 1, 1,
1.016522, 1.262065, 1.243419, 0.9960784, 0, 1, 1,
1.022703, 1.55253, 2.053776, 1, 0, 0.9960784, 1,
1.024374, 0.2184812, 1.921178, 1, 0, 0.9882353, 1,
1.032948, 0.2275077, 1.058549, 1, 0, 0.9843137, 1,
1.034826, -1.3235, 0.9666104, 1, 0, 0.9764706, 1,
1.040092, -1.336828, 4.034455, 1, 0, 0.972549, 1,
1.042536, 1.450153, 0.2093527, 1, 0, 0.9647059, 1,
1.045866, -0.8088552, 1.753718, 1, 0, 0.9607843, 1,
1.047199, 0.1341924, 1.480461, 1, 0, 0.9529412, 1,
1.047708, -0.4704516, 1.602111, 1, 0, 0.9490196, 1,
1.055282, 0.8868899, 2.302623, 1, 0, 0.9411765, 1,
1.060179, 0.4079091, 1.465964, 1, 0, 0.9372549, 1,
1.063989, 1.151273, 0.4748767, 1, 0, 0.9294118, 1,
1.071652, -0.4640545, 1.558255, 1, 0, 0.9254902, 1,
1.071851, 0.1694969, 1.101023, 1, 0, 0.9176471, 1,
1.072966, -1.887854, 2.059768, 1, 0, 0.9137255, 1,
1.075769, 0.6835392, 0.7314536, 1, 0, 0.9058824, 1,
1.076916, 1.645239, 1.296553, 1, 0, 0.9019608, 1,
1.080045, 0.1849995, 0.8200251, 1, 0, 0.8941177, 1,
1.084788, -1.327565, 1.751723, 1, 0, 0.8862745, 1,
1.084864, -0.9161472, 1.164083, 1, 0, 0.8823529, 1,
1.09632, 0.3688161, 1.360775, 1, 0, 0.8745098, 1,
1.111602, -0.02152072, 0.6507522, 1, 0, 0.8705882, 1,
1.11215, -1.180232, 4.333712, 1, 0, 0.8627451, 1,
1.122691, -0.3274495, 4.106146, 1, 0, 0.8588235, 1,
1.125446, 1.814415, 2.146228, 1, 0, 0.8509804, 1,
1.12549, 0.5107805, 1.05516, 1, 0, 0.8470588, 1,
1.128979, -0.8701199, 2.351868, 1, 0, 0.8392157, 1,
1.148852, 0.4749475, 2.019018, 1, 0, 0.8352941, 1,
1.157894, -0.5994508, 0.9231691, 1, 0, 0.827451, 1,
1.162438, -1.528306, 2.862969, 1, 0, 0.8235294, 1,
1.166741, 1.254274, 1.239353, 1, 0, 0.8156863, 1,
1.16717, 0.6423938, 0.9337716, 1, 0, 0.8117647, 1,
1.170508, -0.9266849, 2.95523, 1, 0, 0.8039216, 1,
1.173705, -0.5160826, 2.852165, 1, 0, 0.7960784, 1,
1.174834, -2.693995, 4.010403, 1, 0, 0.7921569, 1,
1.174986, 1.844608, 0.3538799, 1, 0, 0.7843137, 1,
1.178137, -1.043369, 1.404212, 1, 0, 0.7803922, 1,
1.184806, 0.2887838, 0.6465863, 1, 0, 0.772549, 1,
1.189943, -1.113152, 4.138035, 1, 0, 0.7686275, 1,
1.194078, 0.8523785, 1.989963, 1, 0, 0.7607843, 1,
1.195841, -1.07543, 1.401543, 1, 0, 0.7568628, 1,
1.204964, 1.19071, 0.2148174, 1, 0, 0.7490196, 1,
1.206316, 1.046501, 2.899714, 1, 0, 0.7450981, 1,
1.206522, 1.865237, 0.1245172, 1, 0, 0.7372549, 1,
1.210356, 0.5215567, -0.02782765, 1, 0, 0.7333333, 1,
1.213797, -0.8579714, 1.40333, 1, 0, 0.7254902, 1,
1.215141, 0.4984803, 1.260002, 1, 0, 0.7215686, 1,
1.215537, 0.5111147, 4.005438, 1, 0, 0.7137255, 1,
1.220927, -0.5661685, 2.937318, 1, 0, 0.7098039, 1,
1.223448, 1.218414, 1.206121, 1, 0, 0.7019608, 1,
1.239157, 0.8213472, -0.1129832, 1, 0, 0.6941177, 1,
1.25026, -0.04771092, 1.708737, 1, 0, 0.6901961, 1,
1.250844, -1.150185, 2.367155, 1, 0, 0.682353, 1,
1.251998, -1.502886, 3.059256, 1, 0, 0.6784314, 1,
1.254485, 0.1291351, 0.6204604, 1, 0, 0.6705883, 1,
1.257339, 0.6927689, 2.367835, 1, 0, 0.6666667, 1,
1.270309, -0.2218075, 3.29807, 1, 0, 0.6588235, 1,
1.274352, 0.1364728, 1.858462, 1, 0, 0.654902, 1,
1.299714, 0.6055943, 1.601794, 1, 0, 0.6470588, 1,
1.303525, -1.52208, 2.157017, 1, 0, 0.6431373, 1,
1.309332, 2.163738, 0.2067132, 1, 0, 0.6352941, 1,
1.310192, 0.5937364, 1.636436, 1, 0, 0.6313726, 1,
1.342985, 0.3489054, 2.834886, 1, 0, 0.6235294, 1,
1.359026, -0.02371092, -0.9194983, 1, 0, 0.6196079, 1,
1.359495, -0.02904277, 2.172097, 1, 0, 0.6117647, 1,
1.366257, 0.1912489, 0.960547, 1, 0, 0.6078432, 1,
1.366777, -1.648845, 1.79953, 1, 0, 0.6, 1,
1.370019, -0.7449549, 1.384344, 1, 0, 0.5921569, 1,
1.371244, -0.3725419, 2.160044, 1, 0, 0.5882353, 1,
1.374117, 0.4847683, 2.186409, 1, 0, 0.5803922, 1,
1.378261, -0.8627039, 2.54223, 1, 0, 0.5764706, 1,
1.378845, 0.08520723, 2.593922, 1, 0, 0.5686275, 1,
1.381744, 0.4377749, 2.600358, 1, 0, 0.5647059, 1,
1.391075, -0.5147491, 2.096704, 1, 0, 0.5568628, 1,
1.395892, 1.1896, 0.8021724, 1, 0, 0.5529412, 1,
1.402949, 2.341421, 1.255731, 1, 0, 0.5450981, 1,
1.410328, 0.5621774, 1.53399, 1, 0, 0.5411765, 1,
1.430425, -1.320617, 3.00732, 1, 0, 0.5333334, 1,
1.444399, -1.233786, 2.93906, 1, 0, 0.5294118, 1,
1.454121, -0.01217862, 1.881237, 1, 0, 0.5215687, 1,
1.495739, -0.3026148, 1.414667, 1, 0, 0.5176471, 1,
1.500665, 0.01878747, 2.709572, 1, 0, 0.509804, 1,
1.535444, -0.9817963, 2.296386, 1, 0, 0.5058824, 1,
1.540311, -0.5397851, 2.72771, 1, 0, 0.4980392, 1,
1.545867, -0.2618403, 1.836102, 1, 0, 0.4901961, 1,
1.551823, 1.14135, 1.53722, 1, 0, 0.4862745, 1,
1.561222, 0.4102257, -0.2666877, 1, 0, 0.4784314, 1,
1.562134, 0.8090711, -0.3572067, 1, 0, 0.4745098, 1,
1.566818, -0.5203017, 1.67006, 1, 0, 0.4666667, 1,
1.57146, 0.445694, -0.5051436, 1, 0, 0.4627451, 1,
1.585295, -1.339648, 2.994908, 1, 0, 0.454902, 1,
1.612834, -0.9239326, 2.821683, 1, 0, 0.4509804, 1,
1.620654, -0.8146107, 2.099862, 1, 0, 0.4431373, 1,
1.622951, -0.5862526, 0.9147735, 1, 0, 0.4392157, 1,
1.623797, -1.202831, 3.436929, 1, 0, 0.4313726, 1,
1.627833, -1.668752, 1.897518, 1, 0, 0.427451, 1,
1.638871, -1.262794, 3.019313, 1, 0, 0.4196078, 1,
1.647176, 1.14551, 1.556333, 1, 0, 0.4156863, 1,
1.653466, 0.6977338, 1.650151, 1, 0, 0.4078431, 1,
1.653821, -0.1067835, 1.618272, 1, 0, 0.4039216, 1,
1.657575, 0.1612155, 1.284813, 1, 0, 0.3960784, 1,
1.673299, 0.9588153, 1.705998, 1, 0, 0.3882353, 1,
1.674555, 0.8293539, 1.893914, 1, 0, 0.3843137, 1,
1.684042, -0.8849941, 0.762143, 1, 0, 0.3764706, 1,
1.708972, -1.003274, 1.531581, 1, 0, 0.372549, 1,
1.713129, 0.4845581, 0.9092609, 1, 0, 0.3647059, 1,
1.714321, -0.9836898, 2.933977, 1, 0, 0.3607843, 1,
1.756549, 0.1962145, 0.4771227, 1, 0, 0.3529412, 1,
1.761328, 0.2895975, 0.3174115, 1, 0, 0.3490196, 1,
1.770102, -0.6657369, 3.159812, 1, 0, 0.3411765, 1,
1.809427, 0.9868374, 0.1474425, 1, 0, 0.3372549, 1,
1.812082, -0.03277471, 2.369759, 1, 0, 0.3294118, 1,
1.814663, -1.023127, 2.786373, 1, 0, 0.3254902, 1,
1.819174, 0.5904754, 1.89506, 1, 0, 0.3176471, 1,
1.833517, 0.5623798, 1.536029, 1, 0, 0.3137255, 1,
1.836308, 0.2841527, 0.8623068, 1, 0, 0.3058824, 1,
1.859981, -0.2329201, 0.9487053, 1, 0, 0.2980392, 1,
1.86929, -2.431205, 3.172471, 1, 0, 0.2941177, 1,
1.875026, -0.2696611, 0.7840803, 1, 0, 0.2862745, 1,
1.887395, 0.4452798, 2.227746, 1, 0, 0.282353, 1,
1.891192, 0.1982405, -0.5400591, 1, 0, 0.2745098, 1,
1.893955, 0.2418572, 1.208986, 1, 0, 0.2705882, 1,
1.896823, -0.5767323, 3.096918, 1, 0, 0.2627451, 1,
1.901473, 0.3961659, 0.8512856, 1, 0, 0.2588235, 1,
1.902748, 0.104231, 0.6775828, 1, 0, 0.2509804, 1,
1.912849, 1.212525, 1.239941, 1, 0, 0.2470588, 1,
1.91947, -0.3145913, 1.293967, 1, 0, 0.2392157, 1,
1.924664, -2.099937, 2.807521, 1, 0, 0.2352941, 1,
1.92521, 0.8623252, 0.9886525, 1, 0, 0.227451, 1,
1.944484, -0.4450453, 2.551056, 1, 0, 0.2235294, 1,
1.963478, 1.447214, 0.04866558, 1, 0, 0.2156863, 1,
1.963504, -1.693442, 2.4302, 1, 0, 0.2117647, 1,
1.967195, 0.3334746, 1.693956, 1, 0, 0.2039216, 1,
1.975132, -1.735635, 1.782921, 1, 0, 0.1960784, 1,
1.983151, 0.983885, -0.1700438, 1, 0, 0.1921569, 1,
1.984518, 1.017962, 1.118423, 1, 0, 0.1843137, 1,
2.005725, -0.01898591, 0.9786728, 1, 0, 0.1803922, 1,
2.022548, -0.7124113, 2.039481, 1, 0, 0.172549, 1,
2.028629, 1.443576, 2.263037, 1, 0, 0.1686275, 1,
2.029978, 0.4107102, 0.4266607, 1, 0, 0.1607843, 1,
2.055755, 0.3003752, 1.073723, 1, 0, 0.1568628, 1,
2.06974, 0.4413984, 0.7633249, 1, 0, 0.1490196, 1,
2.08822, 0.1735337, 1.719079, 1, 0, 0.145098, 1,
2.089024, -0.6444371, 1.094176, 1, 0, 0.1372549, 1,
2.103622, -0.9138018, 1.746928, 1, 0, 0.1333333, 1,
2.122257, -0.1666225, 1.573466, 1, 0, 0.1254902, 1,
2.12511, -0.7528325, 0.02941259, 1, 0, 0.1215686, 1,
2.127615, -0.723088, 0.7713045, 1, 0, 0.1137255, 1,
2.128462, 0.6206957, 0.1780793, 1, 0, 0.1098039, 1,
2.173186, 0.643544, 1.397219, 1, 0, 0.1019608, 1,
2.180056, 0.8385735, 1.674687, 1, 0, 0.09411765, 1,
2.194944, 0.1763142, 0.8751357, 1, 0, 0.09019608, 1,
2.230812, 0.9891156, 1.323348, 1, 0, 0.08235294, 1,
2.240916, -1.01752, 3.28878, 1, 0, 0.07843138, 1,
2.342592, 0.009026508, 2.661251, 1, 0, 0.07058824, 1,
2.35728, 0.5582182, 1.374028, 1, 0, 0.06666667, 1,
2.412453, -0.712026, 1.251823, 1, 0, 0.05882353, 1,
2.448358, -1.047213, 2.220804, 1, 0, 0.05490196, 1,
2.451849, 0.09789028, 2.57665, 1, 0, 0.04705882, 1,
2.467313, 1.174552, 1.05901, 1, 0, 0.04313726, 1,
2.553402, -0.9529147, 4.36762, 1, 0, 0.03529412, 1,
2.607768, 0.7477285, 1.552384, 1, 0, 0.03137255, 1,
2.654932, 0.5361335, -0.221103, 1, 0, 0.02352941, 1,
2.686067, 0.21819, 2.085968, 1, 0, 0.01960784, 1,
2.814009, 0.7687142, 1.315882, 1, 0, 0.01176471, 1,
3.015284, -0.9166043, -0.6142505, 1, 0, 0.007843138, 1
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
-0.1714253, -4.028785, -6.646149, 0, -0.5, 0.5, 0.5,
-0.1714253, -4.028785, -6.646149, 1, -0.5, 0.5, 0.5,
-0.1714253, -4.028785, -6.646149, 1, 1.5, 0.5, 0.5,
-0.1714253, -4.028785, -6.646149, 0, 1.5, 0.5, 0.5
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
-4.438428, -0.1397178, -6.646149, 0, -0.5, 0.5, 0.5,
-4.438428, -0.1397178, -6.646149, 1, -0.5, 0.5, 0.5,
-4.438428, -0.1397178, -6.646149, 1, 1.5, 0.5, 0.5,
-4.438428, -0.1397178, -6.646149, 0, 1.5, 0.5, 0.5
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
-4.438428, -4.028785, 0.4624257, 0, -0.5, 0.5, 0.5,
-4.438428, -4.028785, 0.4624257, 1, -0.5, 0.5, 0.5,
-4.438428, -4.028785, 0.4624257, 1, 1.5, 0.5, 0.5,
-4.438428, -4.028785, 0.4624257, 0, 1.5, 0.5, 0.5
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
-3, -3.131308, -5.005709,
3, -3.131308, -5.005709,
-3, -3.131308, -5.005709,
-3, -3.280887, -5.279116,
-2, -3.131308, -5.005709,
-2, -3.280887, -5.279116,
-1, -3.131308, -5.005709,
-1, -3.280887, -5.279116,
0, -3.131308, -5.005709,
0, -3.280887, -5.279116,
1, -3.131308, -5.005709,
1, -3.280887, -5.279116,
2, -3.131308, -5.005709,
2, -3.280887, -5.279116,
3, -3.131308, -5.005709,
3, -3.280887, -5.279116
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
-3, -3.580046, -5.825929, 0, -0.5, 0.5, 0.5,
-3, -3.580046, -5.825929, 1, -0.5, 0.5, 0.5,
-3, -3.580046, -5.825929, 1, 1.5, 0.5, 0.5,
-3, -3.580046, -5.825929, 0, 1.5, 0.5, 0.5,
-2, -3.580046, -5.825929, 0, -0.5, 0.5, 0.5,
-2, -3.580046, -5.825929, 1, -0.5, 0.5, 0.5,
-2, -3.580046, -5.825929, 1, 1.5, 0.5, 0.5,
-2, -3.580046, -5.825929, 0, 1.5, 0.5, 0.5,
-1, -3.580046, -5.825929, 0, -0.5, 0.5, 0.5,
-1, -3.580046, -5.825929, 1, -0.5, 0.5, 0.5,
-1, -3.580046, -5.825929, 1, 1.5, 0.5, 0.5,
-1, -3.580046, -5.825929, 0, 1.5, 0.5, 0.5,
0, -3.580046, -5.825929, 0, -0.5, 0.5, 0.5,
0, -3.580046, -5.825929, 1, -0.5, 0.5, 0.5,
0, -3.580046, -5.825929, 1, 1.5, 0.5, 0.5,
0, -3.580046, -5.825929, 0, 1.5, 0.5, 0.5,
1, -3.580046, -5.825929, 0, -0.5, 0.5, 0.5,
1, -3.580046, -5.825929, 1, -0.5, 0.5, 0.5,
1, -3.580046, -5.825929, 1, 1.5, 0.5, 0.5,
1, -3.580046, -5.825929, 0, 1.5, 0.5, 0.5,
2, -3.580046, -5.825929, 0, -0.5, 0.5, 0.5,
2, -3.580046, -5.825929, 1, -0.5, 0.5, 0.5,
2, -3.580046, -5.825929, 1, 1.5, 0.5, 0.5,
2, -3.580046, -5.825929, 0, 1.5, 0.5, 0.5,
3, -3.580046, -5.825929, 0, -0.5, 0.5, 0.5,
3, -3.580046, -5.825929, 1, -0.5, 0.5, 0.5,
3, -3.580046, -5.825929, 1, 1.5, 0.5, 0.5,
3, -3.580046, -5.825929, 0, 1.5, 0.5, 0.5
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
-3.453736, -3, -5.005709,
-3.453736, 2, -5.005709,
-3.453736, -3, -5.005709,
-3.617851, -3, -5.279116,
-3.453736, -2, -5.005709,
-3.617851, -2, -5.279116,
-3.453736, -1, -5.005709,
-3.617851, -1, -5.279116,
-3.453736, 0, -5.005709,
-3.617851, 0, -5.279116,
-3.453736, 1, -5.005709,
-3.617851, 1, -5.279116,
-3.453736, 2, -5.005709,
-3.617851, 2, -5.279116
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
-3.946082, -3, -5.825929, 0, -0.5, 0.5, 0.5,
-3.946082, -3, -5.825929, 1, -0.5, 0.5, 0.5,
-3.946082, -3, -5.825929, 1, 1.5, 0.5, 0.5,
-3.946082, -3, -5.825929, 0, 1.5, 0.5, 0.5,
-3.946082, -2, -5.825929, 0, -0.5, 0.5, 0.5,
-3.946082, -2, -5.825929, 1, -0.5, 0.5, 0.5,
-3.946082, -2, -5.825929, 1, 1.5, 0.5, 0.5,
-3.946082, -2, -5.825929, 0, 1.5, 0.5, 0.5,
-3.946082, -1, -5.825929, 0, -0.5, 0.5, 0.5,
-3.946082, -1, -5.825929, 1, -0.5, 0.5, 0.5,
-3.946082, -1, -5.825929, 1, 1.5, 0.5, 0.5,
-3.946082, -1, -5.825929, 0, 1.5, 0.5, 0.5,
-3.946082, 0, -5.825929, 0, -0.5, 0.5, 0.5,
-3.946082, 0, -5.825929, 1, -0.5, 0.5, 0.5,
-3.946082, 0, -5.825929, 1, 1.5, 0.5, 0.5,
-3.946082, 0, -5.825929, 0, 1.5, 0.5, 0.5,
-3.946082, 1, -5.825929, 0, -0.5, 0.5, 0.5,
-3.946082, 1, -5.825929, 1, -0.5, 0.5, 0.5,
-3.946082, 1, -5.825929, 1, 1.5, 0.5, 0.5,
-3.946082, 1, -5.825929, 0, 1.5, 0.5, 0.5,
-3.946082, 2, -5.825929, 0, -0.5, 0.5, 0.5,
-3.946082, 2, -5.825929, 1, -0.5, 0.5, 0.5,
-3.946082, 2, -5.825929, 1, 1.5, 0.5, 0.5,
-3.946082, 2, -5.825929, 0, 1.5, 0.5, 0.5
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
-3.453736, -3.131308, -4,
-3.453736, -3.131308, 4,
-3.453736, -3.131308, -4,
-3.617851, -3.280887, -4,
-3.453736, -3.131308, -2,
-3.617851, -3.280887, -2,
-3.453736, -3.131308, 0,
-3.617851, -3.280887, 0,
-3.453736, -3.131308, 2,
-3.617851, -3.280887, 2,
-3.453736, -3.131308, 4,
-3.617851, -3.280887, 4
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
-3.946082, -3.580046, -4, 0, -0.5, 0.5, 0.5,
-3.946082, -3.580046, -4, 1, -0.5, 0.5, 0.5,
-3.946082, -3.580046, -4, 1, 1.5, 0.5, 0.5,
-3.946082, -3.580046, -4, 0, 1.5, 0.5, 0.5,
-3.946082, -3.580046, -2, 0, -0.5, 0.5, 0.5,
-3.946082, -3.580046, -2, 1, -0.5, 0.5, 0.5,
-3.946082, -3.580046, -2, 1, 1.5, 0.5, 0.5,
-3.946082, -3.580046, -2, 0, 1.5, 0.5, 0.5,
-3.946082, -3.580046, 0, 0, -0.5, 0.5, 0.5,
-3.946082, -3.580046, 0, 1, -0.5, 0.5, 0.5,
-3.946082, -3.580046, 0, 1, 1.5, 0.5, 0.5,
-3.946082, -3.580046, 0, 0, 1.5, 0.5, 0.5,
-3.946082, -3.580046, 2, 0, -0.5, 0.5, 0.5,
-3.946082, -3.580046, 2, 1, -0.5, 0.5, 0.5,
-3.946082, -3.580046, 2, 1, 1.5, 0.5, 0.5,
-3.946082, -3.580046, 2, 0, 1.5, 0.5, 0.5,
-3.946082, -3.580046, 4, 0, -0.5, 0.5, 0.5,
-3.946082, -3.580046, 4, 1, -0.5, 0.5, 0.5,
-3.946082, -3.580046, 4, 1, 1.5, 0.5, 0.5,
-3.946082, -3.580046, 4, 0, 1.5, 0.5, 0.5
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
-3.453736, -3.131308, -5.005709,
-3.453736, 2.851872, -5.005709,
-3.453736, -3.131308, 5.93056,
-3.453736, 2.851872, 5.93056,
-3.453736, -3.131308, -5.005709,
-3.453736, -3.131308, 5.93056,
-3.453736, 2.851872, -5.005709,
-3.453736, 2.851872, 5.93056,
-3.453736, -3.131308, -5.005709,
3.110885, -3.131308, -5.005709,
-3.453736, -3.131308, 5.93056,
3.110885, -3.131308, 5.93056,
-3.453736, 2.851872, -5.005709,
3.110885, 2.851872, -5.005709,
-3.453736, 2.851872, 5.93056,
3.110885, 2.851872, 5.93056,
3.110885, -3.131308, -5.005709,
3.110885, 2.851872, -5.005709,
3.110885, -3.131308, 5.93056,
3.110885, 2.851872, 5.93056,
3.110885, -3.131308, -5.005709,
3.110885, -3.131308, 5.93056,
3.110885, 2.851872, -5.005709,
3.110885, 2.851872, 5.93056
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
var radius = 7.523153;
var distance = 33.47136;
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
mvMatrix.translate( 0.1714253, 0.1397178, -0.4624257 );
mvMatrix.scale( 1.239094, 1.359508, 0.7437802 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.47136);
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
Carbamate_Hydrochlor<-read.table("Carbamate_Hydrochlor.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.358134, 0.4502283, -1.213902, 0, 0, 1, 1, 1,
-2.959756, 0.1209419, -0.1162175, 1, 0, 0, 1, 1,
-2.914559, 2.751718, 0.3685771, 1, 0, 0, 1, 1,
-2.894588, 0.4061298, -1.740667, 1, 0, 0, 1, 1,
-2.742186, -0.3501521, -4.029343, 1, 0, 0, 1, 1,
-2.678247, 0.4656875, -1.112552, 1, 0, 0, 1, 1,
-2.674369, 0.06370664, -1.938661, 0, 0, 0, 1, 1,
-2.665446, 1.522517, 0.5865257, 0, 0, 0, 1, 1,
-2.617282, 0.1164887, -3.147662, 0, 0, 0, 1, 1,
-2.515997, 1.009997, -1.714083, 0, 0, 0, 1, 1,
-2.496858, -1.605414, -1.722493, 0, 0, 0, 1, 1,
-2.476564, -0.4312683, -0.6547883, 0, 0, 0, 1, 1,
-2.377106, -0.769533, -3.512322, 0, 0, 0, 1, 1,
-2.304016, 1.185898, -1.119465, 1, 1, 1, 1, 1,
-2.301799, 0.6376684, -0.05302783, 1, 1, 1, 1, 1,
-2.296907, -1.020591, -0.1206183, 1, 1, 1, 1, 1,
-2.266883, 0.845997, -0.8533286, 1, 1, 1, 1, 1,
-2.259402, -0.1929961, -0.6360832, 1, 1, 1, 1, 1,
-2.255945, -0.3319765, -1.079404, 1, 1, 1, 1, 1,
-2.25062, -0.8070728, -1.919107, 1, 1, 1, 1, 1,
-2.22989, 0.7648449, -0.8181216, 1, 1, 1, 1, 1,
-2.229281, -0.6896288, -0.6361913, 1, 1, 1, 1, 1,
-2.217467, 1.378593, -2.040592, 1, 1, 1, 1, 1,
-2.16898, 1.494992, -4.343379, 1, 1, 1, 1, 1,
-2.161258, -0.1281053, -2.752498, 1, 1, 1, 1, 1,
-2.117635, -0.8768945, -4.014254, 1, 1, 1, 1, 1,
-2.113008, -0.2570452, -0.1756668, 1, 1, 1, 1, 1,
-2.076596, 0.05661846, -2.717878, 1, 1, 1, 1, 1,
-2.076431, 0.9784051, -0.3123856, 0, 0, 1, 1, 1,
-2.048191, -0.2344513, -2.684491, 1, 0, 0, 1, 1,
-2.009094, -0.2373673, -1.522308, 1, 0, 0, 1, 1,
-2.000473, 0.005983435, -1.951647, 1, 0, 0, 1, 1,
-1.998809, -0.7505291, -1.656178, 1, 0, 0, 1, 1,
-1.985638, -0.2609278, -1.471961, 1, 0, 0, 1, 1,
-1.980971, -0.6288457, -1.950974, 0, 0, 0, 1, 1,
-1.951015, 0.4103242, -1.329743, 0, 0, 0, 1, 1,
-1.935902, 1.190557, 0.2208326, 0, 0, 0, 1, 1,
-1.928926, 0.05072794, -2.446156, 0, 0, 0, 1, 1,
-1.915731, 0.2849595, -0.5519233, 0, 0, 0, 1, 1,
-1.911426, -2.495787, -2.809064, 0, 0, 0, 1, 1,
-1.899301, 0.9087628, -0.7338545, 0, 0, 0, 1, 1,
-1.897413, 0.2538058, 0.1728695, 1, 1, 1, 1, 1,
-1.876223, 0.6832827, -1.786277, 1, 1, 1, 1, 1,
-1.849236, -1.690475, -2.741121, 1, 1, 1, 1, 1,
-1.845905, 0.7567264, 0.0505478, 1, 1, 1, 1, 1,
-1.8421, 1.914595, -0.7784468, 1, 1, 1, 1, 1,
-1.833158, -0.1919294, -1.881904, 1, 1, 1, 1, 1,
-1.81131, 0.4052785, 0.2658805, 1, 1, 1, 1, 1,
-1.801122, 2.183408, -1.725723, 1, 1, 1, 1, 1,
-1.797709, -0.8649334, -1.830585, 1, 1, 1, 1, 1,
-1.790664, 0.8707982, -1.783802, 1, 1, 1, 1, 1,
-1.771457, -0.01666972, -1.007067, 1, 1, 1, 1, 1,
-1.755461, 0.7483799, 0.1591627, 1, 1, 1, 1, 1,
-1.696065, 0.7921504, -0.6742813, 1, 1, 1, 1, 1,
-1.684767, -0.4077741, -1.873256, 1, 1, 1, 1, 1,
-1.656753, 0.3402376, -0.7804703, 1, 1, 1, 1, 1,
-1.651877, 0.7962233, -0.2179739, 0, 0, 1, 1, 1,
-1.63169, -0.04464068, -3.868387, 1, 0, 0, 1, 1,
-1.631598, -1.595186, -1.070526, 1, 0, 0, 1, 1,
-1.628858, -0.7297505, -2.578484, 1, 0, 0, 1, 1,
-1.615653, 1.769341, -0.5676777, 1, 0, 0, 1, 1,
-1.607163, -1.3065, -1.793109, 1, 0, 0, 1, 1,
-1.605168, -0.7275017, -0.9594386, 0, 0, 0, 1, 1,
-1.591469, -2.016388, -2.31924, 0, 0, 0, 1, 1,
-1.585524, 1.01416, -1.841462, 0, 0, 0, 1, 1,
-1.580171, 0.4110428, 0.3349755, 0, 0, 0, 1, 1,
-1.560166, 0.2495263, 1.103329, 0, 0, 0, 1, 1,
-1.557632, 0.435186, -1.143826, 0, 0, 0, 1, 1,
-1.555916, -0.6019858, -2.008527, 0, 0, 0, 1, 1,
-1.553868, 1.773146, -1.222062, 1, 1, 1, 1, 1,
-1.552841, 1.127392, 0.5469257, 1, 1, 1, 1, 1,
-1.552781, -0.3429773, -3.157924, 1, 1, 1, 1, 1,
-1.547998, 0.6495647, -1.934039, 1, 1, 1, 1, 1,
-1.547304, -0.5537181, -1.890765, 1, 1, 1, 1, 1,
-1.537776, 0.4656149, -1.26203, 1, 1, 1, 1, 1,
-1.536536, 1.694765, -1.860835, 1, 1, 1, 1, 1,
-1.524723, -0.0255675, -3.091758, 1, 1, 1, 1, 1,
-1.513858, -0.698595, -2.911909, 1, 1, 1, 1, 1,
-1.511058, -0.3167697, -2.175194, 1, 1, 1, 1, 1,
-1.506364, 1.875546, 0.3466594, 1, 1, 1, 1, 1,
-1.490756, 1.738926, -0.3835634, 1, 1, 1, 1, 1,
-1.48457, -1.059279, -0.9266431, 1, 1, 1, 1, 1,
-1.473478, 1.215043, -0.6220759, 1, 1, 1, 1, 1,
-1.454746, -1.26346, -2.902158, 1, 1, 1, 1, 1,
-1.450237, 0.1000771, -0.509451, 0, 0, 1, 1, 1,
-1.445563, -1.704514, -3.872488, 1, 0, 0, 1, 1,
-1.432527, 1.405859, -1.035241, 1, 0, 0, 1, 1,
-1.4282, -2.285597, -2.785675, 1, 0, 0, 1, 1,
-1.423902, 0.4684293, -2.958486, 1, 0, 0, 1, 1,
-1.421469, 0.5506535, -1.733786, 1, 0, 0, 1, 1,
-1.415429, 0.6637338, -1.318696, 0, 0, 0, 1, 1,
-1.409957, 0.4225901, -2.564454, 0, 0, 0, 1, 1,
-1.397105, 0.553436, -0.6416026, 0, 0, 0, 1, 1,
-1.396191, -0.8077058, -1.542815, 0, 0, 0, 1, 1,
-1.391453, -0.7387136, -2.562121, 0, 0, 0, 1, 1,
-1.384184, -0.260656, -2.408713, 0, 0, 0, 1, 1,
-1.376418, -0.4849874, -1.665858, 0, 0, 0, 1, 1,
-1.352479, -0.2331902, -0.8221119, 1, 1, 1, 1, 1,
-1.343376, -0.551131, -3.010308, 1, 1, 1, 1, 1,
-1.342598, -0.624871, -0.7157652, 1, 1, 1, 1, 1,
-1.341074, 2.417529, -0.1039926, 1, 1, 1, 1, 1,
-1.337501, -0.08143582, -1.443701, 1, 1, 1, 1, 1,
-1.33406, 0.6961524, -1.03725, 1, 1, 1, 1, 1,
-1.333854, 0.0884099, -1.215812, 1, 1, 1, 1, 1,
-1.320685, -1.373298, -3.248861, 1, 1, 1, 1, 1,
-1.311878, -0.1830377, -2.42547, 1, 1, 1, 1, 1,
-1.302117, 0.9751422, 1.859273, 1, 1, 1, 1, 1,
-1.297122, 0.5674202, -1.586014, 1, 1, 1, 1, 1,
-1.293026, 1.707343, -0.2958989, 1, 1, 1, 1, 1,
-1.288841, -0.298016, 0.4551365, 1, 1, 1, 1, 1,
-1.280847, -0.7088989, -1.839613, 1, 1, 1, 1, 1,
-1.274954, 0.6708604, -1.068605, 1, 1, 1, 1, 1,
-1.267151, -0.007516334, -2.998117, 0, 0, 1, 1, 1,
-1.26637, 1.689156, 0.169981, 1, 0, 0, 1, 1,
-1.265641, -0.9559633, -1.058407, 1, 0, 0, 1, 1,
-1.259096, 0.9006211, -1.207682, 1, 0, 0, 1, 1,
-1.25847, -0.1212137, -0.3170402, 1, 0, 0, 1, 1,
-1.253159, 0.9575839, -0.9277446, 1, 0, 0, 1, 1,
-1.248214, -0.8654339, -1.802728, 0, 0, 0, 1, 1,
-1.246285, 0.02748598, -1.346432, 0, 0, 0, 1, 1,
-1.243231, 1.089011, 0.7656569, 0, 0, 0, 1, 1,
-1.24208, -1.574387, -2.01379, 0, 0, 0, 1, 1,
-1.241832, -1.300788, -2.487559, 0, 0, 0, 1, 1,
-1.241065, -0.03078873, -2.322476, 0, 0, 0, 1, 1,
-1.238656, -1.095347, -1.47132, 0, 0, 0, 1, 1,
-1.237012, -0.08691075, -1.81923, 1, 1, 1, 1, 1,
-1.231225, 0.7262243, -1.85751, 1, 1, 1, 1, 1,
-1.227356, -1.125672, -1.026883, 1, 1, 1, 1, 1,
-1.212595, 1.000969, -3.1205, 1, 1, 1, 1, 1,
-1.192651, 2.421714, 1.540147, 1, 1, 1, 1, 1,
-1.186925, -2.676657, -1.340957, 1, 1, 1, 1, 1,
-1.184713, 0.7743997, -0.8738965, 1, 1, 1, 1, 1,
-1.181447, -0.627037, -2.301174, 1, 1, 1, 1, 1,
-1.178535, -1.312905, -2.328421, 1, 1, 1, 1, 1,
-1.152281, -0.355289, -1.444653, 1, 1, 1, 1, 1,
-1.140535, -1.07761, -2.89166, 1, 1, 1, 1, 1,
-1.138445, -0.8624582, -3.777695, 1, 1, 1, 1, 1,
-1.134782, 0.534332, -2.11588, 1, 1, 1, 1, 1,
-1.134659, 0.5357932, -2.49591, 1, 1, 1, 1, 1,
-1.131893, -1.296028, -1.561269, 1, 1, 1, 1, 1,
-1.125368, 2.722837, -1.142438, 0, 0, 1, 1, 1,
-1.12536, -0.1637398, -0.24345, 1, 0, 0, 1, 1,
-1.112766, -1.45974, -2.360691, 1, 0, 0, 1, 1,
-1.108091, -0.2815869, -0.8423458, 1, 0, 0, 1, 1,
-1.106958, -0.9090239, -4.839672, 1, 0, 0, 1, 1,
-1.106351, 0.6422743, 0.144058, 1, 0, 0, 1, 1,
-1.099446, 0.3359614, -0.8567597, 0, 0, 0, 1, 1,
-1.093179, 0.4084648, -1.747802, 0, 0, 0, 1, 1,
-1.08944, -0.9575335, -0.02112482, 0, 0, 0, 1, 1,
-1.088295, 1.024554, -1.074937, 0, 0, 0, 1, 1,
-1.086994, 0.4603366, -1.157194, 0, 0, 0, 1, 1,
-1.086848, -0.4139166, -2.591423, 0, 0, 0, 1, 1,
-1.084469, 0.3792422, -0.17773, 0, 0, 0, 1, 1,
-1.078594, -0.04341764, -0.9564158, 1, 1, 1, 1, 1,
-1.050178, 0.06036417, -0.7706025, 1, 1, 1, 1, 1,
-1.047895, 0.3638571, -2.678681, 1, 1, 1, 1, 1,
-1.043245, 0.9079773, -0.5897753, 1, 1, 1, 1, 1,
-1.036703, 0.2135649, -0.8649498, 1, 1, 1, 1, 1,
-1.03639, -0.9363257, -0.8503498, 1, 1, 1, 1, 1,
-1.035771, -2.33908, -3.119122, 1, 1, 1, 1, 1,
-1.034629, -0.3808296, -3.120387, 1, 1, 1, 1, 1,
-1.032268, 0.4100084, -2.230335, 1, 1, 1, 1, 1,
-1.028098, -0.5966288, -1.027022, 1, 1, 1, 1, 1,
-1.010648, -0.983982, -1.226672, 1, 1, 1, 1, 1,
-0.9997488, 1.423888, -0.923124, 1, 1, 1, 1, 1,
-0.9916667, -0.2184691, -2.054306, 1, 1, 1, 1, 1,
-0.9912465, 0.0008024464, -1.336653, 1, 1, 1, 1, 1,
-0.987038, 1.04952, -0.01267015, 1, 1, 1, 1, 1,
-0.9834028, 0.2343816, -1.87281, 0, 0, 1, 1, 1,
-0.9762775, -1.308982, -2.110164, 1, 0, 0, 1, 1,
-0.9739789, 1.555645, -0.9455186, 1, 0, 0, 1, 1,
-0.9606562, 0.779727, -0.7047921, 1, 0, 0, 1, 1,
-0.9533817, -0.1171908, -1.245073, 1, 0, 0, 1, 1,
-0.9358031, 1.87989, -1.984385, 1, 0, 0, 1, 1,
-0.9346575, -0.6725476, -1.19183, 0, 0, 0, 1, 1,
-0.9259553, 0.2727136, -0.8947141, 0, 0, 0, 1, 1,
-0.9259216, 0.4367773, -1.946327, 0, 0, 0, 1, 1,
-0.9239031, 0.4823924, -1.434385, 0, 0, 0, 1, 1,
-0.91533, 0.2527699, -2.268953, 0, 0, 0, 1, 1,
-0.9149584, 0.671504, -0.7285837, 0, 0, 0, 1, 1,
-0.9114322, -1.081506, -3.577312, 0, 0, 0, 1, 1,
-0.9099314, -0.2252732, -3.257327, 1, 1, 1, 1, 1,
-0.9089596, -0.8745656, -1.951405, 1, 1, 1, 1, 1,
-0.9023747, 1.152955, -0.8159518, 1, 1, 1, 1, 1,
-0.8987263, -1.295899, -2.314004, 1, 1, 1, 1, 1,
-0.8958219, 0.6005158, -0.4540872, 1, 1, 1, 1, 1,
-0.881556, -0.4308372, -1.581038, 1, 1, 1, 1, 1,
-0.876068, -0.5613449, -2.192668, 1, 1, 1, 1, 1,
-0.8750409, 0.6841583, -2.259474, 1, 1, 1, 1, 1,
-0.8745096, -0.5809335, -1.748064, 1, 1, 1, 1, 1,
-0.8639259, 0.8870507, 0.003464723, 1, 1, 1, 1, 1,
-0.8598972, 0.3629115, -2.727006, 1, 1, 1, 1, 1,
-0.8584663, -1.812497, -2.538052, 1, 1, 1, 1, 1,
-0.8506133, -0.7182578, -2.119949, 1, 1, 1, 1, 1,
-0.8487907, -0.9175391, -1.10673, 1, 1, 1, 1, 1,
-0.846152, -1.412582, -1.079895, 1, 1, 1, 1, 1,
-0.8434781, 0.466361, -0.8727674, 0, 0, 1, 1, 1,
-0.8390135, -1.162185, -2.270889, 1, 0, 0, 1, 1,
-0.8366226, -0.2008112, -2.095268, 1, 0, 0, 1, 1,
-0.8334866, 1.006446, 0.05044588, 1, 0, 0, 1, 1,
-0.8205262, -0.8136529, -3.08394, 1, 0, 0, 1, 1,
-0.8118768, 0.4880776, 0.0245085, 1, 0, 0, 1, 1,
-0.8064662, -2.03868, -1.868958, 0, 0, 0, 1, 1,
-0.8053058, -0.7005912, -2.918232, 0, 0, 0, 1, 1,
-0.8048235, -0.6820612, -2.692139, 0, 0, 0, 1, 1,
-0.8021073, -0.9076331, -3.583243, 0, 0, 0, 1, 1,
-0.8017207, 0.8781583, 0.4772469, 0, 0, 0, 1, 1,
-0.7975575, 0.2922447, -2.537564, 0, 0, 0, 1, 1,
-0.7927986, 1.015658, -1.817549, 0, 0, 0, 1, 1,
-0.7908483, 1.780209, -1.846266, 1, 1, 1, 1, 1,
-0.7900629, -0.8157831, -2.649301, 1, 1, 1, 1, 1,
-0.7877786, 0.2691953, -1.284654, 1, 1, 1, 1, 1,
-0.7745943, 0.9571439, -1.335697, 1, 1, 1, 1, 1,
-0.7732439, -0.2610697, -1.320339, 1, 1, 1, 1, 1,
-0.7691469, -0.3556265, -2.810077, 1, 1, 1, 1, 1,
-0.7684256, 0.02184255, -1.814627, 1, 1, 1, 1, 1,
-0.7612098, 0.4669079, -1.03923, 1, 1, 1, 1, 1,
-0.760244, 0.74353, -0.5757156, 1, 1, 1, 1, 1,
-0.7598301, 0.1475002, -2.086426, 1, 1, 1, 1, 1,
-0.7530372, -0.6384348, -1.982028, 1, 1, 1, 1, 1,
-0.7524281, 0.5436773, -1.380999, 1, 1, 1, 1, 1,
-0.7485417, -0.7342146, -2.858122, 1, 1, 1, 1, 1,
-0.7484587, 1.320151, -1.42556, 1, 1, 1, 1, 1,
-0.7441357, -1.251627, -0.2780033, 1, 1, 1, 1, 1,
-0.7363408, -1.986784, -2.73777, 0, 0, 1, 1, 1,
-0.7321039, -0.0100298, -1.727617, 1, 0, 0, 1, 1,
-0.7295272, 1.61674, -0.7251501, 1, 0, 0, 1, 1,
-0.7284196, 0.8530412, -0.8685468, 1, 0, 0, 1, 1,
-0.7260414, 1.377351, -1.039523, 1, 0, 0, 1, 1,
-0.7194257, 0.5506245, -0.3002201, 1, 0, 0, 1, 1,
-0.6966666, -1.326209, -1.766535, 0, 0, 0, 1, 1,
-0.6869524, 0.1582534, -1.348183, 0, 0, 0, 1, 1,
-0.6865395, 1.72539, 0.9267063, 0, 0, 0, 1, 1,
-0.6854346, -0.6586821, -1.625854, 0, 0, 0, 1, 1,
-0.6852546, 0.825152, -1.029798, 0, 0, 0, 1, 1,
-0.6799207, 1.143381, 0.3426854, 0, 0, 0, 1, 1,
-0.678728, 0.6796828, 0.1527726, 0, 0, 0, 1, 1,
-0.6761565, 1.303707, -0.6645479, 1, 1, 1, 1, 1,
-0.670948, 1.585995, -0.4695902, 1, 1, 1, 1, 1,
-0.6620572, 0.02823855, -2.917435, 1, 1, 1, 1, 1,
-0.6620247, -2.116824, -2.312487, 1, 1, 1, 1, 1,
-0.6606437, -1.838651, -3.378893, 1, 1, 1, 1, 1,
-0.658361, 1.398969, -1.891357, 1, 1, 1, 1, 1,
-0.6576889, 0.2315523, -1.42875, 1, 1, 1, 1, 1,
-0.6489131, -0.2558169, -1.578016, 1, 1, 1, 1, 1,
-0.6455104, 0.5265819, -0.4175242, 1, 1, 1, 1, 1,
-0.6442434, 0.8179582, 0.0311923, 1, 1, 1, 1, 1,
-0.6392877, -0.4902363, -0.1595891, 1, 1, 1, 1, 1,
-0.631179, -0.3916378, -2.109319, 1, 1, 1, 1, 1,
-0.6208177, 1.037177, -1.250364, 1, 1, 1, 1, 1,
-0.6153873, -0.957078, -3.352108, 1, 1, 1, 1, 1,
-0.6121423, 0.391118, -1.171226, 1, 1, 1, 1, 1,
-0.6087973, 0.536895, -1.387179, 0, 0, 1, 1, 1,
-0.6074234, -0.4447751, -2.160098, 1, 0, 0, 1, 1,
-0.6040115, -0.86751, -3.186538, 1, 0, 0, 1, 1,
-0.5960414, -0.7244548, -1.257078, 1, 0, 0, 1, 1,
-0.5887258, -0.5822029, -1.689675, 1, 0, 0, 1, 1,
-0.5869214, -0.6774511, -1.960348, 1, 0, 0, 1, 1,
-0.5867809, -0.00558411, -0.9432173, 0, 0, 0, 1, 1,
-0.5843756, -0.5952233, -3.416721, 0, 0, 0, 1, 1,
-0.5828218, -0.2435106, -0.5838183, 0, 0, 0, 1, 1,
-0.581549, -1.358127, -1.051983, 0, 0, 0, 1, 1,
-0.5760759, -0.8797159, -1.361261, 0, 0, 0, 1, 1,
-0.5750864, 0.3534235, -1.556099, 0, 0, 0, 1, 1,
-0.5739409, 0.8974729, -0.2793162, 0, 0, 0, 1, 1,
-0.5680348, 1.763805, -0.01042058, 1, 1, 1, 1, 1,
-0.5578166, -0.6174396, -3.65135, 1, 1, 1, 1, 1,
-0.5487008, 0.2586385, -2.543816, 1, 1, 1, 1, 1,
-0.5484222, -0.5991434, -2.851435, 1, 1, 1, 1, 1,
-0.5463394, -0.9507415, -4.846443, 1, 1, 1, 1, 1,
-0.5451853, -0.1501274, -1.012022, 1, 1, 1, 1, 1,
-0.5423597, 0.05534912, -2.336651, 1, 1, 1, 1, 1,
-0.5331455, -0.4514566, -2.053355, 1, 1, 1, 1, 1,
-0.5287164, -0.6726137, -3.161214, 1, 1, 1, 1, 1,
-0.5253715, 0.7158068, 0.4455654, 1, 1, 1, 1, 1,
-0.5252135, 0.3423032, -0.9395632, 1, 1, 1, 1, 1,
-0.5234939, -1.668143, -3.088365, 1, 1, 1, 1, 1,
-0.5215691, 0.6571544, -0.06364062, 1, 1, 1, 1, 1,
-0.5092503, -0.1058447, 0.2583449, 1, 1, 1, 1, 1,
-0.5081161, 0.4453908, -1.511147, 1, 1, 1, 1, 1,
-0.5075141, -1.888704, -1.782732, 0, 0, 1, 1, 1,
-0.503935, -1.350848, -1.225982, 1, 0, 0, 1, 1,
-0.503779, 0.1377656, -0.9274459, 1, 0, 0, 1, 1,
-0.5032101, -0.3066331, -2.051436, 1, 0, 0, 1, 1,
-0.5016113, -0.5724953, -1.312967, 1, 0, 0, 1, 1,
-0.494226, 0.3198476, -2.551364, 1, 0, 0, 1, 1,
-0.4891755, -1.556831, -3.10863, 0, 0, 0, 1, 1,
-0.4865532, -1.767861, -4.083038, 0, 0, 0, 1, 1,
-0.4845427, -0.5580516, -2.430683, 0, 0, 0, 1, 1,
-0.4818747, -0.683197, -1.10534, 0, 0, 0, 1, 1,
-0.4801072, 0.6408899, -2.049838, 0, 0, 0, 1, 1,
-0.4751509, -0.6977195, -2.345704, 0, 0, 0, 1, 1,
-0.4697425, 0.8010309, -1.534839, 0, 0, 0, 1, 1,
-0.4681495, -0.638017, -2.581396, 1, 1, 1, 1, 1,
-0.4680848, -1.449584, -1.383616, 1, 1, 1, 1, 1,
-0.4644036, 2.227998, -1.028722, 1, 1, 1, 1, 1,
-0.4592772, -0.7666847, -2.117372, 1, 1, 1, 1, 1,
-0.457009, -0.5965951, -2.184043, 1, 1, 1, 1, 1,
-0.4540809, -0.470139, -2.683624, 1, 1, 1, 1, 1,
-0.4538106, 1.906636, -1.189048, 1, 1, 1, 1, 1,
-0.4510727, 0.8530923, -0.2916808, 1, 1, 1, 1, 1,
-0.4462216, -1.613653, -2.96793, 1, 1, 1, 1, 1,
-0.4460962, 0.3564586, -2.080437, 1, 1, 1, 1, 1,
-0.4450339, -0.6827961, -2.051154, 1, 1, 1, 1, 1,
-0.4436235, 0.394848, 0.0850556, 1, 1, 1, 1, 1,
-0.4433043, -0.6973869, -4.19971, 1, 1, 1, 1, 1,
-0.4395621, -0.2476843, -2.047238, 1, 1, 1, 1, 1,
-0.4360639, 0.01568359, 0.2523837, 1, 1, 1, 1, 1,
-0.4354576, 0.3363491, -0.4660931, 0, 0, 1, 1, 1,
-0.4319286, 1.409836, -0.552081, 1, 0, 0, 1, 1,
-0.4311233, 0.6363856, -0.04163861, 1, 0, 0, 1, 1,
-0.4280085, 0.2835191, -1.414364, 1, 0, 0, 1, 1,
-0.4259723, 0.402654, 0.03799781, 1, 0, 0, 1, 1,
-0.4220867, -0.2492815, -1.762412, 1, 0, 0, 1, 1,
-0.4165567, 2.137617, -0.9286963, 0, 0, 0, 1, 1,
-0.4129849, 0.03499683, -0.8683609, 0, 0, 0, 1, 1,
-0.4117867, 1.018829, -0.08606452, 0, 0, 0, 1, 1,
-0.4093749, 0.7356329, -0.68625, 0, 0, 0, 1, 1,
-0.4086664, -0.4061382, -2.763716, 0, 0, 0, 1, 1,
-0.4020428, 0.4554202, 0.5342163, 0, 0, 0, 1, 1,
-0.3980036, 0.7915836, -0.4091974, 0, 0, 0, 1, 1,
-0.3841867, -1.008779, -2.002499, 1, 1, 1, 1, 1,
-0.37762, -0.2590592, -1.535473, 1, 1, 1, 1, 1,
-0.3762412, -0.6764622, -2.858227, 1, 1, 1, 1, 1,
-0.3671913, 0.392142, 1.077306, 1, 1, 1, 1, 1,
-0.3669662, -0.147535, -2.50482, 1, 1, 1, 1, 1,
-0.365312, -1.326808, -1.699841, 1, 1, 1, 1, 1,
-0.3640455, 0.4248064, -0.3823361, 1, 1, 1, 1, 1,
-0.3624111, -0.233817, -2.955596, 1, 1, 1, 1, 1,
-0.3593718, 1.246223, 0.9343746, 1, 1, 1, 1, 1,
-0.3575409, 0.7767343, -1.110835, 1, 1, 1, 1, 1,
-0.3574177, 1.464154, -0.9724631, 1, 1, 1, 1, 1,
-0.3539581, -0.09758306, -2.254687, 1, 1, 1, 1, 1,
-0.3510769, -1.239501, -3.928298, 1, 1, 1, 1, 1,
-0.3464344, 2.764738, -0.3573743, 1, 1, 1, 1, 1,
-0.3452421, -0.7355249, -3.736194, 1, 1, 1, 1, 1,
-0.3391958, -0.224363, -0.6380906, 0, 0, 1, 1, 1,
-0.3344944, -0.5362267, -0.7557515, 1, 0, 0, 1, 1,
-0.3334618, 0.2465174, -0.4757086, 1, 0, 0, 1, 1,
-0.3273312, -0.3667171, -2.097952, 1, 0, 0, 1, 1,
-0.3272724, -0.916253, -2.31433, 1, 0, 0, 1, 1,
-0.3262385, 0.6706296, -1.476226, 1, 0, 0, 1, 1,
-0.3254372, -1.20813, -2.436621, 0, 0, 0, 1, 1,
-0.3231939, 1.696089, 1.913043, 0, 0, 0, 1, 1,
-0.3166383, -0.3244668, -1.2096, 0, 0, 0, 1, 1,
-0.3146055, -0.07856911, -3.008027, 0, 0, 0, 1, 1,
-0.3139217, -1.968555, -4.311362, 0, 0, 0, 1, 1,
-0.308059, -0.02620889, -0.1879374, 0, 0, 0, 1, 1,
-0.3054992, -0.3872003, -3.793745, 0, 0, 0, 1, 1,
-0.3053896, 0.7893938, 0.1942152, 1, 1, 1, 1, 1,
-0.3033626, -0.2560117, -3.358191, 1, 1, 1, 1, 1,
-0.3031981, -0.6890598, -2.495846, 1, 1, 1, 1, 1,
-0.3018901, 0.2430275, -0.2486343, 1, 1, 1, 1, 1,
-0.2996275, -0.380531, -2.705473, 1, 1, 1, 1, 1,
-0.2946788, -0.3155695, -2.943353, 1, 1, 1, 1, 1,
-0.2894562, 0.3517971, -0.3153022, 1, 1, 1, 1, 1,
-0.2888913, 0.9880842, 0.1859759, 1, 1, 1, 1, 1,
-0.2817425, -0.2940001, -1.259541, 1, 1, 1, 1, 1,
-0.278174, 0.04435017, -0.3426878, 1, 1, 1, 1, 1,
-0.2711338, -0.8545908, -2.938744, 1, 1, 1, 1, 1,
-0.2684311, 1.211941, 1.247449, 1, 1, 1, 1, 1,
-0.2684162, 0.6217417, 0.2933118, 1, 1, 1, 1, 1,
-0.2678218, 0.6902994, -0.04972223, 1, 1, 1, 1, 1,
-0.2653652, -1.000662, -3.088633, 1, 1, 1, 1, 1,
-0.2652244, -0.8534502, -3.282632, 0, 0, 1, 1, 1,
-0.2642066, 1.417309, 0.873884, 1, 0, 0, 1, 1,
-0.2607441, -0.44515, -3.750362, 1, 0, 0, 1, 1,
-0.2459019, -1.137381, -1.503345, 1, 0, 0, 1, 1,
-0.2431597, 2.500829, -0.06241185, 1, 0, 0, 1, 1,
-0.2424771, 0.01783882, -1.637374, 1, 0, 0, 1, 1,
-0.2390445, 0.4434536, -0.1803554, 0, 0, 0, 1, 1,
-0.2390009, -0.3560376, -3.368644, 0, 0, 0, 1, 1,
-0.2378829, -0.1457242, -2.610712, 0, 0, 0, 1, 1,
-0.2342805, 0.5885644, -0.1703633, 0, 0, 0, 1, 1,
-0.2340764, -0.9696139, -3.949768, 0, 0, 0, 1, 1,
-0.2318503, -0.289077, -1.769502, 0, 0, 0, 1, 1,
-0.2304936, -0.3209648, -1.636974, 0, 0, 0, 1, 1,
-0.2295154, -0.9439486, -2.019947, 1, 1, 1, 1, 1,
-0.2210746, 1.670863, -0.02033482, 1, 1, 1, 1, 1,
-0.2200699, -0.9527915, -3.506734, 1, 1, 1, 1, 1,
-0.2174212, 0.1149953, 0.1646427, 1, 1, 1, 1, 1,
-0.2145162, -1.581352, -2.714035, 1, 1, 1, 1, 1,
-0.2106684, -0.3756262, -1.170147, 1, 1, 1, 1, 1,
-0.2084463, -0.7764319, -1.631499, 1, 1, 1, 1, 1,
-0.206878, 0.1872199, -0.1704287, 1, 1, 1, 1, 1,
-0.2053307, 0.7369639, 0.1044181, 1, 1, 1, 1, 1,
-0.2051064, 0.2910023, 0.3469201, 1, 1, 1, 1, 1,
-0.2042068, -1.268323, -2.424091, 1, 1, 1, 1, 1,
-0.2026131, -0.1137872, -1.438603, 1, 1, 1, 1, 1,
-0.1978209, -0.143626, -2.470587, 1, 1, 1, 1, 1,
-0.1915796, -1.005034, -2.798694, 1, 1, 1, 1, 1,
-0.1856167, -1.254558, -3.23459, 1, 1, 1, 1, 1,
-0.1855261, -0.6502024, -2.277993, 0, 0, 1, 1, 1,
-0.1853921, 0.878862, -0.2063333, 1, 0, 0, 1, 1,
-0.174413, 0.278192, -2.163481, 1, 0, 0, 1, 1,
-0.1730244, 0.06570526, -0.09071511, 1, 0, 0, 1, 1,
-0.1662181, -0.7047288, -2.587773, 1, 0, 0, 1, 1,
-0.165885, 0.3509554, -1.106487, 1, 0, 0, 1, 1,
-0.1567958, -0.6895791, -3.872325, 0, 0, 0, 1, 1,
-0.1567662, 0.6586607, 0.8622515, 0, 0, 0, 1, 1,
-0.1567658, -0.756282, -1.624816, 0, 0, 0, 1, 1,
-0.1543577, -0.01922924, -0.2272643, 0, 0, 0, 1, 1,
-0.1522411, 0.9626663, -0.2339537, 0, 0, 0, 1, 1,
-0.1505098, 0.1973386, -0.8487923, 0, 0, 0, 1, 1,
-0.1460066, 0.4295315, -1.346727, 0, 0, 0, 1, 1,
-0.1439444, 0.1621536, -0.5662075, 1, 1, 1, 1, 1,
-0.1428436, -0.8359917, -4.168068, 1, 1, 1, 1, 1,
-0.1348902, -1.827433, -2.305245, 1, 1, 1, 1, 1,
-0.1336087, -0.1328884, -1.818798, 1, 1, 1, 1, 1,
-0.133345, 0.7591916, -0.685709, 1, 1, 1, 1, 1,
-0.133215, 0.6132693, 1.074066, 1, 1, 1, 1, 1,
-0.1254413, 1.246021, -0.05478034, 1, 1, 1, 1, 1,
-0.125044, -0.8183969, -3.283306, 1, 1, 1, 1, 1,
-0.1210793, -1.159383, -2.377687, 1, 1, 1, 1, 1,
-0.1152578, 0.1133347, -1.366814, 1, 1, 1, 1, 1,
-0.1150486, 1.561806, 0.4255078, 1, 1, 1, 1, 1,
-0.1128065, 0.8940545, -1.217388, 1, 1, 1, 1, 1,
-0.106944, 1.569753, 1.51709, 1, 1, 1, 1, 1,
-0.1062947, -0.2376281, -2.83793, 1, 1, 1, 1, 1,
-0.1005338, -1.944812, -3.591796, 1, 1, 1, 1, 1,
-0.09871042, -0.7195974, -2.252309, 0, 0, 1, 1, 1,
-0.09750364, -0.5161254, -2.493706, 1, 0, 0, 1, 1,
-0.09576888, -0.9520171, -3.710577, 1, 0, 0, 1, 1,
-0.09416003, -1.87478, -2.182781, 1, 0, 0, 1, 1,
-0.09240768, -0.2838591, -2.191351, 1, 0, 0, 1, 1,
-0.09208441, 1.997683, 0.4777346, 1, 0, 0, 1, 1,
-0.09175188, 0.5682532, -0.7857708, 0, 0, 0, 1, 1,
-0.09097122, 0.3301073, -0.7986915, 0, 0, 0, 1, 1,
-0.08226284, 1.13451, -0.4125865, 0, 0, 0, 1, 1,
-0.08042628, 0.6236969, -0.9212806, 0, 0, 0, 1, 1,
-0.08028198, -1.729487, -1.820584, 0, 0, 0, 1, 1,
-0.07533726, -0.4132575, -3.803214, 0, 0, 0, 1, 1,
-0.07519063, 1.249193, -0.2380221, 0, 0, 0, 1, 1,
-0.07212756, -0.3303823, -2.654934, 1, 1, 1, 1, 1,
-0.0714236, 0.4905726, 0.1187537, 1, 1, 1, 1, 1,
-0.06823359, 0.479212, -0.199642, 1, 1, 1, 1, 1,
-0.06817074, -0.1754339, -2.04548, 1, 1, 1, 1, 1,
-0.06588323, 1.011002, 0.5139735, 1, 1, 1, 1, 1,
-0.06475431, -0.5046895, -3.924173, 1, 1, 1, 1, 1,
-0.06245306, -0.1844737, -4.502508, 1, 1, 1, 1, 1,
-0.06191574, -0.8869401, -1.575197, 1, 1, 1, 1, 1,
-0.06046486, -1.000204, -2.487573, 1, 1, 1, 1, 1,
-0.05993434, -1.590627, -3.82069, 1, 1, 1, 1, 1,
-0.05920469, 0.3744561, 1.225713, 1, 1, 1, 1, 1,
-0.05780555, -0.02640313, -2.281316, 1, 1, 1, 1, 1,
-0.05689336, 0.8556573, 0.09071728, 1, 1, 1, 1, 1,
-0.05501546, 1.30578, 0.5290976, 1, 1, 1, 1, 1,
-0.05453917, -1.066985, -4.302679, 1, 1, 1, 1, 1,
-0.05446739, -0.3609315, -2.265952, 0, 0, 1, 1, 1,
-0.04811313, -1.171221, -3.376044, 1, 0, 0, 1, 1,
-0.04562804, -2.194716, -3.139964, 1, 0, 0, 1, 1,
-0.04441218, -0.8185307, -2.875756, 1, 0, 0, 1, 1,
-0.04206177, -1.432756, -3.6104, 1, 0, 0, 1, 1,
-0.03944128, 0.9058079, -0.6485804, 1, 0, 0, 1, 1,
-0.03551175, 0.2981344, -1.517287, 0, 0, 0, 1, 1,
-0.03049429, 0.3331068, -0.310182, 0, 0, 0, 1, 1,
-0.02952533, 0.8205737, -0.514473, 0, 0, 0, 1, 1,
-0.02754621, -0.1332086, -3.17084, 0, 0, 0, 1, 1,
-0.02632664, -0.4478734, -3.557645, 0, 0, 0, 1, 1,
-0.02377254, -0.6478519, -1.916711, 0, 0, 0, 1, 1,
-0.02223457, 0.3699743, -0.8660547, 0, 0, 0, 1, 1,
-0.02215731, 0.4041208, 0.9588971, 1, 1, 1, 1, 1,
-0.01861626, -0.7593234, -2.15574, 1, 1, 1, 1, 1,
-0.0150192, 0.4692262, -0.4868695, 1, 1, 1, 1, 1,
-0.01447434, 1.120924, 1.05988, 1, 1, 1, 1, 1,
-0.01312875, -0.8972864, -2.518346, 1, 1, 1, 1, 1,
-0.01277352, 0.1622476, 0.3819088, 1, 1, 1, 1, 1,
-0.005085237, -0.6276748, -2.884982, 1, 1, 1, 1, 1,
-0.00309411, 0.1880411, 0.1708471, 1, 1, 1, 1, 1,
-0.0005547188, 0.1243796, -2.313278, 1, 1, 1, 1, 1,
0.007112199, 1.140005, -0.7734436, 1, 1, 1, 1, 1,
0.01232885, 2.035807, 0.2007724, 1, 1, 1, 1, 1,
0.01311139, -0.2364586, 3.333069, 1, 1, 1, 1, 1,
0.01357462, 0.6290265, -0.1004022, 1, 1, 1, 1, 1,
0.0159522, -0.6328942, 1.813475, 1, 1, 1, 1, 1,
0.01609251, 1.855355, 0.01550783, 1, 1, 1, 1, 1,
0.01841804, 1.07202, 0.7799692, 0, 0, 1, 1, 1,
0.01929357, -0.2939635, 2.780994, 1, 0, 0, 1, 1,
0.02085072, -0.415283, 3.088074, 1, 0, 0, 1, 1,
0.02339987, 0.904258, 0.1556769, 1, 0, 0, 1, 1,
0.0262447, -1.817648, 1.925793, 1, 0, 0, 1, 1,
0.03163892, 1.129603, 1.049798, 1, 0, 0, 1, 1,
0.04306464, -1.675184, 3.05205, 0, 0, 0, 1, 1,
0.04624046, -2.024742, 2.065728, 0, 0, 0, 1, 1,
0.04905811, -1.182539, 3.3436, 0, 0, 0, 1, 1,
0.05107938, 1.266666, -1.660874, 0, 0, 0, 1, 1,
0.0525062, 1.490667, 2.250577, 0, 0, 0, 1, 1,
0.05425856, -1.553518, 4.894191, 0, 0, 0, 1, 1,
0.05432591, 1.333378, 1.075346, 0, 0, 0, 1, 1,
0.05637069, 0.2472394, -0.6115248, 1, 1, 1, 1, 1,
0.05749408, -1.709287, 2.711792, 1, 1, 1, 1, 1,
0.06627819, 0.3231688, -0.3747503, 1, 1, 1, 1, 1,
0.06996233, 0.01643023, -0.07052767, 1, 1, 1, 1, 1,
0.07190334, -0.02946746, 2.774378, 1, 1, 1, 1, 1,
0.07345904, 0.217868, 0.1795228, 1, 1, 1, 1, 1,
0.07576195, -0.5532653, 2.647395, 1, 1, 1, 1, 1,
0.07676718, -0.0291583, 1.66598, 1, 1, 1, 1, 1,
0.08012136, -0.1299566, 3.47189, 1, 1, 1, 1, 1,
0.08032802, -0.3583785, 4.071877, 1, 1, 1, 1, 1,
0.08270253, -0.4865832, 3.225435, 1, 1, 1, 1, 1,
0.08324219, 0.7734395, 0.3672234, 1, 1, 1, 1, 1,
0.08712115, 0.2480247, 1.363167, 1, 1, 1, 1, 1,
0.0886035, -0.3381029, 3.503415, 1, 1, 1, 1, 1,
0.09146471, 0.7102959, 0.003687477, 1, 1, 1, 1, 1,
0.09379296, 0.6507283, -1.016811, 0, 0, 1, 1, 1,
0.101426, 0.8116249, 1.71112, 1, 0, 0, 1, 1,
0.1044054, -0.2600132, 3.206584, 1, 0, 0, 1, 1,
0.107534, -0.4512902, 2.052847, 1, 0, 0, 1, 1,
0.1082901, -0.4858572, 1.91488, 1, 0, 0, 1, 1,
0.1154586, -0.3038751, 3.86524, 1, 0, 0, 1, 1,
0.1189947, -1.874793, 1.606298, 0, 0, 0, 1, 1,
0.1205807, 0.102453, 0.3873465, 0, 0, 0, 1, 1,
0.1237423, 0.9211179, 0.2187716, 0, 0, 0, 1, 1,
0.1260387, 1.45818, -0.599233, 0, 0, 0, 1, 1,
0.1268173, -1.145201, 2.813733, 0, 0, 0, 1, 1,
0.1330974, -0.8385662, 3.563025, 0, 0, 0, 1, 1,
0.1337981, 0.9764106, 1.050308, 0, 0, 0, 1, 1,
0.1345726, 0.4339822, 0.2396455, 1, 1, 1, 1, 1,
0.1349823, -0.4180092, 2.265446, 1, 1, 1, 1, 1,
0.1363441, 0.227077, -0.1324186, 1, 1, 1, 1, 1,
0.1387757, -0.3281368, 1.999846, 1, 1, 1, 1, 1,
0.1389385, 0.3484436, -1.356161, 1, 1, 1, 1, 1,
0.1466681, 1.6913, 1.454973, 1, 1, 1, 1, 1,
0.1470128, -0.5215712, 2.701818, 1, 1, 1, 1, 1,
0.1492462, -1.155524, 4.27662, 1, 1, 1, 1, 1,
0.1513101, -0.3214544, 1.937372, 1, 1, 1, 1, 1,
0.1519159, -0.2483018, 3.083877, 1, 1, 1, 1, 1,
0.1532399, -0.4086209, 4.163077, 1, 1, 1, 1, 1,
0.154418, -0.5580313, 2.396052, 1, 1, 1, 1, 1,
0.1592144, -1.176076, 3.337647, 1, 1, 1, 1, 1,
0.1620719, 0.1079326, -0.1408888, 1, 1, 1, 1, 1,
0.1626814, 0.2245174, 0.817291, 1, 1, 1, 1, 1,
0.163522, -0.7661895, 2.440263, 0, 0, 1, 1, 1,
0.1709648, 1.520913, 0.9598319, 1, 0, 0, 1, 1,
0.174711, -1.378658, 4.426259, 1, 0, 0, 1, 1,
0.1754786, 1.135127, -1.060673, 1, 0, 0, 1, 1,
0.1762868, -0.5095757, 3.139671, 1, 0, 0, 1, 1,
0.1778332, 0.615459, -0.9098857, 1, 0, 0, 1, 1,
0.1795288, -1.066564, 3.412907, 0, 0, 0, 1, 1,
0.1823575, -0.2532921, 2.110674, 0, 0, 0, 1, 1,
0.1949326, -0.3365521, 2.929433, 0, 0, 0, 1, 1,
0.1970737, 0.5521166, 0.5198988, 0, 0, 0, 1, 1,
0.2001074, 0.7102078, -0.4526614, 0, 0, 0, 1, 1,
0.2050424, 1.25059, -0.3761258, 0, 0, 0, 1, 1,
0.2127152, -0.3762423, 0.6417304, 0, 0, 0, 1, 1,
0.2131173, 0.4421693, -0.9121113, 1, 1, 1, 1, 1,
0.2136162, -0.2685342, 3.578481, 1, 1, 1, 1, 1,
0.2165787, -0.634197, 2.350266, 1, 1, 1, 1, 1,
0.2197975, 1.074779, -0.5259361, 1, 1, 1, 1, 1,
0.2203949, -0.5688822, 1.606491, 1, 1, 1, 1, 1,
0.227355, 0.2824786, 0.8031077, 1, 1, 1, 1, 1,
0.2338148, -0.354743, 1.473622, 1, 1, 1, 1, 1,
0.2348922, -0.3757696, 1.997595, 1, 1, 1, 1, 1,
0.2349773, 1.30756, 0.2894022, 1, 1, 1, 1, 1,
0.2510685, -0.9553151, 4.644825, 1, 1, 1, 1, 1,
0.2546319, -1.059774, 3.615739, 1, 1, 1, 1, 1,
0.2567949, -0.7513389, 3.188822, 1, 1, 1, 1, 1,
0.2605967, 0.5031558, 1.142717, 1, 1, 1, 1, 1,
0.26134, 0.5372369, 0.1064829, 1, 1, 1, 1, 1,
0.2628838, -1.288507, 3.274341, 1, 1, 1, 1, 1,
0.2640207, -0.3764244, 2.285472, 0, 0, 1, 1, 1,
0.2642063, 1.069211, -0.1686128, 1, 0, 0, 1, 1,
0.2673689, -0.609548, 2.544262, 1, 0, 0, 1, 1,
0.2682141, -0.1128235, 0.3184758, 1, 0, 0, 1, 1,
0.2770706, -0.3893241, 2.356094, 1, 0, 0, 1, 1,
0.2781417, -2.077607, 1.640242, 1, 0, 0, 1, 1,
0.2791473, 0.02548733, 2.719891, 0, 0, 0, 1, 1,
0.2813319, 0.4082951, 0.03281218, 0, 0, 0, 1, 1,
0.2830118, 0.1468996, -0.1797146, 0, 0, 0, 1, 1,
0.2851843, 0.204238, -0.1439373, 0, 0, 0, 1, 1,
0.2855793, -2.06327, 3.090285, 0, 0, 0, 1, 1,
0.2885673, -0.7620244, 3.20572, 0, 0, 0, 1, 1,
0.2933228, -0.5069215, 2.423499, 0, 0, 0, 1, 1,
0.2949941, 1.405243, 1.421381, 1, 1, 1, 1, 1,
0.2956538, -0.1038127, 1.48602, 1, 1, 1, 1, 1,
0.2959037, 0.1462908, 0.7096815, 1, 1, 1, 1, 1,
0.3004468, -0.9464775, 3.921294, 1, 1, 1, 1, 1,
0.3030338, 0.1725272, 0.1086314, 1, 1, 1, 1, 1,
0.3047729, -0.7821953, 1.523564, 1, 1, 1, 1, 1,
0.3114122, 0.01787987, -0.01046462, 1, 1, 1, 1, 1,
0.3128254, 1.041237, -0.3381107, 1, 1, 1, 1, 1,
0.3146993, 0.2215791, 0.7393263, 1, 1, 1, 1, 1,
0.3157839, -0.05121984, 2.819418, 1, 1, 1, 1, 1,
0.3169034, -0.9852989, 3.021166, 1, 1, 1, 1, 1,
0.3239849, 0.3182081, 1.085333, 1, 1, 1, 1, 1,
0.3242541, -0.0401465, 4.650968, 1, 1, 1, 1, 1,
0.3272551, -1.587609, 2.999178, 1, 1, 1, 1, 1,
0.3284968, 0.7044558, 2.621485, 1, 1, 1, 1, 1,
0.3303011, 0.01886691, 1.868975, 0, 0, 1, 1, 1,
0.3337449, 1.529517, -2.906967, 1, 0, 0, 1, 1,
0.3352988, -2.162271, 3.561788, 1, 0, 0, 1, 1,
0.3359899, -0.6396315, 3.443874, 1, 0, 0, 1, 1,
0.3392834, 0.946793, -1.756366, 1, 0, 0, 1, 1,
0.3404892, 0.2563285, 0.1411833, 1, 0, 0, 1, 1,
0.3429508, -1.025578, 3.371283, 0, 0, 0, 1, 1,
0.3453822, -0.5853413, 0.7151929, 0, 0, 0, 1, 1,
0.3459646, -1.010049, 1.515713, 0, 0, 0, 1, 1,
0.3462835, 2.265572, -1.431015, 0, 0, 0, 1, 1,
0.3464812, -0.4394638, 0.4852546, 0, 0, 0, 1, 1,
0.3497186, -0.6504058, 1.470984, 0, 0, 0, 1, 1,
0.3499705, 1.260997, -0.9121094, 0, 0, 0, 1, 1,
0.3507895, -3.044174, 2.160833, 1, 1, 1, 1, 1,
0.3519719, 0.682582, 1.189718, 1, 1, 1, 1, 1,
0.3603684, 1.633972, 0.3605101, 1, 1, 1, 1, 1,
0.3605149, 1.427565, -0.2160243, 1, 1, 1, 1, 1,
0.3662327, -0.7674952, 3.080028, 1, 1, 1, 1, 1,
0.3672356, -1.104352, 3.308583, 1, 1, 1, 1, 1,
0.3673728, -1.900596, 2.833374, 1, 1, 1, 1, 1,
0.3679468, 0.9287197, 0.7854883, 1, 1, 1, 1, 1,
0.3684196, 1.327332, -0.8686625, 1, 1, 1, 1, 1,
0.3688703, -2.408897, 4.373592, 1, 1, 1, 1, 1,
0.3690257, 0.005969755, 2.303507, 1, 1, 1, 1, 1,
0.3692907, 1.296172, 0.7230905, 1, 1, 1, 1, 1,
0.3704196, -0.3900955, 2.644896, 1, 1, 1, 1, 1,
0.3705616, 1.277828, 0.02549989, 1, 1, 1, 1, 1,
0.3708292, 0.3291948, 1.259871, 1, 1, 1, 1, 1,
0.3732017, -0.2293213, 2.589951, 0, 0, 1, 1, 1,
0.3742551, -2.248109, 5.65393, 1, 0, 0, 1, 1,
0.376616, 0.7208394, 0.3171614, 1, 0, 0, 1, 1,
0.3853588, -1.440678, 3.388622, 1, 0, 0, 1, 1,
0.3893909, 0.9794837, 0.7438446, 1, 0, 0, 1, 1,
0.3937382, 0.9163588, 0.6672289, 1, 0, 0, 1, 1,
0.3945367, -0.3867896, 2.801248, 0, 0, 0, 1, 1,
0.3965266, 0.01909152, 0.6863463, 0, 0, 0, 1, 1,
0.4010721, 1.118419, -0.313462, 0, 0, 0, 1, 1,
0.4043235, 0.745842, 1.004995, 0, 0, 0, 1, 1,
0.4115283, 0.217764, -0.5871357, 0, 0, 0, 1, 1,
0.4141403, 0.7273923, 0.6786678, 0, 0, 0, 1, 1,
0.4163285, -0.004119403, 2.246485, 0, 0, 0, 1, 1,
0.416625, -0.4111547, 1.17095, 1, 1, 1, 1, 1,
0.4185208, 1.039969, 1.003041, 1, 1, 1, 1, 1,
0.4209257, 0.7369956, 0.414587, 1, 1, 1, 1, 1,
0.4253585, 2.122846, 1.154158, 1, 1, 1, 1, 1,
0.4263606, -0.35359, 3.100139, 1, 1, 1, 1, 1,
0.426631, 1.933022, 1.20235, 1, 1, 1, 1, 1,
0.4287333, 0.602439, -0.7703487, 1, 1, 1, 1, 1,
0.4305888, -1.707514, 3.611352, 1, 1, 1, 1, 1,
0.4315642, -0.5208732, 2.355295, 1, 1, 1, 1, 1,
0.433498, 0.6262847, 0.2598255, 1, 1, 1, 1, 1,
0.4374145, 0.2573804, 0.8553811, 1, 1, 1, 1, 1,
0.4414801, -0.8598528, 3.858465, 1, 1, 1, 1, 1,
0.4485418, 0.1523859, 0.9203638, 1, 1, 1, 1, 1,
0.4486649, 1.023484, 1.414184, 1, 1, 1, 1, 1,
0.4586631, -1.484821, -0.5137284, 1, 1, 1, 1, 1,
0.4613974, 0.1090793, 2.258375, 0, 0, 1, 1, 1,
0.4629321, 2.431689, 0.4516289, 1, 0, 0, 1, 1,
0.4631332, -0.1191326, 1.738599, 1, 0, 0, 1, 1,
0.4645929, 0.5041695, 1.967888, 1, 0, 0, 1, 1,
0.4656976, 1.135615, 2.086869, 1, 0, 0, 1, 1,
0.4678138, 0.7233845, 0.06769613, 1, 0, 0, 1, 1,
0.4724989, -0.984542, 2.753839, 0, 0, 0, 1, 1,
0.472978, -0.6622148, 1.79571, 0, 0, 0, 1, 1,
0.4800422, 0.431086, 0.3922538, 0, 0, 0, 1, 1,
0.4812128, 0.1140959, 0.8336505, 0, 0, 0, 1, 1,
0.4812831, 0.908232, -2.552154, 0, 0, 0, 1, 1,
0.4846741, 0.2395808, 1.199974, 0, 0, 0, 1, 1,
0.4858546, -0.1625868, 2.695174, 0, 0, 0, 1, 1,
0.4863499, 0.0187259, 2.984214, 1, 1, 1, 1, 1,
0.4865813, 1.025483, -0.2141532, 1, 1, 1, 1, 1,
0.4873531, 0.2504221, 1.046566, 1, 1, 1, 1, 1,
0.4890016, -0.6330775, 1.353303, 1, 1, 1, 1, 1,
0.490494, 0.09800573, 1.304715, 1, 1, 1, 1, 1,
0.4914881, -0.2290843, 1.95069, 1, 1, 1, 1, 1,
0.4928773, -1.210884, 2.303745, 1, 1, 1, 1, 1,
0.4955915, 0.1536362, 1.647686, 1, 1, 1, 1, 1,
0.4971357, 0.3282194, 1.711198, 1, 1, 1, 1, 1,
0.4995521, 0.8002424, 1.878031, 1, 1, 1, 1, 1,
0.5017335, 0.3449094, 1.751497, 1, 1, 1, 1, 1,
0.5048246, 0.06568976, 0.2556879, 1, 1, 1, 1, 1,
0.5096852, 0.4623299, 2.13146, 1, 1, 1, 1, 1,
0.5116116, -1.257237, 3.175915, 1, 1, 1, 1, 1,
0.5119272, 1.750651, -1.642247, 1, 1, 1, 1, 1,
0.5196061, 0.5001819, -2.058609, 0, 0, 1, 1, 1,
0.520163, 0.5502179, -0.4899576, 1, 0, 0, 1, 1,
0.521067, 0.4323367, 1.055014, 1, 0, 0, 1, 1,
0.5255355, 0.793382, 1.140295, 1, 0, 0, 1, 1,
0.5279436, 0.1133474, 2.451562, 1, 0, 0, 1, 1,
0.534756, 0.1983102, 1.151448, 1, 0, 0, 1, 1,
0.5350782, -0.02458337, 3.056826, 0, 0, 0, 1, 1,
0.5384144, -0.2805911, 2.656727, 0, 0, 0, 1, 1,
0.5427291, 0.6090635, 1.825094, 0, 0, 0, 1, 1,
0.553376, -0.2947564, -0.3266759, 0, 0, 0, 1, 1,
0.5541753, 0.543062, 0.5984114, 0, 0, 0, 1, 1,
0.5556437, 1.070346, -1.011353, 0, 0, 0, 1, 1,
0.5557603, -1.84991, 2.539338, 0, 0, 0, 1, 1,
0.5558745, 0.833243, 0.2639824, 1, 1, 1, 1, 1,
0.5585566, 1.555242, 0.04363435, 1, 1, 1, 1, 1,
0.5642787, 0.6148359, -0.1609196, 1, 1, 1, 1, 1,
0.5653489, -2.506971, 4.275149, 1, 1, 1, 1, 1,
0.5656748, 0.5178387, 1.924289, 1, 1, 1, 1, 1,
0.56625, 1.761651, 0.0278318, 1, 1, 1, 1, 1,
0.5726319, 0.2999626, 1.028639, 1, 1, 1, 1, 1,
0.5737051, 0.2507451, -0.06017087, 1, 1, 1, 1, 1,
0.574827, 1.075756, -0.1391711, 1, 1, 1, 1, 1,
0.5773153, -0.3924883, 0.2847123, 1, 1, 1, 1, 1,
0.5796489, 1.455525, 1.389187, 1, 1, 1, 1, 1,
0.5809167, -0.3222909, 1.169155, 1, 1, 1, 1, 1,
0.5833228, -1.631817, 3.954383, 1, 1, 1, 1, 1,
0.5849018, -1.897597, 2.655999, 1, 1, 1, 1, 1,
0.5850834, 1.027253, 0.3188526, 1, 1, 1, 1, 1,
0.5867774, -1.689544, 4.703041, 0, 0, 1, 1, 1,
0.5914537, -0.7320306, 2.629897, 1, 0, 0, 1, 1,
0.5921966, 0.9804385, 2.505076, 1, 0, 0, 1, 1,
0.5923912, 0.09307821, 2.514077, 1, 0, 0, 1, 1,
0.5955741, -0.4507097, 2.534698, 1, 0, 0, 1, 1,
0.6021758, 1.127676, 0.5403876, 1, 0, 0, 1, 1,
0.6054161, 0.4943444, -0.5441709, 0, 0, 0, 1, 1,
0.60715, -1.194504, 1.603694, 0, 0, 0, 1, 1,
0.608088, -0.00715737, -0.2417085, 0, 0, 0, 1, 1,
0.608713, -1.630251, 3.620692, 0, 0, 0, 1, 1,
0.6140839, -0.9912779, 3.430038, 0, 0, 0, 1, 1,
0.6201056, -1.402685, 3.455378, 0, 0, 0, 1, 1,
0.6251067, 0.3170406, 1.939381, 0, 0, 0, 1, 1,
0.6273392, 2.724786, -1.473931, 1, 1, 1, 1, 1,
0.6292188, 1.149352, -1.263598, 1, 1, 1, 1, 1,
0.6295233, -1.135242, 5.771294, 1, 1, 1, 1, 1,
0.6419535, -0.459226, 1.160178, 1, 1, 1, 1, 1,
0.6487986, -0.4179149, 2.633432, 1, 1, 1, 1, 1,
0.6564845, 1.338132, 0.06085587, 1, 1, 1, 1, 1,
0.6582679, 1.791635, 1.469591, 1, 1, 1, 1, 1,
0.6599113, -0.4145609, 2.720918, 1, 1, 1, 1, 1,
0.6650539, 0.04476089, 2.030873, 1, 1, 1, 1, 1,
0.6670396, -1.107046, 2.321092, 1, 1, 1, 1, 1,
0.668031, -0.09638145, -0.1671707, 1, 1, 1, 1, 1,
0.6723315, 1.045428, -0.8804896, 1, 1, 1, 1, 1,
0.6726304, -1.43911, 1.902962, 1, 1, 1, 1, 1,
0.6733942, -0.1619031, 2.277621, 1, 1, 1, 1, 1,
0.6827538, -0.09677952, 0.6103774, 1, 1, 1, 1, 1,
0.6834098, 0.9758731, 2.478867, 0, 0, 1, 1, 1,
0.6897175, 1.029885, 1.887803, 1, 0, 0, 1, 1,
0.6905577, -0.7097626, 2.203174, 1, 0, 0, 1, 1,
0.6913139, 0.1435539, 1.975117, 1, 0, 0, 1, 1,
0.6921232, -0.4334128, 3.196313, 1, 0, 0, 1, 1,
0.6983014, 2.152714, 1.055102, 1, 0, 0, 1, 1,
0.6988095, 1.136975, 1.931531, 0, 0, 0, 1, 1,
0.704755, 1.283518, -0.455299, 0, 0, 0, 1, 1,
0.706662, 0.01948279, 0.5497663, 0, 0, 0, 1, 1,
0.7089505, 0.2091483, 0.973819, 0, 0, 0, 1, 1,
0.7133014, 1.355965, 1.247666, 0, 0, 0, 1, 1,
0.7168854, 0.7404625, -0.2978941, 0, 0, 0, 1, 1,
0.7217435, 0.2545142, 1.999858, 0, 0, 0, 1, 1,
0.7225575, -0.2777352, 1.697416, 1, 1, 1, 1, 1,
0.7245133, 0.1358827, 1.502349, 1, 1, 1, 1, 1,
0.7246915, 0.2001859, 0.7036892, 1, 1, 1, 1, 1,
0.7255233, -0.1263919, 1.081264, 1, 1, 1, 1, 1,
0.7307026, 1.006353, 0.3019764, 1, 1, 1, 1, 1,
0.7340482, 0.511175, 2.357154, 1, 1, 1, 1, 1,
0.7384751, 0.9889252, -0.6945692, 1, 1, 1, 1, 1,
0.7424707, 0.152868, 0.9681823, 1, 1, 1, 1, 1,
0.7437534, 1.158096, 1.468734, 1, 1, 1, 1, 1,
0.7465472, 1.559101, -0.0766627, 1, 1, 1, 1, 1,
0.7489041, -0.684265, -0.06615756, 1, 1, 1, 1, 1,
0.7491909, 0.3161993, 0.1459076, 1, 1, 1, 1, 1,
0.7505482, 0.4195624, 0.7965689, 1, 1, 1, 1, 1,
0.7525225, -0.9153797, 2.665372, 1, 1, 1, 1, 1,
0.7675705, -0.8148376, 2.215754, 1, 1, 1, 1, 1,
0.7693433, -0.05842748, 1.461527, 0, 0, 1, 1, 1,
0.7703506, -2.831197, 1.661617, 1, 0, 0, 1, 1,
0.7811372, 0.8525279, 1.682484, 1, 0, 0, 1, 1,
0.782021, -1.698415, 3.242863, 1, 0, 0, 1, 1,
0.792398, 0.4726126, 0.8259534, 1, 0, 0, 1, 1,
0.7934352, 1.027012, 1.249595, 1, 0, 0, 1, 1,
0.7968937, 1.040703, -0.5398424, 0, 0, 0, 1, 1,
0.8031661, -2.120534, 2.869866, 0, 0, 0, 1, 1,
0.8033506, -1.348573, 1.614358, 0, 0, 0, 1, 1,
0.8094652, 1.304413, -0.1332029, 0, 0, 0, 1, 1,
0.8126798, 0.8004509, 1.577594, 0, 0, 0, 1, 1,
0.8132616, 1.530122, 2.42566, 0, 0, 0, 1, 1,
0.8133808, -1.224228, 3.378209, 0, 0, 0, 1, 1,
0.8139153, -1.347171, 2.001707, 1, 1, 1, 1, 1,
0.8263221, 0.6455056, 0.55031, 1, 1, 1, 1, 1,
0.8276643, -0.4657691, 2.010067, 1, 1, 1, 1, 1,
0.8286752, 1.209844, 0.1573961, 1, 1, 1, 1, 1,
0.8287805, -0.03297287, 2.186485, 1, 1, 1, 1, 1,
0.8291439, -0.02547759, 1.900538, 1, 1, 1, 1, 1,
0.8335013, 0.1330288, 0.2963867, 1, 1, 1, 1, 1,
0.8472555, 1.147346, 1.507348, 1, 1, 1, 1, 1,
0.8484975, -0.178709, 1.095045, 1, 1, 1, 1, 1,
0.8487478, -0.9551675, 0.590767, 1, 1, 1, 1, 1,
0.8501055, 0.6045796, -0.433995, 1, 1, 1, 1, 1,
0.8501706, -1.701646, 2.703804, 1, 1, 1, 1, 1,
0.8506737, -0.03378443, 1.956723, 1, 1, 1, 1, 1,
0.8557782, 0.9729056, -0.9778979, 1, 1, 1, 1, 1,
0.860673, -0.5855343, 2.870502, 1, 1, 1, 1, 1,
0.8609933, 1.520015, 0.1661648, 0, 0, 1, 1, 1,
0.8661428, -0.1515131, 2.26899, 1, 0, 0, 1, 1,
0.8670528, 0.3542082, 2.422258, 1, 0, 0, 1, 1,
0.8673534, 0.9423824, 2.280705, 1, 0, 0, 1, 1,
0.8679863, 0.09158784, 0.7312093, 1, 0, 0, 1, 1,
0.8711766, 0.03954025, 1.312034, 1, 0, 0, 1, 1,
0.8725418, -1.230027, 1.760453, 0, 0, 0, 1, 1,
0.8728225, 2.229057, 0.08230206, 0, 0, 0, 1, 1,
0.8742467, 0.3546892, -0.5056135, 0, 0, 0, 1, 1,
0.8835947, 0.4675246, 0.2905393, 0, 0, 0, 1, 1,
0.8859419, -0.2734745, 1.532901, 0, 0, 0, 1, 1,
0.8867288, -0.2316288, 0.4540417, 0, 0, 0, 1, 1,
0.8884588, 0.7166451, 1.736651, 0, 0, 0, 1, 1,
0.8955724, 1.232628, 1.317669, 1, 1, 1, 1, 1,
0.8995537, 0.60929, 2.407633, 1, 1, 1, 1, 1,
0.9026058, -1.239382, 2.446162, 1, 1, 1, 1, 1,
0.9080147, -0.4530894, 1.924964, 1, 1, 1, 1, 1,
0.9090597, -0.1638481, 2.465942, 1, 1, 1, 1, 1,
0.9102181, 0.8505919, 0.2478748, 1, 1, 1, 1, 1,
0.9115307, -0.1272701, 1.137446, 1, 1, 1, 1, 1,
0.9132425, -0.9914758, 1.308374, 1, 1, 1, 1, 1,
0.9150981, -0.5055439, 1.770659, 1, 1, 1, 1, 1,
0.9176732, 0.5170496, 3.922101, 1, 1, 1, 1, 1,
0.9202732, 1.161547, 0.2779789, 1, 1, 1, 1, 1,
0.9229282, -0.1690694, 1.434652, 1, 1, 1, 1, 1,
0.9264007, -0.1879962, 2.501114, 1, 1, 1, 1, 1,
0.9264144, -0.3115487, 3.823489, 1, 1, 1, 1, 1,
0.9295908, 2.351399, -2.349294, 1, 1, 1, 1, 1,
0.9305871, 0.1941751, 1.001557, 0, 0, 1, 1, 1,
0.931864, 0.1741682, 2.849677, 1, 0, 0, 1, 1,
0.9354351, 1.819646, -0.2476862, 1, 0, 0, 1, 1,
0.9412478, -0.6781347, 2.596052, 1, 0, 0, 1, 1,
0.9442078, 0.6412479, 2.18825, 1, 0, 0, 1, 1,
0.9553633, 0.2501815, -0.2460565, 1, 0, 0, 1, 1,
0.9589664, 0.7743971, 0.3711356, 0, 0, 0, 1, 1,
0.9623108, 0.08999292, 2.722998, 0, 0, 0, 1, 1,
0.9641134, -0.04489112, 4.269357, 0, 0, 0, 1, 1,
0.9655844, 1.047695, 3.034675, 0, 0, 0, 1, 1,
0.9740298, -1.345854, 2.907824, 0, 0, 0, 1, 1,
0.9754006, -0.4284712, 2.832634, 0, 0, 0, 1, 1,
0.9756284, -0.09865927, 0.8957022, 0, 0, 0, 1, 1,
0.9781713, 1.775633, 2.319691, 1, 1, 1, 1, 1,
0.9866294, -0.06275703, 1.298445, 1, 1, 1, 1, 1,
0.9885982, -0.03227381, 2.981421, 1, 1, 1, 1, 1,
0.9944903, -1.834734, 2.113144, 1, 1, 1, 1, 1,
1.001643, -0.9703787, 3.662655, 1, 1, 1, 1, 1,
1.007601, -0.3142143, 2.497383, 1, 1, 1, 1, 1,
1.013572, -0.359344, 2.792155, 1, 1, 1, 1, 1,
1.014224, -0.1346841, 0.9515993, 1, 1, 1, 1, 1,
1.016522, 1.262065, 1.243419, 1, 1, 1, 1, 1,
1.022703, 1.55253, 2.053776, 1, 1, 1, 1, 1,
1.024374, 0.2184812, 1.921178, 1, 1, 1, 1, 1,
1.032948, 0.2275077, 1.058549, 1, 1, 1, 1, 1,
1.034826, -1.3235, 0.9666104, 1, 1, 1, 1, 1,
1.040092, -1.336828, 4.034455, 1, 1, 1, 1, 1,
1.042536, 1.450153, 0.2093527, 1, 1, 1, 1, 1,
1.045866, -0.8088552, 1.753718, 0, 0, 1, 1, 1,
1.047199, 0.1341924, 1.480461, 1, 0, 0, 1, 1,
1.047708, -0.4704516, 1.602111, 1, 0, 0, 1, 1,
1.055282, 0.8868899, 2.302623, 1, 0, 0, 1, 1,
1.060179, 0.4079091, 1.465964, 1, 0, 0, 1, 1,
1.063989, 1.151273, 0.4748767, 1, 0, 0, 1, 1,
1.071652, -0.4640545, 1.558255, 0, 0, 0, 1, 1,
1.071851, 0.1694969, 1.101023, 0, 0, 0, 1, 1,
1.072966, -1.887854, 2.059768, 0, 0, 0, 1, 1,
1.075769, 0.6835392, 0.7314536, 0, 0, 0, 1, 1,
1.076916, 1.645239, 1.296553, 0, 0, 0, 1, 1,
1.080045, 0.1849995, 0.8200251, 0, 0, 0, 1, 1,
1.084788, -1.327565, 1.751723, 0, 0, 0, 1, 1,
1.084864, -0.9161472, 1.164083, 1, 1, 1, 1, 1,
1.09632, 0.3688161, 1.360775, 1, 1, 1, 1, 1,
1.111602, -0.02152072, 0.6507522, 1, 1, 1, 1, 1,
1.11215, -1.180232, 4.333712, 1, 1, 1, 1, 1,
1.122691, -0.3274495, 4.106146, 1, 1, 1, 1, 1,
1.125446, 1.814415, 2.146228, 1, 1, 1, 1, 1,
1.12549, 0.5107805, 1.05516, 1, 1, 1, 1, 1,
1.128979, -0.8701199, 2.351868, 1, 1, 1, 1, 1,
1.148852, 0.4749475, 2.019018, 1, 1, 1, 1, 1,
1.157894, -0.5994508, 0.9231691, 1, 1, 1, 1, 1,
1.162438, -1.528306, 2.862969, 1, 1, 1, 1, 1,
1.166741, 1.254274, 1.239353, 1, 1, 1, 1, 1,
1.16717, 0.6423938, 0.9337716, 1, 1, 1, 1, 1,
1.170508, -0.9266849, 2.95523, 1, 1, 1, 1, 1,
1.173705, -0.5160826, 2.852165, 1, 1, 1, 1, 1,
1.174834, -2.693995, 4.010403, 0, 0, 1, 1, 1,
1.174986, 1.844608, 0.3538799, 1, 0, 0, 1, 1,
1.178137, -1.043369, 1.404212, 1, 0, 0, 1, 1,
1.184806, 0.2887838, 0.6465863, 1, 0, 0, 1, 1,
1.189943, -1.113152, 4.138035, 1, 0, 0, 1, 1,
1.194078, 0.8523785, 1.989963, 1, 0, 0, 1, 1,
1.195841, -1.07543, 1.401543, 0, 0, 0, 1, 1,
1.204964, 1.19071, 0.2148174, 0, 0, 0, 1, 1,
1.206316, 1.046501, 2.899714, 0, 0, 0, 1, 1,
1.206522, 1.865237, 0.1245172, 0, 0, 0, 1, 1,
1.210356, 0.5215567, -0.02782765, 0, 0, 0, 1, 1,
1.213797, -0.8579714, 1.40333, 0, 0, 0, 1, 1,
1.215141, 0.4984803, 1.260002, 0, 0, 0, 1, 1,
1.215537, 0.5111147, 4.005438, 1, 1, 1, 1, 1,
1.220927, -0.5661685, 2.937318, 1, 1, 1, 1, 1,
1.223448, 1.218414, 1.206121, 1, 1, 1, 1, 1,
1.239157, 0.8213472, -0.1129832, 1, 1, 1, 1, 1,
1.25026, -0.04771092, 1.708737, 1, 1, 1, 1, 1,
1.250844, -1.150185, 2.367155, 1, 1, 1, 1, 1,
1.251998, -1.502886, 3.059256, 1, 1, 1, 1, 1,
1.254485, 0.1291351, 0.6204604, 1, 1, 1, 1, 1,
1.257339, 0.6927689, 2.367835, 1, 1, 1, 1, 1,
1.270309, -0.2218075, 3.29807, 1, 1, 1, 1, 1,
1.274352, 0.1364728, 1.858462, 1, 1, 1, 1, 1,
1.299714, 0.6055943, 1.601794, 1, 1, 1, 1, 1,
1.303525, -1.52208, 2.157017, 1, 1, 1, 1, 1,
1.309332, 2.163738, 0.2067132, 1, 1, 1, 1, 1,
1.310192, 0.5937364, 1.636436, 1, 1, 1, 1, 1,
1.342985, 0.3489054, 2.834886, 0, 0, 1, 1, 1,
1.359026, -0.02371092, -0.9194983, 1, 0, 0, 1, 1,
1.359495, -0.02904277, 2.172097, 1, 0, 0, 1, 1,
1.366257, 0.1912489, 0.960547, 1, 0, 0, 1, 1,
1.366777, -1.648845, 1.79953, 1, 0, 0, 1, 1,
1.370019, -0.7449549, 1.384344, 1, 0, 0, 1, 1,
1.371244, -0.3725419, 2.160044, 0, 0, 0, 1, 1,
1.374117, 0.4847683, 2.186409, 0, 0, 0, 1, 1,
1.378261, -0.8627039, 2.54223, 0, 0, 0, 1, 1,
1.378845, 0.08520723, 2.593922, 0, 0, 0, 1, 1,
1.381744, 0.4377749, 2.600358, 0, 0, 0, 1, 1,
1.391075, -0.5147491, 2.096704, 0, 0, 0, 1, 1,
1.395892, 1.1896, 0.8021724, 0, 0, 0, 1, 1,
1.402949, 2.341421, 1.255731, 1, 1, 1, 1, 1,
1.410328, 0.5621774, 1.53399, 1, 1, 1, 1, 1,
1.430425, -1.320617, 3.00732, 1, 1, 1, 1, 1,
1.444399, -1.233786, 2.93906, 1, 1, 1, 1, 1,
1.454121, -0.01217862, 1.881237, 1, 1, 1, 1, 1,
1.495739, -0.3026148, 1.414667, 1, 1, 1, 1, 1,
1.500665, 0.01878747, 2.709572, 1, 1, 1, 1, 1,
1.535444, -0.9817963, 2.296386, 1, 1, 1, 1, 1,
1.540311, -0.5397851, 2.72771, 1, 1, 1, 1, 1,
1.545867, -0.2618403, 1.836102, 1, 1, 1, 1, 1,
1.551823, 1.14135, 1.53722, 1, 1, 1, 1, 1,
1.561222, 0.4102257, -0.2666877, 1, 1, 1, 1, 1,
1.562134, 0.8090711, -0.3572067, 1, 1, 1, 1, 1,
1.566818, -0.5203017, 1.67006, 1, 1, 1, 1, 1,
1.57146, 0.445694, -0.5051436, 1, 1, 1, 1, 1,
1.585295, -1.339648, 2.994908, 0, 0, 1, 1, 1,
1.612834, -0.9239326, 2.821683, 1, 0, 0, 1, 1,
1.620654, -0.8146107, 2.099862, 1, 0, 0, 1, 1,
1.622951, -0.5862526, 0.9147735, 1, 0, 0, 1, 1,
1.623797, -1.202831, 3.436929, 1, 0, 0, 1, 1,
1.627833, -1.668752, 1.897518, 1, 0, 0, 1, 1,
1.638871, -1.262794, 3.019313, 0, 0, 0, 1, 1,
1.647176, 1.14551, 1.556333, 0, 0, 0, 1, 1,
1.653466, 0.6977338, 1.650151, 0, 0, 0, 1, 1,
1.653821, -0.1067835, 1.618272, 0, 0, 0, 1, 1,
1.657575, 0.1612155, 1.284813, 0, 0, 0, 1, 1,
1.673299, 0.9588153, 1.705998, 0, 0, 0, 1, 1,
1.674555, 0.8293539, 1.893914, 0, 0, 0, 1, 1,
1.684042, -0.8849941, 0.762143, 1, 1, 1, 1, 1,
1.708972, -1.003274, 1.531581, 1, 1, 1, 1, 1,
1.713129, 0.4845581, 0.9092609, 1, 1, 1, 1, 1,
1.714321, -0.9836898, 2.933977, 1, 1, 1, 1, 1,
1.756549, 0.1962145, 0.4771227, 1, 1, 1, 1, 1,
1.761328, 0.2895975, 0.3174115, 1, 1, 1, 1, 1,
1.770102, -0.6657369, 3.159812, 1, 1, 1, 1, 1,
1.809427, 0.9868374, 0.1474425, 1, 1, 1, 1, 1,
1.812082, -0.03277471, 2.369759, 1, 1, 1, 1, 1,
1.814663, -1.023127, 2.786373, 1, 1, 1, 1, 1,
1.819174, 0.5904754, 1.89506, 1, 1, 1, 1, 1,
1.833517, 0.5623798, 1.536029, 1, 1, 1, 1, 1,
1.836308, 0.2841527, 0.8623068, 1, 1, 1, 1, 1,
1.859981, -0.2329201, 0.9487053, 1, 1, 1, 1, 1,
1.86929, -2.431205, 3.172471, 1, 1, 1, 1, 1,
1.875026, -0.2696611, 0.7840803, 0, 0, 1, 1, 1,
1.887395, 0.4452798, 2.227746, 1, 0, 0, 1, 1,
1.891192, 0.1982405, -0.5400591, 1, 0, 0, 1, 1,
1.893955, 0.2418572, 1.208986, 1, 0, 0, 1, 1,
1.896823, -0.5767323, 3.096918, 1, 0, 0, 1, 1,
1.901473, 0.3961659, 0.8512856, 1, 0, 0, 1, 1,
1.902748, 0.104231, 0.6775828, 0, 0, 0, 1, 1,
1.912849, 1.212525, 1.239941, 0, 0, 0, 1, 1,
1.91947, -0.3145913, 1.293967, 0, 0, 0, 1, 1,
1.924664, -2.099937, 2.807521, 0, 0, 0, 1, 1,
1.92521, 0.8623252, 0.9886525, 0, 0, 0, 1, 1,
1.944484, -0.4450453, 2.551056, 0, 0, 0, 1, 1,
1.963478, 1.447214, 0.04866558, 0, 0, 0, 1, 1,
1.963504, -1.693442, 2.4302, 1, 1, 1, 1, 1,
1.967195, 0.3334746, 1.693956, 1, 1, 1, 1, 1,
1.975132, -1.735635, 1.782921, 1, 1, 1, 1, 1,
1.983151, 0.983885, -0.1700438, 1, 1, 1, 1, 1,
1.984518, 1.017962, 1.118423, 1, 1, 1, 1, 1,
2.005725, -0.01898591, 0.9786728, 1, 1, 1, 1, 1,
2.022548, -0.7124113, 2.039481, 1, 1, 1, 1, 1,
2.028629, 1.443576, 2.263037, 1, 1, 1, 1, 1,
2.029978, 0.4107102, 0.4266607, 1, 1, 1, 1, 1,
2.055755, 0.3003752, 1.073723, 1, 1, 1, 1, 1,
2.06974, 0.4413984, 0.7633249, 1, 1, 1, 1, 1,
2.08822, 0.1735337, 1.719079, 1, 1, 1, 1, 1,
2.089024, -0.6444371, 1.094176, 1, 1, 1, 1, 1,
2.103622, -0.9138018, 1.746928, 1, 1, 1, 1, 1,
2.122257, -0.1666225, 1.573466, 1, 1, 1, 1, 1,
2.12511, -0.7528325, 0.02941259, 0, 0, 1, 1, 1,
2.127615, -0.723088, 0.7713045, 1, 0, 0, 1, 1,
2.128462, 0.6206957, 0.1780793, 1, 0, 0, 1, 1,
2.173186, 0.643544, 1.397219, 1, 0, 0, 1, 1,
2.180056, 0.8385735, 1.674687, 1, 0, 0, 1, 1,
2.194944, 0.1763142, 0.8751357, 1, 0, 0, 1, 1,
2.230812, 0.9891156, 1.323348, 0, 0, 0, 1, 1,
2.240916, -1.01752, 3.28878, 0, 0, 0, 1, 1,
2.342592, 0.009026508, 2.661251, 0, 0, 0, 1, 1,
2.35728, 0.5582182, 1.374028, 0, 0, 0, 1, 1,
2.412453, -0.712026, 1.251823, 0, 0, 0, 1, 1,
2.448358, -1.047213, 2.220804, 0, 0, 0, 1, 1,
2.451849, 0.09789028, 2.57665, 0, 0, 0, 1, 1,
2.467313, 1.174552, 1.05901, 1, 1, 1, 1, 1,
2.553402, -0.9529147, 4.36762, 1, 1, 1, 1, 1,
2.607768, 0.7477285, 1.552384, 1, 1, 1, 1, 1,
2.654932, 0.5361335, -0.221103, 1, 1, 1, 1, 1,
2.686067, 0.21819, 2.085968, 1, 1, 1, 1, 1,
2.814009, 0.7687142, 1.315882, 1, 1, 1, 1, 1,
3.015284, -0.9166043, -0.6142505, 1, 1, 1, 1, 1
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
var radius = 9.371014;
var distance = 32.91529;
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
mvMatrix.translate( 0.1714253, 0.1397179, -0.4624257 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.91529);
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
