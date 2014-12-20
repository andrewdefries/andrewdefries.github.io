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
-3.354063, -0.09424449, -2.243176, 1, 0, 0, 1,
-3.089313, -1.313198, -0.2329126, 1, 0.007843138, 0, 1,
-3.04544, 0.9730808, -1.214531, 1, 0.01176471, 0, 1,
-2.900398, 1.559227, -0.5727465, 1, 0.01960784, 0, 1,
-2.890769, -0.07000044, -2.84569, 1, 0.02352941, 0, 1,
-2.521048, -0.09248266, -0.08234525, 1, 0.03137255, 0, 1,
-2.508359, -0.9419429, -2.169288, 1, 0.03529412, 0, 1,
-2.497256, 0.7563127, -0.9943056, 1, 0.04313726, 0, 1,
-2.466058, 0.3193856, -3.584742, 1, 0.04705882, 0, 1,
-2.434178, -1.623696, -1.367324, 1, 0.05490196, 0, 1,
-2.399995, -1.5421, -3.257932, 1, 0.05882353, 0, 1,
-2.381446, 0.5403894, -0.9529372, 1, 0.06666667, 0, 1,
-2.375961, 0.9800637, -0.9575127, 1, 0.07058824, 0, 1,
-2.340863, 0.1881405, -2.050104, 1, 0.07843138, 0, 1,
-2.313963, 1.93365, -0.6074123, 1, 0.08235294, 0, 1,
-2.280401, 1.578641, 0.01319349, 1, 0.09019608, 0, 1,
-2.265691, -2.8651, -2.667646, 1, 0.09411765, 0, 1,
-2.237462, -0.4058535, -2.592301, 1, 0.1019608, 0, 1,
-2.230521, -0.03210744, -2.222193, 1, 0.1098039, 0, 1,
-2.230097, 0.08280946, -1.617089, 1, 0.1137255, 0, 1,
-2.222359, 0.7209885, 0.03056128, 1, 0.1215686, 0, 1,
-2.216, -2.361153, -3.97702, 1, 0.1254902, 0, 1,
-2.196185, -0.3543314, -1.066178, 1, 0.1333333, 0, 1,
-2.171797, 0.1026452, -2.52767, 1, 0.1372549, 0, 1,
-2.164856, 0.09773646, -0.4489746, 1, 0.145098, 0, 1,
-2.144167, -0.253311, -2.827194, 1, 0.1490196, 0, 1,
-2.137198, -1.122873, -1.510128, 1, 0.1568628, 0, 1,
-2.134963, -0.5702561, -1.109664, 1, 0.1607843, 0, 1,
-2.106064, 0.1091115, -2.188208, 1, 0.1686275, 0, 1,
-2.096172, 0.1695675, -1.545046, 1, 0.172549, 0, 1,
-2.088304, -1.459897, -2.776398, 1, 0.1803922, 0, 1,
-2.083567, -1.142612, -1.85516, 1, 0.1843137, 0, 1,
-2.08111, 0.5970588, -0.8034483, 1, 0.1921569, 0, 1,
-2.044994, -0.3980255, -3.415412, 1, 0.1960784, 0, 1,
-2.014418, -0.1601004, -1.495244, 1, 0.2039216, 0, 1,
-1.979534, -0.9845325, -2.952528, 1, 0.2117647, 0, 1,
-1.884258, 0.1309697, -1.294517, 1, 0.2156863, 0, 1,
-1.881596, -0.8632821, -1.581292, 1, 0.2235294, 0, 1,
-1.859716, 0.3144292, -2.722408, 1, 0.227451, 0, 1,
-1.858377, -1.511644, -0.186583, 1, 0.2352941, 0, 1,
-1.847588, -1.755009, -3.141736, 1, 0.2392157, 0, 1,
-1.834401, 2.200738, 0.261757, 1, 0.2470588, 0, 1,
-1.824914, -0.08864998, -2.315927, 1, 0.2509804, 0, 1,
-1.823143, -0.5548925, -1.213349, 1, 0.2588235, 0, 1,
-1.821548, 2.228089, -1.597751, 1, 0.2627451, 0, 1,
-1.808107, -0.1421105, -2.478461, 1, 0.2705882, 0, 1,
-1.794943, 0.8283364, -0.01006211, 1, 0.2745098, 0, 1,
-1.781677, 0.7266282, 0.3953999, 1, 0.282353, 0, 1,
-1.781519, -1.016807, -4.051642, 1, 0.2862745, 0, 1,
-1.759884, 1.535388, 0.09511239, 1, 0.2941177, 0, 1,
-1.742289, 0.008356943, -1.58762, 1, 0.3019608, 0, 1,
-1.690162, 1.702942, 0.06533182, 1, 0.3058824, 0, 1,
-1.672389, 0.9773329, -0.5007123, 1, 0.3137255, 0, 1,
-1.6427, -0.3377955, -1.638082, 1, 0.3176471, 0, 1,
-1.626067, 1.025976, -1.322386, 1, 0.3254902, 0, 1,
-1.624097, 0.2989993, -2.692579, 1, 0.3294118, 0, 1,
-1.593289, 0.01095941, -1.35008, 1, 0.3372549, 0, 1,
-1.578155, -1.460064, -1.439663, 1, 0.3411765, 0, 1,
-1.550099, -0.7671545, -2.458244, 1, 0.3490196, 0, 1,
-1.544533, -0.8918356, -1.383402, 1, 0.3529412, 0, 1,
-1.543114, -0.7235867, -2.816778, 1, 0.3607843, 0, 1,
-1.542031, -0.04780427, -2.047746, 1, 0.3647059, 0, 1,
-1.540111, 1.088715, -1.195122, 1, 0.372549, 0, 1,
-1.536282, 0.4749485, -3.246325, 1, 0.3764706, 0, 1,
-1.535584, -0.2123821, -3.518294, 1, 0.3843137, 0, 1,
-1.534074, 1.440203, -1.572256, 1, 0.3882353, 0, 1,
-1.524867, -0.6301391, -2.199902, 1, 0.3960784, 0, 1,
-1.519973, 0.2088499, -2.429302, 1, 0.4039216, 0, 1,
-1.502436, -1.571809, -1.524739, 1, 0.4078431, 0, 1,
-1.496573, 1.104036, -1.720732, 1, 0.4156863, 0, 1,
-1.491746, -1.18446, -2.64931, 1, 0.4196078, 0, 1,
-1.488269, 0.08829958, -2.063428, 1, 0.427451, 0, 1,
-1.485476, -2.051553, -4.10909, 1, 0.4313726, 0, 1,
-1.484532, -0.7107912, -0.9469004, 1, 0.4392157, 0, 1,
-1.480963, 0.1664994, -1.862929, 1, 0.4431373, 0, 1,
-1.468661, 0.7051697, -0.8095292, 1, 0.4509804, 0, 1,
-1.466906, 0.9047404, -0.7386003, 1, 0.454902, 0, 1,
-1.459096, -1.264123, -2.897551, 1, 0.4627451, 0, 1,
-1.453849, 1.749198, -1.214029, 1, 0.4666667, 0, 1,
-1.449878, 0.005156555, 0.4938836, 1, 0.4745098, 0, 1,
-1.441183, 0.5965123, -2.249261, 1, 0.4784314, 0, 1,
-1.425562, 1.160346, 0.2480972, 1, 0.4862745, 0, 1,
-1.423194, 0.6402245, -1.377348, 1, 0.4901961, 0, 1,
-1.409652, -0.5233876, -1.241839, 1, 0.4980392, 0, 1,
-1.401076, -1.124422, -3.209996, 1, 0.5058824, 0, 1,
-1.398227, -0.8272433, -2.045403, 1, 0.509804, 0, 1,
-1.396791, 0.3155245, -1.119749, 1, 0.5176471, 0, 1,
-1.396019, -0.03723234, -2.919342, 1, 0.5215687, 0, 1,
-1.387128, 0.2091884, -1.588424, 1, 0.5294118, 0, 1,
-1.386281, -0.2973893, -1.948137, 1, 0.5333334, 0, 1,
-1.379956, -0.2116245, -1.395541, 1, 0.5411765, 0, 1,
-1.377092, 1.55105, -1.335426, 1, 0.5450981, 0, 1,
-1.361364, -2.700942, -3.387661, 1, 0.5529412, 0, 1,
-1.361343, 0.8195506, -0.1595521, 1, 0.5568628, 0, 1,
-1.360897, 0.9511107, 0.09692132, 1, 0.5647059, 0, 1,
-1.341721, 0.2216796, -0.08927716, 1, 0.5686275, 0, 1,
-1.324982, -0.2535095, -2.625135, 1, 0.5764706, 0, 1,
-1.319028, -1.611199, -1.761052, 1, 0.5803922, 0, 1,
-1.316447, 0.1063231, -1.802264, 1, 0.5882353, 0, 1,
-1.310637, 0.5318911, 0.3310327, 1, 0.5921569, 0, 1,
-1.298497, 0.05843028, -1.493604, 1, 0.6, 0, 1,
-1.297395, -1.234127, -3.106743, 1, 0.6078432, 0, 1,
-1.256765, -0.2073175, -2.085357, 1, 0.6117647, 0, 1,
-1.252997, -1.10033, -2.6214, 1, 0.6196079, 0, 1,
-1.24605, 1.135292, -0.9420748, 1, 0.6235294, 0, 1,
-1.243107, 1.148816, -2.069479, 1, 0.6313726, 0, 1,
-1.223709, 0.04739762, -1.390582, 1, 0.6352941, 0, 1,
-1.215876, 0.9694206, 0.9572376, 1, 0.6431373, 0, 1,
-1.212933, -2.60744, -2.077057, 1, 0.6470588, 0, 1,
-1.212216, 0.9442104, -0.03988228, 1, 0.654902, 0, 1,
-1.212113, 0.5614479, -2.1943, 1, 0.6588235, 0, 1,
-1.200098, -0.2092153, -1.211523, 1, 0.6666667, 0, 1,
-1.199673, -0.9993209, -2.306934, 1, 0.6705883, 0, 1,
-1.197299, -0.6159817, -2.309348, 1, 0.6784314, 0, 1,
-1.193853, 0.3084712, -1.378925, 1, 0.682353, 0, 1,
-1.185267, 0.5038129, -0.1388713, 1, 0.6901961, 0, 1,
-1.181419, -0.7357519, -2.240939, 1, 0.6941177, 0, 1,
-1.170741, 0.1623205, -1.13164, 1, 0.7019608, 0, 1,
-1.168997, 1.85536, -1.966004, 1, 0.7098039, 0, 1,
-1.168737, -0.03174322, -1.60381, 1, 0.7137255, 0, 1,
-1.161031, 0.5934551, -2.761649, 1, 0.7215686, 0, 1,
-1.155761, -0.4728187, -2.723765, 1, 0.7254902, 0, 1,
-1.152889, -0.5407696, -2.111301, 1, 0.7333333, 0, 1,
-1.150932, 0.2578992, -1.885158, 1, 0.7372549, 0, 1,
-1.149939, 0.0893282, -1.804988, 1, 0.7450981, 0, 1,
-1.145728, 1.094507, -1.510084, 1, 0.7490196, 0, 1,
-1.145178, -0.420719, -1.801031, 1, 0.7568628, 0, 1,
-1.138073, -1.848954, -2.875576, 1, 0.7607843, 0, 1,
-1.118868, -0.327136, -0.9984307, 1, 0.7686275, 0, 1,
-1.107297, 0.2092723, -0.5834408, 1, 0.772549, 0, 1,
-1.107275, -1.585843, -2.497779, 1, 0.7803922, 0, 1,
-1.099124, -0.9820991, -1.657613, 1, 0.7843137, 0, 1,
-1.097916, 2.09407, -0.004467547, 1, 0.7921569, 0, 1,
-1.090047, 0.1838756, -3.907404, 1, 0.7960784, 0, 1,
-1.056706, -0.8461531, -0.3121966, 1, 0.8039216, 0, 1,
-1.048985, 0.2382569, -2.137526, 1, 0.8117647, 0, 1,
-1.048504, 0.1711998, -2.717277, 1, 0.8156863, 0, 1,
-1.047594, 0.541952, -1.088453, 1, 0.8235294, 0, 1,
-1.04706, -1.81979, -1.881283, 1, 0.827451, 0, 1,
-1.030724, 0.7219876, -0.06689074, 1, 0.8352941, 0, 1,
-1.029654, 0.07578207, -2.129625, 1, 0.8392157, 0, 1,
-1.025353, 0.330536, -2.596154, 1, 0.8470588, 0, 1,
-1.021287, 0.4121797, -2.170645, 1, 0.8509804, 0, 1,
-1.020988, 0.2422329, -0.9466274, 1, 0.8588235, 0, 1,
-1.020886, -0.2210228, -1.485189, 1, 0.8627451, 0, 1,
-1.016328, -0.6928921, -4.73519, 1, 0.8705882, 0, 1,
-0.9967279, 1.249392, -1.096651, 1, 0.8745098, 0, 1,
-0.9948766, 1.890106, -1.653824, 1, 0.8823529, 0, 1,
-0.9909943, -0.1692237, -1.410116, 1, 0.8862745, 0, 1,
-0.9871899, 0.6758598, -0.5859977, 1, 0.8941177, 0, 1,
-0.9817998, 0.6979051, -0.3328237, 1, 0.8980392, 0, 1,
-0.9810507, -0.8921973, -2.029447, 1, 0.9058824, 0, 1,
-0.9760614, -0.2825116, -3.427398, 1, 0.9137255, 0, 1,
-0.975101, -1.246445, -2.033069, 1, 0.9176471, 0, 1,
-0.9747782, -0.2666225, -1.834314, 1, 0.9254902, 0, 1,
-0.9730449, -1.329025, -3.641515, 1, 0.9294118, 0, 1,
-0.9710978, -0.3043702, -2.721765, 1, 0.9372549, 0, 1,
-0.968148, 0.4931634, 0.1917125, 1, 0.9411765, 0, 1,
-0.9668898, 0.7845966, -2.304527, 1, 0.9490196, 0, 1,
-0.9610792, 1.215413, -0.6412866, 1, 0.9529412, 0, 1,
-0.9584237, -0.5288263, -1.478199, 1, 0.9607843, 0, 1,
-0.951197, -0.8205064, -1.708342, 1, 0.9647059, 0, 1,
-0.9409186, 1.002141, -0.9323521, 1, 0.972549, 0, 1,
-0.9372176, -0.7866007, -1.275195, 1, 0.9764706, 0, 1,
-0.9333365, 0.1726391, -0.5941555, 1, 0.9843137, 0, 1,
-0.9310564, 0.8795513, 0.2283574, 1, 0.9882353, 0, 1,
-0.9230413, 1.546306, -1.232577, 1, 0.9960784, 0, 1,
-0.919516, 0.2426549, -1.234901, 0.9960784, 1, 0, 1,
-0.9162019, -1.241564, -2.942087, 0.9921569, 1, 0, 1,
-0.9117451, -0.2006746, -3.240838, 0.9843137, 1, 0, 1,
-0.9097788, -1.241448, -1.369195, 0.9803922, 1, 0, 1,
-0.9034644, 1.554131, 0.2720456, 0.972549, 1, 0, 1,
-0.8993167, 0.5420768, -0.5869901, 0.9686275, 1, 0, 1,
-0.8983086, 1.259969, 1.341039, 0.9607843, 1, 0, 1,
-0.8949769, 1.192663, -2.476595, 0.9568627, 1, 0, 1,
-0.8893222, 2.067693, 0.1876448, 0.9490196, 1, 0, 1,
-0.879809, -0.208193, -0.7864583, 0.945098, 1, 0, 1,
-0.871757, -0.8299679, -2.870396, 0.9372549, 1, 0, 1,
-0.8710396, 0.226639, -1.123982, 0.9333333, 1, 0, 1,
-0.864092, -0.6333728, -1.082257, 0.9254902, 1, 0, 1,
-0.8610787, 0.3697767, -1.875011, 0.9215686, 1, 0, 1,
-0.8539432, -0.2600979, -2.624436, 0.9137255, 1, 0, 1,
-0.853446, -0.3525138, -1.519529, 0.9098039, 1, 0, 1,
-0.8516679, 0.1441939, -1.305399, 0.9019608, 1, 0, 1,
-0.8513319, -1.657445, -2.046849, 0.8941177, 1, 0, 1,
-0.8492913, 0.5869104, -2.503301, 0.8901961, 1, 0, 1,
-0.8452328, -1.386125, -1.506706, 0.8823529, 1, 0, 1,
-0.8439388, 0.702599, -1.767674, 0.8784314, 1, 0, 1,
-0.8410121, 0.9974698, 0.5237826, 0.8705882, 1, 0, 1,
-0.8352203, 0.397366, -1.01073, 0.8666667, 1, 0, 1,
-0.8328692, 1.881063, -1.280927, 0.8588235, 1, 0, 1,
-0.8308132, -0.6028826, -2.093946, 0.854902, 1, 0, 1,
-0.8303026, -1.445483, -0.8210924, 0.8470588, 1, 0, 1,
-0.8250789, -0.5555414, -2.752576, 0.8431373, 1, 0, 1,
-0.8232196, -0.7980806, -2.026726, 0.8352941, 1, 0, 1,
-0.8204345, -0.2904793, -1.045363, 0.8313726, 1, 0, 1,
-0.8158901, -2.46197, -3.634429, 0.8235294, 1, 0, 1,
-0.814024, 1.47182, -0.2987355, 0.8196079, 1, 0, 1,
-0.8132439, 0.5511878, 0.6584545, 0.8117647, 1, 0, 1,
-0.8100976, 0.338551, -1.178017, 0.8078431, 1, 0, 1,
-0.8014306, 0.5260991, -1.132114, 0.8, 1, 0, 1,
-0.7998117, 0.003047582, -0.9606808, 0.7921569, 1, 0, 1,
-0.7972802, 0.4383012, -2.139193, 0.7882353, 1, 0, 1,
-0.7943724, 0.4571811, -0.9868065, 0.7803922, 1, 0, 1,
-0.7942324, 0.4923107, -1.097527, 0.7764706, 1, 0, 1,
-0.7870173, 1.16847, -1.083642, 0.7686275, 1, 0, 1,
-0.7842048, -1.346249, -1.690233, 0.7647059, 1, 0, 1,
-0.7776033, -0.3853837, -2.317703, 0.7568628, 1, 0, 1,
-0.7702069, 0.605521, -2.137608, 0.7529412, 1, 0, 1,
-0.7700118, 1.32249, -1.579441, 0.7450981, 1, 0, 1,
-0.7666209, -0.2827002, -2.539452, 0.7411765, 1, 0, 1,
-0.7630867, 0.04237201, -1.523415, 0.7333333, 1, 0, 1,
-0.7597979, 0.3841493, -1.793694, 0.7294118, 1, 0, 1,
-0.7586902, -1.412848, -2.718378, 0.7215686, 1, 0, 1,
-0.7577935, 1.380888, 0.5537779, 0.7176471, 1, 0, 1,
-0.75434, 1.085294, -0.6525089, 0.7098039, 1, 0, 1,
-0.7538854, -0.7077516, -2.810276, 0.7058824, 1, 0, 1,
-0.7521507, 0.1671263, -2.100734, 0.6980392, 1, 0, 1,
-0.749432, -0.397808, -2.821012, 0.6901961, 1, 0, 1,
-0.7403314, 0.7258332, 0.1263088, 0.6862745, 1, 0, 1,
-0.7364241, 0.7037708, -1.272705, 0.6784314, 1, 0, 1,
-0.7224261, -0.3490728, -3.894374, 0.6745098, 1, 0, 1,
-0.7220582, 1.470898, 0.7887434, 0.6666667, 1, 0, 1,
-0.7218802, 0.6535361, -0.9567113, 0.6627451, 1, 0, 1,
-0.7172688, -0.9564469, -2.208441, 0.654902, 1, 0, 1,
-0.7146874, -0.5716672, -2.02001, 0.6509804, 1, 0, 1,
-0.7110843, 0.2433297, -0.3495131, 0.6431373, 1, 0, 1,
-0.7100859, -0.8000441, -2.127979, 0.6392157, 1, 0, 1,
-0.7019758, 0.6316632, -1.369137, 0.6313726, 1, 0, 1,
-0.692223, 1.140909, 0.5663921, 0.627451, 1, 0, 1,
-0.6884546, -0.1933473, -1.005342, 0.6196079, 1, 0, 1,
-0.6869915, 0.9699428, -0.4225647, 0.6156863, 1, 0, 1,
-0.6867902, 1.438324, -1.309702, 0.6078432, 1, 0, 1,
-0.6864879, -1.545015, -5.022655, 0.6039216, 1, 0, 1,
-0.6850984, 1.680813, -0.1995951, 0.5960785, 1, 0, 1,
-0.6808581, -0.8464934, -2.51039, 0.5882353, 1, 0, 1,
-0.6787894, 0.4699522, -1.178268, 0.5843138, 1, 0, 1,
-0.6737617, 0.9402574, -0.5218996, 0.5764706, 1, 0, 1,
-0.6686036, -0.3774924, -1.635371, 0.572549, 1, 0, 1,
-0.6596524, -0.1031184, -2.974873, 0.5647059, 1, 0, 1,
-0.657895, 0.1715537, -0.1222018, 0.5607843, 1, 0, 1,
-0.6469955, 1.335456, -0.6418127, 0.5529412, 1, 0, 1,
-0.6466756, 0.121096, -1.657981, 0.5490196, 1, 0, 1,
-0.6393662, 0.5937902, -1.410621, 0.5411765, 1, 0, 1,
-0.6304814, -1.374732, -2.788806, 0.5372549, 1, 0, 1,
-0.6296609, 0.3268064, -1.025304, 0.5294118, 1, 0, 1,
-0.6285515, -0.2708857, -2.055124, 0.5254902, 1, 0, 1,
-0.6274478, 1.969506, -0.919337, 0.5176471, 1, 0, 1,
-0.6253883, 0.1878877, -2.971291, 0.5137255, 1, 0, 1,
-0.624966, 0.8095358, -2.576066, 0.5058824, 1, 0, 1,
-0.6241226, 1.093458, -1.758911, 0.5019608, 1, 0, 1,
-0.6170326, 0.5406955, -0.003195481, 0.4941176, 1, 0, 1,
-0.6111889, 0.8600239, -1.833787, 0.4862745, 1, 0, 1,
-0.6106946, -1.789357, -1.61939, 0.4823529, 1, 0, 1,
-0.6073933, -1.918145, -2.260629, 0.4745098, 1, 0, 1,
-0.5978788, -0.1216008, 0.136694, 0.4705882, 1, 0, 1,
-0.5964338, -0.5750958, -2.55105, 0.4627451, 1, 0, 1,
-0.5958699, -0.4466778, -1.990282, 0.4588235, 1, 0, 1,
-0.5939904, 0.7337475, -0.6302982, 0.4509804, 1, 0, 1,
-0.5931783, -0.5456086, -1.244462, 0.4470588, 1, 0, 1,
-0.5877159, -0.9809172, -2.857719, 0.4392157, 1, 0, 1,
-0.5843495, 0.6784555, -0.5642883, 0.4352941, 1, 0, 1,
-0.5808277, 0.1889492, -2.345736, 0.427451, 1, 0, 1,
-0.5746905, 0.1324877, -1.576633, 0.4235294, 1, 0, 1,
-0.5744184, 1.278104, 0.17357, 0.4156863, 1, 0, 1,
-0.5709726, -1.20255, -3.560928, 0.4117647, 1, 0, 1,
-0.5661806, -0.1663591, -2.479212, 0.4039216, 1, 0, 1,
-0.564498, 0.222442, -0.1722452, 0.3960784, 1, 0, 1,
-0.5623602, -1.565192, -3.283124, 0.3921569, 1, 0, 1,
-0.562026, -0.5011569, -1.785426, 0.3843137, 1, 0, 1,
-0.5598643, -1.057715, -4.118808, 0.3803922, 1, 0, 1,
-0.5536855, -0.5037804, -1.748037, 0.372549, 1, 0, 1,
-0.5529267, 1.45552, -0.7637179, 0.3686275, 1, 0, 1,
-0.5476134, 1.5434, 0.2591187, 0.3607843, 1, 0, 1,
-0.5463548, -1.323845, -2.971456, 0.3568628, 1, 0, 1,
-0.5450715, 0.4705229, -1.658167, 0.3490196, 1, 0, 1,
-0.5415565, 1.225168, 0.3824013, 0.345098, 1, 0, 1,
-0.539065, -1.563327, -3.376007, 0.3372549, 1, 0, 1,
-0.5333099, 1.367865, -0.5198224, 0.3333333, 1, 0, 1,
-0.5280873, -0.7893142, -2.156589, 0.3254902, 1, 0, 1,
-0.517724, -0.7975172, -2.911973, 0.3215686, 1, 0, 1,
-0.5176685, 1.422047, 0.1673544, 0.3137255, 1, 0, 1,
-0.5164195, 0.8430721, -2.63582, 0.3098039, 1, 0, 1,
-0.5141742, -0.1364446, -2.013266, 0.3019608, 1, 0, 1,
-0.5118273, 0.8420896, -1.251436, 0.2941177, 1, 0, 1,
-0.5114561, 0.8643641, 0.2327412, 0.2901961, 1, 0, 1,
-0.5108567, 0.8126688, -0.177939, 0.282353, 1, 0, 1,
-0.5055673, -1.997229, -4.166052, 0.2784314, 1, 0, 1,
-0.5033269, -0.1399668, -3.285367, 0.2705882, 1, 0, 1,
-0.4966694, -1.786519, -1.829596, 0.2666667, 1, 0, 1,
-0.4951674, -0.692735, -2.274289, 0.2588235, 1, 0, 1,
-0.4951603, 1.409039, -1.683235, 0.254902, 1, 0, 1,
-0.4936291, 0.2260803, 1.037288, 0.2470588, 1, 0, 1,
-0.4920464, -0.3885333, -3.257111, 0.2431373, 1, 0, 1,
-0.4915361, -0.06074742, -2.22635, 0.2352941, 1, 0, 1,
-0.4905728, 0.1865389, -1.864863, 0.2313726, 1, 0, 1,
-0.4896147, 0.2239945, -1.443235, 0.2235294, 1, 0, 1,
-0.4880786, -0.606895, -2.831328, 0.2196078, 1, 0, 1,
-0.4827736, 0.3349462, 0.2642537, 0.2117647, 1, 0, 1,
-0.4789955, -0.7156922, -3.241515, 0.2078431, 1, 0, 1,
-0.4770961, 0.4923639, 0.005294449, 0.2, 1, 0, 1,
-0.4712687, 1.283671, -1.746416, 0.1921569, 1, 0, 1,
-0.4704456, 0.9389248, 1.378071, 0.1882353, 1, 0, 1,
-0.4684391, -1.898372, -3.348874, 0.1803922, 1, 0, 1,
-0.4682587, -1.031459, -4.312529, 0.1764706, 1, 0, 1,
-0.4647979, 1.280363, 1.059921, 0.1686275, 1, 0, 1,
-0.4592971, -0.8087101, -3.056371, 0.1647059, 1, 0, 1,
-0.4478, 0.03104616, -3.637977, 0.1568628, 1, 0, 1,
-0.4461793, 0.5038445, -1.03464, 0.1529412, 1, 0, 1,
-0.4439985, 1.083631, 1.603543, 0.145098, 1, 0, 1,
-0.4432909, -0.8067282, -0.5489452, 0.1411765, 1, 0, 1,
-0.4416718, 0.8906167, -0.3725324, 0.1333333, 1, 0, 1,
-0.4384494, -0.3640253, -0.5569795, 0.1294118, 1, 0, 1,
-0.4377826, 0.3677181, 0.08807412, 0.1215686, 1, 0, 1,
-0.4356323, 1.159351, -1.441589, 0.1176471, 1, 0, 1,
-0.4341985, 1.100229, -0.9142484, 0.1098039, 1, 0, 1,
-0.4307002, 0.2645046, -0.2776624, 0.1058824, 1, 0, 1,
-0.4297577, -0.8112105, -2.343276, 0.09803922, 1, 0, 1,
-0.4253634, -0.3459972, -1.004943, 0.09019608, 1, 0, 1,
-0.4236336, -0.08658014, -1.068035, 0.08627451, 1, 0, 1,
-0.422056, -0.7588931, -4.995958, 0.07843138, 1, 0, 1,
-0.4188611, -1.241352, -3.194986, 0.07450981, 1, 0, 1,
-0.4183746, 0.8205888, -1.607469, 0.06666667, 1, 0, 1,
-0.4169053, 0.04875644, -1.076461, 0.0627451, 1, 0, 1,
-0.4161116, 1.124078, 0.1791535, 0.05490196, 1, 0, 1,
-0.4115834, -0.2015004, -2.823552, 0.05098039, 1, 0, 1,
-0.4095431, 0.3626435, 0.3842323, 0.04313726, 1, 0, 1,
-0.4073755, -0.1753295, -1.875708, 0.03921569, 1, 0, 1,
-0.4049471, 1.130549, 0.6526693, 0.03137255, 1, 0, 1,
-0.4044313, 0.476708, -0.6610025, 0.02745098, 1, 0, 1,
-0.4032268, -0.7460426, -3.037015, 0.01960784, 1, 0, 1,
-0.4014456, 1.114297, -0.4023416, 0.01568628, 1, 0, 1,
-0.3968471, 0.8002452, -1.005416, 0.007843138, 1, 0, 1,
-0.3963979, -0.2777852, -1.901914, 0.003921569, 1, 0, 1,
-0.394831, 1.56594, -1.386455, 0, 1, 0.003921569, 1,
-0.3932684, 0.04501795, -3.220413, 0, 1, 0.01176471, 1,
-0.391528, 0.51811, -1.315566, 0, 1, 0.01568628, 1,
-0.3899807, 0.025628, -1.621549, 0, 1, 0.02352941, 1,
-0.3862592, -0.5839819, -3.543761, 0, 1, 0.02745098, 1,
-0.3801407, 0.407205, -1.005488, 0, 1, 0.03529412, 1,
-0.3784665, -0.6117681, -2.521875, 0, 1, 0.03921569, 1,
-0.3768664, -0.05528184, -0.4804029, 0, 1, 0.04705882, 1,
-0.3719799, -0.9391596, -2.947232, 0, 1, 0.05098039, 1,
-0.3685718, -1.621647, -2.499676, 0, 1, 0.05882353, 1,
-0.3648821, -0.8601103, -0.3244112, 0, 1, 0.0627451, 1,
-0.355905, -1.209514, -3.4308, 0, 1, 0.07058824, 1,
-0.3487664, -2.631184, -3.239313, 0, 1, 0.07450981, 1,
-0.3476143, -1.819652, -3.078091, 0, 1, 0.08235294, 1,
-0.3418296, -0.02197439, -2.44209, 0, 1, 0.08627451, 1,
-0.3382086, 0.8258592, -1.705235, 0, 1, 0.09411765, 1,
-0.3363961, 0.08161502, -1.443516, 0, 1, 0.1019608, 1,
-0.331437, 0.4143458, -0.6159832, 0, 1, 0.1058824, 1,
-0.3292508, -1.054312, -1.672841, 0, 1, 0.1137255, 1,
-0.3281597, -0.8161232, -3.522771, 0, 1, 0.1176471, 1,
-0.3246736, -0.4619491, -2.990249, 0, 1, 0.1254902, 1,
-0.3244889, 0.5153462, -1.948665, 0, 1, 0.1294118, 1,
-0.3184747, 0.3232221, -1.311586, 0, 1, 0.1372549, 1,
-0.3110441, -0.04607875, -1.41245, 0, 1, 0.1411765, 1,
-0.3096387, 1.266213, 0.5228845, 0, 1, 0.1490196, 1,
-0.3088215, -0.9742229, -1.837477, 0, 1, 0.1529412, 1,
-0.306877, 0.03350877, -1.152814, 0, 1, 0.1607843, 1,
-0.3013794, 1.361725, -0.5668717, 0, 1, 0.1647059, 1,
-0.3007286, -0.225861, -3.151886, 0, 1, 0.172549, 1,
-0.2988204, 0.2468185, -1.845852, 0, 1, 0.1764706, 1,
-0.2943013, 0.7413625, 0.4983411, 0, 1, 0.1843137, 1,
-0.2921865, 1.359605, 0.2057445, 0, 1, 0.1882353, 1,
-0.282883, -1.617178, -3.553372, 0, 1, 0.1960784, 1,
-0.2827622, 0.8632521, -0.4390802, 0, 1, 0.2039216, 1,
-0.2818784, -1.674874, -1.036066, 0, 1, 0.2078431, 1,
-0.2811846, -0.765189, -3.060904, 0, 1, 0.2156863, 1,
-0.2795655, -0.472984, -0.3837963, 0, 1, 0.2196078, 1,
-0.2774527, 0.0182648, -1.646497, 0, 1, 0.227451, 1,
-0.2768765, 0.1629097, -1.281976, 0, 1, 0.2313726, 1,
-0.2746168, 0.1022072, -2.120806, 0, 1, 0.2392157, 1,
-0.2740669, 0.5997521, -2.361827, 0, 1, 0.2431373, 1,
-0.27149, -0.1710494, -1.35097, 0, 1, 0.2509804, 1,
-0.2698317, -0.4054954, -3.26495, 0, 1, 0.254902, 1,
-0.2623495, 1.250108, -0.5303816, 0, 1, 0.2627451, 1,
-0.2612993, -0.02642876, -1.709201, 0, 1, 0.2666667, 1,
-0.2589641, -0.1248345, -1.380842, 0, 1, 0.2745098, 1,
-0.256441, -0.03095497, -1.635168, 0, 1, 0.2784314, 1,
-0.2519618, -2.073452, -3.300937, 0, 1, 0.2862745, 1,
-0.2491856, 0.7105152, -3.031188, 0, 1, 0.2901961, 1,
-0.245448, -1.320383, -3.543585, 0, 1, 0.2980392, 1,
-0.2447785, 0.114924, -1.875065, 0, 1, 0.3058824, 1,
-0.243709, -0.8609355, -4.350587, 0, 1, 0.3098039, 1,
-0.2416223, 0.4149266, -0.6626763, 0, 1, 0.3176471, 1,
-0.2386262, -1.246217, -2.253113, 0, 1, 0.3215686, 1,
-0.2296284, -0.3159684, -3.15117, 0, 1, 0.3294118, 1,
-0.228837, -0.3244101, -2.742362, 0, 1, 0.3333333, 1,
-0.2283435, -0.8860993, -3.814463, 0, 1, 0.3411765, 1,
-0.2279676, 1.493763, 1.247033, 0, 1, 0.345098, 1,
-0.2241949, 0.4764932, -0.4531191, 0, 1, 0.3529412, 1,
-0.2209603, -0.7066881, -2.286029, 0, 1, 0.3568628, 1,
-0.2204137, -0.2903592, -2.333869, 0, 1, 0.3647059, 1,
-0.2172315, 0.1320081, -1.497265, 0, 1, 0.3686275, 1,
-0.2167629, -0.9109582, -2.337043, 0, 1, 0.3764706, 1,
-0.2116579, 0.3198421, 0.731914, 0, 1, 0.3803922, 1,
-0.2073492, 1.280982, 0.358661, 0, 1, 0.3882353, 1,
-0.2062058, -0.4702303, -1.59317, 0, 1, 0.3921569, 1,
-0.2061765, -0.1064158, -1.417707, 0, 1, 0.4, 1,
-0.2052147, 0.288446, -0.7873061, 0, 1, 0.4078431, 1,
-0.2048336, 1.799082, 0.5911158, 0, 1, 0.4117647, 1,
-0.2047636, 1.104845, -0.8209921, 0, 1, 0.4196078, 1,
-0.2042437, 0.9518811, -0.6717032, 0, 1, 0.4235294, 1,
-0.200161, 1.599338, -0.4959821, 0, 1, 0.4313726, 1,
-0.1989847, -1.344496, -1.653883, 0, 1, 0.4352941, 1,
-0.196179, -1.488329, -3.466008, 0, 1, 0.4431373, 1,
-0.1944997, -0.1077871, -1.499465, 0, 1, 0.4470588, 1,
-0.1885519, -1.09361, -3.981201, 0, 1, 0.454902, 1,
-0.1877155, 0.5779266, 1.331129, 0, 1, 0.4588235, 1,
-0.1870875, 2.666105, -0.3246536, 0, 1, 0.4666667, 1,
-0.184198, -0.9616407, -2.914699, 0, 1, 0.4705882, 1,
-0.1837289, -0.2402921, -3.998735, 0, 1, 0.4784314, 1,
-0.183622, -1.566519, -2.494799, 0, 1, 0.4823529, 1,
-0.1809725, -1.79703, -3.998908, 0, 1, 0.4901961, 1,
-0.1803367, -2.044687, -2.679757, 0, 1, 0.4941176, 1,
-0.1793102, -0.8269442, -2.925904, 0, 1, 0.5019608, 1,
-0.1767765, 0.2223291, -0.6103196, 0, 1, 0.509804, 1,
-0.176474, -0.7653359, -1.933498, 0, 1, 0.5137255, 1,
-0.1753781, -0.1996351, -0.3455954, 0, 1, 0.5215687, 1,
-0.1724446, -0.3038771, -2.359769, 0, 1, 0.5254902, 1,
-0.1723639, 0.6354238, -2.220832, 0, 1, 0.5333334, 1,
-0.1721901, -0.7241217, -4.462574, 0, 1, 0.5372549, 1,
-0.1670084, 0.9214178, -2.013677, 0, 1, 0.5450981, 1,
-0.1652236, -0.6016743, -3.026337, 0, 1, 0.5490196, 1,
-0.1610287, -0.3088886, -2.400409, 0, 1, 0.5568628, 1,
-0.1587391, -0.1696781, -1.892987, 0, 1, 0.5607843, 1,
-0.1580898, 0.8248545, -0.5369589, 0, 1, 0.5686275, 1,
-0.1540872, -0.06810503, -1.652305, 0, 1, 0.572549, 1,
-0.1535057, -0.9026946, -3.198639, 0, 1, 0.5803922, 1,
-0.1508821, -0.6261948, -3.512972, 0, 1, 0.5843138, 1,
-0.1501765, -0.1137723, -2.691812, 0, 1, 0.5921569, 1,
-0.1501193, -0.9267238, -0.7543405, 0, 1, 0.5960785, 1,
-0.1452002, 0.7703301, -1.18601, 0, 1, 0.6039216, 1,
-0.143278, -1.351872, -4.375612, 0, 1, 0.6117647, 1,
-0.1403704, -0.2899267, -4.193244, 0, 1, 0.6156863, 1,
-0.1367587, -1.122612, -3.570534, 0, 1, 0.6235294, 1,
-0.1337811, -1.564457, -2.739961, 0, 1, 0.627451, 1,
-0.1325475, 0.8214297, -1.231657, 0, 1, 0.6352941, 1,
-0.1317862, -2.171307, -4.086318, 0, 1, 0.6392157, 1,
-0.1311509, 0.8516839, 0.9715188, 0, 1, 0.6470588, 1,
-0.1309798, -0.4406138, -1.972663, 0, 1, 0.6509804, 1,
-0.1293134, 1.18664, 1.129992, 0, 1, 0.6588235, 1,
-0.1266517, 1.548676, 1.100647, 0, 1, 0.6627451, 1,
-0.1259641, -0.7148038, -2.474966, 0, 1, 0.6705883, 1,
-0.1249022, -0.7826906, -4.235643, 0, 1, 0.6745098, 1,
-0.124691, -0.5040641, -1.958945, 0, 1, 0.682353, 1,
-0.1216049, -0.1377589, -2.13979, 0, 1, 0.6862745, 1,
-0.1184052, -0.4140815, -3.593875, 0, 1, 0.6941177, 1,
-0.1158114, 1.415847, 0.4757541, 0, 1, 0.7019608, 1,
-0.1136399, -0.9280559, -3.274044, 0, 1, 0.7058824, 1,
-0.1085691, 0.8710973, 0.1219068, 0, 1, 0.7137255, 1,
-0.1062825, 1.123635, 0.3815563, 0, 1, 0.7176471, 1,
-0.1053397, 0.2654386, -0.5052488, 0, 1, 0.7254902, 1,
-0.1044845, -0.1792128, -3.854161, 0, 1, 0.7294118, 1,
-0.1023382, 0.6355002, -0.4395228, 0, 1, 0.7372549, 1,
-0.1019025, -0.1299395, -2.004245, 0, 1, 0.7411765, 1,
-0.09918863, 1.497385, -2.335296, 0, 1, 0.7490196, 1,
-0.09857944, -0.544113, -3.474239, 0, 1, 0.7529412, 1,
-0.08926069, 2.10716, 0.5055618, 0, 1, 0.7607843, 1,
-0.08404194, -1.632432, -3.621363, 0, 1, 0.7647059, 1,
-0.07516211, 0.2232684, -0.2892245, 0, 1, 0.772549, 1,
-0.07167356, 0.9680939, -2.419038, 0, 1, 0.7764706, 1,
-0.07097463, -0.9622058, -1.920845, 0, 1, 0.7843137, 1,
-0.07040143, 0.1146383, -3.038206, 0, 1, 0.7882353, 1,
-0.0643168, 0.5611837, 0.5524755, 0, 1, 0.7960784, 1,
-0.05968757, 0.120108, -1.110844, 0, 1, 0.8039216, 1,
-0.05868286, 0.9367756, 1.204243, 0, 1, 0.8078431, 1,
-0.05541988, -1.021194, -2.259924, 0, 1, 0.8156863, 1,
-0.05450523, -0.7002986, -4.30787, 0, 1, 0.8196079, 1,
-0.04941536, -0.004565475, -2.020139, 0, 1, 0.827451, 1,
-0.04925298, -2.214426, -2.617576, 0, 1, 0.8313726, 1,
-0.04707065, 0.1983289, -0.05406316, 0, 1, 0.8392157, 1,
-0.04105533, 1.753658, 0.9107803, 0, 1, 0.8431373, 1,
-0.03758988, -2.096037, -3.714597, 0, 1, 0.8509804, 1,
-0.03758333, -1.070327, -3.509938, 0, 1, 0.854902, 1,
-0.03705118, 0.1166659, -1.38591, 0, 1, 0.8627451, 1,
-0.03530254, 0.5725804, -0.4703156, 0, 1, 0.8666667, 1,
-0.0350068, -0.8339676, -1.784846, 0, 1, 0.8745098, 1,
-0.03223699, 0.3327425, -0.4619209, 0, 1, 0.8784314, 1,
-0.03197989, 0.4800818, 1.500902, 0, 1, 0.8862745, 1,
-0.03082039, 1.178335, -0.241563, 0, 1, 0.8901961, 1,
-0.02636889, -0.4219078, -2.937132, 0, 1, 0.8980392, 1,
-0.02458069, 0.2408435, -0.4310668, 0, 1, 0.9058824, 1,
-0.02116983, -0.07576545, -2.377404, 0, 1, 0.9098039, 1,
-0.02008593, 0.1964891, -0.1340299, 0, 1, 0.9176471, 1,
-0.01942144, 0.2689808, 0.5011107, 0, 1, 0.9215686, 1,
-0.008887259, -0.2059662, -4.194525, 0, 1, 0.9294118, 1,
-0.008658072, 1.314284, 0.6542655, 0, 1, 0.9333333, 1,
-0.008017388, -1.391829, -3.907455, 0, 1, 0.9411765, 1,
-0.007650802, -0.1838646, -1.860629, 0, 1, 0.945098, 1,
-0.006746561, 0.241555, 0.1537845, 0, 1, 0.9529412, 1,
-0.004146443, -0.05113294, -2.928001, 0, 1, 0.9568627, 1,
-0.003198497, 0.709251, -0.5395068, 0, 1, 0.9647059, 1,
-0.001953096, -1.69939, -4.163251, 0, 1, 0.9686275, 1,
-0.0008399575, -0.4068125, -3.227496, 0, 1, 0.9764706, 1,
0.004708691, 2.21386, 0.5040114, 0, 1, 0.9803922, 1,
0.006140348, -1.108792, 2.989046, 0, 1, 0.9882353, 1,
0.008602706, 0.8057713, 0.8044721, 0, 1, 0.9921569, 1,
0.008641755, 0.8884973, 0.04424753, 0, 1, 1, 1,
0.009699179, -0.08110715, 3.852662, 0, 0.9921569, 1, 1,
0.01525581, -0.4084545, 2.210843, 0, 0.9882353, 1, 1,
0.01765278, -0.356149, 2.147219, 0, 0.9803922, 1, 1,
0.01897861, 0.4317009, 0.7292164, 0, 0.9764706, 1, 1,
0.02047318, 1.526899, -0.2722261, 0, 0.9686275, 1, 1,
0.02715334, 1.315649, -1.09576, 0, 0.9647059, 1, 1,
0.02838315, 0.4504753, -1.844334, 0, 0.9568627, 1, 1,
0.0289122, 0.1430548, -1.613823, 0, 0.9529412, 1, 1,
0.0327822, -0.2116717, 2.050724, 0, 0.945098, 1, 1,
0.03517589, -0.7479567, 2.571588, 0, 0.9411765, 1, 1,
0.03727588, 0.2348004, 0.04004061, 0, 0.9333333, 1, 1,
0.04118985, -1.005002, 2.448657, 0, 0.9294118, 1, 1,
0.04455641, 1.262093, -0.7239763, 0, 0.9215686, 1, 1,
0.04795358, 0.275207, -1.171137, 0, 0.9176471, 1, 1,
0.05143423, 0.5612581, 0.2137808, 0, 0.9098039, 1, 1,
0.05203412, 1.519709, -1.354963, 0, 0.9058824, 1, 1,
0.05356928, -0.4557387, 2.148171, 0, 0.8980392, 1, 1,
0.05570209, 0.9057064, 1.316955, 0, 0.8901961, 1, 1,
0.05847569, 0.3247422, 0.06206171, 0, 0.8862745, 1, 1,
0.05908139, -0.6358983, 0.983641, 0, 0.8784314, 1, 1,
0.0603369, 0.5301751, 0.8902917, 0, 0.8745098, 1, 1,
0.06290302, -1.621126, 4.437047, 0, 0.8666667, 1, 1,
0.06495003, 0.6221281, -0.2184239, 0, 0.8627451, 1, 1,
0.0654211, -0.5320387, 3.958001, 0, 0.854902, 1, 1,
0.06640329, 0.9097916, -0.7141704, 0, 0.8509804, 1, 1,
0.0678213, -0.1034028, 2.49191, 0, 0.8431373, 1, 1,
0.06995681, 0.4137487, 0.845709, 0, 0.8392157, 1, 1,
0.07340095, -0.01583097, 1.969326, 0, 0.8313726, 1, 1,
0.07528581, -0.335425, 1.838026, 0, 0.827451, 1, 1,
0.07544965, 1.044366, -0.2796177, 0, 0.8196079, 1, 1,
0.07809759, 0.5342871, 0.848902, 0, 0.8156863, 1, 1,
0.0873739, 0.07186507, 0.4069646, 0, 0.8078431, 1, 1,
0.09789991, 0.855055, -1.059426, 0, 0.8039216, 1, 1,
0.1004736, -0.5210285, 3.316658, 0, 0.7960784, 1, 1,
0.1008418, 0.7848732, 1.320971, 0, 0.7882353, 1, 1,
0.1045082, -0.4425261, 3.197077, 0, 0.7843137, 1, 1,
0.1049712, 0.7212742, 0.06816934, 0, 0.7764706, 1, 1,
0.1086098, 1.151724, 1.092779, 0, 0.772549, 1, 1,
0.1155549, -0.177877, 3.123717, 0, 0.7647059, 1, 1,
0.1156259, 0.8980934, 1.590765, 0, 0.7607843, 1, 1,
0.1198677, -0.6748005, 2.831903, 0, 0.7529412, 1, 1,
0.1208386, -1.371678, 4.111246, 0, 0.7490196, 1, 1,
0.1226706, -0.2569729, 2.113255, 0, 0.7411765, 1, 1,
0.1235839, 1.017853, 0.2698694, 0, 0.7372549, 1, 1,
0.1239003, -0.7335452, 1.689126, 0, 0.7294118, 1, 1,
0.1248616, -1.624183, 2.712526, 0, 0.7254902, 1, 1,
0.1262926, 0.8968014, 1.632641, 0, 0.7176471, 1, 1,
0.1280597, -1.498657, 3.606794, 0, 0.7137255, 1, 1,
0.1318581, -0.07357635, 0.9141692, 0, 0.7058824, 1, 1,
0.1348238, 1.066384, -0.05253964, 0, 0.6980392, 1, 1,
0.1364101, -1.55887, 2.372759, 0, 0.6941177, 1, 1,
0.1382729, -1.206122, 1.450904, 0, 0.6862745, 1, 1,
0.1401316, 0.1991542, -0.1813509, 0, 0.682353, 1, 1,
0.1486305, 0.3228004, -1.237485, 0, 0.6745098, 1, 1,
0.151319, -0.3756968, 1.3857, 0, 0.6705883, 1, 1,
0.1530206, -1.206516, 4.595555, 0, 0.6627451, 1, 1,
0.1570295, 0.5767243, 1.044999, 0, 0.6588235, 1, 1,
0.157201, 0.1144094, 0.9516889, 0, 0.6509804, 1, 1,
0.1597071, 1.143142, 0.5901475, 0, 0.6470588, 1, 1,
0.1598167, -0.1252546, 2.019177, 0, 0.6392157, 1, 1,
0.1622544, -0.1754202, 2.103052, 0, 0.6352941, 1, 1,
0.1633088, 0.1923495, 0.7646018, 0, 0.627451, 1, 1,
0.1679933, 1.348797, 0.5010527, 0, 0.6235294, 1, 1,
0.1687247, 0.3582033, 1.378603, 0, 0.6156863, 1, 1,
0.1689618, 0.8364099, -0.2294187, 0, 0.6117647, 1, 1,
0.1791442, -1.102383, 2.293774, 0, 0.6039216, 1, 1,
0.187367, -0.5295522, 1.552382, 0, 0.5960785, 1, 1,
0.1880196, -0.9751395, 2.728198, 0, 0.5921569, 1, 1,
0.1979143, 0.284825, 0.5259475, 0, 0.5843138, 1, 1,
0.2002406, 1.109202, 0.8320488, 0, 0.5803922, 1, 1,
0.2046654, 0.1143583, 2.536912, 0, 0.572549, 1, 1,
0.2066968, 0.3697606, -1.353135, 0, 0.5686275, 1, 1,
0.2068307, 1.025751, -0.03679621, 0, 0.5607843, 1, 1,
0.2073534, -1.694439, 2.317683, 0, 0.5568628, 1, 1,
0.2088185, 1.398964, 0.7421125, 0, 0.5490196, 1, 1,
0.2145532, 2.115177, 0.4103631, 0, 0.5450981, 1, 1,
0.2146089, -0.06985679, 1.301428, 0, 0.5372549, 1, 1,
0.2174382, -0.7329645, 1.532249, 0, 0.5333334, 1, 1,
0.2228489, 1.198483, 1.673635, 0, 0.5254902, 1, 1,
0.2279619, -0.7591068, 1.602495, 0, 0.5215687, 1, 1,
0.2293128, -0.7935601, 3.091268, 0, 0.5137255, 1, 1,
0.2385162, -1.337245, 3.067014, 0, 0.509804, 1, 1,
0.2388097, -0.4264879, 2.936782, 0, 0.5019608, 1, 1,
0.238866, -0.008079558, -0.8145292, 0, 0.4941176, 1, 1,
0.2543643, -0.5596988, 2.003395, 0, 0.4901961, 1, 1,
0.2553249, 0.7654426, 0.3127479, 0, 0.4823529, 1, 1,
0.2574232, -0.6319731, 2.524894, 0, 0.4784314, 1, 1,
0.2581858, 2.096229, -0.716667, 0, 0.4705882, 1, 1,
0.262439, -0.2165148, 1.82706, 0, 0.4666667, 1, 1,
0.2657384, 0.1342659, 0.6359374, 0, 0.4588235, 1, 1,
0.2668899, -0.4079902, 2.626617, 0, 0.454902, 1, 1,
0.2699514, -0.6685732, -0.09700926, 0, 0.4470588, 1, 1,
0.2737172, 0.520922, 0.7891176, 0, 0.4431373, 1, 1,
0.2747675, 0.2835885, 0.6299582, 0, 0.4352941, 1, 1,
0.2750465, 1.030752, 0.9755942, 0, 0.4313726, 1, 1,
0.275477, -1.541509, 0.5401121, 0, 0.4235294, 1, 1,
0.2786698, -0.4280543, 3.426093, 0, 0.4196078, 1, 1,
0.2787483, -0.09349602, 1.260925, 0, 0.4117647, 1, 1,
0.2798195, 1.023283, 0.7323413, 0, 0.4078431, 1, 1,
0.2830667, -1.599708, 3.07723, 0, 0.4, 1, 1,
0.2842077, -0.8740392, 3.069001, 0, 0.3921569, 1, 1,
0.2876384, 2.034168, 0.328554, 0, 0.3882353, 1, 1,
0.2877724, -0.870524, 3.242978, 0, 0.3803922, 1, 1,
0.2891647, 0.5114397, -0.4517741, 0, 0.3764706, 1, 1,
0.2896332, -1.156147, 2.400855, 0, 0.3686275, 1, 1,
0.2925614, 1.667128, 0.3081468, 0, 0.3647059, 1, 1,
0.2953514, 0.263702, 0.8046287, 0, 0.3568628, 1, 1,
0.2957204, 1.656123, -0.9421797, 0, 0.3529412, 1, 1,
0.2957635, 0.6138886, -0.365572, 0, 0.345098, 1, 1,
0.2987395, 0.02177319, 1.414039, 0, 0.3411765, 1, 1,
0.2993269, 0.7909045, 0.3391653, 0, 0.3333333, 1, 1,
0.3041536, 0.6816897, 0.4933265, 0, 0.3294118, 1, 1,
0.3050702, 0.7686319, -0.2844635, 0, 0.3215686, 1, 1,
0.3053983, 0.1321758, 0.8955079, 0, 0.3176471, 1, 1,
0.3079189, -0.05815189, 1.161092, 0, 0.3098039, 1, 1,
0.3173003, -1.068046, 3.047623, 0, 0.3058824, 1, 1,
0.3199578, 0.5301711, 1.095523, 0, 0.2980392, 1, 1,
0.3204917, -0.2529128, 2.169017, 0, 0.2901961, 1, 1,
0.3221058, -0.5933318, 0.7369675, 0, 0.2862745, 1, 1,
0.3241264, -0.7257332, 1.342079, 0, 0.2784314, 1, 1,
0.3244616, 0.1465463, 1.3622, 0, 0.2745098, 1, 1,
0.3283054, -0.04020105, 0.4175761, 0, 0.2666667, 1, 1,
0.3291148, -0.0005213182, 1.18983, 0, 0.2627451, 1, 1,
0.3299273, 0.7102453, 1.985034, 0, 0.254902, 1, 1,
0.3307987, 0.0821781, 0.9236284, 0, 0.2509804, 1, 1,
0.3323502, -1.873811, 3.601299, 0, 0.2431373, 1, 1,
0.3346606, 1.439018, 1.486234, 0, 0.2392157, 1, 1,
0.334845, -0.2259814, 2.683426, 0, 0.2313726, 1, 1,
0.3363521, -0.4836494, 2.650797, 0, 0.227451, 1, 1,
0.3364364, 0.03244508, 2.859235, 0, 0.2196078, 1, 1,
0.3367413, -0.6260663, 3.128898, 0, 0.2156863, 1, 1,
0.3381908, -0.20158, 2.99846, 0, 0.2078431, 1, 1,
0.3395637, 1.030258, -0.01784524, 0, 0.2039216, 1, 1,
0.3395802, 0.5126081, -0.6388108, 0, 0.1960784, 1, 1,
0.341764, -0.3827577, 3.384026, 0, 0.1882353, 1, 1,
0.3439868, -0.2805199, 1.82583, 0, 0.1843137, 1, 1,
0.3453739, -1.591349, 0.6584853, 0, 0.1764706, 1, 1,
0.3454913, 1.040256, -0.07931799, 0, 0.172549, 1, 1,
0.3539384, -0.5526266, 2.873686, 0, 0.1647059, 1, 1,
0.3632836, 0.3338288, 3.150394, 0, 0.1607843, 1, 1,
0.366564, -0.9941151, 3.259711, 0, 0.1529412, 1, 1,
0.3677821, -0.3836832, 1.093526, 0, 0.1490196, 1, 1,
0.3686278, 2.503097, 0.7753782, 0, 0.1411765, 1, 1,
0.3697478, 0.4459177, 0.9562355, 0, 0.1372549, 1, 1,
0.3769669, -0.07927663, 2.893696, 0, 0.1294118, 1, 1,
0.3796202, 3.246935, -0.8285947, 0, 0.1254902, 1, 1,
0.3848634, -0.8228728, 0.8906915, 0, 0.1176471, 1, 1,
0.3867111, -0.1853194, -0.2672447, 0, 0.1137255, 1, 1,
0.3884644, -0.3411914, 1.121076, 0, 0.1058824, 1, 1,
0.3898172, 0.6736355, -1.014414, 0, 0.09803922, 1, 1,
0.3899808, 0.6146637, -0.3578255, 0, 0.09411765, 1, 1,
0.4022536, 1.300133, -0.3096543, 0, 0.08627451, 1, 1,
0.4029462, 0.2932887, 0.841426, 0, 0.08235294, 1, 1,
0.4041265, -0.9941699, 3.226445, 0, 0.07450981, 1, 1,
0.4046565, 2.526276, 1.099288, 0, 0.07058824, 1, 1,
0.4077561, -0.4482686, 0.2536103, 0, 0.0627451, 1, 1,
0.408258, -0.185097, 1.467357, 0, 0.05882353, 1, 1,
0.4087648, 0.5900536, -0.3266707, 0, 0.05098039, 1, 1,
0.4119247, -1.044937, 3.260107, 0, 0.04705882, 1, 1,
0.4205141, -0.8532178, 3.121734, 0, 0.03921569, 1, 1,
0.4243621, -0.1937751, 1.754179, 0, 0.03529412, 1, 1,
0.4251153, 1.635858, 0.6949202, 0, 0.02745098, 1, 1,
0.42564, 1.494386, 1.301948, 0, 0.02352941, 1, 1,
0.4265135, -0.1773616, 3.805699, 0, 0.01568628, 1, 1,
0.4285701, -1.269525, 1.804774, 0, 0.01176471, 1, 1,
0.4289428, 0.842425, 0.7396324, 0, 0.003921569, 1, 1,
0.4345236, 0.001689493, 1.261662, 0.003921569, 0, 1, 1,
0.4363596, 2.387757, -0.7941887, 0.007843138, 0, 1, 1,
0.4379028, -1.219924, 3.299209, 0.01568628, 0, 1, 1,
0.4387671, 0.5983601, 0.9523411, 0.01960784, 0, 1, 1,
0.4421409, 0.4694287, 1.89388, 0.02745098, 0, 1, 1,
0.4423193, -0.9785815, 2.271999, 0.03137255, 0, 1, 1,
0.444955, 0.4977059, 0.08800866, 0.03921569, 0, 1, 1,
0.4453046, 0.128959, 1.082204, 0.04313726, 0, 1, 1,
0.4461582, 0.6772846, -0.8258259, 0.05098039, 0, 1, 1,
0.4484166, 0.3436028, 1.805031, 0.05490196, 0, 1, 1,
0.4594351, -0.6144227, 2.370706, 0.0627451, 0, 1, 1,
0.4598659, -0.2988519, 2.622973, 0.06666667, 0, 1, 1,
0.4602198, 1.646497, 0.7229117, 0.07450981, 0, 1, 1,
0.4621198, 0.02230722, 0.2325316, 0.07843138, 0, 1, 1,
0.4650175, -0.7459983, 2.380802, 0.08627451, 0, 1, 1,
0.4697404, 0.8437644, -0.5891841, 0.09019608, 0, 1, 1,
0.4728357, 0.2698331, 1.154201, 0.09803922, 0, 1, 1,
0.475808, -1.208707, 2.189081, 0.1058824, 0, 1, 1,
0.4788149, 1.693812, -1.567601, 0.1098039, 0, 1, 1,
0.4790637, -0.2888221, 1.008182, 0.1176471, 0, 1, 1,
0.4798798, -1.304176, 3.200455, 0.1215686, 0, 1, 1,
0.4831858, 0.229851, 2.398681, 0.1294118, 0, 1, 1,
0.4858533, 0.3244977, 2.355828, 0.1333333, 0, 1, 1,
0.4921899, 0.452647, 0.9430178, 0.1411765, 0, 1, 1,
0.5006454, -1.704848, 1.432224, 0.145098, 0, 1, 1,
0.502292, -0.04478421, 2.757748, 0.1529412, 0, 1, 1,
0.5044301, -1.156979, 5.788255, 0.1568628, 0, 1, 1,
0.5084186, -1.155823, 3.596219, 0.1647059, 0, 1, 1,
0.5110092, -2.120355, 2.559694, 0.1686275, 0, 1, 1,
0.5165289, -0.02377033, 1.569194, 0.1764706, 0, 1, 1,
0.5192322, 1.047435, 0.4233627, 0.1803922, 0, 1, 1,
0.5198458, -2.339513, 3.205866, 0.1882353, 0, 1, 1,
0.5236649, -1.066488, 3.194888, 0.1921569, 0, 1, 1,
0.5238947, -0.730795, 1.442655, 0.2, 0, 1, 1,
0.528137, -0.8028883, 2.882676, 0.2078431, 0, 1, 1,
0.5290188, -1.54094, 2.402199, 0.2117647, 0, 1, 1,
0.530204, 0.3597987, 1.840535, 0.2196078, 0, 1, 1,
0.5338623, -0.5196041, 3.634558, 0.2235294, 0, 1, 1,
0.5349593, 1.107155, 1.707948, 0.2313726, 0, 1, 1,
0.5377931, -0.170329, 1.575569, 0.2352941, 0, 1, 1,
0.5389768, 0.4247681, 2.242018, 0.2431373, 0, 1, 1,
0.5428535, 0.7035834, 0.897842, 0.2470588, 0, 1, 1,
0.544878, -0.04258307, 3.4452, 0.254902, 0, 1, 1,
0.5492513, -0.8998278, 1.687828, 0.2588235, 0, 1, 1,
0.5569771, -0.3724272, 1.079465, 0.2666667, 0, 1, 1,
0.5598454, 2.216157, -0.3674381, 0.2705882, 0, 1, 1,
0.5600976, -1.240444, 2.576083, 0.2784314, 0, 1, 1,
0.5603247, 0.08642595, 1.638457, 0.282353, 0, 1, 1,
0.5611761, 0.606135, -0.6938251, 0.2901961, 0, 1, 1,
0.5661272, 0.4724743, 2.31009, 0.2941177, 0, 1, 1,
0.5787743, -0.2909506, -1.010918, 0.3019608, 0, 1, 1,
0.5862721, -0.3094625, 2.363342, 0.3098039, 0, 1, 1,
0.588756, 0.2186674, 1.060919, 0.3137255, 0, 1, 1,
0.5897942, -1.891891, 2.176543, 0.3215686, 0, 1, 1,
0.5913396, -1.401034, 4.29935, 0.3254902, 0, 1, 1,
0.5946402, -1.994143, 2.978936, 0.3333333, 0, 1, 1,
0.5963367, -0.5473675, 2.808069, 0.3372549, 0, 1, 1,
0.5974081, -0.2403856, 0.8258518, 0.345098, 0, 1, 1,
0.5977914, -0.3643742, 3.065479, 0.3490196, 0, 1, 1,
0.6030364, -1.030681, 3.378341, 0.3568628, 0, 1, 1,
0.6045866, -0.5892962, 1.474012, 0.3607843, 0, 1, 1,
0.6080694, 1.355151, -0.3890781, 0.3686275, 0, 1, 1,
0.6185339, -1.798746, 3.109345, 0.372549, 0, 1, 1,
0.6188849, 0.6614115, 0.9029744, 0.3803922, 0, 1, 1,
0.6197398, 1.441899, 0.6590575, 0.3843137, 0, 1, 1,
0.6324152, -0.2769717, 3.472505, 0.3921569, 0, 1, 1,
0.6334676, 1.183184, 0.01140853, 0.3960784, 0, 1, 1,
0.6413588, -0.5971615, 1.785633, 0.4039216, 0, 1, 1,
0.6446645, 1.252286, -0.6976458, 0.4117647, 0, 1, 1,
0.6506803, -0.4495192, 1.543529, 0.4156863, 0, 1, 1,
0.651568, -1.001589, 3.150959, 0.4235294, 0, 1, 1,
0.6549169, 0.5527275, -0.3422526, 0.427451, 0, 1, 1,
0.6555177, 0.1048428, 2.076967, 0.4352941, 0, 1, 1,
0.6603939, 0.1638804, 0.2880991, 0.4392157, 0, 1, 1,
0.6605151, 1.00228, 0.1104085, 0.4470588, 0, 1, 1,
0.6614944, -0.3438429, 2.636989, 0.4509804, 0, 1, 1,
0.6623734, -0.7508518, 3.105054, 0.4588235, 0, 1, 1,
0.6651667, -0.05898461, 0.9376004, 0.4627451, 0, 1, 1,
0.6698671, -2.2652, 3.406412, 0.4705882, 0, 1, 1,
0.6772032, -0.6684613, 1.528297, 0.4745098, 0, 1, 1,
0.6845239, 1.105988, 2.027271, 0.4823529, 0, 1, 1,
0.6848812, -0.1658077, 2.440203, 0.4862745, 0, 1, 1,
0.6866454, 0.5735096, 0.2771398, 0.4941176, 0, 1, 1,
0.6870099, -0.6461915, 3.723133, 0.5019608, 0, 1, 1,
0.6889005, 0.4583745, 1.153146, 0.5058824, 0, 1, 1,
0.6904031, -1.62464, 1.108837, 0.5137255, 0, 1, 1,
0.6923879, -0.8255221, 2.262383, 0.5176471, 0, 1, 1,
0.6936787, -0.2118281, 2.976294, 0.5254902, 0, 1, 1,
0.694043, -2.038964, 2.097302, 0.5294118, 0, 1, 1,
0.7015851, -0.0816557, 2.078066, 0.5372549, 0, 1, 1,
0.7074241, -0.6974167, 2.16889, 0.5411765, 0, 1, 1,
0.7113106, -1.522782, 0.9762994, 0.5490196, 0, 1, 1,
0.7156409, -0.8539108, 2.268746, 0.5529412, 0, 1, 1,
0.7170155, -0.5974431, 2.828138, 0.5607843, 0, 1, 1,
0.7172201, 0.6762331, -0.688178, 0.5647059, 0, 1, 1,
0.7188538, -1.531752, 1.965542, 0.572549, 0, 1, 1,
0.719371, -1.566658, 3.530556, 0.5764706, 0, 1, 1,
0.7240061, -0.1884425, 1.868671, 0.5843138, 0, 1, 1,
0.7258597, -0.7523568, 3.506711, 0.5882353, 0, 1, 1,
0.7315966, -1.613896, 2.353711, 0.5960785, 0, 1, 1,
0.732287, -0.02659082, 3.253657, 0.6039216, 0, 1, 1,
0.7337229, -0.5746683, 3.236762, 0.6078432, 0, 1, 1,
0.7437434, -0.8399805, 1.038446, 0.6156863, 0, 1, 1,
0.7458721, -1.029533, 2.065951, 0.6196079, 0, 1, 1,
0.7468255, -1.178435, 3.352154, 0.627451, 0, 1, 1,
0.7492484, -1.456181, 1.108291, 0.6313726, 0, 1, 1,
0.7605249, -0.7539962, 2.945978, 0.6392157, 0, 1, 1,
0.7651274, -0.3600082, 2.567916, 0.6431373, 0, 1, 1,
0.7724714, -0.5189217, 2.941249, 0.6509804, 0, 1, 1,
0.7764292, 0.6049661, 1.532397, 0.654902, 0, 1, 1,
0.7826906, -1.03935, 2.660795, 0.6627451, 0, 1, 1,
0.7864614, 0.3592801, 1.391919, 0.6666667, 0, 1, 1,
0.7892177, -0.1140514, 3.245054, 0.6745098, 0, 1, 1,
0.7941895, 1.329335, 0.9598202, 0.6784314, 0, 1, 1,
0.7970656, -1.322695, 2.322562, 0.6862745, 0, 1, 1,
0.7972477, 0.3499053, 1.167846, 0.6901961, 0, 1, 1,
0.8034559, -0.2068342, 2.320892, 0.6980392, 0, 1, 1,
0.8049331, -1.104489, 2.803619, 0.7058824, 0, 1, 1,
0.8080166, 1.120111, -1.254686, 0.7098039, 0, 1, 1,
0.8098736, -0.4184851, 2.130545, 0.7176471, 0, 1, 1,
0.8148569, 0.3246307, 0.8142762, 0.7215686, 0, 1, 1,
0.8220988, -1.136276, 1.831608, 0.7294118, 0, 1, 1,
0.8294441, 0.302249, 1.252092, 0.7333333, 0, 1, 1,
0.8304242, 0.5922447, 0.9629763, 0.7411765, 0, 1, 1,
0.8371703, -0.1691629, 1.215705, 0.7450981, 0, 1, 1,
0.8372722, -0.6651186, 0.4034808, 0.7529412, 0, 1, 1,
0.8377658, -0.6381291, 0.2737477, 0.7568628, 0, 1, 1,
0.8401569, -1.519467, 4.750224, 0.7647059, 0, 1, 1,
0.8440725, -0.7540663, 1.715229, 0.7686275, 0, 1, 1,
0.852859, 0.495122, 0.5741575, 0.7764706, 0, 1, 1,
0.8550776, -0.2840118, 2.513246, 0.7803922, 0, 1, 1,
0.8603578, 0.4832489, 1.369276, 0.7882353, 0, 1, 1,
0.8620325, 0.27318, 0.942914, 0.7921569, 0, 1, 1,
0.8622944, 0.8343211, 0.6876498, 0.8, 0, 1, 1,
0.8634704, -0.0846954, 1.247023, 0.8078431, 0, 1, 1,
0.8723853, 1.184047, 1.318334, 0.8117647, 0, 1, 1,
0.8758644, 0.6504904, 1.158717, 0.8196079, 0, 1, 1,
0.8765978, -0.2922109, 1.961271, 0.8235294, 0, 1, 1,
0.877395, -2.697162, 4.161561, 0.8313726, 0, 1, 1,
0.8801063, -0.01432518, -0.1288365, 0.8352941, 0, 1, 1,
0.8808839, -0.2261396, -0.2077934, 0.8431373, 0, 1, 1,
0.884195, 0.227395, -0.06573653, 0.8470588, 0, 1, 1,
0.889812, 0.9866941, 3.296183, 0.854902, 0, 1, 1,
0.8901057, -0.6476719, 4.054891, 0.8588235, 0, 1, 1,
0.8969774, -1.553602, 3.391339, 0.8666667, 0, 1, 1,
0.898275, 2.302824, 1.301049, 0.8705882, 0, 1, 1,
0.9017925, 1.275187, 1.011772, 0.8784314, 0, 1, 1,
0.9094136, 0.5724692, 2.379905, 0.8823529, 0, 1, 1,
0.9110121, 0.8019078, 0.3080638, 0.8901961, 0, 1, 1,
0.9119385, -0.629802, 2.311495, 0.8941177, 0, 1, 1,
0.9149439, 0.2812361, 1.976074, 0.9019608, 0, 1, 1,
0.9198658, -0.6543471, 0.1319753, 0.9098039, 0, 1, 1,
0.9203662, 0.6759385, -0.1336902, 0.9137255, 0, 1, 1,
0.9243406, -0.4065707, 1.931279, 0.9215686, 0, 1, 1,
0.9250301, -0.2959486, 2.208014, 0.9254902, 0, 1, 1,
0.9302411, -1.165194, 3.696105, 0.9333333, 0, 1, 1,
0.9316332, -0.9317748, 1.083361, 0.9372549, 0, 1, 1,
0.9401172, 0.2016483, 1.636347, 0.945098, 0, 1, 1,
0.9404935, 1.100859, 0.4824955, 0.9490196, 0, 1, 1,
0.9441381, -1.414002, 2.844455, 0.9568627, 0, 1, 1,
0.9459919, -0.6183803, 1.133777, 0.9607843, 0, 1, 1,
0.9487906, 0.3595125, 2.695003, 0.9686275, 0, 1, 1,
0.9487954, -0.04867489, 0.6755633, 0.972549, 0, 1, 1,
0.9515621, -0.428905, 2.307796, 0.9803922, 0, 1, 1,
0.9579417, -1.617411, 2.939867, 0.9843137, 0, 1, 1,
0.961915, -0.3258125, 0.9362204, 0.9921569, 0, 1, 1,
0.9627056, 0.505107, 1.47725, 0.9960784, 0, 1, 1,
0.9639766, -0.5561779, 2.151533, 1, 0, 0.9960784, 1,
0.964283, 0.4717282, -0.3320905, 1, 0, 0.9882353, 1,
0.9709938, 0.07237651, 2.61269, 1, 0, 0.9843137, 1,
0.9716375, -1.539744, 2.805033, 1, 0, 0.9764706, 1,
0.9786937, 1.013872, 0.5685183, 1, 0, 0.972549, 1,
0.9830241, 1.349431, 1.611555, 1, 0, 0.9647059, 1,
0.9891037, 1.259393, -0.2208524, 1, 0, 0.9607843, 1,
0.9903814, 0.6105595, 1.23708, 1, 0, 0.9529412, 1,
0.9916469, -0.1201156, 1.228657, 1, 0, 0.9490196, 1,
0.9997742, -0.6600249, 1.115537, 1, 0, 0.9411765, 1,
1.000344, 0.6011728, 2.231835, 1, 0, 0.9372549, 1,
1.006471, 1.094471, 0.9141091, 1, 0, 0.9294118, 1,
1.008203, -0.7931534, 3.532906, 1, 0, 0.9254902, 1,
1.014299, 2.010378, 1.280632, 1, 0, 0.9176471, 1,
1.018098, 0.6282063, 0.9775811, 1, 0, 0.9137255, 1,
1.018263, -0.3649687, 1.501693, 1, 0, 0.9058824, 1,
1.01958, 0.1597864, 0.5300726, 1, 0, 0.9019608, 1,
1.022256, -1.554808, 3.235643, 1, 0, 0.8941177, 1,
1.033233, 1.660195, 1.689321, 1, 0, 0.8862745, 1,
1.034025, -1.448813, 2.66837, 1, 0, 0.8823529, 1,
1.040991, 1.056963, 0.2121836, 1, 0, 0.8745098, 1,
1.041495, 0.4602057, 2.025074, 1, 0, 0.8705882, 1,
1.042896, -0.4169696, 2.969555, 1, 0, 0.8627451, 1,
1.043244, -0.5099158, 3.687513, 1, 0, 0.8588235, 1,
1.044797, 1.327548, -0.3699402, 1, 0, 0.8509804, 1,
1.046964, 1.135396, 1.467839, 1, 0, 0.8470588, 1,
1.047526, -0.05674351, 2.371677, 1, 0, 0.8392157, 1,
1.048856, -0.5633284, 0.4739072, 1, 0, 0.8352941, 1,
1.052346, 0.7498524, 0.8571746, 1, 0, 0.827451, 1,
1.057043, -0.4148222, 1.724723, 1, 0, 0.8235294, 1,
1.067389, 1.175247, 0.9573187, 1, 0, 0.8156863, 1,
1.068263, -0.3552469, 3.049206, 1, 0, 0.8117647, 1,
1.06842, -0.5564911, 2.548635, 1, 0, 0.8039216, 1,
1.073074, 0.1539477, -0.2239742, 1, 0, 0.7960784, 1,
1.080099, -1.041113, 3.320825, 1, 0, 0.7921569, 1,
1.082108, 0.1100493, -0.3961215, 1, 0, 0.7843137, 1,
1.083611, -0.1199254, 0.3263665, 1, 0, 0.7803922, 1,
1.088155, 2.061933, 0.3342999, 1, 0, 0.772549, 1,
1.102979, 0.9841662, 1.971672, 1, 0, 0.7686275, 1,
1.111538, -0.3066204, 0.9056461, 1, 0, 0.7607843, 1,
1.111938, 0.5373903, 2.40435, 1, 0, 0.7568628, 1,
1.11302, -2.160014, 2.564791, 1, 0, 0.7490196, 1,
1.115095, -0.3983332, 1.395938, 1, 0, 0.7450981, 1,
1.12298, 0.3595945, 0.6654262, 1, 0, 0.7372549, 1,
1.125312, -1.806059, 3.706194, 1, 0, 0.7333333, 1,
1.128912, 0.06707054, 3.529328, 1, 0, 0.7254902, 1,
1.132884, -0.4036258, 2.642442, 1, 0, 0.7215686, 1,
1.133963, -0.7673011, 1.611287, 1, 0, 0.7137255, 1,
1.143982, 0.3259859, 2.633109, 1, 0, 0.7098039, 1,
1.150608, 0.8110414, 1.356347, 1, 0, 0.7019608, 1,
1.154572, -1.140431, 3.728835, 1, 0, 0.6941177, 1,
1.155205, -1.624853, 1.079952, 1, 0, 0.6901961, 1,
1.156738, 1.017974, 1.521805, 1, 0, 0.682353, 1,
1.162627, 0.761651, 1.023809, 1, 0, 0.6784314, 1,
1.180324, 0.5751035, 0.07846005, 1, 0, 0.6705883, 1,
1.187686, -1.132959, 1.555191, 1, 0, 0.6666667, 1,
1.190618, 1.09419, 1.460092, 1, 0, 0.6588235, 1,
1.196424, 1.381256, 1.340412, 1, 0, 0.654902, 1,
1.201714, -2.908266, 3.368831, 1, 0, 0.6470588, 1,
1.205449, -0.9521661, 1.757643, 1, 0, 0.6431373, 1,
1.210205, -0.9280555, 2.283542, 1, 0, 0.6352941, 1,
1.214102, 0.7222172, 1.490295, 1, 0, 0.6313726, 1,
1.220447, -0.4836108, 2.710392, 1, 0, 0.6235294, 1,
1.2217, -0.8022326, 1.828781, 1, 0, 0.6196079, 1,
1.229379, -0.2232481, 3.30406, 1, 0, 0.6117647, 1,
1.233564, 0.7549115, 1.241471, 1, 0, 0.6078432, 1,
1.241585, -0.2285807, 2.244083, 1, 0, 0.6, 1,
1.25946, -1.013602, 1.19697, 1, 0, 0.5921569, 1,
1.262668, -0.9400288, 3.09372, 1, 0, 0.5882353, 1,
1.278057, -1.054216, 2.956474, 1, 0, 0.5803922, 1,
1.282901, 0.99658, 1.011333, 1, 0, 0.5764706, 1,
1.283172, -0.5352616, 1.732095, 1, 0, 0.5686275, 1,
1.291701, -1.031849, 0.4109609, 1, 0, 0.5647059, 1,
1.298823, 0.7343786, 1.409501, 1, 0, 0.5568628, 1,
1.301877, -0.1548195, -1.268856, 1, 0, 0.5529412, 1,
1.30254, -0.413905, 0.8094733, 1, 0, 0.5450981, 1,
1.307691, 0.4566442, 3.822484, 1, 0, 0.5411765, 1,
1.312605, 0.7705207, 2.198828, 1, 0, 0.5333334, 1,
1.319804, 0.7865179, 1.313507, 1, 0, 0.5294118, 1,
1.335362, 1.005877, 2.645565, 1, 0, 0.5215687, 1,
1.336484, -0.6045329, 3.606179, 1, 0, 0.5176471, 1,
1.337383, -1.633555, 0.5986865, 1, 0, 0.509804, 1,
1.350299, 0.284137, 1.908551, 1, 0, 0.5058824, 1,
1.35221, -1.658902, 3.045724, 1, 0, 0.4980392, 1,
1.360971, -0.411742, 2.800726, 1, 0, 0.4901961, 1,
1.377648, -0.7801905, 1.931319, 1, 0, 0.4862745, 1,
1.377991, -0.3635723, 2.147182, 1, 0, 0.4784314, 1,
1.381238, 0.7333849, 0.4708975, 1, 0, 0.4745098, 1,
1.392671, 0.03428723, 0.9206841, 1, 0, 0.4666667, 1,
1.396505, 0.8103076, 1.910715, 1, 0, 0.4627451, 1,
1.396772, 0.8761265, 2.823475, 1, 0, 0.454902, 1,
1.399222, -1.171613, 2.397417, 1, 0, 0.4509804, 1,
1.40542, -1.61176, 1.445834, 1, 0, 0.4431373, 1,
1.415812, 0.859987, 2.172823, 1, 0, 0.4392157, 1,
1.421557, 0.3595754, -1.3949, 1, 0, 0.4313726, 1,
1.424023, -1.270848, 5.0316, 1, 0, 0.427451, 1,
1.429417, 0.2332901, 1.363958, 1, 0, 0.4196078, 1,
1.431234, 1.355211, 1.229097, 1, 0, 0.4156863, 1,
1.434363, -1.089586, 2.661295, 1, 0, 0.4078431, 1,
1.436015, 1.244403, 0.64564, 1, 0, 0.4039216, 1,
1.439659, -0.3869292, 1.37109, 1, 0, 0.3960784, 1,
1.445632, -0.5955666, 2.230932, 1, 0, 0.3882353, 1,
1.448276, 0.2175452, 2.214786, 1, 0, 0.3843137, 1,
1.450516, 0.1785035, 2.553013, 1, 0, 0.3764706, 1,
1.463202, 0.7750505, 0.3128597, 1, 0, 0.372549, 1,
1.469525, 1.602018, -0.05463417, 1, 0, 0.3647059, 1,
1.477832, -0.3648286, 2.68597, 1, 0, 0.3607843, 1,
1.48208, -0.7755584, 1.441968, 1, 0, 0.3529412, 1,
1.482843, -0.6175266, 2.934209, 1, 0, 0.3490196, 1,
1.489674, -0.1837024, 0.2159903, 1, 0, 0.3411765, 1,
1.500016, -1.007625, 3.340048, 1, 0, 0.3372549, 1,
1.504221, 1.381043, 1.159478, 1, 0, 0.3294118, 1,
1.506785, -1.04275, 2.003147, 1, 0, 0.3254902, 1,
1.512434, -0.4094731, 2.459248, 1, 0, 0.3176471, 1,
1.548792, -1.256089, 1.664742, 1, 0, 0.3137255, 1,
1.551888, -1.014753, 3.617855, 1, 0, 0.3058824, 1,
1.560394, 0.8161383, 0.7194302, 1, 0, 0.2980392, 1,
1.589788, -0.5462124, 2.361836, 1, 0, 0.2941177, 1,
1.603252, 0.04037743, 1.374395, 1, 0, 0.2862745, 1,
1.612381, 1.122156, 1.385559, 1, 0, 0.282353, 1,
1.621136, -0.3874051, 2.707799, 1, 0, 0.2745098, 1,
1.623316, 0.000741229, 3.306576, 1, 0, 0.2705882, 1,
1.631399, 0.9691669, -0.1959526, 1, 0, 0.2627451, 1,
1.633188, -0.03831034, 2.874203, 1, 0, 0.2588235, 1,
1.649418, -1.29372, 3.123761, 1, 0, 0.2509804, 1,
1.663081, -0.3028559, 1.849463, 1, 0, 0.2470588, 1,
1.67321, 0.2612869, 2.876695, 1, 0, 0.2392157, 1,
1.686295, -0.1253664, 2.661477, 1, 0, 0.2352941, 1,
1.694031, 0.04520252, 1.528739, 1, 0, 0.227451, 1,
1.695029, 0.1141134, 0.6910474, 1, 0, 0.2235294, 1,
1.6951, -0.3321501, 0.3916768, 1, 0, 0.2156863, 1,
1.700171, 0.849589, 1.122743, 1, 0, 0.2117647, 1,
1.704836, -1.170534, 3.751108, 1, 0, 0.2039216, 1,
1.75063, 0.1353383, 1.898143, 1, 0, 0.1960784, 1,
1.758211, 1.588937, 1.479456, 1, 0, 0.1921569, 1,
1.787703, 2.506443, 1.966874, 1, 0, 0.1843137, 1,
1.797668, 0.3229047, 3.018494, 1, 0, 0.1803922, 1,
1.884143, -1.272117, 4.484037, 1, 0, 0.172549, 1,
1.899542, -0.5479986, 1.465223, 1, 0, 0.1686275, 1,
1.908664, -2.184899, 3.950235, 1, 0, 0.1607843, 1,
1.956471, -0.7447284, 2.740546, 1, 0, 0.1568628, 1,
2.005231, -0.1333821, 0.4931973, 1, 0, 0.1490196, 1,
2.018056, -0.5669582, 2.498184, 1, 0, 0.145098, 1,
2.054759, -0.8901838, 1.227122, 1, 0, 0.1372549, 1,
2.066432, 0.1643329, 0.8047646, 1, 0, 0.1333333, 1,
2.068443, -2.358162, 1.17109, 1, 0, 0.1254902, 1,
2.079807, 0.06429464, 3.77418, 1, 0, 0.1215686, 1,
2.11074, -0.8945271, 0.9718347, 1, 0, 0.1137255, 1,
2.126901, 0.2885118, 1.312768, 1, 0, 0.1098039, 1,
2.13948, -0.5548523, -0.2650143, 1, 0, 0.1019608, 1,
2.140707, 0.5351065, 3.486192, 1, 0, 0.09411765, 1,
2.203303, -0.5817778, 1.848306, 1, 0, 0.09019608, 1,
2.205137, 0.8002865, 1.226766, 1, 0, 0.08235294, 1,
2.241215, -0.3987398, 2.397004, 1, 0, 0.07843138, 1,
2.382971, 0.3611775, 3.313232, 1, 0, 0.07058824, 1,
2.440709, 0.610213, 0.9948763, 1, 0, 0.06666667, 1,
2.458558, 0.001214702, 1.478342, 1, 0, 0.05882353, 1,
2.480844, 2.203064, 1.016579, 1, 0, 0.05490196, 1,
2.514378, -0.4809453, 2.125157, 1, 0, 0.04705882, 1,
2.522525, 0.1192579, 0.8645033, 1, 0, 0.04313726, 1,
2.694195, 0.4051481, 1.733626, 1, 0, 0.03529412, 1,
2.696436, -0.09080281, 1.343632, 1, 0, 0.03137255, 1,
2.696678, 0.02174051, 0.2296545, 1, 0, 0.02352941, 1,
2.701104, -0.9098703, 2.079345, 1, 0, 0.01960784, 1,
2.905149, 0.8368015, 0.7604997, 1, 0, 0.01176471, 1,
2.952699, 0.2727084, 1.743067, 1, 0, 0.007843138, 1
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
-0.2006818, -3.951572, -6.855104, 0, -0.5, 0.5, 0.5,
-0.2006818, -3.951572, -6.855104, 1, -0.5, 0.5, 0.5,
-0.2006818, -3.951572, -6.855104, 1, 1.5, 0.5, 0.5,
-0.2006818, -3.951572, -6.855104, 0, 1.5, 0.5, 0.5
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
-4.423059, 0.1693345, -6.855104, 0, -0.5, 0.5, 0.5,
-4.423059, 0.1693345, -6.855104, 1, -0.5, 0.5, 0.5,
-4.423059, 0.1693345, -6.855104, 1, 1.5, 0.5, 0.5,
-4.423059, 0.1693345, -6.855104, 0, 1.5, 0.5, 0.5
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
-4.423059, -3.951572, 0.3827999, 0, -0.5, 0.5, 0.5,
-4.423059, -3.951572, 0.3827999, 1, -0.5, 0.5, 0.5,
-4.423059, -3.951572, 0.3827999, 1, 1.5, 0.5, 0.5,
-4.423059, -3.951572, 0.3827999, 0, 1.5, 0.5, 0.5
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
-3, -3.000594, -5.184819,
2, -3.000594, -5.184819,
-3, -3.000594, -5.184819,
-3, -3.15909, -5.4632,
-2, -3.000594, -5.184819,
-2, -3.15909, -5.4632,
-1, -3.000594, -5.184819,
-1, -3.15909, -5.4632,
0, -3.000594, -5.184819,
0, -3.15909, -5.4632,
1, -3.000594, -5.184819,
1, -3.15909, -5.4632,
2, -3.000594, -5.184819,
2, -3.15909, -5.4632
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
-3, -3.476083, -6.019961, 0, -0.5, 0.5, 0.5,
-3, -3.476083, -6.019961, 1, -0.5, 0.5, 0.5,
-3, -3.476083, -6.019961, 1, 1.5, 0.5, 0.5,
-3, -3.476083, -6.019961, 0, 1.5, 0.5, 0.5,
-2, -3.476083, -6.019961, 0, -0.5, 0.5, 0.5,
-2, -3.476083, -6.019961, 1, -0.5, 0.5, 0.5,
-2, -3.476083, -6.019961, 1, 1.5, 0.5, 0.5,
-2, -3.476083, -6.019961, 0, 1.5, 0.5, 0.5,
-1, -3.476083, -6.019961, 0, -0.5, 0.5, 0.5,
-1, -3.476083, -6.019961, 1, -0.5, 0.5, 0.5,
-1, -3.476083, -6.019961, 1, 1.5, 0.5, 0.5,
-1, -3.476083, -6.019961, 0, 1.5, 0.5, 0.5,
0, -3.476083, -6.019961, 0, -0.5, 0.5, 0.5,
0, -3.476083, -6.019961, 1, -0.5, 0.5, 0.5,
0, -3.476083, -6.019961, 1, 1.5, 0.5, 0.5,
0, -3.476083, -6.019961, 0, 1.5, 0.5, 0.5,
1, -3.476083, -6.019961, 0, -0.5, 0.5, 0.5,
1, -3.476083, -6.019961, 1, -0.5, 0.5, 0.5,
1, -3.476083, -6.019961, 1, 1.5, 0.5, 0.5,
1, -3.476083, -6.019961, 0, 1.5, 0.5, 0.5,
2, -3.476083, -6.019961, 0, -0.5, 0.5, 0.5,
2, -3.476083, -6.019961, 1, -0.5, 0.5, 0.5,
2, -3.476083, -6.019961, 1, 1.5, 0.5, 0.5,
2, -3.476083, -6.019961, 0, 1.5, 0.5, 0.5
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
-3.448664, -2, -5.184819,
-3.448664, 3, -5.184819,
-3.448664, -2, -5.184819,
-3.611063, -2, -5.4632,
-3.448664, -1, -5.184819,
-3.611063, -1, -5.4632,
-3.448664, 0, -5.184819,
-3.611063, 0, -5.4632,
-3.448664, 1, -5.184819,
-3.611063, 1, -5.4632,
-3.448664, 2, -5.184819,
-3.611063, 2, -5.4632,
-3.448664, 3, -5.184819,
-3.611063, 3, -5.4632
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
-3.935861, -2, -6.019961, 0, -0.5, 0.5, 0.5,
-3.935861, -2, -6.019961, 1, -0.5, 0.5, 0.5,
-3.935861, -2, -6.019961, 1, 1.5, 0.5, 0.5,
-3.935861, -2, -6.019961, 0, 1.5, 0.5, 0.5,
-3.935861, -1, -6.019961, 0, -0.5, 0.5, 0.5,
-3.935861, -1, -6.019961, 1, -0.5, 0.5, 0.5,
-3.935861, -1, -6.019961, 1, 1.5, 0.5, 0.5,
-3.935861, -1, -6.019961, 0, 1.5, 0.5, 0.5,
-3.935861, 0, -6.019961, 0, -0.5, 0.5, 0.5,
-3.935861, 0, -6.019961, 1, -0.5, 0.5, 0.5,
-3.935861, 0, -6.019961, 1, 1.5, 0.5, 0.5,
-3.935861, 0, -6.019961, 0, 1.5, 0.5, 0.5,
-3.935861, 1, -6.019961, 0, -0.5, 0.5, 0.5,
-3.935861, 1, -6.019961, 1, -0.5, 0.5, 0.5,
-3.935861, 1, -6.019961, 1, 1.5, 0.5, 0.5,
-3.935861, 1, -6.019961, 0, 1.5, 0.5, 0.5,
-3.935861, 2, -6.019961, 0, -0.5, 0.5, 0.5,
-3.935861, 2, -6.019961, 1, -0.5, 0.5, 0.5,
-3.935861, 2, -6.019961, 1, 1.5, 0.5, 0.5,
-3.935861, 2, -6.019961, 0, 1.5, 0.5, 0.5,
-3.935861, 3, -6.019961, 0, -0.5, 0.5, 0.5,
-3.935861, 3, -6.019961, 1, -0.5, 0.5, 0.5,
-3.935861, 3, -6.019961, 1, 1.5, 0.5, 0.5,
-3.935861, 3, -6.019961, 0, 1.5, 0.5, 0.5
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
-3.448664, -3.000594, -4,
-3.448664, -3.000594, 4,
-3.448664, -3.000594, -4,
-3.611063, -3.15909, -4,
-3.448664, -3.000594, -2,
-3.611063, -3.15909, -2,
-3.448664, -3.000594, 0,
-3.611063, -3.15909, 0,
-3.448664, -3.000594, 2,
-3.611063, -3.15909, 2,
-3.448664, -3.000594, 4,
-3.611063, -3.15909, 4
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
-3.935861, -3.476083, -4, 0, -0.5, 0.5, 0.5,
-3.935861, -3.476083, -4, 1, -0.5, 0.5, 0.5,
-3.935861, -3.476083, -4, 1, 1.5, 0.5, 0.5,
-3.935861, -3.476083, -4, 0, 1.5, 0.5, 0.5,
-3.935861, -3.476083, -2, 0, -0.5, 0.5, 0.5,
-3.935861, -3.476083, -2, 1, -0.5, 0.5, 0.5,
-3.935861, -3.476083, -2, 1, 1.5, 0.5, 0.5,
-3.935861, -3.476083, -2, 0, 1.5, 0.5, 0.5,
-3.935861, -3.476083, 0, 0, -0.5, 0.5, 0.5,
-3.935861, -3.476083, 0, 1, -0.5, 0.5, 0.5,
-3.935861, -3.476083, 0, 1, 1.5, 0.5, 0.5,
-3.935861, -3.476083, 0, 0, 1.5, 0.5, 0.5,
-3.935861, -3.476083, 2, 0, -0.5, 0.5, 0.5,
-3.935861, -3.476083, 2, 1, -0.5, 0.5, 0.5,
-3.935861, -3.476083, 2, 1, 1.5, 0.5, 0.5,
-3.935861, -3.476083, 2, 0, 1.5, 0.5, 0.5,
-3.935861, -3.476083, 4, 0, -0.5, 0.5, 0.5,
-3.935861, -3.476083, 4, 1, -0.5, 0.5, 0.5,
-3.935861, -3.476083, 4, 1, 1.5, 0.5, 0.5,
-3.935861, -3.476083, 4, 0, 1.5, 0.5, 0.5
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
-3.448664, -3.000594, -5.184819,
-3.448664, 3.339263, -5.184819,
-3.448664, -3.000594, 5.950418,
-3.448664, 3.339263, 5.950418,
-3.448664, -3.000594, -5.184819,
-3.448664, -3.000594, 5.950418,
-3.448664, 3.339263, -5.184819,
-3.448664, 3.339263, 5.950418,
-3.448664, -3.000594, -5.184819,
3.0473, -3.000594, -5.184819,
-3.448664, -3.000594, 5.950418,
3.0473, -3.000594, 5.950418,
-3.448664, 3.339263, -5.184819,
3.0473, 3.339263, -5.184819,
-3.448664, 3.339263, 5.950418,
3.0473, 3.339263, 5.950418,
3.0473, -3.000594, -5.184819,
3.0473, 3.339263, -5.184819,
3.0473, -3.000594, 5.950418,
3.0473, 3.339263, 5.950418,
3.0473, -3.000594, -5.184819,
3.0473, -3.000594, 5.950418,
3.0473, 3.339263, -5.184819,
3.0473, 3.339263, 5.950418
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
var radius = 7.671219;
var distance = 34.13012;
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
mvMatrix.translate( 0.2006818, -0.1693345, -0.3827999 );
mvMatrix.scale( 1.276835, 1.308274, 0.7448671 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.13012);
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
Carbofuran<-read.table("Carbofuran.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Carbofuran$V2
```

```
## Error in eval(expr, envir, enclos): object 'Carbofuran' not found
```

```r
y<-Carbofuran$V3
```

```
## Error in eval(expr, envir, enclos): object 'Carbofuran' not found
```

```r
z<-Carbofuran$V4
```

```
## Error in eval(expr, envir, enclos): object 'Carbofuran' not found
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
-3.354063, -0.09424449, -2.243176, 0, 0, 1, 1, 1,
-3.089313, -1.313198, -0.2329126, 1, 0, 0, 1, 1,
-3.04544, 0.9730808, -1.214531, 1, 0, 0, 1, 1,
-2.900398, 1.559227, -0.5727465, 1, 0, 0, 1, 1,
-2.890769, -0.07000044, -2.84569, 1, 0, 0, 1, 1,
-2.521048, -0.09248266, -0.08234525, 1, 0, 0, 1, 1,
-2.508359, -0.9419429, -2.169288, 0, 0, 0, 1, 1,
-2.497256, 0.7563127, -0.9943056, 0, 0, 0, 1, 1,
-2.466058, 0.3193856, -3.584742, 0, 0, 0, 1, 1,
-2.434178, -1.623696, -1.367324, 0, 0, 0, 1, 1,
-2.399995, -1.5421, -3.257932, 0, 0, 0, 1, 1,
-2.381446, 0.5403894, -0.9529372, 0, 0, 0, 1, 1,
-2.375961, 0.9800637, -0.9575127, 0, 0, 0, 1, 1,
-2.340863, 0.1881405, -2.050104, 1, 1, 1, 1, 1,
-2.313963, 1.93365, -0.6074123, 1, 1, 1, 1, 1,
-2.280401, 1.578641, 0.01319349, 1, 1, 1, 1, 1,
-2.265691, -2.8651, -2.667646, 1, 1, 1, 1, 1,
-2.237462, -0.4058535, -2.592301, 1, 1, 1, 1, 1,
-2.230521, -0.03210744, -2.222193, 1, 1, 1, 1, 1,
-2.230097, 0.08280946, -1.617089, 1, 1, 1, 1, 1,
-2.222359, 0.7209885, 0.03056128, 1, 1, 1, 1, 1,
-2.216, -2.361153, -3.97702, 1, 1, 1, 1, 1,
-2.196185, -0.3543314, -1.066178, 1, 1, 1, 1, 1,
-2.171797, 0.1026452, -2.52767, 1, 1, 1, 1, 1,
-2.164856, 0.09773646, -0.4489746, 1, 1, 1, 1, 1,
-2.144167, -0.253311, -2.827194, 1, 1, 1, 1, 1,
-2.137198, -1.122873, -1.510128, 1, 1, 1, 1, 1,
-2.134963, -0.5702561, -1.109664, 1, 1, 1, 1, 1,
-2.106064, 0.1091115, -2.188208, 0, 0, 1, 1, 1,
-2.096172, 0.1695675, -1.545046, 1, 0, 0, 1, 1,
-2.088304, -1.459897, -2.776398, 1, 0, 0, 1, 1,
-2.083567, -1.142612, -1.85516, 1, 0, 0, 1, 1,
-2.08111, 0.5970588, -0.8034483, 1, 0, 0, 1, 1,
-2.044994, -0.3980255, -3.415412, 1, 0, 0, 1, 1,
-2.014418, -0.1601004, -1.495244, 0, 0, 0, 1, 1,
-1.979534, -0.9845325, -2.952528, 0, 0, 0, 1, 1,
-1.884258, 0.1309697, -1.294517, 0, 0, 0, 1, 1,
-1.881596, -0.8632821, -1.581292, 0, 0, 0, 1, 1,
-1.859716, 0.3144292, -2.722408, 0, 0, 0, 1, 1,
-1.858377, -1.511644, -0.186583, 0, 0, 0, 1, 1,
-1.847588, -1.755009, -3.141736, 0, 0, 0, 1, 1,
-1.834401, 2.200738, 0.261757, 1, 1, 1, 1, 1,
-1.824914, -0.08864998, -2.315927, 1, 1, 1, 1, 1,
-1.823143, -0.5548925, -1.213349, 1, 1, 1, 1, 1,
-1.821548, 2.228089, -1.597751, 1, 1, 1, 1, 1,
-1.808107, -0.1421105, -2.478461, 1, 1, 1, 1, 1,
-1.794943, 0.8283364, -0.01006211, 1, 1, 1, 1, 1,
-1.781677, 0.7266282, 0.3953999, 1, 1, 1, 1, 1,
-1.781519, -1.016807, -4.051642, 1, 1, 1, 1, 1,
-1.759884, 1.535388, 0.09511239, 1, 1, 1, 1, 1,
-1.742289, 0.008356943, -1.58762, 1, 1, 1, 1, 1,
-1.690162, 1.702942, 0.06533182, 1, 1, 1, 1, 1,
-1.672389, 0.9773329, -0.5007123, 1, 1, 1, 1, 1,
-1.6427, -0.3377955, -1.638082, 1, 1, 1, 1, 1,
-1.626067, 1.025976, -1.322386, 1, 1, 1, 1, 1,
-1.624097, 0.2989993, -2.692579, 1, 1, 1, 1, 1,
-1.593289, 0.01095941, -1.35008, 0, 0, 1, 1, 1,
-1.578155, -1.460064, -1.439663, 1, 0, 0, 1, 1,
-1.550099, -0.7671545, -2.458244, 1, 0, 0, 1, 1,
-1.544533, -0.8918356, -1.383402, 1, 0, 0, 1, 1,
-1.543114, -0.7235867, -2.816778, 1, 0, 0, 1, 1,
-1.542031, -0.04780427, -2.047746, 1, 0, 0, 1, 1,
-1.540111, 1.088715, -1.195122, 0, 0, 0, 1, 1,
-1.536282, 0.4749485, -3.246325, 0, 0, 0, 1, 1,
-1.535584, -0.2123821, -3.518294, 0, 0, 0, 1, 1,
-1.534074, 1.440203, -1.572256, 0, 0, 0, 1, 1,
-1.524867, -0.6301391, -2.199902, 0, 0, 0, 1, 1,
-1.519973, 0.2088499, -2.429302, 0, 0, 0, 1, 1,
-1.502436, -1.571809, -1.524739, 0, 0, 0, 1, 1,
-1.496573, 1.104036, -1.720732, 1, 1, 1, 1, 1,
-1.491746, -1.18446, -2.64931, 1, 1, 1, 1, 1,
-1.488269, 0.08829958, -2.063428, 1, 1, 1, 1, 1,
-1.485476, -2.051553, -4.10909, 1, 1, 1, 1, 1,
-1.484532, -0.7107912, -0.9469004, 1, 1, 1, 1, 1,
-1.480963, 0.1664994, -1.862929, 1, 1, 1, 1, 1,
-1.468661, 0.7051697, -0.8095292, 1, 1, 1, 1, 1,
-1.466906, 0.9047404, -0.7386003, 1, 1, 1, 1, 1,
-1.459096, -1.264123, -2.897551, 1, 1, 1, 1, 1,
-1.453849, 1.749198, -1.214029, 1, 1, 1, 1, 1,
-1.449878, 0.005156555, 0.4938836, 1, 1, 1, 1, 1,
-1.441183, 0.5965123, -2.249261, 1, 1, 1, 1, 1,
-1.425562, 1.160346, 0.2480972, 1, 1, 1, 1, 1,
-1.423194, 0.6402245, -1.377348, 1, 1, 1, 1, 1,
-1.409652, -0.5233876, -1.241839, 1, 1, 1, 1, 1,
-1.401076, -1.124422, -3.209996, 0, 0, 1, 1, 1,
-1.398227, -0.8272433, -2.045403, 1, 0, 0, 1, 1,
-1.396791, 0.3155245, -1.119749, 1, 0, 0, 1, 1,
-1.396019, -0.03723234, -2.919342, 1, 0, 0, 1, 1,
-1.387128, 0.2091884, -1.588424, 1, 0, 0, 1, 1,
-1.386281, -0.2973893, -1.948137, 1, 0, 0, 1, 1,
-1.379956, -0.2116245, -1.395541, 0, 0, 0, 1, 1,
-1.377092, 1.55105, -1.335426, 0, 0, 0, 1, 1,
-1.361364, -2.700942, -3.387661, 0, 0, 0, 1, 1,
-1.361343, 0.8195506, -0.1595521, 0, 0, 0, 1, 1,
-1.360897, 0.9511107, 0.09692132, 0, 0, 0, 1, 1,
-1.341721, 0.2216796, -0.08927716, 0, 0, 0, 1, 1,
-1.324982, -0.2535095, -2.625135, 0, 0, 0, 1, 1,
-1.319028, -1.611199, -1.761052, 1, 1, 1, 1, 1,
-1.316447, 0.1063231, -1.802264, 1, 1, 1, 1, 1,
-1.310637, 0.5318911, 0.3310327, 1, 1, 1, 1, 1,
-1.298497, 0.05843028, -1.493604, 1, 1, 1, 1, 1,
-1.297395, -1.234127, -3.106743, 1, 1, 1, 1, 1,
-1.256765, -0.2073175, -2.085357, 1, 1, 1, 1, 1,
-1.252997, -1.10033, -2.6214, 1, 1, 1, 1, 1,
-1.24605, 1.135292, -0.9420748, 1, 1, 1, 1, 1,
-1.243107, 1.148816, -2.069479, 1, 1, 1, 1, 1,
-1.223709, 0.04739762, -1.390582, 1, 1, 1, 1, 1,
-1.215876, 0.9694206, 0.9572376, 1, 1, 1, 1, 1,
-1.212933, -2.60744, -2.077057, 1, 1, 1, 1, 1,
-1.212216, 0.9442104, -0.03988228, 1, 1, 1, 1, 1,
-1.212113, 0.5614479, -2.1943, 1, 1, 1, 1, 1,
-1.200098, -0.2092153, -1.211523, 1, 1, 1, 1, 1,
-1.199673, -0.9993209, -2.306934, 0, 0, 1, 1, 1,
-1.197299, -0.6159817, -2.309348, 1, 0, 0, 1, 1,
-1.193853, 0.3084712, -1.378925, 1, 0, 0, 1, 1,
-1.185267, 0.5038129, -0.1388713, 1, 0, 0, 1, 1,
-1.181419, -0.7357519, -2.240939, 1, 0, 0, 1, 1,
-1.170741, 0.1623205, -1.13164, 1, 0, 0, 1, 1,
-1.168997, 1.85536, -1.966004, 0, 0, 0, 1, 1,
-1.168737, -0.03174322, -1.60381, 0, 0, 0, 1, 1,
-1.161031, 0.5934551, -2.761649, 0, 0, 0, 1, 1,
-1.155761, -0.4728187, -2.723765, 0, 0, 0, 1, 1,
-1.152889, -0.5407696, -2.111301, 0, 0, 0, 1, 1,
-1.150932, 0.2578992, -1.885158, 0, 0, 0, 1, 1,
-1.149939, 0.0893282, -1.804988, 0, 0, 0, 1, 1,
-1.145728, 1.094507, -1.510084, 1, 1, 1, 1, 1,
-1.145178, -0.420719, -1.801031, 1, 1, 1, 1, 1,
-1.138073, -1.848954, -2.875576, 1, 1, 1, 1, 1,
-1.118868, -0.327136, -0.9984307, 1, 1, 1, 1, 1,
-1.107297, 0.2092723, -0.5834408, 1, 1, 1, 1, 1,
-1.107275, -1.585843, -2.497779, 1, 1, 1, 1, 1,
-1.099124, -0.9820991, -1.657613, 1, 1, 1, 1, 1,
-1.097916, 2.09407, -0.004467547, 1, 1, 1, 1, 1,
-1.090047, 0.1838756, -3.907404, 1, 1, 1, 1, 1,
-1.056706, -0.8461531, -0.3121966, 1, 1, 1, 1, 1,
-1.048985, 0.2382569, -2.137526, 1, 1, 1, 1, 1,
-1.048504, 0.1711998, -2.717277, 1, 1, 1, 1, 1,
-1.047594, 0.541952, -1.088453, 1, 1, 1, 1, 1,
-1.04706, -1.81979, -1.881283, 1, 1, 1, 1, 1,
-1.030724, 0.7219876, -0.06689074, 1, 1, 1, 1, 1,
-1.029654, 0.07578207, -2.129625, 0, 0, 1, 1, 1,
-1.025353, 0.330536, -2.596154, 1, 0, 0, 1, 1,
-1.021287, 0.4121797, -2.170645, 1, 0, 0, 1, 1,
-1.020988, 0.2422329, -0.9466274, 1, 0, 0, 1, 1,
-1.020886, -0.2210228, -1.485189, 1, 0, 0, 1, 1,
-1.016328, -0.6928921, -4.73519, 1, 0, 0, 1, 1,
-0.9967279, 1.249392, -1.096651, 0, 0, 0, 1, 1,
-0.9948766, 1.890106, -1.653824, 0, 0, 0, 1, 1,
-0.9909943, -0.1692237, -1.410116, 0, 0, 0, 1, 1,
-0.9871899, 0.6758598, -0.5859977, 0, 0, 0, 1, 1,
-0.9817998, 0.6979051, -0.3328237, 0, 0, 0, 1, 1,
-0.9810507, -0.8921973, -2.029447, 0, 0, 0, 1, 1,
-0.9760614, -0.2825116, -3.427398, 0, 0, 0, 1, 1,
-0.975101, -1.246445, -2.033069, 1, 1, 1, 1, 1,
-0.9747782, -0.2666225, -1.834314, 1, 1, 1, 1, 1,
-0.9730449, -1.329025, -3.641515, 1, 1, 1, 1, 1,
-0.9710978, -0.3043702, -2.721765, 1, 1, 1, 1, 1,
-0.968148, 0.4931634, 0.1917125, 1, 1, 1, 1, 1,
-0.9668898, 0.7845966, -2.304527, 1, 1, 1, 1, 1,
-0.9610792, 1.215413, -0.6412866, 1, 1, 1, 1, 1,
-0.9584237, -0.5288263, -1.478199, 1, 1, 1, 1, 1,
-0.951197, -0.8205064, -1.708342, 1, 1, 1, 1, 1,
-0.9409186, 1.002141, -0.9323521, 1, 1, 1, 1, 1,
-0.9372176, -0.7866007, -1.275195, 1, 1, 1, 1, 1,
-0.9333365, 0.1726391, -0.5941555, 1, 1, 1, 1, 1,
-0.9310564, 0.8795513, 0.2283574, 1, 1, 1, 1, 1,
-0.9230413, 1.546306, -1.232577, 1, 1, 1, 1, 1,
-0.919516, 0.2426549, -1.234901, 1, 1, 1, 1, 1,
-0.9162019, -1.241564, -2.942087, 0, 0, 1, 1, 1,
-0.9117451, -0.2006746, -3.240838, 1, 0, 0, 1, 1,
-0.9097788, -1.241448, -1.369195, 1, 0, 0, 1, 1,
-0.9034644, 1.554131, 0.2720456, 1, 0, 0, 1, 1,
-0.8993167, 0.5420768, -0.5869901, 1, 0, 0, 1, 1,
-0.8983086, 1.259969, 1.341039, 1, 0, 0, 1, 1,
-0.8949769, 1.192663, -2.476595, 0, 0, 0, 1, 1,
-0.8893222, 2.067693, 0.1876448, 0, 0, 0, 1, 1,
-0.879809, -0.208193, -0.7864583, 0, 0, 0, 1, 1,
-0.871757, -0.8299679, -2.870396, 0, 0, 0, 1, 1,
-0.8710396, 0.226639, -1.123982, 0, 0, 0, 1, 1,
-0.864092, -0.6333728, -1.082257, 0, 0, 0, 1, 1,
-0.8610787, 0.3697767, -1.875011, 0, 0, 0, 1, 1,
-0.8539432, -0.2600979, -2.624436, 1, 1, 1, 1, 1,
-0.853446, -0.3525138, -1.519529, 1, 1, 1, 1, 1,
-0.8516679, 0.1441939, -1.305399, 1, 1, 1, 1, 1,
-0.8513319, -1.657445, -2.046849, 1, 1, 1, 1, 1,
-0.8492913, 0.5869104, -2.503301, 1, 1, 1, 1, 1,
-0.8452328, -1.386125, -1.506706, 1, 1, 1, 1, 1,
-0.8439388, 0.702599, -1.767674, 1, 1, 1, 1, 1,
-0.8410121, 0.9974698, 0.5237826, 1, 1, 1, 1, 1,
-0.8352203, 0.397366, -1.01073, 1, 1, 1, 1, 1,
-0.8328692, 1.881063, -1.280927, 1, 1, 1, 1, 1,
-0.8308132, -0.6028826, -2.093946, 1, 1, 1, 1, 1,
-0.8303026, -1.445483, -0.8210924, 1, 1, 1, 1, 1,
-0.8250789, -0.5555414, -2.752576, 1, 1, 1, 1, 1,
-0.8232196, -0.7980806, -2.026726, 1, 1, 1, 1, 1,
-0.8204345, -0.2904793, -1.045363, 1, 1, 1, 1, 1,
-0.8158901, -2.46197, -3.634429, 0, 0, 1, 1, 1,
-0.814024, 1.47182, -0.2987355, 1, 0, 0, 1, 1,
-0.8132439, 0.5511878, 0.6584545, 1, 0, 0, 1, 1,
-0.8100976, 0.338551, -1.178017, 1, 0, 0, 1, 1,
-0.8014306, 0.5260991, -1.132114, 1, 0, 0, 1, 1,
-0.7998117, 0.003047582, -0.9606808, 1, 0, 0, 1, 1,
-0.7972802, 0.4383012, -2.139193, 0, 0, 0, 1, 1,
-0.7943724, 0.4571811, -0.9868065, 0, 0, 0, 1, 1,
-0.7942324, 0.4923107, -1.097527, 0, 0, 0, 1, 1,
-0.7870173, 1.16847, -1.083642, 0, 0, 0, 1, 1,
-0.7842048, -1.346249, -1.690233, 0, 0, 0, 1, 1,
-0.7776033, -0.3853837, -2.317703, 0, 0, 0, 1, 1,
-0.7702069, 0.605521, -2.137608, 0, 0, 0, 1, 1,
-0.7700118, 1.32249, -1.579441, 1, 1, 1, 1, 1,
-0.7666209, -0.2827002, -2.539452, 1, 1, 1, 1, 1,
-0.7630867, 0.04237201, -1.523415, 1, 1, 1, 1, 1,
-0.7597979, 0.3841493, -1.793694, 1, 1, 1, 1, 1,
-0.7586902, -1.412848, -2.718378, 1, 1, 1, 1, 1,
-0.7577935, 1.380888, 0.5537779, 1, 1, 1, 1, 1,
-0.75434, 1.085294, -0.6525089, 1, 1, 1, 1, 1,
-0.7538854, -0.7077516, -2.810276, 1, 1, 1, 1, 1,
-0.7521507, 0.1671263, -2.100734, 1, 1, 1, 1, 1,
-0.749432, -0.397808, -2.821012, 1, 1, 1, 1, 1,
-0.7403314, 0.7258332, 0.1263088, 1, 1, 1, 1, 1,
-0.7364241, 0.7037708, -1.272705, 1, 1, 1, 1, 1,
-0.7224261, -0.3490728, -3.894374, 1, 1, 1, 1, 1,
-0.7220582, 1.470898, 0.7887434, 1, 1, 1, 1, 1,
-0.7218802, 0.6535361, -0.9567113, 1, 1, 1, 1, 1,
-0.7172688, -0.9564469, -2.208441, 0, 0, 1, 1, 1,
-0.7146874, -0.5716672, -2.02001, 1, 0, 0, 1, 1,
-0.7110843, 0.2433297, -0.3495131, 1, 0, 0, 1, 1,
-0.7100859, -0.8000441, -2.127979, 1, 0, 0, 1, 1,
-0.7019758, 0.6316632, -1.369137, 1, 0, 0, 1, 1,
-0.692223, 1.140909, 0.5663921, 1, 0, 0, 1, 1,
-0.6884546, -0.1933473, -1.005342, 0, 0, 0, 1, 1,
-0.6869915, 0.9699428, -0.4225647, 0, 0, 0, 1, 1,
-0.6867902, 1.438324, -1.309702, 0, 0, 0, 1, 1,
-0.6864879, -1.545015, -5.022655, 0, 0, 0, 1, 1,
-0.6850984, 1.680813, -0.1995951, 0, 0, 0, 1, 1,
-0.6808581, -0.8464934, -2.51039, 0, 0, 0, 1, 1,
-0.6787894, 0.4699522, -1.178268, 0, 0, 0, 1, 1,
-0.6737617, 0.9402574, -0.5218996, 1, 1, 1, 1, 1,
-0.6686036, -0.3774924, -1.635371, 1, 1, 1, 1, 1,
-0.6596524, -0.1031184, -2.974873, 1, 1, 1, 1, 1,
-0.657895, 0.1715537, -0.1222018, 1, 1, 1, 1, 1,
-0.6469955, 1.335456, -0.6418127, 1, 1, 1, 1, 1,
-0.6466756, 0.121096, -1.657981, 1, 1, 1, 1, 1,
-0.6393662, 0.5937902, -1.410621, 1, 1, 1, 1, 1,
-0.6304814, -1.374732, -2.788806, 1, 1, 1, 1, 1,
-0.6296609, 0.3268064, -1.025304, 1, 1, 1, 1, 1,
-0.6285515, -0.2708857, -2.055124, 1, 1, 1, 1, 1,
-0.6274478, 1.969506, -0.919337, 1, 1, 1, 1, 1,
-0.6253883, 0.1878877, -2.971291, 1, 1, 1, 1, 1,
-0.624966, 0.8095358, -2.576066, 1, 1, 1, 1, 1,
-0.6241226, 1.093458, -1.758911, 1, 1, 1, 1, 1,
-0.6170326, 0.5406955, -0.003195481, 1, 1, 1, 1, 1,
-0.6111889, 0.8600239, -1.833787, 0, 0, 1, 1, 1,
-0.6106946, -1.789357, -1.61939, 1, 0, 0, 1, 1,
-0.6073933, -1.918145, -2.260629, 1, 0, 0, 1, 1,
-0.5978788, -0.1216008, 0.136694, 1, 0, 0, 1, 1,
-0.5964338, -0.5750958, -2.55105, 1, 0, 0, 1, 1,
-0.5958699, -0.4466778, -1.990282, 1, 0, 0, 1, 1,
-0.5939904, 0.7337475, -0.6302982, 0, 0, 0, 1, 1,
-0.5931783, -0.5456086, -1.244462, 0, 0, 0, 1, 1,
-0.5877159, -0.9809172, -2.857719, 0, 0, 0, 1, 1,
-0.5843495, 0.6784555, -0.5642883, 0, 0, 0, 1, 1,
-0.5808277, 0.1889492, -2.345736, 0, 0, 0, 1, 1,
-0.5746905, 0.1324877, -1.576633, 0, 0, 0, 1, 1,
-0.5744184, 1.278104, 0.17357, 0, 0, 0, 1, 1,
-0.5709726, -1.20255, -3.560928, 1, 1, 1, 1, 1,
-0.5661806, -0.1663591, -2.479212, 1, 1, 1, 1, 1,
-0.564498, 0.222442, -0.1722452, 1, 1, 1, 1, 1,
-0.5623602, -1.565192, -3.283124, 1, 1, 1, 1, 1,
-0.562026, -0.5011569, -1.785426, 1, 1, 1, 1, 1,
-0.5598643, -1.057715, -4.118808, 1, 1, 1, 1, 1,
-0.5536855, -0.5037804, -1.748037, 1, 1, 1, 1, 1,
-0.5529267, 1.45552, -0.7637179, 1, 1, 1, 1, 1,
-0.5476134, 1.5434, 0.2591187, 1, 1, 1, 1, 1,
-0.5463548, -1.323845, -2.971456, 1, 1, 1, 1, 1,
-0.5450715, 0.4705229, -1.658167, 1, 1, 1, 1, 1,
-0.5415565, 1.225168, 0.3824013, 1, 1, 1, 1, 1,
-0.539065, -1.563327, -3.376007, 1, 1, 1, 1, 1,
-0.5333099, 1.367865, -0.5198224, 1, 1, 1, 1, 1,
-0.5280873, -0.7893142, -2.156589, 1, 1, 1, 1, 1,
-0.517724, -0.7975172, -2.911973, 0, 0, 1, 1, 1,
-0.5176685, 1.422047, 0.1673544, 1, 0, 0, 1, 1,
-0.5164195, 0.8430721, -2.63582, 1, 0, 0, 1, 1,
-0.5141742, -0.1364446, -2.013266, 1, 0, 0, 1, 1,
-0.5118273, 0.8420896, -1.251436, 1, 0, 0, 1, 1,
-0.5114561, 0.8643641, 0.2327412, 1, 0, 0, 1, 1,
-0.5108567, 0.8126688, -0.177939, 0, 0, 0, 1, 1,
-0.5055673, -1.997229, -4.166052, 0, 0, 0, 1, 1,
-0.5033269, -0.1399668, -3.285367, 0, 0, 0, 1, 1,
-0.4966694, -1.786519, -1.829596, 0, 0, 0, 1, 1,
-0.4951674, -0.692735, -2.274289, 0, 0, 0, 1, 1,
-0.4951603, 1.409039, -1.683235, 0, 0, 0, 1, 1,
-0.4936291, 0.2260803, 1.037288, 0, 0, 0, 1, 1,
-0.4920464, -0.3885333, -3.257111, 1, 1, 1, 1, 1,
-0.4915361, -0.06074742, -2.22635, 1, 1, 1, 1, 1,
-0.4905728, 0.1865389, -1.864863, 1, 1, 1, 1, 1,
-0.4896147, 0.2239945, -1.443235, 1, 1, 1, 1, 1,
-0.4880786, -0.606895, -2.831328, 1, 1, 1, 1, 1,
-0.4827736, 0.3349462, 0.2642537, 1, 1, 1, 1, 1,
-0.4789955, -0.7156922, -3.241515, 1, 1, 1, 1, 1,
-0.4770961, 0.4923639, 0.005294449, 1, 1, 1, 1, 1,
-0.4712687, 1.283671, -1.746416, 1, 1, 1, 1, 1,
-0.4704456, 0.9389248, 1.378071, 1, 1, 1, 1, 1,
-0.4684391, -1.898372, -3.348874, 1, 1, 1, 1, 1,
-0.4682587, -1.031459, -4.312529, 1, 1, 1, 1, 1,
-0.4647979, 1.280363, 1.059921, 1, 1, 1, 1, 1,
-0.4592971, -0.8087101, -3.056371, 1, 1, 1, 1, 1,
-0.4478, 0.03104616, -3.637977, 1, 1, 1, 1, 1,
-0.4461793, 0.5038445, -1.03464, 0, 0, 1, 1, 1,
-0.4439985, 1.083631, 1.603543, 1, 0, 0, 1, 1,
-0.4432909, -0.8067282, -0.5489452, 1, 0, 0, 1, 1,
-0.4416718, 0.8906167, -0.3725324, 1, 0, 0, 1, 1,
-0.4384494, -0.3640253, -0.5569795, 1, 0, 0, 1, 1,
-0.4377826, 0.3677181, 0.08807412, 1, 0, 0, 1, 1,
-0.4356323, 1.159351, -1.441589, 0, 0, 0, 1, 1,
-0.4341985, 1.100229, -0.9142484, 0, 0, 0, 1, 1,
-0.4307002, 0.2645046, -0.2776624, 0, 0, 0, 1, 1,
-0.4297577, -0.8112105, -2.343276, 0, 0, 0, 1, 1,
-0.4253634, -0.3459972, -1.004943, 0, 0, 0, 1, 1,
-0.4236336, -0.08658014, -1.068035, 0, 0, 0, 1, 1,
-0.422056, -0.7588931, -4.995958, 0, 0, 0, 1, 1,
-0.4188611, -1.241352, -3.194986, 1, 1, 1, 1, 1,
-0.4183746, 0.8205888, -1.607469, 1, 1, 1, 1, 1,
-0.4169053, 0.04875644, -1.076461, 1, 1, 1, 1, 1,
-0.4161116, 1.124078, 0.1791535, 1, 1, 1, 1, 1,
-0.4115834, -0.2015004, -2.823552, 1, 1, 1, 1, 1,
-0.4095431, 0.3626435, 0.3842323, 1, 1, 1, 1, 1,
-0.4073755, -0.1753295, -1.875708, 1, 1, 1, 1, 1,
-0.4049471, 1.130549, 0.6526693, 1, 1, 1, 1, 1,
-0.4044313, 0.476708, -0.6610025, 1, 1, 1, 1, 1,
-0.4032268, -0.7460426, -3.037015, 1, 1, 1, 1, 1,
-0.4014456, 1.114297, -0.4023416, 1, 1, 1, 1, 1,
-0.3968471, 0.8002452, -1.005416, 1, 1, 1, 1, 1,
-0.3963979, -0.2777852, -1.901914, 1, 1, 1, 1, 1,
-0.394831, 1.56594, -1.386455, 1, 1, 1, 1, 1,
-0.3932684, 0.04501795, -3.220413, 1, 1, 1, 1, 1,
-0.391528, 0.51811, -1.315566, 0, 0, 1, 1, 1,
-0.3899807, 0.025628, -1.621549, 1, 0, 0, 1, 1,
-0.3862592, -0.5839819, -3.543761, 1, 0, 0, 1, 1,
-0.3801407, 0.407205, -1.005488, 1, 0, 0, 1, 1,
-0.3784665, -0.6117681, -2.521875, 1, 0, 0, 1, 1,
-0.3768664, -0.05528184, -0.4804029, 1, 0, 0, 1, 1,
-0.3719799, -0.9391596, -2.947232, 0, 0, 0, 1, 1,
-0.3685718, -1.621647, -2.499676, 0, 0, 0, 1, 1,
-0.3648821, -0.8601103, -0.3244112, 0, 0, 0, 1, 1,
-0.355905, -1.209514, -3.4308, 0, 0, 0, 1, 1,
-0.3487664, -2.631184, -3.239313, 0, 0, 0, 1, 1,
-0.3476143, -1.819652, -3.078091, 0, 0, 0, 1, 1,
-0.3418296, -0.02197439, -2.44209, 0, 0, 0, 1, 1,
-0.3382086, 0.8258592, -1.705235, 1, 1, 1, 1, 1,
-0.3363961, 0.08161502, -1.443516, 1, 1, 1, 1, 1,
-0.331437, 0.4143458, -0.6159832, 1, 1, 1, 1, 1,
-0.3292508, -1.054312, -1.672841, 1, 1, 1, 1, 1,
-0.3281597, -0.8161232, -3.522771, 1, 1, 1, 1, 1,
-0.3246736, -0.4619491, -2.990249, 1, 1, 1, 1, 1,
-0.3244889, 0.5153462, -1.948665, 1, 1, 1, 1, 1,
-0.3184747, 0.3232221, -1.311586, 1, 1, 1, 1, 1,
-0.3110441, -0.04607875, -1.41245, 1, 1, 1, 1, 1,
-0.3096387, 1.266213, 0.5228845, 1, 1, 1, 1, 1,
-0.3088215, -0.9742229, -1.837477, 1, 1, 1, 1, 1,
-0.306877, 0.03350877, -1.152814, 1, 1, 1, 1, 1,
-0.3013794, 1.361725, -0.5668717, 1, 1, 1, 1, 1,
-0.3007286, -0.225861, -3.151886, 1, 1, 1, 1, 1,
-0.2988204, 0.2468185, -1.845852, 1, 1, 1, 1, 1,
-0.2943013, 0.7413625, 0.4983411, 0, 0, 1, 1, 1,
-0.2921865, 1.359605, 0.2057445, 1, 0, 0, 1, 1,
-0.282883, -1.617178, -3.553372, 1, 0, 0, 1, 1,
-0.2827622, 0.8632521, -0.4390802, 1, 0, 0, 1, 1,
-0.2818784, -1.674874, -1.036066, 1, 0, 0, 1, 1,
-0.2811846, -0.765189, -3.060904, 1, 0, 0, 1, 1,
-0.2795655, -0.472984, -0.3837963, 0, 0, 0, 1, 1,
-0.2774527, 0.0182648, -1.646497, 0, 0, 0, 1, 1,
-0.2768765, 0.1629097, -1.281976, 0, 0, 0, 1, 1,
-0.2746168, 0.1022072, -2.120806, 0, 0, 0, 1, 1,
-0.2740669, 0.5997521, -2.361827, 0, 0, 0, 1, 1,
-0.27149, -0.1710494, -1.35097, 0, 0, 0, 1, 1,
-0.2698317, -0.4054954, -3.26495, 0, 0, 0, 1, 1,
-0.2623495, 1.250108, -0.5303816, 1, 1, 1, 1, 1,
-0.2612993, -0.02642876, -1.709201, 1, 1, 1, 1, 1,
-0.2589641, -0.1248345, -1.380842, 1, 1, 1, 1, 1,
-0.256441, -0.03095497, -1.635168, 1, 1, 1, 1, 1,
-0.2519618, -2.073452, -3.300937, 1, 1, 1, 1, 1,
-0.2491856, 0.7105152, -3.031188, 1, 1, 1, 1, 1,
-0.245448, -1.320383, -3.543585, 1, 1, 1, 1, 1,
-0.2447785, 0.114924, -1.875065, 1, 1, 1, 1, 1,
-0.243709, -0.8609355, -4.350587, 1, 1, 1, 1, 1,
-0.2416223, 0.4149266, -0.6626763, 1, 1, 1, 1, 1,
-0.2386262, -1.246217, -2.253113, 1, 1, 1, 1, 1,
-0.2296284, -0.3159684, -3.15117, 1, 1, 1, 1, 1,
-0.228837, -0.3244101, -2.742362, 1, 1, 1, 1, 1,
-0.2283435, -0.8860993, -3.814463, 1, 1, 1, 1, 1,
-0.2279676, 1.493763, 1.247033, 1, 1, 1, 1, 1,
-0.2241949, 0.4764932, -0.4531191, 0, 0, 1, 1, 1,
-0.2209603, -0.7066881, -2.286029, 1, 0, 0, 1, 1,
-0.2204137, -0.2903592, -2.333869, 1, 0, 0, 1, 1,
-0.2172315, 0.1320081, -1.497265, 1, 0, 0, 1, 1,
-0.2167629, -0.9109582, -2.337043, 1, 0, 0, 1, 1,
-0.2116579, 0.3198421, 0.731914, 1, 0, 0, 1, 1,
-0.2073492, 1.280982, 0.358661, 0, 0, 0, 1, 1,
-0.2062058, -0.4702303, -1.59317, 0, 0, 0, 1, 1,
-0.2061765, -0.1064158, -1.417707, 0, 0, 0, 1, 1,
-0.2052147, 0.288446, -0.7873061, 0, 0, 0, 1, 1,
-0.2048336, 1.799082, 0.5911158, 0, 0, 0, 1, 1,
-0.2047636, 1.104845, -0.8209921, 0, 0, 0, 1, 1,
-0.2042437, 0.9518811, -0.6717032, 0, 0, 0, 1, 1,
-0.200161, 1.599338, -0.4959821, 1, 1, 1, 1, 1,
-0.1989847, -1.344496, -1.653883, 1, 1, 1, 1, 1,
-0.196179, -1.488329, -3.466008, 1, 1, 1, 1, 1,
-0.1944997, -0.1077871, -1.499465, 1, 1, 1, 1, 1,
-0.1885519, -1.09361, -3.981201, 1, 1, 1, 1, 1,
-0.1877155, 0.5779266, 1.331129, 1, 1, 1, 1, 1,
-0.1870875, 2.666105, -0.3246536, 1, 1, 1, 1, 1,
-0.184198, -0.9616407, -2.914699, 1, 1, 1, 1, 1,
-0.1837289, -0.2402921, -3.998735, 1, 1, 1, 1, 1,
-0.183622, -1.566519, -2.494799, 1, 1, 1, 1, 1,
-0.1809725, -1.79703, -3.998908, 1, 1, 1, 1, 1,
-0.1803367, -2.044687, -2.679757, 1, 1, 1, 1, 1,
-0.1793102, -0.8269442, -2.925904, 1, 1, 1, 1, 1,
-0.1767765, 0.2223291, -0.6103196, 1, 1, 1, 1, 1,
-0.176474, -0.7653359, -1.933498, 1, 1, 1, 1, 1,
-0.1753781, -0.1996351, -0.3455954, 0, 0, 1, 1, 1,
-0.1724446, -0.3038771, -2.359769, 1, 0, 0, 1, 1,
-0.1723639, 0.6354238, -2.220832, 1, 0, 0, 1, 1,
-0.1721901, -0.7241217, -4.462574, 1, 0, 0, 1, 1,
-0.1670084, 0.9214178, -2.013677, 1, 0, 0, 1, 1,
-0.1652236, -0.6016743, -3.026337, 1, 0, 0, 1, 1,
-0.1610287, -0.3088886, -2.400409, 0, 0, 0, 1, 1,
-0.1587391, -0.1696781, -1.892987, 0, 0, 0, 1, 1,
-0.1580898, 0.8248545, -0.5369589, 0, 0, 0, 1, 1,
-0.1540872, -0.06810503, -1.652305, 0, 0, 0, 1, 1,
-0.1535057, -0.9026946, -3.198639, 0, 0, 0, 1, 1,
-0.1508821, -0.6261948, -3.512972, 0, 0, 0, 1, 1,
-0.1501765, -0.1137723, -2.691812, 0, 0, 0, 1, 1,
-0.1501193, -0.9267238, -0.7543405, 1, 1, 1, 1, 1,
-0.1452002, 0.7703301, -1.18601, 1, 1, 1, 1, 1,
-0.143278, -1.351872, -4.375612, 1, 1, 1, 1, 1,
-0.1403704, -0.2899267, -4.193244, 1, 1, 1, 1, 1,
-0.1367587, -1.122612, -3.570534, 1, 1, 1, 1, 1,
-0.1337811, -1.564457, -2.739961, 1, 1, 1, 1, 1,
-0.1325475, 0.8214297, -1.231657, 1, 1, 1, 1, 1,
-0.1317862, -2.171307, -4.086318, 1, 1, 1, 1, 1,
-0.1311509, 0.8516839, 0.9715188, 1, 1, 1, 1, 1,
-0.1309798, -0.4406138, -1.972663, 1, 1, 1, 1, 1,
-0.1293134, 1.18664, 1.129992, 1, 1, 1, 1, 1,
-0.1266517, 1.548676, 1.100647, 1, 1, 1, 1, 1,
-0.1259641, -0.7148038, -2.474966, 1, 1, 1, 1, 1,
-0.1249022, -0.7826906, -4.235643, 1, 1, 1, 1, 1,
-0.124691, -0.5040641, -1.958945, 1, 1, 1, 1, 1,
-0.1216049, -0.1377589, -2.13979, 0, 0, 1, 1, 1,
-0.1184052, -0.4140815, -3.593875, 1, 0, 0, 1, 1,
-0.1158114, 1.415847, 0.4757541, 1, 0, 0, 1, 1,
-0.1136399, -0.9280559, -3.274044, 1, 0, 0, 1, 1,
-0.1085691, 0.8710973, 0.1219068, 1, 0, 0, 1, 1,
-0.1062825, 1.123635, 0.3815563, 1, 0, 0, 1, 1,
-0.1053397, 0.2654386, -0.5052488, 0, 0, 0, 1, 1,
-0.1044845, -0.1792128, -3.854161, 0, 0, 0, 1, 1,
-0.1023382, 0.6355002, -0.4395228, 0, 0, 0, 1, 1,
-0.1019025, -0.1299395, -2.004245, 0, 0, 0, 1, 1,
-0.09918863, 1.497385, -2.335296, 0, 0, 0, 1, 1,
-0.09857944, -0.544113, -3.474239, 0, 0, 0, 1, 1,
-0.08926069, 2.10716, 0.5055618, 0, 0, 0, 1, 1,
-0.08404194, -1.632432, -3.621363, 1, 1, 1, 1, 1,
-0.07516211, 0.2232684, -0.2892245, 1, 1, 1, 1, 1,
-0.07167356, 0.9680939, -2.419038, 1, 1, 1, 1, 1,
-0.07097463, -0.9622058, -1.920845, 1, 1, 1, 1, 1,
-0.07040143, 0.1146383, -3.038206, 1, 1, 1, 1, 1,
-0.0643168, 0.5611837, 0.5524755, 1, 1, 1, 1, 1,
-0.05968757, 0.120108, -1.110844, 1, 1, 1, 1, 1,
-0.05868286, 0.9367756, 1.204243, 1, 1, 1, 1, 1,
-0.05541988, -1.021194, -2.259924, 1, 1, 1, 1, 1,
-0.05450523, -0.7002986, -4.30787, 1, 1, 1, 1, 1,
-0.04941536, -0.004565475, -2.020139, 1, 1, 1, 1, 1,
-0.04925298, -2.214426, -2.617576, 1, 1, 1, 1, 1,
-0.04707065, 0.1983289, -0.05406316, 1, 1, 1, 1, 1,
-0.04105533, 1.753658, 0.9107803, 1, 1, 1, 1, 1,
-0.03758988, -2.096037, -3.714597, 1, 1, 1, 1, 1,
-0.03758333, -1.070327, -3.509938, 0, 0, 1, 1, 1,
-0.03705118, 0.1166659, -1.38591, 1, 0, 0, 1, 1,
-0.03530254, 0.5725804, -0.4703156, 1, 0, 0, 1, 1,
-0.0350068, -0.8339676, -1.784846, 1, 0, 0, 1, 1,
-0.03223699, 0.3327425, -0.4619209, 1, 0, 0, 1, 1,
-0.03197989, 0.4800818, 1.500902, 1, 0, 0, 1, 1,
-0.03082039, 1.178335, -0.241563, 0, 0, 0, 1, 1,
-0.02636889, -0.4219078, -2.937132, 0, 0, 0, 1, 1,
-0.02458069, 0.2408435, -0.4310668, 0, 0, 0, 1, 1,
-0.02116983, -0.07576545, -2.377404, 0, 0, 0, 1, 1,
-0.02008593, 0.1964891, -0.1340299, 0, 0, 0, 1, 1,
-0.01942144, 0.2689808, 0.5011107, 0, 0, 0, 1, 1,
-0.008887259, -0.2059662, -4.194525, 0, 0, 0, 1, 1,
-0.008658072, 1.314284, 0.6542655, 1, 1, 1, 1, 1,
-0.008017388, -1.391829, -3.907455, 1, 1, 1, 1, 1,
-0.007650802, -0.1838646, -1.860629, 1, 1, 1, 1, 1,
-0.006746561, 0.241555, 0.1537845, 1, 1, 1, 1, 1,
-0.004146443, -0.05113294, -2.928001, 1, 1, 1, 1, 1,
-0.003198497, 0.709251, -0.5395068, 1, 1, 1, 1, 1,
-0.001953096, -1.69939, -4.163251, 1, 1, 1, 1, 1,
-0.0008399575, -0.4068125, -3.227496, 1, 1, 1, 1, 1,
0.004708691, 2.21386, 0.5040114, 1, 1, 1, 1, 1,
0.006140348, -1.108792, 2.989046, 1, 1, 1, 1, 1,
0.008602706, 0.8057713, 0.8044721, 1, 1, 1, 1, 1,
0.008641755, 0.8884973, 0.04424753, 1, 1, 1, 1, 1,
0.009699179, -0.08110715, 3.852662, 1, 1, 1, 1, 1,
0.01525581, -0.4084545, 2.210843, 1, 1, 1, 1, 1,
0.01765278, -0.356149, 2.147219, 1, 1, 1, 1, 1,
0.01897861, 0.4317009, 0.7292164, 0, 0, 1, 1, 1,
0.02047318, 1.526899, -0.2722261, 1, 0, 0, 1, 1,
0.02715334, 1.315649, -1.09576, 1, 0, 0, 1, 1,
0.02838315, 0.4504753, -1.844334, 1, 0, 0, 1, 1,
0.0289122, 0.1430548, -1.613823, 1, 0, 0, 1, 1,
0.0327822, -0.2116717, 2.050724, 1, 0, 0, 1, 1,
0.03517589, -0.7479567, 2.571588, 0, 0, 0, 1, 1,
0.03727588, 0.2348004, 0.04004061, 0, 0, 0, 1, 1,
0.04118985, -1.005002, 2.448657, 0, 0, 0, 1, 1,
0.04455641, 1.262093, -0.7239763, 0, 0, 0, 1, 1,
0.04795358, 0.275207, -1.171137, 0, 0, 0, 1, 1,
0.05143423, 0.5612581, 0.2137808, 0, 0, 0, 1, 1,
0.05203412, 1.519709, -1.354963, 0, 0, 0, 1, 1,
0.05356928, -0.4557387, 2.148171, 1, 1, 1, 1, 1,
0.05570209, 0.9057064, 1.316955, 1, 1, 1, 1, 1,
0.05847569, 0.3247422, 0.06206171, 1, 1, 1, 1, 1,
0.05908139, -0.6358983, 0.983641, 1, 1, 1, 1, 1,
0.0603369, 0.5301751, 0.8902917, 1, 1, 1, 1, 1,
0.06290302, -1.621126, 4.437047, 1, 1, 1, 1, 1,
0.06495003, 0.6221281, -0.2184239, 1, 1, 1, 1, 1,
0.0654211, -0.5320387, 3.958001, 1, 1, 1, 1, 1,
0.06640329, 0.9097916, -0.7141704, 1, 1, 1, 1, 1,
0.0678213, -0.1034028, 2.49191, 1, 1, 1, 1, 1,
0.06995681, 0.4137487, 0.845709, 1, 1, 1, 1, 1,
0.07340095, -0.01583097, 1.969326, 1, 1, 1, 1, 1,
0.07528581, -0.335425, 1.838026, 1, 1, 1, 1, 1,
0.07544965, 1.044366, -0.2796177, 1, 1, 1, 1, 1,
0.07809759, 0.5342871, 0.848902, 1, 1, 1, 1, 1,
0.0873739, 0.07186507, 0.4069646, 0, 0, 1, 1, 1,
0.09789991, 0.855055, -1.059426, 1, 0, 0, 1, 1,
0.1004736, -0.5210285, 3.316658, 1, 0, 0, 1, 1,
0.1008418, 0.7848732, 1.320971, 1, 0, 0, 1, 1,
0.1045082, -0.4425261, 3.197077, 1, 0, 0, 1, 1,
0.1049712, 0.7212742, 0.06816934, 1, 0, 0, 1, 1,
0.1086098, 1.151724, 1.092779, 0, 0, 0, 1, 1,
0.1155549, -0.177877, 3.123717, 0, 0, 0, 1, 1,
0.1156259, 0.8980934, 1.590765, 0, 0, 0, 1, 1,
0.1198677, -0.6748005, 2.831903, 0, 0, 0, 1, 1,
0.1208386, -1.371678, 4.111246, 0, 0, 0, 1, 1,
0.1226706, -0.2569729, 2.113255, 0, 0, 0, 1, 1,
0.1235839, 1.017853, 0.2698694, 0, 0, 0, 1, 1,
0.1239003, -0.7335452, 1.689126, 1, 1, 1, 1, 1,
0.1248616, -1.624183, 2.712526, 1, 1, 1, 1, 1,
0.1262926, 0.8968014, 1.632641, 1, 1, 1, 1, 1,
0.1280597, -1.498657, 3.606794, 1, 1, 1, 1, 1,
0.1318581, -0.07357635, 0.9141692, 1, 1, 1, 1, 1,
0.1348238, 1.066384, -0.05253964, 1, 1, 1, 1, 1,
0.1364101, -1.55887, 2.372759, 1, 1, 1, 1, 1,
0.1382729, -1.206122, 1.450904, 1, 1, 1, 1, 1,
0.1401316, 0.1991542, -0.1813509, 1, 1, 1, 1, 1,
0.1486305, 0.3228004, -1.237485, 1, 1, 1, 1, 1,
0.151319, -0.3756968, 1.3857, 1, 1, 1, 1, 1,
0.1530206, -1.206516, 4.595555, 1, 1, 1, 1, 1,
0.1570295, 0.5767243, 1.044999, 1, 1, 1, 1, 1,
0.157201, 0.1144094, 0.9516889, 1, 1, 1, 1, 1,
0.1597071, 1.143142, 0.5901475, 1, 1, 1, 1, 1,
0.1598167, -0.1252546, 2.019177, 0, 0, 1, 1, 1,
0.1622544, -0.1754202, 2.103052, 1, 0, 0, 1, 1,
0.1633088, 0.1923495, 0.7646018, 1, 0, 0, 1, 1,
0.1679933, 1.348797, 0.5010527, 1, 0, 0, 1, 1,
0.1687247, 0.3582033, 1.378603, 1, 0, 0, 1, 1,
0.1689618, 0.8364099, -0.2294187, 1, 0, 0, 1, 1,
0.1791442, -1.102383, 2.293774, 0, 0, 0, 1, 1,
0.187367, -0.5295522, 1.552382, 0, 0, 0, 1, 1,
0.1880196, -0.9751395, 2.728198, 0, 0, 0, 1, 1,
0.1979143, 0.284825, 0.5259475, 0, 0, 0, 1, 1,
0.2002406, 1.109202, 0.8320488, 0, 0, 0, 1, 1,
0.2046654, 0.1143583, 2.536912, 0, 0, 0, 1, 1,
0.2066968, 0.3697606, -1.353135, 0, 0, 0, 1, 1,
0.2068307, 1.025751, -0.03679621, 1, 1, 1, 1, 1,
0.2073534, -1.694439, 2.317683, 1, 1, 1, 1, 1,
0.2088185, 1.398964, 0.7421125, 1, 1, 1, 1, 1,
0.2145532, 2.115177, 0.4103631, 1, 1, 1, 1, 1,
0.2146089, -0.06985679, 1.301428, 1, 1, 1, 1, 1,
0.2174382, -0.7329645, 1.532249, 1, 1, 1, 1, 1,
0.2228489, 1.198483, 1.673635, 1, 1, 1, 1, 1,
0.2279619, -0.7591068, 1.602495, 1, 1, 1, 1, 1,
0.2293128, -0.7935601, 3.091268, 1, 1, 1, 1, 1,
0.2385162, -1.337245, 3.067014, 1, 1, 1, 1, 1,
0.2388097, -0.4264879, 2.936782, 1, 1, 1, 1, 1,
0.238866, -0.008079558, -0.8145292, 1, 1, 1, 1, 1,
0.2543643, -0.5596988, 2.003395, 1, 1, 1, 1, 1,
0.2553249, 0.7654426, 0.3127479, 1, 1, 1, 1, 1,
0.2574232, -0.6319731, 2.524894, 1, 1, 1, 1, 1,
0.2581858, 2.096229, -0.716667, 0, 0, 1, 1, 1,
0.262439, -0.2165148, 1.82706, 1, 0, 0, 1, 1,
0.2657384, 0.1342659, 0.6359374, 1, 0, 0, 1, 1,
0.2668899, -0.4079902, 2.626617, 1, 0, 0, 1, 1,
0.2699514, -0.6685732, -0.09700926, 1, 0, 0, 1, 1,
0.2737172, 0.520922, 0.7891176, 1, 0, 0, 1, 1,
0.2747675, 0.2835885, 0.6299582, 0, 0, 0, 1, 1,
0.2750465, 1.030752, 0.9755942, 0, 0, 0, 1, 1,
0.275477, -1.541509, 0.5401121, 0, 0, 0, 1, 1,
0.2786698, -0.4280543, 3.426093, 0, 0, 0, 1, 1,
0.2787483, -0.09349602, 1.260925, 0, 0, 0, 1, 1,
0.2798195, 1.023283, 0.7323413, 0, 0, 0, 1, 1,
0.2830667, -1.599708, 3.07723, 0, 0, 0, 1, 1,
0.2842077, -0.8740392, 3.069001, 1, 1, 1, 1, 1,
0.2876384, 2.034168, 0.328554, 1, 1, 1, 1, 1,
0.2877724, -0.870524, 3.242978, 1, 1, 1, 1, 1,
0.2891647, 0.5114397, -0.4517741, 1, 1, 1, 1, 1,
0.2896332, -1.156147, 2.400855, 1, 1, 1, 1, 1,
0.2925614, 1.667128, 0.3081468, 1, 1, 1, 1, 1,
0.2953514, 0.263702, 0.8046287, 1, 1, 1, 1, 1,
0.2957204, 1.656123, -0.9421797, 1, 1, 1, 1, 1,
0.2957635, 0.6138886, -0.365572, 1, 1, 1, 1, 1,
0.2987395, 0.02177319, 1.414039, 1, 1, 1, 1, 1,
0.2993269, 0.7909045, 0.3391653, 1, 1, 1, 1, 1,
0.3041536, 0.6816897, 0.4933265, 1, 1, 1, 1, 1,
0.3050702, 0.7686319, -0.2844635, 1, 1, 1, 1, 1,
0.3053983, 0.1321758, 0.8955079, 1, 1, 1, 1, 1,
0.3079189, -0.05815189, 1.161092, 1, 1, 1, 1, 1,
0.3173003, -1.068046, 3.047623, 0, 0, 1, 1, 1,
0.3199578, 0.5301711, 1.095523, 1, 0, 0, 1, 1,
0.3204917, -0.2529128, 2.169017, 1, 0, 0, 1, 1,
0.3221058, -0.5933318, 0.7369675, 1, 0, 0, 1, 1,
0.3241264, -0.7257332, 1.342079, 1, 0, 0, 1, 1,
0.3244616, 0.1465463, 1.3622, 1, 0, 0, 1, 1,
0.3283054, -0.04020105, 0.4175761, 0, 0, 0, 1, 1,
0.3291148, -0.0005213182, 1.18983, 0, 0, 0, 1, 1,
0.3299273, 0.7102453, 1.985034, 0, 0, 0, 1, 1,
0.3307987, 0.0821781, 0.9236284, 0, 0, 0, 1, 1,
0.3323502, -1.873811, 3.601299, 0, 0, 0, 1, 1,
0.3346606, 1.439018, 1.486234, 0, 0, 0, 1, 1,
0.334845, -0.2259814, 2.683426, 0, 0, 0, 1, 1,
0.3363521, -0.4836494, 2.650797, 1, 1, 1, 1, 1,
0.3364364, 0.03244508, 2.859235, 1, 1, 1, 1, 1,
0.3367413, -0.6260663, 3.128898, 1, 1, 1, 1, 1,
0.3381908, -0.20158, 2.99846, 1, 1, 1, 1, 1,
0.3395637, 1.030258, -0.01784524, 1, 1, 1, 1, 1,
0.3395802, 0.5126081, -0.6388108, 1, 1, 1, 1, 1,
0.341764, -0.3827577, 3.384026, 1, 1, 1, 1, 1,
0.3439868, -0.2805199, 1.82583, 1, 1, 1, 1, 1,
0.3453739, -1.591349, 0.6584853, 1, 1, 1, 1, 1,
0.3454913, 1.040256, -0.07931799, 1, 1, 1, 1, 1,
0.3539384, -0.5526266, 2.873686, 1, 1, 1, 1, 1,
0.3632836, 0.3338288, 3.150394, 1, 1, 1, 1, 1,
0.366564, -0.9941151, 3.259711, 1, 1, 1, 1, 1,
0.3677821, -0.3836832, 1.093526, 1, 1, 1, 1, 1,
0.3686278, 2.503097, 0.7753782, 1, 1, 1, 1, 1,
0.3697478, 0.4459177, 0.9562355, 0, 0, 1, 1, 1,
0.3769669, -0.07927663, 2.893696, 1, 0, 0, 1, 1,
0.3796202, 3.246935, -0.8285947, 1, 0, 0, 1, 1,
0.3848634, -0.8228728, 0.8906915, 1, 0, 0, 1, 1,
0.3867111, -0.1853194, -0.2672447, 1, 0, 0, 1, 1,
0.3884644, -0.3411914, 1.121076, 1, 0, 0, 1, 1,
0.3898172, 0.6736355, -1.014414, 0, 0, 0, 1, 1,
0.3899808, 0.6146637, -0.3578255, 0, 0, 0, 1, 1,
0.4022536, 1.300133, -0.3096543, 0, 0, 0, 1, 1,
0.4029462, 0.2932887, 0.841426, 0, 0, 0, 1, 1,
0.4041265, -0.9941699, 3.226445, 0, 0, 0, 1, 1,
0.4046565, 2.526276, 1.099288, 0, 0, 0, 1, 1,
0.4077561, -0.4482686, 0.2536103, 0, 0, 0, 1, 1,
0.408258, -0.185097, 1.467357, 1, 1, 1, 1, 1,
0.4087648, 0.5900536, -0.3266707, 1, 1, 1, 1, 1,
0.4119247, -1.044937, 3.260107, 1, 1, 1, 1, 1,
0.4205141, -0.8532178, 3.121734, 1, 1, 1, 1, 1,
0.4243621, -0.1937751, 1.754179, 1, 1, 1, 1, 1,
0.4251153, 1.635858, 0.6949202, 1, 1, 1, 1, 1,
0.42564, 1.494386, 1.301948, 1, 1, 1, 1, 1,
0.4265135, -0.1773616, 3.805699, 1, 1, 1, 1, 1,
0.4285701, -1.269525, 1.804774, 1, 1, 1, 1, 1,
0.4289428, 0.842425, 0.7396324, 1, 1, 1, 1, 1,
0.4345236, 0.001689493, 1.261662, 1, 1, 1, 1, 1,
0.4363596, 2.387757, -0.7941887, 1, 1, 1, 1, 1,
0.4379028, -1.219924, 3.299209, 1, 1, 1, 1, 1,
0.4387671, 0.5983601, 0.9523411, 1, 1, 1, 1, 1,
0.4421409, 0.4694287, 1.89388, 1, 1, 1, 1, 1,
0.4423193, -0.9785815, 2.271999, 0, 0, 1, 1, 1,
0.444955, 0.4977059, 0.08800866, 1, 0, 0, 1, 1,
0.4453046, 0.128959, 1.082204, 1, 0, 0, 1, 1,
0.4461582, 0.6772846, -0.8258259, 1, 0, 0, 1, 1,
0.4484166, 0.3436028, 1.805031, 1, 0, 0, 1, 1,
0.4594351, -0.6144227, 2.370706, 1, 0, 0, 1, 1,
0.4598659, -0.2988519, 2.622973, 0, 0, 0, 1, 1,
0.4602198, 1.646497, 0.7229117, 0, 0, 0, 1, 1,
0.4621198, 0.02230722, 0.2325316, 0, 0, 0, 1, 1,
0.4650175, -0.7459983, 2.380802, 0, 0, 0, 1, 1,
0.4697404, 0.8437644, -0.5891841, 0, 0, 0, 1, 1,
0.4728357, 0.2698331, 1.154201, 0, 0, 0, 1, 1,
0.475808, -1.208707, 2.189081, 0, 0, 0, 1, 1,
0.4788149, 1.693812, -1.567601, 1, 1, 1, 1, 1,
0.4790637, -0.2888221, 1.008182, 1, 1, 1, 1, 1,
0.4798798, -1.304176, 3.200455, 1, 1, 1, 1, 1,
0.4831858, 0.229851, 2.398681, 1, 1, 1, 1, 1,
0.4858533, 0.3244977, 2.355828, 1, 1, 1, 1, 1,
0.4921899, 0.452647, 0.9430178, 1, 1, 1, 1, 1,
0.5006454, -1.704848, 1.432224, 1, 1, 1, 1, 1,
0.502292, -0.04478421, 2.757748, 1, 1, 1, 1, 1,
0.5044301, -1.156979, 5.788255, 1, 1, 1, 1, 1,
0.5084186, -1.155823, 3.596219, 1, 1, 1, 1, 1,
0.5110092, -2.120355, 2.559694, 1, 1, 1, 1, 1,
0.5165289, -0.02377033, 1.569194, 1, 1, 1, 1, 1,
0.5192322, 1.047435, 0.4233627, 1, 1, 1, 1, 1,
0.5198458, -2.339513, 3.205866, 1, 1, 1, 1, 1,
0.5236649, -1.066488, 3.194888, 1, 1, 1, 1, 1,
0.5238947, -0.730795, 1.442655, 0, 0, 1, 1, 1,
0.528137, -0.8028883, 2.882676, 1, 0, 0, 1, 1,
0.5290188, -1.54094, 2.402199, 1, 0, 0, 1, 1,
0.530204, 0.3597987, 1.840535, 1, 0, 0, 1, 1,
0.5338623, -0.5196041, 3.634558, 1, 0, 0, 1, 1,
0.5349593, 1.107155, 1.707948, 1, 0, 0, 1, 1,
0.5377931, -0.170329, 1.575569, 0, 0, 0, 1, 1,
0.5389768, 0.4247681, 2.242018, 0, 0, 0, 1, 1,
0.5428535, 0.7035834, 0.897842, 0, 0, 0, 1, 1,
0.544878, -0.04258307, 3.4452, 0, 0, 0, 1, 1,
0.5492513, -0.8998278, 1.687828, 0, 0, 0, 1, 1,
0.5569771, -0.3724272, 1.079465, 0, 0, 0, 1, 1,
0.5598454, 2.216157, -0.3674381, 0, 0, 0, 1, 1,
0.5600976, -1.240444, 2.576083, 1, 1, 1, 1, 1,
0.5603247, 0.08642595, 1.638457, 1, 1, 1, 1, 1,
0.5611761, 0.606135, -0.6938251, 1, 1, 1, 1, 1,
0.5661272, 0.4724743, 2.31009, 1, 1, 1, 1, 1,
0.5787743, -0.2909506, -1.010918, 1, 1, 1, 1, 1,
0.5862721, -0.3094625, 2.363342, 1, 1, 1, 1, 1,
0.588756, 0.2186674, 1.060919, 1, 1, 1, 1, 1,
0.5897942, -1.891891, 2.176543, 1, 1, 1, 1, 1,
0.5913396, -1.401034, 4.29935, 1, 1, 1, 1, 1,
0.5946402, -1.994143, 2.978936, 1, 1, 1, 1, 1,
0.5963367, -0.5473675, 2.808069, 1, 1, 1, 1, 1,
0.5974081, -0.2403856, 0.8258518, 1, 1, 1, 1, 1,
0.5977914, -0.3643742, 3.065479, 1, 1, 1, 1, 1,
0.6030364, -1.030681, 3.378341, 1, 1, 1, 1, 1,
0.6045866, -0.5892962, 1.474012, 1, 1, 1, 1, 1,
0.6080694, 1.355151, -0.3890781, 0, 0, 1, 1, 1,
0.6185339, -1.798746, 3.109345, 1, 0, 0, 1, 1,
0.6188849, 0.6614115, 0.9029744, 1, 0, 0, 1, 1,
0.6197398, 1.441899, 0.6590575, 1, 0, 0, 1, 1,
0.6324152, -0.2769717, 3.472505, 1, 0, 0, 1, 1,
0.6334676, 1.183184, 0.01140853, 1, 0, 0, 1, 1,
0.6413588, -0.5971615, 1.785633, 0, 0, 0, 1, 1,
0.6446645, 1.252286, -0.6976458, 0, 0, 0, 1, 1,
0.6506803, -0.4495192, 1.543529, 0, 0, 0, 1, 1,
0.651568, -1.001589, 3.150959, 0, 0, 0, 1, 1,
0.6549169, 0.5527275, -0.3422526, 0, 0, 0, 1, 1,
0.6555177, 0.1048428, 2.076967, 0, 0, 0, 1, 1,
0.6603939, 0.1638804, 0.2880991, 0, 0, 0, 1, 1,
0.6605151, 1.00228, 0.1104085, 1, 1, 1, 1, 1,
0.6614944, -0.3438429, 2.636989, 1, 1, 1, 1, 1,
0.6623734, -0.7508518, 3.105054, 1, 1, 1, 1, 1,
0.6651667, -0.05898461, 0.9376004, 1, 1, 1, 1, 1,
0.6698671, -2.2652, 3.406412, 1, 1, 1, 1, 1,
0.6772032, -0.6684613, 1.528297, 1, 1, 1, 1, 1,
0.6845239, 1.105988, 2.027271, 1, 1, 1, 1, 1,
0.6848812, -0.1658077, 2.440203, 1, 1, 1, 1, 1,
0.6866454, 0.5735096, 0.2771398, 1, 1, 1, 1, 1,
0.6870099, -0.6461915, 3.723133, 1, 1, 1, 1, 1,
0.6889005, 0.4583745, 1.153146, 1, 1, 1, 1, 1,
0.6904031, -1.62464, 1.108837, 1, 1, 1, 1, 1,
0.6923879, -0.8255221, 2.262383, 1, 1, 1, 1, 1,
0.6936787, -0.2118281, 2.976294, 1, 1, 1, 1, 1,
0.694043, -2.038964, 2.097302, 1, 1, 1, 1, 1,
0.7015851, -0.0816557, 2.078066, 0, 0, 1, 1, 1,
0.7074241, -0.6974167, 2.16889, 1, 0, 0, 1, 1,
0.7113106, -1.522782, 0.9762994, 1, 0, 0, 1, 1,
0.7156409, -0.8539108, 2.268746, 1, 0, 0, 1, 1,
0.7170155, -0.5974431, 2.828138, 1, 0, 0, 1, 1,
0.7172201, 0.6762331, -0.688178, 1, 0, 0, 1, 1,
0.7188538, -1.531752, 1.965542, 0, 0, 0, 1, 1,
0.719371, -1.566658, 3.530556, 0, 0, 0, 1, 1,
0.7240061, -0.1884425, 1.868671, 0, 0, 0, 1, 1,
0.7258597, -0.7523568, 3.506711, 0, 0, 0, 1, 1,
0.7315966, -1.613896, 2.353711, 0, 0, 0, 1, 1,
0.732287, -0.02659082, 3.253657, 0, 0, 0, 1, 1,
0.7337229, -0.5746683, 3.236762, 0, 0, 0, 1, 1,
0.7437434, -0.8399805, 1.038446, 1, 1, 1, 1, 1,
0.7458721, -1.029533, 2.065951, 1, 1, 1, 1, 1,
0.7468255, -1.178435, 3.352154, 1, 1, 1, 1, 1,
0.7492484, -1.456181, 1.108291, 1, 1, 1, 1, 1,
0.7605249, -0.7539962, 2.945978, 1, 1, 1, 1, 1,
0.7651274, -0.3600082, 2.567916, 1, 1, 1, 1, 1,
0.7724714, -0.5189217, 2.941249, 1, 1, 1, 1, 1,
0.7764292, 0.6049661, 1.532397, 1, 1, 1, 1, 1,
0.7826906, -1.03935, 2.660795, 1, 1, 1, 1, 1,
0.7864614, 0.3592801, 1.391919, 1, 1, 1, 1, 1,
0.7892177, -0.1140514, 3.245054, 1, 1, 1, 1, 1,
0.7941895, 1.329335, 0.9598202, 1, 1, 1, 1, 1,
0.7970656, -1.322695, 2.322562, 1, 1, 1, 1, 1,
0.7972477, 0.3499053, 1.167846, 1, 1, 1, 1, 1,
0.8034559, -0.2068342, 2.320892, 1, 1, 1, 1, 1,
0.8049331, -1.104489, 2.803619, 0, 0, 1, 1, 1,
0.8080166, 1.120111, -1.254686, 1, 0, 0, 1, 1,
0.8098736, -0.4184851, 2.130545, 1, 0, 0, 1, 1,
0.8148569, 0.3246307, 0.8142762, 1, 0, 0, 1, 1,
0.8220988, -1.136276, 1.831608, 1, 0, 0, 1, 1,
0.8294441, 0.302249, 1.252092, 1, 0, 0, 1, 1,
0.8304242, 0.5922447, 0.9629763, 0, 0, 0, 1, 1,
0.8371703, -0.1691629, 1.215705, 0, 0, 0, 1, 1,
0.8372722, -0.6651186, 0.4034808, 0, 0, 0, 1, 1,
0.8377658, -0.6381291, 0.2737477, 0, 0, 0, 1, 1,
0.8401569, -1.519467, 4.750224, 0, 0, 0, 1, 1,
0.8440725, -0.7540663, 1.715229, 0, 0, 0, 1, 1,
0.852859, 0.495122, 0.5741575, 0, 0, 0, 1, 1,
0.8550776, -0.2840118, 2.513246, 1, 1, 1, 1, 1,
0.8603578, 0.4832489, 1.369276, 1, 1, 1, 1, 1,
0.8620325, 0.27318, 0.942914, 1, 1, 1, 1, 1,
0.8622944, 0.8343211, 0.6876498, 1, 1, 1, 1, 1,
0.8634704, -0.0846954, 1.247023, 1, 1, 1, 1, 1,
0.8723853, 1.184047, 1.318334, 1, 1, 1, 1, 1,
0.8758644, 0.6504904, 1.158717, 1, 1, 1, 1, 1,
0.8765978, -0.2922109, 1.961271, 1, 1, 1, 1, 1,
0.877395, -2.697162, 4.161561, 1, 1, 1, 1, 1,
0.8801063, -0.01432518, -0.1288365, 1, 1, 1, 1, 1,
0.8808839, -0.2261396, -0.2077934, 1, 1, 1, 1, 1,
0.884195, 0.227395, -0.06573653, 1, 1, 1, 1, 1,
0.889812, 0.9866941, 3.296183, 1, 1, 1, 1, 1,
0.8901057, -0.6476719, 4.054891, 1, 1, 1, 1, 1,
0.8969774, -1.553602, 3.391339, 1, 1, 1, 1, 1,
0.898275, 2.302824, 1.301049, 0, 0, 1, 1, 1,
0.9017925, 1.275187, 1.011772, 1, 0, 0, 1, 1,
0.9094136, 0.5724692, 2.379905, 1, 0, 0, 1, 1,
0.9110121, 0.8019078, 0.3080638, 1, 0, 0, 1, 1,
0.9119385, -0.629802, 2.311495, 1, 0, 0, 1, 1,
0.9149439, 0.2812361, 1.976074, 1, 0, 0, 1, 1,
0.9198658, -0.6543471, 0.1319753, 0, 0, 0, 1, 1,
0.9203662, 0.6759385, -0.1336902, 0, 0, 0, 1, 1,
0.9243406, -0.4065707, 1.931279, 0, 0, 0, 1, 1,
0.9250301, -0.2959486, 2.208014, 0, 0, 0, 1, 1,
0.9302411, -1.165194, 3.696105, 0, 0, 0, 1, 1,
0.9316332, -0.9317748, 1.083361, 0, 0, 0, 1, 1,
0.9401172, 0.2016483, 1.636347, 0, 0, 0, 1, 1,
0.9404935, 1.100859, 0.4824955, 1, 1, 1, 1, 1,
0.9441381, -1.414002, 2.844455, 1, 1, 1, 1, 1,
0.9459919, -0.6183803, 1.133777, 1, 1, 1, 1, 1,
0.9487906, 0.3595125, 2.695003, 1, 1, 1, 1, 1,
0.9487954, -0.04867489, 0.6755633, 1, 1, 1, 1, 1,
0.9515621, -0.428905, 2.307796, 1, 1, 1, 1, 1,
0.9579417, -1.617411, 2.939867, 1, 1, 1, 1, 1,
0.961915, -0.3258125, 0.9362204, 1, 1, 1, 1, 1,
0.9627056, 0.505107, 1.47725, 1, 1, 1, 1, 1,
0.9639766, -0.5561779, 2.151533, 1, 1, 1, 1, 1,
0.964283, 0.4717282, -0.3320905, 1, 1, 1, 1, 1,
0.9709938, 0.07237651, 2.61269, 1, 1, 1, 1, 1,
0.9716375, -1.539744, 2.805033, 1, 1, 1, 1, 1,
0.9786937, 1.013872, 0.5685183, 1, 1, 1, 1, 1,
0.9830241, 1.349431, 1.611555, 1, 1, 1, 1, 1,
0.9891037, 1.259393, -0.2208524, 0, 0, 1, 1, 1,
0.9903814, 0.6105595, 1.23708, 1, 0, 0, 1, 1,
0.9916469, -0.1201156, 1.228657, 1, 0, 0, 1, 1,
0.9997742, -0.6600249, 1.115537, 1, 0, 0, 1, 1,
1.000344, 0.6011728, 2.231835, 1, 0, 0, 1, 1,
1.006471, 1.094471, 0.9141091, 1, 0, 0, 1, 1,
1.008203, -0.7931534, 3.532906, 0, 0, 0, 1, 1,
1.014299, 2.010378, 1.280632, 0, 0, 0, 1, 1,
1.018098, 0.6282063, 0.9775811, 0, 0, 0, 1, 1,
1.018263, -0.3649687, 1.501693, 0, 0, 0, 1, 1,
1.01958, 0.1597864, 0.5300726, 0, 0, 0, 1, 1,
1.022256, -1.554808, 3.235643, 0, 0, 0, 1, 1,
1.033233, 1.660195, 1.689321, 0, 0, 0, 1, 1,
1.034025, -1.448813, 2.66837, 1, 1, 1, 1, 1,
1.040991, 1.056963, 0.2121836, 1, 1, 1, 1, 1,
1.041495, 0.4602057, 2.025074, 1, 1, 1, 1, 1,
1.042896, -0.4169696, 2.969555, 1, 1, 1, 1, 1,
1.043244, -0.5099158, 3.687513, 1, 1, 1, 1, 1,
1.044797, 1.327548, -0.3699402, 1, 1, 1, 1, 1,
1.046964, 1.135396, 1.467839, 1, 1, 1, 1, 1,
1.047526, -0.05674351, 2.371677, 1, 1, 1, 1, 1,
1.048856, -0.5633284, 0.4739072, 1, 1, 1, 1, 1,
1.052346, 0.7498524, 0.8571746, 1, 1, 1, 1, 1,
1.057043, -0.4148222, 1.724723, 1, 1, 1, 1, 1,
1.067389, 1.175247, 0.9573187, 1, 1, 1, 1, 1,
1.068263, -0.3552469, 3.049206, 1, 1, 1, 1, 1,
1.06842, -0.5564911, 2.548635, 1, 1, 1, 1, 1,
1.073074, 0.1539477, -0.2239742, 1, 1, 1, 1, 1,
1.080099, -1.041113, 3.320825, 0, 0, 1, 1, 1,
1.082108, 0.1100493, -0.3961215, 1, 0, 0, 1, 1,
1.083611, -0.1199254, 0.3263665, 1, 0, 0, 1, 1,
1.088155, 2.061933, 0.3342999, 1, 0, 0, 1, 1,
1.102979, 0.9841662, 1.971672, 1, 0, 0, 1, 1,
1.111538, -0.3066204, 0.9056461, 1, 0, 0, 1, 1,
1.111938, 0.5373903, 2.40435, 0, 0, 0, 1, 1,
1.11302, -2.160014, 2.564791, 0, 0, 0, 1, 1,
1.115095, -0.3983332, 1.395938, 0, 0, 0, 1, 1,
1.12298, 0.3595945, 0.6654262, 0, 0, 0, 1, 1,
1.125312, -1.806059, 3.706194, 0, 0, 0, 1, 1,
1.128912, 0.06707054, 3.529328, 0, 0, 0, 1, 1,
1.132884, -0.4036258, 2.642442, 0, 0, 0, 1, 1,
1.133963, -0.7673011, 1.611287, 1, 1, 1, 1, 1,
1.143982, 0.3259859, 2.633109, 1, 1, 1, 1, 1,
1.150608, 0.8110414, 1.356347, 1, 1, 1, 1, 1,
1.154572, -1.140431, 3.728835, 1, 1, 1, 1, 1,
1.155205, -1.624853, 1.079952, 1, 1, 1, 1, 1,
1.156738, 1.017974, 1.521805, 1, 1, 1, 1, 1,
1.162627, 0.761651, 1.023809, 1, 1, 1, 1, 1,
1.180324, 0.5751035, 0.07846005, 1, 1, 1, 1, 1,
1.187686, -1.132959, 1.555191, 1, 1, 1, 1, 1,
1.190618, 1.09419, 1.460092, 1, 1, 1, 1, 1,
1.196424, 1.381256, 1.340412, 1, 1, 1, 1, 1,
1.201714, -2.908266, 3.368831, 1, 1, 1, 1, 1,
1.205449, -0.9521661, 1.757643, 1, 1, 1, 1, 1,
1.210205, -0.9280555, 2.283542, 1, 1, 1, 1, 1,
1.214102, 0.7222172, 1.490295, 1, 1, 1, 1, 1,
1.220447, -0.4836108, 2.710392, 0, 0, 1, 1, 1,
1.2217, -0.8022326, 1.828781, 1, 0, 0, 1, 1,
1.229379, -0.2232481, 3.30406, 1, 0, 0, 1, 1,
1.233564, 0.7549115, 1.241471, 1, 0, 0, 1, 1,
1.241585, -0.2285807, 2.244083, 1, 0, 0, 1, 1,
1.25946, -1.013602, 1.19697, 1, 0, 0, 1, 1,
1.262668, -0.9400288, 3.09372, 0, 0, 0, 1, 1,
1.278057, -1.054216, 2.956474, 0, 0, 0, 1, 1,
1.282901, 0.99658, 1.011333, 0, 0, 0, 1, 1,
1.283172, -0.5352616, 1.732095, 0, 0, 0, 1, 1,
1.291701, -1.031849, 0.4109609, 0, 0, 0, 1, 1,
1.298823, 0.7343786, 1.409501, 0, 0, 0, 1, 1,
1.301877, -0.1548195, -1.268856, 0, 0, 0, 1, 1,
1.30254, -0.413905, 0.8094733, 1, 1, 1, 1, 1,
1.307691, 0.4566442, 3.822484, 1, 1, 1, 1, 1,
1.312605, 0.7705207, 2.198828, 1, 1, 1, 1, 1,
1.319804, 0.7865179, 1.313507, 1, 1, 1, 1, 1,
1.335362, 1.005877, 2.645565, 1, 1, 1, 1, 1,
1.336484, -0.6045329, 3.606179, 1, 1, 1, 1, 1,
1.337383, -1.633555, 0.5986865, 1, 1, 1, 1, 1,
1.350299, 0.284137, 1.908551, 1, 1, 1, 1, 1,
1.35221, -1.658902, 3.045724, 1, 1, 1, 1, 1,
1.360971, -0.411742, 2.800726, 1, 1, 1, 1, 1,
1.377648, -0.7801905, 1.931319, 1, 1, 1, 1, 1,
1.377991, -0.3635723, 2.147182, 1, 1, 1, 1, 1,
1.381238, 0.7333849, 0.4708975, 1, 1, 1, 1, 1,
1.392671, 0.03428723, 0.9206841, 1, 1, 1, 1, 1,
1.396505, 0.8103076, 1.910715, 1, 1, 1, 1, 1,
1.396772, 0.8761265, 2.823475, 0, 0, 1, 1, 1,
1.399222, -1.171613, 2.397417, 1, 0, 0, 1, 1,
1.40542, -1.61176, 1.445834, 1, 0, 0, 1, 1,
1.415812, 0.859987, 2.172823, 1, 0, 0, 1, 1,
1.421557, 0.3595754, -1.3949, 1, 0, 0, 1, 1,
1.424023, -1.270848, 5.0316, 1, 0, 0, 1, 1,
1.429417, 0.2332901, 1.363958, 0, 0, 0, 1, 1,
1.431234, 1.355211, 1.229097, 0, 0, 0, 1, 1,
1.434363, -1.089586, 2.661295, 0, 0, 0, 1, 1,
1.436015, 1.244403, 0.64564, 0, 0, 0, 1, 1,
1.439659, -0.3869292, 1.37109, 0, 0, 0, 1, 1,
1.445632, -0.5955666, 2.230932, 0, 0, 0, 1, 1,
1.448276, 0.2175452, 2.214786, 0, 0, 0, 1, 1,
1.450516, 0.1785035, 2.553013, 1, 1, 1, 1, 1,
1.463202, 0.7750505, 0.3128597, 1, 1, 1, 1, 1,
1.469525, 1.602018, -0.05463417, 1, 1, 1, 1, 1,
1.477832, -0.3648286, 2.68597, 1, 1, 1, 1, 1,
1.48208, -0.7755584, 1.441968, 1, 1, 1, 1, 1,
1.482843, -0.6175266, 2.934209, 1, 1, 1, 1, 1,
1.489674, -0.1837024, 0.2159903, 1, 1, 1, 1, 1,
1.500016, -1.007625, 3.340048, 1, 1, 1, 1, 1,
1.504221, 1.381043, 1.159478, 1, 1, 1, 1, 1,
1.506785, -1.04275, 2.003147, 1, 1, 1, 1, 1,
1.512434, -0.4094731, 2.459248, 1, 1, 1, 1, 1,
1.548792, -1.256089, 1.664742, 1, 1, 1, 1, 1,
1.551888, -1.014753, 3.617855, 1, 1, 1, 1, 1,
1.560394, 0.8161383, 0.7194302, 1, 1, 1, 1, 1,
1.589788, -0.5462124, 2.361836, 1, 1, 1, 1, 1,
1.603252, 0.04037743, 1.374395, 0, 0, 1, 1, 1,
1.612381, 1.122156, 1.385559, 1, 0, 0, 1, 1,
1.621136, -0.3874051, 2.707799, 1, 0, 0, 1, 1,
1.623316, 0.000741229, 3.306576, 1, 0, 0, 1, 1,
1.631399, 0.9691669, -0.1959526, 1, 0, 0, 1, 1,
1.633188, -0.03831034, 2.874203, 1, 0, 0, 1, 1,
1.649418, -1.29372, 3.123761, 0, 0, 0, 1, 1,
1.663081, -0.3028559, 1.849463, 0, 0, 0, 1, 1,
1.67321, 0.2612869, 2.876695, 0, 0, 0, 1, 1,
1.686295, -0.1253664, 2.661477, 0, 0, 0, 1, 1,
1.694031, 0.04520252, 1.528739, 0, 0, 0, 1, 1,
1.695029, 0.1141134, 0.6910474, 0, 0, 0, 1, 1,
1.6951, -0.3321501, 0.3916768, 0, 0, 0, 1, 1,
1.700171, 0.849589, 1.122743, 1, 1, 1, 1, 1,
1.704836, -1.170534, 3.751108, 1, 1, 1, 1, 1,
1.75063, 0.1353383, 1.898143, 1, 1, 1, 1, 1,
1.758211, 1.588937, 1.479456, 1, 1, 1, 1, 1,
1.787703, 2.506443, 1.966874, 1, 1, 1, 1, 1,
1.797668, 0.3229047, 3.018494, 1, 1, 1, 1, 1,
1.884143, -1.272117, 4.484037, 1, 1, 1, 1, 1,
1.899542, -0.5479986, 1.465223, 1, 1, 1, 1, 1,
1.908664, -2.184899, 3.950235, 1, 1, 1, 1, 1,
1.956471, -0.7447284, 2.740546, 1, 1, 1, 1, 1,
2.005231, -0.1333821, 0.4931973, 1, 1, 1, 1, 1,
2.018056, -0.5669582, 2.498184, 1, 1, 1, 1, 1,
2.054759, -0.8901838, 1.227122, 1, 1, 1, 1, 1,
2.066432, 0.1643329, 0.8047646, 1, 1, 1, 1, 1,
2.068443, -2.358162, 1.17109, 1, 1, 1, 1, 1,
2.079807, 0.06429464, 3.77418, 0, 0, 1, 1, 1,
2.11074, -0.8945271, 0.9718347, 1, 0, 0, 1, 1,
2.126901, 0.2885118, 1.312768, 1, 0, 0, 1, 1,
2.13948, -0.5548523, -0.2650143, 1, 0, 0, 1, 1,
2.140707, 0.5351065, 3.486192, 1, 0, 0, 1, 1,
2.203303, -0.5817778, 1.848306, 1, 0, 0, 1, 1,
2.205137, 0.8002865, 1.226766, 0, 0, 0, 1, 1,
2.241215, -0.3987398, 2.397004, 0, 0, 0, 1, 1,
2.382971, 0.3611775, 3.313232, 0, 0, 0, 1, 1,
2.440709, 0.610213, 0.9948763, 0, 0, 0, 1, 1,
2.458558, 0.001214702, 1.478342, 0, 0, 0, 1, 1,
2.480844, 2.203064, 1.016579, 0, 0, 0, 1, 1,
2.514378, -0.4809453, 2.125157, 0, 0, 0, 1, 1,
2.522525, 0.1192579, 0.8645033, 1, 1, 1, 1, 1,
2.694195, 0.4051481, 1.733626, 1, 1, 1, 1, 1,
2.696436, -0.09080281, 1.343632, 1, 1, 1, 1, 1,
2.696678, 0.02174051, 0.2296545, 1, 1, 1, 1, 1,
2.701104, -0.9098703, 2.079345, 1, 1, 1, 1, 1,
2.905149, 0.8368015, 0.7604997, 1, 1, 1, 1, 1,
2.952699, 0.2727084, 1.743067, 1, 1, 1, 1, 1
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
var radius = 9.520387;
var distance = 33.43995;
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
mvMatrix.translate( 0.2006818, -0.1693345, -0.3827999 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.43995);
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
