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
-3.34705, 0.9834076, -0.6462105, 1, 0, 0, 1,
-3.26569, 1.153075, -3.070262, 1, 0.007843138, 0, 1,
-3.181242, 0.4968041, -3.465796, 1, 0.01176471, 0, 1,
-3.091764, 0.1874324, -0.5264304, 1, 0.01960784, 0, 1,
-3.010078, 0.2447193, -2.189906, 1, 0.02352941, 0, 1,
-2.978821, 0.5350679, -0.6215298, 1, 0.03137255, 0, 1,
-2.884875, -0.3934585, -2.862292, 1, 0.03529412, 0, 1,
-2.667619, -0.272729, -2.167366, 1, 0.04313726, 0, 1,
-2.542952, 0.9259323, -0.9636621, 1, 0.04705882, 0, 1,
-2.54188, 0.253228, -2.217116, 1, 0.05490196, 0, 1,
-2.516007, -0.337479, -1.265697, 1, 0.05882353, 0, 1,
-2.410785, -1.197501, -2.03525, 1, 0.06666667, 0, 1,
-2.389975, 0.1463581, -1.854201, 1, 0.07058824, 0, 1,
-2.344936, -0.5627149, -0.9744443, 1, 0.07843138, 0, 1,
-2.338926, 0.5398949, -1.32286, 1, 0.08235294, 0, 1,
-2.295451, -1.034708, -1.92419, 1, 0.09019608, 0, 1,
-2.277935, 0.2536185, -0.7256134, 1, 0.09411765, 0, 1,
-2.25903, 0.5871395, -1.800881, 1, 0.1019608, 0, 1,
-2.255561, 2.358402, -0.7509531, 1, 0.1098039, 0, 1,
-2.252177, 1.50268, 0.1394735, 1, 0.1137255, 0, 1,
-2.243099, 0.03407731, -0.1061824, 1, 0.1215686, 0, 1,
-2.241786, -0.2400869, 0.8637755, 1, 0.1254902, 0, 1,
-2.229129, 0.685536, -2.769341, 1, 0.1333333, 0, 1,
-2.21911, -0.3032582, -3.30998, 1, 0.1372549, 0, 1,
-2.215057, 0.9783042, -2.1932, 1, 0.145098, 0, 1,
-2.194978, -0.3366302, -0.3211398, 1, 0.1490196, 0, 1,
-2.174828, -2.039909, -1.508549, 1, 0.1568628, 0, 1,
-2.173859, -0.7408991, -4.581686, 1, 0.1607843, 0, 1,
-2.169857, -0.160598, -1.551365, 1, 0.1686275, 0, 1,
-2.161501, -1.435421, -2.731368, 1, 0.172549, 0, 1,
-2.132965, -0.2239186, -2.94119, 1, 0.1803922, 0, 1,
-2.128896, -0.3095321, -3.435465, 1, 0.1843137, 0, 1,
-2.121703, -0.408819, -1.738095, 1, 0.1921569, 0, 1,
-2.120861, 0.06711739, -2.300185, 1, 0.1960784, 0, 1,
-2.118811, -0.1660496, -2.342951, 1, 0.2039216, 0, 1,
-2.018915, -1.275734, -1.466688, 1, 0.2117647, 0, 1,
-2.009861, 0.2132572, -0.9521264, 1, 0.2156863, 0, 1,
-2.00192, -0.1790561, -1.92491, 1, 0.2235294, 0, 1,
-2.000866, -0.6600894, -1.673412, 1, 0.227451, 0, 1,
-2.00055, 0.4766016, -1.575819, 1, 0.2352941, 0, 1,
-1.943896, 0.7959673, -1.055894, 1, 0.2392157, 0, 1,
-1.939752, 0.2015077, -1.233642, 1, 0.2470588, 0, 1,
-1.938158, -0.2171402, 0.05866306, 1, 0.2509804, 0, 1,
-1.921159, 0.03511908, -0.9863845, 1, 0.2588235, 0, 1,
-1.912067, 0.8880317, -0.7114879, 1, 0.2627451, 0, 1,
-1.904895, 0.243828, -2.820895, 1, 0.2705882, 0, 1,
-1.892107, -1.28363, -0.5370722, 1, 0.2745098, 0, 1,
-1.88003, -0.8843527, -1.758687, 1, 0.282353, 0, 1,
-1.869239, 0.6838906, -1.64624, 1, 0.2862745, 0, 1,
-1.846961, 0.6608917, -1.209871, 1, 0.2941177, 0, 1,
-1.844216, 0.7198011, -1.918784, 1, 0.3019608, 0, 1,
-1.82755, -0.07077202, -2.094117, 1, 0.3058824, 0, 1,
-1.796591, 0.004245393, -1.612522, 1, 0.3137255, 0, 1,
-1.774665, -1.451055, -1.288592, 1, 0.3176471, 0, 1,
-1.754051, 0.4050513, -4.154827, 1, 0.3254902, 0, 1,
-1.709374, 0.4770419, 0.04816137, 1, 0.3294118, 0, 1,
-1.697459, 0.5192722, -0.6641447, 1, 0.3372549, 0, 1,
-1.6968, -0.1066553, -1.309753, 1, 0.3411765, 0, 1,
-1.670539, 1.277072, 0.3359112, 1, 0.3490196, 0, 1,
-1.670107, 0.871416, -0.8695596, 1, 0.3529412, 0, 1,
-1.666538, -0.6943312, -1.438743, 1, 0.3607843, 0, 1,
-1.657318, -0.3693151, -1.397518, 1, 0.3647059, 0, 1,
-1.656399, -1.037787, -3.021078, 1, 0.372549, 0, 1,
-1.649045, 0.8920481, -0.3794938, 1, 0.3764706, 0, 1,
-1.644205, 0.2291281, -2.308912, 1, 0.3843137, 0, 1,
-1.643688, -0.7842814, -2.113733, 1, 0.3882353, 0, 1,
-1.628762, -0.5740737, -1.291033, 1, 0.3960784, 0, 1,
-1.615796, -0.368994, -0.3814284, 1, 0.4039216, 0, 1,
-1.600141, 0.6053064, -0.1746598, 1, 0.4078431, 0, 1,
-1.595077, 2.225369, -1.212467, 1, 0.4156863, 0, 1,
-1.59459, -0.02195456, -2.419296, 1, 0.4196078, 0, 1,
-1.587717, 2.491587, -1.828786, 1, 0.427451, 0, 1,
-1.58024, -0.2885281, -1.501548, 1, 0.4313726, 0, 1,
-1.577788, -2.462012, -1.879161, 1, 0.4392157, 0, 1,
-1.565105, 0.3437325, -1.206354, 1, 0.4431373, 0, 1,
-1.551727, 1.250488, -0.08703873, 1, 0.4509804, 0, 1,
-1.548441, 0.8328401, 0.7166622, 1, 0.454902, 0, 1,
-1.539828, -0.9401361, -3.144701, 1, 0.4627451, 0, 1,
-1.539324, 0.9210063, -0.960727, 1, 0.4666667, 0, 1,
-1.525617, -0.7266083, -2.237974, 1, 0.4745098, 0, 1,
-1.519372, -1.709084, -1.911589, 1, 0.4784314, 0, 1,
-1.511668, 1.66358, -0.3880662, 1, 0.4862745, 0, 1,
-1.509635, -0.5111504, -0.9377003, 1, 0.4901961, 0, 1,
-1.488314, 1.990168, -0.9982756, 1, 0.4980392, 0, 1,
-1.472453, 0.06958908, -3.115347, 1, 0.5058824, 0, 1,
-1.472048, 1.179532, -0.4967421, 1, 0.509804, 0, 1,
-1.470954, -0.310892, -1.134801, 1, 0.5176471, 0, 1,
-1.457345, 1.127129, -0.5285386, 1, 0.5215687, 0, 1,
-1.446091, 0.4850151, -1.99876, 1, 0.5294118, 0, 1,
-1.436593, -0.06149965, -1.340749, 1, 0.5333334, 0, 1,
-1.424135, 0.155628, 1.386984, 1, 0.5411765, 0, 1,
-1.419992, -1.509934, -0.6747465, 1, 0.5450981, 0, 1,
-1.419814, 1.070558, -0.9719545, 1, 0.5529412, 0, 1,
-1.413009, 2.133944, -1.721311, 1, 0.5568628, 0, 1,
-1.403806, -0.4301937, -2.908629, 1, 0.5647059, 0, 1,
-1.400945, 0.5184959, -0.7010943, 1, 0.5686275, 0, 1,
-1.395282, -0.01890172, -1.721643, 1, 0.5764706, 0, 1,
-1.38867, 0.1531215, -0.8977718, 1, 0.5803922, 0, 1,
-1.3706, -0.1790232, -2.187288, 1, 0.5882353, 0, 1,
-1.36995, 0.227569, -1.070127, 1, 0.5921569, 0, 1,
-1.363299, -0.1114645, -0.6066316, 1, 0.6, 0, 1,
-1.358572, 0.4587096, -0.5874267, 1, 0.6078432, 0, 1,
-1.353786, 0.1353746, -4.16497, 1, 0.6117647, 0, 1,
-1.350387, 0.9442247, -1.521777, 1, 0.6196079, 0, 1,
-1.347774, -1.307914, -1.880042, 1, 0.6235294, 0, 1,
-1.345969, -0.4406167, -1.675244, 1, 0.6313726, 0, 1,
-1.330227, -1.178948, -2.559726, 1, 0.6352941, 0, 1,
-1.326013, -1.353641, -0.9954596, 1, 0.6431373, 0, 1,
-1.324739, 0.6113131, -0.0360899, 1, 0.6470588, 0, 1,
-1.316402, 1.937781, -2.058973, 1, 0.654902, 0, 1,
-1.308976, -1.270512, -3.016731, 1, 0.6588235, 0, 1,
-1.304657, 0.2585475, -2.409561, 1, 0.6666667, 0, 1,
-1.302361, 0.5088018, 0.2914543, 1, 0.6705883, 0, 1,
-1.292911, -1.558241, -3.397496, 1, 0.6784314, 0, 1,
-1.287404, 0.8438004, -2.186595, 1, 0.682353, 0, 1,
-1.276126, -0.1183498, -0.2268047, 1, 0.6901961, 0, 1,
-1.275276, 2.067923, -2.204701, 1, 0.6941177, 0, 1,
-1.272774, 2.721483, -0.8815129, 1, 0.7019608, 0, 1,
-1.266493, -0.6750953, -2.963949, 1, 0.7098039, 0, 1,
-1.259494, 0.3070653, -3.515296, 1, 0.7137255, 0, 1,
-1.254144, -0.549265, -3.288687, 1, 0.7215686, 0, 1,
-1.253179, 1.18538, -0.3092305, 1, 0.7254902, 0, 1,
-1.233979, 1.12449, -2.98823, 1, 0.7333333, 0, 1,
-1.227013, -0.4171868, -2.333661, 1, 0.7372549, 0, 1,
-1.222886, -0.3782108, -1.558959, 1, 0.7450981, 0, 1,
-1.221227, 0.5444148, -2.764414, 1, 0.7490196, 0, 1,
-1.214687, 1.089846, -2.246002, 1, 0.7568628, 0, 1,
-1.205075, 0.1132461, -2.340479, 1, 0.7607843, 0, 1,
-1.200134, -0.6494944, -0.5027237, 1, 0.7686275, 0, 1,
-1.188251, 0.005275476, -1.86828, 1, 0.772549, 0, 1,
-1.182016, 1.720679, 0.3077438, 1, 0.7803922, 0, 1,
-1.176795, 0.3212904, -1.901392, 1, 0.7843137, 0, 1,
-1.176439, -0.7337034, -0.6711603, 1, 0.7921569, 0, 1,
-1.173441, -0.2930259, -3.653029, 1, 0.7960784, 0, 1,
-1.172072, 0.3169402, -1.241273, 1, 0.8039216, 0, 1,
-1.165925, -0.7263033, -0.09146405, 1, 0.8117647, 0, 1,
-1.163409, 0.4815695, 0.4070761, 1, 0.8156863, 0, 1,
-1.154944, 1.049875, 0.3184535, 1, 0.8235294, 0, 1,
-1.152853, 0.04456521, -0.6194585, 1, 0.827451, 0, 1,
-1.151756, -0.4573694, -0.536642, 1, 0.8352941, 0, 1,
-1.147948, -0.07652325, -2.76551, 1, 0.8392157, 0, 1,
-1.147283, -0.4588877, -1.978765, 1, 0.8470588, 0, 1,
-1.145365, 0.2367853, -0.6163223, 1, 0.8509804, 0, 1,
-1.136623, 0.209255, -0.9775321, 1, 0.8588235, 0, 1,
-1.132543, -0.04159874, -2.734705, 1, 0.8627451, 0, 1,
-1.126588, -1.15686, -0.5094712, 1, 0.8705882, 0, 1,
-1.125414, -0.940328, -2.676137, 1, 0.8745098, 0, 1,
-1.123934, -0.8324983, -1.865139, 1, 0.8823529, 0, 1,
-1.115171, 1.635589, -0.03256773, 1, 0.8862745, 0, 1,
-1.108318, -0.6627666, -1.994529, 1, 0.8941177, 0, 1,
-1.105933, 1.226773, -1.268843, 1, 0.8980392, 0, 1,
-1.105712, -0.928642, -2.502505, 1, 0.9058824, 0, 1,
-1.100084, 1.137829, -0.3112186, 1, 0.9137255, 0, 1,
-1.096307, -1.414443, -3.292872, 1, 0.9176471, 0, 1,
-1.095434, -0.8667247, -1.398929, 1, 0.9254902, 0, 1,
-1.085305, -0.1134473, -1.539469, 1, 0.9294118, 0, 1,
-1.084385, 1.072693, 0.2357371, 1, 0.9372549, 0, 1,
-1.083462, -0.6399474, -1.171877, 1, 0.9411765, 0, 1,
-1.082757, 0.7502783, -0.7293574, 1, 0.9490196, 0, 1,
-1.075647, -0.8491367, -1.604274, 1, 0.9529412, 0, 1,
-1.070464, 0.02401935, -2.636225, 1, 0.9607843, 0, 1,
-1.056308, -0.4047254, -3.601406, 1, 0.9647059, 0, 1,
-1.053924, 1.183326, -3.576918, 1, 0.972549, 0, 1,
-1.049848, 0.3289963, 0.3564794, 1, 0.9764706, 0, 1,
-1.049001, 0.3067115, -2.88014, 1, 0.9843137, 0, 1,
-1.046574, 0.7513059, -1.172274, 1, 0.9882353, 0, 1,
-1.023153, 1.046123, -0.4163875, 1, 0.9960784, 0, 1,
-1.01764, -1.356634, -2.486611, 0.9960784, 1, 0, 1,
-1.01516, -0.5873386, -1.674339, 0.9921569, 1, 0, 1,
-0.9924504, -0.304611, -1.356697, 0.9843137, 1, 0, 1,
-0.9898118, 0.2580788, -1.353074, 0.9803922, 1, 0, 1,
-0.9894609, -0.9109696, -3.030868, 0.972549, 1, 0, 1,
-0.9814329, 1.806737, -1.399836, 0.9686275, 1, 0, 1,
-0.9806018, -0.4945176, -1.308526, 0.9607843, 1, 0, 1,
-0.9754847, 0.5382544, 0.2832358, 0.9568627, 1, 0, 1,
-0.9753768, 1.06821, -1.570975, 0.9490196, 1, 0, 1,
-0.9720947, 0.0591993, -0.999989, 0.945098, 1, 0, 1,
-0.969804, -0.5767076, -1.558927, 0.9372549, 1, 0, 1,
-0.9641277, -1.00485, -2.027833, 0.9333333, 1, 0, 1,
-0.9574653, -2.328324, -2.477392, 0.9254902, 1, 0, 1,
-0.9562269, 0.1651133, -1.689575, 0.9215686, 1, 0, 1,
-0.9557118, -0.3849922, -1.724833, 0.9137255, 1, 0, 1,
-0.9531462, -1.13684, -2.465324, 0.9098039, 1, 0, 1,
-0.9517605, 0.07381394, -2.939037, 0.9019608, 1, 0, 1,
-0.9484442, -1.172454, -2.105526, 0.8941177, 1, 0, 1,
-0.945911, -0.773307, -3.057954, 0.8901961, 1, 0, 1,
-0.9414613, -1.6944, -2.934388, 0.8823529, 1, 0, 1,
-0.9403634, 0.2564306, -0.8619882, 0.8784314, 1, 0, 1,
-0.9373313, 1.501114, -1.248048, 0.8705882, 1, 0, 1,
-0.9353889, 1.920325, -0.2659694, 0.8666667, 1, 0, 1,
-0.9320344, 3.106811, 0.5725021, 0.8588235, 1, 0, 1,
-0.9281084, 0.2881493, -0.814582, 0.854902, 1, 0, 1,
-0.925603, -1.21183, -3.082481, 0.8470588, 1, 0, 1,
-0.9169011, 3.044952, 0.8006079, 0.8431373, 1, 0, 1,
-0.909986, 0.8298755, -1.060297, 0.8352941, 1, 0, 1,
-0.9092488, -0.6745719, -4.193646, 0.8313726, 1, 0, 1,
-0.9073354, -2.778529, -1.870547, 0.8235294, 1, 0, 1,
-0.9059397, 1.149446, 0.2600096, 0.8196079, 1, 0, 1,
-0.9048441, -0.7127448, -1.379502, 0.8117647, 1, 0, 1,
-0.902485, -0.8045591, -0.8977816, 0.8078431, 1, 0, 1,
-0.8987209, 1.416045, -0.5387963, 0.8, 1, 0, 1,
-0.8976405, -1.19972, -1.310487, 0.7921569, 1, 0, 1,
-0.8961813, 0.1395239, -1.726524, 0.7882353, 1, 0, 1,
-0.8957231, 0.7829455, -1.204574, 0.7803922, 1, 0, 1,
-0.8944777, 0.3026075, -2.190092, 0.7764706, 1, 0, 1,
-0.889789, -1.70191, -2.938513, 0.7686275, 1, 0, 1,
-0.8836843, -1.798439, -2.197894, 0.7647059, 1, 0, 1,
-0.8817856, 0.8706902, -0.1314475, 0.7568628, 1, 0, 1,
-0.8808063, 0.928086, -2.153053, 0.7529412, 1, 0, 1,
-0.8763116, 1.8011, -0.7798434, 0.7450981, 1, 0, 1,
-0.875872, 1.019235, -2.958049, 0.7411765, 1, 0, 1,
-0.8736316, -0.7501988, -1.203614, 0.7333333, 1, 0, 1,
-0.8687677, -0.2865895, -2.456949, 0.7294118, 1, 0, 1,
-0.8666213, -0.7578714, -1.315286, 0.7215686, 1, 0, 1,
-0.8642447, 0.4293128, -2.037396, 0.7176471, 1, 0, 1,
-0.8613476, -0.7786543, -3.635257, 0.7098039, 1, 0, 1,
-0.8472335, 0.07316595, -2.628577, 0.7058824, 1, 0, 1,
-0.8467028, 1.453178, -0.4924841, 0.6980392, 1, 0, 1,
-0.8396726, -0.3220014, -0.8211673, 0.6901961, 1, 0, 1,
-0.8393453, -0.57118, -0.7436116, 0.6862745, 1, 0, 1,
-0.8316247, -0.7726908, -2.08883, 0.6784314, 1, 0, 1,
-0.8316187, 0.3879548, -1.549614, 0.6745098, 1, 0, 1,
-0.830403, -0.9340225, -2.954615, 0.6666667, 1, 0, 1,
-0.8285921, 0.8670226, 0.0935192, 0.6627451, 1, 0, 1,
-0.8230738, -0.1769691, -0.7299677, 0.654902, 1, 0, 1,
-0.8141598, 0.08432897, -2.428389, 0.6509804, 1, 0, 1,
-0.8134868, -0.5128686, -3.462794, 0.6431373, 1, 0, 1,
-0.8109206, 0.6892838, -0.1302873, 0.6392157, 1, 0, 1,
-0.8080623, -0.9969968, -2.125066, 0.6313726, 1, 0, 1,
-0.8035745, -0.02900107, -1.183504, 0.627451, 1, 0, 1,
-0.7947559, -0.1028281, -2.300716, 0.6196079, 1, 0, 1,
-0.7916973, 0.5020206, -1.292049, 0.6156863, 1, 0, 1,
-0.7880647, 1.053222, 1.112631, 0.6078432, 1, 0, 1,
-0.774619, -0.3291611, -2.578601, 0.6039216, 1, 0, 1,
-0.765617, 0.6631389, -0.6367006, 0.5960785, 1, 0, 1,
-0.7644238, 0.3161979, -0.8367689, 0.5882353, 1, 0, 1,
-0.7642211, -0.5788414, -1.934762, 0.5843138, 1, 0, 1,
-0.7619757, -0.6276784, -1.595324, 0.5764706, 1, 0, 1,
-0.7613177, 0.4842131, -0.1538846, 0.572549, 1, 0, 1,
-0.7541291, -0.5824094, -1.317283, 0.5647059, 1, 0, 1,
-0.7508144, 1.329353, 0.6231557, 0.5607843, 1, 0, 1,
-0.743706, -0.4853264, -3.415995, 0.5529412, 1, 0, 1,
-0.7369121, -1.743294, -2.929934, 0.5490196, 1, 0, 1,
-0.731723, -1.325411, -2.018288, 0.5411765, 1, 0, 1,
-0.7288721, -0.1985198, -1.808356, 0.5372549, 1, 0, 1,
-0.7282848, 0.655619, -0.9719372, 0.5294118, 1, 0, 1,
-0.7282177, 0.4767799, -0.8922325, 0.5254902, 1, 0, 1,
-0.7256107, 0.4426068, -0.177489, 0.5176471, 1, 0, 1,
-0.7250036, 0.7488677, 0.2711595, 0.5137255, 1, 0, 1,
-0.7217087, 1.508148, -0.2192457, 0.5058824, 1, 0, 1,
-0.7183394, 1.147714, -0.5176721, 0.5019608, 1, 0, 1,
-0.7097122, -0.2402568, -1.489594, 0.4941176, 1, 0, 1,
-0.7045957, 0.2307926, -1.842336, 0.4862745, 1, 0, 1,
-0.7021304, 0.3544157, 0.8033332, 0.4823529, 1, 0, 1,
-0.7018278, -0.6217824, -2.55214, 0.4745098, 1, 0, 1,
-0.6962022, -1.648683, -2.924541, 0.4705882, 1, 0, 1,
-0.6923124, -0.0904953, -1.490719, 0.4627451, 1, 0, 1,
-0.6915503, 0.7657105, 0.2060187, 0.4588235, 1, 0, 1,
-0.6913426, 1.639894, -0.202185, 0.4509804, 1, 0, 1,
-0.6813145, -0.4171694, -1.921, 0.4470588, 1, 0, 1,
-0.6761791, -1.362088, -2.977966, 0.4392157, 1, 0, 1,
-0.6754345, -1.060301, -2.70039, 0.4352941, 1, 0, 1,
-0.67067, 0.08260571, -3.617967, 0.427451, 1, 0, 1,
-0.6701791, 0.7543742, -1.803145, 0.4235294, 1, 0, 1,
-0.6692526, -0.5361847, -2.745311, 0.4156863, 1, 0, 1,
-0.6653667, -0.06966323, -2.512538, 0.4117647, 1, 0, 1,
-0.6630279, -0.0842334, -1.910316, 0.4039216, 1, 0, 1,
-0.6620847, -0.4148642, -4.899212, 0.3960784, 1, 0, 1,
-0.6595365, -1.047483, -2.745519, 0.3921569, 1, 0, 1,
-0.6582842, -0.6505879, 0.365226, 0.3843137, 1, 0, 1,
-0.6558989, 0.1324274, -2.669419, 0.3803922, 1, 0, 1,
-0.6473651, -1.991971, -2.962107, 0.372549, 1, 0, 1,
-0.6459414, -1.568192, -2.817086, 0.3686275, 1, 0, 1,
-0.6379549, -1.677371, -1.940919, 0.3607843, 1, 0, 1,
-0.6349788, 0.4292297, 0.7105295, 0.3568628, 1, 0, 1,
-0.6327485, -1.315389, -2.144826, 0.3490196, 1, 0, 1,
-0.6281993, -0.4706509, -3.302452, 0.345098, 1, 0, 1,
-0.6270366, -0.9128826, -2.930591, 0.3372549, 1, 0, 1,
-0.6144557, -0.857999, -1.296488, 0.3333333, 1, 0, 1,
-0.6135697, -1.524759, -2.981273, 0.3254902, 1, 0, 1,
-0.6114243, 0.2833126, -1.266289, 0.3215686, 1, 0, 1,
-0.6078832, 0.738217, 0.06903141, 0.3137255, 1, 0, 1,
-0.6002197, -1.024315, -3.773623, 0.3098039, 1, 0, 1,
-0.5999069, -0.8332421, -2.322597, 0.3019608, 1, 0, 1,
-0.5990026, -0.3922343, -2.968191, 0.2941177, 1, 0, 1,
-0.596835, -0.853065, -2.73696, 0.2901961, 1, 0, 1,
-0.5942226, -0.08161443, -2.079158, 0.282353, 1, 0, 1,
-0.5901687, 0.2424122, -0.803984, 0.2784314, 1, 0, 1,
-0.5692229, 1.681414, 0.6173754, 0.2705882, 1, 0, 1,
-0.561974, -0.1830184, -2.812961, 0.2666667, 1, 0, 1,
-0.5556787, -2.690017, -4.512793, 0.2588235, 1, 0, 1,
-0.5490189, -0.5663697, -2.520665, 0.254902, 1, 0, 1,
-0.5451591, -0.471092, -1.057666, 0.2470588, 1, 0, 1,
-0.540527, 0.1516919, -2.184788, 0.2431373, 1, 0, 1,
-0.538142, 0.07530055, -2.291316, 0.2352941, 1, 0, 1,
-0.5380392, 1.317196, -0.5662737, 0.2313726, 1, 0, 1,
-0.5364052, 0.5482697, -0.7338724, 0.2235294, 1, 0, 1,
-0.517643, -1.375059, -3.93836, 0.2196078, 1, 0, 1,
-0.5170728, 0.9820516, -0.4366653, 0.2117647, 1, 0, 1,
-0.5153686, 2.081881, -0.7235376, 0.2078431, 1, 0, 1,
-0.5130429, -0.7898728, -4.420259, 0.2, 1, 0, 1,
-0.4981657, -0.9190343, -1.693134, 0.1921569, 1, 0, 1,
-0.4903056, -0.1309983, -2.345195, 0.1882353, 1, 0, 1,
-0.4887252, 0.4299883, -0.2598501, 0.1803922, 1, 0, 1,
-0.4834246, -0.01920006, -1.1265, 0.1764706, 1, 0, 1,
-0.4801488, 0.696129, 0.0209409, 0.1686275, 1, 0, 1,
-0.4738605, -1.063391, -3.426892, 0.1647059, 1, 0, 1,
-0.4729023, 0.2861868, -2.402725, 0.1568628, 1, 0, 1,
-0.4713779, -0.3132787, -2.114819, 0.1529412, 1, 0, 1,
-0.4707878, -1.427002, -2.684388, 0.145098, 1, 0, 1,
-0.4691753, -0.2528973, 0.03793861, 0.1411765, 1, 0, 1,
-0.4678949, -0.6748601, -1.514268, 0.1333333, 1, 0, 1,
-0.4641715, 0.4847673, -0.6487824, 0.1294118, 1, 0, 1,
-0.4569823, 0.4641331, -1.95076, 0.1215686, 1, 0, 1,
-0.4569099, -0.800873, -3.136574, 0.1176471, 1, 0, 1,
-0.4500472, 0.05651774, -1.966599, 0.1098039, 1, 0, 1,
-0.4425548, 2.228753, -1.406489, 0.1058824, 1, 0, 1,
-0.4408683, 1.123128, -0.7714049, 0.09803922, 1, 0, 1,
-0.4408323, 0.9002783, -0.6207504, 0.09019608, 1, 0, 1,
-0.4340905, -0.6114141, -1.763662, 0.08627451, 1, 0, 1,
-0.4291262, 1.078359, 0.03878099, 0.07843138, 1, 0, 1,
-0.4279847, 0.005844504, -2.401195, 0.07450981, 1, 0, 1,
-0.422259, -0.2632724, -2.452458, 0.06666667, 1, 0, 1,
-0.4218717, -0.3601283, -1.336848, 0.0627451, 1, 0, 1,
-0.415684, -0.8184881, -3.265579, 0.05490196, 1, 0, 1,
-0.4150958, -0.8730717, -3.396164, 0.05098039, 1, 0, 1,
-0.4114037, 1.097411, -0.07943943, 0.04313726, 1, 0, 1,
-0.4092205, 0.7112455, 0.7446682, 0.03921569, 1, 0, 1,
-0.4091482, -2.137157, -4.258745, 0.03137255, 1, 0, 1,
-0.4064786, 0.1193073, -2.997449, 0.02745098, 1, 0, 1,
-0.4039527, -0.5062916, -1.274868, 0.01960784, 1, 0, 1,
-0.4036858, -0.1535214, -2.547577, 0.01568628, 1, 0, 1,
-0.4024556, -0.5243147, -4.579873, 0.007843138, 1, 0, 1,
-0.3978699, -0.7152888, -4.235371, 0.003921569, 1, 0, 1,
-0.3971392, -2.779089, -3.933596, 0, 1, 0.003921569, 1,
-0.3922727, -0.6814551, -4.118214, 0, 1, 0.01176471, 1,
-0.3901504, -1.755343, -3.470906, 0, 1, 0.01568628, 1,
-0.3880205, 1.074685, -0.1380309, 0, 1, 0.02352941, 1,
-0.3840477, -1.430103, -4.284407, 0, 1, 0.02745098, 1,
-0.3797725, 0.8085104, -0.8504412, 0, 1, 0.03529412, 1,
-0.3785529, 0.007630157, -1.209399, 0, 1, 0.03921569, 1,
-0.3784852, 0.3932102, -1.53438, 0, 1, 0.04705882, 1,
-0.3771524, 0.314277, -1.468018, 0, 1, 0.05098039, 1,
-0.3756005, 0.85551, -0.2560794, 0, 1, 0.05882353, 1,
-0.3741962, -1.714784, -4.239434, 0, 1, 0.0627451, 1,
-0.3741525, -0.7343701, -2.603776, 0, 1, 0.07058824, 1,
-0.3707388, -1.535806, -3.567546, 0, 1, 0.07450981, 1,
-0.3682667, -0.9270021, -2.223364, 0, 1, 0.08235294, 1,
-0.3665001, -0.4316452, -2.424119, 0, 1, 0.08627451, 1,
-0.3625678, 0.7043642, 0.490264, 0, 1, 0.09411765, 1,
-0.3584982, 0.9216912, -1.446267, 0, 1, 0.1019608, 1,
-0.3513225, 0.09398948, -0.273806, 0, 1, 0.1058824, 1,
-0.3444354, -0.8085893, -2.19914, 0, 1, 0.1137255, 1,
-0.3420873, -0.02981088, -2.793961, 0, 1, 0.1176471, 1,
-0.3388087, -0.7460296, -3.309489, 0, 1, 0.1254902, 1,
-0.3375146, -0.3651798, -0.6031867, 0, 1, 0.1294118, 1,
-0.336244, 0.7510676, -0.06974771, 0, 1, 0.1372549, 1,
-0.332818, 1.601962, 0.6099977, 0, 1, 0.1411765, 1,
-0.3306371, -0.2875745, -2.600564, 0, 1, 0.1490196, 1,
-0.3265665, -1.651197, -2.706175, 0, 1, 0.1529412, 1,
-0.3255817, 0.1396363, -1.181469, 0, 1, 0.1607843, 1,
-0.3250084, -0.8082257, -4.6134, 0, 1, 0.1647059, 1,
-0.3240631, 0.978308, -0.2327478, 0, 1, 0.172549, 1,
-0.3239671, 0.7405418, -0.1306259, 0, 1, 0.1764706, 1,
-0.321093, 0.158223, -1.727811, 0, 1, 0.1843137, 1,
-0.318598, -0.2553884, -2.379683, 0, 1, 0.1882353, 1,
-0.31748, -0.8571885, -1.497653, 0, 1, 0.1960784, 1,
-0.3114802, -0.678107, -2.415565, 0, 1, 0.2039216, 1,
-0.3005543, 0.2166937, 0.2454764, 0, 1, 0.2078431, 1,
-0.2906294, -0.1985936, -0.470026, 0, 1, 0.2156863, 1,
-0.2896126, 0.1515688, -1.224051, 0, 1, 0.2196078, 1,
-0.2892102, -1.622333, -2.630589, 0, 1, 0.227451, 1,
-0.2885588, 0.2181106, -1.149493, 0, 1, 0.2313726, 1,
-0.2858106, -0.1375501, -2.942511, 0, 1, 0.2392157, 1,
-0.2850814, -1.31152, -2.379852, 0, 1, 0.2431373, 1,
-0.2785214, 0.05493402, -2.32336, 0, 1, 0.2509804, 1,
-0.2770194, -0.2770684, -2.210309, 0, 1, 0.254902, 1,
-0.2751862, 0.1417766, -2.701771, 0, 1, 0.2627451, 1,
-0.2749325, 1.400935, 0.247657, 0, 1, 0.2666667, 1,
-0.2736705, 1.08892, -2.622533, 0, 1, 0.2745098, 1,
-0.2726605, -1.650019, -1.747479, 0, 1, 0.2784314, 1,
-0.2719452, 1.777385, 0.07369401, 0, 1, 0.2862745, 1,
-0.2694139, -1.460307, -3.987489, 0, 1, 0.2901961, 1,
-0.2669474, 0.209392, -1.734512, 0, 1, 0.2980392, 1,
-0.2656671, 1.217926, 0.2296267, 0, 1, 0.3058824, 1,
-0.2633931, 1.07307, 0.9219555, 0, 1, 0.3098039, 1,
-0.2597754, -1.080998, -2.49477, 0, 1, 0.3176471, 1,
-0.2564997, -0.4972893, -2.345109, 0, 1, 0.3215686, 1,
-0.2508146, -0.5486282, -3.016145, 0, 1, 0.3294118, 1,
-0.2447634, -1.883368, -3.011634, 0, 1, 0.3333333, 1,
-0.2434719, -1.029755, -3.54636, 0, 1, 0.3411765, 1,
-0.2422689, 0.6123587, 0.3979806, 0, 1, 0.345098, 1,
-0.2412873, 0.7392277, -1.665407, 0, 1, 0.3529412, 1,
-0.2405436, -0.1643284, -2.717009, 0, 1, 0.3568628, 1,
-0.2390201, -0.5717684, -4.075778, 0, 1, 0.3647059, 1,
-0.2379049, 0.2236065, -1.564963, 0, 1, 0.3686275, 1,
-0.2343934, -0.2960962, -1.720681, 0, 1, 0.3764706, 1,
-0.2338493, -1.136496, -4.640994, 0, 1, 0.3803922, 1,
-0.2317088, 0.1565865, -1.12443, 0, 1, 0.3882353, 1,
-0.2315503, 1.901359, -1.273805, 0, 1, 0.3921569, 1,
-0.2303109, -1.051835, -2.269197, 0, 1, 0.4, 1,
-0.2235738, 0.3050583, 0.6690882, 0, 1, 0.4078431, 1,
-0.2219249, 1.236575, 0.1273762, 0, 1, 0.4117647, 1,
-0.2205735, 0.193909, -1.205155, 0, 1, 0.4196078, 1,
-0.2199126, 0.9808042, -0.9212322, 0, 1, 0.4235294, 1,
-0.2177517, -0.3321641, -2.995905, 0, 1, 0.4313726, 1,
-0.2170902, -0.1921019, -1.624657, 0, 1, 0.4352941, 1,
-0.2156106, -0.04019343, -2.310272, 0, 1, 0.4431373, 1,
-0.2139192, -0.8730924, -2.669491, 0, 1, 0.4470588, 1,
-0.2128746, -1.171692, -2.693477, 0, 1, 0.454902, 1,
-0.2126307, -1.318006, -3.68046, 0, 1, 0.4588235, 1,
-0.2097333, -1.210685, -2.909209, 0, 1, 0.4666667, 1,
-0.2089464, -2.089891, -2.964939, 0, 1, 0.4705882, 1,
-0.2085008, -0.2415968, -2.174672, 0, 1, 0.4784314, 1,
-0.208267, -0.3926654, -1.043843, 0, 1, 0.4823529, 1,
-0.2052933, -0.0482377, -1.80205, 0, 1, 0.4901961, 1,
-0.2041003, -1.928182, -3.951387, 0, 1, 0.4941176, 1,
-0.199427, -0.2427182, -1.765417, 0, 1, 0.5019608, 1,
-0.1993425, -0.4472119, -2.747188, 0, 1, 0.509804, 1,
-0.198422, 0.2036141, -0.5984648, 0, 1, 0.5137255, 1,
-0.1969243, -0.6299635, -1.646014, 0, 1, 0.5215687, 1,
-0.196314, 1.638502, 0.5459611, 0, 1, 0.5254902, 1,
-0.1940099, -0.7201759, -4.105222, 0, 1, 0.5333334, 1,
-0.1914887, 0.01088411, -0.9748193, 0, 1, 0.5372549, 1,
-0.1910343, 0.1850439, -1.263678, 0, 1, 0.5450981, 1,
-0.1908701, -1.67816, -4.352787, 0, 1, 0.5490196, 1,
-0.1854208, 0.4818664, 0.8696866, 0, 1, 0.5568628, 1,
-0.1841229, -0.5748953, -1.907552, 0, 1, 0.5607843, 1,
-0.1830817, 0.9447007, -0.4406722, 0, 1, 0.5686275, 1,
-0.1827259, -0.5411706, -0.976977, 0, 1, 0.572549, 1,
-0.1775056, -0.4067488, -1.975437, 0, 1, 0.5803922, 1,
-0.1764057, 0.9075639, 1.311211, 0, 1, 0.5843138, 1,
-0.1749396, 1.434127, 1.136743, 0, 1, 0.5921569, 1,
-0.1720544, 1.093735, 0.4995705, 0, 1, 0.5960785, 1,
-0.1672854, -1.762733, -3.130617, 0, 1, 0.6039216, 1,
-0.1659628, 0.0795999, -1.371898, 0, 1, 0.6117647, 1,
-0.1658687, -0.7678728, -5.224848, 0, 1, 0.6156863, 1,
-0.1616424, 1.52557, -0.8818005, 0, 1, 0.6235294, 1,
-0.1605412, -2.366408, -3.645314, 0, 1, 0.627451, 1,
-0.1574557, 0.0009616086, -1.10591, 0, 1, 0.6352941, 1,
-0.1563244, -0.8240669, -3.661609, 0, 1, 0.6392157, 1,
-0.1559502, -0.143105, -1.788693, 0, 1, 0.6470588, 1,
-0.154617, 1.049155, 2.025786, 0, 1, 0.6509804, 1,
-0.1529231, 0.007865873, -1.89642, 0, 1, 0.6588235, 1,
-0.1502713, 1.07773, 0.1918576, 0, 1, 0.6627451, 1,
-0.1462288, 1.730744, 1.363086, 0, 1, 0.6705883, 1,
-0.14615, 0.5992415, -0.03961064, 0, 1, 0.6745098, 1,
-0.1457241, 0.6527145, -1.083826, 0, 1, 0.682353, 1,
-0.144211, -0.4342888, -2.649868, 0, 1, 0.6862745, 1,
-0.1430358, -2.619081, -3.42241, 0, 1, 0.6941177, 1,
-0.140539, 0.003394496, -2.704183, 0, 1, 0.7019608, 1,
-0.137604, 0.08083986, 0.2322299, 0, 1, 0.7058824, 1,
-0.1367938, 0.1855316, -0.7469181, 0, 1, 0.7137255, 1,
-0.1365984, 0.178952, 0.3346114, 0, 1, 0.7176471, 1,
-0.1342582, -0.7707275, -2.184797, 0, 1, 0.7254902, 1,
-0.128522, 0.07645379, 0.6731201, 0, 1, 0.7294118, 1,
-0.1263213, 1.781399, -0.848318, 0, 1, 0.7372549, 1,
-0.121735, 0.299657, -0.5595707, 0, 1, 0.7411765, 1,
-0.1215148, 1.252199, -0.0488418, 0, 1, 0.7490196, 1,
-0.1210587, -0.2315652, -2.260072, 0, 1, 0.7529412, 1,
-0.1196037, -1.261827, -3.705046, 0, 1, 0.7607843, 1,
-0.1182278, -0.1634189, -3.000253, 0, 1, 0.7647059, 1,
-0.1174853, -2.183647, -2.01736, 0, 1, 0.772549, 1,
-0.1172684, 0.6739529, -2.240764, 0, 1, 0.7764706, 1,
-0.1150257, -0.1724745, -2.207523, 0, 1, 0.7843137, 1,
-0.1108897, 0.420721, -0.3141496, 0, 1, 0.7882353, 1,
-0.1106937, 0.6939614, -0.04357053, 0, 1, 0.7960784, 1,
-0.1087633, 1.096859, 0.04154623, 0, 1, 0.8039216, 1,
-0.1079576, 0.9074487, -0.9270974, 0, 1, 0.8078431, 1,
-0.1072216, 0.3438488, -0.3977216, 0, 1, 0.8156863, 1,
-0.1050346, 1.012098, -0.2271904, 0, 1, 0.8196079, 1,
-0.1003734, 0.4085379, -0.0367659, 0, 1, 0.827451, 1,
-0.09628444, -0.296103, -2.220242, 0, 1, 0.8313726, 1,
-0.09475914, 0.1025927, 0.5639131, 0, 1, 0.8392157, 1,
-0.08875379, -0.4727086, -2.682271, 0, 1, 0.8431373, 1,
-0.08833387, 0.6078093, 0.9875842, 0, 1, 0.8509804, 1,
-0.08769044, 0.4930365, 0.8706192, 0, 1, 0.854902, 1,
-0.08706634, -0.4592275, -4.127526, 0, 1, 0.8627451, 1,
-0.08645573, -1.330409, -3.942683, 0, 1, 0.8666667, 1,
-0.08541175, -0.322873, -4.16623, 0, 1, 0.8745098, 1,
-0.08453096, 1.127761, -0.6270734, 0, 1, 0.8784314, 1,
-0.08007152, -0.6298206, -1.771632, 0, 1, 0.8862745, 1,
-0.07754327, 0.2371724, -1.229336, 0, 1, 0.8901961, 1,
-0.0766361, 0.8259958, -1.809337, 0, 1, 0.8980392, 1,
-0.07290219, -0.7393446, -4.087919, 0, 1, 0.9058824, 1,
-0.06737018, -0.9276698, -3.038688, 0, 1, 0.9098039, 1,
-0.06534798, -0.01686939, -1.545521, 0, 1, 0.9176471, 1,
-0.06453153, -0.920625, -3.465482, 0, 1, 0.9215686, 1,
-0.0582645, -0.1627082, -2.799329, 0, 1, 0.9294118, 1,
-0.05642428, -0.742768, -3.672125, 0, 1, 0.9333333, 1,
-0.05623099, -1.117286, -4.191089, 0, 1, 0.9411765, 1,
-0.05578986, -1.06496, -2.229155, 0, 1, 0.945098, 1,
-0.05343455, 0.4082228, -0.03865261, 0, 1, 0.9529412, 1,
-0.05209045, 0.2770577, -0.173223, 0, 1, 0.9568627, 1,
-0.05197765, -0.6054789, -2.123376, 0, 1, 0.9647059, 1,
-0.05164078, -0.4829676, -1.567668, 0, 1, 0.9686275, 1,
-0.05136593, 0.2346127, -0.4188897, 0, 1, 0.9764706, 1,
-0.04553595, -1.177868, -3.762573, 0, 1, 0.9803922, 1,
-0.04473003, 0.8615426, 1.155642, 0, 1, 0.9882353, 1,
-0.04309032, -0.01269338, -1.722683, 0, 1, 0.9921569, 1,
-0.03725093, 0.01686459, 0.6727048, 0, 1, 1, 1,
-0.03643636, -0.3576043, -3.741181, 0, 0.9921569, 1, 1,
-0.03605208, -0.3831823, -3.342414, 0, 0.9882353, 1, 1,
-0.03548222, -0.008650205, -1.306787, 0, 0.9803922, 1, 1,
-0.03400553, 0.3536548, 0.3851282, 0, 0.9764706, 1, 1,
-0.0255587, -1.179035, -3.731098, 0, 0.9686275, 1, 1,
-0.02358925, 0.9159366, 0.3972176, 0, 0.9647059, 1, 1,
-0.02183189, -1.482454, -1.495728, 0, 0.9568627, 1, 1,
-0.02003187, -0.1188153, -1.79407, 0, 0.9529412, 1, 1,
-0.01715278, 1.19845, 0.3058671, 0, 0.945098, 1, 1,
-0.01564405, -1.140998, -3.232249, 0, 0.9411765, 1, 1,
-0.01242415, -0.05959902, -2.253216, 0, 0.9333333, 1, 1,
-0.01101112, -0.3471776, -2.960994, 0, 0.9294118, 1, 1,
-0.0109647, 0.426893, -0.3726925, 0, 0.9215686, 1, 1,
-0.009515576, 1.310864, -0.4462107, 0, 0.9176471, 1, 1,
-0.008043122, -1.052338, -1.500328, 0, 0.9098039, 1, 1,
-0.007973127, 0.5423192, 0.2776957, 0, 0.9058824, 1, 1,
-0.007849018, -0.1340948, -2.363385, 0, 0.8980392, 1, 1,
-0.003184956, -1.376112, -3.427244, 0, 0.8901961, 1, 1,
-0.00181143, 0.8305632, -0.1209024, 0, 0.8862745, 1, 1,
-0.001476609, -0.9021094, -2.498301, 0, 0.8784314, 1, 1,
-0.00106368, 1.239401, 0.8802783, 0, 0.8745098, 1, 1,
0.002711927, 1.976342, 0.363066, 0, 0.8666667, 1, 1,
0.004207996, 1.739913, -1.171146, 0, 0.8627451, 1, 1,
0.005764681, -0.688686, 1.918959, 0, 0.854902, 1, 1,
0.01078669, -1.603651, 2.349798, 0, 0.8509804, 1, 1,
0.01233929, 0.07370303, 0.5033301, 0, 0.8431373, 1, 1,
0.01419153, -0.1691531, 2.547348, 0, 0.8392157, 1, 1,
0.01491729, -0.6459586, 2.47375, 0, 0.8313726, 1, 1,
0.01644567, 0.5665486, 0.3125323, 0, 0.827451, 1, 1,
0.01938926, -0.09000111, 2.761744, 0, 0.8196079, 1, 1,
0.0197464, 1.849885, -2.016421, 0, 0.8156863, 1, 1,
0.02082041, 0.2768251, -1.110975, 0, 0.8078431, 1, 1,
0.02105612, -0.1947382, 3.651255, 0, 0.8039216, 1, 1,
0.02531208, -1.570671, 2.480563, 0, 0.7960784, 1, 1,
0.02608617, 1.073875, -1.308022, 0, 0.7882353, 1, 1,
0.02617042, -0.9036947, 2.79531, 0, 0.7843137, 1, 1,
0.02965431, -1.397133, 2.303126, 0, 0.7764706, 1, 1,
0.03725844, -0.316372, 1.633552, 0, 0.772549, 1, 1,
0.04280509, -0.6767226, 2.091243, 0, 0.7647059, 1, 1,
0.04857654, 0.5636494, 0.2909767, 0, 0.7607843, 1, 1,
0.04968654, 0.2223171, 1.065216, 0, 0.7529412, 1, 1,
0.05327997, -0.496348, 2.702668, 0, 0.7490196, 1, 1,
0.05470186, -0.01927366, 3.092065, 0, 0.7411765, 1, 1,
0.05556168, 1.842449, -1.055615, 0, 0.7372549, 1, 1,
0.05585774, 0.3463001, -0.7871284, 0, 0.7294118, 1, 1,
0.05913804, 1.62638, 0.9270143, 0, 0.7254902, 1, 1,
0.06010349, -0.1505388, 2.802225, 0, 0.7176471, 1, 1,
0.06083067, -0.1003708, 2.14595, 0, 0.7137255, 1, 1,
0.06501585, 0.3884757, -0.3179482, 0, 0.7058824, 1, 1,
0.06512742, -1.815296, 4.060441, 0, 0.6980392, 1, 1,
0.06815924, -0.8903842, 1.599907, 0, 0.6941177, 1, 1,
0.07730495, -0.566297, 1.968089, 0, 0.6862745, 1, 1,
0.08072434, -1.285625, 2.705359, 0, 0.682353, 1, 1,
0.08149869, 1.855823, 0.9212776, 0, 0.6745098, 1, 1,
0.08280911, 1.729891, 0.1375041, 0, 0.6705883, 1, 1,
0.08444155, 0.3940444, 1.133449, 0, 0.6627451, 1, 1,
0.08743436, -1.036853, 4.880893, 0, 0.6588235, 1, 1,
0.08795247, -2.253066, 3.385267, 0, 0.6509804, 1, 1,
0.09028242, -0.08933163, 1.95253, 0, 0.6470588, 1, 1,
0.09299363, 1.302267, -1.667352, 0, 0.6392157, 1, 1,
0.09643567, -0.2120998, 1.630435, 0, 0.6352941, 1, 1,
0.09946296, 1.339063, 0.4345736, 0, 0.627451, 1, 1,
0.1058887, 0.4100311, 0.6033203, 0, 0.6235294, 1, 1,
0.1116618, -0.6638905, 2.99386, 0, 0.6156863, 1, 1,
0.1129212, 0.1275121, -0.8359945, 0, 0.6117647, 1, 1,
0.1137157, 1.566753, 1.268201, 0, 0.6039216, 1, 1,
0.1178931, -2.680448, 2.197579, 0, 0.5960785, 1, 1,
0.1226698, 0.4443098, 1.278499, 0, 0.5921569, 1, 1,
0.1228881, 0.868816, 0.4039486, 0, 0.5843138, 1, 1,
0.1256723, -1.670599, 3.65733, 0, 0.5803922, 1, 1,
0.1333326, -1.265199, 2.487207, 0, 0.572549, 1, 1,
0.1335953, -0.09968545, 0.002717948, 0, 0.5686275, 1, 1,
0.1395936, -1.013986, 3.259702, 0, 0.5607843, 1, 1,
0.1516438, 0.1613305, 1.141545, 0, 0.5568628, 1, 1,
0.1535313, -1.019938, 2.59275, 0, 0.5490196, 1, 1,
0.1563377, 1.277964, 1.171865, 0, 0.5450981, 1, 1,
0.1571974, -0.4719323, 1.047029, 0, 0.5372549, 1, 1,
0.1577863, 1.517209, -0.09359635, 0, 0.5333334, 1, 1,
0.1593291, -1.421169, 2.925076, 0, 0.5254902, 1, 1,
0.1605189, 0.0522534, -0.2936872, 0, 0.5215687, 1, 1,
0.1622552, 1.266254, 0.02588508, 0, 0.5137255, 1, 1,
0.1641403, 0.7450653, 0.2492306, 0, 0.509804, 1, 1,
0.1646444, -0.2801444, 3.860723, 0, 0.5019608, 1, 1,
0.1650808, -1.585194, 2.547165, 0, 0.4941176, 1, 1,
0.1737303, 0.4405845, 0.3057968, 0, 0.4901961, 1, 1,
0.1756705, 0.8453238, -0.3946538, 0, 0.4823529, 1, 1,
0.1772144, -0.1701597, 2.27715, 0, 0.4784314, 1, 1,
0.1793268, -1.175593, 4.616857, 0, 0.4705882, 1, 1,
0.1833396, -1.224757, 1.420993, 0, 0.4666667, 1, 1,
0.183966, 0.2318131, 1.03561, 0, 0.4588235, 1, 1,
0.1852853, 0.4393762, 0.5056173, 0, 0.454902, 1, 1,
0.1865086, 0.735967, 0.8975131, 0, 0.4470588, 1, 1,
0.1885403, 1.307751, -0.1225622, 0, 0.4431373, 1, 1,
0.1889074, 1.507592, 0.6115277, 0, 0.4352941, 1, 1,
0.1890359, 1.18468, 0.4688074, 0, 0.4313726, 1, 1,
0.1900422, -0.01085566, 1.746359, 0, 0.4235294, 1, 1,
0.1939585, 0.6725671, 1.193144, 0, 0.4196078, 1, 1,
0.1940906, -0.03805676, 2.732312, 0, 0.4117647, 1, 1,
0.195711, -1.211032, 4.915349, 0, 0.4078431, 1, 1,
0.2042892, -2.084051, 2.600498, 0, 0.4, 1, 1,
0.2050667, -0.08343176, 1.510453, 0, 0.3921569, 1, 1,
0.2053027, 1.424224, 1.546008, 0, 0.3882353, 1, 1,
0.2063067, 0.6662631, 2.099583, 0, 0.3803922, 1, 1,
0.2087749, -0.4110758, 2.036728, 0, 0.3764706, 1, 1,
0.2124587, 0.5517153, -0.01275966, 0, 0.3686275, 1, 1,
0.2221834, -1.463495, 1.380003, 0, 0.3647059, 1, 1,
0.2226688, 1.025846, 0.8495989, 0, 0.3568628, 1, 1,
0.2315287, -0.7427333, 1.64847, 0, 0.3529412, 1, 1,
0.2317593, -0.6925936, 1.164988, 0, 0.345098, 1, 1,
0.2339635, -0.9141322, 3.542605, 0, 0.3411765, 1, 1,
0.236939, -1.041727, 2.801275, 0, 0.3333333, 1, 1,
0.2378523, 0.06144428, -0.6995018, 0, 0.3294118, 1, 1,
0.2380386, 0.4027869, 1.372224, 0, 0.3215686, 1, 1,
0.2382815, -0.6099698, 3.626447, 0, 0.3176471, 1, 1,
0.238543, 0.1376306, -0.7360732, 0, 0.3098039, 1, 1,
0.2389858, 0.6913086, -0.4533961, 0, 0.3058824, 1, 1,
0.2390675, -0.03071627, 2.195076, 0, 0.2980392, 1, 1,
0.2394189, 1.295745, 0.4523271, 0, 0.2901961, 1, 1,
0.2422925, 1.7763, 0.3894582, 0, 0.2862745, 1, 1,
0.2458878, 0.4282227, 0.08326601, 0, 0.2784314, 1, 1,
0.2471428, 0.785365, 0.177809, 0, 0.2745098, 1, 1,
0.2512809, 1.1306, 0.1827349, 0, 0.2666667, 1, 1,
0.2574506, 0.8036752, 1.700627, 0, 0.2627451, 1, 1,
0.2586474, -0.7344175, 3.499413, 0, 0.254902, 1, 1,
0.2603659, -1.476416, 1.094621, 0, 0.2509804, 1, 1,
0.2679068, -0.4026941, 3.094699, 0, 0.2431373, 1, 1,
0.2723489, -1.908698, 1.812495, 0, 0.2392157, 1, 1,
0.2735254, 0.5254226, 1.78208, 0, 0.2313726, 1, 1,
0.2735725, -1.391826, 2.83706, 0, 0.227451, 1, 1,
0.2775272, -2.224617, 2.146944, 0, 0.2196078, 1, 1,
0.2799785, -0.04044044, 0.4305215, 0, 0.2156863, 1, 1,
0.2816779, -0.1570477, 1.942322, 0, 0.2078431, 1, 1,
0.2821384, -0.925765, 2.797788, 0, 0.2039216, 1, 1,
0.2828406, 0.6608922, 1.849563, 0, 0.1960784, 1, 1,
0.2858338, 1.001831, 1.296854, 0, 0.1882353, 1, 1,
0.2861089, 0.2576313, -0.4197437, 0, 0.1843137, 1, 1,
0.2863188, -0.4746249, 3.378984, 0, 0.1764706, 1, 1,
0.2875312, -0.05926565, 3.040598, 0, 0.172549, 1, 1,
0.2928455, 1.23993, 1.556879, 0, 0.1647059, 1, 1,
0.2928899, -0.3824955, 2.451526, 0, 0.1607843, 1, 1,
0.2972309, -1.284917, 2.721611, 0, 0.1529412, 1, 1,
0.3016844, -0.5067186, 1.56415, 0, 0.1490196, 1, 1,
0.3028376, -0.5338718, 3.549519, 0, 0.1411765, 1, 1,
0.3041418, 1.209441, 0.5797747, 0, 0.1372549, 1, 1,
0.3046667, -0.06010725, 1.412804, 0, 0.1294118, 1, 1,
0.3082479, -0.08019233, 0.04914366, 0, 0.1254902, 1, 1,
0.3082769, -1.818389, 3.539536, 0, 0.1176471, 1, 1,
0.3109947, 0.2408918, 1.51128, 0, 0.1137255, 1, 1,
0.3134491, 0.06911469, 0.2914349, 0, 0.1058824, 1, 1,
0.3159445, 0.9629297, -1.28128, 0, 0.09803922, 1, 1,
0.3268182, -0.3311808, 1.893584, 0, 0.09411765, 1, 1,
0.3286982, -0.7671188, 2.686911, 0, 0.08627451, 1, 1,
0.3300848, 0.500607, 0.05961647, 0, 0.08235294, 1, 1,
0.3307859, -0.3403701, 3.414771, 0, 0.07450981, 1, 1,
0.3335073, -0.2753467, 2.171634, 0, 0.07058824, 1, 1,
0.3354147, -0.3486122, 3.037443, 0, 0.0627451, 1, 1,
0.3360222, -1.315417, 3.199648, 0, 0.05882353, 1, 1,
0.3461503, -0.0507115, 2.333428, 0, 0.05098039, 1, 1,
0.3563059, 1.328712, 0.4554147, 0, 0.04705882, 1, 1,
0.3627256, -0.3787925, 0.4300037, 0, 0.03921569, 1, 1,
0.3649721, 1.135625, 0.7709995, 0, 0.03529412, 1, 1,
0.3689676, -1.19391, 3.488027, 0, 0.02745098, 1, 1,
0.3793663, -0.4196288, 0.8168826, 0, 0.02352941, 1, 1,
0.3799534, -0.1628554, 2.596424, 0, 0.01568628, 1, 1,
0.3833019, -0.1142045, 1.173196, 0, 0.01176471, 1, 1,
0.3846753, 0.7805619, 0.9862189, 0, 0.003921569, 1, 1,
0.3884677, -0.6061187, 1.881861, 0.003921569, 0, 1, 1,
0.3938903, -1.260106, 3.318187, 0.007843138, 0, 1, 1,
0.3955533, -0.4959586, 0.8251905, 0.01568628, 0, 1, 1,
0.405403, 0.7932557, 1.51994, 0.01960784, 0, 1, 1,
0.4087318, -1.540225, 3.002131, 0.02745098, 0, 1, 1,
0.4104552, -0.5716966, 2.894954, 0.03137255, 0, 1, 1,
0.4152611, -1.866417, 1.107474, 0.03921569, 0, 1, 1,
0.421408, 0.2778954, 0.2686988, 0.04313726, 0, 1, 1,
0.4225096, -0.7488758, 2.50353, 0.05098039, 0, 1, 1,
0.4228693, -2.490751, 5.071337, 0.05490196, 0, 1, 1,
0.424769, -1.798282, 2.06242, 0.0627451, 0, 1, 1,
0.426031, 0.5079051, 0.4219469, 0.06666667, 0, 1, 1,
0.4261533, -0.3719513, -0.01794122, 0.07450981, 0, 1, 1,
0.42906, -0.1477388, 1.461121, 0.07843138, 0, 1, 1,
0.4299097, -0.3646736, 2.4784, 0.08627451, 0, 1, 1,
0.4344371, -0.6361464, 3.132773, 0.09019608, 0, 1, 1,
0.4361701, -1.731194, 2.782765, 0.09803922, 0, 1, 1,
0.4373251, -0.7179186, 3.960716, 0.1058824, 0, 1, 1,
0.4417894, 0.2946181, 3.059424, 0.1098039, 0, 1, 1,
0.4425978, 0.4376584, 0.558833, 0.1176471, 0, 1, 1,
0.445812, -0.7623223, -0.1399444, 0.1215686, 0, 1, 1,
0.4493408, -2.484081, 2.441194, 0.1294118, 0, 1, 1,
0.4529337, -1.411672, 2.781446, 0.1333333, 0, 1, 1,
0.4537291, -1.034615, 4.52779, 0.1411765, 0, 1, 1,
0.454616, -0.7022545, 2.646535, 0.145098, 0, 1, 1,
0.4554955, -0.6614726, 0.6863993, 0.1529412, 0, 1, 1,
0.4593162, 1.995027, 0.02031959, 0.1568628, 0, 1, 1,
0.4611305, -0.6015326, 3.773097, 0.1647059, 0, 1, 1,
0.4628924, 0.5024022, -0.3375148, 0.1686275, 0, 1, 1,
0.464204, 0.3525919, 1.676873, 0.1764706, 0, 1, 1,
0.4652865, -0.5739101, 1.736776, 0.1803922, 0, 1, 1,
0.4655789, -0.4108713, 2.712175, 0.1882353, 0, 1, 1,
0.4681344, -0.5955013, 3.232804, 0.1921569, 0, 1, 1,
0.4722117, 1.314382, -1.822157, 0.2, 0, 1, 1,
0.4738808, -1.591351, 3.985714, 0.2078431, 0, 1, 1,
0.4773838, -0.8554657, 1.949821, 0.2117647, 0, 1, 1,
0.4843522, 2.58026, -0.3727371, 0.2196078, 0, 1, 1,
0.4933967, 1.123607, 0.2111613, 0.2235294, 0, 1, 1,
0.4946674, 0.6756201, 0.8315049, 0.2313726, 0, 1, 1,
0.501896, 0.02313526, 1.033836, 0.2352941, 0, 1, 1,
0.5021754, -0.4119904, 2.160088, 0.2431373, 0, 1, 1,
0.5053683, -0.06284229, 1.468661, 0.2470588, 0, 1, 1,
0.5078325, -0.02733172, 3.983112, 0.254902, 0, 1, 1,
0.5093128, -0.6848015, 2.703168, 0.2588235, 0, 1, 1,
0.510704, 0.012171, 1.180321, 0.2666667, 0, 1, 1,
0.5120292, 2.216052, 1.975949, 0.2705882, 0, 1, 1,
0.5153008, -1.5782, 1.45748, 0.2784314, 0, 1, 1,
0.517187, 0.3948876, -0.5327462, 0.282353, 0, 1, 1,
0.5198665, -1.021843, 2.164711, 0.2901961, 0, 1, 1,
0.5262978, -1.052337, 2.962051, 0.2941177, 0, 1, 1,
0.5323144, 2.603552, 0.2594673, 0.3019608, 0, 1, 1,
0.5330968, -1.750919, 4.631074, 0.3098039, 0, 1, 1,
0.5461705, -1.254195, 3.411264, 0.3137255, 0, 1, 1,
0.5487332, -0.4908203, 2.830537, 0.3215686, 0, 1, 1,
0.5525303, 1.714191, 1.258184, 0.3254902, 0, 1, 1,
0.553574, -0.06052216, 0.3598954, 0.3333333, 0, 1, 1,
0.5554962, -1.805057, 1.609515, 0.3372549, 0, 1, 1,
0.5571542, -0.4880425, 3.103272, 0.345098, 0, 1, 1,
0.5615971, -0.7408661, 3.11163, 0.3490196, 0, 1, 1,
0.5643179, 0.02605161, 1.152692, 0.3568628, 0, 1, 1,
0.5643669, 0.2371426, 2.179999, 0.3607843, 0, 1, 1,
0.5660818, -0.04449826, 1.908741, 0.3686275, 0, 1, 1,
0.5699323, 0.5215243, 1.565833, 0.372549, 0, 1, 1,
0.5712386, -0.2096037, 2.615351, 0.3803922, 0, 1, 1,
0.5714286, 0.4375739, 1.863862, 0.3843137, 0, 1, 1,
0.5722291, 0.7104087, 0.4805742, 0.3921569, 0, 1, 1,
0.5732293, -1.2391, 4.0632, 0.3960784, 0, 1, 1,
0.5761257, 0.805172, 0.7703992, 0.4039216, 0, 1, 1,
0.5804609, -0.5656435, 2.360137, 0.4117647, 0, 1, 1,
0.584283, -0.5570764, 1.029724, 0.4156863, 0, 1, 1,
0.5864113, 0.6580513, 0.448883, 0.4235294, 0, 1, 1,
0.6041034, 2.030266, 0.6861465, 0.427451, 0, 1, 1,
0.6064077, -0.631229, 2.014836, 0.4352941, 0, 1, 1,
0.6158795, -1.046337, 1.930754, 0.4392157, 0, 1, 1,
0.6206743, 0.5518999, 2.8482, 0.4470588, 0, 1, 1,
0.6229366, -0.3221356, 1.31367, 0.4509804, 0, 1, 1,
0.6239986, 0.04045808, 2.737081, 0.4588235, 0, 1, 1,
0.633636, -0.4854383, 3.56311, 0.4627451, 0, 1, 1,
0.6354634, -0.08234689, 3.353966, 0.4705882, 0, 1, 1,
0.637422, 2.4459, 1.996274, 0.4745098, 0, 1, 1,
0.6397514, -0.1024539, 1.255678, 0.4823529, 0, 1, 1,
0.641241, -1.11455, 0.526852, 0.4862745, 0, 1, 1,
0.6434592, 0.3917523, 1.273499, 0.4941176, 0, 1, 1,
0.6450502, 0.1099859, -1.010865, 0.5019608, 0, 1, 1,
0.6474727, -0.9079086, 2.078772, 0.5058824, 0, 1, 1,
0.6498625, 0.5922133, 0.6220728, 0.5137255, 0, 1, 1,
0.6507567, -1.345337, 3.16083, 0.5176471, 0, 1, 1,
0.6514842, -0.6650721, 1.322394, 0.5254902, 0, 1, 1,
0.6541036, -0.6508855, 2.504393, 0.5294118, 0, 1, 1,
0.6596169, -0.4685027, 2.046084, 0.5372549, 0, 1, 1,
0.6600357, -0.9272373, 3.290041, 0.5411765, 0, 1, 1,
0.6718038, 0.8643333, 0.9330647, 0.5490196, 0, 1, 1,
0.67378, 1.325937, 2.009178, 0.5529412, 0, 1, 1,
0.674848, -0.4921977, 1.886252, 0.5607843, 0, 1, 1,
0.6806437, -0.1795599, 1.245671, 0.5647059, 0, 1, 1,
0.6810108, -0.1343358, 2.302991, 0.572549, 0, 1, 1,
0.6832399, 1.115724, 1.775607, 0.5764706, 0, 1, 1,
0.6856215, -0.4678755, 2.462192, 0.5843138, 0, 1, 1,
0.6906338, 1.009441, 1.037026, 0.5882353, 0, 1, 1,
0.694893, -0.9948012, 0.9517738, 0.5960785, 0, 1, 1,
0.6951992, 1.360399, 0.1514284, 0.6039216, 0, 1, 1,
0.696842, 1.468225, 0.6409656, 0.6078432, 0, 1, 1,
0.6991564, 0.4725732, 1.533237, 0.6156863, 0, 1, 1,
0.7038156, -0.7213475, 2.550385, 0.6196079, 0, 1, 1,
0.7061363, 0.4710827, 2.980285, 0.627451, 0, 1, 1,
0.7062958, 0.3130641, 0.78416, 0.6313726, 0, 1, 1,
0.7122144, 0.998647, 2.048936, 0.6392157, 0, 1, 1,
0.7209427, -0.5356011, 2.816661, 0.6431373, 0, 1, 1,
0.7412292, 0.8495572, -0.7846703, 0.6509804, 0, 1, 1,
0.7422947, 1.239584, 0.9430425, 0.654902, 0, 1, 1,
0.7466406, -0.8791882, 2.253711, 0.6627451, 0, 1, 1,
0.7561776, 0.6750684, -0.05880276, 0.6666667, 0, 1, 1,
0.7647643, -1.235207, 3.357893, 0.6745098, 0, 1, 1,
0.7650192, 0.9366358, 0.6147258, 0.6784314, 0, 1, 1,
0.768272, 0.2879206, 0.4148195, 0.6862745, 0, 1, 1,
0.7688081, -0.7449931, 2.136661, 0.6901961, 0, 1, 1,
0.7714247, 0.7432978, 0.6119655, 0.6980392, 0, 1, 1,
0.7728923, -0.7550642, 0.4634204, 0.7058824, 0, 1, 1,
0.7747647, -0.8473493, 3.47797, 0.7098039, 0, 1, 1,
0.7766092, -0.0460976, 0.904246, 0.7176471, 0, 1, 1,
0.780356, -1.311545, 2.804057, 0.7215686, 0, 1, 1,
0.7832165, 0.03727982, 0.4417928, 0.7294118, 0, 1, 1,
0.7855446, -0.4696971, 2.205503, 0.7333333, 0, 1, 1,
0.7862533, 0.1946447, 0.9380099, 0.7411765, 0, 1, 1,
0.7878637, -1.009694, 3.108632, 0.7450981, 0, 1, 1,
0.7906662, 0.5302609, 0.8935974, 0.7529412, 0, 1, 1,
0.7953902, -0.4894508, 0.7215579, 0.7568628, 0, 1, 1,
0.7958429, -1.26822, 2.67857, 0.7647059, 0, 1, 1,
0.797714, 0.4369475, 1.431136, 0.7686275, 0, 1, 1,
0.7978685, 1.026348, 1.19474, 0.7764706, 0, 1, 1,
0.8067876, -0.2125914, 2.901578, 0.7803922, 0, 1, 1,
0.8088374, -1.490562, 1.760553, 0.7882353, 0, 1, 1,
0.8112046, -0.3048471, 1.364917, 0.7921569, 0, 1, 1,
0.8114517, 0.03364084, 1.619943, 0.8, 0, 1, 1,
0.81467, -0.878389, 2.984354, 0.8078431, 0, 1, 1,
0.8262635, 1.103443, 1.98799, 0.8117647, 0, 1, 1,
0.8274797, -0.1755311, 0.0445317, 0.8196079, 0, 1, 1,
0.83764, -0.7392114, 1.638677, 0.8235294, 0, 1, 1,
0.844947, -0.1060602, 2.615391, 0.8313726, 0, 1, 1,
0.8452908, -0.5770481, -0.2237249, 0.8352941, 0, 1, 1,
0.8493603, 0.3096637, 1.595932, 0.8431373, 0, 1, 1,
0.8540077, -0.07726938, 1.297229, 0.8470588, 0, 1, 1,
0.8544855, -0.6987571, 0.7040224, 0.854902, 0, 1, 1,
0.8663726, 0.9284434, 1.242618, 0.8588235, 0, 1, 1,
0.8774238, 0.5019566, 1.181854, 0.8666667, 0, 1, 1,
0.8781754, -1.531944, 2.049436, 0.8705882, 0, 1, 1,
0.8848646, 0.1666571, 2.803184, 0.8784314, 0, 1, 1,
0.8901011, 1.349811, 1.646435, 0.8823529, 0, 1, 1,
0.8906659, -0.1088254, 3.702312, 0.8901961, 0, 1, 1,
0.892793, -0.3913567, 2.845081, 0.8941177, 0, 1, 1,
0.8942989, 0.748136, -0.1079828, 0.9019608, 0, 1, 1,
0.90067, -1.308749, 2.341402, 0.9098039, 0, 1, 1,
0.9056466, 1.4006, -0.9227803, 0.9137255, 0, 1, 1,
0.9093335, 0.903929, 1.08977, 0.9215686, 0, 1, 1,
0.9156834, -0.2073054, -0.3549584, 0.9254902, 0, 1, 1,
0.9227286, 0.5504169, 2.239531, 0.9333333, 0, 1, 1,
0.9255503, -0.0655001, 0.6978807, 0.9372549, 0, 1, 1,
0.9258292, 0.8910547, -0.1371382, 0.945098, 0, 1, 1,
0.9313726, -1.264561, 2.794487, 0.9490196, 0, 1, 1,
0.9334624, -0.2220732, 2.312947, 0.9568627, 0, 1, 1,
0.9339625, -2.243915, 3.818321, 0.9607843, 0, 1, 1,
0.9347151, -1.600554, 2.856034, 0.9686275, 0, 1, 1,
0.9375879, 0.2608652, 1.232973, 0.972549, 0, 1, 1,
0.9418651, -2.372812, 3.302495, 0.9803922, 0, 1, 1,
0.9423915, -1.236337, 1.244182, 0.9843137, 0, 1, 1,
0.947619, -0.9843601, 1.938246, 0.9921569, 0, 1, 1,
0.9541044, 0.7255397, 0.9856988, 0.9960784, 0, 1, 1,
0.9565239, -1.077754, 3.372129, 1, 0, 0.9960784, 1,
0.9594333, 0.1314507, 0.9239066, 1, 0, 0.9882353, 1,
0.968823, -0.08916885, 2.711483, 1, 0, 0.9843137, 1,
0.9726117, -0.5935394, 3.667197, 1, 0, 0.9764706, 1,
0.9763417, 0.3093044, 1.14833, 1, 0, 0.972549, 1,
0.9825574, 0.6587117, 0.7949803, 1, 0, 0.9647059, 1,
0.9837338, -0.4141883, 1.876667, 1, 0, 0.9607843, 1,
0.9905871, -0.9344909, 1.797125, 1, 0, 0.9529412, 1,
0.9932934, 1.914143, 2.310405, 1, 0, 0.9490196, 1,
0.9949205, 0.6181651, 0.902338, 1, 0, 0.9411765, 1,
0.9995784, 0.1513458, 1.133536, 1, 0, 0.9372549, 1,
1.000062, -1.742052, 4.969057, 1, 0, 0.9294118, 1,
1.004453, 0.592671, 1.075512, 1, 0, 0.9254902, 1,
1.011328, -0.9847687, 1.716839, 1, 0, 0.9176471, 1,
1.015791, 1.608289, 1.48312, 1, 0, 0.9137255, 1,
1.018211, 1.108092, 1.019285, 1, 0, 0.9058824, 1,
1.024811, 1.009935, -0.1722677, 1, 0, 0.9019608, 1,
1.028411, -0.5531012, 2.911022, 1, 0, 0.8941177, 1,
1.033208, -1.025324, 3.099728, 1, 0, 0.8862745, 1,
1.040301, 0.4566535, -0.1233756, 1, 0, 0.8823529, 1,
1.041048, 0.891119, 1.633983, 1, 0, 0.8745098, 1,
1.069593, -2.08232, 2.294472, 1, 0, 0.8705882, 1,
1.073478, 1.075392, -0.05499459, 1, 0, 0.8627451, 1,
1.084421, -0.1048751, 0.6222907, 1, 0, 0.8588235, 1,
1.087107, 0.3333644, 1.459288, 1, 0, 0.8509804, 1,
1.088323, 0.2530261, 2.719598, 1, 0, 0.8470588, 1,
1.090435, 0.5822247, 0.9879292, 1, 0, 0.8392157, 1,
1.090966, 1.156268, 0.04362455, 1, 0, 0.8352941, 1,
1.091566, -0.5318937, 2.035967, 1, 0, 0.827451, 1,
1.097709, 0.2634602, 1.648706, 1, 0, 0.8235294, 1,
1.098955, -1.275999, 0.473529, 1, 0, 0.8156863, 1,
1.10673, -0.4151731, 2.652912, 1, 0, 0.8117647, 1,
1.116263, 1.208531, 1.685102, 1, 0, 0.8039216, 1,
1.119533, 0.4437557, 1.266873, 1, 0, 0.7960784, 1,
1.12312, 0.8343912, -0.6300265, 1, 0, 0.7921569, 1,
1.134534, 0.8670229, 1.387748, 1, 0, 0.7843137, 1,
1.138305, 0.3805472, 0.1186966, 1, 0, 0.7803922, 1,
1.13844, 0.1926772, 2.025743, 1, 0, 0.772549, 1,
1.140628, 0.06488601, -0.4435217, 1, 0, 0.7686275, 1,
1.143335, -0.06326209, 4.05946, 1, 0, 0.7607843, 1,
1.143811, -0.4645991, 0.9707213, 1, 0, 0.7568628, 1,
1.145328, 0.0833108, 2.589133, 1, 0, 0.7490196, 1,
1.161676, -0.4092666, 0.9172601, 1, 0, 0.7450981, 1,
1.164042, 0.7492989, 2.184789, 1, 0, 0.7372549, 1,
1.166477, -1.180936, 3.239298, 1, 0, 0.7333333, 1,
1.167873, -0.6000508, 2.101562, 1, 0, 0.7254902, 1,
1.16954, -0.7948748, 4.030005, 1, 0, 0.7215686, 1,
1.170269, -0.9584885, 3.265427, 1, 0, 0.7137255, 1,
1.171671, 1.467251, -0.3730252, 1, 0, 0.7098039, 1,
1.173378, 0.05757201, 0.4031854, 1, 0, 0.7019608, 1,
1.176982, 0.2081919, 0.674539, 1, 0, 0.6941177, 1,
1.180825, -0.996704, 3.377729, 1, 0, 0.6901961, 1,
1.186827, -0.8702229, 0.9342, 1, 0, 0.682353, 1,
1.1887, 0.5784065, 1.204326, 1, 0, 0.6784314, 1,
1.202402, -1.446646, 3.529598, 1, 0, 0.6705883, 1,
1.20252, 1.366112, 0.7243489, 1, 0, 0.6666667, 1,
1.206673, -1.711892, 3.480461, 1, 0, 0.6588235, 1,
1.210357, 0.8001745, 1.199117, 1, 0, 0.654902, 1,
1.210991, 1.113608, -0.6852593, 1, 0, 0.6470588, 1,
1.213156, 0.4470278, 1.659902, 1, 0, 0.6431373, 1,
1.217018, -0.4532877, 1.755902, 1, 0, 0.6352941, 1,
1.223278, 0.1110429, 1.779544, 1, 0, 0.6313726, 1,
1.223318, 0.1722919, 0.8465945, 1, 0, 0.6235294, 1,
1.232087, -0.1530632, 1.767178, 1, 0, 0.6196079, 1,
1.233256, -1.421864, 2.328954, 1, 0, 0.6117647, 1,
1.233969, 1.077677, 2.007606, 1, 0, 0.6078432, 1,
1.251069, -0.9869067, 3.167928, 1, 0, 0.6, 1,
1.264676, -0.5309217, 3.324264, 1, 0, 0.5921569, 1,
1.267933, 0.470483, 0.864157, 1, 0, 0.5882353, 1,
1.277927, -1.212846, 2.272135, 1, 0, 0.5803922, 1,
1.280611, -0.3947139, 1.462414, 1, 0, 0.5764706, 1,
1.281454, -0.6183864, 3.23289, 1, 0, 0.5686275, 1,
1.284075, -0.7727098, 4.488743, 1, 0, 0.5647059, 1,
1.288495, 0.6041474, 1.392167, 1, 0, 0.5568628, 1,
1.289245, -1.079754, 1.770739, 1, 0, 0.5529412, 1,
1.298056, -1.478355, 2.176535, 1, 0, 0.5450981, 1,
1.299352, -0.848702, 2.996615, 1, 0, 0.5411765, 1,
1.322518, -0.1115887, 3.170434, 1, 0, 0.5333334, 1,
1.326124, 1.475446, 0.701427, 1, 0, 0.5294118, 1,
1.326264, -1.876985, 2.398939, 1, 0, 0.5215687, 1,
1.334658, -1.045187, 2.9765, 1, 0, 0.5176471, 1,
1.338181, 1.491736, 1.059955, 1, 0, 0.509804, 1,
1.353717, 1.200646, 1.969093, 1, 0, 0.5058824, 1,
1.359477, 0.972263, 1.962512, 1, 0, 0.4980392, 1,
1.360129, 1.391086, 0.4401506, 1, 0, 0.4901961, 1,
1.394287, 0.4623882, 2.43555, 1, 0, 0.4862745, 1,
1.403224, -0.3438327, 1.259164, 1, 0, 0.4784314, 1,
1.40418, -0.4603677, 0.6820456, 1, 0, 0.4745098, 1,
1.407261, -0.2976427, 1.124399, 1, 0, 0.4666667, 1,
1.410373, 0.6339168, -1.224865, 1, 0, 0.4627451, 1,
1.424319, -0.6938751, 3.336462, 1, 0, 0.454902, 1,
1.425979, 2.115963, 0.2187418, 1, 0, 0.4509804, 1,
1.428138, -0.1637695, 3.169503, 1, 0, 0.4431373, 1,
1.437419, -0.1396187, 1.393866, 1, 0, 0.4392157, 1,
1.446113, 0.3701484, 0.3587891, 1, 0, 0.4313726, 1,
1.45028, 0.5506702, 0.4744378, 1, 0, 0.427451, 1,
1.451744, 2.391654, 1.518999, 1, 0, 0.4196078, 1,
1.453281, 0.6088765, 2.246428, 1, 0, 0.4156863, 1,
1.456005, -0.4991479, 2.178023, 1, 0, 0.4078431, 1,
1.456319, 0.02377043, 2.405129, 1, 0, 0.4039216, 1,
1.46969, 0.3905815, 1.522405, 1, 0, 0.3960784, 1,
1.47034, -0.1119096, 2.517721, 1, 0, 0.3882353, 1,
1.47187, -1.800901, 2.247066, 1, 0, 0.3843137, 1,
1.477911, -1.146851, 2.000623, 1, 0, 0.3764706, 1,
1.479109, 0.6531576, 0.8906237, 1, 0, 0.372549, 1,
1.494922, 0.9443914, 0.7906482, 1, 0, 0.3647059, 1,
1.507564, 2.283263, 1.272121, 1, 0, 0.3607843, 1,
1.512212, 0.8320457, 0.9570195, 1, 0, 0.3529412, 1,
1.52316, 0.05541914, 1.774581, 1, 0, 0.3490196, 1,
1.532323, -0.7695412, 1.589829, 1, 0, 0.3411765, 1,
1.548135, 0.7315114, 0.2664705, 1, 0, 0.3372549, 1,
1.555178, -0.3660868, 3.890614, 1, 0, 0.3294118, 1,
1.560529, -1.267408, 2.655691, 1, 0, 0.3254902, 1,
1.560619, 0.3796487, 0.02067768, 1, 0, 0.3176471, 1,
1.595502, 0.7464158, 1.508231, 1, 0, 0.3137255, 1,
1.598948, -0.9037115, 2.641684, 1, 0, 0.3058824, 1,
1.628477, 0.8931708, 1.872873, 1, 0, 0.2980392, 1,
1.638395, 0.8960314, 0.6641327, 1, 0, 0.2941177, 1,
1.638878, 0.3344317, 1.202915, 1, 0, 0.2862745, 1,
1.641815, -0.4889421, 1.073652, 1, 0, 0.282353, 1,
1.645658, -0.03694919, 2.298343, 1, 0, 0.2745098, 1,
1.646616, -0.7422933, 2.135032, 1, 0, 0.2705882, 1,
1.648149, -1.187835, 1.739841, 1, 0, 0.2627451, 1,
1.649055, -0.5017208, 1.251075, 1, 0, 0.2588235, 1,
1.656276, 1.302113, -0.7218161, 1, 0, 0.2509804, 1,
1.656757, 0.1989418, 0.5131935, 1, 0, 0.2470588, 1,
1.657906, -0.150379, 1.309231, 1, 0, 0.2392157, 1,
1.663894, 0.08590928, 1.970799, 1, 0, 0.2352941, 1,
1.684054, -0.5647092, 0.6418924, 1, 0, 0.227451, 1,
1.68928, 0.2689497, 2.092157, 1, 0, 0.2235294, 1,
1.697732, -1.43108, 3.004193, 1, 0, 0.2156863, 1,
1.701314, -1.9346, 1.557393, 1, 0, 0.2117647, 1,
1.71346, 1.206353, 0.6947131, 1, 0, 0.2039216, 1,
1.723948, -0.5833142, 2.19295, 1, 0, 0.1960784, 1,
1.734676, -0.7659429, 0.9708303, 1, 0, 0.1921569, 1,
1.760283, -1.991385, 4.095119, 1, 0, 0.1843137, 1,
1.761822, -0.8072444, 1.53732, 1, 0, 0.1803922, 1,
1.770103, 0.03207514, 0.7909412, 1, 0, 0.172549, 1,
1.796052, 1.955901, 0.468592, 1, 0, 0.1686275, 1,
1.819495, -0.72225, 4.147362, 1, 0, 0.1607843, 1,
1.824849, 0.9899853, 0.03395398, 1, 0, 0.1568628, 1,
1.828006, -0.1153688, 1.661906, 1, 0, 0.1490196, 1,
1.864261, 0.1228447, 1.21959, 1, 0, 0.145098, 1,
1.864421, -0.8880928, 2.615835, 1, 0, 0.1372549, 1,
1.872357, 2.203686, 1.646832, 1, 0, 0.1333333, 1,
1.874776, -1.125355, 2.708469, 1, 0, 0.1254902, 1,
1.96026, 0.9534006, 0.6743296, 1, 0, 0.1215686, 1,
1.964357, 0.9017016, 1.383859, 1, 0, 0.1137255, 1,
1.979298, -1.034384, 0.9369713, 1, 0, 0.1098039, 1,
1.982983, -0.9837685, 1.259917, 1, 0, 0.1019608, 1,
1.991855, -0.5964296, 1.125843, 1, 0, 0.09411765, 1,
2.128133, 0.2679823, 1.270837, 1, 0, 0.09019608, 1,
2.146968, -0.5861546, 1.961131, 1, 0, 0.08235294, 1,
2.18094, 1.94393, 3.086526, 1, 0, 0.07843138, 1,
2.181012, 0.2209624, 0.96306, 1, 0, 0.07058824, 1,
2.215649, 1.719901, 0.9295609, 1, 0, 0.06666667, 1,
2.227371, -1.533777, 2.018559, 1, 0, 0.05882353, 1,
2.235635, -0.2334493, 1.995638, 1, 0, 0.05490196, 1,
2.266527, 0.2991068, 2.349675, 1, 0, 0.04705882, 1,
2.287693, -0.03796301, -1.185036, 1, 0, 0.04313726, 1,
2.300428, -0.3301377, -0.1976981, 1, 0, 0.03529412, 1,
2.34893, -1.021275, 2.800735, 1, 0, 0.03137255, 1,
2.363095, -0.04695106, 1.494651, 1, 0, 0.02352941, 1,
2.367661, -0.07036176, 0.8501444, 1, 0, 0.01960784, 1,
2.384623, -0.2931903, 0.7517231, 1, 0, 0.01176471, 1,
2.384773, 2.23758, -1.356792, 1, 0, 0.007843138, 1
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
-0.4811383, -3.77675, -6.970051, 0, -0.5, 0.5, 0.5,
-0.4811383, -3.77675, -6.970051, 1, -0.5, 0.5, 0.5,
-0.4811383, -3.77675, -6.970051, 1, 1.5, 0.5, 0.5,
-0.4811383, -3.77675, -6.970051, 0, 1.5, 0.5, 0.5
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
-4.318594, 0.1638606, -6.970051, 0, -0.5, 0.5, 0.5,
-4.318594, 0.1638606, -6.970051, 1, -0.5, 0.5, 0.5,
-4.318594, 0.1638606, -6.970051, 1, 1.5, 0.5, 0.5,
-4.318594, 0.1638606, -6.970051, 0, 1.5, 0.5, 0.5
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
-4.318594, -3.77675, -0.07675529, 0, -0.5, 0.5, 0.5,
-4.318594, -3.77675, -0.07675529, 1, -0.5, 0.5, 0.5,
-4.318594, -3.77675, -0.07675529, 1, 1.5, 0.5, 0.5,
-4.318594, -3.77675, -0.07675529, 0, 1.5, 0.5, 0.5
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
-3, -2.867378, -5.379291,
2, -2.867378, -5.379291,
-3, -2.867378, -5.379291,
-3, -3.01894, -5.644417,
-2, -2.867378, -5.379291,
-2, -3.01894, -5.644417,
-1, -2.867378, -5.379291,
-1, -3.01894, -5.644417,
0, -2.867378, -5.379291,
0, -3.01894, -5.644417,
1, -2.867378, -5.379291,
1, -3.01894, -5.644417,
2, -2.867378, -5.379291,
2, -3.01894, -5.644417
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
-3, -3.322064, -6.174671, 0, -0.5, 0.5, 0.5,
-3, -3.322064, -6.174671, 1, -0.5, 0.5, 0.5,
-3, -3.322064, -6.174671, 1, 1.5, 0.5, 0.5,
-3, -3.322064, -6.174671, 0, 1.5, 0.5, 0.5,
-2, -3.322064, -6.174671, 0, -0.5, 0.5, 0.5,
-2, -3.322064, -6.174671, 1, -0.5, 0.5, 0.5,
-2, -3.322064, -6.174671, 1, 1.5, 0.5, 0.5,
-2, -3.322064, -6.174671, 0, 1.5, 0.5, 0.5,
-1, -3.322064, -6.174671, 0, -0.5, 0.5, 0.5,
-1, -3.322064, -6.174671, 1, -0.5, 0.5, 0.5,
-1, -3.322064, -6.174671, 1, 1.5, 0.5, 0.5,
-1, -3.322064, -6.174671, 0, 1.5, 0.5, 0.5,
0, -3.322064, -6.174671, 0, -0.5, 0.5, 0.5,
0, -3.322064, -6.174671, 1, -0.5, 0.5, 0.5,
0, -3.322064, -6.174671, 1, 1.5, 0.5, 0.5,
0, -3.322064, -6.174671, 0, 1.5, 0.5, 0.5,
1, -3.322064, -6.174671, 0, -0.5, 0.5, 0.5,
1, -3.322064, -6.174671, 1, -0.5, 0.5, 0.5,
1, -3.322064, -6.174671, 1, 1.5, 0.5, 0.5,
1, -3.322064, -6.174671, 0, 1.5, 0.5, 0.5,
2, -3.322064, -6.174671, 0, -0.5, 0.5, 0.5,
2, -3.322064, -6.174671, 1, -0.5, 0.5, 0.5,
2, -3.322064, -6.174671, 1, 1.5, 0.5, 0.5,
2, -3.322064, -6.174671, 0, 1.5, 0.5, 0.5
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
-3.433027, -2, -5.379291,
-3.433027, 3, -5.379291,
-3.433027, -2, -5.379291,
-3.580621, -2, -5.644417,
-3.433027, -1, -5.379291,
-3.580621, -1, -5.644417,
-3.433027, 0, -5.379291,
-3.580621, 0, -5.644417,
-3.433027, 1, -5.379291,
-3.580621, 1, -5.644417,
-3.433027, 2, -5.379291,
-3.580621, 2, -5.644417,
-3.433027, 3, -5.379291,
-3.580621, 3, -5.644417
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
-3.87581, -2, -6.174671, 0, -0.5, 0.5, 0.5,
-3.87581, -2, -6.174671, 1, -0.5, 0.5, 0.5,
-3.87581, -2, -6.174671, 1, 1.5, 0.5, 0.5,
-3.87581, -2, -6.174671, 0, 1.5, 0.5, 0.5,
-3.87581, -1, -6.174671, 0, -0.5, 0.5, 0.5,
-3.87581, -1, -6.174671, 1, -0.5, 0.5, 0.5,
-3.87581, -1, -6.174671, 1, 1.5, 0.5, 0.5,
-3.87581, -1, -6.174671, 0, 1.5, 0.5, 0.5,
-3.87581, 0, -6.174671, 0, -0.5, 0.5, 0.5,
-3.87581, 0, -6.174671, 1, -0.5, 0.5, 0.5,
-3.87581, 0, -6.174671, 1, 1.5, 0.5, 0.5,
-3.87581, 0, -6.174671, 0, 1.5, 0.5, 0.5,
-3.87581, 1, -6.174671, 0, -0.5, 0.5, 0.5,
-3.87581, 1, -6.174671, 1, -0.5, 0.5, 0.5,
-3.87581, 1, -6.174671, 1, 1.5, 0.5, 0.5,
-3.87581, 1, -6.174671, 0, 1.5, 0.5, 0.5,
-3.87581, 2, -6.174671, 0, -0.5, 0.5, 0.5,
-3.87581, 2, -6.174671, 1, -0.5, 0.5, 0.5,
-3.87581, 2, -6.174671, 1, 1.5, 0.5, 0.5,
-3.87581, 2, -6.174671, 0, 1.5, 0.5, 0.5,
-3.87581, 3, -6.174671, 0, -0.5, 0.5, 0.5,
-3.87581, 3, -6.174671, 1, -0.5, 0.5, 0.5,
-3.87581, 3, -6.174671, 1, 1.5, 0.5, 0.5,
-3.87581, 3, -6.174671, 0, 1.5, 0.5, 0.5
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
-3.433027, -2.867378, -4,
-3.433027, -2.867378, 4,
-3.433027, -2.867378, -4,
-3.580621, -3.01894, -4,
-3.433027, -2.867378, -2,
-3.580621, -3.01894, -2,
-3.433027, -2.867378, 0,
-3.580621, -3.01894, 0,
-3.433027, -2.867378, 2,
-3.580621, -3.01894, 2,
-3.433027, -2.867378, 4,
-3.580621, -3.01894, 4
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
-3.87581, -3.322064, -4, 0, -0.5, 0.5, 0.5,
-3.87581, -3.322064, -4, 1, -0.5, 0.5, 0.5,
-3.87581, -3.322064, -4, 1, 1.5, 0.5, 0.5,
-3.87581, -3.322064, -4, 0, 1.5, 0.5, 0.5,
-3.87581, -3.322064, -2, 0, -0.5, 0.5, 0.5,
-3.87581, -3.322064, -2, 1, -0.5, 0.5, 0.5,
-3.87581, -3.322064, -2, 1, 1.5, 0.5, 0.5,
-3.87581, -3.322064, -2, 0, 1.5, 0.5, 0.5,
-3.87581, -3.322064, 0, 0, -0.5, 0.5, 0.5,
-3.87581, -3.322064, 0, 1, -0.5, 0.5, 0.5,
-3.87581, -3.322064, 0, 1, 1.5, 0.5, 0.5,
-3.87581, -3.322064, 0, 0, 1.5, 0.5, 0.5,
-3.87581, -3.322064, 2, 0, -0.5, 0.5, 0.5,
-3.87581, -3.322064, 2, 1, -0.5, 0.5, 0.5,
-3.87581, -3.322064, 2, 1, 1.5, 0.5, 0.5,
-3.87581, -3.322064, 2, 0, 1.5, 0.5, 0.5,
-3.87581, -3.322064, 4, 0, -0.5, 0.5, 0.5,
-3.87581, -3.322064, 4, 1, -0.5, 0.5, 0.5,
-3.87581, -3.322064, 4, 1, 1.5, 0.5, 0.5,
-3.87581, -3.322064, 4, 0, 1.5, 0.5, 0.5
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
-3.433027, -2.867378, -5.379291,
-3.433027, 3.195099, -5.379291,
-3.433027, -2.867378, 5.22578,
-3.433027, 3.195099, 5.22578,
-3.433027, -2.867378, -5.379291,
-3.433027, -2.867378, 5.22578,
-3.433027, 3.195099, -5.379291,
-3.433027, 3.195099, 5.22578,
-3.433027, -2.867378, -5.379291,
2.47075, -2.867378, -5.379291,
-3.433027, -2.867378, 5.22578,
2.47075, -2.867378, 5.22578,
-3.433027, 3.195099, -5.379291,
2.47075, 3.195099, -5.379291,
-3.433027, 3.195099, 5.22578,
2.47075, 3.195099, 5.22578,
2.47075, -2.867378, -5.379291,
2.47075, 3.195099, -5.379291,
2.47075, -2.867378, 5.22578,
2.47075, 3.195099, 5.22578,
2.47075, -2.867378, -5.379291,
2.47075, -2.867378, 5.22578,
2.47075, 3.195099, -5.379291,
2.47075, 3.195099, 5.22578
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
var radius = 7.244756;
var distance = 32.23274;
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
mvMatrix.translate( 0.4811383, -0.1638606, 0.07675529 );
mvMatrix.scale( 1.326807, 1.292074, 0.7386251 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.23274);
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
Carbamidin<-read.table("Carbamidin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Carbamidin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Carbamidin' not found
```

```r
y<-Carbamidin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Carbamidin' not found
```

```r
z<-Carbamidin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Carbamidin' not found
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
-3.34705, 0.9834076, -0.6462105, 0, 0, 1, 1, 1,
-3.26569, 1.153075, -3.070262, 1, 0, 0, 1, 1,
-3.181242, 0.4968041, -3.465796, 1, 0, 0, 1, 1,
-3.091764, 0.1874324, -0.5264304, 1, 0, 0, 1, 1,
-3.010078, 0.2447193, -2.189906, 1, 0, 0, 1, 1,
-2.978821, 0.5350679, -0.6215298, 1, 0, 0, 1, 1,
-2.884875, -0.3934585, -2.862292, 0, 0, 0, 1, 1,
-2.667619, -0.272729, -2.167366, 0, 0, 0, 1, 1,
-2.542952, 0.9259323, -0.9636621, 0, 0, 0, 1, 1,
-2.54188, 0.253228, -2.217116, 0, 0, 0, 1, 1,
-2.516007, -0.337479, -1.265697, 0, 0, 0, 1, 1,
-2.410785, -1.197501, -2.03525, 0, 0, 0, 1, 1,
-2.389975, 0.1463581, -1.854201, 0, 0, 0, 1, 1,
-2.344936, -0.5627149, -0.9744443, 1, 1, 1, 1, 1,
-2.338926, 0.5398949, -1.32286, 1, 1, 1, 1, 1,
-2.295451, -1.034708, -1.92419, 1, 1, 1, 1, 1,
-2.277935, 0.2536185, -0.7256134, 1, 1, 1, 1, 1,
-2.25903, 0.5871395, -1.800881, 1, 1, 1, 1, 1,
-2.255561, 2.358402, -0.7509531, 1, 1, 1, 1, 1,
-2.252177, 1.50268, 0.1394735, 1, 1, 1, 1, 1,
-2.243099, 0.03407731, -0.1061824, 1, 1, 1, 1, 1,
-2.241786, -0.2400869, 0.8637755, 1, 1, 1, 1, 1,
-2.229129, 0.685536, -2.769341, 1, 1, 1, 1, 1,
-2.21911, -0.3032582, -3.30998, 1, 1, 1, 1, 1,
-2.215057, 0.9783042, -2.1932, 1, 1, 1, 1, 1,
-2.194978, -0.3366302, -0.3211398, 1, 1, 1, 1, 1,
-2.174828, -2.039909, -1.508549, 1, 1, 1, 1, 1,
-2.173859, -0.7408991, -4.581686, 1, 1, 1, 1, 1,
-2.169857, -0.160598, -1.551365, 0, 0, 1, 1, 1,
-2.161501, -1.435421, -2.731368, 1, 0, 0, 1, 1,
-2.132965, -0.2239186, -2.94119, 1, 0, 0, 1, 1,
-2.128896, -0.3095321, -3.435465, 1, 0, 0, 1, 1,
-2.121703, -0.408819, -1.738095, 1, 0, 0, 1, 1,
-2.120861, 0.06711739, -2.300185, 1, 0, 0, 1, 1,
-2.118811, -0.1660496, -2.342951, 0, 0, 0, 1, 1,
-2.018915, -1.275734, -1.466688, 0, 0, 0, 1, 1,
-2.009861, 0.2132572, -0.9521264, 0, 0, 0, 1, 1,
-2.00192, -0.1790561, -1.92491, 0, 0, 0, 1, 1,
-2.000866, -0.6600894, -1.673412, 0, 0, 0, 1, 1,
-2.00055, 0.4766016, -1.575819, 0, 0, 0, 1, 1,
-1.943896, 0.7959673, -1.055894, 0, 0, 0, 1, 1,
-1.939752, 0.2015077, -1.233642, 1, 1, 1, 1, 1,
-1.938158, -0.2171402, 0.05866306, 1, 1, 1, 1, 1,
-1.921159, 0.03511908, -0.9863845, 1, 1, 1, 1, 1,
-1.912067, 0.8880317, -0.7114879, 1, 1, 1, 1, 1,
-1.904895, 0.243828, -2.820895, 1, 1, 1, 1, 1,
-1.892107, -1.28363, -0.5370722, 1, 1, 1, 1, 1,
-1.88003, -0.8843527, -1.758687, 1, 1, 1, 1, 1,
-1.869239, 0.6838906, -1.64624, 1, 1, 1, 1, 1,
-1.846961, 0.6608917, -1.209871, 1, 1, 1, 1, 1,
-1.844216, 0.7198011, -1.918784, 1, 1, 1, 1, 1,
-1.82755, -0.07077202, -2.094117, 1, 1, 1, 1, 1,
-1.796591, 0.004245393, -1.612522, 1, 1, 1, 1, 1,
-1.774665, -1.451055, -1.288592, 1, 1, 1, 1, 1,
-1.754051, 0.4050513, -4.154827, 1, 1, 1, 1, 1,
-1.709374, 0.4770419, 0.04816137, 1, 1, 1, 1, 1,
-1.697459, 0.5192722, -0.6641447, 0, 0, 1, 1, 1,
-1.6968, -0.1066553, -1.309753, 1, 0, 0, 1, 1,
-1.670539, 1.277072, 0.3359112, 1, 0, 0, 1, 1,
-1.670107, 0.871416, -0.8695596, 1, 0, 0, 1, 1,
-1.666538, -0.6943312, -1.438743, 1, 0, 0, 1, 1,
-1.657318, -0.3693151, -1.397518, 1, 0, 0, 1, 1,
-1.656399, -1.037787, -3.021078, 0, 0, 0, 1, 1,
-1.649045, 0.8920481, -0.3794938, 0, 0, 0, 1, 1,
-1.644205, 0.2291281, -2.308912, 0, 0, 0, 1, 1,
-1.643688, -0.7842814, -2.113733, 0, 0, 0, 1, 1,
-1.628762, -0.5740737, -1.291033, 0, 0, 0, 1, 1,
-1.615796, -0.368994, -0.3814284, 0, 0, 0, 1, 1,
-1.600141, 0.6053064, -0.1746598, 0, 0, 0, 1, 1,
-1.595077, 2.225369, -1.212467, 1, 1, 1, 1, 1,
-1.59459, -0.02195456, -2.419296, 1, 1, 1, 1, 1,
-1.587717, 2.491587, -1.828786, 1, 1, 1, 1, 1,
-1.58024, -0.2885281, -1.501548, 1, 1, 1, 1, 1,
-1.577788, -2.462012, -1.879161, 1, 1, 1, 1, 1,
-1.565105, 0.3437325, -1.206354, 1, 1, 1, 1, 1,
-1.551727, 1.250488, -0.08703873, 1, 1, 1, 1, 1,
-1.548441, 0.8328401, 0.7166622, 1, 1, 1, 1, 1,
-1.539828, -0.9401361, -3.144701, 1, 1, 1, 1, 1,
-1.539324, 0.9210063, -0.960727, 1, 1, 1, 1, 1,
-1.525617, -0.7266083, -2.237974, 1, 1, 1, 1, 1,
-1.519372, -1.709084, -1.911589, 1, 1, 1, 1, 1,
-1.511668, 1.66358, -0.3880662, 1, 1, 1, 1, 1,
-1.509635, -0.5111504, -0.9377003, 1, 1, 1, 1, 1,
-1.488314, 1.990168, -0.9982756, 1, 1, 1, 1, 1,
-1.472453, 0.06958908, -3.115347, 0, 0, 1, 1, 1,
-1.472048, 1.179532, -0.4967421, 1, 0, 0, 1, 1,
-1.470954, -0.310892, -1.134801, 1, 0, 0, 1, 1,
-1.457345, 1.127129, -0.5285386, 1, 0, 0, 1, 1,
-1.446091, 0.4850151, -1.99876, 1, 0, 0, 1, 1,
-1.436593, -0.06149965, -1.340749, 1, 0, 0, 1, 1,
-1.424135, 0.155628, 1.386984, 0, 0, 0, 1, 1,
-1.419992, -1.509934, -0.6747465, 0, 0, 0, 1, 1,
-1.419814, 1.070558, -0.9719545, 0, 0, 0, 1, 1,
-1.413009, 2.133944, -1.721311, 0, 0, 0, 1, 1,
-1.403806, -0.4301937, -2.908629, 0, 0, 0, 1, 1,
-1.400945, 0.5184959, -0.7010943, 0, 0, 0, 1, 1,
-1.395282, -0.01890172, -1.721643, 0, 0, 0, 1, 1,
-1.38867, 0.1531215, -0.8977718, 1, 1, 1, 1, 1,
-1.3706, -0.1790232, -2.187288, 1, 1, 1, 1, 1,
-1.36995, 0.227569, -1.070127, 1, 1, 1, 1, 1,
-1.363299, -0.1114645, -0.6066316, 1, 1, 1, 1, 1,
-1.358572, 0.4587096, -0.5874267, 1, 1, 1, 1, 1,
-1.353786, 0.1353746, -4.16497, 1, 1, 1, 1, 1,
-1.350387, 0.9442247, -1.521777, 1, 1, 1, 1, 1,
-1.347774, -1.307914, -1.880042, 1, 1, 1, 1, 1,
-1.345969, -0.4406167, -1.675244, 1, 1, 1, 1, 1,
-1.330227, -1.178948, -2.559726, 1, 1, 1, 1, 1,
-1.326013, -1.353641, -0.9954596, 1, 1, 1, 1, 1,
-1.324739, 0.6113131, -0.0360899, 1, 1, 1, 1, 1,
-1.316402, 1.937781, -2.058973, 1, 1, 1, 1, 1,
-1.308976, -1.270512, -3.016731, 1, 1, 1, 1, 1,
-1.304657, 0.2585475, -2.409561, 1, 1, 1, 1, 1,
-1.302361, 0.5088018, 0.2914543, 0, 0, 1, 1, 1,
-1.292911, -1.558241, -3.397496, 1, 0, 0, 1, 1,
-1.287404, 0.8438004, -2.186595, 1, 0, 0, 1, 1,
-1.276126, -0.1183498, -0.2268047, 1, 0, 0, 1, 1,
-1.275276, 2.067923, -2.204701, 1, 0, 0, 1, 1,
-1.272774, 2.721483, -0.8815129, 1, 0, 0, 1, 1,
-1.266493, -0.6750953, -2.963949, 0, 0, 0, 1, 1,
-1.259494, 0.3070653, -3.515296, 0, 0, 0, 1, 1,
-1.254144, -0.549265, -3.288687, 0, 0, 0, 1, 1,
-1.253179, 1.18538, -0.3092305, 0, 0, 0, 1, 1,
-1.233979, 1.12449, -2.98823, 0, 0, 0, 1, 1,
-1.227013, -0.4171868, -2.333661, 0, 0, 0, 1, 1,
-1.222886, -0.3782108, -1.558959, 0, 0, 0, 1, 1,
-1.221227, 0.5444148, -2.764414, 1, 1, 1, 1, 1,
-1.214687, 1.089846, -2.246002, 1, 1, 1, 1, 1,
-1.205075, 0.1132461, -2.340479, 1, 1, 1, 1, 1,
-1.200134, -0.6494944, -0.5027237, 1, 1, 1, 1, 1,
-1.188251, 0.005275476, -1.86828, 1, 1, 1, 1, 1,
-1.182016, 1.720679, 0.3077438, 1, 1, 1, 1, 1,
-1.176795, 0.3212904, -1.901392, 1, 1, 1, 1, 1,
-1.176439, -0.7337034, -0.6711603, 1, 1, 1, 1, 1,
-1.173441, -0.2930259, -3.653029, 1, 1, 1, 1, 1,
-1.172072, 0.3169402, -1.241273, 1, 1, 1, 1, 1,
-1.165925, -0.7263033, -0.09146405, 1, 1, 1, 1, 1,
-1.163409, 0.4815695, 0.4070761, 1, 1, 1, 1, 1,
-1.154944, 1.049875, 0.3184535, 1, 1, 1, 1, 1,
-1.152853, 0.04456521, -0.6194585, 1, 1, 1, 1, 1,
-1.151756, -0.4573694, -0.536642, 1, 1, 1, 1, 1,
-1.147948, -0.07652325, -2.76551, 0, 0, 1, 1, 1,
-1.147283, -0.4588877, -1.978765, 1, 0, 0, 1, 1,
-1.145365, 0.2367853, -0.6163223, 1, 0, 0, 1, 1,
-1.136623, 0.209255, -0.9775321, 1, 0, 0, 1, 1,
-1.132543, -0.04159874, -2.734705, 1, 0, 0, 1, 1,
-1.126588, -1.15686, -0.5094712, 1, 0, 0, 1, 1,
-1.125414, -0.940328, -2.676137, 0, 0, 0, 1, 1,
-1.123934, -0.8324983, -1.865139, 0, 0, 0, 1, 1,
-1.115171, 1.635589, -0.03256773, 0, 0, 0, 1, 1,
-1.108318, -0.6627666, -1.994529, 0, 0, 0, 1, 1,
-1.105933, 1.226773, -1.268843, 0, 0, 0, 1, 1,
-1.105712, -0.928642, -2.502505, 0, 0, 0, 1, 1,
-1.100084, 1.137829, -0.3112186, 0, 0, 0, 1, 1,
-1.096307, -1.414443, -3.292872, 1, 1, 1, 1, 1,
-1.095434, -0.8667247, -1.398929, 1, 1, 1, 1, 1,
-1.085305, -0.1134473, -1.539469, 1, 1, 1, 1, 1,
-1.084385, 1.072693, 0.2357371, 1, 1, 1, 1, 1,
-1.083462, -0.6399474, -1.171877, 1, 1, 1, 1, 1,
-1.082757, 0.7502783, -0.7293574, 1, 1, 1, 1, 1,
-1.075647, -0.8491367, -1.604274, 1, 1, 1, 1, 1,
-1.070464, 0.02401935, -2.636225, 1, 1, 1, 1, 1,
-1.056308, -0.4047254, -3.601406, 1, 1, 1, 1, 1,
-1.053924, 1.183326, -3.576918, 1, 1, 1, 1, 1,
-1.049848, 0.3289963, 0.3564794, 1, 1, 1, 1, 1,
-1.049001, 0.3067115, -2.88014, 1, 1, 1, 1, 1,
-1.046574, 0.7513059, -1.172274, 1, 1, 1, 1, 1,
-1.023153, 1.046123, -0.4163875, 1, 1, 1, 1, 1,
-1.01764, -1.356634, -2.486611, 1, 1, 1, 1, 1,
-1.01516, -0.5873386, -1.674339, 0, 0, 1, 1, 1,
-0.9924504, -0.304611, -1.356697, 1, 0, 0, 1, 1,
-0.9898118, 0.2580788, -1.353074, 1, 0, 0, 1, 1,
-0.9894609, -0.9109696, -3.030868, 1, 0, 0, 1, 1,
-0.9814329, 1.806737, -1.399836, 1, 0, 0, 1, 1,
-0.9806018, -0.4945176, -1.308526, 1, 0, 0, 1, 1,
-0.9754847, 0.5382544, 0.2832358, 0, 0, 0, 1, 1,
-0.9753768, 1.06821, -1.570975, 0, 0, 0, 1, 1,
-0.9720947, 0.0591993, -0.999989, 0, 0, 0, 1, 1,
-0.969804, -0.5767076, -1.558927, 0, 0, 0, 1, 1,
-0.9641277, -1.00485, -2.027833, 0, 0, 0, 1, 1,
-0.9574653, -2.328324, -2.477392, 0, 0, 0, 1, 1,
-0.9562269, 0.1651133, -1.689575, 0, 0, 0, 1, 1,
-0.9557118, -0.3849922, -1.724833, 1, 1, 1, 1, 1,
-0.9531462, -1.13684, -2.465324, 1, 1, 1, 1, 1,
-0.9517605, 0.07381394, -2.939037, 1, 1, 1, 1, 1,
-0.9484442, -1.172454, -2.105526, 1, 1, 1, 1, 1,
-0.945911, -0.773307, -3.057954, 1, 1, 1, 1, 1,
-0.9414613, -1.6944, -2.934388, 1, 1, 1, 1, 1,
-0.9403634, 0.2564306, -0.8619882, 1, 1, 1, 1, 1,
-0.9373313, 1.501114, -1.248048, 1, 1, 1, 1, 1,
-0.9353889, 1.920325, -0.2659694, 1, 1, 1, 1, 1,
-0.9320344, 3.106811, 0.5725021, 1, 1, 1, 1, 1,
-0.9281084, 0.2881493, -0.814582, 1, 1, 1, 1, 1,
-0.925603, -1.21183, -3.082481, 1, 1, 1, 1, 1,
-0.9169011, 3.044952, 0.8006079, 1, 1, 1, 1, 1,
-0.909986, 0.8298755, -1.060297, 1, 1, 1, 1, 1,
-0.9092488, -0.6745719, -4.193646, 1, 1, 1, 1, 1,
-0.9073354, -2.778529, -1.870547, 0, 0, 1, 1, 1,
-0.9059397, 1.149446, 0.2600096, 1, 0, 0, 1, 1,
-0.9048441, -0.7127448, -1.379502, 1, 0, 0, 1, 1,
-0.902485, -0.8045591, -0.8977816, 1, 0, 0, 1, 1,
-0.8987209, 1.416045, -0.5387963, 1, 0, 0, 1, 1,
-0.8976405, -1.19972, -1.310487, 1, 0, 0, 1, 1,
-0.8961813, 0.1395239, -1.726524, 0, 0, 0, 1, 1,
-0.8957231, 0.7829455, -1.204574, 0, 0, 0, 1, 1,
-0.8944777, 0.3026075, -2.190092, 0, 0, 0, 1, 1,
-0.889789, -1.70191, -2.938513, 0, 0, 0, 1, 1,
-0.8836843, -1.798439, -2.197894, 0, 0, 0, 1, 1,
-0.8817856, 0.8706902, -0.1314475, 0, 0, 0, 1, 1,
-0.8808063, 0.928086, -2.153053, 0, 0, 0, 1, 1,
-0.8763116, 1.8011, -0.7798434, 1, 1, 1, 1, 1,
-0.875872, 1.019235, -2.958049, 1, 1, 1, 1, 1,
-0.8736316, -0.7501988, -1.203614, 1, 1, 1, 1, 1,
-0.8687677, -0.2865895, -2.456949, 1, 1, 1, 1, 1,
-0.8666213, -0.7578714, -1.315286, 1, 1, 1, 1, 1,
-0.8642447, 0.4293128, -2.037396, 1, 1, 1, 1, 1,
-0.8613476, -0.7786543, -3.635257, 1, 1, 1, 1, 1,
-0.8472335, 0.07316595, -2.628577, 1, 1, 1, 1, 1,
-0.8467028, 1.453178, -0.4924841, 1, 1, 1, 1, 1,
-0.8396726, -0.3220014, -0.8211673, 1, 1, 1, 1, 1,
-0.8393453, -0.57118, -0.7436116, 1, 1, 1, 1, 1,
-0.8316247, -0.7726908, -2.08883, 1, 1, 1, 1, 1,
-0.8316187, 0.3879548, -1.549614, 1, 1, 1, 1, 1,
-0.830403, -0.9340225, -2.954615, 1, 1, 1, 1, 1,
-0.8285921, 0.8670226, 0.0935192, 1, 1, 1, 1, 1,
-0.8230738, -0.1769691, -0.7299677, 0, 0, 1, 1, 1,
-0.8141598, 0.08432897, -2.428389, 1, 0, 0, 1, 1,
-0.8134868, -0.5128686, -3.462794, 1, 0, 0, 1, 1,
-0.8109206, 0.6892838, -0.1302873, 1, 0, 0, 1, 1,
-0.8080623, -0.9969968, -2.125066, 1, 0, 0, 1, 1,
-0.8035745, -0.02900107, -1.183504, 1, 0, 0, 1, 1,
-0.7947559, -0.1028281, -2.300716, 0, 0, 0, 1, 1,
-0.7916973, 0.5020206, -1.292049, 0, 0, 0, 1, 1,
-0.7880647, 1.053222, 1.112631, 0, 0, 0, 1, 1,
-0.774619, -0.3291611, -2.578601, 0, 0, 0, 1, 1,
-0.765617, 0.6631389, -0.6367006, 0, 0, 0, 1, 1,
-0.7644238, 0.3161979, -0.8367689, 0, 0, 0, 1, 1,
-0.7642211, -0.5788414, -1.934762, 0, 0, 0, 1, 1,
-0.7619757, -0.6276784, -1.595324, 1, 1, 1, 1, 1,
-0.7613177, 0.4842131, -0.1538846, 1, 1, 1, 1, 1,
-0.7541291, -0.5824094, -1.317283, 1, 1, 1, 1, 1,
-0.7508144, 1.329353, 0.6231557, 1, 1, 1, 1, 1,
-0.743706, -0.4853264, -3.415995, 1, 1, 1, 1, 1,
-0.7369121, -1.743294, -2.929934, 1, 1, 1, 1, 1,
-0.731723, -1.325411, -2.018288, 1, 1, 1, 1, 1,
-0.7288721, -0.1985198, -1.808356, 1, 1, 1, 1, 1,
-0.7282848, 0.655619, -0.9719372, 1, 1, 1, 1, 1,
-0.7282177, 0.4767799, -0.8922325, 1, 1, 1, 1, 1,
-0.7256107, 0.4426068, -0.177489, 1, 1, 1, 1, 1,
-0.7250036, 0.7488677, 0.2711595, 1, 1, 1, 1, 1,
-0.7217087, 1.508148, -0.2192457, 1, 1, 1, 1, 1,
-0.7183394, 1.147714, -0.5176721, 1, 1, 1, 1, 1,
-0.7097122, -0.2402568, -1.489594, 1, 1, 1, 1, 1,
-0.7045957, 0.2307926, -1.842336, 0, 0, 1, 1, 1,
-0.7021304, 0.3544157, 0.8033332, 1, 0, 0, 1, 1,
-0.7018278, -0.6217824, -2.55214, 1, 0, 0, 1, 1,
-0.6962022, -1.648683, -2.924541, 1, 0, 0, 1, 1,
-0.6923124, -0.0904953, -1.490719, 1, 0, 0, 1, 1,
-0.6915503, 0.7657105, 0.2060187, 1, 0, 0, 1, 1,
-0.6913426, 1.639894, -0.202185, 0, 0, 0, 1, 1,
-0.6813145, -0.4171694, -1.921, 0, 0, 0, 1, 1,
-0.6761791, -1.362088, -2.977966, 0, 0, 0, 1, 1,
-0.6754345, -1.060301, -2.70039, 0, 0, 0, 1, 1,
-0.67067, 0.08260571, -3.617967, 0, 0, 0, 1, 1,
-0.6701791, 0.7543742, -1.803145, 0, 0, 0, 1, 1,
-0.6692526, -0.5361847, -2.745311, 0, 0, 0, 1, 1,
-0.6653667, -0.06966323, -2.512538, 1, 1, 1, 1, 1,
-0.6630279, -0.0842334, -1.910316, 1, 1, 1, 1, 1,
-0.6620847, -0.4148642, -4.899212, 1, 1, 1, 1, 1,
-0.6595365, -1.047483, -2.745519, 1, 1, 1, 1, 1,
-0.6582842, -0.6505879, 0.365226, 1, 1, 1, 1, 1,
-0.6558989, 0.1324274, -2.669419, 1, 1, 1, 1, 1,
-0.6473651, -1.991971, -2.962107, 1, 1, 1, 1, 1,
-0.6459414, -1.568192, -2.817086, 1, 1, 1, 1, 1,
-0.6379549, -1.677371, -1.940919, 1, 1, 1, 1, 1,
-0.6349788, 0.4292297, 0.7105295, 1, 1, 1, 1, 1,
-0.6327485, -1.315389, -2.144826, 1, 1, 1, 1, 1,
-0.6281993, -0.4706509, -3.302452, 1, 1, 1, 1, 1,
-0.6270366, -0.9128826, -2.930591, 1, 1, 1, 1, 1,
-0.6144557, -0.857999, -1.296488, 1, 1, 1, 1, 1,
-0.6135697, -1.524759, -2.981273, 1, 1, 1, 1, 1,
-0.6114243, 0.2833126, -1.266289, 0, 0, 1, 1, 1,
-0.6078832, 0.738217, 0.06903141, 1, 0, 0, 1, 1,
-0.6002197, -1.024315, -3.773623, 1, 0, 0, 1, 1,
-0.5999069, -0.8332421, -2.322597, 1, 0, 0, 1, 1,
-0.5990026, -0.3922343, -2.968191, 1, 0, 0, 1, 1,
-0.596835, -0.853065, -2.73696, 1, 0, 0, 1, 1,
-0.5942226, -0.08161443, -2.079158, 0, 0, 0, 1, 1,
-0.5901687, 0.2424122, -0.803984, 0, 0, 0, 1, 1,
-0.5692229, 1.681414, 0.6173754, 0, 0, 0, 1, 1,
-0.561974, -0.1830184, -2.812961, 0, 0, 0, 1, 1,
-0.5556787, -2.690017, -4.512793, 0, 0, 0, 1, 1,
-0.5490189, -0.5663697, -2.520665, 0, 0, 0, 1, 1,
-0.5451591, -0.471092, -1.057666, 0, 0, 0, 1, 1,
-0.540527, 0.1516919, -2.184788, 1, 1, 1, 1, 1,
-0.538142, 0.07530055, -2.291316, 1, 1, 1, 1, 1,
-0.5380392, 1.317196, -0.5662737, 1, 1, 1, 1, 1,
-0.5364052, 0.5482697, -0.7338724, 1, 1, 1, 1, 1,
-0.517643, -1.375059, -3.93836, 1, 1, 1, 1, 1,
-0.5170728, 0.9820516, -0.4366653, 1, 1, 1, 1, 1,
-0.5153686, 2.081881, -0.7235376, 1, 1, 1, 1, 1,
-0.5130429, -0.7898728, -4.420259, 1, 1, 1, 1, 1,
-0.4981657, -0.9190343, -1.693134, 1, 1, 1, 1, 1,
-0.4903056, -0.1309983, -2.345195, 1, 1, 1, 1, 1,
-0.4887252, 0.4299883, -0.2598501, 1, 1, 1, 1, 1,
-0.4834246, -0.01920006, -1.1265, 1, 1, 1, 1, 1,
-0.4801488, 0.696129, 0.0209409, 1, 1, 1, 1, 1,
-0.4738605, -1.063391, -3.426892, 1, 1, 1, 1, 1,
-0.4729023, 0.2861868, -2.402725, 1, 1, 1, 1, 1,
-0.4713779, -0.3132787, -2.114819, 0, 0, 1, 1, 1,
-0.4707878, -1.427002, -2.684388, 1, 0, 0, 1, 1,
-0.4691753, -0.2528973, 0.03793861, 1, 0, 0, 1, 1,
-0.4678949, -0.6748601, -1.514268, 1, 0, 0, 1, 1,
-0.4641715, 0.4847673, -0.6487824, 1, 0, 0, 1, 1,
-0.4569823, 0.4641331, -1.95076, 1, 0, 0, 1, 1,
-0.4569099, -0.800873, -3.136574, 0, 0, 0, 1, 1,
-0.4500472, 0.05651774, -1.966599, 0, 0, 0, 1, 1,
-0.4425548, 2.228753, -1.406489, 0, 0, 0, 1, 1,
-0.4408683, 1.123128, -0.7714049, 0, 0, 0, 1, 1,
-0.4408323, 0.9002783, -0.6207504, 0, 0, 0, 1, 1,
-0.4340905, -0.6114141, -1.763662, 0, 0, 0, 1, 1,
-0.4291262, 1.078359, 0.03878099, 0, 0, 0, 1, 1,
-0.4279847, 0.005844504, -2.401195, 1, 1, 1, 1, 1,
-0.422259, -0.2632724, -2.452458, 1, 1, 1, 1, 1,
-0.4218717, -0.3601283, -1.336848, 1, 1, 1, 1, 1,
-0.415684, -0.8184881, -3.265579, 1, 1, 1, 1, 1,
-0.4150958, -0.8730717, -3.396164, 1, 1, 1, 1, 1,
-0.4114037, 1.097411, -0.07943943, 1, 1, 1, 1, 1,
-0.4092205, 0.7112455, 0.7446682, 1, 1, 1, 1, 1,
-0.4091482, -2.137157, -4.258745, 1, 1, 1, 1, 1,
-0.4064786, 0.1193073, -2.997449, 1, 1, 1, 1, 1,
-0.4039527, -0.5062916, -1.274868, 1, 1, 1, 1, 1,
-0.4036858, -0.1535214, -2.547577, 1, 1, 1, 1, 1,
-0.4024556, -0.5243147, -4.579873, 1, 1, 1, 1, 1,
-0.3978699, -0.7152888, -4.235371, 1, 1, 1, 1, 1,
-0.3971392, -2.779089, -3.933596, 1, 1, 1, 1, 1,
-0.3922727, -0.6814551, -4.118214, 1, 1, 1, 1, 1,
-0.3901504, -1.755343, -3.470906, 0, 0, 1, 1, 1,
-0.3880205, 1.074685, -0.1380309, 1, 0, 0, 1, 1,
-0.3840477, -1.430103, -4.284407, 1, 0, 0, 1, 1,
-0.3797725, 0.8085104, -0.8504412, 1, 0, 0, 1, 1,
-0.3785529, 0.007630157, -1.209399, 1, 0, 0, 1, 1,
-0.3784852, 0.3932102, -1.53438, 1, 0, 0, 1, 1,
-0.3771524, 0.314277, -1.468018, 0, 0, 0, 1, 1,
-0.3756005, 0.85551, -0.2560794, 0, 0, 0, 1, 1,
-0.3741962, -1.714784, -4.239434, 0, 0, 0, 1, 1,
-0.3741525, -0.7343701, -2.603776, 0, 0, 0, 1, 1,
-0.3707388, -1.535806, -3.567546, 0, 0, 0, 1, 1,
-0.3682667, -0.9270021, -2.223364, 0, 0, 0, 1, 1,
-0.3665001, -0.4316452, -2.424119, 0, 0, 0, 1, 1,
-0.3625678, 0.7043642, 0.490264, 1, 1, 1, 1, 1,
-0.3584982, 0.9216912, -1.446267, 1, 1, 1, 1, 1,
-0.3513225, 0.09398948, -0.273806, 1, 1, 1, 1, 1,
-0.3444354, -0.8085893, -2.19914, 1, 1, 1, 1, 1,
-0.3420873, -0.02981088, -2.793961, 1, 1, 1, 1, 1,
-0.3388087, -0.7460296, -3.309489, 1, 1, 1, 1, 1,
-0.3375146, -0.3651798, -0.6031867, 1, 1, 1, 1, 1,
-0.336244, 0.7510676, -0.06974771, 1, 1, 1, 1, 1,
-0.332818, 1.601962, 0.6099977, 1, 1, 1, 1, 1,
-0.3306371, -0.2875745, -2.600564, 1, 1, 1, 1, 1,
-0.3265665, -1.651197, -2.706175, 1, 1, 1, 1, 1,
-0.3255817, 0.1396363, -1.181469, 1, 1, 1, 1, 1,
-0.3250084, -0.8082257, -4.6134, 1, 1, 1, 1, 1,
-0.3240631, 0.978308, -0.2327478, 1, 1, 1, 1, 1,
-0.3239671, 0.7405418, -0.1306259, 1, 1, 1, 1, 1,
-0.321093, 0.158223, -1.727811, 0, 0, 1, 1, 1,
-0.318598, -0.2553884, -2.379683, 1, 0, 0, 1, 1,
-0.31748, -0.8571885, -1.497653, 1, 0, 0, 1, 1,
-0.3114802, -0.678107, -2.415565, 1, 0, 0, 1, 1,
-0.3005543, 0.2166937, 0.2454764, 1, 0, 0, 1, 1,
-0.2906294, -0.1985936, -0.470026, 1, 0, 0, 1, 1,
-0.2896126, 0.1515688, -1.224051, 0, 0, 0, 1, 1,
-0.2892102, -1.622333, -2.630589, 0, 0, 0, 1, 1,
-0.2885588, 0.2181106, -1.149493, 0, 0, 0, 1, 1,
-0.2858106, -0.1375501, -2.942511, 0, 0, 0, 1, 1,
-0.2850814, -1.31152, -2.379852, 0, 0, 0, 1, 1,
-0.2785214, 0.05493402, -2.32336, 0, 0, 0, 1, 1,
-0.2770194, -0.2770684, -2.210309, 0, 0, 0, 1, 1,
-0.2751862, 0.1417766, -2.701771, 1, 1, 1, 1, 1,
-0.2749325, 1.400935, 0.247657, 1, 1, 1, 1, 1,
-0.2736705, 1.08892, -2.622533, 1, 1, 1, 1, 1,
-0.2726605, -1.650019, -1.747479, 1, 1, 1, 1, 1,
-0.2719452, 1.777385, 0.07369401, 1, 1, 1, 1, 1,
-0.2694139, -1.460307, -3.987489, 1, 1, 1, 1, 1,
-0.2669474, 0.209392, -1.734512, 1, 1, 1, 1, 1,
-0.2656671, 1.217926, 0.2296267, 1, 1, 1, 1, 1,
-0.2633931, 1.07307, 0.9219555, 1, 1, 1, 1, 1,
-0.2597754, -1.080998, -2.49477, 1, 1, 1, 1, 1,
-0.2564997, -0.4972893, -2.345109, 1, 1, 1, 1, 1,
-0.2508146, -0.5486282, -3.016145, 1, 1, 1, 1, 1,
-0.2447634, -1.883368, -3.011634, 1, 1, 1, 1, 1,
-0.2434719, -1.029755, -3.54636, 1, 1, 1, 1, 1,
-0.2422689, 0.6123587, 0.3979806, 1, 1, 1, 1, 1,
-0.2412873, 0.7392277, -1.665407, 0, 0, 1, 1, 1,
-0.2405436, -0.1643284, -2.717009, 1, 0, 0, 1, 1,
-0.2390201, -0.5717684, -4.075778, 1, 0, 0, 1, 1,
-0.2379049, 0.2236065, -1.564963, 1, 0, 0, 1, 1,
-0.2343934, -0.2960962, -1.720681, 1, 0, 0, 1, 1,
-0.2338493, -1.136496, -4.640994, 1, 0, 0, 1, 1,
-0.2317088, 0.1565865, -1.12443, 0, 0, 0, 1, 1,
-0.2315503, 1.901359, -1.273805, 0, 0, 0, 1, 1,
-0.2303109, -1.051835, -2.269197, 0, 0, 0, 1, 1,
-0.2235738, 0.3050583, 0.6690882, 0, 0, 0, 1, 1,
-0.2219249, 1.236575, 0.1273762, 0, 0, 0, 1, 1,
-0.2205735, 0.193909, -1.205155, 0, 0, 0, 1, 1,
-0.2199126, 0.9808042, -0.9212322, 0, 0, 0, 1, 1,
-0.2177517, -0.3321641, -2.995905, 1, 1, 1, 1, 1,
-0.2170902, -0.1921019, -1.624657, 1, 1, 1, 1, 1,
-0.2156106, -0.04019343, -2.310272, 1, 1, 1, 1, 1,
-0.2139192, -0.8730924, -2.669491, 1, 1, 1, 1, 1,
-0.2128746, -1.171692, -2.693477, 1, 1, 1, 1, 1,
-0.2126307, -1.318006, -3.68046, 1, 1, 1, 1, 1,
-0.2097333, -1.210685, -2.909209, 1, 1, 1, 1, 1,
-0.2089464, -2.089891, -2.964939, 1, 1, 1, 1, 1,
-0.2085008, -0.2415968, -2.174672, 1, 1, 1, 1, 1,
-0.208267, -0.3926654, -1.043843, 1, 1, 1, 1, 1,
-0.2052933, -0.0482377, -1.80205, 1, 1, 1, 1, 1,
-0.2041003, -1.928182, -3.951387, 1, 1, 1, 1, 1,
-0.199427, -0.2427182, -1.765417, 1, 1, 1, 1, 1,
-0.1993425, -0.4472119, -2.747188, 1, 1, 1, 1, 1,
-0.198422, 0.2036141, -0.5984648, 1, 1, 1, 1, 1,
-0.1969243, -0.6299635, -1.646014, 0, 0, 1, 1, 1,
-0.196314, 1.638502, 0.5459611, 1, 0, 0, 1, 1,
-0.1940099, -0.7201759, -4.105222, 1, 0, 0, 1, 1,
-0.1914887, 0.01088411, -0.9748193, 1, 0, 0, 1, 1,
-0.1910343, 0.1850439, -1.263678, 1, 0, 0, 1, 1,
-0.1908701, -1.67816, -4.352787, 1, 0, 0, 1, 1,
-0.1854208, 0.4818664, 0.8696866, 0, 0, 0, 1, 1,
-0.1841229, -0.5748953, -1.907552, 0, 0, 0, 1, 1,
-0.1830817, 0.9447007, -0.4406722, 0, 0, 0, 1, 1,
-0.1827259, -0.5411706, -0.976977, 0, 0, 0, 1, 1,
-0.1775056, -0.4067488, -1.975437, 0, 0, 0, 1, 1,
-0.1764057, 0.9075639, 1.311211, 0, 0, 0, 1, 1,
-0.1749396, 1.434127, 1.136743, 0, 0, 0, 1, 1,
-0.1720544, 1.093735, 0.4995705, 1, 1, 1, 1, 1,
-0.1672854, -1.762733, -3.130617, 1, 1, 1, 1, 1,
-0.1659628, 0.0795999, -1.371898, 1, 1, 1, 1, 1,
-0.1658687, -0.7678728, -5.224848, 1, 1, 1, 1, 1,
-0.1616424, 1.52557, -0.8818005, 1, 1, 1, 1, 1,
-0.1605412, -2.366408, -3.645314, 1, 1, 1, 1, 1,
-0.1574557, 0.0009616086, -1.10591, 1, 1, 1, 1, 1,
-0.1563244, -0.8240669, -3.661609, 1, 1, 1, 1, 1,
-0.1559502, -0.143105, -1.788693, 1, 1, 1, 1, 1,
-0.154617, 1.049155, 2.025786, 1, 1, 1, 1, 1,
-0.1529231, 0.007865873, -1.89642, 1, 1, 1, 1, 1,
-0.1502713, 1.07773, 0.1918576, 1, 1, 1, 1, 1,
-0.1462288, 1.730744, 1.363086, 1, 1, 1, 1, 1,
-0.14615, 0.5992415, -0.03961064, 1, 1, 1, 1, 1,
-0.1457241, 0.6527145, -1.083826, 1, 1, 1, 1, 1,
-0.144211, -0.4342888, -2.649868, 0, 0, 1, 1, 1,
-0.1430358, -2.619081, -3.42241, 1, 0, 0, 1, 1,
-0.140539, 0.003394496, -2.704183, 1, 0, 0, 1, 1,
-0.137604, 0.08083986, 0.2322299, 1, 0, 0, 1, 1,
-0.1367938, 0.1855316, -0.7469181, 1, 0, 0, 1, 1,
-0.1365984, 0.178952, 0.3346114, 1, 0, 0, 1, 1,
-0.1342582, -0.7707275, -2.184797, 0, 0, 0, 1, 1,
-0.128522, 0.07645379, 0.6731201, 0, 0, 0, 1, 1,
-0.1263213, 1.781399, -0.848318, 0, 0, 0, 1, 1,
-0.121735, 0.299657, -0.5595707, 0, 0, 0, 1, 1,
-0.1215148, 1.252199, -0.0488418, 0, 0, 0, 1, 1,
-0.1210587, -0.2315652, -2.260072, 0, 0, 0, 1, 1,
-0.1196037, -1.261827, -3.705046, 0, 0, 0, 1, 1,
-0.1182278, -0.1634189, -3.000253, 1, 1, 1, 1, 1,
-0.1174853, -2.183647, -2.01736, 1, 1, 1, 1, 1,
-0.1172684, 0.6739529, -2.240764, 1, 1, 1, 1, 1,
-0.1150257, -0.1724745, -2.207523, 1, 1, 1, 1, 1,
-0.1108897, 0.420721, -0.3141496, 1, 1, 1, 1, 1,
-0.1106937, 0.6939614, -0.04357053, 1, 1, 1, 1, 1,
-0.1087633, 1.096859, 0.04154623, 1, 1, 1, 1, 1,
-0.1079576, 0.9074487, -0.9270974, 1, 1, 1, 1, 1,
-0.1072216, 0.3438488, -0.3977216, 1, 1, 1, 1, 1,
-0.1050346, 1.012098, -0.2271904, 1, 1, 1, 1, 1,
-0.1003734, 0.4085379, -0.0367659, 1, 1, 1, 1, 1,
-0.09628444, -0.296103, -2.220242, 1, 1, 1, 1, 1,
-0.09475914, 0.1025927, 0.5639131, 1, 1, 1, 1, 1,
-0.08875379, -0.4727086, -2.682271, 1, 1, 1, 1, 1,
-0.08833387, 0.6078093, 0.9875842, 1, 1, 1, 1, 1,
-0.08769044, 0.4930365, 0.8706192, 0, 0, 1, 1, 1,
-0.08706634, -0.4592275, -4.127526, 1, 0, 0, 1, 1,
-0.08645573, -1.330409, -3.942683, 1, 0, 0, 1, 1,
-0.08541175, -0.322873, -4.16623, 1, 0, 0, 1, 1,
-0.08453096, 1.127761, -0.6270734, 1, 0, 0, 1, 1,
-0.08007152, -0.6298206, -1.771632, 1, 0, 0, 1, 1,
-0.07754327, 0.2371724, -1.229336, 0, 0, 0, 1, 1,
-0.0766361, 0.8259958, -1.809337, 0, 0, 0, 1, 1,
-0.07290219, -0.7393446, -4.087919, 0, 0, 0, 1, 1,
-0.06737018, -0.9276698, -3.038688, 0, 0, 0, 1, 1,
-0.06534798, -0.01686939, -1.545521, 0, 0, 0, 1, 1,
-0.06453153, -0.920625, -3.465482, 0, 0, 0, 1, 1,
-0.0582645, -0.1627082, -2.799329, 0, 0, 0, 1, 1,
-0.05642428, -0.742768, -3.672125, 1, 1, 1, 1, 1,
-0.05623099, -1.117286, -4.191089, 1, 1, 1, 1, 1,
-0.05578986, -1.06496, -2.229155, 1, 1, 1, 1, 1,
-0.05343455, 0.4082228, -0.03865261, 1, 1, 1, 1, 1,
-0.05209045, 0.2770577, -0.173223, 1, 1, 1, 1, 1,
-0.05197765, -0.6054789, -2.123376, 1, 1, 1, 1, 1,
-0.05164078, -0.4829676, -1.567668, 1, 1, 1, 1, 1,
-0.05136593, 0.2346127, -0.4188897, 1, 1, 1, 1, 1,
-0.04553595, -1.177868, -3.762573, 1, 1, 1, 1, 1,
-0.04473003, 0.8615426, 1.155642, 1, 1, 1, 1, 1,
-0.04309032, -0.01269338, -1.722683, 1, 1, 1, 1, 1,
-0.03725093, 0.01686459, 0.6727048, 1, 1, 1, 1, 1,
-0.03643636, -0.3576043, -3.741181, 1, 1, 1, 1, 1,
-0.03605208, -0.3831823, -3.342414, 1, 1, 1, 1, 1,
-0.03548222, -0.008650205, -1.306787, 1, 1, 1, 1, 1,
-0.03400553, 0.3536548, 0.3851282, 0, 0, 1, 1, 1,
-0.0255587, -1.179035, -3.731098, 1, 0, 0, 1, 1,
-0.02358925, 0.9159366, 0.3972176, 1, 0, 0, 1, 1,
-0.02183189, -1.482454, -1.495728, 1, 0, 0, 1, 1,
-0.02003187, -0.1188153, -1.79407, 1, 0, 0, 1, 1,
-0.01715278, 1.19845, 0.3058671, 1, 0, 0, 1, 1,
-0.01564405, -1.140998, -3.232249, 0, 0, 0, 1, 1,
-0.01242415, -0.05959902, -2.253216, 0, 0, 0, 1, 1,
-0.01101112, -0.3471776, -2.960994, 0, 0, 0, 1, 1,
-0.0109647, 0.426893, -0.3726925, 0, 0, 0, 1, 1,
-0.009515576, 1.310864, -0.4462107, 0, 0, 0, 1, 1,
-0.008043122, -1.052338, -1.500328, 0, 0, 0, 1, 1,
-0.007973127, 0.5423192, 0.2776957, 0, 0, 0, 1, 1,
-0.007849018, -0.1340948, -2.363385, 1, 1, 1, 1, 1,
-0.003184956, -1.376112, -3.427244, 1, 1, 1, 1, 1,
-0.00181143, 0.8305632, -0.1209024, 1, 1, 1, 1, 1,
-0.001476609, -0.9021094, -2.498301, 1, 1, 1, 1, 1,
-0.00106368, 1.239401, 0.8802783, 1, 1, 1, 1, 1,
0.002711927, 1.976342, 0.363066, 1, 1, 1, 1, 1,
0.004207996, 1.739913, -1.171146, 1, 1, 1, 1, 1,
0.005764681, -0.688686, 1.918959, 1, 1, 1, 1, 1,
0.01078669, -1.603651, 2.349798, 1, 1, 1, 1, 1,
0.01233929, 0.07370303, 0.5033301, 1, 1, 1, 1, 1,
0.01419153, -0.1691531, 2.547348, 1, 1, 1, 1, 1,
0.01491729, -0.6459586, 2.47375, 1, 1, 1, 1, 1,
0.01644567, 0.5665486, 0.3125323, 1, 1, 1, 1, 1,
0.01938926, -0.09000111, 2.761744, 1, 1, 1, 1, 1,
0.0197464, 1.849885, -2.016421, 1, 1, 1, 1, 1,
0.02082041, 0.2768251, -1.110975, 0, 0, 1, 1, 1,
0.02105612, -0.1947382, 3.651255, 1, 0, 0, 1, 1,
0.02531208, -1.570671, 2.480563, 1, 0, 0, 1, 1,
0.02608617, 1.073875, -1.308022, 1, 0, 0, 1, 1,
0.02617042, -0.9036947, 2.79531, 1, 0, 0, 1, 1,
0.02965431, -1.397133, 2.303126, 1, 0, 0, 1, 1,
0.03725844, -0.316372, 1.633552, 0, 0, 0, 1, 1,
0.04280509, -0.6767226, 2.091243, 0, 0, 0, 1, 1,
0.04857654, 0.5636494, 0.2909767, 0, 0, 0, 1, 1,
0.04968654, 0.2223171, 1.065216, 0, 0, 0, 1, 1,
0.05327997, -0.496348, 2.702668, 0, 0, 0, 1, 1,
0.05470186, -0.01927366, 3.092065, 0, 0, 0, 1, 1,
0.05556168, 1.842449, -1.055615, 0, 0, 0, 1, 1,
0.05585774, 0.3463001, -0.7871284, 1, 1, 1, 1, 1,
0.05913804, 1.62638, 0.9270143, 1, 1, 1, 1, 1,
0.06010349, -0.1505388, 2.802225, 1, 1, 1, 1, 1,
0.06083067, -0.1003708, 2.14595, 1, 1, 1, 1, 1,
0.06501585, 0.3884757, -0.3179482, 1, 1, 1, 1, 1,
0.06512742, -1.815296, 4.060441, 1, 1, 1, 1, 1,
0.06815924, -0.8903842, 1.599907, 1, 1, 1, 1, 1,
0.07730495, -0.566297, 1.968089, 1, 1, 1, 1, 1,
0.08072434, -1.285625, 2.705359, 1, 1, 1, 1, 1,
0.08149869, 1.855823, 0.9212776, 1, 1, 1, 1, 1,
0.08280911, 1.729891, 0.1375041, 1, 1, 1, 1, 1,
0.08444155, 0.3940444, 1.133449, 1, 1, 1, 1, 1,
0.08743436, -1.036853, 4.880893, 1, 1, 1, 1, 1,
0.08795247, -2.253066, 3.385267, 1, 1, 1, 1, 1,
0.09028242, -0.08933163, 1.95253, 1, 1, 1, 1, 1,
0.09299363, 1.302267, -1.667352, 0, 0, 1, 1, 1,
0.09643567, -0.2120998, 1.630435, 1, 0, 0, 1, 1,
0.09946296, 1.339063, 0.4345736, 1, 0, 0, 1, 1,
0.1058887, 0.4100311, 0.6033203, 1, 0, 0, 1, 1,
0.1116618, -0.6638905, 2.99386, 1, 0, 0, 1, 1,
0.1129212, 0.1275121, -0.8359945, 1, 0, 0, 1, 1,
0.1137157, 1.566753, 1.268201, 0, 0, 0, 1, 1,
0.1178931, -2.680448, 2.197579, 0, 0, 0, 1, 1,
0.1226698, 0.4443098, 1.278499, 0, 0, 0, 1, 1,
0.1228881, 0.868816, 0.4039486, 0, 0, 0, 1, 1,
0.1256723, -1.670599, 3.65733, 0, 0, 0, 1, 1,
0.1333326, -1.265199, 2.487207, 0, 0, 0, 1, 1,
0.1335953, -0.09968545, 0.002717948, 0, 0, 0, 1, 1,
0.1395936, -1.013986, 3.259702, 1, 1, 1, 1, 1,
0.1516438, 0.1613305, 1.141545, 1, 1, 1, 1, 1,
0.1535313, -1.019938, 2.59275, 1, 1, 1, 1, 1,
0.1563377, 1.277964, 1.171865, 1, 1, 1, 1, 1,
0.1571974, -0.4719323, 1.047029, 1, 1, 1, 1, 1,
0.1577863, 1.517209, -0.09359635, 1, 1, 1, 1, 1,
0.1593291, -1.421169, 2.925076, 1, 1, 1, 1, 1,
0.1605189, 0.0522534, -0.2936872, 1, 1, 1, 1, 1,
0.1622552, 1.266254, 0.02588508, 1, 1, 1, 1, 1,
0.1641403, 0.7450653, 0.2492306, 1, 1, 1, 1, 1,
0.1646444, -0.2801444, 3.860723, 1, 1, 1, 1, 1,
0.1650808, -1.585194, 2.547165, 1, 1, 1, 1, 1,
0.1737303, 0.4405845, 0.3057968, 1, 1, 1, 1, 1,
0.1756705, 0.8453238, -0.3946538, 1, 1, 1, 1, 1,
0.1772144, -0.1701597, 2.27715, 1, 1, 1, 1, 1,
0.1793268, -1.175593, 4.616857, 0, 0, 1, 1, 1,
0.1833396, -1.224757, 1.420993, 1, 0, 0, 1, 1,
0.183966, 0.2318131, 1.03561, 1, 0, 0, 1, 1,
0.1852853, 0.4393762, 0.5056173, 1, 0, 0, 1, 1,
0.1865086, 0.735967, 0.8975131, 1, 0, 0, 1, 1,
0.1885403, 1.307751, -0.1225622, 1, 0, 0, 1, 1,
0.1889074, 1.507592, 0.6115277, 0, 0, 0, 1, 1,
0.1890359, 1.18468, 0.4688074, 0, 0, 0, 1, 1,
0.1900422, -0.01085566, 1.746359, 0, 0, 0, 1, 1,
0.1939585, 0.6725671, 1.193144, 0, 0, 0, 1, 1,
0.1940906, -0.03805676, 2.732312, 0, 0, 0, 1, 1,
0.195711, -1.211032, 4.915349, 0, 0, 0, 1, 1,
0.2042892, -2.084051, 2.600498, 0, 0, 0, 1, 1,
0.2050667, -0.08343176, 1.510453, 1, 1, 1, 1, 1,
0.2053027, 1.424224, 1.546008, 1, 1, 1, 1, 1,
0.2063067, 0.6662631, 2.099583, 1, 1, 1, 1, 1,
0.2087749, -0.4110758, 2.036728, 1, 1, 1, 1, 1,
0.2124587, 0.5517153, -0.01275966, 1, 1, 1, 1, 1,
0.2221834, -1.463495, 1.380003, 1, 1, 1, 1, 1,
0.2226688, 1.025846, 0.8495989, 1, 1, 1, 1, 1,
0.2315287, -0.7427333, 1.64847, 1, 1, 1, 1, 1,
0.2317593, -0.6925936, 1.164988, 1, 1, 1, 1, 1,
0.2339635, -0.9141322, 3.542605, 1, 1, 1, 1, 1,
0.236939, -1.041727, 2.801275, 1, 1, 1, 1, 1,
0.2378523, 0.06144428, -0.6995018, 1, 1, 1, 1, 1,
0.2380386, 0.4027869, 1.372224, 1, 1, 1, 1, 1,
0.2382815, -0.6099698, 3.626447, 1, 1, 1, 1, 1,
0.238543, 0.1376306, -0.7360732, 1, 1, 1, 1, 1,
0.2389858, 0.6913086, -0.4533961, 0, 0, 1, 1, 1,
0.2390675, -0.03071627, 2.195076, 1, 0, 0, 1, 1,
0.2394189, 1.295745, 0.4523271, 1, 0, 0, 1, 1,
0.2422925, 1.7763, 0.3894582, 1, 0, 0, 1, 1,
0.2458878, 0.4282227, 0.08326601, 1, 0, 0, 1, 1,
0.2471428, 0.785365, 0.177809, 1, 0, 0, 1, 1,
0.2512809, 1.1306, 0.1827349, 0, 0, 0, 1, 1,
0.2574506, 0.8036752, 1.700627, 0, 0, 0, 1, 1,
0.2586474, -0.7344175, 3.499413, 0, 0, 0, 1, 1,
0.2603659, -1.476416, 1.094621, 0, 0, 0, 1, 1,
0.2679068, -0.4026941, 3.094699, 0, 0, 0, 1, 1,
0.2723489, -1.908698, 1.812495, 0, 0, 0, 1, 1,
0.2735254, 0.5254226, 1.78208, 0, 0, 0, 1, 1,
0.2735725, -1.391826, 2.83706, 1, 1, 1, 1, 1,
0.2775272, -2.224617, 2.146944, 1, 1, 1, 1, 1,
0.2799785, -0.04044044, 0.4305215, 1, 1, 1, 1, 1,
0.2816779, -0.1570477, 1.942322, 1, 1, 1, 1, 1,
0.2821384, -0.925765, 2.797788, 1, 1, 1, 1, 1,
0.2828406, 0.6608922, 1.849563, 1, 1, 1, 1, 1,
0.2858338, 1.001831, 1.296854, 1, 1, 1, 1, 1,
0.2861089, 0.2576313, -0.4197437, 1, 1, 1, 1, 1,
0.2863188, -0.4746249, 3.378984, 1, 1, 1, 1, 1,
0.2875312, -0.05926565, 3.040598, 1, 1, 1, 1, 1,
0.2928455, 1.23993, 1.556879, 1, 1, 1, 1, 1,
0.2928899, -0.3824955, 2.451526, 1, 1, 1, 1, 1,
0.2972309, -1.284917, 2.721611, 1, 1, 1, 1, 1,
0.3016844, -0.5067186, 1.56415, 1, 1, 1, 1, 1,
0.3028376, -0.5338718, 3.549519, 1, 1, 1, 1, 1,
0.3041418, 1.209441, 0.5797747, 0, 0, 1, 1, 1,
0.3046667, -0.06010725, 1.412804, 1, 0, 0, 1, 1,
0.3082479, -0.08019233, 0.04914366, 1, 0, 0, 1, 1,
0.3082769, -1.818389, 3.539536, 1, 0, 0, 1, 1,
0.3109947, 0.2408918, 1.51128, 1, 0, 0, 1, 1,
0.3134491, 0.06911469, 0.2914349, 1, 0, 0, 1, 1,
0.3159445, 0.9629297, -1.28128, 0, 0, 0, 1, 1,
0.3268182, -0.3311808, 1.893584, 0, 0, 0, 1, 1,
0.3286982, -0.7671188, 2.686911, 0, 0, 0, 1, 1,
0.3300848, 0.500607, 0.05961647, 0, 0, 0, 1, 1,
0.3307859, -0.3403701, 3.414771, 0, 0, 0, 1, 1,
0.3335073, -0.2753467, 2.171634, 0, 0, 0, 1, 1,
0.3354147, -0.3486122, 3.037443, 0, 0, 0, 1, 1,
0.3360222, -1.315417, 3.199648, 1, 1, 1, 1, 1,
0.3461503, -0.0507115, 2.333428, 1, 1, 1, 1, 1,
0.3563059, 1.328712, 0.4554147, 1, 1, 1, 1, 1,
0.3627256, -0.3787925, 0.4300037, 1, 1, 1, 1, 1,
0.3649721, 1.135625, 0.7709995, 1, 1, 1, 1, 1,
0.3689676, -1.19391, 3.488027, 1, 1, 1, 1, 1,
0.3793663, -0.4196288, 0.8168826, 1, 1, 1, 1, 1,
0.3799534, -0.1628554, 2.596424, 1, 1, 1, 1, 1,
0.3833019, -0.1142045, 1.173196, 1, 1, 1, 1, 1,
0.3846753, 0.7805619, 0.9862189, 1, 1, 1, 1, 1,
0.3884677, -0.6061187, 1.881861, 1, 1, 1, 1, 1,
0.3938903, -1.260106, 3.318187, 1, 1, 1, 1, 1,
0.3955533, -0.4959586, 0.8251905, 1, 1, 1, 1, 1,
0.405403, 0.7932557, 1.51994, 1, 1, 1, 1, 1,
0.4087318, -1.540225, 3.002131, 1, 1, 1, 1, 1,
0.4104552, -0.5716966, 2.894954, 0, 0, 1, 1, 1,
0.4152611, -1.866417, 1.107474, 1, 0, 0, 1, 1,
0.421408, 0.2778954, 0.2686988, 1, 0, 0, 1, 1,
0.4225096, -0.7488758, 2.50353, 1, 0, 0, 1, 1,
0.4228693, -2.490751, 5.071337, 1, 0, 0, 1, 1,
0.424769, -1.798282, 2.06242, 1, 0, 0, 1, 1,
0.426031, 0.5079051, 0.4219469, 0, 0, 0, 1, 1,
0.4261533, -0.3719513, -0.01794122, 0, 0, 0, 1, 1,
0.42906, -0.1477388, 1.461121, 0, 0, 0, 1, 1,
0.4299097, -0.3646736, 2.4784, 0, 0, 0, 1, 1,
0.4344371, -0.6361464, 3.132773, 0, 0, 0, 1, 1,
0.4361701, -1.731194, 2.782765, 0, 0, 0, 1, 1,
0.4373251, -0.7179186, 3.960716, 0, 0, 0, 1, 1,
0.4417894, 0.2946181, 3.059424, 1, 1, 1, 1, 1,
0.4425978, 0.4376584, 0.558833, 1, 1, 1, 1, 1,
0.445812, -0.7623223, -0.1399444, 1, 1, 1, 1, 1,
0.4493408, -2.484081, 2.441194, 1, 1, 1, 1, 1,
0.4529337, -1.411672, 2.781446, 1, 1, 1, 1, 1,
0.4537291, -1.034615, 4.52779, 1, 1, 1, 1, 1,
0.454616, -0.7022545, 2.646535, 1, 1, 1, 1, 1,
0.4554955, -0.6614726, 0.6863993, 1, 1, 1, 1, 1,
0.4593162, 1.995027, 0.02031959, 1, 1, 1, 1, 1,
0.4611305, -0.6015326, 3.773097, 1, 1, 1, 1, 1,
0.4628924, 0.5024022, -0.3375148, 1, 1, 1, 1, 1,
0.464204, 0.3525919, 1.676873, 1, 1, 1, 1, 1,
0.4652865, -0.5739101, 1.736776, 1, 1, 1, 1, 1,
0.4655789, -0.4108713, 2.712175, 1, 1, 1, 1, 1,
0.4681344, -0.5955013, 3.232804, 1, 1, 1, 1, 1,
0.4722117, 1.314382, -1.822157, 0, 0, 1, 1, 1,
0.4738808, -1.591351, 3.985714, 1, 0, 0, 1, 1,
0.4773838, -0.8554657, 1.949821, 1, 0, 0, 1, 1,
0.4843522, 2.58026, -0.3727371, 1, 0, 0, 1, 1,
0.4933967, 1.123607, 0.2111613, 1, 0, 0, 1, 1,
0.4946674, 0.6756201, 0.8315049, 1, 0, 0, 1, 1,
0.501896, 0.02313526, 1.033836, 0, 0, 0, 1, 1,
0.5021754, -0.4119904, 2.160088, 0, 0, 0, 1, 1,
0.5053683, -0.06284229, 1.468661, 0, 0, 0, 1, 1,
0.5078325, -0.02733172, 3.983112, 0, 0, 0, 1, 1,
0.5093128, -0.6848015, 2.703168, 0, 0, 0, 1, 1,
0.510704, 0.012171, 1.180321, 0, 0, 0, 1, 1,
0.5120292, 2.216052, 1.975949, 0, 0, 0, 1, 1,
0.5153008, -1.5782, 1.45748, 1, 1, 1, 1, 1,
0.517187, 0.3948876, -0.5327462, 1, 1, 1, 1, 1,
0.5198665, -1.021843, 2.164711, 1, 1, 1, 1, 1,
0.5262978, -1.052337, 2.962051, 1, 1, 1, 1, 1,
0.5323144, 2.603552, 0.2594673, 1, 1, 1, 1, 1,
0.5330968, -1.750919, 4.631074, 1, 1, 1, 1, 1,
0.5461705, -1.254195, 3.411264, 1, 1, 1, 1, 1,
0.5487332, -0.4908203, 2.830537, 1, 1, 1, 1, 1,
0.5525303, 1.714191, 1.258184, 1, 1, 1, 1, 1,
0.553574, -0.06052216, 0.3598954, 1, 1, 1, 1, 1,
0.5554962, -1.805057, 1.609515, 1, 1, 1, 1, 1,
0.5571542, -0.4880425, 3.103272, 1, 1, 1, 1, 1,
0.5615971, -0.7408661, 3.11163, 1, 1, 1, 1, 1,
0.5643179, 0.02605161, 1.152692, 1, 1, 1, 1, 1,
0.5643669, 0.2371426, 2.179999, 1, 1, 1, 1, 1,
0.5660818, -0.04449826, 1.908741, 0, 0, 1, 1, 1,
0.5699323, 0.5215243, 1.565833, 1, 0, 0, 1, 1,
0.5712386, -0.2096037, 2.615351, 1, 0, 0, 1, 1,
0.5714286, 0.4375739, 1.863862, 1, 0, 0, 1, 1,
0.5722291, 0.7104087, 0.4805742, 1, 0, 0, 1, 1,
0.5732293, -1.2391, 4.0632, 1, 0, 0, 1, 1,
0.5761257, 0.805172, 0.7703992, 0, 0, 0, 1, 1,
0.5804609, -0.5656435, 2.360137, 0, 0, 0, 1, 1,
0.584283, -0.5570764, 1.029724, 0, 0, 0, 1, 1,
0.5864113, 0.6580513, 0.448883, 0, 0, 0, 1, 1,
0.6041034, 2.030266, 0.6861465, 0, 0, 0, 1, 1,
0.6064077, -0.631229, 2.014836, 0, 0, 0, 1, 1,
0.6158795, -1.046337, 1.930754, 0, 0, 0, 1, 1,
0.6206743, 0.5518999, 2.8482, 1, 1, 1, 1, 1,
0.6229366, -0.3221356, 1.31367, 1, 1, 1, 1, 1,
0.6239986, 0.04045808, 2.737081, 1, 1, 1, 1, 1,
0.633636, -0.4854383, 3.56311, 1, 1, 1, 1, 1,
0.6354634, -0.08234689, 3.353966, 1, 1, 1, 1, 1,
0.637422, 2.4459, 1.996274, 1, 1, 1, 1, 1,
0.6397514, -0.1024539, 1.255678, 1, 1, 1, 1, 1,
0.641241, -1.11455, 0.526852, 1, 1, 1, 1, 1,
0.6434592, 0.3917523, 1.273499, 1, 1, 1, 1, 1,
0.6450502, 0.1099859, -1.010865, 1, 1, 1, 1, 1,
0.6474727, -0.9079086, 2.078772, 1, 1, 1, 1, 1,
0.6498625, 0.5922133, 0.6220728, 1, 1, 1, 1, 1,
0.6507567, -1.345337, 3.16083, 1, 1, 1, 1, 1,
0.6514842, -0.6650721, 1.322394, 1, 1, 1, 1, 1,
0.6541036, -0.6508855, 2.504393, 1, 1, 1, 1, 1,
0.6596169, -0.4685027, 2.046084, 0, 0, 1, 1, 1,
0.6600357, -0.9272373, 3.290041, 1, 0, 0, 1, 1,
0.6718038, 0.8643333, 0.9330647, 1, 0, 0, 1, 1,
0.67378, 1.325937, 2.009178, 1, 0, 0, 1, 1,
0.674848, -0.4921977, 1.886252, 1, 0, 0, 1, 1,
0.6806437, -0.1795599, 1.245671, 1, 0, 0, 1, 1,
0.6810108, -0.1343358, 2.302991, 0, 0, 0, 1, 1,
0.6832399, 1.115724, 1.775607, 0, 0, 0, 1, 1,
0.6856215, -0.4678755, 2.462192, 0, 0, 0, 1, 1,
0.6906338, 1.009441, 1.037026, 0, 0, 0, 1, 1,
0.694893, -0.9948012, 0.9517738, 0, 0, 0, 1, 1,
0.6951992, 1.360399, 0.1514284, 0, 0, 0, 1, 1,
0.696842, 1.468225, 0.6409656, 0, 0, 0, 1, 1,
0.6991564, 0.4725732, 1.533237, 1, 1, 1, 1, 1,
0.7038156, -0.7213475, 2.550385, 1, 1, 1, 1, 1,
0.7061363, 0.4710827, 2.980285, 1, 1, 1, 1, 1,
0.7062958, 0.3130641, 0.78416, 1, 1, 1, 1, 1,
0.7122144, 0.998647, 2.048936, 1, 1, 1, 1, 1,
0.7209427, -0.5356011, 2.816661, 1, 1, 1, 1, 1,
0.7412292, 0.8495572, -0.7846703, 1, 1, 1, 1, 1,
0.7422947, 1.239584, 0.9430425, 1, 1, 1, 1, 1,
0.7466406, -0.8791882, 2.253711, 1, 1, 1, 1, 1,
0.7561776, 0.6750684, -0.05880276, 1, 1, 1, 1, 1,
0.7647643, -1.235207, 3.357893, 1, 1, 1, 1, 1,
0.7650192, 0.9366358, 0.6147258, 1, 1, 1, 1, 1,
0.768272, 0.2879206, 0.4148195, 1, 1, 1, 1, 1,
0.7688081, -0.7449931, 2.136661, 1, 1, 1, 1, 1,
0.7714247, 0.7432978, 0.6119655, 1, 1, 1, 1, 1,
0.7728923, -0.7550642, 0.4634204, 0, 0, 1, 1, 1,
0.7747647, -0.8473493, 3.47797, 1, 0, 0, 1, 1,
0.7766092, -0.0460976, 0.904246, 1, 0, 0, 1, 1,
0.780356, -1.311545, 2.804057, 1, 0, 0, 1, 1,
0.7832165, 0.03727982, 0.4417928, 1, 0, 0, 1, 1,
0.7855446, -0.4696971, 2.205503, 1, 0, 0, 1, 1,
0.7862533, 0.1946447, 0.9380099, 0, 0, 0, 1, 1,
0.7878637, -1.009694, 3.108632, 0, 0, 0, 1, 1,
0.7906662, 0.5302609, 0.8935974, 0, 0, 0, 1, 1,
0.7953902, -0.4894508, 0.7215579, 0, 0, 0, 1, 1,
0.7958429, -1.26822, 2.67857, 0, 0, 0, 1, 1,
0.797714, 0.4369475, 1.431136, 0, 0, 0, 1, 1,
0.7978685, 1.026348, 1.19474, 0, 0, 0, 1, 1,
0.8067876, -0.2125914, 2.901578, 1, 1, 1, 1, 1,
0.8088374, -1.490562, 1.760553, 1, 1, 1, 1, 1,
0.8112046, -0.3048471, 1.364917, 1, 1, 1, 1, 1,
0.8114517, 0.03364084, 1.619943, 1, 1, 1, 1, 1,
0.81467, -0.878389, 2.984354, 1, 1, 1, 1, 1,
0.8262635, 1.103443, 1.98799, 1, 1, 1, 1, 1,
0.8274797, -0.1755311, 0.0445317, 1, 1, 1, 1, 1,
0.83764, -0.7392114, 1.638677, 1, 1, 1, 1, 1,
0.844947, -0.1060602, 2.615391, 1, 1, 1, 1, 1,
0.8452908, -0.5770481, -0.2237249, 1, 1, 1, 1, 1,
0.8493603, 0.3096637, 1.595932, 1, 1, 1, 1, 1,
0.8540077, -0.07726938, 1.297229, 1, 1, 1, 1, 1,
0.8544855, -0.6987571, 0.7040224, 1, 1, 1, 1, 1,
0.8663726, 0.9284434, 1.242618, 1, 1, 1, 1, 1,
0.8774238, 0.5019566, 1.181854, 1, 1, 1, 1, 1,
0.8781754, -1.531944, 2.049436, 0, 0, 1, 1, 1,
0.8848646, 0.1666571, 2.803184, 1, 0, 0, 1, 1,
0.8901011, 1.349811, 1.646435, 1, 0, 0, 1, 1,
0.8906659, -0.1088254, 3.702312, 1, 0, 0, 1, 1,
0.892793, -0.3913567, 2.845081, 1, 0, 0, 1, 1,
0.8942989, 0.748136, -0.1079828, 1, 0, 0, 1, 1,
0.90067, -1.308749, 2.341402, 0, 0, 0, 1, 1,
0.9056466, 1.4006, -0.9227803, 0, 0, 0, 1, 1,
0.9093335, 0.903929, 1.08977, 0, 0, 0, 1, 1,
0.9156834, -0.2073054, -0.3549584, 0, 0, 0, 1, 1,
0.9227286, 0.5504169, 2.239531, 0, 0, 0, 1, 1,
0.9255503, -0.0655001, 0.6978807, 0, 0, 0, 1, 1,
0.9258292, 0.8910547, -0.1371382, 0, 0, 0, 1, 1,
0.9313726, -1.264561, 2.794487, 1, 1, 1, 1, 1,
0.9334624, -0.2220732, 2.312947, 1, 1, 1, 1, 1,
0.9339625, -2.243915, 3.818321, 1, 1, 1, 1, 1,
0.9347151, -1.600554, 2.856034, 1, 1, 1, 1, 1,
0.9375879, 0.2608652, 1.232973, 1, 1, 1, 1, 1,
0.9418651, -2.372812, 3.302495, 1, 1, 1, 1, 1,
0.9423915, -1.236337, 1.244182, 1, 1, 1, 1, 1,
0.947619, -0.9843601, 1.938246, 1, 1, 1, 1, 1,
0.9541044, 0.7255397, 0.9856988, 1, 1, 1, 1, 1,
0.9565239, -1.077754, 3.372129, 1, 1, 1, 1, 1,
0.9594333, 0.1314507, 0.9239066, 1, 1, 1, 1, 1,
0.968823, -0.08916885, 2.711483, 1, 1, 1, 1, 1,
0.9726117, -0.5935394, 3.667197, 1, 1, 1, 1, 1,
0.9763417, 0.3093044, 1.14833, 1, 1, 1, 1, 1,
0.9825574, 0.6587117, 0.7949803, 1, 1, 1, 1, 1,
0.9837338, -0.4141883, 1.876667, 0, 0, 1, 1, 1,
0.9905871, -0.9344909, 1.797125, 1, 0, 0, 1, 1,
0.9932934, 1.914143, 2.310405, 1, 0, 0, 1, 1,
0.9949205, 0.6181651, 0.902338, 1, 0, 0, 1, 1,
0.9995784, 0.1513458, 1.133536, 1, 0, 0, 1, 1,
1.000062, -1.742052, 4.969057, 1, 0, 0, 1, 1,
1.004453, 0.592671, 1.075512, 0, 0, 0, 1, 1,
1.011328, -0.9847687, 1.716839, 0, 0, 0, 1, 1,
1.015791, 1.608289, 1.48312, 0, 0, 0, 1, 1,
1.018211, 1.108092, 1.019285, 0, 0, 0, 1, 1,
1.024811, 1.009935, -0.1722677, 0, 0, 0, 1, 1,
1.028411, -0.5531012, 2.911022, 0, 0, 0, 1, 1,
1.033208, -1.025324, 3.099728, 0, 0, 0, 1, 1,
1.040301, 0.4566535, -0.1233756, 1, 1, 1, 1, 1,
1.041048, 0.891119, 1.633983, 1, 1, 1, 1, 1,
1.069593, -2.08232, 2.294472, 1, 1, 1, 1, 1,
1.073478, 1.075392, -0.05499459, 1, 1, 1, 1, 1,
1.084421, -0.1048751, 0.6222907, 1, 1, 1, 1, 1,
1.087107, 0.3333644, 1.459288, 1, 1, 1, 1, 1,
1.088323, 0.2530261, 2.719598, 1, 1, 1, 1, 1,
1.090435, 0.5822247, 0.9879292, 1, 1, 1, 1, 1,
1.090966, 1.156268, 0.04362455, 1, 1, 1, 1, 1,
1.091566, -0.5318937, 2.035967, 1, 1, 1, 1, 1,
1.097709, 0.2634602, 1.648706, 1, 1, 1, 1, 1,
1.098955, -1.275999, 0.473529, 1, 1, 1, 1, 1,
1.10673, -0.4151731, 2.652912, 1, 1, 1, 1, 1,
1.116263, 1.208531, 1.685102, 1, 1, 1, 1, 1,
1.119533, 0.4437557, 1.266873, 1, 1, 1, 1, 1,
1.12312, 0.8343912, -0.6300265, 0, 0, 1, 1, 1,
1.134534, 0.8670229, 1.387748, 1, 0, 0, 1, 1,
1.138305, 0.3805472, 0.1186966, 1, 0, 0, 1, 1,
1.13844, 0.1926772, 2.025743, 1, 0, 0, 1, 1,
1.140628, 0.06488601, -0.4435217, 1, 0, 0, 1, 1,
1.143335, -0.06326209, 4.05946, 1, 0, 0, 1, 1,
1.143811, -0.4645991, 0.9707213, 0, 0, 0, 1, 1,
1.145328, 0.0833108, 2.589133, 0, 0, 0, 1, 1,
1.161676, -0.4092666, 0.9172601, 0, 0, 0, 1, 1,
1.164042, 0.7492989, 2.184789, 0, 0, 0, 1, 1,
1.166477, -1.180936, 3.239298, 0, 0, 0, 1, 1,
1.167873, -0.6000508, 2.101562, 0, 0, 0, 1, 1,
1.16954, -0.7948748, 4.030005, 0, 0, 0, 1, 1,
1.170269, -0.9584885, 3.265427, 1, 1, 1, 1, 1,
1.171671, 1.467251, -0.3730252, 1, 1, 1, 1, 1,
1.173378, 0.05757201, 0.4031854, 1, 1, 1, 1, 1,
1.176982, 0.2081919, 0.674539, 1, 1, 1, 1, 1,
1.180825, -0.996704, 3.377729, 1, 1, 1, 1, 1,
1.186827, -0.8702229, 0.9342, 1, 1, 1, 1, 1,
1.1887, 0.5784065, 1.204326, 1, 1, 1, 1, 1,
1.202402, -1.446646, 3.529598, 1, 1, 1, 1, 1,
1.20252, 1.366112, 0.7243489, 1, 1, 1, 1, 1,
1.206673, -1.711892, 3.480461, 1, 1, 1, 1, 1,
1.210357, 0.8001745, 1.199117, 1, 1, 1, 1, 1,
1.210991, 1.113608, -0.6852593, 1, 1, 1, 1, 1,
1.213156, 0.4470278, 1.659902, 1, 1, 1, 1, 1,
1.217018, -0.4532877, 1.755902, 1, 1, 1, 1, 1,
1.223278, 0.1110429, 1.779544, 1, 1, 1, 1, 1,
1.223318, 0.1722919, 0.8465945, 0, 0, 1, 1, 1,
1.232087, -0.1530632, 1.767178, 1, 0, 0, 1, 1,
1.233256, -1.421864, 2.328954, 1, 0, 0, 1, 1,
1.233969, 1.077677, 2.007606, 1, 0, 0, 1, 1,
1.251069, -0.9869067, 3.167928, 1, 0, 0, 1, 1,
1.264676, -0.5309217, 3.324264, 1, 0, 0, 1, 1,
1.267933, 0.470483, 0.864157, 0, 0, 0, 1, 1,
1.277927, -1.212846, 2.272135, 0, 0, 0, 1, 1,
1.280611, -0.3947139, 1.462414, 0, 0, 0, 1, 1,
1.281454, -0.6183864, 3.23289, 0, 0, 0, 1, 1,
1.284075, -0.7727098, 4.488743, 0, 0, 0, 1, 1,
1.288495, 0.6041474, 1.392167, 0, 0, 0, 1, 1,
1.289245, -1.079754, 1.770739, 0, 0, 0, 1, 1,
1.298056, -1.478355, 2.176535, 1, 1, 1, 1, 1,
1.299352, -0.848702, 2.996615, 1, 1, 1, 1, 1,
1.322518, -0.1115887, 3.170434, 1, 1, 1, 1, 1,
1.326124, 1.475446, 0.701427, 1, 1, 1, 1, 1,
1.326264, -1.876985, 2.398939, 1, 1, 1, 1, 1,
1.334658, -1.045187, 2.9765, 1, 1, 1, 1, 1,
1.338181, 1.491736, 1.059955, 1, 1, 1, 1, 1,
1.353717, 1.200646, 1.969093, 1, 1, 1, 1, 1,
1.359477, 0.972263, 1.962512, 1, 1, 1, 1, 1,
1.360129, 1.391086, 0.4401506, 1, 1, 1, 1, 1,
1.394287, 0.4623882, 2.43555, 1, 1, 1, 1, 1,
1.403224, -0.3438327, 1.259164, 1, 1, 1, 1, 1,
1.40418, -0.4603677, 0.6820456, 1, 1, 1, 1, 1,
1.407261, -0.2976427, 1.124399, 1, 1, 1, 1, 1,
1.410373, 0.6339168, -1.224865, 1, 1, 1, 1, 1,
1.424319, -0.6938751, 3.336462, 0, 0, 1, 1, 1,
1.425979, 2.115963, 0.2187418, 1, 0, 0, 1, 1,
1.428138, -0.1637695, 3.169503, 1, 0, 0, 1, 1,
1.437419, -0.1396187, 1.393866, 1, 0, 0, 1, 1,
1.446113, 0.3701484, 0.3587891, 1, 0, 0, 1, 1,
1.45028, 0.5506702, 0.4744378, 1, 0, 0, 1, 1,
1.451744, 2.391654, 1.518999, 0, 0, 0, 1, 1,
1.453281, 0.6088765, 2.246428, 0, 0, 0, 1, 1,
1.456005, -0.4991479, 2.178023, 0, 0, 0, 1, 1,
1.456319, 0.02377043, 2.405129, 0, 0, 0, 1, 1,
1.46969, 0.3905815, 1.522405, 0, 0, 0, 1, 1,
1.47034, -0.1119096, 2.517721, 0, 0, 0, 1, 1,
1.47187, -1.800901, 2.247066, 0, 0, 0, 1, 1,
1.477911, -1.146851, 2.000623, 1, 1, 1, 1, 1,
1.479109, 0.6531576, 0.8906237, 1, 1, 1, 1, 1,
1.494922, 0.9443914, 0.7906482, 1, 1, 1, 1, 1,
1.507564, 2.283263, 1.272121, 1, 1, 1, 1, 1,
1.512212, 0.8320457, 0.9570195, 1, 1, 1, 1, 1,
1.52316, 0.05541914, 1.774581, 1, 1, 1, 1, 1,
1.532323, -0.7695412, 1.589829, 1, 1, 1, 1, 1,
1.548135, 0.7315114, 0.2664705, 1, 1, 1, 1, 1,
1.555178, -0.3660868, 3.890614, 1, 1, 1, 1, 1,
1.560529, -1.267408, 2.655691, 1, 1, 1, 1, 1,
1.560619, 0.3796487, 0.02067768, 1, 1, 1, 1, 1,
1.595502, 0.7464158, 1.508231, 1, 1, 1, 1, 1,
1.598948, -0.9037115, 2.641684, 1, 1, 1, 1, 1,
1.628477, 0.8931708, 1.872873, 1, 1, 1, 1, 1,
1.638395, 0.8960314, 0.6641327, 1, 1, 1, 1, 1,
1.638878, 0.3344317, 1.202915, 0, 0, 1, 1, 1,
1.641815, -0.4889421, 1.073652, 1, 0, 0, 1, 1,
1.645658, -0.03694919, 2.298343, 1, 0, 0, 1, 1,
1.646616, -0.7422933, 2.135032, 1, 0, 0, 1, 1,
1.648149, -1.187835, 1.739841, 1, 0, 0, 1, 1,
1.649055, -0.5017208, 1.251075, 1, 0, 0, 1, 1,
1.656276, 1.302113, -0.7218161, 0, 0, 0, 1, 1,
1.656757, 0.1989418, 0.5131935, 0, 0, 0, 1, 1,
1.657906, -0.150379, 1.309231, 0, 0, 0, 1, 1,
1.663894, 0.08590928, 1.970799, 0, 0, 0, 1, 1,
1.684054, -0.5647092, 0.6418924, 0, 0, 0, 1, 1,
1.68928, 0.2689497, 2.092157, 0, 0, 0, 1, 1,
1.697732, -1.43108, 3.004193, 0, 0, 0, 1, 1,
1.701314, -1.9346, 1.557393, 1, 1, 1, 1, 1,
1.71346, 1.206353, 0.6947131, 1, 1, 1, 1, 1,
1.723948, -0.5833142, 2.19295, 1, 1, 1, 1, 1,
1.734676, -0.7659429, 0.9708303, 1, 1, 1, 1, 1,
1.760283, -1.991385, 4.095119, 1, 1, 1, 1, 1,
1.761822, -0.8072444, 1.53732, 1, 1, 1, 1, 1,
1.770103, 0.03207514, 0.7909412, 1, 1, 1, 1, 1,
1.796052, 1.955901, 0.468592, 1, 1, 1, 1, 1,
1.819495, -0.72225, 4.147362, 1, 1, 1, 1, 1,
1.824849, 0.9899853, 0.03395398, 1, 1, 1, 1, 1,
1.828006, -0.1153688, 1.661906, 1, 1, 1, 1, 1,
1.864261, 0.1228447, 1.21959, 1, 1, 1, 1, 1,
1.864421, -0.8880928, 2.615835, 1, 1, 1, 1, 1,
1.872357, 2.203686, 1.646832, 1, 1, 1, 1, 1,
1.874776, -1.125355, 2.708469, 1, 1, 1, 1, 1,
1.96026, 0.9534006, 0.6743296, 0, 0, 1, 1, 1,
1.964357, 0.9017016, 1.383859, 1, 0, 0, 1, 1,
1.979298, -1.034384, 0.9369713, 1, 0, 0, 1, 1,
1.982983, -0.9837685, 1.259917, 1, 0, 0, 1, 1,
1.991855, -0.5964296, 1.125843, 1, 0, 0, 1, 1,
2.128133, 0.2679823, 1.270837, 1, 0, 0, 1, 1,
2.146968, -0.5861546, 1.961131, 0, 0, 0, 1, 1,
2.18094, 1.94393, 3.086526, 0, 0, 0, 1, 1,
2.181012, 0.2209624, 0.96306, 0, 0, 0, 1, 1,
2.215649, 1.719901, 0.9295609, 0, 0, 0, 1, 1,
2.227371, -1.533777, 2.018559, 0, 0, 0, 1, 1,
2.235635, -0.2334493, 1.995638, 0, 0, 0, 1, 1,
2.266527, 0.2991068, 2.349675, 0, 0, 0, 1, 1,
2.287693, -0.03796301, -1.185036, 1, 1, 1, 1, 1,
2.300428, -0.3301377, -0.1976981, 1, 1, 1, 1, 1,
2.34893, -1.021275, 2.800735, 1, 1, 1, 1, 1,
2.363095, -0.04695106, 1.494651, 1, 1, 1, 1, 1,
2.367661, -0.07036176, 0.8501444, 1, 1, 1, 1, 1,
2.384623, -0.2931903, 0.7517231, 1, 1, 1, 1, 1,
2.384773, 2.23758, -1.356792, 1, 1, 1, 1, 1
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
var radius = 9.090232;
var distance = 31.92905;
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
mvMatrix.translate( 0.4811383, -0.1638606, 0.07675529 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.92905);
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
