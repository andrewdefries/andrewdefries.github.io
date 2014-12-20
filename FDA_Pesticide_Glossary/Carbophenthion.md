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
-3.325724, -1.519223, -2.581559, 1, 0, 0, 1,
-3.019659, 0.9698824, -1.098467, 1, 0.007843138, 0, 1,
-2.942664, -0.1581759, -3.684935, 1, 0.01176471, 0, 1,
-2.824096, -1.42213, -2.42237, 1, 0.01960784, 0, 1,
-2.752376, 1.28912, -1.927144, 1, 0.02352941, 0, 1,
-2.73932, 0.4908598, -1.355091, 1, 0.03137255, 0, 1,
-2.702123, -0.08732948, -1.226218, 1, 0.03529412, 0, 1,
-2.675719, -0.0009847668, -1.656065, 1, 0.04313726, 0, 1,
-2.617565, -0.056919, -1.164384, 1, 0.04705882, 0, 1,
-2.552497, -0.6175567, -1.884163, 1, 0.05490196, 0, 1,
-2.439195, 1.431724, -1.1025, 1, 0.05882353, 0, 1,
-2.393591, -0.6339477, -0.5900713, 1, 0.06666667, 0, 1,
-2.388737, -0.233988, -3.54525, 1, 0.07058824, 0, 1,
-2.385707, -0.2177574, -2.37055, 1, 0.07843138, 0, 1,
-2.375921, -0.7426593, -1.614576, 1, 0.08235294, 0, 1,
-2.338873, 1.273328, -2.816563, 1, 0.09019608, 0, 1,
-2.268085, -0.5779846, -2.17905, 1, 0.09411765, 0, 1,
-2.173681, 0.4252214, -3.466797, 1, 0.1019608, 0, 1,
-2.133625, -0.027458, -1.449303, 1, 0.1098039, 0, 1,
-2.125487, 0.3988749, -0.1381889, 1, 0.1137255, 0, 1,
-2.051197, -0.3095496, -1.432079, 1, 0.1215686, 0, 1,
-2.040183, 0.8460414, -1.817641, 1, 0.1254902, 0, 1,
-2.005637, 0.06220633, -2.995158, 1, 0.1333333, 0, 1,
-2.000069, -0.8403332, -0.9403458, 1, 0.1372549, 0, 1,
-1.978546, 1.471989, -0.7087225, 1, 0.145098, 0, 1,
-1.968547, -1.634395, -1.915918, 1, 0.1490196, 0, 1,
-1.958837, 1.613534, -0.9049755, 1, 0.1568628, 0, 1,
-1.948518, 0.4348671, -1.936615, 1, 0.1607843, 0, 1,
-1.910257, -0.1038583, -0.7662318, 1, 0.1686275, 0, 1,
-1.901256, -0.8616219, -2.609118, 1, 0.172549, 0, 1,
-1.876108, -0.2251918, -1.574854, 1, 0.1803922, 0, 1,
-1.856136, 0.3408287, -0.3579217, 1, 0.1843137, 0, 1,
-1.831814, -0.1632872, -1.379425, 1, 0.1921569, 0, 1,
-1.828384, 0.2087496, 0.3494087, 1, 0.1960784, 0, 1,
-1.814385, -0.6887274, -3.753106, 1, 0.2039216, 0, 1,
-1.798017, 0.08033659, -2.407599, 1, 0.2117647, 0, 1,
-1.788545, 1.62612, -1.529564, 1, 0.2156863, 0, 1,
-1.781461, 1.187707, -0.1998701, 1, 0.2235294, 0, 1,
-1.777855, 0.6729368, -2.56821, 1, 0.227451, 0, 1,
-1.777389, -0.1349718, -2.665926, 1, 0.2352941, 0, 1,
-1.773077, -0.5858751, -2.568884, 1, 0.2392157, 0, 1,
-1.753353, -1.204433, -0.8661224, 1, 0.2470588, 0, 1,
-1.747125, -0.4161079, -2.675501, 1, 0.2509804, 0, 1,
-1.722079, -1.362808, -3.629621, 1, 0.2588235, 0, 1,
-1.696311, -0.5893283, -1.732896, 1, 0.2627451, 0, 1,
-1.685619, -0.4235193, -1.956235, 1, 0.2705882, 0, 1,
-1.673295, 0.8368073, -2.191084, 1, 0.2745098, 0, 1,
-1.672176, 0.2901016, -1.431993, 1, 0.282353, 0, 1,
-1.661573, 0.3865482, -1.881607, 1, 0.2862745, 0, 1,
-1.651411, 1.727368, -1.095098, 1, 0.2941177, 0, 1,
-1.630323, -1.604883, -3.273674, 1, 0.3019608, 0, 1,
-1.614766, -0.4962254, -1.746483, 1, 0.3058824, 0, 1,
-1.606718, -1.162235, -2.144475, 1, 0.3137255, 0, 1,
-1.60552, 1.114401, 0.6741067, 1, 0.3176471, 0, 1,
-1.594005, 1.417534, -3.836443, 1, 0.3254902, 0, 1,
-1.588197, 1.36705, -0.3312024, 1, 0.3294118, 0, 1,
-1.587479, 0.7891894, -2.238957, 1, 0.3372549, 0, 1,
-1.558225, -0.4543155, 0.5264811, 1, 0.3411765, 0, 1,
-1.544289, -1.219254, -2.182103, 1, 0.3490196, 0, 1,
-1.542725, -0.7345836, -1.535563, 1, 0.3529412, 0, 1,
-1.538321, 0.1307129, -1.505415, 1, 0.3607843, 0, 1,
-1.537836, -0.4579589, -1.508793, 1, 0.3647059, 0, 1,
-1.537571, -0.1474729, -1.543276, 1, 0.372549, 0, 1,
-1.52254, -0.1991763, -2.120803, 1, 0.3764706, 0, 1,
-1.517806, 0.9539894, -0.4288465, 1, 0.3843137, 0, 1,
-1.501318, 0.3991262, -0.8630087, 1, 0.3882353, 0, 1,
-1.499231, 0.2980456, -1.622762, 1, 0.3960784, 0, 1,
-1.496946, 1.28837, -1.012088, 1, 0.4039216, 0, 1,
-1.470398, -0.7431003, -2.620618, 1, 0.4078431, 0, 1,
-1.463051, 0.6854144, 0.2338668, 1, 0.4156863, 0, 1,
-1.462233, -0.1156315, -0.6338583, 1, 0.4196078, 0, 1,
-1.453685, -0.6555001, -2.243738, 1, 0.427451, 0, 1,
-1.448774, -0.6505321, -1.141177, 1, 0.4313726, 0, 1,
-1.447394, 1.494946, -0.8964765, 1, 0.4392157, 0, 1,
-1.446024, -1.55299, -2.713169, 1, 0.4431373, 0, 1,
-1.443449, 0.8715558, -1.489282, 1, 0.4509804, 0, 1,
-1.442567, 1.363367, -1.375616, 1, 0.454902, 0, 1,
-1.439305, -0.03477538, -1.629811, 1, 0.4627451, 0, 1,
-1.436176, -0.7158095, -3.861918, 1, 0.4666667, 0, 1,
-1.43034, -0.846642, -2.160204, 1, 0.4745098, 0, 1,
-1.425449, 0.9673611, -3.371665, 1, 0.4784314, 0, 1,
-1.399395, -1.82293, -2.772976, 1, 0.4862745, 0, 1,
-1.396741, 0.7474485, -0.7919522, 1, 0.4901961, 0, 1,
-1.387493, 0.03904823, -2.866404, 1, 0.4980392, 0, 1,
-1.387437, -0.09236929, -1.137626, 1, 0.5058824, 0, 1,
-1.381281, -0.5602825, -3.191493, 1, 0.509804, 0, 1,
-1.378561, 0.4330528, 0.1779472, 1, 0.5176471, 0, 1,
-1.368824, -0.9481164, -1.544479, 1, 0.5215687, 0, 1,
-1.367738, -0.8949995, -2.889184, 1, 0.5294118, 0, 1,
-1.354105, -1.646236, -1.701746, 1, 0.5333334, 0, 1,
-1.347778, -0.8149738, -2.091853, 1, 0.5411765, 0, 1,
-1.338136, -0.8205732, -2.582399, 1, 0.5450981, 0, 1,
-1.33641, 1.724777, -2.603809, 1, 0.5529412, 0, 1,
-1.336275, -0.4991393, -2.636616, 1, 0.5568628, 0, 1,
-1.335234, 0.04311306, -0.6677289, 1, 0.5647059, 0, 1,
-1.33017, -0.2508183, -2.017826, 1, 0.5686275, 0, 1,
-1.322726, 1.653551, -2.320918, 1, 0.5764706, 0, 1,
-1.31179, -0.7371922, -1.569673, 1, 0.5803922, 0, 1,
-1.303599, 0.04470283, -2.379516, 1, 0.5882353, 0, 1,
-1.298424, -1.632967, -3.153455, 1, 0.5921569, 0, 1,
-1.292004, 0.4733628, -0.9181158, 1, 0.6, 0, 1,
-1.277989, -0.1257843, -2.836706, 1, 0.6078432, 0, 1,
-1.270937, -0.1260053, -0.22507, 1, 0.6117647, 0, 1,
-1.26034, -1.32159, -4.031937, 1, 0.6196079, 0, 1,
-1.251494, -1.504087, -2.74866, 1, 0.6235294, 0, 1,
-1.250819, -0.3070815, -2.04755, 1, 0.6313726, 0, 1,
-1.236262, -0.4587349, -0.6846087, 1, 0.6352941, 0, 1,
-1.228098, -0.5739309, -3.218021, 1, 0.6431373, 0, 1,
-1.226663, -0.479792, -3.229808, 1, 0.6470588, 0, 1,
-1.223671, -0.5314111, -2.674423, 1, 0.654902, 0, 1,
-1.205166, -1.265944, -3.248717, 1, 0.6588235, 0, 1,
-1.204526, 0.5974109, 0.4525931, 1, 0.6666667, 0, 1,
-1.190132, -1.547176, -1.892275, 1, 0.6705883, 0, 1,
-1.189381, -1.793439, -1.606548, 1, 0.6784314, 0, 1,
-1.189313, -0.6213704, -3.374167, 1, 0.682353, 0, 1,
-1.187174, 0.04843299, -1.916905, 1, 0.6901961, 0, 1,
-1.187169, -1.604967, -2.001937, 1, 0.6941177, 0, 1,
-1.185406, 0.5121979, -0.7237628, 1, 0.7019608, 0, 1,
-1.18353, -0.7536235, -0.4428391, 1, 0.7098039, 0, 1,
-1.183197, 0.4809564, -2.167639, 1, 0.7137255, 0, 1,
-1.18319, 0.3009833, -2.027794, 1, 0.7215686, 0, 1,
-1.177835, -0.6710926, -1.217531, 1, 0.7254902, 0, 1,
-1.149655, 0.3925504, -3.651099, 1, 0.7333333, 0, 1,
-1.134153, 0.9218336, -1.588677, 1, 0.7372549, 0, 1,
-1.129187, 0.397239, -1.526957, 1, 0.7450981, 0, 1,
-1.128537, -0.32584, -2.521563, 1, 0.7490196, 0, 1,
-1.126936, 0.2687319, -0.3342308, 1, 0.7568628, 0, 1,
-1.123309, 0.08569257, -2.383693, 1, 0.7607843, 0, 1,
-1.123149, -0.2626294, -3.813418, 1, 0.7686275, 0, 1,
-1.120935, -0.2161058, -0.1635153, 1, 0.772549, 0, 1,
-1.1183, -0.2725735, 0.1285045, 1, 0.7803922, 0, 1,
-1.11513, -1.339915, -1.056361, 1, 0.7843137, 0, 1,
-1.095428, -0.7199902, -0.8185772, 1, 0.7921569, 0, 1,
-1.0953, -1.548654, -1.867015, 1, 0.7960784, 0, 1,
-1.084905, -0.790742, -2.678055, 1, 0.8039216, 0, 1,
-1.083113, 1.425895, -0.7235317, 1, 0.8117647, 0, 1,
-1.077096, -0.314548, -1.409734, 1, 0.8156863, 0, 1,
-1.068318, -1.027588, -0.8492153, 1, 0.8235294, 0, 1,
-1.064293, -0.2708016, -2.368254, 1, 0.827451, 0, 1,
-1.062371, 2.175769, 0.3043341, 1, 0.8352941, 0, 1,
-1.056384, 0.1803934, -0.5767998, 1, 0.8392157, 0, 1,
-1.054471, 0.2046557, -2.305843, 1, 0.8470588, 0, 1,
-1.051316, -0.2214672, -1.39713, 1, 0.8509804, 0, 1,
-1.049024, 1.029894, -1.235643, 1, 0.8588235, 0, 1,
-1.048915, 1.407656, 0.6422346, 1, 0.8627451, 0, 1,
-1.048393, 0.2550411, -1.687263, 1, 0.8705882, 0, 1,
-1.045537, 0.009907764, -3.721149, 1, 0.8745098, 0, 1,
-1.038769, -1.713424, -0.5929931, 1, 0.8823529, 0, 1,
-1.03239, -0.6310689, -1.405688, 1, 0.8862745, 0, 1,
-1.028412, -0.9215037, -2.346222, 1, 0.8941177, 0, 1,
-1.02837, -1.331052, -3.098312, 1, 0.8980392, 0, 1,
-1.027412, -0.2898806, -1.328492, 1, 0.9058824, 0, 1,
-1.02139, -0.624707, -2.032163, 1, 0.9137255, 0, 1,
-1.020718, -0.9877304, -3.183776, 1, 0.9176471, 0, 1,
-1.017849, 0.5983429, -0.9069408, 1, 0.9254902, 0, 1,
-1.006916, -0.1936608, -2.124527, 1, 0.9294118, 0, 1,
-1.00635, -0.3601784, -1.68207, 1, 0.9372549, 0, 1,
-1.006195, 0.1320489, -1.922662, 1, 0.9411765, 0, 1,
-1.004425, 0.41429, -2.035527, 1, 0.9490196, 0, 1,
-1.004286, -0.9675779, -2.761582, 1, 0.9529412, 0, 1,
-1.003406, 0.5970123, -2.174682, 1, 0.9607843, 0, 1,
-0.9930925, -0.146472, -1.37997, 1, 0.9647059, 0, 1,
-0.991933, -0.2645814, -1.005399, 1, 0.972549, 0, 1,
-0.9897314, -0.5522379, -2.072797, 1, 0.9764706, 0, 1,
-0.9835947, -1.156885, -3.044116, 1, 0.9843137, 0, 1,
-0.9799376, 0.7225055, -1.050946, 1, 0.9882353, 0, 1,
-0.9789882, -0.5615245, -1.346091, 1, 0.9960784, 0, 1,
-0.9783874, -1.226645, -2.443512, 0.9960784, 1, 0, 1,
-0.9779239, -0.1442774, -2.56987, 0.9921569, 1, 0, 1,
-0.9766961, -0.9732869, -3.521279, 0.9843137, 1, 0, 1,
-0.9726871, -0.4487718, -0.5904903, 0.9803922, 1, 0, 1,
-0.9705512, -0.9315037, -1.482016, 0.972549, 1, 0, 1,
-0.9685907, 0.5483918, -1.226406, 0.9686275, 1, 0, 1,
-0.9599329, -0.05935355, -3.765038, 0.9607843, 1, 0, 1,
-0.95149, -1.150861, -5.039191, 0.9568627, 1, 0, 1,
-0.9509955, 0.9709927, -0.0498795, 0.9490196, 1, 0, 1,
-0.950623, -0.799153, -3.678814, 0.945098, 1, 0, 1,
-0.9484381, 0.4787612, -1.217857, 0.9372549, 1, 0, 1,
-0.9466817, -0.3246427, -4.632246, 0.9333333, 1, 0, 1,
-0.9372903, -0.6552439, -2.660387, 0.9254902, 1, 0, 1,
-0.9360045, -1.690553, -2.851412, 0.9215686, 1, 0, 1,
-0.9346195, -0.3789347, -1.819947, 0.9137255, 1, 0, 1,
-0.9305736, 0.649549, 0.5824606, 0.9098039, 1, 0, 1,
-0.9305416, -1.609981, -2.950264, 0.9019608, 1, 0, 1,
-0.9301918, -0.02192196, -0.32322, 0.8941177, 1, 0, 1,
-0.9262228, 0.3885125, -0.5981354, 0.8901961, 1, 0, 1,
-0.9183172, 1.257923, 0.7762994, 0.8823529, 1, 0, 1,
-0.9179608, -1.955982, -3.524308, 0.8784314, 1, 0, 1,
-0.9083351, 0.3934139, -1.809484, 0.8705882, 1, 0, 1,
-0.9077881, 1.083084, -2.394384, 0.8666667, 1, 0, 1,
-0.9035549, 1.758776, 1.016272, 0.8588235, 1, 0, 1,
-0.9008886, 0.5536736, -2.216583, 0.854902, 1, 0, 1,
-0.8971723, 0.3025984, -1.188841, 0.8470588, 1, 0, 1,
-0.8925341, 0.1516455, 0.2070307, 0.8431373, 1, 0, 1,
-0.8898284, 0.6602548, -1.812557, 0.8352941, 1, 0, 1,
-0.8892625, -0.05276005, 1.192481, 0.8313726, 1, 0, 1,
-0.8817687, -1.480829, -3.463697, 0.8235294, 1, 0, 1,
-0.8798976, 0.9018303, -2.796136, 0.8196079, 1, 0, 1,
-0.8783266, 0.6340079, -0.7686584, 0.8117647, 1, 0, 1,
-0.8755347, 2.250196, -0.2280265, 0.8078431, 1, 0, 1,
-0.8694896, 1.092024, 0.3951816, 0.8, 1, 0, 1,
-0.8680324, -0.2171275, -2.757867, 0.7921569, 1, 0, 1,
-0.8654341, 0.6805373, -2.098966, 0.7882353, 1, 0, 1,
-0.8644438, -0.290674, -3.680983, 0.7803922, 1, 0, 1,
-0.8639752, -1.079355, -2.057112, 0.7764706, 1, 0, 1,
-0.8615336, -1.548778, -2.410888, 0.7686275, 1, 0, 1,
-0.8612757, 1.117629, 1.322989, 0.7647059, 1, 0, 1,
-0.858006, -0.9146146, -2.462128, 0.7568628, 1, 0, 1,
-0.8530383, 0.7505417, -1.22421, 0.7529412, 1, 0, 1,
-0.8515357, -1.026626, -2.409396, 0.7450981, 1, 0, 1,
-0.8407441, -1.98445, -2.667106, 0.7411765, 1, 0, 1,
-0.8383731, 0.2317796, -2.067954, 0.7333333, 1, 0, 1,
-0.8353426, 0.2012027, -2.110017, 0.7294118, 1, 0, 1,
-0.8207608, 0.7878042, -0.8682472, 0.7215686, 1, 0, 1,
-0.818124, 0.5398961, -2.586238, 0.7176471, 1, 0, 1,
-0.8159308, 0.6113173, -1.761412, 0.7098039, 1, 0, 1,
-0.8086653, 0.7499444, 0.3167613, 0.7058824, 1, 0, 1,
-0.8057956, 0.2299929, -2.011205, 0.6980392, 1, 0, 1,
-0.8056698, -0.583909, -1.987417, 0.6901961, 1, 0, 1,
-0.8036444, 2.683009, -0.267397, 0.6862745, 1, 0, 1,
-0.7970091, 0.903367, -1.566873, 0.6784314, 1, 0, 1,
-0.7942618, -0.2181777, -0.9743332, 0.6745098, 1, 0, 1,
-0.7910071, 0.2523102, -0.4426937, 0.6666667, 1, 0, 1,
-0.7880915, 0.1375693, -0.31644, 0.6627451, 1, 0, 1,
-0.7860263, -0.6216325, -1.264539, 0.654902, 1, 0, 1,
-0.7803429, -0.2985929, -1.133958, 0.6509804, 1, 0, 1,
-0.7782496, -1.102446, -1.960798, 0.6431373, 1, 0, 1,
-0.7778315, 0.6576622, -1.933726, 0.6392157, 1, 0, 1,
-0.7734233, 0.4334779, -1.177048, 0.6313726, 1, 0, 1,
-0.7692927, 0.2155474, -1.542234, 0.627451, 1, 0, 1,
-0.7686494, 0.7860092, -0.3157517, 0.6196079, 1, 0, 1,
-0.7663489, -0.1096597, -1.817705, 0.6156863, 1, 0, 1,
-0.7637893, 0.7115605, 0.4017237, 0.6078432, 1, 0, 1,
-0.7602602, 0.2148043, -1.038038, 0.6039216, 1, 0, 1,
-0.7556539, 0.8449395, -0.5550483, 0.5960785, 1, 0, 1,
-0.7523071, -0.0279333, -0.8583555, 0.5882353, 1, 0, 1,
-0.7503957, -0.4093268, -1.962788, 0.5843138, 1, 0, 1,
-0.7487746, -0.6448548, -1.138227, 0.5764706, 1, 0, 1,
-0.7475286, -1.095858, -2.517323, 0.572549, 1, 0, 1,
-0.7436077, 0.04527465, -0.4429281, 0.5647059, 1, 0, 1,
-0.7420045, 0.4047951, -1.828795, 0.5607843, 1, 0, 1,
-0.7396709, -0.4982228, -2.245959, 0.5529412, 1, 0, 1,
-0.738027, -0.6027544, -2.233931, 0.5490196, 1, 0, 1,
-0.7368581, -0.9581042, -1.890345, 0.5411765, 1, 0, 1,
-0.7326063, 0.6657315, -1.127627, 0.5372549, 1, 0, 1,
-0.7250807, -2.877409, -1.238245, 0.5294118, 1, 0, 1,
-0.7143329, -0.5963563, -1.828835, 0.5254902, 1, 0, 1,
-0.7130225, 2.207676, -1.040266, 0.5176471, 1, 0, 1,
-0.7077233, 0.6750976, 0.01636419, 0.5137255, 1, 0, 1,
-0.7058672, -1.536714, -2.219481, 0.5058824, 1, 0, 1,
-0.7015955, 0.477733, -3.664757, 0.5019608, 1, 0, 1,
-0.6986036, 0.773926, -1.155209, 0.4941176, 1, 0, 1,
-0.6947879, 0.7390396, -0.5697013, 0.4862745, 1, 0, 1,
-0.6903434, 0.7217481, -2.391302, 0.4823529, 1, 0, 1,
-0.681145, 1.42892, 0.6875225, 0.4745098, 1, 0, 1,
-0.6793336, 2.341447, -0.2706361, 0.4705882, 1, 0, 1,
-0.6790028, 0.1123341, -2.086961, 0.4627451, 1, 0, 1,
-0.6747891, -1.082931, -2.950858, 0.4588235, 1, 0, 1,
-0.6738709, 0.2336466, 0.2972621, 0.4509804, 1, 0, 1,
-0.6730621, -0.1776493, -0.4621734, 0.4470588, 1, 0, 1,
-0.6680079, -0.06888939, -1.067357, 0.4392157, 1, 0, 1,
-0.6671792, 1.444006, 0.6044549, 0.4352941, 1, 0, 1,
-0.6667802, 0.2772985, -0.6414966, 0.427451, 1, 0, 1,
-0.6609488, -2.085901, -2.995916, 0.4235294, 1, 0, 1,
-0.6593784, -0.08207007, -0.2247298, 0.4156863, 1, 0, 1,
-0.6542364, -0.3675799, 0.2798517, 0.4117647, 1, 0, 1,
-0.6449659, 1.049187, -1.177351, 0.4039216, 1, 0, 1,
-0.6370873, -0.8218557, -2.825372, 0.3960784, 1, 0, 1,
-0.6335127, -1.355867, -2.731656, 0.3921569, 1, 0, 1,
-0.6331381, 1.075814, 0.6899788, 0.3843137, 1, 0, 1,
-0.6325077, -0.03781423, 0.3151853, 0.3803922, 1, 0, 1,
-0.6312775, -1.188868, -3.404898, 0.372549, 1, 0, 1,
-0.6273943, -0.04043453, -0.5573247, 0.3686275, 1, 0, 1,
-0.6272755, -0.9040369, -4.460425, 0.3607843, 1, 0, 1,
-0.6192498, 2.864722, 0.02166761, 0.3568628, 1, 0, 1,
-0.6181674, 0.8743386, 1.799511, 0.3490196, 1, 0, 1,
-0.6162562, -1.081459, -3.405069, 0.345098, 1, 0, 1,
-0.6111824, 0.8132334, -0.2819515, 0.3372549, 1, 0, 1,
-0.6091467, -0.5751661, -2.441951, 0.3333333, 1, 0, 1,
-0.6064118, 0.03704385, 0.1207629, 0.3254902, 1, 0, 1,
-0.6035764, 0.3696189, -1.941756, 0.3215686, 1, 0, 1,
-0.6024094, -0.8605117, -2.128707, 0.3137255, 1, 0, 1,
-0.6018996, 1.404777, -0.075455, 0.3098039, 1, 0, 1,
-0.6000831, 1.295983, -0.1025321, 0.3019608, 1, 0, 1,
-0.5997593, 1.649215, -1.732459, 0.2941177, 1, 0, 1,
-0.5916575, 0.757612, -2.95845, 0.2901961, 1, 0, 1,
-0.5903904, -0.5272123, -2.746595, 0.282353, 1, 0, 1,
-0.5902278, 0.9771611, -0.432765, 0.2784314, 1, 0, 1,
-0.5878839, 0.3693138, -0.5804768, 0.2705882, 1, 0, 1,
-0.5826289, 1.162609, 0.8302783, 0.2666667, 1, 0, 1,
-0.5791329, -1.635541, -2.098238, 0.2588235, 1, 0, 1,
-0.5785732, -1.707127, -3.521465, 0.254902, 1, 0, 1,
-0.5776237, -0.09035115, -1.729045, 0.2470588, 1, 0, 1,
-0.5775377, -2.280753, -4.411504, 0.2431373, 1, 0, 1,
-0.5763827, -1.314327, -2.364085, 0.2352941, 1, 0, 1,
-0.5702297, 0.1335455, -1.283754, 0.2313726, 1, 0, 1,
-0.5684116, 0.9213207, -1.873897, 0.2235294, 1, 0, 1,
-0.5682115, 1.557244, 0.06601787, 0.2196078, 1, 0, 1,
-0.5681098, -0.441094, -3.430913, 0.2117647, 1, 0, 1,
-0.5630538, -0.3150653, -3.129334, 0.2078431, 1, 0, 1,
-0.5587633, 0.8974305, -0.6784517, 0.2, 1, 0, 1,
-0.5583816, -0.9868479, -2.032834, 0.1921569, 1, 0, 1,
-0.5582968, 0.5882272, -0.09398352, 0.1882353, 1, 0, 1,
-0.5572397, -0.808749, -2.615844, 0.1803922, 1, 0, 1,
-0.5545374, 0.004596277, -3.014963, 0.1764706, 1, 0, 1,
-0.5504724, 0.4702045, -1.093102, 0.1686275, 1, 0, 1,
-0.548691, 1.633529, 0.396356, 0.1647059, 1, 0, 1,
-0.5421757, 0.7449239, 0.2779992, 0.1568628, 1, 0, 1,
-0.5419728, 0.306224, -2.326145, 0.1529412, 1, 0, 1,
-0.5412163, 0.9448028, -0.341194, 0.145098, 1, 0, 1,
-0.5388621, -1.373965, -4.491345, 0.1411765, 1, 0, 1,
-0.5285167, 0.3287742, -0.5715067, 0.1333333, 1, 0, 1,
-0.5259107, 1.297268, -1.848272, 0.1294118, 1, 0, 1,
-0.5235997, 1.093847, -0.1931505, 0.1215686, 1, 0, 1,
-0.5225351, 0.8619556, 0.9800404, 0.1176471, 1, 0, 1,
-0.5187575, -0.8866631, -1.25977, 0.1098039, 1, 0, 1,
-0.5174343, -1.034229, -0.552049, 0.1058824, 1, 0, 1,
-0.5147744, 0.4622159, -1.765283, 0.09803922, 1, 0, 1,
-0.5110874, 0.6871892, 0.2690919, 0.09019608, 1, 0, 1,
-0.5107821, 0.4445438, -0.2244662, 0.08627451, 1, 0, 1,
-0.5037786, -1.250121, -1.095079, 0.07843138, 1, 0, 1,
-0.5032558, -0.7251612, -2.658789, 0.07450981, 1, 0, 1,
-0.5014827, 0.7018434, -0.4499192, 0.06666667, 1, 0, 1,
-0.5010023, -0.7818972, -1.689644, 0.0627451, 1, 0, 1,
-0.4973638, -0.6687179, -2.609236, 0.05490196, 1, 0, 1,
-0.4918219, -0.1538149, -2.374718, 0.05098039, 1, 0, 1,
-0.4896096, 0.1159697, -1.151837, 0.04313726, 1, 0, 1,
-0.4887267, -0.7450692, -2.217307, 0.03921569, 1, 0, 1,
-0.4864918, -0.5125083, -1.554304, 0.03137255, 1, 0, 1,
-0.4758103, -1.390886, -4.148913, 0.02745098, 1, 0, 1,
-0.4747479, 0.7625459, 0.7879329, 0.01960784, 1, 0, 1,
-0.4706744, 1.078172, -1.234715, 0.01568628, 1, 0, 1,
-0.4692133, 0.8650864, -2.109608, 0.007843138, 1, 0, 1,
-0.4683605, -0.5574663, -2.25036, 0.003921569, 1, 0, 1,
-0.4679576, -0.237911, 0.4320071, 0, 1, 0.003921569, 1,
-0.4676791, -0.3637033, -2.180015, 0, 1, 0.01176471, 1,
-0.4670691, 1.448157, 0.3628099, 0, 1, 0.01568628, 1,
-0.4638872, 0.5338486, -2.293648, 0, 1, 0.02352941, 1,
-0.4610095, 0.2714877, -0.9407479, 0, 1, 0.02745098, 1,
-0.4607852, -0.9668734, -2.383711, 0, 1, 0.03529412, 1,
-0.4593007, 1.439763, 0.2432949, 0, 1, 0.03921569, 1,
-0.4530389, 0.2628073, -0.8732427, 0, 1, 0.04705882, 1,
-0.4525936, -0.1060665, -2.306166, 0, 1, 0.05098039, 1,
-0.4511434, 0.3302462, 0.1338238, 0, 1, 0.05882353, 1,
-0.4409459, -0.2323443, -2.919836, 0, 1, 0.0627451, 1,
-0.4319361, -0.9537705, -2.992851, 0, 1, 0.07058824, 1,
-0.4299798, -0.2765439, -3.810155, 0, 1, 0.07450981, 1,
-0.4253531, -0.9434501, -3.837055, 0, 1, 0.08235294, 1,
-0.4173588, -0.1749117, -0.7631574, 0, 1, 0.08627451, 1,
-0.4169655, 1.852868, 0.8308986, 0, 1, 0.09411765, 1,
-0.4163136, -0.939319, -3.548738, 0, 1, 0.1019608, 1,
-0.412317, 0.6377618, -0.5694727, 0, 1, 0.1058824, 1,
-0.4074545, 0.7669593, 1.65153, 0, 1, 0.1137255, 1,
-0.4033297, -1.431834, -2.700818, 0, 1, 0.1176471, 1,
-0.4029296, 1.074461, -0.5880139, 0, 1, 0.1254902, 1,
-0.4000678, 0.4288775, -1.992139, 0, 1, 0.1294118, 1,
-0.3989969, 1.507618, 1.103805, 0, 1, 0.1372549, 1,
-0.3984598, 0.6256632, 0.1238553, 0, 1, 0.1411765, 1,
-0.3958227, 0.766614, -2.21734, 0, 1, 0.1490196, 1,
-0.3953518, -0.4190293, -3.110492, 0, 1, 0.1529412, 1,
-0.3939031, -0.2264213, -2.998494, 0, 1, 0.1607843, 1,
-0.3934565, 1.493387, -0.2923318, 0, 1, 0.1647059, 1,
-0.3882716, -0.2368545, -1.54995, 0, 1, 0.172549, 1,
-0.3876739, 0.08095611, -2.185491, 0, 1, 0.1764706, 1,
-0.3874049, 0.4382741, 1.318678, 0, 1, 0.1843137, 1,
-0.3820563, -1.956754, -2.076528, 0, 1, 0.1882353, 1,
-0.3817123, -1.194242, -1.863064, 0, 1, 0.1960784, 1,
-0.3803189, 0.4383077, 0.009467038, 0, 1, 0.2039216, 1,
-0.37765, -0.6109363, -0.366087, 0, 1, 0.2078431, 1,
-0.3758848, -1.976553, -2.841537, 0, 1, 0.2156863, 1,
-0.3755088, 1.514515, -1.615734, 0, 1, 0.2196078, 1,
-0.3749863, -0.4471713, -1.528668, 0, 1, 0.227451, 1,
-0.3697725, -1.205043, -2.510199, 0, 1, 0.2313726, 1,
-0.3649753, 0.5916967, -1.757428, 0, 1, 0.2392157, 1,
-0.3598531, 0.6407164, -1.694315, 0, 1, 0.2431373, 1,
-0.3514464, -1.332104, -2.988683, 0, 1, 0.2509804, 1,
-0.3511202, -0.04860614, -0.6120285, 0, 1, 0.254902, 1,
-0.3495667, 0.05352233, -1.096902, 0, 1, 0.2627451, 1,
-0.3487886, 0.000246711, -2.327662, 0, 1, 0.2666667, 1,
-0.3447618, -0.09345182, -0.9582791, 0, 1, 0.2745098, 1,
-0.3427413, 1.231991, 0.1216581, 0, 1, 0.2784314, 1,
-0.3421785, -1.328365, -2.298931, 0, 1, 0.2862745, 1,
-0.3420691, -0.9093071, -3.29637, 0, 1, 0.2901961, 1,
-0.3386218, 1.474937, 0.05987771, 0, 1, 0.2980392, 1,
-0.3374474, 0.4405222, 0.08004846, 0, 1, 0.3058824, 1,
-0.3350421, -0.7167487, -1.975849, 0, 1, 0.3098039, 1,
-0.3349363, 0.5182468, -0.9001192, 0, 1, 0.3176471, 1,
-0.3349324, 0.1226061, -0.9023643, 0, 1, 0.3215686, 1,
-0.3281448, -0.8971218, -2.95483, 0, 1, 0.3294118, 1,
-0.3276634, 1.210306, -0.07676378, 0, 1, 0.3333333, 1,
-0.3272904, 0.5936268, -0.1098317, 0, 1, 0.3411765, 1,
-0.3251466, -0.6224921, -3.678094, 0, 1, 0.345098, 1,
-0.3244701, 0.1552828, -0.3404289, 0, 1, 0.3529412, 1,
-0.3231094, -1.894343, -4.624379, 0, 1, 0.3568628, 1,
-0.3220012, 0.864923, 1.284235, 0, 1, 0.3647059, 1,
-0.3177924, 1.409526, -0.3865078, 0, 1, 0.3686275, 1,
-0.3093758, 0.3212317, -1.042501, 0, 1, 0.3764706, 1,
-0.3045314, -0.4823381, -3.816671, 0, 1, 0.3803922, 1,
-0.2960147, 1.02429, -0.7984513, 0, 1, 0.3882353, 1,
-0.2948857, 1.221883, -0.5511385, 0, 1, 0.3921569, 1,
-0.2899057, -0.08492708, -1.264544, 0, 1, 0.4, 1,
-0.2849953, -1.95002, -2.238201, 0, 1, 0.4078431, 1,
-0.2848948, -0.3371944, -2.941885, 0, 1, 0.4117647, 1,
-0.2824171, 0.3121528, -1.363628, 0, 1, 0.4196078, 1,
-0.2767057, 0.09326847, -1.978933, 0, 1, 0.4235294, 1,
-0.2751988, 0.4647025, 0.1505652, 0, 1, 0.4313726, 1,
-0.2721365, -0.5009302, -4.594761, 0, 1, 0.4352941, 1,
-0.2720482, 0.3130613, -1.520152, 0, 1, 0.4431373, 1,
-0.2686757, 0.6817921, -0.7476243, 0, 1, 0.4470588, 1,
-0.2620924, 0.8249571, 0.7867257, 0, 1, 0.454902, 1,
-0.2589072, -1.059003, -4.944706, 0, 1, 0.4588235, 1,
-0.2581248, 0.5735604, -1.73914, 0, 1, 0.4666667, 1,
-0.257575, 0.2228734, -0.9744576, 0, 1, 0.4705882, 1,
-0.255969, 0.9911787, -0.8314951, 0, 1, 0.4784314, 1,
-0.2523022, -1.271407, -1.743036, 0, 1, 0.4823529, 1,
-0.2478387, 0.6869798, -0.2275633, 0, 1, 0.4901961, 1,
-0.2470826, 1.15507, -0.384368, 0, 1, 0.4941176, 1,
-0.245736, -1.138063, -3.996548, 0, 1, 0.5019608, 1,
-0.2411644, 0.7551357, -1.077399, 0, 1, 0.509804, 1,
-0.2397374, 0.3360875, -1.130927, 0, 1, 0.5137255, 1,
-0.2389528, 0.6934478, -2.92451, 0, 1, 0.5215687, 1,
-0.2382585, -0.176276, -3.094007, 0, 1, 0.5254902, 1,
-0.2355191, -0.3951657, -2.452242, 0, 1, 0.5333334, 1,
-0.2332057, 0.8847371, -0.4858443, 0, 1, 0.5372549, 1,
-0.2318115, 0.3499025, 0.6940777, 0, 1, 0.5450981, 1,
-0.2305783, -0.1594036, -2.145171, 0, 1, 0.5490196, 1,
-0.2292813, 0.8290315, 1.031894, 0, 1, 0.5568628, 1,
-0.2292203, -1.359689, -1.622999, 0, 1, 0.5607843, 1,
-0.2285453, -1.769551, -2.524103, 0, 1, 0.5686275, 1,
-0.2274846, -0.356185, -1.720331, 0, 1, 0.572549, 1,
-0.2199896, 1.210126, -0.2135005, 0, 1, 0.5803922, 1,
-0.2194411, 0.2014883, -0.6085489, 0, 1, 0.5843138, 1,
-0.2134822, 0.3565294, -2.022252, 0, 1, 0.5921569, 1,
-0.2134222, 1.223441, -1.011044, 0, 1, 0.5960785, 1,
-0.2102504, -0.8315104, -2.911338, 0, 1, 0.6039216, 1,
-0.2087442, 1.054289, 1.188379, 0, 1, 0.6117647, 1,
-0.1960962, -1.82513, -3.23207, 0, 1, 0.6156863, 1,
-0.1928044, 0.2950698, 0.2616856, 0, 1, 0.6235294, 1,
-0.1822228, -2.041641, -4.379941, 0, 1, 0.627451, 1,
-0.1813198, 0.5039803, -1.858468, 0, 1, 0.6352941, 1,
-0.1769164, -0.3090142, -3.829125, 0, 1, 0.6392157, 1,
-0.1762181, -0.7217579, -3.398535, 0, 1, 0.6470588, 1,
-0.1682896, 0.1280224, -1.220583, 0, 1, 0.6509804, 1,
-0.165784, -0.3197857, -1.841893, 0, 1, 0.6588235, 1,
-0.1652237, -0.5978467, -1.614549, 0, 1, 0.6627451, 1,
-0.1596636, -1.075092, -2.621887, 0, 1, 0.6705883, 1,
-0.1581567, -1.331704, -3.874077, 0, 1, 0.6745098, 1,
-0.1570909, -0.8691973, -2.5709, 0, 1, 0.682353, 1,
-0.1570784, -1.070959, -2.455799, 0, 1, 0.6862745, 1,
-0.1544341, 0.3339529, -0.8649845, 0, 1, 0.6941177, 1,
-0.1541258, -0.5180869, -2.027374, 0, 1, 0.7019608, 1,
-0.1538059, 0.5196512, 0.7266105, 0, 1, 0.7058824, 1,
-0.1516153, -1.535114, -1.96209, 0, 1, 0.7137255, 1,
-0.1514949, 0.3857314, -0.06410789, 0, 1, 0.7176471, 1,
-0.1509828, -0.1853059, -0.7775292, 0, 1, 0.7254902, 1,
-0.1486916, -0.2358813, -3.064238, 0, 1, 0.7294118, 1,
-0.1475869, 0.3059105, 0.3387405, 0, 1, 0.7372549, 1,
-0.1396147, 0.1935386, -0.07979214, 0, 1, 0.7411765, 1,
-0.1394172, -0.1533969, -1.892024, 0, 1, 0.7490196, 1,
-0.1382467, -0.8436053, -2.361617, 0, 1, 0.7529412, 1,
-0.1380172, 0.4776263, 0.9460942, 0, 1, 0.7607843, 1,
-0.1360039, -0.4706576, -3.14085, 0, 1, 0.7647059, 1,
-0.1308821, 1.172202, -0.4760618, 0, 1, 0.772549, 1,
-0.1301341, 0.6492664, -0.51946, 0, 1, 0.7764706, 1,
-0.1290838, 0.5120673, -0.9903697, 0, 1, 0.7843137, 1,
-0.1289673, -0.08560053, -2.502152, 0, 1, 0.7882353, 1,
-0.1280301, 0.4172827, 0.003951367, 0, 1, 0.7960784, 1,
-0.1271422, -0.06508718, -2.580655, 0, 1, 0.8039216, 1,
-0.123339, -0.2983579, -1.529377, 0, 1, 0.8078431, 1,
-0.1230277, 1.196068, -0.1072394, 0, 1, 0.8156863, 1,
-0.117605, 1.399163, -2.123508, 0, 1, 0.8196079, 1,
-0.1163573, -0.1699178, -3.481949, 0, 1, 0.827451, 1,
-0.1159889, -1.626906, -2.872092, 0, 1, 0.8313726, 1,
-0.1154746, 0.8229463, -0.09443187, 0, 1, 0.8392157, 1,
-0.1128481, 0.1009988, -0.3306802, 0, 1, 0.8431373, 1,
-0.1117735, 1.153398, -0.8649819, 0, 1, 0.8509804, 1,
-0.1116618, -0.9355797, -3.806291, 0, 1, 0.854902, 1,
-0.1112211, -0.07531202, -0.422522, 0, 1, 0.8627451, 1,
-0.1104475, 1.325568, 1.015697, 0, 1, 0.8666667, 1,
-0.1101613, 0.1016837, 0.2634346, 0, 1, 0.8745098, 1,
-0.1068157, 0.1357664, 0.7984171, 0, 1, 0.8784314, 1,
-0.1047421, 1.88426, -0.3210237, 0, 1, 0.8862745, 1,
-0.1038825, -0.5355039, -2.254578, 0, 1, 0.8901961, 1,
-0.1032455, 1.111635, 0.5106538, 0, 1, 0.8980392, 1,
-0.1003672, 0.3692017, 0.005369534, 0, 1, 0.9058824, 1,
-0.100121, -1.221168, -2.269495, 0, 1, 0.9098039, 1,
-0.09520818, 0.6526302, 0.5590359, 0, 1, 0.9176471, 1,
-0.09209959, 0.5990844, 1.8176, 0, 1, 0.9215686, 1,
-0.08643428, 0.3132457, -0.4928476, 0, 1, 0.9294118, 1,
-0.08404782, 0.5768479, 0.1802927, 0, 1, 0.9333333, 1,
-0.08232061, -0.9732648, -2.831162, 0, 1, 0.9411765, 1,
-0.08004441, 0.9069069, 1.315392, 0, 1, 0.945098, 1,
-0.07950355, 0.4154857, 0.8704281, 0, 1, 0.9529412, 1,
-0.07809406, 1.001848, -0.04761374, 0, 1, 0.9568627, 1,
-0.07314421, 0.6630159, 0.9394694, 0, 1, 0.9647059, 1,
-0.07032055, -0.7754785, -2.911733, 0, 1, 0.9686275, 1,
-0.07014882, -0.7353415, -2.394272, 0, 1, 0.9764706, 1,
-0.06911997, -0.3237098, -3.595045, 0, 1, 0.9803922, 1,
-0.06727754, 1.524246, 0.3611227, 0, 1, 0.9882353, 1,
-0.06631394, 1.454742, 0.8326276, 0, 1, 0.9921569, 1,
-0.06201655, 0.6177628, -1.443137, 0, 1, 1, 1,
-0.0615017, 0.5786688, 1.624237, 0, 0.9921569, 1, 1,
-0.0611868, 1.500842, 0.8318803, 0, 0.9882353, 1, 1,
-0.06050788, -1.401986, -3.785467, 0, 0.9803922, 1, 1,
-0.06017463, 1.042781, 1.23038, 0, 0.9764706, 1, 1,
-0.05399708, 2.052521, -1.815652, 0, 0.9686275, 1, 1,
-0.05248377, -0.4134834, -3.900526, 0, 0.9647059, 1, 1,
-0.04839066, -0.08777, -3.083378, 0, 0.9568627, 1, 1,
-0.04475759, 0.9221048, -0.331388, 0, 0.9529412, 1, 1,
-0.03810216, -0.2737049, -2.965153, 0, 0.945098, 1, 1,
-0.03752477, -0.1665587, -4.152886, 0, 0.9411765, 1, 1,
-0.03600946, 0.1884705, -0.5470752, 0, 0.9333333, 1, 1,
-0.03599305, -0.6887466, -3.745901, 0, 0.9294118, 1, 1,
-0.0304783, -0.8801295, -4.482997, 0, 0.9215686, 1, 1,
-0.0298619, 1.312087, 0.1245134, 0, 0.9176471, 1, 1,
-0.02363932, 0.8678057, -0.3957004, 0, 0.9098039, 1, 1,
-0.01775057, -0.6011863, -1.547638, 0, 0.9058824, 1, 1,
-0.01762583, 1.772039, 0.9420303, 0, 0.8980392, 1, 1,
-0.01259749, -0.5831247, -3.428342, 0, 0.8901961, 1, 1,
-0.01212762, 1.118735, -1.848086, 0, 0.8862745, 1, 1,
-0.009216707, 0.6943284, -0.6667238, 0, 0.8784314, 1, 1,
-0.005892931, 0.6735372, 1.575336, 0, 0.8745098, 1, 1,
-0.004326221, 0.9266404, -0.9578273, 0, 0.8666667, 1, 1,
0.0008981396, 1.330587, -0.5542523, 0, 0.8627451, 1, 1,
0.001054132, 1.242822, 0.3629562, 0, 0.854902, 1, 1,
0.003469129, -0.6727359, 2.905975, 0, 0.8509804, 1, 1,
0.005451336, 2.115597, -0.1941636, 0, 0.8431373, 1, 1,
0.008732573, 0.6096869, -0.3872897, 0, 0.8392157, 1, 1,
0.009531389, -0.9534835, 1.347279, 0, 0.8313726, 1, 1,
0.01153102, -0.4348577, 3.327743, 0, 0.827451, 1, 1,
0.01241398, -0.288564, 4.003134, 0, 0.8196079, 1, 1,
0.02573599, 1.259281, 0.6707717, 0, 0.8156863, 1, 1,
0.02681513, 1.023263, 0.4862821, 0, 0.8078431, 1, 1,
0.02833588, 1.142802, 0.2186368, 0, 0.8039216, 1, 1,
0.02852619, 0.6688659, 0.137029, 0, 0.7960784, 1, 1,
0.03204613, -1.422328, 3.993637, 0, 0.7882353, 1, 1,
0.03344383, -0.9434998, 3.210742, 0, 0.7843137, 1, 1,
0.0370228, 1.018359, 0.4039637, 0, 0.7764706, 1, 1,
0.03815189, -1.314894, 3.157059, 0, 0.772549, 1, 1,
0.03864122, 0.4328932, 0.9345132, 0, 0.7647059, 1, 1,
0.03941463, -1.162693, 4.854613, 0, 0.7607843, 1, 1,
0.04271613, 2.462938, 1.8983, 0, 0.7529412, 1, 1,
0.04556895, -0.4710947, 4.252344, 0, 0.7490196, 1, 1,
0.04603045, -1.694204, 3.612919, 0, 0.7411765, 1, 1,
0.05788497, 0.1975956, 2.0398, 0, 0.7372549, 1, 1,
0.05845206, -0.8674622, 3.394866, 0, 0.7294118, 1, 1,
0.06123999, 0.3914259, -0.9767686, 0, 0.7254902, 1, 1,
0.07073722, 0.6442352, 1.179609, 0, 0.7176471, 1, 1,
0.07846696, 1.771577, -2.423973, 0, 0.7137255, 1, 1,
0.08170386, -1.099422, 4.551398, 0, 0.7058824, 1, 1,
0.08250186, 1.499459, 0.405877, 0, 0.6980392, 1, 1,
0.08276215, 0.5450348, -0.207185, 0, 0.6941177, 1, 1,
0.08344766, -0.1005052, 1.614831, 0, 0.6862745, 1, 1,
0.08426979, -0.7071531, 2.953776, 0, 0.682353, 1, 1,
0.08484998, 0.1782773, 0.7800037, 0, 0.6745098, 1, 1,
0.08606236, 1.011367, 0.8604701, 0, 0.6705883, 1, 1,
0.08928274, -0.7691491, 2.798553, 0, 0.6627451, 1, 1,
0.09039923, -0.2815094, 3.529443, 0, 0.6588235, 1, 1,
0.09161008, 1.659475, -0.5318064, 0, 0.6509804, 1, 1,
0.09192892, 0.8432276, 0.4811968, 0, 0.6470588, 1, 1,
0.09198342, -0.6158933, -0.1533419, 0, 0.6392157, 1, 1,
0.09334037, 0.2181015, -0.1836004, 0, 0.6352941, 1, 1,
0.09382173, 0.6759032, 1.60012, 0, 0.627451, 1, 1,
0.09573268, 1.67432, 0.5905482, 0, 0.6235294, 1, 1,
0.09684414, 0.8767005, 0.5209913, 0, 0.6156863, 1, 1,
0.1009144, -1.453305, 2.36451, 0, 0.6117647, 1, 1,
0.1049144, -1.644574, 3.893696, 0, 0.6039216, 1, 1,
0.1050678, -0.266067, 2.991806, 0, 0.5960785, 1, 1,
0.1091423, -0.3550528, 2.975594, 0, 0.5921569, 1, 1,
0.1123106, 0.6036037, -0.7794676, 0, 0.5843138, 1, 1,
0.1193175, -0.3738145, 3.223421, 0, 0.5803922, 1, 1,
0.1193872, -1.452476, 2.783866, 0, 0.572549, 1, 1,
0.1265128, 0.1407792, 1.575103, 0, 0.5686275, 1, 1,
0.1266113, -1.969746, 2.722942, 0, 0.5607843, 1, 1,
0.1268012, -0.5408776, 3.516851, 0, 0.5568628, 1, 1,
0.1280305, -0.8549676, 2.763444, 0, 0.5490196, 1, 1,
0.1284105, 1.333047, 0.1984852, 0, 0.5450981, 1, 1,
0.1340447, -0.9310338, 4.084542, 0, 0.5372549, 1, 1,
0.144608, -0.04327153, 2.151218, 0, 0.5333334, 1, 1,
0.1465538, 0.3994722, 1.323812, 0, 0.5254902, 1, 1,
0.1485714, 0.1182742, 0.6494903, 0, 0.5215687, 1, 1,
0.1546521, 0.2779386, -0.05568551, 0, 0.5137255, 1, 1,
0.1577995, -1.82031, 2.539695, 0, 0.509804, 1, 1,
0.1600823, -1.063884, 3.499723, 0, 0.5019608, 1, 1,
0.1610019, -2.240072, 4.190855, 0, 0.4941176, 1, 1,
0.1658715, 0.1031464, 1.570805, 0, 0.4901961, 1, 1,
0.1663375, 0.6295726, -0.8880413, 0, 0.4823529, 1, 1,
0.1667937, 1.069039, 0.5703093, 0, 0.4784314, 1, 1,
0.1722761, -1.209136, 2.393904, 0, 0.4705882, 1, 1,
0.1794323, 0.0884321, 1.125848, 0, 0.4666667, 1, 1,
0.1828924, 1.535204, -0.02628939, 0, 0.4588235, 1, 1,
0.1843165, -1.452053, 3.200341, 0, 0.454902, 1, 1,
0.1853589, -1.232709, 3.252424, 0, 0.4470588, 1, 1,
0.1856751, -0.4800607, 2.529684, 0, 0.4431373, 1, 1,
0.1873255, 0.6363594, 1.282311, 0, 0.4352941, 1, 1,
0.1924713, -0.361153, 3.259066, 0, 0.4313726, 1, 1,
0.1977952, 0.2891731, 1.490874, 0, 0.4235294, 1, 1,
0.20016, 0.434554, 0.8947465, 0, 0.4196078, 1, 1,
0.205516, -1.86196, 2.258775, 0, 0.4117647, 1, 1,
0.2055313, -0.5434592, 2.540241, 0, 0.4078431, 1, 1,
0.2171747, 0.7313549, 1.653697, 0, 0.4, 1, 1,
0.2231563, -0.7332813, 2.19206, 0, 0.3921569, 1, 1,
0.2232389, 0.5016716, 0.3142353, 0, 0.3882353, 1, 1,
0.2241895, -1.289095, 3.04991, 0, 0.3803922, 1, 1,
0.2296455, -0.6368708, 1.343031, 0, 0.3764706, 1, 1,
0.2301383, 0.4531353, 0.8210104, 0, 0.3686275, 1, 1,
0.2362103, 0.9675186, 1.072153, 0, 0.3647059, 1, 1,
0.2368452, -0.6636146, 2.955814, 0, 0.3568628, 1, 1,
0.240446, 2.094208, 0.04787629, 0, 0.3529412, 1, 1,
0.2485971, -0.3343969, 3.779703, 0, 0.345098, 1, 1,
0.2489467, 0.04377284, -0.2465535, 0, 0.3411765, 1, 1,
0.2525069, -1.367863, 3.189395, 0, 0.3333333, 1, 1,
0.2585334, 1.090422, -0.8852916, 0, 0.3294118, 1, 1,
0.2599817, 1.099247, -0.4095099, 0, 0.3215686, 1, 1,
0.2635797, 1.391734, 0.07123334, 0, 0.3176471, 1, 1,
0.2638239, -1.259864, 3.75734, 0, 0.3098039, 1, 1,
0.2723048, 0.2922516, -0.1572586, 0, 0.3058824, 1, 1,
0.2735514, 1.112252, -0.1491903, 0, 0.2980392, 1, 1,
0.278042, 1.054835, 1.644551, 0, 0.2901961, 1, 1,
0.2836708, 0.9746532, 1.438734, 0, 0.2862745, 1, 1,
0.2837739, -0.6730196, 1.590786, 0, 0.2784314, 1, 1,
0.2895817, -1.911968, 4.35359, 0, 0.2745098, 1, 1,
0.290638, 1.209619, -0.1038231, 0, 0.2666667, 1, 1,
0.2949314, 0.8720059, 0.2396294, 0, 0.2627451, 1, 1,
0.296242, -0.1005825, 1.591331, 0, 0.254902, 1, 1,
0.2972172, -0.4505859, 3.057172, 0, 0.2509804, 1, 1,
0.298375, -0.0908889, 0.1753289, 0, 0.2431373, 1, 1,
0.2994265, 0.9206155, 1.070267, 0, 0.2392157, 1, 1,
0.3003794, 1.803227, -0.9150904, 0, 0.2313726, 1, 1,
0.3080177, 1.404682, -0.6575375, 0, 0.227451, 1, 1,
0.3104628, -0.2244242, 0.3581794, 0, 0.2196078, 1, 1,
0.3115177, -0.3213598, 2.534879, 0, 0.2156863, 1, 1,
0.3139879, -2.302267, 4.697763, 0, 0.2078431, 1, 1,
0.3140078, 0.9681228, 1.544852, 0, 0.2039216, 1, 1,
0.314947, -0.3578449, 3.056595, 0, 0.1960784, 1, 1,
0.3162982, -0.2901185, 1.578805, 0, 0.1882353, 1, 1,
0.3191676, 0.9593512, 0.9759012, 0, 0.1843137, 1, 1,
0.3213205, -0.4179179, 2.034458, 0, 0.1764706, 1, 1,
0.3235475, -0.4791468, 3.43875, 0, 0.172549, 1, 1,
0.3257735, -0.4467959, 1.963033, 0, 0.1647059, 1, 1,
0.3303692, 0.07956634, 2.204314, 0, 0.1607843, 1, 1,
0.3322678, 1.170158, -0.1071432, 0, 0.1529412, 1, 1,
0.33714, -1.14186, 3.006978, 0, 0.1490196, 1, 1,
0.3434338, -0.9267052, 2.855892, 0, 0.1411765, 1, 1,
0.3490169, 0.09269243, 1.011577, 0, 0.1372549, 1, 1,
0.3527245, -2.126021, 2.41322, 0, 0.1294118, 1, 1,
0.3587289, 0.3909854, 1.084736, 0, 0.1254902, 1, 1,
0.3598287, 0.05262028, 2.307849, 0, 0.1176471, 1, 1,
0.3618924, 0.336749, -0.08257926, 0, 0.1137255, 1, 1,
0.3629059, -0.4624055, 1.337083, 0, 0.1058824, 1, 1,
0.363095, -1.73284, 3.564318, 0, 0.09803922, 1, 1,
0.3652057, -0.608498, 2.698597, 0, 0.09411765, 1, 1,
0.3655352, 0.7792313, -0.06214561, 0, 0.08627451, 1, 1,
0.3662647, -0.7140695, 2.934847, 0, 0.08235294, 1, 1,
0.3677563, 0.2803821, 1.755555, 0, 0.07450981, 1, 1,
0.3692309, 2.033873, 0.8654149, 0, 0.07058824, 1, 1,
0.3703486, 0.265301, 0.6823909, 0, 0.0627451, 1, 1,
0.3710616, -0.4359626, 3.427469, 0, 0.05882353, 1, 1,
0.3732972, 0.8073172, 0.7858065, 0, 0.05098039, 1, 1,
0.3740629, 1.228764, 1.457475, 0, 0.04705882, 1, 1,
0.3746194, 0.06261302, 2.363597, 0, 0.03921569, 1, 1,
0.3824019, 0.4927957, -0.6414844, 0, 0.03529412, 1, 1,
0.3829685, -0.9319372, 2.44587, 0, 0.02745098, 1, 1,
0.3834358, 0.07619276, 3.438658, 0, 0.02352941, 1, 1,
0.3856473, -1.534058, 2.463486, 0, 0.01568628, 1, 1,
0.3875028, -1.087429, 2.358256, 0, 0.01176471, 1, 1,
0.3875377, 0.92558, 0.883675, 0, 0.003921569, 1, 1,
0.3897842, 1.184904, 0.4378495, 0.003921569, 0, 1, 1,
0.3932266, -0.3720571, 3.253013, 0.007843138, 0, 1, 1,
0.3936873, 0.07173876, 1.338438, 0.01568628, 0, 1, 1,
0.3946205, -0.666005, 3.234878, 0.01960784, 0, 1, 1,
0.4002168, -0.6598781, 2.101554, 0.02745098, 0, 1, 1,
0.4065554, 1.153942, -0.1307251, 0.03137255, 0, 1, 1,
0.407185, 0.2442982, 1.93765, 0.03921569, 0, 1, 1,
0.4084963, -0.04592401, 2.594195, 0.04313726, 0, 1, 1,
0.4095329, -1.293263, 2.423199, 0.05098039, 0, 1, 1,
0.4140687, -0.4853067, 3.1972, 0.05490196, 0, 1, 1,
0.4145761, 0.5186962, 0.4621464, 0.0627451, 0, 1, 1,
0.4204706, -0.8516866, 2.9768, 0.06666667, 0, 1, 1,
0.4227514, 1.088051, 1.18435, 0.07450981, 0, 1, 1,
0.4230428, 0.04977819, 1.98428, 0.07843138, 0, 1, 1,
0.4259797, -0.8240696, 3.214768, 0.08627451, 0, 1, 1,
0.4264386, -2.090181, 2.952765, 0.09019608, 0, 1, 1,
0.4296193, -1.021262, 2.646934, 0.09803922, 0, 1, 1,
0.4312647, 0.9664351, 0.9614335, 0.1058824, 0, 1, 1,
0.4353402, 0.4003119, 2.069953, 0.1098039, 0, 1, 1,
0.4416625, 0.7658041, 0.2282414, 0.1176471, 0, 1, 1,
0.4450311, 0.7735036, 0.2022613, 0.1215686, 0, 1, 1,
0.4492403, 0.7038035, 0.7063733, 0.1294118, 0, 1, 1,
0.4509539, 1.919709, -0.3389133, 0.1333333, 0, 1, 1,
0.4515626, 0.02002465, 2.545418, 0.1411765, 0, 1, 1,
0.4520499, -0.6984653, 2.28425, 0.145098, 0, 1, 1,
0.4545981, -0.538255, 3.395516, 0.1529412, 0, 1, 1,
0.4549955, -0.707318, 2.494943, 0.1568628, 0, 1, 1,
0.4601165, -0.05026697, 1.228875, 0.1647059, 0, 1, 1,
0.4613163, 0.1356138, 2.5697, 0.1686275, 0, 1, 1,
0.4629627, -1.934355, 3.070541, 0.1764706, 0, 1, 1,
0.4670938, -0.2677294, 1.617843, 0.1803922, 0, 1, 1,
0.4730732, 1.130541, 0.1513051, 0.1882353, 0, 1, 1,
0.4763592, -0.8490346, 4.130272, 0.1921569, 0, 1, 1,
0.478437, -0.6508281, 1.436928, 0.2, 0, 1, 1,
0.4790779, -1.534748, 2.463943, 0.2078431, 0, 1, 1,
0.4927915, 0.8325919, 0.6145868, 0.2117647, 0, 1, 1,
0.4980776, -1.130995, 1.918144, 0.2196078, 0, 1, 1,
0.5019792, -0.3670181, 1.546497, 0.2235294, 0, 1, 1,
0.5021284, -0.3592591, 2.314444, 0.2313726, 0, 1, 1,
0.505453, 0.6096807, 0.4627389, 0.2352941, 0, 1, 1,
0.5067675, 1.721917, 0.04626684, 0.2431373, 0, 1, 1,
0.5079691, 1.234351, -1.256018, 0.2470588, 0, 1, 1,
0.5126106, -0.7802626, 2.303174, 0.254902, 0, 1, 1,
0.5126376, -0.64982, 2.535765, 0.2588235, 0, 1, 1,
0.5150271, 0.5537303, 1.860356, 0.2666667, 0, 1, 1,
0.5170721, 0.5952129, -0.741365, 0.2705882, 0, 1, 1,
0.5182229, -0.7334716, 2.537346, 0.2784314, 0, 1, 1,
0.5223, -0.5249261, 2.682478, 0.282353, 0, 1, 1,
0.5227112, 0.1791003, 0.2800328, 0.2901961, 0, 1, 1,
0.5269077, 0.7107456, 0.5602993, 0.2941177, 0, 1, 1,
0.5294084, -0.3887801, 1.091989, 0.3019608, 0, 1, 1,
0.5321552, 0.9043041, 0.3078298, 0.3098039, 0, 1, 1,
0.540207, -0.1878924, 1.441866, 0.3137255, 0, 1, 1,
0.5403503, -1.734644, 0.9946536, 0.3215686, 0, 1, 1,
0.5417237, -0.1110677, 3.582708, 0.3254902, 0, 1, 1,
0.5492064, 0.9567623, 0.7722445, 0.3333333, 0, 1, 1,
0.5559114, 2.506765, -0.006100928, 0.3372549, 0, 1, 1,
0.5610928, 0.0417567, 1.806576, 0.345098, 0, 1, 1,
0.563241, 1.374503, -1.245001, 0.3490196, 0, 1, 1,
0.5682458, 1.268454, 0.7158422, 0.3568628, 0, 1, 1,
0.5705297, -2.534124, 2.744152, 0.3607843, 0, 1, 1,
0.5763683, 0.1837967, 0.6417248, 0.3686275, 0, 1, 1,
0.5765184, 1.089162, -0.03787253, 0.372549, 0, 1, 1,
0.5769605, -0.4161079, 0.7443723, 0.3803922, 0, 1, 1,
0.5779759, 2.370078, 0.7975965, 0.3843137, 0, 1, 1,
0.5796216, -1.320786, 3.066423, 0.3921569, 0, 1, 1,
0.5801522, -0.4308869, 2.967407, 0.3960784, 0, 1, 1,
0.5856903, 0.002111434, 3.893832, 0.4039216, 0, 1, 1,
0.5917761, 0.7418879, 0.7907256, 0.4117647, 0, 1, 1,
0.593782, 1.346562, 1.860235, 0.4156863, 0, 1, 1,
0.6151342, 0.01034697, 2.344933, 0.4235294, 0, 1, 1,
0.6199539, -1.42022, 3.750882, 0.427451, 0, 1, 1,
0.6208173, 0.3707186, -0.1149904, 0.4352941, 0, 1, 1,
0.6228743, 0.3051715, -0.1834678, 0.4392157, 0, 1, 1,
0.6305124, 0.9059645, -0.5903777, 0.4470588, 0, 1, 1,
0.6305889, 1.367951, 1.078249, 0.4509804, 0, 1, 1,
0.6354718, -0.1529738, 2.448324, 0.4588235, 0, 1, 1,
0.6357909, -0.08701415, 1.387522, 0.4627451, 0, 1, 1,
0.6363121, -0.3072256, 1.891941, 0.4705882, 0, 1, 1,
0.6364896, 1.208484, -0.6542722, 0.4745098, 0, 1, 1,
0.640328, -0.2912199, 3.243983, 0.4823529, 0, 1, 1,
0.6426081, 0.6597924, 2.119925, 0.4862745, 0, 1, 1,
0.6440282, -1.03039, 3.915023, 0.4941176, 0, 1, 1,
0.6473173, -0.2490298, 1.036785, 0.5019608, 0, 1, 1,
0.6528716, 1.050746, 0.2780741, 0.5058824, 0, 1, 1,
0.661237, 0.2398792, -0.4759718, 0.5137255, 0, 1, 1,
0.6616449, -0.1827994, 0.1484163, 0.5176471, 0, 1, 1,
0.665594, 0.6813559, 0.6809545, 0.5254902, 0, 1, 1,
0.6684348, 0.169516, -0.03441169, 0.5294118, 0, 1, 1,
0.6755053, 1.689258, -0.2371325, 0.5372549, 0, 1, 1,
0.6758276, -0.3504632, 1.511693, 0.5411765, 0, 1, 1,
0.6807362, 0.2357283, 0.7624727, 0.5490196, 0, 1, 1,
0.6827597, 0.009098098, 0.9811755, 0.5529412, 0, 1, 1,
0.6880456, 0.3583936, 1.228194, 0.5607843, 0, 1, 1,
0.6948671, 0.7151581, 0.001355215, 0.5647059, 0, 1, 1,
0.6992302, 0.1922792, 1.028507, 0.572549, 0, 1, 1,
0.7032627, -0.6003494, 2.199124, 0.5764706, 0, 1, 1,
0.7048272, -0.08491322, 2.77162, 0.5843138, 0, 1, 1,
0.7092231, 0.03451662, 1.519924, 0.5882353, 0, 1, 1,
0.7109626, -0.04580034, 1.588261, 0.5960785, 0, 1, 1,
0.7146261, 1.074113, 1.516542, 0.6039216, 0, 1, 1,
0.7201892, -0.1113203, 2.87333, 0.6078432, 0, 1, 1,
0.7223729, 0.3480873, 0.63134, 0.6156863, 0, 1, 1,
0.7254034, -1.596446, 1.157483, 0.6196079, 0, 1, 1,
0.7298534, -0.2221577, 3.355473, 0.627451, 0, 1, 1,
0.7394134, -1.763417, 2.110943, 0.6313726, 0, 1, 1,
0.7398393, -0.891774, 1.25262, 0.6392157, 0, 1, 1,
0.7600889, -0.6778035, 1.536512, 0.6431373, 0, 1, 1,
0.760576, 2.067676, 1.487237, 0.6509804, 0, 1, 1,
0.7647312, 1.860242, 2.081011, 0.654902, 0, 1, 1,
0.7653834, -0.3721085, 1.83886, 0.6627451, 0, 1, 1,
0.7680553, -0.5358511, 3.222188, 0.6666667, 0, 1, 1,
0.7707604, -1.174682, 1.549844, 0.6745098, 0, 1, 1,
0.7734239, 0.6749771, -0.2580763, 0.6784314, 0, 1, 1,
0.7741697, -0.9342902, 3.436555, 0.6862745, 0, 1, 1,
0.7764504, -0.07882781, 1.661824, 0.6901961, 0, 1, 1,
0.7811686, -1.021761, 1.642202, 0.6980392, 0, 1, 1,
0.7900216, -0.1016696, 2.771509, 0.7058824, 0, 1, 1,
0.7912033, 0.1088133, -0.8690746, 0.7098039, 0, 1, 1,
0.7922013, 0.2117162, 1.868485, 0.7176471, 0, 1, 1,
0.7936984, 0.4483597, 0.635298, 0.7215686, 0, 1, 1,
0.7990639, 1.009645, 0.1722155, 0.7294118, 0, 1, 1,
0.8026222, 0.5791411, 1.877758, 0.7333333, 0, 1, 1,
0.8055332, 0.5686672, 2.046323, 0.7411765, 0, 1, 1,
0.8110736, -1.179762, 1.35758, 0.7450981, 0, 1, 1,
0.8133401, -0.8338323, 2.485973, 0.7529412, 0, 1, 1,
0.813855, 0.8818479, 0.6205834, 0.7568628, 0, 1, 1,
0.8241786, -0.6973779, 3.007516, 0.7647059, 0, 1, 1,
0.8316261, 0.1157052, 0.4611772, 0.7686275, 0, 1, 1,
0.8325596, -1.39168, 3.614855, 0.7764706, 0, 1, 1,
0.8349364, 0.1495876, 0.9502446, 0.7803922, 0, 1, 1,
0.8379335, 1.079996, 0.5181629, 0.7882353, 0, 1, 1,
0.8395281, -0.8100495, 2.506754, 0.7921569, 0, 1, 1,
0.8454212, 0.1143488, 2.30131, 0.8, 0, 1, 1,
0.8498512, -1.983759, 2.987188, 0.8078431, 0, 1, 1,
0.850809, -1.322357, 3.114177, 0.8117647, 0, 1, 1,
0.8522426, -0.05474171, 0.7243858, 0.8196079, 0, 1, 1,
0.854859, -1.8611, 2.302483, 0.8235294, 0, 1, 1,
0.8569924, -1.206165, 3.898658, 0.8313726, 0, 1, 1,
0.8604016, -0.5146955, 1.977641, 0.8352941, 0, 1, 1,
0.8606852, 0.5805005, 0.8929727, 0.8431373, 0, 1, 1,
0.8629664, -1.750517, 2.996167, 0.8470588, 0, 1, 1,
0.8635614, 2.869066, -1.96562, 0.854902, 0, 1, 1,
0.863619, 0.6528199, 0.7685281, 0.8588235, 0, 1, 1,
0.8644748, 1.025952, 0.2909782, 0.8666667, 0, 1, 1,
0.8738218, 0.9104319, 1.375536, 0.8705882, 0, 1, 1,
0.8841351, -0.4857174, 2.891042, 0.8784314, 0, 1, 1,
0.8916172, 0.3069578, 2.36135, 0.8823529, 0, 1, 1,
0.8946617, -0.07339417, 2.509155, 0.8901961, 0, 1, 1,
0.8947722, -0.4027334, 2.22381, 0.8941177, 0, 1, 1,
0.8954165, -1.001817, 3.533399, 0.9019608, 0, 1, 1,
0.8986315, 1.19054, 1.588781, 0.9098039, 0, 1, 1,
0.8987745, 0.2189448, 0.8462296, 0.9137255, 0, 1, 1,
0.9020554, -0.5552582, 1.552436, 0.9215686, 0, 1, 1,
0.9020919, 0.8466411, 0.720716, 0.9254902, 0, 1, 1,
0.9091735, 0.5236036, 0.9971187, 0.9333333, 0, 1, 1,
0.9105253, 1.071033, -0.02029488, 0.9372549, 0, 1, 1,
0.9159941, -0.5310878, 1.920192, 0.945098, 0, 1, 1,
0.9175547, -1.305939, 2.09579, 0.9490196, 0, 1, 1,
0.9237182, -0.7899085, 2.281552, 0.9568627, 0, 1, 1,
0.9238641, 0.9593846, 0.3950963, 0.9607843, 0, 1, 1,
0.9238735, 0.7997545, -0.3223359, 0.9686275, 0, 1, 1,
0.9298401, -1.144752, 2.649212, 0.972549, 0, 1, 1,
0.9417418, 0.9566571, 1.235423, 0.9803922, 0, 1, 1,
0.9448299, 0.8856149, 0.8552569, 0.9843137, 0, 1, 1,
0.9456919, 1.091637, 0.811632, 0.9921569, 0, 1, 1,
0.9465755, 1.291701, 0.4243231, 0.9960784, 0, 1, 1,
0.9497806, 0.3155495, 1.241487, 1, 0, 0.9960784, 1,
0.9592282, 0.1988599, 3.003157, 1, 0, 0.9882353, 1,
0.95946, -0.1569162, 0.7327936, 1, 0, 0.9843137, 1,
0.9679364, 1.165453, -0.5073105, 1, 0, 0.9764706, 1,
0.9755779, -1.604427, 3.00237, 1, 0, 0.972549, 1,
0.9789032, 1.061942, 1.029333, 1, 0, 0.9647059, 1,
0.9834547, 0.6999311, -1.623921, 1, 0, 0.9607843, 1,
0.986267, -1.223612, 1.420581, 1, 0, 0.9529412, 1,
0.9916917, 0.1692688, 1.315567, 1, 0, 0.9490196, 1,
0.9987723, -0.09333117, 3.187313, 1, 0, 0.9411765, 1,
1.007862, -0.6598615, 1.524863, 1, 0, 0.9372549, 1,
1.010471, -0.08198255, 0.1193587, 1, 0, 0.9294118, 1,
1.018225, 0.7673042, -0.5219373, 1, 0, 0.9254902, 1,
1.020965, -0.1195445, 0.6751161, 1, 0, 0.9176471, 1,
1.025037, -0.5654379, 2.981052, 1, 0, 0.9137255, 1,
1.032044, -0.09713175, 1.677941, 1, 0, 0.9058824, 1,
1.034829, 0.09709461, 1.169569, 1, 0, 0.9019608, 1,
1.0508, -0.4733304, 2.61465, 1, 0, 0.8941177, 1,
1.057879, 0.4295609, 1.444204, 1, 0, 0.8862745, 1,
1.059827, -1.24711, 3.555562, 1, 0, 0.8823529, 1,
1.061625, 1.548885, -1.612207, 1, 0, 0.8745098, 1,
1.062222, -0.1017985, 1.173086, 1, 0, 0.8705882, 1,
1.06343, 0.4103743, 0.2883997, 1, 0, 0.8627451, 1,
1.066373, -0.4520044, 2.547016, 1, 0, 0.8588235, 1,
1.067943, 0.9445516, 0.5789008, 1, 0, 0.8509804, 1,
1.068123, -0.4672663, 1.835936, 1, 0, 0.8470588, 1,
1.074711, 0.3618903, 0.2768831, 1, 0, 0.8392157, 1,
1.077345, 0.4416558, 3.138837, 1, 0, 0.8352941, 1,
1.080271, -1.116901, 1.760185, 1, 0, 0.827451, 1,
1.082938, -1.397544, 2.479393, 1, 0, 0.8235294, 1,
1.09859, 0.4517608, 1.807487, 1, 0, 0.8156863, 1,
1.101204, 1.659733, 0.3785501, 1, 0, 0.8117647, 1,
1.104182, 0.384144, -1.02375, 1, 0, 0.8039216, 1,
1.105298, -0.3314958, 2.491084, 1, 0, 0.7960784, 1,
1.108382, -0.2471033, 1.950834, 1, 0, 0.7921569, 1,
1.120292, -0.908942, 2.268783, 1, 0, 0.7843137, 1,
1.121258, -1.424876, 1.76846, 1, 0, 0.7803922, 1,
1.124921, 1.469246, -0.2182206, 1, 0, 0.772549, 1,
1.129412, 0.2873133, 2.664807, 1, 0, 0.7686275, 1,
1.133142, -1.187965, 3.537321, 1, 0, 0.7607843, 1,
1.133605, -0.5661331, 1.629977, 1, 0, 0.7568628, 1,
1.136278, 0.165022, 1.311577, 1, 0, 0.7490196, 1,
1.136748, -0.4059866, 2.726324, 1, 0, 0.7450981, 1,
1.153676, 1.312363, -0.5235277, 1, 0, 0.7372549, 1,
1.154633, -0.896442, 2.837274, 1, 0, 0.7333333, 1,
1.158733, -0.32055, 1.047798, 1, 0, 0.7254902, 1,
1.166131, 0.3898111, 0.5535048, 1, 0, 0.7215686, 1,
1.171453, 0.7830855, 0.8652726, 1, 0, 0.7137255, 1,
1.173823, -1.451761, 1.644619, 1, 0, 0.7098039, 1,
1.181977, -0.2623917, -0.5259861, 1, 0, 0.7019608, 1,
1.184616, -1.077489, 2.480825, 1, 0, 0.6941177, 1,
1.185657, 1.07839, -0.01701755, 1, 0, 0.6901961, 1,
1.186999, -3.311362, 2.103967, 1, 0, 0.682353, 1,
1.191283, 0.4107985, -0.3017865, 1, 0, 0.6784314, 1,
1.194742, -0.9853336, 0.8998261, 1, 0, 0.6705883, 1,
1.196921, 1.334984, -0.3829139, 1, 0, 0.6666667, 1,
1.200349, -0.61457, 1.213454, 1, 0, 0.6588235, 1,
1.202054, 0.3316412, 0.08147945, 1, 0, 0.654902, 1,
1.209987, 0.4489445, 1.387542, 1, 0, 0.6470588, 1,
1.210717, -0.1814038, 1.188112, 1, 0, 0.6431373, 1,
1.214388, -0.8668916, 5.165861, 1, 0, 0.6352941, 1,
1.215062, -0.1057716, 0.8365589, 1, 0, 0.6313726, 1,
1.2154, -0.2326417, 2.482629, 1, 0, 0.6235294, 1,
1.219963, 0.42738, 2.382848, 1, 0, 0.6196079, 1,
1.221052, 0.9032529, 1.482196, 1, 0, 0.6117647, 1,
1.226059, 0.4392171, 2.582061, 1, 0, 0.6078432, 1,
1.231726, 1.236034, -0.2443111, 1, 0, 0.6, 1,
1.248328, 1.143272, 1.113946, 1, 0, 0.5921569, 1,
1.268512, 1.243193, 0.382836, 1, 0, 0.5882353, 1,
1.281782, 0.7750374, 0.5235857, 1, 0, 0.5803922, 1,
1.28507, -0.3710178, 3.487101, 1, 0, 0.5764706, 1,
1.289969, -0.4000501, 1.074961, 1, 0, 0.5686275, 1,
1.303631, -0.2655632, 2.094682, 1, 0, 0.5647059, 1,
1.306495, 2.052016, -0.05394547, 1, 0, 0.5568628, 1,
1.308681, -0.5983297, 0.574677, 1, 0, 0.5529412, 1,
1.312255, -0.5366545, 3.251649, 1, 0, 0.5450981, 1,
1.319317, -0.4201445, 0.7802808, 1, 0, 0.5411765, 1,
1.32402, 0.2447732, 2.689884, 1, 0, 0.5333334, 1,
1.33343, -0.63945, 0.989453, 1, 0, 0.5294118, 1,
1.335085, 1.518774, 1.60918, 1, 0, 0.5215687, 1,
1.336443, -0.2058737, 0.3354688, 1, 0, 0.5176471, 1,
1.340839, -0.2409436, 2.503582, 1, 0, 0.509804, 1,
1.353696, 1.254588, 0.6247851, 1, 0, 0.5058824, 1,
1.355446, 0.1398759, 1.726191, 1, 0, 0.4980392, 1,
1.356809, -0.4734752, 1.528582, 1, 0, 0.4901961, 1,
1.363828, -1.343966, 2.829232, 1, 0, 0.4862745, 1,
1.38116, -0.3779961, 1.227902, 1, 0, 0.4784314, 1,
1.397632, 3.22388, -0.1598445, 1, 0, 0.4745098, 1,
1.399287, 0.4309577, 0.6200183, 1, 0, 0.4666667, 1,
1.406456, 1.461057, 0.5908175, 1, 0, 0.4627451, 1,
1.407402, 0.3117043, 0.7414911, 1, 0, 0.454902, 1,
1.414327, 2.633724, 0.5677646, 1, 0, 0.4509804, 1,
1.418967, -1.048216, 1.429527, 1, 0, 0.4431373, 1,
1.431203, 0.01066337, -0.4313433, 1, 0, 0.4392157, 1,
1.445781, -0.2193433, 2.875463, 1, 0, 0.4313726, 1,
1.452399, 1.279407, 2.197804, 1, 0, 0.427451, 1,
1.457142, 1.212584, 0.1412919, 1, 0, 0.4196078, 1,
1.460595, -0.6513302, 2.728102, 1, 0, 0.4156863, 1,
1.4624, -0.3227613, 0.9119644, 1, 0, 0.4078431, 1,
1.492825, -0.1612507, 2.450786, 1, 0, 0.4039216, 1,
1.518473, 0.1787532, 0.7332842, 1, 0, 0.3960784, 1,
1.527158, 0.5933771, 3.395044, 1, 0, 0.3882353, 1,
1.538696, -0.3366936, 1.145347, 1, 0, 0.3843137, 1,
1.548609, 0.3982728, 1.472471, 1, 0, 0.3764706, 1,
1.557087, -0.543312, -1.135984, 1, 0, 0.372549, 1,
1.55788, 0.06999473, 1.83781, 1, 0, 0.3647059, 1,
1.561619, 0.8437859, 1.176566, 1, 0, 0.3607843, 1,
1.57442, 0.4266322, 1.16352, 1, 0, 0.3529412, 1,
1.582756, -0.4719544, 0.3594333, 1, 0, 0.3490196, 1,
1.590788, -0.2491842, 1.429153, 1, 0, 0.3411765, 1,
1.602816, 1.094428, 1.497702, 1, 0, 0.3372549, 1,
1.607725, -0.1752591, 2.945711, 1, 0, 0.3294118, 1,
1.613791, -0.5376897, 2.051273, 1, 0, 0.3254902, 1,
1.617962, 0.1848056, 0.1847225, 1, 0, 0.3176471, 1,
1.620227, -1.27804, 2.576642, 1, 0, 0.3137255, 1,
1.628977, 0.09035617, 3.430226, 1, 0, 0.3058824, 1,
1.631459, -0.2477829, 0.5930822, 1, 0, 0.2980392, 1,
1.632891, -0.3118795, 2.305435, 1, 0, 0.2941177, 1,
1.636172, -0.9882547, 2.906617, 1, 0, 0.2862745, 1,
1.644497, -0.906313, 1.205899, 1, 0, 0.282353, 1,
1.65036, 1.257774, 2.159799, 1, 0, 0.2745098, 1,
1.657187, 0.02241419, 3.42892, 1, 0, 0.2705882, 1,
1.659183, 0.9385191, -0.2415348, 1, 0, 0.2627451, 1,
1.666583, -0.8877741, 3.509524, 1, 0, 0.2588235, 1,
1.678205, -0.04673283, 3.048785, 1, 0, 0.2509804, 1,
1.681081, 1.024985, 1.745063, 1, 0, 0.2470588, 1,
1.687667, 0.2586116, 0.1518841, 1, 0, 0.2392157, 1,
1.704272, 0.08235606, -0.2180364, 1, 0, 0.2352941, 1,
1.71936, 0.158689, 2.698558, 1, 0, 0.227451, 1,
1.722754, 1.541852, -0.1651631, 1, 0, 0.2235294, 1,
1.72731, -1.601755, 2.736601, 1, 0, 0.2156863, 1,
1.72947, -1.412721, 1.599412, 1, 0, 0.2117647, 1,
1.742025, -0.5647094, 1.414785, 1, 0, 0.2039216, 1,
1.759016, -0.3059066, 3.840157, 1, 0, 0.1960784, 1,
1.766211, -0.5896354, 0.4965059, 1, 0, 0.1921569, 1,
1.794842, 2.592535, -0.4618016, 1, 0, 0.1843137, 1,
1.801029, -1.506872, 1.133957, 1, 0, 0.1803922, 1,
1.802034, -0.7717817, 1.972431, 1, 0, 0.172549, 1,
1.809167, -1.5026, 3.44868, 1, 0, 0.1686275, 1,
1.84807, 0.3996962, 1.967181, 1, 0, 0.1607843, 1,
1.873869, 0.8731377, 0.6459856, 1, 0, 0.1568628, 1,
1.878849, 2.160139, 0.5604684, 1, 0, 0.1490196, 1,
1.927728, 1.057265, 2.146015, 1, 0, 0.145098, 1,
1.935326, -0.4017476, 1.16725, 1, 0, 0.1372549, 1,
1.950534, -0.3208682, 1.603416, 1, 0, 0.1333333, 1,
1.964519, -0.9550779, -0.4259639, 1, 0, 0.1254902, 1,
1.998414, 1.062243, 2.395631, 1, 0, 0.1215686, 1,
1.999739, -1.158113, 2.206892, 1, 0, 0.1137255, 1,
2.051798, -0.7660661, 1.056659, 1, 0, 0.1098039, 1,
2.118088, 0.4475412, 1.86113, 1, 0, 0.1019608, 1,
2.128796, -0.41783, 1.061938, 1, 0, 0.09411765, 1,
2.206772, -0.6021472, 1.775077, 1, 0, 0.09019608, 1,
2.262391, -1.271205, 3.682438, 1, 0, 0.08235294, 1,
2.273305, 2.291857, 0.7283312, 1, 0, 0.07843138, 1,
2.334653, -0.3563272, 4.488866, 1, 0, 0.07058824, 1,
2.341269, 1.688174, 0.6083466, 1, 0, 0.06666667, 1,
2.413436, 0.7037211, 2.278654, 1, 0, 0.05882353, 1,
2.416164, -0.9370595, 1.747786, 1, 0, 0.05490196, 1,
2.459973, -0.07255065, -0.4241646, 1, 0, 0.04705882, 1,
2.612764, 0.8276091, -1.175396, 1, 0, 0.04313726, 1,
2.641119, -1.10431, 2.94583, 1, 0, 0.03529412, 1,
2.852106, 0.7426806, 3.086824, 1, 0, 0.03137255, 1,
2.983273, -0.5209358, 2.769515, 1, 0, 0.02352941, 1,
2.985741, -0.8831561, 2.03137, 1, 0, 0.01960784, 1,
3.171181, -0.2285686, -1.233074, 1, 0, 0.01176471, 1,
3.508669, 0.8610912, 0.850848, 1, 0, 0.007843138, 1
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
0.09147263, -4.419086, -6.768948, 0, -0.5, 0.5, 0.5,
0.09147263, -4.419086, -6.768948, 1, -0.5, 0.5, 0.5,
0.09147263, -4.419086, -6.768948, 1, 1.5, 0.5, 0.5,
0.09147263, -4.419086, -6.768948, 0, 1.5, 0.5, 0.5
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
-4.484154, -0.04374111, -6.768948, 0, -0.5, 0.5, 0.5,
-4.484154, -0.04374111, -6.768948, 1, -0.5, 0.5, 0.5,
-4.484154, -0.04374111, -6.768948, 1, 1.5, 0.5, 0.5,
-4.484154, -0.04374111, -6.768948, 0, 1.5, 0.5, 0.5
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
-4.484154, -4.419086, 0.0633347, 0, -0.5, 0.5, 0.5,
-4.484154, -4.419086, 0.0633347, 1, -0.5, 0.5, 0.5,
-4.484154, -4.419086, 0.0633347, 1, 1.5, 0.5, 0.5,
-4.484154, -4.419086, 0.0633347, 0, 1.5, 0.5, 0.5
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
-3, -3.409391, -5.192267,
3, -3.409391, -5.192267,
-3, -3.409391, -5.192267,
-3, -3.577673, -5.455047,
-2, -3.409391, -5.192267,
-2, -3.577673, -5.455047,
-1, -3.409391, -5.192267,
-1, -3.577673, -5.455047,
0, -3.409391, -5.192267,
0, -3.577673, -5.455047,
1, -3.409391, -5.192267,
1, -3.577673, -5.455047,
2, -3.409391, -5.192267,
2, -3.577673, -5.455047,
3, -3.409391, -5.192267,
3, -3.577673, -5.455047
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
-3, -3.914238, -5.980608, 0, -0.5, 0.5, 0.5,
-3, -3.914238, -5.980608, 1, -0.5, 0.5, 0.5,
-3, -3.914238, -5.980608, 1, 1.5, 0.5, 0.5,
-3, -3.914238, -5.980608, 0, 1.5, 0.5, 0.5,
-2, -3.914238, -5.980608, 0, -0.5, 0.5, 0.5,
-2, -3.914238, -5.980608, 1, -0.5, 0.5, 0.5,
-2, -3.914238, -5.980608, 1, 1.5, 0.5, 0.5,
-2, -3.914238, -5.980608, 0, 1.5, 0.5, 0.5,
-1, -3.914238, -5.980608, 0, -0.5, 0.5, 0.5,
-1, -3.914238, -5.980608, 1, -0.5, 0.5, 0.5,
-1, -3.914238, -5.980608, 1, 1.5, 0.5, 0.5,
-1, -3.914238, -5.980608, 0, 1.5, 0.5, 0.5,
0, -3.914238, -5.980608, 0, -0.5, 0.5, 0.5,
0, -3.914238, -5.980608, 1, -0.5, 0.5, 0.5,
0, -3.914238, -5.980608, 1, 1.5, 0.5, 0.5,
0, -3.914238, -5.980608, 0, 1.5, 0.5, 0.5,
1, -3.914238, -5.980608, 0, -0.5, 0.5, 0.5,
1, -3.914238, -5.980608, 1, -0.5, 0.5, 0.5,
1, -3.914238, -5.980608, 1, 1.5, 0.5, 0.5,
1, -3.914238, -5.980608, 0, 1.5, 0.5, 0.5,
2, -3.914238, -5.980608, 0, -0.5, 0.5, 0.5,
2, -3.914238, -5.980608, 1, -0.5, 0.5, 0.5,
2, -3.914238, -5.980608, 1, 1.5, 0.5, 0.5,
2, -3.914238, -5.980608, 0, 1.5, 0.5, 0.5,
3, -3.914238, -5.980608, 0, -0.5, 0.5, 0.5,
3, -3.914238, -5.980608, 1, -0.5, 0.5, 0.5,
3, -3.914238, -5.980608, 1, 1.5, 0.5, 0.5,
3, -3.914238, -5.980608, 0, 1.5, 0.5, 0.5
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
-3.42824, -3, -5.192267,
-3.42824, 3, -5.192267,
-3.42824, -3, -5.192267,
-3.604226, -3, -5.455047,
-3.42824, -2, -5.192267,
-3.604226, -2, -5.455047,
-3.42824, -1, -5.192267,
-3.604226, -1, -5.455047,
-3.42824, 0, -5.192267,
-3.604226, 0, -5.455047,
-3.42824, 1, -5.192267,
-3.604226, 1, -5.455047,
-3.42824, 2, -5.192267,
-3.604226, 2, -5.455047,
-3.42824, 3, -5.192267,
-3.604226, 3, -5.455047
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
-3.956197, -3, -5.980608, 0, -0.5, 0.5, 0.5,
-3.956197, -3, -5.980608, 1, -0.5, 0.5, 0.5,
-3.956197, -3, -5.980608, 1, 1.5, 0.5, 0.5,
-3.956197, -3, -5.980608, 0, 1.5, 0.5, 0.5,
-3.956197, -2, -5.980608, 0, -0.5, 0.5, 0.5,
-3.956197, -2, -5.980608, 1, -0.5, 0.5, 0.5,
-3.956197, -2, -5.980608, 1, 1.5, 0.5, 0.5,
-3.956197, -2, -5.980608, 0, 1.5, 0.5, 0.5,
-3.956197, -1, -5.980608, 0, -0.5, 0.5, 0.5,
-3.956197, -1, -5.980608, 1, -0.5, 0.5, 0.5,
-3.956197, -1, -5.980608, 1, 1.5, 0.5, 0.5,
-3.956197, -1, -5.980608, 0, 1.5, 0.5, 0.5,
-3.956197, 0, -5.980608, 0, -0.5, 0.5, 0.5,
-3.956197, 0, -5.980608, 1, -0.5, 0.5, 0.5,
-3.956197, 0, -5.980608, 1, 1.5, 0.5, 0.5,
-3.956197, 0, -5.980608, 0, 1.5, 0.5, 0.5,
-3.956197, 1, -5.980608, 0, -0.5, 0.5, 0.5,
-3.956197, 1, -5.980608, 1, -0.5, 0.5, 0.5,
-3.956197, 1, -5.980608, 1, 1.5, 0.5, 0.5,
-3.956197, 1, -5.980608, 0, 1.5, 0.5, 0.5,
-3.956197, 2, -5.980608, 0, -0.5, 0.5, 0.5,
-3.956197, 2, -5.980608, 1, -0.5, 0.5, 0.5,
-3.956197, 2, -5.980608, 1, 1.5, 0.5, 0.5,
-3.956197, 2, -5.980608, 0, 1.5, 0.5, 0.5,
-3.956197, 3, -5.980608, 0, -0.5, 0.5, 0.5,
-3.956197, 3, -5.980608, 1, -0.5, 0.5, 0.5,
-3.956197, 3, -5.980608, 1, 1.5, 0.5, 0.5,
-3.956197, 3, -5.980608, 0, 1.5, 0.5, 0.5
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
-3.42824, -3.409391, -4,
-3.42824, -3.409391, 4,
-3.42824, -3.409391, -4,
-3.604226, -3.577673, -4,
-3.42824, -3.409391, -2,
-3.604226, -3.577673, -2,
-3.42824, -3.409391, 0,
-3.604226, -3.577673, 0,
-3.42824, -3.409391, 2,
-3.604226, -3.577673, 2,
-3.42824, -3.409391, 4,
-3.604226, -3.577673, 4
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
-3.956197, -3.914238, -4, 0, -0.5, 0.5, 0.5,
-3.956197, -3.914238, -4, 1, -0.5, 0.5, 0.5,
-3.956197, -3.914238, -4, 1, 1.5, 0.5, 0.5,
-3.956197, -3.914238, -4, 0, 1.5, 0.5, 0.5,
-3.956197, -3.914238, -2, 0, -0.5, 0.5, 0.5,
-3.956197, -3.914238, -2, 1, -0.5, 0.5, 0.5,
-3.956197, -3.914238, -2, 1, 1.5, 0.5, 0.5,
-3.956197, -3.914238, -2, 0, 1.5, 0.5, 0.5,
-3.956197, -3.914238, 0, 0, -0.5, 0.5, 0.5,
-3.956197, -3.914238, 0, 1, -0.5, 0.5, 0.5,
-3.956197, -3.914238, 0, 1, 1.5, 0.5, 0.5,
-3.956197, -3.914238, 0, 0, 1.5, 0.5, 0.5,
-3.956197, -3.914238, 2, 0, -0.5, 0.5, 0.5,
-3.956197, -3.914238, 2, 1, -0.5, 0.5, 0.5,
-3.956197, -3.914238, 2, 1, 1.5, 0.5, 0.5,
-3.956197, -3.914238, 2, 0, 1.5, 0.5, 0.5,
-3.956197, -3.914238, 4, 0, -0.5, 0.5, 0.5,
-3.956197, -3.914238, 4, 1, -0.5, 0.5, 0.5,
-3.956197, -3.914238, 4, 1, 1.5, 0.5, 0.5,
-3.956197, -3.914238, 4, 0, 1.5, 0.5, 0.5
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
-3.42824, -3.409391, -5.192267,
-3.42824, 3.321908, -5.192267,
-3.42824, -3.409391, 5.318936,
-3.42824, 3.321908, 5.318936,
-3.42824, -3.409391, -5.192267,
-3.42824, -3.409391, 5.318936,
-3.42824, 3.321908, -5.192267,
-3.42824, 3.321908, 5.318936,
-3.42824, -3.409391, -5.192267,
3.611185, -3.409391, -5.192267,
-3.42824, -3.409391, 5.318936,
3.611185, -3.409391, 5.318936,
-3.42824, 3.321908, -5.192267,
3.611185, 3.321908, -5.192267,
-3.42824, 3.321908, 5.318936,
3.611185, 3.321908, 5.318936,
3.611185, -3.409391, -5.192267,
3.611185, 3.321908, -5.192267,
3.611185, -3.409391, 5.318936,
3.611185, 3.321908, 5.318936,
3.611185, -3.409391, -5.192267,
3.611185, -3.409391, 5.318936,
3.611185, 3.321908, -5.192267,
3.611185, 3.321908, 5.318936
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
var radius = 7.651949;
var distance = 34.04439;
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
mvMatrix.translate( -0.09147263, 0.04374111, -0.0633347 );
mvMatrix.scale( 1.1753, 1.2291, 0.7871066 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.04439);
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
Carbophenthion<-read.table("Carbophenthion.xyz")
```

```
## Error in read.table("Carbophenthion.xyz"): no lines available in input
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
-3.325724, -1.519223, -2.581559, 0, 0, 1, 1, 1,
-3.019659, 0.9698824, -1.098467, 1, 0, 0, 1, 1,
-2.942664, -0.1581759, -3.684935, 1, 0, 0, 1, 1,
-2.824096, -1.42213, -2.42237, 1, 0, 0, 1, 1,
-2.752376, 1.28912, -1.927144, 1, 0, 0, 1, 1,
-2.73932, 0.4908598, -1.355091, 1, 0, 0, 1, 1,
-2.702123, -0.08732948, -1.226218, 0, 0, 0, 1, 1,
-2.675719, -0.0009847668, -1.656065, 0, 0, 0, 1, 1,
-2.617565, -0.056919, -1.164384, 0, 0, 0, 1, 1,
-2.552497, -0.6175567, -1.884163, 0, 0, 0, 1, 1,
-2.439195, 1.431724, -1.1025, 0, 0, 0, 1, 1,
-2.393591, -0.6339477, -0.5900713, 0, 0, 0, 1, 1,
-2.388737, -0.233988, -3.54525, 0, 0, 0, 1, 1,
-2.385707, -0.2177574, -2.37055, 1, 1, 1, 1, 1,
-2.375921, -0.7426593, -1.614576, 1, 1, 1, 1, 1,
-2.338873, 1.273328, -2.816563, 1, 1, 1, 1, 1,
-2.268085, -0.5779846, -2.17905, 1, 1, 1, 1, 1,
-2.173681, 0.4252214, -3.466797, 1, 1, 1, 1, 1,
-2.133625, -0.027458, -1.449303, 1, 1, 1, 1, 1,
-2.125487, 0.3988749, -0.1381889, 1, 1, 1, 1, 1,
-2.051197, -0.3095496, -1.432079, 1, 1, 1, 1, 1,
-2.040183, 0.8460414, -1.817641, 1, 1, 1, 1, 1,
-2.005637, 0.06220633, -2.995158, 1, 1, 1, 1, 1,
-2.000069, -0.8403332, -0.9403458, 1, 1, 1, 1, 1,
-1.978546, 1.471989, -0.7087225, 1, 1, 1, 1, 1,
-1.968547, -1.634395, -1.915918, 1, 1, 1, 1, 1,
-1.958837, 1.613534, -0.9049755, 1, 1, 1, 1, 1,
-1.948518, 0.4348671, -1.936615, 1, 1, 1, 1, 1,
-1.910257, -0.1038583, -0.7662318, 0, 0, 1, 1, 1,
-1.901256, -0.8616219, -2.609118, 1, 0, 0, 1, 1,
-1.876108, -0.2251918, -1.574854, 1, 0, 0, 1, 1,
-1.856136, 0.3408287, -0.3579217, 1, 0, 0, 1, 1,
-1.831814, -0.1632872, -1.379425, 1, 0, 0, 1, 1,
-1.828384, 0.2087496, 0.3494087, 1, 0, 0, 1, 1,
-1.814385, -0.6887274, -3.753106, 0, 0, 0, 1, 1,
-1.798017, 0.08033659, -2.407599, 0, 0, 0, 1, 1,
-1.788545, 1.62612, -1.529564, 0, 0, 0, 1, 1,
-1.781461, 1.187707, -0.1998701, 0, 0, 0, 1, 1,
-1.777855, 0.6729368, -2.56821, 0, 0, 0, 1, 1,
-1.777389, -0.1349718, -2.665926, 0, 0, 0, 1, 1,
-1.773077, -0.5858751, -2.568884, 0, 0, 0, 1, 1,
-1.753353, -1.204433, -0.8661224, 1, 1, 1, 1, 1,
-1.747125, -0.4161079, -2.675501, 1, 1, 1, 1, 1,
-1.722079, -1.362808, -3.629621, 1, 1, 1, 1, 1,
-1.696311, -0.5893283, -1.732896, 1, 1, 1, 1, 1,
-1.685619, -0.4235193, -1.956235, 1, 1, 1, 1, 1,
-1.673295, 0.8368073, -2.191084, 1, 1, 1, 1, 1,
-1.672176, 0.2901016, -1.431993, 1, 1, 1, 1, 1,
-1.661573, 0.3865482, -1.881607, 1, 1, 1, 1, 1,
-1.651411, 1.727368, -1.095098, 1, 1, 1, 1, 1,
-1.630323, -1.604883, -3.273674, 1, 1, 1, 1, 1,
-1.614766, -0.4962254, -1.746483, 1, 1, 1, 1, 1,
-1.606718, -1.162235, -2.144475, 1, 1, 1, 1, 1,
-1.60552, 1.114401, 0.6741067, 1, 1, 1, 1, 1,
-1.594005, 1.417534, -3.836443, 1, 1, 1, 1, 1,
-1.588197, 1.36705, -0.3312024, 1, 1, 1, 1, 1,
-1.587479, 0.7891894, -2.238957, 0, 0, 1, 1, 1,
-1.558225, -0.4543155, 0.5264811, 1, 0, 0, 1, 1,
-1.544289, -1.219254, -2.182103, 1, 0, 0, 1, 1,
-1.542725, -0.7345836, -1.535563, 1, 0, 0, 1, 1,
-1.538321, 0.1307129, -1.505415, 1, 0, 0, 1, 1,
-1.537836, -0.4579589, -1.508793, 1, 0, 0, 1, 1,
-1.537571, -0.1474729, -1.543276, 0, 0, 0, 1, 1,
-1.52254, -0.1991763, -2.120803, 0, 0, 0, 1, 1,
-1.517806, 0.9539894, -0.4288465, 0, 0, 0, 1, 1,
-1.501318, 0.3991262, -0.8630087, 0, 0, 0, 1, 1,
-1.499231, 0.2980456, -1.622762, 0, 0, 0, 1, 1,
-1.496946, 1.28837, -1.012088, 0, 0, 0, 1, 1,
-1.470398, -0.7431003, -2.620618, 0, 0, 0, 1, 1,
-1.463051, 0.6854144, 0.2338668, 1, 1, 1, 1, 1,
-1.462233, -0.1156315, -0.6338583, 1, 1, 1, 1, 1,
-1.453685, -0.6555001, -2.243738, 1, 1, 1, 1, 1,
-1.448774, -0.6505321, -1.141177, 1, 1, 1, 1, 1,
-1.447394, 1.494946, -0.8964765, 1, 1, 1, 1, 1,
-1.446024, -1.55299, -2.713169, 1, 1, 1, 1, 1,
-1.443449, 0.8715558, -1.489282, 1, 1, 1, 1, 1,
-1.442567, 1.363367, -1.375616, 1, 1, 1, 1, 1,
-1.439305, -0.03477538, -1.629811, 1, 1, 1, 1, 1,
-1.436176, -0.7158095, -3.861918, 1, 1, 1, 1, 1,
-1.43034, -0.846642, -2.160204, 1, 1, 1, 1, 1,
-1.425449, 0.9673611, -3.371665, 1, 1, 1, 1, 1,
-1.399395, -1.82293, -2.772976, 1, 1, 1, 1, 1,
-1.396741, 0.7474485, -0.7919522, 1, 1, 1, 1, 1,
-1.387493, 0.03904823, -2.866404, 1, 1, 1, 1, 1,
-1.387437, -0.09236929, -1.137626, 0, 0, 1, 1, 1,
-1.381281, -0.5602825, -3.191493, 1, 0, 0, 1, 1,
-1.378561, 0.4330528, 0.1779472, 1, 0, 0, 1, 1,
-1.368824, -0.9481164, -1.544479, 1, 0, 0, 1, 1,
-1.367738, -0.8949995, -2.889184, 1, 0, 0, 1, 1,
-1.354105, -1.646236, -1.701746, 1, 0, 0, 1, 1,
-1.347778, -0.8149738, -2.091853, 0, 0, 0, 1, 1,
-1.338136, -0.8205732, -2.582399, 0, 0, 0, 1, 1,
-1.33641, 1.724777, -2.603809, 0, 0, 0, 1, 1,
-1.336275, -0.4991393, -2.636616, 0, 0, 0, 1, 1,
-1.335234, 0.04311306, -0.6677289, 0, 0, 0, 1, 1,
-1.33017, -0.2508183, -2.017826, 0, 0, 0, 1, 1,
-1.322726, 1.653551, -2.320918, 0, 0, 0, 1, 1,
-1.31179, -0.7371922, -1.569673, 1, 1, 1, 1, 1,
-1.303599, 0.04470283, -2.379516, 1, 1, 1, 1, 1,
-1.298424, -1.632967, -3.153455, 1, 1, 1, 1, 1,
-1.292004, 0.4733628, -0.9181158, 1, 1, 1, 1, 1,
-1.277989, -0.1257843, -2.836706, 1, 1, 1, 1, 1,
-1.270937, -0.1260053, -0.22507, 1, 1, 1, 1, 1,
-1.26034, -1.32159, -4.031937, 1, 1, 1, 1, 1,
-1.251494, -1.504087, -2.74866, 1, 1, 1, 1, 1,
-1.250819, -0.3070815, -2.04755, 1, 1, 1, 1, 1,
-1.236262, -0.4587349, -0.6846087, 1, 1, 1, 1, 1,
-1.228098, -0.5739309, -3.218021, 1, 1, 1, 1, 1,
-1.226663, -0.479792, -3.229808, 1, 1, 1, 1, 1,
-1.223671, -0.5314111, -2.674423, 1, 1, 1, 1, 1,
-1.205166, -1.265944, -3.248717, 1, 1, 1, 1, 1,
-1.204526, 0.5974109, 0.4525931, 1, 1, 1, 1, 1,
-1.190132, -1.547176, -1.892275, 0, 0, 1, 1, 1,
-1.189381, -1.793439, -1.606548, 1, 0, 0, 1, 1,
-1.189313, -0.6213704, -3.374167, 1, 0, 0, 1, 1,
-1.187174, 0.04843299, -1.916905, 1, 0, 0, 1, 1,
-1.187169, -1.604967, -2.001937, 1, 0, 0, 1, 1,
-1.185406, 0.5121979, -0.7237628, 1, 0, 0, 1, 1,
-1.18353, -0.7536235, -0.4428391, 0, 0, 0, 1, 1,
-1.183197, 0.4809564, -2.167639, 0, 0, 0, 1, 1,
-1.18319, 0.3009833, -2.027794, 0, 0, 0, 1, 1,
-1.177835, -0.6710926, -1.217531, 0, 0, 0, 1, 1,
-1.149655, 0.3925504, -3.651099, 0, 0, 0, 1, 1,
-1.134153, 0.9218336, -1.588677, 0, 0, 0, 1, 1,
-1.129187, 0.397239, -1.526957, 0, 0, 0, 1, 1,
-1.128537, -0.32584, -2.521563, 1, 1, 1, 1, 1,
-1.126936, 0.2687319, -0.3342308, 1, 1, 1, 1, 1,
-1.123309, 0.08569257, -2.383693, 1, 1, 1, 1, 1,
-1.123149, -0.2626294, -3.813418, 1, 1, 1, 1, 1,
-1.120935, -0.2161058, -0.1635153, 1, 1, 1, 1, 1,
-1.1183, -0.2725735, 0.1285045, 1, 1, 1, 1, 1,
-1.11513, -1.339915, -1.056361, 1, 1, 1, 1, 1,
-1.095428, -0.7199902, -0.8185772, 1, 1, 1, 1, 1,
-1.0953, -1.548654, -1.867015, 1, 1, 1, 1, 1,
-1.084905, -0.790742, -2.678055, 1, 1, 1, 1, 1,
-1.083113, 1.425895, -0.7235317, 1, 1, 1, 1, 1,
-1.077096, -0.314548, -1.409734, 1, 1, 1, 1, 1,
-1.068318, -1.027588, -0.8492153, 1, 1, 1, 1, 1,
-1.064293, -0.2708016, -2.368254, 1, 1, 1, 1, 1,
-1.062371, 2.175769, 0.3043341, 1, 1, 1, 1, 1,
-1.056384, 0.1803934, -0.5767998, 0, 0, 1, 1, 1,
-1.054471, 0.2046557, -2.305843, 1, 0, 0, 1, 1,
-1.051316, -0.2214672, -1.39713, 1, 0, 0, 1, 1,
-1.049024, 1.029894, -1.235643, 1, 0, 0, 1, 1,
-1.048915, 1.407656, 0.6422346, 1, 0, 0, 1, 1,
-1.048393, 0.2550411, -1.687263, 1, 0, 0, 1, 1,
-1.045537, 0.009907764, -3.721149, 0, 0, 0, 1, 1,
-1.038769, -1.713424, -0.5929931, 0, 0, 0, 1, 1,
-1.03239, -0.6310689, -1.405688, 0, 0, 0, 1, 1,
-1.028412, -0.9215037, -2.346222, 0, 0, 0, 1, 1,
-1.02837, -1.331052, -3.098312, 0, 0, 0, 1, 1,
-1.027412, -0.2898806, -1.328492, 0, 0, 0, 1, 1,
-1.02139, -0.624707, -2.032163, 0, 0, 0, 1, 1,
-1.020718, -0.9877304, -3.183776, 1, 1, 1, 1, 1,
-1.017849, 0.5983429, -0.9069408, 1, 1, 1, 1, 1,
-1.006916, -0.1936608, -2.124527, 1, 1, 1, 1, 1,
-1.00635, -0.3601784, -1.68207, 1, 1, 1, 1, 1,
-1.006195, 0.1320489, -1.922662, 1, 1, 1, 1, 1,
-1.004425, 0.41429, -2.035527, 1, 1, 1, 1, 1,
-1.004286, -0.9675779, -2.761582, 1, 1, 1, 1, 1,
-1.003406, 0.5970123, -2.174682, 1, 1, 1, 1, 1,
-0.9930925, -0.146472, -1.37997, 1, 1, 1, 1, 1,
-0.991933, -0.2645814, -1.005399, 1, 1, 1, 1, 1,
-0.9897314, -0.5522379, -2.072797, 1, 1, 1, 1, 1,
-0.9835947, -1.156885, -3.044116, 1, 1, 1, 1, 1,
-0.9799376, 0.7225055, -1.050946, 1, 1, 1, 1, 1,
-0.9789882, -0.5615245, -1.346091, 1, 1, 1, 1, 1,
-0.9783874, -1.226645, -2.443512, 1, 1, 1, 1, 1,
-0.9779239, -0.1442774, -2.56987, 0, 0, 1, 1, 1,
-0.9766961, -0.9732869, -3.521279, 1, 0, 0, 1, 1,
-0.9726871, -0.4487718, -0.5904903, 1, 0, 0, 1, 1,
-0.9705512, -0.9315037, -1.482016, 1, 0, 0, 1, 1,
-0.9685907, 0.5483918, -1.226406, 1, 0, 0, 1, 1,
-0.9599329, -0.05935355, -3.765038, 1, 0, 0, 1, 1,
-0.95149, -1.150861, -5.039191, 0, 0, 0, 1, 1,
-0.9509955, 0.9709927, -0.0498795, 0, 0, 0, 1, 1,
-0.950623, -0.799153, -3.678814, 0, 0, 0, 1, 1,
-0.9484381, 0.4787612, -1.217857, 0, 0, 0, 1, 1,
-0.9466817, -0.3246427, -4.632246, 0, 0, 0, 1, 1,
-0.9372903, -0.6552439, -2.660387, 0, 0, 0, 1, 1,
-0.9360045, -1.690553, -2.851412, 0, 0, 0, 1, 1,
-0.9346195, -0.3789347, -1.819947, 1, 1, 1, 1, 1,
-0.9305736, 0.649549, 0.5824606, 1, 1, 1, 1, 1,
-0.9305416, -1.609981, -2.950264, 1, 1, 1, 1, 1,
-0.9301918, -0.02192196, -0.32322, 1, 1, 1, 1, 1,
-0.9262228, 0.3885125, -0.5981354, 1, 1, 1, 1, 1,
-0.9183172, 1.257923, 0.7762994, 1, 1, 1, 1, 1,
-0.9179608, -1.955982, -3.524308, 1, 1, 1, 1, 1,
-0.9083351, 0.3934139, -1.809484, 1, 1, 1, 1, 1,
-0.9077881, 1.083084, -2.394384, 1, 1, 1, 1, 1,
-0.9035549, 1.758776, 1.016272, 1, 1, 1, 1, 1,
-0.9008886, 0.5536736, -2.216583, 1, 1, 1, 1, 1,
-0.8971723, 0.3025984, -1.188841, 1, 1, 1, 1, 1,
-0.8925341, 0.1516455, 0.2070307, 1, 1, 1, 1, 1,
-0.8898284, 0.6602548, -1.812557, 1, 1, 1, 1, 1,
-0.8892625, -0.05276005, 1.192481, 1, 1, 1, 1, 1,
-0.8817687, -1.480829, -3.463697, 0, 0, 1, 1, 1,
-0.8798976, 0.9018303, -2.796136, 1, 0, 0, 1, 1,
-0.8783266, 0.6340079, -0.7686584, 1, 0, 0, 1, 1,
-0.8755347, 2.250196, -0.2280265, 1, 0, 0, 1, 1,
-0.8694896, 1.092024, 0.3951816, 1, 0, 0, 1, 1,
-0.8680324, -0.2171275, -2.757867, 1, 0, 0, 1, 1,
-0.8654341, 0.6805373, -2.098966, 0, 0, 0, 1, 1,
-0.8644438, -0.290674, -3.680983, 0, 0, 0, 1, 1,
-0.8639752, -1.079355, -2.057112, 0, 0, 0, 1, 1,
-0.8615336, -1.548778, -2.410888, 0, 0, 0, 1, 1,
-0.8612757, 1.117629, 1.322989, 0, 0, 0, 1, 1,
-0.858006, -0.9146146, -2.462128, 0, 0, 0, 1, 1,
-0.8530383, 0.7505417, -1.22421, 0, 0, 0, 1, 1,
-0.8515357, -1.026626, -2.409396, 1, 1, 1, 1, 1,
-0.8407441, -1.98445, -2.667106, 1, 1, 1, 1, 1,
-0.8383731, 0.2317796, -2.067954, 1, 1, 1, 1, 1,
-0.8353426, 0.2012027, -2.110017, 1, 1, 1, 1, 1,
-0.8207608, 0.7878042, -0.8682472, 1, 1, 1, 1, 1,
-0.818124, 0.5398961, -2.586238, 1, 1, 1, 1, 1,
-0.8159308, 0.6113173, -1.761412, 1, 1, 1, 1, 1,
-0.8086653, 0.7499444, 0.3167613, 1, 1, 1, 1, 1,
-0.8057956, 0.2299929, -2.011205, 1, 1, 1, 1, 1,
-0.8056698, -0.583909, -1.987417, 1, 1, 1, 1, 1,
-0.8036444, 2.683009, -0.267397, 1, 1, 1, 1, 1,
-0.7970091, 0.903367, -1.566873, 1, 1, 1, 1, 1,
-0.7942618, -0.2181777, -0.9743332, 1, 1, 1, 1, 1,
-0.7910071, 0.2523102, -0.4426937, 1, 1, 1, 1, 1,
-0.7880915, 0.1375693, -0.31644, 1, 1, 1, 1, 1,
-0.7860263, -0.6216325, -1.264539, 0, 0, 1, 1, 1,
-0.7803429, -0.2985929, -1.133958, 1, 0, 0, 1, 1,
-0.7782496, -1.102446, -1.960798, 1, 0, 0, 1, 1,
-0.7778315, 0.6576622, -1.933726, 1, 0, 0, 1, 1,
-0.7734233, 0.4334779, -1.177048, 1, 0, 0, 1, 1,
-0.7692927, 0.2155474, -1.542234, 1, 0, 0, 1, 1,
-0.7686494, 0.7860092, -0.3157517, 0, 0, 0, 1, 1,
-0.7663489, -0.1096597, -1.817705, 0, 0, 0, 1, 1,
-0.7637893, 0.7115605, 0.4017237, 0, 0, 0, 1, 1,
-0.7602602, 0.2148043, -1.038038, 0, 0, 0, 1, 1,
-0.7556539, 0.8449395, -0.5550483, 0, 0, 0, 1, 1,
-0.7523071, -0.0279333, -0.8583555, 0, 0, 0, 1, 1,
-0.7503957, -0.4093268, -1.962788, 0, 0, 0, 1, 1,
-0.7487746, -0.6448548, -1.138227, 1, 1, 1, 1, 1,
-0.7475286, -1.095858, -2.517323, 1, 1, 1, 1, 1,
-0.7436077, 0.04527465, -0.4429281, 1, 1, 1, 1, 1,
-0.7420045, 0.4047951, -1.828795, 1, 1, 1, 1, 1,
-0.7396709, -0.4982228, -2.245959, 1, 1, 1, 1, 1,
-0.738027, -0.6027544, -2.233931, 1, 1, 1, 1, 1,
-0.7368581, -0.9581042, -1.890345, 1, 1, 1, 1, 1,
-0.7326063, 0.6657315, -1.127627, 1, 1, 1, 1, 1,
-0.7250807, -2.877409, -1.238245, 1, 1, 1, 1, 1,
-0.7143329, -0.5963563, -1.828835, 1, 1, 1, 1, 1,
-0.7130225, 2.207676, -1.040266, 1, 1, 1, 1, 1,
-0.7077233, 0.6750976, 0.01636419, 1, 1, 1, 1, 1,
-0.7058672, -1.536714, -2.219481, 1, 1, 1, 1, 1,
-0.7015955, 0.477733, -3.664757, 1, 1, 1, 1, 1,
-0.6986036, 0.773926, -1.155209, 1, 1, 1, 1, 1,
-0.6947879, 0.7390396, -0.5697013, 0, 0, 1, 1, 1,
-0.6903434, 0.7217481, -2.391302, 1, 0, 0, 1, 1,
-0.681145, 1.42892, 0.6875225, 1, 0, 0, 1, 1,
-0.6793336, 2.341447, -0.2706361, 1, 0, 0, 1, 1,
-0.6790028, 0.1123341, -2.086961, 1, 0, 0, 1, 1,
-0.6747891, -1.082931, -2.950858, 1, 0, 0, 1, 1,
-0.6738709, 0.2336466, 0.2972621, 0, 0, 0, 1, 1,
-0.6730621, -0.1776493, -0.4621734, 0, 0, 0, 1, 1,
-0.6680079, -0.06888939, -1.067357, 0, 0, 0, 1, 1,
-0.6671792, 1.444006, 0.6044549, 0, 0, 0, 1, 1,
-0.6667802, 0.2772985, -0.6414966, 0, 0, 0, 1, 1,
-0.6609488, -2.085901, -2.995916, 0, 0, 0, 1, 1,
-0.6593784, -0.08207007, -0.2247298, 0, 0, 0, 1, 1,
-0.6542364, -0.3675799, 0.2798517, 1, 1, 1, 1, 1,
-0.6449659, 1.049187, -1.177351, 1, 1, 1, 1, 1,
-0.6370873, -0.8218557, -2.825372, 1, 1, 1, 1, 1,
-0.6335127, -1.355867, -2.731656, 1, 1, 1, 1, 1,
-0.6331381, 1.075814, 0.6899788, 1, 1, 1, 1, 1,
-0.6325077, -0.03781423, 0.3151853, 1, 1, 1, 1, 1,
-0.6312775, -1.188868, -3.404898, 1, 1, 1, 1, 1,
-0.6273943, -0.04043453, -0.5573247, 1, 1, 1, 1, 1,
-0.6272755, -0.9040369, -4.460425, 1, 1, 1, 1, 1,
-0.6192498, 2.864722, 0.02166761, 1, 1, 1, 1, 1,
-0.6181674, 0.8743386, 1.799511, 1, 1, 1, 1, 1,
-0.6162562, -1.081459, -3.405069, 1, 1, 1, 1, 1,
-0.6111824, 0.8132334, -0.2819515, 1, 1, 1, 1, 1,
-0.6091467, -0.5751661, -2.441951, 1, 1, 1, 1, 1,
-0.6064118, 0.03704385, 0.1207629, 1, 1, 1, 1, 1,
-0.6035764, 0.3696189, -1.941756, 0, 0, 1, 1, 1,
-0.6024094, -0.8605117, -2.128707, 1, 0, 0, 1, 1,
-0.6018996, 1.404777, -0.075455, 1, 0, 0, 1, 1,
-0.6000831, 1.295983, -0.1025321, 1, 0, 0, 1, 1,
-0.5997593, 1.649215, -1.732459, 1, 0, 0, 1, 1,
-0.5916575, 0.757612, -2.95845, 1, 0, 0, 1, 1,
-0.5903904, -0.5272123, -2.746595, 0, 0, 0, 1, 1,
-0.5902278, 0.9771611, -0.432765, 0, 0, 0, 1, 1,
-0.5878839, 0.3693138, -0.5804768, 0, 0, 0, 1, 1,
-0.5826289, 1.162609, 0.8302783, 0, 0, 0, 1, 1,
-0.5791329, -1.635541, -2.098238, 0, 0, 0, 1, 1,
-0.5785732, -1.707127, -3.521465, 0, 0, 0, 1, 1,
-0.5776237, -0.09035115, -1.729045, 0, 0, 0, 1, 1,
-0.5775377, -2.280753, -4.411504, 1, 1, 1, 1, 1,
-0.5763827, -1.314327, -2.364085, 1, 1, 1, 1, 1,
-0.5702297, 0.1335455, -1.283754, 1, 1, 1, 1, 1,
-0.5684116, 0.9213207, -1.873897, 1, 1, 1, 1, 1,
-0.5682115, 1.557244, 0.06601787, 1, 1, 1, 1, 1,
-0.5681098, -0.441094, -3.430913, 1, 1, 1, 1, 1,
-0.5630538, -0.3150653, -3.129334, 1, 1, 1, 1, 1,
-0.5587633, 0.8974305, -0.6784517, 1, 1, 1, 1, 1,
-0.5583816, -0.9868479, -2.032834, 1, 1, 1, 1, 1,
-0.5582968, 0.5882272, -0.09398352, 1, 1, 1, 1, 1,
-0.5572397, -0.808749, -2.615844, 1, 1, 1, 1, 1,
-0.5545374, 0.004596277, -3.014963, 1, 1, 1, 1, 1,
-0.5504724, 0.4702045, -1.093102, 1, 1, 1, 1, 1,
-0.548691, 1.633529, 0.396356, 1, 1, 1, 1, 1,
-0.5421757, 0.7449239, 0.2779992, 1, 1, 1, 1, 1,
-0.5419728, 0.306224, -2.326145, 0, 0, 1, 1, 1,
-0.5412163, 0.9448028, -0.341194, 1, 0, 0, 1, 1,
-0.5388621, -1.373965, -4.491345, 1, 0, 0, 1, 1,
-0.5285167, 0.3287742, -0.5715067, 1, 0, 0, 1, 1,
-0.5259107, 1.297268, -1.848272, 1, 0, 0, 1, 1,
-0.5235997, 1.093847, -0.1931505, 1, 0, 0, 1, 1,
-0.5225351, 0.8619556, 0.9800404, 0, 0, 0, 1, 1,
-0.5187575, -0.8866631, -1.25977, 0, 0, 0, 1, 1,
-0.5174343, -1.034229, -0.552049, 0, 0, 0, 1, 1,
-0.5147744, 0.4622159, -1.765283, 0, 0, 0, 1, 1,
-0.5110874, 0.6871892, 0.2690919, 0, 0, 0, 1, 1,
-0.5107821, 0.4445438, -0.2244662, 0, 0, 0, 1, 1,
-0.5037786, -1.250121, -1.095079, 0, 0, 0, 1, 1,
-0.5032558, -0.7251612, -2.658789, 1, 1, 1, 1, 1,
-0.5014827, 0.7018434, -0.4499192, 1, 1, 1, 1, 1,
-0.5010023, -0.7818972, -1.689644, 1, 1, 1, 1, 1,
-0.4973638, -0.6687179, -2.609236, 1, 1, 1, 1, 1,
-0.4918219, -0.1538149, -2.374718, 1, 1, 1, 1, 1,
-0.4896096, 0.1159697, -1.151837, 1, 1, 1, 1, 1,
-0.4887267, -0.7450692, -2.217307, 1, 1, 1, 1, 1,
-0.4864918, -0.5125083, -1.554304, 1, 1, 1, 1, 1,
-0.4758103, -1.390886, -4.148913, 1, 1, 1, 1, 1,
-0.4747479, 0.7625459, 0.7879329, 1, 1, 1, 1, 1,
-0.4706744, 1.078172, -1.234715, 1, 1, 1, 1, 1,
-0.4692133, 0.8650864, -2.109608, 1, 1, 1, 1, 1,
-0.4683605, -0.5574663, -2.25036, 1, 1, 1, 1, 1,
-0.4679576, -0.237911, 0.4320071, 1, 1, 1, 1, 1,
-0.4676791, -0.3637033, -2.180015, 1, 1, 1, 1, 1,
-0.4670691, 1.448157, 0.3628099, 0, 0, 1, 1, 1,
-0.4638872, 0.5338486, -2.293648, 1, 0, 0, 1, 1,
-0.4610095, 0.2714877, -0.9407479, 1, 0, 0, 1, 1,
-0.4607852, -0.9668734, -2.383711, 1, 0, 0, 1, 1,
-0.4593007, 1.439763, 0.2432949, 1, 0, 0, 1, 1,
-0.4530389, 0.2628073, -0.8732427, 1, 0, 0, 1, 1,
-0.4525936, -0.1060665, -2.306166, 0, 0, 0, 1, 1,
-0.4511434, 0.3302462, 0.1338238, 0, 0, 0, 1, 1,
-0.4409459, -0.2323443, -2.919836, 0, 0, 0, 1, 1,
-0.4319361, -0.9537705, -2.992851, 0, 0, 0, 1, 1,
-0.4299798, -0.2765439, -3.810155, 0, 0, 0, 1, 1,
-0.4253531, -0.9434501, -3.837055, 0, 0, 0, 1, 1,
-0.4173588, -0.1749117, -0.7631574, 0, 0, 0, 1, 1,
-0.4169655, 1.852868, 0.8308986, 1, 1, 1, 1, 1,
-0.4163136, -0.939319, -3.548738, 1, 1, 1, 1, 1,
-0.412317, 0.6377618, -0.5694727, 1, 1, 1, 1, 1,
-0.4074545, 0.7669593, 1.65153, 1, 1, 1, 1, 1,
-0.4033297, -1.431834, -2.700818, 1, 1, 1, 1, 1,
-0.4029296, 1.074461, -0.5880139, 1, 1, 1, 1, 1,
-0.4000678, 0.4288775, -1.992139, 1, 1, 1, 1, 1,
-0.3989969, 1.507618, 1.103805, 1, 1, 1, 1, 1,
-0.3984598, 0.6256632, 0.1238553, 1, 1, 1, 1, 1,
-0.3958227, 0.766614, -2.21734, 1, 1, 1, 1, 1,
-0.3953518, -0.4190293, -3.110492, 1, 1, 1, 1, 1,
-0.3939031, -0.2264213, -2.998494, 1, 1, 1, 1, 1,
-0.3934565, 1.493387, -0.2923318, 1, 1, 1, 1, 1,
-0.3882716, -0.2368545, -1.54995, 1, 1, 1, 1, 1,
-0.3876739, 0.08095611, -2.185491, 1, 1, 1, 1, 1,
-0.3874049, 0.4382741, 1.318678, 0, 0, 1, 1, 1,
-0.3820563, -1.956754, -2.076528, 1, 0, 0, 1, 1,
-0.3817123, -1.194242, -1.863064, 1, 0, 0, 1, 1,
-0.3803189, 0.4383077, 0.009467038, 1, 0, 0, 1, 1,
-0.37765, -0.6109363, -0.366087, 1, 0, 0, 1, 1,
-0.3758848, -1.976553, -2.841537, 1, 0, 0, 1, 1,
-0.3755088, 1.514515, -1.615734, 0, 0, 0, 1, 1,
-0.3749863, -0.4471713, -1.528668, 0, 0, 0, 1, 1,
-0.3697725, -1.205043, -2.510199, 0, 0, 0, 1, 1,
-0.3649753, 0.5916967, -1.757428, 0, 0, 0, 1, 1,
-0.3598531, 0.6407164, -1.694315, 0, 0, 0, 1, 1,
-0.3514464, -1.332104, -2.988683, 0, 0, 0, 1, 1,
-0.3511202, -0.04860614, -0.6120285, 0, 0, 0, 1, 1,
-0.3495667, 0.05352233, -1.096902, 1, 1, 1, 1, 1,
-0.3487886, 0.000246711, -2.327662, 1, 1, 1, 1, 1,
-0.3447618, -0.09345182, -0.9582791, 1, 1, 1, 1, 1,
-0.3427413, 1.231991, 0.1216581, 1, 1, 1, 1, 1,
-0.3421785, -1.328365, -2.298931, 1, 1, 1, 1, 1,
-0.3420691, -0.9093071, -3.29637, 1, 1, 1, 1, 1,
-0.3386218, 1.474937, 0.05987771, 1, 1, 1, 1, 1,
-0.3374474, 0.4405222, 0.08004846, 1, 1, 1, 1, 1,
-0.3350421, -0.7167487, -1.975849, 1, 1, 1, 1, 1,
-0.3349363, 0.5182468, -0.9001192, 1, 1, 1, 1, 1,
-0.3349324, 0.1226061, -0.9023643, 1, 1, 1, 1, 1,
-0.3281448, -0.8971218, -2.95483, 1, 1, 1, 1, 1,
-0.3276634, 1.210306, -0.07676378, 1, 1, 1, 1, 1,
-0.3272904, 0.5936268, -0.1098317, 1, 1, 1, 1, 1,
-0.3251466, -0.6224921, -3.678094, 1, 1, 1, 1, 1,
-0.3244701, 0.1552828, -0.3404289, 0, 0, 1, 1, 1,
-0.3231094, -1.894343, -4.624379, 1, 0, 0, 1, 1,
-0.3220012, 0.864923, 1.284235, 1, 0, 0, 1, 1,
-0.3177924, 1.409526, -0.3865078, 1, 0, 0, 1, 1,
-0.3093758, 0.3212317, -1.042501, 1, 0, 0, 1, 1,
-0.3045314, -0.4823381, -3.816671, 1, 0, 0, 1, 1,
-0.2960147, 1.02429, -0.7984513, 0, 0, 0, 1, 1,
-0.2948857, 1.221883, -0.5511385, 0, 0, 0, 1, 1,
-0.2899057, -0.08492708, -1.264544, 0, 0, 0, 1, 1,
-0.2849953, -1.95002, -2.238201, 0, 0, 0, 1, 1,
-0.2848948, -0.3371944, -2.941885, 0, 0, 0, 1, 1,
-0.2824171, 0.3121528, -1.363628, 0, 0, 0, 1, 1,
-0.2767057, 0.09326847, -1.978933, 0, 0, 0, 1, 1,
-0.2751988, 0.4647025, 0.1505652, 1, 1, 1, 1, 1,
-0.2721365, -0.5009302, -4.594761, 1, 1, 1, 1, 1,
-0.2720482, 0.3130613, -1.520152, 1, 1, 1, 1, 1,
-0.2686757, 0.6817921, -0.7476243, 1, 1, 1, 1, 1,
-0.2620924, 0.8249571, 0.7867257, 1, 1, 1, 1, 1,
-0.2589072, -1.059003, -4.944706, 1, 1, 1, 1, 1,
-0.2581248, 0.5735604, -1.73914, 1, 1, 1, 1, 1,
-0.257575, 0.2228734, -0.9744576, 1, 1, 1, 1, 1,
-0.255969, 0.9911787, -0.8314951, 1, 1, 1, 1, 1,
-0.2523022, -1.271407, -1.743036, 1, 1, 1, 1, 1,
-0.2478387, 0.6869798, -0.2275633, 1, 1, 1, 1, 1,
-0.2470826, 1.15507, -0.384368, 1, 1, 1, 1, 1,
-0.245736, -1.138063, -3.996548, 1, 1, 1, 1, 1,
-0.2411644, 0.7551357, -1.077399, 1, 1, 1, 1, 1,
-0.2397374, 0.3360875, -1.130927, 1, 1, 1, 1, 1,
-0.2389528, 0.6934478, -2.92451, 0, 0, 1, 1, 1,
-0.2382585, -0.176276, -3.094007, 1, 0, 0, 1, 1,
-0.2355191, -0.3951657, -2.452242, 1, 0, 0, 1, 1,
-0.2332057, 0.8847371, -0.4858443, 1, 0, 0, 1, 1,
-0.2318115, 0.3499025, 0.6940777, 1, 0, 0, 1, 1,
-0.2305783, -0.1594036, -2.145171, 1, 0, 0, 1, 1,
-0.2292813, 0.8290315, 1.031894, 0, 0, 0, 1, 1,
-0.2292203, -1.359689, -1.622999, 0, 0, 0, 1, 1,
-0.2285453, -1.769551, -2.524103, 0, 0, 0, 1, 1,
-0.2274846, -0.356185, -1.720331, 0, 0, 0, 1, 1,
-0.2199896, 1.210126, -0.2135005, 0, 0, 0, 1, 1,
-0.2194411, 0.2014883, -0.6085489, 0, 0, 0, 1, 1,
-0.2134822, 0.3565294, -2.022252, 0, 0, 0, 1, 1,
-0.2134222, 1.223441, -1.011044, 1, 1, 1, 1, 1,
-0.2102504, -0.8315104, -2.911338, 1, 1, 1, 1, 1,
-0.2087442, 1.054289, 1.188379, 1, 1, 1, 1, 1,
-0.1960962, -1.82513, -3.23207, 1, 1, 1, 1, 1,
-0.1928044, 0.2950698, 0.2616856, 1, 1, 1, 1, 1,
-0.1822228, -2.041641, -4.379941, 1, 1, 1, 1, 1,
-0.1813198, 0.5039803, -1.858468, 1, 1, 1, 1, 1,
-0.1769164, -0.3090142, -3.829125, 1, 1, 1, 1, 1,
-0.1762181, -0.7217579, -3.398535, 1, 1, 1, 1, 1,
-0.1682896, 0.1280224, -1.220583, 1, 1, 1, 1, 1,
-0.165784, -0.3197857, -1.841893, 1, 1, 1, 1, 1,
-0.1652237, -0.5978467, -1.614549, 1, 1, 1, 1, 1,
-0.1596636, -1.075092, -2.621887, 1, 1, 1, 1, 1,
-0.1581567, -1.331704, -3.874077, 1, 1, 1, 1, 1,
-0.1570909, -0.8691973, -2.5709, 1, 1, 1, 1, 1,
-0.1570784, -1.070959, -2.455799, 0, 0, 1, 1, 1,
-0.1544341, 0.3339529, -0.8649845, 1, 0, 0, 1, 1,
-0.1541258, -0.5180869, -2.027374, 1, 0, 0, 1, 1,
-0.1538059, 0.5196512, 0.7266105, 1, 0, 0, 1, 1,
-0.1516153, -1.535114, -1.96209, 1, 0, 0, 1, 1,
-0.1514949, 0.3857314, -0.06410789, 1, 0, 0, 1, 1,
-0.1509828, -0.1853059, -0.7775292, 0, 0, 0, 1, 1,
-0.1486916, -0.2358813, -3.064238, 0, 0, 0, 1, 1,
-0.1475869, 0.3059105, 0.3387405, 0, 0, 0, 1, 1,
-0.1396147, 0.1935386, -0.07979214, 0, 0, 0, 1, 1,
-0.1394172, -0.1533969, -1.892024, 0, 0, 0, 1, 1,
-0.1382467, -0.8436053, -2.361617, 0, 0, 0, 1, 1,
-0.1380172, 0.4776263, 0.9460942, 0, 0, 0, 1, 1,
-0.1360039, -0.4706576, -3.14085, 1, 1, 1, 1, 1,
-0.1308821, 1.172202, -0.4760618, 1, 1, 1, 1, 1,
-0.1301341, 0.6492664, -0.51946, 1, 1, 1, 1, 1,
-0.1290838, 0.5120673, -0.9903697, 1, 1, 1, 1, 1,
-0.1289673, -0.08560053, -2.502152, 1, 1, 1, 1, 1,
-0.1280301, 0.4172827, 0.003951367, 1, 1, 1, 1, 1,
-0.1271422, -0.06508718, -2.580655, 1, 1, 1, 1, 1,
-0.123339, -0.2983579, -1.529377, 1, 1, 1, 1, 1,
-0.1230277, 1.196068, -0.1072394, 1, 1, 1, 1, 1,
-0.117605, 1.399163, -2.123508, 1, 1, 1, 1, 1,
-0.1163573, -0.1699178, -3.481949, 1, 1, 1, 1, 1,
-0.1159889, -1.626906, -2.872092, 1, 1, 1, 1, 1,
-0.1154746, 0.8229463, -0.09443187, 1, 1, 1, 1, 1,
-0.1128481, 0.1009988, -0.3306802, 1, 1, 1, 1, 1,
-0.1117735, 1.153398, -0.8649819, 1, 1, 1, 1, 1,
-0.1116618, -0.9355797, -3.806291, 0, 0, 1, 1, 1,
-0.1112211, -0.07531202, -0.422522, 1, 0, 0, 1, 1,
-0.1104475, 1.325568, 1.015697, 1, 0, 0, 1, 1,
-0.1101613, 0.1016837, 0.2634346, 1, 0, 0, 1, 1,
-0.1068157, 0.1357664, 0.7984171, 1, 0, 0, 1, 1,
-0.1047421, 1.88426, -0.3210237, 1, 0, 0, 1, 1,
-0.1038825, -0.5355039, -2.254578, 0, 0, 0, 1, 1,
-0.1032455, 1.111635, 0.5106538, 0, 0, 0, 1, 1,
-0.1003672, 0.3692017, 0.005369534, 0, 0, 0, 1, 1,
-0.100121, -1.221168, -2.269495, 0, 0, 0, 1, 1,
-0.09520818, 0.6526302, 0.5590359, 0, 0, 0, 1, 1,
-0.09209959, 0.5990844, 1.8176, 0, 0, 0, 1, 1,
-0.08643428, 0.3132457, -0.4928476, 0, 0, 0, 1, 1,
-0.08404782, 0.5768479, 0.1802927, 1, 1, 1, 1, 1,
-0.08232061, -0.9732648, -2.831162, 1, 1, 1, 1, 1,
-0.08004441, 0.9069069, 1.315392, 1, 1, 1, 1, 1,
-0.07950355, 0.4154857, 0.8704281, 1, 1, 1, 1, 1,
-0.07809406, 1.001848, -0.04761374, 1, 1, 1, 1, 1,
-0.07314421, 0.6630159, 0.9394694, 1, 1, 1, 1, 1,
-0.07032055, -0.7754785, -2.911733, 1, 1, 1, 1, 1,
-0.07014882, -0.7353415, -2.394272, 1, 1, 1, 1, 1,
-0.06911997, -0.3237098, -3.595045, 1, 1, 1, 1, 1,
-0.06727754, 1.524246, 0.3611227, 1, 1, 1, 1, 1,
-0.06631394, 1.454742, 0.8326276, 1, 1, 1, 1, 1,
-0.06201655, 0.6177628, -1.443137, 1, 1, 1, 1, 1,
-0.0615017, 0.5786688, 1.624237, 1, 1, 1, 1, 1,
-0.0611868, 1.500842, 0.8318803, 1, 1, 1, 1, 1,
-0.06050788, -1.401986, -3.785467, 1, 1, 1, 1, 1,
-0.06017463, 1.042781, 1.23038, 0, 0, 1, 1, 1,
-0.05399708, 2.052521, -1.815652, 1, 0, 0, 1, 1,
-0.05248377, -0.4134834, -3.900526, 1, 0, 0, 1, 1,
-0.04839066, -0.08777, -3.083378, 1, 0, 0, 1, 1,
-0.04475759, 0.9221048, -0.331388, 1, 0, 0, 1, 1,
-0.03810216, -0.2737049, -2.965153, 1, 0, 0, 1, 1,
-0.03752477, -0.1665587, -4.152886, 0, 0, 0, 1, 1,
-0.03600946, 0.1884705, -0.5470752, 0, 0, 0, 1, 1,
-0.03599305, -0.6887466, -3.745901, 0, 0, 0, 1, 1,
-0.0304783, -0.8801295, -4.482997, 0, 0, 0, 1, 1,
-0.0298619, 1.312087, 0.1245134, 0, 0, 0, 1, 1,
-0.02363932, 0.8678057, -0.3957004, 0, 0, 0, 1, 1,
-0.01775057, -0.6011863, -1.547638, 0, 0, 0, 1, 1,
-0.01762583, 1.772039, 0.9420303, 1, 1, 1, 1, 1,
-0.01259749, -0.5831247, -3.428342, 1, 1, 1, 1, 1,
-0.01212762, 1.118735, -1.848086, 1, 1, 1, 1, 1,
-0.009216707, 0.6943284, -0.6667238, 1, 1, 1, 1, 1,
-0.005892931, 0.6735372, 1.575336, 1, 1, 1, 1, 1,
-0.004326221, 0.9266404, -0.9578273, 1, 1, 1, 1, 1,
0.0008981396, 1.330587, -0.5542523, 1, 1, 1, 1, 1,
0.001054132, 1.242822, 0.3629562, 1, 1, 1, 1, 1,
0.003469129, -0.6727359, 2.905975, 1, 1, 1, 1, 1,
0.005451336, 2.115597, -0.1941636, 1, 1, 1, 1, 1,
0.008732573, 0.6096869, -0.3872897, 1, 1, 1, 1, 1,
0.009531389, -0.9534835, 1.347279, 1, 1, 1, 1, 1,
0.01153102, -0.4348577, 3.327743, 1, 1, 1, 1, 1,
0.01241398, -0.288564, 4.003134, 1, 1, 1, 1, 1,
0.02573599, 1.259281, 0.6707717, 1, 1, 1, 1, 1,
0.02681513, 1.023263, 0.4862821, 0, 0, 1, 1, 1,
0.02833588, 1.142802, 0.2186368, 1, 0, 0, 1, 1,
0.02852619, 0.6688659, 0.137029, 1, 0, 0, 1, 1,
0.03204613, -1.422328, 3.993637, 1, 0, 0, 1, 1,
0.03344383, -0.9434998, 3.210742, 1, 0, 0, 1, 1,
0.0370228, 1.018359, 0.4039637, 1, 0, 0, 1, 1,
0.03815189, -1.314894, 3.157059, 0, 0, 0, 1, 1,
0.03864122, 0.4328932, 0.9345132, 0, 0, 0, 1, 1,
0.03941463, -1.162693, 4.854613, 0, 0, 0, 1, 1,
0.04271613, 2.462938, 1.8983, 0, 0, 0, 1, 1,
0.04556895, -0.4710947, 4.252344, 0, 0, 0, 1, 1,
0.04603045, -1.694204, 3.612919, 0, 0, 0, 1, 1,
0.05788497, 0.1975956, 2.0398, 0, 0, 0, 1, 1,
0.05845206, -0.8674622, 3.394866, 1, 1, 1, 1, 1,
0.06123999, 0.3914259, -0.9767686, 1, 1, 1, 1, 1,
0.07073722, 0.6442352, 1.179609, 1, 1, 1, 1, 1,
0.07846696, 1.771577, -2.423973, 1, 1, 1, 1, 1,
0.08170386, -1.099422, 4.551398, 1, 1, 1, 1, 1,
0.08250186, 1.499459, 0.405877, 1, 1, 1, 1, 1,
0.08276215, 0.5450348, -0.207185, 1, 1, 1, 1, 1,
0.08344766, -0.1005052, 1.614831, 1, 1, 1, 1, 1,
0.08426979, -0.7071531, 2.953776, 1, 1, 1, 1, 1,
0.08484998, 0.1782773, 0.7800037, 1, 1, 1, 1, 1,
0.08606236, 1.011367, 0.8604701, 1, 1, 1, 1, 1,
0.08928274, -0.7691491, 2.798553, 1, 1, 1, 1, 1,
0.09039923, -0.2815094, 3.529443, 1, 1, 1, 1, 1,
0.09161008, 1.659475, -0.5318064, 1, 1, 1, 1, 1,
0.09192892, 0.8432276, 0.4811968, 1, 1, 1, 1, 1,
0.09198342, -0.6158933, -0.1533419, 0, 0, 1, 1, 1,
0.09334037, 0.2181015, -0.1836004, 1, 0, 0, 1, 1,
0.09382173, 0.6759032, 1.60012, 1, 0, 0, 1, 1,
0.09573268, 1.67432, 0.5905482, 1, 0, 0, 1, 1,
0.09684414, 0.8767005, 0.5209913, 1, 0, 0, 1, 1,
0.1009144, -1.453305, 2.36451, 1, 0, 0, 1, 1,
0.1049144, -1.644574, 3.893696, 0, 0, 0, 1, 1,
0.1050678, -0.266067, 2.991806, 0, 0, 0, 1, 1,
0.1091423, -0.3550528, 2.975594, 0, 0, 0, 1, 1,
0.1123106, 0.6036037, -0.7794676, 0, 0, 0, 1, 1,
0.1193175, -0.3738145, 3.223421, 0, 0, 0, 1, 1,
0.1193872, -1.452476, 2.783866, 0, 0, 0, 1, 1,
0.1265128, 0.1407792, 1.575103, 0, 0, 0, 1, 1,
0.1266113, -1.969746, 2.722942, 1, 1, 1, 1, 1,
0.1268012, -0.5408776, 3.516851, 1, 1, 1, 1, 1,
0.1280305, -0.8549676, 2.763444, 1, 1, 1, 1, 1,
0.1284105, 1.333047, 0.1984852, 1, 1, 1, 1, 1,
0.1340447, -0.9310338, 4.084542, 1, 1, 1, 1, 1,
0.144608, -0.04327153, 2.151218, 1, 1, 1, 1, 1,
0.1465538, 0.3994722, 1.323812, 1, 1, 1, 1, 1,
0.1485714, 0.1182742, 0.6494903, 1, 1, 1, 1, 1,
0.1546521, 0.2779386, -0.05568551, 1, 1, 1, 1, 1,
0.1577995, -1.82031, 2.539695, 1, 1, 1, 1, 1,
0.1600823, -1.063884, 3.499723, 1, 1, 1, 1, 1,
0.1610019, -2.240072, 4.190855, 1, 1, 1, 1, 1,
0.1658715, 0.1031464, 1.570805, 1, 1, 1, 1, 1,
0.1663375, 0.6295726, -0.8880413, 1, 1, 1, 1, 1,
0.1667937, 1.069039, 0.5703093, 1, 1, 1, 1, 1,
0.1722761, -1.209136, 2.393904, 0, 0, 1, 1, 1,
0.1794323, 0.0884321, 1.125848, 1, 0, 0, 1, 1,
0.1828924, 1.535204, -0.02628939, 1, 0, 0, 1, 1,
0.1843165, -1.452053, 3.200341, 1, 0, 0, 1, 1,
0.1853589, -1.232709, 3.252424, 1, 0, 0, 1, 1,
0.1856751, -0.4800607, 2.529684, 1, 0, 0, 1, 1,
0.1873255, 0.6363594, 1.282311, 0, 0, 0, 1, 1,
0.1924713, -0.361153, 3.259066, 0, 0, 0, 1, 1,
0.1977952, 0.2891731, 1.490874, 0, 0, 0, 1, 1,
0.20016, 0.434554, 0.8947465, 0, 0, 0, 1, 1,
0.205516, -1.86196, 2.258775, 0, 0, 0, 1, 1,
0.2055313, -0.5434592, 2.540241, 0, 0, 0, 1, 1,
0.2171747, 0.7313549, 1.653697, 0, 0, 0, 1, 1,
0.2231563, -0.7332813, 2.19206, 1, 1, 1, 1, 1,
0.2232389, 0.5016716, 0.3142353, 1, 1, 1, 1, 1,
0.2241895, -1.289095, 3.04991, 1, 1, 1, 1, 1,
0.2296455, -0.6368708, 1.343031, 1, 1, 1, 1, 1,
0.2301383, 0.4531353, 0.8210104, 1, 1, 1, 1, 1,
0.2362103, 0.9675186, 1.072153, 1, 1, 1, 1, 1,
0.2368452, -0.6636146, 2.955814, 1, 1, 1, 1, 1,
0.240446, 2.094208, 0.04787629, 1, 1, 1, 1, 1,
0.2485971, -0.3343969, 3.779703, 1, 1, 1, 1, 1,
0.2489467, 0.04377284, -0.2465535, 1, 1, 1, 1, 1,
0.2525069, -1.367863, 3.189395, 1, 1, 1, 1, 1,
0.2585334, 1.090422, -0.8852916, 1, 1, 1, 1, 1,
0.2599817, 1.099247, -0.4095099, 1, 1, 1, 1, 1,
0.2635797, 1.391734, 0.07123334, 1, 1, 1, 1, 1,
0.2638239, -1.259864, 3.75734, 1, 1, 1, 1, 1,
0.2723048, 0.2922516, -0.1572586, 0, 0, 1, 1, 1,
0.2735514, 1.112252, -0.1491903, 1, 0, 0, 1, 1,
0.278042, 1.054835, 1.644551, 1, 0, 0, 1, 1,
0.2836708, 0.9746532, 1.438734, 1, 0, 0, 1, 1,
0.2837739, -0.6730196, 1.590786, 1, 0, 0, 1, 1,
0.2895817, -1.911968, 4.35359, 1, 0, 0, 1, 1,
0.290638, 1.209619, -0.1038231, 0, 0, 0, 1, 1,
0.2949314, 0.8720059, 0.2396294, 0, 0, 0, 1, 1,
0.296242, -0.1005825, 1.591331, 0, 0, 0, 1, 1,
0.2972172, -0.4505859, 3.057172, 0, 0, 0, 1, 1,
0.298375, -0.0908889, 0.1753289, 0, 0, 0, 1, 1,
0.2994265, 0.9206155, 1.070267, 0, 0, 0, 1, 1,
0.3003794, 1.803227, -0.9150904, 0, 0, 0, 1, 1,
0.3080177, 1.404682, -0.6575375, 1, 1, 1, 1, 1,
0.3104628, -0.2244242, 0.3581794, 1, 1, 1, 1, 1,
0.3115177, -0.3213598, 2.534879, 1, 1, 1, 1, 1,
0.3139879, -2.302267, 4.697763, 1, 1, 1, 1, 1,
0.3140078, 0.9681228, 1.544852, 1, 1, 1, 1, 1,
0.314947, -0.3578449, 3.056595, 1, 1, 1, 1, 1,
0.3162982, -0.2901185, 1.578805, 1, 1, 1, 1, 1,
0.3191676, 0.9593512, 0.9759012, 1, 1, 1, 1, 1,
0.3213205, -0.4179179, 2.034458, 1, 1, 1, 1, 1,
0.3235475, -0.4791468, 3.43875, 1, 1, 1, 1, 1,
0.3257735, -0.4467959, 1.963033, 1, 1, 1, 1, 1,
0.3303692, 0.07956634, 2.204314, 1, 1, 1, 1, 1,
0.3322678, 1.170158, -0.1071432, 1, 1, 1, 1, 1,
0.33714, -1.14186, 3.006978, 1, 1, 1, 1, 1,
0.3434338, -0.9267052, 2.855892, 1, 1, 1, 1, 1,
0.3490169, 0.09269243, 1.011577, 0, 0, 1, 1, 1,
0.3527245, -2.126021, 2.41322, 1, 0, 0, 1, 1,
0.3587289, 0.3909854, 1.084736, 1, 0, 0, 1, 1,
0.3598287, 0.05262028, 2.307849, 1, 0, 0, 1, 1,
0.3618924, 0.336749, -0.08257926, 1, 0, 0, 1, 1,
0.3629059, -0.4624055, 1.337083, 1, 0, 0, 1, 1,
0.363095, -1.73284, 3.564318, 0, 0, 0, 1, 1,
0.3652057, -0.608498, 2.698597, 0, 0, 0, 1, 1,
0.3655352, 0.7792313, -0.06214561, 0, 0, 0, 1, 1,
0.3662647, -0.7140695, 2.934847, 0, 0, 0, 1, 1,
0.3677563, 0.2803821, 1.755555, 0, 0, 0, 1, 1,
0.3692309, 2.033873, 0.8654149, 0, 0, 0, 1, 1,
0.3703486, 0.265301, 0.6823909, 0, 0, 0, 1, 1,
0.3710616, -0.4359626, 3.427469, 1, 1, 1, 1, 1,
0.3732972, 0.8073172, 0.7858065, 1, 1, 1, 1, 1,
0.3740629, 1.228764, 1.457475, 1, 1, 1, 1, 1,
0.3746194, 0.06261302, 2.363597, 1, 1, 1, 1, 1,
0.3824019, 0.4927957, -0.6414844, 1, 1, 1, 1, 1,
0.3829685, -0.9319372, 2.44587, 1, 1, 1, 1, 1,
0.3834358, 0.07619276, 3.438658, 1, 1, 1, 1, 1,
0.3856473, -1.534058, 2.463486, 1, 1, 1, 1, 1,
0.3875028, -1.087429, 2.358256, 1, 1, 1, 1, 1,
0.3875377, 0.92558, 0.883675, 1, 1, 1, 1, 1,
0.3897842, 1.184904, 0.4378495, 1, 1, 1, 1, 1,
0.3932266, -0.3720571, 3.253013, 1, 1, 1, 1, 1,
0.3936873, 0.07173876, 1.338438, 1, 1, 1, 1, 1,
0.3946205, -0.666005, 3.234878, 1, 1, 1, 1, 1,
0.4002168, -0.6598781, 2.101554, 1, 1, 1, 1, 1,
0.4065554, 1.153942, -0.1307251, 0, 0, 1, 1, 1,
0.407185, 0.2442982, 1.93765, 1, 0, 0, 1, 1,
0.4084963, -0.04592401, 2.594195, 1, 0, 0, 1, 1,
0.4095329, -1.293263, 2.423199, 1, 0, 0, 1, 1,
0.4140687, -0.4853067, 3.1972, 1, 0, 0, 1, 1,
0.4145761, 0.5186962, 0.4621464, 1, 0, 0, 1, 1,
0.4204706, -0.8516866, 2.9768, 0, 0, 0, 1, 1,
0.4227514, 1.088051, 1.18435, 0, 0, 0, 1, 1,
0.4230428, 0.04977819, 1.98428, 0, 0, 0, 1, 1,
0.4259797, -0.8240696, 3.214768, 0, 0, 0, 1, 1,
0.4264386, -2.090181, 2.952765, 0, 0, 0, 1, 1,
0.4296193, -1.021262, 2.646934, 0, 0, 0, 1, 1,
0.4312647, 0.9664351, 0.9614335, 0, 0, 0, 1, 1,
0.4353402, 0.4003119, 2.069953, 1, 1, 1, 1, 1,
0.4416625, 0.7658041, 0.2282414, 1, 1, 1, 1, 1,
0.4450311, 0.7735036, 0.2022613, 1, 1, 1, 1, 1,
0.4492403, 0.7038035, 0.7063733, 1, 1, 1, 1, 1,
0.4509539, 1.919709, -0.3389133, 1, 1, 1, 1, 1,
0.4515626, 0.02002465, 2.545418, 1, 1, 1, 1, 1,
0.4520499, -0.6984653, 2.28425, 1, 1, 1, 1, 1,
0.4545981, -0.538255, 3.395516, 1, 1, 1, 1, 1,
0.4549955, -0.707318, 2.494943, 1, 1, 1, 1, 1,
0.4601165, -0.05026697, 1.228875, 1, 1, 1, 1, 1,
0.4613163, 0.1356138, 2.5697, 1, 1, 1, 1, 1,
0.4629627, -1.934355, 3.070541, 1, 1, 1, 1, 1,
0.4670938, -0.2677294, 1.617843, 1, 1, 1, 1, 1,
0.4730732, 1.130541, 0.1513051, 1, 1, 1, 1, 1,
0.4763592, -0.8490346, 4.130272, 1, 1, 1, 1, 1,
0.478437, -0.6508281, 1.436928, 0, 0, 1, 1, 1,
0.4790779, -1.534748, 2.463943, 1, 0, 0, 1, 1,
0.4927915, 0.8325919, 0.6145868, 1, 0, 0, 1, 1,
0.4980776, -1.130995, 1.918144, 1, 0, 0, 1, 1,
0.5019792, -0.3670181, 1.546497, 1, 0, 0, 1, 1,
0.5021284, -0.3592591, 2.314444, 1, 0, 0, 1, 1,
0.505453, 0.6096807, 0.4627389, 0, 0, 0, 1, 1,
0.5067675, 1.721917, 0.04626684, 0, 0, 0, 1, 1,
0.5079691, 1.234351, -1.256018, 0, 0, 0, 1, 1,
0.5126106, -0.7802626, 2.303174, 0, 0, 0, 1, 1,
0.5126376, -0.64982, 2.535765, 0, 0, 0, 1, 1,
0.5150271, 0.5537303, 1.860356, 0, 0, 0, 1, 1,
0.5170721, 0.5952129, -0.741365, 0, 0, 0, 1, 1,
0.5182229, -0.7334716, 2.537346, 1, 1, 1, 1, 1,
0.5223, -0.5249261, 2.682478, 1, 1, 1, 1, 1,
0.5227112, 0.1791003, 0.2800328, 1, 1, 1, 1, 1,
0.5269077, 0.7107456, 0.5602993, 1, 1, 1, 1, 1,
0.5294084, -0.3887801, 1.091989, 1, 1, 1, 1, 1,
0.5321552, 0.9043041, 0.3078298, 1, 1, 1, 1, 1,
0.540207, -0.1878924, 1.441866, 1, 1, 1, 1, 1,
0.5403503, -1.734644, 0.9946536, 1, 1, 1, 1, 1,
0.5417237, -0.1110677, 3.582708, 1, 1, 1, 1, 1,
0.5492064, 0.9567623, 0.7722445, 1, 1, 1, 1, 1,
0.5559114, 2.506765, -0.006100928, 1, 1, 1, 1, 1,
0.5610928, 0.0417567, 1.806576, 1, 1, 1, 1, 1,
0.563241, 1.374503, -1.245001, 1, 1, 1, 1, 1,
0.5682458, 1.268454, 0.7158422, 1, 1, 1, 1, 1,
0.5705297, -2.534124, 2.744152, 1, 1, 1, 1, 1,
0.5763683, 0.1837967, 0.6417248, 0, 0, 1, 1, 1,
0.5765184, 1.089162, -0.03787253, 1, 0, 0, 1, 1,
0.5769605, -0.4161079, 0.7443723, 1, 0, 0, 1, 1,
0.5779759, 2.370078, 0.7975965, 1, 0, 0, 1, 1,
0.5796216, -1.320786, 3.066423, 1, 0, 0, 1, 1,
0.5801522, -0.4308869, 2.967407, 1, 0, 0, 1, 1,
0.5856903, 0.002111434, 3.893832, 0, 0, 0, 1, 1,
0.5917761, 0.7418879, 0.7907256, 0, 0, 0, 1, 1,
0.593782, 1.346562, 1.860235, 0, 0, 0, 1, 1,
0.6151342, 0.01034697, 2.344933, 0, 0, 0, 1, 1,
0.6199539, -1.42022, 3.750882, 0, 0, 0, 1, 1,
0.6208173, 0.3707186, -0.1149904, 0, 0, 0, 1, 1,
0.6228743, 0.3051715, -0.1834678, 0, 0, 0, 1, 1,
0.6305124, 0.9059645, -0.5903777, 1, 1, 1, 1, 1,
0.6305889, 1.367951, 1.078249, 1, 1, 1, 1, 1,
0.6354718, -0.1529738, 2.448324, 1, 1, 1, 1, 1,
0.6357909, -0.08701415, 1.387522, 1, 1, 1, 1, 1,
0.6363121, -0.3072256, 1.891941, 1, 1, 1, 1, 1,
0.6364896, 1.208484, -0.6542722, 1, 1, 1, 1, 1,
0.640328, -0.2912199, 3.243983, 1, 1, 1, 1, 1,
0.6426081, 0.6597924, 2.119925, 1, 1, 1, 1, 1,
0.6440282, -1.03039, 3.915023, 1, 1, 1, 1, 1,
0.6473173, -0.2490298, 1.036785, 1, 1, 1, 1, 1,
0.6528716, 1.050746, 0.2780741, 1, 1, 1, 1, 1,
0.661237, 0.2398792, -0.4759718, 1, 1, 1, 1, 1,
0.6616449, -0.1827994, 0.1484163, 1, 1, 1, 1, 1,
0.665594, 0.6813559, 0.6809545, 1, 1, 1, 1, 1,
0.6684348, 0.169516, -0.03441169, 1, 1, 1, 1, 1,
0.6755053, 1.689258, -0.2371325, 0, 0, 1, 1, 1,
0.6758276, -0.3504632, 1.511693, 1, 0, 0, 1, 1,
0.6807362, 0.2357283, 0.7624727, 1, 0, 0, 1, 1,
0.6827597, 0.009098098, 0.9811755, 1, 0, 0, 1, 1,
0.6880456, 0.3583936, 1.228194, 1, 0, 0, 1, 1,
0.6948671, 0.7151581, 0.001355215, 1, 0, 0, 1, 1,
0.6992302, 0.1922792, 1.028507, 0, 0, 0, 1, 1,
0.7032627, -0.6003494, 2.199124, 0, 0, 0, 1, 1,
0.7048272, -0.08491322, 2.77162, 0, 0, 0, 1, 1,
0.7092231, 0.03451662, 1.519924, 0, 0, 0, 1, 1,
0.7109626, -0.04580034, 1.588261, 0, 0, 0, 1, 1,
0.7146261, 1.074113, 1.516542, 0, 0, 0, 1, 1,
0.7201892, -0.1113203, 2.87333, 0, 0, 0, 1, 1,
0.7223729, 0.3480873, 0.63134, 1, 1, 1, 1, 1,
0.7254034, -1.596446, 1.157483, 1, 1, 1, 1, 1,
0.7298534, -0.2221577, 3.355473, 1, 1, 1, 1, 1,
0.7394134, -1.763417, 2.110943, 1, 1, 1, 1, 1,
0.7398393, -0.891774, 1.25262, 1, 1, 1, 1, 1,
0.7600889, -0.6778035, 1.536512, 1, 1, 1, 1, 1,
0.760576, 2.067676, 1.487237, 1, 1, 1, 1, 1,
0.7647312, 1.860242, 2.081011, 1, 1, 1, 1, 1,
0.7653834, -0.3721085, 1.83886, 1, 1, 1, 1, 1,
0.7680553, -0.5358511, 3.222188, 1, 1, 1, 1, 1,
0.7707604, -1.174682, 1.549844, 1, 1, 1, 1, 1,
0.7734239, 0.6749771, -0.2580763, 1, 1, 1, 1, 1,
0.7741697, -0.9342902, 3.436555, 1, 1, 1, 1, 1,
0.7764504, -0.07882781, 1.661824, 1, 1, 1, 1, 1,
0.7811686, -1.021761, 1.642202, 1, 1, 1, 1, 1,
0.7900216, -0.1016696, 2.771509, 0, 0, 1, 1, 1,
0.7912033, 0.1088133, -0.8690746, 1, 0, 0, 1, 1,
0.7922013, 0.2117162, 1.868485, 1, 0, 0, 1, 1,
0.7936984, 0.4483597, 0.635298, 1, 0, 0, 1, 1,
0.7990639, 1.009645, 0.1722155, 1, 0, 0, 1, 1,
0.8026222, 0.5791411, 1.877758, 1, 0, 0, 1, 1,
0.8055332, 0.5686672, 2.046323, 0, 0, 0, 1, 1,
0.8110736, -1.179762, 1.35758, 0, 0, 0, 1, 1,
0.8133401, -0.8338323, 2.485973, 0, 0, 0, 1, 1,
0.813855, 0.8818479, 0.6205834, 0, 0, 0, 1, 1,
0.8241786, -0.6973779, 3.007516, 0, 0, 0, 1, 1,
0.8316261, 0.1157052, 0.4611772, 0, 0, 0, 1, 1,
0.8325596, -1.39168, 3.614855, 0, 0, 0, 1, 1,
0.8349364, 0.1495876, 0.9502446, 1, 1, 1, 1, 1,
0.8379335, 1.079996, 0.5181629, 1, 1, 1, 1, 1,
0.8395281, -0.8100495, 2.506754, 1, 1, 1, 1, 1,
0.8454212, 0.1143488, 2.30131, 1, 1, 1, 1, 1,
0.8498512, -1.983759, 2.987188, 1, 1, 1, 1, 1,
0.850809, -1.322357, 3.114177, 1, 1, 1, 1, 1,
0.8522426, -0.05474171, 0.7243858, 1, 1, 1, 1, 1,
0.854859, -1.8611, 2.302483, 1, 1, 1, 1, 1,
0.8569924, -1.206165, 3.898658, 1, 1, 1, 1, 1,
0.8604016, -0.5146955, 1.977641, 1, 1, 1, 1, 1,
0.8606852, 0.5805005, 0.8929727, 1, 1, 1, 1, 1,
0.8629664, -1.750517, 2.996167, 1, 1, 1, 1, 1,
0.8635614, 2.869066, -1.96562, 1, 1, 1, 1, 1,
0.863619, 0.6528199, 0.7685281, 1, 1, 1, 1, 1,
0.8644748, 1.025952, 0.2909782, 1, 1, 1, 1, 1,
0.8738218, 0.9104319, 1.375536, 0, 0, 1, 1, 1,
0.8841351, -0.4857174, 2.891042, 1, 0, 0, 1, 1,
0.8916172, 0.3069578, 2.36135, 1, 0, 0, 1, 1,
0.8946617, -0.07339417, 2.509155, 1, 0, 0, 1, 1,
0.8947722, -0.4027334, 2.22381, 1, 0, 0, 1, 1,
0.8954165, -1.001817, 3.533399, 1, 0, 0, 1, 1,
0.8986315, 1.19054, 1.588781, 0, 0, 0, 1, 1,
0.8987745, 0.2189448, 0.8462296, 0, 0, 0, 1, 1,
0.9020554, -0.5552582, 1.552436, 0, 0, 0, 1, 1,
0.9020919, 0.8466411, 0.720716, 0, 0, 0, 1, 1,
0.9091735, 0.5236036, 0.9971187, 0, 0, 0, 1, 1,
0.9105253, 1.071033, -0.02029488, 0, 0, 0, 1, 1,
0.9159941, -0.5310878, 1.920192, 0, 0, 0, 1, 1,
0.9175547, -1.305939, 2.09579, 1, 1, 1, 1, 1,
0.9237182, -0.7899085, 2.281552, 1, 1, 1, 1, 1,
0.9238641, 0.9593846, 0.3950963, 1, 1, 1, 1, 1,
0.9238735, 0.7997545, -0.3223359, 1, 1, 1, 1, 1,
0.9298401, -1.144752, 2.649212, 1, 1, 1, 1, 1,
0.9417418, 0.9566571, 1.235423, 1, 1, 1, 1, 1,
0.9448299, 0.8856149, 0.8552569, 1, 1, 1, 1, 1,
0.9456919, 1.091637, 0.811632, 1, 1, 1, 1, 1,
0.9465755, 1.291701, 0.4243231, 1, 1, 1, 1, 1,
0.9497806, 0.3155495, 1.241487, 1, 1, 1, 1, 1,
0.9592282, 0.1988599, 3.003157, 1, 1, 1, 1, 1,
0.95946, -0.1569162, 0.7327936, 1, 1, 1, 1, 1,
0.9679364, 1.165453, -0.5073105, 1, 1, 1, 1, 1,
0.9755779, -1.604427, 3.00237, 1, 1, 1, 1, 1,
0.9789032, 1.061942, 1.029333, 1, 1, 1, 1, 1,
0.9834547, 0.6999311, -1.623921, 0, 0, 1, 1, 1,
0.986267, -1.223612, 1.420581, 1, 0, 0, 1, 1,
0.9916917, 0.1692688, 1.315567, 1, 0, 0, 1, 1,
0.9987723, -0.09333117, 3.187313, 1, 0, 0, 1, 1,
1.007862, -0.6598615, 1.524863, 1, 0, 0, 1, 1,
1.010471, -0.08198255, 0.1193587, 1, 0, 0, 1, 1,
1.018225, 0.7673042, -0.5219373, 0, 0, 0, 1, 1,
1.020965, -0.1195445, 0.6751161, 0, 0, 0, 1, 1,
1.025037, -0.5654379, 2.981052, 0, 0, 0, 1, 1,
1.032044, -0.09713175, 1.677941, 0, 0, 0, 1, 1,
1.034829, 0.09709461, 1.169569, 0, 0, 0, 1, 1,
1.0508, -0.4733304, 2.61465, 0, 0, 0, 1, 1,
1.057879, 0.4295609, 1.444204, 0, 0, 0, 1, 1,
1.059827, -1.24711, 3.555562, 1, 1, 1, 1, 1,
1.061625, 1.548885, -1.612207, 1, 1, 1, 1, 1,
1.062222, -0.1017985, 1.173086, 1, 1, 1, 1, 1,
1.06343, 0.4103743, 0.2883997, 1, 1, 1, 1, 1,
1.066373, -0.4520044, 2.547016, 1, 1, 1, 1, 1,
1.067943, 0.9445516, 0.5789008, 1, 1, 1, 1, 1,
1.068123, -0.4672663, 1.835936, 1, 1, 1, 1, 1,
1.074711, 0.3618903, 0.2768831, 1, 1, 1, 1, 1,
1.077345, 0.4416558, 3.138837, 1, 1, 1, 1, 1,
1.080271, -1.116901, 1.760185, 1, 1, 1, 1, 1,
1.082938, -1.397544, 2.479393, 1, 1, 1, 1, 1,
1.09859, 0.4517608, 1.807487, 1, 1, 1, 1, 1,
1.101204, 1.659733, 0.3785501, 1, 1, 1, 1, 1,
1.104182, 0.384144, -1.02375, 1, 1, 1, 1, 1,
1.105298, -0.3314958, 2.491084, 1, 1, 1, 1, 1,
1.108382, -0.2471033, 1.950834, 0, 0, 1, 1, 1,
1.120292, -0.908942, 2.268783, 1, 0, 0, 1, 1,
1.121258, -1.424876, 1.76846, 1, 0, 0, 1, 1,
1.124921, 1.469246, -0.2182206, 1, 0, 0, 1, 1,
1.129412, 0.2873133, 2.664807, 1, 0, 0, 1, 1,
1.133142, -1.187965, 3.537321, 1, 0, 0, 1, 1,
1.133605, -0.5661331, 1.629977, 0, 0, 0, 1, 1,
1.136278, 0.165022, 1.311577, 0, 0, 0, 1, 1,
1.136748, -0.4059866, 2.726324, 0, 0, 0, 1, 1,
1.153676, 1.312363, -0.5235277, 0, 0, 0, 1, 1,
1.154633, -0.896442, 2.837274, 0, 0, 0, 1, 1,
1.158733, -0.32055, 1.047798, 0, 0, 0, 1, 1,
1.166131, 0.3898111, 0.5535048, 0, 0, 0, 1, 1,
1.171453, 0.7830855, 0.8652726, 1, 1, 1, 1, 1,
1.173823, -1.451761, 1.644619, 1, 1, 1, 1, 1,
1.181977, -0.2623917, -0.5259861, 1, 1, 1, 1, 1,
1.184616, -1.077489, 2.480825, 1, 1, 1, 1, 1,
1.185657, 1.07839, -0.01701755, 1, 1, 1, 1, 1,
1.186999, -3.311362, 2.103967, 1, 1, 1, 1, 1,
1.191283, 0.4107985, -0.3017865, 1, 1, 1, 1, 1,
1.194742, -0.9853336, 0.8998261, 1, 1, 1, 1, 1,
1.196921, 1.334984, -0.3829139, 1, 1, 1, 1, 1,
1.200349, -0.61457, 1.213454, 1, 1, 1, 1, 1,
1.202054, 0.3316412, 0.08147945, 1, 1, 1, 1, 1,
1.209987, 0.4489445, 1.387542, 1, 1, 1, 1, 1,
1.210717, -0.1814038, 1.188112, 1, 1, 1, 1, 1,
1.214388, -0.8668916, 5.165861, 1, 1, 1, 1, 1,
1.215062, -0.1057716, 0.8365589, 1, 1, 1, 1, 1,
1.2154, -0.2326417, 2.482629, 0, 0, 1, 1, 1,
1.219963, 0.42738, 2.382848, 1, 0, 0, 1, 1,
1.221052, 0.9032529, 1.482196, 1, 0, 0, 1, 1,
1.226059, 0.4392171, 2.582061, 1, 0, 0, 1, 1,
1.231726, 1.236034, -0.2443111, 1, 0, 0, 1, 1,
1.248328, 1.143272, 1.113946, 1, 0, 0, 1, 1,
1.268512, 1.243193, 0.382836, 0, 0, 0, 1, 1,
1.281782, 0.7750374, 0.5235857, 0, 0, 0, 1, 1,
1.28507, -0.3710178, 3.487101, 0, 0, 0, 1, 1,
1.289969, -0.4000501, 1.074961, 0, 0, 0, 1, 1,
1.303631, -0.2655632, 2.094682, 0, 0, 0, 1, 1,
1.306495, 2.052016, -0.05394547, 0, 0, 0, 1, 1,
1.308681, -0.5983297, 0.574677, 0, 0, 0, 1, 1,
1.312255, -0.5366545, 3.251649, 1, 1, 1, 1, 1,
1.319317, -0.4201445, 0.7802808, 1, 1, 1, 1, 1,
1.32402, 0.2447732, 2.689884, 1, 1, 1, 1, 1,
1.33343, -0.63945, 0.989453, 1, 1, 1, 1, 1,
1.335085, 1.518774, 1.60918, 1, 1, 1, 1, 1,
1.336443, -0.2058737, 0.3354688, 1, 1, 1, 1, 1,
1.340839, -0.2409436, 2.503582, 1, 1, 1, 1, 1,
1.353696, 1.254588, 0.6247851, 1, 1, 1, 1, 1,
1.355446, 0.1398759, 1.726191, 1, 1, 1, 1, 1,
1.356809, -0.4734752, 1.528582, 1, 1, 1, 1, 1,
1.363828, -1.343966, 2.829232, 1, 1, 1, 1, 1,
1.38116, -0.3779961, 1.227902, 1, 1, 1, 1, 1,
1.397632, 3.22388, -0.1598445, 1, 1, 1, 1, 1,
1.399287, 0.4309577, 0.6200183, 1, 1, 1, 1, 1,
1.406456, 1.461057, 0.5908175, 1, 1, 1, 1, 1,
1.407402, 0.3117043, 0.7414911, 0, 0, 1, 1, 1,
1.414327, 2.633724, 0.5677646, 1, 0, 0, 1, 1,
1.418967, -1.048216, 1.429527, 1, 0, 0, 1, 1,
1.431203, 0.01066337, -0.4313433, 1, 0, 0, 1, 1,
1.445781, -0.2193433, 2.875463, 1, 0, 0, 1, 1,
1.452399, 1.279407, 2.197804, 1, 0, 0, 1, 1,
1.457142, 1.212584, 0.1412919, 0, 0, 0, 1, 1,
1.460595, -0.6513302, 2.728102, 0, 0, 0, 1, 1,
1.4624, -0.3227613, 0.9119644, 0, 0, 0, 1, 1,
1.492825, -0.1612507, 2.450786, 0, 0, 0, 1, 1,
1.518473, 0.1787532, 0.7332842, 0, 0, 0, 1, 1,
1.527158, 0.5933771, 3.395044, 0, 0, 0, 1, 1,
1.538696, -0.3366936, 1.145347, 0, 0, 0, 1, 1,
1.548609, 0.3982728, 1.472471, 1, 1, 1, 1, 1,
1.557087, -0.543312, -1.135984, 1, 1, 1, 1, 1,
1.55788, 0.06999473, 1.83781, 1, 1, 1, 1, 1,
1.561619, 0.8437859, 1.176566, 1, 1, 1, 1, 1,
1.57442, 0.4266322, 1.16352, 1, 1, 1, 1, 1,
1.582756, -0.4719544, 0.3594333, 1, 1, 1, 1, 1,
1.590788, -0.2491842, 1.429153, 1, 1, 1, 1, 1,
1.602816, 1.094428, 1.497702, 1, 1, 1, 1, 1,
1.607725, -0.1752591, 2.945711, 1, 1, 1, 1, 1,
1.613791, -0.5376897, 2.051273, 1, 1, 1, 1, 1,
1.617962, 0.1848056, 0.1847225, 1, 1, 1, 1, 1,
1.620227, -1.27804, 2.576642, 1, 1, 1, 1, 1,
1.628977, 0.09035617, 3.430226, 1, 1, 1, 1, 1,
1.631459, -0.2477829, 0.5930822, 1, 1, 1, 1, 1,
1.632891, -0.3118795, 2.305435, 1, 1, 1, 1, 1,
1.636172, -0.9882547, 2.906617, 0, 0, 1, 1, 1,
1.644497, -0.906313, 1.205899, 1, 0, 0, 1, 1,
1.65036, 1.257774, 2.159799, 1, 0, 0, 1, 1,
1.657187, 0.02241419, 3.42892, 1, 0, 0, 1, 1,
1.659183, 0.9385191, -0.2415348, 1, 0, 0, 1, 1,
1.666583, -0.8877741, 3.509524, 1, 0, 0, 1, 1,
1.678205, -0.04673283, 3.048785, 0, 0, 0, 1, 1,
1.681081, 1.024985, 1.745063, 0, 0, 0, 1, 1,
1.687667, 0.2586116, 0.1518841, 0, 0, 0, 1, 1,
1.704272, 0.08235606, -0.2180364, 0, 0, 0, 1, 1,
1.71936, 0.158689, 2.698558, 0, 0, 0, 1, 1,
1.722754, 1.541852, -0.1651631, 0, 0, 0, 1, 1,
1.72731, -1.601755, 2.736601, 0, 0, 0, 1, 1,
1.72947, -1.412721, 1.599412, 1, 1, 1, 1, 1,
1.742025, -0.5647094, 1.414785, 1, 1, 1, 1, 1,
1.759016, -0.3059066, 3.840157, 1, 1, 1, 1, 1,
1.766211, -0.5896354, 0.4965059, 1, 1, 1, 1, 1,
1.794842, 2.592535, -0.4618016, 1, 1, 1, 1, 1,
1.801029, -1.506872, 1.133957, 1, 1, 1, 1, 1,
1.802034, -0.7717817, 1.972431, 1, 1, 1, 1, 1,
1.809167, -1.5026, 3.44868, 1, 1, 1, 1, 1,
1.84807, 0.3996962, 1.967181, 1, 1, 1, 1, 1,
1.873869, 0.8731377, 0.6459856, 1, 1, 1, 1, 1,
1.878849, 2.160139, 0.5604684, 1, 1, 1, 1, 1,
1.927728, 1.057265, 2.146015, 1, 1, 1, 1, 1,
1.935326, -0.4017476, 1.16725, 1, 1, 1, 1, 1,
1.950534, -0.3208682, 1.603416, 1, 1, 1, 1, 1,
1.964519, -0.9550779, -0.4259639, 1, 1, 1, 1, 1,
1.998414, 1.062243, 2.395631, 0, 0, 1, 1, 1,
1.999739, -1.158113, 2.206892, 1, 0, 0, 1, 1,
2.051798, -0.7660661, 1.056659, 1, 0, 0, 1, 1,
2.118088, 0.4475412, 1.86113, 1, 0, 0, 1, 1,
2.128796, -0.41783, 1.061938, 1, 0, 0, 1, 1,
2.206772, -0.6021472, 1.775077, 1, 0, 0, 1, 1,
2.262391, -1.271205, 3.682438, 0, 0, 0, 1, 1,
2.273305, 2.291857, 0.7283312, 0, 0, 0, 1, 1,
2.334653, -0.3563272, 4.488866, 0, 0, 0, 1, 1,
2.341269, 1.688174, 0.6083466, 0, 0, 0, 1, 1,
2.413436, 0.7037211, 2.278654, 0, 0, 0, 1, 1,
2.416164, -0.9370595, 1.747786, 0, 0, 0, 1, 1,
2.459973, -0.07255065, -0.4241646, 0, 0, 0, 1, 1,
2.612764, 0.8276091, -1.175396, 1, 1, 1, 1, 1,
2.641119, -1.10431, 2.94583, 1, 1, 1, 1, 1,
2.852106, 0.7426806, 3.086824, 1, 1, 1, 1, 1,
2.983273, -0.5209358, 2.769515, 1, 1, 1, 1, 1,
2.985741, -0.8831561, 2.03137, 1, 1, 1, 1, 1,
3.171181, -0.2285686, -1.233074, 1, 1, 1, 1, 1,
3.508669, 0.8610912, 0.850848, 1, 1, 1, 1, 1
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
var radius = 9.524059;
var distance = 33.45285;
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
mvMatrix.translate( -0.09147263, 0.04374123, -0.0633347 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.45285);
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
