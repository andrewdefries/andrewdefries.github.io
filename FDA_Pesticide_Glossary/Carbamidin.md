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
-2.669218, -0.1467704, -0.7194443, 1, 0, 0, 1,
-2.655956, -0.2296974, 0.1309795, 1, 0.007843138, 0, 1,
-2.638586, -0.5688399, -2.48865, 1, 0.01176471, 0, 1,
-2.624773, 1.814592, -1.21059, 1, 0.01960784, 0, 1,
-2.59492, -1.052356, -1.98393, 1, 0.02352941, 0, 1,
-2.589533, 0.5536882, -0.3771758, 1, 0.03137255, 0, 1,
-2.575028, -0.03972393, -1.49306, 1, 0.03529412, 0, 1,
-2.436258, 2.529401, -1.586497, 1, 0.04313726, 0, 1,
-2.414166, -1.056981, -4.140404, 1, 0.04705882, 0, 1,
-2.383881, 0.2369125, -2.50997, 1, 0.05490196, 0, 1,
-2.364642, 0.5587935, -1.390384, 1, 0.05882353, 0, 1,
-2.306252, 0.0975764, -2.564262, 1, 0.06666667, 0, 1,
-2.303562, 0.3417798, -1.261251, 1, 0.07058824, 0, 1,
-2.253854, 0.5348573, -3.469247, 1, 0.07843138, 0, 1,
-2.245153, 1.830552, -2.251333, 1, 0.08235294, 0, 1,
-2.197104, 0.06621762, -0.6020676, 1, 0.09019608, 0, 1,
-2.189647, 0.4595458, -1.032058, 1, 0.09411765, 0, 1,
-2.138314, -1.758293, -0.9921369, 1, 0.1019608, 0, 1,
-2.132389, 0.9977418, -2.350448, 1, 0.1098039, 0, 1,
-2.119944, 0.6644409, -2.217424, 1, 0.1137255, 0, 1,
-2.082342, -0.8023699, -0.7665083, 1, 0.1215686, 0, 1,
-2.076868, -0.9740698, -2.725112, 1, 0.1254902, 0, 1,
-2.063317, 0.1161093, -2.386694, 1, 0.1333333, 0, 1,
-2.061128, 0.5067164, -2.199104, 1, 0.1372549, 0, 1,
-2.041348, 1.361424, 0.3174744, 1, 0.145098, 0, 1,
-2.004642, -0.1264081, -2.225567, 1, 0.1490196, 0, 1,
-1.993124, 0.6370515, -1.305304, 1, 0.1568628, 0, 1,
-1.96581, -0.03816233, -2.735818, 1, 0.1607843, 0, 1,
-1.884486, -0.04969351, -1.224408, 1, 0.1686275, 0, 1,
-1.855631, -0.8448131, -1.827154, 1, 0.172549, 0, 1,
-1.849485, -0.2615047, -0.9970405, 1, 0.1803922, 0, 1,
-1.843335, 0.7512105, 0.2761126, 1, 0.1843137, 0, 1,
-1.836802, -1.46947, -2.712976, 1, 0.1921569, 0, 1,
-1.827761, -1.257443, -4.177534, 1, 0.1960784, 0, 1,
-1.815345, 0.4284608, -0.6146609, 1, 0.2039216, 0, 1,
-1.790798, -1.569824, -0.2253896, 1, 0.2117647, 0, 1,
-1.786942, 1.508766, -0.7282809, 1, 0.2156863, 0, 1,
-1.754585, -2.262356, -3.521517, 1, 0.2235294, 0, 1,
-1.729317, 0.4070927, -2.24707, 1, 0.227451, 0, 1,
-1.716621, -1.016077, -2.599357, 1, 0.2352941, 0, 1,
-1.67839, 1.621907, -1.669372, 1, 0.2392157, 0, 1,
-1.651812, 1.024359, -2.300416, 1, 0.2470588, 0, 1,
-1.647574, -0.764955, -1.844334, 1, 0.2509804, 0, 1,
-1.613306, -2.241282, -1.594265, 1, 0.2588235, 0, 1,
-1.597459, 0.4383252, -1.544737, 1, 0.2627451, 0, 1,
-1.591041, 1.091356, -0.6422805, 1, 0.2705882, 0, 1,
-1.582162, 2.156403, -1.393859, 1, 0.2745098, 0, 1,
-1.576664, 1.529682, -1.475873, 1, 0.282353, 0, 1,
-1.570613, 1.204957, -0.7383783, 1, 0.2862745, 0, 1,
-1.562709, -0.9904009, -3.078951, 1, 0.2941177, 0, 1,
-1.558649, -0.09660085, -2.473489, 1, 0.3019608, 0, 1,
-1.555286, -0.5459683, -2.427481, 1, 0.3058824, 0, 1,
-1.547979, -1.224138, -4.53291, 1, 0.3137255, 0, 1,
-1.53526, 0.5966423, -1.552469, 1, 0.3176471, 0, 1,
-1.522559, -1.011992, -1.641331, 1, 0.3254902, 0, 1,
-1.516366, 0.7051783, -2.02528, 1, 0.3294118, 0, 1,
-1.504464, 0.6466051, -0.614036, 1, 0.3372549, 0, 1,
-1.499402, 0.496028, -1.507796, 1, 0.3411765, 0, 1,
-1.484813, -1.083322, -2.367768, 1, 0.3490196, 0, 1,
-1.480223, 0.2070536, -1.222738, 1, 0.3529412, 0, 1,
-1.480177, 0.9374291, -1.164652, 1, 0.3607843, 0, 1,
-1.47537, 1.127722, -0.5579675, 1, 0.3647059, 0, 1,
-1.468812, 1.194861, -0.4004898, 1, 0.372549, 0, 1,
-1.466435, -1.024248, -3.067464, 1, 0.3764706, 0, 1,
-1.459881, 0.878756, -1.037995, 1, 0.3843137, 0, 1,
-1.457483, -0.9910816, -3.201286, 1, 0.3882353, 0, 1,
-1.456548, 0.3848662, -3.698502, 1, 0.3960784, 0, 1,
-1.449761, 0.7582861, -0.7434219, 1, 0.4039216, 0, 1,
-1.445189, 1.166655, -2.69411, 1, 0.4078431, 0, 1,
-1.442949, 0.1136059, -1.872408, 1, 0.4156863, 0, 1,
-1.43067, 2.036276, -1.223054, 1, 0.4196078, 0, 1,
-1.429775, -1.188963, -1.058269, 1, 0.427451, 0, 1,
-1.42817, 0.5441295, 0.4462447, 1, 0.4313726, 0, 1,
-1.419399, -0.03961476, -0.2705083, 1, 0.4392157, 0, 1,
-1.416391, 0.699542, 0.5163997, 1, 0.4431373, 0, 1,
-1.407749, -0.0668716, -0.2597317, 1, 0.4509804, 0, 1,
-1.399811, -0.7651202, -1.724608, 1, 0.454902, 0, 1,
-1.397937, -1.925924, -2.167108, 1, 0.4627451, 0, 1,
-1.389557, 0.1555273, -0.7639854, 1, 0.4666667, 0, 1,
-1.386644, -1.557409, -3.378832, 1, 0.4745098, 0, 1,
-1.375821, -0.4492899, -2.78231, 1, 0.4784314, 0, 1,
-1.375656, -0.7344146, -3.497022, 1, 0.4862745, 0, 1,
-1.364775, 0.3127206, -1.338114, 1, 0.4901961, 0, 1,
-1.362998, 0.1206924, -0.7981012, 1, 0.4980392, 0, 1,
-1.360121, 0.7052683, -1.404097, 1, 0.5058824, 0, 1,
-1.339949, -2.397708, -4.659599, 1, 0.509804, 0, 1,
-1.339154, 0.5961917, -3.006119, 1, 0.5176471, 0, 1,
-1.320901, 1.571045, -0.677045, 1, 0.5215687, 0, 1,
-1.302517, -0.2639047, -1.947154, 1, 0.5294118, 0, 1,
-1.291961, -0.09179667, -1.399551, 1, 0.5333334, 0, 1,
-1.286754, 0.5305805, 0.1853235, 1, 0.5411765, 0, 1,
-1.278455, 0.6817118, -0.3413505, 1, 0.5450981, 0, 1,
-1.275009, -0.2182604, -2.959132, 1, 0.5529412, 0, 1,
-1.272671, -1.651007, -2.460142, 1, 0.5568628, 0, 1,
-1.269777, 0.5454397, -0.1168719, 1, 0.5647059, 0, 1,
-1.26914, 0.0900141, -1.520057, 1, 0.5686275, 0, 1,
-1.266135, 1.165842, -2.009166, 1, 0.5764706, 0, 1,
-1.266101, 0.5900294, -0.6936877, 1, 0.5803922, 0, 1,
-1.264295, 1.329458, -1.007509, 1, 0.5882353, 0, 1,
-1.241272, 0.8906736, 0.7388447, 1, 0.5921569, 0, 1,
-1.23648, -0.9968625, -2.083114, 1, 0.6, 0, 1,
-1.230953, 0.5148513, -2.254486, 1, 0.6078432, 0, 1,
-1.214365, -0.6236629, -2.430585, 1, 0.6117647, 0, 1,
-1.213685, 0.916248, -2.093551, 1, 0.6196079, 0, 1,
-1.208431, -1.409044, -3.195825, 1, 0.6235294, 0, 1,
-1.205668, 0.6230525, 0.5116085, 1, 0.6313726, 0, 1,
-1.187619, 0.9600796, -0.9072502, 1, 0.6352941, 0, 1,
-1.17754, 1.195961, -0.4344263, 1, 0.6431373, 0, 1,
-1.177138, 0.2200857, -0.8920801, 1, 0.6470588, 0, 1,
-1.177032, 1.618734, 0.9916856, 1, 0.654902, 0, 1,
-1.175763, 1.062933, -0.4497536, 1, 0.6588235, 0, 1,
-1.16836, -1.178114, -2.873946, 1, 0.6666667, 0, 1,
-1.163161, 0.5658521, -0.9862295, 1, 0.6705883, 0, 1,
-1.16268, -0.1589193, -2.194, 1, 0.6784314, 0, 1,
-1.152896, -0.3455719, -2.148647, 1, 0.682353, 0, 1,
-1.152843, -0.05695603, -1.587227, 1, 0.6901961, 0, 1,
-1.14708, -0.5099909, -4.106977, 1, 0.6941177, 0, 1,
-1.137386, -0.7377151, -1.836483, 1, 0.7019608, 0, 1,
-1.13515, 0.4205483, -2.527531, 1, 0.7098039, 0, 1,
-1.133945, -0.2315057, -2.004176, 1, 0.7137255, 0, 1,
-1.133709, 1.109932, 0.1375495, 1, 0.7215686, 0, 1,
-1.119086, 1.248034, 1.477155, 1, 0.7254902, 0, 1,
-1.1096, -1.317508, -0.5696064, 1, 0.7333333, 0, 1,
-1.099427, -0.4751259, -0.2591891, 1, 0.7372549, 0, 1,
-1.097108, -0.06227507, -2.297588, 1, 0.7450981, 0, 1,
-1.094728, -0.3778588, -3.510016, 1, 0.7490196, 0, 1,
-1.090984, -0.124788, 0.0198795, 1, 0.7568628, 0, 1,
-1.089827, 0.860031, -1.609603, 1, 0.7607843, 0, 1,
-1.081312, 1.361893, -2.120293, 1, 0.7686275, 0, 1,
-1.081092, -0.4464053, -1.829963, 1, 0.772549, 0, 1,
-1.073642, 0.4187303, 0.4345975, 1, 0.7803922, 0, 1,
-1.068931, 1.891114, 0.1976361, 1, 0.7843137, 0, 1,
-1.066634, -1.913411, -2.462395, 1, 0.7921569, 0, 1,
-1.059408, 2.343014, 0.05782086, 1, 0.7960784, 0, 1,
-1.057897, -0.51397, -0.4596232, 1, 0.8039216, 0, 1,
-1.057594, 1.610189, 0.3012322, 1, 0.8117647, 0, 1,
-1.0566, 0.7930981, -1.676817, 1, 0.8156863, 0, 1,
-1.052484, -1.264239, -3.617459, 1, 0.8235294, 0, 1,
-1.052259, 0.7230495, -2.432909, 1, 0.827451, 0, 1,
-1.049446, -1.780807, -2.008037, 1, 0.8352941, 0, 1,
-1.037638, 0.006417386, -0.7077387, 1, 0.8392157, 0, 1,
-1.033816, 1.281633, -1.207471, 1, 0.8470588, 0, 1,
-1.027132, -0.799348, -0.9277868, 1, 0.8509804, 0, 1,
-1.019521, 0.9049006, -1.336087, 1, 0.8588235, 0, 1,
-1.017226, 0.6106505, -0.8299811, 1, 0.8627451, 0, 1,
-1.015492, -0.6621683, -2.014708, 1, 0.8705882, 0, 1,
-1.011466, -1.572335, -2.566244, 1, 0.8745098, 0, 1,
-1.00097, -1.182913, -2.931549, 1, 0.8823529, 0, 1,
-0.9989872, -1.494793, -2.277667, 1, 0.8862745, 0, 1,
-0.9974307, 1.422835, -0.3430252, 1, 0.8941177, 0, 1,
-0.9973667, -0.1082715, -0.5657805, 1, 0.8980392, 0, 1,
-0.9968505, 0.8480422, -0.2570744, 1, 0.9058824, 0, 1,
-0.9945918, -0.5756837, -2.032205, 1, 0.9137255, 0, 1,
-0.9902529, -0.4596325, -0.2357121, 1, 0.9176471, 0, 1,
-0.9880402, -1.537384, -4.909739, 1, 0.9254902, 0, 1,
-0.9878164, 0.5797283, 0.4570836, 1, 0.9294118, 0, 1,
-0.9827711, -0.6197931, -2.755578, 1, 0.9372549, 0, 1,
-0.9827305, 0.832994, 0.8083062, 1, 0.9411765, 0, 1,
-0.9811481, 1.045801, -0.6387378, 1, 0.9490196, 0, 1,
-0.979907, -0.7597547, -0.681505, 1, 0.9529412, 0, 1,
-0.9790807, 0.4949903, -1.172561, 1, 0.9607843, 0, 1,
-0.975037, 0.4970895, -0.8847943, 1, 0.9647059, 0, 1,
-0.9741529, -0.188168, -1.880167, 1, 0.972549, 0, 1,
-0.9710604, -0.1586441, -0.5934643, 1, 0.9764706, 0, 1,
-0.9710274, 0.2777635, 0.8448797, 1, 0.9843137, 0, 1,
-0.9665231, 1.496817, -1.559286, 1, 0.9882353, 0, 1,
-0.9553356, 0.05098045, -1.222357, 1, 0.9960784, 0, 1,
-0.951193, 0.8500675, 1.599772, 0.9960784, 1, 0, 1,
-0.9349117, 0.2406919, -0.2946962, 0.9921569, 1, 0, 1,
-0.9327572, 1.511546, -0.4721324, 0.9843137, 1, 0, 1,
-0.9279397, -1.86395, -4.005447, 0.9803922, 1, 0, 1,
-0.9241611, -0.1455317, -1.73532, 0.972549, 1, 0, 1,
-0.9232064, 0.9063124, -0.1948716, 0.9686275, 1, 0, 1,
-0.9230095, -0.3763301, -0.7348889, 0.9607843, 1, 0, 1,
-0.9227766, -0.8153774, -2.538867, 0.9568627, 1, 0, 1,
-0.9147618, 0.1758475, 0.2218212, 0.9490196, 1, 0, 1,
-0.9105072, 0.5940318, -1.793982, 0.945098, 1, 0, 1,
-0.9092115, -0.9253126, -2.271811, 0.9372549, 1, 0, 1,
-0.9090067, -1.58883, -2.501232, 0.9333333, 1, 0, 1,
-0.9072609, -0.4067736, -0.8836603, 0.9254902, 1, 0, 1,
-0.9064984, -1.311244, -4.298131, 0.9215686, 1, 0, 1,
-0.9005859, 0.5783297, -2.263532, 0.9137255, 1, 0, 1,
-0.8993104, 0.9298643, -1.147596, 0.9098039, 1, 0, 1,
-0.8978922, 0.7467454, -2.471571, 0.9019608, 1, 0, 1,
-0.8977998, -0.7537476, -2.489186, 0.8941177, 1, 0, 1,
-0.8950216, 0.7621338, 0.2606435, 0.8901961, 1, 0, 1,
-0.8930097, 0.4100866, 1.960065, 0.8823529, 1, 0, 1,
-0.8889561, 2.366782, 0.7820632, 0.8784314, 1, 0, 1,
-0.8804629, 1.701847, -2.14171, 0.8705882, 1, 0, 1,
-0.8761501, 0.2628014, -0.7812775, 0.8666667, 1, 0, 1,
-0.8671438, 0.6028726, -1.805448, 0.8588235, 1, 0, 1,
-0.8671335, 0.01186543, -0.8809199, 0.854902, 1, 0, 1,
-0.861451, 2.080944, -0.6746802, 0.8470588, 1, 0, 1,
-0.8596875, -0.171576, -0.3176811, 0.8431373, 1, 0, 1,
-0.8545793, 1.025434, 0.2846202, 0.8352941, 1, 0, 1,
-0.8515776, -0.34117, -2.194785, 0.8313726, 1, 0, 1,
-0.8427829, 0.07333471, -1.225004, 0.8235294, 1, 0, 1,
-0.8382577, -0.1045164, -1.410947, 0.8196079, 1, 0, 1,
-0.8320579, 0.1029271, -2.47759, 0.8117647, 1, 0, 1,
-0.8295427, -1.56293, -3.376501, 0.8078431, 1, 0, 1,
-0.8293403, 0.04197479, -2.264597, 0.8, 1, 0, 1,
-0.8264581, 0.8922524, -1.422596, 0.7921569, 1, 0, 1,
-0.8254232, -0.3616689, -4.311533, 0.7882353, 1, 0, 1,
-0.8237059, 0.3914602, -0.6957836, 0.7803922, 1, 0, 1,
-0.8228012, -1.602403, -2.839014, 0.7764706, 1, 0, 1,
-0.8203928, -1.338715, -0.6165365, 0.7686275, 1, 0, 1,
-0.8191481, 0.02479417, -2.275426, 0.7647059, 1, 0, 1,
-0.8181201, 0.6190797, -0.5739527, 0.7568628, 1, 0, 1,
-0.8124936, -0.5478745, -3.038464, 0.7529412, 1, 0, 1,
-0.8118981, 2.829354, 0.5444753, 0.7450981, 1, 0, 1,
-0.8086647, 1.006819, -0.5581826, 0.7411765, 1, 0, 1,
-0.799886, 0.6060275, 2.609258, 0.7333333, 1, 0, 1,
-0.7932475, 0.7591341, -0.1288373, 0.7294118, 1, 0, 1,
-0.7890975, -0.5215875, -2.093234, 0.7215686, 1, 0, 1,
-0.7829036, -0.6335618, -1.678386, 0.7176471, 1, 0, 1,
-0.7828733, -1.323588, -0.4144208, 0.7098039, 1, 0, 1,
-0.7791848, -0.1333238, -0.996114, 0.7058824, 1, 0, 1,
-0.7774112, -0.1012136, -1.865633, 0.6980392, 1, 0, 1,
-0.7744787, 1.234092, -1.842811, 0.6901961, 1, 0, 1,
-0.7614221, 0.3130842, -3.826326, 0.6862745, 1, 0, 1,
-0.7602713, 0.2508963, -0.6223667, 0.6784314, 1, 0, 1,
-0.7564694, 1.993226, 0.9043174, 0.6745098, 1, 0, 1,
-0.7482793, 0.5110884, -2.945887, 0.6666667, 1, 0, 1,
-0.7439561, -0.2619498, -1.550141, 0.6627451, 1, 0, 1,
-0.7435227, -0.2382539, -1.383844, 0.654902, 1, 0, 1,
-0.7398589, -0.4844072, -2.219157, 0.6509804, 1, 0, 1,
-0.7391353, 0.8971106, -1.318336, 0.6431373, 1, 0, 1,
-0.7377478, 0.4292819, -2.670555, 0.6392157, 1, 0, 1,
-0.7354691, -1.12815, -1.736073, 0.6313726, 1, 0, 1,
-0.7330667, -1.273122, 0.4344091, 0.627451, 1, 0, 1,
-0.7330545, -1.923841, -1.737781, 0.6196079, 1, 0, 1,
-0.7323415, -0.04332417, -2.271126, 0.6156863, 1, 0, 1,
-0.7301045, -1.227274, -2.914604, 0.6078432, 1, 0, 1,
-0.7292713, 1.45583, -0.9435636, 0.6039216, 1, 0, 1,
-0.7248094, 1.127019, -0.6366524, 0.5960785, 1, 0, 1,
-0.7204636, 1.60524, -0.03457989, 0.5882353, 1, 0, 1,
-0.7193163, -0.2550613, -3.113173, 0.5843138, 1, 0, 1,
-0.7136688, 1.552747, 0.1926809, 0.5764706, 1, 0, 1,
-0.7079689, 1.013001, 0.3149323, 0.572549, 1, 0, 1,
-0.7075102, -1.131639, -3.182567, 0.5647059, 1, 0, 1,
-0.7066694, -1.851273, -2.303063, 0.5607843, 1, 0, 1,
-0.7060882, -0.6267563, -1.95832, 0.5529412, 1, 0, 1,
-0.7044674, 0.4867432, 1.672732, 0.5490196, 1, 0, 1,
-0.702207, 0.8810114, 0.07076675, 0.5411765, 1, 0, 1,
-0.7013676, 1.319446, -0.6091726, 0.5372549, 1, 0, 1,
-0.6972252, 1.112348, -0.218277, 0.5294118, 1, 0, 1,
-0.6942432, 0.3657545, -1.511, 0.5254902, 1, 0, 1,
-0.6918448, 1.105803, 0.06434847, 0.5176471, 1, 0, 1,
-0.6913597, 2.83713, -2.337224, 0.5137255, 1, 0, 1,
-0.6912747, 0.8810902, -2.238963, 0.5058824, 1, 0, 1,
-0.6896298, 0.9379011, 0.3605615, 0.5019608, 1, 0, 1,
-0.6850994, -0.7745901, -1.822913, 0.4941176, 1, 0, 1,
-0.6806242, -1.817792, -2.092073, 0.4862745, 1, 0, 1,
-0.6791957, 0.2482564, -1.812784, 0.4823529, 1, 0, 1,
-0.6786214, -0.9605465, -3.631307, 0.4745098, 1, 0, 1,
-0.6761905, 0.2634147, -0.6921378, 0.4705882, 1, 0, 1,
-0.6734008, 0.02985002, -0.8864658, 0.4627451, 1, 0, 1,
-0.6733069, -0.4457843, -0.9299828, 0.4588235, 1, 0, 1,
-0.6711748, -0.3081886, -2.458193, 0.4509804, 1, 0, 1,
-0.6691278, 0.1620341, -1.047229, 0.4470588, 1, 0, 1,
-0.6689014, 0.2422361, -1.344091, 0.4392157, 1, 0, 1,
-0.66856, 1.04506, -0.2129873, 0.4352941, 1, 0, 1,
-0.6566616, -0.2147516, -0.8545622, 0.427451, 1, 0, 1,
-0.6526256, 1.205607, 0.03434664, 0.4235294, 1, 0, 1,
-0.6518468, 0.1854029, 1.261391, 0.4156863, 1, 0, 1,
-0.649658, -1.028387, -2.971454, 0.4117647, 1, 0, 1,
-0.6450925, -1.966673, -0.2445488, 0.4039216, 1, 0, 1,
-0.6443764, 0.2956893, -1.836058, 0.3960784, 1, 0, 1,
-0.6401888, 0.3454094, -2.364357, 0.3921569, 1, 0, 1,
-0.6396934, 0.1112241, -0.253362, 0.3843137, 1, 0, 1,
-0.6359082, -0.5222434, -2.482591, 0.3803922, 1, 0, 1,
-0.6337924, 1.974487, 0.6614824, 0.372549, 1, 0, 1,
-0.6288663, 0.4333853, -1.38035, 0.3686275, 1, 0, 1,
-0.6283848, 1.624494, -1.653749, 0.3607843, 1, 0, 1,
-0.6226019, 0.2414792, -0.7485079, 0.3568628, 1, 0, 1,
-0.6192688, 0.8869364, -1.37114, 0.3490196, 1, 0, 1,
-0.6178012, 1.596622, 0.438232, 0.345098, 1, 0, 1,
-0.6109719, -1.35629, -2.366026, 0.3372549, 1, 0, 1,
-0.6100754, -0.6839037, -4.437683, 0.3333333, 1, 0, 1,
-0.6051232, 0.290251, -0.1415518, 0.3254902, 1, 0, 1,
-0.5967302, 1.007737, -0.5283245, 0.3215686, 1, 0, 1,
-0.5966774, 2.310154, 0.3860963, 0.3137255, 1, 0, 1,
-0.5884818, 0.2485136, 0.4781156, 0.3098039, 1, 0, 1,
-0.5879197, -1.61071, -3.369116, 0.3019608, 1, 0, 1,
-0.5810568, -1.258563, -4.352459, 0.2941177, 1, 0, 1,
-0.5796956, -0.5517737, -3.345222, 0.2901961, 1, 0, 1,
-0.5782647, -1.531488, -3.097228, 0.282353, 1, 0, 1,
-0.5745752, 0.6201608, -1.096004, 0.2784314, 1, 0, 1,
-0.5739498, 0.2970839, -1.248874, 0.2705882, 1, 0, 1,
-0.572803, 0.02681278, 0.3871866, 0.2666667, 1, 0, 1,
-0.5725222, 0.7099937, 0.3208645, 0.2588235, 1, 0, 1,
-0.5715599, -0.6333976, -1.64711, 0.254902, 1, 0, 1,
-0.570534, -0.7129505, -0.9514494, 0.2470588, 1, 0, 1,
-0.5701907, -0.01078789, -1.723822, 0.2431373, 1, 0, 1,
-0.569496, 1.148118, -0.00214364, 0.2352941, 1, 0, 1,
-0.5622001, 0.7007635, -2.299213, 0.2313726, 1, 0, 1,
-0.5559213, 0.4782825, -1.55933, 0.2235294, 1, 0, 1,
-0.5539945, -0.3737035, -3.758906, 0.2196078, 1, 0, 1,
-0.5534306, 0.9456486, 0.5727252, 0.2117647, 1, 0, 1,
-0.5498059, -1.429567, -4.487166, 0.2078431, 1, 0, 1,
-0.549397, -2.142977, -2.518671, 0.2, 1, 0, 1,
-0.5491357, -0.5628279, -3.43013, 0.1921569, 1, 0, 1,
-0.545602, 0.01490144, -1.714398, 0.1882353, 1, 0, 1,
-0.5452906, -0.08776839, -1.029631, 0.1803922, 1, 0, 1,
-0.538502, -0.07979544, -1.124207, 0.1764706, 1, 0, 1,
-0.535116, -0.4200774, -3.082203, 0.1686275, 1, 0, 1,
-0.5343779, -1.266052, -1.053261, 0.1647059, 1, 0, 1,
-0.5323345, 1.823245, 0.489346, 0.1568628, 1, 0, 1,
-0.5313202, 0.3881168, 1.130649, 0.1529412, 1, 0, 1,
-0.5298141, -0.5523146, -3.856698, 0.145098, 1, 0, 1,
-0.5289283, 0.5829874, 0.04941798, 0.1411765, 1, 0, 1,
-0.528512, -0.3866986, -1.831162, 0.1333333, 1, 0, 1,
-0.527289, 0.7290637, -1.73291, 0.1294118, 1, 0, 1,
-0.5207278, 0.601507, -0.04521999, 0.1215686, 1, 0, 1,
-0.5168473, -0.341164, -2.63843, 0.1176471, 1, 0, 1,
-0.5128365, 0.4199657, 0.7030315, 0.1098039, 1, 0, 1,
-0.511144, -0.3284134, -3.339799, 0.1058824, 1, 0, 1,
-0.5089191, 0.7990914, -0.426703, 0.09803922, 1, 0, 1,
-0.5064448, -0.05562953, -1.360017, 0.09019608, 1, 0, 1,
-0.5056504, -1.717931, -1.209795, 0.08627451, 1, 0, 1,
-0.5031233, 0.1601173, -1.942906, 0.07843138, 1, 0, 1,
-0.5027077, -1.361181, -4.104802, 0.07450981, 1, 0, 1,
-0.5016446, 1.385059, -0.3449765, 0.06666667, 1, 0, 1,
-0.4990573, -2.071692, -1.735737, 0.0627451, 1, 0, 1,
-0.4973747, -0.7385687, -3.196875, 0.05490196, 1, 0, 1,
-0.4902114, -2.519215, -1.192166, 0.05098039, 1, 0, 1,
-0.4878503, 0.7277352, 0.1306626, 0.04313726, 1, 0, 1,
-0.4867976, -0.5306466, -2.015796, 0.03921569, 1, 0, 1,
-0.4866856, -0.06567757, -2.063798, 0.03137255, 1, 0, 1,
-0.4822547, -0.003756979, 0.2984485, 0.02745098, 1, 0, 1,
-0.4781252, 0.6664776, 1.415588, 0.01960784, 1, 0, 1,
-0.4765424, -1.813002, -3.820018, 0.01568628, 1, 0, 1,
-0.4736987, -0.08080991, -1.705963, 0.007843138, 1, 0, 1,
-0.4726821, 0.9830174, -1.569914, 0.003921569, 1, 0, 1,
-0.4715131, 0.5706508, -0.5245907, 0, 1, 0.003921569, 1,
-0.4702662, 0.006336329, -1.839164, 0, 1, 0.01176471, 1,
-0.4654802, 0.5694193, -1.481081, 0, 1, 0.01568628, 1,
-0.4622316, -0.6666722, -2.38179, 0, 1, 0.02352941, 1,
-0.4503837, 0.8676468, -1.851787, 0, 1, 0.02745098, 1,
-0.4459527, 0.8762385, 0.9229982, 0, 1, 0.03529412, 1,
-0.4454525, 2.621481, -0.1864741, 0, 1, 0.03921569, 1,
-0.4388398, 0.01098446, -0.499417, 0, 1, 0.04705882, 1,
-0.4386832, -0.9090356, -1.584208, 0, 1, 0.05098039, 1,
-0.4379887, 1.227978, -0.4196709, 0, 1, 0.05882353, 1,
-0.4368591, -0.5036642, -3.615205, 0, 1, 0.0627451, 1,
-0.4350917, 0.587004, -0.3098043, 0, 1, 0.07058824, 1,
-0.4306528, -0.618328, -2.787786, 0, 1, 0.07450981, 1,
-0.4304102, -0.109581, -2.343889, 0, 1, 0.08235294, 1,
-0.4242688, 0.8904012, -0.3102015, 0, 1, 0.08627451, 1,
-0.4239612, -0.4674465, -2.977471, 0, 1, 0.09411765, 1,
-0.4226865, 0.6247482, 0.2204131, 0, 1, 0.1019608, 1,
-0.4153468, -1.071534, -2.529909, 0, 1, 0.1058824, 1,
-0.4132791, -0.6546194, -0.528241, 0, 1, 0.1137255, 1,
-0.4123627, -0.2550422, -3.228231, 0, 1, 0.1176471, 1,
-0.4119409, 0.6921528, -0.8959751, 0, 1, 0.1254902, 1,
-0.4086893, -0.6211573, -3.194829, 0, 1, 0.1294118, 1,
-0.4080212, -0.4235735, -1.48877, 0, 1, 0.1372549, 1,
-0.4067591, 1.126317, -0.8227649, 0, 1, 0.1411765, 1,
-0.4049878, -0.9811249, -2.650232, 0, 1, 0.1490196, 1,
-0.3962036, 0.4402379, 1.214826, 0, 1, 0.1529412, 1,
-0.3952917, -0.1940316, -2.525386, 0, 1, 0.1607843, 1,
-0.3950166, -0.7196404, -3.123423, 0, 1, 0.1647059, 1,
-0.3943363, 0.1036481, -0.4456925, 0, 1, 0.172549, 1,
-0.3931028, 0.4838977, -1.532921, 0, 1, 0.1764706, 1,
-0.3919112, 1.069843, -3.270024, 0, 1, 0.1843137, 1,
-0.3903794, 0.02187678, -1.251338, 0, 1, 0.1882353, 1,
-0.3841576, 0.1177716, -0.3840769, 0, 1, 0.1960784, 1,
-0.3720466, -0.03583382, -0.4778844, 0, 1, 0.2039216, 1,
-0.3713926, -1.405703, -2.525623, 0, 1, 0.2078431, 1,
-0.3705928, 0.7156525, 0.7109709, 0, 1, 0.2156863, 1,
-0.367123, 0.6855946, -1.553769, 0, 1, 0.2196078, 1,
-0.3642577, -0.2122397, -2.485636, 0, 1, 0.227451, 1,
-0.3589659, 0.9522433, 0.8095213, 0, 1, 0.2313726, 1,
-0.3565432, 1.472473, 0.3358842, 0, 1, 0.2392157, 1,
-0.3565021, 0.6730745, -2.003906, 0, 1, 0.2431373, 1,
-0.3516499, -0.7760151, -2.050124, 0, 1, 0.2509804, 1,
-0.3478499, -0.5762706, -2.358276, 0, 1, 0.254902, 1,
-0.3457525, -0.6906856, -2.112659, 0, 1, 0.2627451, 1,
-0.3434409, -0.445657, -3.771267, 0, 1, 0.2666667, 1,
-0.3415734, -0.7511699, -1.780321, 0, 1, 0.2745098, 1,
-0.3370225, 1.245073, -0.6971309, 0, 1, 0.2784314, 1,
-0.3309979, -1.283473, -2.479943, 0, 1, 0.2862745, 1,
-0.3270735, 1.36308, 0.5034147, 0, 1, 0.2901961, 1,
-0.3251635, -1.305451, -1.221956, 0, 1, 0.2980392, 1,
-0.3176438, -1.198754, -3.870647, 0, 1, 0.3058824, 1,
-0.3145592, 1.962044, -0.5980663, 0, 1, 0.3098039, 1,
-0.3057604, -0.2440325, -3.279778, 0, 1, 0.3176471, 1,
-0.2968875, 1.507688, -0.8810242, 0, 1, 0.3215686, 1,
-0.296008, -0.752271, -2.504641, 0, 1, 0.3294118, 1,
-0.2945971, 0.04056613, -1.798076, 0, 1, 0.3333333, 1,
-0.2937936, 0.3847343, -0.9984402, 0, 1, 0.3411765, 1,
-0.2927129, 0.600407, -0.7832913, 0, 1, 0.345098, 1,
-0.2915899, 0.5502085, 0.1627746, 0, 1, 0.3529412, 1,
-0.2902413, 0.3666588, -0.4747831, 0, 1, 0.3568628, 1,
-0.286979, 1.624872, 0.4140957, 0, 1, 0.3647059, 1,
-0.2781847, 0.8565314, 0.3890217, 0, 1, 0.3686275, 1,
-0.2764027, 0.3128087, -1.039879, 0, 1, 0.3764706, 1,
-0.2720982, -0.1758566, -2.311033, 0, 1, 0.3803922, 1,
-0.2683049, -0.4583706, -3.678278, 0, 1, 0.3882353, 1,
-0.2656993, -1.181744, -3.354086, 0, 1, 0.3921569, 1,
-0.2652072, 0.3718976, -2.301876, 0, 1, 0.4, 1,
-0.2596153, 1.453326, 0.3596291, 0, 1, 0.4078431, 1,
-0.2574547, 1.280741, 0.07021371, 0, 1, 0.4117647, 1,
-0.2573217, 0.561735, 0.2278752, 0, 1, 0.4196078, 1,
-0.2565598, -2.092897, -2.393684, 0, 1, 0.4235294, 1,
-0.2563922, -2.728899, -3.364086, 0, 1, 0.4313726, 1,
-0.2477252, 1.988556, -0.8861548, 0, 1, 0.4352941, 1,
-0.2435037, 0.2949632, -1.051425, 0, 1, 0.4431373, 1,
-0.2434137, -0.07877267, -1.713286, 0, 1, 0.4470588, 1,
-0.2398207, 0.05620214, -0.6258162, 0, 1, 0.454902, 1,
-0.231701, 0.3892662, 1.04356, 0, 1, 0.4588235, 1,
-0.2229773, 0.4412907, 0.394607, 0, 1, 0.4666667, 1,
-0.2124628, -2.232739, -2.624573, 0, 1, 0.4705882, 1,
-0.2103601, 0.08263186, -0.2055054, 0, 1, 0.4784314, 1,
-0.2098378, -0.259986, -2.587552, 0, 1, 0.4823529, 1,
-0.2093595, 1.046149, 2.487772, 0, 1, 0.4901961, 1,
-0.2088075, 1.130613, 1.186093, 0, 1, 0.4941176, 1,
-0.2082737, 0.3019769, 0.1840779, 0, 1, 0.5019608, 1,
-0.2078345, 0.469543, 0.8287733, 0, 1, 0.509804, 1,
-0.2047926, 1.174745, 0.587465, 0, 1, 0.5137255, 1,
-0.2043521, 0.4994595, -2.091276, 0, 1, 0.5215687, 1,
-0.2030705, 0.8597225, -0.5326743, 0, 1, 0.5254902, 1,
-0.2014206, 0.097582, -0.1658672, 0, 1, 0.5333334, 1,
-0.1994818, -1.496365, -3.862946, 0, 1, 0.5372549, 1,
-0.1991284, -0.4155208, -1.537956, 0, 1, 0.5450981, 1,
-0.1982583, -0.3362585, -2.964802, 0, 1, 0.5490196, 1,
-0.1962178, -0.1968933, -1.919561, 0, 1, 0.5568628, 1,
-0.1880634, -0.4737593, -2.17903, 0, 1, 0.5607843, 1,
-0.1872928, -0.2543376, -2.129977, 0, 1, 0.5686275, 1,
-0.1836969, 0.2806049, -0.5534402, 0, 1, 0.572549, 1,
-0.1812811, -0.7377177, -3.658121, 0, 1, 0.5803922, 1,
-0.1746012, 0.01055514, -1.536756, 0, 1, 0.5843138, 1,
-0.1720479, -0.06394465, -2.108116, 0, 1, 0.5921569, 1,
-0.1693111, -0.2059437, -1.508963, 0, 1, 0.5960785, 1,
-0.1681317, -0.1730233, -1.363665, 0, 1, 0.6039216, 1,
-0.1647387, 0.7695547, -0.2410032, 0, 1, 0.6117647, 1,
-0.1621227, 1.129439, -0.9177976, 0, 1, 0.6156863, 1,
-0.1614143, 0.5595723, -0.6873018, 0, 1, 0.6235294, 1,
-0.1573729, -0.2364551, 0.552046, 0, 1, 0.627451, 1,
-0.1563892, 0.2432931, -0.109709, 0, 1, 0.6352941, 1,
-0.1532249, -0.7271435, -2.771149, 0, 1, 0.6392157, 1,
-0.1527794, -0.127141, -2.151388, 0, 1, 0.6470588, 1,
-0.1527129, 1.529311, 0.4992282, 0, 1, 0.6509804, 1,
-0.1468903, -1.646311, -3.930585, 0, 1, 0.6588235, 1,
-0.1459131, -0.02686258, -2.06427, 0, 1, 0.6627451, 1,
-0.1418876, -0.4459969, -2.423417, 0, 1, 0.6705883, 1,
-0.1413612, -1.164393, -1.765551, 0, 1, 0.6745098, 1,
-0.1369403, -0.5828506, -2.061199, 0, 1, 0.682353, 1,
-0.136293, -0.4800448, -3.159414, 0, 1, 0.6862745, 1,
-0.134872, 0.5567231, -0.7472875, 0, 1, 0.6941177, 1,
-0.1288495, -0.1365298, -2.82369, 0, 1, 0.7019608, 1,
-0.1228143, 0.4718774, -1.35704, 0, 1, 0.7058824, 1,
-0.1223481, 0.1963625, -2.034067, 0, 1, 0.7137255, 1,
-0.1207013, -1.140266, -2.879831, 0, 1, 0.7176471, 1,
-0.1164576, -0.4020725, -3.223308, 0, 1, 0.7254902, 1,
-0.1155244, -1.139051, -2.707946, 0, 1, 0.7294118, 1,
-0.1084934, -1.761127, -3.308918, 0, 1, 0.7372549, 1,
-0.1081578, 1.603045, -0.6857482, 0, 1, 0.7411765, 1,
-0.1059631, -0.6418906, -3.508953, 0, 1, 0.7490196, 1,
-0.103444, -1.373179, -3.232439, 0, 1, 0.7529412, 1,
-0.09874015, 1.95464, -1.719756, 0, 1, 0.7607843, 1,
-0.09859466, 1.086356, -0.550978, 0, 1, 0.7647059, 1,
-0.09680447, 1.579107, 0.1924082, 0, 1, 0.772549, 1,
-0.09589125, 2.258034, 1.425507, 0, 1, 0.7764706, 1,
-0.09435852, 0.5603725, -0.07351089, 0, 1, 0.7843137, 1,
-0.09295046, -0.5747724, -2.167501, 0, 1, 0.7882353, 1,
-0.08851025, -0.1427015, -1.484727, 0, 1, 0.7960784, 1,
-0.08599252, 0.7216842, 2.455041, 0, 1, 0.8039216, 1,
-0.08129142, 0.41671, -0.6255982, 0, 1, 0.8078431, 1,
-0.08016916, 1.229763, 0.2683092, 0, 1, 0.8156863, 1,
-0.07931609, -1.060067, -2.868683, 0, 1, 0.8196079, 1,
-0.07685953, -0.1445455, -2.534474, 0, 1, 0.827451, 1,
-0.07379556, 0.5842389, 0.7128171, 0, 1, 0.8313726, 1,
-0.07194218, 1.956485, -1.319358, 0, 1, 0.8392157, 1,
-0.07192402, -0.2784499, -3.147657, 0, 1, 0.8431373, 1,
-0.06530452, 1.160087, -0.7266359, 0, 1, 0.8509804, 1,
-0.06331764, -0.4991625, -4.666946, 0, 1, 0.854902, 1,
-0.0622854, 0.5529678, 0.1432962, 0, 1, 0.8627451, 1,
-0.06216361, -0.5158816, -2.893353, 0, 1, 0.8666667, 1,
-0.05867552, 0.3211648, -0.6226165, 0, 1, 0.8745098, 1,
-0.05722958, -1.703517, -2.198164, 0, 1, 0.8784314, 1,
-0.05579861, -0.5745056, -1.887353, 0, 1, 0.8862745, 1,
-0.05565664, -1.209018, -1.291911, 0, 1, 0.8901961, 1,
-0.05531911, 0.07753184, -0.8114896, 0, 1, 0.8980392, 1,
-0.05410338, -0.6135913, 0.0867517, 0, 1, 0.9058824, 1,
-0.05372067, -0.8110129, -2.597643, 0, 1, 0.9098039, 1,
-0.05298508, -1.212537, -3.978147, 0, 1, 0.9176471, 1,
-0.04816672, 0.1262205, 0.08954811, 0, 1, 0.9215686, 1,
-0.04528123, -0.5406227, -3.88255, 0, 1, 0.9294118, 1,
-0.04410026, -0.1375915, -1.446925, 0, 1, 0.9333333, 1,
-0.03885641, -0.4059398, -2.692438, 0, 1, 0.9411765, 1,
-0.03792331, 0.4323993, 2.179055, 0, 1, 0.945098, 1,
-0.0373962, 1.134952, 0.4152615, 0, 1, 0.9529412, 1,
-0.03661655, 0.2916655, -2.576622, 0, 1, 0.9568627, 1,
-0.03500501, -0.08343453, -4.008286, 0, 1, 0.9647059, 1,
-0.03449432, 0.09229513, -0.6967146, 0, 1, 0.9686275, 1,
-0.03266738, -0.4504621, -2.134947, 0, 1, 0.9764706, 1,
-0.0313493, -1.548111, -4.483467, 0, 1, 0.9803922, 1,
-0.02929393, -0.3743596, -1.66588, 0, 1, 0.9882353, 1,
-0.02280568, -0.5005816, -3.222251, 0, 1, 0.9921569, 1,
-0.02248294, -1.580457, -2.001467, 0, 1, 1, 1,
-0.02080068, 0.3942761, -0.1862564, 0, 0.9921569, 1, 1,
-0.02056342, -1.429876, -3.4533, 0, 0.9882353, 1, 1,
-0.01997146, 0.5681623, 0.3050065, 0, 0.9803922, 1, 1,
-0.01928025, -1.110104, -4.031633, 0, 0.9764706, 1, 1,
-0.0189018, 0.2952742, -0.4695197, 0, 0.9686275, 1, 1,
-0.01228529, 0.2329232, 0.4014941, 0, 0.9647059, 1, 1,
-0.009508017, -0.9295005, -2.637289, 0, 0.9568627, 1, 1,
-0.008351051, -0.1817467, -2.800112, 0, 0.9529412, 1, 1,
-0.007764535, 0.659661, 1.482262, 0, 0.945098, 1, 1,
-0.005300043, 0.2808845, -0.09315849, 0, 0.9411765, 1, 1,
-0.004432266, 0.5420018, 0.5857323, 0, 0.9333333, 1, 1,
0.0007535805, -0.8155727, 5.516416, 0, 0.9294118, 1, 1,
0.001693738, 0.1200765, 0.8268501, 0, 0.9215686, 1, 1,
0.006015274, -1.637203, 4.246562, 0, 0.9176471, 1, 1,
0.00812432, 1.444939, 1.169897, 0, 0.9098039, 1, 1,
0.0109647, 0.7923034, 0.02971573, 0, 0.9058824, 1, 1,
0.01210157, 3.038542, -0.2883055, 0, 0.8980392, 1, 1,
0.01322981, 0.1419247, -0.7153847, 0, 0.8901961, 1, 1,
0.01403135, 0.4715738, 1.49821, 0, 0.8862745, 1, 1,
0.02019907, -0.368845, 4.028509, 0, 0.8784314, 1, 1,
0.02080548, 1.2491, 0.7888339, 0, 0.8745098, 1, 1,
0.02354844, -0.9971541, 3.37519, 0, 0.8666667, 1, 1,
0.02539557, -0.6657742, 3.280385, 0, 0.8627451, 1, 1,
0.03069242, 0.3660705, 0.3320549, 0, 0.854902, 1, 1,
0.03141284, 0.1200601, -0.5968354, 0, 0.8509804, 1, 1,
0.03206242, -0.9084034, 3.218652, 0, 0.8431373, 1, 1,
0.03367255, -1.784587, 4.035944, 0, 0.8392157, 1, 1,
0.03484412, 1.378552, 0.3258131, 0, 0.8313726, 1, 1,
0.03688168, 1.060007, 0.8813715, 0, 0.827451, 1, 1,
0.03709098, -0.6016752, 0.7433151, 0, 0.8196079, 1, 1,
0.04367894, 1.353198, 0.5842708, 0, 0.8156863, 1, 1,
0.04435679, -0.8262993, 2.75707, 0, 0.8078431, 1, 1,
0.04483386, 1.199871, -0.5081908, 0, 0.8039216, 1, 1,
0.0498439, 0.7033192, 0.04478702, 0, 0.7960784, 1, 1,
0.05377768, -1.056036, 1.549741, 0, 0.7882353, 1, 1,
0.05712605, 0.02537007, 1.993913, 0, 0.7843137, 1, 1,
0.05967166, -2.228037, 4.64245, 0, 0.7764706, 1, 1,
0.06214293, -0.06870417, 2.916573, 0, 0.772549, 1, 1,
0.06504831, -0.167935, 5.91755, 0, 0.7647059, 1, 1,
0.06768872, 0.3030217, 0.9063764, 0, 0.7607843, 1, 1,
0.06855741, 0.6621597, 1.609732, 0, 0.7529412, 1, 1,
0.06859929, 1.116631, -0.4671889, 0, 0.7490196, 1, 1,
0.06977552, -0.9158335, 2.689556, 0, 0.7411765, 1, 1,
0.07025867, -0.5097827, 3.858389, 0, 0.7372549, 1, 1,
0.07089138, -0.1905775, 1.767102, 0, 0.7294118, 1, 1,
0.07105577, 0.3501583, 0.7459444, 0, 0.7254902, 1, 1,
0.0715279, 0.3230199, 0.02058266, 0, 0.7176471, 1, 1,
0.07234834, 0.7521188, -0.8350131, 0, 0.7137255, 1, 1,
0.07518574, 0.7768869, -0.7397181, 0, 0.7058824, 1, 1,
0.07763809, 0.09243356, 0.2057593, 0, 0.6980392, 1, 1,
0.07917506, 0.08993688, 1.009993, 0, 0.6941177, 1, 1,
0.08127208, -0.605957, 3.282004, 0, 0.6862745, 1, 1,
0.08235926, 0.3695195, 0.4841015, 0, 0.682353, 1, 1,
0.08251424, 0.9284379, 2.150513, 0, 0.6745098, 1, 1,
0.09152603, 0.5365074, -0.9413728, 0, 0.6705883, 1, 1,
0.09189299, 0.8739085, 0.8450674, 0, 0.6627451, 1, 1,
0.09414054, 0.5659021, 1.05069, 0, 0.6588235, 1, 1,
0.09516808, 1.331949, 1.352769, 0, 0.6509804, 1, 1,
0.09669031, 0.6595879, -1.111687, 0, 0.6470588, 1, 1,
0.09813941, -1.034645, 2.570689, 0, 0.6392157, 1, 1,
0.0991238, -0.4267883, 1.025681, 0, 0.6352941, 1, 1,
0.1051514, -0.3823879, 2.374446, 0, 0.627451, 1, 1,
0.1057153, -0.8109938, 4.010421, 0, 0.6235294, 1, 1,
0.1063405, -1.505777, 2.853755, 0, 0.6156863, 1, 1,
0.1087747, 0.7946926, 1.083937, 0, 0.6117647, 1, 1,
0.110306, 0.6115822, 0.5992154, 0, 0.6039216, 1, 1,
0.1119022, -0.08496244, 3.31723, 0, 0.5960785, 1, 1,
0.1128695, 1.110164, -1.126734, 0, 0.5921569, 1, 1,
0.1148653, -0.5185789, 2.402109, 0, 0.5843138, 1, 1,
0.1266123, 2.015687, -1.233712, 0, 0.5803922, 1, 1,
0.1353258, -1.261143, 2.20627, 0, 0.572549, 1, 1,
0.1355634, -0.8844216, 3.80358, 0, 0.5686275, 1, 1,
0.1403768, -0.5218677, 2.244505, 0, 0.5607843, 1, 1,
0.1473608, -0.1907397, 3.490485, 0, 0.5568628, 1, 1,
0.1477111, -0.6783165, 4.549603, 0, 0.5490196, 1, 1,
0.1486578, -0.2884804, 2.635327, 0, 0.5450981, 1, 1,
0.1538261, -0.3755986, 3.826587, 0, 0.5372549, 1, 1,
0.1549923, -1.321928, 3.624726, 0, 0.5333334, 1, 1,
0.1602205, 1.016188, -0.6751927, 0, 0.5254902, 1, 1,
0.1606072, -0.8589385, 3.202666, 0, 0.5215687, 1, 1,
0.1610618, -1.492351, 1.691498, 0, 0.5137255, 1, 1,
0.1629404, -1.303983, 2.355386, 0, 0.509804, 1, 1,
0.1643033, -0.3288426, 2.409979, 0, 0.5019608, 1, 1,
0.1667234, 0.5023853, -0.2806944, 0, 0.4941176, 1, 1,
0.1677483, -0.2999619, 3.002728, 0, 0.4901961, 1, 1,
0.1689568, -1.8996, 3.883258, 0, 0.4823529, 1, 1,
0.1732341, 0.7176092, 3.000484, 0, 0.4784314, 1, 1,
0.1736021, 0.06046671, 0.5712339, 0, 0.4705882, 1, 1,
0.1772933, -1.241814, 2.229773, 0, 0.4666667, 1, 1,
0.1826329, -0.1861364, 2.457759, 0, 0.4588235, 1, 1,
0.182863, -0.2974289, 2.647455, 0, 0.454902, 1, 1,
0.1831413, 0.2448871, -0.9372184, 0, 0.4470588, 1, 1,
0.1859546, -0.08272005, 1.000342, 0, 0.4431373, 1, 1,
0.1910309, 1.991046, 1.580499, 0, 0.4352941, 1, 1,
0.1930226, 0.6177755, -1.25193, 0, 0.4313726, 1, 1,
0.1951065, 0.4933298, 0.5565003, 0, 0.4235294, 1, 1,
0.1959978, -1.194498, 4.031655, 0, 0.4196078, 1, 1,
0.1963396, -0.001649027, 2.192686, 0, 0.4117647, 1, 1,
0.196486, 0.4832599, -0.8304593, 0, 0.4078431, 1, 1,
0.197035, 0.4197152, 0.9442183, 0, 0.4, 1, 1,
0.2008506, -0.02679528, 1.68873, 0, 0.3921569, 1, 1,
0.2041261, -0.7116525, 4.355265, 0, 0.3882353, 1, 1,
0.2105792, 0.5741177, 1.081212, 0, 0.3803922, 1, 1,
0.2114071, 0.451034, 1.516807, 0, 0.3764706, 1, 1,
0.2170862, 0.5944838, 1.051088, 0, 0.3686275, 1, 1,
0.2173499, -0.777721, 2.589148, 0, 0.3647059, 1, 1,
0.2181418, 0.3985181, -0.4015703, 0, 0.3568628, 1, 1,
0.2182415, 0.7542511, 0.1538312, 0, 0.3529412, 1, 1,
0.2191644, 0.6772323, 0.5713953, 0, 0.345098, 1, 1,
0.2194807, 0.8374954, 2.380002, 0, 0.3411765, 1, 1,
0.2212802, 0.007426337, 1.120299, 0, 0.3333333, 1, 1,
0.2227597, 0.04380679, 2.233196, 0, 0.3294118, 1, 1,
0.2269559, 2.22103, 1.297148, 0, 0.3215686, 1, 1,
0.2269748, 1.26566, 0.8253246, 0, 0.3176471, 1, 1,
0.2271358, 0.3943068, -1.118827, 0, 0.3098039, 1, 1,
0.2278206, 0.9707248, 1.013051, 0, 0.3058824, 1, 1,
0.2295887, 0.8830221, 0.2879124, 0, 0.2980392, 1, 1,
0.231, -0.085393, 0.7152678, 0, 0.2901961, 1, 1,
0.2310965, -0.6216387, 1.159813, 0, 0.2862745, 1, 1,
0.2311288, -0.012814, 0.8473976, 0, 0.2784314, 1, 1,
0.2311517, -0.5334492, 2.726109, 0, 0.2745098, 1, 1,
0.2315291, 0.422484, 0.380077, 0, 0.2666667, 1, 1,
0.2405332, 0.0457582, 0.7274992, 0, 0.2627451, 1, 1,
0.2416165, -0.8740871, 1.782515, 0, 0.254902, 1, 1,
0.2473397, -0.1459701, 0.8322222, 0, 0.2509804, 1, 1,
0.2492105, -0.05806482, 3.267034, 0, 0.2431373, 1, 1,
0.2557444, 1.949791, 0.3972954, 0, 0.2392157, 1, 1,
0.259268, -0.1386573, 1.172235, 0, 0.2313726, 1, 1,
0.2600801, -0.3004202, 1.962609, 0, 0.227451, 1, 1,
0.2646179, 0.8025005, 1.19553, 0, 0.2196078, 1, 1,
0.2677762, -0.05972883, 3.00981, 0, 0.2156863, 1, 1,
0.2688571, -0.1562736, 2.539694, 0, 0.2078431, 1, 1,
0.2783406, -0.508752, 2.749151, 0, 0.2039216, 1, 1,
0.2808757, -1.079664, 2.423274, 0, 0.1960784, 1, 1,
0.286756, -0.8744125, 4.704484, 0, 0.1882353, 1, 1,
0.2929084, 1.267325, 1.981891, 0, 0.1843137, 1, 1,
0.2975802, -1.098481, 2.314596, 0, 0.1764706, 1, 1,
0.298077, -1.704141, 0.5019284, 0, 0.172549, 1, 1,
0.3008287, 0.4171804, 0.0862663, 0, 0.1647059, 1, 1,
0.3056796, -0.5190575, 4.228408, 0, 0.1607843, 1, 1,
0.3133916, 0.09198892, 0.9624723, 0, 0.1529412, 1, 1,
0.3173068, -0.6180245, 3.708615, 0, 0.1490196, 1, 1,
0.3263693, 1.930303, -1.69526, 0, 0.1411765, 1, 1,
0.3276752, -0.04803957, 0.8822917, 0, 0.1372549, 1, 1,
0.3371211, 1.362735, 0.9834834, 0, 0.1294118, 1, 1,
0.3375263, -2.37506, 2.84555, 0, 0.1254902, 1, 1,
0.337548, 0.8912414, 0.7738611, 0, 0.1176471, 1, 1,
0.339792, 0.9312383, -0.3112525, 0, 0.1137255, 1, 1,
0.3405978, 0.8854529, 0.1433528, 0, 0.1058824, 1, 1,
0.3418931, -0.753539, 2.694299, 0, 0.09803922, 1, 1,
0.3428779, 0.8445904, 1.519368, 0, 0.09411765, 1, 1,
0.3462709, 0.04547898, 2.228605, 0, 0.08627451, 1, 1,
0.347686, 0.1849934, 0.5486975, 0, 0.08235294, 1, 1,
0.3483135, 1.10511, -0.496454, 0, 0.07450981, 1, 1,
0.3501651, -0.3798404, 2.494266, 0, 0.07058824, 1, 1,
0.3534893, 0.307534, 2.153912, 0, 0.0627451, 1, 1,
0.3589236, -1.252755, 3.309987, 0, 0.05882353, 1, 1,
0.3600116, -0.004835876, 2.113721, 0, 0.05098039, 1, 1,
0.3626775, 1.621641, 0.8411239, 0, 0.04705882, 1, 1,
0.3646413, 1.374834, 0.5328495, 0, 0.03921569, 1, 1,
0.3691817, -0.3031071, 3.308715, 0, 0.03529412, 1, 1,
0.369648, 2.114599, -1.235834, 0, 0.02745098, 1, 1,
0.371533, -1.170486, 3.813566, 0, 0.02352941, 1, 1,
0.3733538, 0.5692921, -0.03301707, 0, 0.01568628, 1, 1,
0.3745065, 0.002255144, 2.477311, 0, 0.01176471, 1, 1,
0.3763152, -1.24881, 3.298675, 0, 0.003921569, 1, 1,
0.3798524, 0.3449525, 2.167113, 0.003921569, 0, 1, 1,
0.3811235, -1.72901, 2.323047, 0.007843138, 0, 1, 1,
0.3822923, -0.4938483, 2.644282, 0.01568628, 0, 1, 1,
0.3884069, -0.2606805, 4.305823, 0.01960784, 0, 1, 1,
0.3977603, -0.9725296, 2.351702, 0.02745098, 0, 1, 1,
0.400557, -0.6222137, 1.447014, 0.03137255, 0, 1, 1,
0.4009075, 0.5085149, 0.1411713, 0.03921569, 0, 1, 1,
0.403833, 0.4436446, -0.8284209, 0.04313726, 0, 1, 1,
0.4136669, 0.8300921, -1.958189, 0.05098039, 0, 1, 1,
0.4156694, 0.8716996, 1.701848, 0.05490196, 0, 1, 1,
0.4173076, 2.228684, 0.5465367, 0.0627451, 0, 1, 1,
0.4188657, 0.07620745, 0.07065789, 0.06666667, 0, 1, 1,
0.4192139, 0.3571305, 1.690939, 0.07450981, 0, 1, 1,
0.4261811, 0.4452455, 0.4680203, 0.07843138, 0, 1, 1,
0.4267387, 0.7653609, 2.216902, 0.08627451, 0, 1, 1,
0.4409621, 1.10959, 1.131432, 0.09019608, 0, 1, 1,
0.4438012, 0.5685685, 2.167332, 0.09803922, 0, 1, 1,
0.4450495, 1.556192, -0.2856871, 0.1058824, 0, 1, 1,
0.4564835, -0.06361951, 2.580762, 0.1098039, 0, 1, 1,
0.4579989, 0.9883668, -0.1513908, 0.1176471, 0, 1, 1,
0.4583878, 0.8656319, -0.4911116, 0.1215686, 0, 1, 1,
0.4618584, -0.2459359, 0.6433547, 0.1294118, 0, 1, 1,
0.463171, -2.013945, 3.080239, 0.1333333, 0, 1, 1,
0.4671345, 0.6030278, 0.4751115, 0.1411765, 0, 1, 1,
0.4711206, -1.876215, 3.383422, 0.145098, 0, 1, 1,
0.4715517, -0.2551709, 3.633029, 0.1529412, 0, 1, 1,
0.4720845, -0.2272994, 1.389019, 0.1568628, 0, 1, 1,
0.4841076, -0.2532139, 2.724759, 0.1647059, 0, 1, 1,
0.4865342, 0.1930888, 1.481249, 0.1686275, 0, 1, 1,
0.4922777, -1.153912, 2.866261, 0.1764706, 0, 1, 1,
0.4944904, 1.244309, -0.2654174, 0.1803922, 0, 1, 1,
0.4952503, -1.242418, 3.840698, 0.1882353, 0, 1, 1,
0.4954269, 0.1778892, 1.325927, 0.1921569, 0, 1, 1,
0.5014227, 2.719441, 1.287623, 0.2, 0, 1, 1,
0.5020484, 0.6868428, -0.215391, 0.2078431, 0, 1, 1,
0.5027575, -0.6167073, 3.545912, 0.2117647, 0, 1, 1,
0.5105071, -0.8037246, 0.6694603, 0.2196078, 0, 1, 1,
0.5110673, 0.6622275, -1.407453, 0.2235294, 0, 1, 1,
0.514618, -0.1031957, 0.2663763, 0.2313726, 0, 1, 1,
0.5214484, 1.370063, 1.880958, 0.2352941, 0, 1, 1,
0.5219082, 1.033924, 1.277999, 0.2431373, 0, 1, 1,
0.529252, -0.239933, 2.75404, 0.2470588, 0, 1, 1,
0.5371934, 0.2348323, -0.1060932, 0.254902, 0, 1, 1,
0.5405551, -0.4492219, 3.299958, 0.2588235, 0, 1, 1,
0.5432093, 1.435761, -1.444689, 0.2666667, 0, 1, 1,
0.5434582, 0.2782218, 1.928706, 0.2705882, 0, 1, 1,
0.543615, -2.418328, 1.904918, 0.2784314, 0, 1, 1,
0.5438, 0.4056062, 1.183299, 0.282353, 0, 1, 1,
0.5445032, 0.02792059, 0.298924, 0.2901961, 0, 1, 1,
0.5494683, -1.104286, 1.967291, 0.2941177, 0, 1, 1,
0.5527667, 2.096816, 2.08124, 0.3019608, 0, 1, 1,
0.5568848, 0.4071898, 1.986685, 0.3098039, 0, 1, 1,
0.5588892, -0.2456292, 0.3483806, 0.3137255, 0, 1, 1,
0.5606241, -1.132616, 3.292987, 0.3215686, 0, 1, 1,
0.5609903, 0.6795377, 0.3709221, 0.3254902, 0, 1, 1,
0.5615624, -0.6784199, 1.419803, 0.3333333, 0, 1, 1,
0.5627759, 2.132292, 0.2850546, 0.3372549, 0, 1, 1,
0.5639321, -1.700194, 2.408216, 0.345098, 0, 1, 1,
0.5646791, -0.8413094, 2.13011, 0.3490196, 0, 1, 1,
0.5677134, -0.216672, 1.412709, 0.3568628, 0, 1, 1,
0.5683918, 0.6155461, 0.2000328, 0.3607843, 0, 1, 1,
0.5688257, -1.049153, 3.246397, 0.3686275, 0, 1, 1,
0.5696019, -2.149859, 2.738039, 0.372549, 0, 1, 1,
0.5728123, -0.05970231, -0.437666, 0.3803922, 0, 1, 1,
0.5752357, -0.009148435, 0.9703907, 0.3843137, 0, 1, 1,
0.5765781, 0.110831, 1.742074, 0.3921569, 0, 1, 1,
0.5767416, 1.75401, -0.9845599, 0.3960784, 0, 1, 1,
0.5811157, -1.493149, 3.323198, 0.4039216, 0, 1, 1,
0.5856237, 0.3895324, -0.3105927, 0.4117647, 0, 1, 1,
0.5948574, -1.624367, 2.865473, 0.4156863, 0, 1, 1,
0.5955911, 0.8655805, 0.4533601, 0.4235294, 0, 1, 1,
0.598014, -0.2846344, 2.836974, 0.427451, 0, 1, 1,
0.6030936, 1.105209, -1.174289, 0.4352941, 0, 1, 1,
0.6039372, 0.3965992, 2.213076, 0.4392157, 0, 1, 1,
0.6049355, -0.8594965, 1.006198, 0.4470588, 0, 1, 1,
0.6056313, 1.773096, 0.06311502, 0.4509804, 0, 1, 1,
0.6066553, 0.4889403, 2.822256, 0.4588235, 0, 1, 1,
0.6073517, 0.8503247, 0.7747188, 0.4627451, 0, 1, 1,
0.6090008, 2.203672, 2.35359, 0.4705882, 0, 1, 1,
0.6097254, -0.1227596, 1.293836, 0.4745098, 0, 1, 1,
0.611172, -0.8081257, 1.625611, 0.4823529, 0, 1, 1,
0.6147351, -0.8614266, 2.160091, 0.4862745, 0, 1, 1,
0.6157543, 0.4164888, 0.2532895, 0.4941176, 0, 1, 1,
0.615964, 0.2666268, 0.6902671, 0.5019608, 0, 1, 1,
0.625681, 1.688227, 0.1760963, 0.5058824, 0, 1, 1,
0.629845, -0.6782861, 3.095858, 0.5137255, 0, 1, 1,
0.6322918, 1.25642, -0.8670801, 0.5176471, 0, 1, 1,
0.6326122, -1.547401, 0.7957593, 0.5254902, 0, 1, 1,
0.6360244, -2.574889, 2.423455, 0.5294118, 0, 1, 1,
0.639372, 0.1796165, 1.350942, 0.5372549, 0, 1, 1,
0.6397772, -2.172555, 1.705252, 0.5411765, 0, 1, 1,
0.6416694, -1.421467, 0.9051666, 0.5490196, 0, 1, 1,
0.6425164, 2.389446, -0.98264, 0.5529412, 0, 1, 1,
0.6457305, -0.6226164, 2.096839, 0.5607843, 0, 1, 1,
0.6477777, 0.1314025, 2.218548, 0.5647059, 0, 1, 1,
0.6508362, 0.7321541, -0.06093098, 0.572549, 0, 1, 1,
0.6510444, 1.01258, 1.160716, 0.5764706, 0, 1, 1,
0.6531443, -1.035743, 2.775512, 0.5843138, 0, 1, 1,
0.65523, -0.8375638, 1.439532, 0.5882353, 0, 1, 1,
0.6557848, 0.9909925, 1.635147, 0.5960785, 0, 1, 1,
0.6572811, 0.5313792, -0.1566257, 0.6039216, 0, 1, 1,
0.6597717, -0.1896289, 2.002667, 0.6078432, 0, 1, 1,
0.6618685, 0.695123, -1.525812, 0.6156863, 0, 1, 1,
0.6663638, 0.6833941, 0.7259753, 0.6196079, 0, 1, 1,
0.6675885, -0.9880195, 3.132532, 0.627451, 0, 1, 1,
0.6677444, -0.4042825, 3.152833, 0.6313726, 0, 1, 1,
0.6772031, 1.482254, -0.8890592, 0.6392157, 0, 1, 1,
0.6777246, -0.4299483, 3.565075, 0.6431373, 0, 1, 1,
0.678947, -0.9765145, 2.988762, 0.6509804, 0, 1, 1,
0.6808522, 0.5700222, 1.986181, 0.654902, 0, 1, 1,
0.6893661, -0.5403128, 1.733626, 0.6627451, 0, 1, 1,
0.6975706, 0.7910662, 0.5376565, 0.6666667, 0, 1, 1,
0.6990478, -0.57569, 1.751503, 0.6745098, 0, 1, 1,
0.7002332, 0.108611, 0.8813855, 0.6784314, 0, 1, 1,
0.7056811, 1.634183, 1.527252, 0.6862745, 0, 1, 1,
0.7071776, 0.7675032, 0.4499477, 0.6901961, 0, 1, 1,
0.711051, 0.1954185, 0.6870283, 0.6980392, 0, 1, 1,
0.7113733, 0.1913071, 1.903249, 0.7058824, 0, 1, 1,
0.7137268, -2.068345, 2.505947, 0.7098039, 0, 1, 1,
0.7187728, -0.9709786, 3.875296, 0.7176471, 0, 1, 1,
0.7278422, -0.187701, 1.936637, 0.7215686, 0, 1, 1,
0.7286088, -0.7980753, 3.431105, 0.7294118, 0, 1, 1,
0.7308179, 0.130179, 2.149975, 0.7333333, 0, 1, 1,
0.7346262, 0.06385888, 0.7712918, 0.7411765, 0, 1, 1,
0.7588793, -0.9987891, 4.707511, 0.7450981, 0, 1, 1,
0.766629, 1.75502, 1.520874, 0.7529412, 0, 1, 1,
0.7716544, 0.4924976, 1.432676, 0.7568628, 0, 1, 1,
0.7727409, 0.7109155, 1.929788, 0.7647059, 0, 1, 1,
0.7741691, -0.1424524, 3.226552, 0.7686275, 0, 1, 1,
0.7760469, 0.0383366, 1.4285, 0.7764706, 0, 1, 1,
0.7769793, 1.365736, -0.7294922, 0.7803922, 0, 1, 1,
0.7819624, -1.690432, 5.3066, 0.7882353, 0, 1, 1,
0.7828813, 1.542588, 0.6511604, 0.7921569, 0, 1, 1,
0.784436, -0.3384461, 1.5168, 0.8, 0, 1, 1,
0.7853266, -1.148042, 2.416628, 0.8078431, 0, 1, 1,
0.7881802, -0.2963261, 3.466996, 0.8117647, 0, 1, 1,
0.7885659, -0.3470679, 2.540889, 0.8196079, 0, 1, 1,
0.798656, -0.6403517, 2.604984, 0.8235294, 0, 1, 1,
0.8021253, -1.741911, 2.651365, 0.8313726, 0, 1, 1,
0.8046237, 0.7195551, 2.271837, 0.8352941, 0, 1, 1,
0.8057261, 1.051076, 0.2432892, 0.8431373, 0, 1, 1,
0.806518, -1.540596, 4.392314, 0.8470588, 0, 1, 1,
0.8072952, 0.9791195, 1.181852, 0.854902, 0, 1, 1,
0.8101923, -0.9938713, 4.22767, 0.8588235, 0, 1, 1,
0.8146678, -0.9473808, 2.26542, 0.8666667, 0, 1, 1,
0.8154055, -0.08862203, 2.612008, 0.8705882, 0, 1, 1,
0.8206775, -0.2493568, 1.819815, 0.8784314, 0, 1, 1,
0.8226727, 0.5527598, -0.8352025, 0.8823529, 0, 1, 1,
0.8276159, -0.9952533, 3.655169, 0.8901961, 0, 1, 1,
0.8322682, -0.6546454, 3.500662, 0.8941177, 0, 1, 1,
0.8349079, 1.076585, 0.5405337, 0.9019608, 0, 1, 1,
0.8389072, 0.5789388, -0.2507348, 0.9098039, 0, 1, 1,
0.8450771, 1.102052, -1.018729, 0.9137255, 0, 1, 1,
0.8462375, 0.15262, 3.299318, 0.9215686, 0, 1, 1,
0.8524359, -0.5316055, 2.500715, 0.9254902, 0, 1, 1,
0.8548251, 0.8959862, 1.006734, 0.9333333, 0, 1, 1,
0.858669, -0.2605877, 1.891801, 0.9372549, 0, 1, 1,
0.861015, -0.1838944, 0.2153494, 0.945098, 0, 1, 1,
0.8642, -0.4202566, 2.678474, 0.9490196, 0, 1, 1,
0.8754194, 0.5458449, -0.3902776, 0.9568627, 0, 1, 1,
0.8757915, 1.196281, -2.865509, 0.9607843, 0, 1, 1,
0.8759595, -1.622219, 2.759541, 0.9686275, 0, 1, 1,
0.8790234, -2.171012, 2.563323, 0.972549, 0, 1, 1,
0.8828295, 0.187577, 1.268936, 0.9803922, 0, 1, 1,
0.8841563, 1.014453, 0.4293837, 0.9843137, 0, 1, 1,
0.8899541, -1.549079, 5.194616, 0.9921569, 0, 1, 1,
0.8929925, -2.031217, 4.081002, 0.9960784, 0, 1, 1,
0.8944446, -0.03750452, 1.07992, 1, 0, 0.9960784, 1,
0.8986716, 0.5043103, 2.044722, 1, 0, 0.9882353, 1,
0.8991478, 0.4065976, 2.08998, 1, 0, 0.9843137, 1,
0.8995354, -1.250473, 0.9017902, 1, 0, 0.9764706, 1,
0.9105138, 2.201339, 1.101068, 1, 0, 0.972549, 1,
0.9179007, -0.5003853, 2.109085, 1, 0, 0.9647059, 1,
0.9182754, 0.2976449, 1.721773, 1, 0, 0.9607843, 1,
0.9260997, 0.09230746, 1.7498, 1, 0, 0.9529412, 1,
0.9292131, 0.6713871, 1.45131, 1, 0, 0.9490196, 1,
0.9316496, -0.2433094, 2.582287, 1, 0, 0.9411765, 1,
0.9350234, 0.4852964, 1.158089, 1, 0, 0.9372549, 1,
0.93535, -1.242569, 2.42401, 1, 0, 0.9294118, 1,
0.9358553, 1.950596, 1.170814, 1, 0, 0.9254902, 1,
0.9364879, -1.884987, 2.142295, 1, 0, 0.9176471, 1,
0.9413591, -0.760184, 3.906374, 1, 0, 0.9137255, 1,
0.9454368, 1.877352, 1.161484, 1, 0, 0.9058824, 1,
0.9497945, -0.4129201, 1.109916, 1, 0, 0.9019608, 1,
0.9522896, 0.9873851, 0.7666741, 1, 0, 0.8941177, 1,
0.956235, 1.053511, -0.4622002, 1, 0, 0.8862745, 1,
0.962837, -0.05533992, 0.7514595, 1, 0, 0.8823529, 1,
0.9641086, 1.573022, 2.317078, 1, 0, 0.8745098, 1,
0.9694463, 0.293934, 0.666408, 1, 0, 0.8705882, 1,
0.9737073, -0.1646888, 2.212876, 1, 0, 0.8627451, 1,
0.9899338, -0.129934, 1.493736, 1, 0, 0.8588235, 1,
0.9908648, 0.2534154, 1.995946, 1, 0, 0.8509804, 1,
0.991371, -0.4828676, 2.443367, 1, 0, 0.8470588, 1,
1.003525, 0.6817948, 0.9986186, 1, 0, 0.8392157, 1,
1.011098, 0.4611593, 0.5007185, 1, 0, 0.8352941, 1,
1.013251, 1.654633, -0.03988721, 1, 0, 0.827451, 1,
1.026213, -0.27623, 0.6752595, 1, 0, 0.8235294, 1,
1.042181, -1.086822, 1.553391, 1, 0, 0.8156863, 1,
1.050242, 0.3816093, 2.789219, 1, 0, 0.8117647, 1,
1.054029, -1.527604, 3.375863, 1, 0, 0.8039216, 1,
1.054859, 0.5198296, 0.7699129, 1, 0, 0.7960784, 1,
1.063282, 0.1942596, 1.620692, 1, 0, 0.7921569, 1,
1.06555, -0.1771691, 1.89183, 1, 0, 0.7843137, 1,
1.066789, -0.1757075, 3.268377, 1, 0, 0.7803922, 1,
1.087201, 0.7403651, 1.053914, 1, 0, 0.772549, 1,
1.092569, -1.909887, 3.622509, 1, 0, 0.7686275, 1,
1.095607, 0.124188, 2.719233, 1, 0, 0.7607843, 1,
1.099215, 0.598708, -0.4462051, 1, 0, 0.7568628, 1,
1.106418, -0.3910058, 2.057154, 1, 0, 0.7490196, 1,
1.108345, 1.937633, 0.01787485, 1, 0, 0.7450981, 1,
1.109557, 0.0708232, 2.175953, 1, 0, 0.7372549, 1,
1.110203, -0.6912581, 4.037372, 1, 0, 0.7333333, 1,
1.112126, -1.251302, 1.342199, 1, 0, 0.7254902, 1,
1.124316, 0.4607894, 1.21773, 1, 0, 0.7215686, 1,
1.125157, -2.334338, 4.664974, 1, 0, 0.7137255, 1,
1.125507, -0.7475204, 2.097128, 1, 0, 0.7098039, 1,
1.139021, 0.7971086, 0.5713065, 1, 0, 0.7019608, 1,
1.150693, -0.03013963, 3.20058, 1, 0, 0.6941177, 1,
1.173119, -0.2644933, 1.455208, 1, 0, 0.6901961, 1,
1.174467, 0.4477775, -0.2538357, 1, 0, 0.682353, 1,
1.181738, -1.230194, 2.021727, 1, 0, 0.6784314, 1,
1.192003, 0.6582109, 1.05444, 1, 0, 0.6705883, 1,
1.196687, 1.380531, 0.4344048, 1, 0, 0.6666667, 1,
1.198353, -0.8652893, 1.534074, 1, 0, 0.6588235, 1,
1.205039, -1.894511, 2.984475, 1, 0, 0.654902, 1,
1.218726, -0.9502305, 2.315504, 1, 0, 0.6470588, 1,
1.220407, -0.7374207, 1.368456, 1, 0, 0.6431373, 1,
1.221377, 0.8270622, 0.2143016, 1, 0, 0.6352941, 1,
1.221903, -0.00468225, 1.133172, 1, 0, 0.6313726, 1,
1.225534, 0.3552924, 4.34265, 1, 0, 0.6235294, 1,
1.22919, 1.605694, -0.5670738, 1, 0, 0.6196079, 1,
1.23016, 0.8709098, 2.68439, 1, 0, 0.6117647, 1,
1.241258, 1.414323, 0.4204764, 1, 0, 0.6078432, 1,
1.250584, 1.126281, 1.548925, 1, 0, 0.6, 1,
1.250927, 0.5347866, -1.22037, 1, 0, 0.5921569, 1,
1.252645, 0.4098045, 2.115135, 1, 0, 0.5882353, 1,
1.258024, -0.4120393, 1.903633, 1, 0, 0.5803922, 1,
1.259817, -1.234865, 2.917816, 1, 0, 0.5764706, 1,
1.271165, -1.369131, 3.644265, 1, 0, 0.5686275, 1,
1.27637, 0.2690218, 2.295638, 1, 0, 0.5647059, 1,
1.29185, -0.5770385, 2.8473, 1, 0, 0.5568628, 1,
1.294042, 1.350406, 0.4043109, 1, 0, 0.5529412, 1,
1.297618, -1.200605, 2.911993, 1, 0, 0.5450981, 1,
1.300154, -2.54917, 3.182041, 1, 0, 0.5411765, 1,
1.309659, 0.9278958, 0.5152959, 1, 0, 0.5333334, 1,
1.322278, 0.5274246, 1.606339, 1, 0, 0.5294118, 1,
1.329841, 0.6303904, -0.3314022, 1, 0, 0.5215687, 1,
1.331836, 0.5454721, 2.05291, 1, 0, 0.5176471, 1,
1.334228, 0.8699387, -0.2652158, 1, 0, 0.509804, 1,
1.339608, 0.03377161, 1.555517, 1, 0, 0.5058824, 1,
1.35191, 1.29424, 1.640114, 1, 0, 0.4980392, 1,
1.353173, 0.02744602, 1.146915, 1, 0, 0.4901961, 1,
1.370371, 1.110721, 0.9180167, 1, 0, 0.4862745, 1,
1.374118, -0.9263597, 2.550921, 1, 0, 0.4784314, 1,
1.384043, 0.7520232, 1.58533, 1, 0, 0.4745098, 1,
1.394172, 1.674967, 0.6243863, 1, 0, 0.4666667, 1,
1.402332, 1.099018, -0.5373614, 1, 0, 0.4627451, 1,
1.409965, 1.745259, -0.4452278, 1, 0, 0.454902, 1,
1.417045, 0.293451, 1.59632, 1, 0, 0.4509804, 1,
1.421972, -1.108594, 2.466007, 1, 0, 0.4431373, 1,
1.424987, -0.4352804, 0.2980122, 1, 0, 0.4392157, 1,
1.431358, 1.393763, 0.3795789, 1, 0, 0.4313726, 1,
1.437551, -0.494328, 2.016377, 1, 0, 0.427451, 1,
1.443416, -0.9569027, 2.128106, 1, 0, 0.4196078, 1,
1.447882, -0.7629516, 1.293765, 1, 0, 0.4156863, 1,
1.45404, 0.2586917, 1.498439, 1, 0, 0.4078431, 1,
1.455834, 1.114725, 2.190228, 1, 0, 0.4039216, 1,
1.461263, 1.109858, 1.271175, 1, 0, 0.3960784, 1,
1.468905, -0.4253213, 1.185852, 1, 0, 0.3882353, 1,
1.476509, -0.1119738, 0.4528664, 1, 0, 0.3843137, 1,
1.503161, -0.3859985, 1.182126, 1, 0, 0.3764706, 1,
1.513299, 2.249625, 0.2125498, 1, 0, 0.372549, 1,
1.526633, 0.38473, 2.270295, 1, 0, 0.3647059, 1,
1.546006, -1.477754, 2.4985, 1, 0, 0.3607843, 1,
1.548039, -1.330378, 1.388936, 1, 0, 0.3529412, 1,
1.553885, -0.4035889, 2.124764, 1, 0, 0.3490196, 1,
1.573249, 0.9088585, 0.87536, 1, 0, 0.3411765, 1,
1.574445, -0.06837262, 3.471959, 1, 0, 0.3372549, 1,
1.576241, 0.08735023, 2.110094, 1, 0, 0.3294118, 1,
1.581703, -1.131311, 0.733772, 1, 0, 0.3254902, 1,
1.595117, -2.393338, 2.995492, 1, 0, 0.3176471, 1,
1.596958, 0.5068176, 0.4511925, 1, 0, 0.3137255, 1,
1.606195, -0.04384031, 1.000198, 1, 0, 0.3058824, 1,
1.625985, 1.062835, 0.07589411, 1, 0, 0.2980392, 1,
1.647025, -0.4869066, 0.931112, 1, 0, 0.2941177, 1,
1.679357, 1.66677, 2.083003, 1, 0, 0.2862745, 1,
1.695665, 1.513724, 0.7041372, 1, 0, 0.282353, 1,
1.709487, 0.8441097, 2.302146, 1, 0, 0.2745098, 1,
1.73319, -0.2066954, 2.01807, 1, 0, 0.2705882, 1,
1.736317, 0.6813661, 2.334021, 1, 0, 0.2627451, 1,
1.748447, -2.539699, 4.699514, 1, 0, 0.2588235, 1,
1.787168, -0.06989852, 2.216182, 1, 0, 0.2509804, 1,
1.798999, -0.7026525, 3.337523, 1, 0, 0.2470588, 1,
1.827004, -0.1121994, 0.1501442, 1, 0, 0.2392157, 1,
1.835697, 1.328223, 1.111068, 1, 0, 0.2352941, 1,
1.861592, -0.7704635, 3.073738, 1, 0, 0.227451, 1,
1.890416, 0.6668733, 1.167102, 1, 0, 0.2235294, 1,
1.892706, 0.07127549, 1.480125, 1, 0, 0.2156863, 1,
1.914449, -0.5069685, 1.07529, 1, 0, 0.2117647, 1,
1.938911, -0.7108243, 2.735414, 1, 0, 0.2039216, 1,
1.941624, 0.482072, 1.366911, 1, 0, 0.1960784, 1,
1.962046, 0.1549091, 1.704859, 1, 0, 0.1921569, 1,
1.970884, 0.774419, 2.410129, 1, 0, 0.1843137, 1,
1.972892, 1.337019, 1.503943, 1, 0, 0.1803922, 1,
1.993134, -1.308849, 3.699254, 1, 0, 0.172549, 1,
1.993606, 0.3167813, 0.192441, 1, 0, 0.1686275, 1,
2.00253, 1.701927, 0.4856708, 1, 0, 0.1607843, 1,
2.019333, 0.9832761, 2.72818, 1, 0, 0.1568628, 1,
2.020455, 0.8148754, 1.518481, 1, 0, 0.1490196, 1,
2.021307, -0.1292481, 2.01492, 1, 0, 0.145098, 1,
2.033636, -0.02307392, 0.6037307, 1, 0, 0.1372549, 1,
2.036296, 1.02835, -1.245328, 1, 0, 0.1333333, 1,
2.075799, 0.1461665, 1.528727, 1, 0, 0.1254902, 1,
2.088377, -0.1934515, 2.877041, 1, 0, 0.1215686, 1,
2.095895, -0.1668373, 3.063352, 1, 0, 0.1137255, 1,
2.115491, -0.05369972, 2.652584, 1, 0, 0.1098039, 1,
2.135595, -0.06776114, 0.9057232, 1, 0, 0.1019608, 1,
2.137991, -0.4903551, 1.294837, 1, 0, 0.09411765, 1,
2.168162, -1.261418, 1.445344, 1, 0, 0.09019608, 1,
2.186188, 0.2170044, 0.4165817, 1, 0, 0.08235294, 1,
2.194466, -0.6454256, 3.208507, 1, 0, 0.07843138, 1,
2.214967, 3.016149, -0.3172002, 1, 0, 0.07058824, 1,
2.22469, -1.300694, 2.231926, 1, 0, 0.06666667, 1,
2.352447, -0.8794679, 1.811283, 1, 0, 0.05882353, 1,
2.372726, -0.2841357, 1.799929, 1, 0, 0.05490196, 1,
2.552234, -1.010557, 1.868067, 1, 0, 0.04705882, 1,
2.620744, 1.090967, 0.4637032, 1, 0, 0.04313726, 1,
2.665023, -0.6666433, 2.426291, 1, 0, 0.03529412, 1,
2.707421, -0.1570284, 2.456184, 1, 0, 0.03137255, 1,
2.715285, -0.3138205, 1.311024, 1, 0, 0.02352941, 1,
3.12995, 0.4298738, 2.267631, 1, 0, 0.01960784, 1,
3.240852, 0.9016403, 0.4268147, 1, 0, 0.01176471, 1,
3.474448, 0.9245433, 0.5052638, 1, 0, 0.007843138, 1
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
0.4026148, -3.70648, -6.744965, 0, -0.5, 0.5, 0.5,
0.4026148, -3.70648, -6.744965, 1, -0.5, 0.5, 0.5,
0.4026148, -3.70648, -6.744965, 1, 1.5, 0.5, 0.5,
0.4026148, -3.70648, -6.744965, 0, 1.5, 0.5, 0.5
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
-3.710569, 0.1548219, -6.744965, 0, -0.5, 0.5, 0.5,
-3.710569, 0.1548219, -6.744965, 1, -0.5, 0.5, 0.5,
-3.710569, 0.1548219, -6.744965, 1, 1.5, 0.5, 0.5,
-3.710569, 0.1548219, -6.744965, 0, 1.5, 0.5, 0.5
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
-3.710569, -3.70648, 0.5039051, 0, -0.5, 0.5, 0.5,
-3.710569, -3.70648, 0.5039051, 1, -0.5, 0.5, 0.5,
-3.710569, -3.70648, 0.5039051, 1, 1.5, 0.5, 0.5,
-3.710569, -3.70648, 0.5039051, 0, 1.5, 0.5, 0.5
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
-2, -2.81541, -5.072149,
3, -2.81541, -5.072149,
-2, -2.81541, -5.072149,
-2, -2.963922, -5.350952,
-1, -2.81541, -5.072149,
-1, -2.963922, -5.350952,
0, -2.81541, -5.072149,
0, -2.963922, -5.350952,
1, -2.81541, -5.072149,
1, -2.963922, -5.350952,
2, -2.81541, -5.072149,
2, -2.963922, -5.350952,
3, -2.81541, -5.072149,
3, -2.963922, -5.350952
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
-2, -3.260945, -5.908557, 0, -0.5, 0.5, 0.5,
-2, -3.260945, -5.908557, 1, -0.5, 0.5, 0.5,
-2, -3.260945, -5.908557, 1, 1.5, 0.5, 0.5,
-2, -3.260945, -5.908557, 0, 1.5, 0.5, 0.5,
-1, -3.260945, -5.908557, 0, -0.5, 0.5, 0.5,
-1, -3.260945, -5.908557, 1, -0.5, 0.5, 0.5,
-1, -3.260945, -5.908557, 1, 1.5, 0.5, 0.5,
-1, -3.260945, -5.908557, 0, 1.5, 0.5, 0.5,
0, -3.260945, -5.908557, 0, -0.5, 0.5, 0.5,
0, -3.260945, -5.908557, 1, -0.5, 0.5, 0.5,
0, -3.260945, -5.908557, 1, 1.5, 0.5, 0.5,
0, -3.260945, -5.908557, 0, 1.5, 0.5, 0.5,
1, -3.260945, -5.908557, 0, -0.5, 0.5, 0.5,
1, -3.260945, -5.908557, 1, -0.5, 0.5, 0.5,
1, -3.260945, -5.908557, 1, 1.5, 0.5, 0.5,
1, -3.260945, -5.908557, 0, 1.5, 0.5, 0.5,
2, -3.260945, -5.908557, 0, -0.5, 0.5, 0.5,
2, -3.260945, -5.908557, 1, -0.5, 0.5, 0.5,
2, -3.260945, -5.908557, 1, 1.5, 0.5, 0.5,
2, -3.260945, -5.908557, 0, 1.5, 0.5, 0.5,
3, -3.260945, -5.908557, 0, -0.5, 0.5, 0.5,
3, -3.260945, -5.908557, 1, -0.5, 0.5, 0.5,
3, -3.260945, -5.908557, 1, 1.5, 0.5, 0.5,
3, -3.260945, -5.908557, 0, 1.5, 0.5, 0.5
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
-2.761373, -2, -5.072149,
-2.761373, 3, -5.072149,
-2.761373, -2, -5.072149,
-2.919572, -2, -5.350952,
-2.761373, -1, -5.072149,
-2.919572, -1, -5.350952,
-2.761373, 0, -5.072149,
-2.919572, 0, -5.350952,
-2.761373, 1, -5.072149,
-2.919572, 1, -5.350952,
-2.761373, 2, -5.072149,
-2.919572, 2, -5.350952,
-2.761373, 3, -5.072149,
-2.919572, 3, -5.350952
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
-3.235971, -2, -5.908557, 0, -0.5, 0.5, 0.5,
-3.235971, -2, -5.908557, 1, -0.5, 0.5, 0.5,
-3.235971, -2, -5.908557, 1, 1.5, 0.5, 0.5,
-3.235971, -2, -5.908557, 0, 1.5, 0.5, 0.5,
-3.235971, -1, -5.908557, 0, -0.5, 0.5, 0.5,
-3.235971, -1, -5.908557, 1, -0.5, 0.5, 0.5,
-3.235971, -1, -5.908557, 1, 1.5, 0.5, 0.5,
-3.235971, -1, -5.908557, 0, 1.5, 0.5, 0.5,
-3.235971, 0, -5.908557, 0, -0.5, 0.5, 0.5,
-3.235971, 0, -5.908557, 1, -0.5, 0.5, 0.5,
-3.235971, 0, -5.908557, 1, 1.5, 0.5, 0.5,
-3.235971, 0, -5.908557, 0, 1.5, 0.5, 0.5,
-3.235971, 1, -5.908557, 0, -0.5, 0.5, 0.5,
-3.235971, 1, -5.908557, 1, -0.5, 0.5, 0.5,
-3.235971, 1, -5.908557, 1, 1.5, 0.5, 0.5,
-3.235971, 1, -5.908557, 0, 1.5, 0.5, 0.5,
-3.235971, 2, -5.908557, 0, -0.5, 0.5, 0.5,
-3.235971, 2, -5.908557, 1, -0.5, 0.5, 0.5,
-3.235971, 2, -5.908557, 1, 1.5, 0.5, 0.5,
-3.235971, 2, -5.908557, 0, 1.5, 0.5, 0.5,
-3.235971, 3, -5.908557, 0, -0.5, 0.5, 0.5,
-3.235971, 3, -5.908557, 1, -0.5, 0.5, 0.5,
-3.235971, 3, -5.908557, 1, 1.5, 0.5, 0.5,
-3.235971, 3, -5.908557, 0, 1.5, 0.5, 0.5
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
-2.761373, -2.81541, -4,
-2.761373, -2.81541, 4,
-2.761373, -2.81541, -4,
-2.919572, -2.963922, -4,
-2.761373, -2.81541, -2,
-2.919572, -2.963922, -2,
-2.761373, -2.81541, 0,
-2.919572, -2.963922, 0,
-2.761373, -2.81541, 2,
-2.919572, -2.963922, 2,
-2.761373, -2.81541, 4,
-2.919572, -2.963922, 4
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
-3.235971, -3.260945, -4, 0, -0.5, 0.5, 0.5,
-3.235971, -3.260945, -4, 1, -0.5, 0.5, 0.5,
-3.235971, -3.260945, -4, 1, 1.5, 0.5, 0.5,
-3.235971, -3.260945, -4, 0, 1.5, 0.5, 0.5,
-3.235971, -3.260945, -2, 0, -0.5, 0.5, 0.5,
-3.235971, -3.260945, -2, 1, -0.5, 0.5, 0.5,
-3.235971, -3.260945, -2, 1, 1.5, 0.5, 0.5,
-3.235971, -3.260945, -2, 0, 1.5, 0.5, 0.5,
-3.235971, -3.260945, 0, 0, -0.5, 0.5, 0.5,
-3.235971, -3.260945, 0, 1, -0.5, 0.5, 0.5,
-3.235971, -3.260945, 0, 1, 1.5, 0.5, 0.5,
-3.235971, -3.260945, 0, 0, 1.5, 0.5, 0.5,
-3.235971, -3.260945, 2, 0, -0.5, 0.5, 0.5,
-3.235971, -3.260945, 2, 1, -0.5, 0.5, 0.5,
-3.235971, -3.260945, 2, 1, 1.5, 0.5, 0.5,
-3.235971, -3.260945, 2, 0, 1.5, 0.5, 0.5,
-3.235971, -3.260945, 4, 0, -0.5, 0.5, 0.5,
-3.235971, -3.260945, 4, 1, -0.5, 0.5, 0.5,
-3.235971, -3.260945, 4, 1, 1.5, 0.5, 0.5,
-3.235971, -3.260945, 4, 0, 1.5, 0.5, 0.5
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
-2.761373, -2.81541, -5.072149,
-2.761373, 3.125054, -5.072149,
-2.761373, -2.81541, 6.079959,
-2.761373, 3.125054, 6.079959,
-2.761373, -2.81541, -5.072149,
-2.761373, -2.81541, 6.079959,
-2.761373, 3.125054, -5.072149,
-2.761373, 3.125054, 6.079959,
-2.761373, -2.81541, -5.072149,
3.566603, -2.81541, -5.072149,
-2.761373, -2.81541, 6.079959,
3.566603, -2.81541, 6.079959,
-2.761373, 3.125054, -5.072149,
3.566603, 3.125054, -5.072149,
-2.761373, 3.125054, 6.079959,
3.566603, 3.125054, 6.079959,
3.566603, -2.81541, -5.072149,
3.566603, 3.125054, -5.072149,
3.566603, -2.81541, 6.079959,
3.566603, 3.125054, 6.079959,
3.566603, -2.81541, -5.072149,
3.566603, -2.81541, 6.079959,
3.566603, 3.125054, -5.072149,
3.566603, 3.125054, 6.079959
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
var radius = 7.545996;
var distance = 33.57299;
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
mvMatrix.translate( -0.4026148, -0.1548219, -0.5039051 );
mvMatrix.scale( 1.289335, 1.373441, 0.7315997 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.57299);
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
## Error in read.table("Carbamidin.xyz"): no lines available in input
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
-2.669218, -0.1467704, -0.7194443, 0, 0, 1, 1, 1,
-2.655956, -0.2296974, 0.1309795, 1, 0, 0, 1, 1,
-2.638586, -0.5688399, -2.48865, 1, 0, 0, 1, 1,
-2.624773, 1.814592, -1.21059, 1, 0, 0, 1, 1,
-2.59492, -1.052356, -1.98393, 1, 0, 0, 1, 1,
-2.589533, 0.5536882, -0.3771758, 1, 0, 0, 1, 1,
-2.575028, -0.03972393, -1.49306, 0, 0, 0, 1, 1,
-2.436258, 2.529401, -1.586497, 0, 0, 0, 1, 1,
-2.414166, -1.056981, -4.140404, 0, 0, 0, 1, 1,
-2.383881, 0.2369125, -2.50997, 0, 0, 0, 1, 1,
-2.364642, 0.5587935, -1.390384, 0, 0, 0, 1, 1,
-2.306252, 0.0975764, -2.564262, 0, 0, 0, 1, 1,
-2.303562, 0.3417798, -1.261251, 0, 0, 0, 1, 1,
-2.253854, 0.5348573, -3.469247, 1, 1, 1, 1, 1,
-2.245153, 1.830552, -2.251333, 1, 1, 1, 1, 1,
-2.197104, 0.06621762, -0.6020676, 1, 1, 1, 1, 1,
-2.189647, 0.4595458, -1.032058, 1, 1, 1, 1, 1,
-2.138314, -1.758293, -0.9921369, 1, 1, 1, 1, 1,
-2.132389, 0.9977418, -2.350448, 1, 1, 1, 1, 1,
-2.119944, 0.6644409, -2.217424, 1, 1, 1, 1, 1,
-2.082342, -0.8023699, -0.7665083, 1, 1, 1, 1, 1,
-2.076868, -0.9740698, -2.725112, 1, 1, 1, 1, 1,
-2.063317, 0.1161093, -2.386694, 1, 1, 1, 1, 1,
-2.061128, 0.5067164, -2.199104, 1, 1, 1, 1, 1,
-2.041348, 1.361424, 0.3174744, 1, 1, 1, 1, 1,
-2.004642, -0.1264081, -2.225567, 1, 1, 1, 1, 1,
-1.993124, 0.6370515, -1.305304, 1, 1, 1, 1, 1,
-1.96581, -0.03816233, -2.735818, 1, 1, 1, 1, 1,
-1.884486, -0.04969351, -1.224408, 0, 0, 1, 1, 1,
-1.855631, -0.8448131, -1.827154, 1, 0, 0, 1, 1,
-1.849485, -0.2615047, -0.9970405, 1, 0, 0, 1, 1,
-1.843335, 0.7512105, 0.2761126, 1, 0, 0, 1, 1,
-1.836802, -1.46947, -2.712976, 1, 0, 0, 1, 1,
-1.827761, -1.257443, -4.177534, 1, 0, 0, 1, 1,
-1.815345, 0.4284608, -0.6146609, 0, 0, 0, 1, 1,
-1.790798, -1.569824, -0.2253896, 0, 0, 0, 1, 1,
-1.786942, 1.508766, -0.7282809, 0, 0, 0, 1, 1,
-1.754585, -2.262356, -3.521517, 0, 0, 0, 1, 1,
-1.729317, 0.4070927, -2.24707, 0, 0, 0, 1, 1,
-1.716621, -1.016077, -2.599357, 0, 0, 0, 1, 1,
-1.67839, 1.621907, -1.669372, 0, 0, 0, 1, 1,
-1.651812, 1.024359, -2.300416, 1, 1, 1, 1, 1,
-1.647574, -0.764955, -1.844334, 1, 1, 1, 1, 1,
-1.613306, -2.241282, -1.594265, 1, 1, 1, 1, 1,
-1.597459, 0.4383252, -1.544737, 1, 1, 1, 1, 1,
-1.591041, 1.091356, -0.6422805, 1, 1, 1, 1, 1,
-1.582162, 2.156403, -1.393859, 1, 1, 1, 1, 1,
-1.576664, 1.529682, -1.475873, 1, 1, 1, 1, 1,
-1.570613, 1.204957, -0.7383783, 1, 1, 1, 1, 1,
-1.562709, -0.9904009, -3.078951, 1, 1, 1, 1, 1,
-1.558649, -0.09660085, -2.473489, 1, 1, 1, 1, 1,
-1.555286, -0.5459683, -2.427481, 1, 1, 1, 1, 1,
-1.547979, -1.224138, -4.53291, 1, 1, 1, 1, 1,
-1.53526, 0.5966423, -1.552469, 1, 1, 1, 1, 1,
-1.522559, -1.011992, -1.641331, 1, 1, 1, 1, 1,
-1.516366, 0.7051783, -2.02528, 1, 1, 1, 1, 1,
-1.504464, 0.6466051, -0.614036, 0, 0, 1, 1, 1,
-1.499402, 0.496028, -1.507796, 1, 0, 0, 1, 1,
-1.484813, -1.083322, -2.367768, 1, 0, 0, 1, 1,
-1.480223, 0.2070536, -1.222738, 1, 0, 0, 1, 1,
-1.480177, 0.9374291, -1.164652, 1, 0, 0, 1, 1,
-1.47537, 1.127722, -0.5579675, 1, 0, 0, 1, 1,
-1.468812, 1.194861, -0.4004898, 0, 0, 0, 1, 1,
-1.466435, -1.024248, -3.067464, 0, 0, 0, 1, 1,
-1.459881, 0.878756, -1.037995, 0, 0, 0, 1, 1,
-1.457483, -0.9910816, -3.201286, 0, 0, 0, 1, 1,
-1.456548, 0.3848662, -3.698502, 0, 0, 0, 1, 1,
-1.449761, 0.7582861, -0.7434219, 0, 0, 0, 1, 1,
-1.445189, 1.166655, -2.69411, 0, 0, 0, 1, 1,
-1.442949, 0.1136059, -1.872408, 1, 1, 1, 1, 1,
-1.43067, 2.036276, -1.223054, 1, 1, 1, 1, 1,
-1.429775, -1.188963, -1.058269, 1, 1, 1, 1, 1,
-1.42817, 0.5441295, 0.4462447, 1, 1, 1, 1, 1,
-1.419399, -0.03961476, -0.2705083, 1, 1, 1, 1, 1,
-1.416391, 0.699542, 0.5163997, 1, 1, 1, 1, 1,
-1.407749, -0.0668716, -0.2597317, 1, 1, 1, 1, 1,
-1.399811, -0.7651202, -1.724608, 1, 1, 1, 1, 1,
-1.397937, -1.925924, -2.167108, 1, 1, 1, 1, 1,
-1.389557, 0.1555273, -0.7639854, 1, 1, 1, 1, 1,
-1.386644, -1.557409, -3.378832, 1, 1, 1, 1, 1,
-1.375821, -0.4492899, -2.78231, 1, 1, 1, 1, 1,
-1.375656, -0.7344146, -3.497022, 1, 1, 1, 1, 1,
-1.364775, 0.3127206, -1.338114, 1, 1, 1, 1, 1,
-1.362998, 0.1206924, -0.7981012, 1, 1, 1, 1, 1,
-1.360121, 0.7052683, -1.404097, 0, 0, 1, 1, 1,
-1.339949, -2.397708, -4.659599, 1, 0, 0, 1, 1,
-1.339154, 0.5961917, -3.006119, 1, 0, 0, 1, 1,
-1.320901, 1.571045, -0.677045, 1, 0, 0, 1, 1,
-1.302517, -0.2639047, -1.947154, 1, 0, 0, 1, 1,
-1.291961, -0.09179667, -1.399551, 1, 0, 0, 1, 1,
-1.286754, 0.5305805, 0.1853235, 0, 0, 0, 1, 1,
-1.278455, 0.6817118, -0.3413505, 0, 0, 0, 1, 1,
-1.275009, -0.2182604, -2.959132, 0, 0, 0, 1, 1,
-1.272671, -1.651007, -2.460142, 0, 0, 0, 1, 1,
-1.269777, 0.5454397, -0.1168719, 0, 0, 0, 1, 1,
-1.26914, 0.0900141, -1.520057, 0, 0, 0, 1, 1,
-1.266135, 1.165842, -2.009166, 0, 0, 0, 1, 1,
-1.266101, 0.5900294, -0.6936877, 1, 1, 1, 1, 1,
-1.264295, 1.329458, -1.007509, 1, 1, 1, 1, 1,
-1.241272, 0.8906736, 0.7388447, 1, 1, 1, 1, 1,
-1.23648, -0.9968625, -2.083114, 1, 1, 1, 1, 1,
-1.230953, 0.5148513, -2.254486, 1, 1, 1, 1, 1,
-1.214365, -0.6236629, -2.430585, 1, 1, 1, 1, 1,
-1.213685, 0.916248, -2.093551, 1, 1, 1, 1, 1,
-1.208431, -1.409044, -3.195825, 1, 1, 1, 1, 1,
-1.205668, 0.6230525, 0.5116085, 1, 1, 1, 1, 1,
-1.187619, 0.9600796, -0.9072502, 1, 1, 1, 1, 1,
-1.17754, 1.195961, -0.4344263, 1, 1, 1, 1, 1,
-1.177138, 0.2200857, -0.8920801, 1, 1, 1, 1, 1,
-1.177032, 1.618734, 0.9916856, 1, 1, 1, 1, 1,
-1.175763, 1.062933, -0.4497536, 1, 1, 1, 1, 1,
-1.16836, -1.178114, -2.873946, 1, 1, 1, 1, 1,
-1.163161, 0.5658521, -0.9862295, 0, 0, 1, 1, 1,
-1.16268, -0.1589193, -2.194, 1, 0, 0, 1, 1,
-1.152896, -0.3455719, -2.148647, 1, 0, 0, 1, 1,
-1.152843, -0.05695603, -1.587227, 1, 0, 0, 1, 1,
-1.14708, -0.5099909, -4.106977, 1, 0, 0, 1, 1,
-1.137386, -0.7377151, -1.836483, 1, 0, 0, 1, 1,
-1.13515, 0.4205483, -2.527531, 0, 0, 0, 1, 1,
-1.133945, -0.2315057, -2.004176, 0, 0, 0, 1, 1,
-1.133709, 1.109932, 0.1375495, 0, 0, 0, 1, 1,
-1.119086, 1.248034, 1.477155, 0, 0, 0, 1, 1,
-1.1096, -1.317508, -0.5696064, 0, 0, 0, 1, 1,
-1.099427, -0.4751259, -0.2591891, 0, 0, 0, 1, 1,
-1.097108, -0.06227507, -2.297588, 0, 0, 0, 1, 1,
-1.094728, -0.3778588, -3.510016, 1, 1, 1, 1, 1,
-1.090984, -0.124788, 0.0198795, 1, 1, 1, 1, 1,
-1.089827, 0.860031, -1.609603, 1, 1, 1, 1, 1,
-1.081312, 1.361893, -2.120293, 1, 1, 1, 1, 1,
-1.081092, -0.4464053, -1.829963, 1, 1, 1, 1, 1,
-1.073642, 0.4187303, 0.4345975, 1, 1, 1, 1, 1,
-1.068931, 1.891114, 0.1976361, 1, 1, 1, 1, 1,
-1.066634, -1.913411, -2.462395, 1, 1, 1, 1, 1,
-1.059408, 2.343014, 0.05782086, 1, 1, 1, 1, 1,
-1.057897, -0.51397, -0.4596232, 1, 1, 1, 1, 1,
-1.057594, 1.610189, 0.3012322, 1, 1, 1, 1, 1,
-1.0566, 0.7930981, -1.676817, 1, 1, 1, 1, 1,
-1.052484, -1.264239, -3.617459, 1, 1, 1, 1, 1,
-1.052259, 0.7230495, -2.432909, 1, 1, 1, 1, 1,
-1.049446, -1.780807, -2.008037, 1, 1, 1, 1, 1,
-1.037638, 0.006417386, -0.7077387, 0, 0, 1, 1, 1,
-1.033816, 1.281633, -1.207471, 1, 0, 0, 1, 1,
-1.027132, -0.799348, -0.9277868, 1, 0, 0, 1, 1,
-1.019521, 0.9049006, -1.336087, 1, 0, 0, 1, 1,
-1.017226, 0.6106505, -0.8299811, 1, 0, 0, 1, 1,
-1.015492, -0.6621683, -2.014708, 1, 0, 0, 1, 1,
-1.011466, -1.572335, -2.566244, 0, 0, 0, 1, 1,
-1.00097, -1.182913, -2.931549, 0, 0, 0, 1, 1,
-0.9989872, -1.494793, -2.277667, 0, 0, 0, 1, 1,
-0.9974307, 1.422835, -0.3430252, 0, 0, 0, 1, 1,
-0.9973667, -0.1082715, -0.5657805, 0, 0, 0, 1, 1,
-0.9968505, 0.8480422, -0.2570744, 0, 0, 0, 1, 1,
-0.9945918, -0.5756837, -2.032205, 0, 0, 0, 1, 1,
-0.9902529, -0.4596325, -0.2357121, 1, 1, 1, 1, 1,
-0.9880402, -1.537384, -4.909739, 1, 1, 1, 1, 1,
-0.9878164, 0.5797283, 0.4570836, 1, 1, 1, 1, 1,
-0.9827711, -0.6197931, -2.755578, 1, 1, 1, 1, 1,
-0.9827305, 0.832994, 0.8083062, 1, 1, 1, 1, 1,
-0.9811481, 1.045801, -0.6387378, 1, 1, 1, 1, 1,
-0.979907, -0.7597547, -0.681505, 1, 1, 1, 1, 1,
-0.9790807, 0.4949903, -1.172561, 1, 1, 1, 1, 1,
-0.975037, 0.4970895, -0.8847943, 1, 1, 1, 1, 1,
-0.9741529, -0.188168, -1.880167, 1, 1, 1, 1, 1,
-0.9710604, -0.1586441, -0.5934643, 1, 1, 1, 1, 1,
-0.9710274, 0.2777635, 0.8448797, 1, 1, 1, 1, 1,
-0.9665231, 1.496817, -1.559286, 1, 1, 1, 1, 1,
-0.9553356, 0.05098045, -1.222357, 1, 1, 1, 1, 1,
-0.951193, 0.8500675, 1.599772, 1, 1, 1, 1, 1,
-0.9349117, 0.2406919, -0.2946962, 0, 0, 1, 1, 1,
-0.9327572, 1.511546, -0.4721324, 1, 0, 0, 1, 1,
-0.9279397, -1.86395, -4.005447, 1, 0, 0, 1, 1,
-0.9241611, -0.1455317, -1.73532, 1, 0, 0, 1, 1,
-0.9232064, 0.9063124, -0.1948716, 1, 0, 0, 1, 1,
-0.9230095, -0.3763301, -0.7348889, 1, 0, 0, 1, 1,
-0.9227766, -0.8153774, -2.538867, 0, 0, 0, 1, 1,
-0.9147618, 0.1758475, 0.2218212, 0, 0, 0, 1, 1,
-0.9105072, 0.5940318, -1.793982, 0, 0, 0, 1, 1,
-0.9092115, -0.9253126, -2.271811, 0, 0, 0, 1, 1,
-0.9090067, -1.58883, -2.501232, 0, 0, 0, 1, 1,
-0.9072609, -0.4067736, -0.8836603, 0, 0, 0, 1, 1,
-0.9064984, -1.311244, -4.298131, 0, 0, 0, 1, 1,
-0.9005859, 0.5783297, -2.263532, 1, 1, 1, 1, 1,
-0.8993104, 0.9298643, -1.147596, 1, 1, 1, 1, 1,
-0.8978922, 0.7467454, -2.471571, 1, 1, 1, 1, 1,
-0.8977998, -0.7537476, -2.489186, 1, 1, 1, 1, 1,
-0.8950216, 0.7621338, 0.2606435, 1, 1, 1, 1, 1,
-0.8930097, 0.4100866, 1.960065, 1, 1, 1, 1, 1,
-0.8889561, 2.366782, 0.7820632, 1, 1, 1, 1, 1,
-0.8804629, 1.701847, -2.14171, 1, 1, 1, 1, 1,
-0.8761501, 0.2628014, -0.7812775, 1, 1, 1, 1, 1,
-0.8671438, 0.6028726, -1.805448, 1, 1, 1, 1, 1,
-0.8671335, 0.01186543, -0.8809199, 1, 1, 1, 1, 1,
-0.861451, 2.080944, -0.6746802, 1, 1, 1, 1, 1,
-0.8596875, -0.171576, -0.3176811, 1, 1, 1, 1, 1,
-0.8545793, 1.025434, 0.2846202, 1, 1, 1, 1, 1,
-0.8515776, -0.34117, -2.194785, 1, 1, 1, 1, 1,
-0.8427829, 0.07333471, -1.225004, 0, 0, 1, 1, 1,
-0.8382577, -0.1045164, -1.410947, 1, 0, 0, 1, 1,
-0.8320579, 0.1029271, -2.47759, 1, 0, 0, 1, 1,
-0.8295427, -1.56293, -3.376501, 1, 0, 0, 1, 1,
-0.8293403, 0.04197479, -2.264597, 1, 0, 0, 1, 1,
-0.8264581, 0.8922524, -1.422596, 1, 0, 0, 1, 1,
-0.8254232, -0.3616689, -4.311533, 0, 0, 0, 1, 1,
-0.8237059, 0.3914602, -0.6957836, 0, 0, 0, 1, 1,
-0.8228012, -1.602403, -2.839014, 0, 0, 0, 1, 1,
-0.8203928, -1.338715, -0.6165365, 0, 0, 0, 1, 1,
-0.8191481, 0.02479417, -2.275426, 0, 0, 0, 1, 1,
-0.8181201, 0.6190797, -0.5739527, 0, 0, 0, 1, 1,
-0.8124936, -0.5478745, -3.038464, 0, 0, 0, 1, 1,
-0.8118981, 2.829354, 0.5444753, 1, 1, 1, 1, 1,
-0.8086647, 1.006819, -0.5581826, 1, 1, 1, 1, 1,
-0.799886, 0.6060275, 2.609258, 1, 1, 1, 1, 1,
-0.7932475, 0.7591341, -0.1288373, 1, 1, 1, 1, 1,
-0.7890975, -0.5215875, -2.093234, 1, 1, 1, 1, 1,
-0.7829036, -0.6335618, -1.678386, 1, 1, 1, 1, 1,
-0.7828733, -1.323588, -0.4144208, 1, 1, 1, 1, 1,
-0.7791848, -0.1333238, -0.996114, 1, 1, 1, 1, 1,
-0.7774112, -0.1012136, -1.865633, 1, 1, 1, 1, 1,
-0.7744787, 1.234092, -1.842811, 1, 1, 1, 1, 1,
-0.7614221, 0.3130842, -3.826326, 1, 1, 1, 1, 1,
-0.7602713, 0.2508963, -0.6223667, 1, 1, 1, 1, 1,
-0.7564694, 1.993226, 0.9043174, 1, 1, 1, 1, 1,
-0.7482793, 0.5110884, -2.945887, 1, 1, 1, 1, 1,
-0.7439561, -0.2619498, -1.550141, 1, 1, 1, 1, 1,
-0.7435227, -0.2382539, -1.383844, 0, 0, 1, 1, 1,
-0.7398589, -0.4844072, -2.219157, 1, 0, 0, 1, 1,
-0.7391353, 0.8971106, -1.318336, 1, 0, 0, 1, 1,
-0.7377478, 0.4292819, -2.670555, 1, 0, 0, 1, 1,
-0.7354691, -1.12815, -1.736073, 1, 0, 0, 1, 1,
-0.7330667, -1.273122, 0.4344091, 1, 0, 0, 1, 1,
-0.7330545, -1.923841, -1.737781, 0, 0, 0, 1, 1,
-0.7323415, -0.04332417, -2.271126, 0, 0, 0, 1, 1,
-0.7301045, -1.227274, -2.914604, 0, 0, 0, 1, 1,
-0.7292713, 1.45583, -0.9435636, 0, 0, 0, 1, 1,
-0.7248094, 1.127019, -0.6366524, 0, 0, 0, 1, 1,
-0.7204636, 1.60524, -0.03457989, 0, 0, 0, 1, 1,
-0.7193163, -0.2550613, -3.113173, 0, 0, 0, 1, 1,
-0.7136688, 1.552747, 0.1926809, 1, 1, 1, 1, 1,
-0.7079689, 1.013001, 0.3149323, 1, 1, 1, 1, 1,
-0.7075102, -1.131639, -3.182567, 1, 1, 1, 1, 1,
-0.7066694, -1.851273, -2.303063, 1, 1, 1, 1, 1,
-0.7060882, -0.6267563, -1.95832, 1, 1, 1, 1, 1,
-0.7044674, 0.4867432, 1.672732, 1, 1, 1, 1, 1,
-0.702207, 0.8810114, 0.07076675, 1, 1, 1, 1, 1,
-0.7013676, 1.319446, -0.6091726, 1, 1, 1, 1, 1,
-0.6972252, 1.112348, -0.218277, 1, 1, 1, 1, 1,
-0.6942432, 0.3657545, -1.511, 1, 1, 1, 1, 1,
-0.6918448, 1.105803, 0.06434847, 1, 1, 1, 1, 1,
-0.6913597, 2.83713, -2.337224, 1, 1, 1, 1, 1,
-0.6912747, 0.8810902, -2.238963, 1, 1, 1, 1, 1,
-0.6896298, 0.9379011, 0.3605615, 1, 1, 1, 1, 1,
-0.6850994, -0.7745901, -1.822913, 1, 1, 1, 1, 1,
-0.6806242, -1.817792, -2.092073, 0, 0, 1, 1, 1,
-0.6791957, 0.2482564, -1.812784, 1, 0, 0, 1, 1,
-0.6786214, -0.9605465, -3.631307, 1, 0, 0, 1, 1,
-0.6761905, 0.2634147, -0.6921378, 1, 0, 0, 1, 1,
-0.6734008, 0.02985002, -0.8864658, 1, 0, 0, 1, 1,
-0.6733069, -0.4457843, -0.9299828, 1, 0, 0, 1, 1,
-0.6711748, -0.3081886, -2.458193, 0, 0, 0, 1, 1,
-0.6691278, 0.1620341, -1.047229, 0, 0, 0, 1, 1,
-0.6689014, 0.2422361, -1.344091, 0, 0, 0, 1, 1,
-0.66856, 1.04506, -0.2129873, 0, 0, 0, 1, 1,
-0.6566616, -0.2147516, -0.8545622, 0, 0, 0, 1, 1,
-0.6526256, 1.205607, 0.03434664, 0, 0, 0, 1, 1,
-0.6518468, 0.1854029, 1.261391, 0, 0, 0, 1, 1,
-0.649658, -1.028387, -2.971454, 1, 1, 1, 1, 1,
-0.6450925, -1.966673, -0.2445488, 1, 1, 1, 1, 1,
-0.6443764, 0.2956893, -1.836058, 1, 1, 1, 1, 1,
-0.6401888, 0.3454094, -2.364357, 1, 1, 1, 1, 1,
-0.6396934, 0.1112241, -0.253362, 1, 1, 1, 1, 1,
-0.6359082, -0.5222434, -2.482591, 1, 1, 1, 1, 1,
-0.6337924, 1.974487, 0.6614824, 1, 1, 1, 1, 1,
-0.6288663, 0.4333853, -1.38035, 1, 1, 1, 1, 1,
-0.6283848, 1.624494, -1.653749, 1, 1, 1, 1, 1,
-0.6226019, 0.2414792, -0.7485079, 1, 1, 1, 1, 1,
-0.6192688, 0.8869364, -1.37114, 1, 1, 1, 1, 1,
-0.6178012, 1.596622, 0.438232, 1, 1, 1, 1, 1,
-0.6109719, -1.35629, -2.366026, 1, 1, 1, 1, 1,
-0.6100754, -0.6839037, -4.437683, 1, 1, 1, 1, 1,
-0.6051232, 0.290251, -0.1415518, 1, 1, 1, 1, 1,
-0.5967302, 1.007737, -0.5283245, 0, 0, 1, 1, 1,
-0.5966774, 2.310154, 0.3860963, 1, 0, 0, 1, 1,
-0.5884818, 0.2485136, 0.4781156, 1, 0, 0, 1, 1,
-0.5879197, -1.61071, -3.369116, 1, 0, 0, 1, 1,
-0.5810568, -1.258563, -4.352459, 1, 0, 0, 1, 1,
-0.5796956, -0.5517737, -3.345222, 1, 0, 0, 1, 1,
-0.5782647, -1.531488, -3.097228, 0, 0, 0, 1, 1,
-0.5745752, 0.6201608, -1.096004, 0, 0, 0, 1, 1,
-0.5739498, 0.2970839, -1.248874, 0, 0, 0, 1, 1,
-0.572803, 0.02681278, 0.3871866, 0, 0, 0, 1, 1,
-0.5725222, 0.7099937, 0.3208645, 0, 0, 0, 1, 1,
-0.5715599, -0.6333976, -1.64711, 0, 0, 0, 1, 1,
-0.570534, -0.7129505, -0.9514494, 0, 0, 0, 1, 1,
-0.5701907, -0.01078789, -1.723822, 1, 1, 1, 1, 1,
-0.569496, 1.148118, -0.00214364, 1, 1, 1, 1, 1,
-0.5622001, 0.7007635, -2.299213, 1, 1, 1, 1, 1,
-0.5559213, 0.4782825, -1.55933, 1, 1, 1, 1, 1,
-0.5539945, -0.3737035, -3.758906, 1, 1, 1, 1, 1,
-0.5534306, 0.9456486, 0.5727252, 1, 1, 1, 1, 1,
-0.5498059, -1.429567, -4.487166, 1, 1, 1, 1, 1,
-0.549397, -2.142977, -2.518671, 1, 1, 1, 1, 1,
-0.5491357, -0.5628279, -3.43013, 1, 1, 1, 1, 1,
-0.545602, 0.01490144, -1.714398, 1, 1, 1, 1, 1,
-0.5452906, -0.08776839, -1.029631, 1, 1, 1, 1, 1,
-0.538502, -0.07979544, -1.124207, 1, 1, 1, 1, 1,
-0.535116, -0.4200774, -3.082203, 1, 1, 1, 1, 1,
-0.5343779, -1.266052, -1.053261, 1, 1, 1, 1, 1,
-0.5323345, 1.823245, 0.489346, 1, 1, 1, 1, 1,
-0.5313202, 0.3881168, 1.130649, 0, 0, 1, 1, 1,
-0.5298141, -0.5523146, -3.856698, 1, 0, 0, 1, 1,
-0.5289283, 0.5829874, 0.04941798, 1, 0, 0, 1, 1,
-0.528512, -0.3866986, -1.831162, 1, 0, 0, 1, 1,
-0.527289, 0.7290637, -1.73291, 1, 0, 0, 1, 1,
-0.5207278, 0.601507, -0.04521999, 1, 0, 0, 1, 1,
-0.5168473, -0.341164, -2.63843, 0, 0, 0, 1, 1,
-0.5128365, 0.4199657, 0.7030315, 0, 0, 0, 1, 1,
-0.511144, -0.3284134, -3.339799, 0, 0, 0, 1, 1,
-0.5089191, 0.7990914, -0.426703, 0, 0, 0, 1, 1,
-0.5064448, -0.05562953, -1.360017, 0, 0, 0, 1, 1,
-0.5056504, -1.717931, -1.209795, 0, 0, 0, 1, 1,
-0.5031233, 0.1601173, -1.942906, 0, 0, 0, 1, 1,
-0.5027077, -1.361181, -4.104802, 1, 1, 1, 1, 1,
-0.5016446, 1.385059, -0.3449765, 1, 1, 1, 1, 1,
-0.4990573, -2.071692, -1.735737, 1, 1, 1, 1, 1,
-0.4973747, -0.7385687, -3.196875, 1, 1, 1, 1, 1,
-0.4902114, -2.519215, -1.192166, 1, 1, 1, 1, 1,
-0.4878503, 0.7277352, 0.1306626, 1, 1, 1, 1, 1,
-0.4867976, -0.5306466, -2.015796, 1, 1, 1, 1, 1,
-0.4866856, -0.06567757, -2.063798, 1, 1, 1, 1, 1,
-0.4822547, -0.003756979, 0.2984485, 1, 1, 1, 1, 1,
-0.4781252, 0.6664776, 1.415588, 1, 1, 1, 1, 1,
-0.4765424, -1.813002, -3.820018, 1, 1, 1, 1, 1,
-0.4736987, -0.08080991, -1.705963, 1, 1, 1, 1, 1,
-0.4726821, 0.9830174, -1.569914, 1, 1, 1, 1, 1,
-0.4715131, 0.5706508, -0.5245907, 1, 1, 1, 1, 1,
-0.4702662, 0.006336329, -1.839164, 1, 1, 1, 1, 1,
-0.4654802, 0.5694193, -1.481081, 0, 0, 1, 1, 1,
-0.4622316, -0.6666722, -2.38179, 1, 0, 0, 1, 1,
-0.4503837, 0.8676468, -1.851787, 1, 0, 0, 1, 1,
-0.4459527, 0.8762385, 0.9229982, 1, 0, 0, 1, 1,
-0.4454525, 2.621481, -0.1864741, 1, 0, 0, 1, 1,
-0.4388398, 0.01098446, -0.499417, 1, 0, 0, 1, 1,
-0.4386832, -0.9090356, -1.584208, 0, 0, 0, 1, 1,
-0.4379887, 1.227978, -0.4196709, 0, 0, 0, 1, 1,
-0.4368591, -0.5036642, -3.615205, 0, 0, 0, 1, 1,
-0.4350917, 0.587004, -0.3098043, 0, 0, 0, 1, 1,
-0.4306528, -0.618328, -2.787786, 0, 0, 0, 1, 1,
-0.4304102, -0.109581, -2.343889, 0, 0, 0, 1, 1,
-0.4242688, 0.8904012, -0.3102015, 0, 0, 0, 1, 1,
-0.4239612, -0.4674465, -2.977471, 1, 1, 1, 1, 1,
-0.4226865, 0.6247482, 0.2204131, 1, 1, 1, 1, 1,
-0.4153468, -1.071534, -2.529909, 1, 1, 1, 1, 1,
-0.4132791, -0.6546194, -0.528241, 1, 1, 1, 1, 1,
-0.4123627, -0.2550422, -3.228231, 1, 1, 1, 1, 1,
-0.4119409, 0.6921528, -0.8959751, 1, 1, 1, 1, 1,
-0.4086893, -0.6211573, -3.194829, 1, 1, 1, 1, 1,
-0.4080212, -0.4235735, -1.48877, 1, 1, 1, 1, 1,
-0.4067591, 1.126317, -0.8227649, 1, 1, 1, 1, 1,
-0.4049878, -0.9811249, -2.650232, 1, 1, 1, 1, 1,
-0.3962036, 0.4402379, 1.214826, 1, 1, 1, 1, 1,
-0.3952917, -0.1940316, -2.525386, 1, 1, 1, 1, 1,
-0.3950166, -0.7196404, -3.123423, 1, 1, 1, 1, 1,
-0.3943363, 0.1036481, -0.4456925, 1, 1, 1, 1, 1,
-0.3931028, 0.4838977, -1.532921, 1, 1, 1, 1, 1,
-0.3919112, 1.069843, -3.270024, 0, 0, 1, 1, 1,
-0.3903794, 0.02187678, -1.251338, 1, 0, 0, 1, 1,
-0.3841576, 0.1177716, -0.3840769, 1, 0, 0, 1, 1,
-0.3720466, -0.03583382, -0.4778844, 1, 0, 0, 1, 1,
-0.3713926, -1.405703, -2.525623, 1, 0, 0, 1, 1,
-0.3705928, 0.7156525, 0.7109709, 1, 0, 0, 1, 1,
-0.367123, 0.6855946, -1.553769, 0, 0, 0, 1, 1,
-0.3642577, -0.2122397, -2.485636, 0, 0, 0, 1, 1,
-0.3589659, 0.9522433, 0.8095213, 0, 0, 0, 1, 1,
-0.3565432, 1.472473, 0.3358842, 0, 0, 0, 1, 1,
-0.3565021, 0.6730745, -2.003906, 0, 0, 0, 1, 1,
-0.3516499, -0.7760151, -2.050124, 0, 0, 0, 1, 1,
-0.3478499, -0.5762706, -2.358276, 0, 0, 0, 1, 1,
-0.3457525, -0.6906856, -2.112659, 1, 1, 1, 1, 1,
-0.3434409, -0.445657, -3.771267, 1, 1, 1, 1, 1,
-0.3415734, -0.7511699, -1.780321, 1, 1, 1, 1, 1,
-0.3370225, 1.245073, -0.6971309, 1, 1, 1, 1, 1,
-0.3309979, -1.283473, -2.479943, 1, 1, 1, 1, 1,
-0.3270735, 1.36308, 0.5034147, 1, 1, 1, 1, 1,
-0.3251635, -1.305451, -1.221956, 1, 1, 1, 1, 1,
-0.3176438, -1.198754, -3.870647, 1, 1, 1, 1, 1,
-0.3145592, 1.962044, -0.5980663, 1, 1, 1, 1, 1,
-0.3057604, -0.2440325, -3.279778, 1, 1, 1, 1, 1,
-0.2968875, 1.507688, -0.8810242, 1, 1, 1, 1, 1,
-0.296008, -0.752271, -2.504641, 1, 1, 1, 1, 1,
-0.2945971, 0.04056613, -1.798076, 1, 1, 1, 1, 1,
-0.2937936, 0.3847343, -0.9984402, 1, 1, 1, 1, 1,
-0.2927129, 0.600407, -0.7832913, 1, 1, 1, 1, 1,
-0.2915899, 0.5502085, 0.1627746, 0, 0, 1, 1, 1,
-0.2902413, 0.3666588, -0.4747831, 1, 0, 0, 1, 1,
-0.286979, 1.624872, 0.4140957, 1, 0, 0, 1, 1,
-0.2781847, 0.8565314, 0.3890217, 1, 0, 0, 1, 1,
-0.2764027, 0.3128087, -1.039879, 1, 0, 0, 1, 1,
-0.2720982, -0.1758566, -2.311033, 1, 0, 0, 1, 1,
-0.2683049, -0.4583706, -3.678278, 0, 0, 0, 1, 1,
-0.2656993, -1.181744, -3.354086, 0, 0, 0, 1, 1,
-0.2652072, 0.3718976, -2.301876, 0, 0, 0, 1, 1,
-0.2596153, 1.453326, 0.3596291, 0, 0, 0, 1, 1,
-0.2574547, 1.280741, 0.07021371, 0, 0, 0, 1, 1,
-0.2573217, 0.561735, 0.2278752, 0, 0, 0, 1, 1,
-0.2565598, -2.092897, -2.393684, 0, 0, 0, 1, 1,
-0.2563922, -2.728899, -3.364086, 1, 1, 1, 1, 1,
-0.2477252, 1.988556, -0.8861548, 1, 1, 1, 1, 1,
-0.2435037, 0.2949632, -1.051425, 1, 1, 1, 1, 1,
-0.2434137, -0.07877267, -1.713286, 1, 1, 1, 1, 1,
-0.2398207, 0.05620214, -0.6258162, 1, 1, 1, 1, 1,
-0.231701, 0.3892662, 1.04356, 1, 1, 1, 1, 1,
-0.2229773, 0.4412907, 0.394607, 1, 1, 1, 1, 1,
-0.2124628, -2.232739, -2.624573, 1, 1, 1, 1, 1,
-0.2103601, 0.08263186, -0.2055054, 1, 1, 1, 1, 1,
-0.2098378, -0.259986, -2.587552, 1, 1, 1, 1, 1,
-0.2093595, 1.046149, 2.487772, 1, 1, 1, 1, 1,
-0.2088075, 1.130613, 1.186093, 1, 1, 1, 1, 1,
-0.2082737, 0.3019769, 0.1840779, 1, 1, 1, 1, 1,
-0.2078345, 0.469543, 0.8287733, 1, 1, 1, 1, 1,
-0.2047926, 1.174745, 0.587465, 1, 1, 1, 1, 1,
-0.2043521, 0.4994595, -2.091276, 0, 0, 1, 1, 1,
-0.2030705, 0.8597225, -0.5326743, 1, 0, 0, 1, 1,
-0.2014206, 0.097582, -0.1658672, 1, 0, 0, 1, 1,
-0.1994818, -1.496365, -3.862946, 1, 0, 0, 1, 1,
-0.1991284, -0.4155208, -1.537956, 1, 0, 0, 1, 1,
-0.1982583, -0.3362585, -2.964802, 1, 0, 0, 1, 1,
-0.1962178, -0.1968933, -1.919561, 0, 0, 0, 1, 1,
-0.1880634, -0.4737593, -2.17903, 0, 0, 0, 1, 1,
-0.1872928, -0.2543376, -2.129977, 0, 0, 0, 1, 1,
-0.1836969, 0.2806049, -0.5534402, 0, 0, 0, 1, 1,
-0.1812811, -0.7377177, -3.658121, 0, 0, 0, 1, 1,
-0.1746012, 0.01055514, -1.536756, 0, 0, 0, 1, 1,
-0.1720479, -0.06394465, -2.108116, 0, 0, 0, 1, 1,
-0.1693111, -0.2059437, -1.508963, 1, 1, 1, 1, 1,
-0.1681317, -0.1730233, -1.363665, 1, 1, 1, 1, 1,
-0.1647387, 0.7695547, -0.2410032, 1, 1, 1, 1, 1,
-0.1621227, 1.129439, -0.9177976, 1, 1, 1, 1, 1,
-0.1614143, 0.5595723, -0.6873018, 1, 1, 1, 1, 1,
-0.1573729, -0.2364551, 0.552046, 1, 1, 1, 1, 1,
-0.1563892, 0.2432931, -0.109709, 1, 1, 1, 1, 1,
-0.1532249, -0.7271435, -2.771149, 1, 1, 1, 1, 1,
-0.1527794, -0.127141, -2.151388, 1, 1, 1, 1, 1,
-0.1527129, 1.529311, 0.4992282, 1, 1, 1, 1, 1,
-0.1468903, -1.646311, -3.930585, 1, 1, 1, 1, 1,
-0.1459131, -0.02686258, -2.06427, 1, 1, 1, 1, 1,
-0.1418876, -0.4459969, -2.423417, 1, 1, 1, 1, 1,
-0.1413612, -1.164393, -1.765551, 1, 1, 1, 1, 1,
-0.1369403, -0.5828506, -2.061199, 1, 1, 1, 1, 1,
-0.136293, -0.4800448, -3.159414, 0, 0, 1, 1, 1,
-0.134872, 0.5567231, -0.7472875, 1, 0, 0, 1, 1,
-0.1288495, -0.1365298, -2.82369, 1, 0, 0, 1, 1,
-0.1228143, 0.4718774, -1.35704, 1, 0, 0, 1, 1,
-0.1223481, 0.1963625, -2.034067, 1, 0, 0, 1, 1,
-0.1207013, -1.140266, -2.879831, 1, 0, 0, 1, 1,
-0.1164576, -0.4020725, -3.223308, 0, 0, 0, 1, 1,
-0.1155244, -1.139051, -2.707946, 0, 0, 0, 1, 1,
-0.1084934, -1.761127, -3.308918, 0, 0, 0, 1, 1,
-0.1081578, 1.603045, -0.6857482, 0, 0, 0, 1, 1,
-0.1059631, -0.6418906, -3.508953, 0, 0, 0, 1, 1,
-0.103444, -1.373179, -3.232439, 0, 0, 0, 1, 1,
-0.09874015, 1.95464, -1.719756, 0, 0, 0, 1, 1,
-0.09859466, 1.086356, -0.550978, 1, 1, 1, 1, 1,
-0.09680447, 1.579107, 0.1924082, 1, 1, 1, 1, 1,
-0.09589125, 2.258034, 1.425507, 1, 1, 1, 1, 1,
-0.09435852, 0.5603725, -0.07351089, 1, 1, 1, 1, 1,
-0.09295046, -0.5747724, -2.167501, 1, 1, 1, 1, 1,
-0.08851025, -0.1427015, -1.484727, 1, 1, 1, 1, 1,
-0.08599252, 0.7216842, 2.455041, 1, 1, 1, 1, 1,
-0.08129142, 0.41671, -0.6255982, 1, 1, 1, 1, 1,
-0.08016916, 1.229763, 0.2683092, 1, 1, 1, 1, 1,
-0.07931609, -1.060067, -2.868683, 1, 1, 1, 1, 1,
-0.07685953, -0.1445455, -2.534474, 1, 1, 1, 1, 1,
-0.07379556, 0.5842389, 0.7128171, 1, 1, 1, 1, 1,
-0.07194218, 1.956485, -1.319358, 1, 1, 1, 1, 1,
-0.07192402, -0.2784499, -3.147657, 1, 1, 1, 1, 1,
-0.06530452, 1.160087, -0.7266359, 1, 1, 1, 1, 1,
-0.06331764, -0.4991625, -4.666946, 0, 0, 1, 1, 1,
-0.0622854, 0.5529678, 0.1432962, 1, 0, 0, 1, 1,
-0.06216361, -0.5158816, -2.893353, 1, 0, 0, 1, 1,
-0.05867552, 0.3211648, -0.6226165, 1, 0, 0, 1, 1,
-0.05722958, -1.703517, -2.198164, 1, 0, 0, 1, 1,
-0.05579861, -0.5745056, -1.887353, 1, 0, 0, 1, 1,
-0.05565664, -1.209018, -1.291911, 0, 0, 0, 1, 1,
-0.05531911, 0.07753184, -0.8114896, 0, 0, 0, 1, 1,
-0.05410338, -0.6135913, 0.0867517, 0, 0, 0, 1, 1,
-0.05372067, -0.8110129, -2.597643, 0, 0, 0, 1, 1,
-0.05298508, -1.212537, -3.978147, 0, 0, 0, 1, 1,
-0.04816672, 0.1262205, 0.08954811, 0, 0, 0, 1, 1,
-0.04528123, -0.5406227, -3.88255, 0, 0, 0, 1, 1,
-0.04410026, -0.1375915, -1.446925, 1, 1, 1, 1, 1,
-0.03885641, -0.4059398, -2.692438, 1, 1, 1, 1, 1,
-0.03792331, 0.4323993, 2.179055, 1, 1, 1, 1, 1,
-0.0373962, 1.134952, 0.4152615, 1, 1, 1, 1, 1,
-0.03661655, 0.2916655, -2.576622, 1, 1, 1, 1, 1,
-0.03500501, -0.08343453, -4.008286, 1, 1, 1, 1, 1,
-0.03449432, 0.09229513, -0.6967146, 1, 1, 1, 1, 1,
-0.03266738, -0.4504621, -2.134947, 1, 1, 1, 1, 1,
-0.0313493, -1.548111, -4.483467, 1, 1, 1, 1, 1,
-0.02929393, -0.3743596, -1.66588, 1, 1, 1, 1, 1,
-0.02280568, -0.5005816, -3.222251, 1, 1, 1, 1, 1,
-0.02248294, -1.580457, -2.001467, 1, 1, 1, 1, 1,
-0.02080068, 0.3942761, -0.1862564, 1, 1, 1, 1, 1,
-0.02056342, -1.429876, -3.4533, 1, 1, 1, 1, 1,
-0.01997146, 0.5681623, 0.3050065, 1, 1, 1, 1, 1,
-0.01928025, -1.110104, -4.031633, 0, 0, 1, 1, 1,
-0.0189018, 0.2952742, -0.4695197, 1, 0, 0, 1, 1,
-0.01228529, 0.2329232, 0.4014941, 1, 0, 0, 1, 1,
-0.009508017, -0.9295005, -2.637289, 1, 0, 0, 1, 1,
-0.008351051, -0.1817467, -2.800112, 1, 0, 0, 1, 1,
-0.007764535, 0.659661, 1.482262, 1, 0, 0, 1, 1,
-0.005300043, 0.2808845, -0.09315849, 0, 0, 0, 1, 1,
-0.004432266, 0.5420018, 0.5857323, 0, 0, 0, 1, 1,
0.0007535805, -0.8155727, 5.516416, 0, 0, 0, 1, 1,
0.001693738, 0.1200765, 0.8268501, 0, 0, 0, 1, 1,
0.006015274, -1.637203, 4.246562, 0, 0, 0, 1, 1,
0.00812432, 1.444939, 1.169897, 0, 0, 0, 1, 1,
0.0109647, 0.7923034, 0.02971573, 0, 0, 0, 1, 1,
0.01210157, 3.038542, -0.2883055, 1, 1, 1, 1, 1,
0.01322981, 0.1419247, -0.7153847, 1, 1, 1, 1, 1,
0.01403135, 0.4715738, 1.49821, 1, 1, 1, 1, 1,
0.02019907, -0.368845, 4.028509, 1, 1, 1, 1, 1,
0.02080548, 1.2491, 0.7888339, 1, 1, 1, 1, 1,
0.02354844, -0.9971541, 3.37519, 1, 1, 1, 1, 1,
0.02539557, -0.6657742, 3.280385, 1, 1, 1, 1, 1,
0.03069242, 0.3660705, 0.3320549, 1, 1, 1, 1, 1,
0.03141284, 0.1200601, -0.5968354, 1, 1, 1, 1, 1,
0.03206242, -0.9084034, 3.218652, 1, 1, 1, 1, 1,
0.03367255, -1.784587, 4.035944, 1, 1, 1, 1, 1,
0.03484412, 1.378552, 0.3258131, 1, 1, 1, 1, 1,
0.03688168, 1.060007, 0.8813715, 1, 1, 1, 1, 1,
0.03709098, -0.6016752, 0.7433151, 1, 1, 1, 1, 1,
0.04367894, 1.353198, 0.5842708, 1, 1, 1, 1, 1,
0.04435679, -0.8262993, 2.75707, 0, 0, 1, 1, 1,
0.04483386, 1.199871, -0.5081908, 1, 0, 0, 1, 1,
0.0498439, 0.7033192, 0.04478702, 1, 0, 0, 1, 1,
0.05377768, -1.056036, 1.549741, 1, 0, 0, 1, 1,
0.05712605, 0.02537007, 1.993913, 1, 0, 0, 1, 1,
0.05967166, -2.228037, 4.64245, 1, 0, 0, 1, 1,
0.06214293, -0.06870417, 2.916573, 0, 0, 0, 1, 1,
0.06504831, -0.167935, 5.91755, 0, 0, 0, 1, 1,
0.06768872, 0.3030217, 0.9063764, 0, 0, 0, 1, 1,
0.06855741, 0.6621597, 1.609732, 0, 0, 0, 1, 1,
0.06859929, 1.116631, -0.4671889, 0, 0, 0, 1, 1,
0.06977552, -0.9158335, 2.689556, 0, 0, 0, 1, 1,
0.07025867, -0.5097827, 3.858389, 0, 0, 0, 1, 1,
0.07089138, -0.1905775, 1.767102, 1, 1, 1, 1, 1,
0.07105577, 0.3501583, 0.7459444, 1, 1, 1, 1, 1,
0.0715279, 0.3230199, 0.02058266, 1, 1, 1, 1, 1,
0.07234834, 0.7521188, -0.8350131, 1, 1, 1, 1, 1,
0.07518574, 0.7768869, -0.7397181, 1, 1, 1, 1, 1,
0.07763809, 0.09243356, 0.2057593, 1, 1, 1, 1, 1,
0.07917506, 0.08993688, 1.009993, 1, 1, 1, 1, 1,
0.08127208, -0.605957, 3.282004, 1, 1, 1, 1, 1,
0.08235926, 0.3695195, 0.4841015, 1, 1, 1, 1, 1,
0.08251424, 0.9284379, 2.150513, 1, 1, 1, 1, 1,
0.09152603, 0.5365074, -0.9413728, 1, 1, 1, 1, 1,
0.09189299, 0.8739085, 0.8450674, 1, 1, 1, 1, 1,
0.09414054, 0.5659021, 1.05069, 1, 1, 1, 1, 1,
0.09516808, 1.331949, 1.352769, 1, 1, 1, 1, 1,
0.09669031, 0.6595879, -1.111687, 1, 1, 1, 1, 1,
0.09813941, -1.034645, 2.570689, 0, 0, 1, 1, 1,
0.0991238, -0.4267883, 1.025681, 1, 0, 0, 1, 1,
0.1051514, -0.3823879, 2.374446, 1, 0, 0, 1, 1,
0.1057153, -0.8109938, 4.010421, 1, 0, 0, 1, 1,
0.1063405, -1.505777, 2.853755, 1, 0, 0, 1, 1,
0.1087747, 0.7946926, 1.083937, 1, 0, 0, 1, 1,
0.110306, 0.6115822, 0.5992154, 0, 0, 0, 1, 1,
0.1119022, -0.08496244, 3.31723, 0, 0, 0, 1, 1,
0.1128695, 1.110164, -1.126734, 0, 0, 0, 1, 1,
0.1148653, -0.5185789, 2.402109, 0, 0, 0, 1, 1,
0.1266123, 2.015687, -1.233712, 0, 0, 0, 1, 1,
0.1353258, -1.261143, 2.20627, 0, 0, 0, 1, 1,
0.1355634, -0.8844216, 3.80358, 0, 0, 0, 1, 1,
0.1403768, -0.5218677, 2.244505, 1, 1, 1, 1, 1,
0.1473608, -0.1907397, 3.490485, 1, 1, 1, 1, 1,
0.1477111, -0.6783165, 4.549603, 1, 1, 1, 1, 1,
0.1486578, -0.2884804, 2.635327, 1, 1, 1, 1, 1,
0.1538261, -0.3755986, 3.826587, 1, 1, 1, 1, 1,
0.1549923, -1.321928, 3.624726, 1, 1, 1, 1, 1,
0.1602205, 1.016188, -0.6751927, 1, 1, 1, 1, 1,
0.1606072, -0.8589385, 3.202666, 1, 1, 1, 1, 1,
0.1610618, -1.492351, 1.691498, 1, 1, 1, 1, 1,
0.1629404, -1.303983, 2.355386, 1, 1, 1, 1, 1,
0.1643033, -0.3288426, 2.409979, 1, 1, 1, 1, 1,
0.1667234, 0.5023853, -0.2806944, 1, 1, 1, 1, 1,
0.1677483, -0.2999619, 3.002728, 1, 1, 1, 1, 1,
0.1689568, -1.8996, 3.883258, 1, 1, 1, 1, 1,
0.1732341, 0.7176092, 3.000484, 1, 1, 1, 1, 1,
0.1736021, 0.06046671, 0.5712339, 0, 0, 1, 1, 1,
0.1772933, -1.241814, 2.229773, 1, 0, 0, 1, 1,
0.1826329, -0.1861364, 2.457759, 1, 0, 0, 1, 1,
0.182863, -0.2974289, 2.647455, 1, 0, 0, 1, 1,
0.1831413, 0.2448871, -0.9372184, 1, 0, 0, 1, 1,
0.1859546, -0.08272005, 1.000342, 1, 0, 0, 1, 1,
0.1910309, 1.991046, 1.580499, 0, 0, 0, 1, 1,
0.1930226, 0.6177755, -1.25193, 0, 0, 0, 1, 1,
0.1951065, 0.4933298, 0.5565003, 0, 0, 0, 1, 1,
0.1959978, -1.194498, 4.031655, 0, 0, 0, 1, 1,
0.1963396, -0.001649027, 2.192686, 0, 0, 0, 1, 1,
0.196486, 0.4832599, -0.8304593, 0, 0, 0, 1, 1,
0.197035, 0.4197152, 0.9442183, 0, 0, 0, 1, 1,
0.2008506, -0.02679528, 1.68873, 1, 1, 1, 1, 1,
0.2041261, -0.7116525, 4.355265, 1, 1, 1, 1, 1,
0.2105792, 0.5741177, 1.081212, 1, 1, 1, 1, 1,
0.2114071, 0.451034, 1.516807, 1, 1, 1, 1, 1,
0.2170862, 0.5944838, 1.051088, 1, 1, 1, 1, 1,
0.2173499, -0.777721, 2.589148, 1, 1, 1, 1, 1,
0.2181418, 0.3985181, -0.4015703, 1, 1, 1, 1, 1,
0.2182415, 0.7542511, 0.1538312, 1, 1, 1, 1, 1,
0.2191644, 0.6772323, 0.5713953, 1, 1, 1, 1, 1,
0.2194807, 0.8374954, 2.380002, 1, 1, 1, 1, 1,
0.2212802, 0.007426337, 1.120299, 1, 1, 1, 1, 1,
0.2227597, 0.04380679, 2.233196, 1, 1, 1, 1, 1,
0.2269559, 2.22103, 1.297148, 1, 1, 1, 1, 1,
0.2269748, 1.26566, 0.8253246, 1, 1, 1, 1, 1,
0.2271358, 0.3943068, -1.118827, 1, 1, 1, 1, 1,
0.2278206, 0.9707248, 1.013051, 0, 0, 1, 1, 1,
0.2295887, 0.8830221, 0.2879124, 1, 0, 0, 1, 1,
0.231, -0.085393, 0.7152678, 1, 0, 0, 1, 1,
0.2310965, -0.6216387, 1.159813, 1, 0, 0, 1, 1,
0.2311288, -0.012814, 0.8473976, 1, 0, 0, 1, 1,
0.2311517, -0.5334492, 2.726109, 1, 0, 0, 1, 1,
0.2315291, 0.422484, 0.380077, 0, 0, 0, 1, 1,
0.2405332, 0.0457582, 0.7274992, 0, 0, 0, 1, 1,
0.2416165, -0.8740871, 1.782515, 0, 0, 0, 1, 1,
0.2473397, -0.1459701, 0.8322222, 0, 0, 0, 1, 1,
0.2492105, -0.05806482, 3.267034, 0, 0, 0, 1, 1,
0.2557444, 1.949791, 0.3972954, 0, 0, 0, 1, 1,
0.259268, -0.1386573, 1.172235, 0, 0, 0, 1, 1,
0.2600801, -0.3004202, 1.962609, 1, 1, 1, 1, 1,
0.2646179, 0.8025005, 1.19553, 1, 1, 1, 1, 1,
0.2677762, -0.05972883, 3.00981, 1, 1, 1, 1, 1,
0.2688571, -0.1562736, 2.539694, 1, 1, 1, 1, 1,
0.2783406, -0.508752, 2.749151, 1, 1, 1, 1, 1,
0.2808757, -1.079664, 2.423274, 1, 1, 1, 1, 1,
0.286756, -0.8744125, 4.704484, 1, 1, 1, 1, 1,
0.2929084, 1.267325, 1.981891, 1, 1, 1, 1, 1,
0.2975802, -1.098481, 2.314596, 1, 1, 1, 1, 1,
0.298077, -1.704141, 0.5019284, 1, 1, 1, 1, 1,
0.3008287, 0.4171804, 0.0862663, 1, 1, 1, 1, 1,
0.3056796, -0.5190575, 4.228408, 1, 1, 1, 1, 1,
0.3133916, 0.09198892, 0.9624723, 1, 1, 1, 1, 1,
0.3173068, -0.6180245, 3.708615, 1, 1, 1, 1, 1,
0.3263693, 1.930303, -1.69526, 1, 1, 1, 1, 1,
0.3276752, -0.04803957, 0.8822917, 0, 0, 1, 1, 1,
0.3371211, 1.362735, 0.9834834, 1, 0, 0, 1, 1,
0.3375263, -2.37506, 2.84555, 1, 0, 0, 1, 1,
0.337548, 0.8912414, 0.7738611, 1, 0, 0, 1, 1,
0.339792, 0.9312383, -0.3112525, 1, 0, 0, 1, 1,
0.3405978, 0.8854529, 0.1433528, 1, 0, 0, 1, 1,
0.3418931, -0.753539, 2.694299, 0, 0, 0, 1, 1,
0.3428779, 0.8445904, 1.519368, 0, 0, 0, 1, 1,
0.3462709, 0.04547898, 2.228605, 0, 0, 0, 1, 1,
0.347686, 0.1849934, 0.5486975, 0, 0, 0, 1, 1,
0.3483135, 1.10511, -0.496454, 0, 0, 0, 1, 1,
0.3501651, -0.3798404, 2.494266, 0, 0, 0, 1, 1,
0.3534893, 0.307534, 2.153912, 0, 0, 0, 1, 1,
0.3589236, -1.252755, 3.309987, 1, 1, 1, 1, 1,
0.3600116, -0.004835876, 2.113721, 1, 1, 1, 1, 1,
0.3626775, 1.621641, 0.8411239, 1, 1, 1, 1, 1,
0.3646413, 1.374834, 0.5328495, 1, 1, 1, 1, 1,
0.3691817, -0.3031071, 3.308715, 1, 1, 1, 1, 1,
0.369648, 2.114599, -1.235834, 1, 1, 1, 1, 1,
0.371533, -1.170486, 3.813566, 1, 1, 1, 1, 1,
0.3733538, 0.5692921, -0.03301707, 1, 1, 1, 1, 1,
0.3745065, 0.002255144, 2.477311, 1, 1, 1, 1, 1,
0.3763152, -1.24881, 3.298675, 1, 1, 1, 1, 1,
0.3798524, 0.3449525, 2.167113, 1, 1, 1, 1, 1,
0.3811235, -1.72901, 2.323047, 1, 1, 1, 1, 1,
0.3822923, -0.4938483, 2.644282, 1, 1, 1, 1, 1,
0.3884069, -0.2606805, 4.305823, 1, 1, 1, 1, 1,
0.3977603, -0.9725296, 2.351702, 1, 1, 1, 1, 1,
0.400557, -0.6222137, 1.447014, 0, 0, 1, 1, 1,
0.4009075, 0.5085149, 0.1411713, 1, 0, 0, 1, 1,
0.403833, 0.4436446, -0.8284209, 1, 0, 0, 1, 1,
0.4136669, 0.8300921, -1.958189, 1, 0, 0, 1, 1,
0.4156694, 0.8716996, 1.701848, 1, 0, 0, 1, 1,
0.4173076, 2.228684, 0.5465367, 1, 0, 0, 1, 1,
0.4188657, 0.07620745, 0.07065789, 0, 0, 0, 1, 1,
0.4192139, 0.3571305, 1.690939, 0, 0, 0, 1, 1,
0.4261811, 0.4452455, 0.4680203, 0, 0, 0, 1, 1,
0.4267387, 0.7653609, 2.216902, 0, 0, 0, 1, 1,
0.4409621, 1.10959, 1.131432, 0, 0, 0, 1, 1,
0.4438012, 0.5685685, 2.167332, 0, 0, 0, 1, 1,
0.4450495, 1.556192, -0.2856871, 0, 0, 0, 1, 1,
0.4564835, -0.06361951, 2.580762, 1, 1, 1, 1, 1,
0.4579989, 0.9883668, -0.1513908, 1, 1, 1, 1, 1,
0.4583878, 0.8656319, -0.4911116, 1, 1, 1, 1, 1,
0.4618584, -0.2459359, 0.6433547, 1, 1, 1, 1, 1,
0.463171, -2.013945, 3.080239, 1, 1, 1, 1, 1,
0.4671345, 0.6030278, 0.4751115, 1, 1, 1, 1, 1,
0.4711206, -1.876215, 3.383422, 1, 1, 1, 1, 1,
0.4715517, -0.2551709, 3.633029, 1, 1, 1, 1, 1,
0.4720845, -0.2272994, 1.389019, 1, 1, 1, 1, 1,
0.4841076, -0.2532139, 2.724759, 1, 1, 1, 1, 1,
0.4865342, 0.1930888, 1.481249, 1, 1, 1, 1, 1,
0.4922777, -1.153912, 2.866261, 1, 1, 1, 1, 1,
0.4944904, 1.244309, -0.2654174, 1, 1, 1, 1, 1,
0.4952503, -1.242418, 3.840698, 1, 1, 1, 1, 1,
0.4954269, 0.1778892, 1.325927, 1, 1, 1, 1, 1,
0.5014227, 2.719441, 1.287623, 0, 0, 1, 1, 1,
0.5020484, 0.6868428, -0.215391, 1, 0, 0, 1, 1,
0.5027575, -0.6167073, 3.545912, 1, 0, 0, 1, 1,
0.5105071, -0.8037246, 0.6694603, 1, 0, 0, 1, 1,
0.5110673, 0.6622275, -1.407453, 1, 0, 0, 1, 1,
0.514618, -0.1031957, 0.2663763, 1, 0, 0, 1, 1,
0.5214484, 1.370063, 1.880958, 0, 0, 0, 1, 1,
0.5219082, 1.033924, 1.277999, 0, 0, 0, 1, 1,
0.529252, -0.239933, 2.75404, 0, 0, 0, 1, 1,
0.5371934, 0.2348323, -0.1060932, 0, 0, 0, 1, 1,
0.5405551, -0.4492219, 3.299958, 0, 0, 0, 1, 1,
0.5432093, 1.435761, -1.444689, 0, 0, 0, 1, 1,
0.5434582, 0.2782218, 1.928706, 0, 0, 0, 1, 1,
0.543615, -2.418328, 1.904918, 1, 1, 1, 1, 1,
0.5438, 0.4056062, 1.183299, 1, 1, 1, 1, 1,
0.5445032, 0.02792059, 0.298924, 1, 1, 1, 1, 1,
0.5494683, -1.104286, 1.967291, 1, 1, 1, 1, 1,
0.5527667, 2.096816, 2.08124, 1, 1, 1, 1, 1,
0.5568848, 0.4071898, 1.986685, 1, 1, 1, 1, 1,
0.5588892, -0.2456292, 0.3483806, 1, 1, 1, 1, 1,
0.5606241, -1.132616, 3.292987, 1, 1, 1, 1, 1,
0.5609903, 0.6795377, 0.3709221, 1, 1, 1, 1, 1,
0.5615624, -0.6784199, 1.419803, 1, 1, 1, 1, 1,
0.5627759, 2.132292, 0.2850546, 1, 1, 1, 1, 1,
0.5639321, -1.700194, 2.408216, 1, 1, 1, 1, 1,
0.5646791, -0.8413094, 2.13011, 1, 1, 1, 1, 1,
0.5677134, -0.216672, 1.412709, 1, 1, 1, 1, 1,
0.5683918, 0.6155461, 0.2000328, 1, 1, 1, 1, 1,
0.5688257, -1.049153, 3.246397, 0, 0, 1, 1, 1,
0.5696019, -2.149859, 2.738039, 1, 0, 0, 1, 1,
0.5728123, -0.05970231, -0.437666, 1, 0, 0, 1, 1,
0.5752357, -0.009148435, 0.9703907, 1, 0, 0, 1, 1,
0.5765781, 0.110831, 1.742074, 1, 0, 0, 1, 1,
0.5767416, 1.75401, -0.9845599, 1, 0, 0, 1, 1,
0.5811157, -1.493149, 3.323198, 0, 0, 0, 1, 1,
0.5856237, 0.3895324, -0.3105927, 0, 0, 0, 1, 1,
0.5948574, -1.624367, 2.865473, 0, 0, 0, 1, 1,
0.5955911, 0.8655805, 0.4533601, 0, 0, 0, 1, 1,
0.598014, -0.2846344, 2.836974, 0, 0, 0, 1, 1,
0.6030936, 1.105209, -1.174289, 0, 0, 0, 1, 1,
0.6039372, 0.3965992, 2.213076, 0, 0, 0, 1, 1,
0.6049355, -0.8594965, 1.006198, 1, 1, 1, 1, 1,
0.6056313, 1.773096, 0.06311502, 1, 1, 1, 1, 1,
0.6066553, 0.4889403, 2.822256, 1, 1, 1, 1, 1,
0.6073517, 0.8503247, 0.7747188, 1, 1, 1, 1, 1,
0.6090008, 2.203672, 2.35359, 1, 1, 1, 1, 1,
0.6097254, -0.1227596, 1.293836, 1, 1, 1, 1, 1,
0.611172, -0.8081257, 1.625611, 1, 1, 1, 1, 1,
0.6147351, -0.8614266, 2.160091, 1, 1, 1, 1, 1,
0.6157543, 0.4164888, 0.2532895, 1, 1, 1, 1, 1,
0.615964, 0.2666268, 0.6902671, 1, 1, 1, 1, 1,
0.625681, 1.688227, 0.1760963, 1, 1, 1, 1, 1,
0.629845, -0.6782861, 3.095858, 1, 1, 1, 1, 1,
0.6322918, 1.25642, -0.8670801, 1, 1, 1, 1, 1,
0.6326122, -1.547401, 0.7957593, 1, 1, 1, 1, 1,
0.6360244, -2.574889, 2.423455, 1, 1, 1, 1, 1,
0.639372, 0.1796165, 1.350942, 0, 0, 1, 1, 1,
0.6397772, -2.172555, 1.705252, 1, 0, 0, 1, 1,
0.6416694, -1.421467, 0.9051666, 1, 0, 0, 1, 1,
0.6425164, 2.389446, -0.98264, 1, 0, 0, 1, 1,
0.6457305, -0.6226164, 2.096839, 1, 0, 0, 1, 1,
0.6477777, 0.1314025, 2.218548, 1, 0, 0, 1, 1,
0.6508362, 0.7321541, -0.06093098, 0, 0, 0, 1, 1,
0.6510444, 1.01258, 1.160716, 0, 0, 0, 1, 1,
0.6531443, -1.035743, 2.775512, 0, 0, 0, 1, 1,
0.65523, -0.8375638, 1.439532, 0, 0, 0, 1, 1,
0.6557848, 0.9909925, 1.635147, 0, 0, 0, 1, 1,
0.6572811, 0.5313792, -0.1566257, 0, 0, 0, 1, 1,
0.6597717, -0.1896289, 2.002667, 0, 0, 0, 1, 1,
0.6618685, 0.695123, -1.525812, 1, 1, 1, 1, 1,
0.6663638, 0.6833941, 0.7259753, 1, 1, 1, 1, 1,
0.6675885, -0.9880195, 3.132532, 1, 1, 1, 1, 1,
0.6677444, -0.4042825, 3.152833, 1, 1, 1, 1, 1,
0.6772031, 1.482254, -0.8890592, 1, 1, 1, 1, 1,
0.6777246, -0.4299483, 3.565075, 1, 1, 1, 1, 1,
0.678947, -0.9765145, 2.988762, 1, 1, 1, 1, 1,
0.6808522, 0.5700222, 1.986181, 1, 1, 1, 1, 1,
0.6893661, -0.5403128, 1.733626, 1, 1, 1, 1, 1,
0.6975706, 0.7910662, 0.5376565, 1, 1, 1, 1, 1,
0.6990478, -0.57569, 1.751503, 1, 1, 1, 1, 1,
0.7002332, 0.108611, 0.8813855, 1, 1, 1, 1, 1,
0.7056811, 1.634183, 1.527252, 1, 1, 1, 1, 1,
0.7071776, 0.7675032, 0.4499477, 1, 1, 1, 1, 1,
0.711051, 0.1954185, 0.6870283, 1, 1, 1, 1, 1,
0.7113733, 0.1913071, 1.903249, 0, 0, 1, 1, 1,
0.7137268, -2.068345, 2.505947, 1, 0, 0, 1, 1,
0.7187728, -0.9709786, 3.875296, 1, 0, 0, 1, 1,
0.7278422, -0.187701, 1.936637, 1, 0, 0, 1, 1,
0.7286088, -0.7980753, 3.431105, 1, 0, 0, 1, 1,
0.7308179, 0.130179, 2.149975, 1, 0, 0, 1, 1,
0.7346262, 0.06385888, 0.7712918, 0, 0, 0, 1, 1,
0.7588793, -0.9987891, 4.707511, 0, 0, 0, 1, 1,
0.766629, 1.75502, 1.520874, 0, 0, 0, 1, 1,
0.7716544, 0.4924976, 1.432676, 0, 0, 0, 1, 1,
0.7727409, 0.7109155, 1.929788, 0, 0, 0, 1, 1,
0.7741691, -0.1424524, 3.226552, 0, 0, 0, 1, 1,
0.7760469, 0.0383366, 1.4285, 0, 0, 0, 1, 1,
0.7769793, 1.365736, -0.7294922, 1, 1, 1, 1, 1,
0.7819624, -1.690432, 5.3066, 1, 1, 1, 1, 1,
0.7828813, 1.542588, 0.6511604, 1, 1, 1, 1, 1,
0.784436, -0.3384461, 1.5168, 1, 1, 1, 1, 1,
0.7853266, -1.148042, 2.416628, 1, 1, 1, 1, 1,
0.7881802, -0.2963261, 3.466996, 1, 1, 1, 1, 1,
0.7885659, -0.3470679, 2.540889, 1, 1, 1, 1, 1,
0.798656, -0.6403517, 2.604984, 1, 1, 1, 1, 1,
0.8021253, -1.741911, 2.651365, 1, 1, 1, 1, 1,
0.8046237, 0.7195551, 2.271837, 1, 1, 1, 1, 1,
0.8057261, 1.051076, 0.2432892, 1, 1, 1, 1, 1,
0.806518, -1.540596, 4.392314, 1, 1, 1, 1, 1,
0.8072952, 0.9791195, 1.181852, 1, 1, 1, 1, 1,
0.8101923, -0.9938713, 4.22767, 1, 1, 1, 1, 1,
0.8146678, -0.9473808, 2.26542, 1, 1, 1, 1, 1,
0.8154055, -0.08862203, 2.612008, 0, 0, 1, 1, 1,
0.8206775, -0.2493568, 1.819815, 1, 0, 0, 1, 1,
0.8226727, 0.5527598, -0.8352025, 1, 0, 0, 1, 1,
0.8276159, -0.9952533, 3.655169, 1, 0, 0, 1, 1,
0.8322682, -0.6546454, 3.500662, 1, 0, 0, 1, 1,
0.8349079, 1.076585, 0.5405337, 1, 0, 0, 1, 1,
0.8389072, 0.5789388, -0.2507348, 0, 0, 0, 1, 1,
0.8450771, 1.102052, -1.018729, 0, 0, 0, 1, 1,
0.8462375, 0.15262, 3.299318, 0, 0, 0, 1, 1,
0.8524359, -0.5316055, 2.500715, 0, 0, 0, 1, 1,
0.8548251, 0.8959862, 1.006734, 0, 0, 0, 1, 1,
0.858669, -0.2605877, 1.891801, 0, 0, 0, 1, 1,
0.861015, -0.1838944, 0.2153494, 0, 0, 0, 1, 1,
0.8642, -0.4202566, 2.678474, 1, 1, 1, 1, 1,
0.8754194, 0.5458449, -0.3902776, 1, 1, 1, 1, 1,
0.8757915, 1.196281, -2.865509, 1, 1, 1, 1, 1,
0.8759595, -1.622219, 2.759541, 1, 1, 1, 1, 1,
0.8790234, -2.171012, 2.563323, 1, 1, 1, 1, 1,
0.8828295, 0.187577, 1.268936, 1, 1, 1, 1, 1,
0.8841563, 1.014453, 0.4293837, 1, 1, 1, 1, 1,
0.8899541, -1.549079, 5.194616, 1, 1, 1, 1, 1,
0.8929925, -2.031217, 4.081002, 1, 1, 1, 1, 1,
0.8944446, -0.03750452, 1.07992, 1, 1, 1, 1, 1,
0.8986716, 0.5043103, 2.044722, 1, 1, 1, 1, 1,
0.8991478, 0.4065976, 2.08998, 1, 1, 1, 1, 1,
0.8995354, -1.250473, 0.9017902, 1, 1, 1, 1, 1,
0.9105138, 2.201339, 1.101068, 1, 1, 1, 1, 1,
0.9179007, -0.5003853, 2.109085, 1, 1, 1, 1, 1,
0.9182754, 0.2976449, 1.721773, 0, 0, 1, 1, 1,
0.9260997, 0.09230746, 1.7498, 1, 0, 0, 1, 1,
0.9292131, 0.6713871, 1.45131, 1, 0, 0, 1, 1,
0.9316496, -0.2433094, 2.582287, 1, 0, 0, 1, 1,
0.9350234, 0.4852964, 1.158089, 1, 0, 0, 1, 1,
0.93535, -1.242569, 2.42401, 1, 0, 0, 1, 1,
0.9358553, 1.950596, 1.170814, 0, 0, 0, 1, 1,
0.9364879, -1.884987, 2.142295, 0, 0, 0, 1, 1,
0.9413591, -0.760184, 3.906374, 0, 0, 0, 1, 1,
0.9454368, 1.877352, 1.161484, 0, 0, 0, 1, 1,
0.9497945, -0.4129201, 1.109916, 0, 0, 0, 1, 1,
0.9522896, 0.9873851, 0.7666741, 0, 0, 0, 1, 1,
0.956235, 1.053511, -0.4622002, 0, 0, 0, 1, 1,
0.962837, -0.05533992, 0.7514595, 1, 1, 1, 1, 1,
0.9641086, 1.573022, 2.317078, 1, 1, 1, 1, 1,
0.9694463, 0.293934, 0.666408, 1, 1, 1, 1, 1,
0.9737073, -0.1646888, 2.212876, 1, 1, 1, 1, 1,
0.9899338, -0.129934, 1.493736, 1, 1, 1, 1, 1,
0.9908648, 0.2534154, 1.995946, 1, 1, 1, 1, 1,
0.991371, -0.4828676, 2.443367, 1, 1, 1, 1, 1,
1.003525, 0.6817948, 0.9986186, 1, 1, 1, 1, 1,
1.011098, 0.4611593, 0.5007185, 1, 1, 1, 1, 1,
1.013251, 1.654633, -0.03988721, 1, 1, 1, 1, 1,
1.026213, -0.27623, 0.6752595, 1, 1, 1, 1, 1,
1.042181, -1.086822, 1.553391, 1, 1, 1, 1, 1,
1.050242, 0.3816093, 2.789219, 1, 1, 1, 1, 1,
1.054029, -1.527604, 3.375863, 1, 1, 1, 1, 1,
1.054859, 0.5198296, 0.7699129, 1, 1, 1, 1, 1,
1.063282, 0.1942596, 1.620692, 0, 0, 1, 1, 1,
1.06555, -0.1771691, 1.89183, 1, 0, 0, 1, 1,
1.066789, -0.1757075, 3.268377, 1, 0, 0, 1, 1,
1.087201, 0.7403651, 1.053914, 1, 0, 0, 1, 1,
1.092569, -1.909887, 3.622509, 1, 0, 0, 1, 1,
1.095607, 0.124188, 2.719233, 1, 0, 0, 1, 1,
1.099215, 0.598708, -0.4462051, 0, 0, 0, 1, 1,
1.106418, -0.3910058, 2.057154, 0, 0, 0, 1, 1,
1.108345, 1.937633, 0.01787485, 0, 0, 0, 1, 1,
1.109557, 0.0708232, 2.175953, 0, 0, 0, 1, 1,
1.110203, -0.6912581, 4.037372, 0, 0, 0, 1, 1,
1.112126, -1.251302, 1.342199, 0, 0, 0, 1, 1,
1.124316, 0.4607894, 1.21773, 0, 0, 0, 1, 1,
1.125157, -2.334338, 4.664974, 1, 1, 1, 1, 1,
1.125507, -0.7475204, 2.097128, 1, 1, 1, 1, 1,
1.139021, 0.7971086, 0.5713065, 1, 1, 1, 1, 1,
1.150693, -0.03013963, 3.20058, 1, 1, 1, 1, 1,
1.173119, -0.2644933, 1.455208, 1, 1, 1, 1, 1,
1.174467, 0.4477775, -0.2538357, 1, 1, 1, 1, 1,
1.181738, -1.230194, 2.021727, 1, 1, 1, 1, 1,
1.192003, 0.6582109, 1.05444, 1, 1, 1, 1, 1,
1.196687, 1.380531, 0.4344048, 1, 1, 1, 1, 1,
1.198353, -0.8652893, 1.534074, 1, 1, 1, 1, 1,
1.205039, -1.894511, 2.984475, 1, 1, 1, 1, 1,
1.218726, -0.9502305, 2.315504, 1, 1, 1, 1, 1,
1.220407, -0.7374207, 1.368456, 1, 1, 1, 1, 1,
1.221377, 0.8270622, 0.2143016, 1, 1, 1, 1, 1,
1.221903, -0.00468225, 1.133172, 1, 1, 1, 1, 1,
1.225534, 0.3552924, 4.34265, 0, 0, 1, 1, 1,
1.22919, 1.605694, -0.5670738, 1, 0, 0, 1, 1,
1.23016, 0.8709098, 2.68439, 1, 0, 0, 1, 1,
1.241258, 1.414323, 0.4204764, 1, 0, 0, 1, 1,
1.250584, 1.126281, 1.548925, 1, 0, 0, 1, 1,
1.250927, 0.5347866, -1.22037, 1, 0, 0, 1, 1,
1.252645, 0.4098045, 2.115135, 0, 0, 0, 1, 1,
1.258024, -0.4120393, 1.903633, 0, 0, 0, 1, 1,
1.259817, -1.234865, 2.917816, 0, 0, 0, 1, 1,
1.271165, -1.369131, 3.644265, 0, 0, 0, 1, 1,
1.27637, 0.2690218, 2.295638, 0, 0, 0, 1, 1,
1.29185, -0.5770385, 2.8473, 0, 0, 0, 1, 1,
1.294042, 1.350406, 0.4043109, 0, 0, 0, 1, 1,
1.297618, -1.200605, 2.911993, 1, 1, 1, 1, 1,
1.300154, -2.54917, 3.182041, 1, 1, 1, 1, 1,
1.309659, 0.9278958, 0.5152959, 1, 1, 1, 1, 1,
1.322278, 0.5274246, 1.606339, 1, 1, 1, 1, 1,
1.329841, 0.6303904, -0.3314022, 1, 1, 1, 1, 1,
1.331836, 0.5454721, 2.05291, 1, 1, 1, 1, 1,
1.334228, 0.8699387, -0.2652158, 1, 1, 1, 1, 1,
1.339608, 0.03377161, 1.555517, 1, 1, 1, 1, 1,
1.35191, 1.29424, 1.640114, 1, 1, 1, 1, 1,
1.353173, 0.02744602, 1.146915, 1, 1, 1, 1, 1,
1.370371, 1.110721, 0.9180167, 1, 1, 1, 1, 1,
1.374118, -0.9263597, 2.550921, 1, 1, 1, 1, 1,
1.384043, 0.7520232, 1.58533, 1, 1, 1, 1, 1,
1.394172, 1.674967, 0.6243863, 1, 1, 1, 1, 1,
1.402332, 1.099018, -0.5373614, 1, 1, 1, 1, 1,
1.409965, 1.745259, -0.4452278, 0, 0, 1, 1, 1,
1.417045, 0.293451, 1.59632, 1, 0, 0, 1, 1,
1.421972, -1.108594, 2.466007, 1, 0, 0, 1, 1,
1.424987, -0.4352804, 0.2980122, 1, 0, 0, 1, 1,
1.431358, 1.393763, 0.3795789, 1, 0, 0, 1, 1,
1.437551, -0.494328, 2.016377, 1, 0, 0, 1, 1,
1.443416, -0.9569027, 2.128106, 0, 0, 0, 1, 1,
1.447882, -0.7629516, 1.293765, 0, 0, 0, 1, 1,
1.45404, 0.2586917, 1.498439, 0, 0, 0, 1, 1,
1.455834, 1.114725, 2.190228, 0, 0, 0, 1, 1,
1.461263, 1.109858, 1.271175, 0, 0, 0, 1, 1,
1.468905, -0.4253213, 1.185852, 0, 0, 0, 1, 1,
1.476509, -0.1119738, 0.4528664, 0, 0, 0, 1, 1,
1.503161, -0.3859985, 1.182126, 1, 1, 1, 1, 1,
1.513299, 2.249625, 0.2125498, 1, 1, 1, 1, 1,
1.526633, 0.38473, 2.270295, 1, 1, 1, 1, 1,
1.546006, -1.477754, 2.4985, 1, 1, 1, 1, 1,
1.548039, -1.330378, 1.388936, 1, 1, 1, 1, 1,
1.553885, -0.4035889, 2.124764, 1, 1, 1, 1, 1,
1.573249, 0.9088585, 0.87536, 1, 1, 1, 1, 1,
1.574445, -0.06837262, 3.471959, 1, 1, 1, 1, 1,
1.576241, 0.08735023, 2.110094, 1, 1, 1, 1, 1,
1.581703, -1.131311, 0.733772, 1, 1, 1, 1, 1,
1.595117, -2.393338, 2.995492, 1, 1, 1, 1, 1,
1.596958, 0.5068176, 0.4511925, 1, 1, 1, 1, 1,
1.606195, -0.04384031, 1.000198, 1, 1, 1, 1, 1,
1.625985, 1.062835, 0.07589411, 1, 1, 1, 1, 1,
1.647025, -0.4869066, 0.931112, 1, 1, 1, 1, 1,
1.679357, 1.66677, 2.083003, 0, 0, 1, 1, 1,
1.695665, 1.513724, 0.7041372, 1, 0, 0, 1, 1,
1.709487, 0.8441097, 2.302146, 1, 0, 0, 1, 1,
1.73319, -0.2066954, 2.01807, 1, 0, 0, 1, 1,
1.736317, 0.6813661, 2.334021, 1, 0, 0, 1, 1,
1.748447, -2.539699, 4.699514, 1, 0, 0, 1, 1,
1.787168, -0.06989852, 2.216182, 0, 0, 0, 1, 1,
1.798999, -0.7026525, 3.337523, 0, 0, 0, 1, 1,
1.827004, -0.1121994, 0.1501442, 0, 0, 0, 1, 1,
1.835697, 1.328223, 1.111068, 0, 0, 0, 1, 1,
1.861592, -0.7704635, 3.073738, 0, 0, 0, 1, 1,
1.890416, 0.6668733, 1.167102, 0, 0, 0, 1, 1,
1.892706, 0.07127549, 1.480125, 0, 0, 0, 1, 1,
1.914449, -0.5069685, 1.07529, 1, 1, 1, 1, 1,
1.938911, -0.7108243, 2.735414, 1, 1, 1, 1, 1,
1.941624, 0.482072, 1.366911, 1, 1, 1, 1, 1,
1.962046, 0.1549091, 1.704859, 1, 1, 1, 1, 1,
1.970884, 0.774419, 2.410129, 1, 1, 1, 1, 1,
1.972892, 1.337019, 1.503943, 1, 1, 1, 1, 1,
1.993134, -1.308849, 3.699254, 1, 1, 1, 1, 1,
1.993606, 0.3167813, 0.192441, 1, 1, 1, 1, 1,
2.00253, 1.701927, 0.4856708, 1, 1, 1, 1, 1,
2.019333, 0.9832761, 2.72818, 1, 1, 1, 1, 1,
2.020455, 0.8148754, 1.518481, 1, 1, 1, 1, 1,
2.021307, -0.1292481, 2.01492, 1, 1, 1, 1, 1,
2.033636, -0.02307392, 0.6037307, 1, 1, 1, 1, 1,
2.036296, 1.02835, -1.245328, 1, 1, 1, 1, 1,
2.075799, 0.1461665, 1.528727, 1, 1, 1, 1, 1,
2.088377, -0.1934515, 2.877041, 0, 0, 1, 1, 1,
2.095895, -0.1668373, 3.063352, 1, 0, 0, 1, 1,
2.115491, -0.05369972, 2.652584, 1, 0, 0, 1, 1,
2.135595, -0.06776114, 0.9057232, 1, 0, 0, 1, 1,
2.137991, -0.4903551, 1.294837, 1, 0, 0, 1, 1,
2.168162, -1.261418, 1.445344, 1, 0, 0, 1, 1,
2.186188, 0.2170044, 0.4165817, 0, 0, 0, 1, 1,
2.194466, -0.6454256, 3.208507, 0, 0, 0, 1, 1,
2.214967, 3.016149, -0.3172002, 0, 0, 0, 1, 1,
2.22469, -1.300694, 2.231926, 0, 0, 0, 1, 1,
2.352447, -0.8794679, 1.811283, 0, 0, 0, 1, 1,
2.372726, -0.2841357, 1.799929, 0, 0, 0, 1, 1,
2.552234, -1.010557, 1.868067, 0, 0, 0, 1, 1,
2.620744, 1.090967, 0.4637032, 1, 1, 1, 1, 1,
2.665023, -0.6666433, 2.426291, 1, 1, 1, 1, 1,
2.707421, -0.1570284, 2.456184, 1, 1, 1, 1, 1,
2.715285, -0.3138205, 1.311024, 1, 1, 1, 1, 1,
3.12995, 0.4298738, 2.267631, 1, 1, 1, 1, 1,
3.240852, 0.9016403, 0.4268147, 1, 1, 1, 1, 1,
3.474448, 0.9245433, 0.5052638, 1, 1, 1, 1, 1
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
var radius = 9.385388;
var distance = 32.96578;
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
mvMatrix.translate( -0.4026148, -0.1548219, -0.5039051 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.96578);
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
