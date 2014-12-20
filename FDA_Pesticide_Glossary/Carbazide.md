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
-3.632341, -0.3864974, -3.997977, 1, 0, 0, 1,
-3.20188, -1.349385, -2.297258, 1, 0.007843138, 0, 1,
-2.881872, -0.6129238, -1.541428, 1, 0.01176471, 0, 1,
-2.854528, -0.3683291, -1.385597, 1, 0.01960784, 0, 1,
-2.787745, -1.276491, -2.860731, 1, 0.02352941, 0, 1,
-2.77907, -0.3694892, -2.770683, 1, 0.03137255, 0, 1,
-2.752267, 0.1789614, -2.556013, 1, 0.03529412, 0, 1,
-2.627955, 0.6645862, -1.397678, 1, 0.04313726, 0, 1,
-2.604254, -0.3901944, -2.544682, 1, 0.04705882, 0, 1,
-2.535308, -2.132983, -1.695802, 1, 0.05490196, 0, 1,
-2.531091, -0.1016139, -2.076905, 1, 0.05882353, 0, 1,
-2.439267, -0.02316126, -1.274882, 1, 0.06666667, 0, 1,
-2.262638, 0.1375791, -0.527274, 1, 0.07058824, 0, 1,
-2.192863, -0.7617519, -2.227063, 1, 0.07843138, 0, 1,
-2.151768, -0.8142629, -1.416037, 1, 0.08235294, 0, 1,
-2.12014, -0.1411834, -1.859585, 1, 0.09019608, 0, 1,
-2.10815, -0.8811843, -0.5191025, 1, 0.09411765, 0, 1,
-2.085024, -1.484286, -1.638877, 1, 0.1019608, 0, 1,
-2.06502, 1.628073, -1.558358, 1, 0.1098039, 0, 1,
-1.981746, -1.173775, -2.218741, 1, 0.1137255, 0, 1,
-1.975288, -0.5441939, -1.851819, 1, 0.1215686, 0, 1,
-1.957253, -0.03372734, -1.07139, 1, 0.1254902, 0, 1,
-1.950147, -0.7445704, -3.450231, 1, 0.1333333, 0, 1,
-1.936196, -0.8638147, -1.492156, 1, 0.1372549, 0, 1,
-1.91708, -0.4322862, -1.762299, 1, 0.145098, 0, 1,
-1.915594, -0.5983248, -3.655758, 1, 0.1490196, 0, 1,
-1.91237, -1.727736, -4.62113, 1, 0.1568628, 0, 1,
-1.911418, -0.08242179, -1.160142, 1, 0.1607843, 0, 1,
-1.90012, 0.2180354, -1.920386, 1, 0.1686275, 0, 1,
-1.896988, 0.386326, -1.042381, 1, 0.172549, 0, 1,
-1.844168, 0.588304, -1.913879, 1, 0.1803922, 0, 1,
-1.813465, -1.486818, -2.741713, 1, 0.1843137, 0, 1,
-1.804793, -2.363219, -2.669433, 1, 0.1921569, 0, 1,
-1.803648, 1.249615, -0.1844225, 1, 0.1960784, 0, 1,
-1.803419, -0.1862912, -1.165203, 1, 0.2039216, 0, 1,
-1.798617, 0.002432087, -4.192725, 1, 0.2117647, 0, 1,
-1.785069, 0.9353782, 0.8276224, 1, 0.2156863, 0, 1,
-1.780303, 0.4266419, -1.4379, 1, 0.2235294, 0, 1,
-1.774213, 0.9255321, -1.879161, 1, 0.227451, 0, 1,
-1.772546, -0.7572852, -1.235268, 1, 0.2352941, 0, 1,
-1.77048, -1.762184, 0.2861336, 1, 0.2392157, 0, 1,
-1.770475, 1.022426, -1.483018, 1, 0.2470588, 0, 1,
-1.757174, -1.266605, -2.755549, 1, 0.2509804, 0, 1,
-1.718213, 0.07057401, -1.02653, 1, 0.2588235, 0, 1,
-1.712082, 0.8433353, 1.432514, 1, 0.2627451, 0, 1,
-1.685775, -1.037437, -0.09584922, 1, 0.2705882, 0, 1,
-1.679777, 0.3627716, 0.00766604, 1, 0.2745098, 0, 1,
-1.676325, 0.6781955, -0.4021977, 1, 0.282353, 0, 1,
-1.665974, -0.2411757, -1.432731, 1, 0.2862745, 0, 1,
-1.642401, 0.8450917, -0.8130314, 1, 0.2941177, 0, 1,
-1.612683, -0.5977095, -2.106186, 1, 0.3019608, 0, 1,
-1.607035, -0.8232942, -1.264936, 1, 0.3058824, 0, 1,
-1.597785, -0.5609083, -1.726209, 1, 0.3137255, 0, 1,
-1.595789, -0.6459178, -1.401388, 1, 0.3176471, 0, 1,
-1.592954, -1.589333, -1.269373, 1, 0.3254902, 0, 1,
-1.589299, -1.270402, -3.034383, 1, 0.3294118, 0, 1,
-1.583287, -0.4959493, -2.207972, 1, 0.3372549, 0, 1,
-1.577048, -0.3971108, -0.7746745, 1, 0.3411765, 0, 1,
-1.566735, -1.090213, -3.872037, 1, 0.3490196, 0, 1,
-1.559447, 0.9238601, -0.9495703, 1, 0.3529412, 0, 1,
-1.548205, -0.8017471, -1.31357, 1, 0.3607843, 0, 1,
-1.53907, -0.8943882, -1.857146, 1, 0.3647059, 0, 1,
-1.537816, 1.238993, -1.394536, 1, 0.372549, 0, 1,
-1.523805, -1.388565, -2.307996, 1, 0.3764706, 0, 1,
-1.522463, 1.550235, -0.7590283, 1, 0.3843137, 0, 1,
-1.49848, 1.231908, -1.831811, 1, 0.3882353, 0, 1,
-1.493082, -0.629065, -1.494601, 1, 0.3960784, 0, 1,
-1.491065, -1.146222, -1.207211, 1, 0.4039216, 0, 1,
-1.486362, 1.158095, -2.381935, 1, 0.4078431, 0, 1,
-1.486127, -0.1666397, -1.621929, 1, 0.4156863, 0, 1,
-1.481434, -0.5210325, -3.405858, 1, 0.4196078, 0, 1,
-1.470389, 1.863426, -1.533066, 1, 0.427451, 0, 1,
-1.464594, 1.727942, -1.089502, 1, 0.4313726, 0, 1,
-1.448757, -1.504797, -2.845731, 1, 0.4392157, 0, 1,
-1.442144, -2.04323, -1.956132, 1, 0.4431373, 0, 1,
-1.431621, 1.209835, -0.7490572, 1, 0.4509804, 0, 1,
-1.423432, 0.8544407, 0.6591749, 1, 0.454902, 0, 1,
-1.418694, -0.1343043, -0.6224062, 1, 0.4627451, 0, 1,
-1.416448, -0.5821673, -2.688127, 1, 0.4666667, 0, 1,
-1.414598, -0.7390465, -2.512341, 1, 0.4745098, 0, 1,
-1.410347, -0.3318759, -2.803834, 1, 0.4784314, 0, 1,
-1.394072, -0.5094401, -1.791318, 1, 0.4862745, 0, 1,
-1.385587, 2.272246, -0.5221153, 1, 0.4901961, 0, 1,
-1.385259, -0.2679968, -1.724423, 1, 0.4980392, 0, 1,
-1.385107, -0.5333541, -1.351732, 1, 0.5058824, 0, 1,
-1.381088, 0.04618278, -1.501217, 1, 0.509804, 0, 1,
-1.378634, 1.054598, -2.398067, 1, 0.5176471, 0, 1,
-1.374736, 1.169383, -0.566731, 1, 0.5215687, 0, 1,
-1.364914, -0.05561042, -3.332329, 1, 0.5294118, 0, 1,
-1.361551, 0.2235099, -3.02163, 1, 0.5333334, 0, 1,
-1.359547, 0.6249605, -0.5397859, 1, 0.5411765, 0, 1,
-1.353855, -0.07541554, -2.548185, 1, 0.5450981, 0, 1,
-1.343266, 0.4139775, -2.485052, 1, 0.5529412, 0, 1,
-1.34306, -0.6604111, -0.6222789, 1, 0.5568628, 0, 1,
-1.340946, 0.5108289, -1.860892, 1, 0.5647059, 0, 1,
-1.328299, 0.3268785, -1.669956, 1, 0.5686275, 0, 1,
-1.317814, 1.774761, -1.783104, 1, 0.5764706, 0, 1,
-1.314789, 0.4544189, -0.1981518, 1, 0.5803922, 0, 1,
-1.303094, -0.3818791, -2.113052, 1, 0.5882353, 0, 1,
-1.297849, 0.7330856, 0.5623204, 1, 0.5921569, 0, 1,
-1.278204, 2.350693, -1.447455, 1, 0.6, 0, 1,
-1.276866, -0.7245119, -1.836202, 1, 0.6078432, 0, 1,
-1.270594, 0.3378846, -0.700823, 1, 0.6117647, 0, 1,
-1.266625, 0.3991237, -3.513172, 1, 0.6196079, 0, 1,
-1.266545, 0.9386345, -2.323427, 1, 0.6235294, 0, 1,
-1.258894, 0.23597, -1.094485, 1, 0.6313726, 0, 1,
-1.247269, -0.001326165, -2.735005, 1, 0.6352941, 0, 1,
-1.244142, -1.011665, -2.522681, 1, 0.6431373, 0, 1,
-1.233654, 1.200899, -1.676164, 1, 0.6470588, 0, 1,
-1.228788, -1.203309, -2.481888, 1, 0.654902, 0, 1,
-1.224792, -1.215114, -2.071358, 1, 0.6588235, 0, 1,
-1.219661, 0.4351254, 0.1950456, 1, 0.6666667, 0, 1,
-1.217577, -0.8856925, -1.245316, 1, 0.6705883, 0, 1,
-1.217492, 2.875735, 0.199446, 1, 0.6784314, 0, 1,
-1.214769, 1.476091, -0.4781226, 1, 0.682353, 0, 1,
-1.209985, -1.76883, -2.499647, 1, 0.6901961, 0, 1,
-1.20714, 0.7694186, -0.2216782, 1, 0.6941177, 0, 1,
-1.20313, 1.020712, -1.25921, 1, 0.7019608, 0, 1,
-1.200991, 0.3093456, -2.382595, 1, 0.7098039, 0, 1,
-1.194182, -0.1034503, -1.569953, 1, 0.7137255, 0, 1,
-1.190912, 0.3611633, -1.333502, 1, 0.7215686, 0, 1,
-1.189327, -2.486342, -3.277081, 1, 0.7254902, 0, 1,
-1.184792, 0.6416354, -2.890953, 1, 0.7333333, 0, 1,
-1.17739, 0.6123655, -2.268227, 1, 0.7372549, 0, 1,
-1.175898, -1.295363, -3.485154, 1, 0.7450981, 0, 1,
-1.167566, 0.7299121, 0.09827733, 1, 0.7490196, 0, 1,
-1.162688, -1.91236, -3.244165, 1, 0.7568628, 0, 1,
-1.149951, 0.08860634, -1.8749, 1, 0.7607843, 0, 1,
-1.147668, -1.0137, -2.595287, 1, 0.7686275, 0, 1,
-1.146625, -0.5997459, -2.046751, 1, 0.772549, 0, 1,
-1.146251, 0.5046989, -0.3395032, 1, 0.7803922, 0, 1,
-1.141735, 0.277763, -2.738571, 1, 0.7843137, 0, 1,
-1.134407, 0.7755435, -2.739895, 1, 0.7921569, 0, 1,
-1.128176, 0.2413724, -1.495928, 1, 0.7960784, 0, 1,
-1.124194, 0.3039937, -0.2134012, 1, 0.8039216, 0, 1,
-1.118885, -0.5635351, -0.5820257, 1, 0.8117647, 0, 1,
-1.11663, -0.8304429, -1.392503, 1, 0.8156863, 0, 1,
-1.105683, -1.737531, -1.538301, 1, 0.8235294, 0, 1,
-1.105383, -1.262185, -1.744702, 1, 0.827451, 0, 1,
-1.103756, 0.4495872, -1.897425, 1, 0.8352941, 0, 1,
-1.094317, -1.907808, -1.932079, 1, 0.8392157, 0, 1,
-1.08831, 0.2881862, -2.023397, 1, 0.8470588, 0, 1,
-1.083857, -0.3454797, -3.277007, 1, 0.8509804, 0, 1,
-1.075082, 1.135721, -0.6857567, 1, 0.8588235, 0, 1,
-1.069448, 0.1347659, -0.9366525, 1, 0.8627451, 0, 1,
-1.062242, 0.9009051, -0.4797176, 1, 0.8705882, 0, 1,
-1.060509, -0.8202381, -3.123451, 1, 0.8745098, 0, 1,
-1.058793, -0.5602955, -2.176516, 1, 0.8823529, 0, 1,
-1.053006, 1.668252, -1.995082, 1, 0.8862745, 0, 1,
-1.038918, 0.2717268, -0.09441281, 1, 0.8941177, 0, 1,
-1.026441, -0.5565313, -1.741465, 1, 0.8980392, 0, 1,
-1.026023, -0.03849694, -1.167732, 1, 0.9058824, 0, 1,
-1.022757, -1.460159, -2.610215, 1, 0.9137255, 0, 1,
-1.02232, 0.2029789, -1.529574, 1, 0.9176471, 0, 1,
-1.016226, 0.3538794, -0.6222675, 1, 0.9254902, 0, 1,
-1.015191, 0.5486715, -1.597376, 1, 0.9294118, 0, 1,
-1.014866, 0.5755225, -1.55904, 1, 0.9372549, 0, 1,
-1.0078, -1.390042, -2.773649, 1, 0.9411765, 0, 1,
-1.007577, 0.9928186, 1.151962, 1, 0.9490196, 0, 1,
-1.006802, 1.358736, -1.084289, 1, 0.9529412, 0, 1,
-1.004609, -0.6119012, -3.703806, 1, 0.9607843, 0, 1,
-0.9897406, 0.5688071, -1.049714, 1, 0.9647059, 0, 1,
-0.9841046, 0.04662918, -0.6960974, 1, 0.972549, 0, 1,
-0.9835733, 0.3232185, -1.263668, 1, 0.9764706, 0, 1,
-0.9768077, -1.772259, -2.271096, 1, 0.9843137, 0, 1,
-0.967355, 1.322777, -0.003074393, 1, 0.9882353, 0, 1,
-0.9526398, 0.1896065, -0.7424997, 1, 0.9960784, 0, 1,
-0.9486101, 2.21002, -0.3470921, 0.9960784, 1, 0, 1,
-0.9459537, -0.2773876, -1.488743, 0.9921569, 1, 0, 1,
-0.9435529, -0.625423, -3.176374, 0.9843137, 1, 0, 1,
-0.9419297, 0.4042087, 0.2500664, 0.9803922, 1, 0, 1,
-0.9314392, -0.3327985, -3.879812, 0.972549, 1, 0, 1,
-0.9276657, -1.622241, -4.143442, 0.9686275, 1, 0, 1,
-0.9256584, 1.369581, -3.119477, 0.9607843, 1, 0, 1,
-0.9195019, 2.154471, -0.6795434, 0.9568627, 1, 0, 1,
-0.9120349, -2.422607, -4.86964, 0.9490196, 1, 0, 1,
-0.8979695, -1.097176, -0.7419587, 0.945098, 1, 0, 1,
-0.8848226, -1.075976, -3.861933, 0.9372549, 1, 0, 1,
-0.8794291, -0.007762122, -2.035882, 0.9333333, 1, 0, 1,
-0.8724287, 0.1564845, -0.2659976, 0.9254902, 1, 0, 1,
-0.8719757, -0.2102072, -1.056362, 0.9215686, 1, 0, 1,
-0.871623, -0.4944638, -3.331038, 0.9137255, 1, 0, 1,
-0.8688716, -0.983265, -2.454048, 0.9098039, 1, 0, 1,
-0.8666794, 0.3944632, -1.518683, 0.9019608, 1, 0, 1,
-0.8661965, 1.849925, 1.343218, 0.8941177, 1, 0, 1,
-0.8535177, 0.8616216, -1.187961, 0.8901961, 1, 0, 1,
-0.8463379, 1.996357, 0.5613896, 0.8823529, 1, 0, 1,
-0.84522, 0.8486845, 0.4654849, 0.8784314, 1, 0, 1,
-0.8425758, 0.7966211, -1.486306, 0.8705882, 1, 0, 1,
-0.8390315, 0.6471412, -0.5391059, 0.8666667, 1, 0, 1,
-0.8386208, 0.3130316, -1.322604, 0.8588235, 1, 0, 1,
-0.8386198, 0.3714465, -1.86563, 0.854902, 1, 0, 1,
-0.8366948, -0.4309564, -2.850917, 0.8470588, 1, 0, 1,
-0.8302695, -1.446899, -1.46549, 0.8431373, 1, 0, 1,
-0.8292297, -0.3254927, -1.856542, 0.8352941, 1, 0, 1,
-0.8286629, -0.3236905, -2.244334, 0.8313726, 1, 0, 1,
-0.8280579, -0.556969, -1.393287, 0.8235294, 1, 0, 1,
-0.8273815, -0.8522671, -3.459162, 0.8196079, 1, 0, 1,
-0.8266237, 1.187126, 0.1213304, 0.8117647, 1, 0, 1,
-0.8239049, -0.939133, -1.445296, 0.8078431, 1, 0, 1,
-0.8174701, 0.4062023, -1.851148, 0.8, 1, 0, 1,
-0.8124905, -0.5251772, -1.590391, 0.7921569, 1, 0, 1,
-0.8042631, -0.1226399, -0.09442606, 0.7882353, 1, 0, 1,
-0.8019669, -0.7064643, -1.785497, 0.7803922, 1, 0, 1,
-0.7990251, 1.722724, -0.3866782, 0.7764706, 1, 0, 1,
-0.7967559, 1.893224, 0.8219523, 0.7686275, 1, 0, 1,
-0.794458, -1.27857, -3.549627, 0.7647059, 1, 0, 1,
-0.788526, 1.263525, -0.2060601, 0.7568628, 1, 0, 1,
-0.7873281, 0.4359263, -0.496394, 0.7529412, 1, 0, 1,
-0.7821903, 0.6210842, -0.4995449, 0.7450981, 1, 0, 1,
-0.7793824, 0.4446671, -1.554823, 0.7411765, 1, 0, 1,
-0.7753857, -1.81786, -3.208168, 0.7333333, 1, 0, 1,
-0.7745843, -1.681236, -0.7577821, 0.7294118, 1, 0, 1,
-0.7741446, 1.070924, -0.7244545, 0.7215686, 1, 0, 1,
-0.7710294, -0.75734, -1.618829, 0.7176471, 1, 0, 1,
-0.7595141, 0.6306959, -0.4423932, 0.7098039, 1, 0, 1,
-0.7544162, 0.9341298, -0.950495, 0.7058824, 1, 0, 1,
-0.7528708, 0.7512529, -1.134999, 0.6980392, 1, 0, 1,
-0.7503104, -0.7180196, -2.494954, 0.6901961, 1, 0, 1,
-0.7468865, 1.080889, 1.404656, 0.6862745, 1, 0, 1,
-0.7441362, -1.646076, -2.02777, 0.6784314, 1, 0, 1,
-0.7395551, 1.366893, 0.4999759, 0.6745098, 1, 0, 1,
-0.7387671, 0.7826508, -1.188617, 0.6666667, 1, 0, 1,
-0.736224, 0.02776655, -1.90247, 0.6627451, 1, 0, 1,
-0.7211691, -0.06830843, -1.085352, 0.654902, 1, 0, 1,
-0.7209953, 0.5154751, -2.243437, 0.6509804, 1, 0, 1,
-0.7192635, 0.3233987, -2.428297, 0.6431373, 1, 0, 1,
-0.7137389, 0.007606854, 0.9370016, 0.6392157, 1, 0, 1,
-0.7099892, 1.492121, 0.148388, 0.6313726, 1, 0, 1,
-0.7095772, 0.5830031, -0.8041338, 0.627451, 1, 0, 1,
-0.703608, 0.9968519, 0.7410031, 0.6196079, 1, 0, 1,
-0.7033966, 0.9698015, -0.5161914, 0.6156863, 1, 0, 1,
-0.7007339, -0.7173532, -2.146442, 0.6078432, 1, 0, 1,
-0.6986187, 0.9227661, -0.3555231, 0.6039216, 1, 0, 1,
-0.6937808, -0.4219674, -2.845614, 0.5960785, 1, 0, 1,
-0.6929088, 1.977839, -1.175536, 0.5882353, 1, 0, 1,
-0.6922749, -0.8460369, -2.81937, 0.5843138, 1, 0, 1,
-0.6884471, -0.4803522, -2.285408, 0.5764706, 1, 0, 1,
-0.6879097, 0.8064253, -1.950198, 0.572549, 1, 0, 1,
-0.685505, 2.098697, -0.335399, 0.5647059, 1, 0, 1,
-0.6845009, 1.04132, 0.1660647, 0.5607843, 1, 0, 1,
-0.6770151, -1.530847, -3.181317, 0.5529412, 1, 0, 1,
-0.6745352, -0.475625, -1.542305, 0.5490196, 1, 0, 1,
-0.6710442, 0.9484324, -1.311821, 0.5411765, 1, 0, 1,
-0.6669324, -1.9472, -3.371966, 0.5372549, 1, 0, 1,
-0.6669185, 3.392518, 1.368049, 0.5294118, 1, 0, 1,
-0.6667817, 0.04493694, -1.454883, 0.5254902, 1, 0, 1,
-0.6662562, -0.6374065, -1.546983, 0.5176471, 1, 0, 1,
-0.6635124, -0.2334012, -1.708048, 0.5137255, 1, 0, 1,
-0.6607618, -0.9132814, -3.618386, 0.5058824, 1, 0, 1,
-0.652082, 0.8027204, 0.2659899, 0.5019608, 1, 0, 1,
-0.6422474, -1.226135, -3.536212, 0.4941176, 1, 0, 1,
-0.6421317, -1.307537, -2.192797, 0.4862745, 1, 0, 1,
-0.6403957, -0.9436838, -4.237917, 0.4823529, 1, 0, 1,
-0.6388233, -0.2679396, -0.886178, 0.4745098, 1, 0, 1,
-0.6351616, -0.7158638, -2.26596, 0.4705882, 1, 0, 1,
-0.6301673, -0.1318374, -0.9159235, 0.4627451, 1, 0, 1,
-0.6289864, 0.2947311, -3.057687, 0.4588235, 1, 0, 1,
-0.6205646, -0.9618893, -2.785293, 0.4509804, 1, 0, 1,
-0.6169887, 2.32779, 1.34749, 0.4470588, 1, 0, 1,
-0.6134002, 0.3894219, -0.9901035, 0.4392157, 1, 0, 1,
-0.6117612, -2.185901, -2.09902, 0.4352941, 1, 0, 1,
-0.609476, -0.538534, -3.781571, 0.427451, 1, 0, 1,
-0.60711, 0.5487531, -1.617815, 0.4235294, 1, 0, 1,
-0.6068229, -0.8209974, -3.303208, 0.4156863, 1, 0, 1,
-0.6051794, 0.9099203, 1.148145, 0.4117647, 1, 0, 1,
-0.5972906, -0.802203, -3.389372, 0.4039216, 1, 0, 1,
-0.5928804, 0.1315424, -3.069366, 0.3960784, 1, 0, 1,
-0.5908982, 2.33565, -0.1768368, 0.3921569, 1, 0, 1,
-0.5903936, -0.9866552, -1.033003, 0.3843137, 1, 0, 1,
-0.5892545, -0.04461985, -2.293904, 0.3803922, 1, 0, 1,
-0.5886503, 0.3117032, 0.08180231, 0.372549, 1, 0, 1,
-0.588466, -0.7210344, -2.189261, 0.3686275, 1, 0, 1,
-0.5864443, 0.6608574, 0.7307275, 0.3607843, 1, 0, 1,
-0.5836784, -0.6018082, -2.176667, 0.3568628, 1, 0, 1,
-0.5830378, 0.3250268, -1.412652, 0.3490196, 1, 0, 1,
-0.5796567, -0.4413165, -3.389633, 0.345098, 1, 0, 1,
-0.5792258, -1.561922, -2.962269, 0.3372549, 1, 0, 1,
-0.5780667, 1.23621, -2.008894, 0.3333333, 1, 0, 1,
-0.5705254, 0.0757788, 0.02940295, 0.3254902, 1, 0, 1,
-0.5638957, 0.1348018, -2.674291, 0.3215686, 1, 0, 1,
-0.5632285, -0.4304585, -2.352212, 0.3137255, 1, 0, 1,
-0.5611452, -0.5903584, -3.188518, 0.3098039, 1, 0, 1,
-0.5591078, 0.6707654, 0.3027513, 0.3019608, 1, 0, 1,
-0.5576814, 0.6008992, -1.883, 0.2941177, 1, 0, 1,
-0.5552426, -0.7385859, -1.520635, 0.2901961, 1, 0, 1,
-0.5509306, -1.669869, -1.536651, 0.282353, 1, 0, 1,
-0.5499321, -0.2787613, -2.406913, 0.2784314, 1, 0, 1,
-0.5491951, 0.1894598, -0.9799399, 0.2705882, 1, 0, 1,
-0.5455579, -0.8111786, -2.426604, 0.2666667, 1, 0, 1,
-0.5450215, -0.2555999, -2.454514, 0.2588235, 1, 0, 1,
-0.5413574, -0.5862937, -3.714487, 0.254902, 1, 0, 1,
-0.5412589, 0.6984212, -2.023816, 0.2470588, 1, 0, 1,
-0.5389487, 0.5630058, -0.7140639, 0.2431373, 1, 0, 1,
-0.5353495, 1.071422, -1.629651, 0.2352941, 1, 0, 1,
-0.530645, -0.7417713, -0.3977571, 0.2313726, 1, 0, 1,
-0.5297315, -0.2798003, -2.136068, 0.2235294, 1, 0, 1,
-0.5257334, -0.9712241, -1.899431, 0.2196078, 1, 0, 1,
-0.5254538, -1.23464, -3.377336, 0.2117647, 1, 0, 1,
-0.5252203, 0.5906376, -2.538873, 0.2078431, 1, 0, 1,
-0.5237293, 0.01518969, -2.705117, 0.2, 1, 0, 1,
-0.5202805, -2.426823, -1.980164, 0.1921569, 1, 0, 1,
-0.5176225, -0.4078875, -2.418724, 0.1882353, 1, 0, 1,
-0.5165923, -1.322035, -3.169457, 0.1803922, 1, 0, 1,
-0.5084959, -0.3197842, -1.412596, 0.1764706, 1, 0, 1,
-0.5082878, -1.100723, -1.630812, 0.1686275, 1, 0, 1,
-0.499307, -1.224921, -2.025082, 0.1647059, 1, 0, 1,
-0.4920598, -1.131087, -3.310214, 0.1568628, 1, 0, 1,
-0.4914042, -0.8033369, -2.700198, 0.1529412, 1, 0, 1,
-0.4876699, -1.190966, -3.273137, 0.145098, 1, 0, 1,
-0.4875073, 0.1005018, -0.4768066, 0.1411765, 1, 0, 1,
-0.4872639, -2.695199, -0.02000714, 0.1333333, 1, 0, 1,
-0.4867537, -2.192894, -0.9999796, 0.1294118, 1, 0, 1,
-0.4827632, 0.01579999, -1.90906, 0.1215686, 1, 0, 1,
-0.4817117, -1.275848, -0.9830592, 0.1176471, 1, 0, 1,
-0.479075, -0.128828, -1.146229, 0.1098039, 1, 0, 1,
-0.4768912, -2.352081, -1.906775, 0.1058824, 1, 0, 1,
-0.4750086, -0.7636884, -2.675724, 0.09803922, 1, 0, 1,
-0.4740589, -1.702892, -3.328097, 0.09019608, 1, 0, 1,
-0.4665917, -0.1237694, -1.852161, 0.08627451, 1, 0, 1,
-0.4655679, 0.1117473, -0.6509185, 0.07843138, 1, 0, 1,
-0.4650177, -0.8753887, -4.142034, 0.07450981, 1, 0, 1,
-0.456558, -0.8561172, -2.323009, 0.06666667, 1, 0, 1,
-0.452065, 0.1830185, -0.9308934, 0.0627451, 1, 0, 1,
-0.4513847, 0.08454356, -1.498448, 0.05490196, 1, 0, 1,
-0.4468178, -0.6491747, -1.730238, 0.05098039, 1, 0, 1,
-0.4467128, 0.3559415, -0.9067574, 0.04313726, 1, 0, 1,
-0.4448168, 1.555581, -1.098193, 0.03921569, 1, 0, 1,
-0.4441456, 1.279481, -0.7562109, 0.03137255, 1, 0, 1,
-0.4426892, 2.82756, 1.168545, 0.02745098, 1, 0, 1,
-0.4345866, -1.835752, -3.935645, 0.01960784, 1, 0, 1,
-0.4296469, 0.8325174, -1.392247, 0.01568628, 1, 0, 1,
-0.4295715, -1.093278, -1.355709, 0.007843138, 1, 0, 1,
-0.4238904, 0.2536827, -0.9947774, 0.003921569, 1, 0, 1,
-0.4225149, -0.5860998, -2.480642, 0, 1, 0.003921569, 1,
-0.4209501, -0.8368171, -2.289595, 0, 1, 0.01176471, 1,
-0.4189676, 1.717705, -0.4015673, 0, 1, 0.01568628, 1,
-0.4078846, -1.249673, -2.693835, 0, 1, 0.02352941, 1,
-0.4060481, -0.4600102, -1.749621, 0, 1, 0.02745098, 1,
-0.40565, -0.3943009, -2.074028, 0, 1, 0.03529412, 1,
-0.4053235, -1.230115, -1.984495, 0, 1, 0.03921569, 1,
-0.3973114, 0.6208128, -0.3732364, 0, 1, 0.04705882, 1,
-0.3964613, 0.1527367, -1.107816, 0, 1, 0.05098039, 1,
-0.3924006, 1.492607, 0.1137452, 0, 1, 0.05882353, 1,
-0.3873729, -1.10924, -5.24366, 0, 1, 0.0627451, 1,
-0.3859363, -1.229166, -1.906454, 0, 1, 0.07058824, 1,
-0.3836329, 0.2990706, 0.3953969, 0, 1, 0.07450981, 1,
-0.3796416, -0.7489535, -1.789323, 0, 1, 0.08235294, 1,
-0.3771369, -0.5241019, -1.798582, 0, 1, 0.08627451, 1,
-0.3715045, -1.465, -1.380027, 0, 1, 0.09411765, 1,
-0.3711995, 1.034642, 2.527661, 0, 1, 0.1019608, 1,
-0.3696842, -1.396234, -3.55242, 0, 1, 0.1058824, 1,
-0.3688024, 0.1584976, -0.2058857, 0, 1, 0.1137255, 1,
-0.3671887, -0.3613697, -2.962607, 0, 1, 0.1176471, 1,
-0.3655458, -1.079946, -4.541302, 0, 1, 0.1254902, 1,
-0.3604519, -0.6487039, -2.423869, 0, 1, 0.1294118, 1,
-0.3597936, -0.5589935, -2.173146, 0, 1, 0.1372549, 1,
-0.3596407, -0.2777791, -1.267463, 0, 1, 0.1411765, 1,
-0.356058, 0.531341, -0.5132121, 0, 1, 0.1490196, 1,
-0.3558824, -0.9078326, -2.082409, 0, 1, 0.1529412, 1,
-0.3556492, -0.7329389, -2.426648, 0, 1, 0.1607843, 1,
-0.3518759, -2.248354, -3.005915, 0, 1, 0.1647059, 1,
-0.3489057, 0.5314116, -0.9558785, 0, 1, 0.172549, 1,
-0.3475713, 1.202026, -0.64459, 0, 1, 0.1764706, 1,
-0.3456795, 0.1440246, -0.7715192, 0, 1, 0.1843137, 1,
-0.3425134, 1.756493, -0.4399249, 0, 1, 0.1882353, 1,
-0.3421333, -1.423889, -3.255739, 0, 1, 0.1960784, 1,
-0.3373175, -0.5174537, -3.260463, 0, 1, 0.2039216, 1,
-0.3370354, 3.271319, -1.738973, 0, 1, 0.2078431, 1,
-0.3318651, -1.028754, -2.080348, 0, 1, 0.2156863, 1,
-0.32723, 0.2604522, 0.9822053, 0, 1, 0.2196078, 1,
-0.3243861, -0.4067881, -4.476501, 0, 1, 0.227451, 1,
-0.3237272, 1.534859, 0.039784, 0, 1, 0.2313726, 1,
-0.3170148, -0.04942213, -0.6808383, 0, 1, 0.2392157, 1,
-0.3168731, 1.067755, -0.01654866, 0, 1, 0.2431373, 1,
-0.3156074, -0.9779259, -2.488181, 0, 1, 0.2509804, 1,
-0.3124478, -0.6193548, -1.950183, 0, 1, 0.254902, 1,
-0.3124287, -0.3190124, -2.684543, 0, 1, 0.2627451, 1,
-0.309937, -0.6671467, -4.039367, 0, 1, 0.2666667, 1,
-0.3094963, -0.3156904, -4.291989, 0, 1, 0.2745098, 1,
-0.3082243, 0.81625, -0.1427319, 0, 1, 0.2784314, 1,
-0.3068936, 1.881704, 0.08768743, 0, 1, 0.2862745, 1,
-0.3037165, 0.5133482, -1.234589, 0, 1, 0.2901961, 1,
-0.3028892, 0.957008, 1.299555, 0, 1, 0.2980392, 1,
-0.2981959, 0.3132238, -2.30697, 0, 1, 0.3058824, 1,
-0.2969486, 2.281209, -0.7056743, 0, 1, 0.3098039, 1,
-0.2921845, 0.4632499, -1.497432, 0, 1, 0.3176471, 1,
-0.2902751, -0.2409636, -1.863239, 0, 1, 0.3215686, 1,
-0.2824747, 0.353948, -0.9235316, 0, 1, 0.3294118, 1,
-0.2794553, -0.8601357, -2.522169, 0, 1, 0.3333333, 1,
-0.277554, -1.490639, -3.85768, 0, 1, 0.3411765, 1,
-0.2760113, -0.6518617, -2.493851, 0, 1, 0.345098, 1,
-0.2715413, -2.22167, -2.723502, 0, 1, 0.3529412, 1,
-0.2696199, -1.188598, -2.200573, 0, 1, 0.3568628, 1,
-0.2686155, -1.739841, -3.044744, 0, 1, 0.3647059, 1,
-0.2665939, 1.451839, 1.221309, 0, 1, 0.3686275, 1,
-0.2654657, 0.4357786, 0.3641366, 0, 1, 0.3764706, 1,
-0.2638598, 0.508393, -0.982636, 0, 1, 0.3803922, 1,
-0.2629305, 1.265784, 0.9170324, 0, 1, 0.3882353, 1,
-0.2601259, 1.121431, 0.5833946, 0, 1, 0.3921569, 1,
-0.254119, -0.4301758, -1.841692, 0, 1, 0.4, 1,
-0.2528858, -0.3047091, -3.157913, 0, 1, 0.4078431, 1,
-0.2507527, -0.6197516, -3.295025, 0, 1, 0.4117647, 1,
-0.2487346, -0.06744045, -3.251847, 0, 1, 0.4196078, 1,
-0.2443876, 0.2275355, -0.6677603, 0, 1, 0.4235294, 1,
-0.2429913, 0.3612169, -1.651975, 0, 1, 0.4313726, 1,
-0.241473, 0.9456177, -1.978018, 0, 1, 0.4352941, 1,
-0.2407432, 0.3634009, 0.8084012, 0, 1, 0.4431373, 1,
-0.2362313, -1.431898, -2.780138, 0, 1, 0.4470588, 1,
-0.2322016, -0.6069334, -3.190359, 0, 1, 0.454902, 1,
-0.2271225, -0.04198882, -1.62389, 0, 1, 0.4588235, 1,
-0.2268637, -0.4796691, -0.9027342, 0, 1, 0.4666667, 1,
-0.2262259, 0.8818669, -0.6727983, 0, 1, 0.4705882, 1,
-0.2256802, -0.3336936, -1.992227, 0, 1, 0.4784314, 1,
-0.2248711, 0.1537488, 0.6534909, 0, 1, 0.4823529, 1,
-0.2247262, 0.7647178, 0.1474265, 0, 1, 0.4901961, 1,
-0.2246154, -1.474481, -3.831964, 0, 1, 0.4941176, 1,
-0.2246081, -0.7068741, -4.539692, 0, 1, 0.5019608, 1,
-0.2228355, -0.4486594, -2.254497, 0, 1, 0.509804, 1,
-0.2157369, 0.8760749, -0.307875, 0, 1, 0.5137255, 1,
-0.2142541, -0.615078, -1.414241, 0, 1, 0.5215687, 1,
-0.2093858, -0.2264087, -2.35391, 0, 1, 0.5254902, 1,
-0.20885, 0.5666136, 0.884007, 0, 1, 0.5333334, 1,
-0.2078011, -1.790922, -4.211308, 0, 1, 0.5372549, 1,
-0.2077297, 0.464654, -1.08024, 0, 1, 0.5450981, 1,
-0.2046953, -0.131558, -1.856782, 0, 1, 0.5490196, 1,
-0.20455, -0.5108457, -2.276032, 0, 1, 0.5568628, 1,
-0.2039265, -0.355016, -5.753414, 0, 1, 0.5607843, 1,
-0.2033847, 1.408696, -0.1698547, 0, 1, 0.5686275, 1,
-0.2016872, 1.105417, -0.6584293, 0, 1, 0.572549, 1,
-0.2006862, -0.4941433, -2.994488, 0, 1, 0.5803922, 1,
-0.193037, 0.02877358, -2.016229, 0, 1, 0.5843138, 1,
-0.1859808, 0.007649805, -1.525806, 0, 1, 0.5921569, 1,
-0.1856875, 0.4821256, 0.8818553, 0, 1, 0.5960785, 1,
-0.1851697, 1.138431, -0.2210351, 0, 1, 0.6039216, 1,
-0.1803344, -0.7152243, -2.531657, 0, 1, 0.6117647, 1,
-0.177086, -0.06426909, 0.08055204, 0, 1, 0.6156863, 1,
-0.1752259, -1.283589, -4.706365, 0, 1, 0.6235294, 1,
-0.1738316, 0.2500854, -1.291236, 0, 1, 0.627451, 1,
-0.1715358, 0.2481069, 0.2514447, 0, 1, 0.6352941, 1,
-0.1706038, 0.6443657, -0.2595482, 0, 1, 0.6392157, 1,
-0.1703802, 2.331242, -1.342741, 0, 1, 0.6470588, 1,
-0.1699294, -0.6570516, -3.931407, 0, 1, 0.6509804, 1,
-0.1669092, 1.235788, 0.7239583, 0, 1, 0.6588235, 1,
-0.1665819, -0.4655493, -3.368603, 0, 1, 0.6627451, 1,
-0.1655917, -1.171444, -2.941401, 0, 1, 0.6705883, 1,
-0.1646906, -2.051663, -3.509675, 0, 1, 0.6745098, 1,
-0.1641837, 0.3904017, -0.2172148, 0, 1, 0.682353, 1,
-0.1604539, 0.9479845, -1.679444, 0, 1, 0.6862745, 1,
-0.1588116, -0.277733, -3.161853, 0, 1, 0.6941177, 1,
-0.155088, 1.298054, -0.8057857, 0, 1, 0.7019608, 1,
-0.1525759, 0.827626, -0.7991243, 0, 1, 0.7058824, 1,
-0.1499506, -0.4793566, -1.726927, 0, 1, 0.7137255, 1,
-0.1493871, -0.462015, -1.706966, 0, 1, 0.7176471, 1,
-0.1458322, 1.82783, -1.095476, 0, 1, 0.7254902, 1,
-0.1385718, -1.842986, -4.601289, 0, 1, 0.7294118, 1,
-0.1385182, 0.174075, -0.5954389, 0, 1, 0.7372549, 1,
-0.1348912, 0.1129419, -0.4275709, 0, 1, 0.7411765, 1,
-0.1292364, 0.2670863, -0.5234784, 0, 1, 0.7490196, 1,
-0.1270412, 0.3511696, 0.527312, 0, 1, 0.7529412, 1,
-0.1263508, -0.2979745, -3.275795, 0, 1, 0.7607843, 1,
-0.1255925, 0.1699739, 0.7869093, 0, 1, 0.7647059, 1,
-0.1250519, 0.9461517, -0.6169403, 0, 1, 0.772549, 1,
-0.1226487, 0.2982662, -0.1104408, 0, 1, 0.7764706, 1,
-0.1122328, 2.374789, -0.04528304, 0, 1, 0.7843137, 1,
-0.1089272, -0.08217807, -4.269811, 0, 1, 0.7882353, 1,
-0.1080275, -0.1532985, -3.162406, 0, 1, 0.7960784, 1,
-0.1048825, 0.3243256, 0.09067555, 0, 1, 0.8039216, 1,
-0.1045494, 0.17874, -0.6849457, 0, 1, 0.8078431, 1,
-0.09883841, 0.3616845, -0.591759, 0, 1, 0.8156863, 1,
-0.0961092, 1.488066, 1.738794, 0, 1, 0.8196079, 1,
-0.09584463, -0.08231071, -1.229421, 0, 1, 0.827451, 1,
-0.09462353, 0.03045459, -1.194601, 0, 1, 0.8313726, 1,
-0.09457488, 1.095374, -0.3049555, 0, 1, 0.8392157, 1,
-0.09352361, 0.925576, 1.751974, 0, 1, 0.8431373, 1,
-0.08483484, 0.3724958, 0.9631252, 0, 1, 0.8509804, 1,
-0.08419872, -1.808023, -2.736743, 0, 1, 0.854902, 1,
-0.08396011, 1.647777, 1.107259, 0, 1, 0.8627451, 1,
-0.08333267, -2.059469, -2.999435, 0, 1, 0.8666667, 1,
-0.07871232, -1.012695, -1.907949, 0, 1, 0.8745098, 1,
-0.07808078, -0.6865677, -2.90517, 0, 1, 0.8784314, 1,
-0.07077174, 1.30846, -1.13144, 0, 1, 0.8862745, 1,
-0.06934503, 0.6061154, -2.427863, 0, 1, 0.8901961, 1,
-0.06730004, 1.176555, -1.356439, 0, 1, 0.8980392, 1,
-0.06584091, 1.313902, -0.4618951, 0, 1, 0.9058824, 1,
-0.06505229, 1.271431, 0.7905163, 0, 1, 0.9098039, 1,
-0.06465801, 0.2568417, 0.7411395, 0, 1, 0.9176471, 1,
-0.06372105, 2.161587, 0.1212881, 0, 1, 0.9215686, 1,
-0.06332776, 0.2579984, -0.4136572, 0, 1, 0.9294118, 1,
-0.06298932, 0.8191667, 0.1592313, 0, 1, 0.9333333, 1,
-0.06154333, 0.08904517, -0.7899279, 0, 1, 0.9411765, 1,
-0.05987541, 0.258875, -0.1715489, 0, 1, 0.945098, 1,
-0.05732722, -0.3959301, -3.247272, 0, 1, 0.9529412, 1,
-0.05707807, 0.5294434, 0.5843759, 0, 1, 0.9568627, 1,
-0.05313368, -0.6225312, -3.380268, 0, 1, 0.9647059, 1,
-0.05248368, -0.4718911, -2.016335, 0, 1, 0.9686275, 1,
-0.05152318, 0.6320907, 0.6366583, 0, 1, 0.9764706, 1,
-0.0428912, 0.8584319, -0.8331418, 0, 1, 0.9803922, 1,
-0.04057133, -0.2100046, -1.382189, 0, 1, 0.9882353, 1,
-0.0328256, -2.36072, -3.458572, 0, 1, 0.9921569, 1,
-0.03179429, -1.424783, -2.725756, 0, 1, 1, 1,
-0.03044634, 1.401353, 0.4235773, 0, 0.9921569, 1, 1,
-0.0280607, -0.07618972, -2.78017, 0, 0.9882353, 1, 1,
-0.02411111, -0.5934337, -1.670057, 0, 0.9803922, 1, 1,
-0.02188687, -0.8384291, -2.051874, 0, 0.9764706, 1, 1,
-0.02149302, -1.082179, -3.674971, 0, 0.9686275, 1, 1,
-0.02108086, -1.984967, -4.163574, 0, 0.9647059, 1, 1,
-0.0205325, -0.02542835, -2.325021, 0, 0.9568627, 1, 1,
-0.01731462, -0.3562005, -1.465284, 0, 0.9529412, 1, 1,
-0.003528376, -0.04920561, -4.991166, 0, 0.945098, 1, 1,
-0.001196789, -0.3365529, -3.56782, 0, 0.9411765, 1, 1,
-0.0006078052, 2.401298, 1.479052, 0, 0.9333333, 1, 1,
0.003179844, 0.5778999, -1.092405, 0, 0.9294118, 1, 1,
0.01098942, -0.4642122, 2.830843, 0, 0.9215686, 1, 1,
0.02029146, -0.1422684, 2.665887, 0, 0.9176471, 1, 1,
0.02244424, -0.4778693, 5.395334, 0, 0.9098039, 1, 1,
0.02609047, -0.3246582, 2.494342, 0, 0.9058824, 1, 1,
0.02817807, 0.3315544, 0.3937459, 0, 0.8980392, 1, 1,
0.02841788, -2.108819, 3.066768, 0, 0.8901961, 1, 1,
0.02945106, 2.652943, 0.2734996, 0, 0.8862745, 1, 1,
0.03089041, 1.683686, 0.9660185, 0, 0.8784314, 1, 1,
0.03091796, 0.8832124, -0.1564693, 0, 0.8745098, 1, 1,
0.03245316, -1.243769, 2.389451, 0, 0.8666667, 1, 1,
0.03416765, -0.4098978, 3.540024, 0, 0.8627451, 1, 1,
0.0357725, -0.2194751, 3.198894, 0, 0.854902, 1, 1,
0.04160776, -1.932873, 1.775287, 0, 0.8509804, 1, 1,
0.04211784, -1.667777, 3.399865, 0, 0.8431373, 1, 1,
0.04280994, 1.26502, -0.5553917, 0, 0.8392157, 1, 1,
0.0429486, 0.2674033, 0.04390193, 0, 0.8313726, 1, 1,
0.05142415, -1.106751, 2.397041, 0, 0.827451, 1, 1,
0.05216045, -0.7417036, 1.480599, 0, 0.8196079, 1, 1,
0.05265947, 0.323525, 0.6293046, 0, 0.8156863, 1, 1,
0.05639681, -0.7404127, 6.077763, 0, 0.8078431, 1, 1,
0.05662113, 0.4652786, -0.02080487, 0, 0.8039216, 1, 1,
0.05729899, 0.9636078, -0.06392439, 0, 0.7960784, 1, 1,
0.0610338, -0.2293141, 3.949905, 0, 0.7882353, 1, 1,
0.06448077, -0.5241745, 3.990982, 0, 0.7843137, 1, 1,
0.06573586, 0.6580365, 0.4869871, 0, 0.7764706, 1, 1,
0.06808928, -0.7200509, 4.877713, 0, 0.772549, 1, 1,
0.06810992, 0.005707759, 1.165217, 0, 0.7647059, 1, 1,
0.0681468, -0.3087554, 2.066064, 0, 0.7607843, 1, 1,
0.07358243, 0.2668593, -0.4464719, 0, 0.7529412, 1, 1,
0.07528082, -0.7645619, 3.170565, 0, 0.7490196, 1, 1,
0.07731863, 1.283068, 0.60917, 0, 0.7411765, 1, 1,
0.08011412, 0.4799633, -0.02187176, 0, 0.7372549, 1, 1,
0.08103929, -0.04211511, 4.432839, 0, 0.7294118, 1, 1,
0.08336625, 0.5203066, -0.1116966, 0, 0.7254902, 1, 1,
0.08447698, 0.954675, 0.2932739, 0, 0.7176471, 1, 1,
0.08468051, 0.9007573, -1.815973, 0, 0.7137255, 1, 1,
0.08500037, -0.007323159, 1.518882, 0, 0.7058824, 1, 1,
0.08767808, 0.07568882, -0.7419949, 0, 0.6980392, 1, 1,
0.1023911, 0.3258401, -1.317294, 0, 0.6941177, 1, 1,
0.1066002, 0.4568723, 1.687973, 0, 0.6862745, 1, 1,
0.1095931, -0.7648498, 2.657927, 0, 0.682353, 1, 1,
0.1128714, -2.227255, 3.494896, 0, 0.6745098, 1, 1,
0.1222666, 0.5747623, 0.8360481, 0, 0.6705883, 1, 1,
0.1294038, -0.9375418, 2.940032, 0, 0.6627451, 1, 1,
0.1314172, 0.6795418, 0.7208924, 0, 0.6588235, 1, 1,
0.1324202, -0.1055438, 2.021687, 0, 0.6509804, 1, 1,
0.135676, -0.7201855, 1.715335, 0, 0.6470588, 1, 1,
0.1364457, 0.4770482, 0.421477, 0, 0.6392157, 1, 1,
0.138149, -0.9464684, 2.772424, 0, 0.6352941, 1, 1,
0.1390688, 0.01236981, 0.8882931, 0, 0.627451, 1, 1,
0.1397155, 0.8905994, -1.113071, 0, 0.6235294, 1, 1,
0.1419069, 0.005999114, 0.6507556, 0, 0.6156863, 1, 1,
0.1437581, -1.162448, 2.375334, 0, 0.6117647, 1, 1,
0.1439521, 0.706373, -0.6951025, 0, 0.6039216, 1, 1,
0.1517041, -0.1877625, 3.096353, 0, 0.5960785, 1, 1,
0.1566048, -0.4239045, 2.937407, 0, 0.5921569, 1, 1,
0.1581992, 0.4957833, -0.3361973, 0, 0.5843138, 1, 1,
0.1602458, -1.043323, 2.763757, 0, 0.5803922, 1, 1,
0.1607928, 1.804608, 1.403259, 0, 0.572549, 1, 1,
0.1665873, -0.8545102, 2.077105, 0, 0.5686275, 1, 1,
0.1673662, -0.2899739, 0.3821575, 0, 0.5607843, 1, 1,
0.169707, -0.1702228, 2.697368, 0, 0.5568628, 1, 1,
0.1762416, 0.191895, 0.6396906, 0, 0.5490196, 1, 1,
0.1776219, 0.9333303, 0.3187853, 0, 0.5450981, 1, 1,
0.1842283, -0.4758473, 4.541505, 0, 0.5372549, 1, 1,
0.185048, 1.045429, 0.4271993, 0, 0.5333334, 1, 1,
0.186489, -0.1267314, 1.54892, 0, 0.5254902, 1, 1,
0.1872117, 0.02686237, 0.3222722, 0, 0.5215687, 1, 1,
0.2017007, 0.7212343, 0.3616981, 0, 0.5137255, 1, 1,
0.2059666, 1.131533, 1.274724, 0, 0.509804, 1, 1,
0.2096768, -0.3705557, 4.868659, 0, 0.5019608, 1, 1,
0.2146022, 1.858357, -0.596094, 0, 0.4941176, 1, 1,
0.2170513, -0.6172675, 1.733136, 0, 0.4901961, 1, 1,
0.2232346, 0.5589114, 0.1236789, 0, 0.4823529, 1, 1,
0.2392651, 0.4475817, 2.489545, 0, 0.4784314, 1, 1,
0.2420561, -0.4370401, 2.110923, 0, 0.4705882, 1, 1,
0.2509006, -0.5335701, 3.158945, 0, 0.4666667, 1, 1,
0.2518658, 0.8464546, 0.40597, 0, 0.4588235, 1, 1,
0.2545864, 0.9455981, 0.4475749, 0, 0.454902, 1, 1,
0.2551493, 0.9204482, 0.1416849, 0, 0.4470588, 1, 1,
0.2672729, -1.739779, 2.601434, 0, 0.4431373, 1, 1,
0.2687291, 1.058486, -0.1934978, 0, 0.4352941, 1, 1,
0.2698675, 0.5899963, 0.5355063, 0, 0.4313726, 1, 1,
0.2703666, -0.4395097, 2.668489, 0, 0.4235294, 1, 1,
0.2892158, -1.226154, 4.271138, 0, 0.4196078, 1, 1,
0.2902131, -0.8392953, 1.931611, 0, 0.4117647, 1, 1,
0.2906219, 0.3397917, -0.1992925, 0, 0.4078431, 1, 1,
0.2910048, -0.7259507, 3.009854, 0, 0.4, 1, 1,
0.2923577, -0.7937294, 2.777451, 0, 0.3921569, 1, 1,
0.2926372, -1.551904, 2.941778, 0, 0.3882353, 1, 1,
0.2962061, 2.160104, -0.5093827, 0, 0.3803922, 1, 1,
0.2963843, -0.5002004, 2.509042, 0, 0.3764706, 1, 1,
0.2987272, -0.6518658, 2.000911, 0, 0.3686275, 1, 1,
0.2990416, 0.7460828, -0.3777987, 0, 0.3647059, 1, 1,
0.301776, -1.105126, 4.063231, 0, 0.3568628, 1, 1,
0.3038962, -0.05984474, 2.540451, 0, 0.3529412, 1, 1,
0.306679, -1.078386, 4.291754, 0, 0.345098, 1, 1,
0.3103403, -0.7438557, 3.44674, 0, 0.3411765, 1, 1,
0.3117207, 0.3431726, 1.460857, 0, 0.3333333, 1, 1,
0.3123132, 1.115667, 0.1504876, 0, 0.3294118, 1, 1,
0.3139995, 0.1441463, 0.1455739, 0, 0.3215686, 1, 1,
0.3168567, 1.154672, 0.5444989, 0, 0.3176471, 1, 1,
0.3230192, 1.096569, 0.03232354, 0, 0.3098039, 1, 1,
0.3282295, 0.1533138, 2.433339, 0, 0.3058824, 1, 1,
0.3299206, 0.4523875, -0.4800388, 0, 0.2980392, 1, 1,
0.3310464, 0.3010914, 0.6278628, 0, 0.2901961, 1, 1,
0.3358299, -0.832509, 2.753746, 0, 0.2862745, 1, 1,
0.3361049, -0.678877, 1.657256, 0, 0.2784314, 1, 1,
0.3402749, 0.6673716, 1.71906, 0, 0.2745098, 1, 1,
0.3441175, 0.9042723, 0.3863596, 0, 0.2666667, 1, 1,
0.3452453, -1.316689, 2.524893, 0, 0.2627451, 1, 1,
0.3520269, 0.2721423, -0.2417458, 0, 0.254902, 1, 1,
0.3534527, -0.5778096, 2.636826, 0, 0.2509804, 1, 1,
0.3556873, -1.055548, 2.010378, 0, 0.2431373, 1, 1,
0.3581999, -2.040967, 3.71053, 0, 0.2392157, 1, 1,
0.3641384, 1.056802, 2.729255, 0, 0.2313726, 1, 1,
0.3678294, 1.168254, -0.4510485, 0, 0.227451, 1, 1,
0.3684245, -0.5689729, 2.659059, 0, 0.2196078, 1, 1,
0.3703388, -1.139863, 2.98387, 0, 0.2156863, 1, 1,
0.3733351, -0.1980679, 1.144759, 0, 0.2078431, 1, 1,
0.3746512, 0.01660639, 1.744288, 0, 0.2039216, 1, 1,
0.3754715, -1.751065, 2.93006, 0, 0.1960784, 1, 1,
0.3797474, -0.7999409, 2.825317, 0, 0.1882353, 1, 1,
0.3855382, -0.3775389, 2.266421, 0, 0.1843137, 1, 1,
0.3895791, -0.8239152, 3.205301, 0, 0.1764706, 1, 1,
0.3951922, -0.2378417, 0.3490488, 0, 0.172549, 1, 1,
0.3963082, -0.007551071, -0.213128, 0, 0.1647059, 1, 1,
0.3977033, -1.886371, 2.779846, 0, 0.1607843, 1, 1,
0.4022825, -0.5041002, 2.008288, 0, 0.1529412, 1, 1,
0.4029062, -0.6055855, 3.522962, 0, 0.1490196, 1, 1,
0.4052806, -2.357508, 3.087486, 0, 0.1411765, 1, 1,
0.4061028, -0.9076021, 2.297495, 0, 0.1372549, 1, 1,
0.4064601, -1.367052, 4.0035, 0, 0.1294118, 1, 1,
0.4080293, 0.1503171, 1.022149, 0, 0.1254902, 1, 1,
0.4095182, 1.78669, 0.830862, 0, 0.1176471, 1, 1,
0.4096046, 0.7926734, -0.7424057, 0, 0.1137255, 1, 1,
0.4121498, -0.3890171, 1.185861, 0, 0.1058824, 1, 1,
0.4131222, -0.6781198, 3.284051, 0, 0.09803922, 1, 1,
0.4149451, 0.1375516, -0.2759461, 0, 0.09411765, 1, 1,
0.4176469, -0.6183757, 2.018606, 0, 0.08627451, 1, 1,
0.4233893, -1.920783, 3.359121, 0, 0.08235294, 1, 1,
0.4289534, -1.91136, 3.686907, 0, 0.07450981, 1, 1,
0.4295288, 1.05033, 1.005009, 0, 0.07058824, 1, 1,
0.4299297, -0.3757333, 2.768619, 0, 0.0627451, 1, 1,
0.4299632, -0.08161806, 1.425465, 0, 0.05882353, 1, 1,
0.4442466, 0.1400847, 0.1922028, 0, 0.05098039, 1, 1,
0.4458665, 0.5977542, 0.7591951, 0, 0.04705882, 1, 1,
0.4465836, 0.9372831, 0.4468963, 0, 0.03921569, 1, 1,
0.4557565, -0.8987654, 2.828166, 0, 0.03529412, 1, 1,
0.4625983, -0.4358202, 1.68291, 0, 0.02745098, 1, 1,
0.4640399, -0.6590942, 3.444789, 0, 0.02352941, 1, 1,
0.4662351, -0.8362389, 1.830893, 0, 0.01568628, 1, 1,
0.4737064, -0.4877062, 1.76873, 0, 0.01176471, 1, 1,
0.47646, 0.1431688, 0.931127, 0, 0.003921569, 1, 1,
0.4768261, 0.3994338, 2.409486, 0.003921569, 0, 1, 1,
0.483337, 0.5646251, -0.7798094, 0.007843138, 0, 1, 1,
0.4949122, 0.561608, 0.4672082, 0.01568628, 0, 1, 1,
0.4979447, -0.358125, 3.69604, 0.01960784, 0, 1, 1,
0.498893, 0.7392277, 0.436701, 0.02745098, 0, 1, 1,
0.5009114, 1.181592, 0.4200785, 0.03137255, 0, 1, 1,
0.5129833, 0.2221441, 1.456241, 0.03921569, 0, 1, 1,
0.5137211, 1.355257, 0.6464227, 0.04313726, 0, 1, 1,
0.5176097, -0.6926498, 2.47309, 0.05098039, 0, 1, 1,
0.5221269, 0.883763, 0.9291149, 0.05490196, 0, 1, 1,
0.5226271, 0.8665995, -0.04334143, 0.0627451, 0, 1, 1,
0.5351055, -1.005138, 2.528143, 0.06666667, 0, 1, 1,
0.5357741, 1.379341, 1.312784, 0.07450981, 0, 1, 1,
0.5359426, -0.4005621, 0.2201266, 0.07843138, 0, 1, 1,
0.5374316, -0.9206364, 2.641487, 0.08627451, 0, 1, 1,
0.53843, 0.9509461, 1.575073, 0.09019608, 0, 1, 1,
0.5384356, -0.2395351, 2.324787, 0.09803922, 0, 1, 1,
0.542003, -1.137884, 4.084863, 0.1058824, 0, 1, 1,
0.5452972, -1.725656, 3.82951, 0.1098039, 0, 1, 1,
0.5453083, 0.2496382, 0.997831, 0.1176471, 0, 1, 1,
0.5478871, -0.3561655, 0.3714111, 0.1215686, 0, 1, 1,
0.5527495, 1.235005, 1.580054, 0.1294118, 0, 1, 1,
0.5553332, -1.77145, 2.355821, 0.1333333, 0, 1, 1,
0.5580839, 0.2788904, 2.099361, 0.1411765, 0, 1, 1,
0.5594353, 0.8162025, 1.196517, 0.145098, 0, 1, 1,
0.5607131, 1.444712, 0.4902357, 0.1529412, 0, 1, 1,
0.5608492, 0.9398076, 0.5035234, 0.1568628, 0, 1, 1,
0.5608734, 1.331133, 1.51002, 0.1647059, 0, 1, 1,
0.5609804, 0.5261809, 0.7570308, 0.1686275, 0, 1, 1,
0.5681128, 1.189334, 0.7634489, 0.1764706, 0, 1, 1,
0.5713294, 1.66277, 1.055725, 0.1803922, 0, 1, 1,
0.5815814, -0.7717792, 4.055164, 0.1882353, 0, 1, 1,
0.5817141, 0.2931151, 1.390164, 0.1921569, 0, 1, 1,
0.5827051, 0.05199445, 0.243968, 0.2, 0, 1, 1,
0.5834878, -0.8677384, 1.972934, 0.2078431, 0, 1, 1,
0.5838085, 0.5427642, 1.868689, 0.2117647, 0, 1, 1,
0.5888954, -0.4695999, 1.644602, 0.2196078, 0, 1, 1,
0.5890238, -1.181819, 3.195974, 0.2235294, 0, 1, 1,
0.5908768, 0.217899, 1.302756, 0.2313726, 0, 1, 1,
0.5928133, -0.1588551, 1.899073, 0.2352941, 0, 1, 1,
0.5936887, -0.9506077, 3.087516, 0.2431373, 0, 1, 1,
0.5969543, -0.2857211, 1.349211, 0.2470588, 0, 1, 1,
0.6000972, 0.2717393, 0.8044914, 0.254902, 0, 1, 1,
0.6013763, -0.4275752, 2.164821, 0.2588235, 0, 1, 1,
0.6043368, -2.005083, 3.351198, 0.2666667, 0, 1, 1,
0.6052356, -0.8417225, 3.477525, 0.2705882, 0, 1, 1,
0.6055288, 0.1268333, 1.760394, 0.2784314, 0, 1, 1,
0.6068923, 0.3237508, 0.1831603, 0.282353, 0, 1, 1,
0.6090998, 0.5976883, 1.821773, 0.2901961, 0, 1, 1,
0.622314, -0.445648, 1.451831, 0.2941177, 0, 1, 1,
0.6264513, -0.2639387, 1.602345, 0.3019608, 0, 1, 1,
0.6294463, 1.921222, 0.3156499, 0.3098039, 0, 1, 1,
0.6294515, 1.016192, 1.063529, 0.3137255, 0, 1, 1,
0.6320122, -0.1644652, 2.268632, 0.3215686, 0, 1, 1,
0.6324264, 0.01106078, 0.8351461, 0.3254902, 0, 1, 1,
0.6351069, -0.2185987, 2.525203, 0.3333333, 0, 1, 1,
0.6356381, 0.5325378, 2.04322, 0.3372549, 0, 1, 1,
0.645315, -0.2752201, 3.548295, 0.345098, 0, 1, 1,
0.6461007, 0.6128928, -1.134041, 0.3490196, 0, 1, 1,
0.6493933, 1.110884, 1.545074, 0.3568628, 0, 1, 1,
0.6548615, 0.8005538, 2.450104, 0.3607843, 0, 1, 1,
0.6557602, 1.398233, -0.3016034, 0.3686275, 0, 1, 1,
0.6639364, 0.03282534, 3.195371, 0.372549, 0, 1, 1,
0.6675696, -0.5776471, 2.621875, 0.3803922, 0, 1, 1,
0.6732289, 0.142955, 2.362714, 0.3843137, 0, 1, 1,
0.6762066, 0.8698232, 2.163267, 0.3921569, 0, 1, 1,
0.6814013, -1.501434, 0.8909454, 0.3960784, 0, 1, 1,
0.6845653, -1.494988, 4.006035, 0.4039216, 0, 1, 1,
0.6848062, 0.3579804, 1.605604, 0.4117647, 0, 1, 1,
0.6902511, -1.731242, 2.006202, 0.4156863, 0, 1, 1,
0.6976656, 0.05290931, 0.8498155, 0.4235294, 0, 1, 1,
0.69885, -1.955909, 2.877635, 0.427451, 0, 1, 1,
0.7005862, 0.1394242, -0.4589721, 0.4352941, 0, 1, 1,
0.7014055, 0.7888202, 1.088198, 0.4392157, 0, 1, 1,
0.7024187, 0.05515804, 1.098846, 0.4470588, 0, 1, 1,
0.7048414, -0.2134594, 2.448921, 0.4509804, 0, 1, 1,
0.7073137, -0.4626023, 2.236734, 0.4588235, 0, 1, 1,
0.708118, -0.5236518, 2.786591, 0.4627451, 0, 1, 1,
0.7093271, 0.6810434, 2.546898, 0.4705882, 0, 1, 1,
0.710309, 0.7190138, 0.9532408, 0.4745098, 0, 1, 1,
0.7139515, -1.111023, 3.173452, 0.4823529, 0, 1, 1,
0.7141777, 1.320834, -0.8957399, 0.4862745, 0, 1, 1,
0.7214639, -1.74102, 3.754543, 0.4941176, 0, 1, 1,
0.7226269, -0.2445388, 0.8417715, 0.5019608, 0, 1, 1,
0.7267637, 0.386427, 3.148911, 0.5058824, 0, 1, 1,
0.7269302, -0.315385, 1.752035, 0.5137255, 0, 1, 1,
0.7269466, 0.4054669, 0.690955, 0.5176471, 0, 1, 1,
0.7292473, 0.1213645, 1.595816, 0.5254902, 0, 1, 1,
0.7306082, -1.794039, 5.111858, 0.5294118, 0, 1, 1,
0.7317216, 2.209817, -0.6965799, 0.5372549, 0, 1, 1,
0.7325624, -0.1267806, 3.503024, 0.5411765, 0, 1, 1,
0.7346484, 0.6011903, 2.280933, 0.5490196, 0, 1, 1,
0.7397039, 0.2824874, -0.08242809, 0.5529412, 0, 1, 1,
0.7491615, -1.152821, 2.070499, 0.5607843, 0, 1, 1,
0.7554625, -1.788628, 2.097276, 0.5647059, 0, 1, 1,
0.7557563, -0.1336551, 1.387494, 0.572549, 0, 1, 1,
0.7598042, -0.3894662, 0.4494281, 0.5764706, 0, 1, 1,
0.7608469, 0.8882573, -1.14929, 0.5843138, 0, 1, 1,
0.765191, -0.8228645, 1.571198, 0.5882353, 0, 1, 1,
0.7720564, 0.4306714, -0.197066, 0.5960785, 0, 1, 1,
0.7760592, 0.7660973, 3.112612, 0.6039216, 0, 1, 1,
0.7767054, -1.405548, 3.296706, 0.6078432, 0, 1, 1,
0.776742, -0.3673051, 1.922561, 0.6156863, 0, 1, 1,
0.7798885, -1.073846, 3.993007, 0.6196079, 0, 1, 1,
0.7907649, -0.8119297, 1.35545, 0.627451, 0, 1, 1,
0.7948085, -0.3986, 0.5700454, 0.6313726, 0, 1, 1,
0.7955981, -0.537313, 0.4290996, 0.6392157, 0, 1, 1,
0.7957661, -1.442595, 0.9114925, 0.6431373, 0, 1, 1,
0.7987501, 0.2147224, 0.9519221, 0.6509804, 0, 1, 1,
0.8041188, -1.260614, 2.551553, 0.654902, 0, 1, 1,
0.8066173, -1.393601, 3.811349, 0.6627451, 0, 1, 1,
0.8086144, 0.7570875, 1.305794, 0.6666667, 0, 1, 1,
0.8093042, 0.6291625, -0.1828353, 0.6745098, 0, 1, 1,
0.8102928, 0.07442765, 0.4772823, 0.6784314, 0, 1, 1,
0.8104199, 0.4741632, 0.5259573, 0.6862745, 0, 1, 1,
0.8131448, 1.347706, 1.528338, 0.6901961, 0, 1, 1,
0.8136998, -0.4598676, 0.3518324, 0.6980392, 0, 1, 1,
0.8203496, 1.148556, 1.497162, 0.7058824, 0, 1, 1,
0.8207991, 0.3258806, 1.834143, 0.7098039, 0, 1, 1,
0.8240733, -0.1072122, -0.210748, 0.7176471, 0, 1, 1,
0.8242033, 0.9146212, -1.299206, 0.7215686, 0, 1, 1,
0.8260216, 0.4311859, 2.109736, 0.7294118, 0, 1, 1,
0.8274293, -0.6615341, 2.707622, 0.7333333, 0, 1, 1,
0.828258, -0.4244711, 1.472765, 0.7411765, 0, 1, 1,
0.8330233, 0.2497667, -1.731869, 0.7450981, 0, 1, 1,
0.8344736, -0.9324308, 3.569645, 0.7529412, 0, 1, 1,
0.8398588, 1.518161, 1.524873, 0.7568628, 0, 1, 1,
0.8446307, -1.0645, 2.241918, 0.7647059, 0, 1, 1,
0.846575, -1.093023, 1.949898, 0.7686275, 0, 1, 1,
0.8478222, 0.7657721, 0.6372658, 0.7764706, 0, 1, 1,
0.8603675, 0.3748057, 2.00426, 0.7803922, 0, 1, 1,
0.8643893, 0.1484474, -0.998068, 0.7882353, 0, 1, 1,
0.8680001, -1.283321, 2.850655, 0.7921569, 0, 1, 1,
0.8684908, 0.4021819, 0.7552059, 0.8, 0, 1, 1,
0.8687012, -0.8499747, 2.062777, 0.8078431, 0, 1, 1,
0.8702536, -1.306117, 3.34902, 0.8117647, 0, 1, 1,
0.8704918, -0.006223282, 1.258781, 0.8196079, 0, 1, 1,
0.8711131, 1.021932, 1.402274, 0.8235294, 0, 1, 1,
0.8766052, 0.1298317, 2.141551, 0.8313726, 0, 1, 1,
0.87936, -0.423093, 2.081138, 0.8352941, 0, 1, 1,
0.8807625, 2.060363, -0.625039, 0.8431373, 0, 1, 1,
0.8823234, 1.932688, -0.3419662, 0.8470588, 0, 1, 1,
0.8888972, 0.08732545, 3.316265, 0.854902, 0, 1, 1,
0.8910179, -0.8138544, 4.969066, 0.8588235, 0, 1, 1,
0.8953293, -0.6615033, 2.716473, 0.8666667, 0, 1, 1,
0.8969862, 0.5380739, 1.652816, 0.8705882, 0, 1, 1,
0.8998871, 1.175847, 1.978849, 0.8784314, 0, 1, 1,
0.9021235, -0.3872402, 0.5985518, 0.8823529, 0, 1, 1,
0.902739, 1.411512, 1.458426, 0.8901961, 0, 1, 1,
0.9053973, -0.582911, 1.399829, 0.8941177, 0, 1, 1,
0.9084252, -1.239439, 1.636163, 0.9019608, 0, 1, 1,
0.9297316, -0.08697111, 2.16578, 0.9098039, 0, 1, 1,
0.9336683, -0.631819, 3.69954, 0.9137255, 0, 1, 1,
0.9364843, 0.1820054, 1.578361, 0.9215686, 0, 1, 1,
0.9423656, -0.4298735, 2.061762, 0.9254902, 0, 1, 1,
0.9434549, -1.774801, 2.608382, 0.9333333, 0, 1, 1,
0.9440526, -0.5683247, 1.922566, 0.9372549, 0, 1, 1,
0.9454936, 0.06611727, 0.9935295, 0.945098, 0, 1, 1,
0.947975, -0.9650193, 1.645152, 0.9490196, 0, 1, 1,
0.9540687, -0.1993939, 1.663081, 0.9568627, 0, 1, 1,
0.9549464, 0.29907, 2.017734, 0.9607843, 0, 1, 1,
0.9553899, -1.927937, 3.907946, 0.9686275, 0, 1, 1,
0.9558734, -0.8165444, 0.742573, 0.972549, 0, 1, 1,
0.9601423, -1.106188, 2.657993, 0.9803922, 0, 1, 1,
0.9623023, -0.9535435, 1.915938, 0.9843137, 0, 1, 1,
0.9627119, 1.691944, -0.4781367, 0.9921569, 0, 1, 1,
0.9629021, 0.27425, 1.787847, 0.9960784, 0, 1, 1,
0.9754559, -1.347799, 2.160412, 1, 0, 0.9960784, 1,
0.9834176, 0.8151771, 1.394529, 1, 0, 0.9882353, 1,
0.9839333, -1.595752, 3.302015, 1, 0, 0.9843137, 1,
0.9904835, 0.03787803, 1.59866, 1, 0, 0.9764706, 1,
0.9924523, 0.1321226, 1.678468, 1, 0, 0.972549, 1,
0.9928166, -1.171824, 1.991769, 1, 0, 0.9647059, 1,
0.994444, 0.4268685, 0.8505038, 1, 0, 0.9607843, 1,
0.9976742, -1.135855, 2.254576, 1, 0, 0.9529412, 1,
0.9977472, -0.4060573, 1.115234, 1, 0, 0.9490196, 1,
0.9992492, 0.03242924, 1.625508, 1, 0, 0.9411765, 1,
0.9997588, 0.2544611, -0.09221429, 1, 0, 0.9372549, 1,
1.003857, 1.263883, 1.643958, 1, 0, 0.9294118, 1,
1.007859, 0.9951361, 0.7910133, 1, 0, 0.9254902, 1,
1.020317, -0.4396923, 1.449364, 1, 0, 0.9176471, 1,
1.028585, 0.3749408, 0.9265306, 1, 0, 0.9137255, 1,
1.02926, -1.196373, 3.563858, 1, 0, 0.9058824, 1,
1.036018, -0.7498513, 2.027903, 1, 0, 0.9019608, 1,
1.043413, 0.7079722, 0.01743354, 1, 0, 0.8941177, 1,
1.050657, -1.330666, 1.250402, 1, 0, 0.8862745, 1,
1.05173, -1.042288, 2.33728, 1, 0, 0.8823529, 1,
1.05259, 1.320763, 1.40724, 1, 0, 0.8745098, 1,
1.060587, 1.391221, 2.053379, 1, 0, 0.8705882, 1,
1.06603, -1.030199, 1.949022, 1, 0, 0.8627451, 1,
1.06829, -0.2241485, 1.797287, 1, 0, 0.8588235, 1,
1.070495, 1.030801, 1.216621, 1, 0, 0.8509804, 1,
1.071779, 1.30142, -1.390144, 1, 0, 0.8470588, 1,
1.072524, -0.5981366, 3.441326, 1, 0, 0.8392157, 1,
1.075408, -1.92005, 1.293219, 1, 0, 0.8352941, 1,
1.076036, 0.08651872, 1.742618, 1, 0, 0.827451, 1,
1.085956, 0.5889499, 2.030662, 1, 0, 0.8235294, 1,
1.086027, 0.9796591, 1.042506, 1, 0, 0.8156863, 1,
1.091801, 0.894586, 0.223463, 1, 0, 0.8117647, 1,
1.094033, -1.454211, 4.210578, 1, 0, 0.8039216, 1,
1.095291, 0.529086, -0.05569431, 1, 0, 0.7960784, 1,
1.101693, 0.7762352, 0.5301037, 1, 0, 0.7921569, 1,
1.103292, -0.582302, 2.209753, 1, 0, 0.7843137, 1,
1.105563, -1.25797, 2.409117, 1, 0, 0.7803922, 1,
1.113232, -1.090885, 0.3588528, 1, 0, 0.772549, 1,
1.116086, -1.458233, 2.791802, 1, 0, 0.7686275, 1,
1.128375, 0.1181486, 1.338557, 1, 0, 0.7607843, 1,
1.12923, -0.5606925, 2.507695, 1, 0, 0.7568628, 1,
1.130594, 0.7908446, 0.8456046, 1, 0, 0.7490196, 1,
1.143079, -0.1079418, 2.525699, 1, 0, 0.7450981, 1,
1.143532, 1.425462, 0.2236618, 1, 0, 0.7372549, 1,
1.14497, -0.06985477, 0.06924938, 1, 0, 0.7333333, 1,
1.14652, 0.0558559, 2.047816, 1, 0, 0.7254902, 1,
1.149052, -0.6541869, 1.715261, 1, 0, 0.7215686, 1,
1.158052, 0.5313827, -0.6524586, 1, 0, 0.7137255, 1,
1.158545, -0.6996694, 2.817977, 1, 0, 0.7098039, 1,
1.164228, -1.791376, 3.039067, 1, 0, 0.7019608, 1,
1.16982, 0.8164354, 2.669406, 1, 0, 0.6941177, 1,
1.171737, -0.01815841, 0.02696177, 1, 0, 0.6901961, 1,
1.179072, 0.4211862, 0.7947929, 1, 0, 0.682353, 1,
1.181503, 1.500188, 1.866626, 1, 0, 0.6784314, 1,
1.182408, 1.502196, 0.9078476, 1, 0, 0.6705883, 1,
1.185601, -0.7624156, 2.073932, 1, 0, 0.6666667, 1,
1.186266, 0.2060454, 1.919742, 1, 0, 0.6588235, 1,
1.189434, 0.4707094, 0.9121385, 1, 0, 0.654902, 1,
1.193137, 0.06536925, 2.137993, 1, 0, 0.6470588, 1,
1.19489, 0.7195421, 1.265465, 1, 0, 0.6431373, 1,
1.199144, -0.3261234, 0.3541389, 1, 0, 0.6352941, 1,
1.211646, -0.7125798, 2.912, 1, 0, 0.6313726, 1,
1.213064, -1.103662, 3.489394, 1, 0, 0.6235294, 1,
1.221499, -1.18494, 2.472184, 1, 0, 0.6196079, 1,
1.247923, 0.4851227, 1.762402, 1, 0, 0.6117647, 1,
1.250673, -0.5879914, 1.903306, 1, 0, 0.6078432, 1,
1.251082, -1.400962, 2.573217, 1, 0, 0.6, 1,
1.251765, -1.254781, 2.093273, 1, 0, 0.5921569, 1,
1.252519, 0.2981426, 0.7203517, 1, 0, 0.5882353, 1,
1.253827, 0.7501309, -0.3741456, 1, 0, 0.5803922, 1,
1.255299, -0.6676956, 2.820697, 1, 0, 0.5764706, 1,
1.259381, 0.130358, 2.74895, 1, 0, 0.5686275, 1,
1.26335, -0.2708713, 1.214596, 1, 0, 0.5647059, 1,
1.267147, -0.4312057, 2.175638, 1, 0, 0.5568628, 1,
1.278388, -0.274151, 0.355145, 1, 0, 0.5529412, 1,
1.283586, -0.5948148, 1.458755, 1, 0, 0.5450981, 1,
1.287981, 1.025112, -0.4159059, 1, 0, 0.5411765, 1,
1.29653, 0.9727283, 2.160838, 1, 0, 0.5333334, 1,
1.29795, 0.8670718, -0.1765852, 1, 0, 0.5294118, 1,
1.303139, 0.2553931, 1.83801, 1, 0, 0.5215687, 1,
1.310856, 0.1020491, 1.05903, 1, 0, 0.5176471, 1,
1.311671, -1.407884, 2.647997, 1, 0, 0.509804, 1,
1.317085, 0.7840077, -1.01974, 1, 0, 0.5058824, 1,
1.319442, -0.4444528, 2.494842, 1, 0, 0.4980392, 1,
1.320723, 0.3126751, 0.6575357, 1, 0, 0.4901961, 1,
1.321988, -0.6491047, 1.962776, 1, 0, 0.4862745, 1,
1.327726, -0.4480155, 2.14603, 1, 0, 0.4784314, 1,
1.328529, -1.731892, 0.5862205, 1, 0, 0.4745098, 1,
1.329767, -0.7940012, 1.060181, 1, 0, 0.4666667, 1,
1.336701, -0.6796947, 2.20817, 1, 0, 0.4627451, 1,
1.343248, -0.3759084, 2.744316, 1, 0, 0.454902, 1,
1.345488, -1.179354, 2.076039, 1, 0, 0.4509804, 1,
1.357604, -0.617402, 3.29383, 1, 0, 0.4431373, 1,
1.36265, 0.2681891, -0.2718461, 1, 0, 0.4392157, 1,
1.373838, 0.355339, 2.696226, 1, 0, 0.4313726, 1,
1.39285, 1.171679, 1.739814, 1, 0, 0.427451, 1,
1.394439, -0.2840143, 0.7543257, 1, 0, 0.4196078, 1,
1.396853, -0.8224279, 1.45856, 1, 0, 0.4156863, 1,
1.397741, -0.971872, 3.24047, 1, 0, 0.4078431, 1,
1.409259, 0.6584877, 0.5269465, 1, 0, 0.4039216, 1,
1.409437, 1.591061, -0.1080508, 1, 0, 0.3960784, 1,
1.418256, -0.4316717, 0.9310548, 1, 0, 0.3882353, 1,
1.434626, -1.289049, 2.598191, 1, 0, 0.3843137, 1,
1.443821, -0.205055, 1.548225, 1, 0, 0.3764706, 1,
1.447375, 0.7079628, 0.1484077, 1, 0, 0.372549, 1,
1.47085, 1.019114, 0.6884404, 1, 0, 0.3647059, 1,
1.477963, 1.525263, 1.70598, 1, 0, 0.3607843, 1,
1.479837, -1.609826, 1.757043, 1, 0, 0.3529412, 1,
1.498558, -0.6074592, 3.054738, 1, 0, 0.3490196, 1,
1.514972, -1.322046, 1.664828, 1, 0, 0.3411765, 1,
1.525186, 0.8951079, 1.21884, 1, 0, 0.3372549, 1,
1.53684, -0.5612802, 2.597193, 1, 0, 0.3294118, 1,
1.546606, -1.886971, 2.828909, 1, 0, 0.3254902, 1,
1.555983, -0.2411423, 2.603456, 1, 0, 0.3176471, 1,
1.573268, -0.01036552, 1.516352, 1, 0, 0.3137255, 1,
1.58087, 0.4643883, 0.1335409, 1, 0, 0.3058824, 1,
1.586352, -0.2778874, 0.3483145, 1, 0, 0.2980392, 1,
1.614094, 0.1750616, -0.706008, 1, 0, 0.2941177, 1,
1.624804, 0.2212604, 0.7647098, 1, 0, 0.2862745, 1,
1.625088, 0.8350713, -0.7564266, 1, 0, 0.282353, 1,
1.63988, 0.2541931, 2.125273, 1, 0, 0.2745098, 1,
1.656415, 0.9265949, 2.102896, 1, 0, 0.2705882, 1,
1.658101, 0.3193267, 2.404989, 1, 0, 0.2627451, 1,
1.665112, 1.336996, 1.674765, 1, 0, 0.2588235, 1,
1.712682, 0.5679211, 0.4532462, 1, 0, 0.2509804, 1,
1.71909, -0.1335848, -0.3856875, 1, 0, 0.2470588, 1,
1.733924, -0.4689181, 2.18653, 1, 0, 0.2392157, 1,
1.759444, -0.9825099, 2.660609, 1, 0, 0.2352941, 1,
1.761722, 1.585653, 1.765335, 1, 0, 0.227451, 1,
1.781466, 2.146222, 0.4081916, 1, 0, 0.2235294, 1,
1.794236, 1.411183, 1.291015, 1, 0, 0.2156863, 1,
1.794358, -1.809726, 3.029991, 1, 0, 0.2117647, 1,
1.799467, -0.3718187, 1.020422, 1, 0, 0.2039216, 1,
1.804824, 1.264814, 0.3818707, 1, 0, 0.1960784, 1,
1.813558, -0.6946647, 0.130326, 1, 0, 0.1921569, 1,
1.813882, -0.9129023, 2.085259, 1, 0, 0.1843137, 1,
1.823129, -0.5319039, 1.089581, 1, 0, 0.1803922, 1,
1.8322, -1.633035, 3.188848, 1, 0, 0.172549, 1,
1.840711, -0.8686123, 2.530594, 1, 0, 0.1686275, 1,
1.86365, -0.2435365, 2.085677, 1, 0, 0.1607843, 1,
1.87221, -0.6928918, 0.9538175, 1, 0, 0.1568628, 1,
1.898212, -2.852455, 2.858791, 1, 0, 0.1490196, 1,
1.925114, 0.1521004, 0.6556483, 1, 0, 0.145098, 1,
1.939075, -0.5985129, 1.411673, 1, 0, 0.1372549, 1,
1.949049, -0.9742939, 2.218374, 1, 0, 0.1333333, 1,
1.96986, 0.4520304, 1.28229, 1, 0, 0.1254902, 1,
1.97643, -2.412959, 2.60373, 1, 0, 0.1215686, 1,
1.993721, -0.8086818, 1.097863, 1, 0, 0.1137255, 1,
2.01983, 0.210332, 0.7555619, 1, 0, 0.1098039, 1,
2.063522, 0.7651214, 1.236298, 1, 0, 0.1019608, 1,
2.103263, 1.024616, 2.075901, 1, 0, 0.09411765, 1,
2.165848, -0.4365982, 1.845283, 1, 0, 0.09019608, 1,
2.191839, 0.6058648, 2.168652, 1, 0, 0.08235294, 1,
2.226468, 0.4058899, 2.527861, 1, 0, 0.07843138, 1,
2.227999, 0.2951574, 1.966949, 1, 0, 0.07058824, 1,
2.264606, 0.65763, 0.7197402, 1, 0, 0.06666667, 1,
2.280361, 0.7199926, 1.893829, 1, 0, 0.05882353, 1,
2.282023, -2.218357, 2.124598, 1, 0, 0.05490196, 1,
2.298433, 0.7642978, 2.530897, 1, 0, 0.04705882, 1,
2.48909, -1.037235, 0.9607273, 1, 0, 0.04313726, 1,
2.677899, 0.2665049, 3.067213, 1, 0, 0.03529412, 1,
2.862961, -1.94482, 1.842727, 1, 0, 0.03137255, 1,
2.975922, 0.5863961, 0.3093306, 1, 0, 0.02352941, 1,
3.024073, -0.4862672, 1.435989, 1, 0, 0.01960784, 1,
3.070605, -0.9630232, 2.154984, 1, 0, 0.01176471, 1,
3.622725, -0.7377877, 3.079405, 1, 0, 0.007843138, 1
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
-0.004808068, -3.910978, -7.758798, 0, -0.5, 0.5, 0.5,
-0.004808068, -3.910978, -7.758798, 1, -0.5, 0.5, 0.5,
-0.004808068, -3.910978, -7.758798, 1, 1.5, 0.5, 0.5,
-0.004808068, -3.910978, -7.758798, 0, 1.5, 0.5, 0.5
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
-4.862074, 0.2700312, -7.758798, 0, -0.5, 0.5, 0.5,
-4.862074, 0.2700312, -7.758798, 1, -0.5, 0.5, 0.5,
-4.862074, 0.2700312, -7.758798, 1, 1.5, 0.5, 0.5,
-4.862074, 0.2700312, -7.758798, 0, 1.5, 0.5, 0.5
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
-4.862074, -3.910978, 0.1621745, 0, -0.5, 0.5, 0.5,
-4.862074, -3.910978, 0.1621745, 1, -0.5, 0.5, 0.5,
-4.862074, -3.910978, 0.1621745, 1, 1.5, 0.5, 0.5,
-4.862074, -3.910978, 0.1621745, 0, 1.5, 0.5, 0.5
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
-2, -2.94613, -5.930882,
2, -2.94613, -5.930882,
-2, -2.94613, -5.930882,
-2, -3.106938, -6.235534,
0, -2.94613, -5.930882,
0, -3.106938, -6.235534,
2, -2.94613, -5.930882,
2, -3.106938, -6.235534
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
"0",
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
-2, -3.428554, -6.84484, 0, -0.5, 0.5, 0.5,
-2, -3.428554, -6.84484, 1, -0.5, 0.5, 0.5,
-2, -3.428554, -6.84484, 1, 1.5, 0.5, 0.5,
-2, -3.428554, -6.84484, 0, 1.5, 0.5, 0.5,
0, -3.428554, -6.84484, 0, -0.5, 0.5, 0.5,
0, -3.428554, -6.84484, 1, -0.5, 0.5, 0.5,
0, -3.428554, -6.84484, 1, 1.5, 0.5, 0.5,
0, -3.428554, -6.84484, 0, 1.5, 0.5, 0.5,
2, -3.428554, -6.84484, 0, -0.5, 0.5, 0.5,
2, -3.428554, -6.84484, 1, -0.5, 0.5, 0.5,
2, -3.428554, -6.84484, 1, 1.5, 0.5, 0.5,
2, -3.428554, -6.84484, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.741167, -2, -5.930882,
-3.741167, 3, -5.930882,
-3.741167, -2, -5.930882,
-3.927985, -2, -6.235534,
-3.741167, -1, -5.930882,
-3.927985, -1, -6.235534,
-3.741167, 0, -5.930882,
-3.927985, 0, -6.235534,
-3.741167, 1, -5.930882,
-3.927985, 1, -6.235534,
-3.741167, 2, -5.930882,
-3.927985, 2, -6.235534,
-3.741167, 3, -5.930882,
-3.927985, 3, -6.235534
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
-4.30162, -2, -6.84484, 0, -0.5, 0.5, 0.5,
-4.30162, -2, -6.84484, 1, -0.5, 0.5, 0.5,
-4.30162, -2, -6.84484, 1, 1.5, 0.5, 0.5,
-4.30162, -2, -6.84484, 0, 1.5, 0.5, 0.5,
-4.30162, -1, -6.84484, 0, -0.5, 0.5, 0.5,
-4.30162, -1, -6.84484, 1, -0.5, 0.5, 0.5,
-4.30162, -1, -6.84484, 1, 1.5, 0.5, 0.5,
-4.30162, -1, -6.84484, 0, 1.5, 0.5, 0.5,
-4.30162, 0, -6.84484, 0, -0.5, 0.5, 0.5,
-4.30162, 0, -6.84484, 1, -0.5, 0.5, 0.5,
-4.30162, 0, -6.84484, 1, 1.5, 0.5, 0.5,
-4.30162, 0, -6.84484, 0, 1.5, 0.5, 0.5,
-4.30162, 1, -6.84484, 0, -0.5, 0.5, 0.5,
-4.30162, 1, -6.84484, 1, -0.5, 0.5, 0.5,
-4.30162, 1, -6.84484, 1, 1.5, 0.5, 0.5,
-4.30162, 1, -6.84484, 0, 1.5, 0.5, 0.5,
-4.30162, 2, -6.84484, 0, -0.5, 0.5, 0.5,
-4.30162, 2, -6.84484, 1, -0.5, 0.5, 0.5,
-4.30162, 2, -6.84484, 1, 1.5, 0.5, 0.5,
-4.30162, 2, -6.84484, 0, 1.5, 0.5, 0.5,
-4.30162, 3, -6.84484, 0, -0.5, 0.5, 0.5,
-4.30162, 3, -6.84484, 1, -0.5, 0.5, 0.5,
-4.30162, 3, -6.84484, 1, 1.5, 0.5, 0.5,
-4.30162, 3, -6.84484, 0, 1.5, 0.5, 0.5
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
-3.741167, -2.94613, -4,
-3.741167, -2.94613, 6,
-3.741167, -2.94613, -4,
-3.927985, -3.106938, -4,
-3.741167, -2.94613, -2,
-3.927985, -3.106938, -2,
-3.741167, -2.94613, 0,
-3.927985, -3.106938, 0,
-3.741167, -2.94613, 2,
-3.927985, -3.106938, 2,
-3.741167, -2.94613, 4,
-3.927985, -3.106938, 4,
-3.741167, -2.94613, 6,
-3.927985, -3.106938, 6
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
"4",
"6"
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
-4.30162, -3.428554, -4, 0, -0.5, 0.5, 0.5,
-4.30162, -3.428554, -4, 1, -0.5, 0.5, 0.5,
-4.30162, -3.428554, -4, 1, 1.5, 0.5, 0.5,
-4.30162, -3.428554, -4, 0, 1.5, 0.5, 0.5,
-4.30162, -3.428554, -2, 0, -0.5, 0.5, 0.5,
-4.30162, -3.428554, -2, 1, -0.5, 0.5, 0.5,
-4.30162, -3.428554, -2, 1, 1.5, 0.5, 0.5,
-4.30162, -3.428554, -2, 0, 1.5, 0.5, 0.5,
-4.30162, -3.428554, 0, 0, -0.5, 0.5, 0.5,
-4.30162, -3.428554, 0, 1, -0.5, 0.5, 0.5,
-4.30162, -3.428554, 0, 1, 1.5, 0.5, 0.5,
-4.30162, -3.428554, 0, 0, 1.5, 0.5, 0.5,
-4.30162, -3.428554, 2, 0, -0.5, 0.5, 0.5,
-4.30162, -3.428554, 2, 1, -0.5, 0.5, 0.5,
-4.30162, -3.428554, 2, 1, 1.5, 0.5, 0.5,
-4.30162, -3.428554, 2, 0, 1.5, 0.5, 0.5,
-4.30162, -3.428554, 4, 0, -0.5, 0.5, 0.5,
-4.30162, -3.428554, 4, 1, -0.5, 0.5, 0.5,
-4.30162, -3.428554, 4, 1, 1.5, 0.5, 0.5,
-4.30162, -3.428554, 4, 0, 1.5, 0.5, 0.5,
-4.30162, -3.428554, 6, 0, -0.5, 0.5, 0.5,
-4.30162, -3.428554, 6, 1, -0.5, 0.5, 0.5,
-4.30162, -3.428554, 6, 1, 1.5, 0.5, 0.5,
-4.30162, -3.428554, 6, 0, 1.5, 0.5, 0.5
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
-3.741167, -2.94613, -5.930882,
-3.741167, 3.486192, -5.930882,
-3.741167, -2.94613, 6.25523,
-3.741167, 3.486192, 6.25523,
-3.741167, -2.94613, -5.930882,
-3.741167, -2.94613, 6.25523,
-3.741167, 3.486192, -5.930882,
-3.741167, 3.486192, 6.25523,
-3.741167, -2.94613, -5.930882,
3.731551, -2.94613, -5.930882,
-3.741167, -2.94613, 6.25523,
3.731551, -2.94613, 6.25523,
-3.741167, 3.486192, -5.930882,
3.731551, 3.486192, -5.930882,
-3.741167, 3.486192, 6.25523,
3.731551, 3.486192, 6.25523,
3.731551, -2.94613, -5.930882,
3.731551, 3.486192, -5.930882,
3.731551, -2.94613, 6.25523,
3.731551, 3.486192, 6.25523,
3.731551, -2.94613, -5.930882,
3.731551, -2.94613, 6.25523,
3.731551, 3.486192, -5.930882,
3.731551, 3.486192, 6.25523
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
var radius = 8.37035;
var distance = 37.24063;
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
mvMatrix.translate( 0.004808068, -0.2700312, -0.1621745 );
mvMatrix.scale( 1.211097, 1.406986, 0.742664 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.24063);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Carbazide<-read.table("Carbazide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Carbazide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Carbazide' not found
```

```r
y<-Carbazide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Carbazide' not found
```

```r
z<-Carbazide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Carbazide' not found
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
-3.632341, -0.3864974, -3.997977, 0, 0, 1, 1, 1,
-3.20188, -1.349385, -2.297258, 1, 0, 0, 1, 1,
-2.881872, -0.6129238, -1.541428, 1, 0, 0, 1, 1,
-2.854528, -0.3683291, -1.385597, 1, 0, 0, 1, 1,
-2.787745, -1.276491, -2.860731, 1, 0, 0, 1, 1,
-2.77907, -0.3694892, -2.770683, 1, 0, 0, 1, 1,
-2.752267, 0.1789614, -2.556013, 0, 0, 0, 1, 1,
-2.627955, 0.6645862, -1.397678, 0, 0, 0, 1, 1,
-2.604254, -0.3901944, -2.544682, 0, 0, 0, 1, 1,
-2.535308, -2.132983, -1.695802, 0, 0, 0, 1, 1,
-2.531091, -0.1016139, -2.076905, 0, 0, 0, 1, 1,
-2.439267, -0.02316126, -1.274882, 0, 0, 0, 1, 1,
-2.262638, 0.1375791, -0.527274, 0, 0, 0, 1, 1,
-2.192863, -0.7617519, -2.227063, 1, 1, 1, 1, 1,
-2.151768, -0.8142629, -1.416037, 1, 1, 1, 1, 1,
-2.12014, -0.1411834, -1.859585, 1, 1, 1, 1, 1,
-2.10815, -0.8811843, -0.5191025, 1, 1, 1, 1, 1,
-2.085024, -1.484286, -1.638877, 1, 1, 1, 1, 1,
-2.06502, 1.628073, -1.558358, 1, 1, 1, 1, 1,
-1.981746, -1.173775, -2.218741, 1, 1, 1, 1, 1,
-1.975288, -0.5441939, -1.851819, 1, 1, 1, 1, 1,
-1.957253, -0.03372734, -1.07139, 1, 1, 1, 1, 1,
-1.950147, -0.7445704, -3.450231, 1, 1, 1, 1, 1,
-1.936196, -0.8638147, -1.492156, 1, 1, 1, 1, 1,
-1.91708, -0.4322862, -1.762299, 1, 1, 1, 1, 1,
-1.915594, -0.5983248, -3.655758, 1, 1, 1, 1, 1,
-1.91237, -1.727736, -4.62113, 1, 1, 1, 1, 1,
-1.911418, -0.08242179, -1.160142, 1, 1, 1, 1, 1,
-1.90012, 0.2180354, -1.920386, 0, 0, 1, 1, 1,
-1.896988, 0.386326, -1.042381, 1, 0, 0, 1, 1,
-1.844168, 0.588304, -1.913879, 1, 0, 0, 1, 1,
-1.813465, -1.486818, -2.741713, 1, 0, 0, 1, 1,
-1.804793, -2.363219, -2.669433, 1, 0, 0, 1, 1,
-1.803648, 1.249615, -0.1844225, 1, 0, 0, 1, 1,
-1.803419, -0.1862912, -1.165203, 0, 0, 0, 1, 1,
-1.798617, 0.002432087, -4.192725, 0, 0, 0, 1, 1,
-1.785069, 0.9353782, 0.8276224, 0, 0, 0, 1, 1,
-1.780303, 0.4266419, -1.4379, 0, 0, 0, 1, 1,
-1.774213, 0.9255321, -1.879161, 0, 0, 0, 1, 1,
-1.772546, -0.7572852, -1.235268, 0, 0, 0, 1, 1,
-1.77048, -1.762184, 0.2861336, 0, 0, 0, 1, 1,
-1.770475, 1.022426, -1.483018, 1, 1, 1, 1, 1,
-1.757174, -1.266605, -2.755549, 1, 1, 1, 1, 1,
-1.718213, 0.07057401, -1.02653, 1, 1, 1, 1, 1,
-1.712082, 0.8433353, 1.432514, 1, 1, 1, 1, 1,
-1.685775, -1.037437, -0.09584922, 1, 1, 1, 1, 1,
-1.679777, 0.3627716, 0.00766604, 1, 1, 1, 1, 1,
-1.676325, 0.6781955, -0.4021977, 1, 1, 1, 1, 1,
-1.665974, -0.2411757, -1.432731, 1, 1, 1, 1, 1,
-1.642401, 0.8450917, -0.8130314, 1, 1, 1, 1, 1,
-1.612683, -0.5977095, -2.106186, 1, 1, 1, 1, 1,
-1.607035, -0.8232942, -1.264936, 1, 1, 1, 1, 1,
-1.597785, -0.5609083, -1.726209, 1, 1, 1, 1, 1,
-1.595789, -0.6459178, -1.401388, 1, 1, 1, 1, 1,
-1.592954, -1.589333, -1.269373, 1, 1, 1, 1, 1,
-1.589299, -1.270402, -3.034383, 1, 1, 1, 1, 1,
-1.583287, -0.4959493, -2.207972, 0, 0, 1, 1, 1,
-1.577048, -0.3971108, -0.7746745, 1, 0, 0, 1, 1,
-1.566735, -1.090213, -3.872037, 1, 0, 0, 1, 1,
-1.559447, 0.9238601, -0.9495703, 1, 0, 0, 1, 1,
-1.548205, -0.8017471, -1.31357, 1, 0, 0, 1, 1,
-1.53907, -0.8943882, -1.857146, 1, 0, 0, 1, 1,
-1.537816, 1.238993, -1.394536, 0, 0, 0, 1, 1,
-1.523805, -1.388565, -2.307996, 0, 0, 0, 1, 1,
-1.522463, 1.550235, -0.7590283, 0, 0, 0, 1, 1,
-1.49848, 1.231908, -1.831811, 0, 0, 0, 1, 1,
-1.493082, -0.629065, -1.494601, 0, 0, 0, 1, 1,
-1.491065, -1.146222, -1.207211, 0, 0, 0, 1, 1,
-1.486362, 1.158095, -2.381935, 0, 0, 0, 1, 1,
-1.486127, -0.1666397, -1.621929, 1, 1, 1, 1, 1,
-1.481434, -0.5210325, -3.405858, 1, 1, 1, 1, 1,
-1.470389, 1.863426, -1.533066, 1, 1, 1, 1, 1,
-1.464594, 1.727942, -1.089502, 1, 1, 1, 1, 1,
-1.448757, -1.504797, -2.845731, 1, 1, 1, 1, 1,
-1.442144, -2.04323, -1.956132, 1, 1, 1, 1, 1,
-1.431621, 1.209835, -0.7490572, 1, 1, 1, 1, 1,
-1.423432, 0.8544407, 0.6591749, 1, 1, 1, 1, 1,
-1.418694, -0.1343043, -0.6224062, 1, 1, 1, 1, 1,
-1.416448, -0.5821673, -2.688127, 1, 1, 1, 1, 1,
-1.414598, -0.7390465, -2.512341, 1, 1, 1, 1, 1,
-1.410347, -0.3318759, -2.803834, 1, 1, 1, 1, 1,
-1.394072, -0.5094401, -1.791318, 1, 1, 1, 1, 1,
-1.385587, 2.272246, -0.5221153, 1, 1, 1, 1, 1,
-1.385259, -0.2679968, -1.724423, 1, 1, 1, 1, 1,
-1.385107, -0.5333541, -1.351732, 0, 0, 1, 1, 1,
-1.381088, 0.04618278, -1.501217, 1, 0, 0, 1, 1,
-1.378634, 1.054598, -2.398067, 1, 0, 0, 1, 1,
-1.374736, 1.169383, -0.566731, 1, 0, 0, 1, 1,
-1.364914, -0.05561042, -3.332329, 1, 0, 0, 1, 1,
-1.361551, 0.2235099, -3.02163, 1, 0, 0, 1, 1,
-1.359547, 0.6249605, -0.5397859, 0, 0, 0, 1, 1,
-1.353855, -0.07541554, -2.548185, 0, 0, 0, 1, 1,
-1.343266, 0.4139775, -2.485052, 0, 0, 0, 1, 1,
-1.34306, -0.6604111, -0.6222789, 0, 0, 0, 1, 1,
-1.340946, 0.5108289, -1.860892, 0, 0, 0, 1, 1,
-1.328299, 0.3268785, -1.669956, 0, 0, 0, 1, 1,
-1.317814, 1.774761, -1.783104, 0, 0, 0, 1, 1,
-1.314789, 0.4544189, -0.1981518, 1, 1, 1, 1, 1,
-1.303094, -0.3818791, -2.113052, 1, 1, 1, 1, 1,
-1.297849, 0.7330856, 0.5623204, 1, 1, 1, 1, 1,
-1.278204, 2.350693, -1.447455, 1, 1, 1, 1, 1,
-1.276866, -0.7245119, -1.836202, 1, 1, 1, 1, 1,
-1.270594, 0.3378846, -0.700823, 1, 1, 1, 1, 1,
-1.266625, 0.3991237, -3.513172, 1, 1, 1, 1, 1,
-1.266545, 0.9386345, -2.323427, 1, 1, 1, 1, 1,
-1.258894, 0.23597, -1.094485, 1, 1, 1, 1, 1,
-1.247269, -0.001326165, -2.735005, 1, 1, 1, 1, 1,
-1.244142, -1.011665, -2.522681, 1, 1, 1, 1, 1,
-1.233654, 1.200899, -1.676164, 1, 1, 1, 1, 1,
-1.228788, -1.203309, -2.481888, 1, 1, 1, 1, 1,
-1.224792, -1.215114, -2.071358, 1, 1, 1, 1, 1,
-1.219661, 0.4351254, 0.1950456, 1, 1, 1, 1, 1,
-1.217577, -0.8856925, -1.245316, 0, 0, 1, 1, 1,
-1.217492, 2.875735, 0.199446, 1, 0, 0, 1, 1,
-1.214769, 1.476091, -0.4781226, 1, 0, 0, 1, 1,
-1.209985, -1.76883, -2.499647, 1, 0, 0, 1, 1,
-1.20714, 0.7694186, -0.2216782, 1, 0, 0, 1, 1,
-1.20313, 1.020712, -1.25921, 1, 0, 0, 1, 1,
-1.200991, 0.3093456, -2.382595, 0, 0, 0, 1, 1,
-1.194182, -0.1034503, -1.569953, 0, 0, 0, 1, 1,
-1.190912, 0.3611633, -1.333502, 0, 0, 0, 1, 1,
-1.189327, -2.486342, -3.277081, 0, 0, 0, 1, 1,
-1.184792, 0.6416354, -2.890953, 0, 0, 0, 1, 1,
-1.17739, 0.6123655, -2.268227, 0, 0, 0, 1, 1,
-1.175898, -1.295363, -3.485154, 0, 0, 0, 1, 1,
-1.167566, 0.7299121, 0.09827733, 1, 1, 1, 1, 1,
-1.162688, -1.91236, -3.244165, 1, 1, 1, 1, 1,
-1.149951, 0.08860634, -1.8749, 1, 1, 1, 1, 1,
-1.147668, -1.0137, -2.595287, 1, 1, 1, 1, 1,
-1.146625, -0.5997459, -2.046751, 1, 1, 1, 1, 1,
-1.146251, 0.5046989, -0.3395032, 1, 1, 1, 1, 1,
-1.141735, 0.277763, -2.738571, 1, 1, 1, 1, 1,
-1.134407, 0.7755435, -2.739895, 1, 1, 1, 1, 1,
-1.128176, 0.2413724, -1.495928, 1, 1, 1, 1, 1,
-1.124194, 0.3039937, -0.2134012, 1, 1, 1, 1, 1,
-1.118885, -0.5635351, -0.5820257, 1, 1, 1, 1, 1,
-1.11663, -0.8304429, -1.392503, 1, 1, 1, 1, 1,
-1.105683, -1.737531, -1.538301, 1, 1, 1, 1, 1,
-1.105383, -1.262185, -1.744702, 1, 1, 1, 1, 1,
-1.103756, 0.4495872, -1.897425, 1, 1, 1, 1, 1,
-1.094317, -1.907808, -1.932079, 0, 0, 1, 1, 1,
-1.08831, 0.2881862, -2.023397, 1, 0, 0, 1, 1,
-1.083857, -0.3454797, -3.277007, 1, 0, 0, 1, 1,
-1.075082, 1.135721, -0.6857567, 1, 0, 0, 1, 1,
-1.069448, 0.1347659, -0.9366525, 1, 0, 0, 1, 1,
-1.062242, 0.9009051, -0.4797176, 1, 0, 0, 1, 1,
-1.060509, -0.8202381, -3.123451, 0, 0, 0, 1, 1,
-1.058793, -0.5602955, -2.176516, 0, 0, 0, 1, 1,
-1.053006, 1.668252, -1.995082, 0, 0, 0, 1, 1,
-1.038918, 0.2717268, -0.09441281, 0, 0, 0, 1, 1,
-1.026441, -0.5565313, -1.741465, 0, 0, 0, 1, 1,
-1.026023, -0.03849694, -1.167732, 0, 0, 0, 1, 1,
-1.022757, -1.460159, -2.610215, 0, 0, 0, 1, 1,
-1.02232, 0.2029789, -1.529574, 1, 1, 1, 1, 1,
-1.016226, 0.3538794, -0.6222675, 1, 1, 1, 1, 1,
-1.015191, 0.5486715, -1.597376, 1, 1, 1, 1, 1,
-1.014866, 0.5755225, -1.55904, 1, 1, 1, 1, 1,
-1.0078, -1.390042, -2.773649, 1, 1, 1, 1, 1,
-1.007577, 0.9928186, 1.151962, 1, 1, 1, 1, 1,
-1.006802, 1.358736, -1.084289, 1, 1, 1, 1, 1,
-1.004609, -0.6119012, -3.703806, 1, 1, 1, 1, 1,
-0.9897406, 0.5688071, -1.049714, 1, 1, 1, 1, 1,
-0.9841046, 0.04662918, -0.6960974, 1, 1, 1, 1, 1,
-0.9835733, 0.3232185, -1.263668, 1, 1, 1, 1, 1,
-0.9768077, -1.772259, -2.271096, 1, 1, 1, 1, 1,
-0.967355, 1.322777, -0.003074393, 1, 1, 1, 1, 1,
-0.9526398, 0.1896065, -0.7424997, 1, 1, 1, 1, 1,
-0.9486101, 2.21002, -0.3470921, 1, 1, 1, 1, 1,
-0.9459537, -0.2773876, -1.488743, 0, 0, 1, 1, 1,
-0.9435529, -0.625423, -3.176374, 1, 0, 0, 1, 1,
-0.9419297, 0.4042087, 0.2500664, 1, 0, 0, 1, 1,
-0.9314392, -0.3327985, -3.879812, 1, 0, 0, 1, 1,
-0.9276657, -1.622241, -4.143442, 1, 0, 0, 1, 1,
-0.9256584, 1.369581, -3.119477, 1, 0, 0, 1, 1,
-0.9195019, 2.154471, -0.6795434, 0, 0, 0, 1, 1,
-0.9120349, -2.422607, -4.86964, 0, 0, 0, 1, 1,
-0.8979695, -1.097176, -0.7419587, 0, 0, 0, 1, 1,
-0.8848226, -1.075976, -3.861933, 0, 0, 0, 1, 1,
-0.8794291, -0.007762122, -2.035882, 0, 0, 0, 1, 1,
-0.8724287, 0.1564845, -0.2659976, 0, 0, 0, 1, 1,
-0.8719757, -0.2102072, -1.056362, 0, 0, 0, 1, 1,
-0.871623, -0.4944638, -3.331038, 1, 1, 1, 1, 1,
-0.8688716, -0.983265, -2.454048, 1, 1, 1, 1, 1,
-0.8666794, 0.3944632, -1.518683, 1, 1, 1, 1, 1,
-0.8661965, 1.849925, 1.343218, 1, 1, 1, 1, 1,
-0.8535177, 0.8616216, -1.187961, 1, 1, 1, 1, 1,
-0.8463379, 1.996357, 0.5613896, 1, 1, 1, 1, 1,
-0.84522, 0.8486845, 0.4654849, 1, 1, 1, 1, 1,
-0.8425758, 0.7966211, -1.486306, 1, 1, 1, 1, 1,
-0.8390315, 0.6471412, -0.5391059, 1, 1, 1, 1, 1,
-0.8386208, 0.3130316, -1.322604, 1, 1, 1, 1, 1,
-0.8386198, 0.3714465, -1.86563, 1, 1, 1, 1, 1,
-0.8366948, -0.4309564, -2.850917, 1, 1, 1, 1, 1,
-0.8302695, -1.446899, -1.46549, 1, 1, 1, 1, 1,
-0.8292297, -0.3254927, -1.856542, 1, 1, 1, 1, 1,
-0.8286629, -0.3236905, -2.244334, 1, 1, 1, 1, 1,
-0.8280579, -0.556969, -1.393287, 0, 0, 1, 1, 1,
-0.8273815, -0.8522671, -3.459162, 1, 0, 0, 1, 1,
-0.8266237, 1.187126, 0.1213304, 1, 0, 0, 1, 1,
-0.8239049, -0.939133, -1.445296, 1, 0, 0, 1, 1,
-0.8174701, 0.4062023, -1.851148, 1, 0, 0, 1, 1,
-0.8124905, -0.5251772, -1.590391, 1, 0, 0, 1, 1,
-0.8042631, -0.1226399, -0.09442606, 0, 0, 0, 1, 1,
-0.8019669, -0.7064643, -1.785497, 0, 0, 0, 1, 1,
-0.7990251, 1.722724, -0.3866782, 0, 0, 0, 1, 1,
-0.7967559, 1.893224, 0.8219523, 0, 0, 0, 1, 1,
-0.794458, -1.27857, -3.549627, 0, 0, 0, 1, 1,
-0.788526, 1.263525, -0.2060601, 0, 0, 0, 1, 1,
-0.7873281, 0.4359263, -0.496394, 0, 0, 0, 1, 1,
-0.7821903, 0.6210842, -0.4995449, 1, 1, 1, 1, 1,
-0.7793824, 0.4446671, -1.554823, 1, 1, 1, 1, 1,
-0.7753857, -1.81786, -3.208168, 1, 1, 1, 1, 1,
-0.7745843, -1.681236, -0.7577821, 1, 1, 1, 1, 1,
-0.7741446, 1.070924, -0.7244545, 1, 1, 1, 1, 1,
-0.7710294, -0.75734, -1.618829, 1, 1, 1, 1, 1,
-0.7595141, 0.6306959, -0.4423932, 1, 1, 1, 1, 1,
-0.7544162, 0.9341298, -0.950495, 1, 1, 1, 1, 1,
-0.7528708, 0.7512529, -1.134999, 1, 1, 1, 1, 1,
-0.7503104, -0.7180196, -2.494954, 1, 1, 1, 1, 1,
-0.7468865, 1.080889, 1.404656, 1, 1, 1, 1, 1,
-0.7441362, -1.646076, -2.02777, 1, 1, 1, 1, 1,
-0.7395551, 1.366893, 0.4999759, 1, 1, 1, 1, 1,
-0.7387671, 0.7826508, -1.188617, 1, 1, 1, 1, 1,
-0.736224, 0.02776655, -1.90247, 1, 1, 1, 1, 1,
-0.7211691, -0.06830843, -1.085352, 0, 0, 1, 1, 1,
-0.7209953, 0.5154751, -2.243437, 1, 0, 0, 1, 1,
-0.7192635, 0.3233987, -2.428297, 1, 0, 0, 1, 1,
-0.7137389, 0.007606854, 0.9370016, 1, 0, 0, 1, 1,
-0.7099892, 1.492121, 0.148388, 1, 0, 0, 1, 1,
-0.7095772, 0.5830031, -0.8041338, 1, 0, 0, 1, 1,
-0.703608, 0.9968519, 0.7410031, 0, 0, 0, 1, 1,
-0.7033966, 0.9698015, -0.5161914, 0, 0, 0, 1, 1,
-0.7007339, -0.7173532, -2.146442, 0, 0, 0, 1, 1,
-0.6986187, 0.9227661, -0.3555231, 0, 0, 0, 1, 1,
-0.6937808, -0.4219674, -2.845614, 0, 0, 0, 1, 1,
-0.6929088, 1.977839, -1.175536, 0, 0, 0, 1, 1,
-0.6922749, -0.8460369, -2.81937, 0, 0, 0, 1, 1,
-0.6884471, -0.4803522, -2.285408, 1, 1, 1, 1, 1,
-0.6879097, 0.8064253, -1.950198, 1, 1, 1, 1, 1,
-0.685505, 2.098697, -0.335399, 1, 1, 1, 1, 1,
-0.6845009, 1.04132, 0.1660647, 1, 1, 1, 1, 1,
-0.6770151, -1.530847, -3.181317, 1, 1, 1, 1, 1,
-0.6745352, -0.475625, -1.542305, 1, 1, 1, 1, 1,
-0.6710442, 0.9484324, -1.311821, 1, 1, 1, 1, 1,
-0.6669324, -1.9472, -3.371966, 1, 1, 1, 1, 1,
-0.6669185, 3.392518, 1.368049, 1, 1, 1, 1, 1,
-0.6667817, 0.04493694, -1.454883, 1, 1, 1, 1, 1,
-0.6662562, -0.6374065, -1.546983, 1, 1, 1, 1, 1,
-0.6635124, -0.2334012, -1.708048, 1, 1, 1, 1, 1,
-0.6607618, -0.9132814, -3.618386, 1, 1, 1, 1, 1,
-0.652082, 0.8027204, 0.2659899, 1, 1, 1, 1, 1,
-0.6422474, -1.226135, -3.536212, 1, 1, 1, 1, 1,
-0.6421317, -1.307537, -2.192797, 0, 0, 1, 1, 1,
-0.6403957, -0.9436838, -4.237917, 1, 0, 0, 1, 1,
-0.6388233, -0.2679396, -0.886178, 1, 0, 0, 1, 1,
-0.6351616, -0.7158638, -2.26596, 1, 0, 0, 1, 1,
-0.6301673, -0.1318374, -0.9159235, 1, 0, 0, 1, 1,
-0.6289864, 0.2947311, -3.057687, 1, 0, 0, 1, 1,
-0.6205646, -0.9618893, -2.785293, 0, 0, 0, 1, 1,
-0.6169887, 2.32779, 1.34749, 0, 0, 0, 1, 1,
-0.6134002, 0.3894219, -0.9901035, 0, 0, 0, 1, 1,
-0.6117612, -2.185901, -2.09902, 0, 0, 0, 1, 1,
-0.609476, -0.538534, -3.781571, 0, 0, 0, 1, 1,
-0.60711, 0.5487531, -1.617815, 0, 0, 0, 1, 1,
-0.6068229, -0.8209974, -3.303208, 0, 0, 0, 1, 1,
-0.6051794, 0.9099203, 1.148145, 1, 1, 1, 1, 1,
-0.5972906, -0.802203, -3.389372, 1, 1, 1, 1, 1,
-0.5928804, 0.1315424, -3.069366, 1, 1, 1, 1, 1,
-0.5908982, 2.33565, -0.1768368, 1, 1, 1, 1, 1,
-0.5903936, -0.9866552, -1.033003, 1, 1, 1, 1, 1,
-0.5892545, -0.04461985, -2.293904, 1, 1, 1, 1, 1,
-0.5886503, 0.3117032, 0.08180231, 1, 1, 1, 1, 1,
-0.588466, -0.7210344, -2.189261, 1, 1, 1, 1, 1,
-0.5864443, 0.6608574, 0.7307275, 1, 1, 1, 1, 1,
-0.5836784, -0.6018082, -2.176667, 1, 1, 1, 1, 1,
-0.5830378, 0.3250268, -1.412652, 1, 1, 1, 1, 1,
-0.5796567, -0.4413165, -3.389633, 1, 1, 1, 1, 1,
-0.5792258, -1.561922, -2.962269, 1, 1, 1, 1, 1,
-0.5780667, 1.23621, -2.008894, 1, 1, 1, 1, 1,
-0.5705254, 0.0757788, 0.02940295, 1, 1, 1, 1, 1,
-0.5638957, 0.1348018, -2.674291, 0, 0, 1, 1, 1,
-0.5632285, -0.4304585, -2.352212, 1, 0, 0, 1, 1,
-0.5611452, -0.5903584, -3.188518, 1, 0, 0, 1, 1,
-0.5591078, 0.6707654, 0.3027513, 1, 0, 0, 1, 1,
-0.5576814, 0.6008992, -1.883, 1, 0, 0, 1, 1,
-0.5552426, -0.7385859, -1.520635, 1, 0, 0, 1, 1,
-0.5509306, -1.669869, -1.536651, 0, 0, 0, 1, 1,
-0.5499321, -0.2787613, -2.406913, 0, 0, 0, 1, 1,
-0.5491951, 0.1894598, -0.9799399, 0, 0, 0, 1, 1,
-0.5455579, -0.8111786, -2.426604, 0, 0, 0, 1, 1,
-0.5450215, -0.2555999, -2.454514, 0, 0, 0, 1, 1,
-0.5413574, -0.5862937, -3.714487, 0, 0, 0, 1, 1,
-0.5412589, 0.6984212, -2.023816, 0, 0, 0, 1, 1,
-0.5389487, 0.5630058, -0.7140639, 1, 1, 1, 1, 1,
-0.5353495, 1.071422, -1.629651, 1, 1, 1, 1, 1,
-0.530645, -0.7417713, -0.3977571, 1, 1, 1, 1, 1,
-0.5297315, -0.2798003, -2.136068, 1, 1, 1, 1, 1,
-0.5257334, -0.9712241, -1.899431, 1, 1, 1, 1, 1,
-0.5254538, -1.23464, -3.377336, 1, 1, 1, 1, 1,
-0.5252203, 0.5906376, -2.538873, 1, 1, 1, 1, 1,
-0.5237293, 0.01518969, -2.705117, 1, 1, 1, 1, 1,
-0.5202805, -2.426823, -1.980164, 1, 1, 1, 1, 1,
-0.5176225, -0.4078875, -2.418724, 1, 1, 1, 1, 1,
-0.5165923, -1.322035, -3.169457, 1, 1, 1, 1, 1,
-0.5084959, -0.3197842, -1.412596, 1, 1, 1, 1, 1,
-0.5082878, -1.100723, -1.630812, 1, 1, 1, 1, 1,
-0.499307, -1.224921, -2.025082, 1, 1, 1, 1, 1,
-0.4920598, -1.131087, -3.310214, 1, 1, 1, 1, 1,
-0.4914042, -0.8033369, -2.700198, 0, 0, 1, 1, 1,
-0.4876699, -1.190966, -3.273137, 1, 0, 0, 1, 1,
-0.4875073, 0.1005018, -0.4768066, 1, 0, 0, 1, 1,
-0.4872639, -2.695199, -0.02000714, 1, 0, 0, 1, 1,
-0.4867537, -2.192894, -0.9999796, 1, 0, 0, 1, 1,
-0.4827632, 0.01579999, -1.90906, 1, 0, 0, 1, 1,
-0.4817117, -1.275848, -0.9830592, 0, 0, 0, 1, 1,
-0.479075, -0.128828, -1.146229, 0, 0, 0, 1, 1,
-0.4768912, -2.352081, -1.906775, 0, 0, 0, 1, 1,
-0.4750086, -0.7636884, -2.675724, 0, 0, 0, 1, 1,
-0.4740589, -1.702892, -3.328097, 0, 0, 0, 1, 1,
-0.4665917, -0.1237694, -1.852161, 0, 0, 0, 1, 1,
-0.4655679, 0.1117473, -0.6509185, 0, 0, 0, 1, 1,
-0.4650177, -0.8753887, -4.142034, 1, 1, 1, 1, 1,
-0.456558, -0.8561172, -2.323009, 1, 1, 1, 1, 1,
-0.452065, 0.1830185, -0.9308934, 1, 1, 1, 1, 1,
-0.4513847, 0.08454356, -1.498448, 1, 1, 1, 1, 1,
-0.4468178, -0.6491747, -1.730238, 1, 1, 1, 1, 1,
-0.4467128, 0.3559415, -0.9067574, 1, 1, 1, 1, 1,
-0.4448168, 1.555581, -1.098193, 1, 1, 1, 1, 1,
-0.4441456, 1.279481, -0.7562109, 1, 1, 1, 1, 1,
-0.4426892, 2.82756, 1.168545, 1, 1, 1, 1, 1,
-0.4345866, -1.835752, -3.935645, 1, 1, 1, 1, 1,
-0.4296469, 0.8325174, -1.392247, 1, 1, 1, 1, 1,
-0.4295715, -1.093278, -1.355709, 1, 1, 1, 1, 1,
-0.4238904, 0.2536827, -0.9947774, 1, 1, 1, 1, 1,
-0.4225149, -0.5860998, -2.480642, 1, 1, 1, 1, 1,
-0.4209501, -0.8368171, -2.289595, 1, 1, 1, 1, 1,
-0.4189676, 1.717705, -0.4015673, 0, 0, 1, 1, 1,
-0.4078846, -1.249673, -2.693835, 1, 0, 0, 1, 1,
-0.4060481, -0.4600102, -1.749621, 1, 0, 0, 1, 1,
-0.40565, -0.3943009, -2.074028, 1, 0, 0, 1, 1,
-0.4053235, -1.230115, -1.984495, 1, 0, 0, 1, 1,
-0.3973114, 0.6208128, -0.3732364, 1, 0, 0, 1, 1,
-0.3964613, 0.1527367, -1.107816, 0, 0, 0, 1, 1,
-0.3924006, 1.492607, 0.1137452, 0, 0, 0, 1, 1,
-0.3873729, -1.10924, -5.24366, 0, 0, 0, 1, 1,
-0.3859363, -1.229166, -1.906454, 0, 0, 0, 1, 1,
-0.3836329, 0.2990706, 0.3953969, 0, 0, 0, 1, 1,
-0.3796416, -0.7489535, -1.789323, 0, 0, 0, 1, 1,
-0.3771369, -0.5241019, -1.798582, 0, 0, 0, 1, 1,
-0.3715045, -1.465, -1.380027, 1, 1, 1, 1, 1,
-0.3711995, 1.034642, 2.527661, 1, 1, 1, 1, 1,
-0.3696842, -1.396234, -3.55242, 1, 1, 1, 1, 1,
-0.3688024, 0.1584976, -0.2058857, 1, 1, 1, 1, 1,
-0.3671887, -0.3613697, -2.962607, 1, 1, 1, 1, 1,
-0.3655458, -1.079946, -4.541302, 1, 1, 1, 1, 1,
-0.3604519, -0.6487039, -2.423869, 1, 1, 1, 1, 1,
-0.3597936, -0.5589935, -2.173146, 1, 1, 1, 1, 1,
-0.3596407, -0.2777791, -1.267463, 1, 1, 1, 1, 1,
-0.356058, 0.531341, -0.5132121, 1, 1, 1, 1, 1,
-0.3558824, -0.9078326, -2.082409, 1, 1, 1, 1, 1,
-0.3556492, -0.7329389, -2.426648, 1, 1, 1, 1, 1,
-0.3518759, -2.248354, -3.005915, 1, 1, 1, 1, 1,
-0.3489057, 0.5314116, -0.9558785, 1, 1, 1, 1, 1,
-0.3475713, 1.202026, -0.64459, 1, 1, 1, 1, 1,
-0.3456795, 0.1440246, -0.7715192, 0, 0, 1, 1, 1,
-0.3425134, 1.756493, -0.4399249, 1, 0, 0, 1, 1,
-0.3421333, -1.423889, -3.255739, 1, 0, 0, 1, 1,
-0.3373175, -0.5174537, -3.260463, 1, 0, 0, 1, 1,
-0.3370354, 3.271319, -1.738973, 1, 0, 0, 1, 1,
-0.3318651, -1.028754, -2.080348, 1, 0, 0, 1, 1,
-0.32723, 0.2604522, 0.9822053, 0, 0, 0, 1, 1,
-0.3243861, -0.4067881, -4.476501, 0, 0, 0, 1, 1,
-0.3237272, 1.534859, 0.039784, 0, 0, 0, 1, 1,
-0.3170148, -0.04942213, -0.6808383, 0, 0, 0, 1, 1,
-0.3168731, 1.067755, -0.01654866, 0, 0, 0, 1, 1,
-0.3156074, -0.9779259, -2.488181, 0, 0, 0, 1, 1,
-0.3124478, -0.6193548, -1.950183, 0, 0, 0, 1, 1,
-0.3124287, -0.3190124, -2.684543, 1, 1, 1, 1, 1,
-0.309937, -0.6671467, -4.039367, 1, 1, 1, 1, 1,
-0.3094963, -0.3156904, -4.291989, 1, 1, 1, 1, 1,
-0.3082243, 0.81625, -0.1427319, 1, 1, 1, 1, 1,
-0.3068936, 1.881704, 0.08768743, 1, 1, 1, 1, 1,
-0.3037165, 0.5133482, -1.234589, 1, 1, 1, 1, 1,
-0.3028892, 0.957008, 1.299555, 1, 1, 1, 1, 1,
-0.2981959, 0.3132238, -2.30697, 1, 1, 1, 1, 1,
-0.2969486, 2.281209, -0.7056743, 1, 1, 1, 1, 1,
-0.2921845, 0.4632499, -1.497432, 1, 1, 1, 1, 1,
-0.2902751, -0.2409636, -1.863239, 1, 1, 1, 1, 1,
-0.2824747, 0.353948, -0.9235316, 1, 1, 1, 1, 1,
-0.2794553, -0.8601357, -2.522169, 1, 1, 1, 1, 1,
-0.277554, -1.490639, -3.85768, 1, 1, 1, 1, 1,
-0.2760113, -0.6518617, -2.493851, 1, 1, 1, 1, 1,
-0.2715413, -2.22167, -2.723502, 0, 0, 1, 1, 1,
-0.2696199, -1.188598, -2.200573, 1, 0, 0, 1, 1,
-0.2686155, -1.739841, -3.044744, 1, 0, 0, 1, 1,
-0.2665939, 1.451839, 1.221309, 1, 0, 0, 1, 1,
-0.2654657, 0.4357786, 0.3641366, 1, 0, 0, 1, 1,
-0.2638598, 0.508393, -0.982636, 1, 0, 0, 1, 1,
-0.2629305, 1.265784, 0.9170324, 0, 0, 0, 1, 1,
-0.2601259, 1.121431, 0.5833946, 0, 0, 0, 1, 1,
-0.254119, -0.4301758, -1.841692, 0, 0, 0, 1, 1,
-0.2528858, -0.3047091, -3.157913, 0, 0, 0, 1, 1,
-0.2507527, -0.6197516, -3.295025, 0, 0, 0, 1, 1,
-0.2487346, -0.06744045, -3.251847, 0, 0, 0, 1, 1,
-0.2443876, 0.2275355, -0.6677603, 0, 0, 0, 1, 1,
-0.2429913, 0.3612169, -1.651975, 1, 1, 1, 1, 1,
-0.241473, 0.9456177, -1.978018, 1, 1, 1, 1, 1,
-0.2407432, 0.3634009, 0.8084012, 1, 1, 1, 1, 1,
-0.2362313, -1.431898, -2.780138, 1, 1, 1, 1, 1,
-0.2322016, -0.6069334, -3.190359, 1, 1, 1, 1, 1,
-0.2271225, -0.04198882, -1.62389, 1, 1, 1, 1, 1,
-0.2268637, -0.4796691, -0.9027342, 1, 1, 1, 1, 1,
-0.2262259, 0.8818669, -0.6727983, 1, 1, 1, 1, 1,
-0.2256802, -0.3336936, -1.992227, 1, 1, 1, 1, 1,
-0.2248711, 0.1537488, 0.6534909, 1, 1, 1, 1, 1,
-0.2247262, 0.7647178, 0.1474265, 1, 1, 1, 1, 1,
-0.2246154, -1.474481, -3.831964, 1, 1, 1, 1, 1,
-0.2246081, -0.7068741, -4.539692, 1, 1, 1, 1, 1,
-0.2228355, -0.4486594, -2.254497, 1, 1, 1, 1, 1,
-0.2157369, 0.8760749, -0.307875, 1, 1, 1, 1, 1,
-0.2142541, -0.615078, -1.414241, 0, 0, 1, 1, 1,
-0.2093858, -0.2264087, -2.35391, 1, 0, 0, 1, 1,
-0.20885, 0.5666136, 0.884007, 1, 0, 0, 1, 1,
-0.2078011, -1.790922, -4.211308, 1, 0, 0, 1, 1,
-0.2077297, 0.464654, -1.08024, 1, 0, 0, 1, 1,
-0.2046953, -0.131558, -1.856782, 1, 0, 0, 1, 1,
-0.20455, -0.5108457, -2.276032, 0, 0, 0, 1, 1,
-0.2039265, -0.355016, -5.753414, 0, 0, 0, 1, 1,
-0.2033847, 1.408696, -0.1698547, 0, 0, 0, 1, 1,
-0.2016872, 1.105417, -0.6584293, 0, 0, 0, 1, 1,
-0.2006862, -0.4941433, -2.994488, 0, 0, 0, 1, 1,
-0.193037, 0.02877358, -2.016229, 0, 0, 0, 1, 1,
-0.1859808, 0.007649805, -1.525806, 0, 0, 0, 1, 1,
-0.1856875, 0.4821256, 0.8818553, 1, 1, 1, 1, 1,
-0.1851697, 1.138431, -0.2210351, 1, 1, 1, 1, 1,
-0.1803344, -0.7152243, -2.531657, 1, 1, 1, 1, 1,
-0.177086, -0.06426909, 0.08055204, 1, 1, 1, 1, 1,
-0.1752259, -1.283589, -4.706365, 1, 1, 1, 1, 1,
-0.1738316, 0.2500854, -1.291236, 1, 1, 1, 1, 1,
-0.1715358, 0.2481069, 0.2514447, 1, 1, 1, 1, 1,
-0.1706038, 0.6443657, -0.2595482, 1, 1, 1, 1, 1,
-0.1703802, 2.331242, -1.342741, 1, 1, 1, 1, 1,
-0.1699294, -0.6570516, -3.931407, 1, 1, 1, 1, 1,
-0.1669092, 1.235788, 0.7239583, 1, 1, 1, 1, 1,
-0.1665819, -0.4655493, -3.368603, 1, 1, 1, 1, 1,
-0.1655917, -1.171444, -2.941401, 1, 1, 1, 1, 1,
-0.1646906, -2.051663, -3.509675, 1, 1, 1, 1, 1,
-0.1641837, 0.3904017, -0.2172148, 1, 1, 1, 1, 1,
-0.1604539, 0.9479845, -1.679444, 0, 0, 1, 1, 1,
-0.1588116, -0.277733, -3.161853, 1, 0, 0, 1, 1,
-0.155088, 1.298054, -0.8057857, 1, 0, 0, 1, 1,
-0.1525759, 0.827626, -0.7991243, 1, 0, 0, 1, 1,
-0.1499506, -0.4793566, -1.726927, 1, 0, 0, 1, 1,
-0.1493871, -0.462015, -1.706966, 1, 0, 0, 1, 1,
-0.1458322, 1.82783, -1.095476, 0, 0, 0, 1, 1,
-0.1385718, -1.842986, -4.601289, 0, 0, 0, 1, 1,
-0.1385182, 0.174075, -0.5954389, 0, 0, 0, 1, 1,
-0.1348912, 0.1129419, -0.4275709, 0, 0, 0, 1, 1,
-0.1292364, 0.2670863, -0.5234784, 0, 0, 0, 1, 1,
-0.1270412, 0.3511696, 0.527312, 0, 0, 0, 1, 1,
-0.1263508, -0.2979745, -3.275795, 0, 0, 0, 1, 1,
-0.1255925, 0.1699739, 0.7869093, 1, 1, 1, 1, 1,
-0.1250519, 0.9461517, -0.6169403, 1, 1, 1, 1, 1,
-0.1226487, 0.2982662, -0.1104408, 1, 1, 1, 1, 1,
-0.1122328, 2.374789, -0.04528304, 1, 1, 1, 1, 1,
-0.1089272, -0.08217807, -4.269811, 1, 1, 1, 1, 1,
-0.1080275, -0.1532985, -3.162406, 1, 1, 1, 1, 1,
-0.1048825, 0.3243256, 0.09067555, 1, 1, 1, 1, 1,
-0.1045494, 0.17874, -0.6849457, 1, 1, 1, 1, 1,
-0.09883841, 0.3616845, -0.591759, 1, 1, 1, 1, 1,
-0.0961092, 1.488066, 1.738794, 1, 1, 1, 1, 1,
-0.09584463, -0.08231071, -1.229421, 1, 1, 1, 1, 1,
-0.09462353, 0.03045459, -1.194601, 1, 1, 1, 1, 1,
-0.09457488, 1.095374, -0.3049555, 1, 1, 1, 1, 1,
-0.09352361, 0.925576, 1.751974, 1, 1, 1, 1, 1,
-0.08483484, 0.3724958, 0.9631252, 1, 1, 1, 1, 1,
-0.08419872, -1.808023, -2.736743, 0, 0, 1, 1, 1,
-0.08396011, 1.647777, 1.107259, 1, 0, 0, 1, 1,
-0.08333267, -2.059469, -2.999435, 1, 0, 0, 1, 1,
-0.07871232, -1.012695, -1.907949, 1, 0, 0, 1, 1,
-0.07808078, -0.6865677, -2.90517, 1, 0, 0, 1, 1,
-0.07077174, 1.30846, -1.13144, 1, 0, 0, 1, 1,
-0.06934503, 0.6061154, -2.427863, 0, 0, 0, 1, 1,
-0.06730004, 1.176555, -1.356439, 0, 0, 0, 1, 1,
-0.06584091, 1.313902, -0.4618951, 0, 0, 0, 1, 1,
-0.06505229, 1.271431, 0.7905163, 0, 0, 0, 1, 1,
-0.06465801, 0.2568417, 0.7411395, 0, 0, 0, 1, 1,
-0.06372105, 2.161587, 0.1212881, 0, 0, 0, 1, 1,
-0.06332776, 0.2579984, -0.4136572, 0, 0, 0, 1, 1,
-0.06298932, 0.8191667, 0.1592313, 1, 1, 1, 1, 1,
-0.06154333, 0.08904517, -0.7899279, 1, 1, 1, 1, 1,
-0.05987541, 0.258875, -0.1715489, 1, 1, 1, 1, 1,
-0.05732722, -0.3959301, -3.247272, 1, 1, 1, 1, 1,
-0.05707807, 0.5294434, 0.5843759, 1, 1, 1, 1, 1,
-0.05313368, -0.6225312, -3.380268, 1, 1, 1, 1, 1,
-0.05248368, -0.4718911, -2.016335, 1, 1, 1, 1, 1,
-0.05152318, 0.6320907, 0.6366583, 1, 1, 1, 1, 1,
-0.0428912, 0.8584319, -0.8331418, 1, 1, 1, 1, 1,
-0.04057133, -0.2100046, -1.382189, 1, 1, 1, 1, 1,
-0.0328256, -2.36072, -3.458572, 1, 1, 1, 1, 1,
-0.03179429, -1.424783, -2.725756, 1, 1, 1, 1, 1,
-0.03044634, 1.401353, 0.4235773, 1, 1, 1, 1, 1,
-0.0280607, -0.07618972, -2.78017, 1, 1, 1, 1, 1,
-0.02411111, -0.5934337, -1.670057, 1, 1, 1, 1, 1,
-0.02188687, -0.8384291, -2.051874, 0, 0, 1, 1, 1,
-0.02149302, -1.082179, -3.674971, 1, 0, 0, 1, 1,
-0.02108086, -1.984967, -4.163574, 1, 0, 0, 1, 1,
-0.0205325, -0.02542835, -2.325021, 1, 0, 0, 1, 1,
-0.01731462, -0.3562005, -1.465284, 1, 0, 0, 1, 1,
-0.003528376, -0.04920561, -4.991166, 1, 0, 0, 1, 1,
-0.001196789, -0.3365529, -3.56782, 0, 0, 0, 1, 1,
-0.0006078052, 2.401298, 1.479052, 0, 0, 0, 1, 1,
0.003179844, 0.5778999, -1.092405, 0, 0, 0, 1, 1,
0.01098942, -0.4642122, 2.830843, 0, 0, 0, 1, 1,
0.02029146, -0.1422684, 2.665887, 0, 0, 0, 1, 1,
0.02244424, -0.4778693, 5.395334, 0, 0, 0, 1, 1,
0.02609047, -0.3246582, 2.494342, 0, 0, 0, 1, 1,
0.02817807, 0.3315544, 0.3937459, 1, 1, 1, 1, 1,
0.02841788, -2.108819, 3.066768, 1, 1, 1, 1, 1,
0.02945106, 2.652943, 0.2734996, 1, 1, 1, 1, 1,
0.03089041, 1.683686, 0.9660185, 1, 1, 1, 1, 1,
0.03091796, 0.8832124, -0.1564693, 1, 1, 1, 1, 1,
0.03245316, -1.243769, 2.389451, 1, 1, 1, 1, 1,
0.03416765, -0.4098978, 3.540024, 1, 1, 1, 1, 1,
0.0357725, -0.2194751, 3.198894, 1, 1, 1, 1, 1,
0.04160776, -1.932873, 1.775287, 1, 1, 1, 1, 1,
0.04211784, -1.667777, 3.399865, 1, 1, 1, 1, 1,
0.04280994, 1.26502, -0.5553917, 1, 1, 1, 1, 1,
0.0429486, 0.2674033, 0.04390193, 1, 1, 1, 1, 1,
0.05142415, -1.106751, 2.397041, 1, 1, 1, 1, 1,
0.05216045, -0.7417036, 1.480599, 1, 1, 1, 1, 1,
0.05265947, 0.323525, 0.6293046, 1, 1, 1, 1, 1,
0.05639681, -0.7404127, 6.077763, 0, 0, 1, 1, 1,
0.05662113, 0.4652786, -0.02080487, 1, 0, 0, 1, 1,
0.05729899, 0.9636078, -0.06392439, 1, 0, 0, 1, 1,
0.0610338, -0.2293141, 3.949905, 1, 0, 0, 1, 1,
0.06448077, -0.5241745, 3.990982, 1, 0, 0, 1, 1,
0.06573586, 0.6580365, 0.4869871, 1, 0, 0, 1, 1,
0.06808928, -0.7200509, 4.877713, 0, 0, 0, 1, 1,
0.06810992, 0.005707759, 1.165217, 0, 0, 0, 1, 1,
0.0681468, -0.3087554, 2.066064, 0, 0, 0, 1, 1,
0.07358243, 0.2668593, -0.4464719, 0, 0, 0, 1, 1,
0.07528082, -0.7645619, 3.170565, 0, 0, 0, 1, 1,
0.07731863, 1.283068, 0.60917, 0, 0, 0, 1, 1,
0.08011412, 0.4799633, -0.02187176, 0, 0, 0, 1, 1,
0.08103929, -0.04211511, 4.432839, 1, 1, 1, 1, 1,
0.08336625, 0.5203066, -0.1116966, 1, 1, 1, 1, 1,
0.08447698, 0.954675, 0.2932739, 1, 1, 1, 1, 1,
0.08468051, 0.9007573, -1.815973, 1, 1, 1, 1, 1,
0.08500037, -0.007323159, 1.518882, 1, 1, 1, 1, 1,
0.08767808, 0.07568882, -0.7419949, 1, 1, 1, 1, 1,
0.1023911, 0.3258401, -1.317294, 1, 1, 1, 1, 1,
0.1066002, 0.4568723, 1.687973, 1, 1, 1, 1, 1,
0.1095931, -0.7648498, 2.657927, 1, 1, 1, 1, 1,
0.1128714, -2.227255, 3.494896, 1, 1, 1, 1, 1,
0.1222666, 0.5747623, 0.8360481, 1, 1, 1, 1, 1,
0.1294038, -0.9375418, 2.940032, 1, 1, 1, 1, 1,
0.1314172, 0.6795418, 0.7208924, 1, 1, 1, 1, 1,
0.1324202, -0.1055438, 2.021687, 1, 1, 1, 1, 1,
0.135676, -0.7201855, 1.715335, 1, 1, 1, 1, 1,
0.1364457, 0.4770482, 0.421477, 0, 0, 1, 1, 1,
0.138149, -0.9464684, 2.772424, 1, 0, 0, 1, 1,
0.1390688, 0.01236981, 0.8882931, 1, 0, 0, 1, 1,
0.1397155, 0.8905994, -1.113071, 1, 0, 0, 1, 1,
0.1419069, 0.005999114, 0.6507556, 1, 0, 0, 1, 1,
0.1437581, -1.162448, 2.375334, 1, 0, 0, 1, 1,
0.1439521, 0.706373, -0.6951025, 0, 0, 0, 1, 1,
0.1517041, -0.1877625, 3.096353, 0, 0, 0, 1, 1,
0.1566048, -0.4239045, 2.937407, 0, 0, 0, 1, 1,
0.1581992, 0.4957833, -0.3361973, 0, 0, 0, 1, 1,
0.1602458, -1.043323, 2.763757, 0, 0, 0, 1, 1,
0.1607928, 1.804608, 1.403259, 0, 0, 0, 1, 1,
0.1665873, -0.8545102, 2.077105, 0, 0, 0, 1, 1,
0.1673662, -0.2899739, 0.3821575, 1, 1, 1, 1, 1,
0.169707, -0.1702228, 2.697368, 1, 1, 1, 1, 1,
0.1762416, 0.191895, 0.6396906, 1, 1, 1, 1, 1,
0.1776219, 0.9333303, 0.3187853, 1, 1, 1, 1, 1,
0.1842283, -0.4758473, 4.541505, 1, 1, 1, 1, 1,
0.185048, 1.045429, 0.4271993, 1, 1, 1, 1, 1,
0.186489, -0.1267314, 1.54892, 1, 1, 1, 1, 1,
0.1872117, 0.02686237, 0.3222722, 1, 1, 1, 1, 1,
0.2017007, 0.7212343, 0.3616981, 1, 1, 1, 1, 1,
0.2059666, 1.131533, 1.274724, 1, 1, 1, 1, 1,
0.2096768, -0.3705557, 4.868659, 1, 1, 1, 1, 1,
0.2146022, 1.858357, -0.596094, 1, 1, 1, 1, 1,
0.2170513, -0.6172675, 1.733136, 1, 1, 1, 1, 1,
0.2232346, 0.5589114, 0.1236789, 1, 1, 1, 1, 1,
0.2392651, 0.4475817, 2.489545, 1, 1, 1, 1, 1,
0.2420561, -0.4370401, 2.110923, 0, 0, 1, 1, 1,
0.2509006, -0.5335701, 3.158945, 1, 0, 0, 1, 1,
0.2518658, 0.8464546, 0.40597, 1, 0, 0, 1, 1,
0.2545864, 0.9455981, 0.4475749, 1, 0, 0, 1, 1,
0.2551493, 0.9204482, 0.1416849, 1, 0, 0, 1, 1,
0.2672729, -1.739779, 2.601434, 1, 0, 0, 1, 1,
0.2687291, 1.058486, -0.1934978, 0, 0, 0, 1, 1,
0.2698675, 0.5899963, 0.5355063, 0, 0, 0, 1, 1,
0.2703666, -0.4395097, 2.668489, 0, 0, 0, 1, 1,
0.2892158, -1.226154, 4.271138, 0, 0, 0, 1, 1,
0.2902131, -0.8392953, 1.931611, 0, 0, 0, 1, 1,
0.2906219, 0.3397917, -0.1992925, 0, 0, 0, 1, 1,
0.2910048, -0.7259507, 3.009854, 0, 0, 0, 1, 1,
0.2923577, -0.7937294, 2.777451, 1, 1, 1, 1, 1,
0.2926372, -1.551904, 2.941778, 1, 1, 1, 1, 1,
0.2962061, 2.160104, -0.5093827, 1, 1, 1, 1, 1,
0.2963843, -0.5002004, 2.509042, 1, 1, 1, 1, 1,
0.2987272, -0.6518658, 2.000911, 1, 1, 1, 1, 1,
0.2990416, 0.7460828, -0.3777987, 1, 1, 1, 1, 1,
0.301776, -1.105126, 4.063231, 1, 1, 1, 1, 1,
0.3038962, -0.05984474, 2.540451, 1, 1, 1, 1, 1,
0.306679, -1.078386, 4.291754, 1, 1, 1, 1, 1,
0.3103403, -0.7438557, 3.44674, 1, 1, 1, 1, 1,
0.3117207, 0.3431726, 1.460857, 1, 1, 1, 1, 1,
0.3123132, 1.115667, 0.1504876, 1, 1, 1, 1, 1,
0.3139995, 0.1441463, 0.1455739, 1, 1, 1, 1, 1,
0.3168567, 1.154672, 0.5444989, 1, 1, 1, 1, 1,
0.3230192, 1.096569, 0.03232354, 1, 1, 1, 1, 1,
0.3282295, 0.1533138, 2.433339, 0, 0, 1, 1, 1,
0.3299206, 0.4523875, -0.4800388, 1, 0, 0, 1, 1,
0.3310464, 0.3010914, 0.6278628, 1, 0, 0, 1, 1,
0.3358299, -0.832509, 2.753746, 1, 0, 0, 1, 1,
0.3361049, -0.678877, 1.657256, 1, 0, 0, 1, 1,
0.3402749, 0.6673716, 1.71906, 1, 0, 0, 1, 1,
0.3441175, 0.9042723, 0.3863596, 0, 0, 0, 1, 1,
0.3452453, -1.316689, 2.524893, 0, 0, 0, 1, 1,
0.3520269, 0.2721423, -0.2417458, 0, 0, 0, 1, 1,
0.3534527, -0.5778096, 2.636826, 0, 0, 0, 1, 1,
0.3556873, -1.055548, 2.010378, 0, 0, 0, 1, 1,
0.3581999, -2.040967, 3.71053, 0, 0, 0, 1, 1,
0.3641384, 1.056802, 2.729255, 0, 0, 0, 1, 1,
0.3678294, 1.168254, -0.4510485, 1, 1, 1, 1, 1,
0.3684245, -0.5689729, 2.659059, 1, 1, 1, 1, 1,
0.3703388, -1.139863, 2.98387, 1, 1, 1, 1, 1,
0.3733351, -0.1980679, 1.144759, 1, 1, 1, 1, 1,
0.3746512, 0.01660639, 1.744288, 1, 1, 1, 1, 1,
0.3754715, -1.751065, 2.93006, 1, 1, 1, 1, 1,
0.3797474, -0.7999409, 2.825317, 1, 1, 1, 1, 1,
0.3855382, -0.3775389, 2.266421, 1, 1, 1, 1, 1,
0.3895791, -0.8239152, 3.205301, 1, 1, 1, 1, 1,
0.3951922, -0.2378417, 0.3490488, 1, 1, 1, 1, 1,
0.3963082, -0.007551071, -0.213128, 1, 1, 1, 1, 1,
0.3977033, -1.886371, 2.779846, 1, 1, 1, 1, 1,
0.4022825, -0.5041002, 2.008288, 1, 1, 1, 1, 1,
0.4029062, -0.6055855, 3.522962, 1, 1, 1, 1, 1,
0.4052806, -2.357508, 3.087486, 1, 1, 1, 1, 1,
0.4061028, -0.9076021, 2.297495, 0, 0, 1, 1, 1,
0.4064601, -1.367052, 4.0035, 1, 0, 0, 1, 1,
0.4080293, 0.1503171, 1.022149, 1, 0, 0, 1, 1,
0.4095182, 1.78669, 0.830862, 1, 0, 0, 1, 1,
0.4096046, 0.7926734, -0.7424057, 1, 0, 0, 1, 1,
0.4121498, -0.3890171, 1.185861, 1, 0, 0, 1, 1,
0.4131222, -0.6781198, 3.284051, 0, 0, 0, 1, 1,
0.4149451, 0.1375516, -0.2759461, 0, 0, 0, 1, 1,
0.4176469, -0.6183757, 2.018606, 0, 0, 0, 1, 1,
0.4233893, -1.920783, 3.359121, 0, 0, 0, 1, 1,
0.4289534, -1.91136, 3.686907, 0, 0, 0, 1, 1,
0.4295288, 1.05033, 1.005009, 0, 0, 0, 1, 1,
0.4299297, -0.3757333, 2.768619, 0, 0, 0, 1, 1,
0.4299632, -0.08161806, 1.425465, 1, 1, 1, 1, 1,
0.4442466, 0.1400847, 0.1922028, 1, 1, 1, 1, 1,
0.4458665, 0.5977542, 0.7591951, 1, 1, 1, 1, 1,
0.4465836, 0.9372831, 0.4468963, 1, 1, 1, 1, 1,
0.4557565, -0.8987654, 2.828166, 1, 1, 1, 1, 1,
0.4625983, -0.4358202, 1.68291, 1, 1, 1, 1, 1,
0.4640399, -0.6590942, 3.444789, 1, 1, 1, 1, 1,
0.4662351, -0.8362389, 1.830893, 1, 1, 1, 1, 1,
0.4737064, -0.4877062, 1.76873, 1, 1, 1, 1, 1,
0.47646, 0.1431688, 0.931127, 1, 1, 1, 1, 1,
0.4768261, 0.3994338, 2.409486, 1, 1, 1, 1, 1,
0.483337, 0.5646251, -0.7798094, 1, 1, 1, 1, 1,
0.4949122, 0.561608, 0.4672082, 1, 1, 1, 1, 1,
0.4979447, -0.358125, 3.69604, 1, 1, 1, 1, 1,
0.498893, 0.7392277, 0.436701, 1, 1, 1, 1, 1,
0.5009114, 1.181592, 0.4200785, 0, 0, 1, 1, 1,
0.5129833, 0.2221441, 1.456241, 1, 0, 0, 1, 1,
0.5137211, 1.355257, 0.6464227, 1, 0, 0, 1, 1,
0.5176097, -0.6926498, 2.47309, 1, 0, 0, 1, 1,
0.5221269, 0.883763, 0.9291149, 1, 0, 0, 1, 1,
0.5226271, 0.8665995, -0.04334143, 1, 0, 0, 1, 1,
0.5351055, -1.005138, 2.528143, 0, 0, 0, 1, 1,
0.5357741, 1.379341, 1.312784, 0, 0, 0, 1, 1,
0.5359426, -0.4005621, 0.2201266, 0, 0, 0, 1, 1,
0.5374316, -0.9206364, 2.641487, 0, 0, 0, 1, 1,
0.53843, 0.9509461, 1.575073, 0, 0, 0, 1, 1,
0.5384356, -0.2395351, 2.324787, 0, 0, 0, 1, 1,
0.542003, -1.137884, 4.084863, 0, 0, 0, 1, 1,
0.5452972, -1.725656, 3.82951, 1, 1, 1, 1, 1,
0.5453083, 0.2496382, 0.997831, 1, 1, 1, 1, 1,
0.5478871, -0.3561655, 0.3714111, 1, 1, 1, 1, 1,
0.5527495, 1.235005, 1.580054, 1, 1, 1, 1, 1,
0.5553332, -1.77145, 2.355821, 1, 1, 1, 1, 1,
0.5580839, 0.2788904, 2.099361, 1, 1, 1, 1, 1,
0.5594353, 0.8162025, 1.196517, 1, 1, 1, 1, 1,
0.5607131, 1.444712, 0.4902357, 1, 1, 1, 1, 1,
0.5608492, 0.9398076, 0.5035234, 1, 1, 1, 1, 1,
0.5608734, 1.331133, 1.51002, 1, 1, 1, 1, 1,
0.5609804, 0.5261809, 0.7570308, 1, 1, 1, 1, 1,
0.5681128, 1.189334, 0.7634489, 1, 1, 1, 1, 1,
0.5713294, 1.66277, 1.055725, 1, 1, 1, 1, 1,
0.5815814, -0.7717792, 4.055164, 1, 1, 1, 1, 1,
0.5817141, 0.2931151, 1.390164, 1, 1, 1, 1, 1,
0.5827051, 0.05199445, 0.243968, 0, 0, 1, 1, 1,
0.5834878, -0.8677384, 1.972934, 1, 0, 0, 1, 1,
0.5838085, 0.5427642, 1.868689, 1, 0, 0, 1, 1,
0.5888954, -0.4695999, 1.644602, 1, 0, 0, 1, 1,
0.5890238, -1.181819, 3.195974, 1, 0, 0, 1, 1,
0.5908768, 0.217899, 1.302756, 1, 0, 0, 1, 1,
0.5928133, -0.1588551, 1.899073, 0, 0, 0, 1, 1,
0.5936887, -0.9506077, 3.087516, 0, 0, 0, 1, 1,
0.5969543, -0.2857211, 1.349211, 0, 0, 0, 1, 1,
0.6000972, 0.2717393, 0.8044914, 0, 0, 0, 1, 1,
0.6013763, -0.4275752, 2.164821, 0, 0, 0, 1, 1,
0.6043368, -2.005083, 3.351198, 0, 0, 0, 1, 1,
0.6052356, -0.8417225, 3.477525, 0, 0, 0, 1, 1,
0.6055288, 0.1268333, 1.760394, 1, 1, 1, 1, 1,
0.6068923, 0.3237508, 0.1831603, 1, 1, 1, 1, 1,
0.6090998, 0.5976883, 1.821773, 1, 1, 1, 1, 1,
0.622314, -0.445648, 1.451831, 1, 1, 1, 1, 1,
0.6264513, -0.2639387, 1.602345, 1, 1, 1, 1, 1,
0.6294463, 1.921222, 0.3156499, 1, 1, 1, 1, 1,
0.6294515, 1.016192, 1.063529, 1, 1, 1, 1, 1,
0.6320122, -0.1644652, 2.268632, 1, 1, 1, 1, 1,
0.6324264, 0.01106078, 0.8351461, 1, 1, 1, 1, 1,
0.6351069, -0.2185987, 2.525203, 1, 1, 1, 1, 1,
0.6356381, 0.5325378, 2.04322, 1, 1, 1, 1, 1,
0.645315, -0.2752201, 3.548295, 1, 1, 1, 1, 1,
0.6461007, 0.6128928, -1.134041, 1, 1, 1, 1, 1,
0.6493933, 1.110884, 1.545074, 1, 1, 1, 1, 1,
0.6548615, 0.8005538, 2.450104, 1, 1, 1, 1, 1,
0.6557602, 1.398233, -0.3016034, 0, 0, 1, 1, 1,
0.6639364, 0.03282534, 3.195371, 1, 0, 0, 1, 1,
0.6675696, -0.5776471, 2.621875, 1, 0, 0, 1, 1,
0.6732289, 0.142955, 2.362714, 1, 0, 0, 1, 1,
0.6762066, 0.8698232, 2.163267, 1, 0, 0, 1, 1,
0.6814013, -1.501434, 0.8909454, 1, 0, 0, 1, 1,
0.6845653, -1.494988, 4.006035, 0, 0, 0, 1, 1,
0.6848062, 0.3579804, 1.605604, 0, 0, 0, 1, 1,
0.6902511, -1.731242, 2.006202, 0, 0, 0, 1, 1,
0.6976656, 0.05290931, 0.8498155, 0, 0, 0, 1, 1,
0.69885, -1.955909, 2.877635, 0, 0, 0, 1, 1,
0.7005862, 0.1394242, -0.4589721, 0, 0, 0, 1, 1,
0.7014055, 0.7888202, 1.088198, 0, 0, 0, 1, 1,
0.7024187, 0.05515804, 1.098846, 1, 1, 1, 1, 1,
0.7048414, -0.2134594, 2.448921, 1, 1, 1, 1, 1,
0.7073137, -0.4626023, 2.236734, 1, 1, 1, 1, 1,
0.708118, -0.5236518, 2.786591, 1, 1, 1, 1, 1,
0.7093271, 0.6810434, 2.546898, 1, 1, 1, 1, 1,
0.710309, 0.7190138, 0.9532408, 1, 1, 1, 1, 1,
0.7139515, -1.111023, 3.173452, 1, 1, 1, 1, 1,
0.7141777, 1.320834, -0.8957399, 1, 1, 1, 1, 1,
0.7214639, -1.74102, 3.754543, 1, 1, 1, 1, 1,
0.7226269, -0.2445388, 0.8417715, 1, 1, 1, 1, 1,
0.7267637, 0.386427, 3.148911, 1, 1, 1, 1, 1,
0.7269302, -0.315385, 1.752035, 1, 1, 1, 1, 1,
0.7269466, 0.4054669, 0.690955, 1, 1, 1, 1, 1,
0.7292473, 0.1213645, 1.595816, 1, 1, 1, 1, 1,
0.7306082, -1.794039, 5.111858, 1, 1, 1, 1, 1,
0.7317216, 2.209817, -0.6965799, 0, 0, 1, 1, 1,
0.7325624, -0.1267806, 3.503024, 1, 0, 0, 1, 1,
0.7346484, 0.6011903, 2.280933, 1, 0, 0, 1, 1,
0.7397039, 0.2824874, -0.08242809, 1, 0, 0, 1, 1,
0.7491615, -1.152821, 2.070499, 1, 0, 0, 1, 1,
0.7554625, -1.788628, 2.097276, 1, 0, 0, 1, 1,
0.7557563, -0.1336551, 1.387494, 0, 0, 0, 1, 1,
0.7598042, -0.3894662, 0.4494281, 0, 0, 0, 1, 1,
0.7608469, 0.8882573, -1.14929, 0, 0, 0, 1, 1,
0.765191, -0.8228645, 1.571198, 0, 0, 0, 1, 1,
0.7720564, 0.4306714, -0.197066, 0, 0, 0, 1, 1,
0.7760592, 0.7660973, 3.112612, 0, 0, 0, 1, 1,
0.7767054, -1.405548, 3.296706, 0, 0, 0, 1, 1,
0.776742, -0.3673051, 1.922561, 1, 1, 1, 1, 1,
0.7798885, -1.073846, 3.993007, 1, 1, 1, 1, 1,
0.7907649, -0.8119297, 1.35545, 1, 1, 1, 1, 1,
0.7948085, -0.3986, 0.5700454, 1, 1, 1, 1, 1,
0.7955981, -0.537313, 0.4290996, 1, 1, 1, 1, 1,
0.7957661, -1.442595, 0.9114925, 1, 1, 1, 1, 1,
0.7987501, 0.2147224, 0.9519221, 1, 1, 1, 1, 1,
0.8041188, -1.260614, 2.551553, 1, 1, 1, 1, 1,
0.8066173, -1.393601, 3.811349, 1, 1, 1, 1, 1,
0.8086144, 0.7570875, 1.305794, 1, 1, 1, 1, 1,
0.8093042, 0.6291625, -0.1828353, 1, 1, 1, 1, 1,
0.8102928, 0.07442765, 0.4772823, 1, 1, 1, 1, 1,
0.8104199, 0.4741632, 0.5259573, 1, 1, 1, 1, 1,
0.8131448, 1.347706, 1.528338, 1, 1, 1, 1, 1,
0.8136998, -0.4598676, 0.3518324, 1, 1, 1, 1, 1,
0.8203496, 1.148556, 1.497162, 0, 0, 1, 1, 1,
0.8207991, 0.3258806, 1.834143, 1, 0, 0, 1, 1,
0.8240733, -0.1072122, -0.210748, 1, 0, 0, 1, 1,
0.8242033, 0.9146212, -1.299206, 1, 0, 0, 1, 1,
0.8260216, 0.4311859, 2.109736, 1, 0, 0, 1, 1,
0.8274293, -0.6615341, 2.707622, 1, 0, 0, 1, 1,
0.828258, -0.4244711, 1.472765, 0, 0, 0, 1, 1,
0.8330233, 0.2497667, -1.731869, 0, 0, 0, 1, 1,
0.8344736, -0.9324308, 3.569645, 0, 0, 0, 1, 1,
0.8398588, 1.518161, 1.524873, 0, 0, 0, 1, 1,
0.8446307, -1.0645, 2.241918, 0, 0, 0, 1, 1,
0.846575, -1.093023, 1.949898, 0, 0, 0, 1, 1,
0.8478222, 0.7657721, 0.6372658, 0, 0, 0, 1, 1,
0.8603675, 0.3748057, 2.00426, 1, 1, 1, 1, 1,
0.8643893, 0.1484474, -0.998068, 1, 1, 1, 1, 1,
0.8680001, -1.283321, 2.850655, 1, 1, 1, 1, 1,
0.8684908, 0.4021819, 0.7552059, 1, 1, 1, 1, 1,
0.8687012, -0.8499747, 2.062777, 1, 1, 1, 1, 1,
0.8702536, -1.306117, 3.34902, 1, 1, 1, 1, 1,
0.8704918, -0.006223282, 1.258781, 1, 1, 1, 1, 1,
0.8711131, 1.021932, 1.402274, 1, 1, 1, 1, 1,
0.8766052, 0.1298317, 2.141551, 1, 1, 1, 1, 1,
0.87936, -0.423093, 2.081138, 1, 1, 1, 1, 1,
0.8807625, 2.060363, -0.625039, 1, 1, 1, 1, 1,
0.8823234, 1.932688, -0.3419662, 1, 1, 1, 1, 1,
0.8888972, 0.08732545, 3.316265, 1, 1, 1, 1, 1,
0.8910179, -0.8138544, 4.969066, 1, 1, 1, 1, 1,
0.8953293, -0.6615033, 2.716473, 1, 1, 1, 1, 1,
0.8969862, 0.5380739, 1.652816, 0, 0, 1, 1, 1,
0.8998871, 1.175847, 1.978849, 1, 0, 0, 1, 1,
0.9021235, -0.3872402, 0.5985518, 1, 0, 0, 1, 1,
0.902739, 1.411512, 1.458426, 1, 0, 0, 1, 1,
0.9053973, -0.582911, 1.399829, 1, 0, 0, 1, 1,
0.9084252, -1.239439, 1.636163, 1, 0, 0, 1, 1,
0.9297316, -0.08697111, 2.16578, 0, 0, 0, 1, 1,
0.9336683, -0.631819, 3.69954, 0, 0, 0, 1, 1,
0.9364843, 0.1820054, 1.578361, 0, 0, 0, 1, 1,
0.9423656, -0.4298735, 2.061762, 0, 0, 0, 1, 1,
0.9434549, -1.774801, 2.608382, 0, 0, 0, 1, 1,
0.9440526, -0.5683247, 1.922566, 0, 0, 0, 1, 1,
0.9454936, 0.06611727, 0.9935295, 0, 0, 0, 1, 1,
0.947975, -0.9650193, 1.645152, 1, 1, 1, 1, 1,
0.9540687, -0.1993939, 1.663081, 1, 1, 1, 1, 1,
0.9549464, 0.29907, 2.017734, 1, 1, 1, 1, 1,
0.9553899, -1.927937, 3.907946, 1, 1, 1, 1, 1,
0.9558734, -0.8165444, 0.742573, 1, 1, 1, 1, 1,
0.9601423, -1.106188, 2.657993, 1, 1, 1, 1, 1,
0.9623023, -0.9535435, 1.915938, 1, 1, 1, 1, 1,
0.9627119, 1.691944, -0.4781367, 1, 1, 1, 1, 1,
0.9629021, 0.27425, 1.787847, 1, 1, 1, 1, 1,
0.9754559, -1.347799, 2.160412, 1, 1, 1, 1, 1,
0.9834176, 0.8151771, 1.394529, 1, 1, 1, 1, 1,
0.9839333, -1.595752, 3.302015, 1, 1, 1, 1, 1,
0.9904835, 0.03787803, 1.59866, 1, 1, 1, 1, 1,
0.9924523, 0.1321226, 1.678468, 1, 1, 1, 1, 1,
0.9928166, -1.171824, 1.991769, 1, 1, 1, 1, 1,
0.994444, 0.4268685, 0.8505038, 0, 0, 1, 1, 1,
0.9976742, -1.135855, 2.254576, 1, 0, 0, 1, 1,
0.9977472, -0.4060573, 1.115234, 1, 0, 0, 1, 1,
0.9992492, 0.03242924, 1.625508, 1, 0, 0, 1, 1,
0.9997588, 0.2544611, -0.09221429, 1, 0, 0, 1, 1,
1.003857, 1.263883, 1.643958, 1, 0, 0, 1, 1,
1.007859, 0.9951361, 0.7910133, 0, 0, 0, 1, 1,
1.020317, -0.4396923, 1.449364, 0, 0, 0, 1, 1,
1.028585, 0.3749408, 0.9265306, 0, 0, 0, 1, 1,
1.02926, -1.196373, 3.563858, 0, 0, 0, 1, 1,
1.036018, -0.7498513, 2.027903, 0, 0, 0, 1, 1,
1.043413, 0.7079722, 0.01743354, 0, 0, 0, 1, 1,
1.050657, -1.330666, 1.250402, 0, 0, 0, 1, 1,
1.05173, -1.042288, 2.33728, 1, 1, 1, 1, 1,
1.05259, 1.320763, 1.40724, 1, 1, 1, 1, 1,
1.060587, 1.391221, 2.053379, 1, 1, 1, 1, 1,
1.06603, -1.030199, 1.949022, 1, 1, 1, 1, 1,
1.06829, -0.2241485, 1.797287, 1, 1, 1, 1, 1,
1.070495, 1.030801, 1.216621, 1, 1, 1, 1, 1,
1.071779, 1.30142, -1.390144, 1, 1, 1, 1, 1,
1.072524, -0.5981366, 3.441326, 1, 1, 1, 1, 1,
1.075408, -1.92005, 1.293219, 1, 1, 1, 1, 1,
1.076036, 0.08651872, 1.742618, 1, 1, 1, 1, 1,
1.085956, 0.5889499, 2.030662, 1, 1, 1, 1, 1,
1.086027, 0.9796591, 1.042506, 1, 1, 1, 1, 1,
1.091801, 0.894586, 0.223463, 1, 1, 1, 1, 1,
1.094033, -1.454211, 4.210578, 1, 1, 1, 1, 1,
1.095291, 0.529086, -0.05569431, 1, 1, 1, 1, 1,
1.101693, 0.7762352, 0.5301037, 0, 0, 1, 1, 1,
1.103292, -0.582302, 2.209753, 1, 0, 0, 1, 1,
1.105563, -1.25797, 2.409117, 1, 0, 0, 1, 1,
1.113232, -1.090885, 0.3588528, 1, 0, 0, 1, 1,
1.116086, -1.458233, 2.791802, 1, 0, 0, 1, 1,
1.128375, 0.1181486, 1.338557, 1, 0, 0, 1, 1,
1.12923, -0.5606925, 2.507695, 0, 0, 0, 1, 1,
1.130594, 0.7908446, 0.8456046, 0, 0, 0, 1, 1,
1.143079, -0.1079418, 2.525699, 0, 0, 0, 1, 1,
1.143532, 1.425462, 0.2236618, 0, 0, 0, 1, 1,
1.14497, -0.06985477, 0.06924938, 0, 0, 0, 1, 1,
1.14652, 0.0558559, 2.047816, 0, 0, 0, 1, 1,
1.149052, -0.6541869, 1.715261, 0, 0, 0, 1, 1,
1.158052, 0.5313827, -0.6524586, 1, 1, 1, 1, 1,
1.158545, -0.6996694, 2.817977, 1, 1, 1, 1, 1,
1.164228, -1.791376, 3.039067, 1, 1, 1, 1, 1,
1.16982, 0.8164354, 2.669406, 1, 1, 1, 1, 1,
1.171737, -0.01815841, 0.02696177, 1, 1, 1, 1, 1,
1.179072, 0.4211862, 0.7947929, 1, 1, 1, 1, 1,
1.181503, 1.500188, 1.866626, 1, 1, 1, 1, 1,
1.182408, 1.502196, 0.9078476, 1, 1, 1, 1, 1,
1.185601, -0.7624156, 2.073932, 1, 1, 1, 1, 1,
1.186266, 0.2060454, 1.919742, 1, 1, 1, 1, 1,
1.189434, 0.4707094, 0.9121385, 1, 1, 1, 1, 1,
1.193137, 0.06536925, 2.137993, 1, 1, 1, 1, 1,
1.19489, 0.7195421, 1.265465, 1, 1, 1, 1, 1,
1.199144, -0.3261234, 0.3541389, 1, 1, 1, 1, 1,
1.211646, -0.7125798, 2.912, 1, 1, 1, 1, 1,
1.213064, -1.103662, 3.489394, 0, 0, 1, 1, 1,
1.221499, -1.18494, 2.472184, 1, 0, 0, 1, 1,
1.247923, 0.4851227, 1.762402, 1, 0, 0, 1, 1,
1.250673, -0.5879914, 1.903306, 1, 0, 0, 1, 1,
1.251082, -1.400962, 2.573217, 1, 0, 0, 1, 1,
1.251765, -1.254781, 2.093273, 1, 0, 0, 1, 1,
1.252519, 0.2981426, 0.7203517, 0, 0, 0, 1, 1,
1.253827, 0.7501309, -0.3741456, 0, 0, 0, 1, 1,
1.255299, -0.6676956, 2.820697, 0, 0, 0, 1, 1,
1.259381, 0.130358, 2.74895, 0, 0, 0, 1, 1,
1.26335, -0.2708713, 1.214596, 0, 0, 0, 1, 1,
1.267147, -0.4312057, 2.175638, 0, 0, 0, 1, 1,
1.278388, -0.274151, 0.355145, 0, 0, 0, 1, 1,
1.283586, -0.5948148, 1.458755, 1, 1, 1, 1, 1,
1.287981, 1.025112, -0.4159059, 1, 1, 1, 1, 1,
1.29653, 0.9727283, 2.160838, 1, 1, 1, 1, 1,
1.29795, 0.8670718, -0.1765852, 1, 1, 1, 1, 1,
1.303139, 0.2553931, 1.83801, 1, 1, 1, 1, 1,
1.310856, 0.1020491, 1.05903, 1, 1, 1, 1, 1,
1.311671, -1.407884, 2.647997, 1, 1, 1, 1, 1,
1.317085, 0.7840077, -1.01974, 1, 1, 1, 1, 1,
1.319442, -0.4444528, 2.494842, 1, 1, 1, 1, 1,
1.320723, 0.3126751, 0.6575357, 1, 1, 1, 1, 1,
1.321988, -0.6491047, 1.962776, 1, 1, 1, 1, 1,
1.327726, -0.4480155, 2.14603, 1, 1, 1, 1, 1,
1.328529, -1.731892, 0.5862205, 1, 1, 1, 1, 1,
1.329767, -0.7940012, 1.060181, 1, 1, 1, 1, 1,
1.336701, -0.6796947, 2.20817, 1, 1, 1, 1, 1,
1.343248, -0.3759084, 2.744316, 0, 0, 1, 1, 1,
1.345488, -1.179354, 2.076039, 1, 0, 0, 1, 1,
1.357604, -0.617402, 3.29383, 1, 0, 0, 1, 1,
1.36265, 0.2681891, -0.2718461, 1, 0, 0, 1, 1,
1.373838, 0.355339, 2.696226, 1, 0, 0, 1, 1,
1.39285, 1.171679, 1.739814, 1, 0, 0, 1, 1,
1.394439, -0.2840143, 0.7543257, 0, 0, 0, 1, 1,
1.396853, -0.8224279, 1.45856, 0, 0, 0, 1, 1,
1.397741, -0.971872, 3.24047, 0, 0, 0, 1, 1,
1.409259, 0.6584877, 0.5269465, 0, 0, 0, 1, 1,
1.409437, 1.591061, -0.1080508, 0, 0, 0, 1, 1,
1.418256, -0.4316717, 0.9310548, 0, 0, 0, 1, 1,
1.434626, -1.289049, 2.598191, 0, 0, 0, 1, 1,
1.443821, -0.205055, 1.548225, 1, 1, 1, 1, 1,
1.447375, 0.7079628, 0.1484077, 1, 1, 1, 1, 1,
1.47085, 1.019114, 0.6884404, 1, 1, 1, 1, 1,
1.477963, 1.525263, 1.70598, 1, 1, 1, 1, 1,
1.479837, -1.609826, 1.757043, 1, 1, 1, 1, 1,
1.498558, -0.6074592, 3.054738, 1, 1, 1, 1, 1,
1.514972, -1.322046, 1.664828, 1, 1, 1, 1, 1,
1.525186, 0.8951079, 1.21884, 1, 1, 1, 1, 1,
1.53684, -0.5612802, 2.597193, 1, 1, 1, 1, 1,
1.546606, -1.886971, 2.828909, 1, 1, 1, 1, 1,
1.555983, -0.2411423, 2.603456, 1, 1, 1, 1, 1,
1.573268, -0.01036552, 1.516352, 1, 1, 1, 1, 1,
1.58087, 0.4643883, 0.1335409, 1, 1, 1, 1, 1,
1.586352, -0.2778874, 0.3483145, 1, 1, 1, 1, 1,
1.614094, 0.1750616, -0.706008, 1, 1, 1, 1, 1,
1.624804, 0.2212604, 0.7647098, 0, 0, 1, 1, 1,
1.625088, 0.8350713, -0.7564266, 1, 0, 0, 1, 1,
1.63988, 0.2541931, 2.125273, 1, 0, 0, 1, 1,
1.656415, 0.9265949, 2.102896, 1, 0, 0, 1, 1,
1.658101, 0.3193267, 2.404989, 1, 0, 0, 1, 1,
1.665112, 1.336996, 1.674765, 1, 0, 0, 1, 1,
1.712682, 0.5679211, 0.4532462, 0, 0, 0, 1, 1,
1.71909, -0.1335848, -0.3856875, 0, 0, 0, 1, 1,
1.733924, -0.4689181, 2.18653, 0, 0, 0, 1, 1,
1.759444, -0.9825099, 2.660609, 0, 0, 0, 1, 1,
1.761722, 1.585653, 1.765335, 0, 0, 0, 1, 1,
1.781466, 2.146222, 0.4081916, 0, 0, 0, 1, 1,
1.794236, 1.411183, 1.291015, 0, 0, 0, 1, 1,
1.794358, -1.809726, 3.029991, 1, 1, 1, 1, 1,
1.799467, -0.3718187, 1.020422, 1, 1, 1, 1, 1,
1.804824, 1.264814, 0.3818707, 1, 1, 1, 1, 1,
1.813558, -0.6946647, 0.130326, 1, 1, 1, 1, 1,
1.813882, -0.9129023, 2.085259, 1, 1, 1, 1, 1,
1.823129, -0.5319039, 1.089581, 1, 1, 1, 1, 1,
1.8322, -1.633035, 3.188848, 1, 1, 1, 1, 1,
1.840711, -0.8686123, 2.530594, 1, 1, 1, 1, 1,
1.86365, -0.2435365, 2.085677, 1, 1, 1, 1, 1,
1.87221, -0.6928918, 0.9538175, 1, 1, 1, 1, 1,
1.898212, -2.852455, 2.858791, 1, 1, 1, 1, 1,
1.925114, 0.1521004, 0.6556483, 1, 1, 1, 1, 1,
1.939075, -0.5985129, 1.411673, 1, 1, 1, 1, 1,
1.949049, -0.9742939, 2.218374, 1, 1, 1, 1, 1,
1.96986, 0.4520304, 1.28229, 1, 1, 1, 1, 1,
1.97643, -2.412959, 2.60373, 0, 0, 1, 1, 1,
1.993721, -0.8086818, 1.097863, 1, 0, 0, 1, 1,
2.01983, 0.210332, 0.7555619, 1, 0, 0, 1, 1,
2.063522, 0.7651214, 1.236298, 1, 0, 0, 1, 1,
2.103263, 1.024616, 2.075901, 1, 0, 0, 1, 1,
2.165848, -0.4365982, 1.845283, 1, 0, 0, 1, 1,
2.191839, 0.6058648, 2.168652, 0, 0, 0, 1, 1,
2.226468, 0.4058899, 2.527861, 0, 0, 0, 1, 1,
2.227999, 0.2951574, 1.966949, 0, 0, 0, 1, 1,
2.264606, 0.65763, 0.7197402, 0, 0, 0, 1, 1,
2.280361, 0.7199926, 1.893829, 0, 0, 0, 1, 1,
2.282023, -2.218357, 2.124598, 0, 0, 0, 1, 1,
2.298433, 0.7642978, 2.530897, 0, 0, 0, 1, 1,
2.48909, -1.037235, 0.9607273, 1, 1, 1, 1, 1,
2.677899, 0.2665049, 3.067213, 1, 1, 1, 1, 1,
2.862961, -1.94482, 1.842727, 1, 1, 1, 1, 1,
2.975922, 0.5863961, 0.3093306, 1, 1, 1, 1, 1,
3.024073, -0.4862672, 1.435989, 1, 1, 1, 1, 1,
3.070605, -0.9630232, 2.154984, 1, 1, 1, 1, 1,
3.622725, -0.7377877, 3.079405, 1, 1, 1, 1, 1
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
var radius = 10.21487;
var distance = 35.87929;
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
mvMatrix.translate( 0.004808187, -0.2700313, -0.1621745 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.87929);
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
