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
-3.41264, -0.02552333, -1.454829, 1, 0, 0, 1,
-2.662805, -0.06553127, -1.266714, 1, 0.007843138, 0, 1,
-2.529818, 1.315302, -1.578153, 1, 0.01176471, 0, 1,
-2.450976, 1.508854, -0.1715575, 1, 0.01960784, 0, 1,
-2.325398, -0.5282153, -0.05006444, 1, 0.02352941, 0, 1,
-2.303838, 0.0761177, -1.677693, 1, 0.03137255, 0, 1,
-2.292217, -0.04698215, -1.894267, 1, 0.03529412, 0, 1,
-2.276986, -1.495828, -2.061644, 1, 0.04313726, 0, 1,
-2.256829, 0.8782644, -1.980232, 1, 0.04705882, 0, 1,
-2.169424, 0.6228742, -3.490659, 1, 0.05490196, 0, 1,
-2.152097, -0.6731015, -1.398458, 1, 0.05882353, 0, 1,
-2.150422, -1.563221, -2.514327, 1, 0.06666667, 0, 1,
-2.122234, -0.277838, -1.533174, 1, 0.07058824, 0, 1,
-2.110561, 0.2980476, 0.2331923, 1, 0.07843138, 0, 1,
-2.103828, 0.2084807, -2.61212, 1, 0.08235294, 0, 1,
-2.046878, 0.6232567, -1.448819, 1, 0.09019608, 0, 1,
-2.041582, -0.8560349, -1.52263, 1, 0.09411765, 0, 1,
-2.03801, 0.9478974, -1.640471, 1, 0.1019608, 0, 1,
-2.018741, -0.3766531, -1.162659, 1, 0.1098039, 0, 1,
-2.012387, 0.3103476, -2.310851, 1, 0.1137255, 0, 1,
-1.958664, 1.167695, -0.7366873, 1, 0.1215686, 0, 1,
-1.958592, 0.301347, -1.732476, 1, 0.1254902, 0, 1,
-1.87932, 1.453877, -0.1874458, 1, 0.1333333, 0, 1,
-1.878437, 1.311909, -0.7032053, 1, 0.1372549, 0, 1,
-1.815139, -0.5074518, -2.822859, 1, 0.145098, 0, 1,
-1.811141, -2.15452, -2.640355, 1, 0.1490196, 0, 1,
-1.809203, -0.004849718, -3.025747, 1, 0.1568628, 0, 1,
-1.794758, 0.9382234, -0.9801583, 1, 0.1607843, 0, 1,
-1.785976, -0.1379976, -2.08209, 1, 0.1686275, 0, 1,
-1.775013, -0.7765383, -1.891762, 1, 0.172549, 0, 1,
-1.758461, -0.6750829, -1.543977, 1, 0.1803922, 0, 1,
-1.749868, 0.8469207, -1.488132, 1, 0.1843137, 0, 1,
-1.739893, -0.7894014, -2.788442, 1, 0.1921569, 0, 1,
-1.69604, 0.7631608, -2.213543, 1, 0.1960784, 0, 1,
-1.684623, 1.146231, 0.7376174, 1, 0.2039216, 0, 1,
-1.677097, 0.5807513, -0.9573849, 1, 0.2117647, 0, 1,
-1.673682, 1.087236, -1.649053, 1, 0.2156863, 0, 1,
-1.670669, -1.215263, -1.813114, 1, 0.2235294, 0, 1,
-1.663143, -1.226728, -1.76896, 1, 0.227451, 0, 1,
-1.659156, -1.174879, -1.682927, 1, 0.2352941, 0, 1,
-1.647296, 0.3851415, -0.727624, 1, 0.2392157, 0, 1,
-1.639744, -1.025961, -3.208929, 1, 0.2470588, 0, 1,
-1.638175, 0.619363, -2.626341, 1, 0.2509804, 0, 1,
-1.630965, 0.1328246, -1.54244, 1, 0.2588235, 0, 1,
-1.627488, -1.449904, -2.620505, 1, 0.2627451, 0, 1,
-1.625418, -1.217679, -0.8995363, 1, 0.2705882, 0, 1,
-1.618637, -1.522335, -2.842795, 1, 0.2745098, 0, 1,
-1.603144, 0.6932355, -1.101184, 1, 0.282353, 0, 1,
-1.597491, 0.512054, -0.05658537, 1, 0.2862745, 0, 1,
-1.59705, -1.533551, -1.408472, 1, 0.2941177, 0, 1,
-1.581074, 0.7643266, -1.696222, 1, 0.3019608, 0, 1,
-1.578771, -0.7739686, -0.9252363, 1, 0.3058824, 0, 1,
-1.569056, -0.8201748, -3.253031, 1, 0.3137255, 0, 1,
-1.568764, -1.028622, -0.302155, 1, 0.3176471, 0, 1,
-1.562014, -0.9620451, -1.256888, 1, 0.3254902, 0, 1,
-1.555089, 1.165218, -1.190543, 1, 0.3294118, 0, 1,
-1.552734, 1.165467, -0.6074357, 1, 0.3372549, 0, 1,
-1.542462, 1.015555, 0.2734475, 1, 0.3411765, 0, 1,
-1.541124, 0.5249437, -0.6069045, 1, 0.3490196, 0, 1,
-1.539288, -0.1942795, -1.948769, 1, 0.3529412, 0, 1,
-1.532394, 1.343341, -1.394955, 1, 0.3607843, 0, 1,
-1.525755, 1.194521, -0.8853652, 1, 0.3647059, 0, 1,
-1.52466, -1.340737, -1.037137, 1, 0.372549, 0, 1,
-1.521871, -1.057451, -2.224442, 1, 0.3764706, 0, 1,
-1.494793, -0.6163355, -2.39015, 1, 0.3843137, 0, 1,
-1.494136, -0.4293828, -1.665536, 1, 0.3882353, 0, 1,
-1.484468, -0.3422459, -2.409024, 1, 0.3960784, 0, 1,
-1.464091, -0.9795229, -2.975819, 1, 0.4039216, 0, 1,
-1.46199, -1.556331, -1.950315, 1, 0.4078431, 0, 1,
-1.445654, -1.228273, -2.689448, 1, 0.4156863, 0, 1,
-1.44148, 1.977059, 0.3752587, 1, 0.4196078, 0, 1,
-1.439503, -1.945791, -3.435819, 1, 0.427451, 0, 1,
-1.425327, -0.9245092, -1.156149, 1, 0.4313726, 0, 1,
-1.418226, -0.5961403, -2.049765, 1, 0.4392157, 0, 1,
-1.412572, -0.1327109, -0.4142389, 1, 0.4431373, 0, 1,
-1.411394, -1.532853, -3.76699, 1, 0.4509804, 0, 1,
-1.408829, 1.644393, -1.428123, 1, 0.454902, 0, 1,
-1.405655, 0.1212401, -0.6786658, 1, 0.4627451, 0, 1,
-1.403033, -1.121307, -1.386121, 1, 0.4666667, 0, 1,
-1.380583, -0.2785172, -0.5096648, 1, 0.4745098, 0, 1,
-1.379211, -0.03596394, -2.037178, 1, 0.4784314, 0, 1,
-1.378944, 0.03993583, -1.487483, 1, 0.4862745, 0, 1,
-1.355141, -1.06884, -3.216553, 1, 0.4901961, 0, 1,
-1.349922, 1.999216, -1.13713, 1, 0.4980392, 0, 1,
-1.343374, 0.7372766, -0.2391263, 1, 0.5058824, 0, 1,
-1.342363, 0.7870179, -1.472152, 1, 0.509804, 0, 1,
-1.338059, -0.1676359, -0.7121267, 1, 0.5176471, 0, 1,
-1.327045, 0.588607, -0.7472154, 1, 0.5215687, 0, 1,
-1.326802, 0.7501227, 0.2000445, 1, 0.5294118, 0, 1,
-1.326282, -0.8988985, -0.5745044, 1, 0.5333334, 0, 1,
-1.324777, -0.3592018, -0.8696512, 1, 0.5411765, 0, 1,
-1.323505, 0.09462889, -2.932159, 1, 0.5450981, 0, 1,
-1.322483, -0.988351, -2.306354, 1, 0.5529412, 0, 1,
-1.321553, -1.190282, -2.769931, 1, 0.5568628, 0, 1,
-1.317089, -0.3548395, -1.47725, 1, 0.5647059, 0, 1,
-1.316122, -1.609882, -2.126078, 1, 0.5686275, 0, 1,
-1.314382, 0.04659548, -1.931835, 1, 0.5764706, 0, 1,
-1.308015, 1.251097, -0.8343537, 1, 0.5803922, 0, 1,
-1.307926, 0.159822, 0.1581762, 1, 0.5882353, 0, 1,
-1.290108, -0.1664562, -3.473317, 1, 0.5921569, 0, 1,
-1.275831, -0.4418133, -0.6322373, 1, 0.6, 0, 1,
-1.270908, -1.297665, -1.604059, 1, 0.6078432, 0, 1,
-1.268116, 0.3962788, -2.712605, 1, 0.6117647, 0, 1,
-1.260034, -0.5260852, -2.231802, 1, 0.6196079, 0, 1,
-1.250969, 0.4989736, -1.529489, 1, 0.6235294, 0, 1,
-1.247123, 0.06196639, -1.697, 1, 0.6313726, 0, 1,
-1.247069, 0.5957556, 0.08652756, 1, 0.6352941, 0, 1,
-1.245683, -1.891027, -2.94797, 1, 0.6431373, 0, 1,
-1.241722, 0.7507034, -1.192643, 1, 0.6470588, 0, 1,
-1.237792, 0.6591618, 0.4474954, 1, 0.654902, 0, 1,
-1.233153, -0.4073038, -2.14712, 1, 0.6588235, 0, 1,
-1.206312, 0.3497835, -0.6469763, 1, 0.6666667, 0, 1,
-1.193434, -1.866327, -2.850214, 1, 0.6705883, 0, 1,
-1.183326, 1.042728, -0.2225283, 1, 0.6784314, 0, 1,
-1.183241, -1.356329, -1.685213, 1, 0.682353, 0, 1,
-1.180904, -0.1654234, -0.7136571, 1, 0.6901961, 0, 1,
-1.173181, 0.7953602, -2.307492, 1, 0.6941177, 0, 1,
-1.172511, -0.4935686, -0.5192498, 1, 0.7019608, 0, 1,
-1.170291, 0.5605715, -0.5973979, 1, 0.7098039, 0, 1,
-1.167891, -1.778206, -2.355673, 1, 0.7137255, 0, 1,
-1.166925, -0.4636653, -0.9598194, 1, 0.7215686, 0, 1,
-1.157927, 0.6467111, -2.244365, 1, 0.7254902, 0, 1,
-1.145298, -0.09262215, -1.170035, 1, 0.7333333, 0, 1,
-1.13898, -0.5421928, -1.402096, 1, 0.7372549, 0, 1,
-1.132334, -0.4400472, -1.222517, 1, 0.7450981, 0, 1,
-1.131048, 1.06876, -0.6063548, 1, 0.7490196, 0, 1,
-1.13089, 0.3197527, -1.706955, 1, 0.7568628, 0, 1,
-1.125868, -0.4094285, -0.8701498, 1, 0.7607843, 0, 1,
-1.118118, 2.026357, -0.9020328, 1, 0.7686275, 0, 1,
-1.11581, -1.249168, -0.2913927, 1, 0.772549, 0, 1,
-1.115341, 0.7559648, -0.2089783, 1, 0.7803922, 0, 1,
-1.099967, 0.1292628, -2.533715, 1, 0.7843137, 0, 1,
-1.099884, -1.237329, -2.810602, 1, 0.7921569, 0, 1,
-1.087918, 0.7260712, -0.770318, 1, 0.7960784, 0, 1,
-1.083483, 0.1320197, -3.558861, 1, 0.8039216, 0, 1,
-1.076316, -0.4803165, -1.534789, 1, 0.8117647, 0, 1,
-1.072896, -0.8761957, -1.281652, 1, 0.8156863, 0, 1,
-1.062451, 0.3038008, -1.709291, 1, 0.8235294, 0, 1,
-1.061708, 0.433097, -0.6206293, 1, 0.827451, 0, 1,
-1.057842, -0.3640009, -1.067408, 1, 0.8352941, 0, 1,
-1.055222, 0.7443881, 0.1566841, 1, 0.8392157, 0, 1,
-1.053715, -1.213643, -2.93662, 1, 0.8470588, 0, 1,
-1.053197, 1.830204, -0.03787763, 1, 0.8509804, 0, 1,
-1.051385, 1.807498, 0.1584075, 1, 0.8588235, 0, 1,
-1.049051, 0.3476009, -1.624603, 1, 0.8627451, 0, 1,
-1.045094, -0.1896485, -2.106013, 1, 0.8705882, 0, 1,
-1.042363, 0.01574623, -0.8601827, 1, 0.8745098, 0, 1,
-1.040723, -0.3586944, -2.514595, 1, 0.8823529, 0, 1,
-1.039103, -1.037031, -2.238683, 1, 0.8862745, 0, 1,
-1.038701, -0.4798278, -3.375377, 1, 0.8941177, 0, 1,
-1.035742, -0.1820924, -0.6603786, 1, 0.8980392, 0, 1,
-1.02592, -1.299548, -3.468284, 1, 0.9058824, 0, 1,
-1.021701, 0.054424, -0.02336282, 1, 0.9137255, 0, 1,
-1.013854, 0.5933349, -4.194016, 1, 0.9176471, 0, 1,
-1.013251, 1.672745, -1.224548, 1, 0.9254902, 0, 1,
-1.012786, 0.1556242, -0.06411394, 1, 0.9294118, 0, 1,
-1.006251, 1.106094, 1.162083, 1, 0.9372549, 0, 1,
-1.000998, 1.138199, -2.80529, 1, 0.9411765, 0, 1,
-0.9994285, -0.5219553, -1.63522, 1, 0.9490196, 0, 1,
-0.9985275, -0.4615176, -1.677129, 1, 0.9529412, 0, 1,
-0.9891679, -1.017624, -2.877917, 1, 0.9607843, 0, 1,
-0.9886047, -0.9085366, -1.966342, 1, 0.9647059, 0, 1,
-0.9684566, -1.002091, -3.364678, 1, 0.972549, 0, 1,
-0.9680591, -0.2026908, -0.4163095, 1, 0.9764706, 0, 1,
-0.9673432, 0.4356739, -0.2643362, 1, 0.9843137, 0, 1,
-0.9660681, 0.7308501, -1.953031, 1, 0.9882353, 0, 1,
-0.9634268, -0.3228282, -1.650873, 1, 0.9960784, 0, 1,
-0.9614433, -0.3656649, -2.988899, 0.9960784, 1, 0, 1,
-0.9611607, 0.01124247, -2.142908, 0.9921569, 1, 0, 1,
-0.9605353, 2.373548, 0.8760933, 0.9843137, 1, 0, 1,
-0.9604683, 0.7846204, -1.399307, 0.9803922, 1, 0, 1,
-0.9396875, 0.3838145, -0.8562517, 0.972549, 1, 0, 1,
-0.9299216, 0.7493912, -0.7340469, 0.9686275, 1, 0, 1,
-0.9293537, -0.6206464, -2.019608, 0.9607843, 1, 0, 1,
-0.9133326, 0.5783806, -0.1354443, 0.9568627, 1, 0, 1,
-0.9090601, -0.5545868, -3.04153, 0.9490196, 1, 0, 1,
-0.9089495, -1.032625, -2.375676, 0.945098, 1, 0, 1,
-0.9083549, 0.9933295, -1.496978, 0.9372549, 1, 0, 1,
-0.9029574, 1.426026, 0.07221206, 0.9333333, 1, 0, 1,
-0.9026644, -1.177646, -2.535173, 0.9254902, 1, 0, 1,
-0.8986056, -0.01690094, -1.698078, 0.9215686, 1, 0, 1,
-0.897585, 1.184836, 0.2138343, 0.9137255, 1, 0, 1,
-0.8888393, 0.1765807, -1.704246, 0.9098039, 1, 0, 1,
-0.8798572, 0.2887638, 1.307332, 0.9019608, 1, 0, 1,
-0.8771266, 2.191484, 0.334431, 0.8941177, 1, 0, 1,
-0.8768609, -0.5433373, -2.638257, 0.8901961, 1, 0, 1,
-0.8748523, -0.2683829, -1.073222, 0.8823529, 1, 0, 1,
-0.8728021, -0.9120854, -3.396414, 0.8784314, 1, 0, 1,
-0.8720809, -0.03036223, -2.024103, 0.8705882, 1, 0, 1,
-0.871019, 0.115379, -0.8728569, 0.8666667, 1, 0, 1,
-0.8625063, 0.177106, -1.285331, 0.8588235, 1, 0, 1,
-0.8421031, 0.3661108, -0.06346839, 0.854902, 1, 0, 1,
-0.8196828, 2.610335, -0.6340686, 0.8470588, 1, 0, 1,
-0.8184157, -0.2249, -1.858046, 0.8431373, 1, 0, 1,
-0.8156402, 0.1257816, -1.491363, 0.8352941, 1, 0, 1,
-0.8120287, 0.3632093, -1.494495, 0.8313726, 1, 0, 1,
-0.8116766, -0.3047054, -2.918599, 0.8235294, 1, 0, 1,
-0.8113405, -0.841512, -3.138916, 0.8196079, 1, 0, 1,
-0.8112221, -1.388122, -3.281645, 0.8117647, 1, 0, 1,
-0.8110628, 0.9186057, -1.343803, 0.8078431, 1, 0, 1,
-0.8039009, 0.7836804, 0.2400558, 0.8, 1, 0, 1,
-0.7998447, -0.1640409, -0.9590544, 0.7921569, 1, 0, 1,
-0.7990715, 0.232554, 0.03033613, 0.7882353, 1, 0, 1,
-0.7908197, -0.423393, -2.089203, 0.7803922, 1, 0, 1,
-0.7867112, 1.211709, -0.9354594, 0.7764706, 1, 0, 1,
-0.7790153, 0.2370798, -2.405096, 0.7686275, 1, 0, 1,
-0.7784064, 1.236049, -1.120174, 0.7647059, 1, 0, 1,
-0.7727322, -0.749501, -1.941123, 0.7568628, 1, 0, 1,
-0.7646196, 0.157247, -1.347343, 0.7529412, 1, 0, 1,
-0.7634798, 0.004404977, -0.2036028, 0.7450981, 1, 0, 1,
-0.7633404, -0.7334672, -1.919372, 0.7411765, 1, 0, 1,
-0.7580386, 0.8797125, -1.082841, 0.7333333, 1, 0, 1,
-0.748311, 0.5067828, -1.820019, 0.7294118, 1, 0, 1,
-0.7452077, -0.5735412, -3.870719, 0.7215686, 1, 0, 1,
-0.7404395, -0.680319, -2.215435, 0.7176471, 1, 0, 1,
-0.7379568, -0.258617, -0.17147, 0.7098039, 1, 0, 1,
-0.7337353, 0.0328852, -3.653668, 0.7058824, 1, 0, 1,
-0.7309777, 1.694625, 0.6375654, 0.6980392, 1, 0, 1,
-0.7308269, -0.08497159, -3.141887, 0.6901961, 1, 0, 1,
-0.7299819, -0.3707496, -0.5725141, 0.6862745, 1, 0, 1,
-0.7298022, -0.438922, -3.263256, 0.6784314, 1, 0, 1,
-0.7249852, 1.512382, -0.2360553, 0.6745098, 1, 0, 1,
-0.7197312, 1.951188, 2.121701, 0.6666667, 1, 0, 1,
-0.7194338, 1.22461, -1.534106, 0.6627451, 1, 0, 1,
-0.7176852, 1.735564, -0.9431493, 0.654902, 1, 0, 1,
-0.7159591, -1.233143, -1.959329, 0.6509804, 1, 0, 1,
-0.7146247, -0.8086846, -1.25906, 0.6431373, 1, 0, 1,
-0.711529, -0.4413472, -4.192981, 0.6392157, 1, 0, 1,
-0.7093674, 1.558559, 0.417516, 0.6313726, 1, 0, 1,
-0.7072141, 0.05202137, -0.8432847, 0.627451, 1, 0, 1,
-0.7065938, 0.5633711, -1.114206, 0.6196079, 1, 0, 1,
-0.7041244, 1.440571, -0.2370318, 0.6156863, 1, 0, 1,
-0.7017797, -0.770385, -1.439319, 0.6078432, 1, 0, 1,
-0.6999456, 0.114705, -0.2904632, 0.6039216, 1, 0, 1,
-0.6986538, -0.9597231, -3.088979, 0.5960785, 1, 0, 1,
-0.6972783, 0.1360274, -2.879902, 0.5882353, 1, 0, 1,
-0.6941558, -0.9851037, -1.578681, 0.5843138, 1, 0, 1,
-0.6909603, -1.699257, -3.221684, 0.5764706, 1, 0, 1,
-0.6883637, -1.510831, -2.361016, 0.572549, 1, 0, 1,
-0.6876344, -0.4846407, -2.907576, 0.5647059, 1, 0, 1,
-0.6820288, -0.8640472, -2.590467, 0.5607843, 1, 0, 1,
-0.6775091, 1.469608, 0.7799326, 0.5529412, 1, 0, 1,
-0.6738603, -0.5138574, -1.523487, 0.5490196, 1, 0, 1,
-0.6708306, -0.719548, -2.756507, 0.5411765, 1, 0, 1,
-0.6616938, 0.3410688, 0.8689336, 0.5372549, 1, 0, 1,
-0.6585783, -0.198445, -2.372597, 0.5294118, 1, 0, 1,
-0.6579186, -0.4457574, -2.738651, 0.5254902, 1, 0, 1,
-0.657195, -0.06893121, -1.391508, 0.5176471, 1, 0, 1,
-0.6495879, 0.6517038, -1.386027, 0.5137255, 1, 0, 1,
-0.6447034, -1.110864, -2.211731, 0.5058824, 1, 0, 1,
-0.6432205, -0.2684903, -2.154816, 0.5019608, 1, 0, 1,
-0.6375529, 0.3856512, -0.1586176, 0.4941176, 1, 0, 1,
-0.6330552, -0.4405293, -0.9540128, 0.4862745, 1, 0, 1,
-0.6294166, -0.7292275, -1.311336, 0.4823529, 1, 0, 1,
-0.6269473, -0.578976, -2.394558, 0.4745098, 1, 0, 1,
-0.6241802, -0.3439302, -4.132937, 0.4705882, 1, 0, 1,
-0.6231025, -0.6942315, -3.304579, 0.4627451, 1, 0, 1,
-0.6134516, -0.6256733, -2.770299, 0.4588235, 1, 0, 1,
-0.6114717, 0.7221117, -1.103609, 0.4509804, 1, 0, 1,
-0.6083076, -0.6861148, -1.170716, 0.4470588, 1, 0, 1,
-0.6055428, 0.1554272, -1.230978, 0.4392157, 1, 0, 1,
-0.6038845, -1.171576, -2.741335, 0.4352941, 1, 0, 1,
-0.6011017, -1.307644, -1.15026, 0.427451, 1, 0, 1,
-0.5971004, 0.3729523, 0.1036021, 0.4235294, 1, 0, 1,
-0.5964116, -1.082178, -1.760659, 0.4156863, 1, 0, 1,
-0.5953211, 0.548252, -3.392579, 0.4117647, 1, 0, 1,
-0.5927493, 1.179282, -0.06874976, 0.4039216, 1, 0, 1,
-0.5926674, 1.363354, -1.321982, 0.3960784, 1, 0, 1,
-0.5862579, -0.9359956, -2.526091, 0.3921569, 1, 0, 1,
-0.5741234, 0.6473935, -0.07449035, 0.3843137, 1, 0, 1,
-0.5740886, 2.340595, -1.045835, 0.3803922, 1, 0, 1,
-0.5725326, -0.3118208, -3.259747, 0.372549, 1, 0, 1,
-0.5709245, 1.825259, -1.364993, 0.3686275, 1, 0, 1,
-0.5697894, -1.474102, -1.45186, 0.3607843, 1, 0, 1,
-0.5515534, 2.038064, -1.035657, 0.3568628, 1, 0, 1,
-0.5506637, 0.9856431, 0.3816541, 0.3490196, 1, 0, 1,
-0.5461094, 2.402269, -2.55917, 0.345098, 1, 0, 1,
-0.5426929, 0.06452404, -0.5204195, 0.3372549, 1, 0, 1,
-0.5324206, -1.086373, -3.135538, 0.3333333, 1, 0, 1,
-0.5319743, 0.05888494, -2.189155, 0.3254902, 1, 0, 1,
-0.5317125, -1.681047, -3.297687, 0.3215686, 1, 0, 1,
-0.5274271, 0.01839109, -0.9141998, 0.3137255, 1, 0, 1,
-0.5238541, -0.651803, -1.197014, 0.3098039, 1, 0, 1,
-0.5162856, 0.1311976, -1.127349, 0.3019608, 1, 0, 1,
-0.5146067, 0.8853453, 0.0511223, 0.2941177, 1, 0, 1,
-0.5123819, 0.1607833, -1.547289, 0.2901961, 1, 0, 1,
-0.5063067, 0.5200133, -0.3785526, 0.282353, 1, 0, 1,
-0.5060352, 3.261963, 1.930878, 0.2784314, 1, 0, 1,
-0.5028511, 0.01322138, -3.040673, 0.2705882, 1, 0, 1,
-0.501656, 0.797615, -0.7619477, 0.2666667, 1, 0, 1,
-0.4986738, -0.5463758, -3.429588, 0.2588235, 1, 0, 1,
-0.4980652, -1.256945, -2.715549, 0.254902, 1, 0, 1,
-0.4962258, -0.1032274, 0.157937, 0.2470588, 1, 0, 1,
-0.4906259, -0.7110075, -2.825511, 0.2431373, 1, 0, 1,
-0.4862995, 0.6818972, -1.717991, 0.2352941, 1, 0, 1,
-0.4818732, -0.2239124, -2.554492, 0.2313726, 1, 0, 1,
-0.4778042, 1.217977, -0.2046479, 0.2235294, 1, 0, 1,
-0.4691426, -0.375483, -2.487794, 0.2196078, 1, 0, 1,
-0.4684803, 1.293374, -1.109441, 0.2117647, 1, 0, 1,
-0.4597422, -1.85194, -3.564136, 0.2078431, 1, 0, 1,
-0.4578616, -1.30385, -1.063959, 0.2, 1, 0, 1,
-0.4568806, 1.013762, -0.9051779, 0.1921569, 1, 0, 1,
-0.4554052, 0.4406109, -1.445412, 0.1882353, 1, 0, 1,
-0.4545347, 0.2100881, -0.6093241, 0.1803922, 1, 0, 1,
-0.4525875, 1.456172, 0.5376047, 0.1764706, 1, 0, 1,
-0.4508125, -0.9236665, -4.084353, 0.1686275, 1, 0, 1,
-0.4499264, 0.764063, -1.05668, 0.1647059, 1, 0, 1,
-0.4463283, -0.7120928, -2.141579, 0.1568628, 1, 0, 1,
-0.4422136, -0.7196379, -4.942923, 0.1529412, 1, 0, 1,
-0.4349926, 0.9571254, -0.7997434, 0.145098, 1, 0, 1,
-0.4317987, 0.1401495, -1.447785, 0.1411765, 1, 0, 1,
-0.4306354, 1.011159, -0.3841084, 0.1333333, 1, 0, 1,
-0.4294485, -0.3139213, -1.646587, 0.1294118, 1, 0, 1,
-0.4258904, 0.2545267, -1.873052, 0.1215686, 1, 0, 1,
-0.4251126, -0.3334765, -2.616795, 0.1176471, 1, 0, 1,
-0.4249485, -0.03127632, 0.1620599, 0.1098039, 1, 0, 1,
-0.4191065, -0.916723, -3.509991, 0.1058824, 1, 0, 1,
-0.4187963, -1.823295, -2.229608, 0.09803922, 1, 0, 1,
-0.4165768, -1.23532, -2.966476, 0.09019608, 1, 0, 1,
-0.4142084, 0.6843269, -1.161641, 0.08627451, 1, 0, 1,
-0.4122497, -2.153028, -4.605801, 0.07843138, 1, 0, 1,
-0.4091467, -0.5875221, -2.358845, 0.07450981, 1, 0, 1,
-0.4054557, 0.008445852, -4.08396, 0.06666667, 1, 0, 1,
-0.4016169, 0.07250946, -1.828321, 0.0627451, 1, 0, 1,
-0.4005331, -1.504252, -3.490283, 0.05490196, 1, 0, 1,
-0.3963915, 0.8105025, -1.13851, 0.05098039, 1, 0, 1,
-0.3880913, -0.3325886, -1.343728, 0.04313726, 1, 0, 1,
-0.3860862, -1.450964, -2.370329, 0.03921569, 1, 0, 1,
-0.3836328, 0.4116823, -0.2343029, 0.03137255, 1, 0, 1,
-0.3821121, -1.082887, -1.610443, 0.02745098, 1, 0, 1,
-0.3818284, 1.253079, -1.63088, 0.01960784, 1, 0, 1,
-0.3773795, 0.930329, -0.3755635, 0.01568628, 1, 0, 1,
-0.3738026, 0.1951238, -0.6071751, 0.007843138, 1, 0, 1,
-0.3730362, 0.6455929, -1.558278, 0.003921569, 1, 0, 1,
-0.3676759, -0.2287437, -4.815045, 0, 1, 0.003921569, 1,
-0.3664033, 0.1448729, -1.738706, 0, 1, 0.01176471, 1,
-0.3640195, -1.621979, -3.323027, 0, 1, 0.01568628, 1,
-0.3603559, -0.2931257, -2.055555, 0, 1, 0.02352941, 1,
-0.3601683, -0.9577339, -3.713921, 0, 1, 0.02745098, 1,
-0.354612, -0.1434795, -1.128875, 0, 1, 0.03529412, 1,
-0.3544526, -0.7590334, -1.976182, 0, 1, 0.03921569, 1,
-0.3509974, 0.8202425, 0.2004653, 0, 1, 0.04705882, 1,
-0.3506488, 0.04777096, -2.94445, 0, 1, 0.05098039, 1,
-0.3498036, -0.09239093, -1.209675, 0, 1, 0.05882353, 1,
-0.3477811, 0.1881875, -2.271031, 0, 1, 0.0627451, 1,
-0.3469689, -1.095981, -3.328225, 0, 1, 0.07058824, 1,
-0.3465837, -0.4192722, -2.287884, 0, 1, 0.07450981, 1,
-0.3409353, -1.877187, -4.430714, 0, 1, 0.08235294, 1,
-0.3406183, -0.552148, -1.942807, 0, 1, 0.08627451, 1,
-0.3399763, -2.262872, -3.572258, 0, 1, 0.09411765, 1,
-0.3363768, 0.477817, -0.01505679, 0, 1, 0.1019608, 1,
-0.3361062, 0.03220852, -1.851108, 0, 1, 0.1058824, 1,
-0.3359637, 0.6686511, -0.7356396, 0, 1, 0.1137255, 1,
-0.3357408, 0.6494936, 0.5413363, 0, 1, 0.1176471, 1,
-0.3318957, -1.602607, -3.509342, 0, 1, 0.1254902, 1,
-0.3315756, 1.031037, 0.484746, 0, 1, 0.1294118, 1,
-0.3302376, 0.7840617, -0.1592956, 0, 1, 0.1372549, 1,
-0.3289661, 1.383275, 0.255202, 0, 1, 0.1411765, 1,
-0.3288119, 0.6186265, -0.8075414, 0, 1, 0.1490196, 1,
-0.3283577, -0.8011869, -2.311203, 0, 1, 0.1529412, 1,
-0.3278964, 0.4137475, -1.972911, 0, 1, 0.1607843, 1,
-0.3271683, 0.3138031, 0.4447151, 0, 1, 0.1647059, 1,
-0.3250835, 1.098886, -0.6735142, 0, 1, 0.172549, 1,
-0.3219927, -0.05677955, -0.2164052, 0, 1, 0.1764706, 1,
-0.307312, -0.3799638, -2.998197, 0, 1, 0.1843137, 1,
-0.3047557, 0.722457, -0.7186784, 0, 1, 0.1882353, 1,
-0.3046149, 0.8022296, -0.08482508, 0, 1, 0.1960784, 1,
-0.3007794, -0.4419175, -2.581719, 0, 1, 0.2039216, 1,
-0.2992151, 0.8163024, -0.1002705, 0, 1, 0.2078431, 1,
-0.2986858, 0.3734573, -1.540511, 0, 1, 0.2156863, 1,
-0.2770896, 1.321599, -0.9906259, 0, 1, 0.2196078, 1,
-0.2755904, 1.686503, -0.5966463, 0, 1, 0.227451, 1,
-0.2750614, -0.8415591, -2.109207, 0, 1, 0.2313726, 1,
-0.2691274, 0.8549131, -1.27756, 0, 1, 0.2392157, 1,
-0.2665563, -0.1257507, -1.984953, 0, 1, 0.2431373, 1,
-0.2654888, -0.9720898, -0.9242426, 0, 1, 0.2509804, 1,
-0.263464, 2.28082, -1.697236, 0, 1, 0.254902, 1,
-0.2614005, 0.208368, -1.833276, 0, 1, 0.2627451, 1,
-0.2585898, -0.5208377, -1.490337, 0, 1, 0.2666667, 1,
-0.2575612, 0.3740374, -0.4593301, 0, 1, 0.2745098, 1,
-0.2572431, 3.33801, 1.249498, 0, 1, 0.2784314, 1,
-0.2563615, -0.1957667, -1.512165, 0, 1, 0.2862745, 1,
-0.2528639, -0.08970609, -3.549833, 0, 1, 0.2901961, 1,
-0.2504671, -0.6906475, -2.482265, 0, 1, 0.2980392, 1,
-0.2497817, 0.7617219, -0.9022381, 0, 1, 0.3058824, 1,
-0.2440349, 0.5185925, 0.4402097, 0, 1, 0.3098039, 1,
-0.2437633, 1.537364, -0.3439396, 0, 1, 0.3176471, 1,
-0.2436427, -1.272736, -4.370316, 0, 1, 0.3215686, 1,
-0.2423049, -1.734855, -3.300389, 0, 1, 0.3294118, 1,
-0.2382145, 0.7506129, -1.801339, 0, 1, 0.3333333, 1,
-0.236268, -0.7583466, -4.503364, 0, 1, 0.3411765, 1,
-0.2337795, -0.03514093, -0.6170968, 0, 1, 0.345098, 1,
-0.2320966, 0.5013267, -1.005856, 0, 1, 0.3529412, 1,
-0.225714, 2.816196, -0.5038276, 0, 1, 0.3568628, 1,
-0.2202089, 0.8732402, -0.9178619, 0, 1, 0.3647059, 1,
-0.2199804, -2.589775, -2.68718, 0, 1, 0.3686275, 1,
-0.2194943, -0.5026717, -2.843255, 0, 1, 0.3764706, 1,
-0.2188623, 0.7358611, -1.238579, 0, 1, 0.3803922, 1,
-0.2121006, -1.43101, -2.11514, 0, 1, 0.3882353, 1,
-0.2112717, 0.2070371, -1.064887, 0, 1, 0.3921569, 1,
-0.2093037, -0.3072303, -2.743487, 0, 1, 0.4, 1,
-0.2086391, 1.094305, -0.6316605, 0, 1, 0.4078431, 1,
-0.2082542, 1.545203, 0.7325623, 0, 1, 0.4117647, 1,
-0.1986109, 0.7805284, 0.8514547, 0, 1, 0.4196078, 1,
-0.1976743, -0.02812482, 0.02862741, 0, 1, 0.4235294, 1,
-0.1937132, -1.953764, -4.888629, 0, 1, 0.4313726, 1,
-0.1914048, -1.156786, -0.7868646, 0, 1, 0.4352941, 1,
-0.1839028, 0.4627782, 0.778343, 0, 1, 0.4431373, 1,
-0.1835964, -0.8816158, -3.367247, 0, 1, 0.4470588, 1,
-0.1784246, -1.60472, -1.583256, 0, 1, 0.454902, 1,
-0.1780305, -1.479965, -1.180779, 0, 1, 0.4588235, 1,
-0.1762056, -0.3788874, -2.55622, 0, 1, 0.4666667, 1,
-0.1756359, -1.31895, -4.497822, 0, 1, 0.4705882, 1,
-0.1730712, -1.504343, -5.485564, 0, 1, 0.4784314, 1,
-0.1714862, -0.7799228, -2.895325, 0, 1, 0.4823529, 1,
-0.1706755, -0.3551784, -3.823346, 0, 1, 0.4901961, 1,
-0.1688271, 1.533027, -0.6389334, 0, 1, 0.4941176, 1,
-0.1686905, 0.5485027, -1.204017, 0, 1, 0.5019608, 1,
-0.1607361, -1.699212, -4.175816, 0, 1, 0.509804, 1,
-0.1506901, -0.7950871, -2.342979, 0, 1, 0.5137255, 1,
-0.1459023, 0.6839585, -0.3403094, 0, 1, 0.5215687, 1,
-0.1453179, 0.509499, 0.2532005, 0, 1, 0.5254902, 1,
-0.1447451, -0.3343453, -1.982733, 0, 1, 0.5333334, 1,
-0.1439787, -1.504072, -1.858377, 0, 1, 0.5372549, 1,
-0.1425947, 0.5655697, -0.1963347, 0, 1, 0.5450981, 1,
-0.1383495, -0.1232602, -2.003842, 0, 1, 0.5490196, 1,
-0.1365525, -0.8787125, -2.163105, 0, 1, 0.5568628, 1,
-0.1350782, 1.185044, -0.01803297, 0, 1, 0.5607843, 1,
-0.1343984, -1.184651, -1.93651, 0, 1, 0.5686275, 1,
-0.1243343, -0.5532563, -2.392341, 0, 1, 0.572549, 1,
-0.1239723, 0.4141659, 1.421824, 0, 1, 0.5803922, 1,
-0.1210839, -0.6830212, -1.632093, 0, 1, 0.5843138, 1,
-0.1173645, -0.7346104, -2.0971, 0, 1, 0.5921569, 1,
-0.1160165, -1.718276, -3.42629, 0, 1, 0.5960785, 1,
-0.1100289, 0.7488668, 0.07391625, 0, 1, 0.6039216, 1,
-0.1086121, -0.06341264, -3.06391, 0, 1, 0.6117647, 1,
-0.1083758, 1.397541, 0.400977, 0, 1, 0.6156863, 1,
-0.1039681, -0.2829807, -1.258292, 0, 1, 0.6235294, 1,
-0.1005661, -0.4973152, -3.879373, 0, 1, 0.627451, 1,
-0.09746581, 0.5566591, -1.097936, 0, 1, 0.6352941, 1,
-0.09276827, 0.9900073, -0.2925045, 0, 1, 0.6392157, 1,
-0.09124529, 0.963061, -0.4382024, 0, 1, 0.6470588, 1,
-0.09033015, 0.5831324, -1.096409, 0, 1, 0.6509804, 1,
-0.08958049, -0.4192136, -1.601667, 0, 1, 0.6588235, 1,
-0.08717228, 1.498966, -0.08185176, 0, 1, 0.6627451, 1,
-0.08668763, -0.09785417, -2.274691, 0, 1, 0.6705883, 1,
-0.08600371, 0.8398879, -0.9980897, 0, 1, 0.6745098, 1,
-0.08482461, -0.7726049, -2.094852, 0, 1, 0.682353, 1,
-0.08233353, 0.5094415, 0.9110939, 0, 1, 0.6862745, 1,
-0.08200625, 0.2431194, 0.7627875, 0, 1, 0.6941177, 1,
-0.08196154, 0.7417623, -0.02488542, 0, 1, 0.7019608, 1,
-0.08142316, 0.2830785, -0.3124936, 0, 1, 0.7058824, 1,
-0.07518888, 0.2987545, -1.405534, 0, 1, 0.7137255, 1,
-0.07383152, -0.0813882, -3.301307, 0, 1, 0.7176471, 1,
-0.06880616, -1.010522, -2.917641, 0, 1, 0.7254902, 1,
-0.06409822, 1.479313, -0.09292672, 0, 1, 0.7294118, 1,
-0.06324248, -0.1585979, -2.461648, 0, 1, 0.7372549, 1,
-0.06118884, -2.527417, -2.020075, 0, 1, 0.7411765, 1,
-0.05947657, 1.068138, -0.1989873, 0, 1, 0.7490196, 1,
-0.05018514, 2.486559, -1.266035, 0, 1, 0.7529412, 1,
-0.04817194, 0.4721265, 0.7267883, 0, 1, 0.7607843, 1,
-0.04424599, 1.039403, -0.3276864, 0, 1, 0.7647059, 1,
-0.04176597, -1.248826, -5.436921, 0, 1, 0.772549, 1,
-0.03950863, -0.3218406, -2.513471, 0, 1, 0.7764706, 1,
-0.03590029, -0.1215378, -2.8022, 0, 1, 0.7843137, 1,
-0.03536228, 0.1468589, 1.987833, 0, 1, 0.7882353, 1,
-0.03477928, 0.305923, -0.0260515, 0, 1, 0.7960784, 1,
-0.03136859, 0.6728357, 0.1775791, 0, 1, 0.8039216, 1,
-0.03046139, -0.5619041, -3.991422, 0, 1, 0.8078431, 1,
-0.02786598, 0.1136004, 2.623915, 0, 1, 0.8156863, 1,
-0.02583782, 0.1940098, 2.001937, 0, 1, 0.8196079, 1,
-0.0254549, -0.6537154, -5.267103, 0, 1, 0.827451, 1,
-0.02531975, 1.227566, -0.4258733, 0, 1, 0.8313726, 1,
-0.02482325, -0.02686268, -4.331364, 0, 1, 0.8392157, 1,
-0.02075461, -0.2737335, -3.785455, 0, 1, 0.8431373, 1,
-0.0171158, 0.05753446, -0.728344, 0, 1, 0.8509804, 1,
-0.01477245, -0.1619077, -1.408366, 0, 1, 0.854902, 1,
-0.01230527, -0.4003189, -2.209693, 0, 1, 0.8627451, 1,
-0.01172141, 0.07683439, 0.3816148, 0, 1, 0.8666667, 1,
-0.008115771, 0.3526714, 0.04590571, 0, 1, 0.8745098, 1,
-0.006625735, 2.29512, -0.5176827, 0, 1, 0.8784314, 1,
-0.005273404, -1.095939, -2.288434, 0, 1, 0.8862745, 1,
-0.0001183877, -1.021488, -4.891408, 0, 1, 0.8901961, 1,
0.003623772, -1.206236, 3.925619, 0, 1, 0.8980392, 1,
0.0112533, 0.3961521, -1.372861, 0, 1, 0.9058824, 1,
0.01358466, -0.08651455, 2.997269, 0, 1, 0.9098039, 1,
0.01962506, 0.1774021, 0.3966021, 0, 1, 0.9176471, 1,
0.02849786, -0.7183417, 3.21531, 0, 1, 0.9215686, 1,
0.03506277, 0.5084937, -0.2318689, 0, 1, 0.9294118, 1,
0.0353921, 0.1555908, -0.2186764, 0, 1, 0.9333333, 1,
0.03899206, -1.149757, 2.877419, 0, 1, 0.9411765, 1,
0.04065215, -0.05722871, 1.051154, 0, 1, 0.945098, 1,
0.04100102, -0.7403237, 1.595625, 0, 1, 0.9529412, 1,
0.04169269, -2.146854, 3.348401, 0, 1, 0.9568627, 1,
0.041875, 0.3342918, -0.8604751, 0, 1, 0.9647059, 1,
0.04302503, 1.38919, -0.811247, 0, 1, 0.9686275, 1,
0.04634754, 1.071035, 2.571755, 0, 1, 0.9764706, 1,
0.0464929, 0.2862293, -0.5449795, 0, 1, 0.9803922, 1,
0.04841462, 1.437817, -0.8176634, 0, 1, 0.9882353, 1,
0.04967552, -0.1693223, 2.160598, 0, 1, 0.9921569, 1,
0.05418427, 1.686799, -0.4330415, 0, 1, 1, 1,
0.05538252, 1.338404, 0.611267, 0, 0.9921569, 1, 1,
0.05838157, -1.065597, 3.049945, 0, 0.9882353, 1, 1,
0.06538359, 0.2869374, 0.9483901, 0, 0.9803922, 1, 1,
0.06650043, 0.6179494, -0.1463868, 0, 0.9764706, 1, 1,
0.07067733, 0.2162543, -1.772322, 0, 0.9686275, 1, 1,
0.07263827, -0.006137921, 1.175046, 0, 0.9647059, 1, 1,
0.07384022, -2.281128, 3.048565, 0, 0.9568627, 1, 1,
0.07568669, 0.5748718, -0.456201, 0, 0.9529412, 1, 1,
0.07615407, 0.7624542, -0.1019894, 0, 0.945098, 1, 1,
0.0772946, -1.30443, 1.464455, 0, 0.9411765, 1, 1,
0.08409564, -2.207417, 1.542449, 0, 0.9333333, 1, 1,
0.0860878, 0.1578142, 1.926886, 0, 0.9294118, 1, 1,
0.0878722, 0.1088737, 0.9941419, 0, 0.9215686, 1, 1,
0.09603649, -0.1607969, 2.213985, 0, 0.9176471, 1, 1,
0.1004009, -0.72618, 4.806231, 0, 0.9098039, 1, 1,
0.1006835, 0.3286032, -0.9496899, 0, 0.9058824, 1, 1,
0.1026426, 1.22029, 0.3866009, 0, 0.8980392, 1, 1,
0.1036687, -1.207614, 3.232891, 0, 0.8901961, 1, 1,
0.1054562, 0.3123516, -0.723728, 0, 0.8862745, 1, 1,
0.1055521, -1.511967, 4.720191, 0, 0.8784314, 1, 1,
0.1098302, 2.245878, -0.2688698, 0, 0.8745098, 1, 1,
0.1104072, 1.346866, -0.3757134, 0, 0.8666667, 1, 1,
0.1167262, 0.8562701, -0.08663814, 0, 0.8627451, 1, 1,
0.1182032, -0.8926392, 2.585922, 0, 0.854902, 1, 1,
0.1296839, 0.3976805, -0.5273805, 0, 0.8509804, 1, 1,
0.1345883, -0.1055861, 1.82262, 0, 0.8431373, 1, 1,
0.1355091, 0.6297128, -0.2701049, 0, 0.8392157, 1, 1,
0.1364288, 0.5672973, -0.3029445, 0, 0.8313726, 1, 1,
0.1383313, -1.559919, 5.061138, 0, 0.827451, 1, 1,
0.1437731, 0.7690189, -0.9414961, 0, 0.8196079, 1, 1,
0.1479024, -0.07072201, 0.4605115, 0, 0.8156863, 1, 1,
0.1490808, 0.3793094, -0.5215552, 0, 0.8078431, 1, 1,
0.1493111, 0.5491463, 0.007311344, 0, 0.8039216, 1, 1,
0.1557669, -0.2145229, 1.498299, 0, 0.7960784, 1, 1,
0.1588941, 0.2034965, 0.6613197, 0, 0.7882353, 1, 1,
0.1651515, 0.03569368, 0.9196222, 0, 0.7843137, 1, 1,
0.1659185, 0.1258334, 1.414103, 0, 0.7764706, 1, 1,
0.1696271, -1.515854, 2.600032, 0, 0.772549, 1, 1,
0.1716748, -0.885254, 3.135127, 0, 0.7647059, 1, 1,
0.172664, 0.1231828, 0.4918682, 0, 0.7607843, 1, 1,
0.1764006, -0.3663184, 3.436376, 0, 0.7529412, 1, 1,
0.1778061, -0.6806741, 2.871253, 0, 0.7490196, 1, 1,
0.1780007, -1.308784, 3.932456, 0, 0.7411765, 1, 1,
0.1781116, 2.209077, 1.109049, 0, 0.7372549, 1, 1,
0.1787692, -1.10839, 2.859519, 0, 0.7294118, 1, 1,
0.1791781, 0.9637434, -2.439057, 0, 0.7254902, 1, 1,
0.1800262, 0.3705662, 0.7225561, 0, 0.7176471, 1, 1,
0.1810735, 0.299415, -0.4162583, 0, 0.7137255, 1, 1,
0.183571, -0.431289, 2.539115, 0, 0.7058824, 1, 1,
0.1860777, -0.5671695, 1.766253, 0, 0.6980392, 1, 1,
0.1896223, 0.2169413, 2.258726, 0, 0.6941177, 1, 1,
0.1920402, 1.056339, 1.025524, 0, 0.6862745, 1, 1,
0.1975211, 0.128332, 1.09639, 0, 0.682353, 1, 1,
0.202952, -2.457064, 3.153832, 0, 0.6745098, 1, 1,
0.2034396, 0.2457944, 2.561421, 0, 0.6705883, 1, 1,
0.2091556, -0.3029038, 1.402286, 0, 0.6627451, 1, 1,
0.2098304, 2.537408, -0.2523593, 0, 0.6588235, 1, 1,
0.2123503, -0.4196143, 3.256745, 0, 0.6509804, 1, 1,
0.2148463, 0.8486552, 0.3349315, 0, 0.6470588, 1, 1,
0.2196059, 1.347761, 1.302498, 0, 0.6392157, 1, 1,
0.2209972, -1.226747, 4.113834, 0, 0.6352941, 1, 1,
0.2222493, 0.2848907, 0.1788341, 0, 0.627451, 1, 1,
0.2240734, -0.6292131, 3.947983, 0, 0.6235294, 1, 1,
0.228264, -1.360166, 3.689813, 0, 0.6156863, 1, 1,
0.2290283, -0.1608327, 2.094649, 0, 0.6117647, 1, 1,
0.2417592, 1.301389, -1.152758, 0, 0.6039216, 1, 1,
0.2436938, 0.7578089, -0.5249044, 0, 0.5960785, 1, 1,
0.2463444, -1.225096, 3.253766, 0, 0.5921569, 1, 1,
0.2468308, -0.01283839, 2.025448, 0, 0.5843138, 1, 1,
0.2480591, 1.023726, -2.234711, 0, 0.5803922, 1, 1,
0.2491912, 0.7774692, 0.04620356, 0, 0.572549, 1, 1,
0.2500803, -1.189402, 2.466457, 0, 0.5686275, 1, 1,
0.2512907, 0.6940468, -0.3962158, 0, 0.5607843, 1, 1,
0.2645302, -0.5390341, 2.978766, 0, 0.5568628, 1, 1,
0.2676941, 0.8438827, 1.428296, 0, 0.5490196, 1, 1,
0.2677858, -1.29817, 0.4150761, 0, 0.5450981, 1, 1,
0.2684307, -0.3316755, 4.10956, 0, 0.5372549, 1, 1,
0.2700343, -0.4701878, 3.240075, 0, 0.5333334, 1, 1,
0.2726865, 0.838562, 1.228637, 0, 0.5254902, 1, 1,
0.2770932, 1.936534, 0.3316711, 0, 0.5215687, 1, 1,
0.2775806, -0.310437, 2.364954, 0, 0.5137255, 1, 1,
0.2786337, -0.6147368, 0.7836266, 0, 0.509804, 1, 1,
0.2792478, 2.191575, -0.9177514, 0, 0.5019608, 1, 1,
0.2807778, -1.601676, 2.918397, 0, 0.4941176, 1, 1,
0.2841582, 1.180771, -0.1018329, 0, 0.4901961, 1, 1,
0.2849216, -0.2666912, 0.6258469, 0, 0.4823529, 1, 1,
0.2864062, -0.2783242, 2.378087, 0, 0.4784314, 1, 1,
0.2865956, 0.8075223, -0.4029014, 0, 0.4705882, 1, 1,
0.2879518, -0.5035026, 3.123405, 0, 0.4666667, 1, 1,
0.2896948, -0.8095346, 3.369807, 0, 0.4588235, 1, 1,
0.3026631, -0.1040871, 1.445437, 0, 0.454902, 1, 1,
0.3065823, 2.235806, 2.35657, 0, 0.4470588, 1, 1,
0.3071482, 0.1052625, -0.4268472, 0, 0.4431373, 1, 1,
0.3081556, -0.6154634, 2.847488, 0, 0.4352941, 1, 1,
0.3126129, 0.968778, -1.01589, 0, 0.4313726, 1, 1,
0.3165427, 0.4571469, -1.083422, 0, 0.4235294, 1, 1,
0.3207847, 0.110818, 1.584521, 0, 0.4196078, 1, 1,
0.3272584, -0.08468934, 2.319038, 0, 0.4117647, 1, 1,
0.327519, 0.7539035, -0.0487222, 0, 0.4078431, 1, 1,
0.3284283, 1.310763, 0.2443322, 0, 0.4, 1, 1,
0.3335433, -0.462557, 2.120023, 0, 0.3921569, 1, 1,
0.3341553, 1.070788, 1.761695, 0, 0.3882353, 1, 1,
0.3357467, -0.5092916, 1.319217, 0, 0.3803922, 1, 1,
0.344712, -0.2062119, 2.417158, 0, 0.3764706, 1, 1,
0.3447403, -1.888435, 4.225795, 0, 0.3686275, 1, 1,
0.3453285, 0.9376076, 2.294992, 0, 0.3647059, 1, 1,
0.3490723, 1.165023, 0.08633693, 0, 0.3568628, 1, 1,
0.3516245, -0.1736657, 3.444312, 0, 0.3529412, 1, 1,
0.3519316, -0.8342109, 2.765197, 0, 0.345098, 1, 1,
0.3535903, 0.3718689, 0.3270974, 0, 0.3411765, 1, 1,
0.356722, 0.09415777, 3.255461, 0, 0.3333333, 1, 1,
0.3582082, 0.4967322, 0.4282941, 0, 0.3294118, 1, 1,
0.3633875, 1.609692, -0.3920039, 0, 0.3215686, 1, 1,
0.3654481, 0.3621515, 1.005627, 0, 0.3176471, 1, 1,
0.3675017, -1.272157, 2.587617, 0, 0.3098039, 1, 1,
0.3701541, 0.4557683, 0.007867517, 0, 0.3058824, 1, 1,
0.3703366, 0.1631965, 0.4919348, 0, 0.2980392, 1, 1,
0.3706684, 0.7831149, -0.2116086, 0, 0.2901961, 1, 1,
0.3717499, 1.831536, 0.1648064, 0, 0.2862745, 1, 1,
0.3734843, 0.08174095, -1.224239, 0, 0.2784314, 1, 1,
0.3759955, -0.3873487, 3.148775, 0, 0.2745098, 1, 1,
0.3820229, -0.6715371, 2.658626, 0, 0.2666667, 1, 1,
0.384288, 0.8397471, 0.7212881, 0, 0.2627451, 1, 1,
0.3914662, -2.119934, 2.816128, 0, 0.254902, 1, 1,
0.3927211, 0.1982119, 1.690724, 0, 0.2509804, 1, 1,
0.393651, 0.3936085, 0.7862043, 0, 0.2431373, 1, 1,
0.3959438, -0.2897797, 3.455748, 0, 0.2392157, 1, 1,
0.3968165, 0.1520921, 0.7590777, 0, 0.2313726, 1, 1,
0.3980847, -0.9608623, 3.427727, 0, 0.227451, 1, 1,
0.4008836, -1.183939, 4.031216, 0, 0.2196078, 1, 1,
0.4016893, -0.2972575, 1.39559, 0, 0.2156863, 1, 1,
0.4020464, -0.3680095, 5.145045, 0, 0.2078431, 1, 1,
0.4083219, -1.716761, 3.713047, 0, 0.2039216, 1, 1,
0.4089111, 0.08702847, 1.016448, 0, 0.1960784, 1, 1,
0.4132343, -0.6014585, 0.6207258, 0, 0.1882353, 1, 1,
0.4139524, -1.237673, 3.526831, 0, 0.1843137, 1, 1,
0.418626, -0.8864786, 3.904963, 0, 0.1764706, 1, 1,
0.4199847, -1.802786, 4.300812, 0, 0.172549, 1, 1,
0.4228603, -0.1000928, 2.112273, 0, 0.1647059, 1, 1,
0.4308431, -0.7814881, 2.790753, 0, 0.1607843, 1, 1,
0.4309927, 0.6909357, 0.06517608, 0, 0.1529412, 1, 1,
0.4341724, 0.9687874, 0.4400584, 0, 0.1490196, 1, 1,
0.4358772, -1.771, 2.959457, 0, 0.1411765, 1, 1,
0.4375604, -0.1292048, 2.447228, 0, 0.1372549, 1, 1,
0.439381, -0.6900463, 2.211826, 0, 0.1294118, 1, 1,
0.4406685, -0.5875472, 0.1931334, 0, 0.1254902, 1, 1,
0.4416406, -0.9779117, 2.690341, 0, 0.1176471, 1, 1,
0.4478734, -0.748533, 2.209734, 0, 0.1137255, 1, 1,
0.4494346, 1.327005, 0.1100785, 0, 0.1058824, 1, 1,
0.4497435, 0.9751705, 0.9644457, 0, 0.09803922, 1, 1,
0.4509327, -0.9887921, 2.700973, 0, 0.09411765, 1, 1,
0.4516078, -0.3026507, 2.637919, 0, 0.08627451, 1, 1,
0.4544773, -1.611893, 3.635218, 0, 0.08235294, 1, 1,
0.4559686, -1.150321, 2.335592, 0, 0.07450981, 1, 1,
0.4604243, 1.336622, -0.7120052, 0, 0.07058824, 1, 1,
0.4623448, -1.293738, 4.150285, 0, 0.0627451, 1, 1,
0.4633887, -0.3132974, 1.796608, 0, 0.05882353, 1, 1,
0.4642176, 0.2874278, 0.3375823, 0, 0.05098039, 1, 1,
0.4694723, 0.5565308, 1.338908, 0, 0.04705882, 1, 1,
0.475165, 0.2721579, 1.560647, 0, 0.03921569, 1, 1,
0.478967, 2.867467, 0.4285254, 0, 0.03529412, 1, 1,
0.4819179, 0.162071, -1.307895, 0, 0.02745098, 1, 1,
0.4854732, 1.51883, 1.55608, 0, 0.02352941, 1, 1,
0.4861332, 0.4163568, 2.155604, 0, 0.01568628, 1, 1,
0.4906651, 1.178072, -0.3545539, 0, 0.01176471, 1, 1,
0.4960472, -0.08522429, 0.6947514, 0, 0.003921569, 1, 1,
0.5010083, -0.1939303, 2.675713, 0.003921569, 0, 1, 1,
0.5122797, 0.5518874, 1.089461, 0.007843138, 0, 1, 1,
0.5132605, 0.0845321, 2.790309, 0.01568628, 0, 1, 1,
0.5174075, -0.6273589, 3.716931, 0.01960784, 0, 1, 1,
0.5276951, -1.891413, 2.544491, 0.02745098, 0, 1, 1,
0.5328773, 0.06409779, 0.5342761, 0.03137255, 0, 1, 1,
0.5368693, -2.341282, 4.110074, 0.03921569, 0, 1, 1,
0.5414691, 0.5393066, 2.238692, 0.04313726, 0, 1, 1,
0.54614, 1.430062, -0.910207, 0.05098039, 0, 1, 1,
0.5462776, 1.313718, -0.4333537, 0.05490196, 0, 1, 1,
0.5473688, -0.2200665, 2.452588, 0.0627451, 0, 1, 1,
0.5511606, 1.683314, -0.2482907, 0.06666667, 0, 1, 1,
0.5523406, 1.590572, 0.9172077, 0.07450981, 0, 1, 1,
0.5535613, -1.258186, 3.356663, 0.07843138, 0, 1, 1,
0.5575455, -0.460762, 3.435514, 0.08627451, 0, 1, 1,
0.5614946, -0.2341904, 2.045076, 0.09019608, 0, 1, 1,
0.5666883, 0.3701426, 0.1739835, 0.09803922, 0, 1, 1,
0.5706636, -0.6466483, 2.707443, 0.1058824, 0, 1, 1,
0.5718919, -0.5604318, 1.509829, 0.1098039, 0, 1, 1,
0.5725026, 1.183803, 0.6458828, 0.1176471, 0, 1, 1,
0.5744274, 0.03190329, -0.9253423, 0.1215686, 0, 1, 1,
0.5826813, -1.308892, 2.018562, 0.1294118, 0, 1, 1,
0.5847523, 0.7332284, 0.8618731, 0.1333333, 0, 1, 1,
0.5875026, 0.7954947, 0.501789, 0.1411765, 0, 1, 1,
0.5896739, 0.5865362, 1.235719, 0.145098, 0, 1, 1,
0.5902928, -1.053161, 1.618106, 0.1529412, 0, 1, 1,
0.5916018, 0.6982784, 1.939942, 0.1568628, 0, 1, 1,
0.5929319, 0.916723, 1.268811, 0.1647059, 0, 1, 1,
0.5935907, -1.696024, 3.115234, 0.1686275, 0, 1, 1,
0.5948661, -0.428927, 3.036461, 0.1764706, 0, 1, 1,
0.5952283, 0.4949311, 1.751134, 0.1803922, 0, 1, 1,
0.5992633, -0.892349, 3.672222, 0.1882353, 0, 1, 1,
0.6001377, -1.168764, 3.013386, 0.1921569, 0, 1, 1,
0.6001606, 0.7055209, -1.008901, 0.2, 0, 1, 1,
0.6034009, -0.5319759, 0.5716141, 0.2078431, 0, 1, 1,
0.6038916, -0.8849916, 2.405966, 0.2117647, 0, 1, 1,
0.6040906, -0.3776162, 2.804638, 0.2196078, 0, 1, 1,
0.6063617, 0.5499691, 0.8402459, 0.2235294, 0, 1, 1,
0.6160911, -0.8109161, 1.81544, 0.2313726, 0, 1, 1,
0.6167034, 0.8504937, 1.09002, 0.2352941, 0, 1, 1,
0.6171548, 0.3344074, 0.8874376, 0.2431373, 0, 1, 1,
0.6172009, 0.1746734, -0.2955773, 0.2470588, 0, 1, 1,
0.6172522, -1.531933, 2.226808, 0.254902, 0, 1, 1,
0.6227069, -0.00789398, 1.77185, 0.2588235, 0, 1, 1,
0.6245823, -1.077319, 3.752824, 0.2666667, 0, 1, 1,
0.6265922, -1.791108, 3.015717, 0.2705882, 0, 1, 1,
0.6270547, -0.1126816, 2.029634, 0.2784314, 0, 1, 1,
0.6286514, -0.8620046, 1.190016, 0.282353, 0, 1, 1,
0.6308373, -0.006922624, 1.638583, 0.2901961, 0, 1, 1,
0.6394398, -0.5210571, 3.155114, 0.2941177, 0, 1, 1,
0.6423198, -0.04304734, 2.114501, 0.3019608, 0, 1, 1,
0.6426108, 0.6866837, 0.746416, 0.3098039, 0, 1, 1,
0.6432564, -1.608453, 2.670741, 0.3137255, 0, 1, 1,
0.649852, -0.9945443, 2.587963, 0.3215686, 0, 1, 1,
0.6503024, -0.6404169, 2.629773, 0.3254902, 0, 1, 1,
0.6518844, -1.224793, 2.030891, 0.3333333, 0, 1, 1,
0.6530141, -0.2764451, 3.202132, 0.3372549, 0, 1, 1,
0.654141, 1.559559, -0.3484759, 0.345098, 0, 1, 1,
0.6579044, -0.8032812, 3.479156, 0.3490196, 0, 1, 1,
0.6579812, 2.046051, 0.10398, 0.3568628, 0, 1, 1,
0.6584234, 0.7224641, -0.2674538, 0.3607843, 0, 1, 1,
0.6619641, 0.01772659, 0.8362683, 0.3686275, 0, 1, 1,
0.6661123, 0.1441071, -0.8368397, 0.372549, 0, 1, 1,
0.6673194, 0.01566201, 1.497585, 0.3803922, 0, 1, 1,
0.6680686, 0.1385078, -0.03639341, 0.3843137, 0, 1, 1,
0.6692641, -0.1202706, 1.006028, 0.3921569, 0, 1, 1,
0.6695489, -0.1357541, 1.236258, 0.3960784, 0, 1, 1,
0.6722047, 0.388632, 1.696088, 0.4039216, 0, 1, 1,
0.6744276, 1.289635, 1.359467, 0.4117647, 0, 1, 1,
0.6755655, -0.184156, 1.802525, 0.4156863, 0, 1, 1,
0.6772603, -0.5083593, 0.3417109, 0.4235294, 0, 1, 1,
0.6799591, 0.2560731, 1.093912, 0.427451, 0, 1, 1,
0.682953, -1.083094, 3.091434, 0.4352941, 0, 1, 1,
0.6845831, 0.05641044, 1.794124, 0.4392157, 0, 1, 1,
0.6871362, 0.5254023, -0.1661633, 0.4470588, 0, 1, 1,
0.6880006, -1.461822, 3.334315, 0.4509804, 0, 1, 1,
0.6988162, -1.434959, 2.949784, 0.4588235, 0, 1, 1,
0.7021996, 1.566316, 1.091205, 0.4627451, 0, 1, 1,
0.7073343, -1.294588, 1.849029, 0.4705882, 0, 1, 1,
0.7081019, 1.537267, 0.5947501, 0.4745098, 0, 1, 1,
0.7105753, 1.308099, 0.7900201, 0.4823529, 0, 1, 1,
0.711811, 0.5932308, -0.1176689, 0.4862745, 0, 1, 1,
0.7123793, 0.8186187, 1.246426, 0.4941176, 0, 1, 1,
0.7179435, -0.7861267, 2.990153, 0.5019608, 0, 1, 1,
0.7181004, -1.173303, 3.037646, 0.5058824, 0, 1, 1,
0.7206197, -0.448171, 1.726796, 0.5137255, 0, 1, 1,
0.7213814, -0.9914954, 3.167434, 0.5176471, 0, 1, 1,
0.7322302, 2.239407, 1.322609, 0.5254902, 0, 1, 1,
0.7330741, -1.175859, 2.3355, 0.5294118, 0, 1, 1,
0.734493, -0.9023581, 3.212737, 0.5372549, 0, 1, 1,
0.7375658, 0.356951, 0.2761531, 0.5411765, 0, 1, 1,
0.740006, -0.06073986, 2.451145, 0.5490196, 0, 1, 1,
0.7403395, 0.6694218, 0.1257994, 0.5529412, 0, 1, 1,
0.7406048, -1.579756, 0.8264682, 0.5607843, 0, 1, 1,
0.7453657, 2.190777, 1.41936, 0.5647059, 0, 1, 1,
0.7510451, 2.44038, 0.6509198, 0.572549, 0, 1, 1,
0.7539895, 1.262828, 2.325574, 0.5764706, 0, 1, 1,
0.7573199, 0.9705297, -1.665315, 0.5843138, 0, 1, 1,
0.7588706, 0.2522644, 0.8449396, 0.5882353, 0, 1, 1,
0.763304, -0.03260976, 1.387376, 0.5960785, 0, 1, 1,
0.7722672, -0.3618438, 1.195469, 0.6039216, 0, 1, 1,
0.7742577, 0.3985788, 1.499395, 0.6078432, 0, 1, 1,
0.7744564, -0.4155114, 1.402861, 0.6156863, 0, 1, 1,
0.7751778, -0.9016356, 5.03523, 0.6196079, 0, 1, 1,
0.7763744, 0.408333, 1.810748, 0.627451, 0, 1, 1,
0.781503, -0.1202307, 1.11973, 0.6313726, 0, 1, 1,
0.788457, 0.2340226, 1.487584, 0.6392157, 0, 1, 1,
0.7910027, -0.9851301, 1.765395, 0.6431373, 0, 1, 1,
0.7957821, 0.7659861, -1.155301, 0.6509804, 0, 1, 1,
0.8000993, 0.1166131, 2.322821, 0.654902, 0, 1, 1,
0.8010226, 1.572041, 0.1222695, 0.6627451, 0, 1, 1,
0.8011452, 1.007293, 0.634667, 0.6666667, 0, 1, 1,
0.8028124, -1.202957, 3.751222, 0.6745098, 0, 1, 1,
0.8043659, -1.002876, 4.04018, 0.6784314, 0, 1, 1,
0.8074001, 0.5381795, 0.06065183, 0.6862745, 0, 1, 1,
0.8075993, -0.3228318, 0.2586483, 0.6901961, 0, 1, 1,
0.8076972, -0.1806035, 0.6567737, 0.6980392, 0, 1, 1,
0.8198175, 0.02657782, 0.570017, 0.7058824, 0, 1, 1,
0.8254175, 1.551167, 1.312617, 0.7098039, 0, 1, 1,
0.8256317, -2.747738, 4.10778, 0.7176471, 0, 1, 1,
0.8279539, 0.2307835, 1.62868, 0.7215686, 0, 1, 1,
0.8331373, -0.1006916, 2.860008, 0.7294118, 0, 1, 1,
0.8332427, 0.6542702, 1.147505, 0.7333333, 0, 1, 1,
0.839301, -0.8998107, 1.596326, 0.7411765, 0, 1, 1,
0.8428381, -1.043422, 2.807848, 0.7450981, 0, 1, 1,
0.8451619, -0.4338724, 2.703749, 0.7529412, 0, 1, 1,
0.8484451, -0.4625289, 0.4299537, 0.7568628, 0, 1, 1,
0.8524878, -0.3998977, 4.244449, 0.7647059, 0, 1, 1,
0.8526271, -0.3673068, 2.058295, 0.7686275, 0, 1, 1,
0.8536013, 0.904079, -0.04192629, 0.7764706, 0, 1, 1,
0.8574553, -1.60769, 3.558334, 0.7803922, 0, 1, 1,
0.8580586, 1.098726, 0.291102, 0.7882353, 0, 1, 1,
0.8618824, 0.601197, 1.750815, 0.7921569, 0, 1, 1,
0.873493, 1.141688, 0.5603037, 0.8, 0, 1, 1,
0.8744906, -0.148287, 2.294996, 0.8078431, 0, 1, 1,
0.8805991, -1.356397, 3.205137, 0.8117647, 0, 1, 1,
0.883881, 1.08512, -0.560764, 0.8196079, 0, 1, 1,
0.8874461, -0.3490621, 1.235186, 0.8235294, 0, 1, 1,
0.9010997, 0.5867097, 1.609346, 0.8313726, 0, 1, 1,
0.9019177, -0.1909625, 1.172683, 0.8352941, 0, 1, 1,
0.9260372, 0.6628774, 0.1048641, 0.8431373, 0, 1, 1,
0.9301225, -0.6512941, 1.437902, 0.8470588, 0, 1, 1,
0.9344791, -1.268493, 1.298344, 0.854902, 0, 1, 1,
0.9351364, -0.6945045, 2.267917, 0.8588235, 0, 1, 1,
0.9377463, 0.9855173, -0.5393973, 0.8666667, 0, 1, 1,
0.9380902, 0.3353917, 0.6724682, 0.8705882, 0, 1, 1,
0.9430215, -1.680278, 2.269714, 0.8784314, 0, 1, 1,
0.9431998, 0.650066, 1.996638, 0.8823529, 0, 1, 1,
0.9470643, 1.939737, 0.3378056, 0.8901961, 0, 1, 1,
0.9482245, -0.3040113, 1.571317, 0.8941177, 0, 1, 1,
0.9489984, -0.05159381, 0.3867883, 0.9019608, 0, 1, 1,
0.9556465, 2.118281, 1.508925, 0.9098039, 0, 1, 1,
0.9591786, 0.1467867, 1.002001, 0.9137255, 0, 1, 1,
0.9646553, -0.5675138, 4.340575, 0.9215686, 0, 1, 1,
0.9650063, -0.3419683, 3.554463, 0.9254902, 0, 1, 1,
0.9673578, -1.356207, 3.542732, 0.9333333, 0, 1, 1,
0.9703027, -0.1372977, 2.999556, 0.9372549, 0, 1, 1,
0.9716823, 0.7822461, 3.040823, 0.945098, 0, 1, 1,
0.9737868, -0.8784761, 2.730701, 0.9490196, 0, 1, 1,
0.9771608, -0.162401, 1.831197, 0.9568627, 0, 1, 1,
0.9794667, 0.1789638, -0.4186512, 0.9607843, 0, 1, 1,
0.9816473, 0.04689823, 0.6963475, 0.9686275, 0, 1, 1,
0.9892372, 0.1293543, 0.7647688, 0.972549, 0, 1, 1,
0.990018, -0.7702873, 2.465474, 0.9803922, 0, 1, 1,
0.9901994, -0.0002743504, 2.321167, 0.9843137, 0, 1, 1,
1.002211, -1.942726, 2.688433, 0.9921569, 0, 1, 1,
1.004626, -1.354592, 0.2359871, 0.9960784, 0, 1, 1,
1.004844, -0.1925481, 2.009669, 1, 0, 0.9960784, 1,
1.006929, 0.849779, -0.4926244, 1, 0, 0.9882353, 1,
1.00777, -0.2227506, 2.281168, 1, 0, 0.9843137, 1,
1.014798, 2.004513, -0.6113356, 1, 0, 0.9764706, 1,
1.018392, -0.4185765, 1.784185, 1, 0, 0.972549, 1,
1.018804, -1.188647, 1.569737, 1, 0, 0.9647059, 1,
1.020239, -1.450756, 1.404549, 1, 0, 0.9607843, 1,
1.025476, -0.7570133, 3.240243, 1, 0, 0.9529412, 1,
1.03041, -0.3310348, 3.107376, 1, 0, 0.9490196, 1,
1.034367, 0.7439996, 0.7474371, 1, 0, 0.9411765, 1,
1.036835, 0.1214048, 0.8215029, 1, 0, 0.9372549, 1,
1.040771, -1.633162, 0.5996693, 1, 0, 0.9294118, 1,
1.045354, 0.3272754, 1.823939, 1, 0, 0.9254902, 1,
1.051227, 0.1595154, 1.800587, 1, 0, 0.9176471, 1,
1.053366, -0.009684303, 3.587101, 1, 0, 0.9137255, 1,
1.055631, -1.56302, 2.962913, 1, 0, 0.9058824, 1,
1.058884, -0.667405, 2.698864, 1, 0, 0.9019608, 1,
1.06112, -0.1436847, 1.790186, 1, 0, 0.8941177, 1,
1.069357, 0.07676625, 0.007175372, 1, 0, 0.8862745, 1,
1.07483, -0.05117884, 2.377386, 1, 0, 0.8823529, 1,
1.077839, 2.97452, -0.3809015, 1, 0, 0.8745098, 1,
1.078424, 0.1541252, 0.946285, 1, 0, 0.8705882, 1,
1.08342, -1.811489, 2.692111, 1, 0, 0.8627451, 1,
1.089503, -1.257706, 2.537459, 1, 0, 0.8588235, 1,
1.090626, -1.821651, 2.190181, 1, 0, 0.8509804, 1,
1.091224, -0.06447843, 1.131892, 1, 0, 0.8470588, 1,
1.098517, -0.7567161, -0.4878043, 1, 0, 0.8392157, 1,
1.108464, -0.6624446, 2.514557, 1, 0, 0.8352941, 1,
1.110431, 0.9255441, 0.7751608, 1, 0, 0.827451, 1,
1.112107, 0.3328696, 0.3936115, 1, 0, 0.8235294, 1,
1.113594, -1.271695, 2.25764, 1, 0, 0.8156863, 1,
1.123075, -1.38199, 2.505799, 1, 0, 0.8117647, 1,
1.124019, 0.5541879, 2.71101, 1, 0, 0.8039216, 1,
1.124678, -0.2139467, 2.23282, 1, 0, 0.7960784, 1,
1.127153, -0.5326632, 2.456505, 1, 0, 0.7921569, 1,
1.129683, -0.2347102, 1.103333, 1, 0, 0.7843137, 1,
1.129807, -2.747599, 2.451126, 1, 0, 0.7803922, 1,
1.136802, 1.057071, 1.738241, 1, 0, 0.772549, 1,
1.148979, -0.9897742, 3.899575, 1, 0, 0.7686275, 1,
1.160397, -0.2613445, 2.440513, 1, 0, 0.7607843, 1,
1.160667, 1.641567, 1.944425, 1, 0, 0.7568628, 1,
1.164365, -1.185585, 1.621124, 1, 0, 0.7490196, 1,
1.165664, -0.2381585, 1.502856, 1, 0, 0.7450981, 1,
1.166785, 0.2906923, 2.066543, 1, 0, 0.7372549, 1,
1.187497, -1.374147, 2.67218, 1, 0, 0.7333333, 1,
1.191249, 0.3021758, 1.214862, 1, 0, 0.7254902, 1,
1.199705, 0.2737609, 1.911245, 1, 0, 0.7215686, 1,
1.200766, 0.9112069, 1.774377, 1, 0, 0.7137255, 1,
1.215118, -1.346301, 2.223727, 1, 0, 0.7098039, 1,
1.2355, -0.8413969, 0.7629868, 1, 0, 0.7019608, 1,
1.239156, -0.2138965, 2.471304, 1, 0, 0.6941177, 1,
1.240663, -0.3471738, 0.8117841, 1, 0, 0.6901961, 1,
1.246243, -0.9182183, 3.148171, 1, 0, 0.682353, 1,
1.24685, 0.08729107, 1.56108, 1, 0, 0.6784314, 1,
1.259414, -1.316848, 1.017803, 1, 0, 0.6705883, 1,
1.261284, 0.4218514, 1.849839, 1, 0, 0.6666667, 1,
1.263319, -0.04292369, 0.8857613, 1, 0, 0.6588235, 1,
1.264097, 1.603799, 0.8146187, 1, 0, 0.654902, 1,
1.270757, 0.9907939, -0.7755741, 1, 0, 0.6470588, 1,
1.271329, 0.858515, 0.6966416, 1, 0, 0.6431373, 1,
1.28642, -0.4224711, 3.264194, 1, 0, 0.6352941, 1,
1.290846, -0.5219674, 3.338628, 1, 0, 0.6313726, 1,
1.295146, -1.575414, 3.519599, 1, 0, 0.6235294, 1,
1.29839, -0.2359328, -0.5874997, 1, 0, 0.6196079, 1,
1.299353, 0.8020267, 0.7115247, 1, 0, 0.6117647, 1,
1.302377, -0.4778755, 2.674376, 1, 0, 0.6078432, 1,
1.322518, -0.9351943, 3.86142, 1, 0, 0.6, 1,
1.32587, 0.6204495, 0.8151008, 1, 0, 0.5921569, 1,
1.341769, 0.02205876, 0.3648382, 1, 0, 0.5882353, 1,
1.351082, 0.1501241, 0.3415563, 1, 0, 0.5803922, 1,
1.352395, 1.512958, 0.6486431, 1, 0, 0.5764706, 1,
1.361845, -0.009889446, -0.2785817, 1, 0, 0.5686275, 1,
1.362822, 1.964067, 0.3165485, 1, 0, 0.5647059, 1,
1.364912, 2.401525, 1.799199, 1, 0, 0.5568628, 1,
1.368461, 0.1374576, 1.760867, 1, 0, 0.5529412, 1,
1.371023, 1.844331, 1.494626, 1, 0, 0.5450981, 1,
1.37988, 0.3801749, 1.766122, 1, 0, 0.5411765, 1,
1.390823, 2.619418, -1.154298, 1, 0, 0.5333334, 1,
1.4046, 0.9980533, 2.443739, 1, 0, 0.5294118, 1,
1.412903, -0.8550923, 2.176698, 1, 0, 0.5215687, 1,
1.414947, 0.4000084, 2.235317, 1, 0, 0.5176471, 1,
1.415348, 0.9303998, -1.232324, 1, 0, 0.509804, 1,
1.416616, -0.09946959, 0.3356435, 1, 0, 0.5058824, 1,
1.421076, -1.382456, 0.2158083, 1, 0, 0.4980392, 1,
1.421608, 0.9192546, 2.590563, 1, 0, 0.4901961, 1,
1.424208, -0.5942667, 0.7543831, 1, 0, 0.4862745, 1,
1.427933, 0.5521595, 0.103066, 1, 0, 0.4784314, 1,
1.428378, -0.5530813, 0.633827, 1, 0, 0.4745098, 1,
1.467185, 1.680594, -1.928259, 1, 0, 0.4666667, 1,
1.471107, -2.963198, 3.337897, 1, 0, 0.4627451, 1,
1.487131, -0.1173487, 2.441796, 1, 0, 0.454902, 1,
1.491415, 0.236028, -0.08463973, 1, 0, 0.4509804, 1,
1.495449, 1.962265, 2.640625, 1, 0, 0.4431373, 1,
1.495712, -0.5453494, 3.811652, 1, 0, 0.4392157, 1,
1.495796, -2.974102, 0.8137609, 1, 0, 0.4313726, 1,
1.505205, 1.50596, 1.691976, 1, 0, 0.427451, 1,
1.508154, 1.416118, 0.6717012, 1, 0, 0.4196078, 1,
1.515858, -0.153152, -0.5100171, 1, 0, 0.4156863, 1,
1.51673, -1.078871, 4.365253, 1, 0, 0.4078431, 1,
1.525912, -0.2293761, 1.132909, 1, 0, 0.4039216, 1,
1.530388, -0.2571013, 1.084035, 1, 0, 0.3960784, 1,
1.531489, 1.296324, 1.014194, 1, 0, 0.3882353, 1,
1.532827, 2.147321, 0.2917524, 1, 0, 0.3843137, 1,
1.538816, -0.8245003, 1.520326, 1, 0, 0.3764706, 1,
1.543123, 0.239784, 0.4304218, 1, 0, 0.372549, 1,
1.544926, -1.254008, 4.514296, 1, 0, 0.3647059, 1,
1.554695, 0.7280446, -0.4315466, 1, 0, 0.3607843, 1,
1.557825, -0.3712342, 1.338299, 1, 0, 0.3529412, 1,
1.559832, -0.1133887, 1.97377, 1, 0, 0.3490196, 1,
1.561555, -0.08416756, 2.534012, 1, 0, 0.3411765, 1,
1.56657, 0.8042992, 2.432198, 1, 0, 0.3372549, 1,
1.569766, -1.206197, 2.193313, 1, 0, 0.3294118, 1,
1.573174, -0.1288962, 1.187088, 1, 0, 0.3254902, 1,
1.590749, -1.959227, 2.8454, 1, 0, 0.3176471, 1,
1.593508, 0.9566488, 1.362894, 1, 0, 0.3137255, 1,
1.597617, 0.8133212, 0.553122, 1, 0, 0.3058824, 1,
1.599121, -1.196544, 3.264868, 1, 0, 0.2980392, 1,
1.633767, -0.005833697, 0.3133598, 1, 0, 0.2941177, 1,
1.635761, -1.334574, 2.171422, 1, 0, 0.2862745, 1,
1.651377, 0.8488643, 1.590794, 1, 0, 0.282353, 1,
1.662459, 1.168735, 1.740987, 1, 0, 0.2745098, 1,
1.697215, 0.7375119, 1.226745, 1, 0, 0.2705882, 1,
1.71087, 1.301078, 0.9305789, 1, 0, 0.2627451, 1,
1.718792, 0.8893686, 2.900957, 1, 0, 0.2588235, 1,
1.722948, -1.736152, 1.513261, 1, 0, 0.2509804, 1,
1.723455, 1.422172, 0.3216077, 1, 0, 0.2470588, 1,
1.742035, -1.916191, 1.589758, 1, 0, 0.2392157, 1,
1.742146, -0.1443686, 1.2698, 1, 0, 0.2352941, 1,
1.818511, -0.9162698, 1.902706, 1, 0, 0.227451, 1,
1.819487, -0.04807215, 1.952748, 1, 0, 0.2235294, 1,
1.836904, 1.034345, 2.802954, 1, 0, 0.2156863, 1,
1.844018, 1.230138, 1.453472, 1, 0, 0.2117647, 1,
1.84548, -0.104449, 1.517632, 1, 0, 0.2039216, 1,
1.845842, -0.1884432, 0.3736622, 1, 0, 0.1960784, 1,
1.870321, -0.158375, 0.7011454, 1, 0, 0.1921569, 1,
1.88147, 1.708667, 1.719348, 1, 0, 0.1843137, 1,
1.909328, -0.02555034, 0.557409, 1, 0, 0.1803922, 1,
1.928596, -0.8288099, 1.43066, 1, 0, 0.172549, 1,
1.936206, 0.5276084, 2.633147, 1, 0, 0.1686275, 1,
1.940619, -0.4758809, 3.661436, 1, 0, 0.1607843, 1,
1.953212, -0.3250624, 1.978762, 1, 0, 0.1568628, 1,
1.997679, -0.4161482, 1.347618, 1, 0, 0.1490196, 1,
2.019176, 0.4097544, 3.678093, 1, 0, 0.145098, 1,
2.022753, -1.138235, 1.443896, 1, 0, 0.1372549, 1,
2.025536, 0.1829603, 0.8999019, 1, 0, 0.1333333, 1,
2.050444, 1.680137, -0.4212945, 1, 0, 0.1254902, 1,
2.05118, 0.9859802, 0.5031385, 1, 0, 0.1215686, 1,
2.065253, 0.6722592, 1.708958, 1, 0, 0.1137255, 1,
2.082472, -1.117643, 4.66623, 1, 0, 0.1098039, 1,
2.103423, 0.537134, 1.606207, 1, 0, 0.1019608, 1,
2.109936, 0.2065119, 1.248895, 1, 0, 0.09411765, 1,
2.15637, -0.2803478, 1.796946, 1, 0, 0.09019608, 1,
2.174604, -0.2503525, 2.15895, 1, 0, 0.08235294, 1,
2.228111, -0.3667491, 1.672537, 1, 0, 0.07843138, 1,
2.231768, -0.7591529, 1.789011, 1, 0, 0.07058824, 1,
2.235444, -0.04827702, 2.91219, 1, 0, 0.06666667, 1,
2.258239, 1.430236, 1.877355, 1, 0, 0.05882353, 1,
2.302418, 0.01253409, 0.9649273, 1, 0, 0.05490196, 1,
2.416358, 1.393002, 0.9366149, 1, 0, 0.04705882, 1,
2.43269, 0.9984958, 2.799218, 1, 0, 0.04313726, 1,
2.63052, 0.9695989, 1.174049, 1, 0, 0.03529412, 1,
2.666721, -1.594517, 1.677616, 1, 0, 0.03137255, 1,
2.763962, -0.9135292, 1.221351, 1, 0, 0.02352941, 1,
2.817716, -0.1545857, 0.9564583, 1, 0, 0.01960784, 1,
2.861658, 0.05090936, 0.977654, 1, 0, 0.01176471, 1,
3.222251, -1.033116, 0.9880002, 1, 0, 0.007843138, 1
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
-0.09519482, -4.044005, -7.287453, 0, -0.5, 0.5, 0.5,
-0.09519482, -4.044005, -7.287453, 1, -0.5, 0.5, 0.5,
-0.09519482, -4.044005, -7.287453, 1, 1.5, 0.5, 0.5,
-0.09519482, -4.044005, -7.287453, 0, 1.5, 0.5, 0.5
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
-4.537254, 0.181954, -7.287453, 0, -0.5, 0.5, 0.5,
-4.537254, 0.181954, -7.287453, 1, -0.5, 0.5, 0.5,
-4.537254, 0.181954, -7.287453, 1, 1.5, 0.5, 0.5,
-4.537254, 0.181954, -7.287453, 0, 1.5, 0.5, 0.5
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
-4.537254, -4.044005, -0.1702595, 0, -0.5, 0.5, 0.5,
-4.537254, -4.044005, -0.1702595, 1, -0.5, 0.5, 0.5,
-4.537254, -4.044005, -0.1702595, 1, 1.5, 0.5, 0.5,
-4.537254, -4.044005, -0.1702595, 0, 1.5, 0.5, 0.5
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
-3, -3.068784, -5.645023,
3, -3.068784, -5.645023,
-3, -3.068784, -5.645023,
-3, -3.231321, -5.918762,
-2, -3.068784, -5.645023,
-2, -3.231321, -5.918762,
-1, -3.068784, -5.645023,
-1, -3.231321, -5.918762,
0, -3.068784, -5.645023,
0, -3.231321, -5.918762,
1, -3.068784, -5.645023,
1, -3.231321, -5.918762,
2, -3.068784, -5.645023,
2, -3.231321, -5.918762,
3, -3.068784, -5.645023,
3, -3.231321, -5.918762
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
-3, -3.556394, -6.466238, 0, -0.5, 0.5, 0.5,
-3, -3.556394, -6.466238, 1, -0.5, 0.5, 0.5,
-3, -3.556394, -6.466238, 1, 1.5, 0.5, 0.5,
-3, -3.556394, -6.466238, 0, 1.5, 0.5, 0.5,
-2, -3.556394, -6.466238, 0, -0.5, 0.5, 0.5,
-2, -3.556394, -6.466238, 1, -0.5, 0.5, 0.5,
-2, -3.556394, -6.466238, 1, 1.5, 0.5, 0.5,
-2, -3.556394, -6.466238, 0, 1.5, 0.5, 0.5,
-1, -3.556394, -6.466238, 0, -0.5, 0.5, 0.5,
-1, -3.556394, -6.466238, 1, -0.5, 0.5, 0.5,
-1, -3.556394, -6.466238, 1, 1.5, 0.5, 0.5,
-1, -3.556394, -6.466238, 0, 1.5, 0.5, 0.5,
0, -3.556394, -6.466238, 0, -0.5, 0.5, 0.5,
0, -3.556394, -6.466238, 1, -0.5, 0.5, 0.5,
0, -3.556394, -6.466238, 1, 1.5, 0.5, 0.5,
0, -3.556394, -6.466238, 0, 1.5, 0.5, 0.5,
1, -3.556394, -6.466238, 0, -0.5, 0.5, 0.5,
1, -3.556394, -6.466238, 1, -0.5, 0.5, 0.5,
1, -3.556394, -6.466238, 1, 1.5, 0.5, 0.5,
1, -3.556394, -6.466238, 0, 1.5, 0.5, 0.5,
2, -3.556394, -6.466238, 0, -0.5, 0.5, 0.5,
2, -3.556394, -6.466238, 1, -0.5, 0.5, 0.5,
2, -3.556394, -6.466238, 1, 1.5, 0.5, 0.5,
2, -3.556394, -6.466238, 0, 1.5, 0.5, 0.5,
3, -3.556394, -6.466238, 0, -0.5, 0.5, 0.5,
3, -3.556394, -6.466238, 1, -0.5, 0.5, 0.5,
3, -3.556394, -6.466238, 1, 1.5, 0.5, 0.5,
3, -3.556394, -6.466238, 0, 1.5, 0.5, 0.5
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
-3.512164, -2, -5.645023,
-3.512164, 3, -5.645023,
-3.512164, -2, -5.645023,
-3.683012, -2, -5.918762,
-3.512164, -1, -5.645023,
-3.683012, -1, -5.918762,
-3.512164, 0, -5.645023,
-3.683012, 0, -5.918762,
-3.512164, 1, -5.645023,
-3.683012, 1, -5.918762,
-3.512164, 2, -5.645023,
-3.683012, 2, -5.918762,
-3.512164, 3, -5.645023,
-3.683012, 3, -5.918762
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
-4.024709, -2, -6.466238, 0, -0.5, 0.5, 0.5,
-4.024709, -2, -6.466238, 1, -0.5, 0.5, 0.5,
-4.024709, -2, -6.466238, 1, 1.5, 0.5, 0.5,
-4.024709, -2, -6.466238, 0, 1.5, 0.5, 0.5,
-4.024709, -1, -6.466238, 0, -0.5, 0.5, 0.5,
-4.024709, -1, -6.466238, 1, -0.5, 0.5, 0.5,
-4.024709, -1, -6.466238, 1, 1.5, 0.5, 0.5,
-4.024709, -1, -6.466238, 0, 1.5, 0.5, 0.5,
-4.024709, 0, -6.466238, 0, -0.5, 0.5, 0.5,
-4.024709, 0, -6.466238, 1, -0.5, 0.5, 0.5,
-4.024709, 0, -6.466238, 1, 1.5, 0.5, 0.5,
-4.024709, 0, -6.466238, 0, 1.5, 0.5, 0.5,
-4.024709, 1, -6.466238, 0, -0.5, 0.5, 0.5,
-4.024709, 1, -6.466238, 1, -0.5, 0.5, 0.5,
-4.024709, 1, -6.466238, 1, 1.5, 0.5, 0.5,
-4.024709, 1, -6.466238, 0, 1.5, 0.5, 0.5,
-4.024709, 2, -6.466238, 0, -0.5, 0.5, 0.5,
-4.024709, 2, -6.466238, 1, -0.5, 0.5, 0.5,
-4.024709, 2, -6.466238, 1, 1.5, 0.5, 0.5,
-4.024709, 2, -6.466238, 0, 1.5, 0.5, 0.5,
-4.024709, 3, -6.466238, 0, -0.5, 0.5, 0.5,
-4.024709, 3, -6.466238, 1, -0.5, 0.5, 0.5,
-4.024709, 3, -6.466238, 1, 1.5, 0.5, 0.5,
-4.024709, 3, -6.466238, 0, 1.5, 0.5, 0.5
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
-3.512164, -3.068784, -4,
-3.512164, -3.068784, 4,
-3.512164, -3.068784, -4,
-3.683012, -3.231321, -4,
-3.512164, -3.068784, -2,
-3.683012, -3.231321, -2,
-3.512164, -3.068784, 0,
-3.683012, -3.231321, 0,
-3.512164, -3.068784, 2,
-3.683012, -3.231321, 2,
-3.512164, -3.068784, 4,
-3.683012, -3.231321, 4
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
-4.024709, -3.556394, -4, 0, -0.5, 0.5, 0.5,
-4.024709, -3.556394, -4, 1, -0.5, 0.5, 0.5,
-4.024709, -3.556394, -4, 1, 1.5, 0.5, 0.5,
-4.024709, -3.556394, -4, 0, 1.5, 0.5, 0.5,
-4.024709, -3.556394, -2, 0, -0.5, 0.5, 0.5,
-4.024709, -3.556394, -2, 1, -0.5, 0.5, 0.5,
-4.024709, -3.556394, -2, 1, 1.5, 0.5, 0.5,
-4.024709, -3.556394, -2, 0, 1.5, 0.5, 0.5,
-4.024709, -3.556394, 0, 0, -0.5, 0.5, 0.5,
-4.024709, -3.556394, 0, 1, -0.5, 0.5, 0.5,
-4.024709, -3.556394, 0, 1, 1.5, 0.5, 0.5,
-4.024709, -3.556394, 0, 0, 1.5, 0.5, 0.5,
-4.024709, -3.556394, 2, 0, -0.5, 0.5, 0.5,
-4.024709, -3.556394, 2, 1, -0.5, 0.5, 0.5,
-4.024709, -3.556394, 2, 1, 1.5, 0.5, 0.5,
-4.024709, -3.556394, 2, 0, 1.5, 0.5, 0.5,
-4.024709, -3.556394, 4, 0, -0.5, 0.5, 0.5,
-4.024709, -3.556394, 4, 1, -0.5, 0.5, 0.5,
-4.024709, -3.556394, 4, 1, 1.5, 0.5, 0.5,
-4.024709, -3.556394, 4, 0, 1.5, 0.5, 0.5
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
-3.512164, -3.068784, -5.645023,
-3.512164, 3.432692, -5.645023,
-3.512164, -3.068784, 5.304504,
-3.512164, 3.432692, 5.304504,
-3.512164, -3.068784, -5.645023,
-3.512164, -3.068784, 5.304504,
-3.512164, 3.432692, -5.645023,
-3.512164, 3.432692, 5.304504,
-3.512164, -3.068784, -5.645023,
3.321774, -3.068784, -5.645023,
-3.512164, -3.068784, 5.304504,
3.321774, -3.068784, 5.304504,
-3.512164, 3.432692, -5.645023,
3.321774, 3.432692, -5.645023,
-3.512164, 3.432692, 5.304504,
3.321774, 3.432692, 5.304504,
3.321774, -3.068784, -5.645023,
3.321774, 3.432692, -5.645023,
3.321774, -3.068784, 5.304504,
3.321774, 3.432692, 5.304504,
3.321774, -3.068784, -5.645023,
3.321774, -3.068784, 5.304504,
3.321774, 3.432692, -5.645023,
3.321774, 3.432692, 5.304504
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
var radius = 7.717157;
var distance = 34.3345;
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
mvMatrix.translate( 0.09519482, -0.181954, 0.1702595 );
mvMatrix.scale( 1.220957, 1.283392, 0.7620366 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.3345);
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
Carbofuran<-read.table("Carbofuran.xyz")
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
-3.41264, -0.02552333, -1.454829, 0, 0, 1, 1, 1,
-2.662805, -0.06553127, -1.266714, 1, 0, 0, 1, 1,
-2.529818, 1.315302, -1.578153, 1, 0, 0, 1, 1,
-2.450976, 1.508854, -0.1715575, 1, 0, 0, 1, 1,
-2.325398, -0.5282153, -0.05006444, 1, 0, 0, 1, 1,
-2.303838, 0.0761177, -1.677693, 1, 0, 0, 1, 1,
-2.292217, -0.04698215, -1.894267, 0, 0, 0, 1, 1,
-2.276986, -1.495828, -2.061644, 0, 0, 0, 1, 1,
-2.256829, 0.8782644, -1.980232, 0, 0, 0, 1, 1,
-2.169424, 0.6228742, -3.490659, 0, 0, 0, 1, 1,
-2.152097, -0.6731015, -1.398458, 0, 0, 0, 1, 1,
-2.150422, -1.563221, -2.514327, 0, 0, 0, 1, 1,
-2.122234, -0.277838, -1.533174, 0, 0, 0, 1, 1,
-2.110561, 0.2980476, 0.2331923, 1, 1, 1, 1, 1,
-2.103828, 0.2084807, -2.61212, 1, 1, 1, 1, 1,
-2.046878, 0.6232567, -1.448819, 1, 1, 1, 1, 1,
-2.041582, -0.8560349, -1.52263, 1, 1, 1, 1, 1,
-2.03801, 0.9478974, -1.640471, 1, 1, 1, 1, 1,
-2.018741, -0.3766531, -1.162659, 1, 1, 1, 1, 1,
-2.012387, 0.3103476, -2.310851, 1, 1, 1, 1, 1,
-1.958664, 1.167695, -0.7366873, 1, 1, 1, 1, 1,
-1.958592, 0.301347, -1.732476, 1, 1, 1, 1, 1,
-1.87932, 1.453877, -0.1874458, 1, 1, 1, 1, 1,
-1.878437, 1.311909, -0.7032053, 1, 1, 1, 1, 1,
-1.815139, -0.5074518, -2.822859, 1, 1, 1, 1, 1,
-1.811141, -2.15452, -2.640355, 1, 1, 1, 1, 1,
-1.809203, -0.004849718, -3.025747, 1, 1, 1, 1, 1,
-1.794758, 0.9382234, -0.9801583, 1, 1, 1, 1, 1,
-1.785976, -0.1379976, -2.08209, 0, 0, 1, 1, 1,
-1.775013, -0.7765383, -1.891762, 1, 0, 0, 1, 1,
-1.758461, -0.6750829, -1.543977, 1, 0, 0, 1, 1,
-1.749868, 0.8469207, -1.488132, 1, 0, 0, 1, 1,
-1.739893, -0.7894014, -2.788442, 1, 0, 0, 1, 1,
-1.69604, 0.7631608, -2.213543, 1, 0, 0, 1, 1,
-1.684623, 1.146231, 0.7376174, 0, 0, 0, 1, 1,
-1.677097, 0.5807513, -0.9573849, 0, 0, 0, 1, 1,
-1.673682, 1.087236, -1.649053, 0, 0, 0, 1, 1,
-1.670669, -1.215263, -1.813114, 0, 0, 0, 1, 1,
-1.663143, -1.226728, -1.76896, 0, 0, 0, 1, 1,
-1.659156, -1.174879, -1.682927, 0, 0, 0, 1, 1,
-1.647296, 0.3851415, -0.727624, 0, 0, 0, 1, 1,
-1.639744, -1.025961, -3.208929, 1, 1, 1, 1, 1,
-1.638175, 0.619363, -2.626341, 1, 1, 1, 1, 1,
-1.630965, 0.1328246, -1.54244, 1, 1, 1, 1, 1,
-1.627488, -1.449904, -2.620505, 1, 1, 1, 1, 1,
-1.625418, -1.217679, -0.8995363, 1, 1, 1, 1, 1,
-1.618637, -1.522335, -2.842795, 1, 1, 1, 1, 1,
-1.603144, 0.6932355, -1.101184, 1, 1, 1, 1, 1,
-1.597491, 0.512054, -0.05658537, 1, 1, 1, 1, 1,
-1.59705, -1.533551, -1.408472, 1, 1, 1, 1, 1,
-1.581074, 0.7643266, -1.696222, 1, 1, 1, 1, 1,
-1.578771, -0.7739686, -0.9252363, 1, 1, 1, 1, 1,
-1.569056, -0.8201748, -3.253031, 1, 1, 1, 1, 1,
-1.568764, -1.028622, -0.302155, 1, 1, 1, 1, 1,
-1.562014, -0.9620451, -1.256888, 1, 1, 1, 1, 1,
-1.555089, 1.165218, -1.190543, 1, 1, 1, 1, 1,
-1.552734, 1.165467, -0.6074357, 0, 0, 1, 1, 1,
-1.542462, 1.015555, 0.2734475, 1, 0, 0, 1, 1,
-1.541124, 0.5249437, -0.6069045, 1, 0, 0, 1, 1,
-1.539288, -0.1942795, -1.948769, 1, 0, 0, 1, 1,
-1.532394, 1.343341, -1.394955, 1, 0, 0, 1, 1,
-1.525755, 1.194521, -0.8853652, 1, 0, 0, 1, 1,
-1.52466, -1.340737, -1.037137, 0, 0, 0, 1, 1,
-1.521871, -1.057451, -2.224442, 0, 0, 0, 1, 1,
-1.494793, -0.6163355, -2.39015, 0, 0, 0, 1, 1,
-1.494136, -0.4293828, -1.665536, 0, 0, 0, 1, 1,
-1.484468, -0.3422459, -2.409024, 0, 0, 0, 1, 1,
-1.464091, -0.9795229, -2.975819, 0, 0, 0, 1, 1,
-1.46199, -1.556331, -1.950315, 0, 0, 0, 1, 1,
-1.445654, -1.228273, -2.689448, 1, 1, 1, 1, 1,
-1.44148, 1.977059, 0.3752587, 1, 1, 1, 1, 1,
-1.439503, -1.945791, -3.435819, 1, 1, 1, 1, 1,
-1.425327, -0.9245092, -1.156149, 1, 1, 1, 1, 1,
-1.418226, -0.5961403, -2.049765, 1, 1, 1, 1, 1,
-1.412572, -0.1327109, -0.4142389, 1, 1, 1, 1, 1,
-1.411394, -1.532853, -3.76699, 1, 1, 1, 1, 1,
-1.408829, 1.644393, -1.428123, 1, 1, 1, 1, 1,
-1.405655, 0.1212401, -0.6786658, 1, 1, 1, 1, 1,
-1.403033, -1.121307, -1.386121, 1, 1, 1, 1, 1,
-1.380583, -0.2785172, -0.5096648, 1, 1, 1, 1, 1,
-1.379211, -0.03596394, -2.037178, 1, 1, 1, 1, 1,
-1.378944, 0.03993583, -1.487483, 1, 1, 1, 1, 1,
-1.355141, -1.06884, -3.216553, 1, 1, 1, 1, 1,
-1.349922, 1.999216, -1.13713, 1, 1, 1, 1, 1,
-1.343374, 0.7372766, -0.2391263, 0, 0, 1, 1, 1,
-1.342363, 0.7870179, -1.472152, 1, 0, 0, 1, 1,
-1.338059, -0.1676359, -0.7121267, 1, 0, 0, 1, 1,
-1.327045, 0.588607, -0.7472154, 1, 0, 0, 1, 1,
-1.326802, 0.7501227, 0.2000445, 1, 0, 0, 1, 1,
-1.326282, -0.8988985, -0.5745044, 1, 0, 0, 1, 1,
-1.324777, -0.3592018, -0.8696512, 0, 0, 0, 1, 1,
-1.323505, 0.09462889, -2.932159, 0, 0, 0, 1, 1,
-1.322483, -0.988351, -2.306354, 0, 0, 0, 1, 1,
-1.321553, -1.190282, -2.769931, 0, 0, 0, 1, 1,
-1.317089, -0.3548395, -1.47725, 0, 0, 0, 1, 1,
-1.316122, -1.609882, -2.126078, 0, 0, 0, 1, 1,
-1.314382, 0.04659548, -1.931835, 0, 0, 0, 1, 1,
-1.308015, 1.251097, -0.8343537, 1, 1, 1, 1, 1,
-1.307926, 0.159822, 0.1581762, 1, 1, 1, 1, 1,
-1.290108, -0.1664562, -3.473317, 1, 1, 1, 1, 1,
-1.275831, -0.4418133, -0.6322373, 1, 1, 1, 1, 1,
-1.270908, -1.297665, -1.604059, 1, 1, 1, 1, 1,
-1.268116, 0.3962788, -2.712605, 1, 1, 1, 1, 1,
-1.260034, -0.5260852, -2.231802, 1, 1, 1, 1, 1,
-1.250969, 0.4989736, -1.529489, 1, 1, 1, 1, 1,
-1.247123, 0.06196639, -1.697, 1, 1, 1, 1, 1,
-1.247069, 0.5957556, 0.08652756, 1, 1, 1, 1, 1,
-1.245683, -1.891027, -2.94797, 1, 1, 1, 1, 1,
-1.241722, 0.7507034, -1.192643, 1, 1, 1, 1, 1,
-1.237792, 0.6591618, 0.4474954, 1, 1, 1, 1, 1,
-1.233153, -0.4073038, -2.14712, 1, 1, 1, 1, 1,
-1.206312, 0.3497835, -0.6469763, 1, 1, 1, 1, 1,
-1.193434, -1.866327, -2.850214, 0, 0, 1, 1, 1,
-1.183326, 1.042728, -0.2225283, 1, 0, 0, 1, 1,
-1.183241, -1.356329, -1.685213, 1, 0, 0, 1, 1,
-1.180904, -0.1654234, -0.7136571, 1, 0, 0, 1, 1,
-1.173181, 0.7953602, -2.307492, 1, 0, 0, 1, 1,
-1.172511, -0.4935686, -0.5192498, 1, 0, 0, 1, 1,
-1.170291, 0.5605715, -0.5973979, 0, 0, 0, 1, 1,
-1.167891, -1.778206, -2.355673, 0, 0, 0, 1, 1,
-1.166925, -0.4636653, -0.9598194, 0, 0, 0, 1, 1,
-1.157927, 0.6467111, -2.244365, 0, 0, 0, 1, 1,
-1.145298, -0.09262215, -1.170035, 0, 0, 0, 1, 1,
-1.13898, -0.5421928, -1.402096, 0, 0, 0, 1, 1,
-1.132334, -0.4400472, -1.222517, 0, 0, 0, 1, 1,
-1.131048, 1.06876, -0.6063548, 1, 1, 1, 1, 1,
-1.13089, 0.3197527, -1.706955, 1, 1, 1, 1, 1,
-1.125868, -0.4094285, -0.8701498, 1, 1, 1, 1, 1,
-1.118118, 2.026357, -0.9020328, 1, 1, 1, 1, 1,
-1.11581, -1.249168, -0.2913927, 1, 1, 1, 1, 1,
-1.115341, 0.7559648, -0.2089783, 1, 1, 1, 1, 1,
-1.099967, 0.1292628, -2.533715, 1, 1, 1, 1, 1,
-1.099884, -1.237329, -2.810602, 1, 1, 1, 1, 1,
-1.087918, 0.7260712, -0.770318, 1, 1, 1, 1, 1,
-1.083483, 0.1320197, -3.558861, 1, 1, 1, 1, 1,
-1.076316, -0.4803165, -1.534789, 1, 1, 1, 1, 1,
-1.072896, -0.8761957, -1.281652, 1, 1, 1, 1, 1,
-1.062451, 0.3038008, -1.709291, 1, 1, 1, 1, 1,
-1.061708, 0.433097, -0.6206293, 1, 1, 1, 1, 1,
-1.057842, -0.3640009, -1.067408, 1, 1, 1, 1, 1,
-1.055222, 0.7443881, 0.1566841, 0, 0, 1, 1, 1,
-1.053715, -1.213643, -2.93662, 1, 0, 0, 1, 1,
-1.053197, 1.830204, -0.03787763, 1, 0, 0, 1, 1,
-1.051385, 1.807498, 0.1584075, 1, 0, 0, 1, 1,
-1.049051, 0.3476009, -1.624603, 1, 0, 0, 1, 1,
-1.045094, -0.1896485, -2.106013, 1, 0, 0, 1, 1,
-1.042363, 0.01574623, -0.8601827, 0, 0, 0, 1, 1,
-1.040723, -0.3586944, -2.514595, 0, 0, 0, 1, 1,
-1.039103, -1.037031, -2.238683, 0, 0, 0, 1, 1,
-1.038701, -0.4798278, -3.375377, 0, 0, 0, 1, 1,
-1.035742, -0.1820924, -0.6603786, 0, 0, 0, 1, 1,
-1.02592, -1.299548, -3.468284, 0, 0, 0, 1, 1,
-1.021701, 0.054424, -0.02336282, 0, 0, 0, 1, 1,
-1.013854, 0.5933349, -4.194016, 1, 1, 1, 1, 1,
-1.013251, 1.672745, -1.224548, 1, 1, 1, 1, 1,
-1.012786, 0.1556242, -0.06411394, 1, 1, 1, 1, 1,
-1.006251, 1.106094, 1.162083, 1, 1, 1, 1, 1,
-1.000998, 1.138199, -2.80529, 1, 1, 1, 1, 1,
-0.9994285, -0.5219553, -1.63522, 1, 1, 1, 1, 1,
-0.9985275, -0.4615176, -1.677129, 1, 1, 1, 1, 1,
-0.9891679, -1.017624, -2.877917, 1, 1, 1, 1, 1,
-0.9886047, -0.9085366, -1.966342, 1, 1, 1, 1, 1,
-0.9684566, -1.002091, -3.364678, 1, 1, 1, 1, 1,
-0.9680591, -0.2026908, -0.4163095, 1, 1, 1, 1, 1,
-0.9673432, 0.4356739, -0.2643362, 1, 1, 1, 1, 1,
-0.9660681, 0.7308501, -1.953031, 1, 1, 1, 1, 1,
-0.9634268, -0.3228282, -1.650873, 1, 1, 1, 1, 1,
-0.9614433, -0.3656649, -2.988899, 1, 1, 1, 1, 1,
-0.9611607, 0.01124247, -2.142908, 0, 0, 1, 1, 1,
-0.9605353, 2.373548, 0.8760933, 1, 0, 0, 1, 1,
-0.9604683, 0.7846204, -1.399307, 1, 0, 0, 1, 1,
-0.9396875, 0.3838145, -0.8562517, 1, 0, 0, 1, 1,
-0.9299216, 0.7493912, -0.7340469, 1, 0, 0, 1, 1,
-0.9293537, -0.6206464, -2.019608, 1, 0, 0, 1, 1,
-0.9133326, 0.5783806, -0.1354443, 0, 0, 0, 1, 1,
-0.9090601, -0.5545868, -3.04153, 0, 0, 0, 1, 1,
-0.9089495, -1.032625, -2.375676, 0, 0, 0, 1, 1,
-0.9083549, 0.9933295, -1.496978, 0, 0, 0, 1, 1,
-0.9029574, 1.426026, 0.07221206, 0, 0, 0, 1, 1,
-0.9026644, -1.177646, -2.535173, 0, 0, 0, 1, 1,
-0.8986056, -0.01690094, -1.698078, 0, 0, 0, 1, 1,
-0.897585, 1.184836, 0.2138343, 1, 1, 1, 1, 1,
-0.8888393, 0.1765807, -1.704246, 1, 1, 1, 1, 1,
-0.8798572, 0.2887638, 1.307332, 1, 1, 1, 1, 1,
-0.8771266, 2.191484, 0.334431, 1, 1, 1, 1, 1,
-0.8768609, -0.5433373, -2.638257, 1, 1, 1, 1, 1,
-0.8748523, -0.2683829, -1.073222, 1, 1, 1, 1, 1,
-0.8728021, -0.9120854, -3.396414, 1, 1, 1, 1, 1,
-0.8720809, -0.03036223, -2.024103, 1, 1, 1, 1, 1,
-0.871019, 0.115379, -0.8728569, 1, 1, 1, 1, 1,
-0.8625063, 0.177106, -1.285331, 1, 1, 1, 1, 1,
-0.8421031, 0.3661108, -0.06346839, 1, 1, 1, 1, 1,
-0.8196828, 2.610335, -0.6340686, 1, 1, 1, 1, 1,
-0.8184157, -0.2249, -1.858046, 1, 1, 1, 1, 1,
-0.8156402, 0.1257816, -1.491363, 1, 1, 1, 1, 1,
-0.8120287, 0.3632093, -1.494495, 1, 1, 1, 1, 1,
-0.8116766, -0.3047054, -2.918599, 0, 0, 1, 1, 1,
-0.8113405, -0.841512, -3.138916, 1, 0, 0, 1, 1,
-0.8112221, -1.388122, -3.281645, 1, 0, 0, 1, 1,
-0.8110628, 0.9186057, -1.343803, 1, 0, 0, 1, 1,
-0.8039009, 0.7836804, 0.2400558, 1, 0, 0, 1, 1,
-0.7998447, -0.1640409, -0.9590544, 1, 0, 0, 1, 1,
-0.7990715, 0.232554, 0.03033613, 0, 0, 0, 1, 1,
-0.7908197, -0.423393, -2.089203, 0, 0, 0, 1, 1,
-0.7867112, 1.211709, -0.9354594, 0, 0, 0, 1, 1,
-0.7790153, 0.2370798, -2.405096, 0, 0, 0, 1, 1,
-0.7784064, 1.236049, -1.120174, 0, 0, 0, 1, 1,
-0.7727322, -0.749501, -1.941123, 0, 0, 0, 1, 1,
-0.7646196, 0.157247, -1.347343, 0, 0, 0, 1, 1,
-0.7634798, 0.004404977, -0.2036028, 1, 1, 1, 1, 1,
-0.7633404, -0.7334672, -1.919372, 1, 1, 1, 1, 1,
-0.7580386, 0.8797125, -1.082841, 1, 1, 1, 1, 1,
-0.748311, 0.5067828, -1.820019, 1, 1, 1, 1, 1,
-0.7452077, -0.5735412, -3.870719, 1, 1, 1, 1, 1,
-0.7404395, -0.680319, -2.215435, 1, 1, 1, 1, 1,
-0.7379568, -0.258617, -0.17147, 1, 1, 1, 1, 1,
-0.7337353, 0.0328852, -3.653668, 1, 1, 1, 1, 1,
-0.7309777, 1.694625, 0.6375654, 1, 1, 1, 1, 1,
-0.7308269, -0.08497159, -3.141887, 1, 1, 1, 1, 1,
-0.7299819, -0.3707496, -0.5725141, 1, 1, 1, 1, 1,
-0.7298022, -0.438922, -3.263256, 1, 1, 1, 1, 1,
-0.7249852, 1.512382, -0.2360553, 1, 1, 1, 1, 1,
-0.7197312, 1.951188, 2.121701, 1, 1, 1, 1, 1,
-0.7194338, 1.22461, -1.534106, 1, 1, 1, 1, 1,
-0.7176852, 1.735564, -0.9431493, 0, 0, 1, 1, 1,
-0.7159591, -1.233143, -1.959329, 1, 0, 0, 1, 1,
-0.7146247, -0.8086846, -1.25906, 1, 0, 0, 1, 1,
-0.711529, -0.4413472, -4.192981, 1, 0, 0, 1, 1,
-0.7093674, 1.558559, 0.417516, 1, 0, 0, 1, 1,
-0.7072141, 0.05202137, -0.8432847, 1, 0, 0, 1, 1,
-0.7065938, 0.5633711, -1.114206, 0, 0, 0, 1, 1,
-0.7041244, 1.440571, -0.2370318, 0, 0, 0, 1, 1,
-0.7017797, -0.770385, -1.439319, 0, 0, 0, 1, 1,
-0.6999456, 0.114705, -0.2904632, 0, 0, 0, 1, 1,
-0.6986538, -0.9597231, -3.088979, 0, 0, 0, 1, 1,
-0.6972783, 0.1360274, -2.879902, 0, 0, 0, 1, 1,
-0.6941558, -0.9851037, -1.578681, 0, 0, 0, 1, 1,
-0.6909603, -1.699257, -3.221684, 1, 1, 1, 1, 1,
-0.6883637, -1.510831, -2.361016, 1, 1, 1, 1, 1,
-0.6876344, -0.4846407, -2.907576, 1, 1, 1, 1, 1,
-0.6820288, -0.8640472, -2.590467, 1, 1, 1, 1, 1,
-0.6775091, 1.469608, 0.7799326, 1, 1, 1, 1, 1,
-0.6738603, -0.5138574, -1.523487, 1, 1, 1, 1, 1,
-0.6708306, -0.719548, -2.756507, 1, 1, 1, 1, 1,
-0.6616938, 0.3410688, 0.8689336, 1, 1, 1, 1, 1,
-0.6585783, -0.198445, -2.372597, 1, 1, 1, 1, 1,
-0.6579186, -0.4457574, -2.738651, 1, 1, 1, 1, 1,
-0.657195, -0.06893121, -1.391508, 1, 1, 1, 1, 1,
-0.6495879, 0.6517038, -1.386027, 1, 1, 1, 1, 1,
-0.6447034, -1.110864, -2.211731, 1, 1, 1, 1, 1,
-0.6432205, -0.2684903, -2.154816, 1, 1, 1, 1, 1,
-0.6375529, 0.3856512, -0.1586176, 1, 1, 1, 1, 1,
-0.6330552, -0.4405293, -0.9540128, 0, 0, 1, 1, 1,
-0.6294166, -0.7292275, -1.311336, 1, 0, 0, 1, 1,
-0.6269473, -0.578976, -2.394558, 1, 0, 0, 1, 1,
-0.6241802, -0.3439302, -4.132937, 1, 0, 0, 1, 1,
-0.6231025, -0.6942315, -3.304579, 1, 0, 0, 1, 1,
-0.6134516, -0.6256733, -2.770299, 1, 0, 0, 1, 1,
-0.6114717, 0.7221117, -1.103609, 0, 0, 0, 1, 1,
-0.6083076, -0.6861148, -1.170716, 0, 0, 0, 1, 1,
-0.6055428, 0.1554272, -1.230978, 0, 0, 0, 1, 1,
-0.6038845, -1.171576, -2.741335, 0, 0, 0, 1, 1,
-0.6011017, -1.307644, -1.15026, 0, 0, 0, 1, 1,
-0.5971004, 0.3729523, 0.1036021, 0, 0, 0, 1, 1,
-0.5964116, -1.082178, -1.760659, 0, 0, 0, 1, 1,
-0.5953211, 0.548252, -3.392579, 1, 1, 1, 1, 1,
-0.5927493, 1.179282, -0.06874976, 1, 1, 1, 1, 1,
-0.5926674, 1.363354, -1.321982, 1, 1, 1, 1, 1,
-0.5862579, -0.9359956, -2.526091, 1, 1, 1, 1, 1,
-0.5741234, 0.6473935, -0.07449035, 1, 1, 1, 1, 1,
-0.5740886, 2.340595, -1.045835, 1, 1, 1, 1, 1,
-0.5725326, -0.3118208, -3.259747, 1, 1, 1, 1, 1,
-0.5709245, 1.825259, -1.364993, 1, 1, 1, 1, 1,
-0.5697894, -1.474102, -1.45186, 1, 1, 1, 1, 1,
-0.5515534, 2.038064, -1.035657, 1, 1, 1, 1, 1,
-0.5506637, 0.9856431, 0.3816541, 1, 1, 1, 1, 1,
-0.5461094, 2.402269, -2.55917, 1, 1, 1, 1, 1,
-0.5426929, 0.06452404, -0.5204195, 1, 1, 1, 1, 1,
-0.5324206, -1.086373, -3.135538, 1, 1, 1, 1, 1,
-0.5319743, 0.05888494, -2.189155, 1, 1, 1, 1, 1,
-0.5317125, -1.681047, -3.297687, 0, 0, 1, 1, 1,
-0.5274271, 0.01839109, -0.9141998, 1, 0, 0, 1, 1,
-0.5238541, -0.651803, -1.197014, 1, 0, 0, 1, 1,
-0.5162856, 0.1311976, -1.127349, 1, 0, 0, 1, 1,
-0.5146067, 0.8853453, 0.0511223, 1, 0, 0, 1, 1,
-0.5123819, 0.1607833, -1.547289, 1, 0, 0, 1, 1,
-0.5063067, 0.5200133, -0.3785526, 0, 0, 0, 1, 1,
-0.5060352, 3.261963, 1.930878, 0, 0, 0, 1, 1,
-0.5028511, 0.01322138, -3.040673, 0, 0, 0, 1, 1,
-0.501656, 0.797615, -0.7619477, 0, 0, 0, 1, 1,
-0.4986738, -0.5463758, -3.429588, 0, 0, 0, 1, 1,
-0.4980652, -1.256945, -2.715549, 0, 0, 0, 1, 1,
-0.4962258, -0.1032274, 0.157937, 0, 0, 0, 1, 1,
-0.4906259, -0.7110075, -2.825511, 1, 1, 1, 1, 1,
-0.4862995, 0.6818972, -1.717991, 1, 1, 1, 1, 1,
-0.4818732, -0.2239124, -2.554492, 1, 1, 1, 1, 1,
-0.4778042, 1.217977, -0.2046479, 1, 1, 1, 1, 1,
-0.4691426, -0.375483, -2.487794, 1, 1, 1, 1, 1,
-0.4684803, 1.293374, -1.109441, 1, 1, 1, 1, 1,
-0.4597422, -1.85194, -3.564136, 1, 1, 1, 1, 1,
-0.4578616, -1.30385, -1.063959, 1, 1, 1, 1, 1,
-0.4568806, 1.013762, -0.9051779, 1, 1, 1, 1, 1,
-0.4554052, 0.4406109, -1.445412, 1, 1, 1, 1, 1,
-0.4545347, 0.2100881, -0.6093241, 1, 1, 1, 1, 1,
-0.4525875, 1.456172, 0.5376047, 1, 1, 1, 1, 1,
-0.4508125, -0.9236665, -4.084353, 1, 1, 1, 1, 1,
-0.4499264, 0.764063, -1.05668, 1, 1, 1, 1, 1,
-0.4463283, -0.7120928, -2.141579, 1, 1, 1, 1, 1,
-0.4422136, -0.7196379, -4.942923, 0, 0, 1, 1, 1,
-0.4349926, 0.9571254, -0.7997434, 1, 0, 0, 1, 1,
-0.4317987, 0.1401495, -1.447785, 1, 0, 0, 1, 1,
-0.4306354, 1.011159, -0.3841084, 1, 0, 0, 1, 1,
-0.4294485, -0.3139213, -1.646587, 1, 0, 0, 1, 1,
-0.4258904, 0.2545267, -1.873052, 1, 0, 0, 1, 1,
-0.4251126, -0.3334765, -2.616795, 0, 0, 0, 1, 1,
-0.4249485, -0.03127632, 0.1620599, 0, 0, 0, 1, 1,
-0.4191065, -0.916723, -3.509991, 0, 0, 0, 1, 1,
-0.4187963, -1.823295, -2.229608, 0, 0, 0, 1, 1,
-0.4165768, -1.23532, -2.966476, 0, 0, 0, 1, 1,
-0.4142084, 0.6843269, -1.161641, 0, 0, 0, 1, 1,
-0.4122497, -2.153028, -4.605801, 0, 0, 0, 1, 1,
-0.4091467, -0.5875221, -2.358845, 1, 1, 1, 1, 1,
-0.4054557, 0.008445852, -4.08396, 1, 1, 1, 1, 1,
-0.4016169, 0.07250946, -1.828321, 1, 1, 1, 1, 1,
-0.4005331, -1.504252, -3.490283, 1, 1, 1, 1, 1,
-0.3963915, 0.8105025, -1.13851, 1, 1, 1, 1, 1,
-0.3880913, -0.3325886, -1.343728, 1, 1, 1, 1, 1,
-0.3860862, -1.450964, -2.370329, 1, 1, 1, 1, 1,
-0.3836328, 0.4116823, -0.2343029, 1, 1, 1, 1, 1,
-0.3821121, -1.082887, -1.610443, 1, 1, 1, 1, 1,
-0.3818284, 1.253079, -1.63088, 1, 1, 1, 1, 1,
-0.3773795, 0.930329, -0.3755635, 1, 1, 1, 1, 1,
-0.3738026, 0.1951238, -0.6071751, 1, 1, 1, 1, 1,
-0.3730362, 0.6455929, -1.558278, 1, 1, 1, 1, 1,
-0.3676759, -0.2287437, -4.815045, 1, 1, 1, 1, 1,
-0.3664033, 0.1448729, -1.738706, 1, 1, 1, 1, 1,
-0.3640195, -1.621979, -3.323027, 0, 0, 1, 1, 1,
-0.3603559, -0.2931257, -2.055555, 1, 0, 0, 1, 1,
-0.3601683, -0.9577339, -3.713921, 1, 0, 0, 1, 1,
-0.354612, -0.1434795, -1.128875, 1, 0, 0, 1, 1,
-0.3544526, -0.7590334, -1.976182, 1, 0, 0, 1, 1,
-0.3509974, 0.8202425, 0.2004653, 1, 0, 0, 1, 1,
-0.3506488, 0.04777096, -2.94445, 0, 0, 0, 1, 1,
-0.3498036, -0.09239093, -1.209675, 0, 0, 0, 1, 1,
-0.3477811, 0.1881875, -2.271031, 0, 0, 0, 1, 1,
-0.3469689, -1.095981, -3.328225, 0, 0, 0, 1, 1,
-0.3465837, -0.4192722, -2.287884, 0, 0, 0, 1, 1,
-0.3409353, -1.877187, -4.430714, 0, 0, 0, 1, 1,
-0.3406183, -0.552148, -1.942807, 0, 0, 0, 1, 1,
-0.3399763, -2.262872, -3.572258, 1, 1, 1, 1, 1,
-0.3363768, 0.477817, -0.01505679, 1, 1, 1, 1, 1,
-0.3361062, 0.03220852, -1.851108, 1, 1, 1, 1, 1,
-0.3359637, 0.6686511, -0.7356396, 1, 1, 1, 1, 1,
-0.3357408, 0.6494936, 0.5413363, 1, 1, 1, 1, 1,
-0.3318957, -1.602607, -3.509342, 1, 1, 1, 1, 1,
-0.3315756, 1.031037, 0.484746, 1, 1, 1, 1, 1,
-0.3302376, 0.7840617, -0.1592956, 1, 1, 1, 1, 1,
-0.3289661, 1.383275, 0.255202, 1, 1, 1, 1, 1,
-0.3288119, 0.6186265, -0.8075414, 1, 1, 1, 1, 1,
-0.3283577, -0.8011869, -2.311203, 1, 1, 1, 1, 1,
-0.3278964, 0.4137475, -1.972911, 1, 1, 1, 1, 1,
-0.3271683, 0.3138031, 0.4447151, 1, 1, 1, 1, 1,
-0.3250835, 1.098886, -0.6735142, 1, 1, 1, 1, 1,
-0.3219927, -0.05677955, -0.2164052, 1, 1, 1, 1, 1,
-0.307312, -0.3799638, -2.998197, 0, 0, 1, 1, 1,
-0.3047557, 0.722457, -0.7186784, 1, 0, 0, 1, 1,
-0.3046149, 0.8022296, -0.08482508, 1, 0, 0, 1, 1,
-0.3007794, -0.4419175, -2.581719, 1, 0, 0, 1, 1,
-0.2992151, 0.8163024, -0.1002705, 1, 0, 0, 1, 1,
-0.2986858, 0.3734573, -1.540511, 1, 0, 0, 1, 1,
-0.2770896, 1.321599, -0.9906259, 0, 0, 0, 1, 1,
-0.2755904, 1.686503, -0.5966463, 0, 0, 0, 1, 1,
-0.2750614, -0.8415591, -2.109207, 0, 0, 0, 1, 1,
-0.2691274, 0.8549131, -1.27756, 0, 0, 0, 1, 1,
-0.2665563, -0.1257507, -1.984953, 0, 0, 0, 1, 1,
-0.2654888, -0.9720898, -0.9242426, 0, 0, 0, 1, 1,
-0.263464, 2.28082, -1.697236, 0, 0, 0, 1, 1,
-0.2614005, 0.208368, -1.833276, 1, 1, 1, 1, 1,
-0.2585898, -0.5208377, -1.490337, 1, 1, 1, 1, 1,
-0.2575612, 0.3740374, -0.4593301, 1, 1, 1, 1, 1,
-0.2572431, 3.33801, 1.249498, 1, 1, 1, 1, 1,
-0.2563615, -0.1957667, -1.512165, 1, 1, 1, 1, 1,
-0.2528639, -0.08970609, -3.549833, 1, 1, 1, 1, 1,
-0.2504671, -0.6906475, -2.482265, 1, 1, 1, 1, 1,
-0.2497817, 0.7617219, -0.9022381, 1, 1, 1, 1, 1,
-0.2440349, 0.5185925, 0.4402097, 1, 1, 1, 1, 1,
-0.2437633, 1.537364, -0.3439396, 1, 1, 1, 1, 1,
-0.2436427, -1.272736, -4.370316, 1, 1, 1, 1, 1,
-0.2423049, -1.734855, -3.300389, 1, 1, 1, 1, 1,
-0.2382145, 0.7506129, -1.801339, 1, 1, 1, 1, 1,
-0.236268, -0.7583466, -4.503364, 1, 1, 1, 1, 1,
-0.2337795, -0.03514093, -0.6170968, 1, 1, 1, 1, 1,
-0.2320966, 0.5013267, -1.005856, 0, 0, 1, 1, 1,
-0.225714, 2.816196, -0.5038276, 1, 0, 0, 1, 1,
-0.2202089, 0.8732402, -0.9178619, 1, 0, 0, 1, 1,
-0.2199804, -2.589775, -2.68718, 1, 0, 0, 1, 1,
-0.2194943, -0.5026717, -2.843255, 1, 0, 0, 1, 1,
-0.2188623, 0.7358611, -1.238579, 1, 0, 0, 1, 1,
-0.2121006, -1.43101, -2.11514, 0, 0, 0, 1, 1,
-0.2112717, 0.2070371, -1.064887, 0, 0, 0, 1, 1,
-0.2093037, -0.3072303, -2.743487, 0, 0, 0, 1, 1,
-0.2086391, 1.094305, -0.6316605, 0, 0, 0, 1, 1,
-0.2082542, 1.545203, 0.7325623, 0, 0, 0, 1, 1,
-0.1986109, 0.7805284, 0.8514547, 0, 0, 0, 1, 1,
-0.1976743, -0.02812482, 0.02862741, 0, 0, 0, 1, 1,
-0.1937132, -1.953764, -4.888629, 1, 1, 1, 1, 1,
-0.1914048, -1.156786, -0.7868646, 1, 1, 1, 1, 1,
-0.1839028, 0.4627782, 0.778343, 1, 1, 1, 1, 1,
-0.1835964, -0.8816158, -3.367247, 1, 1, 1, 1, 1,
-0.1784246, -1.60472, -1.583256, 1, 1, 1, 1, 1,
-0.1780305, -1.479965, -1.180779, 1, 1, 1, 1, 1,
-0.1762056, -0.3788874, -2.55622, 1, 1, 1, 1, 1,
-0.1756359, -1.31895, -4.497822, 1, 1, 1, 1, 1,
-0.1730712, -1.504343, -5.485564, 1, 1, 1, 1, 1,
-0.1714862, -0.7799228, -2.895325, 1, 1, 1, 1, 1,
-0.1706755, -0.3551784, -3.823346, 1, 1, 1, 1, 1,
-0.1688271, 1.533027, -0.6389334, 1, 1, 1, 1, 1,
-0.1686905, 0.5485027, -1.204017, 1, 1, 1, 1, 1,
-0.1607361, -1.699212, -4.175816, 1, 1, 1, 1, 1,
-0.1506901, -0.7950871, -2.342979, 1, 1, 1, 1, 1,
-0.1459023, 0.6839585, -0.3403094, 0, 0, 1, 1, 1,
-0.1453179, 0.509499, 0.2532005, 1, 0, 0, 1, 1,
-0.1447451, -0.3343453, -1.982733, 1, 0, 0, 1, 1,
-0.1439787, -1.504072, -1.858377, 1, 0, 0, 1, 1,
-0.1425947, 0.5655697, -0.1963347, 1, 0, 0, 1, 1,
-0.1383495, -0.1232602, -2.003842, 1, 0, 0, 1, 1,
-0.1365525, -0.8787125, -2.163105, 0, 0, 0, 1, 1,
-0.1350782, 1.185044, -0.01803297, 0, 0, 0, 1, 1,
-0.1343984, -1.184651, -1.93651, 0, 0, 0, 1, 1,
-0.1243343, -0.5532563, -2.392341, 0, 0, 0, 1, 1,
-0.1239723, 0.4141659, 1.421824, 0, 0, 0, 1, 1,
-0.1210839, -0.6830212, -1.632093, 0, 0, 0, 1, 1,
-0.1173645, -0.7346104, -2.0971, 0, 0, 0, 1, 1,
-0.1160165, -1.718276, -3.42629, 1, 1, 1, 1, 1,
-0.1100289, 0.7488668, 0.07391625, 1, 1, 1, 1, 1,
-0.1086121, -0.06341264, -3.06391, 1, 1, 1, 1, 1,
-0.1083758, 1.397541, 0.400977, 1, 1, 1, 1, 1,
-0.1039681, -0.2829807, -1.258292, 1, 1, 1, 1, 1,
-0.1005661, -0.4973152, -3.879373, 1, 1, 1, 1, 1,
-0.09746581, 0.5566591, -1.097936, 1, 1, 1, 1, 1,
-0.09276827, 0.9900073, -0.2925045, 1, 1, 1, 1, 1,
-0.09124529, 0.963061, -0.4382024, 1, 1, 1, 1, 1,
-0.09033015, 0.5831324, -1.096409, 1, 1, 1, 1, 1,
-0.08958049, -0.4192136, -1.601667, 1, 1, 1, 1, 1,
-0.08717228, 1.498966, -0.08185176, 1, 1, 1, 1, 1,
-0.08668763, -0.09785417, -2.274691, 1, 1, 1, 1, 1,
-0.08600371, 0.8398879, -0.9980897, 1, 1, 1, 1, 1,
-0.08482461, -0.7726049, -2.094852, 1, 1, 1, 1, 1,
-0.08233353, 0.5094415, 0.9110939, 0, 0, 1, 1, 1,
-0.08200625, 0.2431194, 0.7627875, 1, 0, 0, 1, 1,
-0.08196154, 0.7417623, -0.02488542, 1, 0, 0, 1, 1,
-0.08142316, 0.2830785, -0.3124936, 1, 0, 0, 1, 1,
-0.07518888, 0.2987545, -1.405534, 1, 0, 0, 1, 1,
-0.07383152, -0.0813882, -3.301307, 1, 0, 0, 1, 1,
-0.06880616, -1.010522, -2.917641, 0, 0, 0, 1, 1,
-0.06409822, 1.479313, -0.09292672, 0, 0, 0, 1, 1,
-0.06324248, -0.1585979, -2.461648, 0, 0, 0, 1, 1,
-0.06118884, -2.527417, -2.020075, 0, 0, 0, 1, 1,
-0.05947657, 1.068138, -0.1989873, 0, 0, 0, 1, 1,
-0.05018514, 2.486559, -1.266035, 0, 0, 0, 1, 1,
-0.04817194, 0.4721265, 0.7267883, 0, 0, 0, 1, 1,
-0.04424599, 1.039403, -0.3276864, 1, 1, 1, 1, 1,
-0.04176597, -1.248826, -5.436921, 1, 1, 1, 1, 1,
-0.03950863, -0.3218406, -2.513471, 1, 1, 1, 1, 1,
-0.03590029, -0.1215378, -2.8022, 1, 1, 1, 1, 1,
-0.03536228, 0.1468589, 1.987833, 1, 1, 1, 1, 1,
-0.03477928, 0.305923, -0.0260515, 1, 1, 1, 1, 1,
-0.03136859, 0.6728357, 0.1775791, 1, 1, 1, 1, 1,
-0.03046139, -0.5619041, -3.991422, 1, 1, 1, 1, 1,
-0.02786598, 0.1136004, 2.623915, 1, 1, 1, 1, 1,
-0.02583782, 0.1940098, 2.001937, 1, 1, 1, 1, 1,
-0.0254549, -0.6537154, -5.267103, 1, 1, 1, 1, 1,
-0.02531975, 1.227566, -0.4258733, 1, 1, 1, 1, 1,
-0.02482325, -0.02686268, -4.331364, 1, 1, 1, 1, 1,
-0.02075461, -0.2737335, -3.785455, 1, 1, 1, 1, 1,
-0.0171158, 0.05753446, -0.728344, 1, 1, 1, 1, 1,
-0.01477245, -0.1619077, -1.408366, 0, 0, 1, 1, 1,
-0.01230527, -0.4003189, -2.209693, 1, 0, 0, 1, 1,
-0.01172141, 0.07683439, 0.3816148, 1, 0, 0, 1, 1,
-0.008115771, 0.3526714, 0.04590571, 1, 0, 0, 1, 1,
-0.006625735, 2.29512, -0.5176827, 1, 0, 0, 1, 1,
-0.005273404, -1.095939, -2.288434, 1, 0, 0, 1, 1,
-0.0001183877, -1.021488, -4.891408, 0, 0, 0, 1, 1,
0.003623772, -1.206236, 3.925619, 0, 0, 0, 1, 1,
0.0112533, 0.3961521, -1.372861, 0, 0, 0, 1, 1,
0.01358466, -0.08651455, 2.997269, 0, 0, 0, 1, 1,
0.01962506, 0.1774021, 0.3966021, 0, 0, 0, 1, 1,
0.02849786, -0.7183417, 3.21531, 0, 0, 0, 1, 1,
0.03506277, 0.5084937, -0.2318689, 0, 0, 0, 1, 1,
0.0353921, 0.1555908, -0.2186764, 1, 1, 1, 1, 1,
0.03899206, -1.149757, 2.877419, 1, 1, 1, 1, 1,
0.04065215, -0.05722871, 1.051154, 1, 1, 1, 1, 1,
0.04100102, -0.7403237, 1.595625, 1, 1, 1, 1, 1,
0.04169269, -2.146854, 3.348401, 1, 1, 1, 1, 1,
0.041875, 0.3342918, -0.8604751, 1, 1, 1, 1, 1,
0.04302503, 1.38919, -0.811247, 1, 1, 1, 1, 1,
0.04634754, 1.071035, 2.571755, 1, 1, 1, 1, 1,
0.0464929, 0.2862293, -0.5449795, 1, 1, 1, 1, 1,
0.04841462, 1.437817, -0.8176634, 1, 1, 1, 1, 1,
0.04967552, -0.1693223, 2.160598, 1, 1, 1, 1, 1,
0.05418427, 1.686799, -0.4330415, 1, 1, 1, 1, 1,
0.05538252, 1.338404, 0.611267, 1, 1, 1, 1, 1,
0.05838157, -1.065597, 3.049945, 1, 1, 1, 1, 1,
0.06538359, 0.2869374, 0.9483901, 1, 1, 1, 1, 1,
0.06650043, 0.6179494, -0.1463868, 0, 0, 1, 1, 1,
0.07067733, 0.2162543, -1.772322, 1, 0, 0, 1, 1,
0.07263827, -0.006137921, 1.175046, 1, 0, 0, 1, 1,
0.07384022, -2.281128, 3.048565, 1, 0, 0, 1, 1,
0.07568669, 0.5748718, -0.456201, 1, 0, 0, 1, 1,
0.07615407, 0.7624542, -0.1019894, 1, 0, 0, 1, 1,
0.0772946, -1.30443, 1.464455, 0, 0, 0, 1, 1,
0.08409564, -2.207417, 1.542449, 0, 0, 0, 1, 1,
0.0860878, 0.1578142, 1.926886, 0, 0, 0, 1, 1,
0.0878722, 0.1088737, 0.9941419, 0, 0, 0, 1, 1,
0.09603649, -0.1607969, 2.213985, 0, 0, 0, 1, 1,
0.1004009, -0.72618, 4.806231, 0, 0, 0, 1, 1,
0.1006835, 0.3286032, -0.9496899, 0, 0, 0, 1, 1,
0.1026426, 1.22029, 0.3866009, 1, 1, 1, 1, 1,
0.1036687, -1.207614, 3.232891, 1, 1, 1, 1, 1,
0.1054562, 0.3123516, -0.723728, 1, 1, 1, 1, 1,
0.1055521, -1.511967, 4.720191, 1, 1, 1, 1, 1,
0.1098302, 2.245878, -0.2688698, 1, 1, 1, 1, 1,
0.1104072, 1.346866, -0.3757134, 1, 1, 1, 1, 1,
0.1167262, 0.8562701, -0.08663814, 1, 1, 1, 1, 1,
0.1182032, -0.8926392, 2.585922, 1, 1, 1, 1, 1,
0.1296839, 0.3976805, -0.5273805, 1, 1, 1, 1, 1,
0.1345883, -0.1055861, 1.82262, 1, 1, 1, 1, 1,
0.1355091, 0.6297128, -0.2701049, 1, 1, 1, 1, 1,
0.1364288, 0.5672973, -0.3029445, 1, 1, 1, 1, 1,
0.1383313, -1.559919, 5.061138, 1, 1, 1, 1, 1,
0.1437731, 0.7690189, -0.9414961, 1, 1, 1, 1, 1,
0.1479024, -0.07072201, 0.4605115, 1, 1, 1, 1, 1,
0.1490808, 0.3793094, -0.5215552, 0, 0, 1, 1, 1,
0.1493111, 0.5491463, 0.007311344, 1, 0, 0, 1, 1,
0.1557669, -0.2145229, 1.498299, 1, 0, 0, 1, 1,
0.1588941, 0.2034965, 0.6613197, 1, 0, 0, 1, 1,
0.1651515, 0.03569368, 0.9196222, 1, 0, 0, 1, 1,
0.1659185, 0.1258334, 1.414103, 1, 0, 0, 1, 1,
0.1696271, -1.515854, 2.600032, 0, 0, 0, 1, 1,
0.1716748, -0.885254, 3.135127, 0, 0, 0, 1, 1,
0.172664, 0.1231828, 0.4918682, 0, 0, 0, 1, 1,
0.1764006, -0.3663184, 3.436376, 0, 0, 0, 1, 1,
0.1778061, -0.6806741, 2.871253, 0, 0, 0, 1, 1,
0.1780007, -1.308784, 3.932456, 0, 0, 0, 1, 1,
0.1781116, 2.209077, 1.109049, 0, 0, 0, 1, 1,
0.1787692, -1.10839, 2.859519, 1, 1, 1, 1, 1,
0.1791781, 0.9637434, -2.439057, 1, 1, 1, 1, 1,
0.1800262, 0.3705662, 0.7225561, 1, 1, 1, 1, 1,
0.1810735, 0.299415, -0.4162583, 1, 1, 1, 1, 1,
0.183571, -0.431289, 2.539115, 1, 1, 1, 1, 1,
0.1860777, -0.5671695, 1.766253, 1, 1, 1, 1, 1,
0.1896223, 0.2169413, 2.258726, 1, 1, 1, 1, 1,
0.1920402, 1.056339, 1.025524, 1, 1, 1, 1, 1,
0.1975211, 0.128332, 1.09639, 1, 1, 1, 1, 1,
0.202952, -2.457064, 3.153832, 1, 1, 1, 1, 1,
0.2034396, 0.2457944, 2.561421, 1, 1, 1, 1, 1,
0.2091556, -0.3029038, 1.402286, 1, 1, 1, 1, 1,
0.2098304, 2.537408, -0.2523593, 1, 1, 1, 1, 1,
0.2123503, -0.4196143, 3.256745, 1, 1, 1, 1, 1,
0.2148463, 0.8486552, 0.3349315, 1, 1, 1, 1, 1,
0.2196059, 1.347761, 1.302498, 0, 0, 1, 1, 1,
0.2209972, -1.226747, 4.113834, 1, 0, 0, 1, 1,
0.2222493, 0.2848907, 0.1788341, 1, 0, 0, 1, 1,
0.2240734, -0.6292131, 3.947983, 1, 0, 0, 1, 1,
0.228264, -1.360166, 3.689813, 1, 0, 0, 1, 1,
0.2290283, -0.1608327, 2.094649, 1, 0, 0, 1, 1,
0.2417592, 1.301389, -1.152758, 0, 0, 0, 1, 1,
0.2436938, 0.7578089, -0.5249044, 0, 0, 0, 1, 1,
0.2463444, -1.225096, 3.253766, 0, 0, 0, 1, 1,
0.2468308, -0.01283839, 2.025448, 0, 0, 0, 1, 1,
0.2480591, 1.023726, -2.234711, 0, 0, 0, 1, 1,
0.2491912, 0.7774692, 0.04620356, 0, 0, 0, 1, 1,
0.2500803, -1.189402, 2.466457, 0, 0, 0, 1, 1,
0.2512907, 0.6940468, -0.3962158, 1, 1, 1, 1, 1,
0.2645302, -0.5390341, 2.978766, 1, 1, 1, 1, 1,
0.2676941, 0.8438827, 1.428296, 1, 1, 1, 1, 1,
0.2677858, -1.29817, 0.4150761, 1, 1, 1, 1, 1,
0.2684307, -0.3316755, 4.10956, 1, 1, 1, 1, 1,
0.2700343, -0.4701878, 3.240075, 1, 1, 1, 1, 1,
0.2726865, 0.838562, 1.228637, 1, 1, 1, 1, 1,
0.2770932, 1.936534, 0.3316711, 1, 1, 1, 1, 1,
0.2775806, -0.310437, 2.364954, 1, 1, 1, 1, 1,
0.2786337, -0.6147368, 0.7836266, 1, 1, 1, 1, 1,
0.2792478, 2.191575, -0.9177514, 1, 1, 1, 1, 1,
0.2807778, -1.601676, 2.918397, 1, 1, 1, 1, 1,
0.2841582, 1.180771, -0.1018329, 1, 1, 1, 1, 1,
0.2849216, -0.2666912, 0.6258469, 1, 1, 1, 1, 1,
0.2864062, -0.2783242, 2.378087, 1, 1, 1, 1, 1,
0.2865956, 0.8075223, -0.4029014, 0, 0, 1, 1, 1,
0.2879518, -0.5035026, 3.123405, 1, 0, 0, 1, 1,
0.2896948, -0.8095346, 3.369807, 1, 0, 0, 1, 1,
0.3026631, -0.1040871, 1.445437, 1, 0, 0, 1, 1,
0.3065823, 2.235806, 2.35657, 1, 0, 0, 1, 1,
0.3071482, 0.1052625, -0.4268472, 1, 0, 0, 1, 1,
0.3081556, -0.6154634, 2.847488, 0, 0, 0, 1, 1,
0.3126129, 0.968778, -1.01589, 0, 0, 0, 1, 1,
0.3165427, 0.4571469, -1.083422, 0, 0, 0, 1, 1,
0.3207847, 0.110818, 1.584521, 0, 0, 0, 1, 1,
0.3272584, -0.08468934, 2.319038, 0, 0, 0, 1, 1,
0.327519, 0.7539035, -0.0487222, 0, 0, 0, 1, 1,
0.3284283, 1.310763, 0.2443322, 0, 0, 0, 1, 1,
0.3335433, -0.462557, 2.120023, 1, 1, 1, 1, 1,
0.3341553, 1.070788, 1.761695, 1, 1, 1, 1, 1,
0.3357467, -0.5092916, 1.319217, 1, 1, 1, 1, 1,
0.344712, -0.2062119, 2.417158, 1, 1, 1, 1, 1,
0.3447403, -1.888435, 4.225795, 1, 1, 1, 1, 1,
0.3453285, 0.9376076, 2.294992, 1, 1, 1, 1, 1,
0.3490723, 1.165023, 0.08633693, 1, 1, 1, 1, 1,
0.3516245, -0.1736657, 3.444312, 1, 1, 1, 1, 1,
0.3519316, -0.8342109, 2.765197, 1, 1, 1, 1, 1,
0.3535903, 0.3718689, 0.3270974, 1, 1, 1, 1, 1,
0.356722, 0.09415777, 3.255461, 1, 1, 1, 1, 1,
0.3582082, 0.4967322, 0.4282941, 1, 1, 1, 1, 1,
0.3633875, 1.609692, -0.3920039, 1, 1, 1, 1, 1,
0.3654481, 0.3621515, 1.005627, 1, 1, 1, 1, 1,
0.3675017, -1.272157, 2.587617, 1, 1, 1, 1, 1,
0.3701541, 0.4557683, 0.007867517, 0, 0, 1, 1, 1,
0.3703366, 0.1631965, 0.4919348, 1, 0, 0, 1, 1,
0.3706684, 0.7831149, -0.2116086, 1, 0, 0, 1, 1,
0.3717499, 1.831536, 0.1648064, 1, 0, 0, 1, 1,
0.3734843, 0.08174095, -1.224239, 1, 0, 0, 1, 1,
0.3759955, -0.3873487, 3.148775, 1, 0, 0, 1, 1,
0.3820229, -0.6715371, 2.658626, 0, 0, 0, 1, 1,
0.384288, 0.8397471, 0.7212881, 0, 0, 0, 1, 1,
0.3914662, -2.119934, 2.816128, 0, 0, 0, 1, 1,
0.3927211, 0.1982119, 1.690724, 0, 0, 0, 1, 1,
0.393651, 0.3936085, 0.7862043, 0, 0, 0, 1, 1,
0.3959438, -0.2897797, 3.455748, 0, 0, 0, 1, 1,
0.3968165, 0.1520921, 0.7590777, 0, 0, 0, 1, 1,
0.3980847, -0.9608623, 3.427727, 1, 1, 1, 1, 1,
0.4008836, -1.183939, 4.031216, 1, 1, 1, 1, 1,
0.4016893, -0.2972575, 1.39559, 1, 1, 1, 1, 1,
0.4020464, -0.3680095, 5.145045, 1, 1, 1, 1, 1,
0.4083219, -1.716761, 3.713047, 1, 1, 1, 1, 1,
0.4089111, 0.08702847, 1.016448, 1, 1, 1, 1, 1,
0.4132343, -0.6014585, 0.6207258, 1, 1, 1, 1, 1,
0.4139524, -1.237673, 3.526831, 1, 1, 1, 1, 1,
0.418626, -0.8864786, 3.904963, 1, 1, 1, 1, 1,
0.4199847, -1.802786, 4.300812, 1, 1, 1, 1, 1,
0.4228603, -0.1000928, 2.112273, 1, 1, 1, 1, 1,
0.4308431, -0.7814881, 2.790753, 1, 1, 1, 1, 1,
0.4309927, 0.6909357, 0.06517608, 1, 1, 1, 1, 1,
0.4341724, 0.9687874, 0.4400584, 1, 1, 1, 1, 1,
0.4358772, -1.771, 2.959457, 1, 1, 1, 1, 1,
0.4375604, -0.1292048, 2.447228, 0, 0, 1, 1, 1,
0.439381, -0.6900463, 2.211826, 1, 0, 0, 1, 1,
0.4406685, -0.5875472, 0.1931334, 1, 0, 0, 1, 1,
0.4416406, -0.9779117, 2.690341, 1, 0, 0, 1, 1,
0.4478734, -0.748533, 2.209734, 1, 0, 0, 1, 1,
0.4494346, 1.327005, 0.1100785, 1, 0, 0, 1, 1,
0.4497435, 0.9751705, 0.9644457, 0, 0, 0, 1, 1,
0.4509327, -0.9887921, 2.700973, 0, 0, 0, 1, 1,
0.4516078, -0.3026507, 2.637919, 0, 0, 0, 1, 1,
0.4544773, -1.611893, 3.635218, 0, 0, 0, 1, 1,
0.4559686, -1.150321, 2.335592, 0, 0, 0, 1, 1,
0.4604243, 1.336622, -0.7120052, 0, 0, 0, 1, 1,
0.4623448, -1.293738, 4.150285, 0, 0, 0, 1, 1,
0.4633887, -0.3132974, 1.796608, 1, 1, 1, 1, 1,
0.4642176, 0.2874278, 0.3375823, 1, 1, 1, 1, 1,
0.4694723, 0.5565308, 1.338908, 1, 1, 1, 1, 1,
0.475165, 0.2721579, 1.560647, 1, 1, 1, 1, 1,
0.478967, 2.867467, 0.4285254, 1, 1, 1, 1, 1,
0.4819179, 0.162071, -1.307895, 1, 1, 1, 1, 1,
0.4854732, 1.51883, 1.55608, 1, 1, 1, 1, 1,
0.4861332, 0.4163568, 2.155604, 1, 1, 1, 1, 1,
0.4906651, 1.178072, -0.3545539, 1, 1, 1, 1, 1,
0.4960472, -0.08522429, 0.6947514, 1, 1, 1, 1, 1,
0.5010083, -0.1939303, 2.675713, 1, 1, 1, 1, 1,
0.5122797, 0.5518874, 1.089461, 1, 1, 1, 1, 1,
0.5132605, 0.0845321, 2.790309, 1, 1, 1, 1, 1,
0.5174075, -0.6273589, 3.716931, 1, 1, 1, 1, 1,
0.5276951, -1.891413, 2.544491, 1, 1, 1, 1, 1,
0.5328773, 0.06409779, 0.5342761, 0, 0, 1, 1, 1,
0.5368693, -2.341282, 4.110074, 1, 0, 0, 1, 1,
0.5414691, 0.5393066, 2.238692, 1, 0, 0, 1, 1,
0.54614, 1.430062, -0.910207, 1, 0, 0, 1, 1,
0.5462776, 1.313718, -0.4333537, 1, 0, 0, 1, 1,
0.5473688, -0.2200665, 2.452588, 1, 0, 0, 1, 1,
0.5511606, 1.683314, -0.2482907, 0, 0, 0, 1, 1,
0.5523406, 1.590572, 0.9172077, 0, 0, 0, 1, 1,
0.5535613, -1.258186, 3.356663, 0, 0, 0, 1, 1,
0.5575455, -0.460762, 3.435514, 0, 0, 0, 1, 1,
0.5614946, -0.2341904, 2.045076, 0, 0, 0, 1, 1,
0.5666883, 0.3701426, 0.1739835, 0, 0, 0, 1, 1,
0.5706636, -0.6466483, 2.707443, 0, 0, 0, 1, 1,
0.5718919, -0.5604318, 1.509829, 1, 1, 1, 1, 1,
0.5725026, 1.183803, 0.6458828, 1, 1, 1, 1, 1,
0.5744274, 0.03190329, -0.9253423, 1, 1, 1, 1, 1,
0.5826813, -1.308892, 2.018562, 1, 1, 1, 1, 1,
0.5847523, 0.7332284, 0.8618731, 1, 1, 1, 1, 1,
0.5875026, 0.7954947, 0.501789, 1, 1, 1, 1, 1,
0.5896739, 0.5865362, 1.235719, 1, 1, 1, 1, 1,
0.5902928, -1.053161, 1.618106, 1, 1, 1, 1, 1,
0.5916018, 0.6982784, 1.939942, 1, 1, 1, 1, 1,
0.5929319, 0.916723, 1.268811, 1, 1, 1, 1, 1,
0.5935907, -1.696024, 3.115234, 1, 1, 1, 1, 1,
0.5948661, -0.428927, 3.036461, 1, 1, 1, 1, 1,
0.5952283, 0.4949311, 1.751134, 1, 1, 1, 1, 1,
0.5992633, -0.892349, 3.672222, 1, 1, 1, 1, 1,
0.6001377, -1.168764, 3.013386, 1, 1, 1, 1, 1,
0.6001606, 0.7055209, -1.008901, 0, 0, 1, 1, 1,
0.6034009, -0.5319759, 0.5716141, 1, 0, 0, 1, 1,
0.6038916, -0.8849916, 2.405966, 1, 0, 0, 1, 1,
0.6040906, -0.3776162, 2.804638, 1, 0, 0, 1, 1,
0.6063617, 0.5499691, 0.8402459, 1, 0, 0, 1, 1,
0.6160911, -0.8109161, 1.81544, 1, 0, 0, 1, 1,
0.6167034, 0.8504937, 1.09002, 0, 0, 0, 1, 1,
0.6171548, 0.3344074, 0.8874376, 0, 0, 0, 1, 1,
0.6172009, 0.1746734, -0.2955773, 0, 0, 0, 1, 1,
0.6172522, -1.531933, 2.226808, 0, 0, 0, 1, 1,
0.6227069, -0.00789398, 1.77185, 0, 0, 0, 1, 1,
0.6245823, -1.077319, 3.752824, 0, 0, 0, 1, 1,
0.6265922, -1.791108, 3.015717, 0, 0, 0, 1, 1,
0.6270547, -0.1126816, 2.029634, 1, 1, 1, 1, 1,
0.6286514, -0.8620046, 1.190016, 1, 1, 1, 1, 1,
0.6308373, -0.006922624, 1.638583, 1, 1, 1, 1, 1,
0.6394398, -0.5210571, 3.155114, 1, 1, 1, 1, 1,
0.6423198, -0.04304734, 2.114501, 1, 1, 1, 1, 1,
0.6426108, 0.6866837, 0.746416, 1, 1, 1, 1, 1,
0.6432564, -1.608453, 2.670741, 1, 1, 1, 1, 1,
0.649852, -0.9945443, 2.587963, 1, 1, 1, 1, 1,
0.6503024, -0.6404169, 2.629773, 1, 1, 1, 1, 1,
0.6518844, -1.224793, 2.030891, 1, 1, 1, 1, 1,
0.6530141, -0.2764451, 3.202132, 1, 1, 1, 1, 1,
0.654141, 1.559559, -0.3484759, 1, 1, 1, 1, 1,
0.6579044, -0.8032812, 3.479156, 1, 1, 1, 1, 1,
0.6579812, 2.046051, 0.10398, 1, 1, 1, 1, 1,
0.6584234, 0.7224641, -0.2674538, 1, 1, 1, 1, 1,
0.6619641, 0.01772659, 0.8362683, 0, 0, 1, 1, 1,
0.6661123, 0.1441071, -0.8368397, 1, 0, 0, 1, 1,
0.6673194, 0.01566201, 1.497585, 1, 0, 0, 1, 1,
0.6680686, 0.1385078, -0.03639341, 1, 0, 0, 1, 1,
0.6692641, -0.1202706, 1.006028, 1, 0, 0, 1, 1,
0.6695489, -0.1357541, 1.236258, 1, 0, 0, 1, 1,
0.6722047, 0.388632, 1.696088, 0, 0, 0, 1, 1,
0.6744276, 1.289635, 1.359467, 0, 0, 0, 1, 1,
0.6755655, -0.184156, 1.802525, 0, 0, 0, 1, 1,
0.6772603, -0.5083593, 0.3417109, 0, 0, 0, 1, 1,
0.6799591, 0.2560731, 1.093912, 0, 0, 0, 1, 1,
0.682953, -1.083094, 3.091434, 0, 0, 0, 1, 1,
0.6845831, 0.05641044, 1.794124, 0, 0, 0, 1, 1,
0.6871362, 0.5254023, -0.1661633, 1, 1, 1, 1, 1,
0.6880006, -1.461822, 3.334315, 1, 1, 1, 1, 1,
0.6988162, -1.434959, 2.949784, 1, 1, 1, 1, 1,
0.7021996, 1.566316, 1.091205, 1, 1, 1, 1, 1,
0.7073343, -1.294588, 1.849029, 1, 1, 1, 1, 1,
0.7081019, 1.537267, 0.5947501, 1, 1, 1, 1, 1,
0.7105753, 1.308099, 0.7900201, 1, 1, 1, 1, 1,
0.711811, 0.5932308, -0.1176689, 1, 1, 1, 1, 1,
0.7123793, 0.8186187, 1.246426, 1, 1, 1, 1, 1,
0.7179435, -0.7861267, 2.990153, 1, 1, 1, 1, 1,
0.7181004, -1.173303, 3.037646, 1, 1, 1, 1, 1,
0.7206197, -0.448171, 1.726796, 1, 1, 1, 1, 1,
0.7213814, -0.9914954, 3.167434, 1, 1, 1, 1, 1,
0.7322302, 2.239407, 1.322609, 1, 1, 1, 1, 1,
0.7330741, -1.175859, 2.3355, 1, 1, 1, 1, 1,
0.734493, -0.9023581, 3.212737, 0, 0, 1, 1, 1,
0.7375658, 0.356951, 0.2761531, 1, 0, 0, 1, 1,
0.740006, -0.06073986, 2.451145, 1, 0, 0, 1, 1,
0.7403395, 0.6694218, 0.1257994, 1, 0, 0, 1, 1,
0.7406048, -1.579756, 0.8264682, 1, 0, 0, 1, 1,
0.7453657, 2.190777, 1.41936, 1, 0, 0, 1, 1,
0.7510451, 2.44038, 0.6509198, 0, 0, 0, 1, 1,
0.7539895, 1.262828, 2.325574, 0, 0, 0, 1, 1,
0.7573199, 0.9705297, -1.665315, 0, 0, 0, 1, 1,
0.7588706, 0.2522644, 0.8449396, 0, 0, 0, 1, 1,
0.763304, -0.03260976, 1.387376, 0, 0, 0, 1, 1,
0.7722672, -0.3618438, 1.195469, 0, 0, 0, 1, 1,
0.7742577, 0.3985788, 1.499395, 0, 0, 0, 1, 1,
0.7744564, -0.4155114, 1.402861, 1, 1, 1, 1, 1,
0.7751778, -0.9016356, 5.03523, 1, 1, 1, 1, 1,
0.7763744, 0.408333, 1.810748, 1, 1, 1, 1, 1,
0.781503, -0.1202307, 1.11973, 1, 1, 1, 1, 1,
0.788457, 0.2340226, 1.487584, 1, 1, 1, 1, 1,
0.7910027, -0.9851301, 1.765395, 1, 1, 1, 1, 1,
0.7957821, 0.7659861, -1.155301, 1, 1, 1, 1, 1,
0.8000993, 0.1166131, 2.322821, 1, 1, 1, 1, 1,
0.8010226, 1.572041, 0.1222695, 1, 1, 1, 1, 1,
0.8011452, 1.007293, 0.634667, 1, 1, 1, 1, 1,
0.8028124, -1.202957, 3.751222, 1, 1, 1, 1, 1,
0.8043659, -1.002876, 4.04018, 1, 1, 1, 1, 1,
0.8074001, 0.5381795, 0.06065183, 1, 1, 1, 1, 1,
0.8075993, -0.3228318, 0.2586483, 1, 1, 1, 1, 1,
0.8076972, -0.1806035, 0.6567737, 1, 1, 1, 1, 1,
0.8198175, 0.02657782, 0.570017, 0, 0, 1, 1, 1,
0.8254175, 1.551167, 1.312617, 1, 0, 0, 1, 1,
0.8256317, -2.747738, 4.10778, 1, 0, 0, 1, 1,
0.8279539, 0.2307835, 1.62868, 1, 0, 0, 1, 1,
0.8331373, -0.1006916, 2.860008, 1, 0, 0, 1, 1,
0.8332427, 0.6542702, 1.147505, 1, 0, 0, 1, 1,
0.839301, -0.8998107, 1.596326, 0, 0, 0, 1, 1,
0.8428381, -1.043422, 2.807848, 0, 0, 0, 1, 1,
0.8451619, -0.4338724, 2.703749, 0, 0, 0, 1, 1,
0.8484451, -0.4625289, 0.4299537, 0, 0, 0, 1, 1,
0.8524878, -0.3998977, 4.244449, 0, 0, 0, 1, 1,
0.8526271, -0.3673068, 2.058295, 0, 0, 0, 1, 1,
0.8536013, 0.904079, -0.04192629, 0, 0, 0, 1, 1,
0.8574553, -1.60769, 3.558334, 1, 1, 1, 1, 1,
0.8580586, 1.098726, 0.291102, 1, 1, 1, 1, 1,
0.8618824, 0.601197, 1.750815, 1, 1, 1, 1, 1,
0.873493, 1.141688, 0.5603037, 1, 1, 1, 1, 1,
0.8744906, -0.148287, 2.294996, 1, 1, 1, 1, 1,
0.8805991, -1.356397, 3.205137, 1, 1, 1, 1, 1,
0.883881, 1.08512, -0.560764, 1, 1, 1, 1, 1,
0.8874461, -0.3490621, 1.235186, 1, 1, 1, 1, 1,
0.9010997, 0.5867097, 1.609346, 1, 1, 1, 1, 1,
0.9019177, -0.1909625, 1.172683, 1, 1, 1, 1, 1,
0.9260372, 0.6628774, 0.1048641, 1, 1, 1, 1, 1,
0.9301225, -0.6512941, 1.437902, 1, 1, 1, 1, 1,
0.9344791, -1.268493, 1.298344, 1, 1, 1, 1, 1,
0.9351364, -0.6945045, 2.267917, 1, 1, 1, 1, 1,
0.9377463, 0.9855173, -0.5393973, 1, 1, 1, 1, 1,
0.9380902, 0.3353917, 0.6724682, 0, 0, 1, 1, 1,
0.9430215, -1.680278, 2.269714, 1, 0, 0, 1, 1,
0.9431998, 0.650066, 1.996638, 1, 0, 0, 1, 1,
0.9470643, 1.939737, 0.3378056, 1, 0, 0, 1, 1,
0.9482245, -0.3040113, 1.571317, 1, 0, 0, 1, 1,
0.9489984, -0.05159381, 0.3867883, 1, 0, 0, 1, 1,
0.9556465, 2.118281, 1.508925, 0, 0, 0, 1, 1,
0.9591786, 0.1467867, 1.002001, 0, 0, 0, 1, 1,
0.9646553, -0.5675138, 4.340575, 0, 0, 0, 1, 1,
0.9650063, -0.3419683, 3.554463, 0, 0, 0, 1, 1,
0.9673578, -1.356207, 3.542732, 0, 0, 0, 1, 1,
0.9703027, -0.1372977, 2.999556, 0, 0, 0, 1, 1,
0.9716823, 0.7822461, 3.040823, 0, 0, 0, 1, 1,
0.9737868, -0.8784761, 2.730701, 1, 1, 1, 1, 1,
0.9771608, -0.162401, 1.831197, 1, 1, 1, 1, 1,
0.9794667, 0.1789638, -0.4186512, 1, 1, 1, 1, 1,
0.9816473, 0.04689823, 0.6963475, 1, 1, 1, 1, 1,
0.9892372, 0.1293543, 0.7647688, 1, 1, 1, 1, 1,
0.990018, -0.7702873, 2.465474, 1, 1, 1, 1, 1,
0.9901994, -0.0002743504, 2.321167, 1, 1, 1, 1, 1,
1.002211, -1.942726, 2.688433, 1, 1, 1, 1, 1,
1.004626, -1.354592, 0.2359871, 1, 1, 1, 1, 1,
1.004844, -0.1925481, 2.009669, 1, 1, 1, 1, 1,
1.006929, 0.849779, -0.4926244, 1, 1, 1, 1, 1,
1.00777, -0.2227506, 2.281168, 1, 1, 1, 1, 1,
1.014798, 2.004513, -0.6113356, 1, 1, 1, 1, 1,
1.018392, -0.4185765, 1.784185, 1, 1, 1, 1, 1,
1.018804, -1.188647, 1.569737, 1, 1, 1, 1, 1,
1.020239, -1.450756, 1.404549, 0, 0, 1, 1, 1,
1.025476, -0.7570133, 3.240243, 1, 0, 0, 1, 1,
1.03041, -0.3310348, 3.107376, 1, 0, 0, 1, 1,
1.034367, 0.7439996, 0.7474371, 1, 0, 0, 1, 1,
1.036835, 0.1214048, 0.8215029, 1, 0, 0, 1, 1,
1.040771, -1.633162, 0.5996693, 1, 0, 0, 1, 1,
1.045354, 0.3272754, 1.823939, 0, 0, 0, 1, 1,
1.051227, 0.1595154, 1.800587, 0, 0, 0, 1, 1,
1.053366, -0.009684303, 3.587101, 0, 0, 0, 1, 1,
1.055631, -1.56302, 2.962913, 0, 0, 0, 1, 1,
1.058884, -0.667405, 2.698864, 0, 0, 0, 1, 1,
1.06112, -0.1436847, 1.790186, 0, 0, 0, 1, 1,
1.069357, 0.07676625, 0.007175372, 0, 0, 0, 1, 1,
1.07483, -0.05117884, 2.377386, 1, 1, 1, 1, 1,
1.077839, 2.97452, -0.3809015, 1, 1, 1, 1, 1,
1.078424, 0.1541252, 0.946285, 1, 1, 1, 1, 1,
1.08342, -1.811489, 2.692111, 1, 1, 1, 1, 1,
1.089503, -1.257706, 2.537459, 1, 1, 1, 1, 1,
1.090626, -1.821651, 2.190181, 1, 1, 1, 1, 1,
1.091224, -0.06447843, 1.131892, 1, 1, 1, 1, 1,
1.098517, -0.7567161, -0.4878043, 1, 1, 1, 1, 1,
1.108464, -0.6624446, 2.514557, 1, 1, 1, 1, 1,
1.110431, 0.9255441, 0.7751608, 1, 1, 1, 1, 1,
1.112107, 0.3328696, 0.3936115, 1, 1, 1, 1, 1,
1.113594, -1.271695, 2.25764, 1, 1, 1, 1, 1,
1.123075, -1.38199, 2.505799, 1, 1, 1, 1, 1,
1.124019, 0.5541879, 2.71101, 1, 1, 1, 1, 1,
1.124678, -0.2139467, 2.23282, 1, 1, 1, 1, 1,
1.127153, -0.5326632, 2.456505, 0, 0, 1, 1, 1,
1.129683, -0.2347102, 1.103333, 1, 0, 0, 1, 1,
1.129807, -2.747599, 2.451126, 1, 0, 0, 1, 1,
1.136802, 1.057071, 1.738241, 1, 0, 0, 1, 1,
1.148979, -0.9897742, 3.899575, 1, 0, 0, 1, 1,
1.160397, -0.2613445, 2.440513, 1, 0, 0, 1, 1,
1.160667, 1.641567, 1.944425, 0, 0, 0, 1, 1,
1.164365, -1.185585, 1.621124, 0, 0, 0, 1, 1,
1.165664, -0.2381585, 1.502856, 0, 0, 0, 1, 1,
1.166785, 0.2906923, 2.066543, 0, 0, 0, 1, 1,
1.187497, -1.374147, 2.67218, 0, 0, 0, 1, 1,
1.191249, 0.3021758, 1.214862, 0, 0, 0, 1, 1,
1.199705, 0.2737609, 1.911245, 0, 0, 0, 1, 1,
1.200766, 0.9112069, 1.774377, 1, 1, 1, 1, 1,
1.215118, -1.346301, 2.223727, 1, 1, 1, 1, 1,
1.2355, -0.8413969, 0.7629868, 1, 1, 1, 1, 1,
1.239156, -0.2138965, 2.471304, 1, 1, 1, 1, 1,
1.240663, -0.3471738, 0.8117841, 1, 1, 1, 1, 1,
1.246243, -0.9182183, 3.148171, 1, 1, 1, 1, 1,
1.24685, 0.08729107, 1.56108, 1, 1, 1, 1, 1,
1.259414, -1.316848, 1.017803, 1, 1, 1, 1, 1,
1.261284, 0.4218514, 1.849839, 1, 1, 1, 1, 1,
1.263319, -0.04292369, 0.8857613, 1, 1, 1, 1, 1,
1.264097, 1.603799, 0.8146187, 1, 1, 1, 1, 1,
1.270757, 0.9907939, -0.7755741, 1, 1, 1, 1, 1,
1.271329, 0.858515, 0.6966416, 1, 1, 1, 1, 1,
1.28642, -0.4224711, 3.264194, 1, 1, 1, 1, 1,
1.290846, -0.5219674, 3.338628, 1, 1, 1, 1, 1,
1.295146, -1.575414, 3.519599, 0, 0, 1, 1, 1,
1.29839, -0.2359328, -0.5874997, 1, 0, 0, 1, 1,
1.299353, 0.8020267, 0.7115247, 1, 0, 0, 1, 1,
1.302377, -0.4778755, 2.674376, 1, 0, 0, 1, 1,
1.322518, -0.9351943, 3.86142, 1, 0, 0, 1, 1,
1.32587, 0.6204495, 0.8151008, 1, 0, 0, 1, 1,
1.341769, 0.02205876, 0.3648382, 0, 0, 0, 1, 1,
1.351082, 0.1501241, 0.3415563, 0, 0, 0, 1, 1,
1.352395, 1.512958, 0.6486431, 0, 0, 0, 1, 1,
1.361845, -0.009889446, -0.2785817, 0, 0, 0, 1, 1,
1.362822, 1.964067, 0.3165485, 0, 0, 0, 1, 1,
1.364912, 2.401525, 1.799199, 0, 0, 0, 1, 1,
1.368461, 0.1374576, 1.760867, 0, 0, 0, 1, 1,
1.371023, 1.844331, 1.494626, 1, 1, 1, 1, 1,
1.37988, 0.3801749, 1.766122, 1, 1, 1, 1, 1,
1.390823, 2.619418, -1.154298, 1, 1, 1, 1, 1,
1.4046, 0.9980533, 2.443739, 1, 1, 1, 1, 1,
1.412903, -0.8550923, 2.176698, 1, 1, 1, 1, 1,
1.414947, 0.4000084, 2.235317, 1, 1, 1, 1, 1,
1.415348, 0.9303998, -1.232324, 1, 1, 1, 1, 1,
1.416616, -0.09946959, 0.3356435, 1, 1, 1, 1, 1,
1.421076, -1.382456, 0.2158083, 1, 1, 1, 1, 1,
1.421608, 0.9192546, 2.590563, 1, 1, 1, 1, 1,
1.424208, -0.5942667, 0.7543831, 1, 1, 1, 1, 1,
1.427933, 0.5521595, 0.103066, 1, 1, 1, 1, 1,
1.428378, -0.5530813, 0.633827, 1, 1, 1, 1, 1,
1.467185, 1.680594, -1.928259, 1, 1, 1, 1, 1,
1.471107, -2.963198, 3.337897, 1, 1, 1, 1, 1,
1.487131, -0.1173487, 2.441796, 0, 0, 1, 1, 1,
1.491415, 0.236028, -0.08463973, 1, 0, 0, 1, 1,
1.495449, 1.962265, 2.640625, 1, 0, 0, 1, 1,
1.495712, -0.5453494, 3.811652, 1, 0, 0, 1, 1,
1.495796, -2.974102, 0.8137609, 1, 0, 0, 1, 1,
1.505205, 1.50596, 1.691976, 1, 0, 0, 1, 1,
1.508154, 1.416118, 0.6717012, 0, 0, 0, 1, 1,
1.515858, -0.153152, -0.5100171, 0, 0, 0, 1, 1,
1.51673, -1.078871, 4.365253, 0, 0, 0, 1, 1,
1.525912, -0.2293761, 1.132909, 0, 0, 0, 1, 1,
1.530388, -0.2571013, 1.084035, 0, 0, 0, 1, 1,
1.531489, 1.296324, 1.014194, 0, 0, 0, 1, 1,
1.532827, 2.147321, 0.2917524, 0, 0, 0, 1, 1,
1.538816, -0.8245003, 1.520326, 1, 1, 1, 1, 1,
1.543123, 0.239784, 0.4304218, 1, 1, 1, 1, 1,
1.544926, -1.254008, 4.514296, 1, 1, 1, 1, 1,
1.554695, 0.7280446, -0.4315466, 1, 1, 1, 1, 1,
1.557825, -0.3712342, 1.338299, 1, 1, 1, 1, 1,
1.559832, -0.1133887, 1.97377, 1, 1, 1, 1, 1,
1.561555, -0.08416756, 2.534012, 1, 1, 1, 1, 1,
1.56657, 0.8042992, 2.432198, 1, 1, 1, 1, 1,
1.569766, -1.206197, 2.193313, 1, 1, 1, 1, 1,
1.573174, -0.1288962, 1.187088, 1, 1, 1, 1, 1,
1.590749, -1.959227, 2.8454, 1, 1, 1, 1, 1,
1.593508, 0.9566488, 1.362894, 1, 1, 1, 1, 1,
1.597617, 0.8133212, 0.553122, 1, 1, 1, 1, 1,
1.599121, -1.196544, 3.264868, 1, 1, 1, 1, 1,
1.633767, -0.005833697, 0.3133598, 1, 1, 1, 1, 1,
1.635761, -1.334574, 2.171422, 0, 0, 1, 1, 1,
1.651377, 0.8488643, 1.590794, 1, 0, 0, 1, 1,
1.662459, 1.168735, 1.740987, 1, 0, 0, 1, 1,
1.697215, 0.7375119, 1.226745, 1, 0, 0, 1, 1,
1.71087, 1.301078, 0.9305789, 1, 0, 0, 1, 1,
1.718792, 0.8893686, 2.900957, 1, 0, 0, 1, 1,
1.722948, -1.736152, 1.513261, 0, 0, 0, 1, 1,
1.723455, 1.422172, 0.3216077, 0, 0, 0, 1, 1,
1.742035, -1.916191, 1.589758, 0, 0, 0, 1, 1,
1.742146, -0.1443686, 1.2698, 0, 0, 0, 1, 1,
1.818511, -0.9162698, 1.902706, 0, 0, 0, 1, 1,
1.819487, -0.04807215, 1.952748, 0, 0, 0, 1, 1,
1.836904, 1.034345, 2.802954, 0, 0, 0, 1, 1,
1.844018, 1.230138, 1.453472, 1, 1, 1, 1, 1,
1.84548, -0.104449, 1.517632, 1, 1, 1, 1, 1,
1.845842, -0.1884432, 0.3736622, 1, 1, 1, 1, 1,
1.870321, -0.158375, 0.7011454, 1, 1, 1, 1, 1,
1.88147, 1.708667, 1.719348, 1, 1, 1, 1, 1,
1.909328, -0.02555034, 0.557409, 1, 1, 1, 1, 1,
1.928596, -0.8288099, 1.43066, 1, 1, 1, 1, 1,
1.936206, 0.5276084, 2.633147, 1, 1, 1, 1, 1,
1.940619, -0.4758809, 3.661436, 1, 1, 1, 1, 1,
1.953212, -0.3250624, 1.978762, 1, 1, 1, 1, 1,
1.997679, -0.4161482, 1.347618, 1, 1, 1, 1, 1,
2.019176, 0.4097544, 3.678093, 1, 1, 1, 1, 1,
2.022753, -1.138235, 1.443896, 1, 1, 1, 1, 1,
2.025536, 0.1829603, 0.8999019, 1, 1, 1, 1, 1,
2.050444, 1.680137, -0.4212945, 1, 1, 1, 1, 1,
2.05118, 0.9859802, 0.5031385, 0, 0, 1, 1, 1,
2.065253, 0.6722592, 1.708958, 1, 0, 0, 1, 1,
2.082472, -1.117643, 4.66623, 1, 0, 0, 1, 1,
2.103423, 0.537134, 1.606207, 1, 0, 0, 1, 1,
2.109936, 0.2065119, 1.248895, 1, 0, 0, 1, 1,
2.15637, -0.2803478, 1.796946, 1, 0, 0, 1, 1,
2.174604, -0.2503525, 2.15895, 0, 0, 0, 1, 1,
2.228111, -0.3667491, 1.672537, 0, 0, 0, 1, 1,
2.231768, -0.7591529, 1.789011, 0, 0, 0, 1, 1,
2.235444, -0.04827702, 2.91219, 0, 0, 0, 1, 1,
2.258239, 1.430236, 1.877355, 0, 0, 0, 1, 1,
2.302418, 0.01253409, 0.9649273, 0, 0, 0, 1, 1,
2.416358, 1.393002, 0.9366149, 0, 0, 0, 1, 1,
2.43269, 0.9984958, 2.799218, 1, 1, 1, 1, 1,
2.63052, 0.9695989, 1.174049, 1, 1, 1, 1, 1,
2.666721, -1.594517, 1.677616, 1, 1, 1, 1, 1,
2.763962, -0.9135292, 1.221351, 1, 1, 1, 1, 1,
2.817716, -0.1545857, 0.9564583, 1, 1, 1, 1, 1,
2.861658, 0.05090936, 0.977654, 1, 1, 1, 1, 1,
3.222251, -1.033116, 0.9880002, 1, 1, 1, 1, 1
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
var radius = 9.576712;
var distance = 33.6378;
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
mvMatrix.translate( 0.09519482, -0.1819539, 0.1702595 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6378);
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
