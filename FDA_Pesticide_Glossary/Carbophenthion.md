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
-2.878385, -0.7581831, -0.4995498, 1, 0, 0, 1,
-2.624898, -0.3380747, -0.04230778, 1, 0.007843138, 0, 1,
-2.616945, -1.82552, -3.6551, 1, 0.01176471, 0, 1,
-2.594748, 0.8178794, -1.705881, 1, 0.01960784, 0, 1,
-2.457551, 0.1093922, -1.058575, 1, 0.02352941, 0, 1,
-2.412665, -0.09553172, -0.1208822, 1, 0.03137255, 0, 1,
-2.395674, -0.4142914, -3.338561, 1, 0.03529412, 0, 1,
-2.385347, -0.2300996, -2.136065, 1, 0.04313726, 0, 1,
-2.379538, 1.22135, -0.9750558, 1, 0.04705882, 0, 1,
-2.372753, 0.7604923, -1.43091, 1, 0.05490196, 0, 1,
-2.367317, 1.903569, -2.132572, 1, 0.05882353, 0, 1,
-2.365341, -0.05626826, -2.222096, 1, 0.06666667, 0, 1,
-2.357618, -0.9553458, -1.11737, 1, 0.07058824, 0, 1,
-2.331701, -0.09569812, 0.4142352, 1, 0.07843138, 0, 1,
-2.257374, 0.6107294, -0.2727057, 1, 0.08235294, 0, 1,
-2.220193, -0.8041363, -0.1956792, 1, 0.09019608, 0, 1,
-2.205943, -0.9543194, -0.9095315, 1, 0.09411765, 0, 1,
-2.159985, -0.486672, -0.5394583, 1, 0.1019608, 0, 1,
-2.061289, -1.671411, -2.397078, 1, 0.1098039, 0, 1,
-2.055374, 0.9487864, -1.155707, 1, 0.1137255, 0, 1,
-2.043062, -0.9163634, -1.210657, 1, 0.1215686, 0, 1,
-2.042224, 1.184457, -2.644811, 1, 0.1254902, 0, 1,
-2.016251, 0.0792033, 0.5186034, 1, 0.1333333, 0, 1,
-2.015153, 0.1912149, -0.6965567, 1, 0.1372549, 0, 1,
-2.010307, 0.1939961, -1.603306, 1, 0.145098, 0, 1,
-2.009472, 1.553968, 0.1084871, 1, 0.1490196, 0, 1,
-1.99648, -0.585094, -1.155463, 1, 0.1568628, 0, 1,
-1.990931, -0.2306367, -4.287461, 1, 0.1607843, 0, 1,
-1.954594, -0.6678656, -0.04082929, 1, 0.1686275, 0, 1,
-1.93256, -0.00117944, -0.6513484, 1, 0.172549, 0, 1,
-1.924403, -1.803123, -4.022239, 1, 0.1803922, 0, 1,
-1.913461, -1.156501, -2.230862, 1, 0.1843137, 0, 1,
-1.906458, -0.3556499, -1.651124, 1, 0.1921569, 0, 1,
-1.897823, -0.7597013, -1.131323, 1, 0.1960784, 0, 1,
-1.894083, 0.1134775, -1.858558, 1, 0.2039216, 0, 1,
-1.891054, -0.1276668, -2.247392, 1, 0.2117647, 0, 1,
-1.839198, -0.4234814, -2.91503, 1, 0.2156863, 0, 1,
-1.834187, 1.255973, -0.1623241, 1, 0.2235294, 0, 1,
-1.814046, -0.4648467, -2.685648, 1, 0.227451, 0, 1,
-1.784637, 0.5215815, -1.218382, 1, 0.2352941, 0, 1,
-1.769083, -1.488477, -2.636372, 1, 0.2392157, 0, 1,
-1.763529, 0.2347137, -0.7205781, 1, 0.2470588, 0, 1,
-1.75302, 0.04318048, -2.223444, 1, 0.2509804, 0, 1,
-1.743231, 1.134283, -0.9266264, 1, 0.2588235, 0, 1,
-1.742742, -0.006663676, -1.863318, 1, 0.2627451, 0, 1,
-1.737127, -0.2019822, -1.455412, 1, 0.2705882, 0, 1,
-1.726111, -1.074023, -0.483835, 1, 0.2745098, 0, 1,
-1.700433, -1.845693, -2.216715, 1, 0.282353, 0, 1,
-1.674658, 0.3099267, -0.4666186, 1, 0.2862745, 0, 1,
-1.66843, 0.4726707, -1.009798, 1, 0.2941177, 0, 1,
-1.661596, -0.1296015, -0.5555881, 1, 0.3019608, 0, 1,
-1.661293, -0.1226464, -1.285691, 1, 0.3058824, 0, 1,
-1.65709, 1.320778, -1.137136, 1, 0.3137255, 0, 1,
-1.64901, 0.3146203, -1.360121, 1, 0.3176471, 0, 1,
-1.647332, 0.721208, -1.288461, 1, 0.3254902, 0, 1,
-1.633901, 1.068224, -2.690663, 1, 0.3294118, 0, 1,
-1.629866, -1.043972, -3.495384, 1, 0.3372549, 0, 1,
-1.624185, 1.032521, -2.441183, 1, 0.3411765, 0, 1,
-1.616849, 0.3548567, 1.201033, 1, 0.3490196, 0, 1,
-1.615096, -0.560729, -1.474551, 1, 0.3529412, 0, 1,
-1.606475, 1.066061, -1.207289, 1, 0.3607843, 0, 1,
-1.606092, 1.696065, -0.3369069, 1, 0.3647059, 0, 1,
-1.581903, -1.990315, -2.261518, 1, 0.372549, 0, 1,
-1.579802, -0.3486412, -0.5903748, 1, 0.3764706, 0, 1,
-1.571067, 0.7768804, -1.460556, 1, 0.3843137, 0, 1,
-1.561606, -0.3742457, -2.486007, 1, 0.3882353, 0, 1,
-1.556757, 0.3304844, -2.209493, 1, 0.3960784, 0, 1,
-1.538906, -2.462479, -2.181095, 1, 0.4039216, 0, 1,
-1.532574, 0.9488921, -2.404759, 1, 0.4078431, 0, 1,
-1.526014, 0.05338746, -1.83015, 1, 0.4156863, 0, 1,
-1.50786, 0.2169982, -0.5529935, 1, 0.4196078, 0, 1,
-1.487127, 0.4951774, -1.498832, 1, 0.427451, 0, 1,
-1.485464, -0.00571762, -2.530642, 1, 0.4313726, 0, 1,
-1.484912, -2.020975, -1.511892, 1, 0.4392157, 0, 1,
-1.471135, -0.4724002, -1.811285, 1, 0.4431373, 0, 1,
-1.470837, -0.2793489, 0.2371598, 1, 0.4509804, 0, 1,
-1.470019, 0.8030487, -1.720973, 1, 0.454902, 0, 1,
-1.465673, 0.2917104, -2.319295, 1, 0.4627451, 0, 1,
-1.461087, -0.834085, -2.990229, 1, 0.4666667, 0, 1,
-1.45881, -1.071942, -2.054703, 1, 0.4745098, 0, 1,
-1.446351, -1.474687, -1.45749, 1, 0.4784314, 0, 1,
-1.442959, -1.33755, -2.740218, 1, 0.4862745, 0, 1,
-1.416041, 0.4516844, -1.746142, 1, 0.4901961, 0, 1,
-1.414989, 0.08954287, -1.723649, 1, 0.4980392, 0, 1,
-1.405027, -0.6311171, -0.8859282, 1, 0.5058824, 0, 1,
-1.404226, -0.5243549, -1.283004, 1, 0.509804, 0, 1,
-1.390568, -0.2962646, -2.953173, 1, 0.5176471, 0, 1,
-1.381184, -0.7316496, -3.069115, 1, 0.5215687, 0, 1,
-1.3762, 0.1145899, -1.328751, 1, 0.5294118, 0, 1,
-1.373276, -1.493554, -1.812632, 1, 0.5333334, 0, 1,
-1.373177, 0.5891318, -2.263846, 1, 0.5411765, 0, 1,
-1.364307, -0.6298462, -3.181435, 1, 0.5450981, 0, 1,
-1.34786, 0.5539227, -1.383353, 1, 0.5529412, 0, 1,
-1.336424, 0.7043167, -1.625772, 1, 0.5568628, 0, 1,
-1.332101, -1.063127, -2.082562, 1, 0.5647059, 0, 1,
-1.325698, 0.09981295, -2.884916, 1, 0.5686275, 0, 1,
-1.322369, -1.212163, -2.721748, 1, 0.5764706, 0, 1,
-1.320138, 0.397538, -1.29981, 1, 0.5803922, 0, 1,
-1.319919, 0.3784605, -2.153819, 1, 0.5882353, 0, 1,
-1.313522, 0.8912722, -2.329476, 1, 0.5921569, 0, 1,
-1.299591, -0.08038781, -1.998699, 1, 0.6, 0, 1,
-1.299037, 0.2316081, -2.029497, 1, 0.6078432, 0, 1,
-1.298805, -1.130998, -2.721292, 1, 0.6117647, 0, 1,
-1.288341, 1.197396, -2.49411, 1, 0.6196079, 0, 1,
-1.281514, 0.7989337, -1.570712, 1, 0.6235294, 0, 1,
-1.28099, 0.03492761, 0.1688172, 1, 0.6313726, 0, 1,
-1.276831, -0.2549581, -1.05078, 1, 0.6352941, 0, 1,
-1.276747, 0.8222404, -3.287955, 1, 0.6431373, 0, 1,
-1.27301, 0.8815463, -1.635032, 1, 0.6470588, 0, 1,
-1.251177, -1.440547, -1.684925, 1, 0.654902, 0, 1,
-1.244679, -0.8249329, -2.659778, 1, 0.6588235, 0, 1,
-1.232363, 0.1048662, -0.5255324, 1, 0.6666667, 0, 1,
-1.226194, 1.183507, 0.4161108, 1, 0.6705883, 0, 1,
-1.224785, -0.1420861, -2.283155, 1, 0.6784314, 0, 1,
-1.220506, 0.8910214, -1.571298, 1, 0.682353, 0, 1,
-1.218564, 1.030778, -2.079781, 1, 0.6901961, 0, 1,
-1.217453, -0.4164394, -1.098414, 1, 0.6941177, 0, 1,
-1.215082, -0.05078467, -2.369978, 1, 0.7019608, 0, 1,
-1.214869, -0.1740077, -0.7464032, 1, 0.7098039, 0, 1,
-1.207236, 0.1086901, -1.370952, 1, 0.7137255, 0, 1,
-1.201831, 0.1194558, -1.742662, 1, 0.7215686, 0, 1,
-1.190241, -1.130049, -3.810169, 1, 0.7254902, 0, 1,
-1.18638, -0.9228531, -4.760921, 1, 0.7333333, 0, 1,
-1.184657, -0.5983296, -2.975554, 1, 0.7372549, 0, 1,
-1.182385, -0.01248207, 0.03932074, 1, 0.7450981, 0, 1,
-1.182351, -1.596322, -1.07767, 1, 0.7490196, 0, 1,
-1.179041, 0.726323, -1.608264, 1, 0.7568628, 0, 1,
-1.17812, 1.649922, -0.839556, 1, 0.7607843, 0, 1,
-1.176159, 0.8458193, -1.42436, 1, 0.7686275, 0, 1,
-1.175139, 0.7151031, 0.5813922, 1, 0.772549, 0, 1,
-1.16732, -0.1075683, -2.244015, 1, 0.7803922, 0, 1,
-1.157225, 0.7868447, -1.018371, 1, 0.7843137, 0, 1,
-1.157215, -0.5013892, -3.4146, 1, 0.7921569, 0, 1,
-1.152859, -0.7913817, -1.185831, 1, 0.7960784, 0, 1,
-1.14116, 1.246282, -2.44518, 1, 0.8039216, 0, 1,
-1.134262, 0.3821166, -1.093952, 1, 0.8117647, 0, 1,
-1.132568, 0.3091915, -1.066601, 1, 0.8156863, 0, 1,
-1.127476, 1.270625, 0.02383545, 1, 0.8235294, 0, 1,
-1.124791, -2.5247, -4.27895, 1, 0.827451, 0, 1,
-1.119723, -0.2797571, 0.7025927, 1, 0.8352941, 0, 1,
-1.119114, -0.1778387, -3.41321, 1, 0.8392157, 0, 1,
-1.108185, 1.737395, -1.149554, 1, 0.8470588, 0, 1,
-1.104712, 0.3412411, -1.084013, 1, 0.8509804, 0, 1,
-1.103979, 0.9704688, -3.782121, 1, 0.8588235, 0, 1,
-1.102642, -0.2256052, -0.4219915, 1, 0.8627451, 0, 1,
-1.100294, -0.02080351, 0.278346, 1, 0.8705882, 0, 1,
-1.088976, -0.18119, -1.951087, 1, 0.8745098, 0, 1,
-1.085705, -1.348378, -1.259597, 1, 0.8823529, 0, 1,
-1.080969, 0.5753517, -1.657222, 1, 0.8862745, 0, 1,
-1.08008, 0.2797909, -3.560448, 1, 0.8941177, 0, 1,
-1.074872, 1.297875, -2.166191, 1, 0.8980392, 0, 1,
-1.074675, 0.7613629, -0.9871265, 1, 0.9058824, 0, 1,
-1.074633, 0.1558597, -1.967857, 1, 0.9137255, 0, 1,
-1.069661, 1.029698, -1.712377, 1, 0.9176471, 0, 1,
-1.06915, 0.7030944, -0.07035, 1, 0.9254902, 0, 1,
-1.068891, -0.6966434, -0.6609458, 1, 0.9294118, 0, 1,
-1.068712, -0.6718819, -1.342451, 1, 0.9372549, 0, 1,
-1.05691, -0.01992639, -2.782121, 1, 0.9411765, 0, 1,
-1.052621, -1.239618, -3.11301, 1, 0.9490196, 0, 1,
-1.050891, 0.819479, 0.5022641, 1, 0.9529412, 0, 1,
-1.050183, -0.4168488, -1.353423, 1, 0.9607843, 0, 1,
-1.035635, -0.8096431, -2.067565, 1, 0.9647059, 0, 1,
-1.030052, 0.5093414, -0.9068171, 1, 0.972549, 0, 1,
-1.02622, -0.05966979, -1.065264, 1, 0.9764706, 0, 1,
-1.025883, -1.226534, -2.35595, 1, 0.9843137, 0, 1,
-1.0229, 0.1919031, 0.3546647, 1, 0.9882353, 0, 1,
-1.019308, -0.6301804, -4.832157, 1, 0.9960784, 0, 1,
-1.015619, -0.6241124, -1.414473, 0.9960784, 1, 0, 1,
-1.01051, -1.310404, -1.958277, 0.9921569, 1, 0, 1,
-1.005886, -0.826353, -2.318302, 0.9843137, 1, 0, 1,
-1.001495, 0.3506644, -1.196754, 0.9803922, 1, 0, 1,
-0.9999553, 1.927398, -0.3005903, 0.972549, 1, 0, 1,
-0.9968722, 1.471747, -1.334618, 0.9686275, 1, 0, 1,
-0.9938788, 0.3617824, 0.2243208, 0.9607843, 1, 0, 1,
-0.9898534, -0.2809118, -4.277002, 0.9568627, 1, 0, 1,
-0.9882648, -1.190108, -2.563907, 0.9490196, 1, 0, 1,
-0.9847073, 0.6871596, -1.31739, 0.945098, 1, 0, 1,
-0.9844319, -0.9331657, -2.787593, 0.9372549, 1, 0, 1,
-0.9767243, 1.748821, -0.8460295, 0.9333333, 1, 0, 1,
-0.9654041, -1.524921, -1.310533, 0.9254902, 1, 0, 1,
-0.9653767, -0.1449465, -2.581259, 0.9215686, 1, 0, 1,
-0.9614966, 1.071584, 0.4747705, 0.9137255, 1, 0, 1,
-0.9476281, 1.034181, -1.427028, 0.9098039, 1, 0, 1,
-0.9416354, -0.4626551, -2.653511, 0.9019608, 1, 0, 1,
-0.9400558, 0.3544778, -1.627178, 0.8941177, 1, 0, 1,
-0.9327817, -0.6645964, -1.549865, 0.8901961, 1, 0, 1,
-0.926242, 1.947304, 0.7349856, 0.8823529, 1, 0, 1,
-0.9195369, 0.4792042, -1.531442, 0.8784314, 1, 0, 1,
-0.9064347, -0.3946548, -3.23172, 0.8705882, 1, 0, 1,
-0.9055905, 0.07221978, -1.362347, 0.8666667, 1, 0, 1,
-0.9007083, -0.6622763, -2.976913, 0.8588235, 1, 0, 1,
-0.8971514, 0.1726604, -1.83197, 0.854902, 1, 0, 1,
-0.8964585, -0.1449022, -1.151865, 0.8470588, 1, 0, 1,
-0.8845732, -0.0340167, -1.764367, 0.8431373, 1, 0, 1,
-0.8843815, 1.131781, 0.6104797, 0.8352941, 1, 0, 1,
-0.8822981, 0.1147724, -1.962772, 0.8313726, 1, 0, 1,
-0.8815303, 0.03206372, -1.34924, 0.8235294, 1, 0, 1,
-0.8781921, 0.4658251, -2.061683, 0.8196079, 1, 0, 1,
-0.8772665, 1.789891, -2.333443, 0.8117647, 1, 0, 1,
-0.8724666, 0.9601971, -1.403134, 0.8078431, 1, 0, 1,
-0.8714061, 0.9307979, -0.3202719, 0.8, 1, 0, 1,
-0.8672656, -0.7156961, -2.096032, 0.7921569, 1, 0, 1,
-0.8668569, 0.4082206, -2.239673, 0.7882353, 1, 0, 1,
-0.8665455, 0.6043765, 0.3358196, 0.7803922, 1, 0, 1,
-0.8644308, 1.029292, -0.7093914, 0.7764706, 1, 0, 1,
-0.8643312, 0.06204357, -0.9711462, 0.7686275, 1, 0, 1,
-0.8565511, -0.1259895, -0.7159957, 0.7647059, 1, 0, 1,
-0.8494551, 0.7990546, -1.690484, 0.7568628, 1, 0, 1,
-0.8421515, -2.255302, -1.419535, 0.7529412, 1, 0, 1,
-0.8367243, 0.06720066, -0.01024706, 0.7450981, 1, 0, 1,
-0.8219143, 1.633237, -0.8123955, 0.7411765, 1, 0, 1,
-0.8196629, -0.001207005, -1.434592, 0.7333333, 1, 0, 1,
-0.8186587, 0.9233215, -0.7730696, 0.7294118, 1, 0, 1,
-0.8155784, -1.629887, -2.517699, 0.7215686, 1, 0, 1,
-0.8151425, 0.5874919, -0.9219136, 0.7176471, 1, 0, 1,
-0.8127083, -0.5276258, -1.925933, 0.7098039, 1, 0, 1,
-0.8111076, -0.5618958, -2.438886, 0.7058824, 1, 0, 1,
-0.8108076, 0.3888345, -2.02269, 0.6980392, 1, 0, 1,
-0.8087733, 0.3795371, -3.882534, 0.6901961, 1, 0, 1,
-0.8074877, 0.3267207, -1.198487, 0.6862745, 1, 0, 1,
-0.8053163, -2.055476, -2.863503, 0.6784314, 1, 0, 1,
-0.8053086, 0.2419509, -1.390441, 0.6745098, 1, 0, 1,
-0.7940004, -2.662747, -2.67473, 0.6666667, 1, 0, 1,
-0.7909678, 0.6655433, -0.09621778, 0.6627451, 1, 0, 1,
-0.7902543, 0.1774125, -1.266831, 0.654902, 1, 0, 1,
-0.7898263, -2.275388, -2.770633, 0.6509804, 1, 0, 1,
-0.7817369, -1.160869, -2.02099, 0.6431373, 1, 0, 1,
-0.7696497, -1.87954, -4.823526, 0.6392157, 1, 0, 1,
-0.7672674, 0.6504374, -0.9214563, 0.6313726, 1, 0, 1,
-0.7642347, -0.5845467, -1.851153, 0.627451, 1, 0, 1,
-0.7605693, 0.3340751, -0.8037705, 0.6196079, 1, 0, 1,
-0.7564734, -0.005702497, 0.03466452, 0.6156863, 1, 0, 1,
-0.7502002, 1.351316, -0.6239869, 0.6078432, 1, 0, 1,
-0.744208, -0.3454688, -1.86879, 0.6039216, 1, 0, 1,
-0.7417846, 1.371905, -1.866173, 0.5960785, 1, 0, 1,
-0.7401785, 0.009507843, -2.725243, 0.5882353, 1, 0, 1,
-0.7373396, 0.5228837, -2.267425, 0.5843138, 1, 0, 1,
-0.7366792, -1.115401, -4.425158, 0.5764706, 1, 0, 1,
-0.7359895, 0.9991188, -1.051589, 0.572549, 1, 0, 1,
-0.7273971, 0.5235797, -1.586482, 0.5647059, 1, 0, 1,
-0.726079, -0.7403955, -3.017317, 0.5607843, 1, 0, 1,
-0.7202899, 0.1781781, -3.559647, 0.5529412, 1, 0, 1,
-0.7174981, -0.0841622, -1.405076, 0.5490196, 1, 0, 1,
-0.7170514, -0.6101004, -2.158386, 0.5411765, 1, 0, 1,
-0.7118729, -0.7253169, -2.068282, 0.5372549, 1, 0, 1,
-0.6950172, 0.3691552, -1.367922, 0.5294118, 1, 0, 1,
-0.6943148, -0.2588325, -1.333735, 0.5254902, 1, 0, 1,
-0.6927468, -0.9769077, -1.600599, 0.5176471, 1, 0, 1,
-0.6925712, -0.3119398, -3.176853, 0.5137255, 1, 0, 1,
-0.6908906, -0.8364483, -1.422973, 0.5058824, 1, 0, 1,
-0.6902737, 0.48599, -0.6029558, 0.5019608, 1, 0, 1,
-0.6862909, -0.546441, -2.973114, 0.4941176, 1, 0, 1,
-0.6859373, -0.4402548, -2.817275, 0.4862745, 1, 0, 1,
-0.683686, -1.365984, -2.461657, 0.4823529, 1, 0, 1,
-0.6789588, 0.7917503, -1.613081, 0.4745098, 1, 0, 1,
-0.6788687, 1.823213, 0.6115581, 0.4705882, 1, 0, 1,
-0.6758472, 0.5634536, -1.136939, 0.4627451, 1, 0, 1,
-0.6690335, -0.1239436, -2.331257, 0.4588235, 1, 0, 1,
-0.6658006, -1.95744, -2.410643, 0.4509804, 1, 0, 1,
-0.665474, 0.5167803, -0.6820833, 0.4470588, 1, 0, 1,
-0.6645067, -1.927654, -2.38379, 0.4392157, 1, 0, 1,
-0.6639956, 1.649053, -0.7483602, 0.4352941, 1, 0, 1,
-0.6592998, 0.05260893, -0.4856398, 0.427451, 1, 0, 1,
-0.6521947, 0.2895628, -2.657692, 0.4235294, 1, 0, 1,
-0.652055, -0.8420749, -1.766697, 0.4156863, 1, 0, 1,
-0.6482219, 1.781641, 0.9565335, 0.4117647, 1, 0, 1,
-0.6458454, -0.4692729, -1.440395, 0.4039216, 1, 0, 1,
-0.6447951, -0.7292272, -3.318282, 0.3960784, 1, 0, 1,
-0.6433495, -0.2321921, -0.6770802, 0.3921569, 1, 0, 1,
-0.6388721, 1.461806, -0.1835534, 0.3843137, 1, 0, 1,
-0.6376895, -0.9439718, -4.390367, 0.3803922, 1, 0, 1,
-0.6331545, -1.349692, -1.905847, 0.372549, 1, 0, 1,
-0.6317928, -0.1681755, -1.251968, 0.3686275, 1, 0, 1,
-0.6294398, -0.6296744, 0.4667612, 0.3607843, 1, 0, 1,
-0.6227187, 3.194973, -1.376909, 0.3568628, 1, 0, 1,
-0.6223486, -1.090492, -2.925566, 0.3490196, 1, 0, 1,
-0.6219338, -1.444663, -2.759147, 0.345098, 1, 0, 1,
-0.620988, 1.490369, -1.577972, 0.3372549, 1, 0, 1,
-0.6195582, -0.692453, -2.018725, 0.3333333, 1, 0, 1,
-0.6191934, 2.365072, -0.1714443, 0.3254902, 1, 0, 1,
-0.6186147, 2.018754, 0.0001012366, 0.3215686, 1, 0, 1,
-0.6070113, 0.6051129, -0.6586325, 0.3137255, 1, 0, 1,
-0.603534, 1.451681, -0.8936062, 0.3098039, 1, 0, 1,
-0.6035076, -0.1862417, -1.303584, 0.3019608, 1, 0, 1,
-0.6006924, 0.5727238, 0.6435782, 0.2941177, 1, 0, 1,
-0.5976207, 0.0194051, -1.165141, 0.2901961, 1, 0, 1,
-0.5971451, -0.159916, -2.959862, 0.282353, 1, 0, 1,
-0.5928519, -0.8073362, -3.571323, 0.2784314, 1, 0, 1,
-0.592536, -0.4116134, -0.9165316, 0.2705882, 1, 0, 1,
-0.5911653, -0.7930274, -3.119181, 0.2666667, 1, 0, 1,
-0.5899028, -2.393955, -3.201, 0.2588235, 1, 0, 1,
-0.5897192, 0.1145318, -2.137391, 0.254902, 1, 0, 1,
-0.5850917, 0.1621986, -1.603431, 0.2470588, 1, 0, 1,
-0.5842938, -0.6040546, -0.6644948, 0.2431373, 1, 0, 1,
-0.5840693, -0.02850268, -1.65315, 0.2352941, 1, 0, 1,
-0.5827664, -0.792499, -1.544431, 0.2313726, 1, 0, 1,
-0.5803662, 1.876523, -0.06517028, 0.2235294, 1, 0, 1,
-0.5674032, -0.8147733, -3.318593, 0.2196078, 1, 0, 1,
-0.565142, 0.6288134, 0.4098438, 0.2117647, 1, 0, 1,
-0.5521113, -0.08424819, -0.1937709, 0.2078431, 1, 0, 1,
-0.5509381, 1.813262, 1.64027, 0.2, 1, 0, 1,
-0.5499835, -1.129333, -1.922243, 0.1921569, 1, 0, 1,
-0.545523, 1.684767, -0.1556701, 0.1882353, 1, 0, 1,
-0.5418127, -1.297942, -2.876081, 0.1803922, 1, 0, 1,
-0.539324, -0.6261719, -2.276053, 0.1764706, 1, 0, 1,
-0.5376449, 0.4380547, -0.00504467, 0.1686275, 1, 0, 1,
-0.5373699, 1.230556, 0.1664742, 0.1647059, 1, 0, 1,
-0.5370625, 0.02727421, -1.703451, 0.1568628, 1, 0, 1,
-0.5359719, 1.117565, -0.08591711, 0.1529412, 1, 0, 1,
-0.5358689, 2.319193, -0.5635855, 0.145098, 1, 0, 1,
-0.5342842, 1.006997, 0.8248232, 0.1411765, 1, 0, 1,
-0.5248069, 2.115319, -1.127112, 0.1333333, 1, 0, 1,
-0.5225698, 2.089456, 0.7056672, 0.1294118, 1, 0, 1,
-0.5055661, 0.7631531, 0.1392755, 0.1215686, 1, 0, 1,
-0.5038296, 1.658146, -0.7247894, 0.1176471, 1, 0, 1,
-0.5006752, -0.2110024, 0.3132629, 0.1098039, 1, 0, 1,
-0.498762, -0.05066312, -1.857183, 0.1058824, 1, 0, 1,
-0.4983284, -1.187679, -1.183881, 0.09803922, 1, 0, 1,
-0.4967578, 0.9665017, -1.102682, 0.09019608, 1, 0, 1,
-0.4863968, 1.471768, -1.3582, 0.08627451, 1, 0, 1,
-0.4851506, 0.3256089, -3.91366, 0.07843138, 1, 0, 1,
-0.4840548, 1.943085, -0.09000564, 0.07450981, 1, 0, 1,
-0.4829482, 1.434968, -0.817753, 0.06666667, 1, 0, 1,
-0.4792559, 0.5479227, -1.543896, 0.0627451, 1, 0, 1,
-0.4778993, 0.8383246, -0.9735318, 0.05490196, 1, 0, 1,
-0.4774272, -0.7390769, -0.4544364, 0.05098039, 1, 0, 1,
-0.4768214, -0.816313, -3.004886, 0.04313726, 1, 0, 1,
-0.4688298, -0.6803194, -1.640536, 0.03921569, 1, 0, 1,
-0.4647978, -0.4163037, -2.036221, 0.03137255, 1, 0, 1,
-0.4633842, -1.637176, -1.911584, 0.02745098, 1, 0, 1,
-0.4615195, -0.6049018, -2.094915, 0.01960784, 1, 0, 1,
-0.4609133, 0.2667381, -1.83635, 0.01568628, 1, 0, 1,
-0.4606832, 1.282977, -2.701959, 0.007843138, 1, 0, 1,
-0.4556674, -0.3767644, -2.886587, 0.003921569, 1, 0, 1,
-0.4541432, -0.2092081, -0.5278003, 0, 1, 0.003921569, 1,
-0.4486347, -1.856919, -2.767046, 0, 1, 0.01176471, 1,
-0.4453097, 1.811516, -1.137446, 0, 1, 0.01568628, 1,
-0.4451393, -1.035409, -2.139383, 0, 1, 0.02352941, 1,
-0.4416322, 2.827406, 0.633493, 0, 1, 0.02745098, 1,
-0.4381783, 0.3589285, -0.2996722, 0, 1, 0.03529412, 1,
-0.4374038, -1.190708, -1.861026, 0, 1, 0.03921569, 1,
-0.4360906, -1.321566, -2.260295, 0, 1, 0.04705882, 1,
-0.4280775, 0.7591702, -0.9514012, 0, 1, 0.05098039, 1,
-0.4267943, -1.455101, -2.163932, 0, 1, 0.05882353, 1,
-0.4242786, -1.876059, -3.983116, 0, 1, 0.0627451, 1,
-0.4230373, 0.108524, -2.318047, 0, 1, 0.07058824, 1,
-0.4226787, -0.8549445, -1.788463, 0, 1, 0.07450981, 1,
-0.4147633, 0.2278979, 0.0972899, 0, 1, 0.08235294, 1,
-0.4142361, -0.05355448, -2.600712, 0, 1, 0.08627451, 1,
-0.4142198, -0.6840041, -4.32473, 0, 1, 0.09411765, 1,
-0.4101939, -0.170056, -1.167813, 0, 1, 0.1019608, 1,
-0.4088131, 0.8635099, 0.03603085, 0, 1, 0.1058824, 1,
-0.4082783, 0.3010577, 0.8206501, 0, 1, 0.1137255, 1,
-0.4063062, 0.154288, -2.327225, 0, 1, 0.1176471, 1,
-0.4025938, 0.7165613, -2.745387, 0, 1, 0.1254902, 1,
-0.4009802, -0.2326566, -2.693988, 0, 1, 0.1294118, 1,
-0.3974785, -0.7515274, -2.597118, 0, 1, 0.1372549, 1,
-0.3954583, 1.085732, -0.08853667, 0, 1, 0.1411765, 1,
-0.3938677, -1.937352, -3.320489, 0, 1, 0.1490196, 1,
-0.3913729, 1.135453, -0.3104504, 0, 1, 0.1529412, 1,
-0.3895049, -0.7109055, -2.467092, 0, 1, 0.1607843, 1,
-0.3871238, 0.8412094, -0.8890159, 0, 1, 0.1647059, 1,
-0.3868329, 1.940811, 0.852326, 0, 1, 0.172549, 1,
-0.3868278, 0.9416747, -1.003223, 0, 1, 0.1764706, 1,
-0.3842131, 0.08737622, -1.95446, 0, 1, 0.1843137, 1,
-0.3795239, 0.9977736, -0.02794497, 0, 1, 0.1882353, 1,
-0.3782062, 0.2914434, -0.5501646, 0, 1, 0.1960784, 1,
-0.3762425, 0.4967596, -2.16469, 0, 1, 0.2039216, 1,
-0.3762208, 0.5039096, -0.5055169, 0, 1, 0.2078431, 1,
-0.3759038, -1.580834, -3.999496, 0, 1, 0.2156863, 1,
-0.3755537, 0.9755546, -0.582732, 0, 1, 0.2196078, 1,
-0.3728137, 0.2843188, -0.5049393, 0, 1, 0.227451, 1,
-0.3690737, 1.703613, 0.6337965, 0, 1, 0.2313726, 1,
-0.3653712, -0.2902773, -2.608389, 0, 1, 0.2392157, 1,
-0.3650184, -0.2603061, -0.5264999, 0, 1, 0.2431373, 1,
-0.3636357, -0.679884, -1.217164, 0, 1, 0.2509804, 1,
-0.3574305, -0.3088383, -1.68572, 0, 1, 0.254902, 1,
-0.3552218, -0.0921375, -4.236054, 0, 1, 0.2627451, 1,
-0.3528095, 1.650614, 0.3873612, 0, 1, 0.2666667, 1,
-0.3525119, -0.392673, -3.618748, 0, 1, 0.2745098, 1,
-0.3520816, -0.05668266, -1.475594, 0, 1, 0.2784314, 1,
-0.350495, 0.4017206, -1.345099, 0, 1, 0.2862745, 1,
-0.3490059, -0.4749926, -2.933055, 0, 1, 0.2901961, 1,
-0.3477098, -0.5967031, -2.563314, 0, 1, 0.2980392, 1,
-0.3471965, -1.878851, -2.305495, 0, 1, 0.3058824, 1,
-0.3471455, -1.1122, -1.700896, 0, 1, 0.3098039, 1,
-0.3442928, 0.3185403, -0.3031766, 0, 1, 0.3176471, 1,
-0.3414352, 1.119586, -0.8141842, 0, 1, 0.3215686, 1,
-0.3409273, -0.9912539, -4.453126, 0, 1, 0.3294118, 1,
-0.3371669, 1.430061, -0.2417676, 0, 1, 0.3333333, 1,
-0.3355544, 1.328386, -1.22796, 0, 1, 0.3411765, 1,
-0.3352221, 0.3336747, -1.28354, 0, 1, 0.345098, 1,
-0.3352189, -1.372174, -3.143699, 0, 1, 0.3529412, 1,
-0.3302096, 0.8025609, 0.173713, 0, 1, 0.3568628, 1,
-0.322824, 0.4753332, -1.441205, 0, 1, 0.3647059, 1,
-0.3221813, 0.6640823, -2.216009, 0, 1, 0.3686275, 1,
-0.3205941, -0.6046834, -0.7576593, 0, 1, 0.3764706, 1,
-0.3192864, -1.466227, -2.25285, 0, 1, 0.3803922, 1,
-0.3048663, 0.0725972, -1.260997, 0, 1, 0.3882353, 1,
-0.3036001, -0.6408318, -1.836312, 0, 1, 0.3921569, 1,
-0.3030792, -0.2954712, -0.7662629, 0, 1, 0.4, 1,
-0.2994087, 0.0603516, -0.4739011, 0, 1, 0.4078431, 1,
-0.2819478, 1.238603, 0.01899496, 0, 1, 0.4117647, 1,
-0.2818821, 0.5360739, 0.5557322, 0, 1, 0.4196078, 1,
-0.2759609, 0.7923775, -2.375719, 0, 1, 0.4235294, 1,
-0.2756985, 1.969353, 0.1654148, 0, 1, 0.4313726, 1,
-0.2754369, 1.206868, 1.855025, 0, 1, 0.4352941, 1,
-0.274699, -0.01953378, -1.584273, 0, 1, 0.4431373, 1,
-0.2735003, -2.353137, -3.167808, 0, 1, 0.4470588, 1,
-0.2729541, 0.1993817, -1.720116, 0, 1, 0.454902, 1,
-0.2723614, 0.2312881, -1.373343, 0, 1, 0.4588235, 1,
-0.2722647, 1.208584, 0.475234, 0, 1, 0.4666667, 1,
-0.2718891, -0.240882, -2.660043, 0, 1, 0.4705882, 1,
-0.2668339, -0.1044079, -1.700596, 0, 1, 0.4784314, 1,
-0.2634746, 0.8854252, 0.4756708, 0, 1, 0.4823529, 1,
-0.2603491, -0.6828019, -2.282483, 0, 1, 0.4901961, 1,
-0.2575565, 0.8313601, -0.06393057, 0, 1, 0.4941176, 1,
-0.2572183, -0.770471, -3.954065, 0, 1, 0.5019608, 1,
-0.2542087, -0.1349436, -1.798635, 0, 1, 0.509804, 1,
-0.254069, -0.2139976, -0.718797, 0, 1, 0.5137255, 1,
-0.2524268, 0.007492808, -2.703859, 0, 1, 0.5215687, 1,
-0.2517547, 0.8540174, -0.3864557, 0, 1, 0.5254902, 1,
-0.2497523, 0.02569663, -1.629849, 0, 1, 0.5333334, 1,
-0.2377693, -0.1424288, -3.633318, 0, 1, 0.5372549, 1,
-0.2354891, 1.389757, -0.0802974, 0, 1, 0.5450981, 1,
-0.230169, -0.01879345, -1.809664, 0, 1, 0.5490196, 1,
-0.2269029, -0.2404189, -1.940961, 0, 1, 0.5568628, 1,
-0.2267064, 0.7796393, 0.5809982, 0, 1, 0.5607843, 1,
-0.2254084, 0.6462647, -0.4120906, 0, 1, 0.5686275, 1,
-0.2251924, 0.7258742, -1.818447, 0, 1, 0.572549, 1,
-0.2206453, -0.2870838, -3.102253, 0, 1, 0.5803922, 1,
-0.2181654, 3.205818, -0.1344432, 0, 1, 0.5843138, 1,
-0.2159433, -0.6470027, -4.636631, 0, 1, 0.5921569, 1,
-0.2158001, 0.1303164, -0.781434, 0, 1, 0.5960785, 1,
-0.2152365, -0.8883683, -3.005797, 0, 1, 0.6039216, 1,
-0.2130596, -1.190297, -3.457458, 0, 1, 0.6117647, 1,
-0.2117985, -0.5156218, -4.371893, 0, 1, 0.6156863, 1,
-0.2026998, 0.07280223, -2.11558, 0, 1, 0.6235294, 1,
-0.1987053, -1.429546, -5.503589, 0, 1, 0.627451, 1,
-0.1946474, -0.4713716, -2.877102, 0, 1, 0.6352941, 1,
-0.191914, -0.1070895, -1.181252, 0, 1, 0.6392157, 1,
-0.1916905, 0.7449248, 0.4077971, 0, 1, 0.6470588, 1,
-0.1891683, 0.4225232, -0.9222795, 0, 1, 0.6509804, 1,
-0.1885511, 0.3505441, -0.8819464, 0, 1, 0.6588235, 1,
-0.1875093, 0.6000028, -0.1073202, 0, 1, 0.6627451, 1,
-0.1861748, 0.9592172, 1.951763, 0, 1, 0.6705883, 1,
-0.1812735, 0.7114378, -0.6243293, 0, 1, 0.6745098, 1,
-0.1763517, -1.924103, -4.020681, 0, 1, 0.682353, 1,
-0.1730017, 0.3476747, 0.1692146, 0, 1, 0.6862745, 1,
-0.1704677, -0.2198816, -3.446027, 0, 1, 0.6941177, 1,
-0.1676295, 0.3686567, 0.236882, 0, 1, 0.7019608, 1,
-0.1659858, 0.2944301, -0.5796791, 0, 1, 0.7058824, 1,
-0.1656359, -0.2783623, -1.141264, 0, 1, 0.7137255, 1,
-0.1651127, -0.1280632, -2.604043, 0, 1, 0.7176471, 1,
-0.1649175, 1.154022, 0.2594787, 0, 1, 0.7254902, 1,
-0.1643009, -0.2522381, -1.333252, 0, 1, 0.7294118, 1,
-0.1596504, 0.2350637, 0.9547392, 0, 1, 0.7372549, 1,
-0.1584295, 0.165428, -0.3023145, 0, 1, 0.7411765, 1,
-0.1572104, 1.267428, 0.8971444, 0, 1, 0.7490196, 1,
-0.1519354, -1.445212, -4.908887, 0, 1, 0.7529412, 1,
-0.1504434, -1.190192, -3.3072, 0, 1, 0.7607843, 1,
-0.1493103, -2.391886, -3.030463, 0, 1, 0.7647059, 1,
-0.145529, -1.040876, -4.255741, 0, 1, 0.772549, 1,
-0.1451472, -0.0299034, -1.093996, 0, 1, 0.7764706, 1,
-0.1408054, -0.5602846, -3.430103, 0, 1, 0.7843137, 1,
-0.1372636, -1.253363, -2.094881, 0, 1, 0.7882353, 1,
-0.1371103, 2.229433, -0.9598122, 0, 1, 0.7960784, 1,
-0.1349768, 0.1705112, -0.1333176, 0, 1, 0.8039216, 1,
-0.1261979, 0.2348802, -1.463078, 0, 1, 0.8078431, 1,
-0.1227071, 0.5141795, 0.1942755, 0, 1, 0.8156863, 1,
-0.1226307, -0.344275, -2.481493, 0, 1, 0.8196079, 1,
-0.1198425, -0.001830974, -0.9325365, 0, 1, 0.827451, 1,
-0.1190253, -0.6994613, -4.318765, 0, 1, 0.8313726, 1,
-0.1175212, -1.267977, -2.798647, 0, 1, 0.8392157, 1,
-0.1168506, 0.2283807, -2.409161, 0, 1, 0.8431373, 1,
-0.1127398, -1.023681, -3.237325, 0, 1, 0.8509804, 1,
-0.1089928, 0.3053775, -1.961548, 0, 1, 0.854902, 1,
-0.1056926, 1.264119, -0.5815454, 0, 1, 0.8627451, 1,
-0.1036795, -0.2619045, -2.022692, 0, 1, 0.8666667, 1,
-0.09379214, 0.7902189, 1.090381, 0, 1, 0.8745098, 1,
-0.08591884, -0.1618349, -1.176628, 0, 1, 0.8784314, 1,
-0.08533569, -0.5993782, -2.507538, 0, 1, 0.8862745, 1,
-0.0807424, 0.7766953, 0.3396684, 0, 1, 0.8901961, 1,
-0.07476375, 0.8399354, -0.392391, 0, 1, 0.8980392, 1,
-0.0735736, -1.46528, -2.317414, 0, 1, 0.9058824, 1,
-0.07015029, -0.890979, -3.920952, 0, 1, 0.9098039, 1,
-0.06744314, -0.1480919, -2.134133, 0, 1, 0.9176471, 1,
-0.06198895, -0.2540596, -3.599635, 0, 1, 0.9215686, 1,
-0.05932026, -0.4783509, -3.197929, 0, 1, 0.9294118, 1,
-0.05838445, -1.16322, -3.826046, 0, 1, 0.9333333, 1,
-0.0576683, 0.3976541, 0.01091203, 0, 1, 0.9411765, 1,
-0.05474813, 0.9930847, 0.7998224, 0, 1, 0.945098, 1,
-0.05280898, 0.5498778, 0.6561988, 0, 1, 0.9529412, 1,
-0.05112695, -1.286199, -2.762711, 0, 1, 0.9568627, 1,
-0.04811061, -0.281295, -2.103525, 0, 1, 0.9647059, 1,
-0.0471883, -0.8514206, -1.910492, 0, 1, 0.9686275, 1,
-0.04287336, -0.4460218, -2.11896, 0, 1, 0.9764706, 1,
-0.03415187, 0.03299971, 0.6056457, 0, 1, 0.9803922, 1,
-0.03272652, 0.3044319, -0.5028014, 0, 1, 0.9882353, 1,
-0.03181474, -0.4183792, -1.850913, 0, 1, 0.9921569, 1,
-0.02858332, -0.2196996, -2.689492, 0, 1, 1, 1,
-0.02681315, -0.341987, -0.815874, 0, 0.9921569, 1, 1,
-0.02147256, -0.5099624, -4.973218, 0, 0.9882353, 1, 1,
-0.02012621, -1.534561, -2.584282, 0, 0.9803922, 1, 1,
-0.01742444, 0.2400218, 0.2816772, 0, 0.9764706, 1, 1,
-0.01147422, 0.769348, -0.4096779, 0, 0.9686275, 1, 1,
-0.007674641, 0.2509705, -0.6958856, 0, 0.9647059, 1, 1,
-0.0007494823, 2.143181, 2.031442, 0, 0.9568627, 1, 1,
6.21863e-05, -0.04024041, 2.644308, 0, 0.9529412, 1, 1,
0.0009489052, 0.4163155, 0.5392169, 0, 0.945098, 1, 1,
0.005666407, -0.3999122, 3.262953, 0, 0.9411765, 1, 1,
0.006477045, -0.4981963, 2.348436, 0, 0.9333333, 1, 1,
0.006479578, -0.4108672, 2.016575, 0, 0.9294118, 1, 1,
0.007981141, -1.171144, 2.09385, 0, 0.9215686, 1, 1,
0.01186953, -1.712137, 2.837046, 0, 0.9176471, 1, 1,
0.01726197, -0.7193825, 2.865363, 0, 0.9098039, 1, 1,
0.0173926, -0.273679, 2.870004, 0, 0.9058824, 1, 1,
0.01789039, 0.7657709, -0.2577087, 0, 0.8980392, 1, 1,
0.02065324, 0.2728668, -1.145892, 0, 0.8901961, 1, 1,
0.02240624, -0.5234474, 3.20475, 0, 0.8862745, 1, 1,
0.02294515, -0.9661395, 1.78295, 0, 0.8784314, 1, 1,
0.02526861, -0.2916203, 2.721864, 0, 0.8745098, 1, 1,
0.02585664, -1.258702, 2.522084, 0, 0.8666667, 1, 1,
0.0260386, -0.7666937, 4.545726, 0, 0.8627451, 1, 1,
0.02924444, 0.2374046, -0.4748249, 0, 0.854902, 1, 1,
0.02987794, 0.2865845, 0.9182435, 0, 0.8509804, 1, 1,
0.03412297, 0.2800937, -0.6057006, 0, 0.8431373, 1, 1,
0.03956052, -1.81205, 3.67171, 0, 0.8392157, 1, 1,
0.03986505, -0.08469965, 4.050601, 0, 0.8313726, 1, 1,
0.04049414, -0.5861523, 3.216107, 0, 0.827451, 1, 1,
0.04169432, -0.6184998, 3.461592, 0, 0.8196079, 1, 1,
0.04318628, 0.3096107, -0.3959173, 0, 0.8156863, 1, 1,
0.04897256, -0.1824684, 4.164737, 0, 0.8078431, 1, 1,
0.05103393, 0.811462, -0.2111565, 0, 0.8039216, 1, 1,
0.05301402, -1.436835, 1.923208, 0, 0.7960784, 1, 1,
0.06023457, -1.578548, 3.876988, 0, 0.7882353, 1, 1,
0.06361887, -0.4040904, 3.725532, 0, 0.7843137, 1, 1,
0.06509407, 1.124725, -1.002156, 0, 0.7764706, 1, 1,
0.06609783, -0.02779664, 1.078381, 0, 0.772549, 1, 1,
0.06879404, -0.2560493, 2.764494, 0, 0.7647059, 1, 1,
0.07148275, -1.613713, 3.293463, 0, 0.7607843, 1, 1,
0.07162872, 1.879591, 1.127649, 0, 0.7529412, 1, 1,
0.0729254, -0.02547112, 1.758145, 0, 0.7490196, 1, 1,
0.07483284, -1.543781, 2.857994, 0, 0.7411765, 1, 1,
0.09188543, -0.1342462, 3.458438, 0, 0.7372549, 1, 1,
0.09252978, 0.3325339, 1.031723, 0, 0.7294118, 1, 1,
0.09400369, -0.4102167, 2.30969, 0, 0.7254902, 1, 1,
0.09688549, 0.36885, 0.7095669, 0, 0.7176471, 1, 1,
0.1158333, 0.1155416, 0.3007843, 0, 0.7137255, 1, 1,
0.1224132, -2.057802, 3.44213, 0, 0.7058824, 1, 1,
0.1240559, 0.4002956, 0.8708479, 0, 0.6980392, 1, 1,
0.1265352, 0.1914726, 1.27945, 0, 0.6941177, 1, 1,
0.1285474, 1.738497, 0.1512602, 0, 0.6862745, 1, 1,
0.1290991, -1.632003, 2.750324, 0, 0.682353, 1, 1,
0.1394712, 0.172712, -0.1520272, 0, 0.6745098, 1, 1,
0.1402717, -2.297278, 4.922122, 0, 0.6705883, 1, 1,
0.1441963, 0.718318, -0.5260511, 0, 0.6627451, 1, 1,
0.1450844, 0.254713, 0.6732907, 0, 0.6588235, 1, 1,
0.1451327, 1.316137, -0.5914066, 0, 0.6509804, 1, 1,
0.14642, -0.3596785, 1.685431, 0, 0.6470588, 1, 1,
0.146428, -0.9478374, 2.212721, 0, 0.6392157, 1, 1,
0.1477671, 0.9451986, -0.161316, 0, 0.6352941, 1, 1,
0.1486603, 0.02511116, 1.064668, 0, 0.627451, 1, 1,
0.1512356, -0.7299734, 0.8978732, 0, 0.6235294, 1, 1,
0.1535727, -0.2902942, 2.09908, 0, 0.6156863, 1, 1,
0.1579466, 1.438929, -1.273867, 0, 0.6117647, 1, 1,
0.1590795, -0.2938276, 3.713672, 0, 0.6039216, 1, 1,
0.1614887, -0.0308631, 2.048681, 0, 0.5960785, 1, 1,
0.1634615, -0.522146, 3.360373, 0, 0.5921569, 1, 1,
0.1710014, -1.696537, 3.428339, 0, 0.5843138, 1, 1,
0.1743283, 0.2680129, 0.6345006, 0, 0.5803922, 1, 1,
0.1782437, -1.978132, 2.545263, 0, 0.572549, 1, 1,
0.1834427, 0.5766726, 1.267214, 0, 0.5686275, 1, 1,
0.1848099, 0.7738484, -0.4884024, 0, 0.5607843, 1, 1,
0.1906415, -0.607995, 4.719873, 0, 0.5568628, 1, 1,
0.1934007, 1.125818, -1.000839, 0, 0.5490196, 1, 1,
0.1935041, 0.08412617, 2.23863, 0, 0.5450981, 1, 1,
0.1941918, -0.7616995, 2.780984, 0, 0.5372549, 1, 1,
0.1946171, -1.484048, 2.134086, 0, 0.5333334, 1, 1,
0.1967615, -0.2451345, 2.439544, 0, 0.5254902, 1, 1,
0.1994028, 0.7379754, 1.605991, 0, 0.5215687, 1, 1,
0.2006438, -0.5835872, 4.016344, 0, 0.5137255, 1, 1,
0.2015821, -2.318386, 3.126136, 0, 0.509804, 1, 1,
0.2016033, 1.294605, 1.332476, 0, 0.5019608, 1, 1,
0.2026506, 0.2555754, 0.2877496, 0, 0.4941176, 1, 1,
0.2068532, 0.1552951, 2.373293, 0, 0.4901961, 1, 1,
0.2090523, 0.3551391, 1.034234, 0, 0.4823529, 1, 1,
0.2132008, 1.047035, 1.079962, 0, 0.4784314, 1, 1,
0.216761, -1.306391, 4.220892, 0, 0.4705882, 1, 1,
0.2167811, -0.1927014, 3.37441, 0, 0.4666667, 1, 1,
0.223937, -1.265005, 1.459098, 0, 0.4588235, 1, 1,
0.2249323, -0.4110896, 2.262598, 0, 0.454902, 1, 1,
0.2268844, -1.125566, 4.456992, 0, 0.4470588, 1, 1,
0.2280534, -1.627202, 2.926562, 0, 0.4431373, 1, 1,
0.228451, 0.06388362, 0.2729212, 0, 0.4352941, 1, 1,
0.2324056, 1.434773, 1.241496, 0, 0.4313726, 1, 1,
0.234387, 1.695222, 1.158242, 0, 0.4235294, 1, 1,
0.2344924, -0.6718408, 2.56004, 0, 0.4196078, 1, 1,
0.2418018, -0.5910148, 3.667922, 0, 0.4117647, 1, 1,
0.2516251, -1.157638, 3.177186, 0, 0.4078431, 1, 1,
0.2594357, -1.068112, 2.298632, 0, 0.4, 1, 1,
0.2623953, 1.48581, -0.1572323, 0, 0.3921569, 1, 1,
0.2654365, -0.3115811, 0.5324373, 0, 0.3882353, 1, 1,
0.269351, -0.5747128, 4.158781, 0, 0.3803922, 1, 1,
0.270854, 0.1669703, 0.6895736, 0, 0.3764706, 1, 1,
0.2728772, -0.1128838, 2.555624, 0, 0.3686275, 1, 1,
0.2752862, 0.2808451, -0.06322771, 0, 0.3647059, 1, 1,
0.2789269, -0.2850648, 2.347965, 0, 0.3568628, 1, 1,
0.2823504, -0.04708215, 1.788017, 0, 0.3529412, 1, 1,
0.2829605, 1.455777, 0.1245203, 0, 0.345098, 1, 1,
0.28298, -1.274078, 1.299554, 0, 0.3411765, 1, 1,
0.2835532, 2.243068, -1.007573, 0, 0.3333333, 1, 1,
0.2878672, 1.945598, 0.7380689, 0, 0.3294118, 1, 1,
0.2892244, 0.7674091, 0.5686685, 0, 0.3215686, 1, 1,
0.2930146, 0.8544845, -0.3074014, 0, 0.3176471, 1, 1,
0.2949657, -1.238227, 1.70278, 0, 0.3098039, 1, 1,
0.3032862, 1.236972, 0.002687454, 0, 0.3058824, 1, 1,
0.3123766, 1.169332, -1.060795, 0, 0.2980392, 1, 1,
0.3142009, 0.06742978, 1.342177, 0, 0.2901961, 1, 1,
0.3143747, 0.7327061, 0.8635023, 0, 0.2862745, 1, 1,
0.3152743, 0.624469, 0.8479497, 0, 0.2784314, 1, 1,
0.3166179, -0.624896, 3.079035, 0, 0.2745098, 1, 1,
0.3208692, -1.647193, 4.870431, 0, 0.2666667, 1, 1,
0.3211949, -0.2870314, 3.750126, 0, 0.2627451, 1, 1,
0.3216931, -0.2339123, 2.490394, 0, 0.254902, 1, 1,
0.3303422, -0.2493692, 2.424963, 0, 0.2509804, 1, 1,
0.3355243, -0.6242284, 1.252331, 0, 0.2431373, 1, 1,
0.3412192, -0.2133971, 1.242645, 0, 0.2392157, 1, 1,
0.3425501, 0.7882101, 1.31807, 0, 0.2313726, 1, 1,
0.3427655, 0.9783432, -0.2556164, 0, 0.227451, 1, 1,
0.3453212, -0.2034871, 2.02664, 0, 0.2196078, 1, 1,
0.3460094, -0.1044016, 0.8973383, 0, 0.2156863, 1, 1,
0.3516933, 0.5228527, 0.3357049, 0, 0.2078431, 1, 1,
0.3534056, -1.007894, 3.180632, 0, 0.2039216, 1, 1,
0.3589745, 1.253946, -0.9069161, 0, 0.1960784, 1, 1,
0.3682832, -0.5344267, 3.340916, 0, 0.1882353, 1, 1,
0.372633, -1.355675, 2.969943, 0, 0.1843137, 1, 1,
0.37545, 1.253637, 0.6413613, 0, 0.1764706, 1, 1,
0.3786527, 0.9489885, -0.02959986, 0, 0.172549, 1, 1,
0.3788396, 1.809686, 1.253561, 0, 0.1647059, 1, 1,
0.3835351, 0.8805732, 1.742005, 0, 0.1607843, 1, 1,
0.3871213, -0.9258982, 2.383026, 0, 0.1529412, 1, 1,
0.3950661, -1.844054, 2.130565, 0, 0.1490196, 1, 1,
0.396109, 2.698318, -0.09987861, 0, 0.1411765, 1, 1,
0.3970153, -1.052128, 3.374967, 0, 0.1372549, 1, 1,
0.4036446, -1.341484, 4.701411, 0, 0.1294118, 1, 1,
0.4037263, -0.6784724, 3.486358, 0, 0.1254902, 1, 1,
0.4053866, -0.6963144, 3.258507, 0, 0.1176471, 1, 1,
0.407717, 1.76406, 1.135487, 0, 0.1137255, 1, 1,
0.4084761, -1.010229, 1.712149, 0, 0.1058824, 1, 1,
0.4103836, -0.8274241, 4.116448, 0, 0.09803922, 1, 1,
0.4120348, -1.120893, 2.950886, 0, 0.09411765, 1, 1,
0.4150461, -0.06732079, 3.175452, 0, 0.08627451, 1, 1,
0.4155071, -0.9075433, 4.104638, 0, 0.08235294, 1, 1,
0.4172925, 0.8772948, 1.027363, 0, 0.07450981, 1, 1,
0.4187459, -1.552557, 4.60086, 0, 0.07058824, 1, 1,
0.4196795, 0.526634, 0.718336, 0, 0.0627451, 1, 1,
0.4245817, -0.104468, -0.1794435, 0, 0.05882353, 1, 1,
0.4258221, 1.776322, 0.4886224, 0, 0.05098039, 1, 1,
0.4265505, -2.089964, 0.873605, 0, 0.04705882, 1, 1,
0.4300476, -0.223929, 1.796928, 0, 0.03921569, 1, 1,
0.430748, 1.632562, 0.3133159, 0, 0.03529412, 1, 1,
0.4309236, -2.528033, 2.78634, 0, 0.02745098, 1, 1,
0.4323084, 0.7489806, 1.200107, 0, 0.02352941, 1, 1,
0.4335034, 1.404455, 1.067639, 0, 0.01568628, 1, 1,
0.434283, -0.4820134, 3.532174, 0, 0.01176471, 1, 1,
0.4359101, -1.307936, 3.370506, 0, 0.003921569, 1, 1,
0.4459816, -0.2849513, 2.647321, 0.003921569, 0, 1, 1,
0.446341, -2.694941, 3.091796, 0.007843138, 0, 1, 1,
0.4487337, 1.793091, 1.698018, 0.01568628, 0, 1, 1,
0.4541839, 0.7948707, 0.5823317, 0.01960784, 0, 1, 1,
0.454845, -0.2271378, 2.430837, 0.02745098, 0, 1, 1,
0.4555193, -1.029062, 1.780468, 0.03137255, 0, 1, 1,
0.4566576, -0.3017464, 1.506497, 0.03921569, 0, 1, 1,
0.4582043, 0.2990049, 0.2995925, 0.04313726, 0, 1, 1,
0.4595956, -0.239807, 2.015721, 0.05098039, 0, 1, 1,
0.4707898, -0.8963738, 3.674136, 0.05490196, 0, 1, 1,
0.4741155, -0.4709502, 3.993349, 0.0627451, 0, 1, 1,
0.47416, -0.3102307, 1.85903, 0.06666667, 0, 1, 1,
0.4794112, 0.9976333, -0.2238692, 0.07450981, 0, 1, 1,
0.4797645, 2.135253, 0.2360821, 0.07843138, 0, 1, 1,
0.4810639, -0.3383435, 2.268912, 0.08627451, 0, 1, 1,
0.48214, -0.1726203, 2.859278, 0.09019608, 0, 1, 1,
0.4842158, 0.2261791, 1.413087, 0.09803922, 0, 1, 1,
0.4849309, 0.3527175, -0.5155637, 0.1058824, 0, 1, 1,
0.487446, 0.5978181, -1.940753, 0.1098039, 0, 1, 1,
0.4877653, 0.3674172, 0.7841058, 0.1176471, 0, 1, 1,
0.4922132, 0.6951792, -1.208454, 0.1215686, 0, 1, 1,
0.4942495, -1.1585, 3.329863, 0.1294118, 0, 1, 1,
0.5006055, 0.3137429, 2.417739, 0.1333333, 0, 1, 1,
0.5019404, 0.3671348, 1.440899, 0.1411765, 0, 1, 1,
0.5095516, 0.7055299, 0.06832102, 0.145098, 0, 1, 1,
0.5113343, 0.3353754, 1.993387, 0.1529412, 0, 1, 1,
0.5159212, 1.309992, 0.2615941, 0.1568628, 0, 1, 1,
0.5159677, -0.04820564, 2.768282, 0.1647059, 0, 1, 1,
0.5160432, 0.2957966, 2.259309, 0.1686275, 0, 1, 1,
0.5168507, 0.6051067, 0.7731642, 0.1764706, 0, 1, 1,
0.5179849, -0.8450435, 2.105081, 0.1803922, 0, 1, 1,
0.5184458, -0.5569796, 2.840634, 0.1882353, 0, 1, 1,
0.524411, -0.1054183, 2.123915, 0.1921569, 0, 1, 1,
0.5247962, -0.2326446, 3.550226, 0.2, 0, 1, 1,
0.525739, -0.7537524, 0.7935523, 0.2078431, 0, 1, 1,
0.5267525, 0.3221027, 3.23144, 0.2117647, 0, 1, 1,
0.5277845, 1.718929, 1.765264, 0.2196078, 0, 1, 1,
0.534865, 0.9854056, 0.527476, 0.2235294, 0, 1, 1,
0.5382391, -0.8821092, -0.3022016, 0.2313726, 0, 1, 1,
0.5386512, -0.170504, 2.18764, 0.2352941, 0, 1, 1,
0.5438151, -1.435258, 0.979628, 0.2431373, 0, 1, 1,
0.5451103, 0.265933, 0.5445631, 0.2470588, 0, 1, 1,
0.5490476, -1.028361, 4.426444, 0.254902, 0, 1, 1,
0.5540649, -0.2111769, 0.4942558, 0.2588235, 0, 1, 1,
0.5595261, -0.3667522, 2.463312, 0.2666667, 0, 1, 1,
0.5615474, 1.568451, 1.765288, 0.2705882, 0, 1, 1,
0.5616832, -0.7583371, 2.117843, 0.2784314, 0, 1, 1,
0.5641251, -0.7068629, 2.815989, 0.282353, 0, 1, 1,
0.5648786, -0.9819771, 3.226592, 0.2901961, 0, 1, 1,
0.5680915, 1.212796, 1.308948, 0.2941177, 0, 1, 1,
0.5685831, -0.705807, 1.773708, 0.3019608, 0, 1, 1,
0.5717721, 0.1585063, 1.175727, 0.3098039, 0, 1, 1,
0.5754242, 1.640978, -2.073152, 0.3137255, 0, 1, 1,
0.5764447, 0.1896607, 1.633265, 0.3215686, 0, 1, 1,
0.5786653, 0.2968273, -1.730336, 0.3254902, 0, 1, 1,
0.5804259, -1.184884, 2.920766, 0.3333333, 0, 1, 1,
0.5875062, -0.6877108, 2.363327, 0.3372549, 0, 1, 1,
0.5952924, 0.9693681, 0.6179022, 0.345098, 0, 1, 1,
0.5982746, -0.9500692, -0.02277067, 0.3490196, 0, 1, 1,
0.600272, -0.484056, 3.20279, 0.3568628, 0, 1, 1,
0.6072521, -0.254707, 1.922405, 0.3607843, 0, 1, 1,
0.6080894, -0.8685842, 1.954633, 0.3686275, 0, 1, 1,
0.6109695, -0.4425862, 1.341409, 0.372549, 0, 1, 1,
0.6136032, 1.417408, 1.092213, 0.3803922, 0, 1, 1,
0.6218613, -0.8119564, 2.255333, 0.3843137, 0, 1, 1,
0.6240583, 1.31841, 2.690747, 0.3921569, 0, 1, 1,
0.6247224, -0.5317024, 2.029548, 0.3960784, 0, 1, 1,
0.6252812, -0.5414355, 2.841132, 0.4039216, 0, 1, 1,
0.6325385, 0.9553478, 2.651722, 0.4117647, 0, 1, 1,
0.633541, -0.5232986, 1.772796, 0.4156863, 0, 1, 1,
0.6343287, 1.880543, 1.377139, 0.4235294, 0, 1, 1,
0.6345574, 1.188055, -0.7955335, 0.427451, 0, 1, 1,
0.6355368, 0.7482293, -0.3413982, 0.4352941, 0, 1, 1,
0.6373014, 0.1348725, 2.223066, 0.4392157, 0, 1, 1,
0.6408138, -0.4952928, 3.24633, 0.4470588, 0, 1, 1,
0.6447691, 0.4385639, 1.486373, 0.4509804, 0, 1, 1,
0.6454388, -1.805872, 3.056872, 0.4588235, 0, 1, 1,
0.6472065, -1.177283, 2.441538, 0.4627451, 0, 1, 1,
0.6499079, -1.189441, 2.556786, 0.4705882, 0, 1, 1,
0.6660901, -0.7900589, 3.140826, 0.4745098, 0, 1, 1,
0.6679352, -0.8344849, 4.24904, 0.4823529, 0, 1, 1,
0.67206, 0.642315, 1.926642, 0.4862745, 0, 1, 1,
0.6752689, -1.449586, 3.911098, 0.4941176, 0, 1, 1,
0.6772243, -2.42809, 3.21232, 0.5019608, 0, 1, 1,
0.6875743, 0.1807384, 1.585765, 0.5058824, 0, 1, 1,
0.6916549, -0.2568179, 2.767598, 0.5137255, 0, 1, 1,
0.7037126, 0.1392983, 1.307383, 0.5176471, 0, 1, 1,
0.7039604, 0.3644829, 0.8099093, 0.5254902, 0, 1, 1,
0.7076176, -0.03653858, 1.658737, 0.5294118, 0, 1, 1,
0.7120379, -0.7698157, 2.205404, 0.5372549, 0, 1, 1,
0.7182872, -0.5812213, 4.650214, 0.5411765, 0, 1, 1,
0.7183567, -0.8899842, 2.971525, 0.5490196, 0, 1, 1,
0.7193887, 0.320356, -0.4345299, 0.5529412, 0, 1, 1,
0.720802, 0.8053296, -0.5967606, 0.5607843, 0, 1, 1,
0.7231439, 0.328147, 2.723074, 0.5647059, 0, 1, 1,
0.7231789, -0.06045057, 3.06347, 0.572549, 0, 1, 1,
0.7387068, 0.7266891, 1.222664, 0.5764706, 0, 1, 1,
0.7392815, 1.410521, 0.5372372, 0.5843138, 0, 1, 1,
0.7455404, -0.192113, 1.309621, 0.5882353, 0, 1, 1,
0.7467092, -0.4801409, 1.943942, 0.5960785, 0, 1, 1,
0.7499191, -1.450642, 0.2152645, 0.6039216, 0, 1, 1,
0.7534712, 0.2720941, 2.916262, 0.6078432, 0, 1, 1,
0.754467, -0.5960073, 1.969887, 0.6156863, 0, 1, 1,
0.7564184, 0.08569311, 2.217894, 0.6196079, 0, 1, 1,
0.757171, 0.5577264, 0.2363096, 0.627451, 0, 1, 1,
0.7658949, -1.848232, 4.270806, 0.6313726, 0, 1, 1,
0.768002, 1.241911, -0.258916, 0.6392157, 0, 1, 1,
0.7680702, -2.087543, 2.050387, 0.6431373, 0, 1, 1,
0.7705379, -1.047522, 2.021731, 0.6509804, 0, 1, 1,
0.7771028, -0.1167134, 1.639195, 0.654902, 0, 1, 1,
0.7778847, -1.283275, 2.231656, 0.6627451, 0, 1, 1,
0.7824602, 1.339127, 1.583683, 0.6666667, 0, 1, 1,
0.7879843, -1.167093, 3.029393, 0.6745098, 0, 1, 1,
0.7890329, -1.678106, 2.987439, 0.6784314, 0, 1, 1,
0.7920969, -2.215735, 2.196337, 0.6862745, 0, 1, 1,
0.7924069, -0.7583601, 1.687448, 0.6901961, 0, 1, 1,
0.7948124, -0.7061788, 0.5739716, 0.6980392, 0, 1, 1,
0.7969151, -0.1019936, 0.3328433, 0.7058824, 0, 1, 1,
0.7976066, 2.118216, 1.196926, 0.7098039, 0, 1, 1,
0.8038628, 1.023883, 0.0705508, 0.7176471, 0, 1, 1,
0.8042919, 0.4430266, 1.831724, 0.7215686, 0, 1, 1,
0.8143915, 1.816911, 1.73758, 0.7294118, 0, 1, 1,
0.8149187, -0.9989019, 1.921469, 0.7333333, 0, 1, 1,
0.8180355, 0.6388391, 0.6301798, 0.7411765, 0, 1, 1,
0.8191805, -0.3083034, 0.602293, 0.7450981, 0, 1, 1,
0.8228674, -0.04820799, 1.210206, 0.7529412, 0, 1, 1,
0.83518, 0.0910884, 1.728302, 0.7568628, 0, 1, 1,
0.8353807, -0.2282208, 3.358755, 0.7647059, 0, 1, 1,
0.835881, -0.154287, 1.28178, 0.7686275, 0, 1, 1,
0.8483596, 1.258277, 1.617329, 0.7764706, 0, 1, 1,
0.8492865, 0.455913, 0.7357209, 0.7803922, 0, 1, 1,
0.8508573, 3.183103, -0.6075993, 0.7882353, 0, 1, 1,
0.8508625, -1.233668, 1.61546, 0.7921569, 0, 1, 1,
0.851845, 0.5203053, 2.072835, 0.8, 0, 1, 1,
0.858548, 1.280754, 1.545058, 0.8078431, 0, 1, 1,
0.8603297, 1.672816, -0.5554109, 0.8117647, 0, 1, 1,
0.8688718, -1.357346, 1.91333, 0.8196079, 0, 1, 1,
0.8727271, -1.212132, 1.806703, 0.8235294, 0, 1, 1,
0.8763378, -0.8578715, 1.80216, 0.8313726, 0, 1, 1,
0.8778691, -0.9815051, 1.951509, 0.8352941, 0, 1, 1,
0.8784945, 0.06844347, -0.02612493, 0.8431373, 0, 1, 1,
0.8787941, -0.08012494, 0.2071621, 0.8470588, 0, 1, 1,
0.8870947, -1.615112, 2.799854, 0.854902, 0, 1, 1,
0.8942264, -0.2674307, 0.5678719, 0.8588235, 0, 1, 1,
0.8988911, 0.7057632, 0.5369744, 0.8666667, 0, 1, 1,
0.8990824, 0.0362707, 2.399924, 0.8705882, 0, 1, 1,
0.9040114, 0.9822136, 0.2691877, 0.8784314, 0, 1, 1,
0.9041588, 0.04437725, 2.360276, 0.8823529, 0, 1, 1,
0.9057825, -0.4404105, 3.159897, 0.8901961, 0, 1, 1,
0.9064324, -0.1342753, 3.437941, 0.8941177, 0, 1, 1,
0.916917, -1.17985, 2.018566, 0.9019608, 0, 1, 1,
0.9172942, -0.3893664, 1.040883, 0.9098039, 0, 1, 1,
0.9219703, -0.2715265, 3.886049, 0.9137255, 0, 1, 1,
0.9283217, -0.1297786, 0.006017467, 0.9215686, 0, 1, 1,
0.9352263, -0.3994319, 3.054801, 0.9254902, 0, 1, 1,
0.9363976, 0.6043718, 0.9804985, 0.9333333, 0, 1, 1,
0.943049, 1.900117, 0.3590618, 0.9372549, 0, 1, 1,
0.9487878, 0.002931707, 3.058239, 0.945098, 0, 1, 1,
0.9562183, -0.1016236, 0.9941419, 0.9490196, 0, 1, 1,
0.9583207, -1.22135, 3.175548, 0.9568627, 0, 1, 1,
0.9608022, 1.142524, 0.6299646, 0.9607843, 0, 1, 1,
0.9608199, 0.7530908, 0.01781623, 0.9686275, 0, 1, 1,
0.9654043, 0.3637483, 1.324187, 0.972549, 0, 1, 1,
0.9663858, 0.3151046, 0.9443848, 0.9803922, 0, 1, 1,
0.9668823, 1.082247, 1.636547, 0.9843137, 0, 1, 1,
0.9699878, 0.5587707, 2.044467, 0.9921569, 0, 1, 1,
0.9745124, 0.5041108, 0.5848125, 0.9960784, 0, 1, 1,
0.9749565, -0.4128927, 1.036924, 1, 0, 0.9960784, 1,
0.9759451, -1.698631, 3.102337, 1, 0, 0.9882353, 1,
0.9922853, -0.9310908, 1.913085, 1, 0, 0.9843137, 1,
0.9928169, 0.5029021, 2.864906, 1, 0, 0.9764706, 1,
0.9941971, 0.03730151, 2.675403, 1, 0, 0.972549, 1,
0.9954258, 0.6718014, 0.5981616, 1, 0, 0.9647059, 1,
1.014411, 0.3814095, -0.4000244, 1, 0, 0.9607843, 1,
1.016815, -0.8711153, 4.963127, 1, 0, 0.9529412, 1,
1.021985, -0.6297933, 3.395353, 1, 0, 0.9490196, 1,
1.022017, -0.1083454, 2.014608, 1, 0, 0.9411765, 1,
1.022416, 0.9423262, 0.09351721, 1, 0, 0.9372549, 1,
1.023069, 0.8348749, 0.6079019, 1, 0, 0.9294118, 1,
1.029124, -1.398414, 1.828029, 1, 0, 0.9254902, 1,
1.031077, -1.021745, 1.543907, 1, 0, 0.9176471, 1,
1.031095, -0.5881343, 1.18269, 1, 0, 0.9137255, 1,
1.038585, 1.133545, -1.131041, 1, 0, 0.9058824, 1,
1.03949, 0.4937522, 2.375361, 1, 0, 0.9019608, 1,
1.039863, 0.7598813, -0.08808713, 1, 0, 0.8941177, 1,
1.04124, 0.5678729, 0.2491567, 1, 0, 0.8862745, 1,
1.044881, 0.3625067, 0.9154917, 1, 0, 0.8823529, 1,
1.046113, -0.5969604, 2.233115, 1, 0, 0.8745098, 1,
1.046745, -0.1850902, 2.291652, 1, 0, 0.8705882, 1,
1.046813, -1.480598, 1.121381, 1, 0, 0.8627451, 1,
1.053428, -1.586806, 3.142143, 1, 0, 0.8588235, 1,
1.053532, 0.3647689, 2.259066, 1, 0, 0.8509804, 1,
1.054492, -0.9482526, 2.068815, 1, 0, 0.8470588, 1,
1.070465, -0.04058062, 2.662033, 1, 0, 0.8392157, 1,
1.076705, 0.010146, 3.087951, 1, 0, 0.8352941, 1,
1.088964, -1.799277, 4.273329, 1, 0, 0.827451, 1,
1.089792, 0.300768, 1.513759, 1, 0, 0.8235294, 1,
1.104617, 1.527135, -0.1205854, 1, 0, 0.8156863, 1,
1.107535, 0.1667896, 2.271196, 1, 0, 0.8117647, 1,
1.113994, 1.446682, 1.355907, 1, 0, 0.8039216, 1,
1.114429, 1.03193, 0.5827652, 1, 0, 0.7960784, 1,
1.124699, -0.0063086, 2.375978, 1, 0, 0.7921569, 1,
1.133116, 1.562134, 0.728783, 1, 0, 0.7843137, 1,
1.141562, 0.4822448, 2.070019, 1, 0, 0.7803922, 1,
1.142468, -1.718535, 2.872446, 1, 0, 0.772549, 1,
1.14321, -1.600426, 2.838455, 1, 0, 0.7686275, 1,
1.144809, 0.1297302, 0.5267721, 1, 0, 0.7607843, 1,
1.14549, -0.9475918, 2.877089, 1, 0, 0.7568628, 1,
1.150024, -0.1571796, 0.4170261, 1, 0, 0.7490196, 1,
1.155057, -0.7647003, 3.150336, 1, 0, 0.7450981, 1,
1.161958, 1.234946, 0.2817598, 1, 0, 0.7372549, 1,
1.163053, -1.202533, 3.948327, 1, 0, 0.7333333, 1,
1.177775, 0.4235734, 2.996895, 1, 0, 0.7254902, 1,
1.191706, 0.8032326, 0.5784974, 1, 0, 0.7215686, 1,
1.192334, -0.7389188, 1.39965, 1, 0, 0.7137255, 1,
1.199687, -0.2875372, 1.488813, 1, 0, 0.7098039, 1,
1.200615, -2.129379, 1.527793, 1, 0, 0.7019608, 1,
1.203933, 1.584799, 0.7019557, 1, 0, 0.6941177, 1,
1.216136, -0.5012121, 2.748018, 1, 0, 0.6901961, 1,
1.221848, -0.1151732, 0.6187084, 1, 0, 0.682353, 1,
1.224787, -0.2120871, 1.599669, 1, 0, 0.6784314, 1,
1.235426, 0.7013321, 0.01948489, 1, 0, 0.6705883, 1,
1.242499, -0.34935, 1.6609, 1, 0, 0.6666667, 1,
1.254095, -0.9030533, 1.337626, 1, 0, 0.6588235, 1,
1.258834, -0.06341264, 3.00392, 1, 0, 0.654902, 1,
1.2628, -0.8649755, 3.142204, 1, 0, 0.6470588, 1,
1.26317, -0.8851991, 2.095067, 1, 0, 0.6431373, 1,
1.266688, 1.310307, 1.489688, 1, 0, 0.6352941, 1,
1.270027, 1.255348, 0.4256914, 1, 0, 0.6313726, 1,
1.284271, 1.403813, -1.723533, 1, 0, 0.6235294, 1,
1.291383, -2.082312, 1.666547, 1, 0, 0.6196079, 1,
1.292976, -0.6380376, 2.842152, 1, 0, 0.6117647, 1,
1.29409, -1.171013, 1.920946, 1, 0, 0.6078432, 1,
1.30008, -0.6309391, 1.961245, 1, 0, 0.6, 1,
1.301317, -0.9367719, 2.709003, 1, 0, 0.5921569, 1,
1.308648, 0.360649, 0.7043455, 1, 0, 0.5882353, 1,
1.326776, 0.4429898, 2.537645, 1, 0, 0.5803922, 1,
1.327003, -1.628873, 1.384442, 1, 0, 0.5764706, 1,
1.342353, -0.4679399, 2.075028, 1, 0, 0.5686275, 1,
1.349193, 0.2814452, 1.134169, 1, 0, 0.5647059, 1,
1.350193, -0.09045345, 1.685075, 1, 0, 0.5568628, 1,
1.356003, -0.1961938, 2.213565, 1, 0, 0.5529412, 1,
1.360315, 0.9409384, -0.05387554, 1, 0, 0.5450981, 1,
1.364469, 1.411887, 1.098943, 1, 0, 0.5411765, 1,
1.372659, 1.276731, -0.5768846, 1, 0, 0.5333334, 1,
1.37679, 1.432015, 1.528792, 1, 0, 0.5294118, 1,
1.381459, -0.6446722, 1.454551, 1, 0, 0.5215687, 1,
1.383937, 0.2482689, 2.635521, 1, 0, 0.5176471, 1,
1.384894, -2.393218, 3.962318, 1, 0, 0.509804, 1,
1.394821, -0.04140429, 0.8951263, 1, 0, 0.5058824, 1,
1.395615, 0.529054, 1.184004, 1, 0, 0.4980392, 1,
1.396031, 1.400753, 0.522516, 1, 0, 0.4901961, 1,
1.412538, 1.004364, 1.959899, 1, 0, 0.4862745, 1,
1.414397, 0.2959959, 0.9892939, 1, 0, 0.4784314, 1,
1.421088, 1.136731, 0.9883268, 1, 0, 0.4745098, 1,
1.423475, 1.554853, 0.5286732, 1, 0, 0.4666667, 1,
1.425346, 0.5572858, 3.499693, 1, 0, 0.4627451, 1,
1.428135, -0.5591242, 1.464213, 1, 0, 0.454902, 1,
1.428248, 1.381564, 0.06307599, 1, 0, 0.4509804, 1,
1.431225, 2.735303, 0.4374533, 1, 0, 0.4431373, 1,
1.438686, -0.2941692, 3.399741, 1, 0, 0.4392157, 1,
1.442528, -0.7934189, 2.532946, 1, 0, 0.4313726, 1,
1.472716, -0.6571943, 1.388794, 1, 0, 0.427451, 1,
1.477731, 0.6215271, 0.5836077, 1, 0, 0.4196078, 1,
1.481854, 0.2131293, 2.907401, 1, 0, 0.4156863, 1,
1.486387, 1.593803, 0.6511022, 1, 0, 0.4078431, 1,
1.487084, -0.5103764, 1.814044, 1, 0, 0.4039216, 1,
1.497438, -0.4261806, 2.728356, 1, 0, 0.3960784, 1,
1.502374, 0.3258456, 1.61548, 1, 0, 0.3882353, 1,
1.508947, 0.1601959, 1.618028, 1, 0, 0.3843137, 1,
1.516846, 0.2490071, 2.007178, 1, 0, 0.3764706, 1,
1.533956, 0.3048829, 1.105035, 1, 0, 0.372549, 1,
1.544158, -0.8820174, 2.25108, 1, 0, 0.3647059, 1,
1.558515, -0.6598243, 3.701002, 1, 0, 0.3607843, 1,
1.570547, -0.8539367, 1.566626, 1, 0, 0.3529412, 1,
1.586225, -2.006821, 0.4799823, 1, 0, 0.3490196, 1,
1.590138, -1.872397, 2.266406, 1, 0, 0.3411765, 1,
1.590419, -0.5426449, 1.774142, 1, 0, 0.3372549, 1,
1.595806, 1.427248, 1.967875, 1, 0, 0.3294118, 1,
1.596237, 1.649104, -0.4529636, 1, 0, 0.3254902, 1,
1.600495, 1.429696, 0.9103717, 1, 0, 0.3176471, 1,
1.614493, 0.4650081, 1.760836, 1, 0, 0.3137255, 1,
1.61532, -0.6567545, 1.249931, 1, 0, 0.3058824, 1,
1.638653, -0.357863, 0.3416816, 1, 0, 0.2980392, 1,
1.643831, -1.151923, 2.776331, 1, 0, 0.2941177, 1,
1.646592, -0.638561, 2.497016, 1, 0, 0.2862745, 1,
1.647403, 0.2848912, -0.5658355, 1, 0, 0.282353, 1,
1.665084, -0.0514666, 1.230248, 1, 0, 0.2745098, 1,
1.665226, -0.6231497, 2.845399, 1, 0, 0.2705882, 1,
1.667611, -0.1192388, 1.168707, 1, 0, 0.2627451, 1,
1.698281, 1.221769, -0.3152654, 1, 0, 0.2588235, 1,
1.705773, 1.688919, 1.190182, 1, 0, 0.2509804, 1,
1.723817, 0.1498493, 2.25197, 1, 0, 0.2470588, 1,
1.72864, -2.00375, 2.073082, 1, 0, 0.2392157, 1,
1.742329, 0.9430334, 2.564989, 1, 0, 0.2352941, 1,
1.748011, -0.6443205, 1.332462, 1, 0, 0.227451, 1,
1.783128, 0.1538985, 1.715715, 1, 0, 0.2235294, 1,
1.786273, -0.7780654, 2.194313, 1, 0, 0.2156863, 1,
1.79134, 1.424561, -0.5392483, 1, 0, 0.2117647, 1,
1.793271, 0.2777446, 2.290459, 1, 0, 0.2039216, 1,
1.800224, -0.3487193, 1.9659, 1, 0, 0.1960784, 1,
1.80218, -0.3349333, 3.745572, 1, 0, 0.1921569, 1,
1.809646, -3.816585, 2.278421, 1, 0, 0.1843137, 1,
1.812865, 0.5975793, 0.4554141, 1, 0, 0.1803922, 1,
1.824237, -1.189121, 1.400622, 1, 0, 0.172549, 1,
1.832244, 0.9857197, 0.6505847, 1, 0, 0.1686275, 1,
1.83498, -1.648096, 2.292487, 1, 0, 0.1607843, 1,
1.891862, 0.5984778, 0.5697588, 1, 0, 0.1568628, 1,
1.893266, -1.262282, 3.562963, 1, 0, 0.1490196, 1,
1.924364, -1.181197, 1.00767, 1, 0, 0.145098, 1,
1.948045, -0.8066255, 2.836721, 1, 0, 0.1372549, 1,
1.95394, 1.316073, 1.503597, 1, 0, 0.1333333, 1,
1.977725, -0.3288842, 1.567708, 1, 0, 0.1254902, 1,
2.012863, 0.04718969, 0.6387697, 1, 0, 0.1215686, 1,
2.013037, -0.8666959, 1.63862, 1, 0, 0.1137255, 1,
2.02421, 1.185705, 2.085033, 1, 0, 0.1098039, 1,
2.065456, -0.7076963, 2.289242, 1, 0, 0.1019608, 1,
2.06891, 1.203375, 0.891539, 1, 0, 0.09411765, 1,
2.085057, -0.2808725, 1.063547, 1, 0, 0.09019608, 1,
2.123096, 1.301156, 1.463845, 1, 0, 0.08235294, 1,
2.15831, 0.01222836, 0.7444203, 1, 0, 0.07843138, 1,
2.166595, -0.1610369, 0.9390657, 1, 0, 0.07058824, 1,
2.186462, -0.9623827, 0.7094359, 1, 0, 0.06666667, 1,
2.235495, 1.363566, -0.8125001, 1, 0, 0.05882353, 1,
2.304433, -1.247793, 2.186817, 1, 0, 0.05490196, 1,
2.351886, -1.525877, 0.03215851, 1, 0, 0.04705882, 1,
2.368435, 1.697035, 0.6599362, 1, 0, 0.04313726, 1,
2.424564, -0.221445, 2.253712, 1, 0, 0.03529412, 1,
2.49554, -0.351917, 2.010209, 1, 0, 0.03137255, 1,
2.680206, -2.143782, 1.084705, 1, 0, 0.02352941, 1,
2.75759, -0.9221097, 1.551439, 1, 0, 0.01960784, 1,
2.779456, 0.1072417, 1.66906, 1, 0, 0.01176471, 1,
2.797076, -0.5467869, 1.358328, 1, 0, 0.007843138, 1
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
-0.04065454, -5.006883, -7.277697, 0, -0.5, 0.5, 0.5,
-0.04065454, -5.006883, -7.277697, 1, -0.5, 0.5, 0.5,
-0.04065454, -5.006883, -7.277697, 1, 1.5, 0.5, 0.5,
-0.04065454, -5.006883, -7.277697, 0, 1.5, 0.5, 0.5
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
-3.840376, -0.3053834, -7.277697, 0, -0.5, 0.5, 0.5,
-3.840376, -0.3053834, -7.277697, 1, -0.5, 0.5, 0.5,
-3.840376, -0.3053834, -7.277697, 1, 1.5, 0.5, 0.5,
-3.840376, -0.3053834, -7.277697, 0, 1.5, 0.5, 0.5
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
-3.840376, -5.006883, -0.2702308, 0, -0.5, 0.5, 0.5,
-3.840376, -5.006883, -0.2702308, 1, -0.5, 0.5, 0.5,
-3.840376, -5.006883, -0.2702308, 1, 1.5, 0.5, 0.5,
-3.840376, -5.006883, -0.2702308, 0, 1.5, 0.5, 0.5
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
-2, -3.921921, -5.660589,
2, -3.921921, -5.660589,
-2, -3.921921, -5.660589,
-2, -4.102748, -5.930107,
-1, -3.921921, -5.660589,
-1, -4.102748, -5.930107,
0, -3.921921, -5.660589,
0, -4.102748, -5.930107,
1, -3.921921, -5.660589,
1, -4.102748, -5.930107,
2, -3.921921, -5.660589,
2, -4.102748, -5.930107
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
-2, -4.464402, -6.469143, 0, -0.5, 0.5, 0.5,
-2, -4.464402, -6.469143, 1, -0.5, 0.5, 0.5,
-2, -4.464402, -6.469143, 1, 1.5, 0.5, 0.5,
-2, -4.464402, -6.469143, 0, 1.5, 0.5, 0.5,
-1, -4.464402, -6.469143, 0, -0.5, 0.5, 0.5,
-1, -4.464402, -6.469143, 1, -0.5, 0.5, 0.5,
-1, -4.464402, -6.469143, 1, 1.5, 0.5, 0.5,
-1, -4.464402, -6.469143, 0, 1.5, 0.5, 0.5,
0, -4.464402, -6.469143, 0, -0.5, 0.5, 0.5,
0, -4.464402, -6.469143, 1, -0.5, 0.5, 0.5,
0, -4.464402, -6.469143, 1, 1.5, 0.5, 0.5,
0, -4.464402, -6.469143, 0, 1.5, 0.5, 0.5,
1, -4.464402, -6.469143, 0, -0.5, 0.5, 0.5,
1, -4.464402, -6.469143, 1, -0.5, 0.5, 0.5,
1, -4.464402, -6.469143, 1, 1.5, 0.5, 0.5,
1, -4.464402, -6.469143, 0, 1.5, 0.5, 0.5,
2, -4.464402, -6.469143, 0, -0.5, 0.5, 0.5,
2, -4.464402, -6.469143, 1, -0.5, 0.5, 0.5,
2, -4.464402, -6.469143, 1, 1.5, 0.5, 0.5,
2, -4.464402, -6.469143, 0, 1.5, 0.5, 0.5
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
-2.963517, -2, -5.660589,
-2.963517, 2, -5.660589,
-2.963517, -2, -5.660589,
-3.10966, -2, -5.930107,
-2.963517, 0, -5.660589,
-3.10966, 0, -5.930107,
-2.963517, 2, -5.660589,
-3.10966, 2, -5.930107
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
-3.401947, -2, -6.469143, 0, -0.5, 0.5, 0.5,
-3.401947, -2, -6.469143, 1, -0.5, 0.5, 0.5,
-3.401947, -2, -6.469143, 1, 1.5, 0.5, 0.5,
-3.401947, -2, -6.469143, 0, 1.5, 0.5, 0.5,
-3.401947, 0, -6.469143, 0, -0.5, 0.5, 0.5,
-3.401947, 0, -6.469143, 1, -0.5, 0.5, 0.5,
-3.401947, 0, -6.469143, 1, 1.5, 0.5, 0.5,
-3.401947, 0, -6.469143, 0, 1.5, 0.5, 0.5,
-3.401947, 2, -6.469143, 0, -0.5, 0.5, 0.5,
-3.401947, 2, -6.469143, 1, -0.5, 0.5, 0.5,
-3.401947, 2, -6.469143, 1, 1.5, 0.5, 0.5,
-3.401947, 2, -6.469143, 0, 1.5, 0.5, 0.5
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
-2.963517, -3.921921, -4,
-2.963517, -3.921921, 4,
-2.963517, -3.921921, -4,
-3.10966, -4.102748, -4,
-2.963517, -3.921921, -2,
-3.10966, -4.102748, -2,
-2.963517, -3.921921, 0,
-3.10966, -4.102748, 0,
-2.963517, -3.921921, 2,
-3.10966, -4.102748, 2,
-2.963517, -3.921921, 4,
-3.10966, -4.102748, 4
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
-3.401947, -4.464402, -4, 0, -0.5, 0.5, 0.5,
-3.401947, -4.464402, -4, 1, -0.5, 0.5, 0.5,
-3.401947, -4.464402, -4, 1, 1.5, 0.5, 0.5,
-3.401947, -4.464402, -4, 0, 1.5, 0.5, 0.5,
-3.401947, -4.464402, -2, 0, -0.5, 0.5, 0.5,
-3.401947, -4.464402, -2, 1, -0.5, 0.5, 0.5,
-3.401947, -4.464402, -2, 1, 1.5, 0.5, 0.5,
-3.401947, -4.464402, -2, 0, 1.5, 0.5, 0.5,
-3.401947, -4.464402, 0, 0, -0.5, 0.5, 0.5,
-3.401947, -4.464402, 0, 1, -0.5, 0.5, 0.5,
-3.401947, -4.464402, 0, 1, 1.5, 0.5, 0.5,
-3.401947, -4.464402, 0, 0, 1.5, 0.5, 0.5,
-3.401947, -4.464402, 2, 0, -0.5, 0.5, 0.5,
-3.401947, -4.464402, 2, 1, -0.5, 0.5, 0.5,
-3.401947, -4.464402, 2, 1, 1.5, 0.5, 0.5,
-3.401947, -4.464402, 2, 0, 1.5, 0.5, 0.5,
-3.401947, -4.464402, 4, 0, -0.5, 0.5, 0.5,
-3.401947, -4.464402, 4, 1, -0.5, 0.5, 0.5,
-3.401947, -4.464402, 4, 1, 1.5, 0.5, 0.5,
-3.401947, -4.464402, 4, 0, 1.5, 0.5, 0.5
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
-2.963517, -3.921921, -5.660589,
-2.963517, 3.311154, -5.660589,
-2.963517, -3.921921, 5.120128,
-2.963517, 3.311154, 5.120128,
-2.963517, -3.921921, -5.660589,
-2.963517, -3.921921, 5.120128,
-2.963517, 3.311154, -5.660589,
-2.963517, 3.311154, 5.120128,
-2.963517, -3.921921, -5.660589,
2.882208, -3.921921, -5.660589,
-2.963517, -3.921921, 5.120128,
2.882208, -3.921921, 5.120128,
-2.963517, 3.311154, -5.660589,
2.882208, 3.311154, -5.660589,
-2.963517, 3.311154, 5.120128,
2.882208, 3.311154, 5.120128,
2.882208, -3.921921, -5.660589,
2.882208, 3.311154, -5.660589,
2.882208, -3.921921, 5.120128,
2.882208, 3.311154, 5.120128,
2.882208, -3.921921, -5.660589,
2.882208, -3.921921, 5.120128,
2.882208, 3.311154, -5.660589,
2.882208, 3.311154, 5.120128
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
var radius = 7.602686;
var distance = 33.82521;
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
mvMatrix.translate( 0.04065454, 0.3053834, 0.2702308 );
mvMatrix.scale( 1.406185, 1.13647, 0.7624885 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.82521);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Carbophenthion<-read.table("Carbophenthion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Carbophenthion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Carbophenthion' not found
```

```r
y<-Carbophenthion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Carbophenthion' not found
```

```r
z<-Carbophenthion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Carbophenthion' not found
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
-2.878385, -0.7581831, -0.4995498, 0, 0, 1, 1, 1,
-2.624898, -0.3380747, -0.04230778, 1, 0, 0, 1, 1,
-2.616945, -1.82552, -3.6551, 1, 0, 0, 1, 1,
-2.594748, 0.8178794, -1.705881, 1, 0, 0, 1, 1,
-2.457551, 0.1093922, -1.058575, 1, 0, 0, 1, 1,
-2.412665, -0.09553172, -0.1208822, 1, 0, 0, 1, 1,
-2.395674, -0.4142914, -3.338561, 0, 0, 0, 1, 1,
-2.385347, -0.2300996, -2.136065, 0, 0, 0, 1, 1,
-2.379538, 1.22135, -0.9750558, 0, 0, 0, 1, 1,
-2.372753, 0.7604923, -1.43091, 0, 0, 0, 1, 1,
-2.367317, 1.903569, -2.132572, 0, 0, 0, 1, 1,
-2.365341, -0.05626826, -2.222096, 0, 0, 0, 1, 1,
-2.357618, -0.9553458, -1.11737, 0, 0, 0, 1, 1,
-2.331701, -0.09569812, 0.4142352, 1, 1, 1, 1, 1,
-2.257374, 0.6107294, -0.2727057, 1, 1, 1, 1, 1,
-2.220193, -0.8041363, -0.1956792, 1, 1, 1, 1, 1,
-2.205943, -0.9543194, -0.9095315, 1, 1, 1, 1, 1,
-2.159985, -0.486672, -0.5394583, 1, 1, 1, 1, 1,
-2.061289, -1.671411, -2.397078, 1, 1, 1, 1, 1,
-2.055374, 0.9487864, -1.155707, 1, 1, 1, 1, 1,
-2.043062, -0.9163634, -1.210657, 1, 1, 1, 1, 1,
-2.042224, 1.184457, -2.644811, 1, 1, 1, 1, 1,
-2.016251, 0.0792033, 0.5186034, 1, 1, 1, 1, 1,
-2.015153, 0.1912149, -0.6965567, 1, 1, 1, 1, 1,
-2.010307, 0.1939961, -1.603306, 1, 1, 1, 1, 1,
-2.009472, 1.553968, 0.1084871, 1, 1, 1, 1, 1,
-1.99648, -0.585094, -1.155463, 1, 1, 1, 1, 1,
-1.990931, -0.2306367, -4.287461, 1, 1, 1, 1, 1,
-1.954594, -0.6678656, -0.04082929, 0, 0, 1, 1, 1,
-1.93256, -0.00117944, -0.6513484, 1, 0, 0, 1, 1,
-1.924403, -1.803123, -4.022239, 1, 0, 0, 1, 1,
-1.913461, -1.156501, -2.230862, 1, 0, 0, 1, 1,
-1.906458, -0.3556499, -1.651124, 1, 0, 0, 1, 1,
-1.897823, -0.7597013, -1.131323, 1, 0, 0, 1, 1,
-1.894083, 0.1134775, -1.858558, 0, 0, 0, 1, 1,
-1.891054, -0.1276668, -2.247392, 0, 0, 0, 1, 1,
-1.839198, -0.4234814, -2.91503, 0, 0, 0, 1, 1,
-1.834187, 1.255973, -0.1623241, 0, 0, 0, 1, 1,
-1.814046, -0.4648467, -2.685648, 0, 0, 0, 1, 1,
-1.784637, 0.5215815, -1.218382, 0, 0, 0, 1, 1,
-1.769083, -1.488477, -2.636372, 0, 0, 0, 1, 1,
-1.763529, 0.2347137, -0.7205781, 1, 1, 1, 1, 1,
-1.75302, 0.04318048, -2.223444, 1, 1, 1, 1, 1,
-1.743231, 1.134283, -0.9266264, 1, 1, 1, 1, 1,
-1.742742, -0.006663676, -1.863318, 1, 1, 1, 1, 1,
-1.737127, -0.2019822, -1.455412, 1, 1, 1, 1, 1,
-1.726111, -1.074023, -0.483835, 1, 1, 1, 1, 1,
-1.700433, -1.845693, -2.216715, 1, 1, 1, 1, 1,
-1.674658, 0.3099267, -0.4666186, 1, 1, 1, 1, 1,
-1.66843, 0.4726707, -1.009798, 1, 1, 1, 1, 1,
-1.661596, -0.1296015, -0.5555881, 1, 1, 1, 1, 1,
-1.661293, -0.1226464, -1.285691, 1, 1, 1, 1, 1,
-1.65709, 1.320778, -1.137136, 1, 1, 1, 1, 1,
-1.64901, 0.3146203, -1.360121, 1, 1, 1, 1, 1,
-1.647332, 0.721208, -1.288461, 1, 1, 1, 1, 1,
-1.633901, 1.068224, -2.690663, 1, 1, 1, 1, 1,
-1.629866, -1.043972, -3.495384, 0, 0, 1, 1, 1,
-1.624185, 1.032521, -2.441183, 1, 0, 0, 1, 1,
-1.616849, 0.3548567, 1.201033, 1, 0, 0, 1, 1,
-1.615096, -0.560729, -1.474551, 1, 0, 0, 1, 1,
-1.606475, 1.066061, -1.207289, 1, 0, 0, 1, 1,
-1.606092, 1.696065, -0.3369069, 1, 0, 0, 1, 1,
-1.581903, -1.990315, -2.261518, 0, 0, 0, 1, 1,
-1.579802, -0.3486412, -0.5903748, 0, 0, 0, 1, 1,
-1.571067, 0.7768804, -1.460556, 0, 0, 0, 1, 1,
-1.561606, -0.3742457, -2.486007, 0, 0, 0, 1, 1,
-1.556757, 0.3304844, -2.209493, 0, 0, 0, 1, 1,
-1.538906, -2.462479, -2.181095, 0, 0, 0, 1, 1,
-1.532574, 0.9488921, -2.404759, 0, 0, 0, 1, 1,
-1.526014, 0.05338746, -1.83015, 1, 1, 1, 1, 1,
-1.50786, 0.2169982, -0.5529935, 1, 1, 1, 1, 1,
-1.487127, 0.4951774, -1.498832, 1, 1, 1, 1, 1,
-1.485464, -0.00571762, -2.530642, 1, 1, 1, 1, 1,
-1.484912, -2.020975, -1.511892, 1, 1, 1, 1, 1,
-1.471135, -0.4724002, -1.811285, 1, 1, 1, 1, 1,
-1.470837, -0.2793489, 0.2371598, 1, 1, 1, 1, 1,
-1.470019, 0.8030487, -1.720973, 1, 1, 1, 1, 1,
-1.465673, 0.2917104, -2.319295, 1, 1, 1, 1, 1,
-1.461087, -0.834085, -2.990229, 1, 1, 1, 1, 1,
-1.45881, -1.071942, -2.054703, 1, 1, 1, 1, 1,
-1.446351, -1.474687, -1.45749, 1, 1, 1, 1, 1,
-1.442959, -1.33755, -2.740218, 1, 1, 1, 1, 1,
-1.416041, 0.4516844, -1.746142, 1, 1, 1, 1, 1,
-1.414989, 0.08954287, -1.723649, 1, 1, 1, 1, 1,
-1.405027, -0.6311171, -0.8859282, 0, 0, 1, 1, 1,
-1.404226, -0.5243549, -1.283004, 1, 0, 0, 1, 1,
-1.390568, -0.2962646, -2.953173, 1, 0, 0, 1, 1,
-1.381184, -0.7316496, -3.069115, 1, 0, 0, 1, 1,
-1.3762, 0.1145899, -1.328751, 1, 0, 0, 1, 1,
-1.373276, -1.493554, -1.812632, 1, 0, 0, 1, 1,
-1.373177, 0.5891318, -2.263846, 0, 0, 0, 1, 1,
-1.364307, -0.6298462, -3.181435, 0, 0, 0, 1, 1,
-1.34786, 0.5539227, -1.383353, 0, 0, 0, 1, 1,
-1.336424, 0.7043167, -1.625772, 0, 0, 0, 1, 1,
-1.332101, -1.063127, -2.082562, 0, 0, 0, 1, 1,
-1.325698, 0.09981295, -2.884916, 0, 0, 0, 1, 1,
-1.322369, -1.212163, -2.721748, 0, 0, 0, 1, 1,
-1.320138, 0.397538, -1.29981, 1, 1, 1, 1, 1,
-1.319919, 0.3784605, -2.153819, 1, 1, 1, 1, 1,
-1.313522, 0.8912722, -2.329476, 1, 1, 1, 1, 1,
-1.299591, -0.08038781, -1.998699, 1, 1, 1, 1, 1,
-1.299037, 0.2316081, -2.029497, 1, 1, 1, 1, 1,
-1.298805, -1.130998, -2.721292, 1, 1, 1, 1, 1,
-1.288341, 1.197396, -2.49411, 1, 1, 1, 1, 1,
-1.281514, 0.7989337, -1.570712, 1, 1, 1, 1, 1,
-1.28099, 0.03492761, 0.1688172, 1, 1, 1, 1, 1,
-1.276831, -0.2549581, -1.05078, 1, 1, 1, 1, 1,
-1.276747, 0.8222404, -3.287955, 1, 1, 1, 1, 1,
-1.27301, 0.8815463, -1.635032, 1, 1, 1, 1, 1,
-1.251177, -1.440547, -1.684925, 1, 1, 1, 1, 1,
-1.244679, -0.8249329, -2.659778, 1, 1, 1, 1, 1,
-1.232363, 0.1048662, -0.5255324, 1, 1, 1, 1, 1,
-1.226194, 1.183507, 0.4161108, 0, 0, 1, 1, 1,
-1.224785, -0.1420861, -2.283155, 1, 0, 0, 1, 1,
-1.220506, 0.8910214, -1.571298, 1, 0, 0, 1, 1,
-1.218564, 1.030778, -2.079781, 1, 0, 0, 1, 1,
-1.217453, -0.4164394, -1.098414, 1, 0, 0, 1, 1,
-1.215082, -0.05078467, -2.369978, 1, 0, 0, 1, 1,
-1.214869, -0.1740077, -0.7464032, 0, 0, 0, 1, 1,
-1.207236, 0.1086901, -1.370952, 0, 0, 0, 1, 1,
-1.201831, 0.1194558, -1.742662, 0, 0, 0, 1, 1,
-1.190241, -1.130049, -3.810169, 0, 0, 0, 1, 1,
-1.18638, -0.9228531, -4.760921, 0, 0, 0, 1, 1,
-1.184657, -0.5983296, -2.975554, 0, 0, 0, 1, 1,
-1.182385, -0.01248207, 0.03932074, 0, 0, 0, 1, 1,
-1.182351, -1.596322, -1.07767, 1, 1, 1, 1, 1,
-1.179041, 0.726323, -1.608264, 1, 1, 1, 1, 1,
-1.17812, 1.649922, -0.839556, 1, 1, 1, 1, 1,
-1.176159, 0.8458193, -1.42436, 1, 1, 1, 1, 1,
-1.175139, 0.7151031, 0.5813922, 1, 1, 1, 1, 1,
-1.16732, -0.1075683, -2.244015, 1, 1, 1, 1, 1,
-1.157225, 0.7868447, -1.018371, 1, 1, 1, 1, 1,
-1.157215, -0.5013892, -3.4146, 1, 1, 1, 1, 1,
-1.152859, -0.7913817, -1.185831, 1, 1, 1, 1, 1,
-1.14116, 1.246282, -2.44518, 1, 1, 1, 1, 1,
-1.134262, 0.3821166, -1.093952, 1, 1, 1, 1, 1,
-1.132568, 0.3091915, -1.066601, 1, 1, 1, 1, 1,
-1.127476, 1.270625, 0.02383545, 1, 1, 1, 1, 1,
-1.124791, -2.5247, -4.27895, 1, 1, 1, 1, 1,
-1.119723, -0.2797571, 0.7025927, 1, 1, 1, 1, 1,
-1.119114, -0.1778387, -3.41321, 0, 0, 1, 1, 1,
-1.108185, 1.737395, -1.149554, 1, 0, 0, 1, 1,
-1.104712, 0.3412411, -1.084013, 1, 0, 0, 1, 1,
-1.103979, 0.9704688, -3.782121, 1, 0, 0, 1, 1,
-1.102642, -0.2256052, -0.4219915, 1, 0, 0, 1, 1,
-1.100294, -0.02080351, 0.278346, 1, 0, 0, 1, 1,
-1.088976, -0.18119, -1.951087, 0, 0, 0, 1, 1,
-1.085705, -1.348378, -1.259597, 0, 0, 0, 1, 1,
-1.080969, 0.5753517, -1.657222, 0, 0, 0, 1, 1,
-1.08008, 0.2797909, -3.560448, 0, 0, 0, 1, 1,
-1.074872, 1.297875, -2.166191, 0, 0, 0, 1, 1,
-1.074675, 0.7613629, -0.9871265, 0, 0, 0, 1, 1,
-1.074633, 0.1558597, -1.967857, 0, 0, 0, 1, 1,
-1.069661, 1.029698, -1.712377, 1, 1, 1, 1, 1,
-1.06915, 0.7030944, -0.07035, 1, 1, 1, 1, 1,
-1.068891, -0.6966434, -0.6609458, 1, 1, 1, 1, 1,
-1.068712, -0.6718819, -1.342451, 1, 1, 1, 1, 1,
-1.05691, -0.01992639, -2.782121, 1, 1, 1, 1, 1,
-1.052621, -1.239618, -3.11301, 1, 1, 1, 1, 1,
-1.050891, 0.819479, 0.5022641, 1, 1, 1, 1, 1,
-1.050183, -0.4168488, -1.353423, 1, 1, 1, 1, 1,
-1.035635, -0.8096431, -2.067565, 1, 1, 1, 1, 1,
-1.030052, 0.5093414, -0.9068171, 1, 1, 1, 1, 1,
-1.02622, -0.05966979, -1.065264, 1, 1, 1, 1, 1,
-1.025883, -1.226534, -2.35595, 1, 1, 1, 1, 1,
-1.0229, 0.1919031, 0.3546647, 1, 1, 1, 1, 1,
-1.019308, -0.6301804, -4.832157, 1, 1, 1, 1, 1,
-1.015619, -0.6241124, -1.414473, 1, 1, 1, 1, 1,
-1.01051, -1.310404, -1.958277, 0, 0, 1, 1, 1,
-1.005886, -0.826353, -2.318302, 1, 0, 0, 1, 1,
-1.001495, 0.3506644, -1.196754, 1, 0, 0, 1, 1,
-0.9999553, 1.927398, -0.3005903, 1, 0, 0, 1, 1,
-0.9968722, 1.471747, -1.334618, 1, 0, 0, 1, 1,
-0.9938788, 0.3617824, 0.2243208, 1, 0, 0, 1, 1,
-0.9898534, -0.2809118, -4.277002, 0, 0, 0, 1, 1,
-0.9882648, -1.190108, -2.563907, 0, 0, 0, 1, 1,
-0.9847073, 0.6871596, -1.31739, 0, 0, 0, 1, 1,
-0.9844319, -0.9331657, -2.787593, 0, 0, 0, 1, 1,
-0.9767243, 1.748821, -0.8460295, 0, 0, 0, 1, 1,
-0.9654041, -1.524921, -1.310533, 0, 0, 0, 1, 1,
-0.9653767, -0.1449465, -2.581259, 0, 0, 0, 1, 1,
-0.9614966, 1.071584, 0.4747705, 1, 1, 1, 1, 1,
-0.9476281, 1.034181, -1.427028, 1, 1, 1, 1, 1,
-0.9416354, -0.4626551, -2.653511, 1, 1, 1, 1, 1,
-0.9400558, 0.3544778, -1.627178, 1, 1, 1, 1, 1,
-0.9327817, -0.6645964, -1.549865, 1, 1, 1, 1, 1,
-0.926242, 1.947304, 0.7349856, 1, 1, 1, 1, 1,
-0.9195369, 0.4792042, -1.531442, 1, 1, 1, 1, 1,
-0.9064347, -0.3946548, -3.23172, 1, 1, 1, 1, 1,
-0.9055905, 0.07221978, -1.362347, 1, 1, 1, 1, 1,
-0.9007083, -0.6622763, -2.976913, 1, 1, 1, 1, 1,
-0.8971514, 0.1726604, -1.83197, 1, 1, 1, 1, 1,
-0.8964585, -0.1449022, -1.151865, 1, 1, 1, 1, 1,
-0.8845732, -0.0340167, -1.764367, 1, 1, 1, 1, 1,
-0.8843815, 1.131781, 0.6104797, 1, 1, 1, 1, 1,
-0.8822981, 0.1147724, -1.962772, 1, 1, 1, 1, 1,
-0.8815303, 0.03206372, -1.34924, 0, 0, 1, 1, 1,
-0.8781921, 0.4658251, -2.061683, 1, 0, 0, 1, 1,
-0.8772665, 1.789891, -2.333443, 1, 0, 0, 1, 1,
-0.8724666, 0.9601971, -1.403134, 1, 0, 0, 1, 1,
-0.8714061, 0.9307979, -0.3202719, 1, 0, 0, 1, 1,
-0.8672656, -0.7156961, -2.096032, 1, 0, 0, 1, 1,
-0.8668569, 0.4082206, -2.239673, 0, 0, 0, 1, 1,
-0.8665455, 0.6043765, 0.3358196, 0, 0, 0, 1, 1,
-0.8644308, 1.029292, -0.7093914, 0, 0, 0, 1, 1,
-0.8643312, 0.06204357, -0.9711462, 0, 0, 0, 1, 1,
-0.8565511, -0.1259895, -0.7159957, 0, 0, 0, 1, 1,
-0.8494551, 0.7990546, -1.690484, 0, 0, 0, 1, 1,
-0.8421515, -2.255302, -1.419535, 0, 0, 0, 1, 1,
-0.8367243, 0.06720066, -0.01024706, 1, 1, 1, 1, 1,
-0.8219143, 1.633237, -0.8123955, 1, 1, 1, 1, 1,
-0.8196629, -0.001207005, -1.434592, 1, 1, 1, 1, 1,
-0.8186587, 0.9233215, -0.7730696, 1, 1, 1, 1, 1,
-0.8155784, -1.629887, -2.517699, 1, 1, 1, 1, 1,
-0.8151425, 0.5874919, -0.9219136, 1, 1, 1, 1, 1,
-0.8127083, -0.5276258, -1.925933, 1, 1, 1, 1, 1,
-0.8111076, -0.5618958, -2.438886, 1, 1, 1, 1, 1,
-0.8108076, 0.3888345, -2.02269, 1, 1, 1, 1, 1,
-0.8087733, 0.3795371, -3.882534, 1, 1, 1, 1, 1,
-0.8074877, 0.3267207, -1.198487, 1, 1, 1, 1, 1,
-0.8053163, -2.055476, -2.863503, 1, 1, 1, 1, 1,
-0.8053086, 0.2419509, -1.390441, 1, 1, 1, 1, 1,
-0.7940004, -2.662747, -2.67473, 1, 1, 1, 1, 1,
-0.7909678, 0.6655433, -0.09621778, 1, 1, 1, 1, 1,
-0.7902543, 0.1774125, -1.266831, 0, 0, 1, 1, 1,
-0.7898263, -2.275388, -2.770633, 1, 0, 0, 1, 1,
-0.7817369, -1.160869, -2.02099, 1, 0, 0, 1, 1,
-0.7696497, -1.87954, -4.823526, 1, 0, 0, 1, 1,
-0.7672674, 0.6504374, -0.9214563, 1, 0, 0, 1, 1,
-0.7642347, -0.5845467, -1.851153, 1, 0, 0, 1, 1,
-0.7605693, 0.3340751, -0.8037705, 0, 0, 0, 1, 1,
-0.7564734, -0.005702497, 0.03466452, 0, 0, 0, 1, 1,
-0.7502002, 1.351316, -0.6239869, 0, 0, 0, 1, 1,
-0.744208, -0.3454688, -1.86879, 0, 0, 0, 1, 1,
-0.7417846, 1.371905, -1.866173, 0, 0, 0, 1, 1,
-0.7401785, 0.009507843, -2.725243, 0, 0, 0, 1, 1,
-0.7373396, 0.5228837, -2.267425, 0, 0, 0, 1, 1,
-0.7366792, -1.115401, -4.425158, 1, 1, 1, 1, 1,
-0.7359895, 0.9991188, -1.051589, 1, 1, 1, 1, 1,
-0.7273971, 0.5235797, -1.586482, 1, 1, 1, 1, 1,
-0.726079, -0.7403955, -3.017317, 1, 1, 1, 1, 1,
-0.7202899, 0.1781781, -3.559647, 1, 1, 1, 1, 1,
-0.7174981, -0.0841622, -1.405076, 1, 1, 1, 1, 1,
-0.7170514, -0.6101004, -2.158386, 1, 1, 1, 1, 1,
-0.7118729, -0.7253169, -2.068282, 1, 1, 1, 1, 1,
-0.6950172, 0.3691552, -1.367922, 1, 1, 1, 1, 1,
-0.6943148, -0.2588325, -1.333735, 1, 1, 1, 1, 1,
-0.6927468, -0.9769077, -1.600599, 1, 1, 1, 1, 1,
-0.6925712, -0.3119398, -3.176853, 1, 1, 1, 1, 1,
-0.6908906, -0.8364483, -1.422973, 1, 1, 1, 1, 1,
-0.6902737, 0.48599, -0.6029558, 1, 1, 1, 1, 1,
-0.6862909, -0.546441, -2.973114, 1, 1, 1, 1, 1,
-0.6859373, -0.4402548, -2.817275, 0, 0, 1, 1, 1,
-0.683686, -1.365984, -2.461657, 1, 0, 0, 1, 1,
-0.6789588, 0.7917503, -1.613081, 1, 0, 0, 1, 1,
-0.6788687, 1.823213, 0.6115581, 1, 0, 0, 1, 1,
-0.6758472, 0.5634536, -1.136939, 1, 0, 0, 1, 1,
-0.6690335, -0.1239436, -2.331257, 1, 0, 0, 1, 1,
-0.6658006, -1.95744, -2.410643, 0, 0, 0, 1, 1,
-0.665474, 0.5167803, -0.6820833, 0, 0, 0, 1, 1,
-0.6645067, -1.927654, -2.38379, 0, 0, 0, 1, 1,
-0.6639956, 1.649053, -0.7483602, 0, 0, 0, 1, 1,
-0.6592998, 0.05260893, -0.4856398, 0, 0, 0, 1, 1,
-0.6521947, 0.2895628, -2.657692, 0, 0, 0, 1, 1,
-0.652055, -0.8420749, -1.766697, 0, 0, 0, 1, 1,
-0.6482219, 1.781641, 0.9565335, 1, 1, 1, 1, 1,
-0.6458454, -0.4692729, -1.440395, 1, 1, 1, 1, 1,
-0.6447951, -0.7292272, -3.318282, 1, 1, 1, 1, 1,
-0.6433495, -0.2321921, -0.6770802, 1, 1, 1, 1, 1,
-0.6388721, 1.461806, -0.1835534, 1, 1, 1, 1, 1,
-0.6376895, -0.9439718, -4.390367, 1, 1, 1, 1, 1,
-0.6331545, -1.349692, -1.905847, 1, 1, 1, 1, 1,
-0.6317928, -0.1681755, -1.251968, 1, 1, 1, 1, 1,
-0.6294398, -0.6296744, 0.4667612, 1, 1, 1, 1, 1,
-0.6227187, 3.194973, -1.376909, 1, 1, 1, 1, 1,
-0.6223486, -1.090492, -2.925566, 1, 1, 1, 1, 1,
-0.6219338, -1.444663, -2.759147, 1, 1, 1, 1, 1,
-0.620988, 1.490369, -1.577972, 1, 1, 1, 1, 1,
-0.6195582, -0.692453, -2.018725, 1, 1, 1, 1, 1,
-0.6191934, 2.365072, -0.1714443, 1, 1, 1, 1, 1,
-0.6186147, 2.018754, 0.0001012366, 0, 0, 1, 1, 1,
-0.6070113, 0.6051129, -0.6586325, 1, 0, 0, 1, 1,
-0.603534, 1.451681, -0.8936062, 1, 0, 0, 1, 1,
-0.6035076, -0.1862417, -1.303584, 1, 0, 0, 1, 1,
-0.6006924, 0.5727238, 0.6435782, 1, 0, 0, 1, 1,
-0.5976207, 0.0194051, -1.165141, 1, 0, 0, 1, 1,
-0.5971451, -0.159916, -2.959862, 0, 0, 0, 1, 1,
-0.5928519, -0.8073362, -3.571323, 0, 0, 0, 1, 1,
-0.592536, -0.4116134, -0.9165316, 0, 0, 0, 1, 1,
-0.5911653, -0.7930274, -3.119181, 0, 0, 0, 1, 1,
-0.5899028, -2.393955, -3.201, 0, 0, 0, 1, 1,
-0.5897192, 0.1145318, -2.137391, 0, 0, 0, 1, 1,
-0.5850917, 0.1621986, -1.603431, 0, 0, 0, 1, 1,
-0.5842938, -0.6040546, -0.6644948, 1, 1, 1, 1, 1,
-0.5840693, -0.02850268, -1.65315, 1, 1, 1, 1, 1,
-0.5827664, -0.792499, -1.544431, 1, 1, 1, 1, 1,
-0.5803662, 1.876523, -0.06517028, 1, 1, 1, 1, 1,
-0.5674032, -0.8147733, -3.318593, 1, 1, 1, 1, 1,
-0.565142, 0.6288134, 0.4098438, 1, 1, 1, 1, 1,
-0.5521113, -0.08424819, -0.1937709, 1, 1, 1, 1, 1,
-0.5509381, 1.813262, 1.64027, 1, 1, 1, 1, 1,
-0.5499835, -1.129333, -1.922243, 1, 1, 1, 1, 1,
-0.545523, 1.684767, -0.1556701, 1, 1, 1, 1, 1,
-0.5418127, -1.297942, -2.876081, 1, 1, 1, 1, 1,
-0.539324, -0.6261719, -2.276053, 1, 1, 1, 1, 1,
-0.5376449, 0.4380547, -0.00504467, 1, 1, 1, 1, 1,
-0.5373699, 1.230556, 0.1664742, 1, 1, 1, 1, 1,
-0.5370625, 0.02727421, -1.703451, 1, 1, 1, 1, 1,
-0.5359719, 1.117565, -0.08591711, 0, 0, 1, 1, 1,
-0.5358689, 2.319193, -0.5635855, 1, 0, 0, 1, 1,
-0.5342842, 1.006997, 0.8248232, 1, 0, 0, 1, 1,
-0.5248069, 2.115319, -1.127112, 1, 0, 0, 1, 1,
-0.5225698, 2.089456, 0.7056672, 1, 0, 0, 1, 1,
-0.5055661, 0.7631531, 0.1392755, 1, 0, 0, 1, 1,
-0.5038296, 1.658146, -0.7247894, 0, 0, 0, 1, 1,
-0.5006752, -0.2110024, 0.3132629, 0, 0, 0, 1, 1,
-0.498762, -0.05066312, -1.857183, 0, 0, 0, 1, 1,
-0.4983284, -1.187679, -1.183881, 0, 0, 0, 1, 1,
-0.4967578, 0.9665017, -1.102682, 0, 0, 0, 1, 1,
-0.4863968, 1.471768, -1.3582, 0, 0, 0, 1, 1,
-0.4851506, 0.3256089, -3.91366, 0, 0, 0, 1, 1,
-0.4840548, 1.943085, -0.09000564, 1, 1, 1, 1, 1,
-0.4829482, 1.434968, -0.817753, 1, 1, 1, 1, 1,
-0.4792559, 0.5479227, -1.543896, 1, 1, 1, 1, 1,
-0.4778993, 0.8383246, -0.9735318, 1, 1, 1, 1, 1,
-0.4774272, -0.7390769, -0.4544364, 1, 1, 1, 1, 1,
-0.4768214, -0.816313, -3.004886, 1, 1, 1, 1, 1,
-0.4688298, -0.6803194, -1.640536, 1, 1, 1, 1, 1,
-0.4647978, -0.4163037, -2.036221, 1, 1, 1, 1, 1,
-0.4633842, -1.637176, -1.911584, 1, 1, 1, 1, 1,
-0.4615195, -0.6049018, -2.094915, 1, 1, 1, 1, 1,
-0.4609133, 0.2667381, -1.83635, 1, 1, 1, 1, 1,
-0.4606832, 1.282977, -2.701959, 1, 1, 1, 1, 1,
-0.4556674, -0.3767644, -2.886587, 1, 1, 1, 1, 1,
-0.4541432, -0.2092081, -0.5278003, 1, 1, 1, 1, 1,
-0.4486347, -1.856919, -2.767046, 1, 1, 1, 1, 1,
-0.4453097, 1.811516, -1.137446, 0, 0, 1, 1, 1,
-0.4451393, -1.035409, -2.139383, 1, 0, 0, 1, 1,
-0.4416322, 2.827406, 0.633493, 1, 0, 0, 1, 1,
-0.4381783, 0.3589285, -0.2996722, 1, 0, 0, 1, 1,
-0.4374038, -1.190708, -1.861026, 1, 0, 0, 1, 1,
-0.4360906, -1.321566, -2.260295, 1, 0, 0, 1, 1,
-0.4280775, 0.7591702, -0.9514012, 0, 0, 0, 1, 1,
-0.4267943, -1.455101, -2.163932, 0, 0, 0, 1, 1,
-0.4242786, -1.876059, -3.983116, 0, 0, 0, 1, 1,
-0.4230373, 0.108524, -2.318047, 0, 0, 0, 1, 1,
-0.4226787, -0.8549445, -1.788463, 0, 0, 0, 1, 1,
-0.4147633, 0.2278979, 0.0972899, 0, 0, 0, 1, 1,
-0.4142361, -0.05355448, -2.600712, 0, 0, 0, 1, 1,
-0.4142198, -0.6840041, -4.32473, 1, 1, 1, 1, 1,
-0.4101939, -0.170056, -1.167813, 1, 1, 1, 1, 1,
-0.4088131, 0.8635099, 0.03603085, 1, 1, 1, 1, 1,
-0.4082783, 0.3010577, 0.8206501, 1, 1, 1, 1, 1,
-0.4063062, 0.154288, -2.327225, 1, 1, 1, 1, 1,
-0.4025938, 0.7165613, -2.745387, 1, 1, 1, 1, 1,
-0.4009802, -0.2326566, -2.693988, 1, 1, 1, 1, 1,
-0.3974785, -0.7515274, -2.597118, 1, 1, 1, 1, 1,
-0.3954583, 1.085732, -0.08853667, 1, 1, 1, 1, 1,
-0.3938677, -1.937352, -3.320489, 1, 1, 1, 1, 1,
-0.3913729, 1.135453, -0.3104504, 1, 1, 1, 1, 1,
-0.3895049, -0.7109055, -2.467092, 1, 1, 1, 1, 1,
-0.3871238, 0.8412094, -0.8890159, 1, 1, 1, 1, 1,
-0.3868329, 1.940811, 0.852326, 1, 1, 1, 1, 1,
-0.3868278, 0.9416747, -1.003223, 1, 1, 1, 1, 1,
-0.3842131, 0.08737622, -1.95446, 0, 0, 1, 1, 1,
-0.3795239, 0.9977736, -0.02794497, 1, 0, 0, 1, 1,
-0.3782062, 0.2914434, -0.5501646, 1, 0, 0, 1, 1,
-0.3762425, 0.4967596, -2.16469, 1, 0, 0, 1, 1,
-0.3762208, 0.5039096, -0.5055169, 1, 0, 0, 1, 1,
-0.3759038, -1.580834, -3.999496, 1, 0, 0, 1, 1,
-0.3755537, 0.9755546, -0.582732, 0, 0, 0, 1, 1,
-0.3728137, 0.2843188, -0.5049393, 0, 0, 0, 1, 1,
-0.3690737, 1.703613, 0.6337965, 0, 0, 0, 1, 1,
-0.3653712, -0.2902773, -2.608389, 0, 0, 0, 1, 1,
-0.3650184, -0.2603061, -0.5264999, 0, 0, 0, 1, 1,
-0.3636357, -0.679884, -1.217164, 0, 0, 0, 1, 1,
-0.3574305, -0.3088383, -1.68572, 0, 0, 0, 1, 1,
-0.3552218, -0.0921375, -4.236054, 1, 1, 1, 1, 1,
-0.3528095, 1.650614, 0.3873612, 1, 1, 1, 1, 1,
-0.3525119, -0.392673, -3.618748, 1, 1, 1, 1, 1,
-0.3520816, -0.05668266, -1.475594, 1, 1, 1, 1, 1,
-0.350495, 0.4017206, -1.345099, 1, 1, 1, 1, 1,
-0.3490059, -0.4749926, -2.933055, 1, 1, 1, 1, 1,
-0.3477098, -0.5967031, -2.563314, 1, 1, 1, 1, 1,
-0.3471965, -1.878851, -2.305495, 1, 1, 1, 1, 1,
-0.3471455, -1.1122, -1.700896, 1, 1, 1, 1, 1,
-0.3442928, 0.3185403, -0.3031766, 1, 1, 1, 1, 1,
-0.3414352, 1.119586, -0.8141842, 1, 1, 1, 1, 1,
-0.3409273, -0.9912539, -4.453126, 1, 1, 1, 1, 1,
-0.3371669, 1.430061, -0.2417676, 1, 1, 1, 1, 1,
-0.3355544, 1.328386, -1.22796, 1, 1, 1, 1, 1,
-0.3352221, 0.3336747, -1.28354, 1, 1, 1, 1, 1,
-0.3352189, -1.372174, -3.143699, 0, 0, 1, 1, 1,
-0.3302096, 0.8025609, 0.173713, 1, 0, 0, 1, 1,
-0.322824, 0.4753332, -1.441205, 1, 0, 0, 1, 1,
-0.3221813, 0.6640823, -2.216009, 1, 0, 0, 1, 1,
-0.3205941, -0.6046834, -0.7576593, 1, 0, 0, 1, 1,
-0.3192864, -1.466227, -2.25285, 1, 0, 0, 1, 1,
-0.3048663, 0.0725972, -1.260997, 0, 0, 0, 1, 1,
-0.3036001, -0.6408318, -1.836312, 0, 0, 0, 1, 1,
-0.3030792, -0.2954712, -0.7662629, 0, 0, 0, 1, 1,
-0.2994087, 0.0603516, -0.4739011, 0, 0, 0, 1, 1,
-0.2819478, 1.238603, 0.01899496, 0, 0, 0, 1, 1,
-0.2818821, 0.5360739, 0.5557322, 0, 0, 0, 1, 1,
-0.2759609, 0.7923775, -2.375719, 0, 0, 0, 1, 1,
-0.2756985, 1.969353, 0.1654148, 1, 1, 1, 1, 1,
-0.2754369, 1.206868, 1.855025, 1, 1, 1, 1, 1,
-0.274699, -0.01953378, -1.584273, 1, 1, 1, 1, 1,
-0.2735003, -2.353137, -3.167808, 1, 1, 1, 1, 1,
-0.2729541, 0.1993817, -1.720116, 1, 1, 1, 1, 1,
-0.2723614, 0.2312881, -1.373343, 1, 1, 1, 1, 1,
-0.2722647, 1.208584, 0.475234, 1, 1, 1, 1, 1,
-0.2718891, -0.240882, -2.660043, 1, 1, 1, 1, 1,
-0.2668339, -0.1044079, -1.700596, 1, 1, 1, 1, 1,
-0.2634746, 0.8854252, 0.4756708, 1, 1, 1, 1, 1,
-0.2603491, -0.6828019, -2.282483, 1, 1, 1, 1, 1,
-0.2575565, 0.8313601, -0.06393057, 1, 1, 1, 1, 1,
-0.2572183, -0.770471, -3.954065, 1, 1, 1, 1, 1,
-0.2542087, -0.1349436, -1.798635, 1, 1, 1, 1, 1,
-0.254069, -0.2139976, -0.718797, 1, 1, 1, 1, 1,
-0.2524268, 0.007492808, -2.703859, 0, 0, 1, 1, 1,
-0.2517547, 0.8540174, -0.3864557, 1, 0, 0, 1, 1,
-0.2497523, 0.02569663, -1.629849, 1, 0, 0, 1, 1,
-0.2377693, -0.1424288, -3.633318, 1, 0, 0, 1, 1,
-0.2354891, 1.389757, -0.0802974, 1, 0, 0, 1, 1,
-0.230169, -0.01879345, -1.809664, 1, 0, 0, 1, 1,
-0.2269029, -0.2404189, -1.940961, 0, 0, 0, 1, 1,
-0.2267064, 0.7796393, 0.5809982, 0, 0, 0, 1, 1,
-0.2254084, 0.6462647, -0.4120906, 0, 0, 0, 1, 1,
-0.2251924, 0.7258742, -1.818447, 0, 0, 0, 1, 1,
-0.2206453, -0.2870838, -3.102253, 0, 0, 0, 1, 1,
-0.2181654, 3.205818, -0.1344432, 0, 0, 0, 1, 1,
-0.2159433, -0.6470027, -4.636631, 0, 0, 0, 1, 1,
-0.2158001, 0.1303164, -0.781434, 1, 1, 1, 1, 1,
-0.2152365, -0.8883683, -3.005797, 1, 1, 1, 1, 1,
-0.2130596, -1.190297, -3.457458, 1, 1, 1, 1, 1,
-0.2117985, -0.5156218, -4.371893, 1, 1, 1, 1, 1,
-0.2026998, 0.07280223, -2.11558, 1, 1, 1, 1, 1,
-0.1987053, -1.429546, -5.503589, 1, 1, 1, 1, 1,
-0.1946474, -0.4713716, -2.877102, 1, 1, 1, 1, 1,
-0.191914, -0.1070895, -1.181252, 1, 1, 1, 1, 1,
-0.1916905, 0.7449248, 0.4077971, 1, 1, 1, 1, 1,
-0.1891683, 0.4225232, -0.9222795, 1, 1, 1, 1, 1,
-0.1885511, 0.3505441, -0.8819464, 1, 1, 1, 1, 1,
-0.1875093, 0.6000028, -0.1073202, 1, 1, 1, 1, 1,
-0.1861748, 0.9592172, 1.951763, 1, 1, 1, 1, 1,
-0.1812735, 0.7114378, -0.6243293, 1, 1, 1, 1, 1,
-0.1763517, -1.924103, -4.020681, 1, 1, 1, 1, 1,
-0.1730017, 0.3476747, 0.1692146, 0, 0, 1, 1, 1,
-0.1704677, -0.2198816, -3.446027, 1, 0, 0, 1, 1,
-0.1676295, 0.3686567, 0.236882, 1, 0, 0, 1, 1,
-0.1659858, 0.2944301, -0.5796791, 1, 0, 0, 1, 1,
-0.1656359, -0.2783623, -1.141264, 1, 0, 0, 1, 1,
-0.1651127, -0.1280632, -2.604043, 1, 0, 0, 1, 1,
-0.1649175, 1.154022, 0.2594787, 0, 0, 0, 1, 1,
-0.1643009, -0.2522381, -1.333252, 0, 0, 0, 1, 1,
-0.1596504, 0.2350637, 0.9547392, 0, 0, 0, 1, 1,
-0.1584295, 0.165428, -0.3023145, 0, 0, 0, 1, 1,
-0.1572104, 1.267428, 0.8971444, 0, 0, 0, 1, 1,
-0.1519354, -1.445212, -4.908887, 0, 0, 0, 1, 1,
-0.1504434, -1.190192, -3.3072, 0, 0, 0, 1, 1,
-0.1493103, -2.391886, -3.030463, 1, 1, 1, 1, 1,
-0.145529, -1.040876, -4.255741, 1, 1, 1, 1, 1,
-0.1451472, -0.0299034, -1.093996, 1, 1, 1, 1, 1,
-0.1408054, -0.5602846, -3.430103, 1, 1, 1, 1, 1,
-0.1372636, -1.253363, -2.094881, 1, 1, 1, 1, 1,
-0.1371103, 2.229433, -0.9598122, 1, 1, 1, 1, 1,
-0.1349768, 0.1705112, -0.1333176, 1, 1, 1, 1, 1,
-0.1261979, 0.2348802, -1.463078, 1, 1, 1, 1, 1,
-0.1227071, 0.5141795, 0.1942755, 1, 1, 1, 1, 1,
-0.1226307, -0.344275, -2.481493, 1, 1, 1, 1, 1,
-0.1198425, -0.001830974, -0.9325365, 1, 1, 1, 1, 1,
-0.1190253, -0.6994613, -4.318765, 1, 1, 1, 1, 1,
-0.1175212, -1.267977, -2.798647, 1, 1, 1, 1, 1,
-0.1168506, 0.2283807, -2.409161, 1, 1, 1, 1, 1,
-0.1127398, -1.023681, -3.237325, 1, 1, 1, 1, 1,
-0.1089928, 0.3053775, -1.961548, 0, 0, 1, 1, 1,
-0.1056926, 1.264119, -0.5815454, 1, 0, 0, 1, 1,
-0.1036795, -0.2619045, -2.022692, 1, 0, 0, 1, 1,
-0.09379214, 0.7902189, 1.090381, 1, 0, 0, 1, 1,
-0.08591884, -0.1618349, -1.176628, 1, 0, 0, 1, 1,
-0.08533569, -0.5993782, -2.507538, 1, 0, 0, 1, 1,
-0.0807424, 0.7766953, 0.3396684, 0, 0, 0, 1, 1,
-0.07476375, 0.8399354, -0.392391, 0, 0, 0, 1, 1,
-0.0735736, -1.46528, -2.317414, 0, 0, 0, 1, 1,
-0.07015029, -0.890979, -3.920952, 0, 0, 0, 1, 1,
-0.06744314, -0.1480919, -2.134133, 0, 0, 0, 1, 1,
-0.06198895, -0.2540596, -3.599635, 0, 0, 0, 1, 1,
-0.05932026, -0.4783509, -3.197929, 0, 0, 0, 1, 1,
-0.05838445, -1.16322, -3.826046, 1, 1, 1, 1, 1,
-0.0576683, 0.3976541, 0.01091203, 1, 1, 1, 1, 1,
-0.05474813, 0.9930847, 0.7998224, 1, 1, 1, 1, 1,
-0.05280898, 0.5498778, 0.6561988, 1, 1, 1, 1, 1,
-0.05112695, -1.286199, -2.762711, 1, 1, 1, 1, 1,
-0.04811061, -0.281295, -2.103525, 1, 1, 1, 1, 1,
-0.0471883, -0.8514206, -1.910492, 1, 1, 1, 1, 1,
-0.04287336, -0.4460218, -2.11896, 1, 1, 1, 1, 1,
-0.03415187, 0.03299971, 0.6056457, 1, 1, 1, 1, 1,
-0.03272652, 0.3044319, -0.5028014, 1, 1, 1, 1, 1,
-0.03181474, -0.4183792, -1.850913, 1, 1, 1, 1, 1,
-0.02858332, -0.2196996, -2.689492, 1, 1, 1, 1, 1,
-0.02681315, -0.341987, -0.815874, 1, 1, 1, 1, 1,
-0.02147256, -0.5099624, -4.973218, 1, 1, 1, 1, 1,
-0.02012621, -1.534561, -2.584282, 1, 1, 1, 1, 1,
-0.01742444, 0.2400218, 0.2816772, 0, 0, 1, 1, 1,
-0.01147422, 0.769348, -0.4096779, 1, 0, 0, 1, 1,
-0.007674641, 0.2509705, -0.6958856, 1, 0, 0, 1, 1,
-0.0007494823, 2.143181, 2.031442, 1, 0, 0, 1, 1,
6.21863e-05, -0.04024041, 2.644308, 1, 0, 0, 1, 1,
0.0009489052, 0.4163155, 0.5392169, 1, 0, 0, 1, 1,
0.005666407, -0.3999122, 3.262953, 0, 0, 0, 1, 1,
0.006477045, -0.4981963, 2.348436, 0, 0, 0, 1, 1,
0.006479578, -0.4108672, 2.016575, 0, 0, 0, 1, 1,
0.007981141, -1.171144, 2.09385, 0, 0, 0, 1, 1,
0.01186953, -1.712137, 2.837046, 0, 0, 0, 1, 1,
0.01726197, -0.7193825, 2.865363, 0, 0, 0, 1, 1,
0.0173926, -0.273679, 2.870004, 0, 0, 0, 1, 1,
0.01789039, 0.7657709, -0.2577087, 1, 1, 1, 1, 1,
0.02065324, 0.2728668, -1.145892, 1, 1, 1, 1, 1,
0.02240624, -0.5234474, 3.20475, 1, 1, 1, 1, 1,
0.02294515, -0.9661395, 1.78295, 1, 1, 1, 1, 1,
0.02526861, -0.2916203, 2.721864, 1, 1, 1, 1, 1,
0.02585664, -1.258702, 2.522084, 1, 1, 1, 1, 1,
0.0260386, -0.7666937, 4.545726, 1, 1, 1, 1, 1,
0.02924444, 0.2374046, -0.4748249, 1, 1, 1, 1, 1,
0.02987794, 0.2865845, 0.9182435, 1, 1, 1, 1, 1,
0.03412297, 0.2800937, -0.6057006, 1, 1, 1, 1, 1,
0.03956052, -1.81205, 3.67171, 1, 1, 1, 1, 1,
0.03986505, -0.08469965, 4.050601, 1, 1, 1, 1, 1,
0.04049414, -0.5861523, 3.216107, 1, 1, 1, 1, 1,
0.04169432, -0.6184998, 3.461592, 1, 1, 1, 1, 1,
0.04318628, 0.3096107, -0.3959173, 1, 1, 1, 1, 1,
0.04897256, -0.1824684, 4.164737, 0, 0, 1, 1, 1,
0.05103393, 0.811462, -0.2111565, 1, 0, 0, 1, 1,
0.05301402, -1.436835, 1.923208, 1, 0, 0, 1, 1,
0.06023457, -1.578548, 3.876988, 1, 0, 0, 1, 1,
0.06361887, -0.4040904, 3.725532, 1, 0, 0, 1, 1,
0.06509407, 1.124725, -1.002156, 1, 0, 0, 1, 1,
0.06609783, -0.02779664, 1.078381, 0, 0, 0, 1, 1,
0.06879404, -0.2560493, 2.764494, 0, 0, 0, 1, 1,
0.07148275, -1.613713, 3.293463, 0, 0, 0, 1, 1,
0.07162872, 1.879591, 1.127649, 0, 0, 0, 1, 1,
0.0729254, -0.02547112, 1.758145, 0, 0, 0, 1, 1,
0.07483284, -1.543781, 2.857994, 0, 0, 0, 1, 1,
0.09188543, -0.1342462, 3.458438, 0, 0, 0, 1, 1,
0.09252978, 0.3325339, 1.031723, 1, 1, 1, 1, 1,
0.09400369, -0.4102167, 2.30969, 1, 1, 1, 1, 1,
0.09688549, 0.36885, 0.7095669, 1, 1, 1, 1, 1,
0.1158333, 0.1155416, 0.3007843, 1, 1, 1, 1, 1,
0.1224132, -2.057802, 3.44213, 1, 1, 1, 1, 1,
0.1240559, 0.4002956, 0.8708479, 1, 1, 1, 1, 1,
0.1265352, 0.1914726, 1.27945, 1, 1, 1, 1, 1,
0.1285474, 1.738497, 0.1512602, 1, 1, 1, 1, 1,
0.1290991, -1.632003, 2.750324, 1, 1, 1, 1, 1,
0.1394712, 0.172712, -0.1520272, 1, 1, 1, 1, 1,
0.1402717, -2.297278, 4.922122, 1, 1, 1, 1, 1,
0.1441963, 0.718318, -0.5260511, 1, 1, 1, 1, 1,
0.1450844, 0.254713, 0.6732907, 1, 1, 1, 1, 1,
0.1451327, 1.316137, -0.5914066, 1, 1, 1, 1, 1,
0.14642, -0.3596785, 1.685431, 1, 1, 1, 1, 1,
0.146428, -0.9478374, 2.212721, 0, 0, 1, 1, 1,
0.1477671, 0.9451986, -0.161316, 1, 0, 0, 1, 1,
0.1486603, 0.02511116, 1.064668, 1, 0, 0, 1, 1,
0.1512356, -0.7299734, 0.8978732, 1, 0, 0, 1, 1,
0.1535727, -0.2902942, 2.09908, 1, 0, 0, 1, 1,
0.1579466, 1.438929, -1.273867, 1, 0, 0, 1, 1,
0.1590795, -0.2938276, 3.713672, 0, 0, 0, 1, 1,
0.1614887, -0.0308631, 2.048681, 0, 0, 0, 1, 1,
0.1634615, -0.522146, 3.360373, 0, 0, 0, 1, 1,
0.1710014, -1.696537, 3.428339, 0, 0, 0, 1, 1,
0.1743283, 0.2680129, 0.6345006, 0, 0, 0, 1, 1,
0.1782437, -1.978132, 2.545263, 0, 0, 0, 1, 1,
0.1834427, 0.5766726, 1.267214, 0, 0, 0, 1, 1,
0.1848099, 0.7738484, -0.4884024, 1, 1, 1, 1, 1,
0.1906415, -0.607995, 4.719873, 1, 1, 1, 1, 1,
0.1934007, 1.125818, -1.000839, 1, 1, 1, 1, 1,
0.1935041, 0.08412617, 2.23863, 1, 1, 1, 1, 1,
0.1941918, -0.7616995, 2.780984, 1, 1, 1, 1, 1,
0.1946171, -1.484048, 2.134086, 1, 1, 1, 1, 1,
0.1967615, -0.2451345, 2.439544, 1, 1, 1, 1, 1,
0.1994028, 0.7379754, 1.605991, 1, 1, 1, 1, 1,
0.2006438, -0.5835872, 4.016344, 1, 1, 1, 1, 1,
0.2015821, -2.318386, 3.126136, 1, 1, 1, 1, 1,
0.2016033, 1.294605, 1.332476, 1, 1, 1, 1, 1,
0.2026506, 0.2555754, 0.2877496, 1, 1, 1, 1, 1,
0.2068532, 0.1552951, 2.373293, 1, 1, 1, 1, 1,
0.2090523, 0.3551391, 1.034234, 1, 1, 1, 1, 1,
0.2132008, 1.047035, 1.079962, 1, 1, 1, 1, 1,
0.216761, -1.306391, 4.220892, 0, 0, 1, 1, 1,
0.2167811, -0.1927014, 3.37441, 1, 0, 0, 1, 1,
0.223937, -1.265005, 1.459098, 1, 0, 0, 1, 1,
0.2249323, -0.4110896, 2.262598, 1, 0, 0, 1, 1,
0.2268844, -1.125566, 4.456992, 1, 0, 0, 1, 1,
0.2280534, -1.627202, 2.926562, 1, 0, 0, 1, 1,
0.228451, 0.06388362, 0.2729212, 0, 0, 0, 1, 1,
0.2324056, 1.434773, 1.241496, 0, 0, 0, 1, 1,
0.234387, 1.695222, 1.158242, 0, 0, 0, 1, 1,
0.2344924, -0.6718408, 2.56004, 0, 0, 0, 1, 1,
0.2418018, -0.5910148, 3.667922, 0, 0, 0, 1, 1,
0.2516251, -1.157638, 3.177186, 0, 0, 0, 1, 1,
0.2594357, -1.068112, 2.298632, 0, 0, 0, 1, 1,
0.2623953, 1.48581, -0.1572323, 1, 1, 1, 1, 1,
0.2654365, -0.3115811, 0.5324373, 1, 1, 1, 1, 1,
0.269351, -0.5747128, 4.158781, 1, 1, 1, 1, 1,
0.270854, 0.1669703, 0.6895736, 1, 1, 1, 1, 1,
0.2728772, -0.1128838, 2.555624, 1, 1, 1, 1, 1,
0.2752862, 0.2808451, -0.06322771, 1, 1, 1, 1, 1,
0.2789269, -0.2850648, 2.347965, 1, 1, 1, 1, 1,
0.2823504, -0.04708215, 1.788017, 1, 1, 1, 1, 1,
0.2829605, 1.455777, 0.1245203, 1, 1, 1, 1, 1,
0.28298, -1.274078, 1.299554, 1, 1, 1, 1, 1,
0.2835532, 2.243068, -1.007573, 1, 1, 1, 1, 1,
0.2878672, 1.945598, 0.7380689, 1, 1, 1, 1, 1,
0.2892244, 0.7674091, 0.5686685, 1, 1, 1, 1, 1,
0.2930146, 0.8544845, -0.3074014, 1, 1, 1, 1, 1,
0.2949657, -1.238227, 1.70278, 1, 1, 1, 1, 1,
0.3032862, 1.236972, 0.002687454, 0, 0, 1, 1, 1,
0.3123766, 1.169332, -1.060795, 1, 0, 0, 1, 1,
0.3142009, 0.06742978, 1.342177, 1, 0, 0, 1, 1,
0.3143747, 0.7327061, 0.8635023, 1, 0, 0, 1, 1,
0.3152743, 0.624469, 0.8479497, 1, 0, 0, 1, 1,
0.3166179, -0.624896, 3.079035, 1, 0, 0, 1, 1,
0.3208692, -1.647193, 4.870431, 0, 0, 0, 1, 1,
0.3211949, -0.2870314, 3.750126, 0, 0, 0, 1, 1,
0.3216931, -0.2339123, 2.490394, 0, 0, 0, 1, 1,
0.3303422, -0.2493692, 2.424963, 0, 0, 0, 1, 1,
0.3355243, -0.6242284, 1.252331, 0, 0, 0, 1, 1,
0.3412192, -0.2133971, 1.242645, 0, 0, 0, 1, 1,
0.3425501, 0.7882101, 1.31807, 0, 0, 0, 1, 1,
0.3427655, 0.9783432, -0.2556164, 1, 1, 1, 1, 1,
0.3453212, -0.2034871, 2.02664, 1, 1, 1, 1, 1,
0.3460094, -0.1044016, 0.8973383, 1, 1, 1, 1, 1,
0.3516933, 0.5228527, 0.3357049, 1, 1, 1, 1, 1,
0.3534056, -1.007894, 3.180632, 1, 1, 1, 1, 1,
0.3589745, 1.253946, -0.9069161, 1, 1, 1, 1, 1,
0.3682832, -0.5344267, 3.340916, 1, 1, 1, 1, 1,
0.372633, -1.355675, 2.969943, 1, 1, 1, 1, 1,
0.37545, 1.253637, 0.6413613, 1, 1, 1, 1, 1,
0.3786527, 0.9489885, -0.02959986, 1, 1, 1, 1, 1,
0.3788396, 1.809686, 1.253561, 1, 1, 1, 1, 1,
0.3835351, 0.8805732, 1.742005, 1, 1, 1, 1, 1,
0.3871213, -0.9258982, 2.383026, 1, 1, 1, 1, 1,
0.3950661, -1.844054, 2.130565, 1, 1, 1, 1, 1,
0.396109, 2.698318, -0.09987861, 1, 1, 1, 1, 1,
0.3970153, -1.052128, 3.374967, 0, 0, 1, 1, 1,
0.4036446, -1.341484, 4.701411, 1, 0, 0, 1, 1,
0.4037263, -0.6784724, 3.486358, 1, 0, 0, 1, 1,
0.4053866, -0.6963144, 3.258507, 1, 0, 0, 1, 1,
0.407717, 1.76406, 1.135487, 1, 0, 0, 1, 1,
0.4084761, -1.010229, 1.712149, 1, 0, 0, 1, 1,
0.4103836, -0.8274241, 4.116448, 0, 0, 0, 1, 1,
0.4120348, -1.120893, 2.950886, 0, 0, 0, 1, 1,
0.4150461, -0.06732079, 3.175452, 0, 0, 0, 1, 1,
0.4155071, -0.9075433, 4.104638, 0, 0, 0, 1, 1,
0.4172925, 0.8772948, 1.027363, 0, 0, 0, 1, 1,
0.4187459, -1.552557, 4.60086, 0, 0, 0, 1, 1,
0.4196795, 0.526634, 0.718336, 0, 0, 0, 1, 1,
0.4245817, -0.104468, -0.1794435, 1, 1, 1, 1, 1,
0.4258221, 1.776322, 0.4886224, 1, 1, 1, 1, 1,
0.4265505, -2.089964, 0.873605, 1, 1, 1, 1, 1,
0.4300476, -0.223929, 1.796928, 1, 1, 1, 1, 1,
0.430748, 1.632562, 0.3133159, 1, 1, 1, 1, 1,
0.4309236, -2.528033, 2.78634, 1, 1, 1, 1, 1,
0.4323084, 0.7489806, 1.200107, 1, 1, 1, 1, 1,
0.4335034, 1.404455, 1.067639, 1, 1, 1, 1, 1,
0.434283, -0.4820134, 3.532174, 1, 1, 1, 1, 1,
0.4359101, -1.307936, 3.370506, 1, 1, 1, 1, 1,
0.4459816, -0.2849513, 2.647321, 1, 1, 1, 1, 1,
0.446341, -2.694941, 3.091796, 1, 1, 1, 1, 1,
0.4487337, 1.793091, 1.698018, 1, 1, 1, 1, 1,
0.4541839, 0.7948707, 0.5823317, 1, 1, 1, 1, 1,
0.454845, -0.2271378, 2.430837, 1, 1, 1, 1, 1,
0.4555193, -1.029062, 1.780468, 0, 0, 1, 1, 1,
0.4566576, -0.3017464, 1.506497, 1, 0, 0, 1, 1,
0.4582043, 0.2990049, 0.2995925, 1, 0, 0, 1, 1,
0.4595956, -0.239807, 2.015721, 1, 0, 0, 1, 1,
0.4707898, -0.8963738, 3.674136, 1, 0, 0, 1, 1,
0.4741155, -0.4709502, 3.993349, 1, 0, 0, 1, 1,
0.47416, -0.3102307, 1.85903, 0, 0, 0, 1, 1,
0.4794112, 0.9976333, -0.2238692, 0, 0, 0, 1, 1,
0.4797645, 2.135253, 0.2360821, 0, 0, 0, 1, 1,
0.4810639, -0.3383435, 2.268912, 0, 0, 0, 1, 1,
0.48214, -0.1726203, 2.859278, 0, 0, 0, 1, 1,
0.4842158, 0.2261791, 1.413087, 0, 0, 0, 1, 1,
0.4849309, 0.3527175, -0.5155637, 0, 0, 0, 1, 1,
0.487446, 0.5978181, -1.940753, 1, 1, 1, 1, 1,
0.4877653, 0.3674172, 0.7841058, 1, 1, 1, 1, 1,
0.4922132, 0.6951792, -1.208454, 1, 1, 1, 1, 1,
0.4942495, -1.1585, 3.329863, 1, 1, 1, 1, 1,
0.5006055, 0.3137429, 2.417739, 1, 1, 1, 1, 1,
0.5019404, 0.3671348, 1.440899, 1, 1, 1, 1, 1,
0.5095516, 0.7055299, 0.06832102, 1, 1, 1, 1, 1,
0.5113343, 0.3353754, 1.993387, 1, 1, 1, 1, 1,
0.5159212, 1.309992, 0.2615941, 1, 1, 1, 1, 1,
0.5159677, -0.04820564, 2.768282, 1, 1, 1, 1, 1,
0.5160432, 0.2957966, 2.259309, 1, 1, 1, 1, 1,
0.5168507, 0.6051067, 0.7731642, 1, 1, 1, 1, 1,
0.5179849, -0.8450435, 2.105081, 1, 1, 1, 1, 1,
0.5184458, -0.5569796, 2.840634, 1, 1, 1, 1, 1,
0.524411, -0.1054183, 2.123915, 1, 1, 1, 1, 1,
0.5247962, -0.2326446, 3.550226, 0, 0, 1, 1, 1,
0.525739, -0.7537524, 0.7935523, 1, 0, 0, 1, 1,
0.5267525, 0.3221027, 3.23144, 1, 0, 0, 1, 1,
0.5277845, 1.718929, 1.765264, 1, 0, 0, 1, 1,
0.534865, 0.9854056, 0.527476, 1, 0, 0, 1, 1,
0.5382391, -0.8821092, -0.3022016, 1, 0, 0, 1, 1,
0.5386512, -0.170504, 2.18764, 0, 0, 0, 1, 1,
0.5438151, -1.435258, 0.979628, 0, 0, 0, 1, 1,
0.5451103, 0.265933, 0.5445631, 0, 0, 0, 1, 1,
0.5490476, -1.028361, 4.426444, 0, 0, 0, 1, 1,
0.5540649, -0.2111769, 0.4942558, 0, 0, 0, 1, 1,
0.5595261, -0.3667522, 2.463312, 0, 0, 0, 1, 1,
0.5615474, 1.568451, 1.765288, 0, 0, 0, 1, 1,
0.5616832, -0.7583371, 2.117843, 1, 1, 1, 1, 1,
0.5641251, -0.7068629, 2.815989, 1, 1, 1, 1, 1,
0.5648786, -0.9819771, 3.226592, 1, 1, 1, 1, 1,
0.5680915, 1.212796, 1.308948, 1, 1, 1, 1, 1,
0.5685831, -0.705807, 1.773708, 1, 1, 1, 1, 1,
0.5717721, 0.1585063, 1.175727, 1, 1, 1, 1, 1,
0.5754242, 1.640978, -2.073152, 1, 1, 1, 1, 1,
0.5764447, 0.1896607, 1.633265, 1, 1, 1, 1, 1,
0.5786653, 0.2968273, -1.730336, 1, 1, 1, 1, 1,
0.5804259, -1.184884, 2.920766, 1, 1, 1, 1, 1,
0.5875062, -0.6877108, 2.363327, 1, 1, 1, 1, 1,
0.5952924, 0.9693681, 0.6179022, 1, 1, 1, 1, 1,
0.5982746, -0.9500692, -0.02277067, 1, 1, 1, 1, 1,
0.600272, -0.484056, 3.20279, 1, 1, 1, 1, 1,
0.6072521, -0.254707, 1.922405, 1, 1, 1, 1, 1,
0.6080894, -0.8685842, 1.954633, 0, 0, 1, 1, 1,
0.6109695, -0.4425862, 1.341409, 1, 0, 0, 1, 1,
0.6136032, 1.417408, 1.092213, 1, 0, 0, 1, 1,
0.6218613, -0.8119564, 2.255333, 1, 0, 0, 1, 1,
0.6240583, 1.31841, 2.690747, 1, 0, 0, 1, 1,
0.6247224, -0.5317024, 2.029548, 1, 0, 0, 1, 1,
0.6252812, -0.5414355, 2.841132, 0, 0, 0, 1, 1,
0.6325385, 0.9553478, 2.651722, 0, 0, 0, 1, 1,
0.633541, -0.5232986, 1.772796, 0, 0, 0, 1, 1,
0.6343287, 1.880543, 1.377139, 0, 0, 0, 1, 1,
0.6345574, 1.188055, -0.7955335, 0, 0, 0, 1, 1,
0.6355368, 0.7482293, -0.3413982, 0, 0, 0, 1, 1,
0.6373014, 0.1348725, 2.223066, 0, 0, 0, 1, 1,
0.6408138, -0.4952928, 3.24633, 1, 1, 1, 1, 1,
0.6447691, 0.4385639, 1.486373, 1, 1, 1, 1, 1,
0.6454388, -1.805872, 3.056872, 1, 1, 1, 1, 1,
0.6472065, -1.177283, 2.441538, 1, 1, 1, 1, 1,
0.6499079, -1.189441, 2.556786, 1, 1, 1, 1, 1,
0.6660901, -0.7900589, 3.140826, 1, 1, 1, 1, 1,
0.6679352, -0.8344849, 4.24904, 1, 1, 1, 1, 1,
0.67206, 0.642315, 1.926642, 1, 1, 1, 1, 1,
0.6752689, -1.449586, 3.911098, 1, 1, 1, 1, 1,
0.6772243, -2.42809, 3.21232, 1, 1, 1, 1, 1,
0.6875743, 0.1807384, 1.585765, 1, 1, 1, 1, 1,
0.6916549, -0.2568179, 2.767598, 1, 1, 1, 1, 1,
0.7037126, 0.1392983, 1.307383, 1, 1, 1, 1, 1,
0.7039604, 0.3644829, 0.8099093, 1, 1, 1, 1, 1,
0.7076176, -0.03653858, 1.658737, 1, 1, 1, 1, 1,
0.7120379, -0.7698157, 2.205404, 0, 0, 1, 1, 1,
0.7182872, -0.5812213, 4.650214, 1, 0, 0, 1, 1,
0.7183567, -0.8899842, 2.971525, 1, 0, 0, 1, 1,
0.7193887, 0.320356, -0.4345299, 1, 0, 0, 1, 1,
0.720802, 0.8053296, -0.5967606, 1, 0, 0, 1, 1,
0.7231439, 0.328147, 2.723074, 1, 0, 0, 1, 1,
0.7231789, -0.06045057, 3.06347, 0, 0, 0, 1, 1,
0.7387068, 0.7266891, 1.222664, 0, 0, 0, 1, 1,
0.7392815, 1.410521, 0.5372372, 0, 0, 0, 1, 1,
0.7455404, -0.192113, 1.309621, 0, 0, 0, 1, 1,
0.7467092, -0.4801409, 1.943942, 0, 0, 0, 1, 1,
0.7499191, -1.450642, 0.2152645, 0, 0, 0, 1, 1,
0.7534712, 0.2720941, 2.916262, 0, 0, 0, 1, 1,
0.754467, -0.5960073, 1.969887, 1, 1, 1, 1, 1,
0.7564184, 0.08569311, 2.217894, 1, 1, 1, 1, 1,
0.757171, 0.5577264, 0.2363096, 1, 1, 1, 1, 1,
0.7658949, -1.848232, 4.270806, 1, 1, 1, 1, 1,
0.768002, 1.241911, -0.258916, 1, 1, 1, 1, 1,
0.7680702, -2.087543, 2.050387, 1, 1, 1, 1, 1,
0.7705379, -1.047522, 2.021731, 1, 1, 1, 1, 1,
0.7771028, -0.1167134, 1.639195, 1, 1, 1, 1, 1,
0.7778847, -1.283275, 2.231656, 1, 1, 1, 1, 1,
0.7824602, 1.339127, 1.583683, 1, 1, 1, 1, 1,
0.7879843, -1.167093, 3.029393, 1, 1, 1, 1, 1,
0.7890329, -1.678106, 2.987439, 1, 1, 1, 1, 1,
0.7920969, -2.215735, 2.196337, 1, 1, 1, 1, 1,
0.7924069, -0.7583601, 1.687448, 1, 1, 1, 1, 1,
0.7948124, -0.7061788, 0.5739716, 1, 1, 1, 1, 1,
0.7969151, -0.1019936, 0.3328433, 0, 0, 1, 1, 1,
0.7976066, 2.118216, 1.196926, 1, 0, 0, 1, 1,
0.8038628, 1.023883, 0.0705508, 1, 0, 0, 1, 1,
0.8042919, 0.4430266, 1.831724, 1, 0, 0, 1, 1,
0.8143915, 1.816911, 1.73758, 1, 0, 0, 1, 1,
0.8149187, -0.9989019, 1.921469, 1, 0, 0, 1, 1,
0.8180355, 0.6388391, 0.6301798, 0, 0, 0, 1, 1,
0.8191805, -0.3083034, 0.602293, 0, 0, 0, 1, 1,
0.8228674, -0.04820799, 1.210206, 0, 0, 0, 1, 1,
0.83518, 0.0910884, 1.728302, 0, 0, 0, 1, 1,
0.8353807, -0.2282208, 3.358755, 0, 0, 0, 1, 1,
0.835881, -0.154287, 1.28178, 0, 0, 0, 1, 1,
0.8483596, 1.258277, 1.617329, 0, 0, 0, 1, 1,
0.8492865, 0.455913, 0.7357209, 1, 1, 1, 1, 1,
0.8508573, 3.183103, -0.6075993, 1, 1, 1, 1, 1,
0.8508625, -1.233668, 1.61546, 1, 1, 1, 1, 1,
0.851845, 0.5203053, 2.072835, 1, 1, 1, 1, 1,
0.858548, 1.280754, 1.545058, 1, 1, 1, 1, 1,
0.8603297, 1.672816, -0.5554109, 1, 1, 1, 1, 1,
0.8688718, -1.357346, 1.91333, 1, 1, 1, 1, 1,
0.8727271, -1.212132, 1.806703, 1, 1, 1, 1, 1,
0.8763378, -0.8578715, 1.80216, 1, 1, 1, 1, 1,
0.8778691, -0.9815051, 1.951509, 1, 1, 1, 1, 1,
0.8784945, 0.06844347, -0.02612493, 1, 1, 1, 1, 1,
0.8787941, -0.08012494, 0.2071621, 1, 1, 1, 1, 1,
0.8870947, -1.615112, 2.799854, 1, 1, 1, 1, 1,
0.8942264, -0.2674307, 0.5678719, 1, 1, 1, 1, 1,
0.8988911, 0.7057632, 0.5369744, 1, 1, 1, 1, 1,
0.8990824, 0.0362707, 2.399924, 0, 0, 1, 1, 1,
0.9040114, 0.9822136, 0.2691877, 1, 0, 0, 1, 1,
0.9041588, 0.04437725, 2.360276, 1, 0, 0, 1, 1,
0.9057825, -0.4404105, 3.159897, 1, 0, 0, 1, 1,
0.9064324, -0.1342753, 3.437941, 1, 0, 0, 1, 1,
0.916917, -1.17985, 2.018566, 1, 0, 0, 1, 1,
0.9172942, -0.3893664, 1.040883, 0, 0, 0, 1, 1,
0.9219703, -0.2715265, 3.886049, 0, 0, 0, 1, 1,
0.9283217, -0.1297786, 0.006017467, 0, 0, 0, 1, 1,
0.9352263, -0.3994319, 3.054801, 0, 0, 0, 1, 1,
0.9363976, 0.6043718, 0.9804985, 0, 0, 0, 1, 1,
0.943049, 1.900117, 0.3590618, 0, 0, 0, 1, 1,
0.9487878, 0.002931707, 3.058239, 0, 0, 0, 1, 1,
0.9562183, -0.1016236, 0.9941419, 1, 1, 1, 1, 1,
0.9583207, -1.22135, 3.175548, 1, 1, 1, 1, 1,
0.9608022, 1.142524, 0.6299646, 1, 1, 1, 1, 1,
0.9608199, 0.7530908, 0.01781623, 1, 1, 1, 1, 1,
0.9654043, 0.3637483, 1.324187, 1, 1, 1, 1, 1,
0.9663858, 0.3151046, 0.9443848, 1, 1, 1, 1, 1,
0.9668823, 1.082247, 1.636547, 1, 1, 1, 1, 1,
0.9699878, 0.5587707, 2.044467, 1, 1, 1, 1, 1,
0.9745124, 0.5041108, 0.5848125, 1, 1, 1, 1, 1,
0.9749565, -0.4128927, 1.036924, 1, 1, 1, 1, 1,
0.9759451, -1.698631, 3.102337, 1, 1, 1, 1, 1,
0.9922853, -0.9310908, 1.913085, 1, 1, 1, 1, 1,
0.9928169, 0.5029021, 2.864906, 1, 1, 1, 1, 1,
0.9941971, 0.03730151, 2.675403, 1, 1, 1, 1, 1,
0.9954258, 0.6718014, 0.5981616, 1, 1, 1, 1, 1,
1.014411, 0.3814095, -0.4000244, 0, 0, 1, 1, 1,
1.016815, -0.8711153, 4.963127, 1, 0, 0, 1, 1,
1.021985, -0.6297933, 3.395353, 1, 0, 0, 1, 1,
1.022017, -0.1083454, 2.014608, 1, 0, 0, 1, 1,
1.022416, 0.9423262, 0.09351721, 1, 0, 0, 1, 1,
1.023069, 0.8348749, 0.6079019, 1, 0, 0, 1, 1,
1.029124, -1.398414, 1.828029, 0, 0, 0, 1, 1,
1.031077, -1.021745, 1.543907, 0, 0, 0, 1, 1,
1.031095, -0.5881343, 1.18269, 0, 0, 0, 1, 1,
1.038585, 1.133545, -1.131041, 0, 0, 0, 1, 1,
1.03949, 0.4937522, 2.375361, 0, 0, 0, 1, 1,
1.039863, 0.7598813, -0.08808713, 0, 0, 0, 1, 1,
1.04124, 0.5678729, 0.2491567, 0, 0, 0, 1, 1,
1.044881, 0.3625067, 0.9154917, 1, 1, 1, 1, 1,
1.046113, -0.5969604, 2.233115, 1, 1, 1, 1, 1,
1.046745, -0.1850902, 2.291652, 1, 1, 1, 1, 1,
1.046813, -1.480598, 1.121381, 1, 1, 1, 1, 1,
1.053428, -1.586806, 3.142143, 1, 1, 1, 1, 1,
1.053532, 0.3647689, 2.259066, 1, 1, 1, 1, 1,
1.054492, -0.9482526, 2.068815, 1, 1, 1, 1, 1,
1.070465, -0.04058062, 2.662033, 1, 1, 1, 1, 1,
1.076705, 0.010146, 3.087951, 1, 1, 1, 1, 1,
1.088964, -1.799277, 4.273329, 1, 1, 1, 1, 1,
1.089792, 0.300768, 1.513759, 1, 1, 1, 1, 1,
1.104617, 1.527135, -0.1205854, 1, 1, 1, 1, 1,
1.107535, 0.1667896, 2.271196, 1, 1, 1, 1, 1,
1.113994, 1.446682, 1.355907, 1, 1, 1, 1, 1,
1.114429, 1.03193, 0.5827652, 1, 1, 1, 1, 1,
1.124699, -0.0063086, 2.375978, 0, 0, 1, 1, 1,
1.133116, 1.562134, 0.728783, 1, 0, 0, 1, 1,
1.141562, 0.4822448, 2.070019, 1, 0, 0, 1, 1,
1.142468, -1.718535, 2.872446, 1, 0, 0, 1, 1,
1.14321, -1.600426, 2.838455, 1, 0, 0, 1, 1,
1.144809, 0.1297302, 0.5267721, 1, 0, 0, 1, 1,
1.14549, -0.9475918, 2.877089, 0, 0, 0, 1, 1,
1.150024, -0.1571796, 0.4170261, 0, 0, 0, 1, 1,
1.155057, -0.7647003, 3.150336, 0, 0, 0, 1, 1,
1.161958, 1.234946, 0.2817598, 0, 0, 0, 1, 1,
1.163053, -1.202533, 3.948327, 0, 0, 0, 1, 1,
1.177775, 0.4235734, 2.996895, 0, 0, 0, 1, 1,
1.191706, 0.8032326, 0.5784974, 0, 0, 0, 1, 1,
1.192334, -0.7389188, 1.39965, 1, 1, 1, 1, 1,
1.199687, -0.2875372, 1.488813, 1, 1, 1, 1, 1,
1.200615, -2.129379, 1.527793, 1, 1, 1, 1, 1,
1.203933, 1.584799, 0.7019557, 1, 1, 1, 1, 1,
1.216136, -0.5012121, 2.748018, 1, 1, 1, 1, 1,
1.221848, -0.1151732, 0.6187084, 1, 1, 1, 1, 1,
1.224787, -0.2120871, 1.599669, 1, 1, 1, 1, 1,
1.235426, 0.7013321, 0.01948489, 1, 1, 1, 1, 1,
1.242499, -0.34935, 1.6609, 1, 1, 1, 1, 1,
1.254095, -0.9030533, 1.337626, 1, 1, 1, 1, 1,
1.258834, -0.06341264, 3.00392, 1, 1, 1, 1, 1,
1.2628, -0.8649755, 3.142204, 1, 1, 1, 1, 1,
1.26317, -0.8851991, 2.095067, 1, 1, 1, 1, 1,
1.266688, 1.310307, 1.489688, 1, 1, 1, 1, 1,
1.270027, 1.255348, 0.4256914, 1, 1, 1, 1, 1,
1.284271, 1.403813, -1.723533, 0, 0, 1, 1, 1,
1.291383, -2.082312, 1.666547, 1, 0, 0, 1, 1,
1.292976, -0.6380376, 2.842152, 1, 0, 0, 1, 1,
1.29409, -1.171013, 1.920946, 1, 0, 0, 1, 1,
1.30008, -0.6309391, 1.961245, 1, 0, 0, 1, 1,
1.301317, -0.9367719, 2.709003, 1, 0, 0, 1, 1,
1.308648, 0.360649, 0.7043455, 0, 0, 0, 1, 1,
1.326776, 0.4429898, 2.537645, 0, 0, 0, 1, 1,
1.327003, -1.628873, 1.384442, 0, 0, 0, 1, 1,
1.342353, -0.4679399, 2.075028, 0, 0, 0, 1, 1,
1.349193, 0.2814452, 1.134169, 0, 0, 0, 1, 1,
1.350193, -0.09045345, 1.685075, 0, 0, 0, 1, 1,
1.356003, -0.1961938, 2.213565, 0, 0, 0, 1, 1,
1.360315, 0.9409384, -0.05387554, 1, 1, 1, 1, 1,
1.364469, 1.411887, 1.098943, 1, 1, 1, 1, 1,
1.372659, 1.276731, -0.5768846, 1, 1, 1, 1, 1,
1.37679, 1.432015, 1.528792, 1, 1, 1, 1, 1,
1.381459, -0.6446722, 1.454551, 1, 1, 1, 1, 1,
1.383937, 0.2482689, 2.635521, 1, 1, 1, 1, 1,
1.384894, -2.393218, 3.962318, 1, 1, 1, 1, 1,
1.394821, -0.04140429, 0.8951263, 1, 1, 1, 1, 1,
1.395615, 0.529054, 1.184004, 1, 1, 1, 1, 1,
1.396031, 1.400753, 0.522516, 1, 1, 1, 1, 1,
1.412538, 1.004364, 1.959899, 1, 1, 1, 1, 1,
1.414397, 0.2959959, 0.9892939, 1, 1, 1, 1, 1,
1.421088, 1.136731, 0.9883268, 1, 1, 1, 1, 1,
1.423475, 1.554853, 0.5286732, 1, 1, 1, 1, 1,
1.425346, 0.5572858, 3.499693, 1, 1, 1, 1, 1,
1.428135, -0.5591242, 1.464213, 0, 0, 1, 1, 1,
1.428248, 1.381564, 0.06307599, 1, 0, 0, 1, 1,
1.431225, 2.735303, 0.4374533, 1, 0, 0, 1, 1,
1.438686, -0.2941692, 3.399741, 1, 0, 0, 1, 1,
1.442528, -0.7934189, 2.532946, 1, 0, 0, 1, 1,
1.472716, -0.6571943, 1.388794, 1, 0, 0, 1, 1,
1.477731, 0.6215271, 0.5836077, 0, 0, 0, 1, 1,
1.481854, 0.2131293, 2.907401, 0, 0, 0, 1, 1,
1.486387, 1.593803, 0.6511022, 0, 0, 0, 1, 1,
1.487084, -0.5103764, 1.814044, 0, 0, 0, 1, 1,
1.497438, -0.4261806, 2.728356, 0, 0, 0, 1, 1,
1.502374, 0.3258456, 1.61548, 0, 0, 0, 1, 1,
1.508947, 0.1601959, 1.618028, 0, 0, 0, 1, 1,
1.516846, 0.2490071, 2.007178, 1, 1, 1, 1, 1,
1.533956, 0.3048829, 1.105035, 1, 1, 1, 1, 1,
1.544158, -0.8820174, 2.25108, 1, 1, 1, 1, 1,
1.558515, -0.6598243, 3.701002, 1, 1, 1, 1, 1,
1.570547, -0.8539367, 1.566626, 1, 1, 1, 1, 1,
1.586225, -2.006821, 0.4799823, 1, 1, 1, 1, 1,
1.590138, -1.872397, 2.266406, 1, 1, 1, 1, 1,
1.590419, -0.5426449, 1.774142, 1, 1, 1, 1, 1,
1.595806, 1.427248, 1.967875, 1, 1, 1, 1, 1,
1.596237, 1.649104, -0.4529636, 1, 1, 1, 1, 1,
1.600495, 1.429696, 0.9103717, 1, 1, 1, 1, 1,
1.614493, 0.4650081, 1.760836, 1, 1, 1, 1, 1,
1.61532, -0.6567545, 1.249931, 1, 1, 1, 1, 1,
1.638653, -0.357863, 0.3416816, 1, 1, 1, 1, 1,
1.643831, -1.151923, 2.776331, 1, 1, 1, 1, 1,
1.646592, -0.638561, 2.497016, 0, 0, 1, 1, 1,
1.647403, 0.2848912, -0.5658355, 1, 0, 0, 1, 1,
1.665084, -0.0514666, 1.230248, 1, 0, 0, 1, 1,
1.665226, -0.6231497, 2.845399, 1, 0, 0, 1, 1,
1.667611, -0.1192388, 1.168707, 1, 0, 0, 1, 1,
1.698281, 1.221769, -0.3152654, 1, 0, 0, 1, 1,
1.705773, 1.688919, 1.190182, 0, 0, 0, 1, 1,
1.723817, 0.1498493, 2.25197, 0, 0, 0, 1, 1,
1.72864, -2.00375, 2.073082, 0, 0, 0, 1, 1,
1.742329, 0.9430334, 2.564989, 0, 0, 0, 1, 1,
1.748011, -0.6443205, 1.332462, 0, 0, 0, 1, 1,
1.783128, 0.1538985, 1.715715, 0, 0, 0, 1, 1,
1.786273, -0.7780654, 2.194313, 0, 0, 0, 1, 1,
1.79134, 1.424561, -0.5392483, 1, 1, 1, 1, 1,
1.793271, 0.2777446, 2.290459, 1, 1, 1, 1, 1,
1.800224, -0.3487193, 1.9659, 1, 1, 1, 1, 1,
1.80218, -0.3349333, 3.745572, 1, 1, 1, 1, 1,
1.809646, -3.816585, 2.278421, 1, 1, 1, 1, 1,
1.812865, 0.5975793, 0.4554141, 1, 1, 1, 1, 1,
1.824237, -1.189121, 1.400622, 1, 1, 1, 1, 1,
1.832244, 0.9857197, 0.6505847, 1, 1, 1, 1, 1,
1.83498, -1.648096, 2.292487, 1, 1, 1, 1, 1,
1.891862, 0.5984778, 0.5697588, 1, 1, 1, 1, 1,
1.893266, -1.262282, 3.562963, 1, 1, 1, 1, 1,
1.924364, -1.181197, 1.00767, 1, 1, 1, 1, 1,
1.948045, -0.8066255, 2.836721, 1, 1, 1, 1, 1,
1.95394, 1.316073, 1.503597, 1, 1, 1, 1, 1,
1.977725, -0.3288842, 1.567708, 1, 1, 1, 1, 1,
2.012863, 0.04718969, 0.6387697, 0, 0, 1, 1, 1,
2.013037, -0.8666959, 1.63862, 1, 0, 0, 1, 1,
2.02421, 1.185705, 2.085033, 1, 0, 0, 1, 1,
2.065456, -0.7076963, 2.289242, 1, 0, 0, 1, 1,
2.06891, 1.203375, 0.891539, 1, 0, 0, 1, 1,
2.085057, -0.2808725, 1.063547, 1, 0, 0, 1, 1,
2.123096, 1.301156, 1.463845, 0, 0, 0, 1, 1,
2.15831, 0.01222836, 0.7444203, 0, 0, 0, 1, 1,
2.166595, -0.1610369, 0.9390657, 0, 0, 0, 1, 1,
2.186462, -0.9623827, 0.7094359, 0, 0, 0, 1, 1,
2.235495, 1.363566, -0.8125001, 0, 0, 0, 1, 1,
2.304433, -1.247793, 2.186817, 0, 0, 0, 1, 1,
2.351886, -1.525877, 0.03215851, 0, 0, 0, 1, 1,
2.368435, 1.697035, 0.6599362, 1, 1, 1, 1, 1,
2.424564, -0.221445, 2.253712, 1, 1, 1, 1, 1,
2.49554, -0.351917, 2.010209, 1, 1, 1, 1, 1,
2.680206, -2.143782, 1.084705, 1, 1, 1, 1, 1,
2.75759, -0.9221097, 1.551439, 1, 1, 1, 1, 1,
2.779456, 0.1072417, 1.66906, 1, 1, 1, 1, 1,
2.797076, -0.5467869, 1.358328, 1, 1, 1, 1, 1
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
var radius = 9.458329;
var distance = 33.22198;
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
mvMatrix.translate( 0.04065454, 0.3053837, 0.2702308 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22198);
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
