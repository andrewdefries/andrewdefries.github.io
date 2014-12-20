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
-2.723409, 1.469928, -1.215813, 1, 0, 0, 1,
-2.570168, 0.4880225, -1.045507, 1, 0.007843138, 0, 1,
-2.486085, -0.5429673, -2.658639, 1, 0.01176471, 0, 1,
-2.427418, 0.1078174, -1.192741, 1, 0.01960784, 0, 1,
-2.3858, -0.7351141, -2.712416, 1, 0.02352941, 0, 1,
-2.243635, -1.487189, -0.7171697, 1, 0.03137255, 0, 1,
-2.23432, -1.562738, -1.242856, 1, 0.03529412, 0, 1,
-2.191001, 1.361074, -0.6229854, 1, 0.04313726, 0, 1,
-2.178772, -0.03229742, -1.645362, 1, 0.04705882, 0, 1,
-2.162636, -1.849197, -4.117112, 1, 0.05490196, 0, 1,
-2.160129, 1.192513, 1.28463, 1, 0.05882353, 0, 1,
-2.142691, -1.050787, -2.225131, 1, 0.06666667, 0, 1,
-2.135615, 0.8314363, -0.8749284, 1, 0.07058824, 0, 1,
-2.126316, -0.8176974, -2.213944, 1, 0.07843138, 0, 1,
-2.086082, 0.4519422, -1.515495, 1, 0.08235294, 0, 1,
-2.081469, -1.329658, -1.676912, 1, 0.09019608, 0, 1,
-2.06848, 1.996053, -0.2845593, 1, 0.09411765, 0, 1,
-2.062856, -1.016586, -0.3843667, 1, 0.1019608, 0, 1,
-2.011894, 0.01085604, -1.813643, 1, 0.1098039, 0, 1,
-1.978355, 0.02750683, -2.634363, 1, 0.1137255, 0, 1,
-1.970159, 0.1977299, -1.685183, 1, 0.1215686, 0, 1,
-1.944771, -0.2790786, 0.1172418, 1, 0.1254902, 0, 1,
-1.940498, 2.215446, -1.542388, 1, 0.1333333, 0, 1,
-1.915799, 0.8558431, -0.6747269, 1, 0.1372549, 0, 1,
-1.887839, -0.9545826, -1.094246, 1, 0.145098, 0, 1,
-1.885401, 0.1509484, -2.042233, 1, 0.1490196, 0, 1,
-1.86818, 2.267838, -1.59765, 1, 0.1568628, 0, 1,
-1.861631, -0.6613753, -2.254721, 1, 0.1607843, 0, 1,
-1.848703, 0.5237414, -2.485309, 1, 0.1686275, 0, 1,
-1.811456, -0.2566473, -2.127043, 1, 0.172549, 0, 1,
-1.797398, 0.8964221, -2.018871, 1, 0.1803922, 0, 1,
-1.794318, 1.24942, -0.04571174, 1, 0.1843137, 0, 1,
-1.786742, 0.3493918, -0.2365997, 1, 0.1921569, 0, 1,
-1.785067, -0.3859614, -2.481517, 1, 0.1960784, 0, 1,
-1.760659, -0.1661676, -1.986493, 1, 0.2039216, 0, 1,
-1.739, 0.2549319, -0.9271493, 1, 0.2117647, 0, 1,
-1.732566, 1.426215, 0.5558246, 1, 0.2156863, 0, 1,
-1.721623, 0.6432481, -2.557647, 1, 0.2235294, 0, 1,
-1.704942, 1.331647, -0.7390322, 1, 0.227451, 0, 1,
-1.697264, 0.6574131, -0.8080646, 1, 0.2352941, 0, 1,
-1.658006, -0.5558819, -1.888144, 1, 0.2392157, 0, 1,
-1.652752, -0.7655184, -2.802989, 1, 0.2470588, 0, 1,
-1.641724, 0.9634389, -0.01482094, 1, 0.2509804, 0, 1,
-1.641012, -0.6900065, -4.528572, 1, 0.2588235, 0, 1,
-1.636645, 0.5972282, -0.1614697, 1, 0.2627451, 0, 1,
-1.620525, -0.4267779, -0.6643987, 1, 0.2705882, 0, 1,
-1.619793, -1.543358, -2.152685, 1, 0.2745098, 0, 1,
-1.609945, 0.5838754, -0.4251673, 1, 0.282353, 0, 1,
-1.595217, -2.193195, -2.519925, 1, 0.2862745, 0, 1,
-1.58882, -0.01620127, -2.566871, 1, 0.2941177, 0, 1,
-1.567159, -1.768741, -2.221241, 1, 0.3019608, 0, 1,
-1.561951, -0.1046246, -0.6941977, 1, 0.3058824, 0, 1,
-1.555223, -2.19021, -2.388997, 1, 0.3137255, 0, 1,
-1.554558, -2.165913, -2.117384, 1, 0.3176471, 0, 1,
-1.550929, 1.6677, -0.8657479, 1, 0.3254902, 0, 1,
-1.550214, -0.2106599, -2.31515, 1, 0.3294118, 0, 1,
-1.548478, 0.7979449, -0.913512, 1, 0.3372549, 0, 1,
-1.545896, -2.584201, -2.530926, 1, 0.3411765, 0, 1,
-1.545336, 0.02419703, -1.354163, 1, 0.3490196, 0, 1,
-1.544633, -0.1260847, -0.5457702, 1, 0.3529412, 0, 1,
-1.541896, -0.6378787, -1.524777, 1, 0.3607843, 0, 1,
-1.54141, -0.2454086, -2.344795, 1, 0.3647059, 0, 1,
-1.52553, -1.136247, -1.96028, 1, 0.372549, 0, 1,
-1.519715, 0.1628099, -1.639161, 1, 0.3764706, 0, 1,
-1.510014, 1.915512, -0.9162924, 1, 0.3843137, 0, 1,
-1.487547, 0.8388764, -1.311707, 1, 0.3882353, 0, 1,
-1.476269, -0.05556951, -0.6685317, 1, 0.3960784, 0, 1,
-1.474583, 1.889649, -1.676294, 1, 0.4039216, 0, 1,
-1.473531, -1.621397, -1.347343, 1, 0.4078431, 0, 1,
-1.471612, 0.7487852, -2.498277, 1, 0.4156863, 0, 1,
-1.468979, -0.0784156, -1.040338, 1, 0.4196078, 0, 1,
-1.468331, -0.3728501, -2.289323, 1, 0.427451, 0, 1,
-1.456039, 0.9133076, -1.746162, 1, 0.4313726, 0, 1,
-1.44526, 0.5099086, -0.2119744, 1, 0.4392157, 0, 1,
-1.439579, -0.4244936, -2.20678, 1, 0.4431373, 0, 1,
-1.428354, -1.348133, -2.437596, 1, 0.4509804, 0, 1,
-1.419902, 1.362067, -0.7192941, 1, 0.454902, 0, 1,
-1.411437, -0.08304001, -1.531174, 1, 0.4627451, 0, 1,
-1.411371, -1.513491, -1.612863, 1, 0.4666667, 0, 1,
-1.405946, -0.7843236, -1.054405, 1, 0.4745098, 0, 1,
-1.402134, -0.4706367, -3.815093, 1, 0.4784314, 0, 1,
-1.395258, -0.2604178, -2.952779, 1, 0.4862745, 0, 1,
-1.384466, -1.179547, -2.69804, 1, 0.4901961, 0, 1,
-1.374618, 1.714038, 0.3057857, 1, 0.4980392, 0, 1,
-1.374266, 1.524976, 0.4619145, 1, 0.5058824, 0, 1,
-1.369238, 0.8323722, -1.224503, 1, 0.509804, 0, 1,
-1.367001, 0.01546924, -0.6636656, 1, 0.5176471, 0, 1,
-1.363298, -1.368948, -2.172092, 1, 0.5215687, 0, 1,
-1.360828, -1.613839, -3.033743, 1, 0.5294118, 0, 1,
-1.360788, -0.8756779, -2.765541, 1, 0.5333334, 0, 1,
-1.351653, -0.9272438, -1.498237, 1, 0.5411765, 0, 1,
-1.345675, -1.272446, -1.7376, 1, 0.5450981, 0, 1,
-1.33355, -1.042945, -3.051509, 1, 0.5529412, 0, 1,
-1.329865, -0.8794516, -1.371195, 1, 0.5568628, 0, 1,
-1.328614, -0.3655609, -2.4472, 1, 0.5647059, 0, 1,
-1.323754, -0.1203581, -0.2167025, 1, 0.5686275, 0, 1,
-1.322423, 0.3128629, 0.325782, 1, 0.5764706, 0, 1,
-1.311689, -0.8562531, -1.853919, 1, 0.5803922, 0, 1,
-1.306631, 0.07322134, -2.240219, 1, 0.5882353, 0, 1,
-1.305873, 0.8145858, -0.8051468, 1, 0.5921569, 0, 1,
-1.301815, 0.02335198, -2.402516, 1, 0.6, 0, 1,
-1.300431, -0.9806734, -1.928568, 1, 0.6078432, 0, 1,
-1.279076, 0.2158649, -1.519104, 1, 0.6117647, 0, 1,
-1.274605, 0.01802817, -2.027083, 1, 0.6196079, 0, 1,
-1.270887, -0.122391, -1.52083, 1, 0.6235294, 0, 1,
-1.267569, 0.4553235, 1.601133, 1, 0.6313726, 0, 1,
-1.260968, 1.928311, -3.06812, 1, 0.6352941, 0, 1,
-1.251122, -0.9441463, -1.013331, 1, 0.6431373, 0, 1,
-1.248894, 0.4309089, -0.07258938, 1, 0.6470588, 0, 1,
-1.245277, 0.1312009, -0.9372007, 1, 0.654902, 0, 1,
-1.226765, 0.6653659, -0.5786161, 1, 0.6588235, 0, 1,
-1.225729, 0.6401429, -0.6704095, 1, 0.6666667, 0, 1,
-1.221753, -1.777943, -1.072625, 1, 0.6705883, 0, 1,
-1.194112, -0.2421202, -2.184004, 1, 0.6784314, 0, 1,
-1.192017, 1.581465, -0.9914259, 1, 0.682353, 0, 1,
-1.188296, 0.1756918, -2.04395, 1, 0.6901961, 0, 1,
-1.187988, 0.2050663, -1.285386, 1, 0.6941177, 0, 1,
-1.183697, -0.06499602, -1.932131, 1, 0.7019608, 0, 1,
-1.183562, 1.301824, 0.4049542, 1, 0.7098039, 0, 1,
-1.180493, 1.126865, 1.543176, 1, 0.7137255, 0, 1,
-1.168567, -1.044173, -3.567829, 1, 0.7215686, 0, 1,
-1.16592, 0.1648804, -0.8745633, 1, 0.7254902, 0, 1,
-1.161066, 0.1812802, 0.3694799, 1, 0.7333333, 0, 1,
-1.159293, -0.1503902, -0.9151692, 1, 0.7372549, 0, 1,
-1.147607, 0.3901461, -2.586072, 1, 0.7450981, 0, 1,
-1.144369, 0.32774, -2.444515, 1, 0.7490196, 0, 1,
-1.137776, 0.9863735, 1.267482, 1, 0.7568628, 0, 1,
-1.126883, -0.3971988, -3.578525, 1, 0.7607843, 0, 1,
-1.122207, 0.841667, 0.3829797, 1, 0.7686275, 0, 1,
-1.11719, 0.3456867, -1.733299, 1, 0.772549, 0, 1,
-1.116027, -1.887334, -3.063907, 1, 0.7803922, 0, 1,
-1.112865, -1.871997, -2.625952, 1, 0.7843137, 0, 1,
-1.111514, -0.006489383, -2.527574, 1, 0.7921569, 0, 1,
-1.101672, 1.148145, -1.376933, 1, 0.7960784, 0, 1,
-1.101339, 0.1100607, -1.529408, 1, 0.8039216, 0, 1,
-1.099405, -1.826001, -3.813952, 1, 0.8117647, 0, 1,
-1.099305, 0.9151914, 0.320582, 1, 0.8156863, 0, 1,
-1.09898, -0.188917, -0.5355621, 1, 0.8235294, 0, 1,
-1.098772, -0.4467648, -1.862903, 1, 0.827451, 0, 1,
-1.094352, -0.1359583, -0.8650905, 1, 0.8352941, 0, 1,
-1.091526, -0.2630512, -1.495282, 1, 0.8392157, 0, 1,
-1.082246, 0.4190498, -1.12171, 1, 0.8470588, 0, 1,
-1.077182, -1.881009, -2.844701, 1, 0.8509804, 0, 1,
-1.073849, -0.7317895, -2.550879, 1, 0.8588235, 0, 1,
-1.070423, -1.061278, -2.340932, 1, 0.8627451, 0, 1,
-1.068553, -0.2669444, -1.65143, 1, 0.8705882, 0, 1,
-1.060995, -0.9534389, -2.574304, 1, 0.8745098, 0, 1,
-1.046744, -1.154756, -0.8821311, 1, 0.8823529, 0, 1,
-1.044457, -0.3386876, -4.931518, 1, 0.8862745, 0, 1,
-1.042453, 2.2614, -1.73399, 1, 0.8941177, 0, 1,
-1.035912, 0.2253113, -1.057823, 1, 0.8980392, 0, 1,
-1.032354, 1.358106, -0.4794797, 1, 0.9058824, 0, 1,
-1.031921, -1.427789, -2.925126, 1, 0.9137255, 0, 1,
-1.031835, 1.538117, -2.387798, 1, 0.9176471, 0, 1,
-1.025177, -1.012098, -2.3762, 1, 0.9254902, 0, 1,
-1.023454, 1.340238, -0.6905963, 1, 0.9294118, 0, 1,
-1.023231, 0.3057702, -1.001884, 1, 0.9372549, 0, 1,
-1.012144, 1.235745, 0.2944448, 1, 0.9411765, 0, 1,
-1.005777, 0.4783711, -1.484065, 1, 0.9490196, 0, 1,
-1.002575, -0.2705469, -1.609602, 1, 0.9529412, 0, 1,
-1.00163, -0.3809531, -3.201019, 1, 0.9607843, 0, 1,
-1.000395, -0.6920658, -2.909882, 1, 0.9647059, 0, 1,
-0.9934376, 0.9565701, -1.507186, 1, 0.972549, 0, 1,
-0.9896979, -1.566008, -3.822302, 1, 0.9764706, 0, 1,
-0.9890496, 1.267804, -2.453252, 1, 0.9843137, 0, 1,
-0.9807999, -0.4156214, -2.886793, 1, 0.9882353, 0, 1,
-0.9781952, 0.6072226, 0.2700083, 1, 0.9960784, 0, 1,
-0.9768183, -0.1032714, -2.013585, 0.9960784, 1, 0, 1,
-0.9711878, -0.6741661, -2.288932, 0.9921569, 1, 0, 1,
-0.966248, 0.5589572, -2.062079, 0.9843137, 1, 0, 1,
-0.9657984, -1.003936, -3.509728, 0.9803922, 1, 0, 1,
-0.9626678, 1.959975, -0.06173369, 0.972549, 1, 0, 1,
-0.9483066, 0.2181692, -1.112359, 0.9686275, 1, 0, 1,
-0.9454084, -0.965565, -2.59578, 0.9607843, 1, 0, 1,
-0.9434596, 0.5726926, -0.5340275, 0.9568627, 1, 0, 1,
-0.9359344, 0.8981445, -2.451496, 0.9490196, 1, 0, 1,
-0.9326087, -0.2763411, -2.965587, 0.945098, 1, 0, 1,
-0.9184891, 1.846498, -1.471572, 0.9372549, 1, 0, 1,
-0.9179754, 0.07774789, -1.010371, 0.9333333, 1, 0, 1,
-0.9121113, 1.889101, 0.05517164, 0.9254902, 1, 0, 1,
-0.9065187, 0.2374928, -0.3534395, 0.9215686, 1, 0, 1,
-0.9009059, -1.942, -2.51317, 0.9137255, 1, 0, 1,
-0.8997637, -0.5714425, -3.352427, 0.9098039, 1, 0, 1,
-0.897743, -0.2021388, -1.706661, 0.9019608, 1, 0, 1,
-0.893927, -1.095798, -1.396417, 0.8941177, 1, 0, 1,
-0.8914642, 0.8295143, -1.412698, 0.8901961, 1, 0, 1,
-0.8892164, -1.101576, -1.568648, 0.8823529, 1, 0, 1,
-0.8850072, -0.3156376, -0.9796413, 0.8784314, 1, 0, 1,
-0.8671116, 0.2834338, 2.334856, 0.8705882, 1, 0, 1,
-0.866092, 0.4040931, -0.3501133, 0.8666667, 1, 0, 1,
-0.8655978, -0.1786701, -0.9210246, 0.8588235, 1, 0, 1,
-0.8607922, -1.050039, -1.794323, 0.854902, 1, 0, 1,
-0.8607312, 1.142657, -1.690748, 0.8470588, 1, 0, 1,
-0.8575056, 1.717748, 0.5752543, 0.8431373, 1, 0, 1,
-0.857413, -0.4966697, -3.045804, 0.8352941, 1, 0, 1,
-0.857344, 0.1625393, 0.2754193, 0.8313726, 1, 0, 1,
-0.8563351, 2.651266, -0.03805198, 0.8235294, 1, 0, 1,
-0.855742, -0.05681175, -3.221544, 0.8196079, 1, 0, 1,
-0.8483291, -1.588931, -1.37168, 0.8117647, 1, 0, 1,
-0.8473865, 0.488997, -2.061457, 0.8078431, 1, 0, 1,
-0.8376801, 0.3701258, -1.404311, 0.8, 1, 0, 1,
-0.8299658, 0.6630024, -0.6910865, 0.7921569, 1, 0, 1,
-0.8296483, 0.6856505, -2.455499, 0.7882353, 1, 0, 1,
-0.8260409, -1.519995, -3.027441, 0.7803922, 1, 0, 1,
-0.8177114, 1.728464, -0.1085879, 0.7764706, 1, 0, 1,
-0.8160927, -0.08649823, -0.7735342, 0.7686275, 1, 0, 1,
-0.8097967, 0.5895805, -0.4413526, 0.7647059, 1, 0, 1,
-0.8063958, 0.6733922, 0.5201622, 0.7568628, 1, 0, 1,
-0.8051405, -1.019382, -1.974847, 0.7529412, 1, 0, 1,
-0.8039299, 0.5114128, -1.192161, 0.7450981, 1, 0, 1,
-0.7995805, -0.006880398, -1.855292, 0.7411765, 1, 0, 1,
-0.7990068, 0.7514311, 0.4797601, 0.7333333, 1, 0, 1,
-0.7948844, 1.076868, -0.7424876, 0.7294118, 1, 0, 1,
-0.7931108, 1.541107, -0.9467199, 0.7215686, 1, 0, 1,
-0.7880983, 0.4987465, -2.057886, 0.7176471, 1, 0, 1,
-0.7865436, 1.768296, -0.5771385, 0.7098039, 1, 0, 1,
-0.7825171, 1.104174, -1.916513, 0.7058824, 1, 0, 1,
-0.7819015, 1.645339, -0.0341047, 0.6980392, 1, 0, 1,
-0.7815589, -0.4335043, -5.008658, 0.6901961, 1, 0, 1,
-0.7802924, -0.2842938, -1.069032, 0.6862745, 1, 0, 1,
-0.7747721, -0.1043713, -1.653415, 0.6784314, 1, 0, 1,
-0.7724116, -0.5154063, -2.749783, 0.6745098, 1, 0, 1,
-0.7677246, -0.9854815, -1.395925, 0.6666667, 1, 0, 1,
-0.7588273, 0.9866691, -0.1029315, 0.6627451, 1, 0, 1,
-0.7586215, 0.3525835, -0.6270836, 0.654902, 1, 0, 1,
-0.7577783, 0.1151419, -1.695628, 0.6509804, 1, 0, 1,
-0.7550316, 0.2721833, -1.066777, 0.6431373, 1, 0, 1,
-0.754842, 2.35614, 1.457986, 0.6392157, 1, 0, 1,
-0.7518145, -0.02362464, -1.722157, 0.6313726, 1, 0, 1,
-0.7513462, -0.7847453, -3.678128, 0.627451, 1, 0, 1,
-0.744446, 0.03319094, -1.875515, 0.6196079, 1, 0, 1,
-0.7319112, -0.416389, -1.412096, 0.6156863, 1, 0, 1,
-0.7267846, -2.617167, 0.6984338, 0.6078432, 1, 0, 1,
-0.7260628, 0.4580242, -0.1117071, 0.6039216, 1, 0, 1,
-0.7254775, -1.598017, -3.025543, 0.5960785, 1, 0, 1,
-0.7244116, -1.364523, -3.170188, 0.5882353, 1, 0, 1,
-0.723215, -1.556421, -2.311177, 0.5843138, 1, 0, 1,
-0.7216774, -0.6190431, -3.253525, 0.5764706, 1, 0, 1,
-0.7202296, 0.02024388, -1.234701, 0.572549, 1, 0, 1,
-0.719307, 1.40273, -0.7762201, 0.5647059, 1, 0, 1,
-0.7156317, -1.911797, -2.467427, 0.5607843, 1, 0, 1,
-0.712261, 1.172855, -0.8917158, 0.5529412, 1, 0, 1,
-0.711938, -1.09349, -3.839906, 0.5490196, 1, 0, 1,
-0.7113163, 0.9533726, -1.089836, 0.5411765, 1, 0, 1,
-0.7066882, -2.189998, -3.521419, 0.5372549, 1, 0, 1,
-0.6935349, -0.5578119, -1.425946, 0.5294118, 1, 0, 1,
-0.6918754, -0.4106387, -2.536914, 0.5254902, 1, 0, 1,
-0.6902454, 1.447796, -0.2315582, 0.5176471, 1, 0, 1,
-0.6879053, -1.384368, -1.801672, 0.5137255, 1, 0, 1,
-0.6871896, -1.158056, -2.789469, 0.5058824, 1, 0, 1,
-0.6855587, 0.6625362, -0.9362774, 0.5019608, 1, 0, 1,
-0.6758293, -0.4639837, -1.340909, 0.4941176, 1, 0, 1,
-0.6753716, 1.0692, -0.0009992202, 0.4862745, 1, 0, 1,
-0.6738402, -0.3494951, -2.294637, 0.4823529, 1, 0, 1,
-0.6707559, 1.744024, -0.477699, 0.4745098, 1, 0, 1,
-0.6613008, 1.916186, -0.5875582, 0.4705882, 1, 0, 1,
-0.6565229, -0.2318608, -2.003438, 0.4627451, 1, 0, 1,
-0.656476, -1.025734, -2.798463, 0.4588235, 1, 0, 1,
-0.6560705, 0.5289956, -0.2091105, 0.4509804, 1, 0, 1,
-0.6521475, 0.1923036, -0.4244394, 0.4470588, 1, 0, 1,
-0.6464611, -1.299644, -1.879199, 0.4392157, 1, 0, 1,
-0.6434376, -0.05392439, -1.876697, 0.4352941, 1, 0, 1,
-0.635992, 0.3476068, -1.905176, 0.427451, 1, 0, 1,
-0.6301684, -0.2243049, -2.437571, 0.4235294, 1, 0, 1,
-0.6271967, 1.400648, -0.7253481, 0.4156863, 1, 0, 1,
-0.6257846, -0.8919803, -3.267159, 0.4117647, 1, 0, 1,
-0.6231223, 2.328139, 2.144351, 0.4039216, 1, 0, 1,
-0.6227934, -0.7247992, -1.916198, 0.3960784, 1, 0, 1,
-0.6227776, 0.6327451, -1.373012, 0.3921569, 1, 0, 1,
-0.6215248, 0.8409461, -0.4539478, 0.3843137, 1, 0, 1,
-0.6205292, 0.5706651, -1.636992, 0.3803922, 1, 0, 1,
-0.6137918, -0.1291574, -1.024861, 0.372549, 1, 0, 1,
-0.6042742, -0.8520476, -1.121428, 0.3686275, 1, 0, 1,
-0.5940283, 1.374209, -1.162745, 0.3607843, 1, 0, 1,
-0.5917799, 1.280844, -0.7900416, 0.3568628, 1, 0, 1,
-0.5896815, 0.6960838, -1.82006, 0.3490196, 1, 0, 1,
-0.5888363, -1.813313, -3.421696, 0.345098, 1, 0, 1,
-0.5872952, 0.3487869, 0.586847, 0.3372549, 1, 0, 1,
-0.5828466, -0.8976775, -1.567305, 0.3333333, 1, 0, 1,
-0.5826142, -2.223211, -1.619794, 0.3254902, 1, 0, 1,
-0.5825431, 0.02870017, -2.402672, 0.3215686, 1, 0, 1,
-0.5720022, 0.1750553, -0.2977343, 0.3137255, 1, 0, 1,
-0.5652289, 1.318282, -1.207632, 0.3098039, 1, 0, 1,
-0.5618034, -0.06274185, -2.969743, 0.3019608, 1, 0, 1,
-0.5608707, -2.379564, -3.893972, 0.2941177, 1, 0, 1,
-0.5583162, 0.548384, 0.6374556, 0.2901961, 1, 0, 1,
-0.5562858, 0.2915668, -1.827385, 0.282353, 1, 0, 1,
-0.5517634, -0.09417233, -2.115881, 0.2784314, 1, 0, 1,
-0.5497471, 0.2076924, -1.166578, 0.2705882, 1, 0, 1,
-0.5450836, -1.083728, -2.805936, 0.2666667, 1, 0, 1,
-0.5437469, 0.852662, -0.3620219, 0.2588235, 1, 0, 1,
-0.5423304, 1.220494, -0.6922656, 0.254902, 1, 0, 1,
-0.537396, -0.6873188, -3.90187, 0.2470588, 1, 0, 1,
-0.5360324, -0.04399499, -2.696601, 0.2431373, 1, 0, 1,
-0.5351663, -0.01917232, -3.397504, 0.2352941, 1, 0, 1,
-0.5305564, -1.664337, -4.322541, 0.2313726, 1, 0, 1,
-0.5270727, -0.730998, -4.212273, 0.2235294, 1, 0, 1,
-0.52213, 0.5164227, 0.1055185, 0.2196078, 1, 0, 1,
-0.5184978, 1.438221, -1.509123, 0.2117647, 1, 0, 1,
-0.5126919, -1.454499, -3.38058, 0.2078431, 1, 0, 1,
-0.50991, 1.097262, -0.5948348, 0.2, 1, 0, 1,
-0.5098476, 0.01801123, -0.7379397, 0.1921569, 1, 0, 1,
-0.5075677, 1.178446, -0.2347172, 0.1882353, 1, 0, 1,
-0.5065289, -0.8350749, -3.100079, 0.1803922, 1, 0, 1,
-0.5048673, 0.07476936, -1.843451, 0.1764706, 1, 0, 1,
-0.5044997, 0.1084037, -2.282201, 0.1686275, 1, 0, 1,
-0.5035471, -0.3450798, -2.70443, 0.1647059, 1, 0, 1,
-0.4999288, -1.086524, -1.917981, 0.1568628, 1, 0, 1,
-0.4968487, 0.09314792, 0.7796736, 0.1529412, 1, 0, 1,
-0.4942654, -1.171695, -2.895205, 0.145098, 1, 0, 1,
-0.4927295, 0.2402188, -0.4911354, 0.1411765, 1, 0, 1,
-0.4913502, -0.9475306, -3.20466, 0.1333333, 1, 0, 1,
-0.4873417, 2.196078, -1.033953, 0.1294118, 1, 0, 1,
-0.4858975, -0.6584023, -1.548234, 0.1215686, 1, 0, 1,
-0.4743389, 0.08815034, -0.3427855, 0.1176471, 1, 0, 1,
-0.4712285, -0.4955524, 0.2527995, 0.1098039, 1, 0, 1,
-0.4709252, 0.3289103, -1.418782, 0.1058824, 1, 0, 1,
-0.4707555, 0.03994088, -2.514688, 0.09803922, 1, 0, 1,
-0.4666599, -2.566147, -3.707371, 0.09019608, 1, 0, 1,
-0.4656461, 0.3334279, -0.06514431, 0.08627451, 1, 0, 1,
-0.4621316, -0.6074407, -2.043706, 0.07843138, 1, 0, 1,
-0.4615287, -1.028808, -1.176238, 0.07450981, 1, 0, 1,
-0.4594151, -0.3250623, -2.459165, 0.06666667, 1, 0, 1,
-0.4566792, 1.163386, -2.391331, 0.0627451, 1, 0, 1,
-0.4563411, -0.285612, -3.563623, 0.05490196, 1, 0, 1,
-0.4540614, 0.5664488, -0.2962867, 0.05098039, 1, 0, 1,
-0.4503169, 0.7871022, -2.084252, 0.04313726, 1, 0, 1,
-0.4495528, 0.6969531, -0.8784792, 0.03921569, 1, 0, 1,
-0.4416995, 0.7267783, -1.272436, 0.03137255, 1, 0, 1,
-0.441117, 1.725078, -0.1012189, 0.02745098, 1, 0, 1,
-0.4393408, -0.91983, -3.111883, 0.01960784, 1, 0, 1,
-0.4372901, 0.4881243, -2.179124, 0.01568628, 1, 0, 1,
-0.4346723, 0.8042195, -0.2581952, 0.007843138, 1, 0, 1,
-0.4345059, -1.075163, -3.46589, 0.003921569, 1, 0, 1,
-0.4307421, 0.1142231, -2.479848, 0, 1, 0.003921569, 1,
-0.422564, -0.6985953, -1.739472, 0, 1, 0.01176471, 1,
-0.4192469, 2.723367, 0.03431705, 0, 1, 0.01568628, 1,
-0.4173942, -0.1986258, -1.961454, 0, 1, 0.02352941, 1,
-0.4146506, -0.4713371, -1.129851, 0, 1, 0.02745098, 1,
-0.4116432, 0.2270838, -1.307172, 0, 1, 0.03529412, 1,
-0.4101346, 1.245301, -1.705214, 0, 1, 0.03921569, 1,
-0.4057551, 0.03257471, -2.352926, 0, 1, 0.04705882, 1,
-0.4041283, -1.427166, -3.872301, 0, 1, 0.05098039, 1,
-0.4037519, 0.592604, -1.871599, 0, 1, 0.05882353, 1,
-0.4010419, 1.45706, -1.245408, 0, 1, 0.0627451, 1,
-0.3996256, 1.342719, -0.0200459, 0, 1, 0.07058824, 1,
-0.3981015, -0.7170541, -2.671788, 0, 1, 0.07450981, 1,
-0.3962049, -0.274161, -3.569401, 0, 1, 0.08235294, 1,
-0.3844167, -0.3244997, -2.111744, 0, 1, 0.08627451, 1,
-0.3826994, -0.6860084, -1.794035, 0, 1, 0.09411765, 1,
-0.379981, 0.4402087, -0.205587, 0, 1, 0.1019608, 1,
-0.378204, -0.6581779, -2.362327, 0, 1, 0.1058824, 1,
-0.3766838, 0.2971554, -1.965885, 0, 1, 0.1137255, 1,
-0.3765888, 2.39879, -0.5050047, 0, 1, 0.1176471, 1,
-0.3757682, -0.1995129, -3.064472, 0, 1, 0.1254902, 1,
-0.3747735, 0.4803267, 0.8151163, 0, 1, 0.1294118, 1,
-0.3689432, -0.344746, -2.211846, 0, 1, 0.1372549, 1,
-0.367848, -1.492366, -3.402735, 0, 1, 0.1411765, 1,
-0.3677826, 0.2191121, -1.203663, 0, 1, 0.1490196, 1,
-0.3631775, 1.525618, 0.263849, 0, 1, 0.1529412, 1,
-0.3580064, -0.6266512, -2.314266, 0, 1, 0.1607843, 1,
-0.3571981, 2.698939, -0.3549062, 0, 1, 0.1647059, 1,
-0.3537721, 0.4602447, -0.7375712, 0, 1, 0.172549, 1,
-0.3535735, -0.0008492873, -1.988664, 0, 1, 0.1764706, 1,
-0.351927, -0.8122151, -0.1247342, 0, 1, 0.1843137, 1,
-0.3518851, -3.140594, -1.698877, 0, 1, 0.1882353, 1,
-0.3504797, -1.771664, -3.160833, 0, 1, 0.1960784, 1,
-0.3488047, 0.7287315, 0.7222987, 0, 1, 0.2039216, 1,
-0.3485752, 0.4373359, -0.07674983, 0, 1, 0.2078431, 1,
-0.345964, -0.7218414, -2.521709, 0, 1, 0.2156863, 1,
-0.3451307, -0.8627378, -1.506644, 0, 1, 0.2196078, 1,
-0.3385968, 0.433255, -0.8798719, 0, 1, 0.227451, 1,
-0.3359302, -0.3839196, -0.224747, 0, 1, 0.2313726, 1,
-0.3345499, -0.4874378, -1.136438, 0, 1, 0.2392157, 1,
-0.3316116, -0.2530505, -2.386594, 0, 1, 0.2431373, 1,
-0.3303192, -0.2636953, -0.9895104, 0, 1, 0.2509804, 1,
-0.3296478, -0.05018204, -2.698295, 0, 1, 0.254902, 1,
-0.3283468, -1.737396, -2.258569, 0, 1, 0.2627451, 1,
-0.3256969, -0.02941003, -1.916704, 0, 1, 0.2666667, 1,
-0.3244911, -1.059922, -1.964653, 0, 1, 0.2745098, 1,
-0.3222207, -0.9503491, -2.146433, 0, 1, 0.2784314, 1,
-0.3196529, -0.7930878, -3.379255, 0, 1, 0.2862745, 1,
-0.3189867, -0.2265985, -2.012298, 0, 1, 0.2901961, 1,
-0.3176227, -0.0413456, -0.3554704, 0, 1, 0.2980392, 1,
-0.3148785, 1.105895, -0.764679, 0, 1, 0.3058824, 1,
-0.3140674, 1.853254, -0.7654924, 0, 1, 0.3098039, 1,
-0.3119511, -0.697065, -3.123836, 0, 1, 0.3176471, 1,
-0.3097834, 0.9633425, 0.5857598, 0, 1, 0.3215686, 1,
-0.3092805, 1.096291, 1.01577, 0, 1, 0.3294118, 1,
-0.3091534, 0.9325079, -1.59099, 0, 1, 0.3333333, 1,
-0.3028748, -0.8286332, -2.735613, 0, 1, 0.3411765, 1,
-0.2977135, -0.001401555, -3.743096, 0, 1, 0.345098, 1,
-0.2926621, -2.677165, -2.363265, 0, 1, 0.3529412, 1,
-0.2872681, -0.1903445, -0.8566194, 0, 1, 0.3568628, 1,
-0.2835242, -0.9883316, -3.669007, 0, 1, 0.3647059, 1,
-0.2802934, -0.649024, -1.305342, 0, 1, 0.3686275, 1,
-0.2761678, 0.1244412, -1.098447, 0, 1, 0.3764706, 1,
-0.2726869, -0.3211023, -1.591649, 0, 1, 0.3803922, 1,
-0.2716037, -1.157087, -3.364151, 0, 1, 0.3882353, 1,
-0.2678998, -1.144083, -2.810328, 0, 1, 0.3921569, 1,
-0.2644071, 0.6502444, 0.5474431, 0, 1, 0.4, 1,
-0.2643279, 0.155313, -0.3760518, 0, 1, 0.4078431, 1,
-0.260959, 0.552154, -2.078489, 0, 1, 0.4117647, 1,
-0.2599588, -0.6502661, -3.002028, 0, 1, 0.4196078, 1,
-0.2598061, -0.7973082, -3.936275, 0, 1, 0.4235294, 1,
-0.2551874, -1.851652, -1.663437, 0, 1, 0.4313726, 1,
-0.2531978, -0.2103569, -1.910691, 0, 1, 0.4352941, 1,
-0.2522026, 0.8600073, -0.4614929, 0, 1, 0.4431373, 1,
-0.2517657, -0.1086262, -2.572992, 0, 1, 0.4470588, 1,
-0.2481913, -1.452677, -3.520634, 0, 1, 0.454902, 1,
-0.2481678, -1.712182, -2.995344, 0, 1, 0.4588235, 1,
-0.2472217, -1.501563, -2.221293, 0, 1, 0.4666667, 1,
-0.2440964, 0.5036926, -0.1079217, 0, 1, 0.4705882, 1,
-0.2403959, -0.4440631, -2.617438, 0, 1, 0.4784314, 1,
-0.238561, 0.1195322, 0.9069206, 0, 1, 0.4823529, 1,
-0.236743, -0.7269535, -3.041494, 0, 1, 0.4901961, 1,
-0.2359321, 0.805209, -0.3978994, 0, 1, 0.4941176, 1,
-0.228322, 0.8737758, 1.470979, 0, 1, 0.5019608, 1,
-0.2242364, -0.5611326, -2.469529, 0, 1, 0.509804, 1,
-0.2230305, -0.6819506, -1.846526, 0, 1, 0.5137255, 1,
-0.2219801, -1.632846, -2.080598, 0, 1, 0.5215687, 1,
-0.2215114, 0.1413766, 0.06630406, 0, 1, 0.5254902, 1,
-0.2203483, 0.02159842, -0.9951171, 0, 1, 0.5333334, 1,
-0.2157258, -0.3701907, -2.371139, 0, 1, 0.5372549, 1,
-0.2147909, -1.02975, -0.7050429, 0, 1, 0.5450981, 1,
-0.2136939, -0.8565416, -4.707823, 0, 1, 0.5490196, 1,
-0.2117305, 1.046269, -1.064448, 0, 1, 0.5568628, 1,
-0.2076969, -0.5598899, -3.232442, 0, 1, 0.5607843, 1,
-0.2028517, -0.7392945, -2.464395, 0, 1, 0.5686275, 1,
-0.1982399, -0.3460597, -2.088435, 0, 1, 0.572549, 1,
-0.1959473, 0.07045538, 0.05457407, 0, 1, 0.5803922, 1,
-0.1938993, -0.4962568, -2.657904, 0, 1, 0.5843138, 1,
-0.1858426, 0.8723832, 0.325414, 0, 1, 0.5921569, 1,
-0.1750324, -0.0329842, -2.176465, 0, 1, 0.5960785, 1,
-0.1750256, 0.8738931, -0.4225321, 0, 1, 0.6039216, 1,
-0.1743515, -0.12631, -3.286573, 0, 1, 0.6117647, 1,
-0.1725251, 1.654658, 0.07042776, 0, 1, 0.6156863, 1,
-0.1694228, -1.240994, -2.975683, 0, 1, 0.6235294, 1,
-0.1685291, -0.1603328, -1.760022, 0, 1, 0.627451, 1,
-0.1656416, -0.4042114, -3.429509, 0, 1, 0.6352941, 1,
-0.1630112, 0.0210951, -0.6321623, 0, 1, 0.6392157, 1,
-0.1576566, 1.563947, -1.336337, 0, 1, 0.6470588, 1,
-0.1560684, 1.061131, 0.09569253, 0, 1, 0.6509804, 1,
-0.1472021, 0.6571367, 1.580724, 0, 1, 0.6588235, 1,
-0.1470985, 0.01056442, -0.1891197, 0, 1, 0.6627451, 1,
-0.1458885, -0.1518333, -2.723451, 0, 1, 0.6705883, 1,
-0.1455939, 1.414729, -0.4440408, 0, 1, 0.6745098, 1,
-0.14363, 0.4404842, 0.5176351, 0, 1, 0.682353, 1,
-0.1430551, 1.1458, -0.3206191, 0, 1, 0.6862745, 1,
-0.1392923, -0.2605565, -2.945042, 0, 1, 0.6941177, 1,
-0.1350161, -0.1832999, -2.383102, 0, 1, 0.7019608, 1,
-0.1339675, 1.515117, -0.1780682, 0, 1, 0.7058824, 1,
-0.1337056, -0.6596963, -2.960254, 0, 1, 0.7137255, 1,
-0.1306179, 0.01865702, -0.8179722, 0, 1, 0.7176471, 1,
-0.1262803, 0.8524882, -1.087273, 0, 1, 0.7254902, 1,
-0.1252191, 1.008893, -0.06063934, 0, 1, 0.7294118, 1,
-0.1198124, -0.3127394, -1.252294, 0, 1, 0.7372549, 1,
-0.117466, 1.9412, -0.3638547, 0, 1, 0.7411765, 1,
-0.1138049, 0.1678516, -0.6312483, 0, 1, 0.7490196, 1,
-0.1088722, 1.513569, 0.8358315, 0, 1, 0.7529412, 1,
-0.1088171, 0.6750923, -1.21443, 0, 1, 0.7607843, 1,
-0.1069953, 0.1425041, -1.16563, 0, 1, 0.7647059, 1,
-0.103642, -0.2797132, -3.577701, 0, 1, 0.772549, 1,
-0.1025204, 1.275393, 0.7503058, 0, 1, 0.7764706, 1,
-0.1021798, 0.09481919, -0.9510508, 0, 1, 0.7843137, 1,
-0.09812009, 0.05715093, 1.746017, 0, 1, 0.7882353, 1,
-0.09760907, 0.5061993, -1.65554, 0, 1, 0.7960784, 1,
-0.09671987, 0.1096593, -1.565625, 0, 1, 0.8039216, 1,
-0.09216619, -1.309756, -3.569336, 0, 1, 0.8078431, 1,
-0.09091245, 0.138787, -0.963845, 0, 1, 0.8156863, 1,
-0.08990556, 1.385449, -0.4444752, 0, 1, 0.8196079, 1,
-0.08792087, 0.05303461, -1.417659, 0, 1, 0.827451, 1,
-0.08608627, -0.1165589, -4.136045, 0, 1, 0.8313726, 1,
-0.08527277, -0.4063529, -3.390788, 0, 1, 0.8392157, 1,
-0.08457749, -1.92465, -2.08956, 0, 1, 0.8431373, 1,
-0.08263954, -0.3301526, -4.010901, 0, 1, 0.8509804, 1,
-0.08114187, 0.6775051, -1.775892, 0, 1, 0.854902, 1,
-0.07910863, 0.2355991, -2.142677, 0, 1, 0.8627451, 1,
-0.07755372, -0.4860227, -1.524572, 0, 1, 0.8666667, 1,
-0.07666255, -1.648362, -4.218708, 0, 1, 0.8745098, 1,
-0.07331143, -1.861117, -2.602992, 0, 1, 0.8784314, 1,
-0.07103696, -1.19427, -3.942514, 0, 1, 0.8862745, 1,
-0.06544133, -1.027098, -4.169718, 0, 1, 0.8901961, 1,
-0.06465573, 0.8097302, 1.946861, 0, 1, 0.8980392, 1,
-0.0643468, 1.269354, 1.722493, 0, 1, 0.9058824, 1,
-0.05784304, -0.5352434, -2.474472, 0, 1, 0.9098039, 1,
-0.05502864, 0.04480658, -2.445761, 0, 1, 0.9176471, 1,
-0.05163056, 1.816929, -1.84604, 0, 1, 0.9215686, 1,
-0.04870319, 0.4501122, -0.4788011, 0, 1, 0.9294118, 1,
-0.04836925, 0.8736969, -0.2710427, 0, 1, 0.9333333, 1,
-0.04678253, -0.01382985, -0.1928519, 0, 1, 0.9411765, 1,
-0.04531877, -1.432778, -4.148443, 0, 1, 0.945098, 1,
-0.0442677, 0.9116859, -0.8581008, 0, 1, 0.9529412, 1,
-0.04410702, -1.140471, -4.752778, 0, 1, 0.9568627, 1,
-0.04352119, -0.5836298, -3.055784, 0, 1, 0.9647059, 1,
-0.04265813, 0.07655254, -0.9340389, 0, 1, 0.9686275, 1,
-0.04124762, 1.071925, 0.3240043, 0, 1, 0.9764706, 1,
-0.04100912, -0.6853017, -4.70347, 0, 1, 0.9803922, 1,
-0.04014537, -0.1925431, -4.265951, 0, 1, 0.9882353, 1,
-0.03769233, 1.616648, -0.9422168, 0, 1, 0.9921569, 1,
-0.03246319, -0.5974119, -0.09130385, 0, 1, 1, 1,
-0.03138028, -0.1852545, -3.519896, 0, 0.9921569, 1, 1,
-0.02910512, -1.824221, -2.498496, 0, 0.9882353, 1, 1,
-0.02670549, -0.8083469, -3.749038, 0, 0.9803922, 1, 1,
-0.02387398, 1.589399, 0.06167886, 0, 0.9764706, 1, 1,
-0.02171427, -1.492576, -1.275182, 0, 0.9686275, 1, 1,
-0.01770295, 0.4403108, -0.8860468, 0, 0.9647059, 1, 1,
-0.01713197, -0.6483127, -4.007385, 0, 0.9568627, 1, 1,
-0.01370681, -0.8709228, -4.378751, 0, 0.9529412, 1, 1,
-0.009875962, 2.368339, 0.2787673, 0, 0.945098, 1, 1,
-0.008771491, 0.07872622, -0.3868205, 0, 0.9411765, 1, 1,
-0.007561977, -0.6762762, -4.731935, 0, 0.9333333, 1, 1,
-0.007019721, 0.8359657, 2.175371, 0, 0.9294118, 1, 1,
-0.004955286, -0.8878168, -6.470812, 0, 0.9215686, 1, 1,
-0.00288629, -0.3155923, -2.62247, 0, 0.9176471, 1, 1,
-0.001304637, 1.724027, -0.5613401, 0, 0.9098039, 1, 1,
-0.001067268, -0.8014326, -0.4304972, 0, 0.9058824, 1, 1,
0.0002056372, 0.2373685, -1.100391, 0, 0.8980392, 1, 1,
0.00485993, 1.255403, -0.3895881, 0, 0.8901961, 1, 1,
0.005098872, 1.549749, -0.1642351, 0, 0.8862745, 1, 1,
0.006397771, 1.183445, 0.98809, 0, 0.8784314, 1, 1,
0.008024763, 0.2612994, -2.641239, 0, 0.8745098, 1, 1,
0.01033994, 0.8527443, -0.3861171, 0, 0.8666667, 1, 1,
0.01055073, 0.5826283, 0.2202872, 0, 0.8627451, 1, 1,
0.0139319, -1.300878, 3.303857, 0, 0.854902, 1, 1,
0.02163158, 0.7270873, -0.5048687, 0, 0.8509804, 1, 1,
0.02174573, 0.1072721, 0.5090232, 0, 0.8431373, 1, 1,
0.02229443, 0.2540867, -0.3472223, 0, 0.8392157, 1, 1,
0.02635939, 0.004339114, 1.295993, 0, 0.8313726, 1, 1,
0.02685485, 0.2705761, 0.1863426, 0, 0.827451, 1, 1,
0.02708531, 0.1575167, -3.544421, 0, 0.8196079, 1, 1,
0.02810821, 1.275469, 0.5332705, 0, 0.8156863, 1, 1,
0.02981296, -0.2355112, 2.817429, 0, 0.8078431, 1, 1,
0.03557843, -0.4980853, 1.875276, 0, 0.8039216, 1, 1,
0.03600873, -0.4032567, 3.208579, 0, 0.7960784, 1, 1,
0.05013073, -0.9663265, 2.677876, 0, 0.7882353, 1, 1,
0.0550307, -0.2027185, 3.648642, 0, 0.7843137, 1, 1,
0.05547766, 1.076597, 2.372203, 0, 0.7764706, 1, 1,
0.05599333, 0.9545603, 0.239399, 0, 0.772549, 1, 1,
0.0584877, 1.53881, 1.510068, 0, 0.7647059, 1, 1,
0.05994179, 0.5492676, -0.6643692, 0, 0.7607843, 1, 1,
0.0613443, -0.2907141, 3.39433, 0, 0.7529412, 1, 1,
0.06298959, -0.1758937, 2.148694, 0, 0.7490196, 1, 1,
0.06499093, -0.1117852, 1.382238, 0, 0.7411765, 1, 1,
0.06522603, -0.1352938, 3.574872, 0, 0.7372549, 1, 1,
0.06931432, 0.2518692, 0.3943441, 0, 0.7294118, 1, 1,
0.06960055, 0.7250254, 1.027783, 0, 0.7254902, 1, 1,
0.08082091, -2.450088, 3.067223, 0, 0.7176471, 1, 1,
0.08152255, 0.6090769, 0.64939, 0, 0.7137255, 1, 1,
0.08531322, -1.497325, 2.318546, 0, 0.7058824, 1, 1,
0.0854937, -1.392339, 3.13702, 0, 0.6980392, 1, 1,
0.0914673, 0.3569829, 0.9682299, 0, 0.6941177, 1, 1,
0.09553114, -0.7794033, 1.879198, 0, 0.6862745, 1, 1,
0.1015899, -1.056844, 2.968436, 0, 0.682353, 1, 1,
0.1065666, -1.208693, 3.836217, 0, 0.6745098, 1, 1,
0.1112809, 1.581, 1.698912, 0, 0.6705883, 1, 1,
0.1117542, -3.208344, 4.439775, 0, 0.6627451, 1, 1,
0.1119224, -1.512199, 2.045082, 0, 0.6588235, 1, 1,
0.1130609, 0.544109, -0.2575765, 0, 0.6509804, 1, 1,
0.1157803, -0.6294506, 1.324195, 0, 0.6470588, 1, 1,
0.1167507, -1.956223, 4.427104, 0, 0.6392157, 1, 1,
0.1168353, -0.3026833, 1.470379, 0, 0.6352941, 1, 1,
0.1202446, 0.4429435, 1.718693, 0, 0.627451, 1, 1,
0.1215194, -0.1522738, 2.956711, 0, 0.6235294, 1, 1,
0.1242376, 0.4353946, 0.6045984, 0, 0.6156863, 1, 1,
0.1260679, -0.2040203, 2.738817, 0, 0.6117647, 1, 1,
0.1366969, 0.2382986, -0.4825936, 0, 0.6039216, 1, 1,
0.1377266, -0.02797324, 2.239329, 0, 0.5960785, 1, 1,
0.138517, -0.4641759, 4.582672, 0, 0.5921569, 1, 1,
0.1407146, -0.5553358, 5.20848, 0, 0.5843138, 1, 1,
0.1440659, -1.38176, 4.290687, 0, 0.5803922, 1, 1,
0.1449732, 0.3252169, 0.4709642, 0, 0.572549, 1, 1,
0.1470479, -0.7031335, 2.703018, 0, 0.5686275, 1, 1,
0.1524615, 0.1805395, 0.2058841, 0, 0.5607843, 1, 1,
0.1546178, -1.370467, 2.866385, 0, 0.5568628, 1, 1,
0.1603549, 0.5251202, -0.07593633, 0, 0.5490196, 1, 1,
0.1606559, -0.4103691, 1.011396, 0, 0.5450981, 1, 1,
0.1662287, 0.5314376, 0.9204828, 0, 0.5372549, 1, 1,
0.1710259, -0.6908398, 3.712522, 0, 0.5333334, 1, 1,
0.1722282, -0.513378, 1.066698, 0, 0.5254902, 1, 1,
0.1723409, -1.277805, 4.019613, 0, 0.5215687, 1, 1,
0.1753053, 0.8615714, -1.055481, 0, 0.5137255, 1, 1,
0.1757256, -0.4507102, 0.9833772, 0, 0.509804, 1, 1,
0.1826959, -0.6068646, 3.809982, 0, 0.5019608, 1, 1,
0.1830839, -0.4820131, 2.602834, 0, 0.4941176, 1, 1,
0.1845506, 0.6849188, -0.708334, 0, 0.4901961, 1, 1,
0.1864824, 0.1166767, 0.2383447, 0, 0.4823529, 1, 1,
0.1905836, -0.2012435, 3.953877, 0, 0.4784314, 1, 1,
0.1926633, 3.591003, -1.381435, 0, 0.4705882, 1, 1,
0.1928397, -1.016059, 4.367403, 0, 0.4666667, 1, 1,
0.1951802, 0.3864911, 1.236183, 0, 0.4588235, 1, 1,
0.195594, -0.129465, 3.471786, 0, 0.454902, 1, 1,
0.196931, 0.264534, 0.4043826, 0, 0.4470588, 1, 1,
0.2005249, 0.2964859, 1.968968, 0, 0.4431373, 1, 1,
0.2009065, -0.2296871, 1.860461, 0, 0.4352941, 1, 1,
0.2029378, -1.382459, 2.782919, 0, 0.4313726, 1, 1,
0.2032275, 0.6373623, 0.5769387, 0, 0.4235294, 1, 1,
0.2040676, -0.9825448, 2.359631, 0, 0.4196078, 1, 1,
0.204174, 0.7819085, -0.4655019, 0, 0.4117647, 1, 1,
0.2058416, 0.278317, 1.824717, 0, 0.4078431, 1, 1,
0.2094315, -0.7057658, 3.39828, 0, 0.4, 1, 1,
0.2165678, -1.765512, 4.701946, 0, 0.3921569, 1, 1,
0.217023, 1.34139, -1.092893, 0, 0.3882353, 1, 1,
0.2187591, 1.796674, 0.905991, 0, 0.3803922, 1, 1,
0.2199187, -0.4731338, 3.076816, 0, 0.3764706, 1, 1,
0.2260065, -0.9853716, 3.704801, 0, 0.3686275, 1, 1,
0.2301365, 0.217943, 1.534817, 0, 0.3647059, 1, 1,
0.2317405, 0.04931999, -0.255316, 0, 0.3568628, 1, 1,
0.2330081, -1.254068, 2.637972, 0, 0.3529412, 1, 1,
0.2341974, -0.6815249, 4.36593, 0, 0.345098, 1, 1,
0.237754, -0.7192972, 2.291873, 0, 0.3411765, 1, 1,
0.2406943, 0.5426913, 1.439559, 0, 0.3333333, 1, 1,
0.2430015, 0.3388924, 0.2016588, 0, 0.3294118, 1, 1,
0.2455912, -0.9439731, 2.906092, 0, 0.3215686, 1, 1,
0.2555068, -0.8419048, 3.256284, 0, 0.3176471, 1, 1,
0.2557149, -1.171835, 3.55406, 0, 0.3098039, 1, 1,
0.2560903, 1.019137, -0.0534678, 0, 0.3058824, 1, 1,
0.2627062, -0.5188993, 3.306606, 0, 0.2980392, 1, 1,
0.2666915, -1.043328, 2.743116, 0, 0.2901961, 1, 1,
0.267834, -0.6758436, 2.059454, 0, 0.2862745, 1, 1,
0.2693095, -0.905053, 3.10887, 0, 0.2784314, 1, 1,
0.2719778, -1.271239, 2.595846, 0, 0.2745098, 1, 1,
0.273056, -1.072357, 2.942591, 0, 0.2666667, 1, 1,
0.2762629, -0.6872594, 3.62582, 0, 0.2627451, 1, 1,
0.2776552, 0.9117852, -1.083766, 0, 0.254902, 1, 1,
0.2862165, -0.100656, 3.078124, 0, 0.2509804, 1, 1,
0.2881424, -1.245631, 3.502265, 0, 0.2431373, 1, 1,
0.2890018, -0.4380045, 1.499627, 0, 0.2392157, 1, 1,
0.2919409, -0.2765046, 1.893378, 0, 0.2313726, 1, 1,
0.2932326, 0.4014709, 2.056588, 0, 0.227451, 1, 1,
0.2938462, -0.651069, 3.094496, 0, 0.2196078, 1, 1,
0.3004428, -0.6129643, 2.796927, 0, 0.2156863, 1, 1,
0.3096101, 0.7990882, 0.09960347, 0, 0.2078431, 1, 1,
0.3111444, 1.133127, 0.3172329, 0, 0.2039216, 1, 1,
0.3130254, -0.1104335, 2.233662, 0, 0.1960784, 1, 1,
0.3133074, -0.08569085, 0.5376159, 0, 0.1882353, 1, 1,
0.3229053, -0.188408, 2.061233, 0, 0.1843137, 1, 1,
0.323211, -1.938591, 4.649241, 0, 0.1764706, 1, 1,
0.3244025, -0.5765208, 4.035049, 0, 0.172549, 1, 1,
0.3248343, -1.579744, 3.513382, 0, 0.1647059, 1, 1,
0.3278279, -0.05309039, 2.499877, 0, 0.1607843, 1, 1,
0.3286971, 0.06067942, 2.718234, 0, 0.1529412, 1, 1,
0.3307531, -0.4454909, 0.8076732, 0, 0.1490196, 1, 1,
0.3314854, -0.1617088, 3.731541, 0, 0.1411765, 1, 1,
0.3315121, -2.008224, 2.701843, 0, 0.1372549, 1, 1,
0.3337207, -0.6192219, 2.946229, 0, 0.1294118, 1, 1,
0.3358302, -1.041966, 3.744892, 0, 0.1254902, 1, 1,
0.3387457, -0.1031625, 2.660075, 0, 0.1176471, 1, 1,
0.339579, 2.336241, -0.09812713, 0, 0.1137255, 1, 1,
0.3402033, 0.4887501, 0.2331955, 0, 0.1058824, 1, 1,
0.3409382, -0.4209964, 1.261939, 0, 0.09803922, 1, 1,
0.3416971, -0.2995123, 2.225147, 0, 0.09411765, 1, 1,
0.3423552, 0.3673289, 1.45491, 0, 0.08627451, 1, 1,
0.3472529, 0.365087, -0.5915563, 0, 0.08235294, 1, 1,
0.3478533, 0.753498, -0.4586508, 0, 0.07450981, 1, 1,
0.3479657, 1.120446, 3.418313, 0, 0.07058824, 1, 1,
0.3506286, -0.8212882, 4.410987, 0, 0.0627451, 1, 1,
0.3554271, -0.2542734, 0.8827947, 0, 0.05882353, 1, 1,
0.362516, 0.5960577, -0.6398439, 0, 0.05098039, 1, 1,
0.3664458, -0.3275426, 2.238338, 0, 0.04705882, 1, 1,
0.3668685, -1.187267, 3.41989, 0, 0.03921569, 1, 1,
0.3722989, 0.2069595, 2.063897, 0, 0.03529412, 1, 1,
0.3759594, -0.02183826, 3.217297, 0, 0.02745098, 1, 1,
0.3819119, 1.515787, 1.611409, 0, 0.02352941, 1, 1,
0.3860824, -0.4104895, 2.990595, 0, 0.01568628, 1, 1,
0.3909496, 0.3503507, 2.477133, 0, 0.01176471, 1, 1,
0.3909996, 0.4757431, -0.1960142, 0, 0.003921569, 1, 1,
0.3927949, -0.03287313, 0.7029543, 0.003921569, 0, 1, 1,
0.399093, 0.1137872, 1.594048, 0.007843138, 0, 1, 1,
0.3991586, 0.2904731, 3.804871, 0.01568628, 0, 1, 1,
0.3998715, -0.2616334, 3.610913, 0.01960784, 0, 1, 1,
0.4060409, -0.2424356, 3.24348, 0.02745098, 0, 1, 1,
0.40937, 0.7988983, 1.103055, 0.03137255, 0, 1, 1,
0.4094818, -0.4254626, 1.681352, 0.03921569, 0, 1, 1,
0.4107093, -0.1157903, 3.039672, 0.04313726, 0, 1, 1,
0.4145746, 0.4834057, 0.4442402, 0.05098039, 0, 1, 1,
0.4158249, 0.3516744, 1.25665, 0.05490196, 0, 1, 1,
0.4174527, 0.06370755, 2.190016, 0.0627451, 0, 1, 1,
0.418665, 0.5123934, 1.207035, 0.06666667, 0, 1, 1,
0.4194551, -0.221801, 0.6818181, 0.07450981, 0, 1, 1,
0.4209127, 0.5801939, 2.40755, 0.07843138, 0, 1, 1,
0.4230409, 0.01367281, 1.396949, 0.08627451, 0, 1, 1,
0.4278105, -1.118595, 2.901113, 0.09019608, 0, 1, 1,
0.4347394, 0.1580866, 1.363883, 0.09803922, 0, 1, 1,
0.435951, 0.3049797, 2.867793, 0.1058824, 0, 1, 1,
0.4362747, 0.2152968, -0.5372313, 0.1098039, 0, 1, 1,
0.4389695, -0.7733773, 4.76829, 0.1176471, 0, 1, 1,
0.4410191, -0.3019714, 0.4425752, 0.1215686, 0, 1, 1,
0.4410745, -0.1683236, 3.481523, 0.1294118, 0, 1, 1,
0.4413912, -0.06587896, 2.057401, 0.1333333, 0, 1, 1,
0.4423166, -0.4075138, 1.971841, 0.1411765, 0, 1, 1,
0.4434156, 0.8800141, 0.914214, 0.145098, 0, 1, 1,
0.443718, 0.2055249, 0.3818128, 0.1529412, 0, 1, 1,
0.4483886, 0.4475078, 0.8376967, 0.1568628, 0, 1, 1,
0.4488712, -0.875081, 1.658544, 0.1647059, 0, 1, 1,
0.4527913, 0.7588403, 1.125247, 0.1686275, 0, 1, 1,
0.4591549, 0.175929, 0.31409, 0.1764706, 0, 1, 1,
0.4606144, 2.04447, 1.143713, 0.1803922, 0, 1, 1,
0.4608205, 0.2938563, -0.2493076, 0.1882353, 0, 1, 1,
0.4675032, -0.4463229, 2.397497, 0.1921569, 0, 1, 1,
0.4693557, -0.330473, 1.07267, 0.2, 0, 1, 1,
0.470094, 0.7097324, 1.469508, 0.2078431, 0, 1, 1,
0.4705649, 0.7722663, -0.07965269, 0.2117647, 0, 1, 1,
0.4709976, 0.5852174, 1.159433, 0.2196078, 0, 1, 1,
0.4713038, 0.2235177, 1.550058, 0.2235294, 0, 1, 1,
0.4738924, -0.295664, 2.778696, 0.2313726, 0, 1, 1,
0.475184, 0.1475467, 0.5178574, 0.2352941, 0, 1, 1,
0.4764426, -0.8777961, 2.111621, 0.2431373, 0, 1, 1,
0.4822311, -0.1098358, 2.073249, 0.2470588, 0, 1, 1,
0.4827971, -0.5785477, 2.709136, 0.254902, 0, 1, 1,
0.4831461, 2.139467, -1.587428, 0.2588235, 0, 1, 1,
0.4851189, 0.6476234, -0.01391717, 0.2666667, 0, 1, 1,
0.4866585, 0.4102916, 1.473631, 0.2705882, 0, 1, 1,
0.4883375, 1.03409, 1.996829, 0.2784314, 0, 1, 1,
0.4911822, -1.384418, 2.946129, 0.282353, 0, 1, 1,
0.4915491, 0.7421292, -0.2705631, 0.2901961, 0, 1, 1,
0.495851, -0.761378, 3.198551, 0.2941177, 0, 1, 1,
0.4977133, -0.09670053, 2.839102, 0.3019608, 0, 1, 1,
0.4982432, 0.9608679, 0.2490839, 0.3098039, 0, 1, 1,
0.4990947, -0.3432947, 3.05396, 0.3137255, 0, 1, 1,
0.499496, -0.1168715, 0.7800705, 0.3215686, 0, 1, 1,
0.4998041, -0.4896225, 1.446592, 0.3254902, 0, 1, 1,
0.5004189, -0.6868493, 3.677808, 0.3333333, 0, 1, 1,
0.502432, 0.02396204, 2.238642, 0.3372549, 0, 1, 1,
0.5068141, 0.2220742, 1.862995, 0.345098, 0, 1, 1,
0.510811, 0.4259212, 2.485787, 0.3490196, 0, 1, 1,
0.5124493, 0.05842195, 0.4981741, 0.3568628, 0, 1, 1,
0.51363, 1.86403, 1.437229, 0.3607843, 0, 1, 1,
0.5165917, -0.5672125, 3.157107, 0.3686275, 0, 1, 1,
0.5206693, -0.4953088, 2.462279, 0.372549, 0, 1, 1,
0.5351159, -0.2364272, 1.245253, 0.3803922, 0, 1, 1,
0.5367172, 0.09609474, 0.4486159, 0.3843137, 0, 1, 1,
0.5381164, 0.6351097, -0.4975963, 0.3921569, 0, 1, 1,
0.5432558, -0.08794451, 0.783429, 0.3960784, 0, 1, 1,
0.5438606, 0.371831, 0.706317, 0.4039216, 0, 1, 1,
0.5457376, 2.294719, -1.981704, 0.4117647, 0, 1, 1,
0.5499921, -1.460394, 2.079786, 0.4156863, 0, 1, 1,
0.555145, 0.9566832, 0.04719397, 0.4235294, 0, 1, 1,
0.5555005, -0.4072129, 2.752809, 0.427451, 0, 1, 1,
0.5565784, -0.3766885, 1.836048, 0.4352941, 0, 1, 1,
0.5601025, 0.03008489, 0.9224555, 0.4392157, 0, 1, 1,
0.5703872, 1.208674, -0.2668535, 0.4470588, 0, 1, 1,
0.5717338, 0.5944233, -1.997035, 0.4509804, 0, 1, 1,
0.5723134, 0.6784797, 1.262553, 0.4588235, 0, 1, 1,
0.5752865, -0.003649771, 3.310173, 0.4627451, 0, 1, 1,
0.5767025, -0.2829595, 1.943378, 0.4705882, 0, 1, 1,
0.5783176, -1.21697, 2.455916, 0.4745098, 0, 1, 1,
0.5796607, 0.4845256, 1.149591, 0.4823529, 0, 1, 1,
0.5817401, -0.6020153, 2.677151, 0.4862745, 0, 1, 1,
0.5833175, 1.040858, 0.9236301, 0.4941176, 0, 1, 1,
0.5870988, -0.3064041, 1.711985, 0.5019608, 0, 1, 1,
0.59316, 0.5481097, 0.1824619, 0.5058824, 0, 1, 1,
0.6020794, 0.6977532, 1.876069, 0.5137255, 0, 1, 1,
0.6024249, 0.2575839, -0.7459452, 0.5176471, 0, 1, 1,
0.6089945, -0.6504418, 0.4037867, 0.5254902, 0, 1, 1,
0.6105792, 0.4934663, 2.637798, 0.5294118, 0, 1, 1,
0.6141787, -1.022675, 0.5762202, 0.5372549, 0, 1, 1,
0.6145063, -0.1152165, 2.054317, 0.5411765, 0, 1, 1,
0.6153175, -2.807961, 4.110279, 0.5490196, 0, 1, 1,
0.6188443, 0.1593811, 2.472635, 0.5529412, 0, 1, 1,
0.6197526, -0.02937951, 2.428887, 0.5607843, 0, 1, 1,
0.6200348, 0.8583947, 0.6966165, 0.5647059, 0, 1, 1,
0.6245716, -0.2478265, 1.855343, 0.572549, 0, 1, 1,
0.6282395, -0.6164886, 2.15793, 0.5764706, 0, 1, 1,
0.632521, 0.5746114, 1.017933, 0.5843138, 0, 1, 1,
0.6419387, 0.3866322, 1.795994, 0.5882353, 0, 1, 1,
0.6497053, 0.2984394, -0.7723454, 0.5960785, 0, 1, 1,
0.6514496, 0.7288193, -0.6591138, 0.6039216, 0, 1, 1,
0.6519909, -1.337746, 2.644993, 0.6078432, 0, 1, 1,
0.6520075, 0.7024974, 2.780135, 0.6156863, 0, 1, 1,
0.6557186, -0.3857566, 1.517488, 0.6196079, 0, 1, 1,
0.6571949, 0.8361313, 1.093064, 0.627451, 0, 1, 1,
0.6605104, -0.0587723, 0.1079288, 0.6313726, 0, 1, 1,
0.6627793, -2.512346, 1.812746, 0.6392157, 0, 1, 1,
0.6694707, 1.968239, -1.44854, 0.6431373, 0, 1, 1,
0.6805276, 0.9451143, 0.8896174, 0.6509804, 0, 1, 1,
0.6890687, -1.322742, 3.924557, 0.654902, 0, 1, 1,
0.6901546, 1.575129, 0.3234058, 0.6627451, 0, 1, 1,
0.6953858, 0.6390911, 1.094835, 0.6666667, 0, 1, 1,
0.6970935, 0.8760161, -0.2752629, 0.6745098, 0, 1, 1,
0.7033807, -0.9131616, 2.029673, 0.6784314, 0, 1, 1,
0.70388, -0.4692789, 3.49717, 0.6862745, 0, 1, 1,
0.7045018, -0.5855046, 1.943719, 0.6901961, 0, 1, 1,
0.7045211, -1.484041, 2.336089, 0.6980392, 0, 1, 1,
0.7099417, -1.935923, 2.961397, 0.7058824, 0, 1, 1,
0.7206587, 0.5632731, 2.34231, 0.7098039, 0, 1, 1,
0.7238394, -0.787165, 1.989033, 0.7176471, 0, 1, 1,
0.7292401, 2.247459, 2.014353, 0.7215686, 0, 1, 1,
0.7320951, -0.1090872, 0.0163385, 0.7294118, 0, 1, 1,
0.7345648, -0.2850344, 1.86058, 0.7333333, 0, 1, 1,
0.7376141, 0.8698948, 0.18517, 0.7411765, 0, 1, 1,
0.7406198, -1.364664, 4.023395, 0.7450981, 0, 1, 1,
0.7465481, -1.228116, 2.77501, 0.7529412, 0, 1, 1,
0.7561652, 0.355819, 2.682536, 0.7568628, 0, 1, 1,
0.7576777, -3.698722, 1.752993, 0.7647059, 0, 1, 1,
0.7579338, 1.557503, 1.440545, 0.7686275, 0, 1, 1,
0.7613986, 0.4171857, 1.907744, 0.7764706, 0, 1, 1,
0.7645353, 0.3377663, 0.3404986, 0.7803922, 0, 1, 1,
0.7831147, -0.3524527, 0.8516104, 0.7882353, 0, 1, 1,
0.7926116, -0.5345486, 3.139217, 0.7921569, 0, 1, 1,
0.7966748, 0.2233884, -0.3191867, 0.8, 0, 1, 1,
0.8003606, -0.4007481, 2.007151, 0.8078431, 0, 1, 1,
0.8042555, -2.38194, 2.513984, 0.8117647, 0, 1, 1,
0.8078719, 0.2343902, 1.185622, 0.8196079, 0, 1, 1,
0.8121086, 0.7579852, 2.262385, 0.8235294, 0, 1, 1,
0.8123321, -1.893409, 1.922606, 0.8313726, 0, 1, 1,
0.8124906, 0.674186, -0.4115998, 0.8352941, 0, 1, 1,
0.8127812, 0.2008611, -0.5043184, 0.8431373, 0, 1, 1,
0.8144606, 0.3185374, 1.129971, 0.8470588, 0, 1, 1,
0.8225101, -0.1189908, 0.509479, 0.854902, 0, 1, 1,
0.8228147, -2.353322, 3.459733, 0.8588235, 0, 1, 1,
0.827058, 1.99845, -0.3683553, 0.8666667, 0, 1, 1,
0.8270697, 0.317249, 0.2013769, 0.8705882, 0, 1, 1,
0.8281118, 0.6822947, 1.432213, 0.8784314, 0, 1, 1,
0.8320144, -0.7404083, 3.894925, 0.8823529, 0, 1, 1,
0.8406259, 1.184454, 0.002038413, 0.8901961, 0, 1, 1,
0.8424854, 0.455081, 2.278281, 0.8941177, 0, 1, 1,
0.8425267, 2.072542, -0.9473696, 0.9019608, 0, 1, 1,
0.8437535, 1.028954, 1.133417, 0.9098039, 0, 1, 1,
0.8459015, -0.407865, 4.204515, 0.9137255, 0, 1, 1,
0.8459108, 0.03671694, 2.40726, 0.9215686, 0, 1, 1,
0.8470258, 0.5504308, 0.4371802, 0.9254902, 0, 1, 1,
0.8492278, 0.0661439, 1.353542, 0.9333333, 0, 1, 1,
0.8554319, 1.974072, 0.4066952, 0.9372549, 0, 1, 1,
0.8574978, 0.2345014, 0.7523571, 0.945098, 0, 1, 1,
0.8576022, -0.5121565, 1.296828, 0.9490196, 0, 1, 1,
0.8638951, -0.803654, 0.916479, 0.9568627, 0, 1, 1,
0.8661041, 0.5880324, 0.9087685, 0.9607843, 0, 1, 1,
0.8715917, 0.4072501, 1.376612, 0.9686275, 0, 1, 1,
0.877535, -0.7195392, 2.355267, 0.972549, 0, 1, 1,
0.8785602, 0.4421467, 1.550404, 0.9803922, 0, 1, 1,
0.878645, -0.7084655, 2.770659, 0.9843137, 0, 1, 1,
0.8793526, -0.3869195, 3.524262, 0.9921569, 0, 1, 1,
0.8827008, 0.9112597, -0.2523157, 0.9960784, 0, 1, 1,
0.8859577, -1.184369, 3.524661, 1, 0, 0.9960784, 1,
0.8866118, 0.8912415, -0.5557168, 1, 0, 0.9882353, 1,
0.8885753, -0.5844859, 4.183413, 1, 0, 0.9843137, 1,
0.8988981, -1.00821, 1.81173, 1, 0, 0.9764706, 1,
0.905321, 0.8350002, 0.5796599, 1, 0, 0.972549, 1,
0.9120983, -1.398486, 2.576166, 1, 0, 0.9647059, 1,
0.9140007, 1.011935, 0.3782136, 1, 0, 0.9607843, 1,
0.9165519, 0.4061334, 0.7152758, 1, 0, 0.9529412, 1,
0.9208512, -0.3853502, -0.7342096, 1, 0, 0.9490196, 1,
0.9273621, -1.063941, 0.4682197, 1, 0, 0.9411765, 1,
0.9275589, 0.6583812, 0.6200097, 1, 0, 0.9372549, 1,
0.929359, 0.3539204, 2.277829, 1, 0, 0.9294118, 1,
0.9314333, 0.5429729, 1.709396, 1, 0, 0.9254902, 1,
0.9341223, -1.000273, 3.817928, 1, 0, 0.9176471, 1,
0.9358258, -1.757516, 3.307895, 1, 0, 0.9137255, 1,
0.9389023, -1.337758, 1.052566, 1, 0, 0.9058824, 1,
0.9477941, 0.9481224, -0.01453608, 1, 0, 0.9019608, 1,
0.9513776, 0.4912786, 0.5716748, 1, 0, 0.8941177, 1,
0.9537714, 2.05228, -0.07945564, 1, 0, 0.8862745, 1,
0.95495, 0.06466035, 1.346687, 1, 0, 0.8823529, 1,
0.9608439, -1.273387, 4.064941, 1, 0, 0.8745098, 1,
0.9636681, -0.5712688, 1.612912, 1, 0, 0.8705882, 1,
0.9662862, 0.1755932, 3.268462, 1, 0, 0.8627451, 1,
0.9670644, -1.192589, 2.093548, 1, 0, 0.8588235, 1,
0.9710866, -1.649914, 0.8748772, 1, 0, 0.8509804, 1,
0.9726487, 0.9487955, 0.6319738, 1, 0, 0.8470588, 1,
0.9751403, 0.6138715, 0.1965183, 1, 0, 0.8392157, 1,
0.9761295, 1.228572, 0.189036, 1, 0, 0.8352941, 1,
0.9834903, -1.024759, 1.702001, 1, 0, 0.827451, 1,
0.9838017, 0.4014248, 1.91263, 1, 0, 0.8235294, 1,
0.985725, -0.4921374, 3.636438, 1, 0, 0.8156863, 1,
0.9861974, -1.754089, 2.319256, 1, 0, 0.8117647, 1,
0.9909641, -1.268453, 2.607396, 1, 0, 0.8039216, 1,
0.9995105, -1.563509, 1.690238, 1, 0, 0.7960784, 1,
1.002724, 0.7565391, 0.7201518, 1, 0, 0.7921569, 1,
1.003044, 0.9868377, 1.220186, 1, 0, 0.7843137, 1,
1.008918, 0.7459155, 0.7956452, 1, 0, 0.7803922, 1,
1.01989, -0.6143054, 2.951884, 1, 0, 0.772549, 1,
1.033246, -0.151163, 2.703166, 1, 0, 0.7686275, 1,
1.041303, 0.5816994, 1.780892, 1, 0, 0.7607843, 1,
1.044724, -0.9955276, 2.118765, 1, 0, 0.7568628, 1,
1.049364, 1.129732, 1.565218, 1, 0, 0.7490196, 1,
1.057298, 0.2160483, 0.7140033, 1, 0, 0.7450981, 1,
1.059587, 1.004828, 0.6843139, 1, 0, 0.7372549, 1,
1.070099, 1.117342, 0.2514451, 1, 0, 0.7333333, 1,
1.070639, -1.793178, 1.276384, 1, 0, 0.7254902, 1,
1.074292, 1.662682, 1.899616, 1, 0, 0.7215686, 1,
1.08302, 1.104395, -0.1246576, 1, 0, 0.7137255, 1,
1.083899, -1.564998, 3.44279, 1, 0, 0.7098039, 1,
1.087916, -0.4369914, 1.662548, 1, 0, 0.7019608, 1,
1.0902, 0.6675773, 2.522629, 1, 0, 0.6941177, 1,
1.091621, -0.7955667, 3.581667, 1, 0, 0.6901961, 1,
1.094942, -1.077201, 4.016744, 1, 0, 0.682353, 1,
1.09875, 0.8222447, -0.2679446, 1, 0, 0.6784314, 1,
1.098955, -1.658056, 2.101444, 1, 0, 0.6705883, 1,
1.106417, 0.06144006, 1.259886, 1, 0, 0.6666667, 1,
1.111262, 0.4219638, -0.4697598, 1, 0, 0.6588235, 1,
1.115325, 0.0772597, 1.122997, 1, 0, 0.654902, 1,
1.123334, -0.4436282, 4.291312, 1, 0, 0.6470588, 1,
1.127415, -0.6535887, 1.98517, 1, 0, 0.6431373, 1,
1.131903, -0.1887695, 2.595911, 1, 0, 0.6352941, 1,
1.140598, 1.614368, 2.131829, 1, 0, 0.6313726, 1,
1.147598, 0.9900784, 2.693564, 1, 0, 0.6235294, 1,
1.152445, -0.8218452, 1.222217, 1, 0, 0.6196079, 1,
1.156078, 0.2907426, 1.69674, 1, 0, 0.6117647, 1,
1.164212, 0.9388642, 2.479964, 1, 0, 0.6078432, 1,
1.16992, -0.6794937, 1.959541, 1, 0, 0.6, 1,
1.171458, -0.2682059, 3.323588, 1, 0, 0.5921569, 1,
1.17762, -0.1537811, 3.522613, 1, 0, 0.5882353, 1,
1.182508, 0.8697017, 1.06563, 1, 0, 0.5803922, 1,
1.185741, 0.3553243, 1.676185, 1, 0, 0.5764706, 1,
1.185926, 1.285622, 1.524088, 1, 0, 0.5686275, 1,
1.187292, 0.2746873, 1.795089, 1, 0, 0.5647059, 1,
1.190715, 1.35941, 1.344207, 1, 0, 0.5568628, 1,
1.193907, -0.05349433, 4.482141, 1, 0, 0.5529412, 1,
1.198963, 0.5499781, 3.035331, 1, 0, 0.5450981, 1,
1.203567, 0.3627748, 1.712243, 1, 0, 0.5411765, 1,
1.204232, 0.7111455, 2.109217, 1, 0, 0.5333334, 1,
1.232219, 0.587786, 0.9483627, 1, 0, 0.5294118, 1,
1.234765, 1.529794, 2.468602, 1, 0, 0.5215687, 1,
1.236084, -0.1200587, 2.891823, 1, 0, 0.5176471, 1,
1.247683, -1.377973, 2.364018, 1, 0, 0.509804, 1,
1.2684, 0.3238013, 1.992709, 1, 0, 0.5058824, 1,
1.269995, -0.4132608, 1.013328, 1, 0, 0.4980392, 1,
1.278871, 0.6818001, 2.778563, 1, 0, 0.4901961, 1,
1.291822, -0.5725619, 3.49404, 1, 0, 0.4862745, 1,
1.309861, -0.1928309, 3.22906, 1, 0, 0.4784314, 1,
1.313231, -0.5930818, 0.1006801, 1, 0, 0.4745098, 1,
1.315023, -1.95101, 1.564084, 1, 0, 0.4666667, 1,
1.315911, -0.7009635, 3.334357, 1, 0, 0.4627451, 1,
1.316088, 1.170901, 0.1898614, 1, 0, 0.454902, 1,
1.323379, 0.4548428, 0.79447, 1, 0, 0.4509804, 1,
1.331017, -0.2064842, 2.192899, 1, 0, 0.4431373, 1,
1.331471, 1.367797, -1.042513, 1, 0, 0.4392157, 1,
1.334671, 0.4279867, 1.153752, 1, 0, 0.4313726, 1,
1.343184, 0.6049544, 0.4065352, 1, 0, 0.427451, 1,
1.345535, -1.495275, 3.350598, 1, 0, 0.4196078, 1,
1.363927, -1.338405, 2.797474, 1, 0, 0.4156863, 1,
1.364953, 0.1731828, 1.46511, 1, 0, 0.4078431, 1,
1.379847, 0.829247, 0.9434096, 1, 0, 0.4039216, 1,
1.405139, -0.479719, 4.026656, 1, 0, 0.3960784, 1,
1.409943, 1.939291, 0.3110891, 1, 0, 0.3882353, 1,
1.423824, 0.7726222, 0.3854646, 1, 0, 0.3843137, 1,
1.424871, -2.331949, 3.041334, 1, 0, 0.3764706, 1,
1.443537, -0.2220509, 1.771512, 1, 0, 0.372549, 1,
1.462515, 0.4485723, 1.063044, 1, 0, 0.3647059, 1,
1.473678, 1.610855, 0.5244675, 1, 0, 0.3607843, 1,
1.475445, -0.811627, 0.2059868, 1, 0, 0.3529412, 1,
1.478631, 0.000453855, 0.7787352, 1, 0, 0.3490196, 1,
1.49096, 0.6627366, 0.361153, 1, 0, 0.3411765, 1,
1.498621, -0.6083573, 2.871536, 1, 0, 0.3372549, 1,
1.517528, -0.642294, 0.4232194, 1, 0, 0.3294118, 1,
1.517774, 0.1968959, 1.163735, 1, 0, 0.3254902, 1,
1.526708, -1.00877, 0.8687131, 1, 0, 0.3176471, 1,
1.528212, -0.4154137, 2.647264, 1, 0, 0.3137255, 1,
1.530528, 1.20771, 1.286703, 1, 0, 0.3058824, 1,
1.534211, -0.8537234, 3.353642, 1, 0, 0.2980392, 1,
1.538056, 0.06689122, 1.32855, 1, 0, 0.2941177, 1,
1.548378, 0.09455254, 0.9435517, 1, 0, 0.2862745, 1,
1.550595, 0.04565268, 1.693425, 1, 0, 0.282353, 1,
1.555159, 1.101672, -0.3974949, 1, 0, 0.2745098, 1,
1.560958, 0.9083015, 0.1787479, 1, 0, 0.2705882, 1,
1.572169, 0.4351236, 1.592825, 1, 0, 0.2627451, 1,
1.587845, 0.07108572, 2.032666, 1, 0, 0.2588235, 1,
1.607591, 0.2265071, 3.078641, 1, 0, 0.2509804, 1,
1.617486, 1.85811, -0.1979401, 1, 0, 0.2470588, 1,
1.618451, -0.001078199, 1.39199, 1, 0, 0.2392157, 1,
1.625208, 0.4172051, 1.375381, 1, 0, 0.2352941, 1,
1.668916, -0.7089512, 0.18902, 1, 0, 0.227451, 1,
1.703826, -1.391318, 2.96202, 1, 0, 0.2235294, 1,
1.705775, 0.4818333, 1.829671, 1, 0, 0.2156863, 1,
1.70721, 0.8772779, 0.8040956, 1, 0, 0.2117647, 1,
1.72166, 1.420041, 1.163009, 1, 0, 0.2039216, 1,
1.730038, -2.124823, 5.042533, 1, 0, 0.1960784, 1,
1.786544, -1.340937, 1.83183, 1, 0, 0.1921569, 1,
1.813329, -1.772813, 2.407417, 1, 0, 0.1843137, 1,
1.817171, 0.3746569, 2.06779, 1, 0, 0.1803922, 1,
1.83956, -0.9850561, 1.622607, 1, 0, 0.172549, 1,
1.855404, -0.7476531, 2.821515, 1, 0, 0.1686275, 1,
1.890628, 0.4878395, 1.841829, 1, 0, 0.1607843, 1,
1.909649, -0.2023434, 2.704177, 1, 0, 0.1568628, 1,
1.918274, -0.5054507, 0.7268711, 1, 0, 0.1490196, 1,
1.926073, 1.618891, 1.565592, 1, 0, 0.145098, 1,
1.929834, -0.3866471, 2.528337, 1, 0, 0.1372549, 1,
1.940401, -0.5147023, 1.603369, 1, 0, 0.1333333, 1,
1.945839, 0.4060797, 2.536549, 1, 0, 0.1254902, 1,
1.952997, -0.02157629, 1.498713, 1, 0, 0.1215686, 1,
1.953165, 0.4281298, 0.7448342, 1, 0, 0.1137255, 1,
1.984418, 0.6705184, 1.258254, 1, 0, 0.1098039, 1,
2.004133, 1.664993, 0.5176677, 1, 0, 0.1019608, 1,
2.075198, -0.4634003, 0.9268183, 1, 0, 0.09411765, 1,
2.100901, -2.719065, 2.352061, 1, 0, 0.09019608, 1,
2.128801, -0.3579212, 1.004454, 1, 0, 0.08235294, 1,
2.13647, -0.4849592, 1.378617, 1, 0, 0.07843138, 1,
2.150541, 0.8334965, 0.1724103, 1, 0, 0.07058824, 1,
2.153303, 0.6803927, 0.883546, 1, 0, 0.06666667, 1,
2.187682, -0.7822492, 1.99683, 1, 0, 0.05882353, 1,
2.290395, -0.68275, 0.0357008, 1, 0, 0.05490196, 1,
2.330521, 0.8745205, 1.100575, 1, 0, 0.04705882, 1,
2.331891, -0.2773778, 1.974725, 1, 0, 0.04313726, 1,
2.336051, 0.3790339, 4.355699, 1, 0, 0.03529412, 1,
2.441539, 0.4115075, 3.152224, 1, 0, 0.03137255, 1,
2.707314, 1.643048, 3.02509, 1, 0, 0.02352941, 1,
3.238333, -0.4056552, 0.043648, 1, 0, 0.01960784, 1,
3.336039, 0.1897587, 1.468108, 1, 0, 0.01176471, 1,
3.436836, 0.4881879, 0.5337614, 1, 0, 0.007843138, 1
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
0.3567132, -4.93433, -8.450453, 0, -0.5, 0.5, 0.5,
0.3567132, -4.93433, -8.450453, 1, -0.5, 0.5, 0.5,
0.3567132, -4.93433, -8.450453, 1, 1.5, 0.5, 0.5,
0.3567132, -4.93433, -8.450453, 0, 1.5, 0.5, 0.5
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
-3.767571, -0.05385959, -8.450453, 0, -0.5, 0.5, 0.5,
-3.767571, -0.05385959, -8.450453, 1, -0.5, 0.5, 0.5,
-3.767571, -0.05385959, -8.450453, 1, 1.5, 0.5, 0.5,
-3.767571, -0.05385959, -8.450453, 0, 1.5, 0.5, 0.5
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
-3.767571, -4.93433, -0.6311662, 0, -0.5, 0.5, 0.5,
-3.767571, -4.93433, -0.6311662, 1, -0.5, 0.5, 0.5,
-3.767571, -4.93433, -0.6311662, 1, 1.5, 0.5, 0.5,
-3.767571, -4.93433, -0.6311662, 0, 1.5, 0.5, 0.5
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
-2, -3.808068, -6.646002,
3, -3.808068, -6.646002,
-2, -3.808068, -6.646002,
-2, -3.995778, -6.946743,
-1, -3.808068, -6.646002,
-1, -3.995778, -6.946743,
0, -3.808068, -6.646002,
0, -3.995778, -6.946743,
1, -3.808068, -6.646002,
1, -3.995778, -6.946743,
2, -3.808068, -6.646002,
2, -3.995778, -6.946743,
3, -3.808068, -6.646002,
3, -3.995778, -6.946743
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
-2, -4.371199, -7.548227, 0, -0.5, 0.5, 0.5,
-2, -4.371199, -7.548227, 1, -0.5, 0.5, 0.5,
-2, -4.371199, -7.548227, 1, 1.5, 0.5, 0.5,
-2, -4.371199, -7.548227, 0, 1.5, 0.5, 0.5,
-1, -4.371199, -7.548227, 0, -0.5, 0.5, 0.5,
-1, -4.371199, -7.548227, 1, -0.5, 0.5, 0.5,
-1, -4.371199, -7.548227, 1, 1.5, 0.5, 0.5,
-1, -4.371199, -7.548227, 0, 1.5, 0.5, 0.5,
0, -4.371199, -7.548227, 0, -0.5, 0.5, 0.5,
0, -4.371199, -7.548227, 1, -0.5, 0.5, 0.5,
0, -4.371199, -7.548227, 1, 1.5, 0.5, 0.5,
0, -4.371199, -7.548227, 0, 1.5, 0.5, 0.5,
1, -4.371199, -7.548227, 0, -0.5, 0.5, 0.5,
1, -4.371199, -7.548227, 1, -0.5, 0.5, 0.5,
1, -4.371199, -7.548227, 1, 1.5, 0.5, 0.5,
1, -4.371199, -7.548227, 0, 1.5, 0.5, 0.5,
2, -4.371199, -7.548227, 0, -0.5, 0.5, 0.5,
2, -4.371199, -7.548227, 1, -0.5, 0.5, 0.5,
2, -4.371199, -7.548227, 1, 1.5, 0.5, 0.5,
2, -4.371199, -7.548227, 0, 1.5, 0.5, 0.5,
3, -4.371199, -7.548227, 0, -0.5, 0.5, 0.5,
3, -4.371199, -7.548227, 1, -0.5, 0.5, 0.5,
3, -4.371199, -7.548227, 1, 1.5, 0.5, 0.5,
3, -4.371199, -7.548227, 0, 1.5, 0.5, 0.5
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
-2.815813, -2, -6.646002,
-2.815813, 2, -6.646002,
-2.815813, -2, -6.646002,
-2.974439, -2, -6.946743,
-2.815813, 0, -6.646002,
-2.974439, 0, -6.946743,
-2.815813, 2, -6.646002,
-2.974439, 2, -6.946743
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
"0",
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
-3.291692, -2, -7.548227, 0, -0.5, 0.5, 0.5,
-3.291692, -2, -7.548227, 1, -0.5, 0.5, 0.5,
-3.291692, -2, -7.548227, 1, 1.5, 0.5, 0.5,
-3.291692, -2, -7.548227, 0, 1.5, 0.5, 0.5,
-3.291692, 0, -7.548227, 0, -0.5, 0.5, 0.5,
-3.291692, 0, -7.548227, 1, -0.5, 0.5, 0.5,
-3.291692, 0, -7.548227, 1, 1.5, 0.5, 0.5,
-3.291692, 0, -7.548227, 0, 1.5, 0.5, 0.5,
-3.291692, 2, -7.548227, 0, -0.5, 0.5, 0.5,
-3.291692, 2, -7.548227, 1, -0.5, 0.5, 0.5,
-3.291692, 2, -7.548227, 1, 1.5, 0.5, 0.5,
-3.291692, 2, -7.548227, 0, 1.5, 0.5, 0.5
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
-2.815813, -3.808068, -6,
-2.815813, -3.808068, 4,
-2.815813, -3.808068, -6,
-2.974439, -3.995778, -6,
-2.815813, -3.808068, -4,
-2.974439, -3.995778, -4,
-2.815813, -3.808068, -2,
-2.974439, -3.995778, -2,
-2.815813, -3.808068, 0,
-2.974439, -3.995778, 0,
-2.815813, -3.808068, 2,
-2.974439, -3.995778, 2,
-2.815813, -3.808068, 4,
-2.974439, -3.995778, 4
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
-3.291692, -4.371199, -6, 0, -0.5, 0.5, 0.5,
-3.291692, -4.371199, -6, 1, -0.5, 0.5, 0.5,
-3.291692, -4.371199, -6, 1, 1.5, 0.5, 0.5,
-3.291692, -4.371199, -6, 0, 1.5, 0.5, 0.5,
-3.291692, -4.371199, -4, 0, -0.5, 0.5, 0.5,
-3.291692, -4.371199, -4, 1, -0.5, 0.5, 0.5,
-3.291692, -4.371199, -4, 1, 1.5, 0.5, 0.5,
-3.291692, -4.371199, -4, 0, 1.5, 0.5, 0.5,
-3.291692, -4.371199, -2, 0, -0.5, 0.5, 0.5,
-3.291692, -4.371199, -2, 1, -0.5, 0.5, 0.5,
-3.291692, -4.371199, -2, 1, 1.5, 0.5, 0.5,
-3.291692, -4.371199, -2, 0, 1.5, 0.5, 0.5,
-3.291692, -4.371199, 0, 0, -0.5, 0.5, 0.5,
-3.291692, -4.371199, 0, 1, -0.5, 0.5, 0.5,
-3.291692, -4.371199, 0, 1, 1.5, 0.5, 0.5,
-3.291692, -4.371199, 0, 0, 1.5, 0.5, 0.5,
-3.291692, -4.371199, 2, 0, -0.5, 0.5, 0.5,
-3.291692, -4.371199, 2, 1, -0.5, 0.5, 0.5,
-3.291692, -4.371199, 2, 1, 1.5, 0.5, 0.5,
-3.291692, -4.371199, 2, 0, 1.5, 0.5, 0.5,
-3.291692, -4.371199, 4, 0, -0.5, 0.5, 0.5,
-3.291692, -4.371199, 4, 1, -0.5, 0.5, 0.5,
-3.291692, -4.371199, 4, 1, 1.5, 0.5, 0.5,
-3.291692, -4.371199, 4, 0, 1.5, 0.5, 0.5
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
-2.815813, -3.808068, -6.646002,
-2.815813, 3.700349, -6.646002,
-2.815813, -3.808068, 5.383669,
-2.815813, 3.700349, 5.383669,
-2.815813, -3.808068, -6.646002,
-2.815813, -3.808068, 5.383669,
-2.815813, 3.700349, -6.646002,
-2.815813, 3.700349, 5.383669,
-2.815813, -3.808068, -6.646002,
3.529239, -3.808068, -6.646002,
-2.815813, -3.808068, 5.383669,
3.529239, -3.808068, 5.383669,
-2.815813, 3.700349, -6.646002,
3.529239, 3.700349, -6.646002,
-2.815813, 3.700349, 5.383669,
3.529239, 3.700349, 5.383669,
3.529239, -3.808068, -6.646002,
3.529239, 3.700349, -6.646002,
3.529239, -3.808068, 5.383669,
3.529239, 3.700349, 5.383669,
3.529239, -3.808068, -6.646002,
3.529239, -3.808068, 5.383669,
3.529239, 3.700349, -6.646002,
3.529239, 3.700349, 5.383669
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
var radius = 8.295608;
var distance = 36.9081;
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
mvMatrix.translate( -0.3567132, 0.05385959, 0.6311662 );
mvMatrix.scale( 1.413601, 1.194576, 0.7456042 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.9081);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Carbendazim<-read.table("Carbendazim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Carbendazim$V2
```

```
## Error in eval(expr, envir, enclos): object 'Carbendazim' not found
```

```r
y<-Carbendazim$V3
```

```
## Error in eval(expr, envir, enclos): object 'Carbendazim' not found
```

```r
z<-Carbendazim$V4
```

```
## Error in eval(expr, envir, enclos): object 'Carbendazim' not found
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
-2.723409, 1.469928, -1.215813, 0, 0, 1, 1, 1,
-2.570168, 0.4880225, -1.045507, 1, 0, 0, 1, 1,
-2.486085, -0.5429673, -2.658639, 1, 0, 0, 1, 1,
-2.427418, 0.1078174, -1.192741, 1, 0, 0, 1, 1,
-2.3858, -0.7351141, -2.712416, 1, 0, 0, 1, 1,
-2.243635, -1.487189, -0.7171697, 1, 0, 0, 1, 1,
-2.23432, -1.562738, -1.242856, 0, 0, 0, 1, 1,
-2.191001, 1.361074, -0.6229854, 0, 0, 0, 1, 1,
-2.178772, -0.03229742, -1.645362, 0, 0, 0, 1, 1,
-2.162636, -1.849197, -4.117112, 0, 0, 0, 1, 1,
-2.160129, 1.192513, 1.28463, 0, 0, 0, 1, 1,
-2.142691, -1.050787, -2.225131, 0, 0, 0, 1, 1,
-2.135615, 0.8314363, -0.8749284, 0, 0, 0, 1, 1,
-2.126316, -0.8176974, -2.213944, 1, 1, 1, 1, 1,
-2.086082, 0.4519422, -1.515495, 1, 1, 1, 1, 1,
-2.081469, -1.329658, -1.676912, 1, 1, 1, 1, 1,
-2.06848, 1.996053, -0.2845593, 1, 1, 1, 1, 1,
-2.062856, -1.016586, -0.3843667, 1, 1, 1, 1, 1,
-2.011894, 0.01085604, -1.813643, 1, 1, 1, 1, 1,
-1.978355, 0.02750683, -2.634363, 1, 1, 1, 1, 1,
-1.970159, 0.1977299, -1.685183, 1, 1, 1, 1, 1,
-1.944771, -0.2790786, 0.1172418, 1, 1, 1, 1, 1,
-1.940498, 2.215446, -1.542388, 1, 1, 1, 1, 1,
-1.915799, 0.8558431, -0.6747269, 1, 1, 1, 1, 1,
-1.887839, -0.9545826, -1.094246, 1, 1, 1, 1, 1,
-1.885401, 0.1509484, -2.042233, 1, 1, 1, 1, 1,
-1.86818, 2.267838, -1.59765, 1, 1, 1, 1, 1,
-1.861631, -0.6613753, -2.254721, 1, 1, 1, 1, 1,
-1.848703, 0.5237414, -2.485309, 0, 0, 1, 1, 1,
-1.811456, -0.2566473, -2.127043, 1, 0, 0, 1, 1,
-1.797398, 0.8964221, -2.018871, 1, 0, 0, 1, 1,
-1.794318, 1.24942, -0.04571174, 1, 0, 0, 1, 1,
-1.786742, 0.3493918, -0.2365997, 1, 0, 0, 1, 1,
-1.785067, -0.3859614, -2.481517, 1, 0, 0, 1, 1,
-1.760659, -0.1661676, -1.986493, 0, 0, 0, 1, 1,
-1.739, 0.2549319, -0.9271493, 0, 0, 0, 1, 1,
-1.732566, 1.426215, 0.5558246, 0, 0, 0, 1, 1,
-1.721623, 0.6432481, -2.557647, 0, 0, 0, 1, 1,
-1.704942, 1.331647, -0.7390322, 0, 0, 0, 1, 1,
-1.697264, 0.6574131, -0.8080646, 0, 0, 0, 1, 1,
-1.658006, -0.5558819, -1.888144, 0, 0, 0, 1, 1,
-1.652752, -0.7655184, -2.802989, 1, 1, 1, 1, 1,
-1.641724, 0.9634389, -0.01482094, 1, 1, 1, 1, 1,
-1.641012, -0.6900065, -4.528572, 1, 1, 1, 1, 1,
-1.636645, 0.5972282, -0.1614697, 1, 1, 1, 1, 1,
-1.620525, -0.4267779, -0.6643987, 1, 1, 1, 1, 1,
-1.619793, -1.543358, -2.152685, 1, 1, 1, 1, 1,
-1.609945, 0.5838754, -0.4251673, 1, 1, 1, 1, 1,
-1.595217, -2.193195, -2.519925, 1, 1, 1, 1, 1,
-1.58882, -0.01620127, -2.566871, 1, 1, 1, 1, 1,
-1.567159, -1.768741, -2.221241, 1, 1, 1, 1, 1,
-1.561951, -0.1046246, -0.6941977, 1, 1, 1, 1, 1,
-1.555223, -2.19021, -2.388997, 1, 1, 1, 1, 1,
-1.554558, -2.165913, -2.117384, 1, 1, 1, 1, 1,
-1.550929, 1.6677, -0.8657479, 1, 1, 1, 1, 1,
-1.550214, -0.2106599, -2.31515, 1, 1, 1, 1, 1,
-1.548478, 0.7979449, -0.913512, 0, 0, 1, 1, 1,
-1.545896, -2.584201, -2.530926, 1, 0, 0, 1, 1,
-1.545336, 0.02419703, -1.354163, 1, 0, 0, 1, 1,
-1.544633, -0.1260847, -0.5457702, 1, 0, 0, 1, 1,
-1.541896, -0.6378787, -1.524777, 1, 0, 0, 1, 1,
-1.54141, -0.2454086, -2.344795, 1, 0, 0, 1, 1,
-1.52553, -1.136247, -1.96028, 0, 0, 0, 1, 1,
-1.519715, 0.1628099, -1.639161, 0, 0, 0, 1, 1,
-1.510014, 1.915512, -0.9162924, 0, 0, 0, 1, 1,
-1.487547, 0.8388764, -1.311707, 0, 0, 0, 1, 1,
-1.476269, -0.05556951, -0.6685317, 0, 0, 0, 1, 1,
-1.474583, 1.889649, -1.676294, 0, 0, 0, 1, 1,
-1.473531, -1.621397, -1.347343, 0, 0, 0, 1, 1,
-1.471612, 0.7487852, -2.498277, 1, 1, 1, 1, 1,
-1.468979, -0.0784156, -1.040338, 1, 1, 1, 1, 1,
-1.468331, -0.3728501, -2.289323, 1, 1, 1, 1, 1,
-1.456039, 0.9133076, -1.746162, 1, 1, 1, 1, 1,
-1.44526, 0.5099086, -0.2119744, 1, 1, 1, 1, 1,
-1.439579, -0.4244936, -2.20678, 1, 1, 1, 1, 1,
-1.428354, -1.348133, -2.437596, 1, 1, 1, 1, 1,
-1.419902, 1.362067, -0.7192941, 1, 1, 1, 1, 1,
-1.411437, -0.08304001, -1.531174, 1, 1, 1, 1, 1,
-1.411371, -1.513491, -1.612863, 1, 1, 1, 1, 1,
-1.405946, -0.7843236, -1.054405, 1, 1, 1, 1, 1,
-1.402134, -0.4706367, -3.815093, 1, 1, 1, 1, 1,
-1.395258, -0.2604178, -2.952779, 1, 1, 1, 1, 1,
-1.384466, -1.179547, -2.69804, 1, 1, 1, 1, 1,
-1.374618, 1.714038, 0.3057857, 1, 1, 1, 1, 1,
-1.374266, 1.524976, 0.4619145, 0, 0, 1, 1, 1,
-1.369238, 0.8323722, -1.224503, 1, 0, 0, 1, 1,
-1.367001, 0.01546924, -0.6636656, 1, 0, 0, 1, 1,
-1.363298, -1.368948, -2.172092, 1, 0, 0, 1, 1,
-1.360828, -1.613839, -3.033743, 1, 0, 0, 1, 1,
-1.360788, -0.8756779, -2.765541, 1, 0, 0, 1, 1,
-1.351653, -0.9272438, -1.498237, 0, 0, 0, 1, 1,
-1.345675, -1.272446, -1.7376, 0, 0, 0, 1, 1,
-1.33355, -1.042945, -3.051509, 0, 0, 0, 1, 1,
-1.329865, -0.8794516, -1.371195, 0, 0, 0, 1, 1,
-1.328614, -0.3655609, -2.4472, 0, 0, 0, 1, 1,
-1.323754, -0.1203581, -0.2167025, 0, 0, 0, 1, 1,
-1.322423, 0.3128629, 0.325782, 0, 0, 0, 1, 1,
-1.311689, -0.8562531, -1.853919, 1, 1, 1, 1, 1,
-1.306631, 0.07322134, -2.240219, 1, 1, 1, 1, 1,
-1.305873, 0.8145858, -0.8051468, 1, 1, 1, 1, 1,
-1.301815, 0.02335198, -2.402516, 1, 1, 1, 1, 1,
-1.300431, -0.9806734, -1.928568, 1, 1, 1, 1, 1,
-1.279076, 0.2158649, -1.519104, 1, 1, 1, 1, 1,
-1.274605, 0.01802817, -2.027083, 1, 1, 1, 1, 1,
-1.270887, -0.122391, -1.52083, 1, 1, 1, 1, 1,
-1.267569, 0.4553235, 1.601133, 1, 1, 1, 1, 1,
-1.260968, 1.928311, -3.06812, 1, 1, 1, 1, 1,
-1.251122, -0.9441463, -1.013331, 1, 1, 1, 1, 1,
-1.248894, 0.4309089, -0.07258938, 1, 1, 1, 1, 1,
-1.245277, 0.1312009, -0.9372007, 1, 1, 1, 1, 1,
-1.226765, 0.6653659, -0.5786161, 1, 1, 1, 1, 1,
-1.225729, 0.6401429, -0.6704095, 1, 1, 1, 1, 1,
-1.221753, -1.777943, -1.072625, 0, 0, 1, 1, 1,
-1.194112, -0.2421202, -2.184004, 1, 0, 0, 1, 1,
-1.192017, 1.581465, -0.9914259, 1, 0, 0, 1, 1,
-1.188296, 0.1756918, -2.04395, 1, 0, 0, 1, 1,
-1.187988, 0.2050663, -1.285386, 1, 0, 0, 1, 1,
-1.183697, -0.06499602, -1.932131, 1, 0, 0, 1, 1,
-1.183562, 1.301824, 0.4049542, 0, 0, 0, 1, 1,
-1.180493, 1.126865, 1.543176, 0, 0, 0, 1, 1,
-1.168567, -1.044173, -3.567829, 0, 0, 0, 1, 1,
-1.16592, 0.1648804, -0.8745633, 0, 0, 0, 1, 1,
-1.161066, 0.1812802, 0.3694799, 0, 0, 0, 1, 1,
-1.159293, -0.1503902, -0.9151692, 0, 0, 0, 1, 1,
-1.147607, 0.3901461, -2.586072, 0, 0, 0, 1, 1,
-1.144369, 0.32774, -2.444515, 1, 1, 1, 1, 1,
-1.137776, 0.9863735, 1.267482, 1, 1, 1, 1, 1,
-1.126883, -0.3971988, -3.578525, 1, 1, 1, 1, 1,
-1.122207, 0.841667, 0.3829797, 1, 1, 1, 1, 1,
-1.11719, 0.3456867, -1.733299, 1, 1, 1, 1, 1,
-1.116027, -1.887334, -3.063907, 1, 1, 1, 1, 1,
-1.112865, -1.871997, -2.625952, 1, 1, 1, 1, 1,
-1.111514, -0.006489383, -2.527574, 1, 1, 1, 1, 1,
-1.101672, 1.148145, -1.376933, 1, 1, 1, 1, 1,
-1.101339, 0.1100607, -1.529408, 1, 1, 1, 1, 1,
-1.099405, -1.826001, -3.813952, 1, 1, 1, 1, 1,
-1.099305, 0.9151914, 0.320582, 1, 1, 1, 1, 1,
-1.09898, -0.188917, -0.5355621, 1, 1, 1, 1, 1,
-1.098772, -0.4467648, -1.862903, 1, 1, 1, 1, 1,
-1.094352, -0.1359583, -0.8650905, 1, 1, 1, 1, 1,
-1.091526, -0.2630512, -1.495282, 0, 0, 1, 1, 1,
-1.082246, 0.4190498, -1.12171, 1, 0, 0, 1, 1,
-1.077182, -1.881009, -2.844701, 1, 0, 0, 1, 1,
-1.073849, -0.7317895, -2.550879, 1, 0, 0, 1, 1,
-1.070423, -1.061278, -2.340932, 1, 0, 0, 1, 1,
-1.068553, -0.2669444, -1.65143, 1, 0, 0, 1, 1,
-1.060995, -0.9534389, -2.574304, 0, 0, 0, 1, 1,
-1.046744, -1.154756, -0.8821311, 0, 0, 0, 1, 1,
-1.044457, -0.3386876, -4.931518, 0, 0, 0, 1, 1,
-1.042453, 2.2614, -1.73399, 0, 0, 0, 1, 1,
-1.035912, 0.2253113, -1.057823, 0, 0, 0, 1, 1,
-1.032354, 1.358106, -0.4794797, 0, 0, 0, 1, 1,
-1.031921, -1.427789, -2.925126, 0, 0, 0, 1, 1,
-1.031835, 1.538117, -2.387798, 1, 1, 1, 1, 1,
-1.025177, -1.012098, -2.3762, 1, 1, 1, 1, 1,
-1.023454, 1.340238, -0.6905963, 1, 1, 1, 1, 1,
-1.023231, 0.3057702, -1.001884, 1, 1, 1, 1, 1,
-1.012144, 1.235745, 0.2944448, 1, 1, 1, 1, 1,
-1.005777, 0.4783711, -1.484065, 1, 1, 1, 1, 1,
-1.002575, -0.2705469, -1.609602, 1, 1, 1, 1, 1,
-1.00163, -0.3809531, -3.201019, 1, 1, 1, 1, 1,
-1.000395, -0.6920658, -2.909882, 1, 1, 1, 1, 1,
-0.9934376, 0.9565701, -1.507186, 1, 1, 1, 1, 1,
-0.9896979, -1.566008, -3.822302, 1, 1, 1, 1, 1,
-0.9890496, 1.267804, -2.453252, 1, 1, 1, 1, 1,
-0.9807999, -0.4156214, -2.886793, 1, 1, 1, 1, 1,
-0.9781952, 0.6072226, 0.2700083, 1, 1, 1, 1, 1,
-0.9768183, -0.1032714, -2.013585, 1, 1, 1, 1, 1,
-0.9711878, -0.6741661, -2.288932, 0, 0, 1, 1, 1,
-0.966248, 0.5589572, -2.062079, 1, 0, 0, 1, 1,
-0.9657984, -1.003936, -3.509728, 1, 0, 0, 1, 1,
-0.9626678, 1.959975, -0.06173369, 1, 0, 0, 1, 1,
-0.9483066, 0.2181692, -1.112359, 1, 0, 0, 1, 1,
-0.9454084, -0.965565, -2.59578, 1, 0, 0, 1, 1,
-0.9434596, 0.5726926, -0.5340275, 0, 0, 0, 1, 1,
-0.9359344, 0.8981445, -2.451496, 0, 0, 0, 1, 1,
-0.9326087, -0.2763411, -2.965587, 0, 0, 0, 1, 1,
-0.9184891, 1.846498, -1.471572, 0, 0, 0, 1, 1,
-0.9179754, 0.07774789, -1.010371, 0, 0, 0, 1, 1,
-0.9121113, 1.889101, 0.05517164, 0, 0, 0, 1, 1,
-0.9065187, 0.2374928, -0.3534395, 0, 0, 0, 1, 1,
-0.9009059, -1.942, -2.51317, 1, 1, 1, 1, 1,
-0.8997637, -0.5714425, -3.352427, 1, 1, 1, 1, 1,
-0.897743, -0.2021388, -1.706661, 1, 1, 1, 1, 1,
-0.893927, -1.095798, -1.396417, 1, 1, 1, 1, 1,
-0.8914642, 0.8295143, -1.412698, 1, 1, 1, 1, 1,
-0.8892164, -1.101576, -1.568648, 1, 1, 1, 1, 1,
-0.8850072, -0.3156376, -0.9796413, 1, 1, 1, 1, 1,
-0.8671116, 0.2834338, 2.334856, 1, 1, 1, 1, 1,
-0.866092, 0.4040931, -0.3501133, 1, 1, 1, 1, 1,
-0.8655978, -0.1786701, -0.9210246, 1, 1, 1, 1, 1,
-0.8607922, -1.050039, -1.794323, 1, 1, 1, 1, 1,
-0.8607312, 1.142657, -1.690748, 1, 1, 1, 1, 1,
-0.8575056, 1.717748, 0.5752543, 1, 1, 1, 1, 1,
-0.857413, -0.4966697, -3.045804, 1, 1, 1, 1, 1,
-0.857344, 0.1625393, 0.2754193, 1, 1, 1, 1, 1,
-0.8563351, 2.651266, -0.03805198, 0, 0, 1, 1, 1,
-0.855742, -0.05681175, -3.221544, 1, 0, 0, 1, 1,
-0.8483291, -1.588931, -1.37168, 1, 0, 0, 1, 1,
-0.8473865, 0.488997, -2.061457, 1, 0, 0, 1, 1,
-0.8376801, 0.3701258, -1.404311, 1, 0, 0, 1, 1,
-0.8299658, 0.6630024, -0.6910865, 1, 0, 0, 1, 1,
-0.8296483, 0.6856505, -2.455499, 0, 0, 0, 1, 1,
-0.8260409, -1.519995, -3.027441, 0, 0, 0, 1, 1,
-0.8177114, 1.728464, -0.1085879, 0, 0, 0, 1, 1,
-0.8160927, -0.08649823, -0.7735342, 0, 0, 0, 1, 1,
-0.8097967, 0.5895805, -0.4413526, 0, 0, 0, 1, 1,
-0.8063958, 0.6733922, 0.5201622, 0, 0, 0, 1, 1,
-0.8051405, -1.019382, -1.974847, 0, 0, 0, 1, 1,
-0.8039299, 0.5114128, -1.192161, 1, 1, 1, 1, 1,
-0.7995805, -0.006880398, -1.855292, 1, 1, 1, 1, 1,
-0.7990068, 0.7514311, 0.4797601, 1, 1, 1, 1, 1,
-0.7948844, 1.076868, -0.7424876, 1, 1, 1, 1, 1,
-0.7931108, 1.541107, -0.9467199, 1, 1, 1, 1, 1,
-0.7880983, 0.4987465, -2.057886, 1, 1, 1, 1, 1,
-0.7865436, 1.768296, -0.5771385, 1, 1, 1, 1, 1,
-0.7825171, 1.104174, -1.916513, 1, 1, 1, 1, 1,
-0.7819015, 1.645339, -0.0341047, 1, 1, 1, 1, 1,
-0.7815589, -0.4335043, -5.008658, 1, 1, 1, 1, 1,
-0.7802924, -0.2842938, -1.069032, 1, 1, 1, 1, 1,
-0.7747721, -0.1043713, -1.653415, 1, 1, 1, 1, 1,
-0.7724116, -0.5154063, -2.749783, 1, 1, 1, 1, 1,
-0.7677246, -0.9854815, -1.395925, 1, 1, 1, 1, 1,
-0.7588273, 0.9866691, -0.1029315, 1, 1, 1, 1, 1,
-0.7586215, 0.3525835, -0.6270836, 0, 0, 1, 1, 1,
-0.7577783, 0.1151419, -1.695628, 1, 0, 0, 1, 1,
-0.7550316, 0.2721833, -1.066777, 1, 0, 0, 1, 1,
-0.754842, 2.35614, 1.457986, 1, 0, 0, 1, 1,
-0.7518145, -0.02362464, -1.722157, 1, 0, 0, 1, 1,
-0.7513462, -0.7847453, -3.678128, 1, 0, 0, 1, 1,
-0.744446, 0.03319094, -1.875515, 0, 0, 0, 1, 1,
-0.7319112, -0.416389, -1.412096, 0, 0, 0, 1, 1,
-0.7267846, -2.617167, 0.6984338, 0, 0, 0, 1, 1,
-0.7260628, 0.4580242, -0.1117071, 0, 0, 0, 1, 1,
-0.7254775, -1.598017, -3.025543, 0, 0, 0, 1, 1,
-0.7244116, -1.364523, -3.170188, 0, 0, 0, 1, 1,
-0.723215, -1.556421, -2.311177, 0, 0, 0, 1, 1,
-0.7216774, -0.6190431, -3.253525, 1, 1, 1, 1, 1,
-0.7202296, 0.02024388, -1.234701, 1, 1, 1, 1, 1,
-0.719307, 1.40273, -0.7762201, 1, 1, 1, 1, 1,
-0.7156317, -1.911797, -2.467427, 1, 1, 1, 1, 1,
-0.712261, 1.172855, -0.8917158, 1, 1, 1, 1, 1,
-0.711938, -1.09349, -3.839906, 1, 1, 1, 1, 1,
-0.7113163, 0.9533726, -1.089836, 1, 1, 1, 1, 1,
-0.7066882, -2.189998, -3.521419, 1, 1, 1, 1, 1,
-0.6935349, -0.5578119, -1.425946, 1, 1, 1, 1, 1,
-0.6918754, -0.4106387, -2.536914, 1, 1, 1, 1, 1,
-0.6902454, 1.447796, -0.2315582, 1, 1, 1, 1, 1,
-0.6879053, -1.384368, -1.801672, 1, 1, 1, 1, 1,
-0.6871896, -1.158056, -2.789469, 1, 1, 1, 1, 1,
-0.6855587, 0.6625362, -0.9362774, 1, 1, 1, 1, 1,
-0.6758293, -0.4639837, -1.340909, 1, 1, 1, 1, 1,
-0.6753716, 1.0692, -0.0009992202, 0, 0, 1, 1, 1,
-0.6738402, -0.3494951, -2.294637, 1, 0, 0, 1, 1,
-0.6707559, 1.744024, -0.477699, 1, 0, 0, 1, 1,
-0.6613008, 1.916186, -0.5875582, 1, 0, 0, 1, 1,
-0.6565229, -0.2318608, -2.003438, 1, 0, 0, 1, 1,
-0.656476, -1.025734, -2.798463, 1, 0, 0, 1, 1,
-0.6560705, 0.5289956, -0.2091105, 0, 0, 0, 1, 1,
-0.6521475, 0.1923036, -0.4244394, 0, 0, 0, 1, 1,
-0.6464611, -1.299644, -1.879199, 0, 0, 0, 1, 1,
-0.6434376, -0.05392439, -1.876697, 0, 0, 0, 1, 1,
-0.635992, 0.3476068, -1.905176, 0, 0, 0, 1, 1,
-0.6301684, -0.2243049, -2.437571, 0, 0, 0, 1, 1,
-0.6271967, 1.400648, -0.7253481, 0, 0, 0, 1, 1,
-0.6257846, -0.8919803, -3.267159, 1, 1, 1, 1, 1,
-0.6231223, 2.328139, 2.144351, 1, 1, 1, 1, 1,
-0.6227934, -0.7247992, -1.916198, 1, 1, 1, 1, 1,
-0.6227776, 0.6327451, -1.373012, 1, 1, 1, 1, 1,
-0.6215248, 0.8409461, -0.4539478, 1, 1, 1, 1, 1,
-0.6205292, 0.5706651, -1.636992, 1, 1, 1, 1, 1,
-0.6137918, -0.1291574, -1.024861, 1, 1, 1, 1, 1,
-0.6042742, -0.8520476, -1.121428, 1, 1, 1, 1, 1,
-0.5940283, 1.374209, -1.162745, 1, 1, 1, 1, 1,
-0.5917799, 1.280844, -0.7900416, 1, 1, 1, 1, 1,
-0.5896815, 0.6960838, -1.82006, 1, 1, 1, 1, 1,
-0.5888363, -1.813313, -3.421696, 1, 1, 1, 1, 1,
-0.5872952, 0.3487869, 0.586847, 1, 1, 1, 1, 1,
-0.5828466, -0.8976775, -1.567305, 1, 1, 1, 1, 1,
-0.5826142, -2.223211, -1.619794, 1, 1, 1, 1, 1,
-0.5825431, 0.02870017, -2.402672, 0, 0, 1, 1, 1,
-0.5720022, 0.1750553, -0.2977343, 1, 0, 0, 1, 1,
-0.5652289, 1.318282, -1.207632, 1, 0, 0, 1, 1,
-0.5618034, -0.06274185, -2.969743, 1, 0, 0, 1, 1,
-0.5608707, -2.379564, -3.893972, 1, 0, 0, 1, 1,
-0.5583162, 0.548384, 0.6374556, 1, 0, 0, 1, 1,
-0.5562858, 0.2915668, -1.827385, 0, 0, 0, 1, 1,
-0.5517634, -0.09417233, -2.115881, 0, 0, 0, 1, 1,
-0.5497471, 0.2076924, -1.166578, 0, 0, 0, 1, 1,
-0.5450836, -1.083728, -2.805936, 0, 0, 0, 1, 1,
-0.5437469, 0.852662, -0.3620219, 0, 0, 0, 1, 1,
-0.5423304, 1.220494, -0.6922656, 0, 0, 0, 1, 1,
-0.537396, -0.6873188, -3.90187, 0, 0, 0, 1, 1,
-0.5360324, -0.04399499, -2.696601, 1, 1, 1, 1, 1,
-0.5351663, -0.01917232, -3.397504, 1, 1, 1, 1, 1,
-0.5305564, -1.664337, -4.322541, 1, 1, 1, 1, 1,
-0.5270727, -0.730998, -4.212273, 1, 1, 1, 1, 1,
-0.52213, 0.5164227, 0.1055185, 1, 1, 1, 1, 1,
-0.5184978, 1.438221, -1.509123, 1, 1, 1, 1, 1,
-0.5126919, -1.454499, -3.38058, 1, 1, 1, 1, 1,
-0.50991, 1.097262, -0.5948348, 1, 1, 1, 1, 1,
-0.5098476, 0.01801123, -0.7379397, 1, 1, 1, 1, 1,
-0.5075677, 1.178446, -0.2347172, 1, 1, 1, 1, 1,
-0.5065289, -0.8350749, -3.100079, 1, 1, 1, 1, 1,
-0.5048673, 0.07476936, -1.843451, 1, 1, 1, 1, 1,
-0.5044997, 0.1084037, -2.282201, 1, 1, 1, 1, 1,
-0.5035471, -0.3450798, -2.70443, 1, 1, 1, 1, 1,
-0.4999288, -1.086524, -1.917981, 1, 1, 1, 1, 1,
-0.4968487, 0.09314792, 0.7796736, 0, 0, 1, 1, 1,
-0.4942654, -1.171695, -2.895205, 1, 0, 0, 1, 1,
-0.4927295, 0.2402188, -0.4911354, 1, 0, 0, 1, 1,
-0.4913502, -0.9475306, -3.20466, 1, 0, 0, 1, 1,
-0.4873417, 2.196078, -1.033953, 1, 0, 0, 1, 1,
-0.4858975, -0.6584023, -1.548234, 1, 0, 0, 1, 1,
-0.4743389, 0.08815034, -0.3427855, 0, 0, 0, 1, 1,
-0.4712285, -0.4955524, 0.2527995, 0, 0, 0, 1, 1,
-0.4709252, 0.3289103, -1.418782, 0, 0, 0, 1, 1,
-0.4707555, 0.03994088, -2.514688, 0, 0, 0, 1, 1,
-0.4666599, -2.566147, -3.707371, 0, 0, 0, 1, 1,
-0.4656461, 0.3334279, -0.06514431, 0, 0, 0, 1, 1,
-0.4621316, -0.6074407, -2.043706, 0, 0, 0, 1, 1,
-0.4615287, -1.028808, -1.176238, 1, 1, 1, 1, 1,
-0.4594151, -0.3250623, -2.459165, 1, 1, 1, 1, 1,
-0.4566792, 1.163386, -2.391331, 1, 1, 1, 1, 1,
-0.4563411, -0.285612, -3.563623, 1, 1, 1, 1, 1,
-0.4540614, 0.5664488, -0.2962867, 1, 1, 1, 1, 1,
-0.4503169, 0.7871022, -2.084252, 1, 1, 1, 1, 1,
-0.4495528, 0.6969531, -0.8784792, 1, 1, 1, 1, 1,
-0.4416995, 0.7267783, -1.272436, 1, 1, 1, 1, 1,
-0.441117, 1.725078, -0.1012189, 1, 1, 1, 1, 1,
-0.4393408, -0.91983, -3.111883, 1, 1, 1, 1, 1,
-0.4372901, 0.4881243, -2.179124, 1, 1, 1, 1, 1,
-0.4346723, 0.8042195, -0.2581952, 1, 1, 1, 1, 1,
-0.4345059, -1.075163, -3.46589, 1, 1, 1, 1, 1,
-0.4307421, 0.1142231, -2.479848, 1, 1, 1, 1, 1,
-0.422564, -0.6985953, -1.739472, 1, 1, 1, 1, 1,
-0.4192469, 2.723367, 0.03431705, 0, 0, 1, 1, 1,
-0.4173942, -0.1986258, -1.961454, 1, 0, 0, 1, 1,
-0.4146506, -0.4713371, -1.129851, 1, 0, 0, 1, 1,
-0.4116432, 0.2270838, -1.307172, 1, 0, 0, 1, 1,
-0.4101346, 1.245301, -1.705214, 1, 0, 0, 1, 1,
-0.4057551, 0.03257471, -2.352926, 1, 0, 0, 1, 1,
-0.4041283, -1.427166, -3.872301, 0, 0, 0, 1, 1,
-0.4037519, 0.592604, -1.871599, 0, 0, 0, 1, 1,
-0.4010419, 1.45706, -1.245408, 0, 0, 0, 1, 1,
-0.3996256, 1.342719, -0.0200459, 0, 0, 0, 1, 1,
-0.3981015, -0.7170541, -2.671788, 0, 0, 0, 1, 1,
-0.3962049, -0.274161, -3.569401, 0, 0, 0, 1, 1,
-0.3844167, -0.3244997, -2.111744, 0, 0, 0, 1, 1,
-0.3826994, -0.6860084, -1.794035, 1, 1, 1, 1, 1,
-0.379981, 0.4402087, -0.205587, 1, 1, 1, 1, 1,
-0.378204, -0.6581779, -2.362327, 1, 1, 1, 1, 1,
-0.3766838, 0.2971554, -1.965885, 1, 1, 1, 1, 1,
-0.3765888, 2.39879, -0.5050047, 1, 1, 1, 1, 1,
-0.3757682, -0.1995129, -3.064472, 1, 1, 1, 1, 1,
-0.3747735, 0.4803267, 0.8151163, 1, 1, 1, 1, 1,
-0.3689432, -0.344746, -2.211846, 1, 1, 1, 1, 1,
-0.367848, -1.492366, -3.402735, 1, 1, 1, 1, 1,
-0.3677826, 0.2191121, -1.203663, 1, 1, 1, 1, 1,
-0.3631775, 1.525618, 0.263849, 1, 1, 1, 1, 1,
-0.3580064, -0.6266512, -2.314266, 1, 1, 1, 1, 1,
-0.3571981, 2.698939, -0.3549062, 1, 1, 1, 1, 1,
-0.3537721, 0.4602447, -0.7375712, 1, 1, 1, 1, 1,
-0.3535735, -0.0008492873, -1.988664, 1, 1, 1, 1, 1,
-0.351927, -0.8122151, -0.1247342, 0, 0, 1, 1, 1,
-0.3518851, -3.140594, -1.698877, 1, 0, 0, 1, 1,
-0.3504797, -1.771664, -3.160833, 1, 0, 0, 1, 1,
-0.3488047, 0.7287315, 0.7222987, 1, 0, 0, 1, 1,
-0.3485752, 0.4373359, -0.07674983, 1, 0, 0, 1, 1,
-0.345964, -0.7218414, -2.521709, 1, 0, 0, 1, 1,
-0.3451307, -0.8627378, -1.506644, 0, 0, 0, 1, 1,
-0.3385968, 0.433255, -0.8798719, 0, 0, 0, 1, 1,
-0.3359302, -0.3839196, -0.224747, 0, 0, 0, 1, 1,
-0.3345499, -0.4874378, -1.136438, 0, 0, 0, 1, 1,
-0.3316116, -0.2530505, -2.386594, 0, 0, 0, 1, 1,
-0.3303192, -0.2636953, -0.9895104, 0, 0, 0, 1, 1,
-0.3296478, -0.05018204, -2.698295, 0, 0, 0, 1, 1,
-0.3283468, -1.737396, -2.258569, 1, 1, 1, 1, 1,
-0.3256969, -0.02941003, -1.916704, 1, 1, 1, 1, 1,
-0.3244911, -1.059922, -1.964653, 1, 1, 1, 1, 1,
-0.3222207, -0.9503491, -2.146433, 1, 1, 1, 1, 1,
-0.3196529, -0.7930878, -3.379255, 1, 1, 1, 1, 1,
-0.3189867, -0.2265985, -2.012298, 1, 1, 1, 1, 1,
-0.3176227, -0.0413456, -0.3554704, 1, 1, 1, 1, 1,
-0.3148785, 1.105895, -0.764679, 1, 1, 1, 1, 1,
-0.3140674, 1.853254, -0.7654924, 1, 1, 1, 1, 1,
-0.3119511, -0.697065, -3.123836, 1, 1, 1, 1, 1,
-0.3097834, 0.9633425, 0.5857598, 1, 1, 1, 1, 1,
-0.3092805, 1.096291, 1.01577, 1, 1, 1, 1, 1,
-0.3091534, 0.9325079, -1.59099, 1, 1, 1, 1, 1,
-0.3028748, -0.8286332, -2.735613, 1, 1, 1, 1, 1,
-0.2977135, -0.001401555, -3.743096, 1, 1, 1, 1, 1,
-0.2926621, -2.677165, -2.363265, 0, 0, 1, 1, 1,
-0.2872681, -0.1903445, -0.8566194, 1, 0, 0, 1, 1,
-0.2835242, -0.9883316, -3.669007, 1, 0, 0, 1, 1,
-0.2802934, -0.649024, -1.305342, 1, 0, 0, 1, 1,
-0.2761678, 0.1244412, -1.098447, 1, 0, 0, 1, 1,
-0.2726869, -0.3211023, -1.591649, 1, 0, 0, 1, 1,
-0.2716037, -1.157087, -3.364151, 0, 0, 0, 1, 1,
-0.2678998, -1.144083, -2.810328, 0, 0, 0, 1, 1,
-0.2644071, 0.6502444, 0.5474431, 0, 0, 0, 1, 1,
-0.2643279, 0.155313, -0.3760518, 0, 0, 0, 1, 1,
-0.260959, 0.552154, -2.078489, 0, 0, 0, 1, 1,
-0.2599588, -0.6502661, -3.002028, 0, 0, 0, 1, 1,
-0.2598061, -0.7973082, -3.936275, 0, 0, 0, 1, 1,
-0.2551874, -1.851652, -1.663437, 1, 1, 1, 1, 1,
-0.2531978, -0.2103569, -1.910691, 1, 1, 1, 1, 1,
-0.2522026, 0.8600073, -0.4614929, 1, 1, 1, 1, 1,
-0.2517657, -0.1086262, -2.572992, 1, 1, 1, 1, 1,
-0.2481913, -1.452677, -3.520634, 1, 1, 1, 1, 1,
-0.2481678, -1.712182, -2.995344, 1, 1, 1, 1, 1,
-0.2472217, -1.501563, -2.221293, 1, 1, 1, 1, 1,
-0.2440964, 0.5036926, -0.1079217, 1, 1, 1, 1, 1,
-0.2403959, -0.4440631, -2.617438, 1, 1, 1, 1, 1,
-0.238561, 0.1195322, 0.9069206, 1, 1, 1, 1, 1,
-0.236743, -0.7269535, -3.041494, 1, 1, 1, 1, 1,
-0.2359321, 0.805209, -0.3978994, 1, 1, 1, 1, 1,
-0.228322, 0.8737758, 1.470979, 1, 1, 1, 1, 1,
-0.2242364, -0.5611326, -2.469529, 1, 1, 1, 1, 1,
-0.2230305, -0.6819506, -1.846526, 1, 1, 1, 1, 1,
-0.2219801, -1.632846, -2.080598, 0, 0, 1, 1, 1,
-0.2215114, 0.1413766, 0.06630406, 1, 0, 0, 1, 1,
-0.2203483, 0.02159842, -0.9951171, 1, 0, 0, 1, 1,
-0.2157258, -0.3701907, -2.371139, 1, 0, 0, 1, 1,
-0.2147909, -1.02975, -0.7050429, 1, 0, 0, 1, 1,
-0.2136939, -0.8565416, -4.707823, 1, 0, 0, 1, 1,
-0.2117305, 1.046269, -1.064448, 0, 0, 0, 1, 1,
-0.2076969, -0.5598899, -3.232442, 0, 0, 0, 1, 1,
-0.2028517, -0.7392945, -2.464395, 0, 0, 0, 1, 1,
-0.1982399, -0.3460597, -2.088435, 0, 0, 0, 1, 1,
-0.1959473, 0.07045538, 0.05457407, 0, 0, 0, 1, 1,
-0.1938993, -0.4962568, -2.657904, 0, 0, 0, 1, 1,
-0.1858426, 0.8723832, 0.325414, 0, 0, 0, 1, 1,
-0.1750324, -0.0329842, -2.176465, 1, 1, 1, 1, 1,
-0.1750256, 0.8738931, -0.4225321, 1, 1, 1, 1, 1,
-0.1743515, -0.12631, -3.286573, 1, 1, 1, 1, 1,
-0.1725251, 1.654658, 0.07042776, 1, 1, 1, 1, 1,
-0.1694228, -1.240994, -2.975683, 1, 1, 1, 1, 1,
-0.1685291, -0.1603328, -1.760022, 1, 1, 1, 1, 1,
-0.1656416, -0.4042114, -3.429509, 1, 1, 1, 1, 1,
-0.1630112, 0.0210951, -0.6321623, 1, 1, 1, 1, 1,
-0.1576566, 1.563947, -1.336337, 1, 1, 1, 1, 1,
-0.1560684, 1.061131, 0.09569253, 1, 1, 1, 1, 1,
-0.1472021, 0.6571367, 1.580724, 1, 1, 1, 1, 1,
-0.1470985, 0.01056442, -0.1891197, 1, 1, 1, 1, 1,
-0.1458885, -0.1518333, -2.723451, 1, 1, 1, 1, 1,
-0.1455939, 1.414729, -0.4440408, 1, 1, 1, 1, 1,
-0.14363, 0.4404842, 0.5176351, 1, 1, 1, 1, 1,
-0.1430551, 1.1458, -0.3206191, 0, 0, 1, 1, 1,
-0.1392923, -0.2605565, -2.945042, 1, 0, 0, 1, 1,
-0.1350161, -0.1832999, -2.383102, 1, 0, 0, 1, 1,
-0.1339675, 1.515117, -0.1780682, 1, 0, 0, 1, 1,
-0.1337056, -0.6596963, -2.960254, 1, 0, 0, 1, 1,
-0.1306179, 0.01865702, -0.8179722, 1, 0, 0, 1, 1,
-0.1262803, 0.8524882, -1.087273, 0, 0, 0, 1, 1,
-0.1252191, 1.008893, -0.06063934, 0, 0, 0, 1, 1,
-0.1198124, -0.3127394, -1.252294, 0, 0, 0, 1, 1,
-0.117466, 1.9412, -0.3638547, 0, 0, 0, 1, 1,
-0.1138049, 0.1678516, -0.6312483, 0, 0, 0, 1, 1,
-0.1088722, 1.513569, 0.8358315, 0, 0, 0, 1, 1,
-0.1088171, 0.6750923, -1.21443, 0, 0, 0, 1, 1,
-0.1069953, 0.1425041, -1.16563, 1, 1, 1, 1, 1,
-0.103642, -0.2797132, -3.577701, 1, 1, 1, 1, 1,
-0.1025204, 1.275393, 0.7503058, 1, 1, 1, 1, 1,
-0.1021798, 0.09481919, -0.9510508, 1, 1, 1, 1, 1,
-0.09812009, 0.05715093, 1.746017, 1, 1, 1, 1, 1,
-0.09760907, 0.5061993, -1.65554, 1, 1, 1, 1, 1,
-0.09671987, 0.1096593, -1.565625, 1, 1, 1, 1, 1,
-0.09216619, -1.309756, -3.569336, 1, 1, 1, 1, 1,
-0.09091245, 0.138787, -0.963845, 1, 1, 1, 1, 1,
-0.08990556, 1.385449, -0.4444752, 1, 1, 1, 1, 1,
-0.08792087, 0.05303461, -1.417659, 1, 1, 1, 1, 1,
-0.08608627, -0.1165589, -4.136045, 1, 1, 1, 1, 1,
-0.08527277, -0.4063529, -3.390788, 1, 1, 1, 1, 1,
-0.08457749, -1.92465, -2.08956, 1, 1, 1, 1, 1,
-0.08263954, -0.3301526, -4.010901, 1, 1, 1, 1, 1,
-0.08114187, 0.6775051, -1.775892, 0, 0, 1, 1, 1,
-0.07910863, 0.2355991, -2.142677, 1, 0, 0, 1, 1,
-0.07755372, -0.4860227, -1.524572, 1, 0, 0, 1, 1,
-0.07666255, -1.648362, -4.218708, 1, 0, 0, 1, 1,
-0.07331143, -1.861117, -2.602992, 1, 0, 0, 1, 1,
-0.07103696, -1.19427, -3.942514, 1, 0, 0, 1, 1,
-0.06544133, -1.027098, -4.169718, 0, 0, 0, 1, 1,
-0.06465573, 0.8097302, 1.946861, 0, 0, 0, 1, 1,
-0.0643468, 1.269354, 1.722493, 0, 0, 0, 1, 1,
-0.05784304, -0.5352434, -2.474472, 0, 0, 0, 1, 1,
-0.05502864, 0.04480658, -2.445761, 0, 0, 0, 1, 1,
-0.05163056, 1.816929, -1.84604, 0, 0, 0, 1, 1,
-0.04870319, 0.4501122, -0.4788011, 0, 0, 0, 1, 1,
-0.04836925, 0.8736969, -0.2710427, 1, 1, 1, 1, 1,
-0.04678253, -0.01382985, -0.1928519, 1, 1, 1, 1, 1,
-0.04531877, -1.432778, -4.148443, 1, 1, 1, 1, 1,
-0.0442677, 0.9116859, -0.8581008, 1, 1, 1, 1, 1,
-0.04410702, -1.140471, -4.752778, 1, 1, 1, 1, 1,
-0.04352119, -0.5836298, -3.055784, 1, 1, 1, 1, 1,
-0.04265813, 0.07655254, -0.9340389, 1, 1, 1, 1, 1,
-0.04124762, 1.071925, 0.3240043, 1, 1, 1, 1, 1,
-0.04100912, -0.6853017, -4.70347, 1, 1, 1, 1, 1,
-0.04014537, -0.1925431, -4.265951, 1, 1, 1, 1, 1,
-0.03769233, 1.616648, -0.9422168, 1, 1, 1, 1, 1,
-0.03246319, -0.5974119, -0.09130385, 1, 1, 1, 1, 1,
-0.03138028, -0.1852545, -3.519896, 1, 1, 1, 1, 1,
-0.02910512, -1.824221, -2.498496, 1, 1, 1, 1, 1,
-0.02670549, -0.8083469, -3.749038, 1, 1, 1, 1, 1,
-0.02387398, 1.589399, 0.06167886, 0, 0, 1, 1, 1,
-0.02171427, -1.492576, -1.275182, 1, 0, 0, 1, 1,
-0.01770295, 0.4403108, -0.8860468, 1, 0, 0, 1, 1,
-0.01713197, -0.6483127, -4.007385, 1, 0, 0, 1, 1,
-0.01370681, -0.8709228, -4.378751, 1, 0, 0, 1, 1,
-0.009875962, 2.368339, 0.2787673, 1, 0, 0, 1, 1,
-0.008771491, 0.07872622, -0.3868205, 0, 0, 0, 1, 1,
-0.007561977, -0.6762762, -4.731935, 0, 0, 0, 1, 1,
-0.007019721, 0.8359657, 2.175371, 0, 0, 0, 1, 1,
-0.004955286, -0.8878168, -6.470812, 0, 0, 0, 1, 1,
-0.00288629, -0.3155923, -2.62247, 0, 0, 0, 1, 1,
-0.001304637, 1.724027, -0.5613401, 0, 0, 0, 1, 1,
-0.001067268, -0.8014326, -0.4304972, 0, 0, 0, 1, 1,
0.0002056372, 0.2373685, -1.100391, 1, 1, 1, 1, 1,
0.00485993, 1.255403, -0.3895881, 1, 1, 1, 1, 1,
0.005098872, 1.549749, -0.1642351, 1, 1, 1, 1, 1,
0.006397771, 1.183445, 0.98809, 1, 1, 1, 1, 1,
0.008024763, 0.2612994, -2.641239, 1, 1, 1, 1, 1,
0.01033994, 0.8527443, -0.3861171, 1, 1, 1, 1, 1,
0.01055073, 0.5826283, 0.2202872, 1, 1, 1, 1, 1,
0.0139319, -1.300878, 3.303857, 1, 1, 1, 1, 1,
0.02163158, 0.7270873, -0.5048687, 1, 1, 1, 1, 1,
0.02174573, 0.1072721, 0.5090232, 1, 1, 1, 1, 1,
0.02229443, 0.2540867, -0.3472223, 1, 1, 1, 1, 1,
0.02635939, 0.004339114, 1.295993, 1, 1, 1, 1, 1,
0.02685485, 0.2705761, 0.1863426, 1, 1, 1, 1, 1,
0.02708531, 0.1575167, -3.544421, 1, 1, 1, 1, 1,
0.02810821, 1.275469, 0.5332705, 1, 1, 1, 1, 1,
0.02981296, -0.2355112, 2.817429, 0, 0, 1, 1, 1,
0.03557843, -0.4980853, 1.875276, 1, 0, 0, 1, 1,
0.03600873, -0.4032567, 3.208579, 1, 0, 0, 1, 1,
0.05013073, -0.9663265, 2.677876, 1, 0, 0, 1, 1,
0.0550307, -0.2027185, 3.648642, 1, 0, 0, 1, 1,
0.05547766, 1.076597, 2.372203, 1, 0, 0, 1, 1,
0.05599333, 0.9545603, 0.239399, 0, 0, 0, 1, 1,
0.0584877, 1.53881, 1.510068, 0, 0, 0, 1, 1,
0.05994179, 0.5492676, -0.6643692, 0, 0, 0, 1, 1,
0.0613443, -0.2907141, 3.39433, 0, 0, 0, 1, 1,
0.06298959, -0.1758937, 2.148694, 0, 0, 0, 1, 1,
0.06499093, -0.1117852, 1.382238, 0, 0, 0, 1, 1,
0.06522603, -0.1352938, 3.574872, 0, 0, 0, 1, 1,
0.06931432, 0.2518692, 0.3943441, 1, 1, 1, 1, 1,
0.06960055, 0.7250254, 1.027783, 1, 1, 1, 1, 1,
0.08082091, -2.450088, 3.067223, 1, 1, 1, 1, 1,
0.08152255, 0.6090769, 0.64939, 1, 1, 1, 1, 1,
0.08531322, -1.497325, 2.318546, 1, 1, 1, 1, 1,
0.0854937, -1.392339, 3.13702, 1, 1, 1, 1, 1,
0.0914673, 0.3569829, 0.9682299, 1, 1, 1, 1, 1,
0.09553114, -0.7794033, 1.879198, 1, 1, 1, 1, 1,
0.1015899, -1.056844, 2.968436, 1, 1, 1, 1, 1,
0.1065666, -1.208693, 3.836217, 1, 1, 1, 1, 1,
0.1112809, 1.581, 1.698912, 1, 1, 1, 1, 1,
0.1117542, -3.208344, 4.439775, 1, 1, 1, 1, 1,
0.1119224, -1.512199, 2.045082, 1, 1, 1, 1, 1,
0.1130609, 0.544109, -0.2575765, 1, 1, 1, 1, 1,
0.1157803, -0.6294506, 1.324195, 1, 1, 1, 1, 1,
0.1167507, -1.956223, 4.427104, 0, 0, 1, 1, 1,
0.1168353, -0.3026833, 1.470379, 1, 0, 0, 1, 1,
0.1202446, 0.4429435, 1.718693, 1, 0, 0, 1, 1,
0.1215194, -0.1522738, 2.956711, 1, 0, 0, 1, 1,
0.1242376, 0.4353946, 0.6045984, 1, 0, 0, 1, 1,
0.1260679, -0.2040203, 2.738817, 1, 0, 0, 1, 1,
0.1366969, 0.2382986, -0.4825936, 0, 0, 0, 1, 1,
0.1377266, -0.02797324, 2.239329, 0, 0, 0, 1, 1,
0.138517, -0.4641759, 4.582672, 0, 0, 0, 1, 1,
0.1407146, -0.5553358, 5.20848, 0, 0, 0, 1, 1,
0.1440659, -1.38176, 4.290687, 0, 0, 0, 1, 1,
0.1449732, 0.3252169, 0.4709642, 0, 0, 0, 1, 1,
0.1470479, -0.7031335, 2.703018, 0, 0, 0, 1, 1,
0.1524615, 0.1805395, 0.2058841, 1, 1, 1, 1, 1,
0.1546178, -1.370467, 2.866385, 1, 1, 1, 1, 1,
0.1603549, 0.5251202, -0.07593633, 1, 1, 1, 1, 1,
0.1606559, -0.4103691, 1.011396, 1, 1, 1, 1, 1,
0.1662287, 0.5314376, 0.9204828, 1, 1, 1, 1, 1,
0.1710259, -0.6908398, 3.712522, 1, 1, 1, 1, 1,
0.1722282, -0.513378, 1.066698, 1, 1, 1, 1, 1,
0.1723409, -1.277805, 4.019613, 1, 1, 1, 1, 1,
0.1753053, 0.8615714, -1.055481, 1, 1, 1, 1, 1,
0.1757256, -0.4507102, 0.9833772, 1, 1, 1, 1, 1,
0.1826959, -0.6068646, 3.809982, 1, 1, 1, 1, 1,
0.1830839, -0.4820131, 2.602834, 1, 1, 1, 1, 1,
0.1845506, 0.6849188, -0.708334, 1, 1, 1, 1, 1,
0.1864824, 0.1166767, 0.2383447, 1, 1, 1, 1, 1,
0.1905836, -0.2012435, 3.953877, 1, 1, 1, 1, 1,
0.1926633, 3.591003, -1.381435, 0, 0, 1, 1, 1,
0.1928397, -1.016059, 4.367403, 1, 0, 0, 1, 1,
0.1951802, 0.3864911, 1.236183, 1, 0, 0, 1, 1,
0.195594, -0.129465, 3.471786, 1, 0, 0, 1, 1,
0.196931, 0.264534, 0.4043826, 1, 0, 0, 1, 1,
0.2005249, 0.2964859, 1.968968, 1, 0, 0, 1, 1,
0.2009065, -0.2296871, 1.860461, 0, 0, 0, 1, 1,
0.2029378, -1.382459, 2.782919, 0, 0, 0, 1, 1,
0.2032275, 0.6373623, 0.5769387, 0, 0, 0, 1, 1,
0.2040676, -0.9825448, 2.359631, 0, 0, 0, 1, 1,
0.204174, 0.7819085, -0.4655019, 0, 0, 0, 1, 1,
0.2058416, 0.278317, 1.824717, 0, 0, 0, 1, 1,
0.2094315, -0.7057658, 3.39828, 0, 0, 0, 1, 1,
0.2165678, -1.765512, 4.701946, 1, 1, 1, 1, 1,
0.217023, 1.34139, -1.092893, 1, 1, 1, 1, 1,
0.2187591, 1.796674, 0.905991, 1, 1, 1, 1, 1,
0.2199187, -0.4731338, 3.076816, 1, 1, 1, 1, 1,
0.2260065, -0.9853716, 3.704801, 1, 1, 1, 1, 1,
0.2301365, 0.217943, 1.534817, 1, 1, 1, 1, 1,
0.2317405, 0.04931999, -0.255316, 1, 1, 1, 1, 1,
0.2330081, -1.254068, 2.637972, 1, 1, 1, 1, 1,
0.2341974, -0.6815249, 4.36593, 1, 1, 1, 1, 1,
0.237754, -0.7192972, 2.291873, 1, 1, 1, 1, 1,
0.2406943, 0.5426913, 1.439559, 1, 1, 1, 1, 1,
0.2430015, 0.3388924, 0.2016588, 1, 1, 1, 1, 1,
0.2455912, -0.9439731, 2.906092, 1, 1, 1, 1, 1,
0.2555068, -0.8419048, 3.256284, 1, 1, 1, 1, 1,
0.2557149, -1.171835, 3.55406, 1, 1, 1, 1, 1,
0.2560903, 1.019137, -0.0534678, 0, 0, 1, 1, 1,
0.2627062, -0.5188993, 3.306606, 1, 0, 0, 1, 1,
0.2666915, -1.043328, 2.743116, 1, 0, 0, 1, 1,
0.267834, -0.6758436, 2.059454, 1, 0, 0, 1, 1,
0.2693095, -0.905053, 3.10887, 1, 0, 0, 1, 1,
0.2719778, -1.271239, 2.595846, 1, 0, 0, 1, 1,
0.273056, -1.072357, 2.942591, 0, 0, 0, 1, 1,
0.2762629, -0.6872594, 3.62582, 0, 0, 0, 1, 1,
0.2776552, 0.9117852, -1.083766, 0, 0, 0, 1, 1,
0.2862165, -0.100656, 3.078124, 0, 0, 0, 1, 1,
0.2881424, -1.245631, 3.502265, 0, 0, 0, 1, 1,
0.2890018, -0.4380045, 1.499627, 0, 0, 0, 1, 1,
0.2919409, -0.2765046, 1.893378, 0, 0, 0, 1, 1,
0.2932326, 0.4014709, 2.056588, 1, 1, 1, 1, 1,
0.2938462, -0.651069, 3.094496, 1, 1, 1, 1, 1,
0.3004428, -0.6129643, 2.796927, 1, 1, 1, 1, 1,
0.3096101, 0.7990882, 0.09960347, 1, 1, 1, 1, 1,
0.3111444, 1.133127, 0.3172329, 1, 1, 1, 1, 1,
0.3130254, -0.1104335, 2.233662, 1, 1, 1, 1, 1,
0.3133074, -0.08569085, 0.5376159, 1, 1, 1, 1, 1,
0.3229053, -0.188408, 2.061233, 1, 1, 1, 1, 1,
0.323211, -1.938591, 4.649241, 1, 1, 1, 1, 1,
0.3244025, -0.5765208, 4.035049, 1, 1, 1, 1, 1,
0.3248343, -1.579744, 3.513382, 1, 1, 1, 1, 1,
0.3278279, -0.05309039, 2.499877, 1, 1, 1, 1, 1,
0.3286971, 0.06067942, 2.718234, 1, 1, 1, 1, 1,
0.3307531, -0.4454909, 0.8076732, 1, 1, 1, 1, 1,
0.3314854, -0.1617088, 3.731541, 1, 1, 1, 1, 1,
0.3315121, -2.008224, 2.701843, 0, 0, 1, 1, 1,
0.3337207, -0.6192219, 2.946229, 1, 0, 0, 1, 1,
0.3358302, -1.041966, 3.744892, 1, 0, 0, 1, 1,
0.3387457, -0.1031625, 2.660075, 1, 0, 0, 1, 1,
0.339579, 2.336241, -0.09812713, 1, 0, 0, 1, 1,
0.3402033, 0.4887501, 0.2331955, 1, 0, 0, 1, 1,
0.3409382, -0.4209964, 1.261939, 0, 0, 0, 1, 1,
0.3416971, -0.2995123, 2.225147, 0, 0, 0, 1, 1,
0.3423552, 0.3673289, 1.45491, 0, 0, 0, 1, 1,
0.3472529, 0.365087, -0.5915563, 0, 0, 0, 1, 1,
0.3478533, 0.753498, -0.4586508, 0, 0, 0, 1, 1,
0.3479657, 1.120446, 3.418313, 0, 0, 0, 1, 1,
0.3506286, -0.8212882, 4.410987, 0, 0, 0, 1, 1,
0.3554271, -0.2542734, 0.8827947, 1, 1, 1, 1, 1,
0.362516, 0.5960577, -0.6398439, 1, 1, 1, 1, 1,
0.3664458, -0.3275426, 2.238338, 1, 1, 1, 1, 1,
0.3668685, -1.187267, 3.41989, 1, 1, 1, 1, 1,
0.3722989, 0.2069595, 2.063897, 1, 1, 1, 1, 1,
0.3759594, -0.02183826, 3.217297, 1, 1, 1, 1, 1,
0.3819119, 1.515787, 1.611409, 1, 1, 1, 1, 1,
0.3860824, -0.4104895, 2.990595, 1, 1, 1, 1, 1,
0.3909496, 0.3503507, 2.477133, 1, 1, 1, 1, 1,
0.3909996, 0.4757431, -0.1960142, 1, 1, 1, 1, 1,
0.3927949, -0.03287313, 0.7029543, 1, 1, 1, 1, 1,
0.399093, 0.1137872, 1.594048, 1, 1, 1, 1, 1,
0.3991586, 0.2904731, 3.804871, 1, 1, 1, 1, 1,
0.3998715, -0.2616334, 3.610913, 1, 1, 1, 1, 1,
0.4060409, -0.2424356, 3.24348, 1, 1, 1, 1, 1,
0.40937, 0.7988983, 1.103055, 0, 0, 1, 1, 1,
0.4094818, -0.4254626, 1.681352, 1, 0, 0, 1, 1,
0.4107093, -0.1157903, 3.039672, 1, 0, 0, 1, 1,
0.4145746, 0.4834057, 0.4442402, 1, 0, 0, 1, 1,
0.4158249, 0.3516744, 1.25665, 1, 0, 0, 1, 1,
0.4174527, 0.06370755, 2.190016, 1, 0, 0, 1, 1,
0.418665, 0.5123934, 1.207035, 0, 0, 0, 1, 1,
0.4194551, -0.221801, 0.6818181, 0, 0, 0, 1, 1,
0.4209127, 0.5801939, 2.40755, 0, 0, 0, 1, 1,
0.4230409, 0.01367281, 1.396949, 0, 0, 0, 1, 1,
0.4278105, -1.118595, 2.901113, 0, 0, 0, 1, 1,
0.4347394, 0.1580866, 1.363883, 0, 0, 0, 1, 1,
0.435951, 0.3049797, 2.867793, 0, 0, 0, 1, 1,
0.4362747, 0.2152968, -0.5372313, 1, 1, 1, 1, 1,
0.4389695, -0.7733773, 4.76829, 1, 1, 1, 1, 1,
0.4410191, -0.3019714, 0.4425752, 1, 1, 1, 1, 1,
0.4410745, -0.1683236, 3.481523, 1, 1, 1, 1, 1,
0.4413912, -0.06587896, 2.057401, 1, 1, 1, 1, 1,
0.4423166, -0.4075138, 1.971841, 1, 1, 1, 1, 1,
0.4434156, 0.8800141, 0.914214, 1, 1, 1, 1, 1,
0.443718, 0.2055249, 0.3818128, 1, 1, 1, 1, 1,
0.4483886, 0.4475078, 0.8376967, 1, 1, 1, 1, 1,
0.4488712, -0.875081, 1.658544, 1, 1, 1, 1, 1,
0.4527913, 0.7588403, 1.125247, 1, 1, 1, 1, 1,
0.4591549, 0.175929, 0.31409, 1, 1, 1, 1, 1,
0.4606144, 2.04447, 1.143713, 1, 1, 1, 1, 1,
0.4608205, 0.2938563, -0.2493076, 1, 1, 1, 1, 1,
0.4675032, -0.4463229, 2.397497, 1, 1, 1, 1, 1,
0.4693557, -0.330473, 1.07267, 0, 0, 1, 1, 1,
0.470094, 0.7097324, 1.469508, 1, 0, 0, 1, 1,
0.4705649, 0.7722663, -0.07965269, 1, 0, 0, 1, 1,
0.4709976, 0.5852174, 1.159433, 1, 0, 0, 1, 1,
0.4713038, 0.2235177, 1.550058, 1, 0, 0, 1, 1,
0.4738924, -0.295664, 2.778696, 1, 0, 0, 1, 1,
0.475184, 0.1475467, 0.5178574, 0, 0, 0, 1, 1,
0.4764426, -0.8777961, 2.111621, 0, 0, 0, 1, 1,
0.4822311, -0.1098358, 2.073249, 0, 0, 0, 1, 1,
0.4827971, -0.5785477, 2.709136, 0, 0, 0, 1, 1,
0.4831461, 2.139467, -1.587428, 0, 0, 0, 1, 1,
0.4851189, 0.6476234, -0.01391717, 0, 0, 0, 1, 1,
0.4866585, 0.4102916, 1.473631, 0, 0, 0, 1, 1,
0.4883375, 1.03409, 1.996829, 1, 1, 1, 1, 1,
0.4911822, -1.384418, 2.946129, 1, 1, 1, 1, 1,
0.4915491, 0.7421292, -0.2705631, 1, 1, 1, 1, 1,
0.495851, -0.761378, 3.198551, 1, 1, 1, 1, 1,
0.4977133, -0.09670053, 2.839102, 1, 1, 1, 1, 1,
0.4982432, 0.9608679, 0.2490839, 1, 1, 1, 1, 1,
0.4990947, -0.3432947, 3.05396, 1, 1, 1, 1, 1,
0.499496, -0.1168715, 0.7800705, 1, 1, 1, 1, 1,
0.4998041, -0.4896225, 1.446592, 1, 1, 1, 1, 1,
0.5004189, -0.6868493, 3.677808, 1, 1, 1, 1, 1,
0.502432, 0.02396204, 2.238642, 1, 1, 1, 1, 1,
0.5068141, 0.2220742, 1.862995, 1, 1, 1, 1, 1,
0.510811, 0.4259212, 2.485787, 1, 1, 1, 1, 1,
0.5124493, 0.05842195, 0.4981741, 1, 1, 1, 1, 1,
0.51363, 1.86403, 1.437229, 1, 1, 1, 1, 1,
0.5165917, -0.5672125, 3.157107, 0, 0, 1, 1, 1,
0.5206693, -0.4953088, 2.462279, 1, 0, 0, 1, 1,
0.5351159, -0.2364272, 1.245253, 1, 0, 0, 1, 1,
0.5367172, 0.09609474, 0.4486159, 1, 0, 0, 1, 1,
0.5381164, 0.6351097, -0.4975963, 1, 0, 0, 1, 1,
0.5432558, -0.08794451, 0.783429, 1, 0, 0, 1, 1,
0.5438606, 0.371831, 0.706317, 0, 0, 0, 1, 1,
0.5457376, 2.294719, -1.981704, 0, 0, 0, 1, 1,
0.5499921, -1.460394, 2.079786, 0, 0, 0, 1, 1,
0.555145, 0.9566832, 0.04719397, 0, 0, 0, 1, 1,
0.5555005, -0.4072129, 2.752809, 0, 0, 0, 1, 1,
0.5565784, -0.3766885, 1.836048, 0, 0, 0, 1, 1,
0.5601025, 0.03008489, 0.9224555, 0, 0, 0, 1, 1,
0.5703872, 1.208674, -0.2668535, 1, 1, 1, 1, 1,
0.5717338, 0.5944233, -1.997035, 1, 1, 1, 1, 1,
0.5723134, 0.6784797, 1.262553, 1, 1, 1, 1, 1,
0.5752865, -0.003649771, 3.310173, 1, 1, 1, 1, 1,
0.5767025, -0.2829595, 1.943378, 1, 1, 1, 1, 1,
0.5783176, -1.21697, 2.455916, 1, 1, 1, 1, 1,
0.5796607, 0.4845256, 1.149591, 1, 1, 1, 1, 1,
0.5817401, -0.6020153, 2.677151, 1, 1, 1, 1, 1,
0.5833175, 1.040858, 0.9236301, 1, 1, 1, 1, 1,
0.5870988, -0.3064041, 1.711985, 1, 1, 1, 1, 1,
0.59316, 0.5481097, 0.1824619, 1, 1, 1, 1, 1,
0.6020794, 0.6977532, 1.876069, 1, 1, 1, 1, 1,
0.6024249, 0.2575839, -0.7459452, 1, 1, 1, 1, 1,
0.6089945, -0.6504418, 0.4037867, 1, 1, 1, 1, 1,
0.6105792, 0.4934663, 2.637798, 1, 1, 1, 1, 1,
0.6141787, -1.022675, 0.5762202, 0, 0, 1, 1, 1,
0.6145063, -0.1152165, 2.054317, 1, 0, 0, 1, 1,
0.6153175, -2.807961, 4.110279, 1, 0, 0, 1, 1,
0.6188443, 0.1593811, 2.472635, 1, 0, 0, 1, 1,
0.6197526, -0.02937951, 2.428887, 1, 0, 0, 1, 1,
0.6200348, 0.8583947, 0.6966165, 1, 0, 0, 1, 1,
0.6245716, -0.2478265, 1.855343, 0, 0, 0, 1, 1,
0.6282395, -0.6164886, 2.15793, 0, 0, 0, 1, 1,
0.632521, 0.5746114, 1.017933, 0, 0, 0, 1, 1,
0.6419387, 0.3866322, 1.795994, 0, 0, 0, 1, 1,
0.6497053, 0.2984394, -0.7723454, 0, 0, 0, 1, 1,
0.6514496, 0.7288193, -0.6591138, 0, 0, 0, 1, 1,
0.6519909, -1.337746, 2.644993, 0, 0, 0, 1, 1,
0.6520075, 0.7024974, 2.780135, 1, 1, 1, 1, 1,
0.6557186, -0.3857566, 1.517488, 1, 1, 1, 1, 1,
0.6571949, 0.8361313, 1.093064, 1, 1, 1, 1, 1,
0.6605104, -0.0587723, 0.1079288, 1, 1, 1, 1, 1,
0.6627793, -2.512346, 1.812746, 1, 1, 1, 1, 1,
0.6694707, 1.968239, -1.44854, 1, 1, 1, 1, 1,
0.6805276, 0.9451143, 0.8896174, 1, 1, 1, 1, 1,
0.6890687, -1.322742, 3.924557, 1, 1, 1, 1, 1,
0.6901546, 1.575129, 0.3234058, 1, 1, 1, 1, 1,
0.6953858, 0.6390911, 1.094835, 1, 1, 1, 1, 1,
0.6970935, 0.8760161, -0.2752629, 1, 1, 1, 1, 1,
0.7033807, -0.9131616, 2.029673, 1, 1, 1, 1, 1,
0.70388, -0.4692789, 3.49717, 1, 1, 1, 1, 1,
0.7045018, -0.5855046, 1.943719, 1, 1, 1, 1, 1,
0.7045211, -1.484041, 2.336089, 1, 1, 1, 1, 1,
0.7099417, -1.935923, 2.961397, 0, 0, 1, 1, 1,
0.7206587, 0.5632731, 2.34231, 1, 0, 0, 1, 1,
0.7238394, -0.787165, 1.989033, 1, 0, 0, 1, 1,
0.7292401, 2.247459, 2.014353, 1, 0, 0, 1, 1,
0.7320951, -0.1090872, 0.0163385, 1, 0, 0, 1, 1,
0.7345648, -0.2850344, 1.86058, 1, 0, 0, 1, 1,
0.7376141, 0.8698948, 0.18517, 0, 0, 0, 1, 1,
0.7406198, -1.364664, 4.023395, 0, 0, 0, 1, 1,
0.7465481, -1.228116, 2.77501, 0, 0, 0, 1, 1,
0.7561652, 0.355819, 2.682536, 0, 0, 0, 1, 1,
0.7576777, -3.698722, 1.752993, 0, 0, 0, 1, 1,
0.7579338, 1.557503, 1.440545, 0, 0, 0, 1, 1,
0.7613986, 0.4171857, 1.907744, 0, 0, 0, 1, 1,
0.7645353, 0.3377663, 0.3404986, 1, 1, 1, 1, 1,
0.7831147, -0.3524527, 0.8516104, 1, 1, 1, 1, 1,
0.7926116, -0.5345486, 3.139217, 1, 1, 1, 1, 1,
0.7966748, 0.2233884, -0.3191867, 1, 1, 1, 1, 1,
0.8003606, -0.4007481, 2.007151, 1, 1, 1, 1, 1,
0.8042555, -2.38194, 2.513984, 1, 1, 1, 1, 1,
0.8078719, 0.2343902, 1.185622, 1, 1, 1, 1, 1,
0.8121086, 0.7579852, 2.262385, 1, 1, 1, 1, 1,
0.8123321, -1.893409, 1.922606, 1, 1, 1, 1, 1,
0.8124906, 0.674186, -0.4115998, 1, 1, 1, 1, 1,
0.8127812, 0.2008611, -0.5043184, 1, 1, 1, 1, 1,
0.8144606, 0.3185374, 1.129971, 1, 1, 1, 1, 1,
0.8225101, -0.1189908, 0.509479, 1, 1, 1, 1, 1,
0.8228147, -2.353322, 3.459733, 1, 1, 1, 1, 1,
0.827058, 1.99845, -0.3683553, 1, 1, 1, 1, 1,
0.8270697, 0.317249, 0.2013769, 0, 0, 1, 1, 1,
0.8281118, 0.6822947, 1.432213, 1, 0, 0, 1, 1,
0.8320144, -0.7404083, 3.894925, 1, 0, 0, 1, 1,
0.8406259, 1.184454, 0.002038413, 1, 0, 0, 1, 1,
0.8424854, 0.455081, 2.278281, 1, 0, 0, 1, 1,
0.8425267, 2.072542, -0.9473696, 1, 0, 0, 1, 1,
0.8437535, 1.028954, 1.133417, 0, 0, 0, 1, 1,
0.8459015, -0.407865, 4.204515, 0, 0, 0, 1, 1,
0.8459108, 0.03671694, 2.40726, 0, 0, 0, 1, 1,
0.8470258, 0.5504308, 0.4371802, 0, 0, 0, 1, 1,
0.8492278, 0.0661439, 1.353542, 0, 0, 0, 1, 1,
0.8554319, 1.974072, 0.4066952, 0, 0, 0, 1, 1,
0.8574978, 0.2345014, 0.7523571, 0, 0, 0, 1, 1,
0.8576022, -0.5121565, 1.296828, 1, 1, 1, 1, 1,
0.8638951, -0.803654, 0.916479, 1, 1, 1, 1, 1,
0.8661041, 0.5880324, 0.9087685, 1, 1, 1, 1, 1,
0.8715917, 0.4072501, 1.376612, 1, 1, 1, 1, 1,
0.877535, -0.7195392, 2.355267, 1, 1, 1, 1, 1,
0.8785602, 0.4421467, 1.550404, 1, 1, 1, 1, 1,
0.878645, -0.7084655, 2.770659, 1, 1, 1, 1, 1,
0.8793526, -0.3869195, 3.524262, 1, 1, 1, 1, 1,
0.8827008, 0.9112597, -0.2523157, 1, 1, 1, 1, 1,
0.8859577, -1.184369, 3.524661, 1, 1, 1, 1, 1,
0.8866118, 0.8912415, -0.5557168, 1, 1, 1, 1, 1,
0.8885753, -0.5844859, 4.183413, 1, 1, 1, 1, 1,
0.8988981, -1.00821, 1.81173, 1, 1, 1, 1, 1,
0.905321, 0.8350002, 0.5796599, 1, 1, 1, 1, 1,
0.9120983, -1.398486, 2.576166, 1, 1, 1, 1, 1,
0.9140007, 1.011935, 0.3782136, 0, 0, 1, 1, 1,
0.9165519, 0.4061334, 0.7152758, 1, 0, 0, 1, 1,
0.9208512, -0.3853502, -0.7342096, 1, 0, 0, 1, 1,
0.9273621, -1.063941, 0.4682197, 1, 0, 0, 1, 1,
0.9275589, 0.6583812, 0.6200097, 1, 0, 0, 1, 1,
0.929359, 0.3539204, 2.277829, 1, 0, 0, 1, 1,
0.9314333, 0.5429729, 1.709396, 0, 0, 0, 1, 1,
0.9341223, -1.000273, 3.817928, 0, 0, 0, 1, 1,
0.9358258, -1.757516, 3.307895, 0, 0, 0, 1, 1,
0.9389023, -1.337758, 1.052566, 0, 0, 0, 1, 1,
0.9477941, 0.9481224, -0.01453608, 0, 0, 0, 1, 1,
0.9513776, 0.4912786, 0.5716748, 0, 0, 0, 1, 1,
0.9537714, 2.05228, -0.07945564, 0, 0, 0, 1, 1,
0.95495, 0.06466035, 1.346687, 1, 1, 1, 1, 1,
0.9608439, -1.273387, 4.064941, 1, 1, 1, 1, 1,
0.9636681, -0.5712688, 1.612912, 1, 1, 1, 1, 1,
0.9662862, 0.1755932, 3.268462, 1, 1, 1, 1, 1,
0.9670644, -1.192589, 2.093548, 1, 1, 1, 1, 1,
0.9710866, -1.649914, 0.8748772, 1, 1, 1, 1, 1,
0.9726487, 0.9487955, 0.6319738, 1, 1, 1, 1, 1,
0.9751403, 0.6138715, 0.1965183, 1, 1, 1, 1, 1,
0.9761295, 1.228572, 0.189036, 1, 1, 1, 1, 1,
0.9834903, -1.024759, 1.702001, 1, 1, 1, 1, 1,
0.9838017, 0.4014248, 1.91263, 1, 1, 1, 1, 1,
0.985725, -0.4921374, 3.636438, 1, 1, 1, 1, 1,
0.9861974, -1.754089, 2.319256, 1, 1, 1, 1, 1,
0.9909641, -1.268453, 2.607396, 1, 1, 1, 1, 1,
0.9995105, -1.563509, 1.690238, 1, 1, 1, 1, 1,
1.002724, 0.7565391, 0.7201518, 0, 0, 1, 1, 1,
1.003044, 0.9868377, 1.220186, 1, 0, 0, 1, 1,
1.008918, 0.7459155, 0.7956452, 1, 0, 0, 1, 1,
1.01989, -0.6143054, 2.951884, 1, 0, 0, 1, 1,
1.033246, -0.151163, 2.703166, 1, 0, 0, 1, 1,
1.041303, 0.5816994, 1.780892, 1, 0, 0, 1, 1,
1.044724, -0.9955276, 2.118765, 0, 0, 0, 1, 1,
1.049364, 1.129732, 1.565218, 0, 0, 0, 1, 1,
1.057298, 0.2160483, 0.7140033, 0, 0, 0, 1, 1,
1.059587, 1.004828, 0.6843139, 0, 0, 0, 1, 1,
1.070099, 1.117342, 0.2514451, 0, 0, 0, 1, 1,
1.070639, -1.793178, 1.276384, 0, 0, 0, 1, 1,
1.074292, 1.662682, 1.899616, 0, 0, 0, 1, 1,
1.08302, 1.104395, -0.1246576, 1, 1, 1, 1, 1,
1.083899, -1.564998, 3.44279, 1, 1, 1, 1, 1,
1.087916, -0.4369914, 1.662548, 1, 1, 1, 1, 1,
1.0902, 0.6675773, 2.522629, 1, 1, 1, 1, 1,
1.091621, -0.7955667, 3.581667, 1, 1, 1, 1, 1,
1.094942, -1.077201, 4.016744, 1, 1, 1, 1, 1,
1.09875, 0.8222447, -0.2679446, 1, 1, 1, 1, 1,
1.098955, -1.658056, 2.101444, 1, 1, 1, 1, 1,
1.106417, 0.06144006, 1.259886, 1, 1, 1, 1, 1,
1.111262, 0.4219638, -0.4697598, 1, 1, 1, 1, 1,
1.115325, 0.0772597, 1.122997, 1, 1, 1, 1, 1,
1.123334, -0.4436282, 4.291312, 1, 1, 1, 1, 1,
1.127415, -0.6535887, 1.98517, 1, 1, 1, 1, 1,
1.131903, -0.1887695, 2.595911, 1, 1, 1, 1, 1,
1.140598, 1.614368, 2.131829, 1, 1, 1, 1, 1,
1.147598, 0.9900784, 2.693564, 0, 0, 1, 1, 1,
1.152445, -0.8218452, 1.222217, 1, 0, 0, 1, 1,
1.156078, 0.2907426, 1.69674, 1, 0, 0, 1, 1,
1.164212, 0.9388642, 2.479964, 1, 0, 0, 1, 1,
1.16992, -0.6794937, 1.959541, 1, 0, 0, 1, 1,
1.171458, -0.2682059, 3.323588, 1, 0, 0, 1, 1,
1.17762, -0.1537811, 3.522613, 0, 0, 0, 1, 1,
1.182508, 0.8697017, 1.06563, 0, 0, 0, 1, 1,
1.185741, 0.3553243, 1.676185, 0, 0, 0, 1, 1,
1.185926, 1.285622, 1.524088, 0, 0, 0, 1, 1,
1.187292, 0.2746873, 1.795089, 0, 0, 0, 1, 1,
1.190715, 1.35941, 1.344207, 0, 0, 0, 1, 1,
1.193907, -0.05349433, 4.482141, 0, 0, 0, 1, 1,
1.198963, 0.5499781, 3.035331, 1, 1, 1, 1, 1,
1.203567, 0.3627748, 1.712243, 1, 1, 1, 1, 1,
1.204232, 0.7111455, 2.109217, 1, 1, 1, 1, 1,
1.232219, 0.587786, 0.9483627, 1, 1, 1, 1, 1,
1.234765, 1.529794, 2.468602, 1, 1, 1, 1, 1,
1.236084, -0.1200587, 2.891823, 1, 1, 1, 1, 1,
1.247683, -1.377973, 2.364018, 1, 1, 1, 1, 1,
1.2684, 0.3238013, 1.992709, 1, 1, 1, 1, 1,
1.269995, -0.4132608, 1.013328, 1, 1, 1, 1, 1,
1.278871, 0.6818001, 2.778563, 1, 1, 1, 1, 1,
1.291822, -0.5725619, 3.49404, 1, 1, 1, 1, 1,
1.309861, -0.1928309, 3.22906, 1, 1, 1, 1, 1,
1.313231, -0.5930818, 0.1006801, 1, 1, 1, 1, 1,
1.315023, -1.95101, 1.564084, 1, 1, 1, 1, 1,
1.315911, -0.7009635, 3.334357, 1, 1, 1, 1, 1,
1.316088, 1.170901, 0.1898614, 0, 0, 1, 1, 1,
1.323379, 0.4548428, 0.79447, 1, 0, 0, 1, 1,
1.331017, -0.2064842, 2.192899, 1, 0, 0, 1, 1,
1.331471, 1.367797, -1.042513, 1, 0, 0, 1, 1,
1.334671, 0.4279867, 1.153752, 1, 0, 0, 1, 1,
1.343184, 0.6049544, 0.4065352, 1, 0, 0, 1, 1,
1.345535, -1.495275, 3.350598, 0, 0, 0, 1, 1,
1.363927, -1.338405, 2.797474, 0, 0, 0, 1, 1,
1.364953, 0.1731828, 1.46511, 0, 0, 0, 1, 1,
1.379847, 0.829247, 0.9434096, 0, 0, 0, 1, 1,
1.405139, -0.479719, 4.026656, 0, 0, 0, 1, 1,
1.409943, 1.939291, 0.3110891, 0, 0, 0, 1, 1,
1.423824, 0.7726222, 0.3854646, 0, 0, 0, 1, 1,
1.424871, -2.331949, 3.041334, 1, 1, 1, 1, 1,
1.443537, -0.2220509, 1.771512, 1, 1, 1, 1, 1,
1.462515, 0.4485723, 1.063044, 1, 1, 1, 1, 1,
1.473678, 1.610855, 0.5244675, 1, 1, 1, 1, 1,
1.475445, -0.811627, 0.2059868, 1, 1, 1, 1, 1,
1.478631, 0.000453855, 0.7787352, 1, 1, 1, 1, 1,
1.49096, 0.6627366, 0.361153, 1, 1, 1, 1, 1,
1.498621, -0.6083573, 2.871536, 1, 1, 1, 1, 1,
1.517528, -0.642294, 0.4232194, 1, 1, 1, 1, 1,
1.517774, 0.1968959, 1.163735, 1, 1, 1, 1, 1,
1.526708, -1.00877, 0.8687131, 1, 1, 1, 1, 1,
1.528212, -0.4154137, 2.647264, 1, 1, 1, 1, 1,
1.530528, 1.20771, 1.286703, 1, 1, 1, 1, 1,
1.534211, -0.8537234, 3.353642, 1, 1, 1, 1, 1,
1.538056, 0.06689122, 1.32855, 1, 1, 1, 1, 1,
1.548378, 0.09455254, 0.9435517, 0, 0, 1, 1, 1,
1.550595, 0.04565268, 1.693425, 1, 0, 0, 1, 1,
1.555159, 1.101672, -0.3974949, 1, 0, 0, 1, 1,
1.560958, 0.9083015, 0.1787479, 1, 0, 0, 1, 1,
1.572169, 0.4351236, 1.592825, 1, 0, 0, 1, 1,
1.587845, 0.07108572, 2.032666, 1, 0, 0, 1, 1,
1.607591, 0.2265071, 3.078641, 0, 0, 0, 1, 1,
1.617486, 1.85811, -0.1979401, 0, 0, 0, 1, 1,
1.618451, -0.001078199, 1.39199, 0, 0, 0, 1, 1,
1.625208, 0.4172051, 1.375381, 0, 0, 0, 1, 1,
1.668916, -0.7089512, 0.18902, 0, 0, 0, 1, 1,
1.703826, -1.391318, 2.96202, 0, 0, 0, 1, 1,
1.705775, 0.4818333, 1.829671, 0, 0, 0, 1, 1,
1.70721, 0.8772779, 0.8040956, 1, 1, 1, 1, 1,
1.72166, 1.420041, 1.163009, 1, 1, 1, 1, 1,
1.730038, -2.124823, 5.042533, 1, 1, 1, 1, 1,
1.786544, -1.340937, 1.83183, 1, 1, 1, 1, 1,
1.813329, -1.772813, 2.407417, 1, 1, 1, 1, 1,
1.817171, 0.3746569, 2.06779, 1, 1, 1, 1, 1,
1.83956, -0.9850561, 1.622607, 1, 1, 1, 1, 1,
1.855404, -0.7476531, 2.821515, 1, 1, 1, 1, 1,
1.890628, 0.4878395, 1.841829, 1, 1, 1, 1, 1,
1.909649, -0.2023434, 2.704177, 1, 1, 1, 1, 1,
1.918274, -0.5054507, 0.7268711, 1, 1, 1, 1, 1,
1.926073, 1.618891, 1.565592, 1, 1, 1, 1, 1,
1.929834, -0.3866471, 2.528337, 1, 1, 1, 1, 1,
1.940401, -0.5147023, 1.603369, 1, 1, 1, 1, 1,
1.945839, 0.4060797, 2.536549, 1, 1, 1, 1, 1,
1.952997, -0.02157629, 1.498713, 0, 0, 1, 1, 1,
1.953165, 0.4281298, 0.7448342, 1, 0, 0, 1, 1,
1.984418, 0.6705184, 1.258254, 1, 0, 0, 1, 1,
2.004133, 1.664993, 0.5176677, 1, 0, 0, 1, 1,
2.075198, -0.4634003, 0.9268183, 1, 0, 0, 1, 1,
2.100901, -2.719065, 2.352061, 1, 0, 0, 1, 1,
2.128801, -0.3579212, 1.004454, 0, 0, 0, 1, 1,
2.13647, -0.4849592, 1.378617, 0, 0, 0, 1, 1,
2.150541, 0.8334965, 0.1724103, 0, 0, 0, 1, 1,
2.153303, 0.6803927, 0.883546, 0, 0, 0, 1, 1,
2.187682, -0.7822492, 1.99683, 0, 0, 0, 1, 1,
2.290395, -0.68275, 0.0357008, 0, 0, 0, 1, 1,
2.330521, 0.8745205, 1.100575, 0, 0, 0, 1, 1,
2.331891, -0.2773778, 1.974725, 1, 1, 1, 1, 1,
2.336051, 0.3790339, 4.355699, 1, 1, 1, 1, 1,
2.441539, 0.4115075, 3.152224, 1, 1, 1, 1, 1,
2.707314, 1.643048, 3.02509, 1, 1, 1, 1, 1,
3.238333, -0.4056552, 0.043648, 1, 1, 1, 1, 1,
3.336039, 0.1897587, 1.468108, 1, 1, 1, 1, 1,
3.436836, 0.4881879, 0.5337614, 1, 1, 1, 1, 1
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
var radius = 10.14167;
var distance = 35.62219;
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
mvMatrix.translate( -0.3567131, 0.05385947, 0.6311662 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.62219);
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
