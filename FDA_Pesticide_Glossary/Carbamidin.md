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
-3.333821, -0.1822621, -1.783611, 1, 0, 0, 1,
-2.94084, 0.6098993, -1.871936, 1, 0.007843138, 0, 1,
-2.922287, -0.4075948, -1.57406, 1, 0.01176471, 0, 1,
-2.801507, 1.540622, -0.7608443, 1, 0.01960784, 0, 1,
-2.787889, 0.07912319, 0.464339, 1, 0.02352941, 0, 1,
-2.674389, 1.566937, -0.894521, 1, 0.03137255, 0, 1,
-2.585499, -0.04889032, -2.120427, 1, 0.03529412, 0, 1,
-2.575305, -0.181398, -2.903842, 1, 0.04313726, 0, 1,
-2.414289, 1.978918, -1.272858, 1, 0.04705882, 0, 1,
-2.340029, 0.1132847, -2.727334, 1, 0.05490196, 0, 1,
-2.294449, 0.03024825, -0.6172492, 1, 0.05882353, 0, 1,
-2.29306, -2.087329, -1.183056, 1, 0.06666667, 0, 1,
-2.280733, 0.370842, -1.400497, 1, 0.07058824, 0, 1,
-2.252699, 1.196336, -0.9803674, 1, 0.07843138, 0, 1,
-2.238824, -2.130488, -1.523921, 1, 0.08235294, 0, 1,
-2.203844, 1.024552, -1.285442, 1, 0.09019608, 0, 1,
-2.193342, -0.6571088, -0.3222244, 1, 0.09411765, 0, 1,
-2.158304, 0.9293101, -0.06885733, 1, 0.1019608, 0, 1,
-2.156965, 0.9786786, -1.831873, 1, 0.1098039, 0, 1,
-2.14605, 0.4175938, -0.4102582, 1, 0.1137255, 0, 1,
-2.145796, 0.8740224, -1.350337, 1, 0.1215686, 0, 1,
-2.137146, -1.053791, -2.642304, 1, 0.1254902, 0, 1,
-2.10859, 1.095297, 0.2141806, 1, 0.1333333, 0, 1,
-2.101423, 1.211725, -0.8122832, 1, 0.1372549, 0, 1,
-2.085673, 0.6921073, -1.837566, 1, 0.145098, 0, 1,
-2.076933, 0.7905195, -2.519648, 1, 0.1490196, 0, 1,
-2.026392, 0.2060159, -3.259789, 1, 0.1568628, 0, 1,
-2.003707, 1.089128, -1.468123, 1, 0.1607843, 0, 1,
-2.001759, 0.6169451, -2.548988, 1, 0.1686275, 0, 1,
-1.973643, -0.6287398, -1.723558, 1, 0.172549, 0, 1,
-1.948148, 0.1545897, -1.65402, 1, 0.1803922, 0, 1,
-1.929966, 0.1945146, -1.650498, 1, 0.1843137, 0, 1,
-1.922869, -0.1938516, -1.091564, 1, 0.1921569, 0, 1,
-1.91954, 0.2062518, -1.979451, 1, 0.1960784, 0, 1,
-1.916587, -0.3217984, -1.58732, 1, 0.2039216, 0, 1,
-1.913214, -0.7545063, -3.116591, 1, 0.2117647, 0, 1,
-1.913146, 0.3194328, -2.312107, 1, 0.2156863, 0, 1,
-1.866066, 0.06128738, -3.026312, 1, 0.2235294, 0, 1,
-1.856691, 1.197971, -2.167578, 1, 0.227451, 0, 1,
-1.856626, 0.1667981, -0.9916791, 1, 0.2352941, 0, 1,
-1.854691, -1.311226, -2.593629, 1, 0.2392157, 0, 1,
-1.835588, -0.7919567, -1.668569, 1, 0.2470588, 0, 1,
-1.81815, -0.7272415, -2.695445, 1, 0.2509804, 0, 1,
-1.773271, -0.9922171, -2.083895, 1, 0.2588235, 0, 1,
-1.760097, -1.21322, -3.340352, 1, 0.2627451, 0, 1,
-1.740148, 0.8452525, -1.477561, 1, 0.2705882, 0, 1,
-1.723162, -0.3124628, -3.047306, 1, 0.2745098, 0, 1,
-1.720624, -2.171106, -2.985677, 1, 0.282353, 0, 1,
-1.714283, 0.1034242, -1.846803, 1, 0.2862745, 0, 1,
-1.694879, -0.04658397, -2.020278, 1, 0.2941177, 0, 1,
-1.682506, -1.616169, -1.944755, 1, 0.3019608, 0, 1,
-1.678136, 0.4319787, 0.5687277, 1, 0.3058824, 0, 1,
-1.65497, -0.4640405, -1.734455, 1, 0.3137255, 0, 1,
-1.641565, -1.25905, -0.9223225, 1, 0.3176471, 0, 1,
-1.63544, 0.5457611, -1.157145, 1, 0.3254902, 0, 1,
-1.633289, -1.704895, -2.744925, 1, 0.3294118, 0, 1,
-1.628197, -1.945109, -2.344251, 1, 0.3372549, 0, 1,
-1.594796, -0.7144845, -2.358948, 1, 0.3411765, 0, 1,
-1.579359, 0.9265445, 0.6867955, 1, 0.3490196, 0, 1,
-1.574321, 0.6719654, -0.07165075, 1, 0.3529412, 0, 1,
-1.565418, -0.5925882, -2.996279, 1, 0.3607843, 0, 1,
-1.565066, -0.1710547, -0.6552844, 1, 0.3647059, 0, 1,
-1.564071, -0.6710972, -1.216334, 1, 0.372549, 0, 1,
-1.562305, -0.674831, -0.5583878, 1, 0.3764706, 0, 1,
-1.558205, 1.216973, -0.7268546, 1, 0.3843137, 0, 1,
-1.551146, -0.5170206, -2.955081, 1, 0.3882353, 0, 1,
-1.548872, 0.9369283, -2.320711, 1, 0.3960784, 0, 1,
-1.548509, -0.7405788, -2.643026, 1, 0.4039216, 0, 1,
-1.545503, -0.05835718, -1.579589, 1, 0.4078431, 0, 1,
-1.544159, 0.592279, -0.347809, 1, 0.4156863, 0, 1,
-1.528031, -0.1589191, -2.701333, 1, 0.4196078, 0, 1,
-1.527433, 0.1129613, -1.006138, 1, 0.427451, 0, 1,
-1.523576, -0.9944755, -0.8768629, 1, 0.4313726, 0, 1,
-1.515479, -2.610915, -1.519065, 1, 0.4392157, 0, 1,
-1.514384, -0.8048046, -2.352877, 1, 0.4431373, 0, 1,
-1.504951, -0.09688319, -1.836526, 1, 0.4509804, 0, 1,
-1.494623, -0.4776359, -2.391004, 1, 0.454902, 0, 1,
-1.487018, -0.3875502, -0.3054213, 1, 0.4627451, 0, 1,
-1.480698, 0.1346416, -1.206207, 1, 0.4666667, 0, 1,
-1.463744, -1.533838, -1.289806, 1, 0.4745098, 0, 1,
-1.458962, -0.1193181, -1.345489, 1, 0.4784314, 0, 1,
-1.45678, -2.58302, -2.868808, 1, 0.4862745, 0, 1,
-1.453196, 0.622423, -0.6860701, 1, 0.4901961, 0, 1,
-1.448867, -0.06459462, -1.698581, 1, 0.4980392, 0, 1,
-1.448106, 1.130116, -1.010591, 1, 0.5058824, 0, 1,
-1.444004, 0.5629556, -0.7588149, 1, 0.509804, 0, 1,
-1.439509, -1.367691, -2.13167, 1, 0.5176471, 0, 1,
-1.43588, 0.7082289, -1.265693, 1, 0.5215687, 0, 1,
-1.433823, 1.098323, 0.06361163, 1, 0.5294118, 0, 1,
-1.427337, 1.046859, -1.177725, 1, 0.5333334, 0, 1,
-1.409207, 1.51961, -1.797679, 1, 0.5411765, 0, 1,
-1.402552, -0.5136261, -1.19832, 1, 0.5450981, 0, 1,
-1.401663, 0.830239, -1.328707, 1, 0.5529412, 0, 1,
-1.393159, -2.12003, -3.617889, 1, 0.5568628, 0, 1,
-1.382946, -0.2414724, -2.429086, 1, 0.5647059, 0, 1,
-1.380183, -0.4655014, -1.073612, 1, 0.5686275, 0, 1,
-1.364086, 0.5530488, -1.194238, 1, 0.5764706, 0, 1,
-1.350219, 1.195861, -1.01692, 1, 0.5803922, 0, 1,
-1.348061, 0.9999077, -0.9681473, 1, 0.5882353, 0, 1,
-1.339489, 0.2395129, -0.7623249, 1, 0.5921569, 0, 1,
-1.333549, 0.006260975, -0.1054337, 1, 0.6, 0, 1,
-1.316412, 0.3664895, -0.7859111, 1, 0.6078432, 0, 1,
-1.315346, 1.106136, -1.762968, 1, 0.6117647, 0, 1,
-1.309638, 0.8034768, -1.075652, 1, 0.6196079, 0, 1,
-1.303967, -1.390291, -1.690624, 1, 0.6235294, 0, 1,
-1.295821, 0.2927004, -1.252809, 1, 0.6313726, 0, 1,
-1.286442, -0.8201533, -2.558841, 1, 0.6352941, 0, 1,
-1.285957, -0.694355, -3.197804, 1, 0.6431373, 0, 1,
-1.282516, 0.828747, -0.1340255, 1, 0.6470588, 0, 1,
-1.281447, 0.9633074, -1.432188, 1, 0.654902, 0, 1,
-1.278143, -0.340727, 0.8409677, 1, 0.6588235, 0, 1,
-1.276573, -0.5570045, -0.04195352, 1, 0.6666667, 0, 1,
-1.275637, 0.9593463, -1.241069, 1, 0.6705883, 0, 1,
-1.271242, -2.060488, -3.37916, 1, 0.6784314, 0, 1,
-1.263843, -0.6144342, -2.40595, 1, 0.682353, 0, 1,
-1.260798, -0.9101989, -1.386657, 1, 0.6901961, 0, 1,
-1.260758, -0.7048993, -1.416451, 1, 0.6941177, 0, 1,
-1.25743, -1.07443, -2.162074, 1, 0.7019608, 0, 1,
-1.249439, 0.2056681, -2.177748, 1, 0.7098039, 0, 1,
-1.242067, 0.6472812, -2.805855, 1, 0.7137255, 0, 1,
-1.240949, -0.02507864, -3.467422, 1, 0.7215686, 0, 1,
-1.233279, -1.641943, -2.830755, 1, 0.7254902, 0, 1,
-1.22294, -2.069832, -2.091882, 1, 0.7333333, 0, 1,
-1.219156, 1.161708, -0.7934401, 1, 0.7372549, 0, 1,
-1.218663, -0.5344917, -1.649716, 1, 0.7450981, 0, 1,
-1.214913, 0.5466916, -1.398561, 1, 0.7490196, 0, 1,
-1.214145, 0.7113891, -0.4436972, 1, 0.7568628, 0, 1,
-1.208361, 0.11881, -2.110184, 1, 0.7607843, 0, 1,
-1.207192, 1.380111, -0.4154034, 1, 0.7686275, 0, 1,
-1.197266, -0.9879254, -2.252264, 1, 0.772549, 0, 1,
-1.19444, 0.1124062, -1.016624, 1, 0.7803922, 0, 1,
-1.19245, 1.048694, -0.5225477, 1, 0.7843137, 0, 1,
-1.185589, -0.1461284, -1.106624, 1, 0.7921569, 0, 1,
-1.183277, -0.6470147, -3.291003, 1, 0.7960784, 0, 1,
-1.180862, -0.3768109, -1.847627, 1, 0.8039216, 0, 1,
-1.176033, -0.5031784, -1.243029, 1, 0.8117647, 0, 1,
-1.175995, -0.6040977, -2.318985, 1, 0.8156863, 0, 1,
-1.170322, 1.484088, 0.5126874, 1, 0.8235294, 0, 1,
-1.166518, 0.5344171, 0.1886749, 1, 0.827451, 0, 1,
-1.165689, -0.1452796, -1.890939, 1, 0.8352941, 0, 1,
-1.16518, -0.2143502, -0.4448227, 1, 0.8392157, 0, 1,
-1.163255, 0.01327889, -4.38154, 1, 0.8470588, 0, 1,
-1.162598, 0.006081126, -2.158571, 1, 0.8509804, 0, 1,
-1.162492, -0.4637125, -2.394004, 1, 0.8588235, 0, 1,
-1.160328, 0.5027351, -2.709386, 1, 0.8627451, 0, 1,
-1.156472, -1.53846, -1.387412, 1, 0.8705882, 0, 1,
-1.151789, 0.2179488, -0.6096842, 1, 0.8745098, 0, 1,
-1.146544, 1.35307, 0.1092268, 1, 0.8823529, 0, 1,
-1.143399, -0.7249234, -2.073805, 1, 0.8862745, 0, 1,
-1.142522, 0.2518246, -1.8107, 1, 0.8941177, 0, 1,
-1.141054, 0.5985723, -1.265872, 1, 0.8980392, 0, 1,
-1.139533, -1.959321, -0.8805673, 1, 0.9058824, 0, 1,
-1.137553, -1.102393, -2.823156, 1, 0.9137255, 0, 1,
-1.134889, -0.9537903, -4.135826, 1, 0.9176471, 0, 1,
-1.12183, 0.07242012, -2.258387, 1, 0.9254902, 0, 1,
-1.12, -1.04185, -2.475911, 1, 0.9294118, 0, 1,
-1.114938, 0.3626873, 0.4802909, 1, 0.9372549, 0, 1,
-1.10919, -1.761265, -3.390013, 1, 0.9411765, 0, 1,
-1.104089, -1.771209, -1.052165, 1, 0.9490196, 0, 1,
-1.102055, -0.5528324, -0.5695731, 1, 0.9529412, 0, 1,
-1.099425, -0.5677771, -3.42159, 1, 0.9607843, 0, 1,
-1.097606, -0.4930389, -0.9848299, 1, 0.9647059, 0, 1,
-1.095694, 1.548884, -1.001149, 1, 0.972549, 0, 1,
-1.092123, 0.1097146, -1.562164, 1, 0.9764706, 0, 1,
-1.08867, -2.0483, -2.607262, 1, 0.9843137, 0, 1,
-1.088009, -1.882835, -3.320096, 1, 0.9882353, 0, 1,
-1.080388, 0.5989103, 0.06879769, 1, 0.9960784, 0, 1,
-1.077947, -0.3896306, -2.233873, 0.9960784, 1, 0, 1,
-1.075868, -0.2619867, -2.373085, 0.9921569, 1, 0, 1,
-1.071986, 0.04322264, -3.560449, 0.9843137, 1, 0, 1,
-1.069426, -0.6065794, -2.811948, 0.9803922, 1, 0, 1,
-1.069386, 0.7019994, -1.542774, 0.972549, 1, 0, 1,
-1.049554, -0.2775672, -1.016507, 0.9686275, 1, 0, 1,
-1.041687, 0.7722479, -1.556934, 0.9607843, 1, 0, 1,
-1.041678, 1.392523, -0.08406819, 0.9568627, 1, 0, 1,
-1.023213, -0.8613236, -2.668546, 0.9490196, 1, 0, 1,
-1.021163, -0.8573852, -1.200127, 0.945098, 1, 0, 1,
-1.019921, 0.198903, 0.1449463, 0.9372549, 1, 0, 1,
-1.017616, 0.9930897, -0.02889124, 0.9333333, 1, 0, 1,
-1.016376, -0.7500716, -2.109657, 0.9254902, 1, 0, 1,
-1.013376, -0.170065, -1.926223, 0.9215686, 1, 0, 1,
-1.000049, -2.14647, -3.126127, 0.9137255, 1, 0, 1,
-0.99948, 0.8234971, 1.61074, 0.9098039, 1, 0, 1,
-0.9994351, 1.912652, -1.260095, 0.9019608, 1, 0, 1,
-0.997086, 0.2241268, -0.8626414, 0.8941177, 1, 0, 1,
-0.990577, -0.1073508, -1.685887, 0.8901961, 1, 0, 1,
-0.9853584, -1.445598, -1.968387, 0.8823529, 1, 0, 1,
-0.9821681, 1.175118, -1.574799, 0.8784314, 1, 0, 1,
-0.9809718, 2.026416, -0.02626373, 0.8705882, 1, 0, 1,
-0.9719317, -0.817014, -2.387034, 0.8666667, 1, 0, 1,
-0.9674376, -1.062676, -1.351056, 0.8588235, 1, 0, 1,
-0.9667985, 0.0908027, 0.5551322, 0.854902, 1, 0, 1,
-0.9651672, -0.5754951, -0.7258413, 0.8470588, 1, 0, 1,
-0.9618151, -0.9500316, -2.769073, 0.8431373, 1, 0, 1,
-0.9580522, 1.097335, -0.05185992, 0.8352941, 1, 0, 1,
-0.9536134, -0.6056353, -2.289531, 0.8313726, 1, 0, 1,
-0.9535335, -1.236912, -1.707853, 0.8235294, 1, 0, 1,
-0.9476194, 1.601108, 0.7081262, 0.8196079, 1, 0, 1,
-0.9368233, 0.7049087, -0.8841673, 0.8117647, 1, 0, 1,
-0.9336243, 1.026087, -1.131818, 0.8078431, 1, 0, 1,
-0.9312405, -0.6474541, -1.854613, 0.8, 1, 0, 1,
-0.9224186, -0.4851355, -2.397209, 0.7921569, 1, 0, 1,
-0.9220994, 0.330879, -0.9965147, 0.7882353, 1, 0, 1,
-0.9213462, -1.324318, -4.475615, 0.7803922, 1, 0, 1,
-0.9088404, 1.02309, -1.659828, 0.7764706, 1, 0, 1,
-0.9082853, -1.636131, -0.9668833, 0.7686275, 1, 0, 1,
-0.9033939, -1.542595, -4.259677, 0.7647059, 1, 0, 1,
-0.8932198, -0.1114627, -0.01978214, 0.7568628, 1, 0, 1,
-0.8914242, -0.06214373, -2.316859, 0.7529412, 1, 0, 1,
-0.8913714, -0.09690265, -1.274342, 0.7450981, 1, 0, 1,
-0.889516, 0.2628385, -0.2902934, 0.7411765, 1, 0, 1,
-0.8872668, -1.737211, -2.007351, 0.7333333, 1, 0, 1,
-0.8834654, -1.264226, -1.727199, 0.7294118, 1, 0, 1,
-0.8825045, 1.147501, -0.629876, 0.7215686, 1, 0, 1,
-0.8814287, -0.2457523, -3.615143, 0.7176471, 1, 0, 1,
-0.8807083, 0.2486635, -2.191849, 0.7098039, 1, 0, 1,
-0.8776079, -0.3163397, -1.402586, 0.7058824, 1, 0, 1,
-0.875162, -0.00103096, -1.468051, 0.6980392, 1, 0, 1,
-0.871492, -0.3402518, -2.107151, 0.6901961, 1, 0, 1,
-0.8697954, -1.294548, -3.024439, 0.6862745, 1, 0, 1,
-0.8684016, 1.368616, -0.8487225, 0.6784314, 1, 0, 1,
-0.8644485, -0.49248, -1.96141, 0.6745098, 1, 0, 1,
-0.8614021, -1.51793, -3.489659, 0.6666667, 1, 0, 1,
-0.8566172, -0.9430267, -2.892575, 0.6627451, 1, 0, 1,
-0.8548253, 0.3712256, -1.847592, 0.654902, 1, 0, 1,
-0.8537704, -1.20754, -3.435649, 0.6509804, 1, 0, 1,
-0.8513156, 1.615662, -0.8050281, 0.6431373, 1, 0, 1,
-0.8469368, -2.77976, -5.418946, 0.6392157, 1, 0, 1,
-0.8421494, -0.7905612, -2.938732, 0.6313726, 1, 0, 1,
-0.8390667, 0.1137672, -2.341348, 0.627451, 1, 0, 1,
-0.8346601, -0.122142, -2.520272, 0.6196079, 1, 0, 1,
-0.8312716, 0.1300337, 0.04374406, 0.6156863, 1, 0, 1,
-0.8304694, -0.3870409, -3.040743, 0.6078432, 1, 0, 1,
-0.8303946, 1.332955, -0.3417081, 0.6039216, 1, 0, 1,
-0.8262102, 0.1566324, -3.13393, 0.5960785, 1, 0, 1,
-0.8207597, 1.777783, -0.8499463, 0.5882353, 1, 0, 1,
-0.8182418, 0.001871927, -0.09696971, 0.5843138, 1, 0, 1,
-0.8173347, 1.231047, 0.1235352, 0.5764706, 1, 0, 1,
-0.8145317, 1.100269, -1.968218, 0.572549, 1, 0, 1,
-0.8125613, 0.1119387, -1.418387, 0.5647059, 1, 0, 1,
-0.8087675, 1.296729, -1.271945, 0.5607843, 1, 0, 1,
-0.807516, -0.1624931, -1.572372, 0.5529412, 1, 0, 1,
-0.8037412, 0.9210938, -0.04677127, 0.5490196, 1, 0, 1,
-0.7967677, -0.05935199, -2.240163, 0.5411765, 1, 0, 1,
-0.7956455, -0.9458268, -2.043545, 0.5372549, 1, 0, 1,
-0.7942175, 0.7234583, 0.007700009, 0.5294118, 1, 0, 1,
-0.7938492, 0.05276219, -1.493399, 0.5254902, 1, 0, 1,
-0.7934155, 1.439784, 0.8030975, 0.5176471, 1, 0, 1,
-0.7928082, 1.085058, -0.5662239, 0.5137255, 1, 0, 1,
-0.7921748, -0.1004411, 0.3534637, 0.5058824, 1, 0, 1,
-0.7911431, -1.527106, -1.461796, 0.5019608, 1, 0, 1,
-0.787627, -0.4576665, -1.744251, 0.4941176, 1, 0, 1,
-0.7849349, -0.2988341, -4.453013, 0.4862745, 1, 0, 1,
-0.7780704, 0.5909305, -2.433935, 0.4823529, 1, 0, 1,
-0.7774655, -0.6874813, -0.9559328, 0.4745098, 1, 0, 1,
-0.7646528, -0.7366154, -1.998579, 0.4705882, 1, 0, 1,
-0.7632471, -0.406923, -2.956364, 0.4627451, 1, 0, 1,
-0.7568909, 0.4674619, -1.103553, 0.4588235, 1, 0, 1,
-0.752289, 0.08040618, -1.855015, 0.4509804, 1, 0, 1,
-0.7456185, 0.5395162, -0.92262, 0.4470588, 1, 0, 1,
-0.7420934, 0.486738, -1.134073, 0.4392157, 1, 0, 1,
-0.7413252, 0.3937259, -3.576845, 0.4352941, 1, 0, 1,
-0.7350301, 1.064761, -0.5605147, 0.427451, 1, 0, 1,
-0.7337564, -1.115115, -2.324843, 0.4235294, 1, 0, 1,
-0.733498, 0.4885025, -1.089785, 0.4156863, 1, 0, 1,
-0.7265172, -1.451749, -2.335161, 0.4117647, 1, 0, 1,
-0.7230412, 1.166827, -1.221502, 0.4039216, 1, 0, 1,
-0.7228866, -0.6945294, -4.974012, 0.3960784, 1, 0, 1,
-0.7219452, 0.8403988, -2.385526, 0.3921569, 1, 0, 1,
-0.7195044, 0.9842563, -0.0128798, 0.3843137, 1, 0, 1,
-0.7163973, 0.6179514, 1.368327, 0.3803922, 1, 0, 1,
-0.7071902, 0.300534, -2.107538, 0.372549, 1, 0, 1,
-0.6995529, -0.04931599, -2.883512, 0.3686275, 1, 0, 1,
-0.6991742, 0.621816, -0.1424092, 0.3607843, 1, 0, 1,
-0.6986622, 0.5569717, -1.210834, 0.3568628, 1, 0, 1,
-0.6977094, -0.7156352, -3.043161, 0.3490196, 1, 0, 1,
-0.6974524, 0.4987741, -0.5709922, 0.345098, 1, 0, 1,
-0.6884732, 0.2079758, -1.989414, 0.3372549, 1, 0, 1,
-0.6847059, -1.37963, -2.881759, 0.3333333, 1, 0, 1,
-0.6845078, -1.263222, -4.14306, 0.3254902, 1, 0, 1,
-0.683755, -0.354498, -4.125989, 0.3215686, 1, 0, 1,
-0.6835418, -1.684792, -2.46457, 0.3137255, 1, 0, 1,
-0.6792169, 0.6689672, 0.6596444, 0.3098039, 1, 0, 1,
-0.674548, -0.5506248, -3.188101, 0.3019608, 1, 0, 1,
-0.6728578, 1.368118, -1.590794, 0.2941177, 1, 0, 1,
-0.6720104, -0.05547513, -1.58665, 0.2901961, 1, 0, 1,
-0.6718399, -1.478938, -2.669443, 0.282353, 1, 0, 1,
-0.6712664, 1.653196, 1.317566, 0.2784314, 1, 0, 1,
-0.6681322, 0.4449408, -1.507842, 0.2705882, 1, 0, 1,
-0.6671044, -0.6167862, -2.993828, 0.2666667, 1, 0, 1,
-0.6568789, 0.9103584, -0.06430842, 0.2588235, 1, 0, 1,
-0.652694, -0.0626127, -1.848833, 0.254902, 1, 0, 1,
-0.6526321, -2.102535, -1.889925, 0.2470588, 1, 0, 1,
-0.6450204, 0.3613736, -0.8126439, 0.2431373, 1, 0, 1,
-0.6442747, 0.7260138, -2.094069, 0.2352941, 1, 0, 1,
-0.6427756, -1.127458, -2.978048, 0.2313726, 1, 0, 1,
-0.6394011, 1.699812, -0.1536041, 0.2235294, 1, 0, 1,
-0.6363105, 1.733351, -1.333817, 0.2196078, 1, 0, 1,
-0.6311795, 0.5944488, -0.4817497, 0.2117647, 1, 0, 1,
-0.629797, 1.23582, 0.1119964, 0.2078431, 1, 0, 1,
-0.6286762, 0.155671, -1.186619, 0.2, 1, 0, 1,
-0.6286038, -0.3375472, -3.346873, 0.1921569, 1, 0, 1,
-0.6238928, -0.7770796, -2.493528, 0.1882353, 1, 0, 1,
-0.6196312, 0.9882808, 0.4757006, 0.1803922, 1, 0, 1,
-0.6178553, 0.7789578, -0.8185816, 0.1764706, 1, 0, 1,
-0.6153323, -0.2788787, -0.2338006, 0.1686275, 1, 0, 1,
-0.6100679, 0.01875245, -1.038469, 0.1647059, 1, 0, 1,
-0.6088552, -0.3794237, -1.718361, 0.1568628, 1, 0, 1,
-0.6071275, 1.045422, -0.04385488, 0.1529412, 1, 0, 1,
-0.6068411, -0.3636065, -0.9014053, 0.145098, 1, 0, 1,
-0.6003324, 0.9464858, -0.6402572, 0.1411765, 1, 0, 1,
-0.5950616, 1.127907, 0.437557, 0.1333333, 1, 0, 1,
-0.5947156, 0.4754118, -0.859418, 0.1294118, 1, 0, 1,
-0.5886043, -0.9787546, -1.801256, 0.1215686, 1, 0, 1,
-0.5853031, -1.817838, -1.74364, 0.1176471, 1, 0, 1,
-0.5824203, -0.9694084, -0.276694, 0.1098039, 1, 0, 1,
-0.5679318, -0.3355359, -0.7600893, 0.1058824, 1, 0, 1,
-0.5674357, -0.8183556, -3.412129, 0.09803922, 1, 0, 1,
-0.5653541, 0.1759111, 0.4734946, 0.09019608, 1, 0, 1,
-0.5648444, -0.5638821, -1.872914, 0.08627451, 1, 0, 1,
-0.5647031, -2.076491, -3.205489, 0.07843138, 1, 0, 1,
-0.5616245, 0.6098265, -2.312667, 0.07450981, 1, 0, 1,
-0.5616182, 0.3542573, -0.4960876, 0.06666667, 1, 0, 1,
-0.5611835, -0.102576, -1.103058, 0.0627451, 1, 0, 1,
-0.5599578, -0.2167214, -2.854309, 0.05490196, 1, 0, 1,
-0.5581929, 0.7265297, -1.323354, 0.05098039, 1, 0, 1,
-0.5545187, 1.976237, -1.773313, 0.04313726, 1, 0, 1,
-0.5530147, -0.1778751, -1.081275, 0.03921569, 1, 0, 1,
-0.551217, -0.4897458, -2.726779, 0.03137255, 1, 0, 1,
-0.5456495, -1.865159, -3.203893, 0.02745098, 1, 0, 1,
-0.5423532, -1.452664, -1.477419, 0.01960784, 1, 0, 1,
-0.5406771, 1.589919, -0.626202, 0.01568628, 1, 0, 1,
-0.5382552, -0.8311618, -1.768805, 0.007843138, 1, 0, 1,
-0.5278478, -0.4149387, -2.56951, 0.003921569, 1, 0, 1,
-0.5261247, 0.1467195, -1.254454, 0, 1, 0.003921569, 1,
-0.5259502, -1.112537, -0.4293991, 0, 1, 0.01176471, 1,
-0.5234729, 0.4863684, 1.631901, 0, 1, 0.01568628, 1,
-0.5152788, 0.06417245, -0.7927212, 0, 1, 0.02352941, 1,
-0.5139606, -0.7764882, -2.886129, 0, 1, 0.02745098, 1,
-0.5122789, 0.5146585, -0.3570516, 0, 1, 0.03529412, 1,
-0.5120218, -2.258777, -1.647764, 0, 1, 0.03921569, 1,
-0.5091522, -2.308374, -2.23316, 0, 1, 0.04705882, 1,
-0.5047249, 1.153476, -0.7268102, 0, 1, 0.05098039, 1,
-0.5010569, 2.703514, -0.9950146, 0, 1, 0.05882353, 1,
-0.496129, 1.121268, 0.6686236, 0, 1, 0.0627451, 1,
-0.4903513, -1.232539, -1.869614, 0, 1, 0.07058824, 1,
-0.489523, -0.1888749, -1.182423, 0, 1, 0.07450981, 1,
-0.4882774, -2.334759, -3.438685, 0, 1, 0.08235294, 1,
-0.4869379, 1.633463, 1.447134, 0, 1, 0.08627451, 1,
-0.4863558, -0.3717763, -1.746146, 0, 1, 0.09411765, 1,
-0.4825587, 0.6251432, -0.5320337, 0, 1, 0.1019608, 1,
-0.4820188, 0.293518, -0.7748277, 0, 1, 0.1058824, 1,
-0.4806318, 0.500947, -0.1525871, 0, 1, 0.1137255, 1,
-0.4782974, 0.5864688, -0.4159572, 0, 1, 0.1176471, 1,
-0.4726294, 0.6293268, -0.3649309, 0, 1, 0.1254902, 1,
-0.4712768, 0.2078772, -0.217021, 0, 1, 0.1294118, 1,
-0.4702008, 0.5788863, -2.409996, 0, 1, 0.1372549, 1,
-0.468147, -0.695525, -2.890169, 0, 1, 0.1411765, 1,
-0.4672882, 2.324203, -0.6065238, 0, 1, 0.1490196, 1,
-0.4660685, -0.2132114, -1.752987, 0, 1, 0.1529412, 1,
-0.4596044, 1.13728, -0.7799, 0, 1, 0.1607843, 1,
-0.4561652, 2.491282, 0.07493224, 0, 1, 0.1647059, 1,
-0.4538837, 0.3808811, -0.7441586, 0, 1, 0.172549, 1,
-0.4537448, 0.001636952, -2.057383, 0, 1, 0.1764706, 1,
-0.4527237, -0.02917392, -1.612245, 0, 1, 0.1843137, 1,
-0.4518189, -1.155565, -1.651883, 0, 1, 0.1882353, 1,
-0.4514198, -1.169775, -2.647851, 0, 1, 0.1960784, 1,
-0.4510447, 0.6213635, 1.027186, 0, 1, 0.2039216, 1,
-0.4507863, -0.09641942, -4.683152, 0, 1, 0.2078431, 1,
-0.4499843, -1.852973, -5.336738, 0, 1, 0.2156863, 1,
-0.4468831, 0.8737641, 0.6610659, 0, 1, 0.2196078, 1,
-0.4463238, 0.7325239, -1.378411, 0, 1, 0.227451, 1,
-0.4446691, 1.565205, 0.1312821, 0, 1, 0.2313726, 1,
-0.4402068, 0.7619764, -0.4639481, 0, 1, 0.2392157, 1,
-0.4340341, -0.5690605, -3.237918, 0, 1, 0.2431373, 1,
-0.4340317, -1.043545, -2.817614, 0, 1, 0.2509804, 1,
-0.4335871, 0.2914067, -1.57945, 0, 1, 0.254902, 1,
-0.4328999, 0.7213987, 0.05837518, 0, 1, 0.2627451, 1,
-0.4322652, 2.440683, -1.15617, 0, 1, 0.2666667, 1,
-0.4300274, 0.874945, -1.933549, 0, 1, 0.2745098, 1,
-0.4279989, -0.4253067, -3.010515, 0, 1, 0.2784314, 1,
-0.4279482, -0.2176448, -2.678753, 0, 1, 0.2862745, 1,
-0.4274473, 0.3250418, -1.570581, 0, 1, 0.2901961, 1,
-0.4164944, 1.063945, 0.1323321, 0, 1, 0.2980392, 1,
-0.4135008, -0.1776417, -2.00721, 0, 1, 0.3058824, 1,
-0.4134619, 1.245035, -0.2762909, 0, 1, 0.3098039, 1,
-0.4124396, -0.6656778, -3.572386, 0, 1, 0.3176471, 1,
-0.4094581, -0.7344194, -2.385426, 0, 1, 0.3215686, 1,
-0.4034393, -0.2475119, -2.185238, 0, 1, 0.3294118, 1,
-0.3968779, 0.7631194, -1.089419, 0, 1, 0.3333333, 1,
-0.3936818, 0.3259185, 0.02435117, 0, 1, 0.3411765, 1,
-0.3906306, 0.5514194, 0.3752564, 0, 1, 0.345098, 1,
-0.3835629, -1.741216, -4.049379, 0, 1, 0.3529412, 1,
-0.3830576, 0.9855049, -0.69098, 0, 1, 0.3568628, 1,
-0.3679394, -0.1964947, -2.035393, 0, 1, 0.3647059, 1,
-0.3497273, 1.205342, -0.6412904, 0, 1, 0.3686275, 1,
-0.3480079, -0.2328521, -2.287802, 0, 1, 0.3764706, 1,
-0.3479982, 0.9168242, -0.9423031, 0, 1, 0.3803922, 1,
-0.3457671, 0.8877579, 0.7229036, 0, 1, 0.3882353, 1,
-0.3412522, 0.360048, -1.111517, 0, 1, 0.3921569, 1,
-0.3402524, -0.6123279, -4.635724, 0, 1, 0.4, 1,
-0.338223, -0.5075512, -2.34405, 0, 1, 0.4078431, 1,
-0.3358546, 0.1289686, -0.93725, 0, 1, 0.4117647, 1,
-0.3335772, -0.3522496, -0.4453479, 0, 1, 0.4196078, 1,
-0.3322798, -0.575891, -2.298262, 0, 1, 0.4235294, 1,
-0.3302547, -1.278791, -2.917195, 0, 1, 0.4313726, 1,
-0.3298459, 0.8993785, -0.8626106, 0, 1, 0.4352941, 1,
-0.3269502, -1.15641, -3.121646, 0, 1, 0.4431373, 1,
-0.3245523, 1.493104, -1.624565, 0, 1, 0.4470588, 1,
-0.324531, -0.4856373, -2.930592, 0, 1, 0.454902, 1,
-0.3215695, 0.06432672, -1.414768, 0, 1, 0.4588235, 1,
-0.3215356, 0.4821114, -0.03696608, 0, 1, 0.4666667, 1,
-0.3211194, -0.4637179, -2.038743, 0, 1, 0.4705882, 1,
-0.3201922, -0.2776527, -0.4426019, 0, 1, 0.4784314, 1,
-0.310971, 0.1734898, -0.9946899, 0, 1, 0.4823529, 1,
-0.3054843, -1.193107, -2.624547, 0, 1, 0.4901961, 1,
-0.3043686, 1.950686, 0.1332124, 0, 1, 0.4941176, 1,
-0.3031668, -0.9003083, -1.659189, 0, 1, 0.5019608, 1,
-0.2975163, 1.467074, -1.850924, 0, 1, 0.509804, 1,
-0.294452, 0.1746739, -2.510954, 0, 1, 0.5137255, 1,
-0.2930701, 1.455427, 0.4166349, 0, 1, 0.5215687, 1,
-0.2870682, 0.3099281, -1.967465, 0, 1, 0.5254902, 1,
-0.2848915, -1.599201, -2.416488, 0, 1, 0.5333334, 1,
-0.2836939, -0.2323066, -3.274075, 0, 1, 0.5372549, 1,
-0.2793226, -0.1078413, -0.8528171, 0, 1, 0.5450981, 1,
-0.2781404, -0.1983482, -1.806636, 0, 1, 0.5490196, 1,
-0.2714369, 0.2099108, 0.4495231, 0, 1, 0.5568628, 1,
-0.2695746, -1.247058, -2.063189, 0, 1, 0.5607843, 1,
-0.2677208, -0.8117664, -3.328232, 0, 1, 0.5686275, 1,
-0.2654756, -1.076576, -3.079008, 0, 1, 0.572549, 1,
-0.2640966, 0.1549035, -1.453079, 0, 1, 0.5803922, 1,
-0.26408, 0.3097082, -1.794507, 0, 1, 0.5843138, 1,
-0.2589557, 1.536794, -0.8788147, 0, 1, 0.5921569, 1,
-0.2583604, -0.2069544, -1.360293, 0, 1, 0.5960785, 1,
-0.258272, 0.1709862, -0.568481, 0, 1, 0.6039216, 1,
-0.2468377, 0.1374172, -0.07962949, 0, 1, 0.6117647, 1,
-0.2452145, -0.6374625, -2.624441, 0, 1, 0.6156863, 1,
-0.2392271, 0.7350366, 1.516219, 0, 1, 0.6235294, 1,
-0.2378134, -1.183547, -3.536556, 0, 1, 0.627451, 1,
-0.2345244, -0.3187177, -2.704934, 0, 1, 0.6352941, 1,
-0.2298018, 0.8341773, -2.487305, 0, 1, 0.6392157, 1,
-0.2292072, 0.7405473, 0.5004869, 0, 1, 0.6470588, 1,
-0.2257694, -0.8704554, -1.878995, 0, 1, 0.6509804, 1,
-0.2242419, 0.05314015, -0.5276401, 0, 1, 0.6588235, 1,
-0.2217253, -0.2815696, -2.76245, 0, 1, 0.6627451, 1,
-0.2132775, 0.7403145, -2.041576, 0, 1, 0.6705883, 1,
-0.2079067, 0.441531, -2.087708, 0, 1, 0.6745098, 1,
-0.2078081, 0.2330868, -0.2790131, 0, 1, 0.682353, 1,
-0.2076643, -1.359118, -5.18472, 0, 1, 0.6862745, 1,
-0.2065843, -0.9100882, -3.836419, 0, 1, 0.6941177, 1,
-0.2033688, -1.513031, -1.736266, 0, 1, 0.7019608, 1,
-0.2022034, 0.1121465, 0.0802278, 0, 1, 0.7058824, 1,
-0.2010349, 1.771932, -1.102751, 0, 1, 0.7137255, 1,
-0.2004465, 0.1481335, -0.3075685, 0, 1, 0.7176471, 1,
-0.1968303, -0.9615867, -2.418882, 0, 1, 0.7254902, 1,
-0.195529, -0.2602619, -1.445142, 0, 1, 0.7294118, 1,
-0.1934472, -2.315581, -2.850303, 0, 1, 0.7372549, 1,
-0.1765783, -0.02992786, -1.38356, 0, 1, 0.7411765, 1,
-0.1713427, -1.58805, -2.922461, 0, 1, 0.7490196, 1,
-0.1688816, 0.08819696, 0.0526906, 0, 1, 0.7529412, 1,
-0.1688577, -0.9401401, -3.257668, 0, 1, 0.7607843, 1,
-0.1670974, -0.3259063, -1.29867, 0, 1, 0.7647059, 1,
-0.1639355, 0.8149973, -1.605174, 0, 1, 0.772549, 1,
-0.1593836, 0.06323833, 0.2045904, 0, 1, 0.7764706, 1,
-0.15906, 0.1677235, 0.3703178, 0, 1, 0.7843137, 1,
-0.1563107, -0.1121046, -3.363754, 0, 1, 0.7882353, 1,
-0.1561089, 1.420292, -2.913889, 0, 1, 0.7960784, 1,
-0.1373911, -0.8063389, -3.919577, 0, 1, 0.8039216, 1,
-0.1368128, -0.3991139, -1.761736, 0, 1, 0.8078431, 1,
-0.1344825, -0.8313287, -2.126948, 0, 1, 0.8156863, 1,
-0.1332472, 2.372056, 1.633852, 0, 1, 0.8196079, 1,
-0.1283291, 0.3829939, -0.5508944, 0, 1, 0.827451, 1,
-0.1262011, 1.355337, 0.9979707, 0, 1, 0.8313726, 1,
-0.1230245, -0.4527947, -2.652818, 0, 1, 0.8392157, 1,
-0.1202592, -0.244887, -1.047566, 0, 1, 0.8431373, 1,
-0.1185852, 1.56435, 0.2909693, 0, 1, 0.8509804, 1,
-0.117272, 0.7937928, -1.041126, 0, 1, 0.854902, 1,
-0.1148723, -1.134993, -2.843723, 0, 1, 0.8627451, 1,
-0.1135692, 1.583404, 0.2169338, 0, 1, 0.8666667, 1,
-0.1126967, 0.8364563, 0.2409367, 0, 1, 0.8745098, 1,
-0.1122197, -1.175588, -3.821218, 0, 1, 0.8784314, 1,
-0.1118494, -1.765758, -0.8844409, 0, 1, 0.8862745, 1,
-0.1100862, -0.7850149, -1.572289, 0, 1, 0.8901961, 1,
-0.1055878, 1.004686, 0.9605505, 0, 1, 0.8980392, 1,
-0.101941, 0.256649, -0.1937488, 0, 1, 0.9058824, 1,
-0.1016233, 1.174016, 0.1976312, 0, 1, 0.9098039, 1,
-0.0964447, -1.044128, -2.644245, 0, 1, 0.9176471, 1,
-0.09133696, -1.355052, -2.143398, 0, 1, 0.9215686, 1,
-0.09040275, -0.3184261, -1.620157, 0, 1, 0.9294118, 1,
-0.08629855, -0.9002588, -3.329548, 0, 1, 0.9333333, 1,
-0.08568579, 0.2415159, -0.1696445, 0, 1, 0.9411765, 1,
-0.08089845, -0.6012703, -3.984814, 0, 1, 0.945098, 1,
-0.0803678, 0.6257217, 0.546599, 0, 1, 0.9529412, 1,
-0.07739294, -1.261019, -3.191059, 0, 1, 0.9568627, 1,
-0.07194489, 0.03192034, -0.01781129, 0, 1, 0.9647059, 1,
-0.07135727, 0.7849392, 0.1896062, 0, 1, 0.9686275, 1,
-0.07014656, 0.5641484, 0.5949487, 0, 1, 0.9764706, 1,
-0.05893109, 0.7137287, -0.3064491, 0, 1, 0.9803922, 1,
-0.05618316, 0.6074333, -1.238169, 0, 1, 0.9882353, 1,
-0.05594123, 0.7474481, 0.3368493, 0, 1, 0.9921569, 1,
-0.05555454, 0.7076835, 0.6864077, 0, 1, 1, 1,
-0.05165116, 0.3669908, -0.8584273, 0, 0.9921569, 1, 1,
-0.04863049, -0.5240417, -5.275782, 0, 0.9882353, 1, 1,
-0.04777263, -0.5415319, -3.025914, 0, 0.9803922, 1, 1,
-0.04110888, 0.5516708, -0.3238318, 0, 0.9764706, 1, 1,
-0.04041716, -0.05270099, -1.431311, 0, 0.9686275, 1, 1,
-0.03717766, 0.4690195, -0.220903, 0, 0.9647059, 1, 1,
-0.0364124, -1.506665, -2.947199, 0, 0.9568627, 1, 1,
-0.0344863, -0.852892, -2.741003, 0, 0.9529412, 1, 1,
-0.03394702, 0.6308007, -1.183748, 0, 0.945098, 1, 1,
-0.03342691, -0.2060216, -3.534244, 0, 0.9411765, 1, 1,
-0.0322658, 1.109239, -0.9733116, 0, 0.9333333, 1, 1,
-0.02980257, 0.3984365, 1.697319, 0, 0.9294118, 1, 1,
-0.02808737, -0.3657847, -2.430763, 0, 0.9215686, 1, 1,
-0.02751151, -0.0268723, -1.898418, 0, 0.9176471, 1, 1,
-0.02048752, -0.3175679, -4.804206, 0, 0.9098039, 1, 1,
-0.01648065, 0.03906475, 1.076282, 0, 0.9058824, 1, 1,
-0.0124286, -0.6467176, -2.110711, 0, 0.8980392, 1, 1,
-0.009148781, -0.6269067, -4.243705, 0, 0.8901961, 1, 1,
-0.006334904, 1.289046, -0.7986168, 0, 0.8862745, 1, 1,
-0.004022707, -0.2953924, -2.779293, 0, 0.8784314, 1, 1,
0.001705455, 0.8845154, 0.3296401, 0, 0.8745098, 1, 1,
0.004132103, -0.2202045, 4.65614, 0, 0.8666667, 1, 1,
0.004739596, 0.6913019, -1.515705, 0, 0.8627451, 1, 1,
0.008059035, 1.256591, -2.716616, 0, 0.854902, 1, 1,
0.009092878, 0.8982385, -0.06888018, 0, 0.8509804, 1, 1,
0.009974011, 1.525548, -0.3857628, 0, 0.8431373, 1, 1,
0.01117576, 0.3036516, -0.3736905, 0, 0.8392157, 1, 1,
0.01240605, -0.8239198, 5.177029, 0, 0.8313726, 1, 1,
0.01253755, 0.7958575, 1.354507, 0, 0.827451, 1, 1,
0.01644223, 0.9013897, -0.9340437, 0, 0.8196079, 1, 1,
0.01948452, 0.971596, 0.4547814, 0, 0.8156863, 1, 1,
0.02159797, 0.9042386, 0.5891991, 0, 0.8078431, 1, 1,
0.02250206, 0.5305334, 0.2939511, 0, 0.8039216, 1, 1,
0.02600472, 2.416588, 0.7437469, 0, 0.7960784, 1, 1,
0.02632009, -1.321436, 3.031296, 0, 0.7882353, 1, 1,
0.02712785, -1.548802, 1.810486, 0, 0.7843137, 1, 1,
0.03018754, 0.7447471, 0.2305517, 0, 0.7764706, 1, 1,
0.03065492, 0.8781048, 0.984489, 0, 0.772549, 1, 1,
0.03101494, -1.10204, 3.432247, 0, 0.7647059, 1, 1,
0.03176641, -0.5599728, 3.001233, 0, 0.7607843, 1, 1,
0.03349617, 0.8430092, 0.7060096, 0, 0.7529412, 1, 1,
0.04615371, -1.78017, 2.271072, 0, 0.7490196, 1, 1,
0.05310161, 0.3265759, 1.395646, 0, 0.7411765, 1, 1,
0.05764583, 0.1529654, 0.1663229, 0, 0.7372549, 1, 1,
0.05822492, -0.1664038, 4.278769, 0, 0.7294118, 1, 1,
0.06127812, -1.245717, 1.376723, 0, 0.7254902, 1, 1,
0.06191677, -0.6685932, 3.005895, 0, 0.7176471, 1, 1,
0.06258447, 0.680766, 0.9561459, 0, 0.7137255, 1, 1,
0.06390279, -1.535204, 3.13976, 0, 0.7058824, 1, 1,
0.06479562, -0.4762067, 2.609319, 0, 0.6980392, 1, 1,
0.06550435, -0.2553523, 0.4598718, 0, 0.6941177, 1, 1,
0.06577721, 1.820886, 0.1983894, 0, 0.6862745, 1, 1,
0.06697606, -0.1203333, 3.396405, 0, 0.682353, 1, 1,
0.06738079, 1.739923, -1.139701, 0, 0.6745098, 1, 1,
0.067623, -0.03557576, 2.274819, 0, 0.6705883, 1, 1,
0.06885458, -1.187907, 2.528603, 0, 0.6627451, 1, 1,
0.07188656, -0.7435457, 2.778774, 0, 0.6588235, 1, 1,
0.07317092, 0.4402057, 0.3445058, 0, 0.6509804, 1, 1,
0.07649221, 0.3041866, -1.622912, 0, 0.6470588, 1, 1,
0.07682603, 0.1756909, 2.408669, 0, 0.6392157, 1, 1,
0.08312351, -1.48296, 3.181836, 0, 0.6352941, 1, 1,
0.08495723, 1.378949, -0.5933796, 0, 0.627451, 1, 1,
0.0904442, -0.9729279, 3.57571, 0, 0.6235294, 1, 1,
0.09264871, 1.245889, 0.2218659, 0, 0.6156863, 1, 1,
0.09629691, -0.1439103, 3.029956, 0, 0.6117647, 1, 1,
0.1013446, -0.1685979, 3.342575, 0, 0.6039216, 1, 1,
0.1016673, 0.3148572, 0.5030996, 0, 0.5960785, 1, 1,
0.1041536, 0.8219267, 0.8134468, 0, 0.5921569, 1, 1,
0.1085555, 0.6883696, -0.2040199, 0, 0.5843138, 1, 1,
0.1099001, 0.868007, -0.02336091, 0, 0.5803922, 1, 1,
0.1104119, 0.124312, 0.8490123, 0, 0.572549, 1, 1,
0.1108423, -1.223336, 0.5124338, 0, 0.5686275, 1, 1,
0.1127888, -1.226958, 3.965472, 0, 0.5607843, 1, 1,
0.1144506, 1.482118, 0.01373939, 0, 0.5568628, 1, 1,
0.1182916, 1.029156, -1.223168, 0, 0.5490196, 1, 1,
0.1195225, 1.098402, -0.3228417, 0, 0.5450981, 1, 1,
0.1250813, 0.7772105, -0.2263057, 0, 0.5372549, 1, 1,
0.1253135, -1.226361, 3.589556, 0, 0.5333334, 1, 1,
0.127474, 0.2425289, 0.6220387, 0, 0.5254902, 1, 1,
0.1280951, 1.191212, 0.09836309, 0, 0.5215687, 1, 1,
0.1282833, -0.4397467, 3.085254, 0, 0.5137255, 1, 1,
0.1336512, 1.975094, -0.2875665, 0, 0.509804, 1, 1,
0.1418763, 0.0915116, -0.5579768, 0, 0.5019608, 1, 1,
0.146481, 0.8731465, 0.8417234, 0, 0.4941176, 1, 1,
0.1470966, 0.7285375, 0.9812753, 0, 0.4901961, 1, 1,
0.1501196, -0.2796032, 2.438581, 0, 0.4823529, 1, 1,
0.1502646, -0.1742492, 1.783366, 0, 0.4784314, 1, 1,
0.1512913, 0.7090722, 0.391609, 0, 0.4705882, 1, 1,
0.1528905, 1.095124, 1.416474, 0, 0.4666667, 1, 1,
0.1543974, 0.6773872, 0.2869172, 0, 0.4588235, 1, 1,
0.1559229, -0.6390978, 3.895935, 0, 0.454902, 1, 1,
0.1641405, -2.732228, 3.929559, 0, 0.4470588, 1, 1,
0.1679482, 0.9379756, -0.3944484, 0, 0.4431373, 1, 1,
0.1714747, 1.222877, 0.8160533, 0, 0.4352941, 1, 1,
0.1739313, -0.3229819, 2.038465, 0, 0.4313726, 1, 1,
0.1800499, -0.4065949, 1.353399, 0, 0.4235294, 1, 1,
0.1822541, -0.482639, 4.103635, 0, 0.4196078, 1, 1,
0.1857433, 0.2119492, 0.01174618, 0, 0.4117647, 1, 1,
0.1918254, 0.3236058, -0.05578415, 0, 0.4078431, 1, 1,
0.192292, 1.094841, -0.06984746, 0, 0.4, 1, 1,
0.1931082, -1.168408, 2.790145, 0, 0.3921569, 1, 1,
0.1932477, -1.124992, 0.9820365, 0, 0.3882353, 1, 1,
0.1951895, 0.2803768, 0.8335408, 0, 0.3803922, 1, 1,
0.1959647, 1.509916, 1.474317, 0, 0.3764706, 1, 1,
0.2058674, -1.692636, 2.867379, 0, 0.3686275, 1, 1,
0.2072843, -1.275793, 2.551254, 0, 0.3647059, 1, 1,
0.2074222, 1.626047, 1.86945, 0, 0.3568628, 1, 1,
0.2079063, 0.0606565, 1.114239, 0, 0.3529412, 1, 1,
0.2089029, -0.2405228, 1.617659, 0, 0.345098, 1, 1,
0.2149154, 0.343364, 0.6930605, 0, 0.3411765, 1, 1,
0.2171262, -1.246889, 3.255785, 0, 0.3333333, 1, 1,
0.2228919, 0.2009031, 0.4080757, 0, 0.3294118, 1, 1,
0.2269785, 0.3688254, -0.5497681, 0, 0.3215686, 1, 1,
0.227972, 0.1943705, 1.59089, 0, 0.3176471, 1, 1,
0.2309694, -0.2109111, 0.8902919, 0, 0.3098039, 1, 1,
0.2369646, 0.6545342, 0.8629783, 0, 0.3058824, 1, 1,
0.2390602, 0.8165948, 0.6140822, 0, 0.2980392, 1, 1,
0.2431596, -0.8541782, 3.434098, 0, 0.2901961, 1, 1,
0.2443553, -0.3218805, 1.318569, 0, 0.2862745, 1, 1,
0.2494616, -1.464875, 3.661086, 0, 0.2784314, 1, 1,
0.2560433, 1.545478, 0.6481962, 0, 0.2745098, 1, 1,
0.260641, -0.1447728, 1.159022, 0, 0.2666667, 1, 1,
0.2606834, -0.4450295, 1.464979, 0, 0.2627451, 1, 1,
0.2622391, -2.056275, 2.373066, 0, 0.254902, 1, 1,
0.2647786, -0.3254598, 3.2891, 0, 0.2509804, 1, 1,
0.2662702, -0.285161, 2.299095, 0, 0.2431373, 1, 1,
0.2708315, -1.088006, 4.356974, 0, 0.2392157, 1, 1,
0.2715554, -0.4720849, 4.07809, 0, 0.2313726, 1, 1,
0.2735204, 0.918556, -0.8143259, 0, 0.227451, 1, 1,
0.2807188, 0.4973581, 1.967648, 0, 0.2196078, 1, 1,
0.2839039, -0.4949338, 2.715906, 0, 0.2156863, 1, 1,
0.285112, 0.9059926, 1.060508, 0, 0.2078431, 1, 1,
0.2851377, -0.0254529, 2.384379, 0, 0.2039216, 1, 1,
0.2867889, 0.6459458, 0.6341949, 0, 0.1960784, 1, 1,
0.2900889, 0.8705879, 0.6181746, 0, 0.1882353, 1, 1,
0.2919601, -0.4875703, 2.047448, 0, 0.1843137, 1, 1,
0.2970602, -0.03282298, 3.056512, 0, 0.1764706, 1, 1,
0.2990566, 2.472985, -0.7082927, 0, 0.172549, 1, 1,
0.3008464, 0.3371481, 0.6409675, 0, 0.1647059, 1, 1,
0.3029237, 1.417085, 2.470387, 0, 0.1607843, 1, 1,
0.31051, -0.8929713, 1.98229, 0, 0.1529412, 1, 1,
0.3231409, 0.7570519, 1.17605, 0, 0.1490196, 1, 1,
0.3233125, 1.513595, -0.01465582, 0, 0.1411765, 1, 1,
0.3246517, -0.9032761, 4.206583, 0, 0.1372549, 1, 1,
0.3252337, -0.2305684, 0.8217826, 0, 0.1294118, 1, 1,
0.3285733, 0.7732509, 0.5300937, 0, 0.1254902, 1, 1,
0.3298064, -0.02247007, 1.842564, 0, 0.1176471, 1, 1,
0.3319067, 0.07901553, 2.451959, 0, 0.1137255, 1, 1,
0.3324077, 0.673427, 0.8264346, 0, 0.1058824, 1, 1,
0.3333539, 0.5124628, 0.6555691, 0, 0.09803922, 1, 1,
0.3362252, 0.1315575, 1.678977, 0, 0.09411765, 1, 1,
0.3380421, 0.6288506, -0.4608577, 0, 0.08627451, 1, 1,
0.3397335, -1.843459, 2.73892, 0, 0.08235294, 1, 1,
0.3438175, -0.9426404, 2.531687, 0, 0.07450981, 1, 1,
0.3480004, 1.880746, -1.004658, 0, 0.07058824, 1, 1,
0.3532831, 1.975301, -0.5094374, 0, 0.0627451, 1, 1,
0.3550061, -1.541946, 2.405068, 0, 0.05882353, 1, 1,
0.3558183, -0.6346719, 0.9424821, 0, 0.05098039, 1, 1,
0.3626688, 1.24843, -0.6620736, 0, 0.04705882, 1, 1,
0.3630484, 0.6207512, 0.9681825, 0, 0.03921569, 1, 1,
0.3680224, -1.414721, 2.746801, 0, 0.03529412, 1, 1,
0.3696175, 2.68804, -0.6320493, 0, 0.02745098, 1, 1,
0.3706501, 2.014311, -0.1950822, 0, 0.02352941, 1, 1,
0.3709013, 0.05269242, 1.563345, 0, 0.01568628, 1, 1,
0.3728556, -1.66625, 4.006573, 0, 0.01176471, 1, 1,
0.3799004, -1.258936, 3.189948, 0, 0.003921569, 1, 1,
0.3917272, -1.777599, 4.682388, 0.003921569, 0, 1, 1,
0.396867, -0.03111357, 1.306833, 0.007843138, 0, 1, 1,
0.4059135, 0.3888009, -0.6592135, 0.01568628, 0, 1, 1,
0.4067666, 0.01280866, 3.529295, 0.01960784, 0, 1, 1,
0.4141889, -0.206862, 0.9454652, 0.02745098, 0, 1, 1,
0.4218875, -0.5604917, 3.754433, 0.03137255, 0, 1, 1,
0.4258152, -1.095274, 3.907534, 0.03921569, 0, 1, 1,
0.4271188, 0.5568298, 1.877845, 0.04313726, 0, 1, 1,
0.4312987, 1.497798, 0.9069343, 0.05098039, 0, 1, 1,
0.4337296, 0.4412607, 1.070858, 0.05490196, 0, 1, 1,
0.4445271, 0.4201423, 2.298557, 0.0627451, 0, 1, 1,
0.4460929, -0.4977959, 0.6179211, 0.06666667, 0, 1, 1,
0.4471326, 0.009718565, 1.35857, 0.07450981, 0, 1, 1,
0.4481368, 0.8717059, 1.663231, 0.07843138, 0, 1, 1,
0.4486592, 0.0473451, 2.291733, 0.08627451, 0, 1, 1,
0.454077, 0.5434827, 1.288468, 0.09019608, 0, 1, 1,
0.4611828, 1.149846, -0.8057671, 0.09803922, 0, 1, 1,
0.4697129, 0.1512856, 0.9399835, 0.1058824, 0, 1, 1,
0.4736246, 1.300824, 0.8584213, 0.1098039, 0, 1, 1,
0.4787475, 1.196468, 0.04665092, 0.1176471, 0, 1, 1,
0.4788423, -0.5638798, 2.713966, 0.1215686, 0, 1, 1,
0.4817659, -2.780087, 3.973372, 0.1294118, 0, 1, 1,
0.4825291, 1.509184, -0.9003531, 0.1333333, 0, 1, 1,
0.4828784, 2.313566, 0.1726846, 0.1411765, 0, 1, 1,
0.4842101, -0.1680043, 1.871476, 0.145098, 0, 1, 1,
0.4855237, -1.124003, 4.713201, 0.1529412, 0, 1, 1,
0.4863792, 2.287328, -0.6425379, 0.1568628, 0, 1, 1,
0.4865037, 1.017866, -0.5032977, 0.1647059, 0, 1, 1,
0.4867153, -0.1360197, 3.136377, 0.1686275, 0, 1, 1,
0.4868351, 1.321851, 0.9375293, 0.1764706, 0, 1, 1,
0.4890109, 0.7949127, 1.160571, 0.1803922, 0, 1, 1,
0.4917775, 0.2130975, 1.657478, 0.1882353, 0, 1, 1,
0.4986367, 0.1405243, 0.750147, 0.1921569, 0, 1, 1,
0.4993369, -0.6421591, 3.505803, 0.2, 0, 1, 1,
0.5053562, 1.595667, 1.287531, 0.2078431, 0, 1, 1,
0.5065148, 1.119168, 2.929432, 0.2117647, 0, 1, 1,
0.5096423, -0.8581533, 4.064373, 0.2196078, 0, 1, 1,
0.5140738, 0.3766778, 1.467821, 0.2235294, 0, 1, 1,
0.5161588, 0.7827749, -0.5261247, 0.2313726, 0, 1, 1,
0.5186185, 1.313381, 1.01465, 0.2352941, 0, 1, 1,
0.5235655, -0.3242356, 2.227095, 0.2431373, 0, 1, 1,
0.5248356, 0.01961143, 3.240697, 0.2470588, 0, 1, 1,
0.5287318, -0.8226432, 2.630507, 0.254902, 0, 1, 1,
0.530767, -0.1836611, 0.779613, 0.2588235, 0, 1, 1,
0.5328799, 0.3400881, 0.4000993, 0.2666667, 0, 1, 1,
0.5371178, 1.224452, -1.23727, 0.2705882, 0, 1, 1,
0.5486689, 0.2762943, 1.3803, 0.2784314, 0, 1, 1,
0.5492371, 2.008501, 0.7339931, 0.282353, 0, 1, 1,
0.5506437, -1.036003, 2.406212, 0.2901961, 0, 1, 1,
0.5515205, -0.8443292, 1.800021, 0.2941177, 0, 1, 1,
0.557963, 0.4959606, 1.476856, 0.3019608, 0, 1, 1,
0.5588424, 0.3325136, 1.787125, 0.3098039, 0, 1, 1,
0.5588796, 0.99554, 0.2014204, 0.3137255, 0, 1, 1,
0.5596333, 0.2924811, 1.264187, 0.3215686, 0, 1, 1,
0.5609862, -0.5367435, 2.044798, 0.3254902, 0, 1, 1,
0.5619164, -1.438941, 1.850758, 0.3333333, 0, 1, 1,
0.564837, 0.2841332, 0.9428754, 0.3372549, 0, 1, 1,
0.5666749, -1.478602, 3.861426, 0.345098, 0, 1, 1,
0.5711333, -0.9326277, 0.4161124, 0.3490196, 0, 1, 1,
0.5744087, -0.8953362, 0.7169184, 0.3568628, 0, 1, 1,
0.5790096, 1.424216, 1.257335, 0.3607843, 0, 1, 1,
0.5889097, -0.7735701, 4.119606, 0.3686275, 0, 1, 1,
0.5938221, 0.7696271, 0.4004871, 0.372549, 0, 1, 1,
0.5956964, -0.01120884, 0.7769828, 0.3803922, 0, 1, 1,
0.5977285, -0.08947744, 1.379546, 0.3843137, 0, 1, 1,
0.5985402, -0.3423737, 0.8970654, 0.3921569, 0, 1, 1,
0.5998065, 1.072448, 1.149209, 0.3960784, 0, 1, 1,
0.6010591, -0.805979, 1.026909, 0.4039216, 0, 1, 1,
0.604265, 1.334662, -1.523052, 0.4117647, 0, 1, 1,
0.6042666, -0.7189931, 2.566126, 0.4156863, 0, 1, 1,
0.6043909, 0.1126292, 0.3287723, 0.4235294, 0, 1, 1,
0.6073576, -0.536245, 4.614439, 0.427451, 0, 1, 1,
0.6099315, 1.767423, 0.2902031, 0.4352941, 0, 1, 1,
0.6119296, -1.198542, 2.834239, 0.4392157, 0, 1, 1,
0.6128398, 0.392576, 1.209198, 0.4470588, 0, 1, 1,
0.6151958, 1.568072, 0.1611015, 0.4509804, 0, 1, 1,
0.6205202, 1.506314, 2.938102, 0.4588235, 0, 1, 1,
0.6217289, -1.343377, 2.410218, 0.4627451, 0, 1, 1,
0.6230397, -0.4434585, 1.916175, 0.4705882, 0, 1, 1,
0.6234426, -0.5099272, 3.490492, 0.4745098, 0, 1, 1,
0.6241706, -1.831245, 3.312367, 0.4823529, 0, 1, 1,
0.6259786, -0.1313482, 0.5242825, 0.4862745, 0, 1, 1,
0.6310654, 1.024359, -0.5459476, 0.4941176, 0, 1, 1,
0.6343213, 0.04506684, 3.22543, 0.5019608, 0, 1, 1,
0.6414467, -1.166721, 3.735052, 0.5058824, 0, 1, 1,
0.6449451, 0.6683786, 1.451256, 0.5137255, 0, 1, 1,
0.6490991, 0.8847747, 0.5186524, 0.5176471, 0, 1, 1,
0.6498501, 1.154538, 0.1068461, 0.5254902, 0, 1, 1,
0.6507038, -1.092142, 1.934129, 0.5294118, 0, 1, 1,
0.6515239, -0.6050447, 2.843572, 0.5372549, 0, 1, 1,
0.6548332, -0.09361801, 1.76373, 0.5411765, 0, 1, 1,
0.660542, 0.9877564, 1.027007, 0.5490196, 0, 1, 1,
0.6613659, 0.268664, -0.2144577, 0.5529412, 0, 1, 1,
0.661914, 1.775464, 0.8766082, 0.5607843, 0, 1, 1,
0.6674163, -0.006971288, 2.789557, 0.5647059, 0, 1, 1,
0.6734755, -0.09504923, 0.2335251, 0.572549, 0, 1, 1,
0.6754906, -0.7141886, 2.148596, 0.5764706, 0, 1, 1,
0.6763865, -1.086609, 3.124107, 0.5843138, 0, 1, 1,
0.6795293, 0.1989378, 0.319461, 0.5882353, 0, 1, 1,
0.6807479, 1.626548, -0.6395066, 0.5960785, 0, 1, 1,
0.6845956, -1.17793, 1.770248, 0.6039216, 0, 1, 1,
0.68822, -0.6990079, 3.246942, 0.6078432, 0, 1, 1,
0.688832, -0.3354275, 2.626645, 0.6156863, 0, 1, 1,
0.6961929, -1.442662, 1.046447, 0.6196079, 0, 1, 1,
0.6976928, -0.8218711, 3.690978, 0.627451, 0, 1, 1,
0.6981557, 0.836735, 0.3213496, 0.6313726, 0, 1, 1,
0.7029318, 0.1170359, 1.814565, 0.6392157, 0, 1, 1,
0.7092444, 1.464306, -0.1577623, 0.6431373, 0, 1, 1,
0.7207005, -1.06885, 3.064278, 0.6509804, 0, 1, 1,
0.7256386, 0.1978078, 1.023424, 0.654902, 0, 1, 1,
0.7281865, -0.3961864, 2.072523, 0.6627451, 0, 1, 1,
0.7295784, -0.5351829, -0.5165397, 0.6666667, 0, 1, 1,
0.7311785, -0.9825808, 3.731016, 0.6745098, 0, 1, 1,
0.7329695, -1.587351, 2.92047, 0.6784314, 0, 1, 1,
0.7369583, 0.417624, -0.3264128, 0.6862745, 0, 1, 1,
0.7373752, -1.579475, 3.936885, 0.6901961, 0, 1, 1,
0.7437171, -0.0470121, 1.48812, 0.6980392, 0, 1, 1,
0.7441681, -0.8358607, 2.959922, 0.7058824, 0, 1, 1,
0.7518183, 0.8849035, 0.6734728, 0.7098039, 0, 1, 1,
0.7551075, 0.2184171, 1.809825, 0.7176471, 0, 1, 1,
0.7560738, 0.005831704, 2.309296, 0.7215686, 0, 1, 1,
0.7602446, 0.4033307, 0.2221456, 0.7294118, 0, 1, 1,
0.7720489, 2.246247, 0.02651907, 0.7333333, 0, 1, 1,
0.774142, -1.197417, 2.159757, 0.7411765, 0, 1, 1,
0.7778311, 0.2343405, 0.934252, 0.7450981, 0, 1, 1,
0.7781331, -0.9916347, 2.348087, 0.7529412, 0, 1, 1,
0.7820441, 1.309911, 1.250912, 0.7568628, 0, 1, 1,
0.7824776, 1.288683, 1.076278, 0.7647059, 0, 1, 1,
0.7851928, 2.136865, 0.2532222, 0.7686275, 0, 1, 1,
0.7859437, 1.277153, -0.1352386, 0.7764706, 0, 1, 1,
0.7869986, -1.798391, 3.049914, 0.7803922, 0, 1, 1,
0.8032986, 1.15546, -0.002902135, 0.7882353, 0, 1, 1,
0.8074592, 0.9139925, -0.3084623, 0.7921569, 0, 1, 1,
0.8104482, 0.9554859, 2.298124, 0.8, 0, 1, 1,
0.8140715, -0.6396951, 2.88746, 0.8078431, 0, 1, 1,
0.8188241, 0.2058631, -0.6105479, 0.8117647, 0, 1, 1,
0.8254248, 0.7683944, 0.4028719, 0.8196079, 0, 1, 1,
0.8264473, 0.3558598, 1.822497, 0.8235294, 0, 1, 1,
0.8269978, -0.7194286, -0.07777379, 0.8313726, 0, 1, 1,
0.8298869, -0.7184229, 0.8184124, 0.8352941, 0, 1, 1,
0.8320518, 0.02927444, 1.060263, 0.8431373, 0, 1, 1,
0.8325833, 0.1408156, 1.537355, 0.8470588, 0, 1, 1,
0.8327439, -0.3868961, 2.365756, 0.854902, 0, 1, 1,
0.8342925, -0.1916782, 0.5884437, 0.8588235, 0, 1, 1,
0.8379184, 0.1257948, 3.024939, 0.8666667, 0, 1, 1,
0.8434874, -0.7558179, 1.402486, 0.8705882, 0, 1, 1,
0.8441995, -0.0644334, 2.692552, 0.8784314, 0, 1, 1,
0.8444239, -0.3175807, 2.941288, 0.8823529, 0, 1, 1,
0.8538369, -0.5611067, 2.030437, 0.8901961, 0, 1, 1,
0.8554339, -0.6236964, 1.955544, 0.8941177, 0, 1, 1,
0.8567597, -1.255288, 2.999272, 0.9019608, 0, 1, 1,
0.861457, -0.6798673, 1.391273, 0.9098039, 0, 1, 1,
0.8653908, -0.2632742, 1.072593, 0.9137255, 0, 1, 1,
0.8654839, 0.5746574, -0.1010001, 0.9215686, 0, 1, 1,
0.8684111, -0.1823344, -0.3155748, 0.9254902, 0, 1, 1,
0.8685813, 1.39762, 0.7034442, 0.9333333, 0, 1, 1,
0.8712931, -0.4182555, 0.7683007, 0.9372549, 0, 1, 1,
0.8744943, 0.6619678, 0.3234726, 0.945098, 0, 1, 1,
0.8777057, -1.013725, 1.746816, 0.9490196, 0, 1, 1,
0.8844998, 0.7417915, 1.190639, 0.9568627, 0, 1, 1,
0.887548, -0.8390529, 2.630932, 0.9607843, 0, 1, 1,
0.8905852, 1.29167, 1.236132, 0.9686275, 0, 1, 1,
0.8957829, 0.633759, 1.316296, 0.972549, 0, 1, 1,
0.8963035, 0.5949767, 0.01577196, 0.9803922, 0, 1, 1,
0.9060605, 0.9891943, 2.007295, 0.9843137, 0, 1, 1,
0.9063233, -1.051796, 4.161371, 0.9921569, 0, 1, 1,
0.9073825, -1.386777, 0.9123327, 0.9960784, 0, 1, 1,
0.9163128, -0.5404676, 4.197518, 1, 0, 0.9960784, 1,
0.9298466, 0.1517254, 1.121755, 1, 0, 0.9882353, 1,
0.9310659, 1.03056, 1.035919, 1, 0, 0.9843137, 1,
0.9402878, -1.122848, 2.109821, 1, 0, 0.9764706, 1,
0.9519077, -0.634503, 2.270656, 1, 0, 0.972549, 1,
0.9601016, 0.3718187, 1.203005, 1, 0, 0.9647059, 1,
0.9623543, -1.038877, 1.960213, 1, 0, 0.9607843, 1,
0.9696772, -1.052279, 2.147466, 1, 0, 0.9529412, 1,
0.9754845, 0.2939757, 1.127253, 1, 0, 0.9490196, 1,
0.9801845, -0.05719431, 1.753114, 1, 0, 0.9411765, 1,
0.9839681, -0.5465111, 4.279838, 1, 0, 0.9372549, 1,
0.991666, 0.7168033, 1.817016, 1, 0, 0.9294118, 1,
0.9997547, -0.5832508, 1.688427, 1, 0, 0.9254902, 1,
1.000087, 0.4174125, 1.999892, 1, 0, 0.9176471, 1,
1.004081, -1.492603, 2.224778, 1, 0, 0.9137255, 1,
1.006287, 0.9501214, 0.8876145, 1, 0, 0.9058824, 1,
1.011148, -0.4162817, 3.064115, 1, 0, 0.9019608, 1,
1.012252, 0.3130959, 1.200094, 1, 0, 0.8941177, 1,
1.021043, 0.1984299, -0.6112185, 1, 0, 0.8862745, 1,
1.024023, 0.01540841, 2.311882, 1, 0, 0.8823529, 1,
1.02456, -0.02339001, 2.347241, 1, 0, 0.8745098, 1,
1.025469, -0.3998494, 1.202856, 1, 0, 0.8705882, 1,
1.02797, -0.4560825, 1.871888, 1, 0, 0.8627451, 1,
1.036067, -0.4270476, 1.490798, 1, 0, 0.8588235, 1,
1.044098, -1.263825, 2.754038, 1, 0, 0.8509804, 1,
1.044229, 1.793674, 1.14752, 1, 0, 0.8470588, 1,
1.046766, 0.2442609, 1.311634, 1, 0, 0.8392157, 1,
1.050822, -2.844462, 3.536756, 1, 0, 0.8352941, 1,
1.052193, -0.3241626, 0.6869982, 1, 0, 0.827451, 1,
1.054498, 0.2522975, 1.848348, 1, 0, 0.8235294, 1,
1.057674, 0.8231403, 1.718557, 1, 0, 0.8156863, 1,
1.071085, 0.1278137, 2.519694, 1, 0, 0.8117647, 1,
1.077875, 1.299847, -0.9676552, 1, 0, 0.8039216, 1,
1.07858, -2.086018, 3.355203, 1, 0, 0.7960784, 1,
1.085017, 0.4843029, 3.339291, 1, 0, 0.7921569, 1,
1.095467, 0.2813258, 1.045049, 1, 0, 0.7843137, 1,
1.109086, -0.1133967, 1.285092, 1, 0, 0.7803922, 1,
1.111387, 0.4371443, 0.5775713, 1, 0, 0.772549, 1,
1.111886, 0.7476195, 1.685586, 1, 0, 0.7686275, 1,
1.130229, 0.08441402, 1.724226, 1, 0, 0.7607843, 1,
1.13104, -2.806103, 1.308992, 1, 0, 0.7568628, 1,
1.140754, 0.25456, 0.1713979, 1, 0, 0.7490196, 1,
1.142632, -0.2272898, 2.149306, 1, 0, 0.7450981, 1,
1.144421, 0.3349262, -0.2688435, 1, 0, 0.7372549, 1,
1.151417, 0.1201215, 1.575965, 1, 0, 0.7333333, 1,
1.159949, 1.505276, 1.738074, 1, 0, 0.7254902, 1,
1.160131, 0.4063212, 1.638485, 1, 0, 0.7215686, 1,
1.163993, 0.8605505, 0.8405431, 1, 0, 0.7137255, 1,
1.171049, 0.4401897, 0.5304866, 1, 0, 0.7098039, 1,
1.172353, -0.1217503, 2.242522, 1, 0, 0.7019608, 1,
1.1776, 0.5127044, 0.8419862, 1, 0, 0.6941177, 1,
1.177993, -2.537494, 0.888069, 1, 0, 0.6901961, 1,
1.186453, 1.095897, -0.02511062, 1, 0, 0.682353, 1,
1.189134, -0.1924415, 3.312549, 1, 0, 0.6784314, 1,
1.19654, 2.054766, 0.1642956, 1, 0, 0.6705883, 1,
1.197289, -0.9676081, 2.41153, 1, 0, 0.6666667, 1,
1.202176, -0.004719131, 1.45154, 1, 0, 0.6588235, 1,
1.202991, 0.9682602, -0.1073506, 1, 0, 0.654902, 1,
1.206726, -1.961151, 2.597717, 1, 0, 0.6470588, 1,
1.21495, 1.225904, 0.6994166, 1, 0, 0.6431373, 1,
1.218156, -0.5838832, 0.9153137, 1, 0, 0.6352941, 1,
1.218742, -1.21825, 2.212886, 1, 0, 0.6313726, 1,
1.222585, -0.2941336, 3.20995, 1, 0, 0.6235294, 1,
1.227397, -1.012439, 2.7136, 1, 0, 0.6196079, 1,
1.227603, 0.2322312, 0.3421219, 1, 0, 0.6117647, 1,
1.233229, 0.3569063, 2.145469, 1, 0, 0.6078432, 1,
1.239214, 0.4135516, 1.436189, 1, 0, 0.6, 1,
1.247722, -0.1382866, 0.1708397, 1, 0, 0.5921569, 1,
1.248169, -1.72267, 3.22295, 1, 0, 0.5882353, 1,
1.254845, -0.3237261, 0.6181065, 1, 0, 0.5803922, 1,
1.259531, -0.5025792, 0.7859907, 1, 0, 0.5764706, 1,
1.260925, -0.2533298, 4.238685, 1, 0, 0.5686275, 1,
1.275514, 0.395575, 1.256122, 1, 0, 0.5647059, 1,
1.294495, 0.2421806, -0.1277114, 1, 0, 0.5568628, 1,
1.300423, 0.3155881, 0.004494745, 1, 0, 0.5529412, 1,
1.309216, 0.7296546, 0.04994456, 1, 0, 0.5450981, 1,
1.32628, -0.9562349, 1.836752, 1, 0, 0.5411765, 1,
1.330591, -0.4636718, 2.291352, 1, 0, 0.5333334, 1,
1.341711, -0.8181797, 2.408252, 1, 0, 0.5294118, 1,
1.342958, 0.4911737, -1.171454, 1, 0, 0.5215687, 1,
1.344581, -3.09851, 2.726338, 1, 0, 0.5176471, 1,
1.352899, 0.1757593, 0.7492704, 1, 0, 0.509804, 1,
1.358573, -1.353946, 1.303304, 1, 0, 0.5058824, 1,
1.361644, -1.390851, 2.940532, 1, 0, 0.4980392, 1,
1.362241, -0.1589612, 2.263844, 1, 0, 0.4901961, 1,
1.366742, 1.073403, 0.03181857, 1, 0, 0.4862745, 1,
1.3714, 0.5779121, -0.03009427, 1, 0, 0.4784314, 1,
1.381817, 0.07568685, 1.60731, 1, 0, 0.4745098, 1,
1.383108, 0.6759859, 1.896317, 1, 0, 0.4666667, 1,
1.38418, 0.8591748, 1.973938, 1, 0, 0.4627451, 1,
1.38554, 0.9054071, -0.514425, 1, 0, 0.454902, 1,
1.391345, 1.484298, -0.2330639, 1, 0, 0.4509804, 1,
1.395425, 1.268792, 1.388436, 1, 0, 0.4431373, 1,
1.397298, -0.6636369, 3.787708, 1, 0, 0.4392157, 1,
1.402595, -0.1510229, 0.5017748, 1, 0, 0.4313726, 1,
1.407712, -1.838174, 3.816725, 1, 0, 0.427451, 1,
1.411874, 0.9787897, 2.506214, 1, 0, 0.4196078, 1,
1.440438, -0.1931172, 2.687682, 1, 0, 0.4156863, 1,
1.447409, -0.1971266, 2.690934, 1, 0, 0.4078431, 1,
1.47398, 0.3801099, 1.533209, 1, 0, 0.4039216, 1,
1.475384, -0.02505039, 2.801768, 1, 0, 0.3960784, 1,
1.486426, -0.9051641, 0.4659033, 1, 0, 0.3882353, 1,
1.497625, -0.4324766, 2.230921, 1, 0, 0.3843137, 1,
1.500767, 0.04297027, 0.8610038, 1, 0, 0.3764706, 1,
1.507291, -0.4245964, 1.565685, 1, 0, 0.372549, 1,
1.515183, 0.2220037, 1.933567, 1, 0, 0.3647059, 1,
1.530815, -0.6221282, 1.778581, 1, 0, 0.3607843, 1,
1.53817, 2.025644, 1.646285, 1, 0, 0.3529412, 1,
1.538904, -0.7294179, 2.026777, 1, 0, 0.3490196, 1,
1.544475, -0.436781, 1.251237, 1, 0, 0.3411765, 1,
1.556461, 1.399388, 2.452199, 1, 0, 0.3372549, 1,
1.578277, -0.8971049, 1.844761, 1, 0, 0.3294118, 1,
1.578985, -0.6078932, 2.507571, 1, 0, 0.3254902, 1,
1.607203, 0.667026, 1.637511, 1, 0, 0.3176471, 1,
1.619593, -2.463004, 3.079254, 1, 0, 0.3137255, 1,
1.629736, -1.780046, 3.115942, 1, 0, 0.3058824, 1,
1.646125, 0.5002564, -0.1709466, 1, 0, 0.2980392, 1,
1.646145, 1.376595, -1.738265, 1, 0, 0.2941177, 1,
1.651655, 1.321497, -0.7752918, 1, 0, 0.2862745, 1,
1.686928, 1.147729, 0.931601, 1, 0, 0.282353, 1,
1.702935, -0.3844831, 0.4051919, 1, 0, 0.2745098, 1,
1.708118, -0.6203623, 1.254005, 1, 0, 0.2705882, 1,
1.708981, -0.8904722, 1.310639, 1, 0, 0.2627451, 1,
1.727721, -0.589025, 1.37531, 1, 0, 0.2588235, 1,
1.765414, -0.9208779, 3.172235, 1, 0, 0.2509804, 1,
1.76661, -0.2883028, 0.2159931, 1, 0, 0.2470588, 1,
1.766751, -0.2113935, 1.339342, 1, 0, 0.2392157, 1,
1.769456, -1.041923, 2.347826, 1, 0, 0.2352941, 1,
1.771424, 0.00199067, 3.939921, 1, 0, 0.227451, 1,
1.778544, -0.06359808, 1.565432, 1, 0, 0.2235294, 1,
1.789918, 0.07256254, 0.4203699, 1, 0, 0.2156863, 1,
1.809061, 1.022411, 0.7868476, 1, 0, 0.2117647, 1,
1.809205, -1.085729, 1.734716, 1, 0, 0.2039216, 1,
1.80982, -1.879909, 2.827701, 1, 0, 0.1960784, 1,
1.812891, -1.268949, 2.759943, 1, 0, 0.1921569, 1,
1.816885, 0.3439559, 1.146932, 1, 0, 0.1843137, 1,
1.822874, 0.05771809, 0.9329169, 1, 0, 0.1803922, 1,
1.846268, 0.576007, 2.584976, 1, 0, 0.172549, 1,
1.857156, 0.5281099, 0.7358924, 1, 0, 0.1686275, 1,
1.857328, -1.453737, 1.968522, 1, 0, 0.1607843, 1,
1.865561, -0.6097553, 2.381752, 1, 0, 0.1568628, 1,
1.907684, 0.5876675, 1.794573, 1, 0, 0.1490196, 1,
1.938147, -1.962979, 1.80538, 1, 0, 0.145098, 1,
1.946854, -0.3240629, 0.5623644, 1, 0, 0.1372549, 1,
1.968145, -0.8641427, 2.084015, 1, 0, 0.1333333, 1,
1.996716, -0.7486362, 2.255679, 1, 0, 0.1254902, 1,
2.036819, -0.2777409, 0.3751605, 1, 0, 0.1215686, 1,
2.045175, 0.4218064, 1.8595, 1, 0, 0.1137255, 1,
2.156928, -1.082449, 2.352204, 1, 0, 0.1098039, 1,
2.215347, -0.879746, 1.298581, 1, 0, 0.1019608, 1,
2.231297, 0.6153036, 2.641325, 1, 0, 0.09411765, 1,
2.234574, -1.381127, 2.363135, 1, 0, 0.09019608, 1,
2.247585, -0.1146911, 1.534632, 1, 0, 0.08235294, 1,
2.269331, 0.1977315, 0.8888049, 1, 0, 0.07843138, 1,
2.303933, 0.01453392, 0.939806, 1, 0, 0.07058824, 1,
2.336332, -0.8129621, 1.879157, 1, 0, 0.06666667, 1,
2.341793, 0.6262392, 1.495742, 1, 0, 0.05882353, 1,
2.370294, -1.246235, 3.865626, 1, 0, 0.05490196, 1,
2.413053, -0.6124071, 1.899871, 1, 0, 0.04705882, 1,
2.453701, -0.1417712, 1.443839, 1, 0, 0.04313726, 1,
2.465977, 0.2162774, 1.755627, 1, 0, 0.03529412, 1,
2.481618, -0.6665481, 2.925024, 1, 0, 0.03137255, 1,
2.534928, 0.6681053, -0.5259791, 1, 0, 0.02352941, 1,
2.579723, -0.9521603, 1.962494, 1, 0, 0.01960784, 1,
2.692198, -1.683529, 2.953233, 1, 0, 0.01176471, 1,
3.026423, -1.818009, 3.213672, 1, 0, 0.007843138, 1
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
-0.1536989, -4.081953, -7.214963, 0, -0.5, 0.5, 0.5,
-0.1536989, -4.081953, -7.214963, 1, -0.5, 0.5, 0.5,
-0.1536989, -4.081953, -7.214963, 1, 1.5, 0.5, 0.5,
-0.1536989, -4.081953, -7.214963, 0, 1.5, 0.5, 0.5
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
-4.411882, -0.197498, -7.214963, 0, -0.5, 0.5, 0.5,
-4.411882, -0.197498, -7.214963, 1, -0.5, 0.5, 0.5,
-4.411882, -0.197498, -7.214963, 1, 1.5, 0.5, 0.5,
-4.411882, -0.197498, -7.214963, 0, 1.5, 0.5, 0.5
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
-4.411882, -4.081953, -0.1209586, 0, -0.5, 0.5, 0.5,
-4.411882, -4.081953, -0.1209586, 1, -0.5, 0.5, 0.5,
-4.411882, -4.081953, -0.1209586, 1, 1.5, 0.5, 0.5,
-4.411882, -4.081953, -0.1209586, 0, 1.5, 0.5, 0.5
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
-3, -3.18554, -5.577886,
3, -3.18554, -5.577886,
-3, -3.18554, -5.577886,
-3, -3.334942, -5.850732,
-2, -3.18554, -5.577886,
-2, -3.334942, -5.850732,
-1, -3.18554, -5.577886,
-1, -3.334942, -5.850732,
0, -3.18554, -5.577886,
0, -3.334942, -5.850732,
1, -3.18554, -5.577886,
1, -3.334942, -5.850732,
2, -3.18554, -5.577886,
2, -3.334942, -5.850732,
3, -3.18554, -5.577886,
3, -3.334942, -5.850732
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
-3, -3.633746, -6.396424, 0, -0.5, 0.5, 0.5,
-3, -3.633746, -6.396424, 1, -0.5, 0.5, 0.5,
-3, -3.633746, -6.396424, 1, 1.5, 0.5, 0.5,
-3, -3.633746, -6.396424, 0, 1.5, 0.5, 0.5,
-2, -3.633746, -6.396424, 0, -0.5, 0.5, 0.5,
-2, -3.633746, -6.396424, 1, -0.5, 0.5, 0.5,
-2, -3.633746, -6.396424, 1, 1.5, 0.5, 0.5,
-2, -3.633746, -6.396424, 0, 1.5, 0.5, 0.5,
-1, -3.633746, -6.396424, 0, -0.5, 0.5, 0.5,
-1, -3.633746, -6.396424, 1, -0.5, 0.5, 0.5,
-1, -3.633746, -6.396424, 1, 1.5, 0.5, 0.5,
-1, -3.633746, -6.396424, 0, 1.5, 0.5, 0.5,
0, -3.633746, -6.396424, 0, -0.5, 0.5, 0.5,
0, -3.633746, -6.396424, 1, -0.5, 0.5, 0.5,
0, -3.633746, -6.396424, 1, 1.5, 0.5, 0.5,
0, -3.633746, -6.396424, 0, 1.5, 0.5, 0.5,
1, -3.633746, -6.396424, 0, -0.5, 0.5, 0.5,
1, -3.633746, -6.396424, 1, -0.5, 0.5, 0.5,
1, -3.633746, -6.396424, 1, 1.5, 0.5, 0.5,
1, -3.633746, -6.396424, 0, 1.5, 0.5, 0.5,
2, -3.633746, -6.396424, 0, -0.5, 0.5, 0.5,
2, -3.633746, -6.396424, 1, -0.5, 0.5, 0.5,
2, -3.633746, -6.396424, 1, 1.5, 0.5, 0.5,
2, -3.633746, -6.396424, 0, 1.5, 0.5, 0.5,
3, -3.633746, -6.396424, 0, -0.5, 0.5, 0.5,
3, -3.633746, -6.396424, 1, -0.5, 0.5, 0.5,
3, -3.633746, -6.396424, 1, 1.5, 0.5, 0.5,
3, -3.633746, -6.396424, 0, 1.5, 0.5, 0.5
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
-3.429225, -3, -5.577886,
-3.429225, 2, -5.577886,
-3.429225, -3, -5.577886,
-3.593001, -3, -5.850732,
-3.429225, -2, -5.577886,
-3.593001, -2, -5.850732,
-3.429225, -1, -5.577886,
-3.593001, -1, -5.850732,
-3.429225, 0, -5.577886,
-3.593001, 0, -5.850732,
-3.429225, 1, -5.577886,
-3.593001, 1, -5.850732,
-3.429225, 2, -5.577886,
-3.593001, 2, -5.850732
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
-3.920554, -3, -6.396424, 0, -0.5, 0.5, 0.5,
-3.920554, -3, -6.396424, 1, -0.5, 0.5, 0.5,
-3.920554, -3, -6.396424, 1, 1.5, 0.5, 0.5,
-3.920554, -3, -6.396424, 0, 1.5, 0.5, 0.5,
-3.920554, -2, -6.396424, 0, -0.5, 0.5, 0.5,
-3.920554, -2, -6.396424, 1, -0.5, 0.5, 0.5,
-3.920554, -2, -6.396424, 1, 1.5, 0.5, 0.5,
-3.920554, -2, -6.396424, 0, 1.5, 0.5, 0.5,
-3.920554, -1, -6.396424, 0, -0.5, 0.5, 0.5,
-3.920554, -1, -6.396424, 1, -0.5, 0.5, 0.5,
-3.920554, -1, -6.396424, 1, 1.5, 0.5, 0.5,
-3.920554, -1, -6.396424, 0, 1.5, 0.5, 0.5,
-3.920554, 0, -6.396424, 0, -0.5, 0.5, 0.5,
-3.920554, 0, -6.396424, 1, -0.5, 0.5, 0.5,
-3.920554, 0, -6.396424, 1, 1.5, 0.5, 0.5,
-3.920554, 0, -6.396424, 0, 1.5, 0.5, 0.5,
-3.920554, 1, -6.396424, 0, -0.5, 0.5, 0.5,
-3.920554, 1, -6.396424, 1, -0.5, 0.5, 0.5,
-3.920554, 1, -6.396424, 1, 1.5, 0.5, 0.5,
-3.920554, 1, -6.396424, 0, 1.5, 0.5, 0.5,
-3.920554, 2, -6.396424, 0, -0.5, 0.5, 0.5,
-3.920554, 2, -6.396424, 1, -0.5, 0.5, 0.5,
-3.920554, 2, -6.396424, 1, 1.5, 0.5, 0.5,
-3.920554, 2, -6.396424, 0, 1.5, 0.5, 0.5
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
-3.429225, -3.18554, -4,
-3.429225, -3.18554, 4,
-3.429225, -3.18554, -4,
-3.593001, -3.334942, -4,
-3.429225, -3.18554, -2,
-3.593001, -3.334942, -2,
-3.429225, -3.18554, 0,
-3.593001, -3.334942, 0,
-3.429225, -3.18554, 2,
-3.593001, -3.334942, 2,
-3.429225, -3.18554, 4,
-3.593001, -3.334942, 4
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
-3.920554, -3.633746, -4, 0, -0.5, 0.5, 0.5,
-3.920554, -3.633746, -4, 1, -0.5, 0.5, 0.5,
-3.920554, -3.633746, -4, 1, 1.5, 0.5, 0.5,
-3.920554, -3.633746, -4, 0, 1.5, 0.5, 0.5,
-3.920554, -3.633746, -2, 0, -0.5, 0.5, 0.5,
-3.920554, -3.633746, -2, 1, -0.5, 0.5, 0.5,
-3.920554, -3.633746, -2, 1, 1.5, 0.5, 0.5,
-3.920554, -3.633746, -2, 0, 1.5, 0.5, 0.5,
-3.920554, -3.633746, 0, 0, -0.5, 0.5, 0.5,
-3.920554, -3.633746, 0, 1, -0.5, 0.5, 0.5,
-3.920554, -3.633746, 0, 1, 1.5, 0.5, 0.5,
-3.920554, -3.633746, 0, 0, 1.5, 0.5, 0.5,
-3.920554, -3.633746, 2, 0, -0.5, 0.5, 0.5,
-3.920554, -3.633746, 2, 1, -0.5, 0.5, 0.5,
-3.920554, -3.633746, 2, 1, 1.5, 0.5, 0.5,
-3.920554, -3.633746, 2, 0, 1.5, 0.5, 0.5,
-3.920554, -3.633746, 4, 0, -0.5, 0.5, 0.5,
-3.920554, -3.633746, 4, 1, -0.5, 0.5, 0.5,
-3.920554, -3.633746, 4, 1, 1.5, 0.5, 0.5,
-3.920554, -3.633746, 4, 0, 1.5, 0.5, 0.5
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
-3.429225, -3.18554, -5.577886,
-3.429225, 2.790544, -5.577886,
-3.429225, -3.18554, 5.335968,
-3.429225, 2.790544, 5.335968,
-3.429225, -3.18554, -5.577886,
-3.429225, -3.18554, 5.335968,
-3.429225, 2.790544, -5.577886,
-3.429225, 2.790544, 5.335968,
-3.429225, -3.18554, -5.577886,
3.121827, -3.18554, -5.577886,
-3.429225, -3.18554, 5.335968,
3.121827, -3.18554, 5.335968,
-3.429225, 2.790544, -5.577886,
3.121827, 2.790544, -5.577886,
-3.429225, 2.790544, 5.335968,
3.121827, 2.790544, 5.335968,
3.121827, -3.18554, -5.577886,
3.121827, 2.790544, -5.577886,
3.121827, -3.18554, 5.335968,
3.121827, 2.790544, 5.335968,
3.121827, -3.18554, -5.577886,
3.121827, -3.18554, 5.335968,
3.121827, 2.790544, -5.577886,
3.121827, 2.790544, 5.335968
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
var radius = 7.508877;
var distance = 33.40784;
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
mvMatrix.translate( 0.1536989, 0.197498, 0.1209586 );
mvMatrix.scale( 1.239304, 1.358539, 0.7438935 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.40784);
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
Carbamidin<-read.table("Carbamidin.xyz", skip=1)
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
-3.333821, -0.1822621, -1.783611, 0, 0, 1, 1, 1,
-2.94084, 0.6098993, -1.871936, 1, 0, 0, 1, 1,
-2.922287, -0.4075948, -1.57406, 1, 0, 0, 1, 1,
-2.801507, 1.540622, -0.7608443, 1, 0, 0, 1, 1,
-2.787889, 0.07912319, 0.464339, 1, 0, 0, 1, 1,
-2.674389, 1.566937, -0.894521, 1, 0, 0, 1, 1,
-2.585499, -0.04889032, -2.120427, 0, 0, 0, 1, 1,
-2.575305, -0.181398, -2.903842, 0, 0, 0, 1, 1,
-2.414289, 1.978918, -1.272858, 0, 0, 0, 1, 1,
-2.340029, 0.1132847, -2.727334, 0, 0, 0, 1, 1,
-2.294449, 0.03024825, -0.6172492, 0, 0, 0, 1, 1,
-2.29306, -2.087329, -1.183056, 0, 0, 0, 1, 1,
-2.280733, 0.370842, -1.400497, 0, 0, 0, 1, 1,
-2.252699, 1.196336, -0.9803674, 1, 1, 1, 1, 1,
-2.238824, -2.130488, -1.523921, 1, 1, 1, 1, 1,
-2.203844, 1.024552, -1.285442, 1, 1, 1, 1, 1,
-2.193342, -0.6571088, -0.3222244, 1, 1, 1, 1, 1,
-2.158304, 0.9293101, -0.06885733, 1, 1, 1, 1, 1,
-2.156965, 0.9786786, -1.831873, 1, 1, 1, 1, 1,
-2.14605, 0.4175938, -0.4102582, 1, 1, 1, 1, 1,
-2.145796, 0.8740224, -1.350337, 1, 1, 1, 1, 1,
-2.137146, -1.053791, -2.642304, 1, 1, 1, 1, 1,
-2.10859, 1.095297, 0.2141806, 1, 1, 1, 1, 1,
-2.101423, 1.211725, -0.8122832, 1, 1, 1, 1, 1,
-2.085673, 0.6921073, -1.837566, 1, 1, 1, 1, 1,
-2.076933, 0.7905195, -2.519648, 1, 1, 1, 1, 1,
-2.026392, 0.2060159, -3.259789, 1, 1, 1, 1, 1,
-2.003707, 1.089128, -1.468123, 1, 1, 1, 1, 1,
-2.001759, 0.6169451, -2.548988, 0, 0, 1, 1, 1,
-1.973643, -0.6287398, -1.723558, 1, 0, 0, 1, 1,
-1.948148, 0.1545897, -1.65402, 1, 0, 0, 1, 1,
-1.929966, 0.1945146, -1.650498, 1, 0, 0, 1, 1,
-1.922869, -0.1938516, -1.091564, 1, 0, 0, 1, 1,
-1.91954, 0.2062518, -1.979451, 1, 0, 0, 1, 1,
-1.916587, -0.3217984, -1.58732, 0, 0, 0, 1, 1,
-1.913214, -0.7545063, -3.116591, 0, 0, 0, 1, 1,
-1.913146, 0.3194328, -2.312107, 0, 0, 0, 1, 1,
-1.866066, 0.06128738, -3.026312, 0, 0, 0, 1, 1,
-1.856691, 1.197971, -2.167578, 0, 0, 0, 1, 1,
-1.856626, 0.1667981, -0.9916791, 0, 0, 0, 1, 1,
-1.854691, -1.311226, -2.593629, 0, 0, 0, 1, 1,
-1.835588, -0.7919567, -1.668569, 1, 1, 1, 1, 1,
-1.81815, -0.7272415, -2.695445, 1, 1, 1, 1, 1,
-1.773271, -0.9922171, -2.083895, 1, 1, 1, 1, 1,
-1.760097, -1.21322, -3.340352, 1, 1, 1, 1, 1,
-1.740148, 0.8452525, -1.477561, 1, 1, 1, 1, 1,
-1.723162, -0.3124628, -3.047306, 1, 1, 1, 1, 1,
-1.720624, -2.171106, -2.985677, 1, 1, 1, 1, 1,
-1.714283, 0.1034242, -1.846803, 1, 1, 1, 1, 1,
-1.694879, -0.04658397, -2.020278, 1, 1, 1, 1, 1,
-1.682506, -1.616169, -1.944755, 1, 1, 1, 1, 1,
-1.678136, 0.4319787, 0.5687277, 1, 1, 1, 1, 1,
-1.65497, -0.4640405, -1.734455, 1, 1, 1, 1, 1,
-1.641565, -1.25905, -0.9223225, 1, 1, 1, 1, 1,
-1.63544, 0.5457611, -1.157145, 1, 1, 1, 1, 1,
-1.633289, -1.704895, -2.744925, 1, 1, 1, 1, 1,
-1.628197, -1.945109, -2.344251, 0, 0, 1, 1, 1,
-1.594796, -0.7144845, -2.358948, 1, 0, 0, 1, 1,
-1.579359, 0.9265445, 0.6867955, 1, 0, 0, 1, 1,
-1.574321, 0.6719654, -0.07165075, 1, 0, 0, 1, 1,
-1.565418, -0.5925882, -2.996279, 1, 0, 0, 1, 1,
-1.565066, -0.1710547, -0.6552844, 1, 0, 0, 1, 1,
-1.564071, -0.6710972, -1.216334, 0, 0, 0, 1, 1,
-1.562305, -0.674831, -0.5583878, 0, 0, 0, 1, 1,
-1.558205, 1.216973, -0.7268546, 0, 0, 0, 1, 1,
-1.551146, -0.5170206, -2.955081, 0, 0, 0, 1, 1,
-1.548872, 0.9369283, -2.320711, 0, 0, 0, 1, 1,
-1.548509, -0.7405788, -2.643026, 0, 0, 0, 1, 1,
-1.545503, -0.05835718, -1.579589, 0, 0, 0, 1, 1,
-1.544159, 0.592279, -0.347809, 1, 1, 1, 1, 1,
-1.528031, -0.1589191, -2.701333, 1, 1, 1, 1, 1,
-1.527433, 0.1129613, -1.006138, 1, 1, 1, 1, 1,
-1.523576, -0.9944755, -0.8768629, 1, 1, 1, 1, 1,
-1.515479, -2.610915, -1.519065, 1, 1, 1, 1, 1,
-1.514384, -0.8048046, -2.352877, 1, 1, 1, 1, 1,
-1.504951, -0.09688319, -1.836526, 1, 1, 1, 1, 1,
-1.494623, -0.4776359, -2.391004, 1, 1, 1, 1, 1,
-1.487018, -0.3875502, -0.3054213, 1, 1, 1, 1, 1,
-1.480698, 0.1346416, -1.206207, 1, 1, 1, 1, 1,
-1.463744, -1.533838, -1.289806, 1, 1, 1, 1, 1,
-1.458962, -0.1193181, -1.345489, 1, 1, 1, 1, 1,
-1.45678, -2.58302, -2.868808, 1, 1, 1, 1, 1,
-1.453196, 0.622423, -0.6860701, 1, 1, 1, 1, 1,
-1.448867, -0.06459462, -1.698581, 1, 1, 1, 1, 1,
-1.448106, 1.130116, -1.010591, 0, 0, 1, 1, 1,
-1.444004, 0.5629556, -0.7588149, 1, 0, 0, 1, 1,
-1.439509, -1.367691, -2.13167, 1, 0, 0, 1, 1,
-1.43588, 0.7082289, -1.265693, 1, 0, 0, 1, 1,
-1.433823, 1.098323, 0.06361163, 1, 0, 0, 1, 1,
-1.427337, 1.046859, -1.177725, 1, 0, 0, 1, 1,
-1.409207, 1.51961, -1.797679, 0, 0, 0, 1, 1,
-1.402552, -0.5136261, -1.19832, 0, 0, 0, 1, 1,
-1.401663, 0.830239, -1.328707, 0, 0, 0, 1, 1,
-1.393159, -2.12003, -3.617889, 0, 0, 0, 1, 1,
-1.382946, -0.2414724, -2.429086, 0, 0, 0, 1, 1,
-1.380183, -0.4655014, -1.073612, 0, 0, 0, 1, 1,
-1.364086, 0.5530488, -1.194238, 0, 0, 0, 1, 1,
-1.350219, 1.195861, -1.01692, 1, 1, 1, 1, 1,
-1.348061, 0.9999077, -0.9681473, 1, 1, 1, 1, 1,
-1.339489, 0.2395129, -0.7623249, 1, 1, 1, 1, 1,
-1.333549, 0.006260975, -0.1054337, 1, 1, 1, 1, 1,
-1.316412, 0.3664895, -0.7859111, 1, 1, 1, 1, 1,
-1.315346, 1.106136, -1.762968, 1, 1, 1, 1, 1,
-1.309638, 0.8034768, -1.075652, 1, 1, 1, 1, 1,
-1.303967, -1.390291, -1.690624, 1, 1, 1, 1, 1,
-1.295821, 0.2927004, -1.252809, 1, 1, 1, 1, 1,
-1.286442, -0.8201533, -2.558841, 1, 1, 1, 1, 1,
-1.285957, -0.694355, -3.197804, 1, 1, 1, 1, 1,
-1.282516, 0.828747, -0.1340255, 1, 1, 1, 1, 1,
-1.281447, 0.9633074, -1.432188, 1, 1, 1, 1, 1,
-1.278143, -0.340727, 0.8409677, 1, 1, 1, 1, 1,
-1.276573, -0.5570045, -0.04195352, 1, 1, 1, 1, 1,
-1.275637, 0.9593463, -1.241069, 0, 0, 1, 1, 1,
-1.271242, -2.060488, -3.37916, 1, 0, 0, 1, 1,
-1.263843, -0.6144342, -2.40595, 1, 0, 0, 1, 1,
-1.260798, -0.9101989, -1.386657, 1, 0, 0, 1, 1,
-1.260758, -0.7048993, -1.416451, 1, 0, 0, 1, 1,
-1.25743, -1.07443, -2.162074, 1, 0, 0, 1, 1,
-1.249439, 0.2056681, -2.177748, 0, 0, 0, 1, 1,
-1.242067, 0.6472812, -2.805855, 0, 0, 0, 1, 1,
-1.240949, -0.02507864, -3.467422, 0, 0, 0, 1, 1,
-1.233279, -1.641943, -2.830755, 0, 0, 0, 1, 1,
-1.22294, -2.069832, -2.091882, 0, 0, 0, 1, 1,
-1.219156, 1.161708, -0.7934401, 0, 0, 0, 1, 1,
-1.218663, -0.5344917, -1.649716, 0, 0, 0, 1, 1,
-1.214913, 0.5466916, -1.398561, 1, 1, 1, 1, 1,
-1.214145, 0.7113891, -0.4436972, 1, 1, 1, 1, 1,
-1.208361, 0.11881, -2.110184, 1, 1, 1, 1, 1,
-1.207192, 1.380111, -0.4154034, 1, 1, 1, 1, 1,
-1.197266, -0.9879254, -2.252264, 1, 1, 1, 1, 1,
-1.19444, 0.1124062, -1.016624, 1, 1, 1, 1, 1,
-1.19245, 1.048694, -0.5225477, 1, 1, 1, 1, 1,
-1.185589, -0.1461284, -1.106624, 1, 1, 1, 1, 1,
-1.183277, -0.6470147, -3.291003, 1, 1, 1, 1, 1,
-1.180862, -0.3768109, -1.847627, 1, 1, 1, 1, 1,
-1.176033, -0.5031784, -1.243029, 1, 1, 1, 1, 1,
-1.175995, -0.6040977, -2.318985, 1, 1, 1, 1, 1,
-1.170322, 1.484088, 0.5126874, 1, 1, 1, 1, 1,
-1.166518, 0.5344171, 0.1886749, 1, 1, 1, 1, 1,
-1.165689, -0.1452796, -1.890939, 1, 1, 1, 1, 1,
-1.16518, -0.2143502, -0.4448227, 0, 0, 1, 1, 1,
-1.163255, 0.01327889, -4.38154, 1, 0, 0, 1, 1,
-1.162598, 0.006081126, -2.158571, 1, 0, 0, 1, 1,
-1.162492, -0.4637125, -2.394004, 1, 0, 0, 1, 1,
-1.160328, 0.5027351, -2.709386, 1, 0, 0, 1, 1,
-1.156472, -1.53846, -1.387412, 1, 0, 0, 1, 1,
-1.151789, 0.2179488, -0.6096842, 0, 0, 0, 1, 1,
-1.146544, 1.35307, 0.1092268, 0, 0, 0, 1, 1,
-1.143399, -0.7249234, -2.073805, 0, 0, 0, 1, 1,
-1.142522, 0.2518246, -1.8107, 0, 0, 0, 1, 1,
-1.141054, 0.5985723, -1.265872, 0, 0, 0, 1, 1,
-1.139533, -1.959321, -0.8805673, 0, 0, 0, 1, 1,
-1.137553, -1.102393, -2.823156, 0, 0, 0, 1, 1,
-1.134889, -0.9537903, -4.135826, 1, 1, 1, 1, 1,
-1.12183, 0.07242012, -2.258387, 1, 1, 1, 1, 1,
-1.12, -1.04185, -2.475911, 1, 1, 1, 1, 1,
-1.114938, 0.3626873, 0.4802909, 1, 1, 1, 1, 1,
-1.10919, -1.761265, -3.390013, 1, 1, 1, 1, 1,
-1.104089, -1.771209, -1.052165, 1, 1, 1, 1, 1,
-1.102055, -0.5528324, -0.5695731, 1, 1, 1, 1, 1,
-1.099425, -0.5677771, -3.42159, 1, 1, 1, 1, 1,
-1.097606, -0.4930389, -0.9848299, 1, 1, 1, 1, 1,
-1.095694, 1.548884, -1.001149, 1, 1, 1, 1, 1,
-1.092123, 0.1097146, -1.562164, 1, 1, 1, 1, 1,
-1.08867, -2.0483, -2.607262, 1, 1, 1, 1, 1,
-1.088009, -1.882835, -3.320096, 1, 1, 1, 1, 1,
-1.080388, 0.5989103, 0.06879769, 1, 1, 1, 1, 1,
-1.077947, -0.3896306, -2.233873, 1, 1, 1, 1, 1,
-1.075868, -0.2619867, -2.373085, 0, 0, 1, 1, 1,
-1.071986, 0.04322264, -3.560449, 1, 0, 0, 1, 1,
-1.069426, -0.6065794, -2.811948, 1, 0, 0, 1, 1,
-1.069386, 0.7019994, -1.542774, 1, 0, 0, 1, 1,
-1.049554, -0.2775672, -1.016507, 1, 0, 0, 1, 1,
-1.041687, 0.7722479, -1.556934, 1, 0, 0, 1, 1,
-1.041678, 1.392523, -0.08406819, 0, 0, 0, 1, 1,
-1.023213, -0.8613236, -2.668546, 0, 0, 0, 1, 1,
-1.021163, -0.8573852, -1.200127, 0, 0, 0, 1, 1,
-1.019921, 0.198903, 0.1449463, 0, 0, 0, 1, 1,
-1.017616, 0.9930897, -0.02889124, 0, 0, 0, 1, 1,
-1.016376, -0.7500716, -2.109657, 0, 0, 0, 1, 1,
-1.013376, -0.170065, -1.926223, 0, 0, 0, 1, 1,
-1.000049, -2.14647, -3.126127, 1, 1, 1, 1, 1,
-0.99948, 0.8234971, 1.61074, 1, 1, 1, 1, 1,
-0.9994351, 1.912652, -1.260095, 1, 1, 1, 1, 1,
-0.997086, 0.2241268, -0.8626414, 1, 1, 1, 1, 1,
-0.990577, -0.1073508, -1.685887, 1, 1, 1, 1, 1,
-0.9853584, -1.445598, -1.968387, 1, 1, 1, 1, 1,
-0.9821681, 1.175118, -1.574799, 1, 1, 1, 1, 1,
-0.9809718, 2.026416, -0.02626373, 1, 1, 1, 1, 1,
-0.9719317, -0.817014, -2.387034, 1, 1, 1, 1, 1,
-0.9674376, -1.062676, -1.351056, 1, 1, 1, 1, 1,
-0.9667985, 0.0908027, 0.5551322, 1, 1, 1, 1, 1,
-0.9651672, -0.5754951, -0.7258413, 1, 1, 1, 1, 1,
-0.9618151, -0.9500316, -2.769073, 1, 1, 1, 1, 1,
-0.9580522, 1.097335, -0.05185992, 1, 1, 1, 1, 1,
-0.9536134, -0.6056353, -2.289531, 1, 1, 1, 1, 1,
-0.9535335, -1.236912, -1.707853, 0, 0, 1, 1, 1,
-0.9476194, 1.601108, 0.7081262, 1, 0, 0, 1, 1,
-0.9368233, 0.7049087, -0.8841673, 1, 0, 0, 1, 1,
-0.9336243, 1.026087, -1.131818, 1, 0, 0, 1, 1,
-0.9312405, -0.6474541, -1.854613, 1, 0, 0, 1, 1,
-0.9224186, -0.4851355, -2.397209, 1, 0, 0, 1, 1,
-0.9220994, 0.330879, -0.9965147, 0, 0, 0, 1, 1,
-0.9213462, -1.324318, -4.475615, 0, 0, 0, 1, 1,
-0.9088404, 1.02309, -1.659828, 0, 0, 0, 1, 1,
-0.9082853, -1.636131, -0.9668833, 0, 0, 0, 1, 1,
-0.9033939, -1.542595, -4.259677, 0, 0, 0, 1, 1,
-0.8932198, -0.1114627, -0.01978214, 0, 0, 0, 1, 1,
-0.8914242, -0.06214373, -2.316859, 0, 0, 0, 1, 1,
-0.8913714, -0.09690265, -1.274342, 1, 1, 1, 1, 1,
-0.889516, 0.2628385, -0.2902934, 1, 1, 1, 1, 1,
-0.8872668, -1.737211, -2.007351, 1, 1, 1, 1, 1,
-0.8834654, -1.264226, -1.727199, 1, 1, 1, 1, 1,
-0.8825045, 1.147501, -0.629876, 1, 1, 1, 1, 1,
-0.8814287, -0.2457523, -3.615143, 1, 1, 1, 1, 1,
-0.8807083, 0.2486635, -2.191849, 1, 1, 1, 1, 1,
-0.8776079, -0.3163397, -1.402586, 1, 1, 1, 1, 1,
-0.875162, -0.00103096, -1.468051, 1, 1, 1, 1, 1,
-0.871492, -0.3402518, -2.107151, 1, 1, 1, 1, 1,
-0.8697954, -1.294548, -3.024439, 1, 1, 1, 1, 1,
-0.8684016, 1.368616, -0.8487225, 1, 1, 1, 1, 1,
-0.8644485, -0.49248, -1.96141, 1, 1, 1, 1, 1,
-0.8614021, -1.51793, -3.489659, 1, 1, 1, 1, 1,
-0.8566172, -0.9430267, -2.892575, 1, 1, 1, 1, 1,
-0.8548253, 0.3712256, -1.847592, 0, 0, 1, 1, 1,
-0.8537704, -1.20754, -3.435649, 1, 0, 0, 1, 1,
-0.8513156, 1.615662, -0.8050281, 1, 0, 0, 1, 1,
-0.8469368, -2.77976, -5.418946, 1, 0, 0, 1, 1,
-0.8421494, -0.7905612, -2.938732, 1, 0, 0, 1, 1,
-0.8390667, 0.1137672, -2.341348, 1, 0, 0, 1, 1,
-0.8346601, -0.122142, -2.520272, 0, 0, 0, 1, 1,
-0.8312716, 0.1300337, 0.04374406, 0, 0, 0, 1, 1,
-0.8304694, -0.3870409, -3.040743, 0, 0, 0, 1, 1,
-0.8303946, 1.332955, -0.3417081, 0, 0, 0, 1, 1,
-0.8262102, 0.1566324, -3.13393, 0, 0, 0, 1, 1,
-0.8207597, 1.777783, -0.8499463, 0, 0, 0, 1, 1,
-0.8182418, 0.001871927, -0.09696971, 0, 0, 0, 1, 1,
-0.8173347, 1.231047, 0.1235352, 1, 1, 1, 1, 1,
-0.8145317, 1.100269, -1.968218, 1, 1, 1, 1, 1,
-0.8125613, 0.1119387, -1.418387, 1, 1, 1, 1, 1,
-0.8087675, 1.296729, -1.271945, 1, 1, 1, 1, 1,
-0.807516, -0.1624931, -1.572372, 1, 1, 1, 1, 1,
-0.8037412, 0.9210938, -0.04677127, 1, 1, 1, 1, 1,
-0.7967677, -0.05935199, -2.240163, 1, 1, 1, 1, 1,
-0.7956455, -0.9458268, -2.043545, 1, 1, 1, 1, 1,
-0.7942175, 0.7234583, 0.007700009, 1, 1, 1, 1, 1,
-0.7938492, 0.05276219, -1.493399, 1, 1, 1, 1, 1,
-0.7934155, 1.439784, 0.8030975, 1, 1, 1, 1, 1,
-0.7928082, 1.085058, -0.5662239, 1, 1, 1, 1, 1,
-0.7921748, -0.1004411, 0.3534637, 1, 1, 1, 1, 1,
-0.7911431, -1.527106, -1.461796, 1, 1, 1, 1, 1,
-0.787627, -0.4576665, -1.744251, 1, 1, 1, 1, 1,
-0.7849349, -0.2988341, -4.453013, 0, 0, 1, 1, 1,
-0.7780704, 0.5909305, -2.433935, 1, 0, 0, 1, 1,
-0.7774655, -0.6874813, -0.9559328, 1, 0, 0, 1, 1,
-0.7646528, -0.7366154, -1.998579, 1, 0, 0, 1, 1,
-0.7632471, -0.406923, -2.956364, 1, 0, 0, 1, 1,
-0.7568909, 0.4674619, -1.103553, 1, 0, 0, 1, 1,
-0.752289, 0.08040618, -1.855015, 0, 0, 0, 1, 1,
-0.7456185, 0.5395162, -0.92262, 0, 0, 0, 1, 1,
-0.7420934, 0.486738, -1.134073, 0, 0, 0, 1, 1,
-0.7413252, 0.3937259, -3.576845, 0, 0, 0, 1, 1,
-0.7350301, 1.064761, -0.5605147, 0, 0, 0, 1, 1,
-0.7337564, -1.115115, -2.324843, 0, 0, 0, 1, 1,
-0.733498, 0.4885025, -1.089785, 0, 0, 0, 1, 1,
-0.7265172, -1.451749, -2.335161, 1, 1, 1, 1, 1,
-0.7230412, 1.166827, -1.221502, 1, 1, 1, 1, 1,
-0.7228866, -0.6945294, -4.974012, 1, 1, 1, 1, 1,
-0.7219452, 0.8403988, -2.385526, 1, 1, 1, 1, 1,
-0.7195044, 0.9842563, -0.0128798, 1, 1, 1, 1, 1,
-0.7163973, 0.6179514, 1.368327, 1, 1, 1, 1, 1,
-0.7071902, 0.300534, -2.107538, 1, 1, 1, 1, 1,
-0.6995529, -0.04931599, -2.883512, 1, 1, 1, 1, 1,
-0.6991742, 0.621816, -0.1424092, 1, 1, 1, 1, 1,
-0.6986622, 0.5569717, -1.210834, 1, 1, 1, 1, 1,
-0.6977094, -0.7156352, -3.043161, 1, 1, 1, 1, 1,
-0.6974524, 0.4987741, -0.5709922, 1, 1, 1, 1, 1,
-0.6884732, 0.2079758, -1.989414, 1, 1, 1, 1, 1,
-0.6847059, -1.37963, -2.881759, 1, 1, 1, 1, 1,
-0.6845078, -1.263222, -4.14306, 1, 1, 1, 1, 1,
-0.683755, -0.354498, -4.125989, 0, 0, 1, 1, 1,
-0.6835418, -1.684792, -2.46457, 1, 0, 0, 1, 1,
-0.6792169, 0.6689672, 0.6596444, 1, 0, 0, 1, 1,
-0.674548, -0.5506248, -3.188101, 1, 0, 0, 1, 1,
-0.6728578, 1.368118, -1.590794, 1, 0, 0, 1, 1,
-0.6720104, -0.05547513, -1.58665, 1, 0, 0, 1, 1,
-0.6718399, -1.478938, -2.669443, 0, 0, 0, 1, 1,
-0.6712664, 1.653196, 1.317566, 0, 0, 0, 1, 1,
-0.6681322, 0.4449408, -1.507842, 0, 0, 0, 1, 1,
-0.6671044, -0.6167862, -2.993828, 0, 0, 0, 1, 1,
-0.6568789, 0.9103584, -0.06430842, 0, 0, 0, 1, 1,
-0.652694, -0.0626127, -1.848833, 0, 0, 0, 1, 1,
-0.6526321, -2.102535, -1.889925, 0, 0, 0, 1, 1,
-0.6450204, 0.3613736, -0.8126439, 1, 1, 1, 1, 1,
-0.6442747, 0.7260138, -2.094069, 1, 1, 1, 1, 1,
-0.6427756, -1.127458, -2.978048, 1, 1, 1, 1, 1,
-0.6394011, 1.699812, -0.1536041, 1, 1, 1, 1, 1,
-0.6363105, 1.733351, -1.333817, 1, 1, 1, 1, 1,
-0.6311795, 0.5944488, -0.4817497, 1, 1, 1, 1, 1,
-0.629797, 1.23582, 0.1119964, 1, 1, 1, 1, 1,
-0.6286762, 0.155671, -1.186619, 1, 1, 1, 1, 1,
-0.6286038, -0.3375472, -3.346873, 1, 1, 1, 1, 1,
-0.6238928, -0.7770796, -2.493528, 1, 1, 1, 1, 1,
-0.6196312, 0.9882808, 0.4757006, 1, 1, 1, 1, 1,
-0.6178553, 0.7789578, -0.8185816, 1, 1, 1, 1, 1,
-0.6153323, -0.2788787, -0.2338006, 1, 1, 1, 1, 1,
-0.6100679, 0.01875245, -1.038469, 1, 1, 1, 1, 1,
-0.6088552, -0.3794237, -1.718361, 1, 1, 1, 1, 1,
-0.6071275, 1.045422, -0.04385488, 0, 0, 1, 1, 1,
-0.6068411, -0.3636065, -0.9014053, 1, 0, 0, 1, 1,
-0.6003324, 0.9464858, -0.6402572, 1, 0, 0, 1, 1,
-0.5950616, 1.127907, 0.437557, 1, 0, 0, 1, 1,
-0.5947156, 0.4754118, -0.859418, 1, 0, 0, 1, 1,
-0.5886043, -0.9787546, -1.801256, 1, 0, 0, 1, 1,
-0.5853031, -1.817838, -1.74364, 0, 0, 0, 1, 1,
-0.5824203, -0.9694084, -0.276694, 0, 0, 0, 1, 1,
-0.5679318, -0.3355359, -0.7600893, 0, 0, 0, 1, 1,
-0.5674357, -0.8183556, -3.412129, 0, 0, 0, 1, 1,
-0.5653541, 0.1759111, 0.4734946, 0, 0, 0, 1, 1,
-0.5648444, -0.5638821, -1.872914, 0, 0, 0, 1, 1,
-0.5647031, -2.076491, -3.205489, 0, 0, 0, 1, 1,
-0.5616245, 0.6098265, -2.312667, 1, 1, 1, 1, 1,
-0.5616182, 0.3542573, -0.4960876, 1, 1, 1, 1, 1,
-0.5611835, -0.102576, -1.103058, 1, 1, 1, 1, 1,
-0.5599578, -0.2167214, -2.854309, 1, 1, 1, 1, 1,
-0.5581929, 0.7265297, -1.323354, 1, 1, 1, 1, 1,
-0.5545187, 1.976237, -1.773313, 1, 1, 1, 1, 1,
-0.5530147, -0.1778751, -1.081275, 1, 1, 1, 1, 1,
-0.551217, -0.4897458, -2.726779, 1, 1, 1, 1, 1,
-0.5456495, -1.865159, -3.203893, 1, 1, 1, 1, 1,
-0.5423532, -1.452664, -1.477419, 1, 1, 1, 1, 1,
-0.5406771, 1.589919, -0.626202, 1, 1, 1, 1, 1,
-0.5382552, -0.8311618, -1.768805, 1, 1, 1, 1, 1,
-0.5278478, -0.4149387, -2.56951, 1, 1, 1, 1, 1,
-0.5261247, 0.1467195, -1.254454, 1, 1, 1, 1, 1,
-0.5259502, -1.112537, -0.4293991, 1, 1, 1, 1, 1,
-0.5234729, 0.4863684, 1.631901, 0, 0, 1, 1, 1,
-0.5152788, 0.06417245, -0.7927212, 1, 0, 0, 1, 1,
-0.5139606, -0.7764882, -2.886129, 1, 0, 0, 1, 1,
-0.5122789, 0.5146585, -0.3570516, 1, 0, 0, 1, 1,
-0.5120218, -2.258777, -1.647764, 1, 0, 0, 1, 1,
-0.5091522, -2.308374, -2.23316, 1, 0, 0, 1, 1,
-0.5047249, 1.153476, -0.7268102, 0, 0, 0, 1, 1,
-0.5010569, 2.703514, -0.9950146, 0, 0, 0, 1, 1,
-0.496129, 1.121268, 0.6686236, 0, 0, 0, 1, 1,
-0.4903513, -1.232539, -1.869614, 0, 0, 0, 1, 1,
-0.489523, -0.1888749, -1.182423, 0, 0, 0, 1, 1,
-0.4882774, -2.334759, -3.438685, 0, 0, 0, 1, 1,
-0.4869379, 1.633463, 1.447134, 0, 0, 0, 1, 1,
-0.4863558, -0.3717763, -1.746146, 1, 1, 1, 1, 1,
-0.4825587, 0.6251432, -0.5320337, 1, 1, 1, 1, 1,
-0.4820188, 0.293518, -0.7748277, 1, 1, 1, 1, 1,
-0.4806318, 0.500947, -0.1525871, 1, 1, 1, 1, 1,
-0.4782974, 0.5864688, -0.4159572, 1, 1, 1, 1, 1,
-0.4726294, 0.6293268, -0.3649309, 1, 1, 1, 1, 1,
-0.4712768, 0.2078772, -0.217021, 1, 1, 1, 1, 1,
-0.4702008, 0.5788863, -2.409996, 1, 1, 1, 1, 1,
-0.468147, -0.695525, -2.890169, 1, 1, 1, 1, 1,
-0.4672882, 2.324203, -0.6065238, 1, 1, 1, 1, 1,
-0.4660685, -0.2132114, -1.752987, 1, 1, 1, 1, 1,
-0.4596044, 1.13728, -0.7799, 1, 1, 1, 1, 1,
-0.4561652, 2.491282, 0.07493224, 1, 1, 1, 1, 1,
-0.4538837, 0.3808811, -0.7441586, 1, 1, 1, 1, 1,
-0.4537448, 0.001636952, -2.057383, 1, 1, 1, 1, 1,
-0.4527237, -0.02917392, -1.612245, 0, 0, 1, 1, 1,
-0.4518189, -1.155565, -1.651883, 1, 0, 0, 1, 1,
-0.4514198, -1.169775, -2.647851, 1, 0, 0, 1, 1,
-0.4510447, 0.6213635, 1.027186, 1, 0, 0, 1, 1,
-0.4507863, -0.09641942, -4.683152, 1, 0, 0, 1, 1,
-0.4499843, -1.852973, -5.336738, 1, 0, 0, 1, 1,
-0.4468831, 0.8737641, 0.6610659, 0, 0, 0, 1, 1,
-0.4463238, 0.7325239, -1.378411, 0, 0, 0, 1, 1,
-0.4446691, 1.565205, 0.1312821, 0, 0, 0, 1, 1,
-0.4402068, 0.7619764, -0.4639481, 0, 0, 0, 1, 1,
-0.4340341, -0.5690605, -3.237918, 0, 0, 0, 1, 1,
-0.4340317, -1.043545, -2.817614, 0, 0, 0, 1, 1,
-0.4335871, 0.2914067, -1.57945, 0, 0, 0, 1, 1,
-0.4328999, 0.7213987, 0.05837518, 1, 1, 1, 1, 1,
-0.4322652, 2.440683, -1.15617, 1, 1, 1, 1, 1,
-0.4300274, 0.874945, -1.933549, 1, 1, 1, 1, 1,
-0.4279989, -0.4253067, -3.010515, 1, 1, 1, 1, 1,
-0.4279482, -0.2176448, -2.678753, 1, 1, 1, 1, 1,
-0.4274473, 0.3250418, -1.570581, 1, 1, 1, 1, 1,
-0.4164944, 1.063945, 0.1323321, 1, 1, 1, 1, 1,
-0.4135008, -0.1776417, -2.00721, 1, 1, 1, 1, 1,
-0.4134619, 1.245035, -0.2762909, 1, 1, 1, 1, 1,
-0.4124396, -0.6656778, -3.572386, 1, 1, 1, 1, 1,
-0.4094581, -0.7344194, -2.385426, 1, 1, 1, 1, 1,
-0.4034393, -0.2475119, -2.185238, 1, 1, 1, 1, 1,
-0.3968779, 0.7631194, -1.089419, 1, 1, 1, 1, 1,
-0.3936818, 0.3259185, 0.02435117, 1, 1, 1, 1, 1,
-0.3906306, 0.5514194, 0.3752564, 1, 1, 1, 1, 1,
-0.3835629, -1.741216, -4.049379, 0, 0, 1, 1, 1,
-0.3830576, 0.9855049, -0.69098, 1, 0, 0, 1, 1,
-0.3679394, -0.1964947, -2.035393, 1, 0, 0, 1, 1,
-0.3497273, 1.205342, -0.6412904, 1, 0, 0, 1, 1,
-0.3480079, -0.2328521, -2.287802, 1, 0, 0, 1, 1,
-0.3479982, 0.9168242, -0.9423031, 1, 0, 0, 1, 1,
-0.3457671, 0.8877579, 0.7229036, 0, 0, 0, 1, 1,
-0.3412522, 0.360048, -1.111517, 0, 0, 0, 1, 1,
-0.3402524, -0.6123279, -4.635724, 0, 0, 0, 1, 1,
-0.338223, -0.5075512, -2.34405, 0, 0, 0, 1, 1,
-0.3358546, 0.1289686, -0.93725, 0, 0, 0, 1, 1,
-0.3335772, -0.3522496, -0.4453479, 0, 0, 0, 1, 1,
-0.3322798, -0.575891, -2.298262, 0, 0, 0, 1, 1,
-0.3302547, -1.278791, -2.917195, 1, 1, 1, 1, 1,
-0.3298459, 0.8993785, -0.8626106, 1, 1, 1, 1, 1,
-0.3269502, -1.15641, -3.121646, 1, 1, 1, 1, 1,
-0.3245523, 1.493104, -1.624565, 1, 1, 1, 1, 1,
-0.324531, -0.4856373, -2.930592, 1, 1, 1, 1, 1,
-0.3215695, 0.06432672, -1.414768, 1, 1, 1, 1, 1,
-0.3215356, 0.4821114, -0.03696608, 1, 1, 1, 1, 1,
-0.3211194, -0.4637179, -2.038743, 1, 1, 1, 1, 1,
-0.3201922, -0.2776527, -0.4426019, 1, 1, 1, 1, 1,
-0.310971, 0.1734898, -0.9946899, 1, 1, 1, 1, 1,
-0.3054843, -1.193107, -2.624547, 1, 1, 1, 1, 1,
-0.3043686, 1.950686, 0.1332124, 1, 1, 1, 1, 1,
-0.3031668, -0.9003083, -1.659189, 1, 1, 1, 1, 1,
-0.2975163, 1.467074, -1.850924, 1, 1, 1, 1, 1,
-0.294452, 0.1746739, -2.510954, 1, 1, 1, 1, 1,
-0.2930701, 1.455427, 0.4166349, 0, 0, 1, 1, 1,
-0.2870682, 0.3099281, -1.967465, 1, 0, 0, 1, 1,
-0.2848915, -1.599201, -2.416488, 1, 0, 0, 1, 1,
-0.2836939, -0.2323066, -3.274075, 1, 0, 0, 1, 1,
-0.2793226, -0.1078413, -0.8528171, 1, 0, 0, 1, 1,
-0.2781404, -0.1983482, -1.806636, 1, 0, 0, 1, 1,
-0.2714369, 0.2099108, 0.4495231, 0, 0, 0, 1, 1,
-0.2695746, -1.247058, -2.063189, 0, 0, 0, 1, 1,
-0.2677208, -0.8117664, -3.328232, 0, 0, 0, 1, 1,
-0.2654756, -1.076576, -3.079008, 0, 0, 0, 1, 1,
-0.2640966, 0.1549035, -1.453079, 0, 0, 0, 1, 1,
-0.26408, 0.3097082, -1.794507, 0, 0, 0, 1, 1,
-0.2589557, 1.536794, -0.8788147, 0, 0, 0, 1, 1,
-0.2583604, -0.2069544, -1.360293, 1, 1, 1, 1, 1,
-0.258272, 0.1709862, -0.568481, 1, 1, 1, 1, 1,
-0.2468377, 0.1374172, -0.07962949, 1, 1, 1, 1, 1,
-0.2452145, -0.6374625, -2.624441, 1, 1, 1, 1, 1,
-0.2392271, 0.7350366, 1.516219, 1, 1, 1, 1, 1,
-0.2378134, -1.183547, -3.536556, 1, 1, 1, 1, 1,
-0.2345244, -0.3187177, -2.704934, 1, 1, 1, 1, 1,
-0.2298018, 0.8341773, -2.487305, 1, 1, 1, 1, 1,
-0.2292072, 0.7405473, 0.5004869, 1, 1, 1, 1, 1,
-0.2257694, -0.8704554, -1.878995, 1, 1, 1, 1, 1,
-0.2242419, 0.05314015, -0.5276401, 1, 1, 1, 1, 1,
-0.2217253, -0.2815696, -2.76245, 1, 1, 1, 1, 1,
-0.2132775, 0.7403145, -2.041576, 1, 1, 1, 1, 1,
-0.2079067, 0.441531, -2.087708, 1, 1, 1, 1, 1,
-0.2078081, 0.2330868, -0.2790131, 1, 1, 1, 1, 1,
-0.2076643, -1.359118, -5.18472, 0, 0, 1, 1, 1,
-0.2065843, -0.9100882, -3.836419, 1, 0, 0, 1, 1,
-0.2033688, -1.513031, -1.736266, 1, 0, 0, 1, 1,
-0.2022034, 0.1121465, 0.0802278, 1, 0, 0, 1, 1,
-0.2010349, 1.771932, -1.102751, 1, 0, 0, 1, 1,
-0.2004465, 0.1481335, -0.3075685, 1, 0, 0, 1, 1,
-0.1968303, -0.9615867, -2.418882, 0, 0, 0, 1, 1,
-0.195529, -0.2602619, -1.445142, 0, 0, 0, 1, 1,
-0.1934472, -2.315581, -2.850303, 0, 0, 0, 1, 1,
-0.1765783, -0.02992786, -1.38356, 0, 0, 0, 1, 1,
-0.1713427, -1.58805, -2.922461, 0, 0, 0, 1, 1,
-0.1688816, 0.08819696, 0.0526906, 0, 0, 0, 1, 1,
-0.1688577, -0.9401401, -3.257668, 0, 0, 0, 1, 1,
-0.1670974, -0.3259063, -1.29867, 1, 1, 1, 1, 1,
-0.1639355, 0.8149973, -1.605174, 1, 1, 1, 1, 1,
-0.1593836, 0.06323833, 0.2045904, 1, 1, 1, 1, 1,
-0.15906, 0.1677235, 0.3703178, 1, 1, 1, 1, 1,
-0.1563107, -0.1121046, -3.363754, 1, 1, 1, 1, 1,
-0.1561089, 1.420292, -2.913889, 1, 1, 1, 1, 1,
-0.1373911, -0.8063389, -3.919577, 1, 1, 1, 1, 1,
-0.1368128, -0.3991139, -1.761736, 1, 1, 1, 1, 1,
-0.1344825, -0.8313287, -2.126948, 1, 1, 1, 1, 1,
-0.1332472, 2.372056, 1.633852, 1, 1, 1, 1, 1,
-0.1283291, 0.3829939, -0.5508944, 1, 1, 1, 1, 1,
-0.1262011, 1.355337, 0.9979707, 1, 1, 1, 1, 1,
-0.1230245, -0.4527947, -2.652818, 1, 1, 1, 1, 1,
-0.1202592, -0.244887, -1.047566, 1, 1, 1, 1, 1,
-0.1185852, 1.56435, 0.2909693, 1, 1, 1, 1, 1,
-0.117272, 0.7937928, -1.041126, 0, 0, 1, 1, 1,
-0.1148723, -1.134993, -2.843723, 1, 0, 0, 1, 1,
-0.1135692, 1.583404, 0.2169338, 1, 0, 0, 1, 1,
-0.1126967, 0.8364563, 0.2409367, 1, 0, 0, 1, 1,
-0.1122197, -1.175588, -3.821218, 1, 0, 0, 1, 1,
-0.1118494, -1.765758, -0.8844409, 1, 0, 0, 1, 1,
-0.1100862, -0.7850149, -1.572289, 0, 0, 0, 1, 1,
-0.1055878, 1.004686, 0.9605505, 0, 0, 0, 1, 1,
-0.101941, 0.256649, -0.1937488, 0, 0, 0, 1, 1,
-0.1016233, 1.174016, 0.1976312, 0, 0, 0, 1, 1,
-0.0964447, -1.044128, -2.644245, 0, 0, 0, 1, 1,
-0.09133696, -1.355052, -2.143398, 0, 0, 0, 1, 1,
-0.09040275, -0.3184261, -1.620157, 0, 0, 0, 1, 1,
-0.08629855, -0.9002588, -3.329548, 1, 1, 1, 1, 1,
-0.08568579, 0.2415159, -0.1696445, 1, 1, 1, 1, 1,
-0.08089845, -0.6012703, -3.984814, 1, 1, 1, 1, 1,
-0.0803678, 0.6257217, 0.546599, 1, 1, 1, 1, 1,
-0.07739294, -1.261019, -3.191059, 1, 1, 1, 1, 1,
-0.07194489, 0.03192034, -0.01781129, 1, 1, 1, 1, 1,
-0.07135727, 0.7849392, 0.1896062, 1, 1, 1, 1, 1,
-0.07014656, 0.5641484, 0.5949487, 1, 1, 1, 1, 1,
-0.05893109, 0.7137287, -0.3064491, 1, 1, 1, 1, 1,
-0.05618316, 0.6074333, -1.238169, 1, 1, 1, 1, 1,
-0.05594123, 0.7474481, 0.3368493, 1, 1, 1, 1, 1,
-0.05555454, 0.7076835, 0.6864077, 1, 1, 1, 1, 1,
-0.05165116, 0.3669908, -0.8584273, 1, 1, 1, 1, 1,
-0.04863049, -0.5240417, -5.275782, 1, 1, 1, 1, 1,
-0.04777263, -0.5415319, -3.025914, 1, 1, 1, 1, 1,
-0.04110888, 0.5516708, -0.3238318, 0, 0, 1, 1, 1,
-0.04041716, -0.05270099, -1.431311, 1, 0, 0, 1, 1,
-0.03717766, 0.4690195, -0.220903, 1, 0, 0, 1, 1,
-0.0364124, -1.506665, -2.947199, 1, 0, 0, 1, 1,
-0.0344863, -0.852892, -2.741003, 1, 0, 0, 1, 1,
-0.03394702, 0.6308007, -1.183748, 1, 0, 0, 1, 1,
-0.03342691, -0.2060216, -3.534244, 0, 0, 0, 1, 1,
-0.0322658, 1.109239, -0.9733116, 0, 0, 0, 1, 1,
-0.02980257, 0.3984365, 1.697319, 0, 0, 0, 1, 1,
-0.02808737, -0.3657847, -2.430763, 0, 0, 0, 1, 1,
-0.02751151, -0.0268723, -1.898418, 0, 0, 0, 1, 1,
-0.02048752, -0.3175679, -4.804206, 0, 0, 0, 1, 1,
-0.01648065, 0.03906475, 1.076282, 0, 0, 0, 1, 1,
-0.0124286, -0.6467176, -2.110711, 1, 1, 1, 1, 1,
-0.009148781, -0.6269067, -4.243705, 1, 1, 1, 1, 1,
-0.006334904, 1.289046, -0.7986168, 1, 1, 1, 1, 1,
-0.004022707, -0.2953924, -2.779293, 1, 1, 1, 1, 1,
0.001705455, 0.8845154, 0.3296401, 1, 1, 1, 1, 1,
0.004132103, -0.2202045, 4.65614, 1, 1, 1, 1, 1,
0.004739596, 0.6913019, -1.515705, 1, 1, 1, 1, 1,
0.008059035, 1.256591, -2.716616, 1, 1, 1, 1, 1,
0.009092878, 0.8982385, -0.06888018, 1, 1, 1, 1, 1,
0.009974011, 1.525548, -0.3857628, 1, 1, 1, 1, 1,
0.01117576, 0.3036516, -0.3736905, 1, 1, 1, 1, 1,
0.01240605, -0.8239198, 5.177029, 1, 1, 1, 1, 1,
0.01253755, 0.7958575, 1.354507, 1, 1, 1, 1, 1,
0.01644223, 0.9013897, -0.9340437, 1, 1, 1, 1, 1,
0.01948452, 0.971596, 0.4547814, 1, 1, 1, 1, 1,
0.02159797, 0.9042386, 0.5891991, 0, 0, 1, 1, 1,
0.02250206, 0.5305334, 0.2939511, 1, 0, 0, 1, 1,
0.02600472, 2.416588, 0.7437469, 1, 0, 0, 1, 1,
0.02632009, -1.321436, 3.031296, 1, 0, 0, 1, 1,
0.02712785, -1.548802, 1.810486, 1, 0, 0, 1, 1,
0.03018754, 0.7447471, 0.2305517, 1, 0, 0, 1, 1,
0.03065492, 0.8781048, 0.984489, 0, 0, 0, 1, 1,
0.03101494, -1.10204, 3.432247, 0, 0, 0, 1, 1,
0.03176641, -0.5599728, 3.001233, 0, 0, 0, 1, 1,
0.03349617, 0.8430092, 0.7060096, 0, 0, 0, 1, 1,
0.04615371, -1.78017, 2.271072, 0, 0, 0, 1, 1,
0.05310161, 0.3265759, 1.395646, 0, 0, 0, 1, 1,
0.05764583, 0.1529654, 0.1663229, 0, 0, 0, 1, 1,
0.05822492, -0.1664038, 4.278769, 1, 1, 1, 1, 1,
0.06127812, -1.245717, 1.376723, 1, 1, 1, 1, 1,
0.06191677, -0.6685932, 3.005895, 1, 1, 1, 1, 1,
0.06258447, 0.680766, 0.9561459, 1, 1, 1, 1, 1,
0.06390279, -1.535204, 3.13976, 1, 1, 1, 1, 1,
0.06479562, -0.4762067, 2.609319, 1, 1, 1, 1, 1,
0.06550435, -0.2553523, 0.4598718, 1, 1, 1, 1, 1,
0.06577721, 1.820886, 0.1983894, 1, 1, 1, 1, 1,
0.06697606, -0.1203333, 3.396405, 1, 1, 1, 1, 1,
0.06738079, 1.739923, -1.139701, 1, 1, 1, 1, 1,
0.067623, -0.03557576, 2.274819, 1, 1, 1, 1, 1,
0.06885458, -1.187907, 2.528603, 1, 1, 1, 1, 1,
0.07188656, -0.7435457, 2.778774, 1, 1, 1, 1, 1,
0.07317092, 0.4402057, 0.3445058, 1, 1, 1, 1, 1,
0.07649221, 0.3041866, -1.622912, 1, 1, 1, 1, 1,
0.07682603, 0.1756909, 2.408669, 0, 0, 1, 1, 1,
0.08312351, -1.48296, 3.181836, 1, 0, 0, 1, 1,
0.08495723, 1.378949, -0.5933796, 1, 0, 0, 1, 1,
0.0904442, -0.9729279, 3.57571, 1, 0, 0, 1, 1,
0.09264871, 1.245889, 0.2218659, 1, 0, 0, 1, 1,
0.09629691, -0.1439103, 3.029956, 1, 0, 0, 1, 1,
0.1013446, -0.1685979, 3.342575, 0, 0, 0, 1, 1,
0.1016673, 0.3148572, 0.5030996, 0, 0, 0, 1, 1,
0.1041536, 0.8219267, 0.8134468, 0, 0, 0, 1, 1,
0.1085555, 0.6883696, -0.2040199, 0, 0, 0, 1, 1,
0.1099001, 0.868007, -0.02336091, 0, 0, 0, 1, 1,
0.1104119, 0.124312, 0.8490123, 0, 0, 0, 1, 1,
0.1108423, -1.223336, 0.5124338, 0, 0, 0, 1, 1,
0.1127888, -1.226958, 3.965472, 1, 1, 1, 1, 1,
0.1144506, 1.482118, 0.01373939, 1, 1, 1, 1, 1,
0.1182916, 1.029156, -1.223168, 1, 1, 1, 1, 1,
0.1195225, 1.098402, -0.3228417, 1, 1, 1, 1, 1,
0.1250813, 0.7772105, -0.2263057, 1, 1, 1, 1, 1,
0.1253135, -1.226361, 3.589556, 1, 1, 1, 1, 1,
0.127474, 0.2425289, 0.6220387, 1, 1, 1, 1, 1,
0.1280951, 1.191212, 0.09836309, 1, 1, 1, 1, 1,
0.1282833, -0.4397467, 3.085254, 1, 1, 1, 1, 1,
0.1336512, 1.975094, -0.2875665, 1, 1, 1, 1, 1,
0.1418763, 0.0915116, -0.5579768, 1, 1, 1, 1, 1,
0.146481, 0.8731465, 0.8417234, 1, 1, 1, 1, 1,
0.1470966, 0.7285375, 0.9812753, 1, 1, 1, 1, 1,
0.1501196, -0.2796032, 2.438581, 1, 1, 1, 1, 1,
0.1502646, -0.1742492, 1.783366, 1, 1, 1, 1, 1,
0.1512913, 0.7090722, 0.391609, 0, 0, 1, 1, 1,
0.1528905, 1.095124, 1.416474, 1, 0, 0, 1, 1,
0.1543974, 0.6773872, 0.2869172, 1, 0, 0, 1, 1,
0.1559229, -0.6390978, 3.895935, 1, 0, 0, 1, 1,
0.1641405, -2.732228, 3.929559, 1, 0, 0, 1, 1,
0.1679482, 0.9379756, -0.3944484, 1, 0, 0, 1, 1,
0.1714747, 1.222877, 0.8160533, 0, 0, 0, 1, 1,
0.1739313, -0.3229819, 2.038465, 0, 0, 0, 1, 1,
0.1800499, -0.4065949, 1.353399, 0, 0, 0, 1, 1,
0.1822541, -0.482639, 4.103635, 0, 0, 0, 1, 1,
0.1857433, 0.2119492, 0.01174618, 0, 0, 0, 1, 1,
0.1918254, 0.3236058, -0.05578415, 0, 0, 0, 1, 1,
0.192292, 1.094841, -0.06984746, 0, 0, 0, 1, 1,
0.1931082, -1.168408, 2.790145, 1, 1, 1, 1, 1,
0.1932477, -1.124992, 0.9820365, 1, 1, 1, 1, 1,
0.1951895, 0.2803768, 0.8335408, 1, 1, 1, 1, 1,
0.1959647, 1.509916, 1.474317, 1, 1, 1, 1, 1,
0.2058674, -1.692636, 2.867379, 1, 1, 1, 1, 1,
0.2072843, -1.275793, 2.551254, 1, 1, 1, 1, 1,
0.2074222, 1.626047, 1.86945, 1, 1, 1, 1, 1,
0.2079063, 0.0606565, 1.114239, 1, 1, 1, 1, 1,
0.2089029, -0.2405228, 1.617659, 1, 1, 1, 1, 1,
0.2149154, 0.343364, 0.6930605, 1, 1, 1, 1, 1,
0.2171262, -1.246889, 3.255785, 1, 1, 1, 1, 1,
0.2228919, 0.2009031, 0.4080757, 1, 1, 1, 1, 1,
0.2269785, 0.3688254, -0.5497681, 1, 1, 1, 1, 1,
0.227972, 0.1943705, 1.59089, 1, 1, 1, 1, 1,
0.2309694, -0.2109111, 0.8902919, 1, 1, 1, 1, 1,
0.2369646, 0.6545342, 0.8629783, 0, 0, 1, 1, 1,
0.2390602, 0.8165948, 0.6140822, 1, 0, 0, 1, 1,
0.2431596, -0.8541782, 3.434098, 1, 0, 0, 1, 1,
0.2443553, -0.3218805, 1.318569, 1, 0, 0, 1, 1,
0.2494616, -1.464875, 3.661086, 1, 0, 0, 1, 1,
0.2560433, 1.545478, 0.6481962, 1, 0, 0, 1, 1,
0.260641, -0.1447728, 1.159022, 0, 0, 0, 1, 1,
0.2606834, -0.4450295, 1.464979, 0, 0, 0, 1, 1,
0.2622391, -2.056275, 2.373066, 0, 0, 0, 1, 1,
0.2647786, -0.3254598, 3.2891, 0, 0, 0, 1, 1,
0.2662702, -0.285161, 2.299095, 0, 0, 0, 1, 1,
0.2708315, -1.088006, 4.356974, 0, 0, 0, 1, 1,
0.2715554, -0.4720849, 4.07809, 0, 0, 0, 1, 1,
0.2735204, 0.918556, -0.8143259, 1, 1, 1, 1, 1,
0.2807188, 0.4973581, 1.967648, 1, 1, 1, 1, 1,
0.2839039, -0.4949338, 2.715906, 1, 1, 1, 1, 1,
0.285112, 0.9059926, 1.060508, 1, 1, 1, 1, 1,
0.2851377, -0.0254529, 2.384379, 1, 1, 1, 1, 1,
0.2867889, 0.6459458, 0.6341949, 1, 1, 1, 1, 1,
0.2900889, 0.8705879, 0.6181746, 1, 1, 1, 1, 1,
0.2919601, -0.4875703, 2.047448, 1, 1, 1, 1, 1,
0.2970602, -0.03282298, 3.056512, 1, 1, 1, 1, 1,
0.2990566, 2.472985, -0.7082927, 1, 1, 1, 1, 1,
0.3008464, 0.3371481, 0.6409675, 1, 1, 1, 1, 1,
0.3029237, 1.417085, 2.470387, 1, 1, 1, 1, 1,
0.31051, -0.8929713, 1.98229, 1, 1, 1, 1, 1,
0.3231409, 0.7570519, 1.17605, 1, 1, 1, 1, 1,
0.3233125, 1.513595, -0.01465582, 1, 1, 1, 1, 1,
0.3246517, -0.9032761, 4.206583, 0, 0, 1, 1, 1,
0.3252337, -0.2305684, 0.8217826, 1, 0, 0, 1, 1,
0.3285733, 0.7732509, 0.5300937, 1, 0, 0, 1, 1,
0.3298064, -0.02247007, 1.842564, 1, 0, 0, 1, 1,
0.3319067, 0.07901553, 2.451959, 1, 0, 0, 1, 1,
0.3324077, 0.673427, 0.8264346, 1, 0, 0, 1, 1,
0.3333539, 0.5124628, 0.6555691, 0, 0, 0, 1, 1,
0.3362252, 0.1315575, 1.678977, 0, 0, 0, 1, 1,
0.3380421, 0.6288506, -0.4608577, 0, 0, 0, 1, 1,
0.3397335, -1.843459, 2.73892, 0, 0, 0, 1, 1,
0.3438175, -0.9426404, 2.531687, 0, 0, 0, 1, 1,
0.3480004, 1.880746, -1.004658, 0, 0, 0, 1, 1,
0.3532831, 1.975301, -0.5094374, 0, 0, 0, 1, 1,
0.3550061, -1.541946, 2.405068, 1, 1, 1, 1, 1,
0.3558183, -0.6346719, 0.9424821, 1, 1, 1, 1, 1,
0.3626688, 1.24843, -0.6620736, 1, 1, 1, 1, 1,
0.3630484, 0.6207512, 0.9681825, 1, 1, 1, 1, 1,
0.3680224, -1.414721, 2.746801, 1, 1, 1, 1, 1,
0.3696175, 2.68804, -0.6320493, 1, 1, 1, 1, 1,
0.3706501, 2.014311, -0.1950822, 1, 1, 1, 1, 1,
0.3709013, 0.05269242, 1.563345, 1, 1, 1, 1, 1,
0.3728556, -1.66625, 4.006573, 1, 1, 1, 1, 1,
0.3799004, -1.258936, 3.189948, 1, 1, 1, 1, 1,
0.3917272, -1.777599, 4.682388, 1, 1, 1, 1, 1,
0.396867, -0.03111357, 1.306833, 1, 1, 1, 1, 1,
0.4059135, 0.3888009, -0.6592135, 1, 1, 1, 1, 1,
0.4067666, 0.01280866, 3.529295, 1, 1, 1, 1, 1,
0.4141889, -0.206862, 0.9454652, 1, 1, 1, 1, 1,
0.4218875, -0.5604917, 3.754433, 0, 0, 1, 1, 1,
0.4258152, -1.095274, 3.907534, 1, 0, 0, 1, 1,
0.4271188, 0.5568298, 1.877845, 1, 0, 0, 1, 1,
0.4312987, 1.497798, 0.9069343, 1, 0, 0, 1, 1,
0.4337296, 0.4412607, 1.070858, 1, 0, 0, 1, 1,
0.4445271, 0.4201423, 2.298557, 1, 0, 0, 1, 1,
0.4460929, -0.4977959, 0.6179211, 0, 0, 0, 1, 1,
0.4471326, 0.009718565, 1.35857, 0, 0, 0, 1, 1,
0.4481368, 0.8717059, 1.663231, 0, 0, 0, 1, 1,
0.4486592, 0.0473451, 2.291733, 0, 0, 0, 1, 1,
0.454077, 0.5434827, 1.288468, 0, 0, 0, 1, 1,
0.4611828, 1.149846, -0.8057671, 0, 0, 0, 1, 1,
0.4697129, 0.1512856, 0.9399835, 0, 0, 0, 1, 1,
0.4736246, 1.300824, 0.8584213, 1, 1, 1, 1, 1,
0.4787475, 1.196468, 0.04665092, 1, 1, 1, 1, 1,
0.4788423, -0.5638798, 2.713966, 1, 1, 1, 1, 1,
0.4817659, -2.780087, 3.973372, 1, 1, 1, 1, 1,
0.4825291, 1.509184, -0.9003531, 1, 1, 1, 1, 1,
0.4828784, 2.313566, 0.1726846, 1, 1, 1, 1, 1,
0.4842101, -0.1680043, 1.871476, 1, 1, 1, 1, 1,
0.4855237, -1.124003, 4.713201, 1, 1, 1, 1, 1,
0.4863792, 2.287328, -0.6425379, 1, 1, 1, 1, 1,
0.4865037, 1.017866, -0.5032977, 1, 1, 1, 1, 1,
0.4867153, -0.1360197, 3.136377, 1, 1, 1, 1, 1,
0.4868351, 1.321851, 0.9375293, 1, 1, 1, 1, 1,
0.4890109, 0.7949127, 1.160571, 1, 1, 1, 1, 1,
0.4917775, 0.2130975, 1.657478, 1, 1, 1, 1, 1,
0.4986367, 0.1405243, 0.750147, 1, 1, 1, 1, 1,
0.4993369, -0.6421591, 3.505803, 0, 0, 1, 1, 1,
0.5053562, 1.595667, 1.287531, 1, 0, 0, 1, 1,
0.5065148, 1.119168, 2.929432, 1, 0, 0, 1, 1,
0.5096423, -0.8581533, 4.064373, 1, 0, 0, 1, 1,
0.5140738, 0.3766778, 1.467821, 1, 0, 0, 1, 1,
0.5161588, 0.7827749, -0.5261247, 1, 0, 0, 1, 1,
0.5186185, 1.313381, 1.01465, 0, 0, 0, 1, 1,
0.5235655, -0.3242356, 2.227095, 0, 0, 0, 1, 1,
0.5248356, 0.01961143, 3.240697, 0, 0, 0, 1, 1,
0.5287318, -0.8226432, 2.630507, 0, 0, 0, 1, 1,
0.530767, -0.1836611, 0.779613, 0, 0, 0, 1, 1,
0.5328799, 0.3400881, 0.4000993, 0, 0, 0, 1, 1,
0.5371178, 1.224452, -1.23727, 0, 0, 0, 1, 1,
0.5486689, 0.2762943, 1.3803, 1, 1, 1, 1, 1,
0.5492371, 2.008501, 0.7339931, 1, 1, 1, 1, 1,
0.5506437, -1.036003, 2.406212, 1, 1, 1, 1, 1,
0.5515205, -0.8443292, 1.800021, 1, 1, 1, 1, 1,
0.557963, 0.4959606, 1.476856, 1, 1, 1, 1, 1,
0.5588424, 0.3325136, 1.787125, 1, 1, 1, 1, 1,
0.5588796, 0.99554, 0.2014204, 1, 1, 1, 1, 1,
0.5596333, 0.2924811, 1.264187, 1, 1, 1, 1, 1,
0.5609862, -0.5367435, 2.044798, 1, 1, 1, 1, 1,
0.5619164, -1.438941, 1.850758, 1, 1, 1, 1, 1,
0.564837, 0.2841332, 0.9428754, 1, 1, 1, 1, 1,
0.5666749, -1.478602, 3.861426, 1, 1, 1, 1, 1,
0.5711333, -0.9326277, 0.4161124, 1, 1, 1, 1, 1,
0.5744087, -0.8953362, 0.7169184, 1, 1, 1, 1, 1,
0.5790096, 1.424216, 1.257335, 1, 1, 1, 1, 1,
0.5889097, -0.7735701, 4.119606, 0, 0, 1, 1, 1,
0.5938221, 0.7696271, 0.4004871, 1, 0, 0, 1, 1,
0.5956964, -0.01120884, 0.7769828, 1, 0, 0, 1, 1,
0.5977285, -0.08947744, 1.379546, 1, 0, 0, 1, 1,
0.5985402, -0.3423737, 0.8970654, 1, 0, 0, 1, 1,
0.5998065, 1.072448, 1.149209, 1, 0, 0, 1, 1,
0.6010591, -0.805979, 1.026909, 0, 0, 0, 1, 1,
0.604265, 1.334662, -1.523052, 0, 0, 0, 1, 1,
0.6042666, -0.7189931, 2.566126, 0, 0, 0, 1, 1,
0.6043909, 0.1126292, 0.3287723, 0, 0, 0, 1, 1,
0.6073576, -0.536245, 4.614439, 0, 0, 0, 1, 1,
0.6099315, 1.767423, 0.2902031, 0, 0, 0, 1, 1,
0.6119296, -1.198542, 2.834239, 0, 0, 0, 1, 1,
0.6128398, 0.392576, 1.209198, 1, 1, 1, 1, 1,
0.6151958, 1.568072, 0.1611015, 1, 1, 1, 1, 1,
0.6205202, 1.506314, 2.938102, 1, 1, 1, 1, 1,
0.6217289, -1.343377, 2.410218, 1, 1, 1, 1, 1,
0.6230397, -0.4434585, 1.916175, 1, 1, 1, 1, 1,
0.6234426, -0.5099272, 3.490492, 1, 1, 1, 1, 1,
0.6241706, -1.831245, 3.312367, 1, 1, 1, 1, 1,
0.6259786, -0.1313482, 0.5242825, 1, 1, 1, 1, 1,
0.6310654, 1.024359, -0.5459476, 1, 1, 1, 1, 1,
0.6343213, 0.04506684, 3.22543, 1, 1, 1, 1, 1,
0.6414467, -1.166721, 3.735052, 1, 1, 1, 1, 1,
0.6449451, 0.6683786, 1.451256, 1, 1, 1, 1, 1,
0.6490991, 0.8847747, 0.5186524, 1, 1, 1, 1, 1,
0.6498501, 1.154538, 0.1068461, 1, 1, 1, 1, 1,
0.6507038, -1.092142, 1.934129, 1, 1, 1, 1, 1,
0.6515239, -0.6050447, 2.843572, 0, 0, 1, 1, 1,
0.6548332, -0.09361801, 1.76373, 1, 0, 0, 1, 1,
0.660542, 0.9877564, 1.027007, 1, 0, 0, 1, 1,
0.6613659, 0.268664, -0.2144577, 1, 0, 0, 1, 1,
0.661914, 1.775464, 0.8766082, 1, 0, 0, 1, 1,
0.6674163, -0.006971288, 2.789557, 1, 0, 0, 1, 1,
0.6734755, -0.09504923, 0.2335251, 0, 0, 0, 1, 1,
0.6754906, -0.7141886, 2.148596, 0, 0, 0, 1, 1,
0.6763865, -1.086609, 3.124107, 0, 0, 0, 1, 1,
0.6795293, 0.1989378, 0.319461, 0, 0, 0, 1, 1,
0.6807479, 1.626548, -0.6395066, 0, 0, 0, 1, 1,
0.6845956, -1.17793, 1.770248, 0, 0, 0, 1, 1,
0.68822, -0.6990079, 3.246942, 0, 0, 0, 1, 1,
0.688832, -0.3354275, 2.626645, 1, 1, 1, 1, 1,
0.6961929, -1.442662, 1.046447, 1, 1, 1, 1, 1,
0.6976928, -0.8218711, 3.690978, 1, 1, 1, 1, 1,
0.6981557, 0.836735, 0.3213496, 1, 1, 1, 1, 1,
0.7029318, 0.1170359, 1.814565, 1, 1, 1, 1, 1,
0.7092444, 1.464306, -0.1577623, 1, 1, 1, 1, 1,
0.7207005, -1.06885, 3.064278, 1, 1, 1, 1, 1,
0.7256386, 0.1978078, 1.023424, 1, 1, 1, 1, 1,
0.7281865, -0.3961864, 2.072523, 1, 1, 1, 1, 1,
0.7295784, -0.5351829, -0.5165397, 1, 1, 1, 1, 1,
0.7311785, -0.9825808, 3.731016, 1, 1, 1, 1, 1,
0.7329695, -1.587351, 2.92047, 1, 1, 1, 1, 1,
0.7369583, 0.417624, -0.3264128, 1, 1, 1, 1, 1,
0.7373752, -1.579475, 3.936885, 1, 1, 1, 1, 1,
0.7437171, -0.0470121, 1.48812, 1, 1, 1, 1, 1,
0.7441681, -0.8358607, 2.959922, 0, 0, 1, 1, 1,
0.7518183, 0.8849035, 0.6734728, 1, 0, 0, 1, 1,
0.7551075, 0.2184171, 1.809825, 1, 0, 0, 1, 1,
0.7560738, 0.005831704, 2.309296, 1, 0, 0, 1, 1,
0.7602446, 0.4033307, 0.2221456, 1, 0, 0, 1, 1,
0.7720489, 2.246247, 0.02651907, 1, 0, 0, 1, 1,
0.774142, -1.197417, 2.159757, 0, 0, 0, 1, 1,
0.7778311, 0.2343405, 0.934252, 0, 0, 0, 1, 1,
0.7781331, -0.9916347, 2.348087, 0, 0, 0, 1, 1,
0.7820441, 1.309911, 1.250912, 0, 0, 0, 1, 1,
0.7824776, 1.288683, 1.076278, 0, 0, 0, 1, 1,
0.7851928, 2.136865, 0.2532222, 0, 0, 0, 1, 1,
0.7859437, 1.277153, -0.1352386, 0, 0, 0, 1, 1,
0.7869986, -1.798391, 3.049914, 1, 1, 1, 1, 1,
0.8032986, 1.15546, -0.002902135, 1, 1, 1, 1, 1,
0.8074592, 0.9139925, -0.3084623, 1, 1, 1, 1, 1,
0.8104482, 0.9554859, 2.298124, 1, 1, 1, 1, 1,
0.8140715, -0.6396951, 2.88746, 1, 1, 1, 1, 1,
0.8188241, 0.2058631, -0.6105479, 1, 1, 1, 1, 1,
0.8254248, 0.7683944, 0.4028719, 1, 1, 1, 1, 1,
0.8264473, 0.3558598, 1.822497, 1, 1, 1, 1, 1,
0.8269978, -0.7194286, -0.07777379, 1, 1, 1, 1, 1,
0.8298869, -0.7184229, 0.8184124, 1, 1, 1, 1, 1,
0.8320518, 0.02927444, 1.060263, 1, 1, 1, 1, 1,
0.8325833, 0.1408156, 1.537355, 1, 1, 1, 1, 1,
0.8327439, -0.3868961, 2.365756, 1, 1, 1, 1, 1,
0.8342925, -0.1916782, 0.5884437, 1, 1, 1, 1, 1,
0.8379184, 0.1257948, 3.024939, 1, 1, 1, 1, 1,
0.8434874, -0.7558179, 1.402486, 0, 0, 1, 1, 1,
0.8441995, -0.0644334, 2.692552, 1, 0, 0, 1, 1,
0.8444239, -0.3175807, 2.941288, 1, 0, 0, 1, 1,
0.8538369, -0.5611067, 2.030437, 1, 0, 0, 1, 1,
0.8554339, -0.6236964, 1.955544, 1, 0, 0, 1, 1,
0.8567597, -1.255288, 2.999272, 1, 0, 0, 1, 1,
0.861457, -0.6798673, 1.391273, 0, 0, 0, 1, 1,
0.8653908, -0.2632742, 1.072593, 0, 0, 0, 1, 1,
0.8654839, 0.5746574, -0.1010001, 0, 0, 0, 1, 1,
0.8684111, -0.1823344, -0.3155748, 0, 0, 0, 1, 1,
0.8685813, 1.39762, 0.7034442, 0, 0, 0, 1, 1,
0.8712931, -0.4182555, 0.7683007, 0, 0, 0, 1, 1,
0.8744943, 0.6619678, 0.3234726, 0, 0, 0, 1, 1,
0.8777057, -1.013725, 1.746816, 1, 1, 1, 1, 1,
0.8844998, 0.7417915, 1.190639, 1, 1, 1, 1, 1,
0.887548, -0.8390529, 2.630932, 1, 1, 1, 1, 1,
0.8905852, 1.29167, 1.236132, 1, 1, 1, 1, 1,
0.8957829, 0.633759, 1.316296, 1, 1, 1, 1, 1,
0.8963035, 0.5949767, 0.01577196, 1, 1, 1, 1, 1,
0.9060605, 0.9891943, 2.007295, 1, 1, 1, 1, 1,
0.9063233, -1.051796, 4.161371, 1, 1, 1, 1, 1,
0.9073825, -1.386777, 0.9123327, 1, 1, 1, 1, 1,
0.9163128, -0.5404676, 4.197518, 1, 1, 1, 1, 1,
0.9298466, 0.1517254, 1.121755, 1, 1, 1, 1, 1,
0.9310659, 1.03056, 1.035919, 1, 1, 1, 1, 1,
0.9402878, -1.122848, 2.109821, 1, 1, 1, 1, 1,
0.9519077, -0.634503, 2.270656, 1, 1, 1, 1, 1,
0.9601016, 0.3718187, 1.203005, 1, 1, 1, 1, 1,
0.9623543, -1.038877, 1.960213, 0, 0, 1, 1, 1,
0.9696772, -1.052279, 2.147466, 1, 0, 0, 1, 1,
0.9754845, 0.2939757, 1.127253, 1, 0, 0, 1, 1,
0.9801845, -0.05719431, 1.753114, 1, 0, 0, 1, 1,
0.9839681, -0.5465111, 4.279838, 1, 0, 0, 1, 1,
0.991666, 0.7168033, 1.817016, 1, 0, 0, 1, 1,
0.9997547, -0.5832508, 1.688427, 0, 0, 0, 1, 1,
1.000087, 0.4174125, 1.999892, 0, 0, 0, 1, 1,
1.004081, -1.492603, 2.224778, 0, 0, 0, 1, 1,
1.006287, 0.9501214, 0.8876145, 0, 0, 0, 1, 1,
1.011148, -0.4162817, 3.064115, 0, 0, 0, 1, 1,
1.012252, 0.3130959, 1.200094, 0, 0, 0, 1, 1,
1.021043, 0.1984299, -0.6112185, 0, 0, 0, 1, 1,
1.024023, 0.01540841, 2.311882, 1, 1, 1, 1, 1,
1.02456, -0.02339001, 2.347241, 1, 1, 1, 1, 1,
1.025469, -0.3998494, 1.202856, 1, 1, 1, 1, 1,
1.02797, -0.4560825, 1.871888, 1, 1, 1, 1, 1,
1.036067, -0.4270476, 1.490798, 1, 1, 1, 1, 1,
1.044098, -1.263825, 2.754038, 1, 1, 1, 1, 1,
1.044229, 1.793674, 1.14752, 1, 1, 1, 1, 1,
1.046766, 0.2442609, 1.311634, 1, 1, 1, 1, 1,
1.050822, -2.844462, 3.536756, 1, 1, 1, 1, 1,
1.052193, -0.3241626, 0.6869982, 1, 1, 1, 1, 1,
1.054498, 0.2522975, 1.848348, 1, 1, 1, 1, 1,
1.057674, 0.8231403, 1.718557, 1, 1, 1, 1, 1,
1.071085, 0.1278137, 2.519694, 1, 1, 1, 1, 1,
1.077875, 1.299847, -0.9676552, 1, 1, 1, 1, 1,
1.07858, -2.086018, 3.355203, 1, 1, 1, 1, 1,
1.085017, 0.4843029, 3.339291, 0, 0, 1, 1, 1,
1.095467, 0.2813258, 1.045049, 1, 0, 0, 1, 1,
1.109086, -0.1133967, 1.285092, 1, 0, 0, 1, 1,
1.111387, 0.4371443, 0.5775713, 1, 0, 0, 1, 1,
1.111886, 0.7476195, 1.685586, 1, 0, 0, 1, 1,
1.130229, 0.08441402, 1.724226, 1, 0, 0, 1, 1,
1.13104, -2.806103, 1.308992, 0, 0, 0, 1, 1,
1.140754, 0.25456, 0.1713979, 0, 0, 0, 1, 1,
1.142632, -0.2272898, 2.149306, 0, 0, 0, 1, 1,
1.144421, 0.3349262, -0.2688435, 0, 0, 0, 1, 1,
1.151417, 0.1201215, 1.575965, 0, 0, 0, 1, 1,
1.159949, 1.505276, 1.738074, 0, 0, 0, 1, 1,
1.160131, 0.4063212, 1.638485, 0, 0, 0, 1, 1,
1.163993, 0.8605505, 0.8405431, 1, 1, 1, 1, 1,
1.171049, 0.4401897, 0.5304866, 1, 1, 1, 1, 1,
1.172353, -0.1217503, 2.242522, 1, 1, 1, 1, 1,
1.1776, 0.5127044, 0.8419862, 1, 1, 1, 1, 1,
1.177993, -2.537494, 0.888069, 1, 1, 1, 1, 1,
1.186453, 1.095897, -0.02511062, 1, 1, 1, 1, 1,
1.189134, -0.1924415, 3.312549, 1, 1, 1, 1, 1,
1.19654, 2.054766, 0.1642956, 1, 1, 1, 1, 1,
1.197289, -0.9676081, 2.41153, 1, 1, 1, 1, 1,
1.202176, -0.004719131, 1.45154, 1, 1, 1, 1, 1,
1.202991, 0.9682602, -0.1073506, 1, 1, 1, 1, 1,
1.206726, -1.961151, 2.597717, 1, 1, 1, 1, 1,
1.21495, 1.225904, 0.6994166, 1, 1, 1, 1, 1,
1.218156, -0.5838832, 0.9153137, 1, 1, 1, 1, 1,
1.218742, -1.21825, 2.212886, 1, 1, 1, 1, 1,
1.222585, -0.2941336, 3.20995, 0, 0, 1, 1, 1,
1.227397, -1.012439, 2.7136, 1, 0, 0, 1, 1,
1.227603, 0.2322312, 0.3421219, 1, 0, 0, 1, 1,
1.233229, 0.3569063, 2.145469, 1, 0, 0, 1, 1,
1.239214, 0.4135516, 1.436189, 1, 0, 0, 1, 1,
1.247722, -0.1382866, 0.1708397, 1, 0, 0, 1, 1,
1.248169, -1.72267, 3.22295, 0, 0, 0, 1, 1,
1.254845, -0.3237261, 0.6181065, 0, 0, 0, 1, 1,
1.259531, -0.5025792, 0.7859907, 0, 0, 0, 1, 1,
1.260925, -0.2533298, 4.238685, 0, 0, 0, 1, 1,
1.275514, 0.395575, 1.256122, 0, 0, 0, 1, 1,
1.294495, 0.2421806, -0.1277114, 0, 0, 0, 1, 1,
1.300423, 0.3155881, 0.004494745, 0, 0, 0, 1, 1,
1.309216, 0.7296546, 0.04994456, 1, 1, 1, 1, 1,
1.32628, -0.9562349, 1.836752, 1, 1, 1, 1, 1,
1.330591, -0.4636718, 2.291352, 1, 1, 1, 1, 1,
1.341711, -0.8181797, 2.408252, 1, 1, 1, 1, 1,
1.342958, 0.4911737, -1.171454, 1, 1, 1, 1, 1,
1.344581, -3.09851, 2.726338, 1, 1, 1, 1, 1,
1.352899, 0.1757593, 0.7492704, 1, 1, 1, 1, 1,
1.358573, -1.353946, 1.303304, 1, 1, 1, 1, 1,
1.361644, -1.390851, 2.940532, 1, 1, 1, 1, 1,
1.362241, -0.1589612, 2.263844, 1, 1, 1, 1, 1,
1.366742, 1.073403, 0.03181857, 1, 1, 1, 1, 1,
1.3714, 0.5779121, -0.03009427, 1, 1, 1, 1, 1,
1.381817, 0.07568685, 1.60731, 1, 1, 1, 1, 1,
1.383108, 0.6759859, 1.896317, 1, 1, 1, 1, 1,
1.38418, 0.8591748, 1.973938, 1, 1, 1, 1, 1,
1.38554, 0.9054071, -0.514425, 0, 0, 1, 1, 1,
1.391345, 1.484298, -0.2330639, 1, 0, 0, 1, 1,
1.395425, 1.268792, 1.388436, 1, 0, 0, 1, 1,
1.397298, -0.6636369, 3.787708, 1, 0, 0, 1, 1,
1.402595, -0.1510229, 0.5017748, 1, 0, 0, 1, 1,
1.407712, -1.838174, 3.816725, 1, 0, 0, 1, 1,
1.411874, 0.9787897, 2.506214, 0, 0, 0, 1, 1,
1.440438, -0.1931172, 2.687682, 0, 0, 0, 1, 1,
1.447409, -0.1971266, 2.690934, 0, 0, 0, 1, 1,
1.47398, 0.3801099, 1.533209, 0, 0, 0, 1, 1,
1.475384, -0.02505039, 2.801768, 0, 0, 0, 1, 1,
1.486426, -0.9051641, 0.4659033, 0, 0, 0, 1, 1,
1.497625, -0.4324766, 2.230921, 0, 0, 0, 1, 1,
1.500767, 0.04297027, 0.8610038, 1, 1, 1, 1, 1,
1.507291, -0.4245964, 1.565685, 1, 1, 1, 1, 1,
1.515183, 0.2220037, 1.933567, 1, 1, 1, 1, 1,
1.530815, -0.6221282, 1.778581, 1, 1, 1, 1, 1,
1.53817, 2.025644, 1.646285, 1, 1, 1, 1, 1,
1.538904, -0.7294179, 2.026777, 1, 1, 1, 1, 1,
1.544475, -0.436781, 1.251237, 1, 1, 1, 1, 1,
1.556461, 1.399388, 2.452199, 1, 1, 1, 1, 1,
1.578277, -0.8971049, 1.844761, 1, 1, 1, 1, 1,
1.578985, -0.6078932, 2.507571, 1, 1, 1, 1, 1,
1.607203, 0.667026, 1.637511, 1, 1, 1, 1, 1,
1.619593, -2.463004, 3.079254, 1, 1, 1, 1, 1,
1.629736, -1.780046, 3.115942, 1, 1, 1, 1, 1,
1.646125, 0.5002564, -0.1709466, 1, 1, 1, 1, 1,
1.646145, 1.376595, -1.738265, 1, 1, 1, 1, 1,
1.651655, 1.321497, -0.7752918, 0, 0, 1, 1, 1,
1.686928, 1.147729, 0.931601, 1, 0, 0, 1, 1,
1.702935, -0.3844831, 0.4051919, 1, 0, 0, 1, 1,
1.708118, -0.6203623, 1.254005, 1, 0, 0, 1, 1,
1.708981, -0.8904722, 1.310639, 1, 0, 0, 1, 1,
1.727721, -0.589025, 1.37531, 1, 0, 0, 1, 1,
1.765414, -0.9208779, 3.172235, 0, 0, 0, 1, 1,
1.76661, -0.2883028, 0.2159931, 0, 0, 0, 1, 1,
1.766751, -0.2113935, 1.339342, 0, 0, 0, 1, 1,
1.769456, -1.041923, 2.347826, 0, 0, 0, 1, 1,
1.771424, 0.00199067, 3.939921, 0, 0, 0, 1, 1,
1.778544, -0.06359808, 1.565432, 0, 0, 0, 1, 1,
1.789918, 0.07256254, 0.4203699, 0, 0, 0, 1, 1,
1.809061, 1.022411, 0.7868476, 1, 1, 1, 1, 1,
1.809205, -1.085729, 1.734716, 1, 1, 1, 1, 1,
1.80982, -1.879909, 2.827701, 1, 1, 1, 1, 1,
1.812891, -1.268949, 2.759943, 1, 1, 1, 1, 1,
1.816885, 0.3439559, 1.146932, 1, 1, 1, 1, 1,
1.822874, 0.05771809, 0.9329169, 1, 1, 1, 1, 1,
1.846268, 0.576007, 2.584976, 1, 1, 1, 1, 1,
1.857156, 0.5281099, 0.7358924, 1, 1, 1, 1, 1,
1.857328, -1.453737, 1.968522, 1, 1, 1, 1, 1,
1.865561, -0.6097553, 2.381752, 1, 1, 1, 1, 1,
1.907684, 0.5876675, 1.794573, 1, 1, 1, 1, 1,
1.938147, -1.962979, 1.80538, 1, 1, 1, 1, 1,
1.946854, -0.3240629, 0.5623644, 1, 1, 1, 1, 1,
1.968145, -0.8641427, 2.084015, 1, 1, 1, 1, 1,
1.996716, -0.7486362, 2.255679, 1, 1, 1, 1, 1,
2.036819, -0.2777409, 0.3751605, 0, 0, 1, 1, 1,
2.045175, 0.4218064, 1.8595, 1, 0, 0, 1, 1,
2.156928, -1.082449, 2.352204, 1, 0, 0, 1, 1,
2.215347, -0.879746, 1.298581, 1, 0, 0, 1, 1,
2.231297, 0.6153036, 2.641325, 1, 0, 0, 1, 1,
2.234574, -1.381127, 2.363135, 1, 0, 0, 1, 1,
2.247585, -0.1146911, 1.534632, 0, 0, 0, 1, 1,
2.269331, 0.1977315, 0.8888049, 0, 0, 0, 1, 1,
2.303933, 0.01453392, 0.939806, 0, 0, 0, 1, 1,
2.336332, -0.8129621, 1.879157, 0, 0, 0, 1, 1,
2.341793, 0.6262392, 1.495742, 0, 0, 0, 1, 1,
2.370294, -1.246235, 3.865626, 0, 0, 0, 1, 1,
2.413053, -0.6124071, 1.899871, 0, 0, 0, 1, 1,
2.453701, -0.1417712, 1.443839, 1, 1, 1, 1, 1,
2.465977, 0.2162774, 1.755627, 1, 1, 1, 1, 1,
2.481618, -0.6665481, 2.925024, 1, 1, 1, 1, 1,
2.534928, 0.6681053, -0.5259791, 1, 1, 1, 1, 1,
2.579723, -0.9521603, 1.962494, 1, 1, 1, 1, 1,
2.692198, -1.683529, 2.953233, 1, 1, 1, 1, 1,
3.026423, -1.818009, 3.213672, 1, 1, 1, 1, 1
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
var radius = 9.356854;
var distance = 32.86555;
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
mvMatrix.translate( 0.1536989, 0.1974981, 0.1209586 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.86555);
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